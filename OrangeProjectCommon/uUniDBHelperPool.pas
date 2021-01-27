﻿//convert pas to utf8 by ¥
//Uni数据库操作类的线程池,用于连接MSSQL//
unit uUniDBHelperPool;


interface
{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}



//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
//才可以正常编译此单元
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}



uses
//  Windows,
  SysUtils,
  Classes,
//  Forms,
//  IniFiles,
//  DB,ADODB,
//  SyncObjs,


  {$IFNDEF NOT_USE_kbmMWUNIDACConnectionPool}
  kbmMWCustomConnectionPool,
  kbmMWCustomDataset,
  kbmMWUniDAC,
  {$ENDIF}


  uni,
  {$IFDEF MSWINDOWS}
  ActiveX,
  {$ENDIF}

  uBaseLog,
  uDatabaseConfig,
  uUniDBHelper,
  uObjectPool;


  //不使用kbmMWUNIDACConnectionPool
//  {$DEFINE NOT_USE_kbmMWUNIDACConnectionPool}


type
  TUniDBHelperPoolObject = class(TPoolObject)
  protected
    function CreateCustomObject: TObject; override;
  public
    FDBHelper:TUniDBHelper;
    {$IFDEF NOT_USE_kbmMWUNIDACConnectionPool}
    //FMX,APP,一般不需要KBMMW的线程池控件
    FUniConnection:TUniConnection;
    {$ENDIF}
    destructor Destroy; override;
  end;



  TUniDBHelperPool=class(TObjectPool)
  protected
    function GetPoolItemClass: TPoolObjectClass; override;
  public
    {$IFDEF NOT_USE_kbmMWUNIDACConnectionPool}
      //FMX,APP,一般不需要KBMMW的线程池控件
      FDBConfig:TDatabaseConfig;
    {$ELSE}
      //VCL,一般用于服务端,需要KBMMW的线程池组件
      FUnidacConnectionPool:TkbmMWUNIDACConnectionPool;
    {$ENDIF}
  end;




function GetGlobalSQLDBHelperPool
//  (AUnidacConnectionPool:TkbmMWUNIDACConnectionPool)
  :TUniDBHelperPool;
procedure FreeGlobalADODBHelperPool;



implementation



var
  GlobalADODBHelperPool: TUniDBHelperPool;

function GetGlobalSQLDBHelperPool
//  (AUnidacConnectionPool:TkbmMWUNIDACConnectionPool)
  :TUniDBHelperPool;
begin
  if GlobalADODBHelperPool=nil then
  begin
    GlobalADODBHelperPool:=TUniDBHelperPool.Create(nil);
//    GlobalADODBHelperPool.FUnidacConnectionPool:=AUnidacConnectionPool;
  end;
  Result:=GlobalADODBHelperPool;
end;

procedure FreeGlobalADODBHelperPool;
begin
  FreeAndNil(GlobalADODBHelperPool);
end;









{ TUniDBHelperPool }

function TUniDBHelperPool.GetPoolItemClass: TPoolObjectClass;
begin
  Result:=TUniDBHelperPoolObject;
end;

{ TUniDBHelperPoolObject }

function TUniDBHelperPoolObject.CreateCustomObject: TObject;
var
//  AOptions:TStringList;
  AProviderName:String;
  AUniDBHelperPool:TUniDBHelperPool;

begin
  Result:=nil;

  AUniDBHelperPool:=TUniDBHelperPool(Self.Collection.Owner);


  {$IFDEF FMX}
  if SameText(AUniDBHelperPool.FDBConfig.FDBType,'MSSQL') then
  begin
    {$IFDEF MSWINDOWS}
    CoInitialize(nil);
    {$ENDIF}
  end;
  {$ENDIF FMX}
  try

