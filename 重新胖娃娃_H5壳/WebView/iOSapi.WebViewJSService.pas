//
//  WebViewJSService.h
//  QA
//
//  Created by wangqi on 2018/12/9.
//  Copyright © 2018年 冉黎. All rights reserved.
//

unit iOSApi.WebViewJSService;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.UIKit,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type

	WebViewJSService=interface(NSObject)
	['{99901761-7B30-4F62-8DDC-720B7BBFB972}']
		function delegate:Pointer;cdecl;
		procedure setDelegate(delegate:Pointer);cdecl;
		{-} procedure javascriptCallback(value:NSString{*});cdecl;
	end;

	WebViewJSServiceClass=interface(NSObjectClass)
	['{41D011A6-A7D1-47B5-95FD-1C403E47A5A6}']
		{+} function sharedInstance(webView:UIWebView{*}):Pointer;cdecl;
	end;

	TWebViewJSService=class(TOCGenericImport<WebViewJSServiceClass,WebViewJSService>)
	end;

	WebViewJSServiceDelegate=interface(IObjectiveC)
		['{C70E2E1D-3348-4E1B-9FD9-D69898E583B8}']
		{-} procedure javascriptCallback(value:NSString{*});cdecl;
	end;


{$ENDIF}

implementation



end.


