/*!
 *  \~chinese
 *  @header PTCommandESC.h
 *  @abstract ESC指令
 *
 *  \~english
 *  @header PTCommandESC.h
 *  @abstract ESC Command
 */

#import <Foundation/Foundation.h>
#import "PTBitmapManager.h"

typedef NS_ENUM(NSInteger, ESCText) {
    
    ESCTextNormal = 0,
    ESCTextMini = 1,
    ESCTextBold = 8,
    ESCTextDoubleHeight = 16,
    ESCTextDoubleWidth = 32,
    ESCTextUnderline = 128,
};

typedef NS_ENUM(NSInteger, ESCBarcode) {

    ESCBarcodeB_UPCA    = 65,
    ESCBarcodeB_UPCE    = 66,
    ESCBarcodeB_EAN13   = 67,
    ESCBarcodeB_EAN8    = 68,
    ESCBarcodeB_CODE39  = 69,
    ESCBarcodeB_ITF     = 70,
    ESCBarcodeB_CODEBAR = 71,
    ESCBarcodeB_CODE93  = 72,
    ESCBarcodeB_CODE128 = 73,
};


/**
 *  ESC-POS 指令集:大约200个生成指令的函数。
 *  ESC-POS command set: about 200 functions which generated into command
 */
@interface PTCommandESC : NSObject

/**
 *   字符串编码格式，默认kCFStringEncodingGB_18030_2000
 *   Encoding format of character string, default is kCFStringEncodingGB_18030_2000
 */
@property (nonatomic, assign) NSStringEncoding encoding;

@property (nonatomic, strong) NSMutableArray *cmdQueue;

- (void)initCommandQueue;

- (void)appendCommandData:(NSData *)cmdData;

- (NSData *)getCommandData;

- (void)appendText:(NSString *)text;

/**
 最开始调用这个接口，目的修复打印乱码问题
 */
- (void)appendZeroData;

/**
 get printer status
 第一个字节：第2位是1时开盖，0的时候合盖
 第二个字节：第5、6位都是1的时候缺纸，否则是有纸
 */
- (void)getPrinterStatus;

/** 打印自检页
 *  Print SelfTest
 */
- (void)printSelfTest;

/** 打印并走纸一行
 *  Print and feed one line
 */
- (void)printAndLineFeed;

/** 回车 Carriage return */
- (void)printAndCarriageReturn;

/**
 打印状态回调开关
 automatic return
 
 @param flag true:开启自动回传状态 false：关闭自动回传
 */
- (void)turnOnPrintStatusCallBack:(BOOL)flag;

/**
 *  page 73. 打印并走纸
 *  Print and feed paper
 *  @param offset (0~255)
 */
- (void)printAndFeed:(NSInteger)offset;

/**
 *  page 76. 打印并回纸
 *  Print and retreat paper
 *  @param offset (0~48)
 */
- (void)printAndReverseFeed:(NSInteger)offset;

/**
 *  page 78. 打印并向前走纸n行
 *  Print and feed n lines forward
 *  @param lines (0~255)
 */
- (void)printAndFeedLines:(NSInteger)lines;

/**
 *  page 80. 打印并回纸n行
 *  Print and retreat n line
 *  @param lines (0~2)
 */
- (void)printAndReverseFeedLines:(NSInteger)lines;

/**
 *  page 83. 设置默认行距
 *  Set line spacing default
 */
- (void)setLineSpacingDefault;

/**
 *  page 85. 设置行距
 *  Set line spacing
 *  @param spacing (0~255)
 */
- (void)setLineSpacing:(NSInteger)spacing;

#pragma mark Character Commands

/**
 *  page 91. 设置右边字符间隔
 *  Set character spacing on the right
 *  @param spacing (0~255)
 */
- (void)setRightCharacterSpacing:(NSInteger)spacing;

/** page 93. 设置打印字体模式
 *  Set print font mode
 */
- (void)setTextMode:(ESCText)mode;
/**
 *  page 93. 设置富文本样式，可叠加效果，比如粗体字和下划线
    Set text mode, the effect can be overlapped, like bold and underline
 */
- (void)setTextStyleMini:(BOOL)mini
                    bold:(BOOL)bold
             doubleWidth:(BOOL)doubleWidth
            doubleHeight:(BOOL)doubleHeight
               underline:(BOOL)underline;

/**
 *  page 93 添加文本，并设置字体形式
 *  Add text and set text form
 *
 *  @param text text string
 *  @param mode ESCText
 */
- (void)appendText:(NSString *)text mode:(ESCText)mode;

/**
 *  page 98. 设置或取消字符设置
 *  Set or cancel character setting
 *  n = 0, character set cancel     [default]
 *  n = 1, character set selected
 *  @param set (0~1)
 */
- (void)setUserDefinedCharacterSet:(NSInteger)set;

/**
 *  page 99. 定义用户已设定的字符
 *  Define user-defined character
 *  @param codeStart (32~126)
 *  @param codeEnd   (32~126)
 *  @param horizontal (data.length = 3*horizontal)
 *  @param data (0~255)
 */
- (void)defineCharactersWithCodeStart:(NSInteger)codeStart
                              codeEnd:(NSInteger)codeEnd
                           horizontal:(NSInteger)horizontal
                                 data:(NSData *)data;

/**
 *  page 104. 下划线模式开关
 *  Underline mode ON/OFF
 *  0,48 turns off underline mode
 *  1,49 turns on underline mode (1-dot thick)
 *  2,50 turns on underline mode (2-dots thick)
 *  @param underline (0~2,48~50)
 */
- (void)setUnderline:(NSInteger)underline;

/**
 *  page 106. 取消用户已设定的字符
 *  Cancel user-defined character
 *  @param n (32~126)
 */
- (void)cancelUserDefinedCharacters:(NSInteger)n;

/**
 *  page 108. 字符加粗开关
 *  Character bold ON/OFF
 *  n = 0 [default]
 *  @param bold (0~255)
 */
- (void)setBold:(NSInteger)bold;

/**
 *  page 109. 字符黑体字开关
 *  Character black ON/OFF
 *  n = 0 [default]
 *
 *  @param doubleStrike (0~255)
 */
- (void)setDoubleStrike:(NSInteger)doubleStrike;

/**
 *  page 110. 设置字符字体类型
 *  Set character font type
 *  @param font (0~1) 0:fontA 1:fontB
 */
- (void)setCharacterFont:(NSInteger)font;

/** ESC R
 *  page 115. 设置国际字符设定
 *  Set International character set
 *  @param set (n<=15)
 */
- (void)setInternationalCharacterSet:(NSInteger)set;

/** ESC V
 *  page 117. 顺时针旋转90度开关
 *  90° clockwise ON/OFF
 *  @param mode (0~2),(48~50)
 */
- (void)setVerticalMode:(NSInteger)mode;

/** ESC r
 * page 119. 设置打印颜色
 *  Set print color
 * n = 0 [default]
 * 0,48 black
 * 1,49 red
 *  @param color (0,1,48,49)
 */
