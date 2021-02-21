//
//  TwitterKit.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

unit iOSApi.TwitterKit;

interface

{$IFDEF IOS}
uses
	iOSapi.AVFoundation,
//	iOSapi.Accounts,
	iOSapi.CoreMedia,
	iOSapi.Foundation,
	iOSapi.TwitterCore,
	iOSapi.UIKit,
	iOSApi.TWTRAPIClient,
	iOSApi.TWTRCollectionTimelineDataSource,
	iOSApi.TWTRComposer,
	iOSApi.TWTRComposerViewController,
	iOSApi.TWTRJSONConvertible,
	iOSApi.TWTRListTimelineDataSource,
	iOSApi.TWTRLogInButton,
	iOSApi.TWTRMediaEntitySize,
	iOSApi.TWTRMoPubAdConfiguration,
	iOSApi.TWTRMoPubNativeAdContainerView,
	iOSApi.TWTRNotificationConstants,
	iOSApi.TWTROAuthSigning,
	iOSApi.TWTRSearchTimelineDataSource,
	iOSApi.TWTRTimelineCursor,
	iOSApi.TWTRTimelineDataSource,
	iOSApi.TWTRTimelineDelegate,
	iOSApi.TWTRTimelineFilter,
	iOSApi.TWTRTimelineType,
	iOSApi.TWTRTimelineViewController,
	iOSApi.TWTRTweet,
	iOSApi.TWTRTweetCashtagEntity,
	iOSApi.TWTRTweetEntity,
	iOSApi.TWTRTweetHashtagEntity,
	iOSApi.TWTRTweetTableViewCell,
	iOSApi.TWTRTweetUrlEntity,
	iOSApi.TWTRTweetUserMentionEntity,
	iOSApi.TWTRTweetView,
	iOSApi.TWTRTweetViewDelegate,
	iOSApi.TWTRUser,
	iOSApi.TWTRUserTimelineDataSource,
	iOSApi.TWTRVideoMetaData,
	iOSApi.Twitter,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;


	//#if __IPHONE_OS_VERSION_MIN_REQUIRED < 90000
	//#error "TwitterKit doesn't support iOS 8.x and lower. Please, change your minimum deployment target to iOS 9.0"
	//#endif

{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

