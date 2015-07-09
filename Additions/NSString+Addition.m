//
//  NSString+Addition.m
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/26.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import "NSString+Addition.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+Addition.h"

@implementation NSString (Addition)

/**
 *  NSStringmd5加密
 *
 *  @return NSString
 */
-(NSString *)md5
{
    return [NSString md5:self];
}

/**
 *  md5Hash -- 实例化方法
 *
 *  @return NSString
 */
-(NSString *)md5Hash
{
    return [NSString md5Hash:self];
}

/**
 *  过滤非法字符
 *
 *  @param target 过滤关键字 []{}（#%-*+=_）\\|~(＜＞$%^&*)_+
 *
 *  @return 过滤后的字符串
 */
-(NSString *)filter:(NSString *)target
{
    return [NSString filterString:self target:target];
}

/**
 *  判断邮箱是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)emailIsLegal
{
    return [NSString emailIsLegal:self];
}

/**
 *  判断手机号是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)mobileIsLegal
{
    return [NSString mobileIsLegal:self];
}

/**
 *  判断身份证号是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)idCardIsLegal
{
    return [NSString idCardIsLegal:self];
}

/**
 *  NSStringmd5加密
 *
 *  @return NSString
 */
+(NSString *)md5:(NSString *)md5String
{
    const char *cStr = [md5String UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/**
 *  md5Hash
 *
 *  @return NSString
 */
+(NSString *)md5Hash:(NSString *)md5HashString
{
    return [[md5HashString dataUsingEncoding:NSUTF8StringEncoding] md5Hash];
}

/**
 *  过滤非法字符
 *
 *  @param string 原字符串
 *  @param target 过滤关键字 []{}（#%-*+=_）\\|~(＜＞$%^&*)_+
 *
 *  @return 过滤后的字符串
 */
+(NSString *)filterString:(NSString *)string target:(NSString *)target
{
    NSString *tempString = string;
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:target];
    tempString = [[tempString componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString:@""];
    return tempString;
}

/**
 *  判断邮箱是否合法
 *
 *  @param email 邮箱
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)emailIsLegal:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/**
 *  判断手机号是否合法
 *
 *  @param mobile 手机号
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)mobileIsLegal:(NSString *)mobile
{
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

/**
 *  判断身份证号是否合法
 *
 *  @param idCard 身份证号
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)idCardIsLegal:(NSString *)idCard
{
    if (idCard.length <= 0)
    {
        return NO;
    }
    else
    {
        NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
        NSPredicate *idCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
        return [idCardPredicate evaluateWithObject:idCard];
    }
}

/**
 *  判断字符串是否为纯数字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示为纯字符串，NO表示为非纯字符串
 */
+(BOOL)isPureNumandCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

/**
 *  判断是否包含汉字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示包含汉字，NO表示不包含汉字
 */
+(BOOL)isContainChinese:(NSString *)string
{
    BOOL isContainChinese = NO;
    for (int i = 0; i<string.length; i++)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *tpString = [string substringWithRange:range];
        const char *cString=[tpString UTF8String];
        if (strlen(cString)==3)
        {
            isContainChinese = YES;
            break;
        }
    }
    return isContainChinese;
}

@end
