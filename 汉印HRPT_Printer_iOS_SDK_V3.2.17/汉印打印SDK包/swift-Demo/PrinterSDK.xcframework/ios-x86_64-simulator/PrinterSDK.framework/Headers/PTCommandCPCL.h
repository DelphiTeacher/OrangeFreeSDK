/*!
 *  \~chinese
 *  @header PTCommandCPCL.h
 *  @abstract CPCL指令
 *
 *  \~english
 *  @header PTCommandCPCL.h
 *  @abstract CPCL Command
 */

#import <Foundation/Foundation.h>
#import "PTBitmapManager.h"

/*!
 *  \~chinese
 *  纸张类型1
 *
 *  \~english
 *  Paper type
 */
typedef NS_ENUM(NSUInteger, PTCPCLPaperType) {
    PTCPCLPaperContinuoue          = 0,  ///< continuous paper
    PTCPCLPaperLabel               = 1,  ///< label paper
    PTCPCLPaperBackBlackMark       = 2,  ///< back black mark
    PTCPCLPaperFrontBlackMark      = 3,  ///< front black mark
    PTCPCLPaperBlackMarkInch3      = 4,  ///< 3 inch black mark
    PTCPCLPaperBlackMarkInch2      = 5   ///< 2 inch black mark
};

/*!
 *  \~chinese
 *  纸张类型2
 *
 *  \~english
 *  Paper type
 */
typedef NS_ENUM(NSUInteger, PTCPCLNewPaperType) {
    PTCPCLNewPaperContinuoue          = 0,  ///< continuous paper
    PTCPCLNewPaperLabel               = 2,  ///< label paper
    PTCPCLNewBlackMarkInch2           = 4,  ///< 2 inch black mark
    PTCPCLNewBlackMarkInch3           = 5,  ///< 3 inch black mark
    PTCPCLNewBlackMarkInch4           = 6   ///< 4 inch black mark
};

/*!
 *  \~chinese
 *  标签分辨率
 *
 *  \~english
 *  Label resolution
 */
typedef NS_ENUM(NSUInteger, PTCPCLLabelResolution) {
    PTCPCLLabelResolution100   = 100,  ///< 100
    PTCPCLLabelResolution200   = 200   ///< 200
};

/*!
 *  \~chinese
 *  条码类型
 *
 *  \~english
 *  Barcode style
 */
typedef NS_ENUM(NSUInteger, PTCPCLBarcodeStyle) {
    PTCPCLBarcodeStyleUPCA      = 0,
    PTCPCLBarcodeStyleUPCE      = 1,
    PTCPCLBarcodeStyleEAN13     = 2,
    PTCPCLBarcodeStyleEAN8      = 3,
    PTCPCLBarcodeStyleCode39    = 4,
    PTCPCLBarcodeStyleCode93    = 5,
    PTCPCLBarcodeStyleCode128   = 6,
    PTCPCLBarcodeStyleCodeBAR   = 7
};

/*!
 *  \~chinese
 *  条码宽窄条比例
 *
 *  \~english
 *  The ratio of wide to narrow bars
 */
typedef NS_ENUM(NSUInteger, PTCPCLBarcodeBarRatio) {
    PTCPCLBarcodeBarRatio0     = 0,
    PTCPCLBarcodeBarRatio1     = 1,
    PTCPCLBarcodeBarRatio2     = 2,
    PTCPCLBarcodeBarRatio3     = 3,
    PTCPCLBarcodeBarRatio4     = 4,
    PTCPCLBarcodeBarRatio20    = 20,
    PTCPCLBarcodeBarRatio21    = 21,
    PTCPCLBarcodeBarRatio22    = 22,
    PTCPCLBarcodeBarRatio23    = 23,
    PTCPCLBarcodeBarRatio24    = 24,
    PTCPCLBarcodeBarRatio25    = 25,
    PTCPCLBarcodeBarRatio26    = 26,
    PTCPCLBarcodeBarRatio27    = 27,
    PTCPCLBarcodeBarRatio28    = 28,
    PTCPCLBarcodeBarRatio29    = 29,
    PTCPCLBarcodeBarRatio30    = 30
};

/*!
 *  \~chinese
 *  规范编号
 *
 *  \~english
 *  QRCode model number
 */
typedef NS_ENUM(NSUInteger, PTCPCLQRCodeModel) {
    PTCPCLQRCodeModel1      = 1,
    PTCPCLQRCodeModel2      = 2   ///< default
};

/*!
 *  \~chinese
 *  二维码单元宽度
 *
 *  \~english
 *  Unit-width of the barcode in dots. 1-32,default: 6
 */
typedef NS_ENUM(NSUInteger, PTCPCLQRCodeUnitWidth) {
    PTCPCLQRCodeUnitWidth_1 = 1,
    PTCPCLQRCodeUnitWidth_2,
    PTCPCLQRCodeUnitWidth_3,
    PTCPCLQRCodeUnitWidth_4,
    PTCPCLQRCodeUnitWidth_5,
    PTCPCLQRCodeUnitWidth_6,        ///< default
    PTCPCLQRCodeUnitWidth_7,
    PTCPCLQRCodeUnitWidth_8,
    PTCPCLQRCodeUnitWidth_9,
    PTCPCLQRCodeUnitWidth_10,
    PTCPCLQRCodeUnitWidth_11,
    PTCPCLQRCodeUnitWidth_12,
    PTCPCLQRCodeUnitWidth_13,
    PTCPCLQRCodeUnitWidth_14,
    PTCPCLQRCodeUnitWidth_15,
    PTCPCLQRCodeUnitWidth_16,
    PTCPCLQRCodeUnitWidth_17,
    PTCPCLQRCodeUnitWidth_18,
    PTCPCLQRCodeUnitWidth_19,
    PTCPCLQRCodeUnitWidth_20,
    PTCPCLQRCodeUnitWidth_21,
    PTCPCLQRCodeUnitWidth_22,
    PTCPCLQRCodeUnitWidth_23,
    PTCPCLQRCodeUnitWidth_24,
    PTCPCLQRCodeUnitWidth_25,
    PTCPCLQRCodeUnitWidth_26,
    PTCPCLQRCodeUnitWidth_27,
    PTCPCLQRCodeUnitWidth_28,
    PTCPCLQRCodeUnitWidth_29,
    PTCPCLQRCodeUnitWidth_30,
    PTCPCLQRCodeUnitWidth_31,
    PTCPCLQRCodeUnitWidth_32
};

/*!
 *  \~chinese
 *  二维码纠错水平
 *
 *  \~english
 *  QRCode Error Correction Level
 */
typedef NS_ENUM(NSUInteger, PTCPCLQRCodeCorrectionLevel) {
    PTCPCLQRCodeCorrectionLevelH      = 0,  ///< Ultra high reliability level
    PTCPCLQRCodeCorrectionLevelQ      = 1,  ///< High reliability level
    PTCPCLQRCodeCorrectionLevelM      = 2,  ///< Standard level
    PTCPCLQRCodeCorrectionLevelL      = 3 ///< High density level
};

/*!
 *  \~chinese
 *  二维码字符类型
 *
 *  \~english
 *  QRCode Character mode symbols
 */
typedef NS_ENUM(NSUInteger, PTCPCLQRCodeDataInputMode) {
    PTCPCLQRCodeDataInputModeA      = 0,  ///< Automatic(default)
    PTCPCLQRCodeDataInputModeM      = 1  ///< manual(ignore it,pls select ModeA)
};

/*!
 *  \~chinese
 *  文本字体名称
 *
 *  \~english
 *  Text Font Name
 */
typedef NS_ENUM(NSUInteger, PTCPCLTextFontName) {
    PTCPCLTextFont0       = 0,  ///< khmer:12x24
    PTCPCLTextFont1       = 1,  ///< chinese:24x24   english:9x17
    PTCPCLTextFont2       = 2,  ///< chinese:24x24   english:12x24
    PTCPCLTextFont3       = 3,  ///< chinese:20x20   english:10x20
    PTCPCLTextFont4       = 4,  ///< chinese:32x32   english:16x32
    PTCPCLTextFont5       = 5,  ///< chinese:24x24   english:12x24
    PTCPCLTextFont7       = 7,  ///< chinese:24x24   english:12x24
    PTCPCLTextFont8       = 8,  ///< chinese:24x24   english:12x24
    PTCPCLTextFont20      = 20, ///< chinese:16x16   english:8x16
    PTCPCLTextFont28      = 28, ///< chinese:28x28   english:14x28
    PTCPCLTextFont55      = 55  ///< chinese:16x16   english:8x16
};

/*!
 *  \~chinese
 *  字体放大倍数
 *
 *  \~english
 *  Font scale
 */
typedef NS_ENUM(NSUInteger, PTCPCLTextFontSize) {
    PTCPCLTextFontSize0       = 0,  ///< scale-> width:1   height:1, default
    PTCPCLTextFontSize1       = 1,  ///< scale-> width:1   height:2
    PTCPCLTextFontSize2       = 2,  ///< scale-> width:2   height:1
    PTCPCLTextFontSize3       = 3,  ///< scale-> width:2   height:2
    PTCPCLTextFontSize4       = 4,  ///< scale-> width:2   height:3
    PTCPCLTextFontSize5       = 5,  ///< scale-> width:3   height:2
    PTCPCLTextFontSize6       = 6,  ///< scale-> width:3   height:3
    PTCPCLTextFontSize7       = 7,  ///< scale-> width:3   height:4
};

