//
//  PDHexManager.m
//  PrinterDemo
//
//  Created by ios on 2019/12/28.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

#import "PDHexManager.h"

@implementation PDHexManager

+ (NSData *)hyDataWithHexString:(NSString *)hexString
{
    NSString *pureHexString = [hexString stringByReplacingOccurrencesOfString:@" " withString:@""];
    pureHexString = [pureHexString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    Byte bytes[pureHexString.length/2];
    for(int i=0; i<pureHexString.length/2; i++)
    {
        int left  = [self intWithUnsignedChar:[pureHexString characterAtIndex:2*i]];
        int right = [self intWithUnsignedChar:[pureHexString characterAtIndex:2*i+1]];
        
        bytes[i] = left*16+right;  ///将转化后的数放入Byte数组里 //左边的数字乘16或者乘0x10
    }
    
    return [[NSData alloc] initWithBytes:bytes length:sizeof(bytes)];
}

+ (NSString *)hyHexStringWithData:(NSData *)data {
    
    NSString *hexString = [[[[NSString stringWithFormat:@"%@",data]
                             stringByReplacingOccurrencesOfString: @"<" withString: @""]
                            stringByReplacingOccurrencesOfString: @">" withString: @""]
                           stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    return hexString.uppercaseString;
}

+ (NSString *)hyConvertDataToHexStr:(NSData *)data
{
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    return string;
}

+ (int)intWithUnsignedChar:(unichar)charValue
{
    int     intValue;
    
    if      (charValue >= '0' && charValue <= '9')   intValue = charValue-48; //// 0 的Ascll - 48
    else if (charValue >= 'A' && charValue <= 'F')   intValue = charValue-55; //// A 的Ascll - 65
    else if (charValue >= 'a' && charValue <= 'f')   intValue = charValue-87; //// a 的Ascll - 97
    else    intValue = charValue-87;
    
    return intValue;
}

+ (NSData *)hyDataWithURL:(NSURL *)url fileName:(NSString *)fileName {
    
    NSData *templateData;
    if ([[fileName componentsSeparatedByString:@"."].lastObject isEqualToString:@"hex"]) {
        // hex string 数据转为NSData直接发送
        NSString *hexString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        templateData = [PDHexManager hyDataWithHexString:hexString];
    } else {
        // 字符串模板使用GB18030编码后发送
        NSString *template = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        templateData = [template dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
    }
    return templateData;
}

+ (NSString *)hyConvertHexStrToString:(NSString *)str {
    
    if (!str || [str length] == 0) {
        return nil;
    }
    char *myBuffer = (char *)malloc((int)[str length] / 2 + 1);
    bzero(myBuffer, [str length] / 2 + 1);
    for (int i = 0; i < [str length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [str substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
//    NSLog(@"------字符串=======%@",unicodeString);
    return unicodeString;
    
    
}

+ (NSString *)hyHexStringFromString:(NSString *)string {
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr = @"";
    for(int i = 0;i < [myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length] == 1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

+ (NSNumber *)hyNumberHexString:(NSString *)aHexString
{
    // 为空,直接返回.
    if (aHexString.length == 0) {
        return nil;
    }
    NSScanner * scanner = [NSScanner scannerWithString:aHexString];
    unsigned long long longlongValue;
    [scanner scanHexLongLong:&longlongValue];
    
    //将整数转换为NSNumber,存储到数组中,并返回.
    NSNumber * hexNumber = [NSNumber numberWithLongLong:longlongValue];
    
    return hexNumber;
    
}

+ (NSString *)hyMacAddressFromData:(NSData*)data {
    
    NSString *hexString = [self hyConvertDataToHexStr:data];
    NSString *normal = [self hyConvertHexStrToString:hexString];
    
    NSMutableString *macAddr = [[NSMutableString alloc] initWithFormat:@""];
    for (NSInteger i = 0; i < normal.length; i++) {
        
        char c = [normal characterAtIndex:i];
        [macAddr appendFormat:@"%c",c];
        if ((i%2 == 1) && (i != normal.length-1)) {
            [macAddr appendString:@":"];
        }
    }
    return macAddr.uppercaseString;
}

+ (NSString *)hyMacAddressToHexData:(NSData*)data
{
    NSString *hexString = [self hyConvertDataToHexStr:data];
    NSMutableString *macAddr = [[NSMutableString alloc] initWithFormat:@""];
    for (NSInteger i = 0; i < hexString.length; i++) {
        
        char c = [hexString characterAtIndex:i];
        [macAddr appendFormat:@"%c",c];
        if ((i%2 == 1) && (i != hexString.length-1)) {
            [macAddr appendString:@":"];
        }
    }
    return macAddr.uppercaseString;
}

// 16进制转NSData
+ (NSData *)hyConvertHexStrToData:(NSString *)str
{
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:20];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}



@end
