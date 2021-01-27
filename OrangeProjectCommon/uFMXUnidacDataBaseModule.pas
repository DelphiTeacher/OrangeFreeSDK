unit uFMXUnidacDataBaseModule;

interface
{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}



//���ڹ����·���FrameWork.inc
//�����ڹ�������������FMX����ָ��
//�ſ�����������˵�Ԫ
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}



uses
  System.SysUtils,
  System.Classes,

//  Vcl.Controls,
//  Vcl.StdCtrls,
//  Vcl.ExtCtrls,
  uLang,
  {$IFDEF FMX}
  FMX.Types,
  {$ENDIF}
  {$IFDEF VCL}
  ExtCtrls,
  {$ENDIF}
//  StdCtrls,

//  Forms,
  uBaseLog,
//  XSuperObject,
  uBaseDBHelper,
  uUniDBHelper,
  uBaseList,
  uFileCommon,
  Generics.Collections,

  uUniDBHelperPool,
  uDataBaseConfig,
  uBaseDataBaseModule,
//  DataBaseConfigForm,
//  uTableCommonRestCenter,

  UniProvider, Data.DB, DBAccess, Uni,
  //kbmMWUniDAC,
//  kbmMWCustomSQLMetaData, kbmMWMSSQLMetaData,
  //kbmMWCustomConnectionPool,
  MySQLUniProvider,
  SQLServerUniProvider;




type
  //FireMonkeyƽ̨��Unidac���ݿ����ģ��
  TFMXUnidacDatabaseModule = class(TBaseDatabaseModule)
  private
//    tmrActiveMySQLPoolConnection: TTimer;
    FActiveMySQLPoolConnectionThread:TActiveMySQLPoolConnectionThread;
    procedure tmrActiveMySQLPoolConnectionTimer(Sender: TObject);override;
  public
    //�Ƿ����������ݿ�,�����ظ�����
    IsStarted:Boolean;
//               TObjectPool
  public
    constructor Create; override;
    destructor Destroy; override;
  public
    //�ڷ���������ʱ��,���������,ȷ�����ݿ������ӳɹ�
    //׼������
    function DoPrepareStart(var AError:String): Boolean;override;
    //׼��ֹͣ
    function DoPrepareStop: Boolean;override;

//    //�������ݿ������ļ�
//    procedure SaveDBConfigFile();
  public
//    function GetDBHelperFromPool(var ASQLDBHelper:TUniDBHelper;var ADesc:String):Boolean;overload;
//    function GetDBHelperFromPool(var ASQLDBHelper:TBaseDBHelper;var ADesc:String):Boolean;overload;
//    procedure FreeDBHelperToPool(ASQLDBHelper:TBaseDBHelper);
//  public
//    //���ݿ������ļ���
//    property DBConfigFileName: String read FDBConfigFileName write SetDBConfigFileName;
  end;



//var
//  GlobalDataBaseCharset:String;

implementation





  { TFMXUnidacDatabaseModule }

constructor TFMXUnidacDatabaseModule.Create;
begin
  Inherited Create;

//  DBType:='MYSQL';




  //Provider Name=MySQL;User ID=root;Password=138575wangneng;Use Unicode=True;Character Set=utf8mb4;Data Source=www.orangeui.cn;Database=alipay;Port=3306;Login Prompt=False
  //���ݿ�����DataModule
//  dmServerDataBase := TdmServerDataBase.Create(nil);



//  //���ݿ��ѯʹ�����
//  DBHelper := TUniDBHelper.Create;//(dmServerDataBase.kbmMWUNIDACConnectionPool1);



  //���ݿ����ӳ�
  DBHelperPool:=TUniDBHelperPool.Create(nil);
  TUniDBHelperPool(DBHelperPool).FDBConfig:=DBConfig;
//  TUniDBHelperPool(DBHelperPool).FUnidacConnectionPool:=dmServerDataBase.kbmMWUNIDACConnectionPool1;




