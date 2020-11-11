//{
// *  CTCall.h
// *  CFTelephony
// *
// *  Copyright 2010 Apple, Inc. All rights reserved.
// *
// }

unit iOSApi.CTCall;

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

	
	//NS_ASSUME_NONNULL_BEGIN
	
	//CORETELEPHONY_EXTERN NSString * const CTCallStateDialing  __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCall.h> properties");
	__OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCall.h> properties")=CTCallStateDialing;
	//CORETELEPHONY_EXTERN NSString * const CTCallStateIncoming  __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCall.h> properties");
	__OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCall.h> properties")=CTCallStateIncoming;
	//CORETELEPHONY_EXTERN NSString * const CTCallStateConnected  __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCall.h> properties");
	__OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCall.h> properties")=CTCallStateConnected;
	//CORETELEPHONY_EXTERN NSString * const CTCallStateDisconnected  __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCall.h> properties");
	__OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCall.h> properties")=CTCallStateDisconnected;
	
	
	//{
	// * callState
	// *
	// * Description:
	// *     An NSString constant that describes the state of this call. The initial state
	// *     will be either CTCallStateDialing or CTCallStateIncoming, will transition
	// *     to CTCallStateConnected when the call is established with all parties 
	// *     involved and will move to CTCallStateDisconnected when this call is terminated.
	// }
	//@property(nonatomic, readonly, copy) NSString *callState  __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCall.h> properties");
	function callState:NSString;cdecl;
	procedure setCallState(callState:NSString);cdecl;
	
	//{
	// * callID
	// *
	// * Description:
	// *     A unique identifier for this call to be used by clients to differentiate
	// *     multiple active calls.
	// }
	//@property(nonatomic, readonly, copy) NSString *callID  __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_10_0, "Replaced by <CallKit/CXCall.h> properties");
	function callID:NSString;cdecl;
	procedure setCallID(callID:NSString);cdecl;
	
	////@end
	
	//NS_ASSUME_NONNULL_END
{$ENDIF}

implementation

{$IFDEF IOS}
{} function ():CORETELEPHONY_CLASS_AVAILABLE4_0;cdecl;external {$I FrameworkDylibPath_CoreTelephony.inc} name _PU + ''

{$O-}
{$O+}



{$ENDIF}

end.

