{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.WebBrowser.Android;

interface



{$SCOPEDENUMS ON}

var
  WebBrowserSystemStatusBarHeight:Integer;

{$IFDEF ANDROID}

procedure RegisterWebBrowserService;
procedure UnRegisterWebBrowserService;
{$ENDIF ANDROID}

implementation

{$IFDEF ANDROID}
uses
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
    function GetParent: TFmxObject;
    function GetVisible: Boolean;
    procedure Show;
    procedure Hide;
    procedure PrepareForDestruction;
    procedure UpdateContentFromControl;
    procedure DoNavigate(const URL: string);
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
    procedure EvaluateJavaScript(const JavaScript: string);
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
  CallInUIThreadAndWaitFinishing(procedure begin
    CanGoBack := FJWebBrowser.canGoBack;
  end);
  Result := CanGoBack;
end;

function TAndroidWebBrowserService.GetCanGoForward: Boolean;
var
  CanGoForward: Boolean;
begin
  CallInUIThreadAndWaitFinishing(procedure begin
    CanGoForward := FJWebBrowser.canGoForward;
  end);
  Result := CanGoForward;
end;

function TAndroidWebBrowserService.GetEnableCaching: Boolean;
var
  CacheEnable : Boolean;
begin
  CallInUIThreadAndWaitFinishing(procedure begin
    CacheEnable := FJWebBrowser.getSettings.getCacheMode = TJWebSettings.JavaClass.LOAD_CACHE_ELSE_NETWORK;
  end);
  Result := CacheEnable;
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
  Result := False;
  if FWebControl <> nil then
    Result := FWebControl.Visible;
end;

procedure TAndroidWebBrowserService.GoBack;
begin
  CallInUIThread(DoGoBack);
end;

procedure TAndroidWebBrowserService.GoForward;
begin
  CallInUIThread(DoGoForward);
end;

procedure TAndroidWebBrowserService.GoHome;
begin

end;

procedure TAndroidWebBrowserService.Hide;
begin
  CallInUIThread(
    procedure
    begin
      if FJWebBrowser.getVisibility <> TJView.JavaClass.INVISIBLE then
      begin
        FJWebBrowser.setVisibility(TJView.JavaClass.INVISIBLE);
        FJNativeLayout.setPosition(FRealBounds.Right * 2 , FRealBounds.Height * 2);
      end;
    end);
end;

procedure TAndroidWebBrowserService.InitUIThread;
begin
  FMX.Types.Log.d('OrangeUI TAndroidWebBrowserService.InitUIThread');

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
  CallInUIThreadAndWaitFinishing(procedure begin
    FJWebBrowser.loadUrl(StringToJString(URL));
  end);
end;

procedure TAndroidWebBrowserService.EvaluateJavaScript(const JavaScript: string);
begin
  LoadURLInUIThread('javascript:' + JavaScript);
  UpdateContentFromControl;
end;

procedure TAndroidWebBrowserService.Navigate;
begin
  DoNavigate(URL);
end;

procedure TAndroidWebBrowserService.PrepareForDestruction;
begin
  TUIThreadCaller.ForceRunnablesCollection;
end;

procedure TAndroidWebBrowserService.Reload;
begin
  DoReload;
end;

procedure TAndroidWebBrowserService.SetEnableCaching(const Value: Boolean);
begin
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
  TUIThreadCaller.Call<Boolean>(
    procedure (B: boolean)
    begin
      FJWebBrowser.setFocusable(B);
    end, FWebControl.CanFocus);
end;

procedure TAndroidWebBrowserService.ShouldStartLoading(const URL: string);
begin
  TThread.Queue(nil, procedure begin
    if FWebControl <> nil then
      FWebControl.ShouldStartLoading(URL);
  end);
end;

procedure TAndroidWebBrowserService.Show;
begin
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
  TThread.Queue(nil, procedure begin
    if FWebControl <> nil then
      FWebControl.StartLoading;
  end);
end;

procedure TAndroidWebBrowserService.Stop;
begin
  CallInUIThread(procedure begin
    FJWebBrowser.stopLoading;
  end);
end;

procedure TAndroidWebBrowserService.CalcRealBorder;
var
  NativeWin: JWindow;
  ContentRect: JRect;
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

  FMX.Types.Log.d('OrangeUI TAndroidWebBrowserService.CalcRealBorder FRealBounds.Top '+IntToStr(FRealBounds.top));
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
  CallInUIThreadAndWaitFinishing(InitUIThread);
  SetEnableCaching(True);
end;

procedure TAndroidWebBrowserService.DoGoBack;
begin
  inherited;
  FJWebBrowser.goBack;
end;

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
  CallInUIThread(procedure begin
    FJWebBrowser.reload;
  end);
end;

procedure TAndroidWebBrowserService.FailLoadingWithError;
begin
  TThread.Queue(nil, procedure begin
    if FWebControl <> nil then
      FWebControl.FailLoadingWithError;
  end);
end;

procedure TAndroidWebBrowserService.FinishLoading;
begin
  TThread.Queue(nil, procedure begin
    if FWebControl <> nil then
      FWebControl.FinishLoading;
  end);
end;

destructor TAndroidWebBrowserService.Destroy;
begin
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
      FBounds := Rect(Round(Pos.X),


                      Round(Pos.Y)
                      //wn
                      //修复Android任务栏透明的情况下,会下移
                      -Round(WebBrowserSystemStatusBarHeight*FScale)
                      ,

                      Round(FWebControl.Width * FScale),
                      Round(FWebControl.Height *
        FScale));

      FMX.Types.Log.d('OrangeUI TAndroidWebBrowserService.UpdateContentFromControl FBounds.Top '+IntToStr(Round(Pos.Y)));

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
  FWBService.FURL := JStringToString(P2);
  FWBService.FinishLoading;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onPageStarted(
  P1: JWebView; P2: JString; P3: JBitmap);
begin
  FWBService.FURL := JStringToString(P2);
  FWBService.StartLoading;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onReceivedError(
  P1: JWebView; P2: Integer; P3, P4: JString);
begin
  FWBService.FailLoadingWithError;
end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onReceivedHttpAuthRequest(
  P1: JWebView; P2: JHttpAuthHandler; P3, P4: JString);
begin

end;

procedure TAndroidWebBrowserService.TWebBrowserListener.onReceivedSslError(
  P1: JWebView; P2: JSslErrorHandler; P3: JSslError);
begin
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
  FWBService.ShouldStartLoading(JStringToString(P2));
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
    TThread.Queue(nil, procedure begin
      if FService.FWebControl.CanFocus  then
        FService.FWebControl.SetFocus;
    end);
  end
  else begin
    v.clearFocus;
  end;
end;
{$ENDIF ANDROID}

end.


