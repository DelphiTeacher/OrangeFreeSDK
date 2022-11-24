unit VideoPlayerForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,

  uBaseNativeControl,
//  {$IFDEF HAS_TENCENTSUPERPLAYERR}
  uTencentSuperPlayer,
//  {$ENDIF HAS_TENCENTSUPERPLAYERR}

  FMX.Objects, uTencentSuperPlayer;

type
  TfrmVideoPlayer = class(TForm)
    SkinTencentSuperPlayerView1: TSkinTencentSuperPlayerView;
    procedure SkinTencentSuperPlayerView1ClickReturnButton(Sender: TObject);
    procedure SkinTencentSuperPlayerView1Paint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVideoPlayer: TfrmVideoPlayer;

implementation

{$R *.fmx}

procedure TfrmVideoPlayer.SkinTencentSuperPlayerView1ClickReturnButton(
  Sender: TObject);
begin
  SkinTencentSuperPlayerView1.ResetPlayer;
  Close;
end;

procedure TfrmVideoPlayer.SkinTencentSuperPlayerView1Paint(Sender: TObject;
  Canvas: TCanvas; const ARect: TRectF);
begin
  //

end;

end.
