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
 md5

 @return md5 string
 */
- (NSString *)md5;

/**
 md5Hash

 @return md5Hash string
 */
- (NSString *)md5Hash;

/**
 字符串过滤

 @param target 目标字符串，例如[]{}（#%-*+=_）\\|~(＜＞$%^&*)_+
 @return 过滤后的字符串
 */
- (NSString *)filter:(NSString *)target;

/**
 过滤左右空格

 @return 过滤后的字符串
 */
- (NSString *)filterBothBlank;

/**
 判断邮箱是否合法

 @return YES表示合法，NO表示不合法
 */
- (BOOL)emailIsLegal;

/**
 判断手机号是否合法

 @return YES表示合法，NO表示不合法
 */
- (BOOL)mobileIsLegal;

/**
 判断身份证是否合法

 @return YES表示合法，NO表示不合法
 */
- (BOOL)idCardIsLegal;

/**
 判断字符串是否为纯数字

 @return YES表示为纯字符串，NO表示为非纯字符串
 */
- (BOOL)isPureNumandCharacters;

/**
 判断字符串是否包含汉字

 @return YES表示为包含汉字，NO表示为不包含汉字
 */
- (BOOL)isContainChinese;

/**
 计算文字所占区域 -- 宽度固定，高度自适应

 @param font 字体
 @param maxWidth 最大宽度
 @return 文字所占区域
 */
- (CGSize)getStringSize:(UIFont *)font maxWidth:(CGFloat)maxWidth;

/**
 计算文字所占区域 -- 根据目标尺寸来计算文字所占区域，当文字实际区域大于目标区域的时候，则以目标区域尺寸为文字返回尺寸；如果文字实际区域小于目标区域的时候，则以文字实际尺寸为文字返回尺寸。

 @param font 字体
 @param size 目标尺寸
 @return 文字所占区域
 */
- (CGSize)getStringSize:(UIFont *)font size:(CGSize)size;

/**
 url string encode

 @return string
 */
- (NSString *)encodeURLString;

/**
 url string decode

 @return string
 */
- (NSString *)decodeURLString;

@end
