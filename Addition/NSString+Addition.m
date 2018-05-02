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
 md5
 
 @return md5 string
 */
- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/**
 md5Hash
 
 @return md5Hash string
 */
- (NSString *)md5Hash {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5Hash];
}

/**
 字符串过滤
 
 @param target 目标字符串，例如[]{}（#%-*+=_）\\|~(＜＞$%^&*)_+
 @return 过滤后的字符串
 */
- (NSString *)filter:(NSString *)target {
    NSString *tmpStr = [self copy];
    if (tmpStr) {
        NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:target];
        tmpStr = [[tmpStr componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString:@""];
    }
    return tmpStr;
}

/**
 过滤左右空格
 
 @return 过滤后的字符串
 */
- (NSString *)filterBothBlank {
    NSString *tmpStr = [self copy];
    if (tmpStr) {
        tmpStr = [tmpStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    return tmpStr;
}

/**
 判断邮箱是否合法
 
 @return YES表示合法，NO表示不合法
 */
- (BOOL)emailIsLegal {
    BOOL emailIsLegal = NO;
    NSString *tmpStr = [self copy];
    if (tmpStr) {
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        emailIsLegal = [emailTest evaluateWithObject:tmpStr];
    }
    return emailIsLegal;
}

/**
 判断手机号是否合法
 
 @return YES表示合法，NO表示不合法
 */
- (BOOL)mobileIsLegal {
    BOOL mobileIsLegal = NO;
    NSString *tmpStr = [self copy];
    if (tmpStr) {
        NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
        NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
        mobileIsLegal = [phoneTest evaluateWithObject:tmpStr];
    }
    return mobileIsLegal;
}

/**
 判断身份证是否合法
 
 @return YES表示合法，NO表示不合法
 */
- (BOOL)idCardIsLegal {
    BOOL idCardIsLegal = NO;
    NSString *tmpStr = [self copy];
    if (tmpStr) {
        NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
        NSPredicate *idCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
        idCardIsLegal = [idCardPredicate evaluateWithObject:tmpStr];
    }
    return idCardIsLegal;
}

/**
 判断字符串是否为纯数字
 
 @return YES表示为纯字符串，NO表示为非纯字符串
 */
- (BOOL)isPureNumandCharacters {
    BOOL isPureNumandCharacters = NO;
    NSString *tmpStr = [self copy];
    if (tmpStr) {
        tmpStr = [tmpStr stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
        if (tmpStr.length == 0) {
            isPureNumandCharacters = YES;
        }
    }
    return isPureNumandCharacters;
}

/**
 判断字符串是否包含汉字
 
 @return YES表示为包含汉字，NO表示为不包含汉字
 */
- (BOOL)isContainChinese {
    BOOL isContainChinese = NO;
    NSString *tmpStr = [self copy];
    if (tmpStr && tmpStr.length > 0) {
        for (int i = 0; i<tmpStr.length; i++) {
            NSRange range = NSMakeRange(i, 1);
            NSString *tpString = [tmpStr substringWithRange:range];
            const char *cString=[tpString UTF8String];
            if (strlen(cString) == 3) {
                isContainChinese = YES;
                break;
            }
        }
    }
    return isContainChinese;
}

/**
 计算文字所占区域 -- 宽度固定，高度自适应
 
 @param font 字体
 @param maxWidth 最大宽度
 @return 文字所占区域
 */
- (CGSize)getStringSize:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    return [self getStringSize:font size:CGSizeMake(maxWidth, CGFLOAT_MAX)];
}

/**
 计算文字所占区域 -- 根据目标尺寸来计算文字所占区域，当文字实际区域大于目标区域的时候，则以目标区域尺寸为文字返回尺寸；如果文字实际区域小于目标区域的时候，则以文字实际尺寸为文字返回尺寸。
 
 @param font 字体
 @param size 目标尺寸
 @return 文字所占区域
 */
- (CGSize)getStringSize:(UIFont *)font size:(CGSize)size {
    NSString *tmpStr = [self copy];
    if (tmpStr == nil || tmpStr.length == 0) {
        return CGSizeMake(size.width, 0);
    } else {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:font forKey:NSFontAttributeName];
        CGRect rect = [tmpStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        return rect.size;
    }
}

/**
 url string encode
 
 @return string
 */
- (NSString *)encodeURLString {
    NSString *tmpStr = [self copy];
    if (tmpStr) {
        NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)tmpStr, NULL, (CFStringRef)@":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`", kCFStringEncodingUTF8));
        return encodedString;
    } else {
        return tmpStr;
    }
}

/**
 url string decode
 
 @return string
 */
- (NSString *)decodeURLString {
    NSString *tmpStr = [self copy];
    if (tmpStr) {
        NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)tmpStr, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
        return decodedString;
    } else {
        return tmpStr;
    }
}

@end
