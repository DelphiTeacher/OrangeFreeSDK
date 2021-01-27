(*
 * THIS FILE DO NOT RECREATE by Java2OP.exe !!!!!
 * THIS IS HAND-MADE !
 * BECAUSE Java2OP IS FAILED !
 *)

unit Androidapi.JNI.SGWebClient;

// (*
{$IFNDEF ANDROID}
{$WARNINGS OFF 1011}
interface
implementation
end.
{$ENDIF}
// *)

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Webkit,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,
  Androidapi.JNI.Net;

type
  JSGWebClient = interface;//jp.serialgames.WebClient

  JSGWebClientClass = interface(JWebViewClientClass)
    ['{EF3AD3BB-A754-48BF-AAF7-08F96F695E51}']
    {class} function init: JSGWebClient; cdecl; overload;
  end;

  [JavaSignature('jp/serialgames/SGWebClient')]
  JSGWebClient = interface(JWebViewClient)
    ['{2CA265FA-191F-4BCC-8E77-9FEF883428E5}']
    function getWebView: JWebView; cdecl;
    function getHash: Integer; cdecl;
    function getMessage1: JMessage; cdecl;
    function getMessage2: JMessage; cdecl;
    function getBitmap: JBitmap; cdecl;
    function getHttpAuthHandler: JHttpAuthHandler; cdecl;
    function getSslErrorHandler: JSslErrorHandler; cdecl;
    function getSslError: JSslError; cdecl;
    function getKeyEvent: JKeyEvent; cdecl;

    procedure setWebView(view: JWebView); cdecl;
    procedure doUpdateVisitedHistory(
      view: JWebView;
      url: JString;
      isReload: Boolean); cdecl;
    procedure onFormResubmission(
      view: JWebView;
      dontResend: JMessage;
      resend: JMessage); cdecl;
    procedure onLoadResource(view: JWebView; url: JString); cdecl;
    procedure onPageFinished(view: JWebView; url: JString); cdecl;
    procedure onPageStarted(
      view: JWebView;
      url: JString;
      favicon: JBitmap); cdecl;
    procedure onReceivedError(
      view: JWebView;
      errorCode: Integer;
      description: JString;
      failingUrl: JString); cdecl;
    procedure onReceivedHttpAuthRequest(
      view: JWebView;
      handler: JHttpAuthHandler;
      host: JString;
      realm: JString); cdecl;
    procedure onReceivedSslError(
      view: JWebView;
      handler: JSslErrorHandler;
      error: JSslError );
    procedure onScaleChanged(
      view: JWebView;
      oldScale: Single;
      newScale: Single); cdecl;
    procedure onUnhandledKeyEvent(view: JWebView; event: JKeyEvent); cdecl;
    function shouldOverrideKeyEvent(
      view: JWebView;
      event: JKeyEvent): Boolean; cdecl;
    function shouldOverrideUrlLoading(
      view: JWebView;
      url: JString): Boolean; cdecl;
  end;

  TJSGWebClient = class(TJavaGenericImport<JSGWebClientClass, JSGWebClient>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType(
    'Androidapi.JNI.SGWebClient.JSGWebClient',
    TypeInfo(Androidapi.JNI.SGWebClient.JSGWebClient));
end;

initialization
  RegisterTypes;

end.


