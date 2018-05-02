//
//  NSMutableDictionary+Addition.h
//  Addition
//
//  Created by 蔡成汉 on 16/3/30.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Addition)

/**
 safe set obj for key

 @param obj obj
 @param key key
 */
- (void)setObj:(id)obj forKey:(NSString *)key;

@end
