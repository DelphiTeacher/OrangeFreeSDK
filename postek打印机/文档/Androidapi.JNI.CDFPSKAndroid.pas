//====================================================
//
//  转换来自JarOrClass2Pas(原JavaClassToDelphiUnit)
//  原始作者：ying32
//  QQ: 1444386932、396506155
//  Email：yuanfen3287@vip.qq.com
//
//  修改 By：Flying Wang & 爱吃猪头肉
//  请不要移除以上的任何信息。
//  请不要将本版本发到城通网盘，否则死全家。
//
//  Email：1765535979@qq.com
//  QQ Group：165232328
//
//  生成时间：2023-09-12 17:10:24
//  工具版本：1.0.2018.1.30
//
//====================================================
unit Androidapi.JNI.CDFPSKAndroid;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.GraphicsContentViewText, 
  Androidapi.JNI.os;


type
// ===== Forward declarations =====

  JBitmapUtil = interface; //com.postek.cdf.BitmapUtil
  JCDFPTKAndroid = interface; //com.postek.cdf.CDFPTKAndroid
  JCDFPTKAndroidImpl_1 = interface; //com.postek.cdf.CDFPTKAndroidImpl$1
  JCDFPTKAndroidImpl_2 = interface; //com.postek.cdf.CDFPTKAndroidImpl$2
  JCDFPTKAndroidImpl = interface; //com.postek.cdf.CDFPTKAndroidImpl
  JPcxHeader = interface; //com.postek.cdf.PcxHeader
  JPcxImageConverter = interface; //com.postek.cdf.PcxImageConverter

