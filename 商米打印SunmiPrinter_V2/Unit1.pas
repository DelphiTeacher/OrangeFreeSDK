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
    System.Permissions, // 动态权限单元
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
  //初始
  FSunmiPrinterHelper:=TSunmiPrinterHelper.Create;
  FSunmiPrinterHelper.StartSetup;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
//  FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('支付宝'+#13#10),nil);
  //
					    //printer.setFontName(typeface);
///*						printer.setFontName("20");
//					    //printer.sendRAWData(new byte[]{0x1B, 0x21, 0x08});
//
//						printer.printText("您前面还有");
//						printer.printTextWithFont("28", "", 36);
//						printer.printText("位在等待\n");
//						for(int i=24; i<=48; i+=6){
//							printer.printTextWithFont("商米", "", i);
//						}
//						for(int i=48; i>=12; i-=2){
//							printer.printTextWithFont("商米", "", i);
//						}
//						printer.lineWrap(1);
//						printer.printTextWithFont("ABCDEFGHIJKLMNOPQRSTUVWXYZ01234\n","",30);
//						printer.printTextWithFont("abcdefghijklmnopqrstuvwxyz56789\n","",30);
//						printer.lineWrap(3);
//*/
						//printer.printColumnsText(new String[]{"名稱單價金額"}, new int[]{24}, new int[]{0});

//    FSunmiPrinterHelper.FJSunmiPrinterService.beginTransaction;

    //printer.printText("支付宝\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('支付宝'+#13#10),nil);
    //printer.printText("Alipay\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('Alipay'+#13#10),nil);
    //printer.printText("===============================\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('==============================='+#13#10),nil);
    //printer.printText("订单金额                 0.01元\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('订单金额                 0.01元'+#13#10),nil);
    //printer.printText("    参与优惠金额        0.01元\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('    参与优惠金额        0.01元'+#13#10),nil);
    //printer.printText("商家实收\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('商家实收'+#13#10),nil);
    //printer.printText("------------------------------- \n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('------------------------------- '+#13#10),nil);
    //printer.printText("开票金额(用户实付)   0.01元\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('Alipay'+#13#10),nil);
    //printer.printText("--------------------------------\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('Alipay'+#13#10),nil);
    //printer.printText("交易号:\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('交易号:'+#13#10),nil);
    //printer.printText("2016040621001004150224503623\n\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('2016040621001004150224503623'+#13#10),nil);
    //printer.printText("门店名称  正新鸡排(欢乐谷二店)\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('门店名称  正新鸡排(欢乐谷二店)'+#13#10),nil);
    //printer.printText("买家帐号         1id***@21cn.com\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('买家帐号         1id***@21cn.com'+#13#10),nil);
    //printer.printText("--------------------------------\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('--------------------------------'+#13#10),nil);
    //printer.printText("日期           2016-04-06 11:29\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('日期           2016-04-06 11:29'+#13#10),nil);
    //printer.printText("--------------------------------\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('--------------------------------'+#13#10),nil);
    //printer.printText("此小票不需要用户签字\n");
    FSunmiPrinterHelper.FJSunmiPrinterService.printText(StringToJString('此小票不需要用户签字'+#13#10),nil);
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



//    //打印二维码
//    FSunmiPrinterHelper.FJSunmiPrinterService.sendRAWData(TJBytesUtil.JavaClass.getZXingQRCode(StringToJString('www.orangeui.cn'),300));
//    FSunmiPrinterHelper.FJSunmiPrinterService.printQRCode(StringToJString('www.orangeui.cn'),30,30,nil);

    //切纸
//    FSunmiPrinterHelper.FJSunmiPrinterService.sendRAWData(TJBytesUtil.JavaClass.CutPaper);
    FSunmiPrinterHelper.FJSunmiPrinterService.cutPaper(nil);

//    //自检
//    FSunmiPrinterHelper.FJSunmiPrinterService.sendRAWData(TJBytesUtil.JavaClass.selfCheck);

//    FSunmiPrinterHelper.FJSunmiPrinterService.commitTransaction;

end;

end.
