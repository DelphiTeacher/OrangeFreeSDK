//convert pas to utf8 by ¥
unit ServerMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  DateUtils,

  uOpenPlatformServerManager,
  {$IFDEF HAS_REDIS}
  uRedisClientPool,
  {$ENDIF}

  IdGlobal,
  uBaseLog,
  XSuperObject,
  uBaseDBHelper,
  uUniDBHelper,
  uLang,
  uFileCommon,
  IniFiles,

  uDataBaseConfig,
  DataBaseConfigForm,

  ServerDataBaseModule,
  uBaseDataBaseModule,
  uRestInterfaceCall,

//  kbmMWUniDAC,
//  kbmMWCustomConnectionPool,
//  Generics.Collections,
//
//  kbmMWCustomTransport,
//  kbmMWServer,
//  kbmMWAJAXTransStream,
//  kbmMWTCPIPIndyServerTransport,
//  kbmMWCustomHTTPService,
//  kbmMWCustomLoadBalancingService,
//  kbmMWFilePool,
//  kbmMWSecurity,
//  kbmMWCrypt,

  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids;

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
    tsLog: TTabSheet;
    memLog: TMemo;
    tsDatabasePool: TTabSheet;
    gridDatabasePool: TStringGrid;
    Label6: TLabel;
    lblRedisPoolCount: TLabel;
    tsAuth: TTabSheet;
    Label7: TLabel;
    edtCompanyName: TEdit;
    btnQueryAuth: TButton;
    Label8: TLabel;
    cmbApps: TComboBox;
    btnSaveAuth: TButton;
    Label9: TLabel;
    edtAppID: TEdit;
    procedure btnStartServerClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnStopServiceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure timerCopySQLTimer(Sender: TObject);
    procedure btnDBConfigClick(Sender: TObject);
    procedure tmrStartServerTimer(Sender: TObject);
    procedure tmrSyncUITimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure memLogDblClick(Sender: TObject);
    procedure btnQueryAuthClick(Sender: TObject);
    procedure btnSaveAuthClick(Sender: TObject);
    procedure cmbAppsChange(Sender: TObject);
  private
    //测试数据库配置是否正常
    FDBHelper:TBaseDBHelper;

    //上次总调用数
    LastSumCallCount:Integer;
    //最高每秒并发
    MaxParallelCallCountPerSecond:Integer;

    procedure DoServiceStartEnd(Sender:TObject;AIsStartSucc:Boolean;AError:String);

  public

    FIsAddLogToMemo:Boolean;
    FHideLogList:TStringList;

    procedure DoGetCommandLineOutput(ACommandLine:String;ATag:String;AOutput:String);
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


  frmDataBaseConfig.edtDBDataBaseName.Visible:=GlobalServiceProject.IsNeedOneDatabase;


  frmDataBaseConfig.Label5.Visible:=False;


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

              if GlobalServiceProject.IsNeedOneDatabase then
              begin
              AKbmMWServiceModule.DBModule.DBConfig.FDBDataBaseName:=
                    ASettingKbmMWServiceModule.DBModule.DBConfig.FDBDataBaseName;
              end;

              //保存到配置文件中
              AKbmMWServiceModule.DBModule.DBConfig.Save(AKbmMWServiceModule.DBModule.DBConfigFileName);
          end;
        end;
      end;
  end;


end;

procedure TfrmServerMain.btnQueryAuthClick(Sender: TObject);
var
  ACode:Integer;
  ADesc:String;
  ADataJson:ISuperObject;

  AAppJson:ISuperObject;
  I: Integer;
begin
  //从OrangeUI云服务器查询公司授权
  if not SimpleCallAPI('get_app_list',
                nil,
                'http://www.orangeui.cn:10020/'+'program_framework/',
//                'http://127.0.0.1:10020/'+'program_framework/',
                ['company_name',
                'pageindex','pagesize'],
                [Self.edtCompanyName.Text,
                1,
                MaxInt
                ],
                ACode,
                ADesc,
                ADataJson,
                GlobalRestAPISignType,
                GlobalRestAPIAppSecret
                ) then
  begin
    ShowMessage(ADesc);
    Exit;
  end;
//  if ADataJson.A['RecordList'].Length>1 then
//  begin
//    ShowMessage('有多个授权');
//    Exit;
//  end;
//  if ADataJson.A['RecordList'].Length=1 then
//  begin
//    AAppJson:=ADataJson.A['RecordList'].O[0];
//    ShowMessage('授权应用名称'+AAppJson.S['name']+#13#10
//                '授权应用ID'+IntToStr(AAppJson.I['appid']));
//
//  end;
  Self.cmbApps.Items.Clear;
  for I := 0 to ADataJson.A['RecordList'].Length-1 do
  begin
    AAppJson:=ADataJson.A['RecordList'].O[I];
    Self.cmbApps.Items.Add(AAppJson.S['name']+'-'+IntToStr(AAppJson.I['fid']));
  end;
