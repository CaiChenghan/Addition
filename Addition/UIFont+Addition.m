//
//  UIFont+Addition.m
//  Addition_Example
//
//  Created by 蔡成汉 on 2018/9/3.
//  Copyright © 2018年 蔡成汉. All rights reserved.
//

#import "UIFont+Addition.h"

@implementation UIFont (Addition)

/**
 font of size
 
 @param fontSize fontSize
 @param weight weight
 @return font
 */
+ (UIFont *)fontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight {
    if (@available(iOS 8.2, *)) {
        if ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)]) {
            return [UIFont systemFontOfSize:fontSize weight:weight];
        }
    }
    return [UIFont systemFontOfSize:fontSize];
}

@end
