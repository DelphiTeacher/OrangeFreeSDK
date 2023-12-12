//
//  ptktestUtil.m
//  ptkDemo
//
//  Created by SDP-MAC on 2017/10/7.
//  Copyright © 2017年 test. All rights reserved.
//

#import "ptktestUtil.h"
#import "MyPcxImageConverter.h"

@implementation ptktestUtil

-(void) DSLinkWifi:(NSString*) ipString andPort:(int)port {
    _NarrowWidth = 2;
    _WideWidth = 2;
    [_ptkSDK PTKConnect:ipString andPort:port];
}

-(void)DSCloseWifi {
    [_ptkSDK PTKCloseConnect];
}

/**
 * 使用连续纸时，必须最先呼叫此函数。 使用标签纸时，该函数设置标签参数。
 *       NORMAL_GAP_MODE = 0,
 *       SPECIAL_GAP_MODE,
 *       IN_BLACKLINE_MODE,
 *       OUT_BLACKLINE_MODE,
 *       CONTINUOUS_MODE:用于探测纸张是否用完
 * @param len
 *            连续纸页长，0.005≤width≤22 单位：英寸
 * @return 如果成功，返回值是true；如果失败，返回值是false
 */
-(BOOL)setPageLength:(double)len{
    [_ptkSDK PTKClearBuffer];
    // myPSK.PTKReset();
    // 对len进行判断，判断是否在合理区间内
    if (len <= 0.005 || len >= 22) {
        return false;
    }
    int state = [_ptkSDK PTKSetLabelHeight:NORMAL_GAP_MODE andHeight:[self InchToDots:len] andGapH:16 andGap:0];
    
    [_ptkSDK PTKSetLabelWidth:900];// 900dot
    if (state == 1) {
        return true;
    } else {
        return false;
    }
}

-(BOOL)setPageLengthEX:(double)nHeight{
    [_ptkSDK PTKClearBuffer];
    // myPSK.PTKReset();
    // 对len进行判断，判断是否在合理区间内
    if (nHeight <= 0.005 || nHeight >= 22) {
        return false;
    }
    int state = [_ptkSDK PTKSetLabelHeight:CONTINUOUS_MODE andHeight:[self InchToDots:nHeight] andGapH:0 andGap:0];
    
    [_ptkSDK PTKSetLabelWidth:900];// 900dot
    if (state == 1) {
        return true;
    } else {
        return false;
    }
}

/**
 * 打印文本
 *
 * @param command
 *            0: 设置用户打印的内容。设置为该值时，本函数不能单独调用，必须配合参数为 2、3 一起使用。 1:
 *            在用户指定的某个坐标打印。设置为该值时，可以单独调用本函数。 2: 一页标签打印开始。
 *            设置为该值时，后续所有参数都被忽略。本函数不能单独调用，必须配合参数 0、3 一起使用。 3: 一页标签打印结束。
 *            设置为该值时，后续所有参数都被忽略。本函数不能单独调用，必须配合参数 0、2 一起使用。
 * @param darkness
 *            打印浓度，范围[0,30]。
 * @param horizontal
 *            打印横向位置，单位：英寸(inch)。
 * @param vertical
 *            打印纵向位置，单位：英寸(inch)。
 * @param height
 *            字符纵向放大倍数，1≤height≤10。
 * @param width
 *            字符横向放大倍数，1≤width≤10。
 * @param text
 *            打印的内容
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
-(BOOL) PrintText:(int)command andDarkness:(int)darkness andHorizontal:(double) horizontal andVertical:(double)vertical andHeight:(int)height andWidth:(int) width andText:(NSString*) text{
    int result = -1;
    if (darkness >= 20) {
        darkness = 20;
    }
    // result = myPSK.PTKSetDarkness(darkness);
    // if(result != PTK_SUCCESS){//设置黑度，取值范围：0—20，缺省为 10；
    // return false;
    // }
    
    switch (command) {
        case 0:
            /**
             * 参数1：设置 X 坐标,以点(dots)为单位. 参数2：设置 Y 坐标,以点(dots)为单位. 参数3：选择文字的打印方向.
             * 0—不旋转;1—旋转 90°; 2—旋转 180°; 3—旋转 270° 参数4：选择内置字体或软字体。1—5: 为为打印机内置
             * 5 种西文字体;6：为打印机内置 1 种中文字体 参数5：当 pFont 设置为内置字体时（1~6），此时 pHorizontal
             * 为设置点阵水平放大系数. 可选择:1—24. 当 pFont 选择 TrueType 字体时（A~Z），此时
             * pHorizontal 为设置字体的宽度，单位为像素点（不限大小）。 参数6：当 pFont 设置为内置字体时（1~6），此时
             * pVertical 为设置点阵垂直放大系数. 择:1—24. 当 pFont 选择 TrueType 字体时（A~Z），此时
             * pVertical 为设置字体的高度，单位为像素点（不限大小）。 参数7：选’N’ 对应 ASCII 值 78
             * 则打印正常文本(如黑字白底文本) 参数8：一个长度为 1-100 的字符串
             */
            // result = myPSK.PTKDrawText(InchToDots(horizontal),
            // InchToDots(vertical), 0, 6, width, height, 'N', text);
            // myPSK.PTKSetDirection('T');
            if (_pdirec == 1) {
                horizontal += 0.12;
            }
            if (height > 1 && width > 1) {
                horizontal += 0.08;
            }
            if ([text isEqualToString:@""]!=1) {
                result = [_ptkSDK PTKDrawText:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:_pdirec andFont:'6' andHorizontal:height andVertical:width andText:'N' andStr:text];
                if (result != PTK_SUCCESS) {
                    return false;
                } else {
                    return true;
                }
            }
            break;
        case 1:
            result = [_ptkSDK PTKClearBuffer];// 清空缓存
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPcxGraphicsDel: @"*"];
            if (result != PTK_SUCCESS) {
                return false;
            }
            if (_pdirec == 1) {
                horizontal += 0.12;
            }
            if (height > 1 && width > 1) {
                horizontal += 0.08;
            }
            if ([text isEqualToString:@""]!=1) {
                result = [_ptkSDK PTKDrawText:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:_pdirec andFont:'6' andHorizontal:height andVertical:width andText:'N' andStr:text];
                if (result != PTK_SUCCESS) {
                    return false;
                } else {
                    return true;
                }
            }
            result = [_ptkSDK PTKPrintLabel:1 andCPNum:1]; //命令打印机执行打印工作
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 2:
            result = [_ptkSDK PTKClearBuffer];// 清空缓存
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPcxGraphicsDel: @"*"];
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 3:
            result = [_ptkSDK PTKPrintLabel:1 andCPNum:1];// 命令打印机执行打印工作
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        default:
            // Toast.makeText(myActivity.getApplicationContext(),
            // "PrintText()的第一个参数传入错误！", Toast.LENGTH_LONG).show();
            NSLog(@"PrintText()的第一个参数传入错误！");
            return false;
            // break;
    }
 //   [_ptkSDK PTKCutPage:1];
    return true;
}

