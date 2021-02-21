unit iOSApi.TWTRAPIClient;

interface

{$IFDEF IOS}
uses
  iOSApi.TWTRUser,
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

	//
	//  TWTRAPIClient.h
	//
	//  Copyright (c) 2015 Twitter. All rights reserved.
	//
	
	
	
	
	
	//@protocol TWTRAuthSession;
	//@protocol TWTRSessionStore;
	
	
	
	
	
	{*
	 *  @name Completion Block Types
	 }
	
	{*
	 *  Completion block called when the load user request succeeds or fails.
	 *
	 *  @param user  The Twitter User.
	 *  @param error Error that will be set if the API request failed.
	 }
//	(^TWTRLoadUserCompletion)(TWTRUser *_Nullable user, NSError *_Nullable error)=void;
	  TWTRLoadUserCompletion=procedure(twitteruser:TWTRUser;error:NSError) of Object;
	{*
	 *  Completion block called when the load Tweet request succeeds or fails.
	 *
	 *  @param tweet The Twitter Tweet.
	 *  @param error Error that will be set if the API request failed.
	 }
//	(^TWTRLoadTweetCompletion)(TWTRTweet *_Nullable tweet, NSError *_Nullable error)=void;
    TWTRLoadTweetCompletion=Pointer;
	{*
	 *  Completion block called when the load Tweets request succeeds or fails.
	 *
	 *  @param tweets Tweets that were successfully retrieved.
	 *  @param error  Error that will be set if the API request failed.
	 }
//	(^TWTRLoadTweetsCompletion)(NSArray<TWTRTweet *> *_Nullable tweets, NSError *_Nullable error)=void;
    TWTRLoadTweetsCompletion=Pointer;
	{*
	 *  Completion block called when the network request succeeds or fails.
	 *
	 *  @param response        Metadata associated with the response to a URL load request.
	 *  @param data            Content data of the response.
	 *  @param connectionError Error object describing the network error that occurred.
	 }
//	(^TWTRNetworkCompletion)(NSURLResponse *_Nullable response, NSData *_Nullable data, NSError *_Nullable connectionError)=void;
    TWTRNetworkCompletion=Pointer;
	{*
	 *  Completion block called when a JSON request to the Twitter API succeeds or fails.
	 *
	 *  @param response       Metadata associated with the response to a URL load request.
	 *  @param responseObject Content data of the response.
	 *  @param error          Error object describing the network error that occurred.
	 }
//	(^TWTRJSONRequestCompletion)(NSURLResponse *_Nullable response, id _Nullable responseObject, NSError *_Nullable error)=void;
    TWTRJSONRequestCompletion=Pointer;
	{*
	 *  Completion block called when a Tweet action (favorite/retweet) is performed.
	 *
	 *  @param tweet    The Tweet object representing the new state of this Tweet from
	 *                  the perspective of the currently-logged in user.
	 *  @param error    Error object describing the error that occurred. This will be either a
	 *                  network error or an NSError with an errorCode corresponding to
	 *                  TWTRAPIErrorCodeAlreadyFavorited or TWTRAPIErrorCodeAlreadyRetweeted
	 *                  for an attempted action that has already been taken from the servers
	 *                  point of view for this logged-in user.
	 }
//	(^TWTRTweetActionCompletion)(TWTRTweet *_Nullable tweet, NSError *_Nullable error)=void;
    TWTRTweetActionCompletion=Pointer;
	{*
	 *  Completion block called when a media upload request to the Twitter API succeeds or fails.
	 *
	 *  @param mediaID The media ID of the object that was uploaded which can be used when tweeting.
	 *  @param error   Error object describing the network error that occurred.
	 }
//	(^TWTRMediaUploadResponseCompletion)(NSString *_Nullable mediaID, NSError *_Nullable error)=void;
    TWTRMediaUploadResponseCompletion=Pointer;
	{*
	 *  Completion block called when the send Tweet request succeeds or fails.
	 *
	 *  @param tweet The Twitter Tweet created.
	 *  @param error Error that will be set if the API request failed.
	 }
