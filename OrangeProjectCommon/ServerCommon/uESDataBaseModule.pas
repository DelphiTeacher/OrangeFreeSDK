//convert pas to utf8 by ¥
unit uESDataBaseModule;

interface

uses
  System.SysUtils, System.Classes,
  kbmMWCustomConnectionPool,

//  Vcl.Controls,
//  Vcl.StdCtrls,
//  Vcl.ExtCtrls,
//  uLang,
  System.StrUtils,
  uFileCommon,
//  DES,

//  Forms,
  uBaseLog,
  XSuperObject,
  uBaseDBHelper,
  uBaseList,
  Generics.Collections,

  uDBHelperForES,
  uDBHelperPoolForES,
  uDataBaseConfig,
//  DataBaseConfigForm,
  uBaseDatabaseModule;




type

  TESDatabaseModule=class(TBaseDatabaseModule)
  public
    constructor Create; override;
  public
    //准备启动
    function DoPrepareStart(var AError:String): Boolean;override;
    //准备停止
    function DoPrepareStop: Boolean;override;
    //获取数据库状态
    function GetStatus():TDatabaseModuleStatus;override;

  end;


implementation



{ TESDatabaseModule }

constructor TESDatabaseModule.Create;
begin
  Inherited Create;

//  DBType:='MYSQL';



//  //数据库查询使用组件
//  DBHelper := TUniDBHelper.Create(dmServerDataBase.kbmMWUNIDACConnectionPool1);
  //数据库连接池
  DBHelperPool:=TESDBHelperPool.Create(nil);
  TESDBHelperPool(DBHelperPool).FDBConfig:=DBConfig;
//  TUniDBHelperPool(DBHelperPool).FUnidacConnectionPool:=dmServerDataBase.kbmMWUNIDACConnectionPool1;
////  DBHelperPool.FIsUseUnidacConnectionPool:=False;
//  TUniDBHelperPool(DBHelperPool).FIsUseUnidacConnectionPool:=True;


end;

function TESDatabaseModule.DoPrepareStart(var AError: String): Boolean;
var
//  AOptions:TStringList;
  ADBHelper:TESDBHelper;
begin
  Result:=False;

  Inherited;

  if not IsStarted then
  begin
      if DBConfigFileName<>'' then
      begin
//          if FileExists(ExtractFilePath(Application.ExeName)+DBConfigFileName) then
          if FileExists(GetApplicationPath+DBConfigFileName) then
          begin
              //加载数据库配置文件
              DBConfig.Load(DBConfigFileName);
          end
          else
          begin
              //使用手动设置
              uBaseLog.HandleException(nil,'TDatabaseModule.DoPrepareStart '+DBConfigFileName+' not found!');
              AError:='数据库配置文件'+DBConfigFileName+' 不存在!';
              Exit;
          end;
      end;


      if not DBConfig.IsEmpty then
      begin
//          AOptions:=TStringList.Create;
//
//          AOptions.StrictDelimiter:=True;
//          AOptions.Delimiter:=';';
//          //'Provider Name=MySQL;User ID=root;Password=138575wangneng;Use Unicode=True;Character Set=utf8mb4;Data Source=www.orangeui.cn;Database=alipay;Port=3306;Login Prompt=False'
//          AOptions.DelimitedText:=dmServerDataBase.UniConnection1.ConnectString;
//          uBaseLog.HandleException(nil,'TDatabaseModule.DoPrepareStart dmServerDataBase.UniConnection1.ConnectString='+dmServerDataBase.UniConnection1.ConnectString);
//
//
//          //+'Use Unicode=True;'
//          AOptions.Values['Use Unicode']:='True';
//          AOptions.Values['Character Set']:=Self.DBConfig.FDBCharset;//GlobalDataBaseCharset;'utf8mb4';//
//          dmServerDataBase.UniConnection1.ConnectString:=AOptions.DelimitedText;
//          uBaseLog.HandleException(nil,'TDatabaseModule.DoPrepareStart dmServerDataBase.UniConnection1.ConnectString='+dmServerDataBase.UniConnection1.ConnectString);
//
//
//          FreeAndNil(AOptions);




          ADBHelper:=TESDBHelper.Create;
          try

              //有数据库配置,需要连接
              //测试连接
              if not ADBHelper.Connect(DBConfig) then
              begin
                  AError:='数据库'+DBConfig.FDBDataBaseName+' 连接失败!';
                  Exit;
              end;


          finally
            FreeAndNil(ADBHelper);
          end;

      end
      else
      begin
          //raise Exception.Create('TDatabaseModule.DoPrepareStart DBConfig is empty!');
          uBaseLog.HandleException(nil,'TDatabaseModule.DoPrepareStart DBConfig Is Empty!');
      end;

  end;
  Result := True;

  IsStarted:=True;


end;

function TESDatabaseModule.DoPrepareStop: Boolean;
begin
  Result:=False;

  IsStarted:=False;

  Result := True;


end;

function TESDatabaseModule.GetStatus: TDatabaseModuleStatus;
begin
      Result:=FStatus;

//    //最大个数
//    MaxCount:Integer;
      Result.MaxCount:=Self.DBHelperPool.MaxCustomObjects;
//    //当前个数
//    CurCount:Integer;
      Result.CurCount:=Self.DBHelperPool.TotalCustomObjects;

end;

end.
