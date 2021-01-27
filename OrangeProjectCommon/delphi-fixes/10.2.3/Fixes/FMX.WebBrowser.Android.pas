(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2015-07-21　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.2.3(10.2 Release 3)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)

{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2017 Embarcadero Technologies, Inc. }
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
  System.Classes, System.Types, System.StrUtils, System.SysUtils,  System.IOUtils,
  System.RTLConsts, FMX.Platform, FMX.Platform.Android, FMX.WebBrowser, FMX.Types,
  FMX.Forms, Androidapi.JNI.Webkit, Androidapi.JNI.Embarcadero, Androidapi.JNI.Widget,
  FMX.Helpers.Android, Androidapi.JNI.JavaTypes, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNIBridge, Androidapi.JNI.Os, Androidapi.JNI.Net, Androidapi.NativeActivity,
  Androidapi.IOUtils, Androidapi.Helpers, FMX.Graphics, FMX.Surfaces, Androidapi.JNI.App;

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
        constructor Create(AWBService: TAndroidWebBrowserService);
        procedure doUpdateVisitedHistory(P1: JWebView; P2: JString; P3: Boolean); cdecl;
        procedure onFormResubmission(P1: JWebView; P2: JMessage; P3: JMessage); cdecl;
        procedure onLoadResource(P1: JWebView; P2: JString); cdecl;
        procedure onPageFinished(P1: JWebView; P2: JString); cdecl;
        procedure onPageStarted(P1: JWebView; P2: JString; P3: JBitmap); cdecl;
        procedure onReceivedError(P1: JWebView; P2: Integer; P3: JString; P4: JString); cdecl;
        procedure onReceivedHttpAuthRequest(P1: JWebView; P2: JHttpAuthHandler; P3: JString; P4: JString); cdecl;
        procedure onReceivedSslError(P1: JWebView; P2: JSslErrorHandler; P3: JSslError); cdecl;
        procedure onScaleChanged(P1: JWebView; P2: Single; P3: Single); cdecl;
        procedure onUnhandledKeyEvent(P1: JWebView; P2: JKeyEvent); cdecl;
        function shouldOverrideKeyEvent(P1: JWebView; P2: JKeyEvent): Boolean; cdecl;
        function shouldOverrideUrlLoading(P1: JWebView; P2: JString): Boolean; cdecl;
      end;

      TFocusChangeListener = class(TJavaLocal, JView_OnFocusChangeListener)
      private
        [Weak] FService: TAndroidWebBrowserService;
      public
        constructor Create(const Service: TAndroidWebBrowserService);
        procedure onFocusChange(v: JView; hasFocus: Boolean); cdecl;
      end;

  private
    //Fix 重定向关键字
    FRedirectionKey: string;
    FListener: TWebBrowserListener;
    FFocusChangeListener: TFocusChangeListener;
    FScale: Single;
    FJNativeLayout: JNativeLayout;
    FJWebBrowser: JWebBrowser;
    FURL: string;
    [Weak] FWebControl: TCustomWebBrowser;
    FNeedUpdateBounds: Boolean;
    FBounds: TRect;
    FRealBounds: TRect;
    procedure InitUIThread;
    procedure CalcRealBorder;
    procedure SetFocus(AFocus: Boolean);
    procedure LoadURLInUIThread(const URL: string);
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function GetParent: TFmxObject;
    function GetVisible: Boolean;
    procedure Show;
    procedure Hide;
    procedure PrepareForDestruction;
    procedure UpdateContentFromControl;
    procedure DoNavigate(const URL: string);
    // add from OrangeUI
    procedure DoGoBack;
    procedure DoGoForward;
    procedure DoReload;
    { IFMXWebBrowserService }
    function GetURL: string;
    function GetCanGoBack: Boolean;
    function GetCanGoForward: Boolean;
    procedure SetURL(const AValue: string);
    function GetEnableCaching: Boolean;
    procedure SetEnableCaching(const Value : Boolean);
    procedure SetWebBrowserControl(const AValue: TCustomWebBrowser);
    procedure Navigate;
    procedure LoadFromStrings(const Content: string; const BaseUrl: string);
    procedure Reload;
    procedure Stop;
