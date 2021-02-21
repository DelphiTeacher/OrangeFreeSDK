//
//  TWTRTimelineCursor.h
//  TwitterKit
//
//  Created by Kang Chen on 2/12/15.
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRTimelineCursor;

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
	 This Model object is a generic type of `Cursor` to represent the range of Tweets
	 which have already been loaded from the Twitter API. A dataset that supports
	 "cursoring" splits of a set of results (or Tweets in our case) in pages. One
	 page is loaded at a time, and the cursor from the previous request is used to
	 calculated which set of Tweets should be requested.
	
	
	 ## Positions
	 For User, Search, and List Timelines generally corresponds to a real Tweet ID.
	
	           newer Tweets
	         (not yet loaded)
	
	     -- newest/highest Tweet --      maxPosition
	
	           loaded Tweets
	
	     -- oldest/lowest Tweet --      minPosition
	                                    minPosition - 1
	           older Tweets
	         (not yet loaded)
	
	   More: https://dev.twitter.com/overview/api/cursoring
	
	 }
	TWTRTimelineCursor=interface(NSObject)//
	['{DEA44D05-B06A-4D89-8280-D8E3E0300999}']
		
		{*
		 *  The ID of the Tweet highest up in a batch of Tweets received from a Timeline.
		 *  Often this corresponds to the newest Tweet in terms of time.
		 *
		 *  For User, Search, and List Timelines this corresponds to a real Tweet ID..
		 }
		function maxPosition:NSString{*};cdecl;
		procedure setMaxPosition(maxPosition:NSString{*});cdecl;
		
		{*
		 *  The ID of the Tweet lowest in a batch of Tweets received from a Timeline. This
		 *  often corresponds to the oldest Tweet in terms of time.
		 *
		 }
		function minPosition:NSString{*};cdecl;
		procedure setMinPosition(minPosition:NSString{*});cdecl;
		
		{-} function init __unavailable:TWTRTimelineCursor;cdecl;
		
		{*
		 *  Initialize a new cursor.
		 *
		 *  @param maxPosition The highest (newest) Tweet ID received in this batch of Tweets.
		 *  @param minPosition The lowest (oldest) Tweet ID received in this batch of Tweets.
		 *
		 *  @return The initialized cursor to be passed back from a request for a Timeline from
		 *          the Twitter API.
		 }
		[MethodName('initWithMaxPosition:minPosition:')]
		{-} function initWithMaxPositionminPosition(maxPosition:NSString{*};minPosition:NSString{*}):TWTRTimelineCursor;cdecl;
		
	end;
	
	TWTRTimelineCursorClass=interface(NSObjectClass)//
	['{7D134C7C-8CA5-40A9-8F98-559A482F895D}']
	end;
	
	TTWTRTimelineCursor=class(TOCGenericImport<TWTRTimelineCursorClass,TWTRTimelineCursor>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

