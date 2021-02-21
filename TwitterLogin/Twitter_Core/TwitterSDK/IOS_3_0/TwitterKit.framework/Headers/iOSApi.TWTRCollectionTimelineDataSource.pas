//
//  TWTRCollectionTimelineDataSource.h
//  TwitterKit
//
//  Created by Steven Hepting on 2/10/15.
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRCollectionTimelineDataSource;

interface

{$IFDEF IOS}
uses
  iOSApi.TWTRTimelineType,
	iOSapi.Foundation,
	iOSApi.TWTRTimelineDataSource,
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

	
	
	
	
	
	
	TWTRCollectionTimelineDataSource=interface(NSObject)//<TWTRTimelineDataSource>
	['{011164C8-B19A-4D51-BED3-05F490670CF0}']
		
		{*
		 *  The number of Tweets to request in each query to the Twitter Timeline API when fetching the next batch of Tweets.
		 }
		function maxTweetsPerRequest:NSInteger;cdecl;
		procedure setMaxTweetsPerRequest(maxTweetsPerRequest:NSInteger);cdecl;
		
		{*
		 *  ID of the collection.
		 }
		function collectionID:NSString{*};cdecl;
		procedure setCollectionID(collectionID:NSString{*});cdecl;
		
		{
		 *  A filtering object that hides certain tweets.
		 }
		function timelineFilter:TWTRTimelineFilter{*};cdecl;
		procedure setTimelineFilter(timelineFilter:TWTRTimelineFilter{*});cdecl;
		
		{*
		 *  Convenience initializer.
		 *
		 *  @param collectionID (required) The ID of this collection. For example, the ID of this collection: https://twitter.com/TwitterMusic/timelines/393773266801659904 is @"393773266801659904"
		 *
		 *  @return An instance of TWTRCollectionTimelineDataSource or nil if any of the required parameters is missing.
		 }
		[MethodName('initWithCollectionID:APIClient:')]
		{-} function initWithCollectionIDAPIClient(collectionID:NSString{*};client:TWTRAPIClient{*}):TWTRCollectionTimelineDataSource;cdecl;
		
		{*
		 *  Designated initializer setting all supported values for Collection Timeline Data Source.
		 *
		 *  @param collectionID           (required) The Collection ID value. e.g. @"393773266801659904"
		 *  @param client                 (required) The API client to use for all network requests.
		 *  @param maxTweetsPerRequest    (optional) Number of Tweets to request per batch. A value of 0 uses the server default.
		 *
		 *  @return An instance of TWTRCollectionTimelineDataSource or nil if any of the required parameters are missing.
		 }
		[MethodName('initWithCollectionID:APIClient:maxTweetsPerRequest:')]
		{-} function initWithCollectionIDAPIClientmaxTweetsPerRequest(collectionID:NSString{*};client:TWTRAPIClient{*};maxTweetsPerRequest:NSUInteger):TWTRCollectionTimelineDataSource;cdecl;
		
//		{-} function init NS_UNAVAILABLE:TWTRCollectionTimelineDataSource;cdecl;

	end;

	TWTRCollectionTimelineDataSourceClass=interface(NSObjectClass)//<TWTRTimelineDataSource>
	['{9FDACA40-4A1D-47FC-807A-BE1EC33DBB69}']
	end;
	
	TTWTRCollectionTimelineDataSource=class(TOCGenericImport<TWTRCollectionTimelineDataSourceClass,TWTRCollectionTimelineDataSource>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

