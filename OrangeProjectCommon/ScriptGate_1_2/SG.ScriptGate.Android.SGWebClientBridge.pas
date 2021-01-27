unit SG.ScriptGate.Android.SGWebClientBridge;

// (*
{$IFNDEF ANDROID}
{$WARNINGS OFF 1011}
interface
implementation
end.
{$ENDIF}
// *)

interface

uses
  FMX.WebBrowser
  , Androidapi.JNI.Embarcadero
  ;

type
  TAndroidBridgeCheckURLFunc = function (const iUrl: String): Boolean of object;

procedure InitSGWebClientBridge;

function RegistToSGWebClientBridge(
  const iWebView: JWebBrowser;
  const iListener: JOnWebViewListener;
  const iCheckURFunc: TAndroidBridgeCheckURLFunc): Boolean;

implementation

uses
  System.SysUtils
  , System.Classes
  , System.Generics.Collections
  , Androidapi.JNI.SGWebClient
  , Androidapi.JNI
  , Androidapi.JNI.Webkit
  , Androidapi.JNI.JavaTypes
  , Androidapi.JNI.GraphicsContentViewText
  , Androidapi.JNIBridge
  , Androidapi.JNI.Os
  , Androidapi.JNI.Net
  , Androidapi.Helpers
  , FMX.Helpers.Android
  , SG.ScriptGateLog
  ;

type
  TBridgeData = record
  private
    [Weak] FWebView: JWebBrowser;
    [Weak] FListener: JOnWebViewListener;
    FWebClient: JSGWebClient;
    FCheckURLFunc: TAndroidBridgeCheckURLFunc;
  public
    constructor Create(
      const iWebView: JWebBrowser;
      const iListener: JOnWebViewListener;
      const iWebClient: JSGWebClient;
      const iCheckURLFunc: TAndroidBridgeCheckURLFunc);
    procedure Clear;
  end;

type
  TBridgeDataDic = TDictionary<Integer, TBridgeData>;

var
  GRegistered: Boolean = False;
  GBridgeDataDic: TBridgeDataDic = nil;

procedure InitSGWebClientBridge;
begin
  GRegistered := False;
  GBridgeDataDic := nil;
end;

{ TBridgeData }

constructor TBridgeData.Create(
  const iWebView: JWebBrowser;
  const iListener: JOnWebViewListener;
  const iWebClient: JSGWebClient;
  const iCheckURLFunc: TAndroidBridgeCheckURLFunc);
begin
  FWebView := iWebView;
  FListener := iListener;
  FWebClient := iWebClient;
  FCheckURLFunc := iCheckURLFunc;
end;

procedure TBridgeData.Clear;
begin
  FWebView := nil;
  FListener := nil;
  FWebClient := nil;
  FCheckURLFunc := nil;
end;

function RegisterDelphiNativeMethods: Boolean; forward;

function RegistToSGWebClientBridge(
  const iWebView: JWebBrowser;
  const iListener: JOnWebViewListener;
  const iCheckURFunc: TAndroidBridgeCheckURLFunc): Boolean;
var
  WebClient: JSGWebClient;
begin
  Result := RegisterDelphiNativeMethods;

  if (not Result) then
    Exit;

  if (GBridgeDataDic = nil) then
    GBridgeDataDic := TBridgeDataDic.Create;

  if (iWebView <> nil) then
  begin
    WebClient := TJSGWebClient.JavaClass.init;

    if (WebClient <> nil) then
    begin
      GBridgeDataDic.AddOrSetValue(
        WebClient.getHash,
        TBridgeData.Create(iWebView, iListener, WebClient, iCheckURFunc));

      CallInUIThread(
        procedure
        begin
          WebClient.setWebView(iWebView);
        end
      );
    end;
  end;
end;

function JNIStringToJString(
  const iEnv: PJNIEnv;
  const iJNIString: JNIString): JString; inline;
begin
  if (iEnv = nil) or (iJNIString = nil) then
    Result := nil
  else
    Result :=
      TAndroidHelper.StringToJString(JNIStringToString(iEnv, iJNIString));
