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
	['{90A8C224-808F-4AD0-98B8-8DD624C0EFB0}']
		
		
		
		
	end;
	
	QsSdkUtilsClass=interface(NSObjectClass)//
	['{D7BC30A5-1E15-429F-92BB-1A64B2FEF62E}']
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