- (void)setPrintColor:(NSInteger)color;

/** ESC t
 *  page 121. 设置字符编码表 for Portable machine
 *  Set character encoding table
 *
 *  @param table (0~5),(13-21),(26),(32-34)(36,37),(39,40),(45-52)
 */
- (void)setCharacterCodeTable:(NSInteger)table;

/// codepage,for POS Printer
/// @param codepage (0~5),(13~21),26,32-34,36,37,39-40,45-52
- (void)setPrinterCodepage:(NSInteger)codepage;

/**
 字符变形
 Character Transform
 
 @param mode 0：close；1：变形，按单词排序 2：变形，按短语排序 3：变形，按完整规则排序
 */
- (void)setCharacterTransformMode:(NSInteger)mode;

/** 进入保存模式 */
- (void)enterPrinterSaveMode;

/** 退出保存模式 */
- (void)exitPrinterSaveMode;

/** 获取越南语变形模式 00 00：为关 01 00：ASCII输入，02 00：utf-8输入 */
- (void)getVietnamTransformMode;

/** 设置越南语变形模式,设置后重启打印机 48：为关 49：ASCII输入，50：utf-8输入 */
- (void)setVietnamTransformMode:(NSInteger)mode;

/**
 泰文变形开启
 
 @param status 48：close 49:open
 */
- (void)setThaiTransformStatus:(NSInteger)status;

/**
 language mode
 设置简体中文/英文/繁体中文模式
 
 @param mode 0:SimplifiedChinese 1:English 2:TraditionalChinese
 */
- (void)setPrinterLanguageMode:(NSInteger)mode;

/** ESC {
 *  page 124. 颠倒打印开关
 *  Reverse print ON/OFF
 *  @param mode (0~255)
 */
- (void)setUpToDownMode:(NSInteger)mode;

#pragma mark GS ( N

/** GS ( N
 *  page 128. 设置字符颜色
 *  Set character color
 *  color = 49 [default]
 *
 *  @param color (58~51)
 */
- (void)setCharacterColor:(NSInteger)color;

/** GS ( N
 *  page 130. 设置背景颜色
 *  Set background color
 *  m = 48 [default]
 *  48 none; 49 clolor1; 50 color2; 51 color3
 *  @param color (48~51)
 */
- (void)setBackgroundColor:(NSInteger)color;

/** GS ( N
 *  page 132. 阴影模式开关
 *  Shadow mode ON/OFF
 *
 *  @param mode (0,1,48,49)
 *  @param color (48~51) 48 none; 49 clolor1; 50 color2; 51 color3
 */
- (void)setShadowMode:(NSInteger)mode color:(NSInteger)color;

/** GS !
 *  page 134. 设置字符大小
 8  Set character size
 *  n = 0 [default]
 */
- (void)setCharacterSize:(NSInteger)size;
- (void)setCharacterWidth:(NSInteger)width height:(NSInteger)height;

/**
 Set character size
 选择字符大小

 @param size 0-13  2x2:fontB 3x3:fontA
 0:2x2mm,1:3x3mm,2:4x4mm,3:6x6mm,4:8x8mm,5:9x9mm,6:10x10mm
 7:12x12mm,8:14x14mm,9:15x15mm,10:16x16mm,11:18x18mm,12:21x21mm,13:24x24mm
 */
- (void)setCharacterMultipleSize:(NSInteger)size;


/// 设置中文的思源字体大小
/// @param size 字体大小:size = 33(42dot) ,34(36dot), 35(32dot)
- (void)setChineseSesBlackFontWithSize:(NSInteger)size;

/// 设置英文的思源字体大小
/// @param size 字体大小size = 33(42dot) ,34(36dot), 35(32dot)
- (void)setEnglishSesBlackFontWithSize:(NSInteger)size;

/** GS B
 * page 136. 黑白反向打印模式
 *  Black and white reverse print mode
 *  n = 0 [default]
 *
 *  @param reverse (0~255)
 */
- (void)setReverse:(NSInteger)reverse;

/** GS b
 *  page 138. 平滑模式开关
 *  Smooth mode ON/OFF
 *  mode = 0 [default]
 *
 *  @param smooth (0~255)
 */
- (void)setSmooth:(NSInteger)smooth;

#pragma mark Panel Button Commands

/**
 *  page.140 激活/关闭面板按钮
 *  Enable / disable panel button
 *  n = 0 enable [default]
 *  n = 1 disable
 *
 *  @param mode (0~255)
 */
- (void)setPanelButtonMode:(NSInteger)mode;

/**
 *  page 145. 是否使用纸尽传感器
 *  Whether to use paper out sensor
 */
- (void)enableOutPaperSensor:(BOOL)enable;

/**
 *  page 147. 设置停止打印传感器
 *  Set stop print sensor
 */
- (void)enableStopPrintSensor:(BOOL)enable;

#pragma mark Print Positioin Commands(Page Mode)

/** 打印并回到标准模式
 *  Print and return to standard mode
 */
- (void)printAndReturnStandardMode;

/** 在页模式下取消打印数据
 *  Cancel print data in page mode
 */
- (void)cancelPrint;

/** 在页模式下打印数据
 *  Print data in page mode
 */
- (void)printDataInPageMode;

/// 定位到下个缝标，行模式下使用
- (void)setPrinterAutomaticPosition;

/// 定位到下个缝标，页模式下使用
- (void)positionNextLabel;

/**
 *  page 151. 横向跳格
 *  Set horizontal tab
 */
- (void)setHorizontalTab;

/**
 *  page 152. 设置绝对打印位置
 *  Set absolute print position
 *
 *  @param position 0-255
 */
- (void)setAbsolutePosition:(NSInteger)position;

/**
 *  page 154. 设置横向跳格位置
 *  Set horizontal tab position
 */
- (void)setHorizontalTabPositionsData:(NSData *)data;

/**
 *  page 156. 在页模式下设置打印方向
 *  Set print direction in page mode
 *  0,48 left to right
 *  1,49 bottom to top
 *  2,50 right to left
 *  3,51 top to bottom
 
 *  @param direction (0~3),(48~51)
 */
- (void)pageSetPrintDirection:(NSInteger)direction;

/**
 *  page 158. 在页模式下设置打印区域
 *  Set print area in page mode
 *
 *  @param xPos (0~65535)
 *  @param yPos   (0~65535)
 *  @param width      (0~65535)
 *  @param height     (0~65535)
 */
- (void)pageSetPrintAreaWithXPos:(NSInteger)xPos
                            yPos:(NSInteger)yPos
                           width:(NSInteger)width
                          height:(NSInteger)height;

/**
 *  page 163. 设置相对打印位置
 *  Set relative print position
 *
 *  @param position (-32768 ~ 32767)
 */
- (void)setRelativePosition:(NSInteger)position;

/**
 *  page 165. 设置对齐方式
 *  Set justification
 *  n = 0 [default]
 *  0,48 left justification
 *  1,49 centered
 *  2,50 right justification
 *
 *  @param justification (0~2),(48~50)
 */
