//
//  TWTRComposer.h
//  TwitterKit
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRComposer;

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

	
	
	
	{*
	 *  Possible values for the <i>result</i> parameter of the completionHandler property.
	 }
	TWTRComposerResult_=(
	//(NSInteger, TWTRComposerResult) {
	//    /**
	//     *  The composer is dismissed without sending the Tweet (i.e. the user selects Cancel, or the account is unavailable).
	//     */
	    TWTRComposerResultCancelled,
	//    /**
	//     *  The composer is dismissed and the message is being sent in the background, after the user selects Done.
	//     */
	    TWTRComposerResultDone
	);
	TWTRComposerResult=Integer;
	
	{*
	 *  Completion block called when the user finishes composing a Tweet.
	 }
//	(^TWTRComposerCompletion)(TWTRComposerResult result)=void;
    TWTRComposerCompletion=Pointer;
	{*
	 *  The TWTRComposer class presents a view to the user to compose a Tweet.
	 }
	TWTRComposer=interface(NSObject)//
	['{9A9A8548-EB3D-4B09-BDA1-9A80C4787D26}']
		
		{*
		 *  Sets the initial text for the Tweet composition prior to showing it.
		 *
		 *  @param text The text to tweet.
		 *
		 *  @return This will return NO if the receiver has already been presented (and therefore cannot be changed).
		 }
		{-} function setText(text:{nullable} NSString{*}):Boolean;cdecl;
		
		{*
		 *  Sets an image attachment.
		 *
		 *  @param image The image to attach.
		 *
		 *  @return This will return NO if the receiver has already been presented (and therefore cannot be changed).
		 }
		{-} function setImage(image:{nullable} UIImage{*}):Boolean;cdecl;
		
		{*
		 *  Adds a URL to the contents of the Tweet message.
		 *
		 *  @param url The URL.
		 *
		 *  @return This will return NO if the receiver has already been presented (and therefore cannot be changed).
		 }
		{-} function setURL(url:{nullable} NSURL{*}):Boolean;cdecl;
		
		{*
		 * Presents the composer, with an optional completion handler from the specified view controller.
		 * @param fromController The controller in which to present the composer from.
		 * @param completion completion The completion handler, which has a single parameter indicating whether the user finished or cancelled the Tweet composition.
		 }
		[MethodName('showFromViewController:completion:')]
		{-} procedure showFromViewControllercompletion(fromController:UIViewController{*};completion:TWTRComposerCompletion);cdecl;
		
	end;
	
	TWTRComposerClass=interface(NSObjectClass)//
	['{6E6A380C-B87B-4054-93C8-C67FC784592A}']
	end;
	
	TTWTRComposer=class(TOCGenericImport<TWTRComposerClass,TWTRComposer>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

