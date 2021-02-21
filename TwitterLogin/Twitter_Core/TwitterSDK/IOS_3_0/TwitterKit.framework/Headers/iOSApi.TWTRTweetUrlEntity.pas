//
//  TWTRTweetUrlEntity.h
//
//  Copyright (c) 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRTweetUrlEntity;

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
	 * A Tweet entity which represents a URL
	 }
	TWTRTweetUrlEntity=interface(TWTRTweetEntity)//<NSCoding, TWTRJSONConvertible>
	['{AC1EF8CF-BBF5-4522-9E78-F8CBE66DB84A}']
		
		{*
		 * The URL to display. This property may be truncated and may
		 * not be a valid URL.
		 }
		function displayUrl:NSString{*};cdecl;
		procedure setDisplayUrl(displayUrl:NSString{*});cdecl;
		
		{*
		 * The expanded URL. This property will be a valid URL.
		 }
		function expandedUrl:NSString{*};cdecl;
		procedure setExpandedUrl(expandedUrl:NSString{*});cdecl;
		
		{*
		 * The t.co link which will redirect to the original URL.
		 }
		function url:NSString{*};cdecl;
		procedure setUrl(url:NSString{*});cdecl;
		
	end;
	
	TWTRTweetUrlEntityClass=interface(TWTRTweetEntityClass)//<NSCoding, TWTRJSONConvertible>
	['{93CB2DE6-5C08-4A98-9143-DEB5D927E244}']
	end;
	
	TTWTRTweetUrlEntity=class(TOCGenericImport<TWTRTweetUrlEntityClass,TWTRTweetUrlEntity>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

