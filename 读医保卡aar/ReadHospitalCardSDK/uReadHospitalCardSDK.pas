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
  //PDA扫码广播初始监听
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

    //读到的卡数据
    FReadedCardData:String;
    FOnReadedCardData:TNotifyEvent;
    constructor Create;
    //初始,打开设备
    procedure Init;
    //检查模块
    procedure CheckModule;
    //读卡 type  卡类型 A-接触，B-非接 C-磁条，D-扫码，E-身份证
    procedure ReadCard(ACardType:String);
    //关闭所有读卡
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
//    // key 验证失败，相应处理
//    FMX.Types.Log.d('OrangeUI TReadCardBoardcastListener.onReceive key 验证失败');
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

//####读卡返回结果
//以广播的形式
//Action:com.hifond.CARD_DATA
//StringExtra:cardData
//结果返回说明  json
{"cardName":"吴*玲",  //姓名
"cardNo":"123456",   //卡号
"cardType":"1",    //1-接触式芯片卡, 2-非接触式芯片卡, 3-磁条卡, 4-条形码, 5-身份证
"cardTypeZH":"接触卡",
"districtCode":"320400", //社保卡的地区代码
"idCardNo":"3425************0029",  //证件身份证号码
"resultCode":"00000",  //"00000"-读卡成功，"99999"-读卡失败
"sex":"女",     //性别
"backup01":"base64",  //身份证头像bitmap的base64编码数据
"uid":"d6e52521"    //M1卡的卡标识号（default）
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
//    // key 验证失败，相应处理
//    FMX.Types.Log.d('OrangeUI TCheckModuleBoardcastListener.onReceive key 验证失败');
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
  //关闭所有模块
  TJHifondCardInterface.JavaClass.closeModule();
  {$ENDIF}
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.CloseModule end');
end;

constructor TReadHospitalCardSDK.Create;
begin
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.Create begin');


  {$IFDEF ANDROID}
  //读卡
  FReadCardBroadcastListener:=TReadCardBoardcastListener.Create(Self);
  FReadCardBroadcastReceiver:=TJFMXBroadcastReceiver.JavaClass.init(FReadCardBroadcastListener);

  FReadCardIntentFilter:=TJIntentFilter.JavaClass.init;
  //com.hifond.CARD_DATA                         //com.hifond.CARD_DATA
  FReadCardIntentFilter.addAction(StringToJString('com.hifond.CARD_DATA'));

  SharedActivity.registerReceiver(FReadCardBroadcastReceiver, FReadCardIntentFilter);


  //检测模块
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
//                        '{"cardName":"吴*玲",'
//                        +'"cardNo":"123456",'
//                        +'"cardType":"1",'
//                        +'"cardTypeZH":"接触卡",'
//                        +'"districtCode":"320400",'
//                        +'"idCardNo":"3425************0029",'
//                        +'"resultCode":"00000",'
//                        +'"sex":"女",'
//                        +'"backup01":"base64",'
//                        +'"uid":"d6e52521"'
//                        +'}';
//    Self.FOnReadedCardData(Self);
//  end;
//  {$ENDIF}
  FMX.Types.Log.d('OrangeUI TReadHospitalCardSDK.ReadCard end');
end;

end.
