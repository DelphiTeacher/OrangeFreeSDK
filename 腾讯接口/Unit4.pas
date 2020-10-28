unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  QQShare,
  System.IOUtils,
  System.Messaging,
  IdHttp,
  FlyFilesUtils,
  FMX.Dialogs,
  {$IFDEF ANDROID}
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App,
  Androidapi.JNI.open_sdk_r5886_lite,
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge,
  Androidapi.JNI.Os,
  Androidapi.JNI.Widget,
  {$ENDIF}
  FMX.Types, FMX.Controls,FMX.Forms, FMX.Objects, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;
type

  TForm4 = class(TForm)
    VertScrollBox1: TVertScrollBox;
    Button10: TButton;
    Button8: TButton;
    Button3: TButton;
    Button4: TButton;
    Button1: TButton;
    btnShareQQ: TButton;
    Button9: TButton;
    Edit6: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    Edit5: TEdit;
    Edit4: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    lblTitle: TLabel;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Image3: TImage;
    Edit8: TEdit;
    Label6: TLabel;
    Label5: TLabel;
    Edit7: TEdit;
    Button5: TButton;
    Button7: TButton;
    Button6: TButton;
    Edit3: TEdit;
    lblPackageName: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    btnSharePic: TButton;
    Image1: TImage;
    Edit9: TEdit;
    Edit10: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Label10: TLabel;
    Edit13: TEdit;
    Label11: TLabel;
    Edit14: TEdit;
    Label12: TLabel;
    procedure btnSharePicClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure btnShareQQClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FQQShare:TQQShare;
    procedure DoGetUserInfoComplete(Sender:TObject);
    { Private declarations }
  public
    FMessageSubscriptionID: Integer;
//    function OnActivityResult(RequestCode, ResultCode: Integer; Data: JIntent): Boolean;
    procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);

    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.HandleActivityMessage(const Sender: TObject;const M: TMessage);
begin
  {$IFDEF ANDROID}
  if M is TMessageResultNotification then
  begin
    if FQQShare<>nil then
    begin
      FQQShare.OnActivityResult(
        TMessageResultNotification(M).RequestCode,
        TMessageResultNotification(M).ResultCode,
        TMessageResultNotification(M).Value);
    end
    else
    begin
      FMX.Types.Log.d('OrangeUI FQQShare=nil');
    end;
  end;
  {$ENDIF}
end;

procedure TForm4.btnSharePicClick(Sender: TObject);
var
  AFileName:String;
  APath:String;
  AStream:String;
begin

  AFileName:='test.png';

  APath:=GetSDCardPath+PathDelim;

  AStream:=APath+AFileName;

  Self.Image1.MultiResBitmap.Bitmaps[1.000].SaveToFile(AStream,nil);

  FQQShare.SharePicture(AStream);


end;

procedure TForm4.btnShareQQClick(Sender: TObject);
begin
  FQQShare.ShareToQQ(
                     Self.Edit6.Text,
                     Self.Edit2.Text,
                     Self.Edit4.Text,
                     Self.Edit5.Text,
                     Self.Edit3.Text+Self.Edit1.Text);
end;

procedure TForm4.Button10Click(Sender: TObject);
begin
  TThread.Synchronize(nil,
    procedure
    begin
      FQQShare.SendToUser(Self.Edit2.Text,
                      Self.Edit5.Text,
                      Self.Edit4.Text);
    end);

end;


procedure TForm4.Button1Click(Sender: TObject);
begin
  FQQShare.ShareToQQZone(Self.Edit6.Text,
                         Self.Edit2.Text,
                         Self.Edit5.Text);
end;



procedure TForm4.Button3Click(Sender: TObject);
begin
  FQQShare.ShareMusic(Self.Edit14.Text,
                      Self.Edit10.Text,
                      Self.Edit12.Text,
                      Self.Edit13.Text,
                      Self.Edit11.Text);
end;


procedure TForm4.Button4Click(Sender: TObject);
begin
  FQQShare.ShareApp(Self.Edit2.Text,
                    Self.Edit4.Text,
                    Self.Edit5.Text);
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  FQQShare.GetUserInfo;


end;

procedure TForm4.Button6Click(Sender: TObject);
begin
  FQQShare.Login;
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
  FQQShare.Logout;
end;

procedure TForm4.Button8Click(Sender: TObject);
begin
  TThread.Synchronize(nil,
  procedure
  begin
  FQQShare.SendToUser(Self.Edit2.Text,
                      Self.Edit5.Text,
                      Self.Edit4.Text
                      );
  end);

end;

procedure TForm4.Button9Click(Sender: TObject);
begin
  FQQShare.AddAuthorize(Self.Edit9.Text);
end;

procedure TForm4.DoGetUserInfoComplete(Sender: TObject);
begin
  TThread.Synchronize(nil,
  procedure
  var
  AIdHTTP:TIdCustomHTTP;
  AStream:TMemoryStream;
  begin
    Self.Edit7.Text:=FQQShare.FNikName;
    Self.Edit8.Text:=FQQShare.FProvince+FQQShare.FCity;

    Self.RadioButton1.IsChecked:=True;
    if FQQShare.FGender='Ů' then
    begin
      Self.RadioButton2.IsChecked:=True;
    end;

    AIdHTTP:=TIdCustomHTTP.Create;

    AStream:=TMemoryStream.Create;

    FMX.Types.Log.d('OrangeUI Button5Click 1');

    AIdHTTP.Get(FQQShare.FFigureurl,
                     AStream);
    FMX.Types.Log.d('OrangeUI Button5Click 2');

    Self.Image3.MultiResBitmap.Add.Bitmap.LoadFromStream(AStream);
    FMX.Types.Log.d('OrangeUI Button5Click 3');
  end);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TForm4.FormCreate');

  {$IFDEF ANDROID}
  FMessageSubscriptionID :=
    TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification,HandleActivityMessage);
  {$ENDIF}
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
  {$IFDEF ANDROID}
  TMessageManager.DefaultManager.Unsubscribe(TMessageResultNotification, FMessageSubscriptionID);
  FMessageSubscriptionID := 0;
  {$ENDIF}

  FreeAndNil(FQQShare);
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  FQQShare:=TQQShare.Create;
  FQQShare.FOnGetUserInfoComplete:=DoGetUserInfoComplete;

  FQQShare.GetShare(Self.Edit1.Text);

end;

end.
