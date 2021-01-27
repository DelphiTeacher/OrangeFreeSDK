unit SG.WebBrowserHelper;

interface

uses
  FMX.WebBrowser;

type
  TWebBrowserHelper = class helper for TWebBrowser
  public
    function GetField<T>(const iField: String): T;
    procedure SetForHybridApp;
    procedure SetUserAgent(const iUA: String);
    function CheckBack(const iKey: Word): Boolean;
    procedure Hide;
    procedure Show;
  end;

implementation

uses
  System.UITypes
  , System.Rtti
  , System.Generics.Collections
  , FMX.Types
  , FMX.Forms
  , FMX.Platform
  , FMX.VirtualKeyboard
  {$IFDEF ANDROID}
  , Androidapi.JNI.JavaTypes
  , Androidapi.JNI.Embarcadero
  , Androidapi.JNI.Webkit
  , Androidapi.JNI.GraphicsContentViewText
  , Androidapi.Helpers
  , FMX.Helpers.Android
  {$ENDIF}
  {$IFDEF IOS}
  , iOSapi.UIKit
  {$ENDIF}
  ;

type
  TBrowserProps = record
    Align: TAlignLayout;
    X: Single;
  end;
  TBrowserPropsDic = TDictionary<TWebBrowser, TBrowserProps>;

var
  GBrowserProps: TBrowserPropsDic;

{ TWebBrowserHelper }

function TWebBrowserHelper.CheckBack(const iKey: Word): Boolean;
var
  FService : IFMXVirtualKeyboardService;
begin
  Result := False;

  if (iKey = vkHardwareBack) then
  begin
    TPlatformServices.Current.SupportsPlatformService(
      IFMXVirtualKeyboardService,
      IInterface(FService));

    if
      (FService <> nil) and
      (TVirtualKeyboardState.Visible in FService.VirtualKeyBoardState)
    then
    begin
      // キーボード隠すので何もしない
      Result := True;
    end
    else
    begin
      if (Self.CanGoBack) then
      begin
        Self.GoBack;
        Result := True;
      end;
    end;
  end
end;

function TWebBrowserHelper.GetField<T>(const iField: String): T;
var
  RttiType: TRttiType;
  RttiField: TRttiField;
  Browser: ICustomBrowser;
  Obj: TObject;
begin
  Result := T(nil);

  // ICustomBrowser の取得
  RttiType := SharedContext.GetType(ClassType);
  if (RttiType = nil) then
    Exit;

  RttiField := RttiType.GetField('FWeb');
  if (RttiField = nil) then
    Exit;

  Browser := ICustomBrowser(RttiField.GetValue(Self).AsInterface);
  if (Browser = nil) then
    Exit;

  // WebView Interface の取得
  Obj := Browser as TObject;
  RttiType := SharedContext.GetType(Obj.ClassType);
  if (RttiType = nil) then
    Exit;

  RttiField := RttiType.GetField(iField);
  if (RttiField = nil) then
    Exit;

  Result := RttiField.GetValue(Obj).AsType<T>;
end;

procedure TWebBrowserHelper.Hide;
var
  Props: TBrowserProps;
begin
  if (Self.Parent = nil) then
    Exit;

  Props.Align := Self.Align;
  Props.X := Self.Position.X;

  GBrowserProps.AddOrSetValue(Self, Props);

  Self.Align := TAlignLayout.None;
  Self.SetBounds(Screen.Width, Position.Y, Width, Height);
end;

procedure TWebBrowserHelper.SetForHybridApp;
{$IFDEF ANDROID}
begin
  if (GetField<JWebBrowser>('FJWebBrowser') <> nil) then
  begin
    CallInUIThread(
      procedure
      var
        WebBrowser: JWebBrowser;
      begin
        WebBrowser := GetField<JWebBrowser>('FJWebBrowser');
        WebBrowser.getSettings.setCacheMode(TJWebSettings.JavaClass.LOAD_DEFAULT);
        WebBrowser.setOverScrollMode(TJView.JavaClass.OVER_SCROLL_NEVER);
        WebBrowser.getSettings.setBuiltInZoomControls(False);
        WebBrowser.getSettings.setLoadWithOverviewMode(True);
        WebBrowser.getSettings.setUseWideViewPort(True);
      end
    );
  end;
end;
{$ELSE}
  {$IFDEF IOS}
  var
    WebView: UIWebView;
  begin
    WebView := GetField<UIWebView>('FWebView');
    if (WebView <> nil) then
      WebView.scrollView.setBounces(False);
  end;
  {$ELSE}
  begin
  end;
  {$ENDIF}
{$ENDIF}

procedure TWebBrowserHelper.SetUserAgent(const iUA: String);
{$IFDEF ANDROID}
var
  WebBrowser: JWebBrowser;
begin
    WebBrowser := GetField<JWebBrowser>('FJWebBrowser');
    if (WebBrowser <> nil) then
      WebBrowser.getSettings.setUserAgentString(StringToJString(iUA));
end;
{$ELSE}
begin
end;
{$ENDIF}

procedure TWebBrowserHelper.Show;
var
  Props: TBrowserProps;
begin
  if (Self.Parent = nil) then
    Exit;

  if (GBrowserProps.TryGetValue(Self, Props)) then
  begin
    Self.SetBounds(Props.X, Position.Y, Width, Height);
    Self.Align := Props.Align;
  end;
end;


initialization
  GBrowserProps := TBrowserPropsDic.Create;

finalization
  GBrowserProps.DisposeOf;

end.
