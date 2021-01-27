//
//  CNContact+Predicates.h
//  Contacts
//
//  Copyright (c) 2015¨C2018 Apple Inc. All rights reserved.
//

unit iOSApi.CNContact+Predicates;

interface

{$IFDEF IOS}
uses
	iOSapi.CNContact,
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
	 * @abstract The predicates to match contacts against.
	 *
	 * @discussion Can only use these predicates with CNContactStore and CNContactFetchRequest.
	 }
	CNContact=interface()//Predicates
	['{4AA50584-FFC9-4748-B2A4-FE153C47759E}']
		
		{!
		 * @abstract To fetch contacts matching a name.
		 *
		 * @discussion The name can contain any number of words.
		 }
		
		{!
		 * @abstract    Fetch contacts matching an email address.
		 *
		 * @discussion  Use this predicate to find the contact(s) which contain the specified
		 *              email address. The search is not case-sensitive.
		 *
		 * @param       emailAddress
		 *              The email address to search for. Do not include a scheme (e.g., "mailto:").
		 }
		
		{!
		 * @abstract    Fetch contacts matching a phone number.
		 *
		 * @discussion  If the predicate and contact differ in their use or presence of country
		 *              codes, a best effort will be made to match results; however, inexact
		 *              matches are not guaranteed.
		 *
		 * @param       phoneNumber
		 *              A @c CNPhoneNumber representing the phone number to search for.
		 *              Do not include a scheme (e.g., "tel:").
		 }
		
		{! To fetch contacts matching contact identifiers. }
		
		
		
	end;
	
	CNContactClass=interface(Class)//Predicates
	['{D4613AC8-6587-4F2C-BBE0-27BAABF3B59F}']
		{+} function predicateForContactsMatchingName(name:NSString{*}):NSPredicate{*};cdecl;
		{+} function predicateForContactsMatchingEmailAddress(emailAddress:NSString{*}):NSPredicate{*};cdecl;
		{+} function predicateForContactsMatchingPhoneNumber(phoneNumber:CNPhoneNumber{*}):NSPredicate{*};cdecl;
		{+} function predicateForContactsWithIdentifiers(identifiers:NSArray<NSString*>{*}):NSPredicate{*};cdecl;
		{+} function predicateForContactsInGroupWithIdentifier(groupIdentifier:NSString{*}):NSPredicate{*};cdecl;
		{+} function predicateForContactsInContainerWithIdentifier(containerIdentifier:NSString{*}):NSPredicate{*};cdecl;
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

