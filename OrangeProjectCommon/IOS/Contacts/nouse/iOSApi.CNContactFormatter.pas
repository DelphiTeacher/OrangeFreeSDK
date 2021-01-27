//
//  CNContactFormatter.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNContactFormatter;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.ContactsDefines,
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
	PCNKeyDescriptor=Pointer;//PCNKeyDescriptor=Pointer of CNKeyDescriptor; ILocalObject(CNKeyDescriptor).GetObjectID

	
	
	
	{!
	 * @abstract The formatting styles for contact names.
	 }
	CNContactFormatterStyle_=(
	//(NSInteger, CNContactFormatterStyle)
	//    /*! Combine the contact name components into a displayable full name. */
	//    CNContactFormatterStyleFullName,
	//    /*! Combine the contact phonetic name components into a displayable phonetic full name.*/
	    CNContactFormatterStylePhoneticFullName//,
	);
	CNContactFormatterStyle=Integer;
	
	{!
	 * @abstract The formatting order of the contact name components.
	 }
	CNContactDisplayNameOrder_=(
	//(NSInteger, CNContactDisplayNameOrder)
	    CNContactDisplayNameOrderUserDefault,
	    CNContactDisplayNameOrderGivenNameFirst,
	    CNContactDisplayNameOrderFamilyNameFirst//,
	);
	CNContactDisplayNameOrder=Integer;
	
	
	{!
	 * @abstract Formats a contact name.
	 *
	 * @discussion This formatter handles international ordering and delimiting of the contact name components. This includes applying the user defaults when appropriate.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNContactFormatter=interface(NSFormatter)//<NSSecureCoding>
	['{18DA83E9-8B5E-4117-8BAB-B8684806CE5B}']
		
		{!
		 * @abstract The contact key descriptor required for the formatter.
		 *
		 * @discussion Use to fetch all contact keys required for the formatter style. Can combine key descriptors for different formatter styles in the fetch.
		 *
		 * @param style The formatting style to be used for the contact name.
		 * @return The contact key descriptor for the formatting style.
		 }
		
		
		{!
		 * @abstract Formats the contact name.
		 *
		 * @param contact The contact whose name is to be formatted.
		 * @param style The formatting style to be used for the contact name.
		 * @return The formatted contact name.
		 }
		
		{!
		 * @abstract Formats the contact name returning an attributed string.
		 *
		 * @discussion This behaves like +stringFromContact:style: except it returns an attributed string. Includes the attribute key CNContactPropertyAttribute.
		 *
		 * @param contact The contact whose name is to be formatted.
		 * @param style The formatting style to be used for the contact name.
		 * @param attributes The default attributes to use. See NSFormatter for details.
		 * @return The formatted contact name as an attributed string.
		 }
		
		{!
		 * @abstract The recommended name order for a given contact.
		 }
		
		{!
		 * @abstract The recommended delimiter to use between name components for a given contact.
		 }
		
		{!
		 * @abstract The style for a contact formatter instance.
		 *
		 * @discussion The default value is CNContactFormatterStyleFullName.
		 }
		function style:CNContactFormatterStyle;cdecl;
		procedure setStyle(style:CNContactFormatterStyle);cdecl;
		
		{!
		 * @abstract Formats the contact name.
		 *
		 * @param contact The contact whose name is to be formatted.
		 * @return The formatted contact name.
		 }
		{-} function stringFromContact(contact:CNContact{*}):{nullable} NSString{*};cdecl;
		
		{!
		 * @abstract Formats the contact name returning an attributed string.
		 *
		 * @discussion This behaves like -stringFromContact:style: except it returns an attributed string. CNContactPropertyAttribute key has the value of a CNContact name property key.
		 *
		 * @param contact The contact whose name is to be formatted.
		 * @param attributes The default attributes to use. See NSFormatter for details.
		 * @return The formatted contact name as an attributed string.
		 }
		[MethodName('attributedStringFromContact:defaultAttributes:')]
		{-} function attributedStringFromContactdefaultAttributes(contact:CNContact{*};attributes:{nullable} NSDictionary{*}):{nullable} NSAttributedString{*};cdecl;
		
	end;
	
	CNContactFormatterClass=interface(NSFormatterClass)//<NSSecureCoding>
	['{E4096B46-93C9-49A9-A812-0ED9DC628651}']
		{+} function descriptorForRequiredKeysForStyle(style:CNContactFormatterStyle):PCNKeyDescriptor{id<CNKeyDescriptor>};cdecl;
		[MethodName('stringFromContact:style:')]
		{+} function stringFromContactstyle(contact:CNContact{*};style:CNContactFormatterStyle):{nullable} NSString{*};cdecl;
		[MethodName('attributedStringFromContact:style:defaultAttributes:')]
		{+} function attributedStringFromContactstyledefaultAttributes(contact:CNContact{*};style:CNContactFormatterStyle;attributes:{nullable} NSDictionary{*}):{nullable} NSAttributedString{*};cdecl;
		{+} function nameOrderForContact(contact:CNContact{*}):CNContactDisplayNameOrder;cdecl;
		{+} function delimiterForContact(contact:CNContact{*}):NSString{*};cdecl;
	end;
	
	TCNContactFormatter=class(TOCGenericImport<CNContactFormatterClass,CNContactFormatter>)
	end;
	
	
	// Attribute key whose value is a CNContact name component property key.
	{CONTACTS_EXTERN NSString *}CNContactPropertyAttribute=;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContactFormatter_FakeLoader : CNContactFormatter; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNContactFormatter';
{$O+}


{$ENDIF}

end.

