//
//  CNPostalAddressFormatter.h
//  Contacts
//
//  Copyright (c) 2015¨C2016 Apple Inc. All rights reserved.
//

unit iOSApi.CNPostalAddressFormatter;

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
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID

	
	
	
	
	
	
	{!
	 * @abstract The formatting styles for postal addresses.
	 }
	CNPostalAddressFormatterStyle_=(
	//(NSInteger, CNPostalAddressFormatterStyle)
	//    /*! Combine the postal address components into a multi-line mailing address. */
	//    CNPostalAddressFormatterStyleMailingAddress,
	//} NS_ENUM_AVAILABLE(10_11, 9_0);
	);
	CNPostalAddressFormatterStyle=Integer;
	
	
	{!
	 * @abstract Formats a postal address.
	 *
	 * @discussion This formatter handles international formatting of a postal address.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNPostalAddressFormatter=interface(NSFormatter)//
	['{F4FF91C8-A4E5-4AD6-B195-9FA449750173}']
		
		{!
		 * @abstract Formats the postal address.
		 *
		 * @param postalAddress The postal address to be formatted.
		 * @param style The formatting style to be used for the postal address.
		 * @return The formatted postal address.
		 }
		
		
		{!
		 * @abstract Formats the postal address returning an attributed string.
		 *
		 * @discussion This behaves like +stringFromPostalAddress: except it returns an attributed string. Includes attribute keys CNPostalAddressPropertyAttribute and CNPostalAddressLocalizedPropertyNameAttribute.
		 *
		 * @param postalAddress The postal address to be formatted.
		 * @param style The formatting style to be used for the postal address.
		 * @param attributes The default attributes to use. See NSFormatter for details.
		 * @return The formatted postal address as an attributed string.
		 }
		
		{!
		 * @abstract The style for a postal address formatter instance.
		 *
		 * @discussion The default value is CNPostalAddressFormatterStyleMailingAddress.
		 }
		function style:CNPostalAddressFormatterStyle;cdecl;
		procedure setStyle(style:CNPostalAddressFormatterStyle);cdecl;
		
		{!
		 * @abstract Formats the postal address.
		 *
		 * @param postalAddress The postal address to be formatted.
		 * @return The formatted postal address.
		 }
		{-} function stringFromPostalAddress(postalAddress:CNPostalAddress{*}):NSString{*};cdecl;
		
		{!
		 * @abstract Formats the postal address returning an attributed string.
		 *
		 * @discussion This behaves like +stringFromPostalAddress: except it returns an attributed string. Includes attribute keys CNPostalAddressPropertyAttribute and CNPostalAddressLocalizedPropertyNameAttribute.
		 *
		 * @param postalAddress The postal address to be formatted.
		 * @param attributes The default attributes to use. See NSFormatter for details.
		 * @return The formatted postal address as an attributed string.
		 }
		[MethodName('attributedStringFromPostalAddress:withDefaultAttributes:')]
		{-} function attributedStringFromPostalAddresswithDefaultAttributes(postalAddress:CNPostalAddress{*};attributes:PNSDictionary{*}):NSAttributedString{*};cdecl;
		
	end;
	
	CNPostalAddressFormatterClass=interface(NSFormatterClass)//
	['{6FBF3B6E-84E0-41CD-92DA-0EA41A41CDC0}']
		[MethodName('stringFromPostalAddress:style:')]
		{+} function stringFromPostalAddressstyle(postalAddress:CNPostalAddress{*};style:CNPostalAddressFormatterStyle):NSString{*};cdecl;
		[MethodName('attributedStringFromPostalAddress:style:withDefaultAttributes:')]
		{+} function attributedStringFromPostalAddressstylewithDefaultAttributes(postalAddress:CNPostalAddress{*};style:CNPostalAddressFormatterStyle;attributes:PNSDictionary{*}):NSAttributedString{*};cdecl;
	end;
	
	TCNPostalAddressFormatter=class(TOCGenericImport<CNPostalAddressFormatterClass,CNPostalAddressFormatter>)
	end;
	
	
	// Attribute key whose value is a CNPostalAddress property key.
	{CONTACTS_EXTERN NSString *}CNPostalAddressPropertyAttribute=;
	
	// Attribute key whose value is a localized version of the CNPostalAddress property key.
	{CONTACTS_EXTERN NSString *}CNPostalAddressLocalizedPropertyNameAttribute=;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNPostalAddressFormatter_FakeLoader : CNPostalAddressFormatter; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNPostalAddressFormatter';
{$O+}


{$ENDIF}

end.

