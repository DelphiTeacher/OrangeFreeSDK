//
//  CNMutableContact.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNMutableContact;

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
	 * @abstract A mutable value object representing a contact.
	 *
	 * @discussion CNMutableContact is not thread safe. If this is a mutable copy of CNContact then it will throw CNContactPropertyNotFetchedExceptionName when accessing a property that was not fetched for the CNContact.
	 *
	 * @note To remove properties when saving a mutable contact, set string properties and array properties to empty values. Set other properties to nil.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNMutableContact=interface(CNContact)//
	['{15CDF856-517F-48DC-BE96-CA94A9E9FA2C}']
		
		function contactType:CNContactType;cdecl;
		procedure setContactType(contactType:CNContactType);cdecl;
		
		function namePrefix:NSString{*};cdecl;
		procedure setNamePrefix(namePrefix:NSString{*});cdecl;
		function givenName:NSString{*};cdecl;
		procedure setGivenName(givenName:NSString{*});cdecl;
		function middleName:NSString{*};cdecl;
		procedure setMiddleName(middleName:NSString{*});cdecl;
		function familyName:NSString{*};cdecl;
		procedure setFamilyName(familyName:NSString{*});cdecl;
		function previousFamilyName:NSString{*};cdecl;
		procedure setPreviousFamilyName(previousFamilyName:NSString{*});cdecl;
		function nameSuffix:NSString{*};cdecl;
		procedure setNameSuffix(nameSuffix:NSString{*});cdecl;
		function nickname:NSString{*};cdecl;
		procedure setNickname(nickname:NSString{*});cdecl;
		
		function organizationName:NSString{*};cdecl;
		procedure setOrganizationName(organizationName:NSString{*});cdecl;
		function departmentName:NSString{*};cdecl;
		procedure setDepartmentName(departmentName:NSString{*});cdecl;
		function jobTitle:NSString{*};cdecl;
		procedure setJobTitle(jobTitle:NSString{*});cdecl;
		
		function phoneticGivenName:NSString{*};cdecl;
		procedure setPhoneticGivenName(phoneticGivenName:NSString{*});cdecl;
		function phoneticMiddleName:NSString{*};cdecl;
		procedure setPhoneticMiddleName(phoneticMiddleName:NSString{*});cdecl;
		function phoneticFamilyName:NSString{*};cdecl;
		procedure setPhoneticFamilyName(phoneticFamilyName:NSString{*});cdecl;
		function phoneticOrganizationName:NSString{*};cdecl;
		procedure setPhoneticOrganizationName(phoneticOrganizationName:NSString{*});cdecl;
		
		function note:NSString{*};cdecl;
		procedure setNote(note:NSString{*});cdecl;
		
		function imageData:NSData{*};cdecl;
		procedure setImageData(imageData:NSData{*});cdecl;
		
		function phoneNumbers:NSArray<CNLabeledValue<CNPhoneNumber*>*>{*};cdecl;
		procedure setPhoneNumbers(phoneNumbers:NSArray<CNLabeledValue<CNPhoneNumber*>*>{*});cdecl;
		function emailAddresses:NSArray<CNLabeledValue<NSString*>*>{*};cdecl;
		procedure setEmailAddresses(emailAddresses:NSArray<CNLabeledValue<NSString*>*>{*});cdecl;
		function postalAddresses:NSArray<CNLabeledValue<CNPostalAddress*>*>{*};cdecl;
		procedure setPostalAddresses(postalAddresses:NSArray<CNLabeledValue<CNPostalAddress*>*>{*});cdecl;
		function urlAddresses:NSArray<CNLabeledValue<NSString*>*>{*};cdecl;
		procedure setUrlAddresses(urlAddresses:NSArray<CNLabeledValue<NSString*>*>{*});cdecl;
		function contactRelations:NSArray<CNLabeledValue<CNContactRelation*>*>{*};cdecl;
		procedure setContactRelations(contactRelations:NSArray<CNLabeledValue<CNContactRelation*>*>{*});cdecl;
		function socialProfiles:NSArray<CNLabeledValue<CNSocialProfile*>*>{*};cdecl;
		procedure setSocialProfiles(socialProfiles:NSArray<CNLabeledValue<CNSocialProfile*>*>{*});cdecl;
		function instantMessageAddresses:NSArray<CNLabeledValue<CNInstantMessageAddress*>*>{*};cdecl;
		procedure setInstantMessageAddresses(instantMessageAddresses:NSArray<CNLabeledValue<CNInstantMessageAddress*>*>{*});cdecl;
		
		{! @abstract The Gregorian birthday.
		 *
		 *  @description Only uses day, month and year components. Needs to have at least a day and a month.
		 }
		function birthday:NSDateComponents{*};cdecl;
		procedure setBirthday(birthday:NSDateComponents{*});cdecl;
		
		{! @abstract The alternate birthday (Lunisolar).
		 *
		 *  @description Only uses day, month, year and calendar components. Needs to have at least a day and a month. Calendar must be Chinese, Hebrew or Islamic.
		 }
		function nonGregorianBirthday:NSDateComponents{*};cdecl;
		procedure setNonGregorianBirthday(nonGregorianBirthday:NSDateComponents{*});cdecl;
		
		{! @abstract Other Gregorian dates (anniversaries, etc).
		 *
		 *  @description Only uses day, month and year components. Needs to have at least a day and a month.
		 }
		function dates:NSArray<CNLabeledValue<NSDateComponents*>*>{*};cdecl;
		procedure setDates(dates:NSArray<CNLabeledValue<NSDateComponents*>*>{*});cdecl;
		
	end;
	
	CNMutableContactClass=interface(CNContactClass)//
	['{4378A905-6ACD-44B8-81DB-75CAF507A0DE}']
	end;
	
	TCNMutableContact=class(TOCGenericImport<CNMutableContactClass,CNMutableContact>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNMutableContact_FakeLoader : CNMutableContact; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNMutableContact';
{$O+}


{$ENDIF}

end.

