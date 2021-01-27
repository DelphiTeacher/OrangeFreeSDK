unit uBaseThirdPartyAccountAuth;

interface

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
  //΢�ŵ�¼
  uWeiChat,
  {$ENDIF HAS_WXPAY}

  {$IFDEF HAS_ALIPAY}
  //֧������¼
  uAlipayMobilePay,
  {$ENDIF HAS_WXPAY}

  {$IFDEF HAS_FACEBOOK}
  FBLoginCommon,
  {$ENDIF HAS_FACEBOOK}


  {$IFDEF HAS_APPLESIGNIN}
  uAppleSignIn,
  {$ENDIF HAS_APPLESIGNIN}

  WaitingFrame,
  MessageBoxFrame,

//  uAppleSignIn,
  uSkinListBoxType,
  uOpenCommon,

//  uConst,
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
    //��¼����
    FLoginType:String;
    //��Ȩ�Ǻ󷵻ص��û����ƺ�ͷ��,�����ϴ���������
    FUserName:String;
    FUserHeadPicFilePath:String;
    FUserHeadUrl:String;
  public
    //΢�ŵ�¼���󶨡����
    FWxOpenID:String;
    FWxUnionID:String;
    FWxAuthToken:String;
//    //�Ƿ�΢�ŵ�¼���󶨡����
//    FWeiXinString:String;
    //΢�ŷ����¼�
    procedure DoWeiChatAuthLoginResult(Sender:TObject;
                                  //΢����Ȩ�����Ϣ
                                    //�ǳ�
                                    ANickName:String;
                                    //OpenID
                                    AOpenID:String;
                                    AUnionID:String;
                                    //��Ȩ��,���ڻ�ȡ�û���Ϣ
                                    AAccessToken:String;
                                    //ͷ����������
                                    AHeadImgUrl:String;
                                    AHeadImgLocalFilePath:String;
                                    //
                                    AAuthCode:String;

                                    //�����û���Ϣ������Ϣ
                                    ADoLoadUserInfoError:String;
                                    AResponseCode:Integer;
                                    AIsSucc:Boolean);
    procedure DoWeiChatAuthLoginError(Sender:TObject);

    procedure OnWeiXinBindingExecute(ATimerTask: TObject);virtual;
    procedure OnWeiXinBindingExecuteEnd(ATimerTask: TObject);virtual;

    //�ӽ���󶨷���
    procedure OnModalResultFromCancelBindingWeiXin(Frame:TObject);
    //�����
    procedure OnWeiXinnotBindingExecute(ATimerTask:TObject);virtual;
    procedure OnWeiXinnotBindingExecuteEnd(ATimerTask:TObject);virtual;
  public
    //֧������¼���󶨡����
    FAlipayOpenID:String;
    FAlipayAuthToken:String;
    //�Ƿ�֧������¼���󶨡����
//    FAlipayString:String;

    procedure OnGetAlipayAuthLoginUrlExecute(ATimerTask: TObject);virtual;
    procedure OnGetAlipayAuthLoginUrlExecuteEnd(ATimerTask: TObject);virtual;

    //֧���������¼�
    procedure DoAlipayAuthLoginResult(Sender:TObject;
                                        //�ǳ�
                                        ANickName:String;
                                        //֧�����û�ID
                                        AUserId:String;
                                        //��ȡ�û���Ϣ����Ȩ��
                                        AAuthToken:String;
                                        //ͷ����������
                                        AHeadImgUrl:String;
                                        //ͷ�񻺴��ڱ��ص�·��
                                        AHeadImgLocalFilePath:String;

                                        //�����û���Ϣ������Ϣ
                                        ALoadUserInfoError:String;
                                        //�û���Ϣ
//                                        AUserInfoJson:ISuperObject;

                                        //��Ȩ��¼����
                                        AAuthLoginResultJson:String;
                                        AIsAuthLoginSucc:Boolean);
