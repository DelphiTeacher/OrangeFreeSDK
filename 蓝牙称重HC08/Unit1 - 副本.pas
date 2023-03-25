unit Unit1;

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

  uBaseList,
  Androidapi.JNI.bluetoothlibrary_debug,
  Androidapi.JNI.bleweight_debug,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TJHoldBluetooth_UpdateList = class(TJavaLocal,JHoldBluetooth_UpdateList)
    { methods }
    procedure update(P1: Boolean; P2: JDeviceModule); cdecl; //(ZLcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure updateMessyCode(P1: Boolean; P2: JDeviceModule); cdecl; //(ZLcom/hc/bluetoothlibrary/DeviceModule;)V
    { Property }
  end;

  TJHoldBluetooth_OnReadDataListener = class(TJavaLocal,JHoldBluetooth_OnReadDataListener)
    { methods }
    procedure readData(P1: JString; P2: TJavaArray<Byte>); cdecl; //(Ljava/lang/String;[B)V
    procedure reading(P1: Boolean); cdecl; //(Z)V
    procedure connectSucceed; cdecl; //()V
    procedure errorDisconnect(P1: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure readNumber(P1: Integer); cdecl; //(I)V
    procedure readLog(P1: JString; P2: JString; P3: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    procedure readVelocity(P1: Integer); cdecl; //(I)V

    { Property }
  end;




  TMyDeviceModule=class
    FJDeviceModule:JDeviceModule;
  end;
  TMyDeviceModuleList=class(TBaseList)
  private
    function GetItem(Index: Integer): TMyDeviceModule;
  public

    property Itemss[Index:Integer]:TMyDeviceModule read GetItem;default;
  end;


  TForm1 = class(TForm)
    ListBox1: TListBox;
    btnLoad: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    mHoldBluetooth:JHoldBluetooth;
    mJHoldBluetooth_UpdateList:JHoldBluetooth_UpdateList;
    FMyDeviceModuleList:TMyDeviceModuleList;
    mJHoldBluetooth_OnReadDataListener:JHoldBluetooth_OnReadDataListener;
    modules:JList;
    procedure SyncListBox;
    { Private declarations }
  public
    { Public declarations }
  end;




var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btnLoadClick(Sender: TObject);
begin
  if mHoldBluetooth.bluetoothState then
  begin
//        if (state){
//            return mAllBluetoothManage.bleScan();
//        }else {
//            return mAllBluetoothManage.mixScan();
//        }
    mHoldBluetooth.scan(False);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  FMyDeviceModuleList:=TMyDeviceModuleList.Create();

  mHoldBluetooth:=TJHoldBluetooth.JavaClass.getInstance;

  //设备列表更新事件
  mJHoldBluetooth_UpdateList:=TJHoldBluetooth_UpdateList.Create;

  //初始
  mHoldBluetooth.initHoldBluetooth(TAndroidHelper.Context,mJHoldBluetooth_UpdateList);
end;

{ TJHoldBluetooth_UpdateList }

procedure TJHoldBluetooth_UpdateList.update(P1: Boolean; P2: JDeviceModule);
var
  AMyDeviceModule:TMyDeviceModule;
begin
  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_UpdateList.update Begin');
  //if (isStart && deviceModule == null){//更新距离值
  //    mainRecyclerAdapter.notifyDataSetChanged();
  //    return;
  //}
  //
  //if (isStart){
  //    setMainBackIcon();
  //    mModuleArray.add(deviceModule);
  //    addFilterList(deviceModule,true);
  //}else {
  //    mTitle.updateLoadingState(false);
  //}
  if P1 and (P2=nil) then
  begin
    Exit;
  end;
  if P1 then
  begin
    AMyDeviceModule:=TMyDeviceModule.Create;
    AMyDeviceModule.FJDeviceModule:=P2;
    Form1.FMyDeviceModuleList.Add(AMyDeviceModule);
  end
  else
  begin
    TThread.Synchronize(nil,procedure
    begin
      Form1.SyncListBox;
    end);
  end;

  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_UpdateList.update End');
end;

procedure TJHoldBluetooth_UpdateList.updateMessyCode(P1: Boolean;
  P2: JDeviceModule);
var
  I:Integer;
  AMyDeviceModule:TMyDeviceModule;
begin
  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_UpdateList.updateMessyCode Begin');
  //
  //for(int i= 0; i<mModuleArray.size();i++){
  //    if (mModuleArray.get(i).getMac().equals(deviceModule.getMac())){
  //        mModuleArray.remove(mModuleArray.get(i));
  //        mModuleArray.add(i,deviceModule);
  //        upDateList();
  //        break;
  //    }
  //}
  for I := 0 to Form1.FMyDeviceModuleList.Count-1 do
  begin
    if Form1.FMyDeviceModuleList[I].FJDeviceModule.getMac().equals(P2.getMac()) then
    begin
      Form1.FMyDeviceModuleList[I].FJDeviceModule:=P2;
      Break;
    end;
  end;
  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_UpdateList.updateMessyCode End');

end;

{ TMyDeviceModuleList }

function TMyDeviceModuleList.GetItem(Index: Integer): TMyDeviceModule;
begin
  Result:=TMyDeviceModule(Inherited Items[Index]);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FMyDeviceModuleList);
end;

procedure TForm1.FormShow(Sender: TObject);
begin

  //申请权限
  {$IFDEF ANDROID}
  PermissionsService.RequestPermissions
      ([JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION),
        JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION)
        ],
    nil);
  {$ENDIF}

