unit uSunmiPrinterHelper;

interface


uses
  System.Types, System.Classes, System.SysUtils, System.Generics.Collections, System.DateUtils, FMX.Platform,
  FMX.Platform.Android, FMX.Types, FMX.Consts, FMX.Helpers.Android, FMX.InAppPurchase, Androidapi.Consts,
  Androidapi.JNI.sunmi_printer_all,
  Androidapi.JNI.sunmi_helper,
  Androidapi.Helpers, Androidapi.NativeActivity, Androidapi.JNI, Androidapi.JNIBridge,  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.App, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.InAppBilling, Androidapi.JNI.Os,
  Androidapi.JNI.Java.Security, Androidapi.Log, System.Messaging, System.TypInfo, Androidapi.JNI.Embarcadero,
  Androidapi.AppGlue;


type
  TSunmiPrinterHelper=class;

  TJMyInnerPrinterCallbackEvent = class(TJavaLocal,JMyInnerPrinterCallbackEvent)
  public
    FSunmiPrinterHelper:TSunmiPrinterHelper;
    { methods }
    procedure onConnected(P1: JSunmiPrinterService); cdecl;
    procedure onDisconnected; cdecl;
  public
    constructor Create(ASunmiPrinterHelper:TSunmiPrinterHelper);
    { Property }
  end;



  TSunmiPrinterHelper = class
  private
  public
    FJSunmiPrinterService:JSunmiPrinterService;
    FJMyInnerPrinterCallbackEvent:JMyInnerPrinterCallbackEvent;
    FJMyInnerPrinterCallback:JMyInnerPrinterCallback;
  public
    function StartSetup():Boolean;
    procedure Stop;
  end;


implementation

{ TSunmiPrinterHelper }


function TSunmiPrinterHelper.StartSetup:Boolean;
begin
  FMX.Types.Log.d('OrangeUI TSunmiPrinterHelper.StartSetup Begin');

  Result:=False;

  //初始化
  //像绑定⼀个服务组件⼀样，这⾥通过单例调⽤绑定⽅法
  // InnerPrinterCallback innerPrinterCallback = new InnerPrinterCallback(){
  // @Override
  // protected void onConnected(SunmiPrinterService service){
  // //这⾥即获取到绑定服务成功连接后的远程服务接⼝句柄
  // //可以通过service调⽤⽀持的打印⽅法
  // }
  //
  // @Override
  // protected void onDisconnected() {
  // //当服务异常断开后，会回调此⽅法，建议在此做重连策略
  //
  // }
  // }
  //boolean result = InnerPrinterManager.getInstance().bindService(context,
  //innerPrinterCallback);
  if FJSunmiPrinterService=nil then
  begin
    FJMyInnerPrinterCallbackEvent:=TJMyInnerPrinterCallbackEvent.Create(Self);


    FJMyInnerPrinterCallback:=TJMyInnerPrinterCallback.Create;
    TJMyInnerPrinterCallback.JavaClass.setMyInnerPrinterCallbackEvent(FJMyInnerPrinterCallbackEvent);

    Result:=TJInnerPrinterManager.JavaClass.getInstance().bindService(SharedActivityContext,FJMyInnerPrinterCallback);
  end;

  FMX.Types.Log.d('OrangeUI TSunmiPrinterHelper.StartSetup End');

end;

procedure TSunmiPrinterHelper.Stop;
begin
  if FJSunmiPrinterService <> nil then
  begin
    TJInnerPrinterManager.JavaClass.getInstance().unBindService(SharedActivityContext,nil);
  end;

end;

{ TJMyInnerPrinterCallbackEvent }

constructor TJMyInnerPrinterCallbackEvent.Create(
  ASunmiPrinterHelper: TSunmiPrinterHelper);
begin
  Inherited Create;
  FSunmiPrinterHelper:=ASunmiPrinterHelper;
end;

procedure TJMyInnerPrinterCallbackEvent.onConnected(P1: JSunmiPrinterService);
begin
  FMX.Types.Log.d('OrangeUI TJMyInnerPrinterCallbackEvent.onConnected');
  FSunmiPrinterHelper.FJSunmiPrinterService:=P1;
end;

procedure TJMyInnerPrinterCallbackEvent.onDisconnected;
begin
  FMX.Types.Log.d('OrangeUI TJMyInnerPrinterCallbackEvent.onDisconnected');
  FSunmiPrinterHelper.FJSunmiPrinterService:=nil;

end;

end.
