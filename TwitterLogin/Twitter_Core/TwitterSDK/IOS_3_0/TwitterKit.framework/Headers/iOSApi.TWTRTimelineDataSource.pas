//
//  TWTRTimelineDataSource.h
//  TwitterKit
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRTimelineDataSource;

interface

{$IFDEF IOS}
uses
	iOSApi.TWTRTimelineType,
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

	
	
	
	
	
	
	
	
//	(^TWTRLoadTimelineCompletion)(NSArray<TWTRTweet *> *_Nullable tweets, TWTRTimelineCursor *_Nullable cursor, NSError *_Nullable error)=void;
	 TWTRLoadTimelineCompletion=Pointer;
	{*
	 *  Responsible for building network parameters for requesting a timeline of Tweets.
	 *
	 *  Implementations of this protocol don't need to be thread-safe. All the methods will be invoked on the main thread.
	 }
	TWTRTimelineDataSource=interface(IObjectiveC)
		['{56BE98C3-215D-4663-B171-D8EA52409B9B}']
		
		{*
		 *  Load Tweets before a given position. For time-based timelines this generally
		 *  corresponds to Tweets older than a position.
		 *
		 *  @param position     (optional) The position or Tweet ID before the page
		 *                      of Tweets to be loaded.
		 *  @param completion   (required) Invoked with the Tweets and the cursor in case of success, or nil
		 *                      and an error in case of error. This must be called on the main thread.
		 }
		[MethodName('loadPreviousTweetsBeforePosition:completion:')]
		{-} procedure loadPreviousTweetsBeforePositioncompletion(position:{nullable} NSString{*};completion:TWTRLoadTimelineCompletion);cdecl;
		
		{
		 *  The type of the timeline that this data source represents.
		 }
		function timelineType:TWTRTimelineType;cdecl;
		procedure setTimelineType(timelineType:TWTRTimelineType);cdecl;
		
		{
		 *  An object with a set of filters to hide certain tweets.
		 }
		function timelineFilter:TWTRTimelineFilter{*};cdecl;
		procedure setTimelineFilter(timelineFilter:TWTRTimelineFilter{*});cdecl;
		
		{*
		 * The API client to use with this data source.
		 * You will, likely, not need to alter this value unless you are implementing your
		 * own timeline view controller.
		 }
		function APIClient:TWTRAPIClient{*};cdecl;
		procedure setAPIClient(APIClient:TWTRAPIClient{*});cdecl;

	end;
	
	TOnloadPreviousTweetsBeforePositioncompletion=procedure(position:{nullable} NSString{*};completion:TWTRLoadTimelineCompletion) of object;
	TOntimelineType=function():TWTRTimelineType of object;
	TOnsettimelineType=procedure(timelineType:TWTRTimelineType) of object;
	TOntimelineFilter=function():TWTRTimelineFilter{*} of object;
	TOnsettimelineFilter=procedure(timelineFilter:TWTRTimelineFilter{*}) of object;
	TOnAPIClient=function():TWTRAPIClient{*} of object;
	TOnsetAPIClient=procedure(APIClient:TWTRAPIClient{*}) of object;
	
	TTWTRTimelineDataSource=class(TOCLocal,TWTRTimelineDataSource)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnloadPreviousTweetsBeforePositioncompletion:TOnloadPreviousTweetsBeforePositioncompletion;
		OntimelineType:TOntimelineType;
		OnsettimelineType:TOnsettimelineType;
		OntimelineFilter:TOntimelineFilter;
		OnsettimelineFilter:TOnsettimelineFilter;
		OnAPIClient:TOnAPIClient;
		OnsetAPIClient:TOnsetAPIClient;
	
		
		{*
		 *  Load Tweets before a given position. For time-based timelines this generally
		 *  corresponds to Tweets older than a position.
		 *
		 *  @param position     (optional) The position or Tweet ID before the page
		 *                      of Tweets to be loaded.
		 *  @param completion   (required) Invoked with the Tweets and the cursor in case of success, or nil
		 *                      and an error in case of error. This must be called on the main thread.
		 }
		[MethodName('loadPreviousTweetsBeforePosition:completion:')]
		{-} procedure loadPreviousTweetsBeforePositioncompletion(position:{nullable} NSString{*};completion:TWTRLoadTimelineCompletion);cdecl;
		
		{
		 *  The type of the timeline that this data source represents.
		 }
		function timelineType:TWTRTimelineType;cdecl;
		procedure setTimelineType(timelineType:TWTRTimelineType);cdecl;
		
		{
		 *  An object with a set of filters to hide certain tweets.
		 }
		function timelineFilter:TWTRTimelineFilter{*};cdecl;
		procedure setTimelineFilter(timelineFilter:TWTRTimelineFilter{*});cdecl;
		
		{*
		 * The API client to use with this data source.
		 * You will, likely, not need to alter this value unless you are implementing your
		 * own timeline view controller.
		 }
		function APIClient:TWTRAPIClient{*};cdecl;
		procedure setAPIClient(APIClient:TWTRAPIClient{*});cdecl;
		
	end;
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TTWTRTimelineDataSource }

constructor TTWTRTimelineDataSource.Create;
begin
	Inherited Create;
end;

destructor TTWTRTimelineDataSource.Destroy;
begin
	Inherited;
end;

procedure  TTWTRTimelineDataSource.loadPreviousTweetsBeforePositioncompletion(position:{nullable} NSString{*};completion:TWTRLoadTimelineCompletion);
begin
	if Assigned(OnloadPreviousTweetsBeforePositioncompletion) then
	begin
		OnloadPreviousTweetsBeforePositioncompletion(position,completion);
	end;
end;

procedure  TTWTRTimelineDataSource.settimelineType(timelineType:TWTRTimelineType);
begin
	if Assigned(OnsettimelineType) then
	begin
		OnsettimelineType(timelineType);
	end;
end;

function  TTWTRTimelineDataSource.timelineType():TWTRTimelineType;
begin
	if Assigned(OntimelineType) then
	begin
		Result:=OntimelineType();
	end;
end;

procedure  TTWTRTimelineDataSource.settimelineFilter(timelineFilter:TWTRTimelineFilter{*});
begin
	if Assigned(OnsettimelineFilter) then
	begin
		OnsettimelineFilter(timelineFilter);
	end;
end;

function  TTWTRTimelineDataSource.timelineFilter():TWTRTimelineFilter{*};
begin
	if Assigned(OntimelineFilter) then
	begin
		Result:=OntimelineFilter();
	end;
end;

procedure  TTWTRTimelineDataSource.setAPIClient(APIClient:TWTRAPIClient{*});
begin
	if Assigned(OnsetAPIClient) then
	begin
		OnsetAPIClient(APIClient);
	end;
end;

function  TTWTRTimelineDataSource.APIClient():TWTRAPIClient{*};
begin
	if Assigned(OnAPIClient) then
	begin
		Result:=OnAPIClient();
	end;
end;



{$ENDIF}

end.