/// Scaled Font Name
typedef NS_ENUM(NSUInteger, PTCPCLScaledFontName) {
    PTCPCLScaledFontNameTTF     = 0,    ///< default
    PTCPCLScaledFontNameCSF     = 1,
    PTCPCLScaledFontNameFNT     = 2
};

/// Font Group number
typedef NS_ENUM(NSUInteger, PTCPCLFontGroupNumber) {
    PTCPCLFontGroupNumber0          = 0,
    PTCPCLFontGroupNumber1          = 1,
    PTCPCLFontGroupNumber2          = 2,
    PTCPCLFontGroupNumber3          = 3,
    PTCPCLFontGroupNumber4          = 4,
    PTCPCLFontGroupNumber5          = 5,
    PTCPCLFontGroupNumber6          = 6,
    PTCPCLFontGroupNumber7          = 7,
    PTCPCLFontGroupNumber8          = 8,
    PTCPCLFontGroupNumber9          = 9,
    PTCPCLFontGroupNumber10         = 10
};

/*!
 *  \~chinese
 *  字体加粗
 *
 *  \~english
 *  Text bold
 */
typedef NS_ENUM(NSUInteger, PTCPCLTextBold) {
    PTCPCLTextBold0    = 0, ///< default,not bold
    PTCPCLTextBold1    = 1,
    PTCPCLTextBold2    = 2,
    PTCPCLTextBold3    = 3,
    PTCPCLTextBold4    = 4,
    PTCPCLTextBold5    = 5
};

/*!
 *  \~chinese
 *  旋转角度
 *
 *  \~english
 *  Rotation:Counterclockwise rotation
 */
typedef NS_ENUM(NSUInteger, PTCPCLStyleRotation) {
    PTCPCLStyleRotation0    = 0,    ///< Counterclockwise rotation,default
    PTCPCLStyleRotation90   = 90,   ///< Counterclockwise rotation 90
    PTCPCLStyleRotation180  = 180,  ///< Counterclockwise rotation 180
    PTCPCLStyleRotation270  = 270   ///< Counterclockwise rotation 270
};

/*!
 *  \~chinese
 *  字体放大系数
 *
 *  \~english
 *  Font scale
 */
typedef NS_ENUM(NSUInteger, PTCPCLFontScale) {
    PTCPCLFontScale_1  = 1,
    PTCPCLFontScale_2,
    PTCPCLFontScale_3,
    PTCPCLFontScale_4,
    PTCPCLFontScale_5,
    PTCPCLFontScale_6,
    PTCPCLFontScale_7,
    PTCPCLFontScale_8,
    PTCPCLFontScale_9,
    PTCPCLFontScale_10,
    PTCPCLFontScale_11,
    PTCPCLFontScale_12,
    PTCPCLFontScale_13,
    PTCPCLFontScale_14,
    PTCPCLFontScale_15,
    PTCPCLFontScale_16
};

/// auto feed ling Font
typedef NS_ENUM(NSUInteger, PTCPCLTextLineFontStyle) {
    PTCPCLTextLineFontStyle0    = 0,    ///< big font
    PTCPCLTextLineFontStyle1    = 1    ///< small font
};

/*!
 *  \~chinese
 *  PDF417码的纠错等级
 *
 *  \~english
 *  The error recovery level.
 */
typedef NS_ENUM(NSUInteger, PTCPCLPDF417ErrLevel) {
    PTCPCLPDF417ErrLevel_0  = 0,
    PTCPCLPDF417ErrLevel_1  = 1,   //default
    PTCPCLPDF417ErrLevel_2,
    PTCPCLPDF417ErrLevel_3,
    PTCPCLPDF417ErrLevel_4,
    PTCPCLPDF417ErrLevel_5,
    PTCPCLPDF417ErrLevel_6,
    PTCPCLPDF417ErrLevel_7,
    PTCPCLPDF417ErrLevel_8
};

/*!
 *  \~chinese
 *  PDF417码是水平还是垂直
 *
 *  \~english
 *  The PDF417 code horizontal or vertical.
 */
typedef NS_ENUM(NSUInteger, PTCPCLPDF417Direction) {
    PTCPCLPDF417DirectionH    = 0,    ///< horizontal
    PTCPCLPDF417DirectionV    = 1    ///< vertical
};

/*!
 *  \~chinese
 *  PDF417数据压缩是自动还是二进制
 *
 *  \~english
 *  The compaction of data in the barcode is automatic, or explicitly set to binary.
 */
typedef NS_ENUM(NSUInteger, PTCPCLPDF417Binary) {
    PTCPCLPDF417BinaryA    = 0,    ///< automatic
    PTCPCLPDF417BinaryF    = 1    ///< forced
};

typedef NS_ENUM(NSUInteger, PTCPCLRFIDMemory) {
    /*! \~chinese 预留区,通常不超过8字节(beginAddr[起始地址] * 2 + bytes[字节数] <= 8，下同) \~english Reserved，Usually no more than 8 bytes(BeginAddr * 2 + Bytes < 8, same below) */
    PTCPCLRFIDMemoryReserved    = 0,
    /*! \~chinese EPC区，通常不超过16字节(起始地址从2开始) \~english EPC，Usually no more than 16 bytes(The starting address starts at 2) */
    PTCPCLRFIDMemoryEPC         = 1,
    /*! \~chinese TID区，通常不超过128字节，不可写数据 \~english TID，Usually no more than 128 bytes，Unwritable data */
    PTCPCLRFIDMemoryTID         = 2,
    /*! \~chinese User区，通常不超过128字节 \~english User，Usually no more than 128 bytes */
    PTCPCLRFIDMemoryUser        = 3
};

@interface PTCommandCPCL : NSObject

/*!
 *  \~chinese
 *
 *  下发给打印机的数据.
 *
 *  \~english
 *
 *  Data sent to the printer.
 *
 */
@property (nonatomic, strong) NSMutableData * _Nonnull cmdData;

/*!
 *  \~chinese
 *
 *  是否在中通快递上调用，默认是NO，该参数只针对中通快递的固件
 *
 *  \~english
 *
 *  Whether ZTO invoke,default is NO，This parameter only applies to the firmware of ZTO
 *
 */
@property (nonatomic, assign) BOOL isZTO;

/*!
 *  \~chinese
 *
 *  指令使用的编码，默认是GBK.
 *
 *  \~english
 *
 *  encode，default is GBK.
 *
 */
@property (nonatomic, assign) NSStringEncoding encoding;

/*!
 *  \~chinese
 *
 *  添加指令.
 *  
 *  @brief 添加指令.
 *  @param cmd 指令文本.使用encoding属性进行编码.
 *
 *  \~english
 *
 *  append command.
 *
 *  @brief append command.
 *  @param cmd command text. encode with encoding property.
 *
 */
- (void)appendCommand:(NSString * _Nonnull)cmd;

/*!
 *  \~chinese
 *
 *  添加指令.
 *
 *  @brief 添加指令.
 *  @param cmd 指令数据.
 *
 *  \~english
 *
 *  append command.
 *
 *  @brief append command.
 *  @param cmd command data.
 *
 */
- (void)appendCommandData:(NSData * _Nonnull)data;

/*!
 *  \~chinese
 *
 *  打印自检页.
 *
 *  @brief 打印自检页.
 *
 *  \~english
 *
 *  selfTest.
 *
 *  @brief selfTest.
 *
 */
- (void)printSelfInspectionPage;

/*!
 *  \~chinese
 *
 *  获取打印机状态，对receiveDataBlock的回调的16进制数据进行解析.
 *
 *  @brief 获取打印机状态
 *
 | 位(返回值)  |    1        |     0     |
 | --------- | ----------- |-----------|
 |     0     |    忙碌      |  准备就绪  |
 |     1     |    缺纸      |   纸充足   |
 |     2     |    开盖      |   合盖     |
 |     3     |    低电量    |  电量正常   |

 *
 *  \~english
 *
 *  Get print status，ReceiveDataBlock callback hexadecimal data parsing.
 *
 *  @brief Get Print Status
 *
 | Bit(return value) |          1          |      0                 |
 | ----------------- | ------------------- |---------------------   |
 |        0          | Printer is Busy     | Printer is Ready       |
 |        1          | Paper is Out        | Paper is OK            |
 |        2          | Head Latch is Open  | Head Latch is Closed   |
 |        3          | Battery is Low      | Battery is OK          |
 *
 */
- (void)cpclGetPaperStatus;

/*!
 *  \~chinese
 *
 *  获取固件版本号
 *
 *  @brief 获取固件版本号
 *
 *  \~english
 *
 *  firmware version.
 *
 *  @brief firmware version.
 *
 */
- (void)getFirmwareVersion;

/*!
 *  \~chinese
 *
 *  开关打印状态回调，可通过调用printStateBlock接口后得到打印机完成的状态.
 *
 *  @brief 开关打印状态回调.
 *
 *  \~english
 *
 *  Turn on/off print status callback，the state of printer completion can be obtained by calling the printStateBlock interface.
 *
 *  @brief Turn on/off print status callback.
 *
 */
- (void)cpclTurnOnPrintStatusCallBack:(BOOL)flag;

/*!
 *  \~chinese
 *
 *  打开下划线.
 *
 *  @brief 打开下划线.
 *
 *  \~english
 *
 *  Turn on underline.
 *
 *  @brief Turn on underline.
 *
 */
- (void)cpclUnderlineON;

/*!
 *  \~chinese
 *
 *  关闭下划线.
 *
 *  @brief 关闭下划线.
 *
 *  \~english
 *
 *  Turn off underline.
 *
 *  @brief Turn off underline.
 *
 */
