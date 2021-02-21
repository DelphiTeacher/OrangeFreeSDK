unit iOSApi.TWTRTimelineType;

interface

{$IFDEF IOS}
uses
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

	//
	//  TWTRTimelineType.h
	//  TwitterKit
	//
	//  Copyright (c) 2015 Twitter. All rights reserved.
	//
	
	{
	 *  Type of timelines that may be loaded and shown to the user.
	 }
	TWTRTimelineType_=(
	//(NSUInteger, TWTRTimelineType) {
	//    /*
	//     *  User Timeline
	//     */
	    TWTRTimelineTypeUser = 1,
	//    /*
	//     *  Search Timeline
	//     */
	    TWTRTimelineTypeSearch,
	//    /**
	//     *  Collection Timeline
	//     */
	    TWTRTimelineTypeCollection,
	//    /**
	//     *  List Timeline
	//     */
	    TWTRTimelineTypeList//,
	);
	TWTRTimelineType=Integer;

  //ע
  TWTRTimelineFilter=Integer;
  TWTRAPIClient=Integer;
{$ENDIF}

implementation

{$IFDEF IOS}


{$ENDIF}

end.

