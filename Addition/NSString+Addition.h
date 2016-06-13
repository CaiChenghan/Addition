//
//  NSString+Addition.h
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/26.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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
 *  过滤左右空格
 *
 *  @return 过滤后的字符串
 */
-(NSString *)filterBothBlank;

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
 *  判断字符串是否为纯数字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示为纯字符串，NO表示为非纯字符串
 */
-(BOOL)isPureNumandCharacters:(NSString *)string;

/**
 *  判断是否包含汉字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示包含汉字，NO表示不包含汉字
 */
-(BOOL)isContainChinese:(NSString *)string;

/**
 *  计算文字所占区域 -- 宽度固定，高度自适应
 *
 *  @param font     字体
 *  @param maxWidth 最大宽度
 *
 *  @return 返回文字所占的区域
 */
-(CGSize)getStringSize:(UIFont *)font maxWidth:(CGFloat)maxWidth;

/**
 *  计算文字所占区域 -- 根据目标尺寸来计算文字所占区域，当文字实际区域大于目标区域的时候，则以目标区域尺寸为文字返回尺寸；如果文字实际区域小于目标区域的时候，则以文字实际尺寸为文字返回尺寸。
 *
 *  @param font    字体
 *  @param size    目标尺寸
 *
 *  @return 返回文字所占的区域
 */
-(CGSize)getStringSize:(UIFont *)font size:(CGSize)size;

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
 *  过滤左右空格
 *
 *  @param string 原字符串
 *
 *  @return 过滤后的字符串
 */
+(NSString *)filterBothBlank:(NSString *)string;

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

/**
 *  判断字符串是否为纯数字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示为纯字符串，NO表示为非纯字符串
 */
+(BOOL)isPureNumandCharacters:(NSString *)string;

/**
 *  判断是否包含汉字
 *
 *  @param string 目标字符串
 *
 *  @return YES表示包含汉字，NO表示不包含汉字
 */
+(BOOL)isContainChinese:(NSString *)string;

/**
 *  计算文字所占区域 -- 宽度固定，高度自适应
 *
 *  @param font     字体
 *  @param maxWidth 最大宽度
 *  @param content  文字内容
 *
 *  @return 返回文字所占的区域
 */
+(CGSize)getStringSize:(UIFont *)font maxWidth:(CGFloat)maxWidth content:(NSString *)content;

/**
 *  计算文字所占区域 -- 根据目标尺寸来计算文字所占区域，当文字实际区域大于目标区域的时候，则以目标区域尺寸为文字返回尺寸；如果文字实际区域小于目标区域的时候，则以文字实际尺寸为文字返回尺寸。
 *
 *  @param font    字体
 *  @param size    目标尺寸
 *  @param content 文字内容
 *
 *  @return 返回文字所占的区域
 */
+(CGSize)getStringSize:(UIFont *)font size:(CGSize)size content:(NSString *)content;

/**
 *  URLString编码
 *
 *  @param string URLString
 *
 *  @return UTF8编码后的字符串
 */
+(NSString *)encodeURLString:(NSString *)string;

/**
 *  URLString编码
 *
 *  @return UTF8编码后的字符串
 */
-(NSString *)encodeURLString;

/**
 *  URLString解码
 *
 *  @param string URLString
 *
 *  @return 对UTF8解码
 */
+(NSString *)decodeURLString:(NSString *)string;

/**
 *  URLString解码
 *
 *  @return 对UTF8解码
 */
-(NSString *)decodeURLString;

@end
