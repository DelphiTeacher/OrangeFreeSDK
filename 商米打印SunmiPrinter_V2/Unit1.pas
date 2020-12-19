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

  uSunmiPrinterHelper,
  Androidapi.JNI.sunmi_printer_all,
  Androidapi.JNI.sunmi_helper,


  FMX.Controls.Presentation,
  FMX.StdCtrls;

type

  TForm1 = class(TForm)
    btnInit: TButton;
    Button1: TButton;
    procedure btnInitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FSunmiPrinterHelper:TSunmiPrinterHelper;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btnInitClick(Sender: TObject);
begin
  //��ʼ
  FSunmiPrinterHelper:=TSunmiPrinterHelper.Create;
  FSunmiPrinterHelper.StartSetup;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
//  FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('֧����'+#13#10),nil);
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

//    FSunmiPrinterHelper.FJSunmiPrinterService.beginTransaction;

    //printer.printText("֧����\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('֧����'+#13#10),nil);
    //printer.printText("Alipay\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('Alipay'+#13#10),nil);
    //printer.printText("===============================\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('==============================='+#13#10),nil);
    //printer.printText("�������                 0.01Ԫ\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('�������                 0.01Ԫ'+#13#10),nil);
    //printer.printText("    �����Żݽ��        0.01Ԫ\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('    �����Żݽ��        0.01Ԫ'+#13#10),nil);
    //printer.printText("�̼�ʵ��\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('�̼�ʵ��'+#13#10),nil);
    //printer.printText("------------------------------- \n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('------------------------------- '+#13#10),nil);
    //printer.printText("��Ʊ���(�û�ʵ��)   0.01Ԫ\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('Alipay'+#13#10),nil);
    //printer.printText("--------------------------------\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('Alipay'+#13#10),nil);
    //printer.printText("���׺�:\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('���׺�:'+#13#10),nil);
    //printer.printText("2016040621001004150224503623\n\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('2016040621001004150224503623'+#13#10),nil);
    //printer.printText("�ŵ�����  ���¼���(���ֹȶ���)\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('�ŵ�����  ���¼���(���ֹȶ���)'+#13#10),nil);
    //printer.printText("����ʺ�         1id***@21cn.com\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('����ʺ�         1id***@21cn.com'+#13#10),nil);
    //printer.printText("--------------------------------\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('--------------------------------'+#13#10),nil);
    //printer.printText("����           2016-04-06 11:29\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('����           2016-04-06 11:29'+#13#10),nil);
    //printer.printText("--------------------------------\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('--------------------------------'+#13#10),nil);
    //printer.printText("��СƱ����Ҫ�û�ǩ��\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('��СƱ����Ҫ�û�ǩ��'+#13#10),nil);
    //printer.setFontSize(32);
    FSunmiPrinterHelper.FJSunmiPrinterService.setFontSize(32,nil);
    //printer.printText("http://www.sunmi.com\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('Alipay'+#13#10),nil);
    //printer.printOriginalText("http://www.sunmi.com\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printOriginalText(StringToJString('http://www.sunmi.com'+#13#10),nil);
    //printer.setFontSize(24);
    FSunmiPrinterHelper.FJSunmiPrinterService.setFontSize(24,nil);
    //printer.printText("http://www.sunmi.com\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('http://www.sunmi.com'+#13#10),nil);
    //printer.printOriginalText("http://www.sunmi.com\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printOriginalText(StringToJString('http://www.sunmi.com'+#13#10),nil);
    //printer.lineWrap(6);
    FSunmiPrinterHelper.FJSunmiPrinterService.lineWrap(6,nil);



//    //��ӡ��ά��
//    FSunmiPrinterHelper.FJSunmiPrinterService.sendRAWData(TJBytesUtil.JavaClass.getZXingQRCode(StringToJString('www.orangeui.cn'),300));
//    FSunmiPrinterHelper.FJSunmiPrinterService.printQRCode(StringToJString('www.orangeui.cn'),30,30,nil);

    //��ֽ
//    FSunmiPrinterHelper.FJSunmiPrinterService.sendRAWData(TJBytesUtil.JavaClass.CutPaper);
    FSunmiPrinterHelper.FJSunmiPrinterService.cutPaper(nil);

//    //�Լ�
//    FSunmiPrinterHelper.FJSunmiPrinterService.sendRAWData(TJBytesUtil.JavaClass.selfCheck);

//    FSunmiPrinterHelper.FJSunmiPrinterService.commitTransaction;

end;

end.
