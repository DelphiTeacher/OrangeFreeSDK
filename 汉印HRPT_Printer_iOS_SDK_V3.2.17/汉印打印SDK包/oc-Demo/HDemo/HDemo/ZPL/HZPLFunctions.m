//
//  HZPLFunctions.m
//  HDemo
//
//  Created by ios on 2021/8/19.
//  Copyright © 2021 Hanin. All rights reserved.
//

#import "HZPLFunctions.h"
#import "HConst.h"

@implementation HZPLFunctions


+ (void)testPrintImage
{
    UIImage *image = [UIImage imageNamed:@"DLTest"];
    if (image == nil) {
        return;
    }
#if 0
    /// DG~是先下载到打印机，建议用这条，可以用压缩方式
    PTCommandZPL *zpl = [[PTCommandZPL alloc] init];
    [zpl XA_FormatStart];
    [zpl MC_MapClear:PTZplBool_Y];
    [zpl PM_PrintLabelMirrorImage:PTZplBool_N];
    [zpl PW_PrintWidth:576];
    [zpl LH_LabelHomeWithXPos:0 YPos:0];
    [zpl LR_LabelReversePrint:PTZplBool_N];
    [zpl XZ_FormatEnd];
    /// 下载
    [zpl DG_DownloadGraphicsWithImage:image.CGImage bitmapMode:PTBitmapModeBinary compress:PTBitmapCompressModeLZO deviceLocation:PTZplFileLocation_R imageName:@"iZPL" extension:@"GRF"];
    
    /// 打印
    [zpl XA_FormatStart];
    [zpl PQ_PrintQuantity:1];
    [zpl FO_FieldOriginWithXAxis:10 YAxis:10];
    [zpl XG_RecallGraphicWithSourceDevice:PTZplFileLocation_R imageName:@"iZPL" extension:@"GRF" XAxisMagnification:1 YAxisMagnification:1];
    [zpl FS_FieldSeparator];
    [zpl XZ_FormatEnd];
    
    /// 删除
    [zpl XA_FormatStart];
    [zpl ID_ImageDeleteWithObjectLocation:PTZplFileLocation_R objectName:@"iZPL" extension:@"GRF"];
    [zpl XZ_FormatEnd];
    
    /// 发送
    [self printData:zpl.cmdData];
#else
    /// GF~是无法用压缩模式
    PTCommandZPL *zpl = [[PTCommandZPL alloc] init];
    [zpl XA_FormatStart];
    [zpl MC_MapClear:PTZplBool_Y];
    [zpl PM_PrintLabelMirrorImage:PTZplBool_N];
    [zpl PW_PrintWidth:576];
    [zpl LH_LabelHomeWithXPos:0 YPos:0];
    [zpl LR_LabelReversePrint:PTZplBool_N];
    [zpl XZ_FormatEnd];
    
    [zpl XA_FormatStart];
    [zpl PQ_PrintQuantity:1];
    [zpl FO_FieldOriginWithXAxis:10 YAxis:10];
    [zpl GF_GraphicFieldWithCompressionType:@"B" image:image.CGImage bitmapMode:PTBitmapModeBinary];
    [zpl FS_FieldSeparator];
    [zpl XZ_FormatEnd];
    /// 发送
    [self printData:zpl.cmdData];
#endif
}

+ (void)testPrintSelfpage
{
    PTCommandZPL *cmd = [[PTCommandZPL alloc] init];
    [cmd printSelfTest];
    /// 发送
    [self printData:cmd.cmdData];
}

