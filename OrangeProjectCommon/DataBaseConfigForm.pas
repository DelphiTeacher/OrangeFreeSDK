//convert pas to utf8 by ¥
unit DataBaseConfigForm;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,

  uDataBaseConfig,
  StrUtils,


  IniFiles,

  uBaseDBHelper,

  System.Classes,
  Vcl.Forms,Vcl.AppEvnts, Vcl.StdCtrls, Vcl.Controls, Vcl.Dialogs;



type
  TfrmDataBaseConfig = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    Label2: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtDBHostName: TEdit;
    edtDBHostPort: TEdit;
    edtDBUserName: TEdit;
    edtDBPassword: TEdit;
    edtDBDataBaseName: TEdit;
    Label1: TLabel;
    cmbDBType: TComboBox;
    btnSelect: TButton;
    OpenDialog1: TOpenDialog;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
  private
    FIniFileName:String;
    //用来测试是否能连接成功
    FDBHelper:TBaseDBHelper;
    FDataBaseConfig:TDataBaseConfig;

    procedure SyncUI;
    { Private declarations }
  public
    procedure Init(ADBHelper:TBaseDBHelper;
                  ADataBaseConfig:TDataBaseConfig;
                  //数据库配置文件名
                  AIniFileName:String=Const_Default_DBConfigFileName);
    { Public declarations }
  end;

var
  frmDataBaseConfig: TfrmDataBaseConfig;

implementation

{$R *.dfm}


procedure TfrmDataBaseConfig.btnOKClick(Sender: TObject);
begin
  //数据库类型
  FDataBaseConfig.FDBType:=Self.cmbDBType.Text;

  //数据库服务器
  FDataBaseConfig.FDBHostName:=Self.edtDBHostName.Text;
  //数据库端口
  FDataBaseConfig.FDBHostPort:=Self.edtDBHostPort.Text;
  //数据库用户名
  FDataBaseConfig.FDBUserName:=Self.edtDBUserName.Text;
  //数据库密码
  FDataBaseConfig.FDBPassword:=Self.edtDBPassword.Text;

  //数据库
  FDataBaseConfig.FDBDataBaseName:=Self.edtDBDataBaseName.Text;




  FDBHelper.Connect(FDataBaseConfig);


  //测试成功了再保存
  FDataBaseConfig.Save(FIniFileName);



  Self.ModalResult:=mrOK;
//  Close;
end;


procedure TfrmDataBaseConfig.btnSelectClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    FDataBaseConfig.LoadFromINI(Self.OpenDialog1.FileName);
    FDataBaseConfig.SaveToINI(FIniFileName);
    SyncUI;
  end;
end;

procedure TfrmDataBaseConfig.btnCancelClick(Sender: TObject);
begin

  Self.ModalResult:=mrClose;
//  Close;

end;

procedure TfrmDataBaseConfig.Init(ADBHelper: TBaseDBHelper;
                                  ADataBaseConfig:TDataBaseConfig;
                                  AIniFileName:String);
begin
  FDBHelper:=ADBHelper;
  FIniFileName:=AIniFileName;

  FDataBaseConfig:=ADataBaseConfig;

  FDataBaseConfig.Load(FIniFileName);

  SyncUI;
end;


procedure TfrmDataBaseConfig.SyncUI;
begin
  //数据库类型
  Self.cmbDBType.ItemIndex:=Self.cmbDBType.Items.IndexOf(FDataBaseConfig.FDBType);

  //数据库服务器
  Self.edtDBHostName.Text:=FDataBaseConfig.FDBHostName;
  //数据库端口
  Self.edtDBHostPort.Text:=FDataBaseConfig.FDBHostPort;
  //数据库用户名
  Self.edtDBUserName.Text:=FDataBaseConfig.FDBUserName;
  //数据库密码
  Self.edtDBPassword.Text:=FDataBaseConfig.FDBPassword;

  //数据库
  Self.edtDBDataBaseName.Text:=FDataBaseConfig.FDBDataBaseName;


end;

end.
