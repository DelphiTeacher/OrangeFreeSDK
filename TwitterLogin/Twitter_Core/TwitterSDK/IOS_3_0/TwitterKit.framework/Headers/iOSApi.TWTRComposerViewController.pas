//
//  TWTRComposerViewController.h
//  TwitterKit
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRComposerViewController;

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
	PTWTRComposerViewControllerDelegate=Pointer;//PTWTRComposerViewControllerDelegate=Pointer of TWTRComposerViewControllerDelegate; ILocalObject(TWTRComposerViewControllerDelegate).GetObjectID

	
	//@protocol TWTRComposerViewControllerDelegate;
	
	
	
	{*
	 *  Composer interface to allow users to compose & send Tweets from
	 *  inside an app.
	 *
	 *  It is the developers' responsibility to ensure that there exists a
	 *  logged in Twitter user before creating a `TWTRComposerViewController`.
	 *
	 *  See: https://dev.twitter.com/twitterkit/ios/compose-tweets#presenting-a-basic-composer
	 *
	 *  Initial Text
	 *  If you wish to add default mentions to the Tweet, add them to the
	 *  beginning of `initialText`.
	 *
	 *  If you wish to add default hashtags or links to the Tweet,
	 *  add them at the end of `initialText`.
	 }
	TWTRComposerViewController=interface(UIViewController)//
	['{39FE76F5-A471-4EE9-BFB3-49EE437EAF02}']
		
		{*
		 * The delegate for this composer view controller.
		 }
		function delegate:PTWTRComposerViewControllerDelegate{id<TWTRComposerViewControllerDelegate>};cdecl;
		procedure setDelegate(delegate:PTWTRComposerViewControllerDelegate{id<TWTRComposerViewControllerDelegate>});cdecl;
		
		{*
		 *  Create an empty composer view controller. The developer must handle ensuring
		 *  that a logged in Twitter user exists before creating this controller.
		 }
		
		{*
		 *  Initialize a composer with pre-filled text and an image or video attachment.
		 *  Requires a logged in Twitter user.
		 *
		 *  @param initialText (optional) Text with which to pre-fill the composer text.
		 *  @param image (optional) Image to add as an attachment.
		 *  @param videoURL (optional) Video URL to add as an attachment. Of the form of `assets-library`.
		 *
		 *  Note: Only one type of attachment (image or video) may be added.
		 }
		[MethodName('initWithInitialText:image:videoURL:')]
		{-} function initWithInitialTextimagevideoURL(initialText:{nullable} NSString{*};image:{nullable} UIImage{*};videoURL:{nullable} NSURL{*}):TWTRComposerViewController;cdecl;
		
		{-} function init NS_UNAVAILABLE:TWTRComposerViewController;cdecl;
		
	end;
	
	TWTRComposerViewControllerClass=interface(UIViewControllerClass)//
	['{006C7FCF-ECC0-4C47-A93F-902BD8039B81}']
		{+} function emptyComposer:TWTRComposerViewController;cdecl;
	end;
	
	TTWTRComposerViewController=class(TOCGenericImport<TWTRComposerViewControllerClass,TWTRComposerViewController>)
	end;
	
	TWTRComposerViewControllerDelegate=interface(IObjectiveC)
		['{D38EC772-1B1F-4287-A320-FEFF6D166955}']
		
		//@optional
		{*
		 * Called when the user taps the cancel button. This method will be called after the view controller is dismissed.
		 }
		{-} procedure composerDidCancel(controller:TWTRComposerViewController{*});cdecl;
		
		{*
		 * Called when the user successfully sends a Tweet. The resulting Tweet object is returned.
		 * This method is called after the view controller is dimsissed and the API response is
		 * received.
		 }
		[MethodName('composerDidSucceed:withTweet:')]
		{-} procedure composerDidSucceedwithTweet(controller:TWTRComposerViewController{*};tweet:TWTRTweet{*});cdecl;
		
		{*
		 * This method is called if the composer is not able to send the Tweet.
		 * The view controller will not be dismissed automatically if this method is called.
		 }
		[MethodName('composerDidFail:withError:')]
		{-} procedure composerDidFailwithError(controller:TWTRComposerViewController{*};error:NSError{*});cdecl;
		
	end;
	
	TOncomposerDidCancel=procedure(controller:TWTRComposerViewController{*}) of object;
	TOncomposerDidSucceedwithTweet=procedure(controller:TWTRComposerViewController{*};tweet:TWTRTweet{*}) of object;
	TOncomposerDidFailwithError=procedure(controller:TWTRComposerViewController{*};error:NSError{*}) of object;
	
	TTWTRComposerViewControllerDelegate=class(TOCLocal,TWTRComposerViewControllerDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OncomposerDidCancel:TOncomposerDidCancel;
		OncomposerDidSucceedwithTweet:TOncomposerDidSucceedwithTweet;
		OncomposerDidFailwithError:TOncomposerDidFailwithError;
	
		
		//@optional
		{*
		 * Called when the user taps the cancel button. This method will be called after the view controller is dismissed.
		 }
		{-} procedure composerDidCancel(controller:TWTRComposerViewController{*});cdecl;
		
		{*
		 * Called when the user successfully sends a Tweet. The resulting Tweet object is returned.
		 * This method is called after the view controller is dimsissed and the API response is
		 * received.
		 }
		[MethodName('composerDidSucceed:withTweet:')]
		{-} procedure composerDidSucceedwithTweet(controller:TWTRComposerViewController{*};tweet:TWTRTweet{*});cdecl;
		
		{*
		 * This method is called if the composer is not able to send the Tweet.
		 * The view controller will not be dismissed automatically if this method is called.
		 }
		[MethodName('composerDidFail:withError:')]
		{-} procedure composerDidFailwithError(controller:TWTRComposerViewController{*};error:NSError{*});cdecl;
		
	end;
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TTWTRComposerViewControllerDelegate }

constructor TTWTRComposerViewControllerDelegate.Create;
begin
	Inherited Create;
end;

destructor TTWTRComposerViewControllerDelegate.Destroy;
begin
	Inherited;
end;

procedure  TTWTRComposerViewControllerDelegate.composerDidCancel(controller:TWTRComposerViewController{*});
begin
	if Assigned(OncomposerDidCancel) then
	begin
		OncomposerDidCancel(controller);
	end;
end;

procedure  TTWTRComposerViewControllerDelegate.composerDidSucceedwithTweet(controller:TWTRComposerViewController{*};tweet:TWTRTweet{*});
begin
	if Assigned(OncomposerDidSucceedwithTweet) then
	begin
		OncomposerDidSucceedwithTweet(controller,tweet);
	end;
end;

procedure  TTWTRComposerViewControllerDelegate.composerDidFailwithError(controller:TWTRComposerViewController{*};error:NSError{*});
begin
	if Assigned(OncomposerDidFailwithError) then
	begin
		OncomposerDidFailwithError(controller,error);
	end;
end;



{$ENDIF}

end.

