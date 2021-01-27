unit FMX.WebBrowser.Win;

interface

{$IF DEFINED(VER270) OR DEFINED(VER280)}

uses
  FMX.WebBrowserEx;

procedure RegisterWebBrowserService;
procedure UnRegisterWebBrowserService;

procedure CallJS(
  const iWebBrowser: TWebBrowserEx;
  const iFunction: String;
  const iParams: array of String);

function GetTagValue(
  const iWebBrowser: TWebBrowserEx;
  const iTagName, iValueName: String): String;
{$ENDIF}


implementation

{$IF DEFINED(VER270) OR DEFINED(VER280)}
uses
  System.Classes, System.SysUtils, System.Types, System.Math, System.DateUtils
  , System.Generics.Collections
  , Winapi.Windows
  , FMX.Types, FMX.WebBrowser, FMX.Platform, FMX.Platform.Win, FMX.Forms
  , Vcl.Controls, Vcl.OleCtrls, Vcl.Forms, Vcl.Graphics
  , SHDocVw, Winapi.ActiveX, MSHTML,
  FMX.Graphics
  ;

const
  SID_STravelLogCursor: TGUID = '{7EBFDD80-AD18-11d3-A4C5-00C04F72D6B8}';
  IID_ITravelLogStg: TGUID = '{7EBFDD80-AD18-11d3-A4C5-00C04F72D6B8}';

  TLEF_RELATIVE_BACK = $00000010;
  TLEF_RELATIVE_FORE = $00000020;

type
  ITravelLogEntry = interface(IUnknown)
    ['{7EBFDD87-AD18-11d3-A4C5-00C04F72D6B8}']
    function GetTitle(var ppszTitle: POleStr): HRESULT; stdcall;
    function GetUrl(var ppszURL: POleStr): HRESULT; stdcall;
  end;

  IEnumTravelLogEntry = interface(IUnknown)
    ['{7EBFDD85-AD18-11d3-A4C5-00C04F72D6B8}']
    function Next(cElt: ULONG; out rgElt: ITravelLogEntry;
      out pcEltFetched: ULONG): HRESULT; stdcall;
    function Skip(cElt: ULONG): HRESULT; stdcall;
    function Reset: HRESULT; stdcall;
    function Clone(out ppEnum: IEnumTravelLogEntry): HRESULT; stdcall;
  end;

  ITravelLogStg = interface(IUnknown)
    ['{7EBFDD80-AD18-11d3-A4C5-00C04F72D6B8}']
    function CreateEntry(
      pszURL, pszTitle: POleStr;
      ptleRelativeTo: ITravelLogEntry;
      fPrepend: BOOL;
      out pptle: ITravelLogEntry): HRESULT; stdcall;
    function TravelTo(ptle: ITravelLogEntry): HRESULT; stdcall;
    function EnumEntries(
      Flags: DWORD;
      out ppenum: IEnumTravellogEntry): HRESULT; stdcall;
    function FindEntries(
      Flags: DWORD;
      pszURL: POleStr;
      out ppenum: IEnumTravelLogEntry): HRESULT; stdcall;
    function GetCount(Flags: DWORD; out pcEntries: DWORD): HRESULT; stdcall;
    function RemoveEntry(ptle: ITravelLogEntry): HRESULT; stdcall;
    function GetRelativeEntry(
      iOffset: Integer;
      out ptle: ITravelLogEntry): HRESULT; stdcall;
  end;

  TWebBrowser = class(SHDocVw.TWebBrowser, IOleCommandTarget)
  private const
    IID_DocHostCommandHandler: TGUID = '{F38BC242-B950-11D1-8918-00C04FC2C836}';
  protected
    {IOleCommandTarget interface}
    function QueryStatus(
      CmdGroup: PGUID; 
      cCmds: Cardinal;
      prgCmds: POleCmd; 
      CmdText: POleCmdText): HResult; stdcall;
    function Exec(
      CmdGroup: PGUID; 
      nCmdID, nCmdexecopt: DWORD;
      const vaIn: OleVariant; 
      var vaOut: OleVariant): HResult; stdcall;
  end;

  TWinWebBrowserService = class(TInterfacedObject, ICustomBrowser)
  private const
    MAX_WAIT_TIME = 1000 * 10;
  private var
    FURL: String;
    FWebView: TWebBrowser;
    FWebControl: TCustomWebBrowser;
    FTravelLog: ITravelLogStg;
    FLoading: Boolean;
  protected
    procedure GetTravelLog;
    function CanGo(const iFlag: DWORD): Boolean;
    { IFMXWebBrowserService }
    function GetURL: string;
    function GetCanGoBack: Boolean;
    function GetCanGoForward: Boolean;
    procedure SetURL(const AValue: string);
    procedure SetWebBrowserControl(const AValue: TCustomWebBrowser);
    function GetParent : TFmxObject;
    function GetVisible : Boolean;
    procedure UpdateContentFromControl;
    procedure Navigate;
    procedure GoBack;
    procedure GoForward;
    procedure GoHome;
    procedure Show;
    procedure Hide;
    property URL: string read GetURL write SetURL;
    property CanGoBack: Boolean read GetCanGoBack;
    property CanGoForward: Boolean read GetCanGoForward;
    procedure EvaluateJavaScript(const JavaScript: string);
    procedure LoadFromStrings(const Content: string; const BaseUrl: string);
    procedure DoWebBrowserNavigateComplete2(ASender: TObject; const pDisp: IDispatch;const URL: OleVariant);

    function CaptureBitmap: TBitmap;
    procedure Reload;
    procedure Stop;
    function GetEnableCaching: Boolean;
    procedure SetEnableCaching(const Value : Boolean);
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TWinWBService = class(TWBFactoryService)
  protected
    function DoCreateWebBrowser: ICustomBrowser; override;
  end;

  TWebBrowserList = TList<TWebBrowser>;

