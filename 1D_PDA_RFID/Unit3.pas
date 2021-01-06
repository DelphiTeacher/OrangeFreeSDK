unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,


  {$IFDEF ANDROID}
  Androidapi.JNI.Net,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  FMX.Helpers.Android,
  Androidapi.JNI.Os,
    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}
//    uAndroidPermission_D10_2,
  {$ENDIF}

//  Androidapi.JNI.RFID_1DScanner,
  Androidapi.JNI.xdl2d_RFID,
  Androidapi.JNI.Serialport_module,
  Androidapi.JNI.my1drfidhelper_debug_aar,


  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type

  TJMyRXObserverEvent = class(TJavaLocal,JMyRXObserverEvent)
  public
    { methods }
    procedure onInventoryTag(P1: JRXInventoryTag); cdecl;
    { Property }
  end;

  TJMyRXCallback=class(TJavaLocal,JRXCallback)
  public
//    procedure update(o: Jutil_Observable; arg: JObject); cdecl;
    procedure callback(P1: TJavaArray<Byte>); cdecl;
  end;



  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    rfid_connector:JReaderConnector;

    mReaderHelper:JRFIDReaderHelper;
    FJMyRXObserver:JMyRXObserver;
    FJMyRXObserverEvent:JMyRXObserverEvent;

  public
    scanner_connector:JTDScannerConnector;
    mScanner:JTDScannerHelper;
    TDScannerObserver:JRXCallback;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin

  ////Power on the UHF,must set the UHF can work.
  //ModuleManager.newInstance().setUHFStatus(true);
  ////Must set the flag that the UHF is running,as it will effect 1D scanner when UHF is running.
  //mScanner.setRunFlag(true);
  ////Power off the 1D Scanner,the 1D scanner will not work.
  //ModuleManager.newInstance().setScanStatus(false);
  //mCheckBoxTDScanner.setChecked(false);

  TJModuleManager.JavaClass.newInstance().setUHFStatus(true);//模块上电

  mScanner.setRunFlag(true);
  TJModuleManager.JavaClass.newInstance().setScanStatus(false);

end;

procedure TForm3.Button2Click(Sender: TObject);
begin

  mReaderHelper.realTimeInventory($FF,$01);
end;

procedure TForm3.Button4Click(Sender: TObject);
begin

  ////Power off the UHF,the UHF will not work.
  //ModuleManager.newInstance().setUHFStatus(false);
  ////Power on the 1D Scanner,must set the UHF can work.
  //ModuleManager.newInstance().setScanStatus(true);
  ////Must set the flag that the UHF is running,as it will effect 1D scanner when UHF is running.
  ////so you should set like this when the UHF no Running.
  //mScanner.setRunFlag(false);
  //mCheckBoxRFID.setChecked(false);

  TJModuleManager.JavaClass.newInstance().setUHFStatus(false);


  TJModuleManager.JavaClass.newInstance().setScanStatus(true);//模块上电
  mScanner.setRunFlag(false);


end;

procedure TForm3.Button5Click(Sender: TObject);
begin
//        if (mReader != null) {
//            mReader.unRegisterObserver(rxObserver);
//        }
          if mReaderHelper<>nil then
          begin
            mReaderHelper.unRegisterObserver(TJObserver.Wrap((FJMyRXObserver as ILocalObject).GetObjectID));
          end;




//        if (mScanner != null) {
//            mScanner.unRegisterObserver(TDScanner);
//        }
//
          if mScanner<>nil then
          begin
//            mScanner.unRegisterObserver(TDScannerObserver);
          end;





//        if (rfid_connector != null) {
//            rfid_connector.disConnect();
//        }
//
          if rfid_connector<>nil then
          begin
            rfid_connector.disConnect;
          end;






//        if (mConnector != null) {
//            mConnector.disConnect();
//        }
          if scanner_connector<>nil then
          begin
            scanner_connector.disConnect;
          end;





        TJModuleManager.JavaClass.newInstance().setScanStatus(false);
        TJModuleManager.JavaClass.newInstance().setUHFStatus(false);
        TJModuleManager.JavaClass.newInstance().release();

end;

