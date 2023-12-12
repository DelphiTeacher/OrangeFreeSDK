

/*!
 *  \~chinese
 *  该类是SDK3.0.0之前的版本，由于很多客户还是使用之前的SDK，优化接口后改动太大，就用一个类保留之前的接口
 *
 *  \~english
 *  This class is a version before SDK3.0.0. Since many customers still use the previous SDK, after optimizing the interface and making too much change, use a class to retain the previous interface.
 */


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTOldCommandCPCL : NSObject

@property(strong,nonatomic,readwrite) NSMutableData * _Nonnull cmdData;

@property (nonatomic, assign) NSStringEncoding encoding;

- (void)appendCommand:(NSString * _Nonnull)cmd;

- (void)appendCommandData:(NSData * _Nonnull)data;

/**
 打印机自检页 selfTest
 */
- (void)printSelfInspectionPage;

/**
 获取打印机状态 get printer status.
 */
- (void)cpclGetPaperStatus;

/**
 开关打印状态回调
 turn on/off print status callback.
 
 @param flag on/off
 */
- (void)cpclTurnOnPrintStatusCallBack:(BOOL)flag;

/**
 打开下划线
 Turn on underline
 */
- (void)cpclUnderlineON;

/**
 关闭下划线
 Turn off underline
 */
- (void)cpclUnderlineOFF;
- (void)cpclUtilitySession;

/** 行模式指令前缀 Command prefix of line mode */
- (void)cpclLineMode;
- (void)cpclReWindOFF;

/**
 获取打印机SN号 get printer serial number.
 */
- (void)cpclGetPrinterSN;

/**
 *   设置纸张类型1 Set the paper type
 *
 *  @param type      (0~5)
 0:连续纸 continuous paper
 1：标签纸 Label paper
 2：后黑标 Back black mark
 3：前黑标 Front black mark
 4：3寸黑标 3 inch black mark
 5：2寸黑标 2 inch black mark
 */
- (void)cpclPaperTypeWithType:(NSInteger )type;

/**
 *   设置纸张类型2 Set the paper type
 *
 *  @param type      (0~5)
 0:连续纸 continuous paper
 2：标签纸 Label paper
 4：2寸黑标 2 inch black mark
 5：3寸黑标 3 inch black mark
 6：4寸黑标 4 inch black mark
 */
- (void)setPrinterPaperTypeFor4Inch:(NSInteger)type;


/**
 Set Label
 
 @param offset The number of units to offset all fields from the left side of the label horizontally. 0-65535
 @param hRes The horizontal resolution of this label, expressed in dots per inch. 100 or 200
 @param vRes The vertical resolution of this label, expressed in dots per inch. 100 or 200
 @param height The height of the label in units. 0-65535
 @param quantity The number of copies of the label to print.  0-1024
 */
- (void)cpclLabelWithOffset:(NSInteger)offset
                       hRes:(NSInteger)hRes
                       vRes:(NSInteger)vRes
                     height:(NSInteger)height
                   quantity:(NSInteger)quantity;


/**
 Barcode
 
 @param type The type of barcode to print.
 @param width The width of a narrow bar.
 @param ratio The ratio of wide to narrow bars. 0-4，20-30
 @param height The height of the barcode.
 @param x The X position where the barcode begins
 @param y The Y position where the barcode begins
 @param barcode The data to be encoded into a barcode
 */
- (void)cpclBarcode:(NSString * _Nonnull)type
              width:(NSInteger)width
              ratio:(NSInteger)ratio
             height:(NSInteger)height
                  x:(NSInteger)x
                  y:(NSInteger)y
            barcode:(NSString * _Nonnull)barcode;

/**
 VBarcode
 
 @param type The type of barcode to print.
 @param width The width of a narrow bar.
 @param ratio The ratio of wide to narrow bars.
 @param height The height of the barcode.
 @param x The X position where the barcode begins
 @param y The Y position where the barcode begins
 @param barcode The data to be encoded into a barcode
 */
- (void)cpclBarcodeVertical:(NSString * _Nonnull)type
                      width:(NSInteger)width
                      ratio:(NSInteger)ratio
                     height:(NSInteger)height
                          x:(NSInteger)x
                          y:(NSInteger)y
                    barcode:(NSString * _Nonnull)barcode;


