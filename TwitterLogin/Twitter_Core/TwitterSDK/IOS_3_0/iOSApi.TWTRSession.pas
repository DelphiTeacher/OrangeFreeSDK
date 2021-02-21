//
//  TWTRSession.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRSession;

interface

{$IFDEF IOS}
uses
	iOSapi.TWTRAuthConfig,
	iOSapi.TWTRAuthSession,
	iOSapi.TWTRGuestSession,
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

	
	
	
	
	
	{*
	 *  Completion block called when user login succeeds or fails.
	 *
	 *  @param session Contains the OAuth tokens and minimal information associated with the logged in user or nil.
	 *  @param error   Error that will be non nil if the authentication request failed.
	 }
////	(^TWTRLogInCompletion)(TWTRSession *_Nullable session, NSError *_Nullable error)=void;
//	TWTRLogInCompletion=Pointer;
	{*
	 *  TWTRSession represents a user's session authenticated with the Twitter API.
	 }
	TWTRSession=interface(NSObject)//<TWTRAuthSession>
	['{4E42CF03-D977-4305-A062-FBF057232666}']
		
		{*
		 *  The authorization token.
		 }
		function authToken:NSString{*};cdecl;
		procedure setAuthToken(authToken:NSString{*});cdecl;
		{*
		 *  The authorization token secret.
		 }
		function authTokenSecret:NSString{*};cdecl;
		procedure setAuthTokenSecret(authTokenSecret:NSString{*});cdecl;
		{*
		 *  The username associated with the access token.
		 }
		function userName:NSString{*};cdecl;
		procedure setUserName(userName:NSString{*});cdecl;
		{*
		 *  The user ID associated with the access token.
		 }
		function userID:NSString{*};cdecl;
		procedure setUserID(userID:NSString{*});cdecl;
		
		{*
		 *  Returns an `TWTRSession` object initialized by copying the values from the dictionary or nil if the dictionary is missing.
		 *
		 *  @param sessionDictionary (required) The dictionary received after successfull authentication from Twitter OAuth.
		 }
		{-} function initWithSessionDictionary(sessionDictionary:PNSDictionary{*}):TWTRSession;cdecl;
		
		{*
		 *  Returns a `TWTRSession` object initialized by copying the values
		 *  from the dictionary returned from a Mobile SSO redirect URL.
		 *
		 *  @param authDictionary (required) The dictionary received after successful
		 *                                  authentication from Twitter Mobile SSO.
		 }
		{-} function initWithSSOResponse(authDictionary:PNSDictionary{*}):TWTRSession;cdecl;
		
		{*
		 *  Returns an `TWTRSession` object initialized by copying the given tokens and user info.
		 *
		 *  @param authToken       (required) The authorization token for the session
		 *  @param authTokenSecret (required) The authorization token secret for the session
		 *  @param userName        (required) The username for the user associated with the session.
		 *  @param userID          (required) The unique ID for the user associated with the session.
		 *
		 *  @return A `TWTRSession` object initialized with the provided parameters.
		 }
		[MethodName('initWithAuthToken:authTokenSecret:userName:userID:')]
		{-} function initWithAuthTokenauthTokenSecretuserNameuserID(authToken:NSString{*};authTokenSecret:NSString{*};userName:NSString{*};userID:NSString{*}):TWTRSession;cdecl;
		
		{*
		 *  Unavailable. Use -initWithSessionDictionary: instead.
		 }
//		{-} function init NS_UNAVAILABLE:TWTRSession;cdecl;

	end;
	
	TWTRSessionClass=interface(NSObjectClass)//<TWTRAuthSession>
	['{90B06E4E-5662-4F64-8158-D45D26650844}']
	end;
	
	TTWTRSession=class(TOCGenericImport<TWTRSessionClass,TWTRSession>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

