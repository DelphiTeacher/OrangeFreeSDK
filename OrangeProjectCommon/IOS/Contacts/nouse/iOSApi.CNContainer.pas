//
//  CNContainer.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNContainer;

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

	
	
	
	CNContainerType_=(
	//(NSInteger, CNContainerType)
	    CNContainerTypeUnassigned = 0,
	    CNContainerTypeLocal,
	    CNContainerTypeExchange,
	    CNContainerTypeCardDAV
	);
	CNContainerType=Integer;
	
	
	{!
	 * @abstract An immutable value object representing a container.
	 *
	 * @discussion CNContainer is thread safe.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNContainer=interface(NSObject)//<NSCopying, NSSecureCoding>
	['{A70F22A7-F426-4854-A253-A34AEC1D947C}']
		
		{! The identifier is unique among containers on the device. It can be saved and used for fetching containers next application launch. }
		function identifier:NSString{*};cdecl;
		procedure setIdentifier(identifier:NSString{*});cdecl;
		
		function name:NSString{*};cdecl;
		procedure setName(name:NSString{*});cdecl;
		[MethodName('type:')]
		function _type:CNContainerType;cdecl;
		procedure setType(_type:CNContainerType);cdecl;
		
	end;
	
	CNContainerClass=interface(NSObjectClass)//<NSCopying, NSSecureCoding>
	['{79F157A8-CDC0-4027-9FA8-0E3ECE5DA931}']
	end;
	
	TCNContainer=class(TOCGenericImport<CNContainerClass,CNContainer>)
	end;
	
	
	// Properties that are always fetched. Can be used with key value coding and observing.
	{CONTACTS_EXTERN NSString *}9_0)=CNContainerIdentifierKey	NS_AVAILABLE(10_11,;
	{CONTACTS_EXTERN NSString *}9_0)=CNContainerNameKey			NS_AVAILABLE(10_11,;
	{CONTACTS_EXTERN NSString *}9_0)=CNContainerTypeKey			NS_AVAILABLE(10_11,;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContainer_FakeLoader : CNContainer; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNContainer';
{$O+}


{$ENDIF}

end.

