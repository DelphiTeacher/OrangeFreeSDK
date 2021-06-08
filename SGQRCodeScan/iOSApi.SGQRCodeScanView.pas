////
////  SGQRCodeScanView.h
////  SGQRCodeExample
////
////  Created by kingsic on 2017/8/23.
////  Copyright ? 2017年 kingsic All rights reserved.
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
	    ///// 默认与边框线同中心点
	    //CornerLoactionDefault,
	    ///// 在边框线内部
	    //CornerLoactionInside,
	    ///// 在边框线外部
	    //CornerLoactionOutside
	//} CornerLoaction;
	//typedef enum : NSUInteger {
	CornerLoaction_=(
	//    /// 默认与边框线同中心点
	    CornerLoactionDefault,
	//    /// 在边框线内部
	    CornerLoactionInside,
	//    /// 在边框线外部
	    CornerLoactionOutside
	);
	CornerLoaction=Integer;
	
	
	
	
	
	//typedef enum : NSUInteger {
	    ///// 单线扫描样式
	    //ScanAnimationStyleDefault,
	    ///// 网格扫描样式
	    //ScanAnimationStyleGrid
	//} ScanAnimationStyle;
	//typedef enum : NSUInteger {
	ScanAnimationStyle_=(
	//    /// 单线扫描样式
	    ScanAnimationStyleDefault,
	//    /// 网格扫描样式
	    ScanAnimationStyleGrid
	);
	ScanAnimationStyle=Integer;
	
	
	
	
	
	//@interface SGQRCodeScanView : UIView
	//@interface SGQRCodeScanView : UIView
	SGQRCodeScanView=interface(UIView)//
	['{8A7664C7-FDCD-499A-A856-CAA8FFFD036C}']
		///** 扫描样式，默认 ScanAnimationStyleDefault */
		//@property (nonatomic, assign) ScanAnimationStyle scanAnimationStyle;
		function scanAnimationStyle:ScanAnimationStyle;cdecl;
		procedure setScanAnimationStyle(scanAnimationStyle:ScanAnimationStyle);cdecl;
		///** 扫描线名 */
		//@property (nonatomic, copy) NSString *scanImageName;
		function scanImageName:NSString;cdecl;
		procedure setScanImageName(scanImageName:NSString);cdecl;
		///** 边框颜色，默认白色 */
		//@property (nonatomic, strong) UIColor *borderColor;
		function borderColor:UIColor;cdecl;
		procedure setBorderColor(borderColor:UIColor);cdecl;
		///** 边角位置，默认 CornerLoactionDefault */
		//@property (nonatomic, assign) CornerLoaction cornerLocation;
		function cornerLocation:CornerLoaction;cdecl;
		procedure setCornerLocation(cornerLocation:CornerLoaction);cdecl;
		///** 边角颜色，默认微信颜色 */
		//@property (nonatomic, strong) UIColor *cornerColor;
		function cornerColor:UIColor;cdecl;
		procedure setCornerColor(cornerColor:UIColor);cdecl;
		///** 边角宽度，默认 2.f */
		//@property (nonatomic, assign) CGFloat cornerWidth;
		function cornerWidth:CGFloat;cdecl;
		procedure setCornerWidth(cornerWidth:CGFloat);cdecl;
		///** 扫描区周边颜色的 alpha 值，默认 0.2f */
		//@property (nonatomic, assign) CGFloat backgroundAlpha;
		function backgroundAlpha:CGFloat;cdecl;
		procedure setBackgroundAlpha(backgroundAlpha:CGFloat);cdecl;
		///** 扫描线动画时间，默认 0.02s */
		//@property (nonatomic, assign) NSTimeInterval animationTimeInterval;
		function animationTimeInterval:NSTimeInterval;cdecl;
		procedure setAnimationTimeInterval(animationTimeInterval:NSTimeInterval);cdecl;
		
		///** 添加定时器 */
		//- (void)addTimer;
		procedure addTimer;cdecl;
		
		///** 移除定时器 */
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

