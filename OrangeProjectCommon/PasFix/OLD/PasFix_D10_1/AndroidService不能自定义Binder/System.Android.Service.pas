{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Android.Service;

interface

uses
{$IFDEF ANDROID}
  AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,
  Androidapi.JNI.App,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Embarcadero,
{$ENDIF ANDROID}
  System.SysUtils,
  System.Classes;

type //These types is need by the IDE to be able to register TAndroidService as a TDataModuleCustomModule
{$IFNDEF ANDROID}
  JIntent = interface end;
  JIBinder = interface end;
  JConfiguration = interface end;
  JService = interface end;
  JIntentService = interface end;
  JMessage = interface end;
  JMessenger = interface end;
  JServiceConnection = interface end;
  JComponentName = interface end;
{$ENDIF ANDROID}

  /// <summary>Signature of Create Event</summary>
  TOnCreateEvent = procedure(const Sender: TObject) of object;
  /// <summary>Signature of Destroy Event</summary>
  TOnDestroyEvent = procedure(const Sender: TObject) of object;
  /// <summary>Signature of StartCommand Event</summary>
  /// <remarks>Only available in Service</remarks>
  TOnStartCommandEvent = function(const Sender: TObject; const Intent: JIntent; Flags, StartId: Integer): Integer of object;
  /// <summary>Signature of Bind Event</summary>
  TOnBindEvent = function(const Sender: TObject; const AnIntent: JIntent):JIBinder of object;
  /// <summary>Signature of UnBind Event</summary>
  TOnUnBindEvent = function(const Sender: TObject;const AnIntent: JIntent): Boolean of object;
  /// <summary>Signature of Rebind Event</summary>
  TOnRebindEvent = procedure(const Sender: TObject; const AnIntent: JIntent) of object;
  /// <summary>Signature of TaskRemoved Event</summary>
  TOnTaskRemovedEvent = procedure(const Sender: TObject; const ARootIntent: JIntent) of object;
  /// <summary>Signature of ConfigurationChanged Event</summary>
  TOnConfigurationChangedEvent = procedure(const Sender: TObject; const NewConfig: JConfiguration) of object;
  /// <summary>Signature of LowMemory Event</summary>
  TOnLowMemoryEvent = procedure(const Sender: TObject) of object;
  /// <summary>Signature of TrimMemory Event</summary>
  TOnTrimMemoryEvent = procedure(const Sender: TObject; Level: Integer) of object;

  /// <summary>Signature of HandleIntent Event</summary>
  /// <remarks>Only available in IntentService</remarks>
  TOnHandleIntent = procedure(const Sender: TObject; const AnIntent: JIntent) of object;

  /// <summary>Signature of HandleMessage Event</summary>
  /// <remarks>Only available in remote services</remarks>
  TOnHandleMessage = function(const Sender: TObject; const AMessage: JMessage): Boolean of object;

  /// <summary>Base class for android Service and IntentService</summary>
  TAndroidBaseService = class(TDataModule)
  private
    FJavaService: JService;
    FJavaIntentService: JIntentService;
    FOnBind: TOnBindEvent;
    FOnUnBind: TOnUnBindEvent;
    FOnTrimMemory: TOnTrimMemoryEvent;
    FOnTaskRemoved: TOnTaskRemovedEvent;
    FOnConfigurationChanged: TOnConfigurationChangedEvent;
    FOnLowMemory: TOnLowMemoryEvent;
    FOnRebind: TOnRebindEvent;
    FOnHandleMessage: TOnHandleMessage;
  protected
    /// <summary>Called when the service is created</summary>
    procedure DoCreate; override;

    /// <summary>Return the communication channel to the service</summary>
    function DoBind(const AnIntent: JIntent): JIBinder; virtual;

    /// <summary>Called when all clients have disconnected from a particular interface published by the service</summary>
    function DoUnBind(const AnIntent: JIntent): Boolean; virtual;

    /// <summary>Called when new clients have connected to the service, after it had previously been notified that all had disconnected in its onUnbind(Intent)</summary>
    procedure DoRebind(const AnIntent: JIntent); virtual;

    /// <summary>This is called if the service is currently running and the user has removed a task that comes from the service's application</summary>
    procedure DoTaskRemoved(const ARootIntent: JIntent); virtual;

    /// <summary>Called by the system when the device configuration changes while your component is running</summary>
    procedure DoConfigurationChanged(const NewConfig: JConfiguration); virtual;

    /// <summary> This is called when the overall system is running low on memory, and actively running processes should trim their memory usage</summary>
    procedure DoLowMemory; virtual;

    /// <summary>Called when the operating system has determined that it is a good time for a process to trim unneeded memory from its process</summary>
    procedure DoTrimMemory(Level: Integer); virtual;

    /// <summary>Called when the service receive an incoming message</summary>
    /// <remarks>This event only happen in remote services</remarks>
    function DoHandleMessage(const AMessage: JMessage): Boolean; virtual;

  public
    /// <summary> Property to access to the instance of the java service </summary>
    /// <remarks>This var will be nil if it's an IntentService</remarks>
    property JavaService: JService read FJavaService;
    /// <summary> Property to access to the instance of the java service </summary>
    /// <remarks>This var will be nil if it's a Service</remarks>
    property JavaIntentService: JIntentService read FJavaIntentService;

{$IFDEF ANDROID}
    /// <summary>Function to get the default IBinder defined in the service </summary>
    function GetBinder: JIBinder;
{$ENDIF ANDROID}

  published
    /// <summary>Property to manage the Service Create Event</summary>
    property OnCreate;
    /// <summary>Property to manage the Service Destroy Event</summary>
    property OnDestroy;
    /// <summary>Property to manage the Service Bind Event</summary>
    property OnBind: TOnBindEvent read FOnBind write FOnBind;
    /// <summary>Property to manage the Service UnBind Event</summary>
    property OnUnBind: TOnUnBindEvent read FOnUnBind write FOnUnBind;
    /// <summary>Property to manage the Service Rebind Event</summary>
    property OnRebind: TOnRebindEvent read FOnRebind write FOnRebind;
    /// <summary>Property to manage the Service TaskRemoved Event</summary>
    property OnTaskRemoved: TOnTaskRemovedEvent read FOnTaskRemoved write FOnTaskRemoved;
    /// <summary>Property to manage the Service ConfigurationChanged Event</summary>
    property OnConfigurationChanged: TOnConfigurationChangedEvent read FOnConfigurationChanged write FOnConfigurationChanged;
    /// <summary>Property to manage the Service LowMemory Event</summary>
    property OnLowMemory: TOnLowMemoryEvent read FOnLowMemory write FOnLowMemory;
    /// <summary>Property to manage the Service TrimMemory Event</summary>
    property OnTrimMemory: TOnTrimMemoryEvent read FOnTrimMemory write FOnTrimMemory;
    /// <summary>Property to manage the Service TrimMemory Event</summary>
    /// <remarks>This event only happen in remote services</remarks>
    property OnHandleMessage: TOnHandleMessage read FOnHandleMessage write FOnHandleMessage;
  end;


  /// <summary>Base class to use android Service</summary>
  /// <remarks>More info in http://developer.android.com/reference/android/app/Service.html</remarks>
  TAndroidService = class(TAndroidBaseService)
  private
    FOnStartCommand: TOnStartCommandEvent;
  protected
    /// <summary>Called by the system every time a client explicitly starts the service by calling startService(Intent),
    /// providing the arguments it supplied and a unique integer token representing the start request</summary>
    function DoStartCommand(const AStartIntent: JIntent; AFlags, AStartID: Integer): Integer; virtual;

  published
    /// <summary>Property to manage the Service Create Event</summary>
    property OnCreate;
    /// <summary>Property to manage the Service Destroy Event</summary>
    property OnDestroy;
    /// <summary>Property to manage the Service StartCommand Event</summary>
    property OnStartCommand: TOnStartCommandEvent read FOnStartCommand write FOnStartCommand;
    /// <summary>Property to manage the Service Bind Event</summary>
    property OnBind;
    /// <summary>Property to manage the Service UnBind Event</summary>
    property OnUnBind;
    /// <summary>Property to manage the Service Rebind Event</summary>
    property OnRebind;
    /// <summary>Property to manage the Service TaskRemoved Event</summary>
    property OnTaskRemoved;
    /// <summary>Property to manage the Service ConfigurationChanged Event</summary>
    property OnConfigurationChanged;
    /// <summary>Property to manage the Service LowMemory Event</summary>
    property OnLowMemory;
    /// <summary>Property to manage the Service TrimMemory Event</summary>
    property OnTrimMemory;
    /// <summary>Property to manage the Service TrimMemory Event</summary>
    /// <remarks>This event only happen in remote services</remarks>
    property OnHandleMessage;
  end;


  /// <summary>Base class to use android IntentService</summary>
  /// <remarks>More info in http://developer.android.com/reference/android/app/IntentService.html</remarks>
  TAndroidIntentService = class(TAndroidBaseService)
  private
    FOnHandleIntent: TOnHandleIntent;
  protected
    /// <summary>This method is invoked on the worker thread with a request to process</summary>
    /// <remarks>Only available in IntentService</remarks>
    procedure DoHandleIntent(const AnIntent: JIntent); virtual;

  published
    /// <summary>Property to manage the Service Create Event</summary>
    property OnCreate;
    /// <summary>Property to manage the Service Destroy Event</summary>
    property OnDestroy;
    /// <summary>Property to manage the Service Bind Event</summary>
    property OnBind;
    /// <summary>Property to manage the Service UnBind Event</summary>
    property OnUnBind;
    /// <summary>Property to manage the Service Rebind Event</summary>
    property OnRebind;
    /// <summary>Property to manage the Service TaskRemoved Event</summary>
    property OnTaskRemoved;
    /// <summary>Property to manage the Service ConfigurationChanged Event</summary>
    property OnConfigurationChanged;
    /// <summary>Property to manage the Service LowMemory Event</summary>
    property OnLowMemory;
    /// <summary>Property to manage the Service TrimMemory Event</summary>
    property OnTrimMemory;
    /// <summary>Property to manage the Service Rebind Event</summary>
    property OnHandleIntent: TOnHandleIntent read FOnHandleIntent write FOnHandleIntent;
    /// <summary>Property to manage the Service TrimMemory Event</summary>
    /// <remarks>This event only happen in remote services</remarks>
    property OnHandleMessage;
  end;


  /// <summary>Class functions to connect native callbacks with the delphi service</summary>
  TServiceCallbacks = class
  private
    class var FBinder: JIBinder;
  protected
    /// <summary>Singleton of the delphi Service instance</summary>
    class var FService: TAndroidService;
    /// <summary>Singleton of the delphi IntentService instance</summary>
    class var FIntentService: TAndroidIntentService;

    /// <summary>Class function to connect native onCreate callback with the delphi service</summary>
    class procedure OnCreateCallback(const AJavaService: JService); static;
    /// <summary>Class function to connect native onDestroy callback with the delphi service</summary>
    class procedure OnDestroyCallback; static;
    /// <summary>Class function to connect native onStartCommand callback with the delphi service</summary>
    /// <remarks>Only available in Service</remarks>
    class function OnStartCommandCallback(const AStartIntent: JIntent; AFlags, AStartID: Integer): Integer; static;
    /// <summary>Class function to connect native onBind callback with the delphi service</summary>
    class function OnBindCallback(const AnIntent: JIntent): JIBinder; static;
    /// <summary>Class function to connect native onUnbind callback with the delphi service</summary>
    class function onUnbindCallback(const AnIntent: JIntent): Boolean; static;
    /// <summary>Class function to connect native onRebind callback with the delphi service</summary>
    class procedure onRebindCallback(const AnIntent: JIntent); static;
    /// <summary>Class function to connect native onTaskRemoved callback with the delphi service</summary>
    class procedure onTaskRemovedCallback(const ARootIntent: JIntent); static;
    /// <summary>Class function to connect native onConfigurationChanged callback with the delphi service</summary>
    class procedure onConfigurationChangedCallback(const NewConfig: JConfiguration); static;
    /// <summary>Class function to connect native onLowMemory callback with the delphi service</summary>
    class procedure onLowMemoryCallback; static;
    /// <summary>Class function to connect native onTrimMemory callback with the delphi service</summary>
    class procedure onTrimMemoryCallback(Level: Integer); static;
    /// <summary>Class function to connect native onHandleIntent callback with the delphi service</summary>
    /// <remarks>Only available in IntentService</remarks>
    class procedure onHandleIntentCallback(const AnIntent: JIntent); static;
    /// <summary>Class function to return the delphi service</summary>
    class function GetDelphiService: Int64; static;
    /// <summary>Class function to connect native onHandleMessage callback with the delphi service</summary>
    class function onHandleMessageCallback(const AMessage: JMessage): Boolean;
  end;

{$IFDEF ANDROID}
  /// <summary>Signature of Connected Event</summary>
  TOnLocalServiceConnected = procedure(const ALocalService: TAndroidBaseService) of object;
  /// <summary>Signature of Disconnected Event</summary>
  TOnLocalServiceDisconnected = procedure of object;

  /// <summary>Helper class to manage a connection to an android Local Service</summary>
  TLocalServiceConnection = class
  private type
    TJavaServiceConnection = class(TJavaLocal, JServiceConnection)
    private
      [Weak] FLocalConnection: TLocalServiceConnection;
    public
      constructor Create(const ALocalConnection: TLocalServiceConnection);
      procedure onServiceConnected(name: JComponentName; service: JIBinder); cdecl;
      procedure onServiceDisconnected(name: JComponentName); cdecl;
    end;

  private
    FConnection: TJavaServiceConnection;
    [Unsafe] FLocalService: TAndroidBaseService;
    FOnConnected: TOnLocalServiceConnected;
    FOnDisconnected: TOnLocalServiceDisconnected;

    procedure DoOnConnected(const ALocalService: TAndroidBaseService);
    procedure DoOnDisconnected;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>Start the service</summary>
    class procedure StartService(const AServiceName: string); static;
    /// <summary>Bind to service</summary>
    procedure BindService(const AServiceName: string; flags: Integer = 1{TJContext.JavaClass.BIND_AUTO_CREATE});
    /// <summary>Unbind to service</summary>
    procedure UnbindService;
    /// <summary>Event fired when you are connected</summary>
    property OnConnected: TOnLocalServiceConnected read FOnConnected write FOnConnected;
    /// <summary>Event fired when you are disconnected</summary>
    property OnDisconnected: TOnLocalServiceDisconnected read FOnDisconnected write FOnDisconnected;
    /// <summary>Property to acces to the Delphi Service object</summary>
    property LocalService: TAndroidBaseService read FLocalService;
  end;



  /// <summary>Signature of Connected Event</summary>
  TOnRemoteServiceConnected = procedure(const ServiceMessenger: JMessenger) of object;
  /// <summary>Signature of Disconnected Event</summary>
  TOnRemoteServiceDisconnected = procedure of object;
  /// <summary>Signature of HandleMessage Event</summary>
  TOnRemoteServiceHandleMessage = procedure(const AMessage: JMessage) of object;

  /// <summary>Helper class to manage a connection to an android Remote Service</summary>
  TRemoteServiceConnection = class
  private type
    TJavaServiceConnection = class(TJavaLocal, JServiceConnection)
    private
      [Weak] FLocalConnection: TRemoteServiceConnection;
    public
      constructor Create(const ALocalConnection: TRemoteServiceConnection);
      procedure onServiceConnected(name: JComponentName; service: JIBinder); cdecl;
      procedure onServiceDisconnected(name: JComponentName); cdecl;
    end;

    TRTLHandlerListener = class(TJavaLocal, JRTLHandler_Listener)
    private
      FHandler: JRTLHandler;
      [Weak] FConnection: TRemoteServiceConnection;
    public
      constructor Create(const AConnection: TRemoteServiceConnection);
      procedure handleMessage(msg: JMessage); cdecl;
      property Handler: JRTLHandler read FHandler;
    end;

  private
    FConnection: TJavaServiceConnection;
    FOnConnected: TOnRemoteServiceConnected;
    FOnDisconnected: TOnRemoteServiceDisconnected;
    FOnHandleMessage: TOnRemoteServiceHandleMessage;
    FJServiceMessenger: JMessenger;
    FHandlerListener: TRTLHandlerListener;
    FJLocalMessenger: JMessenger;

    function GetHandler: JRTLHandler;

    procedure DoOnConnected(const service: JIBinder);
    procedure DoOnDisconnected;
    procedure DoOnHandleMessage(const AMessage: JMessage);
  public
    //wn
    FJBinder:JIBinder;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>Bind to service</summary>
    procedure BindService(const APackageName, AServiceName: string; flags: Integer = 1{TJContext.JavaClass.BIND_AUTO_CREATE});
    /// <summary>Unbind to service</summary>
    procedure UnbindService;
    /// <summary>Event fired when you are connected</summary>
    property OnConnected: TOnRemoteServiceConnected read FOnConnected write FOnConnected;
    /// <summary>Event fired when you are disconnected</summary>
    property OnDisconnected: TOnRemoteServiceDisconnected read FOnDisconnected write FOnDisconnected;
    /// <summary>Event fired when a message arrive to the local messenger</summary>
    property OnHandleMessage: TOnRemoteServiceHandleMessage read FOnHandleMessage write FOnHandleMessage;
    /// <summary>Property to acces to the service messenger</summary>
    property ServiceMessenger: JMessenger read FJServiceMessenger;
    /// <summary>Property to acces to the local messenger</summary>
    property LocalMessenger: JMessenger read FJLocalMessenger;
    /// <summary>Property to acces to the Handler of the listener</summary>
    property Handler: JRTLHandler read GetHandler;

  end;
{$ENDIF ANDROID}

implementation

{$IFDEF ANDROID}
uses
  System.Rtti,
  System.TypInfo,
  Androidapi.Log,
  Androidapi.Helpers,
  Androidapi.Jni;
{$ENDIF ANDROID}


{ TAndroidBaseService }

function TAndroidBaseService.DoBind(const AnIntent: JIntent): JIBinder;
{$IFDEF ANDROID}
begin
  if Assigned(FOnBind) then
    Result := FOnBind(Self, AnIntent);

  if Result = nil then
    Result := GetBinder;
end;
{$ELSE}
begin
  Result := nil;
end;
{$ENDIF ANDROID}

procedure TAndroidBaseService.DoConfigurationChanged(const NewConfig: JConfiguration);
begin
  if Assigned(FOnConfigurationChanged) then
    FOnConfigurationChanged(Self, NewConfig);
end;

procedure TAndroidBaseService.DoCreate;
begin
  if (FJavaService <> nil) or (FJavaIntentService <> nil) then
    inherited;
end;

function TAndroidBaseService.DoHandleMessage(const AMessage: JMessage): Boolean;
begin
  if Assigned(FOnHandleMessage) then
    Result := FOnHandleMessage(Self, AMessage)
  else
    Result := False;
end;

procedure TAndroidBaseService.DoLowMemory;
begin
  if Assigned(FOnLowMemory) then
    FOnLowMemory(Self);
end;

procedure TAndroidBaseService.DoRebind(const AnIntent: JIntent);
begin
  if Assigned(FOnRebind) then
    FOnRebind(Self, AnIntent);
end;

procedure TAndroidBaseService.DoTrimMemory(Level: Integer);
begin
  if Assigned(FOnTrimMemory) then
    FOnTrimMemory(Self, Level);
end;

function TAndroidBaseService.DoUnBind(const AnIntent: JIntent): Boolean;
begin
  if Assigned(FOnUnBind) then
    Result := FOnUnBind(Self, AnIntent)
  else
    Result := False;
end;

procedure TAndroidBaseService.DoTaskRemoved(const ARootIntent: JIntent);
begin
  if Assigned(FOnTaskRemoved) then
    FOnTaskRemoved(Self, ARootIntent);
end;

{$IFDEF ANDROID}
function TAndroidBaseService.GetBinder: JIBinder;

  function GetmBinder(AJNIService: JNIObject): JIBinder;
  var
    Env: PJNIEnv;
    Clazz: JNIClass;
    FieldID: JNIFieldID;
    LJNIBinder: JNIObject;
  begin
    Result := nil;
    PJavaVM(System.JavaMachine)^.AttachCurrentThread(System.JavaMachine, @Env, nil);
    Clazz := Env^.GetObjectClass(Env, AJNIService);
    FieldID := Env^.GetFieldID(Env, Clazz, 'mBinder', 'Landroid/os/IBinder;');
    if FieldID <> nil then
    begin
      LJNIBinder := Env^.GetObjectField(Env, AJNIService, FieldID);
      if LJNIBinder <> nil then
      begin
        Result := TJIBinder.Wrap(LJNIBinder);
        Env^.DeleteLocalRef(Env, LJNIBinder);
      end;
    end;
    Env^.DeleteLocalRef(Env, Clazz);
  end;

begin
  if JavaService <> nil then
    Result := GetmBinder((JavaService as ILocalObject).GetObjectID)
  else if JavaIntentService <> nil then
    Result := GetmBinder((JavaIntentService as ILocalObject).GetObjectID)
  else
    Result := nil;
end;
{$ENDIF ANDROID}


{ TAndroidService }

function TAndroidService.DoStartCommand(const AStartIntent: JIntent; AFlags, AStartID: Integer): Integer;
begin
{$IFDEF ANDROID}
  Result := TJService.JavaClass.START_NOT_STICKY;
  if Assigned(FOnStartCommand) then
    Result := FOnStartCommand(Self, AStartIntent, AFlags, AStartID);
{$ELSE}
    Result := 0;
{$ENDIF ANDROID}
end;

{ TAndroidIntentService }

procedure TAndroidIntentService.DoHandleIntent(const AnIntent: JIntent);
begin
  if Assigned(FOnHandleIntent) then
    FOnHandleIntent(Self, AnIntent);
end;

{ TServiceCallbacks }

class function TServiceCallbacks.GetDelphiService: Int64;
begin
  Result := 0;
  if FService <> nil then
    Result := Int64(FService);
  if FIntentService <> nil then
    Result := Int64(FIntentService);
end;

class function TServiceCallbacks.OnBindCallback(const AnIntent: JIntent): JIBinder;
begin
  Result := nil;
  if FService <> nil then
    Result := FService.DoBind(AnIntent);
  if FIntentService <> nil then
    Result := FIntentService.DoBind(AnIntent);
  FBinder := Result;
end;

class procedure TServiceCallbacks.onConfigurationChangedCallback(const NewConfig: JConfiguration);
begin
  if FService <> nil then
    FService.DoConfigurationChanged(NewConfig);
  if FIntentService <> nil then
    FIntentService.DoConfigurationChanged(NewConfig);
end;

class procedure TServiceCallbacks.OnCreateCallback(const AJavaService: JService);
begin
  if FService <> nil then
  begin
    FService.FJavaService := AJavaService;
    FService.DoCreate;
  end;
  if FIntentService <> nil then
  begin
    FIntentService.FJavaIntentService := {$IFDEF ANDROID}TJIntentService.Wrap(AJavaService){$ELSE}nil{$ENDIF ANDROID};
    FIntentService.DoCreate;
  end;
end;

class procedure TServiceCallbacks.OnDestroyCallback;
begin
  if FService <> nil then
    FService.DoDestroy;
  if FIntentService <> nil then
    FIntentService.DoDestroy;
end;

class procedure TServiceCallbacks.onHandleIntentCallback(const AnIntent: JIntent);
begin
  if FIntentService <> nil then
    FIntentService.DoHandleIntent(AnIntent);
end;

class function TServiceCallbacks.onHandleMessageCallback(const AMessage: JMessage): Boolean;
begin
  Result := False;
  if FService <> nil then
    Result := FService.DoHandleMessage(AMessage);
  if FIntentService <> nil then
    Result := FIntentService.DoHandleMessage(AMessage);
end;

class procedure TServiceCallbacks.onLowMemoryCallback;
begin
  if FService <> nil then
    FService.DoLowMemory;
  if FIntentService <> nil then
    FIntentService.DoLowMemory;
end;

class procedure TServiceCallbacks.onRebindCallback(const AnIntent: JIntent);
begin
  if FService <> nil then
    FService.DoRebind(AnIntent);
  if FIntentService <> nil then
    FIntentService.DoRebind(AnIntent);
end;

class function TServiceCallbacks.OnStartCommandCallback(const AStartIntent: JIntent; AFlags,
  AStartID: Integer): Integer;
begin
{$IFDEF ANDROID}
    Result := TJService.JavaClass.START_NOT_STICKY;
{$ELSE}
    Result := 0;
{$ENDIF ANDROID}
  if FService <> nil then
    Result := FService.DoStartCommand(AStartIntent, AFlags, AStartID);
end;

class procedure TServiceCallbacks.onTaskRemovedCallback(const ARootIntent: JIntent);
begin
  if FService <> nil then
    FService.DoTaskRemoved(ARootIntent);
  if FIntentService <> nil then
    FIntentService.DoTaskRemoved(ARootIntent);
end;

class procedure TServiceCallbacks.onTrimMemoryCallback(Level: Integer);
begin
  if FService <> nil then
    FService.DoTrimMemory(Level);
  if FIntentService <> nil then
    FIntentService.DoTrimMemory(Level);
end;

class function TServiceCallbacks.onUnbindCallback(const AnIntent: JIntent): Boolean;
begin
  Result := False;
  if FService <> nil then
    Result := FService.DoUnBind(AnIntent);
  if FIntentService <> nil then
    Result := FIntentService.DoUnBind(AnIntent);
end;

{$IFDEF ANDROID}
{ TLocalServiceConnection.TJavaServiceConnection }

constructor TLocalServiceConnection.Create;
begin
  inherited;
end;

destructor TLocalServiceConnection.Destroy;
begin
  if FConnection <> nil then
    UnbindService;
  FLocalService := nil;
  inherited;
end;

constructor TLocalServiceConnection.TJavaServiceConnection.Create(const ALocalConnection: TLocalServiceConnection);
begin
  inherited Create;
  FLocalConnection := ALocalConnection;
end;

procedure TLocalServiceConnection.TJavaServiceConnection.onServiceConnected(name: JComponentName; service: JIBinder);

  function GetDelphiService(AJNIService: JNIObject): Pointer;
  var
    Env: PJNIEnv;
    Clazz: JNIClass;
    MethodID: JNIMethodID;
  begin
    Result := nil;
    PJavaVM(System.JavaMachine)^.AttachCurrentThread(System.JavaMachine, @Env, nil);
    Clazz := Env^.GetObjectClass(Env, AJNIService);
    MethodID := Env^.GetMethodID(Env, Clazz, 'getService', '()J');
    if MethodID <> nil then
      Result := Pointer(Env^.CallLongMethod(Env, AJNIService, MethodID));
    Env^.DeleteLocalRef(Env, Clazz);
  end;

begin
  FLocalConnection.DoOnConnected(TAndroidBaseService(GetDelphiService((service as ILocalObject).GetObjectID)));
end;

procedure TLocalServiceConnection.TJavaServiceConnection.onServiceDisconnected(name: JComponentName);
begin
  FLocalConnection.DoOnDisconnected;
  FLocalConnection.UnbindService;
end;

{ TLocalServiceConnection }

procedure TLocalServiceConnection.BindService(const AServiceName: string; flags: Integer);
var
  LIntent: JIntent;
  LService: string;
begin
  if FConnection = nil then
    FConnection := TJavaServiceConnection.Create(Self);
  LIntent := TJIntent.Create;
  LService := AServiceName;
  if not LService.StartsWith('com.embarcadero.services.') then
    LService := 'com.embarcadero.services.' + LService;
  LIntent.setClassName(TAndroidHelper.Context.getPackageName(), TAndroidHelper.StringToJString(LService));
  TAndroidHelper.Activity.bindService(LIntent, FConnection, flags);
end;

class procedure TLocalServiceConnection.StartService(const AServiceName: string);
var
  LIntent: JIntent;
  LService: string;
begin
  LIntent := TJIntent.Create;
  LService := AServiceName;
  if not LService.StartsWith('com.embarcadero.services.') then
    LService := 'com.embarcadero.services.' + LService;
  LIntent.setClassName(TAndroidHelper.Context.getPackageName(), TAndroidHelper.StringToJString(LService));
  TAndroidHelper.Activity.startService(LIntent);
end;

procedure TLocalServiceConnection.DoOnConnected(const ALocalService: TAndroidBaseService);
begin
  FLocalService := ALocalService;
  if Assigned(FOnConnected) then
    FOnConnected(ALocalService);
end;

procedure TLocalServiceConnection.DoOnDisconnected;
begin
  if Assigned(FOnDisconnected) then
    FOnDisconnected;
end;

procedure TLocalServiceConnection.UnbindService;
begin
  if FConnection <> nil then
  try
    TAndroidHelper.Activity.unbindService(FConnection);
  finally
    FConnection.Free;
  end;
end;

{ TRemoteServiceConnection.TJavaServiceConnection }

constructor TRemoteServiceConnection.TJavaServiceConnection.Create(const ALocalConnection: TRemoteServiceConnection);
begin
  inherited Create;
  FLocalConnection := ALocalConnection;
end;

procedure TRemoteServiceConnection.TJavaServiceConnection.onServiceConnected(name: JComponentName; service: JIBinder);
begin
  FLocalConnection.DoOnConnected(service);
end;

procedure TRemoteServiceConnection.TJavaServiceConnection.onServiceDisconnected(name: JComponentName);
begin
  FLocalConnection.DoOnDisconnected;
  FLocalConnection.UnbindService;
end;

{ TRemoteServiceConnection.TRTLHandlerListener }

constructor TRemoteServiceConnection.TRTLHandlerListener.Create(const AConnection: TRemoteServiceConnection);
begin
  inherited Create;
  FConnection := AConnection;
  FHandler := TJRTLHandler.JavaClass.init(Self);
end;

procedure TRemoteServiceConnection.TRTLHandlerListener.handleMessage(msg: JMessage);
begin
  FConnection.DoOnHandleMessage(msg);
end;


{ TRemoteServiceConnection }

constructor TRemoteServiceConnection.Create;
begin
  inherited;
end;

destructor TRemoteServiceConnection.Destroy;
begin
  if FConnection <> nil then
    UnbindService;
  FHandlerListener.Free;
  inherited;
end;

procedure TRemoteServiceConnection.BindService(const APackageName, AServiceName: string; flags: Integer);
var
  LIntent: JIntent;
begin
  if FConnection = nil then
    FConnection := TJavaServiceConnection.Create(Self);
  LIntent := TJIntent.Create;
  LIntent.setClassName(TAndroidHelper.StringToJString(APackageName), TAndroidHelper.StringToJString(AServiceName));
  TAndroidHelper.Activity.bindService(LIntent, FConnection, flags);
end;

procedure TRemoteServiceConnection.DoOnConnected(const service: JIBinder);
begin
  FJBinder:=service;

  FHandlerListener := TRTLHandlerListener.Create(Self);
  FJLocalMessenger := TJMessenger.JavaClass.init(FHandlerListener.Handler);

  FJServiceMessenger := TJMessenger.JavaClass.init(service);

  if Assigned(FOnConnected) then
    FOnConnected(FJServiceMessenger);
end;

procedure TRemoteServiceConnection.DoOnDisconnected;
begin
  if Assigned(FOnDisconnected) then
    FOnDisconnected;
end;

procedure TRemoteServiceConnection.DoOnHandleMessage(const AMessage: JMessage);
begin
  if Assigned(FOnHandleMessage) then
    FOnHandleMessage(AMessage);
end;

function TRemoteServiceConnection.GetHandler: JRTLHandler;
begin
  Result := FHandlerListener.Handler;
end;

procedure TRemoteServiceConnection.UnbindService;
begin
  if FConnection <> nil then
  try
    TAndroidHelper.Activity.unbindService(FConnection);
  finally
    FConnection.Free;
  end;
end;
{$ENDIF ANDROID}

end.
