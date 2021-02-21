//
//  TWTRTimelineFilter.h
//  TwitterKit
//
//  Copyright ? 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRTimelineFilter;

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

	
	{*
	 * Assigning this object to any data source that implements `TWTRTimelineDataSource`
	 * will filter the tweets on that timeline using the provided filter configuration.
	 }
	TWTRTimelineFilter=interface(NSObject)//<NSCopying>
	['{0413BD89-D6FC-481E-9C6C-D0B164222BAF}']
		
		function keywords:NSSet{*};cdecl;
		procedure setKeywords(keywords:NSSet{*});cdecl;
		
		function hashtags:NSSet{*};cdecl;
		procedure setHashtags(hashtags:NSSet{*});cdecl;
		
		function handles:NSSet{*};cdecl;
		procedure setHandles(handles:NSSet{*});cdecl;
		
		function urls:NSSet{*};cdecl;
		procedure setUrls(urls:NSSet{*});cdecl;
		
		{-} function initWithJSONDictionary(dictionary:nonnull NSDictionary{*}):{nullable} instancetype;cdecl;
		{-} function new NS_UNAVAILABLE:nonnull instancetype;cdecl;
		
		{
		 * Returns count of all filters
		 }
		{-} function filterCount:NSUInteger;cdecl;
	end;
	
	TWTRTimelineFilterClass=interface(NSObjectClass)//<NSCopying>
	['{87A52972-07D0-4B65-BAEA-C2BD3A603F07}']
	end;
	
	TTWTRTimelineFilter=class(TOCGenericImport<TWTRTimelineFilterClass,TWTRTimelineFilter>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

