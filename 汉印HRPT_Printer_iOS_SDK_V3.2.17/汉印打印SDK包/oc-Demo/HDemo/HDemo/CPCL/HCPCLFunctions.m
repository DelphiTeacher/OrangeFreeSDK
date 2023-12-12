//
//  HCPCLFunctions.m
//  HDemo
//
//  Created by ios on 2020/9/28.
//  Copyright © 2020 Hanin. All rights reserved.
//

#import "HCPCLFunctions.h"
#import "HConst.h"

typedef NS_OPTIONS(NSInteger, CPCLBluetoothPrinterStatus) {
    /**
     * 正常,就绪
     */
    CPCLBluetoothPrinterStatusOK             = 0,
    
    /**
     * 忙碌
     */
    CPCLBluetoothPrinterStatusPrinting    = 1 << 0,
    
    /**
     * 缺纸
     */
    CPCLBluetoothPrinterStatusNoPaper        = 1 << 1,
    
    /**
     * 开盖
     */
    CPCLBluetoothPrinterStatusCoverOpened     = 1 << 2,
    
    /**
     * 电池电量低
     */
    CPCLBluetoothPrinterStatusBatteryLow    = 1 << 3
};

@implementation HCPCLFunctions



+ (void)testPrinterStatus
{
    PTCommandCPCL *cmd = [[PTCommandCPCL alloc] init];
    [cmd cpclGetPaperStatus];
    [[PTDispatcher share] sendData:cmd.cmdData];
    [[PTDispatcher share] whenReceiveData:^(NSData *data) {
        if ([data length] == 1) {
            uint8_t *buffer = (uint8_t *)[data bytes];
//            CPCLBluetoothPrinterStatus status = CPCLBluetoothPrinterStatusOK;
            NSMutableArray <NSString *> *stateArrs = [[NSMutableArray alloc] init];
            
            if ((buffer[0] & 0x01) != 0) {
                [stateArrs addObject:@"Busy".localized];
//                status |= CPCLBluetoothPrinterStatusPrinting;
            }
            if((buffer[0] & 0x02) != 0) {
               [stateArrs addObject:@"Out of paper".localized];
//                status |= CPCLBluetoothPrinterStatusNoPaper;
            }
            if((buffer[0] & 0x04) != 0) {
                [stateArrs addObject:@"Open".localized];
//                status |= CPCLBluetoothPrinterStatusCoverOpened;
            }
            if((buffer[0] & 0x08) != 0) {
                [stateArrs addObject:@"Battery is Low".localized];
//                status |= CPCLBluetoothPrinterStatusBatteryLow;
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
    PTCommandCPCL *cmd = [[PTCommandCPCL alloc] init];
    [cmd printSelfInspectionPage];
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

+ (void)testPrinterFont
{
    [SVProgressHUD show];
    
    PTCommandCPCL *cmd = [[PTCommandCPCL alloc] init];
    /// 这条是必需要调用的，表示打印多长
    [cmd cpclLabelWithOffset:0 hRes:PTCPCLLabelResolution200 vRes:PTCPCLLabelResolution200 height:1100 quantity:1];
    /// 设置打印宽度
    [cmd cpclPageWidth:576];
    
    /// 这边打印正确的话表示能支持该字体 需要放大字体的话调用放大字体的接口
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont1 fontSize:PTCPCLTextFontSize0 x:20 y:50 text:@"保护环境24x24，world9x17"];
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont2 fontSize:PTCPCLTextFontSize0 x:20 y:150 text:@"保护环境24x24，world12x24"];
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont3 fontSize:PTCPCLTextFontSize0 x:20 y:250 text:@"保护环境20x20，world10x20"];
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont4 fontSize:PTCPCLTextFontSize0 x:20 y:350 text:@"保护环境32x32，world16x32"];
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont5 fontSize:PTCPCLTextFontSize0 x:20 y:450 text:@"保护环境24x24，world12x24"];
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont7 fontSize:PTCPCLTextFontSize0 x:20 y:550 text:@"保护环境24x24，world12x24"];
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:PTCPCLTextFontSize0 x:20 y:650 text:@"保护环境24x24，world2x24"];
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont20 fontSize:PTCPCLTextFontSize0 x:20 y:750 text:@"保护环境16x16，world8x16"];
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont55 fontSize:PTCPCLTextFontSize0 x:20 y:850 text:@"保护环境16x16，world8x16"];
    
    /// 若是标签纸，加上这条指令可以定位到缝标
    [cmd cpclForm];
    /// 打印
    [cmd cpclPrint];
    
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