var
  GWBService: TWinWBService;
  [Weak] GWebViews: TWebBrowserList = nil;

{ TWinWBService }

function TWinWBService.DoCreateWebBrowser: ICustomBrowser;
begin
  Result := TWinWebBrowserService.Create as ICustomBrowser;
end;

procedure RegisterWebBrowserService;
begin
  GWBService := TWinWBService.Create;
  TPlatformServices.Current.AddPlatformService(IFMXWBService, GWBService);
end;

procedure UnRegisterWebBrowserService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXWBService);
end;

{ TWebBrowser }

function TWebBrowser.Exec(
  CmdGroup: PGUID; 
  nCmdID, nCmdexecopt: DWORD;
  const vaIn: OleVariant; 
  var vaOut: OleVariant): HResult;
begin
  Result := OLECMDERR_E_NOTSUPPORTED;

  if (CmdGroup <> nil) then begin
    if (IsEqualGuid(cmdGroup^, IID_DocHostCommandHandler)) then 
      case nCmdID of
        OLECMDID_SHOWSCRIPTERROR:
          begin
            vaOut := True;
            Result := S_OK;
          end;
      end;
  end;
end;

function TWebBrowser.QueryStatus(
  CmdGroup: PGUID; 
  cCmds: Cardinal;
  prgCmds: POleCmd; 
  CmdText: POleCmdText): HResult;
begin
  prgCmds.cmdf := OLECMDF_ENABLED;
  Result := S_OK;
end;

{ TWinWebBrowserService }

function TWinWebBrowserService.CanGo(const iFlag: DWORD): Boolean;
var
  Count: DWORD;
begin
  Result := False;

  if (FTravelLog <> nil) and (Succeeded(FTravelLog.GetCount(iFlag, Count))) then
    Result := (Count > 0);
end;

function TWinWebBrowserService.CaptureBitmap: TBitmap;
begin

end;

constructor TWinWebBrowserService.Create;
begin
  inherited;

  if (GWebViews = nil) then
    GWebViews := TWebBrowserList.Create;

  FWebView := TWebBrowser.Create(nil);
  FWebView.Align := alClient;
  FWebView.Ctl3D := False;
  FWebView.OnNavigateComplete2:=DoWebBrowserNavigateComplete2;


  GWebViews.Add(FWebView);
end;

destructor TWinWebBrowserService.Destroy;
begin
  if (Vcl.Forms.Application <> nil) then begin
    GWebViews.Remove(FWebView);
    FWebView.DisposeOf;
  end;

  inherited;
end;

