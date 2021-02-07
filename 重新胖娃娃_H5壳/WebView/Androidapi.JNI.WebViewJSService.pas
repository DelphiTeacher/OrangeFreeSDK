unit Androidapi.JNI.WebViewJSService;

interface

uses
  Androidapi.JNI.Os,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes;

type

  JWebViewJSService_OnJSServiceListener = interface;
  JWebViewJSService = interface;



  [JavaSignature('com/xinhongzhi/QA/WebView/WebViewJSService$OnJSServiceListener')]
  JWebViewJSService_OnJSServiceListener = interface(IJavaInstance)
  ['{73BB1103-0512-4338-9722-451C7D19BE9C}']
    { Property Methods }

    { methods }
    procedure javascriptCallback(P1: JString); cdecl; //(Ljava/lang/String;)V

    { Property }
  end;

  JWebViewJSServiceClass = interface(JObjectClass)
  ['{8F03F72A-5E5C-477C-A835-B20C4D0AD5A4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWebViewJSService; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/xinhongzhi/QA/WebView/WebViewJSService')]
  JWebViewJSService = interface(JObject)
  ['{A2C7F1B8-3482-46B8-B0C9-545F4DC6CC80}']
    { Property Methods }

    { methods }
    procedure setListener(Listener: JWebViewJSService_OnJSServiceListener); cdecl; //(Lcom/xinhongzhi/QA/WebView/WebViewJSService$OnJSServiceListener;)V
    procedure javascriptCallback(value: JString); cdecl; //(Ljava/lang/String;)V

    { Property }
  end;

  TJWebViewJSService = class(TJavaGenericImport<JWebViewJSServiceClass, JWebViewJSService>) end;


implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.WebViewJSService.JWebViewJSService',
    TypeInfo(Androidapi.JNI.WebViewJSService.JWebViewJSService));

  TRegTypes.RegisterType('Androidapi.JNI.WebViewJSService.JWebViewJSService_OnJSServiceListener',
    TypeInfo(Androidapi.JNI.WebViewJSService.JWebViewJSService_OnJSServiceListener));
end;

initialization
  RegisterTypes;

end.