/**
 BarcodeQR
 
 @param xPos The X position where the barcode begins
 @param yPos The Y position where the barcode begins
 @param model The ratio of wide to narrow bars:1 or 2
 @param unitWidth Unit-width of the barcode in dots 范围是1-32,默认是6
 */
- (void)cpclBarcodeQRcodeWithXPos:(NSInteger)xPos
                             yPos:(NSInteger)yPos
                            model:(NSInteger)model
                        unitWidth:(NSInteger)unitWidth;

/**
 VBarcodeQR
 
 @param xPos The X position where the barcode begins
 @param yPos The Y position where the barcode begins
 @param model The ratio of wide to narrow bars:1 or 2
 @param unitWidth Unit-width of the barcode in dots
 */
- (void)cpclBarcodeQRcodeVerticalWithXPos:(NSInteger)xPos
                                     yPos:(NSInteger)yPos
                                    model:(NSInteger)model
                                unitWidth:(NSInteger)unitWidth;


/**
 QR Data
 
 @param data Data for barcode
 @param config Configuration options for barcode:MN:nunber,MA:Numbers or letters
 */
- (void)cpclBarcodeQRcodeData:(NSString * _Nonnull)data config:(NSString * _Nonnull)config;


/**
 The QR code terminator.
 */
- (void)cpclBarcodeQRcodeEnd;


/**
 BARCODE-TEXT
 
 @param font A font name or number to create the representation
 @param fontSize The size of the font: 0-999
 @param offset How far in units the text is from the barcode:0-999
 */
- (void)cpclBarcodeTextWithFont:(NSInteger)font
                       fontSize:(NSInteger)fontSize
                         offset:(NSInteger)offset;


/**
 BARCODE-TEXT
 
 @param font The filename of the TTF font with extension
 @param xScale The X size of the font, in dots: 0-999
 @param yScale The Y size of the font, in dots: 0-999
 @param offset How far in units the text is from the barcode: 0-999
 */
- (void)cpclBarcodeTextWithTrueTypeFont:(NSInteger)font
                                 xScale:(NSInteger)xScale
                                 yScale:(NSInteger)yScale
                                 offset:(NSInteger)offset;

/**
 off barcodeText
 */
- (void)cpclBarcodeTextOff;

/**
 *   绘制矩形 Draw rectangle
 *
 *  @param xPos      (0~65535)
 *  @param yPos      (0~65535)
 *  @param xEnd      (0~65535)
 *  @param yEnd      (0~65535)
 *  @param thickness (0~65535)
 */
- (void)cpclBoxWithXPos:(NSInteger)xPos
                   yPos:(NSInteger)yPos
                   xEnd:(NSInteger)xEnd
                   yEnd:(NSInteger)yEnd
              thickness:(NSInteger)thickness;

- (void)cpclCenterWithRange:(NSInteger)range;

- (void)cpclCenter;

- (void)cpclCompressedGraphicsWithImageWidth:(NSInteger)imageWidth
                                 imageHeight:(NSInteger)imageHeight
                                           x:(NSInteger)x
                                           y:(NSInteger)y
                                  bitmapData:(NSData * _Nonnull)bitmapData;

- (void)cpclConcatStartWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;
- (void)cpclConcatVerticalStartWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;

/** 字段拼接 Field combination */
- (void)cpclConcatTextWithFont:(NSInteger)font
                      fontSize:(NSInteger)fontSize
                        offset:(NSInteger)offset
                          text:(NSString * _Nonnull)text;

- (void)cpclConcatScaleTextWithScaledFont:(NSInteger)scaledFont
                                   xScale:(NSInteger)xScale
                                   yScale:(NSInteger)yScale
                                   offset:(NSInteger)offset
                                     text:(NSString * _Nonnull)text;

- (void)cpclConcatScaleTextVerticalWithScaledFont:(NSInteger)scaledFont
                                           xScale:(NSInteger)xScale
                                           yScale:(NSInteger)yScale
                                           offset:(NSInteger)offset
                                             text:(NSString * _Nonnull)text;

- (void)cpclConcatTextWithFontGroup:(NSInteger)fontGroup
                             offset:(NSInteger)offset
                               text:(NSString * _Nonnull)text;

- (void)cpclConcatEnd;
- (void)cpclPrint;
/** 反向打印 Reverse print */
- (void)cpclPoPrint;

/**
 反白框
 
 @param xPos 起点的x坐标
 @param yPos 起点的y坐标
 @param xEnd 终点的x坐标
 @param yEnd 终点的y坐标
 @param thickness 框的高度
 */
