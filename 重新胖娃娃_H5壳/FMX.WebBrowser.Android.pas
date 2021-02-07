{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.WebBrowser.Android;

interface

{$SCOPEDENUMS ON}

procedure RegisterWebBrowserService;
procedure UnRegisterWebBrowserService;

implementation

uses
  System.Classes, System.Types, System.StrUtils, System.SysUtils,  System.RTLConsts, Androidapi.JNI.Webkit,
  AndroidApi.JNI.App, Androidapi.JNI.Embarcadero, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge, Androidapi.JNI.Os, Androidapi.JNI.Net, Androidapi.Helpers, Androidapi.JNI.Widget, FMX.Forms, 
  FMX.Helpers.Android, FMX.Graphics, FMX.Surfaces, FMX.ZOrder.Android, FMX.Platform, FMX.Platform.Android, FMX.WebBrowser, FMX.Types,
  //fix laod local js file to webview by xubzhlin
  Androidapi.JNI.WebViewClient, Androidapi.JNI.WebChromeClient, Androidapi.JNI.WebViewJSService,
  System.Messaging;

type
  TAndroidWBService = class(TWBFactoryService)
  protected
    function DoCreateWebBrowser: ICustomBrowser; override;
  end;

{ TAndroidWebBrowserService }

  TAndroidWebBrowserService = class(TInterfacedObject, ICustomBrowser)
  private
    type
      TWebBrowserListener = class(TJavaLocal,JOnWebViewListener)
      private
        [Weak] FWBService: TAndroidWebBrowserService;
      public
        constructor Create(const AWBService: TAndroidWebBrowserService);
        procedure doUpdateVisitedHistory(view: JWebView; url: JString; isReload: Boolean); cdecl;
        procedure onFormResubmission(view: JWebView; dontResend: JMessage; resend: JMessage); cdecl;
        procedure onLoadResource(view: JWebView; url: JString); cdecl;
        procedure onPageFinished(view: JWebView; url: JString); cdecl;
        procedure onPageStarted(view: JWebView; url: JString; favicon: JBitmap); cdecl;
        procedure onReceivedError(view: JWebView; errorCode: Integer; description: JString; failingUrl: JString); cdecl;
        procedure onReceivedHttpAuthRequest(view: JWebView; handler: JHttpAuthHandler; host: JString; realm: JString); cdecl;
        procedure onReceivedSslError(view: JWebView; handler: JSslErrorHandler; error: JSslError); cdecl;
        procedure onScaleChanged(view: JWebView; oldScale: Single; newScale: Single); cdecl;
        procedure onUnhandledKeyEvent(view: JWebView; event: JKeyEvent); cdecl;
        function shouldOverrideKeyEvent(view: JWebView; event: JKeyEvent): Boolean; cdecl;
        function shouldOverrideUrlLoading(view: JWebView; url: JString): Boolean; cdecl;
      end;

      TFocusChangeListener = class(TJavaLocal, JView_OnFocusChangeListener)
      private
        [Weak] FService: TAndroidWebBrowserService;
      public
        constructor Create(const Service: TAndroidWebBrowserService);
        procedure onFocusChange(view: JView; hasFocus: Boolean); cdecl;
      end;

      // fix ++++++++++++++++++++++++
      TOnJSServiceListener = class(TJavaLocal, JWebViewJSService_OnJSServiceListener)
      private
        [Weak] FWBService: TAndroidWebBrowserService;
      public
        constructor Create(AWBService: TAndroidWebBrowserService);
        procedure javascriptCallback(P1: JString); cdecl;
      end;


      TQAWebChromeClient_OnWebChromeClientListener = class(TJavaLocal, JQAWebChromeClient_OnWebChromeClientListener)
      private
        [Weak] FWBService: TAndroidWebBrowserService;
        FMessageSubscriptionID: Integer;
        function OnActivityResult(RequestCode, ResultCode: Integer; Data: JIntent): Boolean;
        procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);
      public
        constructor Create(AWBService: TAndroidWebBrowserService);
        procedure OpenFileChooser(P1: Integer); cdecl;
        property MessageSubscriptionID: Integer read FMessageSubscriptionID write FMessageSubscriptionID;
      end;
      // ++++++++++++++++++++++++

  private
    //+++++++++++++++++
    //fix laod local js file to webview by xubzhlin
    FWebViewClient: JQAWebViewClient;
    // fix addJavascriptInterface 更改 JS 交互
    FJSCallBack: JWebViewJSService;
    FJSListener: JWebViewJSService_OnJSServiceListener;

    //日志打印
    FWebChromeClientListener: JQAWebChromeClient_OnWebChromeClientListener;
    FWebChromeClient: JQAWebChromeClient;
    //+++++++++++++++++

    FListener: TWebBrowserListener;
    FFocusChangeListener: TFocusChangeListener;
    FWebView: JWebBrowser;
    FWebViewContainer: JViewGroup;
    FChildrenContainer: JViewGroup;
    FURL: string;
    [Weak] FWebControl: TCustomWebBrowser;
    function GetZOrderManager: TAndroidZOrderManager;

    //+++++++++++++++++
    //fix laod local js file to webview by xubzhlin
    procedure InitWebViewClient;
    //fix addJavascriptInterface 更改 JS 交互
    procedure InitJSCallBack;
    procedure JavascriptCallback(Value: string);

    procedure InitWebChromeClient;
    procedure OpenFileChooser(Code: Integer);
    //+++++++++++++++++
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function GetParent: TFmxObject;
    function GetVisible: Boolean;
    procedure Show;
    procedure Hide;
    procedure PrepareForDestruction;
    procedure UpdateContentFromControl;
    procedure DoNavigate(const AURL: string);
    procedure DoReload;
    { IFMXWebBrowserService }
    function GetURL: string;
    function GetCanGoBack: Boolean;
    function GetCanGoForward: Boolean;
    procedure SetURL(const AValue: string);
    function GetEnableCaching: Boolean;
    procedure SetEnableCaching(const AValue : Boolean);
    procedure SetWebBrowserControl(const AValue: TCustomWebBrowser);
    procedure Navigate;
    procedure LoadFromStrings(const AContent: string; const ABaseUrl: string);
    procedure Reload;
    procedure Stop;
    procedure EvaluateJavaScript(const AJavaScript: string);
    procedure GoBack;
    procedure GoForward;
    procedure GoHome;

    procedure StartLoading;
    procedure FinishLoading;
    procedure FailLoadingWithError;
    procedure ShouldStartLoading(const AURL: string);
  public
    constructor Create;
    destructor Destroy; override;
    function CaptureBitmap: TBitmap;

    property EnableCaching: Boolean read GetEnableCaching write SetEnableCaching;
    property URL: string read GetURL write SetURL;
    property CanGoBack: Boolean read GetCanGoBack;
    property CanGoForward: Boolean read GetCanGoForward;
    property ZOrderManager: TAndroidZOrderManager read GetZOrderManager;
  end;

