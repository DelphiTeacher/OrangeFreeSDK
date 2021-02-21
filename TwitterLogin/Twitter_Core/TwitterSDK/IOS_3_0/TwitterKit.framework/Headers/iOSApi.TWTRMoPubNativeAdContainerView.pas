//
//  TWTRMoPubNativeAdContainerView.h
//  TwitterKit
//
//  Copyright ? 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRMoPubNativeAdContainerView;

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
	 *  A default combination of colors for the native ads.
	 }
	TWTRNativeAdTheme_=(
	//(NSUInteger, TWTRNativeAdTheme) {
	//    /**
	//     *  Official light theme.
	//     */
	    TWTRNativeAdThemeLight,
	//    /**
	//     *  Official dark theme.
	//     */
	    TWTRNativeAdThemeDark
	);
	TWTRNativeAdTheme=Integer;
	
	{*
	 *  The ad view rendered using MoPub. This class is not intended for public use other than to configure
	 *  color options. Colors can be configured by setting the theme and further customized by tweaking
	 *  the individual color options.
	 *
	 *  ## UIAppearance
	 *
	 *  You may use UIAppearance proxy objects to style certain aspects of the
	 *  the ad view to match your application's design.
	
	 *  // Setting a theme
	 *  [TWTRMoPubNativeAdContainerView appearance].theme = TWTRNativeAdThemeDark;
	 *
	 *  // Overriding colors of certain properties
	 *  [TWTRMoPubNativeAdContainerView appearance].primaryTextColor = [UIColor yellowColor];
	 *
	 *  @note You can't change the theme through an appearance proxy after the
	 *  view has already been added to the view hierarchy.
	 }
	TWTRMoPubNativeAdContainerView=interface(UIView)//<UIAppearanceContainer>
	['{2892A755-43EA-4F15-BCFA-A2F601BBE801}']
		
		{*
		 *  Setting the theme of ad views. This is the base template that can
		 *  be overridden by setting your custom colors for the available view
		 *  properties. Default is `TWTRNativeAdThemeLight`.
		 }
		function theme:TWTRNativeAdTheme;cdecl;
		procedure setTheme(theme:TWTRNativeAdTheme);cdecl;
		
		{*
		 *  Background color of this ad container view. Defaults to #F5F8FA.
		 }
		function backgroundColor:UIColor{*};cdecl;
		procedure setBackgroundColor(backgroundColor:UIColor{*});cdecl;
		
		{*
		 *  Background color of the ad within the container. Defaults to #FFFFFF.
		 }
		function adBackgroundColor:UIColor{*};cdecl;
		procedure setAdBackgroundColor(adBackgroundColor:UIColor{*});cdecl;
		
		{*
		 *  Primary text color used within the ad cell including the underlying ad. Defaults to #292F33.
		 }
		function primaryTextColor:UIColor{*};cdecl;
		procedure setPrimaryTextColor(primaryTextColor:UIColor{*});cdecl;
		
		{*
		 *  Background color of buttons. Defaults to #174791.
		 }
		function buttonBackgroundColor:UIColor{*};cdecl;
		procedure setButtonBackgroundColor(buttonBackgroundColor:UIColor{*});cdecl;
		
	end;
	
	TWTRMoPubNativeAdContainerViewClass=interface(UIViewClass)//<UIAppearanceContainer>
	['{3854BE0E-8964-453A-A630-8D99DFDAF52C}']
	end;
	
	TTWTRMoPubNativeAdContainerView=class(TOCGenericImport<TWTRMoPubNativeAdContainerViewClass,TWTRMoPubNativeAdContainerView>)
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

