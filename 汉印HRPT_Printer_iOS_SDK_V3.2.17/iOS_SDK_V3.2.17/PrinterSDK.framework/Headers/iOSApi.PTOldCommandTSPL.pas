//{!
// *  \~chinese
// *  该类是SDK3.0.0之前的版本，由于很多客户还是使用之前的SDK，优化接口后改动太大，就用一个类保留之前的接口
// *
// *  \~english
// *  This class is a version before SDK3.0.0. Since many customers still use the previous SDK, after optimizing the interface and making too much change, use a class to retain the previous interface.
// }

unit iOSApi.PTOldCommandTSPL;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	//#import "SDKDefine.h"
	iOSApi.SDKDefine,
	//#import "PTBitmapManager.h"
	iOSApi.PTBitmapManager,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	
	//NS_ASSUME_NONNULL_BEGIN
	
	//@interface PTOldCommandTSPL : NSObject
	//@interface PTOldCommandTSPL : NSObject
	PTOldCommandTSPL=interface(NSObject)//
	['{895E080F-7633-41A4-9B79-34D82E207F94}']
		
		//@property(strong,nonatomic,readwrite) NSMutableData *cmdData;
		function cmdData:NSMutableData;cdecl;
		procedure setCmdData(cmdData:NSMutableData);cdecl;
		
		//@property (nonatomic, assign) NSStringEncoding encoding;
		function encoding:NSStringEncoding;cdecl;
		procedure setEncoding(encoding:NSStringEncoding);cdecl;
		
		//{*
		// *  printer print self-test message.
		// *  自检，打印打印机信息
		// }
		//- (void)selfTest;
		procedure selfTest;cdecl;
		
		
		//- (void)appendCommand:(NSString *)cmd;
		procedure appendCommand(cmd:NSString);cdecl;
		
		
		//{* 打印并走纸一行
		// *  Print and feed one line
		// }
		//- (void)printAndLineFeed;
		procedure printAndLineFeed;cdecl;
		
		
		
		//{*
		// set font bold
		// 设置字体加粗
		// 
		// @param bold 0：不加粗 1：加粗
		// }
		//- (void)setFontBold:(NSInteger)bold;
		procedure setFontBold(bold:NSInteger);cdecl;
		
		
		//{*
		// 自动回传打印机状态
		// 开启之后，每打印一张都会返回10个字节的数据，格式：指令头4个字节(aa bb cc dd) + 4个字节的打印张数(从开启到关闭的打印总张数) + 1个字节的状态 + 结束符00
		// 
		// 会返回两次数据，第一次表示返回可获取打印总张数和状态，第二次表示打印结束
		// eg:1.aabbccdd 03000000 2000
		// 2.aabbccdd ffffffff 0000 ：打印结束；aabbccdd 00000000 0000：关闭自动回传
		// @param status 1：开启自动回传  3：关闭自动回传
		// }
		//- (void)setPrinterStateAutomaticBackWithStatus:(NSInteger)status;
		procedure setPrinterStateAutomaticBackWithStatus(status:NSInteger);cdecl;
		
		
		//{*
		// *  setting print area size in paper.
		// *  打印纸张范围大小 打印纸的毫米
		// }
		//- (void)setPrintAreaSizeWithWidth:(NSInteger)label_width
		                           //Height:(NSInteger)label_height;
		 //- (void)setPrintAreaSizeWithWidth:(NSInteger)label_width                            Height:(NSInteger)label_height;
		[MethodName('setPrintAreaSizeWithWidth:Height:')]
		procedure setPrintAreaSizeWithWidthHeight(label_width:NSInteger;label_height:NSInteger);cdecl;
		
		
		//{*
		// 
		// get print status
		// 开盖因为不好判断纸张，所以默认无纸
		// 
		// 返回一个字节
		// bit7  bit6  bit5  bit4  bit3  bit2  bit1  bit0
		// 1      1      1     1     1     1     1    1
		// 高温   开盖  打印中  暂停   丝带   缺纸   卡纸  开盖
		// }
		//- (void)getPrinterStatus;
		procedure getPrinterStatus;cdecl;
		
		
		//{*
		// *  setting gap distance during labels.
		// *  设置标签纸的间距
		// *
		// *  @param distance 两张标签紙中间的垂直距离
		// *  @param offset   垂直间距的偏移
		// }
		//- (void)setGapWithDistance:(NSInteger)distance
		                    //Offset:(NSInteger)offset;
		 //- (void)setGapWithDistance:(NSInteger)distance                     Offset:(NSInteger)offset;
		[MethodName('setGapWithDistance:Offset:')]
		procedure setGapWithDistanceOffset(distance:NSInteger;offset:NSInteger);cdecl;
		
		
		//{*
		// *  setting black line
		// *  设置黑线
		// *
		// *  @param height 黑线的高度 0~25.4 mm
		// *  @param offset 黑线偏移量 0~label length
		// *  height,offset 为0,0表示连续标签
		// }
		//- (void)setBlineWithHeight:(NSInteger)height
		                    //Offset:(NSInteger)offset;
		 //- (void)setBlineWithHeight:(NSInteger)height                     Offset:(NSInteger)offset;
		[MethodName('setBlineWithHeight:Offset:')]
		procedure setBlineWithHeightOffset(height:NSInteger;offset:NSInteger);cdecl;
		
		
		//{*
		// *  paper feed with distance.
		// *  走纸
		// }
		//- (void)setOffsetWithDistance:(NSInteger)distance;
		procedure setOffsetWithDistance(distance:NSInteger);cdecl;
		
		
		//{*
		// *  setting print sets and copies.
		// *  打印数量
		// *
		// *  @param sets   多少份       how many sets of labels will be printed.
		// *  @param copies 每份多少张    how many copies should be printed for each particular label set.
		// }
		//- (void)printWithSets:(NSInteger)sets  Copies:(NSInteger)copies;
		[MethodName('printWithSets:Copies:')]
		procedure printWithSetsCopies(sets:NSInteger;copies:NSInteger);cdecl;
		
		
		
		//{*
		// 打印自动换行文本，针对矢量字库的机型
		// 
		// @param x_pos x起始坐标
		// @param y_pos y起始坐标
		// @param font 字体：1-9，1-8：只能打印英文  9：中英文都能打（一般选择9）
		// @param rotation 打印方向
		// @param x_multiplication font是1-8时：表示放大横向放大倍数  font是9的时候，表示文本的横向大小，eg：24
		// @param y_multiplication font是1-8时：表示放大纵向放大倍数 font是9的时候，表示文本的纵向大小，eg：24
		// @param safeHeight 打印的高度范围，超过部分不会打印
		// @param width 打印的宽度范围，等于0的时候不自动换行
		// @param lineSpacing 行间距
		// @param text 文本
		// @return 返回实际的打印高度
		// }
		//- (NSInteger)printAutoTextForVectorWithXpos:(NSInteger)x_pos
		                                       //yPos:(NSInteger)y_pos
		                                       //font:(NSInteger)font
		                                   //rotation:(NSInteger)rotation
		                            //xMultiplication:(NSInteger)x_multiplication
		                            //yMultiplication:(NSInteger)y_multiplication
		                                 //safeHeight:(NSInteger)safeHeight
		                                      //width:(NSInteger)width
		                                //lineSpacing:(NSInteger)lineSpacing
		                                       //text:(NSString *)text;
		 //- (NSInteger)printAutoTextForVectorWithXpos:(NSInteger)x_pos                                        yPos:(NSInteger)y_pos                                        font:(NSInteger)font                                    rotation:(NSInteger)rotation                             xMultiplication:(NSInteger)x_multiplication                             yMultiplication:(NSInteger)y_multiplication                                  safeHeight:(NSInteger)safeHeight                                       width:(NSInteger)width                                 lineSpacing:(NSInteger)lineSpacing                                        text:(NSString *)text;
		[MethodName('printAutoTextForVectorWithXpos:yPos:font:rotation:xMultiplication:yMultiplication:safeHeight:width:lineSpacing:text:')]
		function printAutoTextForVectorWithXposyPosfontrotationxMultiplicationyMultiplicationsafeHeightwidthlineSpacingtext(x_pos:NSInteger;y_pos:NSInteger;font:NSInteger;rotation:NSInteger;x_multiplication:NSInteger;y_multiplication:NSInteger;safeHeight:NSInteger;width:NSInteger;lineSpacing:NSInteger;text:NSString):NSInteger;cdecl;
		
		
		
		//{*
		// 打印自动换行文本，针对点阵字库的机型
		// 
		// @param x_pos x起始坐标
		// @param y_pos y起始坐标
		// @param font 字体：0-1，0：12x24 24x24   1:8x16  16x16
		// @param rotation 打印方向
		// @param x_multiplication 横向放大倍数:1-10
		// @param y_multiplication 纵向放大倍数:1-10
		// @param safeHeight 打印的高度范围，超过部分不会打印
		// @param width 打印的宽度范围，等于0的时候不自动换行
		// @param lineSpacing 行间距
		// @param text 文本
		// @return 返回实际的打印高度
		// }
		//- (NSInteger)printAutoTextWithXpos:(NSInteger)x_pos
		                              //yPos:(NSInteger)y_pos
		                              //font:(NSInteger)font
		                          //rotation:(NSInteger)rotation
		                   //xMultiplication:(NSInteger)x_multiplication
		                   //yMultiplication:(NSInteger)y_multiplication
		                        //safeHeight:(NSInteger)safeHeight
		                             //width:(NSInteger)width
		                       //lineSpacing:(NSInteger)lineSpacing
		                              //text:(NSString *)text;
		 //- (NSInteger)printAutoTextWithXpos:(NSInteger)x_pos                               yPos:(NSInteger)y_pos                               font:(NSInteger)font                           rotation:(NSInteger)rotation                    xMultiplication:(NSInteger)x_multiplication                    yMultiplication:(NSInteger)y_multiplication                         safeHeight:(NSInteger)safeHeight                              width:(NSInteger)width                        lineSpacing:(NSInteger)lineSpacing                               text:(NSString *)text;
		[MethodName('printAutoTextWithXpos:yPos:font:rotation:xMultiplication:yMultiplication:safeHeight:width:lineSpacing:text:')]
		function printAutoTextWithXposyPosfontrotationxMultiplicationyMultiplicationsafeHeightwidthlineSpacingtext(x_pos:NSInteger;y_pos:NSInteger;font:NSInteger;rotation:NSInteger;x_multiplication:NSInteger;y_multiplication:NSInteger;safeHeight:NSInteger;width:NSInteger;lineSpacing:NSInteger;text:NSString):NSInteger;cdecl;
		
		
		
		//{*
		// 打印文本
		// 
		// @param x_pos 距离x起点坐标
		// @param y_pos 距离y起点坐标
		// @param font 字体大小 英文字体：0-8  中文：9
		// @param rotation 0 90 180 270
		// @param x_multiplication 英文字体：1-10 中文：40-80(大小可调)
		// @param y_multiplication 英文字体：1-10 中文：40-80(大小可调)
		// @param text 打印的文本
		// }
		//- (void)appendTextWithXpos:(NSInteger)x_pos
		                      //Ypos:(NSInteger)y_pos
		                      //Font:(NSInteger)font
		                  //Rotation:(NSInteger)rotation
		           //Xmultiplication:(NSInteger)x_multiplication
		           //Ymultiplication:(NSInteger)y_multiplication
		                      //Text:(NSString *)text;
		 //- (void)appendTextWithXpos:(NSInteger)x_pos                       Ypos:(NSInteger)y_pos                       Font:(NSInteger)font                   Rotation:(NSInteger)rotation            Xmultiplication:(NSInteger)x_multiplication            Ymultiplication:(NSInteger)y_multiplication                       Text:(NSString *)text;
		[MethodName('appendTextWithXpos:Ypos:Font:Rotation:Xmultiplication:Ymultiplication:Text:')]
		procedure appendTextWithXposYposFontRotationXmultiplicationYmultiplicationText(x_pos:NSInteger;y_pos:NSInteger;font:NSInteger;rotation:NSInteger;x_multiplication:NSInteger;y_multiplication:NSInteger;text:NSString);cdecl;
		
		
		//{*
		// *  clean printer buffer.
		// *  清除打印机缓冲区
		// }
		//- (void)setCLS;
		procedure setCLS;cdecl;
		
		
		//{*
		// *  print barcode.
		// *  打印一维条码
		// *
		// *  @param type     bar code type @[128,128M,EAN128,25,25C,39,29S,93,EAN13,EAN13+2,EAN13+5,EAN8,EAN8+5,CODA,POST,UPCA,UPCA+2,UPCA+5,UPCE,UPCE+2,UPCE+5,CPOST,MSI,MSIC,PLESSEY,ITF14,EAN14,11];
		// *  @param readable 是否可读：0，不可读，1，可读 whether it is readable：0: unreadable; 1: readable
		// *  @param rotation rotation：0，90，180，270
		// *  @param narrow   窄元素 narrow element
		// *  @param wide     宽元素 wide element
		// }
		
		//{*
		// print barcode.
		// 打印一维条码
		// eg:100,100,”39”,96,1,0,2,4,”1000” 、 10,10,”128M”,48,1,0,2,2,”!104!096ABCD!101EFGH”
		// 
		// @param x_pos Specify the x-coordinate of the bar code on the label
		// @param y_pos Specify the y-coordinate of the bar code on the label
		// @param type bar code type @[128,128M,EAN128,25,25C,39,29S,93,EAN13,EAN13+2,EAN13+5,EAN8,EAN8+5,CODA,POST,UPCA,UPCA+2,UPCA+5,UPCE,UPCE+2,UPCE+5,CPOST,MSI,MSIC,PLESSEY,ITF14,EAN14,11];
		// @param height Bar code height (in dots)
		// @param readable 是否可读：0，不可读，1，可读 whether it is readable：0: unreadable; 1: readable
		// @param rotation rotation：0，90，180，270
		// @param narrow 窄元素 narrow element
		// @param wide 宽元素 wide element
		// @param codeNumber the maximum number of digits of bar code content
		// }
		//- (void)printBarcodeWithXPos:(NSInteger)x_pos
		                        //YPos:(NSInteger)y_pos
		                        //Type:(NSString *)type
		                      //Height:(NSInteger)height
		               //HumanReadable:(NSInteger)readable
		                    //Rotation:(NSInteger)rotation
		                      //Narrow:(NSInteger)narrow
		                        //Wide:(NSInteger)wide
		                  //CodeNumber:(NSString *)codeNumber;
		 //- (void)printBarcodeWithXPos:(NSInteger)x_pos                         YPos:(NSInteger)y_pos                         Type:(NSString *)type                       Height:(NSInteger)height                HumanReadable:(NSInteger)readable                     Rotation:(NSInteger)rotation                       Narrow:(NSInteger)narrow                         Wide:(NSInteger)wide                   CodeNumber:(NSString *)codeNumber;
		[MethodName('printBarcodeWithXPos:YPos:Type:Height:HumanReadable:Rotation:Narrow:Wide:CodeNumber:')]
		procedure printBarcodeWithXPosYPosTypeHeightHumanReadableRotationNarrowWideCodeNumber(x_pos:NSInteger;y_pos:NSInteger;_type:NSString;height:NSInteger;readable:NSInteger;rotation:NSInteger;narrow:NSInteger;wide:NSInteger;codeNumber:NSString);cdecl;
		
		
		//{*
		// print QRCode
		// 打印二维条码
		// eg:100,10,L,7,M,0,M1,S1,"ATHE FIRMWARE HAS BEEN UPDATED"
		// 
		// @param x_pos The upper left corner x-coordinate of the QR code
		// @param y_pos The upper left corner y-coordinate of the QR code
		// @param ecc_level Error correction recovery level
		// L :7% M :15% Q : 25% H : 30%
		// @param width 1~10
		// @param mode A/M  A:Auto M:Manual
		// @param rotation 0 、 90 、180 、270
		// @param model M1: (default), original version  M2: enhanced version
		// @param mask S0~S8, default is S7
		// @param text The encodable character set is described as below
		// }
		//- (void)printQRcodeWithXPos:(NSInteger)x_pos
		                       //YPos:(NSInteger)y_pos
		                   //EccLevel:(NSString *)ecc_level
		                  //CellWidth:(NSInteger)width
		                       //Mode:(NSString *)mode
		                   //Rotation:(NSInteger)rotation
		                      //Model:(NSString *)model
		                       //Mask:(NSString *)mask
		                       //Text:(NSString *)text;
		 //- (void)printQRcodeWithXPos:(NSInteger)x_pos                        YPos:(NSInteger)y_pos                    EccLevel:(NSString *)ecc_level                   CellWidth:(NSInteger)width                        Mode:(NSString *)mode                    Rotation:(NSInteger)rotation                       Model:(NSString *)model                        Mask:(NSString *)mask                        Text:(NSString *)text;
		[MethodName('printQRcodeWithXPos:YPos:EccLevel:CellWidth:Mode:Rotation:Model:Mask:Text:')]
		procedure printQRcodeWithXPosYPosEccLevelCellWidthModeRotationModelMaskText(x_pos:NSInteger;y_pos:NSInteger;ecc_level:NSString;width:NSInteger;mode:NSString;rotation:NSInteger;model:NSString;mask:NSString;text:NSString);cdecl;
		
		
		
		//{*
		// Print Bitmap
		// 打印位图,取反已经在SDK中处理
		// 
		// @param xpos Specify the x-coordinate
		// @param ypos Specify the y-coordinate
		// @param mode mode Graphic modes listed below: 0:OVERWRITE 1:OR 2:XOR 3:compress 16:OVERWRITE compress 17:OR compress 18:XOR compress
		// @param image image
		// @param bitmapMode binary/dithering
		// @param compress TIFF/ZPL2/LZO/None
		// @return The data is less than the cache and can be printed NO:The data exceeds the cache and cannot be printed
		// }
		//- (BOOL)addBitmapWithXPos:(NSInteger)xpos
		                     //YPos:(NSInteger)ypos
		                     //Mode:(NSInteger)mode
		                    //image:(CGImageRef)image
		               //bitmapMode:(PTBitmapMode)bitmapMode
		                 //compress:(PTBitmapCompressMode)compress;
		 //- (BOOL)addBitmapWithXPos:(NSInteger)xpos                      YPos:(NSInteger)ypos                      Mode:(NSInteger)mode                     image:(CGImageRef)image                bitmapMode:(PTBitmapMode)bitmapMode                  compress:(PTBitmapCompressMode)compress;
		[MethodName('addBitmapWithXPos:YPos:Mode:image:bitmapMode:compress:')]
		function addBitmapWithXPosYPosModeimagebitmapModecompress(xpos:NSInteger;ypos:NSInteger;mode:NSInteger;image:CGImageRef;bitmapMode:PTBitmapMode;compress:PTBitmapCompressMode):Boolean;cdecl;
		
		
		////#pragma mark BasicSetting 基本设定
		
		//{*
		// *  setting print speed
		// *  设置打印速度
		// *
		// }
		//- (void)setSpeed:(NSInteger)speed;
		procedure setSpeed(speed:NSInteger);cdecl;
		
		
		//{*
		// *  setting print density
		// *  设置打印浓度
		// *
		// *  @param density 浓度 0~15 level
		// }
		//- (void)setDensity:(NSInteger)density;
		procedure setDensity(density:NSInteger);cdecl;
		
		
		//{*
		// *  setting print direction and mirror.
		// *  设置打印的方向和镜像
		// *
		// *  @param direction 方向，面对打印机，向自己方向出纸，0，正常，1，方向
		// *  @param mirror    镜像，可选项 0 普通，1 镜像
		// }
		//- (void)setDirection:(NSInteger)direction Mirror:(NSInteger)mirror;
		[MethodName('setDirection:Mirror:')]
		procedure setDirectionMirror(direction:NSInteger;mirror:NSInteger);cdecl;
		
		
		//{*
		// *  setting print reference position
		// *  设置标签参考起点
		// *
		// }
		//- (void)setReferenceXPos:(NSInteger)x_pos
		                    //YPos:(NSInteger)y_pos;
		 //- (void)setReferenceXPos:(NSInteger)x_pos                     YPos:(NSInteger)y_pos;
		[MethodName('setReferenceXPos:YPos:')]
		procedure setReferenceXPosYPos(x_pos:NSInteger;y_pos:NSInteger);cdecl;
		
		
		//{*
		// *  page 18.
		// *  setting the code page of inernational character set.设置国际字符集
		// 7-bit code page name:
		// USA: USA
		// BRI: British
		// GER: German
		// FRE: French
		// DAN: Danish
		// ITA: Italian
		// SPA: Spanish
		// SWE: Swedish
		// SWI: Swiss
		// 
		// 8-bit code page number:
		// 437: United States
		// 850: Multilingual
		// 852: Slavic
		// 860: Portuguese
		// 863: Canadian/French
		// 865: Nordic
		// 857: Turkish (TSPL2 printers only)
		// 
		// Windows code page:
		// 1250: Central Europe (TSPL2 printers only)
		// 1252: Latin I (TSPL2 printers only)
		// 1253: Greek (TSPL2 printers only)
		// 1254: Turkish (TSPL2 printers only)
		// *
		// *  @param codepage 字符集代码
		// }
		//- (void)setCodePage:(NSString *)codepage;
		procedure setCodePage(codepage:NSString);cdecl;
		
		
		//{*
		// *  page 21.
		// *  feed label with the specified length.设置标签进纸长度
		// *
		// *  @param feedLength (1~9999)
		// }
		//- (void)setFeedLength:(NSInteger)feedLength;
		procedure setFeedLength(feedLength:NSInteger);cdecl;
		
		
		//{*
		// *  feed label to the beginning of next label.设置进纸到下一标签起始处
		// }
		//- (void)setFormFeed;
		procedure setFormFeed;cdecl;
		
		
		///** 回纸 */
		//- (void)setBackFeed:(NSInteger)distance;
		procedure setBackFeed(distance:NSInteger);cdecl;
		
		//- (void)setBackUP:(NSInteger)distance;
		procedure setBackUP(distance:NSInteger);cdecl;
		
		
		//{*
		// *  page 25.
		// *  feed label until the internal sensor has determined the origin.设置标签定位到内部传感器确定的起点
		// }
		//- (void)setHome;
		procedure setHome;cdecl;
		
		
		//{*
		// *  page 28.
		// *  control the sound frequency of the beeper.设置蜂鸣
		// *
		// *  @param level    0-9
		// *  @param interval 1-4095
		// }
		//- (void)setSoundWithLevel:(NSInteger)level
		                 //Interval:(NSInteger)interval;
		 //- (void)setSoundWithLevel:(NSInteger)level                  Interval:(NSInteger)interval;
		[MethodName('setSoundWithLevel:Interval:')]
		procedure setSoundWithLevelInterval(level:NSInteger;interval:NSInteger);cdecl;
		
		
		//{*
		// *  page 29.
		// *  activate the cutter to immediately cut the labels without back feeding the label.设置切纸
		// }
		//- (void)setCut;
		procedure setCut;cdecl;
		
		
		//{*
		// *  page 30.
		// *  设置停止送纸
		// }
		//- (void)setLimitFeed:(NSInteger)max_len;
		procedure setLimitFeed(max_len:NSInteger);cdecl;
		
		
		//{*
		// *  page 32.
		// *  draw a bar on the label format.在标签上画一条线
		// }
		//- (void)printBarWithXPos:(NSInteger)x_pos
		                    //YPos:(NSInteger)y_pos
		                   //Width:(NSInteger)width
		                  //Height:(NSInteger)height;
		 //- (void)printBarWithXPos:(NSInteger)x_pos                     YPos:(NSInteger)y_pos                    Width:(NSInteger)width                   Height:(NSInteger)height;
		[MethodName('printBarWithXPos:YPos:Width:Height:')]
		procedure printBarWithXPosYPosWidthHeight(x_pos:NSInteger;y_pos:NSInteger;width:NSInteger;height:NSInteger);cdecl;
		
		
		//{*
		// *  page 39.
		// *  draw rectangles on the label.在标签上绘制矩形
		// *  @param thickness 线宽
		// }
		//- (void)setBoxWithXStart:(NSInteger)x_start
		                  //YStart:(NSInteger)y_start
		                    //XEnd:(NSInteger)x_end
		                    //YEnd:(NSInteger)y_end
		               //Thickness:(NSInteger)thickness;
		 //- (void)setBoxWithXStart:(NSInteger)x_start                   YStart:(NSInteger)y_start                     XEnd:(NSInteger)x_end                     YEnd:(NSInteger)y_end                Thickness:(NSInteger)thickness;
		[MethodName('setBoxWithXStart:YStart:XEnd:YEnd:Thickness:')]
		procedure setBoxWithXStartYStartXEndYEndThickness(x_start:NSInteger;y_start:NSInteger;x_end:NSInteger;y_end:NSInteger;thickness:NSInteger);cdecl;
		
		
		///** 在标签上绘制椭圆 */
		//- (void)setEllipseWithXStart:(NSInteger)x_start
		                      //YStart:(NSInteger)y_start
		                       //Width:(NSInteger)width
		                      //Height:(NSInteger)height
		                   //Thickness:(NSInteger)thickness;
		 //- (void)setEllipseWithXStart:(NSInteger)x_start                       YStart:(NSInteger)y_start                        Width:(NSInteger)width                       Height:(NSInteger)height                    Thickness:(NSInteger)thickness;
		[MethodName('setEllipseWithXStart:YStart:Width:Height:Thickness:')]
		procedure setEllipseWithXStartYStartWidthHeightThickness(x_start:NSInteger;y_start:NSInteger;width:NSInteger;height:NSInteger;thickness:NSInteger);cdecl;
		
		
		//{*
		// *  page 41.
		// *  draw a circle on the label.在标签上绘制圆形
		// *
		// *  @param diameter  直径
		// *  @param thickness 线宽
		// }
		//- (void)setCircleWithXStart:(NSInteger)x_start
		                     //YStart:(NSInteger)y_start
		                   //Diameter:(NSInteger)diameter
		                  //Thickness:(NSInteger)thickness;
		 //- (void)setCircleWithXStart:(NSInteger)x_start                      YStart:(NSInteger)y_start                    Diameter:(NSInteger)diameter                   Thickness:(NSInteger)thickness;
		[MethodName('setCircleWithXStart:YStart:Diameter:Thickness:')]
		procedure setCircleWithXStartYStartDiameterThickness(x_start:NSInteger;y_start:NSInteger;diameter:NSInteger;thickness:NSInteger);cdecl;
		
		
		//{*
		// *  page 43.
		// *  clear a specified region in the image buffer.擦除图像缓冲区指定的区域
		// }
		//- (void)setEraseWithXStart:(NSInteger)x_start
		                    //YStart:(NSInteger)y_start
		                    //XWidth:(NSInteger)x_width
		                   //YHeight:(NSInteger)y_height;
		 //- (void)setEraseWithXStart:(NSInteger)x_start                     YStart:(NSInteger)y_start                     XWidth:(NSInteger)x_width                    YHeight:(NSInteger)y_height;
		[MethodName('setEraseWithXStart:YStart:XWidth:YHeight:')]
		procedure setEraseWithXStartYStartXWidthYHeight(x_start:NSInteger;y_start:NSInteger;x_width:NSInteger;y_height:NSInteger);cdecl;
		
		
		//{*
		// *  page 42.
		// *  define the DataMatrix 2D bar code.Currently,only ECC200 error correction is supported.
		// *  设置 DataMatrix 二维码，当前仅支持 ECC200 错误纠正
		// *
		// *  @param xm         [可选]，Module size，x6，x8
		// *  @param row        [可选]，范围：10-144
		// *  @param col        [可选]，范围：10-144
		// *  @param expression 表达式
		// }
		//- (void)setDmatrixWithExpression:(NSString *)expression
		                            //XPos:(NSInteger)x_pos
		                            //YPos:(NSInteger)y_pos
		                           //Width:(NSInteger)width
		                          //Height:(NSInteger)height
		                              //XM:(NSString *)xm
		                             //Row:(NSString *)row
		                             //Col:(NSString *)col;
		 //- (void)setDmatrixWithExpression:(NSString *)expression                             XPos:(NSInteger)x_pos                             YPos:(NSInteger)y_pos                            Width:(NSInteger)width                           Height:(NSInteger)height                               XM:(NSString *)xm                              Row:(NSString *)row                              Col:(NSString *)col;
		[MethodName('setDmatrixWithExpression:XPos:YPos:Width:Height:XM:Row:Col:')]
		procedure setDmatrixWithExpressionXPosYPosWidthHeightXMRowCol(expression:NSString;x_pos:NSInteger;y_pos:NSInteger;width:NSInteger;height:NSInteger;xm:NSString;row:NSString;col:NSString);cdecl;
		
		
		//{*
		// *  page 44.
		// *  define a 2D Maxicode.打印 Maxicode 二维码
		// *
		// *  @param mode    2,3,4,5
		// *  @param iClass   [option],Class of Service ,3-digit number(for mode 2,3)
		// *  @param country [option],Country code, 3-digit number (for mode 2,3)
		// *  @param post    [option],
		// Mode 2: (USA) 5-digit+ 4-digit number.
		// Mode 3: (Canada) 6 alphanumeric post code included by double quotes.
		// *  @param lm      Expression length (double quote is ignored) , 范围：1-138, (this parameter is just for mode 4 and 5.)
		// }
		//- (void)setMaxicode:(NSString *)text
		               //XPos:(NSInteger)x_pos
		               //YPos:(NSInteger)y_pos
		               //Mode:(NSInteger)mode
		              //Class:(NSInteger)iClass
		            //Country:(NSInteger)country
		               //Post:(NSString *)post
		                 //LM:(NSInteger)lm;
		 //- (void)setMaxicode:(NSString *)text                XPos:(NSInteger)x_pos                YPos:(NSInteger)y_pos                Mode:(NSInteger)mode               Class:(NSInteger)iClass             Country:(NSInteger)country                Post:(NSString *)post                  LM:(NSInteger)lm;
		[MethodName('setMaxicode:XPos:YPos:Mode:Class:Country:Post:LM:')]
		procedure setMaxicodeXPosYPosModeClassCountryPostLM(text:NSString;x_pos:NSInteger;y_pos:NSInteger;mode:NSInteger;iClass:NSInteger;country:NSInteger;post:NSString;lm:NSInteger);cdecl;
		
		
		//{*
		// *
		// *  page 46.
		// *  define a PDF417 2D barcode.
		// 
		// [Option]
		// 
		// P  Data compression method
		// 0: Auto encoding
		// 1: Binary mode
		// 
		// E  Error correction level. Range: 0~8 Center pattern in barcode area
		// 0: The pattern will print upper left justified the area
		// 1: The pattern is printed middle of area
		// 
		// Ux,y,c Human readable
		// x: Human readable characters in the specified x-coordinate
		// y: Human readable characters in the specified y-coordinate
		// c: Maximum characters of human readable character per line
		// 
		// W  Module width in dot. Range: 2~9
		// H  Bar height in dot. Range: 4~99
		// R  Maximum number of rows
		// C  Maximum number of columns
		// T  Truncation.
		// 0: Not truncated
		// 1: Truncated
		// 
		// *  @param option 可选项
		// }
		//- (void)printPDF417WithXPos:(NSInteger)x_pos
		                       //YPos:(NSInteger)y_pos
		                      //Width:(NSInteger)width
		                     //Height:(NSInteger)height
		                     //Rotate:(NSInteger)rotate
		                     //Option:(NSString *)option
		                 //Expression:(NSString *)expression;
		 //- (void)printPDF417WithXPos:(NSInteger)x_pos                        YPos:(NSInteger)y_pos                       Width:(NSInteger)width                      Height:(NSInteger)height                      Rotate:(NSInteger)rotate                      Option:(NSString *)option                  Expression:(NSString *)expression;
		[MethodName('printPDF417WithXPos:YPos:Width:Height:Rotate:Option:Expression:')]
		procedure printPDF417WithXPosYPosWidthHeightRotateOptionExpression(x_pos:NSInteger;y_pos:NSInteger;width:NSInteger;height:NSInteger;rotate:NSInteger;option:NSString;expression:NSString);cdecl;
		
		
		///** page 50 */
		//- (void)printAztecWithXPos:(NSInteger)XPos
		                      //YPos:(NSInteger)YPos
		                    //rotate:(NSInteger)rotate
		                      //size:(NSInteger)size
		                       //ecp:(NSInteger)ecp
		                       //flg:(NSInteger)flg
		                      //menu:(NSInteger)menu
		                     //multi:(NSInteger)multi
		                       //rev:(NSInteger)rev
		                 //aztecData:(NSString *)aztecData;
		 //- (void)printAztecWithXPos:(NSInteger)XPos                       YPos:(NSInteger)YPos                     rotate:(NSInteger)rotate                       size:(NSInteger)size                        ecp:(NSInteger)ecp                        flg:(NSInteger)flg                       menu:(NSInteger)menu                      multi:(NSInteger)multi                        rev:(NSInteger)rev                  aztecData:(NSString *)aztecData;
		[MethodName('printAztecWithXPos:YPos:rotate:size:ecp:flg:menu:multi:rev:aztecData:')]
		procedure printAztecWithXPosYPosrotatesizeecpflgmenumultirevaztecData(XPos:NSInteger;YPos:NSInteger;rotate:NSInteger;size:NSInteger;ecp:NSInteger;flg:NSInteger;menu:NSInteger;multi:NSInteger;rev:NSInteger;aztecData:NSString);cdecl;
		
		
		//{*
		// *  page 52.
		// *  print Bitmap format image.
		// }
		//- (void)putBMPWithFilename:(NSString *)filename
		                      //XPos:(NSInteger)x_pos
		                      //YPos:(NSInteger)y_pos;
		 //- (void)putBMPWithFilename:(NSString *)filename                       XPos:(NSInteger)x_pos                       YPos:(NSInteger)y_pos;
		[MethodName('putBMPWithFilename:XPos:YPos:')]
		procedure putBMPWithFilenameXPosYPos(filename:NSString;x_pos:NSInteger;y_pos:NSInteger);cdecl;
		
		
		//{*
		// *  page 54.
		// *  print PCX format images.
		// }
		//- (void)putPCXWithFilename:(NSString *)filename
		                      //XPos:(NSInteger)x_pos
		                      //YPos:(NSInteger)y_pos;
		 //- (void)putPCXWithFilename:(NSString *)filename                       XPos:(NSInteger)x_pos                       YPos:(NSInteger)y_pos;
		[MethodName('putPCXWithFilename:XPos:YPos:')]
		procedure putPCXWithFilenameXPosYPos(filename:NSString;x_pos:NSInteger;y_pos:NSInteger);cdecl;
		
		
		//{*
		// *  page 63.
		// *  reverse a region in image buffer.
		// }
		//- (void)setReverseWithXStart:(NSInteger)x_start
		                      //YStart:(NSInteger)y_start
		                      //XWidth:(NSInteger)x_width
		                     //YHeight:(NSInteger)y_height;
		 //- (void)setReverseWithXStart:(NSInteger)x_start                       YStart:(NSInteger)y_start                       XWidth:(NSInteger)x_width                      YHeight:(NSInteger)y_height;
		[MethodName('setReverseWithXStart:YStart:XWidth:YHeight:')]
		procedure setReverseWithXStartYStartXWidthYHeight(x_start:NSInteger;y_start:NSInteger;x_width:NSInteger;y_height:NSInteger);cdecl;
		
		
		////#pragma mark Device Reconfiguration Commands
		
		//{*
		// *  page 32.
		// *  setting the counter number in the program and its increments.计数器设置
		// *
		// *  @param counterNumber 第几个计数器 which number of counter（0-50）
		// *  @param step          计数间隔 counting interval    （-99999999 ~ 99999999）
		// }
		//- (void)setCounterWithCounterNumber:(NSInteger)counterNumber
		                               //Step:(NSInteger)step;
		 //- (void)setCounterWithCounterNumber:(NSInteger)counterNumber                                Step:(NSInteger)step;
		[MethodName('setCounterWithCounterNumber:Step:')]
		procedure setCounterWithCounterNumberStep(counterNumber:NSInteger;step:NSInteger);cdecl;
		
		
		//- (void)setCutterON;
		procedure setCutterON;cdecl;
		
		//- (void)setCutterOFF;
		procedure setCutterOFF;cdecl;
		
		//- (void)setCutterBATCH;
		procedure setCutterBATCH;cdecl;
		
		
		//{*
		// *  set number of printing labels per cut
		// *
		// *  @param pieces (0 ~ 65535)
		// }
		//- (void)setCutterPieces:(NSInteger)pieces;
		procedure setCutterPieces(pieces:NSInteger);cdecl;
		
		
		//- (void)setPARTIAL_CUTTER_OFF;
		procedure setPARTIAL_CUTTER_OFF;cdecl;
		
		//- (void)setPARTIAL_CUTTER_BATCH;
		procedure setPARTIAL_CUTTER_BATCH;cdecl;
		
		
		//{*
		// *  set number of printing labels per cut
		// *
		// *  @param pieces (0 ~ 65535)
		// }
		//- (void)setPARTIAL_CUTTER_Pieces:(NSInteger)pieces;
		procedure setPARTIAL_CUTTER_Pieces(pieces:NSInteger);cdecl;
		
		
		//- (void)setBackOFF;
		procedure setBackOFF;cdecl;
		
		//- (void)setBackON;
		procedure setBackON;cdecl;
		
		
		//{*
		// *  This setting is used to enable/disable the KEY1/KEY2/KEY3 function.
		// *
		// *  @param index    KEY1,KEY2,KEY3
		// *  @param switcher ON/OFF
		// }
		//- (void)setKEY:(NSInteger)index Switch:(NSString *)switcher;
		[MethodName('setKEY:Switch:')]
		procedure setKEYSwitch(index:NSInteger;switcher:NSString);cdecl;
		
		
		//{*
		// *  This setting is used to enable/disable the LED function.
		// LED1 Power on/off
		// LED2 Printer on-line/off-line
		// LED3 Error/normal
		// *
		// *  @param index    LED1,LED2,LED3
		// *  @param switcher ON/OFF
		// }
		//- (void)setLED:(NSInteger)index Switch:(NSString *)switcher;
		[MethodName('setLED:Switch:')]
		procedure setLEDSwitch(index:NSInteger;switcher:NSString);cdecl;
		
		
		//- (void)setPeelON;
		procedure setPeelON;cdecl;
		
		//- (void)setPeelOFF;
		procedure setPeelOFF;cdecl;
		
		
		//{*
		// *  This command is used to enable/disable feeding of labels to gap/black mark position for tearing off.
		// *  This setting will be saved in printer memory when turning off the power.
		// }
		//- (void)setTearON;
		procedure setTearON;cdecl;
		
		//- (void)setTearOFF;
		procedure setTearOFF;cdecl;
		
		
		//- (void)setStriperON;
		procedure setStriperON;cdecl;
		
		//- (void)setStriperOFF;
		procedure setStriperOFF;cdecl;
		
		
		//{*
		// *  This setting is used to enable/disable head open sensor.
		// }
		//- (void)setHeadON;
		procedure setHeadON;cdecl;
		
		//- (void)setHeadOFF;
		procedure setHeadOFF;cdecl;
		
		
		//- (void)setRibbonON;
		procedure setRibbonON;cdecl;
		
		//- (void)setRibbonOFF;
		procedure setRibbonOFF;cdecl;
		
		
		//{*
		// *  This setting defines communication parameters for printer serial port.
		// *
		// *  @param baud   24,48,96,19,38,57,115( 对应单位2400 bps,4800 bps,9600 bps,38400 bps,15200 bps)
		// *  @param parity N,E,O(NO/Even/Odd parity check)
		// *  @param data   7,8(bits Data)
		// *  @param stop   1,2(stop bit)
		// }
		//- (void)setCOM1WithBaud:(NSInteger)baud
		                 //Parity:(NSString *)parity
		                   //Data:(NSString *)data
		                   //Stop:(NSString *)stop;
		 //- (void)setCOM1WithBaud:(NSInteger)baud                  Parity:(NSString *)parity                    Data:(NSString *)data                    Stop:(NSString *)stop;
		[MethodName('setCOM1WithBaud:Parity:Data:Stop:')]
		procedure setCOM1WithBaudParityDataStop(baud:NSInteger;parity:NSString;data:NSString;stop:NSString);cdecl;
		
		
		//{*
		// *  This command will print one label and feed label gap to tear br position for tearing away.
		// *  This setting will be saved in printer memory.
		// *
		// *  @param key OFF/ON/AUTO/<num>
		// }
		//- (void)setPrintKey:(NSString *)key;
		procedure setPrintKey(key:NSString);cdecl;
		
		
		//- (void)setReprintON;
		procedure setReprintON;cdecl;
		
		//- (void)setReprintOFF;
		procedure setReprintOFF;cdecl;
		
		
	end;
	
	PTOldCommandTSPLClass=interface(NSObjectClass)//
	['{36848278-8AF3-47E5-A70B-D58FD191094B}']
	end;
	
	TPTOldCommandTSPL=class(TOCGenericImport<PTOldCommandTSPLClass,PTOldCommandTSPL>)
	end;
	
	
	
	
	
	//NS_ASSUME_NONNULL_END
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTOldCommandTSPL_FakeLoader : PTOldCommandTSPL; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTOldCommandTSPL';
{$O+}



{$ENDIF}

end.

