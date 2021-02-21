//
//  TWTRTweetView.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TWTRTweetView;

interface

{$IFDEF IOS}
uses
	iOSapi.UIKit,
	iOSApi.TWTRTweetViewDelegate,
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
	 *  The style for Tweet views.
	 }
	TWTRTweetViewStyle_=(
	//(NSUInteger, TWTRTweetViewStyle) {
	//    /**
	//     *  A full-size Tweet view. Displays images if present.
	//     */
	    TWTRTweetViewStyleRegular,
	//    /**
	//     *  A small Tweet view, primarily designed to be used in table views.
	//     */
	    TWTRTweetViewStyleCompact
	);
	TWTRTweetViewStyle=Integer;
	
	{*
	 *  A default combination of colors for Tweet views.
	 }
	TWTRTweetViewTheme_=(
	//(NSUInteger, TWTRTweetViewTheme) {
	//    /**
	//     *  Official light theme.
	//     */
	    TWTRTweetViewThemeLight,
	//    /**
	//     *  Official dark theme.
	//     */
	    TWTRTweetViewThemeDark//,
	);
	TWTRTweetViewTheme=Integer;
	
	{*
	 `TWTRTweetView` displays a single Tweet to the user. It handles background taps and other actions displayed to the user.
	
	    TWTRAPIClient *APIClient = [[TWTRAPIClient alloc] init];
	    [[APIClient loadTweetWithID:@"20" completion:^(TWTRTweet *tweet, NSError *error) {
	        if (tweet) {
	            TWTRTweetView *tweetView = [[TWTRTweetView alloc] initWithTweet:tweet];
	            [self.view addSubview:tweetView];
	        } else {
	            NSLog(@"Error loading Tweet: %@", [error localizedDescription]);
	        }
	    }];
	
	 ## Interaction
	
	 The `TWTRTweetViewDelegate` is notified:
	
	   - When the background is tapped.
	   - When a link is selected.
	   - When the share button is tapped.
	   - When the share action completes.
	   - When the favorite action completes.
	
	 ## Usage in UITableView
	
	 To allow for usage in a `UITableView`, the `configureWithTweet:` method allows configuration of an existing `TWTRTweetView` without having to create a new instance.
	
	 ## Sizing
	
	 When using Auto Layout, feel free to set a width or margin on the Tweet view. The height will be calculated automatically. For old-fashioned frame based layout you may use the standard `sizeThatFits:` method to calculate the appropriate height for a given width:
	
	    // Find the height for a given width (20pts on either side)
	    CGFloat desiredHeight = [tweetView sizeThatFits:CGSizeMake(self.view.frame.size.width - 40, CGFLOAT_MAX)].height;
	
	 ## UIAppearance
	
	 You may use UIAppearance proxy objects to style certain aspects of Tweet views before those views are added to the view hierarchy.
	
	     // Using UIAppearance Proxy
	     [TWTRTweetView appearance].theme = TWTRTweetViewThemeDark;
	
	     // Setting colors directly
	     [TWTRTweetView appearance].primaryTextColor = [UIColor yellowColor];
	     [TWTRTweetView appearance].backgroundColor = [UIColor blueColor];
	
	     // Setting action button visibility
	     [TWTRTweetView appearance].showActionButtons = NO;
	
	 _Note:_ You can't change the theme through an appearance proxy after the view has already been added to the view hierarchy. Direct `theme` property access will work though.
	 }
	TWTRTweetView=interface(UIView)//<UIAppearanceContainer>
	['{791E0ACE-6D5D-403F-82D7-B34FC15EEE35}']
		
		{*
		 *  The Tweet being displayed.
		 }
		function tweet:TWTRTweet{*};cdecl;
		procedure setTweet(tweet:TWTRTweet{*});cdecl;
		
		{*
		 *  Background color of the Tweet view and all text labels (fullname, username, Tweet text, timestamp).
		 }
		function backgroundColor:UIColor{*};cdecl;
		procedure setBackgroundColor(backgroundColor:UIColor{*});cdecl;
		
		{*
		 *  Color of Tweet text and full name.
		 }
		function primaryTextColor:UIColor{*};cdecl;
		procedure setPrimaryTextColor(primaryTextColor:UIColor{*});cdecl;
		
		{*
		 *  Color of links in Tweet text.
		 }
		function linkTextColor:UIColor{*};cdecl;
		procedure setLinkTextColor(linkTextColor:UIColor{*});cdecl;
		
		{*
		 *  Set whether the border should be shown.
		 *  Defaults to YES.
		 }
		function showBorder:Boolean;cdecl;
		procedure setShowBorder(showBorder:Boolean);cdecl;
		
		{*
		 *  Set whether the action buttons (Favorite, Share) should be shown. When toggled,
		 *  both the visibility of the action buttons and the internal constraints are
		 *  updated immediately. The layout will be updated the next layout pass that occurs.
		 *
		 *  Defaults to NO.
		 }
		function showActionButtons:Boolean;cdecl;
		procedure setShowActionButtons(showActionButtons:Boolean);cdecl;
		
		{*
		 *  Setting the theme of the Tweet view will change the color properties accordingly.
		 *
		 *  Set to `TWTRTweetViewThemeLight` by default.
		 }
		function theme:TWTRTweetViewTheme;cdecl;
		procedure setTheme(theme:TWTRTweetViewTheme);cdecl;
		
		{*
		 *  The style of the Tweet. i.e. `TWTRTweetViewStyleRegular` or `TWTRTweetViewStyleCompact`.
		 }
		function style:TWTRTweetViewStyle;cdecl;
		procedure setStyle(style:TWTRTweetViewStyle);cdecl;
		
		{*
		 *  Optional delegate to receive notifications when certain actions happen
		 }
		function id<TWTRTweetViewDelegate>:IBOutlet;cdecl;
		procedure setId<TWTRTweetViewDelegate>(id<TWTRTweetViewDelegate>:IBOutlet);cdecl;
		
		{*
		 *  Optional property to set a UIViewController from which to present various new UI
		 *  e.g. when presenting a Share sheet, presenting a login view controller for actions, etc
		 }
		function presenterViewController:UIViewController{*};cdecl;
		procedure setPresenterViewController(presenterViewController:UIViewController{*});cdecl;
		
		{*
		 *  Convenience initializer to configure a compact style Tweet view.
		 *
		 *  @param tweet The Tweet to display.
		 *
		 *  @return The fully-configured Tweet view.
		 }
		{-} function initWithTweet(tweet:{nullable} TWTRTweet{*}):TWTRTweetView;cdecl;
		
		{*
		 *  Designated initializer. Initializes view with both Tweet and style.
		 *
		 *  @param tweet The Tweet to display.
		 *  @param style The style of the Tweet view (regular or compact).
		 *
		 *  @return The fully configured Tweet view.
		 }
		[MethodName('initWithTweet:style:')]
		{-} function initWithTweetstyle(tweet:{nullable} TWTRTweet{*};style:TWTRTweetViewStyle):TWTRTweetView;cdecl;
		
		{*
		 * Initialization with a frame parameter is not supported.
		 }
		{-} function initWithFrame(frame:CGRect):TWTRTweetView;cdecl;
		
		{*
		  Find the size that fits into a desired space. This is a system method on UIView but implemented on `TWTRTweetView`
		
		    // Calculate the desired height at 280 points wide
		    CGSize desiredSize = [tweetView sizeThatFits:CGSizeMake(280, CGFLOAT_MAX)];
		
		
		   @param size The space available. Should generally leave one orientation unconstrained, and the minimum width supported is 200pts.
		
		   @return The size that will fit into the space available.
		 }
		{-} function sizeThatFits(size:CGSize):CGSize;cdecl;
		
		{*
		 *  Update all images and label text to fully represent the given Tweet.
		 *
		 *  @param tweet The Tweet to display.
		 }
		{-} procedure configureWithTweet(tweet:{nullable} TWTRTweet{*});cdecl;
		
	end;
	
	TWTRTweetViewClass=interface(UIViewClass)//<UIAppearanceContainer>
	['{2953AD69-09E1-4A94-8160-F1A492245A69}']
	end;
	
	TTWTRTweetView=class(TOCGenericImport<TWTRTweetViewClass,TWTRTweetView>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

