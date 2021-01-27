unit uPushClientRestImpl;

interface


uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,


  uBaseLog,



  XSuperObject,
  XSuperJson,

  uOpenCommon,

  uBaseHttpControl,
  uTimerTask,
  uFuncCommon,
//  uGetDeviceInfo,
  uRestInterfaceCall,
  uPushClientLogic,
//  HintFrame,
//  uSkinMessageBox,


  FMX.Platform,

  {$IFDEF ANDROID}
  Androidapi.JNI.Net,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  {$ENDIF}



  FMX.Types;




type
  //���͵��߼�ʵ��
  TPushClientRestImpl = class(TPushClientLogic)
  public
    //��������ַ
    PushServerUrl:String;
  public

    //ע�����͵�������
    procedure DoRegisterPushExecute(ATimerTask:TObject);override;
    procedure DoRegisterPushExecuteEnd(ATimerTask:TObject);override;

    //��������״̬��������(ǰ�����Ѿ�ע��������)
    procedure DoUpdateIsNeedPushExecute(ATimerTask:TObject);override;
    procedure DoUpdateIsNeedPushExecuteEnd(ATimerTask:TObject);override;

    //��������״̬��������(ǰ�����Ѿ�ע��������)
    procedure DoUpdateBadgeExecute(ATimerTask:TObject);override;
    procedure DoUpdateBadgeExecuteEnd(ATimerTask:TObject);override;

  public
    //�����Ƿ���ǰ��̨(ǰ̨���÷�����,��̨��Ҫ������)
    //��Ҫ��ʱ����,���ܷ����߳����ӳ�(����Android�»Ῠ��?)
    procedure UpdatePushIsAtBackground(AIsAtBackground:Boolean);override;
  end;




implementation



procedure TPushClientRestImpl.UpdatePushIsAtBackground(AIsAtBackground: Boolean);
var
  ATaskDesc:String;
  ASuperObject:ISuperObject;
begin
  HandleException(nil,'OrangeUI UpdatePushIsAtBackground Begin');

  if (Self<>nil)
    and (Self.FIsRegisteredPushOnServer) then
  begin
      {$IFNDEF IOS}
      TThread.CreateAnonymousThread(
      procedure
      begin
      {$ENDIF}
            //��������ǰ��̨״̬
            try


                ATaskDesc:=SimpleCallAPI('update_user_push_is_at_background',
                                        nil,
                                        PushServerUrl,
                                        ['appid',
                                        'app_type',
                                        'push_type',
                                        'client_id',
                                        'ios_device_token',
                                        'is_at_background'],
                                        [AppID,
                                        AppType,
                                        Self.FBasePush.GetPushType,
                                        Self.FBasePush.GetClientID,
                                        Self.FBasePush.DeviceToken,
                                        Ord(AIsAtBackground)],
                                        GlobalRestAPISignType,
                                        GlobalRestAPIAppSecret
                                        );

                HandleException(nil,'OrangeUI UpdatePushIsAtBackground End');

                if ATaskDesc<>'' then
                begin
                    ASuperObject:=TSuperObject.Create(ATaskDesc);
                    if ASuperObject.I['Code']=200 then
                    begin

                      HandleException(nil,'OrangeUI UpdatePushIsAtBackground Succ');

                    end
                    else
                    begin
                      HandleException(nil,'OrangeUI UpdatePushIsAtBackground Fail');


                    end;

                end;


            except
              on E:Exception do
              begin
                //�쳣
                HandleException(E,'OrangeUI UpdatePushIsAtBackground');
              end;
            end;

      {$IFNDEF IOS}
      end).Start;
      {$ENDIF IOS}
  end;

end;

procedure TPushClientRestImpl.DoRegisterPushExecute(ATimerTask:TObject);
begin
  HandleException(nil,'OrangeUI DoRegisterPushExecute');

  //�������ע������


  //����
  TTimerTask(ATimerTask).TaskTag:=1;
    try


        //ע�����ͽӿ�
        TTimerTask(ATimerTask).TaskDesc:=
                  SimpleCallAPI('register_user_push',
                      nil,
                      PushServerUrl,
                      ['appid',
                      'user_fid',
                      'key',
                      'app_type',
                      'push_type',
                      'client_id',
                      'ios_device_token',
                      'os',
//                      'phone_type',
                      'is_need_push'
                      ],
                      [AppID,
                      UserFID,
                      '',
                      AppType,
                      Self.FBasePush.GetPushType,
                      Self.FBasePush.ClientID,
                      Self.FBasePush.DeviceToken,
                      GetOS,
//                      GetPhoneType,
                      1
                      ],
                                        GlobalRestAPISignType,
                                        GlobalRestAPIAppSecret
                      );


        if TTimerTask(ATimerTask).TaskDesc<>'' then
        begin
            TTimerTask(ATimerTask).TaskTag:=0;
        end;


    except
      on E:Exception do
      begin
        //�쳣
        HandleException(E,'OrangeUI DoRegisterPushExecute');
        TTimerTask(ATimerTask).TaskDesc:=E.Message;
      end;
    end;



