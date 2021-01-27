{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Android.Bluetooth;

interface

uses
  uAndroidLog,
  System.Bluetooth;

{$SCOPEDENUMS ON}

{$DEFINE BLUETOOTH_CLASSIC}
{$DEFINE BLUETOOTH_LE}

type
{$IFDEF BLUETOOTH_CLASSIC}
  // --------------------------------------------------------------------- //
  TPlatformBluetoothClassicManager = class(TBluetoothManager)
  protected
    class function GetBluetoothManager: TBluetoothManager; override;
  end;
{$ENDIF BLUETOOTH_CLASSIC}

{$IFDEF BLUETOOTH_LE}
  // --------------------------------------------------------------------- //
  TPlatformBluetoothLEManager = class(TBluetoothLEManager)
  protected
    class function GetBluetoothManager: TBluetoothLEManager; override;
  end;

  /// <summary> Extra BLE Scan properties for Android </summary>
  IScanSettingsOptions = interface
  ['{353170C7-B913-4FF9-A0E6-C5825A9BAC71}']
    /// <summary> Get Function </summary>
    function GetCALLBACK_TYPE_ALL_MATCHES: Integer;
    /// <summary> Get Function </summary>
    function GetCALLBACK_TYPE_FIRST_MATCH: Integer;
    /// <summary> Get Function </summary>
    function GetCALLBACK_TYPE_MATCH_LOST: Integer;
    /// <summary> Get Function </summary>
    function GetMATCH_MODE_AGGRESSIVE: Integer;
    /// <summary> Get Function </summary>
    function GetMATCH_MODE_STICKY: Integer;
    /// <summary> Get Function </summary>
    function GetMATCH_NUM_FEW_ADVERTISEMENT: Integer;
    /// <summary> Get Function </summary>
    function GetMATCH_NUM_MAX_ADVERTISEMENT: Integer;
    /// <summary> Get Function </summary>
    function GetMATCH_NUM_ONE_ADVERTISEMENT: Integer;
    /// <summary> Get Function </summary>
    function GetSCAN_MODE_BALANCED: Integer;
    /// <summary> Get Function </summary>
    function GetSCAN_MODE_LOW_LATENCY: Integer;
    /// <summary> Get Function </summary>
    function GetSCAN_MODE_LOW_POWER: Integer;
    /// <summary> Get Function </summary>
    function GetSCAN_MODE_OPPORTUNISTIC: Integer;
    /// <summary> From API 21. Trigger a callback for every Bluetooth advertisement found that matches the filter criteria.
    /// If no filter is active, all advertisement packets are reported.
    /// </summary>
    property CALLBACK_TYPE_ALL_MATCHES: Integer read GetCALLBACK_TYPE_ALL_MATCHES;
    /// <summary> From API 23. A result callback is only triggered for the first advertisement packet received that
    ///  matches the filter criteria.
    /// </summary>
    property CALLBACK_TYPE_FIRST_MATCH: Integer read  GETCALLBACK_TYPE_FIRST_MATCH;
    /// <summary> From API 23. Receive a callback when advertisements are no longer received from a device that has
    /// been previously reported by a first match callback.
    /// </summary>
    property CALLBACK_TYPE_MATCH_LOST: Integer read  GetCALLBACK_TYPE_MATCH_LOST;
    /// <summary> From API 23. In Aggressive mode, hw will determine a match sooner even with feeble signal strength
    /// and few number of sightings/match in a duration.
    /// </summary>
    property MATCH_MODE_AGGRESSIVE: Integer read GetMATCH_MODE_AGGRESSIVE;
    /// <summary> From API 23. For sticky mode, higher threshold of signal strength and sightings is required before
    /// reporting by hw
    /// </summary>
    property MATCH_MODE_STICKY: Integer read GetMATCH_MODE_STICKY;
    /// <summary> From API 23. Match few advertisement per filter, depends on current capability and availibility
    /// of the resources in hw
    /// </summary>
    property MATCH_NUM_FEW_ADVERTISEMENT: Integer read GetMATCH_NUM_FEW_ADVERTISEMENT;
    /// <summary> From API 23. Match as many advertisement per filter as hw could allow, depends on current capability
    /// and availibility of the resources in hw
    /// </summary>
    property MATCH_NUM_MAX_ADVERTISEMENT: Integer read GetMATCH_NUM_MAX_ADVERTISEMENT;
    /// <summary> From API 23. Match one advertisement per filter </summary>
    property MATCH_NUM_ONE_ADVERTISEMENT: Integer read GetMATCH_NUM_ONE_ADVERTISEMENT;
    /// <summary> From API 21. Perform Bluetooth LE scan in balanced power mode. Scan results are returned at a rate
    /// that provides a good trade-off between scan frequency and power consumption.
    /// </summary>
    property SCAN_MODE_BALANCED: Integer read GetSCAN_MODE_BALANCED;
    /// <summary> From API 21. Scan using highest duty cycle. It's recommended to only use this mode when the application
    /// is running in the foreground.
    /// </summary>
    property SCAN_MODE_LOW_LATENCY: Integer read GetSCAN_MODE_LOW_LATENCY;
    /// <summary> From API 21. Perform Bluetooth LE scan in low power mode. This is the default scan mode as it consumes
    /// the least power.
    /// </summary>
    property SCAN_MODE_LOW_POWER: Integer read GetSCAN_MODE_LOW_POWER;
    /// <summary> From API 23. A special Bluetooth LE scan mode. Applications using this scan mode will passively listen
    /// for other scan results without starting BLE scans themselves.
    /// </summary>
    property SCAN_MODE_OPPORTUNISTIC: Integer read GetSCAN_MODE_OPPORTUNISTIC;
  end;

  /// <summary> Extra BLE properties for Android </summary>
  IExtraBLEAndroidProperties = interface
  ['{C14C69E8-C51B-4CF8-839B-FDE9CB96F15D}']
    /// <summary> Get Function </summary>
    function GetScanSettingsOptions: IScanSettingsOptions;
    /// <summary> Get Function </summary>
    function GetScanSettings: Integer;
    /// <summary> Set procedure </summary>
    procedure SetScanSettings(Value: Integer);
    /// <summary> From API 21. Constants to set ScanSettings </summary>
    property ScanSettingsOptions: IScanSettingsOptions read GetScanSettingsOptions;
    /// <summary> From API 21. Settings for the BLE Scanner. </summary>
    property ScanSettings: Integer read GetScanSettings write SetScanSettings;
  end;
  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //


//wn{wn}
type
  TOnIsBLEDeviceAutoConnectEvent=function(AJDeviceLocalObjectID:Pointer):Boolean of object;
var
 OnIsBLEDeviceAutoConnect:TOnIsBLEDeviceAutoConnectEvent;
function GetIsBLEDeviceAutoConnect(AJDeviceLocalObjectID:Pointer):Boolean;


{$ENDIF BLUETOOTH_LE}



implementation

uses
  Androidapi.JNI, Androidapi.JNIBridge, Androidapi.JNI.App, Androidapi.JNI.Embarcadero, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.Os, Androidapi.NativeActivity, Androidapi.Helpers, Androidapi.JNI.Bluetooth,
  System.Classes, System.Messaging, System.SysUtils, System.SyncObjs, System.TypInfo, System.NetConsts,
  System.Generics.Collections, Androidapi.Looper, Androidapi.AppGlue, System.Types;


//wn{wn}
function GetIsBLEDeviceAutoConnect(AJDeviceLocalObjectID:Pointer):Boolean;
begin
  Result:=True;
  if Assigned(OnIsBLEDeviceAutoConnect) then
  begin
    Result:=OnIsBLEDeviceAutoConnect(AJDeviceLocalObjectID);
  end;
end;

// --------------------------------------------------------------------- //
// Helper functions
// --------------------------------------------------------------------- //

function BluetoothUuidToJUuid(const AUuid: TBluetoothUUID): JUUID;
var
  LAux: string;
begin
  LAux := AUuid.ToString;
  LAux := LAux.Substring(1, LAux.Length - 2);
  Result := TJUUID.JavaClass.fromString(StringToJString(LAux));
end;

function JUuidToBluetoothUuid(const AJUuid: JUUID): TBluetoothUUID;
begin
  Result := TBluetoothUUID.Create('{' + JStringToString(AJUuid.toString) + '}');
end;

// --------------------------------------------------------------------- //

function BluetoothUUIDsListToJavaArrayUUID(const BluetoothUUIDsList: TBluetoothUUIDsList): TJavaObjectArray<JUUID>;
var
  I: Integer;
begin
  if BluetoothUUIDsList <> nil then
  begin
    Result := TJavaObjectArray<JUUID>.Create(BluetoothUUIDsList.Count);
    for I := 0 to BluetoothUUIDsList.Count - 1 do
      Result.Items[I] := BluetoothUuidToJUuid(BluetoothUUIDsList[I]);
  end
  else
    Result := nil;
end;

// --------------------------------------------------------------------- //

procedure InternalProcessMessages;
var
  PEventPollSource: Pandroid_poll_source;
begin

  if System.DelphiActivity <> nil then
  begin
    ALooper_pollAll(1, nil, nil, PPointer(@PEventPollSource));
    if (PEventPollSource <> nil) and Assigned(PEventPollSource^.process) then
      PEventPollSource^.process(Pandroid_app(PANativeActivity(System.DelphiActivity)^.instance), PEventPollSource);
  end;
end;

// --------------------------------------------------------------------- //

function CheckApiMethod(const AClassName, AMethodName, ASig: string): Boolean;
var
  LJClass: JNIClass;
begin
  LJClass := nil;
  try
    LJClass := JNIClass(TJNIResolver.GetJavaClassID(AClassName));
    if LJClass <> nil then
      Result := TJNIResolver.GetJavaMethodID(LJClass, AMethodName, ASig) <> nil
    else
      Result := False
  finally
    if LJClass <> nil then
      TJNIResolver.DeleteLocalRef(LJClass);
  end;
end;

// --------------------------------------------------------------------- //
// End helper functions
// --------------------------------------------------------------------- //

type
  TAndroidBluetoothAdapter = class;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //
  TBluetoothBroadcastListener = class(TJavaLocal, JFMXBroadcastReceiverListener)
  private
    [Weak] FAdapter: TAndroidBluetoothAdapter;
  public
    constructor Create(const AnAdapter: TAndroidBluetoothAdapter);
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;

  // --------------------------------------------------------------------- //
  TAndroidBluetoothManager = class(TPlatformBluetoothClassicManager)
  private
    FAdapter: TBluetoothAdapter;
  protected
    FContext: JContext;
    FJManager: JBluetoothManager;

    constructor Create;
    destructor Destroy; override;

    function DoGetClassicAdapter: TBluetoothAdapter; override;
    function GetAdapterState: TBluetoothAdapterState;
    function GetConnectionState: TBluetoothConnectionState; override;
    function DoEnableBluetooth: Boolean; override;

  end;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //

  TAndroidBluetoothAdapter = class(TBluetoothAdapter)
  private type
    TThreadTimer = class(TThread)
    private
      [Weak] FAdapter: TBluetoothAdapter;
      FTimeout: Cardinal;
      FOnTimer: TDiscoveryEndEvent;
      FDiscovering: Boolean;
      FEvent: TEvent;
      procedure Cancel;
    public
      constructor Create(const AnAdapter: TBluetoothAdapter; const AEvent: TDiscoveryEndEvent; Timeout: Cardinal); overload;
      destructor Destroy; override;
      procedure Execute; override;
    end;
  private
    FIntentFilter: JIntentFilter;
    FContext: JContext;
    FJAdapter: JBluetoothAdapter;
    FBroadcastReceiver: JFMXBroadcastReceiver;
    FBroadcastListener: TBluetoothBroadcastListener;
    FWaitingCallback: Boolean;
    FRequestEnableCallback: Boolean;
    FDiscoveryThreadTimer: TThreadTimer;
    FDiscoveryCancelled: Boolean;
    FOldScanMode: Integer;
    function GetAdapterName: string; override;
    function GetAddress: TBluetoothMacAddress; override;
    function GetPairedDevices: TBluetoothDeviceList; override;
    function GetScanMode: TBluetoothScanMode; override;
    function GetState: TBluetoothAdapterState; override;
    procedure SetAdapterName(const Value: string); override;

    procedure ResultCallback(const Sender: TObject; const M: TMessage);

    // Socket management functions
    function DoCreateServerSocket(const AName: string; const AUUID: TGUID; Secure: Boolean): TBluetoothServerSocket; override;

    // Device Discovery
    procedure DoStartDiscovery(Timeout: Cardinal); override;
    procedure DoCancelDiscovery; override;

    procedure DoStartDiscoverable(Timeout: Cardinal); override;

    function DoPair(const ADevice: TBluetoothDevice): Boolean; override;
    function DoUnPair(const ADevice: TBluetoothDevice): Boolean; override;

  public
    constructor Create(const AManager: TBluetoothManager; const AJAdapter: JBluetoothAdapter);
    destructor Destroy; override;

    function GetRemoteDevice(const AnAddress: TBluetoothMacAddress): TBluetoothDevice; //override;
  end;


  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //

  TScanSettingsOptions = class(TInterfacedObject,IScanSettingsOptions)
  const
    CALLBACK_TYPE_ALL_MATCHES = 1;
    CALLBACK_TYPE_FIRST_MATCH = 2;
    CALLBACK_TYPE_MATCH_LOST = 4;
    MATCH_MODE_AGGRESSIVE = 1;
    MATCH_MODE_STICKY = 2;
    MATCH_NUM_FEW_ADVERTISEMENT = 2;
    MATCH_NUM_MAX_ADVERTISEMENT = 3;
    MATCH_NUM_ONE_ADVERTISEMENT = 1;
    SCAN_MODE_BALANCED = 1;
    SCAN_MODE_LOW_LATENCY = 2;
    SCAN_MODE_LOW_POWER = 0;
    SCAN_MODE_OPPORTUNISTIC = -1;
  public
    function GetCALLBACK_TYPE_ALL_MATCHES: Integer;
    function GetCALLBACK_TYPE_FIRST_MATCH: Integer;
    function GetCALLBACK_TYPE_MATCH_LOST: Integer;
    function GetMATCH_MODE_AGGRESSIVE: Integer;
    function GetMATCH_MODE_STICKY: Integer;
    function GetMATCH_NUM_FEW_ADVERTISEMENT: Integer;
    function GetMATCH_NUM_MAX_ADVERTISEMENT: Integer;
    function GetMATCH_NUM_ONE_ADVERTISEMENT: Integer;
    function GetSCAN_MODE_BALANCED: Integer;
    function GetSCAN_MODE_LOW_LATENCY: Integer;
    function GetSCAN_MODE_LOW_POWER: Integer;
    function GetSCAN_MODE_OPPORTUNISTIC: Integer;
end;

  TAndroidBluetoothLEManager = class(TPlatformBluetoothLEManager, IExtraBLEAndroidProperties)
  private
    FAdapter: TBluetoothLEAdapter;
    FIScanSettingsOptions: IScanSettingsOptions;
    FScanSettings: Integer;
  protected
    FContext: JContext;
    FJManager: JBluetoothManager;

    constructor Create;
    destructor Destroy; override;

    function DoGetAdapter: TBluetoothLEAdapter; override;

    function GetAdapterState: TBluetoothAdapterState;
    function GetConnectionState: TBluetoothConnectionState; override;

    function DoGetGattServer: TBluetoothGattServer; override;
    function DoGetSupportsGattClient: Boolean; override;
    function DoGetSupportsGattServer: Boolean; override;
    function DoEnableBluetooth: Boolean; override;
    function GetScanSettings: Integer;
    procedure SetScanSettings(Value: Integer);
    function GetScanSettingsOptions: IScanSettingsOptions;
  public
    property ScanSettings: Integer read GetScanSettings write SetScanSettings;
  end;


  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //
  TAndroidBluetoothLEAdapter = class(TBluetoothLEAdapter)
  private type
    TThreadTimer = class(TThread)
    private
      [Weak] FAdapter: TBluetoothLEAdapter;
      FTimeout: Cardinal;
      FOnTimer: TDiscoveryLEEndEvent;
      FEvent: TEvent;
      procedure Cancel;
    public
      constructor Create(const AnAdapter: TBluetoothLEAdapter; const AEvent: TDiscoveryLEEndEvent; Timeout: Cardinal); overload;
      destructor Destroy; override;
      procedure Execute; override;
    end;
  private
    FTimerThread: TThreadTimer;
    FLeCallback: JBluetoothAdapter_LeScanCallback;
    FJScanCallback: JRTLScanCallback;
    FJScanListener: JRTLScanListener;
    FContext: JContext;
    FJAdapter: JBluetoothAdapter;
    FJScanner: JBluetoothLeScanner;
    FRequestEnableCallback: Boolean;
    FJScanSettings: JScanSettings;
    FJArrayListOfAdvertiseData: JArrayList;
    FEventStartScan: TEvent;
    FStartScanFailed: Integer;
    FBluetoothLEScanFilterList: TBluetoothLEScanFilterList;
    FScanSettings: Integer;
    function GetAdapterName: string; override;
    function GetAddress: TBluetoothMacAddress; override;
    function GetScanMode: TBluetoothScanMode; override;
    function GetState: TBluetoothAdapterState; override;
    procedure SetAdapterName(const Value: string); override;

    // LE Device Discovery
    function DoStartDiscovery(Timeout: Cardinal; const FilterUUIDList: TBluetoothUUIDsList;
      const ABluetoothLEScanFilterList: TBluetoothLEScanFilterList = nil): Boolean; override;
    function DoStartDiscoveryRaw(const ABluetoothLEScanFilterList: TBluetoothLEScanFilterList = nil;
      Refresh: Boolean = True): Boolean; override;
    procedure DoCancelDiscovery; override;
    procedure DoDiscoveryEnd(const Sender: TObject; const ADeviceList: TBluetoothLEDeviceList); override;

    procedure ResultCallback(const Sender: TObject; const M: TMessage);
  public
    constructor Create(const AManager: TBluetoothLEManager; const AJAdapter: JBluetoothAdapter);
    destructor Destroy; override;

    function GetRemoteDevice(const AnAddress: TBluetoothMacAddress): TBluetoothLEDevice; //override;
  end;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //
  TAndroidBluetoothSocket = class(TBluetoothSocket)
  private type
    TBluetoothSocketReader = class(TThread)
    protected
      FJBytes: TJavaArray<System.Byte>;
      [Weak] FSocket: TAndroidBluetoothSocket;
      FBufferSize: Integer;
      FDestroying: Boolean;
    public
      constructor Create(const ASocket: TAndroidBluetoothSocket; ABuffSize: Integer);
      procedure Execute; override;
      destructor Destroy; override;
      function GetBufferedDataSize: Integer; inline;
      procedure GetBufferedData(const ABuffer: TBytes; AnOffset: Integer); inline;
    end;
  protected const
    BUFFER_SIZE = 4096;
    SocketEventTimeout = 1000;
  protected
    FJBytes: TJavaArray<System.Byte>;
    FJBluetoothSocket: JBluetoothSocket;
    FJIStream: JInputStream;
    FJOStream: JOutputStream;
    FConnected: Boolean;

    FDestroying: Boolean;
    FReader: TBluetoothSocketReader;
    FSocketEvent: TEvent;
    FReaderEvent: TEvent;

    function GetConnected: Boolean; override;
    function GetRemoteDevice: TBluetoothDevice; //override;
    procedure DoClose; override;
    procedure DoConnect; override;
    function DoReceiveData(ATimeout: Cardinal): TBytes; override;
    procedure DoSendData(const AData: TBytes); override;
  public
    constructor Create(const ASocket: JBluetoothSocket);
    destructor Destroy; override;
  end;

  TAndroidBluetoothServerSocket = class(TBluetoothServerSocket)
  protected
    FJServerSocket: JBluetoothServerSocket;
    function DoAccept(Timeout: Cardinal): TBluetoothSocket; override;
    procedure DoClose; override;
  public
    constructor Create(const AServerSocket: JBluetoothServerSocket);
    destructor Destroy; override;
  end;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //

  TBluetoothLeScanCallback = class(TJavaLocal, JBluetoothAdapter_LeScanCallback)
  private
    [Weak] FAdapter: TAndroidBluetoothLEAdapter;
  public
    constructor Create(const AnAdapter: TAndroidBluetoothLEAdapter);

    procedure onLeScan(device: JBluetoothDevice; rssi: Integer; scanRecord: TJavaArray<Byte>); cdecl;
  end;

  TScanCallback = class(TJavaLocal, JRTLScanListener)
  private
    [Weak] FAdapter: TAndroidBluetoothLEAdapter;
  public
    constructor Create(const AnAdapter: TAndroidBluetoothLEAdapter);

    procedure onBatchScanResults(results: JList); cdecl;
    procedure onScanFailed(errorCode: Integer); cdecl;
    procedure onScanResult(callbackType: Integer; result: Jle_ScanResult); cdecl;
  end;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //

  TAndroidBluetoothDevice = class(TBluetoothDevice)
  private const
    BluetoothServicesTimeout = 6600;
  private
    FJDevice: JBluetoothDevice;
  protected
    FEventUUIDS: TEvent;
    FDiscoverServiceEvent: TDiscoverServiceEvent;

    function GetOnDiscoverService: TDiscoverServiceEvent;
    procedure SetOnDiscoverService(const Value: TDiscoverServiceEvent);
    function GetAddress: TBluetoothMacAddress; override;
    function GetDeviceName: string; override;
    function GetPaired: Boolean; override;
    function GetState: TBluetoothDeviceState; override;
    function GetBluetoothType: TBluetoothType; override;

    function GetClassDevice: Integer; override;
    function GetClassDeviceMajor: Integer; override;

    function DoGetServices: TBluetoothServiceList; override;
    // Socket Management functions.
    function DoCreateClientSocket(const AUUID: TGUID; Secure: Boolean): TBluetoothSocket; override;
  public
    constructor Create(const AJDevice: JBluetoothDevice);
    destructor Destroy; override;
    function Pair: Boolean;
    property Address: TBluetoothMacAddress read GetAddress;
    property DeviceName: string read GetDeviceName;

    property OnDiscoverService: TDiscoverServiceEvent read GetOnDiscoverService write SetOnDiscoverService;
  end;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //

  TAndroidBluetoothLEDevice = class;
  TAndroidBluetoothGattCharacteristic = class;
  TAndroidBluetoothGattDescriptor = class;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //

  TAndroidBluetoothLEAdvertiseData = class(TBluetoothLEAdvertiseData)
  private
    FBluetoothGattServer: TBluetoothGattServer;
    FJBluetoothLeAdvertiser: JBluetoothLeAdvertiser;
    FJAdvertiseData_Builder: JAdvertiseData_Builder;
    FJScanResponse_Builder: JAdvertiseData_Builder;
    FJAdvertiseData: JAdvertiseData;
    FJScanResponse: JAdvertiseData;
    FJScanResult: Jle_ScanResult;
    FJAdvertiseSettings_Builder: JAdvertiseSettings_Builder;
    FJAdvertiseCallback: JRTLAdvertiseCallback;
    FJAdvertiseListener: JRTLAdvertiseListener;
    FDevice: TBluetoothLEDevice;
    FAdapter: TBluetoothLEAdapter;
    FEvent: TEvent;
    FServiceUUIDChanged: Boolean;
    FServiceDataChanged: Boolean;
  protected
    FAdvertising: Boolean;
    FErrorCode: Integer;
    function GetServiceUUIDs: TArray<TBluetoothUUID>; override;
    function GetServiceData: TArray<TServiceDataRawData>; override;
    procedure SetLocalName(const ALocalName: string); override;
    function GetLocalName: string; override;
    procedure SetTxPowerLevel(ATxPowerLevel: Integer); override;
    function GetTxPowerLevel: Integer; override;
    procedure SetManufacturerSpecificData(const AManufacturerSpecificData: TBytes); override;
    function GetManufacturerSpecificData: TBytes; override;
    procedure DoStartAdvertising;
    procedure DoStopAdvertising;
    procedure CreateAdvertiseDataJavaObjects;
  public
    constructor Create(const ABluetoothGattServer: TBluetoothGattServer; const AnAdapter: TBluetoothLEAdapter;
      const ADevice: TBluetoothLEDevice = nil);
    destructor Destroy; override;
    function DoAddServiceUUID(const AServiceUUID: TBluetoothUUID): Boolean; override;
    procedure DoRemoveServiceUUID(const AServiceUUID: TBluetoothUUID); override;
    procedure DoClearServiceUUIDs; override;
    function ContainsServiceUUID(const AServiceUUID: TBluetoothUUID): Boolean; override;
    function DoAddServiceData(const AServiceUUID: TBluetoothUUID; const AData: TBytes): Boolean; override;
    procedure DoRemoveServiceData(const AServiceUUID: TBluetoothUUID); override;
    function GetDataForService(const AServiceUUID: TBluetoothUUID): TBytes; override;
    procedure DoClearServiceData; override;
  end;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //
  TAndroidBluetoothGattServer = class(TBluetoothGattServer)
  private
    FJGattServer: JBluetoothGattServer;
    FJGattServerCallback: JRTLBluetoothGattServerCallback;
    FJGattServerListener: JRTLBluetoothGattServerListener;
    FLastRWrittenGattCharacteristic: TBluetoothGattCharacteristic;

    function FindCharacteristic(const AJCharacteristic: JBluetoothGattCharacteristic): TAndroidBluetoothGattCharacteristic;
    procedure DoDisconnect(const ADevice: TBluetoothLEDevice);
    procedure DoClientConfigurationWrite(const ADescriptor: TBluetoothGattDescriptor; const OldValue: TArray<Byte>; const AClient: TBluetoothLEDevice);
  protected
    // Helper Functions
    function FindDevice(const AJDevice: JBluetoothDevice): TBluetoothLEDevice;
    function FindService(const AJService: JBluetoothGattService): TBluetoothGattService;
    // Service Management.
    function DoAddService(const AService: TBluetoothGattService): Boolean; override;
    function DoCreateService(const AnUUID: TBluetoothUUID; AType: TBluetoothServiceType): TBluetoothGattService; override;
    function DoCreateIncludedService(const AService: TBluetoothGattService; const AnUUID: TBluetoothUUID;
      AType: TBluetoothServiceType): TBluetoothGattService; override;
    // Characteristic Management.
    function DoAddCharacteristic(const AService: TBluetoothGattService;
      const ACharacteristic: TBluetoothGattCharacteristic): Boolean; override;
    function DoCreateCharacteristic(const AService: TBluetoothGattService; const AnUUID: TBluetoothUUID;
      const AProps: TBluetoothPropertyFlags; const ADescription: string = ''): TBluetoothGattCharacteristic; override;
    // Descriptor Management.
    function DoCreateDescriptor(const ACharacteristic: TBluetoothGattCharacteristic;
      const AnUUID: TBluetoothUUID): TBluetoothGattDescriptor; override;

    function DoCreateAdvertiseData: TBluetoothLEAdvertiseData; override;
    function DoGetServices: TBluetoothGattServiceList; override;

    procedure DoClearServices; override;
    procedure DoClose; override;

    function DoConnect(const ADevice: TBluetoothLEDevice; AutoConnect: Boolean): Boolean;

    procedure DoCharacteristicReadRequest(const ADevice: TBluetoothLEDevice; ARequestId: Integer; AnOffset: Integer;
      const AGattCharacteristic: TBluetoothGattCharacteristic); override;

    procedure DoCharacteristicWriteRequest(const ADevice: TBluetoothLEDevice; ARequestId: Integer;
      const AGattCharacteristic: TBluetoothGattCharacteristic; APreparedWrite: Boolean; AResponseNeeded: Boolean;
      AnOffset: Integer; const AValue: TBytes); override;
    procedure DoUpdateCharacteristicValue(const ACharacteristic: TBluetoothGattCharacteristic); override;
    procedure DoDescriptorReadRequest(const ADevice: TBluetoothLEDevice; ARequestId: Integer; AnOffset: Integer;
      const ADescriptor: TBluetoothGattDescriptor);
    procedure DoDescriptorWriteRequest(const ADevice: TBluetoothLEDevice; ARequestId: Integer;
      const ADescriptor: TBluetoothGattDescriptor; APreparedWrite: Boolean; AResponseNeeded: Boolean; AnOffset: Integer;
      const AValue: TBytes);

//    procedure DoConnectionStateChange(const ADevice: TBluetoothLEDevice; AStatus: Integer; ANewState: Integer); override;
    procedure DoServiceAdded(AStatus: TBluetoothGattStatus; const AService: TBluetoothGattService); override;
    procedure DoStartAdvertising; override;
    procedure DoStopAdvertising; override;
    function DoIsAdvertising: Boolean; override;

    procedure DoExecuteWrite(const ADevice: TBluetoothLEDevice; ARequestId: Integer; Execute: Boolean);
    procedure DoSendResponse(const ADevice: TBluetoothLEDevice; ARequestId: Integer; AStatus: Integer;
      AnOffset: Integer; const AValue: TBytes);

  public
    constructor Create(const AManager: TAndroidBluetoothLEManager; const AnAdapter: TAndroidBluetoothLEAdapter);
    destructor Destroy; override;


  end;

  // --------------------------------------------------------------------- //
  TAndroidBluetoothGattServerListener = class(TJavaLocal, JRTLBluetoothGattServerListener)
  protected
    [Weak] FGattServer: TAndroidBluetoothGattServer;
  public
    constructor Create(const AServer: TAndroidBluetoothGattServer);
    destructor Destroy; override;

    procedure onCharacteristicReadRequest(device: JBluetoothDevice; requestId: Integer; offset: Integer; characteristic: JBluetoothGattCharacteristic); cdecl;
    procedure onCharacteristicWriteRequest(device: JBluetoothDevice; requestId: Integer; characteristic: JBluetoothGattCharacteristic; preparedWrite: Boolean; responseNeeded: Boolean; offset: Integer; value: TJavaArray<Byte>); cdecl;
    procedure onConnectionStateChange(device: JBluetoothDevice; status: Integer; newState: Integer); cdecl;
    procedure onDescriptorReadRequest(device: JBluetoothDevice; requestId: Integer; offset: Integer; descriptor: JBluetoothGattDescriptor); cdecl;
    procedure onDescriptorWriteRequest(device: JBluetoothDevice; requestId: Integer; descriptor: JBluetoothGattDescriptor; preparedWrite: Boolean; responseNeeded: Boolean; offset: Integer; value: TJavaArray<Byte>); cdecl;
    procedure onExecuteWrite(device: JBluetoothDevice; requestId: Integer; execute: Boolean); cdecl;
    procedure onServiceAdded(AStatus: Integer; service: JBluetoothGattService); cdecl;
  end;

  TAndroidBluetoothAdvertiseListener = class(TJavaLocal, JRTLAdvertiseListener)
  private
    FEvent: TEvent;
    FerrorCode: Integer;
  public
    constructor Create(const AEvent: TEvent; AErrorCode: Integer);
    destructor Destroy; override;

    procedure onStartFailure(errorCode: Integer); cdecl;
    procedure onStartSuccess(settingsInEffect: JAdvertiseSettings); cdecl;
  end;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //
  TAndroidBluetoothGattListener = class(TJavaLocal, JRTLBluetoothGattListener)
  private
    [Weak] FGatt: TAndroidBluetoothLEDevice;
  public
    constructor Create(const ALEDevice: TAndroidBluetoothLEDevice);
    destructor Destroy; override;

    procedure onCharacteristicChanged(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic); cdecl;
    procedure onCharacteristicRead(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic; status: Integer); cdecl;
    procedure onCharacteristicWrite(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic; status: Integer); cdecl;
    procedure onConnectionStateChange(gatt: JBluetoothGatt; status: Integer; newState: Integer); cdecl;
    procedure onDescriptorRead(gatt: JBluetoothGatt; descriptor: JBluetoothGattDescriptor; status: Integer); cdecl;
    procedure onDescriptorWrite(gatt: JBluetoothGatt; descriptor: JBluetoothGattDescriptor; status: Integer); cdecl;
    procedure onReadRemoteRssi(gatt: JBluetoothGatt; rssi: Integer; status: Integer); cdecl;
    procedure onReliableWriteCompleted(gatt: JBluetoothGatt; status: Integer); cdecl;
    procedure onServicesDiscovered(gatt: JBluetoothGatt; status: Integer); cdecl;
  end;

  // --------------------------------------------------------------------- //
  TAndroidBluetoothLEDevice = class(TBluetoothLEDevice)
  private class var
    FRefreshMethod: Boolean;
    class constructor Create;
  private const
    CallbackGattTimeout = 5000;
  private
    FServicesEvent: TEvent;
    FCallbackGattEvents: TEvent;
    FCallbackGattResult: Boolean;
    FLastStatus: TBluetoothGattStatus;
    FConnectionStatus: TBluetoothDeviceState;

  private
    FJDevice: JBluetoothDevice;

    FJGattCallback: JRTLBluetoothGattCallback;
    FJGattListener: JRTLBluetoothGattListener;
    FJGatt: JBluetoothGatt;
    FReconnected: Boolean;
    FConnecting: Boolean;
    function InternalGetGattClient: JBluetoothGatt;

  protected  // From TBluetoothCustomDevice
    function DoCreateAdvertiseData: TBluetoothLEAdvertiseData; override;
    function GetAddress: TBluetoothMacAddress; override;
    function GetDeviceName: string; override;
    function GetBluetoothType: TBluetoothType; override;
    function GetIdentifier: string; override;
    function GetIsConnected: Boolean; override;

  private
    function FindCharacteristic(const AJCharacteristic: JBluetoothGattCharacteristic): TAndroidBluetoothGattCharacteristic;
    function FindDescriptor(const AJDescriptor: JBluetoothGattDescriptor): TAndroidBluetoothGattDescriptor;

    procedure InternalGetServices;
    function UpdateServicesList: Boolean;
  protected
    procedure DoAbortReliableWrite; override;
    function DoBeginReliableWrite: Boolean; override;
    function DoExecuteReliableWrite: Boolean; override;

    function DoDiscoverServices: Boolean; override;

    function DoReadCharacteristic(const ACharacteristic: TBluetoothGattCharacteristic): Boolean; override;
    function DoReadDescriptor(const ADescriptor: TBluetoothGattDescriptor): Boolean; override;
    function DoWriteCharacteristic(const ACharacteristic: TBluetoothGattCharacteristic): Boolean; override;
    function DoWriteDescriptor(const ADescriptor: TBluetoothGattDescriptor): Boolean; override;

    function DoReadRemoteRSSI: Boolean; override;
    function DoSetCharacteristicNotification(const ACharacteristic: TBluetoothGattCharacteristic;
      Enable: Boolean): Boolean; override;
    function DoDisconnect: Boolean; override;
    function DoConnect: Boolean; override;
  public
    constructor Create(const AJDevice: JBluetoothDevice; AutoConnect: Boolean; AForceRefreshCachedServices: Boolean = False);
    destructor Destroy; override;
  end;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //
  TAndroidBluetoothGattService = class(TBluetoothGattService)
  private

    function FindCharacteristic(AJCharacteristic: JBluetoothGattCharacteristic): TAndroidBluetoothGattCharacteristic;
    function FindDescriptor(AJDescriptor: JBluetoothGattDescriptor): TAndroidBluetoothGattDescriptor;
  protected
    FJService: JBluetoothGattService;

    function GetServiceType: TBluetoothServiceType; override;
    function GetServiceUUID: TBluetoothUUID; override;

    function DoGetCharacteristics: TBluetoothGattCharacteristicList; override;

    function DoAddCharacteristic(const ACharacteristic: TBluetoothGattCharacteristic): Boolean; override;
    function DoAddIncludedService(const AService: TBluetoothGattService): Boolean; override;

    function DoCreateIncludedService(const AnUUID: TBluetoothUUID; AType: TBluetoothServiceType): TBluetoothGattService; override;
    function DoCreateCharacteristic(const AUuid: TBluetoothUUID; APropertyFlags: TBluetoothPropertyFlags;
      const ADescription: string): TBluetoothGattCharacteristic; override;

    function DoGetIncludedServices: TBluetoothGattServiceList; override;

  public
    constructor Create(const AnUUID: TBluetoothUUID; AType: TBluetoothServiceType; const AJService: JBluetoothGattService);
    destructor Destroy; override;

  end;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //
  TAndroidBluetoothGattCharacteristic = class(TBluetoothGattCharacteristic)
  private
    function FindDescriptor(const AJDescriptor: JBluetoothGattDescriptor): TAndroidBluetoothGattDescriptor;
  protected
    FJCharacteristic: JBluetoothGattCharacteristic;

    function GetUUID: TBluetoothUUID; override;

    function GetProperties: TBluetoothPropertyFlags; override;

    function DoAddDescriptor(const ADescriptor: TBluetoothGattDescriptor): Boolean; override;
    function DoCreateDescriptor(const AUUID: TBluetoothUUID): TBluetoothGattDescriptor; override;
    function DoGetDescriptors: TBluetoothGattDescriptorList; override;

    function DoGetValue: TBytes; override;
    procedure DoSetValue(const AValue: TBytes); override;
  public
    constructor Create(const AService: TBluetoothGattService; AJCharacteristic: JBluetoothGattCharacteristic); overload;
    constructor Create(const AService: TBluetoothGattService; const AUUID: TBluetoothUUID; AProperties: TBluetoothPropertyFlags); overload;
    destructor Destroy; override;
  end;

  // --------------------------------------------------------------------- //
  // --------------------------------------------------------------------- //

  TAndroidBluetoothGattDescriptor = class(TBluetoothGattDescriptor)
  protected
    FJDescriptor: JBluetoothGattDescriptor;

    function DoGetValue: TBytes; override;
    procedure DoSetValue(const AValue: TBytes); override;

    function GetUUID: TBluetoothUUID; override;

    // Characteristic Extended Properties
    function DoGetReliableWrite: Boolean; override;
    function DoGetWritableAuxiliaries: Boolean; override;

    // Characteristic User Description
    function DoGetUserDescription: string; override;
    procedure DoSetUserDescription(const Value: string); override;

    // Client Characteristic Configuration
    procedure DoSetNotification(const Value: Boolean); override;
    function DoGetNotification: Boolean; override;
    procedure DoSetIndication(const Value: Boolean); override;
    function DoGetIndication: Boolean; override;

    // Server Characteristic Configuration
    function DoGetBroadcasts: Boolean; override;
    procedure DoSetBroadcasts(const Value: Boolean); override;

    //Characteristic Presentation Format
    function DoGetFormat: TBluetoothGattFormatType; override;
    function DoGetExponent: ShortInt; override;
    function DoGetFormatUnit: TBluetoothUUID; override;

  public
    constructor Create(const ACharacteristic: TBluetoothGattCharacteristic; AJDescriptor: JBluetoothGattDescriptor);
    destructor Destroy; override;
  end;


// --------------------------------------------------------------------- //
// Helper fuctions
// --------------------------------------------------------------------- //

const
  PROPERTY_BROADCAST: Integer      = $0001;
  PROPERTY_READ: Integer           = $0002;
  PROPERTY_WRITE_NO_RESPONSE: Integer = $0004;
  PROPERTY_WRITE: Integer          = $0008;
  PROPERTY_NOTIFY: Integer         = $0010;
  PROPERTY_INDICATE: Integer       = $0020;
  PROPERTY_SIGNED_WRITE: Integer   = $0040;
  PROPERTY_EXTENDED_PROPS: Integer = $0080;
  REQUEST_DISCOVERABLE             = 2001;
  REQUEST_ENABLE_BT                = 2002;
  CHAR_EXTENDEDPROPERTIES: TBluetoothUUID = '{00002900-0000-1000-8000-00805F9B34FB}';
  CHAR_DESCRIPTION: TBluetoothUUID = '{00002901-0000-1000-8000-00805F9B34FB}';
  CHAR_CLIENT_CONFIG: TBluetoothUUID = '{00002902-0000-1000-8000-00805F9B34FB}';
  CHAR_SERVERCONFIGURATIONFORMAT: TBluetoothUUID = '{00002903-0000-1000-8000-00805F9B34FB}';

function PropertiesToInteger(const AProps: TBluetoothPropertyFlags): Integer;
begin
  Result := 0;
  if TBluetoothProperty.Broadcast in AProps then
    Result := Result or PROPERTY_BROADCAST;
  if TBluetoothProperty.Read in AProps then
    Result := Result or PROPERTY_READ;
  if TBluetoothProperty.WriteNoResponse in AProps then
    Result := Result or PROPERTY_WRITE_NO_RESPONSE;
  if TBluetoothProperty.Write in AProps then
    Result := Result or PROPERTY_WRITE;
  if TBluetoothProperty.Notify in AProps then
    Result := Result or PROPERTY_NOTIFY;
  if TBluetoothProperty.Indicate in AProps then
    Result := Result or PROPERTY_INDICATE;
  if TBluetoothProperty.SignedWrite in AProps then
    Result := Result or PROPERTY_SIGNED_WRITE;
  if TBluetoothProperty.ExtendedProps in AProps then
    Result := Result or PROPERTY_EXTENDED_PROPS;
end;

function CheckOSVersionForGattClient: Boolean;
begin
  Result := TOSVersion.Check(4, 3);
end;

function CheckOSVersionForGattServer: Boolean;
begin
  Result := TOSVersion.Check(5);
end;

// --------------------------------------------------------------------- //

{ TBluetoothBroadcastReceiverListener }

constructor TBluetoothBroadcastListener.Create(const AnAdapter: TAndroidBluetoothAdapter);
begin
  inherited Create;
  FAdapter := AnAdapter;
end;

procedure TBluetoothBroadcastListener.onReceive(context: JContext; intent: JIntent);
var
  LStrAction: string;
  LJBluetoothDevice: JBluetoothDevice;
  LDevice: TBluetoothDevice;
  LBTDevice: TAndroidBluetoothDevice;
begin
  LStrAction := JStringToString(intent.getAction);

  if LStrAction = JStringToString(TJBluetoothDevice.JavaClass.ACTION_FOUND) then
  begin
    LJBluetoothDevice := TJBluetoothDevice.Wrap(intent.getParcelableExtra(TJBluetoothDevice.JavaClass.EXTRA_DEVICE));
    LBTDevice := TAndroidBluetoothDevice.Create(LJBluetoothDevice);
    TAndroidBluetoothManager.AddDeviceToList(LBTDevice, TAndroidBluetoothManager(FAdapter.FManager).FDiscoveredDevices);
  end
  else if LStrAction = JStringToString(TJBluetoothAdapter.JavaClass.ACTION_DISCOVERY_STARTED) then
  begin
  end
  else if LStrAction = JStringToString(TJBluetoothAdapter.JavaClass.ACTION_DISCOVERY_FINISHED) then
  begin
    if (FAdapter.FDiscoveryThreadTimer <> nil) and FAdapter.FDiscoveryThreadTimer.FDiscovering and
       not FAdapter.FDiscoveryCancelled then
      if not FAdapter.FJAdapter.startDiscovery then
        FAdapter.FDiscoveryThreadTimer.FEvent.SetEvent;
  end
  else if LStrAction = JStringToString(TJBluetoothDevice.JavaClass.ACTION_BOND_STATE_CHANGED) then
  begin
    //Broadcast Action: Indicates a change in the bond state of a remote device. For example, if a device is bonded (paired).
    //Always contains the extra fields EXTRA_DEVICE, EXTRA_BOND_STATE and EXTRA_PREVIOUS_BOND_STATE.
    LJBluetoothDevice := TJBluetoothDevice.Wrap(intent.getParcelableExtra(TJBluetoothDevice.JavaClass.EXTRA_DEVICE));
    LBTDevice := TAndroidBluetoothDevice.Create(LJBluetoothDevice);
  end
  else if LStrAction = JStringToString(TJBluetoothDevice.JavaClass.ACTION_ACL_CONNECTED) then
  begin
    LJBluetoothDevice := TJBluetoothDevice.Wrap(intent.getParcelableExtra(TJBluetoothDevice.JavaClass.EXTRA_DEVICE));
  end
  else if LStrAction = JStringToString(TJBluetoothDevice.JavaClass.ACTION_ACL_DISCONNECTED) then
  begin
    LJBluetoothDevice := TJBluetoothDevice.Wrap(intent.getParcelableExtra(TJBluetoothDevice.JavaClass.EXTRA_DEVICE));
  end
  else if LStrAction = JStringToString(TJBluetoothAdapter.JavaClass.ACTION_SCAN_MODE_CHANGED) then
  begin
    if FAdapter.FOldScanMode = TJBluetoothAdapter.JavaClass.SCAN_MODE_CONNECTABLE_DISCOVERABLE  then
      FAdapter.DoDiscoverableEnd(FAdapter);
    FAdapter.FOldScanMode := intent.getIntExtra(TJBluetoothAdapter.JavaClass.EXTRA_SCAN_MODE, TJBluetoothAdapter.JavaClass.ERROR)
  end
  else if TOSVersion.Check(4, 0, 3) then // API Level 15
  begin
    if LStrAction = JStringToString(TJBluetoothDevice.JavaClass.ACTION_UUID) then
    begin
      LJBluetoothDevice := TJBluetoothDevice.Wrap(intent.getParcelableExtra(TJBluetoothDevice.JavaClass.EXTRA_DEVICE));
      for LDevice in TAndroidBluetoothManager(TBlueToothManager.Current).FPairedDevices do
      begin
        if TAndroidBluetoothDevice(LDevice).FJDevice.equals(LJBluetoothDevice) then
        begin
          LBTDevice := TAndroidBluetoothDevice(LDevice);
          LBTDevice.FEventUUIDS.SetEvent;
          break;
        end;
      end;
    end;
    // API Level 19
    if TOSVersion.Check(4, 4) then
    begin
      if LStrAction = JStringToString(TJBluetoothDevice.JavaClass.ACTION_PAIRING_REQUEST) then
      begin
        // EXTRA_DEVICE
        LJBluetoothDevice := TJBluetoothDevice.Wrap(intent.getParcelableExtra(TJBluetoothDevice.JavaClass.EXTRA_DEVICE));
        LBTDevice := TAndroidBluetoothDevice.Create(LJBluetoothDevice);
        FAdapter.DoRemoteRequestPair(LBTDevice);
      end
    end;
  end;
end;

{ TPlatformBluetoothClassicManager }

class function TPlatformBluetoothClassicManager.GetBluetoothManager: TBluetoothManager;
begin
  Result := TAndroidBluetoothManager.Create;
end;

{ TPlatformBluetoothLEManager }

class function TPlatformBluetoothLEManager.GetBluetoothManager: TBluetoothLEManager;
begin
  Result := TAndroidBluetoothLEManager.Create;
end;

{ TAndroidBluetoothAdapter }

procedure TAndroidBluetoothAdapter.DoCancelDiscovery;
begin
  FDiscoveryCancelled := True;
  if (FDiscoveryThreadTimer <> nil) then
    FDiscoveryThreadTimer.FEvent.SetEvent;
  FJAdapter.cancelDiscovery;
  FDiscoveryThreadTimer.Free;
end;

constructor TAndroidBluetoothAdapter.Create(const AManager: TBluetoothManager; const AJAdapter: JBluetoothAdapter);
begin
  inherited Create(AManager);

  // Do the magic
  FJAdapter := AJAdapter;
  FContext := TAndroidHelper.Context;

  FBroadcastListener := TBluetoothBroadcastListener.Create(Self);
  FBroadcastReceiver := TJFMXBroadcastReceiver.JavaClass.init(FBroadcastListener);

  FIntentFilter := TJIntentFilter.JavaClass.init(TJBluetoothDevice.JavaClass.ACTION_FOUND);
  FIntentFilter.addAction(TJBluetoothDevice.JavaClass.ACTION_BOND_STATE_CHANGED);
  FIntentFilter.addAction(TJBluetoothDevice.JavaClass.ACTION_ACL_CONNECTED);
  FIntentFilter.addAction(TJBluetoothDevice.JavaClass.ACTION_ACL_DISCONNECTED);
  FIntentFilter.addAction(TJBluetoothDevice.JavaClass.ACTION_ACL_DISCONNECT_REQUESTED);
  FIntentFilter.addAction(TJBluetoothAdapter.JavaClass.ACTION_DISCOVERY_STARTED);
  FIntentFilter.addAction(TJBluetoothAdapter.JavaClass.ACTION_DISCOVERY_FINISHED);
  FIntentFilter.addAction(TJBluetoothAdapter.JavaClass.ACTION_SCAN_MODE_CHANGED);
  // API Level 15
  if TOSVersion.Check(4, 0, 3) then
    FIntentFilter.addAction(TJBluetoothDevice.JavaClass.ACTION_UUID);
  // API Level 19
  if TOSVersion.Check(4, 4) then
    FIntentFilter.addAction(TJBluetoothDevice.JavaClass.ACTION_PAIRING_REQUEST);


  FContext.registerReceiver(FBroadcastReceiver, FIntentFilter);

  TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, ResultCallback);
  FRequestEnableCallback := False;
  FOldScanMode := TJBluetoothAdapter.JavaClass.ERROR;
