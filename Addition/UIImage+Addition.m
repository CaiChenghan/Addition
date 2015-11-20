//
//  UIImage+Addition.m
//  MyAddition
//
//  Created by 蔡成汉 on 15/7/16.
//  Copyright (c) 2015年 JW. All rights reserved.
//

#import "UIImage+Addition.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (Addition)

/**
 *  图片模糊处理
 *
 *  @param image 目标图片
 *
 *  @return 模糊处理之后的图片
 */
+(UIImage *)fuzzyImage:(UIImage *)image
{
    return [self fuzzyImage:image lightAlpha:0.1 radius:10 colorSaturationFactor:1];
}

/**
 *  图片模糊处理
 *
 *  @param image                 目标图片
 *  @param alpha                 透明度：0~1，0为白，1为深灰色
 *  @param radius                半径：默认为30，推荐为3 半径越大越模糊，半径越小月清楚
 *  @param colorSaturationFactor 色彩饱和度(浓度)因子：0是黑白灰, 9是浓彩色, 1是原色  默认1.8
 “彩度”，英文是称Saturation，即饱和度。将无彩色的黑白灰定为0，最鲜艳定为9s，这样大致分成十阶段，让数值和人的感官直觉一致。
 *
 *  @return 模糊处理之后的图片
 */
+(UIImage *)fuzzyImage:(UIImage *)image lightAlpha:(CGFloat)alpha radius:(CGFloat)radius colorSaturationFactor:(CGFloat)colorSaturationFactor
{
    UIColor *tintColor = [UIColor colorWithWhite:1.0 alpha:alpha];
    return [self fuzzyImage:image radius:radius tintColor:tintColor saturationDeltaFactor:colorSaturationFactor maskImage:nil];
}

