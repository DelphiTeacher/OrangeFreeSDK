//
//  NSURLProtocolQA.h
//  QA
//
//  Created by wangqi on 2018/11/29.
//  Copyright © 2018年 冉黎. All rights reserved.
//

unit iOSapi.NSURLProtocolQA;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type

	NSURLProtocolQA=interface(NSURLProtocol)//
	['{8046E021-3E83-4E2A-B9E0-D045D601E400}']
		function responseData:NSMutableData{*};cdecl;
		procedure setResponseData(responseData:NSMutableData{*});cdecl;
		function connection:NSURLConnection{*};cdecl;
		procedure setConnection(connection:NSURLConnection{*});cdecl;
	end;

	NSURLProtocolQAClass=interface(NSURLProtocolClass)//
	['{7C41500B-4F3D-432B-A684-24FF24784641}']
	end;

	TNSURLProtocolQA=class(TOCGenericImport<NSURLProtocolQAClass,NSURLProtocolQA>)
	end;

  function RegisterNSURLProtocol:Boolean;
{$ENDIF}



implementation


{$IFDEF IOS}

function RegisterNSURLProtocol:Boolean;
var
  Cls: Pointer;
begin
  Result := False;
//  Cls := objc_getClass('NSURLProtocolQA');
//  Cls := object_getClass(Cls);
//  TNSURLProtocol.OCClass.registerClass(Cls);
  TNSURLProtocol.OCClass.registerClass((TNSURLProtocolQA.OCClass as ILocalObject).GetObjectID);
  Result := True;
end;

{$ENDIF}

end.


