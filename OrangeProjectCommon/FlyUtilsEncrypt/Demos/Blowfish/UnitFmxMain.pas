unit UnitFmxMain;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2015-04-24　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Edit,
  FMX.Layouts, FMX.Memo, FMX.ScrollBox, FMX.Controls.Presentation;

type
  TFormMain = class(TForm)
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Memo2: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    RadioButton_Ansi: TRadioButton;
    RadioButton_Wide: TRadioButton;
    RadioButton_UTF8: TRadioButton;
    Popup1: TPopup;
    Label2: TLabel;
    ProgressBarMain: TProgressBar;
    RadioButtonHex: TRadioButton;
    RadioButton64: TRadioButton;
    CheckBoxPKCS: TCheckBox;
    CheckBoxCBC: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
  FlyUtils.Blowfish, FlyUtils.CnXXX.Common;

procedure TFormMain.Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
begin
  ProgressBarMain.Max := Max;
  ProgressBarMain.Min := Min;
  ProgressBarMain.Value := Done;
  Application.ProcessMessages;
  Cancel := False;
end;

procedure TFormMain.Button2Click(Sender: TObject);
var
  BL:TBlowfish;
  Str: string;
begin
  BL := TBlowFish.Create;
  try
    BL.OnProcessProc := Process;
    BL.StringCRLFMode := rlCRLF;
    BL.CipherMode := ECB;
    BL.PaddingMode := pmZeroPadding;
    if CheckBoxCBC.IsChecked then
    begin
      BL.CipherMode := CBC;
    end;
    if CheckBoxPKCS.IsChecked then
    begin
      BL.PaddingMode := pmPKCS5or7RandomPadding;
    end;
    if RadioButtonHex.IsChecked then
    begin
      BL.SetStringMode(smHex);
    end
    else
    begin
      BL.SetStringMode(smEncode);
    end;
    if RadioButton_Ansi.IsChecked then
    begin
      BL.StringEncoding := TEncoding.ANSI;
    end;
    if RadioButton_Wide.IsChecked then
    begin
      BL.StringEncoding := TEncoding.Unicode;
    end;
    if RadioButton_UTF8.IsChecked then
    begin
      BL.StringEncoding := TEncoding.UTF8;
    end;
    BL.InitialiseString(Edit1.Text);
    if CheckBoxCBC.IsChecked then
      BL.LoadIVString(Edit1.Text);
    BL.EncString(Memo1.Text.Trim,Str);
    Memo2.Text:=Str;
  finally
    FreeAndNil(BL);
  end;
end;

procedure TFormMain.Button3Click(Sender: TObject);
var
  BL:TBlowfish;
  Str: string;
begin
  BL := TBlowFish.Create;
  try
    BL.OnProcessProc := Process;
    BL.StringCRLFMode := rlCRLF;
    BL.CipherMode := ECB;
    BL.PaddingMode := pmZeroPadding;
    if CheckBoxCBC.IsChecked then
    begin
      BL.CipherMode := CBC;
    end;
    if CheckBoxPKCS.IsChecked then
    begin
      BL.PaddingMode := pmPKCS5or7RandomPadding;
    end;
    if RadioButtonHex.IsChecked then
    begin
      BL.SetStringMode(smHex);
    end
    else
    begin
      BL.SetStringMode(smEncode);
    end;
    if RadioButton_Ansi.IsChecked then
    begin
      BL.StringEncoding := TEncoding.ANSI;
    end;
    if RadioButton_Wide.IsChecked then
    begin
      BL.StringEncoding := TEncoding.Unicode;
    end;
    if RadioButton_UTF8.IsChecked then
    begin
      BL.StringEncoding := TEncoding.UTF8;
    end;
    BL.InitialiseString(Edit1.Text);
    if CheckBoxCBC.IsChecked then
      BL.LoadIVString(Edit1.Text);
    BL.DecString(Memo2.Text.Trim,Str);
    Memo1.Text:=Str;
  finally
    FreeAndNil(BL);
  end;
end;

end.
