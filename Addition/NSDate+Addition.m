//
//  NSDate+Addition.m
//  Addition
//
//  Created by 蔡成汉 on 16/6/6.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "NSDate+Addition.h"

@implementation NSDate (Addition)

+ (NSString *)currentDate {
    return [NSDate getCurrentDate:NSDate.currentTime];
}

+ (NSString *)currentTime {
    return [NSDate getCurrentTime:[NSString stringWithFormat:@"%.0f",[[NSDate date] timeIntervalSince1970]]];
}

+ (NSString *)getCurrentDate:(NSString *)string {
    NSDateFormatter *tpDateformatter=[[NSDateFormatter alloc]init];
    [tpDateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tpDate = [tpDateformatter dateFromString:string];
    return [NSString stringWithFormat:@"%.0f",[tpDate timeIntervalSince1970]];
}

+ (NSString *)getCurrentTime:(NSString *)string {
    return [NSDate getCurrentTime:string dateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)getCurrentTime:(NSString *)string dateFormat:(NSString *)dateFormat {
    NSDateFormatter *tpDateformatter=[[NSDateFormatter alloc]init];
    [tpDateformatter setDateFormat:(dateFormat && dateFormat.length > 0) ? dateFormat : @"yyyy-MM-dd HH:mm:ss"];
    return [tpDateformatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[string doubleValue]]];
}

+ (void)getSepTime:(NSTimeInterval)startTime endTime:(NSTimeInterval)endTime complete:(void(^)(NSString *sepTime , NSString *hour, NSString *minute, NSString *second))complete {
    [NSDate getSepTimeWithDay:0 startTime:startTime endTime:endTime complete:^(NSString *sepTime, NSString *day, NSString *hour, NSString *minute, NSString *second) {
        complete(sepTime, hour, minute, second);
    }];
}

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
