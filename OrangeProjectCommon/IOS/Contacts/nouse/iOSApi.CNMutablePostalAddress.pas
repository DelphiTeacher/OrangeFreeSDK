//
//  CNMutablePostalAddress.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNMutablePostalAddress;

interface

{$IFDEF IOS}
uses
	iOSapi.CNPostalAddress,
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
	 * @abstract A mutable value object representing a postal address.
	 *
	 * @discussion CNMutablePostalAddress is not thread safe.
	 *
	 * @note To remove properties when saving a mutable postal address, set string properties to empty values.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNMutablePostalAddress=interface(CNPostalAddress)//
	['{4EC11848-781C-493A-9540-3C4E838B023A}']
		
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
		
	end;
	
	CNMutablePostalAddressClass=interface(CNPostalAddressClass)//
	['{D7FD2ABD-76E5-4098-A2EE-6326325EA793}']
	end;
	
	TCNMutablePostalAddress=class(TOCGenericImport<CNMutablePostalAddressClass,CNMutablePostalAddress>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNMutablePostalAddress_FakeLoader : CNMutablePostalAddress; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNMutablePostalAddress';
{$O+}


{$ENDIF}

end.

