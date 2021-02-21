unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  Androidapi.JNI.classes,
  Androidapi.JNI.my_callback_library,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge,
  {$IFDEF ANDROID}
  FMX.Helpers.Android,
  Androidapi.Helpers,
  {$ENDIF}

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
//  TJCallback = class()
//  public
//    { methods }
////    procedure  onResponse(call: JCall; response: JResponse); cdecl;
////    procedure onFailure(call: JCall; t: JThrowable); cdecl;
//    procedure success(P1: JResult); cdecl;
//    procedure failure(P1: JTwitterException); cdecl;
//  end;


  TForm1 = class(TForm)
    btnInit: TButton;
    btnLogin: TButton;
    procedure btnInitClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    FLoginButton:JTwitterLoginButton;
    FCallback:JCallback;
    FResult:JResult;
    FTwitterException:JTwitterException;
//
    FToken:JTwitterAuthToken;
//    FDefaultLogger:JDefaultLogger;
//    FLogger:JLogger;
    FTwitter:JTwitter;
    FTwitterConfigBuilder:JTwitterConfig_Builder;
    FTwitterAuthConfig:JTwitterAuthConfig;
    FTwitterConfig:JTwitterConfig;
//    FTwitterConfig:JTwitterConfig;
//
    { Private declarations }
  public


    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btnInitClick(Sender: TObject);
begin
  FTwitterConfigBuilder:=TJTwitterConfig_Builder.JavaClass.init(TAndroidHelper.Context);
//  FLogger:=TJLogger.JavaClass.init;
  FTwitterAuthConfig:=TJTwitterAuthConfig.JavaClass.init(StringToJString('xv9G5xhQU7nlmVqEadrkQ8bww'),StringToJString('pOIg3AcPpokm0FLu9gpuQgHoGphqSknjQp2CbVVFVQaSUuc9nN'));
  FTwitterConfig:=FTwitterConfigBuilder.
              //    logger(FLogger)
                  twitterAuthConfig(FTwitterAuthConfig)
                  .debug(True)
                  .build;


  TJTwitter.JavaClass.initialize(FTwitterConfig);

end;


procedure TForm1.btnLoginClick(Sender: TObject);
begin

  FCallback:=TJCallback.Create;

  FLoginButton.setCallback(FCallback);

  FMX.Types.Log.d('OrangeUI JTwitterLoginButton setCallback');
end;

{ TJCallback }

//procedure TJCallback.failure(P1: JTwitterException);
//begin
//  FMX.Types.Log.d('OrangeUI TJCallback failure'+JStringToString(P1.toString));
//end;
//
//procedure TJCallback.success(P1: JResult);
//begin
//  FMX.Types.Log.d('OrangeUI TJCallback success'+JStringToString(P1.toString));
//end;

end.
