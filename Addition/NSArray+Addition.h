//
//  NSArray+Addition.h
//  Addition
//
//  Created by 蔡成汉 on 16/3/30.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Addition)

/**
 safe get object at index

 @param index index
 @return obj
 */
- (id)getObjAtIndex:(NSUInteger)index;

/**
 safe get object at index

 @param index index
 @param defaultIndex defaultIndex
 @return obj
 */
- (id)getObjAtIndex:(NSUInteger)index defaultIndex:(NSUInteger)defaultIndex;

@end
