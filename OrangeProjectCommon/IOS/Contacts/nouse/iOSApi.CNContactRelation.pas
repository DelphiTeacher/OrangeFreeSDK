//
//  CNContactRelation.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNContactRelation;

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
	 * @abstract An immutable value object representing a related contact.
	 *
	 * @discussion CNContactRelation is thread safe.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNContactRelation=interface(NSObject)//<NSCopying, NSSecureCoding>
	['{0D863BCC-87FD-421B-BB50-456178166D77}']
		
		{-} function initWithName(name:NSString{*}):CNContactRelation;cdecl;
		
		function name:NSString{*};cdecl;
		procedure setName(name:NSString{*});cdecl;
		
	end;
	
	CNContactRelationClass=interface(NSObjectClass)//<NSCopying, NSSecureCoding>
	['{A7D748BA-4510-4366-99D0-B5CC08D96D78}']
		{+} function contactRelationWithName(name:NSString{*}):CNContactRelation;cdecl;
	end;
	
	TCNContactRelation=class(TOCGenericImport<CNContactRelationClass,CNContactRelation>)
	end;
	
	
	// Contact relation labels
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationFather;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationMother;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationParent;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationBrother;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationSister;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_13, 11_0)=CNLabelContactRelationSon;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_13, 11_0)=CNLabelContactRelationDaughter;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationChild;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationFriend;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationSpouse;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationPartner;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationAssistant;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelContactRelationManager;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNContactRelation_FakeLoader : CNContactRelation; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNContactRelation';
{$O+}


{$ENDIF}

end.