var
  WBService: TAndroidWBService;

procedure RegisterWebBrowserService;
begin
  WBService := TAndroidWBService.Create;
  TPlatformServices.Current.AddPlatformService(IFMXWBService, WBService);
end;

procedure UnregisterWebBrowserService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXWBService);
end;

function TAndroidWebBrowserService.GetCanGoBack: Boolean;
begin
  Result := FWebView.canGoBack;
end;

function TAndroidWebBrowserService.GetCanGoForward: Boolean;
begin
  Result := FWebView.canGoForward;
end;

function TAndroidWebBrowserService.GetEnableCaching: Boolean;
begin
  Result := FWebView.getSettings.getCacheMode = TJWebSettings.JavaClass.LOAD_CACHE_ELSE_NETWORK;
end;

function TAndroidWebBrowserService.GetParent: TFmxObject;
begin
  Result := FWebControl.Parent;
end;

function TAndroidWebBrowserService.GetURL: string;
begin
  Result := FURL;
end;

function TAndroidWebBrowserService.GetVisible: Boolean;
begin
  Result := FWebControl.Visible;
end;

function TAndroidWebBrowserService.GetZOrderManager: TAndroidZOrderManager;
var
  Form: TCommonCustomForm;
begin
  if (FWebControl <> nil) and (FWebControl.Root <> nil) and (FWebControl.Root.GetObject is TCommonCustomForm) then
  begin
    Form := TCommonCustomForm(FWebControl.Root);
    Result := WindowHandleToPlatform(Form.Handle).ZOrderManager;
  end
  else
    Result := nil;
end;

procedure TAndroidWebBrowserService.GoBack;
begin
  FWebView.goBack;
end;

procedure TAndroidWebBrowserService.GoForward;
begin
  FWebView.goForward;
end;

procedure TAndroidWebBrowserService.GoHome;
begin

