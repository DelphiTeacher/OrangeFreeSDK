//
//  HTSPLFunctions.m
//  HDemo
//
//  Created by ios on 2020/9/28.
//  Copyright © 2020 Hanin. All rights reserved.
//

#import "HTSPLFunctions.h"
#import "HConst.h"

@implementation HTSPLFunctions

+ (void)testPrinterStatus
{
    PTCommandTSPL *cmd = [[PTCommandTSPL alloc] init];
    [cmd setCLS];
    [cmd getPrinterStatus];
    [[PTDispatcher share] sendData:cmd.cmdData];
        [[PTDispatcher share] whenReceiveData:^(NSData *data) {
            if ([data length] == 1) {
                uint8_t *buffer = (uint8_t *)[data bytes];
                NSMutableArray <NSString *> *stateArrs = [[NSMutableArray alloc] init];
                
                if ((buffer[0] & 0x01) != 0) {
                    [stateArrs addObject:@"Open".localized];
                }
                if((buffer[0] & 0x02) != 0) {
                   [stateArrs addObject:@"Paper jam".localized];
                }
                if((buffer[0] & 0x04) != 0) {
                    [stateArrs addObject:@"Out of paper".localized];
                }
                if((buffer[0] & 0x10) != 0) {
                    [stateArrs addObject:@"Pause".localized];
                }
                if((buffer[0] & 0x20) != 0) {
                    [stateArrs addObject:@"Printing".localized];
                }
                /// 和前面的重复 写一个就行
//                if((buffer[0] & 0x40) != 0) {
//                    [stateArrs addObject:@"开盖"];
//                }
                if((buffer[0] & 0x80) != 0) {
                    [stateArrs addObject:@"High".localized];
                }
                if (stateArrs.count > 0) {
                    [SVProgressHUD showErrorWithStatus:[stateArrs componentsJoinedByString:@"-"]];
                }else {
                    [SVProgressHUD showSuccessWithStatus:@"Ready".localized];
                }
            }
        }];
        
        /// 实现不处理
        [[PTDispatcher share] whenSendSuccess:^(int64_t dataCount, double time) {
            
        }];
        
        /// 实现不处理
        [[PTDispatcher share] whenSendProgressUpdate:^(NSNumber *number) {
            
        }];
}

+ (void)testPrintSelfpage
{
    PTCommandTSPL *cmd = [[PTCommandTSPL alloc] init];
    
    /// 清楚缓存数据
    [cmd setCLS];
    /// 设置打印方向
    [cmd setPrintDirection:PTTSCPrintDirectionNormal mirror:PTTSCPrintStyleNormal];
    
    [cmd selfTest];
    
    [[PTDispatcher share] sendData:cmd.cmdData];
    
    /// 实现不处理
    [[PTDispatcher share] whenSendSuccess:^(int64_t dataCount, double time) {
        
    }];
    
    /// 实现不处理
    [[PTDispatcher share] whenSendProgressUpdate:^(NSNumber *number) {
        
    }];
    
    /// 实现不处理
    [[PTDispatcher share] whenReceiveData:^(NSData *data) {
        
    }];
}

/// 看下是否支持矢量字体
+ (void)testPrinterVectorText
{
    [SVProgressHUD show];
    PTCommandTSPL *cmd = [[PTCommandTSPL alloc] init];
    [cmd setCLS];
    [cmd setPrintDirection:PTTSCPrintDirectionNormal mirror:PTTSCPrintStyleNormal];
    
    /// 这边传的是mm 1mm = 8 dot
    [cmd setPrintAreaSizeWithWidth:100 height:80];
    
    NSInteger x_multiplication = 1;
    NSInteger y_multiplication = 1;
    
#warning 如果font选择PTTSCTextVectorFontStyle9的话，那么x_multiplication和y_multiplication表示的是字体的大小，其他的字体表示放大倍数
    
    NSInteger yPos = [cmd printAutoTextForVectorWithXpos:10 yPos:10 font:PTTSCTextVectorFontStyle0 rotation:PTTSCStyleRotation0 xMultiplication:x_multiplication yMultiplication:y_multiplication safeHeight:1000 width:790 lineSpacing:10 text:@"天本无情，所以不老，人为情苦，如何不老？情愁便似黄叶无风自落，飘扫之不尽，去之不绝，更堪秋风频催，断人弦肠。梦里哪知身是客，恣情贪欢，哪晓得，无限欢情，反作无穷苦因。不能追寻，偏要追寻，人情矛盾于此。往日欢乐，恰似一梦，而今才知，欢乐是苦。觉来却似未觉，午醉醒来，愁还未醒。"];
    
    /// 打印一份 每份1张
    [cmd printWithSets:1 copies:1];
    
    [[PTDispatcher share] sendData:cmd.cmdData];
    
    [[PTDispatcher share] whenSendSuccess:^(int64_t dataCount, double time) {
        [SVProgressHUD showSuccessWithStatus:@"Data sent successfully".localized];
    }];
    
    /// 实现不处理
    [[PTDispatcher share] whenSendProgressUpdate:^(NSNumber *number) {
        
    }];
    
    /// 实现不处理
    [[PTDispatcher share] whenReceiveData:^(NSData *data) {
        
    }];
    
    [[PTDispatcher share] whenSendFailure:^{
        [SVProgressHUD showErrorWithStatus:@"Data send failed".localized];
    }];
}