end;

function GetBridgeData(
  const iEnv: PJNIEnv;
  const iWebClient: JNIObject): TBridgeData;
const
  METHOD = 'getHash';
  SIGNATURE = '()I';
var
  M: TMarshaller;
  MId: JNIMethodID;
  Clazz: JNIClass;
  K: Integer;
  Tag: Integer;
begin
  Result.Clear;

  Clazz := iEnv^.GetObjectClass(iEnv, iWebClient);
  if (Clazz = nil) then
    Exit;

  MId :=
    iEnv^.GetMethodID(
      iEnv,
      Clazz,
      M.AsAnsi(METHOD).ToPointer,
      M.AsAnsi(SIGNATURE).ToPointer);

  if (MId = nil) then
    Exit;

  for K in GBridgeDataDic.Keys do
  begin
    Tag := iEnv^.CallIntMethod(iEnv, iWebClient, MId);

    if (K = Tag) then
    begin
      GBridgeDataDic.TryGetValue(K, Result);
      Break;
    end;
  end;
end;

procedure doUpdateVisitedHistory(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  url: JNIString;
  isReload: JNIBoolean); cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit;

  Data.FListener.doUpdateVisitedHistory(
    Data.FWebClient.getWebView,
    JNIStringToJString(env, url),
    isReload <> 0);
end;

procedure onFormResubmission(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  dontResend: JNIObject;
  resend: JNIObject); cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit;

  Data.FListener.onFormResubmission(
    Data.FWebClient.getWebView,
    Data.FWebClient.getMessage1,
    Data.FWebClient.getMessage2);
end;

procedure onLoadResource(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  url: JNIString); cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit;

  Data.FListener.onLoadResource(
    Data.FWebClient.getWebView,
    JNIStringToJString(env, url));
end;

procedure onPageFinished(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  url: JNIString); cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit;

  Data.FListener.onPageFinished(
    Data.FWebClient.getWebView,
    JNIStringToJString(env, url));
end;

procedure onPageStarted(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  url: JNIString;
  favicon: JNIObject); cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit;

  Data.FListener.onPageStarted(
    Data.FWebClient.getWebView,
    JNIStringToJString(env, url),
    Data.FWebClient.getBitmap);
end;

procedure onReceivedError(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  errorCode: JNIInt;
  description: JNIString;
  failingUrl: JNIString); cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit;

  Data.FListener.onReceivedError(
    Data.FWebClient.getWebView,
    errorCode,
    JNIStringToJString(env, description),
    JNIStringToJString(env, failingUrl));
end;

procedure onReceivedHttpAuthRequest(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  handler: JNIObject;
  host: JNIString;
  realm: JNIString); cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit;

  Data.FListener.onReceivedHttpAuthRequest(
    Data.FWebClient.getWebView,
    Data.FWebClient.getHttpAuthHandler,
    JNIStringToJString(env, host),
    JNIStringToJString(env, realm));
end;

procedure onReceivedSslError(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  handler: JNIObject;
  error: JNIObject );
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit;

  Data.FListener.onReceivedSslError(
    Data.FWebClient.getWebView,
    Data.FWebClient.getSslErrorHandler,
    Data.FWebClient.getSslError);
end;

procedure onScaleChanged(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  oldScale: JNIFloat;
  newScale: JNIFloat); cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit;

  Data.FListener.onScaleChanged(
    Data.FWebClient.getWebView,
    oldScale,
    newScale);
end;

procedure onUnhandledKeyEvent(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  event: JNIObject); cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit;

  Data.FListener.onUnhandledKeyEvent(
    Data.FWebClient.getWebView,
    Data.FWebClient.getKeyEvent);
end;

function shouldOverrideKeyEvent(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  event: JNIObject): Boolean; cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit(False);

  Result :=
    Data.FListener.shouldOverrideKeyEvent(
      Data.FWebClient.getWebView,
      Data.FWebClient.getKeyEvent);
end;

function shouldOverrideUrlLoading(
  env: PJNIEnv;
  this: JNIObject;
  view: JNIObject;
  url: JNIString): Boolean; cdecl;
