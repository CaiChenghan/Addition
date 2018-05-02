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
 RGB颜色值获取颜色 - 三色取值
 
 @param red red
 @param green green
 @param blue blue
 @param alpha alpha
 @return color
 */
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

/**
 RGB颜色值获取颜色 - 十六进制颜色取值
 
 @param string 十六进制颜色值
 @return color
 */
+ (UIColor *)colorWithHexString:(NSString *)string {
    return [self colorWithHexString:string alpha:1.0];
}

/**
 RGB颜色值获取颜色 - 十六进制颜色取值
 
 @param string 十六进制颜色值
 @param alpha alpha
 @return color
 */
+ (UIColor *)colorWithHexString:(NSString *)string alpha:(CGFloat)alpha {
    unsigned rgbValue = 0;
    string = [string stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:string];
    [scanner scanHexInt:&rgbValue];
    return [self colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:(rgbValue & 0xFF) A:alpha];
}

/**
 获取图片主颜色
 
 @param image image
 @return color
 */
+ (UIColor *)colorWithImage:(UIImage *)image {
    //方法来自http://blog.csdn.net/ki19880210/article/details/38750789
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(40, 40);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    if (data == NULL) {
        CGContextRelease(context);
        return nil;
    }
    NSArray *MaxColor = nil;
    float maxScore = 0;
    for (int x = 0; x < thumbSize.width*thumbSize.height; x++) {
        int offset = 4*x;
        int red = data[offset];
        int green = data[offset+1];
        int blue = data[offset+2];
        int alpha =  data[offset+3];
        if (alpha < 25) {
            continue;
        }
        
        float h,s,v;
        RGBtoHSV(red, green, blue, &h, &s, &v);
        
        float y = MIN(abs(red*2104 + green*4130 + blue*802 + 4096 + 131072) >> 13, 235);
        y= (y-16)/(235-16);
        if (y > 0.9) {
            continue;
        }
        
        float score = (s + 0.1)*x;
        if (score>maxScore) {
            maxScore = score;
        }
        MaxColor=@[@(red),@(green),@(blue),@(alpha)];
    }
    CGContextRelease(context);
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}

static void RGBtoHSV( float r, float g, float b, float *h, float *s, float *v ) {
    float min, max, delta;
    min = MIN( r, MIN( g, b ));
    max = MAX( r, MAX( g, b ));
    *v = max;               // v
    delta = max - min;
    if( max != 0 ) {
        *s = delta / max;       // s
    } else {
        // r = g = b = 0        // s = 0, v is undefined
        *s = 0;
        *h = -1;
        return;
    }
    if( r == max ) {
        *h = ( g - b ) / delta;     // between yellow & magenta
    } else if( g == max ) {
        *h = 2 + ( b - r ) / delta; // between cyan & yellow
    } else {
        *h = 4 + ( r - g ) / delta; // between magenta & cyan
    }
    *h *= 60;               // degrees
    if( *h < 0 ) {
        *h += 360;
    }
}

@end
