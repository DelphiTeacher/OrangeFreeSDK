//
//  TWTROAuthSigning.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTROAuthSigning;

interface

{$IFDEF IOS}
uses
	iOSapi.TWTRCoreOAuthSigning,
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

	
	
	
	
	
	
	{*
	 *  This class provides tools to generate OAuth signatures.
	 }
	TWTROAuthSigning=interface(NSObject)//<TWTRCoreOAuthSigning>
	['{812DAD78-8658-4C08-8F05-86E87D9AA2BE}']
		
		{*
		 *  @name Initialization
		 }
		
		{*
		 *  Instantiate a `TWTROAuthSigning` object with the parameters it needs to generate the OAuth signatures.
		 *
		 *  @param authConfig       (required) Encapsulates credentials required to authenticate a Twitter application.
		 *  @param authSession      (required) Encapsulated credentials associated with a user session.
		 *
		 *  @return An initialized `TWTROAuthSigning` object or nil if any of the parameters are missing.
		 *
		 *  @note If you want to generate OAuth Echo headers to verify Digits' credentials, see `DGTOAuthSigning`.
		 *
		 *  @see TWTRAuthConfig
		 *  @see TWTRSession
		 }
		[MethodName('initWithAuthConfig:authSession:')]
		{-} function initWithAuthConfigauthSession(authConfig:TWTRAuthConfig{*};authSession:TWTRSession{*}):TWTROAuthSigning;cdecl;
		
		{*
		 *  Unavailable. Use `-initWithAuthConfig:authSession:` instead.
		 }
		{-} function init NS_UNAVAILABLE:TWTROAuthSigning;cdecl;
		
	end;
	
	TWTROAuthSigningClass=interface(NSObjectClass)//<TWTRCoreOAuthSigning>
	['{F1EDF70A-FA63-41DE-8EA4-877692D866DF}']
	end;
	
	TTWTROAuthSigning=class(TOCGenericImport<TWTROAuthSigningClass,TWTROAuthSigning>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

