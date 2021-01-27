{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.WebBrowser.Cocoa;

interface

{$SCOPEDENUMS ON}
/// <summary>
/// Registration service for support native browser
/// </summary>
procedure RegisterWebBrowserService;
/// <summary>
/// Unregistering service
/// </summary>
procedure UnRegisterWebBrowserService;

implementation

uses
{$IFDEF IOS}
  iOSapi.UIKit, FMX.Helpers.iOS, FMX.Platform.iOS, iOSapi.Foundation, FMX.WebBrowser.Delegate.iOS, FMX.ZOrder.iOS,
{$ELSE}
  Macapi.WebKit, Macapi.Foundation, FMX.Platform.Mac, FMX.WebBrowser.Delegate.Mac, FMX.Helpers.Mac,
{$ENDIF IOS}
  System.Classes, System.Types, System.StrUtils, System.SysUtils, System.IOUtils, System.RTLConsts, System.Math,
  Macapi.ObjectiveC, Macapi.Helpers, FMX.Platform, FMX.WebBrowser, FMX.Types, FMX.Forms, FMX.Graphics, FMX.Surfaces;

type
  TCommonWebBrowserService = class;

  TCommonWBService = class(TWBFactoryService)
  protected
    function DoCreateWebBrowser: ICustomBrowser; override;
  end;

{ TCommonWebBrowserService }

  TCommonWebBrowserService = class(TInterfacedObject, ICustomBrowser)
  private
    FWebView: INativeWebView;
    FURL: string;
    FWebControl: TCustomWebBrowser;
    FNSCachePolicy: NativeCachePolicy;
    FDelegate: WebDelegate;
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
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
    procedure DoStop;
    { IFMXWebBrowserService }
    function GetURL: string;
    function GetCanGoBack: Boolean;
    function GetCanGoForward: Boolean;
    function GetEnableCaching: Boolean;
    procedure SetEnableCaching(const Value: Boolean);
    procedure SetURL(const AValue: string);
    procedure SetWebBrowserControl(const AValue: TCustomWebBrowser);
    procedure Navigate;
    procedure Reload;
    procedure Stop;
    procedure LoadFromStrings(const Content: string; const BaseUrl: string);
    procedure EvaluateJavaScript(const JavaScript: string);
    procedure GoBack;
    procedure GoForward;
    procedure GoHome;
  public
    constructor Create;
    destructor Destroy; override;
    property EnableCaching: Boolean read GetEnableCaching write SetEnableCaching default True;
    property URL: string read GetURL write SetURL;
    property CanGoBack: Boolean read GetCanGoBack;
    property CanGoForward: Boolean read GetCanGoForward;
    function CaptureBitmap: TBitmap;
  end;

var
  WBService: TCommonWBService;

procedure RegisterWebBrowserService;
begin
  WBService := TCommonWBService.Create;
  TPlatformServices.Current.AddPlatformService(IFMXWBService, WBService);
end;

procedure UnregisterWebBrowserService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXWBService);
end;

function TCommonWebBrowserService.GetCanGoBack: Boolean;
begin
  Result := False;
  if FWebView <> nil then
    Result := FWebView.canGoBack;
end;

function TCommonWebBrowserService.GetCanGoForward: Boolean;
begin
  Result := False;
  if FWebView <> nil then
    Result := FWebView.canGoForward;
end;

function TCommonWebBrowserService.GetEnableCaching: Boolean;
begin
  Result := FNSCachePolicy = NSURLRequestReloadRevalidatingCacheData;
end;

function TCommonWebBrowserService.CaptureBitmap: TBitmap;
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

function TCommonWebBrowserService.GetParent: TFmxObject;
begin
  Result := FWebControl.Parent;
end;

function TCommonWebBrowserService.GetURL: string;
begin
  Result := FURL;
end;

function TCommonWebBrowserService.GetVisible: Boolean;
begin
  Result := False;
  if FWebControl <> nil then
    Result := FWebControl.Visible;
end;

procedure TCommonWebBrowserService.GoBack;
begin
  DoGoBack;
end;

procedure TCommonWebBrowserService.GoForward;
begin
  DoGoForward;
