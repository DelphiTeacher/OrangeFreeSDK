unit QQShare;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  {$IFDEF ANDROID}
  Androidapi.JNI.GraphicsContentViewText,

  FMX.Helpers.Android,
  Androidapi.JNI.App,
  FMX.Types, FMX.Controls,FMX.Graphics, FMX.Dialogs,
  Androidapi.JNI.open_sdk_r5886_lite,
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge,
  Androidapi.JNI.Os,
  Androidapi.JNI.Widget,

  {$ENDIF}


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


  System.IOUtils,
  System.Messaging,
  FlyFilesUtils,

  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Objects;

type
  TQQShare=class;
  {$IFDEF ANDROID}
  TJIUiListener = class(TJavaLocal,JIUiListener)
  public
    { methods }
    procedure onComplete(P1: JObject); cdecl;
    procedure onError(P1: JUiError); cdecl;
    procedure onCancel; cdecl;

  end;

  TJILoginUiListener = class(TJavaLocal,JIUiListener)
  public

    { methods }
    procedure onComplete(P1: JObject); cdecl;
    procedure onError(P1: JUiError); cdecl;
    procedure onCancel; cdecl;
  public
    FQQShare:TQQShare;
    constructor Create(AQQShare:TQQShare);
  end;

  TJIUserInfoUiListener = class(TJavaLocal,JIUiListener)
  public

    { methods }
    procedure onComplete(P1: JObject); cdecl;
    procedure onError(P1: JUiError); cdecl;
    procedure onCancel; cdecl;
  public
    FQQShare:TQQShare;
    constructor Create(AQQShare:TQQShare);
  end;

  {$ENDIF}

  TQQShare=class
  private
    {$IFDEF ANDROID}
    FTencent:JTencent;

    FJIUiListener:JIUiListener;

    FJIUiLoginListener:JIUiListener;

    FJIUserInfoUiListener:JIUiListener;

    FJBundle:JBundle;
    FJUserInfo:JUserInfo;

    {$ENDIF}
    {$IFDEF IOS}
    _tencentOAuth:TencentOAuth;
    {$ENDIF}


  public
    FOpenId:String;
    FAccessToken:String;
    FExpireIn:String;

    FRet:Integer;
    FMsg:String;
    FIsLost:Integer;

    FNikName:String;
    FProvince:String;
    FCity:String;
    FFigureurl:String;
    FFigureurl1:String;
    FFigureurl2:String;
    FFigureurlqq1:String;
    FFigureurlqq2:String;
    FGender:String;
    FVip:String;
    FIsYellowVip:String;
    FYellowVipLevel:String;
    FLevel:String;
    FIsYellowYearVip:String;

    FOnGetUserInfoComplete:TNotifyEvent;

    procedure GetShare(AppID:String);

    procedure Login;//登录
    procedure Logout;//注销

    procedure AddAuthorize(
                           AString:String);

    procedure GetUserInfo;
    procedure ShareToQQ(
                        ATargetUrl:String;
                        ATitle:String;
                        AImageUrl:String;
                        ADetail:String;
                        AAppSource:String
                        );
    procedure ShareToQQZone(
                            ATargetUrl:String;
                            ATitle:String;
                            AQQDetail:String);
    procedure SharePicture(AStream:String);
    procedure ShareApp(
                       ATitle:String;
                       AImageUrl:String;
                       ADetail:String);//分享应用
    procedure ShareMusic(
                         ATargetUrl:String;
                         AAudioUrl:String;
                         AImageUrl:String;
                         ATitle:String;
                         ADetail:String);//分享音乐
    procedure SendToUser(
                         ATitle:String;
                         AMsg:String;
                         AImageUrl:String
                         );//发送请求或赠送礼物


  public
    {$IFDEF ANDROID}
    function OnActivityResult(RequestCode, ResultCode: Integer; Data: JIntent): Boolean;
    {$ENDIF}
  end;


implementation



{ TQQShare }

procedure TQQShare.AddAuthorize(AString: String);
begin
  {$IFDEF ANDROID}
  FJIUiListener:=TJIUiListener.Create;

  FTencent.reAuth(TAndroidHelper.Activity,StringToJString(AString),FJIUiListener);
  {$ENDIF}
