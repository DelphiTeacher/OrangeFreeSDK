//
//  CNContactUserDefaults.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNContactsUserDefaults;

interface

{$IFDEF IOS}
uses
	iOSapi.CNContactFetchRequest,
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

	
	
	
	
	{!
	 * @abstract The user defaults for contacts.
	 *
	 * @note This class is not thread safe.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNContactsUserDefaults=interface(NSObject)//
	['{17334F63-9028-497C-9238-97B16F063182}']
		
		
		function sortOrder:CNContactSortOrder;cdecl;
		procedure setSortOrder(sortOrder:CNContactSortOrder);cdecl;
		
		function countryCode:NSString{*};cdecl;
		procedure setCountryCode(countryCode:NSString{*});cdecl;
		
	end;
	
	CNContactsUserDefaultsClass=interface(NSObjectClass)//
	['{EF95FAC0-A5DD-43B6-B84B-88EAA6F3CA78}']
		{+} function sharedDefaults:CNContactsUserDefaults;cdecl;
	end;
	
	TCNContactsUserDefaults=class(TOCGenericImport<CNContactsUserDefaultsClass,CNContactsUserDefaults>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContactsUserDefaults_FakeLoader : CNContactsUserDefaults; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNContactsUserDefaults';
{$O+}


{$ENDIF}

end.

