//
//  HESCFunctions.m
//  HDemo
//
//  Created by ios on 2021/8/10.
//  Copyright © 2021 Hanin. All rights reserved.
//

#import "HESCFunctions.h"
#import "HConst.h"

@implementation HESCFunctions

+ (void)testPrintSelfpage
{
    PTCommandESC *cmd = [[PTCommandESC alloc] init];
    [cmd printSelfTest];
    [[PTDispatcher share] sendData:cmd.getCommandData];
    
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

+ (void)testPrintImage
{
    UIImage *image = [UIImage imageNamed:@"DLTest"];
    if (image == nil) {
        return;
    }
    
    PTCommandESC *cmd = [[PTCommandESC alloc] init];
    
    /*
     这边给的案例是用抖动方式PTBitmapModeDithering + LZO压缩
     如果机器不支持LZO压缩的话，compress用PTBitmapCompressModeNone package选择NO
     */
    [cmd appendRasterImage:image.CGImage mode:PTBitmapModeDithering compress:PTBitmapCompressModeLZO package:YES];
    
    [self printData:cmd.getCommandData];
}

+ (void)testPrintBarcode
{
    PTCommandESC *esc = [[PTCommandESC alloc] init];
    [esc initializePrinter];
    [esc appendText:@"UPCA:" mode:ESCTextNormal];
    [esc appendBarcode:ESCBarcodeB_UPCA data:@"075678164125" justification:0 width:2 height:60 hri:2];
    [esc appendText:@"\n" mode:ESCTextNormal];
   
    [esc appendText:@"UPCE:" mode:ESCTextNormal];
    [esc appendBarcode:ESCBarcodeB_UPCE data:@"01230000045" justification:0 width:2 height:60 hri:2];
    [esc appendText:@"\n" mode:ESCTextNormal];
    
    [esc appendText:@"EAN8:" mode:ESCTextNormal];
    [esc appendBarcode:ESCBarcodeB_EAN8 data:@"04210009" justification:0 width:2 height:60 hri:2];
    [esc appendText:@"\n" mode:ESCTextNormal];
    
    [esc appendText:@"EAN13:" mode:ESCTextNormal];
    [esc appendBarcode:ESCBarcodeB_EAN13 data:@"6901028075831" justification:0 width:2 height:60 hri:2];
    [esc appendText:@"\n" mode:ESCTextNormal];
    
    [esc appendText:@"CODE39:" mode:ESCTextNormal];
    [esc appendBarcode:ESCBarcodeB_CODE39 data:@"123456789" justification:0 width:2 height:60 hri:2];
    [esc appendText:@"\n" mode:ESCTextNormal];
    
    [esc appendText:@"CODE128:" mode:ESCTextNormal];
    [esc appendBarcode:ESCBarcodeB_CODE128 data:@"{A123456789012" justification:0 width:2 height:60 hri:2];
    [esc appendText:@"\n" mode:ESCTextNormal];
    
    [esc appendText:@"QR code:" mode:ESCTextNormal];
    [esc appendQRCodeData:@"hello world" justification:0 leftMargin:10 eccLevel:48 model:49 size:5];
    [self printData:esc.getCommandData];
}

+ (void)testPageModeSample
{
    PTCommandESC *esc = [[PTCommandESC alloc] init];
    [esc initializePrinter];
    [esc setPageMode];
    [esc pageSetPrintAreaWithXPos:0 yPos:0 width:576 height:200];
    
    [esc pageSetPrintDirection:0];
    [esc setAbsolutePosition:100];
    [esc pageSetAbsoluteYPos:10];
    [esc appendQRCodeData:@"hello world" justification:0 leftMargin:30 eccLevel:48 model:49 size:5];

    [esc pageSetPrintDirection:0];
    [esc setAbsolutePosition:10];
    [esc pageSetAbsoluteYPos:10];
    [esc appendQRCodeData:@"hello world" justification:0 leftMargin:200 eccLevel:48 model:49 size:5];
    
    [esc printDataInPageMode];
    [esc positionNextLabel];
    [self printData:esc.getCommandData];
}

+ (void)testPOSBillSample
{
    PTCommandESC *esc = [[PTCommandESC alloc] init];
    [esc initializePrinter];
    [esc appendText:@"Test POS Printer First\n\n" mode:ESCTextDoubleWidth];

    NSMutableString *receiptText = [NSMutableString string];
    [receiptText appendString:@"TP801----------------$900.00\n"];
    [receiptText appendString:@"TP808----------------$900.00\n"];
    [receiptText appendString:@"TP809----------------$900.00\n"];
    [receiptText appendString:@"TP805----------------$900.00\n"];
    [receiptText appendString:@"TP806----------------$900.00\n"];
    [receiptText appendString:@"TP802----------------$900.00\n"];
    [esc appendText:receiptText mode:ESCTextNormal];
    [esc appendBarcode:ESCBarcodeB_UPCA data:@"075678164125" justification:0 width:2 height:30 hri:2];
    //cut
    [esc setFullCutWithDistance:100];
    
    [esc appendText:@"\n\n"];
    [esc appendText:@"Test POS Printer Second\n\n" mode:ESCTextDoubleWidth];
    
    NSMutableString *copyright = [NSMutableString string];
    [copyright appendString:@"Apple----------------$900.00\n"];
    [copyright appendString:@"Apricot----------------$900.00\n"];
    [copyright appendString:@"Avocado----------------$900.00\n"];
    [copyright appendString:@"Banana----------------$900.00\n"];
    [copyright appendString:@"Cherry----------------$900.00\n"];
    [copyright appendString:@"Coconut----------------$900.00\n"];
    [esc appendText:copyright mode:ESCTextNormal];
    //cut
    [esc setFullCutWithDistance:100];
    
    //open cashdrawer 弹出钱箱
    [esc kickCashdrawer:0];
    [self printData:esc.getCommandData];
}

+ (void)testPOSImageSample
{
    UIImage *image = [UIImage imageNamed:@"DLTest"];
    if (image == nil) {
        return;
    }
    
    PTCommandESC *cmd = [[PTCommandESC alloc] init];
    
    /*
     这边给的案例是用抖动方式PTBitmapModeDithering + LZO压缩
     如果机器不支持LZO压缩的话，compress用PTBitmapCompressModeNone package选择NO
     */
    [cmd appendRasterImage:image.CGImage mode:PTBitmapModeDithering compress:PTBitmapCompressModeLZO package:YES];
    
    //如果打印机开启了黑标侦测和黑标自动定位后切刀功能，那么加上这条自动定位再切刀就有效果
    //自动定位
    [cmd setPrinterAutomaticPosition];
    //全切
    [cmd setFullCut];
//        [cmd setPartialCut]
    [self printData:cmd.getCommandData];
}

+ (void)printData:(NSData *)data
{
    [SVProgressHUD show];
    [[PTDispatcher share] sendData:data];
    /// 这个只是数据发送成功 不是打印成功
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
