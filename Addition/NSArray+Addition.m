//
//  NSArray+Addition.m
//  Addition
//
//  Created by 蔡成汉 on 16/3/30.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "NSArray+Addition.h"

@implementation NSArray (Addition)

/**
 safe get object at index
 
 @param index index
 @return obj
 */
- (id)getObjAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self objectAtIndex:index];
    } else {
        return nil;
    }
}

/**
 safe get object at index
 
 @param index index
 @param defaultIndex defaultIndex
 @return obj
 */
- (id)getObjAtIndex:(NSUInteger)index defaultIndex:(NSUInteger)defaultIndex {
    if (index < self.count) {
        return [self objectAtIndex:index];
    } else {
        if (defaultIndex < self.count) {
            return [self objectAtIndex:defaultIndex];
        } else {
            return nil;
        }
    }
}

@end
