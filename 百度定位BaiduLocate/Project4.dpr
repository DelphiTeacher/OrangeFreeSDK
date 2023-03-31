program Project4;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  Androidapi.JNI.BaiduLBS_Android in 'BaiduLocateSDK_v9.4.0\Androidapi.JNI.BaiduLBS_Android.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