- (void)setJustification:(NSInteger)justification;

/**
 *  page 167. 在页模式下设置绝对垂直打印位置
 *  Set absolute vertical print position in page mode
 *  @param yPos (0~65535)
 */
- (void)pageSetAbsoluteYPos:(NSInteger)yPos;

/**
 *  page 169. 设置左边空白宽度
 *  Set left margin width
 *  @param left 左对齐 (0~65535)
 */
- (void)setLeftMargin:(NSInteger)left;

/**
 *  page 171. 设置起始打印行位置
 *  Set start print position
 *  0,48 cancel data in the current print buffer.
 *  1,49 print data in the current print buffer.
 *
 *  @param mode (0,1,48,49)
 */
- (void)setLinePrintPositionMode:(NSInteger)mode;

/**
 *  page 173. 设置打印区域宽度
 *  Set print area width
 *  @param width (0~65535)
 */
- (void)setPrintAreaWidth:(NSInteger)width;

/**
 *  page 177. 在页模式下设置相对垂直打印位置
 *  Set relative vertical print position in page mode
 *  @param yPos (-32767 ~ 32768)
 */
- (void)pageSetRelativeYPos:(NSInteger)yPos;

#pragma mark Bit Image Commands

/**
 *  page 180. 设置位图模式
 *  Set bitmap mode
 *  @param mode  (0~1),(31~32)
 *  @param width (1~2047)
 *  @param data  (0~255)
 */
- (void)setImageMode:(NSInteger)mode imageWidth:(NSInteger)width data:(NSData *)data;

/**
 *  page 194. 打印NV位图
 *  Print NV bitmap
 *  @param imageID (1~255)
 *  @param mode (0,48:Normal),(1,49:Double-width),(2,50:Double-height),(3,51:Quadruple)
 */
- (void)setNVBitImage:(NSInteger)imageID Mode:(NSInteger)mode;

/**
 *  page 210. 传输NV图形内存容量
 *  Transmit NV graphic memory size
 *  @param size 0,48
 */
- (void)setNVGraphicsMemorySize:(NSString *)size;

/**
 *  page 212. 设置图形点密度标准
 *  Set graphic dot density
 *  @param fn 1,49
 *  @param x  50,51
 */
- (void)setGraphicDotDensity:(NSInteger)fn x:(NSInteger)x;

/**
 *  page 214. 打印在打印缓存的图形数据
 *  Print graphic data in buffer
 *  @param fn 2,50
 */
- (void)printBufferGraphic:(NSInteger)fn;

/**
 *  page 215. 传输NV图形内存剩余容量
 *  Transmit graphic remaining memory
 *  @param fn 3,51
 */
- (void)transmitGraphicRemainingMemory:(NSInteger)fn;

/**
 *  page 216. 传输下载图形内存的剩余容量
 *  Transmit downloaded graphic remaining memory
 *  @param fn 4,52
 */
- (void)transmitDownloadGraphicRemainingMemory:(NSInteger)fn;

/**
 *  page 218. 传输已定义NV图形键值表
 *  Transmit defined NV graphic key code list
 */
- (void)transmitNVGrapihcKeyCodeList;

/**
 *  page 220. 删除所有NV图形数据
 *  Delete all the NV graphic data
 */
- (void)deleteNVGraphicAll;

/**
 *  page 221. 删除指定的NV图形数据
 *  Delete the defined NV graphic data
 *  @param keycode1 (32~126)
 *  @param keycode2 (32~126)
 */
- (void)deleteNVGraphicWithKeycode1:(NSInteger)keycode1 keycode2:(NSInteger)keycode2;

/**
 *  page 222. 定义NV像素图图形数据
 *  Define raster NV graphic data
 *  @param keycode          (32~126)
 *  @param keycode2          (32~126)
 *  @param imageWidth  (1~8192)
 *  @param imageHeight (1~2304)
 *  @param data    imageData
 */
- (void)defineRasterNVGraphicData:(NSData *)data
                          keycode:(NSInteger)keycode
                         keycode2:(NSInteger)keycode2
                       imageWidth:(NSInteger)imageWidth
                      imageHeight:(NSInteger)imageHeight;

/**
 *  page 227. 定义所有NV纵列图形数据
 *  Define column NV graphic data
 *  @param keycode     (32~126)
 *  @param keycode2    (32~126)
 *  @param imageWidth  (1~8192)
 *  @param imageHeight (1~2304)
 *  @param data   imageData
 */
- (void)defineColumnNVGraphicData:(NSData *)data
                          keycode:(NSInteger)keycode
                         keycode2:(NSInteger)keycode2
                       imageWidth:(NSInteger)imageWidth
                      imageHeight:(NSInteger)imageHeight;

/**
 *  page 231. 打印指定的NV图形数据
 *  Print specified NV graphic data
 *  @param keycode      (32~126)
 *  @param keycode2     (32~126)
 *  @param xScale   1,2
 *  @param yScale  1,2
 */
- (void)printNVGraphicWithKeycode:(NSInteger)keycode
                         keycode2:(NSInteger)keycode2
                           xScale:(NSInteger)xScale
                           yScale:(NSInteger)yScale;

/**
 *  page 238. 传输已定义下载图形键值表
 *  Transmit defined downloaded graphic key code list
 */
- (void)transmitGraphicKeycodeList;

/**
 *  page 240. 删除所有NV图形数据 Delete all the NV graphic data
 */
- (void)deleteDownloadedNVGraphicAll;

/**
 *  page 241. 打印指定的NV图形数据 Print defined NV graphic data
 *
 *  @param keycode (32~126)
 *  @param keycode2 (32~126)
 */
- (void)deleteDownloadedNVGraphicKeycode:(NSInteger)keycode keycode2:(NSInteger)keycode2;

/**
 *  page 242. 定义已下载的光栅格式图形数据
 *  Defined downloaded raster NV graphic data
 *  @param keycode         (32~126)
 *  @param keycode2         (32~126)
 *  @param imageWidth  (1~8192)
 *  @param imageHeight (1~2304)
 *  @param data   imageData
 */
- (void)defineDownloadedRasterNVGraphicData:(NSData *)data
                                    keycode:(NSInteger)keycode
                                   keycode2:(NSInteger)keycode2
                                 imageWidth:(NSInteger)imageWidth
                                imageHeight:(NSInteger)imageHeight;

/**
 *  page 246. 定义已下载的列格式图形数据
 *  Define downloaded column NV graphic data
 *  @param keycode         (32~126)
 *  @param keycode2         (32~126)
 *  @param imageWidth  (1~8192)
 *  @param imageHeight (1~2304)
 *  @param data   imageData
 */
- (void)defineDownloadedColumnNVGraphicData:(NSData *)data
                                    keycode:(NSInteger)keycode
                                   keycode2:(NSInteger)keycode2
                                 imageWidth:(NSInteger)imageWidth
                                imageHeight:(NSInteger)imageHeight;

