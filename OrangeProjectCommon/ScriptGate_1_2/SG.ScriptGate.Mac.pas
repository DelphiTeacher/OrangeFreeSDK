unit SG.ScriptGate.Mac;

// (*
{$IFNDEF OSX}
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
  , System.Classes
  , System.SysUtils
  , System.Rtti
  , Macapi.CocoaTypes
  , Macapi.ObjectiveC
  , Macapi.Helpers
  , Macapi.Foundation
  , Macapi.AppKit
  , Macapi.WebKit
  , FMX.Types
  , FMX.Platform
  , FMX.WebBrowser
  , FMX.WebBrowser.Delegate.Mac
  ;

type
  TOpenScriptGate = class(TScriptGate);

  WebPolicyDecisionListener = interface(IObjectiveCInstance)
    ['{3D5D132B-B8C7-4227-A414-F590E93477F2}']
    procedure use; cdecl;
    procedure download; cdecl;
    procedure ignore; cdecl;
  end;

  TWebPolicyDecisionListener =
    class(TOCGenericImport<NSObjectClass, WebPolicyDecisionListener>)
  end;

  TWebNavigationType = record
  public const
    LinkClicked = 0;
    FormSubmitted = 1;
    BackForward = 2;
    Reload = 3;
    FormResubmitted = 4;
    Other = 5;
  end;

  TWebActionKeys = record
  public const
    NavigationTypeKey = 'WebActionNavigationTypeKey';
    ElementKey = 'WebActionElementKey';
    ButtonKey = 'WebActionButtonKey';
    ModifierFlagsKey = 'WebActionModifierFlagsKey';
    OriginalURLKey = 'WebActionOriginalURLKey';
  public
    class function GetNavigationTypeKey: NSString; static;
    class function GetElementKey: NSString; static;
    class function GetButtonKey: NSString; static;
    class function GetModifierFlagsKey: NSString; static;
    class function GetOriginalURLKey: NSString; static;

    class function GetNavigationTypeKeyObj: Pointer; static;
    class function GetElementKeyObj: Pointer; static;
    class function GetButtonKeyObj: Pointer; static;
    class function GetModifierFlagsKeyObj: Pointer; static;
    class function GetOriginalURLKeyObj: Pointer; static;
  end;

  TWebElement = record
  public const
    DOMNodeKey = 'WebElementDOMNodeKey';
    FrameKey = 'WebElementFrameKey';
    ImageAltStringKey = 'WebElementImageAltStringKey';
    ImageKey = 'WebElementImageKey';
    ImageRectKey = 'WebElementImageRectKey';
    ImageURLKey = 'WebElementImageURLKey';
    IsSelectedKey = 'WebElementIsSelectedKey';
    LinkURLKey = 'WebElementLinkURLKey';
    LinkTargetFrameKey = 'WebElementLinkTargetFrameKey';
    LinkTitleKey = 'WebElementLinkTitleKey';
    LinkLabelKey = 'WebElementLinkLabelKey';
  public
    class function GetDOMNodeKey: NSString; static;
    class function GetFrameKey: NSString; static;
    class function GetImageAltStringKey: NSString; static;
    class function GetImageKey: NSString; static;
    class function GetImageRectKey: NSString; static;
    class function GetImageURLKey: NSString; static;
    class function GetIsSelectedKey: NSString; static;
    class function GetLinkURLKey: NSString; static;
    class function GetLinkTargetFrameKey: NSString; static;
    class function GetLinkTitleKey: NSString; static;
    class function GetLinkLabelKey: NSString; static;

    class function GetDOMNodeKeyObj: Pointer; static;
    class function GetFrameKeyObj: Pointer; static;
    class function GetImageAltStringKeyObj: Pointer; static;
    class function GetImageKeyObj: Pointer; static;
    class function GetImageRectKeyObj: Pointer; static;
    class function GetImageURLKeyObj: Pointer; static;
    class function GetIsSelectedKeyObj: Pointer; static;
    class function GetLinkURLKeyObj: Pointer; static;
    class function GetLinkTargetFrameKeyObj: Pointer; static;
    class function GetLinkTitleKeyObj: Pointer; static;
    class function GetLinkLabelKeyObj: Pointer; static;
  end;

  WebUIDelegate = interface(IObjectiveC)
    [MethodName('webView:runJavaScriptAlertPanelWithMessage:initiatedByFrame:')]
    procedure webViewRunJavaScriptAlertPanelWithMessageInitiatedByFrame(
      sender: WebView;
      runJavaScriptAlertPanelWithMessage: NSString;
      initiatedByFrame: WebFrame); cdecl;
  end;

  TWebUIDelegate = class(TOCLocal, WebUIDelegate)
    [MethodName('webView:runJavaScriptAlertPanelWithMessage:initiatedByFrame:')]
    procedure webViewRunJavaScriptAlertPanelWithMessageInitiatedByFrame(
      sender: WebView;
      runJavaScriptAlertPanelWithMessage: NSString;
      initiatedByFrame: WebFrame); cdecl;
  end;

  TSGWebPlicyDelegate = class(TOCLocal, WebPolicyDelegate)
  private var
    [Weak] FWebView: WebView;
    FWebBrowser: TCustomWebBrowser;
    [Weak] FScriptGate: TOpenScriptGate;
  private
    function GetListener(const listener: Pointer): WebPolicyDecisionListener;
  public
    constructor Create(
      const iScriptGate: TOpenScriptGate;
      const iWebView: WebView);
    [MethodName('webView:decidePolicyForNavigationAction:request:frame:decisionListener:')]
    procedure webViewDecidePolicyForNavigationActionRequestFrameDecisionListener(WebView: WebView;
      decidePolicyForNavigationAction: NSDictionary; request: NSURLRequest; frame: WebFrame;
      decisionListener: Pointer); cdecl;
    [MethodName('webView:decidePolicyForNewWindowAction:request:newFrameName:decisionListener:')]
    procedure webViewDecidePolicyForNewWindowActionRequestNewFrameNameDecisionListener(WebView: WebView;
      decidePolicyForNewWindowAction: NSDictionary; request: NSURLRequest; newFrameName: NSString;
      decisionListener: Pointer); cdecl;
    [MethodName('webView:decidePolicyForMIMEType:request:frame:decisionListener:')]
    procedure webViewDecidePolicyForMIMETypeRequestFrameDecisionListener(WebView: WebView;
      decidePolicyForMIMEType: NSString; request: NSURLRequest; frame: WebFrame; decisionListener: Pointer); cdecl;
    [MethodName('webView:unableToImplementPolicyWithError:frame:')]
    procedure webViewUnableToImplementPolicyWithErrorFrame(WebView: WebView; unableToImplementPolicyWithError: NSError;
      frame: WebFrame); cdecl;
  end;

  TScriptGateMac = class(TScriptGateBase, IScriptGate)
  private var
    FWebView: INativeWebView;
    FDelegate: TSGWebPlicyDelegate;
    FUIDelegate: WebUIDelegate;
    [Weak] FScriptGate: TOpenScriptGate;
  protected
    procedure CallScript(
      const iScript: String;
      const iResultProc: TScriptGateResultProc); override;
  public
    constructor Create(const iScriptGate: TScriptGate);
    destructor Destroy; override;
  end;

  TScriptGateFactoryMac = class(TScriptGateFactory)
  public
    function CreateScriptGate(
      const iScriptGate: TScriptGate): IScriptGate; override;
  end;

