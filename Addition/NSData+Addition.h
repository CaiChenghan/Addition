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
 *  md5
 *
 *  @return NSString
 */
-(NSString *)md5;

/**
 *  md5Hash
 *
 *  @return NSString
 */
-(NSString *)md5Hash;


#pragma mark - Base64加密解密

/**
 *  Base64加密
 *
 *  @param data 目标data
 *
 *  @return 加密后的字符串
 */
+(NSString *)base64Encoding:(NSData *)data;

/**
 *  Base64解密
 *
 *  @param string 目标字符串
 *
 *  @return 解密的Data
 */
+(NSData *)base64Decoding:(NSString *)string;

@end
