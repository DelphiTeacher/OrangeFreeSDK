unit uBaseThirdPartyAccountAuth;

interface

{$I OpenPlatformClient.inc}


uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
//  uFileCommon,
//  uComponentType,
//  IOUtils,
//  IdURI,


  uBaseLog,
//  uOpenClientCommon,
  uOpenUISetting,
  uFuncCommon,
  uSkinItems,
  uFrameContext,

  {$IFDEF HAS_WXPAY}
  //微信登录
  uWeiChat,
  {$ENDIF HAS_WXPAY}

  {$IFDEF HAS_ALIPAY}
  //支付宝登录
  uAlipayMobilePay,
  {$ENDIF HAS_WXPAY}

  {$IFDEF HAS_FACEBOOK}
  FBLoginCommon,
  {$ENDIF HAS_FACEBOOK}

//  {$IFDEF HAS_TWITTER}
//  FBLoginCommon,
//  {$ENDIF HAS_TWITTER}


  {$IFDEF HAS_APPLESIGNIN}
  uAppleSignIn,
  {$ENDIF HAS_APPLESIGNIN}

  WaitingFrame,
  MessageBoxFrame,

//  uAppleSignIn,
  uSkinListBoxType,
  uOpenCommon,

  uConst,
  uLang,



  HintFrame,
  uManager,
//  uGetDeviceInfo,
  uRestInterfaceCall,
//  uCommonUtils,
  uTimerTask,
  uUIFunction,
  XSuperObject,
  XSuperJson,
  uBaseHttpControl,
//  CommonImageDataMoudle,
//  EasyServiceCommonMaterialDataMoudle,


  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
//  uSkinFireMonkeyControl, uSkinFireMonkeyPanel, uSkinFireMonkeyScrollControl,
//  uSkinFireMonkeyScrollBox,
//  uSkinFireMonkeyScrollBoxContent, uSkinMaterial, uSkinPanelType,
//  FMX.Controls.Presentation, FMX.Edit, uSkinFireMonkeyEdit, uSkinEditType,
//  uSkinFireMonkeyButton, uSkinFireMonkeyLabel, uSkinFireMonkeyCheckBox,
//  uSkinFireMonkeyImage, uSkinFireMonkeyCustomList, uSkinFireMonkeyVirtualList,
//  uSkinFireMonkeyListBox, uSkinFireMonkeyItemDesignerPanel,
//  uSkinItemDesignerPanelType, uSkinCustomListType, uSkinVirtualListType,
//  uSkinLabelType, uSkinImageType, uSkinButtonType, uSkinScrollBoxContentType,
//  uBaseSkinControl, uSkinScrollControlType, uSkinScrollBoxType,
//  uSkinListViewType, uSkinFireMonkeyListView,

//  FBLoginCommon,
  System.ImageList, FMX.ImgList, uDrawPicture, uSkinImageList, uDrawCanvas;


type
  TThirdPartyAccountActionType=(tpaatLogin,
                                tpaatBind,
                                tpaatUnBind
                                );




  TBaseUserBindThirdPartyAccount=class
  public
    FActionType:TThirdPartyAccountActionType;
    //登录类型
    FLoginType:String;
    //授权登后返回的用户名称和头像,用于上传到服务器
    FUserName:String;
    FUserHeadPicFilePath:String;
    FUserHeadUrl:String;
  public
    //微信登录、绑定、解绑
    FWxOpenID:String;
    FWxUnionID:String;
    FWxAuthToken:String;
//    //是否微信登录、绑定、解绑
//    FWeiXinString:String;
    //微信返回事件
    procedure DoWeiChatAuthLoginResult(Sender:TObject;
                                  //微信授权后的信息
                                    //昵称
                                    ANickName:String;
                                    //OpenID
                                    AOpenID:String;
                                    AUnionID:String;
                                    //授权号,用于获取用户信息
                                    AAccessToken:String;
                                    //头像下载链接
                                    AHeadImgUrl:String;
                                    AHeadImgLocalFilePath:String;
                                    //
                                    AAuthCode:String;

                                    //加载用户信息出错信息
                                    ADoLoadUserInfoError:String;
                                    AResponseCode:Integer;
                                    AIsSucc:Boolean);
    procedure DoWeiChatAuthLoginError(Sender:TObject);

    procedure OnWeiXinBindingExecute(ATimerTask: TObject);virtual;
    procedure OnWeiXinBindingExecuteEnd(ATimerTask: TObject);virtual;

    //从解除绑定返回
    procedure OnModalResultFromCancelBindingWeiXin(Frame:TObject);
    //解除绑定
    procedure OnWeiXinnotBindingExecute(ATimerTask:TObject);virtual;
    procedure OnWeiXinnotBindingExecuteEnd(ATimerTask:TObject);virtual;
  public
    //支付宝登录、绑定、解绑
    FAlipayOpenID:String;
    FAlipayAuthToken:String;
    //是否支付宝登录、绑定、解绑
//    FAlipayString:String;

    procedure OnGetAlipayAuthLoginUrlExecute(ATimerTask: TObject);virtual;
    procedure OnGetAlipayAuthLoginUrlExecuteEnd(ATimerTask: TObject);virtual;

    //支付宝返回事件
    procedure DoAlipayAuthLoginResult(Sender:TObject;
                                        //昵称
                                        ANickName:String;
                                        //支付宝用户ID
                                        AUserId:String;
                                        //获取用户信息的授权码
                                        AAuthToken:String;
                                        //头像下载链接
                                        AHeadImgUrl:String;
                                        //头像缓存在本地的路径
                                        AHeadImgLocalFilePath:String;

                                        //加载用户信息出错信息
                                        ALoadUserInfoError:String;
                                        //用户信息
//                                        AUserInfoJson:ISuperObject;

                                        //授权登录返回
                                        AAuthLoginResultJson:String;
                                        AIsAuthLoginSucc:Boolean);
