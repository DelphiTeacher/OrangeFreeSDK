program DSunmi_FMX_D11;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {FrmMain},
  Androidapi.JNI.PayLib_release_1_4_65_aar in 'SummiPaySDK_v2\Androidapi.JNI.PayLib_release_1_4_65_aar.pas',
  Androidapi.JNI.mysunmipayv2 in 'SummiPaySDK_v2\Androidapi.JNI.mysunmipayv2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