//    procedure DoAlipayAuthLoginError(Sender:TObject);

    procedure OnAlipayBindingExecute(ATimerTask: TObject);virtual;
    procedure OnAlipayBindingExecuteEnd(ATimerTask: TObject);virtual;

    //�ӽ���󶨷���
    procedure OnModalResultFromCancelBindingAlipay(Frame:TObject);
    //�����
    procedure OnAlipaynotBindingExecute(ATimerTask:TObject);virtual;
    procedure OnAlipaynotBindingExecuteEnd(ATimerTask:TObject);virtual;

    procedure DoCustomGetUserInfo(Sender:TObject;AAuthCode:String;var AUserId:String;var AAccessToken:String;var AUserInfoJsonStr:String);virtual;
  public
//    FAppleString:String;
    FAppleOpenID:String;
    FAppleAuthToken:String;
    //ƻ�������¼�
    procedure DoAppleAuthLoginResult(Sender: TObject; AUser, AFamilyName,
      AMiddleName, AGivenName, ANickName, AEmail, APassword: string;
      AAuthorizationCredential: Pointer);
    procedure DoAppleAuthLoginError(Sender: TObject; AError: string;
      AErrorCode: Integer);

    procedure OnAppleBindingExecute(ATimerTask: TObject);virtual;
    procedure OnAppleBindingExecuteEnd(ATimerTask: TObject);virtual;

    //�ӽ���󶨷���
    procedure OnModalResultFromCancelBindingApple(Frame:TObject);
    //�����
    procedure OnApplenotBindingExecute(ATimerTask:TObject);virtual;
    procedure OnApplenotBindingExecuteEnd(ATimerTask:TObject);virtual;
  public
    //FaceBook��¼
    FFbOpenId:String;
    FFbAuthToken:String;
    //facebook ��Ȩ����
    procedure DoFacebookLoginSuccess(Sender:TObject;AName,AGender,AUserID,ALocal,AUrl,AEmail,AToken:String);
    procedure DoFacebookLoginCancel(Sender:TObject);
    procedure DoFacebookLoginError(Sender:TObject;AError:String);
  public

    //�����ж������˺��Ƿ���ڽӿ�
    procedure DoIsThirdPartyAccountExecute(ATimerTask:TObject);virtual;
    //�ж������˺��Ƿ�����¼�
    procedure DoIsThirdPartyAccountExecuteEnd(ATimerTask:TObject);virtual;

    //���õ�¼�ӿ�
    procedure DoLoginExecute(ATimerTask:TObject);virtual;
    //ͳһ�ĵ�¼�����¼�
    procedure DoLoginExecuteEnd(ATimerTask:TObject);virtual;
  public
    OnChange:TNotifyEvent;

    OnLoginSucc:TNotifyEvent;

    //����ƽ̨���˺Ų�����,�������Ŀ��Ҫ��ֱ�ӵ�¼����ע��
    OnThirdPartyAccountNoExist:TNotifyEvent;

    procedure Clear;

    //AWeiXinString,binding,notbinding,login
    //΢�ŵ�¼
    procedure WeiChatAction(AActionType:TThirdPartyAccountActionType);
    //֧������¼
    procedure AlipayAction(AActionType:TThirdPartyAccountActionType);
    //ƻ����½
    procedure AppleAction(AActionType:TThirdPartyAccountActionType);

    procedure FacebookAction(AActionType:TThirdPartyAccountActionType);
  end;



//var
//  GlobalUserBindThirdPartyAccount:TBaseUserBindThirdPartyAccount;



implementation


{ TBaseUserBindThirdPartyAccount }

procedure TBaseUserBindThirdPartyAccount.OnModalResultFromCancelBindingWeixin(Frame: TObject);
begin
  if TFrameMessageBox(Frame).ModalResult='ȷ��' then
  begin
    ShowWaitingFrame(nil,'�����...');
    //΢�Ű�
    uTimerTask.GetGlobalTimerThread.RunTempTask(
                                           OnWeiXinnotBindingExecute,
                                           OnWeiXinnotBindingExecuteEnd,
                                           'WeiXinnotBinding');
  end;
  if TFrameMessageBox(Frame).ModalResult='ȡ��' then
  begin
    //�����û���Ϣҳ��
  end;

