//
//  NSDate+Addition.h
//  Addition
//
//  Created by 蔡成汉 on 16/6/6.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Addition)

/**
 *  获取当前时间戳 -- 以1970为起点的标准时间转时间戳:1465210806
 *
 *  @return 当前时间戳
 */
+(NSString *)getCurrentDate;

/**
 *  获取当前时间 -- 2016-06-06 18:57:47
 *
 *  @return 当前时间
 */
+(NSString *)getCurrentTime;

/**
 *  获取当前年 -- 2016
 *
 *  @return 当前年
 */
+(NSString *)getCurrentYear;

/**
 *  获取当前月 -- 06
 *
 *  @return 当前月
 */
+(NSString *)getCurrentMonth;

/**
 *  获取当前日 -- 06
 *
 *  @return 当前日
 */
+(NSString *)getCurrentDay;

/**
 *  获取当前时 -- 18
 *
 *  @return 当前时
 */
+(NSString *)getCurrentHour;

/**
 *  获取当前分 -- 57
 *
 *  @return 当前分
 */
+(NSString *)getCurrentMinute;

/**
 *  获取当前秒 -- 47
 *
 *  @return 当前秒
 */
+(NSString *)getCurrentSecond;

/**
 *  获取当前的年月日 -- 2016-06-06
 *
 *  @return 当前年月日
 */
+(NSString *)getCurrentYearMonthDay;

/**
 *  获取当前时分秒
 *
 *  @return 18:57:47
 */
+(NSString *)getCurrentHourMinuteSecond;

/**
 *  获取时间戳 -- 标准时间2016-06-06 18:57:47 转时间戳
 *
 *  @param string 标准时间
 *
 *  @return 时间戳
 */
+(NSString *)getCurrentDate:(NSString *)string;

/**
 *  获取时间 -- 时间戳转时间
 *
 *  @param string 时间戳
 *
 *  @return 标准时间
 */
+(NSString *)getCurrentTime:(NSString *)string;

/**
 *  获取时间间隔 -- 结束时间减去开始时间后间隔时分秒
 *
 *  @param startTime 开始时间戳 -- 以1970为基点
 *  @param endTime   结束时间戳 -- 以1790为基点
 *  @param complete  获取结果
 */
+(void)getSepTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime complete:(void(^)(NSString *sepTime , NSString *hour, NSString *minute, NSString *second))complete;

@end
