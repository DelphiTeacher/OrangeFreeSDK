//{!
// *  \~chinese
// *  @header     PTPrinter.h
// *  @abstract   ��ӡ������
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
	// *  ���ӷ�ʽ
	// *
	// *  \~english
	// *
	// *  Connection method
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTPrinterModule) {
	    //PTPrinterModuleBLE        = 0,  ///< \~chinese ���� \~english BLE
	    //PTPrinterModuleWiFi       = 1,  ///< \~chinese ��̫�� \~english LAN/WiFi
	//};
	//typedef NS_ENUM(NSInteger, PTPrinterModule) {
	PTPrinterModule_=(
	//(NSInteger, PTPrinterModule) {
	    PTPrinterModuleBLE        = 0,  ///< \~chinese ���� \~english BLE
	    PTPrinterModuleWiFi       = 1//,  ///< \~chinese ��̫�� \~english LAN/WiFi
	);
	PTPrinterModule=Integer;
	
	
	
	
	
	//@interface PTPrinter : NSObject
	//@interface PTPrinter : NSObject
	PTPrinter=interface(NSObject)//
	['{CD308B9B-38BB-499A-847D-448DE9E6E1F0}']
		
		/////< \~chinese �������� \~english ble name
		//@property(strong,nonatomic,readwrite) NSString *name;
		function name:NSString;cdecl;
		procedure setName(name:NSString);cdecl;
		/////< \~chinese ���������ַ \~english mac address
		//@property(strong,nonatomic,readwrite) NSString *mac;
		function mac:NSString;cdecl;
		procedure setMac(mac:NSString);cdecl;
		/////< \~chinese ���ӷ�ʽ \~english connect style
		//@property(assign,nonatomic,readwrite) PTPrinterModule module;
		function module:PTPrinterModule;cdecl;
		procedure setModule(module:PTPrinterModule);cdecl;
		/////< \~chinese ��������UUID \~english Unique identifier
		//@property(strong,nonatomic,readwrite) NSString *uuid;
		function uuid:NSString;cdecl;
		procedure setUuid(uuid:NSString);cdecl;
		/////< \~chinese �ź�ǿ��ֵ����λ�ֱ� \~english rssi
		//@property(strong,nonatomic,readwrite) NSNumber *rssi;
		function rssi:NSNumber;cdecl;
		procedure setRssi(rssi:NSNumber);cdecl;
		/////< \~chinese �ź�ǿ�� \~english Signal strength
		//@property(strong,nonatomic,readwrite) NSNumber *strength;
		function strength:NSNumber;cdecl;
		procedure setStrength(strength:NSNumber);cdecl;
		/////< \~chinese ���� \~english distance
		//@property(strong,nonatomic,readwrite) NSNumber *distance;
		function distance:NSNumber;cdecl;
		procedure setDistance(distance:NSNumber);cdecl;
		/////< \~chinese �������� \~english peripheral
		//@property(strong,nonatomic,readwrite) CBPeripheral *peripheral;
		function peripheral:CBPeripheral;cdecl;
		procedure setPeripheral(peripheral:CBPeripheral);cdecl;
		/////< \~chinese ip��ַ \~english ip
		//@property(strong,nonatomic,readwrite) NSString *ip;
		function ip:NSString;cdecl;
		procedure setIp(ip:NSString);cdecl;
		/////< \~chinese �˿� \~english port
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

