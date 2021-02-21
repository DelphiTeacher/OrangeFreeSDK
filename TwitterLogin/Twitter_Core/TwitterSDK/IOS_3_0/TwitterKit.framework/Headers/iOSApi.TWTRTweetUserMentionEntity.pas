//
//  TWTRTweetUserMentionEntity.h
//
//  Copyright (c) 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRTweetUserMentionEntity;

interface

{$IFDEF IOS}
uses
	iOSapi.TWTRJSONConvertible,
	iOSApi.TWTRTweetEntity,
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

	
	
	
	{*
	 * A Tweet entity which represents a user mention.
	 }
	TWTRTweetUserMentionEntity=interface(TWTRTweetEntity)//<NSCoding, TWTRJSONConvertible>
	['{F28F2C92-CA89-4872-A1B1-7C88DF475CAB}']
		
		{*
		 * The userID of the user whom ha   s been mentioned.
		 }
		function userID:NSString{*};cdecl;
		procedure setUserID(userID:NSString{*});cdecl;
		
		{*
		 * The name of the user whom has been mentioned.
		 }
		function name:NSString{*};cdecl;
		procedure setName(name:NSString{*});cdecl;
		
		{*
		 * The screen name of the user whom has been mentioned.
		 }
		function screenName:NSString{*};cdecl;
		procedure setScreenName(screenName:NSString{*});cdecl;
		
	end;
	
	TWTRTweetUserMentionEntityClass=interface(TWTRTweetEntityClass)//<NSCoding, TWTRJSONConvertible>
	['{46A32220-60B1-44A4-B4EF-072EE966F34F}']
	end;
	
	TTWTRTweetUserMentionEntity=class(TOCGenericImport<TWTRTweetUserMentionEntityClass,TWTRTweetUserMentionEntity>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

