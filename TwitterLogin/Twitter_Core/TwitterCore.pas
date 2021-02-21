unit TwitterCore;

interface

uses
  System.Messaging,
  System.SysUtils,
  FMX.Dialogs,
  FMX.Types,
  FMX.Controls,
  System.Classes,
{$IFDEF IOS}
  iOSApi.Twitter,
  iOSapi.UIKit,
  iOSapi.Foundation,
  iOSApi.TWTRSession,
  iOSApi.TWTRAPIClient,
  iOSApi.TWTRUser,

  FMX.Platform,
  FMX.Platform.iOS,
  FMX.Helpers.iOS,

  Macapi.Helpers,
{$ENDIF}

{$IFDEF ANDROID}
  Androidapi.JNI.classes,
  Androidapi.JNI.my_twitter_user,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.my_twitter_UserInformation,
  FMX.Helpers.Android,
  Androidapi.Helpers,
{$ENDIF}
  uAndroidViewController;

type
  {$IFDEF ANDROID}
  TWitter=class;
  TJMyTwitterSessionCallback_MyCallBackTwitterSession=class(TJavaLocal,JMyTwitterSessionCallback_MyCallBackTwitterSession)
  public
    { Property Methods }
    FUserID:Integer;
    FUserName:String;
    FToken:JTwitterAuthToken;
    { methods }
    procedure success(P1: JResult; P2: Int64; P3: JString; P4: JTwitterAuthToken); cdecl;
    procedure failure; cdecl;
  public
    FTwitter:TWitter;
    constructor Create(ATwitter:TWitter);
    { Property }
  end;

  TJMyCallUser_GetMyInfo = class(TJavaLocal,JMyCallUser_GetMyInfo)
  public
    { Property Methods }

    { methods }
    procedure success(P1: JUser); cdecl;
    procedure failure; cdecl;
  public
    FTwitter:TWitter;
    constructor Create(ATwitter:TWitter);
  end;
  {$ENDIF}

  TWitter=class
  public
    {$IFDEF ANDROID}
    FTwitterConfigBuilder:JTwitterConfig_Builder;
    FTwitterAuthConfig:JTwitterAuthConfig;
    FTwitterConfig:JTwitterConfig;
    FJTwitterSession:JTwitterSession;
    FMyCallBackTwitterSession:TJMyTwitterSessionCallback_MyCallBackTwitterSession;
    FMyCallBackUserInfo:TJMyCallUser_GetMyInfo;
    FCallbackTwitterSession:JMyTwitterSessionCallback;
    FLoginButton:JTwitterLoginButton;
    FGetMyInfo:JMyCallUser;
    FUser:JUSer;
    FAndroidViewController:TAndroidViewController;
   {$ENDIF}


    FKey:String;
    FSecret:String;

    FUserName:String;
    FUserID:Integer;
    FUserProfileImageUrl:String;
    FUserSereenName:String;
    FUserProfileImageUrlHttps:String;

    FToken:String;

    FOnGetUserInfoComplete:TNotifyEvent;

    //初始化
    procedure initialize;

    //登录
    procedure TwitterLogin(AControl:TControl);

    //获取用户信息
    procedure GetTwitterUserInfo;

  public
    {$IFDEF ANDROID}
    FMessageSubscriptionID: Integer;
    //启动扫描结果处理的定时器
    function OnActivityResult(RequestCode, ResultCode: Integer; Data: JIntent): Boolean;
    procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);
    {$ENDIF}

    {$IFDEF IOS}
    FApplicationEventService:IFMXApplicationEventService;
    function OnApplicationEventHandler(AAppEvent: TApplicationEvent; AContext: TObject):Boolean;

    procedure DoLoginCompletion(session:TWTRSession;error:NSError);

    procedure DoGetTwitterUserInfo(twitteruser:TWTRUser;error:NSError);
    {$ENDIF}


  end;

implementation


{ TWitter }

