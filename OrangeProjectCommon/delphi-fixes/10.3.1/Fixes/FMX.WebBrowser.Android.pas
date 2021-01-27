(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2015-07-21　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.3.1(10.3 Release 1)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)

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
//Fix or Add By 爱吃猪头肉
  System.SyncObjs,
  System.NetEncoding,
  System.Classes, System.Types, System.StrUtils, System.SysUtils,  System.RTLConsts, Androidapi.JNI.Webkit,
  AndroidApi.JNI.App, Androidapi.JNI.Embarcadero, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge, Androidapi.JNI.Os, Androidapi.JNI.Net, Androidapi.Helpers, Androidapi.JNI.Widget, FMX.Forms,
  FMX.Helpers.Android, FMX.Graphics, FMX.Surfaces, FMX.ZOrder.Android, FMX.Platform, FMX.Platform.Android, FMX.WebBrowser, FMX.Types;

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

  private
    //Fix 重定向关键字
    FRedirectionKey: string;
    FListener: TWebBrowserListener;
    FFocusChangeListener: TFocusChangeListener;
    FWebView: JWebBrowser;
    FWebViewContainer: JViewGroup;
    FChildrenContainer: JViewGroup;
    FURL: string;
    [Weak] FWebControl: TCustomWebBrowser;
    function GetZOrderManager: TAndroidZOrderManager;
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
//    procedure EvaluateJavaScript(const AJavaScript: string);
    //Fix By Flying Wang and 爱吃猪头肉
    procedure EvaluateJavaScript(const AJavaScript: string;
      DidEvaluateJavaScript: TWebBrowserDidEvaluateJavaScript = nil);
    //Fix or Add By 爱吃猪头肉
    function GetRealWebBrowserObject: IUnknown;
    //Fix 重定向关键字，如果包含这个关键字 页面不刷新
    //解析 重定向字符串
    function GetRedirectionKey: string;
    procedure SetRedirectionKey(const Value:string);

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
  //fixed by kngstr
  if FWebControl <> nil then
    Result := FWebControl.Parent
  else
    Result := nil;
end;

function TAndroidWebBrowserService.GetURL: string;
begin
  Result := FURL;
end;

function TAndroidWebBrowserService.GetVisible: Boolean;
begin
  //fixed by kngstr
  if FWebControl <> nil then
    Result := FWebControl.Visible
  else
    Result := False;
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

//procedure TAndroidWebBrowserService.EvaluateJavaScript(const AJavaScript: string);
//begin
//  FWebView.loadUrl(StringToJString('javascript:' + AJavaScript));
//  UpdateContentFromControl;
//end;

//Fix and add By Flying Wang and 爱吃猪头肉
Type
  TWaitableValueBase = class(TJavaLocal)
  public
    Done: TEvent;
    constructor Create; virtual;
  end;

  TJWebValueCallback = class(TWaitableValueBase, JValueCallback)
  private
    FDidEvaluateJavaScript: TWebBrowserDidEvaluateJavaScript;
  public
    StrResult: string;
    constructor Create(DidEvaluateJavaScript: TWebBrowserDidEvaluateJavaScript = nil); overload;
    procedure onReceiveValue(value: JObject); cdecl;
  end;

constructor TWaitableValueBase.Create;
begin
  inherited Create;

  Done := TEvent.Create;
end;

constructor TJWebValueCallback.Create(DidEvaluateJavaScript: TWebBrowserDidEvaluateJavaScript = nil);
begin
  StrResult := '';
  FDidEvaluateJavaScript := DidEvaluateJavaScript;
  inherited Create;
end;

procedure TJWebValueCallback.onReceiveValue(value: JObject);
begin
  StrResult := '';
  if value <> nil then
  begin
    StrResult := JStringToString(value.toString);
    if StrResult = 'null' then
     StrResult := '';
    if (StrResult.Length  > 1) and (StrResult.IndexOf('"') = 0) and
      (StrResult.SubString(StrResult.Length - 1, 1) = '"') then
    begin
      StrResult := StrResult.SubString(1, StrResult.Length - 2);
    end;
    if Assigned(FDidEvaluateJavaScript) then
    begin
      TThread.Queue(nil, procedure () begin
        FDidEvaluateJavaScript(StrResult);
      end);
    end;
  end;
  Done.SetEvent;