end;

procedure TCommonWebBrowserService.GoHome;
begin

end;

procedure TCommonWebBrowserService.Hide;
begin
  if (FWebView <> nil) and (not FWebView.isHidden) then
    FWebView.setHidden(True);
end;

procedure TCommonWebBrowserService.LoadFromStrings(const Content: string; const BaseUrl: string);
var
  LContent: NSString;
  LURL: NSURL;
  LBase: NSString;
begin
  LContent := StrToNSStr(Content);
  LBase := StrToNSStr(baseUrl);
  LURL := TNSUrl.Wrap(TNSUrl.OCClass.URLWithString(LBase));
  TNativeWebViewHelper.MainFrame(FWebView).loadHTMLString(LContent, LURL);
  FWebView.setFrame(CGRectFromRect(TRectF.Create(0, 0, 1, 1)));
  UpdateContentFromControl;
end;

procedure TCommonWebBrowserService.EvaluateJavaScript(const JavaScript: string);
var
  LJavaScript: NSString;
begin
  LJavaScript := StrToNSStr(JavaScript);
  FWebView.stringByEvaluatingJavaScriptFromString(LJavaScript);
end;

procedure TCommonWebBrowserService.Navigate;
begin
  DoNavigate(URL);
end;

procedure TCommonWebBrowserService.PrepareForDestruction;
begin

end;

function TCommonWebBrowserService.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := inherited QueryInterface(IID, Obj);
  if (Result <> S_OK) and (FWebView <> nil) then
    Result := FWebView.QueryInterface(IID, Obj);
end;

procedure TCommonWebBrowserService.Reload;
begin
  DoReload;
end;

procedure TCommonWebBrowserService.SetEnableCaching(const Value: Boolean);
begin
  if Value then
    FNSCachePolicy := NSURLRequestReloadRevalidatingCacheData
  else
    FNSCachePolicy := NSURLRequestReloadIgnoringLocalCacheData;
end;

procedure TCommonWebBrowserService.SetURL(const AValue: string);
begin
  if FURL <> AValue then
    FURL:= AValue;
end;

procedure TCommonWebBrowserService.SetWebBrowserControl(const AValue: TCustomWebBrowser);
var
  LDelegate: TWebViewDelegate;
begin
  FWebControl := AValue;
  LDelegate := TWebViewDelegate.Create;
  LDelegate.SetWebBrowser(FWebControl, Self);
  FDelegate := LDelegate;
  TNativeWebViewHelper.SetDelegate(FWebView, (FDelegate as ILocalObject).GetObjectID);
end;

procedure TCommonWebBrowserService.Show;
begin
  if (FWebView <> nil) and (FWebView.isHidden) then
    FWebView.setHidden(False);
end;

procedure TCommonWebBrowserService.Stop;
begin
  DoStop;
end;

constructor TCommonWebBrowserService.Create;
begin
  FWebView := TNativeWebViewHelper.CreateAndInitWebView;
  FNSCachePolicy := NSURLRequestReloadRevalidatingCacheData;
end;

destructor TCommonWebBrowserService.Destroy;
begin
  {$IFDEF IOS}
    if (FWebControl <> nil) and (FWebControl.Root is TCommonCustomForm) then
      WindowHandleToPlatform(TCommonCustomForm(FWebControl.Root).Handle).ZOrderManager.RemoveLink(FWebControl);
    if FWebView.isLoading then
      FWebView.stopLoading;
    FWebView.setDelegate(nil);
  {$ELSE}
    FWebView.setDownloadDelegate(nil);
  {$ENDIF}
  FWebView.removeFromSuperview;
  FWebView := nil;
  FDelegate := nil;
  inherited;
end;

procedure TCommonWebBrowserService.DoGoBack;
begin
  inherited;
  if (FWebView <> nil) and (FWebView.canGoBack = True)then
  begin
    FWebView.GoBack;
    UpdateContentFromControl;
  end;
end;

procedure TCommonWebBrowserService.DoGoForward;
begin
  inherited;
  if (FWebView <> nil) and (FWebView.canGoForward = True)then
  begin
    FWebView.GoForward;
    UpdateContentFromControl;
  end;