{$IFDEF IOS}
procedure TWitter.DoGetTwitterUserInfo(twitteruser: TWTRUser; error: NSError);
begin

  Self.FUserName:=NSStrToStr(twitteruser.name);
  Self.FUserID:=StrToInt(NSStrToStr(twitteruser.userID));
  Self.FUserProfileImageUrl:=NSStrToStr(twitteruser.profileImageURL);
end;
{$ENDIF}

{$IFDEF IOS}
procedure TWitter.DoLoginCompletion(session: TWTRSession; error: NSError);
begin

  Self.FUserID:=StrToInt(NSStrToStr(session.userID));;
  Self.FToken:=NSStrToStr(session.authToken);
end;
{$ENDIF}

procedure TWitter.GetTwitterUserInfo;
begin
 {$IFDEF ANDROID}
  FJTwitterSession:=TJTwitterSession.JavaClass.init(FMyCallBackTwitterSession.FToken,FMyCallBackTwitterSession.FUserID,StringToJString(FMyCallBackTwitterSession.FUserName));
  FGetMyInfo:=TJMyCallUser.Create;
  FGetMyInfo.requestUserInfo(TAndroidHelper.Context,FJTwitterSession);
  FMyCallBackUserInfo:=TJMyCallUser_GetMyInfo.Create(Self);
  FGetMyInfo.setmyuserinfo(FMyCallBackUserInfo);
 {$ENDIF}
 {$IFDEF IOS}
 TTWTRAPIClient.OCClass.clientWithCurrentUser.loadUserWithIDcompletion(StrToNSStr(Self.FToken),DoGetTwitterUserInfo);
 {$ENDIF}
end;

 {$IFDEF ANDROID}
procedure TWitter.HandleActivityMessage(const Sender: TObject;
  const M: TMessage);
begin

  FMX.Types.Log.d('OrangeUI TForm8.HandleActivityMessage');
  if M is TMessageResultNotification then
  begin
    OnActivityResult(TMessageResultNotification(M).RequestCode,
                      TMessageResultNotification(M).ResultCode,
                      TMessageResultNotification(M).Value);

  end;

end;
{$ENDIF}

procedure TWitter.initialize;
begin
  {$IFDEF ANDROID}
  FTwitterConfigBuilder:=TJTwitterConfig_Builder.JavaClass.init(TAndroidHelper.Context);
  FTwitterAuthConfig:=TJTwitterAuthConfig.JavaClass.init(StringToJString(FKey),StringToJString(FSecret));
  FTwitterConfig:=FTwitterConfigBuilder.
                  twitterAuthConfig(FTwitterAuthConfig)
                  .debug(True)
                  .build;


  TJTwitter.JavaClass.initialize(FTwitterConfig);
  FMX.Types.Log.d('OrangeUI TWitter initialize');
  {$ENDIF}


  {$IFDEF IOS}
  TTwitter.OCClass.sharedInstance.startWithConsumerKeyconsumerSecret(
  StrToNSStr(FKey),
  StrtoNSStr(FSecret));

  FMX.Types.Log.d('OrangeUI btnIOSInitClick ');
  {$ENDIF}
end;
{$IFDEF ANDROID}
function TWitter.OnActivityResult(RequestCode, ResultCode: Integer;
  Data: JIntent): Boolean;
begin

  TMessageManager.DefaultManager.Unsubscribe(TMessageResultNotification, FMessageSubscriptionID);
  FMessageSubscriptionID := 0;

  if FLoginButton<>nil then
  begin
    FLoginButton.onActivityResult(requestCode, resultCode, data);
  end;


end;
{$ENDIF}

