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

unit iOSApi.FBSDKSettings;

interface

{$IFDEF IOS}
uses
	iOSapi.UIKit,
	iOSapi.FBSDKMacros,
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

	
	
	{
	 * Constants defining logging behavior.  Use with <[FBSDKSettings setLoggingBehavior]>.
	 }
	
	{* Include access token in logging. }
	
	
	{* Log performance characteristics }
	
	
	{* Log FBSDKAppEvents interactions }
	
	
	{* Log Informational occurrences }
	
	
	{* Log cache errors. }
	
	
	{* Log errors from SDK UI controls }
	
	
	{* Log debug warnings from API response, i.e. when friends fields requested, but user_friends permission isn't granted. }
	
	
	{* Log warnings from API response, i.e. when requested feature will be deprecated in next version of API.
	 Info is the lowest level of severity, using it will result in logging all previously mentioned levels.
	 }
	
	
	{* Log errors from SDK network requests }
	
	
	{* Log errors likely to be preventable by the developer. This is in the default set of enabled logging behaviors. }
	
	
	FBSDKSettings=interface(NSObject)//
	['{B0FBE8E4-FF83-47BE-AA50-64E8E2A83D27}']
		
		{*
		  Get the Facebook App ID used by the SDK.
		
		 If not explicitly set, the default will be read from the application's plist (FacebookAppID).
		 }
		
		{*
		  Set the Facebook App ID to be used by the SDK.
		 - Parameter appID: The Facebook App ID to be used by the SDK.
		 }
		
		{*
		  Get the default url scheme suffix used for sessions.
		
		 If not explicitly set, the default will be read from the application's plist (FacebookUrlSchemeSuffix).
		 }
		
		{*
		  Set the app url scheme suffix used by the SDK.
		 - Parameter appURLSchemeSuffix: The url scheme suffix to be used by the SDK.
		 }
		
		{*
		  Retrieve the Client Token that has been set via [FBSDKSettings setClientToken].
		
		 If not explicitly set, the default will be read from the application's plist (FacebookClientToken).
		 }
		
		{*
		  Sets the Client Token for the Facebook App.
		
		 This is needed for certain API calls when made anonymously, without a user-based access token.
		 - Parameter clientToken: The Facebook App's "client token", which, for a given appid can be found in the Security
		 section of the Advanced tab of the Facebook App settings found at <https://developers.facebook.com/apps/[your-app-id]>
		 }
		
		{*
		  A convenient way to toggle error recovery for all FBSDKGraphRequest instances created after this is set.
		 - Parameter disableGraphErrorRecovery: YES or NO.
		 }
		
		{*
		  Get the Facebook Display Name used by the SDK.
		
		 If not explicitly set, the default will be read from the application's plist (FacebookDisplayName).
		 }
		
		{*
		  Set the default Facebook Display Name to be used by the SDK.
		
		  This should match the Display Name that has been set for the app with the corresponding Facebook App ID,
		 in the Facebook App Dashboard.
		 - Parameter displayName: The Facebook Display Name to be used by the SDK.
		 }
		
		{*
		  Get the Facebook domain part.
		
		 If not explicitly set, the default will be read from the application's plist (FacebookDomainPart).
		 }
		
		{*
		  Set the subpart of the Facebook domain.
		
		 This can be used to change the Facebook domain (e.g. @"beta") so that requests will be sent to
		 graph.beta.facebook.com
		 - Parameter facebookDomainPart: The domain part to be inserted into facebook.com.
		 }
		
		{*
		  The quality of JPEG images sent to Facebook from the SDK.
		
		 If not explicitly set, the default is 0.9.
		
		- See:[UIImageJPEGRepresentation](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKitFunctionReference/#//apple_ref/c/func/UIImageJPEGRepresentation) }
		
		{*
		  Set the quality of JPEG images sent to Facebook from the SDK.
		 - Parameter JPEGCompressionQuality: The quality for JPEG images, expressed as a value from 0.0 to 1.0.
		
		- See:[UIImageJPEGRepresentation](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKitFunctionReference/#//apple_ref/c/func/UIImageJPEGRepresentation) }
		
		{*
		  Flag which controls the auto logging of basic app events, such as activateApp and deactivateApp.
		 If not explicitly set, the default is 1 - true
		 }
		
		{*
		 Set the flag which controls the auto logging of basic app events, such as activateApp and deactivateApp.
		 - Parameter AutoLogAppEventsEnabled: Flag value, expressed as a value from 0 - false or 1 - true.
		 }
		
		{*
		  Gets whether data such as that generated through FBSDKAppEvents and sent to Facebook should be restricted from being used for other than analytics and conversions.  Defaults to NO.  This value is stored on the device and persists across app launches.
		 }
		
		{*
		  Sets whether data such as that generated through FBSDKAppEvents and sent to Facebook should be restricted from being used for other than analytics and conversions.  Defaults to NO.  This value is stored on the device and persists across app launches.
		
		 - Parameter limitEventAndDataUsage:   The desired value.
		 }
		
		{*
		  Retrieve the current iOS SDK version.
		 }
		
		{*
		  Retrieve the current Facebook SDK logging behavior.
		 }
		
		{*
		  Set the current Facebook SDK logging behavior.  This should consist of strings defined as
		 constants with FBSDKLoggingBehavior*.
		
		 - Parameter loggingBehavior: A set of strings indicating what information should be logged.  If nil is provided, the logging
		 behavior is reset to the default set of enabled behaviors.  Set to an empty set in order to disable all logging.
		
		
		 You can also define this via an array in your app plist with key "FacebookLoggingBehavior" or add and remove individual values via enableLoggingBehavior: or disableLogginBehavior:
		 }
		
		{*
		  Enable a particular Facebook SDK logging behavior.
		
		 - Parameter loggingBehavior: The LoggingBehavior to enable. This should be a string defined as a constant with FBSDKLoggingBehavior*.
		 }
		
		{*
		  Disable a particular Facebook SDK logging behavior.
		
		 - Parameter loggingBehavior: The LoggingBehavior to disable. This should be a string defined as a constant with FBSDKLoggingBehavior*.
		 }
		
		{*
		  Set the user defaults key used by legacy token caches.
		
		 - Parameter tokenInformationKeyName: the key used by legacy token caches.
		
		
		 Use this only if you customized FBSessionTokenCachingStrategy in v3.x of
		  the Facebook SDK for iOS.
		}
		
		{*
		  Get the user defaults key used by legacy token caches.
		}
		
		{*
		  Overrides the default Graph API version to use with `FBSDKGraphRequests`. This overrides `FBSDK_TARGET_PLATFORM_VERSION`.
		
		 The string should be of the form `@"v2.7"`.
		}
		
		{*
		  Returns the default Graph API version. Defaults to `FBSDK_TARGET_PLATFORM_VERSION`
		}
		
	end;
	
	FBSDKSettingsClass=interface(NSObjectClass)//
	['{1559CAC2-469B-4FAA-BFCE-555357D09884}']
		{+} function appID:NSString{*};cdecl;
		{+} procedure setAppID(appID:NSString{*});cdecl;
		{+} function appURLSchemeSuffix:NSString{*};cdecl;
		{+} procedure setAppURLSchemeSuffix(appURLSchemeSuffix:NSString{*});cdecl;
		{+} function clientToken:NSString{*};cdecl;
		{+} procedure setClientToken(clientToken:NSString{*});cdecl;
		{+} procedure setGraphErrorRecoveryDisabled(disableGraphErrorRecovery:Boolean);cdecl;
		{+} function displayName:NSString{*};cdecl;
		{+} procedure setDisplayName(displayName:NSString{*});cdecl;
		{+} function facebookDomainPart:NSString{*};cdecl;
		{+} procedure setFacebookDomainPart(facebookDomainPart:NSString{*});cdecl;
		{+} function JPEGCompressionQuality:CGFloat;cdecl;
		{+} procedure setJPEGCompressionQuality(JPEGCompressionQuality:CGFloat);cdecl;
		{+} function autoLogAppEventsEnabled:NSNumber{*};cdecl;
		{+} procedure setAutoLogAppEventsEnabled(AutoLogAppEventsEnabled:NSNumber{*});cdecl;
		{+} function limitEventAndDataUsage:Boolean;cdecl;
		{+} procedure setLimitEventAndDataUsage(limitEventAndDataUsage:Boolean);cdecl;
		{+} function sdkVersion:NSString{*};cdecl;
		{+} function loggingBehavior:NSSet{*};cdecl;
		{+} procedure setLoggingBehavior(loggingBehavior:NSSet{*});cdecl;
		{+} procedure enableLoggingBehavior(loggingBehavior:NSString{*});cdecl;
		{+} procedure disableLoggingBehavior(loggingBehavior:NSString{*});cdecl;
		{+} procedure setLegacyUserDefaultTokenInformationKeyName(tokenInformationKeyName:NSString{*});cdecl;
		{+} function legacyUserDefaultTokenInformationKeyName:NSString{*};cdecl;
		{+} procedure setGraphAPIVersion(version:NSString{*});cdecl;
		{+} function graphAPIVersion:NSString{*};cdecl;
	end;
	
	TFBSDKSettings=class(TOCGenericImport<FBSDKSettingsClass,FBSDKSettings>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

