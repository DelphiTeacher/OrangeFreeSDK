//
//  TWTRTimelineDelegate.h
//  TwitterKit
//
//  Created by Steven Hepting on 7/25/16.
//  Copyright ? 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRTimelineDelegate;

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

	
	
	
	
	
	
	TWTRTimelineDelegate=interface(IObjectiveC)
		['{7EA5F589-31DE-4380-8D17-CDF15BAD6B3B}']
		
		//@optional
		
		{*
		 *  The Timeline started loading new Tweets. This would be an
		 *  appropriate place to begin showing a loading indicator.
		 *
		 *  @param timeline Timeline controller providing the updates
		 }
		{-} procedure timelineDidBeginLoading(timeline:TWTRTimelineViewController{*});cdecl;
		
		{*
		 *  The Timeline has finished loading more Tweets.
		 *
		 *  If Tweets array is `nil`, you should check the error object
		 *  for a description of the failure case.
		 *
		 *  @param timeline Timeline displaying loaded Tweets
		 *  @param tweets   Tweet objects loaded from the network
		 *  @param error    Error object describing details of failure
		 }
		[MethodName('timeline:didFinishLoadingTweets:error:')]
		{-} procedure timelinedidFinishLoadingTweetserror(timeline:TWTRTimelineViewController{*};tweets:{nullable} NSArray{*};error:{nullable} NSError{*});cdecl;
		
	end;
	
	TOntimelineDidBeginLoading=procedure(timeline:TWTRTimelineViewController{*}) of object;
	TOntimelinedidFinishLoadingTweetserror=procedure(timeline:TWTRTimelineViewController{*};tweets:{nullable} NSArray{*};error:{nullable} NSError{*}) of object;
	
	TTWTRTimelineDelegate=class(TOCLocal,TWTRTimelineDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OntimelineDidBeginLoading:TOntimelineDidBeginLoading;
		OntimelinedidFinishLoadingTweetserror:TOntimelinedidFinishLoadingTweetserror;
	
		
		//@optional
		
		{*
		 *  The Timeline started loading new Tweets. This would be an
		 *  appropriate place to begin showing a loading indicator.
		 *
		 *  @param timeline Timeline controller providing the updates
		 }
		{-} procedure timelineDidBeginLoading(timeline:TWTRTimelineViewController{*});cdecl;
		
		{*
		 *  The Timeline has finished loading more Tweets.
		 *
		 *  If Tweets array is `nil`, you should check the error object
		 *  for a description of the failure case.
		 *
		 *  @param timeline Timeline displaying loaded Tweets
		 *  @param tweets   Tweet objects loaded from the network
		 *  @param error    Error object describing details of failure
		 }
		[MethodName('timeline:didFinishLoadingTweets:error:')]
		{-} procedure timelinedidFinishLoadingTweetserror(timeline:TWTRTimelineViewController{*};tweets:{nullable} NSArray{*};error:{nullable} NSError{*});cdecl;
		
	end;
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TTWTRTimelineDelegate }

constructor TTWTRTimelineDelegate.Create;
begin
	Inherited Create;
end;

destructor TTWTRTimelineDelegate.Destroy;
begin
	Inherited;
end;

procedure  TTWTRTimelineDelegate.timelineDidBeginLoading(timeline:TWTRTimelineViewController{*});
begin
	if Assigned(OntimelineDidBeginLoading) then
	begin
		OntimelineDidBeginLoading(timeline);
	end;
end;

procedure  TTWTRTimelineDelegate.timelinedidFinishLoadingTweetserror(timeline:TWTRTimelineViewController{*};tweets:{nullable} NSArray{*};error:{nullable} NSError{*});
begin
	if Assigned(OntimelinedidFinishLoadingTweetserror) then
	begin
		OntimelinedidFinishLoadingTweetserror(timeline,tweets,error);
	end;
end;



{$ENDIF}

end.

