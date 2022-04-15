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

unit iOSApi.FBSDKLoginManagerLoginResult;

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
	SysUtils,Types,FMX.Types,Classes,
  iOSApi.FBSDKAccessToken;

type
	//declare pointer
	id=Pointer;

	
	
	
	{*
	  Describes the result of a login attempt.
	 }
	FBSDKLoginManagerLoginResult=interface(NSObject)//
	['{8D3F7740-9DB4-4DEF-B858-C3C84D1DA5E9}']
		
		{*
		  the access token.
		 }
		function token:FBSDKAccessToken{*};cdecl;
		procedure setToken(token:FBSDKAccessToken{*});cdecl;

		{*
		  whether the login was cancelled by the user.
		 }
		function isCancelled:Boolean;cdecl;
		procedure setIsCancelled(isCancelled:Boolean);cdecl;
		
		{*
		  the set of permissions granted by the user in the associated request.
		
		 inspect the token's permissions set for a complete list.
		 }
		function grantedPermissions:NSSet{*};cdecl;
		procedure setGrantedPermissions(grantedPermissions:NSSet{*});cdecl;
		
		{*
		  the set of permissions declined by the user in the associated request.
		
		 inspect the token's permissions set for a complete list.
		 }
		function declinedPermissions:NSSet{*};cdecl;
		procedure setDeclinedPermissions(declinedPermissions:NSSet{*});cdecl;
		
		{*
		  Initializes a new instance.
		 - Parameter token: the access token
		 - Parameter isCancelled: whether the login was cancelled by the user
		 - Parameter grantedPermissions: the set of granted permissions
		 - Parameter declinedPermissions: the set of declined permissions
		 }
//		[MethodName('initWithToken:isCancelled:grantedPermissions:declinedPermissions:')]
//		{-} function initWithTokenisCancelledgrantedPermissionsdeclinedPermissions(token:FBSDKAccessToken{*};isCancelled:Boolean;grantedPermissions:NSSet{*};declinedPermissions:NSSet{*}):FBSDKLoginManagerLoginResult;cdecl;
	end;
	
	FBSDKLoginManagerLoginResultClass=interface(NSObjectClass)//
	['{9E37B4AF-7EC9-41F8-81E9-8557612A8E3B}']
	end;
	
	TFBSDKLoginManagerLoginResult=class(TOCGenericImport<FBSDKLoginManagerLoginResultClass,FBSDKLoginManagerLoginResult>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

