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
 *  NAArray获取数据方法
 *
 *  @param index index
 *
 *  @return obj
 */
-(id)getMyObjectAtIndex:(NSUInteger)index
{
    /**
     *  判断取值是否越界，越界则返回nil
     */
    if (index < self.count)
    {
        /**
         *  没有越界 -- 正常取值
         */
        return [self objectAtIndex:index];
    }
    else
    {
        /**
         *  越界 -- 则返回nil
         */
        return nil;
    }
}

/**
 *  NSArray获取数据方法
 *
 *  @param index        index
 *  @param defaultIndex defaultIndex
 *
 *  @return obj
 */
-(id)getMyObjectAtIndex:(NSUInteger)index defaultIndex:(NSUInteger)defaultIndex;

{
    /**
     *  判断取值是否越界，越界则返回nil
     */
    if (index < self.count)
    {
        /**
         *  没有越界 -- 则正常取值
         */
        return [self objectAtIndex:index];
    }
    else
    {
        /**
         *  越界 -- 则取默认index值
         */
        if (defaultIndex < self.count)
        {
            return [self objectAtIndex:defaultIndex];
        }
        else
        {
            /**
             *  默认index越界
             */
            return nil;
        }
    }
}

@end