/**
 * 旋转打印
 *
 * @param dir
 *            dir: 旋转方向 0： 不旋转 1： 旋转 90 度 2： 旋转 180 度 3： 旋转 270 度
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
-(BOOL) DSSetDirection:(int) dir {
    int result = -1;
    switch (dir) {
        case 0:// 不旋转
            result = [_ptkSDK PTKSetDirection:'T'];
            _pdirec = 0;
            break;
        case 1:// 旋转 90 度
            result = [_ptkSDK PTKSetDirection:'T'];
            _pdirec = 1;
            break;
        case 2:// 旋转 180 度
            result = [_ptkSDK PTKSetDirection:'T'];
            _pdirec = 2;
            break;
        case 3:// 旋转 270 度
            result = [_ptkSDK PTKSetDirection:'T'];
            _pdirec = 3;
            break;
        default:
            break;
    }
    if (result == 0) {
        return true;
    } else {
        return false;
    }
}

/**
 * 打印表格横线
 *
 * @param command
 *            0: 设置用户打印的内容。设置为该值时，本函数不能单独调用，必须配合参数为 2、3 一起使用。 1:
 *            在用户指定的某个坐标打印。设置为该值时，可以单独调用本函数。 2: 一页标签打印开始。
 *            设置为该值时，后续所有参数都被忽略。本函数不能单独调用，必须配合参数 0、3 一起使用。 3: 一页标签打印结束。
 *            设置为该值时，后续所有参数都被忽略。本函数不能单独调用，必须配合参数 0、2 一起使用。
 * @param horizontal
 *            线段起点的横坐标。单位：英寸
 * @param vertical
 *            线段起点的纵坐标。单位：英寸
 * @param length
 *            线段的长度。单位：英寸
 * @param thick
 *            线的粗细。 单位：英寸
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
- (BOOL) Print_HLine:(int) command andHorizontal:(double) horizontal andVertical:(double) vertical andLenth:(double)length andThick:(double) thick {
    int result = -1;
    switch (command) {
        case 0:
            /**
             * px: 设置 X 坐标，以点(dots)为单位； py: 设置 Y 坐标，以点(dots)为单位；
             * plength：设置直线的水平长度，以点(dots)为单位； pH：设置直线的垂直高度，以点(dots)为单位。
             */
            result = [_ptkSDK PTKDrawLineOr:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andLenth:[self InchToDots:length] andH:[self InchToDots:thick]];
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 1:
            result = [_ptkSDK PTKClearBuffer];// 清空缓存
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPcxGraphicsDel: @"*"];
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKDrawLineOr:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andLenth:[self InchToDots:length] andH:[self InchToDots:thick]];
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPrintLabel:1 andCPNum:1];// 命令打印机执行打印工作
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 2:
            result = [_ptkSDK PTKClearBuffer];// 清空缓存
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPcxGraphicsDel: @"*"];
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 3:
            result = [_ptkSDK PTKPrintLabel:1 andCPNum:1];// 命令打印机执行打印工作
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        default:
            // Toast.makeText(myActivity.getApplicationContext(),
            // "PrintText()的第一个参数传入错误！", Toast.LENGTH_LONG).show();
            NSLog(@"PrintText()的第一个参数传入错误！");
            return false;
            // break;
    }
    return true;
}

