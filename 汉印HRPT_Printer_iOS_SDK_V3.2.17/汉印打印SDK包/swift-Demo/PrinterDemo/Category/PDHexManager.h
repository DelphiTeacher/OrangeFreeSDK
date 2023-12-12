//
//  PDHexManager.h
//  PrinterDemo
//
//  Created by ios on 2019/12/28.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PDHexManager : NSObject

/** 普通字符串转16进制字符串  */
+ (NSString *)hyHexStringFromString:(NSString *)string;

/** 16进制字符串写成data类型  */
+ (NSData *)hyDataWithHexString:(NSString *)hexString;

/** 16进制转NSData  建议使用 */
+ (NSData *)hyConvertHexStrToData:(NSString *)str;

/** data数据转16进制字符串  方法1 */
+ (NSString *)hyHexStringWithData:(NSData *)data;
/** data数据转16进制字符串  方法2 */
+ (NSString *)hyConvertDataToHexStr:(NSData *)data;

/** 16进制字符串转普通字符串  */
+ (NSString *)hyConvertHexStrToString:(NSString *)str;

+ (NSData *)hyDataWithURL:(NSURL *)url fileName:(NSString *)fileName;

/** 16进制字符串转10进制  */
+ (NSNumber *)hyNumberHexString:(NSString *)aHexString;

/** 00:00:00:00:00:00  */
+ (NSString *)hyMacAddressFromData:(NSData*)data;

/** 00:00:00:00:00:00  */
+ (NSString *)hyMacAddressToHexData:(NSData*)data;

@end

NS_ASSUME_NONNULL_END