end;

procedure TBaseUserBindThirdPartyAccount.OnWeiXinBindingExecute(ATimerTask: TObject);
begin
//  //����
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
//      //�쳣
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
//        //�󶨳ɹ�
//        ShowHintFrame(nil,Trans('΢�Ű󶨳ɹ�!'));
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
//        //��ʧ��
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //�����쳣
//      ShowMessageBoxFrame(nil,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.OnWeiXinnotBindingExecute(ATimerTask: TObject);
begin
//  //����
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
//      //�쳣
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
//        //����󶨳ɹ�
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
//        //�����ʧ��
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //�����쳣
//      ShowMessageBoxFrame(nil,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
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
    ShowMessageBoxFrame(nil,Trans('���������΢��ʧ��!'));
  end;



  uBaseLog.HandleException('TFrameLogin.WeiChatBind End');
  {$ENDIF HAS_WXPAY}
end;

procedure TBaseUserBindThirdPartyAccount.DoWeiChatAuthLoginError(Sender: TObject);
begin
  //΢����Ȩ��¼ʧ��
  {$IFDEF HAS_WXPAY}
//  ShowMessageBoxFrame(nil,GlobalWeiChat.FDoLoadUserInfoError);
  ShowMessageBoxFrame(nil,Trans('΢����Ȩʧ��!'));
  {$ENDIF HAS_WXPAY}
end;

procedure TBaseUserBindThirdPartyAccount.DoWeiChatAuthLoginResult(Sender: TObject;
                                  //΢����Ȩ�����Ϣ
                                    //�ǳ�
                                    ANickName:String;
                                    //OpenID
                                    AOpenID:String;
                                    AUnionID:String;
                                    //��Ȩ��,���ڻ�ȡ�û���Ϣ
                                    AAccessToken:String;
                                    //ͷ����������
                                    AHeadImgUrl:String;
                                    AHeadImgLocalFilePath:String;
                                    //
                                    AAuthCode:String;

                                    //�����û���Ϣ������Ϣ
                                    ADoLoadUserInfoError:String;
                                    AResponseCode:Integer;
                                    AIsSucc:Boolean);
begin
  {$IFDEF HAS_WXPAY}

  FUserName:=ANickName;
  FUserHeadUrl:=AHeadImgUrl;

  //��ȡ΢�ŵ�¼����
  Self.FWxOpenID:=AOpenID;
  FMX.Types.Log.d('OrangeUI TfrmMain.DoWeiChatAuthLoginResult FWxOpenId:'+Self.FWxOpenID+' FWxAuthToken:'+Self.FWxAuthToken);
  Self.FWxAuthToken:=AAccessToken;
//  FMX.Types.Log.d('OrangeUI TfrmMain.DoWeiChatAuthLoginResult FWxAuthToken:'+Self.FWxAuthToken);
  FWxUnionID:=AUnionID;


  if Self.FActionType=tpaatBind then
  begin
      ShowWaitingFrame(nil,'����...');
      //΢�Ű�
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnWeiXinBindingExecute,
                                             OnWeiXinBindingExecuteEnd,
                                             'WeiXinBinding');
  end
  else if Self.FActionType=tpaatLogin then//FWeiXinString='binding' then
  begin



      //�����˺ŵ�¼�Ƿ���Ҫ�����ֻ���
      if not GlobalIsThirdPartyNeedPhone then
      begin
        ShowWaitingFrame(nil,'��½��...');
        //΢�Ű�
        uTimerTask.GetGlobalTimerThread.RunTempTask(
                                               DoLoginExecute,
                                               DoLoginExecuteEnd,
                                               'WeiXinLogining');
      end
      else
      begin
          ShowWaitingFrame(nil,'��½��...');
          //�ж��Ƿ��Ѿ�ʹ��΢�ŵ�¼��
          uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             Self.DoIsThirdPartyAccountExecute,
                                             Self.DoIsThirdPartyAccountExecuteEnd,
                                             'IsThirdPartyAccount'
                                             );
      end;




  end
  else if Self.FActionType=tpaatUnBind then//FWeiXinString='notbinding' then
  begin
      ShowWaitingFrame(nil,'�����...');
      //΢�Ű�
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnWeiXinnotBindingExecute,
                                             OnWeiXinnotBindingExecuteEnd,
                                             'WeiXinnotBinding');
  end;
  {$ENDIF HAS_WXPAY}
