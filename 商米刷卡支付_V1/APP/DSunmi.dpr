program DSunmi;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {FrmMain},
  Androidapi.JNI.mysummipay in 'SummiPaySDK\Androidapi.JNI.mysummipay.pas',
  Androidapi.JNI.xiaoxu in 'SummiPaySDK\Androidapi.JNI.xiaoxu.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
