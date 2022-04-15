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

unit iOSApi.FBSDKProfile;

interface

{$IFDEF IOS}
uses
	iOSApi.FBSDKMacros,
	iOSApi.FBSDKProfilePictureView,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	
	{*
	  Notification indicating that the `currentProfile` has changed.
	
	 the userInfo dictionary of the notification will contain keys
	 `FBSDKProfileChangeOldKey` and
	 `FBSDKProfileChangeNewKey`.
	 }
	
	
	{   key in notification's userInfo object for getting the old profile.
	
	 If there was no old profile, the key will not be present.
	 }
	
	
	{   key in notification's userInfo object for getting the new profile.
	
	 If there is no new profile, the key will not be present.
	 }
	
	
	{*
	  Represents an immutable Facebook profile
	
	 This class provides a global "currentProfile" instance to more easily
	 add social context to your application. When the profile changes, a notification is
	 posted so that you can update relevant parts of your UI and is persisted to NSUserDefaults.
	
	 Typically, you will want to call `enableUpdatesOnAccessTokenChange:YES` so that
	 it automatically observes changes to the `[FBSDKAccessToken currentAccessToken]`.
	
	 You can use this class to build your own `FBSDKProfilePictureView` or in place of typical requests to "/me".
	 }
	FBSDKProfile=interface(NSObject)//<NSCopying, NSSecureCoding>
	['{34A99450-AA88-41BA-BBBE-03853C201094}']
		
		{*
		  initializes a new instance.
		 - Parameter userID: the user ID
		 - Parameter firstName: the user's first name
		 - Parameter middleName: the user's middle name
		 - Parameter lastName: the user's last name
		 - Parameter name: the user's complete name
		 - Parameter linkURL: the link for this profile
		 - Parameter refreshDate: the optional date this profile was fetched. Defaults to [NSDate date].
		 }
		[MethodName('initWithUserID:firstName:middleName:lastName:name:linkURL:refreshDate:')]
		{-} function initWithUserIDfirstNamemiddleNamelastNamenamelinkURLrefreshDate(userID:NSString{*};firstName:NSString{*};middleName:NSString{*};lastName:NSString{*};name:NSString{*};linkURL:NSURL{*};refreshDate:NSDate{*}):FBSDKProfile;cdecl;
		{*
		  The user id
		 }
		function userID:NSString{*};cdecl;
		procedure setUserID(userID:NSString{*});cdecl;
		{*
		  The user's first name
		 }
		function firstName:NSString{*};cdecl;
		procedure setFirstName(firstName:NSString{*});cdecl;
		{*
		  The user's middle name
		 }
		function middleName:NSString{*};cdecl;
		procedure setMiddleName(middleName:NSString{*});cdecl;
		{*
		  The user's last name
		 }
		function lastName:NSString{*};cdecl;
		procedure setLastName(lastName:NSString{*});cdecl;
		{*
		  The user's complete name
		 }
		function name:NSString{*};cdecl;
		procedure setName(name:NSString{*});cdecl;
		{*
		  A URL to the user's profile.
		
		 Consider using Bolts and `FBSDKAppLinkResolver` to resolve this
		 to an app link to link directly to the user's profile in the Facebook app.
		 }
		function linkURL:NSURL{*};cdecl;
		procedure setLinkURL(linkURL:NSURL{*});cdecl;
		
		{*
		  The last time the profile data was fetched.
		 }
		function refreshDate:NSDate{*};cdecl;
		procedure setRefreshDate(refreshDate:NSDate{*});cdecl;
		
		{*
		  Gets the current FBSDKProfile instance.
		 }
		
		{*
		  Sets the current instance and posts the appropriate notification if the profile parameter is different
		 than the receiver.
		 - Parameter profile: the profile to set
		
		 This persists the profile to NSUserDefaults.
		 }
		
		{*
		  Indicates if `currentProfile` will automatically observe `FBSDKAccessTokenDidChangeNotification` notifications
		 - Parameter enable: YES is observing
		
		 If observing, this class will issue a graph request for public profile data when the current token's userID
		 differs from the current profile. You can observe `FBSDKProfileDidChangeNotification` for when the profile is updated.
		
		 Note that if `[FBSDKAccessToken currentAccessToken]` is unset, the `currentProfile` instance remains. It's also possible
		 for `currentProfile` to return nil until the data is fetched.
		 }
		
		{*
		  Loads the current profile and passes it to the completion block.
		 - Parameter completion: The block to be executed once the profile is loaded
		
		 If the profile is already loaded, this method will call the completion block synchronously, otherwise it
		 will begin a graph request to update `currentProfile` and then call the completion block when finished.
		 }
		
		{*
		  A convenience method for returning a complete `NSURL` for retrieving the user's profile image.
		 - Parameter mode: The picture mode
		 - Parameter size: The height and width. This will be rounded to integer precision.
		 }
		[MethodName('imageURLForPictureMode:size:')]
		{-} function imageURLForPictureModesize(mode:FBSDKProfilePictureMode;size:CGSize):NSURL{*};cdecl;
		
		{*
		  A convenience method for returning a Graph API path for retrieving the user's profile image.
		
		- Warning:use `imageURLForPictureMode:size:` instead
		
		 You can pass this to a `FBSDKGraphRequest` instance to download the image.
		 - Parameter mode: The picture mode
		 - Parameter size: The height and width. This will be rounded to integer precision.
		 }
		[MethodName('imagePathForPictureMode:size:__attribute__ ((deprecated("use imageURLForPictureMode:')]
		{-} function imagePathForPictureModesize__attribute__ ((deprecated("use imageURLForPictureMode(mode:FBSDKProfilePictureMode;size:CGSize;)):ize: instead"):NSString{*};cdecl;
		
		{*
		  Returns YES if the profile is equivalent to the receiver.
		 - Parameter profile: the profile to compare to.
		 }
		{-} function isEqualToProfile(profile:FBSDKProfile{*}):Boolean;cdecl;
	end;
	
	FBSDKProfileClass=interface(NSObjectClass)//<NSCopying, NSSecureCoding>
	['{23D4F478-BEA7-4457-AF3B-4459E52BC352}']
		{+} function currentProfile:FBSDKProfile{*};cdecl;
		{+} procedure setCurrentProfile(profile:FBSDKProfile{*});cdecl;
		{+} procedure enableUpdatesOnAccessTokenChange(enable:Boolean);cdecl;
		{+} procedure loadCurrentProfileWithCompletion(completion:void(^)(FBSDKProfile *profile, NSError *error));cdecl;
	end;
	
	TFBSDKProfile=class(TOCGenericImport<FBSDKProfileClass,FBSDKProfile>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

