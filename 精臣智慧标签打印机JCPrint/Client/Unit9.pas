unit Unit9;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  Math,
  Androidapi.JNI.jcprinthelper,
  Androidapi.JNI.print3_1_5_release_aar,

  {$IFDEF ANDROID}
  FMX.Platform.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.Widget,


  Androidapi.JNI.Net,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  Androidapi.JNI.Os,
  FMX.Helpers.Android,
    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}
  {$ENDIF}




  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;


type

  TJCallback = class(TJavaLocal,JCallback)
  public
    { methods }
    procedure onConnectSuccess(P1: JString); cdecl;
    procedure onDisConnect; cdecl;
    procedure onElectricityChange(P1: Integer); cdecl;
    procedure onCoverStatus(P1: Integer); cdecl;
    procedure onPaperStatus(P1: Integer); cdecl;
    procedure onHeartDisConnect; cdecl;
    { Property }
  end;

  TMyJPrintCallback = class(TJavaLocal,JPrintCallback)

    { methods }
    procedure onProgress(P1: Integer; P2: Integer; P3: JHashMap); cdecl;
    procedure onError(P1: Integer; P2: Integer); overload;cdecl;
    procedure onError(P1: Integer); overload;cdecl;
    procedure onBufferFree(P1: Integer; P2: Integer); cdecl;
    procedure onPause(P1: Boolean); cdecl;
    procedure onCancelJob(P1: Boolean); cdecl;

    { Property }
  end;




  TForm9 = class(TForm)
    btnInit: TButton;
    btnConnect: TButton;
    Memo1: TMemo;
    btnPrint: TButton;
    procedure btnInitClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    jcapi:JJCPrintApi;
    callback:JCallback;
    //总页数
    pageCount:Integer;
    //总份数
    quantity:Integer;
    //有多少页
    jsonList:JArrayList;
    //每一页的页面配置
    InfoList:JArrayList;

    printCallback:JprintCallback;
    { Private declarations }
  public
    FJjcprinthelper:Jjcprinthelper;
    { Public declarations }
  end;




var
  Form9: TForm9;


implementation


{$R *.fmx}

procedure TForm9.btnConnectClick(Sender: TObject);
begin

  TThread.CreateAnonymousThread(procedure
  begin
    //此链接为同步耗时法，请使线程调用。
//    jcapi.openPrinterByAddress(TAndroidHelper.Activity.getApplication(),StringToJString('DC:0D:30:7D:46:BB'),TJConstant.JavaClass.BLUETOOTH_SPP_CONNECT);
    //该地址为蓝牙的mac地址
    jcapi.openPrinterByAddress(StringToJString('E1:E3:29:09:21:22'));
  end).Start;

end;

procedure TForm9.btnInitClick(Sender: TObject);
begin
  jcapi:=TJJCPrintApi.JavaClass.getInstance(nil);
//  jcapi.init(TAndroidHelper.Activity.getApplication());
  TJjcprinthelper.JavaClass.init_jcapi(jcapi,TAndroidHelper.Activity.getApplication());
  jcapi.initImageProcessingDefault(StringToJString(''),StringToJString(''));


  callback:=TJCallback.Create;
  jcapi.setCallback(callback);


  jsonList:=TJArrayList.Create;
  InfoList:=TJArrayList.Create;

end;

procedure TForm9.btnPrintClick(Sender: TObject);
var
  AJavaArray:TJavaArray<Boolean>;
  ALabelJsonBytes:TJavaArray<Byte>;
  ALabelJsonStr:JString;
  AInfoJsonStr:JString;

  totalQuantity:Integer;
  width:Double;
  height:Double;
  orientation:Integer;
  marginX:Double;
  marginY:Double;
  //矩形框类型
  rectangleWidth:Double;
  rectangleHeight:Double;
  lineWidth:Double;
  //1.圆 2.椭圆 3.矩形 4.圆角矩形
  graphType:Integer;

  lineHeight:Double;

//  titleWidth:Double;
//  contentWidth:Double;

  fontSize:Double;
  offsetY:Double;
  offsetX:Double;
begin
  FMX.Types.Log.d('TForm9 TJCallback.btnPrintClick Begin');

