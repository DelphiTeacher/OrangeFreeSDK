unit VideoFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.StdCtrls,
  WebbrowserControlUtils,
  Vcl.OleCtrls, SHDocVw;

type
  TFrameVideo = class(TFrame)
    lblCaption: TLabel;
    WebBrowser1: TWebBrowser;
  private
    { Private declarations }
  public
    FVideoFilePath:String;
    procedure Load(ACaption:String;
                    AVideoFilePath:String);
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameVideo }

procedure TFrameVideo.Load(ACaption: String;
                          AVideoFilePath:String);
var
  AStringList:TStringList;
  AHtmlFilePath:String;
begin
  Self.lblCaption.Caption:=ACaption;
  FVideoFilePath:=AVideoFilePath;

  AHtmlFilePath:=ExtractFilePath(Application.ExeName)+ACaption+'.html';
  AStringList:=TStringList.Create;
  AStringList.Add('<video src="file://'+AVideoFilePath+'" controls="controls">');
  AStringList.Add('您的浏览器不支持 video 标签。');
  AStringList.Add('</video>');
  AStringList.SaveToFile(AHtmlFilePath);
  AStringList.Free;

  WebBrowser1.Navigate(AHtmlFilePath);
//  MediaPlayer1.Close;
//  Self.MediaPlayer1.FileName:=AVideoFilePath;
//  MediaPlayer1.Open;
//  MediaPlayer1.Play;
end;

end.
