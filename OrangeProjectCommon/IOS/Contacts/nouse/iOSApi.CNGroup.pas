//
//  CNGroup.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNGroup;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.ContactsDefines,
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

	
	
	
	
	{!
	 * @abstract An immutable value object representing a group.
	 *
	 * @discussion CNGroup is thread safe.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNGroup=interface(NSObject)//<NSCopying, NSMutableCopying, NSSecureCoding>
	['{9212C2E1-ADBB-4245-AED1-DCC9D3F4D10B}']
		
		{! The identifier is unique among groups on the device. It can be saved and used for fetching groups next application launch. }
		function identifier:NSString{*};cdecl;
		procedure setIdentifier(identifier:NSString{*});cdecl;
		
		function name:NSString{*};cdecl;
		procedure setName(name:NSString{*});cdecl;
		
	end;
	
	CNGroupClass=interface(NSObjectClass)//<NSCopying, NSMutableCopying, NSSecureCoding>
	['{0484DD16-808B-4B8E-9347-59B79943C28F}']
	end;
	
	TCNGroup=class(TOCGenericImport<CNGroupClass,CNGroup>)
	end;
	
	
	// Properties that are always fetched. Can be used with key value coding and observing.
	{CONTACTS_EXTERN NSString *}9_0)=CNGroupIdentifierKey	NS_AVAILABLE(10_11,;
	{CONTACTS_EXTERN NSString *}9_0)=CNGroupNameKey			NS_AVAILABLE(10_11,;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNGroup_FakeLoader : CNGroup; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNGroup';
{$O+}


{$ENDIF}

end.

