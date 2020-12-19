unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,



  {$IFDEF ANDROID}
  Androidapi.JNI.Net,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  FMX.Helpers.Android,
  Androidapi.JNI.Os,
    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}
//    uAndroidPermission_D10_2,
  {$ENDIF}
  Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar,
  Androidapi.JNI.sunmiuhfhelper_debug_aar,


  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
  TJMyIReaderCall = class(TJavaLocal,JMyIReaderCall) // or JObject // SuperSignature: com/sunmi/rfid/ReaderCall
  public
    { methods }
    procedure onSuccess(cmd: Byte; params: JDataParameter); cdecl; //(BLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onTag(cmd: Byte; state: Byte; tag: JDataParameter); cdecl; //(BBLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onFiled(cmd: Byte; errorCode: Byte; msg: JString); cdecl; //(BBLjava/lang/String;)V

    { Property }
  end;

  TForm4 = class(TForm)
    btnConnect: TButton;
    btnDisconnect: TButton;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FJMyIReaderCall:JMyIReaderCall;
    FJMyReaderCall:JMyReaderCall;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.btnConnectClick(Sender: TObject);
begin
//        RFIDManager.getInstance().setPrintLog(true);
//        RFIDManager.getInstance().connect(this);
  TJRFIDManager.JavaClass.getInstance().setPrintLog(true);
  TJRFIDManager.JavaClass.getInstance().connect(SharedActivityContext);


end;

procedure TForm4.btnDisconnectClick(Sender: TObject);
begin
  //RFIDManager.getInstance().disconnect();
  TJRFIDManager.JavaClass.getInstance().disconnect();
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  //开始识别RFID 6B
  if FJMyIReaderCall=nil then
  begin
    FJMyIReaderCall:=TJMyIReaderCall.Create();
    TJMyReaderCall.JavaClass.setMyIReaderCall(FJMyIReaderCall);
    FJMyReaderCall:=TJMyReaderCall.Create;

  end;
  TJRFIDManager.JavaClass.getInstance().getHelper().registerReaderCall(FJMyReaderCall);
  TJRFIDManager.JavaClass.getInstance().getHelper().iso180006BInventory();
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  //结束识别
  TJRFIDManager.JavaClass.getInstance().getHelper().unregisterReaderCall();
end;

{ TJMyIReaderCall }

procedure TJMyIReaderCall.onFiled(cmd, errorCode: Byte; msg: JString);
begin
  FMX.Types.Log.d('OrangeUI TJMyIReaderCall.onFiled');
  //if (cmd == CMD.ISO18000_6B_INVENTORY) {
  //    if (!isDestroyed()) {
  //        runOnUiThread(() -> {
  //            if (!isDestroyed()) {
  //                mLogList.writeLog(cmd + ":" + msg, errorCode);
  //                refreshStartStop(isScan = false);
  //            }
  //        });
  //    }
  //}
  if (cmd=TJCMD.JavaClass.ISO18000_6B_INVENTORY) then
  begin
    TThread.Synchronize(nil,procedure
    begin
      Form4.Memo1.Lines.Add('失败');
    end);
  end;

end;

procedure TJMyIReaderCall.onSuccess(cmd: Byte; params: JDataParameter);
begin
  FMX.Types.Log.d('OrangeUI TJMyIReaderCall.onSuccess');
  //if (cmd == CMD.ISO18000_6B_INVENTORY) {
  //    if (!isDestroyed()) {
  //        runOnUiThread(() -> {
  //            if (!isDestroyed()) {
  //                String info = getString(R.string.rfid_scan_result, count, list.size());
  //                mLogList.writeLog(info, ParamCts.SUCCESS);
  //                refreshStartStop(isScan = false);
  //            }
  //        });
  //    }
  //}
  if (cmd=TJCMD.JavaClass.ISO18000_6B_INVENTORY) then
  begin
    TThread.Synchronize(nil,procedure
    begin
      Form4.Memo1.Lines.Add('成功');
    end);
  end;


end;

procedure TJMyIReaderCall.onTag(cmd, state: Byte; tag: JDataParameter);

begin
  FMX.Types.Log.d('OrangeUI TJMyIReaderCall.onTag');

  //if (cmd == CMD.ISO18000_6B_INVENTORY) {
  //    if (!isDestroyed()) {
  //        runOnUiThread(() -> {
  //            if (!isDestroyed()) {
  //                if (state == ParamCts.FOUND_TAG) {
  //                    String uid = tag.getString(ParamCts.TAG_UID);
  //                    mLogList.writeLog("new tag:" + uid, ParamCts.SUCCESS);
  //                    list.add(0, uid);
  //                    data.add(0, tag);
  //                } else {
  //                    String uid = tag.getString(ParamCts.TAG_UID);
  //                    mLogList.writeLog("update tag:" + uid, ParamCts.SUCCESS);
  //                    int index = list.indexOf(uid);
  //                    data.set(index, tag);
  //                }
  //                count += 1;
  //                mTagReal6BList.setTag(data);
  //            }
  //        });
  //    }
  //}
  if (cmd=TJCMD.JavaClass.ISO18000_6B_INVENTORY) then
  begin
    TThread.Synchronize(nil,procedure
    var
      AUID:JString;
    begin
      AUID:=tag.getString(TJParamCts.JavaClass.TAG_UID);

      if state=TJParamCts.JavaClass.FOUND_TAG then
      begin
        Form4.Memo1.Lines.Add('找到新标签'+JStringToString(AUID));

      end
      else
      begin
        Form4.Memo1.Lines.Add('标签'+JStringToString(AUID));

      end;

    end);
  end;


end;

end.
