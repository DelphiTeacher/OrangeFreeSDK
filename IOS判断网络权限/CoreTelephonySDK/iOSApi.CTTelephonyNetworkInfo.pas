//{
// *  CTTelephonyNetworkInfo.h
// *  CoreTelephony
// *
// *  Copyright 2009 Apple Inc. All rights reserved.
// *
// }

unit iOSApi.CTTelephonyNetworkInfo;

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
	
	
	//{
	// * CTServiceRadioAccessTechnologyDataTechnologyDidChangeNotification
	// *
	// * Description:
	// *     A NSNotification broadcast when radio access technology changes for one of the services.  Only an object is sent with
	// *     this notfication.  The object is an NSString that represents the service identifier of the service whose radio access
	// *     technology has changed.  This NSString should be used as the key in serviceCurrentRadioAccessTechnology to get the
	// *     value of the new radio access technology for the service.
	// }
	//CORETELEPHONY_EXTERN NSString * const CTServiceRadioAccessTechnologyDidChangeNotification API_AVAILABLE(ios(12.0), watchos(5.0)) API_UNAVAILABLE(macos, tvos);
	API_AVAILABLE(ios(12.0), watchos(5.0)) API_UNAVAILABLE(macos, tvos)=CTServiceRadioAccessTechnologyDidChangeNotification;
	
	//{
	// * CTRadioAccessTechnologyDataTechnologyDidChangeNotification
	// *
	// * Description:
	// *     A NSNotification broadcast when radio access technology changes
	// }
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyDidChangeNotification API_DEPRECATED_WITH_REPLACEMENT("CTServiceRadioAccessTechnologyDidChangeNotification", ios(7.0, 12.0)) API_UNAVAILABLE(macos);
	API_DEPRECATED_WITH_REPLACEMENT("CTServiceRadioAccessTechnologyDidChangeNotification", ios(7.0, 12.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyDidChangeNotification;
	
	//{
	// * Radio Access Technology values
	// }
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyGPRS          API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyGPRS;
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyEdge          API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyEdge;
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyWCDMA         API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyWCDMA;
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyHSDPA         API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyHSDPA;
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyHSUPA         API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyHSUPA;
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyCDMA1x        API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyCDMA1x;
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyCDMAEVDORev0  API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyCDMAEVDORev0;
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyCDMAEVDORevA  API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyCDMAEVDORevA;
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyCDMAEVDORevB  API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyCDMAEVDORevB;
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyeHRPD         API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyeHRPD;
	//CORETELEPHONY_EXTERN NSString * const CTRadioAccessTechnologyLTE           API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos);
	API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos)=CTRadioAccessTechnologyLTE;
	
	//@class CTCarrier;
	CTCarrier=Pointer;
	
	
	//{
	// *  CTTelephonyNetworkInfoDelegate
	// *
	// *  Discussion:
	// *    Delegate interface for CTTelephonyNetworkInfo.
	// *    All delegate callbacks are dispatched asynchronously to a global queue with QoS QOS_CLASS_DEFAULT.
	// }
	//API_AVAILABLE(ios(13.0), watchos(6.0)) API_UNAVAILABLE(macos, tvos)
	//@protocol CTTelephonyNetworkInfoDelegate <NSObject>
	//@optional
	
	///*
	 //*  dataServiceIdentifierDidChange:
	 //*
	 //*  Discussion:
	 //*    Selector to be invoked whenever the data service identifier changes.
	 //*    This identifier is meant to be used as a key in associated dictionaries,
	 //*    e.g. serviceSubscriberCellularProviders.
	 //*/
	//- (void)dataServiceIdentifierDidChange:(NSString *)identifier;
	
	//@end
	
	///*
	 //*  CTTelephonyNetworkInfo
	 //*  
	 //*  Discussion:
	 //*    The CTTelephonyNetworkInfo object is your entry point to the telephony service.
	 //*/
	//CORETELEPHONY_CLASS_AVAILABLE(4_0)
	//@interface CTTelephonyNetworkInfo : NSObject
	
	///*
	 //* dataServiceIdentifier
	 //*
	 //* Discussion:
	 //*   An NSString representing the identifier of the service that's currently providing data.
	 //*/
	 //@property(readonly, copy, nullable) NSString *dataServiceIdentifier API_AVAILABLE(ios(13.0), watchos(6.0)) API_UNAVAILABLE(macos, tvos);
	   //@protocol CTTelephonyNetworkInfoDelegate <NSObject> @optional          - (void)dataServiceIdentifierDidChange:(NSString *)identifier;  @end        CORETELEPHONY_CLASS_AVAILABLE(4_0) @interface CTTelephonyNetworkInfo : NSObject         @property(readonly, copy, nullable) NSString *dataServiceIdentifier  ;
	{@protocol} function @optional          -(:oid)dataServiceIdentifierDidChange:(NSString):CTTelephonyNetworkInfoDelegate{NSObject};cdecl;
	
	 //@property(readwrite, weak, nullable) id<CTTelephonyNetworkInfoDelegate> delegate API_AVAILABLE(ios(13.0), watchos(6.0)) API_UNAVAILABLE(macos, tvos);
	function delegate:id{CTTelephonyNetworkInfoDelegate};cdecl;
	procedure setDelegate(delegate:id{CTTelephonyNetworkInfoDelegate});cdecl;
	
	//{
	// * serviceSubscriberCellularProviders
	// *
	// * Discussion:
	// *   A dictionary containing CTCarrier objects for each service that contains information about the subscriber's
	// *   home cellular service provider.  The key to the dictionary is an NSString representing the service.
	// }
	//@property(readonly, retain, nullable) NSDictionary<NSString *, CTCarrier *> *serviceSubscriberCellularProviders API_AVAILABLE(ios(12.0), watchos(5.0)) API_UNAVAILABLE(macos, tvos);
	function serviceSubscriberCellularProviders:NSDictionary{NSString*, CTCarrier *};cdecl;
	procedure setServiceSubscriberCellularProviders(serviceSubscriberCellularProviders:NSDictionary{NSString*, CTCarrier *});cdecl;
	
	//{
	// * subscriberCellularProvider
	// *
	// * Discussion:
	// *   A CTCarrier object that contains information about the subscriber's
	// *   home cellular service provider for the service.
	// }
	//@property(readonly, retain, nullable) CTCarrier *subscriberCellularProvider __OSX_AVAILABLE_BUT_DEPRECATED_MSG(__MAC_NA, __MAC_NA, __IPHONE_4_0, __IPHONE_12_0,
	function subscriberCellularProvider:CTCarrier;cdecl;
	procedure setSubscriberCellularProvider(subscriberCellularProvider:CTCarrier);cdecl;
	//    "Replaced by serviceSubscriberCellularProviders");
	
	//{
	// * serviceSubscriberCellularProvidersDidUpdateNotifier
	// *
	// * Discussion:
	// *   A block that will be dispatched on the default priority global dispatch
	// *   queue when the subscriber's cellular provider information updates for any service. Set
	// *   this property to a block that is defined in your application to receive the newly
	// *   updated information.  The NSString will contain the service identifier of the service
	// *   whose information has changed.  This can be used as the key into serviceSubscriberCellularProvider
	// *   to obtain the new information.
	// }
	TserviceSubscriberCellularProvidersDidUpdateNotifierEvent=procedure () of object;
	//@property(nonatomic, copy, nullable) void (^serviceSubscriberCellularProvidersDidUpdateNotifier)(NSString*) API_AVAILABLE(ios(12.0), watchos(5.0)) API_UNAVAILABLE(macos, tvos);
	function serviceSubscriberCellularProvidersDidUpdateNotifier:TserviceSubscriberCellularProvidersDidUpdateNotifierEvent;cdecl;
	procedure setServiceSubscriberCellularProvidersDidUpdateNotifier(serviceSubscriberCellularProvidersDidUpdateNotifier:TserviceSubscriberCellularProvidersDidUpdateNotifierEvent);cdecl;
	
	//{
	// * subscriberCellularProviderDidUpdateNotifier
	// *
	// * Discussion:
	// *   A block that will be dispatched on the default priority global dispatch queue when
	// *   the subscriber's cellular provider information updates for the service. Set this
	// *   property to a block that is defined in your application to receive the newly
	// *   updated information.
	// }
	TsubscriberCellularProviderDidUpdateNotifierEvent=procedure () of object;
	//@property(nonatomic, copy, nullable) void (^subscriberCellularProviderDidUpdateNotifier)(CTCarrier*) API_DEPRECATED_WITH_REPLACEMENT("serviceSubscriberCellularProvidersDidUpdateNotifier", ios(4.0, 12.0)) API_UNAVAILABLE(macos);
	function subscriberCellularProviderDidUpdateNotifier:TsubscriberCellularProviderDidUpdateNotifierEvent;cdecl;
	procedure setSubscriberCellularProviderDidUpdateNotifier(subscriberCellularProviderDidUpdateNotifier:TsubscriberCellularProviderDidUpdateNotifierEvent);cdecl;
	
	//{
	// * serviceCurrentRadioAccessTechnology
	// *
	// * Discussion:
	// *   A dictionary containing the current radio access technology each service is registered. The key to the dictionary
	// *   is an NSString representing the service.  An entry may be nil if the service is not registered on any network.
	// }
	//@property (nonatomic, readonly, retain, nullable) NSDictionary<NSString *, NSString *> * serviceCurrentRadioAccessTechnology API_AVAILABLE(ios(12.0), watchos(5.0)) API_UNAVAILABLE(macos, tvos);
	function serviceCurrentRadioAccessTechnology:NSDictionary{NSString*, NSString *};cdecl;
	procedure setServiceCurrentRadioAccessTechnology(serviceCurrentRadioAccessTechnology:NSDictionary{NSString*, NSString *});cdecl;
	
	//{
	// * currentRadioAccessTechnology
	// *
	// * Discussion:
	// *   The current radio access technology for each service of the device is registered with. May be nil
	// *   if the device is not registered on any network.
	// }
	//@property (nonatomic, readonly, retain, nullable) NSString* currentRadioAccessTechnology API_DEPRECATED_WITH_REPLACEMENT("serviceCurrentRadioAccessTechnology", ios(7.0, 12.0)) API_UNAVAILABLE(macos);
	function currentRadioAccessTechnology:NSString;cdecl;
	procedure setCurrentRadioAccessTechnology(currentRadioAccessTechnology:NSString);cdecl;
	
	////@end
	
	//NS_ASSUME_NONNULL_END
	
{$ENDIF}

implementation

{$IFDEF IOS}
{@protocol} function @optional          -(:oid)dataServiceIdentifierDidChange:(NSString):CTTelephonyNetworkInfoDelegate{NSObject};cdecl;external {$I FrameworkDylibPath_CoreTelephony.inc} name _PU + '@optional          -'

{$O-}
{$O+}



{$ENDIF}

end.