+ (void)testPrintText
{

    [SVProgressHUD show];
    
    PTCommandCPCL *cmd = [[PTCommandCPCL alloc] init];
    /// 这条是必需要调用的，表示打印多长
    [cmd cpclLabelWithOffset:0 hRes:PTCPCLLabelResolution200 vRes:PTCPCLLabelResolution200 height:900 quantity:1];
    /// 设置打印宽度
    [cmd cpclPageWidth:576];
    
    /// 这个接口需要打印机支持 换行都是在打印机固件那边计算
//    [cmd cpclPrintAutoTextWithFont:PTCPCLTextLineFontStyle0 fontSize:0 x:10 y:10 lineSpace:10 width:500 text:@"天本无情，所以不老，人为情苦，如何不老？情愁便似黄叶无风自落，飘扫之不尽，去之不绝，更堪秋风频催，断人弦肠。梦里哪知身是客，恣情贪欢，哪晓得，无限欢情，反作无穷苦因。不能追寻，偏要追寻，人情矛盾于此。往日欢乐，恰似一梦，而今才知，欢乐是苦。觉来却似未觉，午醉醒来，愁还未醒。未醒之际，辗转留连，如丝之未尽，如藕之未断，却是更深的梦了。天何不老？天本无梦。"];
//
//    [cmd cpclPrintAutoTextWithFont:PTCPCLTextLineFontStyle1 fontSize:0 x:10 y:40 lineSpace:10 width:500 text:@"Apart from tears, only time could wear everything away. While feeling is being processed by time, conflicts would be reconciled as time goes by, just like a cup of tea that is being continuously diluted."];
    
    
    [cmd cpclAutoTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:0 x:10 y:10 safeHeight:900 width:500 lineSpacing:10 fontScale:PTCPCLFontScale_1 text:@"天本无情，所以不老，人为情苦，如何不老？情愁便似黄叶无风自落，飘扫之不尽，去之不绝，更堪秋风频催，断人弦肠。梦里哪知身是客，恣情贪欢，哪晓得，无限欢情，反作无穷苦因。不能追寻，偏要追寻，人情矛盾于此。往日欢乐，恰似一梦，而今才知，欢乐是苦。觉来却似未觉，午醉醒来，愁还未醒。未醒之际，辗转留连，如丝之未尽，如藕之未断，却是更深的梦了。天何不老？天本无梦。"];
    
    [cmd cpclAutoTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:0 x:10 y:400 safeHeight:900 width:500 lineSpacing:10 fontScale:PTCPCLFontScale_1 text:@"Apart from tears, only time could wear everything away. While feeling is being processed by time, conflicts would be reconciled as time goes by, just like a cup of tea that is being continuously diluted."];
    
    /// 若是标签纸，加上这条指令可以定位到缝标
    [cmd cpclForm];
    /// 打印
    [cmd cpclPrint];
    
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
    
    PTCommandCPCL *cmd = [[PTCommandCPCL alloc] init];
    /// 这条是必需要调用的，表示打印多长
    [cmd cpclLabelWithOffset:0 hRes:PTCPCLLabelResolution200 vRes:PTCPCLLabelResolution200 height:1500 quantity:1];
    /// 设置打印宽度
    [cmd cpclPageWidth:576];
    
    /// code128
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:PTCPCLTextFontSize0 x:30 y:10 text:@"CODE128"];
    [cmd cpclBarcodeTextWithFont:PTCPCLTextFont8 fontSize:0 offset:5];
    [cmd cpclBarcode:PTCPCLBarcodeStyleCode128 width:2 ratio:PTCPCLBarcodeBarRatio3 height:100 x:30 y:50 barcode:@"123456789"];
    [cmd cpclBarcodeTextOff];
    
    /// upca
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:PTCPCLTextFontSize0 x:30 y:200 text:@"UPCA"];
    [cmd cpclBarcodeTextWithFont:PTCPCLTextFont8 fontSize:0 offset:5];
    [cmd cpclBarcode:PTCPCLBarcodeStyleUPCA width:2 ratio:PTCPCLBarcodeBarRatio3 height:100 x:30 y:240 barcode:@"123456789012"];
    [cmd cpclBarcodeTextOff];
    
    /// upce
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:PTCPCLTextFontSize0 x:30 y:390 text:@"UPCE"];
    [cmd cpclBarcodeTextWithFont:PTCPCLTextFont8 fontSize:0 offset:5];
    [cmd cpclBarcode:PTCPCLBarcodeStyleUPCE width:2 ratio:PTCPCLBarcodeBarRatio3 height:100 x:30 y:430 barcode:@"0123456"];
    [cmd cpclBarcodeTextOff];
    
    /// ean8
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:PTCPCLTextFontSize0 x:30 y:580 text:@"EAN8"];
    [cmd cpclBarcodeTextWithFont:PTCPCLTextFont8 fontSize:0 offset:5];
    [cmd cpclBarcode:PTCPCLBarcodeStyleEAN8 width:2 ratio:PTCPCLBarcodeBarRatio3 height:100 x:30 y:620 barcode:@"12345670"];
    [cmd cpclBarcodeTextOff];
    
    /// code93
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:PTCPCLTextFontSize0 x:30 y:770 text:@"CODE93"];
    [cmd cpclBarcodeTextWithFont:PTCPCLTextFont8 fontSize:0 offset:5];
    [cmd cpclBarcode:PTCPCLBarcodeStyleCode93 width:2 ratio:PTCPCLBarcodeBarRatio3 height:100 x:30 y:810 barcode:@"12345"];
    [cmd cpclBarcodeTextOff];
    
    /// code39
    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:PTCPCLTextFontSize0 x:30 y:950 text:@"CODE39"];
    [cmd cpclBarcodeTextWithFont:PTCPCLTextFont8 fontSize:0 offset:5];
    [cmd cpclBarcode:PTCPCLBarcodeStyleCode39 width:2 ratio:PTCPCLBarcodeBarRatio3 height:100 x:30 y:1000 barcode:@"12345"];
    [cmd cpclBarcodeTextOff];
    
    
    [cmd cpclBarcodeQRcodeWithXPos:10 yPos:1200 model:PTCPCLQRCodeModel1 unitWidth:PTCPCLQRCodeUnitWidth_5];
    [cmd cpclBarcodeQRCodeCorrectionLecel:PTCPCLQRCodeCorrectionLevelH characterMode:PTCPCLQRCodeDataInputModeA context:@"123456789"];
    [cmd cpclBarcodeQRcodeEnd];
    
    /// 若是标签纸，加上这条指令可以定位到缝标
    [cmd cpclForm];
    /// 打印
    [cmd cpclPrint];
    
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
    
    PTCommandCPCL *cmd = [[PTCommandCPCL alloc] init];
    /// 这条是必需要调用的，表示打印多长
    [cmd cpclLabelWithOffset:0 hRes:PTCPCLLabelResolution200 vRes:PTCPCLLabelResolution200 height:image.size.height + 20 quantity:1];
    /// 设置打印宽度
    [cmd cpclPageWidth:576];
    
    /// 图片效果 有二值 、抖动(模拟灰度效果)
    /// 如果支持压缩选PTBitmapCompressModeLZO  不支持的话PTBitmapCompressModeNone
    [cmd cpclPrintBitmapWithXPos:0 yPos:0 image:image.CGImage bitmapMode:PTBitmapModeDithering compress:PTBitmapCompressModeNone isPackage:NO];
    
    [cmd cpclPrint];
    
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

