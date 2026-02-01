unit uDeTongPrinter;

interface

uses
  SysUtils,
  Classes,
  System.Types,
  SyncObjs,
  {$IF RTLVersion>=33}// 10.3+
  System.Permissions, // 动态权限单元
  {$ENDIF}


  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.Util,
  Androidapi.JNI.WebKit,
  Androidapi.JNI.Bluetooth,
  Androidapi.JNI.Hardware,
  Androidapi.JNI.LPAPI_2024_10_21_R,
  Androidapi.Helpers,

  FMX.Types,
  FMX.Dialogs,


  System.Generics.Collections,
  System.Bluetooth,
  System.Bluetooth.Components;

const
  LOCATION_PERMISSION = 'android.permission.ACCESS_FINE_LOCATION';
  LOCATION_PERMISSION2 = 'android.permission.ACCESS_COARSE_LOCATION';
  BLUETOOTH_SCAN_PERMISSION = 'android.permission.BLUETOOTH_SCAN';
  BLUETOOTH_ADVERTISE_PERMISSION = 'android.permission.BLUETOOTH_ADVERTISE';
  BLUETOOTH_CONNECT_PERMISSION = 'android.permission.BLUETOOTH_CONNECT';


type
  TDeTongPrinter = class;
  TPermissionSuccProc=reference to procedure();

  TMyJLPAPI_Callback=class(TJavaLocal, JLPAPI_Callback)
    procedure onProgressInfo(P1: JIDzPrinter_ProgressInfo; P2: JObject); cdecl;
    procedure onStateChange(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrinterState); cdecl;
    procedure onPrintProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrintData;
      P3: JIDzPrinter_PrintProgress; P4: JObject); cdecl;
    procedure onPrinterDiscovery(P1: JIDzPrinter_PrinterAddress; P2: JObject); cdecl;

  public
    FDeTongPrinter:TDeTongPrinter;
    constructor Create(ADeTongPrinter:TDeTongPrinter);
  end;


  TMyPrinterAddress=class

    FJIDzPrinter_PrinterAddress:JIDzPrinter_PrinterAddress;
  end;

  TDeTongPrinter=class
  public

    //检查权限
    class procedure CheckPermission(ASuccMethod:TPermissionSuccProc;AFailMethod:TPermissionSuccProc);
  public
    api:JLPAPI;
    FMyJLPAPI_Callback:JLPAPI_Callback;
    FPrintAddressStrList:TStringList;
    FPrintAddressObjList:TObjectList<TMyPrinterAddress>;
    FJIDzPrinter_PrinterAddress:JIDzPrinter_PrinterAddress;
    constructor Create;
    destructor Destroy;override;

//    function getAllPrinterAddresses:TStringList;

    procedure Test();
    procedure StartDiscovery;
    procedure StopDiscovery;

  end;


implementation

{ TDeTongPrinter }


class procedure TDeTongPrinter.CheckPermission(ASuccMethod: TPermissionSuccProc;AFailMethod:TPermissionSuccProc);
var
  AAndroidPermissions:TArray<string>;
begin
  //在Android下需要判断有没有权限
  //动态申请权限,Const_Android_RequestPermissions在uConst中定义
  //10.2 WILL CRASH
  {$IFDEF ANDROID}

  if TOSVersion.Check(12) then
    AAndroidPermissions := [LOCATION_PERMISSION, LOCATION_PERMISSION2,
      BLUETOOTH_SCAN_PERMISSION, BLUETOOTH_ADVERTISE_PERMISSION, BLUETOOTH_CONNECT_PERMISSION]
  else
    AAndroidPermissions := [LOCATION_PERMISSION,LOCATION_PERMISSION2];

  PermissionsService.RequestPermissions(AAndroidPermissions,
        procedure(const APermissions: {$IF CompilerVersion >= 35.0}TClassicStringDynArray{$ELSE}TArray<string>{$IFEND};
          const AGrantResults: {$IF CompilerVersion >= 35.0}TClassicPermissionStatusDynArray{$ELSE}TArray<TPermissionStatus>{$IFEND})
        begin


          if ((Length(AGrantResults) = 5) and (AGrantResults[0] = TPermissionStatus.Granted)
                                         and (AGrantResults[1] = TPermissionStatus.Granted)
                                         and (AGrantResults[2] = TPermissionStatus.Granted)
                                         and (AGrantResults[3] = TPermissionStatus.Granted)
                                         and (AGrantResults[4] = TPermissionStatus.Granted)) or
             ((Length(AGrantResults) = 2) and (AGrantResults[0] = TPermissionStatus.Granted)) then
          begin
              if assigned(ASuccMethod) then
              begin
                ASuccMethod();
              end;
          end
          else
          begin

              if Assigned(AFailMethod) then
              begin
                AFailMethod();
              end;
          end;
        end);
  {$ELSE}
    ASuccMethod();
  {$ENDIF}

end;


constructor TDeTongPrinter.Create;
begin
  FMyJLPAPI_Callback:=TMyJLPAPI_Callback.Create(Self);
  api:=TJLPAPI_Factory.JavaClass.createInstance(FMyJLPAPI_Callback);
  FPrintAddressStrList:=TStringList.Create;
  FPrintAddressObjList:=TObjectList<TMyPrinterAddress>.Create;
end;