end;

procedure TQQShare.GetShare(AppID: String);
{$IFDEF ANDROID}
var
  AJString:JString;
{$ENDIF}
begin

  FMX.Types.Log.d('OrangeUI TQQShare.GetShare Begin');
  {$IFDEF ANDROID}
  if FTencent=nil then
  begin
    AJString:=StringToJString(AppID);
    FTencent:=TJTencent.JavaClass.createInstance(AJString,TAndroidHelper.Context.getApplicationContext);
  end;
  {$ENDIF}

  {$IFDEF IOS}
  _tencentOAuth := TTencentOAuth.Wrap(TTencentOAuth.Alloc.initWithAppIdandDelegate(NSStr(AppId),nil));
  {$ENDIF}


  FMX.Types.Log.d('OrangeUI TQQShare.GetShare End');
end;


procedure TQQShare.GetUserInfo;
begin
  {$IFDEF ANDROID}
  FTencent.setOpenId(StringToJString(FOpenId));

  FTencent.setAccessToken(StringToJString(FAccessToken),StringToJString(FExpireIn));

  FJUserInfo:=TJUserInfo.JavaClass.init(TAndroidHelper.Context,FTencent.getQQToken);


  FJIUserInfoUiListener:=TJIUserInfoUiListener.Create(Self);


  FJUserInfo.getUserInfo(FJIUserInfoUiListener);

  {$ENDIF}
end;


procedure TQQShare.Logout;
begin
  {$IFDEF ANDROID}
  FTencent.logout(TAndroidHelper.Context);
  {$ENDIF}
end;

procedure TQQShare.Login;
begin
  {$IFDEF ANDROID}
  if not FTencent.isSessionValid then
  begin
    FJIUiLoginListener:=TJILoginUiListener.Create(Self);

    FTencent.login(TAndroidHelper.Activity,StringToJString('all'),FJIUiLoginListener);
  end
  else
  begin
    ShowMessage('Session可用');
  end;
  {$ENDIF}

end;

{$IFDEF ANDROID}
function TQQShare.OnActivityResult(RequestCode, ResultCode: Integer;
  Data: JIntent): Boolean;
var
  AString:JString;
begin
  Result := False;

  FMX.Types.Log.d('OrangeUI OnActivityResult');

  if FTencent<>nil then
  begin
    FMX.Types.Log.d('OrangeUI OnActivityResult'
        +' RequestCode '+IntToStr(RequestCode)
        +' ResultCode '+IntToStr(ResultCode)

        );


    //由于在一些低端机器上，因为内存原因，无法返回到回调onComplete里面，是以onActivityResult的方式返回
    if(RequestCode=11101) and (ResultCode=TJActivity.JavaClass.RESULT_OK) then
    begin
      //处理返回的数据
      if data=nil then
      begin
        FMX.Types.Log.d('OrangeUI OnActivityResult data=nil');

        AString:=StringToJString('返回数据为空');

        TJToast.JavaClass.makeText(TAndroidHelper.Context,
                                   AString.subSequence(0,AString.length),
                                   TJToast.JavaClass.LENGTH_LONG);
      end
      else
      begin
        FMX.Types.Log.d('OrangeUI OnActivityResult data<>nil');

          FTencent.handleLoginData(data,FJIUiLoginListener);

      end;

    end;


    FTencent.onActivityResult(RequestCode,ResultCode,Data);
  end;

//  if RequestCode = ScanRequestCode then
//  begin
//    if ResultCode = TJActivity.JavaClass.RESULT_OK then
//    begin
//      if Assigned(Data) then
//      begin
//        ScanContent := JStringToString(Data.getStringExtra(StringToJString('SCAN_RESULT')));
//        ScanFormat := JStringToString(Data.getStringExtra(StringToJString('SCAN_RESULT_FORMAT')));
//        edit1.Text:= ScanFormat;
//        edit2.Text:= ScanContent;
//        Label1.Text:= '扫描成功';
//      end;
//    end
//    else if ResultCode = TJActivity.JavaClass.RESULT_CANCELED then
//    begin
//      Label1.Text:= '扫描取消';
//    end;
//    Result := True;
//  end;
end;

{$ENDIF}