- (void)cpclUnderlineOFF;

/*!
 *  \~chinese
 *
 *  开始标签会话.
 *
 *  @brief 开始标签会话.
 *  @param offset   标签的横向偏移量.
 *  @param hRes     标签横向分辨率(点/英寸). 100 或 200
 *  @param vRes     标签纵向分辨率(点/英寸). 100 或 200
 *  @param height   标签点高. 0-65535
 *  @param quantity 标签打印份数. 0-1024
 *
 *  \~english
 *
 *  start label session.
 *
 *  @brief start label session.
 *  @param offset   The number of units to offset all fields from the left side of the label horizontally. 0-65535
 *  @param hRes     The horizontal resolution of this label, expressed in dots per inch. 100 or 200
 *  @param vRes     The vertical resolution of this label, expressed in dots per inch. 100 or 200
 *  @param height   The height of the label in units. 0-65535
 *  @param quantity The number of copies of the label to print.  0-1024
 *
 */
- (void)cpclLabelWithOffset:(NSInteger)offset
                       hRes:(PTCPCLLabelResolution)hRes
                       vRes:(PTCPCLLabelResolution)vRes
                     height:(NSInteger)height
                   quantity:(NSInteger)quantity;

/*!
 *  \~chinese
 *
 *  指定标签宽度,设置需要打印的宽度.
 *
 *  @brief 指定标签宽度.
 *  @param pageWidth 标签宽度(点)
 *
 *  \~english
 *
 *  used to specify the width a label session，Set the width you want to print.
 *
 *  @brief used to specify the width a label session.
 *  @param pageWidth width of a label session in dots.
 *
 */
- (void)cpclPageWidth:(NSInteger)pageWidth;

/*!
 *  \~chinese
 *
 *  横向条码打印.
 *
 *  @brief 横向条码打印.
 *  @param type     条码类型. UPCA/UPCE/EAN13/EAN8/39/93/128/CODABAR
 *  @param width    窄条宽度.
 *  @param ratio    宽窄条比例. 0-4，20-30
 *  @param height   条码高度.
 *  @param x        横向起始位置.
 *  @param y        纵向起始位置.
 *  @param barcode  条码内容.
 *
 *  \~english
 *
 *  horizonal barcode.
 *
 *  @brief horizonal barcode.
 *  @param type     The type of barcode to print. UPCA/UPCE/EAN13/EAN8/39/93/128/CODABAR
 *  @param width    The width of a narrow bar.
 *  @param ratio    The ratio of wide to narrow bars. 0-4，20-30
 *  @param height   The height of the barcode.
 *  @param x        The X position where the barcode begins
 *  @param y        The Y position where the barcode begins
 *  @param barcode  The data to be encoded into a barcode
 *
 */
- (void)cpclBarcode:(PTCPCLBarcodeStyle)type
              width:(NSInteger)width
              ratio:(PTCPCLBarcodeBarRatio)ratio
             height:(NSInteger)height
                  x:(NSInteger)x
                  y:(NSInteger)y
            barcode:(NSString * _Nonnull)barcode;

/*!
 *  \~chinese
 *
 *  纵向条码打印.
 *
 *  @brief 纵向条码打印.
 *  @param type     条码类型.
 *  @param width    窄条宽度.
 *  @param ratio    宽窄条比例. 0-4，20-30
 *  @param height   条码高度.
 *  @param x        横向起始位置.
 *  @param y        纵向起始位置.
 *  @param barcode  条码内容.
 *
 *  \~english
 *
 *  vertical barcode.
 *
 *  @brief vertical barcode.
 *  @param type     The type of barcode to print.
 *  @param width    The width of a narrow bar.
 *  @param ratio    The ratio of wide to narrow bars. 0-4，20-30
 *  @param height   The height of the barcode.
 *  @param x        The X position where the barcode begins
 *  @param y        The Y position where the barcode begins
 *  @param barcode  The data to be encoded into a barcode
 *
 */
- (void)cpclBarcodeVertical:(PTCPCLBarcodeStyle)type
                      width:(NSInteger)width
                      ratio:(PTCPCLBarcodeBarRatio)ratio
                     height:(NSInteger)height
                          x:(NSInteger)x
                          y:(NSInteger)y
                    barcode:(NSString * _Nonnull)barcode;

/*!
 *  \~chinese
 *
 *  指定条码下方文字格式.
 *
 *  @brief 指定条码下方文字格式.
 *  @param font         字体名.
 *  @param fontSize     字体大小, 0-999.
 *  @param offset       文本距离条码的偏移量，0-999.
 *
 *  \~english
 *
 *  used to specify if a human-readable text representation of barcode data should be printed below 1D barcodes.
 *
 *  @brief Specify the barcode below the text format
 *  @param font         A font name or number to create the representation
 *  @param fontSize     The size of the font: 0-999
 *  @param offset       How far in units the text is from the barcode:0-999
 *
 */
- (void)cpclBarcodeTextWithFont:(PTCPCLTextFontName)font
                       fontSize:(NSInteger)fontSize
                         offset:(NSInteger)offset;

/*!
 *  \~chinese
 *
 *  指定条码下方文字格式.
 *
 *  @brief 指定条码下方文字格式.
 *  @param font     字体文件名.
 *  @param xScale   字符横向大小(点).
 *  @param yScale   字符纵向大小(点).
 *  @param offset   文本距离条码的偏移量，0-999.
 *
 *  \~english
 *
 *  used to specify if a human-readable text representation of barcode data should be printed below 1D barcodes.
 *
 *  @brief Specify the barcode below the text format
 *  @param font     The filename of the TTF font with extension.
 *  @param xScale   The X size of the font, in dots: 0-999.
 *  @param yScale   The Y size of the font, in dots: 0-999.
 *  @param offset   How far in units the text is from the barcode:0-999.
 *
 */
- (void)cpclBarcodeTextWithTrueTypeFont:(PTCPCLTextFontName)font
                                 xScale:(NSInteger)xScale
                                 yScale:(NSInteger)yScale
                                 offset:(NSInteger)offset;

/*!
 *  \~chinese
 *
 *  结束条码底部文字展示.
 *
 *  @brief 结束条码底部文字展示.
 *
 *  \~english
 *
 *  turn off the addition of the text representation.
 *
 *  @brief turn off the addition of the text representation.
 */
- (void)cpclBarcodeTextOff;

/*!
 *  \~chinese
 *
 *  横向QR码打印
 *
 *  @brief 横向QR码打印
 *  @param xPos        横向开始点.
 *  @param yPos        纵向开始点.
 *  @param model       规范编号, 1 或 2.
 *  @param unitWidth   单元宽度. 范围是1-32,默认是6
 *
 *  \~english
 *
 *  horizonal QR barcode.
 *
 *  @brief horizonal QR barcode.
 *  @param xPos        The X position where the barcode begins
 *  @param yPos        The Y position where the barcode begins
 *  @param model       Specifies the model of QR code to print.1 or 2
 *  @param unitWidth   Unit-width of the barcode in dots. 1-32,default: 6.
 *
 */
- (void)cpclBarcodeQRcodeWithXPos:(NSInteger)xPos
                             yPos:(NSInteger)yPos
                            model:(PTCPCLQRCodeModel)model
                        unitWidth:(PTCPCLQRCodeUnitWidth)unitWidth;

/*!
 *  \~chinese
 *
 *  纵向QR码打印
 *
 *  @brief 纵向QR码打印
 *  @param xPos        横向开始点.
 *  @param yPos        纵向开始点.
 *  @param model       规范编号, 1 或 2.
 *  @param unitWidth   单元宽度. 范围是1-32,默认是6
 *
 *  \~english
 *
 *  vertical QR barcode.
 *
 *  @brief vertical QR barcode.
 *  @param xPos        The X position where the barcode begins
 *  @param yPos        The Y position where the barcode begins
 *  @param model       Specifies the model of QR code to print.1 or 2
 *  @param unitWidth   Unit-width of the barcode in dots. 1-32,default: 6.
 *
 */
- (void)cpclBarcodeVerticalQRcodeWithXPos:(NSInteger)xPos
                                     yPos:(NSInteger)yPos
                                    model:(PTCPCLQRCodeModel)model
                                unitWidth:(PTCPCLQRCodeUnitWidth)unitWidth;

/*!
 *  \~chinese
 *
 *  添加QR码数据.
 *
 *  @brief 添加QR码数据.
 *  @param level            纠错级别
 *  @param characterMode    输入的字符模式符号
 *  @param context          数据
 *
 *  \~english
 *
 *  QR Data.
 *
 *  @brief QR Data.
 *  @param level            Error Correction
 *  @param characterMode    Data Input Mode
 *  @param context          Data for barcode
 *
 */
- (void)cpclBarcodeQRCodeCorrectionLecel:(PTCPCLQRCodeCorrectionLevel)level characterMode:(PTCPCLQRCodeDataInputMode)characterMode context:(NSString *_Nonnull)context;

/*!
 *  \~chinese
 *
 *  QR码结束.
 *
 *  @brief QR码结束.
 *
 *  \~english
 *
 *  The QR code terminator.
 *
 *  @brief The QR code terminator.
 *
 */
- (void)cpclBarcodeQRcodeEnd;


