/*!
 *  \~chinese
 *  @header PTCommandCommon.h
 *  @abstract 公共指令
 *
 *  \~english
 *  @header PTCommandCommon.h
 *  @abstract Common Command
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTCommandCommon : NSObject

@property(nonatomic, strong) NSMutableData * _Nonnull cmdData;

/*!
 *  \~chinese
 *
 *  获取打印机型号
 *
 *  @brief 获取打印机型号.
 *
 *  \~english
 *
 *  Get printer model
 *
 *  @brief Get printer model
 *
 */
- (void)getPrinterModelName;

/*!
 *  \~chinese
 *
 *  获取打印机固件版本号
 *
 *  @brief 获取打印机固件版本号
 *
 *  \~english
 *
 *  Get the printer firmware version number
 *
 *  @brief Get the printer firmware version number
 *
 */
- (void)getPrinterFirmwareVersion;


//=========================固件升级旧的方式=================
//=========================The old way of firmware upgrade=================


/*!
 *  \~chinese
 *
 *  打印机固件升级，包是固定大小
 *
 *  @brief 打印机固件升级.
 *
 *  \~english
 *
 *  Printer firmware upgrade, the package is a fixed size
 *
 *  @brief Printer firmware upgrade.
 *
 */
- (void)updatePrinterFirmwareWithData:(NSData *)data;



//=========================固件升级新的方式 需要固件支持=================
//=========================New way of firmware upgrade=================


/*!
 *  \~chinese
 *
 *  获取升级固件包的大小
 *
 *  @brief 获取升级固件包的大小.
 *
 *  \~english
 *
 *  Get the size of each package of the upgraded firmware
 *
 *  @brief Get the size of each package of the upgraded firmware.
 *
 */
- (void)getUpdatePrinterFirmwarePackage;


/*!
 *  \~chinese
 *
 *  升级打印机固件.
 *
 *  @brief 升级打印机固件.
 *  @param data         固件数据.
 *  @param package      包大小
 *
 *  \~english
 *
 *  Upgrade printer firmware.
 *
 *  @brief Upgrade printer firmware.
 *  @param data         data
 *  @param package      Packet size
 *
 */
- (void)updateDeviceFirmwareWithData:(NSData *)data package:(NSInteger)package;




@end

NS_ASSUME_NONNULL_END