/**
 *  page 250. 打印指定下载的NV图形数据 a
 *  Print specified downloaded NV graphic dat
 *
 *  @param keycode         (32~126)
 *  @param keycode2         (32~126)
 */
- (void)printDownloadedNVGraphicWithKeycode:(NSInteger)keycode
                                   keycode2:(NSInteger)keycode2
                                     xScale:(NSInteger)xScale
                                     yScale:(NSInteger)yScale;

/**
 *  page 252. 在打印缓存像素图储存图形数据 Store raster graphic data in print buffer
 *  Users have the option of specifying horizontal(times bx) * vertical(times by) size setting for the selected data.
 *  @param xScale          (1~2)
 *  @param yScale          (1~2)
 *  @param imageWidth  (1~2047)
 *  @param imageHeight (1~1662,831,415)
 *  @param data   imageData
 */
- (void)storeRasterGraphicData:(NSData *)data
                        xScale:(NSInteger)xScale
                        yScale:(NSInteger)yScale
                    imageWidth:(NSInteger)imageWidth
                   imageHeight:(NSInteger)imageHeight;

/**
 *  page 261. 在打印缓存纵列储存的图形数据 Store column graphic data in print buffer
 *  Users have the option of specifying horizontal bx * vertical by size setting for the selected data.
 *  @param xScale          (1~2)
 *  @param yScale          (1~2)
 *  @param imageWidth  (1~2047)
 *  @param imageHeight (1~1662,831,415)
 *  @param data   imageData
 */
- (void)storeColumnGraphicData:(NSData *)data
                        xScale:(NSInteger)xScale
                        yScale:(NSInteger)yScale
                    imageWidth:(NSInteger)imageWidth
                   imageHeight:(NSInteger)imageHeight;

/**
 *  page 264. 定义NV位图 Define NV bitmap
 *  Defines the NV bit image in the NV graphics area.
 *  @param number    (1~255)
 */
- (void)defineNVGraphicData:(NSData *)data number:(NSInteger)number;

/**
 *  page 268. 打印像素图位图
 *  Print raster bitmap
 *  @param image  source image
 *  @param mode   binary/dithering
 *  @param compress TIFF/ZPL2/None
 *  @param package  Whether the data is subcontracted
 *
 */
- (void)appendRasterImage:(CGImageRef)image mode:(PTBitmapMode)mode compress:(PTBitmapCompressMode)compress package:(BOOL)package;

/**
 *  page 273. 定义下载位图 Defined downloaded bitmap
 *
 *  @param widthBytes  (1~255)
 *  @param heightBytes    (1~255)
 *  @param imageData        imageData
 */
- (void)defineDownloadedImage:(NSData *)imageData
                   widthBytes:(NSInteger)widthBytes
                  heightBytes:(NSInteger)heightBytes;

/**
 *  page 276. 打印已下载的位图
 *  Print downloaded bitmap
 *  (0,48:Normal),(1,49:Double-width),(2,50:Double-height),(3,51:Quadruple)
 *
 *  @param scale (0~3),(48~51)
 */
- (void)printDownloadedImageWithScale:(NSInteger)scale;

#pragma mark Status Commands

/**
 *  page 288. 传输实时状态
 *  Transmit real-time status
 *  @param status (1~4),(7~8) 一般选2，4
 */
- (void)transmitRealTimeStatus:(NSInteger)status;

/**
 *  page 305. 传输外部设备状态
 *  Transmit peripheral device status
 *  @param status (0,48)
 */
- (void)transmitPeripheralDeviceStatus:(NSInteger)status;

/**
 *  page 306. 传输纸张传感器状态
 *  Transmit paper sensor status
 */
- (void)transmitPaperSonsorStatus;

/**
 *  page 308. 激活/关闭自动返回状态
 *  Enable/disable automatic status back (ASB)
 */
- (void)setASBStatusWithDrawer:(BOOL)drawer
                       offline:(BOOL)offline
                         error:(BOOL)error
                     rollPaper:(BOOL)rollPaper
                   panelSwitch:(BOOL)panelSwitch;

/**
 *  page 322. 激活/关闭油墨自动返回状态
 *  Enable/disable ink automatic status back (ASB)
 */
- (void)setInkASBWithOffline:(BOOL)offline detection:(BOOL)detection;

/**
 *  page 327. 传输状态
 *  Transmit status
 * 1,49: transmits paper sensor status
 * 2,50: transmits drawer kick-out connector status
 * 4,52: transmits ink status
 *
 *  @param status (1,2,4,49,50,52)
 */
- (void)transmitStatus:(NSInteger)status;

#pragma mark Bar Code Commands


/**
 *  page 334. 设置打印条码数字字体
 *  Set font of bar code number
 *  0,48 font a
 *  1,49 font b
 *  2,50 font c
 *
 *  @param font (0~2),(48~50)
 */
- (void)setHRIFont:(NSInteger)font;

/**
 *  @param justification    page 165. 对齐方式justification       Value0,1,2 : left、center、right
 *  @param type             page 339. Value：(A:0~6),(B:65~73)
 *  @param width            page 355. Value：(2~6),(68~76)
 *  @param height           page 337. Value：(1~255)
 *  @param hri     page 332. Value：(0~3),(48~51):无字体，字体在上面、字体在下面、上下都有字体
 *  @param data          page 339.
 */
- (void)appendBarcode:(ESCBarcode)type
                 data:(NSString *)data
        justification:(NSInteger)justification
                width:(NSInteger)width
               height:(NSInteger)height
                  hri:(NSInteger)hri;

#pragma mark Macro Function Commands

/**
 *  page 360. 开始或结束宏定义
 *  Start or end macro
 */
- (void)defineMacro;

/**
 *  page 362. 执行宏操作
 *  Executes a macro 'times' while 'wait_times' * 100 msec for each macro execution,using the mode specified by 'mode' as follows.
 *
 *  @param times      (1~255)
 *  @param waitTimes (0~255)
 *  @param mode       (0,1)
 */
- (void)executeMacroWithTimes:(NSInteger)times
                    waitTimes:(NSInteger)waitTimes
                         mode:(NSInteger)mode;

#pragma mark Mechanism Control Commands

/**
 *  page 366. 返回主页
 *  Return to homepage
 */
- (void)returnHome;

/**
 *  page 367. 打开/关闭单向打印模式
 *  Turn on/off unidirectional print mode
 *
 *  @param mode (0~255)
 */
- (void)setUnidirectionalPrintMode:(NSInteger)mode;

/**
 *  page 368. 局部切纸
 *  Partial cut
 */
- (void)setPartialCut1;

/**
 *  page 370. 局部切纸
 *  Partial cut
 */
- (void)setPartialCut3;

/// Partial
/// 半切
- (void)setPartialCut;

/// Full
/// 全切
- (void)setFullCut;

/// 打印并半切距离
/// @param distance distance = 15mm + n * 0.0625
- (void)setPartialCutWithDistance:(NSInteger)distance;

