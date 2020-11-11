//{
// *  CTSubscriberInfo.h
// *  CFTelephony
// *
// *  Copyright 2012 Apple, Inc. All rights reserved.
// *
// }

unit iOSApi.CTSubscriberInfo;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	//#import <CoreTelephony/CoreTelephonyDefines.h>
	iOSapi.CoreTelephonyDefines,
	//#import <CoreTelephony/CTSubscriber.h>
	iOSapi.CTSubscriber,
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

	
	
	//NS_ASSUME_NONNULL_BEGIN
	
	//CORETELEPHONY_CLASS_AVAILABLE(6_0) API_UNAVAILABLE(macCatalyst, watchos) API_UNAVAILABLE(macos, tvos)
	//@interface CTSubscriberInfo : NSObject
	
	//+ (NSArray<CTSubscriber *> *)subscribers
	//API_AVAILABLE(ios(12.1))
	//API_UNAVAILABLE(macCatalyst, watchos)
	//;
	
	//+ (CTSubscriber*) subscriber
	//API_DEPRECATED_WITH_REPLACEMENT("Use subscribers instead", ios(6.0, 12.1))
	//;
	
	//@end
	
	//NS_ASSUME_NONNULL_END
	
	 //CORETELEPHONY_CLASS_AVAILABLE(6_0)  API_UNAVAILABLE(macos, tvos) @interface CTSubscriberInfo : NSObject  + (NSArray<CTSubscriber *> *)subscribers   ;  + (CTSubscriber*) subscriber API_DEPRECATED_WITH_REPLACEMENT("Use subscribers instead", ios(6.0, 12.1)) ;  @end  NS_ASSUME_NONNULL_END 
	{} function API_UNAVAILABLE(tvos) @interface CTSubscriberInfo : NSObject  + (NSArray<CTSubscriber > :acos,;@interface CTSubscriberInfo : NSObject  + (NSArray<CTSubscriber > :tvos);CTSubscriberInfo : NSObject  + (NSArray<CTSubscriber > :@interface;: NSObject  + (NSArray<CTSubscriber > :CTSubscriberInfo;NSObject  + (NSArray<CTSubscriber > ::;+ (NSArray<CTSubscriber > :NSObject;(NSArray<CTSubscriber > :+;:(NSArray{CTSubscriber*}):CORETELEPHONY_CLASS_AVAILABLE6_0;cdecl;
{$ENDIF}

implementation

{$IFDEF IOS}
{} function API_UNAVAILABLE(tvos) @interface CTSubscriberInfo : NSObject  + (NSArray<CTSubscriber > :acos,;@interface CTSubscriberInfo : NSObject  + (NSArray<CTSubscriber > :tvos);CTSubscriberInfo : NSObject  + (NSArray<CTSubscriber > :@interface;: NSObject  + (NSArray<CTSubscriber > :CTSubscriberInfo;NSObject  + (NSArray<CTSubscriber > ::;+ (NSArray<CTSubscriber > :NSObject;(NSArray<CTSubscriber > :+;:(NSArray{CTSubscriber*}):CORETELEPHONY_CLASS_AVAILABLE6_0;cdecl;external {$I FrameworkDylibPath_CoreTelephony.inc} name _PU + 'API_UNAVAILABLE'

{$O-}
{$O+}



{$ENDIF}

end.

