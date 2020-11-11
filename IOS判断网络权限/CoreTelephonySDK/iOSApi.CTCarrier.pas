//{
// *  CTCarrier.h
// *  CoreTelephony
// *
// *  Copyright 2009 Apple, Inc.. All rights reserved.
// *
// }

unit iOSApi.CTCarrier;

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
	
	//CORETELEPHONY_CLASS_AVAILABLE(4_0)
	//@interface CTCarrier : NSObject
	
	///*
	 //* carrierName
	 //*
	 //* Discussion:
	 //*   An NSString containing the name of the subscriber's cellular service provider.
	 //*/
	//@property (nonatomic, readonly, retain, nullable) NSString *carrierName __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
	 //CORETELEPHONY_CLASS_AVAILABLE(4_0) @interface CTCarrier : NSObject        @property (nonatomic, readonly, retain, nullable) NSString *carrierName __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
	{} function @interface CTCarrier : NSObject        @property(readonly:onatomic,;nullable) NSString carrierName __OSX_AVAILABLE_STARTING(__MAC_NA:retain,):CORETELEPHONY_CLASS_AVAILABLE4_0;cdecl;
	
	//{
	// * mobileCountryCode
	// *
	// * Discussion:
	// *   An NSString containing the mobile country code for the subscriber's 
	// *   cellular service provider, in its numeric representation
	// }
	//@property (nonatomic, readonly, retain, nullable) NSString *mobileCountryCode __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
	function mobileCountryCode:NSString;cdecl;
	procedure setMobileCountryCode(mobileCountryCode:NSString);cdecl;
	
	//{
	// * mobileNetworkCode
	// *
	// * Discussion:
	// *   An NSString containing the  mobile network code for the subscriber's 
	// *   cellular service provider, in its numeric representation
	// }
	//@property (nonatomic, readonly, retain, nullable) NSString *mobileNetworkCode __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
	function mobileNetworkCode:NSString;cdecl;
	procedure setMobileNetworkCode(mobileNetworkCode:NSString);cdecl;
	
	//{
	// * isoCountryCode
	// *
	// * Discussion:
	// *   Returns an NSString object that contains country code for
	// *   the subscriber's cellular service provider, represented as an ISO 3166-1
	// *   country code string
	// }
	
	//@property (nonatomic, readonly, retain, nullable) NSString* isoCountryCode __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
	function isoCountryCode:NSString;cdecl;
	procedure setIsoCountryCode(isoCountryCode:NSString);cdecl;
	
	//{
	// * allowsVOIP
	// *
	// * Discussion:
	// *   A BOOL value that is YES if this carrier allows VOIP calls to be
	// *   made on its network, NO otherwise.
	// }
	
	//@property (nonatomic, readonly, assign) BOOL allowsVOIP __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
	function allowsVOIP:Boolean;cdecl;
	procedure setAllowsVOIP(allowsVOIP:Boolean);cdecl;
	
	////@end
	
	//NS_ASSUME_NONNULL_END
	
{$ENDIF}

implementation

{$IFDEF IOS}
{} function @interface CTCarrier : NSObject        @property(readonly:onatomic,;nullable) NSString carrierName __OSX_AVAILABLE_STARTING(__MAC_NA:retain,):CORETELEPHONY_CLASS_AVAILABLE4_0;cdecl;external {$I FrameworkDylibPath_CoreTelephony.inc} name _PU + '@interface CTCarrier : NSObject        @property'

{$O-}
{$O+}



{$ENDIF}

end.

