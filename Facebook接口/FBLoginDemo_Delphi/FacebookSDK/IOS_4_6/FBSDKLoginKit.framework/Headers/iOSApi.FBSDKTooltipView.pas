// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

unit iOSApi.FBSDKTooltipView;

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
	 FBSDKTooltipViewArrowDirection enum
	
	  Passed on construction to determine arrow orientation.
	 }
	FBSDKTooltipViewArrowDirection_=(
	//(NSUInteger, FBSDKTooltipViewArrowDirection)
	//  /** View is located above given point, arrow is pointing down. */
	//  FBSDKTooltipViewArrowDirectionDown = 0,
	//  /** View is located below given point, arrow is pointing up. */
	  FBSDKTooltipViewArrowDirectionUp = 1//,
	);
	FBSDKTooltipViewArrowDirection=Integer;
	
	{*
	 FBSDKTooltipColorStyle enum
	
	  Passed on construction to determine color styling.
	 }
	FBSDKTooltipColorStyle_=(
	//(NSUInteger, FBSDKTooltipColorStyle)
	//  /** Light blue background, white text, faded blue close button. */
	//  FBSDKTooltipColorStyleFriendlyBlue = 0,
	//  /** Dark gray background, white text, light gray close button. */
	  FBSDKTooltipColorStyleNeutralGray = 1//,
	);
	FBSDKTooltipColorStyle=Integer;
	
	{*
	
	  Tooltip bubble with text in it used to display tips for UI elements,
	 with a pointed arrow (to refer to the UI element).
	
	
	
	 The tooltip fades in and will automatically fade out. See `displayDuration`.
	 }
	FBSDKTooltipView=interface(UIView)//
	['{59C39248-DEDA-478C-94F0-7A656F8AC6E6}']
		
		{*
		  Gets or sets the amount of time in seconds the tooltip should be displayed.
		 Set this to zero to make the display permanent until explicitly dismissed.
		 Defaults to six seconds.
		 }
		function displayDuration:CFTimeInterval;cdecl;
		procedure setDisplayDuration(displayDuration:CFTimeInterval);cdecl;
		
		{*
		  Gets or sets the color style after initialization.
		 Defaults to value passed to -initWithTagline:message:colorStyle:.
		 }
		function colorStyle:FBSDKTooltipColorStyle;cdecl;
		procedure setColorStyle(colorStyle:FBSDKTooltipColorStyle);cdecl;
		
		{*
		  Gets or sets the message.
		 }
		[MethodName('message:')]
		function _message:NSString{*};cdecl;
		procedure setMessage(_message:NSString{*});cdecl;
		
		{*
		  Gets or sets the optional phrase that comprises the first part of the label (and is highlighted differently).
		 }
		function tagline:NSString{*};cdecl;
		procedure setTagline(tagline:NSString{*});cdecl;
		
		{*
		  Designated initializer.
		
		 - Parameter tagline: First part of the label, that will be highlighted with different color. Can be nil.
		
		 - Parameter message: Main message to display.
		
		 - Parameter colorStyle: Color style to use for tooltip.
		
		
		
		 If you need to show a tooltip for login, consider using the `FBSDKLoginTooltipView` view.
		
		
		- See:FBSDKLoginTooltipView
		 }
		[MethodName('initWithTagline:message:colorStyle:')]
		{-} function initWithTaglinemessagecolorStyle(tagline:NSString{*};_message:NSString{*};colorStyle:FBSDKTooltipColorStyle):FBSDKTooltipView;cdecl;
		
		{*
		  Show tooltip at the top or at the bottom of given view.
		 Tooltip will be added to anchorView.window.rootViewController.view
		
		 - Parameter anchorView: view to show at, must be already added to window view hierarchy, in order to decide
		 where tooltip will be shown. (If there's not enough space at the top of the anchorView in window bounds -
		 tooltip will be shown at the bottom of it)
		
		
		
		 Use this method to present the tooltip with automatic positioning or
		 use -presentInView:withArrowPosition:direction: for manual positioning
		 If anchorView is nil or has no window - this method does nothing.
		 }
		{-} procedure presentFromView(anchorView:UIView{*});cdecl;
		
		{*
		  Adds tooltip to given view, with given position and arrow direction.
		
		 - Parameter view: View to be used as superview.
		
		 - Parameter arrowPosition: Point in view's cordinates, where arrow will be pointing
		
		 - Parameter arrowDirection: whenever arrow should be pointing up (message bubble is below the arrow) or
		 down (message bubble is above the arrow).
		 }
		[MethodName('presentInView:withArrowPosition:direction:')]
		{-} procedure presentInViewwithArrowPositiondirection(view:UIView{*};arrowPosition:CGPoint;arrowDirection:FBSDKTooltipViewArrowDirection);cdecl;
		
		{*
		  Remove tooltip manually.
		
		
		
		 Calling this method isn't necessary - tooltip will dismiss itself automatically after the `displayDuration`.
		 }
		{-} procedure dismiss;cdecl;
		
	end;
	
	FBSDKTooltipViewClass=interface(UIViewClass)//
	['{30D2DD71-F96B-4951-9D3E-F4A67C625367}']
	end;
	
	TFBSDKTooltipView=class(TOCGenericImport<FBSDKTooltipViewClass,FBSDKTooltipView>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

