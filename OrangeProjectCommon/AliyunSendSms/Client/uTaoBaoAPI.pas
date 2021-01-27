unit uTaoBaoAPI;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Dialogs,
  StrUtils,
  SyncObjs,
  UrlMon,
  uTaoBaoAuth,
  uTaoBaoAuth_TopProtocal,
  uTaoBaoPublic,
  uWorkThreadPool,
  uWorkThreadList,
  uTaoBaoAPIParam;

type

  //{$Region '�Ա�API��'}
  //Http��������
  TTaoBaoAPIItem=class;




  //�Ա�API��
  TTaoBaoAPIItem=class
  private
    //��������
    FCaption:String;
    //��������
    FAPIMethod:String;
    //API�ĵ��÷�ʽ��ʹ��Json����Xml�ĵ�
    FFormat:TCallAPIFormat;
    //��������
    FHttpRequestMethods:TCallAPIHttpRequestMethods;


    //TopЭ��API����
    FNeedAppKeyParam:Boolean;
    FNeedVersionParam:Boolean;
    FNeedMethodParam:Boolean;
    FNeedTimeStampParam:Boolean;
    FNeedFormatParam:Boolean;
    FNeedSignMethodParam:Boolean;

  protected
    procedure InitAPI;virtual;
  public
    constructor Create;virtual;
    destructor Destroy;override;
  public
    //API�ĵ��÷�ʽ��ʹ��Json����Xml�ĵ�
    property Format:TCallAPIFormat read FFormat write FFormat;
    //��������
    property Caption:String read FCaption write FCaption;
    //��������
    property APIMethod:String read FAPIMethod write FAPIMethod;
    //����ʽ
    property HttpRequestMethods:TCallAPIHttpRequestMethods read FHttpRequestMethods write FHttpRequestMethods;


    //TopЭ��API����
    property NeedAppKeyParam:Boolean read FNeedAppKeyParam write FNeedAppKeyParam;
    property NeedVersionParam:Boolean read FNeedVersionParam write FNeedVersionParam;
    property NeedMethodParam:Boolean read FNeedMethodParam write FNeedMethodParam;
    property NeedTimeStampParam:Boolean read FNeedTimeStampParam write FNeedTimeStampParam;
    property NeedFormatParam:Boolean read FNeedFormatParam write FNeedFormatParam;
    property NeedSignMethodParam:Boolean read FNeedSignMethodParam write FNeedSignMethodParam;
  end;



  TTaoBaoAPIClient=class
  private
    FAuth:TTaoBaoAuth_TopProtocal;
  public
    constructor Create(AAuth:TTaoBaoAuth_TopProtocal);
    Destructor Destroy;override;
  public
    //�Զ������API
    function CustomExecuteAPI(const AHttpControl:THttpControl;
                              const AAPIItem:TTaoBaoAPIItem;
                              const AParamNames:array of String;
                              const AParamValues:array of Variant;
                              const AFormat:TCallAPIFormat;
                              const AHttpRequestMethod:TCallAPIHttpRequestMethod;
                              var AHttpResponse:String
                              ):Boolean;
  public
    //��֤
    property Auth:TTaoBaoAuth_TopProtocal read FAuth write FAuth;

  end;


implementation


{ TTaoBaoAPIClient }

constructor TTaoBaoAPIClient.Create(AAuth:TTaoBaoAuth_TopProtocal);
begin
  FAuth:=AAuth;
end;

function TTaoBaoAPIClient.CustomExecuteAPI(const AHttpControl:THttpControl;
                          const AAPIItem:TTaoBaoAPIItem;
                          const AParamNames: array of String;
                          const AParamValues: array of Variant;
                          const AFormat:TCallAPIFormat;
                          const AHttpRequestMethod:TCallAPIHttpRequestMethod;
                          var AHttpResponse:String):Boolean;
var
  I:Integer;
  AHttpURL:String;
  AHttpResult:Boolean;
  AParams:TQueryParameters;
begin
  Result:=False;
  AHttpResponse:='';

  case AHttpRequestMethod of
    rmPost:
    begin
//      if FAuth.PostCallAPIHttpUrl(AAPIItem,
//                                  AParamNames,
//                                  AParamValues,
//                                  AFormat,
//                                  AParams,
//                                  AHttpUrl) then
//      begin
//        AHttpControl.Lock;
//        try
//          AHttpUrl:=Self.FAuth.APIUrl+'?'+AHttpUrl;
//          AHttpResponse:=AHttpControl.Post(AHttpUrl,AAPIItem.FAPIMethod);
//          Result:=True;
//        finally
//          AHttpControl.UnLock;
//        end;
//      end;
    end;
    rmGet:
    begin
      if FAuth.GetCallAPIHttpUrl(AAPIItem,
                                  AParamNames,
                                  AParamValues,
                                  AFormat,
                                  AHttpUrl) then
      begin
          AHttpUrl:=Self.FAuth.APIUrl+'?'+AHttpUrl;

          AHttpControl.Lock;
          try
            AHttpResponse:=AHttpControl.Get(AHttpURL,AAPIItem.FAPIMethod);
            Result:=True;
          finally
            AHttpControl.UnLock;
          end;
      end;
    end;
  end;
end;


destructor TTaoBaoAPIClient.Destroy;
begin
  inherited;
end;

{ TTaoBaoAPIItem }

constructor TTaoBaoAPIItem.Create;
begin
  InitAPI;
end;

destructor TTaoBaoAPIItem.Destroy;
begin
  inherited;
end;

procedure TTaoBaoAPIItem.InitAPI;
begin
  FFormat:=cpsJson;
  FCaption:='';
  FAPIMethod:='';
  FHttpRequestMethods:=[rmGet];

  FNeedAppKeyParam:=True;
  FNeedVersionParam:=True;
  FNeedMethodParam:=True;
  FNeedTimeStampParam:=True;
  FNeedFormatParam:=True;
  FNeedSignMethodParam:=True;
end;

end.