procedure TWinWebBrowserService.DoWebBrowserNavigateComplete2(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
begin
  if Assigned(Self.FWebControl.OnDidFinishLoad) then
  begin
    FURL:=URL;
    Self.FWebControl.OnDidFinishLoad(Self);
  end;
end;

function TWinWebBrowserService.GetCanGoBack: Boolean;
begin
  Result := CanGo(TLEF_RELATIVE_BACK);
end;

function TWinWebBrowserService.GetCanGoForward: Boolean;
begin
  Result := CanGo(TLEF_RELATIVE_FORE);
end;

function TWinWebBrowserService.GetEnableCaching: Boolean;
begin

end;

function TWinWebBrowserService.GetParent: TFmxObject;
begin
  if (FWebControl = nil) then
    Result := nil
  else
    Result := FWebControl.Parent;
end;

procedure TWinWebBrowserService.GetTravelLog;
var
  SP: IServiceProvider;
begin
  if
    (FWebView.DefaultInterface = nil)
    or (Failed(FWebView.Application.QueryInterface(IServiceProvider, SP)))
  then
    Exit;

  SP.QueryInterface(ITravelLogEntry, FTravelLog);
end;

function TWinWebBrowserService.GetURL: string;
begin
  Result := FURL;
end;

function TWinWebBrowserService.GetVisible: Boolean;
begin
  if (FWebView = nil) then
    Result := False
  else
    Result := FWebView.Visible;
end;

procedure TWinWebBrowserService.GoBack;
begin
  if (FWebView <> nil) then
    FWebView.GoBack;
end;

procedure TWinWebBrowserService.GoForward;
begin
  if (FWebView <> nil) then
    FWebView.GoForward;
end;

procedure TWinWebBrowserService.GoHome;
begin
  if (FWebView <> nil) then
    FWebView.GoHome;
end;

procedure TWinWebBrowserService.Hide;
begin
  if (FWebView <> nil) then
    FWebView.Hide;
end;

procedure TWinWebBrowserService.Navigate;
begin
  if (FWebView <> nil) then begin
    FLoading := True;

    FWebView.Navigate(FURL);

    if
      (FURL.StartsWith('http'))
      or (FURL.StartsWith('file'))
    then
      TThread.CreateAnonymousThread(
        procedure
        var
          Start: TDateTime;
        begin
          try
            Start := Now;
            while
              (not Application.Terminated)
              and (FWebView.ReadyState < READYSTATE_COMPLETE)
              and (MilliSecondsBetween(Now, Start) < MAX_WAIT_TIME)
            do begin
              TThread.Sleep(100);
            end;

//            if Assigned(Self.FWebView.On then

          except
          end;

          FLoading := False;
        end
      ).Start
    else
      FLoading := False;
  end;
end;

procedure TWinWebBrowserService.Reload;
begin

end;

procedure TWinWebBrowserService.SetEnableCaching(const Value: Boolean);
begin

end;

procedure TWinWebBrowserService.SetURL(const AValue: string);
begin
  if (FLoading) then
    Exit;

  FURL := Avalue;
end;

procedure TWinWebBrowserService.SetWebBrowserControl(
  const AValue: TCustomWebBrowser);
begin
  FWebControl := AValue;
  UpdateContentFromControl;
end;

procedure TWinWebBrowserService.EvaluateJavaScript(const JavaScript: string);
begin

end;

procedure TWinWebBrowserService.LoadFromStrings(const Content: string; const BaseUrl: string);
begin

end;

procedure TWinWebBrowserService.Show;
begin
  if (FWebView <> nil) then
    FWebView.Show;
end;

procedure TWinWebBrowserService.Stop;
begin

end;

procedure TWinWebBrowserService.UpdateContentFromControl;
var
  Bounds: TRectF;
  RootForm: TCommonCustomForm;
  Wnd: HWND;
begin
  if (FWebView <> nil) then begin
    if (FWebControl <> nil)
      and not (csDesigning in FWebControl.ComponentState)
      and (FWebControl.Root <> nil)
      and (FWebControl.Root.GetObject is TCommonCustomForm)
    then begin
      RootForm := TCommonCustomForm(FWebControl.Root.GetObject);

      Bounds := TRectF.Create(0, 0, FWebControl.Width, FWebControl.Height);
      Bounds.Fit(FWebControl.AbsoluteRect);

      Wnd := WindowHandleToPlatform(RootForm.Handle).Wnd;

      if
        (Wnd = 0)
        or (SameValue(Bounds.Width, 0))
        or (SameValue(Bounds.Height, 0))
      then
        Hide
      else begin
        TWinControl(FWebView).ParentWindow := Wnd;

        FWebView.SetBounds(
          Trunc(Bounds.Left)
          , Trunc(Bounds.Top)
          , Trunc(Bounds.Width)
          , Trunc(Bounds.Height)
        );

        if (FURL <> '') then
          try
            //FWebView.Refresh;
          finally
          end;

        Show;
      end;

      GetTravelLog;
    end
    else begin
      FWebView.ParentWindow := 0;
      Hide;
    end;
  end;
end;

procedure CallJS(
  const iWebBrowser: TWebBrowserEx;
  const iFunction: String;
  const iParams: array of String);
var
  Params: TStringBuilder;
  Param: String;
begin
  Params := TStringBuilder.Create;
  try
    for Param in iParams do begin
      Params.Append(',');
      Params.Append(Param);
    end;

    Params.Remove(0, 1);

    iWebBrowser.Navigate(
      Format('javascript:%s(%s);', [iFunction, Params.ToString])
    );
  finally
    Params.Free;
  end;
end;

function GetTagValue(
  const iWebBrowser: TWebBrowserEx;
  const iTagName, iValueName: String): String;
var
  [Weak] Web: TWebBrowser;
  WebService: TWinWebBrowserService;
  Doc: IHTMLDocument3;
  Elem: IHTMLElement;
begin
  if (iWebBrowser.GetWeb = nil) then
    Exit;

  WebService := (iWebBrowser.GetWeb as TWinWebBrowserService);
  if (WebService = nil) then
    Exit;

  Web := WebService.FWebView;

  if
    (Web = nil)
    or (Web.Document = nil)
    or (Web.Document.QueryInterface(IHTMLDocument3, Doc) <> S_OK)
  then
    Exit;

  Elem := Doc.getElementById(iTagName);
  if (Elem = nil) then
    Exit;

  Result := Elem.getAttribute(iValueName, 0);
end;

procedure FreeWebBrowsers;
var
  Web: TWebBrowser;
begin
  if (GWebViews <> nil) then
    for Web in GWebViews do
      Web.DisposeOf;

  GWebViews.DisposeOf;
end;

initialization
begin
  CoInitialize(nil);
  RegisterWebBrowserService;
end;

finalization
begin
  FreeWebBrowsers;
  CoUninitialize;
end;
{$ENDIF}

end.