//    procedure DoAlipayAuthLoginError(Sender:TObject);

    procedure OnAlipayBindingExecute(ATimerTask: TObject);virtual;
    procedure OnAlipayBindingExecuteEnd(ATimerTask: TObject);virtual;

    //从解除绑定返回
    procedure OnModalResultFromCancelBindingAlipay(Frame:TObject);
    //解除绑定
    procedure OnAlipaynotBindingExecute(ATimerTask:TObject);virtual;
    procedure OnAlipaynotBindingExecuteEnd(ATimerTask:TObject);virtual;

    procedure DoCustomGetUserInfo(Sender:TObject;AAuthCode:String;var AUserId:String;var AAccessToken:String;var AUserInfoJsonStr:String);virtual;
  public
//    FAppleString:String;
    FAppleOpenID:String;
    FAppleAuthToken:String;
    //苹果返回事件
    procedure DoAppleAuthLoginResult(Sender: TObject; AUser, AFamilyName,
      AMiddleName, AGivenName, ANickName, AEmail, APassword: string;
      AAuthorizationCredential: Pointer);
    procedure DoAppleAuthLoginError(Sender: TObject; AError: string;
      AErrorCode: Integer);

    procedure OnAppleBindingExecute(ATimerTask: TObject);virtual;
    procedure OnAppleBindingExecuteEnd(ATimerTask: TObject);virtual;

    //从解除绑定返回
    procedure OnModalResultFromCancelBindingApple(Frame:TObject);
    //解除绑定
    procedure OnApplenotBindingExecute(ATimerTask:TObject);virtual;
    procedure OnApplenotBindingExecuteEnd(ATimerTask:TObject);virtual;
  public
    //FaceBook登录
    FFacebookOpenId:String;
    FFacebookAuthToken:String;
    //Facebook的绑定和解绑
    procedure OnFacebookBindingExecute(ATimerTask: TObject);virtual;abstract;
    procedure OnFacebookBindingExecuteEnd(ATimerTask: TObject);virtual;abstract;

    //解除绑定
    procedure OnFacebooknotBindingExecute(ATimerTask:TObject);virtual;abstract;
    procedure OnFacebooknotBindingExecuteEnd(ATimerTask:TObject);virtual;abstract;

    //facebook 授权返回
    procedure DoFacebookLoginSuccess(Sender:TObject;AName,AGender,AUserID,ALocal,AUserHeadUrl,AEmail,AToken:String);
    procedure DoFacebookLoginCancel(Sender:TObject);
    procedure DoFacebookLoginError(Sender:TObject;AError:String);
  public
    //推特的绑定和解绑
    procedure OnTwitterBindingExecute(ATimerTask: TObject);virtual;abstract;
    procedure OnTwitterBindingExecuteEnd(ATimerTask: TObject);virtual;abstract;

    //解除绑定
    procedure OnTwitternotBindingExecute(ATimerTask:TObject);virtual;abstract;
    procedure OnTwitternotBindingExecuteEnd(ATimerTask:TObject);virtual;abstract;
  public

    //调用判断三方账号是否存在接口
    procedure DoIsThirdPartyAccountExecute(ATimerTask:TObject);virtual;
    //判断三方账号是否存在事件
    procedure DoIsThirdPartyAccountExecuteEnd(ATimerTask:TObject);virtual;

    //调用登录接口
    procedure DoLoginExecute(ATimerTask:TObject);virtual;
    //统一的登录结束事件
    procedure DoLoginExecuteEnd(ATimerTask:TObject);virtual;
  public
    OnChange:TNotifyEvent;

    OnLoginSucc:TNotifyEvent;

    //三方平台的账号不存在,则根据项目需要是直接登录还是注册
    OnThirdPartyAccountNoExist:TNotifyEvent;

    procedure Clear;

    //AWeiXinString,binding,notbinding,login
    //微信登录
    procedure WeiChatAction(AActionType:TThirdPartyAccountActionType);
    //支付宝登录
    procedure AlipayAction(AActionType:TThirdPartyAccountActionType);
    //苹果登陆
    procedure AppleAction(AActionType:TThirdPartyAccountActionType);

    procedure FacebookAction(AActionType:TThirdPartyAccountActionType);
    procedure TwitterAction(AActionType:TThirdPartyAccountActionType);
  end;



//var
//  GlobalUserBindThirdPartyAccount:TBaseUserBindThirdPartyAccount;



implementation


{ TBaseUserBindThirdPartyAccount }

procedure TBaseUserBindThirdPartyAccount.OnModalResultFromCancelBindingWeixin(Frame: TObject);
begin
  if TFrameMessageBox(Frame).ModalResult='确定' then
  begin
    ShowWaitingFrame(nil,'解绑中...');
    //微信绑定
    uTimerTask.GetGlobalTimerThread.RunTempTask(
                                           OnWeiXinnotBindingExecute,
                                           OnWeiXinnotBindingExecuteEnd,
                                           'WeiXinnotBinding');
  end;
  if TFrameMessageBox(Frame).ModalResult='取消' then
  begin
    //留在用户信息页面
  end;

end;

