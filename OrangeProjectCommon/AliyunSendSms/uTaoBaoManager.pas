unit uTaoBaoManager;

interface

uses
  Windows,
  SysUtils,
  Classes,
  DateUtils,
  uTaoBaoAPI,
  uTaoBaoAuth,
//  uBaseHttpControl,
  uTaoBaoPublic,
  uIdHttpControl,
  uWorkThreadPool,
  uTaoBaoAuth_TopProtocal;



type
  //淘宝管理
  TTaoBaoManager=class
  private
    //授权（放在这里，是因为后面为加入OAuth2.0授权的支持，现在只支持Top协议）
    FAuth:TTaoBaoAuth_TopProtocal;
    //API客户端
    FAPIClient:TTaoBaoAPIClient;
    //Http通信控件
    FCallAPIHttpControl:THttpControl;
  public
    constructor Create;
    destructor Destroy;override;
  public
    //授权
    property Auth:TTaoBaoAuth_TopProtocal read FAuth;
    //API客户端
    property APIClient:TTaoBaoAPIClient read FAPIClient;
    //调用API的HttpControl
    property CallAPIHttpControl:THttpControl read FCallAPIHttpControl;
  end;


var
  GlobalTaoBaoManager:TTaoBaoManager;

  GlobalSendSmsTaoBaoAPIItem:TTaoBaoAPIItem;



implementation


{ TTaoBaoManager }


constructor TTaoBaoManager.Create;
begin
  FAuth:=TTaoBaoAuth_TopProtocal.Create('','','');
  FCallAPIHttpControl:=TIdHttpControl.Create();

  TIdHttpControl(FCallAPIHttpControl).FIdHttp.Request.ContentType:='application/x-www-form-urlencoded';
  FAPIClient:=TTaoBaoAPIClient.Create(FAuth);
end;

destructor TTaoBaoManager.Destroy;
begin
  FAuth.Free;
  FAPIClient.Free;
  FCallAPIHttpControl.Free;
  inherited;
end;

initialization
  GlobalTaoBaoManager:=TTaoBaoManager.Create;


  GlobalTaoBaoManager.Auth.AppKey:='23432627';
  GlobalTaoBaoManager.Auth.AppSecret:='db7e32a03aa75ca802faeb933beac6c4';
  GlobalTaoBaoManager.Auth.APIUrl:=CONST_ONLINE_APIURL;




  GlobalSendSmsTaoBaoAPIItem:=TTaoBaoAPIItem.Create;
  //方法标题
  GlobalSendSmsTaoBaoAPIItem.Caption:='短信发送';
  //方法名称
  GlobalSendSmsTaoBaoAPIItem.APIMethod:='SendSms';
  //方法名称
  GlobalSendSmsTaoBaoAPIItem.HttpRequestMethods:=[rmGet];



finalization
  GlobalTaoBaoManager.Free;
  GlobalSendSmsTaoBaoAPIItem.Free;


end.
