unit UnitDESMain;

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
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.Memo,
  FMX.ScrollBox, FMX.Controls.Presentation;

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
  FlyUtils.CnDES, FlyUtils.CnXXX.Common;

procedure TFormMain.Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
begin
  ProgressBarMain.Max := Max;
  ProgressBarMain.Min := Min;
  ProgressBarMain.Value := Done;
  Application.ProcessMessages;
  Cancel := False;
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  if RadioButton_Ansi.IsChecked then
  begin
    Memo2.Text := DESEncryptStrToHex(Memo1.Text.Trim, Edit1.Text, TEncoding.ANSI, TEncoding.UTF8,
      rlCRLF, rlCRLF, Process);
  end;
  if RadioButton_Wide.IsChecked then
  begin
    Memo2.Text := DESEncryptStrToHex(Memo1.Text.Trim, Edit1.Text, TEncoding.Unicode, TEncoding.UTF8,
      rlCRLF, rlCRLF, Process);
  end;

  if RadioButton_UTF8.IsChecked then
  begin
    Memo2.Text := DESEncryptStrToHex(Memo1.Text.Trim, Edit1.Text, TEncoding.UTF8, TEncoding.UTF8,
      rlCRLF, rlCRLF, Process);
  end;
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
  if RadioButton_Ansi.IsChecked then
  begin
    Memo1.Text := DESDecryptStrFromHex(Memo2.Text.Trim, Edit1.Text, TEncoding.ANSI, TEncoding.UTF8,
      rlCRLF, rlCRLF, Process);
  end;
  if RadioButton_Wide.IsChecked then
  begin
    Memo1.Text := DESDecryptStrFromHex(Memo2.Text.Trim, Edit1.Text, TEncoding.Unicode, TEncoding.UTF8,
      rlCRLF, rlCRLF, Process);
  end;

  if RadioButton_UTF8.IsChecked then
  begin
    Memo1.Text := DESDecryptStrFromHex(Memo2.Text.Trim, Edit1.Text, TEncoding.UTF8, TEncoding.UTF8,
      rlCRLF, rlCRLF, Process);
  end;
end;

end.
