//
//  TWTRTimelineViewController.h
//  TwitterKit
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRTimelineViewController;

interface

{$IFDEF IOS}
uses
	iOSapi.UIKit,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;
	PTWTRTimelineDataSource=Pointer;//PTWTRTimelineDataSource=Pointer of TWTRTimelineDataSource; ILocalObject(TWTRTimelineDataSource).GetObjectID
	PTWTRTweetViewDelegate=Pointer;//PTWTRTweetViewDelegate=Pointer of TWTRTweetViewDelegate; ILocalObject(TWTRTweetViewDelegate).GetObjectID
	PTWTRTimelineDelegate=Pointer;//PTWTRTimelineDelegate=Pointer of TWTRTimelineDelegate; ILocalObject(TWTRTimelineDelegate).GetObjectID

	//@protocol TWTRTimelineDataSource;
	//@protocol TWTRTweetViewDelegate;
	//@protocol TWTRTimelineDelegate;
	
	
	
	
	
	{*
	 This class is a `UITableViewController` subclass that displays `TWTRTweetTableViewCell` cells. It handles cell-reuse, cell-configuration, and loading more Tweets from the given timeline once the last cell is displayed.
	
	 ## Usage
	
	 Initialize this class with any object that conforms to the `TWTRTimelineDataSource` protocol. We provide two such classes, `TWTRUserTimelineDataSource` and `TWTRSearchTimelineDataSource`. These provide `TWTRTweet` objects to this table view which then configures the instances of `TWTRTweetTableViewCell`.
	
	    // Create the data source
	    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
	    TWTRUserTimelineDataSource *dataSource = [[TWTRUserTimelineDataSource alloc] initWithScreenName:@"jack" APIClient:client];
	
	    // Create the timeline view controller
	    TWTRTimelineViewController *timeline = [[TWTRTimelineViewController alloc] initWithDataSource:dataSource];
	
	 ## Loading More
	
	 This class loads the first batch of `TWTRTweet` objects from the Twitter API when `viewWillAppear:` is received. It also handles loading more tweets automatically once the last cell has been shown.
	
	 }
	TWTRTimelineViewController=interface(UITableViewController)//
	['{C5A6C539-8362-464B-A3BE-9E3372C86D4C}']
		
		{*
		  The source of `TWTRTweet` objects for this `TWTRTimelineViewController`.
		  May be set to update the Tweets being shown by this table view. Must be set on the main thread.
		 }
		function dataSource:PTWTRTimelineDataSource{id<TWTRTimelineDataSource>};cdecl;
		procedure setDataSource(dataSource:PTWTRTimelineDataSource{id<TWTRTimelineDataSource>});cdecl;
		
		{*
		 *  The configuration of MoPub ads to show in the timeline. You must
		 *  link against the MoPub framework and provide this configuration in order
		 *  for ads to be injected.
		 *  @note Changing this will force a reload of the timeline. You can only set this once. Must be set on the main thread.
		 }
		function adConfiguration:TWTRMoPubAdConfiguration{*};cdecl;
		procedure setAdConfiguration(adConfiguration:TWTRMoPubAdConfiguration{*});cdecl;
		
		{*
		 *  Whether action buttons (Like, Share) should be shown on the `TWTRTweetTableViewCell`s inside the tableview.
		 }
		function showTweetActions:Boolean;cdecl;
		procedure setShowTweetActions(showTweetActions:Boolean);cdecl;
		
		{*
		 * If set, this value will be passed to all TWTRTweetView instances in the timeline.
		 }
		function tweetViewDelegate:PTWTRTweetViewDelegate{id<TWTRTweetViewDelegate>};cdecl;
		procedure setTweetViewDelegate(tweetViewDelegate:PTWTRTweetViewDelegate{id<TWTRTweetViewDelegate>});cdecl;
		
		{*
		 *  The object that acts as the delegate for the timeline.
		 }
		function timelineDelegate:PTWTRTimelineDelegate{id<TWTRTimelineDelegate>};cdecl;
		procedure setTimelineDelegate(timelineDelegate:PTWTRTimelineDelegate{id<TWTRTimelineDelegate>});cdecl;
		
		{*
		 Initializes a timeline view controller. Does not start loading tweets until
		 `viewWillAppear:` is called.
		
		 This method must be used to initialize this class. The `init` method is unavailable.
		
		 @param dataSource   A timeline data source object that conforms to the `TWTRTimelineDataSource` protocol.
		
		 @return A fully initialized `TWTRTimelineViewController` or nil if the data source is missing.
		 }
		{-} function initWithDataSource(dataSource:{nullable} id<TWTRTimelineDataSource>):TWTRTimelineViewController;cdecl;
		
		{*
		 *  Initializes a timeline view controller with an optional ad configuration. Does not start loading Tweets until `viewWillAppear:` is called.
		 *
		 *  @param dataSource      A timeline data source object that conforms to the `TWTRTimelineDataSource` protocol.
		 *  @param adConfiguration Configuration for the type of MoPub ads to display. Ads will only load after
		 *                         the initial timeline is loaded. No ads will be displayed if nil.
		 *
		 *  @return A fully initialized `TWTRTimelineViewController`. Tweets will not be loaded if the data source is nil.
		 }
		[MethodName('initWithDataSource:adConfiguration:')]
		{-} function initWithDataSourceadConfiguration(dataSource:{nullable} id<TWTRTimelineDataSource>;adConfiguration:{nullable} TWTRMoPubAdConfiguration{*}):TWTRTimelineViewController;cdecl;
		
		{-} function initWithStyle(style:UITableViewStyle):TWTRTimelineViewController;cdecl;
		
		{*
		 *  Asynchronously refresh and replace all the data in the table view with the latest `TWTRTweet`s.
		 }
		{-} procedure refresh;cdecl;
		
		{*
		 * Returns the number of Tweets that are currently displayed by the controller.
		 }
		{-} function countOfTweets:NSUInteger;cdecl;
		
		{*
		 * Returns the Tweet at the given index.
		 *
		 * @warning This method will throw an exception if the index is out of range of the count of Tweets.
		 }
		{-} function tweetAtIndex(index:NSInteger):TWTRTweet{*};cdecl;
		
		{*
		 * Returns a copy of the Tweets at the time of calling this method.
		
		 * This method returns the copy of the current Tweets. The Tweets may change
		 * after this method is called.
		 }
		{-} function snapshotTweets:NSArray{*};cdecl;
		
	end;
	
	TWTRTimelineViewControllerClass=interface(UITableViewControllerClass)//
	['{3149727F-FBD4-48B9-9F30-7EBC749A59A5}']
	end;
	
	TTWTRTimelineViewController=class(TOCGenericImport<TWTRTimelineViewControllerClass,TWTRTimelineViewController>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

