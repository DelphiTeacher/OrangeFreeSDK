program FlyUtilsCnCRC;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitCRCMain in 'UnitCRCMain.pas' {FormMain},
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas',
  FlyUtils.CnCRC32 in '..\..\Source\FlyUtils.CnCRC32.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
