//
//  TWTRTweetViewDelegate.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRTweetViewDelegate;

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

	
	
	
	
	
	//@protocol TWTRSessionStore;
	
	
	
	(^TWTRAuthenticationCompletionHandler)(id<TWTRSessionStore> sessionStore, NSString *userID)=void;
	
	{*
	 Delegate for `TWTRTweetView` to receive updates on the user interacting with this particular Tweet view.
	
	    // Create the tweet view
	    TWTRTweetView *tweetView = [[TWTRTweetView alloc] initWithTweet:tweet];
	    // Set the delegate
	    tweetView.delegate = self;
	 }
	TWTRTweetViewDelegate=interface(IObjectiveC)
		['{99905D38-E40B-4533-BEE5-F102A38F8CDC}']
		
		//@optional
		
		{*
		 *  The tweet view image was tapped.
		 *
		 *  @param tweetView The Tweet view that was tapped.
		 *  @param image     The exact UIImage data shown by the Tweet view.
		 *  @param imageURL  The full URL of the image being shown.
		 }
		[MethodName('tweetView:didTapImage:withURL:')]
		{-} procedure tweetViewdidTapImagewithURL(tweetView:TWTRTweetView{*};image:UIImage{*};imageURL:NSURL{*});cdecl;
		
		{*
		 * The Tweet view video was tapped.
		 * If this method is not implemented a video player will be presented.
		 *
		 *  @param tweetView The Tweet view that was tapped.
		 *  @param videoURL  The full URL of the video being shown.
		 }
		[MethodName('tweetView:didTapVideoWithURL:')]
		{-} procedure tweetViewdidTapVideoWithURL(tweetView:TWTRTweetView{*};videoURL:NSURL{*});cdecl;
		
		{*
		 *  A URL in the text of a tweet was tapped. Implement to show your own webview rather than opening Safari.
		 *
		 *  @param tweetView The Tweet view that was tapped.
		 *  @param url       The URL that was tapped.
		 }
		[MethodName('tweetView:didTapURL:')]
		{-} procedure tweetViewdidTapURL(tweetView:TWTRTweetView{*};url:NSURL{*});cdecl;
		
		{*
		 *  Called when the user's profile image is tapped.
		 *  If this method is not implemented, the default behavior is to deep link into Twitter application or twitter.com in a webview.
		 *
		 *  @param tweetView The Tweet view that was tapped.
		 *  @param user The Twitter user.
		 }
		[MethodName('tweetView:didTapProfileImageForUser:')]
		{-} procedure tweetViewdidTapProfileImageForUser(tweetView:TWTRTweetView{*};user:TWTRUser{*});cdecl;
		
		{*
		 *  Called when the Tweet is tapped.
		 *  If this method is not implemented, the default behavior is to deep link into Twitter application or twitter.com in a webview.
		 *
		 *  @param tweetView The Tweet view that was tapped.
		 *  @param tweet The Tweet that user tapped.
		 }
		[MethodName('tweetView:didTapTweet:')]
		{-} procedure tweetViewdidTapTweet(tweetView:TWTRTweetView{*};tweet:TWTRTweet{*});cdecl;
		
	end;
	
	TOntweetViewdidTapImagewithURL=procedure(tweetView:TWTRTweetView{*};image:UIImage{*};imageURL:NSURL{*}) of object;
	TOntweetViewdidTapVideoWithURL=procedure(tweetView:TWTRTweetView{*};videoURL:NSURL{*}) of object;
	TOntweetViewdidTapURL=procedure(tweetView:TWTRTweetView{*};url:NSURL{*}) of object;
	TOntweetViewdidTapProfileImageForUser=procedure(tweetView:TWTRTweetView{*};user:TWTRUser{*}) of object;
	TOntweetViewdidTapTweet=procedure(tweetView:TWTRTweetView{*};tweet:TWTRTweet{*}) of object;
	
	TTWTRTweetViewDelegate=class(TOCLocal,TWTRTweetViewDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OntweetViewdidTapImagewithURL:TOntweetViewdidTapImagewithURL;
		OntweetViewdidTapVideoWithURL:TOntweetViewdidTapVideoWithURL;
		OntweetViewdidTapURL:TOntweetViewdidTapURL;
		OntweetViewdidTapProfileImageForUser:TOntweetViewdidTapProfileImageForUser;
		OntweetViewdidTapTweet:TOntweetViewdidTapTweet;
	
		
		//@optional
		
		{*
		 *  The tweet view image was tapped.
		 *
		 *  @param tweetView The Tweet view that was tapped.
		 *  @param image     The exact UIImage data shown by the Tweet view.
		 *  @param imageURL  The full URL of the image being shown.
		 }
		[MethodName('tweetView:didTapImage:withURL:')]
		{-} procedure tweetViewdidTapImagewithURL(tweetView:TWTRTweetView{*};image:UIImage{*};imageURL:NSURL{*});cdecl;
		
		{*
		 * The Tweet view video was tapped.
		 * If this method is not implemented a video player will be presented.
		 *
		 *  @param tweetView The Tweet view that was tapped.
		 *  @param videoURL  The full URL of the video being shown.
		 }
		[MethodName('tweetView:didTapVideoWithURL:')]
		{-} procedure tweetViewdidTapVideoWithURL(tweetView:TWTRTweetView{*};videoURL:NSURL{*});cdecl;
		
		{*
		 *  A URL in the text of a tweet was tapped. Implement to show your own webview rather than opening Safari.
		 *
		 *  @param tweetView The Tweet view that was tapped.
		 *  @param url       The URL that was tapped.
		 }
		[MethodName('tweetView:didTapURL:')]
		{-} procedure tweetViewdidTapURL(tweetView:TWTRTweetView{*};url:NSURL{*});cdecl;
		
		{*
		 *  Called when the user's profile image is tapped.
		 *  If this method is not implemented, the default behavior is to deep link into Twitter application or twitter.com in a webview.
		 *
		 *  @param tweetView The Tweet view that was tapped.
		 *  @param user The Twitter user.
		 }
		[MethodName('tweetView:didTapProfileImageForUser:')]
		{-} procedure tweetViewdidTapProfileImageForUser(tweetView:TWTRTweetView{*};user:TWTRUser{*});cdecl;
		
		{*
		 *  Called when the Tweet is tapped.
		 *  If this method is not implemented, the default behavior is to deep link into Twitter application or twitter.com in a webview.
		 *
		 *  @param tweetView The Tweet view that was tapped.
		 *  @param tweet The Tweet that user tapped.
		 }
		[MethodName('tweetView:didTapTweet:')]
		{-} procedure tweetViewdidTapTweet(tweetView:TWTRTweetView{*};tweet:TWTRTweet{*});cdecl;
		
	end;
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TTWTRTweetViewDelegate }