- (void)cpclInverseLineWithXPos:(NSInteger)xPos
                           yPos:(NSInteger)yPos
                           xEnd:(NSInteger)xEnd
                           yEnd:(NSInteger)yEnd
                      thickness:(NSInteger)thickness;

- (void)cpclLeft:(NSInteger)range;

- (void)cpclLeft;

- (void)cpclLineWithXPos:(NSInteger)xPos
                    yPos:(NSInteger)yPos
                    xEnd:(NSInteger)xEnd
                    yEnd:(NSInteger)yEnd
               thickness:(NSInteger)thickness;

- (void)cpclMoveWithRight:(NSInteger)right up:(NSString * _Nonnull)up;
- (void)cpclMultiLineStartWithLineHeight:(NSInteger)lineHeight;
- (void)cpclMultiLineEnd;
- (void)cpclPageWidth:(NSInteger)pageWidth;
- (void)cpclRight:(NSInteger)right;
- (void)cpclRight;
- (void)cpclRotate:(NSInteger)degrees;
- (void)cpclScaleText:(NSString * _Nonnull)scaledFont
               xScale:(NSInteger)xScale
               yScale:(NSInteger)yScale
                    x:(NSInteger)x
                    y:(NSInteger)y
                 text:(NSString * _Nonnull)text;

- (void)cpclScaleTextVertical:(NSString * _Nonnull)scaledFont
                       xScale:(NSInteger)xScale
                       yScale:(NSInteger)yScale
                            x:(NSInteger)x
                            y:(NSInteger)y
                         text:(NSString * _Nonnull)text;

- (void)cpclScaleToFit:(NSString * _Nonnull)scaleFont
                 width:(NSInteger)width
                height:(NSInteger)height
                     x:(NSInteger)x
                     y:(NSInteger)y
                  text:(NSString * _Nonnull)text;

/**
 设置字体加粗
 Set the font bold
 
 @param boldness bold value, 0 is not bold
 */
- (void)cpclSetBold:(NSInteger)boldness;

/**
 设置字间距
 Set character spacing
 
 @param spacing 字间距 character spacing
 */
- (void)cpclSetSpacing:(NSInteger)spacing;

/**
 设置字体放大倍数
 Set font magnification multiple
 
 @param width 宽度放大系数 magnification multiple of width
 @param height 高度放大系数 magnification multiple of height
 */
- (void)cpclSetMagWithWidth:(NSInteger)width height:(NSInteger)height;
- (void)cpclTempMove:(NSInteger)right up:(NSInteger)up;

/*
 font   english     chinese
 1      9x24        24x24
 2      8x24        24x24
 3      10x20       20x20
 4      16x32       32x32
 5      12x24       24x24
 7      12x24       24x24
 8      12x24       12x24
 20     8x18        18x18
 28     14x28       28x28
 55     8x16        16x16
 */

/*!
 *
 *  打印自动换行文本.
 *
 *  @param rotate       文字旋转方向:0、90、180、270
 *  @param font         字体：1、2、3、4、5、7、8、20、28、55
 *  @param fontSize     字体大小
 *  @param x            起始位置x
 *  @param y            起始位置y
 *  @param safeHeight   打印区域高度,超过高度部分不会打印
 *  @param width        打印区域宽度,宽度为0表示不自动换行
 *  @param lineSpacing  行间隔
 *  @param fontScale    字体放大倍数
 *  @param text         打印内容
 *  @return             自动换行后的实际打印高度
 *
 */
- (NSInteger)cpclAutoTextWithRotate:(NSInteger)rotate
                               font:(NSInteger)font
                           fontSize:(NSInteger)fontSize
                                  x:(NSInteger)x
                                  y:(NSInteger)y
                         safeHeight:(NSInteger)safeHeight
                              width:(NSInteger)width
                        lineSpacing:(NSInteger)lineSpacing
                          fontScale:(NSInteger)fontScale
                               text:(NSString * _Nonnull)text;

/*!
 *
 *  打印自动换行文本,此接口解决旋转90后打印居中文本,旋转90\270后，cpclCenter接口无效
 *
 *  @param rotate       文字旋转方向
 *  @param font         字体
 *  @param fontSize     字体大小
 *  @param xPos         起始位置x
 *  @param yPos         起始位置y
 *  @param center       是否居中
 *  @param safeHeight   打印区域高度,超过高度部分不会打印
 *  @param width        打印区域宽度,宽度为0表示不自动换行
 *  @param lineSpacing  行间隔.
 *  @param fontScale    字体放大倍数
 *  @param text         打印内容
 *  @return             自动换行后的实际打印高度
 */
