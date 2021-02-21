//
//  TWTRUserTimelineDataSource.h
//  TwitterKit
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRUserTimelineDataSource;

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
	 *  This Timeline Data Source provides a list of Tweets roughly consistent with the list on a Users profile page. The difference is that this data source will filter out Tweets that are direct replies to other users by default.
	 *
	 *  These Tweets are ordered chronologically with the most recent first.
	 }
	TWTRUserTimelineDataSource=interface(NSObject)//<TWTRTimelineDataSource>
	['{AD819560-AECE-411E-A1C4-95D8FE9FA29C}']
		
		{*
		 *  The screen name of the User whose Tweets are being shown. Either the `screenName` or the `userID` are required.
		 }
		function screenName:NSString{*};cdecl;
		procedure setScreenName(screenName:NSString{*});cdecl;
		
		{*
		 *  The userID of the User whose Tweets are being shown. Either the `screenName` or the `userID` are required.
		 }
		function userID:NSString{*};cdecl;
		procedure setUserID(userID:NSString{*});cdecl;
		
		{*
		 *  The number of Tweets to request in each query to the Twitter Timeline API when fetching the next batch of Tweets. Will request 30 Tweets by default. Setting this value to 0 will use the server default.
		 }
		function maxTweetsPerRequest:NSUInteger;cdecl;
		procedure setMaxTweetsPerRequest(maxTweetsPerRequest:NSUInteger);cdecl;
		
		{*
		 *  Whether to request replies in the set of Tweets from the server.
		 *
		 *  Defaults to NO.
		 }
		function includeReplies:Boolean;cdecl;
		procedure setIncludeReplies(includeReplies:Boolean);cdecl;
		
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
		 *  Convenience initializer. Uses default values for `maxTweetsPerRequest`, `includeReplies` and `includeRetweets`.
		 *
		 *  @param screenName The screen name of a Twitter User
		 *  @param client     The API client to use for making network requests.
		 *
		 *  @return A fully initialized user timeline datasource or nil.
		 }
		[MethodName('initWithScreenName:APIClient:')]
		{-} function initWithScreenNameAPIClient(screenName:NSString{*};client:TWTRAPIClient{*}):TWTRUserTimelineDataSource;cdecl;
		
		{*
		 *  The designated initialzer accepted values for properties.
		 *
		 *  @param userID              The user ID of the Twitter User
		 *  @param screenName          The screen name of the Twitter User
		 *  @param client              The API client to use for making network requests.
		 *  @param maxTweetsPerRequest The number of Tweets per batch to request. A value of 0 will use the server default.
		 *  @param includeReplies      Whether replies should be requested
		 *  @param includeRetweets     Whether retweets should be requested
		 *
		 *  @return A fully initialized user timeline datasource or nil.
		 }
		[MethodName('initWithScreenName:userID:APIClient:maxTweetsPerRequest:includeReplies:includeRetweets:')]
		{-} function initWithScreenNameuserIDAPIClientmaxTweetsPerRequestincludeRepliesincludeRetweets(screenName:{nullable} NSString{*};userID:{nullable} NSString{*};client:TWTRAPIClient{*};maxTweetsPerRequest:NSUInteger;includeReplies:Boolean;includeRetweets:Boolean):TWTRUserTimelineDataSource;cdecl;
		
		{-} function init NS_UNAVAILABLE:TWTRUserTimelineDataSource;cdecl;
		
	end;
	
	TWTRUserTimelineDataSourceClass=interface(NSObjectClass)//<TWTRTimelineDataSource>
	['{1AD1833D-1A48-48AA-8B85-168E95F6A5C0}']
	end;
	
	TTWTRUserTimelineDataSource=class(TOCGenericImport<TWTRUserTimelineDataSourceClass,TWTRUserTimelineDataSource>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