//  FJjcprinthelper:=TJjcprinthelper.Create;
//  FJjcprinthelper.test_print(jcapi);
//  Exit;

  jsonList.clear();
  InfoList.clear();



  totalQuantity := 0;
  width := 70.0;
  height := 50.0;
  orientation := 0;
  marginX := 2.0;
  marginY := 2.0;
  //矩形框类型
  rectangleWidth := width - marginX * 2;
  rectangleHeight := height - marginY * 2;
  lineWidth := 0.5;
  //1.圆 2.椭圆 3.矩形 4.圆角矩形
  graphType := 3;

  //分成五行？
  lineHeight := rectangleHeight / 5.0;

//  titleWidth := rectangleWidth * 2 / 5.0;
//  contentWidth := rectangleWidth * 3 / 5.0;

  fontSize := 3.0;
  offsetY := 0;//-1.0;
  offsetX := 0;//-0.5;



  //设置画布大小
  jcapi.drawEmptyLabel(width, height, orientation, StringToJString(''));


  FMX.Types.Log.d('TForm9 TJCallback.btnPrintClick 1');


  //void drawLabelText(float x,
  //float y,
  //float width,
  //float height,
  //String value,
  //String fontFamily,
  //float fontSize,
  //int rotate,
  //int textAlignHorizontal,
  //int textAlignVertical,
  //int lineModel,
  //float letterSpace,
  //float lineSpace,
  //boolean [] mFontStyles)




  AJavaArray:=TJavaArray<Boolean>.Create(4);
  AJavaArray.Items[0]:=false;
  AJavaArray.Items[1]:=false;
  AJavaArray.Items[2]:=false;
  AJavaArray.Items[3]:=false;

  //绘制大标题，换行模式使用6，宽高固定，内容过大时缩放（区别于模式1的地方在于 文字内容按预算字号，预算文本框宽度排版后未超出预设高度时，不会放大文字，而是按照预设对齐方式将文字对齐文本框）
  jcapi.drawLabelText(marginX + offsetX,
                      marginY + offsetY,
                      //float width,
                      rectangleWidth - marginX * 4,
                      //float height,
                      lineHeight,
                      //String value,
                      StringToJString('OrangeUI'),
                      //String fontFamily,
                      StringToJString('宋体'),
                      //float fontSize,
                      fontSize,
                      //int rotate,
                      0,
                      //int textAlignHorizontal, @param textAlignHorizontal ⽔平对⻬⽅式：0:左对⻬ 1:居 中对⻬ 2:右对⻬
                      0,
                      //int textAlignVertical, @param textAlignVertical 垂 直 对⻬⽅式：0:顶对⻬ 1:垂直 居中 2:底对⻬
                      0,
                      //int lineModel,@param lineModel 1:宽⾼固 定，内容⼤⼩⾃适应（字号/字 符间距/⾏间距 按⽐例缩放）2: 宽度固定，⾼度⾃适应3:宽⾼固 定，超出内容后⾯加...4:宽⾼固 定,超出内容直裁切
                      6,
                      //float letterSpace,@param letterSpace 字⺟之 间的标准间隔，单位mm
                      0,
                      //float lineSpace,
                      1,
                      AJavaArray);//
//                      new boolean[]{false, false, false, false});



  //绘制大标题，换行模式使用6，宽高固定，内容过大时缩放（区别于模式1的地方在于 文字内容按预算字号，预算文本框宽度排版后未超出预设高度时，不会放大文字，而是按照预设对齐方式将文字对齐文本框）
  jcapi.drawLabelText(marginX,
                      marginY+lineHeight,
                      rectangleWidth,
                      lineHeight,
                      StringToJString('Delphi'),
                      StringToJString('宋体'),
                      fontSize,
                      0,
                      0,
                      0,
                      6,
                      0,
                      1,
                      AJavaArray);//
