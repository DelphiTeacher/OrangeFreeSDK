//{!
// *  \~chinese
// *  @header     PTDispatcher.h
// *  @abstract   ͨѶЭ��
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
		
		/////< \~chinese ���ӷ�ʽ \~english Connection method
		//@property (assign, nonatomic) PTDispatchMode                          mode;
		function mode:PTDispatchMode;cdecl;
		procedure setMode(mode:PTDispatchMode);cdecl;
		/////< \~chinese ���Ӻ�Ĵ�ӡ������ \~english Printer object after connection
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
		// *  ������������
		// *
		// *  \~english
		// *
		// *  Create a singleton object
		// *
		// }
		
		//{*
		// *  \~chinese
		// *
		// *  ��ʼ���������ģ�Ŀ����Ϊ�˻�ȡ����״̬��������AppDelegate��ʹ��
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
		// *  ��������
		// *
		// *  @param data ����
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
		// *  �̼�����
		// *
		// *  @param data ����
		// *  @param block ��������
		// *  @param failBlock ����ʧ��
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
		// *  ��������ɨ��
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
		// *  ֹͣ����ɨ��
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
		// *  ��ȡ�ѷ��ֵ����д�ӡ��
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
		// *  ��ȡ����RSSI
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
		// *  ���Ӵ�ӡ��
		// *
		// *  @param data ��ӡ������
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
		// *  �Ͽ���ӡ������
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
		// *  ���ӳɹ�
		// *
		// *  @param connectSuccessBlock �ص�
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
		// *  ����ʧ��
		// *
		// *  @param connectFailBlock �ص�
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
		// *  �Ͽ����ӵĻص�������disconnect�Ͽ���ӡ���󣬻���ø÷���
		// *
		// *  @param unconnectBlock �ص�
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
		// *  ���ݷ��ͳɹ��ص�
		// *
		// *  @param sendSuccessBlock �ص�
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
		// *  ���ݷ���ʧ�ܻص�
		// *
		// *  @param sendFailureBlock �ص�
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
		// *  ���ݷ��ͽ��Ȼص�
		// *
		// *  @param sendProgressBlock �ص�
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
		// *  �����豸�������ݵĻص�
		// *
		// *  @param receiveDataBlock �ص�
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
		// *  ���յ���ӡ����ӡ״̬�ص���ʹ�ø÷���ǰ����Ҫ��֤��ӡ������״̬�ص��Ŀ��أ�����CPCLָ��е�cpclTurnOnPrintStatusCallBack������ESC�е�turnOnPrintStatusCallBack����
		// *
		// *  @param printStateBlock �ص�
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
		// *  �������
		// *
		// *  @param block �ص�
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
		// *  ע���������ģ��ýӿ����ڼ������Լ�ʵ�ֵ�CoreBluetooth���
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
		// *  ע������
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
		// *  �̼������Ļص�,���ʹ��writeFirmwareData�ӿ������̼�����ô����Ҫʹ�øûص�
		// *
		// *  @param upgradeFirmwareStateBlock �ص�
		// *
		// *  \~english
		// *
		// *  Callback of firmware upgrade��This callback is not required if the firmware is upgraded using the writeFirmwareData interface
		// *
		// *  @param upgradeFirmwareStateBlock callback
		// *
		// }
		//- (void)whenUpgradeFirmwareStateBlock:(PTUpgradeFirmwareStateBlock _Nullable)upgradeFirmwareStateBlock;
		procedure whenUpgradeFirmwareStateBlock(upgradeFirmwareStateBlock:{_Nullable}PTUpgradeFirmwareStateBlock);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  ��ȡ����״̬,��ȡ��״̬��Ҫ�ȳ�ʼ���������ģ�[[PTDispatcher share] initBleCentral]
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
		// *  ESC�쳣״̬�ص�
		// *
		// *  @param autoStateBlock �ص�
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
		// *  ESC��ӡ�ɹ��ص�
		// *
		// *  @param resultBlock �ص�
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