//  Self.cmbApps.ItemIndex:=-1;
//  Self.edtAppID.Text:='';

end;

procedure TfrmServerMain.btnStartServerClick(Sender: TObject);
begin

  if IsNeedLoadServiceProjectFromIni then
  begin
      GlobalServiceProject.Port := StrToInt(Self.edtPort.Text);
      GlobalServiceProject.SSLPort := StrToInt(Self.edtSSLPort.Text);
      GlobalServiceProject.Save;
  end;

//  if not GlobalServiceProject.Start then Exit;
  GlobalServiceProject.Start;

  Self.Caption := Trans(GlobalServiceProject.Name + '云服务' + ' ' + '正在启动...');
  Self.btnStartServer.Enabled := False;

end;

procedure TfrmServerMain.btnStopServiceClick(Sender: TObject);
begin

  tmrSyncUI.Enabled:=False;

  Self.Caption := Trans(GlobalServiceProject.Name + '云服务');
  Self.btnStartServer.Enabled := True;


  GlobalServiceProject.Stop;
end;

procedure TfrmServerMain.cmbAppsChange(Sender: TObject);
begin
  //更换AppID
  if Pos('-',Self.cmbApps.Text)>0 then
  begin
    Self.edtAppID.Text:=Copy(Self.cmbApps.Text,Pos('-',Self.cmbApps.Text)+1,MaxInt);
  end;

end;

procedure TfrmServerMain.btnSaveAuthClick(Sender: TObject);
var
  AIniFile:TIniFile;
begin
  //保存到配置文件
  if (Self.cmbApps.Text<>'') and (Pos(Self.edtAppID.Text,Self.cmbApps.Text)=0) then
  begin
    ShowMessage('请选择核对应用名称和应用ID');
    Exit;
  end;



  //从配置中获取应用ID,也就是AppID
  if FileExists(GetApplicationPath+'Config.ini') then
  begin
    AIniFile:=TIniFile.Create(GetApplicationPath+'Config.ini');
    try
      AIniFile.WriteString('','AppID',Self.edtAppID.Text);
      AIniFile.WriteString('','AppName',Self.cmbApps.Text);
      AIniFile.WriteString('','CompanyName',Self.edtCompanyName.Text);
    finally
      FreeAndNil(AIniFile);
    end;
  end;


  ShowMessage('重启服务后生效！');

end;

procedure TfrmServerMain.DoGetCommandLineOutput(ACommandLine, ATag,
  AOutput: String);
var
  ALogList:TStrings;
begin
  uBaseLog.HandleException(nil,AOutput);

  if Self.FIsAddLogToMemo then
  begin
      ALogList:=Self.memLog.Lines;

      TThread.Synchronize(nil,procedure
      begin
      //    memLog.Text:=memLog.Text+AOutput;
          if ATag<>'' then
          begin
            ALogList.Add(ATag+':'+AOutput);
          end
          else
          begin
            ALogList.Add(AOutput);
          end;
      end);
  end
  else
  begin
      ALogList:=Self.FHideLogList;
      if ATag<>'' then
      begin
        ALogList.Add(ATag+':'+AOutput);
      end
      else
      begin
        ALogList.Add(AOutput);
      end;
  end;


end;

procedure TfrmServerMain.DoServiceStartEnd(Sender: TObject;
  AIsStartSucc: Boolean; AError: String);
begin

  TThread.Synchronize(nil,procedure
  begin
      if AIsStartSucc then
      begin
          Self.Caption := GlobalServiceProject.Name + '云服务' + ' ' + '启动成功';
          Self.btnStartServer.Enabled := False;
          Self.memLog.Lines.Add('云服务' + ' ' + '启动成功');



          copySqlTime:=0;
          Self.timerCopySQL.Enabled:=True;
      end
      else
      begin
          Self.memLog.Lines.Add('云服务' + ' ' + '启动失败：'+AError);
      end;
  end);

end;

procedure TfrmServerMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GlobalServiceProject.Stop;
  FreeAndNil(GlobalServiceProject);

  FreeAndNil(FHideLogList);
  FreeAndNil(FDBHelper);
end;

procedure TfrmServerMain.FormCreate(Sender: TObject);
var
  AIniFile:TIniFile;
begin

  FDBHelper:=TUniDBHelper.Create;


  GlobalServiceProject.FOnGetCommandLineOutput:=Self.DoGetCommandLineOutput;
  GlobalServiceProject.FOnStartEnd:=Self.DoServiceStartEnd;

  if IsNeedLoadServiceProjectFromIni then
  begin
    GlobalServiceProject.Load;

    //读取授权
    AIniFile:=TIniFile.Create(GetApplicationPath+'Config.ini');
    try
      Self.edtCompanyName.Text:=AIniFile.ReadString('','CompanyName','');
      Self.cmbApps.Text:=AIniFile.ReadString('','AppName','');
      Self.edtAppID.Text:=AIniFile.ReadString('','AppID','');
    finally
      FreeAndNil(AIniFile);
    end;

  end;


  Self.Caption:=Trans(GlobalServiceProject.Name + '云服务');
  Self.edtPort.Text:=IntToStr(GlobalServiceProject.Port);
  Self.edtSSLPort.Text:=IntToStr(GlobalServiceProject.SSLPort);


  FIsAddLogToMemo:=True;
  FHideLogList:=TStringList.Create;

