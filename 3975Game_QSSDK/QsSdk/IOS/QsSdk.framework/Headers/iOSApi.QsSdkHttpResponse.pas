unit iOSApi.QsSdkHttpResponse;

interface

{$IFDEF IOS}
uses
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID

	
	
	
	
	//@interface QsSdkHttpResponse : NSObject
	//@interface QsSdkHttpResponse : NSObject
	QsSdkHttpResponse=interface(NSObject)//
	['{7773372E-FB39-43CC-9F0D-BB08ED8CB24C}']
		
		//@property (nonatomic, retain) NSString *codeQsSdk;
		function codeQsSdk:NSString;cdecl;
		procedure setCodeQsSdk(codeQsSdk:NSString);cdecl;
		//@property (nonatomic, retain) NSString *msgQsSdk;
		function msgQsSdk:NSString;cdecl;
		procedure setMsgQsSdk(msgQsSdk:NSString);cdecl;
		//@property (nonatomic, retain) NSDictionary *dataQsSdk;
		function dataQsSdk:PNSDictionary;cdecl;
		procedure setDataQsSdk(dataQsSdk:PNSDictionary);cdecl;
		
	end;
	
	QsSdkHttpResponseClass=interface(NSObjectClass)//
	['{F20D1A4D-27F9-458A-AC7E-80CD1E9BDDF4}']
	end;
	
	TQsSdkHttpResponse=class(TOCGenericImport<QsSdkHttpResponseClass,QsSdkHttpResponse>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QsSdkHttpResponse_FakeLoader : QsSdkHttpResponse; cdecl; external {$I FrameworkDylibPath_QsSdk.inc} name 'OBJC_CLASS_$_QsSdkHttpResponse';
{$O+}



{$ENDIF}

end.

