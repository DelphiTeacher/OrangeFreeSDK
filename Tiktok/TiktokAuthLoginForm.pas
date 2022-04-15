unit TiktokAuthLoginForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  uTiktokAPI,
  WebbrowserControlUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser;

type
  TfrmTiktokAuthLogin = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FAuthUrl:String;
    { Public declarations }
  end;




var
  frmTiktokAuthLogin: TfrmTiktokAuthLogin;

implementation

{$R *.fmx}

procedure TfrmTiktokAuthLogin.FormShow(Sender: TObject);
begin
  Self.WebBrowser1.Navigate(FAuthUrl);

end;

initialization
  WebbrowserControlUtils.SetIEFeatureModeCorrespond;

end.
