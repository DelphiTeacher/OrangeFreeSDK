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

unit iOSApi.FBSDKCopying;

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

	
	{*
	  Extension protocol for NSCopying that adds the copy method, which is implemented on NSObject.
	
	 NSObject<NSCopying> implicitly conforms to this protocol.
	 }
	FBSDKCopying=interface(IObjectiveC)
		['{0AE042FD-6D0F-420E-9949-61E95EFCB908}']
		
		{*
		  Implemented by NSObject as a convenience to copyWithZone:.
		 - Returns: A copy of the receiver.
		 }
		{-} function copy:id;cdecl;
		
	end;
	
	TOncopy=function():id of object;
	
	TFBSDKCopying=class(TOCLocal,FBSDKCopying)
	public
		constructor Create;
		destructor Destroy;override;
	public
		Oncopy:TOncopy;
	
		
		{*
		  Implemented by NSObject as a convenience to copyWithZone:.
		 - Returns: A copy of the receiver.
		 }
		{-} function copy:id;cdecl;
		
	end;
	
{$ENDIF}

implementation

{$IFDEF IOS}

{ TFBSDKCopying }

constructor TFBSDKCopying.Create;
begin
	Inherited Create;
end;

destructor TFBSDKCopying.Destroy;
begin
	Inherited;
end;

function  TFBSDKCopying.copy():id;
begin
	if Assigned(Oncopy) then
	begin
		Result:=Oncopy();
	end;
end;



{$ENDIF}

end.