// 内部方法,核心代码,封装了毛玻璃效果 参数:半径,颜色,色彩饱和度
+(UIImage *)fuzzyImage:(UIImage *)image radius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage
{
    CGRect imageRect = { CGPointZero, image.size };
    UIImage *effectImage = image;
    
    BOOL hasBlur = blurRadius > __FLT_EPSILON__;
    BOOL hasSaturationChange = fabs(saturationDeltaFactor - 1.) > __FLT_EPSILON__;
    if (hasBlur || hasSaturationChange) {
        UIGraphicsBeginImageContextWithOptions(image.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectInContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(effectInContext, 1.0, -1.0);
        CGContextTranslateCTM(effectInContext, 0, -image.size.height);
        CGContextDrawImage(effectInContext, imageRect, image.CGImage);
        
        vImage_Buffer effectInBuffer;
        effectInBuffer.data     = CGBitmapContextGetData(effectInContext);
        effectInBuffer.width    = CGBitmapContextGetWidth(effectInContext);
        effectInBuffer.height   = CGBitmapContextGetHeight(effectInContext);
        effectInBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectInContext);
        
        UIGraphicsBeginImageContextWithOptions(image.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectOutContext = UIGraphicsGetCurrentContext();
        vImage_Buffer effectOutBuffer;
        effectOutBuffer.data     = CGBitmapContextGetData(effectOutContext);
        effectOutBuffer.width    = CGBitmapContextGetWidth(effectOutContext);
        effectOutBuffer.height   = CGBitmapContextGetHeight(effectOutContext);
        effectOutBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectOutContext);
        
        if (hasBlur) {
            CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
            int radius = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
            if (radius % 2 != 1) {
                radius += 1; // force radius to be odd so that the three box-blur methodology works.
            }
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
        }
        BOOL effectImageBuffersAreSwapped = NO;
        if (hasSaturationChange) {
            CGFloat s = saturationDeltaFactor;
            CGFloat floatingPointSaturationMatrix[] = {
                0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                0,                    0,                    0,  1,
            };
            const int32_t divisor = 256;
            NSUInteger matrixSize = sizeof(floatingPointSaturationMatrix)/sizeof(floatingPointSaturationMatrix[0]);
            int16_t saturationMatrix[matrixSize];
            for (NSUInteger i = 0; i < matrixSize; ++i) {
                saturationMatrix[i] = (int16_t)roundf(floatingPointSaturationMatrix[i] * divisor);
            }
            if (hasBlur) {
                vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
                effectImageBuffersAreSwapped = YES;
            }
            else {
                vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
            }
        }
        if (!effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        if (effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    // 开启上下文 用于输出图像
    UIGraphicsBeginImageContextWithOptions(image.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -image.size.height);
    
    // 开始画底图
    CGContextDrawImage(outputContext, imageRect, image.CGImage);
    
    // 开始画模糊效果
    if (hasBlur) {
        CGContextSaveGState(outputContext);
        if (maskImage) {
            CGContextClipToMask(outputContext, imageRect, maskImage.CGImage);
        }
        CGContextDrawImage(outputContext, imageRect, effectImage.CGImage);
        CGContextRestoreGState(outputContext);
    }
    
    // 添加颜色渲染
    if (tintColor) {
        CGContextSaveGState(outputContext);
        CGContextSetFillColorWithColor(outputContext, tintColor.CGColor);
        CGContextFillRect(outputContext, imageRect);
        CGContextRestoreGState(outputContext);
    }
    
    // 输出成品,并关闭上下文
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}

#pragma mark - 图片压缩

/**
 *  图片压缩 -- 默认压缩为150kb
 *
 *  @param image 目标图片
 *
 *  @return 压缩之后的图片数据
 */
+(NSData *)compressMyImage:(UIImage *)image
{
    return [self compressMyImage:image size:150];
}

/**
 *  图片压缩
 *
 *  @param image 目标图片
 *  @param size  压缩的大小 -- 以kb为单位
 *
 *  @return 压缩之后的图片数据
 */
+(NSData *)compressMyImage:(UIImage *)image size:(int)size
{
    if (image)
    {
        NSData *tpData= [self reSetMyImage:image size:size andCompressionQuality:1];
        return tpData;
    }
    else
    {
        return nil;
    }
}

#pragma mark - 采用一个方法，将图片控制在150KB以下
+(NSData *)reSetMyImage:(UIImage *)image size:(int)size andCompressionQuality:(CGFloat)quality
{
    //先检测quality的值，如果quality比0.001还要小，则直接返回数值，否则再进行压缩
    NSData *tpData= UIImageJPEGRepresentation(image, quality);
    if (quality <= 0.001)
    {
        return tpData;
    }
    else
    {
        if (tpData.length>size*1024)
        {
            CGFloat qut = 0.0;
            qut = size/(tpData.length/1024.0);
            return [self reSetMyImage:image size:size andCompressionQuality:quality*qut];
        }
        else
        {
            if (tpData == nil || tpData.length == 0)
            {
                tpData = UIImageJPEGRepresentation(image, 0.7);
            }
            return tpData;
        }
    }
}

/**
 *  图片缩放
 *
 *  @param image 目标图片
 *  @param width 缩放之后的图片宽度
 *
 *  @return 缩放之后的图片
 */
+(UIImage *)scaleMyImage:(UIImage *)image width:(CGFloat)width
{
    CGSize imageSize = image.size;
    CGSize targetSize;
    targetSize.width = width;
    targetSize.height = width/imageSize.width*imageSize.height;
    return [self scaleMyImage:image size:targetSize];
}

/**
 *  图片缩放
 *
 *  @param image 目标图片
 *  @param size  缩放尺寸
 *
 *  @return 缩放之后的图片
 */
+(UIImage *)scaleMyImage:(UIImage *)image size:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

#pragma mark - 屏幕截屏

/**
 *  屏幕截取
 *
 *  @return 截取到的图片
 */
+(UIImage *)screenShot
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width*[UIScreen mainScreen].scale, [UIScreen mainScreen].bounds.size.height*[UIScreen mainScreen].scale), YES, 0);
    
    //设置截屏大小
    [[[[UIApplication sharedApplication] keyWindow] layer] renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    CGImageRef imageRef = viewImage.CGImage;
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width*[UIScreen mainScreen].scale,[UIScreen mainScreen].bounds.size.height*[UIScreen mainScreen].scale);
    
    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    CGImageRelease(imageRefRect);
    return sendImage;
}

/**
 *  合成图片，根据颜色值
 *
 *  @param color 颜色值
 *
 *  @return 合成的图片
 */
+(UIImage *)imageWithColor:(UIColor *)color
{
    //make image opaque for speed optimization if color has alpha = 1.
    const CGFloat alpha     = CGColorGetAlpha(color.CGColor);
    const BOOL opaque       = alpha == 1;
    
    CGRect rect             = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, opaque, 0);
    CGContextRef context    = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image          = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
