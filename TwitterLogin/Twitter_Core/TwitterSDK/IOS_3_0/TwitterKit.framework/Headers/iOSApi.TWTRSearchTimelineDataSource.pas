//
//  TWTRSearchTimelineDataSource.h
//  TwitterKit
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRSearchTimelineDataSource;

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
	Data source representing a Search Timeline. Provides TWTRTweet objects to a TWTRTimelineViewController in pages determined by the TWTRTimelineCursor object passed in to the `loadNext:` and `loadPrevious:` methods.
	
	## Search Queries:
	
	 * `watching now`	containing both ¡°watching¡± and ¡°now¡±. Default.
	 * `¡°happy hour¡±`	containing the exact phrase ¡°happy hour¡±.
	 * `love OR hate`	containing either ¡°love¡± or ¡°hate¡± (or both).
	 * `beer -root`     containing ¡°beer¡± but not ¡°root¡±.
	 * `#haiku`         containing the hashtag ¡°haiku¡±.
	 * `from:alexiskold`sent from person ¡°alexiskold¡±.
	 * `to:techcrunch`	sent to person ¡°techcrunch¡±.
	 * `@mashable`      referencing person ¡°mashable¡±.
	 * `flight :(`      containing ¡°flight¡± and with a negative attitude.
	 * `traffic ?`      containing ¡°traffic¡± and asking a question.
	 * `movie -scary :)`containing ¡°movie¡±, but not ¡°scary¡±, and with a positive attitude.
	 * `hilarious filter:links` containing ¡°hilarious¡± and linking to URL.
	 * `news source:twitterfeed`containing ¡°news¡± and entered via TwitterFeed
	 * `superhero since:2010-12-27`	containing ¡°superhero¡± and sent since date ¡°2010-12-27¡± (year-month-day).
	 * `ftw until:2010-12-27`   containing ¡°ftw¡± and sent before the date ¡°2010-12-27¡±.
	
	  @see https://dev.twitter.com/rest/public/search
	 }
	TWTRSearchTimelineDataSource=interface(NSObject)//<TWTRTimelineDataSource>
	['{EC31F361-6A0B-4782-B6E4-BE1F0D39022B}']
		
		{*
		 *  The search query. This matches what you would type into https://twitter.com/search
		 }
		function searchQuery:NSString{*};cdecl;
		procedure setSearchQuery(searchQuery:NSString{*});cdecl;
		
		{*
		 *  Restricts tweets returned to a given language, specified by its ISO 639-1 code (for example: en, es). Language detection is best-effort. The server defaults to returning Tweets in all languages.
		 *
		 *  @see http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
		 }
		function languageCode:NSString{*};cdecl;
		procedure setLanguageCode(languageCode:NSString{*});cdecl;
		
		{*
		 *  The number of Tweets to request in each network request for more Tweets. By default requests 30 tweets. If set to `0` the parameter will not be set on the request and the Twitter API will use the default size for the endpoint.
		 }
		function maxTweetsPerRequest:NSUInteger;cdecl;
		procedure setMaxTweetsPerRequest(maxTweetsPerRequest:NSUInteger);cdecl;
		
		{*
		 *  The geocode details to narrow search results. The format is "latitude,longitude,radius" e.g. "37.781157,-122.398720,1mi"
		 *
		 *  @see https://dev.twitter.com/rest/public/search
		 }
		function geocodeSpecifier:NSString{*};cdecl;
		procedure setGeocodeSpecifier(geocodeSpecifier:NSString{*});cdecl;
		
		{*
		 *  Filter out sensitive (containing nudity or violence) tweets.
		 *
		 *  Defaults to YES.
		 }
		function filterSensitiveTweets:Boolean;cdecl;
		procedure setFilterSensitiveTweets(filterSensitiveTweets:Boolean);cdecl;
		
		{
		 *  A filtering object that hides certain tweets.
		 }
		function timelineFilter:TWTRTimelineFilter{*};cdecl;
		procedure setTimelineFilter(timelineFilter:TWTRTimelineFilter{*});cdecl;
		
		{
		 *  Specifies search result type to be recent or popular Tweets, or a mix of both.
		 *
		 *  @param resultType possible options are recent, popular, or mixed.
		 }
		function resultType:NSString{*};cdecl;
		procedure setResultType(resultType:NSString{*});cdecl;
		
		{*
		 *  Convenience initializer. Uses default values for `languageCode` and `maxTweetsPerRequest`.
		 *
		 *  @param  searchQuery (required) The query string that you would type into https://twitter.com/search
		 *  @param  client      (required) An instance of `TWTRAPIClient` with which API calls will be made.
		 *
		 *  @return A fully initialized search timeline datasource or `nil` if any of the required parameters are missing.
		 }
		[MethodName('initWithSearchQuery:APIClient:')]
		{-} function initWithSearchQueryAPIClient(searchQuery:NSString{*};client:TWTRAPIClient{*}):TWTRSearchTimelineDataSource;cdecl;
		
		{*
		 *  Create a new search timeline data source.
		 *
		 *  @param  searchQuery          (required) The query string that you would type into https://twitter.com/search
		 *  @param  client               (required) An instance of `TWTRAPIClient` with which API calls will be made.
		 *  @param  languageCode         (optional) The ISO 639-1 language code to restrict Tweets to. A `nil` value will not add the parameter to the server request and so use the server default.
		 *  @param  maxTweetsPerRequest  (optional) The number of tweets to request in each query to the Twitter API. A value of 0 will not add to the parameters and thus use the server default.
		 *  @param  resultType           (optional) The result type for timeline. It is default to 'mixed' if not assigned.
		 *
		 *  @return A fully initialized search timeline datasource or `nil` if any of the required parameters are missing.
		 }
		[MethodName('initWithSearchQuery:APIClient:languageCode:maxTweetsPerRequest:resultType:')]
		{-} function initWithSearchQueryAPIClientlanguageCodemaxTweetsPerRequestresultType(searchQuery:NSString{*};client:TWTRAPIClient{*};languageCode:{nullable} NSString{*};maxTweetsPerRequest:NSUInteger;resultType:{nullable} NSString{*}):TWTRSearchTimelineDataSource;cdecl;
		
		{-} function init NS_UNAVAILABLE:TWTRSearchTimelineDataSource;cdecl;
		
	end;
	
	TWTRSearchTimelineDataSourceClass=interface(NSObjectClass)//<TWTRTimelineDataSource>
	['{6013865A-A4AC-41B4-95BE-E2060CBB25FC}']
	end;
	
	TTWTRSearchTimelineDataSource=class(TOCGenericImport<TWTRSearchTimelineDataSourceClass,TWTRSearchTimelineDataSource>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

