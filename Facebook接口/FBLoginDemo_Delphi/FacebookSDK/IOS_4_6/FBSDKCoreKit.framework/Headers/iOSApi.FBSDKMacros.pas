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

unit iOSApi.FBSDKMacros;

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

	
	//#ifdef __cplusplus
	//#define FBSDK_EXTERN extern "C" __attribute__((visibility ("default")))
	//#else
	//#define FBSDK_EXTERN extern __attribute__((visibility ("default")))
	//#endif
	
	//#define FBSDK_STATIC_INLINE static inline
	
	//#define FBSDK_NO_DESIGNATED_INITIALIZER() \
	
	
	
	
	//#define FBSDK_NOT_DESIGNATED_INITIALIZER(DESIGNATED_INITIALIZER) \
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}
{} function ():NSStringFromSelector@selectorDESIGNATED_INITIALIZER];cdecl;external {$I BaiduMapDylibName.inc} name _PU + ''


{$ENDIF}

end.