end;

destructor TAndroidBluetoothAdapter.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageResultNotification, ResultCallback);
  // First cancel any pending discovery.
  FJAdapter.cancelDiscovery;
  // Unregister Receiver.
  FContext.unregisterReceiver(FBroadcastReceiver);
  FBroadcastReceiver := nil;
  FBroadcastListener.Free;
  FIntentFilter := nil;
  FJAdapter := nil;
  FContext := nil;

  inherited;
end;

function TAndroidBluetoothAdapter.DoCreateServerSocket(const AName: string; const AUUID: TGUID;
  Secure: Boolean): TBluetoothServerSocket;
var
  LJServerSocket: JBluetoothServerSocket;
  LJUUID: JUUID;
begin
  LJUUID := BluetoothUuidToJUuid(AUUID);
  if Secure then
    LJServerSocket := FJAdapter.listenUsingRfcommWithServiceRecord(StringToJString(AName), LJUUID)
  else
    LJServerSocket := FJAdapter.listenUsingInsecureRfcommWithServiceRecord(StringToJString(AName), LJUUID);
  Result := TAndroidBluetoothServerSocket.Create(LJServerSocket);
end;

function TAndroidBluetoothAdapter.GetAdapterName: string;
begin
  Result := JStringToString(FJAdapter.getName);
