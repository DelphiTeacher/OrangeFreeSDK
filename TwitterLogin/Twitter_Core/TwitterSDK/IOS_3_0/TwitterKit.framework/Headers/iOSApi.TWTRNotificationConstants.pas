//
//  TWTRNotificationConstants.h
//  TwitterKit
//
//  Copyright ? 2016 Twitter. All rights reserved.
//

unit iOSApi.TWTRNotificationConstants;

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
	 *  Constants for notifications that are posted from TwitterKit. These are posted on the default notification center.
	 }
	
	//#pragma mark - Tweet Action Notifications
	
	{*
	 *  Notification indicating a Tweet was selected.
	 }
	
	
	{*
	 *  Notification indicating the Tweet detail view was shown for a given Tweet.
	 }
	
	
	{*
	 *  Notification indicating the user has selected to share Tweet.
	 }
	
	
	{*
	 *  Notification indicating the Tweet was shared.
	 }
	
	
	{*
	 *  Notification indicating the user has cancelled sharing of the Tweet.
	 }
	
	
	{*
	 *  Notification indicating the user has liked a Tweet.
	 }
	
	
	{*
	 *  Notification indicating the user has unliked a Tweet.
	 }
	
	
	//#pragma mark - Media Notifications
	
	{*
	 *  Notification indicating the the playback state of a video
	 *  has changed.
	 *
	 *  object: The UIView emitting these notifications
	 *  userInfo: {TWTRVideoPlaybackStateKey: TWTRVideoStateValuePlaying}
	 *            {TWTRVideoPlaybackStateKey: TWTRVideoStateValuePaused}
	 *            {TWTRVideoPlaybackStateKey: TWTRVideoStateValueCompleted}
	 }
	
	
	{*
	 *  User info key for the state of video playback.
	 }
	
	
	{*
	 *  User info values for the state of video playback.
	 }
	
	
	
	
	//#pragma mark - Presentation Notifications
	
	{*
	 *  Notification indicating that the video view controller will
	 *  be presented.
	 *
	 *  object: The UIViewController hosting the video view
	 *  userInfo: {TWTRVideoTypeKey: TWTRVideoTypeGIF}
	 *            {TWTRVideoTypeKey: TWTRVideoTypeStandard}
	 *            {TWTRVideoTypeKey: TWTRVideoTypeVine}
	 }
	
	
	{*
	 *  Notification indicating that the video view controller has
	 *  been dismissed.
	 *
	 *  object: The UIViewController hosting the video view
	 }
	
	
	{*
	 *  The key to fetch the type of video being displayed in a
	 *  TWTRVideoViewController.
	 }
	
	
	{*
	 *  User info values for the type of video being displayed
	 *  in a TWTRVideoViewController.
	 }
	
	
	
	
	//#pragma mark - Notification User Info
	
	{*
	 *  User info key to fetch the associated Tweet in the notification.
	 }
	
	
	{*
	 * A notification which is posted when a user logs out of Twitter.
	 * The notification will contain a user dictionary which contains
	 * the user id which is being logged out. Note, this notification may
	 * be posted as a result of starting the Twitter object.
	 }
	
	
	
	{*
	 * A notification which is posted when a user logs in to Twitter.
	 * The notification will contain a user dictionary which contains
	 * the user id which is being logged in. Note, this notification may
	 * be posted as a result of starting the Twitter object.
	 }
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