/// 打印并全切距离
/// @param distance distance = 15mm + n * 0.0625
- (void)setFullCutWithDistance:(NSInteger)distance;

/**
 *  page 372. 设置剪纸模式并剪纸
 *  Set cut mode and cut the paper
 *
 *  @param mode     (0,1,48,49)
 *  @param distance (0~255)
 */
- (void)setCutMode:(NSInteger)mode distance:(NSInteger)distance;


/// kick Cashdrawer/弹出钱箱
/// @param number 0-2  0:1#  1:2#  2:all
- (void)kickCashdrawer:(NSInteger)number;


/// get Cashdrawer status: 1--close  0--open
- (void)getPrinterCashdrawerStatus;


// 如果打印机没有开启黑标功能，那么下面的几条指令可以帮助你
// If the printer does not have the black mark function enabled, then the following instructions can help you
#pragma mark Black mark Commmands

/// 设置是否开启黑标
/// @param status 0：close   1：open
- (void)setPrinterBlackMarkStatus:(NSInteger)status;

/// 设置黑标是否开启自动定位
/// @param location 0：close   1：open
- (void)setPrinterBlackMarkAutoLocation:(NSInteger)location;

/// 设置黑标自动定位后是否切刀
/// @param location 0：close   1：open
- (void)setPrinterBlackMarkCutAfterAutoLocation:(NSInteger)location;

#pragma mark Miscellaneous Commands

/**
 *  page 380. 发送实时请求
 *  Send real-time request
 *
 *  @param request (1~2)
 */
- (void)sendRealTimeRequest:(NSInteger)request;

/**
 *  page 385. 实时脉冲
 *  Real-time pulse
 *
 *  @param mode 0,1
 *  @param time (1~8)
 */
- (void)generatePulseWithMode:(NSInteger)mode Time:(NSInteger)time;

/**
 *  page 388. 执行关机事件
 *  Execute power off sequence
 */
- (void)executePowerOffSequence;

/**
 *  page 391. 实时传输指定状态
 *  Transmit specified status in real time
 *
 *  @param status 1,5
 */
- (void)transmitSpecifiedStatus:(NSInteger)status;

/**
 *  page 396. 清除缓存
 *  Clear buffer
 */
- (void)clearBuffer;

/**
 *  page 405
 *
 *  @param times (0~63)
 *  @param t1    (0~255)
 *  @param t2    (0~255)
 */
- (void)escBeepIntegratedBeeperWithTimes:(NSInteger)times T1:(NSInteger)t1 T2:(NSInteger)t2;

/**
 *  page 406
 *
 *  @param a     (48~51)
 *  @param times 0,255
 *  @param t1    (1~50,255)
 *  @param t2    (1~50)
 */
- (void)escSetIntegratedBeeperWhenOfflineFactorsOccurA:(NSInteger)a Times:(NSInteger)times T1:(NSInteger)t1 T2:(NSInteger)t2;

/**
 *  page 408
 *
 *  @param times 0,255
 *  @param t1    (1~50,255)
 *  @param t2    (1~50)
 */
- (void)escSetIntegratedBeeperExceptWhenOfflineFactorsOccurWithTimes:(NSInteger)times T1:(NSInteger)t1 T2:(NSInteger)t2;

/**
 *  page 410. 设置外围设备
 *  Select peripheral device
 *  1,3 enables printer
 *  2   disables printer
 *
 *  @param mode (1~3)
 */
- (void)escSelectPeripheralDevice:(NSInteger)mode;

/**
 *  page 412. 初始化打印机
 *  Initialize printer
 */
- (void)initializePrinter;

/**
 *   清空打印机缓存
 *   clear buffers
 */
- (void)clearPrinterBuffer;

/**
 *  page 413. 设置页模式
 *  Set page mode
 */
- (void)setPageMode;

/**
 *  page 416. 设置标准模式
 *  Set standard mode
 */
- (void)setStandardMode;

/**
 *  page 418. 发射脉冲
 *  Generate pulse pin mode
 *  0,48: drawer kick-out connector pin 2
 *  1,49: drawer kick-out connector pin 5
 *
 *  @param pin_mode 0,1,48,49
 *  @param on_time  (0~255)
 *  @param off_time (0~255)
 */
- (void)escGeneratePulsePinMode:(NSInteger)pin_mode ONTime:(NSInteger)on_time OFFTime:(NSInteger)off_time;

/**
 *  page 420. 执行测试打印
 *  Execute test print
 *
 *  @param type (0,1,2),(48,49,50)
 *  @param mode (1,2,3),(49,50,51),64
 */
- (void)escExecuteTestPrintType:(NSInteger)type Mode:(NSInteger)mode;

/**
 *  page 424. 激活/关闭实时命令
 *  Enable/disable real-time command
 *
 *  @param cmdLength (3,5)
 *  @param type   (1,2)
 *  @param mode   (0,1,48,49)
 */
- (void)escSetRealTimeCommandLength:(NSInteger)cmdLength type:(NSInteger)type mode:(NSInteger)mode;

/**
 *  指定或关闭离线响应传输
 *  Specifies or turns off the offline response transmission.
 *
 *  @param state (0,1,2)
 *  @discussion  0:Turns off the offline response transmission; 1:Specifies the offline response transmission(not including the offline cause); 2:Specifies the offline response transmission(including the offline cause)
 */
- (void)escSetOfflineResponseTransmission:(NSInteger)state;

/**
 *  page 427. 请求打印成功状态，打印完成触发PTDispatch`whenESCPrintSuccess` 回调
 *  Request the status of successful printing, the completion of printing triggers the PTDispatch`whenESCPrintSuccess` callback
 */
- (void)escRequestTransmissionOfResponseOrStatus;

/**
 *  page 445. 选择打印控制方法
 *  Select print control mode
 *  0,48:   print mode when power is turned on
 *  (1,49: mode1), (2,50:mode2), (3,51:mode3), (4,52:mode4)
 *
 *  @param mode (0,4),(48,52)
 */
- (void)escSelectPrintControlMode:(NSInteger)mode;

/**
 *  page 448. 选择打印浓度
 *  Set print density
 *
 *  @param density (250~255),(0~6)
 */
- (void)setDensity:(NSInteger)density;

/**
 *  page 451. 选择打印速度
 *  Set print speed
 *
 *  @param speed (0~11),(48~57)
 */
- (void)setSpeed:(NSInteger)speed;

/**
 *  page 453. 选择激活部分热打印头的数量
 *  Select number of parts for thermal head energizing
 *
 *  @param number (0~4),(48~52),128
 */
- (void)escSelectNumbersOfPartsForThermalHeadEnergizing:(NSInteger)number;

/**
 *  page 456. 页模式下设置可打印区域
 *  Set printable area in page mode
 */
- (void)setPageAreaWithWidth:(NSInteger)width
                      height:(NSInteger)height
                     xOffset:(NSInteger)xOffset;