constructor TTWTRTweetViewDelegate.Create;
begin
	Inherited Create;
end;

destructor TTWTRTweetViewDelegate.Destroy;
begin
	Inherited;
end;

procedure  TTWTRTweetViewDelegate.tweetViewdidTapImagewithURL(tweetView:TWTRTweetView{*};image:UIImage{*};imageURL:NSURL{*});
begin
	if Assigned(OntweetViewdidTapImagewithURL) then
	begin
		OntweetViewdidTapImagewithURL(tweetView,image,imageURL);
	end;
end;

procedure  TTWTRTweetViewDelegate.tweetViewdidTapVideoWithURL(tweetView:TWTRTweetView{*};videoURL:NSURL{*});
begin
	if Assigned(OntweetViewdidTapVideoWithURL) then
	begin
		OntweetViewdidTapVideoWithURL(tweetView,videoURL);
	end;
end;

procedure  TTWTRTweetViewDelegate.tweetViewdidTapURL(tweetView:TWTRTweetView{*};url:NSURL{*});
begin
	if Assigned(OntweetViewdidTapURL) then
	begin
		OntweetViewdidTapURL(tweetView,url);
	end;
end;

procedure  TTWTRTweetViewDelegate.tweetViewdidTapProfileImageForUser(tweetView:TWTRTweetView{*};user:TWTRUser{*});
begin
	if Assigned(OntweetViewdidTapProfileImageForUser) then
	begin
		OntweetViewdidTapProfileImageForUser(tweetView,user);
	end;
end;

procedure  TTWTRTweetViewDelegate.tweetViewdidTapTweet(tweetView:TWTRTweetView{*};tweet:TWTRTweet{*});
begin
	if Assigned(OntweetViewdidTapTweet) then
	begin
		OntweetViewdidTapTweet(tweetView,tweet);
	end;
end;



{$ENDIF}

end.