end;

procedure TBaseUserBindThirdPartyAccount.FacebookAction(AActionType: TThirdPartyAccountActionType);
begin
  Clear;


  FActionType:=AActionType;
//  Self.FAppleString:=AAppleString;

  FLoginType:=Const_RegisterLoginType_Facebook;

  uBaseLog.HandleException('TFrameLogin.FacebookAction');

  uBaseLog.HandleException('TFrameLogin.FacebookAction Begin');

  {$IFDEF HAS_FACEBOOK}

  InitGlobalFBLoginManager(Const_Facebook_AppId);

  GlobalFBLoginManager.FOnFBLoginSuccess:=DoFacebookLoginSuccess;
  GlobalFBLoginManager.FOnFBLoginCancel:=DoFacebookLoginCancel;
  GlobalFBLoginManager.FOnFBLoginError:=DoFacebookLoginError;

  GlobalFBLoginManager.FBSDKLogin;

  {$ENDIF HAS_FACEBOOK}

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
//    ShowMessageBoxFrame(nil,Trans('���������֧����ʧ��!'));
//  end;



  uBaseLog.HandleException('TFrameLogin.AlipayBind End');
  {$ENDIF HAS_ALIPAY}
end;

//procedure TBaseUserBindThirdPartyAccount.DoAlipayAuthLoginError(Sender: TObject);
//begin
//  //֧������Ȩ��¼ʧ��
//  {$IFDEF HAS_ALIPAY}
////  ShowMessageBoxFrame(nil,GlobalAlipay.FDoLoadUserInfoError);
//  ShowMessageBoxFrame(nil,Trans('֧������Ȩʧ��!'));
//  {$ENDIF HAS_ALIPAY}
//end;

procedure TBaseUserBindThirdPartyAccount.DoAlipayAuthLoginResult(Sender: TObject;
                                        //�ǳ�
                                        ANickName:String;
                                        //֧�����û�ID
                                        AUserId:String;
                                        //��ȡ�û���Ϣ����Ȩ��
                                        AAuthToken:String;
                                        //ͷ����������
                                        AHeadImgUrl:String;
                                        //ͷ�񻺴��ڱ��ص�·��
                                        AHeadImgLocalFilePath:String;

                                        //�����û���Ϣ������Ϣ
                                        ALoadUserInfoError:String;
                                        //�û���Ϣ
//                                        AUserInfoJson:ISuperObject;

                                        //��Ȩ��¼����
                                        AAuthLoginResultJson:String;
                                        AIsAuthLoginSucc:Boolean);
begin
  {$IFDEF HAS_ALIPAY}

  FUserName:=ANickName;
  FUserHeadUrl:=AHeadImgUrl;


  //��ȡ֧������¼����
  Self.FAlipayOpenID:=AUserID;
  FMX.Types.Log.d('OrangeUI TfrmMain.DoAlipayAuthLoginResult FAlipayOpenId:'+Self.FAlipayOpenID);
  Self.FAlipayAuthToken:=AAuthToken;
  FMX.Types.Log.d('OrangeUI TfrmMain.DoAlipayAuthLoginResult FAlipayAuthToken:'+Self.FAlipayAuthToken);
  if Self.FActionType=tpaatBind then//'binding' then
  begin
      ShowWaitingFrame(nil,'����...');
      //֧������
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnAlipayBindingExecute,
                                             OnAlipayBindingExecuteEnd,
                                             'AlipayBinding');
  end
  else if Self.FActionType=tpaatLogin then//FWeiXinString='binding' then
  begin
      ShowWaitingFrame(nil,'��½��...');
      //֧������½
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             DoLoginExecute,
                                             DoLoginExecuteEnd,
                                             'AlipayLogining');
  end
  else if Self.FActionType=tpaatUnBind then//='notbinding' then
  begin
      ShowWaitingFrame(nil,'�����...');
      //֧����ȡ����
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnAlipaynotBindingExecute,
                                             OnAlipaynotBindingExecuteEnd,
                                             'AlipaynotBinding');
  end;
  {$ENDIF HAS_ALIPAY}
