unit uBaseThirdPartyAccountAuthLogin;

interface


uses
  Classes,
  SysUtils,
  uBaseList,
  XSuperObject;


type
  TAuthLoginUserInfo=class;
  TAuthLoginEndEvent=procedure(Sender:TObject;AIsSucc:Boolean;ADesc:String;AAccessToken:String;
                                AAccessTokenInfoJson:ISuperObject
                                ) of object;

  TAuthLoginUserInfo=class
    //��Ȩ�Ǻ󷵻ص��û����ƺ�ͷ��,�����ϴ���������
    FNickName:String;
    FName:String;
//    FUserHeadPicFilePath:String;
    FUserHeadUrl:String;

    //��ǰӦ�õ��û�ID
    FOpenID:String;
    //����ƽ̨���û�ID
    FUnionID:String;
//    procedure Clear;
  end;
  //�����˺���Ȩ
  IBaseThirdPartyAccountAuthLoginAPI=interface
  ['{A76EB2EA-077C-4AF4-BEDA-759F2BAA01AE}']
//  public
    function GetAPIType:String;
    function GetPlatformType:String;
    //��������
    procedure LoadSetting(ASettingJson:ISuperObject);
    //������Ȩ�ɹ��ص��¼�
    procedure SetOnAuthLoginEnd(AOnAuthLoginEnd:TAuthLoginEndEvent);
//    procedure SetOnGetUseInfoEnd(AOnGetUseInfoEnd:TNotifyEvent);
    //��Ȩ
    procedure AuthLogin;
    function GetUserInfo(var ADesc:String):ISuperObject;
    //������Ȩ�����Ϣ
    function GetAuthLoginUserInfo:TAuthLoginUserInfo;
  end;


  //���ڴ�����Ӧƽ̨�Ľӿ�
  TCreateThirdPartyAccountAuthLoginFunction=function():IBaseThirdPartyAccountAuthLoginAPI;
  TCreateThirdPartyAccountAuthLoginRegItem=class
    PlatformName:String;
    APIType:String;
    Func:TCreateThirdPartyAccountAuthLoginFunction;
  end;

  TCreateThirdPartyAccountAuthLoginRegList=class(TBaseList)
  private
    function GetItem(Index: Integer): TCreateThirdPartyAccountAuthLoginRegItem;
  public
    function Find(APlatformName:String;AAPIType:String):TCreateThirdPartyAccountAuthLoginRegItem;
    function CreateAPI(APlatformName:String;AAPIType:String):IBaseThirdPartyAccountAuthLoginAPI;
    property Items[Index:Integer]:TCreateThirdPartyAccountAuthLoginRegItem read GetItem;default;
  end;




var
  GlobalCreateThirdPartyAccountAuthLoginRegList:TCreateThirdPartyAccountAuthLoginRegList;


implementation


{ TCreateThirdPartyAccountAuthLoginRegList }

function TCreateThirdPartyAccountAuthLoginRegList.CreateAPI(
  APlatformName: String;AAPIType:String): IBaseThirdPartyAccountAuthLoginAPI;
begin
  if Find(APlatformName,AAPIType)<>nil then
  begin
    Result:=Find(APlatformName,AAPIType).Func();
  end;
end;

function TCreateThirdPartyAccountAuthLoginRegList.Find(APlatformName: String;AAPIType:String): TCreateThirdPartyAccountAuthLoginRegItem;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Count-1 do
  begin
    if SameText(Items[I].PlatformName,APlatformName) and SameText(Items[I].APIType,AAPIType) then
    begin
      Result:=Items[I];
      Exit;
    end;
  end;

end;

function TCreateThirdPartyAccountAuthLoginRegList.GetItem(
  Index: Integer): TCreateThirdPartyAccountAuthLoginRegItem;
begin
  Result:=TCreateThirdPartyAccountAuthLoginRegItem(Inherited Items[Index]);
end;


{ TAuthLoginUserInfo }

//procedure TAuthLoginUserInfo.Clear;
//begin
//    //��Ȩ�Ǻ󷵻ص��û����ƺ�ͷ��,�����ϴ���������
//    FNickName:='';
//    FName:='';
////    FUserHeadPicFilePath:='';
//    FUserHeadUrl:='';
//
//    //��ǰӦ�õ��û�ID
//    FOpenID:='';
//    //����ƽ̨���û�ID
//    FUnionID:='';
//
//end;

initialization
  GlobalCreateThirdPartyAccountAuthLoginRegList:=TCreateThirdPartyAccountAuthLoginRegList.Create();

finalization
  FreeAndNil(GlobalCreateThirdPartyAccountAuthLoginRegList);

end.
