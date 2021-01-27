//
//  CNContact.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNContact;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
//	iOSapi.ContactsDefines,
//	iOSapi.CNLabeledValue,
//	iOSapi.CNPhoneNumber,
//	iOSapi.CNPostalAddress,
//	iOSapi.CNContactRelation,
//	iOSapi.CNSocialProfile,
//	iOSapi.CNInstantMessageAddress,
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
	PCNKeyDescriptor=Pointer;//PCNKeyDescriptor=Pointer of CNKeyDescriptor; ILocalObject(CNKeyDescriptor).GetObjectID

	
	
	
	CNContactType_=(
	//(NSInteger, CNContactType)
	    CNContactTypePerson,
	    CNContactTypeOrganization//,
	);
	CNContactType=Integer;
	
	{!
	 * @abstract Sort order for contacts.
	 *
	 * @discussion CNContactSortOrderUserDefault is the user's preferred sort order.
	 }
	CNContactSortOrder_=(
	//(NSInteger, CNContactSortOrder)
	    CNContactSortOrderNone,
	    CNContactSortOrderUserDefault,
	    CNContactSortOrderGivenName,
	    CNContactSortOrderFamilyName//,
	);
	CNContactSortOrder=Integer;
	
	{! This protocol is reserved for Contacts framework usage. }
	CNKeyDescriptor=interface(IObjectiveC)
		['{B8460B94-B79C-40EC-A623-91BD0471496E}']
	end;
	
	
	TCNKeyDescriptor=class(TOCLocal,CNKeyDescriptor)
	public
		constructor Create;
		destructor Destroy;override;
	public

	end;
	
	
	{! Allows contact property keys to be used with keysToFetch. }
