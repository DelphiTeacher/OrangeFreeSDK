unit uReadHospitalCardSDK;

interface


uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,

  {$IFDEF ANDROID}
  FMX.Helpers.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.os,
  Androidapi.JNI.Net,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  Androidapi.NativeActivity,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.GraphicsContentViewText,
  {$ENDIF}

  XSuperObject,
  Androidapi.JNI.YSF_release_aar,
  Androidapi.JNI.myysflibrary,


  FMX.Controls.Presentation, FMX.StdCtrls;
type
  TReadHospitalCardSDK=class;
  {$IFDEF ANDROID}
  //PDAɨ��㲥��ʼ����
  TReadCardBoardcastListener = class(TJavaLocal, JFMXBroadcastReceiverListener)
  public
    FReadHospitalCardSDK:TReadHospitalCardSDK;
    constructor Create(AReadHospitalCardSDK:TReadHospitalCardSDK);
    destructor Destroy;override;
  public
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;


  TCheckModuleBoardcastListener = class(TJavaLocal, JFMXBroadcastReceiverListener)
  public
    FReadHospitalCardSDK:TReadHospitalCardSDK;
    constructor Create(AReadHospitalCardSDK:TReadHospitalCardSDK);
    destructor Destroy;override;
  public
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;
  {$ENDIF ANDROID}



  TReadHospitalCardSDK=class
  public
    {$IFDEF ANDROID}
    FReadCardIntentFilter: JIntentFilter;
    FReadCardBroadcastReceiver:JFMXBroadcastReceiver;
    FReadCardBroadcastListener:TReadCardBoardcastListener;


    FCheckModuleIntentFilter: JIntentFilter;
    FCheckModuleBroadcastReceiver:JFMXBroadcastReceiver;
    FCheckModuleBroadcastListener:TCheckModuleBoardcastListener;
    {$ENDIF ANDROID}

    //�����Ŀ�����
    FReadedCardData:String;
    FOnReadedCardData:TNotifyEvent;
    constructor Create;
    //��ʼ,���豸
    procedure Init;
    //���ģ��
    procedure CheckModule;
    //���� type  ������ A-�Ӵ���B-�ǽ� C-������D-ɨ�룬E-���֤
    procedure ReadCard(ACardType:String);
    //�ر����ж���
    procedure CloseModule;
  end;



implementation




//uses
//  Unit13;

  {$IFDEF ANDROID}
{ TReadCardBoardcastListener }

constructor TReadCardBoardcastListener.Create(AReadHospitalCardSDK:TReadHospitalCardSDK);
begin
  Inherited Create;
  FReadHospitalCardSDK:=AReadHospitalCardSDK;

end;

procedure TReadCardBoardcastListener.onReceive(context: JContext; intent: JIntent);
var
  action:JString;
  LStrAction: string;
  ACardData:String;
  ASuperObject:ISuperObject;
begin
  action:=intent.getAction;
  LStrAction := JStringToString(intent.getAction);

  FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive '+LStrAction);



  TThread.Synchronize(nil,procedure
  begin
    //GlobalScanInStoreFrame.DoScanCodeResultEvent(nil,ACardData);
//    Form13.Memo1.Lines.Add(LStrAction);
  end);



//  if(action.equals(TJReadCard.JavaClass.SDK_BROADTCAST_ACTION_STRING_PERMISSION_CHECK_ERROR)) then
//  begin
//    // key ��֤ʧ�ܣ���Ӧ����
//    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive key ��֤ʧ��');
//  end;
//
//
//  if(action.equals(TJReadCard.JavaClass.SDK_BROADCAST_ACTION_STRING_NETWORK_ERROR)) then
//  begin
//    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive SDK_BROADCAST_ACTION_STRING_NETWORK_ERROR');
//  end;
//
//
//  if(action.equals(TJReadCard.JavaClass.SDK_BROADTCAST_INTENT_EXTRA_INFO_KEY_ERROR_CODE)) then
//  begin
//    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive SDK_BROADTCAST_INTENT_EXTRA_INFO_KEY_ERROR_CODE');
//  end;

