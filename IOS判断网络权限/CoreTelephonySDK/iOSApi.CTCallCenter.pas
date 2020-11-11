//{
// *  CTCallCenter.h
// *  CFTelephony
// *
// *  Copyright 2010 Apple, Inc. All rights reserved.
// *
// }

unit iOSApi.CTCallCenter;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	//#import <CoreTelephony/CoreTelephonyDefines.h>
	iOSapi.CoreTelephonyDefines,
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

	
	//@class CTCall;
	CTCall=Pointer;
	
	//NS_ASSUME_NONNULL_BEGIN
	
	//CORETELEPHONY_CLASS_DEPRECATED(4_0, 10_0, "Replaced by CXCallObserver from CallKit.framework")
	//@interface CTCallCenter : NSObject
	
	///*
	 //* currentCalls
	 //*
	 //* Discussion:
	 //*   An array containing CTCall objects for all calls that are currently
	 //*   in progress. If no calls are active, this will be nil.
	 //*
	 //*/
	//@property(readonly, retain, nullable) NSSet<CTCall*> *currentCalls __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCallObserver.h>");
	 //CORETELEPHONY_CLASS_DEPRECATED(4_0, 10_0, "Replaced by CXCallObserver from CallKit.framework") @interface CTCallCenter : NSObject          @property(readonly, retain, nullable) NSSet<CTCall*> *currentCalls __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCallObserver.h>");
	{CORETELEPHONY_CLASS_DEPRECATED(4_0,} function "Replaced by CXCallObserver from CallKit.framework") @interface CTCallCenter : NSObject          @property(retain:eadonly,;NSSet<CTCall> currentCalls __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA:{nullable});__IPHONE_4_0:__MAC_NA,;"Replaced by <CallKit/CXCallObserver.h>":__IPHONE_10_0,;by <CallKit/CXCallObserver.h>":"Replaced;":by{CallKit/CXCallObserver.h}):10_0,;cdecl;
	
	//{
	// * callEventHandler
	// *
	// * Discussion:
	// *   A block that will be dispatched on the default priority global dispatch
	// *   queue when a new call event occurs. Set this property to a block
	// *   that is defined in your application to handle call events.
	// }
	TcallEventHandlerEvent=procedure () of object;
	//@property(nonatomic, copy, nullable) void (^callEventHandler)(CTCall*) __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCallObserver.h>");
	function callEventHandler:TcallEventHandlerEvent;cdecl;
	procedure setCallEventHandler(callEventHandler:TcallEventHandlerEvent);cdecl;
	
	////@end
	
	//NS_ASSUME_NONNULL_END
{$ENDIF}

implementation

{$IFDEF IOS}
{CORETELEPHONY_CLASS_DEPRECATED(4_0,} function "Replaced by CXCallObserver from CallKit.framework") @interface CTCallCenter : NSObject          @property(retain:eadonly,;NSSet<CTCall> currentCalls __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA:{nullable});__IPHONE_4_0:__MAC_NA,;"Replaced by <CallKit/CXCallObserver.h>":__IPHONE_10_0,;by <CallKit/CXCallObserver.h>":"Replaced;":by{CallKit/CXCallObserver.h}):10_0,;cdecl;external {$I FrameworkDylibPath_CoreTelephony.inc} name _PU + '"Replaced by CXCallObserver from CallKit.framework") @interface CTCallCenter : NSObject          @property'

{$O-}
{$O+}



{$ENDIF}

end.

