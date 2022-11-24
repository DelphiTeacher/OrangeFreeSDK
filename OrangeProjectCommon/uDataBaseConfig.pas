//convert pas to utf8 by ¥
unit uDataBaseConfig;

interface

uses
  Classes,
  SysUtils,
  IniFiles,
  StrUtils,

  {$IFDEF MSWINDOWS}
  DES,
  {$ENDIF}

//  Forms,
  Types;

const
  Const_Default_DBConfigFileName='DataBaseConfig.ini';

type
  TDataBaseConfig=class(TPersistent)
  public
    function LoadFromINI(AINIFilePath: String): Boolean;
    function SaveToINI(AINIFilePath: String): Boolean;

    procedure AssignTo(Dest: TPersistent); override;

  public
    constructor Create;
    destructor Destroy;override;
  public
    procedure Clear;
    procedure Load(AIniFileName:String=Const_Default_DBConfigFileName);
    procedure Save(AIniFileName:String=Const_Default_DBConfigFileName);
  private
  public
    //数据库类型
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

    //字符集
    FDBCharset:String;

    //连接池最大连接数
    FMaxConnections:Integer;

    //连接方式
    FSpecificOptions_Provider:String;
    FSpecificOptions_NativeClientVersion:String;
    function IsEmpty:Boolean;
    function GetTablePrefix:String;
    function ServerUrl: String;
  end;





var
  GlobalDataBaseConfig:TDataBaseConfig;


implementation


function GetApplicationPath:String;
begin
    Result:=ExtractFilePath(GetModuleName(HInstance));
end;

{ TDataBaseConfig }

function TDataBaseConfig.ServerUrl: String;
begin
  Result:='http://'+Self.FDBHostName+':'+Self.FDBHostPort+'/';
end;

procedure TDataBaseConfig.AssignTo(Dest: TPersistent);
var
  ADest:TDataBaseConfig;
begin
//  inherited;

  ADest:=TDataBaseConfig(Dest);
  if ADest<>nil then
  begin
    //数据库类型
    ADest.FDBType:=FDBType;

    //数据库服务器
    ADest.FDBHostName:=FDBHostName;
    //数据库端口
    ADest.FDBHostPort:=FDBHostPort;
    //数据库用户名
    ADest.FDBUserName:=FDBUserName;
    //数据库密码
    ADest.FDBPassword:=FDBPassword;

    //数据库
    ADest.FDBDataBaseName:=FDBDataBaseName;

    //字符集
    ADest.FDBCharset:=FDBCharset;

  end;
end;

procedure TDataBaseConfig.Clear;
begin
  Self.FDBType:='';
  Self.FDBHostName:='';
  Self.FDBDataBaseName:='';
  Self.FDBUserName:='';
  Self.FDBPassword:='';
  Self.FDBHostPort:='';


  Self.FDBCharset:='utf8';
  FMaxConnections:=100;
end;

constructor TDataBaseConfig.Create;
begin
  //默认设置
//  Self.FDBType:='MYSQL';
  Self.FDBType:='MSSQL';


  Self.FDBHostName:='www.orangeui.cn';
  Self.FDBDataBaseName:='';
  Self.FDBUserName:='sa';
  Self.FDBPassword:='138575wangneng';
  Self.FDBHostPort:='1433';


  Self.FDBCharset:='utf8';

  FMaxConnections:=100;
end;

destructor TDataBaseConfig.Destroy;
begin
  inherited;
end;

function TDataBaseConfig.GetTablePrefix: String;
begin
  Result:='';
  if SameText(FDBType,'MYSQL') then
  begin
    Result:=FDBDataBaseName+'.';
  end;

end;

function TDataBaseConfig.IsEmpty: Boolean;
begin
  //SQLITE则不需要主机名
  Result:=(FDBHostName='')
          or (FDBDataBaseName='')
          ;
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
  ATempStr:String;
  ATempAnsiStr:AnsiString;