/*!
 *  \~chinese
 *
 *  配置PDF417码的参数
 *
 *  @brief 配置PDF417码的参数
 *  @param directon         水平还是垂直
 *  @param xPos             条形码开始的X位置 (0 to 65535 units)
 *  @param yPos             条形码开始的Y位置 (0 to 65535 units)
 *  @param xDot             单个元素的X大小（以点为单位）,默认是2 (0 to 65535)
 *  @param yDot             单个元素的Y大小（以点为单位）,默认是6 (0 to 65535)
 *  @param columns          指定要使用的列数 (1 to 30),默认是3
 *  @param rows             指定要使用的行数 (0 to 90),默认是0
 *  @param ecc              指定错误恢复级别 (0 to 8),默认是1
 *  @param binaryModel      强制二进制压缩模式 (0 or 1),默认是0
 *
 *  \~english
 *
 *  Config PDF417 parameters
 *
 *  @brief Config PDF417 parameters
 *  @param directon         horizontal or vertical
 *  @param xPos             The X position where the barcode begins (0 to 65535 units)
 *  @param yPos             The Y position where the barcode begins (0 to 65535 units)
 *  @param xDot             The X size of a single element in dots,the default value is 2 (0 to 65535)
 *  @param yDot             The Y size of a single element in dots,the default value is 6(0 to 65535)
 *  @param columns          Specifies the number of columns to use,the default value is 3 (1 to 30)
 *  @param rows             Specifies the number of rows to use,the default value is 0 (0 to 90)
 *  @param ecc              Specifies the error recovery level,the default value is 1 (0 to 8)
 *  @param binaryModel      Force binary compaction mode,the default value is 0 (0 or 1)
 */
- (void)cpclPDF417CodeWithDirection:(PTCPCLPDF417Direction)directon
                               xPos:(NSInteger)xPos
                               yPos:(NSInteger)yPos
                               xDot:(NSInteger)xDot
                               yDot:(NSInteger)yDot
                            columns:(NSInteger)columns
                               rows:(NSInteger)rows
                                ecc:(PTCPCLPDF417ErrLevel)ecc
                        binaryModel:(PTCPCLPDF417Binary)binaryModel;


/*!
 *  \~chinese
 *
 *  添加PDF417码数据.
 *
 *  @brief 添加PDF417码数据.
 *  @param context          数据
 *
 *  \~english
 *
 *  PDF417 Data.
 *
 *  @brief PDF417 Data.
 *  @param context          data
 *
 */
- (void)cpclPDF417CodeAddContext:(NSString *_Nullable)context;

/*!
 *  \~chinese
 *
 *  PDF417码结束.
 *
 *  @brief PDF417码结束.
 *
 *  \~english
 *
 *  The PDF417 code terminator.
 *
 *  @brief The PDF417 code terminator.
 *
 */
- (void)cpclPDF417codeEnd;


/*!
 *  \~chinese
 *
 *  绘制矩形.
 *
 *  @brief 绘制矩形.
 *  @param xPos      横向开始点(0~65535)
 *  @param yPos      纵向开始点(0~65535)
 *  @param xEnd      横向结束点(0~65535)
 *  @param yEnd      纵向结束点(0~65535)
 *  @param thickness 线条宽度.(0~65535)
 *
 *  \~english
 *
 *  draw box.
 *
 *  @brief draw box.
 *  @param xPos      The X origin of the box.(0~65535)
 *  @param yPos      The Y origin of the box.(0~65535)
 *  @param xEnd      The X coordinate where the box ends.(0~65535)
 *  @param yEnd      The Y coordinate where the box ends.(0~65535)
 *  @param thickness The thickness of the lines in the box.(0~65535)
 *
 */
- (void)cpclBoxWithXPos:(NSInteger)xPos
                   yPos:(NSInteger)yPos
                   xEnd:(NSInteger)xEnd
                   yEnd:(NSInteger)yEnd
              thickness:(NSInteger)thickness;

/*!
 *  \~chinese
 *
 *  画线条.
 *
 *  @brief 画线条.
 *  @param xPos         起点的x坐标
 *  @param yPos         起点的y坐标
 *  @param xEnd         终点的x坐标
 *  @param yEnd         终点的y坐标
 *  @param thickness    线条的单位宽度
 *
 *  \~english
 *
 *  draw line.
 *
 *  @brief draw line.
 *  @param xPos         The X origin of the line.
 *  @param yPos         The Y origin of the line.
 *  @param xEnd         The X coordinate where the line ends.
 *  @param yEnd         The Y coordinate where the line ends.
 *  @param thickness    The thickness of the line.
 *
 */
- (void)cpclLineWithXPos:(NSInteger)xPos
                    yPos:(NSInteger)yPos
                    xEnd:(NSInteger)xEnd
                    yEnd:(NSInteger)yEnd
               thickness:(NSInteger)thickness;

/*!
 *  \~chinese
 *
 *  反白线条.
 *
 *  @brief 反白线条.
 *  @param xPos      横向开始点(0~65535)
 *  @param yPos      纵向开始点(0~65535)
 *  @param xEnd      横向结束点(0~65535)
 *  @param yEnd      纵向结束点(0~65535)
 *  @param thickness 线条宽度.(0~65535)
 *
 *  \~english
 *
 *  draw inverse line.
 *
 *  @brief draw inverse line.
 *  @param xPos      The X origin of the box.(0~65535)
 *  @param yPos      The Y origin of the box.(0~65535)
 *  @param xEnd      The X coordinate where the box ends.(0~65535)
 *  @param yEnd      The Y coordinate where the box ends.(0~65535)
 *  @param thickness The thickness of the lines in the box.(0~65535)
 *
 */
- (void)cpclInverseLineWithXPos:(NSInteger)xPos
                           yPos:(NSInteger)yPos
                           xEnd:(NSInteger)xEnd
                           yEnd:(NSInteger)yEnd
                      thickness:(NSInteger)thickness;

/*!
 *  \~chinese
 *
 *  打印图片
 *
 *  @brief 打印图片
 *  @param Xpos         横向开始打印位置
 *  @param Ypos         纵向开始打印位置
 *  @param image        需要打印的图片
 *  @param bitmapMode   位图的类型，黑白和灰阶抖动
 *  @param compress     打印机支持的压缩类型
 *  @param isPackage    是否需要分包
 *
 *  \~english
 *
 *  Print Image
 *
 *  @brief Print Image
 *  @param Xpos         Horizontal starting position.
 *  @param Ypos         Vertical starting position.
 *  @param image        Print image
 *  @param bitmapMode   Bitmap type
 *  @param compress     The type of compression supported by the printer
 *  @param isPackage    Whether the pictures need to be subcontracted
 *
 */
- (void)cpclPrintBitmapWithXPos:(NSInteger)xPos
                           yPos:(NSInteger)yPos
                          image:(CGImageRef _Nullable )image
                     bitmapMode:(PTBitmapMode)bitmapMode
                       compress:(PTBitmapCompressMode)compress
                      isPackage:(BOOL)isPackage;


/*!
 *  \~chinese
 *
 *  开始横向文本串联.
 *
 *  @brief 开始横向文本串联.
 *  @param xPos 横向起始位置
 *  @param yPos 纵向起始位置
 *
 *  \~english
 *
 *  concatenate multiple fonts and sizes of text on to a single line, and to align their top-lines in a specific way.
 *
 *  @brief Horizontal text series
 *  @param xPos The X origin of the text string.
 *  @param yPos The Y origin of the text string.
 *
 */
- (void)cpclConcatStartWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;

/*!
 *  \~chinese
 *
 *  开始纵向文本串联.
 *
 *  @brief 开始纵向文本串联.
 *  @param xPos 横向起始位置
 *  @param yPos 纵向起始位置
 *
 *  \~english
 *
 *  concatenate multiple fonts and sizes of text on to a single line, and to align their top-lines in a specific way.
 *
 *  @brief Vertical text series.
 *  @param xPos The X origin of the text string.
 *  @param yPos The Y origin of the text string.
 *
 */
- (void)cpclConcatVerticalStartWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;

/*!
 *  \~chinese
 *
 *  拼接文本.
 *
 *  @brief 拼接文本.
 *  @param font         字体名称.
 *  @param fontSize     字体大小.
 *  @param offset       文字纵向偏移(以开始文字串联Y的位置为标准).
 *  @param text         文字内容.
 *
 *  \~english
 *
 *  concat text.
 *
 *  @brief concat text.
 *  @param font         font.
 *  @param fontSize     font size.
 *  @param offset       How far from Y is the top of this text.
 *  @param text         The text data to be concatenated.
 *
 */
- (void)cpclConcatTextWithFont:(PTCPCLTextFontName)font
                      fontSize:(NSInteger)fontSize
                        offset:(NSInteger)offset
                          text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  拼接可缩放的水平文本.
 *
 *  @brief 拼接可缩放的水平文本.
 *  @param scaledFont   可缩放字体.
 *  @param xScale       字体横向大小(点).
 *  @param yScale       字体纵向大小(点)
 *  @param offset       文字纵向偏移(以开始文字串联Y的位置为标准).
 *  @param text         文字内容.
 *
 *  \~english
 *
 *  concat scaled text.
 *
 *  @brief concat scaled text.
 *  @param scaledFont   A scaled font used to create the text.
 *  @param xScale       The X size of the scaled font, in points.
 *  @param yScale       The Y size of the scaled font, in points.
 *  @param offset       offset How far from Y is the top of this text.
 *  @param text         The text data to be concatenated.
 *
 */
