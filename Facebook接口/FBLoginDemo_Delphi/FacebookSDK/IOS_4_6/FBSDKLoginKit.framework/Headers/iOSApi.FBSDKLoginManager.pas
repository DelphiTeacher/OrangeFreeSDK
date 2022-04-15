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

unit iOSApi.FBSDKLoginManager;

interface

{$IFDEF IOS}
uses
//	iOSapi.Accounts,
	iOSapi.Foundation,
	iOSapi.UIKit,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
  iOSApi.FBSDKLoginManagerLoginResult,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	
	
	
	{*
	  Describes the call back to the FBSDKLoginManager
	 - Parameter result: the result of the authorization
	 - Parameter error: the authorization error, if any.
	 }
//	(^FBSDKLoginManagerRequestTokenHandler)(FBSDKLoginManagerLoginResult *result, NSError *error)=void;
  FBSDKLoginManagerRequestTokenHandler = procedure (result:FBSDKLoginManagerLoginResult;error:NSError) of object;

	{*
	 FBSDKDefaultAudience enum
	
	  Passed to open to indicate which default audience to use for sessions that post data to Facebook.
	
	
	
	 Certain operations such as publishing a status or publishing a photo require an audience. When the user
	 grants an application permission to perform a publish operation, a default audience is selected as the
	 publication ceiling for the application. This enumerated value allows the application to select which
	 audience to ask the user to grant publish permission for.
	 }
	FBSDKDefaultAudience_=(
	//(NSUInteger, FBSDKDefaultAudience)
	//  /** Indicates that the user's friends are able to see posts made by the application */
	//  FBSDKDefaultAudienceFriends = 0,
	//  /** Indicates that only the user is able to see posts made by the application */
	  FBSDKDefaultAudienceOnlyMe//,
	//  /** Indicates that all Facebook users are able to see posts made by the application */
	//  FBSDKDefaultAudienceEveryone,
	//};
	);
	FBSDKDefaultAudience=Integer;
	
	{*
	 FBSDKLoginBehavior enum
	
	  Passed to the \c FBSDKLoginManager to indicate how Facebook Login should be attempted.
	
	
	
	 Facebook Login authorizes the application to act on behalf of the user, using the user's
	 Facebook account. Usually a Facebook Login will rely on an account maintained outside of
	 the application, by the native Facebook application, the browser, or perhaps the device
	 itself. This avoids the need for a user to enter their username and password directly, and
	 provides the most secure and lowest friction way for a user to authorize the application to
	 interact with Facebook.
	
	 The \c FBSDKLoginBehavior enum specifies which log-in methods may be used. The SDK
	  will determine the best behavior based on the current device (such as iOS version).
	 }
	FBSDKLoginBehavior_=(
	//(NSUInteger, FBSDKLoginBehavior)
	//  /**
	//    This is the default behavior, and indicates logging in through the native
	//   Facebook app may be used. The SDK may still use Safari instead.
	//   */
	  FBSDKLoginBehaviorNative = 0,
	//  /**
	//    Attempts log in through the Safari or SFSafariViewController, if available.
	//   */
	  FBSDKLoginBehaviorBrowser,
	//  /**
	//    Attempts log in through the Facebook account currently signed in through
	//   the device Settings.
	//   @note If the account is not available to the app (either not configured by user or
	//   as determined by the SDK) this behavior falls back to \c FBSDKLoginBehaviorNative.
	//   */
	  FBSDKLoginBehaviorSystemAccount,
	//  /**
	//    Attempts log in through a modal \c UIWebView pop up
	//
	//   @note This behavior is only available to certain types of apps. Please check the Facebook
	//   Platform Policy to verify your app meets the restrictions.
	//   */
	  FBSDKLoginBehaviorWeb//,
	);
	FBSDKLoginBehavior=Integer;
	
	{*
	  `FBSDKLoginManager` provides methods for logging the user in and out.
	
	 `FBSDKLoginManager` works directly with `[FBSDKAccessToken currentAccessToken]` and
	  sets the "currentAccessToken" upon successful authorizations (or sets `nil` in case of `logOut`).
	
	 You should check `[FBSDKAccessToken currentAccessToken]` before calling logIn* to see if there is
	 a cached token available (typically in your viewDidLoad).
	
	 If you are managing your own token instances outside of "currentAccessToken", you will need to set
	 "currentAccessToken" before calling logIn* to authorize further permissions on your tokens.
	 }
	FBSDKLoginManager=interface(NSObject)//
	['{8B50E3AE-FBC7-42C7-86EE-A0D33C77956D}']
		
		{*
		  the default audience.
		
		 you should set this if you intend to ask for publish permissions.
		 }
		function defaultAudience:FBSDKDefaultAudience;cdecl;
		procedure setDefaultAudience(defaultAudience:FBSDKDefaultAudience);cdecl;
		
		{*
		  the login behavior
		 }
		function loginBehavior:FBSDKLoginBehavior;cdecl;
		procedure setLoginBehavior(loginBehavior:FBSDKLoginBehavior);cdecl;
		
		{*
		
		- Warning:use logInWithReadPermissions:fromViewController:handler: instead
		 }
