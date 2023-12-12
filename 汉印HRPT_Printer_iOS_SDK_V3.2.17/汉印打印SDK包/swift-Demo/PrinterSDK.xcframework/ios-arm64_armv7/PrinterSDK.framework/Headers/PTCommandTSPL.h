/*!
 *  \~chinese
 *  @header PTCommandTSPL.h
 *  @abstract TSPL指令
 *
 *  \~english
 *  @header PTCommandTSPL.h
 *  @abstract TSPL Command
 */

#import <Foundation/Foundation.h>
#import "SDKDefine.h"
#import "PTBitmapManager.h"

/*!
 *  \~chinese
 *  打印速度
 *
 *  \~english
 *  Print speed
 */
typedef NS_ENUM(NSUInteger, PTTSCPrintSpeed) {
    PTTSCPrintSpeed1        = 1,
    PTTSCPrintSpeed2        = 2,
    PTTSCPrintSpeed3        = 3,
    PTTSCPrintSpeed4        = 4,
    PTTSCPrintSpeed5        = 5,
    PTTSCPrintSpeed6        = 6,
    PTTSCPrintSpeed10       = 10,
    PTTSCPrintSpeed12       = 12
};

/*!
 *  \~chinese
 *  打印浓度
 *
 *  \~english
 *  Print density
 */
typedef NS_ENUM(NSUInteger, PTTSCPrintDensity) {
    PTTSCPrintDensity0        = 0,
    PTTSCPrintDensity1        = 1,
    PTTSCPrintDensity2        = 2,
    PTTSCPrintDensity3        = 3,
    PTTSCPrintDensity4        = 4,
    PTTSCPrintDensity5        = 5,
    PTTSCPrintDensity6        = 6,  ///< default
    PTTSCPrintDensity7        = 7,
    PTTSCPrintDensity8        = 8,
    PTTSCPrintDensity9        = 9,
    PTTSCPrintDensity10       = 10,
    PTTSCPrintDensity11       = 11,
    PTTSCPrintDensity12       = 12,
    PTTSCPrintDensity13       = 13,
    PTTSCPrintDensity14       = 14,
    PTTSCPrintDensity15       = 15
};

/*!
 *  \~chinese
 *  打印方向
 *
 *  \~english
 *  DIRECTION
 */
typedef NS_ENUM(NSUInteger, PTTSCPrintDirection) {
    
    /*! \~chinese 正常方向 \~english normal */
    PTTSCPrintDirectionNormal    = 0,
    
    /*! \~chinese 反向 \~english Reverse */
    PTTSCPrintDirectionReverse   = 1
};

/*!
 *  \~chinese
 *  打印模式
 *
 *  \~english
 *  Print Mode
 */
typedef NS_ENUM(NSUInteger, PTTSCPrintStyle) {
    
    /*! \~chinese 正常模式 \~english normal */
    PTTSCPrintStyleNormal    = 0,
    /*! \~chinese 镜像模式 \~english Mirror */
    PTTSCPrintStyleMirror    = 1
};

/*!
 *  \~chinese
 *  国际字符集类型
 *
 *  \~english
 *  International character
 */
typedef NS_ENUM(NSUInteger, PTTSCCharacterStyle) {
    PTTSCCharacterStyleUSA                = 0,
    PTTSCCharacterStyleBritish,
    PTTSCCharacterStyleGerman,
    PTTSCCharacterStyleFrench,
    PTTSCCharacterStyleDanish,
    PTTSCCharacterStyleItalian,
    PTTSCCharacterStyleSpanish,
    PTTSCCharacterStyleSwedish,
    PTTSCCharacterStyleSwiss,
    PTTSCCharacterStyleUnitedStates,
    PTTSCCharacterStyleMultilingual,
    PTTSCCharacterStyleSlavic,
    PTTSCCharacterStylePortuguese,
    PTTSCCharacterStyleCanadianOrFrench,
    PTTSCCharacterStyleNordic,
    PTTSCCharacterStyleTurkish,
    PTTSCCharacterStyleWindowsCentralEurope,
    PTTSCCharacterStyleWindowsLatin,
    PTTSCCharacterStyleWindowsGreek,
    PTTSCCharacterStyleWindowsTurkish
};

/*!
 *  \~chinese
 *  一维条码类型
 *
 *  \~english
 *  Barcode type
 */
typedef NS_ENUM(NSUInteger, PTTSCBarcodeStyle) {
    PTTSCBarcodeStyle128     = 0,
    PTTSCBarcodeStyle128M,
    PTTSCBarcodeStyleEAN128,
    PTTSCBarcodeStyle25,
    PTTSCBarcodeStyle25C,
    PTTSCBarcodeStyle39,
    PTTSCBarcodeStyle39C,
    PTTSCBarcodeStyle93,
    PTTSCBarcodeStyleEAN13,
    PTTSCBarcodeStyleEAN132,
    PTTSCBarcodeStyleEAN135,
    PTTSCBarcodeStyleEAN8,
    PTTSCBarcodeStyleEAN82,
    PTTSCBarcodeStyleEAN85,
    PTTSCBarcodeStyleCODA,
    PTTSCBarcodeStylePOST,
    PTTSCBarcodeStyleUPCA,
    PTTSCBarcodeStyleUPCA2,
    PTTSCBarcodeStyleUPCA5,
    PTTSCBarcodeStyleUPCE,
    PTTSCBarcodeStyleUPCE2,
    PTTSCBarcodeStyleUPCE5,
    PTTSCBarcodeStyleCPOST,
    PTTSCBarcodeStyleMSI,
    PTTSCBarcodeStyleMSIC,
    PTTSCBarcodeStylePLESSY,
    PTTSCBarcodeStyleITF14,
    PTTSCBarcodeStyleEAN14,
    PTTSCBarcodeStyle11
};

/*!
 *  \~chinese
 *  是否可识别
 *
 *  \~english
 *  Readable
 */
typedef NS_ENUM(NSUInteger, PTTSCBarcodeReadbleStyle) {
    
    /*! \~chinese 不可识别 \~english not */
    PTTSCBarcodeReadbleStyleNot    = 0,
    
    /*! \~chinese 可识别 \~english human */
    PTTSCBarcodeReadbleStyleHuman
};

/*!
 *  \~chinese
 *  旋转角度
 *
 *  \~english
 *  Rotation
 */
