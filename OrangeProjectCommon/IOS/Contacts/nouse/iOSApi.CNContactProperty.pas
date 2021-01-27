//
//  CNContactProperty.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNContactProperty;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
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
	 * @abstract Contains related information for a specific contact property.
	 *
	 * @discussion CNContactProperty is used by the CNContactPicker to return the user's selected property.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNContactProperty=interface(NSObject)//<NSCopying, NSSecureCoding>
	['{9299672F-25D2-4609-AF0F-43BDAB77CA2E}']
		
		function contact:CNContact{*};cdecl;
		procedure setContact(contact:CNContact{*});cdecl;
		
		{!
		 * @abstract The key of the contact property, as defined in CNContact.h.
		 }
		function key:NSString{*};cdecl;
		procedure setKey(key:NSString{*});cdecl;
		
		{!
		 * @abstract The value of the property.
		 }
		function value:id;cdecl;
		procedure setValue(value:id);cdecl;
		
		{!
		 * @abstract The identifier of the labeled value if the property is an array of labeled values, otherwise is nil.
		 }
		function identifier:NSString{*};cdecl;
		procedure setIdentifier(identifier:NSString{*});cdecl;
		
		{!
		 * @abstract The label of the labeled value if the property is an array of labeled values, otherwise is nil.
		 }
		function label:NSString{*};cdecl;
		procedure setLabel(label:NSString{*});cdecl;
		
	end;
	
	CNContactPropertyClass=interface(NSObjectClass)//<NSCopying, NSSecureCoding>
	['{1954B0CA-130A-48E8-B44E-AE34D82D1E53}']
	end;
	
	TCNContactProperty=class(TOCGenericImport<CNContactPropertyClass,CNContactProperty>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContactProperty_FakeLoader : CNContactProperty; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNContactProperty';
{$O+}


{$ENDIF}

end.