end;

procedure TForm1.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var
  ADetail:String;
begin

    FMX.Types.Log.d('OrangeUI TForm1.ListBox1Click Begin');
//    mHoldBluetooth.setDevelopmentMode(MainActivity.this);//设置是否进入开发模式
//    mHoldBluetooth.connect(mFilterModuleArray.get(position));

    ADetail:=Item.ItemData.Detail;

    if mJHoldBluetooth_OnReadDataListener=nil then
    begin
      mHoldBluetooth.setDevelopmentMode(TAndroidHelper.Context);

      FMX.Types.Log.d('OrangeUI TForm1.ListBox1Click 2');
      mJHoldBluetooth_OnReadDataListener:=TJHoldBluetooth_OnReadDataListener.Create;

      FMX.Types.Log.d('OrangeUI TForm1.ListBox1Click 3');
      mHoldBluetooth.setOnReadListener(mJHoldBluetooth_OnReadDataListener);
    end;


    FMX.Types.Log.d('OrangeUI TForm1.ListBox1Click 1 '
                    +JStringToString(Self.FMyDeviceModuleList[Item.Index].FJDeviceModule.getName())
                    +' '
                    +JStringToString(Self.FMyDeviceModuleList[Item.Index].FJDeviceModule.getMac()));
    mHoldBluetooth.connect(FMyDeviceModuleList[Item.Index].FJDeviceModule);
    FMX.Types.Log.d('OrangeUI TForm1.ListBox1Click End');


    Form1.Memo1.Lines.Insert(0,'开始连接'+ADetail);


end;

procedure TForm1.SyncListBox;
var
  I:Integer;
  AListBoxItem:TListBoxItem;
begin
  Self.ListBox1.BeginUpdate;
  try
    Self.ListBox1.Items.Clear;
    for I := 0 to Self.FMyDeviceModuleList.Count-1 do
    begin
      Self.ListBox1.Items.Add(JStringToString(Self.FMyDeviceModuleList[I].FJDeviceModule.getName()));
      AListBoxItem:=Self.ListBox1.ListItems[I];
      AListBoxItem.ItemData.Detail:=JStringToString(Self.FMyDeviceModuleList[I].FJDeviceModule.getMac());
      AListBoxItem.StyleLookup:='listboxitemrightdetail';
    end;
  finally
    ListBox1.EndUpdate;
  end;
end;

{ TJHoldBluetooth_OnReadDataListener }

procedure TJHoldBluetooth_OnReadDataListener.connectSucceed;
begin
  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_OnReadDataListener.connectSucceed');
//  modules = mHoldBluetooth.getConnectedArray();
//  mMessage.readData(FRAGMENT_STATE_DATA, modules.get(0), null);
//  mThree.readData(FRAGMENT_STATE_DATA,modules.get(0),null);
//  mADMod.readData(FRAGMENT_STATE_DATA,modules.get(0),null);
//  setState(CONNECTED);//设置连接状态
//  log("连接成功: "+modules.get(0).getName());

  Form1.modules:=Form1.mHoldBluetooth.getConnectedArray();

  TThread.Synchronize(nil,procedure
  begin
//    ShowMessage('连接成功');
    Form1.Memo1.Lines.Insert(0,'连接成功 '+IntToStr(Form1.modules.size));
  end);
