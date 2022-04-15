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

unit iOSApi.FBSDKLoginTooltipView;

interface

{$IFDEF IOS}
uses
	iOSapi.UIKit,
	iOSapi.FBSDKTooltipView,
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
	PFBSDKLoginTooltipViewDelegate=Pointer;//PFBSDKLoginTooltipViewDelegate=Pointer of FBSDKLoginTooltipViewDelegate; ILocalObject(FBSDKLoginTooltipViewDelegate).GetObjectID

	
	
	//@protocol FBSDKLoginTooltipViewDelegate;
	
	{*
	
	  Represents a tooltip to be displayed next to a Facebook login button
	  to highlight features for new users.
	
	
	 The `FBSDKLoginButton` may display this view automatically. If you do
	  not use the `FBSDKLoginButton`, you can manually call one of the `present*` methods
	  as appropriate and customize behavior via `FBSDKLoginTooltipViewDelegate` delegate.
	
	  By default, the `FBSDKLoginTooltipView` is not added to the superview until it is
	  determined the app has migrated to the new login experience. You can override this
	  (e.g., to test the UI layout) by implementing the delegate or setting `forceDisplay` to YES.
	
	 }
	FBSDKLoginTooltipView=interface(FBSDKTooltipView)//
	['{1C40030F-CC45-43BA-AD7C-F713E74EF2F6}']
		
		{*  the delegate }
		function delegate:PFBSDKLoginTooltipViewDelegate{id<FBSDKLoginTooltipViewDelegate>};cdecl;
		procedure setDelegate(delegate:PFBSDKLoginTooltipViewDelegate{id<FBSDKLoginTooltipViewDelegate>});cdecl;
		
		{*  if set to YES, the view will always be displayed and the delegate's
		  `loginTooltipView:shouldAppear:` will NOT be called. }
		function forceDisplay:Boolean;cdecl;
		procedure setForceDisplay(forceDisplay:Boolean);cdecl;
		
	end;
	
	FBSDKLoginTooltipViewClass=interface(FBSDKTooltipViewClass)//
	['{0F8B014C-CFC8-4F6A-A84A-DBA5C9475CF7}']
	end;
	
	TFBSDKLoginTooltipView=class(TOCGenericImport<FBSDKLoginTooltipViewClass,FBSDKLoginTooltipView>)
	end;
	
	{*
	 @protocol
	
	  The `FBSDKLoginTooltipViewDelegate` protocol defines the methods used to receive event
	 notifications from `FBSDKLoginTooltipView` objects.
	 }
	FBSDKLoginTooltipViewDelegate=interface(IObjectiveC)
		['{CA0CBC3A-51D2-473A-B083-CA0152A73EF1}']
		
		//@optional
		
		{*
		  Asks the delegate if the tooltip view should appear
		
		 - Parameter view: The tooltip view.
		 - Parameter appIsEligible: The value fetched from the server identifying if the app
		 is eligible for the new login experience.
		
		
		 Use this method to customize display behavior.
		 }
		[MethodName('loginTooltipView:shouldAppear:')]
		{-} function loginTooltipViewshouldAppear(view:FBSDKLoginTooltipView{*};appIsEligible:Boolean):Boolean;cdecl;
		
		{*
		  Tells the delegate the tooltip view will appear, specifically after it's been
		 added to the super view but before the fade in animation.
		
		 - Parameter view: The tooltip view.
		 }
		{-} procedure loginTooltipViewWillAppear(view:FBSDKLoginTooltipView{*});cdecl;
		
		{*
		  Tells the delegate the tooltip view will not appear (i.e., was not
		 added to the super view).
		
		 - Parameter view: The tooltip view.
		 }
		{-} procedure loginTooltipViewWillNotAppear(view:FBSDKLoginTooltipView{*});cdecl;
		
		
	end;
	
	TOnloginTooltipViewshouldAppear=function(view:FBSDKLoginTooltipView{*};appIsEligible:Boolean):Boolean of object;
	TOnloginTooltipViewWillAppear=procedure(view:FBSDKLoginTooltipView{*}) of object;
	TOnloginTooltipViewWillNotAppear=procedure(view:FBSDKLoginTooltipView{*}) of object;
	
	TFBSDKLoginTooltipViewDelegate=class(TOCLocal,FBSDKLoginTooltipViewDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnloginTooltipViewshouldAppear:TOnloginTooltipViewshouldAppear;
		OnloginTooltipViewWillAppear:TOnloginTooltipViewWillAppear;
		OnloginTooltipViewWillNotAppear:TOnloginTooltipViewWillNotAppear;
	
		
		//@optional
		
		{*
		  Asks the delegate if the tooltip view should appear
		
		 - Parameter view: The tooltip view.
		 - Parameter appIsEligible: The value fetched from the server identifying if the app
		 is eligible for the new login experience.
		
		
		 Use this method to customize display behavior.
		 }
		[MethodName('loginTooltipView:shouldAppear:')]
		{-} function loginTooltipViewshouldAppear(view:FBSDKLoginTooltipView{*};appIsEligible:Boolean):Boolean;cdecl;
		
		{*
		  Tells the delegate the tooltip view will appear, specifically after it's been
		 added to the super view but before the fade in animation.
		
		 - Parameter view: The tooltip view.
		 }
		{-} procedure loginTooltipViewWillAppear(view:FBSDKLoginTooltipView{*});cdecl;
		
		{*
		  Tells the delegate the tooltip view will not appear (i.e., was not
		 added to the super view).
		
		 - Parameter view: The tooltip view.
		 }
		{-} procedure loginTooltipViewWillNotAppear(view:FBSDKLoginTooltipView{*});cdecl;
		
		
	end;
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TFBSDKLoginTooltipViewDelegate }

constructor TFBSDKLoginTooltipViewDelegate.Create;
begin
	Inherited Create;
end;

destructor TFBSDKLoginTooltipViewDelegate.Destroy;
begin
	Inherited;
end;

function  TFBSDKLoginTooltipViewDelegate.loginTooltipViewshouldAppear(view:FBSDKLoginTooltipView{*};appIsEligible:Boolean):Boolean;
begin
	if Assigned(OnloginTooltipViewshouldAppear) then
	begin
		Result:=OnloginTooltipViewshouldAppear(view,appIsEligible);
	end;
end;

procedure  TFBSDKLoginTooltipViewDelegate.loginTooltipViewWillAppear(view:FBSDKLoginTooltipView{*});
begin
	if Assigned(OnloginTooltipViewWillAppear) then
	begin
		OnloginTooltipViewWillAppear(view);
	end;
end;

procedure  TFBSDKLoginTooltipViewDelegate.loginTooltipViewWillNotAppear(view:FBSDKLoginTooltipView{*});
begin
	if Assigned(OnloginTooltipViewWillNotAppear) then
	begin
		OnloginTooltipViewWillNotAppear(view);
	end;
end;



{$ENDIF}

end.