procedure TQQShare.SendToUser( ATitle, AMsg, AImageUrl: String);
{$IFDEF ANDROID}
var
  AString:String;
{$ENDIF}
begin
 {$IFDEF ANDROID}
  AString:='openid='+JStringToString(FTencent.getOpenId);

  FJIUiListener:=TJIUiListener.Create;

  FJBundle:=TJBundle.JavaClass.init;

  FJBundle.putString(TJSocialConstants.JavaClass.PARAM_RECEIVER,FTencent.getOpenId);
  FJBundle.putString(TJSocialConstants.JavaClass.PARAM_TITLE,StringToJString(ATitle));
  FJBundle.putString(TJSocialConstants.JavaClass.PARAM_SEND_MSG,StringToJString(AMsg));
  FJBundle.putString(TJSocialConstants.JavaClass.PARAM_IMG_URL,StringToJString(AImageUrl));

  FJBundle.putString(TJSocialConstants.JavaClass.PARAM_SOURCE,StringToJString(AString ));

  FJBundle.putString(StringToJString('exclude'),StringToJString(''));
  FJBundle.putString(StringToJString('specified'),StringToJString(''));
  FJBundle.putString(StringToJString('only'),StringToJString('0'));

  FTencent.ask(TAndroidHelper.Activity,FJBundle,FJIUiListener);
  {$ENDIF}
end;

procedure TQQShare.ShareApp(ATitle, AImageUrl, ADetail: String);
begin
  {$IFDEF ANDROID}
  FJIUiListener:=TJIUiListener.Create;

  FJBundle:=TJBundle.JavaClass.init;
  FJBundle.putInt(TJQQShare.JavaClass.SHARE_TO_QQ_KEY_TYPE,
                     TJQQShare.JavaClass.SHARE_TO_QQ_TYPE_APP);


  FJBundle.putString(TJQQShare.JavaClass.SHARE_TO_QQ_IMAGE_URL,
                   StringToJString(AImageUrl));
  FJBundle.putString(TJQQShare.JavaClass.SHARE_TO_QQ_TITLE,StringToJString(ATitle));

  FJBundle.putInt(TJQQShare.JavaClass.SHARE_TO_QQ_EXT_INT,TJQQShare.JavaClass.SHARE_TO_QQ_FLAG_QZONE_ITEM_HIDE);
  FJBundle.putString(TJQzoneShare.JavaClass.SHARE_TO_QQ_SUMMARY,StringToJString(ADetail));

  FTencent.shareToQQ(TAndroidHelper.Activity,FJBundle,FJIUiListener);
  {$ENDIF}
end;

procedure TQQShare.ShareMusic(ATargetUrl, AAudioUrl, AImageUrl, ATitle,
  ADetail: String);
begin

  {$IFDEF ANDROID}
  FJIUiListener:=TJIUiListener.Create;

  FJBundle:=TJBundle.JavaClass.init;
  FJBundle.putInt(TJQQShare.JavaClass.SHARE_TO_QQ_KEY_TYPE,
                     TJQQShare.JavaClass.SHARE_TO_QQ_TYPE_AUDIO);

  FJBundle.putString(TJQQShare.JavaClass.SHARE_TO_QQ_TARGET_URL,
                   StringToJString(ATargetUrl));
  FJBundle.putString(TJQQShare.JavaClass.SHARE_TO_QQ_AUDIO_URL,StringToJString(AAudioUrl));
  FJBundle.putString(TJQQShare.JavaClass.SHARE_TO_QQ_IMAGE_URL,
                   StringToJString(AImageUrl));
  FJBundle.putString(TJQQShare.JavaClass.SHARE_TO_QQ_TITLE,StringToJString(ATitle));
  FJBundle.putInt(TJQQShare.JavaClass.SHARE_TO_QQ_EXT_INT,TJQQShare.JavaClass.SHARE_TO_QQ_FLAG_QZONE_ITEM_HIDE);
  FJBundle.putString(TJQzoneShare.JavaClass.SHARE_TO_QQ_SUMMARY,StringToJString(ADetail));

  FTencent.shareToQQ(TAndroidHelper.Activity,FJBundle,FJIUiListener);
  {$ENDIF}
end;

