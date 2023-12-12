

//{!
// *  \~chinese
// *  ������SDK3.0.0֮ǰ�İ汾�����ںܶ�ͻ�����ʹ��֮ǰ��SDK���Ż��ӿں�Ķ�̫�󣬾���һ���ౣ��֮ǰ�Ľӿ�
// *
// *  \~english
// *  This class is a version before SDK3.0.0. Since many customers still use the previous SDK, after optimizing the interface and making too much change, use a class to retain the previous interface.
// }


unit iOSApi.PTOldCommandCPCL;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
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
	
	//@interface PTOldCommandCPCL : NSObject
	//@interface PTOldCommandCPCL : NSObject
	PTOldCommandCPCL=interface(NSObject)//
	['{59F4225D-0FEF-4109-8F21-9061C3B148BC}']
		
		//@property(strong,nonatomic,readwrite) NSMutableData * _Nonnull cmdData;
		function _Nonnull:NSMutableData;cdecl;
		procedure set_Nonnull(_Nonnull:NSMutableData);cdecl;
		
		//@property (nonatomic, assign) NSStringEncoding encoding;
		function encoding:NSStringEncoding;cdecl;
		procedure setEncoding(encoding:NSStringEncoding);cdecl;
		
		//- (void)appendCommand:(NSString * _Nonnull)cmd;
		procedure appendCommand(cmd:{_Nonnull}NSString);cdecl;
		
		
		//- (void)appendCommandData:(NSData * _Nonnull)data;
		procedure appendCommandData(data:{_Nonnull}NSData);cdecl;
		
		
		//{*
		// ��ӡ���Լ�ҳ selfTest
		// }
		//- (void)printSelfInspectionPage;
		procedure printSelfInspectionPage;cdecl;
		
		
		//{*
		// ��ȡ��ӡ��״̬ get printer status.
		// }
		//- (void)cpclGetPaperStatus;
		procedure cpclGetPaperStatus;cdecl;
		
		
		//{*
		// ���ش�ӡ״̬�ص�
		// turn on/off print status callback.
		// 
		// @param flag on/off
		// }
		//- (void)cpclTurnOnPrintStatusCallBack:(BOOL)flag;
		procedure cpclTurnOnPrintStatusCallBack(flag:Boolean);cdecl;
		
		
		//{*
		// ���»���
		// Turn on underline
		// }
		//- (void)cpclUnderlineON;
		procedure cpclUnderlineON;cdecl;
		
		
		//{*
		// �ر��»���
		// Turn off underline
		// }
		//- (void)cpclUnderlineOFF;
		procedure cpclUnderlineOFF;cdecl;
		
		//- (void)cpclUtilitySession;
		procedure cpclUtilitySession;cdecl;
		
		
		///** ��ģʽָ��ǰ׺ Command prefix of line mode */
		//- (void)cpclLineMode;
		procedure cpclLineMode;cdecl;
		
		//- (void)cpclReWindOFF;
		procedure cpclReWindOFF;cdecl;
		
		
		//{*
		// ��ȡ��ӡ��SN�� get printer serial number.
		// }
		//- (void)cpclGetPrinterSN;
		procedure cpclGetPrinterSN;cdecl;
		
		
		//{*
		// *   ����ֽ������1 Set the paper type
		// *
		// *  @param type      (0~5)
		// 0:����ֽ continuous paper
		// 1����ǩֽ Label paper
		// 2����ڱ� Back black mark
		// 3��ǰ�ڱ� Front black mark
		// 4��3��ڱ� 3 inch black mark
		// 5��2��ڱ� 2 inch black mark
		// }
		//- (void)cpclPaperTypeWithType:(NSInteger )type;
		procedure cpclPaperTypeWithType(_type:NSInteger);cdecl;
		
		
		//{*
		// *   ����ֽ������2 Set the paper type
		// *
		// *  @param type      (0~5)
		// 0:����ֽ continuous paper
		// 2����ǩֽ Label paper
		// 4��2��ڱ� 2 inch black mark
		// 5��3��ڱ� 3 inch black mark
		// 6��4��ڱ� 4 inch black mark
		// }
		//- (void)setPrinterPaperTypeFor4Inch:(NSInteger)type;
		procedure setPrinterPaperTypeFor4Inch(_type:NSInteger);cdecl;
		
		
		
		//{*
		// Set Label
		// 
		// @param offset The number of units to offset all fields from the left side of the label horizontally. 0-65535
		// @param hRes The horizontal resolution of this label, expressed in dots per inch. 100 or 200
		// @param vRes The vertical resolution of this label, expressed in dots per inch. 100 or 200
		// @param height The height of the label in units. 0-65535
		// @param quantity The number of copies of the label to print.  0-1024
		// }
		//- (void)cpclLabelWithOffset:(NSInteger)offset
		                       //hRes:(NSInteger)hRes
		                       //vRes:(NSInteger)vRes
		                     //height:(NSInteger)height
		                   //quantity:(NSInteger)quantity;
		 //- (void)cpclLabelWithOffset:(NSInteger)offset                        hRes:(NSInteger)hRes                        vRes:(NSInteger)vRes                      height:(NSInteger)height                    quantity:(NSInteger)quantity;
		[MethodName('cpclLabelWithOffset:hRes:vRes:height:quantity:')]
		procedure cpclLabelWithOffsethResvResheightquantity(offset:NSInteger;hRes:NSInteger;vRes:NSInteger;height:NSInteger;quantity:NSInteger);cdecl;
		
		
		
		//{*
		// Barcode
		// 
		// @param type The type of barcode to print.
		// @param width The width of a narrow bar.
		// @param ratio The ratio of wide to narrow bars. 0-4��20-30
		// @param height The height of the barcode.
		// @param x The X position where the barcode begins
		// @param y The Y position where the barcode begins
		// @param barcode The data to be encoded into a barcode
		// }
		//- (void)cpclBarcode:(NSString * _Nonnull)type
		              //width:(NSInteger)width
		              //ratio:(NSInteger)ratio
		             //height:(NSInteger)height
		                  //x:(NSInteger)x
		                  //y:(NSInteger)y
		            //barcode:(NSString * _Nonnull)barcode;
		 //- (void)cpclBarcode:(NSString * _Nonnull)type               width:(NSInteger)width               ratio:(NSInteger)ratio              height:(NSInteger)height                   x:(NSInteger)x                   y:(NSInteger)y             barcode:(NSString * _Nonnull)barcode;
		[MethodName('cpclBarcode:width:ratio:height:x:y:barcode:')]
		procedure cpclBarcodewidthratioheightxybarcode(_type:{_Nonnull}NSString;width:NSInteger;ratio:NSInteger;height:NSInteger;x:NSInteger;y:NSInteger;barcode:{_Nonnull}NSString);cdecl;
		
		
		//{*
		// VBarcode
		// 
		// @param type The type of barcode to print.
		// @param width The width of a narrow bar.
		// @param ratio The ratio of wide to narrow bars.
		// @param height The height of the barcode.
		// @param x The X position where the barcode begins
		// @param y The Y position where the barcode begins
		// @param barcode The data to be encoded into a barcode
		// }
		//- (void)cpclBarcodeVertical:(NSString * _Nonnull)type
		                      //width:(NSInteger)width
		                      //ratio:(NSInteger)ratio
		                     //height:(NSInteger)height
		                          //x:(NSInteger)x
		                          //y:(NSInteger)y
		                    //barcode:(NSString * _Nonnull)barcode;
		 //- (void)cpclBarcodeVertical:(NSString * _Nonnull)type                       width:(NSInteger)width                       ratio:(NSInteger)ratio                      height:(NSInteger)height                           x:(NSInteger)x                           y:(NSInteger)y                     barcode:(NSString * _Nonnull)barcode;
		[MethodName('cpclBarcodeVertical:width:ratio:height:x:y:barcode:')]
		procedure cpclBarcodeVerticalwidthratioheightxybarcode(_type:{_Nonnull}NSString;width:NSInteger;ratio:NSInteger;height:NSInteger;x:NSInteger;y:NSInteger;barcode:{_Nonnull}NSString);cdecl;
		
		
		
		//{*
		// BarcodeQR
		// 
		// @param xPos The X position where the barcode begins
		// @param yPos The Y position where the barcode begins
		// @param model The ratio of wide to narrow bars:1 or 2
		// @param unitWidth Unit-width of the barcode in dots ��Χ��1-32,Ĭ����6
		// }
		//- (void)cpclBarcodeQRcodeWithXPos:(NSInteger)xPos
		                             //yPos:(NSInteger)yPos
		                            //model:(NSInteger)model
		                        //unitWidth:(NSInteger)unitWidth;
		 //- (void)cpclBarcodeQRcodeWithXPos:(NSInteger)xPos                              yPos:(NSInteger)yPos                             model:(NSInteger)model                         unitWidth:(NSInteger)unitWidth;
		[MethodName('cpclBarcodeQRcodeWithXPos:yPos:model:unitWidth:')]
		procedure cpclBarcodeQRcodeWithXPosyPosmodelunitWidth(xPos:NSInteger;yPos:NSInteger;model:NSInteger;unitWidth:NSInteger);cdecl;
		
		
		//{*
		// VBarcodeQR
		// 
		// @param xPos The X position where the barcode begins
		// @param yPos The Y position where the barcode begins
		// @param model The ratio of wide to narrow bars:1 or 2
		// @param unitWidth Unit-width of the barcode in dots
		// }
		//- (void)cpclBarcodeQRcodeVerticalWithXPos:(NSInteger)xPos
		                                     //yPos:(NSInteger)yPos
		                                    //model:(NSInteger)model
		                                //unitWidth:(NSInteger)unitWidth;
		 //- (void)cpclBarcodeQRcodeVerticalWithXPos:(NSInteger)xPos                                      yPos:(NSInteger)yPos                                     model:(NSInteger)model                                 unitWidth:(NSInteger)unitWidth;
		[MethodName('cpclBarcodeQRcodeVerticalWithXPos:yPos:model:unitWidth:')]
		procedure cpclBarcodeQRcodeVerticalWithXPosyPosmodelunitWidth(xPos:NSInteger;yPos:NSInteger;model:NSInteger;unitWidth:NSInteger);cdecl;
		
		
		
		//{*
		// QR Data
		// 
		// @param data Data for barcode
		// @param config Configuration options for barcode:MN:nunber,MA:Numbers or letters
		// }
		//- (void)cpclBarcodeQRcodeData:(NSString * _Nonnull)data config:(NSString * _Nonnull)config;
		[MethodName('cpclBarcodeQRcodeData:config:')]
		procedure cpclBarcodeQRcodeDataconfig(data:{_Nonnull}NSString;config:{_Nonnull}NSString);cdecl;
		
		
		
		//{*
		// The QR code terminator.
		// }
		//- (void)cpclBarcodeQRcodeEnd;
		procedure cpclBarcodeQRcodeEnd;cdecl;
		
		
		
		//{*
		// BARCODE-TEXT
		// 
		// @param font A font name or number to create the representation
		// @param fontSize The size of the font: 0-999
		// @param offset How far in units the text is from the barcode:0-999
		// }
		//- (void)cpclBarcodeTextWithFont:(NSInteger)font
		                       //fontSize:(NSInteger)fontSize
		                         //offset:(NSInteger)offset;
		 //- (void)cpclBarcodeTextWithFont:(NSInteger)font                        fontSize:(NSInteger)fontSize                          offset:(NSInteger)offset;
		[MethodName('cpclBarcodeTextWithFont:fontSize:offset:')]
		procedure cpclBarcodeTextWithFontfontSizeoffset(font:NSInteger;fontSize:NSInteger;offset:NSInteger);cdecl;
		
		
		
		//{*
		// BARCODE-TEXT
		// 
		// @param font The filename of the TTF font with extension
		// @param xScale The X size of the font, in dots: 0-999
		// @param yScale The Y size of the font, in dots: 0-999
		// @param offset How far in units the text is from the barcode: 0-999
		// }
		//- (void)cpclBarcodeTextWithTrueTypeFont:(NSInteger)font
		                                 //xScale:(NSInteger)xScale
		                                 //yScale:(NSInteger)yScale
		                                 //offset:(NSInteger)offset;
		 //- (void)cpclBarcodeTextWithTrueTypeFont:(NSInteger)font                                  xScale:(NSInteger)xScale                                  yScale:(NSInteger)yScale                                  offset:(NSInteger)offset;
		[MethodName('cpclBarcodeTextWithTrueTypeFont:xScale:yScale:offset:')]
		procedure cpclBarcodeTextWithTrueTypeFontxScaleyScaleoffset(font:NSInteger;xScale:NSInteger;yScale:NSInteger;offset:NSInteger);cdecl;
		
		
		//{*
		// off barcodeText
		// }
		//- (void)cpclBarcodeTextOff;
		procedure cpclBarcodeTextOff;cdecl;
		
		
		//{*
		// *   ���ƾ��� Draw rectangle
		// *
		// *  @param xPos      (0~65535)
		// *  @param yPos      (0~65535)
		// *  @param xEnd      (0~65535)
		// *  @param yEnd      (0~65535)
		// *  @param thickness (0~65535)
		// }
		//- (void)cpclBoxWithXPos:(NSInteger)xPos
		                   //yPos:(NSInteger)yPos
		                   //xEnd:(NSInteger)xEnd
		                   //yEnd:(NSInteger)yEnd
		              //thickness:(NSInteger)thickness;
		 //- (void)cpclBoxWithXPos:(NSInteger)xPos                    yPos:(NSInteger)yPos                    xEnd:(NSInteger)xEnd                    yEnd:(NSInteger)yEnd               thickness:(NSInteger)thickness;
		[MethodName('cpclBoxWithXPos:yPos:xEnd:yEnd:thickness:')]
		procedure cpclBoxWithXPosyPosxEndyEndthickness(xPos:NSInteger;yPos:NSInteger;xEnd:NSInteger;yEnd:NSInteger;thickness:NSInteger);cdecl;
		
		
		//- (void)cpclCenterWithRange:(NSInteger)range;
		procedure cpclCenterWithRange(range:NSInteger);cdecl;
		
		
		//- (void)cpclCenter;
		procedure cpclCenter;cdecl;
		
		
		//- (void)cpclCompressedGraphicsWithImageWidth:(NSInteger)imageWidth
		                                 //imageHeight:(NSInteger)imageHeight
		                                           //x:(NSInteger)x
		                                           //y:(NSInteger)y
		                                  //bitmapData:(NSData * _Nonnull)bitmapData;
		 //- (void)cpclCompressedGraphicsWithImageWidth:(NSInteger)imageWidth                                  imageHeight:(NSInteger)imageHeight                                            x:(NSInteger)x                                            y:(NSInteger)y                                   bitmapData:(NSData * _Nonnull)bitmapData;
		[MethodName('cpclCompressedGraphicsWithImageWidth:imageHeight:x:y:bitmapData:')]
		procedure cpclCompressedGraphicsWithImageWidthimageHeightxybitmapData(imageWidth:NSInteger;imageHeight:NSInteger;x:NSInteger;y:NSInteger;bitmapData:{_Nonnull}NSData);cdecl;
		
		
		//- (void)cpclConcatStartWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;
		[MethodName('cpclConcatStartWithXPos:yPos:')]
		procedure cpclConcatStartWithXPosyPos(xPos:NSInteger;yPos:NSInteger);cdecl;
		
		//- (void)cpclConcatVerticalStartWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;
		[MethodName('cpclConcatVerticalStartWithXPos:yPos:')]
		procedure cpclConcatVerticalStartWithXPosyPos(xPos:NSInteger;yPos:NSInteger);cdecl;
		
		
		///** �ֶ�ƴ�� Field combination */
		//- (void)cpclConcatTextWithFont:(NSInteger)font
		                      //fontSize:(NSInteger)fontSize
		                        //offset:(NSInteger)offset
		                          //text:(NSString * _Nonnull)text;
		 //- (void)cpclConcatTextWithFont:(NSInteger)font                       fontSize:(NSInteger)fontSize                         offset:(NSInteger)offset                           text:(NSString * _Nonnull)text;
		[MethodName('cpclConcatTextWithFont:fontSize:offset:text:')]
		procedure cpclConcatTextWithFontfontSizeoffsettext(font:NSInteger;fontSize:NSInteger;offset:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//- (void)cpclConcatScaleTextWithScaledFont:(NSInteger)scaledFont
		                                   //xScale:(NSInteger)xScale
		                                   //yScale:(NSInteger)yScale
		                                   //offset:(NSInteger)offset
		                                     //text:(NSString * _Nonnull)text;
		 //- (void)cpclConcatScaleTextWithScaledFont:(NSInteger)scaledFont                                    xScale:(NSInteger)xScale                                    yScale:(NSInteger)yScale                                    offset:(NSInteger)offset                                      text:(NSString * _Nonnull)text;
		[MethodName('cpclConcatScaleTextWithScaledFont:xScale:yScale:offset:text:')]
		procedure cpclConcatScaleTextWithScaledFontxScaleyScaleoffsettext(scaledFont:NSInteger;xScale:NSInteger;yScale:NSInteger;offset:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//- (void)cpclConcatScaleTextVerticalWithScaledFont:(NSInteger)scaledFont
		                                           //xScale:(NSInteger)xScale
		                                           //yScale:(NSInteger)yScale
		                                           //offset:(NSInteger)offset
		                                             //text:(NSString * _Nonnull)text;
		 //- (void)cpclConcatScaleTextVerticalWithScaledFont:(NSInteger)scaledFont                                            xScale:(NSInteger)xScale                                            yScale:(NSInteger)yScale                                            offset:(NSInteger)offset                                              text:(NSString * _Nonnull)text;
		[MethodName('cpclConcatScaleTextVerticalWithScaledFont:xScale:yScale:offset:text:')]
		procedure cpclConcatScaleTextVerticalWithScaledFontxScaleyScaleoffsettext(scaledFont:NSInteger;xScale:NSInteger;yScale:NSInteger;offset:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//- (void)cpclConcatTextWithFontGroup:(NSInteger)fontGroup
		                             //offset:(NSInteger)offset
		                               //text:(NSString * _Nonnull)text;
		 //- (void)cpclConcatTextWithFontGroup:(NSInteger)fontGroup                              offset:(NSInteger)offset                                text:(NSString * _Nonnull)text;
		[MethodName('cpclConcatTextWithFontGroup:offset:text:')]
		procedure cpclConcatTextWithFontGroupoffsettext(fontGroup:NSInteger;offset:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//- (void)cpclConcatEnd;
		procedure cpclConcatEnd;cdecl;
		
		//- (void)cpclPrint;
		procedure cpclPrint;cdecl;
		
		///** �����ӡ Reverse print */
		//- (void)cpclPoPrint;
		procedure cpclPoPrint;cdecl;
		
		
		//{*
		// ���׿�
		// 
		// @param xPos ����x����
		// @param yPos ����y����
		// @param xEnd �յ��x����
		// @param yEnd �յ��y����
		// @param thickness ��ĸ߶�
		// }
		//- (void)cpclInverseLineWithXPos:(NSInteger)xPos
		                           //yPos:(NSInteger)yPos
		                           //xEnd:(NSInteger)xEnd
		                           //yEnd:(NSInteger)yEnd
		                      //thickness:(NSInteger)thickness;
		 //- (void)cpclInverseLineWithXPos:(NSInteger)xPos                            yPos:(NSInteger)yPos                            xEnd:(NSInteger)xEnd                            yEnd:(NSInteger)yEnd                       thickness:(NSInteger)thickness;
		[MethodName('cpclInverseLineWithXPos:yPos:xEnd:yEnd:thickness:')]
		procedure cpclInverseLineWithXPosyPosxEndyEndthickness(xPos:NSInteger;yPos:NSInteger;xEnd:NSInteger;yEnd:NSInteger;thickness:NSInteger);cdecl;
		
		
		//- (void)cpclLeft:(NSInteger)range;
		procedure cpclLeft(range:NSInteger);cdecl;overload;
		
		
		//- (void)cpclLeft;
		procedure cpclLeft;cdecl;overload;
		
		
		//- (void)cpclLineWithXPos:(NSInteger)xPos
		                    //yPos:(NSInteger)yPos
		                    //xEnd:(NSInteger)xEnd
		                    //yEnd:(NSInteger)yEnd
		               //thickness:(NSInteger)thickness;
		 //- (void)cpclLineWithXPos:(NSInteger)xPos                     yPos:(NSInteger)yPos                     xEnd:(NSInteger)xEnd                     yEnd:(NSInteger)yEnd                thickness:(NSInteger)thickness;
		[MethodName('cpclLineWithXPos:yPos:xEnd:yEnd:thickness:')]
		procedure cpclLineWithXPosyPosxEndyEndthickness(xPos:NSInteger;yPos:NSInteger;xEnd:NSInteger;yEnd:NSInteger;thickness:NSInteger);cdecl;
		
		
		//- (void)cpclMoveWithRight:(NSInteger)right up:(NSString * _Nonnull)up;
		[MethodName('cpclMoveWithRight:up:')]
		procedure cpclMoveWithRightup(right:NSInteger;up:{_Nonnull}NSString);cdecl;
		
		//- (void)cpclMultiLineStartWithLineHeight:(NSInteger)lineHeight;
		procedure cpclMultiLineStartWithLineHeight(lineHeight:NSInteger);cdecl;
		
		//- (void)cpclMultiLineEnd;
		procedure cpclMultiLineEnd;cdecl;
		
		//- (void)cpclPageWidth:(NSInteger)pageWidth;
		procedure cpclPageWidth(pageWidth:NSInteger);cdecl;
		
		//- (void)cpclRight:(NSInteger)right;
		procedure cpclRight(right:NSInteger);cdecl;overload;
		
		//- (void)cpclRight;
		procedure cpclRight;cdecl;overload;
		
		//- (void)cpclRotate:(NSInteger)degrees;
		procedure cpclRotate(degrees:NSInteger);cdecl;
		
		//- (void)cpclScaleText:(NSString * _Nonnull)scaledFont
		               //xScale:(NSInteger)xScale
		               //yScale:(NSInteger)yScale
		                    //x:(NSInteger)x
		                    //y:(NSInteger)y
		                 //text:(NSString * _Nonnull)text;
		 //- (void)cpclScaleText:(NSString * _Nonnull)scaledFont                xScale:(NSInteger)xScale                yScale:(NSInteger)yScale                     x:(NSInteger)x                     y:(NSInteger)y                  text:(NSString * _Nonnull)text;
		[MethodName('cpclScaleText:xScale:yScale:x:y:text:')]
		procedure cpclScaleTextxScaleyScalexytext(scaledFont:{_Nonnull}NSString;xScale:NSInteger;yScale:NSInteger;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//- (void)cpclScaleTextVertical:(NSString * _Nonnull)scaledFont
		                       //xScale:(NSInteger)xScale
		                       //yScale:(NSInteger)yScale
		                            //x:(NSInteger)x
		                            //y:(NSInteger)y
		                         //text:(NSString * _Nonnull)text;
		 //- (void)cpclScaleTextVertical:(NSString * _Nonnull)scaledFont                        xScale:(NSInteger)xScale                        yScale:(NSInteger)yScale                             x:(NSInteger)x                             y:(NSInteger)y                          text:(NSString * _Nonnull)text;
		[MethodName('cpclScaleTextVertical:xScale:yScale:x:y:text:')]
		procedure cpclScaleTextVerticalxScaleyScalexytext(scaledFont:{_Nonnull}NSString;xScale:NSInteger;yScale:NSInteger;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//- (void)cpclScaleToFit:(NSString * _Nonnull)scaleFont
		                 //width:(NSInteger)width
		                //height:(NSInteger)height
		                     //x:(NSInteger)x
		                     //y:(NSInteger)y
		                  //text:(NSString * _Nonnull)text;
		 //- (void)cpclScaleToFit:(NSString * _Nonnull)scaleFont                  width:(NSInteger)width                 height:(NSInteger)height                      x:(NSInteger)x                      y:(NSInteger)y                   text:(NSString * _Nonnull)text;
		[MethodName('cpclScaleToFit:width:height:x:y:text:')]
		procedure cpclScaleToFitwidthheightxytext(scaleFont:{_Nonnull}NSString;width:NSInteger;height:NSInteger;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{*
		// ��������Ӵ�
		// Set the font bold
		// 
		// @param boldness bold value, 0 is not bold
		// }
		//- (void)cpclSetBold:(NSInteger)boldness;
		procedure cpclSetBold(boldness:NSInteger);cdecl;
		
		
		//{*
		// �����ּ��
		// Set character spacing
		// 
		// @param spacing �ּ�� character spacing
		// }
		//- (void)cpclSetSpacing:(NSInteger)spacing;
		procedure cpclSetSpacing(spacing:NSInteger);cdecl;
		
		
		//{*
		// ��������Ŵ���
		// Set font magnification multiple
		// 
		// @param width ��ȷŴ�ϵ�� magnification multiple of width
		// @param height �߶ȷŴ�ϵ�� magnification multiple of height
		// }
		//- (void)cpclSetMagWithWidth:(NSInteger)width height:(NSInteger)height;
		[MethodName('cpclSetMagWithWidth:height:')]
		procedure cpclSetMagWithWidthheight(width:NSInteger;height:NSInteger);cdecl;
		
		//- (void)cpclTempMove:(NSInteger)right up:(NSInteger)up;
		[MethodName('cpclTempMove:up:')]
		procedure cpclTempMoveup(right:NSInteger;up:NSInteger);cdecl;
		
		
		//{
		// font   english     chinese
		// 1      9x24        24x24
		// 2      8x24        24x24
		// 3      10x20       20x20
		// 4      16x32       32x32
		// 5      12x24       24x24
		// 7      12x24       24x24
		// 8      12x24       12x24
		// 20     8x18        18x18
		// 28     14x28       28x28
		// 55     8x16        16x16
		// }
		
		//{!
		// *
		// *  ��ӡ�Զ������ı�.
		// *
		// *  @param rotate       ������ת����:0��90��180��270
		// *  @param font         ���壺1��2��3��4��5��7��8��20��28��55
		// *  @param fontSize     �����С
		// *  @param x            ��ʼλ��x
		// *  @param y            ��ʼλ��y
		// *  @param safeHeight   ��ӡ����߶�,�����߶Ȳ��ֲ����ӡ
		// *  @param width        ��ӡ������,���Ϊ0��ʾ���Զ�����
		// *  @param lineSpacing  �м��
		// *  @param fontScale    ����Ŵ���
		// *  @param text         ��ӡ����
		// *  @return             �Զ����к��ʵ�ʴ�ӡ�߶�
		// *
		// }
		//- (NSInteger)cpclAutoTextWithRotate:(NSInteger)rotate
		                               //font:(NSInteger)font
		                           //fontSize:(NSInteger)fontSize
		                                  //x:(NSInteger)x
		                                  //y:(NSInteger)y
		                         //safeHeight:(NSInteger)safeHeight
		                              //width:(NSInteger)width
		                        //lineSpacing:(NSInteger)lineSpacing
		                          //fontScale:(NSInteger)fontScale
		                               //text:(NSString * _Nonnull)text;
		 //- (NSInteger)cpclAutoTextWithRotate:(NSInteger)rotate                                font:(NSInteger)font                            fontSize:(NSInteger)fontSize                                   x:(NSInteger)x                                   y:(NSInteger)y                          safeHeight:(NSInteger)safeHeight                               width:(NSInteger)width                         lineSpacing:(NSInteger)lineSpacing                           fontScale:(NSInteger)fontScale                                text:(NSString * _Nonnull)text;
		[MethodName('cpclAutoTextWithRotate:font:fontSize:x:y:safeHeight:width:lineSpacing:fontScale:text:')]
		function cpclAutoTextWithRotatefontfontSizexysafeHeightwidthlineSpacingfontScaletext(rotate:NSInteger;font:NSInteger;fontSize:NSInteger;x:NSInteger;y:NSInteger;safeHeight:NSInteger;width:NSInteger;lineSpacing:NSInteger;fontScale:NSInteger;text:{_Nonnull}NSString):NSInteger;cdecl;
		
		
		//{!
		// *
		// *  ��ӡ�Զ������ı�,�˽ӿڽ����ת90���ӡ�����ı�,��ת90\270��cpclCenter�ӿ���Ч
		// *
		// *  @param rotate       ������ת����
		// *  @param font         ����
		// *  @param fontSize     �����С
		// *  @param xPos         ��ʼλ��x
		// *  @param yPos         ��ʼλ��y
		// *  @param center       �Ƿ����
		// *  @param safeHeight   ��ӡ����߶�,�����߶Ȳ��ֲ����ӡ
		// *  @param width        ��ӡ������,���Ϊ0��ʾ���Զ�����
		// *  @param lineSpacing  �м��.
		// *  @param fontScale    ����Ŵ���
		// *  @param text         ��ӡ����
		// *  @return             �Զ����к��ʵ�ʴ�ӡ�߶�
		// }
		//- (NSInteger)cpclAutoTextWithRotate:(NSInteger)rotate
		                               //font:(NSInteger)font
		                           //fontSize:(NSInteger)fontSize
		                               //xPos:(NSInteger)xPos
		                               //yPos:(NSInteger)yPos
		                             //center:(BOOL)center
		                         //safeHeight:(NSInteger)safeHeight
		                              //width:(NSInteger)width
		                        //lineSpacing:(NSInteger)lineSpacing
		                          //fontScale:(NSInteger)fontScale
		                               //text:(NSString * _Nonnull)text;
		 //- (NSInteger)cpclAutoTextWithRotate:(NSInteger)rotate                                font:(NSInteger)font                            fontSize:(NSInteger)fontSize                                xPos:(NSInteger)xPos                                yPos:(NSInteger)yPos                              center:(BOOL)center                          safeHeight:(NSInteger)safeHeight                               width:(NSInteger)width                         lineSpacing:(NSInteger)lineSpacing                           fontScale:(NSInteger)fontScale                                text:(NSString * _Nonnull)text;
		[MethodName('cpclAutoTextWithRotate:font:fontSize:xPos:yPos:center:safeHeight:width:lineSpacing:fontScale:text:')]
		function cpclAutoTextWithRotatefontfontSizexPosyPoscentersafeHeightwidthlineSpacingfontScaletext(rotate:NSInteger;font:NSInteger;fontSize:NSInteger;xPos:NSInteger;yPos:NSInteger;center:Boolean;safeHeight:NSInteger;width:NSInteger;lineSpacing:NSInteger;fontScale:NSInteger;text:{_Nonnull}NSString):NSInteger;cdecl;
		
		
		//{*
		// Thai Auto
		// 
		// @param font 0:big font ������ 1:small font С����
		// @param fontSize fontSize
		// @param x x-coordinate of start point
		// @param y y-coordinate of start point
		// @param lineSpace Line spacing for automatic line feed Ĭ��ֵ30
		// @param width Print width Ĭ��0����x+width����ҳ����w�Ļ�,width=w-x
		// @param text text
		// }
		//- (void)cpclAutoThaiTextWithFont:(NSInteger)font
		                        //fontSize:(NSInteger)fontSize
		                               //x:(NSInteger)x
		                               //y:(NSInteger)y
		                       //lineSpace:(NSInteger)lineSpace
		                           //width:(NSInteger)width
		                            //text:(NSString * _Nonnull)text;
		 //- (void)cpclAutoThaiTextWithFont:(NSInteger)font                         fontSize:(NSInteger)fontSize                                x:(NSInteger)x                                y:(NSInteger)y                        lineSpace:(NSInteger)lineSpace                            width:(NSInteger)width                             text:(NSString * _Nonnull)text;
		[MethodName('cpclAutoThaiTextWithFont:fontSize:x:y:lineSpace:width:text:')]
		procedure cpclAutoThaiTextWithFontfontSizexylineSpacewidthtext(font:NSInteger;fontSize:NSInteger;x:NSInteger;y:NSInteger;lineSpace:NSInteger;width:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		
		//{*
		// ��ӡ�����ı�
		// Print center text
		// 
		// @param rotate ��ת�Ƕ� : rotation angle
		// @param font �ֺ� ��ʱ֧�� 1 2 3 4 8 55  :font size, temporarily supports 1 2 3 4 8 55
		// @param fontSize �����С : font size
		// @param x ���x���� : x-coordinate of start point
		// @param y ���y���� : y-coordinate of start point
		// @param width �ı����� : width of textbox
		// @param text �������� : content of text
		// }
		//- (void)cpclCenterTextWithRotate:(NSInteger)rotate
		                            //font:(NSInteger)font
		                        //fontSize:(NSInteger)fontSize
		                               //x:(NSInteger)x
		                               //y:(NSInteger)y
		                           //width:(NSInteger)width
		                            //text:(NSString * _Nonnull)text;
		 //- (void)cpclCenterTextWithRotate:(NSInteger)rotate                             font:(NSInteger)font                         fontSize:(NSInteger)fontSize                                x:(NSInteger)x                                y:(NSInteger)y                            width:(NSInteger)width                             text:(NSString * _Nonnull)text;
		[MethodName('cpclCenterTextWithRotate:font:fontSize:x:y:width:text:')]
		procedure cpclCenterTextWithRotatefontfontSizexywidthtext(rotate:NSInteger;font:NSInteger;fontSize:NSInteger;x:NSInteger;y:NSInteger;width:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{*
		// ��ӡ����
		// Print text
		// 
		// @param rotate ������ת�Ƕ� : rotation angle of text
		// @param font ������ : font number
		// @param fontSize �����С �ݲ����� : font size, cannot be used temporarily
		// @param x ���x���� :  x-coordinate of start point
		// @param y ���y���� : y-coordinate of start point
		// @param text �������� : content of text
		// }
		//- (void)cpclTextWithRotate:(NSInteger)rotate
		                      //font:(NSInteger)font
		                  //fontSize:(NSInteger)fontSize
		                         //x:(NSInteger)x
		                         //y:(NSInteger)y
		                      //text:(NSString * _Nonnull)text;
		 //- (void)cpclTextWithRotate:(NSInteger)rotate                       font:(NSInteger)font                   fontSize:(NSInteger)fontSize                          x:(NSInteger)x                          y:(NSInteger)y                       text:(NSString * _Nonnull)text;
		[MethodName('cpclTextWithRotate:font:fontSize:x:y:text:')]
		procedure cpclTextWithRotatefontfontSizexytext(rotate:NSInteger;font:NSInteger;fontSize:NSInteger;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		
		////����
		//- (void)cpclTextReverseWithFont:(NSInteger)font
		                       //fontSize:(NSInteger)fontSize
		                              //x:(NSInteger)x
		                              //y:(NSInteger)y
		                           //text:(NSString * _Nonnull)text;
		 //- (void)cpclTextReverseWithFont:(NSInteger)font                        fontSize:(NSInteger)fontSize                               x:(NSInteger)x                               y:(NSInteger)y                            text:(NSString * _Nonnull)text;
		[MethodName('cpclTextReverseWithFont:fontSize:x:y:text:')]
		procedure cpclTextReverseWithFontfontSizexytext(font:NSInteger;fontSize:NSInteger;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		//// ���� �Ӵ� Reverse  bold
		//{*
		// | Font | Chinese   | ASCII character (English, number, etc.) |
		// | Font | ����   | ASCII�ַ���Ӣ�ģ����ֵȣ� |
		// | ---- | ----- | --------------- |
		// | 1    | 24*24 | 9*17            |
		// | 2    | 24*24 | 8*16            |
		// | 3    | 20*20 | 10*20           |
		// | 4    | 32*32 | 16*32           |
		// | 8    | 24*24 | 12*24           |
		// | 55   | 16*16 | 8*16            |
		// 
		// rotate: 0 90 180 270
		// 
		// }
		//- (void)appendTextWithFont:(NSInteger)font
		                    //rotate:(NSInteger)rotate
		                  //fontSize:(NSInteger)fontSize
		                   //reverse:(BOOL)reverse
		                      //bold:(NSInteger)bold
		                         //x:(NSInteger)x
		                         //y:(NSInteger)y
		                      //text:(NSString * _Nonnull)text;
		 //- (void)appendTextWithFont:(NSInteger)font                     rotate:(NSInteger)rotate                   fontSize:(NSInteger)fontSize                    reverse:(BOOL)reverse                       bold:(NSInteger)bold                          x:(NSInteger)x                          y:(NSInteger)y                       text:(NSString * _Nonnull)text;
		[MethodName('appendTextWithFont:rotate:fontSize:reverse:bold:x:y:text:')]
		procedure appendTextWithFontrotatefontSizereverseboldxytext(font:NSInteger;rotate:NSInteger;fontSize:NSInteger;reverse:Boolean;bold:NSInteger;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{*
		// Set Background
		// 
		// @param value 0~255,n=0:normal
		// }
		//- (void)cpclSetBackground:(NSInteger)value;
		procedure cpclSetBackground(value:NSInteger);cdecl;
		
		
		//{*
		// set back text
		// 
		// @param font 1,2,3,4,8,55
		// @param rotate 0 90 180 270
		// @param fontSize Size identifier for the font
		// @param xPos x-coordinate of start point
		// @param yPos y-coordinate of start point
		// @param text The text data to be  printed
		// }
		//- (void)cpclBackTextWithFont:(NSInteger)font
		                      //rotate:(NSInteger)rotate
		                    //fontSize:(NSInteger)fontSize
		                        //xPos:(NSInteger)xPos
		                        //yPos:(NSInteger)yPos
		                        //text:(NSString *_Nonnull)text;
		 //- (void)cpclBackTextWithFont:(NSInteger)font                       rotate:(NSInteger)rotate                     fontSize:(NSInteger)fontSize                         xPos:(NSInteger)xPos                         yPos:(NSInteger)yPos                         text:(NSString *_Nonnull)text;
		[MethodName('cpclBackTextWithFont:rotate:fontSize:xPos:yPos:text:')]
		procedure cpclBackTextWithFontrotatefontSizexPosyPostext(font:NSInteger;rotate:NSInteger;fontSize:NSInteger;xPos:NSInteger;yPos:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		///***************** Line Print Commands *******************/
		
		//- (void)cpclLineMargin:(NSInteger)offset;
		procedure cpclLineMargin(offset:NSInteger);cdecl;
		
		//- (void)cpclSetPositionWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;
		[MethodName('cpclSetPositionWithXPos:yPos:')]
		procedure cpclSetPositionWithXPosyPos(xPos:NSInteger;yPos:NSInteger);cdecl;
		
		//- (void)cpclSetPositionWithXPos:(NSInteger)xPos;
		procedure cpclSetPositionWithXPos(xPos:NSInteger);cdecl;
		
		//- (void)cpclSetPositionWithYPos:(NSInteger)yPos;
		procedure cpclSetPositionWithYPos(yPos:NSInteger);cdecl;
		
		
		//{*
		// lineFeed
		// }
		//- (void)cpclLineFeed;
		procedure cpclLineFeed;cdecl;
		
		//- (void)cpclContrast:(NSInteger)value;
		procedure cpclContrast(value:NSInteger);cdecl;
		
		//- (void)cpclFeed:(NSInteger)amount;
		procedure cpclFeed(amount:NSInteger);cdecl;
		
		//- (void)cpclLabel;
		procedure cpclLabel;cdecl;
		
		//- (void)cpclMulti:(NSInteger)quantity;
		procedure cpclMulti(quantity:NSInteger);cdecl;
		
		//- (void)cpclNoPace;
		procedure cpclNoPace;cdecl;
		
		//- (void)cpclPace;
		procedure cpclPace;cdecl;
		
		//- (void)cpclPostFeed:(NSInteger)amount;
		procedure cpclPostFeed(amount:NSInteger);cdecl;
		
		//- (void)cpclPreFeed:(NSInteger)amount;
		procedure cpclPreFeed(amount:NSInteger);cdecl;
		
		//- (void)cpclReverse:(NSInteger)amount;
		procedure cpclReverse(amount:NSInteger);cdecl;
		
		//- (void)cpclSetFeed:(NSInteger)length skip:(NSInteger)skip;
		[MethodName('cpclSetFeed:skip:')]
		procedure cpclSetFeedskip(length:NSInteger;skip:NSInteger);cdecl;
		
		
		//{*
		// set the maximum speed
		// 
		// @param value 0-5
		// }
		//- (void)cpclSpeed:(NSInteger)value;
		procedure cpclSpeed(value:NSInteger);cdecl;
		
		
		////Take the paper to the next label
		//- (void)cpclForm;
		procedure cpclForm;cdecl;
		
		//- (void)cpclTone:(NSInteger)value;
		procedure cpclTone(value:NSInteger);cdecl;
		
		//- (void)cpclTurn:(NSInteger)degrees;
		procedure cpclTurn(degrees:NSInteger);cdecl;
		
		//- (void)cpclFormFeed;
		procedure cpclFormFeed;cdecl;
		
		
		///****************** Utility and Diagnostic Commands ****************/
		//- (void)cpclAbort;
		procedure cpclAbort;cdecl;
		
		//- (void)cpclOnFeed_Feed;
		procedure cpclOnFeed_Feed;cdecl;
		
		//- (void)cpclOnFeed_Reprint;
		procedure cpclOnFeed_Reprint;cdecl;
		
		//- (void)cpclOnFeed_Ignore;
		procedure cpclOnFeed_Ignore;cdecl;
		
		//- (void)cpclReRun;
		procedure cpclReRun;cdecl;
		
		//- (void)cpclWait:(NSInteger)duration;
		procedure cpclWait(duration:NSInteger);cdecl;
		
		//- (void)cpclSetLabelPositionWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;
		[MethodName('cpclSetLabelPositionWithXPos:yPos:')]
		procedure cpclSetLabelPositionWithXPosyPos(xPos:NSInteger;yPos:NSInteger);cdecl;
		
		//- (void)cpclSetLabelPositionWithXPos:(NSInteger)xPos;
		procedure cpclSetLabelPositionWithXPos(xPos:NSInteger);cdecl;
		
		//- (void)cpclSetLabelPositionWithYPos:(NSInteger)yPos;
		procedure cpclSetLabelPositionWithYPos(yPos:NSInteger);cdecl;
		
		
		///****************** Codepage Commands ****************/
		//{*
		// �����ַ�����ҳ
		// SetCharacterCodePage
		// 
		// @param codepage parameter
		// eg:
		// "USA" "FRANCE" "GERMANY" "UK" "DENMARK" "SWEDEN" "ITALY" "SPAIN" "JAPAN-S" "NORWAY" "DENMARK II" "SPAIN II" "LATIN9" "KOREA" "SLOVENIA" "CHINA" "BIG5" "CP874" "CP850" "CP437" "CP860" "CP863" "CP865" "CP866" "CP852" "CP858" "CP857" "CP737" "CP720" "CP775" "CP855" "CP862" "CP864" "ISO8859-6" "ISO8859-8" "ISO8859-9" "ISO8859-15" "WPC1252" "WPC1250" "WPC1251" "WPC1252" "WPC1254" "WPC1255" "WPC1256" "ISO8859-1" "ISO8859-2" "ISO8859-3" "ISO8859-4" "ISO8859-5" "TIS11" "TIS18"
		// }
		//- (void)cpclSetCharacterCodePage:(NSString *_Nonnull)codepage;
		procedure cpclSetCharacterCodePage(codepage:{_Nonnull}NSString);cdecl;
		
		
		//{*
		// �����������,���ú�������ӡ��
		// 
		// @param function 48���رգ� 49������1������������50������2������������51������3����������������
		// }
		//- (void)cpclSetArabicTransformFunction:(NSInteger)function;
		procedure cpclSetArabicTransformFunction(_function:NSInteger);cdecl;
		
		
		//{*
		// ��ѯ�����������״̬��00 00���رգ� 01 00������1�� 02 00������2�� 03 00������3
		// }
		//- (void)cpclGetArabicTransformStatus;
		procedure cpclGetArabicTransformStatus;cdecl;
		
		
		//{*
		// ̩�ı��ο���
		// 
		// @param status 48��close 49:open
		// }
		//- (void)cpclSetThaiTransformStatus:(NSInteger)status;
		procedure cpclSetThaiTransformStatus(status:NSInteger);cdecl;
		
		
		//{*
		// Խ������Σ����ú�������ӡ��
		// 
		// @param function 48���رգ� 49��ASCII���룻 50��UTF-8����
		// }
		//- (void)cpclSetVietnameseTransformFunction:(NSInteger)function;
		procedure cpclSetVietnameseTransformFunction(_function:NSInteger);cdecl;
		
		
		//{*
		// ��ѯԽ�������״̬��00 00���رգ� 01 00��ASCII���룻 02 00��UTF-8���룻
		// }
		//- (void)cpclGetVietnameseTransformStatus;
		procedure cpclGetVietnameseTransformStatus;cdecl;
		
		
		
		///// ������ӡ���̼�
		///// @param data �̼�����
		//- (void)updatePrinterFirmwareWithData:(NSData *_Nonnull)data;
		procedure updatePrinterFirmwareWithData(data:{_Nonnull}NSData);cdecl;
		
		
	end;
	
	PTOldCommandCPCLClass=interface(NSObjectClass)//
	['{E8D3D50A-2A8C-4D67-9D31-77E21570D9D0}']
	end;
	
	TPTOldCommandCPCL=class(TOCGenericImport<PTOldCommandCPCLClass,PTOldCommandCPCL>)
	end;
	
	
	
	
	
	//NS_ASSUME_NONNULL_END
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTOldCommandCPCL_FakeLoader : PTOldCommandCPCL; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTOldCommandCPCL';
{$O+}



{$ENDIF}

end.

