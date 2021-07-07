unit Unit9;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  uOrangeAndroidNFC,


  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TForm9 = class(TForm)
    lblInfo: TLabel;
    TagWriteButton: TButton;
    edtBlockData: TEdit;
    Button1: TButton;
    edtBlockIndex: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TagWriteButtonClick(Sender: TObject);
  private
    procedure DoNewNfcIntentEvent(Sender:TObject);
    { Private declarations }
  public
    FOrangeAndroidNFC:TOrangeAndroidNFC;
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}

procedure TForm9.Button1Click(Sender: TObject);
var
  ABlockDataStr:String;
begin
  ABlockDataStr:='';
  FOrangeAndroidNFC.ReadTagBlock(StrToInt(Self.edtBlockIndex.Text),ABlockDataStr);
  Self.edtBlockData.Text:=ABlockDataStr;
  ShowMessage(ABlockDataStr);
  Exit;
end;

procedure TForm9.DoNewNfcIntentEvent(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TForm9.DoNewNfcIntentEvent');
  TThread.Synchronize(nil,procedure
  begin
    Self.lblInfo.Text:=FOrangeAndroidNFC.InfoList;
  end);
end;

procedure TForm9.FormActivate(Sender: TObject);
begin
  FOrangeAndroidNFC.FormActivate(Sender);
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  FOrangeAndroidNFC:=TOrangeAndroidNFC.Create(Self);
  FOrangeAndroidNFC.FOnNewNfcIntentEvent:=DoNewNfcIntentEvent;
end;

procedure TForm9.TagWriteButtonClick(Sender: TObject);
begin
  FOrangeAndroidNFC.WriteTagBlock(StrToInt(Self.edtBlockIndex.Text),edtBlockData.Text);
  Exit;

end;

end.
