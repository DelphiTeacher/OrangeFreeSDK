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

unit iOSApi.FBSDKProfilePictureView;

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
	 FBSDKProfilePictureMode enum
	  Defines the aspect ratio mode for the source image of the profile picture.
	 }
	FBSDKProfilePictureMode_=(
	//(NSUInteger, FBSDKProfilePictureMode)
	//  /**
	//    A square cropped version of the image will be included in the view.
	//   */
	  FBSDKProfilePictureModeSquare,
	//  /**
	//    The original picture's aspect ratio will be used for the source image in the view.
	//   */
	  FBSDKProfilePictureModeNormal//,
	);
	FBSDKProfilePictureMode=Integer;
	
	{*
	  A view to display a profile picture.
	 }
	FBSDKProfilePictureView=interface(UIView)//
	['{BD6156AE-58FB-471D-9AA7-17E8D0DAAE98}']
		
		{*
		  The mode for the receiver to determine the aspect ratio of the source image.
		 }
		function pictureMode:FBSDKProfilePictureMode;cdecl;
		procedure setPictureMode(pictureMode:FBSDKProfilePictureMode);cdecl;
		
		{*
		  The profile ID to show the picture for.
		 }
		function profileID:NSString{*};cdecl;
		procedure setProfileID(profileID:NSString{*});cdecl;
		
		{*
		  Explicitly marks the receiver as needing to update the image.
		
		 This method is called whenever any properties that affect the source image are modified, but this can also
		 be used to trigger a manual update of the image if it needs to be re-downloaded.
		 }
		{-} procedure setNeedsImageUpdate;cdecl;
		
	end;
	
	FBSDKProfilePictureViewClass=interface(UIViewClass)//
	['{E5F44F21-EFEC-4997-A466-D8F9933BEE7F}']
	end;
	
	TFBSDKProfilePictureView=class(TOCGenericImport<FBSDKProfilePictureViewClass,FBSDKProfilePictureView>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