end;

procedure TAndroidWebBrowserService.Hide;
begin
  FWebViewContainer.setVisibility(TJView.JavaClass.INVISIBLE);
end;

procedure TAndroidWebBrowserService.LoadFromStrings(const AContent: string; const ABaseUrl: string);
begin
  FWebView.loadDataWithBaseURL(StringToJString(ABaseUrl), StringToJString(AContent), nil, nil, nil);
  UpdateContentFromControl;
end;

procedure TAndroidWebBrowserService.EvaluateJavaScript(const AJavaScript: string);
begin
  FWebView.loadUrl(StringToJString('javascript:' + AJavaScript));
  UpdateContentFromControl;
end;

procedure TAndroidWebBrowserService.Navigate;
begin
  DoNavigate(URL);
end;

procedure TAndroidWebBrowserService.PrepareForDestruction;
begin
end;

function TAndroidWebBrowserService.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := inherited QueryInterface(IID, Obj);
  if (Result <> S_OK) and (FWebView <> nil) then
    Result := FWebView.QueryInterface(IID, Obj);
end;

procedure TAndroidWebBrowserService.Reload;
begin
  DoReload;
end;

procedure TAndroidWebBrowserService.SetEnableCaching(const AValue: Boolean);
var
  CacheMode: Integer;
begin
  if AValue then
    CacheMode := TJWebSettings.JavaClass.LOAD_CACHE_ELSE_NETWORK
  else
    CacheMode := TJWebSettings.JavaClass.LOAD_NO_CACHE;
  FWebView.getSettings.setCacheMode(CacheMode);
end;

procedure TAndroidWebBrowserService.SetURL(const AValue: string);
begin
  if FURL <> AValue then
    FURL:= AValue;
end;

procedure TAndroidWebBrowserService.SetWebBrowserControl(const AValue: TCustomWebBrowser);
begin
  FWebControl := AValue;
  FWebView.setFocusable(FWebControl.CanFocus);
  UpdateContentFromControl;
end;

procedure TAndroidWebBrowserService.ShouldStartLoading(const AURL: string);
begin
  FWebControl.ShouldStartLoading(AURL);
end;

procedure TAndroidWebBrowserService.Show;
begin
  FWebViewContainer.setVisibility(TJView.JavaClass.VISIBLE);
end;

procedure TAndroidWebBrowserService.StartLoading;
begin
  FWebControl.StartLoading;
end;

procedure TAndroidWebBrowserService.Stop;
begin
  FWebView.stopLoading;
end;

function TAndroidWebBrowserService.CaptureBitmap: TBitmap;
var
  Surface: TBitmapSurface;
begin
  Result := nil;
  Surface := TBitmapSurface.Create;
  try
    if NativeViewToSurface(FWebView, Surface) then
    begin
      Result := TBitmap.Create;
      Result.Assign(Surface);
    end;
  finally
    Surface.Free;
  end;
end;

constructor TAndroidWebBrowserService.Create;
var
  LayoutParams: JRelativeLayout_LayoutParams;
begin
  FWebView := TJWebBrowser.JavaClass.init(TAndroidHelper.Activity);
  FWebView.getSettings.setJavaScriptEnabled(True);
  FListener := TWebBrowserListener.Create(Self);
  FWebView.SetWebViewListener(FListener);
  FFocusChangeListener := TFocusChangeListener.Create(Self);
  FWebView.setOnFocusChangeListener(FFocusChangeListener);
  FWebView.getSettings.setGeolocationEnabled(True);
  FWebView.getSettings.setAppCacheEnabled(True);
  FWebView.getSettings.setDatabaseEnabled(True);
  FWebView.getSettings.setDomStorageEnabled(True);
  FWebView.getSettings.setBuiltInZoomControls(True);
  FWebView.getSettings.setDisplayZoomControls(False);

//  FWebView.getSettings.setBuiltInZoomControls(false);
//  FWebView.getSettings.setSupportZoom(false);
//  FWebView.getSettings.setDisplayZoomControls(false);

  //+++++++++++++++++
  //fix laod local js file to webview by xubzhlin
  InitWebViewClient;
  InitWebChromeClient;
  //fix addJavascriptInterface 更改 JS 交互
  InitJSCallBack;
  // FWebView.getSettings.setJavaScriptCanOpenWindowsAutomatically(True);
  //+++++++++++++++++

  FWebViewContainer := TJRelativeLayout.JavaClass.init(TAndroidHelper.Activity);
  FChildrenContainer := TJRelativeLayout.JavaClass.init(TAndroidHelper.Activity);
  LayoutParams := TJRelativeLayout_LayoutParams.JavaClass.init(TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT, TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT);
  FWebViewContainer.addView(FWebView, LayoutParams);
  LayoutParams := TJRelativeLayout_LayoutParams.JavaClass.init(TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT, TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT);
  FWebViewContainer.addView(FChildrenContainer, LayoutParams);
 
  SetEnableCaching(True);
