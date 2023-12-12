unit uPushClientLogic;


interface


//Android��Windows��Ĭ��ʹ�ø���
//ƻ����Ĭ��ʹ��APNS����
//{$IFNDEF IOS}
//
//  //����FCM����
////  {$DEFINE USE_FCM_PUSH}
//
//  //���ʹ���˹ȸ�����,��ôĬ��ʹ�ø���
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
                //��������
                pstGetui,
                //ϵͳ����(IOS����APNS,Android�����Զ����ݳ���)
                pstSystem
                );




  //���͵��߼�
  TPushClientLogic = class
  private
    //�����¼�-��ȡ����ClientID��DeviceToken
    procedure DoBasePushRegistedClient(Sender:TObject;AClientID:String;ADeviceToken:String);

    procedure ApplicationEventHandler(const Sender: TObject; const AMessage: TMessage);
    function DoApplicationEventHandler(AAppEvent: TApplicationEvent; AContext: TObject):Boolean;

  public

    //��������
    procedure StartBasePush;
    //���û���ClientID
    procedure BindUserAndBasePush;
    //ֹͣ����
    procedure StopBasePush;


    //�����Ƿ���������(�Ƿ��½�����˳�,�����������˲���������֪ͨ)
    procedure UpdateIsNeedPush(AIsNeedPush:Boolean);


  public
    //δ����Ϣ��,Ϊʲôһ��ʼ��-1?
    FBadge:Integer;
    //�����Ƿ���������(�Ƿ��½�����˳�)
    procedure UpdateBadge(ABadge:Integer);

  public
    FBasePush:TBasePush;

    //�Ƿ���Ҫ����(���IOSϵͳ����APP��ǰ̨����Ҫ����)
    FIsNeedPush:Boolean;

    //�Ѿ�ע��������,���Ը���IsNeedPush��IsAtBackground
    FIsRegisteredPushOnServer:Boolean;

    //�����ڵ���������ؽӿڵ��߳�
//    FPushTimerThread:TTimerThread;
  public

    //ע�����͵�������
    procedure DoRegisterPushExecute(ATimerTask:TObject);virtual;abstract;
    procedure DoRegisterPushExecuteEnd(ATimerTask:TObject);virtual;abstract;

    //��������״̬��������(ǰ�����Ѿ�ע��������,FIsRegisteredPushOnServerΪTrue)
    procedure DoUpdateIsNeedPushExecute(ATimerTask:TObject);virtual;abstract;
    procedure DoUpdateIsNeedPushExecuteEnd(ATimerTask:TObject);virtual;abstract;

    //��������״̬��������(ǰ�����Ѿ�ע��������,FIsRegisteredPushOnServerΪTrue)
    procedure DoUpdateBadgeExecute(ATimerTask:TObject);virtual;abstract;
    procedure DoUpdateBadgeExecuteEnd(ATimerTask:TObject);virtual;abstract;

  public
    //�����Ƿ���ǰ��̨(ǰ̨���÷�����,��̨��Ҫ������)
    //��Ҫ��ʱ����,���ܷ����߳����ӳ�(����Android�»Ῠ��?)
    procedure UpdatePushIsAtBackground(AIsAtBackground:Boolean);virtual;abstract;

  public
    constructor Create;
    destructor Destroy;override;
    { Public declarations }
  end;



var
  //��IOSƽ̨��ʹ�õ���������
//  GlobalPushSDKTypeOnIOS:TPushSDKType;
  //��IOSƽ̨��ʹ�õ���������
  GlobalPushSDKTypeOnAndroid:TPushSDKType;

  GlobalIsEnableXiaoMiPush:Boolean;
  GlobalIsEnableHuaweiPush:Boolean;


implementation




