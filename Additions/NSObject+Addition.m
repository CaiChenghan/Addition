//
//  NSObject+Addition.m
//  MyWeather
//
//  Created by 蔡成汉 on 15/4/8.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import "NSObject+Addition.h"

#define DefaultKeyedArchiverPath [NSString stringWithFormat:@"%@/Documents/DefaultKeyedArchiver.data", NSHomeDirectory()]

@implementation NSObject (Addition)

/**
 *  归档
 *
 *  @param obj 需要归档的类
 *  @param key 归档key
 *
 *  @return YES表示成功，NO表示失败
 */
+(BOOL)keyedArchiver:(id)obj key:(NSString *)key
{
    return [self keyedArchiver:obj key:key path:DefaultKeyedArchiverPath];
}

/**
 *  归档
 *
 *  @param obj  需要归档的类
 *  @param key  归档key
 *  @param path 归档路劲
 *
 *  @return YES表示归档成功，NO表示归档失败
 */
+(BOOL)keyedArchiver:(id)obj key:(NSString *)key path:(NSString *)path
{
    NSMutableData *tpData = [NSMutableData data];
    NSKeyedArchiver *keyedArchiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:tpData];
    [keyedArchiver encodeObject:obj forKey:key];
    [keyedArchiver finishEncoding];
    return [tpData writeToFile:path atomically:YES];
}

/**
 *  解档
 *
 *  @param key key
 *
 *  @return 解析的结果
 */
+(id)keyedUnarchiver:(NSString *)key
{
    return [self keyedUnarchiver:key path:DefaultKeyedArchiverPath];
}

/**
 *  解档
 *
 *  @param key  解挡key
 *  @param path 解挡路径
 *
 *  @return 解析的结果
 */
+(id)keyedUnarchiver:(NSString *)key path:(NSString *)path
{
    NSMutableData *tpData = [NSMutableData dataWithContentsOfFile:path];
    NSKeyedUnarchiver *keyedUnarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:tpData];
    return [keyedUnarchiver decodeObjectForKey:key];
}

@end
