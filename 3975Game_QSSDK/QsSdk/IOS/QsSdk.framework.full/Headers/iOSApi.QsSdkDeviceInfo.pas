
unit iOSApi.QsSdkDeviceInfo;

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

	
	//@interface QsSdkDeviceInfo : NSObject
	//@interface QsSdkDeviceInfo : NSObject
	QsSdkDeviceInfo=interface(NSObject)//
	['{596F0626-7382-407E-AFF6-C42C274A17C5}']
		
		
		//-(NSString *)getQsSdkIDFA;
		function getQsSdkIDFA:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkIDFV;
		function getQsSdkIDFV:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkDeviceId;
		function getQsSdkDeviceId:NSString;cdecl;
		
		
		//// 判断是否是刘海屏
		//-(BOOL)isIPhoneNotchScreenQsSdk;
		function isIPhoneNotchScreenQsSdk:Boolean;cdecl;
		
		// 
		//// 获取刘海屏高度
		//-(CGFloat)getIPhoneNotchScreenHeightQsSdk;
		function getIPhoneNotchScreenHeightQsSdk:CGFloat;cdecl;
		
		
		//-(NSString *)getQsSdkDeviceModel;
		function getQsSdkDeviceModel:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkSystemVersion;
		function getQsSdkSystemVersion:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkUA;
		function getQsSdkUA:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkNetType;
		function getQsSdkNetType:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkNetIsp;
		function getQsSdkNetIsp:NSString;cdecl;
		
		
		//-(NSString *)getQsSdkResolution;
		function getQsSdkResolution:NSString;cdecl;
		
	end;
	
	QsSdkDeviceInfoClass=interface(NSObjectClass)//
	['{D79D1F46-3C58-4560-8B5F-C8FFC854BE5B}']
		//+(QsSdkDeviceInfo *)insQsSdk;
		function insQsSdk:QsSdkDeviceInfo;cdecl;
		
	end;
	
	TQsSdkDeviceInfo=class(TOCGenericImport<QsSdkDeviceInfoClass,QsSdkDeviceInfo>)
	end;
	
	
	
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QsSdkDeviceInfo_FakeLoader : QsSdkDeviceInfo; cdecl; external {$I FrameworkDylibPath_QsSdk.inc} name 'OBJC_CLASS_$_QsSdkDeviceInfo';
{$O+}



{$ENDIF}

end.

