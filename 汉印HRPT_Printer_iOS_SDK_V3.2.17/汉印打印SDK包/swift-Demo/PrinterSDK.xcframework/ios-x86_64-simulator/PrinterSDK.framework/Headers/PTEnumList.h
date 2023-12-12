//
//  PTEnumList.h
//  PrinterSDK
//
//  Created by ios on 2021/12/3.
//  Copyright © 2021 Mellow. All rights reserved.
//

#ifndef PTEnumList_h
#define PTEnumList_h

/**
 *  \~chinese
 *
 *  连接方式
 *
 *  \~english
 *
 *  Connection method
 *
 */
typedef NS_ENUM(NSInteger, PTDispatchMode) {
    PTDispatchModeBLE        = 0, ///< \~chinese 蓝牙 \~english BLE
    PTDispatchModeWiFi       = 1 ///< \~chinese 以太网 \~english LAN/WiFi
};

/**
 *  \~chinese
 *
 *  蓝牙状态,如果需要使用，则在AppDelegate初始化PTDispatch
 *
 *  \~english
 *
 *  Bluetooth status, if you need to use it, initialize PTDispatch in AppDelegate
 *
 */
typedef NS_ENUM(NSInteger, PTBluetoothState) {
    PTBluetoothStateUnauthorized  = 0, ///< \~chinese 未授权，请前往系统设置授权 \~english unauthorized
    PTBluetoothStatePoweredOff  = 1, ///< \~chinese 蓝牙未开 \~english Bluetooth off
    PTBluetoothStatePoweredOn  = 2, ///< \~chinese 正常 \~english Bluetooth on
};

/**
 *  \~chinese
 *
 *  打印完成后打印机返回的状态,部分机型才有该功能
 *
 *  \~english
 *
 *  The status returned by the printer after printing, some models only have this function
 *
 */
typedef NS_ENUM(NSInteger, PTPrintState) {
    PTPrintStateSuccess             = 0xcc00, ///< \~chinese 打印成功 \~english Print successfully
    PTPrintStateFailurePaperEmpty   = 0xcc01, ///< \~chinese 打印失败（缺纸） \~english Printing failed (out of paper）
    PTPrintStateFailureLidOpen      = 0xcc02 ///< \~chinese 打印失败（开盖） \~english Printing failed (Open the lid）
};


/**
 *  \~chinese
 *
 *  连接错误的类型
 *
 *  \~english
 *
 *  Type of connection error
 *
 */
typedef NS_ENUM(NSInteger, PTConnectError) {
    PTConnectErrorBleTimeout                  = 0, ///< \~chinese 蓝牙连接超时 \~english Bluetooth connection timed out
    PTConnectErrorBleDisvocerServiceTimeout   = 1, ///< \~chinese 获取服务超时 \~english Get service timed out
    PTConnectErrorBleValidateTimeout          = 2, ///< \~chinese 验证超时 \~english Print Verification timed out
    PTConnectErrorBleUnknownDevice            = 3, ///< \~chinese 未知设备 \~english Unknown device
    PTConnectErrorBleSystem                   = 4, ///< \~chinese 系统错误 \~english System error
    PTConnectErrorBleValidateFail             = 5, ///< \~chinese 验证失败 \~english Verification failed
    PTConnectErrorStreamTimeout               = 6, ///< \~chinese 流打开超时 \~english Stream open timeout
    PTConnectErrorStreamEmpty                 = 7, ///< \~chinese 打开的是空流 \~english Empty stream
    PTConnectErrorStreamOccured               = 8  ///< \~chinese 流发生错误 \~english An error has occurred on the stream
};

/**
 *  \~chinese
 *
 *  固件升级错误类型
 *
 *  \~english
 *
 *  Firmware upgrade error type
 *
 */
typedef NS_ENUM(NSInteger, PTUpgradeFirmwareState) {
    PTUpgradeFirmwareStateSuccess                   = 0, ///< \~chinese 升级成功 \~english Update successed
    PTUpgradeFirmwareStateFailureDataLengthError, ///< \~chinese 升级失败，数据长度错误 \~english Data length error
    PTUpgradeFirmwareStateFailureValidateFail, ///< \~chinese 升级失败，验证或者校验失败 \~english Verification failed
    PTUpgradeFirmwareStateFailureWriteTimout, ///< \~chinese 升级失败，写入超时 \~english Write timeout
    PTUpgradeFirmwareStateFailurePackageNumberError, ///< \~chinese 升级失败，包序号错误 \~english Wrong packet sequence number
    PTUpgradeFirmwareStateFailurePackageLengthError, ///< \~chinese 升级失败，包长度错误 \~english Packet length error
    PTUpgradeFirmwareStateFailureWriteFail, ///< \~chinese 升级失败，写入失败 \~english Write failed
    PTUpgradeFirmwareStateFail ///< \~chinese 升级失败 \~english Upgrade failed
};


