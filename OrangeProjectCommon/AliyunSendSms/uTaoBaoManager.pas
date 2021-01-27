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
  //�Ա�����
  TTaoBaoManager=class
  private
    //��Ȩ�������������Ϊ����Ϊ����OAuth2.0��Ȩ��֧�֣�����ֻ֧��TopЭ�飩
    FAuth:TTaoBaoAuth_TopProtocal;
    //API�ͻ���
    FAPIClient:TTaoBaoAPIClient;
    //Httpͨ�ſؼ�
    FCallAPIHttpControl:THttpControl;
  public
    constructor Create;
    destructor Destroy;override;
  public
    //��Ȩ
    property Auth:TTaoBaoAuth_TopProtocal read FAuth;
    //API�ͻ���
    property APIClient:TTaoBaoAPIClient read FAPIClient;
    //����API��HttpControl
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
  //��������
  GlobalSendSmsTaoBaoAPIItem.Caption:='���ŷ���';
  //��������
  GlobalSendSmsTaoBaoAPIItem.APIMethod:='SendSms';
  //��������
  GlobalSendSmsTaoBaoAPIItem.HttpRequestMethods:=[rmGet];



finalization
  GlobalTaoBaoManager.Free;
  GlobalSendSmsTaoBaoAPIItem.Free;


end.