end;

function TAndroidBluetoothAdapter.GetAddress: TBluetoothMacAddress;
begin
  Result := JStringToString(FJAdapter.getAddress);
end;

function TAndroidBluetoothAdapter.GetPairedDevices: TBluetoothDeviceList;
var
  LSetDevices: JSet;
  LIterator: JIterator;
  LDevice: JBluetoothDevice;
begin
  TAndroidBluetoothManager(FManager).FPairedDevices.Clear;

  // Retrieve Paired Devices.
  LSetDevices := FJAdapter.getBondedDevices;
  LIterator := LSetDevices.iterator;
  if not LSetDevices.isEmpty then
    while LIterator.hasNext do
    begin
      LDevice := TJBluetoothDevice.Wrap(LIterator.next);
      TAndroidBluetoothManager(FManager).FPairedDevices.Add(TAndroidBluetoothDevice.Create(LDevice));
    end;

  Result := TAndroidBluetoothManager(FManager).FPairedDevices;
end;

function TAndroidBluetoothAdapter.GetRemoteDevice(const AnAddress: TBluetoothMacAddress): TBluetoothDevice;
begin
  Result := TAndroidBluetoothDevice.Create(FJAdapter.getRemoteDevice(StringToJString(AnAddress)));
end;

function TAndroidBluetoothAdapter.GetScanMode: TBluetoothScanMode;
var
  LScanMode: Integer;
begin
  LScanMode := FJAdapter.getScanMode;
  case LScanMode of
    20: Result := TBluetoothScanMode.None;
    21: Result := TBluetoothScanMode.Connectable;
    23: Result := TBluetoothScanMode.Discoverable;
  else
    raise EBluetoothAdapterException.Create(SBluetoothScanModeError);
  end;
end;

function TAndroidBluetoothAdapter.GetState: TBluetoothAdapterState;
begin
  case FJAdapter.getState of
    //  STATE_OFF, STATE_TURNING_ON, STATE_TURNING_OFF.
    10, 11, 13: Result := TBluetoothAdapterState.Off;
    //  STATE_ON
    12: begin
      if FJAdapter.isDiscovering then
        Result := TBluetoothAdapterState.Discovering
      else
        Result := TBluetoothAdapterState.&On;
    end;
  else
    raise EBluetoothAdapterException.Create(SBluetoothStateError);
  end;
end;

function TAndroidBluetoothAdapter.DoPair(const ADevice: TBluetoothDevice): Boolean;
begin
  // API Level 19
  if TOSVersion.Check(4, 4) then
    Result := TAndroidBluetoothDevice(ADevice).FJDevice.createBond
  else
    Result := False;
end;

procedure TAndroidBluetoothAdapter.SetAdapterName(const Value: string);
begin
  inherited;
  FJAdapter.setName(StringToJString(Value));
end;

procedure TAndroidBluetoothAdapter.DoStartDiscoverable(Timeout: Cardinal);
var
  LIntent: JIntent;
begin
  inherited;
  if FJAdapter.isEnabled and (FJAdapter.getScanMode <> TJBluetoothAdapter.JavaClass.SCAN_MODE_CONNECTABLE_DISCOVERABLE) then
  begin
    FWaitingCallBack := true;
    LIntent := TJIntent.JavaClass.init(TJBluetoothAdapter.JavaClass.ACTION_REQUEST_DISCOVERABLE);
    LIntent.putExtra(TJBluetoothAdapter.JavaClass.EXTRA_DISCOVERABLE_DURATION, Integer(Timeout));
    TAndroidHelper.Activity.startActivityForResult(LIntent, REQUEST_DISCOVERABLE);
    { Wait here until adapter becomes discoverable. It happens before the user answers system dialog about permissions }
    InternalProcessMessages;
    while FWaitingCallBack and (FJAdapter.getScanMode <> TJBluetoothAdapter.JavaClass.SCAN_MODE_CONNECTABLE_DISCOVERABLE) do
      InternalProcessMessages;
  end;
end;

procedure TAndroidBluetoothAdapter.ResultCallback(const Sender: TObject; const M: TMessage);
var
  LMessage: TMessageResultNotification;
begin
  LMessage := TMessageResultNotification(M);

   case LMessage.RequestCode of
    REQUEST_DISCOVERABLE:
     begin
//       { Now we can use  LMessage.RequestCode,  LMessage.ResultCode and  LMessage.Value (JIntent object) }
//       if LMessage.ResultCode <> 0 then
//       begin
//         { The user has accepted the Discoverable state. When it finishes show }
//       end;
       FWaitingCallback := False;
     end;
    REQUEST_ENABLE_BT: FRequestEnableCallback := False;
   end;
end;

procedure TAndroidBluetoothAdapter.DoStartDiscovery(Timeout: Cardinal);
begin
  if FJAdapter.isEnabled and not FJAdapter.isDiscovering then
  begin
    { Under Android you cannont Set the Timeout value for the Discovery }
    { Launch the Discovery }
    if FJAdapter.startDiscovery then
    begin
      TAndroidBluetoothManager(FManager).FDiscoveredDevices.Clear;
      // Start Timer for Discovery process.
      FDiscoveryCancelled := False;
      if FDiscoveryThreadTimer <> nil then
        FDiscoveryThreadTimer.DisposeOf;
      FDiscoveryThreadTimer := TThreadTimer.Create(Self, Self.DoDiscoveryEnd, Timeout);
      FDiscoveryThreadTimer.Start;
      // Ensure that wer are discovering before returning.
      while not FJAdapter.isDiscovering do
        Sleep(1);
    end;
  end;
end;

function TAndroidBluetoothAdapter.DoUnPair(const ADevice: TBluetoothDevice): Boolean;
begin
  { Cannot Unpair devices in Android. }
  raise EBluetoothAdapterException.CreateFmt(SBluetoothNotSupported, ['UnPair', 'Android']); // Do not translate.
end;

{ TAndroidBluetoothAdapter.TThreadTimer }

procedure TAndroidBluetoothAdapter.TThreadTimer.Cancel;
begin
  Terminate;
  FDiscovering := False;
  FEvent.SetEvent;
  if Assigned(FOnTimer) then
    FOnTimer := nil;
end;

constructor TAndroidBluetoothAdapter.TThreadTimer.Create(const AnAdapter: TBluetoothAdapter; const AEvent: TDiscoveryEndEvent; Timeout: Cardinal);
begin
  inherited Create(True);
  FAdapter := AnAdapter;
  FOnTimer := AEvent;
  FTimeout := Timeout;
  FEvent := TEvent.Create;
end;

destructor TAndroidBluetoothAdapter.TThreadTimer.Destroy;
begin
  Cancel;
  inherited;
  FEvent.Free;
end;

procedure TAndroidBluetoothAdapter.TThreadTimer.Execute;
var
  LWaitResult: TWaitResult;
begin
  inherited;
  FDiscovering := True;
  LWaitResult := FEvent.WaitFor(FTimeout);
  if LWaitResult = TWaitResult.wrTimeout then
  begin
    FDiscovering := False;
  end
  else
  if LWaitResult = TWaitResult.wrSignaled then
  begin
    // There has been a cancelation of the discover process.
    if TAndroidBluetoothAdapter(FAdapter).FDiscoveryCancelled then
      Exit;
    TAndroidBluetoothAdapter(FAdapter).FJAdapter.cancelDiscovery;
  end;
  TAndroidBluetoothAdapter(FAdapter).FJAdapter.cancelDiscovery;

  if not Terminated and not TAndroidBluetoothAdapter(FAdapter).FDiscoveryCancelled and Assigned(FOnTimer) then
  begin
    try
      FOnTimer(FAdapter, TAndroidBluetoothManager(TAndroidBluetoothAdapter(FAdapter).FManager).FDiscoveredDevices);
    except
      if Assigned(System.Classes.ApplicationHandleException) then
        System.Classes.ApplicationHandleException(Self)
      else
        raise;
    end;
  end;
end;

{ TAndroidBluetoothLEAdapter }

constructor TAndroidBluetoothLEAdapter.Create(const AManager: TBluetoothLEManager; const AJAdapter: JBluetoothAdapter);
begin
  inherited Create(AMAnager);
  FJAdapter := AJAdapter;

  FContext := TAndroidBluetoothLEManager(AManager).FContext;

  if TOSVersion.Check(4, 3) then
    if TOSVersion.Check(5) then
    begin
      FJScanListener := TScanCallback.Create(Self);
      FJScanCallback := TJRTLScanCallback.JavaClass.init(FJScanListener);
      FEventStartScan := TEvent.Create;
    end
    else
      FLeCallback := TBluetoothLeScanCallback.Create(Self);

  TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, ResultCallback);
  FRequestEnableCallback := False;
end;

destructor TAndroidBluetoothLEAdapter.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageResultNotification, ResultCallback);
  FLeCallback := nil;
  FJScanCallback := nil;
  FJScanListener := nil;
  FJAdapter := nil;
  FContext := nil;
  if FEventStartScan <> nil then
    FEventStartScan.Free;
  inherited;
end;

procedure TAndroidBluetoothLEAdapter.DoCancelDiscovery;
begin
  if TOSVersion.Check(5) then
  begin
    if (FJScanner <> nil) then
      FJScanner.stopScan(FJScanCallback)
  end
  else
    FJAdapter.stopLeScan(FLeCallback);
  if FTimerThread <> nil then
  begin
    FTimerThread.Cancel;
    FTimerThread.Free;
  end;
  inherited;
end;

procedure TAndroidBluetoothLEAdapter.DoDiscoveryEnd(const Sender: TObject; const ADeviceList: TBluetoothLEDeviceList);
begin
  TThread.Synchronize(nil, DoCancelDiscovery);
  inherited DoDiscoveryEnd(Sender, ADeviceList);
end;

function TAndroidBluetoothLEAdapter.DoStartDiscovery(Timeout: Cardinal; const FilterUUIDList: TBluetoothUUIDsList;
  const ABluetoothLEScanFilterList: TBluetoothLEScanFilterList): Boolean;
var
  LServiceUuids: TJavaObjectArray<JUUID>;
  LBluetoothLEScanFilterList: TBluetoothLEScanFilterList;
  I: Integer;
begin
  if (FTimerThread <> nil) and not (FTimerThread.Finished) then Exit(False);

  if FTimerThread <> nil then
    DoCancelDiscovery;
  TAndroidBluetoothLEManager.ClearDevicesFromList(FManager.LastDiscoveredDevices);
  FBluetoothLEScanFilterList := nil;
  LServiceUUIDs := BluetoothUUIDsListToJavaArrayUUID(FilterUUIDList);

  if TOSVersion.Check(5) then
  begin
    if (FilterUUIDList <> nil) and (FilterUUIDList.Count > 0) then
    begin
      LBluetoothLEScanFilterList := TBluetoothLEScanFilterList.Create;
      for I := 0 to FilterUUIDList.Count - 1 do
      begin
        LBluetoothLEScanFilterList.Add(TBluetoothLEScanFilter.Create);
        LBluetoothLEScanFilterList[I].ServiceUUID := FilterUUIDList[I];
      end;
      Result := DoStartDiscoveryRaw(LBluetoothLEScanFilterList);
    end
    else
      Result := DoStartDiscoveryRaw(ABluetoothLEScanFilterList);
  end
  else
    if LServiceUUIDs <> nil then
      Result := FJAdapter.startLeScan(LServiceUUIDs, FLeCallback)
    else
    begin
      FBluetoothLEScanFilterList := ABluetoothLEScanFilterList;
      Result := FJAdapter.startLeScan(FLeCallback);
    end;

  if Result then
  begin
    FTimerThread := TThreadTimer.Create(Self, Self.DoDiscoveryEnd, Timeout);
    FTimerThread.Start;
  end;
end;

function TAndroidBluetoothLEAdapter.DoStartDiscoveryRaw(const ABluetoothLEScanFilterList: TBluetoothLEScanFilterList; Refresh: Boolean): Boolean;

  function CreateScanFilters: JArrayList;
  const
    MANUFACTURER_IDMASK: Word = $0101;
    BEACON_MANUFACTURER_ID_POSITION = 0;
  var
    LJScanFilter_Builder: JScanFilter_Builder;
    LManufacturerSpecificData: TBytes;
    LManufacturerSpecificDataMask: TBytes;
    LManufacturerId: Word;
    I: Integer;
    LHardwareFilter: Boolean;
  begin
    LHardwareFilter := True;
    Result := TJArrayList.JavaClass.init;
    for I := 0 to ABluetoothLEScanFilterList.Count - 1 do
    begin

      if ABluetoothLEScanFilterList[I].ServiceUUID <> TBluetoothUUID.Empty  then
      begin
        LJScanFilter_Builder := TJScanFilter_Builder.JavaClass.init;
        if ABluetoothLEScanFilterList[I].ServiceUUIDMask <> TBluetoothUUID.Empty then
          LJScanFilter_Builder.setServiceUuid(TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid(ABluetoothLEScanFilterList[I].ServiceUUID)),
            TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid(ABluetoothLEScanFilterList[I].ServiceUUIDMask)))
        else
          LJScanFilter_Builder.setServiceUuid(TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid(ABluetoothLEScanFilterList[I].ServiceUUID)));

        if ABluetoothLEScanFilterList[I].ServiceData.Key <> TBluetoothUUID.Empty then
        begin
          if (ABluetoothLEScanFilterList[I].ServiceDataMask <> nil) and (ABluetoothLEScanFilterList[I].ServiceData.Value <> nil) and
            (Length(ABluetoothLEScanFilterList[I].ServiceDataMask) = Length(ABluetoothLEScanFilterList[I].ServiceData.Value)) then
            LJScanFilter_Builder.setServiceData(TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid(ABluetoothLEScanFilterList[I].ServiceData.Key)),
              TBytesToTJavaArray(ABluetoothLEScanFilterList[I].ServiceData.Value), TBytesToTJavaArray(ABluetoothLEScanFilterList[I].ServiceDataMask))
          else
            LJScanFilter_Builder.setServiceData(TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid(ABluetoothLEScanFilterList[I].ServiceData.Key)),
              TBytesToTJavaArray(ABluetoothLEScanFilterList[I].ServiceData.Value));

          ABluetoothLEScanFilterList[I].ServiceData := TServiceDataRawData.Create(TBluetoothUUID.Empty, nil);
        end
        else
        begin
          if (ABluetoothLEScanFilterList[I].ManufacturerSpecificData <> nil) and
         (Length(ABluetoothLEScanFilterList[I].ManufacturerSpecificData) > 1) then
          begin
            LManufacturerId := PWord(@ABluetoothLEScanFilterList[I].ManufacturerSpecificData[0])^;
            SetLength(LManufacturerSpecificData, Length(ABluetoothLEScanFilterList[I].ManufacturerSpecificData) -
              LManufacturerId.Size);
            Move(ABluetoothLEScanFilterList[I].ManufacturerSpecificData[LManufacturerId.Size], LManufacturerSpecificData[0],
              Length(LManufacturerSpecificData));
            if (ABluetoothLEScanFilterList[I].ManufacturerSpecificDataMask <> nil) and
             (Length(ABluetoothLEScanFilterList[I].ManufacturerSpecificData) =
               Length(ABluetoothLEScanFilterList[I].ManufacturerSpecificDataMask)) then
             begin
               SetLength(LManufacturerSpecificDataMask, Length(LManufacturerSpecificData));
               Move(ABluetoothLEScanFilterList[I].ManufacturerSpecificDataMask[LManufacturerId.Size], LManufacturerSpecificDataMask[0],
                 Length(LManufacturerSpecificDataMask));
               LJScanFilter_Builder.setManufacturerData(LManufacturerId, TBytesToTJavaArray(LManufacturerSpecificData),
                 TBytesToTJavaArray(LManufacturerSpecificDataMask));
               if PWord(@ABluetoothLEScanFilterList[I].ManufacturerSpecificDataMask[BEACON_MANUFACTURER_ID_POSITION])^ <
                 MANUFACTURER_IDMASK then
                 LHardwareFilter := False
             end
             else
               LJScanFilter_Builder.setManufacturerData(LManufacturerId, TBytesToTJavaArray(LManufacturerSpecificData));
             ABluetoothLEScanFilterList[I].ManufacturerSpecificData := nil;
          end;
        end;
        Result.add(LJScanFilter_Builder.build);
       end;

      if (ABluetoothLEScanFilterList[I].ManufacturerSpecificData <> nil) and
         (Length(ABluetoothLEScanFilterList[I].ManufacturerSpecificData) > 1) then
      begin
        LJScanFilter_Builder := TJScanFilter_Builder.JavaClass.init;
        LManufacturerId := PWord(@ABluetoothLEScanFilterList[I].ManufacturerSpecificData[0])^;
        SetLength(LManufacturerSpecificData, Length(ABluetoothLEScanFilterList[I].ManufacturerSpecificData) - LManufacturerId.Size);
        Move(ABluetoothLEScanFilterList[I].ManufacturerSpecificData[LManufacturerId.Size], LManufacturerSpecificData[0],
          Length(LManufacturerSpecificData));
        if (ABluetoothLEScanFilterList[I].ManufacturerSpecificDataMask <> nil) and
         (Length(ABluetoothLEScanFilterList[I].ManufacturerSpecificData) =
           Length(ABluetoothLEScanFilterList[I].ManufacturerSpecificDataMask)) then
         begin
           SetLength(LManufacturerSpecificDataMask, Length(LManufacturerSpecificData));
           Move(ABluetoothLEScanFilterList[I].ManufacturerSpecificDataMask[LManufacturerId.Size], LManufacturerSpecificDataMask[0],
             Length(LManufacturerSpecificDataMask));
           LJScanFilter_Builder.setManufacturerData(LManufacturerId, TBytesToTJavaArray(LManufacturerSpecificData),
             TBytesToTJavaArray(LManufacturerSpecificDataMask));
           if PWord(@ABluetoothLEScanFilterList[I].ManufacturerSpecificDataMask[BEACON_MANUFACTURER_ID_POSITION])^ <
             MANUFACTURER_IDMASK then
             LHardwareFilter := False
         end
         else
           LJScanFilter_Builder.setManufacturerData(LManufacturerId, TBytesToTJavaArray(LManufacturerSpecificData));
         Result.add(LJScanFilter_Builder.build);
      end;

      if ABluetoothLEScanFilterList[I].ServiceData.Key <> TBluetoothUUID.Empty then
      begin
        LJScanFilter_Builder := TJScanFilter_Builder.JavaClass.init;
        if (ABluetoothLEScanFilterList[I].ServiceDataMask <> nil) and (ABluetoothLEScanFilterList[I].ServiceData.Value <> nil) and
          (Length(ABluetoothLEScanFilterList[I].ServiceDataMask) = Length(ABluetoothLEScanFilterList[I].ServiceData.Value)) then
          LJScanFilter_Builder.setServiceData(TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid(ABluetoothLEScanFilterList[I].ServiceData.Key)),
            TBytesToTJavaArray(ABluetoothLEScanFilterList[I].ServiceData.Value), TBytesToTJavaArray(ABluetoothLEScanFilterList[I].ServiceDataMask))
        else
          LJScanFilter_Builder.setServiceData(TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid(ABluetoothLEScanFilterList[I].ServiceData.Key)),
            TBytesToTJavaArray(ABluetoothLEScanFilterList[I].ServiceData.Value));
        Result.add(LJScanFilter_Builder.build);
      end;

      if ABluetoothLEScanFilterList[I].LocalName <> '' then
      begin
        LJScanFilter_Builder := TJScanFilter_Builder.JavaClass.init;
        LJScanFilter_Builder.setDeviceName(StringToJString(ABluetoothLEScanFilterList[I].LocalName));
        Result.add(LJScanFilter_Builder.build);
      end;

      if ABluetoothLEScanFilterList[I].DeviceAddress <> '' then
      begin
        LJScanFilter_Builder := TJScanFilter_Builder.JavaClass.init;
        LJScanFilter_Builder.setDeviceAddress(StringToJString(ABluetoothLEScanFilterList[I].DeviceAddress));
        Result.add(LJScanFilter_Builder.build);
      end;

    end;
    if not LHardwareFilter then
      Result := nil;
  end;

