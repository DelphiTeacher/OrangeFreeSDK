//{!
// *  \~chinese
// *  @header     PTDispatcher.h
// *  @abstract   通讯协议
// *
// *  \~english
// *  @header     PTDispatcher.h
// *  @abstract   Protocol
// }

unit iOSApi.PTDispatcher;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	//#import <CoreBluetooth/CoreBluetooth.h>
	Macapi.Bluetooth,
	//#import "SDKDefine.h"
	iOSApi.SDKDefine,
	//#import "PTPrinter.h"
	iOSApi.PTPrinter,
	//#import "PTEnumList.h"
	iOSApi.PTEnumList,
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

	
	//@class PTPrinter;
//	PTPrinter=Pointer;

//	TEvent=function ():{_Nullable}void(^)(NSProgress of object;
//	TEvent=function (): of object;
	//@interface PTDispatcher : NSObject
	//@interface PTDispatcher : NSObject
	PTDispatcher=interface(NSObject)//
	['{223306D5-4C67-4E4C-B4C9-E81ED604D0E4}']
		
		/////< \~chinese 连接方式 \~english Connection method
		//@property (assign, nonatomic) PTDispatchMode                          mode;
		function mode:PTDispatchMode;cdecl;
		procedure setMode(mode:PTDispatchMode);cdecl;
		/////< \~chinese 连接后的打印机对象 \~english Printer object after connection
		//@property (strong, nonatomic, readwrite) PTPrinter                    * _Nullable printerConnected;
		function printerConnected:PTPrinter;cdecl;
		procedure setPrinterConnected(printerConnected:PTPrinter);cdecl;
		//@property (copy, nonatomic, readwrite) PTSendSuccessParameterBlock    _Nullable sendSuccessBlock;
		function sendSuccessBlock:PTSendSuccessParameterBlock;cdecl;
		procedure setSendSuccessBlock(sendSuccessBlock:PTSendSuccessParameterBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTEmptyParameterBlock          _Nullable sendFailureBlock;
		function sendFailureBlock:PTEmptyParameterBlock;cdecl;
		procedure setSendFailureBlock(sendFailureBlock:PTEmptyParameterBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTNumberParameterBlock         _Nullable sendProgressBlock;
		function sendProgressBlock:PTNumberParameterBlock;cdecl;
		procedure setSendProgressBlock(sendProgressBlock:PTNumberParameterBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTDataParameterBlock           _Nullable receiveDataBlock;
		function receiveDataBlock:PTDataParameterBlock;cdecl;
		procedure setReceiveDataBlock(receiveDataBlock:PTDataParameterBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTPrintStateBlock              _Nullable printStateBlock;
		function printStateBlock:PTPrintStateBlock;cdecl;
		procedure setPrintStateBlock(printStateBlock:PTPrintStateBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTESCPrinterAutoStatusBlock    _Nullable autoStatusBlock;
		function autoStatusBlock:PTESCPrinterAutoStatusBlock;cdecl;
		procedure setAutoStatusBlock(autoStatusBlock:PTESCPrinterAutoStatusBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTESCPrintResultBlock          _Nullable printResultBlock;
		function printResultBlock:PTESCPrintResultBlock;cdecl;
		procedure setPrintResultBlock(printResultBlock:PTESCPrintResultBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTPrinterMutableArrayBlock     _Nullable findAllPeripheralBlock;
		function findAllPeripheralBlock:PTPrinterMutableArrayBlock;cdecl;
		procedure setFindAllPeripheralBlock(findAllPeripheralBlock:PTPrinterMutableArrayBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTEmptyParameterBlock          _Nullable connectSuccessBlock;
		function connectSuccessBlock:PTEmptyParameterBlock;cdecl;
		procedure setConnectSuccessBlock(connectSuccessBlock:PTEmptyParameterBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTBluetoothConnectFailBlock    _Nullable connectFailBlock;
		function connectFailBlock:PTBluetoothConnectFailBlock;cdecl;
		procedure setConnectFailBlock(connectFailBlock:PTBluetoothConnectFailBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTUnconnectBlock               _Nullable unconnectBlock;
		function unconnectBlock:PTUnconnectBlock;cdecl;
		procedure setUnconnectBlock(unconnectBlock:PTUnconnectBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTNumberParameterBlock         _Nullable readRSSIBlock;
		function readRSSIBlock:PTNumberParameterBlock;cdecl;
		procedure setReadRSSIBlock(readRSSIBlock:PTNumberParameterBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTPeripheralFilterBlock        _Nullable peripheralFilterBlock;
//		function peripheralFilterBlock:PTPeripheralFilterBlock;cdecl;
//		procedure setPeripheralFilterBlock(peripheralFilterBlock:PTPeripheralFilterBlock);cdecl;
		//@property (copy, nonatomic, readwrite) PTUpgradeFirmwareStateBlock    _Nullable upgradeFirmwareStateBlock;
//		function upgradeFirmwareStateBlock:PTUpgradeFirmwareStateBlock;cdecl;
//		procedure setUpgradeFirmwareStateBlock(upgradeFirmwareStateBlock:PTUpgradeFirmwareStateBlock);cdecl;

		//{*
		// *  \~chinese
		// *
		// *  创建单例对象
		// *
		// *  \~english
		// *
		// *  Create a singleton object
		// *
		// }
		
		//{*
		// *  \~chinese
		// *
		// *  初始化蓝牙中心，目的是为了获取蓝牙状态，建议在AppDelegate中使用
		// *
		// *  \~english
		// *
		// *  Initialize the Bluetooth center, the purpose is to obtain the Bluetooth status, it is recommended to use in AppDelegate
		// *
		// }
		//- (void)initBleCentral;
		procedure initBleCentral;cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  发送数据
		// *
		// *  @param data 数据
		// *
		// *  \~english
		// *
		// *  send data
		// *
		// *  @param data data
		// *
		// }
		//- (void)sendData:(NSData * _Nullable)data;
		procedure sendData(data:{_Nullable}NSData);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  固件升级
		// *
		// *  @param data 数据
		// *  @param block 升级进度
		// *  @param failBlock 升级失败
		// *
		// *  \~english
		// *
		// *  firmware update
		// *
		// *  @param data data
		// *  @param block progress block
		// *  @param failBlock fail block
		// *
		// }
		//- (void)writeFirmwareData:(NSData * _Nullable)data progress:(void(^_Nullable)(NSProgress * _Nullable))block fail:(void(^_Nullable)(void))failBlock;
//		[MethodName('writeFirmwareData:progress:fail:')]
//		procedure writeFirmwareDataprogressfail(data:{_Nullable}NSData;block:{_Nullable}void(^)(NSProgress * );failBlock:{_Nullable}void(^)(void));cdecl;

		
		//{*
		// *  \~chinese
		// *
		// *  开启蓝牙扫描
		// *
		// *  \~english
		// *
		// *  Turn on Bluetooth scanning
		// *
		// }
		//- (void)scanBluetooth;
		procedure scanBluetooth;cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  停止蓝牙扫描
		// *
		// *  \~english
		// *
		// *  Stop Bluetooth scanning
		// *
		// }
		//- (void)stopScanBluetooth;
		procedure stopScanBluetooth;cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  获取已发现的所有打印机
		// *
		// *  @param bluetoothBlock callback
		// *
		// *  \~english
		// *
		// *  Get all discovered printers
		// *
		// *  @param bluetoothBlock callback
		// *
		// }
		//- (void)whenFindAllBluetooth:(PTPrinterMutableArrayBlock _Nullable)bluetoothBlock;
		procedure whenFindAllBluetooth(bluetoothBlock:{_Nullable}PTPrinterMutableArrayBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  获取蓝牙RSSI
		// *
		// *  @param readRSSIBlock callback
		// *
		// *  \~english
		// *
		// *  Get Bluetooth RSSI
		// *
		// *  @param readRSSIBlock callback
		// *
		// }
		//- (void)whenReadRSSI:(PTNumberParameterBlock _Nullable)readRSSIBlock;
		procedure whenReadRSSI(readRSSIBlock:{_Nullable}PTNumberParameterBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  连接打印机
		// *
		// *  @param data 打印机对象
		// *
		// *  \~english
		// *
		// *  Connect the printer
		// *
		// *  @param data Printer object
		// *
		// }
		//- (void)connectPrinter:(PTPrinter * _Nullable)printer;
		procedure connectPrinter(printer:{_Nullable}PTPrinter);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  断开打印机连接
		// *
		// *  \~english
		// *
		// *  Disconnect the printer
		// *
		// }
		//- (void)disconnect;
		procedure disconnect;cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  连接成功
		// *
		// *  @param connectSuccessBlock 回调
		// *
		// *  \~english
		// *
		// *  Successful connection callback
		// *
		// *  @param connectSuccessBlock callback
		// *
		// }
		//- (void)whenConnectSuccess:(PTEmptyParameterBlock _Nullable)connectSuccessBlock;
		procedure whenConnectSuccess(connectSuccessBlock:{_Nullable}PTEmptyParameterBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  连接失败
		// *
		// *  @param connectFailBlock 回调
		// *
		// *  \~english
		// *
		// *  Connection failure callback
		// *
		// *  @param connectFailBlock callback
		// *
		// }
		//- (void)whenConnectFailureWithErrorBlock:(PTBluetoothConnectFailBlock _Nullable)connectFailBlock;
		procedure whenConnectFailureWithErrorBlock(connectFailBlock:{_Nullable}PTBluetoothConnectFailBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  断开连接的回调，调用disconnect断开打印机后，会调用该方法
		// *
		// *  @param unconnectBlock 回调
		// *
		// *  \~english
		// *
		// *  Disconnect callback, after calling disconnect to disconnect the printer, this method will be called
		// *
		// *  @param unconnectBlock callback
		// *
		// }
		//- (void)whenUnconnect:(PTUnconnectBlock _Nullable)unconnectBlock;
		procedure whenUnconnect(unconnectBlock:{_Nullable}PTUnconnectBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  数据发送成功回调
		// *
		// *  @param sendSuccessBlock 回调
		// *
		// *  \~english
		// *
		// *  Data sent successfully callback
		// *
		// *  @param sendSuccessBlock callback
		// *
		// }
		//- (void)whenSendSuccess:(PTSendSuccessParameterBlock _Nullable)sendSuccessBlock;
		procedure whenSendSuccess(sendSuccessBlock:{_Nullable}PTSendSuccessParameterBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  数据发送失败回调
		// *
		// *  @param sendFailureBlock 回调
		// *
		// *  \~english
		// *
		// *  Data sent failure callback
		// *
		// *  @param sendFailureBlock callback
		// *
		// }
		//- (void)whenSendFailure:(PTEmptyParameterBlock _Nullable)sendFailureBlock;
		procedure whenSendFailure(sendFailureBlock:{_Nullable}PTEmptyParameterBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  数据发送进度回调
		// *
		// *  @param sendProgressBlock 回调
		// *
		// *  \~english
		// *
		// *  Data sending progress callback
		// *
		// *  @param sendProgressBlock callback
		// *
		// }
		//- (void)whenSendProgressUpdate:(PTNumberParameterBlock _Nullable)sendProgressBlock;
		procedure whenSendProgressUpdate(sendProgressBlock:{_Nullable}PTNumberParameterBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  接收设备返回数据的回调
		// *
		// *  @param receiveDataBlock 回调
		// *
		// *  \~english
		// *
		// *  The callback of the data returned by the receiving device
		// *
		// *  @param receiveDataBlock callback
		// *
		// }
		//- (void)whenReceiveData:(PTDataParameterBlock _Nullable)receiveDataBlock;
		procedure whenReceiveData(receiveDataBlock:{_Nullable}PTDataParameterBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  接收到打印机打印状态回调，使用该方法前，需要保证打印机打开了状态回调的开关，比如CPCL指令集中的cpclTurnOnPrintStatusCallBack方法，ESC中的turnOnPrintStatusCallBack方法
		// *
		// *  @param printStateBlock 回调
		// *
		// *  \~english
		// *
		// *  Receive the printer print status callback, before using this method, you need to ensure that the printer is turned on the status callback switch, such as the cpclTurnOnPrintStatusCallBack method in the CPCL command set, and the turnOnPrintStatusCallBack method in the ESC
		// *
		// *  @param printStateBlock callback
		// *
		// }
		//- (void)whenUpdatePrintState:(PTPrintStateBlock _Nullable)printStateBlock;
		procedure whenUpdatePrintState(printStateBlock:{_Nullable}PTPrintStateBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  外设过滤
		// *
		// *  @param block 回调
		// *
		// *  \~english
		// *
		// *  Peripheral filtering
		// *
		// *  @param block callback
		// *
		// }
		//- (void)setupPeripheralFilter:(PTPeripheralFilterBlock _Nullable)block;
		procedure setupPeripheralFilter(block:{_Nullable}PTPeripheralFilterBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  注册蓝牙中心，该接口用于兼容你自己实现的CoreBluetooth框架
		// *
		// *  \~english
		// *
		// *  Register with the Bluetooth center, this interface is used to be compatible with the CoreBluetooth framework that you implement yourself
		// *
		// }
		//- (void)registerCentralManager:(CBCentralManager * _Nullable)manager delegate:(id<CBCentralManagerDelegate> _Nullable)delegate;
		[MethodName('registerCentralManager:delegate:')]
		procedure registerCentralManagerdelegate(manager:{_Nullable}CBCentralManager;delegate:{_Nullable}id{<CBCentralManagerDelegate>});cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  注销代理
		// *
		// *  \~english
		// *
		// *  Log off agent
		// *
		// }
		//- (void)unregisterDelegate;
		procedure unregisterDelegate;cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  固件升级的回调,如果使用writeFirmwareData接口升级固件，那么不需要使用该回调
		// *
		// *  @param upgradeFirmwareStateBlock 回调
		// *
		// *  \~english
		// *
		// *  Callback of firmware upgrade，This callback is not required if the firmware is upgraded using the writeFirmwareData interface
		// *
		// *  @param upgradeFirmwareStateBlock callback
		// *
		// }
		//- (void)whenUpgradeFirmwareStateBlock:(PTUpgradeFirmwareStateBlock _Nullable)upgradeFirmwareStateBlock;
		procedure whenUpgradeFirmwareStateBlock(upgradeFirmwareStateBlock:{_Nullable}PTUpgradeFirmwareStateBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  获取蓝牙状态,获取该状态需要先初始化蓝牙中心，[[PTDispatcher share] initBleCentral]
		// *
		// *  \~english
		// *
		// *  Get Bluetooth status,[[PTDispatcher share] initBleCentral]
		// *
		// }
		//- (PTBluetoothState)getBluetoothStatus;
		function getBluetoothStatus:PTBluetoothState;cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  ESC异常状态回调
		// *
		// *  @param autoStateBlock 回调
		// *
		// *  \~english
		// *
		// *  ESC abnormal status callback
		// *
		// *  @param autoStateBlock callback
		// *
		// }
		//- (void)whenESCAutomaticState:(PTESCPrinterAutoStatusBlock _Nullable)autoStateBlock;
		procedure whenESCAutomaticState(autoStateBlock:{_Nullable}PTESCPrinterAutoStatusBlock);cdecl;
		
		
		
		//{*
		// *  \~chinese
		// *
		// *  ESC打印成功回调
		// *
		// *  @param resultBlock 回调
		// *
		// *  \~english
		// *
		// *  ESC print success callback
		// *
		// *  @param resultBlock callback
		// *
		// }
		//- (void)whenESCPrintSuccess:(PTESCPrintResultBlock _Nullable)resultBlock;
		procedure whenESCPrintSuccess(resultBlock:{_Nullable}PTESCPrintResultBlock);cdecl;
		
		
		//- (NSString * _Nullable)SDKBuildTime;
		function SDKBuildTime:{_Nullable}NSString;cdecl;
		
		
	end;
	
	PTDispatcherClass=interface(NSObjectClass)//
	['{F1326B2E-1D09-4541-8DDF-0D8FB1206653}']
		//+ (instancetype)share;
		function share:PTDispatcher;cdecl;
		
	end;
	
	TPTDispatcher=class(TOCGenericImport<PTDispatcherClass,PTDispatcher>)
	end;
	
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTDispatcher_FakeLoader : PTDispatcher; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTDispatcher';
{$O+}



{$ENDIF}

end.

