//{!
// *  \~chinese
// *  @header PTCommandCommon.h
// *  @abstract 公共指令
// *
// *  \~english
// *  @header PTCommandCommon.h
// *  @abstract Common Command
// }

unit iOSApi.PTCommandCommon;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
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
	
	//@interface PTCommandCommon : NSObject
	//@interface PTCommandCommon : NSObject
	PTCommandCommon=interface(NSObject)//
	['{37D592D1-552F-42D1-B5DC-C9B78A3D4968}']
		
		//@property(nonatomic, strong) NSMutableData * _Nonnull cmdData;
		function _Nonnull:NSMutableData;cdecl;
		procedure set_Nonnull(_Nonnull:NSMutableData);cdecl;
		
		//{!
		// *  \~chinese
		// *
		// *  获取打印机型号
		// *
		// *  @brief 获取打印机型号.
		// *
		// *  \~english
		// *
		// *  Get printer model
		// *
		// *  @brief Get printer model
		// *
		// }
		//- (void)getPrinterModelName;
		procedure getPrinterModelName;cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  获取打印机固件版本号
		// *
		// *  @brief 获取打印机固件版本号
		// *
		// *  \~english
		// *
		// *  Get the printer firmware version number
		// *
		// *  @brief Get the printer firmware version number
		// *
		// }
		//- (void)getPrinterFirmwareVersion;
		procedure getPrinterFirmwareVersion;cdecl;
		
		
		
		////=========================固件升级旧的方式=================
		////=========================The old way of firmware upgrade=================
		
		
		//{!
		// *  \~chinese
		// *
		// *  打印机固件升级，包是固定大小
		// *
		// *  @brief 打印机固件升级.
		// *
		// *  \~english
		// *
		// *  Printer firmware upgrade, the package is a fixed size
		// *
		// *  @brief Printer firmware upgrade.
		// *
		// }
		//- (void)updatePrinterFirmwareWithData:(NSData *)data;
		procedure updatePrinterFirmwareWithData(data:NSData);cdecl;
		
		
		
		
		////=========================固件升级新的方式 需要固件支持=================
		////=========================New way of firmware upgrade=================
		
		
		//{!
		// *  \~chinese
		// *
		// *  获取升级固件包的大小
		// *
		// *  @brief 获取升级固件包的大小.
		// *
		// *  \~english
		// *
		// *  Get the size of each package of the upgraded firmware
		// *
		// *  @brief Get the size of each package of the upgraded firmware.
		// *
		// }
		//- (void)getUpdatePrinterFirmwarePackage;
		procedure getUpdatePrinterFirmwarePackage;cdecl;
		
		
		
		//{!
		// *  \~chinese
		// *
		// *  升级打印机固件.
		// *
		// *  @brief 升级打印机固件.
		// *  @param data         固件数据.
		// *  @param package      包大小
		// *
		// *  \~english
		// *
		// *  Upgrade printer firmware.
		// *
		// *  @brief Upgrade printer firmware.
		// *  @param data         data
		// *  @param package      Packet size
		// *
		// }
		//- (void)updateDeviceFirmwareWithData:(NSData *)data package:(NSInteger)package;
		[MethodName('updateDeviceFirmwareWithData:package:')]
		procedure updateDeviceFirmwareWithDatapackage(data:NSData;package:NSInteger);cdecl;
		
		
		
		
		
	end;
	
	PTCommandCommonClass=interface(NSObjectClass)//
	['{83220A75-1310-4004-AF13-660D8A8BADF0}']
	end;
	
	TPTCommandCommon=class(TOCGenericImport<PTCommandCommonClass,PTCommandCommon>)
	end;
	
	
	
	
	
	//NS_ASSUME_NONNULL_END
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTCommandCommon_FakeLoader : PTCommandCommon; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTCommandCommon';
{$O+}



{$ENDIF}

end.