typedef NS_ENUM(NSUInteger, PTTSCStyleRotation) {
    
    /*! \~chinese 正常打印 \~english normal */
    PTTSCStyleRotation0     = 0,
    /*! \~chinese 顺时针旋转90度 \~english rotate 90 degrees (clockwise) */
    PTTSCStyleRotation90    = 90,
    /*! \~chinese 180度旋转 \~english inverted 180 degrees */
    PTTSCStyleRotation180   = 180,
    /*! \~chinese 270度旋转 \~english read from bottom up, 270 degrees */
    PTTSCStyleRotation270   = 270
};

/*!
 *  \~chinese
 *  条码宽窄条比例
 *
 *  \~english
 *  The ratio of wide to narrow bars
 */
typedef NS_ENUM(NSUInteger, PTTSCBarcodeRatio) {
    PTTSCBarcodeRatio1 = 1,     ///< 1:1
    PTTSCBarcodeRatio2,         ///< 1:2
    PTTSCBarcodeRatio3,         ///< 1:3
    PTTSCBarcodeRatio4,         ///< 2:5
    PTTSCBarcodeRatio5          ///< 3:7
};

/*!
 *  \~chinese
 *  二维码纠错等级
 *
 *  \~english
 *  Error correction recovery level
 */
typedef NS_ENUM(UInt8, PTTSCQRcodeEcclevel) {
    
    /*! \~chinese ⾼密度级别 \~english high density level level */
    PTTSCQRcodeEcclevelL    = 'L',
    
    /*! \~chinese 标准级别 \~english standard level */
    PTTSCQRcodeEcclevelM    = 'M',
    
    /*! \~chinese 高可靠级别 \~english high reliability level */
    PTTSCQRcodeEcclevelQ    = 'Q',
    
    /*! \~chinese 极高可靠级别 \~english ultra-high reliability level */
    PTTSCQRcodeEcclevelH    = 'H'      
};

/*!
 *  \~chinese
 *  二维码大小
 *
 *  \~english
 *  cell width
 */
typedef NS_ENUM(NSUInteger, PTTSCQRcodeWidth) {
    PTTSCQRcodeWidth1      = 1,
    PTTSCQRcodeWidth2,
    PTTSCQRcodeWidth3,
    PTTSCQRcodeWidth4,
    PTTSCQRcodeWidth5,
    PTTSCQRcodeWidth6,
    PTTSCQRcodeWidth7,
    PTTSCQRcodeWidth8,
    PTTSCQRcodeWidth9,
    PTTSCQRcodeWidth10
};

/*!
 *  \~chinese
 *  二维码模式
 *
 *  \~english
 *  qrcode mode
 */
typedef NS_ENUM(UInt8, PTTSCQRCodeMode) {
    /*! \~chinese 自动 \~english auto */
    PTTSCQRCodeModeAuto    = 'A',  
    
    /*! \~chinese 手动 \~english Manual */
    PTTSCQRCodeModeManual  = 'M'
};

/*!
 *  \~chinese
 *  二维码模型
 *
 *  \~english
 *  qrcode model
 */
typedef NS_ENUM(NSUInteger, PTTSCQRCodeModel) {
    
    /*! \~chinese 默认值，原始版本 \~english (default), original version */
    PTTSCQRCodeModelM1    = 0,
    
    /*! \~chinese 增强版本 \~english enhanced version */
    PTTSCQRCodeModelM2    = 1
};

/*!
 *  \~chinese
 *  二维码mask
 *
 *  \~english
 *  qrcode mask
 */
typedef NS_ENUM(NSUInteger, PTTSCQRcodeMask) {
    PTTSCQRcodeMaskS0      = 1,
    PTTSCQRcodeMaskS1,
    PTTSCQRcodeMaskS2,
    PTTSCQRcodeMaskS3,
    PTTSCQRcodeMaskS4,
    PTTSCQRcodeMaskS5,
    PTTSCQRcodeMaskS6,
    PTTSCQRcodeMaskS7,
    PTTSCQRcodeMaskS8
};

/*!
 *  \~chinese
 *  位图模式
 *
 *  \~english
 *  qrcode mask
 */
typedef NS_ENUM(NSUInteger, PTTSCBitmapMode) {
    
    PTTSCBitmapModeOVERWRITE            = 0,
    PTTSCBitmapModeOR                   = 1,
    PTTSCBitmapModeXOR                  = 2,
    
    /*! *\~chinese 压缩模式，兼容旧的固件，新的固件已经废弃 *\~english Compatible with old models,New firmware has been deprecated */
    PTTSCBitmapModeCompress             = 3,
    PTTSCBitmapModeOVERWRITECompress    = 16,
    PTTSCBitmapModeORCompress           = 17,
    PTTSCBitmapModeXORCompress          = 18
};


/*!
 *  \~chinese
 *  文本字体类型(含有矢量字库的机型),中文只能选9
 *
 *  \~english
 *  Text font type，for vector and ，chinese onlt select 9
 */
typedef NS_ENUM(NSUInteger, PTTSCTextVectorFontStyle) {
    
    PTTSCTextVectorFontStyle0      = 0,   ///< 8x12，not adjuset
    PTTSCTextVectorFontStyle1,            ///< 8x12
    PTTSCTextVectorFontStyle2,            ///< 12x20
    PTTSCTextVectorFontStyle3,            ///< 16x24
    PTTSCTextVectorFontStyle4,            ///< 24x32
    PTTSCTextVectorFontStyle5,            ///< 32x48
    PTTSCTextVectorFontStyle6,            ///< 14x19
    PTTSCTextVectorFontStyle7,            ///< 21x27
    PTTSCTextVectorFontStyle8,            ///< 14x25
    PTTSCTextVectorFontStyle9             ///< vector font,for chinese
};

/*!
 *  \~chinese
 *  文本字体类型,支持中英文
 *
 *  \~english
 *  Text font type,Support Chinese and English
 */
typedef NS_ENUM(NSUInteger, PTTSCTextFontStyle) {
    PTTSCTextFontStyle0      = 0,   ///< chinese:24x24   english:12x24
    PTTSCTextFontStyle1,            ///< chinese:16x16   english:8x16
};

/*!
 *  \~chinese
 *  DMATRIX二维码的模块尺寸
 *
 *  \~english
 *  Module size for DMATRIX 2D bar code
 */