+ (void)testSample
{
    [self printHanYinBarcode1:@"UT0000000000000" qrCode:@"http://weixin.qq.com/r/fCk7I1fE7AqTrRNA93xu" Code:@" " number:@"1" SenderName:@"ceshi 13111111111" SenderAddress:@"四川省 成都市都江堰市测试赛" RecipientName:@"ceshi 13122222222" RecipientAddress:@"四川省 成都市都江堰市测试赛9365" Freight:@"52.4元" Weight:@"0.20KG" Note:@"备注:" SignName:@"签收人/时间" PrintNumber:@"1" Company:@"" Cod:@"￥0" isValuation:false center:@""];
    
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


/// 客户案例
+ (void)printHanYinBarcode1:(NSString *)barcode qrCode:(NSString *)qrCode Code:(NSString *)code number:(NSString *)number SenderName:(NSString *)senderName SenderAddress:(NSString *)senderAddress RecipientName:(NSString *)recipientName RecipientAddress:(NSString *)recipientAddress Freight:(NSString *)freight Weight:(NSString *)weight Note:(NSString *)note SignName:(NSString *)signName PrintNumber:(NSString *)printNumber Company:(NSString *)company Cod:(NSString *)cod isValuation:(BOOL)isValuation center:(NSString *)center{

    NSString * serviceHotline=@"服务热线：400 820 1666";
    NSString * waterPrint;
    code = [code stringByReplacingOccurrencesOfString:@"," withString:@" "];
    if (code && ![code isEqualToString:@""] && [code componentsSeparatedByString:@" "].count > 1) {
        waterPrint = [code componentsSeparatedByString:@" "][1];
    }else{
        waterPrint = @"";
    }

    PTCommandCPCL *cmd = [PTCommandCPCL new];
    [cmd cpclTurnOnPrintStatusCallBack:true];
    int width=576;
    int height=1061;
    double size=7.46;
    int start_y_1=6;
    int start_y_2=start_y_1+14*size;
    int start_y_3=start_y_2+11*size;
    int start_y_4=start_y_3+8*size;
    int start_y_5=start_y_4+21*size;
    int start_y_6=start_y_5+16*size;
    int start_y_7=start_y_6+5*size;
    int start_y_8=start_y_7+5*size;
    int start_y_9=start_y_8+18*size;
    int start_y_10=start_y_9+18*size;
    int start_y_11=start_y_10+15*size;

    int end_x_1=10;
    int end_x_2=end_x_1+10*size;//10
    int end_x_3=end_x_2+17*size;//27
    int end_x_4=end_x_3+11*size;//38
    int end_x_5=end_x_4+6*size;//44
    int end_x_6=end_x_5+17*size;//61
    int end_x_7=end_x_6+2*size;//63
    int end_x_8=end_x_7+13*size;//76

    [cmd cpclLabelWithOffset:0 hRes:200 vRes:200 height:height quantity:1];
    [cmd cpclPageWidth:width];
    [cmd cpclSetBold:1];

    //横线
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_1 xEnd:end_x_8 yEnd:start_y_1 thickness:2];
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_2 xEnd:end_x_8 yEnd:start_y_2 thickness:2];
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_3 xEnd:end_x_8 yEnd:start_y_3 thickness:2];
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_4 xEnd:end_x_8 yEnd:start_y_4 thickness:2];
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_5 xEnd:end_x_6 yEnd:start_y_5 thickness:2];
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_6 xEnd:end_x_6 yEnd:start_y_6 thickness:2];
    [cmd cpclLineWithXPos:end_x_2 yPos:start_y_7 xEnd:end_x_6 yEnd:start_y_7 thickness:2];
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_8 xEnd:end_x_8 yEnd:start_y_8 thickness:2];
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_9 xEnd:end_x_8 yEnd:start_y_9 thickness:2];
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_10 xEnd:end_x_8 yEnd:start_y_10 thickness:2];
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_11 xEnd:end_x_8 yEnd:start_y_11 thickness:2];

    //竖线
    [cmd cpclLineWithXPos:end_x_1 yPos:start_y_1 xEnd:end_x_1 yEnd:start_y_11 thickness:2];
    [cmd cpclLineWithXPos:end_x_2 yPos:start_y_4 xEnd:end_x_2 yEnd:start_y_8 thickness:2];
    [cmd cpclLineWithXPos:end_x_3 yPos:start_y_6 xEnd:end_x_3 yEnd:start_y_8 thickness:2];
    [cmd cpclLineWithXPos:end_x_4 yPos:start_y_3 xEnd:end_x_4 yEnd:start_y_4 thickness:2];
    [cmd cpclLineWithXPos:end_x_5 yPos:start_y_6 xEnd:end_x_5 yEnd:start_y_8 thickness:2];
    [cmd cpclLineWithXPos:end_x_6 yPos:start_y_4 xEnd:end_x_6 yEnd:start_y_8 thickness:2];
    
    [cmd cpclLineWithXPos:end_x_8 yPos:start_y_1 xEnd:end_x_8 yEnd:start_y_11 thickness:2];

    if (![cod isEqualToString:@""] && cod != nil && cod.doubleValue > 0) {
//        [cmd cpclPrintBitmapWithXPos:500 yPos:start_y_1+6 image:[UIImage imageNamed:@"icon_cod"].CGImage bitmapMode:0 compress:0];
//        [cmd cpclPrintBitmapWithXPos:500 yPos:start_y_1+6 image:[UIImage imageNamed:@"icon_cod"].CGImage bitmapMode:PTBitmapModeBinary compress:PTBitmapCompressModeNone isPackage:NO];
    }
