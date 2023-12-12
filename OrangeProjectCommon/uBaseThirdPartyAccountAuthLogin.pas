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
    //授权登后返回的用户名称和头像,用于上传到服务器
    FNickName:String;
    FName:String;
//    FUserHeadPicFilePath:String;
    FUserHeadUrl:String;

    //当前应用的用户ID
    FOpenID:String;
    //整个平台的用户ID
    FUnionID:String;
//    procedure Clear;
  end;
  //三方账号授权
  IBaseThirdPartyAccountAuthLoginAPI=interface
  ['{A76EB2EA-077C-4AF4-BEDA-759F2BAA01AE}']
//  public
    function GetAPIType:String;
    function GetPlatformType:String;
    //加载设置
    procedure LoadSetting(ASettingJson:ISuperObject);
    //设置授权成功回调事件
    procedure SetOnAuthLoginEnd(AOnAuthLoginEnd:TAuthLoginEndEvent);
//    procedure SetOnGetUseInfoEnd(AOnGetUseInfoEnd:TNotifyEvent);
    //授权
    procedure AuthLogin;
    function GetUserInfo(var ADesc:String):ISuperObject;
    //返回授权相关信息
    function GetAuthLoginUserInfo:TAuthLoginUserInfo;
  end;


  //用于创建对应平台的接口
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
//    //授权登后返回的用户名称和头像,用于上传到服务器
//    FNickName:='';
//    FName:='';
////    FUserHeadPicFilePath:='';
//    FUserHeadUrl:='';
//
//    //当前应用的用户ID
//    FOpenID:='';
//    //整个平台的用户ID
//    FUnionID:='';
//
//end;

initialization
  GlobalCreateThirdPartyAccountAuthLoginRegList:=TCreateThirdPartyAccountAuthLoginRegList.Create();

finalization
  FreeAndNil(GlobalCreateThirdPartyAccountAuthLoginRegList);

end.
