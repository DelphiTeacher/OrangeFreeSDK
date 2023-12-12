unit uPushClientLogic;


interface


//Android、Windows下默认使用个推
//苹果下默认使用APNS推送
//{$IFNDEF IOS}
//
//  //先用FCM测试
////  {$DEFINE USE_FCM_PUSH}
//
//  //如果使用了谷歌推送,那么默认使用个推
//  {$IFNDEF USE_FCM_PUSH}
//    {$DEFINE HAS_GETUIPUSH}
//  {$ENDIF}
//
//{$ENDIF}


{$I OpenPlatformClient.inc}

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,



  uBasePush,
  uOpenClientCommon,



  {$IFDEF HAS_GETUIPUSH}
  uGetuiPush,
  {$ENDIF}

  {$IFDEF HAS_XIAOMIPUSH}
  uXiaomiPush,
  {$ENDIF}

  {$IFDEF HAS_HUAWEIPUSH}
  uHuaweiPush,
  {$ENDIF}

//  {$IFDEF HAS_GETUIPUSH}
//  {$ENDIF}

//  {$IFDEF USE_FCM_PUSH}
//  uFcmPush,
//  {$ENDIF}

  FMX.Platform,

  uTimerTask_Copy,
  uBaseLog_Copy,
//  HintFrame,

  System.Messaging,

  {$IFDEF IN_ORANGESDK}
  XSuperObject_Copy,
  {$ELSE}
  XSuperObject,
  XSuperJson,
  {$ENDIF}


//  uAPPCommon,


  {$IFDEF IOS}
//      {$IFNDEF HAS_GETUIPUSH}
      uIOSAPNSPush,
//      {$ENDIF}
  {$ENDIF}


  {$IFDEF ANDROID}
  FMX.Helpers.Android,
  Androidapi.Helpers,
  {$ENDIF}

  FMX.Types,

  System.Notification
  ;



type

  TPushSDKType=(
                //个推推送
                pstGetui,
                //系统推送(IOS下是APNS,Android下面自动根据厂商)
                pstSystem
                );




  //推送的逻辑
  TPushClientLogic = class
  private
    //推送事件-获取到了ClientID或DeviceToken
    procedure DoBasePushRegistedClient(Sender:TObject;AClientID:String;ADeviceToken:String);

    procedure ApplicationEventHandler(const Sender: TObject; const AMessage: TMessage);
    function DoApplicationEventHandler(AAppEvent: TApplicationEvent; AContext: TObject):Boolean;

  public

    //启动推送
    procedure StartBasePush;
    //绑定用户和ClientID
    procedure BindUserAndBasePush;
    //停止推送
    procedure StopBasePush;


    //更新是否允许推送(是否登陆还是退出,或者是设置了不接收推送通知)
    procedure UpdateIsNeedPush(AIsNeedPush:Boolean);


  public
    //未读消息数,为什么一开始是-1?
    FBadge:Integer;
    //更新是否允许推送(是否登陆还是退出)
    procedure UpdateBadge(ABadge:Integer);

  public
    FBasePush:TBasePush;

    //是否需要推送(如果IOS系统并且APP在前台不需要推送)
    FIsNeedPush:Boolean;

    //已经注册了推送,可以更新IsNeedPush和IsAtBackground
    FIsRegisteredPushOnServer:Boolean;

    //仅用于调用推送相关接口的线程
//    FPushTimerThread:TTimerThread;
  public

    //注册推送到服务器
    procedure DoRegisterPushExecute(ATimerTask:TObject);virtual;abstract;
    procedure DoRegisterPushExecuteEnd(ATimerTask:TObject);virtual;abstract;

    //更新推送状态到服务器(前提是已经注册了推送,FIsRegisteredPushOnServer为True)
    procedure DoUpdateIsNeedPushExecute(ATimerTask:TObject);virtual;abstract;
    procedure DoUpdateIsNeedPushExecuteEnd(ATimerTask:TObject);virtual;abstract;

    //更新推送状态到服务器(前提是已经注册了推送,FIsRegisteredPushOnServer为True)
    procedure DoUpdateBadgeExecute(ATimerTask:TObject);virtual;abstract;
    procedure DoUpdateBadgeExecuteEnd(ATimerTask:TObject);virtual;abstract;

  public
    //更新是否在前后台(前台不用发推送,后台需要发推送)
    //需要即时更新,不能放在线程中延迟(但是Android下会卡死?)
    procedure UpdatePushIsAtBackground(AIsAtBackground:Boolean);virtual;abstract;

  public
    constructor Create;
    destructor Destroy;override;
    { Public declarations }
  end;



var
  //在IOS平台下使用的推送类型