/**
 * 打印表格竖线
 *
 * @param command
 *            0: 设置用户打印的内容。设置为该值时，本函数不能单独调用，必须配合参数为 2、3 一起使用。 1:
 *            在用户指定的某个坐标打印。设置为该值时，可以单独调用本函数。 2: 一页标签打印开始。
 *            设置为该值时，后续所有参数都被忽略。本函数不能单独调用，必须配合参数 0、3 一起使用。 3: 一页标签打印结束。
 *            设置为该值时，后续所有参数都被忽略。本函数不能单独调用，必须配合参数 0、2 一起使用。
 * @param horizontal
 *            线段起点的横坐标。单位：英寸
 * @param vertical
 *            线段起点的纵坐标。单位：英寸
 * @param length
 *            线段的长度。单位：英寸
 * @param thick
 *            线的粗细。 单位：英寸
 * @return 如果成功，返回值是true; 如果失败，返回值是false
 */
-(BOOL) Print_VLine:(int)command andHorizontal:(double)horizontal andVertical:(double)vertical andLenth:(double)length andThick:(double)thick {
    int result = -1;
    switch (command) {
        case 0:
            /**
             * px: 设置 X 坐标，以点(dots)为单位； py: 设置 Y 坐标，以点(dots)为单位；
             * plength：设置直线的水平长度，以点(dots)为单位； pH：设置直线的垂直高度，以点(dots)为单位。
             */
            result = [_ptkSDK PTKDrawLineOr:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andLenth:[self InchToDots:thick] andH:[self InchToDots:length]];
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 1:
            result = [_ptkSDK PTKClearBuffer];// 清空缓存
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPcxGraphicsDel: @"*"];
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKDrawLineOr:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andLenth:[self InchToDots:thick] andH:[self InchToDots:length]];
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPrintLabel:1 andCPNum:1];// 命令打印机执行打印工作
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 2:
            result = [_ptkSDK PTKClearBuffer];// 清空缓存
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPcxGraphicsDel: @"*"];
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPrintLabel:1 andCPNum:1];// 命令打印机执行打印工作
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        default:
            // Toast.makeText(myActivity.getApplicationContext(),
            // "PrintText()的第一个参数传入错误！", Toast.LENGTH_LONG).show();
            NSLog(@"PrintText()的第一个参数传入错误！");
            return false;
            // break;
    }
    return true;
}

/**
 * 图像方式打印一行文字
 *
 * @param horizontal
 *            打印横向位置，单位：英寸(inch)。
 * @param vertical
 *            打印纵向位置，单位：英寸(inch)。
 * @param fontName
 *            字体名称(手机里面必须存在该字体)，字体名称可以通过获取系统支持的字体family获得，若字体名称为nil，则使用系统默认字体
 * @param andBoldweight
 *            字体粗细,对系统字体有效，当fontName不为nil时，无效
 * const CGFloat UIFontWeightUltraLight ;//极细
 * const CGFloat UIFontWeightThin ;      //较细；依次类推，逐渐加粗
 * const CGFloat UIFontWeightLight ;
 * const CGFloat UIFontWeightRegular ;
 * const CGFloat UIFontWeightMedium ;
 * const CGFloat UIFontWeightBold ;
 * const CGFloat UIFontWeightHeavy ;
 * const CGFloat UIFontWeightBlack ;    //极粗
 * @param size
 *            字号
 * @param text
 *            打印的内容
 * @param bShowStyleBlackFont
 *            白底黑字或者黑底白字显示，TRUE为白底黑字
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 -(int)InchToDots:(double)x {
 return (int) (x * 200);
 }
 */
-(BOOL) DSZPLPrintTextLine:(double)horizontal andVertical:(double)vertical andFontName:(NSString *)fontName andBoldweight:(CGFloat)andBoldweight andSize:(int)size andText:(NSString*) text andShowStyle:(BOOL)bShowStyleBlackFont{
    int result = -1;
    NSArray *arr = [[NSArray alloc]initWithObjects:text,nil];

    UIFont *font = [UIFont systemFontOfSize:size weight:andBoldweight];
    if(fontName != nil) font = [UIFont fontWithName:fontName size:size];
    NSData* data= [PcxImageConverter convertToPcx:arr withFont:font andShowStyle:bShowStyleBlackFont]; //获取pcx图片数据
    NSString* str_name = [self getPCXName];// 获取PCX的名称
    if(data == nil) return false;
    
    result = [_ptkSDK PTKPcxGraphicsDownload:str_name andData:data andDataLenth:(int)data.length];
    if (result != PTK_SUCCESS) {
        return false;
    }
    
    result = [_ptkSDK PTKDrawPcxGraphics:[self InchToDots:horizontal] andPy: [self InchToDots:vertical ] andName:str_name];
    if (result != PTK_SUCCESS) {
        return false;
    }
    
    return true;
}