//    if ([self.settlementCode isEqualToString:@"CC_CASH"]) {
//            [cmd cpclPrintBitmapWithXPos:end_x_7 - 20 yPos:start_y_1+2*size image:[UIImage imageNamed:@"icon_daofu"].CGImage bitmapMode:0 compress:0];
     
//    }else{
//        if (self.paperPrintType == CYHPaperPrintSignOriginalType){
//            [cmd cpclPrintBitmapWithXPos:end_x_7 - 20 yPos:start_y_1+2*size image:[UIImage imageNamed:@"qiandan22"].CGImage bitmapMode:0 compress:0];
//        }
        
//    }
    
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:0 reverse:NO bold:1 x:40*size y:start_y_1+10.5*size text:serviceHotline];
    [cmd cpclSetMagWithWidth:2 height:2];
    [cmd appendTextWithFont:PTCPCLTextFont4 rotate:0 fontSize:4 reverse:NO bold:1 x:2.5*size y:start_y_2+2*size text:code];
    [cmd cpclSetMagWithWidth:1 height:1];
    
#warning "self.isBusiness"
    if (NO) {
//        [cmd cpclPrintBitmapWithXPos:end_x_7 - 10 yPos:start_y_2+2*size image:[UIImage imageNamed:@"business_print"].CGImage bitmapMode:0 compress:0];
    }else{
        [cmd appendTextWithFont:PTCPCLTextFont4 rotate:0 fontSize:4 reverse:NO bold:1 x:end_x_7+2*size y:start_y_2+1*size text:@"标准"];
        [cmd appendTextWithFont:PTCPCLTextFont4 rotate:0 fontSize:4 reverse:NO bold:1 x:end_x_7+2*size y:start_y_2+6*size text:@"快递"];
        [cmd cpclLineWithXPos:end_x_7 yPos:start_y_2 xEnd:end_x_7 yEnd:start_y_3 thickness:2];
    }
    
