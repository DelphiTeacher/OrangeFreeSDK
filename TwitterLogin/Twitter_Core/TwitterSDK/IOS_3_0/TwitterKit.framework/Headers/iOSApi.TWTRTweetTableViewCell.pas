//
//  TWTRTweetTableViewCell.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRTweetTableViewCell;

interface

{$IFDEF IOS}
uses
	iOSapi.UIKit,
	iOSApi.TWTRTweetView,
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

	
	
	
	
	
	{*
	 *  A table view cell subclass which displays a Tweet.
	 }
	TWTRTweetTableViewCell=interface(UITableViewCell)//
	['{6CF2B3E6-EC5D-4990-9B92-BB464528CDA4}']
		
		{*
		 *  The Tweet view inside this cell. Holds all relevant text and images.
		 }
		function tweetView:TWTRTweetView{*};cdecl;
		procedure setTweetView(tweetView:TWTRTweetView{*});cdecl;
		
		{*
		 *  Configures the existing Tweet view with a Tweet. Updates labels, images, and thumbnails.
		 *
		 *  @param tweet The `TWTRTweet` model object for the Tweet to display.
		 }
		{-} procedure configureWithTweet(tweet:TWTRTweet{*});cdecl;
		
		{*
		 *  Returns how tall the Tweet view should be.
		 *
		 *  Uses the system to calculate the Auto Layout height. This is the same as
		 *  calling sizeThatFits: on a cached TWTRTweetView instance to let the system
		 *  calculate how tall the resulting view will be including the image, Retweet
		 *  view, and optional action buttons.
		 *
		 *  Note: The Auto Layout engine will throw an exception if this is called
		 *  on a background thread.
		 *
		 *  @param tweet           the Tweet
		 *  @param style           the style of the Tweet view
		 *  @param width           the width of the Tweet
		 *  @param showActions     whether the Tweet view will be displaying actions
		 *
		 *  @return the calculated height of the Tweet view
		 }
		
	end;
	
	TWTRTweetTableViewCellClass=interface(UITableViewCellClass)//
	['{7800B8D3-1840-4C32-A5A8-5680A004FCDF}']
		[MethodName('heightForTweet:style:width:showingActions:')]
		{+} function heightForTweetstylewidthshowingActions(tweet:TWTRTweet{*};style:TWTRTweetViewStyle;width:CGFloat;showActions:Boolean):CGFloat;cdecl;
	end;
	
	TTWTRTweetTableViewCell=class(TOCGenericImport<TWTRTweetTableViewCellClass,TWTRTweetTableViewCell>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