//  GlobalPushSDKTypeOnIOS:TPushSDKType;
  //在IOS平台下使用的推送类型
  GlobalPushSDKTypeOnAndroid:TPushSDKType;

  GlobalIsEnableXiaoMiPush:Boolean;
  GlobalIsEnableHuaweiPush:Boolean;


implementation




constructor TPushClientLogic.Create;
begin

  TMessageManager.DefaultManager.SubscribeToMessage(TApplicationEventMessage, ApplicationEventHandler);



  HandleException(nil,'OrangeUI TPushClientLogic.Create BasePush Begin');


  FBasePush:=nil;

  //推送
  {$IFDEF HAS_PUSHNOTIFICATION}

  {$IFDEF IOS}
      //IOS平台
//      case GlobalPushSDKTypeOnIOS of
//        pstGetui:
//        begin
          {$IFDEF HAS_GETUIPUSH}
          FBasePush:=TGetuiPush.Create(nil);
          {$ENDIF}
//        end
//        else
//        begin
//        end;
//      end;

      if FBasePush=nil then
      begin
          //苹果下用自带的推送
          FBasePush:=TIOSAPNSPush.Create(nil);
      end;

  {$ELSE}
      //Android平台
      {$IFDEF ANDROID}
          case GlobalPushSDKTypeOnAndroid of
            pstGetui:
            begin
              FBasePush:=TGetuiPush.Create(nil);
            end;
            else
            begin
                //系统推送,根据厂家来,小米手机用小米推送,华为手机用华为推送
                {$IFDEF HAS_XIAOMIPUSH}
                if IsXiaomi and GlobalIsEnableXiaoMiPush then
                begin
                    //小米手机
                    FBasePush:=TXiaomiPush.Create(nil);
                end
                else
                {$ENDIF}
                {$IFDEF HAS_HUAWEIPUSH}
                if IsHuawei and GlobalIsEnableHuaweiPush then
                begin
                    //华为手机
                    FBasePush:=THuaweiPush.Create(nil);
                end
                else
                {$ENDIF}
                begin
                    //其他手机,用个推
                    FBasePush:=TGetuiPush.Create(nil);
                end;
            end;
          end;
    //      {$IFDEF HAS_GETUIPUSH}
    //      HandleException(nil,'OrangeUI TPushClientLogic.Create BasePush TGetuiPush.Create');
    //      //Android下面用个推推送
    //      FBasePush:=TGetuiPush.Create(nil);
    //      {$ELSE}
    //          {$IFDEF USE_FCM_PUSH}
    //          FBasePush:=TFcmPush.Create(nil);
    //          {$ELSE}
    //          {$ENDIF}
    //      {$ENDIF}

      {$ELSE}
          //Windows平台
          FBasePush:=TGetuiPush.Create(nil);
      {$ENDIF}

  {$ENDIF}



  //IOS下在代码里面设置,Android下面在配置文件中配置
  FBasePush.OnRegistedClient:=Self.DoBasePushRegistedClient;


//  FPushTimerThread:=TTimerThread.Create(False);

  {$ENDIF}



  HandleException(nil,'OrangeUI TPushClientLogic.Create BasePush End');

  FBadge:=0;//-1;

end;

destructor TPushClientLogic.Destroy;
begin
  FreeAndNil(FBasePush);

  TMessageManager.DefaultManager.Unsubscribe(TApplicationEventMessage, ApplicationEventHandler);

//  FPushTimerThread.Terminate;
//  FPushTimerThread.WaitFor;
//  FreeAndNil(FPushTimerThread);
  Inherited;
end;


procedure TPushClientLogic.ApplicationEventHandler(const Sender: TObject;
  const AMessage: TMessage);
var
  EventData: TApplicationEventData;
begin
  if AMessage is TApplicationEventMessage then
  begin
    EventData := TApplicationEventMessage(AMessage).Value;


//    if Owner.IsFocused and (Owner.GetObject.Root <> nil) and (EventData.Event in WhenHideFocusApplicationStates) then
//      Owner.GetObject.Root.Focused := nil;

    DoApplicationEventHandler(EventData.Event,EventData.Context);
  end;


end;

procedure TPushClientLogic.BindUserAndBasePush;
begin
  HandleException(nil,'OrangeUI TPushClientLogic.BindUserAndBasePush');

  GetGlobalTimerThread.RunTempTask(
                        DoRegisterPushExecute,
                        DoRegisterPushExecuteEnd,
                        'RegisterPush',
                        True
                        );
end;

