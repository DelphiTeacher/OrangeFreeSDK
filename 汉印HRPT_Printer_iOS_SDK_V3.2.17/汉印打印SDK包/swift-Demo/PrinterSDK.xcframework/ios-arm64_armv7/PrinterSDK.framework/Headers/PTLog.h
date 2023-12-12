//
//  PTLog.h
//  PrinterSDK
//
//  Created by ios on 2021/11/13.
//  Copyright © 2021 Mellow. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define PTLOG(text) [[PTLog shareInstance] writeFile:text];

@interface PTLog : NSObject

/**
 *  \~chinese
 *
 *  默认false,不写入数据  要写入日志，先将设置为true
 *
 *  \~english
 *
 *  The default is false, no data is written. To write to the log, first set it to true
 *
 */
@property (nonatomic, assign) BOOL isWrite;

+ (PTLog *)shareInstance;

/**
 *  \~chinese
 *
 *  写入Log日志,文件在沙盒Docuemnts/pt_log
 *
 *  @param file 日志
 *
 *  \~english
 *
 *  Write to Log, Docuemnts/pt_log
 *
 *  @param file log
 *
 */
- (void)writeFile:(NSString *)file;

///< \~chinese 读取日志文件 \~english Read log file
- (NSString *)readFile;

///< \~chinese 删除日志文件，如果返回false，一般是文件已经不存在 \~english Delete log file
- (BOOL)removeFile;

@end

NS_ASSUME_NONNULL_END