procedure RegisterScriptGate;
begin
  TPlatformServices.Current.AddPlatformService(
    IScriptGateFactory,
    TScriptGateFactoryMac.Create);
end;

{ TScriptGateFactoryMac }

function TScriptGateFactoryMac.CreateScriptGate(
  const iScriptGate: TScriptGate): IScriptGate;
begin
  Result := TScriptGateMac.Create(iScriptGate);
end;

{ TScriptGateMac }

procedure TScriptGateMac.CallScript(
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

constructor TScriptGateMac.Create(const iScriptGate: TScriptGate);
begin
  inherited Create;

  FScriptGate := TOpenScriptGate(iScriptGate);

  try
    FWebView := FScriptGate.WebBrowser.GetField<INativeWebView>('FWebView');
  except
    FWebView := nil;
  end;

  if (FWebView = nil) then
    FScriptGate.CallErrorEvent(
      TScriptGate.TScriptGateFieldNotFound.Create(
        'Field not found in FMX.WebBrowser: FWebView, FDelegate'))
  else
  begin
    FDelegate := TSGWebPlicyDelegate.Create(FScriptGate, FWebView);
    FUIDelegate := TWebUIDelegate.Create;

    FWebView.setUIDelegate((FUIDelegate as ILocalObject).GetObjectID);
  end;
end;

destructor TScriptGateMac.Destroy;
begin
  FWebView := nil;
  FScriptGate := nil;
  FUIDelegate := nil;

  FDelegate.DisposeOf;

  inherited;
end;


{ TWebActionKeys }

function KeyToNSStr(const iKey: String): NSString; inline;
begin
  Result := CocoaNSStringConst(libWebKit, iKey);
end;

class function TWebActionKeys.GetButtonKey: NSString;
begin
  Result := KeyToNSStr(TWebActionKeys.ButtonKey);
end;

class function TWebActionKeys.GetButtonKeyObj: Pointer;
begin
  Result := (GetButtonKey as ILocalObject).GetObjectID;
end;

class function TWebActionKeys.GetElementKey: NSString;
begin
  Result := KeyToNSStr(TWebActionKeys.ElementKey);
end;

class function TWebActionKeys.GetElementKeyObj: Pointer;
begin
  Result := (GetElementKey as ILocalObject).GetObjectID;
end;

class function TWebActionKeys.GetModifierFlagsKey: NSString;
begin
  Result := KeyToNSStr(TWebActionKeys.ModifierFlagsKey);
end;

class function TWebActionKeys.GetModifierFlagsKeyObj: Pointer;
begin
  Result := (GetModifierFlagsKey as ILocalObject).GetObjectID;
end;

class function TWebActionKeys.GetNavigationTypeKey: NSString;
begin
  Result := KeyToNSStr(TWebActionKeys.NavigationTypeKey);
end;

class function TWebActionKeys.GetNavigationTypeKeyObj: Pointer;
begin
  Result := (GetNavigationTypeKey as ILocalObject).GetObjectID;
end;

class function TWebActionKeys.GetOriginalURLKey: NSString;
begin
  Result := KeyToNSStr(TWebActionKeys.OriginalURLKey);
end;

class function TWebActionKeys.GetOriginalURLKeyObj: Pointer;
begin
  Result := (GetOriginalURLKey as ILocalObject).GetObjectID;
end;

{ TWebElement }

class function TWebElement.GetDOMNodeKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.DOMNodeKey);
end;