var
  LJScanSettings_Builder: JScanSettings_Builder;
  LScanSettings: Integer;
begin
  FJAdapter.cancelDiscovery;
  if TOSVersion.Check(5) then
  begin
    LScanSettings := TAndroidBluetoothLEManager(FManager).ScanSettings;
    if (FJScanSettings = nil) or (FScanSettings <> LScanSettings) then
    begin
      FScanSettings := LScanSettings;
      LJScanSettings_Builder :=  TJScanSettings_Builder.JavaClass.init;
      LJScanSettings_Builder.setScanMode(FScanSettings);
      FJScanSettings := LJScanSettings_Builder.build;
    end;

    if FJScanner = nil then
      FJScanner :=  FJAdapter.getBluetoothLeScanner;

    if ABluetoothLEScanFilterList <> nil then
    begin
      if Refresh or (FJArrayListOfAdvertiseData = nil) then
        FJArrayListOfAdvertiseData := CreateScanFilters;
      if (FJArrayListOfAdvertiseData <> nil) then
      begin
        FBluetoothLEScanFilterList := nil;
        FJScanner.startScan(TJList.Wrap(FJArrayListOfAdvertiseData), FJScanSettings,FJScanCallback);
      end
      else
      begin
        FBluetoothLEScanFilterList := ABluetoothLEScanFilterList;
        FJScanner.startScan(nil, FJScanSettings,FJScanCallback);
      end;
    end
    else
      FJScanner.startScan(nil, FJScanSettings,FJScanCallback);

    FEventStartScan.ResetEvent;
    FEventStartScan.WaitFor(1000);

    if FStartScanFailed > 1 then // SCAN_FAILED_ALREADY_STARTED $01
      Result := False
    else
      Result := True;
  end
  else
  begin
    FBluetoothLEScanFilterList := ABluetoothLEScanFilterList;
    Result := FJAdapter.startLeScan(FLeCallback);
  end;
end;

function TAndroidBluetoothLEAdapter.GetAdapterName: string;
begin
  Result := JStringToString(FJAdapter.getName);
end;

function TAndroidBluetoothLEAdapter.GetAddress: TBluetoothMacAddress;
begin
  Result := JStringToString(FJAdapter.getAddress);
end;

function TAndroidBluetoothLEAdapter.GetRemoteDevice(const AnAddress: TBluetoothMacAddress): TBluetoothLEDevice;
begin
  Result := TAndroidBluetoothLEDevice.Create(FJAdapter.getRemoteDevice(StringToJString(AnAddress)), True);
end;

function TAndroidBluetoothLEAdapter.GetScanMode: TBluetoothScanMode;
var
  LScanMode: Integer;
begin
  LScanMode := FJAdapter.getScanMode;
  case LScanMode of
    20: Result := TBluetoothScanMode.None;
    21: Result := TBluetoothScanMode.Connectable;
    23: Result := TBluetoothScanMode.Discoverable;
  else
    raise EBluetoothLEAdapterException.Create(SBluetoothScanModeError);
  end;
end;

function TAndroidBluetoothLEAdapter.GetState: TBluetoothAdapterState;
begin

  case FJAdapter.getState of
    //  STATE_OFF, STATE_TURNING_ON, STATE_TURNING_OFF.
    10, 11, 13: Result := TBluetoothAdapterState.Off;
    //  STATE_ON
    12: begin
      if FJAdapter.isDiscovering then
        Result := TBluetoothAdapterState.Discovering
      else
        Result := TBluetoothAdapterState.&On;
    end;
  else
    raise EBluetoothLEAdapterException.Create(SBluetoothStateError);
  end;
end;

procedure TAndroidBluetoothLEAdapter.SetAdapterName(const Value: string);
begin
  inherited;
  FJAdapter.setName(StringToJString(Value));
end;

procedure TAndroidBluetoothLEAdapter.ResultCallback(const Sender: TObject; const M: TMessage);
begin
  if TMessageResultNotification(M).RequestCode = REQUEST_ENABLE_BT then
    FRequestEnableCallback := False;
end;

{ TAndroidBluetoothLEAdapter.TThreadTimer }

constructor TAndroidBluetoothLEAdapter.TThreadTimer.Create(const AnAdapter: TBluetoothLEAdapter;
  const AEvent: TDiscoveryLEEndEvent; Timeout: Cardinal);
begin
  inherited Create(True);
  FAdapter := AnAdapter;
  FOnTimer := AEvent;
  FTimeout := Timeout;
  FEvent := TEvent.Create;
end;

destructor TAndroidBluetoothLEAdapter.TThreadTimer.Destroy;
begin
  Cancel;
  FEvent.Free;
  inherited;
end;

procedure TAndroidBluetoothLEAdapter.TThreadTimer.Cancel;
begin
  Terminate;
  if Assigned(FOnTimer) then
  begin
    FOnTimer := nil;
    FEvent.SetEvent;
  end;
end;

procedure TAndroidBluetoothLEAdapter.TThreadTimer.Execute;
begin
  inherited;
  FEvent.WaitFor(FTimeout);
  if not Terminated and Assigned(FOnTimer) then
  begin
    try
      FOnTimer(FAdapter, TAndroidBluetoothLEAdapter(FAdapter).FManager.LastDiscoveredDevices);
    except
      if Assigned(System.Classes.ApplicationHandleException) then
        System.Classes.ApplicationHandleException(Self)
      else
        raise;
    end;
  end;
end;

{ TAndroidBluetoothManager }

constructor TAndroidBluetoothManager.Create;
var
  LocalManager: JObject;
begin
  inherited;
  { This code needs API_18 }
  if TOsVersion.Check(4, 3) then
  begin
    FContext := TAndroidHelper.Context;
    LocalManager := FContext.getSystemService(TJContext.JavaClass.BLUETOOTH_SERVICE);
    if LocalManager <> nil then
      FJManager := TJBluetoothManager.Wrap(LocalManager);
  end;
end;

destructor TAndroidBluetoothManager.Destroy;
begin
  FJManager := nil;
  FContext := nil;
  inherited;
end;

function TAndroidBluetoothManager.GetAdapterState: TBluetoothAdapterState;
begin
  if FAdapter = nil then
  begin
    { API Level 18; }
    if TOSVersion.Check(4,3) then
      FAdapter := TAndroidBluetoothAdapter.Create(Self, FJManager.getAdapter)
    else
      FAdapter := TAndroidBluetoothAdapter.Create(Self, TJBluetoothAdapter.JavaClass.getDefaultAdapter);
  end;
  Result := FAdapter.State;
end;

function TAndroidBluetoothManager.DoGetClassicAdapter: TBluetoothAdapter;
var
  LAndroidBluetoothAdapter: TAndroidBluetoothAdapter;
begin
  if GetAdapterState = TBluetoothAdapterState.Off then
  begin
    LAndroidBluetoothAdapter := TAndroidBluetoothAdapter(FAdapter);
    if LAndroidBluetoothAdapter.FRequestEnableCallback then
    begin
      InternalProcessMessages;
      while LAndroidBluetoothAdapter.FRequestEnableCallback do
        InternalProcessMessages;

      if GetAdapterState = TBluetoothAdapterState.Off then
        FAdapter := nil;
    end
    else
      FAdapter := nil;
  end;
  Result := FAdapter;
end;

function TAndroidBluetoothManager.GetConnectionState: TBluetoothConnectionState;
begin
  if GetAdapterState = TBluetoothAdapterState.Off then
    Result := TBluetoothConnectionState.Disconnected
  else
    Result := TBluetoothConnectionState.Connected;
end;

function TAndroidBluetoothManager.DoEnableBluetooth: Boolean;
var
  LIntent: JIntent;
begin
  if GetConnectionState = TBluetoothConnectionState.Disconnected then
  begin
    TAndroidBluetoothAdapter(FAdapter).FRequestEnableCallback := True;
    TThread.CreateAnonymousThread(procedure begin
      LIntent := TJIntent.JavaClass.init(TJBluetoothAdapter.JavaClass.ACTION_REQUEST_ENABLE);
      TAndroidHelper.Activity.startActivityForResult(LIntent, REQUEST_ENABLE_BT);
    end).Start;
  end;
  Result := True;
end;

{ TAndroidBluetoothDevice }

constructor TAndroidBluetoothDevice.Create(const AJDevice: JBluetoothDevice);
begin
  inherited Create;
  FJDevice := AJDevice;
  FEventUUIDS := TEvent.Create;
end;

destructor TAndroidBluetoothDevice.Destroy;
begin
  FEventUUIDS.Free;
  FJDevice := nil;
  inherited;
end;

function TAndroidBluetoothDevice.DoCreateClientSocket(const AUUID: TGUID; Secure: Boolean): TBluetoothSocket;
var
  LJUUID: JUUID;
  LJSocket: JBluetoothSocket;
begin
  Result := nil;
  LJUUID := BluetoothUuidToJUuid(AUUID);

  if Secure then
    LJSocket := FJDevice.createRfcommSocketToServiceRecord(LJUUID)
  else
    LJSocket := FJDevice.createInsecureRfcommSocketToServiceRecord(LJUUID);

  if LJSocket <> nil then
    Result := TAndroidBluetoothSocket.Create(LJSocket);
end;

function TAndroidBluetoothDevice.DoGetServices: TBluetoothServiceList;
var
  LJArray: TJavaObjectArray<JParcelUuid>;
  LParcel: JParcelUuid;
  I: Integer;
  LLength: Integer;
  LService: TBluetoothService;
begin
  FServiceList.Clear;
  try
    { API Level 15 }
    if TOSVersion.Check(4, 0, 2) then
    begin
      FEventUUIDS.ResetEvent;
      if FJDevice.fetchUuidsWithSdp then
        FEventUUIDS.WaitFor(BluetoothServicesTimeout);

      LJArray := FJDevice.getUuids;
      LLength := 0;
      if LJArray <> nil then
        LLEngth := LJArray.Length;
      for I := 0 to LLength - 1 do
      begin
        LParcel := TJParcelUuid.Wrap(LJArray.GetRawItem(I));
        LService.UUID := JUuidToBluetoothUuid(LParcel.getUuid);

        LService.Name := TAndroidBluetoothManager.GetKnownServiceName(LService.UUID);

        FServiceList.Add(LService);
      end;
    end;
  finally
    Result := FServiceList;
  end;
end;

function TAndroidBluetoothDevice.GetAddress: TBluetoothMacAddress;
begin
  Result := JStringToString(FJDevice.getAddress);
end;

function TAndroidBluetoothDevice.GetBluetoothType: TBluetoothType;
begin
  { Check API Level 18 and ask for BT Type }
  if TOSVersion.Check(4, 3) then
    Result := TBluetoothType(FJDevice.getType)
  else
    Result := TBluetoothType.Classic;
end;

function TAndroidBluetoothDevice.GetClassDevice: Integer;
begin
  Result := FJDevice.getBluetoothClass.getDeviceClass;
end;

function TAndroidBluetoothDevice.GetClassDeviceMajor: Integer;
begin
  Result := FJDevice.getBluetoothClass.getMajorDeviceClass;
end;

function TAndroidBluetoothDevice.GetDeviceName: string;
begin
  Result := JStringToString(FJDevice.getName);
end;

function TAndroidBluetoothDevice.GetOnDiscoverService: TDiscoverServiceEvent;
begin
  Result := FDiscoverServiceEvent;
end;

function TAndroidBluetoothDevice.GetPaired: Boolean;
begin
  Result := FJDevice.getBondState = TJBluetoothDevice.JavaClass.BOND_BONDED;
end;

function TAndroidBluetoothDevice.GetState: TBluetoothDeviceState;
var
  LBondState: Integer;
begin
  LBondState := FJDevice.getBondState;
  case LBondState of
    10: Result := TBluetoothDeviceState.None;
    11: Result := TBluetoothDeviceState.None; //11: Result := TBluetoothDeviceState.Pairing;
    12: Result := TBluetoothDeviceState.Paired;
  else
    raise EBluetoothAdapterException.CreateFmt(SBluetoothDeviceStateError, [GetDeviceName]);
  end;
end;

function TAndroidBluetoothDevice.Pair: Boolean;
begin
  { API Level 19 }
  if TOSVersion.Check(4, 4) then
    Result := FJDevice.createBond
  else
    Result := False;
end;

procedure TAndroidBluetoothDevice.SetOnDiscoverService(const Value: TDiscoverServiceEvent);
begin
  FDiscoverServiceEvent := Value;
end;

{ TAndroidBluetoothSocket }

procedure TAndroidBluetoothSocket.DoClose;
begin
  FConnected := False;
  if FJBluetoothSocket.isConnected then
  begin
    if FJOStream <> nil then
    begin
      FJOStream.close;
      FJOStream := nil;
    end;
    if FJIStream <> nil then
    begin
      FJIStream.close;
      FJIStream := nil;
    end;
    FJBluetoothSocket.close;
  end;
end;

procedure TAndroidBluetoothSocket.DoConnect;
begin
  //TBluetoothManager.Current.CancelDiscovery; // TODO -cCHECK
  FJBluetoothSocket.connect;
  FConnected := True;
end;

constructor TAndroidBluetoothSocket.Create(const ASocket: JBluetoothSocket);
begin
  inherited Create;
  FJBluetoothSocket := ASocket;
  FJBytes := TJavaArray<System.Byte>.Create(BUFFER_SIZE);

  FSocketEvent := TEvent.Create;
  FReaderEvent := TEvent.Create;

  FDestroying := False;

  FReader := TAndroidBluetoothSocket.TBluetoothSocketReader.Create(Self, BUFFER_SIZE);
  FReader.Start;
  FSocketEvent.WaitFor(SocketEventTimeout);
  FSocketEvent.ResetEvent;
end;

destructor TAndroidBluetoothSocket.Destroy;
begin
  FDestroying := True;
  if FJOStream <> nil then
    FJOStream.close;
  if FJIStream <> nil then
    FJIStream.close;
  if FJBluetoothSocket.isConnected then
    FJBluetoothSocket.close;

  FReader.DisposeOf;
  FReader := nil;

  FSocketEvent.SetEvent;

  FReaderEvent.Free;
  FSocketEvent.Free;

  FJOStream := nil;
  FJIStream := nil;
  FJBluetoothSocket := nil;
  FJBytes.Free;

  inherited;
end;

function TAndroidBluetoothSocket.GetConnected: Boolean;
begin
  if TOsVersion.Check(4) then
    Result := FConnected and (FJBluetoothSocket <> nil) and FJBluetoothSocket.isConnected
  else Result := FConnected;
end;

function TAndroidBluetoothSocket.GetRemoteDevice: TBluetoothDevice;
begin
  Result := TAndroidBluetoothDevice.Create(FJBluetoothSocket.getRemoteDevice);
end;

function TAndroidBluetoothSocket.DoReceiveData(ATimeout: Cardinal): TBytes;
var
  LReaded: Integer;
  LCount: Integer;
  LTime: Cardinal;
begin
  if FJIStream = nil then
    FJIStream := TJInputStream.Wrap(FJBluetoothSocket.getInputStream);

  LCount := 0;
  SetLength(Result, LCount);
  if (FJIStream <> nil) and (FReader <> nil) then
  begin
    // Tell Reader to start reading;
    FSocketEvent.ResetEvent;
    FReaderEvent.SetEvent;

    if Atimeout = 0 then
      LTime := 1
    else
      LTime := ATimeout;
    // Wait until Reader reads or timeout or error
    if FSocketEvent.WaitFor(LTime) <> TWaitResult.wrSignaled then
      Exit;

    if FReader <> nil then
    begin
      LReaded := FReader.GetBufferedDataSize;
      if LReaded < 0 then
        raise EBluetoothSocketException.Create(SBluetoothRFChannelClosed)
      else
      begin
        // Check for already readed data.
        if LReaded > 0 then
        begin
          SetLength(Result, LCount + LReaded);
          FReader.GetBufferedData(Result, LCount);
          LCount := LCount + LReaded;
        end;

        // Check for available data.
        repeat
          try
            if (FJIStream <> nil) and (FJIStream.available <> 0) then
              LReaded := FJIStream.read(FJBytes)
            else
              Break;
          except
            LReaded := -1;
          end;
          if LReaded < 0 then
            raise EBluetoothSocketException.Create(SBluetoothRFChannelClosed);
          SetLength(Result, LCount + LReaded);
          Move(PByte(FJBytes.Data)^, Result[LCount], LReaded);
          LCount := LCount + LReaded;
        until (LReaded < BUFFER_SIZE) or (FJIStream = nil);
      end;
    end;
  end;
end;

procedure TAndroidBluetoothSocket.DoSendData(const AData: TBytes);
var
  LJBytes: TJavaArray<System.Byte>;
begin
  inherited;
  if FJOStream = nil then
    FJOStream := TJOutputStream.Wrap(FJBluetoothSocket.getOutputStream);

  if FJOStream <> nil then
  begin
    LJBytes := TBytesToTJavaArray(AData);
    try
      FJOStream.write(LJBytes);
    finally
      LJBytes.Free;
    end;
  end
  else
    EBluetoothSocketException.Create(SBluetoothSocketOutputStreamError);
end;

{ TAndroidBluetoothServerSocket }

function TAndroidBluetoothServerSocket.DoAccept(Timeout: Cardinal): TBluetoothSocket;
var
  LSocket: JBluetoothSocket;
begin
  try
    LSocket := FJServerSocket.accept(Timeout);
    Result := TAndroidBluetoothSocket.Create(LSocket);
  except
    Result := nil;
  end;
end;

procedure TAndroidBluetoothServerSocket.DoClose;
begin
  inherited;
  FJServerSocket.close;
end;

constructor TAndroidBluetoothServerSocket.Create(const AServerSocket: JBluetoothServerSocket);
begin
  inherited Create;
  FJServerSocket := AServerSocket;
end;

destructor TAndroidBluetoothServerSocket.Destroy;
begin
  FJServerSocket.close;
  FJServerSocket := nil;
  inherited;
end;

{ TBluetoothLeScanCallback }

function ServiceUUIDToGUID(const AData: TBytes): TGUID;
var
  W: Word;
  TB: TBytes;
  I, Z : Integer;
begin
  if Length(AData) = 2 then
  begin
    Result := BLUETOOTH_BASE_UUID;
    WordRec(W).Hi := Adata[0];
    WordRec(W).Lo := Adata[1];
    Result.D1 := Cardinal(W);
  end
  else
  begin
    Z := 0;
    SetLength(TB, Length(AData));
    for I := Length(AData) - 1 downto 0 do
    begin
      TB[Z] := AData[I];
      Inc(Z);
    end;
    Result := TGUID.Create(PByte(TB)^, TEndian.Big);
  end;
end;

function ScanRecordToTScanResponse(const AScanRecord: TJavaArray<Byte>; const AScanResponse: TScanResponse): TScanResponse;
var
  I:Integer;
  LDataLength, LTotalLength: Byte;
  LScanRecord: TBytes;
  LCurrentData: TBytes;
  LAdType: Byte;
begin
  if AScanResponse = nil then
    Result := TScanResponse.Create
  else
    Result := AScanResponse;
  LScanRecord := TJavaArrayToTBytes(AScanRecord);
  LTotalLength := Length(LScanRecord);
  I := 0;
  LDataLength := LScanRecord[I];
  while (I <= LTotalLength) do
  begin
    Inc(I);
    if (LDataLength > 0) then
    begin
      LAdType := LScanRecord[I];
      Setlength(LCurrentData, LDataLength - 1);
      Move(LScanRecord[I+1], LCurrentData[0], LDataLength - 1);
      Result.AddOrSetValue(TScanResponseKey(LAdType), LCurrentData);
    end;
      Inc(I, LDataLength);
      if (I < LTotalLength) then
        LDataLength := LScanRecord[I];
  end;
end;

constructor TBluetoothLeScanCallback.Create(const AnAdapter: TAndroidBluetoothLEAdapter);
begin
  inherited Create;
  FAdapter := AnAdapter;
end;

procedure TBluetoothLeScanCallback.onLeScan(device: JBluetoothDevice; rssi: Integer; scanRecord: TJavaArray<Byte>);
var
  LDevice: TAndroidBluetoothLEDevice;
  LNew: Boolean;
  LDiscovered: Boolean;
begin
  LNew := False;
  LDevice := TAndroidBluetoothLEDevice(TAndroidBluetoothLEManager.GetDeviceInList(JStringToString(device.getAddress),
    FAdapter.FManager.LastDiscoveredDevices));
  if LDevice = nil then
  begin
    //wn{wn}
    uAndroidLog.AndroidLogDebug('TBluetoothLeScanCallback.onLeScan');
    LDevice := TAndroidBluetoothLEDevice.Create(device,
        GetIsBLEDeviceAutoConnect((device as ILocalObject).GetObjectID),
        FAdapter.FManager.ForceRefreshCachedDevices);
//    LDevice := TAndroidBluetoothLEDevice.Create(device, False, FAdapter.FManager.ForceRefreshCachedDevices);
    LNew := True;
  end
  else
    LDevice.FJDevice := device;
  LDevice.FAdvertisedData := ScanRecordToTScanResponse(scanRecord, LDevice.FAdvertisedData);
  LDevice.FLastRSSI := rssi;
  LDiscovered := True;

  if LNew and (FAdapter.FBluetoothLEScanFilterList <> nil) then
   if not FAdapter.DoDeviceOvercomesFilters(LDevice, FAdapter.FBluetoothLEScanFilterList) then
   begin
     LDiscovered := False;
     LNew := False;
   end;

   if LNew then
     TAndroidBluetoothLEManager.AddDeviceToList(LDevice, FAdapter.FManager.LastDiscoveredDevices);
   if LDiscovered then
     FAdapter.DoDiscoverDevice(FAdapter, LDevice, rssi, LDevice.FAdvertisedData);
end;

{ TAndroidBluetoothGattServer }

constructor TAndroidBluetoothGattServer.Create(const AManager: TAndroidBluetoothLEManager; const AnAdapter: TAndroidBluetoothLEAdapter);
begin
  inherited Create(AManager);
  FJGattServerListener := TAndroidBluetoothGattServerListener.Create(Self);
  FJGattServerCallback := TJRTLBluetoothGattServerCallback.JavaClass.init(FJGattServerListener);
  FJGattServer := AManager.FJManager.openGattServer(Amanager.FContext, FJGattServerCallback);
end;

