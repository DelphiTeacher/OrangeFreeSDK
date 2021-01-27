//convert pas to utf8 by ¥
unit ServerMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  DateUtils,

  MzyszYxcsSz_Unit,
  MzsfYxcsSz_Unit,

  uOpenClientCommon,
  IdHTTPWebBrokerBridge, Web.HTTPApp,

  uOpenPlatformServerManager,

  IdGlobal,
  uBaseLog,
  XSuperObject,
  uBaseDBHelper,
  uUniDBHelper,
  uLang,
  uFileCommon,

  uDataBaseConfig,
  DataBaseConfigForm,

  ServerDataBaseModule,

  kbmMWUniDAC,
  kbmMWCustomConnectionPool,
  Generics.Collections,

  kbmMWCustomTransport,
  kbmMWServer,
  kbmMWAJAXTransStream,
  kbmMWTCPIPIndyServerTransport,
  kbmMWCustomHTTPService,
  kbmMWCustomLoadBalancingService,
  kbmMWFilePool,
  kbmMWSecurity,
  kbmMWCrypt,
//  kbmMWHTTPSYSServerTransport,

  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmServerMain = class(TForm)
    btnStartServer: TButton;
    edtPort: TEdit;
    Label1: TLabel;
    btnStopService: TButton;
    timerCopySQL: TTimer;
    btnDBConfig: TButton;
    tmrStartServer: TTimer;
    edtSSLPort: TEdit;
    Label2: TLabel;
    pnlToolBar: TPanel;
    pcClient: TPageControl;
    tsPerformance: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblSumCallCount: TLabel;
    lblMaxCallCountPerSecond: TLabel;
    lblInvalidCallCount: TLabel;
    tmrSyncUI: TTimer;
    btnChargeSetting: TButton;
    procedure btnStartServerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnStopServiceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure timerCopySQLTimer(Sender: TObject);
    procedure btnDBConfigClick(Sender: TObject);
    procedure tmrStartServerTimer(Sender: TObject);
    procedure tmrSyncUITimer(Sender: TObject);
    procedure btnChargeSettingClick(Sender: TObject);
  private
    FDBHelper:TBaseDBHelper;


    //上次总调用数
    LastSumCallCount:Integer;
    //最高每秒并发
    MaxParallelCallCountPerSecond:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;





var
  frmServerMain: TfrmServerMain;
  copySqlTime:TDateTime;

//procedure DoDBHelperLog(Sender: TObject; E: Exception; const ALog: String);

implementation

{$R *.dfm}

//procedure DoDBHelperLog(Sender: TObject; E: Exception; const ALog: String);
//begin
//  //记录出错日志
//  uBaseLog.HandleException(E, 'Main', 'MainForm', 'Query', ALog);
//end;

{ TfrmAlipayServerMain }

procedure TfrmServerMain.btnChargeSettingClick(Sender: TObject);
begin
  //收费参数配置
//  StartFrmMzyszYxcsSz;
  StartFrmMzsfYxcsSz;
end;

procedure TfrmServerMain.btnDBConfigClick(Sender: TObject);
var
  frmDataBaseConfig: TfrmDataBaseConfig;
  ASettingKbmMWServiceModule:TKbmMWServiceModule;
  AKbmMWServiceModule:TKbmMWServiceModule;
  I: Integer;
begin
  Self.tmrStartServer.Enabled:=False;




  //寻找是否存在需要配置数据库的服务模块
  ASettingKbmMWServiceModule:=nil;
  for I := 0 to GlobalServiceProject.ServiceModuleList.Count-1 do
  begin
    if (GlobalServiceProject.ServiceModuleList[I] is TKbmMWServiceModule)
      and (not TKbmMWServiceModule(GlobalServiceProject.ServiceModuleList[I]).DBModule.DBConfig.IsEmpty) then
    begin
      ASettingKbmMWServiceModule:=TKbmMWServiceModule(GlobalServiceProject.ServiceModuleList[I]);
      Break;
    end;
  end;
  if ASettingKbmMWServiceModule=nil then
  begin
    ShowMessage('找不到需要配置的服务模块!');
    Exit;
  end;





  //弹出配置数据库的窗体
  frmDataBaseConfig:=TfrmDataBaseConfig.Create(Application);
  frmDataBaseConfig.Init(//ASettingKbmMWServiceModule.DBModule.DBHelper,
                         FDBHelper,
                         ASettingKbmMWServiceModule.DBModule.DBConfig,
                         ASettingKbmMWServiceModule.DBModule.DBConfigFileName
                          );
