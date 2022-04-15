unit Unit9;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,


  uTiktokAPI,
  uBaseThirdPartyAccountAuthLogin,


  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TForm9 = class(TForm)
    AuthLogin: TButton;
    edtAccessToken: TEdit;
    btnGetUserInfo: TButton;
    btnGetVideoList: TButton;
    btnUploadVideo: TButton;
    btnGetQRCode: TButton;
    procedure AuthLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGetUserInfoClick(Sender: TObject);
    procedure btnGetVideoListClick(Sender: TObject);
    procedure btnUploadVideoClick(Sender: TObject);
    procedure btnGetQRCodeClick(Sender: TObject);
  private
    FTiktokAPI:TTiktokAPI;
    procedure DoAuthLoginEnd(Sender:TObject;AIsSucc:Boolean;ADesc:String;AAuthLoginUserInfo:TAuthLoginUserInfo);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}

procedure TForm9.AuthLoginClick(Sender: TObject);
begin
  //Auth Login
//  Self.edtAuthUrl.Text:=FTiktokAPI.GetAuthUrl;
  FTiktokAPI.AuthLogin;

//  frmTiktokAuthLogin:=TfrmTiktokAuthLogin.Create(Application);
//  frmTiktokAuthLogin.FAuthUrl:=Self.edtAuthUrl.Text;
//  frmTiktokAuthLogin.Show;

end;

procedure TForm9.btnGetQRCodeClick(Sender: TObject);
begin
  FTiktokAPI.GetAuthQRCode;
end;

procedure TForm9.btnGetUserInfoClick(Sender: TObject);
begin
  FTiktokAPI.GetUserInfo;
end;

procedure TForm9.btnGetVideoListClick(Sender: TObject);
begin
  FTiktokAPI.GetVideoList;
end;

procedure TForm9.btnUploadVideoClick(Sender: TObject);
begin
  FTiktokAPI.UploadVideo('C:\Users\ggggcexx\Videos\3CAD08A3352A612331AD842B9AC289AB.mp4');
end;


procedure TForm9.DoAuthLoginEnd(Sender: TObject;AIsSucc:Boolean;ADesc:String;AAuthLoginUserInfo:TAuthLoginUserInfo);
begin
  //将AccessToken显示在界面上
  Self.edtAccessToken.Text:=FTiktokAPI.FAuthLoginUserInfo.FAccessToken;

end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  FTiktokAPI:=TTiktokAPI.Create;
  FTiktokAPI.FClientKey:='aw6noplqmphvn7sp';
  FTiktokAPI.FClientSecret:='78448dc7ca3eee1a2e1bc6dd38febaa5';
  FTiktokAPI.FCallbackUrl:='orangeui.cn';

  FTiktokAPI.FAuthLoginUserInfo.FAccessToken:='act.69d080157109c46872f8438275a1d4b55ZH85DkNXIOe5OHBWEQeU1eZTMqN!6385';
  FTiktokAPI.FAuthLoginUserInfo.FOpenID:='ab4ef122-d7b0-45bc-9083-7f132e32c345';

  FTiktokAPI.FOnAuthLoginEnd:=DoAuthLoginEnd;

end;

end.
