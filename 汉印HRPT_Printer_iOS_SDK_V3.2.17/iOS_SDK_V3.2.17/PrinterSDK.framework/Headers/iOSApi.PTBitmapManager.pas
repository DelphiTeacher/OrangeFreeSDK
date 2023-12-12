////
////  PTBitmapManager.h
////  PrinterSDK
////
////  Created by ios on 2021/12/9.
////  Copyright ? 2021 Mellow. All rights reserved.
////

unit iOSApi.PTBitmapManager;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	//#import <UIKit/UIKit.h>
	iOSapi.UIKit,
	//#import <Accelerate/Accelerate.h>
//	iOSapi.Accelerate,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	
	//NS_ASSUME_NONNULL_BEGIN
	
	//typedef NS_ENUM(NSInteger,PTBitmapCompressMode) {
	    ///*! *\~chinese ��ѹ�� *\~english None */
	    //PTBitmapCompressModeNone = 0,
	    ///*! *\~chinese LZOѹ���㷨 *\~english LZO compress */
	    //PTBitmapCompressModeLZO = 48
	//};
	//typedef NS_ENUM(NSInteger,PTBitmapCompressMode) {
	PTBitmapCompressMode_=(
	//(NSInteger,PTBitmapCompressMode) {
	//    /*! *\~chinese ��ѹ�� *\~english None */
	    PTBitmapCompressModeNone = 0,
	//    /*! *\~chinese LZOѹ���㷨 *\~english LZO compress */
	    PTBitmapCompressModeLZO = 48
	);
	PTBitmapCompressMode=Integer;
	
	
	
	
	
	//typedef NS_ENUM(NSInteger, PTBitmapMode) {
	    ///*! *\~chinese �ڰ׶�ֵͼ�� *\~english Binary */
	    //PTBitmapModeBinary = 0,
	    ///*! *\~chinese ��ɢ���� *\~english Diffusion dithering algorithm */
	    //PTBitmapModeDithering = 1,
	    ///*! *\~chinese �ۼ������㷨 *\~english Aggregate dithering algorithm */
	    //PTBitmapModeCluster = 2
	//};
	//typedef NS_ENUM(NSInteger, PTBitmapMode) {
	PTBitmapMode_=(
	//(NSInteger, PTBitmapMode) {
	//    /*! *\~chinese �ڰ׶�ֵͼ�� *\~english Binary */
	    PTBitmapModeBinary = 0,
	//    /*! *\~chinese ��ɢ���� *\~english Diffusion dithering algorithm */
	    PTBitmapModeDithering = 1,
	//    /*! *\~chinese �ۼ������㷨 *\~english Aggregate dithering algorithm */
	    PTBitmapModeCluster = 2
	);
	PTBitmapMode=Integer;
	
	
	
	
	
	//@interface PTBitmapManager : NSObject
	//@interface PTBitmapManager : NSObject
	PTBitmapManager=interface(NSObject)//
	['{8FBA995E-A22D-49F2-BAEA-A391F4852022}']
		
		///// ���ɶ�ֵ����ͼƬ����
		///// @param image ͼƬ
		///// @param mode ͼƬЧ����������ѡ��ҽ�ģʽ����ô��Ĭ��SDK����ͼƬ
		///// @param compress ѹ��ģʽ
		///// @param package �Ƿ���Ҫ�ְ�
		///// @param reverse �����Ƿ�Ҫ��ת��eg:TSPL��ͼƬ��Ҫ��ת
		
		///// Ԥ��ͼ
		///// @param image ԭͼͼƬ
		///// @param mode Ԥ����ͼƬģʽ
		
		
		///// ����λͼ����(��������Ҫָ����Ķ�Ӧ�ӿ��ٴ�������ֱ���·�)
		///// @param image ͼƬ
		///// @param mode ͼƬЧ��
		
		///// �񻯺��ͼƬ
		///// @param image ԭͼͼƬ
		
		
		///// ����͸��ͼƬ
		///// @param image ԭͼͼƬ
		
		
		///// �Զ�����ֵ�ĺڰ�ͼ����
		
		
		///// ȥ�����ܰ�ɫ����ͼƬ����
		
		///// �ü�ͼƬ
		
		
	end;
	
	PTBitmapManagerClass=interface(NSObjectClass)//
	['{23E8D864-8AFF-4376-AFBC-D2626F05C0B5}']
		//+ (NSData *)generateGenralDataWithImage:(UIImage *)image mode:(PTBitmapMode)mode compress:(PTBitmapCompressMode)compress package:(BOOL)package reverse:(BOOL)reverse;
		[MethodName('generateGenralDataWithImage:mode:compress:package:reverse:')]
		function generateGenralDataWithImagemodecompresspackagereverse(image:UIImage;mode:PTBitmapMode;compress:PTBitmapCompressMode;package:Boolean;reverse:Boolean):NSData;cdecl;
		
		//+ (UIImage *)generateRenderingWithImage:(UIImage *)image mode:(PTBitmapMode)mode;
		[MethodName('generateRenderingWithImage:mode:')]
		function generateRenderingWithImagemode(image:UIImage;mode:PTBitmapMode):UIImage;cdecl;
		
		//+ (NSData *)generateBitmapDataWithImage:(UIImage *)image mode:(PTBitmapMode)mode;
		[MethodName('generateBitmapDataWithImage:mode:')]
		function generateBitmapDataWithImagemode(image:UIImage;mode:PTBitmapMode):NSData;cdecl;
		
		//+ (UIImage *)imageToSharpen:(UIImage *)image;
		function imageToSharpen(image:UIImage):UIImage;cdecl;
		
		//+ (UIImage *)imageToTransparent:(UIImage *)image;
		function imageToTransparent(image:UIImage):UIImage;cdecl;
		
		//+ (NSData *)printableBinaryData:(UIImage *)image threshold:(Byte)threshold compress:(PTBitmapCompressMode)compress reverse:(BOOL)reverse;
		[MethodName('printableBinaryData:threshold:compress:reverse:')]
		function printableBinaryDatathresholdcompressreverse(image:UIImage;threshold:Byte;compress:PTBitmapCompressMode;reverse:Boolean):NSData;cdecl;
		
		//+ (CGRect)contentInImage:(UIImage *)image;
		function contentInImage(image:UIImage):CGRect;cdecl;
		
		//+ (UIImage *)cropImage:(UIImage *)image pixelRect:(CGRect)pixelRect;
		[MethodName('cropImage:pixelRect:')]
		function cropImagepixelRect(image:UIImage;pixelRect:CGRect):UIImage;cdecl;
		
	end;
	
	TPTBitmapManager=class(TOCGenericImport<PTBitmapManagerClass,PTBitmapManager>)
	end;
	
	
	
	
	
	//NS_ASSUME_NONNULL_END
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTBitmapManager_FakeLoader : PTBitmapManager; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTBitmapManager';
{$O+}



{$ENDIF}

end.

