//convert pas to utf8 by ¥
unit UpdateFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms,


  uFileCommon,
//  SysUtils,

  uSkinMaterial,
  HintFrame,
  WaitingFrame,
  MessageBoxFrame,

  uTimerTask,
  uUIFunction,

  XSuperObject,
  XSuperJson,

  uBaseHttpControl,
//  MessageBoxFrame,

  {$IFDEF ANDROID}
  Androidapi.JNI.os,
  Androidapi.JNI.Provider,
  Androidapi.Helpers,
  {$ENDIF}


  IdURI,
  StrUtils,

  Math,
  System.IOUtils,
  uMobileUtils,
  uVersionChecker,


  FMX.Dialogs, FMX.StdCtrls, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
  FMX.Edit, uSkinFireMonkeyEdit, uSkinFireMonkeyImage, uSkinFireMonkeyLabel,
  uSkinFireMonkeyButton, uSkinFireMonkeyCheckBox, uSkinFireMonkeyProgressBar,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  FMX.Objects, uSkinProgressBarType, uSkinLabelType, uSkinPanelType,
  uBaseSkinControl;


//const
//  OK_CANCEL_CAPTIONS:array [0..1] of String=('取消','确定');
//  OK_CANCEL_NAMES:array [0..1] of String=('cancel','ok');



type
  TFrameUpdate = class(TFrame)
    idhttpDownload: TIdHTTP;
    tmrSyncDownloadProgress: TTimer;
    BackRectangle: TRectangle;
    pnlMessageBox: TSkinFMXPanel;
    pnlTop: TSkinFMXPanel;
    lblType: TSkinFMXLabel;
    pnlContent: TSkinFMXPanel;
    lblCaption: TSkinFMXLabel;
    pnlTopDevide: TSkinFMXPanel;
    pnlBottomDevide: TSkinFMXPanel;
    pbDownloading: TSkinFMXProgressBar;
    procedure tmrSyncDownloadProgressTimer(Sender: TObject);
    procedure idhttpDownloadWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure idhttpDownloadWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
  private
    //下载状态
    FIsDownloadSucc:Boolean;
    FIsDownloadCompleted:Boolean;
    FDownloadErrorMsg:String;
    FDownloadedFileSize:Int64;
    FNeedDownloadFileSize:Int64;


    FAppDownloadUrl:String;
    FAppLocalFilePath:String;

    procedure DoDownloadApp(ATimerTask:TObject);
    procedure DoDownloadAppExecuteEnd(ATimerTask:TObject);


    //执行升级
    procedure DoUpdateApp;
    //执行安装
    procedure DoInstallApp;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    procedure UpdateApp(AppDownloadUrl:String;AppLocalFilePath:String);
    { Public declarations }
  end;






var
  GlobalUpdateFrame:TFrameUpdate;

//安装包(Android下得有Install package的权限)
function InstallAppPackage(Path:String):Boolean;

implementation


{$R *.fmx}


function InstallAppPackage(Path:String):Boolean;
var
  haveInstallPermission:Boolean;
begin
  {$IFDEF ANDROID}
  if (TJBuild_VERSION.JavaClass.SDK_INT >= 26) then
  begin
    //兼容8.0安装未知来源的权限
    //判断权限
    //getPackageManager().canRequestPackageInstalls();
    haveInstallPermission:=TAndroidHelper.Context.getPackageManager.canRequestPackageInstalls;
    if haveInstallPermission then
    begin
        FMX.Types.Log.d('OrangeUI InstallAppPackage 已经拥有安装未知来源应用的权限');
        //8.0手机已经拥有安装未知来源应用的权限，直接安装！
        Result:=DoAndroidInstallAppPackage(Path);
    end
    else
    begin
        //安装应用需要打开安装未知来源应用权限，请去设置中开启权限
        //Uri packageUri = Uri.parse("package:"+ AppUtils.getAppPackageName());
        //Intent intent = new Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES,packageUri);
        //startActivityForResult(intent,10086);
        FMX.Types.Log.d('OrangeUI InstallAppPackage 安装应用需要打开安装未知来源应用权限');

        ShowMessageBoxFrame(Application.MainForm,
                            '安装应用需要打开安装未知来源应用权限，请去设置中开启权限',
                            '',
                            TMsgDlgType.mtInformation,
                            OK_CANCEL_CAPTIONS,
                            nil,nil,'',[],nil,0,nil,
                              procedure(Sender:TObject;
                                        AModalResult:String;
                                        AModalResultName:String;
                                        AInputEditText1:String;
                                        AInputEditText2:String)
                              begin
                                if AModalResult='确定' then
                                begin
                                  FInstallAPKPath:=Path;
                                  JumpToAndroidSettingPage(JStringToString(TJSettings.JavaClass.ACTION_MANAGE_UNKNOWN_APP_SOURCES),
                                                          Const_ResultCode_JumpToAndroidSettingPage_ForInstallAPK);
                                end;
                              end

                            );
    end;
  end
  else
  begin
    Result:=DoAndroidInstallAppPackage(Path);
  end;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  //需要其他EXE来辅助
  {$ENDIF}
