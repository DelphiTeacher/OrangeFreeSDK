{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.WebBrowser.Delegate.Mac;

interface

{$SCOPEDENUMS ON}

uses
  Macapi.ObjectiveC, Macapi.AppKit, Macapi.WebKit, Macapi.CocoaTypes, Macapi.Foundation, FMX.WebBrowser, FMX.Surfaces,
  System.Types;

type
  /// <summary>Wrapper for WebView</summary>
  INativeWebView = WebView;
  /// <summary>Wrapper for NSView</summary>
  INativeView = NSView;
  /// <summary>Wrapper for WebFrame</summary>
  IMainFrame = WebFrame;
  /// <summary>Wrapper for NSURLRequestCachePolicy</summary>
  NativeCachePolicy = NSURLRequestCachePolicy;
  /// <summary>Wrapper for WebFrameLoadDelegate</summary>
  WebDelegate = WebFrameLoadDelegate;

  { TWebViewDelegate }
  /// <summary> Class delegate for reciving call backs from native WebView</summary>
  TWebViewDelegate = class(TOCLocal, WebFrameLoadDelegate)
  private
    FWebBrowser: TCustomWebBrowser;
    FURLSetter: ICustomBrowser;
  public
    { WebFrameLoadDelegate }
    [MethodName('webView:didStartProvisionalLoadForFrame:')]
    procedure webViewDidStartProvisionalLoadForFrame(sender: WebView; didStartProvisionalLoadForFrame: WebFrame); cdecl;
    [MethodName('webView:didReceiveServerRedirectForProvisionalLoadForFrame:')]
    procedure webViewDidReceiveServerRedirectForProvisionalLoadForFrame(sender: WebView;
      didReceiveServerRedirectForProvisionalLoadForFrame: WebFrame); cdecl;
    [MethodName('webView:didFailProvisionalLoadWithError:forFrame:')]
    procedure webViewDidFailProvisionalLoadWithErrorForFrame(sender: WebView; didFailProvisionalLoadWithError: NSError;
      forFrame: WebFrame); cdecl;
    [MethodName('webView:didCommitLoadForFrame:')]
    procedure webViewDidCommitLoadForFrame(sender: WebView; didCommitLoadForFrame: WebFrame); cdecl;
    [MethodName('webView:didReceiveTitle:forFrame:')]
    procedure webViewDidReceiveTitleForFrame(sender: WebView; didReceiveTitle: NSString; forFrame: WebFrame); cdecl;
    [MethodName('webView:didReceiveIcon:forFrame:')]
    procedure webViewDidReceiveIconForFrame(sender: WebView; didReceiveIcon: NSImage; forFrame: WebFrame); cdecl;
    [MethodName('webView:didFinishLoadForFrame:')]
    procedure webViewDidFinishLoadForFrame(sender: WebView; didFinishLoadForFrame: WebFrame); cdecl;
    [MethodName('webView:didFailLoadWithError:forFrame:')]
    procedure webViewDidFailLoadWithErrorForFrame(sender: WebView; didFailLoadWithError: NSError;
      forFrame: WebFrame); cdecl;
    [MethodName('webView:didChangeLocationWithinPageForFrame:')]
    procedure webViewDidChangeLocationWithinPageForFrame(sender: WebView;
      didChangeLocationWithinPageForFrame: WebFrame); cdecl;
    [MethodName('webView:willPerformClientRedirectToURL:delay:fireDate:forFrame:')]
    procedure webViewWillPerformClientRedirectToURLDelayFireDateForFrame(sender: WebView;
      willPerformClientRedirectToURL: NSURL; delay: NSTimeInterval; fireDate: NSDate; forFrame: WebFrame); cdecl;
    [MethodName('webView:didCancelClientRedirectForFrame:')]
    procedure webViewDidCancelClientRedirectForFrame(sender: WebView; didCancelClientRedirectForFrame: WebFrame); cdecl;
    [MethodName('webView:willCloseFrame:')]
    procedure webViewWillCloseFrame(sender: WebView; willCloseFrame: WebFrame); cdecl;
    [MethodName('webView:didClearWindowObject:forFrame:')]
    procedure webViewDidClearWindowObjectForFrame(WebView: WebView; didClearWindowObject: WebScriptObject;
      forFrame: WebFrame); cdecl;
    [MethodName('webView:windowScriptObjectAvailable:')]
    procedure webViewWindowScriptObjectAvailable(WebView: WebView; windowScriptObjectAvailable: WebScriptObject); cdecl;
  public
    /// <summary>Setter for callback's receiver</summary>
    procedure SetWebBrowser(const AWebBrowser: TCustomWebBrowser; const AURLSetter: ICustomBrowser);
    /// <summary>Return a pointer to a native delegate</summary>
    constructor Create;
  end;

  /// <summary>The class for the automation of work with native WebView</summary>
  TNativeWebViewHelper = class
    /// <summary>Class function for init WebView with predefined params</summary>
    class function CreateAndInitWebView: WebView;
    /// <summary>Class function for getting working frame</summary>
    class function MainFrame(const ANativeWebView: INativeWebView): IMainFrame; inline;
    /// <summary> Class function for setting of native delegate for Mac WebView</summary>
    class procedure SetDelegate(const ANativeWebView: INativeWebView; const ADelegate: Pointer);
    /// <summary> Class procedure for setting Bounds/// </summary>
    class procedure SetBounds(const ANativeWebView: INativeWebView; const ABounds: TRectF; const AHeight: Single = 0);
  end;

implementation

uses
  System.Math, Macapi.Helpers, System.TypInfo;

{ TWebViewDelegate }

constructor TWebViewDelegate.Create;
begin
  // In TOCLocal constructor placed in protected section.
  // For calling we should make new one and call inherited.
  inherited Create;
end;

procedure TWebViewDelegate.SetWebBrowser(const AWebBrowser: TCustomWebBrowser; const AURLSetter: ICustomBrowser);
begin
  FWebBrowser := AWebBrowser;
  FURLSetter := AURLSetter;
end;

procedure TWebViewDelegate.webViewDidCancelClientRedirectForFrame(sender: WebView;
  didCancelClientRedirectForFrame: WebFrame);
begin

end;

procedure TWebViewDelegate.webViewDidChangeLocationWithinPageForFrame(sender: WebView;
  didChangeLocationWithinPageForFrame: WebFrame);
begin

end;

procedure TWebViewDelegate.webViewDidClearWindowObjectForFrame(WebView: WebView; didClearWindowObject: WebScriptObject;
  forFrame: WebFrame);
begin

end;

procedure TWebViewDelegate.webViewDidCommitLoadForFrame(sender: WebView; didCommitLoadForFrame: WebFrame);
begin

end;

procedure TWebViewDelegate.webViewDidFailLoadWithErrorForFrame(sender: WebView; didFailLoadWithError: NSError;
  forFrame: WebFrame);
begin
  if FWebBrowser <> nil then
    FWebBrowser.FailLoadingWithError;
end;

procedure TWebViewDelegate.webViewDidFailProvisionalLoadWithErrorForFrame(sender: WebView;
  didFailProvisionalLoadWithError: NSError; forFrame: WebFrame);
begin

end;

procedure TWebViewDelegate.webViewDidFinishLoadForFrame(sender: WebView; didFinishLoadForFrame: WebFrame);
begin
  if (sender <> nil) and (sender.mainFrameURL <> nil) and (FURLSetter <> nil) then
    FURLSetter.SetURL(NSStrToStr(sender.mainFrameURL));
  if FWebBrowser <> nil then
    FWebBrowser.FinishLoading;
end;

procedure TWebViewDelegate.webViewDidReceiveIconForFrame(sender: WebView; didReceiveIcon: NSImage; forFrame: WebFrame);
begin

end;

procedure TWebViewDelegate.webViewDidReceiveServerRedirectForProvisionalLoadForFrame(sender: WebView;
  didReceiveServerRedirectForProvisionalLoadForFrame: WebFrame);
begin
  if FWebBrowser <> nil then
  begin
    FURLSetter.SetURL(NSStrToStr(sender.mainFrameURL));
    FWebBrowser.ShouldStartLoading(FWebBrowser.URL);
  end;
end;

procedure TWebViewDelegate.webViewDidReceiveTitleForFrame(sender: WebView; didReceiveTitle: NSString;
  forFrame: WebFrame);
begin

end;

procedure TWebViewDelegate.webViewDidStartProvisionalLoadForFrame(sender: WebView;
  didStartProvisionalLoadForFrame: WebFrame);
begin
  if FWebBrowser <> nil then
    FWebBrowser.StartLoading;
end;

procedure TWebViewDelegate.webViewWillCloseFrame(sender: WebView; willCloseFrame: WebFrame);
begin

end;

procedure TWebViewDelegate.webViewWillPerformClientRedirectToURLDelayFireDateForFrame(sender: WebView;
  willPerformClientRedirectToURL: NSURL; delay: NSTimeInterval; fireDate: NSDate; forFrame: WebFrame);
begin

end;

procedure TWebViewDelegate.webViewWindowScriptObjectAvailable(WebView: WebView;
  windowScriptObjectAvailable: WebScriptObject);
begin

end;

{ TNativeWebViewHelper }

class function TNativeWebViewHelper.CreateAndInitWebView: WebView;
begin
  Result := TWebView.Create;
  Result.setAutoresizingMask(NSViewMinYMargin);
end;

class function TNativeWebViewHelper.MainFrame(const ANativeWebView: INativeWebView): IMainFrame;
begin
  Result := ANativeWebView.mainFrame;
end;

class procedure TNativeWebViewHelper.SetBounds(const ANativeWebView: INativeWebView; const ABounds: TRectF;
  const AHeight: Single);
begin
  ANativeWebView.setFrame(CGRectFromRect(TRectF.Create(ABounds.Left, AHeight - ABounds.Bottom, ABounds.Right,
    AHeight - ABounds.Top)));
end;

class procedure TNativeWebViewHelper.SetDelegate(const ANativeWebView: INativeWebView; const ADelegate: Pointer);
begin
  ANativeWebView.setFrameLoadDelegate(ADelegate);
end;

end.
