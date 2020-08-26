//
//  NSDate+Addition.h
//  Addition
//
//  Created by 蔡成汉 on 16/6/6.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Addition)

/// 获取当前时间戳 -- 以1970为起点的标准时间转时间戳:1465210806
@property (class, nonatomic, readonly) NSString *currentDate;

/// 获取当前时间 -- 2016-06-06 18:57:47
@property (class, nonatomic, readonly) NSString *currentTime;

/// 标准时间转时间戳
/// @param string 标准时间
+ (NSString *)getCurrentDate:(NSString *)string;

/// 时间戳转标准时间
/// @param string 时间戳
+ (NSString *)getCurrentTime:(NSString *)string;

/// 时间戳转标准时间
/// @param string 时间戳
/// @param dateFormat 时间格式，如“yyyy-MM-dd HH:mm:ss”
+ (NSString *)getCurrentTime:(NSString *)string dateFormat:(NSString *)dateFormat;

/// 获取时间间隔 -- 结束时间减去开始时间后间隔时分秒
/// @param startTime 开始时间戳 -- 以1970为基点
/// @param endTime 结束时间戳 -- 以1790为基点
/// @param complete 获取结果
+ (void)getSepTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime complete:(void(^)(NSString *sepTime , NSString *hour, NSString *minute, NSString *second))complete;

/// 获取时间间隔 -- 结束时间减去开始时间后间隔天时分秒；当不满1天的时候，则显示时分秒。
/// @param maxDay 最大间隔天数 -- 例如2天，则间隔超过48小时的，则显示天（2天），否则显示小时（47）；maxDay默认为2；当maxDay为0时，则时间间隔全部转换为时分秒，并不保留天！！！相当于getSepTime方法。
/// @param startTime 开始时间戳 -- 以1970为基点
/// @param endTime 结束时间戳 -- 以1790为基点
/// @param complete 获取结果
+ (void)getSepTimeWithDay:(NSInteger)maxDay startTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime complete:(void(^)(NSString *sepTime, NSString *day, NSString *hour, NSString *minute, NSString *second))complete;

@end
