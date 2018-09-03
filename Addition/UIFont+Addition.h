//
//  UIFont+Addition.h
//  Addition_Example
//
//  Created by 蔡成汉 on 2018/9/3.
//  Copyright © 2018年 蔡成汉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Addition)

/**
 font of size

 @param fontSize fontSize
 @param weight weight
 @return font
 */
+ (UIFont *)fontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight;

@end