/**
 *  \~chinese
 *
 *  自动回传状态(ESC)
 *
 *  \~english
 *
 *  Automatic Status（ESC）
 *
 */
typedef NS_OPTIONS(u_int8_t, PTESCPrinterAutoStatus) {
    PTESCPrinterAutoStatusNone            = 0,      ///< \~chinese 正常 \~english Normal
    PTESCPrinterAutoStatusCoverOpen       = 1 << 0, ///< \~chinese 开盖 \~english Cover is open
    PTESCPrinterAutoStatusOutOfPaper      = 1 << 1, ///< \~chinese 缺纸 \~english Roll paper end sensor: paper not present
    PTESCPrinterAutoStatusCutterError     = 1 << 2, ///< \~chinese 自动切刀错误 \~english Autocutter error occurred.
    PTESCPrinterAutoStatusOffline         = 1 << 3  ///< \~chinese 离线，表示有异常错误 \~english Offline,has error occurred
};

/**
 *  \~chinese
 *
 *  打印成功(ESC)
 *
 *  \~english
 *
 *  Print successful（ESC）
 *
 */
typedef NS_ENUM(NSInteger, PTESCPrintResult) {
    PTESCPrintResultSuccess            = 0,
};


/**
 *  \~chinese
 *
 *  固件升级错误类型
 *
 *  \~english
 *
 *  Firmware upgrade error type
 *
 */
typedef void(^PTPrinterMutableArrayBlock)(NSMutableArray<PTPrinter *> *printerArray);


/**
 *  \~chinese
 *
 *  定义没有返回值的Block，eg:用于发送失败回调、连接成功回调
 *
 *  \~english
 *
 *  Define the block without return value, eg: used for sending failure callback, connection success callback
 *
 */
typedef void(^PTEmptyParameterBlock)(void);


/**
 *  \~chinese
 *
 *  定义连接失败回调的Block
 *
 *  \~english
 *
 *  Define the block for connection failure callback
 *
 */
typedef void(^PTBluetoothConnectFailBlock)(PTConnectError error);


/**
 *  \~chinese
 *
 *  定义返回NSNumber类型回调的Block，eg:发送进度回调、读取RSSI回调
 *
 *  \~english
 *
 *  Define the block that returns the NSNumber type callback, eg: send progress callback, read RSSI callback
 *
 */
typedef void(^PTNumberParameterBlock)(NSNumber *number);


/**
 *  \~chinese
 *
 *  定义接收设备返回数据的Block
 *
 *  \~english
 *
 *  Define the block of the data returned by the receiving device
 *
 */
typedef void(^PTDataParameterBlock)(NSData *data);


/**
 *  \~chinese
 *
 *  定义打印完成状态回调的Block
 *
 *  \~english
 *
 *  Define the block of the print completion status callback
 *
 */
typedef void(^PTPrintStateBlock)(PTPrintState state);

/**
 *  \~chinese
 *
 *  定义ESC指令自动回传异常状态回调
 *
 *  \~english
 *
 *  Define the ESC command to automatically return the abnormal state callback
 *
 */
typedef void(^PTESCPrinterAutoStatusBlock)(PTESCPrinterAutoStatus status);

/**
 *  \~chinese
 *
 *  定义ESC指令打印完成成功的Block
 *
 *  \~english
 *
 *  Define the block where the ESC command is successfully printed
 *
 */
typedef void(^PTESCPrintResultBlock)(PTESCPrintResult result);

/**
 *  \~chinese
 *
 *  过滤外设的Block
 *
 *  \~english
 *
 *  Filter Peripheral Block
 *
 */
typedef BOOL(^PTPeripheralFilterBlock)(CBPeripheral *peripheral, NSDictionary<NSString *,id> *advertisementData, NSNumber *RSSI);

/**
 *  \~chinese
 *
 *  定义连接断开回调的Block，参数YES表示主动断开，NO表示被动断开
 *
 *  \~english
 *
 *  Define the block for disconnection callback, the parameter YES means active disconnection, NO means passive disconnection
 *
 */
typedef void(^PTUnconnectBlock)(BOOL isActive);


/**
 *  \~chinese
 *
 *  定义数据发送成功回调的Block
 *
 *  \~english
 *
 *  Define the block for the successful callback of data transmission
 *
 */
typedef void(^PTSendSuccessParameterBlock)(int64_t dataCount, double time);


/**
 *  \~chinese
 *
 *  定义固件升级回调的Block
 *
 *  \~english
 *
 *  Define the block of the firmware upgrade callback
 *
 */
typedef void(^PTUpgradeFirmwareStateBlock)(PTUpgradeFirmwareState state);

#endif /* PTEnumList_h */
