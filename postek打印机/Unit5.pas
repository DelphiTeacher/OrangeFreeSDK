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
		////���ӳɹ�
		//- (void)socketDidConnectToHost:(NSString *)host port:(uint16_t)port;
		[MethodName('socketDidConnectToHost:port:')]
		procedure socketDidConnectToHostport(host:NSString;port:uint16_t);cdecl;


		////����ʧ�ܵĴ���,����������,����ֹͣ����������,��������
		//- (void)socketDidDisconnectWithError:(NSError *)error;
		procedure socketDidDisconnectWithError(error:NSError);cdecl;


		////��ȡSocket����
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
  //C:\OrangeFreeSDK\postek��ӡ��\PostekSDK\IOS_2_7



  if _ptkSDk.PTKConnectandPort(StrToNSStr(Self.edtIP.Text),StrToInt(Self.edtPort.Text))=PTK_SUCCESS then
  begin
    Self.Memo1.Lines.Add('��ӡ�����ӳɹ�');
  end
  else
  begin
    Self.Memo1.Lines.Add('��ӡ������ʧ��');
  end;



//    NSLog(@"IP:%@ PORT:%d\r\n", _editIP.text, [_editPort.text intValue]);
//
//    [_ptkSDk PTKConnect:_editIP.text  andPort:[_editPort.text intValue]];
//
//    if([_ptkSDk PTKConnect:_editIP.text  andPort:[_editPort.text intValue]]==PTK_SUCCESS){
//        _label0.text = [NSString stringWithFormat:@"��ӡ�����ӳɹ�IP:%@ PORT:%@",_editIP.text, _editPort.text];
//        //NSLog(@"���ӳɹ�");
//    }else{
//
//    }
//
//
//    int64_t delayInSeconds = 1.0;      // �ӳٵ�ʱ��
//    /*
//     *@parameter 1,ʱ����գ��Ӵ˿̿�ʼ��ʱ
//     *@parameter 2,��ʱ��ã��˴�Ϊ�뼶����������ȡ�10ull * NSEC_PER_MSEC
//     */
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        // do something
//            if ([_ptkSDk isConnect]) {
//                _label0.text = [NSString stringWithFormat:@"��ӡ�����ӳɹ�IP:%@ PORT:%@",_editIP.text, _editPort.text];
//
//                NSLog(@"���ӳɹ�");
//            }else{
//                _label0.text = [NSString stringWithFormat:@"��ӡ������ʧ��IP:%@ PORT:%@",_editIP.text, _editPort.text];
//                 NSLog(@"����ʧ��");
//            }
//    });



end;

{ TSocketLinkerDelegate }

procedure  TSocketLinkerDelegate.socketDidConnectToHostport(host:NSString;port:uint16_t);
begin
	FMX.Types.Log.d('OrangeUI TSocketLinkerDelegate.socketDidConnectToHostport');
  TThread.Synchronize(nil,procedure
  begin
    Form5.Memo1.Lines.Add('��ӡ�����ӳɹ�');
  end);

end;

procedure  TSocketLinkerDelegate.socketDidDisconnectWithError(error:NSError);
begin
	FMX.Types.Log.d('OrangeUI TSocketLinkerDelegate.socketDidDisconnectWithError');
  TThread.Synchronize(nil,procedure
  begin
    Form5.Memo1.Lines.Add('��ӡ������ʧ��');
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
// * ��λת������Ӣ��ת��Ϊdot
// *
// * @param x
// *            Ӣ�絥λ
// * @return dot��λ
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
    // ��len�����жϣ��ж��Ƿ��ں���������
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
//    NSLog(@"��ӡ\r\n");

///*    [_ptkSDk PTKClearBuffer];
//    [_ptkSDk PTKDrawText:20 andPy:20 andDirec:0 andFont:'6' andHorizontal:3 andVertical:3 andText:'N' andStr:@"��������ǧ����ˮ"];
//    [_ptkSDk PTKPrintLabel:1 andCPNum:1];*/
//    [self printShoppingOrderList:nil];
//    [_ptkTestUtil setPageLength:mm2inch(136)];end;

  _ptkSDk.PTKClearBuffer;
  _ptkSDk.PTKDrawTextandPyandDirecandFontandHorizontalandVerticalandTextandStr(
        //nPx������ X ����,�Ե�(dots)Ϊ��λ
        20,
        //nPy������ Y ����,�Ե�(dots)Ϊ��λ��
        20,
        //nDirec��ѡ���ӡ����. 0������ת��1����ת 90�㣻2����ת 180�㣻3����ת 270�㡣
        0,
        //nFont��ѡ����������� TrueType ���塣1��5��Ϊ��ӡ���ڲ����壻6 Ϊ��ӡ������ 24*24���庺�֣�A��Z��Ϊ�û����ص� TrueType ���塣
        '6',
        //nHorizontal����nFontѡ����������ʱ��1~6�����������ֵ�ˮƽ�Ŵ�ϵ���� ��ѡ��:1��24��ѡ�� TrueType ����ʱ��A~Z������������Ŀ�ȣ���λΪ���ص㣨���޴�С����
        3,
        //nVertical����nFontѡ����������ʱ��1~6�����������ֵĴ�ֱ�Ŵ�ϵ���� ��ѡ��:1��24��ѡ�� TrueType ����ʱ��A~Z������������ĸ߶ȣ���λΪ���ص㣨���޴�С����
        3,
        //cText��ѡ��N�����ӡ�����ı�(��׵׺����ı�)��ѡ��R�����ӡ�ı���ɫ�ı�(��ڵװ����ı�)��
        'N',
        //strStr�������ַ���  �ر�ע�⣺ strStr�ַ������ܳ��Ȳ��ܳ��� 100 ���ַ���
        StrToNSStr('��������ǧ����ˮ')
        );
  _ptkSDk.PTKPrintLabelandCPNum(1,1);

end;

procedure TForm5.btnPrintTestClick(Sender: TObject);
begin

  //��ӡ����ҳ
  _ptkSDk.PTKMediaDetect;


end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  _delegate:=TSocketLinkerDelegate.Create;

  _ptkSDk:=TPTKPrintSDK.OCClass.sharedPTKPrintInstance;// = [PTKPrintSDK sharedPTKPrintInstance];
  _ptkSDk.setDelegate((_delegate as ILocalObject).GetObjectID);

end;

end.
