//
//  CNInstantMessageAddress.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNInstantMessageAddress;

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
	 * @abstract An immutable value object representing an instant message address.
	 *
	 * @discussion CNInstantMessageAddress is thread safe.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNInstantMessageAddress=interface(NSObject)//<NSCopying, NSSecureCoding>
	['{8DBA4AFE-9875-449E-B839-DAF385A2F16C}']
		
		function username:NSString{*};cdecl;
		procedure setUsername(username:NSString{*});cdecl;
		function service:NSString{*};cdecl;
		procedure setService(service:NSString{*});cdecl;
		
		[MethodName('initWithUsername:service:')]
		{-} function initWithUsernameservice(username:NSString{*};service:NSString{*}):CNInstantMessageAddress;cdecl;
		
		{! Returns a user displayable property name. }
		
		{! Returns a user displayable service name. }
		
	end;
	
	CNInstantMessageAddressClass=interface(NSObjectClass)//<NSCopying, NSSecureCoding>
	['{01209636-883A-4786-B519-4DB4DA78540D}']
		{+} function localizedStringForKey(key:NSString{*}):NSString{*};cdecl;
		{+} function localizedStringForService(service:NSString{*}):NSString{*};cdecl;
	end;
	
	TCNInstantMessageAddress=class(TOCGenericImport<CNInstantMessageAddressClass,CNInstantMessageAddress>)
	end;
	
	
	// Properties that are always fetched. Can be used with key value coding and observing.
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageAddressUsernameKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageAddressServiceKey;
	
	// Instant message services.
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageServiceAIM;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageServiceFacebook;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageServiceGaduGadu;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageServiceGoogleTalk;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageServiceICQ;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageServiceJabber;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageServiceMSN;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageServiceQQ;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageServiceSkype;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNInstantMessageServiceYahoo;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNInstantMessageAddress_FakeLoader : CNInstantMessageAddress; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNInstantMessageAddress';
{$O+}


{$ENDIF}

end.