//####�������ؽ��
//�Թ㲥����ʽ
//Action:com.hifond.CARD_DATA
//StringExtra:cardData
//�������˵��  json
{"cardName":"��*��",  //����
"cardNo":"123456",   //����
"cardType":"1",    //1-�Ӵ�ʽоƬ��, 2-�ǽӴ�ʽоƬ��, 3-������, 4-������, 5-���֤
"cardTypeZH":"�Ӵ���",
"districtCode":"320400", //�籣���ĵ�������
"idCardNo":"3425************0029",  //֤�����֤����
"resultCode":"00000",  //"00000"-�����ɹ���"99999"-����ʧ��
"sex":"Ů",     //�Ա�
"backup01":"base64",  //���֤ͷ��bitmap��base64��������
"uid":"d6e52521"    //M1���Ŀ���ʶ�ţ�default��
}



  if intent.hasExtra(StringToJString('cardData')) then
  begin
    ACardData:=JStringToString(intent.getStringExtra(StringToJString('cardData')));
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive ACardData:'+ACardData);

    ASuperObject:=TSuperObject.Create(ACardData);
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive cardName:'+ASuperObject.S['cardName']);
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive cardNo:'+ASuperObject.S['cardNo']);
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive cardType:'+ASuperObject.S['cardType']);
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive cardTypeZH:'+ASuperObject.S['cardTypeZH']);
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive districtCode:'+ASuperObject.S['districtCode']);
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive idCardNo:'+ASuperObject.S['idCardNo']);
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive resultCode:'+ASuperObject.S['resultCode']);
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive sex:'+ASuperObject.S['sex']);
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive uid:'+ASuperObject.S['uid']);


    TThread.Synchronize(nil,procedure
    begin
      //GlobalScanInStoreFrame.DoScanCodeResultEvent(nil,ACardData);
      FReadHospitalCardSDK.FReadedCardData:=ACardData;
      if Assigned(FReadHospitalCardSDK.FOnReadedCardData) then
      begin
        FReadHospitalCardSDK.FOnReadedCardData(FReadHospitalCardSDK);
      end;
//      Form13.Memo1.Lines.Add(ACardData);
    end);

  end
  else
  begin
    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive no ACardData');
  end;


end;


destructor TReadCardBoardcastListener.Destroy;
begin
  FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.Destroy begin');
  Inherited;
  FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.Destroy end');
end;



{ TCheckModuleBoardcastListener }

constructor TCheckModuleBoardcastListener.Create(AReadHospitalCardSDK:TReadHospitalCardSDK);
begin
  Inherited Create;
  FReadHospitalCardSDK:=AReadHospitalCardSDK;

end;

procedure TCheckModuleBoardcastListener.onReceive(context: JContext; intent: JIntent);
var
  action:JString;
  LStrAction: string;
  ACardData:String;
begin
  action:=intent.getAction;
  LStrAction := JStringToString(intent.getAction);

  FMX.Types.Log.d('OrangeUI TCheckModuleBoardcastListener.onReceive '+LStrAction);



  TThread.Synchronize(nil,procedure
  begin
    //GlobalScanInStoreFrame.DoScanCodeResultEvent(nil,ACardData);
//    Form13.Memo1.Lines.Add(LStrAction);
  end);



//  if(action.equals(TJCheckModule.JavaClass.SDK_BROADTCAST_ACTION_STRING_PERMISSION_CHECK_ERROR)) then
//  begin
//    // key ��֤ʧ�ܣ���Ӧ����
//    FMX.Types.Log.d('OrangeUI TCheckModuleBoardcastListener.onReceive key ��֤ʧ��');
//  end;
//
//
//  if(action.equals(TJCheckModule.JavaClass.SDK_BROADCAST_ACTION_STRING_NETWORK_ERROR)) then
//  begin
//    FMX.Types.Log.d('OrangeUI TCheckModuleBoardcastListener.onReceive SDK_BROADCAST_ACTION_STRING_NETWORK_ERROR');
//  end;
//
//
//  if(action.equals(TJCheckModule.JavaClass.SDK_BROADTCAST_INTENT_EXTRA_INFO_KEY_ERROR_CODE)) then
//  begin
//    FMX.Types.Log.d('OrangeUI TCheckModuleBoardcastListener.onReceive SDK_BROADTCAST_INTENT_EXTRA_INFO_KEY_ERROR_CODE');
//  end;
  if intent.hasExtra(StringToJString('cardData')) then
  begin
    ACardData:=JStringToString(intent.getStringExtra(StringToJString('cardData')));

    FMX.Types.Log.d('OrangeUI TCheckModuleBoardcastListener.onReceive ACardData:'+ACardData);

    TThread.Synchronize(nil,procedure
    begin
      //GlobalScanInStoreFrame.DoScanCodeResultEvent(nil,ACardData);
//      Form13.Memo1.Lines.Add(ACardData);
      FReadHospitalCardSDK.FReadedCardData:=ACardData;
      if Assigned(FReadHospitalCardSDK.FOnReadedCardData) then
      begin
        FReadHospitalCardSDK.FOnReadedCardData(FReadHospitalCardSDK);
      end;
    end);

  end
  else
  begin
    FMX.Types.Log.d('OrangeUI TCheckModuleBoardcastListener.onReceive no ACardData');
  end;