destructor TAndroidBluetoothGattServer.Destroy;
begin
  FJGattServerCallback := nil;
  FJGattServerListener := nil;
  FJGattServer := nil;
  inherited;
end;

function TAndroidBluetoothGattServer.DoCreateCharacteristic(const AService: TBluetoothGattService;
  const AnUUID: TBluetoothUUID; const AProps: TBluetoothPropertyFlags;
  const ADescription: string): TBluetoothGattCharacteristic;
begin
  Result := TAndroidBluetoothGattService(AService).CreateCharacteristic(AnUUID, AProps, ADescription);
end;

function TAndroidBluetoothGattServer.DoCreateDescriptor(const ACharacteristic: TBluetoothGattCharacteristic;
  const AnUUID: TBluetoothUUID): TBluetoothGattDescriptor;
begin
  Result := TAndroidBluetoothGattCharacteristic(ACharacteristic).CreateDescriptor(AnUUID);
end;

function TAndroidBluetoothGattServer.DoCreateIncludedService(const AService: TBluetoothGattService;
  const AnUUID: TBluetoothUUID; AType: TBluetoothServiceType): TBluetoothGattService;
begin
  Result := TAndroidBluetoothGattService(AService).CreateIncludedService(AnUUID, AType);
end;

function TAndroidBluetoothGattServer.DoCreateService(const AnUUID: TBluetoothUUID; AType: TBluetoothServiceType): TBluetoothGattService;
var
  LJService: JBluetoothGattService;
begin
  LJService := TJBluetoothGattService.JavaClass.init(BluetoothUuidToJUuid(AnUUID), Integer(AType));
  Result := TAndroidBluetoothGattService.Create(AnUUID, AType, LJService);
end;

function TAndroidBluetoothGattServer.DoAddCharacteristic(const AService: TBluetoothGattService;
  const ACharacteristic: TBluetoothGattCharacteristic): Boolean;
begin
  Result := TAndroidBluetoothGattService(AService).DoAddCharacteristic(ACharacteristic);
end;

function TAndroidBluetoothGattServer.DoAddService(const AService: TBluetoothGattService): Boolean;
var
  LJBluetoothGattService: JBluetoothGattService;
begin
  LJBluetoothGattService := TAndroidBluetoothGattService(AService).FJService;
  Result := FJGattServer.addService(LJBluetoothGattService);
end;

procedure TAndroidBluetoothGattServer.DoCharacteristicReadRequest(const ADevice: TBluetoothLEDevice; ARequestId,
  AnOffset: Integer; const AGattCharacteristic: TBluetoothGattCharacteristic);
var
  LStatus: TBluetoothGattStatus;
  LOffset: Integer;
  LValue: TBytes;
begin
  LStatus := TBluetoothGattStatus(TJBluetoothGatt.JavaClass.GATT_SUCCESS);
  if AnOffset = 0 then
    DoOnCharacteristicRead(Self, AGattCharacteristic, LStatus);

  LValue := TAndroidBluetoothGattCharacteristic(AGattCharacteristic).DoGetValue;
  LOffset := Length(LValue) - AnOffset;
  if LOffset <= 0 then
  begin
    SetLength(LValue, 0);
    DoSendResponse(ADevice, ARequestId, Integer(LStatus), 0, LValue);
  end
  else
  begin
    if AnOffset > 0 then
    begin
      Move(LValue[AnOffset], LValue[0], LOffset);
      setLength(LValue, LOffset);
    end;
    DoSendResponse(ADevice, ARequestId, Integer(LStatus), AnOffset, LValue);
  end;
end;

procedure TAndroidBluetoothGattServer.DoCharacteristicWriteRequest(const ADevice: TBluetoothLEDevice; ARequestId: Integer;
  const AGattCharacteristic: TBluetoothGattCharacteristic; APreparedWrite, AResponseNeeded: Boolean; AnOffset: Integer;
  const AValue: TBytes);
var
  LStatus: TBluetoothGattStatus;
  LOffset: Integer;
  LValue: TBytes;
  LTotal: Integer;
begin
  LStatus := TBluetoothGattStatus(TJBluetoothGatt.JavaClass.GATT_SUCCESS);
  if AnOffset > 0 then
  begin
    LTotal := Length(AValue);
    LOffset := AnOffset + LTotal;
    LValue := TAndroidBluetoothGattCharacteristic(AGattCharacteristic).DoGetValue;
    SetLength(LValue, LOffset);
    Move(AValue[0], LValue[AnOffset], LTotal);
    TAndroidBluetoothGattCharacteristic(AGattCharacteristic).DoSetValue(LValue);
  end
  else
    TAndroidBluetoothGattCharacteristic(AGattCharacteristic).DoSetValue(AValue);

  FLastRWrittenGattCharacteristic := AGattCharacteristic;
  if not APreparedWrite then
    DoOnCharacteristicWrite(ADevice, AGattCharacteristic, LStatus, AValue);
  if AResponseNeeded then
    DoSendResponse(ADevice, ARequestId, Integer(LStatus), AnOffset, AValue);
end;

procedure TAndroidBluetoothGattServer.DoClearServices;
begin
  inherited;
  StopAdvertising;
  FJGattServer.clearServices;
  FServices.Clear;
end;

procedure TAndroidBluetoothGattServer.DoClientConfigurationWrite(const ADescriptor: TBluetoothGattDescriptor;
  const OldValue: TArray<Byte>; const AClient: TBluetoothLEDevice);

  function IsNotifyDisabled(const AValue: TArray<Byte>): Boolean;
  begin
    Result := (Length(AValue) = 2) and (AValue[0] = $00) and (AValue[1] = $00);
  end;

  function IsNotifyEnabled(const AValue: TArray<Byte>): Boolean;
  begin
    Result := (Length(AValue) = 2) and (AValue[0] = $01) and (AValue[1] = $00);
  end;

  function IsIndicateEnabled(const AValue: TArray<Byte>): Boolean;
  begin
    Result := (Length(AValue) = 2) and (AValue[0] = $02) and (AValue[1] = $00);
  end;
begin

  if IsNotifyDisabled(OldValue) and (IsNotifyEnabled(ADescriptor.Value) or IsIndicateEnabled(ADescriptor.Value)) then
    DoOnClientSubscribed(Self, AClient.Identifier, ADescriptor.GetCharacteristic)
  else
    if IsNotifyDisabled(ADescriptor.Value) and (IsNotifyEnabled(OldValue) or IsIndicateEnabled(OldValue)) then
      DoOnClientUnsubscribed(Self, AClient.Identifier, ADescriptor.GetCharacteristic);
end;

procedure TAndroidBluetoothGattServer.DoClose;
begin
  FJGattServer.close;
end;

function TAndroidBluetoothGattServer.DoConnect(const ADevice: TBluetoothLEDevice; AutoConnect: Boolean): Boolean;
begin
  Result := FJGattServer.connect(TAndroidBluetoothDevice(ADevice).FJDevice, AutoConnect);
end;

procedure TAndroidBluetoothGattServer.DoDescriptorReadRequest(const ADevice: TBluetoothLEDevice; ARequestId,
  AnOffset: Integer; const ADescriptor: TBluetoothGattDescriptor);
var
  LStatus: TBluetoothGattStatus;
  LOffset: Integer;
  LValue: TBytes;
begin
  LStatus := TBluetoothGattStatus(TJBluetoothGatt.JavaClass.GATT_SUCCESS);
  LValue :=  TAndroidBluetoothGattDescriptor(ADescriptor).GetValue;
  LOffset := Length(LValue) - AnOffset;
  if LOffset <= 0 then
  begin
    SetLength(LValue, 0);
    DoSendResponse(ADevice, ARequestId, Integer(LStatus), 0, LValue);
  end
  else
  begin
    if AnOffset > 0 then
    begin
      Move(LValue[AnOffset], LValue[0], LOffset);
      setLength(LValue, LOffset);
    end;
    DoSendResponse(ADevice, ARequestId, Integer(LStatus), AnOffset, LValue);
  end;
end;

procedure TAndroidBluetoothGattServer.DoDescriptorWriteRequest(const ADevice: TBluetoothLEDevice; ARequestId: Integer;
  const ADescriptor: TBluetoothGattDescriptor; APreparedWrite, AResponseNeeded: Boolean; AnOffset: Integer;
  const AValue: TBytes);
var
  LStatus: TBluetoothGattStatus;
  LOffset: Integer;
  LValue: TBytes;
  LTotal: Integer;
  LOldValue: TBytes;
begin
  LStatus := TBluetoothGattStatus(TJBluetoothGatt.JavaClass.GATT_SUCCESS);
  LOldValue := TAndroidBluetoothGattDescriptor(ADescriptor).Value;
  if AnOffset > 0 then
  begin
    LTotal := Length(AValue);
    LOffset := AnOffset + LTotal;
    LValue := TAndroidBluetoothGattDescriptor(ADescriptor).DoGetValue;
    SetLength(LValue, LOffset);
    Move(AValue[0], LValue[AnOffset], LTotal);
    TAndroidBluetoothGattDescriptor(ADescriptor).DoSetValue(LValue);
  end
  else
    TAndroidBluetoothGattDescriptor(ADescriptor).DoSetValue(AValue);
  if ADescriptor.Kind = TBluetoothDescriptorKind.ClientConfiguration then
    DoClientConfigurationWrite(ADescriptor, LOldValue, ADevice);
  if AResponseNeeded then
    DoSendResponse(ADevice, ARequestId, Integer(LStatus), AnOffset, AValue);
end;

function TAndroidBluetoothGattServer.FindCharacteristic(const AJCharacteristic: JBluetoothGattCharacteristic): TAndroidBluetoothGattCharacteristic;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FServices.Count - 1 do
  begin
    Result := TAndroidBluetoothGattService(FServices[I]).FindCharacteristic(AJCharacteristic);
    if Result <> nil then
      Break;
  end;
end;

procedure TAndroidBluetoothGattServer.DoDisconnect(const ADevice: TBluetoothLEDevice);
begin
  FJGattServer.cancelConnection(TAndroidBluetoothDevice(ADevice).FJDevice);
end;

procedure TAndroidBluetoothGattServer.DoExecuteWrite(const ADevice: TBluetoothLEDevice; ARequestId: Integer;
  Execute: Boolean);
var
  LStatus: TBluetoothGattStatus;
  LValue: TBytes;
begin
  inherited;
  if Execute then
  begin
    LStatus := TBluetoothGattStatus(TJBluetoothGatt.JavaClass.GATT_SUCCESS);
    LValue := TAndroidBluetoothGattCharacteristic(FLastRWrittenGattCharacteristic).DoGetValue;
    DoOnCharacteristicWrite(ADevice, FLastRWrittenGattCharacteristic, LStatus, LValue);
    DoSendResponse(ADevice, ARequestId, Integer(LStatus), Length(LValue), LValue);
  end;
end;

function TAndroidBluetoothGattServer.DoCreateAdvertiseData: TBluetoothLEAdvertiseData;
begin
  Result := TAndroidBluetoothLEAdvertiseData.create(TBluetoothGattServer(Self), FManager.CurrentAdapter, nil);
end;

function TAndroidBluetoothGattServer.DoGetServices: TBluetoothGattServiceList;
var
  LJList: JList;
  I: Integer;
  LJService: JBluetoothGattService;
begin
  if FServices.Count = 0 then
  begin
    LJList := FJGattServer.getServices;
    for I := 0 to LJLIst.size - 1 do
    begin
      LJService := TJBluetoothGattService.Wrap(LJList.get(I));
      FServices.Add(TAndroidBluetoothGattService.Create(JUuidToBluetoothUuid(LJService.getUuid),
        TBluetoothServiceType(LJService.getType), LJService));
    end;
  end;
  Result := FServices;
end;

function TAndroidBluetoothGattServer.DoIsAdvertising: Boolean;
begin
  if AdvertiseData <> nil then
    Result := TAndroidBluetoothLEAdvertiseData(AdvertiseData).FAdvertising
  else
    Result := False;
end;

procedure TAndroidBluetoothGattServer.DoSendResponse(const ADevice: TBluetoothLEDevice; ARequestId, AStatus,
  AnOffset: Integer; const AValue: TBytes);
var
  AResult: Boolean;
begin
  AResult := FJGattServer.sendResponse(TAndroidBluetoothLEDevice(ADevice).FJDevice, ARequestId, AStatus, AnOffset,
    TBytesToTJavaArray(AValue));
  if not AResult then
    raise EBluetoothDeviceException.CreateFmt('Cannot send response to device "%s" at "%s". %d', [ADevice.DeviceName,
      ADevice.Address, AStatus]);
end;

procedure TAndroidBluetoothGattServer.DoServiceAdded(AStatus: TBluetoothGattStatus; const AService: TBluetoothGattService);
begin
  inherited;
  DoOnServiceAdded(self, AService, TBluetoothGattStatus(AStatus));
end;

procedure TAndroidBluetoothGattServer.DoStartAdvertising;
begin
  inherited;
  if TOSVersion.Check(5) then
    TAndroidBluetoothLEAdvertiseData(AdvertiseData).DoStartAdvertising;
end;

procedure TAndroidBluetoothGattServer.DoStopAdvertising;
begin
  inherited;
  TAndroidBluetoothLEAdvertiseData(AdvertiseData).DoStopAdvertising;
end;

procedure TAndroidBluetoothGattServer.DoUpdateCharacteristicValue(const ACharacteristic: TBluetoothGattCharacteristic);
var
  I: Integer;
  DevicesList: JList;
begin
  DevicesList := TAndroidBluetoothLEManager(FManager).FJManager.getConnectedDevices(TJBluetoothProfile.JavaClass.GATT);
  for I := 0 to DevicesList.size -1 do
    FJGattServer.notifyCharacteristicChanged(JBluetoothDevice(DevicesList.get(I)),(ACharacteristic as TAndroidBluetoothGattCharacteristic).FJCharacteristic, false);
end;

function TAndroidBluetoothGattServer.FindDevice(const AJDevice: JBluetoothDevice): TBluetoothLEDevice;
begin
  Result := TBluetoothLEDevice(TAndroidBluetoothLEManager.AddDeviceToList(TAndroidBluetoothLEDevice.Create(AJDevice, True, True),
    TAndroidBluetoothLEManager(TBluetoothLEManager.Current).FDiscoveredLEDevices));
end;

function TAndroidBluetoothGattServer.FindService(const AJService: JBluetoothGattService): TBluetoothGattService;
var
  LService: TAndroidBluetoothGattService;
  I: Integer;
begin
  Result := nil;
  for I := 0 to FServices.Count - 1  do
  begin
    LService := TAndroidBluetoothGattService(FServices.Items[I]);
    if LService.FJService.equals(AJService) then
      Exit(LService);
  end;
end;

{ TAndroidBluetoothService }

constructor TAndroidBluetoothGattService.Create(const AnUUID: TBluetoothUUID; AType: TBluetoothServiceType; const AJService: JBluetoothGattService);
begin
  inherited Create(AnUUID, AType);
  if AJService = nil then
  begin
    FJService := TJBluetoothGattService.JavaClass.init(BluetoothUuidToJUuid(AnUUID), Integer(AType));
  end
  else
    FJService := AJService;
end;

destructor TAndroidBluetoothGattService.Destroy;
begin
  FJService := nil;
  inherited;
end;

function TAndroidBluetoothGattService.DoAddCharacteristic(const ACharacteristic: TBluetoothGattCharacteristic): Boolean;
begin
  Result := FJService.addCharacteristic(TAndroidBluetoothGattCharacteristic(ACharacteristic).FJCharacteristic);
end;

function TAndroidBluetoothGattService.DoAddIncludedService(const AService: TBluetoothGattService): Boolean;
begin
  Result := FJService.addService(TAndroidBluetoothGattService(AService).FJService);
end;

function TAndroidBluetoothGattService.DoCreateCharacteristic(const AUuid: TBluetoothUUID;
  APropertyFlags: TBluetoothPropertyFlags; const ADescription: string): TBluetoothGattCharacteristic;
var
  LDescriptor: TBluetoothGattDescriptor;
begin
  Result := TAndroidBluetoothGattCharacteristic.Create(Self, AUuid, APropertyFlags);
  if (TBluetoothProperty.Notify in APropertyFlags) or (TBluetoothProperty.Indicate in APropertyFlags) then
  begin
    LDescriptor := TAndroidBluetoothGattCharacteristic(Result).DoCreateDescriptor(CHAR_CLIENT_CONFIG);
    if (TBluetoothProperty.Notify in APropertyFlags) then
      LDescriptor.Notification := False;
    if (TBluetoothProperty.Indicate in APropertyFlags) then
      LDescriptor.Indication := False;
    TAndroidBluetoothGattCharacteristic(Result).AddDescriptor(LDescriptor);
  end;
  if ADescription <> '' then
  begin
    LDescriptor := TAndroidBluetoothGattCharacteristic(Result).DoCreateDescriptor(CHAR_DESCRIPTION);
    LDescriptor.UserDescription := ADescription;
    TAndroidBluetoothGattCharacteristic(Result).AddDescriptor(LDescriptor);
  end;

end;

function TAndroidBluetoothGattService.DoCreateIncludedService(const AnUUID: TBluetoothUUID;
  AType: TBluetoothServiceType): TBluetoothGattService;
var
  LJService: JBluetoothGattService;
begin
  Result := nil;
  LJService := TJBluetoothGattService.JavaClass.init(BluetoothUuidToJUuid(AnUUID), Integer(AType));
  Result := TAndroidBluetoothGattService.Create(AnUUID, AType, LJService);
end;

function TAndroidBluetoothGattService.DoGetCharacteristics: TBluetoothGattCharacteristicList;
var
  LJCharList: JList;
  LJChar: JBluetoothGattCharacteristic;
  LCharact: TBluetoothGattCharacteristic;
  I: Integer;
begin
  if FCharacteristics.Count = 0 then
  begin
    LJCharList := FJService.getCharacteristics;
    if LJCharList <> nil then
    begin
      for I := 0 to LJCharList.size - 1 do
      begin
        LJChar := TJBluetoothGattCharacteristic.Wrap(LJCharList.get(I));
        LCharact := TAndroidBluetoothGattCharacteristic.Create(Self, LJChar);
        FCharacteristics.Add(LCharact);
      end;
    end;
  end;
  Result := FCharacteristics;
end;

function TAndroidBluetoothGattService.DoGetIncludedServices: TBluetoothGattServiceList;
var
  LJList: JList;
  LJItem: JBluetoothGattService;
  LService: TBluetoothGattService;
  I: Integer;
begin
  if FIncludedServices.Count = 0 then
  begin
    LJList := FJService.getIncludedServices;
    if LJList <> nil then
      for I := 0 to LJList.size -1 do
      begin
        LJItem := TJBluetoothGattService.Wrap(LJList.get(I));
        LService := TAndroidBlueToothGattService.Create(JUuidToBluetoothUuid(LJItem.getUuid),
          TBluetoothServiceType(LJItem.getType), LJItem);
        FIncludedServices.Add(LService);
      end;
  end;
  Result := FIncludedServices;
end;

function TAndroidBluetoothGattService.FindCharacteristic(
  AJCharacteristic: JBluetoothGattCharacteristic): TAndroidBluetoothGattCharacteristic;
var
  I: Integer;
  LService: TAndroidBluetoothGattService;
  LCharact: TAndroidBluetoothGattCharacteristic;
begin
  Result := nil;
  for I := 0 to FCharacteristics.Count - 1 do
  begin
    LCharact := TAndroidBluetoothGattCharacteristic(FCharacteristics.Items[I]);
    if AJCharacteristic.equals(LCharact.FJCharacteristic) then
    begin
      Exit(LCharact);
    end;
  end;

  for I := 0 to FIncludedServices.Count - 1  do
  begin
    LService := TAndroidBluetoothGattService(FIncludedServices.Items[I]);
    Result := LService.FindCharacteristic(AJCharacteristic);
    if Result <> nil then
      Break;
  end;
end;

function TAndroidBluetoothGattService.FindDescriptor(
  AJDescriptor: JBluetoothGattDescriptor): TAndroidBluetoothGattDescriptor;
var
  I: Integer;
  LService: TAndroidBluetoothGattService;
  LCharact: TAndroidBluetoothGattCharacteristic;
begin
  Result := nil;
  for I := 0 to FCharacteristics.Count - 1 do
  begin
    LCharact := TAndroidBluetoothGattCharacteristic(FCharacteristics.Items[I]);
    Result := LCharact.FindDescriptor(AJDescriptor);
    if Result <> nil then
      Break;
  end;

  if Result = nil then
    for I := 0 to FIncludedServices.Count - 1  do
    begin
      LService := TAndroidBluetoothGattService(FIncludedServices.Items[I]);
      Result := LService.FindDescriptor(AJDescriptor);
      if Result <> nil then
        Break;
    end;
end;

function TAndroidBluetoothGattService.GetServiceType: TBluetoothServiceType;
begin
  Result := TBluetoothServiceType(FJService.getType);
end;

function TAndroidBluetoothGattService.GetServiceUUID: TBluetoothUUID;
begin
  Result := JUuidToBluetoothUuid(FJService.getUuid);
end;

{ TAndroidBluetoothGattCharacteristic }

constructor TAndroidBluetoothGattCharacteristic.Create(const AService: TBluetoothGattService; AJCharacteristic: JBluetoothGattCharacteristic);
begin
  inherited Create(AService);
  FJCharacteristic := AJCharacteristic;
end;

constructor TAndroidBluetoothGattCharacteristic.Create(const AService: TBluetoothGattService; const AUUID: TBluetoothUUID;
  AProperties: TBluetoothPropertyFlags);
begin
  inherited Create(AService);
  FJCharacteristic := TJBluetoothGattCharacteristic.JavaClass.init(BluetoothUuidToJUuid(AUUID),
    PropertiesToInteger(AProperties), TJBluetoothGattCharacteristic.JavaClass.PERMISSION_READ
    or TJBluetoothGattCharacteristic.JavaClass.PERMISSION_WRITE);
end;

destructor TAndroidBluetoothGattCharacteristic.Destroy;
begin
  FJCharacteristic := nil;
  inherited;
end;

function TAndroidBluetoothGattCharacteristic.DoAddDescriptor(const ADescriptor: TBluetoothGattDescriptor): Boolean;
begin
  Result := FJCharacteristic.addDescriptor(TAndroidBluetoothGattDescriptor(ADescriptor).FJDescriptor);
end;

function TAndroidBluetoothGattCharacteristic.DoCreateDescriptor(const AUUID: TBluetoothUUID): TBluetoothGattDescriptor;
var
  LJDesc: JBluetoothGattDescriptor;
  LPermissions: Integer;
begin
  Result := nil;
  LPermissions := TJBluetoothGattDescriptor.JavaClass.PERMISSION_READ;
  if (AUUID = CHAR_EXTENDEDPROPERTIES) or (AUUID = CHAR_DESCRIPTION) or (AUUID = CHAR_CLIENT_CONFIG) or
     (AUUID = CHAR_SERVERCONFIGURATIONFORMAT) then
    LPermissions := LPermissions or TJBluetoothGattDescriptor.JavaClass.PERMISSION_WRITE;

  LJDesc := TJBluetoothGattDescriptor.JavaClass.init(BluetoothUuidToJUuid(AUUID), LPermissions);
  if LJDesc <> nil then
    Result := TAndroidBluetoothGattDescriptor.Create(Self, LJDesc);
