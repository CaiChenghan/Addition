//
//  NSDate+Addition.m
//  Addition
//
//  Created by 蔡成汉 on 16/6/6.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "NSDate+Addition.h"

@implementation NSDate (Addition)

/**
 获取当前时间戳 -- 以1970为起点的标准时间转时间戳:1465210806
 
 @return 当前时间戳
 */
+ (NSString *)getCurrentDate {
    return [NSDate getCurrentDate:[NSDate getCurrentTime]];
}

/**
 获取当前时间 -- 2016-06-06 18:57:47
 
 @return 当前时间
 */
+ (NSString *)getCurrentTime {
    return [NSDate getCurrentTime:[NSString stringWithFormat:@"%.0f",[[NSDate date] timeIntervalSince1970]]];
}

/**
 获取当前年 -- 2016
 
 @return 当前年
 */
+ (NSString *)getCurrentYear {
    return [[NSDate getCurrentTime] substringToIndex:4];
}

/**
 获取当前月 -- 06
 
 @return 当前月
 */
+ (NSString *)getCurrentMonth {
    return [[NSDate getCurrentTime]substringWithRange:NSMakeRange(5, 2)];
}

/**
 获取当前日 -- 06
 
 @return 当前日
 */
+ (NSString *)getCurrentDay {
    return [[NSDate getCurrentTime]substringWithRange:NSMakeRange(8, 2)];
}

/**
 获取当前时 -- 18
 
 @return 当前时
 */
+ (NSString *)getCurrentHour {
    return [[NSDate getCurrentTime]substringWithRange:NSMakeRange(11, 2)];
}

/**
 获取当前分 -- 57
 
 @return 当前分
 */
+ (NSString *)getCurrentMinute {
    return [[NSDate getCurrentTime]substringWithRange:NSMakeRange(14, 2)];
}

/**
 获取当前秒 -- 47
 
 @return 当前秒
 */
+ (NSString *)getCurrentSecond {
    return [[NSDate getCurrentTime]substringWithRange:NSMakeRange(17, 2)];
}

/**
 获取当前的年月日 -- 2016-06-06
 
 @return 当前年月日
 */
+ (NSString *)getCurrentYearMonthDay {
    return [[NSDate getCurrentTime]substringWithRange:NSMakeRange(0, 10)];
}

/**
 获取当前时分秒
 
 @return 18:57:47
 */
+ (NSString *)getCurrentHourMinuteSecond {
    return [[NSDate getCurrentTime]substringWithRange:NSMakeRange(11, 8)];
}

/**
 标准时间转时间戳
 
 @param string 标准时间
 @return 时间戳
 */
