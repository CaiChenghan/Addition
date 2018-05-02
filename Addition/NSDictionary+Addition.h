//
//  NSDictionary+Addition.h
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/31.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Addition)

/**
 get safe value

 @param key key
 @param hitClass hitClass
 @return hitClass object
 */
- (id)objectForKey:(id)key hitClass:(id)hitClass;

/**
 get bool value

 @param key key
 @return bool value
 */
- (BOOL)getBoolValueForKey:(NSString *)key;

/**
 get int value

 @param key key
 @return int value
 */
- (int)getIntValueForKey:(NSString *)key;

/**
 get integer value

 @param key key
 @return integer value
 */
- (NSInteger)getIntegerValueForKey:(NSString *)key;

/**
 get float value

 @param key key
 @return float value
 */
- (float)getFloatValueForKey:(NSString *)key;

/**
 get long long value

 @param key key
 @return long long value
 */
- (long long)getLongLongValueForKey:(NSString *)key;

/**
 get string value

 @param key key
 @return string value
 */
- (NSString *)getStringValueForKey:(NSString *)key;

/**
 get array value

 @param key key
 @return array value
 */
- (NSArray *)getArrayValueForKey:(NSString *)key;

/**
 get dictionary value

 @param key key
 @return dictionary value
 */
- (NSDictionary *)getDictionaryValueForKey:(NSString *)key;

/**
 get number value

 @param key key
 @return number value
 */
- (NSNumber *)getNumberValueForKey:(NSString *)key;

/**
 get bool value

 @param key key
 @param defaultValue defaultValue
 @return bool value
 */
- (BOOL)getBoolValueForKey:(NSString *)key defaultValue:(BOOL)defaultValue;

/**
 get int value

 @param key key
 @param defaultValue defaultValue
 @return int value
 */
- (int)getIntValueForKey:(NSString *)key defaultValue:(int)defaultValue;

/**
 get integer value

 @param key key
 @param defaultValue defaultValue
 @return integer value
 */
- (NSInteger)getIntegerValueForKey:(NSString *)key defaultValue:(NSInteger)defaultValue;

/**
 get float value

 @param key key
 @param defaultValue defaultValue
 @return float value
 */
- (float)getFloatValueForKey:(NSString *)key defaultValue:(float)defaultValue;

/**
 get long long value

 @param key key
 @param defaultValue defaultValue
 @return long long value
 */
- (long long)getLongLongValueForKey:(NSString *)key defaultValue:(long long)defaultValue;

/**
 get string value

 @param key key
 @param defaultValue defaultValue
 @return string value
 */
- (NSString *)getStringValueForKey:(NSString *)key defaultValue:(NSString *)defaultValue;

/**
 get array value

 @param key key
 @param defaultValue defaultValue
 @return array value
 */
- (NSArray *)getArrayValueForKey:(NSString *)key defaultValue:(NSArray *)defaultValue;

/**
 get dictionary value

 @param key key
 @param defaultValue defaultValue
 @return dictionary value
 */
- (NSDictionary *)getDictionaryValueForKey:(NSString *)key defaultValue:(NSDictionary *)defaultValue;

/**
 get number value

 @param key key
 @param defaultValue defaultValue
 @return number val
 */
- (NSNumber *)getNumberValueForKey:(NSString *)key defaultValue:(NSNumber *)defaultValue;

@end