//    procedure EvaluateJavaScript(const JavaScript: string);
    //Fix By Flying Wang and 爱吃猪头肉
    procedure EvaluateJavaScript(const JavaScript: string;
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
    procedure ShouldStartLoading(const URL: string);
  public
    constructor Create;
    destructor Destroy; override;
    function CaptureBitmap: TBitmap;

    property EnableCaching: Boolean read GetEnableCaching write SetEnableCaching;
    property URL: string read GetURL write SetURL;
    property CanGoBack: Boolean read GetCanGoBack;
    property CanGoForward: Boolean read GetCanGoForward;
    property Focus: Boolean write SetFocus;
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
var
  CanGoBack: Boolean;
begin
// add from OrangeUI
  CallInUIThreadAndWaitFinishing(procedure begin
    CanGoBack := FJWebBrowser.canGoBack;
  end);
  Result := CanGoBack;
end;

function TAndroidWebBrowserService.GetCanGoForward: Boolean;
var
  CanGoForward: Boolean;
begin
// add from OrangeUI
  CallInUIThreadAndWaitFinishing(procedure begin
    CanGoForward := FJWebBrowser.canGoForward;
  end);
  Result := CanGoForward;
end;

function TAndroidWebBrowserService.GetEnableCaching: Boolean;
var
  CacheEnable : Boolean;
begin
// add from OrangeUI
  CallInUIThreadAndWaitFinishing(procedure begin
    CacheEnable := FJWebBrowser.getSettings.getCacheMode = TJWebSettings.JavaClass.LOAD_CACHE_ELSE_NETWORK;
  end);
  Result := CacheEnable;
end;

function TAndroidWebBrowserService.GetParent: TFmxObject;
begin
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
// add from OrangeUI
  Result := False;
  if FWebControl <> nil then
    Result := FWebControl.Visible;
end;

procedure TAndroidWebBrowserService.GoBack;
begin
// add from OrangeUI
  CallInUIThread(DoGoBack);
end;

procedure TAndroidWebBrowserService.GoForward;
begin
// add from OrangeUI
  CallInUIThread(DoGoForward);
end;

procedure TAndroidWebBrowserService.GoHome;
begin

end;

procedure TAndroidWebBrowserService.Hide;
begin
// add from OrangeUI
  CallInUIThread(
    procedure
    begin
      if FJWebBrowser.getVisibility <> TJView.JavaClass.INVISIBLE then
      begin
        CalcRealBorder;
        FJWebBrowser.setVisibility(TJView.JavaClass.INVISIBLE);
        FJNativeLayout.setPosition(FRealBounds.Right * 2 , FRealBounds.Height * 2);
      end;
    end);
end;

procedure TAndroidWebBrowserService.InitUIThread;
begin
  FJWebBrowser := TJWebBrowser.JavaClass.init(TAndroidHelper.Activity);
  FJWebBrowser.getSettings.setJavaScriptEnabled(True);
  FListener := TWebBrowserListener.Create(Self);
  FJWebBrowser.SetWebViewListener(FListener);
  FJNativeLayout := TJNativeLayout.JavaClass.init(TAndroidHelper.Activity,
    MainActivity.getWindow.getDecorView.getWindowToken);
  FJNativeLayout.setPosition(100,100);
  FJNativeLayout.setSize(300,300);
  FJNativeLayout.setControl(FJWebBrowser);
  FFocusChangeListener := TFocusChangeListener.Create(Self);
  FJNativeLayout.setOnFocusChangeListener(FFocusChangeListener);
  FJWebBrowser.getSettings.setGeolocationEnabled(True);
  FJWebBrowser.getSettings.setAppCacheEnabled(True);
  FJWebBrowser.getSettings.setDatabaseEnabled(True);
  FJWebBrowser.getSettings.setDomStorageEnabled(True);
  FJWebBrowser.getSettings.setBuiltInZoomControls(True);
  FJWebBrowser.getSettings.setDisplayZoomControls(False);
end;

procedure TAndroidWebBrowserService.LoadFromStrings(const Content: string; const BaseUrl: string);
begin
  FJWebBrowser.loadDataWithBaseURL(StringToJString(BaseUrl), StringToJString(Content), nil, nil, nil);
  UpdateContentFromControl;
end;

procedure TAndroidWebBrowserService.LoadURLInUIThread(const URL: string);
begin
// add from OrangeUI
  CallInUIThreadAndWaitFinishing(procedure begin
    FJWebBrowser.loadUrl(StringToJString(URL));
  end);
end;

//procedure TAndroidWebBrowserService.EvaluateJavaScript(const JavaScript: string);
//begin
//  LoadURLInUIThread('javascript:' + JavaScript);
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
procedure TAndroidWebBrowserService.EvaluateJavaScript(const JavaScript: string;
      DidEvaluateJavaScript: TWebBrowserDidEvaluateJavaScript);
var
  AJCB: JValueCallback;
begin
  if (not TOSVersion.Check(4,4)) or (not Assigned(DidEvaluateJavaScript)) then
  begin
    LoadURLInUIThread('javascript:' + JavaScript);
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
        FJWebBrowser.EvaluateJavaScript(StringToJString(JavaScript), AJCB);
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
  Result := FJWebBrowser;
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
// add from OrangeUI
  TUIThreadCaller.ForceRunnablesCollection;
end;

function TAndroidWebBrowserService.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := inherited QueryInterface(IID, Obj);
  if (Result <> S_OK) and (FJWebBrowser <> nil) then
    Result := FJWebBrowser.QueryInterface(IID, Obj);
end;

procedure TAndroidWebBrowserService.Reload;
begin
  DoReload;
end;

procedure TAndroidWebBrowserService.SetEnableCaching(const Value: Boolean);
begin
// add from OrangeUI
  CallInUIThreadAndWaitFinishing(procedure begin
    if Value then
      FJWebBrowser.getSettings.setCacheMode(TJWebSettings.JavaClass.LOAD_CACHE_ELSE_NETWORK)
    else
      FJWebBrowser.getSettings.setCacheMode(TJWebSettings.JavaClass.LOAD_NO_CACHE);
  end);
end;

procedure TAndroidWebBrowserService.SetFocus(AFocus: Boolean);
begin
  if FJNativeLayout <> nil then
    // add from OrangeUI
    CallInUIThreadAndWaitFinishing(
      procedure
      begin
        FJNativeLayout.setFocus(AFocus);
      end);
end;

procedure TAndroidWebBrowserService.SetURL(const AValue: string);
begin
  if FURL <> AValue then
    FURL:= AValue;
end;

procedure TAndroidWebBrowserService.SetWebBrowserControl(const AValue: TCustomWebBrowser);
begin
  FWebControl := AValue;
  // add from OrangeUI
  TUIThreadCaller.Call<Boolean>(
    procedure (B: boolean)
    begin
      FJWebBrowser.setFocusable(B);
    end, FWebControl.CanFocus);
end;

procedure TAndroidWebBrowserService.ShouldStartLoading(const URL: string);
begin
  // add from OrangeUI
  TThread.Queue(nil, procedure begin
    if FWebControl <> nil then
      FWebControl.ShouldStartLoading(URL);
  end);
end;

procedure TAndroidWebBrowserService.Show;
begin
  // add from OrangeUI
  TUIThreadCaller.Call<TRect>(
    procedure (R: TRect)
    begin
      FJNativeLayout.setPosition(R.Left, R.Top);
      FJNativeLayout.setSize(R.Right, R.Bottom);
    end, FBounds);
  CallInUIThread(
    procedure
    begin
      if FJWebBrowser.getVisibility <> TJView.JavaClass.VISIBLE then
      begin
        FJWebBrowser.setVisibility(TJView.JavaClass.VISIBLE);
      end;
    end);
end;

procedure TAndroidWebBrowserService.StartLoading;
begin
  // add from OrangeUI
  TThread.Queue(nil, procedure begin
    if FWebControl <> nil then
      FWebControl.StartLoading;
  end);
end;

procedure TAndroidWebBrowserService.Stop;
begin
  // add from OrangeUI
  CallInUIThread(procedure begin
    FJWebBrowser.stopLoading;
  end);
end;

procedure TAndroidWebBrowserService.CalcRealBorder;
var
  NativeWin: JWindow;
  ContentRect: JRect;
begin
  if FRealBounds.IsEmpty then
  begin
    NativeWin := TAndroidHelper.Activity.getWindow;
    if NativeWin <> nil then
    begin
      ContentRect := TJRect.Create;
      NativeWin.getDecorView.getDrawingRect(ContentRect);
      FRealBounds := Rect(ContentRect.left, ContentRect.top, ContentRect.right, ContentRect.bottom);
    end
    else
      FRealBounds := TRect.Empty;
  end;
end;

function TAndroidWebBrowserService.CaptureBitmap: TBitmap;
var
  Surface: TBitmapSurface;
begin
  Result := nil;
  Surface := TBitmapSurface.Create;
  try
    if NativeViewToSurface(FJWebBrowser, Surface) then
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
  ScreenSrv: IFMXScreenService;
begin
  CalcRealBorder;
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenSrv) then
    FScale := ScreenSrv.GetScreenScale
  else
    FScale := 1;
 // add from OrangeUI
  CallInUIThreadAndWaitFinishing(InitUIThread);
  SetEnableCaching(True);
