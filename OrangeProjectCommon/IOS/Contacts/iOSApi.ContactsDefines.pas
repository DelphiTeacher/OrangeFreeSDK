//
//  ContactsDefines.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.ContactsDefines;

interface

{$IFDEF IOS}
uses
	iOSapi.Availability,
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

	
	//#ifdef __cplusplus
	//#define CONTACTS_EXTERN extern "C" __attribute__((visibility ("default")))
	//#else
	//#define CONTACTS_EXTERN extern __attribute__((visibility ("default")))
	//#endif
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
{$O+}


{$ENDIF}

end.