typedef NS_ENUM(UInt8, PTTSCDMATRIXSize) {
    PTTSCDMATRIXSizeX6    = 0,
    PTTSCDMATRIXSizeX8
};


@interface PTCommandTSPL : NSObject

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
@property(strong,nonatomic,readwrite) NSMutableData *cmdData;

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


/////////////////////////////////////////////////////////////////////
/*********************  Setup and System Commands ********************/
/////////////////////////////////////////////////////////////////////
/*!
 *  \~chinese
 *
 *  自检，打印打印机信息.
 *
 *  @brief 打印自检页
 *
 *  \~english
 *
 *  printer Print self-test message.
 *
 *  @brief View Printer Message
 */
- (void)selfTest;

/*!
 *  \~chinese
 *
 *  添加指令.
 *
 *  @brief 拼接指令
 *  @param cmd 指令文本.使用encoding属性进行编码.
 *
 *  \~english
 *
 *  append command.
 *
 *  @brief Append Command
 *  @param cmd command text. encode with encoding property.
 *
 */
- (void)appendCommand:(NSString *)cmd;

/*!
 *  \~chinese
 *
 *  设置打印纸张范围大小,传的是毫米.1mm == 8 dot
 *
 *  @brief 设置打印区域
 *  @param label_width     标签纸的宽度
 *  @param label_height    标签纸的高度
 *
 *  \~english
 *
 *  This command defines the label width and length(mm).1mm == 8 dot
 *
 *  @brief Set Print Area
 *  @param label_width     Label width
 *  @param label_height    Label length
 *
 */
- (void)setPrintAreaSizeWithWidth:(NSInteger)label_width
                           height:(NSInteger)label_height;

/*!
 *  \~chinese
 *
 *  设置标签纸的间距,传的是毫米.
 *
 *  @brief 设置标签纸的间距
 *  @param distance     两张标签紙中间的垂直距离,0 ≤ distance ≤ 25.4 (mm)
 *  @param offset       垂直间距的偏移
 *
 *  \~english
 *
 *  This command sets the distance between two labels(mm).
 *
 *  @brief Set Label Distance
 *  @param distance     The gap distance between two labels,0 ≤ distance ≤ 25.4 (mm)
 *  @param offset       The offset distance of the gap offset ≤ label length (mm)
 *
 */
- (void)setGapWithDistance:(NSInteger)distance
                    offset:(NSInteger)offset;

/*!
 *  \~chinese
 *
 *  设置黑线的高度和用户自定义的额外的标签进纸长度(毫米).(height,offset 为0,0表示连续标签)
 *
 *  @brief 设置进纸长度
 *  @param height       黑线的高度 0~25.4 mm
 *  @param offset       黑线偏移量 0~label length
 *
 *  \~english
 *
 *  This command sets the height of the black line and the user-defined extra label feeding length each form feed takes(mm).(height,offset is 0,0 : Continuous label)
 *
 *  @brief Bline
 *  @param height       The height of black line either in mm. 0 ≤ m ≤ 25.4 (mm)
 *  @param offset       The extra label feeding length. 0 ≤ offset ≤ label length
 *
 */
- (void)setBlineWithHeight:(NSInteger)height
                    offset:(NSInteger)offset;

/*!
 *  \~chinese
 *
 *  设置打印机定位完后再走纸多少毫米.
 *
 *  @brief 定位后走纸
 *  @param distance     纸张走纸的距离,0 ≤ distance ≤ 25.4 (mm)
 *
 *  \~english
 *
 *  This command defines the selective, extra label feeding length(mm).
 *
 *  @brief Offset Length
 *  @param distance     The offset distance,0 ≤ distance ≤ 25.4 (mm)
 *
 */
- (void)setOffsetWithDistance:(NSInteger)distance;

/*!
 *  \~chinese
 *
 *  将标签定位到下一个标签的起始处.
 *
 *  @brief 定位
 *  \~english
 *
 *  This command feeds label to the beginning of next label.
 *
 *  @brief Form Feed
 */
- (void)feedToNextLabel;

/*!
 *  \~chinese
 *
 *  设置标签进纸的长度(dots).
 *
 *  @brief 设置标签进纸的长度
 *  @param length     纸张走纸的距离,1 ≤ length ≤ 9999
 *
 *  \~english
 *
 *  This command feeds label with the specified length.
 *
 *  @brief Feed Length
 *  @param length     The length is specified by dot. 1 ≤ length ≤ 9999
 *
 */
- (void)setFeedLength:(NSInteger)length;

/*!
 *  \~chinese
 *
 *  设置打印速度.
 *
 *  @brief 设置打印速度
 *  @param speed     打印速度
 *
 *  \~english
 *
 *  This command defines the print speed.
 *
 *  @brief Print Speed
 *  @param speed     Printing speed in inch per second
 *
 */
- (void)setPrintSpeed:(PTTSCPrintSpeed)speed;

/*!
 *  \~chinese
 *
 *  设置打印浓度.
 *
 *  @brief 设置打印浓度
 *  @param density     打印浓度
 *
 *  \~english
 *
 *  This command sets the printing darkness.
 *
 *  @brief Print Density
 *  @param density     0: specifies the lightest level,15: specifies the darkest level
 *
 */
- (void)setPrintDensity:(PTTSCPrintDensity)density;

/*!
 *  \~chinese
 *
 *  设置打印的方向和镜像.
 *
 *  @brief 设置打印的方向和镜像
 *  @param direction    正常或者方向打印
 *  @param mirror       正常或者镜像
 *
 *  \~english
 *
 *  This command defines the printout direction and mirror image.
 *
 *  @brief Print Direction And Mirror
 *  @param direction    normal or reverse
 *  @param mirror       normal or mirror
 *
 */
- (void)setPrintDirection:(PTTSCPrintDirection)direction mirror:(PTTSCPrintStyle)mirror;

/*!
 *  \~chinese
 *
 *  设置标签的参考起点.
 *
 *  @brief 设置标签的参考起点
 *  @param x_pos    水平方向的坐标，以点为单位
 *  @param y_pos    垂直方向的坐标，以点为单位
 *
 *  \~english
 *
 *  This command defines the reference point of the label.
 *
 *  @brief Set Label Reference Point
 *  @param x_pos    Horizontal coordinate (in dots)
 *  @param y_pos    Vertical coordinate (in dots)
 *
 */
- (void)setReferenceXPos:(NSInteger)x_pos
                    yPos:(NSInteger)y_pos;