end;

// add from OrangeUI
procedure TAndroidWebBrowserService.DoGoBack;
begin
  inherited;
  FJWebBrowser.goBack;
end;

// add from OrangeUI
procedure TAndroidWebBrowserService.DoGoForward;
begin
  inherited;
  FJWebBrowser.goForward;
end;

procedure TAndroidWebBrowserService.DoNavigate(const URL: string);
var
  NewURL: string;
  LFile: string;
begin
  NewURL := URL;
  //Fix 重定向关键字，回电，刷新，不 LoadURLInUIThread(NewURL);
  if (FRedirectionKey <> '') and
    (Pos(FRedirectionKey, TNetEncoding.URL.Decode(URL)) <> 0) then
  begin
    ShouldStartLoading(URL);
    UpdateContentFromControl;
    Exit;
  end;
  if Pos(TWebBrowser.FilesPref, URL) <> 0 then
  begin
    LFile := Copy(URL, length(TWebBrowser.FilesPref) + 1, length(URL));
    if not FileExists(LFile) then
      raise EFileNotFoundException.Create(SFileNotFound);
    NewURL := ReplaceStr(NewURL, TWebBrowser.FilesPref, TWebBrowser.FilesPref + '/');
  end
  else
  begin
    if Pos('http', URL) = 0 then
      Insert('http://', NewURL, 0);
  end;
  LoadURLInUIThread(NewURL);
  ShouldStartLoading(NewURL);
  UpdateContentFromControl;
