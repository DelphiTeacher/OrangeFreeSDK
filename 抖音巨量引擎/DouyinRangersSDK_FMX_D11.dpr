program DouyinRangersSDK_FMX_D11;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit4 in 'Unit4.pas' {Form4},
  Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar in 'RangersAppLogSDK_6_14_3\Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.pas',
  Androidapi.JNI.Helper in 'RangersAppLogSDK_6_14_3\Androidapi.JNI.Helper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