end;

procedure TJHoldBluetooth_OnReadDataListener.errorDisconnect(P1: JDeviceModule);
begin
  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_OnReadDataListener.errorDisconnect');
  TThread.Synchronize(nil,procedure
  begin
//    ShowMessage('连接成功');
    Form1.Memo1.Lines.Insert(0,'异常断开');
  end);

end;

procedure TJHoldBluetooth_OnReadDataListener.readData(P1: JString;
  P2: TJavaArray<Byte>);
var
  AJStr:JString;
begin
  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_OnReadDataListener.readData');
  TThread.Synchronize(nil,procedure
  begin
//    Form1.Memo1.Lines.Insert(0,'收到数据');

//        switch (state){
//            case CommunicationActivity.FRAGMENT_STATE_DATA:
//                if (module == null) {
//                    module = (DeviceModule) o;
//                }
//                if (data != null) {
//                    mDataList.add(new FragmentMessageItem(Analysis.getByteToString(data,mFragmentParameter.getCodeFormat(getContext()),isReadHex), isShowTime?Analysis.getTime():null, false, module,isShowMyData));
//                    mAdapter.notifyDataSetChanged();
//                    mRecyclerView.smoothScrollToPosition(mDataList.size());
//                    mReadNumberTV.setText(String.valueOf(Integer.parseInt(mReadNumberTV.getText().toString())+data.length));
//                    setClearRecycler(data.length);//判断是否清屏（清除缓存）
//                }
//                break;
//            case CommunicationActivity.FRAGMENT_STATE_NUMBER:
//                mSendNumberTv.setText(String.valueOf(Integer.parseInt(mSendNumberTv.getText().toString())+((int) o)));
//                setUnsentNumberTv();
//                break;
//            case CommunicationActivity.FRAGMENT_STATE_SEND_SEND_TITLE:
//                mTitle = (DefaultNavigationBar) o;
//                break;
//            case CommunicationActivity.FRAGMENT_STATE_SERVICE_VELOCITY:
//                int velocity = (int) o;
//                mVelocityTv.setText("速度: "+velocity+"B/s");
//                break;
//        }


//    public static String getByteToString(byte[] bytes,String code,boolean isHex){
//        try {
//            if (isHex)
//                return bytesToHexString(bytes);
//            else
//                return new String(bytes,0,bytes.length,code);
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
    try
      AJStr:=TJString.JavaClass.Init(P2,0,P2.length,StringToJString('GBK'));
      Form1.Memo2.Lines.Insert(0,JStringToString(AJStr));
    except
      on E:Exception do
      begin
        FMX.Types.Log.d('OrangeUI TJHoldBluetooth_OnReadDataListener.readData error');
      end;
    end;


  end);
end;

procedure TJHoldBluetooth_OnReadDataListener.reading(P1: Boolean);
begin
  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_OnReadDataListener.reading');
  TThread.Synchronize(nil,procedure
  begin
//    Form1.Memo1.Lines.Insert(0,'reading');
  end);

end;

procedure TJHoldBluetooth_OnReadDataListener.readLog(P1, P2, P3: JString);
begin
  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_OnReadDataListener.readLog');
  TThread.Synchronize(nil,procedure
  begin
//    Form1.Memo1.Lines.Insert(0,'readLog');
  end);

end;

procedure TJHoldBluetooth_OnReadDataListener.readNumber(P1: Integer);
begin
  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_OnReadDataListener.readNumber');
  TThread.Synchronize(nil,procedure
  begin
//    Form1.Memo1.Lines.Insert(0,'readNumber');
  end);

end;

procedure TJHoldBluetooth_OnReadDataListener.readVelocity(P1: Integer);
begin
  FMX.Types.Log.d('OrangeUI TJHoldBluetooth_OnReadDataListener.readVelocity');
  TThread.Synchronize(nil,procedure
  begin
//    Form1.Memo1.Lines.Insert(0,'readVelocity');
  end);

end;

end.
