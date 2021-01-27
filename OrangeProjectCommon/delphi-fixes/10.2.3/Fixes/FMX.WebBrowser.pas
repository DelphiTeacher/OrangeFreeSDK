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

////不推荐本解决方案了。
////http://bbs.2ccc.com/topic.asp?topicid=544553
////https://bitbucket.org/freeonterminate/scriptgate
////推荐用上面的解决方案。

////但是 本修改，依然有其他作用。
////1. 修改部分 bug（如果有的话）
////2. 新增 跨平台属性 GetRealWebBrowserObject 获取各个平台下 原生的 浏览器对象。

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　重定向功能 完全来自 [重庆]新手(371889755)　　 *)
(*　重定向功能 全靠 [龟山]阿卍(1467948783) 帮忙测试 *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

// 重定向 Redirection 功能 完全来自 [重庆]新手(371889755)
// IOS MAC 安卓的 重定向 全靠 [龟山]阿卍(1467948783) 帮忙测试
// 下面就不具体写 新手的 ID 了。
// 请在 OnShouldStartLoadWithRequest 事件中处理 重定向。
// 一定要用 TNetEncoding.URL.Decode(URL) 来处理 URL 否则会失败。
// 要 uses System.NetEncoding,
// 请设置好 RedirectionKey，千万不要用 URL 上的一些关键字，也不要用特殊字符。
// 特别不要用 http: ftp:  file: 等。可以使用 MyURL:// 这样特殊的关键字。
// 我目前用 wwwwww 做关键字，比较好。
// 测试用 wwwwww.xxx.com
// 你发送的 url 中，千万也不要有 http: ftp: file: 等在 mac osx 系统上，带有这些，会导致打开网页。

// GetRealWebBrowserObject 是新增的跨平台的属性。
// 下面是 GetRealWebBrowserObject 在安卓下的 例子
// (WebBrowser1.GetRealWebBrowserObject as JWebBrowser).getSettings.setUserAgentString(StringToJString('你的UserAgent'));


// FMX.WebBrowser. 开头的几个，他们是一套的。
// FMX.Platform. 开头的几个，是不得不加入的。
// FMX.InertialMovement、FMX.ImgList 也是不得不加入的。
// FMX.Platform.pas ，如果您没有修改过，请不要加入

{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2012-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.WebBrowser;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.SysUtils, System.Generics.Collections, System.Messaging, FMX.Types, FMX.Controls, FMX.Graphics;

type
  EWebManagerException = class(Exception);

  TCustomWebBrowser = class;

  //Fix By Flying Wang and 爱吃猪头肉
  TWebBrowserDidEvaluateJavaScript = reference to procedure (const AResult: string);

  TWebBrowserDidStartLoad = procedure(ASender: TObject) of object;
  TWebBrowserDidFinishLoad = procedure(ASender: TObject) of object;
  TWebBrowserDidFailLoadWithError = procedure(ASender: TObject) of object;
  TWebBrowserShouldStartLoadWithRequest = procedure(ASender: TObject; const URL: string) of object;

{ IFMXWebBrowserService }

  ICustomBrowser = interface(IInterface)
  ['{A5BB2E8C-6D53-4FF3-BC38-2299285F07BD}']
    function GetURL: string;
    function CaptureBitmap: TBitmap;
    function GetCanGoBack: Boolean;
    function GetCanGoForward: Boolean;
    procedure SetURL(const AValue: string);
    function GetEnableCaching: Boolean;
    procedure SetEnableCaching(const Value : Boolean);
    procedure SetWebBrowserControl(const AValue: TCustomWebBrowser);
    function GetParent: TFmxObject;
    function GetVisible : Boolean;
    procedure UpdateContentFromControl;
    procedure Navigate;
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
    property RedirectionKey: string read GetRedirectionKey write  SetRedirectionKey;
    procedure LoadFromStrings(const Content: string; const BaseUrl: string);
    procedure GoBack;
    procedure GoForward;
    procedure GoHome;
    procedure Show;
    procedure Hide;
    /// <summary>
    ///   Method should be called before destruction of native control
    /// </summary>
    procedure PrepareForDestruction;                                           
    property URL: string read GetURL write SetURL;
    property EnableCaching: Boolean read GetEnableCaching write SetEnableCaching;
    property CanGoBack: Boolean read GetCanGoBack;
    property CanGoForward: Boolean read GetCanGoForward;
  end;

{ IFMXWBService }

  IFMXWBService = interface (IInterface)
    ['{61BC1956-BAA0-4B07-971D-EF40064FBD07}']
    function CreateWebBrowser: ICustomBrowser;
    procedure RealignBrowsers;
    procedure DestroyWebBrowser(const AWebBrowser: ICustomBrowser);
  end;

  { TCustomWebBrowser }

  TCustomWebBrowser = class(TControl)
  private
    procedure FormHandleCreated(const Sender: TObject; const Msg: TMessage);
  private
    //Fix 重定向 关键字
    FRedirectionKey: string;
    FWeb: ICustomBrowser;
    FURL: string;
    FEnableCaching: Boolean;
    FOnDidStartLoad: TWebBrowserDidStartLoad;
    FOnDidFinishLoad: TWebBRowserDidFinishLoad;
    FOnDidFailLoadWithError: TWebBrowserdidFailLoadWithError;
    FOnShouldStartLoadWithRequest: TWebBrowsershouldStartLoadWithRequest;
    FSavedVisible: Boolean;
    function GetURL: string;
    function GetCanGoBack: Boolean;
    function GetCanGoForward: Boolean;
    procedure SetURL(const Value: string);
    procedure UpdateContent;
    function GetEnableCaching: Boolean;
    procedure SetEnableCaching(const Value: Boolean);
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; override; stdcall;
    procedure AncestorVisibleChanged(const Visible: Boolean); override;
    procedure ParentChanged; override;
    procedure DoAbsoluteChanged; override;
    procedure Move; override;
    procedure Resize; override;
    procedure Paint; override;
    procedure Show; override;
    procedure Hide; override;
    procedure ChangeOrder; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    // getters and setters for web browser events
    function GetOnDidStartLoad: TWebBrowserDidStartLoad;
    procedure SetOnDidStartLoad(const AEvent: TWebBrowserDidStartLoad);
    function GetOnDidFinishLoad: TWebBrowserDidFinishLoad;
    procedure SetOnDidFinishLoad(const AEvent: TWebBrowserDidFinishLoad);
    function GetOnShouldStartLoadWithRequest: TWebBrowserShouldStartLoadWithRequest;
    procedure SetOnShouldStartLoadWithRequest(const AEvent: TWebBrowserShouldStartLoadWithRequest);
    function GetOnDidFailLoadWithError: TWebBrowserDidFailLoadWithError;
    procedure SetOnDidFailLoadWithError(const AEvent: TWebBrowserDidFailLoadWithError);
    procedure SetVisible(const Value: Boolean); override;
    //Fix 重定向关键字，如果包含这个关键字 页面不刷新
    //解析 重定向字符串
    function GetRedirectionKey: string;
    procedure SetRedirectionKey(const Value:string);
  public
    const FilesPref = 'file://';
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure StartLoading;
    procedure FinishLoading;
    procedure FailLoadingWithError;
    procedure ShouldStartLoading(const URL: string);
    function CaptureBitmap: TBitmap;
    procedure GoBack;
    procedure GoForward;
    procedure Navigate; overload;
    procedure Navigate(const AURL: string); overload;
    procedure Reload; overload;
    procedure Stop;
    procedure LoadFromStrings(const Content: string; const BaseUrl: string);
//    procedure EvaluateJavaScript(const JavaScript: string);
    //Fix By Flying Wang and 爱吃猪头肉
    procedure EvaluateJavaScript(const JavaScript: string;
      DidEvaluateJavaScript: TWebBrowserDidEvaluateJavaScript = nil);
    //Fix or Add By 爱吃猪头肉
    //procedure addJavascriptInterface(AFunction: TProc ; Name: string);
    //Fix or Add By 爱吃猪头肉
    function GetRealWebBrowserObject: IUnknown;
    property RedirectionKey: string read GetRedirectionKey write  SetRedirectionKey;
    property EnableCaching: Boolean read GetEnableCaching write SetEnableCaching default True;
    property URL: string read GetURL write SetURL;
    property CanGoBack: Boolean read GetCanGoBack default False;
    property CanGoForward: Boolean read GetCanGoForward default False;

    property OnDidStartLoad: TWebBrowserDidStartLoad read GetOnDidStartLoad write SetOnDidStartLoad;
    property OnDidFinishLoad: TWebBrowserDidFinishLoad read GetOnDidFinishLoad write SetOnDidFinishLoad;
    property OnShouldStartLoadWithRequest: TWebBrowserShouldStartLoadWithRequest read GetOnShouldStartLoadWithRequest
      write SetOnShouldStartLoadWithRequest;
    property OnDidFailLoadWithError: TWebBrowserDidFailLoadWithError read GetOnDidFailLoadWithError
      write SetOnDidFailLoadWithError;
  end;

{ TWBFactoryService }

  TWBFactoryService = class abstract (TInterfacedObject, IFMXWBService)
  private
    procedure FormActivateHandler(const Sender: TObject; const M: TMessage);
  protected
    FWebBrowsers: TList<ICustomBrowser>;
    function DoCreateWebBrowser: ICustomBrowser; virtual; abstract;
    procedure DoRemoveWebBrowser(const AWebBrowser: ICustomBrowser);
    procedure RealignBrowsers;
  public
    constructor Create;
    destructor Destroy; override;
    function CreateWebBrowser: ICustomBrowser;
    procedure DestroyWebBrowser(const AWebBrowser: ICustomBrowser);
  end;

{ TWebBrowser }
  TWebBrowser = class(TCustomWebBrowser)
  published
    property EnableCaching default True;
    property Align;
    property Anchors;
    property Height;
    property Size;
    property Margins;
    property Position;
    property URL;
    property Visible default True;
    property CanFocus default True;
    property Width;
    property OnDidStartLoad;
    property OnDidFinishLoad;
    property OnDidFailLoadWithError;
    property OnShouldStartLoadWithRequest;
  end;

implementation

uses
  System.Types,
{$IFDEF ANDROID}
  FMX.WebBrowser.Android,
{$ENDIF ANDROID}
{$IF DEFINED(IOS) OR DEFINED(MACOS)}
  FMX.WebBrowser.Cocoa,
{$ENDIF}
{$IFDEF MSWINDOWS}
  FMX.WebBrowser.Win,
{$ENDIF MSWINDOWS}
  FMX.Platform, FMX.Forms;

{ TCustomWebBrowser }

procedure TCustomWebBrowser.AncestorVisibleChanged(const Visible: Boolean);
begin
  inherited;
  if FWeb <> nil then
    FWeb.UpdateContentFromControl;
end;

function TCustomWebBrowser.CaptureBitmap: TBitmap;
begin
  if FWeb <> nil then
    Result := FWeb.CaptureBitmap
  else
    Result := nil;
end;

constructor TCustomWebBrowser.Create(AOwner: TComponent);
var
  WBService : IFMXWBService;
begin
  inherited;
  TMessageManager.DefaultManager.SubscribeToMessage(TAfterCreateFormHandle, FormHandleCreated);
  CanFocus := True;
  FSavedVisible := True;
  EnableCaching := True;
  if not (csDesigning in ComponentState) and TPlatformServices.Current.SupportsPlatformService(IFMXWBService, WBService) then
  begin
    FWeb := WBService.CreateWebBrowser;
    FWeb.SetWebBrowserControl(Self);
  end;
end;

destructor TCustomWebBrowser.Destroy;
var
  WBService : IFMXWBService;
begin
  if not (csDesigning in ComponentState) and TPlatformServices.Current.SupportsPlatformService(IFMXWBService, WBService) then
    WBService.DestroyWebBrowser(FWeb);
  FWeb := nil;

  TMessageManager.DefaultManager.Unsubscribe(TAfterCreateFormHandle, FormHandleCreated);
  inherited;
end;

procedure TCustomWebBrowser.DoAbsoluteChanged;
begin
  inherited;
  if FWeb <> nil then
    FWeb.UpdateContentFromControl;
end;

procedure TCustomWebBrowser.FailLoadingWithError;
begin
  if Assigned(FOnDidFailLoadWithError) then
    FOnDidFailLoadWithError(Self);
end;

procedure TCustomWebBrowser.FinishLoading;
begin
  if Assigned(FOnDidFinishLoad) then
    FOnDidFinishLoad(Self);
end;

procedure TCustomWebBrowser.FormHandleCreated(const Sender: TObject; const Msg: TMessage);

  function GetParentForm(Control: TFmxObject): TCommonCustomForm;
  begin
    if (Control.Root <> nil) and (Control.Root.GetObject is TCommonCustomForm) then
      Result := TCommonCustomForm(Control.Root.GetObject)
    else
      Result := nil;
  end;

var
  WBService : IFMXWBService;
begin
  if not (csDesigning in ComponentState) and ((FWeb = nil) or (Sender = GetParentForm(self as TFmxObject))) and
    TPlatformServices.Current.SupportsPlatformService(IFMXWBService, WBService) then
  begin
//Fix And Add By 爱吃猪头肉.
//https://quality.embarcadero.com/browse/RSP-15869
    if FWeb = nil then
    FWeb := WBService.CreateWebBrowser;
    FWeb.SetWebBrowserControl(Self);
    FWeb.UpdateContentFromControl;
    FWeb.URL := FURL;
    FWeb.Navigate;
  end;
end;

function TCustomWebBrowser.GetCanGoBack: Boolean;
begin
  Result:= False;
  if FWeb <> nil then
    Result:= FWeb.CanGoBack;
end;

function TCustomWebBrowser.GetCanGoForward: Boolean;
begin
  Result:= False;
  if FWeb <> nil then
    Result:= FWeb.CanGoForward;
end;

function TCustomWebBrowser.GetEnableCaching: Boolean;
begin
  Result := FEnableCaching;
  if FWeb <> nil then
    Result := FWeb.EnableCaching;
end;

function TCustomWebBrowser.GetOnDidFailLoadWithError: TWebBrowserdidFailLoadWithError;
begin
  Result := FOnDidFailLoadWithError;
end;

function TCustomWebBrowser.GetOnDidFinishLoad: TWebBrowserDidFinishLoad;
begin
  Result := FOnDidFinishLoad;
end;

function TCustomWebBrowser.GetOnDidStartLoad: TWebBrowserDidStartLoad;
begin
  Result := FOnDidStartLoad;
end;

function TCustomWebBrowser.GetOnShouldStartLoadWithRequest: TWebBrowserShouldStartLoadWithRequest;
begin
  Result := FOnShouldStartLoadWithRequest;
end;

function TCustomWebBrowser.GetURL: string;
begin
  if (csDesigning in ComponentState) or (FWeb = nil) then
    Result := FURL
  else
    Result := FWeb.URL;
end;

procedure TCustomWebBrowser.GoBack;
begin
  if (FWeb <> nil) and FWeb.CanGoBack then
    FWeb.GoBack;
end;

procedure TCustomWebBrowser.GoForward;
begin
  if (FWeb <> nil) and FWeb.CanGoForward then
    FWeb.GoForward;
end;

procedure TCustomWebBrowser.ChangeOrder;
begin
  inherited;
  UpdateContent;
end;

procedure TCustomWebBrowser.Hide;
begin
  inherited;
  UpdateContent;
end;

procedure TCustomWebBrowser.LoadFromStrings(const Content: string; const BaseUrl: string);
begin
  if FWeb <> nil then
    FWeb.LoadFromStrings(Content, BaseUrl);
end;

//procedure TCustomWebBrowser.EvaluateJavaScript(const JavaScript: string);
//begin
//  if FWeb <> nil then
//    FWeb.EvaluateJavaScript(JavaScript);
//end;

//Fix By Flying Wang and 爱吃猪头肉
procedure TCustomWebBrowser.EvaluateJavaScript(const JavaScript: string;
      DidEvaluateJavaScript: TWebBrowserDidEvaluateJavaScript);
begin
  if FWeb <> nil then
    FWeb.EvaluateJavaScript(JavaScript, DidEvaluateJavaScript);
//    if Result = 'null' then
//      Result := '';
//    if (Result.Length  > 1) and (Result.IndexOf('"') = 0) and
//      (Result.SubString(Result.Length - 1, 1) = '"') then
//    begin
//      Result := Result.SubString(1, Result.Length - 2);
//    end;
end;

//Fix or Add By 爱吃猪头肉
function TCustomWebBrowser.GetRealWebBrowserObject: IUnknown;
begin
  Result := nil;
  if FWeb <> nil then
    Result := FWeb.GetRealWebBrowserObject;
end;

function TCustomWebBrowser.GetRedirectionKey: string;
begin
  if (csDesigning in ComponentState) or (FWeb = nil) then
    Result := FRedirectionKey
  else
    Result := FWeb.RedirectionKey;
end;

procedure TCustomWebBrowser.SetRedirectionKey(const Value: string);
begin
  if FRedirectionKey <> Value then
  begin
    FRedirectionKey:= Value;
    if FWeb <> nil then
      FWeb.RedirectionKey := Value;
  end;
end;

procedure TCustomWebBrowser.Move;
begin
  inherited;
  UpdateContent;
end;

procedure TCustomWebBrowser.Navigate(const AURL: string);
begin
  if FWeb <> nil then
    SetUrl(AURL);
end;

procedure TCustomWebBrowser.Navigate;
begin
  if FWeb <> nil then
    FWeb.Navigate;
end;

procedure TCustomWebBrowser.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
end;

procedure TCustomWebBrowser.Paint;
var
  R, DstR: TRectF;
  Bitmap: TBitmap;
begin
  if (csDesigning in ComponentState) and not Locked then
    DrawDesignBorder;
  if not (csDesigning in ComponentState) and FInPaintTo then
  begin
    Bitmap := CaptureBitmap;
    if Bitmap <> nil then
    begin
      R := TRectF.Create(0, 0, Bitmap.Width, Bitmap.Height);
      DstR := TRectF.Create(0, 0, Size.Width, Size.Height);
      Canvas.DrawBitmap(Bitmap, R, DstR, 1);
    end;
  end;
end;

procedure TCustomWebBrowser.ParentChanged;
begin
  inherited;
  if ([csLoading, csDesigning] * ComponentState) = [] then
  begin
    if HasParent then
      Visible := FSavedVisible
    else
    begin
      FSavedVisible := Visible;
      Visible := False;
    end;
    UpdateContent;
  end;
end;

function TCustomWebBrowser.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := inherited QueryInterface(IID, Obj);
  if (FWeb <> nil) and (Result <> S_OK) then
    Result := FWeb.QueryInterface(IID, Obj);
end;

procedure TCustomWebBrowser.Reload;
begin
  inherited;
  if FWeb <> nil then
    FWeb.Reload;
end;

procedure TCustomWebBrowser.Resize;
begin
  inherited;
  UpdateContent;
end;

procedure TCustomWebBrowser.SetEnableCaching(const Value: Boolean);
begin
  if FEnableCaching <> Value then
  begin
    FEnableCaching := Value;
    if not(csDesigning in ComponentState) and (FWeb <> nil) and (FWeb.EnableCaching <> Value) then
      FWeb.EnableCaching := FEnableCaching;
  end;
end;

procedure TCustomWebBrowser.SetOnDidFailLoadWithError(
  const AEvent: TWebBrowserdidFailLoadWithError);
begin
  FOnDidFailLoadWithError := AEvent;
end;

procedure TCustomWebBrowser.SetOnDidFinishLoad(const AEvent: TWebBrowserDidFinishLoad);
begin
  FOnDidFinishLoad := AEvent;
end;

procedure TCustomWebBrowser.SetOnDidStartLoad(const AEvent: TWebBrowserDidStartLoad);
begin
  FOnDidStartLoad := AEvent;
end;

procedure TCustomWebBrowser.SetOnShouldStartLoadWithRequest(const AEvent: TWebBrowserShouldStartLoadWithRequest);
begin
  FOnShouldStartLoadWithRequest := AEvent;
end;

procedure TCustomWebBrowser.SetURL(const Value: string);
begin
  if FURL <> Value then
    FURL:= Value;
  if not(csDesigning in ComponentState) then
  begin
    if FWeb <> nil then
      FWeb.URL := Value;
    Navigate;
  end;
end;

procedure TCustomWebBrowser.SetVisible(const Value: Boolean);
begin
  inherited;
end;

procedure TCustomWebBrowser.ShouldStartLoading(const URL: string);
begin
  if Assigned(FOnShouldStartLoadWithRequest) then
    FOnShouldStartLoadWithRequest(Self, URL);
end;

procedure TCustomWebBrowser.Show;
begin
  inherited;
  UpdateContent;
end;

procedure TCustomWebBrowser.StartLoading;
begin
  if Assigned(FOnDidStartLoad) then
    FOnDidStartLoad(Self);
end;

procedure TCustomWebBrowser.Stop;
begin
  if FWeb <> nil then
    FWeb.Stop;
end;

procedure TCustomWebBrowser.UpdateContent;
begin
  if FWeb <> nil then
    FWeb.UpdateContentFromControl;
end;

{ TWBFactoryService }

constructor TWBFactoryService.Create;
begin
  inherited Create;
  FWebBrowsers := TList<ICustomBrowser>.Create;
  TMessageManager.DefaultManager.SubscribeToMessage(TFormActivateMessage, FormActivateHandler);
end;

function TWBFactoryService.CreateWebBrowser: ICustomBrowser;
begin
  Result := DoCreateWebBrowser;
  FWebBrowsers.Add(Result);
end;

destructor TWBFactoryService.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TFormActivateMessage, FormActivateHandler);
  FWebBrowsers.Free;
  inherited Destroy;
end;

procedure TWBFactoryService.DestroyWebBrowser(const AWebBrowser: ICustomBrowser);
begin
  DoRemoveWebBrowser(AWebBrowser);
end;

procedure TWBFactoryService.DoRemoveWebBrowser(const AWebBrowser: ICustomBrowser);
begin
  if (FWebBrowsers <> nil) and (AWebBrowser <> nil) then
  begin
    AWebBrowser.PrepareForDestruction;
    FWebBrowsers.Remove(AWebBrowser);
  end;
end;

procedure TWBFactoryService.FormActivateHandler(const Sender: TObject; const M: TMessage);
begin
  RealignBrowsers;
end;

procedure TWBFactoryService.RealignBrowsers;
var
  WebBrowser : ICustomBrowser;
begin
  for WebBrowser in FWebBrowsers do
    WebBrowser.UpdateContentFromControl;
end;

initialization
  RegisterWebBrowserService;
  RegisterFmxClasses([TWebBrowser]);

end.
