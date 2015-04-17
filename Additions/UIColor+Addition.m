//
//  UIColor+Addition.m
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/26.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import "UIColor+Addition.h"

@implementation UIColor (Addition)

/**
 *  RGB颜色值获取颜色
 *
 *  @param red   red
 *  @param green green
 *  @param blue  blue
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
+(UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

/**
 *  RGB颜色值获取颜色 - 十六进制颜色取值
 *
 *  @param string 十六进制颜色值
 *
 *  @return UIColor
 */
+(UIColor *)colorWithHexString:(NSString *)string
{
    return [self colorWithHexString:string alpha:1.0];
}

/**
 *  RGB颜色值获取颜色 - 十六进制颜色取值
 *
 *  @param string 十六进制颜色值
 *  @param alpha  透明度
 *
 *  @return UIColor
 */
+(UIColor *)colorWithHexString:(NSString *)string alpha:(CGFloat)alpha
{
    unsigned rgbValue = 0;
    string = [string stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    [scanner scanHexInt:&rgbValue];
    return [self colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:(rgbValue & 0xFF) A:alpha];
}

@end
