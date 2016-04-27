//
//  NSDictionary+Addition.m
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/31.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import "NSDictionary+Addition.h"

@implementation NSDictionary (Addition)

- (id)safeObjectForKey:(id)aKey hintClass:(id)cls
{
    id obj = [self objectForKey:aKey];
    if (cls && [obj isKindOfClass:cls])
    {
        return obj;
    }
    return nil;
}

/**
 *  从字典中获取bool值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(BOOL)getBoolValueForKey:(NSString *)key
{
    return [self getBoolValueForKey:key defaultValue:NO];
}

/**
 *  从字典中获取bool值
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(BOOL)getBoolValueForKey:(NSString *)key defaultValue:(BOOL)defaultValue
{
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null])
    {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]])
    {
        return [tmpValue boolValue];
    }
    else
    {
        @try {
            return [tmpValue boolValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 *  从字典中获取int值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(int)getIntValueForKey:(NSString *)key
{
    return [self getIntValueForKey:key defaultValue:0];
}

/**
 *  从字典中获取int值
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(int)getIntValueForKey:(NSString *)key defaultValue:(int)defaultValue
{
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null])
    {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]])
    {
        return [tmpValue intValue];
    }
    else
    {
        @try {
            return [tmpValue intValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 *  从字典中获取NSInteger值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(NSInteger)getIntegerValueForKey:(NSString *)key
{
    return [self getIntegerValueForKey:key defaultValue:0];
}

/**
 *  从字典中获取NSInteger值
 *
 *  @param key key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(NSInteger)getIntegerValueForKey:(NSString *)key defaultValue:(NSInteger)defaultValue
{
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null])
    {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]])
    {
        return [tmpValue integerValue];
    }
    else
    {
        @try {
            return [tmpValue integerValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 *  从字典中获取float值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(float)getFloatValueForKey:(NSString *)key
{
    return [self getFloatValueForKey:key defaultValue:0.0];
}

/**
 *  从字典中获取float值
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(float)getFloatValueForKey:(NSString *)key defaultValue:(float)defaultValue
{
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null])
    {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]])
    {
        return [tmpValue floatValue];
    }
    else
    {
        @try {
            return [tmpValue floatValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 *  从字典中获取long long值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(long long)getLongLongValueForKey:(NSString *)key
{
    return [self getLongLongValueForKey:key defaultValue:0.0];
}

/**
 *  从字典中获取long long值
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(long long)getLongLongValueForKey:(NSString *)key defaultValue:(long long)defaultValue
{
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null])
    {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]])
    {
        return [tmpValue longLongValue];
    }
    else
    {
        @try {
            return [tmpValue longLongValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 *  从字典中获取string值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(NSString *)getStringValueForKey:(NSString *)key
{
    return [self getStringValueForKey:key defaultValue:@""];
}

/**
 *  从字典中获取string值
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(NSString *)getStringValueForKey:(NSString *)key defaultValue:(NSString *)defaultValue
{
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null])
    {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSString class]])
    {
        return [NSString stringWithFormat:@"%@",tmpValue];
    }
    else
    {
        @try {
            return [NSString stringWithFormat:@"%@",tmpValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 *  从字典中获取数组
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(NSArray *)getArrayValueForKey:(NSString *)key
{
    return [self getArrayValueForKey:key defaultValue:[NSArray array]];
}

/**
 *  从字典中获取数组
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(NSArray *)getArrayValueForKey:(NSString *)key defaultValue:(NSArray *)defaultValue
{
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null])
    {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSArray class]])
    {
        return tmpValue;
    }
    else
    {
        return defaultValue;
    }
}

/**
 *  从字典中获取字典
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(NSDictionary *)getDictionaryValueForKey:(NSString *)key
{
    return [self getDictionaryValueForKey:key defaultValue:[NSDictionary dictionary]];
}

/**
 *  从字典中获取字典
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(NSDictionary *)getDictionaryValueForKey:(NSString *)key defaultValue:(NSDictionary *)defaultValue
{
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null])
    {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSDictionary class]])
    {
        return tmpValue;
    }
    else
    {
        return defaultValue;
    }
}

/**
 *  从字典中获取number
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(NSNumber *)getNumberValueForKey:(NSString *)key
{
    return [self getNumberValueForKey:key defaultValue:[NSNumber numberWithInt:0]];
}

/**
 *  从字典中获取number
 *
 *  @param key    key
 *  @param number 默认值
 *
 *  @return 返回val
 */
-(NSNumber *)getNumberValueForKey:(NSString *)key defaultValue:(NSNumber *)defaultValue
{
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null])
    {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]])
    {
        return tmpValue;
    }
    else
    {
        return defaultValue;
    }
}

@end
