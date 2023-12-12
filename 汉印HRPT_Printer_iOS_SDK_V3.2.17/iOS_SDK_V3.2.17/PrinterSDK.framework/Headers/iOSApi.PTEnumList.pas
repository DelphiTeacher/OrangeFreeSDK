unit iOSApi.PTEnumList;

interface

{$IFDEF IOS}
uses
	MacApi.ObjectiveC,
	MacApi.Bluetooth,
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

	////
	////  PTEnumList.h
	////  PrinterSDK
	////
	////  Created by ios on 2021/12/3.
	////  Copyright ? 2021 Mellow. All rights reserved.
	////
	
	////#ifndef PTEnumList_h
	
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
	//typedef NS_ENUM(NSInteger, PTDispatchMode) {
	    //PTDispatchModeBLE        = 0, ///< \~chinese 蓝牙 \~english BLE
	    //PTDispatchModeWiFi       = 1 ///< \~chinese 以太网 \~english LAN/WiFi
	//};
	//typedef NS_ENUM(NSInteger, PTDispatchMode) {
	PTDispatchMode_=(
	//(NSInteger, PTDispatchMode) {
	    PTDispatchModeBLE        = 0, ///< \~chinese 蓝牙 \~english BLE
	    PTDispatchModeWiFi       = 1 ///< \~chinese 以太网 \~english LAN/WiFi
	);
	PTDispatchMode=Integer;
	
	

	
	
	//{*
	// *  \~chinese
	// *
	// *  蓝牙状态,如果需要使用，则在AppDelegate初始化PTDispatch
	// *
	// *  \~english
	// *
	// *  Bluetooth status, if you need to use it, initialize PTDispatch in AppDelegate
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTBluetoothState) {
	    //PTBluetoothStateUnauthorized  = 0, ///< \~chinese 未授权，请前往系统设置授权 \~english unauthorized
	    //PTBluetoothStatePoweredOff  = 1, ///< \~chinese 蓝牙未开 \~english Bluetooth off
	    //PTBluetoothStatePoweredOn  = 2, ///< \~chinese 正常 \~english Bluetooth on
	//};
	//typedef NS_ENUM(NSInteger, PTBluetoothState) {
	PTBluetoothState_=(
	//(NSInteger, PTBluetoothState) {
	    PTBluetoothStateUnauthorized  = 0, ///< \~chinese 未授权，请前往系统设置授权 \~english unauthorized
	    PTBluetoothStatePoweredOff  = 1, ///< \~chinese 蓝牙未开 \~english Bluetooth off
	    PTBluetoothStatePoweredOn  = 2//, ///< \~chinese 正常 \~english Bluetooth on
	);
	PTBluetoothState=Integer;
	
	
	
	
	
	//{*
	// *  \~chinese
	// *
	// *  打印完成后打印机返回的状态,部分机型才有该功能
	// *
	// *  \~english
	// *
	// *  The status returned by the printer after printing, some models only have this function
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTPrintState) {
	    //PTPrintStateSuccess             = 0xcc00, ///< \~chinese 打印成功 \~english Print successfully
	    //PTPrintStateFailurePaperEmpty   = 0xcc01, ///< \~chinese 打印失败（缺纸） \~english Printing failed (out of paper）
	    //PTPrintStateFailureLidOpen      = 0xcc02 ///< \~chinese 打印失败（开盖） \~english Printing failed (Open the lid）
	//};
	//typedef NS_ENUM(NSInteger, PTPrintState) {
	PTPrintState_=(
	//(NSInteger, PTPrintState) {
	    PTPrintStateSuccess             = $cc00, ///< \~chinese 打印成功 \~english Print successfully
	    PTPrintStateFailurePaperEmpty   = $cc01, ///< \~chinese 打印失败（缺纸） \~english Printing failed (out of paper）
	    PTPrintStateFailureLidOpen      = $cc02 ///< \~chinese 打印失败（开盖） \~english Printing failed (Open the lid）
	);
	PTPrintState=Integer;
	
	
	
	
	
	
	//{*
	// *  \~chinese
	// *
	// *  连接错误的类型
	// *
	// *  \~english
	// *
	// *  Type of connection error
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTConnectError) {
	    //PTConnectErrorBleTimeout                  = 0, ///< \~chinese 蓝牙连接超时 \~english Bluetooth connection timed out
	    //PTConnectErrorBleDisvocerServiceTimeout   = 1, ///< \~chinese 获取服务超时 \~english Get service timed out
	    //PTConnectErrorBleValidateTimeout          = 2, ///< \~chinese 验证超时 \~english Print Verification timed out
	    //PTConnectErrorBleUnknownDevice            = 3, ///< \~chinese 未知设备 \~english Unknown device
	    //PTConnectErrorBleSystem                   = 4, ///< \~chinese 系统错误 \~english System error
	    //PTConnectErrorBleValidateFail             = 5, ///< \~chinese 验证失败 \~english Verification failed
	    //PTConnectErrorStreamTimeout               = 6, ///< \~chinese 流打开超时 \~english Stream open timeout
	    //PTConnectErrorStreamEmpty                 = 7, ///< \~chinese 打开的是空流 \~english Empty stream
	    //PTConnectErrorStreamOccured               = 8  ///< \~chinese 流发生错误 \~english An error has occurred on the stream
	//};
	//typedef NS_ENUM(NSInteger, PTConnectError) {
	PTConnectError_=(
	//(NSInteger, PTConnectError) {
	    PTConnectErrorBleTimeout                  = 0, ///< \~chinese 蓝牙连接超时 \~english Bluetooth connection timed out
	    PTConnectErrorBleDisvocerServiceTimeout   = 1, ///< \~chinese 获取服务超时 \~english Get service timed out
	    PTConnectErrorBleValidateTimeout          = 2, ///< \~chinese 验证超时 \~english Print Verification timed out
	    PTConnectErrorBleUnknownDevice            = 3, ///< \~chinese 未知设备 \~english Unknown device
	    PTConnectErrorBleSystem                   = 4, ///< \~chinese 系统错误 \~english System error
	    PTConnectErrorBleValidateFail             = 5, ///< \~chinese 验证失败 \~english Verification failed
	    PTConnectErrorStreamTimeout               = 6, ///< \~chinese 流打开超时 \~english Stream open timeout
	    PTConnectErrorStreamEmpty                 = 7, ///< \~chinese 打开的是空流 \~english Empty stream
	    PTConnectErrorStreamOccured               = 8  ///< \~chinese 流发生错误 \~english An error has occurred on the stream
	);
	PTConnectError=Integer;
	
	
	
	
	
	//{*
	// *  \~chinese
	// *
	// *  固件升级错误类型
	// *
	// *  \~english
	// *
	// *  Firmware upgrade error type
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTUpgradeFirmwareState) {
	    //PTUpgradeFirmwareStateSuccess                   = 0, ///< \~chinese 升级成功 \~english Update successed
	    //PTUpgradeFirmwareStateFailureDataLengthError, ///< \~chinese 升级失败，数据长度错误 \~english Data length error
	    //PTUpgradeFirmwareStateFailureValidateFail, ///< \~chinese 升级失败，验证或者校验失败 \~english Verification failed
	    //PTUpgradeFirmwareStateFailureWriteTimout, ///< \~chinese 升级失败，写入超时 \~english Write timeout
	    //PTUpgradeFirmwareStateFailurePackageNumberError, ///< \~chinese 升级失败，包序号错误 \~english Wrong packet sequence number
	    //PTUpgradeFirmwareStateFailurePackageLengthError, ///< \~chinese 升级失败，包长度错误 \~english Packet length error
	    //PTUpgradeFirmwareStateFailureWriteFail, ///< \~chinese 升级失败，写入失败 \~english Write failed
	    //PTUpgradeFirmwareStateFail ///< \~chinese 升级失败 \~english Upgrade failed
	//};
	//typedef NS_ENUM(NSInteger, PTUpgradeFirmwareState) {
	PTUpgradeFirmwareState_=(
	//(NSInteger, PTUpgradeFirmwareState) {
	    PTUpgradeFirmwareStateSuccess                   = 0, ///< \~chinese 升级成功 \~english Update successed
	    PTUpgradeFirmwareStateFailureDataLengthError, ///< \~chinese 升级失败，数据长度错误 \~english Data length error
	    PTUpgradeFirmwareStateFailureValidateFail, ///< \~chinese 升级失败，验证或者校验失败 \~english Verification failed
	    PTUpgradeFirmwareStateFailureWriteTimout, ///< \~chinese 升级失败，写入超时 \~english Write timeout
	    PTUpgradeFirmwareStateFailurePackageNumberError, ///< \~chinese 升级失败，包序号错误 \~english Wrong packet sequence number
	    PTUpgradeFirmwareStateFailurePackageLengthError, ///< \~chinese 升级失败，包长度错误 \~english Packet length error
	    PTUpgradeFirmwareStateFailureWriteFail, ///< \~chinese 升级失败，写入失败 \~english Write failed
	    PTUpgradeFirmwareStateFail ///< \~chinese 升级失败 \~english Upgrade failed
	);
	PTUpgradeFirmwareState=Integer;
	
	
	
	
	
	
	//{*
	// *  \~chinese
	// *
	// *  自动回传状态(ESC)
	// *
	// *  \~english
	// *
	// *  Automatic Status（ESC）
	// *
	// }
	//typedef NS_OPTIONS(u_int8_t, PTESCPrinterAutoStatus) {

	//typedef NS_OPTIONS(u_int8_t, PTESCPrinterAutoStatus) {
	//    PTESCPrinterAutoStatusNone            = 0,      ///< \~chinese 正常 \~english Normal
	//    PTESCPrinterAutoStatusCoverOpen       = 1 << 0, ///< \~chinese 开盖 \~english Cover is open
	//    PTESCPrinterAutoStatusOutOfPaper      = 1 << 1, ///< \~chinese 缺纸 \~english Roll paper end sensor: paper not present
	//    PTESCPrinterAutoStatusCutterError     = 1 << 2, ///< \~chinese 自动切刀错误 \~english Autocutter error occurred.
	//    PTESCPrinterAutoStatusOffline         = 1 << 3  ///< \~chinese 离线，表示有异常错误 \~english Offline,has error occurred
	//};
  PTESCPrinterAutoStatus_=(
	    PTESCPrinterAutoStatusNone            = 0,      ///< \~chinese 正常 \~english Normal
	    PTESCPrinterAutoStatusCoverOpen       = 1,// << 0, ///< \~chinese 开盖 \~english Cover is open
	    PTESCPrinterAutoStatusOutOfPaper      = 2,//1 << 1, ///< \~chinese 缺纸 \~english Roll paper end sensor: paper not present
	    PTESCPrinterAutoStatusCutterError     = 4,//1 << 2, ///< \~chinese 自动切刀错误 \~english Autocutter error occurred.
	    PTESCPrinterAutoStatusOffline         = 8//1 << 3  ///< \~chinese 离线，表示有异常错误 \~english Offline,has error occurred
  );
  PTESCPrinterAutoStatus=Integer;

	//{*
	// *  \~chinese
	// *
	// *  打印成功(ESC)
	// *
	// *  \~english
	// *
	// *  Print successful（ESC）
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTESCPrintResult) {
	    //PTESCPrintResultSuccess            = 0,
	//};
	//typedef NS_ENUM(NSInteger, PTESCPrintResult) {
	PTESCPrintResult_=(
	//(NSInteger, PTESCPrintResult) {
	    PTESCPrintResultSuccess            = 0//,
	);
	PTESCPrintResult=Integer;
	
	
	
	
	
	
	//{*
	// *  \~chinese
	// *
	// *  固件升级错误类型
	// *
	// *  \~english
	// *
	// *  Firmware upgrade error type
	// *
	// }
	TPTPrinterMutableArrayBlockEvent=procedure (printerArray:NSMutableArray{PTPrinter*}) of object;
  PTPrinterMutableArrayBlock=TPTPrinterMutableArrayBlockEvent;
	//typedef void(^PTPrinterMutableArrayBlock)(NSMutableArray<PTPrinter *> *printerArray);

	//typedef void(^PTPrinterMutableArrayBlock)(NSMutableArray<PTPrinter *> *printerArray);
	
	
	//{*
	// *  \~chinese
	// *
	// *  定义没有返回值的Block，eg:用于发送失败回调、连接成功回调
	// *
	// *  \~english
	// *
	// *  Define the block without return value, eg: used for sending failure callback, connection success callback
	// *
	// }
	TPTEmptyParameterBlockEvent=procedure () of object;
  PTEmptyParameterBlock=TPTEmptyParameterBlockEvent;
	//typedef void(^PTEmptyParameterBlock)(void);

	//typedef void(^PTEmptyParameterBlock)(void);
	
	
	//{*
	// *  \~chinese
	// *
	// *  定义连接失败回调的Block
	// *
	// *  \~english
	// *
	// *  Define the block for connection failure callback
	// *
	// }
	TPTBluetoothConnectFailBlockEvent=procedure (error:PTConnectError) of object;
	//typedef void(^PTBluetoothConnectFailBlock)(PTConnectError error);
  PTBluetoothConnectFailBlock=TPTBluetoothConnectFailBlockEvent;

	//typedef void(^PTBluetoothConnectFailBlock)(PTConnectError error);
	
	
	//{*
	// *  \~chinese
	// *
	// *  定义返回NSNumber类型回调的Block，eg:发送进度回调、读取RSSI回调
	// *
	// *  \~english
	// *
	// *  Define the block that returns the NSNumber type callback, eg: send progress callback, read RSSI callback
	// *
	// }
	TPTNumberParameterBlockEvent=procedure (number:NSNumber) of object;
  PTNumberParameterBlock=TPTNumberParameterBlockEvent;
	//typedef void(^PTNumberParameterBlock)(NSNumber *number);

	//typedef void(^PTNumberParameterBlock)(NSNumber *number);
	
	
	//{*
	// *  \~chinese
	// *
	// *  定义接收设备返回数据的Block
	// *
	// *  \~english
	// *
	// *  Define the block of the data returned by the receiving device
	// *
	// }
	TPTDataParameterBlockEvent=procedure (data:NSData) of object;
  PTDataParameterBlock=TPTDataParameterBlockEvent;
	//typedef void(^PTDataParameterBlock)(NSData *data);

	//typedef void(^PTDataParameterBlock)(NSData *data);
	
	
	//{*
	// *  \~chinese
	// *
	// *  定义打印完成状态回调的Block
	// *
	// *  \~english
	// *
	// *  Define the block of the print completion status callback
	// *
	// }
	TPTPrintStateBlockEvent=procedure (state:PTPrintState) of object;
  PTPrintStateBlock=TPTPrintStateBlockEvent;
	//typedef void(^PTPrintStateBlock)(PTPrintState state);

	//typedef void(^PTPrintStateBlock)(PTPrintState state);
	
	//{*
	// *  \~chinese
	// *
	// *  定义ESC指令自动回传异常状态回调
	// *
	// *  \~english
	// *
	// *  Define the ESC command to automatically return the abnormal state callback
	// *
	// }
	TPTESCPrinterAutoStatusBlockEvent=procedure (status:PTESCPrinterAutoStatus) of object;
  PTESCPrinterAutoStatusBlock=TPTESCPrinterAutoStatusBlockEvent;
	//typedef void(^PTESCPrinterAutoStatusBlock)(PTESCPrinterAutoStatus status);

	//typedef void(^PTESCPrinterAutoStatusBlock)(PTESCPrinterAutoStatus status);
	
	//{*
	// *  \~chinese
	// *
	// *  定义ESC指令打印完成成功的Block
	// *
	// *  \~english
	// *
	// *  Define the block where the ESC command is successfully printed
	// *
	// }
	TPTESCPrintResultBlockEvent=procedure (result:PTESCPrintResult) of object;
  PTESCPrintResultBlock=TPTESCPrintResultBlockEvent;
	//typedef void(^PTESCPrintResultBlock)(PTESCPrintResult result);

	//typedef void(^PTESCPrintResultBlock)(PTESCPrintResult result);
	
	//{*
	// *  \~chinese
	// *
	// *  过滤外设的Block
	// *
	// *  \~english
	// *
	// *  Filter Peripheral Block
	// *
	// }
	//typedef BOOL(^PTPeripheralFilterBlock)(CBPeripheral *peripheral, NSDictionary<NSString *,id> *advertisementData, NSNumber *RSSI);
  PTPeripheralFilterBlock=function(peripheral:CBPeripheral;advertisementData:NSDictionary;RSSI:NSNumber):Boolean of object;
	//typedef BOOL(^PTPeripheralFilterBlock)(CBPeripheral *peripheral, NSDictionary<NSString *,id> *advertisementData, NSNumber *RSSI);
//	peripheral, NSDictionary<NSString *,id> *advertisementData, NSNumber *RSSI)=BOOL(^PTPeripheralFilterBlock)(CBPeripheral*;

	//{*
	// *  \~chinese
	// *
	// *  定义连接断开回调的Block，参数YES表示主动断开，NO表示被动断开
	// *
	// *  \~english
	// *
	// *  Define the block for disconnection callback, the parameter YES means active disconnection, NO means passive disconnection
	// *
	// }
	TPTUnconnectBlockEvent=procedure (isActive:Boolean) of object;
  PTUnconnectBlock=TPTUnconnectBlockEvent;
	//typedef void(^PTUnconnectBlock)(BOOL isActive);

	//typedef void(^PTUnconnectBlock)(BOOL isActive);
	
	
	//{*
	// *  \~chinese
	// *
	// *  定义数据发送成功回调的Block
	// *
	// *  \~english
	// *
	// *  Define the block for the successful callback of data transmission
	// *
	// }
//	TPTSendSuccessParameterBlockEvent=procedure (dataCount:int64_t;time:double) of object;
	TPTSendSuccessParameterBlockEvent=procedure (dataCount:int64;time:double) of object;
  PTSendSuccessParameterBlock=TPTSendSuccessParameterBlockEvent;
	//typedef void(^PTSendSuccessParameterBlock)(int64_t dataCount, double time);


	//typedef void(^PTSendSuccessParameterBlock)(int64_t dataCount, double time);
	
	
	//{*
	// *  \~chinese
	// *
	// *  定义固件升级回调的Block
	// *
	// *  \~english
	// *
	// *  Define the block of the firmware upgrade callback
	// *
	// }
	TPTUpgradeFirmwareStateBlockEvent=procedure (state:PTUpgradeFirmwareState) of object;
  PTUpgradeFirmwareStateBlock=TPTUpgradeFirmwareStateBlockEvent;
	//typedef void(^PTUpgradeFirmwareStateBlock)(PTUpgradeFirmwareState state);

	//typedef void(^PTUpgradeFirmwareStateBlock)(PTUpgradeFirmwareState state);
	
	////#endif /* PTEnumList_h */
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
{$O+}



{$ENDIF}

end.