-( NSString*) getPCXName {
    NSDate * date = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init ];
    [dateFormatter setDateFormat:@"HHmmssSSSS"];
    return [dateFormatter stringFromDate:date];
}

/**
 * 图像方式打印多行文字（当前未实现，如有需要使用请联系相关开发人员）
 *
 * @param horizontal
 *            打印横向位置，单位：英寸(inch)。
 * @param vertical
 *            打印纵向位置，单位：英寸(inch)。
 * @param inumPerRow
 *            每行多少个字符
 * @param fontFace
 *            字体名称(手机里面必须存在该字体)
 * @param fontSize
 *            字号
 * @param alignmode
 *            多行文字的对齐方式 0： 左对齐; 1： 居中对齐(如果能够居中)
 * @param text
 *            打印的内容
 * @return 如果成功，返回值是多行文字的总高度; 如果失败，返回值是0
 */
- (double) DSZPLPrintTextMultiLine:(double) horizontal andVertical:(double)vertical andNumPerRom:(int)inumPerRow andFont:(UIFont*)fontFace andFontSize:(int) fontSize andAlignmode:(int)alignmode andText:(NSString *) text {// 目前没有调用
    
    return 0;
}

/**
 * 打印图片
 *
 * @param horizontal
 *            打印横向位置，单位：英寸(inch)。
 * @param vertical
 *            打印纵向位置，单位：英寸(inch)。
 * @param image
 *            图片
 @param scale
 *            缩放系数
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
- (BOOL) DSZPLDrawGraphics:(double) horizontal andVertical:(double)vertical andImage:(UIImage*)image andScale:(double)scale {
    if (image==nil) {
        return false;
    }
    CGSize size=CGSizeMake(image.size.width*scale, image.size.height*scale);
    
    image=[self imageCompressWithSimple:image scaledToSize:size ];
    int result = -1;
    NSData* data= [PcxImageConverter ImageConvertToPcx:image]; //获取pcx图片数据
    NSString* str_name = [self getPCXName];// 获取PCX的名称
    if(data == nil) return false;
    
    result = [_ptkSDK PTKPcxGraphicsDownload:str_name andData:data andDataLenth:(int)data.length];
    if (result != PTK_SUCCESS) {
        return false;
    }
    
    result = [_ptkSDK PTKDrawPcxGraphics:[self InchToDots:horizontal] andPy: [self InchToDots:vertical ] andName:str_name];
    if (result != PTK_SUCCESS) {
        return false;
    }
    
    return true;
}
-(UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
/**
 * 打印图片
 *
 * @param horizontal
 *            打印横向位置，单位：英寸(inch)。
 * @param vertical
 *            打印纵向位置，单位：英寸(inch)。
 * @param message
 *            二维码内容
 * @param width
 *            二维码宽
 * @param height
 *            二维码高
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
- (BOOL)prinBarcodeQR:(double) horizontal andVertical:(double)vertical andQRContext:(NSString *)message andWidth:(double)width andHeight:(double)height{
    int result = -1;
    NSData* data= [PcxImageConverter BarcodeImageConvertToPCX:message Width:width Height:height]; //获取pcx图片数据
    NSString* str_name = [self getPCXName];// 获取PCX的名称
    if(data == nil) return false;
    
    result = [_ptkSDK PTKPcxGraphicsDownload:str_name andData:data andDataLenth:(int)data.length];
    if (result != PTK_SUCCESS) {
        return false;
    }
    
    result = [_ptkSDK PTKDrawPcxGraphics:[self InchToDots:horizontal] andPy: [self InchToDots:vertical ] andName:str_name];
    if (result != PTK_SUCCESS) {
        return false;
    }
    
    return true;
}

-(BOOL)prinBarcodeQRCenterImage:(double)horizontal andVertical:(double)vertical andQRContext:(NSString *)message andWidth:(double)width andHeight:(double)height AndCenterImage:(UIImage *)centerImage{
    int result = -1;
    NSData* data= [PcxImageConverter BarcodeCenterImageConvertToPCX:message Width:width Height:height AndCenterImage:centerImage]; //获取pcx图片数据
    NSString* str_name = [self getPCXName];// 获取PCX的名称
    if(data == nil) return false;
    
    result = [_ptkSDK PTKPcxGraphicsDownload:str_name andData:data andDataLenth:(int)data.length];
    if (result != PTK_SUCCESS) {
        return false;
    }
    
    result = [_ptkSDK PTKDrawPcxGraphics:[self InchToDots:horizontal] andPy: [self InchToDots:vertical ] andName:str_name];
    if (result != PTK_SUCCESS) {
        return false;
    }
    
    return true;
}
//-(BOOL)DSZPLDrawGraphics:(double)horizontal andVertical:(double)vertical andImage:(UIImage *)image andImageWidth:(float)width andImageHeight:(float)height{
//     int result = -1;
//    NSData* data= [PcxImageConverter ImageConvertToPcx:image andWidth:width andHeight:height]; //获取pcx图片数据
//    NSString* str_name = [self getPCXName];// 获取PCX的名称
//    if(data == nil) return false;
//
//    result = [_ptkSDK PTKPcxGraphicsDownload:str_name andData:data andDataLenth:(int)data.length];
//    if (result != PTK_SUCCESS) {
//        return false;
//    }
//
//    result = [_ptkSDK PTKDrawPcxGraphics:[self InchToDots:horizontal] andPy: [self InchToDots:vertical ] andName:str_name];
//    if (result != PTK_SUCCESS) {
//        return false;
//    }
//
//    return true;
//}


/**
 * 设置文本回卷打印（目前未开发，如有需要请联系相关开发人员）
 * 只对下一个PrintText方法生效。如果多个文本需要回卷效果，必须在每个PrintText前调用此方法。
 *
 * @param width
 *            文本打印出来的宽度超过该值时就会回卷换行，单位：英寸。
 * @param rows
 *            行数
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
-(BOOL) DSSetTextWrap:(double) width andRows:(int)rows {// 没调用过
    
    return true;
}

/**
 * 在单元格中居中打印文本
 *
 * @param command
 *            固定值，请输入 0。
 * @param cellHorizontal
 *            单元格的横坐标，单位：英寸
 * @param vertical
 *            文本的纵坐标，单位：英寸
 * @param CellWidth
 *            单元格的宽度，单位：英寸
 * @param fontface
 *            字体名称(手机里面必须存在该字体)
 * @param bold
 *            是否粗体，true表示粗体
 * @param fontsize
 *            字号
 * @param text
 *            打印的内容
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
-(BOOL) DSZPLPrintCenterTextInCell:(int)command andCellH:(double)cellHorizontal andVertical:(double) vertical andCellW:(double)CellWidth andFont:(UIFont *) fontface andBold:(BOOL) bold andFontSize:(int)fontsize andText:(NSString *) text{
    int result = -1;
    switch (command) {
        case 0:{
            // int text_width = (int) ((text.length())*3*7.87);//需要打印的内容的长度
            int text_width = [self countTextLength:text];// 需要打印的内容的长度
            int horizontal = [self InchToDots:cellHorizontal] + ([self InchToDots:CellWidth] - text_width) / 2;
            if (bold) {
                result = [_ptkSDK PTKDrawText:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:_pdirec andFont:'6' andHorizontal:1 andVertical:1 andText:'N' andStr:text];
                result = [_ptkSDK PTKDrawText:[self InchToDots:horizontal+1] andPy:[self InchToDots:vertical] andDirec:_pdirec andFont:'6' andHorizontal:1 andVertical:1 andText:'N' andStr:text];
            } else {
                result = [_ptkSDK PTKDrawText:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:_pdirec andFont:'6' andHorizontal:1 andVertical:1 andText:'N' andStr:text];
            }
        }
            break;
        default:
            // Toast.makeText(myActivity.getApplicationContext(),
            // "PTKZPLPrintCenterTextInCell()的第一个参数传入错误！",
            // Toast.LENGTH_LONG).show();
            NSLog(@"PTKZPLPrintCenterTextInCell()的第一个参数传入错误！");
            return false;
            // break;
    }
    if (result == 0) {
        return true;
    } else {
        return false;
    }
}

/**
 * 在单元格中居中打印文本
 *
 * @param command
 *            固定值，请输入 0。
 * @param darkness
 *            黑度
 * @param cellHorizontal
 *            单元格的横坐标，单位：英寸
 * @param vertical
 *            文本的纵坐标，单位：英寸
 * @param CellWidth
 *            单元格的宽度，单位：英寸
 * @param height
 *            字符纵向放大倍数，1≤height≤10。
 * @param width
 *            字符横向放大倍数，1≤width≤10。
 * @param text
 *            打印的内容
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
-(BOOL) PrintCenterTextInCell:(int) command andDarkNess:(int) darkness andHorizontal:(double) cellHorizontal andVertical:(double)vertical andWidth:(double) CellWidth andHeight:(int)height andWidth:(int)width andText:(NSString *) text {
    int result = -1;
    switch (command) {
        case 0:{
            // int text_width = (int) ((text.length())*3*7.87);//需要打印的内容的长度
            int text_width = [self countTextLength:text];// 需要打印的内容的长度
            // int text_width = getTextWidth(text);
            int horizontal = -1;
            horizontal = [self InchToDots:cellHorizontal] + ([self InchToDots:CellWidth] - text_width) / 2;
            if (![text isEqualToString:@""]) {
                result = [_ptkSDK PTKDrawText:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:0 andFont:'6' andHorizontal:1 andVertical:1 andText:'N' andStr:text];
                if (result != PTK_SUCCESS) {
                    return false;
                } else {
                    return true;
                }
            }}
            break;
        default:
            // Toast.makeText(myActivity.getApplicationContext(),
            // "PTKZPLPrintCenterTextInCell()的第一个参数传入错误！",
            // Toast.LENGTH_LONG).show();
            NSLog(@"PTKZPLPrintCenterTextInCell()的第一个参数传入错误！");
            return false;
            // break;
    }
    if (result == 0) {
        return true;
    } else {
        return false;
    }
}

/**
 * 打印带圈字符（例如○转 ）
 *
 * @param xPos
 *            横坐标，单位：英寸
 * @param yPos
 *            纵坐标，单位：英寸
 * @param data
 *            圈里面的字符，例如“转”
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
-(BOOL) PrintBelle:(double) xPos andYpos:(double)yPos andData:(NSString *)data {// 底层提供
    int result = [_ptkSDK PTKDrawCircledWord:[self InchToDots:xPos] andPy:[self InchToDots:yPos] andStr:data];
    if (result == 0) {
        return true;
    } else {
        return false;
    }
}

/**
 * 设置是否自动切纸、设置打印标签数 如果不调用该接口，批量打印完才切纸。调用该接口后，遇到调用该接口的地方就切纸。
 *
 * @param iQty
 *            打印相同副本的标签数量，一般取值为 1.
 * @param bEnableCutter
 *            是否切纸。true: 切纸，false: 不切
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
-(BOOL)DSZPLSetCutter:(int)iQty andCutter:(BOOL)bEnableCutter {
    if (bEnableCutter) {
        if ([_ptkSDK PTKCutPageEx:iQty] == 0) {
            return true;
        } else {
            return false;
        }
    } else {
        return true;
    }
}

/**
 * 打印条码
 *
 * @param command
 *            0: 设置用户打印的内容。设置为该值时，本函数不能单独调用，必须配合参数为 2、3 一起使用。 1:
 *            在用户指定的某个坐标打印。设置为该值时，可以单独调用本函数。 2: 一页标签打印开始。
 *            设置为该值时，后续所有参数都被忽略。本函数不能单独调用，必须配合参数 0、3 一起使用。 3: 一页标签打印结束。
 *            设置为该值时，后续所有参数都被忽略。本函数不能单独调用，必须配合参数 0、2 一起使用。
 * @param darkness
 *            打印浓度，范围[0,30]。
 * @param horizontal
 *            打印横向位置，单位：英寸(inch)。
 * @param vertical
 *            打印纵向位置，单位：英寸(inch)。
 * @param height
 *            条码高度，单位：英寸(inch)。
 * @param heightHumanRead
 *            人工识别字符高度，单位：点(dot)。
 * @param widthHumanRead
 *            人工识别字符宽度，单位：点(dot)。
 * @param flagHumanRead
 *            打印人工识别符： true 为打印，false 为不打印。
 * @param posHumanRead
 *            人工识别字符的位置:true 为在条码上方打印，false 为在条码下方打印。
 * @param content
 *            条码的内容。
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
-(BOOL) PrintCode128:(int) command andDarkness:(int) darkness andHorizontal:(double) horizontal andVertical:(double) vertical andHeight:(double) height andHeightHuman:(int) heightHumanRead andWidthHuman:(int) widthHumanRead andFlagHuman:(BOOL) flagHumanRead andPosHuman:(BOOL) posHumanRead andContent:(NSString *) content {
    int result = -1;
    if (darkness >= 20) {
        darkness = 20;
    }
    result = [_ptkSDK PTKSetDarkness:darkness];// 设置黑度，取值范围：0—20，缺省为 10；
    if (result != PTK_SUCCESS) {
        return false;
    }
    switch (command) {
        case 0:
            /**
             * px: 设置 X 坐标,以点(dots)为单位. py: 设置 Y 坐标,以点(dots)为单位.
             * pdirec:选择条码的打印方向. 0—不旋转;1—旋转 90°; 2—旋转 180°; 3—旋转 270°. pCode:
             * 选择要打印的条码类型. (不同类型条码有字符限制或字符个数等限制，请参考具体标准) NarrowWidth:
             * 设置条码中窄单元的宽度,以点(dots)为单位. pHorizontal: 设置条码中宽单元的宽度,以点(dots)为单位.
             * pVertical: 设置条码高度,以点(dots)为单位. ptext: 选’N’ 对应 ASCII 值 78
             * 则不打印条码下面的人可识别文字,选’B’ 对应 ASCII 值 66 则打印条码下面的人可识别文字. pstr：一个长度为
             * 1-100 的字符串。
             */
            if (_pdirec == 1) {
                horizontal += 0.39;
            }
            if (flagHumanRead) {
                result = [_ptkSDK PTKDrawBarcode:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:_pdirec andCode:@"1" andNarrowWidth:_NarrowWidth andHorizontal:_WideWidth andVertital:[self InchToDots:height] andText:'B' andStr:content];
            } else {
                result = [_ptkSDK PTKDrawBarcode:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:_pdirec andCode:@"1" andNarrowWidth:_NarrowWidth andHorizontal:_WideWidth andVertital:[self InchToDots:height] andText:'N' andStr:content];
            }
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 1:
            result = [_ptkSDK PTKClearBuffer];// 清空缓存
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPcxGraphicsDel:@"*"];
            if (result != PTK_SUCCESS) {
                return false;
            }
            if (_pdirec == 1) {
                horizontal += 0.39;
            }
            if (flagHumanRead) {
                result = [_ptkSDK PTKDrawBarcode:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:0 andCode:@"1" andNarrowWidth:_NarrowWidth andHorizontal:_WideWidth andVertital:[self InchToDots:height] andText:'B' andStr:content];
            } else {
                result = [_ptkSDK PTKDrawBarcode:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:0 andCode:@"1" andNarrowWidth:_NarrowWidth andHorizontal:_WideWidth andVertital:[self InchToDots:height] andText:'N' andStr:content];
            }
            if (result != PTK_SUCCESS) {
                return false;
            }
            
            result = [_ptkSDK PTKPrintLabel:1 andCPNum:1];// 命令打印机执行打印工作
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 2:
            result = [_ptkSDK PTKClearBuffer];// 清空缓存
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPcxGraphicsDel:@"*"];
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 3:
            result = [_ptkSDK PTKPrintLabel:1 andCPNum:1];// 命令打印机执行打印工作
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        default:
            // Toast.makeText(myActivity.getApplicationContext(),
            // "PrintText()的第一个参数传入错误！", Toast.LENGTH_LONG).show();
            NSLog(@"PrintText()的第一个参数传入错误！");
            return false;
            // break;
    }
    if (result == PTK_SUCCESS) {
        return true;
    } else {
        return false;
    }
}