end;


procedure TBaseUserBindThirdPartyAccount.OnModalResultFromCancelBindingAlipay(Frame: TObject);
begin
  if TFrameMessageBox(Frame).ModalResult='ȷ��' then
  begin
    ShowWaitingFrame(nil,'�����...');
    //֧������
    uTimerTask.GetGlobalTimerThread.RunTempTask(
                                           OnAlipaynotBindingExecute,
                                           OnAlipaynotBindingExecuteEnd,
                                           'AlipaynotBinding');
  end;
  if TFrameMessageBox(Frame).ModalResult='ȡ��' then
  begin
    //�����û���Ϣҳ��
  end;

end;

procedure TBaseUserBindThirdPartyAccount.OnAlipayBindingExecute(ATimerTask: TObject);
begin
//  //����
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
//      //�쳣
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
//        //�󶨳ɹ�
//        ShowHintFrame(nil,Trans('֧�����󶨳ɹ�!'));
//        if Assigned(OnChange) then
//        begin
//          OnChange(Self);
//        end;
//
//      end
//      else
//      begin
//        //��ʧ��
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //�����쳣
//      ShowMessageBoxFrame(nil,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.OnAlipaynotBindingExecute(ATimerTask: TObject);
begin
//  //����
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
//      //�쳣
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
//        //����󶨳ɹ�
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
//        //�����ʧ��
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //�����쳣
//      ShowMessageBoxFrame(nil,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.OnGetAlipayAuthLoginUrlExecute(
  ATimerTask: TObject);
begin
//  //����
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
//      //�쳣
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
//          ShowMessageBoxFrame(nil,Trans('���������֧����ʧ��!'));
//        end;
//        {$ENDIF HAS_ALIPAY}
//
//      end
//      else
//      begin
//        //��ʧ��
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //�����쳣
//      ShowMessageBoxFrame(nil,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
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
//  //����
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
//      //�쳣
//      uBaseLog.HandleException(E,'DoCustomGetUserInfo');
//    end;
//  end;

end;

procedure TBaseUserBindThirdPartyAccount.OnModalResultFromCancelBindingApple(Frame: TObject);
begin
  if TFrameMessageBox(Frame).ModalResult='ȷ��' then
  begin
    ShowWaitingFrame(nil,'�����...');
    //Apple��
    uTimerTask.GetGlobalTimerThread.RunTempTask(
                                           OnApplenotBindingExecute,
                                           OnApplenotBindingExecuteEnd,
                                           'ApplenotBinding');
  end;
  if TFrameMessageBox(Frame).ModalResult='ȡ��' then
  begin
    //�����û���Ϣҳ��
  end;

end;

procedure TBaseUserBindThirdPartyAccount.OnAppleBindingExecute(ATimerTask: TObject);
begin
//  //����
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
//      //�쳣
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
//        //�󶨳ɹ�
//        ShowHintFrame(nil,Trans('Apple�󶨳ɹ�!'));
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
//        //��ʧ��
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //�����쳣
//      ShowMessageBoxFrame(nil,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.OnApplenotBindingExecute(ATimerTask: TObject);
begin
//  //����
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
//      //�쳣
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
//        //����󶨳ɹ�
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
//        //�����ʧ��
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //�����쳣
//      ShowMessageBoxFrame(nil,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
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
    //��¼����
    FLoginType:='';

    //��Ȩ�Ǻ󷵻ص��û����ƺ�ͷ��,�����ϴ���������
    FUserName:='';
    FUserHeadPicFilePath:='';
    FUserHeadUrl:='';

    //΢�ŵ�¼���󶨡����
    FWxOpenID:='';
    FWxUnionID:='';
    FWxAuthToken:='';

    //֧������¼���󶨡����
    FAlipayOpenID:='';
    FAlipayAuthToken:='';
    //�Ƿ�֧������¼���󶨡����
