unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,



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
    System.Permissions, // ��̬Ȩ�޵�Ԫ
    {$ENDIF}
//    uAndroidPermission_D10_2,
  {$ENDIF}

  Androidapi.JNI.sunmiprinter,


  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TJICallback = class(TJavaLocal,JICallback)
  public
    { methods }
    procedure onRunResult(P1: Boolean); cdecl; //(Z)V
    procedure onReturnString(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure onRaiseException(P1: Integer; P2: JString); cdecl; //(ILjava/lang/String;)V
  end;


  TForm1 = class(TForm)
    btnInit: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnInitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FV1Printer:JV1Printer;
    FJICallback:JICallback;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btnInitClick(Sender: TObject);
begin
  //��ʼ
  FV1Printer:=TJV1Printer.JavaClass.init(SharedActivityContext);
  FJICallback:=TJICallback.Create;
  FV1Printer.setCallback(FJICallback);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //
					    //printer.setFontName(typeface);
///*						printer.setFontName("20");
//					    //printer.sendRAWData(new byte[]{0x1B, 0x21, 0x08});
//
//						printer.printText("��ǰ�滹��");
//						printer.printTextWithFont("28", "", 36);
//						printer.printText("λ�ڵȴ�\n");
//						for(int i=24; i<=48; i+=6){
//							printer.printTextWithFont("����", "", i);
//						}
//						for(int i=48; i>=12; i-=2){
//							printer.printTextWithFont("����", "", i);
//						}
//						printer.lineWrap(1);
//						printer.printTextWithFont("ABCDEFGHIJKLMNOPQRSTUVWXYZ01234\n","",30);
//						printer.printTextWithFont("abcdefghijklmnopqrstuvwxyz56789\n","",30);
//						printer.lineWrap(3);
//*/
						//printer.printColumnsText(new String[]{"���Q�΃r���~"}, new int[]{24}, new int[]{0});

    FV1Printer.beginTransaction;

    //printer.printText("֧����\n");
    FV1Printer.printText(StringToJString('֧����'+#13#10));
    //printer.printText("Alipay\n");
    FV1Printer.printText(StringToJString('Alipay'+#13#10));
    //printer.printText("===============================\n");
    FV1Printer.printText(StringToJString('==============================='+#13#10));
    //printer.printText("�������                 0.01Ԫ\n");
    FV1Printer.printText(StringToJString('�������                 0.01Ԫ'+#13#10));
    //printer.printText("    �����Żݽ��        0.01Ԫ\n");
    FV1Printer.printText(StringToJString('    �����Żݽ��        0.01Ԫ'+#13#10));
    //printer.printText("�̼�ʵ��\n");
    FV1Printer.printText(StringToJString('�̼�ʵ��'+#13#10));
    //printer.printText("------------------------------- \n");
    FV1Printer.printText(StringToJString('------------------------------- '+#13#10));
    //printer.printText("��Ʊ���(�û�ʵ��)   0.01Ԫ\n");
    FV1Printer.printText(StringToJString('Alipay'+#13#10));
    //printer.printText("--------------------------------\n");
    FV1Printer.printText(StringToJString('Alipay'+#13#10));
    //printer.printText("���׺�:\n");
    FV1Printer.printText(StringToJString('���׺�:'+#13#10));
    //printer.printText("2016040621001004150224503623\n\n");
    FV1Printer.printText(StringToJString('2016040621001004150224503623'+#13#10));
    //printer.printText("�ŵ�����  ���¼���(���ֹȶ���)\n");
    FV1Printer.printText(StringToJString('�ŵ�����  ���¼���(���ֹȶ���)'+#13#10));
    //printer.printText("����ʺ�         1id***@21cn.com\n");
    FV1Printer.printText(StringToJString('����ʺ�         1id***@21cn.com'+#13#10));
    //printer.printText("--------------------------------\n");
    FV1Printer.printText(StringToJString('--------------------------------'+#13#10));
    //printer.printText("����           2016-04-06 11:29\n");
    FV1Printer.printText(StringToJString('����           2016-04-06 11:29'+#13#10));
    //printer.printText("--------------------------------\n");
    FV1Printer.printText(StringToJString('--------------------------------'+#13#10));
    //printer.printText("��СƱ����Ҫ�û�ǩ��\n");
    FV1Printer.printText(StringToJString('��СƱ����Ҫ�û�ǩ��'+#13#10));
    //printer.setFontSize(32);
    FV1Printer.setFontSize(32);
    //printer.printText("http://www.sunmi.com\n");
    FV1Printer.printText(StringToJString('Alipay'+#13#10));
    //printer.printOriginalText("http://www.sunmi.com\n");
    FV1Printer.printOriginalText(StringToJString('http://www.sunmi.com'+#13#10));
    //printer.setFontSize(24);
    FV1Printer.setFontSize(24);
    //printer.printText("http://www.sunmi.com\n");
    FV1Printer.printText(StringToJString('http://www.sunmi.com'+#13#10));
    //printer.printOriginalText("http://www.sunmi.com\n");
    FV1Printer.printOriginalText(StringToJString('http://www.sunmi.com'+#13#10));
    //printer.lineWrap(6);
    FV1Printer.lineWrap(6);

    //��ӡ��ά��
    FV1Printer.sendRAWData(TJBytesUtil.JavaClass.getZXingQRCode(StringToJString('www.orangeui.cn'),300));

    //��ֽ
    FV1Printer.sendRAWData(TJBytesUtil.JavaClass.CutPaper);

    //�Լ�
    FV1Printer.sendRAWData(TJBytesUtil.JavaClass.selfCheck);

    FV1Printer.commitTransaction;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//    	findViewById(R.id.b_begin).setOnClickListener(this);
//    	findViewById(R.id.b_commit).setOnClickListener(this);
//    	findViewById(R.id.b_exit).setOnClickListener(this);
//
//    	findViewById(R.id.b_baidu).setOnClickListener(this);
//    	findViewById(R.id.b_erlmo).setOnClickListener(this);
//    	findViewById(R.id.b_meituan).setOnClickListener(this);
//    	findViewById(R.id.b_koubei).setOnClickListener(this);
//
//    	findViewById(R.id.b_self).setOnClickListener(this);
//    	findViewById(R.id.b_text).setOnClickListener(this);
//    	findViewById(R.id.b_pic).setOnClickListener(this);
//    	findViewById(R.id.b_table).setOnClickListener(this);
//
//    	findViewById(R.id.b_lines).setOnClickListener(this);
//
//    	findViewById(R.id.b_barcode).setOnClickListener(this);
//    	findViewById(R.id.b_qcode).setOnClickListener(this);
///*
//    	BarcodeFormat[] t = {
//    		BarcodeFormat.AZTEC,
//    		BarcodeFormat.CODABAR,
//    		BarcodeFormat.CODE_128,
//    		BarcodeFormat.CODE_39,
//    		BarcodeFormat.CODE_93,
//    		BarcodeFormat.DATA_MATRIX,
//    		BarcodeFormat.EAN_13,
//    		BarcodeFormat.EAN_8,
//    		BarcodeFormat.ITF,
//    		BarcodeFormat.MAXICODE,
//    		BarcodeFormat.PDF_417,
//    		BarcodeFormat.QR_CODE,
//    		BarcodeFormat.RSS_14,
//    		BarcodeFormat.RSS_EXPANDED,
//    		BarcodeFormat.UPC_A,
//    		BarcodeFormat.UPC_E,
//    		BarcodeFormat.UPC_EAN_EXTENSION
//    	};*/

end;

{ TJICallback }

procedure TJICallback.onRaiseException(P1: Integer; P2: JString);
begin
  FMX.Types.Log.d('OrangeUI TJICallback.onRaiseException');
end;

procedure TJICallback.onReturnString(P1: JString);
begin
  FMX.Types.Log.d('OrangeUI TJICallback.onReturnString');

end;

procedure TJICallback.onRunResult(P1: Boolean);
begin
  FMX.Types.Log.d('OrangeUI TJICallback.onRunResult');

end;

end.
