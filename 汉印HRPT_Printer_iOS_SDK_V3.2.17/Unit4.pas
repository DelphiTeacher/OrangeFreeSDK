unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  {$IFDEF IOS}
	iOSapi.Foundation,
	MacApi.ObjectiveC,
  Macapi.ObjCRuntime,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
  iOSapi.UIKit,
  Macapi.Helpers,
  FMX.Platform.iOS,

  iOSApi.PTPrinter,
  iOSApi.PTDispatcher,
  iOSApi.PTEnumList,
  iOSApi.PTCommandESC,
  iOSApi.PTEncode,

  iOSApi.PTCommandCPCL,
  {$ENDIF}

  System.Generics.Collections,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.ListBox;

type
  TBLEPrinter=class
    FPTPinter:PTPrinter;
  end;


  TForm4 = class(TForm)
    btnBLEState: TButton;
    btnInit: TButton;
    btnConnectByIP: TButton;
    edtIP: TEdit;
    Label1: TLabel;
    btnPrint: TButton;
    Label2: TLabel;
    edtPort: TEdit;
    btnScanBLE: TButton;
    btnStopScanBLE: TButton;
    ListBox1: TListBox;
    btnConnectBLEPrinter: TButton;
    Button1: TButton;
    procedure btnBLEStateClick(Sender: TObject);
    procedure btnInitClick(Sender: TObject);
    procedure btnConnectByIPClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnScanBLEClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConnectBLEPrinterClick(Sender: TObject);
    procedure btnStopScanBLEClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FPinter:PTPrinter;
    FPTDispatcher:PTDispatcher;
    cmd:PTCommandESC;
    FBLEPrinterList:TObjectList<TBLEPrinter>;
	  procedure PTBluetoothConnectSuccEmptyParameterBlockEvent();
	  procedure PTBluetoothConnectFailBlockEvent(error:PTConnectError);
	  procedure PTBluetoothFindPrinterMutableArrayBlockEvent(printerArray:NSMutableArray{PTPrinter*});
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.btnBLEStateClick(Sender: TObject);
var
  AState:PTBluetoothState;
begin
//	PTBluetoothState_=(
//	//(NSInteger, PTBluetoothState) {
//	    PTBluetoothStateUnauthorized  = 0, ///< \~chinese 未授权，请前往系统设置授权 \~english unauthorized
//	    PTBluetoothStatePoweredOff  = 1, ///< \~chinese 蓝牙未开 \~english Bluetooth off
//	    PTBluetoothStatePoweredOn  = 2//, ///< \~chinese 正常 \~english Bluetooth on
//	);
//	PTBluetoothState=Integer;

  AState:=FPTDispatcher.getBluetoothStatus();
  case AState of
    0:
    begin
      ShowMessage('未授权，请前往系统设置授权');
    end;
    1:
    begin
      ShowMessage('蓝牙未开');
    end;
    2:
    begin
      ShowMessage('蓝牙未开');
    end;
  end;
end;

procedure TForm4.PTBluetoothConnectFailBlockEvent(error: PTConnectError);
var
  AErrorStr:String;
  APTConnectError_:PTConnectError_;
begin
  FMX.Types.Log.d('OrangeUI TForm4.PTBluetoothConnectFailBlockEvent error：'+IntToStr(error));