//    [cmd cpclPrintBitmapWithXPos:30 yPos:start_y_3+2*size image:[UIImage imageNamed:@"icon_collection"].CGImage bitmapMode:0 compress:0];
    [cmd appendTextWithFont:PTCPCLTextFont4 rotate:0 fontSize:4 reverse:NO bold:1 x:end_x_2+3*size + 10 y:start_y_3+2*size text:center];
    
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:0 reverse:NO bold:1 x:end_x_4+1*size y:start_y_3+1*size text:@"打印时间："];
//    [cmd cpclAutoTextWithRotate:0 font:PTCPCLTextFont8 fontSize:0 x:end_x_4+16.5*size y:start_y_3+1*size safeHeight:60 width:150 lineSpacing:5 text:[CommonFile getCurrentTime]];
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:0 reverse:NO bold:0 x:end_x_4+31*size y:start_y_3+5*size text:[NSString stringWithFormat:@"%@/%@",printNumber,number]];

    //收件地址
//    [cmd cpclPrintBitmapWithXPos:end_x_1+1*size yPos:start_y_4+5*size image:[UIImage imageNamed:@"icon_receiver"].CGImage bitmapMode:0 compress:0];
    [cmd appendTextWithFont:PTCPCLTextFont4 rotate:0 fontSize:0 reverse:NO bold:1 x:end_x_2+1*size y:start_y_4+1*size text:recipientName];