//	NSString=interface()//Contacts
//	['{312ED573-EA79-463C-8AEA-A12E2EBF48EF}']
//	end;
//
//	NSStringClass=interface(Class)//Contacts
//	['{7F8B62A6-83C8-4D71-B676-A60D1C43761F}']
//	end;
//
//	TNSString=class(TOCGenericImport<NSStringClass,NSString>)
//	end;




	
	{!
	 * @abstract An immutable value object representing a contact.
	 *
	 * @discussion CNContact is thread safe. 
	 *
	 * If using a CNContact instance where you are not certain of the keys that were fetched, use isKeyAvailable: or areKeysAvailable:. If these return NO you need to refetch the contact by the contact identifier with the keys you want to fetch. Accessing a property that was not fetched will throw CNContactPropertyNotFetchedExceptionName.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNContact=interface(NSObject)//<NSCopying, NSMutableCopying, NSSecureCoding>
	['{409F044C-B649-4E4C-856B-DBB5246780F5}']
		
		{! The identifier is unique among contacts on the device. It can be saved and used for fetching contacts next application launch. }
		function identifier:NSString{*};cdecl;
		procedure setIdentifier(identifier:NSString{*});cdecl;
		
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
		function thumbnailImageData:NSData{*};cdecl;
		procedure setThumbnailImageData(thumbnailImageData:NSData{*});cdecl;
		function imageDataAvailable:Boolean;cdecl;
		procedure setImageDataAvailable(imageDataAvailable:Boolean);cdecl;
		
		function phoneNumbers:NSArray{<CNLabeledValue<CNPhoneNumber*>*>}{*};cdecl;
		procedure setPhoneNumbers(phoneNumbers:NSArray{<CNLabeledValue<CNPhoneNumber*>*>}{*});cdecl;
//		function emailAddresses:NSArray<CNLabeledValue<NSString*>*>{*};cdecl;
//		procedure setEmailAddresses(emailAddresses:NSArray<CNLabeledValue<NSString*>*>{*});cdecl;
//		function postalAddresses:NSArray<CNLabeledValue<CNPostalAddress*>*>{*};cdecl;
//		procedure setPostalAddresses(postalAddresses:NSArray<CNLabeledValue<CNPostalAddress*>*>{*});cdecl;
//		function urlAddresses:NSArray<CNLabeledValue<NSString*>*>{*};cdecl;
//		procedure setUrlAddresses(urlAddresses:NSArray<CNLabeledValue<NSString*>*>{*});cdecl;
//		function contactRelations:NSArray<CNLabeledValue<CNContactRelation*>*>{*};cdecl;
//		procedure setContactRelations(contactRelations:NSArray<CNLabeledValue<CNContactRelation*>*>{*});cdecl;
//		function socialProfiles:NSArray<CNLabeledValue<CNSocialProfile*>*>{*};cdecl;
//		procedure setSocialProfiles(socialProfiles:NSArray<CNLabeledValue<CNSocialProfile*>*>{*});cdecl;
//		function instantMessageAddresses:NSArray<CNLabeledValue<CNInstantMessageAddress*>*>{*};cdecl;
//		procedure setInstantMessageAddresses(instantMessageAddresses:NSArray<CNLabeledValue<CNInstantMessageAddress*>*>{*});cdecl;
//
//		{! The Gregorian birthday. }
//		function birthday:NSDateComponents{*};cdecl;
//		procedure setBirthday(birthday:NSDateComponents{*});cdecl;
//
//		{! The alternate birthday (Lunisolar). }
//		function nonGregorianBirthday:NSDateComponents{*};cdecl;
//		procedure setNonGregorianBirthday(nonGregorianBirthday:NSDateComponents{*});cdecl;
//
//		{! Other Gregorian dates (anniversaries, etc). }
//		function dates:NSArray<CNLabeledValue<NSDateComponents*>*>{*};cdecl;
//		procedure setDates(dates:NSArray<CNLabeledValue<NSDateComponents*>*>{*});cdecl;

		
		// Key Availability
		
		{! Returns YES if the value for the specified key was fetched. }
		{-} function isKeyAvailable(key:NSString{*}):Boolean;cdecl;
		
		{! Returns YES if the values for the keys specified by all the descriptors were fetched. }
		{-} function areKeysAvailable(keyDescriptors:NSArray{ <id<CNKeyDescriptor>>}{*}):Boolean;cdecl;

		
		// Key Localization
		
		{! Returns a user displayable property name. }
		
		
		// Contact Sort Comparator
		
		{! The contact comparator for a given sort order. }
		
		{! Use to fetch all contact keys required for the contact sort comparator. }
		
		
		// Unification
		{! Returns YES if the receiver was fetched as a unified contact and includes the contact having contactIdentifier in its unification }
		{-} function isUnifiedWithContactWithIdentifier(contactIdentifier:NSString{*}):Boolean;cdecl;
		
	end;
	
	CNContactClass=interface(NSObjectClass)//<NSCopying, NSMutableCopying, NSSecureCoding>
	['{C8958387-795A-4640-AFBF-35271DAA4D01}']
		{+} function localizedStringForKey(key:NSString{*}):NSString{*};cdecl;
		{+} function comparatorForNameSortOrder(sortOrder:CNContactSortOrder):NSComparator;cdecl;
		{+} function descriptorForAllComparatorKeys:PCNKeyDescriptor{id<CNKeyDescriptor>};cdecl;
	end;
	
	TCNContact=class(TOCGenericImport<CNContactClass,CNContact>)
	end;
	
//	{CONTACTS_EXTERN NSString *}CNContactPropertyNotFetchedExceptionName=;
//
//	// Properties that are always fetched. Can be used with key value coding and observing.
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactIdentifierKey;
//
//	// Optional properties that can be fetched. Can be used with key value coding and observing.
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactNamePrefixKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactGivenNameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactMiddleNameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactFamilyNameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactPreviousFamilyNameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactNameSuffixKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactNicknameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactOrganizationNameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactDepartmentNameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactJobTitleKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactPhoneticGivenNameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactPhoneticMiddleNameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactPhoneticFamilyNameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_12, 10_0)=CNContactPhoneticOrganizationNameKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactBirthdayKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactNonGregorianBirthdayKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactNoteKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactImageDataKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactThumbnailImageDataKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_12, 9_0)=CNContactImageDataAvailableKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactTypeKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactPhoneNumbersKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactEmailAddressesKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactPostalAddressesKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactDatesKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactUrlAddressesKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactRelationsKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactSocialProfilesKey;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNContactInstantMessageAddressesKey;

	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function NSString_FakeLoader : NSString; cdecl; external libContacts name 'OBJC_CLASS_$_NSString';
function CNContact_FakeLoader : CNContact; cdecl; external libContacts name 'OBJC_CLASS_$_CNContact';
{$O+}

{ TCNKeyDescriptor }

constructor TCNKeyDescriptor.Create;
begin
	Inherited Create;
end;

destructor TCNKeyDescriptor.Destroy;
begin
	Inherited;
end;



{$ENDIF}

end.

