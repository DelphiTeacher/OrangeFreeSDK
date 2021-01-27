//
//  CNLabeledValue.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNLabeledValue;

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
  ValueType=Pointer;
	
	
	
	
	{!
	 * @abstract A contact property that has a value and label.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNLabeledValue=interface(NSObject)//<NSCopying, NSSecureCoding>> : NSObject <NSCopying, NSSecureCoding>
	['{7CCB1D7F-D68D-4F61-9A11-AD3FF9A0B724}']
		
		{! The identifier is unique among contacts on the device. It can be saved and used for finding labeled values next application launch. }
		function identifier:NSString{*};cdecl;
		procedure setIdentifier(identifier:NSString{*});cdecl;

		[MethodName('label')]
		function _label:NSString{*};cdecl;
		procedure setLabel(alabel:NSString{*});cdecl;

		function value:ValueType;cdecl;
		procedure setValue(value:ValueType);cdecl;

		{! Returns a new CNLabeledValue with a new identifier. }
		
		{! Initializes the CNLabeledValue with a new identifier. }
//		[MethodName('initWithLabel:value:')]
//		{-} function initWithLabelvalue(label:{nullable} NSString{*};value:ValueType):CNLabeledValue<ValueType;cdecl;

		{! Returns a new CNLabeledValue with the existing value and identifier. }
		{-} function labeledValueBySettingLabel(alabel:{nullable} NSString{*}):CNLabeledValue{<ValueType};cdecl;
		
		{! Returns a new CNLabeledValue with the existing label and identifier. }
		{-} function labeledValueBySettingValue(value:ValueType):CNLabeledValue{<ValueType};cdecl;
		
		{! Returns a new CNLabeledValue with the existing identifier. }
		[MethodName('labeledValueBySettingLabel:value:')]
		{-} function labeledValueBySettingLabelvalue(alabel:{nullable} NSString{*};value:ValueType):CNLabeledValue{<ValueType};cdecl;
		
		{!
		 * @abstract Get a localized label.
		 *
		 * @discussion Some labels are special keys representing generic labels. Use this to obtain a localized string for a label to display to a user.
		 *
		 * @param label to localize.
		 * @return The localized string if a Contacts framework defined label, otherwise just returns the label.
		 }
		
	end;
	
	CNLabeledValueClass=interface(NSObjectClass)//<NSCopying, NSSecureCoding>> : NSObject <NSCopying, NSSecureCoding>
	['{9FECF121-B717-45B6-963D-7B835317BE91}']
		[MethodName('labeledValueWithLabel:value:')]
		{+} function labeledValueWithLabelvalue(alabel:{nullable} NSString{*};value:ValueType):CNLabeledValue{<ValueType};cdecl;
		{+} function localizedStringForLabel(alabel:NSString{*}):NSString{*};cdecl;
	end;
	
	TCNLabeledValue=class(TOCGenericImport<CNLabeledValueClass,CNLabeledValue>)
	end;
	
	
//	// Generic labels
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelHome;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelWork;
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelOther;
//
//	// Additional email labels
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelEmailiCloud;
//
//	// URL address labels
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelURLAddressHomePage;
//
//	// Date labels
//	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNLabelDateAnniversary;

	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNLabeledValue_FakeLoader : CNLabeledValue; cdecl; external libContacts name 'OBJC_CLASS_$_CNLabeledValue';
{$O+}


{$ENDIF}

end.