end;

function TAndroidBluetoothGattCharacteristic.DoGetDescriptors: TBluetoothGattDescriptorList;
var
  LJDescList: JList;
  LJDescriptor: JBluetoothGattDescriptor;
  LDescriptor: TAndroidBluetoothGattDescriptor;
  I: Integer;
begin
  if FDescriptors.Count = 0 then
  begin
    LJDescList := FJCharacteristic.getDescriptors;
    if LJDescList <> nil then
      for I := 0 to LJDescList.size - 1 do
      begin
        LJDescriptor := TJBluetoothGattDescriptor.Wrap(LJDescList.get(I));
        LDescriptor := TAndroidBluetoothGattDescriptor.Create(Self, LJDescriptor);
        FDescriptors.Add(LDescriptor);
      end;
  end;
  Result := FDescriptors;
end;

function TAndroidBluetoothGattCharacteristic.DoGetValue: TBytes;
begin
  Result := TJavaArrayToTBytes(FJCharacteristic.getValue);
end;

function TAndroidBluetoothGattCharacteristic.FindDescriptor(
  const AJDescriptor: JBluetoothGattDescriptor): TAndroidBluetoothGattDescriptor;
var
  I: Integer;
  LDescrip: TAndroidBluetoothGattDescriptor;
begin
  Result := nil;
  for I := 0 to FDescriptors.Count - 1 do
  begin
    LDescrip := TAndroidBluetoothGattDescriptor(FDescriptors.Items[I]);
    if AJDescriptor.equals(LDescrip.FJDescriptor) then
    begin
      Exit(LDescrip);
    end;
  end;
end;

procedure TAndroidBluetoothGattCharacteristic.DoSetValue(const AValue: TBytes);
begin
  FJCharacteristic.setValue(TBytesToTJavaArray(AValue));
end;

function TAndroidBluetoothGattCharacteristic.GetProperties: TBluetoothPropertyFlags;
var
  LProps: Integer;
begin
  Result := [];
  LProps := FJCharacteristic.getProperties;
  if (LProps and PROPERTY_BROADCAST) = PROPERTY_BROADCAST then
    Include(Result, TBluetoothProperty.Broadcast);
  if (LProps and PROPERTY_READ) = PROPERTY_READ then
    Include(Result, TBluetoothProperty.Read);
  if (LProps and PROPERTY_WRITE_NO_RESPONSE) = PROPERTY_WRITE_NO_RESPONSE then
    Include(Result, TBluetoothProperty.WriteNoResponse);
  if (LProps and PROPERTY_WRITE) = PROPERTY_WRITE then
    Include(Result, TBluetoothProperty.Write);
  if (LProps and PROPERTY_NOTIFY) = PROPERTY_NOTIFY then
    Include(Result, TBluetoothProperty.Notify);
  if (LProps and PROPERTY_INDICATE) = PROPERTY_INDICATE then
    Include(Result, TBluetoothProperty.Indicate);
  if (LProps and PROPERTY_SIGNED_WRITE) = PROPERTY_SIGNED_WRITE then
    Include(Result, TBluetoothProperty.SignedWrite);
  if (LProps and PROPERTY_EXTENDED_PROPS) = PROPERTY_EXTENDED_PROPS then
    Include(Result, TBluetoothProperty.ExtendedProps);
end;

function TAndroidBluetoothGattCharacteristic.GetUUID: TBluetoothUUID;
begin
  Result := JUuidToBluetoothUuid(FJCharacteristic.getUuid);
end;

{ TAndroidBluetoothGattServerListener }

constructor TAndroidBluetoothGattServerListener.Create(const AServer: TAndroidBluetoothGattServer);
begin
  inherited Create;
  FGattServer := AServer;
end;

destructor TAndroidBluetoothGattServerListener.Destroy;
begin
  inherited;
end;

procedure TAndroidBluetoothGattServerListener.onCharacteristicReadRequest(device: JBluetoothDevice; requestId,
  offset: Integer; characteristic: JBluetoothGattCharacteristic);
var
  LGattDevice: TBluetoothLEDevice;
begin
  LGattDevice := FGattServer.FindDevice(device);
  FGattServer.DoCharacteristicReadRequest(LGattDevice, requestId, offset, FGattServer.FindCharacteristic(characteristic));
end;

procedure TAndroidBluetoothGattServerListener.onCharacteristicWriteRequest(device: JBluetoothDevice; requestId: Integer;
  characteristic: JBluetoothGattCharacteristic; preparedWrite, responseNeeded: Boolean; offset: Integer;
  value: TJavaArray<Byte>);
var
  LGattDevice: TBluetoothLEDevice;
  LAndroidBluetoothGattCharacteristic: TAndroidBluetoothGattCharacteristic;
begin
  LGattDevice := FGattServer.FindDevice(device);
  LAndroidBluetoothGattCharacteristic := FGattServer.FindCharacteristic(characteristic);
  FGattServer.DoCharacteristicWriteRequest(LGattDevice, requestId, LAndroidBluetoothGattCharacteristic,
    preparedWrite, responseNeeded, offset, TJavaArrayToTBytes(value));
  FGattServer.DoUpdateCharacteristicValue(TBluetoothGattCharacteristic(LAndroidBluetoothGattCharacteristic));
end;

procedure TAndroidBluetoothGattServerListener.onConnectionStateChange(device: JBluetoothDevice; status,
  newState: Integer);
const
  STATE_CONNECTED = 2;
  STATE_DISCONNECTED = 0;
var
  ABluetoothLEDevice: TBluetoothLEDevice;
begin
  case newState of
    STATE_CONNECTED: begin
         ABluetoothLEDevice := FGattServer.FindDevice(device);
         FGattServer.DoOnConnectedDevice(FGattServer, ABluetoothLEDevice);
       end;
    STATE_DISCONNECTED: FGattServer.DoOnDisconnectDevice(FGattServer, FGattServer.FindDevice(device));
  else
    //
  end;
end;

procedure TAndroidBluetoothGattServerListener.onDescriptorReadRequest(device: JBluetoothDevice; requestId,
  offset: Integer; descriptor: JBluetoothGattDescriptor);
var
  LGattDevice: TBluetoothLEDevice;
  LBluetoothGattServiceList: TBluetoothGattServiceList;
  LBluetoothGattCharacteristicList: TBluetoothGattCharacteristicList;
  LBluetoothGattDescriptor: TBluetoothGattDescriptor;
  I, Z : Integer;
  LCharactID: TBluetoothUUID;
begin
  LGattDevice := FGattServer.FindDevice(device);
  LBluetoothGattServiceList := TBluetoothGattServer(FGattServer).GetServices;
  LCharactID := JUuidToBluetoothUuid(descriptor.getCharacteristic.getUuid);
  for I := 0 to LBluetoothGattServiceList.Count - 1 do
  begin
    LBluetoothGattCharacteristicList := LBluetoothGattServiceList[I].Characteristics;
    for Z := 0 to LBluetoothGattCharacteristicList.Count - 1 do
    begin
      if LBluetoothGattCharacteristicList[Z].UUID = LCharactID then
        LBluetoothGattDescriptor := LBluetoothGattCharacteristicList[Z].GetDescriptor(JUuidToBluetoothUuid(descriptor.getUuid));
      if LBluetoothGattDescriptor <> nil then
        Break;
    end;
    if LBluetoothGattDescriptor <> nil then
      Break;
  end;
  FGattServer.DoDescriptorReadRequest(LGattDevice, requestId, offset,LBluetoothGattDescriptor);
end;

procedure TAndroidBluetoothGattServerListener.onDescriptorWriteRequest(device: JBluetoothDevice; requestId: Integer;
  descriptor: JBluetoothGattDescriptor; preparedWrite, responseNeeded: Boolean; offset: Integer;
  value: TJavaArray<Byte>);
var
  LGattDevice: TBluetoothLEDevice;
  LBluetoothGattServiceList: TBluetoothGattServiceList;
  LBluetoothGattCharacteristicList: TBluetoothGattCharacteristicList;
  LBluetoothGattDescriptor: TBluetoothGattDescriptor;
  I, Z : Integer;
  LCharactID: TBluetoothUUID;
begin
  LGattDevice := FGattServer.FindDevice(device);
  LBluetoothGattServiceList := TBluetoothGattServer(FGattServer).GetServices;
  LCharactID := JUuidToBluetoothUuid(descriptor.getCharacteristic.getUuid);
  for I := 0 to LBluetoothGattServiceList.Count - 1 do
  begin
    LBluetoothGattCharacteristicList := LBluetoothGattServiceList[I].Characteristics;
    for Z := 0 to LBluetoothGattCharacteristicList.Count - 1 do
    begin
      if LBluetoothGattCharacteristicList[Z].UUID = LCharactID then
        LBluetoothGattDescriptor := LBluetoothGattCharacteristicList[Z].GetDescriptor(JUuidToBluetoothUuid(descriptor.getUuid));
      if LBluetoothGattDescriptor <> nil then
        Break;
    end;
    if LBluetoothGattDescriptor <> nil then
      Break;
  end;
  FGattServer.DoDescriptorWriteRequest(LGattdevice, requestId, LBluetoothGattDescriptor, preparedWrite, responseNeeded, offset,
    TJavaArrayToTBytes(value));
  FGattServer.DoUpdateCharacteristicValue(TBluetoothGattCharacteristic(FGattServer.FindCharacteristic(descriptor.getCharacteristic)));
end;

procedure TAndroidBluetoothGattServerListener.onExecuteWrite(device: JBluetoothDevice; requestId: Integer;
  execute: Boolean);
var
  LGattDevice: TBluetoothLEDevice;
begin
  LGattDevice := FGattServer.FindDevice(device);
  FGattServer.DoExecuteWrite(LGattDevice, requestId, execute);
end;

procedure TAndroidBluetoothGattServerListener.onServiceAdded(AStatus: Integer; service: JBluetoothGattService);
begin
  FGattServer.DoServiceAdded(TBluetoothGattStatus(AStatus), FGattServer.FindService(service));
end;

{ TAndroidBluetoothGattListener }

constructor TAndroidBluetoothGattListener.Create(const ALEDevice: TAndroidBluetoothLEDevice);
begin
  inherited Create;
  FGatt := ALEDevice;
end;

destructor TAndroidBluetoothGattListener.Destroy;
begin
  FGatt := nil;
  inherited;
end;

procedure TAndroidBluetoothGattListener.onCharacteristicChanged(gatt: JBluetoothGatt;
  characteristic: JBluetoothGattCharacteristic);
var
  LGattChar: TBluetoothGattCharacteristic;
begin
  LGattChar := FGatt.FindCharacteristic(characteristic);
  if LGattChar <> nil then
    FGatt.DoOnCharacteristicRead(LGattChar, TBluetoothGattStatus.Success)
  else
    raise EBluetoothLECharacteristicException.CreateFmt(SBluetoothLECanNotFindCharacteristic, [JUuidToBluetoothUuid(characteristic.getUuid).ToString]);
end;

procedure TAndroidBluetoothGattListener.onCharacteristicRead(gatt: JBluetoothGatt;
  characteristic: JBluetoothGattCharacteristic; status: Integer);
var
  LGattChar: TAndroidBluetoothGattCharacteristic;
begin
  LGattChar := FGatt.FindCharacteristic(characteristic);
  if LGattChar <> nil then
    FGatt.DoOnCharacteristicRead(LGattChar, TBluetoothGattStatus(status))
  else
    raise EBluetoothLECharacteristicException.CreateFmt(SBluetoothLECanNotFindCharacteristic, [JUuidToBluetoothUuid(characteristic.getUuid).ToString]);
end;

procedure TAndroidBluetoothGattListener.onCharacteristicWrite(gatt: JBluetoothGatt;
  characteristic: JBluetoothGattCharacteristic; status: Integer);
var
  LGattChar: TAndroidBluetoothGattCharacteristic;
begin
  LGattChar := FGatt.FindCharacteristic(characteristic);
  if LGattChar <> nil then
  begin
    if TBluetoothGattStatus(status) = TBluetoothGattStatus.Success then
      FGatt.FCallbackGattResult := True;
    FGatt.DoOnCharacteristicWrite(LGattChar, TBluetoothGattStatus(status));
    FGatt.FCallbackGattEvents.SetEvent;
  end
  else
    raise EBluetoothLECharacteristicException.CreateFmt(SBluetoothLECanNotFindCharacteristic, [JUuidToBluetoothUuid(characteristic.getUuid).ToString]);
end;

procedure TAndroidBluetoothGattListener.onConnectionStateChange(gatt: JBluetoothGatt; status, newState: Integer);
begin
  AndroidLogDebug('TAndroidBluetoothGattListener.onConnectionStateChange');

  FGatt.FConnectionStatus := TBluetoothDeviceState(newState);
  FGatt.FServicesEvent.SetEvent;
  case FGatt.FConnectionStatus of
    TBluetoothDeviceState.None:
      if Assigned(FGatt.OnDisconnect) then
        FGatt.OnDisconnect(FGatt);
    TBluetoothDeviceState.Connected:
      if (not FGatt.FConnecting) and Assigned(FGatt.OnConnect) then
        FGatt.OnConnect(FGatt);
//    TBluetoothDeviceState.Paired:;
  end;
  FGatt.FConnecting := False;
end;

procedure TAndroidBluetoothGattListener.onDescriptorRead(gatt: JBluetoothGatt; descriptor: JBluetoothGattDescriptor;
  status: Integer);
var
  LGattDesc: TAndroidBluetoothGattDescriptor;
begin
  LGattDesc := FGatt.FindDescriptor(descriptor);
  if LGattDesc <> nil then
    FGatt.DoOnDescriptorRead(LGattDesc, TBluetoothGattStatus(status))
  else
    raise EBluetoothLEDescriptorException.CreateFmt(SBluetoothLECanNotFindDescriptor, [JUuidToBluetoothUuid(descriptor.getUuid).ToString]);
end;

procedure TAndroidBluetoothGattListener.onDescriptorWrite(gatt: JBluetoothGatt; descriptor: JBluetoothGattDescriptor;
  status: Integer);
var
  LGattDesc: TAndroidBluetoothGattDescriptor;
begin
  LGattDesc := FGatt.FindDescriptor(descriptor);
  if LGattDesc <> nil then
  begin
    if TBluetoothGattStatus(status) = TBluetoothGattStatus.Success then
      FGatt.FCallbackGattResult := True;
    FGatt.DoOnDescriptorWrite(LGattDesc, TBluetoothGattStatus(status));
    FGatt.FCallbackGattEvents.SetEvent;
  end
  else
    raise EBluetoothLEDescriptorException.CreateFmt(SBluetoothLECanNotFindDescriptor, [JUuidToBluetoothUuid(descriptor.getUuid).ToString]);
end;

procedure TAndroidBluetoothGattListener.onReadRemoteRssi(gatt: JBluetoothGatt; rssi, status: Integer);
begin
  FGatt.FLastRSSI := rssi;
  FGatt.DoOnReadRssi(FGatt, rssi, TBluetoothGattStatus(status))
end;

procedure TAndroidBluetoothGattListener.onReliableWriteCompleted(gatt: JBluetoothGatt; status: Integer);
begin
  if TBluetoothGattStatus(status) = TBluetoothGattStatus.Success then
    FGatt.FCallbackGattResult := True;
  FGatt.DoOnReliableWriteCompleted(TBluetoothGattStatus(status));
  FGatt.FCallbackGattEvents.SetEvent;
end;

procedure TAndroidBluetoothGattListener.onServicesDiscovered(gatt: JBluetoothGatt; status: Integer);
begin
  FGatt.FLastStatus := TBluetoothGattStatus(status);
  FGatt.FServicesEvent.SetEvent;
end;

{ TAndroidBluetoothGattClient }

constructor TAndroidBluetoothLEDevice.Create(const AJDevice: JBluetoothDevice; AutoConnect: Boolean;
  AForceRefreshCachedServices: Boolean);
begin
  inherited Create(AutoConnect);

  uAndroidLog.AndroidLogDebug('TAndroidBluetoothLEDevice.Create');

  FJDevice := AJDevice;
  FServicesEvent := TEvent.Create;
  FCallbackGattEvents := TEvent.Create;
  FForceRefreshCachedServices := AForceRefreshCachedServices;
end;

class constructor TAndroidBluetoothLEDevice.Create;
const
  ClassName = 'android/bluetooth/BluetoothGatt';
  MethodName = 'refresh';
  Sig = '()Z';
begin
  FRefreshMethod := CheckApiMethod(ClassName, MethodName, Sig);
end;

destructor TAndroidBluetoothLEDevice.Destroy;
begin
  if FJGatt <> nil then
    FJGatt.close;
  FJGatt := nil;
  FJGattCallback := nil;
  FJGattListener := nil;
  FServicesEvent.SetEvent;
  FCallbackGattEvents.SetEvent;
  inherited;
  FServicesEvent.Free;
  FCallbackGattEvents.Free;
  FJDevice := nil;
end;

function TAndroidBluetoothLEDevice.InternalGetGattClient: JBluetoothGatt;
var
  LJContext: JContext;
  LWaitResult: TWaitResult;
begin
  if (not GetIsConnected) and (not FConnecting) then
  begin
    FServicesEvent.ResetEvent;
    LJContext := TAndroidBluetoothLEManager(TBluetoothLEManager.Current).FContext;
    if FJGatt = nil then
    begin
      if FJGattListener = nil then
        FJGattListener := TAndroidBluetoothGattListener.Create(Self);
      if FJGattCallback = nil then
        FJGattCallback := TJRTLBluetoothGattCallback.JavaClass.init(FJGattListener);
      FJGatt := FJDevice.connectGatt(LJContext, FAutoConnect, FJGattCallback);
      FReconnected := False;
      FConnecting := True;
    end
    else
    begin
      if UpdateOnReconnect then
      begin
        FJGatt.close;
        FJGatt := FJDevice.connectGatt(LJContext, FAutoConnect, FJGattCallback);
        FReconnected := True;
        FConnecting := True;
      end;
    end;

    if FConnecting then
    begin
      LWaitResult := FServicesEvent.WaitFor(CallbackGattTimeout);
      if (FConnectionStatus = TBluetoothDeviceState.Connected) and Assigned(OnConnect) then
        OnConnect(Self);
      if LWaitResult = TWaitResult.wrTimeout then
        FConnecting := False;
    end;
  end;
  Result := FJGatt;
end;

procedure TAndroidBluetoothLEDevice.DoAbortReliableWrite;
begin
  if GetIsConnected then
    FJGatt.abortReliableWrite;
end;

function TAndroidBluetoothLEDevice.DoBeginReliableWrite: Boolean;
begin
  InternalGetGattClient;
  if GetIsConnected then
    Result := FJGatt.beginReliableWrite
  else
    Result := False;
end;

function TAndroidBluetoothLEDevice.DoDiscoverServices: Boolean;
const
  BLEDiscoverServicesTimeout = 15000;
begin
  InternalGetGattClient;
  Result := False;
  if GetIsConnected then
  begin
    FServicesEvent.ResetEvent;
    FServices.Clear;
    FLastStatus := TBluetoothGattStatus.Failure;
    if FRefreshMethod and FForceRefreshCachedServices then
      FJGatt.refresh;
    Result := FJGatt.discoverServices;
    if Result then
    begin
      FServicesEvent.WaitFor(BLEDiscoverServicesTimeout);
      Result := FLastStatus = TBluetoothGattStatus.Success;
      if Result then
      begin
        InternalGetServices;
        FReconnected := False;
        DoOnServicesDiscovered(Self, FServices);
      end;
    end;
  end;
end;

function TAndroidBluetoothLEDevice.DoExecuteReliableWrite: Boolean;
begin
  // It should comes after DoBeginReliableWrite
  FCallbackGattResult := False;
  if GetIsConnected then
  begin
    FCallbackGattEvents.ResetEvent;
    if FJGatt.executeReliableWrite then
      FCallbackGattEvents.WaitFor(CallbackGattTimeout);
  end;
  Result := FCallbackGattResult;
end;

function TAndroidBluetoothLEDevice.UpdateServicesList: Boolean;
const
  BLEDiscoverServicesTimeout = 15000;

  procedure UpdateDescriptors(const AJChar: JBluetoothGattCharacteristic; const ADescriptors: TBluetoothGattDescriptorList);
  var
    LJDesList: JList;
    LJDes: JBluetoothGattDescriptor;
    LDescriptor: TAndroidBluetoothGattDescriptor;
    I, B: Integer;
  begin
    LJDesList := AJChar.getDescriptors;
    if LJDesList <> nil then
    begin
      for I := 0 to LJDesList.size - 1 do
      begin
        LJDes := TJBluetoothGattDescriptor.Wrap(LJDesList.get(I));
        for B := 0 to ADescriptors.Count - 1 do
        begin
          LDescriptor := TAndroidBluetoothGattDescriptor(ADescriptors[I]);
          if LJDes.getUuid.compareTo(LDescriptor.FJDescriptor.getUuid) = 0 then
          begin
            LDescriptor.FJDescriptor := LJDes;
            Break;
          end;
        end;
      end;
    end;
  end;

  procedure UpdateCharacteristics(const AJService: JBluetoothGattService; const ACharacteristics: TBluetoothGattCharacteristicList);
  var
    LJCharList: JList;
    LJChar: JBluetoothGattCharacteristic;
    LCharacteristic: TAndroidBluetoothGattCharacteristic;
    I, B: Integer;
  begin
    LJCharList := AJService.getCharacteristics;
    if LJCharList <> nil then
    begin
      for I := 0 to LJCharList.size - 1 do
      begin
        LJChar := TJBluetoothGattCharacteristic.Wrap(LJCharList.get(I));
        for B := 0 to ACharacteristics.Count - 1 do
        begin
          LCharacteristic := TAndroidBluetoothGattCharacteristic(ACharacteristics[I]);
          if LJChar.getUuid.compareTo(LCharacteristic.FJCharacteristic.getUuid) = 0 then
          begin
            LCharacteristic.FJCharacteristic := LJChar;
            if LCharacteristic.FDescriptors.Count > 0 then
              UpdateDescriptors(LJChar,  LCharacteristic.FDescriptors);
            Break;
          end;
        end;
      end;
    end;
  end;

  procedure UpdateServicesList(const AServ: TBluetoothGattServiceList; const LList: JList);
  var
    LJService: JBluetoothGattService;
    LABluetoothGattService: TAndroidBluetoothGattService;
    I, B: Integer;
  begin
    if (LList <> nil) and (AServ <> nil) then
    begin
      for I := 0 to LList.size -1 do
      begin
        LJService := TJBluetoothGattService.Wrap(LList.get(I));
        for B := 0 to AServ.Count -1 do
        begin
          LABluetoothGattService := TAndroidBluetoothGattService(AServ[B]);
          if LABluetoothGattService.FJService.getUuid.compareTo(LJService.getUuid) = 0 then
          begin
            if not LJService.getIncludedServices.isEmpty then
              UpdateServicesList(AServ[B].IncludedServices, LJService.getIncludedServices);

            LABluetoothGattService.FJService := LJService;
            if LABluetoothGattService.FCharacteristics.Count > 0 then
              UpdateCharacteristics(LJService, LABluetoothGattService.FCharacteristics);
            Break;
          end;
        end;
      end;
    end;
  end;