//  tmrActiveMySQLPoolConnection := TTimer.Create(nil);
//  tmrActiveMySQLPoolConnection.OnTimer :=Self.tmrActiveMySQLPoolConnectionTimer;
//  tmrActiveMySQLPoolConnection.Enabled := False;
//  //60*60*1000,һ��Сʱ���һ��
//  tmrActiveMySQLPoolConnection.Interval := 3600000;

end;

destructor TFMXUnidacDatabaseModule.Destroy;
begin
//  FreeAndNil(tmrActiveMySQLPoolConnection);


//  FreeAndNil(dmServerDataBase);
//  FreeAndNil(DBHelper);
  FreeAndNil(DBHelperPool);

  Inherited;
end;

function TFMXUnidacDatabaseModule.DoPrepareStart(var AError:String): Boolean;
var
//  AOptions:TStringList;
  ADBHelper:TBaseDBHelper;
begin
  Result:=False;

  Inherited;


  if not IsStarted then
  begin
      if DBConfigFileName<>'' then
      begin
          if FileExists(GetApplicationPath+DBConfigFileName) then
          begin
              //�������ݿ������ļ�
              DBConfig.Load(DBConfigFileName);
          end
          else
          begin
              //ʹ���ֶ�����
              uBaseLog.HandleException(nil,'TFMXUnidacDatabaseModule.DoPrepareStart '+DBConfigFileName+' not found!');
              AError:='���ݿ������ļ�'+DBConfigFileName+' ������!';
              Exit;
          end;
      end;




      if not DBConfig.IsEmpty then
      begin
//          AOptions:=TStringList.Create;
//          AOptions.StrictDelimiter:=True;
//          AOptions.Delimiter:=';';
//          AOptions.DelimitedText:=dmServerDataBase.UniConnection1.ConnectString;
//          AOptions.Values['Character Set']:=DBConfig.FDBCharset;
//          dmServerDataBase.UniConnection1.ConnectString:=AOptions.DelimitedText;
//          FreeAndNil(AOptions);
//
//          //���ݿ�����
//          DBType:=DBConfig.FDBType;

          //�����ӳ���ȡһ��DBHelper
          if not Self.GetDBHelperFromPool(ADBHelper,AError) then
          begin
            Exit;
          end;
          try

              //�����ݿ�����,��Ҫ����
              //��������
              if not ADBHelper.Connect(DBConfig) then
              begin
                  AError:='���ݿ�'+DBConfig.FDBDataBaseName+' ����ʧ��!';
                  Exit;
              end;


//              Self.tmrActiveMySQLPoolConnection.Enabled := True;
              FActiveMySQLPoolConnectionThread:=TActiveMySQLPoolConnectionThread.Create(False,Self);


          finally
            Self.FreeDBHelperToPool(ADBHelper);
          end;

      end
      else
      begin
        //raise Exception.Create('TFMXUnidacDatabaseModule.DoPrepareStart DBConfig is empty!');
      end;

  end;
  Result := True;

  IsStarted:=True;
end;

function TFMXUnidacDatabaseModule.DoPrepareStop: Boolean;
begin
  Result:=False;

  IsStarted:=False;

  //�Ͽ����ӳ����е����ݿ�����

//  if not DBConfig.IsEmpty then
//  begin

//    DBHelper.Disconnect;


//  end;

//  tmrActiveMySQLPoolConnection.Enabled:=False;

  FActiveMySQLPoolConnectionThread.Terminate;
  FActiveMySQLPoolConnectionThread.WaitFor;
  FreeAndNil(FActiveMySQLPoolConnectionThread);



  Result := True;
end;


