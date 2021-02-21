//
//  TWTRTweet.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRTweet;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.TWTRJSONConvertible,
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
	 *  `TWTRTweet` is an immutable representation of a Tweet.
	 }
	TWTRTweet=interface(NSObject)//<NSCoding, TWTRJSONConvertible>
	['{1B2B795C-2D3B-4247-B62F-8AB8DC638766}']
		
		//#pragma mark - Properties
		
		{*
		 *  The ID of the Twitter Tweet.
		 *  @warning This represents the id_str field, which could differ from the value of the id field.
		 }
		function tweetID:NSString{*};cdecl;
		procedure setTweetID(tweetID:NSString{*});cdecl;
		
		{*
		 *  The date when this Tweet was created.
		 }
		function createdAt:NSDate{*};cdecl;
		procedure setCreatedAt(createdAt:NSDate{*});cdecl;
		
		{*
		 *  The text of the Tweet.
		 }
		function text:NSString{*};cdecl;
		procedure setText(text:NSString{*});cdecl;
		
		{*
		 *  The Author of the Tweet.
		 }
		function author:TWTRUser{*};cdecl;
		procedure setAuthor(author:TWTRUser{*});cdecl;
		
		{*
		 *  ID of the authenticated Twitter user this Tweet was loaded for. Some Tweet properties e.g. `isLiked`
		 *  can vary depending on the authenticated user. Nil means the Tweet was loaded from the perspective
		 *  of a logged-out user or the authenticated user could not be determined.
		 }
		function perspectivalUserID:NSString{*};cdecl;
		procedure setPerspectivalUserID(perspectivalUserID:NSString{*});cdecl;
		
		{*
		 *  The number of times this Tweet was liked.
		 }
		function long:long;cdecl;
		procedure setLong(long:long);cdecl;
		
		{*
		 *  The number of times this Tweet was retweeted.
		 }
		function long:long;cdecl;
		procedure setLong(long:long);cdecl;
		
		{*
		 *  The language of the Tweet.
		 }
		function languageCode:NSString{*};cdecl;
		procedure setLanguageCode(languageCode:NSString{*});cdecl;
		
		{*
		 *  The Tweet this Tweet was a reply to.
		 }
		function inReplyToTweetID:NSString{*};cdecl;
		procedure setInReplyToTweetID(inReplyToTweetID:NSString{*});cdecl;
		
		{*
		 *  The User ID this Tweet was a reply to.
		 }
		function inReplyToUserID:NSString{*};cdecl;
		procedure setInReplyToUserID(inReplyToUserID:NSString{*});cdecl;
		
		{*
		 *  The screen name of the user this Tweet was a reply to.
		 *  @note This doesn't contain the `@` sign before the screen name.
		 }
		function inReplyToScreenName:NSString{*};cdecl;
		procedure setInReplyToScreenName(inReplyToScreenName:NSString{*});cdecl;
		
		{*
		 *  The permalink URL for this Tweet.
		 *
		 *  Suitable for loading in a `UIWebView`, `WKWebView` or passing to Safari:
		 *
		 *  `[[UIApplication sharedApplication] openURL:tweet.permalink];`
		 }
		function permalink:NSURL{*};cdecl;
		procedure setPermalink(permalink:NSURL{*});cdecl;
		
		{*
		 *  Whether this Tweet was liked by the authenticated user.
		 *
		 *  @warning The value of this property depends on the authenticated user.
		 }
		function isLiked:Boolean;cdecl;
		procedure setIsLiked(isLiked:Boolean);cdecl;
		
		{*
		 *  Whether this Tweet was retweeted by the authenticated user.
		 *
		 *  @warning The value of this property depends on the authenticated user.
		 }
		function isRetweeted:Boolean;cdecl;
		procedure setIsRetweeted(isRetweeted:Boolean);cdecl;
		
		{*
		 *  The Tweet ID of the authenticated user's retweet of this Tweet. This will be `nil` if there is no
		 *  authenticated user or the user has not retweeted this Tweet.
		 *
		 *  @warning The value of this property depends on the authenticated user.
		 }
		function retweetID:NSString{*};cdecl;
		procedure setRetweetID(retweetID:NSString{*});cdecl;
		
		{*
		 *  The original, fully-hydrated Tweet that was retweeted. This corresponds to the `retweeted_status` API field.
		 *  This is `nil` unless `self.isRetweet == YES`.
		 }
		function retweetedTweet:TWTRTweet{*};cdecl;
		procedure setRetweetedTweet(retweetedTweet:TWTRTweet{*});cdecl;
		
		{*
		 *  Indicates whether this Tweet is a retweet of another Tweet.
		 }
		function isRetweet:Boolean;cdecl;
		procedure setIsRetweet(isRetweet:Boolean);cdecl;
		
		{*
		 * Indicates whether this Tweet is a Quote Tweet.
		 }
		function isQuoteTweet:Boolean;cdecl;
		procedure setIsQuoteTweet(isQuoteTweet:Boolean);cdecl;
		
		{*
		 *  The original, fully-hydrated Tweet that was quoted.
		 *  This is `nil` unless `self.isRetweet == YES`.
		 }
		function quotedTweet:TWTRTweet{*};cdecl;
		procedure setQuotedTweet(quotedTweet:TWTRTweet{*});cdecl;
		
		{*
		 *  Creates an array of TWTRTweet instances from the array of Twitter API JSON response.
		 *
		 *  @param array A parsed array of Tweet API JSON responses.
		 *  @return An array of TWTRTweet instances.
		 }
		
		{*
		 *  Creates a new Tweet instance with a new value for the `isLiked` boolean
		 *  value which is the opposite of the current value.
		 }
		{-} function tweetWithLikeToggled:TWTRTweet{*};cdecl;
		
		{*
		 *  Tweet objects should be hyrdrated from a valid JSON object. See TWTRJSONConvertible for more information.
		 }
		{-} function init NS_UNAVAILABLE:TWTRTweet;cdecl;
		
	end;
	
	TWTRTweetClass=interface(NSObjectClass)//<NSCoding, TWTRJSONConvertible>
	['{E306A4F0-9EBA-4098-A710-736A2A10C5D9}']
		{+} function tweetsWithJSONArray(_array:{nullable} NSArray{*}):NSArray{*};cdecl;
	end;
	
	TTWTRTweet=class(TOCGenericImport<TWTRTweetClass,TWTRTweet>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