{$IFDEF IOS}
function TWitter.OnApplicationEventHandler(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin

  case AAppEvent of
    TApplicationEvent.OpenURL:
    begin
      Result:=False;
      if TTwitter.OCClass.sharedInstance.applicationopenURLoptions(
        SharedApplication,
        StrToNSUrl(TiOSOpenApplicationContext(AContext).URL),
        TiOSOpenApplicationContext(AContext).Context
        ) then
      begin
        Result:=True;
      end;
    end;
  end;

end;
{$ENDIF}


procedure TWitter.TwitterLogin(AControl:TControl);
begin
 //启动二维码扫描
  {$IFDEF ANDROID}
  FMessageSubscriptionID := TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification,HandleActivityMessage);
  FMX.Types.Log.d('OrangeUI TWitter TwitterLogin');
  CallInUIThread(
  procedure
  begin
    //授权登录
    FCallbackTwitterSession:=TJMyTwitterSessionCallback.JavaClass.init;
    FMyCallBackTwitterSession:=TJMyTwitterSessionCallback_MyCallBackTwitterSession.Create(Self);

    FLoginButton:=TJTwitterLoginButton.JavaClass.init(TAndroidHelper.Context);
    FCallbackTwitterSession.setmytwittersession(FMyCallBackTwitterSession);

    FLoginButton.setCallback(FCallbackTwitterSession.GetCallBack);



    FAndroidViewController:=TAndroidViewController.Create(AControl,TJView.Wrap((FLoginButton as ILocalObject).GetObjectID));
    FAndroidViewController.Show;
    FAndroidViewController.UpdateContentFromControl;

    FMX.Types.Log.d('OrangeUI FAndroidViewController Show');


  end);
  {$ENDIF}

  {$IFDEF IOS}
  FMX.Types.Log.d('OrangeUI IOS True');
  //登录
  TTWitter.OCClass.sharedInstance.logInWithCompletion(Self.DoLoginCompletion);
  {$ENDIF}
end;

{ TJMyCallUser_GetMyInfo }
{$IFDEF ANDROID}
constructor TJMyCallUser_GetMyInfo.Create(ATwitter: TWitter);
begin
  Inherited Create;
  Self.FTwitter:=ATwitter;
end;

procedure TJMyCallUser_GetMyInfo.failure;
begin
  FMX.Types.Log.d('OrangeUI TJMyCallUser_GetMyInfo failure');
end;

procedure TJMyCallUser_GetMyInfo.success(P1: JUser);
begin
  FMX.Types.Log.d('OrangeUI TJMyCallUser_GetMyInfo success');

  Self.FTwitter.FUser:=P1;
  Self.FTwitter.FUserName:=JStringToString(P1.name);
  Self.FTwitter.FUserID:=P1.id;
  Self.FTwitter.FUserProfileImageUrl:=JStringToString(P1.profileImageUrl);
  Self.FTwitter.FUserSereenName:=JStringToString(P1.screenName);
  Self.FTwitter.FUserProfileImageUrlHttps:=JStringToString(P1.profileImageUrlHttps);

  if Assigned(FTwitter.FOnGetUserInfoComplete) then
  begin
    FTwitter.FOnGetUserInfoComplete(FTwitter);
  end;
end;
{$ENDIF}

{ TJMyTwitterSessionCallback_MyCallBackTwitterSession }
{$IFDEF ANDROID}
constructor TJMyTwitterSessionCallback_MyCallBackTwitterSession.Create(
  ATwitter: TWitter);
begin
  Inherited Create;
  Self.FTwitter:=ATwitter;
end;

procedure TJMyTwitterSessionCallback_MyCallBackTwitterSession.failure;
begin
  FMX.Types.Log.d('OrangeUI TJMyTwitterSessionCallback_MyCallBackTwitterSession failure');
end;

procedure TJMyTwitterSessionCallback_MyCallBackTwitterSession.success(
  P1: JResult; P2: Int64; P3: JString; P4: JTwitterAuthToken);
begin
  FMX.Types.Log.d('OrangeUI TJMyTwitterSessionCallback_MyCallBackTwitterSession UserName'+JStringToString(P3));
  Self.FUserName:=JStringToString(P3);
  Self.FToken:=P4;
  Self.FUserID:=P2;
  Self.FTwitter.FToken:=JStringToString(P4.token);
end;
{$ENDIF}

end.