//    [cmd cpclAutoTextWithRotate:0 font:8 fontSize:0 x:end_x_2+1*size y:start_y_4+6*size safeHeight:90 width:380 lineSpacing:5 text:recipientAddress];
    [cmd cpclAutoTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:0 x:end_x_2+1*size y:start_y_4+6*size safeHeight:90 width:300 lineSpacing:5 fontScale:PTCPCLFontScale_1 text:@"接收地址1"];
    //    [cmd appendTextWithFont:PTCPCLTextFont20 rotate:0 fontSize:0 reverse:NO bold:0 x:end_x_2+1*size y:start_y_4+17*size text:company];

    //寄件地址
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:1 reverse:NO bold:1 x:end_x_1+3.5*size y:start_y_5+7*size text:@"寄"];
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:1 reverse:NO bold:1 x:end_x_2+1*size y:start_y_5+1*size text:senderName];
    
//    [cmd cpclAutoTextWithRotate:0 font:8 fontSize:0 x:end_x_2+1*size y:start_y_5+5*size safeHeight:75 width:365 lineSpacing:5 text:senderAddress];
    [cmd cpclAutoTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:0 x:end_x_2+1*size y:start_y_5+5*size safeHeight:75 width:365 lineSpacing:5 fontScale:PTCPCLFontScale_1 text:@"发送地址1"];
    
    [cmd appendTextWithFont:PTCPCLTextFont20 rotate:0 fontSize:0 reverse:NO bold:0 x:end_x_2+1*size y:start_y_5+13*size text:company];
    
//    if (self.isValuation) {
//        [cmd cpclPrintBitmapWithXPos:end_x_1+3.5*size - 5 yPos:start_y_6+3*size - 5 image:[UIImage imageNamed:@"icon_project"].CGImage bitmapMode:0 compress:0];
        
//    }
    
    
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:1 reverse:NO bold:1 x:end_x_2+2.5*size y:start_y_6+1*size text:@"代收货款"];
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:1 reverse:NO bold:1 x:end_x_3+2.5*size y:start_y_6+1*size text:@"到付运费"];
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:1 reverse:NO bold:1 x:end_x_5+2.5*size y:start_y_6+1*size text:@"寄件重量"];

    if (![cod isEqualToString:@""] && cod != nil && cod.doubleValue > 0) {
        [cmd cpclCenterTextWithRotate:0 font:PTCPCLTextFont28 fontSize:16 x:end_x_2 y:start_y_7+1*size width:17*size text:cod];
    }

    [cmd cpclCenterTextWithRotate:0 font:PTCPCLTextFont28 fontSize:16 x:end_x_3 y:start_y_7+1*size width:17*size text:freight];
    [cmd cpclCenterTextWithRotate:0 font:PTCPCLTextFont28 fontSize:16 x:end_x_5 y:start_y_7+1*size width:17*size text:weight];

    //右边条形码
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:270 fontSize:1 reverse:NO bold:1 x:end_x_6+4*size y:start_y_4+12*size text:barcode];
    [cmd cpclBarcodeVertical:PTCPCLBarcodeStyleCode128 width:1 ratio:1 height:55 x:end_x_6+5*size y:start_y_8-2*size barcode:barcode];

    //下方条形码
    [cmd cpclBarcode:PTCPCLBarcodeStyleCode128 width:2 ratio:2 height:75 x:end_x_1+3.5*size y:start_y_8+2*size barcode:barcode];
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:1 reverse:NO bold:1 x:end_x_1+19*size y:start_y_8+13*size text:barcode];

    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:0 reverse:NO bold:0 x:end_x_4+31*size y:start_y_8+13*size text:[NSString stringWithFormat:@"%@/%@",printNumber,number]];

    //备注
