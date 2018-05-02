//
//  NSData+Addition.m
//  MyWeather
//
//  Created by 蔡成汉 on 15/3/26.
//  Copyright (c) 2015年 蔡成汉. All rights reserved.
//

#import "NSData+Addition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (Addition)

/**
 md5
 
 @return md5 string
 */
-(NSString *)md5
{
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    CC_MD5_Update(&md5, self.bytes, (CC_LONG)self.length);
    unsigned char result [CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(result, &md5);
    NSMutableString *endString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [endString appendFormat:@"%02x", result[i]];
    }
    return endString;
}

/**
 md5Hash
 
 @return md5Hash string
 */
-(NSString *)md5Hash
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], (int)[self length], result);
    
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
            ];
}

/**
 base64 encode
 
 @param data 目标data
 @return base64 encode string
 */
+(NSString *)base64Encoding:(NSData *)data
{
    NSString *resultString = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return resultString;
}

/**
 base64 decode
 
 @param string 目标字符串
 @return base64 decode data
 */
+(NSData *)base64Decoding:(NSString *)string
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return data;
}

@end