//  frmDataBaseConfig.edtDBDataBaseName.Visible:=False;
//  frmDataBaseConfig.Label5.Visible:=False;


  if frmDataBaseConfig.ShowModal=mrOK then
  begin
      //所有服务模板的数据库配置文件也都改过来
      for I := 0 to GlobalServiceProject.ServiceModuleList.Count-1 do
      begin
        if GlobalServiceProject.ServiceModuleList[I] is TKbmMWServiceModule then
        begin
          AKbmMWServiceModule:=TKbmMWServiceModule(GlobalServiceProject.ServiceModuleList[I]);

          if not AKbmMWServiceModule.DBModule.DBConfig.IsEmpty then
          begin
              AKbmMWServiceModule.DBModule.DBConfig.FDBType:=
                    ASettingKbmMWServiceModule.DBModule.DBConfig.FDBType;
              AKbmMWServiceModule.DBModule.DBConfig.FDBHostName:=
                    ASettingKbmMWServiceModule.DBModule.DBConfig.FDBHostName;
              AKbmMWServiceModule.DBModule.DBConfig.FDBHostPort:=
                    ASettingKbmMWServiceModule.DBModule.DBConfig.FDBHostPort;
              AKbmMWServiceModule.DBModule.DBConfig.FDBUserName:=
                    ASettingKbmMWServiceModule.DBModule.DBConfig.FDBUserName;
              AKbmMWServiceModule.DBModule.DBConfig.FDBPassword:=
                    ASettingKbmMWServiceModule.DBModule.DBConfig.FDBPassword;
              AKbmMWServiceModule.DBModule.DBConfig.FDBDataBaseName:=
                    ASettingKbmMWServiceModule.DBModule.DBConfig.FDBDataBaseName;
              //保存到配置文件中
              AKbmMWServiceModule.DBModule.DBConfig.Save(AKbmMWServiceModule.DBModule.DBConfigFileName);
          end;
        end;
      end;

      ShowMessage('重新启动服务端后生效!');
  end;


end;

procedure TfrmServerMain.btnStartServerClick(Sender: TObject);
begin

  if IsNeedLoadServiceProjectFromIni then
  begin
    GlobalServiceProject.Port := StrToInt(Self.edtPort.Text);
    GlobalServiceProject.SSLPort := StrToInt(Self.edtSSLPort.Text);
    GlobalServiceProject.Save;
  end;

  if not GlobalServiceProject.Start then Exit;



  copySqlTime:=0;
  Self.timerCopySQL.Enabled:=True;



  Self.Caption := Trans(GlobalServiceProject.Name + '服务端' + ' ' + '启动成功');
  Self.btnStartServer.Enabled := False;

end;

procedure TfrmServerMain.btnStopServiceClick(Sender: TObject);
begin
  GlobalServiceProject.Stop;

  Self.Caption := Trans(GlobalServiceProject.Name + '服务端');
  Self.btnStartServer.Enabled := True;


end;

procedure TfrmServerMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  GlobalServiceProject.Stop;
//  FreeAndNil(GlobalServiceProject);
//  FreeAndNil(GlobalServiceProject);
end;

procedure TfrmServerMain.FormShow(Sender: TObject);
begin

  FDBHelper:=TUniDBHelper.Create;


  if IsNeedLoadServiceProjectFromIni then
  begin
    GlobalServiceProject.Load;
  end;



  Self.Caption:=GlobalServiceProject.Name;
  Self.edtPort.Text:=IntToStr(GlobalServiceProject.Port);
  Self.edtSSLPort.Text:=IntToStr(GlobalServiceProject.SSLPort);

  //测试备份
  timerCopySQLTimer(nil);
end;

procedure TfrmServerMain.timerCopySQLTimer(Sender: TObject);
var
  findSqlBat:PAnsiChar;     //数据库备份脚本路径
  findPicBat:PAnsiChar;     //图片数据备份脚本路径
  defaultShow:Integer;   //脚本执行窗口显示方式
  AFilePath:String;
  AIndex:Integer;
begin
  //取当前运行的exe目录 ExtractFilePath(Application.ExeName)
  findSqlBat:=PAnsiChar(AnsiString(ExtractFilePath(Application.ExeName)+'back_db.bat'));
  //定时打包指定文件夹的bat放在和exe同级目录 其中取前一天时间的方法会 提示没权限
  //暂时先放上一级目录
  AFilePath:=ExtractFilePath(Application.ExeName);
  AIndex:=AFilePath.IndexOf('Win32');
  AFilePath:=AFilePath.Substring(0,AIndex+5);
  findPicBat:=PAnsiChar(AnsiString(AFilePath+'\pic_data_zip.bat')); //PathDelim

  defaultShow:=SW_SHOW;

  //判断是否0点
  if (HourOf(Now)>-1) and (HourOf(Now)<1) then
  begin
    //距离上次执行时间是超过1天
    if (Now-copySqlTime)>=1 then
    begin
      WinExec(pAnsiChar(findSqlBat),defaultShow);
      WinExec(pAnsiChar(findPicBat),defaultShow);
      copySqlTime:=Now;
    end

  end;
end;

procedure TfrmServerMain.tmrStartServerTimer(Sender: TObject);
begin
  Self.tmrStartServer.Enabled:=False;

  //自动启动
  btnStartServerClick(Sender);

end;

procedure TfrmServerMain.tmrSyncUITimer(Sender: TObject);
begin
//    //上次总调用数
//    LastSumCallCount:Integer;
//    //最高每秒并发
//    MaxParallelCallCountPerSecond:Integer;


  Self.lblSumCallCount.Caption:=IntToStr(GlobalServiceProject.SumCallCount);

  if GlobalServiceProject.SumCallCount-LastSumCallCount>MaxParallelCallCountPerSecond then
  begin
    MaxParallelCallCountPerSecond:=GlobalServiceProject.SumCallCount-LastSumCallCount;
  end;
  Self.lblMaxCallCountPerSecond.Caption:=IntToStr(MaxParallelCallCountPerSecond);
  LastSumCallCount:=GlobalServiceProject.SumCallCount;
  Self.lblInvalidCallCount.Caption:=IntToStr(GlobalServiceProject.InvalidCallCount);

end;




end.
