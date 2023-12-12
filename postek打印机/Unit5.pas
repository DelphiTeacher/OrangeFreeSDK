unit Unit5;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Math,

  {$IFDEF IOS}
	iOSapi.Foundation,
	MacApi.ObjectiveC,
  Macapi.ObjCRuntime,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
  iOSapi.UIKit,
  Macapi.Helpers,
  FMX.Platform.iOS,
  {$ENDIF}

  iOSApi.PTKPrintSDK,

  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type

	TSocketLinkerDelegate=class(TOCLocal,SocketLinkerDelegate)
	public
		////连接成功
		//- (void)socketDidConnectToHost:(NSString *)host port:(uint16_t)port;
		[MethodName('socketDidConnectToHost:port:')]
		procedure socketDidConnectToHostport(host:NSString;port:uint16_t);cdecl;


		////连接失败的代理,外界操作处理,比如停止发送心跳包,申请重连
		//- (void)socketDidDisconnectWithError:(NSError *)error;
		procedure socketDidDisconnectWithError(error:NSError);cdecl;


		////读取Socket数据
		//- (void)socketDidResponse:(NSData *)data;
		procedure socketDidResponse(data:NSData);cdecl;


	end;


  TForm5 = class(TForm)
    btnConnect: TButton;
    edtIP: TEdit;
    Label1: TLabel;
    edtPort: TEdit;
    Label2: TLabel;
    Memo1: TMemo;
    btnPrintTest: TButton;
    btnPrint: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure btnPrintTestClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    _delegate:SocketLinkerDelegate;
    _ptkSDk:PTKPrintSDK;// = [PTKPrintSDK sharedPTKPrintInstance];
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.btnConnectClick(Sender: TObject);
begin
  //C:\OrangeFreeSDK\postek打印机\PostekSDK\IOS_2_7



  if _ptkSDk.PTKConnectandPort(StrToNSStr(Self.edtIP.Text),StrToInt(Self.edtPort.Text))=PTK_SUCCESS then
  begin
    Self.Memo1.Lines.Add('打印机连接成功');
  end
  else
  begin
    Self.Memo1.Lines.Add('打印机连接失败');
  end;



//    NSLog(@"IP:%@ PORT:%d\r\n", _editIP.text, [_editPort.text intValue]);
//
//    [_ptkSDk PTKConnect:_editIP.text  andPort:[_editPort.text intValue]];
//
//    if([_ptkSDk PTKConnect:_editIP.text  andPort:[_editPort.text intValue]]==PTK_SUCCESS){
//        _label0.text = [NSString stringWithFormat:@"打印机连接成功IP:%@ PORT:%@",_editIP.text, _editPort.text];
//        //NSLog(@"连接成功");
//    }else{
//
//    }
//
//
//    int64_t delayInSeconds = 1.0;      // 延迟的时间
//    /*
//     *@parameter 1,时间参照，从此刻开始计时
//     *@parameter 2,延时多久，此处为秒级，还有纳秒等。10ull * NSEC_PER_MSEC
//     */
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        // do something
//            if ([_ptkSDk isConnect]) {
//                _label0.text = [NSString stringWithFormat:@"打印机连接成功IP:%@ PORT:%@",_editIP.text, _editPort.text];
//
//                NSLog(@"连接成功");
//            }else{
//                _label0.text = [NSString stringWithFormat:@"打印机连接失败IP:%@ PORT:%@",_editIP.text, _editPort.text];
//                 NSLog(@"连接失败");
//            }
//    });



end;

{ TSocketLinkerDelegate }

procedure  TSocketLinkerDelegate.socketDidConnectToHostport(host:NSString;port:uint16_t);
begin
	FMX.Types.Log.d('OrangeUI TSocketLinkerDelegate.socketDidConnectToHostport');
  TThread.Synchronize(nil,procedure
  begin
    Form5.Memo1.Lines.Add('打印机连接成功');
  end);

end;

procedure  TSocketLinkerDelegate.socketDidDisconnectWithError(error:NSError);
begin
	FMX.Types.Log.d('OrangeUI TSocketLinkerDelegate.socketDidDisconnectWithError');
  TThread.Synchronize(nil,procedure
  begin
    Form5.Memo1.Lines.Add('打印机连接失败');
  end);

