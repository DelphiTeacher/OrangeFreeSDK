unit SG.ScriptGate.iOS;

// (*
{$IFNDEF IOS}
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
  , SG.WebBrowserHelper
  , System.SysUtils
  , System.Rtti
  , Macapi.ObjectiveC
  , Macapi.Helpers
  , iOSapi.Foundation
  , iOSapi.UIKit
  , FMX.Platform
  , FMX.WebBrowser
  ;

type
  TOpenScriptGate = class(TScriptGate);

  TSGWebViewDelegate = class (TOCLocal, UIWebViewDelegate)
  private var
    [Weak] FOrgDelegate: UIWebViewDelegate;
    [Weak] FScriptGate: TOpenScriptGate;
  public
    constructor Create(
      const iOrgDelegate: UIWebViewDelegate;
      const iScriptGate: TOpenScriptGate);
    procedure webView(
      webView: UIWebView;
      didFailLoadWithError: NSError); overload; cdecl;
    function webView(
      webView: UIWebView;
      shouldStartLoadWithRequest: NSURLRequest;
      navigationType: UIWebViewNavigationType): Boolean; overload; cdecl;
    procedure webViewDidFinishLoad(webView: UIWebView); cdecl;
    procedure webViewDidStartLoad(webView: UIWebView); cdecl;
  end;

  TScriptGateIOS = class(TScriptGateBase, IScriptGate)
  private var
    FWebView: UIWebView;
    FDelegate: TSGWebViewDelegate;
    FScriptGate: TOpenScriptGate;
  protected
    procedure CallScript(
      const iScript: String;
      const iResultProc: TScriptGateResultProc); override;
  public
    constructor Create(const iScriptGate: TScriptGate);
    destructor Destroy; override;
  end;

  TScriptGateFactoryIOS = class(TScriptGateFactory)
  public
    function CreateScriptGate(
      const iScriptGate: TScriptGate): IScriptGate; override;
  end;

procedure RegisterScriptGate;
begin
  TPlatformServices.Current.AddPlatformService(
    IScriptGateFactory,
    TScriptGateFactoryIOS.Create);
end;

{ TScriptGateFactoryIOS }

function TScriptGateFactoryIOS.CreateScriptGate(
  const iScriptGate: TScriptGate): IScriptGate;
begin
  Result := TScriptGateIOS.Create(iScriptGate);
end;

{ TScriptGateIOS }

procedure TScriptGateIOS.CallScript(
  const iScript: String;
  const iResultProc: TScriptGateResultProc);
var
  Result: String;
begin
  Result :=
    NSStrToStr(
      FWebView.stringByEvaluatingJavaScriptFromString(StrToNSSTR(iScript)));

  if (Assigned(iResultProc)) then
    iResultProc(Result);
end;

constructor TScriptGateIOS.Create(const iScriptGate: TScriptGate);
var
  Delegate: UIWebViewDelegate;
begin
  inherited Create;

  FScriptGate := TOpenScriptGate(iScriptGate);

  try
    FWebView := FScriptGate.WebBrowser.GetField<UIWebView>('FWebView');
    Delegate := FScriptGate.WebBrowser.GetField<UIWebViewDelegate>('FDelegate');
  except
    FWebView := nil;
    Delegate := nil;
  end;

  if (FWebView = nil) or (Delegate = nil) then
    FScriptGate.CallErrorEvent(
      TScriptGate.TScriptGateFieldNotFound.Create(
        'Field not found in FMX.WebBrowser: FWebView, FDelegate'
      )
    )
  else
  begin
    FDelegate := TSGWebViewDelegate.Create(Delegate, FScriptGate);
    FWebView.setDelegate(FDelegate.GetObjectID);
  end;
end;

destructor TScriptGateIOS.Destroy;
begin
  FWebView := nil;
  FScriptGate := nil;

  FDelegate.DisposeOf;

  inherited;
end;

{ TSGWebViewDelegate }

procedure TSGWebViewDelegate.webView(
  webView: UIWebView;
  didFailLoadWithError: NSError);
begin
  FOrgDelegate.webView(webView, didFailLoadWithError);
end;

constructor TSGWebViewDelegate.Create(
  const iOrgDelegate: UIWebViewDelegate;
  const iScriptGate: TOpenScriptGate);
begin
  inherited Create;

  FOrgDelegate := iOrgDelegate;
  FScriptGate := iScriptGate;
end;

function TSGWebViewDelegate.webView(
  webView: UIWebView;
  shouldStartLoadWithRequest: NSURLRequest;
  navigationType: UIWebViewNavigationType): Boolean;
var
  URL: String;
begin
  Result := True;
  URL := NSStrToStr(shouldStartLoadWithRequest.URL.absoluteString);

  FOrgDelegate.webView(webView, shouldStartLoadWithRequest, navigationType);

  if (FScriptGate.CheckScheme(URL)) then
  begin
    Result := False;
    FScriptGate.CallEvent(URL);
  end;
end;

procedure TSGWebViewDelegate.webViewDidFinishLoad(webView: UIWebView);
begin
  FOrgDelegate.webViewDidFinishLoad(webView);
end;

procedure TSGWebViewDelegate.webViewDidStartLoad(webView: UIWebView);
begin
  FOrgDelegate.webViewDidStartLoad(webView);
end;

initialization
  RegisterScriptGate;

end.

