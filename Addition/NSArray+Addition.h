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
 *  NAArray获取数据方法
 *
 *  @param index index
 *
 *  @return obj
 */
-(id)getMyObjectAtIndex:(NSUInteger)index;

/**
 *  NSArray获取数据方法
 *
 *  @param index        index
 *  @param defaultIndex defaultIndex
 *
 *  @return obj
 */
-(id)getMyObjectAtIndex:(NSUInteger)index defaultIndex:(NSUInteger)defaultIndex;

@end
