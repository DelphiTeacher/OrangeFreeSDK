program TestShowControlToAnotherMonitor;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  VideoFrame in 'VideoFrame.pas' {FrameVideo: TFrame},
  VideoForm in 'VideoForm.pas' {frmVideo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmVideo, frmVideo);
  Application.Run;
end.
