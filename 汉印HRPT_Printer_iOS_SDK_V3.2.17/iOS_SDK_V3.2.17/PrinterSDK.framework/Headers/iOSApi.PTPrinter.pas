//{!
// *  \~chinese
// *  @header     PTPrinter.h
// *  @abstract   打印机属性
// *
// *  \~english
// *  @header     PTPrinter.h
// *  @abstract   Printer properties
// }

unit iOSApi.PTPrinter;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	//#import <CoreBluetooth/CoreBluetooth.h>
	MacApi.Bluetooth,
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

	
	//{*
	// *  \~chinese
	// *
	// *  连接方式
	// *
	// *  \~english
	// *
	// *  Connection method
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTPrinterModule) {
	    //PTPrinterModuleBLE        = 0,  ///< \~chinese 蓝牙 \~english BLE
	    //PTPrinterModuleWiFi       = 1,  ///< \~chinese 以太网 \~english LAN/WiFi
	//};
	//typedef NS_ENUM(NSInteger, PTPrinterModule) {
	PTPrinterModule_=(
	//(NSInteger, PTPrinterModule) {
	    PTPrinterModuleBLE        = 0,  ///< \~chinese 蓝牙 \~english BLE
	    PTPrinterModuleWiFi       = 1//,  ///< \~chinese 以太网 \~english LAN/WiFi
	);
	PTPrinterModule=Integer;
	
	
	
	
	
	//@interface PTPrinter : NSObject
	//@interface PTPrinter : NSObject
	PTPrinter=interface(NSObject)//
	['{CD308B9B-38BB-499A-847D-448DE9E6E1F0}']
		
		/////< \~chinese 蓝牙名称 \~english ble name
		//@property(strong,nonatomic,readwrite) NSString *name;
		function name:NSString;cdecl;
		procedure setName(name:NSString);cdecl;
		/////< \~chinese 蓝牙物理地址 \~english mac address
		//@property(strong,nonatomic,readwrite) NSString *mac;
		function mac:NSString;cdecl;
		procedure setMac(mac:NSString);cdecl;
		/////< \~chinese 连接方式 \~english connect style
		//@property(assign,nonatomic,readwrite) PTPrinterModule module;
		function module:PTPrinterModule;cdecl;
		procedure setModule(module:PTPrinterModule);cdecl;
		/////< \~chinese 蓝牙外设UUID \~english Unique identifier
		//@property(strong,nonatomic,readwrite) NSString *uuid;
		function uuid:NSString;cdecl;
		procedure setUuid(uuid:NSString);cdecl;
		/////< \~chinese 信号强度值，单位分贝 \~english rssi
		//@property(strong,nonatomic,readwrite) NSNumber *rssi;
		function rssi:NSNumber;cdecl;
		procedure setRssi(rssi:NSNumber);cdecl;
		/////< \~chinese 信号强度 \~english Signal strength
		//@property(strong,nonatomic,readwrite) NSNumber *strength;
		function strength:NSNumber;cdecl;
		procedure setStrength(strength:NSNumber);cdecl;
		/////< \~chinese 距离 \~english distance
		//@property(strong,nonatomic,readwrite) NSNumber *distance;
		function distance:NSNumber;cdecl;
		procedure setDistance(distance:NSNumber);cdecl;
		/////< \~chinese 蓝牙外设 \~english peripheral
		//@property(strong,nonatomic,readwrite) CBPeripheral *peripheral;
		function peripheral:CBPeripheral;cdecl;
		procedure setPeripheral(peripheral:CBPeripheral);cdecl;
		/////< \~chinese ip地址 \~english ip
		//@property(strong,nonatomic,readwrite) NSString *ip;
		function ip:NSString;cdecl;
		procedure setIp(ip:NSString);cdecl;
		/////< \~chinese 端口 \~english port
		//@property(strong,nonatomic,readwrite) NSString *port;
		function port:NSString;cdecl;
		procedure setPort(port:NSString);cdecl;
		
	end;
	
	PTPrinterClass=interface(NSObjectClass)//
	['{364A16D1-0323-422A-8ED6-C6738AF19C6B}']
	end;
	
	TPTPrinter=class(TOCGenericImport<PTPrinterClass,PTPrinter>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTPrinter_FakeLoader : PTPrinter; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTPrinter';
{$O+}



{$ENDIF}

end.