/**
 *
 * @param command
 *            0: 设置用户打印的内容。设置为该值时，本函数不能单独调用，必须配合参数为 2、3 一起使用。 1:
 *            在用户指定的某个坐标打印。设置为该值时，可以单独调用本函数。 2: 一页标签打印开始。
 *            设置为该值时，后续所有参数都被忽略。本函数不能单独调用，必须配合参数 0、3 一起使用。 3: 一页标签打印结束。
 *            设置为该值时，后续所有参数都被忽略。本函数不能单独调用，必须配合参数 0、2 一起使用。
 * @param darkness
 *            打印浓度，范围[0,30]。
 * @param horizontal
 *            打印横向位置，单位：英寸(inch)。
 * @param vertical
 *            打印纵向位置，单位：英寸(inch)。
 * @param height
 *            条码高度，单位：英寸(inch)。
 * @param sizeHumanRead
 *            人工识别字符的大小
 * @param fontface
 *            字体名称(手机里面必须存在该字体)
 * @param bold
 *            是否粗体，true表示粗体
 * @param content
 *            条码的内容。
 * @return 如果成功，返回值是true； 如果失败，返回值是false
 */
-(BOOL) DSPrintCode128Dispersion:(int) command andDarkness:(int)darkness andHorizontal:(double)horizontal andVertical:(double)vertical andHeight:(double) height andSizeHuman:(int)sizeHumanRead andFont:(UIFont *) fontface andBold:(BOOL) bold andContent:(NSString *) content {
    int result = -1;
    
    if (darkness >= 20) {
        darkness = 10;
    }
    result = [_ptkSDK PTKSetDarkness:darkness];// 设置黑度，取值范围：0—20，缺省为 10；
    if (result != PTK_SUCCESS) {
        return false;
    }
    
    switch (command) {
        case 0:
            /**
             * px: 设置 X 坐标,以点(dots)为单位. py: 设置 Y 坐标,以点(dots)为单位.
             * pdirec:选择条码的打印方向. 0—不旋转;1—旋转 90°; 2—旋转 180°; 3—旋转 270°. pCode:
             * 选择要打印的条码类型. (不同类型条码有字符限制或字符个数等限制，请参考具体标准) NarrowWidth:
             * 设置条码中窄单元的宽度,以点(dots)为单位. pHorizontal: 设置条码中宽单元的宽度,以点(dots)为单位.
             * pVertical: 设置条码高度,以点(dots)为单位. ptext: 选’N’ 对应 ASCII 值 78
             * 则不打印条码下面的人可识别文字,选’B’ 对应 ASCII 值 66 则打印条码下面的人可识别文字. pstr：一个长度为
             * 1-100 的字符串。
             */
            result = [_ptkSDK PTKDrawBarcode:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:0 andCode:@"1" andNarrowWidth:_NarrowWidth andHorizontal:_WideWidth andVertital:[self InchToDots:height] andText:'B' andStr:content];
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 1:
            result = [_ptkSDK PTKClearBuffer];// 清空缓存
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPcxGraphicsDel:@"*"];
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKDrawBarcode:[self InchToDots:horizontal] andPy:[self InchToDots:vertical] andDirec:0 andCode:@"1" andNarrowWidth:_NarrowWidth andHorizontal:_WideWidth andVertital:[self InchToDots:height] andText:'B' andStr:content];
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPrintLabel:1 andCPNum:1];// 命令打印机执行打印工作
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 2:
            result = [_ptkSDK PTKClearBuffer];// 清空缓存
            if (result != PTK_SUCCESS) {
                return false;
            }
            result = [_ptkSDK PTKPcxGraphicsDel:@"*"];
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        case 3:
            result = [_ptkSDK PTKPrintLabel:1 andCPNum:1];// 命令打印机执行打印工作
            if (result != PTK_SUCCESS) {
                return false;
            }
            break;
        default:
            // Toast.makeText(myActivity.getApplicationContext(),
            // "PrintText()的第一个参数传入错误！", Toast.LENGTH_LONG).show();
            NSLog(@"PrintText()的第一个参数传入错误！");
            return false;
            // break;
    }
    if (result == 0) {
        return true;
    } else {
        return false;
    }
}