- (void)cpclConcatScaleTextWithScaledFont:(NSInteger)scaledFont
                                   xScale:(NSInteger)xScale
                                   yScale:(NSInteger)yScale
                                   offset:(NSInteger)offset
                                     text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  拼接可缩放的垂直文本.
 *
 *  @brief 拼接可缩放的垂直文本.
 *  @param scaledFont   可缩放字体.
 *  @param xScale       字体横向大小(点).
 *  @param yScale       字体纵向大小(点)
 *  @param offset       文字纵向偏移(以开始文字串联Y的位置为标准).
 *  @param text         文字内容.
 *
 *  \~english
 *
 *  concat scaled Vertical text.
 *
 *  @brief concat scaled Vertical text.
 *  @param scaledFont   A scaled font used to create the text.
 *  @param xScale       The X size of the scaled font, in points.
 *  @param yScale       The Y size of the scaled font, in points.
 *  @param offset       offset How far from Y is the top of this text.
 *  @param text         The text data to be concatenated.
 *
 */
- (void)cpclConcatVerticalScaleTextWithScaledFont:(NSInteger)scaledFont
                                           xScale:(NSInteger)xScale
                                           yScale:(NSInteger)yScale
                                           offset:(NSInteger)offset
                                             text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  拼接字体组文本.
 *
 *  @brief 拼接字体组文本.
 *  @param fontGroup    字体组编码(0-10)
 *  @param offset       文字纵向偏移(以开始文字串联Y的位置为标准).
 *  @param text         文字内容.
 *
 *  \~english
 *
 *  concat font group.
 *
 *  @brief concat font group.
 *  @param fontGroup    Font group number.(0-10)
 *  @param offset       offset How far from Y is the top of this text.
 *  @param text         The text data to be concatenated.
 *
 */
- (void)cpclConcatTextWithFontGroup:(PTCPCLFontGroupNumber)fontGroup
                             offset:(NSInteger)offset
                               text:(NSString * _Nonnull)text;
/*!
 *  \~chinese
 *
 *  结束文本串联.
 *
 *  @brief 结束文本串联.
 *
 *  \~english
 *
 *  terminate concat command.
 *
 *  @brief terminate concat command.
 *
 */
- (void)cpclConcatEnd;

/*!
 *  \~chinese
 *
 *  标签会话结束，打印标签.
 *
 *  @brief 标签会话结束，打印标签.
 *
 *  \~english
 *
 *  terminate a CPCL label session, and create the resulting print out.
 *
 *  @brief The tag end of the session
 *
 */
- (void)cpclPrint;

/*!
 *  \~chinese
 *
 *  反向打印,将整个标签旋转180.
 *
 *  @brief 反向打印,将整个标签旋转180.
 *
 *  \~english
 *
 *  Reverse print,Rotate the label 180.
 *
 *  @brief Reverse print,Rotate the label 180.
 *
 */
- (void)cpclPoPrint;



/*!
 *  \~chinese
 *
 *  居中
 *
 *  @brief 居中
 *  @param range 居中区域宽度.
 *
 *  \~english
 *
 *  center justification.
 *
 *  @brief center justification.
 *  @param range The width of the area to center on from the left side.
 *
 */
- (void)cpclCenterWithRange:(NSInteger)range;

/*!
 *  \~chinese
 *
 *  居中
 *
 *  @brief  居中
 *
 *  \~english
 *
 *  center justification.
 *
 *  @brief center justification.
 *
 */
- (void)cpclCenter;

/*!
 *  \~chinese
 *
 *  左对齐.
 *
 *  @brief 左对齐.
 *  @param range 用于为FONT-GROUP指令指定文字区域
 *
 *  \~english
 *
 *  left justification.
 *
 *  @brief left justification.
 *  @param range When used with LEFT, the only function Range performs is a field specification function for FONT-GROUP.
 *
 */
- (void)cpclLeft:(NSInteger)range;


/*!
 *  \~chinese
 *
 *  左对齐.
 *
 *  @brief 左对齐.
 *
 *  \~english
 *
 *  left justification.
 *
 *  @brief left justification.
 *
 */
- (void)cpclLeft;

/*!
 *  \~chinese
 *
 *  右对齐.
 *
 *  @brief 右对齐.
 *  @param right 要对齐的右边界位置.
 *
 *  \~english
 *
 *  right justification.
 *
 *  @brief right justification.
 *  @param right the location of the right side to justify to.
 *
 */
- (void)cpclRight:(NSInteger)right;

/*!
 *  \~chinese
 *
 *  右对齐.
 *
 *  @brief 右对齐.
 *
 *  \~english
 *
 *  right justification.
 *
 *  @brief right justification.
 *
 */
- (void)cpclRight;

/*!
 *  \~chinese
 *
 *  开始多行文本打印.
 *
 *  @brief 开始多行文本打印.
 *  @param lineHeight 每行的高度(点).
 *
 *  \~english
 *
 *  print a number of lines of text using the same font without having to manually specify the spacing or positioning of each line.
 *
 *  @brief Start multiline text printing.
 *  @param lineHeight Spacing between each line in units.
 */
- (void)cpclMultiLineStartWithLineHeight:(NSInteger)lineHeight;

/*!
 *  \~chinese
 *
 *  结束多行文本打印.
 *
 *  @brief 结束多行文本打印.
 *
 *  \~english
 *
 *  terminated multi line command.
 *
 *  @brief terminated multi line command.
 *
 */
- (void)cpclMultiLineEnd;

/*!
 *  \~chinese
 *
 *  指定可放大字体或TrueType字体的旋转角度.
 *
 *  @brief 指定可放大字体或TrueType字体的旋转角度.
 *  @param degrees 逆时针旋转角度.
 *
 *  \~english
 *
 *  specify the rotation of a scalable or TrueType font within the printer.
 *
 *  @brief specify the rotation of a scalable or TrueType font within the printer.
 *  @param degrees The number of degrees to rotate counter-clockwise.
 *
 */
- (void)cpclRotate:(NSInteger)degrees;

/*!
 *  \~chinese
 *
 *  打印缩放文本或TrueType字体文字.
 *
 *  @brief 打印缩放文本或TrueType字体文字.
 *  @param scaledFont   字体名.
 *  @param xScale       横向字体大小(点).
 *  @param yScale       纵向字体大小(点).
 *  @param x            横向起始位置.
 *  @param y            纵向起始位置.
 *  @param text         文本内容.
 *
 *  \~english
 *
 *  print scaled text in CPCL from either a scaled or TrueType font.
 *
 *  @brief print scaled text in CPCL from either a scaled or TrueType font.
 *  @param scaledFont   A scaled font used to create the text.
 *  @param xScale       The X size of the scaled font, in points.
 *  @param yScale       The Y size of the scaled font, in points.
 *  @param x            The X origin of the scaled text in units.
 *  @param y            The Y origin of the scaled text in units.
 *  @param text         The text data to be printed.
 *
 */
- (void)cpclScaleText:(PTCPCLScaledFontName)scaledFont
               xScale:(NSInteger)xScale
               yScale:(NSInteger)yScale
                    x:(NSInteger)x
                    y:(NSInteger)y
                 text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  纵向打印缩放文本或TrueType字体文字.
 *
 *  @brief 纵向打印缩放文本或TrueType字体文字.
 *  @param scaledFont   字体名.
 *  @param xScale       横向字体大小(点).
 *  @param yScale       纵向字体大小(点).
 *  @param x            横向起始位置.
 *  @param y            纵向起始位置.
 *  @param text         文本内容.
 *
 *  \~english
 *
 *  print scaled text in CPCL from either a scaled or TrueType font. rotated 90 degrees.
 *
 *  @brief print scaled text in CPCL from either a scaled or TrueType font. rotated 90 degrees.
 *  @param scaledFont   A scaled font used to create the text.
 *  @param xScale       The X size of the scaled font, in points.
 *  @param yScale       The Y size of the scaled font, in points.
 *  @param x            The X origin of the scaled text in units.
 *  @param y            The Y origin of the scaled text in units.
 *  @param text         The text data to be printed.
 *
 */
- (void)cpclScaleTextVertical:(PTCPCLScaledFontName)scaledFont
                       xScale:(NSInteger)xScale
                       yScale:(NSInteger)yScale
                            x:(NSInteger)x
                            y:(NSInteger)y
                         text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  打印自适应大小文本.仅可放大字体或TrueType字体可用.
 *
 *  @brief 打印自适应大小文本
 *  @param scaledFont   字体名.
 *  @param width        横向打印区域.
 *  @param height       纵向打印区域.
 *  @param x            横向起始位置.
 *  @param y            纵向起始位置.
 *  @param text         文本内容.
 *
 *  \~english
 *
 *  print scaled text which is to fit within a particular bounding box. It can be used with TrueType or scaled fonts.
 *
 *  @brief print scaled text which is to fit within a particular bounding box
 *  @param scaledFont   A scaled font used to create the text.
 *  @param width        The width of the box to contain the text.
 *  @param height       The height of the box to contain the text.
 *  @param x            The X origin of the scaled text in units.
 *  @param y            The Y origin of the scaled text in units.
 *  @param text         The text data to be printed.
 *
 */
- (void)cpclScaleToFit:(PTCPCLScaledFontName)scaleFont
                 width:(NSInteger)width
                height:(NSInteger)height
                     x:(NSInteger)x
                     y:(NSInteger)y
                  text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  字体加粗.
 *
 *  @brief 字体加粗.
 *  @param boldness 加粗程度.
 *
 *  \~english
 *
 *  add a faux bolding effect to pre-scaled fonts.
 *
 *  @brief add a faux bolding effect to pre-scaled fonts.
 *  @param boldness the boldness of the text.
 *
 */
- (void)cpclSetBold:(PTCPCLTextBold)boldness;