/*!
 *  \~chinese
 *
 *  设置国际字符集代码.
 *
 *  @brief 设置国际字符集代码
 *  @param codepage     字符集类型
 *
 *  \~english
 *
 *  This command defines the code page of international character set.
 *
 *  @brief International Character Set
 *  @param codepage     Name or number of code page
 *
 */
- (void)setCodePage:(PTTSCCharacterStyle)codepage;

/*!
 *  \~chinese
 *
 *  清除图像缓冲区.
 *
 *  @brief 清除图像缓冲区
 *  \~english
 *
 *  This command clears the image buffer.
 *
 *  @brief Clear Buffer
 */
- (void)setCLS;

/*!
 *  \~chinese
 *
 *  回纸.
 *
 *  @brief 回纸
 *  @param distance     回纸的距离，以点为单位(1,9999)
 *
 *  \~english
 *
 *  This command feeds the label in reverse. The length is specified by dot.
 *
 *  @brief Feeds Label In Reverse
 *  @param distance     unit: dot,(1,9999)
 *
 */
- (void)setBackFeed:(NSInteger)distance;

/*!
 *  \~chinese
 *
 *  回纸.
 *
 *  @brief 回纸
 *  @param distance     回纸的距离，以点为单位(1,9999)
 *
 *  \~english
 *
 *  This command feeds the label in reverse. The length is specified by dot.
 *
 *  @brief Feeds Label In Reverse
 *  @param distance     unit: dot,(1,9999)
 *
 */
- (void)setBackUP:(NSInteger)distance;

/*!
 *  \~chinese
 *
 *  设置标签定位到内部传感器确定的起点.
 *
 *  @brief 设置标签定位起点
 *  \~english
 *
 *  This command will feed label until the internal sensor has determined the origin.
 *
 *  @brief Feed label until the internal sensor has determined the origin
 */
- (void)setHome;

/*!
 *  \~chinese
 *
 *  打印数量.
 *
 *  @brief 开始打印，设置打印数量
 *  @param sets      打印份数
 *  @param copies    每份打印的张数
 *
 *  \~english
 *
 *  This command prints the label format currently stored in the image buffer.
 *
 *  @brief Begin Print,Set Print Copies
 *  @param sets     Specifies how many sets of labels will be printed.
 *  @param copies   Specifies how many copies should be printed for each particular label set.
 *
 */
- (void)printWithSets:(NSInteger)sets copies:(NSInteger)copies;

/*!
 *  \~chinese
 *
 *  控制蜂鸣器的频率，可设置10阶的声音.
 *
 *  @brief 控制蜂鸣器的频率
 *  @param level        音阶0~9
 *  @param interval     时间长度1~4095
 *
 *  \~english
 *
 *  This command controls the sound frequency of the beeper. There are 10 levels of sounds.
 *
 *  @brief Control Frequency
 *  @param level        Sound level: 0~9
 *  @param interval     Sound interval: 1~4095
 *
 */
- (void)setSoundWithLevel:(NSInteger)level interval:(NSInteger)interval;

/*!
 *  \~chinese
 *
 *  设置切纸.
 *  @brief 设置切纸
 *
 *  \~english
 *
 *  This command activates the cutter to immediately cut the labels without back feeding the label.
 *
 *  @brief Set Cutter
 */
- (void)setCut;

/*!
 *  \~chinese
 *
 *  设置打印机进纸时,若无法正确的间隙位置，则会发生错误，立即停止进纸.
 *
 *  @brief 设置进纸长度
 *  @param max_len    传感器检测的最大长度
 *
 *  \~english
 *
 *  If the gap sensor is not set to a suitable sensitivity while feeding labels, the printer will not be able to locate the correct position of the gap.
 *
 *  @brief Set Feed Length
 *  @param max_len     The maximum length for sensor detecting.
 *
 */
- (void)setLimitFeed:(NSInteger)max_len;

/*!
 *  \~chinese
 *
 *  设置字体加粗.
 *
 *  @brief 设置字体加粗
 *  @param bold     true:加粗  false:不加粗
 *
 *  \~english
 *
 *  Set font bold.
 *
 *  @brief Font Bold
 *  @param bold     true:bold  false:not bold
 *
 */
- (void)setFontBold:(BOOL)bold;

/*!
 *  \~chinese
 *
 *  开关打印状态回调.
 *
 *  @brief 自动回传状态
 *  @note 开启之后，每打印一张都会返回10个字节的数据，格式：指令头4个字节(aa bb cc dd) + 4个字节的打印张数(从开启到关闭的打印总张数) + 1个字节的状态 + 结束符00,
    返回两次数据，第一次表示返回可获取打印总张数和状态，第二次表示打印结束
    比如：1.aabbccdd 03000000 2000
         2.aabbccdd ffffffff 0000 -> 打印结束
           aabbccdd 00000000 0000 -> 关闭自动回传
 *  @param status     true:开启  false:关闭
 *
 *  \~english
 *
 *  Turn on/off print status callback.
 *
 *  @brief Automatic Return Status
 *  @note Returns 10 bytes of data,4-byte instruction header(aa bb cc dd) + 4 bytes of printed sheets + 1 byte status + Terminator(00),Returns twice the data, the first time to return to get the total number of prints and the status, the second time to end the end of printing
 
 *  @param status     true:open  false:close
 *
 */
- (void)setPrinterStateAutomaticBackWithStatus:(BOOL)status;

/*!
 *  \~chinese
 *
 *  获取打印机状态.
 *
 *  @brief 获取打印机状态
 *
    | 位(返回值) |    状态      |
    | --------- | ----------- |
    |     0     |    开盖      |
    |     1     |    卡纸      |
    |     2     |    缺纸      |
    |     3     |    无碳带    |
    |     4     |    暂停      |
    |     5     |    打印中    |
    |     6     |    开盖      |
    |     7     |    高温      |
 *
 *  \~english
 *
 *  Get print status.
 *  @brief Get Print Status
 *
    | Bit(return value) |    Status     |
    | ----------------- | ------------- |
    |        0          | Head opened   |
    |        1          | Paper jam     |
    |        2          | Out of paper  |
    |        3          | Out of ribbon |
    |        4          | Pause         |
    |        5          | Printing      |
    |        6          | Cover opened  |
    |        7          | High          |
 *
 */
- (void)getPrinterStatus;


