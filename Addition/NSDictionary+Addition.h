//
//  NSDictionary+Addition.h
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/31.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Addition)

- (id)safeObjectForKey:(id)aKey hintClass:(id)cls;

/**
 *  从字典中获取bool值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(BOOL)getBoolValueForKey:(NSString *)key;

/**
 *  从字典中获取int值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(int)getIntValueForKey:(NSString *)key;

/**
 *  从字典中获取NSInteger值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(NSInteger)getIntegerValueForKey:(NSString *)key;

/**
 *  从字典中获取float值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(float)getFloatValueForKey:(NSString *)key;

/**
 *  从字典中获取long long值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(long long)getLongLongValueForKey:(NSString *)key;

/**
 *  从字典中获取string值
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(NSString *)getStringValueForKey:(NSString *)key;

/**
 *  从字典中获取数组
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(NSArray *)getArrayValueForKey:(NSString *)key;

/**
 *  从字典中获取字典
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(NSDictionary *)getDictionaryValueForKey:(NSString *)key;

/**
 *  从字典中获取number
 *
 *  @param key key
 *
 *  @return 返回val
 */
-(NSNumber *)getNumberValueForKey:(NSString *)key;



/**
 *  从字典中获取bool值
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(BOOL)getBoolValueForKey:(NSString *)key defaultValue:(BOOL)defaultValue;

/**
 *  从字典中获取int值
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(int)getIntValueForKey:(NSString *)key defaultValue:(int)defaultValue;

/**
 *  从字典中获取NSInteger值
 *
 *  @param key key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(NSInteger)getIntegerValueForKey:(NSString *)key defaultValue:(NSInteger)defaultValue;

/**
 *  从字典中获取float值
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(float)getFloatValueForKey:(NSString *)key defaultValue:(float)defaultValue;

/**
 *  从字典中获取long long值
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(long long)getLongLongValueForKey:(NSString *)key defaultValue:(long long)defaultValue;


/**
 *  从字典中获取string值
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(NSString *)getStringValueForKey:(NSString *)key defaultValue:(NSString *)defaultValue;

/**
 *  从字典中获取数组
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(NSArray *)getArrayValueForKey:(NSString *)key defaultValue:(NSArray *)defaultValue;

/**
 *  从字典中获取字典
 *
 *  @param key          key
 *  @param defaultValue 默认值
 *
 *  @return 返回val
 */
-(NSDictionary *)getDictionaryValueForKey:(NSString *)key defaultValue:(NSDictionary *)defaultValue;

/**
 *  从字典中获取number
 *
 *  @param key    key
 *  @param number 默认值
 *
 *  @return 返回val
 */
-(NSNumber *)getNumberValueForKey:(NSString *)key defaultValue:(NSNumber *)defaultValue;

@end
