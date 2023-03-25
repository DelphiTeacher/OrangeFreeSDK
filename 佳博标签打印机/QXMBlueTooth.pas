//蓝牙单元 by 漠北
//临时赶出来给别人用的，只做了连接和数据发送。接收、搜索和配对什么的还没做
unit QXMBlueTooth;

interface
uses
System.Classes
,System.Bluetooth
,System.SysUtils
,FMX.Dialogs
,System.UITypes
,Androidapi.JNI.GraphicsContentViewText
,Androidapi.JNI.Provider
,Androidapi.Helpers
;
type
  TServerConnectionTH = class(TThread)
  private
    { Private declarations }
    FServerSocket: TBluetoothServerSocket;
    FSocket: TBluetoothSocket;
    FData: TBytes;
  protected
    procedure Execute; override;
  public
    { Public declarations }
    constructor Create(ACreateSuspended: Boolean);
    destructor Destroy; override;
  end;
Const
  ServiceGUI = '{00001101-0000-1000-8000-00805F9B34FB}';
var
  FBluetoothManager: TBluetoothManager;
  FDiscoverDevices: TBluetoothDeviceList;
  FPairedDevices: TBluetoothDeviceList;
  FAdapter: TBluetoothAdapter;
  FSocket: TBluetoothSocket;

  function ManagerConnected:Boolean;
  procedure BluetoothIni;
  function ConnectDevice(Address:string):boolean;
  function SendBufData(ToSend:TBytes):boolean;
  function DisConnectDevice:boolean;
  function GetDeviceAddressList:TStringList;
  function GetDeviceNameList:TStringList;
implementation
{TServerConnection}

constructor TServerConnectionTH.Create(ACreateSuspended: Boolean);
begin
  inherited;
end;

destructor TServerConnectionTH.Destroy;
begin
  FSocket.Free;
  FServerSocket.Free;
  inherited;
end;

procedure TServerConnectionTH.execute;
var
  ASocket: TBluetoothSocket;
  Msg: string;
begin
  while not Terminated do
    try
      ASocket := nil;
      while not Terminated and (ASocket = nil) do
        ASocket := FServerSocket.Accept(100);
      if(ASocket <> nil) then
      begin
        FSocket := ASocket;
        while not Terminated do
        begin
          FData := ASocket.ReceiveData;
          if length(FData) > 0 then
            Synchronize(procedure
              begin
              end);
          sleep(100);
        end;
      end;
    except
      on E : Exception do
      begin
        Msg := E.Message;
        Synchronize(procedure
          begin
            showmessage('蓝牙连接已关闭');
          end);
      end;
    end;
end;
function ManagerConnected:Boolean;
begin
  if FBluetoothManager.ConnectionState = TBluetoothConnectionState.Connected then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
    BluetoothIni;
  end
end;
procedure IntentsetAction;
var
  Intent: JIntent;
begin
  Intent := TJIntent.Create;
  Intent.setAction(TJSettings.JavaClass.ACTION_BLUETOOTH_SETTINGS);
  SharedActivity.startActivity(Intent);
end;
procedure BluetoothIni;
begin
  try
    FBluetoothManager := TBluetoothManager.Current;
    FBluetoothManager.SocketTimeout:=0;
    FAdapter := FBluetoothManager.CurrentAdapter;
    if ManagerConnected then
      FPairedDevices := FBluetoothManager.GetPairedDevices;
  except
    MessageDlg('蓝牙可能已关闭,是否进行蓝牙设置？', System.UITypes.TMsgDlgType.mtInformation,
    [ System.UITypes.TMsgDlgBtn.mbYes,
      System.UITypes.TMsgDlgBtn.mbCancel], 0,
    procedure(const AResult: TModalResult)
    begin
      if AResult = mrYES then
      begin
        IntentsetAction;
      end;
    end);
  end;
end;
function GetDeviceByMac(Address:string):TBluetoothDevice;
var
  i:integer;
begin
  result:=nil;
  FPairedDevices := FBluetoothManager.GetPairedDevices;
  for i := 0 to FPairedDevices.Count-1 do begin
    if FPairedDevices[i].Address=Address then
    begin
      result:=FPairedDevices[i];
      break;
    end;
  end;

end;
function GetDeviceAddressList:TStringList;
var
  i:integer;
begin
  result:=TStringList.Create;;
  FPairedDevices := FBluetoothManager.GetPairedDevices;
  for i := 0 to FPairedDevices.Count-1 do begin
    result.Add(FPairedDevices[i].Address);
  end;

end;
function GetDeviceNameList:TStringList;
var
  i:integer;
begin
  result:=TStringList.Create;;
  FPairedDevices := FBluetoothManager.GetPairedDevices;
  for i := 0 to FPairedDevices.Count-1 do begin
    result.Add(FPairedDevices[i].DeviceName);
  end;

end;
function ConnectDevice(Address:string):boolean;
var
  aDevice:TBluetoothDevice;
begin
  result:=false;
  if ManagerConnected then
  begin
    aDevice:= GetDeviceByMac(Address);
    if assigned(aDevice) then begin
      FSocket := aDevice.CreateClientSocket(StringToGUID(ServiceGUI), False);
    end;
    try
      FSocket.Connect;
    except
    end;
    if FSocket.Connected then
    begin
      result:=true;
    end
    else
    begin
      FreeAndNil(FSocket);
    end;

  end;
end;
function DisConnectDevice:boolean;
begin
  result:=true;
  if assigned(FSocket) then FSocket.Close;
  FreeAndNil(FSocket);
end;

function SendBufData(ToSend:TBytes):boolean;
begin
  result:=false;
  if (FSocket <> nil)  then
  begin
    try
      FSocket.SendData(ToSend);
      result:=true;
    except
    end;
  end;
end;


initialization
finalization
end.