//                      new boolean[]{false, false, false, false});

  //void drawLabelBarCode(float x, float y, float width, float height, int codeType, String value, float fontSize, int rotate, int textHeight, int textPosition)
  //@param x ⽔平坐标
  //@param y 垂直坐标
  //@param width 宽度,单位mm
  //@param height ⾼度,单位mm
  //@param codeType ⼀维码类 型 20:CODE12821:UPC- A,22:UPC- E,23:EAN8,24:EAN13,25:CO DE93,26:CODE39,27:CODEB AR, 28:ITF25
  //@param value ⽂本内容
  //@param fontSize ⽂本字号
  //@param rotate 旋 转 ⻆ 度 ， 仅⽀持0,90,180,270
  //@param textHeight ⽂本⾼度
  //@param textPosition ⽂本位 置，int,⼀维码⽂字识别码显示 位置,0:下⽅显示,1:上⽅显示,2: 不显示
  //绘制一维码
  jcapi.drawLabelBarCode(marginX,
                        marginY + lineHeight +lineHeight ,
                        rectangleWidth - marginX * 4,
                        10,
                        //@param codeType ⼀维码类 型 20:CODE12821:UPC- A,22:UPC- E,23:EAN8,24:EAN13,25:CO DE93,26:CODE39,27:CODEB AR, 28:ITF25
                        20,
                        //@param value ⽂本内容
                        StringToJString('11111111'),
                        //@param fontSize ⽂本字号
                        3,
                        //@param rotate 旋 转 ⻆ 度 ， 仅⽀持0,90,180,270
                        0,
                        //@param textHeight ⽂本⾼度
                        5,
                        //@param textPosition ⽂本位 置，int,⼀维码⽂字识别码显示 位置,0:下⽅显示,1:上⽅显示,2: 不显示
                        0);

  FMX.Types.Log.d('TForm9 TJCallback.btnPrintClick 2');




  //生成打印数据
//  byte[] jsonByte
  ALabelJsonBytes:= jcapi.generateLabelJson();
  //转换为字符串
  ALabelJsonStr:=TJString.JavaClass.init(ALabelJsonBytes);
  FMX.Types.Log.d('TForm9 TJCallback.btnPrintClick 3 '+JStringToString(ALabelJsonStr));
  Self.Memo1.Lines.Add(JStringToString(ALabelJsonStr));
  jsonList.add(ALabelJsonStr);

  FMX.Types.Log.d('TForm9 TJCallback.btnPrintClick 3');


  {
   * orientation 旋转角度 0/90/180/270
   * margin 边距 「」
   * printQuantity 打印份数
   * horizontalOffset 水平边距
   * verticalOffset 垂直边距
   * width 标签宽度（出纸方向,单位mm）
   * height 标签宽度（出纸方向,单位mm）
   }
//  AInfoJsonStr = "{  " +
//          "\"printerImageProcessingInfo\": " + "{    " +
//          "\"orientation\":" + orientation + "," +
//          "   \"margin\": [      0,      0,      0,      0    ], " +
//          "   \"printQuantity\": 1,  " +
//          "  \"horizontalOffset\": 0,  " +
//          "  \"verticalOffset\": 0,  " +
//          "  \"width\":" + width + "," +
//          "   \"height\":" + height + "," +
//          "  \"epc\": \"\"  }}";
  quantity:=1;
  AInfoJsonStr := StringToJString('{  ' +
          '"printerImageProcessingInfo": ' + '{    ' +
          '"orientation":' + IntToStr(orientation) + ',' +
          '   "margin": [      0,      0,      0,      0    ], ' +
          '   "printQuantity": '+IntToStr(quantity)+',  ' +
          '  "horizontalOffset": 0,  ' +
          '  "verticalOffset": 0,  ' +
          '  "width":' + FloatToStr(width) + ',' +
          '   "height":' + FloatToStr(height) + ',' +
          '  "epc": ""  }}');
  Self.Memo1.Lines.Add(JStringToString(AInfoJsonStr));
  infoList.add(AInfoJsonStr);

  totalQuantity:=quantity;
  pageCount:=1;




  //设置总打印份数。每页份数之和
//  PrintUtil.getInstance(null).setTotalQuantityOfPrints(totalQuantity);
  jcapi.setTotalQuantityOfPrints(totalQuantity);

  FMX.Types.Log.d('TForm9 TJCallback.btnPrintClick 4');

  ///**
  //* @param density 打印浓度 -2⾄5
  //* @param paperType 纸张类型 <1>,间隙纸；<2>,⿊标纸；<3>,连续纸；<5>,透明纸；
  //<6>,标牌
  //* @param printMode 打印模式
  //* @param printCallback 打印相关回调
  //*/
  //public void startJob(final int density, final int paperType, final int
  //printMode, final PrintCallback printCallback)
  printCallback:=TMyJPrintCallback.Create;
  jcapi.startPrintJob(3,1,1,printCallback);

  FMX.Types.Log.d('TForm9 TJCallback.btnPrintClick End');

end;