//	(^TWTRSendTweetCompletion)(TWTRTweet *_Nullable tweet, NSError *_Nullable error)=void;
    TWTRSendTweetCompletion=Pointer;
	{*
	 *  Completion block called when a request for the user's email succeeds or fails.
	 *
	 *  @param email The email of the user
	 *  @param error Error object describing the error that occurred.
	 }
//	(^TWTRRequestEmailCompletion)(NSString *_Nullable email, NSError *_Nullable error)=void;
    TWTRRequestEmailCompletion=Pointer;
	{*
	 *  Client for consuming the Twitter REST API. Provides methods for common API requests, as well as the ability to create and send custom requests.
	 }
	TWTRAPIClient=interface(NSObject)//
	['{D2A301BB-643E-4204-A64E-3E6A721C2F1E}']
		
		{*
		 *  The Twitter user ID this client is making API requests on behalf of or
		 *  nil if it is a guest user.
		 }
		function userID:NSString{*};cdecl;
		procedure setUserID(userID:NSString{*});cdecl;
		
		{*
		 *  Constructs a `TWTRAPIClient` object to perform authenticated API requests with user authentication.
		 *
		 *  @param userID (optional) ID of the user to make requests on behalf of. If the ID is nil requests will be made using guest authentication.
		 *
		 *  @return Fully initialized API client to make authenticated requests against the Twitter REST API.
		 }
		{-} function initWithUserID(userID:{nullable} NSString{*}):TWTRAPIClient;cdecl;
		
		{*
		 *  Constructs a `TWTRAPIClient` with the last logged-in user. If no user has been
		 *  logged in yet this falls back to Guest authentication.
		 *
		 *  @return Fully initialized API client to make Guest or User authenticated requests to the Twitter REST API.
		 }
		
		{*
		 *  @name Making Requests
		 }
		
		{*
		 *  Returns a signed URL request.
		 *
		 *  @param method     Request method, GET, POST, PUT, DELETE, etc.
		 *  @param URLString  Request URL. This is the full Twitter API URL. E.g. https://api.twitter.com/1.1/statuses/user_timeline.json
		 *  @param parameters Request parameters.
		 *  @param error      Error that will be set if there was an error signing the request.
		 *
		 *  @note If the request is not sent with the -[TWTRAPIClient sendTwitterRequest:completion:] method it is the developers responsibility to ensure that there is a valid guest session before this method is called.
		 }
		[MethodName('URLRequestWithMethod:URL:parameters:error:')]
		{-} function URLRequestWithMethodURLparameterserror(method:NSString{*};URLString:NSString{*};parameters:{nullable} NSDictionary{*};error:NSError {*}{*}):NSURLRequest{*};cdecl;
		
		{*
		 *  Sends a Twitter request.
		 *
		 *  @param request    The request that will be sent asynchronously.
		 *  @param completion Completion block to be called on response. Called on main queue.
		 *  @return an NSProgress object which can be used to cancel the request.
		 }