end;

procedure TAndroidWebBrowserService.DoReload;
begin
  // add from OrangeUI
  CallInUIThread(procedure begin
    FJWebBrowser.reload;
  end);
end;

procedure TAndroidWebBrowserService.FailLoadingWithError;
begin
  // add from OrangeUI
  TThread.Queue(nil, procedure begin
    if FWebControl <> nil then
      FWebControl.FailLoadingWithError;
  end);
end;

procedure TAndroidWebBrowserService.FinishLoading;
begin
  // add from OrangeUI
  TThread.Queue(nil, procedure begin
    if FWebControl <> nil then
      FWebControl.FinishLoading;
  end);
end;

destructor TAndroidWebBrowserService.Destroy;
begin
  // add from OrangeUI
  TUIThreadCaller.Call<JWebBrowser, JNativeLayout>(
    procedure (UIWebBrowser: JWebBrowser; UINativeLayout: JNativeLayout)
    begin
      UIWebBrowser.setVisibility(TJView.JavaClass.INVISIBLE);
      UIWebBrowser.SetWebViewListener(nil);
      UINativeLayout.setOnFocusChangeListener(nil);
      UINativeLayout.setControl(nil);
    end, FJWebBrowser, FJNativeLayout);
  inherited;
end;

procedure TAndroidWebBrowserService.UpdateContentFromControl;
var
  Pos: TPointF;
begin
  while FJNativeLayout = nil do
    Application.ProcessMessages;

  if FJNativeLayout <> nil then
  begin
    if (FWebControl <> nil) and not (csDesigning in FWebControl.ComponentState) and (FWebControl.Root <> nil) and
      (FWebControl.Root.GetObject is TCommonCustomForm) then
    begin
      FNeedUpdateBounds := True;
      Pos := FWebControl.LocalToAbsolute(TPointF.Zero) * FScale;
      FBounds := Rect(Round(Pos.X), Round(Pos.Y), Round(FWebControl.Width * FScale), Round(FWebControl.Height *
        FScale));
      if FWebControl.Visible and FWebControl.ParentedVisible and
        (TCommonCustomForm(FWebControl.Root.GetObject)).Visible and
        (TCommonCustomForm(FWebControl.Root.GetObject)).Active then
        Show
      else
        Hide;
    end
    else
      Hide;
  end;
