unit iOSApi.QsSdkUtils;

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
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID

	
	//@interface QsSdkUtils : NSObject
	//@interface QsSdkUtils : NSObject
	QsSdkUtils=interface(NSObject)//
	['{28A718E5-825E-42BB-8F78-5CAD44C1D08C}']
		
		
		
		
	end;
	
	QsSdkUtilsClass=interface(NSObjectClass)//
	['{2B99C55C-4526-4470-8B48-9788A3035AE3}']
		//+(void)saveScreenCutPhotoQsSdk:(UIView *)view;
		procedure saveScreenCutPhotoQsSdk(view:UIView);cdecl;
		
		//+(BOOL)checkNullQsSdk:(NSString *)text;
		function checkNullQsSdk(text:NSString):Boolean;cdecl;
		
		//+(NSString *)dicToJsonQsSdk:(NSDictionary *)dic;
		function dicToJsonQsSdk(dic:PNSDictionary):NSString;cdecl;
		
	end;
	
	TQsSdkUtils=class(TOCGenericImport<QsSdkUtilsClass,QsSdkUtils>)
	end;
	
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QsSdkUtils_FakeLoader : QsSdkUtils; cdecl; external {$I FrameworkDylibPath_QsSdk.inc} name 'OBJC_CLASS_$_QsSdkUtils';
{$O+}



{$ENDIF}

end.

