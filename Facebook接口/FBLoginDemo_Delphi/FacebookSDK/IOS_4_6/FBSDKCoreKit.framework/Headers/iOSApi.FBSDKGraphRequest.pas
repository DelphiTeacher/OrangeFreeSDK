// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

unit iOSApi.FBSDKGraphRequest;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.FBSDKGraphRequestConnection,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID

	
	
	
	
	{*
	  Represents a request to the Facebook Graph API.
	
	
	 `FBSDKGraphRequest` encapsulates the components of a request (the
	 Graph API path, the parameters, error recovery behavior) and should be
	 used in conjunction with `FBSDKGraphRequestConnection` to issue the request.
	
	 Nearly all Graph APIs require an access token. Unless specified, the
	 `[FBSDKAccessToken currentAccessToken]` is used. Therefore, most requests
	 will require login first (see `FBSDKLoginManager` in FBSDKLoginKit.framework).
	
	 A `- start` method is provided for convenience for single requests.
	
	 By default, FBSDKGraphRequest will attempt to recover any errors returned from
	 Facebook. You can disable this via `disableErrorRecovery:`.
	
	- See:FBSDKGraphErrorRecoveryProcessor
	 }
//typedef void (^FBSDKGraphRequestHandler)(FBSDKGraphRequestConnection *connection,
//                                         id result,
//                                         NSError *error);

  FBSDKGraphRequestHandler=procedure (connection:FBSDKGraphRequestConnection;result:id;error:NSError) of object;

	FBSDKGraphRequest=interface(NSObject)//
	['{BDF6A8A7-3576-4108-8598-A5837924C4B2}']
		
		{*
		  Initializes a new instance that use use `[FBSDKAccessToken currentAccessToken]`.
		 - Parameter graphPath: the graph path (e.g., @"me").
		 - Parameter parameters: the optional parameters dictionary.
		 }
		[MethodName('initWithGraphPath:parameters:')]
		{-} function initWithGraphPathparameters(graphPath:NSString{*};parameters:PNSDictionary{*}):FBSDKGraphRequest;cdecl;
		
		{*
		  Initializes a new instance that use use `[FBSDKAccessToken currentAccessToken]`.
		 - Parameter graphPath: the graph path (e.g., @"me").
		 - Parameter parameters: the optional parameters dictionary.
		 - Parameter HTTPMethod: the optional HTTP method. nil defaults to @"GET".
		 }
		[MethodName('initWithGraphPath:parameters:HTTPMethod:')]
		{-} function initWithGraphPathparametersHTTPMethod(graphPath:NSString{*};parameters:PNSDictionary{*};HTTPMethod:NSString{*}):FBSDKGraphRequest;cdecl;
		
		{*
		  Initializes a new instance.
		 - Parameter graphPath: the graph path (e.g., @"me").
		 - Parameter parameters: the optional parameters dictionary.
		 - Parameter tokenString: the token string to use. Specifying nil will cause no token to be used.
		 - Parameter version: the optional Graph API version (e.g., @"v2.0"). nil defaults to `[FBSDKSettings graphAPIVersion]`.
		 - Parameter HTTPMethod: the optional HTTP method (e.g., @"POST"). nil defaults to @"GET".
		 }
		[MethodName('initWithGraphPath:parameters:tokenString:version:HTTPMethod:')]
		{-} function initWithGraphPathparameterstokenStringversionHTTPMethod(graphPath:NSString{*};parameters:PNSDictionary{*};tokenString:NSString{*};version:NSString{*};HTTPMethod:NSString{*}):FBSDKGraphRequest;cdecl;
		
		{*
		  The request parameters.
		 }
		function parameters:NSMutableDictionary{*};cdecl;
		procedure setParameters(parameters:NSMutableDictionary{*});cdecl;
		
		{*
		  The access token string used by the request.
		 }
		function tokenString:NSString{*};cdecl;
		procedure setTokenString(tokenString:NSString{*});cdecl;
		
		{*
		  The Graph API endpoint to use for the request, for example "me".
		 }
		function graphPath:NSString{*};cdecl;
		procedure setGraphPath(graphPath:NSString{*});cdecl;
		
		{*
		  The HTTPMethod to use for the request, for example "GET" or "POST".
		 }
		function HTTPMethod:NSString{*};cdecl;
		procedure setHTTPMethod(HTTPMethod:NSString{*});cdecl;
		
		{*
		  The Graph API version to use (e.g., "v2.0")
		 }
		function version:NSString{*};cdecl;
		procedure setVersion(version:NSString{*});cdecl;
		
		{*
		  If set, disables the automatic error recovery mechanism.
		 - Parameter disable: whether to disable the automatic error recovery mechanism
		
		 By default, non-batched FBSDKGraphRequest instances will automatically try to recover
		 from errors by constructing a `FBSDKGraphErrorRecoveryProcessor` instance that
		 re-issues the request on successful recoveries. The re-issued request will call the same
		 handler as the receiver but may occur with a different `FBSDKGraphRequestConnection` instance.
		
		 This will override [FBSDKSettings setGraphErrorRecoveryDisabled:].
		 }
		{-} procedure setGraphErrorRecoveryDisabled(disable:Boolean);cdecl;
		
		{*
		  Starts a connection to the Graph API.
		 - Parameter handler: The handler block to call when the request completes.
		 }
		{-} function startWithCompletionHandler(handler:FBSDKGraphRequestHandler):FBSDKGraphRequestConnection{*};cdecl;

	end;
	
	FBSDKGraphRequestClass=interface(NSObjectClass)//
	['{23689563-6EFB-47D3-BF75-307C02B0C03D}']
	end;
	
	TFBSDKGraphRequest=class(TOCGenericImport<FBSDKGraphRequestClass,FBSDKGraphRequest>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