procedure TForm9.FormShow(Sender: TObject);
begin

  //申请权限
  {$IFDEF ANDROID}
    {$IF RTLVersion>=33}// 10.3+
    PermissionsService.RequestPermissions
    ([
      JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE),
      JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE)
      ],nil);
    {$ELSE}
    {$ENDIF}
  {$ELSE}
  {$ENDIF}



//  //申请权限
//  {$IFDEF ANDROID}
//    {$IF RTLVersion>=33}// 10.3+
//    PermissionsService.RequestPermissions
//        ([
//          JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE),
//          JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE)
//          ],
//      procedure(const APermissions: {$IF CompilerVersion >= 35.0}TClassicStringDynArray{$ELSE}TArray<string>{$IFEND};
//        const AGrantResults: {$IF CompilerVersion >= 35.0}TClassicPermissionStatusDynArray{$ELSE}TArray<TPermissionStatus>{$IFEND})
//      begin
//      end);
//    {$ELSE}
//    {$ENDIF}
//  {$ELSE}
//  {$ENDIF}


end;

{ TJCallback }

procedure TJCallback.onConnectSuccess(P1: JString);
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onConnectSuccess');
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onConnectSuccess');
  end);
end;

procedure TJCallback.onCoverStatus(P1: Integer);
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onCoverStatus');
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onCoverStatus');
  end);
end;

procedure TJCallback.onDisConnect;
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onDisConnect');
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onDisConnect');
  end);
end;

procedure TJCallback.onElectricityChange(P1: Integer);
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onElectricityChange');
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onElectricityChange');
  end);
end;

procedure TJCallback.onHeartDisConnect;
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onHeartDisConnect');
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onHeartDisConnect');
  end);
end;

procedure TJCallback.onPaperStatus(P1: Integer);
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onPaperStatus');
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onPaperStatus');
  end);
end;

{ TMyJPrintCallback }

procedure TMyJPrintCallback.onBufferFree(P1, P2: Integer);
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onBufferFree');
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onBufferFree');
  end);


  //public void onBufferFree(int pageIndex, int bufferSize) {
  //pageIndex-1，取最低值，Math.min(pageIndex - 1 + bufferSize, jsonList.size()) ，取最高值。提交打印数据和图像处理数据的集合长度要一致

//  PrintUtil.getInstance(null).commitData(
//          jsonList.subList(pageIndex - 1, Math.min(pageIndex - 1 + bufferSize, jsonList.size())),
//          infoList.subList(pageIndex - 1, Math.min(pageIndex - 1 + bufferSize, jsonList.size())));
  Form9.jcapi.commitData(
          Form9.jsonList.subList(P1 - 1, min(P1 - 1 + P2, Form9.jsonList.size())),
          Form9.infoList.subList(P1 - 1, min(P1 - 1 + P2, Form9.jsonList.size())));

end;

procedure TMyJPrintCallback.onCancelJob(P1: Boolean);
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onCancelJob');
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onCancelJob');
  end);

end;

procedure TMyJPrintCallback.onError(P1: Integer);
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onError P1:'+IntToStr(P1));
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onError P1:'+IntToStr(P1));
  end);

end;

procedure TMyJPrintCallback.onError(P1, P2: Integer);
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onError P1:'+IntToStr(P1)+' P2:'+IntToStr(P2));
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onError P1:'+IntToStr(P1)+' P2:'+IntToStr(P2));
  end);

end;

procedure TMyJPrintCallback.onPause(P1: Boolean);
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onPause');
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onPause');
  end);

end;

procedure TMyJPrintCallback.onProgress(P1, P2: Integer; P3: JHashMap);
begin
  FMX.Types.Log.d('OrangeUI TJCallback.onProgress');
  TThread.Synchronize(nil,procedure
  begin
    Form9.Memo1.Lines.Add('TJCallback.onProgress');
  end);

  //public void onProgress(int pageIndex, int quantityIndex, HashMap<String, Object> customData) {
  ////打印进度回调
  //Log.d(TAG, "测试:onProgress: pageIndex" + pageIndex + ",quantityIndex:" + quantityIndex);
  //if (pageIndex == pageCount && quantityIndex == quantity) {
  //    if (PrintUtil.getInstance(null).endJob()) {
  //        Log.d(TAG, "结束打印成功");
  //    } else {
  //        Log.d(TAG, "结束打印失败");
  //    }
  //}
  if (P1=Form9.pageCount) and (P2=Form9.quantity) then
  begin
    Form9.jcapi.endJob();
  end;




end;

end.