constructor TPushClientLogic.Create;
begin

  TMessageManager.DefaultManager.SubscribeToMessage(TApplicationEventMessage, ApplicationEventHandler);



  HandleException(nil,'OrangeUI TPushClientLogic.Create BasePush Begin');


  FBasePush:=nil;

  //����
  {$IFDEF HAS_PUSHNOTIFICATION}

  {$IFDEF IOS}
      //IOSƽ̨
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
          //ƻ�������Դ�������
          FBasePush:=TIOSAPNSPush.Create(nil);
      end;

  {$ELSE}
      //Androidƽ̨
      {$IFDEF ANDROID}
          case GlobalPushSDKTypeOnAndroid of
            pstGetui:
            begin
              FBasePush:=TGetuiPush.Create(nil);
            end;
            else
            begin
                //ϵͳ����,���ݳ�����,С���ֻ���С������,��Ϊ�ֻ��û�Ϊ����
                {$IFDEF HAS_XIAOMIPUSH}
                if IsXiaomi and GlobalIsEnableXiaoMiPush then
                begin
                    //С���ֻ�
                    FBasePush:=TXiaomiPush.Create(nil);
                end
                else
                {$ENDIF}
                {$IFDEF HAS_HUAWEIPUSH}
                if IsHuawei and GlobalIsEnableHuaweiPush then
                begin
                    //��Ϊ�ֻ�
                    FBasePush:=THuaweiPush.Create(nil);
                end
                else
                {$ENDIF}
                begin
                    //�����ֻ�,�ø���
                    FBasePush:=TGetuiPush.Create(nil);
                end;
            end;
          end;
    //      {$IFDEF HAS_GETUIPUSH}
    //      HandleException(nil,'OrangeUI TPushClientLogic.Create BasePush TGetuiPush.Create');
    //      //Android�����ø�������
    //      FBasePush:=TGetuiPush.Create(nil);
    //      {$ELSE}
    //          {$IFDEF USE_FCM_PUSH}
    //          FBasePush:=TFcmPush.Create(nil);
    //          {$ELSE}
    //          {$ENDIF}
    //      {$ENDIF}

      {$ELSE}
          //Windowsƽ̨
          FBasePush:=TGetuiPush.Create(nil);
      {$ENDIF}

  {$ENDIF}



  //IOS���ڴ�����������,Android�����������ļ�������
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
      //�����һ����������
      HandleException(nil,'FinishedLaunching');
    end;
    TApplicationEvent.BecameActive:
    begin
      //ת��ǰ̨
      HandleException(nil,'BecameActive');

        {$IFDEF ANDROID}
      //Bundle bundle = getIntent().getExtras();
//      ABundle:=SharedActivity.getIntent.getExtras;
//      if (ABundle <> nil) then
//      begin
//        FMX.Types.Log.d('OrangeUI  ABundle:'+JStringToString(ABundle.toString));
//      end;
      {$ENDIF}

      //��������ǰ��̨״̬
      Self.UpdatePushIsAtBackground(False);
    end;
    TApplicationEvent.WillBecomeInactive:
    begin
      HandleException(nil,'WillBecomeInactive');
    end;
    TApplicationEvent.EnteredBackground:
    begin
      //ת����̨
      HandleException(nil,'EnteredBackground');



      //��������ǰ��̨״̬
//      {$IFDEF IOS}
//      if (UserFID<>'0') and (Self.UserFID<>'') then
//      begin
        Self.UpdatePushIsAtBackground(True);
//      end;
//      {$ENDIF}

//      //��������ǰ��̨״̬
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


//  //�ڳ��̼Ҷ˲���
//  if (AppID='1004') and (AppType='shop') then
//  begin
//      {$IFDEF ANDROID}
//      TThread.Synchronize(nil,procedure
//      begin
//        ShowHintFrame(nil,'��ȡ��������ID'+AClientID);
//      end);
//      {$ENDIF ANDROID}
//  end;


//  if Not FIsRegisteredPushOnServer then
//  begin
    //�������ע������
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



  //��������
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

  //û��ע��������,���ܸ���IsNeedPush��IsAtBackground
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
      //���������������״̬
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
    //���������������״̬
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
