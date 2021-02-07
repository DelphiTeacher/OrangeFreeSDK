unit Androidapi.JNI.WebChromeClient;

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
  JQAWebChromeClient_OnWebChromeClientListener = interface;
  JQAWebChromeClient = interface;

  [JavaSignature('com/xinhongzhi/QA/WebView/QAWebChromeClient$OnWebChromeClientListener')]
  JQAWebChromeClient_OnWebChromeClientListener = interface(IJavaInstance)
  ['{3757FA83-6838-4CAB-B1D8-AFBF619D3BF3}']
    { Property Methods }

    { methods }
    procedure OpenFileChooser(P1: Integer); cdecl; //(I)V
    { Property }
  end;

  JQAWebChromeClientClass = interface(JWebChromeClientClass) // or JObjectClass // SuperSignature: android/webkit/WebChromeClient
  ['{DC7262CF-1179-4737-AEBC-C356E3A3150C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JQAWebChromeClient; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/xinhongzhi/QA/WebView/QAWebChromeClient')]
  JQAWebChromeClient = interface(JWebChromeClient) // or JObject // SuperSignature: android/webkit/WebChromeClient
  ['{134631AB-FDAD-4745-949D-E7E62DB358C4}']

    { Property Methods }
    { methods }
    procedure setListener(Listener: JQAWebChromeClient_OnWebChromeClientListener); cdecl; //(Lcom/xinhongzhi/QA/WebView/QAWebChromeClient$OnWebChromeClientListener;)V
    procedure onReceiveValue(requestCode: Integer; resultCode: Integer; data: JIntent); cdecl; //(IILandroid/content/Intent;)V
    procedure onConsoleMessage(amessage: JString; lineNumber: Integer; sourceID: JString); cdecl; overload; //(Ljava/lang/String;ILjava/lang/String;)V
    function onConsoleMessage(consoleMessage: JConsoleMessage): Boolean; cdecl; overload; //(Landroid/webkit/ConsoleMessage;)Z
    function onShowFileChooser(webView: JWebView; filePathCallback: JValueCallback; P3: JWebChromeClient_FileChooserParams): Boolean; cdecl; //(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    procedure openFileChooser(uploadFile: JValueCallback); cdecl; overload; //Deprecated //(Landroid/webkit/ValueCallback;)V
    procedure openFileChooser(uploadFile: JValueCallback; P2: JString); cdecl; overload; //Deprecated //(Landroid/webkit/ValueCallback;Ljava/lang/String;)V
    procedure openFileChooser(uploadFile: JValueCallback; P2: JString; capture: JString); cdecl; overload; //Deprecated //(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V
    { Property }
  end;

  TJQAWebChromeClient = class(TJavaGenericImport<JQAWebChromeClientClass, JQAWebChromeClient>) end;


implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.WebChromeClient.JQAWebChromeClient_OnWebChromeClientListener',
    TypeInfo(Androidapi.JNI.WebChromeClient.JQAWebChromeClient_OnWebChromeClientListener));
  TRegTypes.RegisterType('Androidapi.JNI.WebChromeClient.JQAWebChromeClient',
    TypeInfo(Androidapi.JNI.WebChromeClient.JQAWebChromeClient));
end;

initialization
  RegisterTypes;

end.
