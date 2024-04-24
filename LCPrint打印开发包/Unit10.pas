unit Unit10;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,


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
  Androidapi.JNI.lcprintsdk1_1_release_aar,


  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TJMyPrintUtil_PrinterBinderListener = class(TJavaLocal,JPrintUtil_PrinterBinderListener)
    { methods }
    procedure onPrintCallback(P1: Integer); cdecl;
    procedure onVersion(P1: JString); cdecl;

    { Property }
  end;


  TForm10 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    printUtil:JPrintUtil;
    FJPrintUtil_PrinterBinderListener:JPrintUtil_PrinterBinderListener;
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.fmx}

procedure TForm10.Button1Click(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TForm10.Button1Click');
  printUtil := TJPrintUtil.JavaClass.getInstance(TAndroidHelper.Context);
  FJPrintUtil_PrinterBinderListener:=TJMyPrintUtil_PrinterBinderListener.Create;
  TJPrintUtil.JavaClass.setPrintEventListener(FJPrintUtil_PrinterBinderListener);
  TJPrintUtil.JavaClass.open;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TForm10.Button2Click');
  //
  ////步骤 1：获取打印示例
  //printUtil=PrintUtil.getInstance (TestLabelTemplateActivity.this);
  ////步骤 2：设置打印结果回调监听
  //printUtil.setPrintEventListener (this);//设置监听
  ////步骤 3：标签设置
//  TJPrintUtil.JavaClass.setUnwindPaperLen (return_distance);//设置回纸距离
  TJPrintUtil.JavaClass.printEnableMark (true);//开启黑标
  TJPrintUtil.JavaClass.printConcentration (25);//设置浓度
  ////步骤 4：打印文本
  TJPrintUtil.JavaClass.printText(StringToJString('打印文本 1'));
  TJPrintUtil.JavaClass.printText(StringToJString('打印文本 2'));
  TJPrintUtil.JavaClass.printText(StringToJString('打印文本 3'));
  ////步骤 5：走纸
  printUtil.printGoToNextMark();//走纸


end;

{ TJMyPrintUtil_PrinterBinderListener }

procedure TJMyPrintUtil_PrinterBinderListener.onPrintCallback(P1: Integer);
begin
  FMX.Types.Log.d('OrangeUI TJMyPrintUtil_PrinterBinderListener.onPrintCallback');
end;

procedure TJMyPrintUtil_PrinterBinderListener.onVersion(P1: JString);
begin
  FMX.Types.Log.d('OrangeUI TJMyPrintUtil_PrinterBinderListener.onVersion');

end;

end.
