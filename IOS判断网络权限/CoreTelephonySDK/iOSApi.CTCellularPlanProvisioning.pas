////
////  CTCellularPlanProvisioning.h
////  CoreTelephony
////
////  Copyright (c) 2018 Apple Inc. All rights reserved.

unit iOSApi.CTCellularPlanProvisioning;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	//#import <CoreTelephony/CoreTelephonyDefines.h>
	iOSapi.CoreTelephonyDefines,
	//#import <CoreTelephony/CTCellularPlanProvisioningRequest.h>
	iOSapi.CTCellularPlanProvisioningRequest,
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
	
	//CORETELEPHONY_CLASS_AVAILABLE(12_0)
	//@interface CTCellularPlanProvisioning : NSObject
	
	//- (BOOL)supportsCellularPlan   __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_12_0);
	 //CORETELEPHONY_CLASS_AVAILABLE(12_0) @interface CTCellularPlanProvisioning : NSObject  - (BOOL)supportsCellularPlan   __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_12_0);
	{} function @interface CTCellularPlanProvisioning : NSObject  -(__OSX_AVAILABLE_STARTING(__MAC_NA:OOL)supportsCellularPlan):CORETELEPHONY_CLASS_AVAILABLE12_0;cdecl;
	
	TCTCellularPlanProvisioningAddPlanResult_Event=procedure (result:CTCellularPlanProvisioningAddPlanResult) of object;
	//- (void)addPlanWith:(CTCellularPlanProvisioningRequest *)request completionHandler:(void (^)(CTCellularPlanProvisioningAddPlanResult result))completionHandler   __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_12_0);
	[MethodName('addPlanWith:completionHandler:')]
	procedure addPlanWithcompletionHandler(request:CTCellularPlanProvisioningRequest;completionHandler:TCTCellularPlanProvisioningAddPlanResult_Event);cdecl;
	
	
	////@end
	
	//NS_ASSUME_NONNULL_END
{$ENDIF}

implementation

{$IFDEF IOS}
{} function @interface CTCellularPlanProvisioning : NSObject  -(__OSX_AVAILABLE_STARTING(__MAC_NA:OOL)supportsCellularPlan):CORETELEPHONY_CLASS_AVAILABLE12_0;cdecl;external {$I FrameworkDylibPath_CoreTelephony.inc} name _PU + '@interface CTCellularPlanProvisioning : NSObject  -'

{$O-}
{$O+}



{$ENDIF}

end.