end;

{ TAndroidWBService }

function TAndroidWBService.DoCreateWebBrowser: ICustomBrowser;
var
  Browser : TAndroidWebBrowserService;
begin
  Browser := TAndroidWebBrowserService.Create;
  Result := Browser;
end;

{ TAndroidWebBrowserService.TWebBrowserListener }

constructor TAndroidWebBrowserService.TWebBrowserListener.Create(
  AWBService: TAndroidWebBrowserService);
begin
  inherited Create;
  FWBService := AWBService;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.doUpdateVisitedHistory(
  P1: JWebView; P2: JString; P3: Boolean);
begin

end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onFormResubmission(
  P1: JWebView; P2, P3: JMessage);
begin

end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onLoadResource(
  P1: JWebView; P2: JString);
begin

end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onPageFinished(
  P1: JWebView; P2: JString);
begin
  //已经释放了 - kngstr
  if FWBService.FWebControl = nil then
    Exit;

  FWBService.FURL := JStringToString(P2);
  FWBService.FinishLoading;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onPageStarted(
  P1: JWebView; P2: JString; P3: JBitmap);
begin
  //已经释放了 - kngstr
  if FWBService.FWebControl = nil then
    Exit;

  FWBService.FURL := JStringToString(P2);
  FWBService.StartLoading;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onReceivedError(
  P1: JWebView; P2: Integer; P3, P4: JString);
begin
  //已经释放了 - kngstr
  if FWBService.FWebControl = nil then
    Exit;

  FWBService.FailLoadingWithError;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onReceivedHttpAuthRequest(
  P1: JWebView; P2: JHttpAuthHandler; P3, P4: JString);
begin

end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onReceivedSslError(
  P1: JWebView; P2: JSslErrorHandler; P3: JSslError);
begin
  //已经释放了 - kngstr
  if FWBService.FWebControl = nil then
    Exit;

  FWBService.FailLoadingWithError;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onScaleChanged(
  P1: JWebView; P2, P3: Single);
begin

end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onUnhandledKeyEvent(
  P1: JWebView; P2: JKeyEvent);
begin

end;

function TAndroidWebBrowserService.TWebBrowserListener.shouldOverrideKeyEvent(
  P1: JWebView; P2: JKeyEvent): Boolean;
begin
  Result := False;
end;

function TAndroidWebBrowserService.TWebBrowserListener.shouldOverrideUrlLoading(
  P1: JWebView; P2: JString): Boolean;
begin
  //已经释放了 - kngstr
  if FWBService.FWebControl = nil then
    Exit;

  FWBService.ShouldStartLoading(JStringToString(P2));
  //Fix 重定向关键字
  if (FWBService.FRedirectionKey <> '') and
    (Pos(FWBService.FRedirectionKey,
      TNetEncoding.URL.Decode(JStringToString(P2))) <> 0) then
  begin
    P1.stopLoading;
    if (not TOSVersion.Check(4, 2)) then
    begin
      P1.loadUrl(StringToJString(
        'javascript:' + 'window.stop ? window.stop() : document.execCommand("Stop");'));
    end;
    Result := True;
    Exit;
  end;
  Result := False;
end;

{ TAndroidWebBrowserService.TFocusChangeListener }

constructor TAndroidWebBrowserService.TFocusChangeListener.Create(const Service: TAndroidWebBrowserService);
begin
  inherited Create;
  FService := Service;
end;

procedure TAndroidWebBrowserService.TFocusChangeListener.onFocusChange(v: JView; hasFocus: Boolean);
begin
  if hasFocus then
  begin
    // add from OrangeUI
    TThread.Queue(nil, procedure begin
      if (FService.FWebControl <> nil) and FService.FWebControl.CanFocus then
        FService.FWebControl.SetFocus;
    end);
  end
  else
    v.clearFocus;
end;

end.

