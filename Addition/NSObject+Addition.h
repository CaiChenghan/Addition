//
//  NSObject+Addition.h
//  MyWeather
//
//  Created by 蔡成汉 on 15/4/8.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Addition)

#pragma mark - 归档解挡

/**
 归档

 @param obj target obj
 @param key key
 @return success->YES；failure->NO
 */
+ (BOOL)keyedArchiver:(id)obj key:(NSString *)key;

/**
 归档
 
 @param obj target obj
 @param key key
 @param path file save path
 @return success->YES；failure->NO
 */
+ (BOOL)keyedArchiver:(id)obj key:(NSString *)key path:(NSString *)path;

/**
 解档

 @param key key
 @return obj
 */
+ (id)keyedUnarchiver:(NSString *)key;

/**
 解档

 @param key key
 @param path file save path
 @return obj
 */
+ (id)keyedUnarchiver:(NSString *)key path:(NSString *)path;

@end