+ (void)testPrintBarcode
{
    PTCommandZPL *cmd = [[PTCommandZPL alloc] init];
    
    [cmd XA_FormatStart];
    
    //连续纸需要设置标签长度，标签纸可不用
    [cmd LL_LabelLength:1800];
    [cmd PW_PrintWidth:700];
    
    //b0
    [cmd FO_FieldOriginWithXAxis:50 YAxis:10];
    [cmd B0_BacodeAztecWithOrientation:PTZplOrientation_R magnificationFactor:7 isContainECIC:PTZplBool_N errorAndSymbol:0 isMenuSymbol:PTZplBool_N appendSymbolNumber:1 appendOptionalID:@"0"];
    [cmd FD_FieldData:@"7. This is testing label 7"];
    

    //b1
    [cmd FO_FieldOriginWithXAxis:50 YAxis:200];
    [cmd BY_BarcodeFieldDefaultWithModuleWidth:3];
    [cmd B1_BacodeCode11WithOrientation:PTZplOrientation_N checkDigit:PTZplBool_N barcodeHeight:150 interpretationLine:PTZplBool_Y aboveCode:PTZplBool_N];
    [cmd FD_FieldData:@"123456"];

    //b2
    [cmd FO_FieldOriginWithXAxis:50 YAxis:400];
    [cmd BY_BarcodeFieldDefaultWithModuleWidth:3];
    [cmd B3_BacodeCode39WithOrientation:PTZplOrientation_N checkDigit:PTZplBool_N barcodeHeight:100 interpretationLine:PTZplBool_Y aboveCode:PTZplBool_N];
    [cmd FD_FieldData:@"123ABC"];

    //b8
    [cmd FO_FieldOriginWithXAxis:50 YAxis:600];
    [cmd BY_BarcodeFieldDefaultWithModuleWidth:3];
    [cmd B8_BacodeEAN8WithOrientation:PTZplOrientation_N barcodeHeight:100 interpretationLine:PTZplBool_Y aboveCode:PTZplBool_N];
    [cmd FD_FieldData:@"1234567"];
//        be
    [cmd FO_FieldOriginWithXAxis:50 YAxis:800];
    [cmd BY_BarcodeFieldDefaultWithModuleWidth:3];
    [cmd BE_BacodeEAN13WithOrientation:PTZplOrientation_N barcodeHeight:100 interpretationLine:PTZplBool_Y aboveCode:PTZplBool_N];
    [cmd FD_FieldData:@"12345678"];
//        bi
    [cmd FO_FieldOriginWithXAxis:50 YAxis:1000];
    [cmd BY_BarcodeFieldDefaultWithModuleWidth:3];
    [cmd BI_BacodeIndustrial2of5WithOrientation:PTZplOrientation_N barcodeHeight:150 interpretationLine:PTZplBool_Y aboveCode:PTZplBool_N];
    [cmd FD_FieldData:@"123456"];

//        bj
    [cmd FO_FieldOriginWithXAxis:50 YAxis:1200];
    [cmd BY_BarcodeFieldDefaultWithModuleWidth:3];
    [cmd BJ_BacodeStandard2of5WithOrientation:PTZplOrientation_N barcodeHeight:150 interpretationLine:PTZplBool_Y aboveCode:PTZplBool_N];
    [cmd FD_FieldData:@"123456"];
    
    //bl
    [cmd FO_FieldOriginWithXAxis:50 YAxis:1400];
    [cmd BY_BarcodeFieldDefaultWithModuleWidth:3];
    [cmd BL_BacodeLOGMARSWithOrientation:PTZplOrientation_N barcodeHeight:100 printInterpretationLineAboveCode:PTZplBool_N];
    [cmd FD_FieldData:@"12AB"];
    
    //bs
    [cmd FO_FieldOriginWithXAxis:50 YAxis:1600];
    [cmd BY_BarcodeFieldDefaultWithModuleWidth:3];
    [cmd BS_BacodeUPCEANExtensionsWithOrientation:PTZplOrientation_N barcodeHeight:100 interpretationLine:PTZplBool_Y aboveCode:PTZplBool_N];
    [cmd FD_FieldData:@"12345"];
    [cmd XZ_FormatEnd];
    
    [self printData:cmd.cmdData];
}

