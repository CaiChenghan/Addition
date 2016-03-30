//
//  NSMutableDictionary+Addition.m
//  Addition
//
//  Created by 蔡成汉 on 16/3/30.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "NSMutableDictionary+Addition.h"

@implementation NSMutableDictionary (Addition)

/**
 *  set obj for key
 *
 *  @param anObject obj
 *  @param aKey     key
 */
-(void)setMyObject:(id)anObject forKey:(NSString *)aKey;
{
    if (anObject != nil && aKey != nil)
    {
        [self setValue:anObject forKey:aKey];
    }
}


@end
