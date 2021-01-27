//
//  CNContact+NSItemProvider.h
//  Contacts
//
//  Copyright (c) 2017 Apple Inc. All rights reserved.
//

unit iOSApi.CNContact+NSItemProvider;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.CNContact,
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

	
	CNContact=interface()//NSItemProvider
	['{6F79874D-DAF2-42E3-8B7B-881D4D5E3E5E}']
		
	end;
	
	CNContactClass=interface(Class)//NSItemProvider
	['{951C9226-1EE2-4BFA-AD59-BEA6B706C941}']
	end;
	
	TCNContact=class(TOCGenericImport<CNContactClass,CNContact>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContact_FakeLoader : CNContact; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNContact';
{$O+}


{$ENDIF}

end.

