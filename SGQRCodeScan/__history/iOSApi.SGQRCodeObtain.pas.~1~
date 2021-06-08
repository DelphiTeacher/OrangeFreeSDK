////
////  SGQRCodeObtain.h
////  SGQRCodeExample
////
////  Created by kingsic on 2016/8/16.
////  Copyright ? 2016年 kingsic. All rights reserved.
////

unit iOSApi.SGQRCodeObtain;

interface

{$IFDEF IOS}
uses
	//#import <UIKit/UIKit.h>
	iOSapi.UIKit,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	//@class SGQRCodeObtainConfigure, SGQRCodeObtain;
	SGQRCodeObtainConfigure=Pointer;
	SGQRCodeObtain=interface;

	TSGQRCodeObtainScanResultBlockEvent=procedure (obtain:SGQRCodeObtain;result:NSString) of object;
	//typedef void(^SGQRCodeObtainScanResultBlock)(SGQRCodeObtain *obtain, NSString *result);

	//typedef void(^SGQRCodeObtainScanResultBlock)(SGQRCodeObtain *obtain, NSString *result);
	TSGQRCodeObtainScanBrightnessBlockEvent=procedure (obtain:SGQRCodeObtain;brightness:CGFloat) of object;
	//typedef void(^SGQRCodeObtainScanBrightnessBlock)(SGQRCodeObtain *obtain, CGFloat brightness);

	//typedef void(^SGQRCodeObtainScanBrightnessBlock)(SGQRCodeObtain *obtain, CGFloat brightness);
	TSGQRCodeObtainAlbumDidCancelImagePickerControllerBlockEvent=procedure (obtain:SGQRCodeObtain) of object;
	//typedef void(^SGQRCodeObtainAlbumDidCancelImagePickerControllerBlock)(SGQRCodeObtain *obtain);

	//typedef void(^SGQRCodeObtainAlbumDidCancelImagePickerControllerBlock)(SGQRCodeObtain *obtain);
	TSGQRCodeObtainAlbumResultBlockEvent=procedure (obtain:SGQRCodeObtain;result:NSString) of object;
	//typedef void(^SGQRCodeObtainAlbumResultBlock)(SGQRCodeObtain *obtain, NSString *result);

	//typedef void(^SGQRCodeObtainAlbumResultBlock)(SGQRCodeObtain *obtain, NSString *result);

	TVoidEvent=procedure () of object;
