//
//  TWTRGuestSession.h
//  TwitterKit
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRGuestSession;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.TWTRAuthSession,
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
	 *  Completion block called when guest login succeeds or fails.
	 *
	 *  @param guestSession A `TWTRGuestSession` containing the OAuth tokens or nil.
	 *  @param error Error that will be non nil if the authentication request failed.
	 }
//	(^TWTRGuestLogInCompletion)(TWTRGuestSession *_Nullable guestSession, NSError *_Nullable error)=void;
  TWTRGuestLogInCompletion=Pointer;

	{*
	 *  `TWTRGuestSession` represents a guest session authenticated with the Twitter API. See `TWTRSession` for user sessions.
	 }
	TWTRGuestSession=interface(NSObject)//<TWTRBaseSession>
	['{0DC4409E-6F84-492F-BA36-21131BFEEEC2}']
		
		{*
		 *  The bearer access token for guest auth.
		 }
		function accessToken:NSString{*};cdecl;
		procedure setAccessToken(accessToken:NSString{*});cdecl;
		
		{*
		 *  The guest access token.
		 }
		function guestToken:NSString{*};cdecl;
		procedure setGuestToken(guestToken:NSString{*});cdecl;
		
		{*
		 *  This property can be used to make a best guess about whether the token will
		 *  still be valid or not.
		 *
		 *  Guest tokens expire after a short time interval but
		 *  the actual interval is not specified. This property will return YES if a sufficient
		 *  amount of time has passed indicating that the token is probably no longer valid.
		 *  In most situations you should make a request with the token and see if the API
		 *  accepts the token or not.
		 }
		function probablyNeedsRefreshing:Boolean;cdecl;
		procedure setProbablyNeedsRefreshing(probablyNeedsRefreshing:Boolean);cdecl;
		
		{*
		 *  Returns an `TWTRGuestSession` object initialized by copying the values from the dictionary or nil if the dictionary is missing.
		 *
		 *  @param sessionDictionary (required) The dictionary received after successfull authentication from Twitter guest-only authentication.
		 }
		{-} function initWithSessionDictionary(sessionDictionary:PNSDictionary{*}):TWTRGuestSession;cdecl;
		
		{*
		 *  Returns a `TWTRGuestSession` object
		 *
		 *  @param accessToken the access token
		 *  @param guestToken the guest access token
		 }
		[MethodName('initWithAccessToken:guestToken:')]
		{-} function initWithAccessTokenguestToken(accessToken:NSString{*};guestToken:{nullable} NSString{*}):TWTRGuestSession;cdecl;
		
		{*
		 *  Unavailable. Use `-initWithSessionDictionary:` instead.
		 }
//		{-} function init NS_UNAVAILABLE:TWTRGuestSession;cdecl;

	end;
	
	TWTRGuestSessionClass=interface(NSObjectClass)//<TWTRBaseSession>
	['{E6FADD49-B5DC-4B21-BEF0-3B6F8B397F3D}']
	end;
	
	TTWTRGuestSession=class(TOCGenericImport<TWTRGuestSessionClass,TWTRGuestSession>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

