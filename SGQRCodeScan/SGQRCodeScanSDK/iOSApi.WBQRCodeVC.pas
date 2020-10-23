////
////  WBQRCodeVC.h
////  SGQRCodeExample
////
////  Created by kingsic on 2018/2/8.
////  Copyright ? 2018�� kingsic. All rights reserved.
////

unit iOSApi.WBQRCodeVC;

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

	
	//@interface WBQRCodeVC : UIViewController
	//@interface WBQRCodeVC : UIViewController
	WBQRCodeVC=interface(UIViewController)//
	['{3DA38A90-737C-466C-80B9-DA4DDA53DB48}']
		///** ɨ���ά��ص����� */
		//- (void)setBlockWithQRCodeObtainScanResult:(SGQRCodeObtainScanResultBlock)block;
		procedure setBlockWithQRCodeObtainScanResult(block:TSGQRCodeObtainScanResultBlockEvent);cdecl;
		
	end;
	
	WBQRCodeVCClass=interface(UIViewControllerClass)//
	['{8FDF4C25-D375-434D-90F0-CE92E3B820A1}']
	end;
	
	TWBQRCodeVC=class(TOCGenericImport<WBQRCodeVCClass,WBQRCodeVC>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function WBQRCodeVC_FakeLoader : WBQRCodeVC; cdecl; external {$I FrameworkDylibPath_SGQRCode.inc} name 'OBJC_CLASS_$_WBQRCodeVC';
{$O+}



{$ENDIF}

end.