- (NSInteger)cpclAutoTextWithRotate:(NSInteger)rotate
                               font:(NSInteger)font
                           fontSize:(NSInteger)fontSize
                               xPos:(NSInteger)xPos
                               yPos:(NSInteger)yPos
                             center:(BOOL)center
                         safeHeight:(NSInteger)safeHeight
                              width:(NSInteger)width
                        lineSpacing:(NSInteger)lineSpacing
                          fontScale:(NSInteger)fontScale
                               text:(NSString * _Nonnull)text;

/**
 Thai Auto
 
 @param font 0:big font 大字体 1:small font 小字体
 @param fontSize fontSize
 @param x x-coordinate of start point
 @param y y-coordinate of start point
 @param lineSpace Line spacing for automatic line feed 默认值30
 @param width Print width 默认0，若x+width大于页面宽度w的话,width=w-x
 @param text text
 */
- (void)cpclAutoThaiTextWithFont:(NSInteger)font
                        fontSize:(NSInteger)fontSize
                               x:(NSInteger)x
                               y:(NSInteger)y
                       lineSpace:(NSInteger)lineSpace
                           width:(NSInteger)width
                            text:(NSString * _Nonnull)text;


/**
 打印居中文本
 Print center text
 
 @param rotate 旋转角度 : rotation angle
 @param font 字号 暂时支持 1 2 3 4 8 55  :font size, temporarily supports 1 2 3 4 8 55
 @param fontSize 字体大小 : font size
 @param x 起点x坐标 : x-coordinate of start point
 @param y 起点y坐标 : y-coordinate of start point
 @param width 文本框宽度 : width of textbox
 @param text 文字内容 : content of text
 */
- (void)cpclCenterTextWithRotate:(NSInteger)rotate
                            font:(NSInteger)font
                        fontSize:(NSInteger)fontSize
                               x:(NSInteger)x
                               y:(NSInteger)y
                           width:(NSInteger)width
                            text:(NSString * _Nonnull)text;

/**
 打印文字
 Print text
 
 @param rotate 文字旋转角度 : rotation angle of text
 @param font 字体编号 : font number
 @param fontSize 字体大小 暂不可用 : font size, cannot be used temporarily
 @param x 起点x坐标 :  x-coordinate of start point
 @param y 起点y坐标 : y-coordinate of start point
 @param text 文字内容 : content of text
 */
- (void)cpclTextWithRotate:(NSInteger)rotate
                      font:(NSInteger)font
                  fontSize:(NSInteger)fontSize
                         x:(NSInteger)x
                         y:(NSInteger)y
                      text:(NSString * _Nonnull)text;


//反白
- (void)cpclTextReverseWithFont:(NSInteger)font
                       fontSize:(NSInteger)fontSize
                              x:(NSInteger)x
                              y:(NSInteger)y
                           text:(NSString * _Nonnull)text;
// 反白 加粗 Reverse  bold
/**
 | Font | Chinese   | ASCII character (English, number, etc.) |
 | Font | 中文   | ASCII字符（英文，数字等） |
 | ---- | ----- | --------------- |
 | 1    | 24*24 | 9*17            |
 | 2    | 24*24 | 8*16            |
 | 3    | 20*20 | 10*20           |
 | 4    | 32*32 | 16*32           |
 | 8    | 24*24 | 12*24           |
 | 55   | 16*16 | 8*16            |
 
 rotate: 0 90 180 270
 
 */
- (void)appendTextWithFont:(NSInteger)font
                    rotate:(NSInteger)rotate
                  fontSize:(NSInteger)fontSize
                   reverse:(BOOL)reverse
                      bold:(NSInteger)bold
                         x:(NSInteger)x
                         y:(NSInteger)y
                      text:(NSString * _Nonnull)text;

/**
 Set Background
 
 @param value 0~255,n=0:normal
 */
- (void)cpclSetBackground:(NSInteger)value;

/**
 set back text
 
 @param font 1,2,3,4,8,55
 @param rotate 0 90 180 270
 @param fontSize Size identifier for the font
 @param xPos x-coordinate of start point
 @param yPos y-coordinate of start point
 @param text The text data to be  printed
 */