//		[MethodName('logInWithReadPermissions:handler:__attribute__ ((deprecated("use logInWithReadPermissions:')]
//		{-} procedure logInWithReadPermissionshandler__attribute__ ((deprecated("use logInWithReadPermissions(permissions:NSArray{*};handler:FBSDKLoginManagerRequestTokenHandler;)):romViewController:handler: instead");cdecl;
		
		{*
		
		- Warning:use logInWithPublishPermissions:fromViewController:handler: instead
		 }
//		[MethodName('logInWithPublishPermissions:handler:__attribute__ ((deprecated("use logInWithPublishPermissions:')]
//		{-} procedure logInWithPublishPermissionshandler__attribute__ ((deprecated("use logInWithPublishPermissions(permissions:NSArray{*};handler:FBSDKLoginManagerRequestTokenHandler;)):romViewController:handler: instead");cdecl;
		
		{*
		  Logs the user in or authorizes additional permissions.
		 - Parameter permissions: the optional array of permissions. Note this is converted to NSSet and is only
		  an NSArray for the convenience of literal syntax.
		 - Parameter fromViewController: the view controller to present from. If nil, the topmost view controller will be
		  automatically determined as best as possible.
		 - Parameter handler: the callback.
		
		 Use this method when asking for read permissions. You should only ask for permissions when they
		  are needed and explain the value to the user. You can inspect the result.declinedPermissions to also
		  provide more information to the user if they decline permissions.
		
		 This method will present UI the user. You typically should check if `[FBSDKAccessToken currentAccessToken]`
		 already contains the permissions you need before asking to reduce unnecessary app switching. For example,
		 you could make that check at viewDidLoad.
		 You can only do one login call at a time. Calling a login method before the completion handler is called
		 on a previous login will return an error.
		 }
		[MethodName('logInWithReadPermissions:fromViewController:handler:')]
		{-} procedure logInWithReadPermissionsfromViewControllerhandler(permissions:NSArray{*};fromViewController:UIViewController{*};handler:FBSDKLoginManagerRequestTokenHandler);cdecl;
		
		{*
		  Logs the user in or authorizes additional permissions.
		 - Parameter permissions: the optional array of permissions. Note this is converted to NSSet and is only
		 an NSArray for the convenience of literal syntax.
		 - Parameter fromViewController: the view controller to present from. If nil, the topmost view controller will be
		 automatically determined as best as possible.
		 - Parameter handler: the callback.
		
		 Use this method when asking for publish permissions. You should only ask for permissions when they
		 are needed and explain the value to the user. You can inspect the result.declinedPermissions to also
		 provide more information to the user if they decline permissions.
		
		 This method will present UI the user. You typically should check if `[FBSDKAccessToken currentAccessToken]`
		 already contains the permissions you need before asking to reduce unnecessary app switching. For example,
		 you could make that check at viewDidLoad.
		 You can only do one login call at a time. Calling a login method before the completion handler is called
		 on a previous login will return an error.
		 }
//		[MethodName('logInWithPublishPermissions:fromViewController:handler:')]
//		{-} procedure logInWithPublishPermissionsfromViewControllerhandler(permissions:NSArray{*};fromViewController:UIViewController{*};handler:FBSDKLoginManagerRequestTokenHandler);cdecl;
		
		{*
		  Logs the user out
		
		 This calls [FBSDKAccessToken setCurrentAccessToken:nil] and [FBSDKProfile setCurrentProfile:nil].
		 }
		{-} procedure logOut;cdecl;
		
		{*
		 @method
		
		  Issues an asynchronous renewCredentialsForAccount call to the device's Facebook account store.
		
		 - Parameter handler: The completion handler to call when the renewal is completed. This can be invoked on an arbitrary thread.
		
		
		 This can be used to explicitly renew account credentials and is provided as a convenience wrapper around
		 `[ACAccountStore renewCredentialsForAccount:completion]`. Note the method will not issue the renewal call if the the
		 Facebook account has not been set on the device, or if access had not been granted to the account (though the handler
		 wil receive an error).
		
		 If the `[FBSDKAccessToken currentAccessToken]` was from the account store, a succesful renewal will also set
		 a new "currentAccessToken".
		 }
		
	end;
	
	FBSDKLoginManagerClass=interface(NSObjectClass)//
	['{CC145454-DB1F-4EB4-93ED-B036DA35D85F}']
//		{+} procedure renewSystemCredentials(handler:void (^)(ACAccountCredentialRenewResult result, NSError *error));cdecl;
	end;
	
	TFBSDKLoginManager=class(TOCGenericImport<FBSDKLoginManagerClass,FBSDKLoginManager>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

