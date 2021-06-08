////
////  SGQRCodeScanView.h
////  SGQRCodeExample
////
////  Created by kingsic on 2017/8/23.
////  Copyright ? 2017�� kingsic All rights reserved.
////

unit iOSApi.SGQRCodeScanView;

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

	
	//typedef enum : NSUInteger {
	    ///// Ĭ����߿���ͬ���ĵ�
	    //CornerLoactionDefault,
	    ///// �ڱ߿����ڲ�
	    //CornerLoactionInside,
	    ///// �ڱ߿����ⲿ
	    //CornerLoactionOutside
	//} CornerLoaction;
	//typedef enum : NSUInteger {
	CornerLoaction_=(
	//    /// Ĭ����߿���ͬ���ĵ�
	    CornerLoactionDefault,
	//    /// �ڱ߿����ڲ�
	    CornerLoactionInside,
	//    /// �ڱ߿����ⲿ
	    CornerLoactionOutside
	);
	CornerLoaction=Integer;
	
	
	
	
	
	//typedef enum : NSUInteger {
	    ///// ����ɨ����ʽ
	    //ScanAnimationStyleDefault,
	    ///// ����ɨ����ʽ
	    //ScanAnimationStyleGrid
	//} ScanAnimationStyle;
	//typedef enum : NSUInteger {
	ScanAnimationStyle_=(
	//    /// ����ɨ����ʽ
	    ScanAnimationStyleDefault,
	//    /// ����ɨ����ʽ
	    ScanAnimationStyleGrid
	);
	ScanAnimationStyle=Integer;
	
	
	
	
	
	//@interface SGQRCodeScanView : UIView
	//@interface SGQRCodeScanView : UIView
	SGQRCodeScanView=interface(UIView)//
	['{8A7664C7-FDCD-499A-A856-CAA8FFFD036C}']
		///** ɨ����ʽ��Ĭ�� ScanAnimationStyleDefault */
		//@property (nonatomic, assign) ScanAnimationStyle scanAnimationStyle;
		function scanAnimationStyle:ScanAnimationStyle;cdecl;
		procedure setScanAnimationStyle(scanAnimationStyle:ScanAnimationStyle);cdecl;
		///** ɨ������ */
		//@property (nonatomic, copy) NSString *scanImageName;
		function scanImageName:NSString;cdecl;
		procedure setScanImageName(scanImageName:NSString);cdecl;
		///** �߿���ɫ��Ĭ�ϰ�ɫ */
		//@property (nonatomic, strong) UIColor *borderColor;
		function borderColor:UIColor;cdecl;
		procedure setBorderColor(borderColor:UIColor);cdecl;
		///** �߽�λ�ã�Ĭ�� CornerLoactionDefault */
		//@property (nonatomic, assign) CornerLoaction cornerLocation;
		function cornerLocation:CornerLoaction;cdecl;
		procedure setCornerLocation(cornerLocation:CornerLoaction);cdecl;
		///** �߽���ɫ��Ĭ��΢����ɫ */
		//@property (nonatomic, strong) UIColor *cornerColor;
		function cornerColor:UIColor;cdecl;
		procedure setCornerColor(cornerColor:UIColor);cdecl;
		///** �߽ǿ�ȣ�Ĭ�� 2.f */
		//@property (nonatomic, assign) CGFloat cornerWidth;
		function cornerWidth:CGFloat;cdecl;
		procedure setCornerWidth(cornerWidth:CGFloat);cdecl;
		///** ɨ�����ܱ���ɫ�� alpha ֵ��Ĭ�� 0.2f */
		//@property (nonatomic, assign) CGFloat backgroundAlpha;
		function backgroundAlpha:CGFloat;cdecl;
		procedure setBackgroundAlpha(backgroundAlpha:CGFloat);cdecl;
		///** ɨ���߶���ʱ�䣬Ĭ�� 0.02s */
		//@property (nonatomic, assign) NSTimeInterval animationTimeInterval;
		function animationTimeInterval:NSTimeInterval;cdecl;
		procedure setAnimationTimeInterval(animationTimeInterval:NSTimeInterval);cdecl;
		
		///** ��Ӷ�ʱ�� */
		//- (void)addTimer;
		procedure addTimer;cdecl;
		
		///** �Ƴ���ʱ�� */
		//- (void)removeTimer;
		procedure removeTimer;cdecl;
		
		
	end;
	
	SGQRCodeScanViewClass=interface(UIViewClass)//
	['{BD1C2250-4937-4736-8D26-324B2E59CA91}']
	end;
	
	TSGQRCodeScanView=class(TOCGenericImport<SGQRCodeScanViewClass,SGQRCodeScanView>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

//{$O-}
//function SGQRCodeScanView_FakeLoader : SGQRCodeScanView; cdecl; external {$I FrameworkDylibPath_SGQRCode.inc} name 'OBJC_CLASS_$_SGQRCodeScanView';
//{$O+}



{$ENDIF}

end.

