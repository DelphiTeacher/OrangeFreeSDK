unit FrameParentForm_VCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,

  uFrameContext,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmFrameParent = class(TForm)
    procedure FormCreate(Sender: TObject);

  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFrameParent: TfrmFrameParent;

implementation

{$R *.dfm}

procedure TfrmFrameParent.CreateParams(var Params: TCreateParams);
begin
  inherited;

  //在任务栏显示
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;

end;

procedure TfrmFrameParent.FormCreate(Sender: TObject);
begin
  //
end;

initialization
  GlobalFrameParentFormClass:=TfrmFrameParent;

end.