/**
 * 设置条码默认值。 打印Code128时，wideToNarrowRatio请取值3.0
 * 如果条码的长度不符合要求，请先调用此方法，然后再调用PrintCode128方法。
 *
 * @param narrowBarWidth
 *            条码窄条宽度，narrowBarWidth ∈[1,10] 单位：点
 * @param wideToNarrowRatio
 *            宽条宽度与窄条宽度的比值，wideToNarrowRatio ∈[2.0,3.0] 按 0.1 递增
 * @return 如果成功，返回值为非零; 如果失败，返回值是零
 */
-(int) DSZPLSetBarcodeDefaults:(int)narrowBarWidth andWideToNarrowRatio:(double) wideToNarrowRatio {
    if ((narrowBarWidth < 1 || narrowBarWidth > 10) && (wideToNarrowRatio < 2.0 || wideToNarrowRatio > 3.0)) {
        return -1;
    }
    _NarrowWidth = narrowBarWidth;
    _WideWidth = (int) (narrowBarWidth * wideToNarrowRatio);
    if (_NarrowWidth > 0 && _WideWidth > 0) {
        return 0;
    } else {
        return -1;
    }
}

/**
 * 设置条码默认值。 打印Code128时，wideToNarrowRatio请取值3.0
 * 如果条码的长度不符合要求，请先调用此方法，然后再调用PrintCode128方法。
 *
 * @param narrowBarWidth
 *            条码窄条宽度，narrowBarWidth ∈[1,10] 单位：点
 * @param wideToNarrowRatio
 *            宽条宽度与窄条宽度的比值，wideToNarrowRatio ∈[2.0,3.0] 按 0.1 递增
 * @return 如果成功，返回值为非零; 如果失败，返回值是零
 */
