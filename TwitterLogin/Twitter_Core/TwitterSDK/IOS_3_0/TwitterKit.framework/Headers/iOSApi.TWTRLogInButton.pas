//
//  TWTRLogInButton.h
//  TwitterKit
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRLogInButton;

interface

{$IFDEF IOS}
uses
	iOSapi.TWTRSession,
	iOSapi.Twitter,
	iOSapi.UIKit,
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

	
	
	
	{*
	 *  A Button which launches the sign in to Twitter flow when tapped.
	 }
	TWTRLogInButton=interface(UIButton)//
	['{2302210A-3EA7-46BA-8826-565A6D3147AF}']
		
		{*
		 *  The completion block to be called with a `TWTRSession` if successful,
		 *  and a `NSError` if logging in failed or was canceled.
		 }
		function logInCompletion:TWTRLogInCompletion;cdecl;
		procedure setLogInCompletion(logInCompletion:TWTRLogInCompletion);cdecl;
		
		{*
		 *  Returns a new log in button which launches Twitter log in when tapped and
		 *  calls `completion` when logging in succeeds or fails.
		 *
		 *  Internally, this button simply calls `-[Twitter logInWithCompletion:]`.
		 *
		 *  @param completion The completion to be called with a `TWTRSession` if successful,
		 *         and a `NSError` if logging in failed or was canceled.
		 *  @return An initialized `TWTRLogInButton`.
		 }
		
	end;
	
	TWTRLogInButtonClass=interface(UIButtonClass)//
	['{E8A5D84B-4E6D-4D47-B0D8-6B0865C73475}']
		{+} function buttonWithLogInCompletion(completion:TWTRLogInCompletion):TWTRLogInButton;cdecl;
	end;
	
	TTWTRLogInButton=class(TOCGenericImport<TWTRLogInButtonClass,TWTRLogInButton>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