procedure TBaseUserBindThirdPartyAccount.OnWeiXinBindingExecute(ATimerTask: TObject);
begin
//  //出错
//  TTimerTask(ATimerTask).TaskTag:=1;
//
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI('bind_thirdparty_account',
//                                                    nil,
//                                                    UserCenterInterfaceUrl,
//                                                    ['appid',
//                                                    'user_fid',
//                                                    'key',
//
//                                                    'wx_union_id',
//                                                    'wx_open_id',
//                                                    'wx_auth_token',
//
//                                                    'alipay_open_id',
//                                                    'alipay_auth_token'
//
//                                                    ],
//                                                    [AppID,
//                                                    GlobalManager.User.fid,
//                                                    GlobalManager.User.key,
//
//                                                    Self.FWxUnionID,
//                                                    Self.FWxOpenID,
//                                                    Self.FWxAuthToken,
//
//                                                    Self.FAlipayOpenID,
//                                                    Self.FAlipayAuthToken
//                                                    ],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                                                    );
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;


end;

procedure TBaseUserBindThirdPartyAccount.OnWeiXinBindingExecuteEnd(ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
//  I: Integer;
begin

//  try
//    if TTimerTask(ATimerTask).TaskTag=0 then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//        GlobalManager.User.wx_union_id:=Self.FWxUnionID;
//        GlobalManager.User.wx_open_id:=Self.FWxOpenID;
//        GlobalManager.User.wx_auth_token:=Self.FWxAuthToken;
//
//        //绑定成功
//        ShowHintFrame(nil,Trans('微信绑定成功!'));
//
//        if Assigned(OnChange) then
//        begin
//          OnChange(Self);
//        end;
//
//
//      end
//      else
//      begin
//        //绑定失败
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //网络异常
//      ShowMessageBoxFrame(nil,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.OnWeiXinnotBindingExecute(ATimerTask: TObject);
begin
//  //出错
//  TTimerTask(ATimerTask).TaskTag:=1;
//
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI('unbind_thirdparty_account',
//                                                    nil,
//                                                    UserCenterInterfaceUrl,
//                                                    ['appid',
//                                                    'user_fid',
//                                                    'key',
//                                                    'account_type'],
//                                                    [AppID,
//                                                    GlobalManager.User.fid,
//                                                    GlobalManager.User.key,
//                                                    Const_RegisterLoginType_WeiXin],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                                                    );
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;

end;

procedure TBaseUserBindThirdPartyAccount.OnWeiXinnotBindingExecuteEnd(ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
//  I: Integer;
begin

//  try
//    if TTimerTask(ATimerTask).TaskTag=0 then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//
//        GlobalManager.User.wx_union_id:='';
//        GlobalManager.User.wx_open_id:='';
//        GlobalManager.User.wx_auth_token:='';
//
//
//
//        //解除绑定成功
////        if GlobalUserInfoFrame<>nil then
////        begin
////          Self.Sync;
////        end;
//        if Assigned(OnChange) then
//        begin
//          OnChange(Self);
//        end;
//
//
//      end
//      else
//      begin
//        //解除绑定失败
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //网络异常
//      ShowMessageBoxFrame(nil,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;


procedure TBaseUserBindThirdPartyAccount.TwitterAction(
  AActionType: TThirdPartyAccountActionType);
begin

end;

procedure TBaseUserBindThirdPartyAccount.WeiChatAction(AActionType:TThirdPartyAccountActionType);
begin
  Clear;

  Self.FActionType:=AActionType;

  uBaseLog.HandleException('TFrameLogin.WeiChatBind');

  FLoginType:=Const_RegisterLoginType_WeiXin;
  {$IFDEF HAS_WXPAY}
  uBaseLog.HandleException('TFrameLogin.WeiChatBind Begin');
  GlobalWeiChat.OnAuthLoginResult:=Self.DoWeiChatAuthLoginResult;
//  GlobalWeiChat.OnAuthLoginError:=Self.DoWeiChatAuthLoginError;



  if not GlobalWeiChat.AuthLogin('test5') then
  begin
    ShowMessageBoxFrame(nil,Trans('发送请求给微信失败!'));
  end;



  uBaseLog.HandleException('TFrameLogin.WeiChatBind End');
  {$ENDIF HAS_WXPAY}
end;

procedure TBaseUserBindThirdPartyAccount.DoWeiChatAuthLoginError(Sender: TObject);
begin
  //微信授权登录失败
  {$IFDEF HAS_WXPAY}
//  ShowMessageBoxFrame(nil,GlobalWeiChat.FDoLoadUserInfoError);
  ShowMessageBoxFrame(nil,Trans('微信授权失败!'));
  {$ENDIF HAS_WXPAY}
end;

procedure TBaseUserBindThirdPartyAccount.DoWeiChatAuthLoginResult(Sender: TObject;
                                  //微信授权后的信息
                                    //昵称
                                    ANickName:String;
                                    //OpenID
                                    AOpenID:String;
                                    AUnionID:String;
                                    //授权号,用于获取用户信息
                                    AAccessToken:String;
                                    //头像下载链接
                                    AHeadImgUrl:String;
                                    AHeadImgLocalFilePath:String;
                                    //
                                    AAuthCode:String;

                                    //加载用户信息出错信息
                                    ADoLoadUserInfoError:String;
                                    AResponseCode:Integer;
                                    AIsSucc:Boolean);
begin
  {$IFDEF HAS_WXPAY}

  FUserName:=ANickName;
  FUserHeadUrl:=AHeadImgUrl;

  //获取微信登录口令
  Self.FWxOpenID:=AOpenID;
  FMX.Types.Log.d('OrangeUI TfrmMain.DoWeiChatAuthLoginResult FWxOpenId:'+Self.FWxOpenID+' FWxAuthToken:'+Self.FWxAuthToken);
  Self.FWxAuthToken:=AAccessToken;
//  FMX.Types.Log.d('OrangeUI TfrmMain.DoWeiChatAuthLoginResult FWxAuthToken:'+Self.FWxAuthToken);
  FWxUnionID:=AUnionID;


  if Self.FActionType=tpaatBind then
  begin
      ShowWaitingFrame(nil,'绑定中...');
      //微信绑定
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnWeiXinBindingExecute,
                                             OnWeiXinBindingExecuteEnd,
                                             'WeiXinBinding');
  end
  else if Self.FActionType=tpaatLogin then//FWeiXinString='binding' then
  begin



      //三方账号登录是否需要完善手机号
      if not GlobalIsThirdPartyNeedPhone then
      begin
        ShowWaitingFrame(nil,'登陆中...');
        //微信绑定
        uTimerTask.GetGlobalTimerThread.RunTempTask(
                                               DoLoginExecute,
                                               DoLoginExecuteEnd,
                                               'WeiXinLogining');
      end
      else
      begin
          ShowWaitingFrame(nil,'登陆中...');
          //判断是否已经使用微信登录过
          uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             Self.DoIsThirdPartyAccountExecute,
                                             Self.DoIsThirdPartyAccountExecuteEnd,
                                             'IsThirdPartyAccount'
                                             );
      end;




  end
  else if Self.FActionType=tpaatUnBind then//FWeiXinString='notbinding' then
  begin
      ShowWaitingFrame(nil,'解绑中...');
      //微信绑定
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnWeiXinnotBindingExecute,
                                             OnWeiXinnotBindingExecuteEnd,
                                             'WeiXinnotBinding');
  end;
  {$ENDIF HAS_WXPAY}
end;

procedure TBaseUserBindThirdPartyAccount.FacebookAction(AActionType: TThirdPartyAccountActionType);
begin
  uBaseLog.HandleException('TFrameLogin.FacebookAction');

  uBaseLog.HandleException('TFrameLogin.FacebookAction Begin');

  Clear;


  FActionType:=AActionType;
//  Self.FAppleString:=AAppleString;

  FLoginType:=Const_RegisterLoginType_Facebook;


  {$IFDEF HAS_FACEBOOK}

    GlobalFBLoginManager.FOnFBLoginSuccess:=DoFacebookLoginSuccess;
    GlobalFBLoginManager.FOnFBLoginCancel:=DoFacebookLoginCancel;
    GlobalFBLoginManager.FOnFBLoginError:=DoFacebookLoginError;

    GlobalFBLoginManager.FBSDKLogin;

    {$IFDEF MSWINDOWS}
    //Windows下面测试Facebook登录
    DoFacebookLoginSuccess(nil,'沈能','','133403422299681','',

                            'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=133403422299681&height=50&width=50&ext=1631840998&hash=AeSm_0TaYyK4VI63nMg',

                            '',
                            'EAANWhnyf53sBAAzK9oMZBom9qrY2NXUwTsATwhCCN1BYZAWzPAcztXWwfeVnILdJWWYD5Pa4LzAD1z'
                            +'KYyLtWx5gJjO2Tx8iCyUFmt4dMqPM4ZAO6U09EH8KnZCbhcUHYolvrDWLSQGNrAexpj0ZCnEwDbEyK'
                            +'FvhSzsySIsntTI5hNZCX2m9Lzzg95licvNIN0cn2ak4L3ZACg7CfbHoF8eUPMIm7Ni9JYyVvyfZC4xt'
                            +'wwQZDZD');
    {$ENDIF}

  {$ENDIF}

  uBaseLog.HandleException('TFrameLogin.FacebookAction End');
end;

procedure TBaseUserBindThirdPartyAccount.AlipayAction(AActionType:TThirdPartyAccountActionType);
begin
  Clear;


  Self.FActionType:=AActionType;

  uBaseLog.HandleException('TFrameLogin.AlipayBind');

  FLoginType:=Const_RegisterLoginType_Alipay;
  {$IFDEF HAS_ALIPAY}
  uBaseLog.HandleException('TFrameLogin.AlipayBind Begin');
  GlobalAlipayMobilePay.OnAuthLoginResult:=Self.DoAlipayAuthLoginResult;
//  GlobalAlipayMobilePay.OnAuthLoginError:=Self.DoAlipayAuthLoginError;

  GlobalAlipayMobilePay.OnCustomGetUserInfo:=Self.DoCustomGetUserInfo;

  uTimerTask.GetGlobalTimerThread.RunTempTask(
                                         OnGetAlipayAuthLoginUrlExecute,
                                         OnGetAlipayAuthLoginUrlExecuteEnd,
                                         'GetAlipayAuthLoginUrl');


//  if not GlobalAlipayMobilePay.AuthLogin then
//  begin
//    ShowMessageBoxFrame(nil,Trans('发送请求给支付宝失败!'));
//  end;



  uBaseLog.HandleException('TFrameLogin.AlipayBind End');
  {$ENDIF HAS_ALIPAY}
end;

//procedure TBaseUserBindThirdPartyAccount.DoAlipayAuthLoginError(Sender: TObject);
//begin
//  //支付宝授权登录失败
//  {$IFDEF HAS_ALIPAY}
////  ShowMessageBoxFrame(nil,GlobalAlipay.FDoLoadUserInfoError);
//  ShowMessageBoxFrame(nil,Trans('支付宝授权失败!'));
//  {$ENDIF HAS_ALIPAY}
//end;

procedure TBaseUserBindThirdPartyAccount.DoAlipayAuthLoginResult(Sender: TObject;
                                        //昵称
                                        ANickName:String;
                                        //支付宝用户ID
                                        AUserId:String;
                                        //获取用户信息的授权码
                                        AAuthToken:String;
                                        //头像下载链接
                                        AHeadImgUrl:String;
                                        //头像缓存在本地的路径
                                        AHeadImgLocalFilePath:String;

                                        //加载用户信息出错信息
                                        ALoadUserInfoError:String;
                                        //用户信息
//                                        AUserInfoJson:ISuperObject;

                                        //授权登录返回
                                        AAuthLoginResultJson:String;
                                        AIsAuthLoginSucc:Boolean);
begin
  {$IFDEF HAS_ALIPAY}

  FUserName:=ANickName;
  FUserHeadUrl:=AHeadImgUrl;


  //获取支付宝登录口令
  Self.FAlipayOpenID:=AUserID;
  FMX.Types.Log.d('OrangeUI TfrmMain.DoAlipayAuthLoginResult FAlipayOpenId:'+Self.FAlipayOpenID);
  Self.FAlipayAuthToken:=AAuthToken;
  FMX.Types.Log.d('OrangeUI TfrmMain.DoAlipayAuthLoginResult FAlipayAuthToken:'+Self.FAlipayAuthToken);
  if Self.FActionType=tpaatBind then//'binding' then
  begin
      ShowWaitingFrame(nil,'绑定中...');
      //支付宝绑定
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnAlipayBindingExecute,
                                             OnAlipayBindingExecuteEnd,
                                             'AlipayBinding');
  end
  else if Self.FActionType=tpaatLogin then//FWeiXinString='binding' then
  begin
      ShowWaitingFrame(nil,'登陆中...');
      //支付宝登陆
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             DoLoginExecute,
                                             DoLoginExecuteEnd,
                                             'AlipayLogining');
  end
  else if Self.FActionType=tpaatUnBind then//='notbinding' then
  begin
      ShowWaitingFrame(nil,'解绑中...');
      //支付宝取消绑定
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnAlipaynotBindingExecute,
                                             OnAlipaynotBindingExecuteEnd,
                                             'AlipaynotBinding');
  end;
  {$ENDIF HAS_ALIPAY}