+ (NSString *)getCurrentDate:(NSString *)string {
    NSDateFormatter *tpDateformatter=[[NSDateFormatter alloc]init];
    [tpDateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tpDate = [tpDateformatter dateFromString:string];
    return [NSString stringWithFormat:@"%.0f",[tpDate timeIntervalSince1970]];
}

/**
 时间戳转标准时间
 
 @param string 时间戳
 @return 标准时间
 */
+ (NSString *)getCurrentTime:(NSString *)string {
    return [NSDate getCurrentTime:string dateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

/**
 时间戳转标准时间
 
 @param string 时间戳
 @param dateFormat 时间格式，如“yyyy-MM-dd HH:mm:ss”
 @return 标准时间
 */
+ (NSString *)getCurrentTime:(NSString *)string dateFormat:(NSString *)dateFormat {
    NSDateFormatter *tpDateformatter=[[NSDateFormatter alloc]init];
    [tpDateformatter setDateFormat:(dateFormat && dateFormat.length > 0) ? dateFormat : @"yyyy-MM-dd HH:mm:ss"];
    return [tpDateformatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[string doubleValue]]];
}

/**
 获取时间间隔 -- 结束时间减去开始时间后间隔时分秒
 
 @param startTime 开始时间戳 -- 以1970为基点
 @param endTime 结束时间戳 -- 以1790为基点
 @param complete 获取结果
 */
+ (void)getSepTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime complete:(void(^)(NSString *sepTime , NSString *hour, NSString *minute, NSString *second))complete {
    [NSDate getSepTimeWithDay:0 startTime:startTime endTime:endTime complete:^(NSString *sepTime, NSString *day, NSString *hour, NSString *minute, NSString *second) {
        complete(sepTime, hour, minute, second);
    }];
}

/**
 获取时间间隔 -- 结束时间减去开始时间后间隔天时分秒；当不满1天的时候，则显示时分秒。
 
 @param maxDay 最大间隔天数 -- 例如2天，则间隔超过48小时的，则显示天（2天），否则显示小时（47）；maxDay默认为2；当maxDay为0时，则时间间隔全部转换为时分秒，并不保留天！！！相当于getSepTime方法。
 @param startTime 开始时间戳 -- 以1970为基点
 @param endTime 结束时间戳 -- 以1790为基点
 @param complete 获取结果
 */
+ (void)getSepTimeWithDay:(NSInteger)maxDay startTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime complete:(void(^)(NSString *sepTime, NSString *day, NSString *hour, NSString *minute, NSString *second))complete {
    NSString *tpDay = @"";
    NSString *tpHour = @"00";
    NSString *tpMinute = @"00";
    NSString *tpSecond = @"00";
    NSString *tpSepTime = @"00:00:00";
    NSInteger sepTimeInteger = (NSInteger)(endTime - startTime);
    
    if (sepTimeInteger > 0) {
        //如果时间间隔小于60，则直接显示
        if (sepTimeInteger < 60) {
            if (sepTimeInteger < 10) {
                tpSecond = [NSString stringWithFormat:@"0%ld",(long)sepTimeInteger];
            } else {
                tpSecond = [NSString stringWithFormat:@"%ld",(long)sepTimeInteger];
            }
        } else {
            NSInteger sepMinute = sepTimeInteger/60;
            if (sepMinute < 60) {
                //时间间隔小于60分钟
                if (sepMinute < 10) {
                    tpMinute = [NSString stringWithFormat:@"0%ld",(long)sepMinute];
                } else {
                    tpMinute = [NSString stringWithFormat:@"%ld",(long)sepMinute];
                }
                NSInteger sepSecond = sepTimeInteger - sepMinute*60;
                if (sepSecond < 10) {
                    tpSecond = [NSString stringWithFormat:@"0%ld",(long)sepSecond];
                } else {
                    tpSecond = [NSString stringWithFormat:@"%ld",(long)sepSecond];
                }
            } else {
                //时间间隔大于60分钟
                NSInteger sepHour = sepTimeInteger/60/60;
                sepMinute = (sepTimeInteger - sepHour*60*60)/60;
                NSInteger sepSecond = sepTimeInteger - sepHour*60*60 - sepMinute*60;
                //时
                if (sepHour < 10) {
                    tpHour = [NSString stringWithFormat:@"0%ld",(long)sepHour];
                } else {
                    if (sepHour >= maxDay*24) {
                        //大等于maxDay*24小时 -- 获取天
                        NSInteger sepDay = 0;
                        if (maxDay != 0) {
                            sepDay = sepHour/24;
                        }
                        if (sepDay == 0) {
                            tpDay = @"";
                        } else {
                            tpDay = [NSString stringWithFormat:@"%ld天",(long)sepDay];
                        }
                        if ((sepHour - sepDay*24) < 10) {
                            tpHour = [NSString stringWithFormat:@"0%ld",(long)(sepHour - sepDay*24)];
                        } else {
                            tpHour = [NSString stringWithFormat:@"%ld",(long)(sepHour - sepDay*24)];
                        }
                    } else {
                        //小于48小时,大于10小时
                        tpHour = [NSString stringWithFormat:@"%ld",(long)sepHour];
                    }
                }
                //分
                if (sepMinute < 10) {
                    tpMinute = [NSString stringWithFormat:@"0%ld",(long)sepMinute];
                } else {
                    tpMinute = [NSString stringWithFormat:@"%ld",(long)sepMinute];
                }
                //秒
                if (sepSecond < 10) {
                    tpSecond = [NSString stringWithFormat:@"0%ld",(long)sepSecond];
                } else {
                    tpSecond = [NSString stringWithFormat:@"%ld",(long)sepSecond];
                }
            }
        }
    }
    //判断是否有天
    if (tpDay.length > 0) {
        //有天
        tpSepTime = [NSString stringWithFormat:@"%@ %@:%@:%@",tpDay,tpHour,tpMinute,tpSecond];
        if (complete) {
            complete(tpSepTime, tpDay, tpHour, tpMinute, tpSecond);
        }
    } else {
        //无天 -- 则直接显示
        tpSepTime = [NSString stringWithFormat:@"%@:%@:%@",tpHour,tpMinute,tpSecond];
        if (complete) {
            complete(tpSepTime, tpDay, tpHour, tpMinute, tpSecond);
        }
    }
}

@end
