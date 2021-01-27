unit uDataBaseConfig;

interface

uses
  Classes,
  SysUtils,
  IniFiles,
  Forms,
  Types;

const
  Const_Default_DBConfigFileName='DataBaseConfig.ini';

type
  TDataBaseConfig=class
  public
    function LoadFromINI(AINIFilePath: String): Boolean;
    function SaveToINI(AINIFilePath: String): Boolean;
  public
    constructor Create;
    destructor Destroy;override;
  public
    procedure Load(AIniFileName:String=Const_Default_DBConfigFileName);
    procedure Save(AIniFileName:String=Const_Default_DBConfigFileName);
  public
    FDBType:String;

    //数据库服务器
    FDBHostName:String;
    //数据库端口
    FDBHostPort:String;
    //数据库用户名
    FDBUserName:String;
    //数据库密码
    FDBPassword:String;

    //数据库
    FDBDataBaseName:String;


    function IsEmpty:Boolean;

  end;


var
  GlobalDataBaseConfig:TDataBaseConfig;


implementation


function GetApplicationPath:String;
begin
    Result:=ExtractFilePath(GetModuleName(HInstance));
end;

{ TDataBaseConfig }

constructor TDataBaseConfig.Create;
begin
  Self.FDBHostName:='www.orangeui.cn';
  Self.FDBDataBaseName:='';
  Self.FDBUserName:='sa';
  Self.FDBPassword:='138575wangneng';
end;

destructor TDataBaseConfig.Destroy;
begin
  inherited;
end;

function TDataBaseConfig.IsEmpty: Boolean;
begin
  Result:=(FDBHostName='')
          or (FDBDataBaseName='');
end;

procedure TDataBaseConfig.Load(AIniFileName:String);
begin
  //如果AIniFileName是'Wxpay_DataBaseConfig.ini'
  //先判断文件是否存在
  if (Const_Default_DBConfigFileName<>AIniFileName)
    and FileExists(GetApplicationPath+AIniFileName) then
  begin
    Self.LoadFromINI(GetApplicationPath+AIniFileName);
  end
  else
  begin
    //加载默认的DataBaseConfig.ini
    Self.LoadFromINI(GetApplicationPath+Const_Default_DBConfigFileName);
  end;
end;

function TDataBaseConfig.LoadFromINI(AINIFilePath: String): Boolean;
var
  AIniFile:TIniFile;
begin
  Result:=False;

  AIniFile:=TIniFile.Create(AINIFilePath);

  Self.FDBType:=AIniFile.ReadString('','DBType','');

  Self.FDBHostName:=AIniFile.ReadString('','DBHostName','');
  Self.FDBHostPort:=AIniFile.ReadString('','DBHostPort','');
  Self.FDBUserName:=AIniFile.ReadString('','DBUserName','');
  Self.FDBPassword:=AIniFile.ReadString('','DBPassword','');
  Self.FDBDataBaseName:=AIniFile.ReadString('','DBDataBaseName','');


  FreeAndNil(AIniFile);

  Result:=True;

end;

procedure TDataBaseConfig.Save(AIniFileName:String);
begin
  Self.SaveToINI(GetApplicationPath+AIniFileName);
end;

function TDataBaseConfig.SaveToINI(AINIFilePath: String): Boolean;
var
  AIniFile:TIniFile;
begin
  Result:=False;
  AIniFile:=TIniFile.Create(AINIFilePath);

  AIniFile.WriteString('','DBType',Self.FDBHostName);

  AIniFile.WriteString('','DBHostName',Self.FDBHostName);
  AIniFile.WriteString('','DBHostPort',Self.FDBHostPort);
  AIniFile.WriteString('','DBUserName',Self.FDBUserName);
  AIniFile.WriteString('','DBPassword',Self.FDBPassword);
  AIniFile.WriteString('','DBDataBaseName',Self.FDBDataBaseName);


  FreeAndNil(AIniFile);
  Result:=True;

end;


initialization
  GlobalDataBaseConfig:=TDataBaseConfig.Create;

finalization
  FreeAndNil(GlobalDataBaseConfig);

end.