/////////////////////////////////////////////////////////////////////
/*********************  Label Commands ********************/
/////////////////////////////////////////////////////////////////////

/*!
 *  \~chinese
 *
 *  在标签上画一条线.
 *
 *  @brief 画线
 *  @param x_pos    左上角水平方向起始点，以点表示
 *  @param y_pos    左上角垂直方向起始点，以点表示
 *  @param width    线宽，以点表示
 *  @param height   线高，以点表示
 *
 *  \~english
 *
 *  This command draws a bar on the label format.
 *
 *  @brief Draws Bar
 *  @param x_pos    The upper left corner x-coordinate (in dots)
 *  @param y_pos    The upper left corner y-coordinate (in dots)
 *  @param width    Bar width (in dots)
 *  @param height   Bar height (in dots)
 *
 */
- (void)drawBarWithXPos:(NSInteger)x_pos
                   yPos:(NSInteger)y_pos
                  width:(NSInteger)width
                 height:(NSInteger)height;

/*!
 *  \~chinese
 *
 *  打印一维条码.
 *
 *  @brief 打印一维条码
 *  @param x_pos        指定标签上条形码的x坐标
 *  @param y_pos        指定标签上条形码的y坐标
 *  @param type         条码类型
 *  @param height       条码高度
 *  @param readable     是否可读：0，不可读，1，可读
 *  @param rotation     旋转角度
 *  @param ratio        条码宽窄条比例
 *  @param context      条码内容
 *
 *  \~english
 *
 *  This command prints 1D barcodes.
 *
 *  @brief 1D Barcodes
 *  @param x_pos        Specify the x-coordinate of the bar code on the label
 *  @param y_pos        Specify the y-coordinate of the bar code on the label
 *  @param type         code type
 *  @param height       Bar code height (in dots)
 *  @param readable     0: not readable  1: human readable
 *  @param rotation     Rotation
 *  @param ratio        The ratio of wide to narrow bars
 *  @param context      The maximum number of digits of bar code content
 *
 */
- (void)printBarcodeWithXPos:(NSInteger)x_pos
                        yPos:(NSInteger)y_pos
                        type:(PTTSCBarcodeStyle)type
                      height:(NSInteger)height
                    readable:(PTTSCBarcodeReadbleStyle)readable
                    rotation:(PTTSCStyleRotation)rotation
                       ratio:(PTTSCBarcodeRatio)ratio
                     context:(NSString *)context;

/*!
 *  \~chinese
 *
 *  打印二维条码.
 *
 *  @brief 打印二维条码
 *  @param x_pos        指定标签上二维码的x坐标
 *  @param y_pos        指定标签上二维码的y坐标
 *  @param ecc_level    纠错等级
 *  @param width        二维码大小
 *  @param mode         二维码模式
 *  @param rotation     旋转角度
 *  @param model        二维码模型
 *  @param mask         二维码mask
 *  @param context      二维码内容
 *
 *  \~english
 *
 *  This command prints QR code.
 *
 *  @brief QR Code
 *  @param x_pos        Specify the x-coordinate of the qr code on the label
 *  @param y_pos        Specify the y-coordinate of the qr code on the label
 *  @param ecc_level    Error correction recovery level
 *  @param width        cell width
 *  @param mode         mode
 *  @param rotation     Rotation
 *  @param model        model
 *  @param mask         mask
 *  @param context      qrcode context
 *
 */
- (void)printQRcodeWithXPos:(NSInteger)x_pos
                       yPos:(NSInteger)y_pos
                   eccLevel:(PTTSCQRcodeEcclevel)ecc_level
                  cellWidth:(PTTSCQRcodeWidth)width
                       mode:(PTTSCQRCodeMode)mode
                   rotation:(PTTSCStyleRotation)rotation
                      model:(PTTSCQRCodeModel)model
                       mask:(PTTSCQRcodeMask)mask
                    context:(NSString *)context;

/*!
 *  \~chinese
 *
 *  打印图片.
 *
 *  @brief 打印图片
 *  @param xpos        x起始坐标
 *  @param ypos        y起始坐标
 *  @param mode        图形模式
 *  @param image       打印的图片
 *  @param bitmapMode  打印的图片模式
 *  @param compress    压缩模式
 *
 *  \~english
 *
 *  Print Bitmap.
 *
 *  @brief Print Bitmap
 *  @param xpos        Specify the x-coordinate
 *  @param ypos        Specify the y-coordinate
 *  @param mode        Graphic modes
 *  @param image       Image
 *  @param bitmapMode  Bitmap mpde:binary/dithering
 *  @param compress    Compress mode:TIFF/ZPL2/LZO/None
 *
 */
- (void)addBitmapWithXPos:(NSInteger)xpos
                     yPos:(NSInteger)ypos
                     mode:(PTTSCBitmapMode)mode
                    image:(CGImageRef)image
               bitmapMode:(PTBitmapMode)bitmapMode
                 compress:(PTBitmapCompressMode)compress;



/*!
 *  \~chinese
 *
 *  打印文本(针对点阵字库机型).
 *
 *  @brief 打印文本(点阵字库)
 *  @param x_pos                x起始坐标
 *  @param y_pos                y起始坐标
 *  @param font                 字体类型
 *  @param rotation             旋转角度
 *  @param x_multiplication     水平方向的放大倍数,1-10
 *  @param y_multiplication     垂直方向的放大倍数,1-10
 *  @param text                 打印的文本内容
 *
 *  \~english
 *
 *  Print Text(Printer for dot matrix font).
 *
 *  @brief Print Text(Matrix Fonts)
 *  @param x_pos                Specify the x-coordinate
 *  @param y_pos                Specify the y-coordinate
 *  @param font                 Font type
 *  @param rotation             Rotation
 *  @param x_multiplication     Horizontal multiplication,up to 10x
 *  @param y_multiplication     Vertical multiplication,up to 10x
 *  @param text                 print context
 *
 */
- (void)appendTextWithXpos:(NSInteger)x_pos
                      yPos:(NSInteger)y_pos
                      font:(PTTSCTextFontStyle)font
                  rotation:(PTTSCStyleRotation)rotation
           xMultiplication:(NSInteger)x_multiplication
           yMultiplication:(NSInteger)y_multiplication
                      text:(NSString *)text;