class function TWebElement.GetDOMNodeKeyObj: Pointer;
begin
  Result := (GetDOMNodeKey as ILocalObject).GetObjectID;
end;

class function TWebElement.GetFrameKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.FrameKey);
end;

class function TWebElement.GetFrameKeyObj: Pointer;
begin
  Result := (GetFrameKey as ILocalObject).GetObjectID;
end;

class function TWebElement.GetImageAltStringKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.ImageAltStringKey);
end;

class function TWebElement.GetImageAltStringKeyObj: Pointer;
begin
  Result := (GetImageAltStringKey as ILocalObject).GetObjectID;
end;

class function TWebElement.GetImageKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.ImageKey);
end;

class function TWebElement.GetImageKeyObj: Pointer;
begin
  Result := (GetImageKey as ILocalObject).GetObjectID;
end;

class function TWebElement.GetImageRectKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.ImageRectKey);
end;

class function TWebElement.GetImageRectKeyObj: Pointer;
begin
  Result := (GetImageRectKey as ILocalObject).GetObjectID;
end;

class function TWebElement.GetImageURLKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.ImageURLKey);
end;

class function TWebElement.GetImageURLKeyObj: Pointer;
begin
  Result := (GetImageURLKey as ILocalObject).GetObjectID;
end;

class function TWebElement.GetIsSelectedKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.IsSelectedKey);
end;

class function TWebElement.GetIsSelectedKeyObj: Pointer;
begin
  Result := (GetIsSelectedKey as ILocalObject).GetObjectID;
end;

class function TWebElement.GetLinkLabelKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.LinkLabelKey);
end;

class function TWebElement.GetLinkLabelKeyObj: Pointer;
begin
  Result := (GetLinkLabelKey as ILocalObject).GetObjectID;
end;

class function TWebElement.GetLinkTargetFrameKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.LinkTargetFrameKey);
end;

class function TWebElement.GetLinkTargetFrameKeyObj: Pointer;
begin
  Result := (GetLinkTargetFrameKey as ILocalObject).GetObjectID;
end;

class function TWebElement.GetLinkTitleKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.LinkTitleKey);
end;

class function TWebElement.GetLinkTitleKeyObj: Pointer;
begin
  Result := (GetLinkTitleKey as ILocalObject).GetObjectID;
end;

