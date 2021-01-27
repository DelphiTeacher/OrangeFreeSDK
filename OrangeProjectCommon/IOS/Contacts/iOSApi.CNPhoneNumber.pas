//
//  CNPhoneNumber.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNPhoneNumber;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
//	iOSapi.ContactsDefines,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

const
  libContacts = '/System/Library/Frameworks/Contacts.framework/Contacts';

type
	//declare pointer
	id=Pointer;
  instancetype=Pointer;
	
	
	
	
	{!
	 * @abstract An immutable value object representing a phone number.
	 *
	 * @discussion CNPhoneNumber is thread safe.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNPhoneNumber=interface(NSObject)//<NSCopying, NSSecureCoding>
	['{4B42799C-8D65-4718-A097-A99EC29D4474}']
		
		{! These will return nil if the stringValue is nil. }
//		{-} function initWithStringValue(string:NSString{*}):{nullable} instancetype;cdecl;
//
//		{-} function init{ NS_DEPRECATED(10_11, 10_13, 9_0, 11_0, "Use initWithStringValue:null_unspecified instancetype}:;cdecl;

		function stringValue:NSString{*};cdecl;
		procedure setStringValue(stringValue:NSString{*});cdecl;

	end;
	
	CNPhoneNumberClass=interface(NSObjectClass)//<NSCopying, NSSecureCoding>
	['{327F8739-FAFD-4F9D-AB3C-01158D1EC84A}']
//		{+} function phoneNumberWithStringValue(stringValue:NSString{*}):{nullable} instancetype;cdecl;
//		{+} function new  NS_DEPRECATED(10_11, 10_13, 9_0, 11_0, "Use phoneNumberWithStringValue:null_unspecified instancetype;cdecl;
	end;
	
	TCNPhoneNumber=class(TOCGenericImport<CNPhoneNumberClass,CNPhoneNumber>)
	end;
	
	
//	// Phone number labels
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelPhoneNumberiPhone;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelPhoneNumberMobile;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelPhoneNumberMain;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelPhoneNumberHomeFax;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelPhoneNumberWorkFax;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelPhoneNumberOtherFax;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelPhoneNumberPager;

	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNPhoneNumber_FakeLoader : CNPhoneNumber; cdecl; external libContacts name 'OBJC_CLASS_$_CNPhoneNumber';
{$O+}


{$ENDIF}

end.