//	PTConnectError_=(
//	//(NSInteger, PTConnectError) {
//	    PTConnectErrorBleTimeout                  = 0, ///< \~chinese 蓝牙连接超时 \~english Bluetooth connection timed out
//	    PTConnectErrorBleDisvocerServiceTimeout   = 1, ///< \~chinese 获取服务超时 \~english Get service timed out
//	    PTConnectErrorBleValidateTimeout          = 2, ///< \~chinese 验证超时 \~english Print Verification timed out
//	    PTConnectErrorBleUnknownDevice            = 3, ///< \~chinese 未知设备 \~english Unknown device
//	    PTConnectErrorBleSystem                   = 4, ///< \~chinese 系统错误 \~english System error
//	    PTConnectErrorBleValidateFail             = 5, ///< \~chinese 验证失败 \~english Verification failed
//	    PTConnectErrorStreamTimeout               = 6, ///< \~chinese 流打开超时 \~english Stream open timeout
//	    PTConnectErrorStreamEmpty                 = 7, ///< \~chinese 打开的是空流 \~english Empty stream
//	    PTConnectErrorStreamOccured               = 8  ///< \~chinese 流发生错误 \~english An error has occurred on the stream
//	);
//	PTConnectError=Integer;
  APTConnectError_:=PTConnectError_(error);
  case APTConnectError_ of
    PTConnectErrorBleTimeout: AErrorStr:='蓝牙连接超时';
    PTConnectErrorBleDisvocerServiceTimeout: AErrorStr:='获取服务超时';
    PTConnectErrorBleValidateTimeout: AErrorStr:='验证超时';
    PTConnectErrorBleUnknownDevice: AErrorStr:='未知设备';
    PTConnectErrorBleSystem: AErrorStr:='系统错误';
    PTConnectErrorBleValidateFail: AErrorStr:='验证失败';
    PTConnectErrorStreamTimeout: AErrorStr:='流打开超时';
    PTConnectErrorStreamEmpty: AErrorStr:='打开的是空流';
    PTConnectErrorStreamOccured: AErrorStr:='流发生错误';
    else
    begin
      AErrorStr:='未知原因';
    end;
  end;

  TThread.Synchronize(nil,procedure
  begin
    ShowMessage('连接失败 '+AErrorStr);
  end);
end;

procedure TForm4.PTBluetoothConnectSuccEmptyParameterBlockEvent;
begin
  FMX.Types.Log.d('OrangeUI TForm4.PTBluetoothConnectSuccEmptyParameterBlockEvent');
  TThread.Synchronize(nil,procedure
  begin
    ShowMessage('连接成功');
  end);
end;

procedure TForm4.PTBluetoothFindPrinterMutableArrayBlockEvent(
  printerArray: NSMutableArray);
var
  I: Integer;
  APTPrinter:PTPrinter;
  ABLEPrinter:TBLEPrinter;
  AListBoxItem:TListBoxItem;
begin
  FMX.Types.Log.d('OrangeUI TForm4.PTBluetoothFindPrinterMutableArrayBlockEvent');

  Self.FBLEPrinterList.Clear;

  for I := 0 to printerArray.count-1 do
  begin
    APTPrinter:=TPTPrinter.Wrap(printerArray.objectAtIndex(I));
    ABLEPrinter:=TBLEPrinter.Create;
    ABLEPrinter.FPTPinter:=APTPrinter;
    FBLEPrinterList.Add(ABLEPrinter);

    //添加列表项
    AListBoxItem:=TListBoxItem.Create(Self.ListBox1);
    AListBoxItem.Data:=ABLEPrinter;
    AListBoxItem.Parent:=Self.ListBox1;
    AListBoxItem.Text:=NSStrToStr(APTPrinter.name);
  end;
end;

procedure TForm4.btnConnectBLEPrinterClick(Sender: TObject);
begin
  //连接蓝牙打印机
  if Self.ListBox1.Selected=nil then
  begin
    ShowMessage('请选择打印机');
    Exit;
  end;
  FPinter:=TBLEPrinter(Self.ListBox1.Selected.Data).FPTPinter;

  FPTDispatcher.connectPrinter(FPinter);
  //设置连接失败的事件
  FPTDispatcher.whenConnectFailureWithErrorBlock(PTBluetoothConnectFailBlockEvent);
  //设置连接成功的事件
  FPTDispatcher.whenConnectSuccess(PTBluetoothConnectSuccEmptyParameterBlockEvent);

end;

procedure TForm4.btnConnectByIPClick(Sender: TObject);
begin
//  FMX.Types.log

  //通过IP连接打印机
  FPinter:=TPTPrinter.Create;
  FPinter.setIp(StrToNSStr(Self.edtIP.Text));
  FPinter.setModule(Ord(PTPrinterModuleWiFi));
  FPinter.SetPort(StrToNSStr(Self.edtPort.Text));

//  FPTDispatcher.connectPrinter(FPinter);
  FPTDispatcher.connectPrinter(FPinter);
  //设置连接失败的事件
  FPTDispatcher.whenConnectFailureWithErrorBlock(PTBluetoothConnectFailBlockEvent);
  //设置连接成功的事件
  FPTDispatcher.whenConnectSuccess(PTBluetoothConnectSuccEmptyParameterBlockEvent);
end;

procedure TForm4.btnInitClick(Sender: TObject);
begin
  FPTDispatcher:=TPTDispatcher.OCClass.share;
