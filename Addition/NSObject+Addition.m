//
//  NSObject+Addition.m
//  MyWeather
//
//  Created by 蔡成汉 on 15/4/8.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import "NSObject+Addition.h"
#import "NSString+Addition.h"

/**
 *  默认下载文件存储位置
 */
#define DefaultKeyedArchiverPath @"%@/Library/Caches/DefaultKeyedArchiverPath"

@implementation NSObject (Addition)

/**
 归档
 
 @param obj target obj
 @param key key
 @return success->YES；failure->NO
 */
+ (BOOL)keyedArchiver:(id)obj key:(NSString *)key {
    BOOL creatSavePathSuccess = [self creatSavePath];
    if (creatSavePathSuccess) {
        return [self keyedArchiver:obj key:key path:[self getKeyedArchiverPath:key]];
    } else {
        return NO;
    }
}

/**
 归档
 
 @param obj target obj
 @param key key
 @param path file save path
 @return success->YES；failure->NO
 */
+ (BOOL)keyedArchiver:(id)obj key:(NSString *)key path:(NSString *)path {
    NSMutableData *tpData = [NSMutableData data];
    NSKeyedArchiver *keyedArchiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:tpData];
    [keyedArchiver encodeObject:obj forKey:key];
    [keyedArchiver finishEncoding];
    return [tpData writeToFile:path atomically:YES];
}

/**
 解档
 
 @param key key
 @return obj
 */
+ (id)keyedUnarchiver:(NSString *)key {
    return [self keyedUnarchiver:key path:[self getKeyedArchiverPath:key]];
}

/**
 解档
 
 @param key key
 @param path file save path
 @return obj
 */
+ (id)keyedUnarchiver:(NSString *)key path:(NSString *)path {
    NSMutableData *tpData = [NSMutableData dataWithContentsOfFile:path];
    NSKeyedUnarchiver *keyedUnarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:tpData];
    return [keyedUnarchiver decodeObjectForKey:key];
}


/**
 create file save path

 @return success->YES；failure->NO
 */
+ (BOOL)creatSavePath {
    BOOL success = NO;
    NSString *pathString = [NSString stringWithFormat:DefaultKeyedArchiverPath, NSHomeDirectory()];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    BOOL dataSavePathExist = [fileManager fileExistsAtPath:pathString];
    if (dataSavePathExist == NO) {
        BOOL creatResult = [fileManager createDirectoryAtPath:pathString withIntermediateDirectories:YES attributes:nil error:nil];
        if (creatResult == YES) {
            success = YES;
        } else {
            success = NO;
        }
    } else {
        success = YES;
    }
    return success;
}

/**
 get keyedArchiver save path

 @param keyString key
 @return keyedArchiver save path
 */
+ (NSString *)getKeyedArchiverPath:(NSString *)keyString {
    NSString *path = [NSString stringWithFormat:[NSString stringWithFormat:@"%@/%@",DefaultKeyedArchiverPath,keyString.md5],NSHomeDirectory()];
    return path;
}

@end
