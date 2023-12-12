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
	    ///*! *\~chinese 不压缩 *\~english None */
	    //PTBitmapCompressModeNone = 0,
	    ///*! *\~chinese LZO压缩算法 *\~english LZO compress */
	    //PTBitmapCompressModeLZO = 48
	//};
	//typedef NS_ENUM(NSInteger,PTBitmapCompressMode) {
	PTBitmapCompressMode_=(
	//(NSInteger,PTBitmapCompressMode) {
	//    /*! *\~chinese 不压缩 *\~english None */
	    PTBitmapCompressModeNone = 0,
	//    /*! *\~chinese LZO压缩算法 *\~english LZO compress */
	    PTBitmapCompressModeLZO = 48
	);
	PTBitmapCompressMode=Integer;
	
	
	
	
	
	//typedef NS_ENUM(NSInteger, PTBitmapMode) {
	    ///*! *\~chinese 黑白二值图像 *\~english Binary */
	    //PTBitmapModeBinary = 0,
	    ///*! *\~chinese 扩散抖动 *\~english Diffusion dithering algorithm */
	    //PTBitmapModeDithering = 1,
	    ///*! *\~chinese 聚集抖动算法 *\~english Aggregate dithering algorithm */
	    //PTBitmapModeCluster = 2
	//};
	//typedef NS_ENUM(NSInteger, PTBitmapMode) {
	PTBitmapMode_=(
	//(NSInteger, PTBitmapMode) {
	//    /*! *\~chinese 黑白二值图像 *\~english Binary */
	    PTBitmapModeBinary = 0,
	//    /*! *\~chinese 扩散抖动 *\~english Diffusion dithering algorithm */
	    PTBitmapModeDithering = 1,
	//    /*! *\~chinese 聚集抖动算法 *\~english Aggregate dithering algorithm */
	    PTBitmapModeCluster = 2
	);
	PTBitmapMode=Integer;
	
	
	
	
	
	//@interface PTBitmapManager : NSObject
	//@interface PTBitmapManager : NSObject
	PTBitmapManager=interface(NSObject)//
	['{8FBA995E-A22D-49F2-BAEA-A391F4852022}']
		
		///// 生成二值抖动图片数据
		///// @param image 图片
		///// @param mode 图片效果，这边如果选择灰阶模式，那么则默认SDK处理图片
		///// @param compress 压缩模式
		///// @param package 是否需要分包
		///// @param reverse 数据是否要反转，eg:TSPL的图片需要反转
		
		///// 预览图
		///// @param image 原图图片
		///// @param mode 预览的图片模式
		
		
		///// 生成位图数据(该数据需要指令类的对应接口再处理，不可直接下发)
		///// @param image 图片
		///// @param mode 图片效果
		
		///// 锐化后的图片
		///// @param image 原图图片
		
		
		///// 生成透明图片
		///// @param image 原图图片
		
		
		///// 自定义阈值的黑白图数据
		
		
		///// 去掉四周白色区域图片数据
		
		///// 裁剪图片
		
		
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