/*!
 *  \~chinese
 *
 *  打印自动换行文本(针对点阵字库机型).
 *
 *  @brief 打印自动换行文本(点阵字库)
 *  @param x_pos                x起始坐标
 *  @param y_pos                y起始坐标
 *  @param font                 字体类型
 *  @param rotation             旋转角度
 *  @param x_multiplication     水平方向的放大倍数,1-10
 *  @param y_multiplication     垂直方向的放大倍数,1-10
 *  @param safeHeight           打印的安全高度，自动换行超过该高度部分不会打印
 *  @param width                打印的宽度，等于0表示不会自动换行
 *  @param lineSpacing          行间距
 *  @param text                 打印的文本内容
 *
 *  \~english
 *
 *  Print word wrap text(Printer for dot matrix font).
 *
 *  @brief Print Word Wrap Text(Matrix Fonts)
 *  @param x_pos                Specify the x-coordinate
 *  @param y_pos                Specify the y-coordinate
 *  @param font                 Font type
 *  @param rotation             Rotation
 *  @param x_multiplication     Horizontal multiplication,up to 10x
 *  @param y_multiplication     Vertical multiplication,up to 10x
 *  @param safeHeight           Height of text field.Part will not print more than height
 *  @param width                width of text field.if width is 0,not auto line
 *  @param lineSpacing          line space.
 *  @param text                 print context
 *
 */
- (NSInteger)printAutoTextWithXpos:(NSInteger)x_pos
                              yPos:(NSInteger)y_pos
                              font:(PTTSCTextFontStyle)font
                          rotation:(PTTSCStyleRotation)rotation
                   xMultiplication:(NSInteger)x_multiplication
                   yMultiplication:(NSInteger)y_multiplication
                        safeHeight:(NSInteger)safeHeight
                             width:(NSInteger)width
                       lineSpacing:(NSInteger)lineSpacing
                              text:(NSString *)text;

/*!
 *  \~chinese
 *
 *  打印文本(矢量和点阵字库机型).
 *
 *  @brief 打印文本
 *  @param x_pos                x起始坐标
 *  @param y_pos                y起始坐标
 *  @param font                 字体类型
 *  @param rotation             旋转角度
 *  @param x_multiplication     水平方向的字体大小,如果字体类型是9，表示字体大小，否则表示的是放大倍数
 *  @param y_multiplication     垂直方向的字体大小,如果字体类型是9，表示字体大小，否则表示的是放大倍数
 *  @param text                 打印的文本内容
 *
 *  \~english
 *
 *  Print Text(Printer for vector fonts and dot fonts).
 *
 *  @brief Print Text
 *  @param x_pos                Specify the x-coordinate
 *  @param y_pos                Specify the y-coordinate
 *  @param font                 Font type
 *  @param rotation             Rotation
 *  @param x_multiplication     Horizontal font size,If the type is 9, said the font size, or said is magnification
 *  @param y_multiplication     Vertical font size,If the type is 9, said the font size, or said is magnification
 *  @param text                 print context
 *
 */
- (void)appendTextForVectorWithXpos:(NSInteger)x_pos
                               yPos:(NSInteger)y_pos
                               font:(PTTSCTextVectorFontStyle)font
                           rotation:(PTTSCStyleRotation)rotation
                    xMultiplication:(NSInteger)x_multiplication
                    yMultiplication:(NSInteger)y_multiplication
                               text:(NSString *)text;

/*!
 *  \~chinese
 *
 *  打印自动换行文本(矢量和点阵字库机型).
 *
 *  @brief 打印自动换行文本(矢量字库)
 *  @param x_pos                x起始坐标
 *  @param y_pos                y起始坐标
 *  @param font                 字体类型
 *  @param rotation             旋转角度
 *  @param x_multiplication     水平方向的字体大小,如果字体类型是9，表示字体大小，否则表示的是放大倍数
 *  @param y_multiplication     垂直方向的字体大小,如果字体类型是9，表示字体大小，否则表示的是放大倍数
 *  @param safeHeight           打印的安全高度，自动换行超过该高度部分不会打印
 *  @param width                打印的宽度，等于0表示不会自动换行
 *  @param lineSpacing          行间距
 *  @param text                 打印的文本内容
 *
 *  \~english
 *
 *  Print word wrap text(Printer for vector fonts and dot fonts).
 *
 *  @brief Print Word Wrap Text(Vector Fonts)
 *  @param x_pos                Specify the x-coordinate
 *  @param y_pos                Specify the y-coordinate
 *  @param font                 Font type
 *  @param rotation             Rotation
 *  @param x_multiplication     Horizontal font size,If the type is 9, said the font size, or said is magnification
 *  @param y_multiplication     Vertical font size,If the type is 9, said the font size, or said is magnification
 *  @param safeHeight           Height of text field.Part will not print more than height
 *  @param width                width of text field.if width is 0,not auto line
 *  @param lineSpacing          line space.
 *  @param text                 print context
 *
 */
- (NSInteger)printAutoTextForVectorWithXpos:(NSInteger)x_pos
                                       yPos:(NSInteger)y_pos
                                       font:(PTTSCTextVectorFontStyle)font
                                   rotation:(PTTSCStyleRotation)rotation
                            xMultiplication:(NSInteger)x_multiplication
                            yMultiplication:(NSInteger)y_multiplication
                                 safeHeight:(NSInteger)safeHeight
                                      width:(NSInteger)width
                                lineSpacing:(NSInteger)lineSpacing
                                       text:(NSString *)text;

/*!
 *  \~chinese
 *
 *  将指定区域反白打印
 *
 *  @brief 反白打印
 *  @param x_start        x方向起点坐标（以点为单位）
 *  @param y_start        y方向起点坐标（以点为单位）
 *  @param x_width        x方向反白区域宽度（以点为单位）
 *  @param y_height       y方向反白区域高度（以点为单位）
 *
 *  \~english
 *
 *  This command reverses a region in image buffer.
 *
 *  @brief Reverses
 *  @param x_start       The x-coordinate of the starting point (in dots)
 *  @param y_start       The y-coordinate of the starting point (in dots)
 *  @param x_width       X-axis region width (in dots)
 *  @param y_height      Y-axis region height (in dots)
 *
 */
- (void)setReverseWithXStart:(NSInteger)x_start
                      yStart:(NSInteger)y_start
                      xWidth:(NSInteger)x_width
                     yHeight:(NSInteger)y_height;

