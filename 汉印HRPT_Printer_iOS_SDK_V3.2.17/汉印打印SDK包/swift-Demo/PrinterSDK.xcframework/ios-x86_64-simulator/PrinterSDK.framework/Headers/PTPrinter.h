/*!
 *  \~chinese
 *  @header     PTPrinter.h
 *  @abstract   打印机属性
 *
 *  \~english
 *  @header     PTPrinter.h
 *  @abstract   Printer properties
 */

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

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
typedef NS_ENUM(NSInteger, PTPrinterModule) {
    PTPrinterModuleBLE        = 0,  ///< \~chinese 蓝牙 \~english BLE
    PTPrinterModuleWiFi       = 1,  ///< \~chinese 以太网 \~english LAN/WiFi
};

@interface PTPrinter : NSObject

///< \~chinese 蓝牙名称 \~english ble name
@property(strong,nonatomic,readwrite) NSString *name;
///< \~chinese 蓝牙物理地址 \~english mac address
@property(strong,nonatomic,readwrite) NSString *mac;
///< \~chinese 连接方式 \~english connect style
@property(assign,nonatomic,readwrite) PTPrinterModule module;
///< \~chinese 蓝牙外设UUID \~english Unique identifier
@property(strong,nonatomic,readwrite) NSString *uuid;
///< \~chinese 信号强度值，单位分贝 \~english rssi
@property(strong,nonatomic,readwrite) NSNumber *rssi;
///< \~chinese 信号强度 \~english Signal strength
@property(strong,nonatomic,readwrite) NSNumber *strength;
///< \~chinese 距离 \~english distance
@property(strong,nonatomic,readwrite) NSNumber *distance;
///< \~chinese 蓝牙外设 \~english peripheral
@property(strong,nonatomic,readwrite) CBPeripheral *peripheral;
///< \~chinese ip地址 \~english ip
@property(strong,nonatomic,readwrite) NSString *ip;
///< \~chinese 端口 \~english port
@property(strong,nonatomic,readwrite) NSString *port;

@end
