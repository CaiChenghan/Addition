//
//  NSMutableDictionary+Addition.m
//  Addition
//
//  Created by 蔡成汉 on 16/3/30.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "NSMutableDictionary+Addition.h"

@implementation NSMutableDictionary (Addition)

/**
 safe set obj for key
 
 @param obj obj
 @param key key
 */
- (void)setObj:(id)obj forKey:(NSString *)key {
    if (obj != nil && key != nil) {
        [self setValue:obj forKey:key];
    }
}


@end
