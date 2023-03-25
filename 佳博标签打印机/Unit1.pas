// by 漠北
unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ScrollBox, FMX.Memo, FMX.ListBox,


  {$IFDEF ANDROID}
  FMX.Platform.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.Widget,


  Androidapi.JNI.Net,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  FMX.Helpers.Android,
  Androidapi.JNI.Os,
    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}
  {$ENDIF}

  Androidapi.JNI.SDKLib,

  FMX.Memo.Types;

type
  TJCallbackListener = class(TJavaLocal,JCallbackListener)
  ['{E32282EE-A9B6-451E-B20B-66D4640FEFFB}']
    { Property Methods }

    { methods }
    procedure onConnecting; cdecl; //()V
    procedure onCheckCommand; cdecl; //()V
    procedure onSuccess(P1: JPrinterDevices); cdecl; //(Lcom/gprinter/bean/PrinterDevices;)V
    procedure onReceive(P1: TJavaArray<Byte>); cdecl; //([B)V
    procedure onFailure; cdecl; //()V
    procedure onDisconnect; cdecl; //()V

    { Property }
  end;


  TForm1 = class(TForm)
    Button1: TButton;
    Btnconnect: TButton;
    ComboBox1: TComboBox;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnconnectClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    blueTooth:JPrinterDevices;
    FJCallbackListener:TJCallbackListener;
    portManager:JBluetoothPort;// = new BluetoothPort(devices);
//    portManager.openPort();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
//  BlueToothPrinter,
  QXMBlueTooth;

{$R *.fmx}

procedure TForm1.BtnconnectClick(Sender: TObject);
begin
  if ComboBox1.ItemIndex>=0 then
  begin
    //PrinterDevices blueTooth=new PrinterDevices.Build()
    //        .setContext(context)
    //        .setConnMethod(ConnMethod.BLUETOOTH)
    //        .setMacAddress(mac)
    //        .setCommand(Command.TSC)
    //        .setCallbackListener(this)
    //        .build();
    //printer.connect(blueTooth);
    FJCallbackListener:=TJCallbackListener.Create;
    blueTooth:=TJPrinterDevices_Build.Create
                .setContext(TAndroidHelper.Context)
                .setConnMethod(TJConnMethod.JavaClass.BLUETOOTH)
                .setMacAddress(StringToJString(ComboBox1.ListItems[ComboBox1.ItemIndex].Hint))
                .setCommand(TJCommand.JavaClass.TSC)
                .setCallbackListener(FJCallbackListener)
                .build();
    portManager:=TJBluetoothPort.JavaClass.init(blueTooth);// = new BluetoothPort(devices);
    if portManager.openPort() then
    begin
      showmessage('连接成功')
    end
    else
    begin
      showmessage('连接失败')
    end;
  end;