procedure TQQShare.SharePicture(AStream: String);
begin
  {$IFDEF ANDROID}
  FJIUiListener:=TJIUiListener.Create;

  FJBundle:=TJBundle.JavaClass.init;

  FJBundle.putInt(TJQQShare.JavaClass.SHARE_TO_QQ_KEY_TYPE,
                  TJQQShare.JavaClass.SHARE_TO_QQ_TYPE_IMAGE);
  FJBundle.putString(TJQQShare.JavaClass.SHARE_TO_QQ_IMAGE_LOCAL_URL,StringToJString(AStream));

  FJBundle.putInt(TJQQShare.JavaClass.SHARE_TO_QQ_EXT_INT,TJQQShare.JavaClass.SHARE_TO_QQ_FLAG_QZONE_ITEM_HIDE);

  FTencent.shareToQQ(TAndroidHelper.Activity,FJBundle,FJIUiListener);
  {$ENDIF}
end;

procedure TQQShare.ShareToQQ(ATargetUrl, ATitle, AImageUrl, ADetail,
  AAppSource: String);
begin
  {$IFDEF ANDROID}
  FJIUiListener:=TJIUiListener.Create;


  FJBundle:=TJBundle.JavaClass.init;

  FJBundle.putString(TJSocialConstants.JavaClass.PARAM_TARGET_URL,StringToJString(ATargetUrl));

  FJBundle.putString(TJSocialConstants.JavaClass.PARAM_TITLE,StringToJString(ATitle));
  FJBundle.putString(TJSocialConstants.JavaClass.PARAM_IMAGE_URL,StringToJString(AImageUrl));
  FJBundle.putString(TJSocialConstants.JavaClass.PARAM_SUMMARY,StringToJString(ADetail));
  FJBundle.putString(TJSocialConstants.JavaClass.PARAM_APP_SOURCE,StringToJString(AAppSource));

  FTencent.shareToQQ(TAndroidHelper.Activity,FJBundle,FJIUiListener);
  {$ENDIF}
end;

procedure TQQShare.ShareToQQZone(ATargetUrl, ATitle, AQQDetail: String);
{$IFDEF ANDROID}
var
  AArrayList:JArrayList;
{$ENDIF}
begin
  {$IFDEF ANDROID}
  FJIUiListener:=TJIUiListener.Create;

  AArrayList:=TJArrayList.Create;

  FJBundle:=TJBundle.JavaClass.init;
  FJBundle.putInt(TJQzoneShare.JavaClass.SHARE_TO_QZONE_KEY_TYPE,
                     TJQzoneShare.JavaClass.SHARE_TO_QZONE_TYPE_IMAGE_TEXT);

  FJBundle.putString(TJQzoneShare.JavaClass.SHARE_TO_QQ_TITLE,StringToJString(ATitle));
  FJBundle.putString(TJQzoneShare.JavaClass.SHARE_TO_QQ_SUMMARY,StringToJString(AQQDetail));
  FJBundle.putString(TJQzoneShare.JavaClass.SHARE_TO_QQ_TARGET_URL,StringToJString(ATargetUrl));
  FJBundle.putStringArrayList(TJQzoneShare.JavaClass.SHARE_TO_QQ_IMAGE_URL,AArrayList);

  FTencent.shareToQzone(TAndroidHelper.Activity,FJBundle,FJIUiListener);
  {$ENDIF}
end;

{$IFDEF ANDROID}
{ TJIUiListener }

procedure TJIUiListener.onCancel;
begin
  FMX.Types.Log.d('OrangeUI TJIUiListener onCancel');
end;

procedure TJIUiListener.onComplete(P1: JObject);
begin
  FMX.Types.Log.d('OrangeUI TJIUiListener onComplete'+JStringToString(P1.toString));
end;

procedure TJIUiListener.onError(P1: JUiError);
begin
  FMX.Types.Log.d('OrangeUI TJIUiListener onError'+JStringToString(P1.toString));
end;



{ TJILoginUiListener }

constructor TJILoginUiListener.Create(AQQShare: TQQShare);
begin
  Inherited Create;
  FQQShare:=AQQShare;
end;

procedure TJILoginUiListener.onCancel;
begin
   FMX.Types.Log.d('OrangeUI TJILoginUiListener onCancel'+'已取消');
