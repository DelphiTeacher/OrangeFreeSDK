////
////  WCQRCodeVC.h
////  SGQRCodeExample
////
////  Created by kingsic on 17/3/20.
////  Copyright ? 2017年 kingsic. All rights reserved.
////

unit iOSApi.WCQRCodeVC;

interface

{$IFDEF IOS}
uses
	//#import <UIKit/UIKit.h>
	iOSapi.UIKit,
	//#import "SGQRCodeObtain.h"
	iOSApi.SGQRCodeObtain,
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

	
	//@interface WCQRCodeVC : UIViewController
	//@interface WCQRCodeVC : UIViewController
	WCQRCodeVC=interface(UIViewController)//
	['{1A1B5399-D5F3-4C6F-905F-36A767B49425}']
		///** 扫描二维码回调方法 */
		//- (void)setBlockWithQRCodeObtainScanResult:(SGQRCodeObtainScanResultBlock)block;
		procedure setBlockWithQRCodeObtainScanResult(block:TSGQRCodeObtainScanResultBlockEvent);cdecl;
		
	end;
	
	WCQRCodeVCClass=interface(UIViewControllerClass)//
	['{39B5D09F-3FA2-4C32-8955-E872BE3B703F}']
	end;
	
	TWCQRCodeVC=class(TOCGenericImport<WCQRCodeVCClass,WCQRCodeVC>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function WCQRCodeVC_FakeLoader : WCQRCodeVC; cdecl; external {$I FrameworkDylibPath_SGQRCode.inc} name 'OBJC_CLASS_$_WCQRCodeVC';
{$O+}



{$ENDIF}

end.

