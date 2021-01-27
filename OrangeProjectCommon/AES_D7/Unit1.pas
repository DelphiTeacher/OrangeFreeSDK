unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, aes, StdCtrls, EncdDecd;

type
  TForm1 = class(TForm)
    mmMsg: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
   mmMsg.Lines.Add(EncodeString(EncryptStringEx('d14dcc33-9cc0-4ac6-80d9-758dcef918ba232bc351-722f-4e50-aa33-c3c70b2a7b2b1552453311006', 'aebd39ee98ea4a23913267d39af4ef09', kb256)));
end;

end.
 