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

unit iOSApi.FBSDKMutableCopying;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.FBSDKCopying,
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

	
	
	{*
	  Extension protocol for NSMutableCopying that adds the mutableCopy method, which is implemented on NSObject.
	
	 NSObject<NSCopying, NSMutableCopying> implicitly conforms to this protocol.
	 }
	FBSDKMutableCopying=interface(IObjectiveC)
		['{4241FA85-52C5-41F0-9A5B-FC26B302A8AA}']
		
		{*
		  Implemented by NSObject as a convenience to mutableCopyWithZone:.
		 - Returns: A mutable copy of the receiver.
		 }
		{-} function mutableCopy:id;cdecl;
		
	end;
	
	TOnmutableCopy=function():id of object;
	
	TFBSDKMutableCopying=class(TOCLocal,FBSDKMutableCopying)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnmutableCopy:TOnmutableCopy;
	
		
		{*
		  Implemented by NSObject as a convenience to mutableCopyWithZone:.
		 - Returns: A mutable copy of the receiver.
		 }
		{-} function mutableCopy:id;cdecl;
		
	end;
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TFBSDKMutableCopying }

constructor TFBSDKMutableCopying.Create;
begin
	Inherited Create;
end;

destructor TFBSDKMutableCopying.Destroy;
begin
	Inherited;
end;

function  TFBSDKMutableCopying.mutableCopy():id;
begin
	if Assigned(OnmutableCopy) then
	begin
		Result:=OnmutableCopy();
	end;
end;



{$ENDIF}

end.

