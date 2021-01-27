program FlyUtilsCRC32;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitCRC32Main in 'UnitCRC32Main.pas' {FormMain},
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas',
  FlyUtils.CRC32 in '..\..\Source\FlyUtils.CRC32.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
