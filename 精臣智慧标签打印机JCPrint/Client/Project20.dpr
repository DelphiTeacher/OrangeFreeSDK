program Project20;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit9 in 'Unit9.pas' {Form9},
  Androidapi.JNI.print3_1_5_release_aar in 'JCPrintSDK\Androidapi.JNI.print3_1_5_release_aar.pas',
  Androidapi.JNI.jcprinthelper in 'JCPrintSDK\Androidapi.JNI.jcprinthelper.pas',
  Androidapi.JNI.image_2_0_10_release_aar in 'JCPrintSDK\Androidapi.JNI.image_2_0_10_release_aar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