end;

//++++++++++++++++++++++
//fix laod local js file to webview by xubzhlin
procedure TAndroidWebBrowserService.InitWebChromeClient;
begin
  if FWebChromeClient = nil then
  begin
    FWebChromeClient :=  TJQAWebChromeClient.JavaClass.init;
    FWebChromeClientListener := TQAWebChromeClient_OnWebChromeClientListener.Create(Self);
    FWebChromeClient.setListener(FWebChromeClientListener);
  end;
  FWebView.setWebChromeClient(FWebChromeClient);
end;

procedure TAndroidWebBrowserService.InitWebViewClient;
begin
  if FWebViewClient = nil then
  begin
    FWebViewClient := TJQAWebViewClient.JavaClass.init(TAndroidHelper.Activity);
  end;
  FWebView.setWebViewClient(FWebViewClient);
  FWebViewClient.SetWebViewListener(FListener);
end;

procedure TAndroidWebBrowserService.OpenFileChooser(Code: Integer);
begin
  FWebControl.OpenFileChooser(Code);
end;

procedure TAndroidWebBrowserService.JavascriptCallback(Value: string);
begin
  FWebControl.JavascriptCallback(Value);
end;

//fix addJavascriptInterface 更改 JS 交互
procedure TAndroidWebBrowserService.InitJSCallBack;
begin
  FJSCallBack := TJWebViewJSService.JavaClass.init;

  FJSListener := TOnJSServiceListener.Create(Self);
  FJSCallBack.setListener(FJSListener);
  FWebView.addJavascriptInterface(FJSCallBack, StringToJString('DelphiCallback'));
end;

//+++++++++++++++++++++++

procedure TAndroidWebBrowserService.DoNavigate(const AURL: string);
var
  NewURL: string;
  LFile: string;
begin
  NewURL := AURL;
  if Pos(TWebBrowser.FilesPref, AURL) <> 0 then
  begin
    LFile := Copy(AURL, length(TWebBrowser.FilesPref) + 1, length(AURL));
    if not FileExists(LFile) then
      raise EFileNotFoundException.Create(SSpecifiedFileNotFound);
    NewURL := ReplaceStr(NewURL, TWebBrowser.FilesPref, TWebBrowser.FilesPref + '/');
  end
  else if Pos('http', AURL) = 0 then
    Insert('http://', NewURL, 0);
  FWebView.loadUrl(StringToJString(NewURL));
  ShouldStartLoading(NewURL);
  UpdateContentFromControl;
end;

procedure TAndroidWebBrowserService.DoReload;
begin
  FWebView.reload;
end;

procedure TAndroidWebBrowserService.FailLoadingWithError;
begin
  FWebControl.FailLoadingWithError;
end;

procedure TAndroidWebBrowserService.FinishLoading;
begin
  FWebControl.FinishLoading;
end;

destructor TAndroidWebBrowserService.Destroy;
begin
  if ZOrderManager <> nil then
    ZOrderManager.RemoveLink(FWebControl);

  FWebView.SetWebViewListener(nil);

  //fix
  FWebChromeClient := nil;
  FWebViewClient := nil;
  FJSCallBack := nil;
  FJSListener := nil;
  inherited;
end;

procedure TAndroidWebBrowserService.UpdateContentFromControl;
begin
  if (FWebControl <> nil) and (ZOrderManager <> nil) then
  begin
    ZOrderManager.AddOrSetLink(FWebControl, FWebViewContainer, FChildrenContainer);
    ZOrderManager.UpdateOrderAndBounds(FWebControl);
  end
  else
    Hide;
end;

{ TAndroidWBService }

function TAndroidWBService.DoCreateWebBrowser: ICustomBrowser;
begin
  Result := TAndroidWebBrowserService.Create;
end;

{ TAndroidWebBrowserService.TWebBrowserListener }

