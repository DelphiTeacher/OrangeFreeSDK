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
  //推送的逻辑实现
  TPushClientRestImpl = class(TPushClientLogic)
  public
    //服务器地址
    PushServerUrl:String;
  public

    //注册推送到服务器
    procedure DoRegisterPushExecute(ATimerTask:TObject);override;
    procedure DoRegisterPushExecuteEnd(ATimerTask:TObject);override;

    //更新推送状态到服务器(前提是已经注册了推送)
    procedure DoUpdateIsNeedPushExecute(ATimerTask:TObject);override;
    procedure DoUpdateIsNeedPushExecuteEnd(ATimerTask:TObject);override;

    //更新推送状态到服务器(前提是已经注册了推送)
    procedure DoUpdateBadgeExecute(ATimerTask:TObject);override;
    procedure DoUpdateBadgeExecuteEnd(ATimerTask:TObject);override;

  public
    //更新是否在前后台(前台不用发推送,后台需要发推送)
    //需要即时更新,不能放在线程中延迟(但是Android下会卡死?)
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
            //更新推送前后台状态
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
                //异常
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

  //向服务器注册推送


  //出错
  TTimerTask(ATimerTask).TaskTag:=1;
    try


        //注册推送接口
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
        //异常
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

  //注册推送结束
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
      if ASuperObject.I['Code']=200 then
      begin

          //已经注册了推送,可以更新IsNeedPush和IsAtBackground
          Self.FIsRegisteredPushOnServer:=True;



//          //亿诚商家端测试
//          if (AppID='1004') and (AppType='shop') then
//          begin
//              {$IFDEF ANDROID}
//              ShowHintFrame(nil,'推送注册到服务器成功!');
//              {$ENDIF}
//          end;

      end
      else
      begin
        //注册推送失败
        //ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      //ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
    HandleException(nil,'OrangeUI DoRegisterPushExecuteEnd End');
  end;

end;

procedure TPushClientRestImpl.DoUpdateBadgeExecute(ATimerTask: TObject);
begin
  HandleException(nil,'OrangeUI DoUpdateBadgeExecute');

  //向服务器更新推送消息数

  //出错
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
      //异常
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

  //更新Badge结束
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
      if ASuperObject.I['Code']=200 then
      begin

        //更新了Badge

      end
      else
      begin
        //更新Badge失败
        //ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      //ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
    HandleException(nil,'OrangeUI DoUpdateBadgeExecuteEnd End');
  end;

end;

procedure TPushClientRestImpl.DoUpdateIsNeedPushExecute(ATimerTask: TObject);
begin
  HandleException(nil,'OrangeUI DoUpdateIsNeedPushExecute');

  //向服务器更新是否需要推送

  //出错
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
      //异常
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

  //更新推送结束
  try
    if TTimerTask(ATimerTask).TaskTag=0 then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
      if ASuperObject.I['Code']=200 then
      begin

        //更新了推送

      end
      else
      begin
        //更新推送失败
        //ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
      //ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
    HandleException(nil,'OrangeUI DoUpdateIsNeedPushExecuteEnd End');
  end;

end;


end.