begin
  FServicesEvent.ResetEvent;
  FLastStatus := TBluetoothGattStatus.Failure;
  Result := FJGatt.discoverServices;
  if Result then
  begin
    FServicesEvent.WaitFor(BLEDiscoverServicesTimeout);
  	Result := FLastStatus = TBluetoothGattStatus.Success;
	  if Result then
  	begin
	    UpdateServicesList(FServices, FJGatt.getServices);
	    FReconnected := False;
  	end;
  end;
end;

function TAndroidBluetoothLEDevice.DoReadCharacteristic(const ACharacteristic: TBluetoothGattCharacteristic): Boolean;
begin
  InternalGetGattClient;
  Result := False;
  if GetIsConnected then
  begin
    if FReconnected then
      UpdateServicesList;
    Result := FJGatt.readCharacteristic(TAndroidBluetoothGattCharacteristic(ACharacteristic).FJCharacteristic);
  end;
end;

function TAndroidBluetoothLEDevice.DoReadDescriptor(const ADescriptor: TBluetoothGattDescriptor): Boolean;
begin
  InternalGetGattClient;
  Result := False;
  if GetIsConnected then
  begin
    if FReconnected then
      UpdateServicesList;
    Result := FJGatt.readDescriptor(TAndroidBluetoothGattDescriptor(ADescriptor).FJDescriptor)
  end;
end;

function TAndroidBluetoothLEDevice.DoReadRemoteRSSI: Boolean;
begin
  InternalGetGattClient;
  if GetIsConnected then
    Result := FJGatt.readRemoteRssi
  else
    Result := False;
end;

function TAndroidBluetoothLEDevice.DoSetCharacteristicNotification(
  const ACharacteristic: TBluetoothGattCharacteristic; Enable: Boolean): Boolean;
var
  LDesc: TBluetoothGattDescriptor;
begin
  InternalGetGattClient;
  Result := False;
  if GetIsConnected then
  begin
    if FReconnected then
      UpdateServicesList;
    if FJGatt.setCharacteristicNotification(TAndroidBluetoothGattCharacteristic(ACharacteristic).FJCharacteristic, Enable) then
    begin
      LDesc := ACharacteristic.GetDescriptor(CHAR_CLIENT_CONFIG);
      if LDesc <> nil then
      begin
        if TBluetoothProperty.Notify in ACharacteristic.Properties then
          LDesc.Notification := Enable
        else
          LDesc.Indication := Enable;

        Result := WriteDescriptor(LDesc);
      end;
    end;
  end;
end;

function TAndroidBluetoothLEDevice.DoWriteCharacteristic(const ACharacteristic: TBluetoothGattCharacteristic): Boolean;
begin
  internalGetGattClient;
  FCallbackGattResult := False;
  if GetIsConnected then
  begin
    if FReconnected then
      UpdateServicesList;
    FCallbackGattEvents.ResetEvent;
    if FJGatt.writeCharacteristic(TAndroidBluetoothGattCharacteristic(ACharacteristic).FJCharacteristic) then
      FCallbackGattEvents.WaitFor(CallbackGattTimeout);
  end;
  Result := FCallbackGattResult;
end;

function TAndroidBluetoothLEDevice.DoWriteDescriptor(const ADescriptor: TBluetoothGattDescriptor): Boolean;
begin
  InternalGetGattClient;
  FCallbackGattResult := False;
  if GetIsConnected then
  begin
    if FReconnected then
      UpdateServicesList;
    FCallbackGattEvents.ResetEvent;
    if FJGatt.writeDescriptor(TAndroidBluetoothGattDescriptor(ADescriptor).FJDescriptor) then
      FCallbackGattEvents.WaitFor(CallbackGattTimeout);
  end;
  Result := FCallbackGattResult;
end;

function TAndroidBluetoothLEDevice.FindCharacteristic(
  const AJCharacteristic: JBluetoothGattCharacteristic): TAndroidBluetoothGattCharacteristic;
var
  I: Integer;
  LService: TAndroidBluetoothGattService;
begin
  for I := 0 to FServices.Count - 1  do
  begin
    LService := TAndroidBluetoothGattService(FServices.Items[I]);
    Result := LService.FindCharacteristic(AJCharacteristic);
    if Result <> nil then
      Break;
  end;
end;

function TAndroidBluetoothLEDevice.FindDescriptor(
  const AJDescriptor: JBluetoothGattDescriptor): TAndroidBluetoothGattDescriptor;
var
  I: Integer;
  LService: TAndroidBluetoothGattService;
begin
  for I := 0 to FServices.Count - 1  do
  begin
    LService := TAndroidBluetoothGattService(FServices.Items[I]);
    Result := LService.FindDescriptor(AJDescriptor);
    if Result <> nil then
      Break;
  end;
end;

function TAndroidBluetoothLEDevice.DoConnect: Boolean;
var
  LUpdateOnReconnect: Boolean;
begin
  LUpdateOnReconnect := UpdateOnReconnect;
  UpdateOnReconnect := True;
  Result := InternalGetGattClient <> nil;
  UpdateOnReconnect := LUpdateOnReconnect;
end;

function TAndroidBluetoothLEDevice.DoCreateAdvertiseData: TBluetoothLEAdvertiseData;
begin
  Result := TAndroidBluetoothLEAdvertiseData.Create(nil, nil, TBluetoothLEDevice(Self));
end;

function TAndroidBluetoothLEDevice.GetAddress: TBluetoothMacAddress;
begin
  Result := JStringToString(FJDevice.getAddress);
end;

function TAndroidBluetoothLEDevice.GetBluetoothType: TBluetoothType;
begin
  { Check API Level 18 and ask for BT Type }
  if TOSVersion.Check(4, 3) then
    Result := TBluetoothType(FJDevice.getType)
  else
    Result := TBluetoothType.Classic;
end;

function TAndroidBluetoothLEDevice.GetDeviceName: string;
begin
  Result := JStringToString(FJDevice.getName);
end;

function TAndroidBluetoothLEDevice.GetIdentifier: string;
begin
  Result := GetAddress;
end;

function TAndroidBluetoothLEDevice.GetIsConnected: Boolean;
begin
  if FJDevice = nil then
    raise EBluetoothLEDeviceException.Create(SBluetoothLEGetDeviceError);
  if FJGatt <> nil then
    Result := FConnectionStatus = TBluetoothDeviceState.Connected
  else
    Result := False;
end;

procedure TAndroidBluetoothLEDevice.InternalGetServices;

  procedure GetServices(const AServ: TBluetoothGattService; LList: JList);
  var
    LServ: TBluetoothGattService;
    LJService: JBluetoothGattService;
    I: Integer;
  begin
    if LList <> nil then
      for I := 0 to LList.size -1 do
      begin
        LJService := TJBluetoothGattService.Wrap(LList.get(I));
        LServ := TAndroidBluetoothGattService.Create(JUuidToBluetoothUuid(LJService.getUuid), TBluetoothServiceType(LJService.getType),
          LJService);
        if not LJService.getIncludedServices.isEmpty then
          GetServices(LServ, LJService.getIncludedServices);
        if AServ <> nil then
          AServ.CreateIncludedService(LServ.UUID, LServ.ServiceType)
        else
         FServices.Add(LServ);
    end;
  end;

begin
  { Fill in the services list }
  GetServices(nil, FJGatt.getServices);
end;

function TAndroidBluetoothLEDevice.DoDisconnect: Boolean;
begin
  if FJGatt <> nil then
  begin
    FJGatt.disconnect;
    Result := True;
  end
  else
    Result := False;
end;

{ TAndroidBluetoothGattDescriptor }

constructor TAndroidBluetoothGattDescriptor.Create(const ACharacteristic: TBluetoothGattCharacteristic; AJDescriptor: JBluetoothGattDescriptor);
begin
  inherited Create(ACharacteristic);
  FJDescriptor := AJDescriptor;
end;

destructor TAndroidBluetoothGattDescriptor.Destroy;
begin
  FJDescriptor := nil;
  inherited;
end;

function TAndroidBluetoothGattDescriptor.DoGetBroadcasts: Boolean;
var
  B: TBytes;
begin

  if not (TBluetoothProperty.Broadcast in FCharacteristic.Properties) then
    raise EBluetoothLEDescriptorException.CreateFmt('Characteristic Error Message: %s, %d',
      [GetEnumName(TypeInfo(TBluetoothProperty), Ord(TBluetoothProperty.Broadcast))]);

  B := GetValue;
  Result := (Length(B) = 2) and (B[0] = $01) and (B[1] = $00);
end;

function TAndroidBluetoothGattDescriptor.DoGetExponent: ShortInt;
begin
  Result := ShortInt(Value[1]);
end;

function TAndroidBluetoothGattDescriptor.DoGetFormat: TBluetoothGattFormatType;
begin
  Result := TBluetoothGattFormatType(Value[0]);
end;

function TAndroidBluetoothGattDescriptor.DoGetFormatUnit: TBluetoothUUID;
var
  B: TBytes;
  LValue: Word;
begin
  B := GetValue;
  LValue := B[2] or (B[3] shl 8);
  Result := BLUETOOTH_BASE_UUID;
  Result.D1 := Cardinal(LValue);
end;

function TAndroidBluetoothGattDescriptor.DoGetIndication: Boolean;
var
  B: TBytes;
begin
  if not (TBluetoothProperty.Indicate in FCharacteristic.Properties) then
    raise EBluetoothLEDescriptorException.CreateFmt(SBluetoothCharacteristicError,
      [GetEnumName(TypeInfo(TBluetoothProperty), Ord(TBluetoothProperty.Indicate))]);

  B := GetValue;
  Result := (Length(B) = 2) and (B[0] = $02) and (B[1] = $00);
end;

function TAndroidBluetoothGattDescriptor.DoGetNotification: Boolean;
var
  B: TBytes;
begin
  if not (TBluetoothProperty.Notify in FCharacteristic.Properties) then
    raise EBluetoothLEDescriptorException.CreateFmt(SBluetoothCharacteristicError,
      [GetEnumName(TypeInfo(TBluetoothProperty), Ord(TBluetoothProperty.Notify))]);

  B := GetValue;
  Result := (Length(B) = 2) and (B[0] = $01) and (B[1] = $00);
end;

function TAndroidBluetoothGattDescriptor.DoGetReliableWrite: Boolean;
begin

  Result := False;
end;

function TAndroidBluetoothGattDescriptor.DoGetUserDescription: string;
begin
  Result := TEncoding.UTF8.GetString(Value);
end;

function TAndroidBluetoothGattDescriptor.DoGetValue: TBytes;
begin
  Result := TJavaArrayToTBytes(FJDescriptor.getValue);
end;

function TAndroidBluetoothGattDescriptor.DoGetWritableAuxiliaries: Boolean;
begin

  Result := False;
end;

procedure TAndroidBluetoothGattDescriptor.DoSetBroadcasts(const Value: Boolean);
var
  B: TBytes;
begin
  if not (TBluetoothProperty.Broadcast in FCharacteristic.Properties) then
    raise EBluetoothLEDescriptorException.CreateFmt(SBluetoothCharacteristicError,
      [GetEnumName(TypeInfo(TBluetoothProperty), Ord(TBluetoothProperty.Broadcast))]);

  SetLength(B, 2);
  if Value then
    B[0] := $01
  else
    B[0] := $00;
  B[1] := $00;
  SetValue(B);
end;

procedure TAndroidBluetoothGattDescriptor.DoSetIndication(const Value: Boolean);
var
  B: TBytes;
begin
  if not (TBluetoothProperty.Indicate in FCharacteristic.Properties) then
    raise EBluetoothLEDescriptorException.CreateFmt(SBluetoothCharacteristicError,
      [GetEnumName(TypeInfo(TBluetoothProperty), Ord(TBluetoothProperty.Broadcast))]);

  SetLength(B, 2);
  if Value then
    B[0] := $02
  else
    B[0] := $00;
  B[1] := $00;
  SetValue(B);
end;

procedure TAndroidBluetoothGattDescriptor.DoSetNotification(const Value: Boolean);
var
  B: TBytes;
begin
  if not (TBluetoothProperty.Notify in FCharacteristic.Properties) then
    raise EBluetoothLEDescriptorException.CreateFmt(SBluetoothCharacteristicError,
      [GetEnumName(TypeInfo(TBluetoothProperty), Ord(TBluetoothProperty.Notify))]);

  SetLength(B, 2);
  if Value then
    B[0] := $01
  else
    B[0] := $00;
  B[1] := $00;
  SetValue(B);
end;

procedure TAndroidBluetoothGattDescriptor.DoSetUserDescription(const Value: string);
begin
  SetValue(TEncoding.UTF8.GetBytes(Value));
end;

procedure TAndroidBluetoothGattDescriptor.DoSetValue(const AValue: TBytes);
begin
  FJDescriptor.setValue(TBytesToTJavaArray(AValue));
end;

function TAndroidBluetoothGattDescriptor.GetUUID: TBluetoothUUID;
begin
  Result := JUuidToBluetoothUuid(FJDescriptor.getUuid);
end;


{ TAndroidBluetoothLEManager }

constructor TAndroidBluetoothLEManager.Create;
var
  LocalManager: JObject;
begin
  inherited;
  { This code needs API_18 }
  if not TOsVersion.Check(4, 3) then
    raise EBluetoothManagerException.CreateFmt(SBluetoothAndroidVersionError, ['4.3', '18']);

  FContext := TAndroidHelper.Context;
  LocalManager := FContext.getSystemService(TJContext.JavaClass.BLUETOOTH_SERVICE);
  if LocalManager <> nil then
    FJManager := TJBluetoothManager.Wrap(LocalManager);
  FScanSettings := TScanSettingsOptions.SCAN_MODE_BALANCED;
end;

destructor TAndroidBluetoothLEManager.Destroy;
begin
  FJManager := nil;
  FContext := nil;
  inherited;
end;

function TAndroidBluetoothLEManager.DoGetGattServer: TBluetoothGattServer;
begin
  { Android KitKat 4.4.4 doesn't support Gatt servers, we need to wait until next release... }
  if TOSVersion.Check(5) then
  begin
    Result := TAndroidBluetoothGattServer.Create(Self, TAndroidBluetoothLEAdapter(TBluetoothLEManager(Self).CurrentAdapter));
  end
  else

    raise EBluetoothException.Create(SBluetoothNotImplemented);
end;

function TAndroidBluetoothLEManager.GetAdapterState: TBluetoothAdapterState;
begin
  if FAdapter = nil then
    FAdapter := TAndroidBluetoothLEAdapter.Create(Self, FJManager.getAdapter);
  Result := FAdapter.State;
end;

function TAndroidBluetoothLEManager.DoGetAdapter: TBluetoothLEAdapter;
var
  LAndroidBluetoothLEAdapter: TAndroidBluetoothLEAdapter;
begin
  if GetAdapterState = TBluetoothAdapterState.Off then
  begin
    LAndroidBluetoothLEAdapter := TAndroidBluetoothLEAdapter(FAdapter);
    if LAndroidBluetoothLEAdapter.FRequestEnableCallback then
    begin
      InternalProcessMessages;
      while LAndroidBluetoothLEAdapter.FRequestEnableCallback do
        InternalProcessMessages;

      if GetAdapterState = TBluetoothAdapterState.Off then
        FAdapter := nil;
    end
    else
      FAdapter := nil;
  end;
  Result := FAdapter;
end;

function TAndroidBluetoothLEManager.DoGetSupportsGattClient: Boolean;
begin
  Result := CheckOSVersionForGattClient;
end;

function TAndroidBluetoothLEManager.DoGetSupportsGattServer: Boolean;
begin
  Result := CheckOSVersionForGattServer;
end;

function TAndroidBluetoothLEManager.GetConnectionState: TBluetoothConnectionState;
begin
  if GetAdapterState = TBluetoothAdapterState.Off then
    Result := TBluetoothConnectionState.Disconnected
  else
    Result := TBluetoothConnectionState.Connected;
end;

function TAndroidBluetoothLEManager.DoEnableBluetooth: Boolean;
var
  LIntent: JIntent;
begin
  if GetConnectionState = TBluetoothConnectionState.Disconnected  then
  begin
    TAndroidBluetoothLEAdapter(FAdapter).FRequestEnableCallback := True;
    TThread.CreateAnonymousThread(procedure begin
      LIntent := TJIntent.JavaClass.init(TJBluetoothAdapter.JavaClass.ACTION_REQUEST_ENABLE);
      TAndroidHelper.Activity.startActivityForResult(LIntent, REQUEST_ENABLE_BT);
    end).Start;
  end;
  Result := True;
end;

function TAndroidBluetoothLEManager.GetScanSettingsOptions: IScanSettingsOptions;
begin
  if FIScanSettingsOptions = nil then
    FIScanSettingsOptions := TScanSettingsOptions.Create;
  Result := FIScanSettingsOptions;
end;

function TAndroidBluetoothLEManager.GetScanSettings: Integer;
begin
  Result := FScanSettings;
end;

procedure TAndroidBluetoothLEManager.SetScanSettings(Value: Integer);
begin
  FScanSettings := Value;
end;

{ TAndroidBluetoothSocket.TAndroidBluetoothSocketReader }

constructor TAndroidBluetoothSocket.TBluetoothSocketReader.Create(const ASocket: TAndroidBluetoothSocket; ABuffSize: Integer);
begin
  inherited Create(True);
  FSocket := ASocket;
  FJBytes := TJavaArray<System.Byte>.Create(ABuffSize);
end;

destructor TAndroidBluetoothSocket.TBluetoothSocketReader.Destroy;
begin
  FDestroying := True;
  FSocket.FReaderEvent.SetEvent;
  inherited;
  FSocket := nil;
  FJBytes.Free;
end;

procedure TAndroidBluetoothSocket.TBluetoothSocketReader.Execute;
begin
  inherited;
  FBufferSize := 0;
  FSocket.FSocketEvent.SetEvent;
  while not Terminated and not FDestroying do
  begin
    FSocket.FReaderEvent.WaitFor(INFINITE);
    FSocket.FReaderEvent.ResetEvent;
    // Do Read
    if not Terminated and not FDestroying and (FBufferSize = 0) then
    begin
      try
        if FSocket.FJIStream <> nil then
          FBufferSize := FSocket.FJIStream.read(FJBytes);
      except
        FBufferSize := -1;
      end;
    end;
    // Inform Socket that there is readed data
    if not FDestroying then
      FSocket.FSocketEvent.SetEvent;
  end;
end;

procedure TAndroidBluetoothSocket.TBluetoothSocketReader.GetBufferedData(const ABuffer: TBytes; AnOffset: Integer);
begin
  if FBufferSize > 0 then
  begin
    Move(PByte(FJBytes.Data)^, ABuffer[AnOffset], FBufferSize);
    FBufferSize := 0;
  end;
end;

function TAndroidBluetoothSocket.TBluetoothSocketReader.GetBufferedDataSize: Integer;
begin
  Result := FBufferSize;
end;

{ TAndroidBluetoothAdvertiseListener }

constructor TAndroidBluetoothAdvertiseListener.Create(const AEvent: TEvent; AErrorCode: Integer);
begin
  inherited Create;
  FEvent := AEvent;
  FErrorCode := AErrorCode;
end;

destructor TAndroidBluetoothAdvertiseListener.Destroy;
begin
  inherited;
end;

procedure TAndroidBluetoothAdvertiseListener.onStartFailure(errorCode: Integer);
begin
  FErrorCode := errorCode;
  FEvent.SetEvent;
end;

procedure TAndroidBluetoothAdvertiseListener.onStartSuccess(settingsInEffect: JAdvertiseSettings);
begin
  FEvent.SetEvent;
end;

{ TAndroidBluetoothLEAdvertiseData }

constructor TAndroidBluetoothLEAdvertiseData.Create(const ABluetoothGattServer: TBluetoothGattServer;
  const AnAdapter: TBluetoothLEAdapter; const ADevice: TBluetoothLEDevice);
begin
  inherited Create;

  FBluetoothGattServer := ABluetoothGattServer;
  FDevice := ADevice;
  FAdapter := AnAdapter;
  CreateAdvertiseDataJavaObjects;
end;

destructor TAndroidBluetoothLEAdvertiseData.Destroy;
begin
  DoStopAdvertising;
  FJAdvertiseData_Builder := nil;
  FJScanResponse_Builder := nil;
  FJScanResult := nil;
  FJAdvertiseSettings_Builder := nil;
  FJAdvertiseCallback := nil;
  FJAdvertiseListener := nil;
  inherited;
end;

procedure TAndroidBluetoothLEAdvertiseData.CreateAdvertiseDataJavaObjects;
begin
  if TOSVersion.Check(5) and (FBluetoothGattServer <> nil) then
  begin
    if FJBluetoothLeAdvertiser = nil then
      FJBluetoothLeAdvertiser :=  TAndroidBluetoothLEAdapter(FAdapter).FJAdapter.getBluetoothLeAdvertiser();

    if FJBluetoothLeAdvertiser = nil then
      raise EBluetoothLEAdvertiseDataException.Create(ADVERTISE_FAILED_DEVICE_NOT_SUPPORTED);

    FJAdvertiseData_Builder := TJAdvertiseData_Builder.JavaClass.init;
    FJAdvertiseData_Builder.setIncludeTxPowerLevel(False);
    FJAdvertiseData_Builder.setIncludeDeviceName(True);

    FJScanResponse_Builder := TJAdvertiseData_Builder.JavaClass.init;
    FJScanResponse_Builder.setIncludeTxPowerLevel(False);
    FJScanResponse_Builder.setIncludeDeviceName(False);

    FJAdvertiseSettings_Builder := TJAdvertiseSettings_Builder.JavaClass.init;
    FJAdvertiseSettings_Builder.setAdvertiseMode(TJAdvertiseSettings.JavaClass.ADVERTISE_MODE_BALANCED);
    FJAdvertiseSettings_Builder.setTxPowerLevel(TJAdvertiseSettings.JavaClass.ADVERTISE_TX_POWER_HIGH);
    FJAdvertiseSettings_Builder.setConnectable(True);

    FEvent := TEvent.Create;
    FJAdvertiseListener := TAndroidBluetoothAdvertiseListener.Create(FEvent, FErrorCode);
    FJAdvertiseCallback := TJRTLAdvertiseCallback.JavaClass.init(FJAdvertiseListener);
  end;
end;

procedure TAndroidBluetoothLEAdvertiseData.DoStartAdvertising;
const
  FLAGS_FIELD_BYTES = 3;
  UUID_BYTES_16_BIT = 2;
  UUID_BYTES_32_BIT = 4;
  UUID_BYTES_128_BIT = 16;
  OVERHEAD_BYTES_PER_FIELD = 2;
  SERVICE_DATA_UUID_LENGTH = 2;
  MANUFACTURER_SPECIFIC_DATA_LENGTH = 2;
  MAX_ADVDATA_LENGTH = 31;
  BEACON_ST_TYPE: Word = $0215;
var
  I: Integer;
  LAdvertiseService: Boolean;
  LNameInAdvData: Boolean;
  AdvertiseDataFull: Boolean;
  LAdvertiseDataLength: Integer;
  FScanResponseDataLength: Integer;
  ItemLength: Integer;
  OVERHEAD16Bit: Integer;
  OVERHEAD128Bit: Integer;
  LManufacturerId: Word;
  LManufacturerSpecificData: TBytes;
  Error: string;
begin
  FJBluetoothLeAdvertiser.stopAdvertising(FJAdvertiseCallback);

  FJAdvertiseData_Builder := nil;
  FJScanResponse_Builder := nil;
  FJAdvertiseSettings_Builder := nil;
  FJAdvertiseCallback := nil;
  FJAdvertiseListener := nil;
  LAdvertiseService := FBluetoothGattServer.AdvertiseService;
  CreateAdvertiseDataJavaObjects;

  FBluetoothGattServer.AdvertiseService := False;
  LAdvertiseDataLength := Length(FManufacturerSpecificData);
  FScanResponseDataLength := 0;
  OVERHEAD16Bit := 0;
  OVERHEAD128Bit := 0;
  LNameInAdvData := True;

  if LAdvertiseDataLength > 0 then
  begin
    LManufacturerId := PWord(@FManufacturerSpecificData[0])^;
    SetLength(LManufacturerSpecificData, Length(FManufacturerSpecificData) - LManufacturerId.Size);
    Move(FManufacturerSpecificData[LManufacturerId.Size], LManufacturerSpecificData[0], Length(LManufacturerSpecificData));
    FJAdvertiseData_Builder.addManufacturerData(LManufacturerId, TBytesToTJavaArray(LManufacturerSpecificData));
    LAdvertiseDataLength := OVERHEAD_BYTES_PER_FIELD + MANUFACTURER_SPECIFIC_DATA_LENGTH + LAdvertiseDataLength;
    if LAdvertiseDataLength + FLAGS_FIELD_BYTES + OVERHEAD_BYTES_PER_FIELD + FAdapter.AdapterName.Length > MAX_ADVDATA_LENGTH then
    begin
      FJAdvertiseData_Builder.setIncludeDeviceName(False);
      FJScanResponse_Builder.setIncludeDeviceName(True);
      FScanResponseDataLength := OVERHEAD_BYTES_PER_FIELD + FAdapter.AdapterName.Length;
      LNameInAdvData := False;
    end;
  end;
  LAdvertiseDataLength := LAdvertiseDataLength + FLAGS_FIELD_BYTES;

  for I := 0 to FServiceData.Count - 1 do
  begin
    ItemLength := Length(FServiceData.ToArray[I].Value);
    if LAdvertiseDataLength + ItemLength + OVERHEAD_BYTES_PER_FIELD + SERVICE_DATA_UUID_LENGTH <= MAX_ADVDATA_LENGTH then
    begin
      FJAdvertiseData_Builder.addServiceData(TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid(FServiceData.ToArray[I].Key)),
        TBytesToTJavaArray(FServiceData.ToArray[I].Value));
      LAdvertiseDataLength := LAdvertiseDataLength + ItemLength + OVERHEAD_BYTES_PER_FIELD + SERVICE_DATA_UUID_LENGTH;
      if LNameInAdvData and (LAdvertiseDataLength + OVERHEAD_BYTES_PER_FIELD + FAdapter.AdapterName.Length > MAX_ADVDATA_LENGTH) then
      begin
        FJAdvertiseData_Builder.setIncludeDeviceName(False);
        FJScanResponse_Builder.setIncludeDeviceName(True);
        FScanResponseDataLength := FScanResponseDataLength + OVERHEAD_BYTES_PER_FIELD + FAdapter.AdapterName.Length;
        LNameInAdvData := False;
      end;
    end
    else
    begin
     if FScanResponseDataLength + ItemLength + OVERHEAD_BYTES_PER_FIELD + SERVICE_DATA_UUID_LENGTH <= MAX_ADVDATA_LENGTH then
     begin
       FJScanResponse_Builder.addServiceData(TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid(FServiceData.ToArray[I].Key)),
         TBytesToTJavaArray(FServiceData.ToArray[I].Value));
       FScanResponseDataLength := FScanResponseDataLength + ItemLength + OVERHEAD_BYTES_PER_FIELD + SERVICE_DATA_UUID_LENGTH;
     end;
    end;
  end;

  AdvertiseDataFull := False;
  if LNameInAdvData then
    LAdvertiseDataLength := LAdvertiseDataLength  + OVERHEAD_BYTES_PER_FIELD + FAdapter.AdapterName.Length;

  for I := 0 to FServiceUUIDs.Count - 1 do
  begin
    if TBluetoothUUIDHelper.IsBluetoothBaseUUIDBased(FServiceUUIDs.Items[I]) then
    begin
      OVERHEAD16Bit := OVERHEAD_BYTES_PER_FIELD;
      ItemLength := UUID_BYTES_16_BIT;
    end
    else
    begin
      OVERHEAD128Bit := OVERHEAD_BYTES_PER_FIELD;
      ItemLength := UUID_BYTES_128_BIT;
    end;

    if not AdvertiseDataFull then
      if (not AdvertiseDataFull) and (LAdvertiseDataLength + ItemLength + OVERHEAD16Bit + OVERHEAD128Bit <= MAX_ADVDATA_LENGTH) then
      begin
        FJAdvertiseData_Builder.addServiceUuid(TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid(FServiceUUIDs.Items[I])));
        LAdvertiseDataLength := LAdvertiseDataLength + ItemLength;
      end
      else
      begin
        AdvertiseDataFull := True;
        if ItemLength = UUID_BYTES_16_BIT then
        begin
          OVERHEAD16Bit := OVERHEAD_BYTES_PER_FIELD;
          OVERHEAD128Bit := 0;
        end
        else
        begin
          OVERHEAD16Bit := 0;
          OVERHEAD128Bit := OVERHEAD_BYTES_PER_FIELD;
        end
      end;

    if AdvertiseDataFull then
      if (FScanResponseDataLength + ItemLength + OVERHEAD16Bit + OVERHEAD128Bit) <= MAX_ADVDATA_LENGTH then
      begin
        FJScanResponse_Builder.addServiceUuid(TJParcelUuid.JavaClass.init(BluetoothUuidToJUuid( FServiceUUIDs.Items[I])));
        FScanResponseDataLength := FScanResponseDataLength + ItemLength;
      end;
  end;

  FBluetoothGattServer.AdvertiseService := LAdvertiseService;

  if FJAdvertiseCallback <> nil then
  begin
    FJAdvertiseData := FJAdvertiseData_Builder.build;
    FJScanResponse := FJScanResponse_Builder.build;
    FErrorCode := 0;
    FEvent.ResetEvent;
    FJBluetoothLeAdvertiser.startAdvertising(FJAdvertiseSettings_Builder.build, FJAdvertiseData, FJScanResponse, FJAdvertiseCallback);
    FEvent.WaitFor(2000);

    if FErrorCode > 0 then
    begin
      FAdvertising := False;
      if FErrorCode = TJAdvertiseCallback.JavaClass.ADVERTISE_FAILED_DATA_TOO_LARGE then
        Error := ADVERTISE_FAILED_DATA_TOO_LARGE
      else
        if FErrorCode = TJAdvertiseCallback.JavaClass.ADVERTISE_FAILED_TOO_MANY_ADVERTISERS then
          Error := ADVERTISE_FAILED_TOO_MANY_ADVERTISERS
        else
          if FErrorCode = TJAdvertiseCallback.JavaClass.ADVERTISE_FAILED_ALREADY_STARTED then
            Error := ADVERTISE_FAILED_ALREADY_STARTED
          else
            if FErrorCode = TJAdvertiseCallback.JavaClass.ADVERTISE_FAILED_INTERNAL_ERROR then
              Error := ADVERTISE_FAILED_INTERNAL_ERROR
            else
              if FErrorCode = TJAdvertiseCallback.JavaClass.ADVERTISE_FAILED_FEATURE_UNSUPPORTED then
                Error := ADVERTISE_FAILED_FEATURE_UNSUPPORTED
              else
                Error := ADVERTISE_FAILED_UNKNOWN_ERROR;
      raise EBluetoothLEAdvertiseDataException.Create(Error);
    end
    else
      FAdvertising := True;
  end;