- (void)cpclBackTextWithFont:(NSInteger)font
                      rotate:(NSInteger)rotate
                    fontSize:(NSInteger)fontSize
                        xPos:(NSInteger)xPos
                        yPos:(NSInteger)yPos
                        text:(NSString *_Nonnull)text;

/***************** Line Print Commands *******************/

- (void)cpclLineMargin:(NSInteger)offset;
- (void)cpclSetPositionWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;
- (void)cpclSetPositionWithXPos:(NSInteger)xPos;
- (void)cpclSetPositionWithYPos:(NSInteger)yPos;

/**
 lineFeed
 */
- (void)cpclLineFeed;
- (void)cpclContrast:(NSInteger)value;
- (void)cpclFeed:(NSInteger)amount;
- (void)cpclLabel;
- (void)cpclMulti:(NSInteger)quantity;
- (void)cpclNoPace;
- (void)cpclPace;
- (void)cpclPostFeed:(NSInteger)amount;
- (void)cpclPreFeed:(NSInteger)amount;
- (void)cpclReverse:(NSInteger)amount;
- (void)cpclSetFeed:(NSInteger)length skip:(NSInteger)skip;

/**
 set the maximum speed
 
 @param value 0-5
 */
- (void)cpclSpeed:(NSInteger)value;

//Take the paper to the next label
- (void)cpclForm;
- (void)cpclTone:(NSInteger)value;
- (void)cpclTurn:(NSInteger)degrees;
- (void)cpclFormFeed;

/****************** Utility and Diagnostic Commands ****************/
- (void)cpclAbort;
- (void)cpclOnFeed_Feed;
- (void)cpclOnFeed_Reprint;
- (void)cpclOnFeed_Ignore;
- (void)cpclReRun;
- (void)cpclWait:(NSInteger)duration;
- (void)cpclSetLabelPositionWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;
- (void)cpclSetLabelPositionWithXPos:(NSInteger)xPos;
- (void)cpclSetLabelPositionWithYPos:(NSInteger)yPos;

/****************** Codepage Commands ****************/
/**
 设置字符代码页
 SetCharacterCodePage
 
 @param codepage parameter
 eg:
 "USA" "FRANCE" "GERMANY" "UK" "DENMARK" "SWEDEN" "ITALY" "SPAIN" "JAPAN-S" "NORWAY" "DENMARK II" "SPAIN II" "LATIN9" "KOREA" "SLOVENIA" "CHINA" "BIG5" "CP874" "CP850" "CP437" "CP860" "CP863" "CP865" "CP866" "CP852" "CP858" "CP857" "CP737" "CP720" "CP775" "CP855" "CP862" "CP864" "ISO8859-6" "ISO8859-8" "ISO8859-9" "ISO8859-15" "WPC1252" "WPC1250" "WPC1251" "WPC1252" "WPC1254" "WPC1255" "WPC1256" "ISO8859-1" "ISO8859-2" "ISO8859-3" "ISO8859-4" "ISO8859-5" "TIS11" "TIS18"
 */
- (void)cpclSetCharacterCodePage:(NSString *_Nonnull)codepage;

/**
 阿拉伯语变形,设置后重启打印机
 
 @param function 48：关闭； 49：变形1，按单词排序；50：变形2，按短语排序；51：变形3，按完整规则排序
 */
- (void)cpclSetArabicTransformFunction:(NSInteger)function;

/**
 查询阿拉伯语变形状态，00 00：关闭； 01 00：变形1； 02 00：变形2； 03 00：变形3
 */
- (void)cpclGetArabicTransformStatus;

/**
 泰文变形开启
 
 @param status 48：close 49:open
 */
- (void)cpclSetThaiTransformStatus:(NSInteger)status;

/**
 越南语变形，设置后重启打印机
 
 @param function 48：关闭； 49：ASCII输入； 50：UTF-8输入
 */
- (void)cpclSetVietnameseTransformFunction:(NSInteger)function;

/**
 查询越南语变形状态，00 00：关闭； 01 00：ASCII输入； 02 00：UTF-8输入；
 */
- (void)cpclGetVietnameseTransformStatus;


/// 升级打印机固件
/// @param data 固件数据
- (void)updatePrinterFirmwareWithData:(NSData *_Nonnull)data;

@end

NS_ASSUME_NONNULL_END
