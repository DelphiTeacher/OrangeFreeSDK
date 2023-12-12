//{!
// *  \~chinese
// *  @header PTCommandCPCL.h
// *  @abstract CPCLָ��
// *
// *  \~english
// *  @header PTCommandCPCL.h
// *  @abstract CPCL Command
// }

unit iOSApi.PTCommandCPCL;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
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

	
	//{!
	// *  \~chinese
	// *  ֽ������1
	// *
	// *  \~english
	// *  Paper type
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLPaperType) {
	    //PTCPCLPaperContinuoue          = 0,  ///< continuous paper
	    //PTCPCLPaperLabel               = 1,  ///< label paper
	    //PTCPCLPaperBackBlackMark       = 2,  ///< back black mark
	    //PTCPCLPaperFrontBlackMark      = 3,  ///< front black mark
	    //PTCPCLPaperBlackMarkInch3      = 4,  ///< 3 inch black mark
	    //PTCPCLPaperBlackMarkInch2      = 5   ///< 2 inch black mark
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLPaperType) {
	PTCPCLPaperType_=(
	//(NSUInteger, PTCPCLPaperType) {
	    PTCPCLPaperContinuoue          = 0,  ///< continuous paper
	    PTCPCLPaperLabel               = 1,  ///< label paper
	    PTCPCLPaperBackBlackMark       = 2,  ///< back black mark
	    PTCPCLPaperFrontBlackMark      = 3,  ///< front black mark
	    PTCPCLPaperBlackMarkInch3      = 4,  ///< 3 inch black mark
	    PTCPCLPaperBlackMarkInch2      = 5   ///< 2 inch black mark
	);
	PTCPCLPaperType=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ֽ������2
	// *
	// *  \~english
	// *  Paper type
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLNewPaperType) {
	    //PTCPCLNewPaperContinuoue          = 0,  ///< continuous paper
	    //PTCPCLNewPaperLabel               = 2,  ///< label paper
	    //PTCPCLNewBlackMarkInch2           = 4,  ///< 2 inch black mark
	    //PTCPCLNewBlackMarkInch3           = 5,  ///< 3 inch black mark
	    //PTCPCLNewBlackMarkInch4           = 6   ///< 4 inch black mark
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLNewPaperType) {
	PTCPCLNewPaperType_=(
	//(NSUInteger, PTCPCLNewPaperType) {
	    PTCPCLNewPaperContinuoue          = 0,  ///< continuous paper
	    PTCPCLNewPaperLabel               = 2,  ///< label paper
	    PTCPCLNewBlackMarkInch2           = 4,  ///< 2 inch black mark
	    PTCPCLNewBlackMarkInch3           = 5,  ///< 3 inch black mark
	    PTCPCLNewBlackMarkInch4           = 6   ///< 4 inch black mark
	);
	PTCPCLNewPaperType=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ǩ�ֱ���
	// *
	// *  \~english
	// *  Label resolution
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLLabelResolution) {
	    //PTCPCLLabelResolution100   = 100,  ///< 100
	    //PTCPCLLabelResolution200   = 200   ///< 200
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLLabelResolution) {
	PTCPCLLabelResolution_=(
	//(NSUInteger, PTCPCLLabelResolution) {
	    PTCPCLLabelResolution100   = 100,  ///< 100
	    PTCPCLLabelResolution200   = 200   ///< 200
	);
	PTCPCLLabelResolution=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��������
	// *
	// *  \~english
	// *  Barcode style
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLBarcodeStyle) {
	    //PTCPCLBarcodeStyleUPCA      = 0,
	    //PTCPCLBarcodeStyleUPCE      = 1,
	    //PTCPCLBarcodeStyleEAN13     = 2,
	    //PTCPCLBarcodeStyleEAN8      = 3,
	    //PTCPCLBarcodeStyleCode39    = 4,
	    //PTCPCLBarcodeStyleCode93    = 5,
	    //PTCPCLBarcodeStyleCode128   = 6,
	    //PTCPCLBarcodeStyleCodeBAR   = 7
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLBarcodeStyle) {
	PTCPCLBarcodeStyle_=(
	//(NSUInteger, PTCPCLBarcodeStyle) {
	    PTCPCLBarcodeStyleUPCA      = 0,
	    PTCPCLBarcodeStyleUPCE      = 1,
	    PTCPCLBarcodeStyleEAN13     = 2,
	    PTCPCLBarcodeStyleEAN8      = 3,
	    PTCPCLBarcodeStyleCode39    = 4,
	    PTCPCLBarcodeStyleCode93    = 5,
	    PTCPCLBarcodeStyleCode128   = 6,
	    PTCPCLBarcodeStyleCodeBAR   = 7
	);
	PTCPCLBarcodeStyle=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  �����խ������
	// *
	// *  \~english
	// *  The ratio of wide to narrow bars
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLBarcodeBarRatio) {
	    //PTCPCLBarcodeBarRatio0     = 0,
	    //PTCPCLBarcodeBarRatio1     = 1,
	    //PTCPCLBarcodeBarRatio2     = 2,
	    //PTCPCLBarcodeBarRatio3     = 3,
	    //PTCPCLBarcodeBarRatio4     = 4,
	    //PTCPCLBarcodeBarRatio20    = 20,
	    //PTCPCLBarcodeBarRatio21    = 21,
	    //PTCPCLBarcodeBarRatio22    = 22,
	    //PTCPCLBarcodeBarRatio23    = 23,
	    //PTCPCLBarcodeBarRatio24    = 24,
	    //PTCPCLBarcodeBarRatio25    = 25,
	    //PTCPCLBarcodeBarRatio26    = 26,
	    //PTCPCLBarcodeBarRatio27    = 27,
	    //PTCPCLBarcodeBarRatio28    = 28,
	    //PTCPCLBarcodeBarRatio29    = 29,
	    //PTCPCLBarcodeBarRatio30    = 30
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLBarcodeBarRatio) {
	PTCPCLBarcodeBarRatio_=(
	//(NSUInteger, PTCPCLBarcodeBarRatio) {
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
	);
	PTCPCLBarcodeBarRatio=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  �淶���
	// *
	// *  \~english
	// *  QRCode model number
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLQRCodeModel) {
	    //PTCPCLQRCodeModel1      = 1,
	    //PTCPCLQRCodeModel2      = 2   ///< default
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLQRCodeModel) {
	PTCPCLQRCodeModel_=(
	//(NSUInteger, PTCPCLQRCodeModel) {
	    PTCPCLQRCodeModel1      = 1,
	    PTCPCLQRCodeModel2      = 2   ///< default
	);
	PTCPCLQRCodeModel=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ά�뵥Ԫ���
	// *
	// *  \~english
	// *  Unit-width of the barcode in dots. 1-32,default: 6
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLQRCodeUnitWidth) {
	    //PTCPCLQRCodeUnitWidth_1 = 1,
	    //PTCPCLQRCodeUnitWidth_2,
	    //PTCPCLQRCodeUnitWidth_3,
	    //PTCPCLQRCodeUnitWidth_4,
	    //PTCPCLQRCodeUnitWidth_5,
	    //PTCPCLQRCodeUnitWidth_6,        ///< default
	    //PTCPCLQRCodeUnitWidth_7,
	    //PTCPCLQRCodeUnitWidth_8,
	    //PTCPCLQRCodeUnitWidth_9,
	    //PTCPCLQRCodeUnitWidth_10,
	    //PTCPCLQRCodeUnitWidth_11,
	    //PTCPCLQRCodeUnitWidth_12,
	    //PTCPCLQRCodeUnitWidth_13,
	    //PTCPCLQRCodeUnitWidth_14,
	    //PTCPCLQRCodeUnitWidth_15,
	    //PTCPCLQRCodeUnitWidth_16,
	    //PTCPCLQRCodeUnitWidth_17,
	    //PTCPCLQRCodeUnitWidth_18,
	    //PTCPCLQRCodeUnitWidth_19,
	    //PTCPCLQRCodeUnitWidth_20,
	    //PTCPCLQRCodeUnitWidth_21,
	    //PTCPCLQRCodeUnitWidth_22,
	    //PTCPCLQRCodeUnitWidth_23,
	    //PTCPCLQRCodeUnitWidth_24,
	    //PTCPCLQRCodeUnitWidth_25,
	    //PTCPCLQRCodeUnitWidth_26,
	    //PTCPCLQRCodeUnitWidth_27,
	    //PTCPCLQRCodeUnitWidth_28,
	    //PTCPCLQRCodeUnitWidth_29,
	    //PTCPCLQRCodeUnitWidth_30,
	    //PTCPCLQRCodeUnitWidth_31,
	    //PTCPCLQRCodeUnitWidth_32
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLQRCodeUnitWidth) {
	PTCPCLQRCodeUnitWidth_=(
	//(NSUInteger, PTCPCLQRCodeUnitWidth) {
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
	);
	PTCPCLQRCodeUnitWidth=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ά�����ˮƽ
	// *
	// *  \~english
	// *  QRCode Error Correction Level
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLQRCodeCorrectionLevel) {
	    //PTCPCLQRCodeCorrectionLevelH      = 0,  ///< Ultra high reliability level
	    //PTCPCLQRCodeCorrectionLevelQ      = 1,  ///< High reliability level
	    //PTCPCLQRCodeCorrectionLevelM      = 2,  ///< Standard level
	    //PTCPCLQRCodeCorrectionLevelL      = 3 ///< High density level
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLQRCodeCorrectionLevel) {
	PTCPCLQRCodeCorrectionLevel_=(
	//(NSUInteger, PTCPCLQRCodeCorrectionLevel) {
	    PTCPCLQRCodeCorrectionLevelH      = 0,  ///< Ultra high reliability level
	    PTCPCLQRCodeCorrectionLevelQ      = 1,  ///< High reliability level
	    PTCPCLQRCodeCorrectionLevelM      = 2,  ///< Standard level
	    PTCPCLQRCodeCorrectionLevelL      = 3 ///< High density level
	);
	PTCPCLQRCodeCorrectionLevel=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ά���ַ�����
	// *
	// *  \~english
	// *  QRCode Character mode symbols
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLQRCodeDataInputMode) {
	    //PTCPCLQRCodeDataInputModeA      = 0,  ///< Automatic(default)
	    //PTCPCLQRCodeDataInputModeM      = 1  ///< manual(ignore it,pls select ModeA)
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLQRCodeDataInputMode) {
	PTCPCLQRCodeDataInputMode_=(
	//(NSUInteger, PTCPCLQRCodeDataInputMode) {
	    PTCPCLQRCodeDataInputModeA      = 0,  ///< Automatic(default)
	    PTCPCLQRCodeDataInputModeM      = 1  ///< manual(ignore it,pls select ModeA)
	);
	PTCPCLQRCodeDataInputMode=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  �ı���������
	// *
	// *  \~english
	// *  Text Font Name
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLTextFontName) {
	    //PTCPCLTextFont0       = 0,  ///< khmer:12x24
	    //PTCPCLTextFont1       = 1,  ///< chinese:24x24   english:9x17
	    //PTCPCLTextFont2       = 2,  ///< chinese:24x24   english:12x24
	    //PTCPCLTextFont3       = 3,  ///< chinese:20x20   english:10x20
	    //PTCPCLTextFont4       = 4,  ///< chinese:32x32   english:16x32
	    //PTCPCLTextFont5       = 5,  ///< chinese:24x24   english:12x24
	    //PTCPCLTextFont7       = 7,  ///< chinese:24x24   english:12x24
	    //PTCPCLTextFont8       = 8,  ///< chinese:24x24   english:12x24
	    //PTCPCLTextFont20      = 20, ///< chinese:16x16   english:8x16
	    //PTCPCLTextFont28      = 28, ///< chinese:28x28   english:14x28
	    //PTCPCLTextFont55      = 55  ///< chinese:16x16   english:8x16
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLTextFontName) {
	PTCPCLTextFontName_=(
	//(NSUInteger, PTCPCLTextFontName) {
	    PTCPCLTextFont0       = 0,  ///< khmer:12x24
	    PTCPCLTextFont1       = 1,  ///< chinese:24x24   english:9x17
	    PTCPCLTextFont2       = 2,  ///< chinese:24x24   english:12x24
	    PTCPCLTextFont3       = 3,  ///< chinese:2$20   english:1$20
	    PTCPCLTextFont4       = 4,  ///< chinese:32x32   english:16x32
	    PTCPCLTextFont5       = 5,  ///< chinese:24x24   english:12x24
	    PTCPCLTextFont7       = 7,  ///< chinese:24x24   english:12x24
	    PTCPCLTextFont8       = 8,  ///< chinese:24x24   english:12x24
	    PTCPCLTextFont20      = 20, ///< chinese:16x16   english:8x16
	    PTCPCLTextFont28      = 28, ///< chinese:28x28   english:14x28
	    PTCPCLTextFont55      = 55  ///< chinese:16x16   english:8x16
	);
	PTCPCLTextFontName=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ����Ŵ���
	// *
	// *  \~english
	// *  Font scale
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLTextFontSize) {
	    //PTCPCLTextFontSize0       = 0,  ///< scale-> width:1   height:1, default
	    //PTCPCLTextFontSize1       = 1,  ///< scale-> width:1   height:2
	    //PTCPCLTextFontSize2       = 2,  ///< scale-> width:2   height:1
	    //PTCPCLTextFontSize3       = 3,  ///< scale-> width:2   height:2
	    //PTCPCLTextFontSize4       = 4,  ///< scale-> width:2   height:3
	    //PTCPCLTextFontSize5       = 5,  ///< scale-> width:3   height:2
	    //PTCPCLTextFontSize6       = 6,  ///< scale-> width:3   height:3
	    //PTCPCLTextFontSize7       = 7,  ///< scale-> width:3   height:4
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLTextFontSize) {
	PTCPCLTextFontSize_=(
	//(NSUInteger, PTCPCLTextFontSize) {
	    PTCPCLTextFontSize0       = 0,  ///< scale-> width:1   height:1, default
	    PTCPCLTextFontSize1       = 1,  ///< scale-> width:1   height:2
	    PTCPCLTextFontSize2       = 2,  ///< scale-> width:2   height:1
	    PTCPCLTextFontSize3       = 3,  ///< scale-> width:2   height:2
	    PTCPCLTextFontSize4       = 4,  ///< scale-> width:2   height:3
	    PTCPCLTextFontSize5       = 5,  ///< scale-> width:3   height:2
	    PTCPCLTextFontSize6       = 6,  ///< scale-> width:3   height:3
	    PTCPCLTextFontSize7       = 7//,  ///< scale-> width:3   height:4
	);
	PTCPCLTextFontSize=Integer;
	
	
	
	
	
	///// Scaled Font Name
	//typedef NS_ENUM(NSUInteger, PTCPCLScaledFontName) {
	    //PTCPCLScaledFontNameTTF     = 0,    ///< default
	    //PTCPCLScaledFontNameCSF     = 1,
	    //PTCPCLScaledFontNameFNT     = 2
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLScaledFontName) {
	PTCPCLScaledFontName_=(
	//(NSUInteger, PTCPCLScaledFontName) {
	    PTCPCLScaledFontNameTTF     = 0,    ///< default
	    PTCPCLScaledFontNameCSF     = 1,
	    PTCPCLScaledFontNameFNT     = 2
	);
	PTCPCLScaledFontName=Integer;
	
	
	
	
	
	///// Font Group number
	//typedef NS_ENUM(NSUInteger, PTCPCLFontGroupNumber) {
	    //PTCPCLFontGroupNumber0          = 0,
	    //PTCPCLFontGroupNumber1          = 1,
	    //PTCPCLFontGroupNumber2          = 2,
	    //PTCPCLFontGroupNumber3          = 3,
	    //PTCPCLFontGroupNumber4          = 4,
	    //PTCPCLFontGroupNumber5          = 5,
	    //PTCPCLFontGroupNumber6          = 6,
	    //PTCPCLFontGroupNumber7          = 7,
	    //PTCPCLFontGroupNumber8          = 8,
	    //PTCPCLFontGroupNumber9          = 9,
	    //PTCPCLFontGroupNumber10         = 10
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLFontGroupNumber) {
	PTCPCLFontGroupNumber_=(
	//(NSUInteger, PTCPCLFontGroupNumber) {
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
	);
	PTCPCLFontGroupNumber=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ����Ӵ�
	// *
	// *  \~english
	// *  Text bold
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLTextBold) {
	    //PTCPCLTextBold0    = 0, ///< default,not bold
	    //PTCPCLTextBold1    = 1,
	    //PTCPCLTextBold2    = 2,
	    //PTCPCLTextBold3    = 3,
	    //PTCPCLTextBold4    = 4,
	    //PTCPCLTextBold5    = 5
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLTextBold) {
	PTCPCLTextBold_=(
	//(NSUInteger, PTCPCLTextBold) {
	    PTCPCLTextBold0    = 0, ///< default,not bold
	    PTCPCLTextBold1    = 1,
	    PTCPCLTextBold2    = 2,
	    PTCPCLTextBold3    = 3,
	    PTCPCLTextBold4    = 4,
	    PTCPCLTextBold5    = 5
	);
	PTCPCLTextBold=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ת�Ƕ�
	// *
	// *  \~english
	// *  Rotation:Counterclockwise rotation
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLStyleRotation) {
	    //PTCPCLStyleRotation0    = 0,    ///< Counterclockwise rotation,default
	    //PTCPCLStyleRotation90   = 90,   ///< Counterclockwise rotation 90
	    //PTCPCLStyleRotation180  = 180,  ///< Counterclockwise rotation 180
	    //PTCPCLStyleRotation270  = 270   ///< Counterclockwise rotation 270
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLStyleRotation) {
	PTCPCLStyleRotation_=(
	//(NSUInteger, PTCPCLStyleRotation) {
	    PTCPCLStyleRotation0    = 0,    ///< Counterclockwise rotation,default
	    PTCPCLStyleRotation90   = 90,   ///< Counterclockwise rotation 90
	    PTCPCLStyleRotation180  = 180,  ///< Counterclockwise rotation 180
	    PTCPCLStyleRotation270  = 270   ///< Counterclockwise rotation 270
	);
	PTCPCLStyleRotation=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ����Ŵ�ϵ��
	// *
	// *  \~english
	// *  Font scale
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLFontScale) {
	    //PTCPCLFontScale_1  = 1,
	    //PTCPCLFontScale_2,
	    //PTCPCLFontScale_3,
	    //PTCPCLFontScale_4,
	    //PTCPCLFontScale_5,
	    //PTCPCLFontScale_6,
	    //PTCPCLFontScale_7,
	    //PTCPCLFontScale_8,
	    //PTCPCLFontScale_9,
	    //PTCPCLFontScale_10,
	    //PTCPCLFontScale_11,
	    //PTCPCLFontScale_12,
	    //PTCPCLFontScale_13,
	    //PTCPCLFontScale_14,
	    //PTCPCLFontScale_15,
	    //PTCPCLFontScale_16
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLFontScale) {
	PTCPCLFontScale_=(
	//(NSUInteger, PTCPCLFontScale) {
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
	);
	PTCPCLFontScale=Integer;
	
	
	
	
	
	///// auto feed ling Font
	//typedef NS_ENUM(NSUInteger, PTCPCLTextLineFontStyle) {
	    //PTCPCLTextLineFontStyle0    = 0,    ///< big font
	    //PTCPCLTextLineFontStyle1    = 1    ///< small font
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLTextLineFontStyle) {
	PTCPCLTextLineFontStyle_=(
	//(NSUInteger, PTCPCLTextLineFontStyle) {
	    PTCPCLTextLineFontStyle0    = 0,    ///< big font
	    PTCPCLTextLineFontStyle1    = 1    ///< small font
	);
	PTCPCLTextLineFontStyle=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  PDF417��ľ���ȼ�
	// *
	// *  \~english
	// *  The error recovery level.
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLPDF417ErrLevel) {
	    //PTCPCLPDF417ErrLevel_0  = 0,
	    //PTCPCLPDF417ErrLevel_1  = 1,   //default
	    //PTCPCLPDF417ErrLevel_2,
	    //PTCPCLPDF417ErrLevel_3,
	    //PTCPCLPDF417ErrLevel_4,
	    //PTCPCLPDF417ErrLevel_5,
	    //PTCPCLPDF417ErrLevel_6,
	    //PTCPCLPDF417ErrLevel_7,
	    //PTCPCLPDF417ErrLevel_8
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLPDF417ErrLevel) {
	PTCPCLPDF417ErrLevel_=(
	//(NSUInteger, PTCPCLPDF417ErrLevel) {
	    PTCPCLPDF417ErrLevel_0  = 0,
	    PTCPCLPDF417ErrLevel_1  = 1,   //default
	    PTCPCLPDF417ErrLevel_2,
	    PTCPCLPDF417ErrLevel_3,
	    PTCPCLPDF417ErrLevel_4,
	    PTCPCLPDF417ErrLevel_5,
	    PTCPCLPDF417ErrLevel_6,
	    PTCPCLPDF417ErrLevel_7,
	    PTCPCLPDF417ErrLevel_8
	);
	PTCPCLPDF417ErrLevel=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  PDF417����ˮƽ���Ǵ�ֱ
	// *
	// *  \~english
	// *  The PDF417 code horizontal or vertical.
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLPDF417Direction) {
	    //PTCPCLPDF417DirectionH    = 0,    ///< horizontal
	    //PTCPCLPDF417DirectionV    = 1    ///< vertical
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLPDF417Direction) {
	PTCPCLPDF417Direction_=(
	//(NSUInteger, PTCPCLPDF417Direction) {
	    PTCPCLPDF417DirectionH    = 0,    ///< horizontal
	    PTCPCLPDF417DirectionV    = 1    ///< vertical
	);
	PTCPCLPDF417Direction=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  PDF417����ѹ�����Զ����Ƕ�����
	// *
	// *  \~english
	// *  The compaction of data in the barcode is automatic, or explicitly set to binary.
	// }
	//typedef NS_ENUM(NSUInteger, PTCPCLPDF417Binary) {
	    //PTCPCLPDF417BinaryA    = 0,    ///< automatic
	    //PTCPCLPDF417BinaryF    = 1    ///< forced
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLPDF417Binary) {
	PTCPCLPDF417Binary_=(
	//(NSUInteger, PTCPCLPDF417Binary) {
	    PTCPCLPDF417BinaryA    = 0,    ///< automatic
	    PTCPCLPDF417BinaryF    = 1    ///< forced
	);
	PTCPCLPDF417Binary=Integer;
	
	
	
	
	
	//typedef NS_ENUM(NSUInteger, PTCPCLRFIDMemory) {
	    ///*! \~chinese Ԥ����,ͨ��������8�ֽ�(beginAddr[��ʼ��ַ] * 2 + bytes[�ֽ���] <= 8����ͬ) \~english Reserved��Usually no more than 8 bytes(BeginAddr * 2 + Bytes < 8, same below) */
	    //PTCPCLRFIDMemoryReserved    = 0,
	    ///*! \~chinese EPC����ͨ��������16�ֽ�(��ʼ��ַ��2��ʼ) \~english EPC��Usually no more than 16 bytes(The starting address starts at 2) */
	    //PTCPCLRFIDMemoryEPC         = 1,
	    ///*! \~chinese TID����ͨ��������128�ֽڣ�����д���� \~english TID��Usually no more than 128 bytes��Unwritable data */
	    //PTCPCLRFIDMemoryTID         = 2,
	    ///*! \~chinese User����ͨ��������128�ֽ� \~english User��Usually no more than 128 bytes */
	    //PTCPCLRFIDMemoryUser        = 3
	//};
	//typedef NS_ENUM(NSUInteger, PTCPCLRFIDMemory) {
	PTCPCLRFIDMemory_=(
	//(NSUInteger, PTCPCLRFIDMemory) {
	//    /*! \~chinese Ԥ����,ͨ��������8�ֽ�(beginAddr[��ʼ��ַ] * 2 + bytes[�ֽ���] <= 8����ͬ) \~english Reserved��Usually no more than 8 bytes(BeginAddr * 2 + Bytes < 8, same below) */
	    PTCPCLRFIDMemoryReserved    = 0,
	//    /*! \~chinese EPC����ͨ��������16�ֽ�(��ʼ��ַ��2��ʼ) \~english EPC��Usually no more than 16 bytes(The starting address starts at 2) */
	    PTCPCLRFIDMemoryEPC         = 1,
	//    /*! \~chinese TID����ͨ��������128�ֽڣ�����д���� \~english TID��Usually no more than 128 bytes��Unwritable data */
	    PTCPCLRFIDMemoryTID         = 2,
	//    /*! \~chinese User����ͨ��������128�ֽ� \~english User��Usually no more than 128 bytes */
	    PTCPCLRFIDMemoryUser        = 3
	);
	PTCPCLRFIDMemory=Integer;
	
	
	
	
	
	//@interface PTCommandCPCL : NSObject
	//@interface PTCommandCPCL : NSObject
	PTCommandCPCL=interface(NSObject)//
	['{2709C1EE-2E4B-47B7-B3EC-A4E45365C93F}']
		
		//{!
		// *  \~chinese
		// *
		// *  �·�����ӡ��������.
		// *
		// *  \~english
		// *
		// *  Data sent to the printer.
		// *
		// }
		//@property (nonatomic, strong) NSMutableData * _Nonnull cmdData;
		function cmdData:NSMutableData;cdecl;
		procedure setcmdData(cmdData:NSMutableData);cdecl;
		
		//{!
		// *  \~chinese
		// *
		// *  �Ƿ�����ͨ����ϵ��ã�Ĭ����NO���ò���ֻ�����ͨ��ݵĹ̼�
		// *
		// *  \~english
		// *
		// *  Whether ZTO invoke,default is NO��This parameter only applies to the firmware of ZTO
		// *
		// }
		//@property (nonatomic, assign) BOOL isZTO;
		function isZTO:Boolean;cdecl;
		procedure setIsZTO(isZTO:Boolean);cdecl;
		
		//{!
		// *  \~chinese
		// *
		// *  ָ��ʹ�õı��룬Ĭ����GBK.
		// *
		// *  \~english
		// *
		// *  encode��default is GBK.
		// *
		// }
		//@property (nonatomic, assign) NSStringEncoding encoding;
		function encoding:NSStringEncoding;cdecl;
		procedure setEncoding(encoding:NSStringEncoding);cdecl;
		
		//{!
		// *  \~chinese
		// *
		// *  ���ָ��.
		// *  
		// *  @brief ���ָ��.
		// *  @param cmd ָ���ı�.ʹ��encoding���Խ��б���.
		// *
		// *  \~english
		// *
		// *  append command.
		// *
		// *  @brief append command.
		// *  @param cmd command text. encode with encoding property.
		// *
		// }
		//- (void)appendCommand:(NSString * _Nonnull)cmd;
		procedure appendCommand(cmd:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ָ��.
		// *
		// *  @brief ���ָ��.
		// *  @param cmd ָ������.
		// *
		// *  \~english
		// *
		// *  append command.
		// *
		// *  @brief append command.
		// *  @param cmd command data.
		// *
		// }
		//- (void)appendCommandData:(NSData * _Nonnull)data;
		procedure appendCommandData(data:{_Nonnull}NSData);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ�Լ�ҳ.
		// *
		// *  @brief ��ӡ�Լ�ҳ.
		// *
		// *  \~english
		// *
		// *  selfTest.
		// *
		// *  @brief selfTest.
		// *
		// }
		//- (void)printSelfInspectionPage;
		procedure printSelfInspectionPage;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ȡ��ӡ��״̬����receiveDataBlock�Ļص���16�������ݽ��н���.
		// *
		// *  @brief ��ȡ��ӡ��״̬
		// *
		// | λ(����ֵ)  |    1        |     0     |
		// | --------- | ----------- |-----------|
		// |     0     |    æµ      |  ׼������  |
		// |     1     |    ȱֽ      |   ֽ����   |
		// |     2     |    ����      |   �ϸ�     |
		// |     3     |    �͵���    |  ��������   |
		//
		// *
		// *  \~english
		// *
		// *  Get print status��ReceiveDataBlock callback hexadecimal data parsing.
		// *
		// *  @brief Get Print Status
		// *
		// | Bit(return value) |          1          |      0                 |
		// | ----------------- | ------------------- |---------------------   |
		// |        0          | Printer is Busy     | Printer is Ready       |
		// |        1          | Paper is Out        | Paper is OK            |
		// |        2          | Head Latch is Open  | Head Latch is Closed   |
		// |        3          | Battery is Low      | Battery is OK          |
		// *
		// }
		//- (void)cpclGetPaperStatus;
		procedure cpclGetPaperStatus;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ȡ�̼��汾��
		// *
		// *  @brief ��ȡ�̼��汾��
		// *
		// *  \~english
		// *
		// *  firmware version.
		// *
		// *  @brief firmware version.
		// *
		// }
		//- (void)getFirmwareVersion;
		procedure getFirmwareVersion;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ش�ӡ״̬�ص�����ͨ������printStateBlock�ӿں�õ���ӡ����ɵ�״̬.
		// *
		// *  @brief ���ش�ӡ״̬�ص�.
		// *
		// *  \~english
		// *
		// *  Turn on/off print status callback��the state of printer completion can be obtained by calling the printStateBlock interface.
		// *
		// *  @brief Turn on/off print status callback.
		// *
		// }
		//- (void)cpclTurnOnPrintStatusCallBack:(BOOL)flag;
		procedure cpclTurnOnPrintStatusCallBack(flag:Boolean);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���»���.
		// *
		// *  @brief ���»���.
		// *
		// *  \~english
		// *
		// *  Turn on underline.
		// *
		// *  @brief Turn on underline.
		// *
		// }
		//- (void)cpclUnderlineON;
		procedure cpclUnderlineON;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �ر��»���.
		// *
		// *  @brief �ر��»���.
		// *
		// *  \~english
		// *
		// *  Turn off underline.
		// *
		// *  @brief Turn off underline.
		// *
		// }
		//- (void)cpclUnderlineOFF;
		procedure cpclUnderlineOFF;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ʼ��ǩ�Ự.
		// *
		// *  @brief ��ʼ��ǩ�Ự.
		// *  @param offset   ��ǩ�ĺ���ƫ����.
		// *  @param hRes     ��ǩ����ֱ���(��/Ӣ��). 100 �� 200
		// *  @param vRes     ��ǩ����ֱ���(��/Ӣ��). 100 �� 200
		// *  @param height   ��ǩ���. 0-65535
		// *  @param quantity ��ǩ��ӡ����. 0-1024
		// *
		// *  \~english
		// *
		// *  start label session.
		// *
		// *  @brief start label session.
		// *  @param offset   The number of units to offset all fields from the left side of the label horizontally. 0-65535
		// *  @param hRes     The horizontal resolution of this label, expressed in dots per inch. 100 or 200
		// *  @param vRes     The vertical resolution of this label, expressed in dots per inch. 100 or 200
		// *  @param height   The height of the label in units. 0-65535
		// *  @param quantity The number of copies of the label to print.  0-1024
		// *
		// }
		//- (void)cpclLabelWithOffset:(NSInteger)offset
		                       //hRes:(PTCPCLLabelResolution)hRes
		                       //vRes:(PTCPCLLabelResolution)vRes
		                     //height:(NSInteger)height
		                   //quantity:(NSInteger)quantity;
		 //- (void)cpclLabelWithOffset:(NSInteger)offset                        hRes:(PTCPCLLabelResolution)hRes                        vRes:(PTCPCLLabelResolution)vRes                      height:(NSInteger)height                    quantity:(NSInteger)quantity;
		[MethodName('cpclLabelWithOffset:hRes:vRes:height:quantity:')]
		procedure cpclLabelWithOffsethResvResheightquantity(offset:NSInteger;hRes:PTCPCLLabelResolution;vRes:PTCPCLLabelResolution;height:NSInteger;quantity:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ָ����ǩ���,������Ҫ��ӡ�Ŀ��.
		// *
		// *  @brief ָ����ǩ���.
		// *  @param pageWidth ��ǩ���(��)
		// *
		// *  \~english
		// *
		// *  used to specify the width a label session��Set the width you want to print.
		// *
		// *  @brief used to specify the width a label session.
		// *  @param pageWidth width of a label session in dots.
		// *
		// }
		//- (void)cpclPageWidth:(NSInteger)pageWidth;
		procedure cpclPageWidth(pageWidth:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���������ӡ.
		// *
		// *  @brief ���������ӡ.
		// *  @param type     ��������. UPCA/UPCE/EAN13/EAN8/39/93/128/CODABAR
		// *  @param width    խ�����.
		// *  @param ratio    ��խ������. 0-4��20-30
		// *  @param height   ����߶�.
		// *  @param x        ������ʼλ��.
		// *  @param y        ������ʼλ��.
		// *  @param barcode  ��������.
		// *
		// *  \~english
		// *
		// *  horizonal barcode.
		// *
		// *  @brief horizonal barcode.
		// *  @param type     The type of barcode to print. UPCA/UPCE/EAN13/EAN8/39/93/128/CODABAR
		// *  @param width    The width of a narrow bar.
		// *  @param ratio    The ratio of wide to narrow bars. 0-4��20-30
		// *  @param height   The height of the barcode.
		// *  @param x        The X position where the barcode begins
		// *  @param y        The Y position where the barcode begins
		// *  @param barcode  The data to be encoded into a barcode
		// *
		// }
		//- (void)cpclBarcode:(PTCPCLBarcodeStyle)type
		              //width:(NSInteger)width
		              //ratio:(PTCPCLBarcodeBarRatio)ratio
		             //height:(NSInteger)height
		                  //x:(NSInteger)x
		                  //y:(NSInteger)y
		            //barcode:(NSString * _Nonnull)barcode;
		 //- (void)cpclBarcode:(PTCPCLBarcodeStyle)type               width:(NSInteger)width               ratio:(PTCPCLBarcodeBarRatio)ratio              height:(NSInteger)height                   x:(NSInteger)x                   y:(NSInteger)y             barcode:(NSString * _Nonnull)barcode;
		[MethodName('cpclBarcode:width:ratio:height:x:y:barcode:')]
		procedure cpclBarcodewidthratioheightxybarcode(_type:PTCPCLBarcodeStyle;width:NSInteger;ratio:PTCPCLBarcodeBarRatio;height:NSInteger;x:NSInteger;y:NSInteger;barcode:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���������ӡ.
		// *
		// *  @brief ���������ӡ.
		// *  @param type     ��������.
		// *  @param width    խ�����.
		// *  @param ratio    ��խ������. 0-4��20-30
		// *  @param height   ����߶�.
		// *  @param x        ������ʼλ��.
		// *  @param y        ������ʼλ��.
		// *  @param barcode  ��������.
		// *
		// *  \~english
		// *
		// *  vertical barcode.
		// *
		// *  @brief vertical barcode.
		// *  @param type     The type of barcode to print.
		// *  @param width    The width of a narrow bar.
		// *  @param ratio    The ratio of wide to narrow bars. 0-4��20-30
		// *  @param height   The height of the barcode.
		// *  @param x        The X position where the barcode begins
		// *  @param y        The Y position where the barcode begins
		// *  @param barcode  The data to be encoded into a barcode
		// *
		// }
		//- (void)cpclBarcodeVertical:(PTCPCLBarcodeStyle)type
		                      //width:(NSInteger)width
		                      //ratio:(PTCPCLBarcodeBarRatio)ratio
		                     //height:(NSInteger)height
		                          //x:(NSInteger)x
		                          //y:(NSInteger)y
		                    //barcode:(NSString * _Nonnull)barcode;
		 //- (void)cpclBarcodeVertical:(PTCPCLBarcodeStyle)type                       width:(NSInteger)width                       ratio:(PTCPCLBarcodeBarRatio)ratio                      height:(NSInteger)height                           x:(NSInteger)x                           y:(NSInteger)y                     barcode:(NSString * _Nonnull)barcode;
		[MethodName('cpclBarcodeVertical:width:ratio:height:x:y:barcode:')]
		procedure cpclBarcodeVerticalwidthratioheightxybarcode(_type:PTCPCLBarcodeStyle;width:NSInteger;ratio:PTCPCLBarcodeBarRatio;height:NSInteger;x:NSInteger;y:NSInteger;barcode:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ָ�������·����ָ�ʽ.
		// *
		// *  @brief ָ�������·����ָ�ʽ.
		// *  @param font         ������.
		// *  @param fontSize     �����С, 0-999.
		// *  @param offset       �ı����������ƫ������0-999.
		// *
		// *  \~english
		// *
		// *  used to specify if a human-readable text representation of barcode data should be printed below 1D barcodes.
		// *
		// *  @brief Specify the barcode below the text format
		// *  @param font         A font name or number to create the representation
		// *  @param fontSize     The size of the font: 0-999
		// *  @param offset       How far in units the text is from the barcode:0-999
		// *
		// }
		//- (void)cpclBarcodeTextWithFont:(PTCPCLTextFontName)font
		                       //fontSize:(NSInteger)fontSize
		                         //offset:(NSInteger)offset;
		 //- (void)cpclBarcodeTextWithFont:(PTCPCLTextFontName)font                        fontSize:(NSInteger)fontSize                          offset:(NSInteger)offset;
		[MethodName('cpclBarcodeTextWithFont:fontSize:offset:')]
		procedure cpclBarcodeTextWithFontfontSizeoffset(font:PTCPCLTextFontName;fontSize:NSInteger;offset:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ָ�������·����ָ�ʽ.
		// *
		// *  @brief ָ�������·����ָ�ʽ.
		// *  @param font     �����ļ���.
		// *  @param xScale   �ַ������С(��).
		// *  @param yScale   �ַ������С(��).
		// *  @param offset   �ı����������ƫ������0-999.
		// *
		// *  \~english
		// *
		// *  used to specify if a human-readable text representation of barcode data should be printed below 1D barcodes.
		// *
		// *  @brief Specify the barcode below the text format
		// *  @param font     The filename of the TTF font with extension.
		// *  @param xScale   The X size of the font, in dots: 0-999.
		// *  @param yScale   The Y size of the font, in dots: 0-999.
		// *  @param offset   How far in units the text is from the barcode:0-999.
		// *
		// }
		//- (void)cpclBarcodeTextWithTrueTypeFont:(PTCPCLTextFontName)font
		                                 //xScale:(NSInteger)xScale
		                                 //yScale:(NSInteger)yScale
		                                 //offset:(NSInteger)offset;
		 //- (void)cpclBarcodeTextWithTrueTypeFont:(PTCPCLTextFontName)font                                  xScale:(NSInteger)xScale                                  yScale:(NSInteger)yScale                                  offset:(NSInteger)offset;
		[MethodName('cpclBarcodeTextWithTrueTypeFont:xScale:yScale:offset:')]
		procedure cpclBarcodeTextWithTrueTypeFontxScaleyScaleoffset(font:PTCPCLTextFontName;xScale:NSInteger;yScale:NSInteger;offset:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��������ײ�����չʾ.
		// *
		// *  @brief ��������ײ�����չʾ.
		// *
		// *  \~english
		// *
		// *  turn off the addition of the text representation.
		// *
		// *  @brief turn off the addition of the text representation.
		// }
		//- (void)cpclBarcodeTextOff;
		procedure cpclBarcodeTextOff;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ����QR���ӡ
		// *
		// *  @brief ����QR���ӡ
		// *  @param xPos        ����ʼ��.
		// *  @param yPos        ����ʼ��.
		// *  @param model       �淶���, 1 �� 2.
		// *  @param unitWidth   ��Ԫ���. ��Χ��1-32,Ĭ����6
		// *
		// *  \~english
		// *
		// *  horizonal QR barcode.
		// *
		// *  @brief horizonal QR barcode.
		// *  @param xPos        The X position where the barcode begins
		// *  @param yPos        The Y position where the barcode begins
		// *  @param model       Specifies the model of QR code to print.1 or 2
		// *  @param unitWidth   Unit-width of the barcode in dots. 1-32,default: 6.
		// *
		// }
		//- (void)cpclBarcodeQRcodeWithXPos:(NSInteger)xPos
		                             //yPos:(NSInteger)yPos
		                            //model:(PTCPCLQRCodeModel)model
		                        //unitWidth:(PTCPCLQRCodeUnitWidth)unitWidth;
		 //- (void)cpclBarcodeQRcodeWithXPos:(NSInteger)xPos                              yPos:(NSInteger)yPos                             model:(PTCPCLQRCodeModel)model                         unitWidth:(PTCPCLQRCodeUnitWidth)unitWidth;
		[MethodName('cpclBarcodeQRcodeWithXPos:yPos:model:unitWidth:')]
		procedure cpclBarcodeQRcodeWithXPosyPosmodelunitWidth(xPos:NSInteger;yPos:NSInteger;model:PTCPCLQRCodeModel;unitWidth:PTCPCLQRCodeUnitWidth);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ����QR���ӡ
		// *
		// *  @brief ����QR���ӡ
		// *  @param xPos        ����ʼ��.
		// *  @param yPos        ����ʼ��.
		// *  @param model       �淶���, 1 �� 2.
		// *  @param unitWidth   ��Ԫ���. ��Χ��1-32,Ĭ����6
		// *
		// *  \~english
		// *
		// *  vertical QR barcode.
		// *
		// *  @brief vertical QR barcode.
		// *  @param xPos        The X position where the barcode begins
		// *  @param yPos        The Y position where the barcode begins
		// *  @param model       Specifies the model of QR code to print.1 or 2
		// *  @param unitWidth   Unit-width of the barcode in dots. 1-32,default: 6.
		// *
		// }
		//- (void)cpclBarcodeVerticalQRcodeWithXPos:(NSInteger)xPos
		                                     //yPos:(NSInteger)yPos
		                                    //model:(PTCPCLQRCodeModel)model
		                                //unitWidth:(PTCPCLQRCodeUnitWidth)unitWidth;
		 //- (void)cpclBarcodeVerticalQRcodeWithXPos:(NSInteger)xPos                                      yPos:(NSInteger)yPos                                     model:(PTCPCLQRCodeModel)model                                 unitWidth:(PTCPCLQRCodeUnitWidth)unitWidth;
		[MethodName('cpclBarcodeVerticalQRcodeWithXPos:yPos:model:unitWidth:')]
		procedure cpclBarcodeVerticalQRcodeWithXPosyPosmodelunitWidth(xPos:NSInteger;yPos:NSInteger;model:PTCPCLQRCodeModel;unitWidth:PTCPCLQRCodeUnitWidth);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���QR������.
		// *
		// *  @brief ���QR������.
		// *  @param level            ������
		// *  @param characterMode    ������ַ�ģʽ����
		// *  @param context          ����
		// *
		// *  \~english
		// *
		// *  QR Data.
		// *
		// *  @brief QR Data.
		// *  @param level            Error Correction
		// *  @param characterMode    Data Input Mode
		// *  @param context          Data for barcode
		// *
		// }
		//- (void)cpclBarcodeQRCodeCorrectionLecel:(PTCPCLQRCodeCorrectionLevel)level characterMode:(PTCPCLQRCodeDataInputMode)characterMode context:(NSString *_Nonnull)context;
		[MethodName('cpclBarcodeQRCodeCorrectionLecel:characterMode:context:')]
		procedure cpclBarcodeQRCodeCorrectionLecelcharacterModecontext(level:PTCPCLQRCodeCorrectionLevel;characterMode:PTCPCLQRCodeDataInputMode;context:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  QR�����.
		// *
		// *  @brief QR�����.
		// *
		// *  \~english
		// *
		// *  The QR code terminator.
		// *
		// *  @brief The QR code terminator.
		// *
		// }
		//- (void)cpclBarcodeQRcodeEnd;
		procedure cpclBarcodeQRcodeEnd;cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ����PDF417��Ĳ���
		// *
		// *  @brief ����PDF417��Ĳ���
		// *  @param directon         ˮƽ���Ǵ�ֱ
		// *  @param xPos             �����뿪ʼ��Xλ�� (0 to 65535 units)
		// *  @param yPos             �����뿪ʼ��Yλ�� (0 to 65535 units)
		// *  @param xDot             ����Ԫ�ص�X��С���Ե�Ϊ��λ��,Ĭ����2 (0 to 65535)
		// *  @param yDot             ����Ԫ�ص�Y��С���Ե�Ϊ��λ��,Ĭ����6 (0 to 65535)
		// *  @param columns          ָ��Ҫʹ�õ����� (1 to 30),Ĭ����3
		// *  @param rows             ָ��Ҫʹ�õ����� (0 to 90),Ĭ����0
		// *  @param ecc              ָ������ָ����� (0 to 8),Ĭ����1
		// *  @param binaryModel      ǿ�ƶ�����ѹ��ģʽ (0 or 1),Ĭ����0
		// *
		// *  \~english
		// *
		// *  Config PDF417 parameters
		// *
		// *  @brief Config PDF417 parameters
		// *  @param directon         horizontal or vertical
		// *  @param xPos             The X position where the barcode begins (0 to 65535 units)
		// *  @param yPos             The Y position where the barcode begins (0 to 65535 units)
		// *  @param xDot             The X size of a single element in dots,the default value is 2 (0 to 65535)
		// *  @param yDot             The Y size of a single element in dots,the default value is 6(0 to 65535)
		// *  @param columns          Specifies the number of columns to use,the default value is 3 (1 to 30)
		// *  @param rows             Specifies the number of rows to use,the default value is 0 (0 to 90)
		// *  @param ecc              Specifies the error recovery level,the default value is 1 (0 to 8)
		// *  @param binaryModel      Force binary compaction mode,the default value is 0 (0 or 1)
		// }
		//- (void)cpclPDF417CodeWithDirection:(PTCPCLPDF417Direction)directon
		                               //xPos:(NSInteger)xPos
		                               //yPos:(NSInteger)yPos
		                               //xDot:(NSInteger)xDot
		                               //yDot:(NSInteger)yDot
		                            //columns:(NSInteger)columns
		                               //rows:(NSInteger)rows
		                                //ecc:(PTCPCLPDF417ErrLevel)ecc
		                        //binaryModel:(PTCPCLPDF417Binary)binaryModel;
		 //- (void)cpclPDF417CodeWithDirection:(PTCPCLPDF417Direction)directon                                xPos:(NSInteger)xPos                                yPos:(NSInteger)yPos                                xDot:(NSInteger)xDot                                yDot:(NSInteger)yDot                             columns:(NSInteger)columns                                rows:(NSInteger)rows                                 ecc:(PTCPCLPDF417ErrLevel)ecc                         binaryModel:(PTCPCLPDF417Binary)binaryModel;
		[MethodName('cpclPDF417CodeWithDirection:xPos:yPos:xDot:yDot:columns:rows:ecc:binaryModel:')]
		procedure cpclPDF417CodeWithDirectionxPosyPosxDotyDotcolumnsrowseccbinaryModel(directon:PTCPCLPDF417Direction;xPos:NSInteger;yPos:NSInteger;xDot:NSInteger;yDot:NSInteger;columns:NSInteger;rows:NSInteger;ecc:PTCPCLPDF417ErrLevel;binaryModel:PTCPCLPDF417Binary);cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���PDF417������.
		// *
		// *  @brief ���PDF417������.
		// *  @param context          ����
		// *
		// *  \~english
		// *
		// *  PDF417 Data.
		// *
		// *  @brief PDF417 Data.
		// *  @param context          data
		// *
		// }
		//- (void)cpclPDF417CodeAddContext:(NSString *_Nullable)context;
		procedure cpclPDF417CodeAddContext(context:{_Nullable}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  PDF417�����.
		// *
		// *  @brief PDF417�����.
		// *
		// *  \~english
		// *
		// *  The PDF417 code terminator.
		// *
		// *  @brief The PDF417 code terminator.
		// *
		// }
		//- (void)cpclPDF417codeEnd;
		procedure cpclPDF417codeEnd;cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ƾ���.
		// *
		// *  @brief ���ƾ���.
		// *  @param xPos      ����ʼ��(0~65535)
		// *  @param yPos      ����ʼ��(0~65535)
		// *  @param xEnd      ���������(0~65535)
		// *  @param yEnd      ���������(0~65535)
		// *  @param thickness �������.(0~65535)
		// *
		// *  \~english
		// *
		// *  draw box.
		// *
		// *  @brief draw box.
		// *  @param xPos      The X origin of the box.(0~65535)
		// *  @param yPos      The Y origin of the box.(0~65535)
		// *  @param xEnd      The X coordinate where the box ends.(0~65535)
		// *  @param yEnd      The Y coordinate where the box ends.(0~65535)
		// *  @param thickness The thickness of the lines in the box.(0~65535)
		// *
		// }
		//- (void)cpclBoxWithXPos:(NSInteger)xPos
		                   //yPos:(NSInteger)yPos
		                   //xEnd:(NSInteger)xEnd
		                   //yEnd:(NSInteger)yEnd
		              //thickness:(NSInteger)thickness;
		 //- (void)cpclBoxWithXPos:(NSInteger)xPos                    yPos:(NSInteger)yPos                    xEnd:(NSInteger)xEnd                    yEnd:(NSInteger)yEnd               thickness:(NSInteger)thickness;
		[MethodName('cpclBoxWithXPos:yPos:xEnd:yEnd:thickness:')]
		procedure cpclBoxWithXPosyPosxEndyEndthickness(xPos:NSInteger;yPos:NSInteger;xEnd:NSInteger;yEnd:NSInteger;thickness:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ������.
		// *
		// *  @brief ������.
		// *  @param xPos         ����x����
		// *  @param yPos         ����y����
		// *  @param xEnd         �յ��x����
		// *  @param yEnd         �յ��y����
		// *  @param thickness    �����ĵ�λ���
		// *
		// *  \~english
		// *
		// *  draw line.
		// *
		// *  @brief draw line.
		// *  @param xPos         The X origin of the line.
		// *  @param yPos         The Y origin of the line.
		// *  @param xEnd         The X coordinate where the line ends.
		// *  @param yEnd         The Y coordinate where the line ends.
		// *  @param thickness    The thickness of the line.
		// *
		// }
		//- (void)cpclLineWithXPos:(NSInteger)xPos
		                    //yPos:(NSInteger)yPos
		                    //xEnd:(NSInteger)xEnd
		                    //yEnd:(NSInteger)yEnd
		               //thickness:(NSInteger)thickness;
		 //- (void)cpclLineWithXPos:(NSInteger)xPos                     yPos:(NSInteger)yPos                     xEnd:(NSInteger)xEnd                     yEnd:(NSInteger)yEnd                thickness:(NSInteger)thickness;
		[MethodName('cpclLineWithXPos:yPos:xEnd:yEnd:thickness:')]
		procedure cpclLineWithXPosyPosxEndyEndthickness(xPos:NSInteger;yPos:NSInteger;xEnd:NSInteger;yEnd:NSInteger;thickness:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��������.
		// *
		// *  @brief ��������.
		// *  @param xPos      ����ʼ��(0~65535)
		// *  @param yPos      ����ʼ��(0~65535)
		// *  @param xEnd      ���������(0~65535)
		// *  @param yEnd      ���������(0~65535)
		// *  @param thickness �������.(0~65535)
		// *
		// *  \~english
		// *
		// *  draw inverse line.
		// *
		// *  @brief draw inverse line.
		// *  @param xPos      The X origin of the box.(0~65535)
		// *  @param yPos      The Y origin of the box.(0~65535)
		// *  @param xEnd      The X coordinate where the box ends.(0~65535)
		// *  @param yEnd      The Y coordinate where the box ends.(0~65535)
		// *  @param thickness The thickness of the lines in the box.(0~65535)
		// *
		// }
		//- (void)cpclInverseLineWithXPos:(NSInteger)xPos
		                           //yPos:(NSInteger)yPos
		                           //xEnd:(NSInteger)xEnd
		                           //yEnd:(NSInteger)yEnd
		                      //thickness:(NSInteger)thickness;
		 //- (void)cpclInverseLineWithXPos:(NSInteger)xPos                            yPos:(NSInteger)yPos                            xEnd:(NSInteger)xEnd                            yEnd:(NSInteger)yEnd                       thickness:(NSInteger)thickness;
		[MethodName('cpclInverseLineWithXPos:yPos:xEnd:yEnd:thickness:')]
		procedure cpclInverseLineWithXPosyPosxEndyEndthickness(xPos:NSInteger;yPos:NSInteger;xEnd:NSInteger;yEnd:NSInteger;thickness:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡͼƬ
		// *
		// *  @brief ��ӡͼƬ
		// *  @param Xpos         ����ʼ��ӡλ��
		// *  @param Ypos         ����ʼ��ӡλ��
		// *  @param image        ��Ҫ��ӡ��ͼƬ
		// *  @param bitmapMode   λͼ�����ͣ��ڰ׺ͻҽ׶���
		// *  @param compress     ��ӡ��֧�ֵ�ѹ������
		// *  @param isPackage    �Ƿ���Ҫ�ְ�
		// *
		// *  \~english
		// *
		// *  Print Image
		// *
		// *  @brief Print Image
		// *  @param Xpos         Horizontal starting position.
		// *  @param Ypos         Vertical starting position.
		// *  @param image        Print image
		// *  @param bitmapMode   Bitmap type
		// *  @param compress     The type of compression supported by the printer
		// *  @param isPackage    Whether the pictures need to be subcontracted
		// *
		// }
		//- (void)cpclPrintBitmapWithXPos:(NSInteger)xPos
		                           //yPos:(NSInteger)yPos
		                          //image:(CGImageRef _Nullable )image
		                     //bitmapMode:(PTBitmapMode)bitmapMode
		                       //compress:(PTBitmapCompressMode)compress
		                      //isPackage:(BOOL)isPackage;
		 //- (void)cpclPrintBitmapWithXPos:(NSInteger)xPos                            yPos:(NSInteger)yPos                           image:(CGImageRef _Nullable )image                      bitmapMode:(PTBitmapMode)bitmapMode                        compress:(PTBitmapCompressMode)compress                       isPackage:(BOOL)isPackage;
		[MethodName('cpclPrintBitmapWithXPos:yPos:image:bitmapMode:compress:isPackage:')]
		procedure cpclPrintBitmapWithXPosyPosimagebitmapModecompressisPackage(xPos:NSInteger;yPos:NSInteger;image:{_Nullable}CGImageRef;bitmapMode:PTBitmapMode;compress:PTBitmapCompressMode;isPackage:Boolean);cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ʼ�����ı�����.
		// *
		// *  @brief ��ʼ�����ı�����.
		// *  @param xPos ������ʼλ��
		// *  @param yPos ������ʼλ��
		// *
		// *  \~english
		// *
		// *  concatenate multiple fonts and sizes of text on to a single line, and to align their top-lines in a specific way.
		// *
		// *  @brief Horizontal text series
		// *  @param xPos The X origin of the text string.
		// *  @param yPos The Y origin of the text string.
		// *
		// }
		//- (void)cpclConcatStartWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;
		[MethodName('cpclConcatStartWithXPos:yPos:')]
		procedure cpclConcatStartWithXPosyPos(xPos:NSInteger;yPos:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ʼ�����ı�����.
		// *
		// *  @brief ��ʼ�����ı�����.
		// *  @param xPos ������ʼλ��
		// *  @param yPos ������ʼλ��
		// *
		// *  \~english
		// *
		// *  concatenate multiple fonts and sizes of text on to a single line, and to align their top-lines in a specific way.
		// *
		// *  @brief Vertical text series.
		// *  @param xPos The X origin of the text string.
		// *  @param yPos The Y origin of the text string.
		// *
		// }
		//- (void)cpclConcatVerticalStartWithXPos:(NSInteger)xPos yPos:(NSInteger)yPos;
		[MethodName('cpclConcatVerticalStartWithXPos:yPos:')]
		procedure cpclConcatVerticalStartWithXPosyPos(xPos:NSInteger;yPos:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ƴ���ı�.
		// *
		// *  @brief ƴ���ı�.
		// *  @param font         ��������.
		// *  @param fontSize     �����С.
		// *  @param offset       ��������ƫ��(�Կ�ʼ���ִ���Y��λ��Ϊ��׼).
		// *  @param text         ��������.
		// *
		// *  \~english
		// *
		// *  concat text.
		// *
		// *  @brief concat text.
		// *  @param font         font.
		// *  @param fontSize     font size.
		// *  @param offset       How far from Y is the top of this text.
		// *  @param text         The text data to be concatenated.
		// *
		// }
		//- (void)cpclConcatTextWithFont:(PTCPCLTextFontName)font
		                      //fontSize:(NSInteger)fontSize
		                        //offset:(NSInteger)offset
		                          //text:(NSString * _Nonnull)text;
		 //- (void)cpclConcatTextWithFont:(PTCPCLTextFontName)font                       fontSize:(NSInteger)fontSize                         offset:(NSInteger)offset                           text:(NSString * _Nonnull)text;
		[MethodName('cpclConcatTextWithFont:fontSize:offset:text:')]
		procedure cpclConcatTextWithFontfontSizeoffsettext(font:PTCPCLTextFontName;fontSize:NSInteger;offset:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ƴ�ӿ����ŵ�ˮƽ�ı�.
		// *
		// *  @brief ƴ�ӿ����ŵ�ˮƽ�ı�.
		// *  @param scaledFont   ����������.
		// *  @param xScale       ��������С(��).
		// *  @param yScale       ���������С(��)
		// *  @param offset       ��������ƫ��(�Կ�ʼ���ִ���Y��λ��Ϊ��׼).
		// *  @param text         ��������.
		// *
		// *  \~english
		// *
		// *  concat scaled text.
		// *
		// *  @brief concat scaled text.
		// *  @param scaledFont   A scaled font used to create the text.
		// *  @param xScale       The X size of the scaled font, in points.
		// *  @param yScale       The Y size of the scaled font, in points.
		// *  @param offset       offset How far from Y is the top of this text.
		// *  @param text         The text data to be concatenated.
		// *
		// }
		//- (void)cpclConcatScaleTextWithScaledFont:(NSInteger)scaledFont
		                                   //xScale:(NSInteger)xScale
		                                   //yScale:(NSInteger)yScale
		                                   //offset:(NSInteger)offset
		                                     //text:(NSString * _Nonnull)text;
		 //- (void)cpclConcatScaleTextWithScaledFont:(NSInteger)scaledFont                                    xScale:(NSInteger)xScale                                    yScale:(NSInteger)yScale                                    offset:(NSInteger)offset                                      text:(NSString * _Nonnull)text;
		[MethodName('cpclConcatScaleTextWithScaledFont:xScale:yScale:offset:text:')]
		procedure cpclConcatScaleTextWithScaledFontxScaleyScaleoffsettext(scaledFont:NSInteger;xScale:NSInteger;yScale:NSInteger;offset:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ƴ�ӿ����ŵĴ�ֱ�ı�.
		// *
		// *  @brief ƴ�ӿ����ŵĴ�ֱ�ı�.
		// *  @param scaledFont   ����������.
		// *  @param xScale       ��������С(��).
		// *  @param yScale       ���������С(��)
		// *  @param offset       ��������ƫ��(�Կ�ʼ���ִ���Y��λ��Ϊ��׼).
		// *  @param text         ��������.
		// *
		// *  \~english
		// *
		// *  concat scaled Vertical text.
		// *
		// *  @brief concat scaled Vertical text.
		// *  @param scaledFont   A scaled font used to create the text.
		// *  @param xScale       The X size of the scaled font, in points.
		// *  @param yScale       The Y size of the scaled font, in points.
		// *  @param offset       offset How far from Y is the top of this text.
		// *  @param text         The text data to be concatenated.
		// *
		// }
		//- (void)cpclConcatVerticalScaleTextWithScaledFont:(NSInteger)scaledFont
		                                           //xScale:(NSInteger)xScale
		                                           //yScale:(NSInteger)yScale
		                                           //offset:(NSInteger)offset
		                                             //text:(NSString * _Nonnull)text;
		 //- (void)cpclConcatVerticalScaleTextWithScaledFont:(NSInteger)scaledFont                                            xScale:(NSInteger)xScale                                            yScale:(NSInteger)yScale                                            offset:(NSInteger)offset                                              text:(NSString * _Nonnull)text;
		[MethodName('cpclConcatVerticalScaleTextWithScaledFont:xScale:yScale:offset:text:')]
		procedure cpclConcatVerticalScaleTextWithScaledFontxScaleyScaleoffsettext(scaledFont:NSInteger;xScale:NSInteger;yScale:NSInteger;offset:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ƴ���������ı�.
		// *
		// *  @brief ƴ���������ı�.
		// *  @param fontGroup    ���������(0-10)
		// *  @param offset       ��������ƫ��(�Կ�ʼ���ִ���Y��λ��Ϊ��׼).
		// *  @param text         ��������.
		// *
		// *  \~english
		// *
		// *  concat font group.
		// *
		// *  @brief concat font group.
		// *  @param fontGroup    Font group number.(0-10)
		// *  @param offset       offset How far from Y is the top of this text.
		// *  @param text         The text data to be concatenated.
		// *
		// }
		//- (void)cpclConcatTextWithFontGroup:(PTCPCLFontGroupNumber)fontGroup
		                             //offset:(NSInteger)offset
		                               //text:(NSString * _Nonnull)text;
		 //- (void)cpclConcatTextWithFontGroup:(PTCPCLFontGroupNumber)fontGroup                              offset:(NSInteger)offset                                text:(NSString * _Nonnull)text;
		[MethodName('cpclConcatTextWithFontGroup:offset:text:')]
		procedure cpclConcatTextWithFontGroupoffsettext(fontGroup:PTCPCLFontGroupNumber;offset:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *
		// *  �����ı�����.
		// *
		// *  @brief �����ı�����.
		// *
		// *  \~english
		// *
		// *  terminate concat command.
		// *
		// *  @brief terminate concat command.
		// *
		// }
		//- (void)cpclConcatEnd;
		procedure cpclConcatEnd;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ǩ�Ự��������ӡ��ǩ.
		// *
		// *  @brief ��ǩ�Ự��������ӡ��ǩ.
		// *
		// *  \~english
		// *
		// *  terminate a CPCL label session, and create the resulting print out.
		// *
		// *  @brief The tag end of the session
		// *
		// }
		//- (void)cpclPrint;
		procedure cpclPrint;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �����ӡ,��������ǩ��ת180.
		// *
		// *  @brief �����ӡ,��������ǩ��ת180.
		// *
		// *  \~english
		// *
		// *  Reverse print,Rotate the label 180.
		// *
		// *  @brief Reverse print,Rotate the label 180.
		// *
		// }
		//- (void)cpclPoPrint;
		procedure cpclPoPrint;cdecl;
		
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ����
		// *
		// *  @brief ����
		// *  @param range ����������.
		// *
		// *  \~english
		// *
		// *  center justification.
		// *
		// *  @brief center justification.
		// *  @param range The width of the area to center on from the left side.
		// *
		// }
		//- (void)cpclCenterWithRange:(NSInteger)range;
		procedure cpclCenterWithRange(range:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ����
		// *
		// *  @brief  ����
		// *
		// *  \~english
		// *
		// *  center justification.
		// *
		// *  @brief center justification.
		// *
		// }
		//- (void)cpclCenter;
		procedure cpclCenter;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �����.
		// *
		// *  @brief �����.
		// *  @param range ����ΪFONT-GROUPָ��ָ����������
		// *
		// *  \~english
		// *
		// *  left justification.
		// *
		// *  @brief left justification.
		// *  @param range When used with LEFT, the only function Range performs is a field specification function for FONT-GROUP.
		// *
		// }
		//- (void)cpclLeft:(NSInteger)range;
		procedure cpclLeft(range:NSInteger);cdecl;overload;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  �����.
		// *
		// *  @brief �����.
		// *
		// *  \~english
		// *
		// *  left justification.
		// *
		// *  @brief left justification.
		// *
		// }
		//- (void)cpclLeft;
		procedure cpclLeft;cdecl;overload;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �Ҷ���.
		// *
		// *  @brief �Ҷ���.
		// *  @param right Ҫ������ұ߽�λ��.
		// *
		// *  \~english
		// *
		// *  right justification.
		// *
		// *  @brief right justification.
		// *  @param right the location of the right side to justify to.
		// *
		// }
		//- (void)cpclRight:(NSInteger)right;
		procedure cpclRight(right:NSInteger);cdecl;overload;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �Ҷ���.
		// *
		// *  @brief �Ҷ���.
		// *
		// *  \~english
		// *
		// *  right justification.
		// *
		// *  @brief right justification.
		// *
		// }
		//- (void)cpclRight;
		procedure cpclRight;cdecl;overload;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ʼ�����ı���ӡ.
		// *
		// *  @brief ��ʼ�����ı���ӡ.
		// *  @param lineHeight ÿ�еĸ߶�(��).
		// *
		// *  \~english
		// *
		// *  print a number of lines of text using the same font without having to manually specify the spacing or positioning of each line.
		// *
		// *  @brief Start multiline text printing.
		// *  @param lineHeight Spacing between each line in units.
		// }
		//- (void)cpclMultiLineStartWithLineHeight:(NSInteger)lineHeight;
		procedure cpclMultiLineStartWithLineHeight(lineHeight:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���������ı���ӡ.
		// *
		// *  @brief ���������ı���ӡ.
		// *
		// *  \~english
		// *
		// *  terminated multi line command.
		// *
		// *  @brief terminated multi line command.
		// *
		// }
		//- (void)cpclMultiLineEnd;
		procedure cpclMultiLineEnd;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ָ���ɷŴ������TrueType�������ת�Ƕ�.
		// *
		// *  @brief ָ���ɷŴ������TrueType�������ת�Ƕ�.
		// *  @param degrees ��ʱ����ת�Ƕ�.
		// *
		// *  \~english
		// *
		// *  specify the rotation of a scalable or TrueType font within the printer.
		// *
		// *  @brief specify the rotation of a scalable or TrueType font within the printer.
		// *  @param degrees The number of degrees to rotate counter-clockwise.
		// *
		// }
		//- (void)cpclRotate:(NSInteger)degrees;
		procedure cpclRotate(degrees:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ�����ı���TrueType��������.
		// *
		// *  @brief ��ӡ�����ı���TrueType��������.
		// *  @param scaledFont   ������.
		// *  @param xScale       ���������С(��).
		// *  @param yScale       ���������С(��).
		// *  @param x            ������ʼλ��.
		// *  @param y            ������ʼλ��.
		// *  @param text         �ı�����.
		// *
		// *  \~english
		// *
		// *  print scaled text in CPCL from either a scaled or TrueType font.
		// *
		// *  @brief print scaled text in CPCL from either a scaled or TrueType font.
		// *  @param scaledFont   A scaled font used to create the text.
		// *  @param xScale       The X size of the scaled font, in points.
		// *  @param yScale       The Y size of the scaled font, in points.
		// *  @param x            The X origin of the scaled text in units.
		// *  @param y            The Y origin of the scaled text in units.
		// *  @param text         The text data to be printed.
		// *
		// }
		//- (void)cpclScaleText:(PTCPCLScaledFontName)scaledFont
		               //xScale:(NSInteger)xScale
		               //yScale:(NSInteger)yScale
		                    //x:(NSInteger)x
		                    //y:(NSInteger)y
		                 //text:(NSString * _Nonnull)text;
		 //- (void)cpclScaleText:(PTCPCLScaledFontName)scaledFont                xScale:(NSInteger)xScale                yScale:(NSInteger)yScale                     x:(NSInteger)x                     y:(NSInteger)y                  text:(NSString * _Nonnull)text;
		[MethodName('cpclScaleText:xScale:yScale:x:y:text:')]
		procedure cpclScaleTextxScaleyScalexytext(scaledFont:PTCPCLScaledFontName;xScale:NSInteger;yScale:NSInteger;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �����ӡ�����ı���TrueType��������.
		// *
		// *  @brief �����ӡ�����ı���TrueType��������.
		// *  @param scaledFont   ������.
		// *  @param xScale       ���������С(��).
		// *  @param yScale       ���������С(��).
		// *  @param x            ������ʼλ��.
		// *  @param y            ������ʼλ��.
		// *  @param text         �ı�����.
		// *
		// *  \~english
		// *
		// *  print scaled text in CPCL from either a scaled or TrueType font. rotated 90 degrees.
		// *
		// *  @brief print scaled text in CPCL from either a scaled or TrueType font. rotated 90 degrees.
		// *  @param scaledFont   A scaled font used to create the text.
		// *  @param xScale       The X size of the scaled font, in points.
		// *  @param yScale       The Y size of the scaled font, in points.
		// *  @param x            The X origin of the scaled text in units.
		// *  @param y            The Y origin of the scaled text in units.
		// *  @param text         The text data to be printed.
		// *
		// }
		//- (void)cpclScaleTextVertical:(PTCPCLScaledFontName)scaledFont
		                       //xScale:(NSInteger)xScale
		                       //yScale:(NSInteger)yScale
		                            //x:(NSInteger)x
		                            //y:(NSInteger)y
		                         //text:(NSString * _Nonnull)text;
		 //- (void)cpclScaleTextVertical:(PTCPCLScaledFontName)scaledFont                        xScale:(NSInteger)xScale                        yScale:(NSInteger)yScale                             x:(NSInteger)x                             y:(NSInteger)y                          text:(NSString * _Nonnull)text;
		[MethodName('cpclScaleTextVertical:xScale:yScale:x:y:text:')]
		procedure cpclScaleTextVerticalxScaleyScalexytext(scaledFont:PTCPCLScaledFontName;xScale:NSInteger;yScale:NSInteger;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ����Ӧ��С�ı�.���ɷŴ������TrueType�������.
		// *
		// *  @brief ��ӡ����Ӧ��С�ı�
		// *  @param scaledFont   ������.
		// *  @param width        �����ӡ����.
		// *  @param height       �����ӡ����.
		// *  @param x            ������ʼλ��.
		// *  @param y            ������ʼλ��.
		// *  @param text         �ı�����.
		// *
		// *  \~english
		// *
		// *  print scaled text which is to fit within a particular bounding box. It can be used with TrueType or scaled fonts.
		// *
		// *  @brief print scaled text which is to fit within a particular bounding box
		// *  @param scaledFont   A scaled font used to create the text.
		// *  @param width        The width of the box to contain the text.
		// *  @param height       The height of the box to contain the text.
		// *  @param x            The X origin of the scaled text in units.
		// *  @param y            The Y origin of the scaled text in units.
		// *  @param text         The text data to be printed.
		// *
		// }
		//- (void)cpclScaleToFit:(PTCPCLScaledFontName)scaleFont
		                 //width:(NSInteger)width
		                //height:(NSInteger)height
		                     //x:(NSInteger)x
		                     //y:(NSInteger)y
		                  //text:(NSString * _Nonnull)text;
		 //- (void)cpclScaleToFit:(PTCPCLScaledFontName)scaleFont                  width:(NSInteger)width                 height:(NSInteger)height                      x:(NSInteger)x                      y:(NSInteger)y                   text:(NSString * _Nonnull)text;
		[MethodName('cpclScaleToFit:width:height:x:y:text:')]
		procedure cpclScaleToFitwidthheightxytext(scaleFont:PTCPCLScaledFontName;width:NSInteger;height:NSInteger;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ����Ӵ�.
		// *
		// *  @brief ����Ӵ�.
		// *  @param boldness �Ӵ̶ֳ�.
		// *
		// *  \~english
		// *
		// *  add a faux bolding effect to pre-scaled fonts.
		// *
		// *  @brief add a faux bolding effect to pre-scaled fonts.
		// *  @param boldness the boldness of the text.
		// *
		// }
		//- (void)cpclSetBold:(PTCPCLTextBold)boldness;
		procedure cpclSetBold(boldness:PTCPCLTextBold);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �����ּ��.
		// *
		// *  @brief �����ּ��.
		// *  @param spacing �ּ��.
		// *
		// *  \~english
		// *
		// *  set the horizontal spacing between characters.
		// *
		// *  @brief set the horizontal spacing between characters.
		// *  @param spacing the spacing between characters of a font.
		// *
		// }
		//- (void)cpclSetSpacing:(NSInteger)spacing;
		procedure cpclSetSpacing(spacing:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��������Ŵ���
		// *
		// *  @brief ��������Ŵ���
		// *  @param width    ��ȷŴ�ϵ��, 1-16.
		// *  @param height   �߶ȷŴ�ϵ��, 1-16.
		// *
		// *  \~english
		// *
		// *  set the output scaling of pre-scaled fonts
		// *
		// *  @brief set the output scaling of pre-scaled fonts
		// *  @param width    the width multiplier of the font, 1-16.
		// *  @param height   the height multiplier of the font, 1-16.
		// *
		// }
		//- (void)cpclSetMagWithWidth:(PTCPCLFontScale)width height:(PTCPCLFontScale)height;
		[MethodName('cpclSetMagWithWidth:height:')]
		procedure cpclSetMagWithWidthheight(width:PTCPCLFontScale;height:PTCPCLFontScale);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ�Զ������ı�.
		// *
		// *  @brief ��ӡ�Զ������ı�.
		// *  @param rotate       ������ת����
		// *  @param font         ����
		// *  @param fontSize     ����Ŵ���,�ýӿ�Ĭ����0������ֵ��Ч
		// *  @param x            ��ʼλ��x
		// *  @param y            ��ʼλ��y
		// *  @param safeHeight   ��ӡ����߶�,�����߶Ȳ��ֲ����ӡ
		// *  @param width        ��ӡ������,���Ϊ0��ʾ���Զ�����
		// *  @param lineSpacing  �м��
		// *  @param fontScale    ����Ŵ���
		// *  @param text         ��ӡ����
		// *  @return             �Զ����к��ʵ�ʴ�ӡ�߶�
		// *
		// *  \~english
		// *
		// *  print text that feed line automatically.
		// *
		// *  @brief print text that feed line automatically.
		// *  @param rotate       text rotate.
		// *  @param font         text font.
		// *  @param fontSize     text font scale��deault is 0��other values are invalid
		// *  @param x            orgin x of text.
		// *  @param y            origin y of text.
		// *  @param safeHeight   height of text field.Part will not print more than height
		// *  @param width        width of text field.if width is 0,not auto line
		// *  @param lineSpacing  line space.
		// *  @param fontScale    Font magnification factor
		// *  @param text         text.
		// *  @return             Actual print height after automatic line feed
		// }
		//- (NSInteger)cpclAutoTextWithRotate:(PTCPCLStyleRotation)rotate
		                               //font:(PTCPCLTextFontName)font
		                           //fontSize:(NSInteger)fontSize
		                                  //x:(NSInteger)x
		                                  //y:(NSInteger)y
		                         //safeHeight:(NSInteger)safeHeight
		                              //width:(NSInteger)width
		                        //lineSpacing:(NSInteger)lineSpacing
		                          //fontScale:(PTCPCLFontScale)fontScale
		                               //text:(NSString * _Nonnull)text;
		 //- (NSInteger)cpclAutoTextWithRotate:(PTCPCLStyleRotation)rotate                                font:(PTCPCLTextFontName)font                            fontSize:(NSInteger)fontSize                                   x:(NSInteger)x                                   y:(NSInteger)y                          safeHeight:(NSInteger)safeHeight                               width:(NSInteger)width                         lineSpacing:(NSInteger)lineSpacing                           fontScale:(PTCPCLFontScale)fontScale                                text:(NSString * _Nonnull)text;
		[MethodName('cpclAutoTextWithRotate:font:fontSize:x:y:safeHeight:width:lineSpacing:fontScale:text:')]
		function cpclAutoTextWithRotatefontfontSizexysafeHeightwidthlineSpacingfontScaletext(rotate:PTCPCLStyleRotation;font:PTCPCLTextFontName;fontSize:NSInteger;x:NSInteger;y:NSInteger;safeHeight:NSInteger;width:NSInteger;lineSpacing:NSInteger;fontScale:PTCPCLFontScale;text:{_Nonnull}NSString):NSInteger;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ�Զ������ı�,�˽ӿڽ����ת90���ӡ�����ı�,��ת90\270��cpclCenter�ӿ���Ч
		// *
		// *  @brief ��ӡ�Զ������ı�.
		// *  @param rotate       ������ת����
		// *  @param font         ����
		// *  @param fontSize     ����Ŵ���,�ýӿ�Ĭ����0������ֵ��Ч
		// *  @param xPos         ��ʼλ��x
		// *  @param yPos         ��ʼλ��y
		// *  @param center       �Ƿ����
		// *  @param safeHeight   ��ӡ����߶�,�����߶Ȳ��ֲ����ӡ
		// *  @param width        ��ӡ������,���Ϊ0��ʾ���Զ�����
		// *  @param lineSpacing  �м��
		// *  @param fontScale    ����Ŵ���
		// *  @param text         ��ӡ����
		// *  @return             �Զ����к��ʵ�ʴ�ӡ�߶�
		// *
		// *  \~english
		// *
		// *  print text that feed line automatically.rotate 90\270,the cpclCenter interface is invalid
		// *
		// *  @brief print text that feed line automatically
		// *  @param rotate       text rotate.
		// *  @param font         text font.
		// *  @param fontSize     text font scale,deault is 0��other values are invalid
		// *  @param xPos         orgin x of text.
		// *  @param yPos         origin y of text.
		// *  @param center       Whether in the middle
		// *  @param safeHeight   height of text field.Part will not print more than height
		// *  @param width        width of text field.if width is 0,not auto line
		// *  @param lineSpacing  line space.
		// *  @param fontScale    Font magnification factor.
		// *  @param text         text.
		// *  @return             Actual print height after automatic line feed
		// }
		//- (NSInteger)cpclAutoTextWithRotate:(PTCPCLStyleRotation)rotate
		                               //font:(PTCPCLTextFontName)font
		                           //fontSize:(NSInteger)fontSize
		                               //xPos:(NSInteger)xPos
		                               //yPos:(NSInteger)yPos
		                             //center:(BOOL)center
		                         //safeHeight:(NSInteger)safeHeight
		                              //width:(NSInteger)width
		                        //lineSpacing:(NSInteger)lineSpacing
		                          //fontScale:(PTCPCLFontScale)fontScale
		                               //text:(NSString * _Nonnull)text;
		 //- (NSInteger)cpclAutoTextWithRotate:(PTCPCLStyleRotation)rotate                                font:(PTCPCLTextFontName)font                            fontSize:(NSInteger)fontSize                                xPos:(NSInteger)xPos                                yPos:(NSInteger)yPos                              center:(BOOL)center                          safeHeight:(NSInteger)safeHeight                               width:(NSInteger)width                         lineSpacing:(NSInteger)lineSpacing                           fontScale:(PTCPCLFontScale)fontScale                                text:(NSString * _Nonnull)text;
		[MethodName('cpclAutoTextWithRotate:font:fontSize:xPos:yPos:center:safeHeight:width:lineSpacing:fontScale:text:')]
		function cpclAutoTextWithRotatefontfontSizexPosyPoscentersafeHeightwidthlineSpacingfontScaletext(rotate:PTCPCLStyleRotation;font:PTCPCLTextFontName;fontSize:NSInteger;xPos:NSInteger;yPos:NSInteger;center:Boolean;safeHeight:NSInteger;width:NSInteger;lineSpacing:NSInteger;fontScale:PTCPCLFontScale;text:{_Nonnull}NSString):NSInteger;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �ı��Զ�����,����ʹ��
		// *
		// *  @brief �Զ�����
		// *  @param font         ���壬���ģ�PTCPCLThaiFontStyle1��������PTCPCLThaiFontStyle0
		// *  @param fontSize     �����С��Ĭ��0
		// *  @param x            ��ʼλ��x
		// *  @param y            ��ʼλ��y
		// *  @param lineSpace    �м����Ĭ��ֵ30
		// *  @param width        ��ӡ������,Ĭ��0����x+width����ҳ���ȵĻ�,width=w-x
		// *  @param text         ��ӡ����
		// *
		// *  \~english
		// *
		// *  Text wrap automatically, recommended
		// *
		// *  @brief Text wraps automatically
		// *  @param font         text font��chinese��PTCPCLThaiFontStyle1��other��PTCPCLThaiFontStyle0
		// *  @param fontSize     text font size.deault 0
		// *  @param x            orgin x of text.
		// *  @param y            origin y of text.
		// *  @param lineSpace    Line spacing for automatic line feed.default 30
		// *  @param width        width of text field.
		// *  @param text         text.
		// }
		//- (void)cpclPrintAutoTextWithFont:(PTCPCLTextLineFontStyle)font
		                        //fontSize:(NSInteger)fontSize
		                               //x:(NSInteger)x
		                               //y:(NSInteger)y
		                       //lineSpace:(NSInteger)lineSpace
		                           //width:(NSInteger)width
		                            //text:(NSString * _Nonnull)text;
		 //- (void)cpclPrintAutoTextWithFont:(PTCPCLTextLineFontStyle)font                         fontSize:(NSInteger)fontSize                                x:(NSInteger)x                                y:(NSInteger)y                        lineSpace:(NSInteger)lineSpace                            width:(NSInteger)width                             text:(NSString * _Nonnull)text;
		[MethodName('cpclPrintAutoTextWithFont:fontSize:x:y:lineSpace:width:text:')]
		procedure cpclPrintAutoTextWithFontfontSizexylineSpacewidthtext(font:PTCPCLTextLineFontStyle;fontSize:NSInteger;x:NSInteger;y:NSInteger;lineSpace:NSInteger;width:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ�����ı�
		// *
		// *  @brief ��ӡ�����ı�
		// *  @param rotate       ������ת����
		// *  @param font         ����
		// *  @param fontSize     �ò�����Ч����0����
		// *  @param x            ��ʼλ��x
		// *  @param y            ��ʼλ��y
		// *  @param width        ��ӡ������
		// *  @param text         ��ӡ����
		// *
		// *  \~english
		// *
		// *  Print center text
		// *
		// *  @brief Print center text
		// *  @param rotate       text rotate.
		// *  @param font         text font.
		// *  @param fontSize     This parameter is invalid, default is 0
		// *  @param x            orgin x of text.
		// *  @param y            origin y of text.
		// *  @param width        width of textbox
		// *  @param text         content of text.
		// }
		//- (void)cpclCenterTextWithRotate:(PTCPCLStyleRotation)rotate
		                            //font:(PTCPCLTextFontName)font
		                        //fontSize:(NSInteger)fontSize
		                               //x:(NSInteger)x
		                               //y:(NSInteger)y
		                           //width:(NSInteger)width
		                            //text:(NSString * _Nonnull)text;
		 //- (void)cpclCenterTextWithRotate:(PTCPCLStyleRotation)rotate                             font:(PTCPCLTextFontName)font                         fontSize:(NSInteger)fontSize                                x:(NSInteger)x                                y:(NSInteger)y                            width:(NSInteger)width                             text:(NSString * _Nonnull)text;
		[MethodName('cpclCenterTextWithRotate:font:fontSize:x:y:width:text:')]
		procedure cpclCenterTextWithRotatefontfontSizexywidthtext(rotate:PTCPCLStyleRotation;font:PTCPCLTextFontName;fontSize:NSInteger;x:NSInteger;y:NSInteger;width:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ�ı�.
		// *
		// *  @brief ��ӡ�ı�.
		// *  @param rotate       ������ת����
		// *  @param font         ��������
		// *  @param fontSize     ����Ŵ������ò���Ĭ����0�����ѡ��������ö��ֵ����Ҫ��ӡ���̼�֧�֣��̼���֧�ֵ�����£��Ŵ������ʹ�ã�cpclSetMagWithWidth: height:���ӿ�
		// *  @param x            ��ʼλ��x
		// *  @param y            ��ʼλ��y
		// *  @param text         ��ӡ����
		// *
		// *  \~english
		// *
		// *  print text.
		// *
		// *  @brief print text.
		// *  @param rotate       text rotate.
		// *  @param font         text font.
		// *  @param fontSize     text font scale��This parameter is 0 by default. If other enumeration values are selected, printer firmware support is required. In cases where the firmware is not supported, the zoom font can be used (cpclSetMagWithWidth: height:) interface
		// *  @param x            orgin x of text.
		// *  @param y            origin y of text.
		// *  @param text         text.
		// }
		//- (void)cpclTextWithRotate:(PTCPCLStyleRotation)rotate
		                      //font:(PTCPCLTextFontName)font
		                  //fontSize:(PTCPCLTextFontSize)fontSize
		                         //x:(NSInteger)x
		                         //y:(NSInteger)y
		                      //text:(NSString * _Nonnull)text;
		 //- (void)cpclTextWithRotate:(PTCPCLStyleRotation)rotate                       font:(PTCPCLTextFontName)font                   fontSize:(PTCPCLTextFontSize)fontSize                          x:(NSInteger)x                          y:(NSInteger)y                       text:(NSString * _Nonnull)text;
		[MethodName('cpclTextWithRotate:font:fontSize:x:y:text:')]
		procedure cpclTextWithRotatefontfontSizexytext(rotate:PTCPCLStyleRotation;font:PTCPCLTextFontName;fontSize:PTCPCLTextFontSize;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ���׼Ӵ��ı�.
		// *
		// *  @brief ��ӡ���׼Ӵ��ı�.
		// *  @param font         ����
		// *  @param rotate       ������ת����
		// *  @param fontSize     ����Ŵ������ò���Ĭ����0�����ѡ��������ö��ֵ����Ҫ��ӡ���̼�֧�֣��̼���֧�ֵ�����£��Ŵ������ʹ�ã�cpclSetMagWithWidth: height:���ӿ�
		// *  @param reverse      �Ƿ񷴰�
		// *  @param bold         �Ӵ�
		// *  @param x            ��ʼλ��x
		// *  @param y            ��ʼλ��y
		// *  @param text         ��ӡ����
		// *
		// *  \~english
		// *
		// *  print reverse bold text.
		// *
		// *  @brief print reverse bold text.
		// *  @param font         text font.
		// *  @param rotate       text rotate.
		// *  @param fontSize     text font scale��This parameter is 0 by default. If other enumeration values are selected, printer firmware support is required. In cases where the firmware is not supported, the zoom font can be used (cpclSetMagWithWidth: height:) interface
		// *  @param reverse      Whether it is reversed
		// *  @param bold         bold
		// *  @param x            origin x of text.
		// *  @param y            origin y of text.
		// *  @param text         text.
		// }
		//- (void)appendTextWithFont:(PTCPCLTextFontName)font
		                    //rotate:(PTCPCLStyleRotation)rotate
		                  //fontSize:(PTCPCLTextFontSize)fontSize
		                   //reverse:(BOOL)reverse
		                      //bold:(PTCPCLTextBold)bold
		                         //x:(NSInteger)x
		                         //y:(NSInteger)y
		                      //text:(NSString * _Nonnull)text;
		 //- (void)appendTextWithFont:(PTCPCLTextFontName)font                     rotate:(PTCPCLStyleRotation)rotate                   fontSize:(PTCPCLTextFontSize)fontSize                    reverse:(BOOL)reverse                       bold:(PTCPCLTextBold)bold                          x:(NSInteger)x                          y:(NSInteger)y                       text:(NSString * _Nonnull)text;
		[MethodName('appendTextWithFont:rotate:fontSize:reverse:bold:x:y:text:')]
		procedure appendTextWithFontrotatefontSizereverseboldxytext(font:PTCPCLTextFontName;rotate:PTCPCLStyleRotation;fontSize:PTCPCLTextFontSize;reverse:Boolean;bold:PTCPCLTextBold;x:NSInteger;y:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		////#pragma mark - Background Text Commands
		///////////////////////////////////////////////////////////////////////
		///***************** Background Text Commands *******************/
		///////////////////////////////////////////////////////////////////////
		
		//{!
		// *  \~chinese
		// *
		// *  ���ñ����ڶ�ֵ.(0-255) 0��normal�����ֻ��Ͳ�֧��
		// *
		// *  @brief ���ñ����ڶ�ֵ
		// *  @param value �ڶ�ֵ.
		// *
		// *  \~english
		// *
		// *  Set the background blackness value.(0-255) 0��normal
		// *
		// *  @brief Set the background blackness value
		// *  @param value Set the background blackness value
		// *
		// }
		//- (void)cpclSetBackgroundBlacknessValue:(NSInteger)value;
		procedure cpclSetBackgroundBlacknessValue(value:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ñ�������.
		// *
		// *  @brief ���ñ�������.
		// *  @param font         ����
		// *  @param rotate       ������ת����
		// *  @param fontSize     �����С
		// *  @param xPos         ��ʼλ��xPos
		// *  @param yPos         ��ʼλ��yPos
		// *  @param text         ��ӡ����
		// *
		// *  \~english
		// *
		// *  set back text��Some models are not supported.
		// *
		// *  @brief set back text.
		// *  @param font         text font.
		// *  @param rotate       text rotate.
		// *  @param fontSize     Size identifier for the font
		// *  @param xPos         x-coordinate of start point
		// *  @param yPos         y-coordinate of start point
		// *  @param text         The text data to be  printed
		// }
		//- (void)cpclBackTextWithFont:(PTCPCLTextFontName)font
		                      //rotate:(PTCPCLStyleRotation)rotate
		                    //fontSize:(NSInteger)fontSize
		                        //xPos:(NSInteger)xPos
		                        //yPos:(NSInteger)yPos
		                        //text:(NSString *_Nonnull)text;
		 //- (void)cpclBackTextWithFont:(PTCPCLTextFontName)font                       rotate:(PTCPCLStyleRotation)rotate                     fontSize:(NSInteger)fontSize                         xPos:(NSInteger)xPos                         yPos:(NSInteger)yPos                         text:(NSString *_Nonnull)text;
		[MethodName('cpclBackTextWithFont:rotate:fontSize:xPos:yPos:text:')]
		procedure cpclBackTextWithFontrotatefontSizexPosyPostext(font:PTCPCLTextFontName;rotate:PTCPCLStyleRotation;fontSize:NSInteger;xPos:NSInteger;yPos:NSInteger;text:{_Nonnull}NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ȡ��ӡ��SN��
		// *
		// *  @brief ��ȡ��ӡ��SN��
		// *
		// *  \~english
		// *
		// *  get printer serial number.
		// *
		// *  @brief get printer serial number.
		// *
		// }
		//- (void)cpclGetPrinterSN;
		procedure cpclGetPrinterSN;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ����ֽ������1��A400\A300S\A300L��֧�ָýӿ�
		// *
		// *  @brief ����ֽ������1
		// *  @param type ֽ������
		// *
		// *  \~english
		// *
		// *  set the paper type1��A400\A300S\A300L does not support this interface
		// *
		// *  @brief set the paper type1.
		// *  @param type paper type.
		// *
		// }
		//- (void)cpclPaperTypeWithType:(PTCPCLPaperType)type;
		procedure cpclPaperTypeWithType(_type:PTCPCLPaperType);cdecl;
		
		
		////#pragma mark - A400\A300S\A300L For Paper Type
		///////////////////////////////////////////////////////////////////////
		///****************** A400\A300S\A300L For Paper Type ****************/
		///////////////////////////////////////////////////////////////////////
		//{!
		// *  \~chinese
		// *
		// *  ����ֽ������2��A400\A300S\A300L����֧�ָýӿ�
		// *
		// *  @brief ����ֽ������2
		// *  @param type ֽ������
		// *
		// *  \~english
		// *
		// *  set the paper type2��A400\A300S\A300L supports this interface
		// *
		// *  @brief set the paper type2
		// *  @param type paper type.
		// *
		// }
		//- (void)setPrinterPaperTypeFor4Inch:(PTCPCLNewPaperType)type;
		procedure setPrinterPaperTypeFor4Inch(_type:PTCPCLNewPaperType);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡŨ��.
		// *
		// *  @brief ���ô�ӡŨ��.
		// *  @param density 0-2
		// *
		// *  \~english
		// *
		// *  set the darkness of the printout from the printer
		// *
		// *  @brief set the darkness of the printout from the printer
		// *  @param density 0-2
		// *
		// }
		//- (void)setPrinterDensity:(NSInteger)density;
		procedure setPrinterDensity(density:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ȡ��ӡŨ��
		// *
		// *  @brief ��ȡ��ӡŨ��
		// *
		// *  \~english
		// *
		// *  get printer density.
		// *
		// *  @brief get printer density.
		// *
		// }
		//- (void)getPrinterDensity;
		procedure getPrinterDensity;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ȡ�������ýӿ�Ϊ�Զ��幦�ܣ����ֻ��Ͳ�֧��
		// *
		// *  @brief ��ȡ������<000902> ��ʾ92%
		// *
		// *  \~english
		// *
		// *  get Printer Battery��This interface is a custom function, which is only supported by some models
		// *
		// *  @brief get Printer Battery,<000902> is 92%
		// *
		// }
		//- (void)getPrinterBattery;
		procedure getPrinterBattery;cdecl;
		
		
		////#pragma mark - Line Print Commands
		///////////////////////////////////////////////////////////////////////
		///***************** Line Print Commands *******************/
		///////////////////////////////////////////////////////////////////////
		
		//{!
		// *  \~chinese
		// *
		// *  ��ģʽ����.
		// *
		// *  @brief ��ģʽ����.
		// *
		// *  \~english
		// *
		// *  start utilities sessions.
		// *
		// *  @brief start utilities sessions.
		// *
		// }
		//- (void)cpclUtilitySession;
		procedure cpclUtilitySession;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���й��ܻỰǰ׺
		// *
		// *  @brief ���й��ܻỰǰ׺
		// *
		// *  \~english
		// *
		// *  prefix if a single line utilities session.
		// *
		// *  @brief prefix if a single line utilities session.
		// *
		// }
		//- (void)cpclLineMode;
		procedure cpclLineMode;cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ������߾�
		// *
		// *  @brief ������߾�
		// *  @param offset   ������ߵ�ƫ����.
		// *
		// *  \~english
		// *
		// *  Set margin
		// *
		// *  @brief Set margin
		// *  @param offset   Specifics the distance from the left edge in units
		// *
		// }
		//- (void)cpclLineMargin:(NSInteger)offset;
		procedure cpclLineMargin(offset:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ֽһ��
		// *
		// *  @brief ��ֽһ��
		// *
		// *  \~english
		// *
		// *  feed
		// *
		// *  @brief feed
		// *
		// }
		//- (void)cpclLineFeed;
		procedure cpclLineFeed;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ������ֽ
		// *
		// *  @brief ������ֽ
		// *  @param amount   ��ֽ���ٸ���. -4000~4000dots
		// *
		// *  \~english
		// *
		// *  Set feed
		// *
		// *  @brief Set feed
		// *  @param amount   How much to feed in units.-4000~4000dots
		// *
		// }
		//- (void)cpclFeed:(NSInteger)amount;
		procedure cpclFeed(amount:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡ��ǩ֮ǰ��ƫ����
		// *
		// *  @brief ���ô�ӡ��ǩ֮ǰ��ƫ����
		// *  @param amount   �ƶ����ٸ���. 0~4000dots
		// *
		// *  \~english
		// *
		// *  when used in a label session, is used to perform an additional media movement before a label is printed
		// *
		// *  @brief Set the print label before the offset
		// *  @param amount   How much to feed in units.0~4000dots
		// *
		// }
		//- (void)cpclReverse:(NSInteger)amount;
		procedure cpclReverse(amount:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡ�ٶ�.
		// *
		// *  @brief ���ô�ӡ�ٶ�.
		// *  @param value ��ӡ�ٶ�,0-5.
		// *
		// *  \~english
		// *
		// *  set the maximum speed at which printout occurs.
		// *
		// *  @brief set the maximum speed at which printout occurs.
		// *  @param value speed to print in an arbitrary scale,0-5.
		// *
		// }
		//- (void)cpclSpeed:(NSInteger)value;
		procedure cpclSpeed(value:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ������λ���¸��ڱ���ǩ�죬���ڱ�ǩֽ��ӡ.
		// *
		// *  @brief ��λ�¸���ǩ.
		// *
		// *  \~english
		// *
		// *  the printer should attempt to synchronize to a mark or gap on the media after the label is printed��Used for label paper printing.
		// *
		// *  @brief Positioning label
		// *
		// }
		//- (void)cpclForm;
		procedure cpclForm;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡŨ��.
		// *
		// *  @brief ���ô�ӡŨ��.
		// *  @param value ���Ũ��, -100~200.Ĭ����0
		// *
		// *  \~english
		// *
		// *  set the darkness of the printout from the printer.default:0
		// *
		// *  @brief set the darkness of the printout from the printer
		// *  @param value darkness of the printout, -100~200.
		// *
		// }
		//- (void)cpclTone:(NSInteger)value;
		procedure cpclTone(value:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ñ�ǩ���д�ӡ�ı�����.
		// *
		// *  @brief ���ñ�ǩ���д�ӡ�ı�����.
		// *  @param degrees ����,0 �� 180.
		// *
		// *  \~english
		// *
		// *  changes the orientation of the printed label or of line print text
		// *
		// *  @brief changes the orientation of the printed label or of line print text
		// *  @param degrees The orientation of the label, 0 or 180.
		// *
		// }
		//- (void)cpclTurn:(NSInteger)degrees;
		procedure cpclTurn(degrees:NSInteger);cdecl;
		
		
		////#pragma mark - Utility and Diagnostic
		///////////////////////////////////////////////////////////////////////
		///****************** Utility and Diagnostic Commands ****************/
		///////////////////////////////////////////////////////////////////////
		
		
		//{!
		// *  \~chinese
		// *
		// *  ֽ��ѧϰָ������ӡ����ʾֽ�þ���ʱ���ںϸ���ֽ��״̬�·��͸�ָ��
		// *
		// *  @brief ֽ��ѧϰָ��.
		// *
		// *  \~english
		// *
		// *  Paper learning instructions.If the printer shows that the paper is out of paper, send the instruction in the state of closing the paper
		// *
		// *  @brief Paper learning instructions
		// *
		// }
		//- (void)setPaperLearn;
		procedure setPaperLearn;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ����QRCode�İ汾��version�ķ�Χ��0-25��������0ʱ����ʾ�������Զ��ģ�1-25ʱ����ʾ���������õĴ�С(���ֻ���֧��).
		// *
		// *  @brief ����QRCode�İ汾
		// *  @param density 0-25
		// *
		// *  \~english
		// *
		// *  Set the QRCode version��the range of version is 0-25, when it is equal to 0, it means that the program uses automatic; 1-25, it means that the size set now��some models are supported
		// *
		// *  @brief Set the version of QRCode
		// *  @param density 0-25
		// *
		// }
		//- (void)setQRCodeVersion:(NSInteger)version;
		procedure setQRCodeVersion(version:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ȡQRCode�İ汾�����ֻ���֧��
		// *
		// *  @brief ��ȡQRCode�İ汾
		// *
		// *  \~english
		// *
		// *  Get the QRCode version��some models are supported
		// *
		// *  @brief Get the QRCode version
		// *
		// }
		//- (void)getQRCodeVersion;
		procedure getQRCodeVersion;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ȡ��ӡ���ͺţ�A300S���ֹ̼��汾֧��
		// *
		// *  @brief ��ȡ��ӡ���ͺ�
		// *
		// *  \~english
		// *
		// *  Get printer model��Part of the A300S firmware version is supported
		// *
		// *  @brief Get printer model
		// *
		// }
		//- (void)cpclGetPrinterModel;
		procedure cpclGetPrinterModel;cdecl;
		
		
		////#pragma mark - Codepage
		///////////////////////////////////////////////////////////////////////
		///*********************  Codepage Commands ********************/
		///////////////////////////////////////////////////////////////////////
		
		//{!
		// *  \~chinese
		// *
		// *  �����ַ�����ҳ.
		// *
		// *  @brief �����ַ�����ҳ.
		// *  @param codepage "USA" "FRANCE" "GERMANY" "UK" "DENMARK" "SWEDEN" "ITALY" "SPAIN" "JAPAN-S" "NORWAY" "DENMARK II" "SPAIN II" "LATIN9" "KOREA" "SLOVENIA" "CHINA" "BIG5" "CP874" "CP850" "CP437" "CP860" "CP863" "CP865" "CP866" "CP852" "CP858" "CP857" "CP737" "CP720" "CP775" "CP855" "CP862" "CP864" "ISO8859-6" "ISO8859-8" "ISO8859-9" "ISO8859-15" "WPC1252" "WPC1250" "WPC1251" "WPC1252" "WPC1254" "WPC1255" "WPC1256" "ISO8859-1" "ISO8859-2" "ISO8859-3" "ISO8859-4" "ISO8859-5" "TIS11" "TIS18" "WPC1258" "UnicodeBigUnmarked"
		// *
		// *  \~english
		// *
		// *  Set Character CodePage
		// *
		// *  @brief Set Character CodePage
		// *  @param codepage "USA" "FRANCE" "GERMANY" "UK" "DENMARK" "SWEDEN" "ITALY" "SPAIN" "JAPAN-S" "NORWAY" "DENMARK II" "SPAIN II" "LATIN9" "KOREA" "SLOVENIA" "CHINA" "BIG5" "CP874" "CP850" "CP437" "CP860" "CP863" "CP865" "CP866" "CP852" "CP858" "CP857" "CP737" "CP720" "CP775" "CP855" "CP862" "CP864" "ISO8859-6" "ISO8859-8" "ISO8859-9" "ISO8859-15" "WPC1252" "WPC1250" "WPC1251" "WPC1252" "WPC1254" "WPC1255" "WPC1256" "ISO8859-1" "ISO8859-2" "ISO8859-3" "ISO8859-4" "ISO8859-5" "TIS11" "TIS18" "WPC1258" "UnicodeBigUnmarked"
		// *
		// }
		//- (void)cpclSetCharacterCodePage:(NSString *_Nonnull)codepage;
		procedure cpclSetCharacterCodePage(codepage:{_Nonnull}NSString);cdecl;
		
		
		// {!
		//  *  \~chinese
		//  *
		//  *  ��ѯ�����￪��״̬��00 00���رգ� 01 00������
		//  *
		//  *  @brief ��ѯ�����������״̬
		//  *
		//  *  \~english
		//  *
		//  *  Get Khmer status:00 00��close�� 01 00��open
		//  *
		//  *  @brief Get Khmer status
		//  *
		//  }
		//- (void)cpclSearchKhmerState;
		procedure cpclSearchKhmerState;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ø����￪��״̬����ӡ��������ҳ��Ҫ�ȹرո�����ģʽ���л�����ҳ����ģʽ����ӡ������ʱ�ȿ���������ģʽ,Ȼ�����cpclSetKhmerCodepage
		// *
		// *  @brief ���ø����￪��״̬
		// *  @param state 0���رգ� 1������
		// *
		// *  \~english
		// *
		// *  Set the Khmer language switch. To print other code pages, close the Khmer language mode first and then switch the code page setting mode. When printing Khmer language, open the Khmer language mode first,and invoke 'cpclSetKhmerCodepage'
		// *
		// *  @brief Set Khmer on/off state
		// *  @param state 0��close; 1:open
		// *
		// }
		//- (void)cpclSetKhmerState:(NSInteger)state;
		procedure cpclSetKhmerState(state:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ø��������ҳ���ڸô���ҳ��֧��8������55�������ӡ���ģ���ӡ���Ҫ�˳�������ģʽ������cpclExitKhmerMode
		// *
		// *  @brief ��ѯ�����������״̬
		// *
		// *  \~english
		// *
		// *  Set the Khmer language code page, under which Chinese is printed with font size of 8 and font size of 55. After printing, exit Khmer mode and call cpclExitKhmerMode
		// *
		// *  @brief Set Khmer codepage
		// *
		// }
		//- (void)cpclSetKhmerCodepage;
		procedure cpclSetKhmerCodepage;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �˳�������ģʽ
		// *
		// *  @brief �˳�������ģʽ
		// *
		// *  \~english
		// *
		// * Exit Khmer language mode
		// *
		// *  @brief Exit Khmer language mode
		// *
		// }
		//- (void)cpclExitKhmerMode;
		procedure cpclExitKhmerMode;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �����������,���ú�������ӡ��
		// *
		// *  @brief �����������,���ú�������ӡ��
		// *  @param function 48���رգ� 49������1������������50������2������������51������3����������������
		// *
		// *  \~english
		// *
		// *  Arabic transform
		// *
		// *  @brief Arabic transform
		// *  @param function 48��close�� 49��Sort by word��50��Phrase sort��51��Sort by complete rules
		// *
		// }
		//- (void)cpclSetArabicTransformFunction:(NSInteger)function;
		procedure cpclSetArabicTransformFunction(_function:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ѯ�����������״̬��00 00���رգ� 01 00������1�� 02 00������2�� 03 00������3
		// *
		// *  @brief ��ѯ�����������״̬
		// *
		// *  \~english
		// *
		// *  get Arabic status:00 00��close�� 01 00��Sort by word�� 02 00��Phrase sort�� 03 00��Sort by complete rules
		// *
		// *  @brief get Arabic status
		// *
		// }
		//- (void)cpclGetArabicTransformStatus;
		procedure cpclGetArabicTransformStatus;cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ̩�ı��ο���
		// *
		// *  @brief ̩�ı��ο���
		// *  @param status 48��close 49:open
		// *
		// *  \~english
		// *
		// *  Thai transform status
		// *
		// *  @brief Thai transform status
		// *  @param status 48��close 49:open
		// *
		// }
		//- (void)cpclSetThaiTransformStatus:(NSInteger)status;
		procedure cpclSetThaiTransformStatus(status:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  Խ������Σ����ú�������ӡ��.
		// *
		// *  @brief Խ������Σ����ú�������ӡ��.
		// *  @param function 48���رգ� 49��ASCII���룻 50��UTF-8����
		// *
		// *  \~english
		// *
		// *  Set Vietnamese Transform
		// *
		// *  @brief Set Vietnamese Transform
		// *  @param function 48��close; 49��ASCII; 50��UTF-8
		// *
		// }
		//- (void)cpclSetVietnameseTransformFunction:(NSInteger)function;
		procedure cpclSetVietnameseTransformFunction(_function:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ѯԽ�������״̬��00 00���رգ� 01 00��ASCII���룻 02 00��UTF-8���룻
		// *
		// *  @brief ��ѯԽ�������״̬
		// *
		// *  \~english
		// *
		// *  get Vietnamese status:00 00��close�� 01 00��ASCII�� 02 00��UTF-8��
		// *
		// *  @brief get Vietnamese status
		// *
		// }
		//- (void)cpclGetVietnameseTransformStatus;
		procedure cpclGetVietnameseTransformStatus;cdecl;
		
		
		////#pragma mark - RFID
		///////////////////////////////////////////////////////////////////////
		/////////////////////////RFID ���忴Э��////////////////////////////////////
		///////////////////////////////////////////////////////////////////////
		
		//{!
		// *  \~chinese
		// *
		// *  У׼RFID
		// *
		// *  @brief RFID У׼
		// *
		// *  \~english
		// *
		// *  Calibration RFID
		// *
		// *  @brief RFID Calibration
		// *
		// }
		//- (void)rfidCalibrate;
		procedure rfidCalibrate;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  д����ȡRFIDʱ��������Ҫ��������ӿ�
		// *
		// *  @brief RFID ��ӡ
		// *
		// *  \~english
		// *
		// *  When writing or reading RFID, you first need to call this interface
		// *
		// *  @brief RFID Print
		// *
		// }
		//- (void)rfidPrint;
		procedure rfidPrint;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  д��RFID�����ݳ��ȷ�Χ�ο��洢����ö��,���ݳ��ȳ��������ڴ��С���򷵻�false
		// *
		// *  @brief д��RFID��ǩ
		// *
		// *  @param content        д�������
		// *  @param beginAddr      ��ʼλ�ã�Ĭ����0; EPC��ʱ��Ĭ��Ϊ2
		// *  @param memory         �洢����
		// 
		// *
		// *  \~english
		// *
		// *  Write RFID,The data length range refers to the storage area enumeration��Returns false if the data length exceeds the region memory size
		// *
		// *  @brief Write RFID label
		// *
		// *  @param content        data
		// *  @param beginAddr      Start position, default is 0; For EPC, default is 2
		// *  @param memory         memory area
		// *
		// }
		//- (BOOL)rfidWriteData:(NSString *_Nonnull)content beginAddr:(NSInteger)beginAddr memory:(PTCPCLRFIDMemory)memory;
		[MethodName('rfidWriteData:beginAddr:memory:')]
		function rfidWriteDatabeginAddrmemory(content:{_Nonnull}NSString;beginAddr:NSInteger;memory:PTCPCLRFIDMemory):Boolean;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ȡRFID��ǩ;��ȡ�ĳ��ȿ�ֱ������������ֵ;TID����ֻ������д
		// *
		// *  @brief ��ȡRFID��ǩ
		// *
		// *  @param length         ��ȡ�����ݳ��ȣ�ֻ����ż��
		// *  @param beginAddr      ��ʼλ�ã�Ĭ����0; EPC��ʱ��Ĭ��Ϊ2
		// *  @param memory         �洢����
		// *
		// *  \~english
		// *
		// *  Write RFID;The data length range refers to the storage area enumeration;The TID section is read-only and not writable
		// *
		// *  @brief Write RFID��The length of the read can be used directly by the maximum value of the region
		// *
		// *  @param length         The length of the data read can only be an even number
		// *  @param beginAddr      Start position, default is 0; For EPC, default is 2
		// *  @param memory         memory area
		// *
		// }
		//- (void)rfidReadDataWithLength:(NSInteger)length beginAddr:(NSInteger)beginAddr memory:(PTCPCLRFIDMemory)memory;
		[MethodName('rfidReadDataWithLength:beginAddr:memory:')]
		procedure rfidReadDataWithLengthbeginAddrmemory(length:NSInteger;beginAddr:NSInteger;memory:PTCPCLRFIDMemory);cdecl;
		
		
		
		
		
	end;
	
	PTCommandCPCLClass=interface(NSObjectClass)//
	['{17A41CE1-B1E8-4E31-8548-7002B346999B}']
	end;
	
	TPTCommandCPCL=class(TOCGenericImport<PTCommandCPCLClass,PTCommandCPCL>)
	end;
	
	
	
	
	
	
	
	
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTCommandCPCL_FakeLoader : PTCommandCPCL; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTCommandCPCL';
{$O+}



{$ENDIF}

end.