//  if ConnectDevice(ComboBox1.ListItems[ComboBox1.ItemIndex].Hint) then showmessage('连接成功') else showmessage('连接失败');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  tsc:JLabelCommand;
begin
//  PrintText(memo1.text);
//  FeedPaper;

        tsc := TJLabelCommand.Create;
        // 设置标签尺寸宽高，按照实际尺寸设置 单位mm
        tsc.addUserCommand(StringToJString(#13#10));
        tsc.addSize(58, 70);
        // 设置标签间隙，按照实际尺寸设置，如果为无间隙纸则设置为0 单位mm
        tsc.addGap(0);
        //设置纸张类型为黑标，发送BLINE 指令不能同时发送GAP指令
//        tsc.addBline(2);
        // 设置打印方向
        tsc.addDirection(TJLabelCommand_DIRECTION.JavaClass.FORWARD, TJLabelCommand_MIRROR.JavaClass.NORMAL);
        // 设置原点坐标
        tsc.addReference(0, 0);
        //设置浓度
        tsc.addDensity(TJLabelCommand_DENSITY.JavaClass.DNESITY4);
        // 撕纸模式开启
        tsc.addTear(TJLabelCommand_RESPONSE_MODE.JavaClass.ON);
        // 清除打印缓冲区
        tsc.addCls();
        // 绘制简体中文
        tsc.addText(30, 20, TJLabelCommand_FONTTYPE.JavaClass.SIMPLIFIED_24_CHINESE, TJLabelCommand_ROTATION.JavaClass.ROTATION_0, TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,
                StringToJString('欢迎使用Printer'));
        //打印繁体
        tsc.addUnicodeText(30,50, TJLabelCommand_FONTTYPE.JavaClass.TRADITIONAL_CHINESE, TJLabelCommand_ROTATION.JavaClass.ROTATION_0, TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('BIG5碼繁體中文'),StringToJString('BIG5'));
        //打印韩文
        tsc.addUnicodeText(30,80, TJLabelCommand_FONTTYPE.JavaClass.KOREAN, TJLabelCommand_ROTATION.JavaClass.ROTATION_0, TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('Korean 지아보 하성'),StringToJString('EUC_KR'));
        //英数字
        tsc.addText(240,20, TJLabelCommand_FONTTYPE.JavaClass.FONT_1, TJLabelCommand_ROTATION.JavaClass.ROTATION_0,TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('1'));
        tsc.addText(250,20, TJLabelCommand_FONTTYPE.JavaClass.FONT_2, TJLabelCommand_ROTATION.JavaClass.ROTATION_0,TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('2'));
        tsc.addText(270,20, TJLabelCommand_FONTTYPE.JavaClass.FONT_3, TJLabelCommand_ROTATION.JavaClass.ROTATION_0,TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('3'));
        tsc.addText(300,20, TJLabelCommand_FONTTYPE.JavaClass.FONT_4, TJLabelCommand_ROTATION.JavaClass.ROTATION_0,TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('4'));
        tsc.addText(330,20, TJLabelCommand_FONTTYPE.JavaClass.FONT_5, TJLabelCommand_ROTATION.JavaClass.ROTATION_0,TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('5'));
        tsc.addText(240,40, TJLabelCommand_FONTTYPE.JavaClass.FONT_6, TJLabelCommand_ROTATION.JavaClass.ROTATION_0,TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('6'));
        tsc.addText(250,40, TJLabelCommand_FONTTYPE.JavaClass.FONT_7, TJLabelCommand_ROTATION.JavaClass.ROTATION_0,TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('7'));
        tsc.addText(270,40, TJLabelCommand_FONTTYPE.JavaClass.FONT_8, TJLabelCommand_ROTATION.JavaClass.ROTATION_0,TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('8'));
        tsc.addText(300,60, TJLabelCommand_FONTTYPE.JavaClass.FONT_9, TJLabelCommand_ROTATION.JavaClass.ROTATION_0,TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('9'));
        tsc.addText(330,80, TJLabelCommand_FONTTYPE.JavaClass.FONT_10, TJLabelCommand_ROTATION.JavaClass.ROTATION_0,TJLabelCommand_FONTMUL.JavaClass.MUL_1, TJLabelCommand_FONTMUL.JavaClass.MUL_1,StringToJString('10'));
        //绘制二维码
        tsc.addQRCode(30,250, TJLabelCommand_EEC.JavaClass.LEVEL_L, 5, TJLabelCommand_ROTATION.JavaClass.ROTATION_0, StringToJString(' www.smarnet.cc'));
        // 绘制一维条码
        tsc.add1DBarcode(30, 380, TJLabelCommand_BARCODETYPE.JavaClass.CODE128, 80, TJLabelCommand_READABEL.JavaClass.EANBEL, TJLabelCommand_ROTATION.JavaClass.ROTATION_0, StringToJString('12345678'));
        // 打印标签
        tsc.addPrint(1, 1);
        // 打印标签后 蜂鸣器响
        tsc.addSound(2, 100);
//        //开启钱箱
//        tsc.addCashdrwer(TJLabelCommand_FOOT.JavaClass.F5, 255, 255);
//        Vector<Byte> datas = tsc.getCommand();
//        // 发送数据
//        return datas;


  portManager.writeDataImmediately(tsc.getCommand());
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//  PrintQRBarCode(edit2.Text);
//  FeedPaper;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  aStrs:Tstringlist;
  i:integer;
begin
  try
    ComboBox1.Items:=GetDeviceNameList;
    aStrs:=GetDeviceAddressList;
    for i := 0 to aStrs.Count-1 do begin
      if i<ComboBox1.Count then
      ComboBox1.ListItems[i].Hint:=astrs[i];
    end;
  finally
    aStrs.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  BluetoothIni;

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  DisConnectDevice;
end;

{ TJCallbackListener }

procedure TJCallbackListener.onCheckCommand;
begin

end;

procedure TJCallbackListener.onConnecting;
begin

end;

procedure TJCallbackListener.onDisconnect;
begin

end;

procedure TJCallbackListener.onFailure;
begin

end;

procedure TJCallbackListener.onReceive(P1: TJavaArray<Byte>);
begin

end;

procedure TJCallbackListener.onSuccess(P1: JPrinterDevices);
begin

end;

end.