function TPushClientLogic.DoApplicationEventHandler(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
begin
  case AAppEvent of
    TApplicationEvent.FinishedLaunching:
    begin
      //程序第一次启动结束
      HandleException(nil,'FinishedLaunching');
    end;
    TApplicationEvent.BecameActive:
    begin
      //转到前台
      HandleException(nil,'BecameActive');

        {$IFDEF ANDROID}
      //Bundle bundle = getIntent().getExtras();
//      ABundle:=SharedActivity.getIntent.getExtras;
//      if (ABundle <> nil) then
//      begin
//        FMX.Types.Log.d('OrangeUI  ABundle:'+JStringToString(ABundle.toString));
//      end;
      {$ENDIF}

      //更新推送前后台状态
      Self.UpdatePushIsAtBackground(False);
    end;
    TApplicationEvent.WillBecomeInactive:
    begin
      HandleException(nil,'WillBecomeInactive');
    end;
    TApplicationEvent.EnteredBackground:
    begin
      //转到后台
      HandleException(nil,'EnteredBackground');



      //更新推送前后台状态
//      {$IFDEF IOS}
//      if (UserFID<>'0') and (Self.UserFID<>'') then
//      begin
        Self.UpdatePushIsAtBackground(True);
//      end;
//      {$ENDIF}

//      //更新推送前后台状态
//      Self.UpdatePushIsAtBackground(True);


    end;
    TApplicationEvent.WillBecomeForeground:
    begin
      HandleException(nil,'WillBecomeForeground');
    end;
    TApplicationEvent.WillTerminate:
    begin
      HandleException(nil,'WillTerminate');
    end;
    TApplicationEvent.LowMemory:
    begin
      HandleException(nil,'LowMemory');
    end;
    TApplicationEvent.TimeChange:
    begin

    end;
    TApplicationEvent.OpenURL:
    begin

    end;
  end;

end;

procedure TPushClientLogic.DoBasePushRegistedClient(Sender: TObject; AClientID,ADeviceToken: String);
begin

  HandleException(nil,'OrangeUI TPushClientLogic.DoBasePushRegistedClient');


//  //亿诚商家端测试
//  if (AppID='1004') and (AppType='shop') then
//  begin
//      {$IFDEF ANDROID}
//      TThread.Synchronize(nil,procedure
//      begin
//        ShowHintFrame(nil,'获取到了推送ID'+AClientID);
//      end);
//      {$ENDIF ANDROID}
//  end;


//  if Not FIsRegisteredPushOnServer then
//  begin
    //向服务器注册推送
    GetGlobalTimerThread.RunTempTask(
        DoRegisterPushExecute,
        DoRegisterPushExecuteEnd,
        'RegisterPush',
        True
        );
//  end;

end;

procedure TPushClientLogic.StartBasePush;
begin
  HandleException(nil,'OrangeUI TPushClientLogic.StartBasePush Prepare StartBasePush');



  //启用推送
  if (FBasePush<>nil) then
  begin
      HandleException(nil,'OrangeUI TPushClientLogic.StartBasePush Start BasePush');

      FBasePush.Start;
  end;


end;

procedure TPushClientLogic.StopBasePush;
begin
  HandleException(nil,'OrangeUI TPushClientLogic.StopBasePush Prepare StopBasePush');

  UpdateIsNeedPush(False);

  if FBasePush<>nil then
  begin
    HandleException(nil,'OrangeUI TPushClientLogic.StopBasePush Stop StopBasePush');

    FBasePush.Stop;
  end;

  //没有注册了推送,不能更新IsNeedPush和IsAtBackground
  FIsRegisteredPushOnServer:=False;
end;

procedure TPushClientLogic.UpdateIsNeedPush(AIsNeedPush:Boolean);
var
  APushInfoJson:ISuperObject;
begin
  HandleException(nil,'OrangeUI TPushClientLogic.UpdateIsNeedPush Prepare UpdateIsNeedPush '+BoolToStr(AIsNeedPush));

  if FIsRegisteredPushOnServer then
  begin
      FIsNeedPush:=AIsNeedPush;
      //向服务器更新推送状态
      GetGlobalTimerThread.RunTempTask(
                  DoUpdateIsNeedPushExecute,
                  DoUpdateIsNeedPushExecuteEnd,
                  'UpdateIsNeedPush',
                  True
                  );
  end;

end;

procedure TPushClientLogic.UpdateBadge(ABadge:Integer);
var
  APushInfoJson:ISuperObject;
begin

  if FBadge<>ABadge then
  begin
    HandleException(nil,'OrangeUI TPushClientLogic.UpdateBadge Prepare UpdateBadge '+IntToStr(ABadge));

    FBadge:=ABadge;
    //向服务器更新推送状态
    GetGlobalTimerThread.RunTempTask(
                        DoUpdateBadgeExecute,
                        DoUpdateBadgeExecuteEnd
                        );
  end;
end;


initialization
//  GlobalPushSDKTypeOnIOS:=pstSystem;
//  GlobalPushSDKTypeOnAndroid:=pstGetui;
  GlobalPushSDKTypeOnAndroid:=pstSystem;


  GlobalIsEnableXiaoMiPush:=True;
  GlobalIsEnableHuaweiPush:=True;



end.
