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
	// *  ���ӷ�ʽ
	// *
	// *  \~english
	// *
	// *  Connection method
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTDispatchMode) {
	    //PTDispatchModeBLE        = 0, ///< \~chinese ���� \~english BLE
	    //PTDispatchModeWiFi       = 1 ///< \~chinese ��̫�� \~english LAN/WiFi
	//};
	//typedef NS_ENUM(NSInteger, PTDispatchMode) {
	PTDispatchMode_=(
	//(NSInteger, PTDispatchMode) {
	    PTDispatchModeBLE        = 0, ///< \~chinese ���� \~english BLE
	    PTDispatchModeWiFi       = 1 ///< \~chinese ��̫�� \~english LAN/WiFi
	);
	PTDispatchMode=Integer;
	
	

	
	
	//{*
	// *  \~chinese
	// *
	// *  ����״̬,�����Ҫʹ�ã�����AppDelegate��ʼ��PTDispatch
	// *
	// *  \~english
	// *
	// *  Bluetooth status, if you need to use it, initialize PTDispatch in AppDelegate
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTBluetoothState) {
	    //PTBluetoothStateUnauthorized  = 0, ///< \~chinese δ��Ȩ����ǰ��ϵͳ������Ȩ \~english unauthorized
	    //PTBluetoothStatePoweredOff  = 1, ///< \~chinese ����δ�� \~english Bluetooth off
	    //PTBluetoothStatePoweredOn  = 2, ///< \~chinese ���� \~english Bluetooth on
	//};
	//typedef NS_ENUM(NSInteger, PTBluetoothState) {
	PTBluetoothState_=(
	//(NSInteger, PTBluetoothState) {
	    PTBluetoothStateUnauthorized  = 0, ///< \~chinese δ��Ȩ����ǰ��ϵͳ������Ȩ \~english unauthorized
	    PTBluetoothStatePoweredOff  = 1, ///< \~chinese ����δ�� \~english Bluetooth off
	    PTBluetoothStatePoweredOn  = 2//, ///< \~chinese ���� \~english Bluetooth on
	);
	PTBluetoothState=Integer;
	
	
	
	
	
	//{*
	// *  \~chinese
	// *
	// *  ��ӡ��ɺ��ӡ�����ص�״̬,���ֻ��Ͳ��иù���
	// *
	// *  \~english
	// *
	// *  The status returned by the printer after printing, some models only have this function
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTPrintState) {
	    //PTPrintStateSuccess             = 0xcc00, ///< \~chinese ��ӡ�ɹ� \~english Print successfully
	    //PTPrintStateFailurePaperEmpty   = 0xcc01, ///< \~chinese ��ӡʧ�ܣ�ȱֽ�� \~english Printing failed (out of paper��
	    //PTPrintStateFailureLidOpen      = 0xcc02 ///< \~chinese ��ӡʧ�ܣ����ǣ� \~english Printing failed (Open the lid��
	//};
	//typedef NS_ENUM(NSInteger, PTPrintState) {
	PTPrintState_=(
	//(NSInteger, PTPrintState) {
	    PTPrintStateSuccess             = $cc00, ///< \~chinese ��ӡ�ɹ� \~english Print successfully
	    PTPrintStateFailurePaperEmpty   = $cc01, ///< \~chinese ��ӡʧ�ܣ�ȱֽ�� \~english Printing failed (out of paper��
	    PTPrintStateFailureLidOpen      = $cc02 ///< \~chinese ��ӡʧ�ܣ����ǣ� \~english Printing failed (Open the lid��
	);
	PTPrintState=Integer;
	
	
	
	
	
	
	//{*
	// *  \~chinese
	// *
	// *  ���Ӵ��������
	// *
	// *  \~english
	// *
	// *  Type of connection error
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTConnectError) {
	    //PTConnectErrorBleTimeout                  = 0, ///< \~chinese �������ӳ�ʱ \~english Bluetooth connection timed out
	    //PTConnectErrorBleDisvocerServiceTimeout   = 1, ///< \~chinese ��ȡ����ʱ \~english Get service timed out
	    //PTConnectErrorBleValidateTimeout          = 2, ///< \~chinese ��֤��ʱ \~english Print Verification timed out
	    //PTConnectErrorBleUnknownDevice            = 3, ///< \~chinese δ֪�豸 \~english Unknown device
	    //PTConnectErrorBleSystem                   = 4, ///< \~chinese ϵͳ���� \~english System error
	    //PTConnectErrorBleValidateFail             = 5, ///< \~chinese ��֤ʧ�� \~english Verification failed
	    //PTConnectErrorStreamTimeout               = 6, ///< \~chinese ���򿪳�ʱ \~english Stream open timeout
	    //PTConnectErrorStreamEmpty                 = 7, ///< \~chinese �򿪵��ǿ��� \~english Empty stream
	    //PTConnectErrorStreamOccured               = 8  ///< \~chinese ���������� \~english An error has occurred on the stream
	//};
	//typedef NS_ENUM(NSInteger, PTConnectError) {
	PTConnectError_=(
	//(NSInteger, PTConnectError) {
	    PTConnectErrorBleTimeout                  = 0, ///< \~chinese �������ӳ�ʱ \~english Bluetooth connection timed out
	    PTConnectErrorBleDisvocerServiceTimeout   = 1, ///< \~chinese ��ȡ����ʱ \~english Get service timed out
	    PTConnectErrorBleValidateTimeout          = 2, ///< \~chinese ��֤��ʱ \~english Print Verification timed out
	    PTConnectErrorBleUnknownDevice            = 3, ///< \~chinese δ֪�豸 \~english Unknown device
	    PTConnectErrorBleSystem                   = 4, ///< \~chinese ϵͳ���� \~english System error
	    PTConnectErrorBleValidateFail             = 5, ///< \~chinese ��֤ʧ�� \~english Verification failed
	    PTConnectErrorStreamTimeout               = 6, ///< \~chinese ���򿪳�ʱ \~english Stream open timeout
	    PTConnectErrorStreamEmpty                 = 7, ///< \~chinese �򿪵��ǿ��� \~english Empty stream
	    PTConnectErrorStreamOccured               = 8  ///< \~chinese ���������� \~english An error has occurred on the stream
	);
	PTConnectError=Integer;
	
	
	
	
	
	//{*
	// *  \~chinese
	// *
	// *  �̼�������������
	// *
	// *  \~english
	// *
	// *  Firmware upgrade error type
	// *
	// }
	//typedef NS_ENUM(NSInteger, PTUpgradeFirmwareState) {
	    //PTUpgradeFirmwareStateSuccess                   = 0, ///< \~chinese �����ɹ� \~english Update successed
	    //PTUpgradeFirmwareStateFailureDataLengthError, ///< \~chinese ����ʧ�ܣ����ݳ��ȴ��� \~english Data length error
	    //PTUpgradeFirmwareStateFailureValidateFail, ///< \~chinese ����ʧ�ܣ���֤����У��ʧ�� \~english Verification failed
	    //PTUpgradeFirmwareStateFailureWriteTimout, ///< \~chinese ����ʧ�ܣ�д�볬ʱ \~english Write timeout
	    //PTUpgradeFirmwareStateFailurePackageNumberError, ///< \~chinese ����ʧ�ܣ�����Ŵ��� \~english Wrong packet sequence number
	    //PTUpgradeFirmwareStateFailurePackageLengthError, ///< \~chinese ����ʧ�ܣ������ȴ��� \~english Packet length error
	    //PTUpgradeFirmwareStateFailureWriteFail, ///< \~chinese ����ʧ�ܣ�д��ʧ�� \~english Write failed
	    //PTUpgradeFirmwareStateFail ///< \~chinese ����ʧ�� \~english Upgrade failed
	//};
	//typedef NS_ENUM(NSInteger, PTUpgradeFirmwareState) {
	PTUpgradeFirmwareState_=(
	//(NSInteger, PTUpgradeFirmwareState) {
	    PTUpgradeFirmwareStateSuccess                   = 0, ///< \~chinese �����ɹ� \~english Update successed
	    PTUpgradeFirmwareStateFailureDataLengthError, ///< \~chinese ����ʧ�ܣ����ݳ��ȴ��� \~english Data length error
	    PTUpgradeFirmwareStateFailureValidateFail, ///< \~chinese ����ʧ�ܣ���֤����У��ʧ�� \~english Verification failed
	    PTUpgradeFirmwareStateFailureWriteTimout, ///< \~chinese ����ʧ�ܣ�д�볬ʱ \~english Write timeout
	    PTUpgradeFirmwareStateFailurePackageNumberError, ///< \~chinese ����ʧ�ܣ�����Ŵ��� \~english Wrong packet sequence number
	    PTUpgradeFirmwareStateFailurePackageLengthError, ///< \~chinese ����ʧ�ܣ������ȴ��� \~english Packet length error
	    PTUpgradeFirmwareStateFailureWriteFail, ///< \~chinese ����ʧ�ܣ�д��ʧ�� \~english Write failed
	    PTUpgradeFirmwareStateFail ///< \~chinese ����ʧ�� \~english Upgrade failed
	);
	PTUpgradeFirmwareState=Integer;
	
	
	
	
	
	
	//{*
	// *  \~chinese
	// *
	// *  �Զ��ش�״̬(ESC)
	// *
	// *  \~english
	// *
	// *  Automatic Status��ESC��
	// *
	// }
	//typedef NS_OPTIONS(u_int8_t, PTESCPrinterAutoStatus) {

	//typedef NS_OPTIONS(u_int8_t, PTESCPrinterAutoStatus) {
	//    PTESCPrinterAutoStatusNone            = 0,      ///< \~chinese ���� \~english Normal
	//    PTESCPrinterAutoStatusCoverOpen       = 1 << 0, ///< \~chinese ���� \~english Cover is open
	//    PTESCPrinterAutoStatusOutOfPaper      = 1 << 1, ///< \~chinese ȱֽ \~english Roll paper end sensor: paper not present
	//    PTESCPrinterAutoStatusCutterError     = 1 << 2, ///< \~chinese �Զ��е����� \~english Autocutter error occurred.
	//    PTESCPrinterAutoStatusOffline         = 1 << 3  ///< \~chinese ���ߣ���ʾ���쳣���� \~english Offline,has error occurred
	//};
  PTESCPrinterAutoStatus_=(
	    PTESCPrinterAutoStatusNone            = 0,      ///< \~chinese ���� \~english Normal
	    PTESCPrinterAutoStatusCoverOpen       = 1,// << 0, ///< \~chinese ���� \~english Cover is open
	    PTESCPrinterAutoStatusOutOfPaper      = 2,//1 << 1, ///< \~chinese ȱֽ \~english Roll paper end sensor: paper not present
	    PTESCPrinterAutoStatusCutterError     = 4,//1 << 2, ///< \~chinese �Զ��е����� \~english Autocutter error occurred.
	    PTESCPrinterAutoStatusOffline         = 8//1 << 3  ///< \~chinese ���ߣ���ʾ���쳣���� \~english Offline,has error occurred
  );
  PTESCPrinterAutoStatus=Integer;

	//{*
	// *  \~chinese
	// *
	// *  ��ӡ�ɹ�(ESC)
	// *
	// *  \~english
	// *
	// *  Print successful��ESC��
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
	// *  �̼�������������
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
	// *  ����û�з���ֵ��Block��eg:���ڷ���ʧ�ܻص������ӳɹ��ص�
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
	// *  ��������ʧ�ܻص���Block
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
	// *  ���巵��NSNumber���ͻص���Block��eg:���ͽ��Ȼص�����ȡRSSI�ص�
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
	// *  ��������豸�������ݵ�Block
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
	// *  �����ӡ���״̬�ص���Block
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
	// *  ����ESCָ���Զ��ش��쳣״̬�ص�
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
	// *  ����ESCָ���ӡ��ɳɹ���Block
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
	// *  ���������Block
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
	// *  �������ӶϿ��ص���Block������YES��ʾ�����Ͽ���NO��ʾ�����Ͽ�
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
	// *  �������ݷ��ͳɹ��ص���Block
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
	// *  ����̼������ص���Block
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