destructor TDeTongPrinter.Destroy;
begin
  api.quit();
  FreeAndNil(FPrintAddressStrList);
  FreeAndNil(FPrintAddressObjList);
  inherited;
end;

procedure TDeTongPrinter.StartDiscovery;
begin
  FPrintAddressStrList.Clear;
  FPrintAddressObjList.Clear;
  FJIDzPrinter_PrinterAddress:=nil;
  Self.api.discovery;
end;

procedure TDeTongPrinter.StopDiscovery;
begin
  Self.api.stopDiscovery;
end;

//function TDeTongPrinter.getAllPrinterAddresses: TStringList;
//var
//  I:Integer;
//  list:JList;
//  PrinterAddress:JIDzPrinter_PrinterAddress;
//begin
//  Result:=TStringList.Create;
//  list := api.getAllPrinterAddresses(nil);
//  for I := 0 to list.size-1 do
//  begin
//    PrinterAddress:=TJIDzPrinter_PrinterAddress.Wrap(list.get(I));
//    Result.Add(JStringToString(PrinterAddress.macAddress));
//  end;
//end;

procedure TDeTongPrinter.Test();
begin

  // 开始绘图任务，传入参数(页面宽度, 页面高度)
  api.startJob(50, 30, 0);

  // 开始一个页面的绘制，绘制文本字符串
  // 传入参数(需要绘制的文本字符串, 绘制的文本框左上角水平位置,
  //  绘制的文本框左上角垂直位置, 绘制的文本框水平宽度, 绘制的文本框垂直高度, 文字大小)
  api.drawText(StringToJString('Hello'), 12, 5, 40, 30, 4);
  api.drawText(StringToJString('DelphiTeacher!'), 12, 10, 40, 30, 4);
  // 绘制一维码，此一维码绘制时内容会旋转180度，
  // 传入参数(需要绘制的一维码的数据, 绘制的一维码左上角水平位置,
  //  绘制的一维码左上角垂直位置, 绘制的一维码水平宽度, 绘制的一维码垂直高度)
  api.draw1DBarcode(StringToJString('123456!'), TJIAtBitmap_BarcodeType1D.JavaClass.AUTO,
    12, 15, 30, 6, 3);

  // 结束绘图任务提交打印
  api.commitJob();
end;

{ TMyJLPAPI_Callback }

constructor TMyJLPAPI_Callback.Create(ADeTongPrinter: TDeTongPrinter);
begin
  Inherited Create;
  FDeTongPrinter:=ADeTongPrinter;
end;

procedure TMyJLPAPI_Callback.onPrinterDiscovery(P1: JIDzPrinter_PrinterAddress;
  P2: JObject);
var
  AMyPrinterAddress:TMyPrinterAddress;
  AIDzPrinter_PrinterInfo:JIDzPrinter_PrinterInfo;
  AIDzPrinter_GeneralProgress:JIDzPrinter_GeneralProgress;
begin
  FMX.Types.Log.d('OrangeUI TMyJLPAPI_Callback.onPrinterDiscovery ');
  if P1<>nil then
  begin
    //这是搜索到了设备
    FMX.Types.Log.d('OrangeUI TMyJLPAPI_Callback.onPrinterDiscovery P1<>nil');
    FDeTongPrinter.FJIDzPrinter_PrinterAddress:=P1;
    if FDeTongPrinter.FPrintAddressStrList.IndexOf(JStringToString(P1.macAddress))=-1 then
    begin
      FDeTongPrinter.FPrintAddressStrList.Add(JStringToString(P1.macAddress));
      AMyPrinterAddress:=TMyPrinterAddress.Create;
      AMyPrinterAddress.FJIDzPrinter_PrinterAddress:=P1;
      FDeTongPrinter.FPrintAddressObjList.Add(AMyPrinterAddress);
    end;
  end;

  if P2<>nil then
  begin
    //这是进度通知
    FMX.Types.Log.d('OrangeUI TMyJLPAPI_Callback.onPrinterDiscovery P2<>nil');
    FMX.Types.Log.d('OrangeUI TMyJLPAPI_Callback.onPrinterDiscovery P2<>nil'+JStringToString(P2.getClass.getName));

    AIDzPrinter_GeneralProgress:=TJIDzPrinter_GeneralProgress.Wrap( (P2 as ILocalObject).GetObjectID);
    FMX.Types.Log.d('OrangeUI TMyJLPAPI_Callback.onPrinterDiscovery P2<>nil '+IntToStr(AIDzPrinter_GeneralProgress.ordinal));

  end;

end;

procedure TMyJLPAPI_Callback.onPrintProgress(P1: JIDzPrinter_PrinterAddress;
  P2: JIDzPrinter_PrintData; P3: JIDzPrinter_PrintProgress; P4: JObject);
begin
  FMX.Types.Log.d('OrangeUI TMyJLPAPI_Callback.onPrintProgress');

end;

procedure TMyJLPAPI_Callback.onProgressInfo(P1: JIDzPrinter_ProgressInfo;
  P2: JObject);
begin
  FMX.Types.Log.d('OrangeUI TMyJLPAPI_Callback.onProgressInfo');

end;

procedure TMyJLPAPI_Callback.onStateChange(P1: JIDzPrinter_PrinterAddress;
  P2: JIDzPrinter_PrinterState);
begin
  FMX.Types.Log.d('OrangeUI TMyJLPAPI_Callback.onStateChange');

end;

initialization


finalization

end.
