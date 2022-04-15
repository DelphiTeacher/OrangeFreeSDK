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

unit iOSApi.FBSDKAppLinkResolver;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
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

	
	
	
	// Check if Bolts.framework is available for import
	//#if __has_include(<Bolts/BFAppLinkResolving.h>)
	// Import it if it's available
	//# import <Bolts/BFAppLinkResolving.h>
	//#else
	// Otherwise - redeclare BFAppLinkResolving protocol to resolve the problem of missing symbols
	// Please note: Bolts.framework is still required for AppLink resolving to work,
	// but this allows FBSDKCoreKit to weakly link Bolts.framework as well as this enables clang modulemaps to work.
	
	{*
	 Implement this protocol to provide an alternate strategy for resolving
	 App Links that may include pre-fetching, caching, or querying for App Link
	 data from an index provided by a service provider.
	 }
	BFAppLinkResolving=interface(IObjectiveC)
		['{312003D7-AF79-41C0-AFC5-29E50C66170E}']
		
		{*
		 Asynchronously resolves App Link data for a given URL.
		
		 - Parameter url: The URL to resolve into an App Link.
		 - Returns: A BFTask that will return a BFAppLink for the given URL.
		 }
		{-} function appLinkFromURLInBackground(url:NSURL{*}):BFTask{*};cdecl;
		
	end;
	
	TOnappLinkFromURLInBackground=function(url:NSURL{*}):BFTask{*} of object;
	
	TBFAppLinkResolving=class(TOCLocal,BFAppLinkResolving)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnappLinkFromURLInBackground:TOnappLinkFromURLInBackground;
	
		
		{*
		 Asynchronously resolves App Link data for a given URL.
		
		 - Parameter url: The URL to resolve into an App Link.
		 - Returns: A BFTask that will return a BFAppLink for the given URL.
		 }
		{-} function appLinkFromURLInBackground(url:NSURL{*}):BFTask{*};cdecl;
		
	end;
	
	
	//#endif
	
	{*
	
	  Provides an implementation of the BFAppLinkResolving protocol that uses the Facebook App Link
	 Index API to resolve App Links given a URL. It also provides an additional helper method that can resolve
	 multiple App Links in a single call.
	
	
	
	 Usage of this type requires a client token. See `[FBSDKSettings setClientToken:]` and linking
	 Bolts.framework
	 }
	FBSDKAppLinkResolver=interface(NSObject)//<BFAppLinkResolving>
	['{9EE7A077-9E3C-4DC8-8138-9974063E5CF9}']
		
		{*
		  Asynchronously resolves App Link data for multiple URLs.
		
		 - Parameter urls: An array of NSURLs to resolve into App Links.
		 - Returns: A BFTask that will return dictionary mapping input NSURLs to their
		  corresponding BFAppLink.
		
		
		
		 You should set the client token before making this call. See `[FBSDKSettings setClientToken:]`
		 }
		{-} function appLinksFromURLsInBackground(urls:NSArray{*}):BFTask{*};cdecl;
		
		{*
		  Allocates and initializes a new instance of FBSDKAppLinkResolver.
		 }
		
	end;
	
	FBSDKAppLinkResolverClass=interface(NSObjectClass)//<BFAppLinkResolving>
	['{50978DD9-71A1-42DC-81C7-F438BEE465D1}']
		{+} function resolver:FBSDKAppLinkResolver;cdecl;
	end;
	
	TFBSDKAppLinkResolver=class(TOCGenericImport<FBSDKAppLinkResolverClass,FBSDKAppLinkResolver>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}

{ TBFAppLinkResolving }

constructor TBFAppLinkResolving.Create;
begin
	Inherited Create;
end;

destructor TBFAppLinkResolving.Destroy;
begin
	Inherited;
end;

function  TBFAppLinkResolving.appLinkFromURLInBackground(url:NSURL{*}):BFTask{*};
begin
	if Assigned(OnappLinkFromURLInBackground) then
	begin
		Result:=OnappLinkFromURLInBackground(url);
	end;
end;



{$ENDIF}

end.

