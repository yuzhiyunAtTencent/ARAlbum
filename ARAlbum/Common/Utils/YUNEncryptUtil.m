//
//  YUNEncryptUtil.m
//  ARAlbum
//
//  Created by 俞志云 on 2018/5/23.
//  Copyright © 2018年 俞志云. All rights reserved.
//

#import "YUNEncryptUtil.h"
#import <CommonCrypto/CommonDigest.h>

@implementation YUNEncryptUtil

+ (NSString *)md5String:(NSString *)srcString {
    
    const char *cStr = [srcString UTF8String];
    
    if (!cStr) {
        return @"get UTF8String error ";
    }
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    // %02X表示输出的16进制使用两个位置，如果只有一位的前面添0，比如15就输出0F
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0],
            result[1],
            result[2],
            result[3],
            result[4],
            result[5],
            result[6],
            result[7],
            result[8],
            result[9],
            result[10],
            result[11],
            result[12],
            result[13],
            result[14],
            result[15]];
}

@end