end;

procedure TPushClientRestImpl.DoRegisterPushExecuteEnd(ATimerTask: TObject);
var
  ASuperObject:ISuperObject;
begin
  HandleException(nil,'OrangeUI DoRegisterPushExecuteEnd');

  //ע�����ͽ���
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
      if ASuperObject.I['Code']=200 then
      begin

          //�Ѿ�ע��������,���Ը���IsNeedPush��IsAtBackground
          Self.FIsRegisteredPushOnServer:=True;



//          //�ڳ��̼Ҷ˲���
//          if (AppID='1004') and (AppType='shop') then
//          begin
//              {$IFDEF ANDROID}
//              ShowHintFrame(nil,'����ע�ᵽ�������ɹ�!');
//              {$ENDIF}
//          end;

      end
      else
      begin
        //ע������ʧ��
        //ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //�����쳣
      //ShowMessageBoxFrame(Self,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
    end;
  finally
    HandleException(nil,'OrangeUI DoRegisterPushExecuteEnd End');
  end;

end;

procedure TPushClientRestImpl.DoUpdateBadgeExecute(ATimerTask: TObject);
begin
  HandleException(nil,'OrangeUI DoUpdateBadgeExecute');

  //�����������������Ϣ��

  //����
  TTimerTask(ATimerTask).TaskTag:=1;
  try


      TTimerTask(ATimerTask).TaskDesc:=
            SimpleCallAPI('update_user_push_badge',
                          nil,
                          PushServerUrl,
                          ['appid',
                          'app_type',
                          'push_type',
                          'client_id',
                          'ios_device_token',
                          'badge'],
                          [AppID,
                          AppType,
                          Self.FBasePush.GetPushType,
                          Self.FBasePush.ClientID,
                          Self.FBasePush.DeviceToken,
                          Self.FBadge],
                          GlobalRestAPISignType,
                          GlobalRestAPIAppSecret
                          );


      if TTimerTask(ATimerTask).TaskDesc<>'' then
      begin
          TTimerTask(ATimerTask).TaskTag:=0;
      end;

  except
    on E:Exception do
    begin
      //�쳣
      HandleException(E,'OrangeUI DoUpdateBadgeExecute');
      TTimerTask(ATimerTask).TaskDesc:=E.Message;
    end;
  end;

end;

procedure TPushClientRestImpl.DoUpdateBadgeExecuteEnd(ATimerTask: TObject);
var
  ASuperObject:ISuperObject;
begin
  HandleException(nil,'OrangeUI DoUpdateBadgeExecuteEnd');

  //����Badge����
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
      if ASuperObject.I['Code']=200 then
      begin

        //������Badge

      end
      else
      begin
        //����Badgeʧ��
        //ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //�����쳣
      //ShowMessageBoxFrame(Self,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
    end;
  finally
    HandleException(nil,'OrangeUI DoUpdateBadgeExecuteEnd End');
  end;

end;

procedure TPushClientRestImpl.DoUpdateIsNeedPushExecute(ATimerTask: TObject);
begin
  HandleException(nil,'OrangeUI DoUpdateIsNeedPushExecute');

  //������������Ƿ���Ҫ����

  //����
  TTimerTask(ATimerTask).TaskTag:=1;
  try


      TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI('update_user_is_need_push',
                    nil,
                    PushServerUrl,
                    ['appid',
                    'app_type',
                    'user_fid',
                    'key',
                    'is_need_push'],
                    [AppID,
                    AppType,
                    UserFID,
                    '',
                    Self.FIsNeedPush],
                                        GlobalRestAPISignType,
                                        GlobalRestAPIAppSecret
                    );


      if TTimerTask(ATimerTask).TaskDesc<>'' then
      begin
          TTimerTask(ATimerTask).TaskTag:=0;
      end;

  except
    on E:Exception do
    begin
      //�쳣
      HandleException(E,'OrangeUI DoUpdateIsNeedPushExecute');
      TTimerTask(ATimerTask).TaskDesc:=E.Message;
    end;
  end;


end;

procedure TPushClientRestImpl.DoUpdateIsNeedPushExecuteEnd(ATimerTask: TObject);
var
  ASuperObject:ISuperObject;
begin
  HandleException(nil,'OrangeUI DoUpdateIsNeedPushExecuteEnd');

  //�������ͽ���
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
      if ASuperObject.I['Code']=200 then
      begin

        //����������

      end
      else
      begin
        //��������ʧ��
        //ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['ȷ��'],nil);
      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //�����쳣
      //ShowMessageBoxFrame(Self,'�����쳣,����������������!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['ȷ��'],nil);
    end;
  finally
    HandleException(nil,'OrangeUI DoUpdateIsNeedPushExecuteEnd End');
  end;

end;


end.