/**
 *   page 461. 画线
 *  Draw line
 *
 *  @param xPos (0~431)
 *  @param yPos (0~1199)
 *  @param xEnd (0~431)
 *  @param yEnd (0~1199)
 *  @param mode (1~3)
 */
- (void)appendLineWithXPos:(NSInteger)xPos
                      yPos:(NSInteger)yPos
                      xEnd:(NSInteger)xEnd
                      yEnd:(NSInteger)yEnd
                      mode:(NSInteger)mode;


/**
 画线
 Draw line
 @param lineWidth 线宽 width of line
 @param xPos 起点x start x
 @param yPos 起点y start y
 @param xEnd 终点x end x
 @param yEnd 终点y end y
 */
- (void)appendLineWithLineWidth:(uint8_t)lineWidth
                           xPos:(NSInteger)xPos
                           yPos:(NSInteger)yPos
                           xEnd:(NSInteger)xEnd
                           yEnd:(NSInteger)yEnd;

/**
 *  page 465. 绘制矩形
 *  Draw rectangle
 *
 *  @param xPos (0~431)
 *  @param yPos (0~1199)
 *  @param xEnd (0~431)
 *  @param yEnd (0~1199)
 *  @param mode (1~3)
 */
- (void)appendRectWithXPos:(NSInteger)xPos
                      yPos:(NSInteger)yPos
                      xEnd:(NSInteger)xEnd
                      yEnd:(NSInteger)yEnd
                      mode:(NSInteger)mode;

/**
 绘制矩形
 Draw rectangle
 @param lineWidth 线宽
 @param xPos 起点x
 @param yPos 起点y
 @param width 宽度
 @param height 高度
 */
- (void)appendRectangleWithLineWidth:(uint8_t)lineWidth
                                xPos:(NSInteger)xPos
                                yPos:(NSInteger)yPos
                               width:(NSInteger)width
                              height:(NSInteger)height;

/**
 *  page 468. 传送打印机ID
 *  Transmit PrinterID
 * (1,49: Printer model ID),(2,50: Type ID), (3,51: Version ID)
 *
 *  @param id_number (1~3),(49~51)
 */
- (void)escTransmitPrinterID:(NSInteger)id_number;

/**
 *  page 484. 设置水平垂直移动单位
 *  Set horizontal vertical motion units
 *
 *  @param horizontal (0~255)
 *  @param vertical (0~255)
 */
- (void)setMotionUnitsWithHorizontal:(NSInteger)horizontal vertical:(NSInteger)vertical;

/**
 *  page 486. 初始化维护计数器
 *  Initialize maintenance counter
 *
 *  @param counter (20,21,50,70)
 */
- (void)escInitializeMaintenanceCounter:(NSInteger)counter;

/**
 *  page 488. 传送维护计数器
 *  Transmit maintenance counter
 *
 *  @param counter (20,21,50,70)
 */
- (void)escTransmitMaintenanceCounter:(NSInteger)counter;

/**
 *  page 493. 设置在线恢复等待时间
 *  Set online recovery wait time
 *
 *  @param wait_time1 (0~255) default 6
 *  @param wait_time2 (0~255) default 0
 */
- (void)escSetOnlineRecoveryWaitTime1:(NSInteger)wait_time1 WaitTime2:(NSInteger)wait_time2;

#pragma mark Kanji Commands

/**
 *  page 502. 选择打印日本汉字字符模式
 *  Set Kanji print mode
 */
- (void)setKanjiWithReverse:(BOOL)reverse
                doubleWidth:(BOOL)doubleWidth
               doubleHeight:(BOOL)doubleHeight
                  underline:(BOOL)underline;

/**
 *  page 505. 选择日本汉字字符模式
 *  Set Kanji mode
 */
- (void)setKanjiMode;

/**
 *  page 508. 选择日本汉字字符字体
 *  Set Kanji font mode
 *
 *  @param mode (0~2),(48~50)
 */
- (void)setKanjiFontMode:(NSInteger)mode;

/**
 *  page 510. 打开/关闭日本汉字字符下划线
 *  Turn on/off Kanji underline mode
 *  0,48: turn off kanji underline mode
 *  1,49: turn on kanji underline mode(1-dot thick)
 *  2,50: turn on kanji underline mode(2-dots thick)
 *
 *  @param underline (0~2),(48~50)
 */
- (void)setKanjiUnderline:(NSInteger)underline;

/**
 *  page 512. 取消日本汉字字符模式
 *  Cancel Kanji mode
 */
- (void)cancelKanjiMode;

/**
 *  page 514. 定义用户定义的日本汉字字符
 *  Define user-defined Kanji character
 *
 *  @param first (119,236,254)
 *  @param second (33~126),(64~126),(128~158),(161~254)
 */
- (void)defineKanji:(NSData *)data first:(NSInteger)first second:(NSInteger)second;

/**
 *  page 518. 选择日本汉字代码系统
 *  Set Kanji code system
 *  0,48 JIS code
 *  1,49 SHIFT JIS code
 *
 *  @param system (0,1),(48,49)
 */
- (void)setKanjiCodeSystem:(NSInteger)system;

/**
 *  page 520. 设定日本汉字字符间距
 *  Set Kanji character spacing
 *  @param left (0~32) default:0
 *  @param right (0~32) default:0
 */
- (void)setKanjiSpacingWithLeft:(NSInteger)left right:(NSInteger)right;

/**
 *  page 522. 打开/关闭日本汉字倍高倍宽
 *  Turn on/off Kanji quadruple height and width mode
 *
 *  @param mode (0~255)
 */
- (void)setKanjiQuadrupleMode:(NSInteger)mode;

/**
 *  page 523. 取消用户定义的日本汉字字符
 *  Cancel user-defined Kanji character
 *  @param first (119,236,254)
 *  @param second (33~126),(64~126),(128~158),(161~254)
 */
- (void)cancelKanjiDefineWithFirst:(NSInteger)first second:(NSInteger)second;

#pragma mark Two Dimension Code Commands

/**
 *  Document 14.1
 *
 *  @param data      data String
 *  @param row       0, 3 to 90
 *  @param column    0 to 30
 *  @param width     2 to 8
 *  @param rowHeight 2 to 8
 *  @param eccMode   48 to 49
 *  @param eccLevel  48 to 50
 *  @param option    0 to 1
 */
- (void)appendPDF417Data:(NSString *)data
                     row:(NSInteger)row
                  column:(NSInteger)column
                   width:(NSInteger)width
               rowHeight:(NSInteger)rowHeight
                 eccMode:(NSInteger)eccMode
                eccLevel:(NSInteger)eccLevel
                  option:(NSInteger)option;

/**
 *  page 549. 传输符号存储区中符号数据的大小信息
 *  Transmit PDF417 symbol data size in symbol storage area
 */
- (void)transmitPDF417SymbolDataSize;