/*!
 *  \~chinese
 *
 *  设置字间距.
 *
 *  @brief 设置字间距.
 *  @param spacing 字间距.
 *
 *  \~english
 *
 *  set the horizontal spacing between characters.
 *
 *  @brief set the horizontal spacing between characters.
 *  @param spacing the spacing between characters of a font.
 *
 */
- (void)cpclSetSpacing:(NSInteger)spacing;

/*!
 *  \~chinese
 *
 *  设置字体放大倍数
 *
 *  @brief 设置字体放大倍数
 *  @param width    宽度放大系数, 1-16.
 *  @param height   高度放大系数, 1-16.
 *
 *  \~english
 *
 *  set the output scaling of pre-scaled fonts
 *
 *  @brief set the output scaling of pre-scaled fonts
 *  @param width    the width multiplier of the font, 1-16.
 *  @param height   the height multiplier of the font, 1-16.
 *
 */
- (void)cpclSetMagWithWidth:(PTCPCLFontScale)width height:(PTCPCLFontScale)height;

/*!
 *  \~chinese
 *
 *  打印自动换行文本.
 *
 *  @brief 打印自动换行文本.
 *  @param rotate       文字旋转方向
 *  @param font         字体
 *  @param fontSize     字体放大倍数,该接口默认是0，其他值无效
 *  @param x            起始位置x
 *  @param y            起始位置y
 *  @param safeHeight   打印区域高度,超过高度部分不会打印
 *  @param width        打印区域宽度,宽度为0表示不自动换行
 *  @param lineSpacing  行间隔
 *  @param fontScale    字体放大倍数
 *  @param text         打印内容
 *  @return             自动换行后的实际打印高度
 *
 *  \~english
 *
 *  print text that feed line automatically.
 *
 *  @brief print text that feed line automatically.
 *  @param rotate       text rotate.
 *  @param font         text font.
 *  @param fontSize     text font scale，deault is 0，other values are invalid
 *  @param x            orgin x of text.
 *  @param y            origin y of text.
 *  @param safeHeight   height of text field.Part will not print more than height
 *  @param width        width of text field.if width is 0,not auto line
 *  @param lineSpacing  line space.
 *  @param fontScale    Font magnification factor
 *  @param text         text.
 *  @return             Actual print height after automatic line feed
 */
- (NSInteger)cpclAutoTextWithRotate:(PTCPCLStyleRotation)rotate
                               font:(PTCPCLTextFontName)font
                           fontSize:(NSInteger)fontSize
                                  x:(NSInteger)x
                                  y:(NSInteger)y
                         safeHeight:(NSInteger)safeHeight
                              width:(NSInteger)width
                        lineSpacing:(NSInteger)lineSpacing
                          fontScale:(PTCPCLFontScale)fontScale
                               text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  打印自动换行文本,此接口解决旋转90后打印居中文本,旋转90\270后，cpclCenter接口无效
 *
 *  @brief 打印自动换行文本.
 *  @param rotate       文字旋转方向
 *  @param font         字体
 *  @param fontSize     字体放大倍数,该接口默认是0，其他值无效
 *  @param xPos         起始位置x
 *  @param yPos         起始位置y
 *  @param center       是否居中
 *  @param safeHeight   打印区域高度,超过高度部分不会打印
 *  @param width        打印区域宽度,宽度为0表示不自动换行
 *  @param lineSpacing  行间隔
 *  @param fontScale    字体放大倍数
 *  @param text         打印内容
 *  @return             自动换行后的实际打印高度
 *
 *  \~english
 *
 *  print text that feed line automatically.rotate 90\270,the cpclCenter interface is invalid
 *
 *  @brief print text that feed line automatically
 *  @param rotate       text rotate.
 *  @param font         text font.
 *  @param fontSize     text font scale,deault is 0，other values are invalid
 *  @param xPos         orgin x of text.
 *  @param yPos         origin y of text.
 *  @param center       Whether in the middle
 *  @param safeHeight   height of text field.Part will not print more than height
 *  @param width        width of text field.if width is 0,not auto line
 *  @param lineSpacing  line space.
 *  @param fontScale    Font magnification factor.
 *  @param text         text.
 *  @return             Actual print height after automatic line feed
 */
- (NSInteger)cpclAutoTextWithRotate:(PTCPCLStyleRotation)rotate
                               font:(PTCPCLTextFontName)font
                           fontSize:(NSInteger)fontSize
                               xPos:(NSInteger)xPos
                               yPos:(NSInteger)yPos
                             center:(BOOL)center
                         safeHeight:(NSInteger)safeHeight
                              width:(NSInteger)width
                        lineSpacing:(NSInteger)lineSpacing
                          fontScale:(PTCPCLFontScale)fontScale
                               text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  文本自动换行,建议使用
 *
 *  @brief 自动换行
 *  @param font         字体，中文：PTCPCLThaiFontStyle1，其他：PTCPCLThaiFontStyle0
 *  @param fontSize     字体大小，默认0
 *  @param x            起始位置x
 *  @param y            起始位置y
 *  @param lineSpace    行间隔，默认值30
 *  @param width        打印区域宽度,默认0，若x+width大于页面宽度的话,width=w-x
 *  @param text         打印内容
 *
 *  \~english
 *
 *  Text wrap automatically, recommended
 *
 *  @brief Text wraps automatically
 *  @param font         text font，chinese：PTCPCLThaiFontStyle1，other：PTCPCLThaiFontStyle0
 *  @param fontSize     text font size.deault 0
 *  @param x            orgin x of text.
 *  @param y            origin y of text.
 *  @param lineSpace    Line spacing for automatic line feed.default 30
 *  @param width        width of text field.
 *  @param text         text.
 */
- (void)cpclPrintAutoTextWithFont:(PTCPCLTextLineFontStyle)font
                        fontSize:(NSInteger)fontSize
                               x:(NSInteger)x
                               y:(NSInteger)y
                       lineSpace:(NSInteger)lineSpace
                           width:(NSInteger)width
                            text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  打印居中文本
 *
 *  @brief 打印居中文本
 *  @param rotate       文字旋转方向
 *  @param font         字体
 *  @param fontSize     该参数无效，传0即可
 *  @param x            起始位置x
 *  @param y            起始位置y
 *  @param width        打印区域宽度
 *  @param text         打印内容
 *
 *  \~english
 *
 *  Print center text
 *
 *  @brief Print center text
 *  @param rotate       text rotate.
 *  @param font         text font.
 *  @param fontSize     This parameter is invalid, default is 0
 *  @param x            orgin x of text.
 *  @param y            origin y of text.
 *  @param width        width of textbox
 *  @param text         content of text.
 */
- (void)cpclCenterTextWithRotate:(PTCPCLStyleRotation)rotate
                            font:(PTCPCLTextFontName)font
                        fontSize:(NSInteger)fontSize
                               x:(NSInteger)x
                               y:(NSInteger)y
                           width:(NSInteger)width
                            text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  打印文本.
 *
 *  @brief 打印文本.
 *  @param rotate       文字旋转方向
 *  @param font         字体类型
 *  @param fontSize     字体放大倍数，该参数默认是0，如果选择其他的枚举值，需要打印机固件支持；固件不支持的情况下，放大字体可使用（cpclSetMagWithWidth: height:）接口
 *  @param x            起始位置x
 *  @param y            起始位置y
 *  @param text         打印内容
 *
 *  \~english
 *
 *  print text.
 *
 *  @brief print text.
 *  @param rotate       text rotate.
 *  @param font         text font.
 *  @param fontSize     text font scale，This parameter is 0 by default. If other enumeration values are selected, printer firmware support is required. In cases where the firmware is not supported, the zoom font can be used (cpclSetMagWithWidth: height:) interface
 *  @param x            orgin x of text.
 *  @param y            origin y of text.
 *  @param text         text.
 */
- (void)cpclTextWithRotate:(PTCPCLStyleRotation)rotate
                      font:(PTCPCLTextFontName)font
                  fontSize:(PTCPCLTextFontSize)fontSize
                         x:(NSInteger)x
                         y:(NSInteger)y
                      text:(NSString * _Nonnull)text;

/*!
 *  \~chinese
 *
 *  打印反白加粗文本.
 *
 *  @brief 打印反白加粗文本.
 *  @param font         字体
 *  @param rotate       文字旋转方向
 *  @param fontSize     字体放大倍数，该参数默认是0，如果选择其他的枚举值，需要打印机固件支持；固件不支持的情况下，放大字体可使用（cpclSetMagWithWidth: height:）接口
 *  @param reverse      是否反白
 *  @param bold         加粗
 *  @param x            起始位置x
 *  @param y            起始位置y
 *  @param text         打印内容
 *
 *  \~english
 *
 *  print reverse bold text.
 *
 *  @brief print reverse bold text.
 *  @param font         text font.
 *  @param rotate       text rotate.
 *  @param fontSize     text font scale，This parameter is 0 by default. If other enumeration values are selected, printer firmware support is required. In cases where the firmware is not supported, the zoom font can be used (cpclSetMagWithWidth: height:) interface
 *  @param reverse      Whether it is reversed
 *  @param bold         bold
 *  @param x            origin x of text.
 *  @param y            origin y of text.
 *  @param text         text.
 */
- (void)appendTextWithFont:(PTCPCLTextFontName)font
                    rotate:(PTCPCLStyleRotation)rotate
                  fontSize:(PTCPCLTextFontSize)fontSize
                   reverse:(BOOL)reverse
                      bold:(PTCPCLTextBold)bold
                         x:(NSInteger)x
                         y:(NSInteger)y
                      text:(NSString * _Nonnull)text;

