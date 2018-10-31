//
//  UIImage+Addition.h
//  MyAddition
//
//  Created by 蔡成汉 on 15/7/16.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)

#pragma mark - 图片模糊处理

/**
 图片模糊处理

 @param image 目标图片
 @param size 裁剪尺寸 - 尺寸越大效率越低
 @param complete 完成回调
 */
+ (void)fuzzyImage:(UIImage *)image size:(CGSize)size complete:(void(^)(UIImage *fuzzyImage))complete;

/**
 图片模糊处理

 @param image 目标图片
 @param size 裁剪尺寸 - 尺寸越大效率越低
 @param alpha 透明度：0~1，0为白，1为深灰色
 @param radius 半径：默认为30，推荐为3 半径越大越模糊，半径越小月清楚
 @param colorSaturationFactor 色彩饱和度(浓度)因子：0是黑白灰, 9是浓彩色, 1是原色  默认1.8
 “彩度”，英文是称Saturation，即饱和度。将无彩色的黑白灰定为0，最鲜艳定为9s，这样大致分成十阶段，让数值和人的感官直觉一致。
 @param complete 完成回调
 */
+ (void)fuzzyImage:(UIImage *)image size:(CGSize)size lightAlpha:(CGFloat)alpha radius:(CGFloat)radius colorSaturationFactor:(CGFloat)colorSaturationFactor complete:(void(^)(UIImage *fuzzyImage))complete;


#pragma mark - 图片压缩

/**
 图片压缩 -- 默认压缩为150kb

 @param image 目标图片
 @return 压缩之后的图片数据
 */
+ (NSData *)compressMyImage:(UIImage *)image;

/**
 图片压缩

 @param image 目标图片
 @param size 压缩的大小 -- 以kb为单位
 @return 压缩之后的图片数据
 */
+ (NSData *)compressMyImage:(UIImage *)image size:(int)size;

/**
 图片缩放

 @param image 目标图片
 @param width 缩放之后的图片宽度
 @return 缩放之后的图片
 */
+ (UIImage *)scaleMyImage:(UIImage *)image width:(CGFloat)width;

/**
 图片缩放

 @param image 目标图片
 @param size 缩放尺寸
 @return 缩放之后的图片
 */
+(UIImage *)scaleMyImage:(UIImage *)image size:(CGSize)size;

#pragma mark - 视图转图片

/**
 视图转图片

 @param view 目标视图
 @return 图片
 */
+ (UIImage *)imageFromView:(UIView *)view;

/**
 图片裁剪

 @param image 目标图片
 @param rect 裁剪区域
 @return 裁剪后的图片
 */
+ (UIImage *)cutImageWithSize:(UIImage *)image rect:(CGRect)rect;

#pragma mark - 合成图片，根据颜色值

/**
 合成图片，根据颜色值

 @param color 颜色值
 @return 合成的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 图片裁剪圆角

 @param image 原始图片
 @param size 裁剪尺寸
 @param corners 圆角：UIRectCornerTopLeft、UIRectCornerTopRight等
 @param cornerRadius 角度
 @param complete 完成
 */
+ (void)cornerImage:(UIImage *)image size:(CGSize)size roundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius complete:(void(^)(UIImage *cornerImage))complete;

@end
