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

unit iOSApi.FBSDKAccessToken;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
//	iOSapi.FBSDKCopying,
	iOSapi.FBSDKGraphRequestConnection,
//	iOSapi.FBSDKMacros,
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

	
	
	{*
	  Notification indicating that the `currentAccessToken` has changed.
	
	 the userInfo dictionary of the notification will contain keys
	 `FBSDKAccessTokenChangeOldKey` and
	 `FBSDKAccessTokenChangeNewKey`.
	 }
	
	
	{*
	  A key in the notification's userInfo that will be set
	  if and only if the user ID changed between the old and new tokens.
	
	 Token refreshes can occur automatically with the SDK
	  which do not change the user. If you're only interested in user
	  changes (such as logging out), you should check for the existence
	  of this key. The value is a NSNumber with a boolValue.
	
	  On a fresh start of the app where the SDK reads in the cached value
	  of an access token, this key will also exist since the access token
	  is moving from a null state (no user) to a non-null state (user).
	 }
	
	
	{
	  key in notification's userInfo object for getting the old token.
	
	 If there was no old token, the key will not be present.
	 }
	
	
	{
	  key in notification's userInfo object for getting the new token.
	
	 If there is no new token, the key will not be present.
	 }
	
	
	
	{*
	  Represents an immutable access token for using Facebook services.
	 }
	FBSDKAccessToken=interface(NSObject)//<FBSDKCopying, NSSecureCoding>
	['{0512491C-D899-4D7D-A72A-D3710D06A1D9}']
		
		{*
		  Returns the app ID.
		 }
		function appID:NSString{*};cdecl;
		procedure setAppID(appID:NSString{*});cdecl;
		
		{*
		  Returns the known declined permissions.
		 }
		function declinedPermissions:NSSet{*};cdecl;
		procedure setDeclinedPermissions(declinedPermissions:NSSet{*});cdecl;
		
		{*
		  Returns the expiration date.
		 }
		function expirationDate:NSDate{*};cdecl;
		procedure setExpirationDate(expirationDate:NSDate{*});cdecl;
		
		{*
		  Returns the known granted permissions.
		 }
		function permissions:NSSet{*};cdecl;
		procedure setPermissions(permissions:NSSet{*});cdecl;
		
		{*
		  Returns the date the token was last refreshed.
		}
		function refreshDate:NSDate{*};cdecl;
		procedure setRefreshDate(refreshDate:NSDate{*});cdecl;
		
		{*
		  Returns the opaque token string.
		 }
		function tokenString:NSString{*};cdecl;
		procedure setTokenString(tokenString:NSString{*});cdecl;
		
		{*
		  Returns the user ID.
		 }
		function userID:NSString{*};cdecl;
		procedure setUserID(userID:NSString{*});cdecl;
		
//		{-} function init NS_UNAVAILABLE:FBSDKAccessToken;cdecl;

		{*
		  Initializes a new instance.
		 - Parameter tokenString: the opaque token string.
		 - Parameter permissions: the granted permissions. Note this is converted to NSSet and is only
		 an NSArray for the convenience of literal syntax.
		 - Parameter declinedPermissions: the declined permissions. Note this is converted to NSSet and is only
		 an NSArray for the convenience of literal syntax.
		 - Parameter appID: the app ID.
		 - Parameter userID: the user ID.
		 - Parameter expirationDate: the optional expiration date (defaults to distantFuture).
		 - Parameter refreshDate: the optional date the token was last refreshed (defaults to today).
		
		 This initializer should only be used for advanced apps that
		 manage tokens explicitly. Typical login flows only need to use `FBSDKLoginManager`
		 along with `+currentAccessToken`.
		 }
		[MethodName('initWithTokenString:permissions:declinedPermissions:appID:userID:expirationDate:refreshDate:')]
		{-} function initWithTokenStringpermissionsdeclinedPermissionsappIDuserIDexpirationDaterefreshDate(tokenString:NSString{*};permissions:NSArray{*};declinedPermissions:NSArray{*};appID:NSString{*};userID:NSString{*};expirationDate:NSDate{*};refreshDate:NSDate{*}):FBSDKAccessToken;cdecl;
		
		{*
		  Convenience getter to determine if a permission has been granted
		 - Parameter permission:  The permission to check.
		 }
		{-} function hasGranted(permission:NSString{*}):Boolean;cdecl;
		
		{*
		  Compares the receiver to another FBSDKAccessToken
		 - Parameter token: The other token
		 - Returns: YES if the receiver's values are equal to the other token's values; otherwise NO
		 }
		{-} function isEqualToAccessToken(token:FBSDKAccessToken{*}):Boolean;cdecl;
		
		{*
		  Returns the "global" access token that represents the currently logged in user.
		
		 The `currentAccessToken` is a convenient representation of the token of the
		 current user and is used by other SDK components (like `FBSDKLoginManager`).
		 }
		
		{*
		  Sets the "global" access token that represents the currently logged in user.
		 - Parameter token: The access token to set.
		
		 This will broadcast a notification and save the token to the app keychain.
		 }
		
		{*
		  Refresh the current access token's permission state and extend the token's expiration date,
		  if possible.
		 - Parameter completionHandler: an optional callback handler that can surface any errors related to permission refreshing.
		
		 On a successful refresh, the currentAccessToken will be updated so you typically only need to
		  observe the `FBSDKAccessTokenDidChangeNotification` notification.
		
		 If a token is already expired, it cannot be refreshed.
		 }
		
	end;
	
	FBSDKAccessTokenClass=interface(NSObjectClass)//<FBSDKCopying, NSSecureCoding>
	['{F4085B04-9120-4F94-AC93-905D1F1C1967}']
//		{+} function new NS_UNAVAILABLE:FBSDKAccessToken;cdecl;
		{+} function currentAccessToken:FBSDKAccessToken{*};cdecl;
		{+} procedure setCurrentAccessToken(token:FBSDKAccessToken{*});cdecl;
//		{+} procedure refreshCurrentAccessToken(completionHandler:FBSDKGraphRequestHandler);cdecl;
	end;
	
	TFBSDKAccessToken=class(TOCGenericImport<FBSDKAccessTokenClass,FBSDKAccessToken>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}

//{$O-}
//function FBSDKAccessToken_FakeLoader : FBSDKAccessToken; cdecl; external {$I FBSDKCoreKit_DylibName.inc} name 'OBJC_CLASS_$_FBSDKAccessToken';
//{$O+}


{$ENDIF}

end.