#pragma mark - Background Text Commands
/////////////////////////////////////////////////////////////////////
/***************** Background Text Commands *******************/
/////////////////////////////////////////////////////////////////////

/*!
 *  \~chinese
 *
 *  设置背景黑度值.(0-255) 0：normal，部分机型不支持
 *
 *  @brief 设置背景黑度值
 *  @param value 黑度值.
 *
 *  \~english
 *
 *  Set the background blackness value.(0-255) 0：normal
 *
 *  @brief Set the background blackness value
 *  @param value Set the background blackness value
 *
 */
- (void)cpclSetBackgroundBlacknessValue:(NSInteger)value;

/*!
 *  \~chinese
 *
 *  设置背景文字.
 *
 *  @brief 设置背景文字.
 *  @param font         字体
 *  @param rotate       文字旋转方向
 *  @param fontSize     字体大小
 *  @param xPos         起始位置xPos
 *  @param yPos         起始位置yPos
 *  @param text         打印内容
 *
 *  \~english
 *
 *  set back text，Some models are not supported.
 *
 *  @brief set back text.
 *  @param font         text font.
 *  @param rotate       text rotate.
 *  @param fontSize     Size identifier for the font
 *  @param xPos         x-coordinate of start point
 *  @param yPos         y-coordinate of start point
 *  @param text         The text data to be  printed
 */
- (void)cpclBackTextWithFont:(PTCPCLTextFontName)font
                      rotate:(PTCPCLStyleRotation)rotate
                    fontSize:(NSInteger)fontSize
                        xPos:(NSInteger)xPos
                        yPos:(NSInteger)yPos
                        text:(NSString *_Nonnull)text;

/*!
 *  \~chinese
 *
 *  获取打印机SN号
 *
 *  @brief 获取打印机SN号
 *
 *  \~english
 *
 *  get printer serial number.
 *
 *  @brief get printer serial number.
 *
 */
- (void)cpclGetPrinterSN;

/*!
 *  \~chinese
 *
 *  设置纸张类型1，A400\A300S\A300L不支持该接口
 *
 *  @brief 设置纸张类型1
 *  @param type 纸张类型
 *
 *  \~english
 *
 *  set the paper type1，A400\A300S\A300L does not support this interface
 *
 *  @brief set the paper type1.
 *  @param type paper type.
 *
 */
- (void)cpclPaperTypeWithType:(PTCPCLPaperType)type;

#pragma mark - A400\A300S\A300L For Paper Type
/////////////////////////////////////////////////////////////////////
/****************** A400\A300S\A300L For Paper Type ****************/
/////////////////////////////////////////////////////////////////////
/*!
 *  \~chinese
 *
 *  设置纸张类型2，A400\A300S\A300L机型支持该接口
 *
 *  @brief 设置纸张类型2
 *  @param type 纸张类型
 *
 *  \~english
 *
 *  set the paper type2，A400\A300S\A300L supports this interface
 *
 *  @brief set the paper type2
 *  @param type paper type.
 *
 */
- (void)setPrinterPaperTypeFor4Inch:(PTCPCLNewPaperType)type;

/*!
 *  \~chinese
 *
 *  设置打印浓度.
 *
 *  @brief 设置打印浓度.
 *  @param density 0-2
 *
 *  \~english
 *
 *  set the darkness of the printout from the printer
 *
 *  @brief set the darkness of the printout from the printer
 *  @param density 0-2
 *
 */
- (void)setPrinterDensity:(NSInteger)density;

/*!
 *  \~chinese
 *
 *  获取打印浓度
 *
 *  @brief 获取打印浓度
 *
 *  \~english
 *
 *  get printer density.
 *
 *  @brief get printer density.
 *
 */
- (void)getPrinterDensity;

/*!
 *  \~chinese
 *
 *  获取电量，该接口为自定义功能，部分机型才支持
 *
 *  @brief 获取电量，<000902> 表示92%
 *
 *  \~english
 *
 *  get Printer Battery，This interface is a custom function, which is only supported by some models
 *
 *  @brief get Printer Battery,<000902> is 92%
 *
 */
- (void)getPrinterBattery;

#pragma mark - Line Print Commands
/////////////////////////////////////////////////////////////////////
/***************** Line Print Commands *******************/
/////////////////////////////////////////////////////////////////////

/*!
 *  \~chinese
 *
 *  行模式开启.
 *
 *  @brief 行模式开启.
 *
 *  \~english
 *
 *  start utilities sessions.
 *
 *  @brief start utilities sessions.
 *
 */
- (void)cpclUtilitySession;

/*!
 *  \~chinese
 *
 *  单行功能会话前缀
 *
 *  @brief 单行功能会话前缀
 *
 *  \~english
 *
 *  prefix if a single line utilities session.
 *
 *  @brief prefix if a single line utilities session.
 *
 */
- (void)cpclLineMode;


/*!
 *  \~chinese
 *
 *  设置左边距
 *
 *  @brief 设置左边距
 *  @param offset   距离左边的偏移量.
 *
 *  \~english
 *
 *  Set margin
 *
 *  @brief Set margin
 *  @param offset   Specifics the distance from the left edge in units
 *
 */
- (void)cpclLineMargin:(NSInteger)offset;

/*!
 *  \~chinese
 *
 *  走纸一行
 *
 *  @brief 走纸一行
 *
 *  \~english
 *
 *  feed
 *
 *  @brief feed
 *
 */
- (void)cpclLineFeed;

/*!
 *  \~chinese
 *
 *  设置走纸
 *
 *  @brief 设置走纸
 *  @param amount   走纸多少个点. -4000~4000dots
 *
 *  \~english
 *
 *  Set feed
 *
 *  @brief Set feed
 *  @param amount   How much to feed in units.-4000~4000dots
 *
 */
- (void)cpclFeed:(NSInteger)amount;

/*!
 *  \~chinese
 *
 *  设置打印标签之前的偏移量
 *
 *  @brief 设置打印标签之前的偏移量
 *  @param amount   移动多少个点. 0~4000dots
 *
 *  \~english
 *
 *  when used in a label session, is used to perform an additional media movement before a label is printed
 *
 *  @brief Set the print label before the offset
 *  @param amount   How much to feed in units.0~4000dots
 *
 */
- (void)cpclReverse:(NSInteger)amount;

/*!
 *  \~chinese
 *
 *  设置打印速度.
 *
 *  @brief 设置打印速度.
 *  @param value 打印速度,0-5.
 *
 *  \~english
 *
 *  set the maximum speed at which printout occurs.
 *
 *  @brief set the maximum speed at which printout occurs.
 *  @param value speed to print in an arbitrary scale,0-5.
 *
 */
- (void)cpclSpeed:(NSInteger)value;

/*!
 *  \~chinese
 *
 *  打印结束后定位至下个黑标或标签缝，用于标签纸打印.
 *
 *  @brief 定位下个标签.
 *
 *  \~english
 *
 *  the printer should attempt to synchronize to a mark or gap on the media after the label is printed，Used for label paper printing.
 *
 *  @brief Positioning label
 *
 */
- (void)cpclForm;

/*!
 *  \~chinese
 *
 *  设置打印浓度.
 *
 *  @brief 设置打印浓度.
 *  @param value 输出浓度, -100~200.默认是0
 *
 *  \~english
 *
 *  set the darkness of the printout from the printer.default:0
 *
 *  @brief set the darkness of the printout from the printer
 *  @param value darkness of the printout, -100~200.
 *
 */
- (void)cpclTone:(NSInteger)value;

/*!
 *  \~chinese
 *
 *  设置标签或行打印文本朝向.
 *
 *  @brief 设置标签或行打印文本朝向.
 *  @param degrees 朝向,0 或 180.
 *
 *  \~english
 *
 *  changes the orientation of the printed label or of line print text
 *
 *  @brief changes the orientation of the printed label or of line print text
 *  @param degrees The orientation of the label, 0 or 180.
 *
 */
- (void)cpclTurn:(NSInteger)degrees;

#pragma mark - Utility and Diagnostic
/////////////////////////////////////////////////////////////////////
/****************** Utility and Diagnostic Commands ****************/
/////////////////////////////////////////////////////////////////////


/*!
 *  \~chinese
 *
 *  纸张学习指令，如果打印机显示纸用尽的时候，在合盖无纸的状态下发送该指令
 *
 *  @brief 纸张学习指令.
 *
 *  \~english
 *
 *  Paper learning instructions.If the printer shows that the paper is out of paper, send the instruction in the state of closing the paper
 *
 *  @brief Paper learning instructions
 *
 */
- (void)setPaperLearn;

/*!
 *  \~chinese
 *
 *  设置QRCode的版本，version的范围在0-25，当等于0时，表示程序用自动的；1-25时，表示用现在设置的大小(部分机型支持).
 *
 *  @brief 设置QRCode的版本
 *  @param density 0-25
 *
 *  \~english
 *
 *  Set the QRCode version，the range of version is 0-25, when it is equal to 0, it means that the program uses automatic; 1-25, it means that the size set now，some models are supported
 *
 *  @brief Set the version of QRCode
 *  @param density 0-25
 *
 */
- (void)setQRCodeVersion:(NSInteger)version;

/*!
 *  \~chinese
 *
 *  获取QRCode的版本，部分机型支持
 *
 *  @brief 获取QRCode的版本
 *
 *  \~english
 *
 *  Get the QRCode version，some models are supported
 *
 *  @brief Get the QRCode version
 *
 */