begin
  Result:=False;

  AIniFile:=TIniFile.Create(AINIFilePath{$IFDEF MSWINDOWS}{$ELSE},TEncoding.UTF8{$ENDIF});

  Self.FDBType:=AIniFile.ReadString('','DBType','MYSQL');

  Self.FDBHostName:=AIniFile.ReadString('','DBHostName','');
  Self.FDBHostPort:=AIniFile.ReadString('','DBHostPort','');
  Self.FDBUserName:=AIniFile.ReadString('','DBUserName','');
  Self.FDBPassword:=AIniFile.ReadString('','DBPassword','');


  {$IFDEF MSWINDOWS}
  //增加加密存储，Damon
  if (LeftStr(Self.FDBPassword,5)='[ENC]') and (Length(Self.FDBPassword)-5>0) and ((Length(Self.FDBPassword)-5) mod 16 = 0) then
  begin
    //解密
    ATempStr:=RightStr(Self.FDBPassword,Length(Self.FDBPassword)-5);
    ATempStr:=Trim(ATempStr);
    ATempAnsiStr:=ATempStr;
    ATempAnsiStr:=DESDecryptHEX(ATempAnsiStr,
                                                      gKEY,
                                                      gIV);


    Self.FDBPassword:=Hex2String(ATempAnsiStr);
  end
  else
  begin
  end;
  {$ENDIF}


  Self.FDBDataBaseName:=AIniFile.ReadString('','DBDataBaseName','');
  Self.FDBCharset:=AIniFile.ReadString('','DBCharset','utf8');


  //连接方式
  Self.FSpecificOptions_Provider:=AIniFile.ReadString('','SpecificOptions_Provider','prDirect');
  Self.FSpecificOptions_NativeClientVersion:=AIniFile.ReadString('','SpecificOptions_NativeClientVersion','ncAuto');

  //连接池最大连接数
  Self.FMaxConnections:=AIniFile.ReadInteger('','MaxConnections',100);


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
  ADBPassword:String;
begin
  Result:=False;
  AIniFile:=TIniFile.Create(AINIFilePath{$IFDEF MSWINDOWS}{$ELSE},TEncoding.UTF8{$ENDIF});

  AIniFile.WriteString('','DBType',Self.FDBType);

  AIniFile.WriteString('','DBHostName',Self.FDBHostName);
  AIniFile.WriteString('','DBHostPort',Self.FDBHostPort);
  AIniFile.WriteString('','DBUserName',Self.FDBUserName);


  ADBPassword:=FDBPassword;

  {$IFDEF MSWINDOWS}
  if (LeftStr(Self.FDBPassword,5)<>'[ENC]') then
  begin
    ADBPassword:='[ENC]'+String(DESEncryptHEX(String2Hex(AnsiString(
                    RightStr(Self.FDBPassword,Length(Self.FDBPassword))
                    )), gKEY, gIV));
  end;
  {$ENDIF}

//  Self.SaveToINI(ExtractFilePath(Application.ExeName)+DBConfigFileName);
//  Self.FDBPassword:=String(Hex2String(DESDecryptHEX(AnsiString(Trim(
//  RightStr(Self.FDBPassword,Length(Self.FDBPassword)-5)
//  )), gKEY, gIV)))


  AIniFile.WriteString('','DBPassword',ADBPassword);
  AIniFile.WriteString('','DBDataBaseName',Self.FDBDataBaseName);
  AIniFile.WriteString('','DBCharset',Self.FDBCharset);

  //连接方式
  AIniFile.WriteString('','SpecificOptions_Provider',Self.FSpecificOptions_Provider);
  AIniFile.WriteString('','SpecificOptions_NativeClientVersion',Self.FSpecificOptions_NativeClientVersion);


  AIniFile.WriteInteger('','MaxConnections',Self.FMaxConnections);

  FreeAndNil(AIniFile);
  Result:=True;

end;


initialization
  GlobalDataBaseConfig:=TDataBaseConfig.Create;

finalization
  FreeAndNil(GlobalDataBaseConfig);

end.
