//
//  NSString+Addition.h
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/26.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)

/**
 *  NSStringmd5加密 -- 实例化方法
 *
 *  @return NSString
 */
-(NSString *)md5;

/**
 *  md5Hash -- 实例化方法
 *
 *  @return NSString
 */
-(NSString *)md5Hash;

/**
 *  过滤非法字符
 *
 *  @param target 过滤关键字 []{}（#%-*+=_）\\|~(＜＞$%^&*)_+
 *
 *  @return 过滤后的字符串
 */
-(NSString *)filter:(NSString *)target;

/**
 *  判断邮箱是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)emailIsLegal;

/**
 *  判断手机号是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)mobileIsLegal;

/**
 *  判断身份证号是否合法
 *
 *  @return YES表示合法，NO表示不合法
 */
-(BOOL)idCardIsLegal;

/**
 *  NSStringmd5加密 -- 类方法
 *
 *  @return NSString
 */
+(NSString *)md5:(NSString *)md5String;

/**
 *  md5Hash -- 类方法
 *
 *  @return NSString
 */
+(NSString *)md5Hash:(NSString *)md5HashString;

/**
 *  过滤非法字符
 *
 *  @param string 原字符串
 *  @param target 过滤关键字 []{}（#%-*+=_）\\|~(＜＞$%^&*)_+ 
 *
 *  @return 过滤后的字符串
 */
+(NSString *)filterString:(NSString *)string target:(NSString *)target;

/**
 *  判断邮箱是否合法
 *
 *  @param email 邮箱
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)emailIsLegal:(NSString *)email;

/**
 *  判断手机号是否合法
 *
 *  @param mobile 手机号
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)mobileIsLegal:(NSString *)mobile;

/**
 *  判断身份证号是否合法
 *
 *  @param idCard 身份证号
 *
 *  @return YES表示合法，NO表示不合法
 */
+(BOOL)idCardIsLegal:(NSString *)idCard;

@end