//    FAlipayString:String;

//    FAppleString:String;
    FAppleOpenID:='';
    FAppleAuthToken:='';

    //FaceBook��¼
    FFbOpenId:='';
    FFbAuthToken:='';
end;

procedure TBaseUserBindThirdPartyAccount.DoAppleAuthLoginError(Sender: TObject; AError: string;
      AErrorCode: Integer);
begin
  //Apple��Ȩ��¼ʧ��
//  ShowMessageBoxFrame(nil,GlobalApple.FDoLoadUserInfoError);
  ShowMessageBoxFrame(nil,Trans('Apple��Ȩʧ��!'));
end;

procedure TBaseUserBindThirdPartyAccount.DoAppleAuthLoginResult(Sender: TObject; AUser, AFamilyName,
      AMiddleName, AGivenName, ANickName, AEmail, APassword: string;
      AAuthorizationCredential: Pointer);
begin

  FUserName:=ANickName;
  FUserHeadUrl:='';



  //��ȡApple��¼����
  Self.FAppleOpenID:=AUser;
  Self.FAppleAuthToken:='';
  FMX.Types.Log.d('OrangeUI TfrmMain.DoAppleAuthLoginResult FAppleOpenId:'+Self.FAppleOpenID);
  FMX.Types.Log.d('OrangeUI TfrmMain.DoAppleAuthLoginResult FAppleAuthToken:'+Self.FAppleAuthToken);


  if Self.FActionType=tpaatBind then//FAppleString='binding' then
  begin
      ShowWaitingFrame(nil,'����...');
      //Apple��
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnAppleBindingExecute,
                                             OnAppleBindingExecuteEnd,
                                             'AppleBinding');
  end
  else if Self.FActionType=tpaatLogin then//FWeiXinString='binding' then
  begin
      ShowWaitingFrame(nil,'��½��...');
      //Apple��½
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             DoLoginExecute,
                                             DoLoginExecuteEnd,
                                             'AppleLogining');
  end
  else if Self.FActionType=tpaatUnBind then//='notbinding' then
  begin
      ShowWaitingFrame(nil,'�����...');
      //Apple��
      uTimerTask.GetGlobalTimerThread.RunTempTask(
                                             OnApplenotBindingExecute,
                                             OnApplenotBindingExecuteEnd,
                                             'ApplenotBinding');
  end;
end;

procedure TBaseUserBindThirdPartyAccount.DoLoginExecute(ATimerTask: TObject);
begin
//  //����
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
//                    '',//FFbOpenId,
//                    '',//FFbAuthToken,
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
//      //�쳣
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
//          //��¼����,����ȷ���û��Ѿ���¼
//          GlobalManager.User.key:=ASuperObject.O['Data'].S['Key'];
//
//          //�����û���¼key,�����´��Զ���½
//          GlobalManager.LastLoginKey:=ASuperObject.O['Data'].S['login_key'];
//
//          if Assigned(OnLoginSucc) then
//          begin
//            OnLoginSucc(Self);
//          end;
//
////          if not GlobalLoginFrame.IsLoginedThenReturn then
////          begin
////              //��½�ɹ�֮�󷵻���ҳ
////              HideFrame;
////              //������ӿڵ��óɹ�
////              frmMain.DoCallLoginAPISucc(False,
////                                          //��ʾ��ҳMainFrame
////                                          True);
////          end
////          else
////          begin
////              //��½�ɹ�֮�󷵻���һҳ
////              //������ӿڵ��óɹ�
////              frmMain.DoCallLoginAPISucc(False,
////                                          //����ʾ��ҳMainFrame
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
//        //��¼ʧ��
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //�����쳣
//      ShowMessageBoxFrame(nil,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;
end;