-(int)DSSetBarcodeDefaults:(int) narrowBarWidth andWideToNarrowRatio:(double) wideToNarrowRatio {
    if ((narrowBarWidth < 1 || narrowBarWidth > 10) && (wideToNarrowRatio < 2.0 || wideToNarrowRatio > 3.0)) {
        return -1;
    }
    _NarrowWidth = narrowBarWidth;
    _WideWidth = (int) (narrowBarWidth * wideToNarrowRatio);
    if (_NarrowWidth > 0 && _WideWidth > 0) {
        return 0;
    } else {
        return -1;
    }
}

/**
 * 单位转换，将英寸转换为dot
 *
 * @param x
 *            英寸单位
 * @return dot单位
 */
-(int)InchToDots:(double)x {
    return (int) (x * 200);
}

/**
 * 统计字符串中空格的数目
 *
 * @param str
 *            字符串
 * @return 空格的数目
 */
-(int) countSpaceNum:(NSString *) str {
    int count = 0;
    
    int len = (int)str.length;
    int i = 0;
    while (++i < len) {
        if ([str characterAtIndex:i] == ' ') {
            count++;
        }
    }
    return count;
}

/**
 * 计算打印内容的长度
 *
 * @param text
 *            需要打印的内容
 * @return 打印内容的长度，单位:dot
 */