/*!
 *  \~chinese
 *
 *  在标签上绘制矩形.
 *
 *  @brief 绘制矩形
 *  @param x_start        x起始坐标
 *  @param y_start        y起始坐标
 *  @param x_end          x终点坐标
 *  @param y_end          y终点坐标
 *  @param thickness      线条宽度
 *
 *  \~english
 *
 *  This command draws rectangles on the label.
 *
 *  @brief Draws Rectangles
 *  @param x_start       Specify x-coordinate of upper left corner (in dots)
 *  @param y_start       Specify y-coordinate of upper left corner (in dots)
 *  @param x_end         Specify x-coordinate of lower right corner (in dots)
 *  @param y_end         Specify y-coordinate of lower right corner (in dots)
 *  @param thickness     Line thickness (in dots)
 *
 */
- (void)setBoxWithXStart:(NSInteger)x_start
                  yStart:(NSInteger)y_start
                    xEnd:(NSInteger)x_end
                    yEnd:(NSInteger)y_end
               thickness:(NSInteger)thickness;


/*!
 *  \~chinese
 *
 *  在标签上绘制椭圆.
 *
 *  @brief 绘制椭圆
 *  @param x_start        指定左上角的x坐标（以点为单位）
 *  @param y_start        指定左上角的y坐标（以点为单位）
 *  @param width          椭圆的宽度（以点为单位）
 *  @param height         椭圆的高度（以点为单位）
 *  @param thickness      椭圆的厚度（以点为单位）
 *
 *  \~english
 *
 *  Draw an ellipse on the label.
 *
 *  @brief Draw Ellipse
 *  @param x_start       Specify x-coordinate of upper left corner (in dots)
 *  @param y_start       Specify y-coordinate of upper left corner (in dots)
 *  @param width         Specify the width of the ellipse (in dots)
 *  @param height        Specify the height of the ellipse (in dots)
 *  @param thickness     Thickness of the ellipse (in dots)
 *
 */
- (void)setEllipseWithXStart:(NSInteger)x_start
                      yStart:(NSInteger)y_start
                       width:(NSInteger)width
                      height:(NSInteger)height
                   thickness:(NSInteger)thickness;

/*!
 *  \~chinese
 *
 *  在标签上绘制圆形.
 *
 *  @brief 绘制圆形
 *  @param x_start        指定左上角的x坐标（以点为单位）
 *  @param y_start        指定左上角的y坐标（以点为单位）
 *  @param diameter       指定圆的直径（以点为单位）
 *  @param thickness      圆的厚度（以点为单位）
 *
 *  \~english
 *
 *  This command draws a circle on the label.
 *
 *  @brief Draw Circle
 *  @param x_start       Specify x-coordinate of upper left corner (in dots)
 *  @param y_start       Specify y-coordinate of upper left corner (in dots)
 *  @param diameter      Specify the diameter of the circle (in dots)
 *  @param thickness     Thickness of the circle (in dots)
 *
 */
- (void)setCircleWithXStart:(NSInteger)x_start
                     yStart:(NSInteger)y_start
                   diameter:(NSInteger)diameter
                  thickness:(NSInteger)thickness;

/*!
 *  \~chinese
 *
 *  清除图像缓冲区中的特定区域.
 *
 *  @brief 清除缓冲区某区域
 *  @param x_start       起点的x坐标（以点为单位）
 *  @param y_start       起点的y坐标（以点为单位）
 *  @param x_width       x轴方向的区域宽度（以点为单位）
 *  @param y_height      y轴方向的区域宽度（以点为单位）
 *
 *  \~english
 *
 *  This command clears a specified region in the image buffer.
 *
 *  @brief Clear Specified BBuffer
 *  @param x_start      The x-coordinate of the starting point (in dots)
 *  @param y_start      The x-coordinate of the starting point (in dots)
 *  @param x_width      The region width in x-axis direction (in dots)
 *  @param y_height     The region height in y-axis direction (in dots)
 *
 */
- (void)setEraseWithXStart:(NSInteger)x_start
                    yStart:(NSInteger)y_start
                    xWidth:(NSInteger)x_width
                   yHeight:(NSInteger)y_height;

/*!
 *  \~chinese
 *
 *  打印DMATRIX二维条码.
 *
 *  @brief 打印DMATRIX二维条码
 *  @param x_pos            条形码水平方向起始位置，以点表示
 *  @param y_pos            条形码垂直方向起始位置，以点表示
 *  @param width            条码宽度，以点表示
 *  @param height           条码高度，以点表示
 *  @param xm               模块尺寸
 *  @param row              条形码列数:10-144
 *  @param col              条形码栏数:10-144
 *  @param expresssion      条形码内容
 *
 *  \~english
 *
 *  This command is used to define the DataMatrix 2D bar code.
 *
 *  @brief DataMatrix 2D Barcode
 *  @param x_pos            Specify the x-coordinate of the bar code on the label
 *  @param y_pos            Specify the y-coordinate of the bar code on the label
 *  @param width            The expected width of barcode area (in dots)
 *  @param height           The expected height of barcode area (in dots)
 *  @param xm               Module size (in dots)
 *  @param row              Symbol size of row: 10 to 144
 *  @param col              Symbol size of col: 10 to 144
 *  @param expresssion      Barcode content
 *
 */
- (void)drawDmatrixBarcodeWithXPos:(NSInteger)x_pos
                              yPos:(NSInteger)y_pos
                             width:(NSInteger)width
                            height:(NSInteger)height
                                xm:(PTTSCDMATRIXSize)xm
                               row:(NSInteger)row
                               col:(NSInteger)col
                        expression:(NSString *)expresssion;


/*!
 *  \~chinese
 *
 *  打印PDF417条码.
 *
 *  @brief 打印PDF417条码
 *  @param x_pos            条形码水平方向起始位置，以点表示
 *  @param y_pos            条形码垂直方向起始位置，以点表示
 *  @param width            条码宽度，以点表示
 *  @param height           条码高度，以点表示
 *  @param rotate           条码码旋转
 *  @param option           可选参数，详情在文档给出
 *  @param expresssion      条形码内容
 *
 *  \~english
 *
 *  This command defines a PDF417 2D barcode.
 *
 *  @brief PDF417 Barcode
 *  @param x_pos            Specify the x-coordinate of the bar code on the label
 *  @param y_pos            Specify the y-coordinate of the bar code on the label
 *  @param width            The expected width of barcode area (in dots)
 *  @param height           The expected height of barcode area (in dots)
 *  @param rotate           Rotation counterclockwise.
 *  @param option           Details are given in the documentation
 *  @param expresssion      Barcode content
 *
 */