//	TVoidEvent=procedure () of object;
	//@interface SGQRCodeObtain : NSObject
	//@interface SGQRCodeObtain : NSObject
	SGQRCodeObtain=interface(NSObject)//
	['{4AAF0040-2C71-4187-B856-442912E634F5}']
		///** 类方法创建 */
		
		////#pragma mark - - 生成二维码相关方法
		//{*
		// *  生成二维码
		// *
		// *  @param data    二维码数据
		// *  @param size    二维码大小
		// }
		//{*
		// *  生成二维码（自定义颜色）
		// *
		// *  @param data     二维码数据
		// *  @param size     二维码大小
		// *  @param color    二维码颜色
		// *  @param backgroundColor    二维码背景颜色
		// }
		//{*
		// *  生成带 logo 的二维码（推荐使用）
		// *
		// *  @param data     二维码数据
		// *  @param size     二维码大小
		// *  @param logoImage    logo
		// *  @param ratio        logo 相对二维码的比例（取值范围 0.0 ～ 0.5f）
		// }
		//{*
		// *  生成带 logo 的二维码（拓展）
		// *
		// *  @param data     二维码数据
		// *  @param size     二维码大小
		// *  @param logoImage    logo
		// *  @param ratio        logo 相对二维码的比例（取值范围 0.0 ～ 0.5f）
		// *  @param logoImageCornerRadius    logo 外边框圆角（取值范围 0.0 ～ 10.0f）
		// *  @param logoImageBorderWidth     logo 外边框宽度（取值范围 0.0 ～ 10.0f）
		// *  @param logoImageBorderColor     logo 外边框颜色
		// }
		
		////#pragma mark - - 扫描二维码相关方法
		///** 创建扫描二维码方法 */
		//- (void)establishQRCodeObtainScanWithController:(UIViewController *)controller configure:(SGQRCodeObtainConfigure *)configure;
		[MethodName('establishQRCodeObtainScanWithController:configure:')]
		procedure establishQRCodeObtainScanWithControllerconfigure(controller:UIViewController;configure:SGQRCodeObtainConfigure);cdecl;
		
		///** 扫描二维码回调方法 */
		//- (void)setBlockWithQRCodeObtainScanResult:(SGQRCodeObtainScanResultBlock)block;
		procedure setBlockWithQRCodeObtainScanResult(block:TSGQRCodeObtainScanResultBlockEvent);cdecl;
		
		///** 扫描二维码光线强弱回调方法；调用之前配置属性 sampleBufferDelegate 必须为 YES */
		//- (void)setBlockWithQRCodeObtainScanBrightness:(SGQRCodeObtainScanBrightnessBlock)block;
		procedure setBlockWithQRCodeObtainScanBrightness(block:TSGQRCodeObtainScanBrightnessBlockEvent);cdecl;
		
		///** 开启扫描回调方法 */
		//- (void)startRunningWithBefore:(void (^)(void))before completion:(void (^)(void))completion;
		[MethodName('startRunningWithBefore:completion:')]
		procedure startRunningWithBeforecompletion(before:TVoidEvent;completion:TVoidEvent);cdecl;
		
		///** 停止扫描方法 */
		//- (void)stopRunning;
		procedure stopRunning;cdecl;
		
		
		///** 播放音效文件 */
		//- (void)playSoundName:(NSString *)name;
		procedure playSoundName(name:NSString);cdecl;
		
		
		////#pragma mark - - 相册中读取二维码相关方法
		///** 创建相册并获取相册授权方法 */
		//- (void)establishAuthorizationQRCodeObtainAlbumWithController:(UIViewController *)controller;
		procedure establishAuthorizationQRCodeObtainAlbumWithController(controller:UIViewController);cdecl;
		
		///** 判断相册访问权限是否授权 */
		//@property (nonatomic, assign) BOOL isPHAuthorization;
		function isPHAuthorization:Boolean;cdecl;
		procedure setIsPHAuthorization(isPHAuthorization:Boolean);cdecl;
		///** 图片选择控制器取消按钮的点击回调方法 */
		//- (void)setBlockWithQRCodeObtainAlbumDidCancelImagePickerController:(SGQRCodeObtainAlbumDidCancelImagePickerControllerBlock)block;
		procedure setBlockWithQRCodeObtainAlbumDidCancelImagePickerController(block:TSGQRCodeObtainAlbumDidCancelImagePickerControllerBlockEvent);cdecl;

		///** 相册中读取图片二维码信息回调方法 */
		//- (void)setBlockWithQRCodeObtainAlbumResult:(SGQRCodeObtainAlbumResultBlock)block;
		procedure setBlockWithQRCodeObtainAlbumResult(block:TSGQRCodeObtainAlbumResultBlockEvent);cdecl;
		
		
		////#pragma mark - - 手电筒相关方法
		///** 打开手电筒 */
		//- (void)openFlashlight;
		procedure openFlashlight;cdecl;
		
		///** 关闭手电筒 */
		//- (void)closeFlashlight;
		procedure closeFlashlight;cdecl;
		
		
	end;
	
	SGQRCodeObtainClass=interface(NSObjectClass)//
	['{B57C957F-7A01-47F5-9E78-61CAFEF4BB26}']
		//+ (instancetype)QRCodeObtain;
		function QRCodeObtain:SGQRCodeObtain;cdecl;
		
		//+ (UIImage *)generateQRCodeWithData:(NSString *)data size:(CGFloat)size;
		[MethodName('generateQRCodeWithData:size:')]
		function generateQRCodeWithDatasize(data:NSString;size:CGFloat):UIImage;cdecl;
		
		//+ (UIImage *)generateQRCodeWithData:(NSString *)data size:(CGFloat)size color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor;
		[MethodName('generateQRCodeWithData:size:color:backgroundColor:')]
		function generateQRCodeWithDatasizecolorbackgroundColor(data:NSString;size:CGFloat;color:UIColor;backgroundColor:UIColor):UIImage;cdecl;
		
		//+ (UIImage *)generateQRCodeWithData:(NSString *)data size:(CGFloat)size logoImage:(UIImage *)logoImage ratio:(CGFloat)ratio;
		[MethodName('generateQRCodeWithData:size:logoImage:ratio:')]
		function generateQRCodeWithDatasizelogoImageratio(data:NSString;size:CGFloat;logoImage:UIImage;ratio:CGFloat):UIImage;cdecl;
		
		//+ (UIImage *)generateQRCodeWithData:(NSString *)data size:(CGFloat)size logoImage:(UIImage *)logoImage ratio:(CGFloat)ratio logoImageCornerRadius:(CGFloat)logoImageCornerRadius logoImageBorderWidth:(CGFloat)logoImageBorderWidth logoImageBorderColor:(UIColor *)logoImageBorderColor;
		[MethodName('generateQRCodeWithData:size:logoImage:ratio:logoImageCornerRadius:logoImageBorderWidth:logoImageBorderColor:')]
		function generateQRCodeWithDatasizelogoImageratiologoImageCornerRadiuslogoImageBorderWidthlogoImageBorderColor(data:NSString;size:CGFloat;logoImage:UIImage;ratio:CGFloat;logoImageCornerRadius:CGFloat;logoImageBorderWidth:CGFloat;logoImageBorderColor:UIColor):UIImage;cdecl;
		
	end;
	
	TSGQRCodeObtain=class(TOCGenericImport<SGQRCodeObtainClass,SGQRCodeObtain>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function SGQRCodeObtain_FakeLoader : SGQRCodeObtain; cdecl; external {$I FrameworkDylibPath_SGQRCode.inc} name 'OBJC_CLASS_$_SGQRCodeObtain';
{$O+}



{$ENDIF}

end.