end;

procedure  TSocketLinkerDelegate.socketDidResponse(data:NSData);
begin
	FMX.Types.Log.d('OrangeUI TSocketLinkerDelegate.socketDidResponse');
  TThread.Synchronize(nil,procedure
  begin

  end);

end;



function mm2inch( mm:double) :double;
begin
    result:= mm / 25.4;
end;

///**
// * 单位转换，将英寸转换为dot
// *
// * @param x
// *            英寸单位
// * @return dot单位
// */
function InchToDots(x:double):Integer;
begin
    result:= Ceil(x * 200);
end;

function setPageLengthEX(_ptkSDk:PTKPrintSDK;nHeight:double):Boolean;
var
  state:Integer;
begin
   _ptkSDK.PTKClearBuffer;
    // myPSK.PTKReset();
    // 对len进行判断，判断是否在合理区间内
//    if (nHeight <= 0.005 || nHeight >= 22) {
//        return false;
//    }
//    state := [_ptkSDK PTKSetLabelHeight:CONTINUOUS_MODE andHeight:[self InchToDots:nHeight] andGapH:0 andGap:0];
    state:=_ptkSDK.PTKSetLabelHeightandHeightandGapHandGap(Ord(CONTINUOUS_MODE),InchToDots(nHeight),0,0);
//    [_ptkSDK PTKSetLabelWidth:900];// 900dot
    _ptkSDK.PTKSetLabelWidth(900);
    if (state = 1) then
    begin
        result:=true;
    end
    else
    begin
        result:=false;
    end;
end;



procedure TForm5.btnPrintClick(Sender: TObject);
begin
  //
//    NSLog(@"打印\r\n");

///*    [_ptkSDk PTKClearBuffer];
//    [_ptkSDk PTKDrawText:20 andPy:20 andDirec:0 andFont:'6' andHorizontal:3 andVertical:3 andText:'N' andStr:@"繁华如三千东流水"];
//    [_ptkSDk PTKPrintLabel:1 andCPNum:1];*/
//    [self printShoppingOrderList:nil];
//    [_ptkTestUtil setPageLength:mm2inch(136)];end;

  _ptkSDk.PTKClearBuffer;
  _ptkSDk.PTKDrawTextandPyandDirecandFontandHorizontalandVerticalandTextandStr(
        //nPx：设置 X 坐标,以点(dots)为单位
        20,
        //nPy：设置 Y 坐标,以点(dots)为单位。
        20,
        //nDirec：选择打印方向. 0—不旋转；1—旋转 90°；2—旋转 180°；3—旋转 270°。
        0,
        //nFont：选择内置字体或 TrueType 字体。1—5：为打印机内部字体；6 为打印机内置 24*24简体汉字；A—Z：为用户下载的 TrueType 字体。
        '6',
        //nHorizontal：：nFont选择内置字体时（1~6），设置文字的水平放大系数， 可选择:1—24。选择 TrueType 字体时（A~Z），设置字体的宽度，单位为像素点（不限大小）。
        3,
        //nVertical：：nFont选择内置字体时（1~6），设置文字的垂直放大系数， 可选择:1—24；选择 TrueType 字体时（A~Z），设置字体的高度，单位为像素点（不限大小）。
        3,
        //cText：选’N’则打印正常文本(如白底黑字文本)，选’R’则打印文本反色文本(如黑底白字文本)。
        'N',
        //strStr：常量字符串  特别注意： strStr字符串的总长度不能超过 100 个字符。
        StrToNSStr('繁华如三千东流水')
        );
  _ptkSDk.PTKPrintLabelandCPNum(1,1);

end;

procedure TForm5.btnPrintTestClick(Sender: TObject);
begin

  //打印测试页
  _ptkSDk.PTKMediaDetect;


end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  _delegate:=TSocketLinkerDelegate.Create;

  _ptkSDk:=TPTKPrintSDK.OCClass.sharedPTKPrintInstance;// = [PTKPrintSDK sharedPTKPrintInstance];
  _ptkSDk.setDelegate((_delegate as ILocalObject).GetObjectID);

end;

end.
