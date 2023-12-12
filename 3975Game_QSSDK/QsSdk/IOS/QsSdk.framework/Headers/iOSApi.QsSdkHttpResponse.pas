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
	['{B9881631-9029-421B-B4A4-27E7DD8D1EDE}']
		
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
	['{8503C984-7DE0-41CE-B248-A2BB739D9F9A}']
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

