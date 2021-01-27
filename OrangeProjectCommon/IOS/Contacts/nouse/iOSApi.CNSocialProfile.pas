//
//  CNSocialProfile.h
//  Contacts
//
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

unit iOSApi.CNSocialProfile;

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
	 * @abstract An immutable value object representing a social profile.
	 *
	 * @discussion CNSocialProfile is thread safe.
	 }
	//NS_CLASS_AVAILABLE(10_11, 9_0)
	CNSocialProfile=interface(NSObject)//<NSCopying, NSSecureCoding>
	['{9F636DA3-16B5-4806-AA6E-93C577778D30}']
		
		function urlString:NSString{*};cdecl;
		procedure setUrlString(urlString:NSString{*});cdecl;
		function username:NSString{*};cdecl;
		procedure setUsername(username:NSString{*});cdecl;
		function userIdentifier:NSString{*};cdecl;
		procedure setUserIdentifier(userIdentifier:NSString{*});cdecl;
		function service:NSString{*};cdecl;
		procedure setService(service:NSString{*});cdecl;
		
		[MethodName('initWithUrlString:username:userIdentifier:service:')]
		{-} function initWithUrlStringusernameuserIdentifierservice(urlString:{nullable} NSString{*};username:{nullable} NSString{*};userIdentifier:{nullable} NSString{*};service:{nullable} NSString{*}):CNSocialProfile;cdecl;
		
		{! Returns a user displayable property name. }
		
		{! Returns a user displayable service name. }
		
	end;
	
	CNSocialProfileClass=interface(NSObjectClass)//<NSCopying, NSSecureCoding>
	['{32AA6D8C-2C9A-4FA4-8405-E9534FAA6F3A}']
		{+} function localizedStringForKey(key:NSString{*}):NSString{*};cdecl;
		{+} function localizedStringForService(service:NSString{*}):NSString* ;cdecl;
	end;
	
	TCNSocialProfile=class(TOCGenericImport<CNSocialProfileClass,CNSocialProfile>)
	end;
	
	
	// Properties that are always fetched. Can be used with key value coding and observing.
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileURLStringKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileUsernameKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileUserIdentifierKey;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileServiceKey;
	
	// Social profile services.
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileServiceFacebook;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileServiceFlickr;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileServiceLinkedIn;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileServiceMySpace;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileServiceSinaWeibo;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileServiceTencentWeibo;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileServiceTwitter;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileServiceYelp;
	{CONTACTS_EXTERN NSString *}NS_AVAILABLE(10_11, 9_0)=CNSocialProfileServiceGameCenter;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CNSocialProfile_FakeLoader : CNSocialProfile; cdecl; external {$I FrameworkDylibPath_Contacts.inc} name 'OBJC_CLASS_$_CNSocialProfile';
{$O+}


{$ENDIF}

end.

