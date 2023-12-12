//{!
// *  \~chinese
// *  ������SDK3.0.0֮ǰ�İ汾�����ںܶ�ͻ�����ʹ��֮ǰ��SDK���Ż��ӿں�Ķ�̫�󣬾���һ���ౣ��֮ǰ�Ľӿ�
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
		// *  �Լ죬��ӡ��ӡ����Ϣ
		// }
		//- (void)selfTest;
		procedure selfTest;cdecl;
		
		
		//- (void)appendCommand:(NSString *)cmd;
		procedure appendCommand(cmd:NSString);cdecl;
		
		
		//{* ��ӡ����ֽһ��
		// *  Print and feed one line
		// }
		//- (void)printAndLineFeed;
		procedure printAndLineFeed;cdecl;
		
		
		
		//{*
		// set font bold
		// ��������Ӵ�
		// 
		// @param bold 0�����Ӵ� 1���Ӵ�
		// }
		//- (void)setFontBold:(NSInteger)bold;
		procedure setFontBold(bold:NSInteger);cdecl;
		
		
		//{*
		// �Զ��ش���ӡ��״̬
		// ����֮��ÿ��ӡһ�Ŷ��᷵��10���ֽڵ����ݣ���ʽ��ָ��ͷ4���ֽ�(aa bb cc dd) + 4���ֽڵĴ�ӡ����(�ӿ������رյĴ�ӡ������) + 1���ֽڵ�״̬ + ������00
		// 
		// �᷵���������ݣ���һ�α�ʾ���ؿɻ�ȡ��ӡ��������״̬���ڶ��α�ʾ��ӡ����
		// eg:1.aabbccdd 03000000 2000
		// 2.aabbccdd ffffffff 0000 ����ӡ������aabbccdd 00000000 0000���ر��Զ��ش�
		// @param status 1�������Զ��ش�  3���ر��Զ��ش�
		// }
		//- (void)setPrinterStateAutomaticBackWithStatus:(NSInteger)status;
		procedure setPrinterStateAutomaticBackWithStatus(status:NSInteger);cdecl;
		
		
		//{*
		// *  setting print area size in paper.
		// *  ��ӡֽ�ŷ�Χ��С ��ӡֽ�ĺ���
		// }
		//- (void)setPrintAreaSizeWithWidth:(NSInteger)label_width
		                           //Height:(NSInteger)label_height;
		 //- (void)setPrintAreaSizeWithWidth:(NSInteger)label_width                            Height:(NSInteger)label_height;
		[MethodName('setPrintAreaSizeWithWidth:Height:')]
		procedure setPrintAreaSizeWithWidthHeight(label_width:NSInteger;label_height:NSInteger);cdecl;
		
		
		//{*
		// 
		// get print status
		// ������Ϊ�����ж�ֽ�ţ�����Ĭ����ֽ
		// 
		// ����һ���ֽ�
		// bit7  bit6  bit5  bit4  bit3  bit2  bit1  bit0
		// 1      1      1     1     1     1     1    1
		// ����   ����  ��ӡ��  ��ͣ   ˿��   ȱֽ   ��ֽ  ����
		// }
		//- (void)getPrinterStatus;
		procedure getPrinterStatus;cdecl;
		
		
		//{*
		// *  setting gap distance during labels.
		// *  ���ñ�ǩֽ�ļ��
		// *
		// *  @param distance ���ű�ǩ���м�Ĵ�ֱ����
		// *  @param offset   ��ֱ����ƫ��
		// }
		//- (void)setGapWithDistance:(NSInteger)distance
		                    //Offset:(NSInteger)offset;
		 //- (void)setGapWithDistance:(NSInteger)distance                     Offset:(NSInteger)offset;
		[MethodName('setGapWithDistance:Offset:')]
		procedure setGapWithDistanceOffset(distance:NSInteger;offset:NSInteger);cdecl;
		
		
		//{*
		// *  setting black line
		// *  ���ú���
		// *
		// *  @param height ���ߵĸ߶� 0~25.4 mm
		// *  @param offset ����ƫ���� 0~label length
		// *  height,offset Ϊ0,0��ʾ������ǩ
		// }
		//- (void)setBlineWithHeight:(NSInteger)height
		                    //Offset:(NSInteger)offset;
		 //- (void)setBlineWithHeight:(NSInteger)height                     Offset:(NSInteger)offset;
		[MethodName('setBlineWithHeight:Offset:')]
		procedure setBlineWithHeightOffset(height:NSInteger;offset:NSInteger);cdecl;
		
		
		//{*
		// *  paper feed with distance.
		// *  ��ֽ
		// }
		//- (void)setOffsetWithDistance:(NSInteger)distance;
		procedure setOffsetWithDistance(distance:NSInteger);cdecl;
		
		
		//{*
		// *  setting print sets and copies.
		// *  ��ӡ����
		// *
		// *  @param sets   ���ٷ�       how many sets of labels will be printed.
		// *  @param copies ÿ�ݶ�����    how many copies should be printed for each particular label set.
		// }
		//- (void)printWithSets:(NSInteger)sets  Copies:(NSInteger)copies;
		[MethodName('printWithSets:Copies:')]
		procedure printWithSetsCopies(sets:NSInteger;copies:NSInteger);cdecl;
		
		
		
		//{*
		// ��ӡ�Զ������ı������ʸ���ֿ�Ļ���
		// 
		// @param x_pos x��ʼ����
		// @param y_pos y��ʼ����
		// @param font ���壺1-9��1-8��ֻ�ܴ�ӡӢ��  9����Ӣ�Ķ��ܴ�һ��ѡ��9��
		// @param rotation ��ӡ����
		// @param x_multiplication font��1-8ʱ����ʾ�Ŵ����Ŵ���  font��9��ʱ�򣬱�ʾ�ı��ĺ����С��eg��24
		// @param y_multiplication font��1-8ʱ����ʾ�Ŵ�����Ŵ��� font��9��ʱ�򣬱�ʾ�ı��������С��eg��24
		// @param safeHeight ��ӡ�ĸ߶ȷ�Χ���������ֲ����ӡ
		// @param width ��ӡ�Ŀ�ȷ�Χ������0��ʱ���Զ�����
		// @param lineSpacing �м��
		// @param text �ı�
		// @return ����ʵ�ʵĴ�ӡ�߶�
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
		// ��ӡ�Զ������ı�����Ե����ֿ�Ļ���
		// 
		// @param x_pos x��ʼ����
		// @param y_pos y��ʼ����
		// @param font ���壺0-1��0��12x24 24x24   1:8x16  16x16
		// @param rotation ��ӡ����
		// @param x_multiplication ����Ŵ���:1-10
		// @param y_multiplication ����Ŵ���:1-10
		// @param safeHeight ��ӡ�ĸ߶ȷ�Χ���������ֲ����ӡ
		// @param width ��ӡ�Ŀ�ȷ�Χ������0��ʱ���Զ�����
		// @param lineSpacing �м��
		// @param text �ı�
		// @return ����ʵ�ʵĴ�ӡ�߶�
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
		// ��ӡ�ı�
		// 
		// @param x_pos ����x�������
		// @param y_pos ����y�������
		// @param font �����С Ӣ�����壺0-8  ���ģ�9
		// @param rotation 0 90 180 270
		// @param x_multiplication Ӣ�����壺1-10 ���ģ�40-80(��С�ɵ�)
		// @param y_multiplication Ӣ�����壺1-10 ���ģ�40-80(��С�ɵ�)
		// @param text ��ӡ���ı�
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
		// *  �����ӡ��������
		// }
		//- (void)setCLS;
		procedure setCLS;cdecl;
		
		
		//{*
		// *  print barcode.
		// *  ��ӡһά����
		// *
		// *  @param type     bar code type @[128,128M,EAN128,25,25C,39,29S,93,EAN13,EAN13+2,EAN13+5,EAN8,EAN8+5,CODA,POST,UPCA,UPCA+2,UPCA+5,UPCE,UPCE+2,UPCE+5,CPOST,MSI,MSIC,PLESSEY,ITF14,EAN14,11];
		// *  @param readable �Ƿ�ɶ���0�����ɶ���1���ɶ� whether it is readable��0: unreadable; 1: readable
		// *  @param rotation rotation��0��90��180��270
		// *  @param narrow   խԪ�� narrow element
		// *  @param wide     ��Ԫ�� wide element
		// }
		
		//{*
		// print barcode.
		// ��ӡһά����
		// eg:100,100,��39��,96,1,0,2,4,��1000�� �� 10,10,��128M��,48,1,0,2,2,��!104!096ABCD!101EFGH��
		// 
		// @param x_pos Specify the x-coordinate of the bar code on the label
		// @param y_pos Specify the y-coordinate of the bar code on the label
		// @param type bar code type @[128,128M,EAN128,25,25C,39,29S,93,EAN13,EAN13+2,EAN13+5,EAN8,EAN8+5,CODA,POST,UPCA,UPCA+2,UPCA+5,UPCE,UPCE+2,UPCE+5,CPOST,MSI,MSIC,PLESSEY,ITF14,EAN14,11];
		// @param height Bar code height (in dots)
		// @param readable �Ƿ�ɶ���0�����ɶ���1���ɶ� whether it is readable��0: unreadable; 1: readable
		// @param rotation rotation��0��90��180��270
		// @param narrow խԪ�� narrow element
		// @param wide ��Ԫ�� wide element
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
		// ��ӡ��ά����
		// eg:100,10,L,7,M,0,M1,S1,"ATHE FIRMWARE HAS BEEN UPDATED"
		// 
		// @param x_pos The upper left corner x-coordinate of the QR code
		// @param y_pos The upper left corner y-coordinate of the QR code
		// @param ecc_level Error correction recovery level
		// L :7% M :15% Q : 25% H : 30%
		// @param width 1~10
		// @param mode A/M  A:Auto M:Manual
		// @param rotation 0 �� 90 ��180 ��270
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
		// ��ӡλͼ,ȡ���Ѿ���SDK�д���
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
		
		
		////#pragma mark BasicSetting �����趨
		
		//{*
		// *  setting print speed
		// *  ���ô�ӡ�ٶ�
		// *
		// }
		//- (void)setSpeed:(NSInteger)speed;
		procedure setSpeed(speed:NSInteger);cdecl;
		
		
		//{*
		// *  setting print density
		// *  ���ô�ӡŨ��
		// *
		// *  @param density Ũ�� 0~15 level
		// }
		//- (void)setDensity:(NSInteger)density;
		procedure setDensity(density:NSInteger);cdecl;
		
		
		//{*
		// *  setting print direction and mirror.
		// *  ���ô�ӡ�ķ���;���
		// *
		// *  @param direction ������Դ�ӡ�������Լ������ֽ��0��������1������
		// *  @param mirror    ���񣬿�ѡ�� 0 ��ͨ��1 ����
		// }
		//- (void)setDirection:(NSInteger)direction Mirror:(NSInteger)mirror;
		[MethodName('setDirection:Mirror:')]
		procedure setDirectionMirror(direction:NSInteger;mirror:NSInteger);cdecl;
		
		
		//{*
		// *  setting print reference position
		// *  ���ñ�ǩ�ο����
		// *
		// }
		//- (void)setReferenceXPos:(NSInteger)x_pos
		                    //YPos:(NSInteger)y_pos;
		 //- (void)setReferenceXPos:(NSInteger)x_pos                     YPos:(NSInteger)y_pos;
		[MethodName('setReferenceXPos:YPos:')]
		procedure setReferenceXPosYPos(x_pos:NSInteger;y_pos:NSInteger);cdecl;
		
		
		//{*
		// *  page 18.
		// *  setting the code page of inernational character set.���ù����ַ���
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
		// *  @param codepage �ַ�������
		// }
		//- (void)setCodePage:(NSString *)codepage;
		procedure setCodePage(codepage:NSString);cdecl;
		
		
		//{*
		// *  page 21.
		// *  feed label with the specified length.���ñ�ǩ��ֽ����
		// *
		// *  @param feedLength (1~9999)
		// }
		//- (void)setFeedLength:(NSInteger)feedLength;
		procedure setFeedLength(feedLength:NSInteger);cdecl;
		
		
		//{*
		// *  feed label to the beginning of next label.���ý�ֽ����һ��ǩ��ʼ��
		// }
		//- (void)setFormFeed;
		procedure setFormFeed;cdecl;
		
		
		///** ��ֽ */
		//- (void)setBackFeed:(NSInteger)distance;
		procedure setBackFeed(distance:NSInteger);cdecl;
		
		//- (void)setBackUP:(NSInteger)distance;
		procedure setBackUP(distance:NSInteger);cdecl;
		
		
		//{*
		// *  page 25.
		// *  feed label until the internal sensor has determined the origin.���ñ�ǩ��λ���ڲ�������ȷ�������
		// }
		//- (void)setHome;
		procedure setHome;cdecl;
		
		
		//{*
		// *  page 28.
		// *  control the sound frequency of the beeper.���÷���
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
		// *  activate the cutter to immediately cut the labels without back feeding the label.������ֽ
		// }
		//- (void)setCut;
		procedure setCut;cdecl;
		
		
		//{*
		// *  page 30.
		// *  ����ֹͣ��ֽ
		// }
		//- (void)setLimitFeed:(NSInteger)max_len;
		procedure setLimitFeed(max_len:NSInteger);cdecl;
		
		
		//{*
		// *  page 32.
		// *  draw a bar on the label format.�ڱ�ǩ�ϻ�һ����
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
		// *  draw rectangles on the label.�ڱ�ǩ�ϻ��ƾ���
		// *  @param thickness �߿�
		// }
		//- (void)setBoxWithXStart:(NSInteger)x_start
		                  //YStart:(NSInteger)y_start
		                    //XEnd:(NSInteger)x_end
		                    //YEnd:(NSInteger)y_end
		               //Thickness:(NSInteger)thickness;
		 //- (void)setBoxWithXStart:(NSInteger)x_start                   YStart:(NSInteger)y_start                     XEnd:(NSInteger)x_end                     YEnd:(NSInteger)y_end                Thickness:(NSInteger)thickness;
		[MethodName('setBoxWithXStart:YStart:XEnd:YEnd:Thickness:')]
		procedure setBoxWithXStartYStartXEndYEndThickness(x_start:NSInteger;y_start:NSInteger;x_end:NSInteger;y_end:NSInteger;thickness:NSInteger);cdecl;
		
		
		///** �ڱ�ǩ�ϻ�����Բ */
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
		// *  draw a circle on the label.�ڱ�ǩ�ϻ���Բ��
		// *
		// *  @param diameter  ֱ��
		// *  @param thickness �߿�
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
		// *  clear a specified region in the image buffer.����ͼ�񻺳���ָ��������
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
		// *  ���� DataMatrix ��ά�룬��ǰ��֧�� ECC200 �������
		// *
		// *  @param xm         [��ѡ]��Module size��x6��x8
		// *  @param row        [��ѡ]����Χ��10-144
		// *  @param col        [��ѡ]����Χ��10-144
		// *  @param expression ���ʽ
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
		// *  define a 2D Maxicode.��ӡ Maxicode ��ά��
		// *
		// *  @param mode    2,3,4,5
		// *  @param iClass   [option],Class of Service ,3-digit number(for mode 2,3)
		// *  @param country [option],Country code, 3-digit number (for mode 2,3)
		// *  @param post    [option],
		// Mode 2: (USA) 5-digit+ 4-digit number.
		// Mode 3: (Canada) 6 alphanumeric post code included by double quotes.
		// *  @param lm      Expression length (double quote is ignored) , ��Χ��1-138, (this parameter is just for mode 4 and 5.)
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
		// *  @param option ��ѡ��
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
		// *  setting the counter number in the program and its increments.����������
		// *
		// *  @param counterNumber �ڼ��������� which number of counter��0-50��
		// *  @param step          ������� counting interval    ��-99999999 ~ 99999999��
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
		// *  @param baud   24,48,96,19,38,57,115( ��Ӧ��λ2400 bps,4800 bps,9600 bps,38400 bps,15200 bps)
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

