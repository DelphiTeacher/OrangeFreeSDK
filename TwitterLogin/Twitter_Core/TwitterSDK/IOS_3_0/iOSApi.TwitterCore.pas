//
//  TwitterCore.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TwitterCore;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
//	iOSapi.Accounts,
	iOSapi.CoreData,
//	iOSapi.Social,
	iOSApi.TWTRDefines,
	iOSapi.UIKit,
//	iOSapi.Cocoa,
	iOSApi.TWTRAPIErrorCode,
	iOSApi.TWTRAuthConfig,
	iOSApi.TWTRAuthSession,
	iOSApi.TWTRConstants,
	iOSApi.TWTRCoreOAuthSigning,
	iOSApi.TWTRGuestSession,
	iOSApi.TWTRSession,
	iOSApi.TWTRSessionStore,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	//#if !TARGET_OS_TV
	//#endif
	//#if !TARGET_OS_TV
	//#endif
	
	//#if IS_UIKIT_AVAILABLE
	//#else
	//#endif
	
	//#if __IPHONE_OS_VERSION_MIN_REQUIRED < 80000
	//#error "TwitterCore doesn't support iOS 7.x and lower. Please, change your minimum deployment target to iOS 8.0"
	//#endif
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