class function TWebElement.GetLinkURLKey: NSString;
begin
  Result := KeyToNSStr(TWebElement.LinkURLKey);
end;

class function TWebElement.GetLinkURLKeyObj: Pointer;
begin
  Result := (GetLinkURLKey as ILocalObject).GetObjectID;
end;

{ TWebUIDelegate }

procedure TWebUIDelegate.webViewRunJavaScriptAlertPanelWithMessageInitiatedByFrame(
  sender: WebView;
  runJavaScriptAlertPanelWithMessage: NSString;
  initiatedByFrame: WebFrame);
var
  Alert: NSAlert;
begin
  Alert := TNSAlert.Wrap(TNSAlert.Alloc.init);
  Alert.addButtonWithTitle(StrToNSStr('OK'));
  Alert.setMessageText(runJavaScriptAlertPanelWithMessage);
  Alert.runModal;
end;

{ TSGWebFrameLoadDelegate }

constructor TSGWebPlicyDelegate.Create(
  const iScriptGate: TOpenScriptGate;
  const iWebView: WebView);
begin
  inherited Create;

  FScriptGate := iScriptGate;
  FWebBrowser := FScriptGate.WebBrowser;
  FWebView := iWebView;

  FWebView.preferences.setJavaScriptEnabled(True);
  FWebView.preferences.setJavaScriptCanOpenWindowsAutomatically(True);
  FWebView.setPolicyDelegate((Self as ILocalObject).GetObjectID);
end;

function TSGWebPlicyDelegate.GetListener(
  const listener: Pointer): WebPolicyDecisionListener;
begin
  Result := TWebPolicyDecisionListener.Wrap(listener);
end;

procedure TSGWebPlicyDelegate.webViewDecidePolicyForMIMETypeRequestFrameDecisionListener(
  WebView: WebView;
  decidePolicyForMIMEType: NSString;
  request: NSURLRequest;
  frame: WebFrame;
  decisionListener: Pointer);
var
  Listener: WebPolicyDecisionListener;
begin
  Listener := GetListener(decisionListener);
  Listener.use;
end;

procedure TSGWebPlicyDelegate.webViewDecidePolicyForNavigationActionRequestFrameDecisionListener(
  WebView: WebView;
  decidePolicyForNavigationAction: NSDictionary;
  request: NSURLRequest;
  frame: WebFrame;
  decisionListener: Pointer);
var
  Listener: WebPolicyDecisionListener;
  OK: Boolean;
  Dic: NSDictionary;
  Obj: Pointer;
  Str: NSString;
  URL: String;
begin
  Listener := GetListener(decisionListener);
  OK := True;

  if
    (decidePolicyForNavigationAction <> nil)
  then
  begin
    // is Click ?
    Obj :=
      decidePolicyForNavigationAction.objectForKey(
        TWebActionKeys.GetNavigationTypeKeyObj
      );

    if (Obj <> nil) then
    begin
      Str := TNSString.Wrap(Obj);

      if Str.intValue = TWebNavigationType.LinkClicked then
      begin
        // Get linked url
        Obj :=
          decidePolicyForNavigationAction.objectForKey(
            TWebActionKeys.GetElementKeyObj
          );

        if (Obj <> nil) then
        begin
          Dic := TNSDictionary.Wrap(Obj);
          Obj := Dic.objectForKey(TWebElement.GetLinkURLKeyObj);

          // Check url
          if (Obj <> nil) then
          begin
            URL := NSURLToStr(TNSUrl.Wrap(Obj));
            if (FScriptGate.CheckScheme(URL)) then
            begin
              OK := False;
              FScriptGate.CallEvent(URL);
            end;
          end;
        end;
      end;
    end;
  end;

  if (OK) then
    Listener.use
  else
    Listener.ignore;
end;

procedure TSGWebPlicyDelegate.webViewDecidePolicyForNewWindowActionRequestNewFrameNameDecisionListener(
  WebView: WebView;
  decidePolicyForNewWindowAction: NSDictionary;
  request: NSURLRequest;
  newFrameName: NSString;
  decisionListener: Pointer);
var
  Listener: WebPolicyDecisionListener;
begin
  Listener := GetListener(decisionListener);
  Listener.use;
end;

procedure TSGWebPlicyDelegate.webViewUnableToImplementPolicyWithErrorFrame(
  WebView: WebView;
  unableToImplementPolicyWithError: NSError;
  frame: WebFrame);
begin
end;

initialization
  RegisterScriptGate;

end.

