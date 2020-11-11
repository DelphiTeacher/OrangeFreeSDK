////
////  CTCellularPlanProvisioningRequest.h
////  CFTelephony
////
////  Copyright (c) 2018 Apple Inc. All rights reserved.
////

unit iOSApi.CTCellularPlanProvisioningRequest;

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

	
	//typedef NS_ENUM(NSUInteger, CTCellularPlanProvisioningAddPlanResult) {
	//	CTCellularPlanProvisioningAddPlanResultUnknown,
	//	CTCellularPlanProvisioningAddPlanResultFail,
	//	CTCellularPlanProvisioningAddPlanResultSuccess
	//};
	//typedef NS_ENUM(NSUInteger, CTCellularPlanProvisioningAddPlanResult) {
	CTCellularPlanProvisioningAddPlanResult_=(
	//(NSUInteger, CTCellularPlanProvisioningAddPlanResult) {
		CTCellularPlanProvisioningAddPlanResultUnknown,
		CTCellularPlanProvisioningAddPlanResultFail,
		CTCellularPlanProvisioningAddPlanResultSuccess
	);
	CTCellularPlanProvisioningAddPlanResult=Integer;
	
	
	
	
	
	//CORETELEPHONY_EXTERN_CLASS
	//@interface CTCellularPlanProvisioningRequest : NSObject<NSSecureCoding>
	//@interface CTCellularPlanProvisioningRequest : NSObject<NSSecureCoding>
	CTCellularPlanProvisioningRequest=interface(NSObject)//<NSSecureCoding>
	['{33872295-506C-47AD-826E-7F5B9EC1D246}']
		
		//@property (nonatomic, strong, nonnull)  NSString *address;
		function address:NSString;cdecl;
		procedure setAddress(address:NSString);cdecl;
		//@property (nonatomic, strong, nullable) NSString *matchingID;
		function matchingID:NSString;cdecl;
		procedure setMatchingID(matchingID:NSString);cdecl;
		//@property (nonatomic, strong, nullable) NSString *OID;
		function OID:NSString;cdecl;
		procedure setOID(OID:NSString);cdecl;
		//@property (nonatomic, strong, nullable) NSString *confirmationCode;
		function confirmationCode:NSString;cdecl;
		procedure setConfirmationCode(confirmationCode:NSString);cdecl;
		//@property (nonatomic, strong, nullable) NSString *ICCID;
		function ICCID:NSString;cdecl;
		procedure setICCID(ICCID:NSString);cdecl;
		//@property (nonatomic, strong, nullable) NSString *EID;
		function EID:NSString;cdecl;
		procedure setEID(EID:NSString);cdecl;
		
	end;
	
	CTCellularPlanProvisioningRequestClass=interface(NSObjectClass)//<NSSecureCoding>
	['{0FB67DE4-8242-4CDA-B3F2-51834B9B1226}']
	end;
	
	TCTCellularPlanProvisioningRequest=class(TOCGenericImport<CTCellularPlanProvisioningRequestClass,CTCellularPlanProvisioningRequest>)
	end;
	
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function CTCellularPlanProvisioningRequest_FakeLoader : CTCellularPlanProvisioningRequest; cdecl; external {$I FrameworkDylibPath_CoreTelephony.inc} name 'OBJC_CLASS_$_CTCellularPlanProvisioningRequest';
{$O+}



{$ENDIF}

end.