//    [cmd cpclAutoTextWithRotate:0 font:8 fontSize:0 x:end_x_1+1.5*size y:start_y_9+1.5*size safeHeight:90 width:540 lineSpacing:5 text:note];
    [cmd cpclAutoTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:0 x:end_x_1+1.5*size y:start_y_9+1.5*size safeHeight:90 width:540 lineSpacing:5 fontScale:PTCPCLFontScale_1 text:@"注释标记1"];
    
    //二维码
    [cmd cpclBarcodeQRcodeWithXPos:end_x_1+1*size yPos:start_y_10+1*size model:2 unitWidth:3];
    [cmd cpclBarcodeQRCodeCorrectionLecel:1 characterMode:0 context:qrCode];
    [cmd cpclBarcodeQRcodeEnd];

    [cmd appendTextWithFont:PTCPCLTextFont4 rotate:0 fontSize:0 reverse:NO bold:1 x:end_x_2+5*size y:start_y_10+1.5*size text:@"签收人/时间"];
//    [cmd cpclAutoTextWithRotate:0 font:PTCPCLTextFont20 fontSize:8 x:end_x_2+5*size y:start_y_10+7*size safeHeight:60 width:500 lineSpacing:5 text:@"您的签收代表您已验收此包裹，并确认商品信息无误,包裹完好、没有划痕、破损等表面质量问题"];
    [cmd cpclAutoTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont20 fontSize:8 x:end_x_2+5*size y:start_y_10+7*size safeHeight:60 width:500 lineSpacing:5 fontScale:PTCPCLFontScale_1 text:@"您的签收代表您已验收此包裹，并确认商品信息无误,包裹完好、没有划痕、破损等表面质量问题"];
    
    [cmd cpclSetMagWithWidth:4 height:4];
    [cmd cpclSetBackgroundBlacknessValue:100];
    [cmd cpclBackTextWithFont:PTCPCLTextFont4 rotate:PTCPCLStyleRotation0 fontSize:PTCPCLTextFont4 xPos:end_x_2 yPos:start_y_5+4*size text:waterPrint];
    [cmd cpclSetMagWithWidth:1 height:1];

    //已检视
    int x_1=480,x_2=560;
    int y_1=825,y_2=860;
    //打印次数
//    if ([self.printDataModel.printsNumber integerValue] > 0) {
//        [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:0 reverse:NO bold:1 x:x_1 - 20*size y:y_1+5 text:[NSString stringWithFormat:@"打印:%ld次",[self.printDataModel.printsNumber integerValue] + 1]];
//    }
    [cmd cpclLineWithXPos:x_1 yPos:y_1 xEnd:x_2 yEnd:y_1 thickness:2];
    [cmd cpclLineWithXPos:x_1 yPos:y_2 xEnd:x_2 yEnd:y_2 thickness:2];
    [cmd cpclLineWithXPos:x_1 yPos:y_1 xEnd:x_1 yEnd:y_2 thickness:2];
    [cmd cpclLineWithXPos:x_2 yPos:y_1 xEnd:x_2 yEnd:y_2 thickness:2];
    [cmd appendTextWithFont:PTCPCLTextFont8 rotate:0 fontSize:1 reverse:NO bold:1 x:x_1+5 y:y_1+5 text:@"已检视"];

    [cmd cpclPrint];
    [[PTDispatcher share] sendData:cmd.cmdData];
}


@end
