//
//  NSDictionary+Addition.m
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/31.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import "NSDictionary+Addition.h"

@implementation NSDictionary (Addition)

/**
 get safe value
 
 @param key key
 @param hitClass hitClass
 @return hitClass object
 */
- (id)objectForKey:(id)key hitClass:(id)hitClass {
    id obj = [self objectForKey:key];
    if (hitClass && [obj isKindOfClass:hitClass]) {
        return obj;
    } else {
        return [hitClass new];
    }
}

/**
 get bool value
 
 @param key key
 @return bool value
 */
- (BOOL)getBoolValueForKey:(NSString *)key {
    return [self getBoolValueForKey:key defaultValue:NO];
}

/**
 get bool value
 
 @param key key
 @param defaultValue defaultValue
 @return bool value
 */
- (BOOL)getBoolValueForKey:(NSString *)key defaultValue:(BOOL)defaultValue {
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        return [tmpValue boolValue];
    } else {
        @try {
            return [tmpValue boolValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 get int value
 
 @param key key
 @return int value
 */
- (int)getIntValueForKey:(NSString *)key {
    return [self getIntValueForKey:key defaultValue:0];
}

/**
 get int value
 
 @param key key
 @param defaultValue defaultValue
 @return int value
 */
- (int)getIntValueForKey:(NSString *)key defaultValue:(int)defaultValue {
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        return [tmpValue intValue];
    } else {
        @try {
            return [tmpValue intValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 get integer value
 
 @param key key
 @return integer value
 */
- (NSInteger)getIntegerValueForKey:(NSString *)key {
    return [self getIntegerValueForKey:key defaultValue:0];
}

/**
 get integer value
 
 @param key key
 @param defaultValue defaultValue
 @return integer value
 */
- (NSInteger)getIntegerValueForKey:(NSString *)key defaultValue:(NSInteger)defaultValue {
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        return [tmpValue integerValue];
    } else {
        @try {
            return [tmpValue integerValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 get float value
 
 @param key key
 @return float value
 */
- (float)getFloatValueForKey:(NSString *)key {
    return [self getFloatValueForKey:key defaultValue:0.0];
}

/**
 get float value
 
 @param key key
 @param defaultValue defaultValue
 @return float value
 */
- (float)getFloatValueForKey:(NSString *)key defaultValue:(float)defaultValue {
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        return [tmpValue floatValue];
    } else {
        @try {
            return [tmpValue floatValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 get long long value
 
 @param key key
 @return long long value
 */
- (long long)getLongLongValueForKey:(NSString *)key {
    return [self getLongLongValueForKey:key defaultValue:0.0];
}

/**
 get long long value
 
 @param key key
 @param defaultValue defaultValue
 @return long long value
 */
- (long long)getLongLongValueForKey:(NSString *)key defaultValue:(long long)defaultValue {
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        return [tmpValue longLongValue];
    } else {
        @try {
            return [tmpValue longLongValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 get string value
 
 @param key key
 @return string value
 */
- (NSString *)getStringValueForKey:(NSString *)key {
    return [self getStringValueForKey:key defaultValue:@""];
}

/**
 get string value
 
 @param key key
 @param defaultValue defaultValue
 @return string value
 */
- (NSString *)getStringValueForKey:(NSString *)key defaultValue:(NSString *)defaultValue {
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"%@",tmpValue];
    } else {
        @try {
            return [NSString stringWithFormat:@"%@",tmpValue];
        }
        @catch (NSException *exception) {
            return defaultValue;
        }
    }
}

/**
 get array value
 
 @param key key
 @return array value
 */
- (NSArray *)getArrayValueForKey:(NSString *)key {
    return [self getArrayValueForKey:key defaultValue:[NSArray array]];
}

/**
 get array value
 
 @param key key
 @param defaultValue defaultValue
 @return array value
 */
- (NSArray *)getArrayValueForKey:(NSString *)key defaultValue:(NSArray *)defaultValue {
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSArray class]]) {
        return tmpValue;
    } else {
        return defaultValue;
    }
}

/**
 get dictionary value
 
 @param key key
 @return dictionary value
 */
- (NSDictionary *)getDictionaryValueForKey:(NSString *)key {
    return [self getDictionaryValueForKey:key defaultValue:[NSDictionary dictionary]];
}

/**
 get dictionary value
 
 @param key key
 @param defaultValue defaultValue
 @return dictionary value
 */
- (NSDictionary *)getDictionaryValueForKey:(NSString *)key defaultValue:(NSDictionary *)defaultValue {
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSDictionary class]]) {
        return tmpValue;
    } else {
        return defaultValue;
    }
}

/**
 get number value
 
 @param key key
 @return number value
 */
- (NSNumber *)getNumberValueForKey:(NSString *)key {
    return [self getNumberValueForKey:key defaultValue:[NSNumber numberWithInt:0]];
}

/**
 get number value
 
 @param key key
 @param defaultValue defaultValue
 @return number val
 */
- (NSNumber *)getNumberValueForKey:(NSString *)key defaultValue:(NSNumber *)defaultValue {
    id tmpValue = [self objectForKey:key];
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        return defaultValue;
    }
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        return tmpValue;
    } else {
        return defaultValue;
    }
}

@end