end;

procedure TCommonWebBrowserService.DoNavigate(const URL: string);
const
  cTheTimeoutIntervalForNewRequest = 0;
var
  NewURL: string;
  NSNewURL: NSURL;
  NSNewURLRequest: NSURLRequest;
  LPath: NSString;
  LFilePath: string;
  LDir, LFileName: string;
  Bundle: Pointer;
begin
  NewURL := URL;
  if Pos(TWebBrowser.FilesPref, URL) <> 0 then
  begin
    //extract the file name, the string after file://
    NewURL := Copy(URL, length(TWebBrowser.FilesPref) + 1, length(URL));
    LDir := ExtractFileDir(NewURL);
    LFileName := ExtractFileName(NewURL);
    if LDir.IsEmpty then
      Bundle := TNSBundle.OCClass.mainBundle
    else
      Bundle := TNSBundle.OCClass.bundleWithPath(StrToNSStr(LDir));
    LPath := TNSBundle.Wrap(Bundle).pathForResource(StrToNSStr(LFileName), nil);
    if LPath <> nil then
    begin
      LFilePath := NSStrToStr(LPath);
      NSNewURL := TNSURL.Wrap(TNSURL.OCClass.fileURLWithPath(LPath));
    end
    else
      raise EFileNotFoundException.Create(SFileNotFound);
  end
  else
  begin
    if Pos('http', URL) = 0 then
      Insert('http://', NewURL, 0);
    NSNewURL := TNSUrl.Wrap(TNSUrl.OCClass.URLWithString(StrToNSStr(NewURL)));
  end;
  NSNewURLRequest:= TNSURLRequest.Wrap(TNSURLRequest.OCClass.requestWithURL(NSNewURL, FNSCachePolicy,
    cTheTimeoutIntervalForNewRequest));
  TNativeWebViewHelper.MainFrame(FWebView).loadRequest(NSNewURLRequest);
  FWebView.setFrame(CGRectFromRect(TRectF.Create(0, 0, 1, 1)));
  UpdateContentFromControl;
end;

procedure TCommonWebBrowserService.DoReload;
begin
  if FWebView <> nil then
    TNativeWebViewHelper.MainFrame(FWebView).reload;
end;

procedure TCommonWebBrowserService.DoStop;
begin
  if (FWebView <> nil) and FWebView.isLoading then
    TNativeWebViewHelper.MainFrame(FWebView).stopLoading;
end;

procedure TCommonWebBrowserService.UpdateContentFromControl;
var
  Form: TCommonCustomForm;
  {$IFDEF IOS}
  ZOrderManager: TiOSZOrderManager;
  {$ELSE}
  View: INativeView;
  Bounds: TRectF;
  {$ENDIF}
begin
  if FWebView <> nil then
  begin
    if (FWebControl <> nil) and not (csDesigning in FWebControl.ComponentState) and
       (FWebControl.Root is TCommonCustomForm) then
    begin
      Form := TCommonCustomForm(FWebControl.Root);
      {$IFDEF IOS}
      ZOrderManager := WindowHandleToPlatform(Form.Handle).ZOrderManager;
      ZOrderManager.UpdateOrderAndBounds(FWebControl, FWebView);
      {$ELSE}
      Bounds := TRectF.Create(0,0,FWebControl.Width,FWebControl.Height);
      Bounds.Fit(FWebControl.AbsoluteRect);
      View := WindowHandleToPlatform(Form.Handle).View;
      View.addSubview(FWebView);
      if SameValue(Bounds.Width, 0) or SameValue(Bounds.Height, 0) then
        FWebView.setHidden(True)
      else
      begin
        TNativeWebViewHelper.SetBounds(FWebView, Bounds, View.bounds.size.height);
        FWebView.setHidden(not FWebControl.ParentedVisible);
      end;
      {$ENDIF}
    end
    else
      FWebView.setHidden(True);
  end;
end;

{ TCommonWBService }

function TCommonWBService.DoCreateWebBrowser: ICustomBrowser;
begin
  Result := TCommonWebBrowserService.Create;
end;

end.
