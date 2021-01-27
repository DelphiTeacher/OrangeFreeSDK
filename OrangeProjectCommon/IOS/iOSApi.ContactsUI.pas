//
//  ContactsUI.h
//  ContactsUI
//
//  Copyright (c) 2015 Apple, Inc. All rights reserved.
//

unit iOSApi.ContactsUI;

interface

{$IFDEF IOS}
uses
	iOSapi.CNContactPickerViewController,
//	iOSapi.CNContactViewController,
//	iOSapi.UIApplicationShortcutIcon_Contacts,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;
const
  libContactsUI = '/System/Library/Frameworks/ContactsUI.framework/ContactsUI';

type
	//declare pointer
	id=Pointer;

{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
{$O+}


{$ENDIF}

end.

