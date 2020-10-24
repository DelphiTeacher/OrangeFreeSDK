////
////  SGQRCodeObtain.h
////  SGQRCodeExample
////
////  Created by kingsic on 2016/8/16.
////  Copyright ? 2016�� kingsic. All rights reserved.
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
		///** �෽������ */
		
		////#pragma mark - - ���ɶ�ά����ط���
		//{*
		// *  ���ɶ�ά��
		// *
		// *  @param data    ��ά������
		// *  @param size    ��ά���С
		// }
		//{*
		// *  ���ɶ�ά�루�Զ�����ɫ��
		// *
		// *  @param data     ��ά������
		// *  @param size     ��ά���С
		// *  @param color    ��ά����ɫ
		// *  @param backgroundColor    ��ά�뱳����ɫ
		// }
		//{*
		// *  ���ɴ� logo �Ķ�ά�루�Ƽ�ʹ�ã�
		// *
		// *  @param data     ��ά������
		// *  @param size     ��ά���С
		// *  @param logoImage    logo
		// *  @param ratio        logo ��Զ�ά��ı�����ȡֵ��Χ 0.0 �� 0.5f��
		// }
		//{*
		// *  ���ɴ� logo �Ķ�ά�루��չ��
		// *
		// *  @param data     ��ά������
		// *  @param size     ��ά���С
		// *  @param logoImage    logo
		// *  @param ratio        logo ��Զ�ά��ı�����ȡֵ��Χ 0.0 �� 0.5f��
		// *  @param logoImageCornerRadius    logo ��߿�Բ�ǣ�ȡֵ��Χ 0.0 �� 10.0f��
		// *  @param logoImageBorderWidth     logo ��߿��ȣ�ȡֵ��Χ 0.0 �� 10.0f��
		// *  @param logoImageBorderColor     logo ��߿���ɫ
		// }
		
		////#pragma mark - - ɨ���ά����ط���
		///** ����ɨ���ά�뷽�� */
		//- (void)establishQRCodeObtainScanWithController:(UIViewController *)controller configure:(SGQRCodeObtainConfigure *)configure;
		[MethodName('establishQRCodeObtainScanWithController:configure:')]
		procedure establishQRCodeObtainScanWithControllerconfigure(controller:UIViewController;configure:SGQRCodeObtainConfigure);cdecl;
		
		///** ɨ���ά��ص����� */
		//- (void)setBlockWithQRCodeObtainScanResult:(SGQRCodeObtainScanResultBlock)block;
		procedure setBlockWithQRCodeObtainScanResult(block:TSGQRCodeObtainScanResultBlockEvent);cdecl;
		
		///** ɨ���ά�����ǿ���ص�����������֮ǰ�������� sampleBufferDelegate ����Ϊ YES */
		//- (void)setBlockWithQRCodeObtainScanBrightness:(SGQRCodeObtainScanBrightnessBlock)block;
		procedure setBlockWithQRCodeObtainScanBrightness(block:TSGQRCodeObtainScanBrightnessBlockEvent);cdecl;
		
		///** ����ɨ��ص����� */
		//- (void)startRunningWithBefore:(void (^)(void))before completion:(void (^)(void))completion;
		[MethodName('startRunningWithBefore:completion:')]
		procedure startRunningWithBeforecompletion(before:TVoidEvent;completion:TVoidEvent);cdecl;
		
		///** ֹͣɨ�跽�� */
		//- (void)stopRunning;
		procedure stopRunning;cdecl;
		
		
		///** ������Ч�ļ� */
		//- (void)playSoundName:(NSString *)name;
		procedure playSoundName(name:NSString);cdecl;
		
		
		////#pragma mark - - ����ж�ȡ��ά����ط���
		///** ������Ტ��ȡ�����Ȩ���� */
		//- (void)establishAuthorizationQRCodeObtainAlbumWithController:(UIViewController *)controller;
		procedure establishAuthorizationQRCodeObtainAlbumWithController(controller:UIViewController);cdecl;
		
		///** �ж�������Ȩ���Ƿ���Ȩ */
		//@property (nonatomic, assign) BOOL isPHAuthorization;
		function isPHAuthorization:Boolean;cdecl;
		procedure setIsPHAuthorization(isPHAuthorization:Boolean);cdecl;
		///** ͼƬѡ�������ȡ����ť�ĵ���ص����� */
		//- (void)setBlockWithQRCodeObtainAlbumDidCancelImagePickerController:(SGQRCodeObtainAlbumDidCancelImagePickerControllerBlock)block;
		procedure setBlockWithQRCodeObtainAlbumDidCancelImagePickerController(block:TSGQRCodeObtainAlbumDidCancelImagePickerControllerBlockEvent);cdecl;

		///** ����ж�ȡͼƬ��ά����Ϣ�ص����� */
		//- (void)setBlockWithQRCodeObtainAlbumResult:(SGQRCodeObtainAlbumResultBlock)block;
		procedure setBlockWithQRCodeObtainAlbumResult(block:TSGQRCodeObtainAlbumResultBlockEvent);cdecl;
		
		
		////#pragma mark - - �ֵ�Ͳ��ط���
		///** ���ֵ�Ͳ */
		//- (void)openFlashlight;
		procedure openFlashlight;cdecl;
		
		///** �ر��ֵ�Ͳ */
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