procedure TBaseUserBindThirdPartyAccount.DoIsThirdPartyAccountExecute(ATimerTask: TObject);
begin
//  //����
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
//                    FFbOpenId,
//                    FFbAuthToken,
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
//      //�쳣
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
//              //�Ѿ����ڸ������˺�,���¼
//              ShowWaitingFrame(nil,'��¼��...');
//              //΢�ŵ�¼
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
//              //������,
//
//              if Assigned(OnThirdPartyAccountNoExist) then
//              begin
//                OnThirdPartyAccountNoExist(Self);
//              end;
//
//              //ע��,��ת�������ֻ�����ҳ��,�����ֻ���֤
//              //ע��          1
////              HideFrame;//(nil,hfcttBeforeShowFrame);
////              ShowFrame(TFrame(GlobalRegisterFrame),TFrameRegister,frmMain,nil,nil,nil,Application);
////              GlobalRegisterFrame.FrameHistroy:=CurrentFrameHistroy;
////              GlobalRegisterFrame.Clear;//(Self.FRegisterLoginType);
////              GlobalRegisterFrame.pnlToolBar.Caption:='�ֻ���֤';
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
//        //��¼ʧ��
//        ShowMessageBoxFrame(nil,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //�����쳣
//      ShowMessageBoxFrame(nil,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
//    end;
//  finally
//    HideWaitingFrame;
//  end;

end;

procedure TBaseUserBindThirdPartyAccount.DoFacebookLoginCancel(Sender: TObject);
begin
  TThread.Synchronize(nil,
  procedure
  begin
    FMX.Types.Log.d('OrangeUI -- TFrameLogin.DoFacebookLoginCancel');
  end);
end;

procedure TBaseUserBindThirdPartyAccount.DoFacebookLoginError(Sender: TObject; AError: String);
begin
  TThread.Synchronize(nil,
  procedure
  begin
    FMX.Types.Log.d('OrangeUI -- TFrameLogin.Facebook Error '+AError);
  end);
end;

procedure TBaseUserBindThirdPartyAccount.DoFacebookLoginSuccess(Sender: TObject; AName, AGender, AUserID,
  ALocal, AUrl, AEmail, AToken: String);
begin


  FUserName:=AName;
  FUserHeadUrl:='';



  TThread.Synchronize(nil,
  procedure
  begin
     FMX.Types.Log.d('OrangeUI -- TFrameLogin.Facebook AName '+AName);
//    Self.SkinFMXMemo1.Lines.Add('�û���:'+AName);
//    Self.SkinFMXMemo1.Lines.Add('�Ա�:'+AGender);
//    Self.SkinFMXMemo1.Lines.Add('�û�ID:'+AUserID);
//    Self.SkinFMXMemo1.Lines.Add('���ڵ�:'+ALocal);
//    Self.SkinFMXMemo1.Lines.Add('ͷ������:'+AUrl);
//    Self.SkinFMXMemo1.Lines.Add('����:'+AEmail);
//    Self.SkinFMXMemo1.Lines.Add('Token:'+AToken);
//
//    Self.SkinFMXImage1.Prop.Picture.Url:=AUrl;

//    Self.edtUser.Text:=AName;
//
//    FLoginUser:='';
//    FLoginPassword:='';


    FFbOpenId:=AUserID;
    FFbAuthToken:=AToken;
    Self.FWxOpenId:='';
    Self.FWxAuthToken:='';
    Self.FAlipayOpenId:='';
    Self.FAlipayAuthToken:='';
    Self.FAppleOpenId:='';
    Self.FAppleAuthToken:='';


    FLoginType:=Const_RegisterLoginType_FaceBook;

    ShowWaitingFrame(nil,'��¼��...');
    //��¼
    uTimerTask.GetGlobalTimerThread.RunTempTask(
        DoLoginExecute,
        DoLoginExecuteEnd,
        'Login'
        );

  end);

end;


end.
