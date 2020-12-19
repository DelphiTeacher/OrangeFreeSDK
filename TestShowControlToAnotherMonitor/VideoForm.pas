unit VideoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  VideoFrame,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmVideo = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    FVideoFrame:TFrameVideo;
    { Private declarations }
  public
    procedure Load(ACaption:String;
                    AVideoFilePath:String);

    { Public declarations }
  end;

var
  frmVideo: TfrmVideo;

implementation

{$R *.dfm}

{ TfrmVideo }

procedure TfrmVideo.FormCreate(Sender: TObject);
begin
  FVideoFrame:=TFrameVideo.Create(Self);
  FVideoFrame.Parent:=Self;
  FVideoFrame.Align:=alClient;
  FVideoFrame.Visible:=True;

end;

procedure TfrmVideo.Load(ACaption, AVideoFilePath: String);
begin
  FVideoFrame.Load(ACaption,AVideoFilePath);
end;

end.
