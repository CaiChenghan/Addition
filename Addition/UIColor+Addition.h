//
//  UIColor+Addition.h
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/26.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

/**
 RGB颜色值获取颜色 - 三色取值

 @param red red
 @param green green
 @param blue blue
 @param alpha alpha
 @return color
 */
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;

/**
 RGB颜色值获取颜色 - 十六进制颜色取值

 @param string 十六进制颜色值
 @return color
 */
+ (UIColor *)colorWithHexString:(NSString *)string;

/**
 RGB颜色值获取颜色 - 十六进制颜色取值

 @param string 十六进制颜色值
 @param alpha alpha
 @return color
 */
+ (UIColor *)colorWithHexString:(NSString *)string alpha:(CGFloat)alpha;

/**
 获取图片主颜色

 @param image image
 @return color
 */
+ (UIColor *)colorWithImage:(UIImage *)image;

@end