/// 看下是否支持点阵字体
+ (void)testPrintDotMatrixText
{
    [SVProgressHUD show];
    PTCommandTSPL *cmd = [[PTCommandTSPL alloc] init];
    [cmd setCLS];
    [cmd setPrintDirection:PTTSCPrintDirectionNormal mirror:PTTSCPrintStyleNormal];
    
    /// 这边传的是mm 1mm = 8 dot
    [cmd setPrintAreaSizeWithWidth:100 height:80];
    
    [cmd printAutoTextWithXpos:10 yPos:10 font:PTTSCTextFontStyle0 rotation:PTTSCStyleRotation0 xMultiplication:1 yMultiplication:1 safeHeight:1000 width:790 lineSpacing:10 text:@"天本无情，所以不老，人为情苦，如何不老？情愁便似黄叶无风自落，飘扫之不尽，去之不绝，更堪秋风频催，断人弦肠。梦里哪知身是客，恣情贪欢，哪晓得，无限欢情，反作无穷苦因。不能追寻，偏要追寻，人情矛盾于此。往日欢乐，恰似一梦，而今才知，欢乐是苦。觉来却似未觉，午醉醒来，愁还未醒。"];
    /// 打印一份 每份1张
    [cmd printWithSets:1 copies:1];
    
    [[PTDispatcher share] sendData:cmd.cmdData];
    
    [[PTDispatcher share] whenSendSuccess:^(int64_t dataCount, double time) {
        [SVProgressHUD showSuccessWithStatus:@"Data sent successfully".localized];
    }];
    
    /// 实现不处理
    [[PTDispatcher share] whenSendProgressUpdate:^(NSNumber *number) {
        
    }];
    
    /// 实现不处理
    [[PTDispatcher share] whenReceiveData:^(NSData *data) {
        
    }];
    
    [[PTDispatcher share] whenSendFailure:^{
        [SVProgressHUD showErrorWithStatus:@"Data send failed".localized];
    }];
}

+ (void)testPrintBarcode
{
    [SVProgressHUD show];
    PTCommandTSPL *cmd = [[PTCommandTSPL alloc] init];
    [cmd setCLS];
    [cmd setPrintDirection:PTTSCPrintDirectionNormal mirror:PTTSCPrintStyleNormal];
    
    [cmd printQRcodeWithXPos:100 yPos:100 eccLevel:PTTSCQRcodeEcclevelH cellWidth:PTTSCQRcodeWidth7 mode:PTTSCQRCodeModeManual rotation:PTTSCStyleRotation0 model:PTTSCQRCodeModelM1 mask:PTTSCQRcodeMaskS1 context:@"Hello World"];
    [cmd printBarcodeWithXPos:100 yPos:300 type:PTTSCBarcodeStyle128 height:70 readable:PTTSCBarcodeReadbleStyleHuman rotation:PTTSCStyleRotation0 ratio:PTTSCBarcodeRatio1 context:@"123456789"];
    /// 打印一份 每份1张
    [cmd printWithSets:1 copies:1];
    
    [[PTDispatcher share] sendData:cmd.cmdData];
    
    [[PTDispatcher share] whenSendSuccess:^(int64_t dataCount, double time) {
        [SVProgressHUD showSuccessWithStatus:@"Data sent successfully".localized];
    }];
    
    /// 实现不处理
    [[PTDispatcher share] whenSendProgressUpdate:^(NSNumber *number) {
        
    }];
    
    /// 实现不处理
    [[PTDispatcher share] whenReceiveData:^(NSData *data) {
        
    }];
    
    [[PTDispatcher share] whenSendFailure:^{
        [SVProgressHUD showErrorWithStatus:@"Data send failed".localized];
    }];
}

+ (void)testPrintImage
{
    UIImage *image = [UIImage imageNamed:@"DLTest"];
    if (image == nil) {
        return;
    }
    
    /// 打印区域宽高
    NSInteger areaW = (NSInteger)(image.size.width + 7) >> 3;
    NSInteger areaH = (NSInteger)(image.size.height + 7) >> 3;
    
    [SVProgressHUD show];
    PTCommandTSPL *cmd = [[PTCommandTSPL alloc] init];
    [cmd setCLS];
    [cmd setPrintDirection:PTTSCPrintDirectionNormal mirror:PTTSCPrintStyleNormal];
    
    [cmd setPrintAreaSizeWithWidth:areaW height:areaH];
    
    [cmd addBitmapWithXPos:0 yPos:0 mode:PTTSCBitmapModeORCompress image:image.CGImage bitmapMode:PTBitmapModeBinary compress:PTBitmapCompressModeLZO];
    [cmd printWithSets:1 copies:1];
    
    [[PTDispatcher share] sendData:cmd.cmdData];
    
    [[PTDispatcher share] whenSendSuccess:^(int64_t dataCount, double time) {
        [SVProgressHUD showSuccessWithStatus:@"Data sent successfully".localized];
    }];
    
    [[PTDispatcher share] whenSendProgressUpdate:^(NSNumber *number) {
        [SVProgressHUD showProgress:number.floatValue];
    }];
    
    /// 实现不处理
    [[PTDispatcher share] whenReceiveData:^(NSData *data) {
        
    }];
    
    [[PTDispatcher share] whenSendFailure:^{
        [SVProgressHUD showErrorWithStatus:@"Data send failed".localized];
    }];
}

@end