end;


procedure TBaseUserBindThirdPartyAccount.OnModalResultFromCancelBindingAlipay(Frame: TObject);
begin
  if TFrameMessageBox(Frame).ModalResult='确定' then
  begin
    ShowWaitingFrame(nil,'解绑中...');
    //支付宝绑定
    uTimerTask.GetGlobalTimerThread.RunTempTask(
                                           OnAlipaynotBindingExecute,
                                           OnAlipaynotBindingExecuteEnd,
                                           'AlipaynotBinding');
  end;
  if TFrameMessageBox(Frame).ModalResult='取消' then
  begin
    //留在用户信息页面
  end;

end;

procedure TBaseUserBindThirdPartyAccount.OnAlipayBindingExecute(ATimerTask: TObject);
begin
//  //出错
//  TTimerTask(ATimerTask).TaskTag:=1;
//
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI('bind_thirdparty_account',
//                                                    nil,
//                                                    UserCenterInterfaceUrl,
//                                                    ['appid',
//                                                    'user_fid',
//                                                    'key',
//
//                                                    'wx_union_id',
//                                                    'wx_open_id',
//                                                    'wx_auth_token',
//
//                                                    'alipay_open_id',
//                                                    'alipay_auth_token'
//
//                                                    ],
//                                                    [AppID,
//                                                    GlobalManager.User.fid,
//                                                    GlobalManager.User.key,
//
//                                                    Self.FWxUnionID,
//                                                    Self.FWxOpenID,
//                                                    Self.FWxAuthToken,
//
//                                                    Self.FAlipayOpenID,
//                                                    Self.FAlipayAuthToken
//                                                    ],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                                                    );
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;
//

end;

procedure TBaseUserBindThirdPartyAccount.OnAlipayBindingExecuteEnd(ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
//  I: Integer;
begin

//  try
//    if TTimerTask(ATimerTask).TaskTag=0 then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//
//        GlobalManager.User.alipay_open_id:=Self.FAlipayOpenID;
//        GlobalManager.User.alipay_auth_token:=Self.FAlipayAuthToken;
//
//
//
//        //绑定成功
//        ShowHintFrame(nil,Trans('支付宝绑定成功!'));
//        if Assigned(OnChange) then
//        begin
//          OnChange(Self);
//        end;
//
//      end
//      else
//      begin
//        //绑定失败
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //网络异常
//      ShowMessageBoxFrame(nil,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.OnAlipaynotBindingExecute(ATimerTask: TObject);
begin
//  //出错
//  TTimerTask(ATimerTask).TaskTag:=1;
//
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI('unbind_thirdparty_account',
//                                                    nil,
//                                                    UserCenterInterfaceUrl,
//                                                    ['appid',
//                                                    'user_fid',
//                                                    'key',
//                                                    'account_type'],
//                                                    [AppID,
//                                                    GlobalManager.User.fid,
//                                                    GlobalManager.User.key,
//                                                    Const_RegisterLoginType_Alipay],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                                                    );
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;

end;

procedure TBaseUserBindThirdPartyAccount.OnAlipaynotBindingExecuteEnd(ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
//  I: Integer;
begin

//  try
//    if TTimerTask(ATimerTask).TaskTag=0 then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//
//
//        GlobalManager.User.alipay_open_id:='';
//        GlobalManager.User.alipay_auth_token:='';
//
//
//        //解除绑定成功
////        Self.Sync;
//
//        if Assigned(OnChange) then
//        begin
//          OnChange(Self);
//        end;
//
//
//      end
//      else
//      begin
//        //解除绑定失败
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //网络异常
//      ShowMessageBoxFrame(nil,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.OnGetAlipayAuthLoginUrlExecute(
  ATimerTask: TObject);
begin
//  //出错
//  TTimerTask(ATimerTask).TaskTag:=1;
//
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI('new_auth_login_url_by_app',
//                                                    nil,
//                                                    AlipayCenterInterfaceUrl,
//                                                    ['appid'
//                                                    ],
//                                                    [AppID
//                                                    ],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                                                    );
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.OnGetAlipayAuthLoginUrlExecuteEnd(
  ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
//  I: Integer;
begin
//  try
//    if TTimerTask(ATimerTask).TaskTag=0 then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//
//        {$IFDEF HAS_ALIPAY}
//        if not GlobalAlipayMobilePay.AuthLogin(ASuperObject.O['Data'].S['AuthLoginUrl']) then
//        begin
//          ShowMessageBoxFrame(nil,Trans('发送请求给支付宝失败!'));
//        end;
//        {$ENDIF HAS_ALIPAY}
//
//      end
//      else
//      begin
//        //绑定失败
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //网络异常
//      ShowMessageBoxFrame(nil,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
//    end;
//  finally
////    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.DoCustomGetUserInfo(Sender: TObject; AAuthCode: String;
  var AUserId, AAccessToken, AUserInfoJsonStr: String);
//var
//  AResponse:String;
//  ASuperObject:ISuperObject;
begin
//  //出错
//  try
//
//    AResponse:=SimpleCallAPI('get_auth_login_user_info',
//                                                    nil,
//                                                    AlipayCenterInterfaceUrl,
//                                                    ['appid',
//                                                    'auth_code'
//                                                    ],
//                                                    [AppID,
//                                                    AAuthCode
//                                                    ],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                                                    );
//    if AResponse<>'' then
//    begin
//      ASuperObject:=TSuperObject.Create(AResponse);
//      if ASuperObject.I['Code']=SUCC then
//      begin
//        AUserId:=ASuperObject.O['Data'].S['UserId'];
//        AAccessToken:=ASuperObject.O['Data'].S['AccessToken'];
//        AUserInfoJsonStr:=ASuperObject.O['Data'].S['UserInfo'];
//      end;
//    end;
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      uBaseLog.HandleException(E,'DoCustomGetUserInfo');
//    end;
//  end;

end;

procedure TBaseUserBindThirdPartyAccount.OnModalResultFromCancelBindingApple(Frame: TObject);
begin
  if TFrameMessageBox(Frame).ModalResult='确定' then
  begin
    ShowWaitingFrame(nil,'解绑中...');
    //Apple绑定
    uTimerTask.GetGlobalTimerThread.RunTempTask(
                                           OnApplenotBindingExecute,
                                           OnApplenotBindingExecuteEnd,
                                           'ApplenotBinding');
  end;
  if TFrameMessageBox(Frame).ModalResult='取消' then
  begin
    //留在用户信息页面
  end;

end;

procedure TBaseUserBindThirdPartyAccount.OnAppleBindingExecute(ATimerTask: TObject);
begin
//  //出错
//  TTimerTask(ATimerTask).TaskTag:=1;
//
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI('bind_thirdparty_account',
//                                                    nil,
//                                                    UserCenterInterfaceUrl,
//                                                    ['appid',
//                                                    'user_fid',
//                                                    'key',
//                                                    'apple_open_id',
//                                                    'apple_auth_token'
//                                                    ],
//                                                    [AppID,
//                                                    GlobalManager.User.fid,
//                                                    GlobalManager.User.key,
//
//                                                    Self.FAppleOpenID,
//                                                    Self.FAppleAuthToken
//                                                    ],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                                                    );
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.OnAppleBindingExecuteEnd(ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
begin

//  try
//    if TTimerTask(ATimerTask).TaskTag=0 then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//        GlobalManager.User.apple_open_id:=Self.FAppleOpenID;
//        GlobalManager.User.apple_auth_token:=Self.FAppleAuthToken;
//
//        //绑定成功
//        ShowHintFrame(nil,Trans('Apple绑定成功!'));
//
//        if Assigned(OnChange) then
//        begin
//          OnChange(Self);
//        end;
//
//
//      end
//      else
//      begin
//        //绑定失败
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //网络异常
//      ShowMessageBoxFrame(nil,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.OnApplenotBindingExecute(ATimerTask: TObject);
begin
//  //出错
//  TTimerTask(ATimerTask).TaskTag:=1;
//
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI('unbind_thirdparty_account',
//                                                    nil,
//                                                    UserCenterInterfaceUrl,
//                                                    ['appid',
//                                                    'user_fid',
//                                                    'key',
//                                                    'account_type'],
//                                                    [AppID,
//                                                    GlobalManager.User.fid,
//                                                    GlobalManager.User.key,
//                                                    Const_RegisterLoginType_Apple],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                                                    );
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;
//
end;

procedure TBaseUserBindThirdPartyAccount.OnApplenotBindingExecuteEnd(ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
//  I: Integer;
begin

//  try
//    if TTimerTask(ATimerTask).TaskTag=0 then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//
//        GlobalManager.User.apple_open_id:='';
//        GlobalManager.User.apple_auth_token:='';
//
//
//
//        //解除绑定成功
////        if GlobalUserInfoFrame<>nil then
////        begin
////          Self.Sync;
////        end;
//        if Assigned(OnChange) then
//        begin
//          OnChange(Self);
//        end;
//
//
//      end
//      else
//      begin
//        //解除绑定失败
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //网络异常
//      ShowMessageBoxFrame(nil,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.AppleAction(AActionType:TThirdPartyAccountActionType);//AAppleString:String);
begin
  Clear;


  FActionType:=AActionType;
//  Self.FAppleString:=AAppleString;

  FLoginType:=Const_RegisterLoginType_Apple;

  uBaseLog.HandleException('TFrameLogin.AppleBind');

  uBaseLog.HandleException('TFrameLogin.AppleBind Begin');

  {$IFDEF HAS_APPLESIGNIN}
  uBaseLog.HandleException('TFrameLogin.AppleBind Begin 1');

  GlobalAppleSignIn.OnAuthorization:=Self.DoAppleAuthLoginResult;
  GlobalAppleSignIn.OnError:=Self.DoAppleAuthLoginError;


  GlobalAppleSignIn.SignIn;

  uBaseLog.HandleException('TFrameLogin.AppleBind End 1');
  {$ENDIF HAS_APPLESIGNIN}

  uBaseLog.HandleException('TFrameLogin.AppleBind End');
end;

procedure TBaseUserBindThirdPartyAccount.Clear;
begin
    //登录类型
    FLoginType:='';

    //授权登后返回的用户名称和头像,用于上传到服务器
    FUserName:='';
    FUserHeadPicFilePath:='';
    FUserHeadUrl:='';

    //微信登录、绑定、解绑
    FWxOpenID:='';
    FWxUnionID:='';
    FWxAuthToken:='';

    //支付宝登录、绑定、解绑
    FAlipayOpenID:='';
    FAlipayAuthToken:='';
    //是否支付宝登录、绑定、解绑
//    FAlipayString:String;

//    FAppleString:String;
    FAppleOpenID:='';
    FAppleAuthToken:='';

    //FaceBook登录
    FFacebookOpenId:='';
    FFacebookAuthToken:='';
end;

procedure TBaseUserBindThirdPartyAccount.DoAppleAuthLoginError(Sender: TObject; AError: string;
      AErrorCode: Integer);
begin
  //Apple授权登录失败
//  ShowMessageBoxFrame(nil,GlobalApple.FDoLoadUserInfoError);
  ShowMessageBoxFrame(nil,Trans('Apple授权失败!'));
end;

procedure TBaseUserBindThirdPartyAccount.DoAppleAuthLoginResult(Sender: TObject; AUser, AFamilyName,
      AMiddleName, AGivenName, ANickName, AEmail, APassword: string;
      AAuthorizationCredential: Pointer);
begin

  FUserName:=ANickName;
  FUserHeadUrl:='';



  //获取Apple登录口令
  Self.FAppleOpenID:=AUser;
  Self.FAppleAuthToken:='';
  FMX.Types.Log.d('OrangeUI TfrmMain.DoAppleAuthLoginResult FAppleOpenId:'+Self.FAppleOpenID);
  FMX.Types.Log.d('OrangeUI TfrmMain.DoAppleAuthLoginResult FAppleAuthToken:'+Self.FAppleAuthToken);


  if Self.FActionType=tpaatBind then//FAppleString='binding' then
  begin
      ShowWaitingFrame(nil,'绑定中...');
      //Apple绑定
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnAppleBindingExecute,
                                             OnAppleBindingExecuteEnd,
                                             'AppleBinding');
  end
  else if Self.FActionType=tpaatLogin then//FWeiXinString='binding' then
  begin
      ShowWaitingFrame(nil,'登陆中...');
      //Apple登陆
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             DoLoginExecute,
                                             DoLoginExecuteEnd,
                                             'AppleLogining');
  end
  else if Self.FActionType=tpaatUnBind then//='notbinding' then
  begin
      ShowWaitingFrame(nil,'解绑中...');
      //Apple绑定
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnApplenotBindingExecute,
                                             OnApplenotBindingExecuteEnd,
                                             'ApplenotBinding');
  end;
end;

procedure TBaseUserBindThirdPartyAccount.DoLoginExecute(ATimerTask: TObject);
begin
//  //出错
//  TTimerTask(ATimerTask).TaskTag:=1;
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=
//      SimpleCallAPI('login',
//                    nil,
//                    UserCenterInterfaceUrl,
//                    ['appid',
//                    'user_type',
//                    'login_type',
//                    'username',
//                    'password',
//                    'captcha',
//                    'version',
//                    'phone_imei',
//                    'phone_uuid',
//                    'phone_type',
//                    'os',
//                    'os_version',
//
//                    'fb_open_id',
//                    'fb_auth_token',
//
//                    'wx_union_id',
//                    'wx_open_id',
//                    'wx_auth_token',
//
//                    'alipay_open_id',
//                    'alipay_auth_token',
//
//                    'apple_open_id',
//                    'apple_auth_token',
//
//                    'third_party_username',
//                    'third_party_userhead'
//                    ],
//                    [AppID,
//                    APPUserType,
//                    Self.FLoginType,
//                    '',//Self.FLoginUser,
//                    '',//FLoginPassword,
//                    '',
//                    '',
//                    '',//GetIMEI,
//                    GetUUID,
//                    GetPhoneType,
//                    GetOS,
//                    GetOSVersion,
//
//                    '',//FFacebookOpenId,
//                    '',//FFacebookAuthToken,
//
//                    Self.FWxUnionId,
//                    Self.FWxOpenId,
//                    Self.FWxAuthToken,
//
//                    Self.FAlipayOpenId,
//                    Self.FAlipayAuthToken,
//
//                    Self.FAppleOpenId,
//                    Self.FAppleAuthToken,
//
//                    Self.FUserName,
//                    Self.FUserHeadUrl
//
//                    ],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                    );
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.DoLoginExecuteEnd(ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
//  I: Integer;
begin
//  try
//    if TTimerTask(ATimerTask).TaskTag=0 then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//
//
//          GlobalManager.User.ParseFromJson(ASuperObject.O['Data'].A['User'].O[0]);
//
//
//          //登录令牌,用于确认用户已经登录
//          GlobalManager.User.key:=ASuperObject.O['Data'].S['Key'];
//
//          //保存用户登录key,用于下次自动登陆
//          GlobalManager.LastLoginKey:=ASuperObject.O['Data'].S['login_key'];
//
//          if Assigned(OnLoginSucc) then
//          begin
//            OnLoginSucc(Self);
//          end;
//
////          if not GlobalLoginFrame.IsLoginedThenReturn then
////          begin
////              //登陆成功之后返回主页
////              HideFrame;
////              //主窗体接口调用成功
////              frmMain.DoCallLoginAPISucc(False,
////                                          //显示主页MainFrame
////                                          True);
////          end
////          else
////          begin
////              //登陆成功之后返回上一页
////              //主窗体接口调用成功
////              frmMain.DoCallLoginAPISucc(False,
////                                          //不显示主页MainFrame
////                                          False);
////
////              HideFrame;
////              ReturnFrame;
////          end;
//
//
//      end
//      else
//      begin
//        //登录失败
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //网络异常
//      ShowMessageBoxFrame(nil,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.DoIsThirdPartyAccountExecute(ATimerTask: TObject);
begin
//  //出错
//  TTimerTask(ATimerTask).TaskTag:=1;
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=
//      SimpleCallAPI('is_third_party_account_exist',
//                    nil,
//                    UserCenterInterfaceUrl,
//                    ['appid',
//                    'user_type',
//
//                    'fb_open_id',
//                    'fb_auth_token',
//
//                    'wx_union_id',
//                    'wx_open_id',
//                    'wx_auth_token',
//
//                    'alipay_open_id',
//                    'alipay_auth_token',
//
//                    'apple_open_id',
//                    'apple_auth_token'
//                    ],
//                    [AppID,
//                    APPUserType,
//                    FFacebookOpenId,
//                    FFacebookAuthToken,
//
//                    Self.FWxUnionId,
//                    Self.FWxOpenId,
//                    Self.FWxAuthToken,
//
//                    Self.FAlipayOpenID,
//                    Self.FAlipayAuthToken,
//
//                    Self.FAppleOpenID,
//                    Self.FAppleAuthToken
//                    ],
//                                        GlobalRestAPISignType,
//                                        GlobalRestAPIAppSecret
//                    );
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//
//  except
//    on E:Exception do
//    begin
//      //异常
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;

end;

procedure TBaseUserBindThirdPartyAccount.DoIsThirdPartyAccountExecuteEnd(ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
//  I: Integer;
begin
//  try
//    if TTimerTask(ATimerTask).TaskTag=0 then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//          if ASuperObject.O['Data'].I['is_exist']=1 then
//          begin
//              //已经存在该三方账号,则登录
//              ShowWaitingFrame(nil,'登录中...');
//              //微信登录
//              uTimerTask.GetGlobalTimerThread.RunTempTask(
//                                                     DoLoginExecute,
//                                                     DoLoginExecuteEnd,
//                                                     'Login'
//                                                     );
//          end
//          else
//          begin
//
//
//
//              //不存在,
//
//              if Assigned(OnThirdPartyAccountNoExist) then
//              begin
//                OnThirdPartyAccountNoExist(Self);
//              end;
//
//              //注册,跳转到完善手机号码页面,进行手机验证
//              //注册          1
////              HideFrame;//(nil,hfcttBeforeShowFrame);
////              ShowFrame(TFrame(GlobalRegisterFrame),TFrameRegister,frmMain,nil,nil,nil,Application);
////              GlobalRegisterFrame.FrameHistroy:=CurrentFrameHistroy;
////              GlobalRegisterFrame.Clear;//(Self.FRegisterLoginType);
////              GlobalRegisterFrame.pnlToolBar.Caption:='手机验证';
////
////
////              GlobalRegisterFrame.FUserName:=FUserName;
////              GlobalRegisterFrame.FUserHeadPicFilePath:=Self.FUserHeadPicFilePath;
////              GlobalRegisterFrame.FWxUnionID:=FWxUnionID;
////              GlobalRegisterFrame.FWxOpenID:=FWxOpenID;
////              GlobalRegisterFrame.FWxAuthToken:=FWxAuthToken;
////              GlobalRegisterFrame.FAlipayOpenID:=FAlipayOpenID;
////              GlobalRegisterFrame.FAlipayAuthToken:=FAlipayAuthToken;
////              GlobalRegisterFrame.Load(FUserName,FUserHeadPicFilePath,
////                                      FWxOpenID,FWxAuthToken,
////                                      FAlipayOpenID,FAlipayAuthToken
////                                      );
//
//
//          end;
//      end
//      else
//      begin
//        //登录失败
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //网络异常
//      ShowMessageBoxFrame(nil,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;

end;

procedure TBaseUserBindThirdPartyAccount.DoFacebookLoginCancel(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI -- TFrameLogin.DoFacebookLoginCancel');
  TThread.Synchronize(nil,
  procedure
  begin

  end);
end;

procedure TBaseUserBindThirdPartyAccount.DoFacebookLoginError(Sender: TObject; AError: String);
begin
  FMX.Types.Log.d('OrangeUI -- TFrameLogin.Facebook Error '+AError);
  TThread.Synchronize(nil,
  procedure
  begin
    ShowMessage(AError);
  end);
end;

procedure TBaseUserBindThirdPartyAccount.DoFacebookLoginSuccess(Sender: TObject; AName, AGender, AUserID,
  ALocal, AUserHeadUrl, AEmail, AToken: String);
begin
  FMX.Types.Log.d('OrangeUI -- TFrameLogin.Facebook AName '+AName);


  FUserName:=AName;
  //jfif格式的显示不出来，暂时设置为空
  FUserHeadUrl:=AUserHeadUrl;



  TThread.Synchronize(nil,
  procedure
  begin
//    Self.SkinFMXMemo1.Lines.Add('用户名:'+AName);
//    Self.SkinFMXMemo1.Lines.Add('性别:'+AGender);
//    Self.SkinFMXMemo1.Lines.Add('用户ID:'+AUserID);
//    Self.SkinFMXMemo1.Lines.Add('所在地:'+ALocal);
//    Self.SkinFMXMemo1.Lines.Add('头像链接:'+AUrl);
//    Self.SkinFMXMemo1.Lines.Add('邮箱:'+AEmail);
//    Self.SkinFMXMemo1.Lines.Add('Token:'+AToken);
//
//    Self.SkinFMXImage1.Prop.Picture.Url:=AUrl;

//    Self.edtUser.Text:=AName;
//
//    FLoginUser:='';
//    FLoginPassword:='';


      FFacebookOpenId:=AUserID;
      FFacebookAuthToken:=AToken;
//      Self.FWxOpenId:='';
//      Self.FWxAuthToken:='';
//      Self.FAlipayOpenId:='';
//      Self.FAlipayAuthToken:='';
//      Self.FAppleOpenId:='';
//      Self.FAppleAuthToken:='';
//
//
//      FLoginType:=Const_RegisterLoginType_FaceBook;
//
//      ShowWaitingFrame(nil,'登录中...');
//      //登录
//      uTimerTask.GetGlobalTimerThread.RunTempTask(
//          DoLoginExecute,
//          DoLoginExecuteEnd,
//          'Login'
//          );


      if Self.FActionType=tpaatBind then//'binding' then
      begin
          ShowWaitingFrame(nil,'绑定中...');
          //Facebook绑定
          uTimerTask.GetGlobalTimerThread.RunTempTask(
                                                 OnFacebookBindingExecute,
                                                 OnFacebookBindingExecuteEnd,
                                                 'FacebookBinding');
      end
      else if Self.FActionType=tpaatLogin then//FWeiXinString='binding' then
      begin
          ShowWaitingFrame(nil,'登陆中...');
          //Facebook登陆
          uTimerTask.GetGlobalTimerThread.RunTempTask(
                                                 DoLoginExecute,
                                                 DoLoginExecuteEnd,
                                                 'FacebookLogining');
      end
      else if Self.FActionType=tpaatUnBind then//='notbinding' then
      begin
          ShowWaitingFrame(nil,'解绑中...');
          //Facebook取消绑定
          uTimerTask.GetGlobalTimerThread.RunTempTask(
                                                 OnFacebooknotBindingExecute,
                                                 OnFacebooknotBindingExecuteEnd,
                                                 'FacebooknotBinding');
      end;


  end);

end;


end.
