unit Unit8;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,


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
  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.Environment,
  Androidapi.JNI.facelib_release_aar,
  Androidapi.JNI.mysunmifacelibrary_debug_aar,
  {$ENDIF}

//  FMX.Dialogs,
//  FlyFilesUtils,
  uSunmiFaceSDK,


  FMX.Surfaces,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Media, System.Actions, FMX.ActnList,
  FMX.StdActns, FMX.MediaLibrary.Actions, FMX.TabControl, FMX.Layouts,
  FMX.ListBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  {$IFDEF ANDROID}
  //PDA扫码广播初始监听
  TSunimiScanCodeBoardcastListener = class(TJavaLocal, JFMXBroadcastReceiverListener)
  public
    destructor Destroy;override;
  public
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;
  {$ENDIF}


  TForm8 = class(TForm)
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    tmrRegFace: TTimer;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    btnInit: TButton;
    Button1: TButton;
    btnConfig: TButton;
    Button2: TButton;
    edtName: TEdit;
    btnReg: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    lbFaceList: TListBox;
    Panel1: TPanel;
    Button3: TButton;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuery1: TFDQuery;
    ListBoxItem1: TListBoxItem;
    StyleBook1: TStyleBook;
    Button4: TButton;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    procedure btnInitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure btnRegClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure tmrRegFaceTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
  private
    {$IFDEF ANDROID}
    //扫码
    FIntentFilter: JIntentFilter;
    FSunimiScanCodeBroadcastReceiver:JFMXBroadcastReceiver;
    FSunimiScanCodeBroadcastListener:TSunimiScanCodeBoardcastListener;
    {$ENDIF}
  private
  private
    FImage: TBitmap;
    FSunmiFaceSDK:TSunmiFaceSDK;
    procedure DoDeleteItemButtonClick(Sender:Tobject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

uses
  uMain;





  {$IFDEF ANDROID}
{ TSunimiScanCodeBoardcastListener }

procedure TSunimiScanCodeBoardcastListener.onReceive(context: JContext; intent: JIntent);
var
  action:JString;
  LStrAction: string;
  ABarCode:String;
begin
  action:=intent.getAction;
  LStrAction := JStringToString(intent.getAction);

  FMX.Types.Log.d('OrangeUI TSunimiScanCodeBoardcastListener.onReceive '+LStrAction);



//  TThread.Synchronize(nil,procedure
//  begin
//    //GlobalScanInStoreFrame.DoScanCodeResultEvent(nil,ABarCode);
//    Form8.Memo1.Lines.Add(LStrAction);
//  end);

  if intent.hasExtra(StringToJString('data')) then
  begin
    ABarCode:=JStringToString(intent.getStringExtra(StringToJString('data')));

    FMX.Types.Log.d('OrangeUI TSunimiScanCodeBoardcastListener.onReceive BarCode:'+ABarCode);

    TThread.Synchronize(nil,procedure
    begin
      Form8.Memo1.Lines.Add(ABarCode);
    end);
  end
  else
  begin
    FMX.Types.Log.d('OrangeUI TSunimiScanCodeBoardcastListener.onReceive no BarCode');
  end;

end;

destructor TSunimiScanCodeBoardcastListener.Destroy;
begin
  FMX.Types.Log.d('OrangeUI TSunimiScanCodeBoardcastListener.Destroy begin');
  Inherited;
  FMX.Types.Log.d('OrangeUI TSunimiScanCodeBoardcastListener.Destroy end');
end;
  {$ENDIF ANDROID}



{ TForm8 }

procedure TForm8.btnInitClick(Sender: TObject);
begin
  if Self.FSunmiFaceSDK.Init<>0 then
  begin
    Self.Memo1.Lines.Add('初始失败');
  end
  else
  begin
    Self.Memo1.Lines.Add('初始成功');
  end;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
  if Self.FSunmiFaceSDK.VerifyLicense<>0 then
  begin
    Self.Memo1.Lines.Add('检测授权失败');
  end
  else
  begin
    Self.Memo1.Lines.Add('检测授权成功');
  end;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
  //人脸识别
  Application.CreateForm(TCameraComponentForm, CameraComponentForm);
  CameraComponentForm.Show;
  CameraComponentForm.FSunmiFaceSDK:=FSunmiFaceSDK;
  CameraComponentForm.FSunmiFaceSDK.OnDetectedFace:=CameraComponentForm.DoDetectedFace;


end;

procedure TForm8.Button3Click(Sender: TObject);
var
  AListBoxItem:TListBoxItem;
  ADeleteButton:TButton;
begin
  if not FDConnection1.Connected then
  begin
    FDConnection1.LoginPrompt:=False;
    FDConnection1.DriverName:='SQLite';
    {$IFDEF ANDROID}
    FDConnection1.Params.Values['Database']:=GetExternalStorageDirectory
//              GetSDCardPath()
              +'/faceTest/sunmi_face.db';
    {$ENDIF ANDROID}
    FDConnection1.Connected:=True;
  end;
  Self.FDQuery1.SQL.Text:='SELECT * FROM SUNMI_FACE';
  FDQuery1.Open;

  Self.lbFaceList.Clear;
  Self.FDQuery1.First;
  while not Self.FDQuery1.Eof do
  begin
    lbFaceList.Items.Add(FDQuery1.FieldByName('Name').AsString);

    AListBoxItem:=Self.lbFaceList.ListItems[Self.lbFaceList.Count-1];
    AListBoxItem.StyleLookup:='ListBoxItem1Style1';
    ADeleteButton:=TButton(AListBoxItem.FindStyleResource('btnDelete'));
    ADeleteButton.TagObject:=AListBoxItem;
    ADeleteButton.OnClick:=DoDeleteItemButtonClick;


    Self.FDQuery1.Next;
  end;

end;

procedure TForm8.Button4Click(Sender: TObject);
begin
  //提取人脸特征
  Self.TakePhotoFromLibraryAction1.ExecuteTarget(Self.btnReg);

end;

procedure TForm8.DoDeleteItemButtonClick(Sender: Tobject);
var
  AListBoxItem:TListBoxItem;
begin
  AListBoxItem:=TListBoxItem(TButton(Sender).TagObject);
//  ShowMessage(AListBoxItem.Text);

  Self.FDQuery1.SQL.Text:='DELETE FROM SUNMI_FACE WHERE ID='+QuotedStr(AListBoxItem.Text);
  Self.FDQuery1.ExecSQL;

  FreeAndNil(AListBoxItem);
end;

procedure TForm8.btnConfigClick(Sender: TObject);
  {$IFDEF ANDROID}
var
  param:JSunmiFaceConfigParam;
  code:Integer;
  {$ENDIF}
begin
  {$IFDEF ANDROID}
  //SunmiFaceConfigParam param = new SunmiFaceConfigParam();
  //SunmiFaceSDK.getConfig(param);
  //param.setDistanceThreshold(0.9f); //当SDK应用于支付场景，推荐值是0.9；当应用于人证比对场景时，推荐值为1.1；阈值越小，SDK对于相同人的判定越严格
  //param.setYawThreshold(50.0f);//人脸姿态阈值，设置较小的人脸姿态阈值，阈值越小，人脸姿态要求越严格，保证相对正面的人脸姿态做识别
  //param.setPitchThreshold(50.0f);
  //param.setRollThreshold(50.0f);
  //param.setMinFaceSize(60);//最小人脸检测尺寸，较大较清晰的人脸识别较准确
  //param.setImageQualityThreshold(10);//阈值越高，人脸清晰度越好，人脸识别越准确
  //param.setMinLuminance(10);//最小光照
  //param.setMaxLuminance(180);//最大光照
  //param.setThreadNum(1); //使用一个cpu核心执行人脸检测，人脸识别
  //int code = SunmiFaceSDK.setConfig(param);


  param:=TJSunmiFaceConfigParam.JavaClass.init();
  TJSunmiFaceSDK.JavaClass.getConfig(param);
  param.setDistanceThreshold(0.9); //当SDK应用于支付场景，推荐值是0.9；当应用于人证比对场景时，推荐值为1.1；阈值越小，SDK对于相同人的判定越严格
  param.setYawThreshold(50.0);//人脸姿态阈值，设置较小的人脸姿态阈值，阈值越小，人脸姿态要求越严格，保证相对正面的人脸姿态做识别
  param.setPitchThreshold(50.0);
  param.setRollThreshold(50.0);
  param.setMinFaceSize(60);//最小人脸检测尺寸，较大较清晰的人脸识别较准确
  param.setImageQualityThreshold(10);//阈值越高，人脸清晰度越好，人脸识别越准确
  param.setMinLuminance(10);//最小光照
  param.setMaxLuminance(180);//最大光照
  param.setThreadNum(1); //使用一个cpu核心执行人脸检测，人脸识别
  code := TJSunmiFaceSDK.JavaClass.setConfig(param);

  Self.Memo1.Lines.Add('code:'+IntToStr(code));
  {$ENDIF}

end;

procedure TForm8.btnRegClick(Sender: TObject);
begin
  //提取人脸特征
  Self.TakePhotoFromCameraAction1.ExecuteTarget(Self.btnReg);
end;

procedure TForm8.FormCreate(Sender: TObject);
begin

  //申请权限
  {$IFDEF ANDROID}
  PermissionsService.RequestPermissions
      ([JStringToString(TJManifest_permission.JavaClass.CAMERA),
      //要有震动的权限
      JStringToString(TJManifest_permission.JavaClass.VIBRATE),
      JStringToString(TJManifest_permission.JavaClass.READ_PHONE_STATE),
//      JStringToString(TJManifest_permission.JavaClass.READ_PRIVILEGED_PHONE_STATE),
      JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE),
      JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE)
        ],
    procedure(const APermissions: TArray<string>;
    const AGrantResults: TArray<TPermissionStatus>)
    begin
    end);
  {$ENDIF}



  //扫码广播接收
  {$IFDEF ANDROID}
  FSunimiScanCodeBroadcastListener:=TSunimiScanCodeBoardcastListener.Create;
  FSunimiScanCodeBroadcastReceiver:=TJFMXBroadcastReceiver.JavaClass.init(FSunimiScanCodeBroadcastListener);

  FIntentFilter:=TJIntentFilter.JavaClass.init;
  FIntentFilter.addAction(StringToJString('com.sunmi.scanner.ACTION_DATA_CODE_RECEIVED'));

  SharedActivity.registerReceiver(FSunimiScanCodeBroadcastReceiver, FIntentFilter);
  {$ENDIF ANDROID}


  FSunmiFaceSDK:=TSunmiFaceSDK.Create;

end;

procedure TForm8.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  FMX.Types.Log.d('OrangeUI TForm8.TakePhotoFromCameraAction1DidFinishTaking Begin');
  FreeAndNil(FImage);

  FImage:=TBitmap.Create;
  FImage.Assign(Image);

  //开始注册人脸
  TThread.Synchronize(nil,procedure
  begin
    tmrRegFace.Enabled:=True;
  end);
end;

procedure TForm8.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  FMX.Types.Log.d('OrangeUI TForm8.TakePhotoFromLibraryAction1DidFinishTaking Begin');
  FreeAndNil(FImage);

  FImage:=TBitmap.Create;
  FImage.Assign(Image);

  //开始注册人脸
  TThread.Synchronize(nil,procedure
  begin
    tmrRegFace.Enabled:=True;
  end);

end;

procedure TForm8.tmrRegFaceTimer(Sender: TObject);
begin
  tmrRegFace.Enabled:=False;
  Self.FSunmiFaceSDK.RegisterFace(FImage,Self.edtName.Text,Self.edtName.Text);

end;

end.