/// QRCode
/// @param data 二维码数据
/// @param justification  对齐方式 取值0,1,2 : 左、中、右
/// @param leftMargin     左间距
/// @param eccLevel       纠错等级，取值48~51: Level L,M,Q,H
/// @param model          二维码样式，取值49,50 : 两种样式
/// @param size           大小，取值1~16
- (void)appendQRCodeData:(NSString *)data
           justification:(NSInteger)justification
              leftMargin:(NSInteger)leftMargin
                eccLevel:(NSInteger)eccLevel
                   model:(NSInteger)model
                    size:(NSInteger)size;

/**
 *  page 562. 二维码:传输符号存储区中的符号数据的大小信息
 *  QR code: transmit QR code symbol data size in symbol storage area
 */
- (void)transmitQRCodeSymbolDataSize;

/**
 *  Document 14.3
 *
 *  @param data maxicode数据
 */
- (void)appendMaxiCodeData:(NSString *)data mode:(NSInteger)mode;

/**
 *  page 570. 传输符号存储区中的符号数据大小信息
 *  Transmit maxi code symbol data size in symbol storage area
 */
- (void)transmitMaxiCodeSymbolDataSize;

/**
 *  Document 14.4
 *
 *  @param data        RSS-2D data
 *  @param mode        72,73,76
 *  @param moduleWidth 2 to 8
 *  @param maxWidth    2 to 8
 */
- (void)appendRSS2Data:(NSData *)data
                  mode:(NSInteger)mode
           moduleWidth:(NSInteger)moduleWidth
              maxWidth:(NSInteger)maxWidth;

/**
 *  page 579. 传输符号存储区中符号数据的大小信息
 *  Transmit RSS2 symbol data size in symbol storage area
 */
- (void)transmitRSS2SymbolDataSize;

/**
 *  Document 14.5
 *
 *  @param data        composite symbol data
 *  @param mode        48 to 49
 *  @param type        65 to 77
 *  @param moduleWidth 2 to 8
 *  @param maxWidth    2 to 8
 *  @param hriFont     0 to 3, 48 to 51
 */
- (void)appendCompositeSymbolData:(NSData *)data
                             mode:(NSInteger)mode
                             type:(NSInteger)type
                      moduleWidth:(NSInteger)moduleWidth
                         maxWidth:(NSInteger)maxWidth
                          hriFont:(NSInteger)hriFont;

/**
 *  page 600. 传输符号存储区中的符号数据的大小信息
 *  Transmit composite symbol data size in symbol storage area
 */
- (void)transmitCompositeSymbolDataSize;

#pragma mark Customize Commands

/**
 *  page 606. 写入NV用户内存
 *  Write NV user memory
 *  @param address (0~1023)
 */
- (void)writeNVUserMemory:(NSInteger)address data:(NSData *)data;

/**
 *  page 608. 读取NV用户内存
 *  Read NV user memory
 *  @param address (0~1023)
 */
- (void)readNVUserMemory:(NSInteger)address length:(NSInteger)length;

/**
 *  page 615. 删除指定记录数据
 *  Delete specified record data
 *
 *  @param mode (0,48)
 *  @param key (32~126)
 *  @param key2 (32~126)
 */
- (void)deleteRecordWithMode:(NSInteger)mode key:(NSInteger)key key2:(NSInteger)key2;

/**
 *  page 616. 存储指定记录数据
 *  Store specified record data
 *
 *  @param mode (0,48)
 *  @param key (32~126)
 *  @param key2 (32~126)
 */
- (void)storeRecordWithMode:(NSInteger)mode key:(NSInteger)key key2:(NSInteger)key2 data:(NSData *)data;

/**
 *  page 618. 传输指定记录数据
 *  Transmit specified record data
 *
 *  @param mode (0,48)
 *  @param key (32~126)
 *  @param key2 (32~126)
 */
- (void)transmitDataInRecordWithMode:(NSInteger)mode key:(NSInteger)key key2:(NSInteger)key2;

/**
 *  page 620. 传输当前NV用户已使用内存容量
 *  Transmit current used capacity of NV memory
 *
 *  @param mode 3,51
 */
- (void)transmitNVMemoryUsedCapacityWithMode:(NSInteger)mode;

/**
 *  page 621. 传输NV用户内存剩余容量
 *  Transmit remaining capacity of NV memory
 *
 *  @param mode 4,52
 */
- (void)transmitNVMemoryRemainingCapacityWithMode:(NSInteger)mode;

/**
 *  page 622. 传输键控代码列表
 *  Transmit key code list
 *
 *  @param mode 5,53
 */
- (void)transmitKeyCodeListWithMode:(NSInteger)mode;

/**
 *  page 624. 删除所有NV用户内存
 *  Delete all the NV memory
 *
 *  @param mode 6,54
 */
- (void)deleteNVMemoryAllWithMode:(NSInteger)mode;

/**
 *  page 631. 变换用户设置模式
 *  Change user setting mode
 */
- (void)changeUserSettingMode;

/**
 *  page 632. 结束用户设置模式会话
 *  End user setting mode
 */
- (void)endUserSettingMode;

/**
 *  page 633. 更改内存开关
 *  Change memory switch
 *
 *  @param data (0~255)
 */
- (void)escChangeMemorySwitchData:(NSData *)data;

/**
 *  page 646. 传输内存开关设置
 *  Transmit memory switch setting
 *
 *  @param a (1,2,8)
 */
- (void)escTransmitMemorySwitchSettingA:(NSInteger)a;

/**
 *  page 648. 设定自定义设置值
 *  Set customized setting values
 */
- (void)escSetCustomizedSettingValuesData:(NSData *)data;

/**
 *  page 663. 传输自定义设置值
 *  Transmit customized setting values
 *
 *  @param a (5,6,97,116,118)
 */
- (void)escTransmitCustomizedSettingValuesA:(NSInteger)a;

/**
 *  page 666. 复制用户定义页面
 *  Copy user-defined page
 *
 *  @param font_number  (10,12,17,18)
 *  @param d1 (30,31)
 *  @param d2 (30,31) d1 can't be euqual o d2!!
 */
- (void)escCopyUserDefinedPageWithFontNumber:(NSInteger)font_number D1:(NSInteger)d1 D2:(NSInteger)d2;

/**
 *  page 669. 定义字符代码页数据(列格式)
 *  Define data for character code page (column format)
 *
 *  @param c1 (128~255)
 *  @param c2 (128~255)
 */
- (void)escDefineColumnFormatDataForCharacterCodePageY:(NSInteger)y C1:(NSInteger)c1 C2:(NSInteger)c2 Data:(NSData *)data;

/**
 *  page 671. 定义字符代码页数据(行格式)
 *  Define data for character code page (raster format)
 *
 *  @param c1 (128~255)
 *  @param c2 (128~255)
 */
- (void)escDefineRasterFormatDataForCharacterrCodePageX:(NSInteger)x C1:(NSInteger)c1 C2:(NSInteger)c2 Data:(NSData *)data;

/**
 *  page 673. 删除字符代码页数据
 *  Delete data for character code page
 *
 *  @param c1 (128~255)
 *  @param c2 (128~255)
 */