end;

procedure TForm4.btnPrintClick(Sender: TObject);
var
  sendData:NSData;
  strData:NSData;
begin
  cmd:=TPTCommandESC.Create;
  cmd.initializePrinter;
  cmd.setJustification(0);
  cmd.setLineSpacing(10);
  //最开始调用这个接口，目的修复打印乱码问题
  cmd.appendZeroData;
//  cmd.appendText(NSStr('测试'));
//  cmd.printAndReturnStandardMode;

  //cmd.appendTextmode(StrToNSStr('测试'),Ord(ESCTextNormal));
  strData:=TPTEncode.OCClass.encodeDataWithString(StrToNSStr('测试'));
  cmd.appendCommandData(strData);

  sendData:=cmd.getCommandData;
  FPTDispatcher.sendData(sendData);
end;

procedure TForm4.btnScanBLEClick(Sender: TObject);
begin
  //扫描蓝牙
  FPTDispatcher.scanBluetooth;
  FPTDispatcher.whenFindAllBluetooth(PTBluetoothFindPrinterMutableArrayBlockEvent);
end;

procedure TForm4.btnStopScanBLEClick(Sender: TObject);
begin
  FPTDispatcher.stopScanBluetooth;
end;

procedure TForm4.Button1Click(Sender: TObject);
var
  cmd:PTCommandCPCL;
begin
  //
//
//    PTCommandCPCL *cmd = [[PTCommandCPCL alloc] init];
//    /// 这条是必需要调用的，表示打印多长
//    [cmd cpclLabelWithOffset:0 hRes:PTCPCLLabelResolution200 vRes:PTCPCLLabelResolution200 height:1100 quantity:1];
//    /// 设置打印宽度
//    [cmd cpclPageWidth:576];
//
//    /// 这边打印正确的话表示能支持该字体 需要放大字体的话调用放大字体的接口
//    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont1 fontSize:PTCPCLTextFontSize0 x:20 y:50 text:@"保护环境24x24，world9x17"];
//    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont2 fontSize:PTCPCLTextFontSize0 x:20 y:150 text:@"保护环境24x24，world12x24"];
//    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont3 fontSize:PTCPCLTextFontSize0 x:20 y:250 text:@"保护环境20x20，world10x20"];
//    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont4 fontSize:PTCPCLTextFontSize0 x:20 y:350 text:@"保护环境32x32，world16x32"];
//    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont5 fontSize:PTCPCLTextFontSize0 x:20 y:450 text:@"保护环境24x24，world12x24"];
//    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont7 fontSize:PTCPCLTextFontSize0 x:20 y:550 text:@"保护环境24x24，world12x24"];
//    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont8 fontSize:PTCPCLTextFontSize0 x:20 y:650 text:@"保护环境24x24，world2x24"];
//    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont20 fontSize:PTCPCLTextFontSize0 x:20 y:750 text:@"保护环境16x16，world8x16"];
//    [cmd cpclTextWithRotate:PTCPCLStyleRotation0 font:PTCPCLTextFont55 fontSize:PTCPCLTextFontSize0 x:20 y:850 text:@"保护环境16x16，world8x16"];
//
//    /// 若是标签纸，加上这条指令可以定位到缝标
//    [cmd cpclForm];
//    /// 打印
//    [cmd cpclPrint];
//
//    [[PTDispatcher share] sendData:cmd.cmdData];
  cmd:=TPTCommandCPCL.Create;
  cmd.cpclLabelWithOffsethResvResheightquantity(0,
                                                Ord(PTCPCLLabelResolution200),
                                                Ord(PTCPCLLabelResolution200),
                                                1100,
                                                1);
  cmd.cpclPageWidth(576);
  cmd.cpclSetCharacterCodePage(StrToNSStr('UnicodeBigUnmarked'));
  cmd.cpclTextWithRotatefontfontSizexytext(Ord(PTCPCLStyleRotation0),
                                            Ord(PTCPCLTextFont1),
                                            Ord(PTCPCLTextFontSize0),
                                            20,50,
                                            StrToNSStr('保护环境24x24，world9x17')
                                            );
  cmd.cpclForm;
  cmd.cpclPrint;
  FPTDispatcher.sendData(cmd.cmdData);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FBLEPrinterList:=TObjectList<TBLEPrinter>.Create;

end;

end.
