////
////  CTCellularData.h
////  CFTelephony
////
////  Copyright (c) 2015 Apple Inc. All rights reserved.
////

unit iOSApi.CTCellularData;

interface

{$IFDEF IOS}
uses
	//#import <CoreTelephony/CoreTelephonyDefines.h>
//	iOSapi.CoreTelephonyDefines,
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

	
	//typedef NS_ENUM(NSUInteger, CTCellularDataRestrictedState) {
	//	kCTCellularDataRestrictedStateUnknown,
	//	kCTCellularDataRestricted,
	//	kCTCellularDataNotRestricted
	//};
	//typedef NS_ENUM(NSUInteger, CTCellularDataRestrictedState) {
	CTCellularDataRestrictedState_=(
	//(NSUInteger, CTCellularDataRestrictedState) {
		kCTCellularDataRestrictedStateUnknown,
		kCTCellularDataRestricted,
		kCTCellularDataNotRestricted
	);
	CTCellularDataRestrictedState=Integer;
	
	
	
	
	
	TCellularDataRestrictionDidUpdateNotifierEvent=procedure (state:CTCellularDataRestrictedState) of object;
	//typedef void (^CellularDataRestrictionDidUpdateNotifier)(CTCellularDataRestrictedState);

	//typedef void (^CellularDataRestrictionDidUpdateNotifier)(CTCellularDataRestrictedState);

  //@interface CTCellularData : NSObject
  CTCellularData=interface(NSObject)//
  ['{02F00453-CB10-418B-97B8-5E7BD8E68F3A}']
    //{
    // * cellularDataRestrictionDidUpdateNotifier
    // *
    // * A block that will be dispatched on the default priority global dispatch queue the first time
    // * app sets the callback handler and everytime there is a change in cellular data allowed policy
    // * for the app.
    // }

    //@property (copy, nullable) CellularDataRestrictionDidUpdateNotifier cellularDataRestrictionDidUpdateNotifier __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_9_0);
    function cellularDataRestrictionDidUpdateNotifier:TCellularDataRestrictionDidUpdateNotifierEvent;cdecl;
    procedure setCellularDataRestrictionDidUpdateNotifier(cellularDataRestrictionDidUpdateNotifier:TCellularDataRestrictionDidUpdateNotifierEvent);cdecl;
    //@property (nonatomic, readonly) CTCellularDataRestrictedState restrictedState __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_9_0);
    function restrictedState:CTCellularDataRestrictedState;cdecl;
    procedure setRestrictedState(restrictedState:CTCellularDataRestrictedState);cdecl;
  end;

  CTCellularDataClass=interface(NSObjectClass)//
  ['{5E2740D9-68F0-4DBF-ADFB-1D03E03495AC}']
  end;

  TCTCellularData=class(TOCGenericImport<CTCellularDataClass,CTCellularData>)
  end;





{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
{$O+}



{$ENDIF}

end.