//function TFMXUnidacDatabaseModule.GetDBHelperFromPool(var ASQLDBHelper: TBaseDBHelper;
//  var ADesc: String): Boolean;
//begin
//  Result:=False;
//
//  ASQLDBHelper:=TUniDBHelper(Self.DBHelperPool.GetCustomObject);
//  ASQLDBHelper.DBType:=DBType;
//
//  //�����ݿ����ӳ���ȡ����������
//  if (ASQLDBHelper.GetConnectionFromPool = nil) then
//  begin
//    ADesc:=Trans('������޿��õ����ݿ�����');
//    Exit;
//  end;
//
//  Result:=True;
//end;
//
//function TFMXUnidacDatabaseModule.GetDBHelperFromPool(var ASQLDBHelper: TUniDBHelper;
//  var ADesc: String): Boolean;
//begin
//  Result:=False;
//
//  ASQLDBHelper:=TUniDBHelper(Self.DBHelperPool.GetCustomObject);
//  ASQLDBHelper.DBType:=DBType;
//
//  //�����ݿ����ӳ���ȡ����������
//  if (ASQLDBHelper.GetConnectionFromPool = nil) then
//  begin
//    ADesc:=Trans('������޿��õ����ݿ�����');
//    Exit;
//  end;
//
//  Result:=True;
//end;

procedure TFMXUnidacDatabaseModule.tmrActiveMySQLPoolConnectionTimer(Sender: TObject);
//var
//  AMykbmMWUNIDACConnectionPool: TMykbmMWUNIDACConnectionPool;
//  I: Integer;
//  lst: TList<TkbmMWCustomConnection>;
var
  I: LongInt;
  ADesc:String;
  ABaseDBHelper:TBaseDBHelper;
begin
  uBaseLog.HandleException(nil, 'TFMXUnidacDatabaseModule.tmrActiveMySQLPoolConnectionTimer');



  //��ΪMySQL���ӳ���8Сʱû�л���Զ��Ͽ���,Ҫ��ʱִ��һ�²�ѯ  Self.tmrActiveMySQLPoolConnection.Enabled:=False;
//  AMykbmMWUNIDACConnectionPool := TMykbmMWUNIDACConnectionPool
//    (dmServerDataBase.kbmMWUNIDACConnectionPool1);
//  lst := AMykbmMWUNIDACConnectionPool.ConnectionList.BeginWrite;
  try


      DBHelperPool.FCS.Enter;
      try
        for I := 0 to DBHelperPool.FCustomObjects.Count - 1 do
        begin
          if not DBHelperPool.FCustomObjects[I].Busy then
          begin
            TUniDBHelperPoolObject(DBHelperPool.FCustomObjects[I]).FDBHelper.CheckDBOK;
          end;
        end;
      finally
        DBHelperPool.FCS.Leave;
      end;




      if DBHelperPool.FCustomObjects.Count>0 then
      begin
        if not Self.GetDBHelperFromPool(ABaseDBHelper,ADesc) then
        begin
          Exit;
        end;
        try
          ABaseDBHelper.SelfQuery('SELECT 1');
        finally
          Self.FreeDBHelperToPool(ABaseDBHelper);
        end;
      end;



//    for I := 0 to lst.Count - 1 do
//    begin
//
//      if not lst[I].Locked then
//      begin
//          //����û�б���ס,����ִ�����ݿ����
//          uBaseLog.HandleException(nil, 'Main', 'MainForm',
//            'tmrActiveMySQLPoolConnectionTimer connection is not locked');
//
//          try
//            TUniDBHelper(DBHelper).Connection := TkbmMWunidacConnection(lst[I]
//              ).Database;
//            TUniDBHelper(DBHelper).CheckDBOK;
//          except
//            on E: Exception do
//            begin
//              //��¼������־
//              uBaseLog.HandleException(E, 'Main', 'MainForm',
//                'tmrActiveMySQLPoolConnectionTimer ');
//            end;
//          end;
//
//      end
//      else
//      begin
//          //�����Ѿ�����ס��,��ʾ��ʹ����
//          uBaseLog.HandleException(nil, 'Main', 'MainForm',
//            'tmrActiveMySQLPoolConnectionTimer connection is locked');
//      end;
//
//    end;

  finally
//    AMykbmMWUNIDACConnectionPool.ConnectionList.EndWrite;
//    Self.tmrActiveMySQLPoolConnection.Enabled := True;
  end;

end;


initialization
//  GlobalDataBaseCharset:='utf8mb4';
  GlobalDatabaseModuleClass:=TFMXUnidacDatabaseModule;




end.