var
  Data: TBridgeData;
begin
  Data := GetBridgeData(env, this);

  if (not Assigned(Data.FListener)) then
    Exit(False);

  Result :=
    Data.FListener.shouldOverrideUrlLoading(
      Data.FWebClient.getWebView,
      JNIStringToJString(env, url));

  if (Assigned(Data.FCheckURLFunc)) then
    Result := Data.FCheckURLFunc(JNIStringToString(env, url));
end;

function RegisterDelphiNativeMethods: Boolean;
var
  PEnv: PJNIEnv;
  Clazz: JNIClass;
  NativeMethods: packed array [0.. 11] of JNINativeMethod;
  Index: Integer;
  M: TMarshaller;

  procedure AddMethod(const iName, iSignature: String; const iPtr: Pointer);
  begin
    NativeMethods[Index].name := M.AsAnsi(iName).ToPointer;
    NativeMethods[Index].signature := M.AsAnsi(iSignature).ToPointer;
    NativeMethods[Index].fnPtr := iPtr;

    Inc(Index);
  end;

begin
  if (GRegistered) then
    Exit(True);

  Result := False;
  LogD('SG.ScriptGate.AndroidBridge.RegisterDelphiNativeMethods');

  try
    PEnv := TJNIResolver.GetJNIEnv;
    Clazz := TJNIResolver.GetJavaClassID('jp/serialgames/SGWebClient');

    if not Assigned(Clazz) then
    begin
      LogD(
        'SG.ScriptGate.AndroidBridge.RegisterDelphiNativeMethods: '
        + 'Class not found.');

      Exit;
    end;

    Index := 0;
    AddMethod(
      '_doUpdateVisitedHistory',
      '(Landroid/webkit/WebView;Ljava/lang/String;Z)V',
      @doUpdateVisitedHistory);
    AddMethod(
      '_onFormResubmission',
      '(Landroid/webkit/WebView;Landroid/os/Message;Landroid/os/Message;)V',
      @onFormResubmission);
    AddMethod(
      '_onLoadResource',
      '(Landroid/webkit/WebView;Ljava/lang/String;)V',
      @onLoadResource);
    AddMethod(
      '_onPageFinished',
      '(Landroid/webkit/WebView;Ljava/lang/String;)V',
      @onPageFinished);
    AddMethod(
      '_onPageStarted',
      '(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V',
      @onPageStarted);
    AddMethod(
      '_onReceivedError',
      '(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V',
      @onReceivedError);
    AddMethod(
      '_onReceivedHttpAuthRequest',
      '(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;'
        + 'Ljava/lang/String;Ljava/lang/String;)V',
      @onReceivedHttpAuthRequest);
    AddMethod(
      '_onReceivedSslError',
      '(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;'
        + 'Landroid/net/http/SslError;)V',
      @onReceivedSslError);
    AddMethod(
      '_onScaleChanged',
      '(Landroid/webkit/WebView;FF)V',
      @onScaleChanged);
    AddMethod(
      '_onUnhandledKeyEvent',
      '(Landroid/webkit/WebView;Landroid/view/KeyEvent;)V',
      @onUnhandledKeyEvent);
    AddMethod(
      '_shouldOverrideKeyEvent',
      '(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z',
      @shouldOverrideKeyEvent);
    AddMethod(
      '_shouldOverrideUrlLoading',
      '(Landroid/webkit/WebView;Ljava/lang/String;)Z',
      @shouldOverrideUrlLoading);

    PEnv^.RegisterNatives(
      PEnv,
      Clazz,
      @NativeMethods[0],
      Length(NativeMethods));

    PEnv^.DeleteLocalRef(PEnv, Clazz);

    Result := True;
    GRegistered := True;
    LogD('SG.ScriptGate.AndroidBridge.RegisterDelphiNativeMethods.JarExists!');
  except
    on E: Exception do
      LogD(E.Message);
  end;
end;

initialization

finalization
  GBridgeDataDic.DisposeOf;
  GBridgeDataDic := nil;

end.