// ===== Interface declarations =====

  JBitmapUtilClass = interface(JObjectClass)
  ['{8C53C459-88E1-4123-8166-AE7AA84C9C6C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitmapUtil; cdecl; //()V
    {class} function Bitmap2Bytes(baos: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    {class} function Bytes2Bitmap(P1: TJavaArray<Byte>): JBitmap; cdecl; //([B)Landroid/graphics/Bitmap;
    {class} function returnBitmap(fileUrl: JString): JBitmap; cdecl; //(Ljava/lang/String;)Landroid/graphics/Bitmap;
    {class} function compressImage(baos: JBitmap): JBitmap; cdecl; //(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    {class} function adjustPhotoRotation(orientationDegree: JBitmap; m: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function zoomImage(scaleWidth: JBitmap; scaleHeight: Integer; width: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function px2dip(pxValue: JContext; scale: Single): Integer; cdecl; //(Landroid/content/Context;F)I
    {class} function dip2px(dipValue: JContext; scale: Single): Integer; cdecl; //(Landroid/content/Context;F)I
    {class} function px2sp(pxValue: JContext; fontScale: Single): Integer; cdecl; //(Landroid/content/Context;F)I
    {class} function sp2px(spValue: JContext; fontScale: Single): Integer; cdecl; //(Landroid/content/Context;F)I
    {class} function bitmapFromSDcard(bitmap: JString): JBitmap; cdecl; //(Ljava/lang/String;)Landroid/graphics/Bitmap;
    {class} function bitmapFromRes(id_name: JContext; info: JString): JBitmap; cdecl; //(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    {class} function bitmapFromSrc(path: JContext; ain: JString): JBitmap; cdecl; //(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    {class} function bitmapFromAssets(fileName: JContext; ain: JString): JBitmap; cdecl; //(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    { static Property }
  end;

  [JavaSignature('com/postek/cdf/BitmapUtil')]
  JBitmapUtil = interface(JObject)
  ['{BAD3B838-926B-48B6-BD51-23527666D793}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapUtil = class(TJavaGenericImport<JBitmapUtilClass, JBitmapUtil>) end;

  JCDFPTKAndroidClass = interface(JObjectClass)
  ['{F634A969-6990-4C13-BDE9-B5E44DCBEA46}']
    { static Property Methods }
    {class} function _GetPTK_MSG_WHAT_WIFICONNECT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetPTK_MSG_WHAT_READRFIDMSG: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }

    { static Property }
    {class} property PTK_MSG_WHAT_WIFICONNECT: Integer read _GetPTK_MSG_WHAT_WIFICONNECT;
    {class} property PTK_MSG_WHAT_READRFIDMSG: Integer read _GetPTK_MSG_WHAT_READRFIDMSG;
  end;

  [JavaSignature('com/postek/cdf/CDFPTKAndroid')]
  JCDFPTKAndroid = interface(IJavaInstance)
  ['{8133596E-9B0B-4302-8129-8B82244A2E46}']
    { Property Methods }

    { methods }
    procedure setHandler(P1: JHandler); cdecl; //(Landroid/os/Handler;)V
    procedure ClearOrderOutput; cdecl; //()V
    function getOrderOutput: JString; cdecl; //()Ljava/lang/String;
    function PTK_ConnectWiFi(P1: JString; P2: Integer): Integer; cdecl; //(Ljava/lang/String;I)I
    procedure PTK_CloseConnectWiFi; cdecl; //()V
    function PTK_ConnectBluetooth(P1: JString): Integer; cdecl; //(Ljava/lang/String;)I
    procedure PTK_DisconnectBluetooth; cdecl; //()V
    function getDeviceName: JString; cdecl; //()Ljava/lang/String;
    function PTK_ClearBuffer: Integer; cdecl; //()I
    function PTK_SetPrintSpeed(P1: Integer): Integer; cdecl; //(I)I
    function PTK_SetDirection(P1: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_SetDarkness(P1: Integer): Integer; cdecl; //(I)I
    function PTK_SetLabelHeight(P1: Integer; P2: Integer; P3: Integer; P4: Boolean): Integer; cdecl; //(IIIZ)I
    function PTK_SetLabelWidth(P1: Integer): Integer; cdecl; //(I)I
    function PTK_SetCoordinateOrigin(P1: Integer; P2: Integer): Integer; cdecl; //(II)I
    function PTK_PrintLabel(P1: Integer; P2: Integer): Integer; cdecl; //(II)I
    function PTK_PrintLabelAuto(P1: Integer; P2: Integer): Integer; cdecl; //(II)I
    function PTK_SoftFontList: Integer; cdecl; //()I
    function PTK_SoftFontDel(P1: Char): Integer; cdecl; //(C)I
    function PTK_EnableBackFeed: Integer; cdecl; //()I
    function PTK_DisableBackFeed: Integer; cdecl; //()I
    function PTK_PrintConfiguration: Integer; cdecl; //()I
    function PTK_SetPrinterState(P1: Char): Integer; cdecl; //(C)I
    function PTK_EnableErrorReport: Integer; cdecl; //()I
    function PTK_DisableErrorReport: Integer; cdecl; //()I
    function PTK_EnableFLASH: Integer; cdecl; //()I
    function PTK_DisableFLASH: Integer; cdecl; //()I
    function PTK_FeedMedia: Integer; cdecl; //()I
    function PTK_MediaDetect: Integer; cdecl; //()I
    function PTK_Reset: Integer; cdecl; //()I
    function PTK_CutPage(P1: Integer): Integer; cdecl; //(I)I
    function PTK_CutPageEx(P1: Integer): Integer; cdecl; //(I)I
    function PTK_FeedBack: Integer; cdecl; //()I
    function PTK_SetNetworkFeedbackParameter(P1: Integer; P2: JString; P3: Integer): Integer; cdecl; //(ILjava/lang/String;I)I
    function PTK_SetFeedbackPort(P1: Integer): Integer; cdecl; //(I)I
    function PTK_DrawAndroidText(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: JString; P6: JString; P7: JString): Integer; cdecl; //(IIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    function PTK_DrawText(P1: Integer; P2: Integer; P3: Integer; P4: Char; P5: Integer; P6: Integer; P7: Char; P8: JString): Integer; cdecl; //(IIICIICLjava/lang/String;)I
    function PTK_DrawBarcode(P1: Integer; P2: Integer; P3: Integer; P4: JString; P5: Integer; P6: Integer; P7: Integer; P8: Char; P9: JString): Integer; cdecl; //(IIILjava/lang/String;IIICLjava/lang/String;)I
    function PTK_DrawBar2D_QR(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: JString): Integer; cdecl; //(IIIIIIIIILjava/lang/String;)I
    function PTK_DrawBar2D_DATAMATRIX(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: JString): Integer; cdecl; //(IIIIIILjava/lang/String;)I
    function PTK_DrawBar2D_MaxiCode(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: JString): Integer; cdecl; //(IIIILjava/lang/String;)I
    function PTK_DrawBar2D_Pdf417(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: Integer; P11: Integer; P12: Integer; P13: JString): Integer; cdecl; //(IIIIIIIIIIIILjava/lang/String;)I
    function PTK_DrawBar2D_HANXIN(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: JString): Integer; cdecl; //(IIIIIIIIILjava/lang/String;)I
    function PTK_DrawRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; //(IIIII)I
    function PTK_DrawLineXor(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; //(IIII)I
    function PTK_DrawLineOr(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; //(IIII)I
    function PTK_DrawDiagonal(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; //(IIIII)I
    function PTK_DrawWhiteLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; //(IIII)I
    function PTK_PcxGraphicsList: Integer; cdecl; //()I
    function PTK_PcxGraphicsDel(P1: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_PcxGraphicsDownload(P1: JString; P2: TJavaArray<Byte>): Integer; cdecl; //(Ljava/lang/String;[B)I
    function PTK_DrawPcxGraphics(P1: Integer; P2: Integer; P3: JString): Integer; cdecl; //(IILjava/lang/String;)I
    function PTK_PrintPCX(P1: Integer; P2: Integer; P3: JString; P4: TJavaArray<Byte>): Integer; cdecl; //(IILjava/lang/String;[B)I
    function PTK_BmpGraphicsDownload(P1: JString; P2: JBitmap; P3: Integer): Integer; cdecl; //(Ljava/lang/String;Landroid/graphics/Bitmap;I)I
    function PTK_PrintBMP(P1: Integer; P2: Integer; P3: JString; P4: JBitmap; P5: Integer): Integer; cdecl; //(IILjava/lang/String;Landroid/graphics/Bitmap;I)I
    function PTK_BinGraphicsList: Integer; cdecl; //()I
    function PTK_BinGraphicsDel(P1: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_BinGraphicsDownload(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl; //(Ljava/lang/String;II[B)I
    function PTK_RecallBinGraphics(P1: Integer; P2: Integer; P3: JString): Integer; cdecl; //(IILjava/lang/String;)I
    function PTK_DrawBinGraphics(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>): Integer; cdecl; //(IIII[B)I
    function PTK_FormList: Integer; cdecl; //()I
    function PTK_FormDel(P1: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_FormDownload(P1: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_FormEnd: Integer; cdecl; //()I
    function PTK_ExecForm(P1: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_DefineCounter(P1: Integer; P2: Integer; P3: Char; P4: JString; P5: JString): Integer; cdecl; //(IICLjava/lang/String;Ljava/lang/String;)I
    function PTK_DefineVariable(P1: Integer; P2: Integer; P3: Char; P4: JString): Integer; cdecl; //(IICLjava/lang/String;)I
    function PTK_Download: Integer; cdecl; //()I
    function PTK_DownloadInitVar(P1: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_SetFontGap(P1: Integer): Integer; cdecl; //(I)I
    function PTK_SetCharSets(P1: Integer; P2: Char; P3: JString): Integer; cdecl; //(ICLjava/lang/String;)I
    function PTK_RenameDownloadFont(P1: Integer; P2: Char; P3: JString): Integer; cdecl; //(ICLjava/lang/String;)I
    function PTK_RFIDCalibration: Integer; cdecl; //()I
    function PTK_RWRFIDLabel(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JString): Integer; cdecl; //(IIIIILjava/lang/String;)I
    function PTK_SetRFLabelPWAndLockRFLabel(P1: Integer; P2: Integer; P3: JString): Integer; cdecl; //(IILjava/lang/String;)I
    function PTK_SetRFID(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; //(IIIII)I
    function PTK_RWRFIDLabelEx(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JString): Integer; cdecl; //(IIIIILjava/lang/String;)I
    function PTK_ReadRFTagDataNet(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; //(Ljava/lang/String;IIII)I
    function PTK_Print300DpiDemo: Integer; cdecl; //()I
    function PTK_Print200DpiDemo: Integer; cdecl; //()I
    function PTK_OutputByOrder(P1: JString): Integer; cdecl; //(Ljava/lang/String;)I

    { Property }
  end;

  TJCDFPTKAndroid = class(TJavaGenericImport<JCDFPTKAndroidClass, JCDFPTKAndroid>) end;

  JCDFPTKAndroidImpl_1Class = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
  ['{CE59142A-BA25-439A-BBFE-D86018776933}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/postek/cdf/CDFPTKAndroidImpl$1')]
  JCDFPTKAndroidImpl_1 = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
  ['{5840D907-D50A-4446-8450-06330B3C1B90}']
    { Property Methods }

    { methods }
    procedure run; cdecl; //()V

    { Property }
  end;

  TJCDFPTKAndroidImpl_1 = class(TJavaGenericImport<JCDFPTKAndroidImpl_1Class, JCDFPTKAndroidImpl_1>) end;

  JCDFPTKAndroidImpl_2Class = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
  ['{568D34FF-D584-449B-847C-D741785E3E35}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/postek/cdf/CDFPTKAndroidImpl$2')]
  JCDFPTKAndroidImpl_2 = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
  ['{75F7CD40-E6AB-484E-8715-E93C09506034}']
    { Property Methods }

    { methods }
    procedure run; cdecl; //()V

    { Property }
  end;

  TJCDFPTKAndroidImpl_2 = class(TJavaGenericImport<JCDFPTKAndroidImpl_2Class, JCDFPTKAndroidImpl_2>) end;

  JCDFPTKAndroidImplClass = interface(JObjectClass)
  ['{317EDA2B-8297-401B-81F3-846A51F09C80}']
    { static Property Methods }
    {class} function _GetPTK_MSG_WHAT_WIFICONNECT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetPTK_MSG_WHAT_READRFIDMSG: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init(context: JContext; handler: JHandler): JCDFPTKAndroidImpl; cdecl; //(Landroid/content/Context;Landroid/os/Handler;)V

    { static Property }
    {class} property PTK_MSG_WHAT_WIFICONNECT: Integer read _GetPTK_MSG_WHAT_WIFICONNECT;
    {class} property PTK_MSG_WHAT_READRFIDMSG: Integer read _GetPTK_MSG_WHAT_READRFIDMSG;
  end;

  [JavaSignature('com/postek/cdf/CDFPTKAndroidImpl')]
  JCDFPTKAndroidImpl = interface(JObject)
  ['{F708C83A-C6C4-4CFC-8F83-7DB092BDAF82}']
    { Property Methods }

    { methods }
    procedure ClearOrderOutput; cdecl; //()V
    function getOrderOutput: JString; cdecl; //()Ljava/lang/String;
    procedure setHandler(handler: JHandler); cdecl; //(Landroid/os/Handler;)V
    function PTK_ConnectWiFi(IPAddress: JString; Port: Integer): Integer; cdecl; //(Ljava/lang/String;I)I
    procedure PTK_CloseConnectWiFi; cdecl; //()V
    function PTK_ConnectBluetooth(deviceAddress: JString): Integer; cdecl; //(Ljava/lang/String;)I
    procedure PTK_DisconnectBluetooth; cdecl; //()V
    function getDeviceName: JString; cdecl; //()Ljava/lang/String;
    function PTK_ClearBuffer: Integer; cdecl; //()I
    function PTK_SetPrintSpeed(px: Integer): Integer; cdecl; //(I)I
    function PTK_SetDirection(direct: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_SetDarkness(id: Integer): Integer; cdecl; //(I)I
    function PTK_SetLabelHeight(lHeight: Integer; gapH: Integer; gapOffset: Integer; bFlag: Boolean): Integer; cdecl; //(IIIZ)I
    function PTK_SetLabelWidth(lWidth: Integer): Integer; cdecl; //(I)I
    function PTK_SetCoordinateOrigin(px: Integer; py: Integer): Integer; cdecl; //(II)I
    function PTK_PrintLabel(number: Integer; cpnumber: Integer): Integer; cdecl; //(II)I
    function PTK_PrintLabelAuto(number: Integer; cpnumber: Integer): Integer; cdecl; //(II)I
    function PTK_SoftFontList: Integer; cdecl; //()I
    function PTK_SoftFontDel(id: Char): Integer; cdecl; //(C)I
    function PTK_EnableBackFeed: Integer; cdecl; //()I
    function PTK_DisableBackFeed: Integer; cdecl; //()I
    function PTK_PrintConfiguration: Integer; cdecl; //()I
    function PTK_SetPrinterState(state: Char): Integer; cdecl; //(C)I
    function PTK_EnableErrorReport: Integer; cdecl; //()I
    function PTK_DisableErrorReport: Integer; cdecl; //()I
    function PTK_EnableFLASH: Integer; cdecl; //()I
    function PTK_DisableFLASH: Integer; cdecl; //()I
    function PTK_FeedMedia: Integer; cdecl; //()I
    function PTK_MediaDetect: Integer; cdecl; //()I
    function PTK_Reset: Integer; cdecl; //()I
    function PTK_CutPage(page: Integer): Integer; cdecl; //(I)I
    function PTK_CutPageEx(page: Integer): Integer; cdecl; //(I)I
    function PTK_FeedBack: Integer; cdecl; //()I
    function PTK_UserBackFeed(feedLen: Integer): Integer; cdecl; //(I)I
    function PTK_SetNetworkFeedbackParameter(port: Integer; ip: JString; cp: Integer): Integer; cdecl; //(ILjava/lang/String;I)I
    function PTK_SetFeedbackPort(port: Integer): Integer; cdecl; //(I)I
    function PTK_DrawText(px: Integer; py: Integer; pdirec: Integer; pFont: Char; pHorizontal: Integer; pVertical: Integer; ptext: Char; pstr: JString): Integer; cdecl; //(IIICIICLjava/lang/String;)I
    function PTK_DrawBarcode(px: Integer; py: Integer; pdirec: Integer; pCode: JString; NarrowWidth: Integer; pHorizontal: Integer; pVertical: Integer; ptext: Char; pstr: JString): Integer; cdecl; //(IIILjava/lang/String;IIICLjava/lang/String;)I
    function PTK_DrawBar2D_QR(x: Integer; y: Integer; w: Integer; v: Integer; o: Integer; r: Integer; m: Integer; g: Integer; s: Integer; pstr: JString): Integer; cdecl; //(IIIIIIIIILjava/lang/String;)I
    function PTK_DrawBar2D_DATAMATRIX(x: Integer; y: Integer; w: Integer; v: Integer; o: Integer; m: Integer; pstr: JString): Integer; cdecl; //(IIIIIILjava/lang/String;)I
    function PTK_DrawBar2D_MaxiCode(x: Integer; y: Integer; m: Integer; u: Integer; pstr: JString): Integer; cdecl; //(IIIILjava/lang/String;)I
    function PTK_DrawBar2D_Pdf417(x: Integer; y: Integer; w: Integer; v: Integer; s: Integer; c: Integer; px: Integer; py: Integer; r: Integer; l: Integer; t: Integer; o: Integer; pstr: JString): Integer; cdecl; //(IIIIIIIIIIIILjava/lang/String;)I
    function PTK_DrawBar2D_HANXIN(x: Integer; y: Integer; w: Integer; v: Integer; m: Integer; o: Integer; r: Integer; g: Integer; s: Integer; pstr: JString): Integer; cdecl; //(IIIIIIIIILjava/lang/String;)I
    function PTK_DrawRectangle(px: Integer; py: Integer; thickness: Integer; pEx: Integer; pEy: Integer): Integer; cdecl; //(IIIII)I
    function PTK_DrawLineXor(px: Integer; py: Integer; pbyte: Integer; pH: Integer): Integer; cdecl; //(IIII)I
    function PTK_DrawLineOr(px: Integer; py: Integer; plength: Integer; pH: Integer): Integer; cdecl; //(IIII)I
    function PTK_DrawDiagonal(px: Integer; py: Integer; thickness: Integer; pEx: Integer; pEy: Integer): Integer; cdecl; //(IIIII)I
    function PTK_DrawWhiteLine(px: Integer; py: Integer; plength: Integer; pH: Integer): Integer; cdecl; //(IIII)I
    function PTK_PcxGraphicsList: Integer; cdecl; //()I
    function PTK_PcxGraphicsDel(pid: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_PcxGraphicsDownload(pcxname: JString; pcxfile: TJavaArray<Byte>): Integer; cdecl; //(Ljava/lang/String;[B)I
    function PTK_DrawPcxGraphics(px: Integer; py: Integer; gname: JString): Integer; cdecl; //(IILjava/lang/String;)I
    function PTK_PrintPCX(px: Integer; py: Integer; pcxname: JString; pcxfile: TJavaArray<Byte>): Integer; cdecl; //(IILjava/lang/String;[B)I
    function PTK_BmpGraphicsDownload(pcxname: JString; bmp: JBitmap; iDire: Integer): Integer; cdecl; //(Ljava/lang/String;Landroid/graphics/Bitmap;I)I
    function PTK_PrintBMP(px: Integer; py: Integer; pcxname: JString; bmp: JBitmap; iDire: Integer): Integer; cdecl; //(IILjava/lang/String;Landroid/graphics/Bitmap;I)I
    function PTK_BinGraphicsList: Integer; cdecl; //()I
    function PTK_BinGraphicsDel(pid: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_BinGraphicsDownload(binName: JString; pbyte: Integer; pH: Integer; Gdata: TJavaArray<Byte>): Integer; cdecl; //(Ljava/lang/String;II[B)I
    function PTK_RecallBinGraphics(px: Integer; py: Integer; binName: JString): Integer; cdecl; //(IILjava/lang/String;)I
    function PTK_DrawBinGraphics(px: Integer; py: Integer; pbyte: Integer; pH: Integer; Gdata: TJavaArray<Byte>): Integer; cdecl; //(IIII[B)I
    function PTK_FormList: Integer; cdecl; //()I
    function PTK_FormDel(pid: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_FormDownload(pid: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_FormEnd: Integer; cdecl; //()I
    function PTK_ExecForm(pid: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_DefineCounter(id: Integer; maxNum: Integer; ptext: Char; pstr: JString; pMsg: JString): Integer; cdecl; //(IICLjava/lang/String;Ljava/lang/String;)I
    function PTK_DefineVariable(pid: Integer; pmax: Integer; porder: Char; pMsg: JString): Integer; cdecl; //(IICLjava/lang/String;)I
    function PTK_Download: Integer; cdecl; //()I
    function PTK_DownloadInitVar(pstr: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_SetFontGap(gap: Integer): Integer; cdecl; //(I)I
    function PTK_SetCharSets(BitValue: Integer; CharSets: Char; CountryCode: JString): Integer; cdecl; //(ICLjava/lang/String;)I
    function PTK_RenameDownloadFont(StoreType: Integer; Fontname: Char; DownloadFontName: JString): Integer; cdecl; //(ICLjava/lang/String;)I
    function PTK_RFIDCalibration: Integer; cdecl; //()I
    function PTK_RWRFIDLabel(nRWMode: Integer; nWForm: Integer; nStartBlock: Integer; nWDataNum: Integer; nWArea: Integer; pstr: JString): Integer; cdecl; //(IIIIILjava/lang/String;)I
    function PTK_SetRFLabelPWAndLockRFLabel(nOperationMode: Integer; OperationnArea: Integer; pstr: JString): Integer; cdecl; //(IILjava/lang/String;)I
    function PTK_SetRFID(nReservationParameters: Integer; nReadWriteLocation: Integer; ReadWriteArea: Integer; nMaxErrNum: Integer; nErrProcessingMethod: Integer): Integer; cdecl; //(IIIII)I
    function PTK_RWRFIDLabelEx(nRWMode: Integer; nWForm: Integer; nStartBlock: Integer; nWDataNum: Integer; nWArea: Integer; pstr: JString): Integer; cdecl; //(IIIIILjava/lang/String;)I
    function PTK_ReadRFTagDataNet(IPAddress: JString; Port: Integer; nDataBlock: Integer; nRFPower: Integer; bFeed: Integer): Integer; cdecl; //(Ljava/lang/String;IIII)I
    function PTK_Print300DpiDemo: Integer; cdecl; //()I
    function PTK_Print200DpiDemo: Integer; cdecl; //()I
    function PTK_OutputByOrder(sendData: JString): Integer; cdecl; //(Ljava/lang/String;)I
    function PTK_DrawAndroidText(px: Integer; py: Integer; pSize: Integer; pType: Integer; ptext: JString; textName: JString; pstr: JString): Integer; cdecl; //(IIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    { Property }
  end;

  TJCDFPTKAndroidImpl = class(TJavaGenericImport<JCDFPTKAndroidImplClass, JCDFPTKAndroidImpl>) end;

  JPcxHeaderClass = interface(JObjectClass)
  ['{2E3CF216-4577-4521-B45E-A9FE1529E866}']
    { static Property Methods }
    {class} function _GetTAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init(buf: TJavaArray<Byte>): JPcxHeader; cdecl; //([B)V

    { static Property }
    {class} property TAG: JString read _GetTAG;
  end;

  [JavaSignature('com/postek/cdf/PcxHeader')]
  JPcxHeader = interface(JObject)
  ['{8F48658E-1351-4300-BD1D-45AE5CA1677D}']
    { Property Methods }
    function _Getid: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    procedure _Setid(aid: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(B)V
    function _Getversion: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    procedure _Setversion(aversion: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(B)V
    function _Getencoding: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    procedure _Setencoding(aencoding: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(B)V
    function _GetbitsPerPixel: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    procedure _SetbitsPerPixel(abitsPerPixel: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(B)V
    function _GetxStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetxStart(axStart: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetyStart: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetyStart(ayStart: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetxEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetxEnd(axEnd: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetyEnd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetyEnd(ayEnd: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GethorizontalResolution: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SethorizontalResolution(ahorizontalResolution: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetverticalResolution: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetverticalResolution(averticalResolution: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Getcolor_plane: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    procedure _Setcolor_plane(acolor_plane: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(B)V
    function _GetbytesPerLine: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetbytesPerLine(abytesPerLine: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetcolorPalette: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[I
    procedure _SetcolorPalette(acolorPalette: TJavaArray<Integer>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([I)V
    function _Getreserved: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    procedure _Setreserved(areserved: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(B)V
    function _Getpalette_type: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    procedure _Setpalette_type(apalette_type: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(S)V
    function _Getfiller: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[B
    procedure _Setfiller(afiller: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([B)V

    { methods }
    function getImageWidth: Integer; cdecl; //()I
    function getImageHeight: Integer; cdecl; //()I
    function getId: Byte; cdecl; //()B
    function getVersion: Byte; cdecl; //()B
    function getEncoding: Byte; cdecl; //()B

    { Property }
    property id: Byte read _Getid write _Setid;
    property version: Byte read _Getversion write _Setversion;
    property encoding: Byte read _Getencoding write _Setencoding;
    property bitsPerPixel: Byte read _GetbitsPerPixel write _SetbitsPerPixel;
    property xStart: Integer read _GetxStart write _SetxStart;
    property yStart: Integer read _GetyStart write _SetyStart;
    property xEnd: Integer read _GetxEnd write _SetxEnd;
    property yEnd: Integer read _GetyEnd write _SetyEnd;
    property horizontalResolution: Integer read _GethorizontalResolution write _SethorizontalResolution;
    property verticalResolution: Integer read _GetverticalResolution write _SetverticalResolution;
    property color_plane: Byte read _Getcolor_plane write _Setcolor_plane;
    property bytesPerLine: Integer read _GetbytesPerLine write _SetbytesPerLine;
    property colorPalette: TJavaArray<Integer> read _GetcolorPalette write _SetcolorPalette;
    property reserved: Byte read _Getreserved write _Setreserved;
    property palette_type: Word read _Getpalette_type write _Setpalette_type;
    property filler: TJavaArray<Byte> read _Getfiller write _Setfiller;
  end;

  TJPcxHeader = class(TJavaGenericImport<JPcxHeaderClass, JPcxHeader>) end;

  JPcxImageConverterClass = interface(JObjectClass)
  ['{E9359221-F9C9-43AD-ADD2-C3CBDEC4F97E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPcxImageConverter; cdecl; //()V
    {class} function getInstance: JPcxImageConverter; cdecl; //()Lcom/postek/cdf/PcxImageConverter;

    { static Property }
  end;

  [JavaSignature('com/postek/cdf/PcxImageConverter')]
  JPcxImageConverter = interface(JObject)
  ['{C8FB12BE-CAB9-475B-BF42-C6B6D8BDD58D}']
    { Property Methods }

    { methods }
    function convertToPcx(bitmap: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B

    { Property }
  end;

  TJPcxImageConverter = class(TJavaGenericImport<JPcxImageConverterClass, JPcxImageConverter>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.CDFPSKAndroid.JBitmapUtil', 
    TypeInfo(Androidapi.JNI.CDFPSKAndroid.JBitmapUtil));
  TRegTypes.RegisterType('Androidapi.JNI.CDFPSKAndroid.JCDFPTKAndroid', 
    TypeInfo(Androidapi.JNI.CDFPSKAndroid.JCDFPTKAndroid));
  TRegTypes.RegisterType('Androidapi.JNI.CDFPSKAndroid.JCDFPTKAndroidImpl_1', 
    TypeInfo(Androidapi.JNI.CDFPSKAndroid.JCDFPTKAndroidImpl_1));
  TRegTypes.RegisterType('Androidapi.JNI.CDFPSKAndroid.JCDFPTKAndroidImpl_2', 
    TypeInfo(Androidapi.JNI.CDFPSKAndroid.JCDFPTKAndroidImpl_2));
  TRegTypes.RegisterType('Androidapi.JNI.CDFPSKAndroid.JCDFPTKAndroidImpl', 
    TypeInfo(Androidapi.JNI.CDFPSKAndroid.JCDFPTKAndroidImpl));
  TRegTypes.RegisterType('Androidapi.JNI.CDFPSKAndroid.JPcxHeader', 
    TypeInfo(Androidapi.JNI.CDFPSKAndroid.JPcxHeader));
  TRegTypes.RegisterType('Androidapi.JNI.CDFPSKAndroid.JPcxImageConverter', 
    TypeInfo(Androidapi.JNI.CDFPSKAndroid.JPcxImageConverter));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