- (void)escDeleteDataForChracterCodePageC1:(NSInteger)c1 C2:(NSInteger)c2;

/**
 *  page 674. 设置串行接口配置项
 *  Set configuration item for serial interface
 *
 *  @param a    (1~4),depend on data
 */
- (void)escSetConfigurationItemForSerialInterfaceA:(NSInteger)a Data:(NSData *)data;

/**
 *  page 678. 传输串行接口配置项
 *  Transmit configuration item for serial interface
 *
 *  @param pl   (2)
 *  @param ph   (0)
 *  @param a    (1~4)
 */
- (void)escTransmitConfigurationItemForSerialInterfacePL:(NSInteger)pl PH:(NSInteger)ph A:(NSInteger)a;

/**
 *  page 680. 设置蓝牙接口配置项
 *  Set configuration item for Bluetooth interface
 *  @param a (49,65)
 */
- (void)escSetConfigurationItemForBluetoothInterfaceA:(NSInteger)a Data:(NSData *)data;

/**
 *  page 682. 传输设置蓝牙接口配置项
 *  Transmit configuration item for Bluetooth interface
 *
 *  @param a (48,49,65)
 */
- (void)escTransmitConfigurationItemForBluetoothInterfaceA:(NSInteger)a;

/**
 *  page 685. 删除页面布局
 *  Delete paper layout
 */
- (void)escDeletePaperLayout;

/**
 *  page 686. 设置页面布局
 *  Set paper layout
 *  @param p (9~36)
 *  @param sa (48,49,64)
 *  @param sb (135~3000)
 *  @param sc (25~100)
 *  @param sd (0~3000)
 *  @param se (0~3000)
 *  @param sf (38~3000)
 *  @param sg (when sa = '48' or '49':27~507),(when sa = '64':47~507)
 *  @param sh (when sa = '48' or '49':240~720),(when sa = '64':240~700)
 */
- (void)escSetPaperLayoutP:(NSInteger)p   SA:(NSInteger)sa SB:(NSInteger)sb SC:(NSInteger)sc
                        SD:(NSInteger)sd SE:(NSInteger)se SF:(NSInteger)sf SG:(NSInteger)sg SH:(NSInteger)sh;

/**
 *  page 692. 传输页面布局信息
 *  Transmit paper layout information
 *
 *  @param n 64,80
 */
- (void)escTransmitPaperLayoutInformation:(NSInteger)n;

/**
 *  page 701. 工作区域设置值保存到存储区域
 *  Save setting values from work area into storage area
 *
 *  @param fn (1,49)
 *  @param m  (1,49)
 */
- (void)escSaveSettingValuesFromWorkAreaIntoStorageAreaFN:(NSInteger)fn M:(NSInteger)m;

/**
 *  page 702. 加载存储区域已保存的设定值到工作区域
 *  Load setting values stored in storage area to work area
 *
 *  @param fn (2,50)
 *  @param m  (0,1,48,49)
 */
- (void)escLoadSettingValuesStoredInStorageAreaToWorkAreaFN:(NSInteger)fn M:(NSInteger)m;

/**
 *  page 703. 初始化过程后选择设置值加载到工作区域
 *  Select setting values loaded to work area after initialization process
 *
 *  @param fn (3,51)
 *  @param m  (0,1,48,49)
 */
- (void)escSelectSettingValuesLoadedToWorkAreaAfterInitializationProcessFN:(NSInteger)fn M:(NSInteger)m;

#pragma mark Counter Printing Commands

/**
 *  page 705. 选择计数器打印模式
 *  Select counter print mode
 *
 *  @param digits        (2~5)
 *  @param justification (0~2),(48~50)
 */
- (void)escSelectCounterPrintModeWithDigits:(NSInteger)digits Justification:(NSInteger)justification;

/**
 *  page 707. 选择计数模式
 *  Select counter mode
 *
 *  @param counting_mode  (0~65535)
 *  @param repetition     (0~65535)
 */
- (void)escSelectCounterModeA_MinimumValue:(NSInteger)minimum_value
                              MaximumValue:(NSInteger)maximum_value
                              CountingMode:(NSInteger)counting_mode
                                Repetition:(NSInteger)repetition;

/**
 *  page 709. 设定计数器
 *  Set counter
 *
 *  @param counter (0~65535) default:1
 */
- (void)escSetCounter:(NSInteger)counter;

/**
 *  page 710. 选择计数器模式
 *  Select counter mode
 *
 *  @param sa (0~65535)     default:1
 *  @param sb (0~65535)     default:65535
 *  @param sn (0~255)       default:1
 *  @param sr (0~255)       default:1
 *  @param sc (0~65535)     default:1
 */
- (void)escSelectCounterModeB_SA:(NSInteger)sa SB:(NSInteger)sb SN:(NSInteger)sn SR:(NSInteger)sr SC:(NSInteger)sc;

/**
 *  page 713. 打印计数器
 *  Print counter
 */
- (void)escPrintCounter;

#pragma mark Printing Paper Commands

/**
 *  page 720. 纸张布局设置
 *  Paper layout setting
 *
 *  @param p  (8~26)
 *  @param sm (0~3) mode
 *  @param sa (0),(284~1550)
 *  @param sb (-150,-1500)
 *  @param sc (-290,-50)
 *  @param sd (0,-15)
 *  @param se (-15,-15)
 *  @param sf (290,-600)
 */
- (void)escPaperLayoutSettingP:(NSInteger)p   SM:(NSInteger)sm SA:(NSInteger)sa
                            SB:(NSInteger)sb SC:(NSInteger)sc SD:(NSInteger)sd SE:(NSInteger)se SF:(NSInteger)sf;

/**
 *  page 729. 传递纸张布局设置
 *  Transmit paper layout setting information
 *
 *  @param n (64,80)
 */
- (void)escPaperLayoutInformationTransmissionN:(NSInteger)n;

/**
 *  page 732. 传输当前位置信息
 *  Transmit current positioning information
 *
 *  @param m 48
 */
- (void)escTransmitPositioningInformationM:(NSInteger)m;

/**
 *  pag 737. 从标签脱离位置走纸
 *  Feed paper to label peeling position
 *
 *  @param m (48,49)
 */
- (void)escFeedPaperToLabelPeelingPositionM:(NSInteger)m;

/**
 *  page 740. 从剪纸位置走纸
 *  Feed paper to cutting position
 *
 *  @param m (48,49)
 */
- (void)escFeedPaperToCuttingPositionM:(NSInteger)m;

/**
 *  page 742. 从打印开始位置走纸
 *  Feed paper to print starting position
 *
 *  @param m (48,49,50)
 */
- (void)escFeedPaperToPrintStartingPositionM:(NSInteger)m;

/**
 *  page 744. 纸张布局误差设置
 *  Paper layout error special margin setting
 *
 *  @param p  (2,3)
 *  @param sn (80)
 */
- (void)escPaperLayoutErrorSpecialMarginSettingP:(NSInteger)p SN:(NSInteger)sn;


@end