//		[MethodName('sendTwitterRequest:completion:')]
//		{-} function sendTwitterRequestcompletion(request:NSURLRequest{*};completion:TWTRNetworkCompletion):NSProgress{*};cdecl;

		{*
		 *  @name Common API Actions
		 }
		
		{*
		 *  Loads a Twitter User.
		 *
		 *  @param userID       (required) The Twitter user ID of the desired user.
		 *  @param completion   Completion block to be called on response. Called on main queue.
		 }
		[MethodName('loadUserWithID:completion:')]
		{-} procedure loadUserWithIDcompletion(userID:NSString{*};completion:TWTRLoadUserCompletion);cdecl;
		
		{*
		 *  Loads a single Tweet from the network or cache.
		 *
		 *  @param tweetID      (required) The ID of the desired Tweet.
		 *  @param completion   Completion bock to be called on response. Called on main queue.
		 }
		[MethodName('loadTweetWithID:completion:')]
		{-} procedure loadTweetWithIDcompletion(tweetID:NSString{*};completion:TWTRLoadTweetCompletion);cdecl;
		
		{*
		 *  Loads a series of Tweets in a batch. The completion block will be passed an array of zero or more
		 *  Tweets that loaded successfully. If some Tweets fail to load the array will contain less Tweets than
		 *  number of requested IDs. If any Tweets fail to load, the IDs of the Tweets that did not load will
		 *  be provided in the userInfo dictionary property of the error parameter under `TWTRTweetsNotLoadedKey`.
		 *
		 *  @param tweetIDStrings (required) An array of Tweet IDs.
		 *  @param completion     Completion block to be called on response. Called on main queue.
		 }
		[MethodName('loadTweetsWithIDs:completion:')]
		{-} procedure loadTweetsWithIDscompletion(tweetIDStrings:NSArray{*};completion:TWTRLoadTweetsCompletion);cdecl;
		
		{*
		 *  Uploads media to the media server. Returns a media ID to be used when tweeting.
		 *
		 *  @param media       The media to upload
		 *  @param contentType The HTTP content type of the media that you are uploading.
		 *  @param completion  The completion handler to invoke.
		 }
		[MethodName('uploadMedia:contentType:completion:')]
		{-} procedure uploadMediacontentTypecompletion(media:NSData{*};contentType:NSString{*};completion:TWTRMediaUploadResponseCompletion);cdecl;
		
		{*
		 *  Create and send a Tweet.
		 *
		 *  @param tweetText    (required) The text for a Tweet
		 *  @param completion   Completion block to be called on response. Called on main queue.
		 }
		[MethodName('sendTweetWithText:completion:')]
		{-} procedure sendTweetWithTextcompletion(tweetText:NSString{*};completion:TWTRSendTweetCompletion);cdecl;
		
		{*
		 *  Upload media and create a Tweet. Returns TWTRTweet to be used when debugging.
		 *
		 *  @param tweetText   The text for a Tweet
		 *  @param image       UIImage to upload
		 *  @param completion  The completion handler to invoke.
		 }
		[MethodName('sendTweetWithText:image:completion:')]
		{-} procedure sendTweetWithTextimagecompletion(tweetText:NSString{*};image:UIImage{*};completion:TWTRSendTweetCompletion);cdecl;
		
		{*
		 *  Create a Tweet with a video. Returns TWTRTweet to be used when debugging.
		 *
		 *  Note: there are several requirements of the video being uploaded:
		 *  - Duration should be between 0.5 seconds and 30 seconds
		 *  - File size should not exceed 15 mb
		 *  - Dimensions should be between 32x32 and 1280x1024
		 *  - Aspect ratio should be between 1:3 and 3:1
		 *  - Frame rate should be 40fps or less
		 *
		 *  @param tweetText   The text for a Tweet
		 *  @param videoData   The video to be uploaded. Please follow guideline https://dev.twitter.com/rest/media/uploading-media
		 *  @param completion  The completion handler to invoke.
		 }
		[MethodName('sendTweetWithText:videoData:completion:')]
		{-} procedure sendTweetWithTextvideoDatacompletion(tweetText:NSString{*};videoData:NSData{*};completion:TWTRSendTweetCompletion);cdecl;
		
		{*
		 *  Requests the email for the user id which the API client was instantiated with.
		 *  This method requires that you are using an API Client which was instantiated with
		 *  a logged in user otherwise you will receive a "Request failed: forbidden (403)" error.
		 *
		 *  @param completion A completion block to invoke when the request completes. The email address may
		 *                    be a nil if the user does not have an email address, the email address
		 *                    is unverified or you do not have the correct permissions to request the email address.
		 *
		 *  @note Requesting a user¡¯s email address requires your application to be whitelisted by Twitter.
		 *  To request access, please visit https://support.twitter.com/forms/platform
		 }
		{-} procedure requestEmailForCurrentUser(completion:TWTRRequestEmailCompletion);cdecl;
		
	end;
	
	TWTRAPIClientClass=interface(NSObjectClass)//
	['{A587F085-2B74-4ADE-ADB6-E119A87E8926}']
		{+} function clientWithCurrentUser:TWTRAPIClient;cdecl;
	end;
	
	TTWTRAPIClient=class(TOCGenericImport<TWTRAPIClientClass,TWTRAPIClient>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