end;

procedure TfrmServerMain.FormShow(Sender: TObject);
begin

  //测试备份
  timerCopySQLTimer(nil);
end;

procedure TfrmServerMain.memLogDblClick(Sender: TObject);
begin

  FIsAddLogToMemo:=not FIsAddLogToMemo;
  if FIsAddLogToMemo then
  begin
    Self.memLog.Lines.AddStrings(Self.FHideLogList);
    FHideLogList.Clear;
  end;

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
var
  I: Integer;
  ASumCurCount:Integer;
  AServiceModule:TServiceModule;
  ADatabaseModuleStatus:TDatabaseModuleStatus;
begin
  Exit;
//    //上次总调用数
//    LastSumCallCount:Integer;
//    //最高每秒并发
//    MaxParallelCallCountPerSecond:Integer;

  //刷新服务端界面状态


  Self.lblSumCallCount.Caption:=IntToStr(GlobalServiceProject.SumCallCount);

  if GlobalServiceProject.SumCallCount-LastSumCallCount>MaxParallelCallCountPerSecond then
  begin
    MaxParallelCallCountPerSecond:=GlobalServiceProject.SumCallCount-LastSumCallCount;
  end;
  Self.lblMaxCallCountPerSecond.Caption:=IntToStr(MaxParallelCallCountPerSecond);
  LastSumCallCount:=GlobalServiceProject.SumCallCount;
  Self.lblInvalidCallCount.Caption:=IntToStr(GlobalServiceProject.InvalidCallCount);
  {$IFDEF HAS_REDIS}
  //Redis缓存池
  Self.lblRedisPoolCount.Caption:=IntToStr(GetGlobalRedisClientPool.FCustomObjects.Count);
  {$ENDIF}



  ASumCurCount:=0;
  Self.gridDatabasePool.RowCount:=GlobalServiceProject.ServiceModuleList.Count+2;
  Self.gridDatabasePool.ColCount:=9;

  Self.gridDatabasePool.Cells[0,0]:='模块名';
  Self.gridDatabasePool.Cells[1,0]:='最大数';
  Self.gridDatabasePool.Cells[2,0]:='当前数';
  Self.gridDatabasePool.Cells[3,0]:='使用次数';
  Self.gridDatabasePool.Cells[4,0]:='归还次数';
  Self.gridDatabasePool.Cells[5,0]:='检测连接状态次数';
  Self.gridDatabasePool.Cells[6,0]:='连接成功次数';
  Self.gridDatabasePool.Cells[7,0]:='连接断开次数';
  Self.gridDatabasePool.Cells[8,0]:='重连成功次数';
  //先将数据库模块显示出来
  for I := 0 to GlobalServiceProject.ServiceModuleList.Count-1 do
  begin
    AServiceModule:=TServiceModule(GlobalServiceProject.ServiceModuleList[I]);

    Self.gridDatabasePool.Cells[0,I+1]:=AServiceModule.Name;
    if AServiceModule is TKbmMWServiceModule then
    begin
      ADatabaseModuleStatus:=TKbmMWServiceModule(AServiceModule).DBModule.GetStatus;
      Self.gridDatabasePool.Cells[1,I+1]:=IntToStr(ADatabaseModuleStatus.MaxCount);
      Self.gridDatabasePool.Cells[2,I+1]:=IntToStr(ADatabaseModuleStatus.CurCount);
      ASumCurCount:=ASumCurCount+ADatabaseModuleStatus.CurCount;

      Self.gridDatabasePool.Cells[3,I+1]:=IntToStr(ADatabaseModuleStatus.LockTimes);
      Self.gridDatabasePool.Cells[4,I+1]:=IntToStr(ADatabaseModuleStatus.UnlockTimes);
      Self.gridDatabasePool.Cells[5,I+1]:=IntToStr(ADatabaseModuleStatus.CheckConnectTimes);
      Self.gridDatabasePool.Cells[6,I+1]:=IntToStr(ADatabaseModuleStatus.ConnectedTimes);
      Self.gridDatabasePool.Cells[7,I+1]:=IntToStr(ADatabaseModuleStatus.DisconnectedTimes);
      Self.gridDatabasePool.Cells[8,I+1]:=IntToStr(ADatabaseModuleStatus.ReConnectedTimes);
    end;


  end;

  //汇总
  Self.gridDatabasePool.Cells[0,I+1]:='汇总';
  Self.gridDatabasePool.Cells[2,I+1]:=IntToStr(ASumCurCount);

end;




end.
