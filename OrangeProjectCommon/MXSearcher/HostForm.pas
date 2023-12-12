unit HostForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs;

type
  TfrmHost = class(TForm)
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
  end;

var
  frmHost: TfrmHost;

implementation

{$R *.dfm}

{ TfrmHost }

procedure TfrmHost.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent:=Application.MainFormHandle;
end;

end.
