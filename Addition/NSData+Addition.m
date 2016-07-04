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
 *  md5
 *
 *  @return NSString
 */
-(NSString *)md5
{
    const char* original_str = (const char *)[self bytes];
    unsigned char digist[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), digist);
    NSMutableString* outPutStr = [NSMutableString stringWithCapacity:10];
    for(int  i =0; i<CC_MD5_DIGEST_LENGTH;i++)
    {
        [outPutStr appendFormat:@"%02x",digist[i]];
    }
    return [outPutStr lowercaseString];
}

/**
 *  md5Hash
 *
 *  @return NSString
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

@end
