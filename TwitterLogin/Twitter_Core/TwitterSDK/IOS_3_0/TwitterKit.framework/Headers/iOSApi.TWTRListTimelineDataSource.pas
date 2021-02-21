//
//  TWTRListTimelineDataSource.h
//  TwitterKit
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRListTimelineDataSource;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.TWTRTimelineDataSource,
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
	 *  Data source representing a list of Tweets. These Tweets are ordered chronologically with the most recent first.
	 *
	 *  @see https://dev.twitter.com/rest/reference/get/lists/statuses
	 }
	TWTRListTimelineDataSource=interface(NSObject)//<TWTRTimelineDataSource>
	['{B4EEB088-D7E5-4EE3-B8CD-F2F1B8381834}']
		
		{*
		 *  The ID of the list to show Tweets for. Either the `listID` or the `listSlug` and `listOwnerScreenName` are required.
		 }
		function listID:NSString{*};cdecl;
		procedure setListID(listID:NSString{*});cdecl;
		
		{*
		 *  The slug of the list to show Tweets for. Either the `listID` or the `listSlug` and `listOwnerScreenName` are required.
		 }
		function listSlug:NSString{*};cdecl;
		procedure setListSlug(listSlug:NSString{*});cdecl;
		
		{*
		 *  Screen name of the owner of the list as specified by the `listSlug`. Either the `listID` or the `listSlug` and `listOwnerScreenName` are required.
		 }
		function listOwnerScreenName:NSString{*};cdecl;
		procedure setListOwnerScreenName(listOwnerScreenName:NSString{*});cdecl;
		
		{*
		 *  The number of Tweets to request in each query to the Twitter Timeline API when fetching the next batch of Tweets. Will request 30 Tweets by default. Setting this value to 0 will use the server default.
		 }
		function maxTweetsPerRequest:NSUInteger;cdecl;
		procedure setMaxTweetsPerRequest(maxTweetsPerRequest:NSUInteger);cdecl;
		
		{*
		 *  Whether to request retweets in the set of Tweets from the server.
		 *
		 *  Defaults to YES.
		 }
		function includeRetweets:Boolean;cdecl;
		procedure setIncludeRetweets(includeRetweets:Boolean);cdecl;
		
		{
		 *  A filtering object that hides certain tweets.
		 }
		function timelineFilter:TWTRTimelineFilter{*};cdecl;
		procedure setTimelineFilter(timelineFilter:TWTRTimelineFilter{*});cdecl;
		
		{*
		 *  Convenience initializer. Uses default values for `maxTweetsPerRequest` and `includeRetweets`.
		 *
		 *  @param listID (required) The ID of the list.
		 *  @param client (required) The API client to use for making network requests.
		 *
		 *  @return A full initialized list timeline datasource.
		 }
		[MethodName('initWithListID:APIClient:')]
		{-} function initWithListIDAPIClient(listID:NSString{*};client:TWTRAPIClient{*}):TWTRListTimelineDataSource;cdecl;
		
		{*
		 *  Convenience initializer. Uses default values for `maxTweetsPerRequest` and `includeRetweets`.
		 *
		 *  @param listSlug            (required) The slug of the list.
		 *  @param listOwnerScreenName (required) The list owner's screen name.
		 *  @param client              (required) The API client to use for making network requests.
		 *
		 *  @return A full initialized list timeline datasource.
		 }
		[MethodName('initWithListSlug:listOwnerScreenName:APIClient:')]
		{-} function initWithListSluglistOwnerScreenNameAPIClient(listSlug:NSString{*};listOwnerScreenName:NSString{*};client:TWTRAPIClient{*}):TWTRListTimelineDataSource;cdecl;
		
		{*
		 *  Designated initializer for creating list timeline data sources taking all parameters.
		 *
		 *  @param listID              (optional) The ID of the list. Provide either the `listID` or `listSlug` and `listOwnerScreenName`.
		 *  @param listSlug            (optional) The slug of the list. Provide either the `listID` or `listSlug` and `listOwnerScreenName`.
		 *  @param listOwnerScreenName (optional) The list owner's screen name. Provide either the `listID` or `listSlug` and `listOwnerScreenName`.
		 *  @param client              (required) The API client to use for making networking requests
		 *  @param maxTweetsPerRequest (optional) The number of Tweets per batch to request. A value of 0 will use the server default.
		 *  @param includeRetweets     (optional) Whether retweets should be requested.
		 *
		 *  @return A fully initialized list timeline datasource.
		 }
		[MethodName('initWithListID:listSlug:listOwnerScreenName:APIClient:maxTweetsPerRequest:includeRetweets:')]
		{-} function initWithListIDlistSluglistOwnerScreenNameAPIClientmaxTweetsPerRequestincludeRetweets(listID:{nullable} NSString{*};listSlug:{nullable} NSString{*};listOwnerScreenName:{nullable} NSString{*};client:TWTRAPIClient{*};maxTweetsPerRequest:NSUInteger;includeRetweets:Boolean):TWTRListTimelineDataSource;cdecl;
		
		{-} function init NS_UNAVAILABLE:TWTRListTimelineDataSource;cdecl;
		
	end;
	
	TWTRListTimelineDataSourceClass=interface(NSObjectClass)//<TWTRTimelineDataSource>
	['{48DDF839-17CA-48CB-87BF-CAFEFFA04847}']
	end;
	
	TTWTRListTimelineDataSource=class(TOCGenericImport<TWTRListTimelineDataSourceClass,TWTRListTimelineDataSource>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