end;

//Fix By Flying Wang and 爱吃猪头肉
procedure TAndroidWebBrowserService.EvaluateJavaScript(const AJavaScript: string;
      DidEvaluateJavaScript: TWebBrowserDidEvaluateJavaScript);
var
  AJCB: JValueCallback;
begin
  if (not TOSVersion.Check(4, 4)) or (not Assigned(DidEvaluateJavaScript)) then
  begin
    FWebView.loadUrl(StringToJString('javascript:' + AJavaScript));
  end
  else
  begin
    AJCB := TJWebValueCallback.Create(
      procedure (const AResult: string)
      begin
        if Assigned(DidEvaluateJavaScript) then
        begin
          DidEvaluateJavaScript(AResult);
          UpdateContentFromControl;
        end;
      end);
    try
      TJWebValueCallback(AJCB).StrResult := '';
      CallInUIThread(procedure begin
        FWebView.EvaluateJavaScript(StringToJString(AJavaScript), AJCB);
      end);
      //会卡死。
//      TJWebValueCallback(AJCB).Done.WaitFor;
    finally
//      AJCB := nil; // 会闪退。
//      FreeAndNil(AJCB);
    end;
  end;
  UpdateContentFromControl;
end;

//Fix or Add By 爱吃猪头肉
function TAndroidWebBrowserService.GetRealWebBrowserObject: IUnknown;
begin
  //已经释放了 - kngstr
  if FWebControl = nil then
    Exit;

  Result := FWebView;
end;

function TAndroidWebBrowserService.GetRedirectionKey: string;
begin
  Result := FRedirectionKey;
end;

procedure TAndroidWebBrowserService.SetRedirectionKey(const Value: string);
begin
  if FRedirectionKey <> Value then
    FRedirectionKey := Value;
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
  //已经释放了 - kngstr
  if FWebControl <> nil then
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

  FWebViewContainer := TJRelativeLayout.JavaClass.init(TAndroidHelper.Context);
  FChildrenContainer := TJRelativeLayout.JavaClass.init(TAndroidHelper.Context);
  LayoutParams := TJRelativeLayout_LayoutParams.JavaClass.init(TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT, TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT);
  FWebViewContainer.addView(FWebView, LayoutParams);
  LayoutParams := TJRelativeLayout_LayoutParams.JavaClass.init(TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT, TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT);
  FWebViewContainer.addView(FChildrenContainer, LayoutParams);
 
  SetEnableCaching(True);
end;

procedure TAndroidWebBrowserService.DoNavigate(const AURL: string);
var
  NewURL: string;
  LFile: string;
begin
  NewURL := AURL;
  //Fix 重定向关键字，回电，刷新，不 LoadURLInUIThread(NewURL);
  if (FRedirectionKey <> '') and
    (Pos(FRedirectionKey, TNetEncoding.URL.Decode(URL)) <> 0) then
  begin
    ShouldStartLoading(URL);
    UpdateContentFromControl;
    Exit;
  end;
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

  //fixed by kngstr
  Hide;
  FWebView.setOnFocusChangeListener(nil);

  FWebView.SetWebViewListener(nil);
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
  //已经释放了 - kngstr
  if FWBService.FWebControl = nil then
    Exit;

  FWBService.FURL := JStringToString(url);
  FWBService.FinishLoading;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onPageStarted(view: JWebView; url: JString; favicon: JBitmap);
begin
  //已经释放了 - kngstr
  if FWBService.FWebControl = nil then
    Exit;

  FWBService.FURL := JStringToString(url);
  FWBService.StartLoading;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onReceivedError(view: JWebView; errorCode: Integer; description,
  failingUrl: JString);
begin
  //已经释放了 - kngstr
  if FWBService.FWebControl = nil then
    Exit;

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
  //已经释放了 - kngstr
  if FWBService.FWebControl = nil then
    Exit;

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
  //已经释放了 - kngstr
  if FWBService.FWebControl = nil then
    Exit;

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
  //已经释放了 - kngstr
  if FService.FWebControl = nil then
    Exit;

  if hasFocus and FService.FWebControl.CanFocus then
    FService.FWebControl.SetFocus
  else
    FService.FWebControl.ResetFocus;
end;

end.

