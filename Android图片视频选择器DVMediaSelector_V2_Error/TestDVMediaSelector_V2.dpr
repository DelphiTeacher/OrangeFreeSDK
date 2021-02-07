program TestDVMediaSelector_V2;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit17 in 'Unit17.pas' {Form17},
  Androidapi.JNI.glide_glide_4_7_1 in '..\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector\Androidapi.JNI.glide_glide_4_7_1.pas',
  Androidapi.JNI.mediaselector_1_0_0 in '..\AndroidÍ¼Æ¬ÊÓÆµÑ¡ÔñÆ÷DVMediaSelector\Androidapi.JNI.mediaselector_1_0_0.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm17, Form17);
  Application.Run;
end.
