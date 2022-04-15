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

unit iOSApi.FBSDKLoginButton;

interface

{$IFDEF IOS}
uses
	iOSapi.UIKit,
	iOSapi.FBSDKButton,
	iOSapi.FBSDKLoginManager,
	iOSApi.FBSDKTooltipView,
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

	
	
	
	
	//@protocol FBSDKLoginButtonDelegate;
	
	{*
	 NS_ENUM(NSUInteger, FBSDKLoginButtonTooltipBehavior)
	  Indicates the desired login tooltip behavior.
	 }
	FBSDKLoginButtonTooltipBehavior_=(
	//(NSUInteger, FBSDKLoginButtonTooltipBehavior)
	//  /** The default behavior. The tooltip will only be displayed if
	//   the app is eligible (determined by possible server round trip) */
	  FBSDKLoginButtonTooltipBehaviorAutomatic = 0,
	//  /** Force display of the tooltip (typically for UI testing) */
	//  FBSDKLoginButtonTooltipBehaviorForceDisplay = 1,
	//  /** Force disable. In this case you can still exert more refined
	//   control by manually constructing a `FBSDKLoginTooltipView` instance. */
	  FBSDKLoginButtonTooltipBehaviorDisable = 2
	);
	FBSDKLoginButtonTooltipBehavior=Integer;
	
	{*
	  A button that initiates a log in or log out flow upon tapping.
	
	 `FBSDKLoginButton` works with `[FBSDKAccessToken currentAccessToken]` to
	  determine what to display, and automatically starts authentication when tapped (i.e.,
	  you do not need to manually subscribe action targets).
	
	  Like `FBSDKLoginManager`, you should make sure your app delegate is connected to
	  `FBSDKApplicationDelegate` in order for the button's delegate to receive messages.
	
	 `FBSDKLoginButton` has a fixed height of @c 30 pixels, but you may change the width. `initWithFrame:CGRectZero`
	 will size the button to its minimum frame.
	}
	FBSDKLoginButton=interface(FBSDKButton)//
	['{48DE08D7-A61D-471A-A131-CA9A5B40F0F0}']
		
		{*
		  The default audience to use, if publish permissions are requested at login time.
		 }
		function defaultAudience:FBSDKDefaultAudience;cdecl;
		procedure setDefaultAudience(defaultAudience:FBSDKDefaultAudience);cdecl;
		{*
		  Gets or sets the delegate.
		 }
		function id<FBSDKLoginButtonDelegate>:IBOutlet;cdecl;
		procedure setId<FBSDKLoginButtonDelegate>(id<FBSDKLoginButtonDelegate>:IBOutlet);cdecl;
		{*
		  Gets or sets the login behavior to use
		 }
		function loginBehavior:FBSDKLoginBehavior;cdecl;
		procedure setLoginBehavior(loginBehavior:FBSDKLoginBehavior);cdecl;
		{*
		  The publish permissions to request.
		
		
		 Use `defaultAudience` to specify the default audience to publish to.
		 Note this is converted to NSSet and is only
		 an NSArray for the convenience of literal syntax.
		 }
		function publishPermissions:NSArray{*};cdecl;
		procedure setPublishPermissions(publishPermissions:NSArray{*});cdecl;
		{*
		  The read permissions to request.
		
		
		 Note, that if read permissions are specified, then publish permissions should not be specified. This is converted to NSSet and is only
		 an NSArray for the convenience of literal syntax.
		 }
		function readPermissions:NSArray{*};cdecl;
		procedure setReadPermissions(readPermissions:NSArray{*});cdecl;
		{*
		  Gets or sets the desired tooltip behavior.
		 }
		function tooltipBehavior:FBSDKLoginButtonTooltipBehavior;cdecl;
		procedure setTooltipBehavior(tooltipBehavior:FBSDKLoginButtonTooltipBehavior);cdecl;
		{*
		  Gets or sets the desired tooltip color style.
		 }
		function tooltipColorStyle:FBSDKTooltipColorStyle;cdecl;
		procedure setTooltipColorStyle(tooltipColorStyle:FBSDKTooltipColorStyle);cdecl;
		
	end;
	
	FBSDKLoginButtonClass=interface(FBSDKButtonClass)//
	['{F2B2A55E-98D4-4C18-AA0B-1CE8B9D9319D}']
	end;
	
	TFBSDKLoginButton=class(TOCGenericImport<FBSDKLoginButtonClass,FBSDKLoginButton>)
	end;
	
	{*
	 @protocol
	  A delegate for `FBSDKLoginButton`
	 }
	FBSDKLoginButtonDelegate=interface(IObjectiveC)
		['{17E9FF66-EF99-4BD0-85D3-6A5480314A80}']
		
		//@required
		{*
		  Sent to the delegate when the button was used to login.
		 - Parameter loginButton: the sender
		 - Parameter result: The results of the login
		 - Parameter error: The error (if any) from the login
		 }
		[MethodName('loginButton:didCompleteWithResult:error:')]
		{-} procedure loginButtondidCompleteWithResulterror(loginButton:FBSDKLoginButton{*};result:FBSDKLoginManagerLoginResult{*};error:NSError{*});cdecl;
		
		{*
		  Sent to the delegate when the button was used to logout.
		 - Parameter loginButton: The button that was clicked.
		}
		{-} procedure loginButtonDidLogOut(loginButton:FBSDKLoginButton{*});cdecl;
		
		//@optional
		{*
		  Sent to the delegate when the button is about to login.
		 - Parameter loginButton: the sender
		 - Returns: YES if the login should be allowed to proceed, NO otherwise
		 }
		{-} function loginButtonWillLogin(loginButton:FBSDKLoginButton{*}):Boolean;cdecl;
		
	end;
	
	TOnloginButtondidCompleteWithResulterror=procedure(loginButton:FBSDKLoginButton{*};result:FBSDKLoginManagerLoginResult{*};error:NSError{*}) of object;
	TOnloginButtonDidLogOut=procedure(loginButton:FBSDKLoginButton{*}) of object;
	TOnloginButtonWillLogin=function(loginButton:FBSDKLoginButton{*}):Boolean of object;
	
	TFBSDKLoginButtonDelegate=class(TOCLocal,FBSDKLoginButtonDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnloginButtondidCompleteWithResulterror:TOnloginButtondidCompleteWithResulterror;
		OnloginButtonDidLogOut:TOnloginButtonDidLogOut;
		OnloginButtonWillLogin:TOnloginButtonWillLogin;
	
		
		//@required
		{*
		  Sent to the delegate when the button was used to login.
		 - Parameter loginButton: the sender
		 - Parameter result: The results of the login
		 - Parameter error: The error (if any) from the login
		 }
		[MethodName('loginButton:didCompleteWithResult:error:')]
		{-} procedure loginButtondidCompleteWithResulterror(loginButton:FBSDKLoginButton{*};result:FBSDKLoginManagerLoginResult{*};error:NSError{*});cdecl;
		
		{*
		  Sent to the delegate when the button was used to logout.
		 - Parameter loginButton: The button that was clicked.
		}
		{-} procedure loginButtonDidLogOut(loginButton:FBSDKLoginButton{*});cdecl;
		
		//@optional
		{*
		  Sent to the delegate when the button is about to login.
		 - Parameter loginButton: the sender
		 - Returns: YES if the login should be allowed to proceed, NO otherwise
		 }
		{-} function loginButtonWillLogin(loginButton:FBSDKLoginButton{*}):Boolean;cdecl;
		
	end;
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TFBSDKLoginButtonDelegate }

constructor TFBSDKLoginButtonDelegate.Create;
begin
	Inherited Create;
end;

destructor TFBSDKLoginButtonDelegate.Destroy;
begin
	Inherited;
end;

procedure  TFBSDKLoginButtonDelegate.loginButtondidCompleteWithResulterror(loginButton:FBSDKLoginButton{*};result:FBSDKLoginManagerLoginResult{*};error:NSError{*});
begin
	if Assigned(OnloginButtondidCompleteWithResulterror) then
	begin
		OnloginButtondidCompleteWithResulterror(loginButton,result,error);
	end;
end;

procedure  TFBSDKLoginButtonDelegate.loginButtonDidLogOut(loginButton:FBSDKLoginButton{*});
begin
	if Assigned(OnloginButtonDidLogOut) then
	begin
		OnloginButtonDidLogOut(loginButton);
	end;
end;

function  TFBSDKLoginButtonDelegate.loginButtonWillLogin(loginButton:FBSDKLoginButton{*}):Boolean;
begin
	if Assigned(OnloginButtonWillLogin) then
	begin
		Result:=OnloginButtonWillLogin(loginButton);
	end;
end;



{$ENDIF}

end.