end;




{ TFrameUpdate }

constructor TFrameUpdate.Create(AOwner: TComponent);
begin
  inherited;

  //设置主题颜色
  lblType.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.Color:=SkinThemeColor;
  pnlTopDevide.SelfOwnMaterialToDefault.BackColor.FillColor.Color:=SkinThemeColor;


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

destructor TFrameUpdate.Destroy;
begin
  inherited;
end;

procedure TFrameUpdate.DoDownloadApp(ATimerTask: TObject);
var
  AppLocalFileStream:TFileStream;
begin

  AppLocalFileStream:=TFileStream.Create(TTimerTask(ATimerTask).TaskOtherInfo[1],fmCreate or fmOpenWrite);
  try
    try
      Self.idhttpDownload.Get(TTimerTask(ATimerTask).TaskOtherInfo[0],AppLocalFileStream);
      FIsDownloadSucc:=True;
    except
      on E:Exception do
      begin
        //下载出错
        FDownloadErrorMsg:=E.Message;
      end;
    end;
  finally
    FIsDownloadCompleted:=True;
    AppLocalFileStream.Free;
    Self.tmrSyncDownloadProgress.Enabled:=False;
  end;
end;

procedure TFrameUpdate.DoDownloadAppExecuteEnd(ATimerTask: TObject);
begin

//  //下载结束,更新也结束了,可以继续检查更新了
//  if GlobalVersionChecker<>nil then
//  begin
//    GlobalVersionChecker.FIsCheckingNewVersion:=False;
//  end;



  if not FIsDownloadSucc then
  begin
      //下载失败
      lblCaption.Caption:='下载失败('+Self.FDownloadErrorMsg+')';
      ShowHintFrame(nil,'下载失败('+Self.FDownloadErrorMsg+')');


  //    Sleep(1000);
      HideFrame(Self);//(Self,hfcttNone);
      //不需要返回
//      ReturnFrame(FrameHistroy);

  end
  else
  begin
      //下载成功,安装
      pbDownloading.Properties.Position:=100;
      lblCaption.Caption:='下载成功,开始安装...';
      ShowHintFrame(nil,'下载成功,开始安装...');


  //    Sleep(1000);
      //必须要传Self
      HideFrame(Self);//(Self,hfcttNone);
      //不需要返回
//      ReturnFrame(FrameHistroy);


      Self.DoInstallApp;
  end;

end;

procedure TFrameUpdate.DoInstallApp;
begin
  InstallAppPackage(Self.FAppLocalFilePath);
end;

procedure TFrameUpdate.DoUpdateApp;
var
  ATimerTask:TTimerTask;
begin
//  if FDownloadAppThread=nil then
//  begin
//    //立即启动
//    FDownloadAppThread:=TTimerThread.Create(False);
//  end;


  FIsDownloadSucc:=False;
  FIsDownloadCompleted:=False;
  FDownloadErrorMsg:='';

  FDownloadedFileSize:=0;
  FNeedDownloadFileSize:=0;

  pbDownloading.Properties.Position:=0;
  lblCaption.Caption:='正在下载，请稍候...';
  tmrSyncDownloadProgress.Enabled:=True;


  ATimerTask:=TTimerTask.Create();
  ATimerTask.OnExecute:=DoDownloadApp;
  ATimerTask.OnExecuteEnd:=DoDownloadAppExecuteEnd;
  ATimerTask.TaskOtherInfo.Add(FAppDownloadUrl);
  ATimerTask.TaskOtherInfo.Add(FAppLocalFilePath);

  GetGlobalTimerThread.RunTask(ATimerTask,True);

end;

procedure TFrameUpdate.idhttpDownloadWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  FDownloadedFileSize:=AWorkCount;
end;

procedure TFrameUpdate.idhttpDownloadWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  FDownloadedFileSize:=0;
  FNeedDownloadFileSize:=AWorkCountMax;
end;

procedure TFrameUpdate.tmrSyncDownloadProgressTimer(Sender: TObject);
begin
  if FNeedDownloadFileSize>0 then
  begin
    pbDownloading.Properties.Position:=Ceil(FDownloadedFileSize/FNeedDownloadFileSize*100);
  end
  else
  begin
    pbDownloading.Properties.Position:=0;
  end;
end;

procedure TFrameUpdate.UpdateApp(AppDownloadUrl:String;AppLocalFilePath:String);
begin
  FAppDownloadUrl:=AppDownloadUrl;
  FAppLocalFilePath:=AppLocalFilePath;

  DoUpdateApp;
end;




end.
