//
//  NSString+GUID.h
//  TestInput
//
//  Created by AnYanbo on 14-6-25.
//  Copyright (c) 2014年 AnYanbo. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>

@interface NSString (MD5)

- (NSString *)md5Encrypt;

@end

@interface NSData (ND5)

- (NSString *)md5Encrypt;

@end