end;


destructor TCheckModuleBoardcastListener.Destroy;
begin
  FMX.Types.Log.d('OrangeUI TCheckModuleBoardcastListener.Destroy begin');
  Inherited;
  FMX.Types.Log.d('OrangeUI TCheckModuleBoardcastListener.Destroy end');
end;

  {$ENDIF ANDROID}




{ TReadHospitalCardSDK }

procedure TReadHospitalCardSDK.CheckModule;
begin
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.CheckModule begin');
  {$IFDEF ANDROID}
  TJHifondCardInterface.JavaClass.checkModule;
  {$ENDIF}
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.CheckModule end');
end;

procedure TReadHospitalCardSDK.CloseModule;
begin
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.CloseModule begin');
  {$IFDEF ANDROID}
  //�ر�����ģ��
  TJHifondCardInterface.JavaClass.closeModule();
  {$ENDIF}
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.CloseModule end');
end;

constructor TReadHospitalCardSDK.Create;
begin
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.Create begin');


  {$IFDEF ANDROID}
  //����
  FReadCardBroadcastListener:=TReadCardBoardcastListener.Create(Self);
  FReadCardBroadcastReceiver:=TJFMXBroadcastReceiver.JavaClass.init(FReadCardBroadcastListener);

  FReadCardIntentFilter:=TJIntentFilter.JavaClass.init;
  //com.hifond.CARD_DATA                         //com.hifond.CARD_DATA
  FReadCardIntentFilter.addAction(StringToJString('com.hifond.CARD_DATA'));

  SharedActivity.registerReceiver(FReadCardBroadcastReceiver, FReadCardIntentFilter);


  //���ģ��
  FCheckModuleBroadcastListener:=TCheckModuleBoardcastListener.Create(Self);
  FCheckModuleBroadcastReceiver:=TJFMXBroadcastReceiver.JavaClass.init(FCheckModuleBroadcastListener);

  FCheckModuleIntentFilter:=TJIntentFilter.JavaClass.init;
  FCheckModuleIntentFilter.addAction(StringToJString('com.hifond.CARD_CHECK'));

  SharedActivity.registerReceiver(FCheckModuleBroadcastReceiver, FCheckModuleIntentFilter);

  {$ENDIF ANDROID}

  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.Create end');
end;

procedure TReadHospitalCardSDK.Init;
begin
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.Init begin');
//        HifondCardInterface.init(MainActivity.this,115200,"/dev/ttyMT1");
//  TJHifondCardInterface.JavaClass.init(TAndroidHelper.Activity,115200,StringToJString('dev/ttyMT1'));
  {$IFDEF ANDROID}
  TJHelper.JavaClass.initsdk(TAndroidHelper.Activity,115200,StringToJString('/dev/ttyHSL1'));
  {$ENDIF}
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.Init end');
end;

procedure TReadHospitalCardSDK.ReadCard(ACardType:String);
begin
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.ReadCard begin');
  {$IFDEF ANDROID}
  TJHifondCardInterface.JavaClass.openModule(StringToJString(ACardType));
  {$ENDIF}
//  {$IFDEF MSWINDOWS}
//  if Assigned(Self.FOnReadedCardData) then
//  begin
//    Self.FReadedCardData:=
//                        '{"cardName":"��*��",'
//                        +'"cardNo":"123456",'
//                        +'"cardType":"1",'
//                        +'"cardTypeZH":"�Ӵ���",'
//                        +'"districtCode":"320400",'
//                        +'"idCardNo":"3425************0029",'
//                        +'"resultCode":"00000",'
//                        +'"sex":"Ů",'
//                        +'"backup01":"base64",'
//                        +'"uid":"d6e52521"'
//                        +'}';
//    Self.FOnReadedCardData(Self);
//  end;
//  {$ENDIF}
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.ReadCard end');
end;

end.
