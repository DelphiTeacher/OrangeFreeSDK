//
//  TWTRUser.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRUser;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
//	iOSapi.TWTRJSONConvertible,
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

	
	
	
	{*
	 *  Represents a user on Twitter.
	 }
	TWTRUser=interface(NSObject)//<NSCoding, NSCopying, TWTRJSONConvertible>
	['{1A4335E7-2F32-4082-87D0-F386819529F8}']
		
		//#pragma mark - Properties
		
		{*
		 *  The ID of the Twitter User.
		 }
		function userID:NSString{*};cdecl;
		procedure setUserID(userID:NSString{*});cdecl;
		
		{*
		 *  The user's name as it appears on their profile.
		 *
		 *  @warning This can be modified by the user at any time.
		 }
		function name:NSString{*};cdecl;
		procedure setName(name:NSString{*});cdecl;
		
		{*
		 *  The user's username on Twitter.
		 *
		 *  @warning This can be modified by the user at any time.
		 }
		function screenName:NSString{*};cdecl;
		procedure setScreenName(screenName:NSString{*});cdecl;
		
		{*
		 *  Whether the user has been verified by Twitter.
		 }
		function isVerified:Boolean;cdecl;
		procedure setIsVerified(isVerified:Boolean);cdecl;
		
		{*
		 *  Whether the user is protected.
		 }
		function isProtected:Boolean;cdecl;
		procedure setIsProtected(isProtected:Boolean);cdecl;
		
		{*
		 *  The HTTPS URL of the user's profile image.
		 }
		function profileImageURL:NSString{*};cdecl;
		procedure setProfileImageURL(profileImageURL:NSString{*});cdecl;
		
		{*
		 *  The URL of a smaller version of the user's profile image.
		 }
		function profileImageMiniURL:NSString{*};cdecl;
		procedure setProfileImageMiniURL(profileImageMiniURL:NSString{*});cdecl;
		
		{*
		 *  The URL of a larger version of the user's profile image.
		 }
		function profileImageLargeURL:NSString{*};cdecl;
		procedure setProfileImageLargeURL(profileImageLargeURL:NSString{*});cdecl;
		
		{*
		 *  The formatted version of the user's `screenName` with the `@` sign for display purposes.
		 }
		function formattedScreenName:NSString{*};cdecl;
		procedure setFormattedScreenName(formattedScreenName:NSString{*});cdecl;
		
		{*
		 * Returns the URL for deeplinking to the the user's profile.
		 }
		function profileURL:NSURL{*};cdecl;
		procedure setProfileURL(profileURL:NSURL{*});cdecl;
		
	end;

	TWTRUserClass=interface(NSObjectClass)//<NSCoding, NSCopying, TWTRJSONConvertible>
	['{FF8C2168-C625-4350-8F0A-EF5A004A5240}']
	end;
	
	TTWTRUser=class(TOCGenericImport<TWTRUserClass,TWTRUser>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

