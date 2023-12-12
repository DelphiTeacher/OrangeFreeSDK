//{!
// *  \~chinese
// *  @header PTCommandTSPL.h
// *  @abstract TSPLָ��
// *
// *  \~english
// *  @header PTCommandTSPL.h
// *  @abstract TSPL Command
// }

unit iOSApi.PTCommandTSPL;

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

	
	//{!
	// *  \~chinese
	// *  ��ӡ�ٶ�
	// *
	// *  \~english
	// *  Print speed
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCPrintSpeed) {
	    //PTTSCPrintSpeed1        = 1,
	    //PTTSCPrintSpeed2        = 2,
	    //PTTSCPrintSpeed3        = 3,
	    //PTTSCPrintSpeed4        = 4,
	    //PTTSCPrintSpeed5        = 5,
	    //PTTSCPrintSpeed6        = 6,
	    //PTTSCPrintSpeed10       = 10,
	    //PTTSCPrintSpeed12       = 12
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCPrintSpeed) {
	PTTSCPrintSpeed_=(
	//(NSUInteger, PTTSCPrintSpeed) {
	    PTTSCPrintSpeed1        = 1,
	    PTTSCPrintSpeed2        = 2,
	    PTTSCPrintSpeed3        = 3,
	    PTTSCPrintSpeed4        = 4,
	    PTTSCPrintSpeed5        = 5,
	    PTTSCPrintSpeed6        = 6,
	    PTTSCPrintSpeed10       = 10,
	    PTTSCPrintSpeed12       = 12
	);
	PTTSCPrintSpeed=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ӡŨ��
	// *
	// *  \~english
	// *  Print density
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCPrintDensity) {
	    //PTTSCPrintDensity0        = 0,
	    //PTTSCPrintDensity1        = 1,
	    //PTTSCPrintDensity2        = 2,
	    //PTTSCPrintDensity3        = 3,
	    //PTTSCPrintDensity4        = 4,
	    //PTTSCPrintDensity5        = 5,
	    //PTTSCPrintDensity6        = 6,  ///< default
	    //PTTSCPrintDensity7        = 7,
	    //PTTSCPrintDensity8        = 8,
	    //PTTSCPrintDensity9        = 9,
	    //PTTSCPrintDensity10       = 10,
	    //PTTSCPrintDensity11       = 11,
	    //PTTSCPrintDensity12       = 12,
	    //PTTSCPrintDensity13       = 13,
	    //PTTSCPrintDensity14       = 14,
	    //PTTSCPrintDensity15       = 15
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCPrintDensity) {
	PTTSCPrintDensity_=(
	//(NSUInteger, PTTSCPrintDensity) {
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
	);
	PTTSCPrintDensity=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ӡ����
	// *
	// *  \~english
	// *  DIRECTION
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCPrintDirection) {
	    
	    ///*! \~chinese �������� \~english normal */
	    //PTTSCPrintDirectionNormal    = 0,
	    
	    ///*! \~chinese ���� \~english Reverse */
	    //PTTSCPrintDirectionReverse   = 1
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCPrintDirection) {
	PTTSCPrintDirection_=(
	//(NSUInteger, PTTSCPrintDirection) {
	//    /*! \~chinese �������� \~english normal */
	    PTTSCPrintDirectionNormal    = 0,
	//    /*! \~chinese ���� \~english Reverse */
	    PTTSCPrintDirectionReverse   = 1
	);
	PTTSCPrintDirection=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ӡģʽ
	// *
	// *  \~english
	// *  Print Mode
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCPrintStyle) {
	    
	    ///*! \~chinese ����ģʽ \~english normal */
	    //PTTSCPrintStyleNormal    = 0,
	    ///*! \~chinese ����ģʽ \~english Mirror */
	    //PTTSCPrintStyleMirror    = 1
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCPrintStyle) {
	PTTSCPrintStyle_=(
	//(NSUInteger, PTTSCPrintStyle) {
	//    /*! \~chinese ����ģʽ \~english normal */
	    PTTSCPrintStyleNormal    = 0,
	//    /*! \~chinese ����ģʽ \~english Mirror */
	    PTTSCPrintStyleMirror    = 1
	);
	PTTSCPrintStyle=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  �����ַ�������
	// *
	// *  \~english
	// *  International character
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCCharacterStyle) {
	    //PTTSCCharacterStyleUSA                = 0,
	    //PTTSCCharacterStyleBritish,
	    //PTTSCCharacterStyleGerman,
	    //PTTSCCharacterStyleFrench,
	    //PTTSCCharacterStyleDanish,
	    //PTTSCCharacterStyleItalian,
	    //PTTSCCharacterStyleSpanish,
	    //PTTSCCharacterStyleSwedish,
	    //PTTSCCharacterStyleSwiss,
	    //PTTSCCharacterStyleUnitedStates,
	    //PTTSCCharacterStyleMultilingual,
	    //PTTSCCharacterStyleSlavic,
	    //PTTSCCharacterStylePortuguese,
	    //PTTSCCharacterStyleCanadianOrFrench,
	    //PTTSCCharacterStyleNordic,
	    //PTTSCCharacterStyleTurkish,
	    //PTTSCCharacterStyleWindowsCentralEurope,
	    //PTTSCCharacterStyleWindowsLatin,
	    //PTTSCCharacterStyleWindowsGreek,
	    //PTTSCCharacterStyleWindowsTurkish
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCCharacterStyle) {
	PTTSCCharacterStyle_=(
	//(NSUInteger, PTTSCCharacterStyle) {
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
	);
	PTTSCCharacterStyle=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  һά��������
	// *
	// *  \~english
	// *  Barcode type
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCBarcodeStyle) {
	    //PTTSCBarcodeStyle128     = 0,
	    //PTTSCBarcodeStyle128M,
	    //PTTSCBarcodeStyleEAN128,
	    //PTTSCBarcodeStyle25,
	    //PTTSCBarcodeStyle25C,
	    //PTTSCBarcodeStyle39,
	    //PTTSCBarcodeStyle39C,
	    //PTTSCBarcodeStyle93,
	    //PTTSCBarcodeStyleEAN13,
	    //PTTSCBarcodeStyleEAN132,
	    //PTTSCBarcodeStyleEAN135,
	    //PTTSCBarcodeStyleEAN8,
	    //PTTSCBarcodeStyleEAN82,
	    //PTTSCBarcodeStyleEAN85,
	    //PTTSCBarcodeStyleCODA,
	    //PTTSCBarcodeStylePOST,
	    //PTTSCBarcodeStyleUPCA,
	    //PTTSCBarcodeStyleUPCA2,
	    //PTTSCBarcodeStyleUPCA5,
	    //PTTSCBarcodeStyleUPCE,
	    //PTTSCBarcodeStyleUPCE2,
	    //PTTSCBarcodeStyleUPCE5,
	    //PTTSCBarcodeStyleCPOST,
	    //PTTSCBarcodeStyleMSI,
	    //PTTSCBarcodeStyleMSIC,
	    //PTTSCBarcodeStylePLESSY,
	    //PTTSCBarcodeStyleITF14,
	    //PTTSCBarcodeStyleEAN14,
	    //PTTSCBarcodeStyle11
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCBarcodeStyle) {
	PTTSCBarcodeStyle_=(
	//(NSUInteger, PTTSCBarcodeStyle) {
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
	);
	PTTSCBarcodeStyle=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  �Ƿ��ʶ��
	// *
	// *  \~english
	// *  Readable
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCBarcodeReadbleStyle) {
	    
	    ///*! \~chinese ����ʶ�� \~english not */
	    //PTTSCBarcodeReadbleStyleNot    = 0,
	    
	    ///*! \~chinese ��ʶ�� \~english human */
	    //PTTSCBarcodeReadbleStyleHuman
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCBarcodeReadbleStyle) {
	PTTSCBarcodeReadbleStyle_=(
	//(NSUInteger, PTTSCBarcodeReadbleStyle) {
	//    /*! \~chinese ����ʶ�� \~english not */
	    PTTSCBarcodeReadbleStyleNot    = 0,
	//    /*! \~chinese ��ʶ�� \~english human */
	    PTTSCBarcodeReadbleStyleHuman
	);
	PTTSCBarcodeReadbleStyle=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ת�Ƕ�
	// *
	// *  \~english
	// *  Rotation
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCStyleRotation) {
	    
	    ///*! \~chinese ������ӡ \~english normal */
	    //PTTSCStyleRotation0     = 0,
	    ///*! \~chinese ˳ʱ����ת90�� \~english rotate 90 degrees (clockwise) */
	    //PTTSCStyleRotation90    = 90,
	    ///*! \~chinese 180����ת \~english inverted 180 degrees */
	    //PTTSCStyleRotation180   = 180,
	    ///*! \~chinese 270����ת \~english read from bottom up, 270 degrees */
	    //PTTSCStyleRotation270   = 270
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCStyleRotation) {
	PTTSCStyleRotation_=(
	//(NSUInteger, PTTSCStyleRotation) {
	//    /*! \~chinese ������ӡ \~english normal */
	    PTTSCStyleRotation0     = 0,
	//    /*! \~chinese ˳ʱ����ת90�� \~english rotate 90 degrees (clockwise) */
	    PTTSCStyleRotation90    = 90,
	//    /*! \~chinese 180����ת \~english inverted 180 degrees */
	    PTTSCStyleRotation180   = 180,
	//    /*! \~chinese 270����ת \~english read from bottom up, 270 degrees */
	    PTTSCStyleRotation270   = 270
	);
	PTTSCStyleRotation=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  �����խ������
	// *
	// *  \~english
	// *  The ratio of wide to narrow bars
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCBarcodeRatio) {
	    //PTTSCBarcodeRatio1 = 1,     ///< 1:1
	    //PTTSCBarcodeRatio2,         ///< 1:2
	    //PTTSCBarcodeRatio3,         ///< 1:3
	    //PTTSCBarcodeRatio4,         ///< 2:5
	    //PTTSCBarcodeRatio5          ///< 3:7
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCBarcodeRatio) {
	PTTSCBarcodeRatio_=(
	//(NSUInteger, PTTSCBarcodeRatio) {
	    PTTSCBarcodeRatio1 = 1,     ///< 1:1
	    PTTSCBarcodeRatio2,         ///< 1:2
	    PTTSCBarcodeRatio3,         ///< 1:3
	    PTTSCBarcodeRatio4,         ///< 2:5
	    PTTSCBarcodeRatio5          ///< 3:7
	);
	PTTSCBarcodeRatio=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ά�����ȼ�
	// *
	// *  \~english
	// *  Error correction recovery level
	// }
	//typedef NS_ENUM(UInt8, PTTSCQRcodeEcclevel) {
	    
	    ///*! \~chinese ?�ܶȼ��� \~english high density level level */
	    //PTTSCQRcodeEcclevelL    = 'L',
	    
	    ///*! \~chinese ��׼���� \~english standard level */
	    //PTTSCQRcodeEcclevelM    = 'M',
	    
	    ///*! \~chinese �߿ɿ����� \~english high reliability level */
	    //PTTSCQRcodeEcclevelQ    = 'Q',
	    
	    ///*! \~chinese ���߿ɿ����� \~english ultra-high reliability level */
	    //PTTSCQRcodeEcclevelH    = 'H'      
	//};
	//typedef NS_ENUM(UInt8, PTTSCQRcodeEcclevel) {
	PTTSCQRcodeEcclevel_=(
	//(UInt8, PTTSCQRcodeEcclevel) {
	//    /*! \~chinese ?�ܶȼ��� \~english high density level level */
	    PTTSCQRcodeEcclevelL,//    = 'L',
	//    /*! \~chinese ��׼���� \~english standard level */
	    PTTSCQRcodeEcclevelM,//    = 'M',
	//    /*! \~chinese �߿ɿ����� \~english high reliability level */
	    PTTSCQRcodeEcclevelQ,//    = 'Q',
	//    /*! \~chinese ���߿ɿ����� \~english ultra-high reliability level */
	    PTTSCQRcodeEcclevelH//,//    = 'H'
	);
	PTTSCQRcodeEcclevel=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ά���С
	// *
	// *  \~english
	// *  cell width
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCQRcodeWidth) {
	    //PTTSCQRcodeWidth1      = 1,
	    //PTTSCQRcodeWidth2,
	    //PTTSCQRcodeWidth3,
	    //PTTSCQRcodeWidth4,
	    //PTTSCQRcodeWidth5,
	    //PTTSCQRcodeWidth6,
	    //PTTSCQRcodeWidth7,
	    //PTTSCQRcodeWidth8,
	    //PTTSCQRcodeWidth9,
	    //PTTSCQRcodeWidth10
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCQRcodeWidth) {
	PTTSCQRcodeWidth_=(
	//(NSUInteger, PTTSCQRcodeWidth) {
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
	);
	PTTSCQRcodeWidth=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ά��ģʽ
	// *
	// *  \~english
	// *  qrcode mode
	// }
	//typedef NS_ENUM(UInt8, PTTSCQRCodeMode) {
	    ///*! \~chinese �Զ� \~english auto */
	    //PTTSCQRCodeModeAuto    = 'A',  
	    
	    ///*! \~chinese �ֶ� \~english Manual */
	    //PTTSCQRCodeModeManual  = 'M'
	//};
	//typedef NS_ENUM(UInt8, PTTSCQRCodeMode) {
	PTTSCQRCodeMode_=(
	//(UInt8, PTTSCQRCodeMode) {
	//    /*! \~chinese �Զ� \~english auto */
	    PTTSCQRCodeModeAuto,//    = 'A',
	//    /*! \~chinese �ֶ� \~english Manual */
	    PTTSCQRCodeModeManual//,//  = 'M'
	);
	PTTSCQRCodeMode=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ά��ģ��
	// *
	// *  \~english
	// *  qrcode model
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCQRCodeModel) {
	    
	    ///*! \~chinese Ĭ��ֵ��ԭʼ�汾 \~english (default), original version */
	    //PTTSCQRCodeModelM1    = 0,
	    
	    ///*! \~chinese ��ǿ�汾 \~english enhanced version */
	    //PTTSCQRCodeModelM2    = 1
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCQRCodeModel) {
	PTTSCQRCodeModel_=(
	//(NSUInteger, PTTSCQRCodeModel) {
	//    /*! \~chinese Ĭ��ֵ��ԭʼ�汾 \~english (default), original version */
	    PTTSCQRCodeModelM1    = 0,
	//    /*! \~chinese ��ǿ�汾 \~english enhanced version */
	    PTTSCQRCodeModelM2    = 1
	);
	PTTSCQRCodeModel=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  ��ά��mask
	// *
	// *  \~english
	// *  qrcode mask
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCQRcodeMask) {
	    //PTTSCQRcodeMaskS0      = 1,
	    //PTTSCQRcodeMaskS1,
	    //PTTSCQRcodeMaskS2,
	    //PTTSCQRcodeMaskS3,
	    //PTTSCQRcodeMaskS4,
	    //PTTSCQRcodeMaskS5,
	    //PTTSCQRcodeMaskS6,
	    //PTTSCQRcodeMaskS7,
	    //PTTSCQRcodeMaskS8
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCQRcodeMask) {
	PTTSCQRcodeMask_=(
	//(NSUInteger, PTTSCQRcodeMask) {
	    PTTSCQRcodeMaskS0      = 1,
	    PTTSCQRcodeMaskS1,
	    PTTSCQRcodeMaskS2,
	    PTTSCQRcodeMaskS3,
	    PTTSCQRcodeMaskS4,
	    PTTSCQRcodeMaskS5,
	    PTTSCQRcodeMaskS6,
	    PTTSCQRcodeMaskS7,
	    PTTSCQRcodeMaskS8
	);
	PTTSCQRcodeMask=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  λͼģʽ
	// *
	// *  \~english
	// *  qrcode mask
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCBitmapMode) {
	    
	    //PTTSCBitmapModeOVERWRITE            = 0,
	    //PTTSCBitmapModeOR                   = 1,
	    //PTTSCBitmapModeXOR                  = 2,
	    
	    ///*! *\~chinese ѹ��ģʽ�����ݾɵĹ̼����µĹ̼��Ѿ����� *\~english Compatible with old models,New firmware has been deprecated */
	    //PTTSCBitmapModeCompress             = 3,
	    //PTTSCBitmapModeOVERWRITECompress    = 16,
	    //PTTSCBitmapModeORCompress           = 17,
	    //PTTSCBitmapModeXORCompress          = 18
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCBitmapMode) {
	PTTSCBitmapMode_=(
	//(NSUInteger, PTTSCBitmapMode) {
	    PTTSCBitmapModeOVERWRITE            = 0,
	    PTTSCBitmapModeOR                   = 1,
	    PTTSCBitmapModeXOR                  = 2,
	//    /*! *\~chinese ѹ��ģʽ�����ݾɵĹ̼����µĹ̼��Ѿ����� *\~english Compatible with old models,New firmware has been deprecated */
	    PTTSCBitmapModeCompress             = 3,
	    PTTSCBitmapModeOVERWRITECompress    = 16,
	    PTTSCBitmapModeORCompress           = 17,
	    PTTSCBitmapModeXORCompress          = 18
	);
	PTTSCBitmapMode=Integer;
	
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  �ı���������(����ʸ���ֿ�Ļ���),����ֻ��ѡ9
	// *
	// *  \~english
	// *  Text font type��for vector and ��chinese onlt select 9
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCTextVectorFontStyle) {
	    
	    //PTTSCTextVectorFontStyle0      = 0,   ///< 8x12��not adjuset
	    //PTTSCTextVectorFontStyle1,            ///< 8x12
	    //PTTSCTextVectorFontStyle2,            ///< 12x20
	    //PTTSCTextVectorFontStyle3,            ///< 16x24
	    //PTTSCTextVectorFontStyle4,            ///< 24x32
	    //PTTSCTextVectorFontStyle5,            ///< 32x48
	    //PTTSCTextVectorFontStyle6,            ///< 14x19
	    //PTTSCTextVectorFontStyle7,            ///< 21x27
	    //PTTSCTextVectorFontStyle8,            ///< 14x25
	    //PTTSCTextVectorFontStyle9             ///< vector font,for chinese
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCTextVectorFontStyle) {
	PTTSCTextVectorFontStyle_=(
	//(NSUInteger, PTTSCTextVectorFontStyle) {
	    PTTSCTextVectorFontStyle0      = 0,   ///< 8x12��not adjuset
	    PTTSCTextVectorFontStyle1,            ///< 8x12
	    PTTSCTextVectorFontStyle2,            ///< 12x20
	    PTTSCTextVectorFontStyle3,            ///< 16x24
	    PTTSCTextVectorFontStyle4,            ///< 24x32
	    PTTSCTextVectorFontStyle5,            ///< 32x48
	    PTTSCTextVectorFontStyle6,            ///< 14x19
	    PTTSCTextVectorFontStyle7,            ///< 21x27
	    PTTSCTextVectorFontStyle8,            ///< 14x25
	    PTTSCTextVectorFontStyle9             ///< vector font,for chinese
	);
	PTTSCTextVectorFontStyle=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  �ı���������,֧����Ӣ��
	// *
	// *  \~english
	// *  Text font type,Support Chinese and English
	// }
	//typedef NS_ENUM(NSUInteger, PTTSCTextFontStyle) {
	    //PTTSCTextFontStyle0      = 0,   ///< chinese:24x24   english:12x24
	    //PTTSCTextFontStyle1,            ///< chinese:16x16   english:8x16
	//};
	//typedef NS_ENUM(NSUInteger, PTTSCTextFontStyle) {
	PTTSCTextFontStyle_=(
	//(NSUInteger, PTTSCTextFontStyle) {
	    PTTSCTextFontStyle0      = 0,   ///< chinese:24x24   english:12x24
	    PTTSCTextFontStyle1//,            ///< chinese:16x16   english:8x16
	);
	PTTSCTextFontStyle=Integer;
	
	
	
	
	
	//{!
	// *  \~chinese
	// *  DMATRIX��ά���ģ��ߴ�
	// *
	// *  \~english
	// *  Module size for DMATRIX 2D bar code
	// }
	//typedef NS_ENUM(UInt8, PTTSCDMATRIXSize) {
	    //PTTSCDMATRIXSizeX6    = 0,
	    //PTTSCDMATRIXSizeX8
	//};
	//typedef NS_ENUM(UInt8, PTTSCDMATRIXSize) {
	PTTSCDMATRIXSize_=(
	//(UInt8, PTTSCDMATRIXSize) {
	    PTTSCDMATRIXSizeX6    = 0,
	    PTTSCDMATRIXSizeX8
	);
	PTTSCDMATRIXSize=Integer;
	
	
	
	
	
	
	//@interface PTCommandTSPL : NSObject
	//@interface PTCommandTSPL : NSObject
	PTCommandTSPL=interface(NSObject)//
	['{82EF147A-9B61-4B80-9378-1354E8C4B14D}']
		
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
		//@property(strong,nonatomic,readwrite) NSMutableData *cmdData;
		function cmdData:NSMutableData;cdecl;
		procedure setCmdData(cmdData:NSMutableData);cdecl;
		
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
		
		
		///////////////////////////////////////////////////////////////////////
		///*********************  Setup and System Commands ********************/
		///////////////////////////////////////////////////////////////////////
		//{!
		// *  \~chinese
		// *
		// *  �Լ죬��ӡ��ӡ����Ϣ.
		// *
		// *  @brief ��ӡ�Լ�ҳ
		// *
		// *  \~english
		// *
		// *  printer Print self-test message.
		// *
		// *  @brief View Printer Message
		// }
		//- (void)selfTest;
		procedure selfTest;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ָ��.
		// *
		// *  @brief ƴ��ָ��
		// *  @param cmd ָ���ı�.ʹ��encoding���Խ��б���.
		// *
		// *  \~english
		// *
		// *  append command.
		// *
		// *  @brief Append Command
		// *  @param cmd command text. encode with encoding property.
		// *
		// }
		//- (void)appendCommand:(NSString *)cmd;
		procedure appendCommand(cmd:NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡֽ�ŷ�Χ��С,�����Ǻ���.1mm == 8 dot
		// *
		// *  @brief ���ô�ӡ����
		// *  @param label_width     ��ǩֽ�Ŀ��
		// *  @param label_height    ��ǩֽ�ĸ߶�
		// *
		// *  \~english
		// *
		// *  This command defines the label width and length(mm).1mm == 8 dot
		// *
		// *  @brief Set Print Area
		// *  @param label_width     Label width
		// *  @param label_height    Label length
		// *
		// }
		//- (void)setPrintAreaSizeWithWidth:(NSInteger)label_width
		                           //height:(NSInteger)label_height;
		 //- (void)setPrintAreaSizeWithWidth:(NSInteger)label_width                            height:(NSInteger)label_height;
		[MethodName('setPrintAreaSizeWithWidth:height:')]
		procedure setPrintAreaSizeWithWidthheight(label_width:NSInteger;label_height:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ñ�ǩֽ�ļ��,�����Ǻ���.
		// *
		// *  @brief ���ñ�ǩֽ�ļ��
		// *  @param distance     ���ű�ǩ���м�Ĵ�ֱ����,0 �� distance �� 25.4 (mm)
		// *  @param offset       ��ֱ����ƫ��
		// *
		// *  \~english
		// *
		// *  This command sets the distance between two labels(mm).
		// *
		// *  @brief Set Label Distance
		// *  @param distance     The gap distance between two labels,0 �� distance �� 25.4 (mm)
		// *  @param offset       The offset distance of the gap offset �� label length (mm)
		// *
		// }
		//- (void)setGapWithDistance:(NSInteger)distance
		                    //offset:(NSInteger)offset;
		 //- (void)setGapWithDistance:(NSInteger)distance                     offset:(NSInteger)offset;
		[MethodName('setGapWithDistance:offset:')]
		procedure setGapWithDistanceoffset(distance:NSInteger;offset:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ú��ߵĸ߶Ⱥ��û��Զ���Ķ���ı�ǩ��ֽ����(����).(height,offset Ϊ0,0��ʾ������ǩ)
		// *
		// *  @brief ���ý�ֽ����
		// *  @param height       ���ߵĸ߶� 0~25.4 mm
		// *  @param offset       ����ƫ���� 0~label length
		// *
		// *  \~english
		// *
		// *  This command sets the height of the black line and the user-defined extra label feeding length each form feed takes(mm).(height,offset is 0,0 : Continuous label)
		// *
		// *  @brief Bline
		// *  @param height       The height of black line either in mm. 0 �� m �� 25.4 (mm)
		// *  @param offset       The extra label feeding length. 0 �� offset �� label length
		// *
		// }
		//- (void)setBlineWithHeight:(NSInteger)height
		                    //offset:(NSInteger)offset;
		 //- (void)setBlineWithHeight:(NSInteger)height                     offset:(NSInteger)offset;
		[MethodName('setBlineWithHeight:offset:')]
		procedure setBlineWithHeightoffset(height:NSInteger;offset:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡ����λ�������ֽ���ٺ���.
		// *
		// *  @brief ��λ����ֽ
		// *  @param distance     ֽ����ֽ�ľ���,0 �� distance �� 25.4 (mm)
		// *
		// *  \~english
		// *
		// *  This command defines the selective, extra label feeding length(mm).
		// *
		// *  @brief Offset Length
		// *  @param distance     The offset distance,0 �� distance �� 25.4 (mm)
		// *
		// }
		//- (void)setOffsetWithDistance:(NSInteger)distance;
		procedure setOffsetWithDistance(distance:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ����ǩ��λ����һ����ǩ����ʼ��.
		// *
		// *  @brief ��λ
		// *  \~english
		// *
		// *  This command feeds label to the beginning of next label.
		// *
		// *  @brief Form Feed
		// }
		//- (void)feedToNextLabel;
		procedure feedToNextLabel;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ñ�ǩ��ֽ�ĳ���(dots).
		// *
		// *  @brief ���ñ�ǩ��ֽ�ĳ���
		// *  @param length     ֽ����ֽ�ľ���,1 �� length �� 9999
		// *
		// *  \~english
		// *
		// *  This command feeds label with the specified length.
		// *
		// *  @brief Feed Length
		// *  @param length     The length is specified by dot. 1 �� length �� 9999
		// *
		// }
		//- (void)setFeedLength:(NSInteger)length;
		procedure setFeedLength(length:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡ�ٶ�.
		// *
		// *  @brief ���ô�ӡ�ٶ�
		// *  @param speed     ��ӡ�ٶ�
		// *
		// *  \~english
		// *
		// *  This command defines the print speed.
		// *
		// *  @brief Print Speed
		// *  @param speed     Printing speed in inch per second
		// *
		// }
		//- (void)setPrintSpeed:(PTTSCPrintSpeed)speed;
		procedure setPrintSpeed(speed:PTTSCPrintSpeed);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡŨ��.
		// *
		// *  @brief ���ô�ӡŨ��
		// *  @param density     ��ӡŨ��
		// *
		// *  \~english
		// *
		// *  This command sets the printing darkness.
		// *
		// *  @brief Print Density
		// *  @param density     0: specifies the lightest level,15: specifies the darkest level
		// *
		// }
		//- (void)setPrintDensity:(PTTSCPrintDensity)density;
		procedure setPrintDensity(density:PTTSCPrintDensity);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡ�ķ���;���.
		// *
		// *  @brief ���ô�ӡ�ķ���;���
		// *  @param direction    �������߷����ӡ
		// *  @param mirror       �������߾���
		// *
		// *  \~english
		// *
		// *  This command defines the printout direction and mirror image.
		// *
		// *  @brief Print Direction And Mirror
		// *  @param direction    normal or reverse
		// *  @param mirror       normal or mirror
		// *
		// }
		//- (void)setPrintDirection:(PTTSCPrintDirection)direction mirror:(PTTSCPrintStyle)mirror;
		[MethodName('setPrintDirection:mirror:')]
		procedure setPrintDirectionmirror(direction:PTTSCPrintDirection;mirror:PTTSCPrintStyle);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ñ�ǩ�Ĳο����.
		// *
		// *  @brief ���ñ�ǩ�Ĳο����
		// *  @param x_pos    ˮƽ��������꣬�Ե�Ϊ��λ
		// *  @param y_pos    ��ֱ��������꣬�Ե�Ϊ��λ
		// *
		// *  \~english
		// *
		// *  This command defines the reference point of the label.
		// *
		// *  @brief Set Label Reference Point
		// *  @param x_pos    Horizontal coordinate (in dots)
		// *  @param y_pos    Vertical coordinate (in dots)
		// *
		// }
		//- (void)setReferenceXPos:(NSInteger)x_pos
		                    //yPos:(NSInteger)y_pos;
		 //- (void)setReferenceXPos:(NSInteger)x_pos                     yPos:(NSInteger)y_pos;
		[MethodName('setReferenceXPos:yPos:')]
		procedure setReferenceXPosyPos(x_pos:NSInteger;y_pos:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ù����ַ�������.
		// *
		// *  @brief ���ù����ַ�������
		// *  @param codepage     �ַ�������
		// *
		// *  \~english
		// *
		// *  This command defines the code page of international character set.
		// *
		// *  @brief International Character Set
		// *  @param codepage     Name or number of code page
		// *
		// }
		//- (void)setCodePage:(PTTSCCharacterStyle)codepage;
		procedure setCodePage(codepage:PTTSCCharacterStyle);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ͼ�񻺳���.
		// *
		// *  @brief ���ͼ�񻺳���
		// *  \~english
		// *
		// *  This command clears the image buffer.
		// *
		// *  @brief Clear Buffer
		// }
		//- (void)setCLS;
		procedure setCLS;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ֽ.
		// *
		// *  @brief ��ֽ
		// *  @param distance     ��ֽ�ľ��룬�Ե�Ϊ��λ(1,9999)
		// *
		// *  \~english
		// *
		// *  This command feeds the label in reverse. The length is specified by dot.
		// *
		// *  @brief Feeds Label In Reverse
		// *  @param distance     unit: dot,(1,9999)
		// *
		// }
		//- (void)setBackFeed:(NSInteger)distance;
		procedure setBackFeed(distance:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ֽ.
		// *
		// *  @brief ��ֽ
		// *  @param distance     ��ֽ�ľ��룬�Ե�Ϊ��λ(1,9999)
		// *
		// *  \~english
		// *
		// *  This command feeds the label in reverse. The length is specified by dot.
		// *
		// *  @brief Feeds Label In Reverse
		// *  @param distance     unit: dot,(1,9999)
		// *
		// }
		//- (void)setBackUP:(NSInteger)distance;
		procedure setBackUP(distance:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ñ�ǩ��λ���ڲ�������ȷ�������.
		// *
		// *  @brief ���ñ�ǩ��λ���
		// *  \~english
		// *
		// *  This command will feed label until the internal sensor has determined the origin.
		// *
		// *  @brief Feed label until the internal sensor has determined the origin
		// }
		//- (void)setHome;
		procedure setHome;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ����.
		// *
		// *  @brief ��ʼ��ӡ�����ô�ӡ����
		// *  @param sets      ��ӡ����
		// *  @param copies    ÿ�ݴ�ӡ������
		// *
		// *  \~english
		// *
		// *  This command prints the label format currently stored in the image buffer.
		// *
		// *  @brief Begin Print,Set Print Copies
		// *  @param sets     Specifies how many sets of labels will be printed.
		// *  @param copies   Specifies how many copies should be printed for each particular label set.
		// *
		// }
		//- (void)printWithSets:(NSInteger)sets copies:(NSInteger)copies;
		[MethodName('printWithSets:copies:')]
		procedure printWithSetscopies(sets:NSInteger;copies:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���Ʒ�������Ƶ�ʣ�������10�׵�����.
		// *
		// *  @brief ���Ʒ�������Ƶ��
		// *  @param level        ����0~9
		// *  @param interval     ʱ�䳤��1~4095
		// *
		// *  \~english
		// *
		// *  This command controls the sound frequency of the beeper. There are 10 levels of sounds.
		// *
		// *  @brief Control Frequency
		// *  @param level        Sound level: 0~9
		// *  @param interval     Sound interval: 1~4095
		// *
		// }
		//- (void)setSoundWithLevel:(NSInteger)level interval:(NSInteger)interval;
		[MethodName('setSoundWithLevel:interval:')]
		procedure setSoundWithLevelinterval(level:NSInteger;interval:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ������ֽ.
		// *  @brief ������ֽ
		// *
		// *  \~english
		// *
		// *  This command activates the cutter to immediately cut the labels without back feeding the label.
		// *
		// *  @brief Set Cutter
		// }
		//- (void)setCut;
		procedure setCut;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡ����ֽʱ,���޷���ȷ�ļ�϶λ�ã���ᷢ����������ֹͣ��ֽ.
		// *
		// *  @brief ���ý�ֽ����
		// *  @param max_len    ������������󳤶�
		// *
		// *  \~english
		// *
		// *  If the gap sensor is not set to a suitable sensitivity while feeding labels, the printer will not be able to locate the correct position of the gap.
		// *
		// *  @brief Set Feed Length
		// *  @param max_len     The maximum length for sensor detecting.
		// *
		// }
		//- (void)setLimitFeed:(NSInteger)max_len;
		procedure setLimitFeed(max_len:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��������Ӵ�.
		// *
		// *  @brief ��������Ӵ�
		// *  @param bold     true:�Ӵ�  false:���Ӵ�
		// *
		// *  \~english
		// *
		// *  Set font bold.
		// *
		// *  @brief Font Bold
		// *  @param bold     true:bold  false:not bold
		// *
		// }
		//- (void)setFontBold:(BOOL)bold;
		procedure setFontBold(bold:Boolean);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ش�ӡ״̬�ص�.
		// *
		// *  @brief �Զ��ش�״̬
		// *  @note ����֮��ÿ��ӡһ�Ŷ��᷵��10���ֽڵ����ݣ���ʽ��ָ��ͷ4���ֽ�(aa bb cc dd) + 4���ֽڵĴ�ӡ����(�ӿ������رյĴ�ӡ������) + 1���ֽڵ�״̬ + ������00,
		//    �����������ݣ���һ�α�ʾ���ؿɻ�ȡ��ӡ��������״̬���ڶ��α�ʾ��ӡ����
		//    ���磺1.aabbccdd 03000000 2000
		//         2.aabbccdd ffffffff 0000 -> ��ӡ����
		//           aabbccdd 00000000 0000 -> �ر��Զ��ش�
		// *  @param status     true:����  false:�ر�
		// *
		// *  \~english
		// *
		// *  Turn on/off print status callback.
		// *
		// *  @brief Automatic Return Status
		// *  @note Returns 10 bytes of data,4-byte instruction header(aa bb cc dd) + 4 bytes of printed sheets + 1 byte status + Terminator(00),Returns twice the data, the first time to return to get the total number of prints and the status, the second time to end the end of printing
		// 
		// *  @param status     true:open  false:close
		// *
		// }
		//- (void)setPrinterStateAutomaticBackWithStatus:(BOOL)status;
		procedure setPrinterStateAutomaticBackWithStatus(status:Boolean);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ȡ��ӡ��״̬.
		// *
		// *  @brief ��ȡ��ӡ��״̬
		// *
		//    | λ(����ֵ) |    ״̬      |
		//    | --------- | ----------- |
		//    |     0     |    ����      |
		//    |     1     |    ��ֽ      |
		//    |     2     |    ȱֽ      |
		//    |     3     |    ��̼��    |
		//    |     4     |    ��ͣ      |
		//    |     5     |    ��ӡ��    |
		//    |     6     |    ����      |
		//    |     7     |    ����      |
		// *
		// *  \~english
		// *
		// *  Get print status.
		// *  @brief Get Print Status
		// *
		//    | Bit(return value) |    Status     |
		//    | ----------------- | ------------- |
		//    |        0          | Head opened   |
		//    |        1          | Paper jam     |
		//    |        2          | Out of paper  |
		//    |        3          | Out of ribbon |
		//    |        4          | Pause         |
		//    |        5          | Printing      |
		//    |        6          | Cover opened  |
		//    |        7          | High          |
		// *
		// }
		//- (void)getPrinterStatus;
		procedure getPrinterStatus;cdecl;
		
		
		
		///////////////////////////////////////////////////////////////////////
		///*********************  Label Commands ********************/
		///////////////////////////////////////////////////////////////////////
		
		//{!
		// *  \~chinese
		// *
		// *  �ڱ�ǩ�ϻ�һ����.
		// *
		// *  @brief ����
		// *  @param x_pos    ���Ͻ�ˮƽ������ʼ�㣬�Ե��ʾ
		// *  @param y_pos    ���ϽǴ�ֱ������ʼ�㣬�Ե��ʾ
		// *  @param width    �߿��Ե��ʾ
		// *  @param height   �߸ߣ��Ե��ʾ
		// *
		// *  \~english
		// *
		// *  This command draws a bar on the label format.
		// *
		// *  @brief Draws Bar
		// *  @param x_pos    The upper left corner x-coordinate (in dots)
		// *  @param y_pos    The upper left corner y-coordinate (in dots)
		// *  @param width    Bar width (in dots)
		// *  @param height   Bar height (in dots)
		// *
		// }
		//- (void)drawBarWithXPos:(NSInteger)x_pos
		                   //yPos:(NSInteger)y_pos
		                  //width:(NSInteger)width
		                 //height:(NSInteger)height;
		 //- (void)drawBarWithXPos:(NSInteger)x_pos                    yPos:(NSInteger)y_pos                   width:(NSInteger)width                  height:(NSInteger)height;
		[MethodName('drawBarWithXPos:yPos:width:height:')]
		procedure drawBarWithXPosyPoswidthheight(x_pos:NSInteger;y_pos:NSInteger;width:NSInteger;height:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡһά����.
		// *
		// *  @brief ��ӡһά����
		// *  @param x_pos        ָ����ǩ���������x����
		// *  @param y_pos        ָ����ǩ���������y����
		// *  @param type         ��������
		// *  @param height       ����߶�
		// *  @param readable     �Ƿ�ɶ���0�����ɶ���1���ɶ�
		// *  @param rotation     ��ת�Ƕ�
		// *  @param ratio        �����խ������
		// *  @param context      ��������
		// *
		// *  \~english
		// *
		// *  This command prints 1D barcodes.
		// *
		// *  @brief 1D Barcodes
		// *  @param x_pos        Specify the x-coordinate of the bar code on the label
		// *  @param y_pos        Specify the y-coordinate of the bar code on the label
		// *  @param type         code type
		// *  @param height       Bar code height (in dots)
		// *  @param readable     0: not readable  1: human readable
		// *  @param rotation     Rotation
		// *  @param ratio        The ratio of wide to narrow bars
		// *  @param context      The maximum number of digits of bar code content
		// *
		// }
		//- (void)printBarcodeWithXPos:(NSInteger)x_pos
		                        //yPos:(NSInteger)y_pos
		                        //type:(PTTSCBarcodeStyle)type
		                      //height:(NSInteger)height
		                    //readable:(PTTSCBarcodeReadbleStyle)readable
		                    //rotation:(PTTSCStyleRotation)rotation
		                       //ratio:(PTTSCBarcodeRatio)ratio
		                     //context:(NSString *)context;
		 //- (void)printBarcodeWithXPos:(NSInteger)x_pos                         yPos:(NSInteger)y_pos                         type:(PTTSCBarcodeStyle)type                       height:(NSInteger)height                     readable:(PTTSCBarcodeReadbleStyle)readable                     rotation:(PTTSCStyleRotation)rotation                        ratio:(PTTSCBarcodeRatio)ratio                      context:(NSString *)context;
		[MethodName('printBarcodeWithXPos:yPos:type:height:readable:rotation:ratio:context:')]
		procedure printBarcodeWithXPosyPostypeheightreadablerotationratiocontext(x_pos:NSInteger;y_pos:NSInteger;_type:PTTSCBarcodeStyle;height:NSInteger;readable:PTTSCBarcodeReadbleStyle;rotation:PTTSCStyleRotation;ratio:PTTSCBarcodeRatio;context:NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ��ά����.
		// *
		// *  @brief ��ӡ��ά����
		// *  @param x_pos        ָ����ǩ�϶�ά���x����
		// *  @param y_pos        ָ����ǩ�϶�ά���y����
		// *  @param ecc_level    ����ȼ�
		// *  @param width        ��ά���С
		// *  @param mode         ��ά��ģʽ
		// *  @param rotation     ��ת�Ƕ�
		// *  @param model        ��ά��ģ��
		// *  @param mask         ��ά��mask
		// *  @param context      ��ά������
		// *
		// *  \~english
		// *
		// *  This command prints QR code.
		// *
		// *  @brief QR Code
		// *  @param x_pos        Specify the x-coordinate of the qr code on the label
		// *  @param y_pos        Specify the y-coordinate of the qr code on the label
		// *  @param ecc_level    Error correction recovery level
		// *  @param width        cell width
		// *  @param mode         mode
		// *  @param rotation     Rotation
		// *  @param model        model
		// *  @param mask         mask
		// *  @param context      qrcode context
		// *
		// }
		//- (void)printQRcodeWithXPos:(NSInteger)x_pos
		                       //yPos:(NSInteger)y_pos
		                   //eccLevel:(PTTSCQRcodeEcclevel)ecc_level
		                  //cellWidth:(PTTSCQRcodeWidth)width
		                       //mode:(PTTSCQRCodeMode)mode
		                   //rotation:(PTTSCStyleRotation)rotation
		                      //model:(PTTSCQRCodeModel)model
		                       //mask:(PTTSCQRcodeMask)mask
		                    //context:(NSString *)context;
		 //- (void)printQRcodeWithXPos:(NSInteger)x_pos                        yPos:(NSInteger)y_pos                    eccLevel:(PTTSCQRcodeEcclevel)ecc_level                   cellWidth:(PTTSCQRcodeWidth)width                        mode:(PTTSCQRCodeMode)mode                    rotation:(PTTSCStyleRotation)rotation                       model:(PTTSCQRCodeModel)model                        mask:(PTTSCQRcodeMask)mask                     context:(NSString *)context;
		[MethodName('printQRcodeWithXPos:yPos:eccLevel:cellWidth:mode:rotation:model:mask:context:')]
		procedure printQRcodeWithXPosyPoseccLevelcellWidthmoderotationmodelmaskcontext(x_pos:NSInteger;y_pos:NSInteger;ecc_level:PTTSCQRcodeEcclevel;width:PTTSCQRcodeWidth;mode:PTTSCQRCodeMode;rotation:PTTSCStyleRotation;model:PTTSCQRCodeModel;mask:PTTSCQRcodeMask;context:NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡͼƬ.
		// *
		// *  @brief ��ӡͼƬ
		// *  @param xpos        x��ʼ����
		// *  @param ypos        y��ʼ����
		// *  @param mode        ͼ��ģʽ
		// *  @param image       ��ӡ��ͼƬ
		// *  @param bitmapMode  ��ӡ��ͼƬģʽ
		// *  @param compress    ѹ��ģʽ
		// *
		// *  \~english
		// *
		// *  Print Bitmap.
		// *
		// *  @brief Print Bitmap
		// *  @param xpos        Specify the x-coordinate
		// *  @param ypos        Specify the y-coordinate
		// *  @param mode        Graphic modes
		// *  @param image       Image
		// *  @param bitmapMode  Bitmap mpde:binary/dithering
		// *  @param compress    Compress mode:TIFF/ZPL2/LZO/None
		// *
		// }
		//- (void)addBitmapWithXPos:(NSInteger)xpos
		                     //yPos:(NSInteger)ypos
		                     //mode:(PTTSCBitmapMode)mode
		                    //image:(CGImageRef)image
		               //bitmapMode:(PTBitmapMode)bitmapMode
		                 //compress:(PTBitmapCompressMode)compress;
		 //- (void)addBitmapWithXPos:(NSInteger)xpos                      yPos:(NSInteger)ypos                      mode:(PTTSCBitmapMode)mode                     image:(CGImageRef)image                bitmapMode:(PTBitmapMode)bitmapMode                  compress:(PTBitmapCompressMode)compress;
		[MethodName('addBitmapWithXPos:yPos:mode:image:bitmapMode:compress:')]
		procedure addBitmapWithXPosyPosmodeimagebitmapModecompress(xpos:NSInteger;ypos:NSInteger;mode:PTTSCBitmapMode;image:CGImageRef;bitmapMode:PTBitmapMode;compress:PTBitmapCompressMode);cdecl;
		
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ�ı�(��Ե����ֿ����).
		// *
		// *  @brief ��ӡ�ı�(�����ֿ�)
		// *  @param x_pos                x��ʼ����
		// *  @param y_pos                y��ʼ����
		// *  @param font                 ��������
		// *  @param rotation             ��ת�Ƕ�
		// *  @param x_multiplication     ˮƽ����ķŴ���,1-10
		// *  @param y_multiplication     ��ֱ����ķŴ���,1-10
		// *  @param text                 ��ӡ���ı�����
		// *
		// *  \~english
		// *
		// *  Print Text(Printer for dot matrix font).
		// *
		// *  @brief Print Text(Matrix Fonts)
		// *  @param x_pos                Specify the x-coordinate
		// *  @param y_pos                Specify the y-coordinate
		// *  @param font                 Font type
		// *  @param rotation             Rotation
		// *  @param x_multiplication     Horizontal multiplication,up to 10x
		// *  @param y_multiplication     Vertical multiplication,up to 10x
		// *  @param text                 print context
		// *
		// }
		//- (void)appendTextWithXpos:(NSInteger)x_pos
		                      //yPos:(NSInteger)y_pos
		                      //font:(PTTSCTextFontStyle)font
		                  //rotation:(PTTSCStyleRotation)rotation
		           //xMultiplication:(NSInteger)x_multiplication
		           //yMultiplication:(NSInteger)y_multiplication
		                      //text:(NSString *)text;
		 //- (void)appendTextWithXpos:(NSInteger)x_pos                       yPos:(NSInteger)y_pos                       font:(PTTSCTextFontStyle)font                   rotation:(PTTSCStyleRotation)rotation            xMultiplication:(NSInteger)x_multiplication            yMultiplication:(NSInteger)y_multiplication                       text:(NSString *)text;
		[MethodName('appendTextWithXpos:yPos:font:rotation:xMultiplication:yMultiplication:text:')]
		procedure appendTextWithXposyPosfontrotationxMultiplicationyMultiplicationtext(x_pos:NSInteger;y_pos:NSInteger;font:PTTSCTextFontStyle;rotation:PTTSCStyleRotation;x_multiplication:NSInteger;y_multiplication:NSInteger;text:NSString);cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ�Զ������ı�(��Ե����ֿ����).
		// *
		// *  @brief ��ӡ�Զ������ı�(�����ֿ�)
		// *  @param x_pos                x��ʼ����
		// *  @param y_pos                y��ʼ����
		// *  @param font                 ��������
		// *  @param rotation             ��ת�Ƕ�
		// *  @param x_multiplication     ˮƽ����ķŴ���,1-10
		// *  @param y_multiplication     ��ֱ����ķŴ���,1-10
		// *  @param safeHeight           ��ӡ�İ�ȫ�߶ȣ��Զ����г����ø߶Ȳ��ֲ����ӡ
		// *  @param width                ��ӡ�Ŀ�ȣ�����0��ʾ�����Զ�����
		// *  @param lineSpacing          �м��
		// *  @param text                 ��ӡ���ı�����
		// *
		// *  \~english
		// *
		// *  Print word wrap text(Printer for dot matrix font).
		// *
		// *  @brief Print Word Wrap Text(Matrix Fonts)
		// *  @param x_pos                Specify the x-coordinate
		// *  @param y_pos                Specify the y-coordinate
		// *  @param font                 Font type
		// *  @param rotation             Rotation
		// *  @param x_multiplication     Horizontal multiplication,up to 10x
		// *  @param y_multiplication     Vertical multiplication,up to 10x
		// *  @param safeHeight           Height of text field.Part will not print more than height
		// *  @param width                width of text field.if width is 0,not auto line
		// *  @param lineSpacing          line space.
		// *  @param text                 print context
		// *
		// }
		//- (NSInteger)printAutoTextWithXpos:(NSInteger)x_pos
		                              //yPos:(NSInteger)y_pos
		                              //font:(PTTSCTextFontStyle)font
		                          //rotation:(PTTSCStyleRotation)rotation
		                   //xMultiplication:(NSInteger)x_multiplication
		                   //yMultiplication:(NSInteger)y_multiplication
		                        //safeHeight:(NSInteger)safeHeight
		                             //width:(NSInteger)width
		                       //lineSpacing:(NSInteger)lineSpacing
		                              //text:(NSString *)text;
		 //- (NSInteger)printAutoTextWithXpos:(NSInteger)x_pos                               yPos:(NSInteger)y_pos                               font:(PTTSCTextFontStyle)font                           rotation:(PTTSCStyleRotation)rotation                    xMultiplication:(NSInteger)x_multiplication                    yMultiplication:(NSInteger)y_multiplication                         safeHeight:(NSInteger)safeHeight                              width:(NSInteger)width                        lineSpacing:(NSInteger)lineSpacing                               text:(NSString *)text;
		[MethodName('printAutoTextWithXpos:yPos:font:rotation:xMultiplication:yMultiplication:safeHeight:width:lineSpacing:text:')]
		function printAutoTextWithXposyPosfontrotationxMultiplicationyMultiplicationsafeHeightwidthlineSpacingtext(x_pos:NSInteger;y_pos:NSInteger;font:PTTSCTextFontStyle;rotation:PTTSCStyleRotation;x_multiplication:NSInteger;y_multiplication:NSInteger;safeHeight:NSInteger;width:NSInteger;lineSpacing:NSInteger;text:NSString):NSInteger;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ�ı�(ʸ���͵����ֿ����).
		// *
		// *  @brief ��ӡ�ı�
		// *  @param x_pos                x��ʼ����
		// *  @param y_pos                y��ʼ����
		// *  @param font                 ��������
		// *  @param rotation             ��ת�Ƕ�
		// *  @param x_multiplication     ˮƽ����������С,�������������9����ʾ�����С�������ʾ���ǷŴ���
		// *  @param y_multiplication     ��ֱ����������С,�������������9����ʾ�����С�������ʾ���ǷŴ���
		// *  @param text                 ��ӡ���ı�����
		// *
		// *  \~english
		// *
		// *  Print Text(Printer for vector fonts and dot fonts).
		// *
		// *  @brief Print Text
		// *  @param x_pos                Specify the x-coordinate
		// *  @param y_pos                Specify the y-coordinate
		// *  @param font                 Font type
		// *  @param rotation             Rotation
		// *  @param x_multiplication     Horizontal font size,If the type is 9, said the font size, or said is magnification
		// *  @param y_multiplication     Vertical font size,If the type is 9, said the font size, or said is magnification
		// *  @param text                 print context
		// *
		// }
		//- (void)appendTextForVectorWithXpos:(NSInteger)x_pos
		                               //yPos:(NSInteger)y_pos
		                               //font:(PTTSCTextVectorFontStyle)font
		                           //rotation:(PTTSCStyleRotation)rotation
		                    //xMultiplication:(NSInteger)x_multiplication
		                    //yMultiplication:(NSInteger)y_multiplication
		                               //text:(NSString *)text;
		 //- (void)appendTextForVectorWithXpos:(NSInteger)x_pos                                yPos:(NSInteger)y_pos                                font:(PTTSCTextVectorFontStyle)font                            rotation:(PTTSCStyleRotation)rotation                     xMultiplication:(NSInteger)x_multiplication                     yMultiplication:(NSInteger)y_multiplication                                text:(NSString *)text;
		[MethodName('appendTextForVectorWithXpos:yPos:font:rotation:xMultiplication:yMultiplication:text:')]
		procedure appendTextForVectorWithXposyPosfontrotationxMultiplicationyMultiplicationtext(x_pos:NSInteger;y_pos:NSInteger;font:PTTSCTextVectorFontStyle;rotation:PTTSCStyleRotation;x_multiplication:NSInteger;y_multiplication:NSInteger;text:NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡ�Զ������ı�(ʸ���͵����ֿ����).
		// *
		// *  @brief ��ӡ�Զ������ı�(ʸ���ֿ�)
		// *  @param x_pos                x��ʼ����
		// *  @param y_pos                y��ʼ����
		// *  @param font                 ��������
		// *  @param rotation             ��ת�Ƕ�
		// *  @param x_multiplication     ˮƽ����������С,�������������9����ʾ�����С�������ʾ���ǷŴ���
		// *  @param y_multiplication     ��ֱ����������С,�������������9����ʾ�����С�������ʾ���ǷŴ���
		// *  @param safeHeight           ��ӡ�İ�ȫ�߶ȣ��Զ����г����ø߶Ȳ��ֲ����ӡ
		// *  @param width                ��ӡ�Ŀ�ȣ�����0��ʾ�����Զ�����
		// *  @param lineSpacing          �м��
		// *  @param text                 ��ӡ���ı�����
		// *
		// *  \~english
		// *
		// *  Print word wrap text(Printer for vector fonts and dot fonts).
		// *
		// *  @brief Print Word Wrap Text(Vector Fonts)
		// *  @param x_pos                Specify the x-coordinate
		// *  @param y_pos                Specify the y-coordinate
		// *  @param font                 Font type
		// *  @param rotation             Rotation
		// *  @param x_multiplication     Horizontal font size,If the type is 9, said the font size, or said is magnification
		// *  @param y_multiplication     Vertical font size,If the type is 9, said the font size, or said is magnification
		// *  @param safeHeight           Height of text field.Part will not print more than height
		// *  @param width                width of text field.if width is 0,not auto line
		// *  @param lineSpacing          line space.
		// *  @param text                 print context
		// *
		// }
		//- (NSInteger)printAutoTextForVectorWithXpos:(NSInteger)x_pos
		                                       //yPos:(NSInteger)y_pos
		                                       //font:(PTTSCTextVectorFontStyle)font
		                                   //rotation:(PTTSCStyleRotation)rotation
		                            //xMultiplication:(NSInteger)x_multiplication
		                            //yMultiplication:(NSInteger)y_multiplication
		                                 //safeHeight:(NSInteger)safeHeight
		                                      //width:(NSInteger)width
		                                //lineSpacing:(NSInteger)lineSpacing
		                                       //text:(NSString *)text;
		 //- (NSInteger)printAutoTextForVectorWithXpos:(NSInteger)x_pos                                        yPos:(NSInteger)y_pos                                        font:(PTTSCTextVectorFontStyle)font                                    rotation:(PTTSCStyleRotation)rotation                             xMultiplication:(NSInteger)x_multiplication                             yMultiplication:(NSInteger)y_multiplication                                  safeHeight:(NSInteger)safeHeight                                       width:(NSInteger)width                                 lineSpacing:(NSInteger)lineSpacing                                        text:(NSString *)text;
		[MethodName('printAutoTextForVectorWithXpos:yPos:font:rotation:xMultiplication:yMultiplication:safeHeight:width:lineSpacing:text:')]
		function printAutoTextForVectorWithXposyPosfontrotationxMultiplicationyMultiplicationsafeHeightwidthlineSpacingtext(x_pos:NSInteger;y_pos:NSInteger;font:PTTSCTextVectorFontStyle;rotation:PTTSCStyleRotation;x_multiplication:NSInteger;y_multiplication:NSInteger;safeHeight:NSInteger;width:NSInteger;lineSpacing:NSInteger;text:NSString):NSInteger;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ָ�����򷴰״�ӡ
		// *
		// *  @brief ���״�ӡ
		// *  @param x_start        x����������꣨�Ե�Ϊ��λ��
		// *  @param y_start        y����������꣨�Ե�Ϊ��λ��
		// *  @param x_width        x���򷴰������ȣ��Ե�Ϊ��λ��
		// *  @param y_height       y���򷴰�����߶ȣ��Ե�Ϊ��λ��
		// *
		// *  \~english
		// *
		// *  This command reverses a region in image buffer.
		// *
		// *  @brief Reverses
		// *  @param x_start       The x-coordinate of the starting point (in dots)
		// *  @param y_start       The y-coordinate of the starting point (in dots)
		// *  @param x_width       X-axis region width (in dots)
		// *  @param y_height      Y-axis region height (in dots)
		// *
		// }
		//- (void)setReverseWithXStart:(NSInteger)x_start
		                      //yStart:(NSInteger)y_start
		                      //xWidth:(NSInteger)x_width
		                     //yHeight:(NSInteger)y_height;
		 //- (void)setReverseWithXStart:(NSInteger)x_start                       yStart:(NSInteger)y_start                       xWidth:(NSInteger)x_width                      yHeight:(NSInteger)y_height;
		[MethodName('setReverseWithXStart:yStart:xWidth:yHeight:')]
		procedure setReverseWithXStartyStartxWidthyHeight(x_start:NSInteger;y_start:NSInteger;x_width:NSInteger;y_height:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �ڱ�ǩ�ϻ��ƾ���.
		// *
		// *  @brief ���ƾ���
		// *  @param x_start        x��ʼ����
		// *  @param y_start        y��ʼ����
		// *  @param x_end          x�յ�����
		// *  @param y_end          y�յ�����
		// *  @param thickness      �������
		// *
		// *  \~english
		// *
		// *  This command draws rectangles on the label.
		// *
		// *  @brief Draws Rectangles
		// *  @param x_start       Specify x-coordinate of upper left corner (in dots)
		// *  @param y_start       Specify y-coordinate of upper left corner (in dots)
		// *  @param x_end         Specify x-coordinate of lower right corner (in dots)
		// *  @param y_end         Specify y-coordinate of lower right corner (in dots)
		// *  @param thickness     Line thickness (in dots)
		// *
		// }
		//- (void)setBoxWithXStart:(NSInteger)x_start
		                  //yStart:(NSInteger)y_start
		                    //xEnd:(NSInteger)x_end
		                    //yEnd:(NSInteger)y_end
		               //thickness:(NSInteger)thickness;
		 //- (void)setBoxWithXStart:(NSInteger)x_start                   yStart:(NSInteger)y_start                     xEnd:(NSInteger)x_end                     yEnd:(NSInteger)y_end                thickness:(NSInteger)thickness;
		[MethodName('setBoxWithXStart:yStart:xEnd:yEnd:thickness:')]
		procedure setBoxWithXStartyStartxEndyEndthickness(x_start:NSInteger;y_start:NSInteger;x_end:NSInteger;y_end:NSInteger;thickness:NSInteger);cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  �ڱ�ǩ�ϻ�����Բ.
		// *
		// *  @brief ������Բ
		// *  @param x_start        ָ�����Ͻǵ�x���꣨�Ե�Ϊ��λ��
		// *  @param y_start        ָ�����Ͻǵ�y���꣨�Ե�Ϊ��λ��
		// *  @param width          ��Բ�Ŀ�ȣ��Ե�Ϊ��λ��
		// *  @param height         ��Բ�ĸ߶ȣ��Ե�Ϊ��λ��
		// *  @param thickness      ��Բ�ĺ�ȣ��Ե�Ϊ��λ��
		// *
		// *  \~english
		// *
		// *  Draw an ellipse on the label.
		// *
		// *  @brief Draw Ellipse
		// *  @param x_start       Specify x-coordinate of upper left corner (in dots)
		// *  @param y_start       Specify y-coordinate of upper left corner (in dots)
		// *  @param width         Specify the width of the ellipse (in dots)
		// *  @param height        Specify the height of the ellipse (in dots)
		// *  @param thickness     Thickness of the ellipse (in dots)
		// *
		// }
		//- (void)setEllipseWithXStart:(NSInteger)x_start
		                      //yStart:(NSInteger)y_start
		                       //width:(NSInteger)width
		                      //height:(NSInteger)height
		                   //thickness:(NSInteger)thickness;
		 //- (void)setEllipseWithXStart:(NSInteger)x_start                       yStart:(NSInteger)y_start                        width:(NSInteger)width                       height:(NSInteger)height                    thickness:(NSInteger)thickness;
		[MethodName('setEllipseWithXStart:yStart:width:height:thickness:')]
		procedure setEllipseWithXStartyStartwidthheightthickness(x_start:NSInteger;y_start:NSInteger;width:NSInteger;height:NSInteger;thickness:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  �ڱ�ǩ�ϻ���Բ��.
		// *
		// *  @brief ����Բ��
		// *  @param x_start        ָ�����Ͻǵ�x���꣨�Ե�Ϊ��λ��
		// *  @param y_start        ָ�����Ͻǵ�y���꣨�Ե�Ϊ��λ��
		// *  @param diameter       ָ��Բ��ֱ�����Ե�Ϊ��λ��
		// *  @param thickness      Բ�ĺ�ȣ��Ե�Ϊ��λ��
		// *
		// *  \~english
		// *
		// *  This command draws a circle on the label.
		// *
		// *  @brief Draw Circle
		// *  @param x_start       Specify x-coordinate of upper left corner (in dots)
		// *  @param y_start       Specify y-coordinate of upper left corner (in dots)
		// *  @param diameter      Specify the diameter of the circle (in dots)
		// *  @param thickness     Thickness of the circle (in dots)
		// *
		// }
		//- (void)setCircleWithXStart:(NSInteger)x_start
		                     //yStart:(NSInteger)y_start
		                   //diameter:(NSInteger)diameter
		                  //thickness:(NSInteger)thickness;
		 //- (void)setCircleWithXStart:(NSInteger)x_start                      yStart:(NSInteger)y_start                    diameter:(NSInteger)diameter                   thickness:(NSInteger)thickness;
		[MethodName('setCircleWithXStart:yStart:diameter:thickness:')]
		procedure setCircleWithXStartyStartdiameterthickness(x_start:NSInteger;y_start:NSInteger;diameter:NSInteger;thickness:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ͼ�񻺳����е��ض�����.
		// *
		// *  @brief ���������ĳ����
		// *  @param x_start       ����x���꣨�Ե�Ϊ��λ��
		// *  @param y_start       ����y���꣨�Ե�Ϊ��λ��
		// *  @param x_width       x�᷽��������ȣ��Ե�Ϊ��λ��
		// *  @param y_height      y�᷽��������ȣ��Ե�Ϊ��λ��
		// *
		// *  \~english
		// *
		// *  This command clears a specified region in the image buffer.
		// *
		// *  @brief Clear Specified BBuffer
		// *  @param x_start      The x-coordinate of the starting point (in dots)
		// *  @param y_start      The x-coordinate of the starting point (in dots)
		// *  @param x_width      The region width in x-axis direction (in dots)
		// *  @param y_height     The region height in y-axis direction (in dots)
		// *
		// }
		//- (void)setEraseWithXStart:(NSInteger)x_start
		                    //yStart:(NSInteger)y_start
		                    //xWidth:(NSInteger)x_width
		                   //yHeight:(NSInteger)y_height;
		 //- (void)setEraseWithXStart:(NSInteger)x_start                     yStart:(NSInteger)y_start                     xWidth:(NSInteger)x_width                    yHeight:(NSInteger)y_height;
		[MethodName('setEraseWithXStart:yStart:xWidth:yHeight:')]
		procedure setEraseWithXStartyStartxWidthyHeight(x_start:NSInteger;y_start:NSInteger;x_width:NSInteger;y_height:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡDMATRIX��ά����.
		// *
		// *  @brief ��ӡDMATRIX��ά����
		// *  @param x_pos            ������ˮƽ������ʼλ�ã��Ե��ʾ
		// *  @param y_pos            �����봹ֱ������ʼλ�ã��Ե��ʾ
		// *  @param width            �����ȣ��Ե��ʾ
		// *  @param height           ����߶ȣ��Ե��ʾ
		// *  @param xm               ģ��ߴ�
		// *  @param row              ����������:10-144
		// *  @param col              ����������:10-144
		// *  @param expresssion      ����������
		// *
		// *  \~english
		// *
		// *  This command is used to define the DataMatrix 2D bar code.
		// *
		// *  @brief DataMatrix 2D Barcode
		// *  @param x_pos            Specify the x-coordinate of the bar code on the label
		// *  @param y_pos            Specify the y-coordinate of the bar code on the label
		// *  @param width            The expected width of barcode area (in dots)
		// *  @param height           The expected height of barcode area (in dots)
		// *  @param xm               Module size (in dots)
		// *  @param row              Symbol size of row: 10 to 144
		// *  @param col              Symbol size of col: 10 to 144
		// *  @param expresssion      Barcode content
		// *
		// }
		//- (void)drawDmatrixBarcodeWithXPos:(NSInteger)x_pos
		                              //yPos:(NSInteger)y_pos
		                             //width:(NSInteger)width
		                            //height:(NSInteger)height
		                                //xm:(PTTSCDMATRIXSize)xm
		                               //row:(NSInteger)row
		                               //col:(NSInteger)col
		                        //expression:(NSString *)expresssion;
		 //- (void)drawDmatrixBarcodeWithXPos:(NSInteger)x_pos                               yPos:(NSInteger)y_pos                              width:(NSInteger)width                             height:(NSInteger)height                                 xm:(PTTSCDMATRIXSize)xm                                row:(NSInteger)row                                col:(NSInteger)col                         expression:(NSString *)expresssion;
		[MethodName('drawDmatrixBarcodeWithXPos:yPos:width:height:xm:row:col:expression:')]
		procedure drawDmatrixBarcodeWithXPosyPoswidthheightxmrowcolexpression(x_pos:NSInteger;y_pos:NSInteger;width:NSInteger;height:NSInteger;xm:PTTSCDMATRIXSize;row:NSInteger;col:NSInteger;expresssion:NSString);cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡPDF417����.
		// *
		// *  @brief ��ӡPDF417����
		// *  @param x_pos            ������ˮƽ������ʼλ�ã��Ե��ʾ
		// *  @param y_pos            �����봹ֱ������ʼλ�ã��Ե��ʾ
		// *  @param width            �����ȣ��Ե��ʾ
		// *  @param height           ����߶ȣ��Ե��ʾ
		// *  @param rotate           ��������ת
		// *  @param option           ��ѡ�������������ĵ�����
		// *  @param expresssion      ����������
		// *
		// *  \~english
		// *
		// *  This command defines a PDF417 2D barcode.
		// *
		// *  @brief PDF417 Barcode
		// *  @param x_pos            Specify the x-coordinate of the bar code on the label
		// *  @param y_pos            Specify the y-coordinate of the bar code on the label
		// *  @param width            The expected width of barcode area (in dots)
		// *  @param height           The expected height of barcode area (in dots)
		// *  @param rotate           Rotation counterclockwise.
		// *  @param option           Details are given in the documentation
		// *  @param expresssion      Barcode content
		// *
		// }
		//- (void)printPDF417WithXPos:(NSInteger)x_pos
		                       //yPos:(NSInteger)y_pos
		                      //width:(NSInteger)width
		                     //height:(NSInteger)height
		                     //rotate:(PTTSCStyleRotation)rotate
		                     //option:(NSString *)option
		                 //expression:(NSString *)expression;
		 //- (void)printPDF417WithXPos:(NSInteger)x_pos                        yPos:(NSInteger)y_pos                       width:(NSInteger)width                      height:(NSInteger)height                      rotate:(PTTSCStyleRotation)rotate                      option:(NSString *)option                  expression:(NSString *)expression;
		[MethodName('printPDF417WithXPos:yPos:width:height:rotate:option:expression:')]
		procedure printPDF417WithXPosyPoswidthheightrotateoptionexpression(x_pos:NSInteger;y_pos:NSInteger;width:NSInteger;height:NSInteger;rotate:PTTSCStyleRotation;option:NSString;expression:NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡAZTEC����.
		// *
		// *  @brief ��ӡAZTEC����
		// *  @param xPos            ������ˮƽ������ʼλ�ã��Ե��ʾ
		// *  @param yPos            �����봹ֱ������ʼλ�ã��Ե��ʾ
		// *  @param rotate          ��ת�Ƕ�
		// *  @param size            Ԫ��ģ���С��1��20����Ĭ��Ϊ6
		// *  @param ecp             ������ƣ������Ŵ�С/���ͣ�����
		// *  @param flg             0��������Ϣ��ֱ�ֽ�   1������ʹ��
		// *  @param menu            �˵����ţ�0����1���ǣ���Ĭ��Ϊ0
		// *  @param multi           ��������1��26����Ĭ��Ϊ6
		// *  @param rev             ���Ҫ��ת��0����1���ǣ���Ĭ��Ϊ0
		// *  @param aztecData       ����������
		// *
		// *  \~english
		// *
		// *  This command defines a AZTEC 2D barcode.
		// *
		// *  @brief AZTEC Barcode
		// *  @param xPos            Specify the x-coordinate of the bar code on the label
		// *  @param yPos            Specify the y-coordinate of the bar code on the label
		// *  @param rotate          Rotation
		// *  @param size            Element module size (1 to 20), default is 6
		// *  @param ecp             Error control (& symbol size/type) parameter
		// *  @param flg             0 : input message is straight bytes   1:input uses
		// *  @param menu            Menu symbol (0 : no, 1 : yes), default is 0
		// *  @param multi           Number of symbols (1 to 26), default is 6
		// *  @param rev             Output to be reversed (0 : no, 1 : yes), default is 0
		// *  @param aztecData       Barcode content
		// *
		// }
		//- (void)printAztecWithXPos:(NSInteger)xPos
		                      //yPos:(NSInteger)yPos
		                    //rotate:(PTTSCStyleRotation)rotate
		                      //size:(NSInteger)size
		                       //ecp:(NSInteger)ecp
		                       //flg:(NSInteger)flg
		                      //menu:(NSInteger)menu
		                     //multi:(NSInteger)multi
		                       //rev:(NSInteger)rev
		                 //aztecData:(NSString *)aztecData;
		 //- (void)printAztecWithXPos:(NSInteger)xPos                       yPos:(NSInteger)yPos                     rotate:(PTTSCStyleRotation)rotate                       size:(NSInteger)size                        ecp:(NSInteger)ecp                        flg:(NSInteger)flg                       menu:(NSInteger)menu                      multi:(NSInteger)multi                        rev:(NSInteger)rev                  aztecData:(NSString *)aztecData;
		[MethodName('printAztecWithXPos:yPos:rotate:size:ecp:flg:menu:multi:rev:aztecData:')]
		procedure printAztecWithXPosyPosrotatesizeecpflgmenumultirevaztecData(xPos:NSInteger;yPos:NSInteger;rotate:PTTSCStyleRotation;size:NSInteger;ecp:NSInteger;flg:NSInteger;menu:NSInteger;multi:NSInteger;rev:NSInteger;aztecData:NSString);cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡBMP��ʽͼ��.
		// *
		// *  @brief ��ӡBMP��ʽͼ��
		// *  @param filename         ���ص�BMP�ļ���
		// *  @param x_pos            BMP��ʽͼ���x����
		// *  @param y_pos            BMP��ʽͼ���y����
		// *
		// *  \~english
		// *
		// *  This command prints BMP format images.
		// *
		// *  @brief BMP Format Image
		// *  @param filename         The downloaded BMP filename.
		// *  @param x_pos            The x-coordinate of the BMP format image
		// *  @param y_pos            The y-coordinate of the BMP format image
		// *
		// }
		//- (void)printBMPWithFilename:(NSString *)filename
		                      //xPos:(NSInteger)x_pos
		                      //yPos:(NSInteger)y_pos;
		 //- (void)printBMPWithFilename:(NSString *)filename                       xPos:(NSInteger)x_pos                       yPos:(NSInteger)y_pos;
		[MethodName('printBMPWithFilename:xPos:yPos:')]
		procedure printBMPWithFilenamexPosyPos(filename:NSString;x_pos:NSInteger;y_pos:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��ӡPCX��ʽͼ��.
		// *
		// *  @brief ��ӡPCX��ʽͼ��
		// *  @param filename         ���ص�PCX�ļ���
		// *  @param x_pos            PCX��ʽͼ���x����
		// *  @param y_pos            PCX��ʽͼ���y����
		// *
		// *  \~english
		// *
		// *  This command prints PCX format images.
		// *
		// *  @brief PCX Format Image
		// *  @param filename         The downloaded PCX filename.
		// *  @param x_pos            The x-coordinate of the PCX format image
		// *  @param y_pos            The y-coordinate of the PCX format image
		// *
		// }
		//- (void)printPCXWithFilename:(NSString *)filename
		                      //xPos:(NSInteger)x_pos
		                      //yPos:(NSInteger)y_pos;
		 //- (void)printPCXWithFilename:(NSString *)filename                       xPos:(NSInteger)x_pos                       yPos:(NSInteger)y_pos;
		[MethodName('printPCXWithFilename:xPos:yPos:')]
		procedure printPCXWithFilenamexPosyPos(filename:NSString;x_pos:NSInteger;y_pos:NSInteger);cdecl;
		
		
		
		///////////////////////////////////////////////////////////////////////
		///********************* Device Reconfiguration Commands ********************/
		///////////////////////////////////////////////////////////////////////
		
		//{!
		// *  \~chinese
		// *
		// *  ����������.
		// *
		// *  @brief ����������
		// *  @param counterNumber   ��ʾѡ���ĸ���������0-50
		// *  @param step            ��ʾ���������-99999999 ~ 99999999��
		// *
		// *  \~english
		// *
		// *  Counters can be a real counter or a variable.This setting sets the counter number in the program and its increments.
		// *
		// *  @brief Set The Counter
		// *  @param counterNumber   counter number. There are 51 counters available (@0~@50) in the printer.
		// *  @param step            The increment of the counter, can be positive or negative.��-99999999 ~ 99999999��
		// *
		// }
		//- (void)setCounterWithCounterNumber:(NSInteger)counterNumber
		                               //step:(NSInteger)step;
		 //- (void)setCounterWithCounterNumber:(NSInteger)counterNumber                                step:(NSInteger)step;
		[MethodName('setCounterWithCounterNumber:step:')]
		procedure setCounterWithCounterNumberstep(counterNumber:NSInteger;step:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ô�ӡ���и���״̬.
		// *
		// *  @brief �и���״̬
		// *  @param status    true:��ӡ�������и�  false�������е�����
		// *
		// *  \~english
		// *
		// *  This setting activates or deactivates the cutter.
		// *
		// *  @brief Cutter Status
		// *  @param status     true:Set printer to cut label at the end of printing job  false��Disable cutter function
		// *
		// }
		//- (void)setCutterStatus:(BOOL)status;
		procedure setCutterStatus(status:Boolean);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ����ÿ���и�Ĵ�ӡ��ǩ����
		// *
		// *  @brief �и�����
		// *  @param pieces    0 ~ 65535
		// *
		// *  \~english
		// *
		// *  Set number of printing labels per cut.
		// *
		// *  @brief Number Of Cut
		// *  @param pieces   0 ~ 65535
		// *
		// }
		//- (void)setCutterPieces:(NSInteger)pieces;
		procedure setCutterPieces(pieces:NSInteger);cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  ��������ֽ.
		// *
		// *  @brief ��������ֽ
		// *  \~english
		// *
		// *  Set continuous paper.
		// *
		// *  @brief Set continuous paper
		// }
		//- (void)setReceiptPaper;
		procedure setReceiptPaper;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���ñ�ǩֽ.
		// *
		// *  @brief ���ñ�ǩֽ
		// *  \~english
		// *
		// *  Set label paper.
		// *
		// *  @brief Set label paper
		// }
		//- (void)setLabelPaper;
		procedure setLabelPaper;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  ���úڱ�ֽ.
		// *
		// *  @brief ���úڱ�ֽ
		// *  \~english
		// *
		// *  Set black mark paper
		// *
		// *  @brief Set black mark paper
		// }
		//- (void)setBlackMarkPaper;
		procedure setBlackMarkPaper;cdecl;
		
		
		
	end;
	
	PTCommandTSPLClass=interface(NSObjectClass)//
	['{6BF9D4C5-5A3C-4A30-B601-5B847058E1E9}']
	end;
	
	TPTCommandTSPL=class(TOCGenericImport<PTCommandTSPLClass,PTCommandTSPL>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTCommandTSPL_FakeLoader : PTCommandTSPL; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTCommandTSPL';
{$O+}



{$ENDIF}

end.