//    try

      {$IFDEF NOT_USE_kbmMWUNIDACConnectionPool}
          //FMX,APP,一般不需要KBMMW的线程池控件
          //FMX下,用Connection
          FUniConnection:=TUniConnection.Create(nil);
          FDBHelper:=TUniDBHelper.Create;//(AUniDBHelperPool.FUnidacConnectionPool);
          FDBHelper.SetConnection(FUniConnection);

    //        AUniConnection.Server:=ADataBaseConfig.FDBHostName;
    //        AUniConnection.Port:=StrToInt(ADataBaseConfig.FDBHostPort);
    //        AUniConnection.Username:=ADataBaseConfig.FDBUserName;
    //        AUniConnection.Password:=ADataBaseConfig.FDBPassword;
    //        AUniConnection.Database:=ADataBaseConfig.FDBDataBaseName;

    //      //数据库服务器
    //      FUniConnection.Server:=AUniDBHelperPool.FDBConfig.FDBHostName;
    //      //数据库端口
    //      FUniConnection.Port:=StrToInt(AUniDBHelperPool.FDBConfig.FDBHostPort);
    //      //数据库用户名
    //      FUniConnection.Username:=AUniDBHelperPool.FDBConfig.FDBUserName;
    //      //数据库密码
    //      FUniConnection.Password:=AUniDBHelperPool.FDBConfig.FDBPassword;
    //
    //      //数据库
    //      FUniConnection.Database:=AUniDBHelperPool.FDBConfig.FDBDataBaseName;

          AProviderName:=AUniDBHelperPool.FDBConfig.FDBType;
          if SameText(AUniDBHelperPool.FDBConfig.FDBType,'MSSQL') then
          begin
            //微软的SQL SERVER
            AProviderName:='SQL Server';
          end;

          FUniConnection.ConnectString:='Provider Name='+AProviderName+';'//MySQL
                                        +'User ID='+AUniDBHelperPool.FDBConfig.FDBUserName+';'//root
                                        +'Password='+AUniDBHelperPool.FDBConfig.FDBPassword+';'//138575wangneng
                                        +'Data Source='+AUniDBHelperPool.FDBConfig.FDBHostName+';'//www.orangeui.cn
                                        +'Database='+AUniDBHelperPool.FDBConfig.FDBDataBaseName+';'//alipay
                                        +'Port='+AUniDBHelperPool.FDBConfig.FDBHostPort+';'//3306
                                        +'Login Prompt=False;';

          if SameText(AUniDBHelperPool.FDBConfig.FDBType,'MYSQL') then
          begin
            FUniConnection.ConnectString:=FUniConnection.ConnectString
                                        +';'
                                        +'Use Unicode=True;'
                                        +'Character Set='+AUniDBHelperPool.FDBConfig.FDBCharset+';'//utf8mb4
          end;

          FUniConnection.Connected:=True;

    //      AOptions:=TStringList.Create;
    //      AOptions.StrictDelimiter:=True;
    //      AOptions.Delimiter:=';';
    //      AOptions.DelimitedText:=FUniConnection.ConnectString;
    //      AOptions.Values['Character Set']:=AUniDBHelperPool.FDBConfig.FDBCharset;
    //      FUniConnection.ConnectString:=AOptions.DelimitedText;
    //      FreeAndNil(AOptions);
      {$ELSE}
          //VCL,一般用于服务端,需要KBMMW的线程池组件
          //VCL下,用POOL
          FDBHelper:=TUniDBHelper.Create(AUniDBHelperPool.FUnidacConnectionPool);
      {$ENDIF}

      Result:=FDBHelper;


//    except
//      on E:Exception do
//      begin
//        uBaseLog.HandleException(E,'TUniDBHelperPoolObject.CreateCustomObject');
//      end;
//    end;
  finally
    {$IFDEF FMX}
    if SameText(AUniDBHelperPool.FDBConfig.FDBType,'MSSQL') then
    begin
      {$IFDEF MSWINDOWS}
      CoUninitialize();
      {$ENDIF}
    end;
    {$ENDIF FMX}
  end;
end;


destructor TUniDBHelperPoolObject.Destroy;
begin
  {$IFDEF NOT_USE_kbmMWUNIDACConnectionPool}
  FreeAndNil(FUniConnection);
  {$ENDIF}

  inherited;
end;

end.