+ (void)testGraphicsSample
{
    PTCommandZPL *cmd = [[PTCommandZPL alloc] init];
    
    //矩形
    [cmd XA_FormatStart];
    [cmd FO_FieldOriginWithXAxis:50 YAxis:50];
    [cmd GB_GraphicBoxWithWidth:300 height:200 thickness:10 lineColor:PTZplColorBlack cornorRoundingDegree:0];
    [cmd XZ_FormatEnd];
    
    //竖线
    [cmd XA_FormatStart];
    [cmd FO_FieldOriginWithXAxis:50 YAxis:50];
    [cmd GB_GraphicBoxWithWidth:0 height:203 thickness:20 lineColor:PTZplColorBlack cornorRoundingDegree:0];
    [cmd XZ_FormatEnd];
    //横线
    [cmd XA_FormatStart];
    [cmd FO_FieldOriginWithXAxis:50 YAxis:50];
    [cmd GB_GraphicBoxWithWidth:203 height:0 thickness:20 lineColor:PTZplColorBlack cornorRoundingDegree:0];
    [cmd XZ_FormatEnd];

    //圆角矩形
    [cmd XA_FormatStart];
    [cmd FO_FieldOriginWithXAxis:50 YAxis:50];
    [cmd GB_GraphicBoxWithWidth:300 height:200 thickness:10 lineColor:PTZplColorBlack cornorRoundingDegree:5];
    [cmd XZ_FormatEnd];

    [cmd XA_FormatStart];
    [cmd FO_FieldOriginWithXAxis:50 YAxis:50];
    [cmd GC_GraphicCircleWithDiameter:250 thickness:10 lineColor:PTZplColorBlack];
    [cmd XZ_FormatEnd];

    [cmd XA_FormatStart];
    [cmd FO_FieldOriginWithXAxis:50 YAxis:50];
    [cmd GB_GraphicBoxWithWidth:350 height:203 thickness:10 lineColor:PTZplColorBlack cornorRoundingDegree:0];
    [cmd FO_FieldOriginWithXAxis:155 YAxis:110];
    [cmd GD_GraphicDiagonalLineWithWidth:330 height:183 thickness:10 lineColor:PTZplColorBlack orientation:PTZplDiagonalOrientationLeaningRight];
    [cmd XZ_FormatEnd];
    [self printData:cmd.cmdData];
}

+ (void)testTextSample
{
    PTCommandZPL *cmd = [[PTCommandZPL alloc] init];
    
    [cmd XA_FormatStart];

    //连续纸需要设置标签长度，标签纸可不用
    [cmd LL_LabelLength:700];
    [cmd PW_PrintWidth:700];
    
    [cmd A_SetFontWithOrientation:PTZplOrientation_N height:50 width:50 location:PTZplFileLocation_E];
    [cmd FO_FieldOriginWithXAxis:100 YAxis:100];
    [cmd FD_FieldData:@"中国福建省厦门市"];
    [cmd FS_FieldSeparator];
    
    [cmd A_SetFontWithOrientation:PTZplOrientation_N height:50 width:50 location:PTZplFileLocation_E];
    [cmd FO_FieldOriginWithXAxis:100 YAxis:200];
    [cmd FD_FieldData:@"This uses E:SIMSUN.TTF"];
    [cmd FS_FieldSeparator];
    
    [cmd FO_FieldOriginWithXAxis:100 YAxis:300];
    [cmd A_SetFontWithOrientation:PTZplOrientation_N height:40 width:40 location:PTZplFileLocation_E];
    [cmd FD_FieldData:@"众志成城，奋勇向前"];
    [cmd FS_FieldSeparator];
    
    [cmd FO_FieldOriginWithXAxis:100 YAxis:400];
    [cmd BY_BarcodeFieldDefaultWithModuleWidth:3];
    [cmd B1_BacodeCode11WithOrientation:PTZplOrientation_N checkDigit:PTZplBool_N barcodeHeight:150 interpretationLine:PTZplBool_Y aboveCode:PTZplBool_N];
    [cmd FD_FieldData:@"123456"];
    [cmd XZ_FormatEnd];
    [self printData:cmd.cmdData];
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