-(int) countTextLength:(NSString *)text{
    int length = 0;
    
    // nt f = new Font("宋体", Font.PLAIN, 12);
    // FontMetrics fm = FontDesignMetrics.getMetrics(f);
    // 高度
    // System.out.println(fm.getHeight());
    // 单个字符宽度
    // System.out.println(fm.charWidth('A'));
    // 整个字符串的宽度
    // System.out.println(fm.stringWidth(text));
    // length= fm.stringWidth(text);
    
    int unicodeCount = 0;
    int szCount = 0;
    int zmCount = 0;
    for (int i = 0; i < text.length; i++) {
        char c = [text characterAtIndex:i];
        if (c >= '0' && c <= '9') {
            szCount++;
        } else if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
            zmCount++;
        } else {
            unicodeCount++;
        }
    }
    
    if (szCount > 0) {
        length += round((szCount * 1.25 + (szCount - 1) * 0.5));
    }
    if (zmCount > 0) {
        length += round(zmCount * 1.25 + (zmCount - 1) * 0.5);
    }
    if (unicodeCount > 0) {
        length += round(unicodeCount * 3 + (unicodeCount / 3) * 0.5);
    }
    int spaceNum = [self countSpaceNum:text];
    if (spaceNum > 0) {
        length += spaceNum * 2;
    }
    
    return (int) round(length * 7.87);
}

/**
 * 获取字符串的宽度，单位像素
 *
 * @param text
 *            字符串
 * @return 字符串的宽度
 */
-(int) getTextWidth:(NSString*) text {
    CGSize sizeToFit = [text sizeWithFont:[UIFont systemFontOfSize:[UIFont systemFontSize]] constrainedToSize:CGSizeMake(CGFLOAT_MAX, 30) lineBreakMode:NSLineBreakByWordWrapping];
    return sizeToFit.width;
}

@end