- (void)printPDF417WithXPos:(NSInteger)x_pos
                       yPos:(NSInteger)y_pos
                      width:(NSInteger)width
                     height:(NSInteger)height
                     rotate:(PTTSCStyleRotation)rotate
                     option:(NSString *)option
                 expression:(NSString *)expression;

/*!
 *  \~chinese
 *
 *  打印AZTEC条码.
 *
 *  @brief 打印AZTEC条码
 *  @param xPos            条形码水平方向起始位置，以点表示
 *  @param yPos            条形码垂直方向起始位置，以点表示
 *  @param rotate          旋转角度
 *  @param size            元素模块大小（1到20），默认为6
 *  @param ecp             错误控制（＆符号大小/类型）参数
 *  @param flg             0：输入消息是直字节   1：输入使用
 *  @param menu            菜单符号（0：否，1：是），默认为0
 *  @param multi           符号数（1到26），默认为6
 *  @param rev             输出要反转（0：否，1：是），默认为0
 *  @param aztecData       条形码内容
 *
 *  \~english
 *
 *  This command defines a AZTEC 2D barcode.
 *
 *  @brief AZTEC Barcode
 *  @param xPos            Specify the x-coordinate of the bar code on the label
 *  @param yPos            Specify the y-coordinate of the bar code on the label
 *  @param rotate          Rotation
 *  @param size            Element module size (1 to 20), default is 6
 *  @param ecp             Error control (& symbol size/type) parameter
 *  @param flg             0 : input message is straight bytes   1:input uses
 *  @param menu            Menu symbol (0 : no, 1 : yes), default is 0
 *  @param multi           Number of symbols (1 to 26), default is 6
 *  @param rev             Output to be reversed (0 : no, 1 : yes), default is 0
 *  @param aztecData       Barcode content
 *
 */
- (void)printAztecWithXPos:(NSInteger)xPos
                      yPos:(NSInteger)yPos
                    rotate:(PTTSCStyleRotation)rotate
                      size:(NSInteger)size
                       ecp:(NSInteger)ecp
                       flg:(NSInteger)flg
                      menu:(NSInteger)menu
                     multi:(NSInteger)multi
                       rev:(NSInteger)rev
                 aztecData:(NSString *)aztecData;


/*!
 *  \~chinese
 *
 *  打印BMP格式图像.
 *
 *  @brief 打印BMP格式图像
 *  @param filename         下载的BMP文件名
 *  @param x_pos            BMP格式图像的x坐标
 *  @param y_pos            BMP格式图像的y坐标
 *
 *  \~english
 *
 *  This command prints BMP format images.
 *
 *  @brief BMP Format Image
 *  @param filename         The downloaded BMP filename.
 *  @param x_pos            The x-coordinate of the BMP format image
 *  @param y_pos            The y-coordinate of the BMP format image
 *
 */
- (void)printBMPWithFilename:(NSString *)filename
                      xPos:(NSInteger)x_pos
                      yPos:(NSInteger)y_pos;

/*!
 *  \~chinese
 *
 *  打印PCX格式图像.
 *
 *  @brief 打印PCX格式图像
 *  @param filename         下载的PCX文件名
 *  @param x_pos            PCX格式图像的x坐标
 *  @param y_pos            PCX格式图像的y坐标
 *
 *  \~english
 *
 *  This command prints PCX format images.
 *
 *  @brief PCX Format Image
 *  @param filename         The downloaded PCX filename.
 *  @param x_pos            The x-coordinate of the PCX format image
 *  @param y_pos            The y-coordinate of the PCX format image
 *
 */
- (void)printPCXWithFilename:(NSString *)filename
                      xPos:(NSInteger)x_pos
                      yPos:(NSInteger)y_pos;


/////////////////////////////////////////////////////////////////////
/********************* Device Reconfiguration Commands ********************/
/////////////////////////////////////////////////////////////////////

/*!
 *  \~chinese
 *
 *  计数器设置.
 *
 *  @brief 计数器设置
 *  @param counterNumber   表示选择哪个计数器：0-50
 *  @param step            表示计数间隔（-99999999 ~ 99999999）
 *
 *  \~english
 *
 *  Counters can be a real counter or a variable.This setting sets the counter number in the program and its increments.
 *
 *  @brief Set The Counter
 *  @param counterNumber   counter number. There are 51 counters available (@0~@50) in the printer.
 *  @param step            The increment of the counter, can be positive or negative.（-99999999 ~ 99999999）
 *
 */
- (void)setCounterWithCounterNumber:(NSInteger)counterNumber
                               step:(NSInteger)step;

/*!
 *  \~chinese
 *
 *  设置打印机切割器状态.
 *
 *  @brief 切割器状态
 *  @param status    true:打印结束后切割  false：禁用切刀功能
 *
 *  \~english
 *
 *  This setting activates or deactivates the cutter.
 *
 *  @brief Cutter Status
 *  @param status     true:Set printer to cut label at the end of printing job  false：Disable cutter function
 *
 */
- (void)setCutterStatus:(BOOL)status;

/*!
 *  \~chinese
 *
 *  设置每个切割的打印标签数量
 *
 *  @brief 切割数量
 *  @param pieces    0 ~ 65535
 *
 *  \~english
 *
 *  Set number of printing labels per cut.
 *
 *  @brief Number Of Cut
 *  @param pieces   0 ~ 65535
 *
 */
- (void)setCutterPieces:(NSInteger)pieces;


/*!
 *  \~chinese
 *
 *  设置连续纸.
 *
 *  @brief 设置连续纸
 *  \~english
 *
 *  Set continuous paper.
 *
 *  @brief Set continuous paper
 */
- (void)setReceiptPaper;

/*!
 *  \~chinese
 *
 *  设置标签纸.
 *
 *  @brief 设置标签纸
 *  \~english
 *
 *  Set label paper.
 *
 *  @brief Set label paper
 */
- (void)setLabelPaper;

/*!
 *  \~chinese
 *
 *  设置黑标纸.
 *
 *  @brief 设置黑标纸
 *  \~english
 *
 *  Set black mark paper
 *
 *  @brief Set black mark paper
 */
- (void)setBlackMarkPaper;


@end
