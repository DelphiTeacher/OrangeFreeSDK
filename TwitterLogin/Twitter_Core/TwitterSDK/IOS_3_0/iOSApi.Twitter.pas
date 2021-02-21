//
//  Twitter.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.Twitter;

interface

{$IFDEF IOS}
uses
	iOSapi.TWTRSession,
	iOSapi.TWTRSessionStore,
	iOSapi.UIKit,
//	iOSApi.TWTRAPIClient,
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

	
//	(^TWTRLogInCompletion)(TWTRSession *_Nullable session, NSError *_Nullable error)=void;
	TWTRLogInCompletion=procedure(session:TWTRSession;error:NSError) of object;

	
	{*
	 *  The central class of the Twitter Kit.
	 *  @note This class can only be used from the main thread.
	 }
	Twitter=interface(NSObject)//
	['{B6F31DA4-91E0-4C33-86B1-ED144EE12244}']
		
		{*
		 *  Returns the Twitter singleton.
		 *
		 *  @return The Twitter singleton.
		 }
		
		{*
		 *  Start Twitter with your consumer key and secret. These will override any credentials
		 *  present in your applications Info.plist.
		 *
		 *  You do not need to call this method unless you wish to provide credentials other than those
		 *  in your Info.plist.
		 *
		 *  @param consumerKey    Your Twitter application's consumer key.
		 *  @param consumerSecret Your Twitter application's consumer secret.
		 }
		[MethodName('startWithConsumerKey:consumerSecret:')]
		{-} procedure startWithConsumerKeyconsumerSecret(consumerKey:NSString{*};consumerSecret:NSString{*});cdecl;
		
		{*
		 *  Start Twitter with a consumer key, secret, and keychain access group. See -[Twitter startWithConsumerKey:consumerSecret:]
		 *
		 *  @param consumerKey    Your Twitter application's consumer key.
		 *  @param consumerSecret Your Twitter application's consumer secret.
		 *  @param accessGroup    An optional keychain access group to apply to session objects stored in the keychain.
		 *
		 *  @note In the majority of situations applications will not need to specify an access group to use with Twitter sessions.
		 *  This value is only needed if you plan to share credentials with another application that you control or if you are
		 *  using TwitterKit with an app extension.
		 }
		[MethodName('startWithConsumerKey:consumerSecret:accessGroup:')]
		{-} procedure startWithConsumerKeyconsumerSecretaccessGroup(consumerKey:NSString{*};consumerSecret:NSString{*};accessGroup:{nullable} NSString{*});cdecl;
		
		{*
		 *  The current version of this kit.
		 }
		function version:NSString{*};cdecl;
		procedure setVersion(version:NSString{*});cdecl;
		
		{*
		 *  Authentication configuration details. Encapsulates the `consumerKey` and `consumerSecret` credentials required to authenticate a Twitter application.
		 }
//		function authConfig:TWTRAuthConfig{*};cdecl;
//		procedure setAuthConfig(authConfig:TWTRAuthConfig{*});cdecl;

		{*
		 *  Session store exposing methods to fetch and manage active sessions. Applications that need to manage
		 *  multiple users should use the session store to authenticate and log out users.
		 }
		function sessionStore:TWTRSessionStore{*};cdecl;
		procedure setSessionStore(sessionStore:TWTRSessionStore{*});cdecl;
		
		{*
		 *  Triggers user authentication with Twitter.
		 *
		 *  This method will present UI to allow the user to log in if there are no saved Twitter login credentials.
		 *  This method is equivalent to calling loginWithMethods:completion: with TWTRLoginMethodAll.
		 *
		 *  @param completion The completion block will be called after authentication is successful or if there is an error.
		 *  @warning This method requires that you have set up your `consumerKey` and `consumerSecret`.
		 }
		{-} procedure logInWithCompletion(completion:TWTRLogInCompletion);cdecl;
		
		{*
		 *  Triggers user authentication with Twitter. Allows the developer to specify the presenting view controller.
		 *
		 *  This method will present UI to allow the user to log in if there are no saved Twitter login credentials.
		 *
		 *  @param viewController The view controller that will be used to present the authentication view.
		 *  @param completion The completion block will be called after authentication is successful or if there is an error.
		 *  @warning This method requires that you have set up your `consumerKey` and `consumerSecret`.
		 }
		[MethodName('logInWithViewController:completion:')]
		{-} procedure logInWithViewControllercompletion(viewController:{nullable} UIViewController{*};completion:TWTRLogInCompletion);cdecl;
		
		{*
		 *  Finish the `SFSafariViewController` authentication loop. This method should
		 *  be called from application:openURL:options inside the application delegate.
		 *
		 *  This method will verify an authentication token sent by the Twitter API to
		 *  finish the web-based authentication flow.
		 *
		 *  @param application  The `UIApplication` instance received as a parameter.
		 *  @param url          The `NSURL` instance received as a parameter.
		 *  @param options      The options dictionary received as a parameter.
		 *
		 *  @return Boolean specifying whether this URL was handled
		 *          by Twitter Kit or not.
		 }
		[MethodName('application:openURL:options:')]
		{-} function applicationopenURLoptions(application:UIApplication{*};url:NSURL{*};options:PNSDictionary{*}):Boolean;cdecl;
		
	end;
	
	TwitterClass=interface(NSObjectClass)//
	['{B0CEF56C-5DA7-4822-A2F5-EF2DDADF1BD6}']
		{+} function sharedInstance:Twitter{*};cdecl;
	end;
	
	TTwitter=class(TOCGenericImport<TwitterClass,Twitter>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function Twitter_FakeLoader : Twitter; cdecl; external {$I TwitterKit_DylibName.inc} name 'OBJC_CLASS_$_Twitter';
{$O+}


{$ENDIF}

end.

