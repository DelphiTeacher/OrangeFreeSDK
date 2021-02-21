unit Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  TwitterCore,
  System.Messaging,
  {$IFDEF ANDROID}
  Androidapi.Helpers,
  {$ENDIF}

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormLogin = class(TForm)
    btnInit: TButton;
    btnLogin: TButton;
    btnGetUserInfo: TButton;
    lnlUser: TLabel;
    lblName: TLabel;
    lblID: TLabel;
    lblUserID: TLabel;
    lblImage: TLabel;
    lblImageUrl: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure btnGetUserInfoClick(Sender: TObject);
    procedure btnInitClick(Sender: TObject);  private
    { Private declarations }
  public
    FTwitter:Twitter;

    procedure DoGetUserInfo(Sender:TObject);

    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.fmx}

procedure TFormLogin.btnGetUserInfoClick(Sender: TObject);
begin
  FTwitter.GetTwitterUserInfo;
end;

procedure TFormLogin.btnInitClick(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TFormLogin.btnInitClick Begin');


//  //先初始
//  TWitter.FKey:='xv9G5xhQU7nlmVqEadrkQ8bww';
//  TWitter.FSecret:='pOIg3AcPpokm0FLu9gpuQgHoGphqSknjQp2CbVVFVQaSUuc9nN';
//  TWitter.initialize;



  //创建登录按钮
  FTwitter:=Twitter.Create(Self);

  {$IFDEF ANDROID}
  FTwitter.FOnGetUserInfoComplete:=Self.DoGetUserInfo;
  {$ENDIF}

 
  FTwitter.Parent:=Self;
  FTwitter.Visible:=True;
  FTwitter.Width:=200;
  FTwitter.Height:=40;

  FMX.Types.Log.d('OrangeUI TFormLogin.btnInitClick End');

end;

procedure TFormLogin.btnLoginClick(Sender: TObject);
begin
//  FTwitter.Login;//(Self.pnlLogin);
end;

procedure TFormLogin.DoGetUserInfo(Sender: TObject);
begin
  TThread.Synchronize(nil,
  procedure
  begin
    Self.lblName.Text:=FTwitter.FUserName;
    Self.lblUserID.Text:=IntToStr(FTwitter.FUserID);
    Self.lblImageUrl.Text:=FTwitter.FUserProfileImageUrl;
  end);
end;

end.
