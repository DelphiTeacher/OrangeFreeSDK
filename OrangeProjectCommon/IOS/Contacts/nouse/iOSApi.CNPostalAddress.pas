//
//  CNPostalAddress.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNPostalAddress;

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
	 * @abstract An immutable value object representing a postal address.
	 *
	 * @discussion CNPostalAddress is thread safe.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNPostalAddress=interface(NSObject)//<NSCopying, NSMutableCopying, NSSecureCoding>
	['{C6337E60-4530-4E4A-A029-2B14A3CA3142}']
		
		{! multi-street address is delimited with carriage returns ¡°\n¡± }
		function street:NSString{*};cdecl;
		procedure setStreet(street:NSString{*});cdecl;
		function subLocality:NSString{*};cdecl;
		procedure setSubLocality(subLocality:NSString{*});cdecl;
		function city:NSString{*};cdecl;
		procedure setCity(city:NSString{*});cdecl;
		function subAdministrativeArea:NSString{*};cdecl;
		procedure setSubAdministrativeArea(subAdministrativeArea:NSString{*});cdecl;
		function state:NSString{*};cdecl;
		procedure setState(state:NSString{*});cdecl;
		function postalCode:NSString{*};cdecl;
		procedure setPostalCode(postalCode:NSString{*});cdecl;
		function country:NSString{*};cdecl;
		procedure setCountry(country:NSString{*});cdecl;
		function ISOCountryCode:NSString{*};cdecl;
		procedure setISOCountryCode(ISOCountryCode:NSString{*});cdecl;
		
		{! Returns a user displayable property name. }
		
	end;
	
	CNPostalAddressClass=interface(NSObjectClass)//<NSCopying, NSMutableCopying, NSSecureCoding>
	['{3E232CBE-FEEA-4FFD-8ED3-499F6694E10D}']
		{+} function localizedStringForKey(key:NSString{*}):NSString{*};cdecl;
	end;
	
	TCNPostalAddress=class(TOCGenericImport<CNPostalAddressClass,CNPostalAddress>)
	end;
	
	
	// Properties that are always fetched. Can be used with key value coding and observing.
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNPostalAddressStreetKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_12_4, 10_3)=CNPostalAddressSubLocalityKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNPostalAddressCityKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_12_4, 10_3)=CNPostalAddressSubAdministrativeAreaKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNPostalAddressStateKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNPostalAddressPostalCodeKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNPostalAddressCountryKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNPostalAddressISOCountryCodeKey;
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNPostalAddress_FakeLoader : CNPostalAddress; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNPostalAddress';
{$O+}


{$ENDIF}

end.