- (void)getQRCodeVersion;

/*!
 *  \~chinese
 *
 *  获取打印机型号，A300S部分固件版本支持
 *
 *  @brief 获取打印机型号
 *
 *  \~english
 *
 *  Get printer model，Part of the A300S firmware version is supported
 *
 *  @brief Get printer model
 *
 */
- (void)cpclGetPrinterModel;

#pragma mark - Codepage
/////////////////////////////////////////////////////////////////////
/*********************  Codepage Commands ********************/
/////////////////////////////////////////////////////////////////////

/*!
 *  \~chinese
 *
 *  设置字符代码页.
 *
 *  @brief 设置字符代码页.
 *  @param codepage "USA" "FRANCE" "GERMANY" "UK" "DENMARK" "SWEDEN" "ITALY" "SPAIN" "JAPAN-S" "NORWAY" "DENMARK II" "SPAIN II" "LATIN9" "KOREA" "SLOVENIA" "CHINA" "BIG5" "CP874" "CP850" "CP437" "CP860" "CP863" "CP865" "CP866" "CP852" "CP858" "CP857" "CP737" "CP720" "CP775" "CP855" "CP862" "CP864" "ISO8859-6" "ISO8859-8" "ISO8859-9" "ISO8859-15" "WPC1252" "WPC1250" "WPC1251" "WPC1252" "WPC1254" "WPC1255" "WPC1256" "ISO8859-1" "ISO8859-2" "ISO8859-3" "ISO8859-4" "ISO8859-5" "TIS11" "TIS18" "WPC1258" "UnicodeBigUnmarked"
 *
 *  \~english
 *
 *  Set Character CodePage
 *
 *  @brief Set Character CodePage
 *  @param codepage "USA" "FRANCE" "GERMANY" "UK" "DENMARK" "SWEDEN" "ITALY" "SPAIN" "JAPAN-S" "NORWAY" "DENMARK II" "SPAIN II" "LATIN9" "KOREA" "SLOVENIA" "CHINA" "BIG5" "CP874" "CP850" "CP437" "CP860" "CP863" "CP865" "CP866" "CP852" "CP858" "CP857" "CP737" "CP720" "CP775" "CP855" "CP862" "CP864" "ISO8859-6" "ISO8859-8" "ISO8859-9" "ISO8859-15" "WPC1252" "WPC1250" "WPC1251" "WPC1252" "WPC1254" "WPC1255" "WPC1256" "ISO8859-1" "ISO8859-2" "ISO8859-3" "ISO8859-4" "ISO8859-5" "TIS11" "TIS18" "WPC1258" "UnicodeBigUnmarked"
 *
 */
- (void)cpclSetCharacterCodePage:(NSString *_Nonnull)codepage;

 /*!
  *  \~chinese
  *
  *  查询高棉语开启状态，00 00：关闭； 01 00：开启
  *
  *  @brief 查询阿拉伯语变形状态
  *
  *  \~english
  *
  *  Get Khmer status:00 00：close； 01 00：open
  *
  *  @brief Get Khmer status
  *
  */
- (void)cpclSearchKhmerState;

/*!
 *  \~chinese
 *
 *  设置高棉语开关状态，打印其他代码页需要先关闭高棉语模式再切换代码页设置模式，打印高棉语时先开启高棉语模式,然后调用cpclSetKhmerCodepage
 *
 *  @brief 设置高棉语开关状态
 *  @param state 0：关闭； 1：开启
 *
 *  \~english
 *
 *  Set the Khmer language switch. To print other code pages, close the Khmer language mode first and then switch the code page setting mode. When printing Khmer language, open the Khmer language mode first,and invoke 'cpclSetKhmerCodepage'
 *
 *  @brief Set Khmer on/off state
 *  @param state 0：close; 1:open
 *
 */
- (void)cpclSetKhmerState:(NSInteger)state;

/*!
 *  \~chinese
 *
 *  设置高棉语代码页，在该代码页下支持8号字体55号字体打印中文，打印完后要退出高棉语模式，调用cpclExitKhmerMode
 *
 *  @brief 查询阿拉伯语变形状态
 *
 *  \~english
 *
 *  Set the Khmer language code page, under which Chinese is printed with font size of 8 and font size of 55. After printing, exit Khmer mode and call cpclExitKhmerMode
 *
 *  @brief Set Khmer codepage
 *
 */
- (void)cpclSetKhmerCodepage;

/*!
 *  \~chinese
 *
 *  退出高棉语模式
 *
 *  @brief 退出高棉语模式
 *
 *  \~english
 *
 * Exit Khmer language mode
 *
 *  @brief Exit Khmer language mode
 *
 */
- (void)cpclExitKhmerMode;

/*!
 *  \~chinese
 *
 *  阿拉伯语变形,设置后重启打印机
 *
 *  @brief 阿拉伯语变形,设置后重启打印机
 *  @param function 48：关闭； 49：变形1，按单词排序；50：变形2，按短语排序；51：变形3，按完整规则排序
 *
 *  \~english
 *
 *  Arabic transform
 *
 *  @brief Arabic transform
 *  @param function 48：close； 49：Sort by word；50：Phrase sort；51：Sort by complete rules
 *
 */
- (void)cpclSetArabicTransformFunction:(NSInteger)function;

/*!
 *  \~chinese
 *
 *  查询阿拉伯语变形状态，00 00：关闭； 01 00：变形1； 02 00：变形2； 03 00：变形3
 *
 *  @brief 查询阿拉伯语变形状态
 *
 *  \~english
 *
 *  get Arabic status:00 00：close； 01 00：Sort by word； 02 00：Phrase sort； 03 00：Sort by complete rules
 *
 *  @brief get Arabic status
 *
 */
- (void)cpclGetArabicTransformStatus;


/*!
 *  \~chinese
 *
 *  泰文变形开启
 *
 *  @brief 泰文变形开启
 *  @param status 48：close 49:open
 *
 *  \~english
 *
 *  Thai transform status
 *
 *  @brief Thai transform status
 *  @param status 48：close 49:open
 *
 */
- (void)cpclSetThaiTransformStatus:(NSInteger)status;

/*!
 *  \~chinese
 *
 *  越南语变形，设置后重启打印机.
 *
 *  @brief 越南语变形，设置后重启打印机.
 *  @param function 48：关闭； 49：ASCII输入； 50：UTF-8输入
 *
 *  \~english
 *
 *  Set Vietnamese Transform
 *
 *  @brief Set Vietnamese Transform
 *  @param function 48：close; 49：ASCII; 50：UTF-8
 *
 */
- (void)cpclSetVietnameseTransformFunction:(NSInteger)function;

/*!
 *  \~chinese
 *
 *  查询越南语变形状态，00 00：关闭； 01 00：ASCII输入； 02 00：UTF-8输入；
 *
 *  @brief 查询越南语变形状态
 *
 *  \~english
 *
 *  get Vietnamese status:00 00：close； 01 00：ASCII； 02 00：UTF-8；
 *
 *  @brief get Vietnamese status
 *
 */
- (void)cpclGetVietnameseTransformStatus;

#pragma mark - RFID
/////////////////////////////////////////////////////////////////////
///////////////////////RFID 具体看协议////////////////////////////////////
/////////////////////////////////////////////////////////////////////

/*!
 *  \~chinese
 *
 *  校准RFID
 *
 *  @brief RFID 校准
 *
 *  \~english
 *
 *  Calibration RFID
 *
 *  @brief RFID Calibration
 *
 */
- (void)rfidCalibrate;

/*!
 *  \~chinese
 *
 *  写入或读取RFID时，首先需要调用这个接口
 *
 *  @brief RFID 打印
 *
 *  \~english
 *
 *  When writing or reading RFID, you first need to call this interface
 *
 *  @brief RFID Print
 *
 */
- (void)rfidPrint;

/*!
 *  \~chinese
 *
 *  写入RFID，数据长度范围参考存储区域枚举,数据长度超过区域内存大小，则返回false
 *
 *  @brief 写入RFID标签
 *
 *  @param content        写入的数据
 *  @param beginAddr      起始位置，默认是0; EPC区时，默认为2
 *  @param memory         存储区域
 
 *
 *  \~english
 *
 *  Write RFID,The data length range refers to the storage area enumeration，Returns false if the data length exceeds the region memory size
 *
 *  @brief Write RFID label
 *
 *  @param content        data
 *  @param beginAddr      Start position, default is 0; For EPC, default is 2
 *  @param memory         memory area
 *
 */
- (BOOL)rfidWriteData:(NSString *_Nonnull)content beginAddr:(NSInteger)beginAddr memory:(PTCPCLRFIDMemory)memory;

/*!
 *  \~chinese
 *
 *  读取RFID标签;读取的长度可直接用区域的最大值;TID区域只读不可写
 *
 *  @brief 读取RFID标签
 *
 *  @param length         读取的数据长度，只能是偶数
 *  @param beginAddr      起始位置，默认是0; EPC区时，默认为2
 *  @param memory         存储区域
 *
 *  \~english
 *
 *  Write RFID;The data length range refers to the storage area enumeration;The TID section is read-only and not writable
 *
 *  @brief Write RFID，The length of the read can be used directly by the maximum value of the region
 *
 *  @param length         The length of the data read can only be an even number
 *  @param beginAddr      Start position, default is 0; For EPC, default is 2
 *  @param memory         memory area
 *
 */
- (void)rfidReadDataWithLength:(NSInteger)length beginAddr:(NSInteger)beginAddr memory:(PTCPCLRFIDMemory)memory;




@end








