//
//  NSData+Addition.h
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/26.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Addition)

/**
 md5

 @return md5 string
 */
-(NSString *)md5;

/**
 md5Hash

 @return md5Hash string
 */
-(NSString *)md5Hash;

/**
 base64 encode

 @param data 目标data
 @return base64 encode string
 */
+(NSString *)base64Encoding:(NSData *)data;

/**
 base64 decode

 @param string 目标字符串
 @return base64 decode data
 */
+(NSData *)base64Decoding:(NSString *)string;

@end