end;

procedure TAndroidBluetoothLEAdvertiseData.DoStopAdvertising;
begin
  if FAdvertising then
  begin
    FJBluetoothLeAdvertiser.stopAdvertising(FJAdvertiseCallback);
    FAdvertising := False;
  end;
end;

function TAndroidBluetoothLEAdvertiseData.GetDataForService(
  const AServiceUUID: TBluetoothUUID): TBytes;
begin
  if Length(GetServiceData) > 0 then
    FServiceData.TryGetValue(AServiceUUID, Result)
  else
    Result := nil;
end;

function TAndroidBluetoothLEAdvertiseData.GetLocalName: string;
begin
  if FDevice = nil then
  begin
    if FBluetoothGattServer <> nil then
      Flocalname := FBluetoothGattServer.GattServerName
  end
  else
    if (FDevice.AdvertisedData <> nil) and (FDevice.AdvertisedData.ContainsKey(TScanResponseKey.CompleteLocalName)) then
    begin
      Result := TEncoding.UTF8.GetString(FDevice.AdvertisedData.Items[TScanResponseKey.CompleteLocalName]);
      if Result <> '' then
        FLocalName := Result;
    end
    else
      Flocalname := FDevice.DeviceName;
  Result := Flocalname;
end;

function TAndroidBluetoothLEAdvertiseData.GetManufacturerSpecificData: TBytes;
begin
  if (FDevice <> nil) and (FDevice.AdvertisedData <> nil) then
    if FDevice.AdvertisedData.ContainsKey(TScanResponseKey.ManufacturerSpecificData) then
      FManufacturerSpecificData := FDevice.AdvertisedData.Items[TScanResponseKey.ManufacturerSpecificData];
  Result := FManufacturerSpecificData;
end;

function TAndroidBluetoothLEAdvertiseData.GetServiceData: TArray<TServiceDataRawData>;
var
  LData: TBytes;
  LServiceTBytes: TBytes;
  LServiceUUID: TGUID;
  LSize: Integer;
  LServiceData: TPair<TBluetoothUUID,TBytes>;
begin
  if (FDevice <> nil) and (FDevice.AdvertisedData <> nil) then
    if FDevice.AdvertisedData.ContainsKey(TScanResponseKey.ServiceData) then
    begin
      LData := FDevice.AdvertisedData.Items[TScanResponseKey.ServiceData];
      LServiceUUID := ServiceUUIDToGUID([LData[1], LData[0]]);
      LSize := Length(LData) - 2;
      SetLength(LServiceTBytes, LSize);
      Move(LData[2], LServiceTBytes[0], LSize);
      FServiceData.AddOrSetValue(LServiceUUID, LServiceTBytes);
    end;

  // Prepared to be an array, but it will just own one element for now.
  SetLength(Result, FServiceData.count);
  LSize := 0;
  for LServiceData in FServiceData do
  begin
    Result[LSize].create(LServiceData);
    Inc(LSize);
  end;
end;

function TAndroidBluetoothLEAdvertiseData.GetServiceUUIDs: TArray<TBluetoothUUID>;

  function ScanResponseToAdvertiseData(const ScanResponse: TScanResponse):TArray<TBluetoothUUID>;
  type
    TServicesLengthType = (S16B = 2, S32B = 4, S128B = 16);

    procedure ChekBLEServices(const AData: TBytes; AServicesLengthType: TServicesLengthType);
    var
      LDataLength: Integer;
      I: Integer;
      Position: Integer;
      LDeviation: Integer;
    begin
      LDeviation := 0;
      Position := Length(Result);
      if AServicesLengthType = TServicesLengthType.S128B then
      begin
        SetLength(Result, Position + 1);
        Result[0] := ServiceUUIDToGUID(AData); // we just can have one Service in 128 bits format
      end
      else
      begin
        LDataLength := Length(AData);
        I := 0;
        while I < LDataLength  do
        begin
          SetLength(Result, Position + 1);
          Result[Position] := ServiceUUIDToGUID([AData[I + LDeviation + 1], AData[I + LDeviation]]);
          Inc(I, Integer(AServicesLengthType));
          Inc(Position);
        end;
      end;
    end;

  begin
   if ScanResponse.ContainsKey(TScanResponseKey.IncompleteList128SCUUID) then
      ChekBLEServices(ScanResponse.Items[TScanResponseKey.IncompleteList128SCUUID], TServicesLengthType.S128B);

    if ScanResponse.ContainsKey(TScanResponseKey.CompleteList128SCUUID) then
      ChekBLEServices(ScanResponse.Items[TScanResponseKey.CompleteList128SCUUID], TServicesLengthType.S128B);

    if ScanResponse.ContainsKey(TScanResponseKey.IncompleteList16SCUUID) then
       ChekBLEServices(ScanResponse.Items[TScanResponseKey.IncompleteList16SCUUID], TServicesLengthType.S16B);

    if ScanResponse.ContainsKey(TScanResponseKey.CompleteList16SCUUID) then
      ChekBLEServices(ScanResponse.Items[TScanResponseKey.CompleteList16SCUUID], TServicesLengthType.S16B);

    if ScanResponse.ContainsKey(TScanResponseKey.IncompleteList32SCUUID) then
      ChekBLEServices(ScanResponse.Items[TScanResponseKey.IncompleteList32SCUUID], TServicesLengthType.S32B);

    if ScanResponse.ContainsKey(TScanResponseKey.CompleteList32SCUUID) then
      ChekBLEServices(ScanResponse.Items[TScanResponseKey.CompleteList32SCUUID], TServicesLengthType.S32B);
  end;

begin
  if FDevice = nil then
    Result := FServiceUUIDs.ToArray
  else
    Result := ScanResponseToAdvertiseData(FDevice.AdvertisedData);
end;

function TAndroidBluetoothLEAdvertiseData.GetTxPowerLevel: Integer;
begin
  if (FDevice <> nil) and (FDevice.AdvertisedData <> nil) then
    if FDevice.AdvertisedData.ContainsKey(TScanResponseKey.TxPowerLevel) then
      FTxPowerLevel := ShortInt(FDevice.AdvertisedData.Items[TScanResponseKey.TxPowerLevel]);
  Result := FTxPowerLevel;
end;

procedure TAndroidBluetoothLEAdvertiseData.SetLocalName(
  const ALocalName: string);
begin
 // In Android we cannot set a GattSerever name that is different from the one of the device.
 // raise EBluetoothADataException.CreateFmt(SBluetoothNotSupported, ['SetLocalName', 'Android']); // Do not translate.
end;

procedure TAndroidBluetoothLEAdvertiseData.SetManufacturerSpecificData(
  const AManufacturerSpecificData: TBytes);
begin
  if TOSVersion.Check(5) then
    FManufacturerSpecificData := AManufacturerSpecificData
  else
    raise EBluetoothLEAdvertiseDataException.CreateFmt(SBluetoothAndroidVersionError, ['5', '21']); // Do not translate.
end;

procedure TAndroidBluetoothLEAdvertiseData.SetTxPowerLevel(
  ATxPowerLevel: Integer);
begin
  if TOSVersion.Check(5) then
  begin
    FTxPowerLevel := ATxPowerLevel;
  end
  else
    raise EBluetoothLEAdvertiseDataException.CreateFmt(SBluetoothAndroidVersionError, ['5', '21']); // Do not translate.
end;

function TAndroidBluetoothLEAdvertiseData.DoAddServiceData(
  const AServiceUUID: TBluetoothUUID; const AData: TBytes): Boolean;
begin
  if TOSVersion.Check(5) then
  begin
    Result := True;
  end
  else
    raise EBluetoothLEAdvertiseDataException.CreateFmt(SBluetoothAndroidVersionError, ['5', '21']); // Do not translate.
end;

function TAndroidBluetoothLEAdvertiseData.DoAddServiceUUID(const AServiceUUID: TBluetoothUUID): Boolean;
begin
  if TOSVersion.Check(5) then
    Result := True
  else
    raise EBluetoothLEAdvertiseDataException.CreateFmt(SBluetoothAndroidVersionError, ['5', '21']); // Do not translate.
end;


procedure TAndroidBluetoothLEAdvertiseData.DoRemoveServiceUUID(
  const AServiceUUID: TBluetoothUUID);
begin
  if TOSVersion.Check(5) then
    FServiceUUIDChanged := True
  else
    raise EBluetoothLEAdvertiseDataException.CreateFmt(SBluetoothAndroidVersionError, ['5', '21']); // Do not translate.
end;

procedure TAndroidBluetoothLEAdvertiseData.DoRemoveServiceData(
  const AServiceUUID: TBluetoothUUID);
begin
  if TOSVersion.Check(5) then
    FServiceDataChanged := True
  else
    raise EBluetoothLEAdvertiseDataException.CreateFmt(SBluetoothAndroidVersionError, ['5', '21']); // Do not translate.
end;

procedure TAndroidBluetoothLEAdvertiseData.DoClearServiceData;
begin
  if TOSVersion.Check(5) then
    FServiceDataChanged := True
  else
    raise EBluetoothLEAdvertiseDataException.CreateFmt(SBluetoothAndroidVersionError, ['5', '21']); // Do not translate.
end;

procedure TAndroidBluetoothLEAdvertiseData.DoClearServiceUUIDs;
begin
  if TOSVersion.Check(5) then
    FServiceUUIDChanged := True
  else
    raise EBluetoothLEAdvertiseDataException.CreateFmt(SBluetoothAndroidVersionError, ['5', '21']); // Do not translate.
end;

function TAndroidBluetoothLEAdvertiseData.ContainsServiceUUID(
  const AServiceUUID: TBluetoothUUID): Boolean;
var
  LServiceArray: TArray<TBluetoothUUID>;
  I: Integer;
begin
  if TOSVersion.Check(5) then
  begin
    Result := False;
    if (FDevice <> nil) and (FDevice.AdvertisedData <> nil) then
    begin
      LServiceArray := GetServiceUUIDs;
      for I := 0 to Length(LServiceArray) - 1 do
        if LServiceArray[I] = AServiceUUID then
          Result := True
    end;
  end
  else
    raise EBluetoothLEAdvertiseDataException.CreateFmt(SBluetoothAndroidVersionError, ['5', '21']); // Do not translate.
end;

{ TScanCallback }

constructor TScanCallback.Create(
  const AnAdapter: TAndroidBluetoothLEAdapter);
begin
  inherited Create;
  FAdapter := AnAdapter;
end;

procedure TScanCallback.onBatchScanResults(results: JList);
begin
//
end;

procedure TScanCallback.onScanFailed(errorCode: Integer);
begin
 //SCAN_FAILED_ALREADY_STARTED $01
 //SCAN_FAILED_APPLICATION_REGISTRATION_FAILED $02
 //SCAN_FAILED_INTERNAL_ERROR $03
 //SCAN_FAILED_FEATURE_UNSUPPORTED $04
  FAdapter.FStartScanFailed := errorCode;
  FAdapter.FEventStartScan.SetEvent;
end;

function TBytesToHexString(const AValue: TBytes): string;
var
  I:Integer;
begin
  Result := '';
  for I:= 0 to Length(AValue) - 1 do
    Result := Result + AValue[I].ToHexString(2);
end;

procedure TScanCallback.onScanResult(callbackType: Integer;
  result: Jle_ScanResult);
var
  LDevice: TAndroidBluetoothLEDevice;
  LNew: Boolean;
  LDiscovered: Boolean;
begin
  FAdapter.FStartScanFailed := 0;
  FAdapter.FEventStartScan.SetEvent;
  LNew := False;

  LDevice := TAndroidBluetoothLEDevice(TAndroidBluetoothLEManager.GetDeviceInList(JStringToString(result.getDevice.getAddress) ,FAdapter.FManager.LastDiscoveredDevices));
  if LDevice = nil then
  begin
    //wn{wn}
    uAndroidLog.AndroidLogDebug('TScanCallback.onScanResult');
    LDevice := TAndroidBluetoothLEDevice.Create(result.getDevice,
      GetIsBLEDeviceAutoConnect((result.getDevice as ILocalObject).GetObjectID),
      FAdapter.FManager.ForceRefreshCachedDevices);
//    LDevice := TAndroidBluetoothLEDevice.Create(result.getDevice, False, FAdapter.FManager.ForceRefreshCachedDevices);
    LNew := True;
  end
  else
    LDevice.FJDevice := result.getDevice;

  LDevice.FAdvertisedData := ScanRecordToTScanResponse(result.getScanRecord.getBytes, LDevice.FAdvertisedData);
  LDevice.FLastRSSI := result.getRssi;
  LDiscovered := True;

  if LNew and (FAdapter.FBluetoothLEScanFilterList <> nil) then
    if not FAdapter.DoDeviceOvercomesFilters(LDevice, FAdapter.FBluetoothLEScanFilterList) then
    begin
      LDiscovered := False;
      LNew := False;
    end;

  if LNew then
    TAndroidBluetoothLEManager.AddDeviceToList(LDevice, FAdapter.FManager.LastDiscoveredDevices);
  if LDiscovered then
    FAdapter.DoDiscoverDevice(FAdapter, LDevice, LDevice.FLastRSSI, LDevice.FAdvertisedData);
end;

{ ScanSettingsOptions }

function TScanSettingsOptions.GetCALLBACK_TYPE_ALL_MATCHES: Integer;
begin
  Result := CALLBACK_TYPE_ALL_MATCHES;
end;

function TScanSettingsOptions.GetCALLBACK_TYPE_FIRST_MATCH: Integer;
begin
  Result := CALLBACK_TYPE_FIRST_MATCH;
end;

function TScanSettingsOptions.GetCALLBACK_TYPE_MATCH_LOST: Integer;
begin
  Result := CALLBACK_TYPE_MATCH_LOST;
end;

function TScanSettingsOptions.GetMATCH_MODE_AGGRESSIVE: Integer;
begin
  Result := MATCH_MODE_AGGRESSIVE;
end;

function TScanSettingsOptions.GetMATCH_MODE_STICKY: Integer;
begin
  Result := MATCH_MODE_STICKY;
end;

function TScanSettingsOptions.GetMATCH_NUM_FEW_ADVERTISEMENT: Integer;
begin
  Result := MATCH_NUM_FEW_ADVERTISEMENT;
end;

function TScanSettingsOptions.GetMATCH_NUM_MAX_ADVERTISEMENT: Integer;
begin
  Result := MATCH_NUM_MAX_ADVERTISEMENT;
end;

function TScanSettingsOptions.GetMATCH_NUM_ONE_ADVERTISEMENT: Integer;
begin
  Result := MATCH_NUM_ONE_ADVERTISEMENT;
end;

function TScanSettingsOptions.GetSCAN_MODE_BALANCED: Integer;
begin
  Result := SCAN_MODE_BALANCED;
end;

function TScanSettingsOptions.GetSCAN_MODE_LOW_LATENCY: Integer;
begin
  Result := SCAN_MODE_LOW_LATENCY;
end;

function TScanSettingsOptions.GetSCAN_MODE_LOW_POWER: Integer;
begin
  Result := SCAN_MODE_LOW_POWER;
end;

function TScanSettingsOptions.GetSCAN_MODE_OPPORTUNISTIC: Integer;
begin
  Result := SCAN_MODE_OPPORTUNISTIC;
end;

end.
