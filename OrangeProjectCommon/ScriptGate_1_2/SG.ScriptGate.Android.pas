unit SG.ScriptGate.Android;

// (*
{$IFNDEF ANDROID}
{$WARNINGS OFF 1011}
interface
implementation
end.
{$ENDIF}
// *)

interface

procedure RegisterScriptGate;

implementation

uses
  SG.ScriptGate
  , SG.ScriptGate.Android.SGWebClientBridge
  , SG.WebBrowserHelper
  , SG.ScriptGateLog
  , System.Classes
  , System.SysUtils
  , System.Rtti
  , System.JSON
  , FMX.Dialogs
  , FMX.Platform
  , FMX.Helpers.Android
  , FMX.WebBrowser
  , Androidapi.JNI
  , Androidapi.JNI.Embarcadero
  , Androidapi.JNI.Webkit
  , Androidapi.JNI.JavaTypes
  , Androidapi.JNI.GraphicsContentViewText
  , Androidapi.JNIBridge
  , Androidapi.JNI.Os
  , Androidapi.JNI.Net
  , Androidapi.Helpers
  ;

type
  TOpenScriptGate = class(TScriptGate);
  TScriptGateAndroid = class;

  TScriptGateResultCallback = class(TJavaLocal, JValueCallback)
  private
    [Weak] FScriptGate: TScriptGateAndroid;
  public
    constructor Create(const iScriptGate: TScriptGateAndroid);
    procedure onReceiveValue(value: JObject); cdecl;
  end;

  TScriptGateAndroid = class(TScriptGateBase, IScriptGate)
  private var
    FWebView: JWebBrowser;
    FScriptGate: TOpenScriptGate;
    FListener: JOnWebViewListener;
    FResultCallback: JValueCallback;
    FResultProc: TScriptGateResultProc;
  protected
    procedure CallScript(
      const iScript: String;
      const iResultProc: TScriptGateResultProc); override;
    function CheckUrl(const iUrl: String): Boolean;
  public
    constructor Create(const iScriptGate: TScriptGate);
    destructor Destroy; override;
  end;

  TScriptGateFactoryAndroid = class(TScriptGateFactory)
  public
    function CreateScriptGate(
      const iScriptGate: TScriptGate): IScriptGate; override;
  end;

procedure RegisterScriptGate;
var
  Factory: TScriptGateFactoryAndroid;
begin
  Factory := TScriptGateFactoryAndroid.Create;
  TPlatformServices.Current.AddPlatformService(IScriptGateFactory, Factory);
end;

{ TScriptGateFactoryAndroid }

function TScriptGateFactoryAndroid.CreateScriptGate(
  const iScriptGate: TScriptGate): IScriptGate;
begin
  Result := TScriptGateAndroid.Create(iScriptGate);
end;


{ TScriptGateAndroid }

procedure TScriptGateAndroid.CallScript(
  const iScript: String;
  const iResultProc: TScriptGateResultProc);
begin
  FResultProc := iResultProc;
  FWebView.evaluateJavascript(
    TAndroidHelper.StringToJString(iScript),
    FResultCallback);
end;

function TScriptGateAndroid.CheckUrl(const iUrl: String): Boolean;
begin
  Result := False;

  if (FScriptGate.CheckScheme(iUrl)) then
  begin
    Result := True;
    FScriptGate.CallEvent(iUrl);
  end;
end;

constructor TScriptGateAndroid.Create(const iScriptGate: TScriptGate);
begin
  inherited Create;

  InitSGWebClientBridge;

  FScriptGate := TOpenScriptGate(iScriptGate);
  FResultCallback := TScriptGateResultCallback.Create(Self);
  FWebView := FScriptGate.WebBrowser.GetField<JWebBrowser>('FJWebBrowser');
  FListener := FScriptGate.WebBrowser.GetField<JOnWebViewListener>('FListener');

  if (FListener <> nil) then
    RegistToSGWebClientBridge(FWebView, FListener, CheckUrl);
end;

destructor TScriptGateAndroid.Destroy;
begin
  FWebView := nil;
  FListener := nil;
  FScriptGate := nil;

  inherited;
end;

{ TScriptGateResultCallback }

constructor TScriptGateResultCallback.Create(
  const iScriptGate: TScriptGateAndroid);
begin
  inherited Create;
  FScriptGate := iScriptGate;
end;

procedure TScriptGateResultCallback.onReceiveValue(value: JObject);
var
  Str: String;
begin
  try
    Str := TAndroidHelper.JStringToString(JString(value));
    Str := TJSONObject.ParseJSONValue(Str).ToString;
  except
    Str := '';
  end;

  LogD('TScriptGate.Android.Result = ' + Str);
  if (Assigned(FScriptGate.FResultProc)) then
    FScriptGate.FResultProc(Str);
end;

initialization
  RegisterScriptGate;

end.