end;

procedure TJILoginUiListener.onComplete(P1: JObject);
var
  jo:JJsonObject;
begin
  FMX.Types.Log.d('OrangeUI TJILoginUiListener.onComplete');
  FMX.Types.Log.d('OrangeUI TJILoginUiListener.onComplete '+JStringToString(P1.toString));

  jo:=TJJsonObject.Wrap((P1 as ILocalObject).GetObjectID);

  FQQShare.FOpenId:=JStringToString(jo.getString(StringToJString('openid')));

  FMX.Types.Log.d('OrangeUI TJILoginUiListener.onComplete FOpenId'+FQQShare.FOpenId);

  FQQShare.FExpireIn:=JStringToString(jo.getString(StringToJString('expires_in')));

  FMX.Types.Log.d('OrangeUI TJILoginUiListener.onComplete FExpireIn'+FQQShare.FExpireIn);

  FQQShare.FAccessToken:=JStringToString(jo.getString(StringToJString('access_token')));

  FMX.Types.Log.d('OrangeUI TJILoginUiListener.onComplete FAccessToken'+FQQShare.FAccessToken);


end;

procedure TJILoginUiListener.onError(P1: JUiError);
begin
  FMX.Types.Log.d('OrangeUI TJILoginUiListener onError'+JStringToString(P1.toString));
end;

{ TJIUserInfoUiListener }

constructor TJIUserInfoUiListener.Create(AQQShare: TQQShare);

begin
  Inherited Create;
  FQQShare:=AQQShare;
end;

procedure TJIUserInfoUiListener.onCancel;
begin
  FMX.Types.Log.d('OrangeUI TJIUserInfoUiListener onCancel'+'已取消');
end;

procedure TJIUserInfoUiListener.onComplete(P1: JObject);
var
  jo:JJsonObject;
begin

  FMX.Types.Log.d('OrangeUI TJIUserInfoUiListener onCancel'+JStringToString(P1.toString));

  jo:=TJJsonObject.Wrap((P1 as ILocalObject).GetObjectID);


  FQQShare.FRet:=jo.getInt(StringToJString('ret'));
  FQQShare.FMsg:=JStringToString(jo.getString(StringToJString('msg')));
  FQQShare.FIsLost:=jo.getInt(StringToJString('is_lost'));

  FQQShare.FNikName:=JStringToString(jo.getString(StringToJString('nickname')));

  FQQShare.FGender:=JStringToString(jo.getString(StringToJString('gender')));
  FQQShare.FProvince:=JStringToString(jo.getString(StringToJString('province')));
  FQQShare.FCity:=JStringToString(jo.getString(StringToJString('city')));
  FQQShare.FFigureurl:=JStringToString(jo.getString(StringToJString('figureurl')));
  FQQShare.FFigureurl1:=JStringToString(jo.getString(StringToJString('figureurl_1')));
  FQQShare.FFigureurl2:=JStringToString(jo.getString(StringToJString('figureurl_2')));
  FQQShare.FFigureurlqq1:=JStringToString(jo.getString(StringToJString('figureurl_qq_1')));
  FQQShare.FFigureurlqq2:=JStringToString(jo.getString(StringToJString('figureurl_qq_2')));

  FQQShare.FIsYellowVip:=JStringToString(jo.getString(StringToJString('is_yellow_vip')));
  FQQShare.FVip:=JStringToString(jo.getString(StringToJString('vip')));
  FQQShare.FYellowVipLevel:=JStringToString(jo.getString(StringToJString('yellow_vip_level')));
  FQQShare.FLevel:=JStringToString(jo.getString(StringToJString('level')));
  FQQShare.FIsYellowYearVip:=JStringToString(jo.getString(StringToJString('is_yellow_year_vip')));


  if Assigned(FQQShare.FOnGetUserInfoComplete) then
  begin
    FQQShare.FOnGetUserInfoComplete(FQQShare);
  end;


end;

procedure TJIUserInfoUiListener.onError(P1: JUiError);
begin
  FMX.Types.Log.d('OrangeUI TJIUserInfoUiListener onError'+JStringToString(P1.toString));
end;
{$ENDIF}
end.
