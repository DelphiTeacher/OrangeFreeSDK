unit uTencentQQAPI;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  {$IFDEF IOS}


  QQApiInterfaceObject_iOSApi,
  TencentOAuth_iOSApi,
  QQApiInterface_iOSApi,

	iOSapi.Foundation,
	MacApi.ObjectiveC,
  Macapi.ObjCRuntime,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
  iOSapi.UIKit,
  Macapi.Helpers,
  FMX.Platform.iOS,

  {$ENDIF}

  FMX.Platform;

type
  TTencentQQAPI=class
  private
    {$IFDEF IOS}
    _tencentOAuth:TencentOAuth;
    {$ENDIF}
  public
    constructor Create;
    destructor Destroy;override;
  public
    //注册
    function RegisterTencent(AppId:String): Boolean;
    //发送文本
    function SendText(AText:String):Boolean;

    function DoApplicationEventHandler(AAppEvent: TApplicationEvent; AContext: TObject):Boolean;
  end;

implementation

{ TTencentQQAPI }

constructor TTencentQQAPI.Create;
begin
end;

destructor TTencentQQAPI.Destroy;
begin
  inherited;
end;

function TTencentQQAPI.DoApplicationEventHandler(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
  {$IFDEF IOS}
var
  ANSURL:NSURL;
  {$ENDIF}
begin
  case AAppEvent of
    TApplicationEvent.OpenURL:
    begin
      //处理QQ跳转回本APP的信息
      {$IFDEF IOS}
      if _tencentOAuth<>nil then
      begin
        ANSURL:=TNSURL.Wrap(TNSURL.OCClass.URLWithString(NSStr(TiOSOpenApplicationContext(AContext).URL)));
        TTencentOAuth.OCClass.HandleOpenURL(ANSURL);
      end;
      {$ENDIF}
    end;
  end;
end;

function TTencentQQAPI.RegisterTencent(AppId: String): Boolean;
begin
  {$IFDEF IOS}
  _tencentOAuth := TTencentOAuth.Wrap(TTencentOAuth.Alloc.initWithAppIdandDelegate(NSStr(AppId),nil));
  {$ENDIF}
end;

function TTencentQQAPI.SendText(AText: String): Boolean;
  {$IFDEF IOS}
var
  txtObj:QQApiTextObject;
  req:SendMessageToQQReq;
  sent:QQApiSendResultCode;
  {$ENDIF}
begin
  {$IFDEF IOS}
//  QQApiTextObject* txtObj = [QQApiTextObject objectWithText:editCtrl.objText.text];
//  SendMessageToQQReq* req = [SendMessageToQQReq reqWithContent:txtObj];
//
//  QQApiSendResultCode sent = [QQApiInterface sendReq:req];
//  [self handleSendResult:sent];
  txtObj:=TQQApiTextObject.Wrap(TQQApiTextObject.OCClass.objectWithText(NSStr(AText)));
  req:=TSendMessageToQQReq.OCClass.reqWithContent(txtObj);
  TQQApiInterface.OCClass.sendReq(req);
  {$ENDIF}
end;

end.
