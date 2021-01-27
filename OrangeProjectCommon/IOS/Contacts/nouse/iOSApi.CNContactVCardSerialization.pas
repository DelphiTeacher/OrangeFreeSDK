//
//  CNContactVCardSerialization.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNContactVCardSerialization;

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
	PCNKeyDescriptor=Pointer;//PCNKeyDescriptor=Pointer of CNKeyDescriptor; ILocalObject(CNKeyDescriptor).GetObjectID

	
	
	
	//@protocol CNKeyDescriptor;
	
	
	{!
	 * @abstract    Contact vCard support.
	 *
	 * @discussion  This converts between a contact and its vCard representation.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNContactVCardSerialization=interface(NSObject)//
	['{511B622B-31B4-4EDF-85B8-6D724FA65DB6}']
		
		{!
		 * @abstract    Descriptor for all contact keys required by vCard serialization
		 *
		 * @discussion  This descriptor must be passed to the fetch request if the returned
		 *              contacts are to be serialized with dataWithContacts:error:.
		 }
		
		{!
		 * @abstract    Serialize contacts to data.
		 *
		 * @discussion  The contacts to be serialized must have been fetched with
		 *              @c +descriptorForRequiredKeys.
		 *
		 * @param       contacts
		 *              The contacts to serialize.
		 *
		 * @param       error
		 *              An optional outparameter. If the serialization fails, this will be set.
		 *
		 * @returns     The encoded data. If the serialization fails, this will be @c nil.
		 }
		
		{!
		 * @abstract    Parse data into contacts.
		 *
		 * @param       data
		 *              The data to parse.
		 *
		 * @param       error
		 *              An optional outparameter. If the parsing fails, this will be set.
		 *
		 * @returns     The parsed contacts. If the parsing fails, this will be @c nil.
		 }
		
	end;
	
	CNContactVCardSerializationClass=interface(NSObjectClass)//
	['{431A9192-9EB7-46C2-9BB9-58DB199FE8F4}']
		{+} function descriptorForRequiredKeys:PCNKeyDescriptor{id<CNKeyDescriptor>};cdecl;
		[MethodName('dataWithContacts:error:')]
		{+} function dataWithContactserror(contacts:NSArray<CNContact *>{*};error:NSError *{*}):{nullable} NSData{*};cdecl;
		[MethodName('contactsWithData:error:')]
		{+} function contactsWithDataerror(data:NSData{*};error:NSError *{*}):{nullable} NSArray<CNContact *>{*};cdecl;
	end;
	
	TCNContactVCardSerialization=class(TOCGenericImport<CNContactVCardSerializationClass,CNContactVCardSerialization>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContactVCardSerialization_FakeLoader : CNContactVCardSerialization; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNContactVCardSerialization';
{$O+}


{$ENDIF}

end.