procedure TForm3.FormCreate(Sender: TObject);
begin

  rfid_connector:=TJReaderConnector.Create;//构建连接器

  scanner_connector:=TJTDScannerConnector.Create;


  if mReaderHelper=nil then
  begin

      //2.对模块上电之后下一步就是要连接读写器以实现与读写器的通信，打开连接之后台会启动一个线程监听读写器返回数据
      //示例代码：
      //ModuleConnector rfid_connector = new ReaderConnector();//构建连接器
      //rfid_connector.connectCom("dev/ttyS4",115200);//连接指定串口，返回true表示成功，false失败

      //if (connector.connectCom("dev/ttyS4",115200)) {
      //    //ModuleManager.newInstance().setUHFStatus(true);
      //    try {
      //        mReader = RFIDReaderHelper.getDefaultHelper();
      //        mReader.registerObserver(rxObserver);
      //    } catch (Exception e) {
      //        e.printStackTrace();
      //    }
      //}

      if rfid_connector.connectCom(StringToJString('dev/ttyS4'),115200) then
      begin
        //连接成功
        //ShowMessage('连接成功');
      end
      else
      begin
        //连接失败
        //ShowMessage('连接失败');
      end;



      //3.获取RFIDReaderHelper对象，该对象是与RFID模块交互的核心类，可以发送指令到读写器还可以通过注册观察者RXObserver对象监听读写器返回数据
      //示例代码：
      //RFIDReaderHelper mReaderHelper = RFIDReaderHelper.getDefaultHelper();//获取RFIDReaderHelper对象
      //mReaderHelper.realTimeInventory((byte) 0xFF,(byte)0x01);//发送实时盘存指令，更多指令参考API文档
      mReaderHelper:=TJRFIDReaderHelper.JavaClass.getDefaultHelper;

      FJMyRXObserver:=TJMyRXObserver.Create;
      FJMyRXObserverEvent:=TJMyRXObserverEvent.Create;
      TJMyRXObserver.JavaClass.setMyRXObserverEvent(FJMyRXObserverEvent);
      mReaderHelper.registerObserver(TJObserver.Wrap((FJMyRXObserver as ILocalObject).GetObjectID));



  end;






  if (mScanner=nil) then
  begin

      //if (mConnector.connectCom("dev/ttyS1",9600))
      //{
      //    mScanner = TDScannerHelper.getDefaultHelper();
      //    mScanner.registerObserver(TDScanner);
      //}

//      if scanner_connector.connectCom(StringToJString('dev/ttyS1'),9600) then
      if scanner_connector.connectCom(StringToJString('dev/ttyS1'),9600) then
      begin
        //连接成功
        //ShowMessage('连接成功');
      end
      else
      begin
        //连接失败
        //ShowMessage('连接失败');
      end;





      //    mScanner = TDScannerHelper.getDefaultHelper();
      //    mScanner.registerObserver(TDScanner);
      mScanner:=TJTDScannerHelper.JavaClass.getDefaultHelper;


      TDScannerObserver:=TJMyRXCallback.Create;
      mScanner.regist2DCodeData(TDScannerObserver);
  end;




end;

{ TJMyRXObserverEvent }

procedure TJMyRXObserverEvent.onInventoryTag(P1: JRXInventoryTag);
begin

  FMX.Types.Log.d('OrangeUI TJMyRXObserverEvent.onInventoryTag');


//    RXObserver rxObserver = new RXObserver() {
//        @Override
//        protected void onInventoryTag(RXInventoryTag tag) {
//            //run in child thread
//            Log.d("TAG",tag.strEPC);
//        }
//    };


  TThread.Synchronize(nil,procedure
  begin
    Form3.Memo1.Lines.Add('扫描到了');
  end);

end;

{ TJMyRXCallback }

procedure TJMyRXCallback.callback(P1: TJavaArray<Byte>);
var
  AJCode:JString;
begin
  //RXCallback callback = new RXCallback() {
  //   public void callback(byte[] bytes) {
  //        Log.d("2D","get 2D");
  //        Message message = Message.obtain();
  //        message.obj = "2D : " + new String(bytes);
  //        mHandler.sendMessage(message);
  //    }
  //};

  AJCode:=TJString.JavaClass.init(P1);

  TThread.Synchronize(nil,procedure
  begin
    Form3.Memo1.Lines.Add('扫描到了'
                          +JStringToString(AJCode)
                          );
  end);


end;

//procedure TJMyRXCallback.update(o: Jutil_Observable; arg: JObject);
//begin
//
//  FMX.Types.Log.d('OrangeUI TJMyRXCallback.update');
//
//
////    Observer TDScanner = new Observer() {
////        @Override
////        public void update(Observable o, Object arg) {
////            //run in child thread
////            if (arg instanceof String){
////                //receive scanned bar code data.
////                Log.d("TAG", (String) arg);
////            }
////        }
////    };
//
//
//
////  TThread.Synchronize(nil,procedure
////  begin
////    Form3.Memo1.Lines.Add('扫描到了'
////                          +JStringToString(TJString.Wrap((arg as ILocalObject).GetObjectID))
////                          );
////  end);
//
//
//end;

end.
