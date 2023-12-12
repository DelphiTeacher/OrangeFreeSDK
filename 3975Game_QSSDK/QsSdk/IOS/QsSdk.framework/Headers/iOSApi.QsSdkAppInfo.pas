
unit iOSApi.QsSdkAppInfo;

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

	
	//@interface QsSdkAppInfo : NSObject
	//@interface QsSdkAppInfo : NSObject
	QsSdkAppInfo=interface(NSObject)//
	['{C4F7B0BE-71A3-4380-AD69-0190C9A4A2D1}']
		
		
		//-(NSString *)getQsSdkVersion;
		function getQsSdkVersion:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkBundleId;
		function getQsSdkBundleId:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkAppVersion;
		function getQsSdkAppVersion:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkAppBuildVersion;
		function getQsSdkAppBuildVersion:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkAppName;
		function getQsSdkAppName:NSString;cdecl;
		
		
		//-(UIView *)getQsSdkCurrentView;
		function getQsSdkCurrentView:UIView;cdecl;
		
		
		//-(UIViewController *)getQsSdkCurrentViewController;
		function getQsSdkCurrentViewController:UIViewController;cdecl;
		
		
		
	end;
	
	QsSdkAppInfoClass=interface(NSObjectClass)//
	['{F3F7A203-B95A-4502-A11C-71F79F134C4F}']
		//+(QsSdkAppInfo *)insQsSdk;
		function insQsSdk:QsSdkAppInfo;cdecl;
		
	end;
	
	TQsSdkAppInfo=class(TOCGenericImport<QsSdkAppInfoClass,QsSdkAppInfo>)
	end;
	
	
	
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QsSdkAppInfo_FakeLoader : QsSdkAppInfo; cdecl; external {$I FrameworkDylibPath_QsSdk.inc} name 'OBJC_CLASS_$_QsSdkAppInfo';
{$O+}



{$ENDIF}

end.

