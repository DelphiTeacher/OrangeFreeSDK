unit Androidapi.JNI.WebViewClient;
//

interface

uses
  Androidapi.JNI.Os,
  Androidapi.JNI.Net,
  Androidapi.JNI.Embarcadero,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Webkit;

type
  JQAWebViewClient = interface;

  JQAWebViewClientClass = interface(JWebViewClientClass) // or JObjectClass // SuperSignature: android/webkit/WebViewClient
  ['{94A96DFE-E455-41C7-B92A-264543DC68B4}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JQAWebViewClient; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/xinhongzhi/QA/WebView/QAWebViewClient')]
  JQAWebViewClient = interface(JWebViewClient) // or JObject // SuperSignature: android/webkit/WebViewClient
  ['{CAFF7798-0432-4722-A1A0-F86EC4C31D33}']
    { Property Methods }

    { methods }
    function shouldInterceptRequest(view: JWebView; url: JString): JWebResourceResponse; cdecl; overload; //(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    function shouldInterceptRequest(view: JWebView; request: JWebResourceRequest): JWebResourceResponse; cdecl; overload; //(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
    procedure SetWebViewListener(listener: JOnWebViewListener); cdecl; //(Lcom/embarcadero/firemonkey/webbrowser/OnWebViewListener;)V
    procedure doUpdateVisitedHistory(view: JWebView; url: JString; isReload: Boolean); cdecl; //(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    procedure onFormResubmission(view: JWebView; dontResend: JMessage; resend: JMessage); cdecl; //(Landroid/webkit/WebView;Landroid/os/Message;Landroid/os/Message;)V
    procedure onLoadResource(view: JWebView; url: JString); cdecl; //(Landroid/webkit/WebView;Ljava/lang/String;)V
    procedure onPageFinished(view: JWebView; url: JString); cdecl; //(Landroid/webkit/WebView;Ljava/lang/String;)V
    procedure onPageStarted(view: JWebView; url: JString; favicon: JBitmap); cdecl; //(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    procedure onReceivedError(view: JWebView; errorCode: Integer; description: JString; failingUrl: JString); cdecl; //(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    procedure onReceivedHttpAuthRequest(view: JWebView; handler: JHttpAuthHandler; host: JString; realm: JString); cdecl; //(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    procedure onReceivedSslError(view: JWebView; handler: JSslErrorHandler; error: JSslError); cdecl; //(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    procedure onScaleChanged(view: JWebView; oldScale: Single; newScale: Single); cdecl; //(Landroid/webkit/WebView;FF)V
    procedure onUnhandledKeyEvent(view: JWebView; event: JKeyEvent); cdecl; //(Landroid/webkit/WebView;Landroid/view/KeyEvent;)V
    function shouldOverrideKeyEvent(view: JWebView; event: JKeyEvent): Boolean; cdecl; //(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z
    function shouldOverrideUrlLoading(view: JWebView; url: JString): Boolean; cdecl; //(Landroid/webkit/WebView;Ljava/lang/String;)Z

    { Property }
  end;

  TJQAWebViewClient = class(TJavaGenericImport<JQAWebViewClientClass, JQAWebViewClient>) end;


implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.WebViewClient.JQAWebViewClient',
    TypeInfo(Androidapi.JNI.WebViewClient.JQAWebViewClient));
end;

initialization
  RegisterTypes;

end.
