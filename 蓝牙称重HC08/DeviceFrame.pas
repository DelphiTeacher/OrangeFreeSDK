unit DeviceFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,


  {$IFDEF ANDROID}
  FMX.Platform.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.Widget,


  Androidapi.JNI.Net,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  FMX.Helpers.Android,
  Androidapi.JNI.Os,
    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}
  {$ENDIF}

  uBluetoothScaleDevice,
  uBaseList,
  Androidapi.JNI.bluetoothlibrary_debug,
  Androidapi.JNI.bleweight_debug,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type

  TFrameDevice = class(TFrame)
    ListBox1: TListBox;
    btnLoad: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Label2: TLabel;
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure btnLoadClick(Sender: TObject);
  private
    FBluetoothScaleDevice:TBluetoothScaleDevice;
    procedure SyncListBox;
    { Private declarations }
  public
    procedure DoLog(Sender:TObject;ALog:String);
    procedure DoReceiveWeight(Sender:TObject;AWeight:String;AMac:String);
    procedure DoScan(Sender:TObject);
    { Public declarations }
  end;




var
  FrameDevice: TFrameDevice;

implementation

{$R *.fmx}

procedure TFrameDevice.btnLoadClick(Sender: TObject);
begin
  if FBluetoothScaleDevice=nil then
  begin
    FBluetoothScaleDevice:=TBluetoothScaleDevice.Create;
    FBluetoothScaleDevice.FOnLog:=Self.DoLog;
    FBluetoothScaleDevice.FOnReceiveWeight:=Self.DoReceiveWeight;
    FBluetoothScaleDevice.FOnScan:=Self.DoScan;

  end;
  FBluetoothScaleDevice.Scan;
end;

procedure TFrameDevice.DoLog(Sender: TObject; ALog: String);
begin
  Self.Memo1.Lines.Insert(0,ALog);
end;

procedure TFrameDevice.DoReceiveWeight(Sender: TObject; AWeight: String;AMac:String);
begin
  Self.Memo2.Lines.Insert(0,AWeight);
end;

procedure TFrameDevice.DoScan(Sender: TObject);
begin
  SyncListBox;
end;

procedure TFrameDevice.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin

  FBluetoothScaleDevice.Connect(FBluetoothScaleDevice.FMyDeviceModuleList[Item.Index]);
end;

procedure TFrameDevice.SyncListBox;
var
  I:Integer;
  AListBoxItem:TListBoxItem;
begin
  Self.ListBox1.BeginUpdate;
  try
    Self.ListBox1.Items.Clear;
    for I := 0 to FBluetoothScaleDevice.FMyDeviceModuleList.Count-1 do
    begin
      Self.ListBox1.Items.Add(JStringToString(FBluetoothScaleDevice.FMyDeviceModuleList[I].FJDeviceModule.getName()));
      AListBoxItem:=Self.ListBox1.ListItems[I];
      AListBoxItem.ItemData.Detail:=JStringToString(FBluetoothScaleDevice.FMyDeviceModuleList[I].FJDeviceModule.getMac());
      AListBoxItem.StyleLookup:='listboxitemrightdetail';
    end;
  finally
    ListBox1.EndUpdate;
  end;
end;

end.