constructor TAndroidWebBrowserService.TWebBrowserListener.Create(const AWBService: TAndroidWebBrowserService);
begin
  inherited Create;
  FWBService := AWBService;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.doUpdateVisitedHistory(view: JWebView; url: JString;
  isReload: Boolean);
begin
  // Nothing
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onFormResubmission(view: JWebView; dontResend, resend: JMessage);
begin
  // Nothing
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onLoadResource(view: JWebView; url: JString);
begin
  // Nothing
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onPageFinished(view: JWebView; url: JString);
begin
  FWBService.FURL := JStringToString(url);
  FWBService.FinishLoading;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onPageStarted(view: JWebView; url: JString; favicon: JBitmap);
begin
  FWBService.FURL := JStringToString(url);
  FWBService.StartLoading;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onReceivedError(view: JWebView; errorCode: Integer; description,
  failingUrl: JString);
begin
  FWBService.FailLoadingWithError;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onReceivedHttpAuthRequest(view: JWebView; handler: JHttpAuthHandler;
  host, realm: JString);
begin
  // Nothing
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onReceivedSslError(view: JWebView; handler: JSslErrorHandler;
  error: JSslError);
begin
  // Ignores expired SSL vertificate.
  handler.proceed;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onScaleChanged(view: JWebView; oldScale, newScale: Single);
begin
  // Nothing
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onUnhandledKeyEvent(view: JWebView; event: JKeyEvent);
begin
  // Nothing
end;

function TAndroidWebBrowserService.TWebBrowserListener.shouldOverrideKeyEvent(view: JWebView; event: JKeyEvent): Boolean;
begin
  Result := False;
end;

function TAndroidWebBrowserService.TWebBrowserListener.shouldOverrideUrlLoading(view: JWebView; url: JString): Boolean;
begin
  FWBService.ShouldStartLoading(JStringToString(url));
  Result := False;
end;

{ TAndroidWebBrowserService.TFocusChangeListener }

constructor TAndroidWebBrowserService.TFocusChangeListener.Create(const Service: TAndroidWebBrowserService);
begin
  inherited Create;
  FService := Service;
end;

procedure TAndroidWebBrowserService.TFocusChangeListener.onFocusChange(view: JView; hasFocus: Boolean);
begin
  if hasFocus and FService.FWebControl.CanFocus then
    FService.FWebControl.SetFocus
  else
    FService.FWebControl.ResetFocus;
end;

// fix +++++++++++++++++

{ TAndroidWebBrowserService.TOnJSServiceListener }

constructor TAndroidWebBrowserService.TOnJSServiceListener.Create(
  AWBService: TAndroidWebBrowserService);
begin
  inherited Create;
  FWBService := AWBService;
end;

procedure TAndroidWebBrowserService.TOnJSServiceListener.javascriptCallback(
  P1: JString);
begin
  if FWBService<>nil then
    FWBService.JavascriptCallback(JStringToString(P1));

end;

{ TAndroidWebBrowserService.TQAWebChromeClient_OnWebChromeClientListener }

constructor TAndroidWebBrowserService.TQAWebChromeClient_OnWebChromeClientListener.Create(
  AWBService: TAndroidWebBrowserService);
begin
  inherited Create;
  FWBService := AWBService;

end;

procedure TAndroidWebBrowserService.TQAWebChromeClient_OnWebChromeClientListener.HandleActivityMessage(
  const Sender: TObject; const M: TMessage);
begin
  if M is TMessageResultNotification then
    OnActivityResult(TMessageResultNotification(M).RequestCode, TMessageResultNotification(M).ResultCode,
      TMessageResultNotification(M).Value);
end;

function TAndroidWebBrowserService.TQAWebChromeClient_OnWebChromeClientListener.OnActivityResult(
  RequestCode, ResultCode: Integer; Data: JIntent): Boolean;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageResultNotification, FMessageSubscriptionID);
  if (FWBService <> nil) and (FWBService.FWebChromeClient <> nil) then
    FWBService.FWebChromeClient.onReceiveValue(RequestCode, ResultCode, Data);
end;

procedure TAndroidWebBrowserService.TQAWebChromeClient_OnWebChromeClientListener.OpenFileChooser(
  P1: Integer);
begin
  if FWBService <> nil then
  begin
    FMessageSubscriptionID := TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification,
      HandleActivityMessage);
    FWBService.OpenFileChooser(P1);
  end;
end;
// ++++++++++++++++++

end.

