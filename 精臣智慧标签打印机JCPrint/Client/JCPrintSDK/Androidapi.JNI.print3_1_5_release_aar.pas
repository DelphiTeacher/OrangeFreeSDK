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
//  生成时间：2022-05-09 14:48:27
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.print3_1_5_release_aar;

interface

{$IFDEF ANDROID}

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes
  ,
  Androidapi.JNI.App,
  Androidapi.JNI.Os,
  Androidapi.JNI.GraphicsContentViewText//,
//  Androidapi.JNI.android.graphics.Bitmap,
//  Androidapi.JNI.android.graphics.Bitmap_Config,
//  Androidapi.JNI.android.content.Intent,
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.android.content.BroadcastReceiver,
//  Androidapi.JNI.android.content.IntentFilter,
//  Androidapi.JNI.android.bluetooth.BluetoothGatt,
//  Androidapi.JNI.android.bluetooth.BluetoothGattDescriptor,
//  Androidapi.JNI.android.bluetooth.BluetoothGattCharacteristic,
//  Androidapi.JNI.android.bluetooth.BluetoothDevice,
//  Androidapi.JNI.android.bluetooth.BluetoothAdapter,
//  Androidapi.JNI.android.bluetooth.BluetoothSocket,
//  Androidapi.JNI.android.app.Activity,
//  Androidapi.JNI.android.app.Application,
//  Androidapi.JNI.android.os.Handler,
//  Androidapi.JNI.android.content.res.Configuration,
//  Androidapi.JNI.java.text.SimpleDateFormat,
//  Androidapi.JNI.android.widget.Toast,
//  Androidapi.JNI.android.os.Message,
//  Androidapi.JNI.android.os.Looper,
//  Androidapi.JNI.android.os.Bundle,
//  Androidapi.JNI.org.xmlpull.v1.XmlPullParser,
//  Androidapi.JNI.org.xmlpull.v1.XmlSerializer,
//  Androidapi.JNI.android.graphics.Point,
//  Androidapi.JNI.android.webkit.WebView,
//  Androidapi.JNI.android.bluetooth.BluetoothAdapter_LeScanCallback,
//  Androidapi.JNI.android.view.View,
//  Androidapi.JNI.org.json.JSONObject,
//  Androidapi.JNI.android.graphics.Canvas,
//  Androidapi.JNI.android.graphics.Typeface,
//  Androidapi.JNI.com.jingchen.jcimagesdk.ImageParam,
//  Androidapi.JNI.android.net.wifi.ScanResult,
//  Androidapi.JNI.android.net.NetworkInfo,
//  Androidapi.JNI.java.nio.charset.Charset,
//  Androidapi.JNI.android.net.wifi.WifiConfiguration,
//  Androidapi.JNI.android.net.DhcpInfo,
//  Androidapi.JNI.java.net.DatagramSocket
  ;


type

// ===== Forward declarations =====

//  Ja = interface; //com.dothantech.a.a.a
//  Jb = interface; //com.dothantech.a.a.b
//  Jc = interface; //com.dothantech.a.a.c
//  Jd = interface; //com.dothantech.a.a.d
//  Je = interface; //com.dothantech.a.a.e
//  Ja_a = interface; //com.dothantech.b.a$a
//  Ja_006 = interface; //com.dothantech.b.a
//  Jb_007 = interface; //com.dothantech.b.b
//  Jc_008 = interface; //com.dothantech.b.c
//  Jd_009 = interface; //com.dothantech.b.d
//  Je_010 = interface; //com.dothantech.b.e
//  Jf = interface; //com.dothantech.b.f
//  Jg = interface; //com.dothantech.b.g
//  Jh = interface; //com.dothantech.b.h
//  Ji = interface; //com.dothantech.b.i
//  Jj = interface; //com.dothantech.b.j
//  Jk = interface; //com.dothantech.b.k
//  Jl = interface; //com.dothantech.b.l
//  Jm_a = interface; //com.dothantech.b.m$a
//  Jm_b = interface; //com.dothantech.b.m$b
//  Jm = interface; //com.dothantech.b.m
//  Jn = interface; //com.dothantech.b.n
//  Jo = interface; //com.dothantech.b.o
//  Jp_a = interface; //com.dothantech.b.p$a
//  Jp = interface; //com.dothantech.b.p
//  Jq = interface; //com.dothantech.b.q
//  Jr = interface; //com.dothantech.b.r
//  Js = interface; //com.dothantech.b.s
//  Jt = interface; //com.dothantech.b.t
//  Ja_029 = interface; //com.dothantech.c.a.a.a
//  Jb_030 = interface; //com.dothantech.c.a.a.b
//  Jc_031 = interface; //com.dothantech.c.a.a.c
//  Ja_032 = interface; //com.dothantech.c.a.a
//  Jb_033 = interface; //com.dothantech.c.a.b
//  Jc_034 = interface; //com.dothantech.c.a.c
//  Ja_035 = interface; //com.dothantech.c.a
//  Ja_036 = interface; //com.dothantech.c.b.a
//  Jb_037 = interface; //com.dothantech.c.b.b
//  Jc_038 = interface; //com.dothantech.c.b.c
//  Jd_a = interface; //com.dothantech.c.b.d$a
//  Jd_b = interface; //com.dothantech.c.b.d$b
//  Jd_041 = interface; //com.dothantech.c.b.d
//  Je_042 = interface; //com.dothantech.c.b.e
//  Jf_043 = interface; //com.dothantech.c.b.f
//  Jg_a = interface; //com.dothantech.c.b.g$a
//  Jg_b = interface; //com.dothantech.c.b.g$b
//  Jg_046 = interface; //com.dothantech.c.b.g
//  Jh_a = interface; //com.dothantech.c.b.h$a
//  Jh_048 = interface; //com.dothantech.c.b.h
//  Ji_049 = interface; //com.dothantech.c.b.i
//  Jj_a = interface; //com.dothantech.c.b.j$a
//  Jj_b = interface; //com.dothantech.c.b.j$b
//  Jj_c = interface; //com.dothantech.c.b.j$c
//  Jj_d = interface; //com.dothantech.c.b.j$d
//  Jj_054 = interface; //com.dothantech.c.b.j
//  Jk_055 = interface; //com.dothantech.c.b.k
//  Jl_056 = interface; //com.dothantech.c.b.l
//  Jm_a_057 = interface; //com.dothantech.c.b.m$a
//  Jm_058 = interface; //com.dothantech.c.b.m
//  Jb_059 = interface; //com.dothantech.c.b
//  Ja_060 = interface; //com.dothantech.c.c.a.a
//  Jb_061 = interface; //com.dothantech.c.c.a.b
//  Jc_a = interface; //com.dothantech.c.c.a.c$a
//  Jc_b = interface; //com.dothantech.c.c.a.c$b
//  Jc_064 = interface; //com.dothantech.c.c.a.c
//  Ja_065 = interface; //com.dothantech.c.c.b.a
//  Jb_066 = interface; //com.dothantech.c.c.b.b
//  Jc_067 = interface; //com.dothantech.c.c.b.c
//  Jd_068 = interface; //com.dothantech.c.c.b.d
//  Je_069 = interface; //com.dothantech.c.c.b.e
//  Jf_070 = interface; //com.dothantech.c.c.b.f
//  Jc_071 = interface; //com.dothantech.c.c
//  Jd_072 = interface; //com.dothantech.c.d
//  Je_073 = interface; //com.dothantech.c.e
//  Ja_a_074 = interface; //com.dothantech.common.a$a
//  Ja_b = interface; //com.dothantech.common.a$b
//  Ja_076 = interface; //com.dothantech.common.a
//  Jaa = interface; //com.dothantech.common.aa
//  Jab = interface; //com.dothantech.common.ab
//  Jac = interface; //com.dothantech.common.ac
//  Jad = interface; //com.dothantech.common.ad
//  Jae = interface; //com.dothantech.common.ae
//  Jaf = interface; //com.dothantech.common.af
//  Jag_a = interface; //com.dothantech.common.ag$a
//  Jag = interface; //com.dothantech.common.ag
//  Jah = interface; //com.dothantech.common.ah
//  Jai = interface; //com.dothantech.common.ai
//  Jaj = interface; //com.dothantech.common.aj
//  Jak = interface; //com.dothantech.common.ak
//  Jal = interface; //com.dothantech.common.al
//  Jam = interface; //com.dothantech.common.am
//  Jan_a = interface; //com.dothantech.common.an$a
//  Jan = interface; //com.dothantech.common.an
//  Jao = interface; //com.dothantech.common.ao
//  Jap = interface; //com.dothantech.common.ap
//  Jaq = interface; //com.dothantech.common.aq
//  Jar = interface; //com.dothantech.common.ar
//  Jas = interface; //com.dothantech.common.as
//  Jat = interface; //com.dothantech.common.at
//  Jau = interface; //com.dothantech.common.au
//  Jav = interface; //com.dothantech.common.av
//  Jaw = interface; //com.dothantech.common.aw
//  Jax = interface; //com.dothantech.common.ax
//  Jb_103 = interface; //com.dothantech.common.b
//  Jc_104 = interface; //com.dothantech.common.c
//  Jd_105 = interface; //com.dothantech.common.d
  JDzSystem = interface; //com.dothantech.common.DzSystem
//  Je_107 = interface; //com.dothantech.common.e
//  Jf_108 = interface; //com.dothantech.common.f
//  Jg_a_109 = interface; //com.dothantech.common.g$a
//  Jg_110 = interface; //com.dothantech.common.g
//  Jh_111 = interface; //com.dothantech.common.h
//  Ji_112 = interface; //com.dothantech.common.i
//  Jj_113 = interface; //com.dothantech.common.j
//  Jk_114 = interface; //com.dothantech.common.k
//  Jl_115 = interface; //com.dothantech.common.l
//  Jm_116 = interface; //com.dothantech.common.m
//  Jn_a = interface; //com.dothantech.common.n$a
//  Jn_118 = interface; //com.dothantech.common.n
//  Jo_119 = interface; //com.dothantech.common.o
//  Jp_120 = interface; //com.dothantech.common.p
//  Jq_121 = interface; //com.dothantech.common.q
//  Jr_a = interface; //com.dothantech.common.r$a
//  Jr_123 = interface; //com.dothantech.common.r
  JReflection = interface; //com.dothantech.common.Reflection
//  Js_125 = interface; //com.dothantech.common.s
//  Jt_126 = interface; //com.dothantech.common.t
//  Ju = interface; //com.dothantech.common.u
//  Jv = interface; //com.dothantech.common.v
//  Jw = interface; //com.dothantech.common.w
//  Jx = interface; //com.dothantech.common.x
//  Jy = interface; //com.dothantech.common.y
//  Jz = interface; //com.dothantech.common.z
//  Ja_133 = interface; //com.dothantech.data.a
//  Jb_a = interface; //com.dothantech.data.b$a
//  Jb_135 = interface; //com.dothantech.data.b
//  Jc_136 = interface; //com.dothantech.data.c
//  Jd_a_137 = interface; //com.dothantech.data.d$a
//  Jd_b_138 = interface; //com.dothantech.data.d$b
//  Jd_139 = interface; //com.dothantech.data.d
//  JDzTagObject_a = interface; //com.dothantech.data.DzTagObject$a
  JDzTagObject = interface; //com.dothantech.data.DzTagObject
//  Je_a = interface; //com.dothantech.data.e$a
//  Je_b = interface; //com.dothantech.data.e$b
//  Je_c = interface; //com.dothantech.data.e$c
//  Je_145 = interface; //com.dothantech.data.e
//  Ja_146 = interface; //com.dothantech.lpapi.a
//  Jb_147 = interface; //com.dothantech.lpapi.b
  JIAtBitmap_BarcodeType1D = interface; //com.dothantech.lpapi.IAtBitmap$BarcodeType1D
  JIAtBitmap_BarcodeType2D = interface; //com.dothantech.lpapi.IAtBitmap$BarcodeType2D
  JIAtBitmap_DrawParamName = interface; //com.dothantech.lpapi.IAtBitmap$DrawParamName
  JIAtBitmap_ErrorCorrectionLevel = interface; //com.dothantech.lpapi.IAtBitmap$ErrorCorrectionLevel
  JIAtBitmap_Factory = interface; //com.dothantech.lpapi.IAtBitmap$Factory
  JIAtBitmap_FontStyle = interface; //com.dothantech.lpapi.IAtBitmap$FontStyle
  JIAtBitmap_ItemAlignment = interface; //com.dothantech.lpapi.IAtBitmap$ItemAlignment
  JIAtBitmap_LabelScaleUnit = interface; //com.dothantech.lpapi.IAtBitmap$LabelScaleUnit
  JIAtBitmap_PenAlignment = interface; //com.dothantech.lpapi.IAtBitmap$PenAlignment
  JIAtBitmap_ResultCode = interface; //com.dothantech.lpapi.IAtBitmap$ResultCode
  JIAtBitmap = interface; //com.dothantech.lpapi.IAtBitmap
//  JLPAPI_1 = interface; //com.dothantech.lpapi.LPAPI$1
  JLPAPI_BarcodeType = interface; //com.dothantech.lpapi.LPAPI$BarcodeType
  JLPAPI_Callback = interface; //com.dothantech.lpapi.LPAPI$Callback
  JLPAPI_Factory = interface; //com.dothantech.lpapi.LPAPI$Factory
  JLPAPI_FontStyle = interface; //com.dothantech.lpapi.LPAPI$FontStyle
  JLPAPI_ItemAlignment = interface; //com.dothantech.lpapi.LPAPI$ItemAlignment
  JLPAPI_PenAlignment = interface; //com.dothantech.lpapi.LPAPI$PenAlignment
  JLPAPI_PrintParamName = interface; //com.dothantech.lpapi.LPAPI$PrintParamName
  JLPAPI_PrintParamValue = interface; //com.dothantech.lpapi.LPAPI$PrintParamValue
  JLPAPI = interface; //com.dothantech.lpapi.LPAPI
//  Ja_a_169 = interface; //com.dothantech.printer.a$a
//  Ja_170 = interface; //com.dothantech.printer.a
//  Jb_171 = interface; //com.dothantech.printer.b
//  Jc_172 = interface; //com.dothantech.printer.c
//  Jd_173 = interface; //com.dothantech.printer.d
//  JDzPrinter_a = interface; //com.dothantech.printer.DzPrinter$a
//  JDzPrinter_b = interface; //com.dothantech.printer.DzPrinter$b
//  JDzPrinter_c = interface; //com.dothantech.printer.DzPrinter$c
//  JDzPrinter_d = interface; //com.dothantech.printer.DzPrinter$d
//  JDzPrinter_e = interface; //com.dothantech.printer.DzPrinter$e
//  JDzPrinter_f = interface; //com.dothantech.printer.DzPrinter$f
//  JDzPrinter = interface; //com.dothantech.printer.DzPrinter
//  Je_181 = interface; //com.dothantech.printer.e
//  Jf_182 = interface; //com.dothantech.printer.f
//  Jg_183 = interface; //com.dothantech.printer.g
//  Jh_184 = interface; //com.dothantech.printer.h
//  Ji_185 = interface; //com.dothantech.printer.i
//  JIDzPrinter_1 = interface; //com.dothantech.printer.IDzPrinter$1
  JIDzPrinter_AddressType = interface; //com.dothantech.printer.IDzPrinter$AddressType
  JIDzPrinter_Factory = interface; //com.dothantech.printer.IDzPrinter$Factory
  JIDzPrinter_GeneralProgress = interface; //com.dothantech.printer.IDzPrinter$GeneralProgress
  JIDzPrinter_IActionCallback = interface; //com.dothantech.printer.IDzPrinter$IActionCallback
  JIDzPrinter_IActionWithResponseCallback = interface; //com.dothantech.printer.IDzPrinter$IActionWithResponseCallback
  JIDzPrinter_IDzPrinterCallback = interface; //com.dothantech.printer.IDzPrinter$IDzPrinterCallback
  JIDzPrinter_PrinterAddress = interface; //com.dothantech.printer.IDzPrinter$PrinterAddress
  JIDzPrinter_PrinterInfo = interface; //com.dothantech.printer.IDzPrinter$PrinterInfo
  JIDzPrinter_PrinterState = interface; //com.dothantech.printer.IDzPrinter$PrinterState
  JIDzPrinter_PrintFailReason = interface; //com.dothantech.printer.IDzPrinter$PrintFailReason
  JIDzPrinter_PrintParamName = interface; //com.dothantech.printer.IDzPrinter$PrintParamName
  JIDzPrinter_PrintParamValue = interface; //com.dothantech.printer.IDzPrinter$PrintParamValue
  JIDzPrinter_PrintProgress = interface; //com.dothantech.printer.IDzPrinter$PrintProgress
  JIDzPrinter_ProgressInfo = interface; //com.dothantech.printer.IDzPrinter$ProgressInfo
  JIDzPrinter = interface; //com.dothantech.printer.IDzPrinter
//  JIDzPrinter2_1 = interface; //com.dothantech.printer.IDzPrinter2$1
  JIDzPrinter2_DeviceAddrTypeConverter = interface; //com.dothantech.printer.IDzPrinter2$DeviceAddrTypeConverter
  JIDzPrinter2_DiscoveriedPrinter = interface; //com.dothantech.printer.IDzPrinter2$DiscoveriedPrinter
  JIDzPrinter2_IDzPrinterCallback2 = interface; //com.dothantech.printer.IDzPrinter2$IDzPrinterCallback2
  JIDzPrinter2_PrinterParam = interface; //com.dothantech.printer.IDzPrinter2$PrinterParam
  JIDzPrinter2_PrinterParamName = interface; //com.dothantech.printer.IDzPrinter2$PrinterParamName
  JIDzPrinter2 = interface; //com.dothantech.printer.IDzPrinter2
//  Jj_209 = interface; //com.dothantech.printer.j
//  Jk_210 = interface; //com.dothantech.printer.k
//  Jl_211 = interface; //com.dothantech.printer.l
//  Jm_212 = interface; //com.dothantech.printer.m
//  Jn_213 = interface; //com.dothantech.printer.n
//  Jo_214 = interface; //com.dothantech.printer.o
//  Jp_215 = interface; //com.dothantech.printer.p
//  Jq_216 = interface; //com.dothantech.printer.q
//  Jr_217 = interface; //com.dothantech.printer.r
//  Js_218 = interface; //com.dothantech.printer.s
//  Jt_219 = interface; //com.dothantech.printer.t
//  Ju_220 = interface; //com.dothantech.printer.u
//  Jv_221 = interface; //com.dothantech.printer.v
//  Jw_222 = interface; //com.dothantech.printer.w
//  Ja_a_223 = interface; //com.dothantech.view.a$a
//  Ja_224 = interface; //com.dothantech.view.a
//  Jb_225 = interface; //com.dothantech.view.b
//  Jc_226 = interface; //com.dothantech.view.c
//  Jd_227 = interface; //com.dothantech.view.d
//  JDzWindow_1 = interface; //com.dothantech.view.DzWindow$1
  JDzWindow_ViewInfo = interface; //com.dothantech.view.DzWindow$ViewInfo
  JDzWindow_ViewInfoType = interface; //com.dothantech.view.DzWindow$ViewInfoType
  JDzWindow = interface; //com.dothantech.view.DzWindow
//  Je_232 = interface; //com.dothantech.view.e
//  Ja_233 = interface; //com.gengcon.www.jcprintersdk.a
//  Ja0 = interface; //com.gengcon.www.jcprintersdk.a0
//  Ja1 = interface; //com.gengcon.www.jcprintersdk.a1
//  Ja2 = interface; //com.gengcon.www.jcprintersdk.a2
//  Jb_237 = interface; //com.gengcon.www.jcprintersdk.b
//  Jb0 = interface; //com.gengcon.www.jcprintersdk.b0
//  Jb1 = interface; //com.gengcon.www.jcprintersdk.b1
//  Jb2_a = interface; //com.gengcon.www.jcprintersdk.b2$a
//  Jb2_b = interface; //com.gengcon.www.jcprintersdk.b2$b
//  Jb2_c = interface; //com.gengcon.www.jcprintersdk.b2$c
//  Jb2_d = interface; //com.gengcon.www.jcprintersdk.b2$d
//  Jb2_e = interface; //com.gengcon.www.jcprintersdk.b2$e
//  Jb2_f = interface; //com.gengcon.www.jcprintersdk.b2$f
//  Jb2 = interface; //com.gengcon.www.jcprintersdk.b2
  JImageDataInfo = interface; //com.gengcon.www.jcprintersdk.bean.ImageDataInfo
  JPrinterInfo = interface; //com.gengcon.www.jcprintersdk.bean.PrinterInfo
  JPrinterPageImpl_DrawBarcode1DItem = interface; //com.gengcon.www.jcprintersdk.bean.PrinterPageImpl$DrawBarcode1DItem
  JPrinterPageImpl_DrawBarcodeQRcodeItem = interface; //com.gengcon.www.jcprintersdk.bean.PrinterPageImpl$DrawBarcodeQRcodeItem
  JPrinterPageImpl_DrawBitmapItem = interface; //com.gengcon.www.jcprintersdk.bean.PrinterPageImpl$DrawBitmapItem
  JPrinterPageImpl_DrawBoxItem = interface; //com.gengcon.www.jcprintersdk.bean.PrinterPageImpl$DrawBoxItem
  JPrinterPageImpl_DrawLineItem = interface; //com.gengcon.www.jcprintersdk.bean.PrinterPageImpl$DrawLineItem
  JPrinterPageImpl_DrawTextItem = interface; //com.gengcon.www.jcprintersdk.bean.PrinterPageImpl$DrawTextItem
  JPrinterPageImpl_FontInfo = interface; //com.gengcon.www.jcprintersdk.bean.PrinterPageImpl$FontInfo
  JPrinterPageImpl = interface; //com.gengcon.www.jcprintersdk.bean.PrinterPageImpl
  JPrintingHistoryData = interface; //com.gengcon.www.jcprintersdk.bean.PrintingHistoryData
//  Jc_258 = interface; //com.gengcon.www.jcprintersdk.c
//  Jc0 = interface; //com.gengcon.www.jcprintersdk.c0
//  Jc1 = interface; //com.gengcon.www.jcprintersdk.c1
//  Jc2 = interface; //com.gengcon.www.jcprintersdk.c2
  JCallback = interface; //com.gengcon.www.jcprintersdk.callback.Callback
  JNeedDataCallBack = interface; //com.gengcon.www.jcprintersdk.callback.NeedDataCallBack
  JPrintCallback = interface; //com.gengcon.www.jcprintersdk.callback.PrintCallback
  JUpDateDeviceSoftWareCallback = interface; //com.gengcon.www.jcprintersdk.callback.UpDateDeviceSoftWareCallback
//  Jd_266 = interface; //com.gengcon.www.jcprintersdk.d
//  Jd0 = interface; //com.gengcon.www.jcprintersdk.d0
//  Jd1 = interface; //com.gengcon.www.jcprintersdk.d1
//  Jd2_a = interface; //com.gengcon.www.jcprintersdk.d2$a
//  Jd2 = interface; //com.gengcon.www.jcprintersdk.d2
//  JAbstractPacket_1 = interface; //com.gengcon.www.jcprintersdk.data.AbstractPacket$1
  JAbstractPacket = interface; //com.gengcon.www.jcprintersdk.data.AbstractPacket
  JDataCheck = interface; //com.gengcon.www.jcprintersdk.data.DataCheck
  JDataGenerator = interface; //com.gengcon.www.jcprintersdk.data.DataGenerator
  JDataProcess = interface; //com.gengcon.www.jcprintersdk.data.DataProcess
  JDataSend_OnProgressCallback = interface; //com.gengcon.www.jcprintersdk.data.DataSend$OnProgressCallback
  JDataSend = interface; //com.gengcon.www.jcprintersdk.data.DataSend
  JNiimbotSppPacket = interface; //com.gengcon.www.jcprintersdk.data.NiimbotSppPacket
//  Je_279 = interface; //com.gengcon.www.jcprintersdk.e
//  Je0 = interface; //com.gengcon.www.jcprintersdk.e0
//  Je1 = interface; //com.gengcon.www.jcprintersdk.e1
//  Je2 = interface; //com.gengcon.www.jcprintersdk.e2
//  Jf_283 = interface; //com.gengcon.www.jcprintersdk.f
//  Jf0_a = interface; //com.gengcon.www.jcprintersdk.f0$a
//  Jf0 = interface; //com.gengcon.www.jcprintersdk.f0
//  Jf1 = interface; //com.gengcon.www.jcprintersdk.f1
//  Jf2 = interface; //com.gengcon.www.jcprintersdk.f2
//  Jg_288 = interface; //com.gengcon.www.jcprintersdk.g
//  Jg0 = interface; //com.gengcon.www.jcprintersdk.g0
//  Jg1 = interface; //com.gengcon.www.jcprintersdk.g1
//  Jg2 = interface; //com.gengcon.www.jcprintersdk.g2
//  Jh_a_292 = interface; //com.gengcon.www.jcprintersdk.h$a
//  Jh_293 = interface; //com.gengcon.www.jcprintersdk.h
//  Jh0 = interface; //com.gengcon.www.jcprintersdk.h0
//  Jh1 = interface; //com.gengcon.www.jcprintersdk.h1
//  Jh2 = interface; //com.gengcon.www.jcprintersdk.h2
//  Ji_297 = interface; //com.gengcon.www.jcprintersdk.i
//  Ji0_a = interface; //com.gengcon.www.jcprintersdk.i0$a
//  Ji0_b = interface; //com.gengcon.www.jcprintersdk.i0$b
//  Ji0 = interface; //com.gengcon.www.jcprintersdk.i0
//  Ji1 = interface; //com.gengcon.www.jcprintersdk.i1
//  Ji2_a = interface; //com.gengcon.www.jcprintersdk.i2$a
//  Ji2 = interface; //com.gengcon.www.jcprintersdk.i2
//  Jj_304 = interface; //com.gengcon.www.jcprintersdk.j
//  Jj0 = interface; //com.gengcon.www.jcprintersdk.j0
//  Jj1 = interface; //com.gengcon.www.jcprintersdk.j1
  JJCPrintApi = interface; //com.gengcon.www.jcprintersdk.JCPrintApi
//  Jk_308 = interface; //com.gengcon.www.jcprintersdk.k
//  Jk0_a = interface; //com.gengcon.www.jcprintersdk.k0$a
//  Jk0 = interface; //com.gengcon.www.jcprintersdk.k0
//  Jk1 = interface; //com.gengcon.www.jcprintersdk.k1
//  Jl_312 = interface; //com.gengcon.www.jcprintersdk.l
//  Jl0 = interface; //com.gengcon.www.jcprintersdk.l0
//  Jl1_a = interface; //com.gengcon.www.jcprintersdk.l1$a
//  Jl1 = interface; //com.gengcon.www.jcprintersdk.l1
//  Jm_316 = interface; //com.gengcon.www.jcprintersdk.m
//  Jm0 = interface; //com.gengcon.www.jcprintersdk.m0
//  Jm1 = interface; //com.gengcon.www.jcprintersdk.m1
//  Jn_319 = interface; //com.gengcon.www.jcprintersdk.n
//  Jn0 = interface; //com.gengcon.www.jcprintersdk.n0
//  Jn1_a = interface; //com.gengcon.www.jcprintersdk.n1$a
//  Jn1_b = interface; //com.gengcon.www.jcprintersdk.n1$b
//  Jn1 = interface; //com.gengcon.www.jcprintersdk.n1
//  Jo_324 = interface; //com.gengcon.www.jcprintersdk.o
//  Jo0 = interface; //com.gengcon.www.jcprintersdk.o0
//  Jo1 = interface; //com.gengcon.www.jcprintersdk.o1
//  Jp_327 = interface; //com.gengcon.www.jcprintersdk.p
//  Jp0 = interface; //com.gengcon.www.jcprintersdk.p0
//  Jp1 = interface; //com.gengcon.www.jcprintersdk.p1
//  Ja_a_330 = interface; //com.gengcon.www.jcprintersdk.printer.a$a
//  Ja_331 = interface; //com.gengcon.www.jcprintersdk.printer.a
//  Jb_a_332 = interface; //com.gengcon.www.jcprintersdk.printer.b$a
//  Jb_b = interface; //com.gengcon.www.jcprintersdk.printer.b$b
//  Jb_334 = interface; //com.gengcon.www.jcprintersdk.printer.b
//  Jc_a_335 = interface; //com.gengcon.www.jcprintersdk.printer.c$a
//  Jc_b_336 = interface; //com.gengcon.www.jcprintersdk.printer.c$b
//  Jc_337 = interface; //com.gengcon.www.jcprintersdk.printer.c
//  Jd_338 = interface; //com.gengcon.www.jcprintersdk.printer.d
//  Je_a_339 = interface; //com.gengcon.www.jcprintersdk.printer.e$a
//  Je_340 = interface; //com.gengcon.www.jcprintersdk.printer.e
//  Jf_a = interface; //com.gengcon.www.jcprintersdk.printer.f$a
//  Jf_342 = interface; //com.gengcon.www.jcprintersdk.printer.f
//  JJCPrinter_a = interface; //com.gengcon.www.jcprintersdk.printer.JCPrinter$a
//  JJCPrinter_b_a_a = interface; //com.gengcon.www.jcprintersdk.printer.JCPrinter$b$a$a
//  JJCPrinter_b_a = interface; //com.gengcon.www.jcprintersdk.printer.JCPrinter$b$a
//  JJCPrinter_b_b = interface; //com.gengcon.www.jcprintersdk.printer.JCPrinter$b$b
//  JJCPrinter_b_c = interface; //com.gengcon.www.jcprintersdk.printer.JCPrinter$b$c
//  JJCPrinter_b = interface; //com.gengcon.www.jcprintersdk.printer.JCPrinter$b
  JJCPrinter_PrinterException = interface; //com.gengcon.www.jcprintersdk.printer.JCPrinter$PrinterException
  JJCPrinter = interface; //com.gengcon.www.jcprintersdk.printer.JCPrinter
  JPrinterInfoGetter = interface; //com.gengcon.www.jcprintersdk.printerInterface.PrinterInfoGetter
  JPrinterInfoSetter = interface; //com.gengcon.www.jcprintersdk.printerInterface.PrinterInfoSetter
  JPrintTask = interface; //com.gengcon.www.jcprintersdk.printerInterface.PrintTask
//  Jq_354 = interface; //com.gengcon.www.jcprintersdk.q
//  Jq0 = interface; //com.gengcon.www.jcprintersdk.q0
//  Jq1 = interface; //com.gengcon.www.jcprintersdk.q1
//  Jr_357 = interface; //com.gengcon.www.jcprintersdk.r
//  Jr0_a = interface; //com.gengcon.www.jcprintersdk.r0$a
//  Jr0 = interface; //com.gengcon.www.jcprintersdk.r0
//  Jr1 = interface; //com.gengcon.www.jcprintersdk.r1
//  Js_361 = interface; //com.gengcon.www.jcprintersdk.s
//  Js0 = interface; //com.gengcon.www.jcprintersdk.s0
//  Js1 = interface; //com.gengcon.www.jcprintersdk.s1
//  Jt_364 = interface; //com.gengcon.www.jcprintersdk.t
//  Jt0 = interface; //com.gengcon.www.jcprintersdk.t0
//  Jt1_a = interface; //com.gengcon.www.jcprintersdk.t1$a
//  Jt1 = interface; //com.gengcon.www.jcprintersdk.t1
//  Ju_368 = interface; //com.gengcon.www.jcprintersdk.u
//  Ju0 = interface; //com.gengcon.www.jcprintersdk.u0
//  Ju1 = interface; //com.gengcon.www.jcprintersdk.u1
  JBarCodeUtil = interface; //com.gengcon.www.jcprintersdk.util.BarCodeUtil
  JBase64BitmapUtil = interface; //com.gengcon.www.jcprintersdk.util.Base64BitmapUtil
  JBitmapAndRgbByteUtil = interface; //com.gengcon.www.jcprintersdk.util.BitmapAndRgbByteUtil
  JBitmapFileUtils = interface; //com.gengcon.www.jcprintersdk.util.BitmapFileUtils
  JBluetoothMonitorReceiver = interface; //com.gengcon.www.jcprintersdk.util.BluetoothMonitorReceiver
  JByteUtil = interface; //com.gengcon.www.jcprintersdk.util.ByteUtil
  JCommonBitmapUtil = interface; //com.gengcon.www.jcprintersdk.util.CommonBitmapUtil
  JCommonDraw = interface; //com.gengcon.www.jcprintersdk.util.CommonDraw
  JConfigurationDevice_DeviceInfo = interface; //com.gengcon.www.jcprintersdk.util.ConfigurationDevice$DeviceInfo
  JConfigurationDevice = interface; //com.gengcon.www.jcprintersdk.util.ConfigurationDevice
  JConnLogFileUtils = interface; //com.gengcon.www.jcprintersdk.util.ConnLogFileUtils
  JDataResloveUtil = interface; //com.gengcon.www.jcprintersdk.util.DataResloveUtil
  JEncodeUtil = interface; //com.gengcon.www.jcprintersdk.util.EncodeUtil
  JErrorCodeUtil = interface; //com.gengcon.www.jcprintersdk.util.ErrorCodeUtil
  JFileUtil = interface; //com.gengcon.www.jcprintersdk.util.FileUtil
  JFirmwareFileParsingUtil = interface; //com.gengcon.www.jcprintersdk.util.FirmwareFileParsingUtil
  JFontUtil = interface; //com.gengcon.www.jcprintersdk.util.FontUtil
//  JLogFileUtils_1 = interface; //com.gengcon.www.jcprintersdk.util.LogFileUtils$1
  JLogFileUtils = interface; //com.gengcon.www.jcprintersdk.util.LogFileUtils
  JSCCtlOps_Flag = interface; //com.gengcon.www.jcprintersdk.util.SCCtlOps$Flag
  JSCCtlOps_Flag_Other = interface; //com.gengcon.www.jcprintersdk.util.SCCtlOps$Flag_Other
  JSCCtlOps_ScanACK = interface; //com.gengcon.www.jcprintersdk.util.SCCtlOps$ScanACK
  JSCCtlOps_SoftAPMode_Param = interface; //com.gengcon.www.jcprintersdk.util.SCCtlOps$SoftAPMode_Param
  JSCCtlOps = interface; //com.gengcon.www.jcprintersdk.util.SCCtlOps
  JTestData = interface; //com.gengcon.www.jcprintersdk.util.TestData
//  JThreadUtil_1 = interface; //com.gengcon.www.jcprintersdk.util.ThreadUtil$1
//  JThreadUtil_2 = interface; //com.gengcon.www.jcprintersdk.util.ThreadUtil$2
//  JThreadUtil_3 = interface; //com.gengcon.www.jcprintersdk.util.ThreadUtil$3
  JThreadUtil = interface; //com.gengcon.www.jcprintersdk.util.ThreadUtil
  JUnitConversionUtil = interface; //com.gengcon.www.jcprintersdk.util.UnitConversionUtil
  JWifiSupport = interface; //com.gengcon.www.jcprintersdk.util.WifiSupport
//  Jv_402 = interface; //com.gengcon.www.jcprintersdk.v
//  Jv0_a = interface; //com.gengcon.www.jcprintersdk.v0$a
//  Jv0 = interface; //com.gengcon.www.jcprintersdk.v0
//  Jv1 = interface; //com.gengcon.www.jcprintersdk.v1
//  Jw_406 = interface; //com.gengcon.www.jcprintersdk.w
//  Jw0 = interface; //com.gengcon.www.jcprintersdk.w0
//  Jw1 = interface; //com.gengcon.www.jcprintersdk.w1
//  Jx_409 = interface; //com.gengcon.www.jcprintersdk.x
//  Jx0 = interface; //com.gengcon.www.jcprintersdk.x0
  Jx1 = interface; //com.gengcon.www.jcprintersdk.x1
//  Jy_412 = interface; //com.gengcon.www.jcprintersdk.y
//  Jy0 = interface; //com.gengcon.www.jcprintersdk.y0
//  Jy1 = interface; //com.gengcon.www.jcprintersdk.y1
//  Jz_415 = interface; //com.gengcon.www.jcprintersdk.z
//  Jz0 = interface; //com.gengcon.www.jcprintersdk.z0
//  Jz1 = interface; //com.gengcon.www.jcprintersdk.z1
  JAztecDetectorResult = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.AztecDetectorResult
  JAztecReader = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.AztecReader
  JAztecWriter = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.AztecWriter
//  JDecoder_1 = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.decoder.Decoder$1
  JDecoder_Table = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.decoder.Decoder$Table
  JDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.decoder.Decoder
  JDetector_Point = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.detector.Detector$Point
  JDetector = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.detector.Detector
  JAztecCode = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.encoder.AztecCode
  JBinaryShiftToken = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.encoder.BinaryShiftToken
  JEncoder = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.encoder.Encoder
//  JHighLevelEncoder_1 = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.encoder.HighLevelEncoder$1
  JHighLevelEncoder = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.encoder.HighLevelEncoder
  JSimpleToken = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.encoder.SimpleToken
  JState = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.encoder.State
  JToken = interface; //com.gengcon.www.jcprintersdk.zxing.aztec.encoder.Token
  JBarcodeFormat = interface; //com.gengcon.www.jcprintersdk.zxing.BarcodeFormat
  JBinarizer = interface; //com.gengcon.www.jcprintersdk.zxing.Binarizer
  JBinaryBitmap = interface; //com.gengcon.www.jcprintersdk.zxing.BinaryBitmap
  JChecksumException = interface; //com.gengcon.www.jcprintersdk.zxing.ChecksumException
  JBitArray = interface; //com.gengcon.www.jcprintersdk.zxing.common.BitArray
  JBitMatrix = interface; //com.gengcon.www.jcprintersdk.zxing.common.BitMatrix
  JBitSource = interface; //com.gengcon.www.jcprintersdk.zxing.common.BitSource
  JCharacterSetECI = interface; //com.gengcon.www.jcprintersdk.zxing.common.CharacterSetECI
  JDecoderResult = interface; //com.gengcon.www.jcprintersdk.zxing.common.DecoderResult
  JDefaultGridSampler = interface; //com.gengcon.www.jcprintersdk.zxing.common.DefaultGridSampler
  JMathUtils = interface; //com.gengcon.www.jcprintersdk.zxing.common.detector.MathUtils
  JWhiteRectangleDetector = interface; //com.gengcon.www.jcprintersdk.zxing.common.detector.WhiteRectangleDetector
  JDetectorResult = interface; //com.gengcon.www.jcprintersdk.zxing.common.DetectorResult
  JGridSampler = interface; //com.gengcon.www.jcprintersdk.zxing.common.GridSampler
  JPerspectiveTransform = interface; //com.gengcon.www.jcprintersdk.zxing.common.PerspectiveTransform
  JGenericGF = interface; //com.gengcon.www.jcprintersdk.zxing.common.reedsolomon.GenericGF
  JGenericGFPoly = interface; //com.gengcon.www.jcprintersdk.zxing.common.reedsolomon.GenericGFPoly
  JReedSolomonDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.common.reedsolomon.ReedSolomonDecoder
  JReedSolomonEncoder = interface; //com.gengcon.www.jcprintersdk.zxing.common.reedsolomon.ReedSolomonEncoder
  JReedSolomonException = interface; //com.gengcon.www.jcprintersdk.zxing.common.reedsolomon.ReedSolomonException
  JStringUtils = interface; //com.gengcon.www.jcprintersdk.zxing.common.StringUtils
  JDataMatrixReader = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.DataMatrixReader
  JDataMatrixWriter = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.DataMatrixWriter
  JBitMatrixParser = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.decoder.BitMatrixParser
  JDataBlock = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.decoder.DataBlock
//  JDecodedBitStreamParser_1 = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.decoder.DecodedBitStreamParser$1
  JDecodedBitStreamParser_Mode = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.decoder.DecodedBitStreamParser$Mode
  JDecodedBitStreamParser = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.decoder.DecodedBitStreamParser
//  JDecoder_462 = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.decoder.Decoder
//  JVersion_1 = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.decoder.Version$1
  JVersion_ECB = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.decoder.Version$ECB
  JVersion_ECBlocks = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.decoder.Version$ECBlocks
  JVersion = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.decoder.Version
//  JDetector_1 = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.detector.Detector$1
  JDetector_ResultPointsAndTransitions = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.detector.Detector$ResultPointsAndTransitions
  JDetector_ResultPointsAndTransitionsComparator = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.detector.Detector$ResultPointsAndTransitionsComparator
//  JDetector_470 = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.detector.Detector
  JASCIIEncoder = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.ASCIIEncoder
  JBase256Encoder = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.Base256Encoder
  JC40Encoder = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.C40Encoder
  JDataMatrixSymbolInfo144 = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.DataMatrixSymbolInfo144
  JDefaultPlacement = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.DefaultPlacement
  JEdifactEncoder = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.EdifactEncoder
//  JEncoder_477 = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.Encoder
  JEncoderContext = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.EncoderContext
  JErrorCorrection = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.ErrorCorrection
//  JHighLevelEncoder_480 = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.HighLevelEncoder
  JSymbolInfo = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.SymbolInfo
  JSymbolShapeHint = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.SymbolShapeHint
  JTextEncoder = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.TextEncoder
  JX12Encoder = interface; //com.gengcon.www.jcprintersdk.zxing.datamatrix.encoder.X12Encoder
  JDecodeHintType = interface; //com.gengcon.www.jcprintersdk.zxing.DecodeHintType
  JDimension = interface; //com.gengcon.www.jcprintersdk.zxing.Dimension
  JEncodeHintType = interface; //com.gengcon.www.jcprintersdk.zxing.EncodeHintType
  JFormatException = interface; //com.gengcon.www.jcprintersdk.zxing.FormatException
  JInvertedLuminanceSource = interface; //com.gengcon.www.jcprintersdk.zxing.InvertedLuminanceSource
  JLuminanceSource = interface; //com.gengcon.www.jcprintersdk.zxing.LuminanceSource
//  JBitMatrixParser_491 = interface; //com.gengcon.www.jcprintersdk.zxing.maxicode.decoder.BitMatrixParser
//  JDecodedBitStreamParser_492 = interface; //com.gengcon.www.jcprintersdk.zxing.maxicode.decoder.DecodedBitStreamParser
//  JDecoder_493 = interface; //com.gengcon.www.jcprintersdk.zxing.maxicode.decoder.Decoder
  JMaxiCodeReader = interface; //com.gengcon.www.jcprintersdk.zxing.maxicode.MaxiCodeReader
  JMultipleBarcodeReader = interface; //com.gengcon.www.jcprintersdk.zxing.multi.MultipleBarcodeReader
  JMultiFormatReader = interface; //com.gengcon.www.jcprintersdk.zxing.MultiFormatReader
//  JMultiFormatWriter_1 = interface; //com.gengcon.www.jcprintersdk.zxing.MultiFormatWriter$1
  JMultiFormatWriter = interface; //com.gengcon.www.jcprintersdk.zxing.MultiFormatWriter
  JNotFoundException = interface; //com.gengcon.www.jcprintersdk.zxing.NotFoundException
  JCodaBarReader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.CodaBarReader
  JCodaBarWriter = interface; //com.gengcon.www.jcprintersdk.zxing.oned.CodaBarWriter
  JCode128Reader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.Code128Reader
  JCode128Writer_CType = interface; //com.gengcon.www.jcprintersdk.zxing.oned.Code128Writer$CType
  JCode128Writer = interface; //com.gengcon.www.jcprintersdk.zxing.oned.Code128Writer
  JCode39Reader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.Code39Reader
  JCode39Writer = interface; //com.gengcon.www.jcprintersdk.zxing.oned.Code39Writer
  JCode93Reader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.Code93Reader
  JCode93Writer = interface; //com.gengcon.www.jcprintersdk.zxing.oned.Code93Writer
  JEAN13Reader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.EAN13Reader
  JEAN13Writer = interface; //com.gengcon.www.jcprintersdk.zxing.oned.EAN13Writer
  JEAN8Reader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.EAN8Reader
  JEAN8Writer = interface; //com.gengcon.www.jcprintersdk.zxing.oned.EAN8Writer
  JEANManufacturerOrgSupport = interface; //com.gengcon.www.jcprintersdk.zxing.oned.EANManufacturerOrgSupport
  JITFReader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.ITFReader
  JITFWriter = interface; //com.gengcon.www.jcprintersdk.zxing.oned.ITFWriter
  JMultiFormatOneDReader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.MultiFormatOneDReader
  JMultiFormatUPCEANReader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.MultiFormatUPCEANReader
  JOneDimensionalCodeWriter = interface; //com.gengcon.www.jcprintersdk.zxing.oned.OneDimensionalCodeWriter
  JOneDReader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.OneDReader
  JAbstractRSSReader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.AbstractRSSReader
  JDataCharacter = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.DataCharacter
  JBitArrayBuilder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.BitArrayBuilder
  JAbstractExpandedDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder
  JAI013103decoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AI013103decoder
  JAI01320xDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AI01320xDecoder
  JAI01392xDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AI01392xDecoder
  JAI01393xDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AI01393xDecoder
  JAI013x0x1xDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AI013x0x1xDecoder
  JAI013x0xDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AI013x0xDecoder
  JAI01AndOtherAIs = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AI01AndOtherAIs
  JAI01decoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AI01decoder
  JAI01weightDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AI01weightDecoder
  JAnyAIDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.AnyAIDecoder
  JBlockParsedResult = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.BlockParsedResult
  JCurrentParsingState_State = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.CurrentParsingState$State
  JCurrentParsingState = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.CurrentParsingState
  JDecodedChar = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.DecodedChar
  JDecodedInformation = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.DecodedInformation
  JDecodedNumeric = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.DecodedNumeric
  JDecodedObject = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.DecodedObject
  JFieldParser = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.FieldParser
  JGeneralAppIdDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.decoders.GeneralAppIdDecoder
  JExpandedPair = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.ExpandedPair
  JExpandedRow = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.ExpandedRow
  JRSSExpandedReader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.expanded.RSSExpandedReader
  JFinderPattern = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.FinderPattern
  JPair = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.Pair
  JRSS14Reader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.RSS14Reader
  JRSSUtils = interface; //com.gengcon.www.jcprintersdk.zxing.oned.rss.RSSUtils
  JUPCAReader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.UPCAReader
  JUPCAWriter = interface; //com.gengcon.www.jcprintersdk.zxing.oned.UPCAWriter
  JUPCEANExtension2Support = interface; //com.gengcon.www.jcprintersdk.zxing.oned.UPCEANExtension2Support
  JUPCEANExtension5Support = interface; //com.gengcon.www.jcprintersdk.zxing.oned.UPCEANExtension5Support
  JUPCEANExtensionSupport = interface; //com.gengcon.www.jcprintersdk.zxing.oned.UPCEANExtensionSupport
  JUPCEANReader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.UPCEANReader
  JUPCEANWriter = interface; //com.gengcon.www.jcprintersdk.zxing.oned.UPCEANWriter
  JUPCEReader = interface; //com.gengcon.www.jcprintersdk.zxing.oned.UPCEReader
  JUPCEWriter = interface; //com.gengcon.www.jcprintersdk.zxing.oned.UPCEWriter
  JBarcodeMetadata = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.BarcodeMetadata
  JBarcodeValue = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.BarcodeValue
  JBoundingBox = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.BoundingBox
  JCodeword = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.Codeword
//  JDecodedBitStreamParser_1_563 = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.DecodedBitStreamParser$1
//  JDecodedBitStreamParser_Mode_564 = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.DecodedBitStreamParser$Mode
//  JDecodedBitStreamParser_565 = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.DecodedBitStreamParser
  JDetectionResult = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.DetectionResult
  JDetectionResultColumn = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.DetectionResultColumn
  JDetectionResultRowIndicatorColumn = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.DetectionResultRowIndicatorColumn
//  JErrorCorrection_569 = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.ec.ErrorCorrection
  JModulusGF = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.ec.ModulusGF
  JModulusPoly = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.ec.ModulusPoly
  JPDF417CodewordDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.PDF417CodewordDecoder
  JPDF417ScanningDecoder = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.decoder.PDF417ScanningDecoder
//  JDetector_574 = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.detector.Detector
  JPDF417DetectorResult = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.detector.PDF417DetectorResult
  JBarcodeMatrix = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.encoder.BarcodeMatrix
  JBarcodeRow = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.encoder.BarcodeRow
  JCompaction = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.encoder.Compaction
  JDimensions = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.encoder.Dimensions
  JPDF417 = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.encoder.PDF417
  JPDF417ErrorCorrection = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.encoder.PDF417ErrorCorrection
//  JPDF417HighLevelEncoder_1 = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.encoder.PDF417HighLevelEncoder$1
  JPDF417HighLevelEncoder = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.encoder.PDF417HighLevelEncoder
  JPDF417Common = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.PDF417Common
  JPDF417Reader = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.PDF417Reader
  JPDF417ResultMetadata = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.PDF417ResultMetadata
  JPDF417Writer = interface; //com.gengcon.www.jcprintersdk.zxing.pdf417.PDF417Writer
//  JBitMatrixParser_588 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.BitMatrixParser
//  JDataBlock_589 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DataBlock
//  JDataMask_1 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DataMask$1
//  JDataMask_2 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DataMask$2
//  JDataMask_3 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DataMask$3
//  JDataMask_4 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DataMask$4
//  JDataMask_5 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DataMask$5
//  JDataMask_6 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DataMask$6
//  JDataMask_7 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DataMask$7
//  JDataMask_8 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DataMask$8
  JDataMask = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DataMask
//  JDecodedBitStreamParser_1_599 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DecodedBitStreamParser$1
//  JDecodedBitStreamParser_600 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.DecodedBitStreamParser
//  JDecoder_601 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.Decoder
  JErrorCorrectionLevel = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.ErrorCorrectionLevel
  JFormatInformation = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.FormatInformation
  JMode = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.Mode
  JQRCodeDecoderMetaData = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.QRCodeDecoderMetaData
//  JVersion_ECB_606 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.Version$ECB
//  JVersion_ECBlocks_607 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.Version$ECBlocks
//  JVersion_608 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.decoder.Version
  JAlignmentPattern = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.detector.AlignmentPattern
  JAlignmentPatternFinder = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.detector.AlignmentPatternFinder
//  JDetector_611 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.detector.Detector
//  JFinderPattern_612 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.detector.FinderPattern
//  JFinderPatternFinder_1 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.detector.FinderPatternFinder$1
  JFinderPatternFinder_CenterComparator = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.detector.FinderPatternFinder$CenterComparator
  JFinderPatternFinder_FurthestFromAverageComparator = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.detector.FinderPatternFinder$FurthestFromAverageComparator
  JFinderPatternFinder = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.detector.FinderPatternFinder
  JFinderPatternInfo = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.detector.FinderPatternInfo
  JBlockPair = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.encoder.BlockPair
  JByteMatrix = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.encoder.ByteMatrix
//  JEncoder_1 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.encoder.Encoder$1
//  JEncoder_621 = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.encoder.Encoder
  JMaskUtil = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.encoder.MaskUtil
  JMatrixUtil = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.encoder.MatrixUtil
  JQRCode = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.encoder.QRCode
  JQRCodeReader = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.QRCodeReader
  JQRCodeWriter = interface; //com.gengcon.www.jcprintersdk.zxing.qrcode.QRCodeWriter
  JReader = interface; //com.gengcon.www.jcprintersdk.zxing.Reader
  JReaderException = interface; //com.gengcon.www.jcprintersdk.zxing.ReaderException
  JResult = interface; //com.gengcon.www.jcprintersdk.zxing.Result
  JResultMetadataType = interface; //com.gengcon.www.jcprintersdk.zxing.ResultMetadataType
  JResultPoint = interface; //com.gengcon.www.jcprintersdk.zxing.ResultPoint
  JResultPointCallback = interface; //com.gengcon.www.jcprintersdk.zxing.ResultPointCallback
  JWriter = interface; //com.gengcon.www.jcprintersdk.zxing.Writer
  JWriterException = interface; //com.gengcon.www.jcprintersdk.zxing.WriterException
  JSCJNI_Args = interface; //com.realtek.simpleconfiglib.SCJNI$Args
  JSCJNI_Args_SoftAP = interface; //com.realtek.simpleconfiglib.SCJNI$Args_SoftAP
  JSCJNI = interface; //com.realtek.simpleconfiglib.SCJNI
//  JSCLibrary_1_1 = interface; //com.realtek.simpleconfiglib.SCLibrary$1$1
//  JSCLibrary_1 = interface; //com.realtek.simpleconfiglib.SCLibrary$1
//  JSCLibrary_2 = interface; //com.realtek.simpleconfiglib.SCLibrary$2
//  JSCLibrary_3 = interface; //com.realtek.simpleconfiglib.SCLibrary$3
  JSCLibrary_Utils = interface; //com.realtek.simpleconfiglib.SCLibrary$Utils
  JSCLibrary = interface; //com.realtek.simpleconfiglib.SCLibrary
  JSCNetworkOps = interface; //com.realtek.simpleconfiglib.SCNetworkOps
  JSCParam_Flag = interface; //com.realtek.simpleconfiglib.SCParam$Flag
  JSCParam_Flag_Other = interface; //com.realtek.simpleconfiglib.SCParam$Flag_Other
  JSCParam_R3_UDPUcast = interface; //com.realtek.simpleconfiglib.SCParam$R3_UDPUcast
  JSCParam_RecvACK = interface; //com.realtek.simpleconfiglib.SCParam$RecvACK
  JSCParam_SoftAPMode_Param = interface; //com.realtek.simpleconfiglib.SCParam$SoftAPMode_Param
  JSCParam_UDPBcast = interface; //com.realtek.simpleconfiglib.SCParam$UDPBcast
  JSCParam_UDPUcast = interface; //com.realtek.simpleconfiglib.SCParam$UDPUcast
  JSCParam = interface; //com.realtek.simpleconfiglib.SCParam
  JGZIPFrame = interface; //zpSDK.zpSDK.GZIPFrame
  JPrinterInterface = interface; //zpSDK.zpSDK.PrinterInterface
//  JzpBluetoothPrinter_print = interface; //zpSDK.zpSDK.zpBluetoothPrinter$print
//  JzpBluetoothPrinter__fontstyle = interface; //zpSDK.zpSDK.zpBluetoothPrinter$_fontstyle
  JzpBluetoothPrinter = interface; //zpSDK.zpSDK.zpBluetoothPrinter
  J_PrinterPageImpl = interface; //zpSDK.zpSDK._PrinterPageImpl

// ===== Forward SuperClasses declarations =====
////////////////////////////////////////////////////////////////////////////////////////////


//  JcClass = interface(JObjectClass)
//  ['{E935B2B3-3E21-44DC-9E01-3EE7FE7CD5A3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JMap): Jc; cdecl;
//    {class} function a(P1: Jb): JBitmap; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: Jj): JBitmap; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: JBitmap_Config): JBitmap; cdecl; overload;
//    {class} function a(P1: Integer): Integer; cdecl; overload;
//    {class} function a(P1: Integer; P2: Boolean): Boolean; cdecl; overload;
//    {class} function a(P1: Integer; P2: JString): JString; cdecl; overload;
//    {class} function a(P1: JContext; P2: JBroadcastReceiver; P3: JIntentFilter): JIntent; cdecl; overload;
//    {class} procedure a(P1: JContext; P2: JBroadcastReceiver); cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/a/a/c')]
//  Jc = interface(JObject)
//  ['{61931FB2-EB9D-41B2-AD3D-096311F2D7DD}']
//    { Property Methods }
//    function _Geta: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JString; P2: Integer; P3: Integer): Jd; cdecl; overload;
//    function a(P1: JString): JString; cdecl; overload;
//    function b(P1: JString): JMap; cdecl;
//
//    { Property }
//    property a: JMap read _Geta write _Seta;
//  end;
//
//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  JaClass = interface(JcClass) // or JObjectClass
//  ['{31EF8D23-F591-457C-ABBF-A5AD17656585}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja; cdecl; overload;
//    {class} function init(P1: Ja; P2: JMap): Ja; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/a/a/a')]
//  Ja = interface(Jc) // or JObject
//  ['{35F40A06-EB22-45FA-B11D-85541B64FBB5}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): JString; cdecl; overload;
//    function a(P1: JString; P2: Integer; P3: Integer): Jd; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  JbClass = interface(JObjectClass)
//  ['{4494EBB6-8B42-4D44-894F-0660A6BBD30F}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jb; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/a/a/b')]
//  Jb = interface(JObject)
//  ['{E1F3BE5E-5D8F-4C0E-AB3D-67FDE24FDCD7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JdClass = interface(JObjectClass)
//  ['{E7C132EC-EF66-436C-97AC-6EAC965D561C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jg; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Jb): Jd; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/a/a/d')]
//  Jd = interface(JObject)
//  ['{EE067AF8-CD01-43CC-A443-33B2845F9DFD}']
//    { Property Methods }
//    function _Geta: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jb);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: Jb read _Geta write _Seta;
//  end;
//
//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  JeClass = interface(JcClass) // or JObjectClass
//  ['{F94396BC-B6DF-43D0-BCF9-6AB5BC1A9E7F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je; cdecl; overload;
//    {class} function init(P1: JMap): Je; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/a/a/e')]
//  Je = interface(Jc) // or JObject
//  ['{3D95CE5A-D7E1-4C0A-8BEA-F19739CEC47A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): JString; cdecl; overload;
//    function b(P1: JString): JMap; cdecl;
//    function a(P1: JString; P2: Integer; P3: Integer): Jd; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  Ja_aClass = interface(JBluetoothGattCallbackClass) // or JObjectClass
//  ['{B6F0D341-25AD-4297-95A4-2B4B0C699C1C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja): Ja_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/a$a')]
//  Ja_a = interface(JBluetoothGattCallback) // or JObject
//  ['{6AEC2CCB-77C2-4CAA-AC03-F44858368293}']
//    { Property Methods }
//    function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Ja);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onConnectionStateChange(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
//    procedure onServicesDiscovered(P1: JBluetoothGatt; P2: Integer); cdecl;
//    procedure onDescriptorWrite(P1: JBluetoothGatt; P2: JBluetoothGattDescriptor; P3: Integer); cdecl;
//    procedure onReadRemoteRssi(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
//    procedure onCharacteristicWrite(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic; P3: Integer); cdecl;
//    procedure onCharacteristicChanged(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic); cdecl;
//
//    { Property }
//    property a: Ja read _Geta write _Seta;
//  end;
//
//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  JaqClass = interface(JObjectClass)
//  ['{2EE9D63F-C5F5-4AD1-AA0A-9E9CC079636F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Jaq; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/aq')]
//  Jaq = interface(JObject)
//  ['{85740376-9474-48A5-BAEF-A9D87D85F02F}']
//    { Property Methods }
//    function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl; overload;
//    procedure b(P1: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: JObject); cdecl; overload;
//    function c(P1: Integer): Integer; cdecl; overload;
//    function b(P1: Integer; P2: Integer): Integer; cdecl; overload;
//    function b(P1: Integer; P2: Integer; P3: JObject): Integer; cdecl; overload;
//    function c(P1: Integer; P2: Integer; P3: JObject): Boolean; cdecl; overload;
//    function a(P1: JRunnable): Boolean; cdecl; overload;
//    function d(P1: Integer): Boolean; cdecl; overload;
//    procedure a(P1: Int64); cdecl; overload;
//    procedure b(P1: Int64); cdecl; overload;
//    procedure c(P1: Int64); cdecl; overload;
//    procedure d(P1: Int64); cdecl; overload;
//    procedure b; cdecl; overload;
//    procedure c; cdecl; overload;
//    procedure d; cdecl; overload;
//    procedure e; cdecl;
//    function f: Boolean; cdecl;
//    function g: Boolean; cdecl;
//    procedure h; cdecl;
//
//    { Property }
//    property f: Integer read _Getf write _Setf;
//  end;
//
//  TJaq = class(TJavaGenericImport<JaqClass, Jaq>) end;

//  Ja_006Class = interface(JaqClass) // or JObjectClass
//  ['{FFBB2BA3-1BBA-4410-88B5-F1DC1ABBA230}']
//    { static Property Methods }
//    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JContext): Ja_006; cdecl; overload;
//    {class} function init: Ja_006; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jw read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/b/a')]
//  Ja_006 = interface(Jaq) // or JObject
//  ['{3E5B40B5-6E2A-403F-8F06-313C9AE6F78A}']
//    { Property Methods }
//    function _Getb: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JBluetoothDevice;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JBluetoothDevice);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JBluetoothGatt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JBluetoothGatt);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Jp_a); cdecl; overload;
//    procedure a(P1: JBluetoothDevice; P2: JIDzPrinter_PrinterState); cdecl; overload;
//    procedure a(P1: Jb); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    function b(P1: JString): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Boolean; cdecl; overload;
//    function b(P1: Boolean): Boolean; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl; overload;
//    function a(P1: JBluetoothGatt): Boolean; cdecl; overload;
//
//    { Property }
//    property b: JContext read _Getb write _Setb;
//    property c: JBluetoothDevice read _Getc write _Setc;
//    property d: JBluetoothGatt read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//  end;
//
//  TJa_006 = class(TJavaGenericImport<Ja_006Class, Ja_006>) end;

//  Jb_007Class = interface(JObjectClass)
//  ['{A666582C-7532-4490-B669-1926A29EDD53}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja; P2: JBluetoothDevice): Jb_007; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/b')]
//  Jb_007 = interface(JObject)
//  ['{ACB8B7E1-C2E8-4829-BDBF-A7B5715A8DBF}']
//    { Property Methods }
//    function _Geta: JBluetoothDevice;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JBluetoothDevice);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Ja);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JBluetoothDevice read _Geta write _Seta;
//    property b: Ja read _Getb write _Setb;
//  end;
//
//  TJb_007 = class(TJavaGenericImport<Jb_007Class, Jb_007>) end;

//  Jc_008Class = interface(JObjectClass)
//  ['{FA74740A-15E4-4C8F-AFEE-7C597980B9CD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb; P2: JBluetoothGatt): Jc_008; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/c')]
//  Jc_008 = interface(JObject)
//  ['{6F7B6D8D-3826-437A-A343-40E891AC5D6F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJc_008 = class(TJavaGenericImport<Jc_008Class, Jc_008>) end;

//  Jd_009Class = interface(JObjectClass)
//  ['{6FFAB15B-C544-4076-9290-5320CC477E27}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja; P2: JBluetoothGatt; P3: JBluetoothDevice): Jd_009; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/d')]
//  Jd_009 = interface(JObject)
//  ['{75ED603F-D5B6-42FF-9B50-50FC90D26A80}']
//    { Property Methods }
//    function _Geta: JBluetoothDevice;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JBluetoothDevice);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Ja);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JBluetoothDevice read _Geta write _Seta;
//    property b: Ja read _Getb write _Setb;
//  end;
//
//  TJd_009 = class(TJavaGenericImport<Jd_009Class, Jd_009>) end;

//  Je_010Class = interface(JObjectClass)
//  ['{A017FF33-D605-4E5D-8C48-481C5A9EE113}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Je_010; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/e')]
//  Je_010 = interface(JObject)
//  ['{4944FA6A-230C-47FD-A3CA-B306D2B234C5}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJe_010 = class(TJavaGenericImport<Je_010Class, Je_010>) end;

//  JpClass = interface(JObjectClass)
//  ['{897B4CFE-912E-40F3-89F6-F19907E57939}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jp; cdecl; overload;
//    {class} function init: Jp; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/p')]
//  Jp = interface(JObject)
//  ['{67B00128-9904-4346-9308-BF1C985AE19C}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jp_a); cdecl; overload;
//    procedure a(P1: Jb); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: Byte); cdecl; overload;
//    procedure a(P1: TJavaArray<Byte>); cdecl; overload;
//
//    { Property }
//  end;
//
//  TJp = class(TJavaGenericImport<JpClass, Jp>) end;

//  JfClass = interface(JpClass) // or JObjectClass
//  ['{F278E11B-361F-4107-A682-22EB514ADC49}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja): Jf; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/f')]
//  Jf = interface(Jp) // or JObject
//  ['{D1FE4462-1CD0-496A-B7CF-2AC28EA01089}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jb); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//  end;
//
//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

//  JgClass = interface(JObjectClass)
//  ['{209A71DC-5E44-4529-9CC9-EC0551A3B0A6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja_a; P2: JBluetoothGatt; P3: Integer; P4: Integer): Jg; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/g')]
//  Jg = interface(JObject)
//  ['{D7FF7B43-F9BA-40B7-A1CA-3DCEF50BD4DC}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  JhClass = interface(JObjectClass)
//  ['{EBE5EEB5-6435-49FD-BECC-95246F8E2EF3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja_a; P2: JBluetoothGatt; P3: Integer): Jh; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/h')]
//  Jh = interface(JObject)
//  ['{C9F52FCD-206F-4F95-8367-D86E707ABE03}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJh = class(TJavaGenericImport<JhClass, Jh>) end;

//  JiClass = interface(JObjectClass)
//  ['{AABE959D-1005-45E7-845E-7D9D5363DA79}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja_a; P2: JBluetoothGatt; P3: Integer): Ji; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/i')]
//  Ji = interface(JObject)
//  ['{864321A5-6CFC-4707-8371-9F737EB5E4BD}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJi = class(TJavaGenericImport<JiClass, Ji>) end;

//  JjClass = interface(JObjectClass)
//  ['{149B2209-FF61-4E3F-B862-510DF732CB66}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja_a; P2: JBluetoothGatt; P3: Integer; P4: Integer): Jj; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/j')]
//  Jj = interface(JObject)
//  ['{8C8BDE1C-4EBD-4B63-95FD-3AE9E79D9FB9}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJj = class(TJavaGenericImport<JjClass, Jj>) end;

//  JkClass = interface(JObjectClass)
//  ['{0D5125B3-4825-42D0-9A59-27B45FF876DD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja_a; P2: JBluetoothGatt; P3: Integer): Jk; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/k')]
//  Jk = interface(JObject)
//  ['{BD64D9CD-5440-4BF7-BFF2-8627DA6DE91C}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJk = class(TJavaGenericImport<JkClass, Jk>) end;

//  JlClass = interface(JObjectClass)
//  ['{32A41417-0A06-4AB4-9B49-3CCC4E685EC3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja_a; P2: JBluetoothGatt; P3: TJavaArray<Byte>): Jl; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/l')]
//  Jl = interface(JObject)
//  ['{A4DF475D-2E58-4630-ADC8-AAC588F79D05}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJl = class(TJavaGenericImport<JlClass, Jl>) end;

//  Jm_aClass = interface(JObjectClass)
//  ['{27D2354E-8CEE-4BE9-9255-FCFE689C0478}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/m$a')]
//  Jm_a = interface(JObject)
//  ['{F5F0B305-5E4A-4647-88D0-F0AE3743ED66}']
//    { Property Methods }
//    function _Geta: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jm_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jm_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Boolean; cdecl;
//    function clone: JObject; cdecl;
//
//    { Property }
//    property a: Word read _Geta write _Seta;
//    property b: Word read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: Jm_b read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: Integer read _Getf write _Setf;
//    property g: Integer read _Getg write _Setg;
//  end;
//
//  TJm_a = class(TJavaGenericImport<Jm_aClass, Jm_a>) end;

//  Jm_bClass = interface(JEnumClass) // or JObjectClass
//  ['{7CC9921E-3F36-4A21-8F34-603B5B3D3E4A}']
//    { static Property Methods }
//    {class} function _Geta: Jm_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jm_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jm_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jm_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jm_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jm_b>; cdecl;
//    {class} function valueOf(P1: JString): Jm_b; cdecl;
//    {class} function init: Jm_b; cdecl;
//
//    { static Property }
//    {class} property a: Jm_b read _Geta;
//    {class} property b: Jm_b read _Getb;
//    {class} property c: Jm_b read _Getc;
//    {class} property d: Jm_b read _Getd;
//    {class} property e: Jm_b read _Gete;
//  end;
//
//  [JavaSignature('com/dothantech/b/m$b')]
//  Jm_b = interface(JEnum) // or JObject
//  ['{9C3CF22A-3398-4861-9FBB-B8B66920F286}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJm_b = class(TJavaGenericImport<Jm_bClass, Jm_b>) end;

//  JmClass = interface(JObjectClass)
//  ['{C254AD92-08AD-41BA-8FF0-E62F0F077E8F}']
//    { static Property Methods }
//    {class} function _Geta: JUUID;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jm; cdecl; overload;
//    {class} function a: JSet; cdecl; overload;
//    {class} function a(P1: JString): JBluetoothDevice; cdecl; overload;
//    {class} function a(P1: JBluetoothAdapter; P2: JString): JBluetoothDevice; cdecl; overload;
//    {class} function b(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: JBluetoothDevice): JString; cdecl; overload;
//    {class} function b(P1: JBluetoothDevice): JIDzPrinter_AddressType; cdecl; overload;
//    {class} function c(P1: JString): JIDzPrinter_AddressType; cdecl; overload;
//    {class} function c(P1: JBluetoothDevice): JIDzPrinter_PrinterAddress; cdecl; overload;
//    {class} function d(P1: JString): Integer; cdecl; overload;
//    {class} function d(P1: JBluetoothDevice): Boolean; cdecl; overload;
//    {class} function a(P1: JBluetoothDevice; P2: JString): Boolean; cdecl; overload;
//    {class} procedure a(P1: JBluetoothSocket); cdecl; overload;
//    {class} procedure b; cdecl; overload;
//    {class} function e(P1: JString): JString; cdecl; overload;
//    {class} function e(P1: JBluetoothDevice): Jm_b; cdecl; overload;
//    {class} function f(P1: JString): Jm_b; cdecl; overload;
//    {class} function a(P1: JString; P2: Jm_a): Jm_b; cdecl; overload;
//    {class} function f(P1: JBluetoothDevice): Boolean; cdecl; overload;
//    {class} function g(P1: JString): Boolean; cdecl;
//    {class} function h(P1: JString): JIDzPrinter_PrinterAddress; cdecl;
//    {class} function init: Jm; cdecl; overload;
//
//    { static Property }
//    {class} property a: JUUID read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/b/m')]
//  Jm = interface(JObject)
//  ['{1D18B697-2EDF-4B17-ADED-3C80F9EC261D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJm = class(TJavaGenericImport<JmClass, Jm>) end;

//  JnClass = interface(JObjectClass)
//  ['{754169DB-4A88-409A-B143-39B201C2D301}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jn; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/b/n')]
//  Jn = interface(JObject)
//  ['{B3FA19A1-C080-4596-BA4F-54414682761B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJn = class(TJavaGenericImport<JnClass, Jn>) end;

//  JoClass = interface(JObjectClass)
//  ['{D663E476-F0E9-4185-8DFC-1530D4EE4818}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jm_a): Jm_b; cdecl;
//    {class} function init: Jo; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/o')]
//  Jo = interface(JObject)
//  ['{0A07B2FD-C2BD-43FF-AE55-707060F170D5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJo = class(TJavaGenericImport<JoClass, Jo>) end;

//  Jp_aClass = interface(JObjectClass)
//  ['{5A51B7FB-9A29-4AAB-B9B4-FEA7F06CD943}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/p$a')]
//  Jp_a = interface(IJavaInstance)
//  ['{C1D8D631-AF1C-474F-907D-98DC05E1CA3A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJp_a = class(TJavaGenericImport<Jp_aClass, Jp_a>) end;

//  JsClass = interface(JObjectClass)
//  ['{71A9D0A9-4BEE-4FBD-9E74-F9CE8FE994B0}']
//    { static Property Methods }
//    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JInputStream): Js; cdecl; overload;
//    {class} function init: Js; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jw read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/b/s')]
//  Js = interface(JObject)
//  ['{4A7C918B-CFE9-443F-B1EA-EAF0B710A6A3}']
//    { Property Methods }
//    function _Getb: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Byte); cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//    property b: JInputStream read _Getb write _Setb;
//  end;
//
//  TJs = class(TJavaGenericImport<JsClass, Js>) end;

//  JqClass = interface(JsClass) // or JObjectClass
//  ['{F37EA944-72E7-4AEC-9B44-E756CFD0ABFE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JInputStream): Jq; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/q')]
//  Jq = interface(Js) // or JObject
//  ['{3E15EECA-87BC-43D1-9724-50BBF9BB817A}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jp_a); cdecl; overload;
//    procedure a(P1: Jb); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: Byte); cdecl; overload;
//
//    { Property }
//  end;
//
//  TJq = class(TJavaGenericImport<JqClass, Jq>) end;

//  JrClass = interface(JpClass) // or JObjectClass
//  ['{38D7DF87-3ED6-456D-BED0-10AAA5FF086B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jq): Jr; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/r')]
//  Jr = interface(Jp) // or JObject
//  ['{82C3345A-F2EC-41A4-A051-9EE787016DE0}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jb); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//  end;
//
//  TJr = class(TJavaGenericImport<JrClass, Jr>) end;

//  JtClass = interface(JThreadClass) // or JObjectClass
//  ['{B3174128-1560-4875-8F0C-2DA9F8C6324C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Jt; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/b/t')]
//  Jt = interface(JThread) // or JObject
//  ['{C3855ADC-C37D-4EC5-A642-0C5F23589911}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJt = class(TJavaGenericImport<JtClass, Jt>) end;

//  Ja_029Class = interface(JObjectClass)
//  ['{25335975-8DF4-49B8-96FB-87769623855A}']
//    { static Property Methods }
//    {class} function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function b(P1: Integer; P2: Integer): Integer; cdecl; overload;
//    {class} function init: Ja_029; cdecl;
//
//    { static Property }
//    {class} property a: Ja read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/c/a/a/a')]
//  Ja_029 = interface(JObject)
//  ['{76D8C23E-ADE6-4202-B9CF-7D2B7AAF4E89}']
//    { Property Methods }
//
//    { methods }
//    function a: Jb; cdecl; overload;
//    function a(P1: Integer; P2: Integer): Jb; cdecl; overload;
//    function a(P1: Integer): Integer; cdecl; overload;
//    function b(P1: Integer): Integer; cdecl; overload;
//    function c(P1: Integer): Integer; cdecl; overload;
//    function c(P1: Integer; P2: Integer): Integer; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;
//
//  TJa_029 = class(TJavaGenericImport<Ja_029Class, Ja_029>) end;

//  Jb_030Class = interface(JObjectClass)
//  ['{A26D3B23-3E1A-403F-A91E-CD7CD0F72899}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja; P2: TJavaArray<Integer>): Jb_030; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/a/a/b')]
//  Jb_030 = interface(JObject)
//  ['{DBE860B9-9C1B-4CE1-80E1-4B1FCFF40499}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaArray<Integer>; cdecl; overload;
//    function a(P1: Jb): Jb; cdecl; overload;
//    function a(P1: Integer; P2: Integer): Jb; cdecl; overload;
//    function b(P1: Jb): TJavaObjectArray<Jb>; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;
//
//  TJb_030 = class(TJavaGenericImport<Jb_030Class, Jb_030>) end;

//  Jc_031Class = interface(JObjectClass)
//  ['{E529F1CA-D130-4A2E-9997-177EE0C13016}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja): Jc_031; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/a/a/c')]
//  Jc_031 = interface(JObject)
//  ['{3669FF8C-60E7-438C-BE75-21A519F3BD59}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Integer>; P2: Integer); cdecl;
//
//    { Property }
//  end;
//
//  TJc_031 = class(TJavaGenericImport<Jc_031Class, Jc_031>) end;

//  Ja_032Class = interface(JObjectClass)
//  ['{C2E29BB9-8F9B-4002-BAA9-97C189734DDE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_032; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/a/a')]
//  Ja_032 = interface(JObject)
//  ['{4C890BEE-A7A0-40A6-AA5A-DA93738CAC3C}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function a(P1: Integer): Boolean; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: Ja); cdecl; overload;
//    procedure b(P1: Ja); cdecl; overload;
//    procedure a(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer); cdecl; overload;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//    function clone: JObject; cdecl;
//
//    { Property }
//  end;
//
//  TJa_032 = class(TJavaGenericImport<Ja_032Class, Ja_032>) end;

//  Jb_033Class = interface(JObjectClass)
//  ['{3E20231A-17BE-4163-A4B6-D1FCDEF30852}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): Jb_033; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/a/b')]
//  Jb_033 = interface(JObject)
//  ['{CFFDA353-2527-492D-ACD4-BEF2AA9F8D3A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl; overload;
//    function a: Integer; cdecl; overload;
//    function b: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//    function clone: JObject; cdecl;
//
//    { Property }
//  end;
//
//  TJb_033 = class(TJavaGenericImport<Jb_033Class, Jb_033>) end;

//  Jc_034Class = interface(JEnumClass) // or JObjectClass
//  ['{C82AF726-EDC2-497B-94FF-E04E53A26345}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jc>; cdecl;
//    {class} function valueOf(P1: JString): Jc; cdecl;
//    {class} function a(P1: JString): Jc; cdecl; overload;
//    {class} function init: Jc_034; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/a/c')]
//  Jc_034 = interface(JEnum) // or JObject
//  ['{A47427A7-CF77-4F5F-B612-47729AD1555A}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJc_034 = class(TJavaGenericImport<Jc_034Class, Jc_034>) end;

//  Ja_035Class = interface(JEnumClass) // or JObjectClass
//  ['{D7E70277-AFAB-44A8-AB0C-5E9974BA0E71}']
//    { static Property Methods }
//    {class} function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getq: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ja>; cdecl;
//    {class} function valueOf(P1: JString): Ja; cdecl;
//    {class} function init: Ja_035; cdecl;
//
//    { static Property }
//    {class} property a: Ja read _Geta;
//    {class} property b: Ja read _Getb;
//    {class} property c: Ja read _Getc;
//    {class} property d: Ja read _Getd;
//    {class} property e: Ja read _Gete;
//    {class} property f: Ja read _Getf;
//    {class} property g: Ja read _Getg;
//    {class} property h: Ja read _Geth;
//    {class} property i: Ja read _Geti;
//    {class} property j: Ja read _Getj;
//    {class} property k: Ja read _Getk;
//    {class} property l: Ja read _Getl;
//    {class} property m: Ja read _Getm;
//    {class} property n: Ja read _Getn;
//    {class} property o: Ja read _Geto;
//    {class} property p: Ja read _Getp;
//    {class} property q: Ja read _Getq;
//  end;
//
//  [JavaSignature('com/dothantech/c/a')]
//  Ja_035 = interface(JEnum) // or JObject
//  ['{72833FFD-4213-4B74-A4E1-B52AFDD0FBE3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_035 = class(TJavaGenericImport<Ja_035Class, Ja_035>) end;

//  Jk_055Class = interface(JObjectClass)
//  ['{F84EE7D5-4FEF-41A6-9B73-496BEC6E3DCD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk_055; cdecl;
//    {class} function a(P1: TJavaArray<Boolean>; P2: Integer; P3: TJavaArray<Integer>; P4: Boolean): Integer; cdecl; overload;
//    {class} function c(P1: JString): TJavaArray<Boolean>; cdecl;
//    {class} function a(P1: Ja; P2: JString; P3: Integer; P4: Char): Jg; cdecl; overload;
//    {class} function a(P1: Ja; P2: JString; P3: Integer; P4: JString; P5: Char): Jg; cdecl; overload;
//    {class} function a(P1: Ja; P2: JString; P3: Integer; P4: Jg; P5: Char): Jg; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/k')]
//  Jk_055 = interface(JObject)
//  ['{F4166A74-11A9-4ECF-B955-EC7A12658E07}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJk_055 = class(TJavaGenericImport<Jk_055Class, Jk_055>) end;

//  Ja_036Class = interface(Jk_055Class) // or JObjectClass
//  ['{C9F4B060-177A-4C26-B07C-8AC9958A4B74}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_036; cdecl; overload;
//    {class} function init: Ja_036; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/a')]
//  Ja_036 = interface(Jk_055) // or JObject
//  ['{F0DE58C6-2F2C-4179-A829-C2F7E81868F8}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJa_036 = class(TJavaGenericImport<Ja_036Class, Ja_036>) end;

//  Jb_037Class = interface(Jk_055Class) // or JObjectClass
//  ['{F1FF7872-F950-4F47-8D19-55F1860E5D93}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_037; cdecl; overload;
//    {class} function init: Jb_037; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/b')]
//  Jb_037 = interface(Jk_055) // or JObject
//  ['{D35D1B4E-0802-4A2C-9028-ED4356A2B24E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJb_037 = class(TJavaGenericImport<Jb_037Class, Jb_037>) end;

//  Jg_046Class = interface(JObjectClass)
//  ['{CB7BF2B7-8D2A-46CA-B521-50A223DB0241}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg_046; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/g')]
//  Jg_046 = interface(JObject)
//  ['{9F39B9BB-EAC4-446A-8AB1-858D7F40F945}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJg_046 = class(TJavaGenericImport<Jg_046Class, Jg_046>) end;

//  Jc_038Class = interface(Jg_046Class) // or JObjectClass
//  ['{B50C6C10-8FE3-4EEA-A3C7-FE2BC895832C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb): Jc_038; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/c')]
//  Jc_038 = interface(Jg_046) // or JObject
//  ['{AF4FD398-1BAA-4D91-A16F-36A1F17E53E3}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJc_038 = class(TJavaGenericImport<Jc_038Class, Jc_038>) end;

//  Jd_041Class = interface(Jk_055Class) // or JObjectClass
//  ['{9B3864CC-24AE-4B3E-80A1-E6D32A96E74B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_041; cdecl; overload;
//    {class} function init: Jd_041; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/d')]
//  Jd_041 = interface(Jk_055) // or JObject
//  ['{50734466-F316-4738-AA42-D8B6E6F2C61E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJd_041 = class(TJavaGenericImport<Jd_041Class, Jd_041>) end;

//  Jd_aClass = interface(Jd_041Class) // or JObjectClass
//  ['{E968A58C-A226-4BBA-A289-3F90FE482951}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_a; cdecl; overload;
//    {class} function init: Jd_a; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/d$a')]
//  Jd_a = interface(Jd_041) // or JObject
//  ['{DD163274-EF90-4673-A265-0A6CEDD0AE8F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJd_a = class(TJavaGenericImport<Jd_aClass, Jd_a>) end;

//  Jd_bClass = interface(Jd_041Class) // or JObjectClass
//  ['{8F173296-C49E-43F4-8FCA-5D676EA3257B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_b; cdecl; overload;
//    {class} function init: Jd_b; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/d$b')]
//  Jd_b = interface(Jd_041) // or JObject
//  ['{10BFF1B7-8849-4974-833F-68460B6F3944}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJd_b = class(TJavaGenericImport<Jd_bClass, Jd_b>) end;

//  Je_042Class = interface(Jg_046Class) // or JObjectClass
//  ['{4884FBFC-C79F-4B9D-9D97-2F9F73202F65}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd_a): Je_042; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/e')]
//  Je_042 = interface(Jg_046) // or JObject
//  ['{C8FF14A7-4E8A-4D52-950E-60C81B894E4C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJe_042 = class(TJavaGenericImport<Je_042Class, Je_042>) end;

//  Jf_043Class = interface(Jg_046Class) // or JObjectClass
//  ['{D4CF4403-84D9-4E8F-8C6F-8DEC57544690}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd_b): Jf_043; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/f')]
//  Jf_043 = interface(Jg_046) // or JObject
//  ['{4A64B7E0-5016-4178-BE72-7E65FEF1ED03}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJf_043 = class(TJavaGenericImport<Jf_043Class, Jf_043>) end;

//  Jg_aClass = interface(Jg_046Class) // or JObjectClass
//  ['{54FBCCE6-E2D4-428C-B364-7AC893BCC80A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/g$a')]
//  Jg_a = interface(Jg_046) // or JObject
//  ['{11704270-FA87-4625-87E1-E7CF5FF176AB}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJg_a = class(TJavaGenericImport<Jg_aClass, Jg_a>) end;

//  Jg_bClass = interface(Jg_046Class) // or JObjectClass
//  ['{ECE3ADE8-95C2-416B-8DE2-580DE45D8B73}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Jg_b; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/g$b')]
//  Jg_b = interface(Jg_046) // or JObject
//  ['{79993169-B19F-4AA3-9CEC-053943AB5A6E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJg_b = class(TJavaGenericImport<Jg_bClass, Jg_b>) end;

//  Jm_058Class = interface(Jk_055Class) // or JObjectClass
//  ['{41D3126A-D643-4451-82A6-3237A7607C47}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jm_058; cdecl; overload;
//    {class} function init: Jm_058; cdecl; overload;
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//    {class} property b: TJavaArray<Integer> read _Getb;
//    {class} property c: TJavaObjectArray<JString> read _Getc;
//    {class} property d: TJavaObjectArray<JString> read _Getd;
//    {class} property e: TJavaArray<TJavaArray<Integer>> read _Gete;
//    {class} property f: TJavaArray<TJavaArray<Integer>> read _Getf;
//    {class} property g: TJavaArray<TJavaArray<Integer>> read _Getg;
//  end;
//
//  [JavaSignature('com/dothantech/c/b/m')]
//  Jm_058 = interface(Jk_055) // or JObject
//  ['{10CC006E-5B11-4ACA-8C42-1F8A8AD04C2C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJm_058 = class(TJavaGenericImport<Jm_058Class, Jm_058>) end;

//  Jh_048Class = interface(Jm_058Class) // or JObjectClass
//  ['{9D9B4EE2-0E9D-4AFA-BF32-039448C7E8C8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_048; cdecl; overload;
//    {class} function init: Jh_048; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/h')]
//  Jh_048 = interface(Jm_058) // or JObject
//  ['{E0B0AF7C-F7BC-49F4-97C4-285664B0452B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJh_048 = class(TJavaGenericImport<Jh_048Class, Jh_048>) end;

//  Jh_aClass = interface(Jh_048Class) // or JObjectClass
//  ['{C8CBC4B8-71A8-4AA4-8D55-381C98D05FF9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/h$a')]
//  Jh_a = interface(Jh_048) // or JObject
//  ['{12D3E4E1-CDBA-4819-BB96-93F0E8F454B1}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJh_a = class(TJavaGenericImport<Jh_aClass, Jh_a>) end;

//  Ji_049Class = interface(Jm_058Class) // or JObjectClass
//  ['{BBD893A0-5020-451D-86D6-87D3E13732FF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji_049; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/i')]
//  Ji_049 = interface(Jm_058) // or JObject
//  ['{11616DC9-A281-45DA-9519-A9C2A0970271}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJi_049 = class(TJavaGenericImport<Ji_049Class, Ji_049>) end;

//  Jj_054Class = interface(Jk_055Class) // or JObjectClass
//  ['{17905705-3FAA-400E-BAD0-A48E0B0590ED}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jj_054; cdecl; overload;
//    {class} function a: TJavaArray<Integer>; cdecl; overload;
//    {class} function b: TJavaArray<Integer>; cdecl; overload;
//    {class} function init: Jj_054; cdecl; overload;
//
//    { static Property }
//    {class} property a: TJavaArray<TJavaArray<Integer>> read _Geta;
//    {class} property b: TJavaArray<TJavaArray<Integer>> read _Getb;
//  end;
//
//  [JavaSignature('com/dothantech/c/b/j')]
//  Jj_054 = interface(Jk_055) // or JObject
//  ['{035F12AE-E085-4030-8F20-576938BFC7D7}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//    function b(P1: JString): Jg; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJj_054 = class(TJavaGenericImport<Jj_054Class, Jj_054>) end;

//  Jj_aClass = interface(Jj_054Class) // or JObjectClass
//  ['{0F1B1D9E-8E1A-46E6-ADC5-9E3C7E51BE40}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/j$a')]
//  Jj_a = interface(Jj_054) // or JObject
//  ['{53AAD036-1A12-4C59-BBB6-F6D6F405DB02}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJj_a = class(TJavaGenericImport<Jj_aClass, Jj_a>) end;

//  Jj_bClass = interface(Jj_054Class) // or JObjectClass
//  ['{F007904E-CE94-4591-ACAB-1E80E9107E06}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_b; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/j$b')]
//  Jj_b = interface(Jj_054) // or JObject
//  ['{FE244E10-8432-47B1-AE84-3E9A079DE8DE}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJj_b = class(TJavaGenericImport<Jj_bClass, Jj_b>) end;

//  Jj_cClass = interface(Jj_054Class) // or JObjectClass
//  ['{113C477F-2B17-4748-9809-975B0F592FC5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_c; cdecl; overload;
//    {class} function init: Jj_c; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/j$c')]
//  Jj_c = interface(Jj_054) // or JObject
//  ['{27BE5CEB-7088-4D28-BF2A-D2848F3D8116}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJj_c = class(TJavaGenericImport<Jj_cClass, Jj_c>) end;

//  Jj_dClass = interface(Jj_054Class) // or JObjectClass
//  ['{6D0E11D5-AE34-4EE1-AB96-499177A2686E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_d; cdecl; overload;
//    {class} function init: Jj_d; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/j$d')]
//  Jj_d = interface(Jj_054) // or JObject
//  ['{73F180D7-2866-4DE5-B9D1-F41B26035043}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJj_d = class(TJavaGenericImport<Jj_dClass, Jj_d>) end;

//  Jl_056Class = interface(Jk_055Class) // or JObjectClass
//  ['{57132EC7-BD81-4BC3-A922-1BE96721B263}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl_056; cdecl;
//    {class} function d(P1: JString): Char; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/l')]
//  Jl_056 = interface(Jk_055) // or JObject
//  ['{DDAD90C4-6446-4361-9765-1ED78AE7BACC}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJl_056 = class(TJavaGenericImport<Jl_056Class, Jl_056>) end;

//  Jm_a_057Class = interface(Jm_058Class) // or JObjectClass
//  ['{66F7AACE-ABFE-4B56-AE09-8B2169C6C555}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm_a_057; cdecl; overload;
//    {class} function init: Jm_a_057; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/b/m$a')]
//  Jm_a_057 = interface(Jm_058) // or JObject
//  ['{4C2DFE65-CD41-4207-BB34-81A33F11B3E5}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jg; cdecl;
//
//    { Property }
//  end;
//
//  TJm_a_057 = class(TJavaGenericImport<Jm_a_057Class, Jm_a_057>) end;

//  Jb_059Class = interface(JEnumClass) // or JObjectClass
//  ['{1F2695C8-5001-4F44-9C10-66EFE6D05933}']
//    { static Property Methods }
//    {class} function _Geta: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jb>; cdecl;
//    {class} function valueOf(P1: JString): Jb; cdecl;
//    {class} function init: Jb_059; cdecl;
//
//    { static Property }
//    {class} property a: Jb read _Geta;
//    {class} property b: Jb read _Getb;
//    {class} property c: Jb read _Getc;
//    {class} property d: Jb read _Getd;
//    {class} property e: Jb read _Gete;
//  end;
//
//  [JavaSignature('com/dothantech/c/b')]
//  Jb_059 = interface(JEnum) // or JObject
//  ['{985981CE-F51A-418E-BF81-EAC7467E1139}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJb_059 = class(TJavaGenericImport<Jb_059Class, Jb_059>) end;

//  Ja_060Class = interface(JEnumClass) // or JObjectClass
//  ['{3302D941-3B45-4BC9-A047-8A18CBC8E6F2}']
//    { static Property Methods }
//    {class} function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ja>; cdecl;
//    {class} function valueOf(P1: JString): Ja; cdecl;
//    {class} function init: Ja_060; cdecl;
//
//    { static Property }
//    {class} property a: Ja read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/c/c/a/a')]
//  Ja_060 = interface(JEnum) // or JObject
//  ['{3D287FDD-6756-487D-AF6B-B8C48ED216D9}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJa_060 = class(TJavaGenericImport<Ja_060Class, Ja_060>) end;

//  Jb_061Class = interface(JEnumClass) // or JObjectClass
//  ['{68C8160E-9C6F-4541-8340-FB31A85C7811}']
//    { static Property Methods }
//    {class} function _Geta: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jb>; cdecl;
//    {class} function valueOf(P1: JString): Jb; cdecl;
//    {class} function init: Jb_061; cdecl;
//
//    { static Property }
//    {class} property a: Jb read _Geta;
//    {class} property b: Jb read _Getb;
//    {class} property c: Jb read _Getc;
//    {class} property d: Jb read _Getd;
//    {class} property e: Jb read _Gete;
//  end;
//
//  [JavaSignature('com/dothantech/c/c/a/b')]
//  Jb_061 = interface(JEnum) // or JObject
//  ['{EAB2CDA0-6554-453E-8940-4F3470106CCE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jc): Integer; cdecl; overload;
//    function a: Integer; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJb_061 = class(TJavaGenericImport<Jb_061Class, Jb_061>) end;

//  Jc_aClass = interface(JObjectClass)
//  ['{CB89BA74-7831-4EDC-9327-F12440EE7D9A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): Jc_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/c/a/c$a')]
//  Jc_a = interface(JObject)
//  ['{94BEACFB-A59A-4B3D-B47E-870C3CBA4AAE}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJc_a = class(TJavaGenericImport<Jc_aClass, Jc_a>) end;

//  Jc_bClass = interface(JObjectClass)
//  ['{E9DA9E47-ECE3-43CE-B66C-50A3A9C2444F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: TJavaObjectArray<Jc_a>): Jc_b; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/c/a/c$b')]
//  Jc_b = interface(JObject)
//  ['{FA2F6910-BF74-40C2-AB01-4E6E213985A2}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function d: TJavaObjectArray<Jc_a>; cdecl;
//
//    { Property }
//  end;
//
//  TJc_b = class(TJavaGenericImport<Jc_bClass, Jc_b>) end;

//  Jc_064Class = interface(JObjectClass)
//  ['{19BA6EEE-4752-4C0D-8D9B-8FEC2D04BBF9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): Jc; cdecl; overload;
//    {class} function init: Jc_064; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/c/a/c')]
//  Jc_064 = interface(JObject)
//  ['{51D5CFCA-ECA1-480E-9B42-4CC3B09443B3}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function a(P1: Ja): Jc_b; cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;
//
//  TJc_064 = class(TJavaGenericImport<Jc_064Class, Jc_064>) end;

//  Ja_065Class = interface(JObjectClass)
//  ['{91341567-3599-482E-A42A-FC89B6167A30}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Ja_065; cdecl;
//    {class} function a(P1: Jb): Integer; cdecl; overload;
//    {class} function b(P1: Jb): Integer; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/c/b/a')]
//  Ja_065 = interface(JObject)
//  ['{09FC7635-6B94-4169-AF7F-BDB7923FB1F8}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaArray<Byte>; cdecl; overload;
//    function b: TJavaArray<Byte>; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJa_065 = class(TJavaGenericImport<Ja_065Class, Ja_065>) end;

//  Jb_066Class = interface(JObjectClass)
//  ['{6675EB00-49C9-4AD4-AC02-AAC8ED12FE75}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): Jb_066; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/c/b/b')]
//  Jb_066 = interface(JObject)
//  ['{7D2C96C0-C072-4341-B8D2-D1ADD33280E6}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function b: Integer; cdecl;
//    function a(P1: Integer; P2: Integer): Byte; cdecl; overload;
//    function c: TJavaArray<TJavaArray<Byte>>; cdecl;
//    procedure a(P1: Integer; P2: Integer; P3: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: Boolean); cdecl; overload;
//    procedure a(P1: Byte); cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;
//
//  TJb_066 = class(TJavaGenericImport<Jb_066Class, Jb_066>) end;

//  Jc_067Class = interface(JObjectClass)
//  ['{31497736-20BC-48E0-BEE1-6DF8363B5DAB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Ja; P3: JMap): Jf; cdecl;
//    {class} function init: Jc_067; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/c/b/c')]
//  Jc_067 = interface(JObject)
//  ['{7EAAAAA0-86C3-407A-BCFE-3BF4508D2F15}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJc_067 = class(TJavaGenericImport<Jc_067Class, Jc_067>) end;

//  Jd_068Class = interface(JObjectClass)
//  ['{6362B51F-D191-4D3B-B3E8-F8D89BE437F6}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jd_068; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/c/c/b/d')]
//  Jd_068 = interface(JObject)
//  ['{E256B9DB-8A34-455B-B4A8-DF083AC04C95}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJd_068 = class(TJavaGenericImport<Jd_068Class, Jd_068>) end;

//  Je_069Class = interface(JObjectClass)
//  ['{7B51EE0B-81A1-4796-B7CA-603AA6D37AF2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: Ja; P2: Ja; P3: Jc; P4: Integer; P5: Jb); cdecl;
//    {class} function init: Je_069; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/c/b/e')]
//  Je_069 = interface(JObject)
//  ['{B3373B57-F792-4CD9-AC7F-C49A7B1864DD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJe_069 = class(TJavaGenericImport<Je_069Class, Je_069>) end;

//  Jf_070Class = interface(JObjectClass)
//  ['{A606F793-D4C1-43BA-A18D-0DD0D3D81299}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf_070; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/c/b/f')]
//  Jf_070 = interface(JObject)
//  ['{E8145504-CC65-4D6C-B2E5-8391BA29C2B4}']
//    { Property Methods }
//
//    { methods }
//    function a: Jb; cdecl; overload;
//    function toString: JString; cdecl;
//    procedure a(P1: Jb); cdecl; overload;
//    procedure a(P1: Ja); cdecl; overload;
//    procedure a(P1: Jc); cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    procedure a(P1: Jb); cdecl; overload;
//
//    { Property }
//  end;
//
//  TJf_070 = class(TJavaGenericImport<Jf_070Class, Jf_070>) end;

//  Jd_072Class = interface(JExceptionClass) // or JObjectClass
//  ['{8E6804C8-20F9-433F-A395-8A54CE177DCA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_072; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/d')]
//  Jd_072 = interface(JException) // or JObject
//  ['{623D5F3D-6727-43E0-8FB3-7499A44A870D}']
//    { Property Methods }
//
//    { methods }
//    function fillInStackTrace: JThrowable; cdecl;
//
//    { Property }
//  end;
//
//  TJd_072 = class(TJavaGenericImport<Jd_072Class, Jd_072>) end;

//  Jc_071Class = interface(Jd_072Class) // or JObjectClass
//  ['{56289F2E-4840-4A3D-87AC-7D0CB215AE3D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jc; cdecl;
//    {class} function init: Jc_071; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/c')]
//  Jc_071 = interface(Jd_072) // or JObject
//  ['{9917B035-140D-422C-A31E-7BA45EEB3EE8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJc_071 = class(TJavaGenericImport<Jc_071Class, Jc_071>) end;

//  Je_073Class = interface(JExceptionClass) // or JObjectClass
//  ['{DD033622-D6BA-41A2-BD27-9DDEB0F61AA1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_073; cdecl; overload;
//    {class} function init(P1: JString): Je_073; cdecl; overload;
//    {class} function init(P1: JThrowable): Je_073; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/c/e')]
//  Je_073 = interface(JException) // or JObject
//  ['{DF32C0CE-0702-41D0-BF84-3BC017513F6A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJe_073 = class(TJavaGenericImport<Je_073Class, Je_073>) end;

//  Ja_a_074Class = interface(JEnumClass) // or JObjectClass
//  ['{E5D7F165-E399-45C6-9FD6-45486810B618}']
//    { static Property Methods }
//    {class} function _Geta: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ja_a>; cdecl;
//    {class} function valueOf(P1: JString): Ja_a; cdecl;
//    {class} function a(P1: JLocale): Ja_a; cdecl;
//    {class} function init: Ja_a_074; cdecl;
//
//    { static Property }
//    {class} property a: Ja_a read _Geta;
//    {class} property b: Ja_a read _Getb;
//    {class} property c: Ja_a read _Getc;
//  end;
//
//  [JavaSignature('com/dothantech/common/a$a')]
//  Ja_a_074 = interface(JEnum) // or JObject
//  ['{474B9087-A66A-4476-9BA6-932DF041C5F1}']
//    { Property Methods }
//    function _Getd: JLocale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JLocale);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property d: JLocale read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//  end;
//
//  TJa_a_074 = class(TJavaGenericImport<Ja_a_074Class, Ja_a_074>) end;

//  Ja_bClass = interface(JEnumClass) // or JObjectClass
//  ['{9391220E-2B67-42A3-9471-F56BE4FECFE8}']
//    { static Property Methods }
//    {class} function _Geta: Ja_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ja_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ja_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ja_b>; cdecl;
//    {class} function valueOf(P1: JString): Ja_b; cdecl;
//    {class} function init: Ja_b; cdecl;
//
//    { static Property }
//    {class} property a: Ja_b read _Geta;
//    {class} property b: Ja_b read _Getb;
//    {class} property c: Ja_b read _Getc;
//  end;
//
//  [JavaSignature('com/dothantech/common/a$b')]
//  Ja_b = interface(JEnum) // or JObject
//  ['{ED93F114-792B-4F47-86A9-B28284EC4219}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_b = class(TJavaGenericImport<Ja_bClass, Ja_b>) end;

//  Ja_076Class = interface(JApplicationClass) // or JObjectClass
//  ['{D25E269E-A085-4976-813E-47B7A7D812EB}']
//    { static Property Methods }
//    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jas;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Ja_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: JActivity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: JApplication; cdecl; overload;
//    {class} function b: JContext; cdecl; overload;
//    {class} function c: Integer; cdecl;
//    {class} function a(P1: Boolean): JString; cdecl; overload;
//    {class} function d: Boolean; cdecl;
//    {class} function e: Ja_b; cdecl;
//    {class} function f: Boolean; cdecl;
//    {class} function g: Boolean; cdecl;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
//    {class} function b(P1: JString): Boolean; cdecl; overload;
//    {class} procedure a(P1: JHandler); cdecl; overload;
//    {class} procedure h; cdecl;
//    {class} procedure a(P1: Int64); cdecl; overload;
//    {class} function i: Ja_b; cdecl;
//    {class} function a(P1: JLocale; P2: JLocale): Boolean; cdecl; overload;
//    {class} function j: JString; cdecl;
//    {class} procedure k; cdecl;
//    {class} function init: Ja_076; cdecl;
//
//    { static Property }
//    {class} property a: Jw read _Geta;
//    {class} property b: Jas read _Getb;
//    {class} property c: JObject read _Getc;
//    {class} property d: Ja_b read _Getd;
//    {class} property e: Integer read _Gete;
//    {class} property f: JActivity read _Getf;
//  end;
//
//  [JavaSignature('com/dothantech/common/a')]
//  Ja_076 = interface(JApplication) // or JObject
//  ['{19CAD901-4922-4F7C-8021-56D1956BFAD7}']
//    { Property Methods }
//
//    { methods }
//    procedure onCreate; cdecl;
//    procedure onLowMemory; cdecl;
//    procedure onConfigurationChanged(P1: JConfiguration); cdecl;
//    procedure onTerminate; cdecl;
//
//    { Property }
//  end;
//
//  TJa_076 = class(TJavaGenericImport<Ja_076Class, Ja_076>) end;

//  JaaClass = interface(JObjectClass)
//  ['{776F29CC-C5CD-4A3D-BE0A-EC8908FFEC3D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jaa; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/aa')]
//  Jaa = interface(JObject)
//  ['{A041A6BA-0453-459E-977E-4F295C28D2BE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JEnum>; P2: JString; P3: JEnum): JEnum; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJaa = class(TJavaGenericImport<JaaClass, Jaa>) end;

//  JabClass = interface(JObjectClass)
//  ['{57517882-6514-4C82-9583-58713E75ABFF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
//    {class} function b(P1: JString; P2: JString): Boolean; cdecl; overload;
//    {class} function c(P1: JString; P2: JString): Integer; cdecl; overload;
//    {class} function d(P1: JString; P2: JString): Integer; cdecl; overload;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: JString; P2: Integer; P3: Integer): JString; cdecl; overload;
//    {class} function b(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Ju; P3: Integer; P4: JString): JString; cdecl; overload;
//    {class} function c(P1: JString): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl; overload;
//    {class} function e(P1: JString; P2: JString): Integer; cdecl; overload;
//    {class} function d(P1: JString): TJavaObjectArray<JString>; cdecl; overload;
//    {class} function e(P1: JString): JArrayList; cdecl; overload;
//    {class} function a(P1: Char; P2: Integer): JString; cdecl; overload;
//    {class} function a(P1: JString; P2: Jab; P3: Jab): Boolean; cdecl; overload;
//    {class} function init: Jab; cdecl; overload;
//    {class} function init: Jab; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ab')]
//  Jab = interface(JObject)
//  ['{BB9AF61D-A5AD-4759-802B-EB93E76EEA98}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function toString: JString; cdecl;
//    function hashCode: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//  end;
//
//  TJab = class(TJavaGenericImport<JabClass, Jab>) end;

//  JacClass = interface(JObjectClass)
//  ['{DB342458-F15B-4185-905C-8541724F2852}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jac; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ac')]
//  Jac = interface(JObject)
//  ['{0ACE17CD-F299-4EC0-BC85-0397A3CC5AEB}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJac = class(TJavaGenericImport<JacClass, Jac>) end;

//  JadClass = interface(JObjectClass)
//  ['{B860D598-5472-4CE9-9681-A39085E24A38}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jad; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ad')]
//  Jad = interface(JObject)
//  ['{285B7DA9-40A0-4282-A4C7-A1D94DD2E064}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJad = class(TJavaGenericImport<JadClass, Jad>) end;

//  JaeClass = interface(JObjectClass)
//  ['{2E26ACC9-1CD3-4F38-96B3-E4A26FF29B18}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jae; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ae')]
//  Jae = interface(JObject)
//  ['{E0DDAE21-B6D1-4E32-AFEB-5517E4A63E06}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJae = class(TJavaGenericImport<JaeClass, Jae>) end;

//  JafClass = interface(JObjectClass)
//  ['{ADB071C1-F0F9-47BF-AEE7-B98CEC60D8B9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jaf; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/af')]
//  Jaf = interface(JObject)
//  ['{F7308B6D-2847-4765-B6EF-FE10F5A364D9}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJaf = class(TJavaGenericImport<JafClass, Jaf>) end;

//  Jag_aClass = interface(JEnumClass) // or JObjectClass
//  ['{9214CD8E-9CD6-4823-B7C3-8C9D4D516474}']
//    { static Property Methods }
//    {class} function _Geta: Jag_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jag_a>; cdecl;
//    {class} function valueOf(P1: JString): Jag_a; cdecl;
//    {class} function init(P1: JString; P2: Integer; P3: JString; P4: Byte): Jag_a; cdecl; overload;
//    {class} function init: Jag_a; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jag_a read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/common/ag$a')]
//  Jag_a = interface(JEnum) // or JObject
//  ['{67E7C69B-BCBE-43DC-AE6F-E335EF51C35F}']
//    { Property Methods }
//    function _Getb: JSimpleDateFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JSimpleDateFormat);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//    property b: JSimpleDateFormat read _Getb write _Setb;
//  end;
//
//  TJag_a = class(TJavaGenericImport<Jag_aClass, Jag_a>) end;

//  JagClass = interface(JObjectClass)
//  ['{F6CDC14B-A736-41BC-97F5-973BE0B843B2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl;
//    {class} function init: Jag; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ag')]
//  Jag = interface(JObject)
//  ['{845DBEF5-C293-4BFD-914E-B33D00E913B0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJag = class(TJavaGenericImport<JagClass, Jag>) end;

//  JahClass = interface(Jag_aClass) // or JObjectClass
//  ['{F8DFA7E4-DD38-408B-A9FE-77264BD1B169}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer; P3: JString): Jah; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ah')]
//  Jah = interface(Jag_a) // or JObject
//  ['{82601584-2441-4271-BD8C-12C46889E8B6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJah = class(TJavaGenericImport<JahClass, Jah>) end;

//  JaiClass = interface(Jag_aClass) // or JObjectClass
//  ['{FAFA51C9-CC17-4DE9-8003-3AC5E758D085}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer; P3: JString): Jai; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ai')]
//  Jai = interface(Jag_a) // or JObject
//  ['{F602996F-41AD-4AAB-98F4-2B5BF735BA13}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJai = class(TJavaGenericImport<JaiClass, Jai>) end;

//  JajClass = interface(Jag_aClass) // or JObjectClass
//  ['{73B89727-B9FB-4317-B0B0-BC9CEF6B2E40}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer; P3: JString): Jaj; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/aj')]
//  Jaj = interface(Jag_a) // or JObject
//  ['{8602AF08-2CF2-425A-B2C0-8502179F8B57}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJaj = class(TJavaGenericImport<JajClass, Jaj>) end;

//  JakClass = interface(Jag_aClass) // or JObjectClass
//  ['{44311B40-10EA-4621-B83A-E14DD40C33B1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer; P3: JString): Jak; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ak')]
//  Jak = interface(Jag_a) // or JObject
//  ['{F58C0BDC-3F8B-431F-AD7D-85EA69AB8E9A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJak = class(TJavaGenericImport<JakClass, Jak>) end;

//  JalClass = interface(Jag_aClass) // or JObjectClass
//  ['{85077EFD-6926-4F17-A782-8106ED68350B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer; P3: JString): Jal; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/al')]
//  Jal = interface(Jag_a) // or JObject
//  ['{588EC056-3ABB-4ED5-B41F-3EFA7962FF76}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJal = class(TJavaGenericImport<JalClass, Jal>) end;

//  JamClass = interface(Jag_aClass) // or JObjectClass
//  ['{FFA1E01D-F0B5-475F-AAB8-A861E7F866D3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer; P3: JString): Jam; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/am')]
//  Jam = interface(Jag_a) // or JObject
//  ['{5BAE119D-9D82-4EDD-95A0-7B61499DA7E0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJam = class(TJavaGenericImport<JamClass, Jam>) end;

//  Jan_aClass = interface(JObjectClass)
//  ['{C6B22C13-645B-4AE4-99A9-C94408439A42}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JToast): Jan_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/an$a')]
//  Jan_a = interface(JObject)
//  ['{E623AC36-E644-4FC1-888F-8987DDF50D03}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJan_a = class(TJavaGenericImport<Jan_aClass, Jan_a>) end;

//  JanClass = interface(JObjectClass)
//  ['{FABA14F8-7938-4184-86D4-44BDA3CF60A7}']
//    { static Property Methods }
//    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JToast;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jan; cdecl; overload;
//    {class} function a(P1: JCharSequence): JToast; cdecl;
//    {class} function init: Jan; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jw read _Geta;
//    {class} property b: JToast read _Getb;
//    {class} property c: JObject read _Getc;
//  end;
//
//  [JavaSignature('com/dothantech/common/an')]
//  Jan = interface(JObject)
//  ['{29BA9AEB-43B9-4596-BD4E-259636023A6E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJan = class(TJavaGenericImport<JanClass, Jan>) end;

//  JaoClass = interface(JObjectClass)
//  ['{6EC2DD6B-EF5D-4B36-9E20-42B93746BB98}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JToast): Jao; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ao')]
//  Jao = interface(JObject)
//  ['{F87BE6B7-2227-4466-A388-149FE1DA2015}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJao = class(TJavaGenericImport<JaoClass, Jao>) end;

//  JapClass = interface(JObjectClass)
//  ['{BF9447AC-674B-41CF-B82B-1FA41BE69C7D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JToast): Jap; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ap')]
//  Jap = interface(JObject)
//  ['{B87C8C34-430C-4F7C-A1F2-0CB9B20ACDE5}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJap = class(TJavaGenericImport<JapClass, Jap>) end;

//  JarClass = interface(JObjectClass)
//  ['{8AE2A3C9-CB8C-43BE-A606-BD4A111F2EF6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jaq): Jar; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ar')]
//  Jar = interface(JObject)
//  ['{51FED2C3-33E1-4222-9A10-978AA1CD385E}']
//    { Property Methods }
//
//    { methods }
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJar = class(TJavaGenericImport<JarClass, Jar>) end;

//  JasClass = interface(JObjectClass)
//  ['{A77FF250-3DE6-4007-B00C-3030B35797B5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jas; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/as')]
//  Jas = interface(JObject)
//  ['{8B8B937F-C40D-46A8-B3C7-2E6585AA9241}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JHandler); cdecl; overload;
//    procedure b(P1: JHandler); cdecl;
//    function a(P1: Integer; P2: JObject): Boolean; cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;
//
//  TJas = class(TJavaGenericImport<JasClass, Jas>) end;

//  JatClass = interface(JObjectClass)
//  ['{DE5CC8B2-46D1-4DB0-915A-95B1280EC80E}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jat; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: Integer read _Getc;
//    {class} property d: Integer read _Getd;
//    {class} property e: Integer read _Gete;
//    {class} property f: Integer read _Getf;
//    {class} property g: Integer read _Getg;
//    {class} property h: Integer read _Geth;
//    {class} property i: Integer read _Geti;
//    {class} property j: Integer read _Getj;
//  end;
//
//  [JavaSignature('com/dothantech/common/at')]
//  Jat = interface(JObject)
//  ['{B9D490A3-BFDA-413B-B579-69A3F94DBE07}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJat = class(TJavaGenericImport<JatClass, Jat>) end;

//  JauClass = interface(JObjectClass)
//  ['{74E5EC26-F872-4FF0-8674-CE4D43433D2D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jau; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/au')]
//  Jau = interface(JObject)
//  ['{0B414839-C09E-4F06-AE0B-1D2FD5AEB515}']
//    { Property Methods }
//
//    { methods }
//    function a: Boolean; cdecl; overload;
//    function a(P1: Int64): Boolean; cdecl; overload;
//    procedure b; cdecl;
//    procedure c; cdecl;
//
//    { Property }
//  end;
//
//  TJau = class(TJavaGenericImport<JauClass, Jau>) end;

//  JavClass = interface(JObjectClass)
//  ['{5D3E30F1-E189-4016-8BA8-27C94B1BF393}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jav; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/av')]
//  Jav = interface(JObject)
//  ['{9BD997EA-639B-466F-981B-2C1EB5B2EEC1}']
//    { Property Methods }
//    function _Geta: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jau;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jau);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Integer): Boolean; cdecl; overload;
//    function a: Boolean; cdecl; overload;
//    function a(P1: JMessage): Boolean; cdecl; overload;
//    function b(P1: Integer): Boolean; cdecl; overload;
//    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
//    function a(P1: Integer; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: JObject): Boolean; cdecl; overload;
//    function a(P1: JRunnable): Boolean; cdecl; overload;
//    function a(P1: JRunnable; P2: Int64): Boolean; cdecl; overload;
//    procedure b; cdecl; overload;
//    procedure b(P1: JRunnable); cdecl; overload;
//    procedure quit; cdecl;
//    function b(P1: JMessage): Boolean; cdecl; overload;
//    procedure c; cdecl;
//    procedure d; cdecl;
//    procedure run; cdecl;
//
//    { Property }
//    property a: JHandler read _Geta write _Seta;
//    property b: Jau read _Getb write _Setb;
//  end;
//
//  TJav = class(TJavaGenericImport<JavClass, Jav>) end;

//  JawClass = interface(JObjectClass)
//  ['{4BEF1673-7A00-4A6D-B197-A82D27070C84}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jav; P2: JLooper): Jaw; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/aw')]
//  Jaw = interface(JObject)
//  ['{5AF9160C-D9EA-491F-A856-4DFF0DFFEC6B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJaw = class(TJavaGenericImport<JawClass, Jaw>) end;

//  JaxClass = interface(JObjectClass)
//  ['{BED041DB-7CC3-40D5-B35C-4E93796CBD6A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jav): Jax; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/ax')]
//  Jax = interface(JObject)
//  ['{41F1FA62-D26C-4AEA-AED4-B164091BC191}']
//    { Property Methods }
//
//    { methods }
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJax = class(TJavaGenericImport<JaxClass, Jax>) end;

//  Jb_103Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{AB12E05E-10D1-450D-AF87-1DA0316E3D7A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_103; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/b')]
//  Jb_103 = interface(JBroadcastReceiver) // or JObject
//  ['{889E1B69-152B-4240-901B-BB90C2D4D1EF}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;
//
//  TJb_103 = class(TJavaGenericImport<Jb_103Class, Jb_103>) end;

//  Jc_104Class = interface(JObjectClass)
//  ['{D23214F2-0E2F-42DE-BB09-4F39A60DEC24}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_104; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/c')]
//  Jc_104 = interface(JObject)
//  ['{CD229FBD-064A-463D-B438-2D6D6AB242AE}']
//    { Property Methods }
//
//    { methods }
//    procedure onActivityCreated(P1: JActivity; P2: JBundle); cdecl;
//    procedure onActivityStarted(P1: JActivity); cdecl;
//    procedure onActivityResumed(P1: JActivity); cdecl;
//    procedure onActivityPaused(P1: JActivity); cdecl;
//    procedure onActivityStopped(P1: JActivity); cdecl;
//    procedure onActivitySaveInstanceState(P1: JActivity; P2: JBundle); cdecl;
//    procedure onActivityDestroyed(P1: JActivity); cdecl;
//
//    { Property }
//  end;
//
//  TJc_104 = class(TJavaGenericImport<Jc_104Class, Jc_104>) end;

//  Jd_105Class = interface(JObjectClass)
//  ['{2C0C3D21-A072-41E0-802D-06884F5D58C7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_105; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/d')]
//  Jd_105 = interface(JObject)
//  ['{080713BB-3270-4072-87B2-CA035D7FBD7F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJd_105 = class(TJavaGenericImport<Jd_105Class, Jd_105>) end;

  JDzSystemClass = interface(JObjectClass)
  ['{839AC627-3ACD-4984-B6B0-6B285912D12A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDzSystem; cdecl;
    {class} function getSystemVersion: Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/DzSystem')]
  JDzSystem = interface(JObject)
  ['{46F8C226-E7BF-4FBE-B44B-CB001987CCEE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzSystem = class(TJavaGenericImport<JDzSystemClass, JDzSystem>) end;

//  Je_107Class = interface(JObjectClass)
//  ['{AAD23047-41FE-411F-889E-ED5C79EE97F6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_107; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/e')]
//  Je_107 = interface(JObject)
//  ['{C0358383-CEB9-4AEE-BC12-8F7D0EA4A5C3}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJe_107 = class(TJavaGenericImport<Je_107Class, Je_107>) end;

//  Jf_108Class = interface(JArrayListClass) // or JObjectClass
//  ['{4D78D451-6476-4F60-AADE-DE837B8AEB41}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf_108; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/f')]
//  Jf_108 = interface(JArrayList) // or JObject
//  ['{96E88CD5-A666-4D8D-B649-50C440C684FD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJf_108 = class(TJavaGenericImport<Jf_108Class, Jf_108>) end;

//  Jg_a_109Class = interface(JEnumClass) // or JObjectClass
//  ['{C775135A-3D99-4B98-9448-3AA8AFE88626}']
//    { static Property Methods }
//    {class} function _Geta: Jg_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jg_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jg_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jg_a>; cdecl;
//    {class} function valueOf(P1: JString): Jg_a; cdecl;
//    {class} function init: Jg_a_109; cdecl;
//
//    { static Property }
//    {class} property a: Jg_a read _Geta;
//    {class} property b: Jg_a read _Getb;
//    {class} property c: Jg_a read _Getc;
//  end;
//
//  [JavaSignature('com/dothantech/common/g$a')]
//  Jg_a_109 = interface(JEnum) // or JObject
//  ['{44490506-423D-4D5F-AB97-BA4AFE116325}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJg_a_109 = class(TJavaGenericImport<Jg_a_109Class, Jg_a_109>) end;

//  Jg_110Class = interface(JObjectClass)
//  ['{77B3AD96-7364-4377-B61C-89C791B659D0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Jg_a): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Jg_a): JString; cdecl; overload;
//    {class} procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>); cdecl; overload;
//    {class} procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: Integer); cdecl; overload;
//    {class} function init(P1: Ja; P2: JString): Jg_110; cdecl; overload;
//    {class} function init(P1: Ja; P2: JString; P3: Boolean; P4: Boolean; P5: Boolean): Jg_110; cdecl; overload;
//    {class} function init(P1: Ja; P2: JString; P3: Boolean; P4: Boolean; P5: Boolean; P6: Boolean): Jg_110; cdecl; overload;
//    {class} function init(P1: Jg; P2: Ja): Jg_110; cdecl; overload;
//    {class} function init(P1: Jg; P2: Boolean): Jg_110; cdecl; overload;
//    {class} function init(P1: Jg; P2: JString; P3: Boolean): Jg_110; cdecl; overload;
//    {class} function init(P1: Jg; P2: JString; P3: Boolean; P4: Boolean): Jg_110; cdecl; overload;
//    {class} function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<JEnum>; P2: JObject; P3: JEnum): JEnum; cdecl; overload;
//    {class} function a(P1: JMessage): JMessage; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/g')]
//  Jg_110 = interface(JObject)
//  ['{489014E8-B195-4442-8D5A-2040776EA923}']
//    { Property Methods }
//    function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Ja);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: Ja read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: Boolean read _Getc write _Setc;
//    property d: Boolean read _Getd write _Setd;
//    property e: Boolean read _Gete write _Sete;
//    property f: Boolean read _Getf write _Setf;
//  end;
//
//  TJg_110 = class(TJavaGenericImport<Jg_110Class, Jg_110>) end;

//  Jh_111Class = interface(JObjectClass)
//  ['{3B6B8739-33FB-4BEC-8399-A7A6E7DDB43E}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jh_111; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/common/h')]
//  Jh_111 = interface(JObject)
//  ['{602AAA12-A7D2-42BE-9548-90E534E9AD2F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJh_111 = class(TJavaGenericImport<Jh_111Class, Jh_111>) end;

//  Ji_112Class = interface(JObjectClass)
//  ['{3F8EA858-9EC2-4C30-AB1D-6F13392CE55D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji_112; cdecl; overload;
//    {class} function a(P1: JString; P2: Integer): JString; cdecl;
//    {class} function init: Ji_112; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/i')]
//  Ji_112 = interface(JObject)
//  ['{18A07522-404A-4D4C-B956-69035DF06E53}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJi_112 = class(TJavaGenericImport<Ji_112Class, Ji_112>) end;

//  Jj_113Class = interface(JEnumClass) // or JObjectClass
//  ['{C141DE51-7699-4E4F-871D-47A7F3BE02C3}']
//    { static Property Methods }
//    {class} function _Geta: Jj;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jj>; cdecl;
//    {class} function valueOf(P1: JString): Jj; cdecl;
//    {class} function a(P1: Integer): Jj; cdecl; overload;
//    {class} function init: Jj_113; cdecl;
//
//    { static Property }
//    {class} property a: Jj read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/common/j')]
//  Jj_113 = interface(JEnum) // or JObject
//  ['{BD254C3B-E295-47C5-B261-4F07F8861998}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJj_113 = class(TJavaGenericImport<Jj_113Class, Jj_113>) end;

//  Jk_114Class = interface(JObjectClass)
//  ['{DC23C2BD-6170-4C46-B61E-03324BA4E464}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Boolean): Boolean; cdecl;
//    {class} function init: Jk_114; cdecl; overload;
//    {class} function init(P1: Boolean): Jk_114; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/k')]
//  Jk_114 = interface(JObject)
//  ['{B28276C4-6B9A-4C03-81BA-566089638386}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function equals(P1: JObject): Boolean; cdecl;
//    function toString: JString; cdecl;
//    function hashCode: Integer; cdecl;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//  end;
//
//  TJk_114 = class(TJavaGenericImport<Jk_114Class, Jk_114>) end;

//  Jl_115Class = interface(JObjectClass)
//  ['{28173750-B73C-4A9E-BA26-6FBB18303BBA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Byte): Integer; cdecl;
//    {class} function init: Jl_115; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/l')]
//  Jl_115 = interface(JObject)
//  ['{33F531AB-78ED-4B35-945B-CF8512702FD1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJl_115 = class(TJavaGenericImport<Jl_115Class, Jl_115>) end;

//  Jm_116Class = interface(JObjectClass)
//  ['{4031BBCF-6C67-4D5E-97D4-0F739A83C9F0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JObject; P2: JString): Boolean; cdecl; overload;
//    {class} function b(P1: JObject; P2: JString): JObject; cdecl;
//    {class} function a(P1: JClass; P2: JString; P3: TJavaObjectArray<JClass>): JMethod; cdecl; overload;
//    {class} function a(P1: JMethod; P2: JObject; P3: TJavaObjectArray<JObject>): JObject; cdecl; overload;
//    {class} function init: Jm_116; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/m')]
//  Jm_116 = interface(JObject)
//  ['{84A4522B-BA4C-41B0-AF02-68A4274351DA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJm_116 = class(TJavaGenericImport<Jm_116Class, Jm_116>) end;

//  Jn_aClass = interface(JObjectClass)
//  ['{F087DB66-6B23-435F-A1A6-29D723C00D28}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/n$a')]
//  Jn_a = interface(IJavaInstance)
//  ['{582B2ABC-8CF7-4014-A0B0-35C1C2B44AC4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJn_a = class(TJavaGenericImport<Jn_aClass, Jn_a>) end;

//  Jn_118Class = interface(JObjectClass)
//  ['{6340EAA6-912E-4A7C-B542-B1A1C56E8A95}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: Jn_a); cdecl;
//    {class} function init: Jn_118; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/n')]
//  Jn_118 = interface(JObject)
//  ['{8F0C00B2-E4FF-4FAA-8014-D856156A8A8C}']
//    { Property Methods }
//
//    { methods }
//    procedure uncaughtException(P1: JThread; P2: JThrowable); cdecl;
//
//    { Property }
//  end;
//
//  TJn_118 = class(TJavaGenericImport<Jn_118Class, Jn_118>) end;

//  Jo_119Class = interface(JThreadClass) // or JObjectClass
//  ['{4A26E8D8-1FAA-4933-8734-20149AA703A2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jn; P2: JString): Jo_119; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/o')]
//  Jo_119 = interface(JThread) // or JObject
//  ['{DF7A3247-7D0C-43F8-8AB8-17262EEDC0A8}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJo_119 = class(TJavaGenericImport<Jo_119Class, Jo_119>) end;

//  Jp_120Class = interface(JObjectClass)
//  ['{FC784136-37E4-460B-AACE-9F5575049584}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): JString; cdecl;
//    {class} function init: Jp_120; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/p')]
//  Jp_120 = interface(JObject)
//  ['{CDE02790-449B-4FB1-ADCC-0B19AC8BC57E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJp_120 = class(TJavaGenericImport<Jp_120Class, Jp_120>) end;

//  Jq_121Class = interface(JObjectClass)
//  ['{CCD563E3-340A-448F-B20E-55B26891AD10}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/q')]
//  Jq_121 = interface(IJavaInstance)
//  ['{59686BEE-6577-47CC-A05A-450EFA4919EA}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJq_121 = class(TJavaGenericImport<Jq_121Class, Jq_121>) end;

//  Jr_aClass = interface(JObjectClass)
//  ['{956C8D62-05AB-40DA-978B-64D4570F3C17}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Jr_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/r$a')]
//  Jr_a = interface(JObject)
//  ['{3F1EB059-A836-44F0-854E-477298C030CD}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//  end;
//
//  TJr_a = class(TJavaGenericImport<Jr_aClass, Jr_a>) end;

//  Jr_123Class = interface(JObjectClass)
//  ['{7A999ED4-C93B-4C33-BFEE-8C488055DA32}']
//    { static Property Methods }
//    {class} function _Geta: JComparator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: JString; P2: JString; P3: JString): JString; cdecl; overload;
//    {class} function b(P1: JString): Boolean; cdecl;
//    {class} function a(P1: JInputStream; P2: JString): Boolean; cdecl; overload;
//    {class} function c(P1: JString): Boolean; cdecl;
//    {class} function init: Jr_123; cdecl;
//
//    { static Property }
//    {class} property a: JComparator read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/common/r')]
//  Jr_123 = interface(JObject)
//  ['{F3001491-E5C5-453E-9010-2161D04A0913}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJr_123 = class(TJavaGenericImport<Jr_123Class, Jr_123>) end;

  JReflectionClass = interface(JObjectClass)
  ['{4440BE6B-51F8-44B7-9C74-2AC41FE33E2C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReflection; cdecl; overload;
//    {class} function a(P1: JContext): Integer; cdecl;
//    {class} function init: JReflection; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/Reflection')]
  JReflection = interface(JObject)
  ['{8A292A63-4740-41B3-B2A1-EE7316C6B0AA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReflection = class(TJavaGenericImport<JReflectionClass, JReflection>) end;

//  Js_125Class = interface(JObjectClass)
//  ['{B4E0F1FD-2B72-4919-A564-05647D014279}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Js_125; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/s')]
//  Js_125 = interface(JObject)
//  ['{165C3391-FD11-4A71-873C-29ACD78224D4}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJs_125 = class(TJavaGenericImport<Js_125Class, Js_125>) end;

//  Jt_126Class = interface(JObjectClass)
//  ['{F7D4B395-0DFC-4EC6-9709-325BE78B9F5F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt_126; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/t')]
//  Jt_126 = interface(JObject)
//  ['{AA0B5256-2FDE-49CC-BC2A-D03FB50CCE64}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJt_126 = class(TJavaGenericImport<Jt_126Class, Jt_126>) end;

//  JuClass = interface(JObjectClass)
//  ['{B5274305-EF92-42CD-880F-35CAA7203C0E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Byte; P2: Boolean): JString; cdecl; overload;
//    {class} function a(P1: Byte; P2: Boolean; P3: Jg_a): JString; cdecl; overload;
//    {class} function a(P1: Integer): JString; cdecl; overload;
//    {class} function a(P1: Integer; P2: Boolean; P3: Jg_a): JString; cdecl; overload;
//    {class} function a(P1: Byte; P2: Byte): Integer; cdecl; overload;
//    {class} function a(P1: JObject): Ju; cdecl; overload;
//    {class} function init: Ju; cdecl; overload;
//    {class} function init(P1: Integer): Ju; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/u')]
//  Ju = interface(JObject)
//  ['{26E67E52-17A9-4345-9E5A-ABFD686EB03C}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function equals(P1: JObject): Boolean; cdecl;
//    function toString: JString; cdecl;
//    function hashCode: Integer; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;
//
//  TJu = class(TJavaGenericImport<JuClass, Ju>) end;

//  JvClass = interface(JObjectClass)
//  ['{70AEE4B2-387E-41D9-8ECE-6CE165B98BC1}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jv; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/common/v')]
//  Jv = interface(JObject)
//  ['{4A427D77-0E6A-48B1-ABA3-5B639191614E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJv = class(TJavaGenericImport<JvClass, Jv>) end;

//  JwClass = interface(JObjectClass)
//  ['{11A7DCE5-BA74-4BAB-B767-2D1571C52D58}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): Jw; cdecl; overload;
//    {class} procedure e; cdecl; overload;
//    {class} function init: Jw; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/w')]
//  Jw = interface(JObject)
//  ['{0F50D787-32AA-40C1-B2CE-C48ED0C8959D}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Boolean; cdecl; overload;
//    procedure b(P1: JString); cdecl; overload;
//    procedure a(P1: JString; P2: TJavaObjectArray<JObject>); cdecl; overload;
//    function b: Boolean; cdecl; overload;
//    procedure c(P1: JString); cdecl; overload;
//    function c: Boolean; cdecl; overload;
//    procedure d(P1: JString); cdecl; overload;
//    procedure b(P1: JString; P2: TJavaObjectArray<JObject>); cdecl; overload;
//    procedure e(P1: JString); cdecl; overload;
//    procedure c(P1: JString; P2: TJavaObjectArray<JObject>); cdecl; overload;
//    function d: Boolean; cdecl; overload;
//    procedure f(P1: JString); cdecl;
//    procedure d(P1: JString; P2: TJavaObjectArray<JObject>); cdecl; overload;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//  end;
//
//  TJw = class(TJavaGenericImport<JwClass, Jw>) end;

//  JxClass = interface(JObjectClass)
//  ['{73FEA96E-ADC1-41DC-ABF4-6B37AF8C49ED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: Ja; P2: Integer; P3: TJavaObjectArray<JString>; P4: TJavaObjectArray<JString>; P5: Jx); cdecl; overload;
//    {class} procedure a(P1: Ja; P2: TJavaObjectArray<JString>; P3: TJavaArray<Integer>; P4: Jx); cdecl; overload;
//    {class} function init: Jx; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/x')]
//  Jx = interface(JObject)
//  ['{8DEA2093-A1B3-4C74-8247-CD14BFB9248B}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload;
//    procedure b(P1: JString); cdecl;
//
//    { Property }
//  end;
//
//  TJx = class(TJavaGenericImport<JxClass, Jx>) end;

//  JyClass = interface(JObjectClass)
//  ['{33F24648-966C-4D0A-9745-E0EC637830F8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jx; P2: JString; P3: Boolean; P4: Ja; P5: JString): Jy; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/y')]
//  Jy = interface(JObject)
//  ['{82B1AC7F-F728-4AAB-8D92-A2E9A4BDAECF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJy = class(TJavaGenericImport<JyClass, Jy>) end;

//  JzClass = interface(JxClass) // or JObjectClass
//  ['{DD12172E-9D07-436D-819D-37F66D8D3F7C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: TJavaObjectArray<JString>; P3: Jx; P4: Ja; P5: TJavaObjectArray<JString>): Jz; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/common/z')]
//  Jz = interface(Jx) // or JObject
//  ['{8D338F6F-4D84-4CD7-85EF-BA853EF88F35}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl;
//    procedure b(P1: JString); cdecl;
//
//    { Property }
//  end;
//
//  TJz = class(TJavaGenericImport<JzClass, Jz>) end;

//  Ja_133Class = interface(JObjectClass)
//  ['{3218B451-937E-4C08-A4BD-72C5A77A7273}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIDzPrinter_PrinterAddress): JIDzPrinter2_PrinterParam; cdecl;
//    {class} function init: Ja_133; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/data/a')]
//  Ja_133 = interface(JObject)
//  ['{CDD8CFDE-A29E-4C41-987C-2E85D51042DA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_133 = class(TJavaGenericImport<Ja_133Class, Ja_133>) end;

//  Jb_aClass = interface(JObjectClass)
//  ['{68B34232-5194-440B-9A0F-5AB173CF60E9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb): Jb_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/data/b$a')]
//  Jb_a = interface(JObject)
//  ['{AD989687-F41F-48B1-85CC-3E4922EF7BDB}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function b: Byte; cdecl;
//    function c: Word; cdecl;
//    function d: Word; cdecl;
//    function e: Integer; cdecl;
//    function f: JString; cdecl;
//    function a(P1: JString): JString; cdecl; overload;
//    function a(P1: Integer): TJavaArray<Byte>; cdecl; overload;
//    function g: TJavaArray<Integer>; cdecl;
//
//    { Property }
//  end;
//
//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  Jb_135Class = interface(JObjectClass)
//  ['{F379DEB4-BE3F-4AC8-B554-B1B7635A7833}']
//    { static Property Methods }
//    {class} function _Geta: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a; cdecl; overload;
//    {class} procedure b; cdecl; overload;
//    {class} function c: Boolean; cdecl;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Jb; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): Jb; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): Jb; cdecl; overload;
//    {class} function init(P1: Byte): Jb_135; cdecl; overload;
//    {class} function init(P1: Byte; P2: TJavaArray<Byte>): Jb_135; cdecl; overload;
//    {class} function init(P1: Byte; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: Integer; P7: Integer): Jb_135; cdecl; overload;
//    {class} function init(P1: Byte; P2: Byte): Jb_135; cdecl; overload;
//    {class} function init(P1: Byte; P2: Byte; P3: Byte; P4: Byte): Jb_135; cdecl; overload;
//    {class} function init(P1: Byte; P2: Word; P3: Boolean): Jb_135; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Word): Integer; cdecl; overload;
//    {class} function b(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl; overload;
//    {class} function init: Jb_135; cdecl; overload;
//
//    { static Property }
//    {class} property a: Byte read _Geta;
//    {class} property b: Byte read _Getb;
//    {class} property c: Boolean read _Getc;
//  end;
//
//  [JavaSignature('com/dothantech/data/b')]
//  Jb_135 = interface(JObject)
//  ['{AC74B674-7B50-4428-96E8-6FD876387BAE}']
//    { Property Methods }
//    function _Getd: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function d: Jb_a; cdecl;
//    function e: Integer; cdecl;
//    function f: Integer; cdecl;
//    function g: TJavaArray<Byte>; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//    property d: Byte read _Getd write _Setd;
//    property e: TJavaArray<Byte> read _Gete write _Sete;
//  end;
//
//  TJb_135 = class(TJavaGenericImport<Jb_135Class, Jb_135>) end;

//  Jc_136Class = interface(JObjectClass)
//  ['{300D180E-B10E-471E-8D17-AC74F1DDA841}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jc_136; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/data/c')]
//  Jc_136 = interface(JObject)
//  ['{0051F87B-A285-471E-8947-C00206D0A68F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJc_136 = class(TJavaGenericImport<Jc_136Class, Jc_136>) end;

//  Jd_a_137Class = interface(JObjectClass)
//  ['{570A1FCF-8DFB-406D-B4C1-453A8A3D9374}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_a_137; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/data/d$a')]
//  Jd_a_137 = interface(JObject)
//  ['{C92E080C-647F-4A91-BB53-C64CF17433BA}']
//    { Property Methods }
//
//    { methods }
//    function a: Jd_b; cdecl; overload;
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function d: Boolean; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Boolean; cdecl; overload;
//    function a(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
//    function a(P1: Jb): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: TJavaArray<Byte>): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: Byte): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: Word; P3: Boolean): Boolean; cdecl; overload;
//    function a(P1: Jd_a): Boolean; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJd_a_137 = class(TJavaGenericImport<Jd_a_137Class, Jd_a_137>) end;

//  Jd_139Class = interface(JObjectClass)
//  ['{32B6C53C-E2BE-4D3D-B20E-B244841A0E27}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_139; cdecl; overload;
//    {class} function init(P1: TJavaArray<Byte>; P2: Integer): Jd_139; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/data/d')]
//  Jd_139 = interface(JObject)
//  ['{3D6D24F5-399D-4768-89AB-386E2AF72654}']
//    { Property Methods }
//    function _Geta: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer): Boolean; cdecl; overload;
//    function a(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
//    function a(P1: Byte): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: TJavaArray<Byte>): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: Byte): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: Word; P3: Boolean): Boolean; cdecl; overload;
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//    property a: TJavaArray<Byte> read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//  end;
//
//  TJd_139 = class(TJavaGenericImport<Jd_139Class, Jd_139>) end;

//  Jd_b_138Class = interface(Jd_139Class) // or JObjectClass
//  ['{28544A8D-8FF1-4AA6-B7DD-15A1A232E504}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_b_138; cdecl; overload;
//    {class} function init(P1: TJavaArray<Byte>; P2: Integer): Jd_b_138; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/data/d$b')]
//  Jd_b_138 = interface(Jd_139) // or JObject
//  ['{076CCD1C-7E23-4B2A-9672-6D726BF7B939}']
//    { Property Methods }
//    function _Getc: Jd_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jd_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function d: Jd_b; cdecl;
//
//    { Property }
//    property c: Jd_b read _Getc write _Setc;
//  end;
//
//  TJd_b_138 = class(TJavaGenericImport<Jd_b_138Class, Jd_b_138>) end;

//  JDzTagObject_aClass = interface(JEnumClass) // or JObjectClass
//  ['{20B04285-5FA4-4853-A441-35D18417CC71}']
//    { static Property Methods }
//    {class} function _Geta: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<JDzTagObject_a>; cdecl;
//    {class} function valueOf(P1: JString): JDzTagObject_a; cdecl;
//    {class} function init: JDzTagObject_a; cdecl;
//
//    { static Property }
//    {class} property a: JDzTagObject_a read _Geta;
//    {class} property b: JDzTagObject_a read _Getb;
//    {class} property c: JDzTagObject_a read _Getc;
//  end;
//
//  [JavaSignature('com/dothantech/data/DzTagObject$a')]
//  JDzTagObject_a = interface(JEnum) // or JObject
//  ['{0FE4F947-96A7-4808-B649-686DE0649C96}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDzTagObject_a = class(TJavaGenericImport<JDzTagObject_aClass, JDzTagObject_a>) end;

  JDzTagObjectClass = interface(JObjectClass)
  ['{1E8ED6C5-78AB-489D-A5CD-6B68CA48B291}']
    { static Property Methods }
    {class} function _GetXmlSerializerIndent: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetXmlSerializerNewLine: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetsEmptyChildren: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString): JDzTagObject; cdecl; overload;
//    {class} function init(P1: JString; P2: JString; P3: JDzTagObject_a): JDzTagObject; cdecl; overload;
    {class} function load(P1: JXmlPullParser): JDzTagObject; cdecl; overload;
    {class} function load(P1: JInputStream): JDzTagObject; cdecl; overload;
    {class} function load(P1: JString): JDzTagObject; cdecl; overload;
    {class} function valueOf(P1: JString): JDzTagObject; cdecl;
    {class} function nextUntil(P1: JXmlPullParser; P2: Integer): Boolean; cdecl;
    {class} function init: JDzTagObject; cdecl; overload;

    { static Property }
    {class} property XmlSerializerIndent: JString read _GetXmlSerializerIndent;
    {class} property XmlSerializerNewLine: JString read _GetXmlSerializerNewLine;
//    {class} property sEmptyChildren: Jf read _GetsEmptyChildren;
  end;

  [JavaSignature('com/dothantech/data/DzTagObject')]
  JDzTagObject = interface(JObject)
  ['{A2987978-A250-43CE-B2F3-67CFE071995C}']
    { Property Methods }
    function _GetTagName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTagName(aTagName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetTagValue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTagValue(aTagValue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetTagType: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetTagType(aTagType: JDzTagObject_a);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetChildren: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetChildren(aChildren: Jf);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function hashCode: Integer; cdecl;
    function save(P1: JXmlSerializer; P2: JString): Boolean; cdecl; overload;
    function save(P1: JOutputStream; P2: JString): Boolean; cdecl; overload;
    function save(P1: JString): Boolean; cdecl; overload;
    function toString: JString; cdecl;
    function isAttribute: Boolean; cdecl;
    function getProperty(P1: JString): JString; cdecl; overload;
    function getProperty(P1: JString; P2: Boolean): JString; cdecl; overload;
    function getContent: JString; cdecl;
//    function safeChildren: Jf; cdecl;
//    function getChild(P1: JString): JDzTagObject; cdecl;
//    function getChildren(P1: JString): Jf; cdecl;

    { Property }
    property TagName: JString read _GetTagName write _SetTagName;
    property TagValue: JString read _GetTagValue write _SetTagValue;
//    property TagType: JDzTagObject_a read _GetTagType write _SetTagType;
//    property Children: Jf read _GetChildren write _SetChildren;
  end;

  TJDzTagObject = class(TJavaGenericImport<JDzTagObjectClass, JDzTagObject>) end;

//  Je_aClass = interface(Jd_a_137Class) // or JObjectClass
//  ['{2E8C717D-AF0B-4773-8865-78BAF0CA9A10}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/data/e$a')]
//  Je_a = interface(Jd_a_137) // or JObject
//  ['{44676438-93A4-4132-B871-6D8C03C714B2}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//  end;
//
//  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

//  Je_bClass = interface(JExceptionClass) // or JObjectClass
//  ['{E6231D3E-F6DB-485C-B303-58CB656D2B4D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_b; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/data/e$b')]
//  Je_b = interface(JException) // or JObject
//  ['{93FB110D-E8EE-4CC6-BD55-C8C3E880DF92}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJe_b = class(TJavaGenericImport<Je_bClass, Je_b>) end;

//  Je_cClass = interface(JEnumClass) // or JObjectClass
//  ['{022A5F63-52FC-4ECC-9BC9-C2E979FACA8C}']
//    { static Property Methods }
//    {class} function _Geta: Je_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Je_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Je_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Je_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Je_c>; cdecl;
//    {class} function valueOf(P1: JString): Je_c; cdecl;
//    {class} function init: Je_c; cdecl;
//
//    { static Property }
//    {class} property a: Je_c read _Geta;
//    {class} property b: Je_c read _Getb;
//    {class} property c: Je_c read _Getc;
//    {class} property d: Je_c read _Getd;
//  end;
//
//  [JavaSignature('com/dothantech/data/e$c')]
//  Je_c = interface(JEnum) // or JObject
//  ['{013AAF78-6CA2-4355-8FEC-B8D65880B900}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJe_c = class(TJavaGenericImport<Je_cClass, Je_c>) end;

//  Je_145Class = interface(JObjectClass)
//  ['{C3DF6DA5-D848-4D35-9A6A-278EDE4DF4B0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_145; cdecl; overload;
//    {class} function init: Je_145; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/data/e')]
//  Je_145 = interface(JObject)
//  ['{C1D1BAE9-81ED-4075-AB2E-D0AA14FA77B9}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JContext; P2: JString): Je_c; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: JArrayList read _Getb write _Setb;
//  end;
//
//  TJe_145 = class(TJavaGenericImport<Je_145Class, Je_145>) end;

//  Ja_146Class = interface(JObjectClass)
//  ['{14758490-BA75-47FC-B92A-FEB4274FD72E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIDzPrinter): Ja_146; cdecl; overload;
//    {class} function init: Ja_146; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/lpapi/a')]
//  Ja_146 = interface(JObject)
//  ['{56238386-199D-4081-85DE-C164B4E74CB4}']
//    { Property Methods }
//
//    { methods }
//    procedure setBackground(P1: Integer); cdecl;
//    function startJob(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JString): Integer; cdecl; overload;
//    function startJob(P1: Integer; P2: Integer): Integer; cdecl; overload;
//    function startJob(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl; overload;
//    function startJob(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
//    function abortJob: Integer; cdecl;
//    function endJob: Integer; cdecl;
//    function getJobPages(P1: JList): Integer; cdecl;
//    function a: JList; cdecl;
//    function startPage: Integer; cdecl;
//    function endPage: Integer; cdecl;
//    procedure setDrawParam(P1: JString; P2: JObject); cdecl;
//    function setItemOrientation(P1: Integer): Integer; cdecl;
//    function getItemOrientation: Integer; cdecl;
//    function setItemHorizontalAlignment(P1: Integer): Integer; cdecl;
//    function getItemHorizontalAlignment: Integer; cdecl;
//    function setItemVerticalAlignment(P1: Integer): Integer; cdecl;
//    function getItemVerticalAlignment: Integer; cdecl;
//    function setItemPenAlignment(P1: Integer): Integer; cdecl;
//    function getItemPenAlignment: Integer; cdecl;
//    function getStrPrintSize(P1: JString; P2: Integer; P3: Integer): JPoint; cdecl;
//    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Single): Integer; cdecl; overload;
//    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Single; P9: Boolean; P10: Boolean): Integer; cdecl; overload;
//    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
//    function drawRichText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl;
//    function getMin1DBarcode(P1: JString; P2: Integer): JBitmap; cdecl;
//    function draw1DBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;
//    function draw1DBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function draw2DQRCode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function draw2DQRCode(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
//    function draw2DPdf417(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
//    function drawRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
//    function drawFillRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
//    function drawRoundRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;
//    function drawRoundRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
//    function drawFillRoundRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
//    function drawFillRoundRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function drawEllipse(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function drawEllipse(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
//    function drawFillEllipse(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
//    function drawFillEllipse(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl; overload;
//    function drawLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
//    function drawDashLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>; P7: Integer): Integer; cdecl; overload;
//    function drawDashLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;
//    function drawDashLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer): Integer; cdecl; overload;
//    function drawImage(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
//    function drawImage(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function drawImage(P1: JString; P2: Integer; P3: Integer): Integer; cdecl; overload;
//    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
//    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer): Integer; cdecl; overload;
//    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
//    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer): Integer; cdecl; overload;
//    function measureFontHeight(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Single): Integer; cdecl;
//    function getMin2DQRCode(P1: JString): JBitmap; cdecl;
//
//    { Property }
//  end;
//
//  TJa_146 = class(TJavaGenericImport<Ja_146Class, Ja_146>) end;

//  Jb_147Class = interface(JThreadClass) // or JObjectClass
//  ['{0091876A-05F7-402C-AD3D-4D99E1794076}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja; P2: JString; P3: TJavaObjectArray<JBitmap>): Jb_147; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/lpapi/b')]
//  Jb_147 = interface(JThread) // or JObject
//  ['{80A4A136-09A8-4F81-A7EB-F604B36C15E7}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJb_147 = class(TJavaGenericImport<Jb_147Class, Jb_147>) end;

  JIAtBitmap_BarcodeType1DClass = interface(JObjectClass)
  ['{9EEEB722-8475-422B-8D4E-F8733A0FE798}']
    { static Property Methods }
    {class} function _GetUPC_A: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPC_E: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEAN13: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEAN8: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE39: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetITF25: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODABAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE93: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE128: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISBN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetECODE39: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JIAtBitmap_BarcodeType1D; cdecl;
//    {class} function getFormat(P1: Integer): Ja; cdecl;

    { static Property }
    {class} property UPC_A: Integer read _GetUPC_A;
    {class} property UPC_E: Integer read _GetUPC_E;
    {class} property EAN13: Integer read _GetEAN13;
    {class} property EAN8: Integer read _GetEAN8;
    {class} property CODE39: Integer read _GetCODE39;
    {class} property ITF25: Integer read _GetITF25;
    {class} property CODABAR: Integer read _GetCODABAR;
    {class} property CODE93: Integer read _GetCODE93;
    {class} property CODE128: Integer read _GetCODE128;
    {class} property ISBN: Integer read _GetISBN;
    {class} property ECODE39: Integer read _GetECODE39;
    {class} property AUTO: Integer read _GetAUTO;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$BarcodeType1D')]
  JIAtBitmap_BarcodeType1D = interface(JObject)
  ['{58E3718A-DE4E-4BF8-AB3A-79071C96EAE3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_BarcodeType1D = class(TJavaGenericImport<JIAtBitmap_BarcodeType1DClass, JIAtBitmap_BarcodeType1D>) end;

  JIAtBitmap_BarcodeType2DClass = interface(JObjectClass)
  ['{6875461C-7F16-4046-8EBD-E9CCCE8E1EF0}']
    { static Property Methods }
    {class} function _GetQR_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MATRIX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPDF_417: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property QR_CODE: Integer read _GetQR_CODE;
    {class} property DATA_MATRIX: Integer read _GetDATA_MATRIX;
    {class} property PDF_417: Integer read _GetPDF_417;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$BarcodeType2D')]
  JIAtBitmap_BarcodeType2D = interface(IJavaInstance)
  ['{8CF4991C-BBCE-4C17-820A-AD2708CA655D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_BarcodeType2D = class(TJavaGenericImport<JIAtBitmap_BarcodeType2DClass, JIAtBitmap_BarcodeType2D>) end;

  JIAtBitmap_DrawParamNameClass = interface(JObjectClass)
  ['{0F8FBA95-033F-44D8-A14C-76D77E8586E2}']
    { static Property Methods }
    {class} function _GetFONT_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCODE_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_CORRECTION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHARACTER_SET: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMARGIN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property FONT_NAME: JString read _GetFONT_NAME;
    {class} property QRCODE_VERSION: JString read _GetQRCODE_VERSION;
    {class} property ERROR_CORRECTION: JString read _GetERROR_CORRECTION;
    {class} property CHARACTER_SET: JString read _GetCHARACTER_SET;
    {class} property MARGIN: JString read _GetMARGIN;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$DrawParamName')]
  JIAtBitmap_DrawParamName = interface(IJavaInstance)
  ['{99F8A38C-D0F2-467E-A206-D665101B4FB3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_DrawParamName = class(TJavaGenericImport<JIAtBitmap_DrawParamNameClass, JIAtBitmap_DrawParamName>) end;

  JIAtBitmap_ErrorCorrectionLevelClass = interface(JObjectClass)
  ['{04100702-6A99-419E-A2D6-4368C495BD0C}']
    { static Property Methods }
    {class} function _GetL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQ: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property L: Integer read _GetL;
    {class} property M: Integer read _GetM;
    {class} property Q: Integer read _GetQ;
    {class} property H: Integer read _GetH;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$ErrorCorrectionLevel')]
  JIAtBitmap_ErrorCorrectionLevel = interface(IJavaInstance)
  ['{1C6016A0-3338-4B9A-8F8F-826DAC758E24}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_ErrorCorrectionLevel = class(TJavaGenericImport<JIAtBitmap_ErrorCorrectionLevelClass, JIAtBitmap_ErrorCorrectionLevel>) end;

  JIAtBitmap_FactoryClass = interface(JObjectClass)
  ['{AEDC0B31-E170-4C44-8687-EEDFF3FC772B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIAtBitmap_Factory; cdecl;
    {class} function createInstance: JIAtBitmap; cdecl; overload;
    {class} function createInstance(P1: JIDzPrinter): JIAtBitmap; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$Factory')]
  JIAtBitmap_Factory = interface(JObject)
  ['{ECEE028E-EF77-4CE2-964C-2C5F222CB452}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_Factory = class(TJavaGenericImport<JIAtBitmap_FactoryClass, JIAtBitmap_Factory>) end;

  JIAtBitmap_FontStyleClass = interface(JObjectClass)
  ['{ABFAF2A0-6118-40BB-A8E0-2244B37F1C10}']
    { static Property Methods }
    {class} function _GetREGULAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOLD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetITALIC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOLDITALIC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNDERLINE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTRIKEOUT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property REGULAR: Integer read _GetREGULAR;
    {class} property BOLD: Integer read _GetBOLD;
    {class} property ITALIC: Integer read _GetITALIC;
    {class} property BOLDITALIC: Integer read _GetBOLDITALIC;
    {class} property UNDERLINE: Integer read _GetUNDERLINE;
    {class} property STRIKEOUT: Integer read _GetSTRIKEOUT;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$FontStyle')]
  JIAtBitmap_FontStyle = interface(IJavaInstance)
  ['{FECBF574-57FA-4D48-AADF-4F730C5342EF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_FontStyle = class(TJavaGenericImport<JIAtBitmap_FontStyleClass, JIAtBitmap_FontStyle>) end;

  JIAtBitmap_ItemAlignmentClass = interface(JObjectClass)
  ['{4E219794-9D6F-4CEE-B981-6DF3FF57F25F}']
    { static Property Methods }
    {class} function _GetNEAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCENTER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSAMEASITEM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEFT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIDDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOTTOM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property &NEAR: Integer read _GetNEAR;
    {class} property CENTER: Integer read _GetCENTER;
    {class} property &FAR: Integer read _GetFAR;
    {class} property SAMEASITEM: Integer read _GetSAMEASITEM;
    {class} property LEFT: Integer read _GetLEFT;
    {class} property RIGHT: Integer read _GetRIGHT;
    {class} property TOP: Integer read _GetTOP;
    {class} property MIDDLE: Integer read _GetMIDDLE;
    {class} property BOTTOM: Integer read _GetBOTTOM;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$ItemAlignment')]
  JIAtBitmap_ItemAlignment = interface(IJavaInstance)
  ['{BBE22F9D-9E72-45D8-8602-7B7FB28C0CBC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_ItemAlignment = class(TJavaGenericImport<JIAtBitmap_ItemAlignmentClass, JIAtBitmap_ItemAlignment>) end;

  JIAtBitmap_LabelScaleUnitClass = interface(JObjectClass)
  ['{C9A7D5A3-AA7E-497B-A656-D9FC8C784300}']
    { static Property Methods }
    {class} function _GetPIXEL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMM01: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property PIXEL: Integer read _GetPIXEL;
    {class} property MM01: Integer read _GetMM01;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$LabelScaleUnit')]
  JIAtBitmap_LabelScaleUnit = interface(IJavaInstance)
  ['{28E5D361-E3F0-463D-8F77-C54639013113}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_LabelScaleUnit = class(TJavaGenericImport<JIAtBitmap_LabelScaleUnitClass, JIAtBitmap_LabelScaleUnit>) end;

  JIAtBitmap_PenAlignmentClass = interface(JObjectClass)
  ['{0AF8ADAC-5209-4563-B0C4-EA4763D14556}']
    { static Property Methods }
    {class} function _GetCENTER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINSET: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property CENTER: Integer read _GetCENTER;
    {class} property INSET: Integer read _GetINSET;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$PenAlignment')]
  JIAtBitmap_PenAlignment = interface(IJavaInstance)
  ['{A4837D03-A4A7-467E-A2DD-D5BF62A3240D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_PenAlignment = class(TJavaGenericImport<JIAtBitmap_PenAlignmentClass, JIAtBitmap_PenAlignment>) end;

  JIAtBitmap_ResultCodeClass = interface(JObjectClass)
  ['{98D3E758-2C79-404E-A049-756C0D75DB4A}']
    { static Property Methods }
    {class} function _GetOK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAM_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYSTEM_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOPRINTDATA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOPAGEDIMENSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINVALID_FILE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTDATANOTREADY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property OK: Integer read _GetOK;
    {class} property PARAM_ERROR: Integer read _GetPARAM_ERROR;
    {class} property SYSTEM_ERROR: Integer read _GetSYSTEM_ERROR;
    {class} property NOPRINTDATA: Integer read _GetNOPRINTDATA;
    {class} property NOPAGEDIMENSION: Integer read _GetNOPAGEDIMENSION;
    {class} property INVALID_FILE: Integer read _GetINVALID_FILE;
    {class} property PRINTDATANOTREADY: Integer read _GetPRINTDATANOTREADY;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$ResultCode')]
  JIAtBitmap_ResultCode = interface(IJavaInstance)
  ['{62D713A6-00DD-48D9-8AD5-63C4E8762D6D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_ResultCode = class(TJavaGenericImport<JIAtBitmap_ResultCodeClass, JIAtBitmap_ResultCode>) end;

  JIAtBitmapClass = interface(JObjectClass)
  ['{D38A0F05-F6FB-4920-847E-8E28DBDE1CD0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap')]
  JIAtBitmap = interface(IJavaInstance)
  ['{E2D6FD0A-BDA8-4349-859F-72824D3BC7D7}']
    { Property Methods }

    { methods }
    procedure setBackground(P1: Integer); cdecl;
    function startJob(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JString): Integer; cdecl; overload;
    function startJob(P1: Integer; P2: Integer): Integer; cdecl; overload;
    function startJob(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function startJob(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
    function abortJob: Integer; cdecl;
    function endJob: Integer; cdecl;
    function getJobPages(P1: JList): Integer; cdecl;
    function startPage: Integer; cdecl;
    function endPage: Integer; cdecl;
    procedure setDrawParam(P1: JString; P2: JObject); cdecl;
    function setItemOrientation(P1: Integer): Integer; cdecl;
    function getItemOrientation: Integer; cdecl;
    function setItemHorizontalAlignment(P1: Integer): Integer; cdecl;
    function getItemHorizontalAlignment: Integer; cdecl;
    function setItemVerticalAlignment(P1: Integer): Integer; cdecl;
    function getItemVerticalAlignment: Integer; cdecl;
    function setItemPenAlignment(P1: Integer): Integer; cdecl;
    function getItemPenAlignment: Integer; cdecl;
//    function getStrPrintSize(P1: JString; P2: Integer; P3: Integer): JPoint; cdecl;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Single; P9: Boolean; P10: Boolean): Integer; cdecl; overload;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Single): Integer; cdecl; overload;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function drawRichText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl;
    function draw1DBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;
    function draw1DBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function getMin1DBarcode(P1: JString; P2: Integer): JBitmap; cdecl;
    function draw2DQRCode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function draw2DQRCode(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
//    function getMin2DQRCode(P1: JString): JBitmap; cdecl;
    function draw2DPdf417(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    function drawRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    function drawFillRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
    function drawRoundRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;
    function drawRoundRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
    function drawFillRoundRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
    function drawFillRoundRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function drawEllipse(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function drawEllipse(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
    function drawFillEllipse(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
    function drawFillEllipse(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function drawLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    function drawDashLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Integer>; P7: Integer): Integer; cdecl; overload;
    function drawDashLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;
    function drawDashLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer): Integer; cdecl; overload;
    function drawImage(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
    function drawImage(P1: JString; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function drawImage(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
//    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer): Integer; cdecl; overload;
//    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function measureFontHeight(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Single): Integer; cdecl;

    { Property }
  end;

  TJIAtBitmap = class(TJavaGenericImport<JIAtBitmapClass, JIAtBitmap>) end;

//  JLPAPI_1Class = interface(JObjectClass)
//  ['{59108CA6-AF21-46B8-9639-501FFA4F6F65}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_dothantech_printer_IDzPrinter_PrinterState: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JLPAPI_1; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_dothantech_printer_IDzPrinter_PrinterState: TJavaArray<Integer> read _Get_SwitchMap_com_dothantech_printer_IDzPrinter_PrinterState;
//  end;
//
//  [JavaSignature('com/dothantech/lpapi/LPAPI$1')]
//  JLPAPI_1 = interface(JObject)
//  ['{BE477F48-68C5-43E8-BFAB-4CE526C56E94}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJLPAPI_1 = class(TJavaGenericImport<JLPAPI_1Class, JLPAPI_1>) end;

  JLPAPI_BarcodeTypeClass = interface(JIAtBitmap_BarcodeType1DClass) // or JObjectClass
  ['{A8046EB3-5DA8-4321-952E-CAF4DED35A3E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLPAPI_BarcodeType; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$BarcodeType')]
  JLPAPI_BarcodeType = interface(JIAtBitmap_BarcodeType1D) // or JObject
  ['{564407E3-06B6-4DCE-B630-8CE77CA4249C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_BarcodeType = class(TJavaGenericImport<JLPAPI_BarcodeTypeClass, JLPAPI_BarcodeType>) end;

  JLPAPI_CallbackClass = interface(JObjectClass)
  ['{316B2D61-1E54-49D9-8770-487777B0F9C2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$Callback')]
  JLPAPI_Callback = interface(IJavaInstance)
  ['{8C4909C5-0EEF-40F7-A705-680943B4096F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_Callback = class(TJavaGenericImport<JLPAPI_CallbackClass, JLPAPI_Callback>) end;

  JLPAPI_FactoryClass = interface(JObjectClass)
  ['{709790ED-8DC1-42E1-B5A4-734B9349E2EF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLPAPI_Factory; cdecl;
//    {class} function getPrinterAddress(P1: JBluetoothDevice): JIDzPrinter_PrinterAddress; cdecl;
    {class} function createInstance: JLPAPI; cdecl; overload;
    {class} function createInstance(P1: JLPAPI_Callback): JLPAPI; cdecl; overload;
//    {class} function createInstance(P1: JWebView): JLPAPI; cdecl; overload;
//    {class} function createInstance(P1: JWebView; P2: JLPAPI_Callback): JLPAPI; cdecl; overload;
//    {class} function createInstance(P1: JWebView; P2: JString; P3: JLPAPI_Callback): JLPAPI; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$Factory')]
  JLPAPI_Factory = interface(JObject)
  ['{7A13D62A-B947-441A-A23E-088C92086E84}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_Factory = class(TJavaGenericImport<JLPAPI_FactoryClass, JLPAPI_Factory>) end;

  JLPAPI_FontStyleClass = interface(JObjectClass)
  ['{0A2F38CD-E952-41BB-A3E3-92F2DD78AB36}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$FontStyle')]
  JLPAPI_FontStyle = interface(IJavaInstance)
  ['{1DAAD92B-F770-4131-987F-43DC2B7B332F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_FontStyle = class(TJavaGenericImport<JLPAPI_FontStyleClass, JLPAPI_FontStyle>) end;

  JLPAPI_ItemAlignmentClass = interface(JObjectClass)
  ['{A5A88F65-C78E-4903-862C-9DB3F1FAD928}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$ItemAlignment')]
  JLPAPI_ItemAlignment = interface(IJavaInstance)
  ['{60F7AE1C-E5A3-4ED6-B922-F665503E8051}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_ItemAlignment = class(TJavaGenericImport<JLPAPI_ItemAlignmentClass, JLPAPI_ItemAlignment>) end;

  JLPAPI_PenAlignmentClass = interface(JObjectClass)
  ['{25A18DCB-E3A6-4DC8-9BD2-36357C6D0B3F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$PenAlignment')]
  JLPAPI_PenAlignment = interface(IJavaInstance)
  ['{F2C23C69-3590-40DD-BF1E-6988D8ABDDE4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_PenAlignment = class(TJavaGenericImport<JLPAPI_PenAlignmentClass, JLPAPI_PenAlignment>) end;

  JLPAPI_PrintParamNameClass = interface(JObjectClass)
  ['{F2808CCB-B0AA-4367-9BE7-22797EC410AC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$PrintParamName')]
  JLPAPI_PrintParamName = interface(IJavaInstance)
  ['{962B8FC1-1665-497A-8712-03280415C8C9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_PrintParamName = class(TJavaGenericImport<JLPAPI_PrintParamNameClass, JLPAPI_PrintParamName>) end;

  JLPAPI_PrintParamValueClass = interface(JObjectClass)
  ['{F78763D9-BD5F-43F4-8D1A-F28A37731F45}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$PrintParamValue')]
  JLPAPI_PrintParamValue = interface(IJavaInstance)
  ['{A5A4FCD5-1BB9-4C67-90B2-E7697BA48027}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_PrintParamValue = class(TJavaGenericImport<JLPAPI_PrintParamValueClass, JLPAPI_PrintParamValue>) end;

  JLPAPIClass = interface(JObjectClass)
  ['{0BA07B07-8A0F-4489-A1CB-99162F156BD5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLPAPI; cdecl; overload;
    {class} function init(P1: JLPAPI_Callback): JLPAPI; cdecl; overload;
    {class} function init(P1: JIDzPrinter; P2: JLPAPI_Callback): JLPAPI; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI')]
  JLPAPI = interface(JObject)
  ['{C2FF0962-D7F5-4723-92B9-4E6499797A2A}']
    { Property Methods }
    function _GetmPrinter: JIDzPrinter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmPrinter(amPrinter: JIDzPrinter);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmBitmap: JIAtBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmBitmap(amBitmap: JIAtBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getAllPrinters(P1: JString): JString; cdecl;
    function getAllPrinterAddresses(P1: JString): JList; cdecl;
    function getFirstPrinter: JIDzPrinter_PrinterAddress; cdecl;
    function openPrinter(P1: JString): Boolean; cdecl; overload;
    function openPrinterByAddress(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl;
//    function openPrinter(P1: JBluetoothDevice): Boolean; cdecl; overload;
    function openPrinterSync(P1: JString): Boolean; cdecl;
    function openPrinterByAddressSync(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl;
    function getPrinterName: JString; cdecl;
    function getPrinterInfo: JIDzPrinter_PrinterInfo; cdecl;
    function getPrinterState: JIDzPrinter_PrinterState; cdecl;
    function isPrinterOpened: Boolean; cdecl;
    procedure cancel; cdecl;
    procedure closePrinter; cdecl;
    function reopenPrinter: Boolean; cdecl;
    function reopenPrinterSync: Boolean; cdecl;
    procedure quit; cdecl;
    function printBitmap(P1: JBitmap; P2: JBundle): Boolean; cdecl;
    function printATBitmap(P1: JIAtBitmap; P2: JBundle): Boolean; cdecl;
    function waitPrinterState(P1: JIDzPrinter_PrinterState; P2: Integer): Boolean; cdecl;
    function startJob(P1: Double; P2: Double; P3: Integer): Boolean; cdecl;
    procedure abortJob; cdecl;
    function commitJob: Boolean; cdecl;
    function commitJobWithParam(P1: JBundle): Boolean; cdecl;
    function startPage: Boolean; cdecl;
    procedure endPage; cdecl;
    procedure endJob; cdecl;
    function getJobPages: JList; cdecl;
    procedure setDrawParam(P1: JString; P2: JObject); cdecl;
    function getItemOrientation: Integer; cdecl;
    procedure setItemOrientation(P1: Integer); cdecl;
    function getItemHorizontalAlignment: Integer; cdecl;
    procedure setItemHorizontalAlignment(P1: Integer); cdecl;
    function getItemVerticalAlignment: Integer; cdecl;
    procedure setItemVerticalAlignment(P1: Integer); cdecl;
    function getItemPenAlignment: Integer; cdecl;
    procedure setItemPenAlignment(P1: Integer); cdecl;
    procedure setBackground(P1: Integer); cdecl;
    function drawText(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double): Boolean; cdecl;
    function drawTextRegular(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Single): Boolean; cdecl;
    function drawTextWithIndent(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Single): Boolean; cdecl;
    function drawTextWithScale(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Single; P9: Boolean): Boolean; cdecl;
    function drawRichText(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer): Boolean; cdecl;
    function draw1DBarcode(P1: JString; P2: Integer; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double): Boolean; cdecl;
    function draw2DQRCode(P1: JString; P2: Double; P3: Double; P4: Double): Boolean; cdecl;
    function draw2DPdf417(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double): Boolean; cdecl;
    function drawRectangle(P1: Double; P2: Double; P3: Double; P4: Double; P5: Double): Boolean; cdecl;
    function fillRectangle(P1: Double; P2: Double; P3: Double; P4: Double): Boolean; cdecl;
    function drawRoundRectangle(P1: Double; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double): Boolean; cdecl;
    function fillRoundRectangle(P1: Double; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double): Boolean; cdecl;
    function drawEllipse(P1: Double; P2: Double; P3: Double; P4: Double; P5: Double): Boolean; cdecl;
    function fillEllipse(P1: Double; P2: Double; P3: Double; P4: Double): Boolean; cdecl;
    function drawCircle(P1: Double; P2: Double; P3: Double; P4: Double): Boolean; cdecl;
    function fillCircle(P1: Double; P2: Double; P3: Double): Boolean; cdecl;
    function drawLine(P1: Double; P2: Double; P3: Double; P4: Double; P5: Double): Boolean; cdecl;
    function drawDashLine(P1: Double; P2: Double; P3: Double; P4: Double; P5: Double; P6: TJavaArray<Double>; P7: Integer): Boolean; cdecl;
    function drawDashLine2(P1: Double; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double): Boolean; cdecl;
    function drawDashLine4(P1: Double; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double): Boolean; cdecl;
    function drawImageWithThreshold(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer): Boolean; cdecl;
    function drawImage(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double): Boolean; cdecl;
    function drawImageWithActualSize(P1: JString; P2: Double; P3: Double): Boolean; cdecl;
    function drawBitmapWithThreshold(P1: JBitmap; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer): Boolean; cdecl;
    function drawBitmap(P1: JBitmap; P2: Double; P3: Double; P4: Double; P5: Double): Boolean; cdecl;
    function drawBitmapWithActualSize(P1: JBitmap; P2: Double; P3: Double): Boolean; cdecl;
    function drawBitmapStreamWithThreshold(P1: JInputStream; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer): Boolean; cdecl;
    function drawBitmapStream(P1: JInputStream; P2: Double; P3: Double; P4: Double; P5: Double): Boolean; cdecl;
    function drawBitmapStreamWithActualSize(P1: JInputStream; P2: Double; P3: Double): Boolean; cdecl;
    function measureFontHeight(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Single): Double; cdecl;

    { Property }
    property mPrinter: JIDzPrinter read _GetmPrinter write _SetmPrinter;
    property mBitmap: JIAtBitmap read _GetmBitmap write _SetmBitmap;
  end;

  TJLPAPI = class(TJavaGenericImport<JLPAPIClass, JLPAPI>) end;

//  Ja_a_169Class = interface(JEnumClass) // or JObjectClass
//  ['{AA6C3A03-1CF5-4256-BDCB-0DA5CE9B9B8E}']
//    { static Property Methods }
//    {class} function _Geta: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ja_a>; cdecl;
//    {class} function valueOf(P1: JString): Ja_a; cdecl;
//    {class} function init: Ja_a_169; cdecl;
//
//    { static Property }
//    {class} property a: Ja_a read _Geta;
//    {class} property b: Ja_a read _Getb;
//    {class} property c: Ja_a read _Getc;
//  end;
//
//  [JavaSignature('com/dothantech/printer/a$a')]
//  Ja_a_169 = interface(JEnum) // or JObject
//  ['{B2E0E9F6-4F3B-40EB-AD2D-322852326805}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_a_169 = class(TJavaGenericImport<Ja_a_169Class, Ja_a_169>) end;

//  Ja_170Class = interface(JObjectClass)
//  ['{53272B97-0A40-4146-A0A8-0093C2E3C567}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jm_a; P2: JIDzPrinter2_PrinterParam): Ja_170; cdecl; overload;
//    {class} function init: Ja_170; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/a')]
//  Ja_170 = interface(JObject)
//  ['{45EFD434-4E4F-489F-9D52-AFC929F69287}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JBitmap; P2: JBundle): Boolean; cdecl; overload;
//    function a: Jd_a; cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;
//
//  TJa_170 = class(TJavaGenericImport<Ja_170Class, Ja_170>) end;

//  Jb_171Class = interface(JObjectClass)
//  ['{254D0C4F-E867-439D-9D34-4323BDE8E3A7}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jb_171; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;
//
//  [JavaSignature('com/dothantech/printer/b')]
//  Jb_171 = interface(JObject)
//  ['{1D292E09-724E-4E6D-BF1B-1A527F38E43D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJb_171 = class(TJavaGenericImport<Jb_171Class, Jb_171>) end;

//  Jc_172Class = interface(JaqClass) // or JObjectClass
//  ['{9FDED3A9-15D5-448F-B50C-35718C44CC32}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter; P2: JString): Jc_172; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/c')]
//  Jc_172 = interface(Jaq) // or JObject
//  ['{682B3180-427B-4DD0-A45D-D19615C3037B}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Integer; P2: Integer; P3: JObject): Integer; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJc_172 = class(TJavaGenericImport<Jc_172Class, Jc_172>) end;

//  Jd_173Class = interface(JObjectClass)
//  ['{81DE50A8-ADCC-4531-A5C6-8B7E882E766C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter): Jd_173; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/d')]
//  Jd_173 = interface(JObject)
//  ['{4AFBAB3A-6105-45C3-A341-102D58F4859D}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJd_173 = class(TJavaGenericImport<Jd_173Class, Jd_173>) end;

//  JDzPrinter_bClass = interface(JObjectClass)
//  ['{BCA8A3E8-6A32-4A08-8374-33D0544533E0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JObject; P2: JIDzPrinter_IActionCallback): JDzPrinter_b; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/DzPrinter$b')]
//  JDzPrinter_b = interface(JObject)
//  ['{EA57E018-7AB5-46F5-AE7D-80BA0F6E565F}']
//    { Property Methods }
//    function _Getb: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JIDzPrinter_IActionCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JIDzPrinter_IActionCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property b: JObject read _Getb write _Setb;
//    property c: JIDzPrinter_IActionCallback read _Getc write _Setc;
//  end;
//
//  TJDzPrinter_b = class(TJavaGenericImport<JDzPrinter_bClass, JDzPrinter_b>) end;

//  JDzPrinter_aClass = interface(JDzPrinter_bClass) // or JObjectClass
//  ['{4C092BF6-4029-4414-A89D-8817A0048474}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIDzPrinter_AddressType; P2: JIDzPrinter_PrinterAddress; P3: JIDzPrinter_IActionCallback): JDzPrinter_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/DzPrinter$a')]
//  JDzPrinter_a = interface(JDzPrinter_b) // or JObject
//  ['{FE7EE1B7-1676-47E6-BF51-D78516F98A7C}']
//    { Property Methods }
//    function _Geta: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIDzPrinter_AddressType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JIDzPrinter_AddressType read _Geta write _Seta;
//  end;
//
//  TJDzPrinter_a = class(TJavaGenericImport<JDzPrinter_aClass, JDzPrinter_a>) end;

//  JDzPrinter_cClass = interface(JDzPrinter_bClass) // or JObjectClass
//  ['{7173CF44-BFD9-4096-B890-433A7E017D1F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBitmap; P2: JBundle; P3: JIDzPrinter_IActionCallback): JDzPrinter_c; cdecl; overload;
//    {class} function init(P1: Jv; P2: JBundle; P3: JIDzPrinter_IActionCallback): JDzPrinter_c; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/DzPrinter$c')]
//  JDzPrinter_c = interface(JDzPrinter_b) // or JObject
//  ['{B6C0F07D-06D8-4523-9528-B04C1D5CE9FA}']
//    { Property Methods }
//    function _Geta: JBundle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JBundle);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JBundle read _Geta write _Seta;
//  end;
//
//  TJDzPrinter_c = class(TJavaGenericImport<JDzPrinter_cClass, JDzPrinter_c>) end;

//  JDzPrinter_dClass = interface(JDzPrinter_bClass) // or JObjectClass
//  ['{1B17009F-6915-42B0-BC45-374E9E6980E5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd_a; P2: JIDzPrinter_IActionCallback): JDzPrinter_d; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/DzPrinter$d')]
//  JDzPrinter_d = interface(JDzPrinter_b) // or JObject
//  ['{E240C492-F04F-4AFC-A5EB-B4786CEA13BE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDzPrinter_d = class(TJavaGenericImport<JDzPrinter_dClass, JDzPrinter_d>) end;

//  JDzPrinter_eClass = interface(JDzPrinter_bClass) // or JObjectClass
//  ['{42A5DB50-7647-4CA6-8008-80D6D5DC608F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBundle; P2: JIDzPrinter_IActionCallback): JDzPrinter_e; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/DzPrinter$e')]
//  JDzPrinter_e = interface(JDzPrinter_b) // or JObject
//  ['{BBC68DE0-722D-4418-9ED0-D3938C1326E4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDzPrinter_e = class(TJavaGenericImport<JDzPrinter_eClass, JDzPrinter_e>) end;

//  JDzPrinter_fClass = interface(JObjectClass)
//  ['{63A3C308-5D4A-45F4-9882-72ED0D141632}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter; P2: JString; P3: JString): JDzPrinter_f; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/DzPrinter$f')]
//  JDzPrinter_f = interface(JObject)
//  ['{5F36847F-F2B2-456A-B96A-388D144CB85A}']
//    { Property Methods }
//    function _Geta: JIDzPrinter_PrinterAddress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIDzPrinter_PrinterAddress);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JIDzPrinter_PrinterAddress read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//  end;
//
//  TJDzPrinter_f = class(TJavaGenericImport<JDzPrinter_fClass, JDzPrinter_f>) end;

//  JDzPrinterClass = interface(JavClass) // or JObjectClass
//  ['{CFA56156-E9E6-401F-AA0D-2C398E0CD18B}']
//    { static Property Methods }
//    {class} function _Getc: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function e: Boolean; cdecl;
//    {class} function getInstance: JIDzPrinter2; cdecl;
//    {class} function a(P1: JBluetoothDevice; P2: JInteger): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
//    {class} function a(P1: JIDzPrinter_PrinterAddress; P2: Boolean): JIDzPrinter_PrinterAddress; cdecl; overload;
//    {class} procedure f; cdecl;
//    {class} function g: Integer; cdecl;
//    {class} function a(P1: JIntent): JInteger; cdecl; overload;
//    {class} function a(P1: JDzPrinter): Jau; cdecl; overload;
//    {class} function b(P1: JDzPrinter): Jau; cdecl; overload;
//    {class} function c(P1: JDzPrinter): Jau; cdecl; overload;
//    {class} function init: JDzPrinter; cdecl; overload;
//
//    { static Property }
//    {class} property c: Jw read _Getc;
//    {class} property d: Boolean read _Getd;
//  end;
//
//  [JavaSignature('com/dothantech/printer/DzPrinter')]
//  JDzPrinter = interface(Jav) // or JObject
//  ['{0443F4A5-AEC4-46D7-821B-59E2DDE3E727}']
//    { Property Methods }
//    function _Gete: JThread;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JThread);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Ja);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Jaq;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Jaq);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Jaq;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jaq);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: JBroadcastReceiver;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: JBroadcastReceiver);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: JBluetoothAdapter_LeScanCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: JBluetoothAdapter_LeScanCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JDzPrinter_f;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JDzPrinter_f);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: JIDzPrinter_PrinterAddress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: JIDzPrinter_PrinterAddress);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Jm_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Jm_a);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: JIDzPrinter2_PrinterParam;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: JIDzPrinter2_PrinterParam);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function init(P1: JContext; P2: JIDzPrinter_IDzPrinterCallback): Boolean; cdecl; overload;
//    procedure quit; cdecl;
//    function connect(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl; overload;
//    function connect(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function connect(P1: JBluetoothDevice): Boolean; cdecl; overload;
//    function connect(P1: JBluetoothDevice; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function connect(P1: JString): Boolean; cdecl; overload;
//    function connect(P1: JString; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function connectSync(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl; overload;
//    function connectSync(P1: JString): Boolean; cdecl; overload;
//    procedure disconnect; cdecl;
//    function reconnect: Boolean; cdecl; overload;
//    function reconnect(P1: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function reconnectSync: Boolean; cdecl;
//    function getPrinterState: JIDzPrinter_PrinterState; cdecl;
//    function print(P1: JBitmap; P2: JBundle): Boolean; cdecl; overload;
//    function print(P1: JBitmap; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function print(P1: Ju; P2: JBundle): Boolean; cdecl; overload;
//    function print(P1: Ju; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function print(P1: Jv; P2: JBundle): Boolean; cdecl; overload;
//    function print(P1: Jv; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function command(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
//    function command(P1: TJavaArray<Byte>; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function upgrade(P1: JString): Boolean; cdecl; overload;
//    function upgrade(P1: JString; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    procedure cancel; cdecl; overload;
//    procedure cancel(P1: Integer); cdecl; overload;
//    function bond(P1: JString): Boolean; cdecl; overload;
//    function bond(P1: JString; P2: JString): Boolean; cdecl; overload;
//    function onNfcDiscovery(P1: JIntent): Boolean; cdecl;
//    function getPrinterCapability: Jm_a; cdecl;
//    function getPrinterParam: JIDzPrinter2_PrinterParam; cdecl;
//    function getPrinterInfo: JIDzPrinter_PrinterInfo; cdecl;
//    function waitPrinterState(P1: JIDzPrinter_PrinterState; P2: Int64): Boolean; cdecl;
//    function refreshPrinterParam: Boolean; cdecl;
//    function setPrinterParam(P1: JBundle): Boolean; cdecl; overload;
//    function setPrinterParam(P1: JBundle; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function sendDataPackage(P1: Jd_a): Boolean; cdecl; overload;
//    function sendDataPackage(P1: Jd_a; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function startDeviceDiscovery(P1: JIDzPrinter_AddressType): Boolean; cdecl; overload;
//    function startDeviceDiscovery(P1: JIDzPrinter_AddressType; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    procedure onProgressInfo(P1: JIDzPrinter_ProgressInfo; P2: JObject); cdecl;
//    procedure onStateChange(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrinterState); cdecl;
//    procedure onPrintProgress(P1: JIDzPrinter_PrinterAddress; P2: JObject; P3: JIDzPrinter_PrintProgress; P4: JObject); cdecl;
//    procedure onPrinterDiscovery(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrinterInfo); cdecl;
//    procedure onBondProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
//    procedure onSetParamProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
//    procedure onSendDataProgress(P1: Jd_a; P2: JIDzPrinter_GeneralProgress); cdecl;
//    procedure onPrinterParamChanged(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter2_PrinterParam; P3: JIDzPrinter2_PrinterParam); cdecl;
//    procedure onDeviceDiscovery(P1: JIDzPrinter_GeneralProgress; P2: JObject); cdecl;
//    procedure c; cdecl; overload;
//    procedure d; cdecl;
//    function b(P1: JMessage): Boolean; cdecl; overload;
//    procedure c(P1: Integer); cdecl; overload;
//    procedure a(P1: JBluetoothDevice; P2: Integer); cdecl; overload;
//    function b(P1: Integer; P2: Integer; P3: JObject): Integer; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl; overload;
//    function a(P1: JString; P2: JInteger): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
//    function a(P1: JString): JIDzPrinter_PrinterAddress; cdecl; overload;
//    procedure a(P1: Jb); cdecl; overload;
//    procedure a(P1: Jq); cdecl; overload;
//    procedure a(P1: Jq; P2: Jb); cdecl; overload;
//    procedure a(P1: Jq; P2: JString); cdecl; overload;
//    function b(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl; overload;
//    function a: Boolean; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JIDzPrinter_GeneralProgress; P2: JObject); cdecl; overload;
//
//    { Property }
//    property e: JThread read _Gete write _Sete;
//    property f: Ja read _Getf write _Setf;
//    property g: Byte read _Getg write _Setg;
//    property h: Jaq read _Geth write _Seth;
//    property i: Jaq read _Geti write _Seti;
//    property j: Integer read _Getj write _Setj;
//    property k: JBroadcastReceiver read _Getk write _Setk;
//    property l: JBluetoothAdapter_LeScanCallback read _Getl write _Setl;
//    property m: JDzPrinter_f read _Getm write _Setm;
//    property n: JIDzPrinter_PrinterAddress read _Getn write _Setn;
//    property o: Jm_a read _Geto write _Seto;
//    property p: JIDzPrinter2_PrinterParam read _Getp write _Setp;
//  end;
//
//  TJDzPrinter = class(TJavaGenericImport<JDzPrinterClass, JDzPrinter>) end;

//  Je_181Class = interface(JObjectClass)
//  ['{4A8E1D7D-47D4-4A58-A3B6-9F6ED58E6A45}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter; P2: JBluetoothDevice): Je_181; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/e')]
//  Je_181 = interface(JObject)
//  ['{0D9991BC-9B8D-42D6-9D16-3D4440DE980A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJe_181 = class(TJavaGenericImport<Je_181Class, Je_181>) end;

//  Jf_182Class = interface(JObjectClass)
//  ['{65AB786F-8FF0-4D07-AE27-BC9C320CB216}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter): Jf_182; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/f')]
//  Jf_182 = interface(JObject)
//  ['{3B65E5B2-6053-46A0-9998-54877C72CFE4}']
//    { Property Methods }
//    function _Geta: JDzPrinter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JDzPrinter);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onLeScan(P1: JBluetoothDevice; P2: Integer; P3: TJavaArray<Byte>); cdecl;
//
//    { Property }
//    property a: JDzPrinter read _Geta write _Seta;
//  end;
//
//  TJf_182 = class(TJavaGenericImport<Jf_182Class, Jf_182>) end;

//  Jg_183Class = interface(JObjectClass)
//  ['{5A03399C-F612-44E3-A745-299AD251223C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jf; P2: JIDzPrinter2_DiscoveriedPrinter): Jg_183; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/g')]
//  Jg_183 = interface(JObject)
//  ['{FC15BC0B-6247-4C32-BF81-30F80C1BBE4E}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJg_183 = class(TJavaGenericImport<Jg_183Class, Jg_183>) end;

//  Jh_184Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{00CA1EE5-B105-4098-80B4-F172C7C22C0D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter): Jh_184; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/h')]
//  Jh_184 = interface(JBroadcastReceiver) // or JObject
//  ['{868744E5-CE2C-4F6D-81F6-E92F42378E8B}']
//    { Property Methods }
//    function _Geta: JDzPrinter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JDzPrinter);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//    property a: JDzPrinter read _Geta write _Seta;
//  end;
//
//  TJh_184 = class(TJavaGenericImport<Jh_184Class, Jh_184>) end;

//  Ji_185Class = interface(JObjectClass)
//  ['{5190BFD2-4B6A-46A8-8353-0FF53F05380C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jh; P2: JIDzPrinter2_DiscoveriedPrinter): Ji_185; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/i')]
//  Ji_185 = interface(JObject)
//  ['{F28AC64A-C8AD-43F4-9742-2E4F607DA9BB}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJi_185 = class(TJavaGenericImport<Ji_185Class, Ji_185>) end;

//  JIDzPrinter_1Class = interface(JObjectClass)
//  ['{52E42B32-3DE3-4BDF-8D00-DFAEC66C813A}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_dothantech_printer_IDzPrinter_AddressType: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JIDzPrinter_1; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_dothantech_printer_IDzPrinter_AddressType: TJavaArray<Integer> read _Get_SwitchMap_com_dothantech_printer_IDzPrinter_AddressType;
//  end;
//
//  [JavaSignature('com/dothantech/printer/IDzPrinter$1')]
//  JIDzPrinter_1 = interface(JObject)
//  ['{065E53DC-9A51-44AC-84DD-EFF943A44EE8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJIDzPrinter_1 = class(TJavaGenericImport<JIDzPrinter_1Class, JIDzPrinter_1>) end;

  JIDzPrinter_AddressTypeClass = interface(JEnumClass) // or JObjectClass
  ['{9BA31E6A-0F2E-416F-AF88-89449ADD4E76}']
    { static Property Methods }
    {class} function _GetSPP: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBLE: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUAL: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWiFi: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JIDzPrinter_AddressType>; cdecl;
    {class} function valueOf(P1: JString): JIDzPrinter_AddressType; cdecl;
    {class} function isBluetooth(P1: JIDzPrinter_AddressType): Boolean; cdecl;
    {class} function init: JIDzPrinter_AddressType; cdecl;

    { static Property }
    {class} property SPP: JIDzPrinter_AddressType read _GetSPP;
    {class} property BLE: JIDzPrinter_AddressType read _GetBLE;
    {class} property DUAL: JIDzPrinter_AddressType read _GetDUAL;
    {class} property WiFi: JIDzPrinter_AddressType read _GetWiFi;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$AddressType')]
  JIDzPrinter_AddressType = interface(JEnum) // or JObject
  ['{904E7EAA-D3B2-4939-B8B4-718E4527F011}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_AddressType = class(TJavaGenericImport<JIDzPrinter_AddressTypeClass, JIDzPrinter_AddressType>) end;

  JIDzPrinter_FactoryClass = interface(JObjectClass)
  ['{028E60F1-68AE-475D-B2C1-B037959E5F32}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIDzPrinter_Factory; cdecl;
    {class} function getInstance: JIDzPrinter; cdecl;
//    {class} function isPrinterSupported(P1: JBluetoothDevice): Boolean; cdecl; overload;
    {class} function isPrinterSupported(P1: JString): Boolean; cdecl; overload;
    {class} function getFirstPrinter: JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function getFirstPrinter(P1: JString): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function getAllPrinters: JList; cdecl; overload;
    {class} function getAllPrinters(P1: JString): JList; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$Factory')]
  JIDzPrinter_Factory = interface(JObject)
  ['{98645717-E6E2-49F3-98AD-9932A3F0AAFD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_Factory = class(TJavaGenericImport<JIDzPrinter_FactoryClass, JIDzPrinter_Factory>) end;

  JIDzPrinter_GeneralProgressClass = interface(JEnumClass) // or JObjectClass
  ['{454BE173-3F55-4BD2-AA64-AB9020B669A6}']
    { static Property Methods }
    {class} function _GetStart: JIDzPrinter_GeneralProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSuccess: JIDzPrinter_GeneralProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSuccess2: JIDzPrinter_GeneralProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFailed: JIDzPrinter_GeneralProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCancelled: JIDzPrinter_GeneralProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTimeout: JIDzPrinter_GeneralProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetInfo: JIDzPrinter_GeneralProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JIDzPrinter_GeneralProgress>; cdecl;
    {class} function valueOf(P1: JString): JIDzPrinter_GeneralProgress; cdecl;
    {class} function init: JIDzPrinter_GeneralProgress; cdecl;

    { static Property }
    {class} property Start: JIDzPrinter_GeneralProgress read _GetStart;
    {class} property Success: JIDzPrinter_GeneralProgress read _GetSuccess;
    {class} property Success2: JIDzPrinter_GeneralProgress read _GetSuccess2;
    {class} property Failed: JIDzPrinter_GeneralProgress read _GetFailed;
    {class} property Cancelled: JIDzPrinter_GeneralProgress read _GetCancelled;
    {class} property Timeout: JIDzPrinter_GeneralProgress read _GetTimeout;
    {class} property Info: JIDzPrinter_GeneralProgress read _GetInfo;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$GeneralProgress')]
  JIDzPrinter_GeneralProgress = interface(JEnum) // or JObject
  ['{5472FBDB-18F4-4F36-B787-17C0EEBDE770}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_GeneralProgress = class(TJavaGenericImport<JIDzPrinter_GeneralProgressClass, JIDzPrinter_GeneralProgress>) end;

  JIDzPrinter_IActionCallbackClass = interface(JObjectClass)
  ['{6C232C9A-9262-4255-982F-F174D7F02274}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$IActionCallback')]
  JIDzPrinter_IActionCallback = interface(IJavaInstance)
  ['{3918C6B0-DACA-4A99-BC7D-559C2FE5073C}']
    { Property Methods }

    { methods }
    procedure onProgress(P1: JIDzPrinter_GeneralProgress; P2: JObject); cdecl;

    { Property }
  end;

  TJIDzPrinter_IActionCallback = class(TJavaGenericImport<JIDzPrinter_IActionCallbackClass, JIDzPrinter_IActionCallback>) end;

  JIDzPrinter_IActionWithResponseCallbackClass = interface(JObjectClass)
  ['{E9C79B6C-E3D6-454E-BD39-936424901B95}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$IActionWithResponseCallback')]
  JIDzPrinter_IActionWithResponseCallback = interface(IJavaInstance)
  ['{29ED6093-B23B-4876-BDC5-836736A62199}']
    { Property Methods }

    { methods }
    procedure onResponse(P1: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJIDzPrinter_IActionWithResponseCallback = class(TJavaGenericImport<JIDzPrinter_IActionWithResponseCallbackClass, JIDzPrinter_IActionWithResponseCallback>) end;

  JIDzPrinter_IDzPrinterCallbackClass = interface(JObjectClass)
  ['{028F7838-8284-4E5D-ACAF-E0C18EEEED91}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$IDzPrinterCallback')]
  JIDzPrinter_IDzPrinterCallback = interface(IJavaInstance)
  ['{0E416AFF-0FD3-4EE4-BABA-F5A1985392F7}']
    { Property Methods }

    { methods }
    procedure onProgressInfo(P1: JIDzPrinter_ProgressInfo; P2: JObject); cdecl;
    procedure onStateChange(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrinterState); cdecl;
    procedure onPrintProgress(P1: JIDzPrinter_PrinterAddress; P2: JObject; P3: JIDzPrinter_PrintProgress; P4: JObject); cdecl;
    procedure onPrinterDiscovery(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrinterInfo); cdecl;

    { Property }
  end;

  TJIDzPrinter_IDzPrinterCallback = class(TJavaGenericImport<JIDzPrinter_IDzPrinterCallbackClass, JIDzPrinter_IDzPrinterCallback>) end;

  JIDzPrinter_PrinterAddressClass = interface(JObjectClass)
  ['{DF237D77-C414-47FC-8260-89F3955B2177}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JIDzPrinter_PrinterAddress): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JString; P2: JIDzPrinter_AddressType): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JIDzPrinter_PrinterAddress; P2: JString): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JString; P2: JString; P3: JIDzPrinter_AddressType): JIDzPrinter_PrinterAddress; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrinterAddress')]
  JIDzPrinter_PrinterAddress = interface(JObject)
  ['{929E1F33-D0A1-454A-8B1F-C6D003D607EA}']
    { Property Methods }
    function _GetmacAddress: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmacAddress(amacAddress: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetaddressType: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaddressType(aaddressType: JIDzPrinter_AddressType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetshownName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetshownName(ashownName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function isValid: Boolean; cdecl;
    function clone: JIDzPrinter_PrinterAddress; cdecl; overload;
    function toString: JString; cdecl;
    function equals(P1: JString): Boolean; cdecl; overload;
    function equals(P1: JObject): Boolean; cdecl; overload;
//    function clone: JObject; cdecl; overload;

    { Property }
    property macAddress: JString read _GetmacAddress write _SetmacAddress;
    property addressType: JIDzPrinter_AddressType read _GetaddressType write _SetaddressType;
    property shownName: JString read _GetshownName write _SetshownName;
  end;

  TJIDzPrinter_PrinterAddress = class(TJavaGenericImport<JIDzPrinter_PrinterAddressClass, JIDzPrinter_PrinterAddress>) end;

  JIDzPrinter_PrinterInfoClass = interface(JObjectClass)
  ['{A14653F0-5F86-4661-A0CB-34BA3A4BD92C}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: JString; P3: JString; P4: JString; P5: JString; P6: Integer; P7: Integer; P8: Integer; P9: JString; P10: JString; P11: JString; P12: Integer; P13: Integer; P14: Integer): JIDzPrinter_PrinterInfo; cdecl;
    {class} function valueOf(P1: JIntent): JIDzPrinter_PrinterInfo; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrinterInfo')]
  JIDzPrinter_PrinterInfo = interface(JObject)
  ['{CDA00141-939C-4FEF-B988-03B60FD5A14D}']
    { Property Methods }
    function _GetdeviceType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceType(adeviceType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceName(adeviceName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceVersion: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceVersion(adeviceVersion: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsoftwareVersion: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsoftwareVersion(asoftwareVersion: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceAddress: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceAddress(adeviceAddress: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceAddrType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceAddrType(adeviceAddrType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceDPI: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceDPI(adeviceDPI: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceWidth(adeviceWidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getmanufacturer: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setmanufacturer(amanufacturer: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetseriesName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetseriesName(aseriesName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdevIntName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdevIntName(adevIntName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetperipheralFlags: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetperipheralFlags(aperipheralFlags: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GethardwareFlags: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SethardwareFlags(ahardwareFlags: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsoftwareFlags: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsoftwareFlags(asoftwareFlags: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getAddressType: JIDzPrinter_AddressType; cdecl;
    function getPrinterAddress: JIDzPrinter_PrinterAddress; cdecl;
    function toString: JString; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function clone: JIDzPrinter_PrinterInfo; cdecl; overload;
//    function clone: JObject; cdecl; overload;

    { Property }
    property deviceType: Integer read _GetdeviceType write _SetdeviceType;
    property deviceName: JString read _GetdeviceName write _SetdeviceName;
    property deviceVersion: JString read _GetdeviceVersion write _SetdeviceVersion;
    property softwareVersion: JString read _GetsoftwareVersion write _SetsoftwareVersion;
    property deviceAddress: JString read _GetdeviceAddress write _SetdeviceAddress;
    property deviceAddrType: Integer read _GetdeviceAddrType write _SetdeviceAddrType;
    property deviceDPI: Integer read _GetdeviceDPI write _SetdeviceDPI;
    property deviceWidth: Integer read _GetdeviceWidth write _SetdeviceWidth;
    property manufacturer: JString read _Getmanufacturer write _Setmanufacturer;
    property seriesName: JString read _GetseriesName write _SetseriesName;
    property devIntName: JString read _GetdevIntName write _SetdevIntName;
    property peripheralFlags: Integer read _GetperipheralFlags write _SetperipheralFlags;
    property hardwareFlags: Integer read _GethardwareFlags write _SethardwareFlags;
    property softwareFlags: Integer read _GetsoftwareFlags write _SetsoftwareFlags;
  end;

  TJIDzPrinter_PrinterInfo = class(TJavaGenericImport<JIDzPrinter_PrinterInfoClass, JIDzPrinter_PrinterInfo>) end;

  JIDzPrinter_PrinterStateClass = interface(JEnumClass) // or JObjectClass
  ['{D2E29DBD-E955-4CBC-9BDE-BB7937D45DD7}']
    { static Property Methods }
    {class} function _GetConnecting: JIDzPrinter_PrinterState;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetConnected: JIDzPrinter_PrinterState;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetConnected2: JIDzPrinter_PrinterState;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPrinting: JIDzPrinter_PrinterState;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWorking: JIDzPrinter_PrinterState;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDisconnected: JIDzPrinter_PrinterState;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JIDzPrinter_PrinterState>; cdecl;
    {class} function valueOf(P1: JString): JIDzPrinter_PrinterState; cdecl;
    {class} function init: JIDzPrinter_PrinterState; cdecl;

    { static Property }
    {class} property Connecting: JIDzPrinter_PrinterState read _GetConnecting;
    {class} property Connected: JIDzPrinter_PrinterState read _GetConnected;
    {class} property Connected2: JIDzPrinter_PrinterState read _GetConnected2;
    {class} property Printing: JIDzPrinter_PrinterState read _GetPrinting;
    {class} property Working: JIDzPrinter_PrinterState read _GetWorking;
    {class} property Disconnected: JIDzPrinter_PrinterState read _GetDisconnected;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrinterState')]
  JIDzPrinter_PrinterState = interface(JEnum) // or JObject
  ['{22B5E014-CCB8-4705-B068-52B1B49A7A70}']
    { Property Methods }

    { methods }
    function group: Integer; cdecl;

    { Property }
  end;

  TJIDzPrinter_PrinterState = class(TJavaGenericImport<JIDzPrinter_PrinterStateClass, JIDzPrinter_PrinterState>) end;

  JIDzPrinter_PrintFailReasonClass = interface(JEnumClass) // or JObjectClass
  ['{DEB0E4D8-5ED5-4A99-BC17-8B32498EAAF5}']
    { static Property Methods }
    {class} function _GetOK: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIsPrinting: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIsRotating: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVolTooLow: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVolTooHigh: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTphNotFound: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTphTooHot: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTphTooCold: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTphOpened: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoverOpened: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNo_Paper: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNo_Ribbon: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUnmatched_Ribbon: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUsedup_Ribbon: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUsedup_Ribbon2: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCancelled: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDisconnected: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTimeout: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOther: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JIDzPrinter_PrintFailReason>; cdecl;
    {class} function valueOf(P1: JString): JIDzPrinter_PrintFailReason; cdecl;
    {class} function init: JIDzPrinter_PrintFailReason; cdecl;

    { static Property }
    {class} property OK: JIDzPrinter_PrintFailReason read _GetOK;
    {class} property IsPrinting: JIDzPrinter_PrintFailReason read _GetIsPrinting;
    {class} property IsRotating: JIDzPrinter_PrintFailReason read _GetIsRotating;
    {class} property VolTooLow: JIDzPrinter_PrintFailReason read _GetVolTooLow;
    {class} property VolTooHigh: JIDzPrinter_PrintFailReason read _GetVolTooHigh;
    {class} property TphNotFound: JIDzPrinter_PrintFailReason read _GetTphNotFound;
    {class} property TphTooHot: JIDzPrinter_PrintFailReason read _GetTphTooHot;
    {class} property TphTooCold: JIDzPrinter_PrintFailReason read _GetTphTooCold;
    {class} property TphOpened: JIDzPrinter_PrintFailReason read _GetTphOpened;
    {class} property CoverOpened: JIDzPrinter_PrintFailReason read _GetCoverOpened;
    {class} property No_Paper: JIDzPrinter_PrintFailReason read _GetNo_Paper;
    {class} property No_Ribbon: JIDzPrinter_PrintFailReason read _GetNo_Ribbon;
    {class} property Unmatched_Ribbon: JIDzPrinter_PrintFailReason read _GetUnmatched_Ribbon;
    {class} property Usedup_Ribbon: JIDzPrinter_PrintFailReason read _GetUsedup_Ribbon;
    {class} property Usedup_Ribbon2: JIDzPrinter_PrintFailReason read _GetUsedup_Ribbon2;
    {class} property Cancelled: JIDzPrinter_PrintFailReason read _GetCancelled;
    {class} property Disconnected: JIDzPrinter_PrintFailReason read _GetDisconnected;
    {class} property Timeout: JIDzPrinter_PrintFailReason read _GetTimeout;
    {class} property Other: JIDzPrinter_PrintFailReason read _GetOther;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrintFailReason')]
  JIDzPrinter_PrintFailReason = interface(JEnum) // or JObject
  ['{BBA7BB56-E72B-4971-ADB9-6E20A88501FB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintFailReason = class(TJavaGenericImport<JIDzPrinter_PrintFailReasonClass, JIDzPrinter_PrintFailReason>) end;

  JIDzPrinter_PrintParamNameClass = interface(JObjectClass)
  ['{599C8DA9-0E46-420E-A63E-BC03623C3DD4}']
    { static Property Methods }
    {class} function _GetPRINT_DARKNESS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_DENSITY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_SPEED: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_DIRECTION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_COPIES: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAP_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAP_LENGTH_01MM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAP_LENGTH_PX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAP_LENGTH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_ALIGNMENT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetANTI_COLOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHORIZONTAL_OFFSET_01MM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHORIZONTAL_OFFSET_PX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERTICAL_OFFSET_01MM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERTICAL_OFFSET_PX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEFT_MARGIN_01MM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEFT_MARGIN_PX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRIGHT_MARGIN_01MM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRIGHT_MARGIN_PX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_MARGIN_01MM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_MARGIN_PX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOTTOM_MARGIN_01MM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOTTOM_MARGIN_PX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIMAGE_THRESHOLD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property PRINT_DARKNESS: JString read _GetPRINT_DARKNESS;
    {class} property PRINT_DENSITY: JString read _GetPRINT_DENSITY;
    {class} property PRINT_SPEED: JString read _GetPRINT_SPEED;
    {class} property PRINT_DIRECTION: JString read _GetPRINT_DIRECTION;
    {class} property PRINT_COPIES: JString read _GetPRINT_COPIES;
    {class} property GAP_TYPE: JString read _GetGAP_TYPE;
    {class} property GAP_LENGTH_01MM: JString read _GetGAP_LENGTH_01MM;
    {class} property GAP_LENGTH_PX: JString read _GetGAP_LENGTH_PX;
    {class} property GAP_LENGTH: JString read _GetGAP_LENGTH;
    {class} property PRINT_ALIGNMENT: JString read _GetPRINT_ALIGNMENT;
    {class} property ANTI_COLOR: JString read _GetANTI_COLOR;
    {class} property HORIZONTAL_OFFSET_01MM: JString read _GetHORIZONTAL_OFFSET_01MM;
    {class} property HORIZONTAL_OFFSET_PX: JString read _GetHORIZONTAL_OFFSET_PX;
    {class} property VERTICAL_OFFSET_01MM: JString read _GetVERTICAL_OFFSET_01MM;
    {class} property VERTICAL_OFFSET_PX: JString read _GetVERTICAL_OFFSET_PX;
    {class} property LEFT_MARGIN_01MM: JString read _GetLEFT_MARGIN_01MM;
    {class} property LEFT_MARGIN_PX: JString read _GetLEFT_MARGIN_PX;
    {class} property RIGHT_MARGIN_01MM: JString read _GetRIGHT_MARGIN_01MM;
    {class} property RIGHT_MARGIN_PX: JString read _GetRIGHT_MARGIN_PX;
    {class} property TOP_MARGIN_01MM: JString read _GetTOP_MARGIN_01MM;
    {class} property TOP_MARGIN_PX: JString read _GetTOP_MARGIN_PX;
    {class} property BOTTOM_MARGIN_01MM: JString read _GetBOTTOM_MARGIN_01MM;
    {class} property BOTTOM_MARGIN_PX: JString read _GetBOTTOM_MARGIN_PX;
    {class} property IMAGE_THRESHOLD: JString read _GetIMAGE_THRESHOLD;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrintParamName')]
  JIDzPrinter_PrintParamName = interface(IJavaInstance)
  ['{CD75A810-80F4-46E4-98B0-C600771CA920}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintParamName = class(TJavaGenericImport<JIDzPrinter_PrintParamNameClass, JIDzPrinter_PrintParamName>) end;

  JIDzPrinter_PrintParamValueClass = interface(JObjectClass)
  ['{BF50DA17-3807-45D3-97EE-E78FB0F03D3E}']
    { static Property Methods }
    {class} function _GetMIN_PRINT_DARKNESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT_PRINT_DARKNESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_PRINT_DARKNESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIN_PRINT_SPEED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT_PRINT_SPEED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_PRINT_SPEED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAP_NONE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAP_HOLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAP_GAP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAP_BLACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_ALIGNMENT_LEFT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_ALIGNMENT_CENTER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_ALIGNMENT_RIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property MIN_PRINT_DARKNESS: Integer read _GetMIN_PRINT_DARKNESS;
    {class} property DEFAULT_PRINT_DARKNESS: Integer read _GetDEFAULT_PRINT_DARKNESS;
    {class} property MAX_PRINT_DARKNESS: Integer read _GetMAX_PRINT_DARKNESS;
    {class} property MIN_PRINT_SPEED: Integer read _GetMIN_PRINT_SPEED;
    {class} property DEFAULT_PRINT_SPEED: Integer read _GetDEFAULT_PRINT_SPEED;
    {class} property MAX_PRINT_SPEED: Integer read _GetMAX_PRINT_SPEED;
    {class} property GAP_NONE: Integer read _GetGAP_NONE;
    {class} property GAP_HOLE: Integer read _GetGAP_HOLE;
    {class} property GAP_GAP: Integer read _GetGAP_GAP;
    {class} property GAP_BLACK: Integer read _GetGAP_BLACK;
    {class} property PRINT_ALIGNMENT_LEFT: Integer read _GetPRINT_ALIGNMENT_LEFT;
    {class} property PRINT_ALIGNMENT_CENTER: Integer read _GetPRINT_ALIGNMENT_CENTER;
    {class} property PRINT_ALIGNMENT_RIGHT: Integer read _GetPRINT_ALIGNMENT_RIGHT;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrintParamValue')]
  JIDzPrinter_PrintParamValue = interface(IJavaInstance)
  ['{B1423CCD-ED18-44C3-BD55-A8A9BE6F6CA8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintParamValue = class(TJavaGenericImport<JIDzPrinter_PrintParamValueClass, JIDzPrinter_PrintParamValue>) end;

  JIDzPrinter_PrintProgressClass = interface(JEnumClass) // or JObjectClass
  ['{E22B575F-878D-4F9F-B841-5EC38E0FE001}']
    { static Property Methods }
    {class} function _GetConnected: JIDzPrinter_PrintProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStartCopy: JIDzPrinter_PrintProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDataEnded: JIDzPrinter_PrintProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSuccess: JIDzPrinter_PrintProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFailed: JIDzPrinter_PrintProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JIDzPrinter_PrintProgress>; cdecl;
    {class} function valueOf(P1: JString): JIDzPrinter_PrintProgress; cdecl;
    {class} function init: JIDzPrinter_PrintProgress; cdecl;

    { static Property }
    {class} property Connected: JIDzPrinter_PrintProgress read _GetConnected;
    {class} property StartCopy: JIDzPrinter_PrintProgress read _GetStartCopy;
    {class} property DataEnded: JIDzPrinter_PrintProgress read _GetDataEnded;
    {class} property Success: JIDzPrinter_PrintProgress read _GetSuccess;
    {class} property Failed: JIDzPrinter_PrintProgress read _GetFailed;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrintProgress')]
  JIDzPrinter_PrintProgress = interface(JEnum) // or JObject
  ['{810B9228-7EA4-4253-A32D-3A0FC5000ED1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintProgress = class(TJavaGenericImport<JIDzPrinter_PrintProgressClass, JIDzPrinter_PrintProgress>) end;

  JIDzPrinter_ProgressInfoClass = interface(JEnumClass) // or JObjectClass
  ['{E2149ECA-BE03-479D-A195-901D8DE2A6FC}']
    { static Property Methods }
    {class} function _GetAdapterEnabling: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAdapterEnabled: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAdapterDisabled: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDeviceBonding: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDeviceBonded: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDeviceUnbonded: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JIDzPrinter_ProgressInfo>; cdecl;
    {class} function valueOf(P1: JString): JIDzPrinter_ProgressInfo; cdecl;
    {class} function init: JIDzPrinter_ProgressInfo; cdecl;

    { static Property }
    {class} property AdapterEnabling: JIDzPrinter_ProgressInfo read _GetAdapterEnabling;
    {class} property AdapterEnabled: JIDzPrinter_ProgressInfo read _GetAdapterEnabled;
    {class} property AdapterDisabled: JIDzPrinter_ProgressInfo read _GetAdapterDisabled;
    {class} property DeviceBonding: JIDzPrinter_ProgressInfo read _GetDeviceBonding;
    {class} property DeviceBonded: JIDzPrinter_ProgressInfo read _GetDeviceBonded;
    {class} property DeviceUnbonded: JIDzPrinter_ProgressInfo read _GetDeviceUnbonded;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$ProgressInfo')]
  JIDzPrinter_ProgressInfo = interface(JEnum) // or JObject
  ['{021C3AB1-CA70-46EB-BFA4-AED4C516409C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_ProgressInfo = class(TJavaGenericImport<JIDzPrinter_ProgressInfoClass, JIDzPrinter_ProgressInfo>) end;

  JIDzPrinterClass = interface(JObjectClass)
  ['{329CB768-2122-490F-BDEC-DC704BAD8E85}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter')]
  JIDzPrinter = interface(IJavaInstance)
  ['{CA53D976-2EBB-4C30-950F-FDBFFD930A5F}']
    { Property Methods }

    { methods }
    function init(P1: JContext; P2: JIDzPrinter_IDzPrinterCallback): Boolean; cdecl;
    procedure quit; cdecl;
    function connect(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl; overload;
    function connect(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function connect(P1: JBluetoothDevice): Boolean; cdecl; overload;
//    function connect(P1: JBluetoothDevice; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function connect(P1: JString): Boolean; cdecl; overload;
    function connect(P1: JString; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function connectSync(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl; overload;
    function connectSync(P1: JString): Boolean; cdecl; overload;
    procedure disconnect; cdecl;
    function reconnect: Boolean; cdecl; overload;
    function reconnect(P1: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function reconnectSync: Boolean; cdecl;
    function getPrinterState: JIDzPrinter_PrinterState; cdecl;
    function getPrinterInfo: JIDzPrinter_PrinterInfo; cdecl;
    function waitPrinterState(P1: JIDzPrinter_PrinterState; P2: Int64): Boolean; cdecl;
    function print(P1: JBitmap; P2: JBundle): Boolean; cdecl; overload;
    function print(P1: JBitmap; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function print(P1: Ju; P2: JBundle): Boolean; cdecl; overload;
//    function print(P1: Ju; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function print(P1: Jv; P2: JBundle): Boolean; cdecl; overload;
//    function print(P1: Jv; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function command(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
    function command(P1: TJavaArray<Byte>; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function upgrade(P1: JString): Boolean; cdecl; overload;
    function upgrade(P1: JString; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    procedure cancel; cdecl;

    { Property }
  end;

  TJIDzPrinter = class(TJavaGenericImport<JIDzPrinterClass, JIDzPrinter>) end;

//  JIDzPrinter2_1Class = interface(JObjectClass)
//  ['{CC311721-824A-4AB8-B58B-BB952D938DEA}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_dothantech_printer_IDzPrinter_AddressType: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JIDzPrinter2_1; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_dothantech_printer_IDzPrinter_AddressType: TJavaArray<Integer> read _Get_SwitchMap_com_dothantech_printer_IDzPrinter_AddressType;
//  end;
//
//  [JavaSignature('com/dothantech/printer/IDzPrinter2$1')]
//  JIDzPrinter2_1 = interface(JObject)
//  ['{9071FAA5-8665-4678-B16F-1AF8A72E1924}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJIDzPrinter2_1 = class(TJavaGenericImport<JIDzPrinter2_1Class, JIDzPrinter2_1>) end;

  JIDzPrinter2_DeviceAddrTypeConverterClass = interface(JObjectClass)
  ['{1F823CDD-2545-4089-B1BD-DCB05D419472}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIDzPrinter2_DeviceAddrTypeConverter; cdecl;
    {class} function &type(P1: Byte): JIDzPrinter_AddressType; cdecl; overload;
    {class} function &type(P1: Integer): JIDzPrinter_AddressType; cdecl; overload;
    {class} function &type(P1: JIDzPrinter_AddressType): Integer; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2$DeviceAddrTypeConverter')]
  JIDzPrinter2_DeviceAddrTypeConverter = interface(JObject)
  ['{534229C4-EA49-47B5-BA16-511E8877CB5A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter2_DeviceAddrTypeConverter = class(TJavaGenericImport<JIDzPrinter2_DeviceAddrTypeConverterClass, JIDzPrinter2_DeviceAddrTypeConverter>) end;

  JIDzPrinter2_DiscoveriedPrinterClass = interface(JIDzPrinter_PrinterAddressClass) // or JObjectClass
  ['{82D837E5-1874-4E6E-852F-483BACE92198}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JIDzPrinter_AddressType; P4: JIDzPrinter_AddressType; P5: JInteger): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function init(P1: JIDzPrinter_PrinterAddress): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function init(P1: JIDzPrinter2_DiscoveriedPrinter): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function init(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_AddressType; P3: JInteger): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function init(P1: JIDzPrinter2_DiscoveriedPrinter; P2: JIDzPrinter_AddressType): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function getShownRssiLevel(P1: JInteger): Integer; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2$DiscoveriedPrinter')]
  JIDzPrinter2_DiscoveriedPrinter = interface(JIDzPrinter_PrinterAddress) // or JObject
  ['{55949294-88A1-4948-B211-D838865AC896}']
    { Property Methods }
    function _GetdiscoveriedType: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdiscoveriedType(adiscoveriedType: JIDzPrinter_AddressType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getrssi: JInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setrssi(arssi: JInteger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getShownRssiLevel: Integer; cdecl; overload;
    function toString: JString; cdecl;
    function equals(P1: JObject): Boolean; cdecl; overload;
    function equals(P1: JIDzPrinter2_DiscoveriedPrinter; P2: Boolean): Boolean; cdecl; overload;

    { Property }
    property discoveriedType: JIDzPrinter_AddressType read _GetdiscoveriedType write _SetdiscoveriedType;
    property rssi: JInteger read _Getrssi write _Setrssi;
  end;

  TJIDzPrinter2_DiscoveriedPrinter = class(TJavaGenericImport<JIDzPrinter2_DiscoveriedPrinterClass, JIDzPrinter2_DiscoveriedPrinter>) end;

  JIDzPrinter2_IDzPrinterCallback2Class = interface(JObjectClass)
  ['{6A6899BF-5D3F-437A-8CF2-3B5CAB2911C9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2$IDzPrinterCallback2')]
  JIDzPrinter2_IDzPrinterCallback2 = interface(IJavaInstance)
  ['{EB65B828-6FCF-4784-88FD-DBEBE490C4BF}']
    { Property Methods }

    { methods }
    procedure onBondProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onSetParamProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
//    procedure onSendDataProgress(P1: Jd_a; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onPrinterParamChanged(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter2_PrinterParam; P3: JIDzPrinter2_PrinterParam); cdecl;
    procedure onDeviceDiscovery(P1: JIDzPrinter_GeneralProgress; P2: JObject); cdecl;

    { Property }
  end;

  TJIDzPrinter2_IDzPrinterCallback2 = class(TJavaGenericImport<JIDzPrinter2_IDzPrinterCallback2Class, JIDzPrinter2_IDzPrinterCallback2>) end;

  JIDzPrinter2_PrinterParamClass = interface(JObjectClass)
  ['{0A2D4C5B-F3D2-4092-87EB-51BFBCAA70A1}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: JString; P3: JString; P4: JString; P5: JString; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: Integer; P11: Integer; P12: Integer; P13: Integer; P14: Integer; P15: Integer; P16: Integer; P17: Integer; P18: Integer; P19: TJavaArray<Integer>; P20: TJavaArray<Integer>; P21: TJavaArray<Integer>; P22: JString; P23: JString; P24: JString; P25: Integer; P26: Integer; P27: Integer; P28: Integer): JIDzPrinter2_PrinterParam; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2$PrinterParam')]
  JIDzPrinter2_PrinterParam = interface(JObject)
  ['{1A58755C-2784-496C-8B2E-39B8B993692F}']
    { Property Methods }
    function _GetdeviceType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceType(adeviceType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceName(adeviceName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceVersion: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceVersion(adeviceVersion: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsoftwareVersion: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsoftwareVersion(asoftwareVersion: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceAddress: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceAddress(adeviceAddress: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceAddrType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceAddrType(adeviceAddrType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprinterDPI: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprinterDPI(aprinterDPI: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprinterWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprinterWidth(aprinterWidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprintDarkness: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprintDarkness(aprintDarkness: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdarknessCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdarknessCount(adarknessCount: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdarknessMinSuggested: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdarknessMinSuggested(adarknessMinSuggested: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprintSpeed: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprintSpeed(aprintSpeed: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetspeedCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetspeedCount(aspeedCount: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetgapType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetgapType(agapType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetgapLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetgapLength(agapLength: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmotorMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmotorMode(amotorMode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetautoPowerOffMins: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetautoPowerOffMins(aautoPowerOffMins: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getlanguage: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setlanguage(alanguage: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsupportedGapTypes: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsupportedGapTypes(asupportedGapTypes: TJavaArray<Integer>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsupportedMotorModes: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsupportedMotorModes(asupportedMotorModes: TJavaArray<Integer>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsupportedLanguages: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsupportedLanguages(asupportedLanguages: TJavaArray<Integer>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getmanufacturer: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setmanufacturer(amanufacturer: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetseriesName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetseriesName(aseriesName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdevIntName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdevIntName(adevIntName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetperipheralFlags: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetperipheralFlags(aperipheralFlags: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GethardwareFlags: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SethardwareFlags(ahardwareFlags: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsoftwareFlags: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsoftwareFlags(asoftwareFlags: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetattributeFlags: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetattributeFlags(aattributeFlags: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure setSupportedGapTypes(P1: TJavaArray<Integer>); cdecl;
    procedure setSupportedMotorModes(P1: TJavaArray<Integer>); cdecl;
    procedure setSupportedLanguages(P1: TJavaArray<Integer>); cdecl;
    function getAddressType: JIDzPrinter_AddressType; cdecl;
    function toString: JString; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function clone: JIDzPrinter2_PrinterParam; cdecl; overload;
//    function clone: JObject; cdecl; overload;

    { Property }
    property deviceType: Integer read _GetdeviceType write _SetdeviceType;
    property deviceName: JString read _GetdeviceName write _SetdeviceName;
    property deviceVersion: JString read _GetdeviceVersion write _SetdeviceVersion;
    property softwareVersion: JString read _GetsoftwareVersion write _SetsoftwareVersion;
    property deviceAddress: JString read _GetdeviceAddress write _SetdeviceAddress;
    property deviceAddrType: Integer read _GetdeviceAddrType write _SetdeviceAddrType;
    property printerDPI: Integer read _GetprinterDPI write _SetprinterDPI;
    property printerWidth: Integer read _GetprinterWidth write _SetprinterWidth;
    property printDarkness: Integer read _GetprintDarkness write _SetprintDarkness;
    property darknessCount: Integer read _GetdarknessCount write _SetdarknessCount;
    property darknessMinSuggested: Integer read _GetdarknessMinSuggested write _SetdarknessMinSuggested;
    property printSpeed: Integer read _GetprintSpeed write _SetprintSpeed;
    property speedCount: Integer read _GetspeedCount write _SetspeedCount;
    property gapType: Integer read _GetgapType write _SetgapType;
    property gapLength: Integer read _GetgapLength write _SetgapLength;
    property motorMode: Integer read _GetmotorMode write _SetmotorMode;
    property autoPowerOffMins: Integer read _GetautoPowerOffMins write _SetautoPowerOffMins;
    property language: Integer read _Getlanguage write _Setlanguage;
    property supportedGapTypes: TJavaArray<Integer> read _GetsupportedGapTypes write _SetsupportedGapTypes;
    property supportedMotorModes: TJavaArray<Integer> read _GetsupportedMotorModes write _SetsupportedMotorModes;
    property supportedLanguages: TJavaArray<Integer> read _GetsupportedLanguages write _SetsupportedLanguages;
    property manufacturer: JString read _Getmanufacturer write _Setmanufacturer;
    property seriesName: JString read _GetseriesName write _SetseriesName;
    property devIntName: JString read _GetdevIntName write _SetdevIntName;
    property peripheralFlags: Integer read _GetperipheralFlags write _SetperipheralFlags;
    property hardwareFlags: Integer read _GethardwareFlags write _SethardwareFlags;
    property softwareFlags: Integer read _GetsoftwareFlags write _SetsoftwareFlags;
    property attributeFlags: Integer read _GetattributeFlags write _SetattributeFlags;
  end;

  TJIDzPrinter2_PrinterParam = class(TJavaGenericImport<JIDzPrinter2_PrinterParamClass, JIDzPrinter2_PrinterParam>) end;

  JIDzPrinter2_PrinterParamNameClass = interface(JObjectClass)
  ['{B27EC41B-940A-4594-9E7A-367A6292EB84}']
    { static Property Methods }
    {class} function _GetMOTOR_MODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTO_POWEROFF: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLANGUAGE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property MOTOR_MODE: JString read _GetMOTOR_MODE;
    {class} property AUTO_POWEROFF: JString read _GetAUTO_POWEROFF;
    {class} property LANGUAGE: JString read _GetLANGUAGE;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2$PrinterParamName')]
  JIDzPrinter2_PrinterParamName = interface(IJavaInstance)
  ['{1142AE6E-CEE7-452C-92C0-66445B6F738C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter2_PrinterParamName = class(TJavaGenericImport<JIDzPrinter2_PrinterParamNameClass, JIDzPrinter2_PrinterParamName>) end;

  JIDzPrinter2Class = interface(JObjectClass)
  ['{31CAF795-B5AB-4D16-AFB7-15CE3CAD0434}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2')]
  JIDzPrinter2 = interface(IJavaInstance)
  ['{A0828FD1-A78A-400B-B9B9-A94C7847C025}']
    { Property Methods }

    { methods }
    function bond(P1: JString): Boolean; cdecl; overload;
    function bond(P1: JString; P2: JString): Boolean; cdecl; overload;
    function onNfcDiscovery(P1: JIntent): Boolean; cdecl;
//    function getPrinterCapability: Jm_a; cdecl;
    function getPrinterParam: JIDzPrinter2_PrinterParam; cdecl;
    function refreshPrinterParam: Boolean; cdecl;
    function setPrinterParam(P1: JBundle): Boolean; cdecl; overload;
    function setPrinterParam(P1: JBundle; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function sendDataPackage(P1: Jd_a): Boolean; cdecl; overload;
//    function sendDataPackage(P1: Jd_a; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function startDeviceDiscovery(P1: JIDzPrinter_AddressType): Boolean; cdecl; overload;
    function startDeviceDiscovery(P1: JIDzPrinter_AddressType; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    procedure cancel(P1: Integer); cdecl;

    { Property }
  end;

  TJIDzPrinter2 = class(TJavaGenericImport<JIDzPrinter2Class, JIDzPrinter2>) end;

//  Jj_209Class = interface(JObjectClass)
//  ['{C7119EE5-0C7D-4945-9625-488A9D612C51}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter): Jj_209; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/j')]
//  Jj_209 = interface(JObject)
//  ['{6D1E17A3-2AD6-44F7-B608-CC31455C663A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJj_209 = class(TJavaGenericImport<Jj_209Class, Jj_209>) end;

//  Jk_210Class = interface(JObjectClass)
//  ['{451A1B29-E110-478D-AD67-B1C51D534EC6}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jk_210; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//    {class} property b: TJavaArray<Integer> read _Getb;
//    {class} property c: TJavaArray<Integer> read _Getc;
//    {class} property d: TJavaArray<Integer> read _Getd;
//  end;
//
//  [JavaSignature('com/dothantech/printer/k')]
//  Jk_210 = interface(JObject)
//  ['{C6EEA615-5917-48CA-861D-F6B478AF0C30}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJk_210 = class(TJavaGenericImport<Jk_210Class, Jk_210>) end;

//  Jl_211Class = interface(JaqClass) // or JObjectClass
//  ['{D37C074D-CC31-409A-8C9F-76EA91FA8492}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter; P2: JString): Jl_211; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/l')]
//  Jl_211 = interface(Jaq) // or JObject
//  ['{9A3B78DA-4A65-47F4-A861-7DD0515AEC86}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Integer; P2: Integer; P3: JObject): Integer; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJl_211 = class(TJavaGenericImport<Jl_211Class, Jl_211>) end;

//  Jm_212Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{F80258CD-6C04-46A8-8F3F-5C8E85D1D2D0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter): Jm_212; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/m')]
//  Jm_212 = interface(JBroadcastReceiver) // or JObject
//  ['{F0568E88-EC13-4B1D-B735-2921608BF215}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;
//
//  TJm_212 = class(TJavaGenericImport<Jm_212Class, Jm_212>) end;

//  Jn_213Class = interface(JObjectClass)
//  ['{B90824AD-BC9A-40C6-A368-16F11E0B3EED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter; P2: JIDzPrinter_PrinterInfo): Jn_213; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/n')]
//  Jn_213 = interface(JObject)
//  ['{B23FCC2B-6598-40E5-A142-3B014EAE81D3}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJn_213 = class(TJavaGenericImport<Jn_213Class, Jn_213>) end;

//  Jo_214Class = interface(JObjectClass)
//  ['{6CEC9D7A-CDB7-49C7-B478-87E80E03D28B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter): Jo_214; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/o')]
//  Jo_214 = interface(JObject)
//  ['{9C4C4DDD-07C1-4B1F-8A24-2CD7DB5866C2}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJo_214 = class(TJavaGenericImport<Jo_214Class, Jo_214>) end;

//  Jp_215Class = interface(JqClass) // or JObjectClass
//  ['{5C7F8AC4-890A-4223-AC7B-F7A8AA452733}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter; P2: JInputStream): Jp_215; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/p')]
//  Jp_215 = interface(Jq) // or JObject
//  ['{C0A10F30-DD90-4E3A-A397-691A45594F8C}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Jb); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//  end;
//
//  TJp_215 = class(TJavaGenericImport<Jp_215Class, Jp_215>) end;

//  Jq_216Class = interface(Ja_006Class) // or JObjectClass
//  ['{97E9A3A8-D48E-4824-B340-5BD6798B4D20}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter; P2: JContext): Jq_216; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/q')]
//  Jq_216 = interface(Ja_006) // or JObject
//  ['{9AAD672A-2AF3-4E8F-8786-0C4C0885F36E}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: Jb); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: JBluetoothDevice; P2: JIDzPrinter_PrinterState); cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//
//    { Property }
//  end;
//
//  TJq_216 = class(TJavaGenericImport<Jq_216Class, Jq_216>) end;

//  Jr_217Class = interface(JHandlerClass) // or JObjectClass
//  ['{903FEAF3-BFEB-4AB6-9520-38584A6A4F0D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter): Jr_217; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/r')]
//  Jr_217 = interface(JHandler) // or JObject
//  ['{52121DFC-7E9D-4754-9B5D-FE057F3EAA51}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;
//
//  TJr_217 = class(TJavaGenericImport<Jr_217Class, Jr_217>) end;

//  Js_218Class = interface(JObjectClass)
//  ['{6F8D14FE-186D-48B4-B6BA-7501D84A5E01}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter): Js_218; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/s')]
//  Js_218 = interface(JObject)
//  ['{88C01B02-D006-4913-ADEF-EF5E0CC092CC}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJs_218 = class(TJavaGenericImport<Js_218Class, Js_218>) end;

//  Jt_219Class = interface(JObjectClass)
//  ['{3D17C41A-4C22-49BD-8441-667169BBE615}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jv; P2: JBundle): Jt_219; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/t')]
//  Jt_219 = interface(JObject)
//  ['{CD3249FE-3D7F-46C5-A5E4-61A9B67D4545}']
//    { Property Methods }
//
//    { methods }
//    function a: Jd_a; cdecl;
//
//    { Property }
//  end;
//
//  TJt_219 = class(TJavaGenericImport<Jt_219Class, Jt_219>) end;

//  Ju_220Class = interface(JObjectClass)
//  ['{FDED26DC-9139-451A-BAE3-6B70421FDC80}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/u')]
//  Ju_220 = interface(IJavaInstance)
//  ['{FB775DD5-EE87-4567-A891-1B8DC36176AB}']
//    { Property Methods }
//
//    { methods }
//    function a: JList; cdecl;
//
//    { Property }
//  end;
//
//  TJu_220 = class(TJavaGenericImport<Ju_220Class, Ju_220>) end;

//  Jv_221Class = interface(JObjectClass)
//  ['{41E8CE6B-3FA0-4658-9BE6-D19102CBB792}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/printer/v')]
//  Jv_221 = interface(IJavaInstance)
//  ['{AB0C1286-F301-43F8-B799-6D16C0C8CE6A}']
//    { Property Methods }
//
//    { methods }
//    function a: Jd_a; cdecl;
//
//    { Property }
//  end;
//
//  TJv_221 = class(TJavaGenericImport<Jv_221Class, Jv_221>) end;

//  Jw_222Class = interface(JObjectClass)
//  ['{852E4D11-4B38-4058-98D8-E4D5398B41B9}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jw_222; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: Integer read _Getc;
//    {class} property d: Integer read _Getd;
//    {class} property e: Integer read _Gete;
//    {class} property f: Integer read _Getf;
//    {class} property g: Integer read _Getg;
//    {class} property h: Integer read _Geth;
//  end;
//
//  [JavaSignature('com/dothantech/printer/w')]
//  Jw_222 = interface(JObject)
//  ['{EE4A0759-DAA5-41AF-8170-14502578CED7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJw_222 = class(TJavaGenericImport<Jw_222Class, Jw_222>) end;

//  Ja_a_223Class = interface(JObjectClass)
//  ['{4AB08D5E-3703-49FF-864C-BB1048D84A0A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/view/a$a')]
//  Ja_a_223 = interface(IJavaInstance)
//  ['{D5915AE3-E220-4959-96F1-3AC76246BB49}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_a_223 = class(TJavaGenericImport<Ja_a_223Class, Ja_a_223>) end;

//  Ja_224Class = interface(JActivityClass) // or JObjectClass
//  ['{003F28F2-39B8-4E58-A126-BEC0736A733A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_224; cdecl; overload;
//    {class} function init: Ja_224; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/view/a')]
//  Ja_224 = interface(JActivity) // or JObject
//  ['{566AD25A-2FBA-49B5-9E35-5C999B002AE2}']
//    { Property Methods }
//
//    { methods }
//    procedure onActivityResult(P1: Integer; P2: Integer; P3: JIntent); cdecl;
//    procedure a(P1: TJavaObjectArray<JString>; P2: Ja_a); cdecl;
//
//    { Property }
//  end;
//
//  TJa_224 = class(TJavaGenericImport<Ja_224Class, Ja_224>) end;

//  Jb_225Class = interface(JObjectClass)
//  ['{D4B50A44-45AC-478C-B4D3-A0A46DBBFDE8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JHandler; cdecl;
//    {class} function init: Jb_225; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/view/b')]
//  Jb_225 = interface(JObject)
//  ['{977015D4-EF59-413F-89AB-8540596D6930}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJb_225 = class(TJavaGenericImport<Jb_225Class, Jb_225>) end;

//  Jc_226Class = interface(JObjectClass)
//  ['{27F3FB4D-D616-4329-932B-F78CD5BE17A2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): JString; cdecl; overload;
//    {class} function a(P1: Integer; P2: TJavaObjectArray<JObject>): JString; cdecl; overload;
//    {class} function b(P1: Integer; P2: TJavaObjectArray<JObject>): JString; cdecl;
//    {class} function init: Jc_226; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/view/c')]
//  Jc_226 = interface(JObject)
//  ['{2592562B-2481-4F03-9769-A0CC976AD735}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJc_226 = class(TJavaGenericImport<Jc_226Class, Jc_226>) end;

//  Jd_227Class = interface(JObjectClass)
//  ['{5439FD2E-FB3F-4E75-A3EA-35F48B203378}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JView; P2: JClass): JView; cdecl;
//    {class} function init: Jd_227; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/view/d')]
//  Jd_227 = interface(JObject)
//  ['{00F8C2EF-F973-4F3B-906F-D30B6245E6AB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJd_227 = class(TJavaGenericImport<Jd_227Class, Jd_227>) end;

//  JDzWindow_1Class = interface(JObjectClass)
//  ['{2B52E632-5C79-456A-981A-46C825004677}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_dothantech_view_DzWindow_ViewInfoType: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JDzWindow_1; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_dothantech_view_DzWindow_ViewInfoType: TJavaArray<Integer> read _Get_SwitchMap_com_dothantech_view_DzWindow_ViewInfoType;
//  end;
//
//  [JavaSignature('com/dothantech/view/DzWindow$1')]
//  JDzWindow_1 = interface(JObject)
//  ['{DB7FAA5B-8897-45DE-A4F8-F69CC922838D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDzWindow_1 = class(TJavaGenericImport<JDzWindow_1Class, JDzWindow_1>) end;

  JDzWindow_ViewInfoClass = interface(JObjectClass)
  ['{46928316-3953-4113-9B1E-D7FA70DE865D}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JObject): JDzWindow_ViewInfo; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/view/DzWindow$ViewInfo')]
  JDzWindow_ViewInfo = interface(JObject)
  ['{FFA7D465-1AEE-4B68-B0B7-76AAA19B5D2C}']
    { Property Methods }
    function _GetmTitle: JCharSequence;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmTitle(amTitle: JCharSequence);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmAppVisible: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmAppVisible(amAppVisible: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmContext: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmContext(amContext: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmActivity: JActivity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmActivity(amActivity: JActivity);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmRoot: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmRoot(amRoot: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmView: JView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmView(amView: JView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getTaskId: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property mTitle: JCharSequence read _GetmTitle write _SetmTitle;
    property mAppVisible: Boolean read _GetmAppVisible write _SetmAppVisible;
    property mContext: JContext read _GetmContext write _SetmContext;
    property mActivity: JActivity read _GetmActivity write _SetmActivity;
    property mRoot: JObject read _GetmRoot write _SetmRoot;
    property mView: JView read _GetmView write _SetmView;
  end;

  TJDzWindow_ViewInfo = class(TJavaGenericImport<JDzWindow_ViewInfoClass, JDzWindow_ViewInfo>) end;

  JDzWindow_ViewInfoTypeClass = interface(JEnumClass) // or JObjectClass
  ['{114B3E60-3EA1-4CD5-A3A7-9234D8BA2A97}']
    { static Property Methods }
    {class} function _GetAll: JDzWindow_ViewInfoType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetValid: JDzWindow_ViewInfoType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVisible: JDzWindow_ViewInfoType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDzWindow_ViewInfoType>; cdecl;
    {class} function valueOf(P1: JString): JDzWindow_ViewInfoType; cdecl;
    {class} function init: JDzWindow_ViewInfoType; cdecl;

    { static Property }
    {class} property All: JDzWindow_ViewInfoType read _GetAll;
    {class} property Valid: JDzWindow_ViewInfoType read _GetValid;
    {class} property Visible: JDzWindow_ViewInfoType read _GetVisible;
  end;

  [JavaSignature('com/dothantech/view/DzWindow$ViewInfoType')]
  JDzWindow_ViewInfoType = interface(JEnum) // or JObject
  ['{C0EA3C55-8337-4C6F-BB96-0959BE19F1C1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzWindow_ViewInfoType = class(TJavaGenericImport<JDzWindow_ViewInfoTypeClass, JDzWindow_ViewInfoType>) end;

  JDzWindowClass = interface(JObjectClass)
  ['{E26A76B0-6B55-4D53-80CF-CC1E9A33B61B}']
    { static Property Methods }
//    {class} function _GetLog: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDzWindow; cdecl; overload;
    {class} function getWindowManager: JObject; cdecl;
    {class} function getViewInfos: JArrayList; cdecl; overload;
    {class} function getViewCount: Integer; cdecl; overload;
    {class} function getViewCount(P1: JDzWindow_ViewInfoType): Integer; cdecl; overload;
//    {class} function getViewInfos(P1: JClass): JArrayList; cdecl; overload;
    {class} function getViewInfos(P1: JString): JArrayList; cdecl; overload;
    {class} function getViewInfosByTitle(P1: JString): JArrayList; cdecl;
    {class} function getActiveViewInfo: JDzWindow_ViewInfo; cdecl;
    {class} function getActiveActivity: JActivity; cdecl;
    {class} function getMainViewInfo: JDzWindow_ViewInfo; cdecl;
    {class} function getMainActivity: JActivity; cdecl;
    {class} function backToMainActivity: Integer; cdecl;
//    {class} function getActivity(P1: JClass): JActivity; cdecl; overload;
    {class} function getActivity(P1: JString): JActivity; cdecl; overload;
    {class} function getActivityByTitle(P1: JString): JActivity; cdecl;
//    {class} function init: JDzWindow; cdecl; overload;

    { static Property }
//    {class} property Log: Jw read _GetLog;
  end;

  [JavaSignature('com/dothantech/view/DzWindow')]
  JDzWindow = interface(JObject)
  ['{C8C788C6-B068-4A32-852A-AF612A61300F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzWindow = class(TJavaGenericImport<JDzWindowClass, JDzWindow>) end;

//  Je_232Class = interface(JObjectClass)
//  ['{1F0AE998-C6BE-4AF5-8EDE-4322EBE0C155}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_232; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/dothantech/view/e')]
//  Je_232 = interface(JObject)
//  ['{544757B1-8EFA-40CE-ACBE-D178455491E0}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;
//
//  TJe_232 = class(TJavaGenericImport<Je_232Class, Je_232>) end;

//  Jc_258Class = interface(JObjectClass)
//  ['{9EE7CE16-C5A7-49E9-B905-F987A846D524}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_258; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/c')]
//  Jc_258 = interface(JObject)
//  ['{FE7A3573-1A29-4DF0-984D-51DB7012E849}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//    function d: Integer; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;
//
//  TJc_258 = class(TJavaGenericImport<Jc_258Class, Jc_258>) end;

//  Ja_233Class = interface(Jc_258Class) // or JObjectClass
//  ['{0AA75EA2-049C-4F07-BDE3-1763979E7494}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_233; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/a')]
//  Ja_233 = interface(Jc_258) // or JObject
//  ['{F0FCDBAB-E385-40F1-A72A-551541A021D8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_233 = class(TJavaGenericImport<Ja_233Class, Ja_233>) end;

//  Jb_334Class = interface(JObjectClass)
//  ['{D4BE7DAA-EAB7-4023-B9FB-0A64471E36D4}']
//    { static Property Methods }
//    {class} function _Getp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jb_334; cdecl;
//    {class} procedure f; cdecl;
//
//    { static Property }
//    {class} property p: Integer read _Getp;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/b')]
//  Jb_334 = interface(JObject)
//  ['{23C3D007-AF0C-431C-9CC2-B134DEEFB572}']
//    { Property Methods }
//    function _Geta: JPrintCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JPrintCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JOutputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JOutputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Jc);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JAtomicInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JAtomicInteger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Je2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Je2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JBitmap; P7: TJavaArray<Integer>): JImageParam; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//    function c: Single; cdecl;
//    procedure startJob(P1: JPrintCallback); cdecl; overload;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function endJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function getPreview: JBitmap; cdecl;
//    function generatePageData(P1: JString; P2: JString; P3: Integer): JObject; cdecl; overload;
//    function generatePageData(P1: Integer; P2: JBitmap; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer): JObject; cdecl; overload;
//    function generatePageData(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer): JObject; cdecl; overload;
//    procedure commitData(P1: Je2; P2: JString; P3: JString); cdecl;
//    procedure startJob(P1: JPrintCallback; P2: JInputStream; P3: JOutputStream); cdecl; overload;
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    function getPageIndex: Integer; cdecl;
//    function getPagePrintTask: Je2; cdecl;
//    procedure resume(P1: JInputStream; P2: JOutputStream); cdecl;
//    procedure g; cdecl;
//    procedure a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: JJSONObject; P3: Double; P4: Double); cdecl; overload;
//    procedure k; cdecl;
//    procedure j; cdecl;
//    procedure a(P1: Jc); cdecl; overload;
//    function e: Boolean; cdecl;
//    function a: JHashSet; cdecl; overload;
//    procedure a(P1: JJCPrinter_PrinterException); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: JHashMap); cdecl; overload;
//    procedure a(P1: Double); cdecl; overload;
//    procedure i; cdecl;
//    function h: Boolean; cdecl;
//    procedure b(P1: Jc); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Jc; cdecl; overload;
//    procedure a(P1: Jc_b); cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    function d: Boolean; cdecl;
//    function mm2Pix(P1: Double): Integer; cdecl;
//    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JString); cdecl; overload;
//    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JTypeface); cdecl; overload;
//    procedure drawBarCode(P1: JCanvas; P2: JString; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl;
//    procedure drawQrCode(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl;
//    procedure drawBitmap(P1: JCanvas; P2: JBitmap; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl;
//    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl; overload;
//    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer); cdecl; overload;
//    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
//    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
//    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer; P9: Integer); cdecl; overload;
//    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl; overload;
//    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl; overload;
//    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer); cdecl; overload;
//    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
//    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
//    procedure startJob(P1: Double; P2: Double; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double); cdecl; overload;
//    procedure startPage(P1: JCanvas; P2: Integer); cdecl;
//    procedure endPage(P1: Integer); cdecl;
//    procedure commitJob(P1: Boolean; P2: Integer; P3: Integer; P4: JString; P5: JOutputStream; P6: JInputStream; P7: JPrintCallback); cdecl; overload;
//    procedure commitJob(P1: JString; P2: JString; P3: JString; P4: JOutputStream; P5: JInputStream); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer; P4: Integer): Integer; cdecl; overload;
//
//    { Property }
//    property a: JPrintCallback read _Geta write _Seta;
//    property b: JInputStream read _Getb write _Setb;
//    property c: JOutputStream read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: JHandler read _Gete write _Sete;
//    property f: JString read _Getf write _Setf;
//    property g: Integer read _Getg write _Setg;
//    property h: Jc read _Geth write _Seth;
//    property i: Integer read _Geti write _Seti;
//    property j: JAtomicInteger read _Getj write _Setj;
//    property k: Je2 read _Getk write _Setk;
//    property l: JObject read _Getl write _Setl;
//    property m: Integer read _Getm write _Setm;
//    property n: Integer read _Getn write _Setn;
//    property o: JObject read _Geto write _Seto;
//  end;
//
//  TJb_334 = class(TJavaGenericImport<Jb_334Class, Jb_334>) end;

//  Jd0Class = interface(Jb_334Class) // or JObjectClass
//  ['{43736CDC-2135-4F99-AE7A-132A5372D86C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/d0')]
//  Jd0 = interface(Jb_334) // or JObject
//  ['{323D2930-E6CD-41A1-9B58-FF8351E64188}']
//    { Property Methods }
//
//    { methods }
//    procedure startJob(P1: Double; P2: Double; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double); cdecl;
//    procedure startPage(P1: JCanvas; P2: Integer); cdecl;
//    procedure endPage(P1: Integer); cdecl;
//    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
//    procedure commitJob(P1: Boolean; P2: Integer; P3: Integer; P4: JString; P5: JOutputStream; P6: JInputStream; P7: JPrintCallback); cdecl;
//    function b(P1: Integer): Double; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl;
//    function c: Single; cdecl;
//    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JString); cdecl; overload;
//    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JTypeface); cdecl; overload;
//    procedure drawBarCode(P1: JCanvas; P2: JString; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl;
//    procedure drawQrCode(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl;
//    procedure drawBitmap(P1: JCanvas; P2: JBitmap; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl;
//    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl; overload;
//    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer); cdecl; overload;
//    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
//    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
//    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer; P9: Integer); cdecl; overload;
//    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl; overload;
//    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl; overload;
//    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer); cdecl; overload;
//    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
//    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
//    procedure j; cdecl;
//    function getPreview: JBitmap; cdecl;
//    function b: Integer; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJd0 = class(TJavaGenericImport<Jd0Class, Jd0>) end;

//  Ja0Class = interface(Jd0Class) // or JObjectClass
//  ['{42CF428E-A163-4916-B29F-8315DCE5E513}']
//    { static Property Methods }
//    {class} function _Getq: Ja0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Ja0; cdecl;
//    {class} function l: Jd0; cdecl;
//
//    { static Property }
//    {class} property q: Ja0 read _Getq;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/a0')]
//  Ja0 = interface(Jd0) // or JObject
//  ['{9A3F614E-8B07-4C6B-AB5B-0F45E244F8D8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa0 = class(TJavaGenericImport<Ja0Class, Ja0>) end;

//  Jl1Class = interface(JObjectClass)
//  ['{6663574D-AE5B-465A-8196-1CCDC7B8506E}']
//    { static Property Methods }
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JHashSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JHashSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jl1; cdecl; overload;
//    {class} function init: Jl1; cdecl; overload;
//
//    { static Property }
//    {class} property b: Boolean read _Getb;
//    {class} property c: JHashSet read _Getc;
//    {class} property d: JHashSet read _Getd;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/l1')]
//  Jl1 = interface(JObject)
//  ['{5676A074-4811-40F0-96C4-6EF7A538F793}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPrinterSpeed(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterAutoShutDownTime(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterLanguage(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterReset(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function setBluetoothDistributionNetwork(P1: JString; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setLabelMaterial(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    procedure setUpdateFirmwareRequest(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure a(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    procedure b(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    procedure b(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    procedure a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    function b(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl; overload;
//    procedure cancelUpdateFirmwareRequest; cdecl;
//    procedure setMainControlPanelUpgrade(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure cancelMainControlPanelUpgrade; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl; overload;
//    procedure b(P1: JOutputStream; P2: JInputStream; P3: JUpDateDeviceSoftWareCallback; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>); cdecl; overload;
//    procedure a(P1: JOutputStream; P2: JInputStream; P3: JUpDateDeviceSoftWareCallback; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl; overload;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;
//
//  TJl1 = class(TJavaGenericImport<Jl1Class, Jl1>) end;

//  Ja1Class = interface(Jl1Class) // or JObjectClass
//  ['{E4852BD1-86C9-4816-8CDB-EEC0DDC5591C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja1; cdecl;
//    {class} function a(P1: JInputStream): Boolean; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/a1')]
//  Ja1 = interface(Jl1) // or JObject
//  ['{D8A98981-29A9-4A76-BB0D-FA0363E42BA1}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    procedure a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    function b(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: JString; P3: JOutputStream; P4: JInputStream): Boolean; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJa1 = class(TJavaGenericImport<Ja1Class, Ja1>) end;

//  Jd_338Class = interface(Jb_334Class) // or JObjectClass
//  ['{2FBAC40E-DDE8-4218-A5F4-1D1DD8AB768D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_338; cdecl;
//    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/d')]
//  Jd_338 = interface(Jb_334) // or JObject
//  ['{79F6FCD1-D5B7-472E-8EF1-38669E4BBE31}']
//    { Property Methods }
//    function _Getq: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure g; cdecl;
//    procedure a(P1: Jc); cdecl; overload;
//    procedure startJob(P1: JPrintCallback; P2: JInputStream; P3: JOutputStream); cdecl;
//    procedure b(P1: Jc); cdecl;
//    function l: Boolean; cdecl;
//    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
//    function a(P1: Integer; P2: Jc_a): Integer; cdecl; overload;
//
//    { Property }
//    property q: Integer read _Getq write _Setq;
//    property r: Integer read _Getr write _Setr;
//  end;
//
//  TJd_338 = class(TJavaGenericImport<Jd_338Class, Jd_338>) end;

//  Ja2Class = interface(Jd_338Class) // or JObjectClass
//  ['{AA5D756E-ED8E-4BE7-A954-793849B8ED7D}']
//    { static Property Methods }
//    {class} function _Getz: Ja2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Ja2; cdecl; overload;
//    {class} function m: Ja2; cdecl;
//    {class} function init: Ja2; cdecl; overload;
//
//    { static Property }
//    {class} property z: Ja2 read _Getz;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/a2')]
//  Ja2 = interface(Jd_338) // or JObject
//  ['{70F30EF3-0170-4CD9-9600-8786004F1CDD}']
//    { Property Methods }
//    function _Gets: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
//    procedure startJob(P1: JPrintCallback; P2: JInputStream; P3: JOutputStream); cdecl;
//    procedure a(P1: Integer; P2: JJSONObject; P3: Double; P4: Double); cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//    function c: Single; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function mm2Pix(P1: Double): Integer; cdecl;
//    function b(P1: Double): Double; cdecl; overload;
//    procedure k; cdecl;
//    procedure b(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: Jc); cdecl; overload;
//    procedure g; cdecl;
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function l: Boolean; cdecl;
//    function a: JHashSet; cdecl; overload;
//    procedure c(P1: Integer); cdecl; overload;
//    procedure b(P1: Integer); cdecl; overload;
//    procedure b(P1: Jc); cdecl; overload;
//    procedure i; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Jc; cdecl; overload;
//    procedure n; cdecl;
//
//    { Property }
//    property s: Integer read _Gets write _Sets;
//    property t: Integer read _Gett write _Sett;
//    property u: Integer read _Getu write _Setu;
//    property v: Integer read _Getv write _Setv;
//    property w: Integer read _Getw write _Setw;
//    property x: Boolean read _Getx write _Setx;
//    property y: Boolean read _Gety write _Sety;
//  end;
//
//  TJa2 = class(TJavaGenericImport<Ja2Class, Ja2>) end;

//  Jb_237Class = interface(JObjectClass)
//  ['{7D73F3C2-A905-48EC-83F3-E38D598F2516}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_237; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/b')]
//  Jb_237 = interface(JObject)
//  ['{11B36C12-F90F-46DE-9BEF-B2AEE13F5BB3}']
//    { Property Methods }
//
//    { methods }
//    function b: Boolean; cdecl;
//    procedure a; cdecl; overload;
//    function e: Boolean; cdecl;
//    function a(P1: JContext): Boolean; cdecl; overload;
//    function c: JInputStream; cdecl;
//    function d: JOutputStream; cdecl;
//
//    { Property }
//  end;
//
//  TJb_237 = class(TJavaGenericImport<Jb_237Class, Jb_237>) end;

//  Je0Class = interface(JObjectClass)
//  ['{95E93640-CF3D-4F14-A0D9-7886FBF5C995}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/e0')]
//  Je0 = interface(JObject)
//  ['{99686DD5-2AE4-45CC-832D-C1970B1A428E}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterDensity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSpeed(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrintMode(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterLanguage(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getAutoShutDownTime(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSoftWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterElectricity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterHardWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function getPrinterRfidParameters(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JList; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterRfidSuccessTimes(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function isPrinterSupportrWriteRfid: Boolean; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback): JPrinterInfo; cdecl;
//    function isSupportSetMaterial: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJe0 = class(TJavaGenericImport<Je0Class, Je0>) end;

//  Jb0Class = interface(Je0Class) // or JObjectClass
//  ['{18A66657-85EE-405F-B1BC-5DF9DB810DF4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/b0')]
//  Jb0 = interface(Je0) // or JObject
//  ['{7D718829-F290-4B66-BE5D-8E075AB0C948}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterNetworkState(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//
//    { Property }
//  end;
//
//  TJb0 = class(TJavaGenericImport<Jb0Class, Jb0>) end;

//  Je_340Class = interface(Jb_334Class) // or JObjectClass
//  ['{5B6E5472-18E4-47A2-A895-B4507275816D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_340; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/e')]
//  Je_340 = interface(Jb_334) // or JObject
//  ['{5662DD43-3964-465C-9A05-93112E257D2A}']
//    { Property Methods }
//    function _Getq: JThreadPoolExecutor;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: JThreadPoolExecutor);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetA(aA: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetC: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetC(aC: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetD: JNeedDataCallBack;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetD(aD: JNeedDataCallBack);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure g; cdecl;
//    procedure m; cdecl;
//    procedure k; cdecl;
//    procedure a(P1: Je2); cdecl; overload;
//    procedure b(P1: Je2); cdecl; overload;
//    procedure j; cdecl;
//    procedure i; cdecl;
//    procedure c(P1: Je2); cdecl; overload;
//    procedure b(P1: Jc); cdecl; overload;
//    procedure startJob(P1: JPrintCallback; P2: JInputStream; P3: JOutputStream); cdecl;
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    procedure l; cdecl;
//    procedure resume(P1: JInputStream; P2: JOutputStream); cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function endJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Jc; cdecl; overload;
//    function a(P1: Integer; P2: Jc_a): Integer; cdecl; overload;
//    function a(P1: Boolean): Boolean; cdecl; overload;
//    procedure a(P1: JJCPrinter_PrinterException); cdecl; overload;
//    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
//    procedure c(P1: Integer; P2: Integer); cdecl; overload;
//    procedure b(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: JNeedDataCallBack); cdecl; overload;
//
//    { Property }
//    property q: JThreadPoolExecutor read _Getq write _Setq;
//    property r: JArrayList read _Getr write _Setr;
//    property s: Integer read _Gets write _Sets;
//    property t: Int64 read _Gett write _Sett;
//    property u: Integer read _Getu write _Setu;
//    property v: Integer read _Getv write _Setv;
//    property w: Integer read _Getw write _Setw;
//    property x: Integer read _Getx write _Setx;
//    property y: Integer read _Gety write _Sety;
//    property z: Integer read _Getz write _Setz;
//    property A: Integer read _GetA write _SetA;
//    property B: Integer read _GetB write _SetB;
//    property C: Boolean read _GetC write _SetC;
//    property D: JNeedDataCallBack read _GetD write _SetD;
//  end;
//
//  TJe_340 = class(TJavaGenericImport<Je_340Class, Je_340>) end;

//  Jb1Class = interface(Je_340Class) // or JObjectClass
//  ['{7A4481B5-E893-4A40-AFF3-2353ACFDDE31}']
//    { static Property Methods }
//    {class} function _GetE: Jb1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jb1; cdecl;
//    {class} function n: Jb1; cdecl;
//
//    { static Property }
//    {class} property E: Jb1 read _GetE;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/b1')]
//  Jb1 = interface(Je_340) // or JObject
//  ['{5442609E-9124-4C8C-91DF-B0758C03C405}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl;
//    function c: Single; cdecl;
//
//    { Property }
//  end;
//
//  TJb1 = class(TJavaGenericImport<Jb1Class, Jb1>) end;

//  Ji0_bClass = interface(JObjectClass)
//  ['{758B6757-C25F-4437-9EA9-877E935FC3FA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Ji0_b; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/i0$b')]
//  Ji0_b = interface(JObject)
//  ['{2CCA7901-1921-4D54-A5F3-6EDA7D28CBEF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJi0_b = class(TJavaGenericImport<Ji0_bClass, Ji0_b>) end;

//  Jb2_aClass = interface(Ji0_bClass) // or JObjectClass
//  ['{60A35C43-7B9B-42EA-8CF5-4C1D406E99BF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb2; P2: JString): Jb2_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/b2$a')]
//  Jb2_a = interface(Ji0_b) // or JObject
//  ['{892DA49D-1BBE-466D-93A6-70C7BD78DA25}']
//    { Property Methods }
//    function _Geta: Jb2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jb2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jb2 read _Geta write _Seta;
//  end;
//
//  TJb2_a = class(TJavaGenericImport<Jb2_aClass, Jb2_a>) end;

//  Jb2_bClass = interface(Ji0_bClass) // or JObjectClass
//  ['{C8616182-D94B-483F-8B8F-E39879F5EA55}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb2; P2: JString; P3: Jc): Jb2_b; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/b2$b')]
//  Jb2_b = interface(Ji0_b) // or JObject
//  ['{94C9AF03-00A5-4E3C-BE71-908DA9868BB0}']
//    { Property Methods }
//    function _Geta: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jb2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jb2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jc read _Geta write _Seta;
//    property b: Jb2 read _Getb write _Setb;
//  end;
//
//  TJb2_b = class(TJavaGenericImport<Jb2_bClass, Jb2_b>) end;

//  Jb2_cClass = interface(Ji0_bClass) // or JObjectClass
//  ['{D2074DF5-919C-4EEA-9B88-E405D946363D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb2; P2: JString): Jb2_c; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/b2$c')]
//  Jb2_c = interface(Ji0_b) // or JObject
//  ['{3CAD55C8-BB53-4553-8BED-E9B3B398663A}']
//    { Property Methods }
//    function _Geta: Jb2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jb2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jb2 read _Geta write _Seta;
//  end;
//
//  TJb2_c = class(TJavaGenericImport<Jb2_cClass, Jb2_c>) end;

//  Jb2_dClass = interface(Ji0_bClass) // or JObjectClass
//  ['{EF0310CE-3D3D-4024-B285-9048779DC429}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb2; P2: JString): Jb2_d; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/b2$d')]
//  Jb2_d = interface(Ji0_b) // or JObject
//  ['{7CD37E11-7D39-4B3F-ACD5-886670E8C90E}']
//    { Property Methods }
//    function _Geta: Jb2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jb2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jb2 read _Geta write _Seta;
//  end;
//
//  TJb2_d = class(TJavaGenericImport<Jb2_dClass, Jb2_d>) end;

//  Jb2_eClass = interface(Ji0_bClass) // or JObjectClass
//  ['{00BD4677-0B13-4317-AAA2-30BD838498D2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb2; P2: JString): Jb2_e; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/b2$e')]
//  Jb2_e = interface(Ji0_b) // or JObject
//  ['{A65712DF-5755-430F-9AA7-2B5CE3D14CAD}']
//    { Property Methods }
//    function _Geta: Jb2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jb2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jb2 read _Geta write _Seta;
//  end;
//
//  TJb2_e = class(TJavaGenericImport<Jb2_eClass, Jb2_e>) end;

//  Jb2_fClass = interface(Ji0_bClass) // or JObjectClass
//  ['{3D9E500E-1054-49C5-9EA8-AF73140F8B78}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb2; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JPrintCallback; P6: JAtomicBoolean; P7: JCountDownLatch): Jb2_f; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/b2$f')]
//  Jb2_f = interface(Ji0_b) // or JObject
//  ['{DB4942A1-A649-44BD-A92C-4D044A59A4FC}']
//    { Property Methods }
//    function _Geta: JOutputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JOutputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JPrintCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JPrintCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JAtomicBoolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JAtomicBoolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JCountDownLatch;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JCountDownLatch);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jb2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jb2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JOutputStream read _Geta write _Seta;
//    property b: JInputStream read _Getb write _Setb;
//    property c: JPrintCallback read _Getc write _Setc;
//    property d: JAtomicBoolean read _Getd write _Setd;
//    property e: JCountDownLatch read _Gete write _Sete;
//    property f: Jb2 read _Getf write _Setf;
//  end;
//
//  TJb2_f = class(TJavaGenericImport<Jb2_fClass, Jb2_f>) end;

//  Ji0Class = interface(Jd0Class) // or JObjectClass
//  ['{85185AC3-0924-40DE-A0A6-17F5B27BC606}']
//    { static Property Methods }
//    {class} function _Gett: Ji0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Ji0; cdecl;
//    {class} function n: Ji0; cdecl;
//
//    { static Property }
//    {class} property t: Ji0 read _Gett;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/i0')]
//  Ji0 = interface(Jd0) // or JObject
//  ['{6A8BF834-5595-44AE-A4B1-E6558F0ABB73}']
//    { Property Methods }
//    function _Getq: JHashSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: JHashSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: JLinkedBlockingDeque;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JLinkedBlockingDeque);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure startJob(P1: JPrintCallback; P2: JInputStream; P3: JOutputStream); cdecl;
//    procedure g; cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    function endJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function h: Boolean; cdecl;
//    function l: Boolean; cdecl;
//    function b: Integer; cdecl; overload;
//    function c: Single; cdecl; overload;
//    function a: JHashSet; cdecl; overload;
//    procedure b(P1: Boolean); cdecl; overload;
//    function a(P1: Boolean): Ji0_a; cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: Boolean); cdecl; overload;
//    procedure m; cdecl;
//    procedure o; cdecl;
//    procedure p; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Jc; cdecl; overload;
//    procedure i; cdecl;
//    procedure a(P1: JNiimbotSppPacket); cdecl; overload;
//    procedure b(P1: Integer; P2: Integer); cdecl; overload;
//    procedure c(P1: TJavaArray<Byte>); cdecl; overload;
//    procedure b(P1: TJavaArray<Byte>); cdecl; overload;
//    function a(P1: TJavaArray<Byte>): Ji0_a; cdecl; overload;
//
//    { Property }
//    property q: JHashSet read _Getq write _Setq;
//    property r: Integer read _Getr write _Setr;
//    property s: JLinkedBlockingDeque read _Gets write _Sets;
//  end;
//
//  TJi0 = class(TJavaGenericImport<Ji0Class, Ji0>) end;

//  Jb2Class = interface(Ji0Class) // or JObjectClass
//  ['{1B56E771-3749-4391-9E06-2E7F80974E1B}']
//    { static Property Methods }
//    {class} function _GetD: Jb2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jb2; cdecl; overload;
//    {class} function q: Jb2; cdecl; overload;
//    {class} function a(P1: Jb2): JAtomicInteger; cdecl; overload;
//    {class} function l(P1: Jb2): Integer; cdecl; overload;
//    {class} function p(P1: Jb2): Integer; cdecl;
//    {class} function q(P1: Jb2): JAtomicInteger; cdecl; overload;
//    {class} procedure r(P1: Jb2); cdecl;
//    {class} function s(P1: Jb2): Integer; cdecl;
//    {class} function t(P1: Jb2): Je2; cdecl;
//    {class} function u(P1: Jb2): JAtomicInteger; cdecl;
//    {class} function v(P1: Jb2): JAtomicInteger; cdecl;
//    {class} function b(P1: Jb2): JObject; cdecl; overload;
//    {class} function c(P1: Jb2): JAtomicInteger; cdecl; overload;
//    {class} procedure d(P1: Jb2); cdecl; overload;
//    {class} function e(P1: Jb2): JLinkedBlockingDeque; cdecl;
//    {class} function f(P1: Jb2): JPrintCallback; cdecl;
//    {class} function g(P1: Jb2): JPrintCallback; cdecl; overload;
//    {class} function h(P1: Jb2): JPrintCallback; cdecl; overload;
//    {class} function i(P1: Jb2): JAtomicInteger; cdecl; overload;
//    {class} function j(P1: Jb2): Je2; cdecl;
//    {class} function k(P1: Jb2): Je2; cdecl; overload;
//    {class} procedure m(P1: Jb2); cdecl;
//    {class} function a(P1: Jb2; P2: Je2): Je2; cdecl; overload;
//    {class} function n(P1: Jb2): JLinkedBlockingDeque; cdecl;
//    {class} function o(P1: Jb2): JAtomicInteger; cdecl;
//    {class} function init: Jb2; cdecl; overload;
//
//    { static Property }
//    {class} property D: Jb2 read _GetD;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/b2')]
//  Jb2 = interface(Ji0) // or JObject
//  ['{EDB3FC18-E63D-4790-856D-D1030DDE5711}']
//    { Property Methods }
//    function _Getu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetA: JBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetA(aA: JBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetB: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetC(aC: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function d(P1: TJavaArray<Byte>): Ji0_a; cdecl; overload;
//    procedure startJob(P1: Double; P2: Double; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double); cdecl; overload;
//    procedure startPage(P1: JCanvas; P2: Integer); cdecl;
//    procedure endPage(P1: Integer); cdecl;
//    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
//    procedure startJob(P1: JPrintCallback; P2: JInputStream; P3: JOutputStream); cdecl; overload;
//    procedure commitJob(P1: Boolean; P2: Integer; P3: Integer; P4: JString; P5: JOutputStream; P6: JInputStream; P7: JPrintCallback); cdecl;
//    procedure a(P1: Integer; P2: JJSONObject; P3: Double; P4: Double); cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//    function c: Single; cdecl; overload;
//    function h: Boolean; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function l: Boolean; cdecl; overload;
//    function endJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function mm2Pix(P1: Double): Integer; cdecl;
//    function b(P1: Double): Double; cdecl; overload;
//    function getPreview: JBitmap; cdecl;
//    procedure k; cdecl; overload;
//    procedure c(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: Jc); cdecl; overload;
//    procedure g; cdecl; overload;
//    function a: JHashSet; cdecl; overload;
//    procedure d(P1: Integer); cdecl; overload;
//    procedure c(P1: Integer); cdecl; overload;
//    procedure b(P1: Integer; P2: Integer; P3: Boolean); cdecl; overload;
//    procedure b(P1: Jc); cdecl; overload;
//    procedure b(P1: Boolean); cdecl; overload;
//    function a(P1: Boolean): Ji0_a; cdecl; overload;
//    procedure i; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Jc; cdecl; overload;
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    procedure resume(P1: JInputStream; P2: JOutputStream); cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//
//    { Property }
//    property u: Integer read _Getu write _Setu;
//    property v: Integer read _Getv write _Setv;
//    property w: Integer read _Getw write _Setw;
//    property x: Integer read _Getx write _Setx;
//    property y: Integer read _Gety write _Sety;
//    property z: Integer read _Getz write _Setz;
//    property A: JBitmap read _GetA write _SetA;
//    property B: JList read _GetB write _SetB;
//    property C: Integer read _GetC write _SetC;
//  end;
//
//  TJb2 = class(TJavaGenericImport<Jb2Class, Jb2>) end;

  JImageDataInfoClass = interface(JObjectClass)
  ['{6E96900C-4DCA-437D-88BC-7FC10D72561B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitmap; P2: Integer; P3: JString): JImageDataInfo; cdecl; overload;
    {class} function init: JImageDataInfo; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/ImageDataInfo')]
  JImageDataInfo = interface(JObject)
  ['{A23BCCBE-0B51-4E9F-8894-ACB760DA5F70}']
    { Property Methods }
    function _Getbitmap: JBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setbitmap(abitmap: JBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GeterrorCode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeterrorCode(aerrorCode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GeterrorInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeterrorInfo(aerrorInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getErrorCode: Integer; cdecl;
    procedure setErrorCode(P1: Integer); cdecl;
    function getErrorInfo: JString; cdecl;
    procedure setErrorInfo(P1: JString); cdecl;
    function getBitmap: JBitmap; cdecl;
    procedure setBitmap(P1: JBitmap); cdecl;

    { Property }
    property bitmap: JBitmap read _Getbitmap write _Setbitmap;
    property errorCode: Integer read _GeterrorCode write _SeterrorCode;
    property errorInfo: JString read _GeterrorInfo write _SeterrorInfo;
  end;

  TJImageDataInfo = class(TJavaGenericImport<JImageDataInfoClass, JImageDataInfo>) end;

  JPrinterInfoClass = interface(JObjectClass)
  ['{AF03990A-A381-4C14-AEAA-F49D5AFA02BE}']
    { static Property Methods }
    {class} function _GetNO_SUPPORT_PRINTERI_NFO: JPrinterInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPrinterInfo; cdecl; overload;
//    {class} function init: JPrinterInfo; cdecl; overload;

    { static Property }
    {class} property NO_SUPPORT_PRINTERI_NFO: JPrinterInfo read _GetNO_SUPPORT_PRINTERI_NFO;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/PrinterInfo')]
  JPrinterInfo = interface(JObject)
  ['{A510EB66-EB4C-423B-B5D8-791D1C36F31F}']
    { Property Methods }

    { methods }
    function getPrinterSoftwareVersion: JString; cdecl;
    function getPrinterSoftwareVersionNumber: Double; cdecl;
    procedure setPrinterSoftwareVersion(P1: JString); cdecl;
    function getPrinterHardwareVersion: JString; cdecl;
    function getPrinterHardwareVersionNumber: Double; cdecl;
    procedure setPrinterHardwareVersion(P1: JString); cdecl;
    function getPrinterHeadWidth: Integer; cdecl;
    procedure setPrinterHeadWidth(P1: Integer); cdecl;
    function getPrintingAccuracy: Integer; cdecl;
    procedure setPrintingAccuracy(P1: Integer); cdecl;
    function getPrintHeadAlignment: Integer; cdecl;
    procedure setPrintHeadAlignment(P1: Integer); cdecl;
    function isSupportRfid: Boolean; cdecl;
    procedure setSupportRfid(P1: Boolean); cdecl;
    function isPrinterSupportrWriteRfid: Boolean; cdecl;
    procedure setPrinterSupportrWriteRfid(P1: Boolean); cdecl;
    function getIsSupportGetPrinterInfo: Integer; cdecl;
    procedure setIsSupportGetPrinterInfo(P1: Integer); cdecl;
    function toString: JString; cdecl;
    procedure refreshData; cdecl;
    procedure setData(P1: JPrinterInfo); cdecl;

    { Property }
  end;

  TJPrinterInfo = class(TJavaGenericImport<JPrinterInfoClass, JPrinterInfo>) end;

  JPrinterPageImpl_DrawBarcode1DItemClass = interface(JObjectClass)
  ['{55370672-BA41-4FED-AA95-4CD1BA837E38}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JPrinterPageImpl): JPrinterPageImpl_DrawBarcode1DItem; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/PrinterPageImpl$DrawBarcode1DItem')]
  JPrinterPageImpl_DrawBarcode1DItem = interface(JObject)
  ['{7081A443-A4D4-437F-893C-64A73B2D9A00}']
    { Property Methods }
    function _Gettype: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settype(atype: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setx(ax: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gety: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sety(ay: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettext: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settext(atext: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getwidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setwidth(awidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getheight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setheight(aheight: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getrotate: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setrotate(arotate: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getthis_0: JPrinterPageImpl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setthis_0(athis_0: JPrinterPageImpl);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property &type: JString read _Gettype write _Settype;
    property x: Integer read _Getx write _Setx;
    property y: Integer read _Gety write _Sety;
    property text: JString read _Gettext write _Settext;
    property width: Integer read _Getwidth write _Setwidth;
    property height: Integer read _Getheight write _Setheight;
    property rotate: Boolean read _Getrotate write _Setrotate;
    property this_0: JPrinterPageImpl read _Getthis_0 write _Setthis_0;
  end;

  TJPrinterPageImpl_DrawBarcode1DItem = class(TJavaGenericImport<JPrinterPageImpl_DrawBarcode1DItemClass, JPrinterPageImpl_DrawBarcode1DItem>) end;

  JPrinterPageImpl_DrawBarcodeQRcodeItemClass = interface(JObjectClass)
  ['{FBF3E22A-A1B7-426F-964A-4C30059CC86B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JPrinterPageImpl): JPrinterPageImpl_DrawBarcodeQRcodeItem; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/PrinterPageImpl$DrawBarcodeQRcodeItem')]
  JPrinterPageImpl_DrawBarcodeQRcodeItem = interface(JObject)
  ['{B8FD18F0-2A05-47EE-98FC-8AA4FFFB2884}']
    { Property Methods }
    function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setx(ax: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gety: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sety(ay: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettext: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settext(atext: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getsize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setsize(asize: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GeterrLevel: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeterrLevel(aerrLevel: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getrotate: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setrotate(arotate: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getthis_0: JPrinterPageImpl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setthis_0(athis_0: JPrinterPageImpl);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property x: Integer read _Getx write _Setx;
    property y: Integer read _Gety write _Sety;
    property text: JString read _Gettext write _Settext;
    property size: Integer read _Getsize write _Setsize;
    property errLevel: JString read _GeterrLevel write _SeterrLevel;
    property rotate: Boolean read _Getrotate write _Setrotate;
    property this_0: JPrinterPageImpl read _Getthis_0 write _Setthis_0;
  end;

  TJPrinterPageImpl_DrawBarcodeQRcodeItem = class(TJavaGenericImport<JPrinterPageImpl_DrawBarcodeQRcodeItemClass, JPrinterPageImpl_DrawBarcodeQRcodeItem>) end;

  JPrinterPageImpl_DrawBitmapItemClass = interface(JObjectClass)
  ['{204C6B6D-20C8-4D27-B9F4-26125C2B5CD4}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JPrinterPageImpl): JPrinterPageImpl_DrawBitmapItem; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/PrinterPageImpl$DrawBitmapItem')]
  JPrinterPageImpl_DrawBitmapItem = interface(JObject)
  ['{9C503BB2-5C82-41A3-A113-DA84C0BDD613}']
    { Property Methods }
    function _Getbmp: JBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setbmp(abmp: JBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setx(ax: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gety: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sety(ay: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getrotate: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setrotate(arotate: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getthis_0: JPrinterPageImpl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setthis_0(athis_0: JPrinterPageImpl);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property bmp: JBitmap read _Getbmp write _Setbmp;
    property x: Integer read _Getx write _Setx;
    property y: Integer read _Gety write _Sety;
    property rotate: Boolean read _Getrotate write _Setrotate;
    property this_0: JPrinterPageImpl read _Getthis_0 write _Setthis_0;
  end;

  TJPrinterPageImpl_DrawBitmapItem = class(TJavaGenericImport<JPrinterPageImpl_DrawBitmapItemClass, JPrinterPageImpl_DrawBitmapItem>) end;

  JPrinterPageImpl_DrawBoxItemClass = interface(JObjectClass)
  ['{A11C9A8D-7DD1-4501-8EA3-3808FD7A43FE}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JPrinterPageImpl): JPrinterPageImpl_DrawBoxItem; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/PrinterPageImpl$DrawBoxItem')]
  JPrinterPageImpl_DrawBoxItem = interface(JObject)
  ['{87802D51-7D41-4B39-9FAA-20192FD2B0F1}']
    { Property Methods }
    function _Getx0: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setx0(ax0: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gety0: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sety0(ay0: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getx1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setx1(ax1: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gety1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sety1(ay1: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getwidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setwidth(awidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getthis_0: JPrinterPageImpl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setthis_0(athis_0: JPrinterPageImpl);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property x0: Integer read _Getx0 write _Setx0;
    property y0: Integer read _Gety0 write _Sety0;
    property x1: Integer read _Getx1 write _Setx1;
    property y1: Integer read _Gety1 write _Sety1;
    property width: Integer read _Getwidth write _Setwidth;
    property this_0: JPrinterPageImpl read _Getthis_0 write _Setthis_0;
  end;

  TJPrinterPageImpl_DrawBoxItem = class(TJavaGenericImport<JPrinterPageImpl_DrawBoxItemClass, JPrinterPageImpl_DrawBoxItem>) end;

  JPrinterPageImpl_DrawLineItemClass = interface(JObjectClass)
  ['{0DB03B27-02B5-4B95-BCB8-1C989EEBED66}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JPrinterPageImpl): JPrinterPageImpl_DrawLineItem; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/PrinterPageImpl$DrawLineItem')]
  JPrinterPageImpl_DrawLineItem = interface(JObject)
  ['{17A27476-E6BE-4B09-9904-0328DCD7E97F}']
    { Property Methods }
    function _Getx0: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setx0(ax0: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gety0: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sety0(ay0: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getx1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setx1(ax1: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gety1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sety1(ay1: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getwidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setwidth(awidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getthis_0: JPrinterPageImpl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setthis_0(athis_0: JPrinterPageImpl);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property x0: Integer read _Getx0 write _Setx0;
    property y0: Integer read _Gety0 write _Sety0;
    property x1: Integer read _Getx1 write _Setx1;
    property y1: Integer read _Gety1 write _Sety1;
    property width: Integer read _Getwidth write _Setwidth;
    property this_0: JPrinterPageImpl read _Getthis_0 write _Setthis_0;
  end;

  TJPrinterPageImpl_DrawLineItem = class(TJavaGenericImport<JPrinterPageImpl_DrawLineItemClass, JPrinterPageImpl_DrawLineItem>) end;

  JPrinterPageImpl_DrawTextItemClass = interface(JObjectClass)
  ['{6F75E5E2-E269-45AC-B645-A882D011AA38}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JPrinterPageImpl): JPrinterPageImpl_DrawTextItem; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/PrinterPageImpl$DrawTextItem')]
  JPrinterPageImpl_DrawTextItem = interface(JObject)
  ['{319DE873-9A71-4E39-A55B-435BFE4FA198}']
    { Property Methods }
    function _Gettext_x: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settext_x(atext_x: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettext_y: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settext_y(atext_y: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettext: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settext(atext: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetfontSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetfontSize(afontSize: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getrotate: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setrotate(arotate: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getbold: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setbold(abold: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getreverse: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setreverse(areverse: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getunderline: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setunderline(aunderline: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getthis_0: JPrinterPageImpl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setthis_0(athis_0: JPrinterPageImpl);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property text_x: Integer read _Gettext_x write _Settext_x;
    property text_y: Integer read _Gettext_y write _Settext_y;
    property text: JString read _Gettext write _Settext;
    property fontSize: Integer read _GetfontSize write _SetfontSize;
    property rotate: Integer read _Getrotate write _Setrotate;
    property bold: Integer read _Getbold write _Setbold;
    property reverse: Boolean read _Getreverse write _Setreverse;
    property underline: Boolean read _Getunderline write _Setunderline;
    property this_0: JPrinterPageImpl read _Getthis_0 write _Setthis_0;
  end;

  TJPrinterPageImpl_DrawTextItem = class(TJavaGenericImport<JPrinterPageImpl_DrawTextItemClass, JPrinterPageImpl_DrawTextItem>) end;

  JPrinterPageImpl_FontInfoClass = interface(JObjectClass)
  ['{822E0B42-1AF2-4745-95E8-989DFF954C3D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/PrinterPageImpl$FontInfo')]
  JPrinterPageImpl_FontInfo = interface(JObject)
  ['{CDCECDE4-0873-4DC7-A5F2-330165B00B7E}']
    { Property Methods }
    function _GetFontTypeface: JTypeface;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetFontTypeface(aFontTypeface: JTypeface);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetFontName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetFontName(aFontName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getthis_0: JPrinterPageImpl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setthis_0(athis_0: JPrinterPageImpl);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property FontTypeface: JTypeface read _GetFontTypeface write _SetFontTypeface;
    property FontName: JString read _GetFontName write _SetFontName;
    property this_0: JPrinterPageImpl read _Getthis_0 write _Setthis_0;
  end;

  TJPrinterPageImpl_FontInfo = class(TJavaGenericImport<JPrinterPageImpl_FontInfoClass, JPrinterPageImpl_FontInfo>) end;

  JPrinterPageImplClass = interface(JObjectClass)
  ['{8095507F-5CA9-4110-81EA-490291E223A1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrinterPageImpl; cdecl; overload;
    {class} function byteArrToHex(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function hexToByteArr(P1: JString): TJavaArray<Byte>; cdecl;
//    {class} function init: JPrinterPageImpl; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/PrinterPageImpl')]
  JPrinterPageImpl = interface(JObject)
  ['{CD047648-ECF7-483F-BD79-F89A8D1E5032}']
    { Property Methods }
    function _Get_str: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Set_str(a_str: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlistDrawText: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlistDrawText(alistDrawText: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlistDrawLine: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlistDrawLine(alistDrawLine: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlistDrawBox: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlistDrawBox(alistDrawBox: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlistDrawBitmap: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlistDrawBitmap(alistDrawBitmap: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlistDrawBarcode1D: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlistDrawBarcode1D(alistDrawBarcode1D: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlistDrawBarcodeQRcode: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlistDrawBarcodeQRcode(alistDrawBarcodeQRcode: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure Create(P1: Integer; P2: Integer); cdecl;
    procedure Clear; cdecl;
    procedure add(P1: TJavaArray<Byte>); cdecl;
    procedure feed; cdecl;
    function getDataLen: Integer; cdecl;
    function GetData(P1: Integer): TJavaArray<Byte>; cdecl;
    procedure DrawText(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean); cdecl; overload;
    procedure makeDrawText(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure DrawText(P1: Integer; P2: Integer; P3: JString; P4: JString; P5: Integer; P6: Boolean; P7: Boolean); cdecl; overload;
    procedure DrawLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure makeDrawLine(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure Drawbox(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure makeDrawBox(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure INVERSE(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure DrawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Boolean); cdecl;
    procedure realDrawBitmapBytes(P1: Integer; P2: Integer; P3: TJavaArray<Byte>); cdecl;
    function ru: JString; cdecl;
    procedure makeDrawBitmap(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure DrawBarcode1D(P1: JString; P2: Integer; P3: Integer; P4: JString; P5: Integer; P6: Integer; P7: Boolean); cdecl;
    procedure makeDrawBarcode1D(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure DrawBarcodeQRcode(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: JString; P6: Boolean); cdecl;
    procedure makeDrawBarcodeQRcode(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure DrawBitmap1(P1: JBitmap; P2: Integer; P3: Integer; P4: Boolean); cdecl;
    procedure PageFree; cdecl;

    { Property }
    property _str: JString read _Get_str write _Set_str;
    property listDrawText: JList read _GetlistDrawText write _SetlistDrawText;
    property listDrawLine: JList read _GetlistDrawLine write _SetlistDrawLine;
    property listDrawBox: JList read _GetlistDrawBox write _SetlistDrawBox;
    property listDrawBitmap: JList read _GetlistDrawBitmap write _SetlistDrawBitmap;
    property listDrawBarcode1D: JList read _GetlistDrawBarcode1D write _SetlistDrawBarcode1D;
    property listDrawBarcodeQRcode: JList read _GetlistDrawBarcodeQRcode write _SetlistDrawBarcodeQRcode;
  end;

  TJPrinterPageImpl = class(TJavaGenericImport<JPrinterPageImplClass, JPrinterPageImpl>) end;

  JPrintingHistoryDataClass = interface(JObjectClass)
  ['{04C48358-8829-43ED-9AD8-E6A4E928676A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrintingHistoryData; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/bean/PrintingHistoryData')]
  JPrintingHistoryData = interface(JObject)
  ['{EB99D8D7-EC8F-4F7D-A2BD-8CA1E4BCC816}']
    { Property Methods }

    { methods }
    function getUuId: JString; cdecl;
    procedure setUuId(P1: JString); cdecl;
    function getLimitNumber: Integer; cdecl;
    procedure setLimitNumber(P1: Integer); cdecl;
    function getAlreadyUsedNumber: Integer; cdecl;
    procedure setAlreadyUsedNumber(P1: Integer); cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJPrintingHistoryData = class(TJavaGenericImport<JPrintingHistoryDataClass, JPrintingHistoryData>) end;

//  Jf0Class = interface(JObjectClass)
//  ['{E1B770FA-51E1-4AB0-9A7D-758DD64916DB}']
//    { static Property Methods }
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jf0; cdecl; overload;
//    {class} procedure a(P1: Jf0; P2: JString; P3: JString; P4: JString; P5: TJavaArray<Byte>; P6: JString; P7: JOutputStream; P8: JInputStream; P9: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    {class} function init: Jf0; cdecl; overload;
//
//    { static Property }
//    {class} property b: Boolean read _Getb;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/f0')]
//  Jf0 = interface(JObject)
//  ['{7B455465-5F6B-4AA0-8DFF-4C3D9C893103}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPrinterSpeed(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterAutoShutDownTime(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterLanguage(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterReset(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function setLabelMaterial(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    procedure setUpdateFirmwareRequest(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure cancelUpdateFirmwareRequest; cdecl;
//    procedure setMainControlPanelUpgrade(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure cancelMainControlPanelUpgrade; cdecl;
//    procedure a(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    procedure a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    procedure a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl; overload;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;
//
//  TJf0 = class(TJavaGenericImport<Jf0Class, Jf0>) end;

//  Jc0Class = interface(Jf0Class) // or JObjectClass
//  ['{65B06B87-A24B-4BA6-9985-18AACD599A5A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/c0')]
//  Jc0 = interface(Jf0) // or JObject
//  ['{FC854D09-F7E2-4C6A-A32A-E971C99FF4DB}']
//    { Property Methods }
//
//    { methods }
//    function setBluetoothDistributionNetwork(P1: JString; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJc0 = class(TJavaGenericImport<Jc0Class, Jc0>) end;

//  Jh1Class = interface(Jc_258Class) // or JObjectClass
//  ['{C6D26E69-94B0-4783-9070-4A8BC1121087}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jh1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/h1')]
//  Jh1 = interface(Jc_258) // or JObject
//  ['{6FD1ECB3-8FF3-47F4-ACDA-184A2EF34EE9}']
//    { Property Methods }
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//  end;
//
//  TJh1 = class(TJavaGenericImport<Jh1Class, Jh1>) end;

//  Jc1Class = interface(Jh1Class) // or JObjectClass
//  ['{4FAA27D2-C4A4-44F8-96B3-0EA052E5BBFE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jc1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/c1')]
//  Jc1 = interface(Jh1) // or JObject
//  ['{A4C57582-9606-49A3-B3D7-B326F54C52DB}']
//    { Property Methods }
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//  end;
//
//  TJc1 = class(TJavaGenericImport<Jc1Class, Jc1>) end;

//  Jc2Class = interface(JObjectClass)
//  ['{FFDD81AD-BDC2-4ECB-8641-535C383BC16C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc2; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/c2')]
//  Jc2 = interface(JObject)
//  ['{9E6DB0FF-9F4C-4EA0-BCA7-3C6D6709DF1F}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterDensity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSpeed(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrintMode(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterLanguage(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getAutoShutDownTime(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSoftWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterElectricity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterHardWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function getPrinterRfidParameters(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JList; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterRfidSuccessTimes(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterNetworkState(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function isPrinterSupportrWriteRfid: Boolean; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback): JPrinterInfo; cdecl;
//    function isSupportSetMaterial: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJc2 = class(TJavaGenericImport<Jc2Class, Jc2>) end;

  JCallbackClass = interface(JObjectClass)
  ['{B9561697-6D90-48C1-B979-9870D3A1D248}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/callback/Callback')]
  JCallback = interface(IJavaInstance)
  ['{7DB93CEC-CA20-4208-A82D-78E5588A933C}']
    { Property Methods }

    { methods }
    procedure onConnectSuccess(P1: JString); cdecl;
    procedure onDisConnect; cdecl;
    procedure onElectricityChange(P1: Integer); cdecl;
    procedure onCoverStatus(P1: Integer); cdecl;
    procedure onPaperStatus(P1: Integer); cdecl;
    procedure onHeartDisConnect; cdecl;

    { Property }
  end;

  TJCallback = class(TJavaGenericImport<JCallbackClass, JCallback>) end;

  JNeedDataCallBackClass = interface(JObjectClass)
  ['{AC9A65F5-316A-4EC1-91C5-586CE33E40AA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/callback/NeedDataCallBack')]
  JNeedDataCallBack = interface(IJavaInstance)
  ['{80416A03-021E-4DD3-96E4-AD6249804008}']
    { Property Methods }

    { methods }
    procedure need; cdecl;
    procedure onError(P1: JArrayList); cdecl;

    { Property }
  end;

  TJNeedDataCallBack = class(TJavaGenericImport<JNeedDataCallBackClass, JNeedDataCallBack>) end;

  JPrintCallbackClass = interface(JObjectClass)
  ['{54731319-DA2E-4735-87EB-1D0B971CA62D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/callback/PrintCallback')]
  JPrintCallback = interface(IJavaInstance)
  ['{74FF3DCD-56B7-465C-A5CB-1475414E62BF}']
    { Property Methods }

    { methods }
    procedure onProgress(P1: Integer; P2: Integer; P3: JHashMap); cdecl;
    procedure onError(P1: Integer; P2: Integer); cdecl; overload;
    procedure onError(P1: Integer); cdecl; overload;
    procedure onBufferFree(P1: Integer; P2: Integer); cdecl;
    procedure onPause(P1: Boolean); cdecl;
    procedure onCancelJob(P1: Boolean); cdecl;

    { Property }
  end;

  TJPrintCallback = class(TJavaGenericImport<JPrintCallbackClass, JPrintCallback>) end;

  JUpDateDeviceSoftWareCallbackClass = interface(JObjectClass)
  ['{906DC382-9237-44CB-B2DF-850D893DF1CE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/callback/UpDateDeviceSoftWareCallback')]
  JUpDateDeviceSoftWareCallback = interface(IJavaInstance)
  ['{EBCD40C7-DD32-4558-863D-5CE2219D0726}']
    { Property Methods }

    { methods }
    procedure onUpgradeProgress(P1: JString); cdecl;
    procedure onUpdateAbnormal(P1: Integer); cdecl;
    procedure onUpgradeSuccess; cdecl;

    { Property }
  end;

  TJUpDateDeviceSoftWareCallback = class(TJavaGenericImport<JUpDateDeviceSoftWareCallbackClass, JUpDateDeviceSoftWareCallback>) end;

//  Jd_266Class = interface(Jh1Class) // or JObjectClass
//  ['{16018BF6-9B5D-42BE-BBCF-B4867213A3D1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jd_266; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/d')]
//  Jd_266 = interface(Jh1) // or JObject
//  ['{69F7FCF6-0E8B-433A-AEFD-75968A389053}']
//    { Property Methods }
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//  end;
//
//  TJd_266 = class(TJavaGenericImport<Jd_266Class, Jd_266>) end;

//  Je_279Class = interface(Jd_338Class) // or JObjectClass
//  ['{CC32E032-F84D-4200-9933-7D6D990B67A4}']
//    { static Property Methods }
//    {class} function _Getu: Je;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Je_279; cdecl;
//    {class} function m: Je; cdecl;
//
//    { static Property }
//    {class} property u: Je read _Getu;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/e')]
//  Je_279 = interface(Jd_338) // or JObject
//  ['{FE691819-80FE-4820-82B9-5F888E1D772D}']
//    { Property Methods }
//    function _Gets: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure g; cdecl;
//    function l: Boolean; cdecl;
//    procedure resume(P1: JInputStream; P2: JOutputStream); cdecl;
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    procedure a(P1: Jc); cdecl; overload;
//    function a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl; overload;
//    procedure n; cdecl;
//    function b: Integer; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//    function c: Single; cdecl;
//    procedure a(P1: Jc_b); cdecl; overload;
//    procedure o; cdecl;
//    function b(P1: Jc_b): Int64; cdecl; overload;
//
//    { Property }
//    property s: Boolean read _Gets write _Sets;
//    property t: Boolean read _Gett write _Sett;
//  end;
//
//  TJe_279 = class(TJavaGenericImport<Je_279Class, Je_279>) end;

//  Jd1Class = interface(Je_279Class) // or JObjectClass
//  ['{9BF22645-F876-4839-931A-1B27510A40E9}']
//    { static Property Methods }
//    {class} function _Getv: Jd1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jd1; cdecl;
//    {class} function p: Jd1; cdecl;
//
//    { static Property }
//    {class} property v: Jd1 read _Getv;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/d1')]
//  Jd1 = interface(Je_279) // or JObject
//  ['{BCD3385E-2334-4826-B30F-F41F42D87C02}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJd1 = class(TJavaGenericImport<Jd1Class, Jd1>) end;

//  Jd2_aClass = interface(JThreadClass) // or JObjectClass
//  ['{EAF2C872-3E87-4A2C-909E-EF6D81E2B94C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd2; P2: Boolean; P3: JString; P4: JString; P5: JString; P6: TJavaArray<Byte>; P7: JString; P8: JOutputStream; P9: JInputStream; P10: JUpDateDeviceSoftWareCallback): Jd2_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/d2$a')]
//  Jd2_a = interface(JThread) // or JObject
//  ['{993A1BCD-0AC7-4968-A1D9-BFDBEE802C59}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JOutputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JOutputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JUpDateDeviceSoftWareCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JUpDateDeviceSoftWareCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Jd2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Jd2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: TJavaArray<Byte> read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JString read _Getf write _Setf;
//    property g: JOutputStream read _Getg write _Setg;
//    property h: JInputStream read _Geth write _Seth;
//    property i: JUpDateDeviceSoftWareCallback read _Geti write _Seti;
//    property j: Jd2 read _Getj write _Setj;
//  end;
//
//  TJd2_a = class(TJavaGenericImport<Jd2_aClass, Jd2_a>) end;

//  Jd2Class = interface(JObjectClass)
//  ['{89E2CD41-2026-401A-AABD-D58B797DCA9C}']
//    { static Property Methods }
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jd2; cdecl; overload;
//    {class} procedure a(P1: Jd2; P2: Boolean; P3: JString; P4: JString; P5: JString; P6: TJavaArray<Byte>; P7: JString; P8: JOutputStream; P9: JInputStream; P10: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    {class} function init: Jd2; cdecl; overload;
//
//    { static Property }
//    {class} property b: Boolean read _Getb;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/d2')]
//  Jd2 = interface(JObject)
//  ['{31DAE40B-00EF-45BA-97DE-924A98D5FFB2}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPrinterSpeed(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterAutoShutDownTime(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterLanguage(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterReset(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function setBluetoothDistributionNetwork(P1: JString; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setLabelMaterial(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    procedure setUpdateFirmwareRequest(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure cancelUpdateFirmwareRequest; cdecl;
//    procedure setMainControlPanelUpgrade(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure cancelMainControlPanelUpgrade; cdecl;
//    procedure a(P1: Boolean; P2: JString; P3: JString; P4: JString; P5: TJavaArray<Byte>; P6: JString; P7: JOutputStream; P8: JInputStream; P9: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    procedure a(P1: Boolean; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JUpDateDeviceSoftWareCallback; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>); cdecl; overload;
//    procedure a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl; overload;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;
//
//  TJd2 = class(TJavaGenericImport<Jd2Class, Jd2>) end;

  JAbstractPacketClass = interface(JObjectClass)
  ['{B460DE30-69A4-43B3-8A2E-85E19FF29A61}']
    { static Property Methods }
    {class} function _GetEMPTY: JAbstractPacket;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_NOT_FINISH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_COMPLETE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAbstractPacket; cdecl; overload;
//    {class} function init: JAbstractPacket; cdecl; overload;

    { static Property }
    {class} property EMPTY: JAbstractPacket read _GetEMPTY;
    {class} property READ_ERROR: Integer read _GetREAD_ERROR;
    {class} property READ_NOT_FINISH: Integer read _GetREAD_NOT_FINISH;
    {class} property READ_COMPLETE: Integer read _GetREAD_COMPLETE;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/data/AbstractPacket')]
  JAbstractPacket = interface(JObject)
  ['{33261797-FC74-4030-952F-A14F1B3B236C}']
    { Property Methods }
    function _Getid: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setid(aid: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetretryTimes: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetretryTimes(aretryTimes: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettimeoutMills: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettimeoutMills(atimeoutMills: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure write(P1: JOutputStream); cdecl; overload;
    function read(P1: JInputStream): Integer; cdecl; overload;
    function toBytes: TJavaArray<Byte>; cdecl;
    function write: TJavaArray<Byte>; cdecl; overload;
    function read(P1: TJavaArray<Byte>): Integer; cdecl; overload;
    function hashCode: Integer; cdecl;
    function hasResponse: Boolean; cdecl;
    function isResponse(P1: JAbstractPacket): Boolean; cdecl;

    { Property }
    property id: Int64 read _Getid write _Setid;
    property retryTimes: Integer read _GetretryTimes write _SetretryTimes;
    property timeoutMills: Int64 read _GettimeoutMills write _SettimeoutMills;
  end;

  TJAbstractPacket = class(TJavaGenericImport<JAbstractPacketClass, JAbstractPacket>) end;

//  JAbstractPacket_1Class = interface(JAbstractPacketClass) // or JObjectClass
//  ['{1BF5B354-980E-44B7-B50D-CFC51FB2C293}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JAbstractPacket_1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/data/AbstractPacket$1')]
//  JAbstractPacket_1 = interface(JAbstractPacket) // or JObject
//  ['{A149DA79-9BD0-4260-911B-6C04583264C8}']
//    { Property Methods }
//
//    { methods }
//    procedure write(P1: JOutputStream); cdecl; overload;
//    function read(P1: JInputStream): Integer; cdecl; overload;
//    function write: TJavaArray<Byte>; cdecl; overload;
//    function read(P1: TJavaArray<Byte>): Integer; cdecl; overload;
//    function hashCode: Integer; cdecl;
//    function hasResponse: Boolean; cdecl;
//    function isResponse(P1: JAbstractPacket): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJAbstractPacket_1 = class(TJavaGenericImport<JAbstractPacket_1Class, JAbstractPacket_1>) end;

  JDataCheckClass = interface(JObjectClass)
  ['{2673F927-968B-41CA-8B7B-A5DD116FA781}']
    { static Property Methods }
    {class} function _GetsAllowReportException: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEND_PAGE_PRINT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDataCheck; cdecl; overload;
    {class} function isContainData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Boolean; cdecl; overload;
    {class} function isContainData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer): Boolean; cdecl; overload;
    {class} function isContainDataHead(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer): Boolean; cdecl;
    {class} function isContainVariableData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Boolean; cdecl;
    {class} procedure parsePrinterAdvancedData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: JCallback); cdecl;
    {class} function checkPrinterSn(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl; overload;
    {class} function checkPrinterInfo(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    {class} function checkPrinterSoftWareVersion(P1: TJavaArray<Byte>; P2: Boolean): JString; cdecl;
    {class} function checkPrinterType(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function checkPrinterSn(P1: TJavaArray<Byte>; P2: Boolean): JString; cdecl; overload;
    {class} function checkPrinterHardWareVersion(P1: TJavaArray<Byte>; P2: Boolean): JString; cdecl;
    {class} function checkPrinterRfidParameter(P1: TJavaArray<Byte>): JHashMap; cdecl;
    {class} function checkPrinterRfidParameter2(P1: TJavaArray<Byte>): JHashMap; cdecl;
    {class} procedure setFailData(P1: JHashMap); cdecl;
    {class} function parseContainHeadData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function checkEndPage(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
    {class} function checkEndJob(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
    {class} function checkResponseData(P1: Integer; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JPrintCallback; P6: Boolean): Boolean; cdecl;
    {class} function printCheckData200(P1: JOutputStream; P2: JInputStream; P3: Integer; P4: Boolean): Boolean; cdecl;
    {class} function printCheckLineData(P1: JOutputStream; P2: JInputStream; P3: Integer; P4: Boolean): Integer; cdecl;
    {class} function printCheckDataDataResend(P1: JOutputStream; P2: JInputStream; P3: Integer; P4: Boolean): Integer; cdecl;
    {class} function printCheckData200DataResend(P1: JOutputStream; P2: JInputStream; P3: Integer; P4: Boolean): Integer; cdecl;
    {class} function printingHistoryData(P1: TJavaArray<Byte>; P2: JCallback; P3: Boolean): JArrayList; cdecl;
    {class} function getPrinterRfidSuccessTimes(P1: TJavaArray<Byte>): JHashMap; cdecl;
    {class} function checkPrinterMacAddress(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function getCheckData(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    {class} procedure clearCatchStream(P1: JInputStream; P2: TJavaArray<Byte>); cdecl;
    {class} function checkPrinterInformation(P1: TJavaArray<Byte>; P2: Boolean): JPrinterInfo; cdecl;
//    {class} function init: JDataCheck; cdecl; overload;

    { static Property }
    {class} property sAllowReportException: Boolean read _GetsAllowReportException;
    {class} property END_PAGE_PRINT: Integer read _GetEND_PAGE_PRINT;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/data/DataCheck')]
  JDataCheck = interface(JObject)
  ['{B60AA039-218A-4EB6-93DB-99E4AA89D4D1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataCheck = class(TJavaGenericImport<JDataCheckClass, JDataCheck>) end;

  JDataGeneratorClass = interface(JObjectClass)
  ['{43CF439F-8966-41EE-9C88-0B98D83A30E9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataGenerator; cdecl;
    {class} function generateAbnormalResponse(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function generateSendPrintQuantity(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function generateGetPrinterInfoType(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function generateCheckData200(P1: Integer; P2: Integer): TJavaArray<Byte>; cdecl;
    {class} function generateCheckData200DataResend(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function generateCheckDataDataResend(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function generateCheckData(P1: Integer; P2: Integer): TJavaArray<Byte>; cdecl;
    {class} function generateUpdateFirmwareInstruction(P1: Boolean; P2: JString): TJavaArray<Byte>; cdecl;
    {class} function generateUpdateFirmwareInstructionCheck(P1: Integer; P2: Boolean): TJavaArray<Byte>; cdecl;
    {class} function generateSendInstructionWithBbc(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: Integer): JList; cdecl;
    {class} function generateSendInstructionWithCrc(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: Integer): JList; cdecl;
    {class} function generateCyclicRedundancyCheckSendInstruction(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function getCheckDataValue(P1: JString): JString; cdecl;
    {class} function generateCyclicRedundancyCheck(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function generateCyclicRedundancyCheckInstruction(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function generateCyclicRedundancyCheckValue(P1: TJavaArray<Byte>): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/data/DataGenerator')]
  JDataGenerator = interface(JObject)
  ['{063C675A-0F98-496B-9CD9-E2E55B44DC7F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataGenerator = class(TJavaGenericImport<JDataGeneratorClass, JDataGenerator>) end;

  JDataProcessClass = interface(JObjectClass)
  ['{A0597206-7271-4A59-B46E-F3E7C7D10BBE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataProcess; cdecl; overload;
    {class} procedure setIgnoredErrors(P1: TJavaArray<Byte>); cdecl;
    {class} procedure electricityChangeProcess(P1: TJavaArray<Byte>; P2: JCallback); cdecl;
    {class} function parseException(P1: TJavaArray<Byte>): Integer; cdecl;
//    {class} function init: JDataProcess; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/data/DataProcess')]
  JDataProcess = interface(JObject)
  ['{6C1237CD-F121-4561-B7B1-D9842AED35A6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataProcess = class(TJavaGenericImport<JDataProcessClass, JDataProcess>) end;

  JDataSend_OnProgressCallbackClass = interface(JObjectClass)
  ['{18F2305D-244A-4D4F-A497-851926B49D8B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/data/DataSend$OnProgressCallback')]
  JDataSend_OnProgressCallback = interface(IJavaInstance)
  ['{57745E6A-DA69-4508-87A3-6839EE633EB2}']
    { Property Methods }

    { methods }
    procedure onProgress(P1: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJDataSend_OnProgressCallback = class(TJavaGenericImport<JDataSend_OnProgressCallbackClass, JDataSend_OnProgressCallback>) end;

  JDataSendClass = interface(JObjectClass)
  ['{8B7DBA42-AAF3-4BC9-9FB3-99A364538EB5}']
    { static Property Methods }
    {class} function _GetsCancelJob: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsRepeatRequestCounts: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetsendDataLock: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetprogressCallback: JDataSend_OnProgressCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDataSend; cdecl; overload;
    {class} function queryPrinterIsBusyInstructionSend(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: Boolean): Integer; cdecl;
    {class} function getConnectData(P1: JOutputStream; P2: JInputStream): TJavaArray<Byte>; cdecl;
    {class} function getPrinterStatusData(P1: JOutputStream; P2: JInputStream): TJavaArray<Byte>; cdecl;
    {class} function printerConnectInstructionSend(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: Boolean): Integer; cdecl;
    {class} function printerDensitySetterInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback; P5: Boolean): Integer; cdecl;
    {class} function allowPrintClearInstructionSend(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Integer; cdecl;
    {class} function printerDensityGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): Integer; cdecl;
    {class} function printerSpeedSetterInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback; P5: Boolean): Integer; cdecl;
    {class} function printerSpeedGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): Integer; cdecl;
    {class} function printerLabelSetterInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback; P5: Boolean): Integer; cdecl;
    {class} function printerLabelPositioningCalibrationSetterInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback; P5: Boolean): Integer; cdecl;
    {class} function updateDeviceSoftwareVersionInstructionSend(P1: TJavaArray<Byte>; P2: JOutputStream; P3: JInputStream): TJavaArray<Byte>; cdecl;
    {class} function printerLabelGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): Integer; cdecl;
    {class} function printerAutoShutDownTimeSetterInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback; P5: Boolean): Integer; cdecl;
    {class} function printerAutoShutDownTimeGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): TJavaArray<Byte>; cdecl;
    {class} function printerLanguageSetterInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback; P5: Boolean): Integer; cdecl;
    {class} function printerLanguageGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): TJavaArray<Byte>; cdecl;
    {class} function printerResetSetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: Boolean): Integer; cdecl;
    {class} function printerSetterWifiNameAndWifiPasswordSend(P1: JOutputStream; P2: JInputStream; P3: JString; P4: JString; P5: JCallback; P6: Boolean): Integer; cdecl;
    {class} function printerSoftWareVersionGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): TJavaArray<Byte>; cdecl;
    {class} function printerElectricityGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): TJavaArray<Byte>; cdecl;
    {class} function printerSnGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): TJavaArray<Byte>; cdecl;
    {class} function printerHardWareVersionGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): TJavaArray<Byte>; cdecl;
    {class} function printerTypeGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): TJavaArray<Byte>; cdecl;
    {class} function getPrinterQueryIsFree(P1: JOutputStream; P2: JInputStream): Boolean; cdecl;
    {class} function printerRFIDInfoGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: Boolean): TJavaArray<Byte>; cdecl;
    {class} function printerRFID2InfoGetterInstructionSend(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: Boolean): TJavaArray<Byte>; cdecl;
    {class} function getPrinterRfidSuccessTimes(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: Boolean): TJavaArray<Byte>; cdecl;
    {class} function printerPrintingHistorySend(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: Boolean): TJavaArray<Byte>; cdecl;
    {class} function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): TJavaArray<Byte>; cdecl;
    {class} function getPrinterPrintMode(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: Integer; P5: JCallback; P6: Boolean): TJavaArray<Byte>; cdecl;
    {class} function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: Boolean): TJavaArray<Byte>; cdecl;
    {class} function cancelPrintInstructionSend(P1: JOutputStream; P2: JInputStream): Integer; cdecl;
    {class} function cancelPrintInstructionSendAndExceptionProcessing(P1: JOutputStream; P2: JInputStream): Integer; cdecl;
    {class} function printStartInstructionSend(P1: JOutputStream; P2: JInputStream): Integer; cdecl;
    {class} function printStartInstructionSendV3(P1: JOutputStream; P2: JInputStream; P3: Integer): Integer; cdecl;
    {class} function printPageStartInstructionSend(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Integer; cdecl; overload;
    {class} function printPageStartInstructionSend(P1: JOutputStream; P2: JInputStream; P3: Integer; P4: JPrintCallback): Integer; cdecl; overload;
    {class} function printPageStartInstructionSendDivideError(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Integer; cdecl;
    {class} function printPageNumberInstructionSend(P1: Integer; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JPrintCallback): Integer; cdecl;
    {class} function printPageHeightInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
    {class} function sendPageSize(P1: Integer; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JPrintCallback): Integer; cdecl; overload;
    {class} function sendPageSize(P1: Integer; P2: Integer; P3: Integer; P4: JOutputStream; P5: JInputStream; P6: JPrintCallback): Integer; cdecl; overload;
    {class} function sendPauseOrResume(P1: Boolean; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
    {class} function sendPageSize(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: JOutputStream; P6: JInputStream; P7: JPrintCallback): Integer; cdecl; overload;
    {class} function sendCompressMode(P1: Integer; P2: JString; P3: Integer; P4: JOutputStream; P5: JInputStream; P6: JPrintCallback): Integer; cdecl;
    {class} function printMarginTopInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
    {class} function printTimesInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
    {class} function printPageEndInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
    {class} function printEndInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
    {class} function printEndInstructionSendWaitPageNumber(P1: JOutputStream; P2: JInputStream): TJavaArray<Byte>; cdecl;
    {class} function printCancelInstructionSendWaitPageNumber(P1: JOutputStream; P2: JInputStream): TJavaArray<Byte>; cdecl;
    {class} function repeatRequestAndTimeoutProcessing(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
    {class} function readData(P1: JInputStream; P2: TJavaArray<Byte>): Integer; cdecl;
    {class} procedure writeData(P1: JOutputStream; P2: TJavaArray<Byte>); cdecl;
    {class} function repeatRequestAndTimeoutProcessingForHeart(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function printPageWidthInstructionSend(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
    {class} function sendCommand(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>): Integer; cdecl;
    {class} function repeatRequestAndTimeoutWithRefuseProcessingForConnect(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: JCallback; P9: Boolean): Integer; cdecl;
    {class} function repeatRequestAndTimeoutOrOtherProcessing(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Integer; P7: JCallback; P8: Boolean): TJavaArray<Byte>; cdecl; overload;
    {class} function repeatRequestAndTimeoutWithRefuseProcessing(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: JCallback; P8: Boolean): Integer; cdecl;
    {class} function printRepeatRequestAndTimeoutWithRefuseProcessing(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: JCallback; P8: Boolean): Integer; cdecl;
    {class} function repeatRequestAndTimeoutWithRefuseProcessingToWifi(P1: JOutputStream; P2: JInputStream; P3: Boolean; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: JCallback; P8: Boolean): Boolean; cdecl;
    {class} function repeatRequestAndTimeoutProcessing(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: JCallback; P8: Boolean): Integer; cdecl; overload;
    {class} function repeatRequestAndTimeoutProcessing(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>): Integer; cdecl; overload;
    {class} function sendRequest(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: TJavaArray<Byte>): TJavaObjectArray<JNiimbotSppPacket>; cdecl;
    {class} function waitResponse(P1: JInputStream): Boolean; cdecl;
    {class} function repeatRequestAndCheck(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function repeatRequest(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function repeatRequestAndTimeoutOrOtherProcessing(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: JCallback; P7: Boolean): TJavaArray<Byte>; cdecl; overload;
    {class} function repeatRequestAndTimeoutProcessingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: Boolean): TJavaArray<Byte>; cdecl;
    {class} procedure clearStream(P1: JInputStream; P2: TJavaArray<Byte>); cdecl;
    {class} function sendWriteRFID(P1: TJavaArray<Byte>; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
    {class} function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
    {class} function setLabelMaterial(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback; P5: Boolean): Integer; cdecl;
    {class} function printWaitPageNumber(P1: JOutputStream; P2: JInputStream): TJavaArray<Byte>; cdecl;
    {class} function requestPagerNumber(P1: JOutputStream; P2: JInputStream; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
//    {class} function init: JDataSend; cdecl; overload;

    { static Property }
    {class} property sCancelJob: Boolean read _GetsCancelJob;
    {class} property sRepeatRequestCounts: Integer read _GetsRepeatRequestCounts;
    {class} property sendDataLock: JObject read _GetsendDataLock;
    {class} property progressCallback: JDataSend_OnProgressCallback read _GetprogressCallback;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/data/DataSend')]
  JDataSend = interface(JObject)
  ['{FBD0B50E-1D79-46AC-BDF7-BF8471243E2B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataSend = class(TJavaGenericImport<JDataSendClass, JDataSend>) end;

  JNiimbotSppPacketClass = interface(JAbstractPacketClass) // or JObjectClass
  ['{D1B79CD5-5D62-440B-AACA-4804020BF5EB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JNiimbotSppPacket; cdecl; overload;
    {class} function init(P1: Byte; P2: TJavaArray<Byte>): JNiimbotSppPacket; cdecl; overload;
    {class} function readFromInputStream(P1: JInputStream): TJavaObjectArray<JNiimbotSppPacket>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/data/NiimbotSppPacket')]
  JNiimbotSppPacket = interface(JAbstractPacket) // or JObject
  ['{EFE7633E-501D-42E6-B153-39E9421A16C8}']
    { Property Methods }
    function _GetisInit: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisInit(aisInit: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetframeHead: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetframeHead(aframeHead: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcmdWord: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcmdWord(acmdWord: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdataLength: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdataLength(adataLength: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getdata: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setdata(adata: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getcheck: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcheck(acheck: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetframeTail: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetframeTail(aframeTail: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetresponseCmd: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetresponseCmd(aresponseCmd: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getbytes: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setbytes(abytes: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function toBytes: TJavaArray<Byte>; cdecl;
    function write: TJavaArray<Byte>; cdecl; overload;
    function read(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;
    function read(P1: TJavaArray<Byte>): Integer; cdecl; overload;
    function hashCode: Integer; cdecl;
    function hasResponse: Boolean; cdecl;
    function isResponse(P1: JAbstractPacket): Boolean; cdecl;
    procedure fromBytes(P1: TJavaArray<Byte>); cdecl;
    function getCommandWord: Byte; cdecl;
    function toString: JString; cdecl;
    procedure write(P1: JOutputStream); cdecl; overload;
    function read(P1: JInputStream): Integer; cdecl; overload;
    procedure setData(P1: TJavaArray<Byte>); cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
    property isInit: Boolean read _GetisInit write _SetisInit;
    property frameHead: TJavaArray<Byte> read _GetframeHead write _SetframeHead;
    property cmdWord: TJavaArray<Byte> read _GetcmdWord write _SetcmdWord;
    property dataLength: TJavaArray<Byte> read _GetdataLength write _SetdataLength;
    property data: TJavaArray<Byte> read _Getdata write _Setdata;
    property check: TJavaArray<Byte> read _Getcheck write _Setcheck;
    property frameTail: TJavaArray<Byte> read _GetframeTail write _SetframeTail;
    property responseCmd: TJavaArray<Byte> read _GetresponseCmd write _SetresponseCmd;
    property bytes: TJavaArray<Byte> read _Getbytes write _Setbytes;
  end;

  TJNiimbotSppPacket = class(TJavaGenericImport<JNiimbotSppPacketClass, JNiimbotSppPacket>) end;

//  Jj1Class = interface(Jb_334Class) // or JObjectClass
//  ['{27193381-3B52-4AB3-B296-7969A609C9D2}']
//    { static Property Methods }
//    {class} function _GetA: Jj1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jj1; cdecl;
//    {class} function m: Jj1; cdecl;
//
//    { static Property }
//    {class} property A: Jj1 read _GetA;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/j1')]
//  Jj1 = interface(Jb_334) // or JObject
//  ['{DF99A495-7CA9-4056-AB79-0942075274FA}']
//    { Property Methods }
//    function _Getq: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: JBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: JBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JInputStream; P2: Integer; P3: Integer); cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JBitmap; P7: Boolean): TJavaArray<Byte>; cdecl; overload;
//    function b(P1: Integer): Integer; cdecl; overload;
//    procedure o; cdecl;
//    function b(P1: JInputStream; P2: Integer; P3: Integer): Integer; cdecl; overload;
//    function a(P1: JInputStream): Integer; cdecl; overload;
//    procedure p; cdecl;
//    function endJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    procedure startJob(P1: Double; P2: Double; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double); cdecl;
//    procedure startPage(P1: JCanvas; P2: Integer); cdecl;
//    procedure endPage(P1: Integer); cdecl;
//    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
//    procedure commitJob(P1: Boolean; P2: Integer; P3: Integer; P4: JString; P5: JOutputStream; P6: JInputStream; P7: JPrintCallback); cdecl;
//    function c: Single; cdecl; overload;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JString); cdecl; overload;
//    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JTypeface); cdecl; overload;
//    procedure drawBarCode(P1: JCanvas; P2: JString; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl;
//    procedure drawQrCode(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl;
//    procedure drawBitmap(P1: JCanvas; P2: JBitmap; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl;
//    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl; overload;
//    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer); cdecl; overload;
//    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
//    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
//    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer; P9: Integer); cdecl; overload;
//    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl; overload;
//    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl; overload;
//    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer); cdecl; overload;
//    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
//    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
//    function b(P1: JInputStream): Integer; cdecl; overload;
//    function a(P1: TJavaArray<Byte>): Integer; cdecl; overload;
//    function getPreview: JBitmap; cdecl;
//    function b: Integer; cdecl; overload;
//    function a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl; overload;
//    procedure n; cdecl;
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    function c(P1: JInputStream): Integer; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer; P4: Integer): Integer; cdecl; overload;
//    function a(P1: JOutputStream; P2: JInputStream): Boolean; cdecl; overload;
//    function l: Boolean; cdecl;
//    procedure g; cdecl;
//    procedure j; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//
//    { Property }
//    property q: Integer read _Getq write _Setq;
//    property r: JBitmap read _Getr write _Setr;
//    property s: Integer read _Gets write _Sets;
//    property t: Integer read _Gett write _Sett;
//    property u: Integer read _Getu write _Setu;
//    property v: Integer read _Getv write _Setv;
//    property w: Integer read _Getw write _Setw;
//    property x: Integer read _Getx write _Setx;
//    property y: JList read _Gety write _Sety;
//    property z: JObject read _Getz write _Setz;
//  end;
//
//  TJj1 = class(TJavaGenericImport<Jj1Class, Jj1>) end;

//  Je1Class = interface(Jj1Class) // or JObjectClass
//  ['{ADF80C8C-A634-44F1-8D9D-93245C7D692C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je1; cdecl;
//    {class} function m: Jj1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/e1')]
//  Je1 = interface(Jj1) // or JObject
//  ['{6909F9BC-E903-457B-8E49-7B36B7E91B0F}']
//    { Property Methods }
//
//    { methods }
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function c(P1: JInputStream): Integer; cdecl;
//    procedure g; cdecl;
//    function b(P1: JInputStream): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJe1 = class(TJavaGenericImport<Je1Class, Je1>) end;

//  Je2Class = interface(JObjectClass)
//  ['{897305A0-F09D-418A-9172-E3B3F95DBE5D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: JObject; P3: Integer): Je2; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/e2')]
//  Je2 = interface(JObject)
//  ['{11FB4D82-31EF-4389-BE57-E47D588F463F}']
//    { Property Methods }
//    function _Geta: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    function d: Boolean; cdecl;
//    function c: Integer; cdecl;
//    function b: Integer; cdecl;
//    function toString: JString; cdecl;
//    function hashCode: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//
//    { Property }
//    property a: JObject read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//    property f: TJavaArray<Byte> read _Getf write _Setf;
//  end;
//
//  TJe2 = class(TJavaGenericImport<Je2Class, Je2>) end;

//  Jf_283Class = interface(Jj1Class) // or JObjectClass
//  ['{CA5CD644-ED4F-4096-843B-DA19F959DF00}']
//    { static Property Methods }
//    {class} function _GetB: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jf_283; cdecl;
//    {class} function q: Jf; cdecl;
//
//    { static Property }
//    {class} property B: Jf read _GetB;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/f')]
//  Jf_283 = interface(Jj1) // or JObject
//  ['{20FF2960-B469-46C1-9DBF-D9AEDEAF2B60}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl; overload;
//    procedure a(P1: Jc_b); cdecl; overload;
//    function b(P1: Jc_b): Int64; cdecl;
//
//    { Property }
//  end;
//
//  TJf_283 = class(TJavaGenericImport<Jf_283Class, Jf_283>) end;

//  Jf0_aClass = interface(JThreadClass) // or JObjectClass
//  ['{D14784AC-F4A5-4A54-9A57-D15EB6CAAA21}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jf0; P2: JString; P3: JString; P4: JString; P5: TJavaArray<Byte>; P6: JString; P7: JOutputStream; P8: JInputStream; P9: JUpDateDeviceSoftWareCallback): Jf0_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/f0$a')]
//  Jf0_a = interface(JThread) // or JObject
//  ['{3C048572-F700-4689-A377-966C22DC2842}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JOutputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JOutputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JUpDateDeviceSoftWareCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JUpDateDeviceSoftWareCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Jf0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jf0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: TJavaArray<Byte> read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: JOutputStream read _Getd write _Setd;
//    property e: JInputStream read _Gete write _Sete;
//    property f: JString read _Getf write _Setf;
//    property g: JString read _Getg write _Setg;
//    property h: JUpDateDeviceSoftWareCallback read _Geth write _Seth;
//    property i: Jf0 read _Geti write _Seti;
//  end;
//
//  TJf0_a = class(TJavaGenericImport<Jf0_aClass, Jf0_a>) end;

//  Jk1Class = interface(JObjectClass)
//  ['{4AB55321-6E16-4E40-A9B5-FC5A6BE93C87}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jk1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/k1')]
//  Jk1 = interface(JObject)
//  ['{FCE1A14D-9272-4FC5-BB8B-F6FDFEFABFAF}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function getPrinterDensity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSpeed(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrintMode(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterLanguage(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getAutoShutDownTime(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSoftWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterElectricity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterHardWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function getPrinterRfidParameters(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JList; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterRfidSuccessTimes(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterNetworkState(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function isPrinterSupportrWriteRfid: Boolean; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback): JPrinterInfo; cdecl;
//    function isSupportSetMaterial: Boolean; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;
//
//  TJk1 = class(TJavaGenericImport<Jk1Class, Jk1>) end;

//  Jf1Class = interface(Jk1Class) // or JObjectClass
//  ['{741AB6FC-7DD9-41B4-81DD-C992A44D0567}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jf1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/f1')]
//  Jf1 = interface(Jk1) // or JObject
//  ['{75A6B421-4708-4C2C-B6D9-DB90E52EA080}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJf1 = class(TJavaGenericImport<Jf1Class, Jf1>) end;

//  Jf2Class = interface(JObjectClass)
//  ['{CEC46188-5858-4090-9224-84ABF9623E72}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jw1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jw1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JThreadLocal;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a(P1: JString; P2: JString; P3: JString); cdecl; overload;
//    {class} function a(P1: JString; P2: JString; P3: JString; P4: JString): JString; cdecl; overload;
//    {class} function init: Jf2; cdecl;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: Jw1 read _Getb;
//    {class} property c: Jw1 read _Getc;
//    {class} property d: JThreadLocal read _Getd;
//    {class} property e: Boolean read _Gete;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/f2')]
//  Jf2 = interface(JObject)
//  ['{804616B6-36D9-40CF-BF6A-165A4B1338B7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJf2 = class(TJavaGenericImport<Jf2Class, Jf2>) end;

//  Jg_288Class = interface(Jk1Class) // or JObjectClass
//  ['{66171FCB-98F0-4632-829C-19BD1CA9F524}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jg_288; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/g')]
//  Jg_288 = interface(Jk1) // or JObject
//  ['{9A5B0514-03D6-4494-9337-DC3BA6AD96DB}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterSoftWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterHardWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function isPrinterSupportrWriteRfid: Boolean; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJg_288 = class(TJavaGenericImport<Jg_288Class, Jg_288>) end;

//  Jg0Class = interface(Jc_258Class) // or JObjectClass
//  ['{CDE35F27-1AA6-4B36-AD91-83182EA93982}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jg0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/g0')]
//  Jg0 = interface(Jc_258) // or JObject
//  ['{3FFE8651-CF2F-4DA6-9782-8B4291ACE577}']
//    { Property Methods }
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//    property b: Integer read _Getb write _Setb;
//  end;
//
//  TJg0 = class(TJavaGenericImport<Jg0Class, Jg0>) end;

//  Jg1Class = interface(Jl1Class) // or JObjectClass
//  ['{364EA443-7B2C-4688-BCA9-12AF0C1F2B70}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/g1')]
//  Jg1 = interface(Jl1) // or JObject
//  ['{E6E7A641-DA20-4094-9136-758E90F10D95}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJg1 = class(TJavaGenericImport<Jg1Class, Jg1>) end;

//  Jg2Class = interface(JObjectClass)
//  ['{9B6826AA-25D9-4433-9305-1B5877067B55}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jw1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jw1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JThreadLocal;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure c(P1: JString; P2: JString; P3: JString); cdecl;
//    {class} procedure b(P1: JString; P2: JString; P3: JString); cdecl;
//    {class} procedure a(P1: JString; P2: JString; P3: JString); cdecl; overload;
//    {class} function a(P1: JString; P2: JString; P3: JString; P4: JString): JString; cdecl; overload;
//    {class} procedure a(P1: JString; P2: JString; P3: JException); cdecl; overload;
//    {class} function init: Jg2; cdecl;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: Jw1 read _Getb;
//    {class} property c: Jw1 read _Getc;
//    {class} property d: JThreadLocal read _Getd;
//    {class} property e: Boolean read _Gete;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/g2')]
//  Jg2 = interface(JObject)
//  ['{96E0B6E6-8AD6-4D27-A7B4-323F8C40F2F2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJg2 = class(TJavaGenericImport<Jg2Class, Jg2>) end;

//  Jh_a_292Class = interface(JThreadClass) // or JObjectClass
//  ['{6C2889A4-0A8F-4B84-BCFB-110DD678B812}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jh; P2: JString; P3: JString; P4: JString; P5: TJavaArray<Byte>; P6: JString; P7: JOutputStream; P8: JInputStream; P9: JUpDateDeviceSoftWareCallback): Jh_a_292; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/h$a')]
//  Jh_a_292 = interface(JThread) // or JObject
//  ['{B1AEF8FE-02F9-46E6-948A-029C488C7AA5}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JOutputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JOutputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JUpDateDeviceSoftWareCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JUpDateDeviceSoftWareCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jh);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: TJavaArray<Byte> read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JOutputStream read _Getf write _Setf;
//    property g: JInputStream read _Getg write _Setg;
//    property h: JUpDateDeviceSoftWareCallback read _Geth write _Seth;
//    property i: Jh read _Geti write _Seti;
//  end;
//
//  TJh_a_292 = class(TJavaGenericImport<Jh_a_292Class, Jh_a_292>) end;

//  Jh_293Class = interface(Jl1Class) // or JObjectClass
//  ['{9BB7CEFD-2474-4BDB-B4AC-C161C015010E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_293; cdecl;
//    {class} function a(P1: JInputStream): Boolean; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/h')]
//  Jh_293 = interface(Jl1) // or JObject
//  ['{A269F041-3523-41CB-8B70-C096DBBE45AC}']
//    { Property Methods }
//
//    { methods }
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    procedure setUpdateFirmwareRequest(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    procedure a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    function b(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl;
//    procedure a(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: JString; P3: JOutputStream; P4: JInputStream): Boolean; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJh_293 = class(TJavaGenericImport<Jh_293Class, Jh_293>) end;

//  Jh0Class = interface(Jd_338Class) // or JObjectClass
//  ['{95786343-3EB8-48EB-9BFC-1C27A1BEF7E9}']
//    { static Property Methods }
//    {class} function _Getu: Jh0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jh0; cdecl; overload;
//    {class} function m: Jh0; cdecl;
//    {class} function init: Jh0; cdecl; overload;
//
//    { static Property }
//    {class} property u: Jh0 read _Getu;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/h0')]
//  Jh0 = interface(Jd_338) // or JObject
//  ['{B17C8D35-44E8-4E9A-BAC0-57D607A0F80E}']
//    { Property Methods }
//    function _Gets: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure g; cdecl;
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function l: Boolean; cdecl;
//    function b: Integer; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Jc; cdecl; overload;
//    function b(P1: Integer): Double; cdecl; overload;
//    function c: Single; cdecl;
//    procedure n; cdecl;
//    procedure a(P1: TJavaArray<Byte>); cdecl; overload;
//
//    { Property }
//    property s: Boolean read _Gets write _Sets;
//    property t: Boolean read _Gett write _Sett;
//  end;
//
//  TJh0 = class(TJavaGenericImport<Jh0Class, Jh0>) end;

//  Jh2Class = interface(Jc_258Class) // or JObjectClass
//  ['{C7C63E30-B375-4BBF-915A-45ECDEBB0F52}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jh2; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/h2')]
//  Jh2 = interface(Jc_258) // or JObject
//  ['{91E61538-CCCE-4AC5-A544-128650AB3394}']
//    { Property Methods }
//    function _Getb: JzpBluetoothPrinter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JzpBluetoothPrinter);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JPrintTask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JPrintTask);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl; overload;
//    function a(P1: JString): Boolean; cdecl; overload;
//    function g: Integer; cdecl;
//    function f: JPrinterInterface; cdecl;
//    procedure e; cdecl;
//    procedure h; cdecl;
//
//    { Property }
//    property b: JzpBluetoothPrinter read _Getb write _Setb;
//    property c: JPrintTask read _Getc write _Setc;
//    property d: JContext read _Getd write _Setd;
//  end;
//
//  TJh2 = class(TJavaGenericImport<Jh2Class, Jh2>) end;

//  Ji_297Class = interface(Jh1Class) // or JObjectClass
//  ['{A709FAA3-FA83-4F48-822C-A5DFC062FC59}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Ji_297; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/i')]
//  Ji_297 = interface(Jh1) // or JObject
//  ['{EA2A899F-CA1C-40D1-BBA6-1D6FD792E523}']
//    { Property Methods }
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//  end;
//
//  TJi_297 = class(TJavaGenericImport<Ji_297Class, Ji_297>) end;

//  Ji0_aClass = interface(JObjectClass)
//  ['{EDF048D5-AA02-47AB-B5A0-3063F0A703CB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: TJavaArray<Byte>): Ji0_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/i0$a')]
//  Ji0_a = interface(JObject)
//  ['{96870869-3980-4B02-9DCF-0FAD96B665C2}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//  end;
//
//  TJi0_a = class(TJavaGenericImport<Ji0_aClass, Ji0_a>) end;

//  Ji1Class = interface(Je_279Class) // or JObjectClass
//  ['{4642BD70-56AA-49D7-87FE-DA080296EBD7}']
//    { static Property Methods }
//    {class} function _Getv: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Ji1; cdecl;
//    {class} function p: Ji1; cdecl;
//
//    { static Property }
//    {class} property v: Ji1 read _Getv;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/i1')]
//  Ji1 = interface(Je_279) // or JObject
//  ['{8DDD4C04-AE0B-4024-BFCE-053914379DA2}']
//    { Property Methods }
//
//    { methods }
//    function endJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl;
//    procedure n; cdecl;
//
//    { Property }
//  end;
//
//  TJi1 = class(TJavaGenericImport<Ji1Class, Ji1>) end;

//  Ji2_aClass = interface(JObjectClass)
//  ['{751AD96C-E471-42DB-A9EB-9433F6094D3F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ji2; P2: Je2): Ji2_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/i2$a')]
//  Ji2_a = interface(JObject)
//  ['{4A554286-3D16-4B6B-A371-691BB1F3443B}']
//    { Property Methods }
//    function _Geta: Je2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Ji2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Ji2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Je2 read _Geta write _Seta;
//    property b: Ji2 read _Getb write _Setb;
//  end;
//
//  TJi2_a = class(TJavaGenericImport<Ji2_aClass, Ji2_a>) end;

//  Jf_342Class = interface(JObjectClass)
//  ['{E0FB2CD5-2AC4-4E1C-A72F-662DD335ADB9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf_342; cdecl;
//    {class} procedure d; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/f')]
//  Jf_342 = interface(JObject)
//  ['{E89FE24A-6D1A-4A97-ADEF-62FB69A9060D}']
//    { Property Methods }
//    function _Geta: JPrintCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JPrintCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    function a(P1: JString): Integer; cdecl; overload;
//    function c: Integer; cdecl;
//    procedure startJob(P1: Double; P2: Double; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double); cdecl; overload;
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    procedure e; cdecl;
//    procedure resume(P1: JInputStream; P2: JOutputStream); cdecl;
//    procedure startJob(P1: JPrintCallback); cdecl; overload;
//    function b: Boolean; cdecl; overload;
//    function b(P1: JString; P2: JString): Boolean; cdecl; overload;
//    procedure startPage(P1: JCanvas; P2: Integer); cdecl;
//    procedure endPage(P1: Integer); cdecl;
//    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
//    procedure commitJob(P1: Boolean; P2: Integer; P3: Integer; P4: JString; P5: JOutputStream; P6: JInputStream; P7: JPrintCallback); cdecl;
//    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JString); cdecl; overload;
//    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JTypeface); cdecl; overload;
//    procedure drawBarCode(P1: JCanvas; P2: JString; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl;
//    procedure drawQrCode(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl;
//    procedure drawBitmap(P1: JCanvas; P2: JBitmap; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl;
//    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl; overload;
//    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer); cdecl; overload;
//    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
//    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
//    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer; P9: Integer); cdecl; overload;
//    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl; overload;
//    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl; overload;
//    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer); cdecl; overload;
//    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
//    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
//    function mm2Pix(P1: Double): Integer; cdecl;
//    function getPreview: JBitmap; cdecl;
//    procedure b(P1: Integer); cdecl; overload;
//    function generatePageData(P1: JString; P2: JString; P3: Integer): JObject; cdecl;
//    procedure a(P1: JJSONObject; P2: Integer; P3: Integer); cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): TJavaArray<Integer>; cdecl; overload;
//    function a(P1: JString; P2: JString): JJSONObject; cdecl; overload;
//
//    { Property }
//    property a: JPrintCallback read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//    property c: JHandler read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//    property f: JObject read _Getf write _Setf;
//    property g: Integer read _Getg write _Setg;
//  end;
//
//  TJf_342 = class(TJavaGenericImport<Jf_342Class, Jf_342>) end;

//  Ji2Class = interface(Jf_342Class) // or JObjectClass
//  ['{29B502E5-EE1A-43C3-82C9-0E9E1D0F03DD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JzpBluetoothPrinter; P2: JContext): Ji2; cdecl;
//    {class} function a(P1: Ji2): JPrintCallback; cdecl; overload;
//    {class} function b(P1: Ji2): Boolean; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/i2')]
//  Ji2 = interface(Jf_342) // or JObject
//  ['{CF7C7620-84B3-4F09-A758-D9B2CEB407E4}']
//    { Property Methods }
//    function _Geth: JzpBluetoothPrinter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JzpBluetoothPrinter);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Je2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Je2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function c: Integer; cdecl; overload;
//    procedure startJob(P1: JPrintCallback; P2: JInputStream; P3: JOutputStream); cdecl;
//    procedure commitJob(P1: JString; P2: JString; P3: JString; P4: JOutputStream; P5: JInputStream); cdecl;
//    function endJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function mm2Pix(P1: Double): Integer; cdecl;
//    function getPreview: JBitmap; cdecl;
//    function generatePageData(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer): JObject; cdecl; overload;
//    function generatePageData(P1: Integer; P2: JBitmap; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer): JObject; cdecl; overload;
//    procedure commitData(P1: Je2; P2: JString; P3: JString); cdecl;
//    function getPageIndex: Integer; cdecl;
//    function getPagePrintTask: Je2; cdecl;
//    function d(P1: Integer): Integer; cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function f: Integer; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): TJavaArray<Integer>; cdecl; overload;
//    function c(P1: Integer): Double; cdecl; overload;
//    procedure g; cdecl;
//
//    { Property }
//    property h: JzpBluetoothPrinter read _Geth write _Seth;
//    property i: Je2 read _Geti write _Seti;
//  end;
//
//  TJi2 = class(TJavaGenericImport<Ji2Class, Ji2>) end;

//  Jj_304Class = interface(Je_279Class) // or JObjectClass
//  ['{3A40E129-0131-484D-ACC6-D24FFBC979D7}']
//    { static Property Methods }
//    {class} function _Getv: Jj;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jj_304; cdecl;
//    {class} function p: Jj; cdecl;
//
//    { static Property }
//    {class} property v: Jj read _Getv;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/j')]
//  Jj_304 = interface(Je_279) // or JObject
//  ['{9D6F917D-8415-42CB-A8B0-A008E7FBC89A}']
//    { Property Methods }
//
//    { methods }
//    function l: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJj_304 = class(TJavaGenericImport<Jj_304Class, Jj_304>) end;

//  Jj0Class = interface(JObjectClass)
//  ['{1F652CD5-4C3D-497A-94C4-1AFB205723B8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/j0')]
//  Jj0 = interface(JObject)
//  ['{14564503-170B-4B41-B847-A7B4CE0D6E56}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterDensity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSpeed(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrintMode(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterLanguage(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getAutoShutDownTime(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSoftWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterElectricity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterHardWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function getPrinterRfidParameters(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JList; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterRfidSuccessTimes(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterNetworkState(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function isPrinterSupportrWriteRfid: Boolean; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback): JPrinterInfo; cdecl;
//    function isSupportSetMaterial: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJj0 = class(TJavaGenericImport<Jj0Class, Jj0>) end;

  Jx1Class = interface(JObjectClass)
  ['{03474E95-C20B-4F14-8649-FA13C74B2030}']
    { static Property Methods }
    {class} function _GetexecutorService: JExecutorService;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getInstance(P1: JCallback): Jx1; cdecl;
    {class} function init(P1: JCallback): Jx1; cdecl; overload;
    {class} procedure setLog(P1: Boolean); cdecl;
//    {class} function generatePrintPreviewImage(P1: JString; P2: Single; P3: Single; P4: Integer): JImageParam; cdecl;

    { static Property }
    {class} property executorService: JExecutorService read _GetexecutorService;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/x1')]
  Jx1 = interface(JObject)
  ['{CC7C5A8C-0C2D-4F5F-8C8B-405B524D4AD8}']
    { Property Methods }
    function _GetjcPrinter: JJCPrinter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetjcPrinter(ajcPrinter: JJCPrinter);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function init(P1: JApplication): Boolean; cdecl; overload;
    function initImageProcessingDefault(P1: JString; P2: JString): Integer; cdecl;
    procedure setCallBack(P1: JCallback); cdecl;
    function openPrinterByAddress(P1: JString): Integer; cdecl;
    procedure close; cdecl;
    function isConnection: Integer; cdecl;
    function setPrinterDensity(P1: Integer): Integer; cdecl;
    function getMultiple: Single; cdecl;
    function getPrinterType: Integer; cdecl;
    function getPrinterDensity: Integer; cdecl;
    function setPrinterSpeed(P1: Integer): Integer; cdecl;
    function getPrinterSpeed: Integer; cdecl;
    function setLabelType(P1: Integer): Integer; cdecl;
    function setPositioningCalibration(P1: Integer): Integer; cdecl;
    function getLabelType: Integer; cdecl;
    function getPrinterMode: Integer; cdecl;
    function setPrintLanguage(P1: Integer): Integer; cdecl;
    function setLabelMaterial(P1: Integer): Integer; cdecl;
    function getPrinterLanguage: Integer; cdecl;
    function setPrinterAutoShutdownTime(P1: Integer): Integer; cdecl;
    function getAutoShutDownTime: Integer; cdecl;
    function setPrinterReset: Integer; cdecl;
    function getPrinterElectricity: Integer; cdecl;
    function getPrinterSoftWareVersion: JString; cdecl;
    function getPrinterSn: JString; cdecl;
    function getPrinterBluetoothAddress: JString; cdecl;
    function getPrinterHardWareVersion: JString; cdecl;
    function isSupportRFID: Boolean; cdecl;
    function getPrinterRfidParameter: JHashMap; cdecl;
    function getPrinterRfidSuccessTimes: JHashMap; cdecl;
    procedure startJob(P1: Integer; P2: Integer; P3: Integer; P4: JPrintCallback); cdecl;
    function cancelJob: Boolean; cdecl;
    function endJob: Boolean; cdecl;
    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
    procedure commitData(P1: JList; P2: JList); cdecl;
    function checkBarcodeContent(P1: JString; P2: Integer): Integer; cdecl;
    function checkQrcodeContent(P1: JString; P2: Integer): Integer; cdecl;

    { Property }
    property jcPrinter: JJCPrinter read _GetjcPrinter write _SetjcPrinter;
  end;

  TJx1 = class(TJavaGenericImport<Jx1Class, Jx1>) end;

  JJCPrintApiClass = interface(Jx1Class) // or JObjectClass
  ['{BDDAC77A-55CF-4CD3-821F-1D0E14857334}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance(P1: JCallback): JJCPrintApi; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/JCPrintApi')]
  JJCPrintApi = interface(Jx1) // or JObject
  ['{542B22FA-8515-46CA-9672-FCA0B0941192}']
    { Property Methods }

    { methods }
    procedure startPrintJob(P1: Integer; P2: Integer; P3: Integer; P4: JPrintCallback); cdecl;
    function cancelJob: Boolean; cdecl;
    procedure drawEmptyLabel(P1: Single; P2: Single; P3: Integer; P4: JString); cdecl;
    procedure drawLabelText(P1: Single; P2: Single; P3: Single; P4: Single; P5: JString; P6: JString; P7: Single; P8: Integer; P9: Integer; P10: Integer; P11: Integer; P12: Single; P13: Single; P14: TJavaArray<Boolean>); cdecl;
    procedure drawLabelBarCode(P1: Single; P2: Single; P3: Single; P4: Single; P5: Integer; P6: JString; P7: Single; P8: Integer; P9: Integer; P10: Integer); cdecl;
    procedure drawLabelQrCode(P1: Single; P2: Single; P3: Single; P4: Single; P5: JString; P6: Integer; P7: Integer); cdecl;
    procedure drawLabelGraph(P1: Single; P2: Single; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: Single; P8: Single; P9: Integer; P10: TJavaArray<Single>); cdecl;
    procedure drawLabelImage(P1: JString; P2: Single; P3: Single; P4: Single; P5: Single; P6: Integer; P7: Integer; P8: Single); cdecl;
    procedure drawLabelLine(P1: Single; P2: Single; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: TJavaArray<Single>); cdecl;
    function generateLabelJson: TJavaArray<Byte>; cdecl;
    procedure commitImageData(P1: Integer; P2: JBitmap; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: JString); cdecl;

    { Property }
  end;

  TJJCPrintApi = class(TJavaGenericImport<JJCPrintApiClass, JJCPrintApi>) end;

//  Jk_308Class = interface(Jg_288Class) // or JObjectClass
//  ['{48B46116-312A-4B8C-A505-48595190B6BF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jk_308; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/k')]
//  Jk_308 = interface(Jg_288) // or JObject
//  ['{13EF2E3F-882A-4B0D-9BC5-A2815336587B}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterRfidParameters(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JList; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrintMode(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJk_308 = class(TJavaGenericImport<Jk_308Class, Jk_308>) end;

//  Jk0_aClass = interface(JThreadClass) // or JObjectClass
//  ['{10AB102C-95FA-4AEF-8967-F672A0A62A9C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk0; P2: JString; P3: TJavaArray<Byte>; P4: JString; P5: JOutputStream; P6: JInputStream; P7: JUpDateDeviceSoftWareCallback): Jk0_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/k0$a')]
//  Jk0_a = interface(JThread) // or JObject
//  ['{E12CAA7A-94C4-4192-A3F1-529DDC233544}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JOutputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JOutputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JUpDateDeviceSoftWareCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JUpDateDeviceSoftWareCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Jk0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jk0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: TJavaArray<Byte> read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: JOutputStream read _Getd write _Setd;
//    property e: JInputStream read _Gete write _Sete;
//    property f: JUpDateDeviceSoftWareCallback read _Getf write _Setf;
//    property g: Jk0 read _Getg write _Setg;
//  end;
//
//  TJk0_a = class(TJavaGenericImport<Jk0_aClass, Jk0_a>) end;

//  Jk0Class = interface(JObjectClass)
//  ['{79E6656A-D94F-4956-99BB-30F0A7F535B0}']
//    { static Property Methods }
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jk0; cdecl; overload;
//    {class} procedure a(P1: Jk0; P2: JString; P3: TJavaArray<Byte>; P4: JString; P5: JOutputStream; P6: JInputStream; P7: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    {class} function init: Jk0; cdecl; overload;
//
//    { static Property }
//    {class} property b: Boolean read _Getb;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/k0')]
//  Jk0 = interface(JObject)
//  ['{12E2C02B-4549-4031-B6E9-942F52CA3346}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPrinterSpeed(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterAutoShutDownTime(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterReset(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterLanguage(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setBluetoothDistributionNetwork(P1: JString; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    procedure setUpdateFirmwareRequest(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure cancelUpdateFirmwareRequest; cdecl;
//    procedure setMainControlPanelUpgrade(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure cancelMainControlPanelUpgrade; cdecl;
//    function setLabelMaterial(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    procedure a(P1: JString; P2: TJavaArray<Byte>; P3: JString; P4: JOutputStream; P5: JInputStream; P6: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    procedure a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    procedure a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl; overload;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;
//
//  TJk0 = class(TJavaGenericImport<Jk0Class, Jk0>) end;

//  Jl_312Class = interface(Jh_293Class) // or JObjectClass
//  ['{41E0063D-D855-4220-A291-0B97BACC36EA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl_312; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/l')]
//  Jl_312 = interface(Jh_293) // or JObject
//  ['{F71EA6BC-6F6B-491B-AC8A-D8DE56E3CA12}']
//    { Property Methods }
//
//    { methods }
//    function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJl_312 = class(TJavaGenericImport<Jl_312Class, Jl_312>) end;

//  Jl0Class = interface(Jc_258Class) // or JObjectClass
//  ['{C8AB247B-2FAD-4DA8-BF30-866940161EC9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jl0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/l0')]
//  Jl0 = interface(Jc_258) // or JObject
//  ['{C28C7335-5DED-477B-8D54-84AE8F502D20}']
//    { Property Methods }
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//    property b: Integer read _Getb write _Setb;
//  end;
//
//  TJl0 = class(TJavaGenericImport<Jl0Class, Jl0>) end;

//  Jl1_aClass = interface(JThreadClass) // or JObjectClass
//  ['{B6952B0B-4C6E-4077-8724-016A6411DF3C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jl1; P2: JString; P3: JString; P4: JString; P5: TJavaArray<Byte>; P6: JString; P7: JOutputStream; P8: JInputStream; P9: JUpDateDeviceSoftWareCallback): Jl1_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/l1$a')]
//  Jl1_a = interface(JThread) // or JObject
//  ['{57F36969-4560-48DF-96E8-3B40E13A0E62}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JOutputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JOutputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JUpDateDeviceSoftWareCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JUpDateDeviceSoftWareCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: TJavaArray<Byte> read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JOutputStream read _Getf write _Setf;
//    property g: JInputStream read _Getg write _Setg;
//    property h: JUpDateDeviceSoftWareCallback read _Geth write _Seth;
//    property i: Jl1 read _Geti write _Seti;
//  end;
//
//  TJl1_a = class(TJavaGenericImport<Jl1_aClass, Jl1_a>) end;

//  Jm_316Class = interface(Ja_233Class) // or JObjectClass
//  ['{4E6CEA3C-EA92-4CA5-BA45-55577B10F30A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jm_316; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/m')]
//  Jm_316 = interface(Ja_233) // or JObject
//  ['{AFE3A3EC-EEE2-49DB-A44A-F82D50C7AA0A}']
//    { Property Methods }
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//  end;
//
//  TJm_316 = class(TJavaGenericImport<Jm_316Class, Jm_316>) end;

//  Jm0Class = interface(Jd_338Class) // or JObjectClass
//  ['{3C62006E-74E8-41DA-86C8-4F33DFBAC03C}']
//    { static Property Methods }
//    {class} function _Gets: Jm0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jm0; cdecl; overload;
//    {class} function m: Jm0; cdecl;
//    {class} function init: Jm0; cdecl; overload;
//
//    { static Property }
//    {class} property s: Jm0 read _Gets;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/m0')]
//  Jm0 = interface(Jd_338) // or JObject
//  ['{8FC42399-5FA2-4000-92A0-4F65458EEC97}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl;
//    function c: Single; cdecl;
//    function b: Integer; cdecl; overload;
//    function b(P1: Integer): Double; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJm0 = class(TJavaGenericImport<Jm0Class, Jm0>) end;

//  Jm1Class = interface(Je_340Class) // or JObjectClass
//  ['{A2A372C8-F8CF-415B-BF3D-A99432174E67}']
//    { static Property Methods }
//    {class} function _GetE: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jm1; cdecl;
//    {class} function n: Jm1; cdecl;
//
//    { static Property }
//    {class} property E: Jm1 read _GetE;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/m1')]
//  Jm1 = interface(Je_340) // or JObject
//  ['{639F37A2-ED2A-4ABA-9064-5CE69AED74BE}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl;
//    function c: Single; cdecl;
//
//    { Property }
//  end;
//
//  TJm1 = class(TJavaGenericImport<Jm1Class, Jm1>) end;

//  Jw_406Class = interface(Je_340Class) // or JObjectClass
//  ['{4DC76279-5D5B-4847-B212-A2ED3ECBD9FA}']
//    { static Property Methods }
//    {class} function _GetE: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jw_406; cdecl;
//    {class} function n: Jw; cdecl;
//
//    { static Property }
//    {class} property E: Jw read _GetE;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/w')]
//  Jw_406 = interface(Je_340) // or JObject
//  ['{7B187423-4A11-4C96-BAFA-0BAD7EF0039B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//    function b(P1: Integer): Double; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function c: Single; cdecl; overload;
//    procedure k; cdecl;
//    procedure a(P1: Je2); cdecl; overload;
//    procedure b(P1: Je2); cdecl; overload;
//    procedure c(P1: Je2); cdecl; overload;
//    procedure b(P1: Jc); cdecl; overload;
//    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
//    procedure resume(P1: JInputStream; P2: JOutputStream); cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Jc; cdecl; overload;
//    function a(P1: Integer; P2: Jc_a): Integer; cdecl; overload;
//    function a(P1: Boolean): Boolean; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJw_406 = class(TJavaGenericImport<Jw_406Class, Jw_406>) end;

//  Jn_319Class = interface(Jw_406Class) // or JObjectClass
//  ['{ED1A9D01-4EA5-42CC-8003-F456832210E5}']
//    { static Property Methods }
//    {class} function _GetF: Jn;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jn_319; cdecl;
//    {class} function o: Jn; cdecl;
//
//    { static Property }
//    {class} property F: Jn read _GetF;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/n')]
//  Jn_319 = interface(Jw_406) // or JObject
//  ['{562E3A23-28D1-4B1E-9725-2215B345E7B8}']
//    { Property Methods }
//
//    { methods }
//    procedure b(P1: Jc); cdecl;
//    function a(P1: Integer; P2: Jc_a): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJn_319 = class(TJavaGenericImport<Jn_319Class, Jn_319>) end;

//  Jn0Class = interface(Jb_334Class) // or JObjectClass
//  ['{034D34D8-5F55-47BC-ABBF-CCFAAF0CE137}']
//    { static Property Methods }
//    {class} function _Getu: Jn0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jn0; cdecl; overload;
//    {class} function l: Jn0; cdecl;
//    {class} function init: Jn0; cdecl; overload;
//
//    { static Property }
//    {class} property u: Jn0 read _Getu;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/n0')]
//  Jn0 = interface(Jb_334) // or JObject
//  ['{27E8D9B5-A620-437F-BC21-B812D694BED0}']
//    { Property Methods }
//    function _Getq: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: JBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure startPage(P1: JCanvas; P2: Integer); cdecl;
//    procedure endPage(P1: Integer); cdecl;
//    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
//    procedure commitJob(P1: Boolean; P2: Integer; P3: Integer; P4: JString; P5: JOutputStream; P6: JInputStream; P7: JPrintCallback); cdecl;
//    function b(P1: Integer): Double; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl;
//    function c: Single; cdecl;
//    procedure j; cdecl;
//    function b: Integer; cdecl; overload;
//    function d: Boolean; cdecl;
//
//    { Property }
//    property q: Integer read _Getq write _Setq;
//    property r: Integer read _Getr write _Setr;
//    property s: JBitmap read _Gets write _Sets;
//    property t: JList read _Gett write _Sett;
//  end;
//
//  TJn0 = class(TJavaGenericImport<Jn0Class, Jn0>) end;

//  Jn1_aClass = interface(JObjectClass)
//  ['{5078C2D7-E164-4148-AFE9-1BA61F9AFBF5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jn1): Jn1_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/n1$a')]
//  Jn1_a = interface(JObject)
//  ['{C9CD8373-3300-41F6-A504-76B4AC998441}']
//    { Property Methods }
//    function _Geta: Jn1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jn1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onProgressInfo(P1: JIDzPrinter_ProgressInfo; P2: JObject); cdecl;
//    procedure onStateChange(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrinterState); cdecl;
//    procedure onPrintProgress(P1: JIDzPrinter_PrinterAddress; P2: JObject; P3: JIDzPrinter_PrintProgress; P4: JObject); cdecl;
//    procedure onPrinterDiscovery(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrinterInfo); cdecl;
//
//    { Property }
//    property a: Jn1 read _Geta write _Seta;
//  end;
//
//  TJn1_a = class(TJavaGenericImport<Jn1_aClass, Jn1_a>) end;

//  Jn1_bClass = interface(JObjectClass)
//  ['{2697E038-B6B2-4DA6-8DB4-7FA0666C9967}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jn1_b; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//    {class} property b: TJavaArray<Integer> read _Getb;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/n1$b')]
//  Jn1_b = interface(JObject)
//  ['{4CA6BD82-E1C9-441C-93E7-BA341E383402}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJn1_b = class(TJavaGenericImport<Jn1_bClass, Jn1_b>) end;

//  Jn1Class = interface(Jc_258Class) // or JObjectClass
//  ['{8D26F862-516F-46D9-8FD0-9552F14A4D38}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JCallback): Jn1; cdecl;
//    {class} function a(P1: Jn1): JLPAPI; cdecl; overload;
//    {class} function b(P1: Jn1): Jo1; cdecl; overload;
//    {class} function c(P1: Jn1): JCallback; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/n1')]
//  Jn1 = interface(Jc_258) // or JObject
//  ['{6FD523C6-6352-41FE-B5B3-69FAB7C5113F}']
//    { Property Methods }
//    function _Getb: JLPAPI_Callback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JLPAPI_Callback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JLPAPI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JLPAPI);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Jo1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jo1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function e: JLPAPI; cdecl;
//    function c: JPrinterInfoSetter; cdecl; overload;
//    function b: JPrinterInfoGetter; cdecl; overload;
//    function a: JPrintTask; cdecl; overload;
//    procedure f; cdecl;
//
//    { Property }
//    property b: JLPAPI_Callback read _Getb write _Setb;
//    property c: JCallback read _Getc write _Setc;
//    property d: JLPAPI read _Getd write _Setd;
//    property e: Jo1 read _Gete write _Sete;
//  end;
//
//  TJn1 = class(TJavaGenericImport<Jn1Class, Jn1>) end;

//  Jt_364Class = interface(Je0Class) // or JObjectClass
//  ['{9AA770F3-A14C-4164-8D3D-1CE0C72570BC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt_364; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/t')]
//  Jt_364 = interface(Je0) // or JObject
//  ['{44876F71-EB52-4C31-9BC5-45290EF21BA6}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterDensity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSpeed(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterNetworkState(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback): JPrinterInfo; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function isPrinterSupportrWriteRfid: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJt_364 = class(TJavaGenericImport<Jt_364Class, Jt_364>) end;

//  Jx_409Class = interface(Jt_364Class) // or JObjectClass
//  ['{E086E50F-9165-46D7-8A8A-1D81881FC50B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jx_409; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/x')]
//  Jx_409 = interface(Jt_364) // or JObject
//  ['{41C18573-E71C-4307-B51E-E54958A4DFB2}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterDensity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSpeed(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterNetworkState(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback): JPrinterInfo; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function isPrinterSupportrWriteRfid: Boolean; cdecl;
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterRfidSuccessTimes(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//
//    { Property }
//  end;
//
//  TJx_409 = class(TJavaGenericImport<Jx_409Class, Jx_409>) end;

//  Jo_324Class = interface(Jx_409Class) // or JObjectClass
//  ['{EF1DB4BC-2C73-422E-8692-199163482EBA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jo_324; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/o')]
//  Jo_324 = interface(Jx_409) // or JObject
//  ['{84512D45-F8F0-49B4-A190-DA3EBB559996}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJo_324 = class(TJavaGenericImport<Jo_324Class, Jo_324>) end;

//  Jo0Class = interface(Jc_258Class) // or JObjectClass
//  ['{02D0035E-E3D9-4EC0-AC74-001B8FA7A67B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jo0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/o0')]
//  Jo0 = interface(Jc_258) // or JObject
//  ['{AF8D876D-2B7B-42F9-91BB-6BA6956FAFC7}']
//    { Property Methods }
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//  end;
//
//  TJo0 = class(TJavaGenericImport<Jo0Class, Jo0>) end;

//  Jo1Class = interface(Jf_342Class) // or JObjectClass
//  ['{99D06D30-B8B8-467D-A6AF-D374D9BEAE97}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JLPAPI): Jo1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/o1')]
//  Jo1 = interface(Jf_342) // or JObject
//  ['{D8FBF6DE-1851-45C3-B2A4-25C5E114745C}']
//    { Property Methods }
//    function _Geth: JLPAPI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JLPAPI);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Je2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Je2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure startJob(P1: JPrintCallback); cdecl; overload;
//    procedure startJob(P1: JPrintCallback; P2: JInputStream; P3: JOutputStream); cdecl; overload;
//    procedure commitJob(P1: JString; P2: JString; P3: JString; P4: JOutputStream; P5: JInputStream); cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    function b: Boolean; cdecl;
//    function endJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    procedure commitData(P1: Je2; P2: JString; P3: JString); cdecl;
//    function getPageIndex: Integer; cdecl;
//    function c: Integer; cdecl; overload;
//    function f: Integer; cdecl; overload;
//    function mm2Pix(P1: Double): Integer; cdecl;
//    function generatePageData(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer): JObject; cdecl; overload;
//    function generatePageData(P1: Integer; P2: JBitmap; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer): JObject; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): TJavaArray<Integer>; cdecl; overload;
//    procedure g; cdecl; overload;
//    function e(P1: Integer): Integer; cdecl; overload;
//    function g(P1: Integer): Integer; cdecl; overload;
//    procedure f(P1: Integer); cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function getPagePrintTask: Je2; cdecl;
//    procedure resume(P1: JInputStream; P2: JOutputStream); cdecl;
//    procedure e; cdecl; overload;
//    function a(P1: Integer; P2: Integer): JBundle; cdecl; overload;
//    function c(P1: Integer): JBundle; cdecl; overload;
//    procedure h; cdecl;
//    procedure d(P1: Integer); cdecl;
//
//    { Property }
//    property h: JLPAPI read _Geth write _Seth;
//    property i: Integer read _Geti write _Seti;
//    property j: Boolean read _Getj write _Setj;
//    property k: Integer read _Getk write _Setk;
//    property l: Je2 read _Getl write _Setl;
//    property m: Integer read _Getm write _Setm;
//    property n: Boolean read _Getn write _Setn;
//  end;
//
//  TJo1 = class(TJavaGenericImport<Jo1Class, Jo1>) end;

//  Jy_412Class = interface(Jf0Class) // or JObjectClass
//  ['{CBA9731B-6088-4AB6-9E8F-AB7070B45567}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jy_412; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/y')]
//  Jy_412 = interface(Jf0) // or JObject
//  ['{8BB0DD2F-FFE1-41FA-96B0-0416D51C25A9}']
//    { Property Methods }
//
//    { methods }
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPrinterSpeed(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterReset(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function setPrinterAutoShutDownTime(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setBluetoothDistributionNetwork(P1: JString; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJy_412 = class(TJavaGenericImport<Jy_412Class, Jy_412>) end;

//  Jp_327Class = interface(Jy_412Class) // or JObjectClass
//  ['{E0641970-04BE-422B-B37D-F3B00E706B9E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jp_327; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/p')]
//  Jp_327 = interface(Jy_412) // or JObject
//  ['{2B484EDB-86C4-4EF2-B408-AEF9AD98C351}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJp_327 = class(TJavaGenericImport<Jp_327Class, Jp_327>) end;

//  Jp0Class = interface(Jw_406Class) // or JObjectClass
//  ['{1F4A2B2B-5D66-477F-852A-150D25C88A04}']
//    { static Property Methods }
//    {class} function _GetF: Jp0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jp0; cdecl;
//    {class} function o: Jp0; cdecl;
//
//    { static Property }
//    {class} property F: Jp0 read _GetF;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/p0')]
//  Jp0 = interface(Jw_406) // or JObject
//  ['{0A593A3D-09B8-46D3-B7FF-2EAEF5529598}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Integer): Double; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl;
//    function c: Single; cdecl;
//    function b: Integer; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJp0 = class(TJavaGenericImport<Jp0Class, Jp0>) end;

//  Jp1Class = interface(Jc_258Class) // or JObjectClass
//  ['{5477C965-E111-410E-B617-C8D68F72CE91}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jp1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/p1')]
//  Jp1 = interface(Jc_258) // or JObject
//  ['{4985C12D-91BA-4998-B636-AC25D5B9D04F}']
//    { Property Methods }
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//    property b: Integer read _Getb write _Setb;
//  end;
//
//  TJp1 = class(TJavaGenericImport<Jp1Class, Jp1>) end;

//  Ja_a_330Class = interface(JObjectClass)
//  ['{E1EFF160-4741-4202-9FFB-7FBA5F1DB5D8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): Ja_a_330; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/a$a')]
//  Ja_a_330 = interface(JObject)
//  ['{AB2BB4B7-C7C2-4776-897D-5C03AC7CD971}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//  end;
//
//  TJa_a_330 = class(TJavaGenericImport<Ja_a_330Class, Ja_a_330>) end;

//  Ja_331Class = interface(JObjectClass)
//  ['{C9223DBC-240C-48C3-9927-084AE0ECC653}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function b(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Boolean; P7: Boolean): JList; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): JList; cdecl; overload;
//    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Boolean; cdecl; overload;
//    {class} function a(P1: Integer; P2: Integer; P3: JList; P4: JList; P5: Integer; P6: Boolean): JList; cdecl; overload;
//    {class} function a(P1: Integer; P2: Byte; P3: Byte): JList; cdecl; overload;
//    {class} function a(P1: JList; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Byte; P7: Byte; P8: Integer; P9: Boolean): JList; cdecl; overload;
//    {class} function b(P1: JList; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Byte; P7: Byte; P8: Integer; P9: Boolean): JList; cdecl; overload;
//    {class} function b(P1: JList; P2: Integer): TJavaArray<Byte>; cdecl; overload;
//    {class} function a(P1: JList; P2: Integer): TJavaArray<Byte>; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Boolean; P7: Boolean): Jc; cdecl; overload;
//    {class} function a(P1: JList): Jc; cdecl; overload;
//    {class} function b(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;
//    {class} function init: Ja_331; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/a')]
//  Ja_331 = interface(JObject)
//  ['{C4727E0A-59D0-40C5-8A7F-FA0870B466AD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_331 = class(TJavaGenericImport<Ja_331Class, Ja_331>) end;

//  Jb_a_332Class = interface(JObjectClass)
//  ['{8F0A972E-8A6A-4415-B275-B2EEE3E6804C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb; P2: Integer; P3: Integer): Jb_a_332; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/b$a')]
//  Jb_a_332 = interface(JObject)
//  ['{0C14D6F0-B2E1-405A-8422-7401743BD890}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jb);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: Jb read _Getc write _Setc;
//  end;
//
//  TJb_a_332 = class(TJavaGenericImport<Jb_a_332Class, Jb_a_332>) end;

//  Jb_bClass = interface(JObjectClass)
//  ['{F4876B7D-87B4-4162-BBF6-11F514FECB06}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb; P2: Integer; P3: Integer; P4: JHashMap): Jb_b; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/b$b')]
//  Jb_b = interface(JObject)
//  ['{D8569E5D-AEAD-44BB-B4ED-EA678E80CE49}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JHashMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JHashMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jb);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: JHashMap read _Getc write _Setc;
//    property d: Jb read _Getd write _Setd;
//  end;
//
//  TJb_b = class(TJavaGenericImport<Jb_bClass, Jb_b>) end;

//  Jc_a_335Class = interface(JObjectClass)
//  ['{7F69D72A-58C1-4C0E-A232-24C1EF35EA70}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_a_335; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/c$a')]
//  Jc_a_335 = interface(JObject)
//  ['{FD7F6823-799E-4883-B92E-8A9B4D879B35}']
//    { Property Methods }
//    function _Geta: TJavaObjectArray<Jc_b>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: TJavaObjectArray<Jc_b>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: TJavaObjectArray<Jc_b> read _Geta write _Seta;
//  end;
//
//  TJc_a_335 = class(TJavaGenericImport<Jc_a_335Class, Jc_a_335>) end;

//  Jc_b_336Class = interface(JObjectClass)
//  ['{4028F400-0BF2-4657-A167-FADE8AEA5964}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_b_336; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/c$b')]
//  Jc_b_336 = interface(JObject)
//  ['{8AFB8A2A-2613-4BC6-9132-9149011278C5}']
//    { Property Methods }
//    function _Geta: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: TJavaArray<Byte> read _Geta write _Seta;
//  end;
//
//  TJc_b_336 = class(TJavaGenericImport<Jc_b_336Class, Jc_b_336>) end;

//  Jc_337Class = interface(JObjectClass)
//  ['{4994B67A-DAB1-434F-BF74-90343B6DDFA8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_337; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/c')]
//  Jc_337 = interface(JObject)
//  ['{807F868E-EA65-474C-A8FC-F8D96179AB82}']
//    { Property Methods }
//    function _Geta: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: TJavaObjectArray<Jc_a>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: TJavaObjectArray<Jc_a>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: TJavaArray<Byte> read _Geta write _Seta;
//    property b: TJavaObjectArray<Jc_a> read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Double read _Gete write _Sete;
//    property f: Double read _Getf write _Setf;
//    property g: Integer read _Getg write _Setg;
//  end;
//
//  TJc_337 = class(TJavaGenericImport<Jc_337Class, Jc_337>) end;

//  Je_a_339Class = interface(JObjectClass)
//  ['{B7C578D1-FA9B-424E-994A-AE01BDFEC160}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je): Je_a_339; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/e$a')]
//  Je_a_339 = interface(JObject)
//  ['{1CE7E21A-BA3C-49A2-ADBB-A28DCE35076C}']
//    { Property Methods }
//    function _Geta: Je;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Je read _Geta write _Seta;
//  end;
//
//  TJe_a_339 = class(TJavaGenericImport<Je_a_339Class, Je_a_339>) end;

//  Jf_aClass = interface(JObjectClass)
//  ['{D9A36066-8E5A-4AFD-93B3-9FA6E29503FC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jf): Jf_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/f$a')]
//  Jf_a = interface(JObject)
//  ['{A9F227B9-C2AA-4733-8F9B-EB992AAFAB5C}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJf_a = class(TJavaGenericImport<Jf_aClass, Jf_a>) end;

//  JJCPrinter_aClass = interface(JObjectClass)
//  ['{55F0B064-CD97-4FEB-8FC9-92DBAA48F367}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/JCPrinter$a')]
//  JJCPrinter_a = interface(JObject)
//  ['{C29E808E-7736-4640-9B41-B1E04E3706C8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJJCPrinter_a = class(TJavaGenericImport<JJCPrinter_aClass, JJCPrinter_a>) end;

//  JJCPrinter_b_a_aClass = interface(JObjectClass)
//  ['{6CBCA07B-290B-4823-8BD6-7DD897E0B360}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JJCPrinter_b_a; P2: Integer): JJCPrinter_b_a_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/JCPrinter$b$a$a')]
//  JJCPrinter_b_a_a = interface(JObject)
//  ['{A3391FE6-2C17-4B91-8AA0-2F8AC5FFF75F}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JJCPrinter_b_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JJCPrinter_b_a);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: JJCPrinter_b_a read _Getb write _Setb;
//  end;
//
//  TJJCPrinter_b_a_a = class(TJavaGenericImport<JJCPrinter_b_a_aClass, JJCPrinter_b_a_a>) end;

//  JJCPrinter_b_aClass = interface(JObjectClass)
//  ['{DC0742B6-FDD4-4541-9E22-9C53E1CE3033}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JJCPrinter_b): JJCPrinter_b_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/JCPrinter$b$a')]
//  JJCPrinter_b_a = interface(JObject)
//  ['{91953277-3F4D-432F-A206-02D0AE4A63A3}']
//    { Property Methods }
//    function _Geta: JJCPrinter_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JJCPrinter_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onError(P1: Integer); cdecl; overload;
//    procedure onError(P1: Integer; P2: Integer); cdecl; overload;
//    procedure onBufferFree(P1: Integer; P2: Integer); cdecl;
//    procedure onProgress(P1: Integer; P2: Integer; P3: JHashMap); cdecl;
//    procedure onPause(P1: Boolean); cdecl;
//    procedure onCancelJob(P1: Boolean); cdecl;
//
//    { Property }
//    property a: JJCPrinter_b read _Geta write _Seta;
//  end;
//
//  TJJCPrinter_b_a = class(TJavaGenericImport<JJCPrinter_b_aClass, JJCPrinter_b_a>) end;

//  JJCPrinter_b_bClass = interface(JObjectClass)
//  ['{BBF1B6CD-982C-400C-BC94-A61CA0891750}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JJCPrinter_b): JJCPrinter_b_b; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/JCPrinter$b$b')]
//  JJCPrinter_b_b = interface(JObject)
//  ['{CEB5DBD3-F29A-4B3F-BFE6-8E29B3CEE36E}']
//    { Property Methods }
//    function _Geta: JJCPrinter_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JJCPrinter_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JJCPrinter_b read _Geta write _Seta;
//  end;
//
//  TJJCPrinter_b_b = class(TJavaGenericImport<JJCPrinter_b_bClass, JJCPrinter_b_b>) end;

//  JJCPrinter_b_cClass = interface(JObjectClass)
//  ['{700825E7-5C11-43EA-B6A9-46BDF31802EA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JJCPrinter_b; P2: Je): JJCPrinter_b_c; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/JCPrinter$b$c')]
//  JJCPrinter_b_c = interface(JObject)
//  ['{3639E3E6-9240-4430-B7CB-837127861FC2}']
//    { Property Methods }
//    function _Geta: Je;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JJCPrinter_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JJCPrinter_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure need; cdecl;
//    procedure onError(P1: JArrayList); cdecl;
//
//    { Property }
//    property a: Je read _Geta write _Seta;
//    property b: JJCPrinter_b read _Getb write _Setb;
//  end;
//
//  TJJCPrinter_b_c = class(TJavaGenericImport<JJCPrinter_b_cClass, JJCPrinter_b_c>) end;

//  JJCPrinter_bClass = interface(JObjectClass)
//  ['{703014DD-18CF-4BA2-8986-84625D882E56}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JJCPrinter): JJCPrinter_b; cdecl; overload;
//    {class} function init(P1: JJCPrinter; P2: JJCPrinter_a): JJCPrinter_b; cdecl; overload;
//    {class} function a(P1: JJCPrinter_b): JObject; cdecl; overload;
//    {class} function b(P1: JJCPrinter_b): JLinkedBlockingDeque; cdecl; overload;
//    {class} function c(P1: JJCPrinter_b): JAtomicInteger; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/printer/JCPrinter$b')]
//  JJCPrinter_b = interface(JObject)
//  ['{7999C3D9-E2A7-4AE7-AFFE-880E7DEA968F}']
//    { Property Methods }
//    function _Geta: JLinkedBlockingDeque;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JLinkedBlockingDeque);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JAtomicInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JAtomicInteger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JPrintCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JPrintCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JJCPrinter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JJCPrinter);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: TJavaObjectArray<JString>; P2: TJavaObjectArray<JString>; P3: TJavaObjectArray<JString>); cdecl; overload;
//    procedure a(P1: Integer; P2: JBitmap; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: JString); cdecl; overload;
//    procedure e; cdecl;
//    procedure f; cdecl;
//    procedure d; cdecl;
//    function b: Boolean; cdecl; overload;
//    function c: Boolean; cdecl; overload;
//    function a: Boolean; cdecl; overload;
//    function a(P1: JString): Integer; cdecl; overload;
//
//    { Property }
//    property a: JLinkedBlockingDeque read _Geta write _Seta;
//    property b: JObject read _Getb write _Setb;
//    property c: JAtomicInteger read _Getc write _Setc;
//    property d: JPrintCallback read _Getd write _Setd;
//    property e: JJCPrinter read _Gete write _Sete;
//  end;
//
//  TJJCPrinter_b = class(TJavaGenericImport<JJCPrinter_bClass, JJCPrinter_b>) end;

  JJCPrinter_PrinterExceptionClass = interface(JRuntimeExceptionClass) // or JObjectClass
  ['{90FD9B40-8D0E-4540-8F7F-04D2CC42569A}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer): JJCPrinter_PrinterException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/printer/JCPrinter$PrinterException')]
  JJCPrinter_PrinterException = interface(JRuntimeException) // or JObject
  ['{9815E788-BD75-40B7-BAAE-E02C34275334}']
    { Property Methods }
    function _GeterrorCode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeterrorCode(aerrorCode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property errorCode: Integer read _GeterrorCode write _SeterrorCode;
  end;

  TJJCPrinter_PrinterException = class(TJavaGenericImport<JJCPrinter_PrinterExceptionClass, JJCPrinter_PrinterException>) end;

  JJCPrinterClass = interface(JObjectClass)
  ['{BDCA1EA7-B667-4616-A012-8661A71FDC10}']
    { static Property Methods }
    {class} function _Gets: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gett: JPrinterInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getu: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getv: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getw: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getx: Jv1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JCallback): JJCPrinter; cdecl; overload;
    {class} procedure a(P1: JPrintCallback; P2: Integer); cdecl; overload;
    {class} procedure I; cdecl; overload;
    {class} function a(P1: JJCPrinter): JPrintCallback; cdecl; overload;
    {class} function c(P1: JJCPrinter): JHandler; cdecl; overload;
    {class} function d(P1: JJCPrinter): JExecutorService; cdecl; overload;
//    {class} function e(P1: JJCPrinter): Jc; cdecl; overload;
    {class} function f(P1: JJCPrinter): Integer; cdecl; overload;
    {class} function a(P1: JJCPrinter; P2: JExecutorService): JExecutorService; cdecl; overload;
    {class} function g(P1: JJCPrinter): JInputStream; cdecl; overload;
    {class} function b(P1: JJCPrinter): JOutputStream; cdecl; overload;
    {class} function init: JJCPrinter; cdecl; overload;

    { static Property }
    {class} property s: Integer read _Gets;
    {class} property t: JPrinterInfo read _Gett;
    {class} property u: Boolean read _Getu;
    {class} property v: Single read _Getv;
    {class} property w: Boolean read _Getw;
//    {class} property x: Jv1 read _Getx;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/printer/JCPrinter')]
  JJCPrinter = interface(JObject)
  ['{62AA01EE-879B-4A6E-91FF-3BE101B784F5}']
    { Property Methods }
//    function _Geta: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jb);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JPrintCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JPrintCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: JExecutorService;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: JExecutorService);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
////    function _Getp: JJCPrinter_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
////    procedure _Setp(ap: JJCPrinter_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: JApplication;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: JApplication);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

//    { methods }
//    function l: Integer; cdecl; overload;
//    procedure H; cdecl; overload;
//    function a(P1: JString): Integer; cdecl; overload;
////    procedure L; cdecl; overload;
//    procedure c; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    procedure e; cdecl; overload;
//    function f: Boolean; cdecl; overload;
//    function M: Boolean; cdecl; overload;
////    function C: Boolean; cdecl; overload;
////    function a(P1: Integer): Jc; cdecl; overload;
//    procedure b(P1: JCallback); cdecl; overload;
////    procedure a(P1: Jb; P2: JCallback; P3: Integer); cdecl; overload;
//    function j(P1: Integer): Integer; cdecl; overload;
//    function e(P1: Integer): Integer; cdecl; overload;
//    function A: Boolean; cdecl; overload;
//    function c(P1: Integer): Integer; cdecl; overload;
//    function r: JPrinterInfo; cdecl;
//    procedure a(P1: Integer; P2: JPrintCallback); cdecl; overload;
//    function i: JInputStream; cdecl; overload;
////    function m: JOutputStream; cdecl; overload;
//    procedure a(P1: JCallback); cdecl; overload;
//    function z: Integer; cdecl;
//    function b(P1: JString): Integer; cdecl; overload;
//    procedure d; cdecl; overload;
//    function B: Integer; cdecl; overload;
//    function k: Single; cdecl; overload;
//    function i(P1: Integer): Integer; cdecl; overload;
//    function o: Integer; cdecl;
//    function l(P1: Integer): Integer; cdecl; overload;
//    function y: Integer; cdecl;
//    function d(P1: Integer): Integer; cdecl; overload;
//    function f(P1: Integer): Integer; cdecl; overload;
//    function j: Integer; cdecl; overload;
//    function E: Boolean; cdecl; overload;
//    function u: JHashMap; cdecl;
//    function v: JHashMap; cdecl;
//    function F: Boolean; cdecl; overload;
//    function k(P1: Integer): Integer; cdecl; overload;
//    function D: Boolean; cdecl; overload;
//    function t: Integer; cdecl;
//    function g(P1: Integer): Integer; cdecl; overload;
//    function b(P1: Integer): Integer; cdecl; overload;
//    function G: Boolean; cdecl; overload;
//    function s: Integer; cdecl;
//    function h(P1: Integer): Integer; cdecl; overload;
//    function h: Integer; cdecl; overload;
//    function K: Integer; cdecl; overload;
//    function p: Integer; cdecl;
//    function x: JString; cdecl;
//    function w: JString; cdecl;
//    function q: JString; cdecl;
//    function n: JString; cdecl;
//    procedure m(P1: Integer); cdecl; overload;
//    function a: Boolean; cdecl; overload;
//    function g: Boolean; cdecl; overload;
//    function a(P1: JString; P2: Integer): Integer; cdecl; overload;
//    function b(P1: JString; P2: Integer): Integer; cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: Integer; P4: JPrintCallback); cdecl; overload;
//    procedure a(P1: JList; P2: JList; P3: JList); cdecl; overload;
//    procedure a(P1: Integer; P2: JBitmap; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: JString); cdecl; overload;
//    procedure J; cdecl; overload;
//    function a(P1: JApplication): Boolean; cdecl; overload;
//    function a(P1: JString; P2: JString): Integer; cdecl; overload;
//
//    { Property }
//    property a: Jc read _Geta write _Seta;
//    property b: Jb read _Getb write _Setb;
//    property c: JCallback read _Getc write _Setc;
//    property d: JPrintCallback read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JContext read _Getf write _Setf;
//    property g: JHandler read _Getg write _Setg;
//    property h: JString read _Geth write _Seth;
//    property i: JString read _Geti write _Seti;
//    property j: JString read _Getj write _Setj;
//    property k: Integer read _Getk write _Setk;
//    property l: Int64 read _Getl write _Setl;
//    property m: JHandler read _Getm write _Setm;
//    property n: JExecutorService read _Getn write _Setn;
//    property o: Integer read _Geto write _Seto;
//    property p: JJCPrinter_b read _Getp write _Setp;
//    property q: JString read _Getq write _Setq;
//    property r: JApplication read _Getr write _Setr;
  end;

  TJJCPrinter = class(TJavaGenericImport<JJCPrinterClass, JJCPrinter>) end;

  JPrinterInfoGetterClass = interface(JObjectClass)
  ['{40BCB678-18F0-4D8E-A5B5-1539627CB9EE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/printerInterface/PrinterInfoGetter')]
  JPrinterInfoGetter = interface(IJavaInstance)
  ['{BCC746D6-6EEE-4702-836D-79D27F506C1E}']
    { Property Methods }

    { methods }
    function getPrinterDensity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
    function getPrinterSpeed(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
    function getPrintMode(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
    function getAutoShutDownTime(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
    function getPrinterLanguage(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
    function getPrinterSoftWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
    function getPrinterElectricity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
    function getPrinterHardWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
    function getPrinterRfidParameters(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JList; cdecl;
    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
    function getPrinterRfidSuccessTimes(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
    function getPrinterNetworkState(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
    function isPrinterSupportrWriteRfid: Boolean; cdecl;
    function isSupportGetPrinterHistory: Boolean; cdecl;
    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
    function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback): JPrinterInfo; cdecl;
    function isSupportSetMaterial: Boolean; cdecl;

    { Property }
  end;

  TJPrinterInfoGetter = class(TJavaGenericImport<JPrinterInfoGetterClass, JPrinterInfoGetter>) end;

  JPrinterInfoSetterClass = interface(JObjectClass)
  ['{6C8FBF72-1034-4D53-90B0-5C4E1E0BE48E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/printerInterface/PrinterInfoSetter')]
  JPrinterInfoSetter = interface(IJavaInstance)
  ['{8C66D5A8-3EF4-4776-B2C9-66773BC7A091}']
    { Property Methods }

    { methods }
    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
    function setPrinterSpeed(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
    function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
    function setPrinterAutoShutDownTime(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
    function setPrinterLanguage(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
    function setPrinterReset(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
    function setBluetoothDistributionNetwork(P1: JString; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
    function setLabelMaterial(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
    procedure setUpdateFirmwareRequest(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
    procedure cancelUpdateFirmwareRequest; cdecl;
    procedure setMainControlPanelUpgrade(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
    procedure cancelMainControlPanelUpgrade; cdecl;

    { Property }
  end;

  TJPrinterInfoSetter = class(TJavaGenericImport<JPrinterInfoSetterClass, JPrinterInfoSetter>) end;

  JPrintTaskClass = interface(JObjectClass)
  ['{EBD1222B-EE74-4453-A600-17925132F071}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/printerInterface/PrintTask')]
  JPrintTask = interface(IJavaInstance)
  ['{DABBDDF1-8B79-4298-906B-E8504710318A}']
    { Property Methods }

    { methods }
    procedure startJob(P1: Double; P2: Double; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double); cdecl; overload;
    procedure startJob(P1: JPrintCallback); cdecl; overload;
    procedure startJob(P1: JPrintCallback; P2: JInputStream; P3: JOutputStream); cdecl; overload;
    procedure startPage(P1: JCanvas; P2: Integer); cdecl;
    procedure endPage(P1: Integer); cdecl;
    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
    procedure commitJob(P1: Boolean; P2: Integer; P3: Integer; P4: JString; P5: JOutputStream; P6: JInputStream; P7: JPrintCallback); cdecl; overload;
    procedure commitJob(P1: JString; P2: JString; P3: JString; P4: JOutputStream; P5: JInputStream); cdecl; overload;
    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
    function endJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JString); cdecl; overload;
    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JTypeface); cdecl; overload;
    procedure drawBarCode(P1: JCanvas; P2: JString; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl;
    procedure drawQrCode(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl;
    procedure drawBitmap(P1: JCanvas; P2: JBitmap; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl;
    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl; overload;
    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer); cdecl; overload;
    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer; P9: Integer); cdecl; overload;
    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl; overload;
    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl; overload;
    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer); cdecl; overload;
    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
    function mm2Pix(P1: Double): Integer; cdecl;
    function getPreview: JBitmap; cdecl; //Deprecated
    function generatePageData(P1: JString; P2: JString; P3: Integer): JObject; cdecl; overload;
    function generatePageData(P1: Integer; P2: JBitmap; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer): JObject; cdecl; overload;
    function generatePageData(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Integer): JObject; cdecl; overload;
//    procedure commitData(P1: Je2; P2: JString; P3: JString); cdecl;
    procedure pause(P1: JInputStream; P2: JOutputStream); cdecl;
    procedure resume(P1: JInputStream; P2: JOutputStream); cdecl;
//    function getPagePrintTask: Je2; cdecl;
    function getPageIndex: Integer; cdecl;

    { Property }
  end;

  TJPrintTask = class(TJavaGenericImport<JPrintTaskClass, JPrintTask>) end;

//  Jq_354Class = interface(Ja_233Class) // or JObjectClass
//  ['{DD331A7C-4FBE-4F7D-B45A-300269DD87FB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jq_354; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/q')]
//  Jq_354 = interface(Ja_233) // or JObject
//  ['{2858EDE3-E11E-4F2A-A042-01EC4F4424EE}']
//    { Property Methods }
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//  end;
//
//  TJq_354 = class(TJavaGenericImport<Jq_354Class, Jq_354>) end;

//  Jq0Class = interface(JObjectClass)
//  ['{66F3817C-70A0-4BB6-B4D3-A827DBE348F5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/q0')]
//  Jq0 = interface(JObject)
//  ['{C1B8AEEB-49DC-4355-A5A9-0A5AE2930403}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterDensity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSpeed(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrintMode(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterLanguage(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getAutoShutDownTime(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSoftWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterElectricity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterHardWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function getPrinterRfidParameters(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JList; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterRfidSuccessTimes(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterNetworkState(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function isPrinterSupportrWriteRfid: Boolean; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback): JPrinterInfo; cdecl;
//    function isSupportSetMaterial: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJq0 = class(TJavaGenericImport<Jq0Class, Jq0>) end;

//  Jq1Class = interface(Ji1Class) // or JObjectClass
//  ['{78E2A573-C7EF-4A9E-948A-AFF3792CC83D}']
//    { static Property Methods }
//    {class} function _Getw: Jq1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jq1; cdecl; overload;
//    {class} function q: Jq1; cdecl;
//    {class} function init: Jq1; cdecl; overload;
//
//    { static Property }
//    {class} property w: Jq1 read _Getw;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/q1')]
//  Jq1 = interface(Ji1) // or JObject
//  ['{993B3929-8F53-4621-A010-8814767831EC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJq1 = class(TJavaGenericImport<Jq1Class, Jq1>) end;

//  Jr_357Class = interface(Jd_338Class) // or JObjectClass
//  ['{A67EAC30-F544-40DE-A6A4-5032EADB5EBB}']
//    { static Property Methods }
//    {class} function _Gets: Jr;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jr_357; cdecl;
//    {class} function m: Jr; cdecl;
//
//    { static Property }
//    {class} property s: Jr read _Gets;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/r')]
//  Jr_357 = interface(Jd_338) // or JObject
//  ['{CE061818-4862-4AF4-A0AE-2421CE957E8A}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jc); cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//    function b(P1: Integer): Double; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function c: Single; cdecl;
//
//    { Property }
//  end;
//
//  TJr_357 = class(TJavaGenericImport<Jr_357Class, Jr_357>) end;

//  Jr0_aClass = interface(JThreadClass) // or JObjectClass
//  ['{05C27784-6559-40CF-A2D7-C9A199D8672F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jr0; P2: JString; P3: JString; P4: JString; P5: TJavaArray<Byte>; P6: JString; P7: JOutputStream; P8: JInputStream; P9: JUpDateDeviceSoftWareCallback): Jr0_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/r0$a')]
//  Jr0_a = interface(JThread) // or JObject
//  ['{13B60D48-FCF3-4D5F-AE38-7D186E0A93EE}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JOutputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JOutputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JUpDateDeviceSoftWareCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JUpDateDeviceSoftWareCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Jr0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jr0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: TJavaArray<Byte> read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JOutputStream read _Getf write _Setf;
//    property g: JInputStream read _Getg write _Setg;
//    property h: JUpDateDeviceSoftWareCallback read _Geth write _Seth;
//    property i: Jr0 read _Geti write _Seti;
//  end;
//
//  TJr0_a = class(TJavaGenericImport<Jr0_aClass, Jr0_a>) end;

//  Jr0Class = interface(JObjectClass)
//  ['{6BD72BB1-B870-4EBD-8DE0-4A380C458C8C}']
//    { static Property Methods }
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jr0; cdecl; overload;
//    {class} function init: Jr0; cdecl; overload;
//
//    { static Property }
//    {class} property b: Boolean read _Getb;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/r0')]
//  Jr0 = interface(JObject)
//  ['{B8F10018-9444-45FF-B822-8FD572DB4AD0}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPrinterSpeed(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterAutoShutDownTime(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterLanguage(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterReset(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function setBluetoothDistributionNetwork(P1: JString; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setLabelMaterial(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    procedure setUpdateFirmwareRequest(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure a(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    procedure b(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    procedure cancelUpdateFirmwareRequest; cdecl;
//    procedure setMainControlPanelUpgrade(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure cancelMainControlPanelUpgrade; cdecl;
//    procedure b(P1: JOutputStream; P2: JInputStream; P3: JUpDateDeviceSoftWareCallback; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>); cdecl; overload;
//    procedure a(P1: JOutputStream; P2: JInputStream; P3: JUpDateDeviceSoftWareCallback; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>); cdecl; overload;
//    procedure a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl; overload;
//    function b(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl; overload;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;
//
//  TJr0 = class(TJavaGenericImport<Jr0Class, Jr0>) end;

//  Jr1Class = interface(Jj1Class) // or JObjectClass
//  ['{A57D4130-9FF1-4935-99B5-5A513A44C58B}']
//    { static Property Methods }
//    {class} function _GetK: Jr1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jr1; cdecl; overload;
//    {class} function q: Jr1; cdecl;
//    {class} function init: Jr1; cdecl; overload;
//
//    { static Property }
//    {class} property K: Jr1 read _GetK;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/r1')]
//  Jr1 = interface(Jj1) // or JObject
//  ['{04617307-DADD-4A0C-B3BD-B890768D7976}']
//    { Property Methods }
//    function _GetB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetC: JBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetC(aC: JBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetD(aD: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetE(aE: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetF(aF: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetG: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetG(aG: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetH(aH: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetI: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetI(aI: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetJ: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetJ(aJ: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function endJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    procedure startJob(P1: Double; P2: Double; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double); cdecl;
//    procedure startPage(P1: JCanvas; P2: Integer); cdecl;
//    procedure endPage(P1: Integer); cdecl;
//    procedure setTotalQuantityOfPrints(P1: Integer); cdecl;
//    procedure commitJob(P1: Boolean; P2: Integer; P3: Integer; P4: JString; P5: JOutputStream; P6: JInputStream; P7: JPrintCallback); cdecl;
//    function c: Single; cdecl;
//    function cancelJob(P1: JOutputStream; P2: JInputStream; P3: JPrintCallback): Boolean; cdecl;
//    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JString); cdecl; overload;
//    procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JTypeface); cdecl; overload;
//    procedure drawBarCode(P1: JCanvas; P2: JString; P3: Integer; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl;
//    procedure drawQrCode(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl;
//    procedure drawBitmap(P1: JCanvas; P2: JBitmap; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl;
//    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl; overload;
//    procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer); cdecl; overload;
//    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
//    procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
//    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer; P9: Integer); cdecl; overload;
//    procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl; overload;
//    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl; overload;
//    procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer); cdecl; overload;
//    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
//    procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
//    function b(P1: JInputStream): Integer; cdecl; overload;
//    function a(P1: TJavaArray<Byte>): Integer; cdecl; overload;
//    function getPreview: JBitmap; cdecl;
//    function b: Integer; cdecl; overload;
//    function a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JPrintCallback): Integer; cdecl; overload;
//    procedure n; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer; P4: Integer): Integer; cdecl; overload;
//    function a(P1: JOutputStream; P2: JInputStream): Boolean; cdecl; overload;
//    procedure j; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//
//    { Property }
//    property B: Integer read _GetB write _SetB;
//    property C: JBitmap read _GetC write _SetC;
//    property D: Integer read _GetD write _SetD;
//    property E: Integer read _GetE write _SetE;
//    property F: Integer read _GetF write _SetF;
//    property G: Integer read _GetG write _SetG;
//    property H: Integer read _GetH write _SetH;
//    property I: Integer read _GetI write _SetI;
//    property J: JList read _GetJ write _SetJ;
//  end;
//
//  TJr1 = class(TJavaGenericImport<Jr1Class, Jr1>) end;

//  Js_361Class = interface(Jd0Class) // or JObjectClass
//  ['{11322B4E-BCA1-4811-B032-E664E2967E49}']
//    { static Property Methods }
//    {class} function _Getq: Js;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Js_361; cdecl;
//    {class} function l: Jd0; cdecl;
//
//    { static Property }
//    {class} property q: Js read _Getq;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/s')]
//  Js_361 = interface(Jd0) // or JObject
//  ['{A0EFF5EC-D47D-40CA-84ED-57544ADC8C9F}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jc); cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJs_361 = class(TJavaGenericImport<Js_361Class, Js_361>) end;

//  Js0Class = interface(Jq0Class) // or JObjectClass
//  ['{76128943-3B06-4F01-B864-759D023ED6B5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Js0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/s0')]
//  Js0 = interface(Jq0) // or JObject
//  ['{448D06AF-2C32-4972-AAB3-DFD9ED4EA092}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterHardWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback): JPrinterInfo; cdecl;
//    function isSupportSetMaterial: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJs0 = class(TJavaGenericImport<Js0Class, Js0>) end;

//  Js1Class = interface(JObjectClass)
//  ['{A7EF04CD-0011-4922-92D1-BCE6DE26CDC1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Js1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/s1')]
//  Js1 = interface(JObject)
//  ['{903F058B-4FF9-420D-A031-77812A355A26}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterDensity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSpeed(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrintMode(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterLanguage(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getAutoShutDownTime(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSoftWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterElectricity(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterHardWareVersion(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function getPrinterRfidParameters(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JList; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterRfidSuccessTimes(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function getPrinterNetworkState(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function isPrinterSupportrWriteRfid: Boolean; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterInformation(P1: JOutputStream; P2: JInputStream; P3: JCallback): JPrinterInfo; cdecl;
//    function isSupportSetMaterial: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJs1 = class(TJavaGenericImport<Js1Class, Js1>) end;

//  Jt0Class = interface(Jr0Class) // or JObjectClass
//  ['{07E61CA5-0B93-4838-9754-9B5C10B6AA6A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/t0')]
//  Jt0 = interface(Jr0) // or JObject
//  ['{4EA78164-C166-4A7E-9C96-BAA2E7FBF2AF}']
//    { Property Methods }
//
//    { methods }
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    procedure a(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//
//    { Property }
//  end;
//
//  TJt0 = class(TJavaGenericImport<Jt0Class, Jt0>) end;

//  Jt1_aClass = interface(JThreadClass) // or JObjectClass
//  ['{D41FC37C-15DA-406C-890C-59406301A1FC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jt1; P2: JString; P3: JString; P4: JString; P5: TJavaArray<Byte>; P6: JString; P7: JOutputStream; P8: JInputStream; P9: JUpDateDeviceSoftWareCallback): Jt1_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/t1$a')]
//  Jt1_a = interface(JThread) // or JObject
//  ['{32A45C92-B39B-4D2A-A08B-B22B3C9512D0}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JOutputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JOutputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JUpDateDeviceSoftWareCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JUpDateDeviceSoftWareCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Jt1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jt1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: TJavaArray<Byte> read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JOutputStream read _Getf write _Setf;
//    property g: JInputStream read _Getg write _Setg;
//    property h: JUpDateDeviceSoftWareCallback read _Geth write _Seth;
//    property i: Jt1 read _Geti write _Seti;
//  end;
//
//  TJt1_a = class(TJavaGenericImport<Jt1_aClass, Jt1_a>) end;

//  Jt1Class = interface(JObjectClass)
//  ['{246E90EA-13D5-4934-9DDE-2C4340A3783C}']
//    { static Property Methods }
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JHashSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JHashSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jt1; cdecl; overload;
//    {class} function init: Jt1; cdecl; overload;
//
//    { static Property }
//    {class} property b: Boolean read _Getb;
//    {class} property c: JHashSet read _Getc;
//    {class} property d: JHashSet read _Getd;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/t1')]
//  Jt1 = interface(JObject)
//  ['{C19B74A5-11CE-4384-93D3-E19C8373BC8C}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPrinterSpeed(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterAutoShutDownTime(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterLanguage(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterReset(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function setBluetoothDistributionNetwork(P1: JString; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setLabelMaterial(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    procedure setUpdateFirmwareRequest(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure a(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    procedure b(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl; overload;
//    procedure b(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    procedure cancelUpdateFirmwareRequest; cdecl;
//    procedure setMainControlPanelUpgrade(P1: JString; P2: JString; P3: JString; P4: TJavaArray<Byte>; P5: JString; P6: JOutputStream; P7: JInputStream; P8: JUpDateDeviceSoftWareCallback); cdecl;
//    procedure cancelMainControlPanelUpgrade; cdecl;
//    procedure b(P1: JOutputStream; P2: JInputStream; P3: JUpDateDeviceSoftWareCallback; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>); cdecl; overload;
//    procedure a(P1: JOutputStream; P2: JInputStream; P3: JUpDateDeviceSoftWareCallback; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>); cdecl; overload;
//    procedure a(P1: JString; P2: JOutputStream; P3: JInputStream; P4: JUpDateDeviceSoftWareCallback; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl; overload;
//    function b(P1: TJavaArray<Byte>; P2: Integer; P3: JUpDateDeviceSoftWareCallback): Integer; cdecl; overload;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;
//
//  TJt1 = class(TJavaGenericImport<Jt1Class, Jt1>) end;

//  Ju_368Class = interface(Jf0Class) // or JObjectClass
//  ['{AC90B7B7-4B73-43FF-BFB0-E413806111A6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ju_368; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/u')]
//  Ju_368 = interface(Jf0) // or JObject
//  ['{1CADBEC9-24BB-4BB6-A2FD-45EF7BF9BAC6}']
//    { Property Methods }
//
//    { methods }
//    function setPrinterDensity(P1: JString; P2: Integer; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPrinterSpeed(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setLabelType(P1: Integer; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//    function setPositioningCalibration(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrintMode(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setPrinterReset(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//    function setPrinterAutoShutDownTime(P1: Integer; P2: JOutputStream; P3: JInputStream; P4: JCallback): Integer; cdecl;
//    function setBluetoothDistributionNetwork(P1: JString; P2: JString; P3: JOutputStream; P4: JInputStream; P5: JCallback): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJu_368 = class(TJavaGenericImport<Ju_368Class, Ju_368>) end;

//  Ju0Class = interface(Jb_237Class) // or JObjectClass
//  ['{6ADA1183-4448-45BA-A3BB-C30CAA56CA99}']
//    { static Property Methods }
//    {class} function _Getc: JBluetoothSocket;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JBluetoothDevice;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JString): Ju0; cdecl;
//    {class} function f: JUUID; cdecl;
//
//    { static Property }
//    {class} property c: JBluetoothSocket read _Getc;
//    {class} property d: JBluetoothDevice read _Getd;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/u0')]
//  Ju0 = interface(Jb_237) // or JObject
//  ['{EF238C04-B131-428D-ABA3-4829EC38116D}']
//    { Property Methods }
//    function _Geta: JInputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JInputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JOutputStream;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JOutputStream);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: Boolean; cdecl;
//    function c: JInputStream; cdecl;
//    function d: JOutputStream; cdecl;
//    function e: Boolean; cdecl;
//    function a(P1: JContext): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//    property a: JInputStream read _Geta write _Seta;
//    property b: JOutputStream read _Getb write _Setb;
//  end;
//
//  TJu0 = class(TJavaGenericImport<Ju0Class, Ju0>) end;

//  Ju1Class = interface(JObjectClass)
//  ['{F531162C-C1EA-4335-AB88-58F9FC3902D5}']
//    { static Property Methods }
//    {class} function _Getb: Ju1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Ju1; cdecl;
//    {class} function a: Ju1; cdecl; overload;
//
//    { static Property }
//    {class} property b: Ju1 read _Getb;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/u1')]
//  Ju1 = interface(JObject)
//  ['{C6751A07-C4E6-42EC-8647-D37786B9B52A}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Boolean); cdecl; overload;
//    function b: Boolean; cdecl;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//  end;
//
//  TJu1 = class(TJavaGenericImport<Ju1Class, Ju1>) end;

  JBarCodeUtilClass = interface(JObjectClass)
  ['{82C7801E-5D1B-4AF5-9B0D-2CDE0E636ED2}']
    { static Property Methods }
    {class} function _GetBARCODE_TYPE_CODE128: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBARCODE_TYPE_UPC_A: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBARCODE_TYPE_UPC_E: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBARCODE_TYPE_EAN13: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBARCODE_TYPE_EAN8: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBARCODE_TYPE_CODE39: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBARCODE_TYPE_CODE93: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBARCODE_TYPE_CODE_BAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBARCODE_TYPE_ITF25: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBarCodeUtil; cdecl;
    {class} function getCheckNumber(P1: Integer; P2: JString): Integer; cdecl;
    {class} function barcodeFormatCheck(P1: Integer; P2: JString): Integer; cdecl;
    {class} function barcodeContentFormat(P1: Integer; P2: JString): JString; cdecl;
    {class} function regReplace(P1: JString; P2: JString; P3: JString): JString; cdecl;
    {class} function replaceToNumString(P1: JString): JString; cdecl;
    {class} function replaceToString(P1: JString; P2: Char): JString; cdecl;

    { static Property }
    {class} property BARCODE_TYPE_CODE128: Integer read _GetBARCODE_TYPE_CODE128;
    {class} property BARCODE_TYPE_UPC_A: Integer read _GetBARCODE_TYPE_UPC_A;
    {class} property BARCODE_TYPE_UPC_E: Integer read _GetBARCODE_TYPE_UPC_E;
    {class} property BARCODE_TYPE_EAN13: Integer read _GetBARCODE_TYPE_EAN13;
    {class} property BARCODE_TYPE_EAN8: Integer read _GetBARCODE_TYPE_EAN8;
    {class} property BARCODE_TYPE_CODE39: Integer read _GetBARCODE_TYPE_CODE39;
    {class} property BARCODE_TYPE_CODE93: Integer read _GetBARCODE_TYPE_CODE93;
    {class} property BARCODE_TYPE_CODE_BAR: Integer read _GetBARCODE_TYPE_CODE_BAR;
    {class} property BARCODE_TYPE_ITF25: Integer read _GetBARCODE_TYPE_ITF25;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/BarCodeUtil')]
  JBarCodeUtil = interface(JObject)
  ['{75318AEF-646F-4888-A584-E8A9AC952644}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBarCodeUtil = class(TJavaGenericImport<JBarCodeUtilClass, JBarCodeUtil>) end;

  JBase64BitmapUtilClass = interface(JObjectClass)
  ['{75FDA795-8F04-481E-8A34-7F93158F6DA3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBase64BitmapUtil; cdecl;
    {class} function bitmapToBase64(P1: JBitmap): JString; cdecl;
    {class} function base64ToBitmap(P1: JString): JBitmap; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/Base64BitmapUtil')]
  JBase64BitmapUtil = interface(JObject)
  ['{A8BFD9F8-BB4E-44B8-9722-CC6F49F96628}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBase64BitmapUtil = class(TJavaGenericImport<JBase64BitmapUtilClass, JBase64BitmapUtil>) end;

  JBitmapAndRgbByteUtilClass = interface(JObjectClass)
  ['{6C4A6394-A92E-4635-A990-5F537168A9BA}']
    { static Property Methods }
    {class} function _GetRGB_DATA_WIDTH_OR_HEIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBitmapAndRgbByteUtil; cdecl; overload;
    {class} function rgb2BitmapFor123(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JBitmap; cdecl;
    {class} function rgb2BitmapFor323(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JBitmap; cdecl;
    {class} function bitmap2RGBData(P1: JBitmap): TJavaArray<Byte>; cdecl;
    {class} function resizeTo512(P1: JBitmap): JBitmap; cdecl;
    {class} function resize512ToOrigin(P1: JBitmap): JBitmap; cdecl;
//    {class} function init: JBitmapAndRgbByteUtil; cdecl; overload;

    { static Property }
    {class} property RGB_DATA_WIDTH_OR_HEIGHT: Integer read _GetRGB_DATA_WIDTH_OR_HEIGHT;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/BitmapAndRgbByteUtil')]
  JBitmapAndRgbByteUtil = interface(JObject)
  ['{87D8CD1B-5084-4E94-986F-5F9E79C40C1E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapAndRgbByteUtil = class(TJavaGenericImport<JBitmapAndRgbByteUtilClass, JBitmapAndRgbByteUtil>) end;

  JBitmapFileUtilsClass = interface(JObjectClass)
  ['{B57815C6-EDE2-42F1-A16D-5CB93F767836}']
    { static Property Methods }
    {class} function _GetCUTTING_POSITION_LEFT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCUTTING_POSITION_RIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCUTTING_POSITION_BOTH_SIDES: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_LABEL_WIDTH_B11_B50: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_LABEL_WIDTH_B3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_LABEL_WIDTH_B3S: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_LABEL_WIDTH_B21: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_LABEL_WIDTH_P1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_LABEL_WIDTH_D11: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBitmapFileUtils; cdecl; overload;
    {class} function processingPictures(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): JBitmap; cdecl;
    {class} function genBitmap(P1: JString; P2: JString): JBitmap; cdecl;
    {class} function getTrimming(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    {class} function getTrimmingData(P1: Integer; P2: Integer; P3: Integer; P4: JBitmap; P5: Integer; P6: Integer; P7: Integer; P8: Integer; P9: Single; P10: Integer; P11: Integer): JBitmap; cdecl;
//    {class} function init: JBitmapFileUtils; cdecl; overload;

    { static Property }
    {class} property CUTTING_POSITION_LEFT: Integer read _GetCUTTING_POSITION_LEFT;
    {class} property CUTTING_POSITION_RIGHT: Integer read _GetCUTTING_POSITION_RIGHT;
    {class} property CUTTING_POSITION_BOTH_SIDES: Integer read _GetCUTTING_POSITION_BOTH_SIDES;
    {class} property MAX_LABEL_WIDTH_B11_B50: Integer read _GetMAX_LABEL_WIDTH_B11_B50;
    {class} property MAX_LABEL_WIDTH_B3: Integer read _GetMAX_LABEL_WIDTH_B3;
    {class} property MAX_LABEL_WIDTH_B3S: Integer read _GetMAX_LABEL_WIDTH_B3S;
    {class} property MAX_LABEL_WIDTH_B21: Integer read _GetMAX_LABEL_WIDTH_B21;
    {class} property MAX_LABEL_WIDTH_P1: Integer read _GetMAX_LABEL_WIDTH_P1;
    {class} property MAX_LABEL_WIDTH_D11: Integer read _GetMAX_LABEL_WIDTH_D11;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/BitmapFileUtils')]
  JBitmapFileUtils = interface(JObject)
  ['{3CA7D5E1-B7E7-41A8-9F87-12A5B1BCD68D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapFileUtils = class(TJavaGenericImport<JBitmapFileUtilsClass, JBitmapFileUtils>) end;

  JBluetoothMonitorReceiverClass = interface(JBroadcastReceiverClass) // or JObjectClass
  ['{4CACB880-0FF8-4118-B27D-EEE4B0546D76}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBluetoothMonitorReceiver; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/BluetoothMonitorReceiver')]
  JBluetoothMonitorReceiver = interface(JBroadcastReceiver) // or JObject
  ['{051C1ABB-2C2C-4F59-8ADA-FF0B0D760E72}']
    { Property Methods }

    { methods }
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;

    { Property }
  end;

  TJBluetoothMonitorReceiver = class(TJavaGenericImport<JBluetoothMonitorReceiverClass, JBluetoothMonitorReceiver>) end;

  JByteUtilClass = interface(JObjectClass)
  ['{D3F34B51-CDBC-425E-BB2A-9348AE2A0BAA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteUtil; cdecl;
    {class} function getHexByOctal(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function getString(P1: TJavaArray<Byte>): JList; cdecl;
    {class} function byte2int(P1: Byte): Integer; cdecl;
    {class} function int2ByteArray(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function toHex(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function toHexLog(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function getMd5(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function conver2HexStr(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function convertRFIDStringToBytes(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function convertRFIDBytesToString(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function byteArray2Int(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function pixelsToByte(P1: TJavaArray<Integer>): Byte; cdecl;
    {class} function getBinaryzationBitmap(P1: JBitmap): JBitmap; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/ByteUtil')]
  JByteUtil = interface(JObject)
  ['{228F37BC-44C0-49F3-BA9F-D20C2B018208}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJByteUtil = class(TJavaGenericImport<JByteUtilClass, JByteUtil>) end;

  JCommonBitmapUtilClass = interface(JObjectClass)
  ['{266B48DA-45A0-47A3-9F0B-FA98756AB09D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCommonBitmapUtil; cdecl;
    {class} function getThreshValue(P1: JBitmap; P2: Integer; P3: Integer): Integer; cdecl;
    {class} function resizeImage(P1: JBitmap; P2: Integer; P3: Integer): JBitmap; cdecl;
    {class} procedure saveBitmap(P1: JBitmap); cdecl;
    {class} function flex(P1: JBitmap; P2: Integer; P3: Integer): JBitmap; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/CommonBitmapUtil')]
  JCommonBitmapUtil = interface(JObject)
  ['{D26B30C2-8F42-4681-8A04-6FD711B4DD3D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCommonBitmapUtil = class(TJavaGenericImport<JCommonBitmapUtilClass, JCommonBitmapUtil>) end;

  JCommonDrawClass = interface(JObjectClass)
  ['{7F1FD1BB-F426-4E12-B75D-B092C1B42876}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCommonDraw; cdecl;
    {class} procedure startPage(P1: JCanvas; P2: Integer; P3: Integer; P4: Integer); cdecl;
    {class} procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JString); cdecl; overload;
    {class} procedure drawText(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Single; P10: Byte; P11: Integer; P12: Integer; P13: Boolean; P14: JTypeface); cdecl; overload;
    {class} procedure drawBarCode(P1: JCanvas; P2: JString; P3: Integer; P4: Double; P5: Double; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: Integer; P11: Integer; P12: Integer; P13: Integer); cdecl;
    {class} function generateBarCode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): JBitmap; cdecl;
    {class} function generateEmptyBarCode(P1: JString; P2: JString; P3: Integer; P4: Double; P5: Double; P6: Integer; P7: Integer; P8: Integer): JBitmap; cdecl;
    {class} procedure drawQrCode(P1: JCanvas; P2: JString; P3: Double; P4: Double; P5: Integer; P6: Integer); cdecl;
    {class} function generateQrCode(P1: JString; P2: Integer; P3: Integer): JBitmap; cdecl;
    {class} procedure drawBitmap(P1: JCanvas; P2: JBitmap; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl;
    {class} procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer); cdecl; overload;
    {class} procedure drawLine(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer); cdecl; overload;
    {class} procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
    {class} procedure drawRectangle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
    {class} procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer; P9: Integer); cdecl; overload;
    {class} procedure drawRoundRect(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Double; P10: Integer; P11: Integer); cdecl; overload;
    {class} procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer); cdecl; overload;
    {class} procedure drawCircle(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Integer); cdecl; overload;
    {class} procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Integer); cdecl; overload;
    {class} procedure drawOval(P1: JCanvas; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double; P8: Double; P9: Integer; P10: Integer); cdecl; overload;
    {class} function endPage(P1: Integer; P2: Integer; P3: Integer): JBitmap; cdecl;
    {class} function marginError(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/CommonDraw')]
  JCommonDraw = interface(JObject)
  ['{D2ABACCB-877D-4EAD-8773-05BC8DD3306D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCommonDraw = class(TJavaGenericImport<JCommonDrawClass, JCommonDraw>) end;

  JConfigurationDevice_DeviceInfoClass = interface(JObjectClass)
  ['{FF6C9ADF-CF46-4D6A-BA2B-D8773DE734D1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JConfigurationDevice_DeviceInfo; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/ConfigurationDevice$DeviceInfo')]
  JConfigurationDevice_DeviceInfo = interface(JObject)
  ['{3FEBD0EE-39A6-4CB5-943C-B355DDB928AE}']
    { Property Methods }

    { methods }
    function getRadiationIntensity: Integer; cdecl;
    procedure setRadiationIntensity(P1: Integer); cdecl;
    function getaliveFlag: Integer; cdecl;
    procedure setaliveFlag(P1: Integer); cdecl;
    function getName: JString; cdecl;
    procedure setName(P1: JString); cdecl;
    function getIP: JString; cdecl;
    procedure setIP(P1: JString); cdecl;
    function getmacAdrress: JString; cdecl;
    procedure setmacAdrress(P1: JString); cdecl;
    function getsecurityType: Integer; cdecl;
    procedure setsecurityType(P1: Integer); cdecl;
    function getconnectedflag: Boolean; cdecl;
    procedure setconnectedflag(P1: Boolean); cdecl;

    { Property }
  end;

  TJConfigurationDevice_DeviceInfo = class(TJavaGenericImport<JConfigurationDevice_DeviceInfoClass, JConfigurationDevice_DeviceInfo>) end;

  JConfigurationDeviceClass = interface(JObjectClass)
  ['{B5622467-D546-4CCC-8759-66C087A199C7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JConfigurationDevice; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/ConfigurationDevice')]
  JConfigurationDevice = interface(JObject)
  ['{A21EA14E-291B-4AE3-95CD-A3C35C50B809}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJConfigurationDevice = class(TJavaGenericImport<JConfigurationDeviceClass, JConfigurationDevice>) end;

  JConnLogFileUtilsClass = interface(JObjectClass)
  ['{D57AE0D7-4C2F-4093-BE30-43C9AD217DE3}']
    { static Property Methods }
    {class} function _GetthreadPoolExecutor: JThreadPoolExecutor;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JConnLogFileUtils; cdecl; overload;
    {class} procedure init(P1: JContext); cdecl; overload;
    {class} procedure logSwitch(P1: Boolean); cdecl;
    {class} procedure flush; cdecl;
    {class} function getFileSize(P1: JFile): Int64; cdecl;
//    {class} function init: JConnLogFileUtils; cdecl; overload;

    { static Property }
    {class} property threadPoolExecutor: JThreadPoolExecutor read _GetthreadPoolExecutor;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/ConnLogFileUtils')]
  JConnLogFileUtils = interface(JObject)
  ['{9170F872-0CCC-4C15-AB8A-60DF059A0A5C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJConnLogFileUtils = class(TJavaGenericImport<JConnLogFileUtilsClass, JConnLogFileUtils>) end;

  JDataResloveUtilClass = interface(JObjectClass)
  ['{374A22C1-047C-4B32-9D19-D2EE9667364C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataResloveUtil; cdecl;
    {class} function getByteIndexOf(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/DataResloveUtil')]
  JDataResloveUtil = interface(JObject)
  ['{C1AB5E3C-72BC-49F4-9C9A-0AB73005306B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataResloveUtil = class(TJavaGenericImport<JDataResloveUtilClass, JDataResloveUtil>) end;

  JEncodeUtilClass = interface(JObjectClass)
  ['{D908F890-FF75-4C36-9A7D-81D3520A183F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEncodeUtil; cdecl;
    {class} function createQrCode(P1: JString; P2: Integer; P3: JBitmap): JBitmap; cdecl;
    {class} function getQrCodeStandardWidth(P1: JString): Integer; cdecl;
    {class} function createBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): JBitmap; cdecl; overload;
    {class} function createBarcode(P1: JString; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer): JBitmap; cdecl; overload;
    {class} function getBarCodeStandardWidth(P1: JString; P2: Integer): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/EncodeUtil')]
  JEncodeUtil = interface(JObject)
  ['{03B85BF6-906B-4E17-8845-B728F1A313DC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncodeUtil = class(TJavaGenericImport<JEncodeUtilClass, JEncodeUtil>) end;

  JErrorCodeUtilClass = interface(JObjectClass)
  ['{19EF05A3-CD9A-49D5-8928-58D0C721BBF1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JErrorCodeUtil; cdecl;
    {class} function errorCodeToMsg(P1: Integer): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/ErrorCodeUtil')]
  JErrorCodeUtil = interface(JObject)
  ['{40F6E2D8-5CD5-4F51-AB6C-00179C5F92CE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJErrorCodeUtil = class(TJavaGenericImport<JErrorCodeUtilClass, JErrorCodeUtil>) end;

  JFileUtilClass = interface(JObjectClass)
  ['{9E48D2EA-1F2B-466C-BC71-A84389D6A8FC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFileUtil; cdecl;
    {class} function copyAssetFile(P1: JContext; P2: JString; P3: JString; P4: JString): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/FileUtil')]
  JFileUtil = interface(JObject)
  ['{C5567E7D-DDBC-4907-97B2-66D5D0AB2722}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFileUtil = class(TJavaGenericImport<JFileUtilClass, JFileUtil>) end;

  JFirmwareFileParsingUtilClass = interface(JObjectClass)
  ['{D0F89976-B157-4B50-8A59-45137CA9E05E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFirmwareFileParsingUtil; cdecl;
    {class} function FileParsing(P1: JString): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/FirmwareFileParsingUtil')]
  JFirmwareFileParsingUtil = interface(JObject)
  ['{E15E1ABD-2447-416E-8F9A-D617BC03F469}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFirmwareFileParsingUtil = class(TJavaGenericImport<JFirmwareFileParsingUtilClass, JFirmwareFileParsingUtil>) end;

  JFontUtilClass = interface(JObjectClass)
  ['{7F560792-2698-4757-80FE-2E7F8EF610C5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFontUtil; cdecl;
    {class} function isHasFontFamilyFile(P1: JString): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/FontUtil')]
  JFontUtil = interface(JObject)
  ['{970F0607-05CB-42EB-8422-907E754837D6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFontUtil = class(TJavaGenericImport<JFontUtilClass, JFontUtil>) end;

//  JLogFileUtils_1Class = interface(JObjectClass)
//  ['{25CDFFCC-98B7-43AE-8CBF-6F777DB50DE3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Char; P2: JString; P3: JString): JLogFileUtils_1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/util/LogFileUtils$1')]
//  JLogFileUtils_1 = interface(JObject)
//  ['{D495C87E-E65C-4276-B602-BB589F8ED5A1}']
//    { Property Methods }
//    function _Getval_level: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setval_level(aval_level: Char);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getval_tag: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setval_tag(aval_tag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getval_msg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setval_msg(aval_msg: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property val_level: Char read _Getval_level write _Setval_level;
//    property val_tag: JString read _Getval_tag write _Setval_tag;
//    property val_msg: JString read _Getval_msg write _Setval_msg;
//  end;
//
//  TJLogFileUtils_1 = class(TJavaGenericImport<JLogFileUtils_1Class, JLogFileUtils_1>) end;

  JLogFileUtilsClass = interface(JObjectClass)
  ['{5C67A133-F064-4929-8775-CA20896D9C0C}']
    { static Property Methods }
    {class} function _GetthreadPoolExecutor: JThreadPoolExecutor;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JLogFileUtils; cdecl; overload;
    {class} procedure init(P1: JContext); cdecl; overload;
    {class} procedure logWriteToFileSwitch(P1: Boolean); cdecl;
    {class} procedure logSwitch(P1: Boolean); cdecl;
    {class} procedure w(P1: JString; P2: JString); cdecl;
    {class} procedure e(P1: JString; P2: JString); cdecl;
    {class} procedure d(P1: JString; P2: JString); cdecl;
    {class} procedure i(P1: JString; P2: JString); cdecl;
    {class} procedure v(P1: JString; P2: JString); cdecl;
    {class} procedure flush; cdecl;
    {class} function getFileSize(P1: JFile): Int64; cdecl;
    {class} function saveImageToGallery(P1: JBitmap): Integer; cdecl;
    {class} procedure logSendData(P1: TJavaArray<Byte>); cdecl;
    {class} procedure logReceiveData(P1: TJavaArray<Byte>); cdecl;
    {class} procedure logError(P1: Integer); cdecl;
    {class} procedure logException(P1: JException); cdecl;
//    {class} function access_000: JSimpleDateFormat; cdecl;
    {class} function access_114(P1: Int64): Int64; cdecl;
    {class} function access_200: JArrayList; cdecl;
    {class} function access_300: JBoolean; cdecl;
    {class} function access_100: Int64; cdecl;
    {class} procedure access_400; cdecl;
//    {class} function init: JLogFileUtils; cdecl; overload;

    { static Property }
    {class} property threadPoolExecutor: JThreadPoolExecutor read _GetthreadPoolExecutor;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/LogFileUtils')]
  JLogFileUtils = interface(JObject)
  ['{33B83199-2765-44CD-83F5-70EE68820994}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLogFileUtils = class(TJavaGenericImport<JLogFileUtilsClass, JLogFileUtils>) end;

  JSCCtlOps_FlagClass = interface(JObjectClass)
  ['{2FDBBED7-44CD-45D3-9686-6C95BB1A0028}']
    { static Property Methods }
    {class} function _GetVersion: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRequestFlag: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetResponseFlag: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDiscover: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSaveProf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDelProf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRenameDev: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetReturnACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCfgSuccessACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDiscoverACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSaveProfACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDelProfACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRenameDevACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCfgSuccessACKSendBack: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCfgSuccessACKFinish: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNewAPACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property Version: Integer read _GetVersion;
    {class} property RequestFlag: Integer read _GetRequestFlag;
    {class} property ResponseFlag: Integer read _GetResponseFlag;
    {class} property Discover: Integer read _GetDiscover;
    {class} property SaveProf: Integer read _GetSaveProf;
    {class} property DelProf: Integer read _GetDelProf;
    {class} property RenameDev: Integer read _GetRenameDev;
    {class} property ReturnACK: Integer read _GetReturnACK;
    {class} property CfgSuccessACK: Integer read _GetCfgSuccessACK;
    {class} property DiscoverACK: Integer read _GetDiscoverACK;
    {class} property SaveProfACK: Integer read _GetSaveProfACK;
    {class} property DelProfACK: Integer read _GetDelProfACK;
    {class} property RenameDevACK: Integer read _GetRenameDevACK;
    {class} property CfgSuccessACKSendBack: Integer read _GetCfgSuccessACKSendBack;
    {class} property CfgSuccessACKFinish: Integer read _GetCfgSuccessACKFinish;
    {class} property NewAPACK: Integer read _GetNewAPACK;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/SCCtlOps$Flag')]
  JSCCtlOps_Flag = interface(JObject)
  ['{6B670645-B60C-466A-BC04-D3F2B243A23D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCCtlOps_Flag = class(TJavaGenericImport<JSCCtlOps_FlagClass, JSCCtlOps_Flag>) end;

  JSCCtlOps_Flag_OtherClass = interface(JObjectClass)
  ['{9EED7A27-541D-4BF5-B2BB-6712B3D9CA34}']
    { static Property Methods }
    {class} function _GetSiteSurveyFinish: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property SiteSurveyFinish: Integer read _GetSiteSurveyFinish;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/SCCtlOps$Flag_Other')]
  JSCCtlOps_Flag_Other = interface(JObject)
  ['{4DB481AD-F91E-427F-9925-D2CE1C0103A9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCCtlOps_Flag_Other = class(TJavaGenericImport<JSCCtlOps_Flag_OtherClass, JSCCtlOps_Flag_Other>) end;

  JSCCtlOps_ScanACKClass = interface(JObjectClass)
  ['{37B494CB-DD92-4EB2-A655-CBFC8F27B6D0}']
    { static Property Methods }
    {class} function _GetMaxDevNum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMac: TJavaArray<TJavaArray<Byte>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStatus: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetType: TJavaArray<TJavaArray<Byte>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIPBuf: TJavaArray<TJavaArray<Byte>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIP: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNameBuf: TJavaArray<TJavaArray<Byte>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetName: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUsePin: TJavaObjectArray<JBoolean>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSCCtlOps_ScanACK; cdecl;

    { static Property }
    {class} property MaxDevNum: Integer read _GetMaxDevNum;
    {class} property Mac: TJavaArray<TJavaArray<Byte>> read _GetMac;
    {class} property Status: TJavaArray<Byte> read _GetStatus;
    {class} property &Type: TJavaArray<TJavaArray<Byte>> read _GetType;
    {class} property IPBuf: TJavaArray<TJavaArray<Byte>> read _GetIPBuf;
    {class} property IP: TJavaObjectArray<JString> read _GetIP;
    {class} property NameBuf: TJavaArray<TJavaArray<Byte>> read _GetNameBuf;
    {class} property Name: TJavaObjectArray<JString> read _GetName;
    {class} property UsePin: TJavaObjectArray<JBoolean> read _GetUsePin;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/SCCtlOps$ScanACK')]
  JSCCtlOps_ScanACK = interface(JObject)
  ['{E507038B-310F-4A7C-994A-EA22B417A2F4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCCtlOps_ScanACK = class(TJavaGenericImport<JSCCtlOps_ScanACKClass, JSCCtlOps_ScanACK>) end;

  JSCCtlOps_SoftAPMode_ParamClass = interface(JObjectClass)
  ['{E11D9877-E43D-407E-B299-B065DC56E148}']
    { static Property Methods }
    {class} function _GetCfgDUTNum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMaxDUT_AP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getparam_SSID: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getparam_BSSID: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSCCtlOps_SoftAPMode_Param; cdecl;

    { static Property }
    {class} property CfgDUTNum: Integer read _GetCfgDUTNum;
    {class} property MaxDUT_AP: Integer read _GetMaxDUT_AP;
    {class} property param_SSID: TJavaObjectArray<JString> read _Getparam_SSID;
    {class} property param_BSSID: TJavaObjectArray<JString> read _Getparam_BSSID;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/SCCtlOps$SoftAPMode_Param')]
  JSCCtlOps_SoftAPMode_Param = interface(JObject)
  ['{683EE533-7570-4FFD-BD86-9259F793C40B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCCtlOps_SoftAPMode_Param = class(TJavaGenericImport<JSCCtlOps_SoftAPMode_ParamClass, JSCCtlOps_SoftAPMode_Param>) end;

  JSCCtlOpsClass = interface(JObjectClass)
  ['{0B812A55-A84B-4D36-A0DB-E2FB14660300}']
    { static Property Methods }
    {class} function _GetIsOpenNetwork: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetConnectedSSID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetConnectedPasswd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetConnectedBSSID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStoredPasswd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetisHiddenSSID: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetaddNewNetwork: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetreBuiltScanResult: JScanResult;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_CLIENTS_NUM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDiscoveredNew: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSetAble: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_CONFIG_NUM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSCCtlOps; cdecl; overload;
    {class} function rtk_sc_gen_digest(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} procedure rtk_sc_control_reset; cdecl;
    {class} function rtk_sc_gen_discover_packet(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function rtk_sc_gen_control_packet(P1: Integer; P2: JString; P3: JString; P4: JString): TJavaArray<Byte>; cdecl;
    {class} function rtk_sc_gen_control_confirm_packet(P1: Integer; P2: JString; P3: JString): TJavaArray<Byte>; cdecl;
    {class} function handle_discover_ack(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function rtk_sc_get_discovered_dev_num: Integer; cdecl;
    {class} function rtk_sc_get_discovered_dev_info(P1: JList): Integer; cdecl;
    {class} procedure exceptionAction; cdecl;
//    {class} function init: JSCCtlOps; cdecl; overload;

    { static Property }
    {class} property IsOpenNetwork: Boolean read _GetIsOpenNetwork;
    {class} property ConnectedSSID: JString read _GetConnectedSSID;
    {class} property ConnectedPasswd: JString read _GetConnectedPasswd;
    {class} property ConnectedBSSID: JString read _GetConnectedBSSID;
    {class} property StoredPasswd: JString read _GetStoredPasswd;
    {class} property isHiddenSSID: Boolean read _GetisHiddenSSID;
    {class} property addNewNetwork: Boolean read _GetaddNewNetwork;
//    {class} property reBuiltScanResult: JScanResult read _GetreBuiltScanResult;
    {class} property MAX_CLIENTS_NUM: Integer read _GetMAX_CLIENTS_NUM;
    {class} property DiscoveredNew: Boolean read _GetDiscoveredNew;
    {class} property SetAble: Boolean read _GetSetAble;
    {class} property MAX_CONFIG_NUM: Integer read _GetMAX_CONFIG_NUM;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/SCCtlOps')]
  JSCCtlOps = interface(JObject)
  ['{F81FA27B-6641-4EB9-9731-B9B66C96C951}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCCtlOps = class(TJavaGenericImport<JSCCtlOpsClass, JSCCtlOps>) end;

  JTestDataClass = interface(JObjectClass)
  ['{A228BD7F-2B47-49A5-A1D7-AE2CDA17BF38}']
    { static Property Methods }
    {class} function _GettestPrintData: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JTestData; cdecl;

    { static Property }
    {class} property testPrintData: TJavaArray<Byte> read _GettestPrintData;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/TestData')]
  JTestData = interface(JObject)
  ['{219406B1-DBAB-42CB-B56F-F1382BDA8CB4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTestData = class(TJavaGenericImport<JTestDataClass, JTestData>) end;

//  JThreadUtil_1Class = interface(JObjectClass)
//  ['{F2DB172D-1002-403B-854A-FE03795FB5A4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JThreadUtil_1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/util/ThreadUtil$1')]
//  JThreadUtil_1 = interface(JObject)
//  ['{E5B9866C-9AB3-4CB4-A7B7-E5A3BD786B27}']
//    { Property Methods }
//
//    { methods }
//    function newThread(P1: JRunnable): JThread; cdecl;
//
//    { Property }
//  end;
//
//  TJThreadUtil_1 = class(TJavaGenericImport<JThreadUtil_1Class, JThreadUtil_1>) end;

//  JThreadUtil_2Class = interface(JObjectClass)
//  ['{BEB127B5-D6E6-431E-94A4-98181AE58314}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): JThreadUtil_2; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/util/ThreadUtil$2')]
//  JThreadUtil_2 = interface(JObject)
//  ['{A31A9E4D-87E1-4DBC-80C8-7E525A2F5F3C}']
//    { Property Methods }
//    function _Getval_threadName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setval_threadName(aval_threadName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function newThread(P1: JRunnable): JThread; cdecl;
//
//    { Property }
//    property val_threadName: JString read _Getval_threadName write _Setval_threadName;
//  end;
//
//  TJThreadUtil_2 = class(TJavaGenericImport<JThreadUtil_2Class, JThreadUtil_2>) end;

//  JThreadUtil_3Class = interface(JThreadPoolExecutorClass) // or JObjectClass
//  ['{ECA7FFBA-239B-4ADE-9842-A918624E1E38}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: Int64; P4: JTimeUnit; P5: JBlockingQueue; P6: JThreadFactory): JThreadUtil_3; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/util/ThreadUtil$3')]
//  JThreadUtil_3 = interface(JThreadPoolExecutor) // or JObject
//  ['{446EE522-C80B-4413-91D7-4CEF042F9184}']
//    { Property Methods }
//
//    { methods }
//    procedure afterExecute(P1: JRunnable; P2: JThrowable); cdecl;
//
//    { Property }
//  end;
//
//  TJThreadUtil_3 = class(TJavaGenericImport<JThreadUtil_3Class, JThreadUtil_3>) end;

  JThreadUtilClass = interface(JObjectClass)
  ['{C9F92266-1423-405F-9ACF-D6E7D7FCD101}']
    { static Property Methods }

    { static Methods }
    {class} function init: JThreadUtil; cdecl;
    {class} function getSingleThreadPool: JThreadPoolExecutor; cdecl; overload;
    {class} function getSingleThreadPool(P1: JString): JThreadPoolExecutor; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/ThreadUtil')]
  JThreadUtil = interface(JObject)
  ['{689D11DE-970E-48D3-8346-3EFB33F3D048}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJThreadUtil = class(TJavaGenericImport<JThreadUtilClass, JThreadUtil>) end;

  JUnitConversionUtilClass = interface(JObjectClass)
  ['{135B3FF9-698C-478F-9C75-48CCACF254B3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnitConversionUtil; cdecl;
    {class} function mm2pix(P1: Double; P2: Integer): Integer; cdecl;
    {class} function pix2mm(P1: Integer; P2: Integer): Double; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/UnitConversionUtil')]
  JUnitConversionUtil = interface(JObject)
  ['{FAF2A683-CFAA-4059-8CE2-7B3D6201D65D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUnitConversionUtil = class(TJavaGenericImport<JUnitConversionUtilClass, JUnitConversionUtil>) end;

  JWifiSupportClass = interface(JObjectClass)
  ['{220C2895-7603-4D15-B2AA-957B5527DB2F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWifiSupport; cdecl;
    {class} function isWifiEnable(P1: JContext): Boolean; cdecl;
//    {class} function getActiveNetwork(P1: JContext): JNetworkInfo; cdecl;
    {class} procedure openWifi(P1: JContext); cdecl;
    {class} function isOpenWifi(P1: JApplication): Boolean; cdecl;
    {class} function isGpsOpen(P1: JContext): Boolean; cdecl;
    {class} procedure openGps(P1: JContext); cdecl;
    {class} function getIpAddressString: JString; cdecl;
    {class} function getBroadcast: JString; cdecl;
    {class} function isWifi5G(P1: JContext): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/util/WifiSupport')]
  JWifiSupport = interface(JObject)
  ['{4CEA2BB2-8460-4FB5-813F-C2F5AB2A8B15}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWifiSupport = class(TJavaGenericImport<JWifiSupportClass, JWifiSupport>) end;

//  Jv_402Class = interface(Ja_233Class) // or JObjectClass
//  ['{CFCB9155-AB98-4DB8-B46A-E8F1CD26D09D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jv_402; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/v')]
//  Jv_402 = interface(Ja_233) // or JObject
//  ['{FB6B02D1-1A1A-4D78-B1A2-425789BC0F47}']
//    { Property Methods }
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//  end;
//
//  TJv_402 = class(TJavaGenericImport<Jv_402Class, Jv_402>) end;

//  Jv0_aClass = interface(JObjectClass)
//  ['{C3CC4429-AC63-4877-A1AE-BBC22A35F9DC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: Integer): Boolean; cdecl;
//    {class} function a(P1: Integer): Boolean; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/v0$a')]
//  Jv0_a = interface(JObject)
//  ['{076CA320-F381-4217-BC1A-C9F2285C272C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJv0_a = class(TJavaGenericImport<Jv0_aClass, Jv0_a>) end;

//  Jv0Class = interface(JObjectClass)
//  ['{E84BEB98-F259-47EA-BD8C-DF09A1649D5C}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getq: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gets: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gett: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getu: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getv: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getw: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getx: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gety: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getz: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetA: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetB: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetC: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetD: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetE: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetF: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetG: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetH: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetI: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetJ: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetK: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetL: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetM: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetN: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetO: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetP: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetQ: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetR: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetS: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetT: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetU: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetV: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetW: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetX: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetY: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetZ: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geta0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getq0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gets0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gett0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getu0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getv0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getw0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getx0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gety0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getz0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetA0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetB0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetC0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetD0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetE0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetF0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetG0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetH0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetI0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetJ0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetK0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetL0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetM0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetN0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetO0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetP0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetQ0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetR0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetS0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetT0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetU0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetV0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetW0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetX0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetY0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetZ0: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geta1: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb1: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc1: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd1: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete1: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf1: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg1: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jv0; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: Integer read _Getc;
//    {class} property d: Integer read _Getd;
//    {class} property e: Integer read _Gete;
//    {class} property f: Integer read _Getf;
//    {class} property g: Boolean read _Getg;
//    {class} property h: TJavaArray<Byte> read _Geth;
//    {class} property i: TJavaArray<Byte> read _Geti;
//    {class} property j: TJavaArray<Byte> read _Getj;
//    {class} property k: TJavaArray<Byte> read _Getk;
//    {class} property l: TJavaArray<Byte> read _Getl;
//    {class} property m: TJavaArray<Byte> read _Getm;
//    {class} property n: TJavaArray<Byte> read _Getn;
//    {class} property o: TJavaArray<Byte> read _Geto;
//    {class} property p: TJavaArray<Byte> read _Getp;
//    {class} property q: TJavaArray<Byte> read _Getq;
//    {class} property r: TJavaArray<Byte> read _Getr;
//    {class} property s: TJavaArray<Byte> read _Gets;
//    {class} property t: TJavaArray<Byte> read _Gett;
//    {class} property u: TJavaArray<Byte> read _Getu;
//    {class} property v: TJavaArray<Byte> read _Getv;
//    {class} property w: TJavaArray<Byte> read _Getw;
//    {class} property x: TJavaArray<Byte> read _Getx;
//    {class} property y: TJavaArray<Byte> read _Gety;
//    {class} property z: TJavaArray<Byte> read _Getz;
//    {class} property A: TJavaArray<Byte> read _GetA;
//    {class} property B: TJavaArray<Byte> read _GetB;
//    {class} property C: TJavaArray<Byte> read _GetC;
//    {class} property D: TJavaArray<Byte> read _GetD;
//    {class} property E: TJavaArray<Byte> read _GetE;
//    {class} property F: TJavaArray<Byte> read _GetF;
//    {class} property G: TJavaArray<Byte> read _GetG;
//    {class} property H: TJavaArray<Byte> read _GetH;
//    {class} property I: TJavaArray<Byte> read _GetI;
//    {class} property J: TJavaArray<Byte> read _GetJ;
//    {class} property K: TJavaArray<Byte> read _GetK;
//    {class} property L: TJavaArray<Byte> read _GetL;
//    {class} property M: TJavaArray<Byte> read _GetM;
//    {class} property N: TJavaArray<Byte> read _GetN;
//    {class} property O: TJavaArray<Byte> read _GetO;
//    {class} property P: TJavaArray<Byte> read _GetP;
//    {class} property Q: TJavaArray<Byte> read _GetQ;
//    {class} property R: TJavaArray<Byte> read _GetR;
//    {class} property S: TJavaArray<Byte> read _GetS;
//    {class} property T: TJavaArray<Byte> read _GetT;
//    {class} property U: TJavaArray<Byte> read _GetU;
//    {class} property V: TJavaArray<Byte> read _GetV;
//    {class} property W: TJavaArray<Byte> read _GetW;
//    {class} property X: TJavaArray<Byte> read _GetX;
//    {class} property Y: TJavaArray<Byte> read _GetY;
//    {class} property Z: TJavaArray<Byte> read _GetZ;
//    {class} property a0: TJavaArray<Byte> read _Geta0;
//    {class} property b0: TJavaArray<Byte> read _Getb0;
//    {class} property c0: TJavaArray<Byte> read _Getc0;
//    {class} property d0: TJavaArray<Byte> read _Getd0;
//    {class} property e0: TJavaArray<Byte> read _Gete0;
//    {class} property f0: TJavaArray<Byte> read _Getf0;
//    {class} property g0: TJavaArray<Byte> read _Getg0;
//    {class} property h0: TJavaArray<Byte> read _Geth0;
//    {class} property i0: TJavaArray<Byte> read _Geti0;
//    {class} property j0: TJavaArray<Byte> read _Getj0;
//    {class} property k0: TJavaArray<Byte> read _Getk0;
//    {class} property l0: TJavaArray<Byte> read _Getl0;
//    {class} property m0: TJavaArray<Byte> read _Getm0;
//    {class} property n0: TJavaArray<Byte> read _Getn0;
//    {class} property o0: TJavaArray<Byte> read _Geto0;
//    {class} property p0: TJavaArray<Byte> read _Getp0;
//    {class} property q0: TJavaArray<Byte> read _Getq0;
//    {class} property r0: TJavaArray<Byte> read _Getr0;
//    {class} property s0: TJavaArray<Byte> read _Gets0;
//    {class} property t0: TJavaArray<Byte> read _Gett0;
//    {class} property u0: TJavaArray<Byte> read _Getu0;
//    {class} property v0: TJavaArray<Byte> read _Getv0;
//    {class} property w0: TJavaArray<Byte> read _Getw0;
//    {class} property x0: TJavaArray<Byte> read _Getx0;
//    {class} property y0: TJavaArray<Byte> read _Gety0;
//    {class} property z0: TJavaArray<Byte> read _Getz0;
//    {class} property A0: TJavaArray<Byte> read _GetA0;
//    {class} property B0: TJavaArray<Byte> read _GetB0;
//    {class} property C0: TJavaArray<Byte> read _GetC0;
//    {class} property D0: TJavaArray<Byte> read _GetD0;
//    {class} property E0: TJavaArray<Byte> read _GetE0;
//    {class} property F0: TJavaArray<Byte> read _GetF0;
//    {class} property G0: TJavaArray<Byte> read _GetG0;
//    {class} property H0: TJavaArray<Byte> read _GetH0;
//    {class} property I0: TJavaArray<Byte> read _GetI0;
//    {class} property J0: TJavaArray<Byte> read _GetJ0;
//    {class} property K0: TJavaArray<Byte> read _GetK0;
//    {class} property L0: TJavaArray<Byte> read _GetL0;
//    {class} property M0: TJavaArray<Byte> read _GetM0;
//    {class} property N0: TJavaArray<Byte> read _GetN0;
//    {class} property O0: TJavaArray<Byte> read _GetO0;
//    {class} property P0: TJavaArray<Byte> read _GetP0;
//    {class} property Q0: TJavaArray<Byte> read _GetQ0;
//    {class} property R0: TJavaArray<Byte> read _GetR0;
//    {class} property S0: TJavaArray<Byte> read _GetS0;
//    {class} property T0: TJavaArray<Byte> read _GetT0;
//    {class} property U0: TJavaArray<Byte> read _GetU0;
//    {class} property V0: TJavaArray<Byte> read _GetV0;
//    {class} property W0: TJavaArray<Byte> read _GetW0;
//    {class} property X0: TJavaArray<Byte> read _GetX0;
//    {class} property Y0: TJavaArray<Byte> read _GetY0;
//    {class} property Z0: TJavaArray<Byte> read _GetZ0;
//    {class} property a1: TJavaArray<Byte> read _Geta1;
//    {class} property b1: TJavaArray<Byte> read _Getb1;
//    {class} property c1: TJavaArray<Byte> read _Getc1;
//    {class} property d1: TJavaArray<Byte> read _Getd1;
//    {class} property e1: TJavaArray<Byte> read _Gete1;
//    {class} property f1: TJavaArray<Byte> read _Getf1;
//    {class} property g1: TJavaArray<Byte> read _Getg1;
//    {class} property h1: Integer read _Geth1;
//    {class} property i1: Integer read _Geti1;
//    {class} property j1: Integer read _Getj1;
//    {class} property k1: Integer read _Getk1;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/v0')]
//  Jv0 = interface(JObject)
//  ['{B1A1513D-5E05-4C01-B5C7-5244C3CD504B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJv0 = class(TJavaGenericImport<Jv0Class, Jv0>) end;

//  Jv1Class = interface(JThreadClass) // or JObjectClass
//  ['{D97064CE-AF2F-4DB1-95C3-9F1A1591110E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb; P2: JCallback; P3: TJavaArray<Byte>; P4: Integer): Jv1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/v1')]
//  Jv1 = interface(JThread) // or JObject
//  ['{A7356DC7-0F08-42B4-914B-654351FB40A1}']
//    { Property Methods }
//    function _Geta: JCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jb);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure run; cdecl;
//    function a: Boolean; cdecl; overload;
//    procedure c(P1: JCallback); cdecl;
//    procedure a(P1: JCallback); cdecl; overload;
//    procedure b; cdecl; overload;
//    procedure b(P1: JCallback); cdecl; overload;
//
//    { Property }
//    property a: JCallback read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Jb read _Gete write _Sete;
//    property f: TJavaArray<Byte> read _Getf write _Setf;
//  end;
//
//  TJv1 = class(TJavaGenericImport<Jv1Class, Jv1>) end;

//  Jw0Class = interface(Jh1Class) // or JObjectClass
//  ['{586FD16C-1029-4504-B583-B3F2B2A1D4E4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jw0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/w0')]
//  Jw0 = interface(Jh1) // or JObject
//  ['{3CE893D2-2A58-49ED-98A4-763E8845E4D4}']
//    { Property Methods }
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//  end;
//
//  TJw0 = class(TJavaGenericImport<Jw0Class, Jw0>) end;

//  Jw1Class = interface(JObjectClass)
//  ['{DDB21845-4D74-4B2A-AF9D-76EF54B67546}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/w1')]
//  Jw1 = interface(IJavaInstance)
//  ['{76C5B8FF-C502-47B7-B7B4-778C2FE327C5}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString; P2: JString); cdecl;
//
//    { Property }
//  end;
//
//  TJw1 = class(TJavaGenericImport<Jw1Class, Jw1>) end;

//  Jx0Class = interface(Je_279Class) // or JObjectClass
//  ['{B6F4CB92-1D4E-4728-8B64-1695B8F4D9D8}']
//    { static Property Methods }
//    {class} function _Getv: Jx0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jx0; cdecl;
//    {class} function p: Jx0; cdecl;
//
//    { static Property }
//    {class} property v: Jx0 read _Getv;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/x0')]
//  Jx0 = interface(Je_279) // or JObject
//  ['{0F710778-E158-4E59-9047-71DC98BB4376}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jc); cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJx0 = class(TJavaGenericImport<Jx0Class, Jx0>) end;

//  Jy0Class = interface(Jj1Class) // or JObjectClass
//  ['{F7C60A33-2C0B-45CD-9107-14C09A6C5C1F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jy0; cdecl;
//    {class} function m: Jj1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/y0')]
//  Jy0 = interface(Jj1) // or JObject
//  ['{811E5E86-6A44-4CEC-9E60-A7B461C6E78A}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jc); cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Double; P4: Double): TJavaArray<Integer>; cdecl; overload;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJy0 = class(TJavaGenericImport<Jy0Class, Jy0>) end;

//  Jy1Class = interface(JObjectClass)
//  ['{00C1622D-50AE-4E26-BC7D-9448EBF8218F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Byte; P2: TJavaArray<Byte>): Jy1; cdecl;
//    {class} function a(P1: TJavaArray<Byte>): TJavaObjectArray<Jy1>; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/y1')]
//  Jy1 = interface(JObject)
//  ['{DC367CD4-CC39-4BAF-BEA5-CBBD0F54B811}']
//    { Property Methods }
//    function _Geta: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: Byte read _Geta write _Seta;
//    property b: TJavaArray<Byte> read _Getb write _Setb;
//  end;
//
//  TJy1 = class(TJavaGenericImport<Jy1Class, Jy1>) end;

//  Jz_415Class = interface(Ja_233Class) // or JObjectClass
//  ['{53421A73-BE67-4FE3-9B13-1B71391E0186}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jz_415; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/z')]
//  Jz_415 = interface(Ja_233) // or JObject
//  ['{3B103572-D5B2-43EA-B3D6-C41A5A0D5E32}']
//    { Property Methods }
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//  end;
//
//  TJz_415 = class(TJavaGenericImport<Jz_415Class, Jz_415>) end;

//  Jz0Class = interface(Jk1Class) // or JObjectClass
//  ['{8A7C18E4-30C6-43DE-A03F-31A15D8FB86E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jz0; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/z0')]
//  Jz0 = interface(Jk1) // or JObject
//  ['{3528C7AC-7A36-44C0-9F7F-613B477D758C}']
//    { Property Methods }
//
//    { methods }
//    function getPrinterSn(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getPrinterRfidParameter(P1: JOutputStream; P2: JInputStream; P3: JCallback; P4: JString): JHashMap; cdecl;
//    function getPrintingHistory(P1: JOutputStream; P2: JInputStream; P3: JCallback): JHashMap; cdecl;
//    function isSupportGetPrinterHistory: Boolean; cdecl;
//    function isSupportGetPrinterSuccessRfid: Boolean; cdecl;
//    function getPrinterBluetoothAddress(P1: JOutputStream; P2: JInputStream; P3: JCallback): JString; cdecl;
//    function getLabelType(P1: JOutputStream; P2: JInputStream; P3: JCallback): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJz0 = class(TJavaGenericImport<Jz0Class, Jz0>) end;

//  Jz1Class = interface(Jc_258Class) // or JObjectClass
//  ['{D0AC1FE3-CBB7-4577-A6B8-D90D0FAD3C1B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jz1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/z1')]
//  Jz1 = interface(Jc_258) // or JObject
//  ['{897FDD74-D866-486F-8F9C-F1F5DB041934}']
//    { Property Methods }
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function c: JPrinterInfoSetter; cdecl;
//    function b: JPrinterInfoGetter; cdecl;
//    function a: JPrintTask; cdecl;
//
//    { Property }
//    property b: Integer read _Getb write _Setb;
//  end;
//
//  TJz1 = class(TJavaGenericImport<Jz1Class, Jz1>) end;

  JDetectorResultClass = interface(JObjectClass)
  ['{E94855E3-FFCC-407E-825A-9021F2D0A89D}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitMatrix; P2: TJavaObjectArray<JResultPoint>): JDetectorResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/DetectorResult')]
  JDetectorResult = interface(JObject)
  ['{C5A4CBD3-FCEC-465B-8BF0-51D02A5F5B1C}']
    { Property Methods }

    { methods }
    function getBits: JBitMatrix; cdecl;
    function getPoints: TJavaObjectArray<JResultPoint>; cdecl;

    { Property }
  end;

  TJDetectorResult = class(TJavaGenericImport<JDetectorResultClass, JDetectorResult>) end;

  JAztecDetectorResultClass = interface(JDetectorResultClass) // or JObjectClass
  ['{ED989F5B-46FF-4E09-8A3E-F5FCD9DC1F4F}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitMatrix; P2: TJavaObjectArray<JResultPoint>; P3: Boolean; P4: Integer; P5: Integer): JAztecDetectorResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/AztecDetectorResult')]
  JAztecDetectorResult = interface(JDetectorResult) // or JObject
  ['{48A35278-ECAC-409A-9092-FCAFCD52CF45}']
    { Property Methods }

    { methods }
    function getNbLayers: Integer; cdecl;
    function getNbDatablocks: Integer; cdecl;
    function isCompact: Boolean; cdecl;

    { Property }
  end;

  TJAztecDetectorResult = class(TJavaGenericImport<JAztecDetectorResultClass, JAztecDetectorResult>) end;

  JAztecReaderClass = interface(JObjectClass)
  ['{464900E6-8694-443C-8550-00D4469F7094}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAztecReader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/AztecReader')]
  JAztecReader = interface(JObject)
  ['{322CEB5C-58AD-497D-B734-50CC481F0E12}']
    { Property Methods }

    { methods }
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload;
    procedure reset; cdecl;

    { Property }
  end;

  TJAztecReader = class(TJavaGenericImport<JAztecReaderClass, JAztecReader>) end;

  JAztecWriterClass = interface(JObjectClass)
  ['{0737BF38-AA9F-4409-9DCB-3DAC7B238AD5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAztecWriter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/AztecWriter')]
  JAztecWriter = interface(JObject)
  ['{036500E9-7D07-4C1B-9BB9-EA96C2648AE7}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer): JBitMatrix; cdecl; overload;
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;

    { Property }
  end;

  TJAztecWriter = class(TJavaGenericImport<JAztecWriterClass, JAztecWriter>) end;

//  JDecoder_1Class = interface(JObjectClass)
//  ['{859779DD-DD63-4986-8E52-F2CD6FB49490}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_aztec_decoder_Decoder_Table: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JDecoder_1; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_gengcon_www_jcprintersdk_zxing_aztec_decoder_Decoder_Table: TJavaArray<Integer> read _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_aztec_decoder_Decoder_Table;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/decoder/Decoder$1')]
//  JDecoder_1 = interface(JObject)
//  ['{E8643B2D-3747-4FD7-AE73-7E388314F8EA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDecoder_1 = class(TJavaGenericImport<JDecoder_1Class, JDecoder_1>) end;

  JDecoder_TableClass = interface(JEnumClass) // or JObjectClass
  ['{0C9229A3-2CC3-4214-A60E-042DD4DA3B25}']
    { static Property Methods }
    {class} function _GetUPPER: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOWER: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIXED: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDIGIT: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPUNCT: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBINARY: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDecoder_Table>; cdecl;
    {class} function valueOf(P1: JString): JDecoder_Table; cdecl;
    {class} function init: JDecoder_Table; cdecl;

    { static Property }
    {class} property UPPER: JDecoder_Table read _GetUPPER;
    {class} property LOWER: JDecoder_Table read _GetLOWER;
    {class} property MIXED: JDecoder_Table read _GetMIXED;
    {class} property DIGIT: JDecoder_Table read _GetDIGIT;
    {class} property PUNCT: JDecoder_Table read _GetPUNCT;
    {class} property BINARY: JDecoder_Table read _GetBINARY;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/decoder/Decoder$Table')]
  JDecoder_Table = interface(JEnum) // or JObject
  ['{198EFD33-D1DC-4CF1-AB93-2E1D05B24A77}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecoder_Table = class(TJavaGenericImport<JDecoder_TableClass, JDecoder_Table>) end;

  JDecoderClass = interface(JObjectClass)
  ['{9324E1DB-B5B8-417D-81C5-3029FE9DD06E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDecoder; cdecl; overload;
    {class} function highLevelDecode(P1: TJavaArray<Boolean>): JString; cdecl;
    {class} function convertBoolArrayToByteArray(P1: TJavaArray<Boolean>): TJavaArray<Byte>; cdecl;
//    {class} function init: JDecoder; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/decoder/Decoder')]
  JDecoder = interface(JObject)
  ['{72321F1A-481B-467E-98AE-B0583450D21A}']
    { Property Methods }

    { methods }
    function decode(P1: JAztecDetectorResult): JDecoderResult; cdecl;

    { Property }
  end;

  TJDecoder = class(TJavaGenericImport<JDecoderClass, JDecoder>) end;

  JDetector_PointClass = interface(JObjectClass)
  ['{73518294-8F47-476C-AF45-C49D8DF75362}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer): JDetector_Point; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/detector/Detector$Point')]
  JDetector_Point = interface(JObject)
  ['{7D44A3E1-169A-4404-98E3-9AF610222706}']
    { Property Methods }

    { methods }
    function toResultPoint: JResultPoint; cdecl;
    function getX: Integer; cdecl;
    function getY: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJDetector_Point = class(TJavaGenericImport<JDetector_PointClass, JDetector_Point>) end;

  JDetectorClass = interface(JObjectClass)
  ['{99E919DD-E129-4714-B99F-7EB413F00F18}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitMatrix): JDetector; cdecl; overload;
    {class} function init: JDetector; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/detector/Detector')]
  JDetector = interface(JObject)
  ['{708C5ABB-1693-4DD0-A8EF-3CDCAFED57F1}']
    { Property Methods }

    { methods }
    function detect: JAztecDetectorResult; cdecl; overload;
    function detect(P1: Boolean): JAztecDetectorResult; cdecl; overload;

    { Property }
  end;

  TJDetector = class(TJavaGenericImport<JDetectorClass, JDetector>) end;

  JAztecCodeClass = interface(JObjectClass)
  ['{6FCA33D0-399F-4361-A87B-7F42E0C490AC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAztecCode; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/encoder/AztecCode')]
  JAztecCode = interface(JObject)
  ['{D001312A-BB65-4513-B3DB-696305F44580}']
    { Property Methods }

    { methods }
    function isCompact: Boolean; cdecl;
    procedure setCompact(P1: Boolean); cdecl;
    function getSize: Integer; cdecl;
    procedure setSize(P1: Integer); cdecl;
    function getLayers: Integer; cdecl;
    procedure setLayers(P1: Integer); cdecl;
    function getCodeWords: Integer; cdecl;
    procedure setCodeWords(P1: Integer); cdecl;
    function getMatrix: JBitMatrix; cdecl;
    procedure setMatrix(P1: JBitMatrix); cdecl;

    { Property }
  end;

  TJAztecCode = class(TJavaGenericImport<JAztecCodeClass, JAztecCode>) end;

  JTokenClass = interface(JObjectClass)
  ['{FD703968-C590-4D23-B064-7C6AC08EDB78}']
    { static Property Methods }
    {class} function _GetEMPTY: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JToken): JToken; cdecl; overload;
    {class} function init: JToken; cdecl; overload;

    { static Property }
    {class} property EMPTY: JToken read _GetEMPTY;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/encoder/Token')]
  JToken = interface(JObject)
  ['{86374916-D4BD-4A23-8C75-C430538E8EC4}']
    { Property Methods }

    { methods }
    function getPrevious: JToken; cdecl;
    function add(P1: Integer; P2: Integer): JToken; cdecl;
    function addBinaryShift(P1: Integer; P2: Integer): JToken; cdecl;
    procedure appendTo(P1: JBitArray; P2: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJToken = class(TJavaGenericImport<JTokenClass, JToken>) end;

  JBinaryShiftTokenClass = interface(JTokenClass) // or JObjectClass
  ['{47FB6571-525C-4624-A3CF-074C260D1BB7}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JToken; P2: Integer; P3: Integer): JBinaryShiftToken; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/encoder/BinaryShiftToken')]
  JBinaryShiftToken = interface(JToken) // or JObject
  ['{B7D33670-DA32-477B-A263-1F0348717DE2}']
    { Property Methods }

    { methods }
    procedure appendTo(P1: JBitArray; P2: TJavaArray<Byte>); cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJBinaryShiftToken = class(TJavaGenericImport<JBinaryShiftTokenClass, JBinaryShiftToken>) end;

  JEncoderClass = interface(JObjectClass)
  ['{54A37C07-499A-4CEF-B219-60D7F7BFAC2D}']
    { static Property Methods }
    {class} function _GetDEFAULT_EC_PERCENT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT_AZTEC_LAYERS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function encode(P1: TJavaArray<Byte>): JAztecCode; cdecl; overload;
    {class} function encode(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JAztecCode; cdecl; overload;
    {class} function generateModeMessage(P1: Boolean; P2: Integer; P3: Integer): JBitArray; cdecl;
    {class} function stuffBits(P1: JBitArray; P2: Integer): JBitArray; cdecl;
    {class} function init: JEncoder; cdecl;

    { static Property }
    {class} property DEFAULT_EC_PERCENT: Integer read _GetDEFAULT_EC_PERCENT;
    {class} property DEFAULT_AZTEC_LAYERS: Integer read _GetDEFAULT_AZTEC_LAYERS;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/encoder/Encoder')]
  JEncoder = interface(JObject)
  ['{76607F3C-76EE-4D6E-80D8-E4944E453FFF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncoder = class(TJavaGenericImport<JEncoderClass, JEncoder>) end;

//  JHighLevelEncoder_1Class = interface(JObjectClass)
//  ['{F9C1414C-E25E-4464-B9F4-C6820CEA372C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHighLevelEncoder): JHighLevelEncoder_1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/encoder/HighLevelEncoder$1')]
//  JHighLevelEncoder_1 = interface(JObject)
//  ['{8FF51CDE-561B-41F3-A226-F000985D8789}']
//    { Property Methods }
//    function _Getthis_0: JHighLevelEncoder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setthis_0(athis_0: JHighLevelEncoder);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function compare(P1: JState; P2: JState): Integer; cdecl; overload;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload;
//
//    { Property }
//    property this_0: JHighLevelEncoder read _Getthis_0 write _Setthis_0;
//  end;
//
//  TJHighLevelEncoder_1 = class(TJavaGenericImport<JHighLevelEncoder_1Class, JHighLevelEncoder_1>) end;

  JHighLevelEncoderClass = interface(JObjectClass)
  ['{53CA8368-F727-4B7D-BDA0-785A23A0BAA0}']
    { static Property Methods }
    {class} function _GetMODE_NAMES: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_UPPER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_LOWER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_DIGIT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_MIXED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_PUNCT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLATCH_TABLE: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSHIFT_TABLE: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: TJavaArray<Byte>): JHighLevelEncoder; cdecl; overload;
    {class} function init: JHighLevelEncoder; cdecl; overload;

    { static Property }
    {class} property MODE_NAMES: TJavaObjectArray<JString> read _GetMODE_NAMES;
    {class} property MODE_UPPER: Integer read _GetMODE_UPPER;
    {class} property MODE_LOWER: Integer read _GetMODE_LOWER;
    {class} property MODE_DIGIT: Integer read _GetMODE_DIGIT;
    {class} property MODE_MIXED: Integer read _GetMODE_MIXED;
    {class} property MODE_PUNCT: Integer read _GetMODE_PUNCT;
    {class} property LATCH_TABLE: TJavaArray<TJavaArray<Integer>> read _GetLATCH_TABLE;
    {class} property SHIFT_TABLE: TJavaArray<TJavaArray<Integer>> read _GetSHIFT_TABLE;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/encoder/HighLevelEncoder')]
  JHighLevelEncoder = interface(JObject)
  ['{C23C5E5F-B923-4119-85AA-7FD561A24F32}']
    { Property Methods }

    { methods }
    function encode: JBitArray; cdecl;

    { Property }
  end;

  TJHighLevelEncoder = class(TJavaGenericImport<JHighLevelEncoderClass, JHighLevelEncoder>) end;

  JSimpleTokenClass = interface(JTokenClass) // or JObjectClass
  ['{4385F684-6040-477E-B4A5-E41168C9202B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JToken; P2: Integer; P3: Integer): JSimpleToken; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/encoder/SimpleToken')]
  JSimpleToken = interface(JToken) // or JObject
  ['{C6B8D294-605C-4E48-ACB5-F68234893B9D}']
    { Property Methods }

    { methods }
    procedure appendTo(P1: JBitArray; P2: TJavaArray<Byte>); cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJSimpleToken = class(TJavaGenericImport<JSimpleTokenClass, JSimpleToken>) end;

  JStateClass = interface(JObjectClass)
  ['{C2511C73-5D37-4E6B-86BA-A87EAE027AE1}']
    { static Property Methods }
    {class} function _GetINITIAL_STATE: JState;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JState; cdecl;

    { static Property }
    {class} property INITIAL_STATE: JState read _GetINITIAL_STATE;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/aztec/encoder/State')]
  JState = interface(JObject)
  ['{5DC18F3F-3CCF-4ECC-A5FD-5877F4E42AA0}']
    { Property Methods }

    { methods }
    function getMode: Integer; cdecl;
    function getToken: JToken; cdecl;
    function getBinaryShiftByteCount: Integer; cdecl;
    function getBitCount: Integer; cdecl;
    function latchAndAppend(P1: Integer; P2: Integer): JState; cdecl;
    function shiftAndAppend(P1: Integer; P2: Integer): JState; cdecl;
    function addBinaryShiftChar(P1: Integer): JState; cdecl;
    function endBinaryShift(P1: Integer): JState; cdecl;
    function isBetterThanOrEqualTo(P1: JState): Boolean; cdecl;
    function toBitArray(P1: TJavaArray<Byte>): JBitArray; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJState = class(TJavaGenericImport<JStateClass, JState>) end;

  JBarcodeFormatClass = interface(JEnumClass) // or JObjectClass
  ['{4B15B20B-F2EA-4750-8343-D34B1DA7D243}']
    { static Property Methods }
    {class} function _GetAZTEC: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODABAR: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE_39: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE_93: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE_128: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MATRIX: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEAN_8: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEAN_13: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetITF: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAXICODE: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPDF_417: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQR_CODE: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSS_14: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSS_EXPANDED: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPC_A: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPC_E: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPC_EAN_EXTENSION: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JBarcodeFormat>; cdecl;
    {class} function valueOf(P1: JString): JBarcodeFormat; cdecl;
    {class} function init: JBarcodeFormat; cdecl;

    { static Property }
    {class} property AZTEC: JBarcodeFormat read _GetAZTEC;
    {class} property CODABAR: JBarcodeFormat read _GetCODABAR;
    {class} property CODE_39: JBarcodeFormat read _GetCODE_39;
    {class} property CODE_93: JBarcodeFormat read _GetCODE_93;
    {class} property CODE_128: JBarcodeFormat read _GetCODE_128;
    {class} property DATA_MATRIX: JBarcodeFormat read _GetDATA_MATRIX;
    {class} property EAN_8: JBarcodeFormat read _GetEAN_8;
    {class} property EAN_13: JBarcodeFormat read _GetEAN_13;
    {class} property ITF: JBarcodeFormat read _GetITF;
    {class} property MAXICODE: JBarcodeFormat read _GetMAXICODE;
    {class} property PDF_417: JBarcodeFormat read _GetPDF_417;
    {class} property QR_CODE: JBarcodeFormat read _GetQR_CODE;
    {class} property RSS_14: JBarcodeFormat read _GetRSS_14;
    {class} property RSS_EXPANDED: JBarcodeFormat read _GetRSS_EXPANDED;
    {class} property UPC_A: JBarcodeFormat read _GetUPC_A;
    {class} property UPC_E: JBarcodeFormat read _GetUPC_E;
    {class} property UPC_EAN_EXTENSION: JBarcodeFormat read _GetUPC_EAN_EXTENSION;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/BarcodeFormat')]
  JBarcodeFormat = interface(JEnum) // or JObject
  ['{F088DD63-FDC9-49C8-BC8E-54BC3377B590}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBarcodeFormat = class(TJavaGenericImport<JBarcodeFormatClass, JBarcodeFormat>) end;

  JBinarizerClass = interface(JObjectClass)
  ['{01573029-E937-4632-9BA0-98B17BCA0E07}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JLuminanceSource): JBinarizer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/Binarizer')]
  JBinarizer = interface(JObject)
  ['{537A5D38-63F5-41C3-B6C5-B16911946E67}']
    { Property Methods }

    { methods }
    function getLuminanceSource: JLuminanceSource; cdecl;
    function getBlackRow(P1: Integer; P2: JBitArray): JBitArray; cdecl;
    function getBlackMatrix: JBitMatrix; cdecl;
    function createBinarizer(P1: JLuminanceSource): JBinarizer; cdecl;
    function getWidth: Integer; cdecl;
    function getHeight: Integer; cdecl;

    { Property }
  end;

  TJBinarizer = class(TJavaGenericImport<JBinarizerClass, JBinarizer>) end;

  JBinaryBitmapClass = interface(JObjectClass)
  ['{444CF2B5-86EA-4C2F-984F-A5D881C4BDD4}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBinarizer): JBinaryBitmap; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/BinaryBitmap')]
  JBinaryBitmap = interface(JObject)
  ['{5444CBF2-8FDC-4C37-9918-98EC655A7C13}']
    { Property Methods }

    { methods }
    function getWidth: Integer; cdecl;
    function getHeight: Integer; cdecl;
    function getBlackRow(P1: Integer; P2: JBitArray): JBitArray; cdecl;
    function getBlackMatrix: JBitMatrix; cdecl;
    function isCropSupported: Boolean; cdecl;
    function crop(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JBinaryBitmap; cdecl;
    function isRotateSupported: Boolean; cdecl;
    function rotateCounterClockwise: JBinaryBitmap; cdecl;
    function rotateCounterClockwise45: JBinaryBitmap; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJBinaryBitmap = class(TJavaGenericImport<JBinaryBitmapClass, JBinaryBitmap>) end;

  JReaderExceptionClass = interface(JExceptionClass) // or JObjectClass
  ['{C45F8612-E4C4-4E97-95E8-0D501C78198C}']
    { static Property Methods }
    {class} function _GetisStackTrace: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNO_TRACE: TJavaObjectArray<JStackTraceElement>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JReaderException; cdecl; overload;
    {class} function init(P1: JThrowable): JReaderException; cdecl; overload;
//    {class} function init: JReaderException; cdecl; overload;

    { static Property }
    {class} property isStackTrace: Boolean read _GetisStackTrace;
    {class} property NO_TRACE: TJavaObjectArray<JStackTraceElement> read _GetNO_TRACE;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/ReaderException')]
  JReaderException = interface(JException) // or JObject
  ['{8B3FDA0A-7070-4E73-A39D-24448B8858CE}']
    { Property Methods }

    { methods }
    function fillInStackTrace: JThrowable; cdecl;

    { Property }
  end;

  TJReaderException = class(TJavaGenericImport<JReaderExceptionClass, JReaderException>) end;

  JChecksumExceptionClass = interface(JReaderExceptionClass) // or JObjectClass
  ['{40C9DF55-51FE-40EF-8347-EAE411A58632}']
    { static Property Methods }

    { static Methods }
    {class} function getChecksumInstance: JChecksumException; cdecl; overload;
    {class} function getChecksumInstance(P1: JThrowable): JChecksumException; cdecl; overload;
    {class} function init: JChecksumException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/ChecksumException')]
  JChecksumException = interface(JReaderException) // or JObject
  ['{8DBAFD9A-3BDF-4F72-A143-B6331EE86EDC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJChecksumException = class(TJavaGenericImport<JChecksumExceptionClass, JChecksumException>) end;

  JBitArrayClass = interface(JObjectClass)
  ['{E7DF4166-D5FE-43D0-BEB9-0014B5C4F3E4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitArray; cdecl; overload;
    {class} function init(P1: Integer): JBitArray; cdecl; overload;
    {class} function init(P1: TJavaArray<Integer>; P2: Integer): JBitArray; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/BitArray')]
  JBitArray = interface(JObject)
  ['{EE7FE794-3EFD-4711-881A-93090D0B2717}']
    { Property Methods }

    { methods }
    function getSize: Integer; cdecl;
    function getSizeInBytes: Integer; cdecl;
    function get(P1: Integer): Boolean; cdecl;
    procedure &set(P1: Integer); cdecl;
    procedure flip(P1: Integer); cdecl;
    function getNextSet(P1: Integer): Integer; cdecl;
    function getNextUnset(P1: Integer): Integer; cdecl;
    procedure setBulk(P1: Integer; P2: Integer); cdecl;
    procedure setRange(P1: Integer; P2: Integer); cdecl;
    procedure clear; cdecl;
    function isRange(P1: Integer; P2: Integer; P3: Boolean): Boolean; cdecl;
    procedure appendBit(P1: Boolean); cdecl;
    procedure appendBits(P1: Integer; P2: Integer); cdecl;
    procedure appendBitArray(P1: JBitArray); cdecl;
    procedure &xor(P1: JBitArray); cdecl;
    procedure toBytes(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer); cdecl;
    function getBitArray: TJavaArray<Integer>; cdecl;
    procedure reverse; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    function clone: JBitArray; cdecl; overload;
//    function clone: JObject; cdecl; overload;

    { Property }
  end;

  TJBitArray = class(TJavaGenericImport<JBitArrayClass, JBitArray>) end;

  JBitMatrixClass = interface(JObjectClass)
  ['{1ECF9A41-AF10-448D-9A0F-EDD0D06210F9}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer): JBitMatrix; cdecl; overload;
    {class} function init(P1: Integer; P2: Integer): JBitMatrix; cdecl; overload;
    {class} function parse(P1: TJavaArray<Boolean>): JBitMatrix; cdecl; overload;
    {class} function parse(P1: JString; P2: JString; P3: JString): JBitMatrix; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/BitMatrix')]
  JBitMatrix = interface(JObject)
  ['{B3F889D1-EA70-4B8C-9BB4-73908F2ADF66}']
    { Property Methods }

    { methods }
    function get(P1: Integer; P2: Integer): Boolean; cdecl;
    procedure &set(P1: Integer; P2: Integer); cdecl;
    procedure unset(P1: Integer; P2: Integer); cdecl;
    procedure flip(P1: Integer; P2: Integer); cdecl;
    procedure &xor(P1: JBitMatrix); cdecl;
    procedure clear; cdecl;
    procedure setRegion(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
    function getRow(P1: Integer; P2: JBitArray): JBitArray; cdecl;
    procedure setRow(P1: Integer; P2: JBitArray); cdecl;
    procedure rotate180; cdecl;
    function getEnclosingRectangle: TJavaArray<Integer>; cdecl;
    function getTopLeftOnBit: TJavaArray<Integer>; cdecl;
    function getBottomRightOnBit: TJavaArray<Integer>; cdecl;
    function getWidth: Integer; cdecl;
    function getHeight: Integer; cdecl;
    function getRowSize: Integer; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl; overload;
    function toString(P1: JString; P2: JString): JString; cdecl; overload;
    function toString(P1: JString; P2: JString; P3: JString): JString; cdecl; overload; //Deprecated
    function clone: JBitMatrix; cdecl; overload;
//    function clone: JObject; cdecl; overload;

    { Property }
  end;

  TJBitMatrix = class(TJavaGenericImport<JBitMatrixClass, JBitMatrix>) end;

  JBitSourceClass = interface(JObjectClass)
  ['{B02D45CB-3C78-4E50-BF60-F65C1990E6B1}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: TJavaArray<Byte>): JBitSource; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/BitSource')]
  JBitSource = interface(JObject)
  ['{CAC330AB-93CA-43B1-9D4C-BA0F642BC49F}']
    { Property Methods }

    { methods }
    function getBitOffset: Integer; cdecl;
    function getByteOffset: Integer; cdecl;
    function readBits(P1: Integer): Integer; cdecl;
    function available: Integer; cdecl;

    { Property }
  end;

  TJBitSource = class(TJavaGenericImport<JBitSourceClass, JBitSource>) end;

  JCharacterSetECIClass = interface(JEnumClass) // or JObjectClass
  ['{2AD20006-C86E-4495-BB60-7D73392939B6}']
    { static Property Methods }
    {class} function _GetCp437: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_1: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_2: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_3: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_4: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_5: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_6: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_7: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_8: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_9: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_10: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_11: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_13: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_14: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_15: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO8859_16: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSJIS: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCp1250: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCp1251: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCp1252: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCp1256: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUnicodeBigUnmarked: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUTF8: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetASCII: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBig5: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGB18030: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEUC_KR: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JCharacterSetECI>; cdecl;
    {class} function valueOf(P1: JString): JCharacterSetECI; cdecl;
    {class} function getCharacterSetECIByValue(P1: Integer): JCharacterSetECI; cdecl;
    {class} function getCharacterSetECIByName(P1: JString): JCharacterSetECI; cdecl;
    {class} function init: JCharacterSetECI; cdecl;

    { static Property }
    {class} property Cp437: JCharacterSetECI read _GetCp437;
    {class} property ISO8859_1: JCharacterSetECI read _GetISO8859_1;
    {class} property ISO8859_2: JCharacterSetECI read _GetISO8859_2;
    {class} property ISO8859_3: JCharacterSetECI read _GetISO8859_3;
    {class} property ISO8859_4: JCharacterSetECI read _GetISO8859_4;
    {class} property ISO8859_5: JCharacterSetECI read _GetISO8859_5;
    {class} property ISO8859_6: JCharacterSetECI read _GetISO8859_6;
    {class} property ISO8859_7: JCharacterSetECI read _GetISO8859_7;
    {class} property ISO8859_8: JCharacterSetECI read _GetISO8859_8;
    {class} property ISO8859_9: JCharacterSetECI read _GetISO8859_9;
    {class} property ISO8859_10: JCharacterSetECI read _GetISO8859_10;
    {class} property ISO8859_11: JCharacterSetECI read _GetISO8859_11;
    {class} property ISO8859_13: JCharacterSetECI read _GetISO8859_13;
    {class} property ISO8859_14: JCharacterSetECI read _GetISO8859_14;
    {class} property ISO8859_15: JCharacterSetECI read _GetISO8859_15;
    {class} property ISO8859_16: JCharacterSetECI read _GetISO8859_16;
    {class} property SJIS: JCharacterSetECI read _GetSJIS;
    {class} property Cp1250: JCharacterSetECI read _GetCp1250;
    {class} property Cp1251: JCharacterSetECI read _GetCp1251;
    {class} property Cp1252: JCharacterSetECI read _GetCp1252;
    {class} property Cp1256: JCharacterSetECI read _GetCp1256;
    {class} property UnicodeBigUnmarked: JCharacterSetECI read _GetUnicodeBigUnmarked;
    {class} property UTF8: JCharacterSetECI read _GetUTF8;
    {class} property ASCII: JCharacterSetECI read _GetASCII;
    {class} property Big5: JCharacterSetECI read _GetBig5;
    {class} property GB18030: JCharacterSetECI read _GetGB18030;
    {class} property EUC_KR: JCharacterSetECI read _GetEUC_KR;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/CharacterSetECI')]
  JCharacterSetECI = interface(JEnum) // or JObject
  ['{DE8A2E2A-61AF-4832-8AB9-2C32898E89B5}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;

    { Property }
  end;

  TJCharacterSetECI = class(TJavaGenericImport<JCharacterSetECIClass, JCharacterSetECI>) end;

  JDecoderResultClass = interface(JObjectClass)
  ['{CE6E2A4A-D412-4A83-A910-935A851BF040}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: TJavaArray<Byte>; P2: JString; P3: JList; P4: JString): JDecoderResult; cdecl; overload;
    {class} function init(P1: TJavaArray<Byte>; P2: JString; P3: JList; P4: JString; P5: Integer; P6: Integer): JDecoderResult; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/DecoderResult')]
  JDecoderResult = interface(JObject)
  ['{7CAD6331-7FEF-496B-9BD0-83DA1126482D}']
    { Property Methods }

    { methods }
    function getRawBytes: TJavaArray<Byte>; cdecl;
    function getNumBits: Integer; cdecl;
    procedure setNumBits(P1: Integer); cdecl;
    function getText: JString; cdecl;
    function getByteSegments: JList; cdecl;
    function getECLevel: JString; cdecl;
    function getErrorsCorrected: JInteger; cdecl;
    procedure setErrorsCorrected(P1: JInteger); cdecl;
    function getErasures: JInteger; cdecl;
    procedure setErasures(P1: JInteger); cdecl;
    function getOther: JObject; cdecl;
    procedure setOther(P1: JObject); cdecl;
    function hasStructuredAppend: Boolean; cdecl;
    function getStructuredAppendParity: Integer; cdecl;
    function getStructuredAppendSequenceNumber: Integer; cdecl;

    { Property }
  end;

  TJDecoderResult = class(TJavaGenericImport<JDecoderResultClass, JDecoderResult>) end;

  JGridSamplerClass = interface(JObjectClass)
  ['{5FC97427-1A98-46CD-B6C2-7572A12EC9BF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGridSampler; cdecl; overload;
    {class} procedure setGridSampler(P1: JGridSampler); cdecl;
    {class} function getInstance: JGridSampler; cdecl;
    {class} procedure checkAndNudgePoints(P1: JBitMatrix; P2: TJavaArray<Single>); cdecl;
//    {class} function init: JGridSampler; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/GridSampler')]
  JGridSampler = interface(JObject)
  ['{D5986027-2D60-43CA-8C25-B976F103E18D}']
    { Property Methods }

    { methods }
    function sampleGrid(P1: JBitMatrix; P2: Integer; P3: Integer; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single; P17: Single; P18: Single; P19: Single): JBitMatrix; cdecl; overload;
    function sampleGrid(P1: JBitMatrix; P2: Integer; P3: Integer; P4: JPerspectiveTransform): JBitMatrix; cdecl; overload;

    { Property }
  end;

  TJGridSampler = class(TJavaGenericImport<JGridSamplerClass, JGridSampler>) end;

  JDefaultGridSamplerClass = interface(JGridSamplerClass) // or JObjectClass
  ['{4E4EBFEF-0849-4841-B6C6-F816D91E4F47}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDefaultGridSampler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/DefaultGridSampler')]
  JDefaultGridSampler = interface(JGridSampler) // or JObject
  ['{BC8CE30D-2668-4BA1-B3D3-4AEB59C20407}']
    { Property Methods }

    { methods }
    function sampleGrid(P1: JBitMatrix; P2: Integer; P3: Integer; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single; P17: Single; P18: Single; P19: Single): JBitMatrix; cdecl; overload;
    function sampleGrid(P1: JBitMatrix; P2: Integer; P3: Integer; P4: JPerspectiveTransform): JBitMatrix; cdecl; overload;

    { Property }
  end;

  TJDefaultGridSampler = class(TJavaGenericImport<JDefaultGridSamplerClass, JDefaultGridSampler>) end;

  JMathUtilsClass = interface(JObjectClass)
  ['{ECCE8EC8-7ACF-4801-AA71-C1C0CAE40C3A}']
    { static Property Methods }

    { static Methods }
    {class} function round(P1: Single): Integer; cdecl;
    {class} function distance(P1: Single; P2: Single; P3: Single; P4: Single): Single; cdecl; overload;
    {class} function distance(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Single; cdecl; overload;
    {class} function sum(P1: TJavaArray<Integer>): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/detector/MathUtils')]
  JMathUtils = interface(JObject)
  ['{C99C72F7-ECDC-4D69-9EAD-E51014126B96}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMathUtils = class(TJavaGenericImport<JMathUtilsClass, JMathUtils>) end;

  JWhiteRectangleDetectorClass = interface(JObjectClass)
  ['{4065F36A-BADE-4481-8B51-63BA98A4112C}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitMatrix): JWhiteRectangleDetector; cdecl; overload;
    {class} function init(P1: JBitMatrix; P2: Integer; P3: Integer; P4: Integer): JWhiteRectangleDetector; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/detector/WhiteRectangleDetector')]
  JWhiteRectangleDetector = interface(JObject)
  ['{C966C234-C800-47FA-805C-88383C5B19BE}']
    { Property Methods }

    { methods }
    function detect: TJavaObjectArray<JResultPoint>; cdecl;

    { Property }
  end;

  TJWhiteRectangleDetector = class(TJavaGenericImport<JWhiteRectangleDetectorClass, JWhiteRectangleDetector>) end;

  JPerspectiveTransformClass = interface(JObjectClass)
  ['{C7DB555E-098B-4532-A4F8-834E58A3C92B}']
    { static Property Methods }

    { static Methods }
    {class} function quadrilateralToQuadrilateral(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single): JPerspectiveTransform; cdecl;
    {class} function squareToQuadrilateral(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single): JPerspectiveTransform; cdecl;
    {class} function quadrilateralToSquare(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single): JPerspectiveTransform; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/PerspectiveTransform')]
  JPerspectiveTransform = interface(JObject)
  ['{5F20BFA2-BFB9-4269-A41C-3CBCF630D35C}']
    { Property Methods }

    { methods }
    procedure transformPoints(P1: TJavaArray<Single>); cdecl; overload;
    procedure transformPoints(P1: TJavaArray<Single>; P2: TJavaArray<Single>); cdecl; overload;
    function buildAdjoint: JPerspectiveTransform; cdecl;
    function times(P1: JPerspectiveTransform): JPerspectiveTransform; cdecl;

    { Property }
  end;

  TJPerspectiveTransform = class(TJavaGenericImport<JPerspectiveTransformClass, JPerspectiveTransform>) end;

  JGenericGFClass = interface(JObjectClass)
  ['{B7C341A2-FF10-4EDE-AE06-E2C0A734BCFB}']
    { static Property Methods }
    {class} function _GetAZTEC_DATA_12: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAZTEC_DATA_10: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAZTEC_DATA_6: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAZTEC_PARAM: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQR_CODE_FIELD_256: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MATRIX_FIELD_256: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAZTEC_DATA_8: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAXICODE_FIELD_64: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: Integer; P2: Integer; P3: Integer): JGenericGF; cdecl; overload;
    {class} function addOrSubtract(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function init: JGenericGF; cdecl; overload;

    { static Property }
    {class} property AZTEC_DATA_12: JGenericGF read _GetAZTEC_DATA_12;
    {class} property AZTEC_DATA_10: JGenericGF read _GetAZTEC_DATA_10;
    {class} property AZTEC_DATA_6: JGenericGF read _GetAZTEC_DATA_6;
    {class} property AZTEC_PARAM: JGenericGF read _GetAZTEC_PARAM;
    {class} property QR_CODE_FIELD_256: JGenericGF read _GetQR_CODE_FIELD_256;
    {class} property DATA_MATRIX_FIELD_256: JGenericGF read _GetDATA_MATRIX_FIELD_256;
    {class} property AZTEC_DATA_8: JGenericGF read _GetAZTEC_DATA_8;
    {class} property MAXICODE_FIELD_64: JGenericGF read _GetMAXICODE_FIELD_64;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/reedsolomon/GenericGF')]
  JGenericGF = interface(JObject)
  ['{9222290C-5123-440E-876A-FD76205D75F9}']
    { Property Methods }

    { methods }
    function getZero: JGenericGFPoly; cdecl;
    function getOne: JGenericGFPoly; cdecl;
    function buildMonomial(P1: Integer; P2: Integer): JGenericGFPoly; cdecl;
    function exp(P1: Integer): Integer; cdecl;
    function log(P1: Integer): Integer; cdecl;
    function inverse(P1: Integer): Integer; cdecl;
    function multiply(P1: Integer; P2: Integer): Integer; cdecl;
    function getSize: Integer; cdecl;
    function getGeneratorBase: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJGenericGF = class(TJavaGenericImport<JGenericGFClass, JGenericGF>) end;

  JGenericGFPolyClass = interface(JObjectClass)
  ['{0BD6ABF5-7084-4898-BD28-A28D9B5B8EB4}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JGenericGF; P2: TJavaArray<Integer>): JGenericGFPoly; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/reedsolomon/GenericGFPoly')]
  JGenericGFPoly = interface(JObject)
  ['{7C3F1E8A-E9E1-4731-9958-9BB83109D769}']
    { Property Methods }

    { methods }
    function getCoefficients: TJavaArray<Integer>; cdecl;
    function getDegree: Integer; cdecl;
    function isZero: Boolean; cdecl;
    function getCoefficient(P1: Integer): Integer; cdecl;
    function evaluateAt(P1: Integer): Integer; cdecl;
    function addOrSubtract(P1: JGenericGFPoly): JGenericGFPoly; cdecl;
    function multiply(P1: JGenericGFPoly): JGenericGFPoly; cdecl; overload;
    function multiply(P1: Integer): JGenericGFPoly; cdecl; overload;
    function multiplyByMonomial(P1: Integer; P2: Integer): JGenericGFPoly; cdecl;
    function divide(P1: JGenericGFPoly): TJavaObjectArray<JGenericGFPoly>; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJGenericGFPoly = class(TJavaGenericImport<JGenericGFPolyClass, JGenericGFPoly>) end;

  JReedSolomonDecoderClass = interface(JObjectClass)
  ['{A6C970BF-516F-4E30-A90C-94CE8E95BF22}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JGenericGF): JReedSolomonDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/reedsolomon/ReedSolomonDecoder')]
  JReedSolomonDecoder = interface(JObject)
  ['{B9394C1F-C7B5-4788-A6DD-77AD9A12CB6D}']
    { Property Methods }

    { methods }
    procedure decode(P1: TJavaArray<Integer>; P2: Integer); cdecl;

    { Property }
  end;

  TJReedSolomonDecoder = class(TJavaGenericImport<JReedSolomonDecoderClass, JReedSolomonDecoder>) end;

  JReedSolomonEncoderClass = interface(JObjectClass)
  ['{1BD7D6B0-F646-4941-8A61-C1F39F666C69}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JGenericGF): JReedSolomonEncoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/reedsolomon/ReedSolomonEncoder')]
  JReedSolomonEncoder = interface(JObject)
  ['{D203C343-E7CB-478C-B182-E2220B31F1DF}']
    { Property Methods }

    { methods }
    procedure encode(P1: TJavaArray<Integer>; P2: Integer); cdecl;

    { Property }
  end;

  TJReedSolomonEncoder = class(TJavaGenericImport<JReedSolomonEncoderClass, JReedSolomonEncoder>) end;

  JReedSolomonExceptionClass = interface(JExceptionClass) // or JObjectClass
  ['{9DCF782D-EE00-4DA6-B628-67891A646044}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString): JReedSolomonException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/reedsolomon/ReedSolomonException')]
  JReedSolomonException = interface(JException) // or JObject
  ['{985999EC-F8A8-459D-91E8-1F96EAAA56DD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReedSolomonException = class(TJavaGenericImport<JReedSolomonExceptionClass, JReedSolomonException>) end;

  JStringUtilsClass = interface(JObjectClass)
  ['{6E885C24-8E9F-41DE-B8E6-675C7BB51B5F}']
    { static Property Methods }
    {class} function _GetSHIFT_JIS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGB2312: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function guessEncoding(P1: TJavaArray<Byte>; P2: JMap): JString; cdecl;
    {class} function init: JStringUtils; cdecl;

    { static Property }
    {class} property SHIFT_JIS: JString read _GetSHIFT_JIS;
    {class} property GB2312: JString read _GetGB2312;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/common/StringUtils')]
  JStringUtils = interface(JObject)
  ['{7932D554-B231-4077-8B6B-BCBB3521D4CC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStringUtils = class(TJavaGenericImport<JStringUtilsClass, JStringUtils>) end;

  JDataMatrixReaderClass = interface(JObjectClass)
  ['{81696D81-04EA-4BDC-8716-F34B87D35F47}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataMatrixReader; cdecl; overload;
//    {class} function init: JDataMatrixReader; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/DataMatrixReader')]
  JDataMatrixReader = interface(JObject)
  ['{9579ADD5-ED47-4E6C-B65C-9F99CFD8611D}']
    { Property Methods }

    { methods }
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload;
    procedure reset; cdecl;

    { Property }
  end;

  TJDataMatrixReader = class(TJavaGenericImport<JDataMatrixReaderClass, JDataMatrixReader>) end;

  JDataMatrixWriterClass = interface(JObjectClass)
  ['{BC4D3A16-F5FB-4763-BA38-12DEA75415A6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataMatrixWriter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/DataMatrixWriter')]
  JDataMatrixWriter = interface(JObject)
  ['{325003AB-20BA-45A7-8B7F-84372444611A}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer): JBitMatrix; cdecl; overload;
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;

    { Property }
  end;

  TJDataMatrixWriter = class(TJavaGenericImport<JDataMatrixWriterClass, JDataMatrixWriter>) end;

  JBitMatrixParserClass = interface(JObjectClass)
  ['{72004063-3863-4501-B8E9-7EDA0529B24A}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitMatrix): JBitMatrixParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/decoder/BitMatrixParser')]
  JBitMatrixParser = interface(JObject)
  ['{15CAE18C-56FA-4877-AF9F-94CA49BC5248}']
    { Property Methods }

    { methods }
    function getVersion: JVersion; cdecl;
    function readCodewords: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJBitMatrixParser = class(TJavaGenericImport<JBitMatrixParserClass, JBitMatrixParser>) end;

  JDataBlockClass = interface(JObjectClass)
  ['{2277635F-8AF6-41B8-94CE-76E9C75F3241}']
    { static Property Methods }

    { static Methods }
    {class} function getDataBlocks(P1: TJavaArray<Byte>; P2: JVersion): TJavaObjectArray<JDataBlock>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/decoder/DataBlock')]
  JDataBlock = interface(JObject)
  ['{C2CC7939-CC5B-42ED-8E21-DD3BAA854999}']
    { Property Methods }

    { methods }
    function getNumDataCodewords: Integer; cdecl;
    function getCodewords: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJDataBlock = class(TJavaGenericImport<JDataBlockClass, JDataBlock>) end;

//  JDecodedBitStreamParser_1Class = interface(JObjectClass)
//  ['{B69C6E70-A3CF-4AFB-8F7F-FF725F76620A}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_datamatrix_decoder_DecodedBitStreamParser_Mode: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JDecodedBitStreamParser_1; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_gengcon_www_jcprintersdk_zxing_datamatrix_decoder_DecodedBitStreamParser_Mode: TJavaArray<Integer> read _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_datamatrix_decoder_DecodedBitStreamParser_Mode;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/decoder/DecodedBitStreamParser$1')]
//  JDecodedBitStreamParser_1 = interface(JObject)
//  ['{A580B7D3-CAC5-4C92-B3E7-74EE0712AA37}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDecodedBitStreamParser_1 = class(TJavaGenericImport<JDecodedBitStreamParser_1Class, JDecodedBitStreamParser_1>) end;

  JDecodedBitStreamParser_ModeClass = interface(JEnumClass) // or JObjectClass
  ['{C966749B-2630-4E55-B66C-5EC32950EAF0}']
    { static Property Methods }
    {class} function _GetPAD_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetASCII_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetC40_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEXT_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetANSIX12_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEDIFACT_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE256_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDecodedBitStreamParser_Mode>; cdecl;
    {class} function valueOf(P1: JString): JDecodedBitStreamParser_Mode; cdecl;
    {class} function init: JDecodedBitStreamParser_Mode; cdecl;

    { static Property }
    {class} property PAD_ENCODE: JDecodedBitStreamParser_Mode read _GetPAD_ENCODE;
    {class} property ASCII_ENCODE: JDecodedBitStreamParser_Mode read _GetASCII_ENCODE;
    {class} property C40_ENCODE: JDecodedBitStreamParser_Mode read _GetC40_ENCODE;
    {class} property TEXT_ENCODE: JDecodedBitStreamParser_Mode read _GetTEXT_ENCODE;
    {class} property ANSIX12_ENCODE: JDecodedBitStreamParser_Mode read _GetANSIX12_ENCODE;
    {class} property EDIFACT_ENCODE: JDecodedBitStreamParser_Mode read _GetEDIFACT_ENCODE;
    {class} property BASE256_ENCODE: JDecodedBitStreamParser_Mode read _GetBASE256_ENCODE;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode')]
  JDecodedBitStreamParser_Mode = interface(JEnum) // or JObject
  ['{FF7715EE-09EC-4819-8ABA-23E560D4E5E8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedBitStreamParser_Mode = class(TJavaGenericImport<JDecodedBitStreamParser_ModeClass, JDecodedBitStreamParser_Mode>) end;

  JDecodedBitStreamParserClass = interface(JObjectClass)
  ['{654B5239-4F06-4717-9E2E-DFF498F67FCE}']
    { static Property Methods }

    { static Methods }
    {class} function decode(P1: TJavaArray<Byte>): JDecoderResult; cdecl;
    {class} function init: JDecodedBitStreamParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/decoder/DecodedBitStreamParser')]
  JDecodedBitStreamParser = interface(JObject)
  ['{3C8DA9D4-E1C8-40C9-A795-21C02CA53CB4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedBitStreamParser = class(TJavaGenericImport<JDecodedBitStreamParserClass, JDecodedBitStreamParser>) end;

//  JDecoder_462Class = interface(JObjectClass)
//  ['{72718052-1D44-4003-878A-5BC027835899}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDecoder_462; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/decoder/Decoder')]
//  JDecoder_462 = interface(JObject)
//  ['{A2C5884D-1302-45E0-90BB-88B82D69D61D}']
//    { Property Methods }
//
//    { methods }
//    function decode(P1: TJavaArray<Boolean>): JDecoderResult; cdecl; overload;
//    function decode(P1: JBitMatrix): JDecoderResult; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJDecoder_462 = class(TJavaGenericImport<JDecoder_462Class, JDecoder_462>) end;

//  JVersion_1Class = interface(JObjectClass)
//  ['{AC0BF3C0-027D-423E-ADA9-E4A378AD46C0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/decoder/Version$1')]
//  JVersion_1 = interface(JObject)
//  ['{DB5B4CB8-6C9B-44CF-BFC9-F861A88A39DB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJVersion_1 = class(TJavaGenericImport<JVersion_1Class, JVersion_1>) end;

  JVersion_ECBClass = interface(JObjectClass)
  ['{25EBF5F6-3317-4A1D-9881-F180E1A0AE6F}']
    { static Property Methods }

    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: JVersion_1): JVersion_ECB; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/decoder/Version$ECB')]
  JVersion_ECB = interface(JObject)
  ['{14759BC0-C27A-4438-9464-219A3FA72BE4}']
    { Property Methods }

    { methods }
    function getCount: Integer; cdecl;
    function getDataCodewords: Integer; cdecl;

    { Property }
  end;

  TJVersion_ECB = class(TJavaGenericImport<JVersion_ECBClass, JVersion_ECB>) end;

  JVersion_ECBlocksClass = interface(JObjectClass)
  ['{BF33E776-631B-43AA-BAA3-87833EA7C6BF}']
    { static Property Methods }

    { static Methods }
//    {class} function init(P1: Integer; P2: JVersion_ECB; P3: JVersion_1): JVersion_ECBlocks; cdecl; overload;
//    {class} function init(P1: Integer; P2: JVersion_ECB; P3: JVersion_ECB; P4: JVersion_1): JVersion_ECBlocks; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/decoder/Version$ECBlocks')]
  JVersion_ECBlocks = interface(JObject)
  ['{69A1CF53-C8E7-4491-AA62-DD13387BCB9F}']
    { Property Methods }

    { methods }
    function getECCodewords: Integer; cdecl;
    function getECBlocks: TJavaObjectArray<JVersion_ECB>; cdecl;

    { Property }
  end;

  TJVersion_ECBlocks = class(TJavaGenericImport<JVersion_ECBlocksClass, JVersion_ECBlocks>) end;

  JVersionClass = interface(JObjectClass)
  ['{E2703691-1AD4-4B75-AA02-6D1ED15C7D32}']
    { static Property Methods }

    { static Methods }
    {class} function getVersionForDimensions(P1: Integer; P2: Integer): JVersion; cdecl;
    {class} function init: JVersion; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/decoder/Version')]
  JVersion = interface(JObject)
  ['{595CEACF-9E05-4A1F-88A2-CFB82DE7D11A}']
    { Property Methods }

    { methods }
    function getVersionNumber: Integer; cdecl;
    function getSymbolSizeRows: Integer; cdecl;
    function getSymbolSizeColumns: Integer; cdecl;
    function getDataRegionSizeRows: Integer; cdecl;
    function getDataRegionSizeColumns: Integer; cdecl;
    function getTotalCodewords: Integer; cdecl;
    function getECBlocks: JVersion_ECBlocks; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJVersion = class(TJavaGenericImport<JVersionClass, JVersion>) end;

//  JDetector_1Class = interface(JObjectClass)
//  ['{C018F4D4-83FD-408D-8A82-B2BE3D5A166F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/detector/Detector$1')]
//  JDetector_1 = interface(JObject)
//  ['{EBF16215-61EA-43CC-A3FA-EF50E75A42BB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDetector_1 = class(TJavaGenericImport<JDetector_1Class, JDetector_1>) end;

  JDetector_ResultPointsAndTransitionsClass = interface(JObjectClass)
  ['{86D40112-3B0C-4509-B04D-853B4224F0EB}']
    { static Property Methods }

    { static Methods }
//    {class} function init(P1: JResultPoint; P2: JResultPoint; P3: Integer; P4: JDetector_1): JDetector_ResultPointsAndTransitions; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions')]
  JDetector_ResultPointsAndTransitions = interface(JObject)
  ['{242E54AB-2AD4-4069-9856-4E5F492681DB}']
    { Property Methods }

    { methods }
    function getFrom: JResultPoint; cdecl;
    function getTo: JResultPoint; cdecl;
    function getTransitions: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJDetector_ResultPointsAndTransitions = class(TJavaGenericImport<JDetector_ResultPointsAndTransitionsClass, JDetector_ResultPointsAndTransitions>) end;

  JDetector_ResultPointsAndTransitionsComparatorClass = interface(JObjectClass)
  ['{B80AC8D8-ED2B-42FF-808E-50F9F95E3CBE}']
    { static Property Methods }

    { static Methods }
//    {class} function init(P1: JDetector_1): JDetector_ResultPointsAndTransitionsComparator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/detector/Detector$ResultPointsAndTransitionsComparator')]
  JDetector_ResultPointsAndTransitionsComparator = interface(JObject)
  ['{61C0FB02-11DA-4E3A-8E35-C9FC5E1C827D}']
    { Property Methods }

    { methods }
    function compare(P1: JDetector_ResultPointsAndTransitions; P2: JDetector_ResultPointsAndTransitions): Integer; cdecl; overload;
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload;

    { Property }
  end;

  TJDetector_ResultPointsAndTransitionsComparator = class(TJavaGenericImport<JDetector_ResultPointsAndTransitionsComparatorClass, JDetector_ResultPointsAndTransitionsComparator>) end;

//  JDetector_470Class = interface(JObjectClass)
//  ['{C583A2FA-0B7F-4A75-9D65-DDAEA09C8957}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBitMatrix): JDetector_470; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/detector/Detector')]
//  JDetector_470 = interface(JObject)
//  ['{CA61A4E7-D0E2-4004-87DC-85ED056B6D21}']
//    { Property Methods }
//
//    { methods }
//    function detect: JDetectorResult; cdecl;
//
//    { Property }
//  end;
//
//  TJDetector_470 = class(TJavaGenericImport<JDetector_470Class, JDetector_470>) end;

  JASCIIEncoderClass = interface(JObjectClass)
  ['{01442C93-D665-4389-918D-769DDA3F70D0}']
    { static Property Methods }

    { static Methods }
    {class} function init: JASCIIEncoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/ASCIIEncoder')]
  JASCIIEncoder = interface(JObject)
  ['{43781A9F-B510-41D4-AA52-8E5D76FE7771}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl;
    procedure encode(P1: JEncoderContext); cdecl;

    { Property }
  end;

  TJASCIIEncoder = class(TJavaGenericImport<JASCIIEncoderClass, JASCIIEncoder>) end;

  JBase256EncoderClass = interface(JObjectClass)
  ['{AE2078F1-2AFD-4893-8DE1-39EB20ABE8C3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBase256Encoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/Base256Encoder')]
  JBase256Encoder = interface(JObject)
  ['{80F226A4-5763-46C9-ABD4-03504AF79D1C}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl;
    procedure encode(P1: JEncoderContext); cdecl;

    { Property }
  end;

  TJBase256Encoder = class(TJavaGenericImport<JBase256EncoderClass, JBase256Encoder>) end;

  JC40EncoderClass = interface(JObjectClass)
  ['{AAB79F7F-65AF-4B51-BC9C-5DBC22326B11}']
    { static Property Methods }

    { static Methods }
    {class} function init: JC40Encoder; cdecl;
    {class} procedure writeNextTriplet(P1: JEncoderContext; P2: JStringBuilder); cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/C40Encoder')]
  JC40Encoder = interface(JObject)
  ['{2FB2ABFC-0766-472C-B5D1-77219AF4FB9C}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl;
    procedure encode(P1: JEncoderContext); cdecl;
    procedure handleEOD(P1: JEncoderContext; P2: JStringBuilder); cdecl;
    function encodeChar(P1: Char; P2: JStringBuilder): Integer; cdecl;

    { Property }
  end;

  TJC40Encoder = class(TJavaGenericImport<JC40EncoderClass, JC40Encoder>) end;

  JSymbolInfoClass = interface(JObjectClass)
  ['{AB567E05-774D-44ED-9C21-356AEA735B0E}']
    { static Property Methods }
    {class} function _GetPROD_SYMBOLS: TJavaObjectArray<JSymbolInfo>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} procedure overrideSymbolSet(P1: TJavaObjectArray<JSymbolInfo>); cdecl;
    {class} function init(P1: Boolean; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): JSymbolInfo; cdecl; overload;
    {class} function init(P1: Boolean; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Integer): JSymbolInfo; cdecl; overload;
    {class} function lookup(P1: Integer): JSymbolInfo; cdecl; overload;
    {class} function lookup(P1: Integer; P2: JSymbolShapeHint): JSymbolInfo; cdecl; overload;
    {class} function lookup(P1: Integer; P2: Boolean; P3: Boolean): JSymbolInfo; cdecl; overload;
    {class} function lookup(P1: Integer; P2: JSymbolShapeHint; P3: JDimension; P4: JDimension; P5: Boolean): JSymbolInfo; cdecl; overload;
    {class} function init: JSymbolInfo; cdecl; overload;

    { static Property }
    {class} property PROD_SYMBOLS: TJavaObjectArray<JSymbolInfo> read _GetPROD_SYMBOLS;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/SymbolInfo')]
  JSymbolInfo = interface(JObject)
  ['{E85506FA-316E-4A32-9467-B51B93FBD679}']
    { Property Methods }
    function _GetmatrixWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmatrixWidth(amatrixWidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmatrixHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmatrixHeight(amatrixHeight: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getSymbolDataWidth: Integer; cdecl;
    function getSymbolDataHeight: Integer; cdecl;
    function getSymbolWidth: Integer; cdecl;
    function getSymbolHeight: Integer; cdecl;
    function getCodewordCount: Integer; cdecl;
    function getInterleavedBlockCount: Integer; cdecl;
    function getDataCapacity: Integer; cdecl;
    function getErrorCodewords: Integer; cdecl;
    function getDataLengthForInterleavedBlock(P1: Integer): Integer; cdecl;
    function getErrorLengthForInterleavedBlock(P1: Integer): Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property matrixWidth: Integer read _GetmatrixWidth write _SetmatrixWidth;
    property matrixHeight: Integer read _GetmatrixHeight write _SetmatrixHeight;
  end;

  TJSymbolInfo = class(TJavaGenericImport<JSymbolInfoClass, JSymbolInfo>) end;

  JDataMatrixSymbolInfo144Class = interface(JSymbolInfoClass) // or JObjectClass
  ['{96BBF3D2-69B6-41E9-8053-5E9AE025A32C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataMatrixSymbolInfo144; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/DataMatrixSymbolInfo144')]
  JDataMatrixSymbolInfo144 = interface(JSymbolInfo) // or JObject
  ['{6CC6E136-C63E-44FC-AF56-61819F2E35A4}']
    { Property Methods }

    { methods }
    function getInterleavedBlockCount: Integer; cdecl;
    function getDataLengthForInterleavedBlock(P1: Integer): Integer; cdecl;

    { Property }
  end;

  TJDataMatrixSymbolInfo144 = class(TJavaGenericImport<JDataMatrixSymbolInfo144Class, JDataMatrixSymbolInfo144>) end;

  JDefaultPlacementClass = interface(JObjectClass)
  ['{0AA91E0F-1EC3-46CE-BF22-D39A613EE401}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JCharSequence; P2: Integer; P3: Integer): JDefaultPlacement; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/DefaultPlacement')]
  JDefaultPlacement = interface(JObject)
  ['{87B7BB02-7AC0-4E87-BA6E-B5909A438D12}']
    { Property Methods }

    { methods }
    function getNumrows: Integer; cdecl;
    function getNumcols: Integer; cdecl;
    function getBits: TJavaArray<Byte>; cdecl;
    function getBit(P1: Integer; P2: Integer): Boolean; cdecl;
    procedure place; cdecl;

    { Property }
  end;

  TJDefaultPlacement = class(TJavaGenericImport<JDefaultPlacementClass, JDefaultPlacement>) end;

  JEdifactEncoderClass = interface(JObjectClass)
  ['{C7BD8702-B963-46A7-873A-A487EC0CC7AC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEdifactEncoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/EdifactEncoder')]
  JEdifactEncoder = interface(JObject)
  ['{C53E7C5A-BF27-4678-8AD1-0D322BE6B5B9}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl;
    procedure encode(P1: JEncoderContext); cdecl;

    { Property }
  end;

  TJEdifactEncoder = class(TJavaGenericImport<JEdifactEncoderClass, JEdifactEncoder>) end;

//  JEncoder_477Class = interface(JObjectClass)
//  ['{42346B41-DEFF-447C-B533-64B19B0F473A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/Encoder')]
//  JEncoder_477 = interface(IJavaInstance)
//  ['{D9C88E5D-C186-45EC-AB2B-09F618F31E57}']
//    { Property Methods }
//
//    { methods }
//    function getEncodingMode: Integer; cdecl;
//    procedure encode(P1: JEncoderContext); cdecl;
//
//    { Property }
//  end;
//
//  TJEncoder_477 = class(TJavaGenericImport<JEncoder_477Class, JEncoder_477>) end;

  JEncoderContextClass = interface(JObjectClass)
  ['{EEEBACEE-7157-493F-B4D8-D5E4EC888B79}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString): JEncoderContext; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/EncoderContext')]
  JEncoderContext = interface(JObject)
  ['{86909D09-F3EA-40F8-907A-A5BF327CFAB4}']
    { Property Methods }
    function _Getpos: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setpos(apos: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure setSymbolShape(P1: JSymbolShapeHint); cdecl;
    procedure setSizeConstraints(P1: JDimension; P2: JDimension); cdecl;
    function getMessage: JString; cdecl;
    procedure setSkipAtEnd(P1: Integer); cdecl;
    function getCurrentChar: Char; cdecl;
    function getCurrent: Char; cdecl;
    function getCodewords: JStringBuilder; cdecl;
    procedure writeCodewords(P1: JString); cdecl;
    procedure writeCodeword(P1: Char); cdecl;
    function getCodewordCount: Integer; cdecl;
    function getNewEncoding: Integer; cdecl;
    procedure signalEncoderChange(P1: Integer); cdecl;
    procedure resetEncoderSignal; cdecl;
    function hasMoreCharacters: Boolean; cdecl;
    function getRemainingCharacters: Integer; cdecl;
    function getSymbolInfo: JSymbolInfo; cdecl;
    procedure updateSymbolInfo; cdecl; overload;
    procedure updateSymbolInfo(P1: Integer); cdecl; overload;
    procedure resetSymbolInfo; cdecl;

    { Property }
    property pos: Integer read _Getpos write _Setpos;
  end;

  TJEncoderContext = class(TJavaGenericImport<JEncoderContextClass, JEncoderContext>) end;

  JErrorCorrectionClass = interface(JObjectClass)
  ['{8A8D367D-4126-4684-B958-7ED7B7AAF59F}']
    { static Property Methods }

    { static Methods }
    {class} function encodeECC200(P1: JString; P2: JSymbolInfo): JString; cdecl;
    {class} function init: JErrorCorrection; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/ErrorCorrection')]
  JErrorCorrection = interface(JObject)
  ['{7B1D5534-F2F2-44AE-B94C-28615575C109}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJErrorCorrection = class(TJavaGenericImport<JErrorCorrectionClass, JErrorCorrection>) end;

//  JHighLevelEncoder_480Class = interface(JObjectClass)
//  ['{ABAFB7A8-61F4-41B1-AFBE-6783285C19C8}']
//    { static Property Methods }
//    {class} function _GetLATCH_TO_C40: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetLATCH_TO_BASE256: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetUPPER_SHIFT: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetLATCH_TO_ANSIX12: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetLATCH_TO_TEXT: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetLATCH_TO_EDIFACT: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetC40_UNLATCH: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetX12_UNLATCH: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetASCII_ENCODATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetC40_ENCODATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetTEXT_ENCODATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetX12_ENCODATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetEDIFACT_ENCODATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetBASE256_ENCODATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function encodeHighLevel(P1: JString): JString; cdecl; overload;
//    {class} function encodeHighLevel(P1: JString; P2: JSymbolShapeHint; P3: JDimension; P4: JDimension): JString; cdecl; overload;
//    {class} function lookAheadTest(P1: JCharSequence; P2: Integer; P3: Integer): Integer; cdecl;
//    {class} function isDigit(P1: Char): Boolean; cdecl;
//    {class} function isExtendedASCII(P1: Char): Boolean; cdecl;
//    {class} function determineConsecutiveDigitCount(P1: JCharSequence; P2: Integer): Integer; cdecl;
//    {class} procedure illegalCharacter(P1: Char); cdecl;
//
//    { static Property }
//    {class} property LATCH_TO_C40: Char read _GetLATCH_TO_C40;
//    {class} property LATCH_TO_BASE256: Char read _GetLATCH_TO_BASE256;
//    {class} property UPPER_SHIFT: Char read _GetUPPER_SHIFT;
//    {class} property LATCH_TO_ANSIX12: Char read _GetLATCH_TO_ANSIX12;
//    {class} property LATCH_TO_TEXT: Char read _GetLATCH_TO_TEXT;
//    {class} property LATCH_TO_EDIFACT: Char read _GetLATCH_TO_EDIFACT;
//    {class} property C40_UNLATCH: Char read _GetC40_UNLATCH;
//    {class} property X12_UNLATCH: Char read _GetX12_UNLATCH;
//    {class} property ASCII_ENCODATION: Integer read _GetASCII_ENCODATION;
//    {class} property C40_ENCODATION: Integer read _GetC40_ENCODATION;
//    {class} property TEXT_ENCODATION: Integer read _GetTEXT_ENCODATION;
//    {class} property X12_ENCODATION: Integer read _GetX12_ENCODATION;
//    {class} property EDIFACT_ENCODATION: Integer read _GetEDIFACT_ENCODATION;
//    {class} property BASE256_ENCODATION: Integer read _GetBASE256_ENCODATION;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/HighLevelEncoder')]
//  JHighLevelEncoder_480 = interface(JObject)
//  ['{33FC6357-B0CF-4DFA-8A24-1D318BC8DE66}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJHighLevelEncoder_480 = class(TJavaGenericImport<JHighLevelEncoder_480Class, JHighLevelEncoder_480>) end;

  JSymbolShapeHintClass = interface(JEnumClass) // or JObjectClass
  ['{D33975A9-78EF-4FC3-96EC-294918CDB2F8}']
    { static Property Methods }
    {class} function _GetFORCE_NONE: JSymbolShapeHint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORCE_SQUARE: JSymbolShapeHint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORCE_RECTANGLE: JSymbolShapeHint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JSymbolShapeHint>; cdecl;
    {class} function valueOf(P1: JString): JSymbolShapeHint; cdecl;
    {class} function init: JSymbolShapeHint; cdecl;

    { static Property }
    {class} property FORCE_NONE: JSymbolShapeHint read _GetFORCE_NONE;
    {class} property FORCE_SQUARE: JSymbolShapeHint read _GetFORCE_SQUARE;
    {class} property FORCE_RECTANGLE: JSymbolShapeHint read _GetFORCE_RECTANGLE;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/SymbolShapeHint')]
  JSymbolShapeHint = interface(JEnum) // or JObject
  ['{CBBB285B-5098-4AE0-8DF7-231565C4C592}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSymbolShapeHint = class(TJavaGenericImport<JSymbolShapeHintClass, JSymbolShapeHint>) end;

  JTextEncoderClass = interface(JC40EncoderClass) // or JObjectClass
  ['{E4B528D1-6D00-49F2-9302-AB65D0B5B14F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTextEncoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/TextEncoder')]
  JTextEncoder = interface(JC40Encoder) // or JObject
  ['{F39BB418-565E-4A28-8251-F4A422E7328A}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl;
    function encodeChar(P1: Char; P2: JStringBuilder): Integer; cdecl;

    { Property }
  end;

  TJTextEncoder = class(TJavaGenericImport<JTextEncoderClass, JTextEncoder>) end;

  JX12EncoderClass = interface(JC40EncoderClass) // or JObjectClass
  ['{D1F12B48-DB4B-48F3-84D5-A2FFF32D8E2F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JX12Encoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/datamatrix/encoder/X12Encoder')]
  JX12Encoder = interface(JC40Encoder) // or JObject
  ['{36FE0E5E-32AA-4B9D-A12F-EE3BFDCB0766}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl;
    procedure encode(P1: JEncoderContext); cdecl;
    function encodeChar(P1: Char; P2: JStringBuilder): Integer; cdecl;
    procedure handleEOD(P1: JEncoderContext; P2: JStringBuilder); cdecl;

    { Property }
  end;

  TJX12Encoder = class(TJavaGenericImport<JX12EncoderClass, JX12Encoder>) end;

  JDecodeHintTypeClass = interface(JEnumClass) // or JObjectClass
  ['{B04CEECC-58E5-42F0-977E-7D01B5F78650}']
    { static Property Methods }
    {class} function _GetOTHER: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPURE_BARCODE: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPOSSIBLE_FORMATS: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRY_HARDER: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHARACTER_SET: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALLOWED_LENGTHS: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetASSUME_CODE_39_CHECK_DIGIT: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetASSUME_GS1: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRETURN_CODABAR_START_END: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNEED_RESULT_POINT_CALLBACK: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALLOWED_EAN_EXTENSIONS: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDecodeHintType>; cdecl;
    {class} function valueOf(P1: JString): JDecodeHintType; cdecl;
    {class} function init: JDecodeHintType; cdecl;

    { static Property }
    {class} property OTHER: JDecodeHintType read _GetOTHER;
    {class} property PURE_BARCODE: JDecodeHintType read _GetPURE_BARCODE;
    {class} property POSSIBLE_FORMATS: JDecodeHintType read _GetPOSSIBLE_FORMATS;
    {class} property TRY_HARDER: JDecodeHintType read _GetTRY_HARDER;
    {class} property CHARACTER_SET: JDecodeHintType read _GetCHARACTER_SET;
    {class} property ALLOWED_LENGTHS: JDecodeHintType read _GetALLOWED_LENGTHS;
    {class} property ASSUME_CODE_39_CHECK_DIGIT: JDecodeHintType read _GetASSUME_CODE_39_CHECK_DIGIT;
    {class} property ASSUME_GS1: JDecodeHintType read _GetASSUME_GS1;
    {class} property RETURN_CODABAR_START_END: JDecodeHintType read _GetRETURN_CODABAR_START_END;
    {class} property NEED_RESULT_POINT_CALLBACK: JDecodeHintType read _GetNEED_RESULT_POINT_CALLBACK;
    {class} property ALLOWED_EAN_EXTENSIONS: JDecodeHintType read _GetALLOWED_EAN_EXTENSIONS;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/DecodeHintType')]
  JDecodeHintType = interface(JEnum) // or JObject
  ['{2B66A11F-ABB1-4280-8677-F3D114EE8701}']
    { Property Methods }

    { methods }
//    function getValueType: JClass; cdecl;

    { Property }
  end;

  TJDecodeHintType = class(TJavaGenericImport<JDecodeHintTypeClass, JDecodeHintType>) end;

  JDimensionClass = interface(JObjectClass)
  ['{3176C85A-6BD2-4C61-8C8B-877A988EA8BA}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer): JDimension; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/Dimension')]
  JDimension = interface(JObject)
  ['{A9423D08-1476-4931-88DC-D752596A2D84}']
    { Property Methods }

    { methods }
    function getWidth: Integer; cdecl;
    function getHeight: Integer; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJDimension = class(TJavaGenericImport<JDimensionClass, JDimension>) end;

  JEncodeHintTypeClass = interface(JEnumClass) // or JObjectClass
  ['{9566AA23-562B-49AF-B6EB-748A73AF62F2}']
    { static Property Methods }
    {class} function _GetERROR_CORRECTION: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHARACTER_SET: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MATRIX_SHAPE: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIN_SIZE: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_SIZE: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMARGIN: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPDF417_COMPACT: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPDF417_COMPACTION: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPDF417_DIMENSIONS: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAZTEC_LAYERS: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQR_VERSION: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGS1_FORMAT: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JEncodeHintType>; cdecl;
    {class} function valueOf(P1: JString): JEncodeHintType; cdecl;
    {class} function init: JEncodeHintType; cdecl;

    { static Property }
    {class} property ERROR_CORRECTION: JEncodeHintType read _GetERROR_CORRECTION;
    {class} property CHARACTER_SET: JEncodeHintType read _GetCHARACTER_SET;
    {class} property DATA_MATRIX_SHAPE: JEncodeHintType read _GetDATA_MATRIX_SHAPE;
    {class} property MIN_SIZE: JEncodeHintType read _GetMIN_SIZE;
    {class} property MAX_SIZE: JEncodeHintType read _GetMAX_SIZE;
    {class} property MARGIN: JEncodeHintType read _GetMARGIN;
    {class} property PDF417_COMPACT: JEncodeHintType read _GetPDF417_COMPACT;
    {class} property PDF417_COMPACTION: JEncodeHintType read _GetPDF417_COMPACTION;
    {class} property PDF417_DIMENSIONS: JEncodeHintType read _GetPDF417_DIMENSIONS;
    {class} property AZTEC_LAYERS: JEncodeHintType read _GetAZTEC_LAYERS;
    {class} property QR_VERSION: JEncodeHintType read _GetQR_VERSION;
    {class} property GS1_FORMAT: JEncodeHintType read _GetGS1_FORMAT;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/EncodeHintType')]
  JEncodeHintType = interface(JEnum) // or JObject
  ['{69493DF9-3960-462E-95D9-6D8A8A40AF91}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncodeHintType = class(TJavaGenericImport<JEncodeHintTypeClass, JEncodeHintType>) end;

  JFormatExceptionClass = interface(JReaderExceptionClass) // or JObjectClass
  ['{C0DD2146-869A-4226-981F-37080DFF7011}']
    { static Property Methods }

    { static Methods }
    {class} function getFormatInstance: JFormatException; cdecl; overload;
    {class} function getFormatInstance(P1: JThrowable): JFormatException; cdecl; overload;
    {class} function init: JFormatException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/FormatException')]
  JFormatException = interface(JReaderException) // or JObject
  ['{79D20D9E-296A-405D-9A13-0B905A85E0BB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFormatException = class(TJavaGenericImport<JFormatExceptionClass, JFormatException>) end;

  JLuminanceSourceClass = interface(JObjectClass)
  ['{2C71D7F3-9B80-4EB2-A954-32CFB7C74C79}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer): JLuminanceSource; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/LuminanceSource')]
  JLuminanceSource = interface(JObject)
  ['{E2A008B6-BEE3-4FC4-96DA-A7D3A5269C44}']
    { Property Methods }

    { methods }
    function getRow(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function getMatrix: TJavaArray<Byte>; cdecl;
    function getWidth: Integer; cdecl;
    function getHeight: Integer; cdecl;
    function isCropSupported: Boolean; cdecl;
    function crop(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JLuminanceSource; cdecl;
    function isRotateSupported: Boolean; cdecl;
    function invert: JLuminanceSource; cdecl;
    function rotateCounterClockwise: JLuminanceSource; cdecl;
    function rotateCounterClockwise45: JLuminanceSource; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJLuminanceSource = class(TJavaGenericImport<JLuminanceSourceClass, JLuminanceSource>) end;

  JInvertedLuminanceSourceClass = interface(JLuminanceSourceClass) // or JObjectClass
  ['{78E4DA46-BB4A-4955-8931-0379C1D5BF88}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JLuminanceSource): JInvertedLuminanceSource; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/InvertedLuminanceSource')]
  JInvertedLuminanceSource = interface(JLuminanceSource) // or JObject
  ['{679899C8-28C7-4679-8BD7-52AC7FDC2607}']
    { Property Methods }

    { methods }
    function getRow(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function getMatrix: TJavaArray<Byte>; cdecl;
    function isCropSupported: Boolean; cdecl;
    function crop(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JLuminanceSource; cdecl;
    function isRotateSupported: Boolean; cdecl;
    function invert: JLuminanceSource; cdecl;
    function rotateCounterClockwise: JLuminanceSource; cdecl;
    function rotateCounterClockwise45: JLuminanceSource; cdecl;

    { Property }
  end;

  TJInvertedLuminanceSource = class(TJavaGenericImport<JInvertedLuminanceSourceClass, JInvertedLuminanceSource>) end;

//  JBitMatrixParser_491Class = interface(JObjectClass)
//  ['{7651BEE9-363D-420B-B310-552053039966}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBitMatrix): JBitMatrixParser_491; cdecl; overload;
//    {class} function init: JBitMatrixParser_491; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/maxicode/decoder/BitMatrixParser')]
//  JBitMatrixParser_491 = interface(JObject)
//  ['{DD449FC7-E8BE-402D-B4E4-F8AA4043278B}']
//    { Property Methods }
//
//    { methods }
//    function readCodewords: TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;
//
//  TJBitMatrixParser_491 = class(TJavaGenericImport<JBitMatrixParser_491Class, JBitMatrixParser_491>) end;

//  JDecodedBitStreamParser_492Class = interface(JObjectClass)
//  ['{4F9466F3-5977-40F8-B4EC-26023346E615}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function decode(P1: TJavaArray<Byte>; P2: Integer): JDecoderResult; cdecl;
//    {class} function init: JDecodedBitStreamParser_492; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/maxicode/decoder/DecodedBitStreamParser')]
//  JDecodedBitStreamParser_492 = interface(JObject)
//  ['{8884AA68-17DB-4AC5-ACFE-FA9FEDCEBD1C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDecodedBitStreamParser_492 = class(TJavaGenericImport<JDecodedBitStreamParser_492Class, JDecodedBitStreamParser_492>) end;

//  JDecoder_493Class = interface(JObjectClass)
//  ['{40381547-D9EC-4308-9A5B-07C37A4FC479}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDecoder_493; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/maxicode/decoder/Decoder')]
//  JDecoder_493 = interface(JObject)
//  ['{9A0BAED3-0A01-4D1B-A81D-6EBB7D2B98A6}']
//    { Property Methods }
//
//    { methods }
//    function decode(P1: JBitMatrix): JDecoderResult; cdecl; overload;
//    function decode(P1: JBitMatrix; P2: JMap): JDecoderResult; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJDecoder_493 = class(TJavaGenericImport<JDecoder_493Class, JDecoder_493>) end;

  JMaxiCodeReaderClass = interface(JObjectClass)
  ['{97319B6C-B62D-401A-8407-8F5960699281}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMaxiCodeReader; cdecl; overload;
//    {class} function init: JMaxiCodeReader; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/maxicode/MaxiCodeReader')]
  JMaxiCodeReader = interface(JObject)
  ['{A53B574A-52FB-4E01-AD9E-389CDBF10F60}']
    { Property Methods }

    { methods }
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload;
    procedure reset; cdecl;

    { Property }
  end;

  TJMaxiCodeReader = class(TJavaGenericImport<JMaxiCodeReaderClass, JMaxiCodeReader>) end;

  JMultipleBarcodeReaderClass = interface(JObjectClass)
  ['{5D81F5D8-9579-41E1-BFDC-94339C5379D3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/multi/MultipleBarcodeReader')]
  JMultipleBarcodeReader = interface(IJavaInstance)
  ['{77ECAB30-5229-4193-A987-57143EA74A58}']
    { Property Methods }

    { methods }
    function decodeMultiple(P1: JBinaryBitmap): TJavaObjectArray<JResult>; cdecl; overload;
    function decodeMultiple(P1: JBinaryBitmap; P2: JMap): TJavaObjectArray<JResult>; cdecl; overload;

    { Property }
  end;

  TJMultipleBarcodeReader = class(TJavaGenericImport<JMultipleBarcodeReaderClass, JMultipleBarcodeReader>) end;

  JMultiFormatReaderClass = interface(JObjectClass)
  ['{B4EB95A7-0E73-4151-ADEB-8B8D38431FA4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMultiFormatReader; cdecl; overload;
//    {class} function init: JMultiFormatReader; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/MultiFormatReader')]
  JMultiFormatReader = interface(JObject)
  ['{71DE0F23-0B56-477F-BFE1-FF22E35F0DC3}']
    { Property Methods }

    { methods }
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload;
    function decodeWithState(P1: JBinaryBitmap): JResult; cdecl;
    procedure setHints(P1: JMap); cdecl;
    procedure reset; cdecl;

    { Property }
  end;

  TJMultiFormatReader = class(TJavaGenericImport<JMultiFormatReaderClass, JMultiFormatReader>) end;

//  JMultiFormatWriter_1Class = interface(JObjectClass)
//  ['{3AD1169B-CA06-4208-920D-2F8B2D141C59}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_BarcodeFormat: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JMultiFormatWriter_1; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_gengcon_www_jcprintersdk_zxing_BarcodeFormat: TJavaArray<Integer> read _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_BarcodeFormat;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/MultiFormatWriter$1')]
//  JMultiFormatWriter_1 = interface(JObject)
//  ['{2B50B17D-17D9-4B14-B933-F1E24EDAFE8C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJMultiFormatWriter_1 = class(TJavaGenericImport<JMultiFormatWriter_1Class, JMultiFormatWriter_1>) end;

  JMultiFormatWriterClass = interface(JObjectClass)
  ['{F44A7209-5DA1-4A79-97CC-DDF6F8B2B03A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMultiFormatWriter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/MultiFormatWriter')]
  JMultiFormatWriter = interface(JObject)
  ['{FB252F6F-2C1C-4981-B0AF-E60EA08BF2C0}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer): JBitMatrix; cdecl; overload;
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;

    { Property }
  end;

  TJMultiFormatWriter = class(TJavaGenericImport<JMultiFormatWriterClass, JMultiFormatWriter>) end;

  JNotFoundExceptionClass = interface(JReaderExceptionClass) // or JObjectClass
  ['{4AFED2CC-6A42-4B1F-B050-D64F1FB87001}']
    { static Property Methods }

    { static Methods }
    {class} function getNotFoundInstance: JNotFoundException; cdecl;
    {class} function init: JNotFoundException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/NotFoundException')]
  JNotFoundException = interface(JReaderException) // or JObject
  ['{D174CD12-1CE7-4CB1-B7DD-75B5FC59EF2B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNotFoundException = class(TJavaGenericImport<JNotFoundExceptionClass, JNotFoundException>) end;

  JOneDReaderClass = interface(JObjectClass)
  ['{43F33A6A-751B-4829-BECF-D156ACCDBBCA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOneDReader; cdecl;
    {class} procedure recordPattern(P1: JBitArray; P2: Integer; P3: TJavaArray<Integer>); cdecl;
    {class} procedure recordPatternInReverse(P1: JBitArray; P2: Integer; P3: TJavaArray<Integer>); cdecl;
    {class} function patternMatchVariance(P1: TJavaArray<Integer>; P2: TJavaArray<Integer>; P3: Single): Single; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/OneDReader')]
  JOneDReader = interface(JObject)
  ['{150E6C13-09C7-45FD-AD9D-FBBA33D17393}']
    { Property Methods }

    { methods }
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload;
    procedure reset; cdecl;
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl;

    { Property }
  end;

  TJOneDReader = class(TJavaGenericImport<JOneDReaderClass, JOneDReader>) end;

  JCodaBarReaderClass = interface(JOneDReaderClass) // or JObjectClass
  ['{C07D4C88-B454-4BAF-B6F3-FB4644C5C5A4}']
    { static Property Methods }
    {class} function _GetALPHABET: TJavaArray<Char>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHARACTER_ENCODINGS: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCodaBarReader; cdecl; overload;
    {class} function arrayContains(P1: TJavaArray<Char>; P2: Char): Boolean; cdecl;
//    {class} function init: JCodaBarReader; cdecl; overload;

    { static Property }
    {class} property ALPHABET: TJavaArray<Char> read _GetALPHABET;
    {class} property CHARACTER_ENCODINGS: TJavaArray<Integer> read _GetCHARACTER_ENCODINGS;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/CodaBarReader')]
  JCodaBarReader = interface(JOneDReader) // or JObject
  ['{7D3B39AE-CA16-49E2-BAC4-AE158F0FE61C}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl;

    { Property }
  end;

  TJCodaBarReader = class(TJavaGenericImport<JCodaBarReaderClass, JCodaBarReader>) end;

  JOneDimensionalCodeWriterClass = interface(JObjectClass)
  ['{4FD15D90-BCC8-44B3-B118-0AC80A866875}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOneDimensionalCodeWriter; cdecl; overload;
    {class} procedure checkNumeric(P1: JString); cdecl;
    {class} function appendPattern(P1: TJavaArray<Boolean>; P2: Integer; P3: TJavaArray<Integer>; P4: Boolean): Integer; cdecl;
//    {class} function init: JOneDimensionalCodeWriter; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/OneDimensionalCodeWriter')]
  JOneDimensionalCodeWriter = interface(JObject)
  ['{F1A0439C-A446-45FE-ABDB-134DB23E8885}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer): JBitMatrix; cdecl; overload;
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;
    function getDefaultMargin: Integer; cdecl;
    function encode(P1: JString): TJavaArray<Boolean>; cdecl; overload;

    { Property }
  end;

  TJOneDimensionalCodeWriter = class(TJavaGenericImport<JOneDimensionalCodeWriterClass, JOneDimensionalCodeWriter>) end;

  JCodaBarWriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass
  ['{AA41BD49-5034-456D-992A-EF261668A24A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCodaBarWriter; cdecl; overload;
//    {class} function init: JCodaBarWriter; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/CodaBarWriter')]
  JCodaBarWriter = interface(JOneDimensionalCodeWriter) // or JObject
  ['{4BCE8E45-08D1-4D63-8283-E4C96CD87B18}']
    { Property Methods }

    { methods }
    function encode(P1: JString): TJavaArray<Boolean>; cdecl;

    { Property }
  end;

  TJCodaBarWriter = class(TJavaGenericImport<JCodaBarWriterClass, JCodaBarWriter>) end;

  JCode128ReaderClass = interface(JOneDReaderClass) // or JObjectClass
  ['{CE3112C3-79A0-4F14-B88B-093B1E83372E}']
    { static Property Methods }
    {class} function _GetCODE_PATTERNS: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCode128Reader; cdecl; overload;
//    {class} function init: JCode128Reader; cdecl; overload;

    { static Property }
    {class} property CODE_PATTERNS: TJavaArray<TJavaArray<Integer>> read _GetCODE_PATTERNS;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/Code128Reader')]
  JCode128Reader = interface(JOneDReader) // or JObject
  ['{63F53965-B520-4A80-BAA0-0DB3AAB4EBD7}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl;

    { Property }
  end;

  TJCode128Reader = class(TJavaGenericImport<JCode128ReaderClass, JCode128Reader>) end;

  JCode128Writer_CTypeClass = interface(JEnumClass) // or JObjectClass
  ['{8C9BC9F5-4CA4-4A14-AC28-B4A0E7B03564}']
    { static Property Methods }
    {class} function _GetUNCODABLE: JCode128Writer_CType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetONE_DIGIT: JCode128Writer_CType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTWO_DIGITS: JCode128Writer_CType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFNC_1: JCode128Writer_CType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JCode128Writer_CType>; cdecl;
    {class} function valueOf(P1: JString): JCode128Writer_CType; cdecl;
    {class} function init: JCode128Writer_CType; cdecl;

    { static Property }
    {class} property UNCODABLE: JCode128Writer_CType read _GetUNCODABLE;
    {class} property ONE_DIGIT: JCode128Writer_CType read _GetONE_DIGIT;
    {class} property TWO_DIGITS: JCode128Writer_CType read _GetTWO_DIGITS;
    {class} property FNC_1: JCode128Writer_CType read _GetFNC_1;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/Code128Writer$CType')]
  JCode128Writer_CType = interface(JEnum) // or JObject
  ['{336463C5-6A34-4166-8E0A-9461229DB099}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCode128Writer_CType = class(TJavaGenericImport<JCode128Writer_CTypeClass, JCode128Writer_CType>) end;

  JCode128WriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass
  ['{4C34BA05-1B0A-4031-A23B-3C531ECDFEB9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode128Writer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/Code128Writer')]
  JCode128Writer = interface(JOneDimensionalCodeWriter) // or JObject
  ['{2420DD63-C47A-409D-B962-FE4430BFC19C}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;
    function encode(P1: JString): TJavaArray<Boolean>; cdecl; overload;

    { Property }
  end;

  TJCode128Writer = class(TJavaGenericImport<JCode128WriterClass, JCode128Writer>) end;

  JCode39ReaderClass = interface(JOneDReaderClass) // or JObjectClass
  ['{59F59AFA-EF47-438E-B30E-FD72BD26C792}']
    { static Property Methods }
    {class} function _GetALPHABET_STRING: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHARACTER_ENCODINGS: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetASTERISK_ENCODING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCode39Reader; cdecl; overload;
    {class} function init(P1: Boolean): JCode39Reader; cdecl; overload;
    {class} function init(P1: Boolean; P2: Boolean): JCode39Reader; cdecl; overload;
//    {class} function init: JCode39Reader; cdecl; overload;

    { static Property }
    {class} property ALPHABET_STRING: JString read _GetALPHABET_STRING;
    {class} property CHARACTER_ENCODINGS: TJavaArray<Integer> read _GetCHARACTER_ENCODINGS;
    {class} property ASTERISK_ENCODING: Integer read _GetASTERISK_ENCODING;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/Code39Reader')]
  JCode39Reader = interface(JOneDReader) // or JObject
  ['{B623BAC0-8959-4033-A0ED-15527D5774A8}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl;

    { Property }
  end;

  TJCode39Reader = class(TJavaGenericImport<JCode39ReaderClass, JCode39Reader>) end;

  JCode39WriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass
  ['{6426636C-ED52-4FA3-A56B-6CF392AA62DC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode39Writer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/Code39Writer')]
  JCode39Writer = interface(JOneDimensionalCodeWriter) // or JObject
  ['{434CF5B1-2937-4FF0-BB99-D62B65EDE46B}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;
    function encode(P1: JString): TJavaArray<Boolean>; cdecl; overload;

    { Property }
  end;

  TJCode39Writer = class(TJavaGenericImport<JCode39WriterClass, JCode39Writer>) end;

  JCode93ReaderClass = interface(JOneDReaderClass) // or JObjectClass
  ['{57E6330F-6F74-4366-B518-FD44181DE26C}']
    { static Property Methods }
    {class} function _GetALPHABET_STRING: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHARACTER_ENCODINGS: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCode93Reader; cdecl; overload;
//    {class} function init: JCode93Reader; cdecl; overload;

    { static Property }
    {class} property ALPHABET_STRING: JString read _GetALPHABET_STRING;
    {class} property CHARACTER_ENCODINGS: TJavaArray<Integer> read _GetCHARACTER_ENCODINGS;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/Code93Reader')]
  JCode93Reader = interface(JOneDReader) // or JObject
  ['{8A557E96-E2AE-46DE-9E27-EA10C3D400B9}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl;

    { Property }
  end;

  TJCode93Reader = class(TJavaGenericImport<JCode93ReaderClass, JCode93Reader>) end;

  JCode93WriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass
  ['{7D71182E-1A8D-426B-8391-A1BF15658B9F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode93Writer; cdecl;
    {class} function appendPattern(P1: TJavaArray<Boolean>; P2: Integer; P3: TJavaArray<Integer>; P4: Boolean): Integer; cdecl; //Deprecated

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/Code93Writer')]
  JCode93Writer = interface(JOneDimensionalCodeWriter) // or JObject
  ['{76D74E07-D084-4D7B-89FC-BB80ACAF846A}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;
    function encode(P1: JString): TJavaArray<Boolean>; cdecl; overload;

    { Property }
  end;

  TJCode93Writer = class(TJavaGenericImport<JCode93WriterClass, JCode93Writer>) end;

  JUPCEANReaderClass = interface(JOneDReaderClass) // or JObjectClass
  ['{73495642-0563-4689-AFFA-85315CD84B6C}']
    { static Property Methods }
    {class} function _GetSTART_END_PATTERN: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIDDLE_PATTERN: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEND_PATTERN: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetL_PATTERNS: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetL_AND_G_PATTERNS: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JUPCEANReader; cdecl; overload;
    {class} function findStartGuardPattern(P1: JBitArray): TJavaArray<Integer>; cdecl;
    {class} function checkStandardUPCEANChecksum(P1: JCharSequence): Boolean; cdecl;
    {class} function getStandardUPCEANChecksum(P1: JCharSequence): Integer; cdecl;
    {class} function findGuardPattern(P1: JBitArray; P2: Integer; P3: Boolean; P4: TJavaArray<Integer>): TJavaArray<Integer>; cdecl;
    {class} function decodeDigit(P1: JBitArray; P2: TJavaArray<Integer>; P3: Integer; P4: TJavaArray<Integer>): Integer; cdecl;
//    {class} function init: JUPCEANReader; cdecl; overload;

    { static Property }
    {class} property START_END_PATTERN: TJavaArray<Integer> read _GetSTART_END_PATTERN;
    {class} property MIDDLE_PATTERN: TJavaArray<Integer> read _GetMIDDLE_PATTERN;
    {class} property END_PATTERN: TJavaArray<Integer> read _GetEND_PATTERN;
    {class} property L_PATTERNS: TJavaArray<TJavaArray<Integer>> read _GetL_PATTERNS;
    {class} property L_AND_G_PATTERNS: TJavaArray<TJavaArray<Integer>> read _GetL_AND_G_PATTERNS;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/UPCEANReader')]
  JUPCEANReader = interface(JOneDReader) // or JObject
  ['{F290419D-26F6-474E-B2D0-D4DFAD779D3B}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl; overload;
    function decodeRow(P1: Integer; P2: JBitArray; P3: TJavaArray<Integer>; P4: JMap): JResult; cdecl; overload;
    function checkChecksum(P1: JString): Boolean; cdecl;
    function decodeEnd(P1: JBitArray; P2: Integer): TJavaArray<Integer>; cdecl;
    function getBarcodeFormat: JBarcodeFormat; cdecl;
    function decodeMiddle(P1: JBitArray; P2: TJavaArray<Integer>; P3: JStringBuilder): Integer; cdecl;

    { Property }
  end;

  TJUPCEANReader = class(TJavaGenericImport<JUPCEANReaderClass, JUPCEANReader>) end;

  JEAN13ReaderClass = interface(JUPCEANReaderClass) // or JObjectClass
  ['{BED5D936-477D-47F2-8743-C8A131A6251C}']
    { static Property Methods }
    {class} function _GetFIRST_DIGIT_ENCODINGS: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JEAN13Reader; cdecl; overload;
//    {class} function init: JEAN13Reader; cdecl; overload;

    { static Property }
    {class} property FIRST_DIGIT_ENCODINGS: TJavaArray<Integer> read _GetFIRST_DIGIT_ENCODINGS;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/EAN13Reader')]
  JEAN13Reader = interface(JUPCEANReader) // or JObject
  ['{4612FA95-C773-4FE9-B6EC-E586D97E7A92}']
    { Property Methods }

    { methods }
    function decodeMiddle(P1: JBitArray; P2: TJavaArray<Integer>; P3: JStringBuilder): Integer; cdecl;
    function getBarcodeFormat: JBarcodeFormat; cdecl;

    { Property }
  end;

  TJEAN13Reader = class(TJavaGenericImport<JEAN13ReaderClass, JEAN13Reader>) end;

  JUPCEANWriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass
  ['{26F046C2-D81B-418E-9D5A-827E2A49EC91}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCEANWriter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/UPCEANWriter')]
  JUPCEANWriter = interface(JOneDimensionalCodeWriter) // or JObject
  ['{B4F4CD44-0BC8-46A5-92EE-FCBBE683FC1B}']
    { Property Methods }

    { methods }
    function getDefaultMargin: Integer; cdecl;

    { Property }
  end;

  TJUPCEANWriter = class(TJavaGenericImport<JUPCEANWriterClass, JUPCEANWriter>) end;

  JEAN13WriterClass = interface(JUPCEANWriterClass) // or JObjectClass
  ['{17BE90B9-FC94-4126-B062-D0C40E8ED960}']
    { static Property Methods }
    {class} function _GetCODE_WIDTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JEAN13Writer; cdecl;

    { static Property }
    {class} property CODE_WIDTH: Integer read _GetCODE_WIDTH;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/EAN13Writer')]
  JEAN13Writer = interface(JUPCEANWriter) // or JObject
  ['{F3DC3A7C-F956-4191-8CA2-9981744A0824}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;
    function encode(P1: JString): TJavaArray<Boolean>; cdecl; overload;

    { Property }
  end;

  TJEAN13Writer = class(TJavaGenericImport<JEAN13WriterClass, JEAN13Writer>) end;

  JEAN8ReaderClass = interface(JUPCEANReaderClass) // or JObjectClass
  ['{AFDA210C-ECFC-4C66-B4B0-E450156CD9AF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEAN8Reader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/EAN8Reader')]
  JEAN8Reader = interface(JUPCEANReader) // or JObject
  ['{0CDD4B90-0682-40E7-B0CA-545373FE2BC4}']
    { Property Methods }

    { methods }
    function decodeMiddle(P1: JBitArray; P2: TJavaArray<Integer>; P3: JStringBuilder): Integer; cdecl;
    function getBarcodeFormat: JBarcodeFormat; cdecl;

    { Property }
  end;

  TJEAN8Reader = class(TJavaGenericImport<JEAN8ReaderClass, JEAN8Reader>) end;

  JEAN8WriterClass = interface(JUPCEANWriterClass) // or JObjectClass
  ['{84A21B91-355A-4525-88F9-FAFC1C7684EB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEAN8Writer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/EAN8Writer')]
  JEAN8Writer = interface(JUPCEANWriter) // or JObject
  ['{58E0BD2C-BC75-4E82-8228-733D68AE9088}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;
    function encode(P1: JString): TJavaArray<Boolean>; cdecl; overload;

    { Property }
  end;

  TJEAN8Writer = class(TJavaGenericImport<JEAN8WriterClass, JEAN8Writer>) end;

  JEANManufacturerOrgSupportClass = interface(JObjectClass)
  ['{2F0307C5-691D-4678-8FEC-BE8CA854D080}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEANManufacturerOrgSupport; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/EANManufacturerOrgSupport')]
  JEANManufacturerOrgSupport = interface(JObject)
  ['{A9D33316-9965-4265-87A1-E9B7F28E5316}']
    { Property Methods }

    { methods }
    function lookupCountryIdentifier(P1: JString): JString; cdecl;

    { Property }
  end;

  TJEANManufacturerOrgSupport = class(TJavaGenericImport<JEANManufacturerOrgSupportClass, JEANManufacturerOrgSupport>) end;

  JITFReaderClass = interface(JOneDReaderClass) // or JObjectClass
  ['{E3D6DE31-66C7-4A49-B0C8-ED9250A50D9E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JITFReader; cdecl; overload;
//    {class} function init: JITFReader; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/ITFReader')]
  JITFReader = interface(JOneDReader) // or JObject
  ['{DFCEFACA-70F0-43C6-859E-797A17F0FDD4}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl;

    { Property }
  end;

  TJITFReader = class(TJavaGenericImport<JITFReaderClass, JITFReader>) end;

  JITFWriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass
  ['{09039D34-A107-4F79-8483-6F98FE7C3CBC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JITFWriter; cdecl; overload;
//    {class} function init: JITFWriter; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/ITFWriter')]
  JITFWriter = interface(JOneDimensionalCodeWriter) // or JObject
  ['{851D068D-6C5E-4C1E-8598-98C7AA4C61AC}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;
    function encode(P1: JString): TJavaArray<Boolean>; cdecl; overload;

    { Property }
  end;

  TJITFWriter = class(TJavaGenericImport<JITFWriterClass, JITFWriter>) end;

  JMultiFormatOneDReaderClass = interface(JOneDReaderClass) // or JObjectClass
  ['{9E828994-9EF3-4BFF-870C-F57CAFC912BC}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JMap): JMultiFormatOneDReader; cdecl; overload;
    {class} function init: JMultiFormatOneDReader; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/MultiFormatOneDReader')]
  JMultiFormatOneDReader = interface(JOneDReader) // or JObject
  ['{C04FF6F5-14CE-4009-B78F-1B3D884EB7E0}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl;
    procedure reset; cdecl;

    { Property }
  end;

  TJMultiFormatOneDReader = class(TJavaGenericImport<JMultiFormatOneDReaderClass, JMultiFormatOneDReader>) end;

  JMultiFormatUPCEANReaderClass = interface(JOneDReaderClass) // or JObjectClass
  ['{288DFBD2-9BA1-49E2-97D7-F029C46F8B77}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JMap): JMultiFormatUPCEANReader; cdecl; overload;
    {class} function init: JMultiFormatUPCEANReader; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/MultiFormatUPCEANReader')]
  JMultiFormatUPCEANReader = interface(JOneDReader) // or JObject
  ['{5B330004-CD29-4A77-84F0-989CA4960926}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl;
    procedure reset; cdecl;

    { Property }
  end;

  TJMultiFormatUPCEANReader = class(TJavaGenericImport<JMultiFormatUPCEANReaderClass, JMultiFormatUPCEANReader>) end;

  JAbstractRSSReaderClass = interface(JOneDReaderClass) // or JObjectClass
  ['{766C8D5D-1A66-4869-95B3-FB28CEECB520}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAbstractRSSReader; cdecl;
    {class} function parseFinderValue(P1: TJavaArray<Integer>; P2: TJavaArray<Integer>): Integer; cdecl;
    {class} function count(P1: TJavaArray<Integer>): Integer; cdecl; //Deprecated
    {class} procedure increment(P1: TJavaArray<Integer>; P2: TJavaArray<Single>); cdecl;
    {class} procedure decrement(P1: TJavaArray<Integer>; P2: TJavaArray<Single>); cdecl;
    {class} function isFinderPattern(P1: TJavaArray<Integer>): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/AbstractRSSReader')]
  JAbstractRSSReader = interface(JOneDReader) // or JObject
  ['{7B890C33-31ED-45D3-BF40-7E07006A4CB4}']
    { Property Methods }

    { methods }
    function getDecodeFinderCounters: TJavaArray<Integer>; cdecl;
    function getDataCharacterCounters: TJavaArray<Integer>; cdecl;
    function getOddRoundingErrors: TJavaArray<Single>; cdecl;
    function getEvenRoundingErrors: TJavaArray<Single>; cdecl;
    function getOddCounts: TJavaArray<Integer>; cdecl;
    function getEvenCounts: TJavaArray<Integer>; cdecl;

    { Property }
  end;

  TJAbstractRSSReader = class(TJavaGenericImport<JAbstractRSSReaderClass, JAbstractRSSReader>) end;

  JDataCharacterClass = interface(JObjectClass)
  ['{FCBC51D2-6221-4A83-841E-571103E7B071}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer): JDataCharacter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/DataCharacter')]
  JDataCharacter = interface(JObject)
  ['{50E9D4C6-772E-4C28-B8BF-AFF640FA4E47}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getChecksumPortion: Integer; cdecl;
    function toString: JString; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJDataCharacter = class(TJavaGenericImport<JDataCharacterClass, JDataCharacter>) end;

  JBitArrayBuilderClass = interface(JObjectClass)
  ['{1C601AEA-0316-450A-9D11-99663B08810C}']
    { static Property Methods }

    { static Methods }
    {class} function buildBitArray(P1: JList): JBitArray; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/BitArrayBuilder')]
  JBitArrayBuilder = interface(JObject)
  ['{22F6A2BF-1097-481B-8650-0C666613891B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitArrayBuilder = class(TJavaGenericImport<JBitArrayBuilderClass, JBitArrayBuilder>) end;

  JAbstractExpandedDecoderClass = interface(JObjectClass)
  ['{CF0E64E4-8F11-42F9-B6F2-8ABCC4DE91E1}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray): JAbstractExpandedDecoder; cdecl;
    {class} function createDecoder(P1: JBitArray): JAbstractExpandedDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder')]
  JAbstractExpandedDecoder = interface(JObject)
  ['{291ADB26-BA60-4F35-A9F5-9E9EBE193C6E}']
    { Property Methods }

    { methods }
    function getInformation: JBitArray; cdecl;
    function getGeneralDecoder: JGeneralAppIdDecoder; cdecl;
    function parseInformation: JString; cdecl;

    { Property }
  end;

  TJAbstractExpandedDecoder = class(TJavaGenericImport<JAbstractExpandedDecoderClass, JAbstractExpandedDecoder>) end;

  JAI01decoderClass = interface(JAbstractExpandedDecoderClass) // or JObjectClass
  ['{5596E699-15D2-4B1A-AD86-3A14AEBEA92D}']
    { static Property Methods }
    {class} function _GetGTIN_SIZE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JBitArray): JAI01decoder; cdecl;

    { static Property }
    {class} property GTIN_SIZE: Integer read _GetGTIN_SIZE;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AI01decoder')]
  JAI01decoder = interface(JAbstractExpandedDecoder) // or JObject
  ['{21772641-3BFB-41CB-9EFB-18DF55150ED8}']
    { Property Methods }

    { methods }
    procedure encodeCompressedGtin(P1: JStringBuilder; P2: Integer); cdecl;
    procedure encodeCompressedGtinWithoutAI(P1: JStringBuilder; P2: Integer; P3: Integer); cdecl;

    { Property }
  end;

  TJAI01decoder = class(TJavaGenericImport<JAI01decoderClass, JAI01decoder>) end;

  JAI01weightDecoderClass = interface(JAI01decoderClass) // or JObjectClass
  ['{4B46C8A0-58F6-42EA-8B2D-C3994BB5B41F}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray): JAI01weightDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AI01weightDecoder')]
  JAI01weightDecoder = interface(JAI01decoder) // or JObject
  ['{48185754-1754-42D8-BCAE-EF9CFD1207DD}']
    { Property Methods }

    { methods }
    procedure encodeCompressedWeight(P1: JStringBuilder; P2: Integer; P3: Integer); cdecl;
    procedure addWeightCode(P1: JStringBuilder; P2: Integer); cdecl;
    function checkWeight(P1: Integer): Integer; cdecl;

    { Property }
  end;

  TJAI01weightDecoder = class(TJavaGenericImport<JAI01weightDecoderClass, JAI01weightDecoder>) end;

  JAI013x0xDecoderClass = interface(JAI01weightDecoderClass) // or JObjectClass
  ['{B6329B23-945A-46A0-8A22-5CFC87355CC7}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray): JAI013x0xDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AI013x0xDecoder')]
  JAI013x0xDecoder = interface(JAI01weightDecoder) // or JObject
  ['{E3FB789F-3DE7-4D4F-818F-2D7EFAA266CA}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl;

    { Property }
  end;

  TJAI013x0xDecoder = class(TJavaGenericImport<JAI013x0xDecoderClass, JAI013x0xDecoder>) end;

  JAI013103decoderClass = interface(JAI013x0xDecoderClass) // or JObjectClass
  ['{2DA14C84-6F4E-472F-A225-3417FFB5CB0B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray): JAI013103decoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AI013103decoder')]
  JAI013103decoder = interface(JAI013x0xDecoder) // or JObject
  ['{9713B281-8E4B-407F-92CD-AA0A9E580DEF}']
    { Property Methods }

    { methods }
    procedure addWeightCode(P1: JStringBuilder; P2: Integer); cdecl;
    function checkWeight(P1: Integer): Integer; cdecl;

    { Property }
  end;

  TJAI013103decoder = class(TJavaGenericImport<JAI013103decoderClass, JAI013103decoder>) end;

  JAI01320xDecoderClass = interface(JAI013x0xDecoderClass) // or JObjectClass
  ['{45A15834-9F90-48DF-8BBC-C292D111F9F8}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray): JAI01320xDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AI01320xDecoder')]
  JAI01320xDecoder = interface(JAI013x0xDecoder) // or JObject
  ['{67E064D0-A03C-43FB-9FE3-D682AD39F48C}']
    { Property Methods }

    { methods }
    procedure addWeightCode(P1: JStringBuilder; P2: Integer); cdecl;
    function checkWeight(P1: Integer): Integer; cdecl;

    { Property }
  end;

  TJAI01320xDecoder = class(TJavaGenericImport<JAI01320xDecoderClass, JAI01320xDecoder>) end;

  JAI01392xDecoderClass = interface(JAI01decoderClass) // or JObjectClass
  ['{4A6C2E26-6EC3-44B3-B2FB-F5ABCFF151F0}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray): JAI01392xDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AI01392xDecoder')]
  JAI01392xDecoder = interface(JAI01decoder) // or JObject
  ['{2516CB77-92FE-4324-ACBB-071A05B3F550}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl;

    { Property }
  end;

  TJAI01392xDecoder = class(TJavaGenericImport<JAI01392xDecoderClass, JAI01392xDecoder>) end;

  JAI01393xDecoderClass = interface(JAI01decoderClass) // or JObjectClass
  ['{52D5DDE6-6C14-4499-B7AA-E4E0F3AFDC17}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray): JAI01393xDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AI01393xDecoder')]
  JAI01393xDecoder = interface(JAI01decoder) // or JObject
  ['{F398A4E9-4C98-4444-800E-A5DC2844B89D}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl;

    { Property }
  end;

  TJAI01393xDecoder = class(TJavaGenericImport<JAI01393xDecoderClass, JAI01393xDecoder>) end;

  JAI013x0x1xDecoderClass = interface(JAI01weightDecoderClass) // or JObjectClass
  ['{95A91AB3-8D0F-4EAE-BD03-9A2502B9CBC3}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray; P2: JString; P3: JString): JAI013x0x1xDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder')]
  JAI013x0x1xDecoder = interface(JAI01weightDecoder) // or JObject
  ['{1C5053A7-7FEF-465D-B832-F6680B880B20}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl;
    procedure addWeightCode(P1: JStringBuilder; P2: Integer); cdecl;
    function checkWeight(P1: Integer): Integer; cdecl;

    { Property }
  end;

  TJAI013x0x1xDecoder = class(TJavaGenericImport<JAI013x0x1xDecoderClass, JAI013x0x1xDecoder>) end;

  JAI01AndOtherAIsClass = interface(JAI01decoderClass) // or JObjectClass
  ['{A5DBA74A-8268-485A-B60B-849A86E139B4}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray): JAI01AndOtherAIs; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AI01AndOtherAIs')]
  JAI01AndOtherAIs = interface(JAI01decoder) // or JObject
  ['{FE896ACE-CA02-4557-96FD-89931D9BF1BA}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl;

    { Property }
  end;

  TJAI01AndOtherAIs = class(TJavaGenericImport<JAI01AndOtherAIsClass, JAI01AndOtherAIs>) end;

  JAnyAIDecoderClass = interface(JAbstractExpandedDecoderClass) // or JObjectClass
  ['{1F00F2B1-B834-43AB-B30F-99B6D8720105}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray): JAnyAIDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/AnyAIDecoder')]
  JAnyAIDecoder = interface(JAbstractExpandedDecoder) // or JObject
  ['{5478C4B9-5EFD-48FB-B605-749A9D632C80}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl;

    { Property }
  end;

  TJAnyAIDecoder = class(TJavaGenericImport<JAnyAIDecoderClass, JAnyAIDecoder>) end;

  JBlockParsedResultClass = interface(JObjectClass)
  ['{0484429A-69FF-49F9-86C8-0105B4E421F1}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Boolean): JBlockParsedResult; cdecl; overload;
    {class} function init(P1: JDecodedInformation; P2: Boolean): JBlockParsedResult; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/BlockParsedResult')]
  JBlockParsedResult = interface(JObject)
  ['{952370DF-3F81-4EE1-BE9A-108589031B6F}']
    { Property Methods }

    { methods }
    function getDecodedInformation: JDecodedInformation; cdecl;
    function isFinished: Boolean; cdecl;

    { Property }
  end;

  TJBlockParsedResult = class(TJavaGenericImport<JBlockParsedResultClass, JBlockParsedResult>) end;

  JCurrentParsingState_StateClass = interface(JEnumClass) // or JObjectClass
  ['{D42662E9-4EB8-4500-8CA3-39555A7F9E14}']
    { static Property Methods }
    {class} function _GetNUMERIC: JCurrentParsingState_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALPHA: JCurrentParsingState_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO_IEC_646: JCurrentParsingState_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JCurrentParsingState_State>; cdecl;
    {class} function valueOf(P1: JString): JCurrentParsingState_State; cdecl;
    {class} function init: JCurrentParsingState_State; cdecl;

    { static Property }
    {class} property NUMERIC: JCurrentParsingState_State read _GetNUMERIC;
    {class} property ALPHA: JCurrentParsingState_State read _GetALPHA;
    {class} property ISO_IEC_646: JCurrentParsingState_State read _GetISO_IEC_646;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/CurrentParsingState$State')]
  JCurrentParsingState_State = interface(JEnum) // or JObject
  ['{F5A6FE6F-5098-4049-AAC1-4721D9D3E17F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCurrentParsingState_State = class(TJavaGenericImport<JCurrentParsingState_StateClass, JCurrentParsingState_State>) end;

  JCurrentParsingStateClass = interface(JObjectClass)
  ['{86D73678-1E1D-415F-82F1-C4F98EA7CFC9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCurrentParsingState; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/CurrentParsingState')]
  JCurrentParsingState = interface(JObject)
  ['{E0F0C52A-CF51-4567-8F7B-87347C933F25}']
    { Property Methods }

    { methods }
    function getPosition: Integer; cdecl;
    procedure setPosition(P1: Integer); cdecl;
    procedure incrementPosition(P1: Integer); cdecl;
    function isAlpha: Boolean; cdecl;
    function isNumeric: Boolean; cdecl;
    function isIsoIec646: Boolean; cdecl;
    procedure setNumeric; cdecl;
    procedure setAlpha; cdecl;
    procedure setIsoIec646; cdecl;

    { Property }
  end;

  TJCurrentParsingState = class(TJavaGenericImport<JCurrentParsingStateClass, JCurrentParsingState>) end;

  JDecodedObjectClass = interface(JObjectClass)
  ['{9E86FF57-50C9-48C4-AC20-F12A11508C70}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer): JDecodedObject; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/DecodedObject')]
  JDecodedObject = interface(JObject)
  ['{08F2BBB9-622D-4B7C-A2A3-9D11E8C98B0B}']
    { Property Methods }

    { methods }
    function getNewPosition: Integer; cdecl;

    { Property }
  end;

  TJDecodedObject = class(TJavaGenericImport<JDecodedObjectClass, JDecodedObject>) end;

  JDecodedCharClass = interface(JDecodedObjectClass) // or JObjectClass
  ['{B0C45912-9A05-4264-939D-3873D2649666}']
    { static Property Methods }
    {class} function _GetFNC1: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: Integer; P2: Char): JDecodedChar; cdecl;

    { static Property }
    {class} property FNC1: Char read _GetFNC1;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/DecodedChar')]
  JDecodedChar = interface(JDecodedObject) // or JObject
  ['{964AAF19-1FFF-492A-B797-B8725B2EE044}']
    { Property Methods }

    { methods }
    function getValue: Char; cdecl;
    function isFNC1: Boolean; cdecl;

    { Property }
  end;

  TJDecodedChar = class(TJavaGenericImport<JDecodedCharClass, JDecodedChar>) end;

  JDecodedInformationClass = interface(JDecodedObjectClass) // or JObjectClass
  ['{699EC643-5EAD-4345-A14C-9D3492D68389}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: JString): JDecodedInformation; cdecl; overload;
    {class} function init(P1: Integer; P2: JString; P3: Integer): JDecodedInformation; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/DecodedInformation')]
  JDecodedInformation = interface(JDecodedObject) // or JObject
  ['{304564F9-83E0-4B7B-9546-F2E37E1345FA}']
    { Property Methods }

    { methods }
    function getNewString: JString; cdecl;
    function isRemaining: Boolean; cdecl;
    function getRemainingValue: Integer; cdecl;

    { Property }
  end;

  TJDecodedInformation = class(TJavaGenericImport<JDecodedInformationClass, JDecodedInformation>) end;

  JDecodedNumericClass = interface(JDecodedObjectClass) // or JObjectClass
  ['{43E425A8-9EBC-4B4C-B3C6-A8532D43BAE7}']
    { static Property Methods }
    {class} function _GetFNC1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: Integer; P2: Integer; P3: Integer): JDecodedNumeric; cdecl;

    { static Property }
    {class} property FNC1: Integer read _GetFNC1;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/DecodedNumeric')]
  JDecodedNumeric = interface(JDecodedObject) // or JObject
  ['{69220830-7B63-4D89-91E1-4227631FC3E4}']
    { Property Methods }

    { methods }
    function getFirstDigit: Integer; cdecl;
    function getSecondDigit: Integer; cdecl;
    function getValue: Integer; cdecl;
    function isFirstDigitFNC1: Boolean; cdecl;
    function isSecondDigitFNC1: Boolean; cdecl;
    function isAnyFNC1: Boolean; cdecl;

    { Property }
  end;

  TJDecodedNumeric = class(TJavaGenericImport<JDecodedNumericClass, JDecodedNumeric>) end;

  JFieldParserClass = interface(JObjectClass)
  ['{C0896CD6-DE88-4281-853E-6F294F8D3A41}']
    { static Property Methods }

    { static Methods }
    {class} function parseFieldsInGeneralPurpose(P1: JString): JString; cdecl;
    {class} function init: JFieldParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/FieldParser')]
  JFieldParser = interface(JObject)
  ['{BAC278CA-BD06-4862-BD5A-A5DF0F03AB4E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFieldParser = class(TJavaGenericImport<JFieldParserClass, JFieldParser>) end;

  JGeneralAppIdDecoderClass = interface(JObjectClass)
  ['{BAA82370-0543-4AC4-B578-C4C0CE84D7D8}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitArray): JGeneralAppIdDecoder; cdecl;
    {class} function extractNumericValueFromBitArray(P1: JBitArray; P2: Integer; P3: Integer): Integer; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder')]
  JGeneralAppIdDecoder = interface(JObject)
  ['{A0804E49-19F2-473B-B9F1-83B641D1B613}']
    { Property Methods }

    { methods }
    function decodeAllCodes(P1: JStringBuilder; P2: Integer): JString; cdecl;
    function extractNumericValueFromBitArray(P1: Integer; P2: Integer): Integer; cdecl; overload;
    function decodeGeneralPurposeField(P1: Integer; P2: JString): JDecodedInformation; cdecl;

    { Property }
  end;

  TJGeneralAppIdDecoder = class(TJavaGenericImport<JGeneralAppIdDecoderClass, JGeneralAppIdDecoder>) end;

  JExpandedPairClass = interface(JObjectClass)
  ['{2159774A-4A37-49CB-B1C3-B0EDFD8EECFC}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JDataCharacter; P2: JDataCharacter; P3: JFinderPattern; P4: Boolean): JExpandedPair; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/ExpandedPair')]
  JExpandedPair = interface(JObject)
  ['{381F3C87-7370-4C86-A69F-1E2846343370}']
    { Property Methods }

    { methods }
    function mayBeLast: Boolean; cdecl;
    function getLeftChar: JDataCharacter; cdecl;
    function getRightChar: JDataCharacter; cdecl;
    function getFinderPattern: JFinderPattern; cdecl;
    function mustBeLast: Boolean; cdecl;
    function toString: JString; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJExpandedPair = class(TJavaGenericImport<JExpandedPairClass, JExpandedPair>) end;

  JExpandedRowClass = interface(JObjectClass)
  ['{E93A8C76-CB1D-4E33-AADE-BF2B723E2258}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JList; P2: Integer; P3: Boolean): JExpandedRow; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/ExpandedRow')]
  JExpandedRow = interface(JObject)
  ['{E0C907E9-971D-4D36-91CC-FD0A3365CED4}']
    { Property Methods }

    { methods }
    function getPairs: JList; cdecl;
    function getRowNumber: Integer; cdecl;
    function isReversed: Boolean; cdecl;
    function isEquivalent(P1: JList): Boolean; cdecl;
    function toString: JString; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJExpandedRow = class(TJavaGenericImport<JExpandedRowClass, JExpandedRow>) end;

  JRSSExpandedReaderClass = interface(JAbstractRSSReaderClass) // or JObjectClass
  ['{F3C888EA-1EE7-4699-B066-5C8B073C4DA8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRSSExpandedReader; cdecl; overload;
    {class} function constructResult(P1: JList): JResult; cdecl;
//    {class} function init: JRSSExpandedReader; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/expanded/RSSExpandedReader')]
  JRSSExpandedReader = interface(JAbstractRSSReader) // or JObject
  ['{F2762451-97B7-4449-84EA-1334051CCC56}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl;
    procedure reset; cdecl;
    function decodeRow2pairs(P1: Integer; P2: JBitArray): JList; cdecl;
    function getRows: JList; cdecl;
    function retrieveNextPair(P1: JBitArray; P2: JList; P3: Integer): JExpandedPair; cdecl;
    function decodeDataCharacter(P1: JBitArray; P2: JFinderPattern; P3: Boolean; P4: Boolean): JDataCharacter; cdecl;

    { Property }
  end;

  TJRSSExpandedReader = class(TJavaGenericImport<JRSSExpandedReaderClass, JRSSExpandedReader>) end;

  JFinderPatternClass = interface(JObjectClass)
  ['{4F8FE5FE-D8EC-425C-801B-98D997955532}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: TJavaArray<Integer>; P3: Integer; P4: Integer; P5: Integer): JFinderPattern; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/FinderPattern')]
  JFinderPattern = interface(JObject)
  ['{53E56A4E-9B2C-4507-B6C9-03DB82913204}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getStartEnd: TJavaArray<Integer>; cdecl;
    function getResultPoints: TJavaObjectArray<JResultPoint>; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJFinderPattern = class(TJavaGenericImport<JFinderPatternClass, JFinderPattern>) end;

  JPairClass = interface(JDataCharacterClass) // or JObjectClass
  ['{213CF899-9634-4B35-8D06-31D9C59627F6}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer; P3: JFinderPattern): JPair; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/Pair')]
  JPair = interface(JDataCharacter) // or JObject
  ['{F31056F5-10F5-4F52-949D-5188CD777899}']
    { Property Methods }

    { methods }
    function getFinderPattern: JFinderPattern; cdecl;
    function getCount: Integer; cdecl;
    procedure incrementCount; cdecl;

    { Property }
  end;

  TJPair = class(TJavaGenericImport<JPairClass, JPair>) end;

  JRSS14ReaderClass = interface(JAbstractRSSReaderClass) // or JObjectClass
  ['{7DFE5A0A-6024-45DF-928B-2435EEF991A6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRSS14Reader; cdecl; overload;
//    {class} function init: JRSS14Reader; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/RSS14Reader')]
  JRSS14Reader = interface(JAbstractRSSReader) // or JObject
  ['{45AD7999-CD4A-4DD2-A625-67AA349EBC1E}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl;
    procedure reset; cdecl;

    { Property }
  end;

  TJRSS14Reader = class(TJavaGenericImport<JRSS14ReaderClass, JRSS14Reader>) end;

  JRSSUtilsClass = interface(JObjectClass)
  ['{6D3B59CF-498C-4AC0-955B-D75DB1044A92}']
    { static Property Methods }

    { static Methods }
    {class} function getRSSvalue(P1: TJavaArray<Integer>; P2: Integer; P3: Boolean): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/rss/RSSUtils')]
  JRSSUtils = interface(JObject)
  ['{489D481E-B7AB-461A-BBDD-2ACA4878C8BA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRSSUtils = class(TJavaGenericImport<JRSSUtilsClass, JRSSUtils>) end;

  JUPCAReaderClass = interface(JUPCEANReaderClass) // or JObjectClass
  ['{5D2A1C42-B168-4192-B555-49DFCE6D3262}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCAReader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/UPCAReader')]
  JUPCAReader = interface(JUPCEANReader) // or JObject
  ['{8DC6426E-F16B-44B8-94C5-C0EA711E5423}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: TJavaArray<Integer>; P4: JMap): JResult; cdecl; overload;
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl; overload;
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload;
    function getBarcodeFormat: JBarcodeFormat; cdecl;
    function decodeMiddle(P1: JBitArray; P2: TJavaArray<Integer>; P3: JStringBuilder): Integer; cdecl;

    { Property }
  end;

  TJUPCAReader = class(TJavaGenericImport<JUPCAReaderClass, JUPCAReader>) end;

  JUPCAWriterClass = interface(JObjectClass)
  ['{847AE1C9-269A-4008-B13F-6CF2B3301391}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCAWriter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/UPCAWriter')]
  JUPCAWriter = interface(JObject)
  ['{71408234-C1FA-4BE3-887D-D513FDDD7841}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer): JBitMatrix; cdecl; overload;
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;

    { Property }
  end;

  TJUPCAWriter = class(TJavaGenericImport<JUPCAWriterClass, JUPCAWriter>) end;

  JUPCEANExtension2SupportClass = interface(JObjectClass)
  ['{921915F1-D6E6-4E85-A176-C687CA35E674}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCEANExtension2Support; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/UPCEANExtension2Support')]
  JUPCEANExtension2Support = interface(JObject)
  ['{11123160-3B7D-474B-8224-B447C8BA617F}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: TJavaArray<Integer>): JResult; cdecl;

    { Property }
  end;

  TJUPCEANExtension2Support = class(TJavaGenericImport<JUPCEANExtension2SupportClass, JUPCEANExtension2Support>) end;

  JUPCEANExtension5SupportClass = interface(JObjectClass)
  ['{AFA515BC-8307-47B3-9A4A-1039CAE6D0CD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCEANExtension5Support; cdecl; overload;
//    {class} function init: JUPCEANExtension5Support; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/UPCEANExtension5Support')]
  JUPCEANExtension5Support = interface(JObject)
  ['{0026BDD1-50F7-4A1E-9848-4E4BFD86802B}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: TJavaArray<Integer>): JResult; cdecl;

    { Property }
  end;

  TJUPCEANExtension5Support = class(TJavaGenericImport<JUPCEANExtension5SupportClass, JUPCEANExtension5Support>) end;

  JUPCEANExtensionSupportClass = interface(JObjectClass)
  ['{86429B9E-0C76-4951-AA57-44061B365B32}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCEANExtensionSupport; cdecl; overload;
//    {class} function init: JUPCEANExtensionSupport; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/UPCEANExtensionSupport')]
  JUPCEANExtensionSupport = interface(JObject)
  ['{350642DB-A7BE-4600-A3FE-3E5F7F1009B7}']
    { Property Methods }

    { methods }
    function decodeRow(P1: Integer; P2: JBitArray; P3: Integer): JResult; cdecl;

    { Property }
  end;

  TJUPCEANExtensionSupport = class(TJavaGenericImport<JUPCEANExtensionSupportClass, JUPCEANExtensionSupport>) end;

  JUPCEReaderClass = interface(JUPCEANReaderClass) // or JObjectClass
  ['{1817C185-B892-49E5-8A80-2D34812D4F7B}']
    { static Property Methods }
    {class} function _GetNUMSYS_AND_CHECK_DIGIT_PATTERNS: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JUPCEReader; cdecl; overload;
    {class} function convertUPCEtoUPCA(P1: JString): JString; cdecl;
//    {class} function init: JUPCEReader; cdecl; overload;

    { static Property }
    {class} property NUMSYS_AND_CHECK_DIGIT_PATTERNS: TJavaArray<TJavaArray<Integer>> read _GetNUMSYS_AND_CHECK_DIGIT_PATTERNS;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/UPCEReader')]
  JUPCEReader = interface(JUPCEANReader) // or JObject
  ['{DEF66D3F-0803-4C15-812D-4F7CA7B70321}']
    { Property Methods }

    { methods }
    function decodeMiddle(P1: JBitArray; P2: TJavaArray<Integer>; P3: JStringBuilder): Integer; cdecl;
    function decodeEnd(P1: JBitArray; P2: Integer): TJavaArray<Integer>; cdecl;
    function checkChecksum(P1: JString): Boolean; cdecl;
    function getBarcodeFormat: JBarcodeFormat; cdecl;

    { Property }
  end;

  TJUPCEReader = class(TJavaGenericImport<JUPCEReaderClass, JUPCEReader>) end;

  JUPCEWriterClass = interface(JUPCEANWriterClass) // or JObjectClass
  ['{855D0668-748B-4F88-8C15-8D6E97EE5D99}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCEWriter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/oned/UPCEWriter')]
  JUPCEWriter = interface(JUPCEANWriter) // or JObject
  ['{4D3D6619-9083-40E9-9707-99D971CD2A12}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;
    function encode(P1: JString): TJavaArray<Boolean>; cdecl; overload;

    { Property }
  end;

  TJUPCEWriter = class(TJavaGenericImport<JUPCEWriterClass, JUPCEWriter>) end;

  JBarcodeMetadataClass = interface(JObjectClass)
  ['{15E58181-6EAB-42B2-9EAD-A6A0A0A803E7}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JBarcodeMetadata; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/BarcodeMetadata')]
  JBarcodeMetadata = interface(JObject)
  ['{DEC97374-963B-4DC4-94E8-F1D5C0C4810E}']
    { Property Methods }

    { methods }
    function getColumnCount: Integer; cdecl;
    function getErrorCorrectionLevel: Integer; cdecl;
    function getRowCount: Integer; cdecl;
    function getRowCountUpperPart: Integer; cdecl;
    function getRowCountLowerPart: Integer; cdecl;

    { Property }
  end;

  TJBarcodeMetadata = class(TJavaGenericImport<JBarcodeMetadataClass, JBarcodeMetadata>) end;

  JBarcodeValueClass = interface(JObjectClass)
  ['{A4EE1E3B-DDFA-4FD1-BD2A-46CDEF24D1FF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBarcodeValue; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/BarcodeValue')]
  JBarcodeValue = interface(JObject)
  ['{69BEFC6D-0E94-478B-B5A3-75BEAD7105C2}']
    { Property Methods }

    { methods }
    procedure setValue(P1: Integer); cdecl;
    function getValue: TJavaArray<Integer>; cdecl;
    function getConfidence(P1: Integer): JInteger; cdecl;

    { Property }
  end;

  TJBarcodeValue = class(TJavaGenericImport<JBarcodeValueClass, JBarcodeValue>) end;

  JBoundingBoxClass = interface(JObjectClass)
  ['{112DEA30-B9C5-4B87-9983-CC243C4CF7F5}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitMatrix; P2: JResultPoint; P3: JResultPoint; P4: JResultPoint; P5: JResultPoint): JBoundingBox; cdecl; overload;
    {class} function init(P1: JBoundingBox): JBoundingBox; cdecl; overload;
    {class} function merge(P1: JBoundingBox; P2: JBoundingBox): JBoundingBox; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/BoundingBox')]
  JBoundingBox = interface(JObject)
  ['{5C928F6A-F509-43DE-8730-7D5904D5D93D}']
    { Property Methods }

    { methods }
    function addMissingRows(P1: Integer; P2: Integer; P3: Boolean): JBoundingBox; cdecl;
    function getMinX: Integer; cdecl;
    function getMaxX: Integer; cdecl;
    function getMinY: Integer; cdecl;
    function getMaxY: Integer; cdecl;
    function getTopLeft: JResultPoint; cdecl;
    function getTopRight: JResultPoint; cdecl;
    function getBottomLeft: JResultPoint; cdecl;
    function getBottomRight: JResultPoint; cdecl;

    { Property }
  end;

  TJBoundingBox = class(TJavaGenericImport<JBoundingBoxClass, JBoundingBox>) end;

  JCodewordClass = interface(JObjectClass)
  ['{19B938E0-B6EC-463D-A561-5DF9A5825911}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JCodeword; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/Codeword')]
  JCodeword = interface(JObject)
  ['{45E0EF5B-1182-4615-BC37-FF6C79A4E2EC}']
    { Property Methods }

    { methods }
    function hasValidRowNumber: Boolean; cdecl;
    function isValidRowNumber(P1: Integer): Boolean; cdecl;
    procedure setRowNumberAsRowIndicatorColumn; cdecl;
    function getWidth: Integer; cdecl;
    function getStartX: Integer; cdecl;
    function getEndX: Integer; cdecl;
    function getBucket: Integer; cdecl;
    function getValue: Integer; cdecl;
    function getRowNumber: Integer; cdecl;
    procedure setRowNumber(P1: Integer); cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJCodeword = class(TJavaGenericImport<JCodewordClass, JCodeword>) end;

//  JDecodedBitStreamParser_1_563Class = interface(JObjectClass)
//  ['{BCDDBA88-0FE4-4411-AF53-5BC46CB97CB5}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_pdf417_decoder_DecodedBitStreamParser_Mode: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JDecodedBitStreamParser_1_563; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_gengcon_www_jcprintersdk_zxing_pdf417_decoder_DecodedBitStreamParser_Mode: TJavaArray<Integer> read _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_pdf417_decoder_DecodedBitStreamParser_Mode;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/DecodedBitStreamParser$1')]
//  JDecodedBitStreamParser_1_563 = interface(JObject)
//  ['{9521F091-F701-491B-950B-25E7BFA0AF6E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDecodedBitStreamParser_1_563 = class(TJavaGenericImport<JDecodedBitStreamParser_1_563Class, JDecodedBitStreamParser_1_563>) end;

//  JDecodedBitStreamParser_Mode_564Class = interface(JEnumClass) // or JObjectClass
//  ['{C57B0742-330C-472C-9BD5-D74318AFF64F}']
//    { static Property Methods }
//    {class} function _GetALPHA: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetLOWER: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetMIXED: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetPUNCT: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetALPHA_SHIFT: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetPUNCT_SHIFT: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<JDecodedBitStreamParser_Mode>; cdecl;
//    {class} function valueOf(P1: JString): JDecodedBitStreamParser_Mode; cdecl;
//    {class} function init: JDecodedBitStreamParser_Mode_564; cdecl;
//
//    { static Property }
//    {class} property ALPHA: JDecodedBitStreamParser_Mode read _GetALPHA;
//    {class} property LOWER: JDecodedBitStreamParser_Mode read _GetLOWER;
//    {class} property MIXED: JDecodedBitStreamParser_Mode read _GetMIXED;
//    {class} property PUNCT: JDecodedBitStreamParser_Mode read _GetPUNCT;
//    {class} property ALPHA_SHIFT: JDecodedBitStreamParser_Mode read _GetALPHA_SHIFT;
//    {class} property PUNCT_SHIFT: JDecodedBitStreamParser_Mode read _GetPUNCT_SHIFT;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/DecodedBitStreamParser$Mode')]
//  JDecodedBitStreamParser_Mode_564 = interface(JEnum) // or JObject
//  ['{6F7991FF-F17F-4223-B9C9-D16B62F4DF24}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDecodedBitStreamParser_Mode_564 = class(TJavaGenericImport<JDecodedBitStreamParser_Mode_564Class, JDecodedBitStreamParser_Mode_564>) end;

//  JDecodedBitStreamParser_565Class = interface(JObjectClass)
//  ['{42FC839A-F3C0-427A-958D-CEB73599A125}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function decode(P1: TJavaArray<Integer>; P2: JString): JDecoderResult; cdecl;
//    {class} function decodeMacroBlock(P1: TJavaArray<Integer>; P2: Integer; P3: JPDF417ResultMetadata): Integer; cdecl;
//    {class} function init: JDecodedBitStreamParser_565; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/DecodedBitStreamParser')]
//  JDecodedBitStreamParser_565 = interface(JObject)
//  ['{D59671B6-432E-4908-A0AE-81605AED240D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDecodedBitStreamParser_565 = class(TJavaGenericImport<JDecodedBitStreamParser_565Class, JDecodedBitStreamParser_565>) end;

  JDetectionResultClass = interface(JObjectClass)
  ['{633C883A-6ABB-45AC-95DE-17903E9E34E5}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBarcodeMetadata; P2: JBoundingBox): JDetectionResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/DetectionResult')]
  JDetectionResult = interface(JObject)
  ['{E6C75DF2-2C6B-4AF6-970D-6E77ABAA5F3D}']
    { Property Methods }

    { methods }
    function getDetectionResultColumns: TJavaObjectArray<JDetectionResultColumn>; cdecl;
    function getBarcodeColumnCount: Integer; cdecl;
    function getBarcodeRowCount: Integer; cdecl;
    function getBarcodeECLevel: Integer; cdecl;
    procedure setBoundingBox(P1: JBoundingBox); cdecl;
    function getBoundingBox: JBoundingBox; cdecl;
    procedure setDetectionResultColumn(P1: Integer; P2: JDetectionResultColumn); cdecl;
    function getDetectionResultColumn(P1: Integer): JDetectionResultColumn; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJDetectionResult = class(TJavaGenericImport<JDetectionResultClass, JDetectionResult>) end;

  JDetectionResultColumnClass = interface(JObjectClass)
  ['{891A7953-E17C-4E13-A592-E33B68A4CE61}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBoundingBox): JDetectionResultColumn; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/DetectionResultColumn')]
  JDetectionResultColumn = interface(JObject)
  ['{224463C7-24BC-426B-9D1A-5AB18B475C7C}']
    { Property Methods }

    { methods }
    function getCodewordNearby(P1: Integer): JCodeword; cdecl;
    function imageRowToCodewordIndex(P1: Integer): Integer; cdecl;
    procedure setCodeword(P1: Integer; P2: JCodeword); cdecl;
    function getCodeword(P1: Integer): JCodeword; cdecl;
    function getBoundingBox: JBoundingBox; cdecl;
    function getCodewords: TJavaObjectArray<JCodeword>; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJDetectionResultColumn = class(TJavaGenericImport<JDetectionResultColumnClass, JDetectionResultColumn>) end;

  JDetectionResultRowIndicatorColumnClass = interface(JDetectionResultColumnClass) // or JObjectClass
  ['{42B1B802-9EEF-45B3-A921-1FAB3E0E5362}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBoundingBox; P2: Boolean): JDetectionResultRowIndicatorColumn; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn')]
  JDetectionResultRowIndicatorColumn = interface(JDetectionResultColumn) // or JObject
  ['{0CF3D8A2-25E7-484F-BCAF-ED34195FAD24}']
    { Property Methods }

    { methods }
    procedure adjustCompleteIndicatorColumnRowNumbers(P1: JBarcodeMetadata); cdecl;
    function getRowHeights: TJavaArray<Integer>; cdecl;
    function getBarcodeMetadata: JBarcodeMetadata; cdecl;
    function isLeft: Boolean; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJDetectionResultRowIndicatorColumn = class(TJavaGenericImport<JDetectionResultRowIndicatorColumnClass, JDetectionResultRowIndicatorColumn>) end;

//  JErrorCorrection_569Class = interface(JObjectClass)
//  ['{71E3DE06-B9BC-47F3-8C9B-DE39D992CED9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JErrorCorrection_569; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/ec/ErrorCorrection')]
//  JErrorCorrection_569 = interface(JObject)
//  ['{970D7015-2321-4A28-8CB9-40EC364860C8}']
//    { Property Methods }
//
//    { methods }
//    function decode(P1: TJavaArray<Integer>; P2: Integer; P3: TJavaArray<Integer>): Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJErrorCorrection_569 = class(TJavaGenericImport<JErrorCorrection_569Class, JErrorCorrection_569>) end;

  JModulusGFClass = interface(JObjectClass)
  ['{638F5467-CA43-4A75-AAE8-0E666430B030}']
    { static Property Methods }
    {class} function _GetPDF417_GF: JModulusGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JModulusGF; cdecl;

    { static Property }
    {class} property PDF417_GF: JModulusGF read _GetPDF417_GF;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/ec/ModulusGF')]
  JModulusGF = interface(JObject)
  ['{B8396816-0FD6-4DEB-9084-6CC824735731}']
    { Property Methods }

    { methods }
    function getZero: JModulusPoly; cdecl;
    function getOne: JModulusPoly; cdecl;
    function buildMonomial(P1: Integer; P2: Integer): JModulusPoly; cdecl;
    function add(P1: Integer; P2: Integer): Integer; cdecl;
    function subtract(P1: Integer; P2: Integer): Integer; cdecl;
    function exp(P1: Integer): Integer; cdecl;
    function log(P1: Integer): Integer; cdecl;
    function inverse(P1: Integer): Integer; cdecl;
    function multiply(P1: Integer; P2: Integer): Integer; cdecl;
    function getSize: Integer; cdecl;

    { Property }
  end;

  TJModulusGF = class(TJavaGenericImport<JModulusGFClass, JModulusGF>) end;

  JModulusPolyClass = interface(JObjectClass)
  ['{88A67A15-8965-4C96-98AA-4FD2D696BC59}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JModulusGF; P2: TJavaArray<Integer>): JModulusPoly; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/ec/ModulusPoly')]
  JModulusPoly = interface(JObject)
  ['{A5B20193-B897-49CA-809E-73E492B0C87B}']
    { Property Methods }

    { methods }
    function getCoefficients: TJavaArray<Integer>; cdecl;
    function getDegree: Integer; cdecl;
    function isZero: Boolean; cdecl;
    function getCoefficient(P1: Integer): Integer; cdecl;
    function evaluateAt(P1: Integer): Integer; cdecl;
    function add(P1: JModulusPoly): JModulusPoly; cdecl;
    function subtract(P1: JModulusPoly): JModulusPoly; cdecl;
    function multiply(P1: JModulusPoly): JModulusPoly; cdecl; overload;
    function negative: JModulusPoly; cdecl;
    function multiply(P1: Integer): JModulusPoly; cdecl; overload;
    function multiplyByMonomial(P1: Integer; P2: Integer): JModulusPoly; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJModulusPoly = class(TJavaGenericImport<JModulusPolyClass, JModulusPoly>) end;

  JPDF417CodewordDecoderClass = interface(JObjectClass)
  ['{5D45723A-63CC-4C2E-9EE7-569C82C74707}']
    { static Property Methods }

    { static Methods }
    {class} function getDecodedValue(P1: TJavaArray<Integer>): Integer; cdecl;
    {class} function init: JPDF417CodewordDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/PDF417CodewordDecoder')]
  JPDF417CodewordDecoder = interface(JObject)
  ['{E67390BE-605B-4246-8AC4-383AAD69D2AF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417CodewordDecoder = class(TJavaGenericImport<JPDF417CodewordDecoderClass, JPDF417CodewordDecoder>) end;

  JPDF417ScanningDecoderClass = interface(JObjectClass)
  ['{A8343FC3-2CEB-4F09-92C4-CA8C881BF5F8}']
    { static Property Methods }

    { static Methods }
    {class} function decode(P1: JBitMatrix; P2: JResultPoint; P3: JResultPoint; P4: JResultPoint; P5: JResultPoint; P6: Integer; P7: Integer): JDecoderResult; cdecl;
    {class} function toString(P1: TJavaObjectArray<JBarcodeValue>): JString; cdecl;
    {class} function init: JPDF417ScanningDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/decoder/PDF417ScanningDecoder')]
  JPDF417ScanningDecoder = interface(JObject)
  ['{C31DB27A-0273-4BDA-A0A7-73480419A981}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417ScanningDecoder = class(TJavaGenericImport<JPDF417ScanningDecoderClass, JPDF417ScanningDecoder>) end;

//  JDetector_574Class = interface(JObjectClass)
//  ['{E8D11CF6-4141-4BA3-B85D-C48659A8597E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function detect(P1: JBinaryBitmap; P2: JMap; P3: Boolean): JPDF417DetectorResult; cdecl;
//    {class} function init: JDetector_574; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/detector/Detector')]
//  JDetector_574 = interface(JObject)
//  ['{83C9E4D6-242C-40E2-AD1B-0ECA45D000ED}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDetector_574 = class(TJavaGenericImport<JDetector_574Class, JDetector_574>) end;

  JPDF417DetectorResultClass = interface(JObjectClass)
  ['{CC33232D-3962-4C44-B67B-B382C84185E4}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitMatrix; P2: JList): JPDF417DetectorResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/detector/PDF417DetectorResult')]
  JPDF417DetectorResult = interface(JObject)
  ['{E55AC885-E090-4867-8EF3-C462E1FDE7F8}']
    { Property Methods }

    { methods }
    function getBits: JBitMatrix; cdecl;
    function getPoints: JList; cdecl;

    { Property }
  end;

  TJPDF417DetectorResult = class(TJavaGenericImport<JPDF417DetectorResultClass, JPDF417DetectorResult>) end;

  JBarcodeMatrixClass = interface(JObjectClass)
  ['{51B635E0-116D-4E17-AAE2-CE510E3ED60B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer): JBarcodeMatrix; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/encoder/BarcodeMatrix')]
  JBarcodeMatrix = interface(JObject)
  ['{454527F3-8224-46C9-8652-E6696D208010}']
    { Property Methods }

    { methods }
    procedure &set(P1: Integer; P2: Integer; P3: Byte); cdecl;
    procedure startRow; cdecl;
    function getCurrentRow: JBarcodeRow; cdecl;
    function getMatrix: TJavaArray<TJavaArray<Byte>>; cdecl;
    function getScaledMatrix(P1: Integer; P2: Integer): TJavaArray<TJavaArray<Byte>>; cdecl;

    { Property }
  end;

  TJBarcodeMatrix = class(TJavaGenericImport<JBarcodeMatrixClass, JBarcodeMatrix>) end;

  JBarcodeRowClass = interface(JObjectClass)
  ['{F195BA02-C0A4-44EE-A919-CB83D7FFB982}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer): JBarcodeRow; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/encoder/BarcodeRow')]
  JBarcodeRow = interface(JObject)
  ['{FA7612F0-859D-4DB8-BC8B-D48C8DE9ABDF}']
    { Property Methods }

    { methods }
    procedure &set(P1: Integer; P2: Byte); cdecl;
    procedure addBar(P1: Boolean; P2: Integer); cdecl;
    function getScaledRow(P1: Integer): TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJBarcodeRow = class(TJavaGenericImport<JBarcodeRowClass, JBarcodeRow>) end;

  JCompactionClass = interface(JEnumClass) // or JObjectClass
  ['{4B5D606A-B752-4291-8364-6991D0642A9B}']
    { static Property Methods }
    {class} function _GetAUTO: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEXT: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBYTE: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNUMERIC: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JCompaction>; cdecl;
    {class} function valueOf(P1: JString): JCompaction; cdecl;
    {class} function init: JCompaction; cdecl;

    { static Property }
    {class} property AUTO: JCompaction read _GetAUTO;
    {class} property TEXT: JCompaction read _GetTEXT;
    {class} property BYTE: JCompaction read _GetBYTE;
    {class} property NUMERIC: JCompaction read _GetNUMERIC;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/encoder/Compaction')]
  JCompaction = interface(JEnum) // or JObject
  ['{F5282105-EBFA-4ADC-AF61-291CAEA1E541}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCompaction = class(TJavaGenericImport<JCompactionClass, JCompaction>) end;

  JDimensionsClass = interface(JObjectClass)
  ['{6C182C32-F6F5-4BB8-A676-77C151E1AE52}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JDimensions; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/encoder/Dimensions')]
  JDimensions = interface(JObject)
  ['{141691BB-9194-47D4-86DB-42C264266E5D}']
    { Property Methods }

    { methods }
    function getMinCols: Integer; cdecl;
    function getMaxCols: Integer; cdecl;
    function getMinRows: Integer; cdecl;
    function getMaxRows: Integer; cdecl;

    { Property }
  end;

  TJDimensions = class(TJavaGenericImport<JDimensionsClass, JDimensions>) end;

  JPDF417Class = interface(JObjectClass)
  ['{0672E6C0-C9AF-4736-8FC5-EE1EF1D4D253}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417; cdecl; overload;
    {class} function init(P1: Boolean): JPDF417; cdecl; overload;
//    {class} function init: JPDF417; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/encoder/PDF417')]
  JPDF417 = interface(JObject)
  ['{260C5A7F-0C93-4471-8DCC-EE63DD5B6A7D}']
    { Property Methods }

    { methods }
    function getBarcodeMatrix: JBarcodeMatrix; cdecl;
    procedure generateBarcodeLogic(P1: JString; P2: Integer); cdecl;
    procedure setDimensions(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
    procedure setCompaction(P1: JCompaction); cdecl;
    procedure setCompact(P1: Boolean); cdecl;
    procedure setEncoding(P1: JCharset); cdecl;

    { Property }
  end;

  TJPDF417 = class(TJavaGenericImport<JPDF417Class, JPDF417>) end;

  JPDF417ErrorCorrectionClass = interface(JObjectClass)
  ['{8CB80586-B8B6-40C1-9AD3-9F22265DDFBA}']
    { static Property Methods }

    { static Methods }
    {class} function getErrorCorrectionCodewordCount(P1: Integer): Integer; cdecl;
    {class} function getRecommendedMinimumErrorCorrectionLevel(P1: Integer): Integer; cdecl;
    {class} function generateErrorCorrection(P1: JCharSequence; P2: Integer): JString; cdecl;
    {class} function init: JPDF417ErrorCorrection; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/encoder/PDF417ErrorCorrection')]
  JPDF417ErrorCorrection = interface(JObject)
  ['{6C2E3225-0190-471A-A574-98D8C4AF6C9D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417ErrorCorrection = class(TJavaGenericImport<JPDF417ErrorCorrectionClass, JPDF417ErrorCorrection>) end;

//  JPDF417HighLevelEncoder_1Class = interface(JObjectClass)
//  ['{B12F2C85-4D60-49B0-B0B1-1ECD6597D61D}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_pdf417_encoder_Compaction: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JPDF417HighLevelEncoder_1; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_gengcon_www_jcprintersdk_zxing_pdf417_encoder_Compaction: TJavaArray<Integer> read _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_pdf417_encoder_Compaction;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/encoder/PDF417HighLevelEncoder$1')]
//  JPDF417HighLevelEncoder_1 = interface(JObject)
//  ['{85438C43-9954-442E-9066-DB66F37B758B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJPDF417HighLevelEncoder_1 = class(TJavaGenericImport<JPDF417HighLevelEncoder_1Class, JPDF417HighLevelEncoder_1>) end;

  JPDF417HighLevelEncoderClass = interface(JObjectClass)
  ['{E36BA979-BB8F-465C-9C2A-72C523A9D880}']
    { static Property Methods }

    { static Methods }
    {class} function encodeHighLevel(P1: JString; P2: JCompaction; P3: JCharset): JString; cdecl;
    {class} function init: JPDF417HighLevelEncoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/encoder/PDF417HighLevelEncoder')]
  JPDF417HighLevelEncoder = interface(JObject)
  ['{25F92BB1-2902-4E99-B2C6-30D2C438A56D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417HighLevelEncoder = class(TJavaGenericImport<JPDF417HighLevelEncoderClass, JPDF417HighLevelEncoder>) end;

  JPDF417CommonClass = interface(JObjectClass)
  ['{9453B9FD-6706-486A-8C7E-D3BD19B82EAB}']
    { static Property Methods }
    {class} function _GetNUMBER_OF_CODEWORDS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_CODEWORDS_IN_BARCODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIN_ROWS_IN_BARCODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_ROWS_IN_BARCODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODULES_IN_CODEWORD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODULES_IN_STOP_PATTERN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBARS_IN_MODULE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYMBOL_TABLE: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getBitCountSum(P1: TJavaArray<Integer>): Integer; cdecl; //Deprecated
    {class} function toIntArray(P1: JCollection): TJavaArray<Integer>; cdecl;
    {class} function getCodeword(P1: Integer): Integer; cdecl;
    {class} function init: JPDF417Common; cdecl;

    { static Property }
    {class} property NUMBER_OF_CODEWORDS: Integer read _GetNUMBER_OF_CODEWORDS;
    {class} property MAX_CODEWORDS_IN_BARCODE: Integer read _GetMAX_CODEWORDS_IN_BARCODE;
    {class} property MIN_ROWS_IN_BARCODE: Integer read _GetMIN_ROWS_IN_BARCODE;
    {class} property MAX_ROWS_IN_BARCODE: Integer read _GetMAX_ROWS_IN_BARCODE;
    {class} property MODULES_IN_CODEWORD: Integer read _GetMODULES_IN_CODEWORD;
    {class} property MODULES_IN_STOP_PATTERN: Integer read _GetMODULES_IN_STOP_PATTERN;
    {class} property BARS_IN_MODULE: Integer read _GetBARS_IN_MODULE;
    {class} property SYMBOL_TABLE: TJavaArray<Integer> read _GetSYMBOL_TABLE;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/PDF417Common')]
  JPDF417Common = interface(JObject)
  ['{225FE3F4-1284-40F9-8528-67E562B53EAD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417Common = class(TJavaGenericImport<JPDF417CommonClass, JPDF417Common>) end;

  JPDF417ReaderClass = interface(JObjectClass)
  ['{E86048A3-41C4-4571-88C5-28190D6FC8F9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417Reader; cdecl; overload;
//    {class} function init: JPDF417Reader; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/PDF417Reader')]
  JPDF417Reader = interface(JObject)
  ['{5F6BA165-D45A-4330-9253-C6745C19E48A}']
    { Property Methods }

    { methods }
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload;
    function decodeMultiple(P1: JBinaryBitmap): TJavaObjectArray<JResult>; cdecl; overload;
    function decodeMultiple(P1: JBinaryBitmap; P2: JMap): TJavaObjectArray<JResult>; cdecl; overload;
    procedure reset; cdecl;

    { Property }
  end;

  TJPDF417Reader = class(TJavaGenericImport<JPDF417ReaderClass, JPDF417Reader>) end;

  JPDF417ResultMetadataClass = interface(JObjectClass)
  ['{519E5D9D-5D51-4980-A94B-0459672B7CA4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417ResultMetadata; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/PDF417ResultMetadata')]
  JPDF417ResultMetadata = interface(JObject)
  ['{27DCB75E-AF10-458A-9F78-374878030C6E}']
    { Property Methods }

    { methods }
    function getSegmentIndex: Integer; cdecl;
    procedure setSegmentIndex(P1: Integer); cdecl;
    function getFileId: JString; cdecl;
    procedure setFileId(P1: JString); cdecl;
    function getOptionalData: TJavaArray<Integer>; cdecl; //Deprecated
    procedure setOptionalData(P1: TJavaArray<Integer>); cdecl; //Deprecated
    function isLastSegment: Boolean; cdecl;
    procedure setLastSegment(P1: Boolean); cdecl;
    function getSegmentCount: Integer; cdecl;
    procedure setSegmentCount(P1: Integer); cdecl;
    function getSender: JString; cdecl;
    procedure setSender(P1: JString); cdecl;
    function getAddressee: JString; cdecl;
    procedure setAddressee(P1: JString); cdecl;
    function getFileName: JString; cdecl;
    procedure setFileName(P1: JString); cdecl;
    function getFileSize: Int64; cdecl;
    procedure setFileSize(P1: Int64); cdecl;
    function getChecksum: Integer; cdecl;
    procedure setChecksum(P1: Integer); cdecl;
    function getTimestamp: Int64; cdecl;
    procedure setTimestamp(P1: Int64); cdecl;

    { Property }
  end;

  TJPDF417ResultMetadata = class(TJavaGenericImport<JPDF417ResultMetadataClass, JPDF417ResultMetadata>) end;

  JPDF417WriterClass = interface(JObjectClass)
  ['{351B086E-83FC-45D7-AEA2-D7CDBBD6143E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417Writer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/pdf417/PDF417Writer')]
  JPDF417Writer = interface(JObject)
  ['{76DE4CDE-E01F-41F1-B93F-56F1D1AD2596}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer): JBitMatrix; cdecl; overload;

    { Property }
  end;

  TJPDF417Writer = class(TJavaGenericImport<JPDF417WriterClass, JPDF417Writer>) end;

//  JBitMatrixParser_588Class = interface(JObjectClass)
//  ['{CA6F0388-9CF6-47B7-B73A-B13C0BA9229F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBitMatrix): JBitMatrixParser_588; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/BitMatrixParser')]
//  JBitMatrixParser_588 = interface(JObject)
//  ['{04565CBA-3292-4A51-8EF6-4CA434F473E1}']
//    { Property Methods }
//
//    { methods }
//    function readFormatInformation: JFormatInformation; cdecl;
//    function readVersion: JVersion; cdecl;
//    function readCodewords: TJavaArray<Byte>; cdecl;
//    procedure remask; cdecl;
//    procedure setMirror(P1: Boolean); cdecl;
//    procedure mirror; cdecl;
//
//    { Property }
//  end;
//
//  TJBitMatrixParser_588 = class(TJavaGenericImport<JBitMatrixParser_588Class, JBitMatrixParser_588>) end;

//  JDataBlock_589Class = interface(JObjectClass)
//  ['{DBD775A0-5A9E-4A0E-B111-E32300970272}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function getDataBlocks(P1: TJavaArray<Byte>; P2: JVersion; P3: JErrorCorrectionLevel): TJavaObjectArray<JDataBlock>; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DataBlock')]
//  JDataBlock_589 = interface(JObject)
//  ['{1C6DCC3C-2C08-4D0B-BD8E-ABC64BBE795D}']
//    { Property Methods }
//
//    { methods }
//    function getNumDataCodewords: Integer; cdecl;
//    function getCodewords: TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;
//
//  TJDataBlock_589 = class(TJavaGenericImport<JDataBlock_589Class, JDataBlock_589>) end;

  JDataMaskClass = interface(JEnumClass) // or JObjectClass
  ['{910C480C-AABC-45BF-818F-78B4A1B776D0}']
    { static Property Methods }
    {class} function _GetDATA_MASK_000: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MASK_001: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MASK_010: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MASK_011: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MASK_100: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MASK_101: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MASK_110: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MASK_111: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDataMask>; cdecl;
    {class} function valueOf(P1: JString): JDataMask; cdecl;
//    {class} function init(P1: JString; P2: Integer; P3: JDataMask_1): JDataMask; cdecl; overload;
    {class} function init: JDataMask; cdecl; overload;

    { static Property }
    {class} property DATA_MASK_000: JDataMask read _GetDATA_MASK_000;
    {class} property DATA_MASK_001: JDataMask read _GetDATA_MASK_001;
    {class} property DATA_MASK_010: JDataMask read _GetDATA_MASK_010;
    {class} property DATA_MASK_011: JDataMask read _GetDATA_MASK_011;
    {class} property DATA_MASK_100: JDataMask read _GetDATA_MASK_100;
    {class} property DATA_MASK_101: JDataMask read _GetDATA_MASK_101;
    {class} property DATA_MASK_110: JDataMask read _GetDATA_MASK_110;
    {class} property DATA_MASK_111: JDataMask read _GetDATA_MASK_111;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DataMask')]
  JDataMask = interface(JEnum) // or JObject
  ['{C422DB3F-A515-4C0F-8E97-90CCF50FEAF8}']
    { Property Methods }

    { methods }
    procedure unmaskBitMatrix(P1: JBitMatrix; P2: Integer); cdecl;
    function isMasked(P1: Integer; P2: Integer): Boolean; cdecl;

    { Property }
  end;

  TJDataMask = class(TJavaGenericImport<JDataMaskClass, JDataMask>) end;

//  JDataMask_1Class = interface(JDataMaskClass) // or JObjectClass
//  ['{7937EF22-7297-42D5-830C-99D9F37DBAD3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer): JDataMask_1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DataMask$1')]
//  JDataMask_1 = interface(JDataMask) // or JObject
//  ['{AEA4615A-4C0B-4ED4-8349-E9FA0B768EFC}']
//    { Property Methods }
//
//    { methods }
//    function isMasked(P1: Integer; P2: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDataMask_1 = class(TJavaGenericImport<JDataMask_1Class, JDataMask_1>) end;

//  JDataMask_2Class = interface(JDataMaskClass) // or JObjectClass
//  ['{FB22281C-EFDD-4C9F-9515-47FBE104460E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer): JDataMask_2; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DataMask$2')]
//  JDataMask_2 = interface(JDataMask) // or JObject
//  ['{F1CD707A-5132-4C96-886F-247D4C2498E9}']
//    { Property Methods }
//
//    { methods }
//    function isMasked(P1: Integer; P2: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDataMask_2 = class(TJavaGenericImport<JDataMask_2Class, JDataMask_2>) end;

//  JDataMask_3Class = interface(JDataMaskClass) // or JObjectClass
//  ['{562AF394-3E2B-473F-9D9C-BEE724100C02}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer): JDataMask_3; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DataMask$3')]
//  JDataMask_3 = interface(JDataMask) // or JObject
//  ['{F4086710-FA45-49AA-A9B1-CDD51BE9317E}']
//    { Property Methods }
//
//    { methods }
//    function isMasked(P1: Integer; P2: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDataMask_3 = class(TJavaGenericImport<JDataMask_3Class, JDataMask_3>) end;

//  JDataMask_4Class = interface(JDataMaskClass) // or JObjectClass
//  ['{C4F2FAB5-BD67-430D-9248-609F8120182A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer): JDataMask_4; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DataMask$4')]
//  JDataMask_4 = interface(JDataMask) // or JObject
//  ['{9B6C0B66-A932-4460-9DF1-01CC29860AD5}']
//    { Property Methods }
//
//    { methods }
//    function isMasked(P1: Integer; P2: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDataMask_4 = class(TJavaGenericImport<JDataMask_4Class, JDataMask_4>) end;

//  JDataMask_5Class = interface(JDataMaskClass) // or JObjectClass
//  ['{187C0F21-3340-4B84-8A9B-FC01E52EA542}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer): JDataMask_5; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DataMask$5')]
//  JDataMask_5 = interface(JDataMask) // or JObject
//  ['{FDA6D03D-4591-4E5B-AB6B-E783E8000BF4}']
//    { Property Methods }
//
//    { methods }
//    function isMasked(P1: Integer; P2: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDataMask_5 = class(TJavaGenericImport<JDataMask_5Class, JDataMask_5>) end;

//  JDataMask_6Class = interface(JDataMaskClass) // or JObjectClass
//  ['{32185E7E-75A2-4E51-B5EF-F40043A8060F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer): JDataMask_6; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DataMask$6')]
//  JDataMask_6 = interface(JDataMask) // or JObject
//  ['{B5654348-9C84-4432-8DDD-4DDF7AE22D52}']
//    { Property Methods }
//
//    { methods }
//    function isMasked(P1: Integer; P2: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDataMask_6 = class(TJavaGenericImport<JDataMask_6Class, JDataMask_6>) end;

//  JDataMask_7Class = interface(JDataMaskClass) // or JObjectClass
//  ['{906B4D20-5264-44A0-BDC6-4B6B08C0B2F5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer): JDataMask_7; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DataMask$7')]
//  JDataMask_7 = interface(JDataMask) // or JObject
//  ['{952E48C2-27C2-41CD-BE80-A2B6C755664B}']
//    { Property Methods }
//
//    { methods }
//    function isMasked(P1: Integer; P2: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDataMask_7 = class(TJavaGenericImport<JDataMask_7Class, JDataMask_7>) end;

//  JDataMask_8Class = interface(JDataMaskClass) // or JObjectClass
//  ['{45A83DA0-FDA7-4112-9731-CEE7DDC1C76C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer): JDataMask_8; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DataMask$8')]
//  JDataMask_8 = interface(JDataMask) // or JObject
//  ['{966C2DB2-D3F8-41EC-99E1-A3B8538ACDCD}']
//    { Property Methods }
//
//    { methods }
//    function isMasked(P1: Integer; P2: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDataMask_8 = class(TJavaGenericImport<JDataMask_8Class, JDataMask_8>) end;

//  JDecodedBitStreamParser_1_599Class = interface(JObjectClass)
//  ['{32599FF7-F4E3-4248-8422-FA7ED31F2F2A}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_qrcode_decoder_Mode: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JDecodedBitStreamParser_1_599; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_gengcon_www_jcprintersdk_zxing_qrcode_decoder_Mode: TJavaArray<Integer> read _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_qrcode_decoder_Mode;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DecodedBitStreamParser$1')]
//  JDecodedBitStreamParser_1_599 = interface(JObject)
//  ['{D8B23636-98C3-4809-ABF0-DFAB81499B88}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDecodedBitStreamParser_1_599 = class(TJavaGenericImport<JDecodedBitStreamParser_1_599Class, JDecodedBitStreamParser_1_599>) end;

//  JDecodedBitStreamParser_600Class = interface(JObjectClass)
//  ['{1643CF1B-80AE-438C-899B-AC065ADBC84C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function decode(P1: TJavaArray<Byte>; P2: JVersion; P3: JErrorCorrectionLevel; P4: JMap): JDecoderResult; cdecl;
//    {class} function init: JDecodedBitStreamParser_600; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/DecodedBitStreamParser')]
//  JDecodedBitStreamParser_600 = interface(JObject)
//  ['{FC8D7234-B82E-4B79-A31C-12B9F55B14E4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDecodedBitStreamParser_600 = class(TJavaGenericImport<JDecodedBitStreamParser_600Class, JDecodedBitStreamParser_600>) end;

//  JDecoder_601Class = interface(JObjectClass)
//  ['{B6AC0C04-D427-42DA-B1F5-6D147B462C21}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDecoder_601; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/Decoder')]
//  JDecoder_601 = interface(JObject)
//  ['{AB84AC26-190A-4DB0-B9C4-DE3BA8A8DDD3}']
//    { Property Methods }
//
//    { methods }
//    function decode(P1: TJavaArray<Boolean>): JDecoderResult; cdecl; overload;
//    function decode(P1: TJavaArray<Boolean>; P2: JMap): JDecoderResult; cdecl; overload;
//    function decode(P1: JBitMatrix): JDecoderResult; cdecl; overload;
//    function decode(P1: JBitMatrix; P2: JMap): JDecoderResult; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJDecoder_601 = class(TJavaGenericImport<JDecoder_601Class, JDecoder_601>) end;

  JErrorCorrectionLevelClass = interface(JEnumClass) // or JObjectClass
  ['{0A94A765-A428-465C-89F0-A6E91BDC4C7A}']
    { static Property Methods }
    {class} function _GetL: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQ: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetH: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JErrorCorrectionLevel>; cdecl;
    {class} function valueOf(P1: JString): JErrorCorrectionLevel; cdecl;
    {class} function forBits(P1: Integer): JErrorCorrectionLevel; cdecl;
    {class} function init: JErrorCorrectionLevel; cdecl;

    { static Property }
    {class} property L: JErrorCorrectionLevel read _GetL;
    {class} property M: JErrorCorrectionLevel read _GetM;
    {class} property Q: JErrorCorrectionLevel read _GetQ;
    {class} property H: JErrorCorrectionLevel read _GetH;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/ErrorCorrectionLevel')]
  JErrorCorrectionLevel = interface(JEnum) // or JObject
  ['{F3BC0D2F-84E5-44BF-AC93-2A96CD05868E}']
    { Property Methods }

    { methods }
    function getBits: Integer; cdecl;

    { Property }
  end;

  TJErrorCorrectionLevel = class(TJavaGenericImport<JErrorCorrectionLevelClass, JErrorCorrectionLevel>) end;

  JFormatInformationClass = interface(JObjectClass)
  ['{8A4D0C5B-ECB7-4405-9346-0ABA82D3E0FB}']
    { static Property Methods }

    { static Methods }
    {class} function numBitsDiffering(P1: Integer; P2: Integer): Integer; cdecl;
    {class} function decodeFormatInformation(P1: Integer; P2: Integer): JFormatInformation; cdecl;
    {class} function init: JFormatInformation; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/FormatInformation')]
  JFormatInformation = interface(JObject)
  ['{6A00F4AB-F09D-4BCA-A7A5-11121C041068}']
    { Property Methods }

    { methods }
    function getErrorCorrectionLevel: JErrorCorrectionLevel; cdecl;
    function getDataMask: Byte; cdecl;
    function hashCode: Integer; cdecl;
    function equals(P1: JObject): Boolean; cdecl;

    { Property }
  end;

  TJFormatInformation = class(TJavaGenericImport<JFormatInformationClass, JFormatInformation>) end;

  JModeClass = interface(JEnumClass) // or JObjectClass
  ['{C14E7C7E-58EA-44B9-A159-A29B7842281F}']
    { static Property Methods }
    {class} function _GetTERMINATOR: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNUMERIC: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALPHANUMERIC: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTRUCTURED_APPEND: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBYTE: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetECI: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKANJI: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFNC1_FIRST_POSITION: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFNC1_SECOND_POSITION: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHANZI: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JMode>; cdecl;
    {class} function valueOf(P1: JString): JMode; cdecl;
    {class} function forBits(P1: Integer): JMode; cdecl;
    {class} function init: JMode; cdecl;

    { static Property }
    {class} property TERMINATOR: JMode read _GetTERMINATOR;
    {class} property NUMERIC: JMode read _GetNUMERIC;
    {class} property ALPHANUMERIC: JMode read _GetALPHANUMERIC;
    {class} property STRUCTURED_APPEND: JMode read _GetSTRUCTURED_APPEND;
    {class} property BYTE: JMode read _GetBYTE;
    {class} property ECI: JMode read _GetECI;
    {class} property KANJI: JMode read _GetKANJI;
    {class} property FNC1_FIRST_POSITION: JMode read _GetFNC1_FIRST_POSITION;
    {class} property FNC1_SECOND_POSITION: JMode read _GetFNC1_SECOND_POSITION;
    {class} property HANZI: JMode read _GetHANZI;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/Mode')]
  JMode = interface(JEnum) // or JObject
  ['{252AFD06-6EB3-4C92-BD23-BEEC93439EF0}']
    { Property Methods }

    { methods }
    function getCharacterCountBits(P1: JVersion): Integer; cdecl;
    function getBits: Integer; cdecl;

    { Property }
  end;

  TJMode = class(TJavaGenericImport<JModeClass, JMode>) end;

  JQRCodeDecoderMetaDataClass = interface(JObjectClass)
  ['{BF70D27E-F937-4013-B4D7-EFD343D8408F}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Boolean): JQRCodeDecoderMetaData; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/QRCodeDecoderMetaData')]
  JQRCodeDecoderMetaData = interface(JObject)
  ['{5EAB617D-96F9-4DD7-8242-AE2EA5624DAE}']
    { Property Methods }

    { methods }
    function isMirrored: Boolean; cdecl;
    procedure applyMirroredCorrection(P1: TJavaObjectArray<JResultPoint>); cdecl;

    { Property }
  end;

  TJQRCodeDecoderMetaData = class(TJavaGenericImport<JQRCodeDecoderMetaDataClass, JQRCodeDecoderMetaData>) end;

//  JVersion_ECB_606Class = interface(JObjectClass)
//  ['{C23E6B06-01A8-41F8-8DB3-AABDA70352E4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): JVersion_ECB_606; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/Version$ECB')]
//  JVersion_ECB_606 = interface(JObject)
//  ['{CF9FB0AD-FD3F-43C1-BE99-0FB7598A6B29}']
//    { Property Methods }
//
//    { methods }
//    function getCount: Integer; cdecl;
//    function getDataCodewords: Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJVersion_ECB_606 = class(TJavaGenericImport<JVersion_ECB_606Class, JVersion_ECB_606>) end;

//  JVersion_ECBlocks_607Class = interface(JObjectClass)
//  ['{E4EAD06F-1456-407A-8BF3-06B41050289D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: TJavaObjectArray<JVersion_ECB>): JVersion_ECBlocks_607; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/Version$ECBlocks')]
//  JVersion_ECBlocks_607 = interface(JObject)
//  ['{188D4F53-A199-40E7-9760-543CB3870B53}']
//    { Property Methods }
//
//    { methods }
//    function getECCodewordsPerBlock: Integer; cdecl;
//    function getNumBlocks: Integer; cdecl;
//    function getTotalECCodewords: Integer; cdecl;
//    function getECBlocks: TJavaObjectArray<JVersion_ECB>; cdecl;
//
//    { Property }
//  end;
//
//  TJVersion_ECBlocks_607 = class(TJavaGenericImport<JVersion_ECBlocks_607Class, JVersion_ECBlocks_607>) end;

//  JVersion_608Class = interface(JObjectClass)
//  ['{1E1EC977-7198-4E09-BFAA-1434F348A496}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function getProvisionalVersionForDimension(P1: Integer): JVersion; cdecl;
//    {class} function getVersionForNumber(P1: Integer): JVersion; cdecl;
//    {class} function decodeVersionInformation(P1: Integer): JVersion; cdecl;
//    {class} function init: JVersion_608; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/decoder/Version')]
//  JVersion_608 = interface(JObject)
//  ['{C915AC7C-1558-4E94-8A73-870ED37C1493}']
//    { Property Methods }
//
//    { methods }
//    function getVersionNumber: Integer; cdecl;
//    function getAlignmentPatternCenters: TJavaArray<Integer>; cdecl;
//    function getTotalCodewords: Integer; cdecl;
//    function getDimensionForVersion: Integer; cdecl;
//    function getECBlocksForLevel(P1: JErrorCorrectionLevel): JVersion_ECBlocks; cdecl;
//    function buildFunctionPattern: JBitMatrix; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;
//
//  TJVersion_608 = class(TJavaGenericImport<JVersion_608Class, JVersion_608>) end;

  JResultPointClass = interface(JObjectClass)
  ['{7AA66421-3C98-4BB1-BEC9-A7BCE06F852B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Single; P2: Single): JResultPoint; cdecl;
    {class} procedure orderBestPatterns(P1: TJavaObjectArray<JResultPoint>); cdecl;
    {class} function distance(P1: JResultPoint; P2: JResultPoint): Single; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/ResultPoint')]
  JResultPoint = interface(JObject)
  ['{262E65E6-B6A7-4233-AE6B-A1BBA119C689}']
    { Property Methods }

    { methods }
    function getX: Single; cdecl;
    function getY: Single; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJResultPoint = class(TJavaGenericImport<JResultPointClass, JResultPoint>) end;

  JAlignmentPatternClass = interface(JResultPointClass) // or JObjectClass
  ['{A92C73BF-3BE4-4BAD-9332-A652BC82785C}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Single; P2: Single; P3: Single): JAlignmentPattern; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/detector/AlignmentPattern')]
  JAlignmentPattern = interface(JResultPoint) // or JObject
  ['{4B100AE5-15DF-47A3-962D-C6598A5D42E9}']
    { Property Methods }

    { methods }
    function aboutEquals(P1: Single; P2: Single; P3: Single): Boolean; cdecl;
    function combineEstimate(P1: Single; P2: Single; P3: Single): JAlignmentPattern; cdecl;

    { Property }
  end;

  TJAlignmentPattern = class(TJavaGenericImport<JAlignmentPatternClass, JAlignmentPattern>) end;

  JAlignmentPatternFinderClass = interface(JObjectClass)
  ['{398526F2-BCC0-4C0C-AA3D-FBBB003180A8}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitMatrix; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Single; P7: JResultPointCallback): JAlignmentPatternFinder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/detector/AlignmentPatternFinder')]
  JAlignmentPatternFinder = interface(JObject)
  ['{94FBD1BA-61F2-43A4-B1B5-6F918D1F0805}']
    { Property Methods }

    { methods }
    function find: JAlignmentPattern; cdecl;

    { Property }
  end;

  TJAlignmentPatternFinder = class(TJavaGenericImport<JAlignmentPatternFinderClass, JAlignmentPatternFinder>) end;

//  JDetector_611Class = interface(JObjectClass)
//  ['{734DE378-EF15-44CF-B53F-82A7B5BDF4A9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBitMatrix): JDetector_611; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/detector/Detector')]
//  JDetector_611 = interface(JObject)
//  ['{3F2114E1-33D7-4296-AA64-1E78745B037E}']
//    { Property Methods }
//
//    { methods }
//    function getImage: JBitMatrix; cdecl;
//    function getResultPointCallback: JResultPointCallback; cdecl;
//    function detect: JDetectorResult; cdecl; overload;
//    function detect(P1: JMap): JDetectorResult; cdecl; overload;
//    function processFinderPatternInfo(P1: JFinderPatternInfo): JDetectorResult; cdecl;
//    function calculateModuleSize(P1: JResultPoint; P2: JResultPoint; P3: JResultPoint): Single; cdecl;
//    function findAlignmentInRegion(P1: Single; P2: Integer; P3: Integer; P4: Single): JAlignmentPattern; cdecl;
//
//    { Property }
//  end;
//
//  TJDetector_611 = class(TJavaGenericImport<JDetector_611Class, JDetector_611>) end;

//  JFinderPattern_612Class = interface(JResultPointClass) // or JObjectClass
//  ['{13071677-6C7C-4CD0-A8D3-24BA827946DB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Single): JFinderPattern_612; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/detector/FinderPattern')]
//  JFinderPattern_612 = interface(JResultPoint) // or JObject
//  ['{E7021F7A-B46B-4E39-9C27-4E3C55C04B24}']
//    { Property Methods }
//
//    { methods }
//    function getEstimatedModuleSize: Single; cdecl;
//    function getCount: Integer; cdecl;
//    function aboutEquals(P1: Single; P2: Single; P3: Single): Boolean; cdecl;
//    function combineEstimate(P1: Single; P2: Single; P3: Single): JFinderPattern; cdecl;
//
//    { Property }
//  end;
//
//  TJFinderPattern_612 = class(TJavaGenericImport<JFinderPattern_612Class, JFinderPattern_612>) end;

//  JFinderPatternFinder_1Class = interface(JObjectClass)
//  ['{569FC471-8EF1-4BF7-A85D-A7E400CA88E2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/detector/FinderPatternFinder$1')]
//  JFinderPatternFinder_1 = interface(JObject)
//  ['{1485BD72-DD2B-4DA4-8140-DE72A7A6FB9B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJFinderPatternFinder_1 = class(TJavaGenericImport<JFinderPatternFinder_1Class, JFinderPatternFinder_1>) end;

  JFinderPatternFinder_CenterComparatorClass = interface(JObjectClass)
  ['{E26BDC16-4DD7-480F-A515-AE8E5F3B2656}']
    { static Property Methods }

    { static Methods }
//    {class} function init(P1: Single; P2: JFinderPatternFinder_1): JFinderPatternFinder_CenterComparator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/detector/FinderPatternFinder$CenterComparator')]
  JFinderPatternFinder_CenterComparator = interface(JObject)
  ['{CB4F09A1-1857-46ED-944D-FF10FBFD91DC}']
    { Property Methods }

    { methods }
    function compare(P1: JFinderPattern; P2: JFinderPattern): Integer; cdecl; overload;
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload;

    { Property }
  end;

  TJFinderPatternFinder_CenterComparator = class(TJavaGenericImport<JFinderPatternFinder_CenterComparatorClass, JFinderPatternFinder_CenterComparator>) end;

  JFinderPatternFinder_FurthestFromAverageComparatorClass = interface(JObjectClass)
  ['{FC7D6AB3-DCA8-450C-BB15-E04DF08C8626}']
    { static Property Methods }

    { static Methods }
//    {class} function init(P1: Single; P2: JFinderPatternFinder_1): JFinderPatternFinder_FurthestFromAverageComparator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator')]
  JFinderPatternFinder_FurthestFromAverageComparator = interface(JObject)
  ['{8F5846F1-31F4-4766-AC59-B5BB40FE678B}']
    { Property Methods }

    { methods }
    function compare(P1: JFinderPattern; P2: JFinderPattern): Integer; cdecl; overload;
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload;

    { Property }
  end;

  TJFinderPatternFinder_FurthestFromAverageComparator = class(TJavaGenericImport<JFinderPatternFinder_FurthestFromAverageComparatorClass, JFinderPatternFinder_FurthestFromAverageComparator>) end;

  JFinderPatternFinderClass = interface(JObjectClass)
  ['{5676BA16-4860-4F8A-919E-60747163C470}']
    { static Property Methods }
    {class} function _GetMIN_SKIP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_MODULES: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JBitMatrix): JFinderPatternFinder; cdecl; overload;
    {class} function init(P1: JBitMatrix; P2: JResultPointCallback): JFinderPatternFinder; cdecl; overload;
    {class} function foundPatternCross(P1: TJavaArray<Integer>): Boolean; cdecl;
    {class} function foundPatternDiagonal(P1: TJavaArray<Integer>): Boolean; cdecl;

    { static Property }
    {class} property MIN_SKIP: Integer read _GetMIN_SKIP;
    {class} property MAX_MODULES: Integer read _GetMAX_MODULES;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/detector/FinderPatternFinder')]
  JFinderPatternFinder = interface(JObject)
  ['{CED4E7C9-02E3-4895-803D-42B292177767}']
    { Property Methods }

    { methods }
    function getImage: JBitMatrix; cdecl;
    function getPossibleCenters: JList; cdecl;
    function find(P1: JMap): JFinderPatternInfo; cdecl;
    procedure clearCounts(P1: TJavaArray<Integer>); cdecl;
    procedure shiftCounts2(P1: TJavaArray<Integer>); cdecl;
    function handlePossibleCenter(P1: TJavaArray<Integer>; P2: Integer; P3: Integer; P4: Boolean): Boolean; cdecl; overload; //Deprecated
    function handlePossibleCenter(P1: TJavaArray<Integer>; P2: Integer; P3: Integer): Boolean; cdecl; overload;

    { Property }
  end;

  TJFinderPatternFinder = class(TJavaGenericImport<JFinderPatternFinderClass, JFinderPatternFinder>) end;

  JFinderPatternInfoClass = interface(JObjectClass)
  ['{CA2F1323-4580-47EB-AD7D-BFA575404B47}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: TJavaObjectArray<JFinderPattern>): JFinderPatternInfo; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/detector/FinderPatternInfo')]
  JFinderPatternInfo = interface(JObject)
  ['{5754AA49-A01B-417C-AABA-7A84C1EEA19C}']
    { Property Methods }

    { methods }
    function getBottomLeft: JFinderPattern; cdecl;
    function getTopLeft: JFinderPattern; cdecl;
    function getTopRight: JFinderPattern; cdecl;

    { Property }
  end;

  TJFinderPatternInfo = class(TJavaGenericImport<JFinderPatternInfoClass, JFinderPatternInfo>) end;

  JBlockPairClass = interface(JObjectClass)
  ['{5D2FEDA2-808E-4369-A006-69A9133381B9}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): JBlockPair; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/encoder/BlockPair')]
  JBlockPair = interface(JObject)
  ['{AB401C08-70CD-47A3-9CCB-A67667B8778E}']
    { Property Methods }

    { methods }
    function getDataBytes: TJavaArray<Byte>; cdecl;
    function getErrorCorrectionBytes: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJBlockPair = class(TJavaGenericImport<JBlockPairClass, JBlockPair>) end;

  JByteMatrixClass = interface(JObjectClass)
  ['{97DBBA0C-0778-40EF-9FD7-66FD3C726852}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer): JByteMatrix; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/encoder/ByteMatrix')]
  JByteMatrix = interface(JObject)
  ['{CF8DD9E2-4B8A-4B5A-8405-D6EB54109D48}']
    { Property Methods }

    { methods }
    function getHeight: Integer; cdecl;
    function getWidth: Integer; cdecl;
    function get(P1: Integer; P2: Integer): Byte; cdecl;
    function getArray: TJavaArray<TJavaArray<Byte>>; cdecl;
    procedure &set(P1: Integer; P2: Integer; P3: Byte); cdecl; overload;
    procedure &set(P1: Integer; P2: Integer; P3: Integer); cdecl; overload;
    procedure &set(P1: Integer; P2: Integer; P3: Boolean); cdecl; overload;
    procedure clear(P1: Byte); cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJByteMatrix = class(TJavaGenericImport<JByteMatrixClass, JByteMatrix>) end;

//  JEncoder_1Class = interface(JObjectClass)
//  ['{A86B0447-55DC-4A11-B739-806504DF255C}']
//    { static Property Methods }
//    {class} function _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_qrcode_decoder_Mode: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JEncoder_1; cdecl;
//
//    { static Property }
//    {class} property _SwitchMap_com_gengcon_www_jcprintersdk_zxing_qrcode_decoder_Mode: TJavaArray<Integer> read _Get_SwitchMap_com_gengcon_www_jcprintersdk_zxing_qrcode_decoder_Mode;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/encoder/Encoder$1')]
//  JEncoder_1 = interface(JObject)
//  ['{C7C9FCBB-2CF9-4296-8957-0B728A20832F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJEncoder_1 = class(TJavaGenericImport<JEncoder_1Class, JEncoder_1>) end;

//  JEncoder_621Class = interface(JObjectClass)
//  ['{22534944-90AC-4131-8C39-E60D2FC3E272}']
//    { static Property Methods }
//    {class} function _GetDEFAULT_BYTE_MODE_ENCODING: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function encode(P1: JString; P2: JErrorCorrectionLevel): JQRCode; cdecl; overload;
//    {class} function encode(P1: JString; P2: JErrorCorrectionLevel; P3: JMap): JQRCode; cdecl; overload;
//    {class} function getAlphanumericCode(P1: Integer): Integer; cdecl;
//    {class} function chooseMode(P1: JString): JMode; cdecl;
//    {class} procedure terminateBits(P1: Integer; P2: JBitArray); cdecl;
//    {class} procedure getNumDataBytesAndNumECBytesForBlockID(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Integer>; P6: TJavaArray<Integer>); cdecl;
//    {class} function interleaveWithECBytes(P1: JBitArray; P2: Integer; P3: Integer; P4: Integer): JBitArray; cdecl;
//    {class} function generateECBytes(P1: TJavaArray<Byte>; P2: Integer): TJavaArray<Byte>; cdecl;
//    {class} procedure appendModeInfo(P1: JMode; P2: JBitArray); cdecl;
//    {class} procedure appendLengthInfo(P1: Integer; P2: JVersion; P3: JMode; P4: JBitArray); cdecl;
//    {class} procedure appendBytes(P1: JString; P2: JMode; P3: JBitArray; P4: JString); cdecl;
//    {class} procedure appendNumericBytes(P1: JCharSequence; P2: JBitArray); cdecl;
//    {class} procedure appendAlphanumericBytes(P1: JCharSequence; P2: JBitArray); cdecl;
//    {class} procedure append8BitBytes(P1: JString; P2: JBitArray; P3: JString); cdecl;
//    {class} procedure appendKanjiBytes(P1: JString; P2: JBitArray); cdecl;
//    {class} function init: JEncoder_621; cdecl;
//
//    { static Property }
//    {class} property DEFAULT_BYTE_MODE_ENCODING: JString read _GetDEFAULT_BYTE_MODE_ENCODING;
//  end;
//
//  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/encoder/Encoder')]
//  JEncoder_621 = interface(JObject)
//  ['{77EF265F-76F7-4BDC-8982-997952FE5532}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJEncoder_621 = class(TJavaGenericImport<JEncoder_621Class, JEncoder_621>) end;

  JMaskUtilClass = interface(JObjectClass)
  ['{8BC76680-1A6C-4A6F-8A54-96E640026866}']
    { static Property Methods }

    { static Methods }
    {class} function applyMaskPenaltyRule1(P1: JByteMatrix): Integer; cdecl;
    {class} function applyMaskPenaltyRule2(P1: JByteMatrix): Integer; cdecl;
    {class} function applyMaskPenaltyRule3(P1: JByteMatrix): Integer; cdecl;
    {class} function applyMaskPenaltyRule4(P1: JByteMatrix): Integer; cdecl;
    {class} function getDataMaskBit(P1: Integer; P2: Integer; P3: Integer): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/encoder/MaskUtil')]
  JMaskUtil = interface(JObject)
  ['{1C2F07AD-2795-40E7-9C9D-33B8F4CEC486}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMaskUtil = class(TJavaGenericImport<JMaskUtilClass, JMaskUtil>) end;

  JMatrixUtilClass = interface(JObjectClass)
  ['{421DCFF8-34C6-41F8-AB03-A04052942A6B}']
    { static Property Methods }

    { static Methods }
    {class} procedure clearMatrix(P1: JByteMatrix); cdecl;
    {class} procedure buildMatrix(P1: JBitArray; P2: JErrorCorrectionLevel; P3: JVersion; P4: Integer; P5: JByteMatrix); cdecl;
    {class} procedure embedBasicPatterns(P1: JVersion; P2: JByteMatrix); cdecl;
    {class} procedure embedTypeInfo(P1: JErrorCorrectionLevel; P2: Integer; P3: JByteMatrix); cdecl;
    {class} procedure maybeEmbedVersionInfo(P1: JVersion; P2: JByteMatrix); cdecl;
    {class} procedure embedDataBits(P1: JBitArray; P2: Integer; P3: JByteMatrix); cdecl;
    {class} function findMSBSet(P1: Integer): Integer; cdecl;
    {class} function calculateBCHCode(P1: Integer; P2: Integer): Integer; cdecl;
    {class} procedure makeTypeInfoBits(P1: JErrorCorrectionLevel; P2: Integer; P3: JBitArray); cdecl;
    {class} procedure makeVersionInfoBits(P1: JVersion; P2: JBitArray); cdecl;
    {class} function init: JMatrixUtil; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/encoder/MatrixUtil')]
  JMatrixUtil = interface(JObject)
  ['{9D9F606C-06B7-49A6-9C4A-1C39531EB3D6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMatrixUtil = class(TJavaGenericImport<JMatrixUtilClass, JMatrixUtil>) end;

  JQRCodeClass = interface(JObjectClass)
  ['{4231D04B-1DB1-4780-BF90-451DC64371F0}']
    { static Property Methods }
    {class} function _GetNUM_MASK_PATTERNS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JQRCode; cdecl;
    {class} function isValidMaskPattern(P1: Integer): Boolean; cdecl;

    { static Property }
    {class} property NUM_MASK_PATTERNS: Integer read _GetNUM_MASK_PATTERNS;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/encoder/QRCode')]
  JQRCode = interface(JObject)
  ['{5DB95164-95D3-430C-B40B-5F11A32B4C14}']
    { Property Methods }

    { methods }
    function getMode: JMode; cdecl;
    function getECLevel: JErrorCorrectionLevel; cdecl;
    function getVersion: JVersion; cdecl;
    function getMaskPattern: Integer; cdecl;
    function getMatrix: JByteMatrix; cdecl;
    function toString: JString; cdecl;
    procedure setMode(P1: JMode); cdecl;
    procedure setECLevel(P1: JErrorCorrectionLevel); cdecl;
    procedure setVersion(P1: JVersion); cdecl;
    procedure setMaskPattern(P1: Integer); cdecl;
    procedure setMatrix(P1: JByteMatrix); cdecl;

    { Property }
  end;

  TJQRCode = class(TJavaGenericImport<JQRCodeClass, JQRCode>) end;

  JQRCodeReaderClass = interface(JObjectClass)
  ['{F5855A2C-FC55-404A-8753-31BCF37D4DD0}']
    { static Property Methods }

    { static Methods }
    {class} function init: JQRCodeReader; cdecl; overload;
//    {class} function init: JQRCodeReader; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/QRCodeReader')]
  JQRCodeReader = interface(JObject)
  ['{FD45D516-6D7A-4CC1-9544-7127BB609FB4}']
    { Property Methods }

    { methods }
    function getDecoder: JDecoder; cdecl;
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload;
    procedure reset; cdecl;

    { Property }
  end;

  TJQRCodeReader = class(TJavaGenericImport<JQRCodeReaderClass, JQRCodeReader>) end;

  JQRCodeWriterClass = interface(JObjectClass)
  ['{782D0AEE-3B1B-4665-AD33-410C1F8E0BCF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JQRCodeWriter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/qrcode/QRCodeWriter')]
  JQRCodeWriter = interface(JObject)
  ['{E1811082-C45C-4DF0-9A80-DF5DFBF2F583}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer): JBitMatrix; cdecl; overload;
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;

    { Property }
  end;

  TJQRCodeWriter = class(TJavaGenericImport<JQRCodeWriterClass, JQRCodeWriter>) end;

  JReaderClass = interface(JObjectClass)
  ['{68AEFF67-1E91-409E-9A0F-036327254B05}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/Reader')]
  JReader = interface(IJavaInstance)
  ['{C76D5169-8A90-4C74-BE3A-2C6654F8A269}']
    { Property Methods }

    { methods }
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload;
    procedure reset; cdecl;

    { Property }
  end;

  TJReader = class(TJavaGenericImport<JReaderClass, JReader>) end;

  JResultClass = interface(JObjectClass)
  ['{35131646-8EA1-48A1-BBDD-54C9E65CA13B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: TJavaObjectArray<JResultPoint>; P4: JBarcodeFormat): JResult; cdecl; overload;
    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: TJavaObjectArray<JResultPoint>; P4: JBarcodeFormat; P5: Int64): JResult; cdecl; overload;
    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaObjectArray<JResultPoint>; P5: JBarcodeFormat; P6: Int64): JResult; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/Result')]
  JResult = interface(JObject)
  ['{4E56D9DF-A83C-4A07-835C-B259F6C74540}']
    { Property Methods }

    { methods }
    function getText: JString; cdecl;
    function getRawBytes: TJavaArray<Byte>; cdecl;
    function getNumBits: Integer; cdecl;
    function getResultPoints: TJavaObjectArray<JResultPoint>; cdecl;
    function getBarcodeFormat: JBarcodeFormat; cdecl;
    function getResultMetadata: JMap; cdecl;
    procedure putMetadata(P1: JResultMetadataType; P2: JObject); cdecl;
    procedure putAllMetadata(P1: JMap); cdecl;
    procedure addResultPoints(P1: TJavaObjectArray<JResultPoint>); cdecl;
    function getTimestamp: Int64; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJResult = class(TJavaGenericImport<JResultClass, JResult>) end;

  JResultMetadataTypeClass = interface(JEnumClass) // or JObjectClass
  ['{0077B348-63F9-4EDF-B3CA-0B2EBEBBE705}']
    { static Property Methods }
    {class} function _GetOTHER: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetORIENTATION: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBYTE_SEGMENTS: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_CORRECTION_LEVEL: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISSUE_NUMBER: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUGGESTED_PRICE: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPOSSIBLE_COUNTRY: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPC_EAN_EXTENSION: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPDF417_EXTRA_METADATA: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTRUCTURED_APPEND_SEQUENCE: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTRUCTURED_APPEND_PARITY: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JResultMetadataType>; cdecl;
    {class} function valueOf(P1: JString): JResultMetadataType; cdecl;
    {class} function init: JResultMetadataType; cdecl;

    { static Property }
    {class} property OTHER: JResultMetadataType read _GetOTHER;
    {class} property ORIENTATION: JResultMetadataType read _GetORIENTATION;
    {class} property BYTE_SEGMENTS: JResultMetadataType read _GetBYTE_SEGMENTS;
    {class} property ERROR_CORRECTION_LEVEL: JResultMetadataType read _GetERROR_CORRECTION_LEVEL;
    {class} property ISSUE_NUMBER: JResultMetadataType read _GetISSUE_NUMBER;
    {class} property SUGGESTED_PRICE: JResultMetadataType read _GetSUGGESTED_PRICE;
    {class} property POSSIBLE_COUNTRY: JResultMetadataType read _GetPOSSIBLE_COUNTRY;
    {class} property UPC_EAN_EXTENSION: JResultMetadataType read _GetUPC_EAN_EXTENSION;
    {class} property PDF417_EXTRA_METADATA: JResultMetadataType read _GetPDF417_EXTRA_METADATA;
    {class} property STRUCTURED_APPEND_SEQUENCE: JResultMetadataType read _GetSTRUCTURED_APPEND_SEQUENCE;
    {class} property STRUCTURED_APPEND_PARITY: JResultMetadataType read _GetSTRUCTURED_APPEND_PARITY;
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/ResultMetadataType')]
  JResultMetadataType = interface(JEnum) // or JObject
  ['{3A75F782-2375-4C78-A128-D3CA22486C32}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJResultMetadataType = class(TJavaGenericImport<JResultMetadataTypeClass, JResultMetadataType>) end;

  JResultPointCallbackClass = interface(JObjectClass)
  ['{3A240192-99A5-4C92-BAA4-1ED6B2271AC6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/ResultPointCallback')]
  JResultPointCallback = interface(IJavaInstance)
  ['{283A0698-DC00-4108-975C-0BF99C4F4347}']
    { Property Methods }

    { methods }
    procedure foundPossibleResultPoint(P1: JResultPoint); cdecl;

    { Property }
  end;

  TJResultPointCallback = class(TJavaGenericImport<JResultPointCallbackClass, JResultPointCallback>) end;

  JWriterClass = interface(JObjectClass)
  ['{0EF6620A-49BE-4D09-9576-69ACAC4B2EE0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/Writer')]
  JWriter = interface(IJavaInstance)
  ['{A54485E9-DAEE-4856-8EEB-DD6FF74855BD}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer): JBitMatrix; cdecl; overload;
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload;

    { Property }
  end;

  TJWriter = class(TJavaGenericImport<JWriterClass, JWriter>) end;

  JWriterExceptionClass = interface(JExceptionClass) // or JObjectClass
  ['{AA3A80C9-2BD8-428D-9B46-395A6756D6AB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWriterException; cdecl; overload;
    {class} function init(P1: JString): JWriterException; cdecl; overload;
    {class} function init(P1: JThrowable): JWriterException; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/gengcon/www/jcprintersdk/zxing/WriterException')]
  JWriterException = interface(JException) // or JObject
  ['{80F8CE63-AF49-4BB3-BDFF-F8E3C0E42EB6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWriterException = class(TJavaGenericImport<JWriterExceptionClass, JWriterException>) end;

  JSCJNI_ArgsClass = interface(JObjectClass)
  ['{6667DCD5-40F8-48BD-B26C-F48C0C72C626}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JSCJNI): JSCJNI_Args; cdecl;

    { static Property }
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCJNI$Args')]
  JSCJNI_Args = interface(JObject)
  ['{4921D831-EB6D-4E22-9175-68DB5E014039}']
    { Property Methods }
    function _GetSSID: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetSSID(aSSID: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetSSIDLen: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetSSIDLen(aSSIDLen: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetPasswd: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetPasswd(aPasswd: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetPasswdLen: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetPasswdLen(aPasswdLen: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetPIN: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetPIN(aPIN: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetPINLen: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetPINLen(aPINLen: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetBSSID: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetBSSID(aBSSID: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetBSSIDLen: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetBSSIDLen(aBSSIDLen: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsoftAP_BSSID: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsoftAP_BSSID(asoftAP_BSSID: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsoftAP_BSSIDLen: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsoftAP_BSSIDLen(asoftAP_BSSIDLen: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetHWADDR: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetHWADDR(aHWADDR: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetHWADDRLen: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetHWADDRLen(aHWADDRLen: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetConfigTime: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetConfigTime(aConfigTime: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetProfileRounds: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetProfileRounds(aProfileRounds: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetProfileInterval: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetProfileInterval(aProfileInterval: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetPacketInterval: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetPacketInterval(aPacketInterval: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetPacketCnts: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetPacketCnts(aPacketCnts: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetSyncRounds: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetSyncRounds(aSyncRounds: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetMode: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetMode(aMode: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetWiFiChannel: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetWiFiChannel(aWiFiChannel: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisHiddenSSID: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisHiddenSSID(aisHiddenSSID: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetIs5G: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetIs5G(aIs5G: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getthis_0: JSCJNI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setthis_0(athis_0: JSCJNI);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property SSID: TJavaArray<Byte> read _GetSSID write _SetSSID;
    property SSIDLen: Byte read _GetSSIDLen write _SetSSIDLen;
    property Passwd: TJavaArray<Byte> read _GetPasswd write _SetPasswd;
    property PasswdLen: Byte read _GetPasswdLen write _SetPasswdLen;
    property PIN: TJavaArray<Byte> read _GetPIN write _SetPIN;
    property PINLen: Byte read _GetPINLen write _SetPINLen;
    property BSSID: TJavaArray<Byte> read _GetBSSID write _SetBSSID;
    property BSSIDLen: Byte read _GetBSSIDLen write _SetBSSIDLen;
    property softAP_BSSID: TJavaArray<Byte> read _GetsoftAP_BSSID write _SetsoftAP_BSSID;
    property softAP_BSSIDLen: Byte read _GetsoftAP_BSSIDLen write _SetsoftAP_BSSIDLen;
    property HWADDR: TJavaArray<Byte> read _GetHWADDR write _SetHWADDR;
    property HWADDRLen: Byte read _GetHWADDRLen write _SetHWADDRLen;
    property ConfigTime: Integer read _GetConfigTime write _SetConfigTime;
    property ProfileRounds: Byte read _GetProfileRounds write _SetProfileRounds;
    property ProfileInterval: Integer read _GetProfileInterval write _SetProfileInterval;
    property PacketInterval: Integer read _GetPacketInterval write _SetPacketInterval;
    property PacketCnts: Byte read _GetPacketCnts write _SetPacketCnts;
    property SyncRounds: Byte read _GetSyncRounds write _SetSyncRounds;
    property Mode: Byte read _GetMode write _SetMode;
    property WiFiChannel: Integer read _GetWiFiChannel write _SetWiFiChannel;
    property isHiddenSSID: Integer read _GetisHiddenSSID write _SetisHiddenSSID;
    property Is5G: Integer read _GetIs5G write _SetIs5G;
    property this_0: JSCJNI read _Getthis_0 write _Setthis_0;
  end;

  TJSCJNI_Args = class(TJavaGenericImport<JSCJNI_ArgsClass, JSCJNI_Args>) end;

  JSCJNI_Args_SoftAPClass = interface(JObjectClass)
  ['{3201342F-6719-4AD5-A748-FB4F47ADE1CC}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JSCJNI): JSCJNI_Args_SoftAP; cdecl;

    { static Property }
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCJNI$Args_SoftAP')]
  JSCJNI_Args_SoftAP = interface(JObject)
  ['{E2E91DED-DF6D-43D0-9631-F4F4C8BBD2F6}']
    { Property Methods }
    function _GetName: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetName(aName: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetNameLen: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetNameLen(aNameLen: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getthis_0: JSCJNI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setthis_0(athis_0: JSCJNI);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property Name: TJavaArray<Byte> read _GetName write _SetName;
    property NameLen: Byte read _GetNameLen write _SetNameLen;
    property this_0: JSCJNI read _Getthis_0 write _Setthis_0;
  end;

  TJSCJNI_Args_SoftAP = class(TJavaGenericImport<JSCJNI_Args_SoftAPClass, JSCJNI_Args_SoftAP>) end;

  JSCJNIClass = interface(JObjectClass)
  ['{ABCBF595-9BE2-4734-A27C-D40A8F3334D5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSCJNI; cdecl;

    { static Property }
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCJNI')]
  JSCJNI = interface(JObject)
  ['{15EDBC0B-161A-4642-8D80-DC6E01128598}']
    { Property Methods }

    { methods }
    procedure StartConfig(P1: JSCJNI_Args); cdecl;
    procedure StopConfig; cdecl;
    procedure PrepareConfigSoftAP(P1: Integer; P2: Integer); cdecl;
    function SendConfigSoftAP(P1: JSCJNI_Args; P2: Integer): Integer; cdecl;
    function isMySSID(P1: JSCJNI_Args_SoftAP): Integer; cdecl;

    { Property }
  end;

  TJSCJNI = class(TJavaGenericImport<JSCJNIClass, JSCJNI>) end;

//  JSCLibrary_1_1Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{13C2CA75-BEF0-4C43-A5C0-CA79A13F8C02}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JSCLibrary_1): JSCLibrary_1_1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/realtek/simpleconfiglib/SCLibrary$1$1')]
//  JSCLibrary_1_1 = interface(JBroadcastReceiver) // or JObject
//  ['{EE1BA678-9463-448B-8E58-4EBAC9A07478}']
//    { Property Methods }
//    function _Getthis_1: JSCLibrary_1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setthis_1(athis_1: JSCLibrary_1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//    property this_1: JSCLibrary_1 read _Getthis_1 write _Setthis_1;
//  end;
//
//  TJSCLibrary_1_1 = class(TJavaGenericImport<JSCLibrary_1_1Class, JSCLibrary_1_1>) end;

//  JSCLibrary_1Class = interface(JObjectClass)
//  ['{C2746298-A988-4330-821E-05E00A95E31A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JSCLibrary; P2: Integer): JSCLibrary_1; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/realtek/simpleconfiglib/SCLibrary$1')]
//  JSCLibrary_1 = interface(JObject)
//  ['{69A837DA-8FFE-4F6F-9DDB-26F4786081BE}']
//    { Property Methods }
//    function _Getthis_0: JSCLibrary;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setthis_0(athis_0: JSCLibrary);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property this_0: JSCLibrary read _Getthis_0 write _Setthis_0;
//  end;
//
//  TJSCLibrary_1 = class(TJavaGenericImport<JSCLibrary_1Class, JSCLibrary_1>) end;

//  JSCLibrary_2Class = interface(JObjectClass)
//  ['{4F6EE583-89A6-456E-91E7-A89204ABD53B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JSCLibrary; P2: JString; P3: JString; P4: JString; P5: JString; P6: Byte; P7: Integer; P8: Integer; P9: Byte; P10: Integer; P11: Integer; P12: Integer): JSCLibrary_2; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/realtek/simpleconfiglib/SCLibrary$2')]
//  JSCLibrary_2 = interface(JObject)
//  ['{13DDEC6A-8A18-46EA-A7F5-7BB22474AC64}']
//    { Property Methods }
//    function _Getthis_0: JSCLibrary;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setthis_0(athis_0: JSCLibrary);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//    function byteArrayToHex(P1: TJavaArray<Byte>): JString; cdecl;
//
//    { Property }
//    property this_0: JSCLibrary read _Getthis_0 write _Setthis_0;
//  end;
//
//  TJSCLibrary_2 = class(TJavaGenericImport<JSCLibrary_2Class, JSCLibrary_2>) end;

//  JSCLibrary_3Class = interface(JObjectClass)
//  ['{8C8F9204-5CC2-42AC-8F05-1F091F2C477E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JSCLibrary): JSCLibrary_3; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/realtek/simpleconfiglib/SCLibrary$3')]
//  JSCLibrary_3 = interface(JObject)
//  ['{95429B7F-A525-4C56-83AD-BAD9B3A5A5D6}']
//    { Property Methods }
//    function _Getthis_0: JSCLibrary;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setthis_0(athis_0: JSCLibrary);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property this_0: JSCLibrary read _Getthis_0 write _Setthis_0;
//  end;
//
//  TJSCLibrary_3 = class(TJavaGenericImport<JSCLibrary_3Class, JSCLibrary_3>) end;

  JSCLibrary_UtilsClass = interface(JObjectClass)
  ['{B70E7461-31F3-4F48-840E-3AC19A87F9FC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSCLibrary_Utils; cdecl;
    {class} function bytesToHex(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function getUTF8Bytes(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function loadFileAsString(P1: JString): JString; cdecl;
    {class} function getMACAddress(P1: JString): JString; cdecl;
    {class} function getIPAddress(P1: Boolean): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCLibrary$Utils')]
  JSCLibrary_Utils = interface(JObject)
  ['{4965D71C-CA46-4982-8B80-77F321DAD622}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCLibrary_Utils = class(TJavaGenericImport<JSCLibrary_UtilsClass, JSCLibrary_Utils>) end;

  JSCLibraryClass = interface(JObjectClass)
  ['{C0D8C9CE-8213-4F23-B127-CE1E8C5E6F11}']
    { static Property Methods }
    {class} function _GetTotalConfigTimeMs: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOldModeConfigTimeMs: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetProfileSendRounds: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetProfileSendTimeIntervalMs: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPacketSendTimeIntervalMs: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEachPacketSendCounts: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetisHiddenSSID: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSCLibrary; cdecl; overload;
//    {class} function init: JSCLibrary; cdecl; overload;
    {class} procedure access_0(P1: JSCLibrary; P2: Boolean); cdecl;
    {class} function access_1(P1: JSCLibrary): Boolean; cdecl;
    {class} function access_2(P1: JSCLibrary): JIntentFilter; cdecl;
    {class} procedure access_3(P1: JSCLibrary; P2: Boolean); cdecl;
    {class} function access_4(P1: JSCLibrary): JSCNetworkOps; cdecl;
    {class} procedure access_5(P1: JSCLibrary; P2: JSCNetworkOps); cdecl;
    {class} function access_6(P1: JSCLibrary): JSCJNI_Args; cdecl;
    {class} function access_7(P1: JSCLibrary): Boolean; cdecl;
    {class} function access_8(P1: JSCLibrary): Boolean; cdecl;
    {class} function access_9(P1: JSCLibrary): JSCJNI; cdecl;
    {class} function access_10(P1: JSCLibrary): Boolean; cdecl;
    {class} function access_11(P1: JSCLibrary): Integer; cdecl;

    { static Property }
    {class} property TotalConfigTimeMs: Integer read _GetTotalConfigTimeMs;
    {class} property OldModeConfigTimeMs: Integer read _GetOldModeConfigTimeMs;
    {class} property ProfileSendRounds: Byte read _GetProfileSendRounds;
    {class} property ProfileSendTimeIntervalMs: Integer read _GetProfileSendTimeIntervalMs;
    {class} property PacketSendTimeIntervalMs: Integer read _GetPacketSendTimeIntervalMs;
    {class} property EachPacketSendCounts: Byte read _GetEachPacketSendCounts;
    {class} property isHiddenSSID: Integer read _GetisHiddenSSID;
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCLibrary')]
  JSCLibrary = interface(JObject)
  ['{6E529622-1673-4986-8A6D-B112067C0AC7}']
    { Property Methods }
    function _GetTreadMsgHandler: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTreadMsgHandler(aTreadMsgHandler: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure WifiInit(P1: JContext); cdecl;
    procedure WifiOpen; cdecl;
    procedure WifiStartScan; cdecl;
    function WifiGetScanResults: JList; cdecl;
    function WifiStatus: Integer; cdecl;
    function WifiAvailable: JString; cdecl;
    function isWifiConnected(P1: JString): Boolean; cdecl;
    function getConnectedWifiSSID: JString; cdecl;
    function getConnectedWifiBSSID: JString; cdecl;
    function WifiGetMacStr: JString; cdecl;
    function WifiGetIpInt: Integer; cdecl;
    function SoftAP_setSSID_prefix(P1: JString): Boolean; cdecl;
    function SoftAPInit(P1: Integer; P2: Integer; P3: Boolean): Integer; cdecl;
    procedure SoftAP_ss_close; cdecl;
    procedure sitesurveyAgain; cdecl;
    function ieee80211_frequency_to_channel(P1: Integer): Integer; cdecl;
    function handleScanResults(P1: JList): Integer; cdecl;
//    function checkVaildScanSSID(P1: JScanResult): Boolean; cdecl;
//    function getDUT_by_scanResults: JScanResult; cdecl;
    function softAP_cmd_send(P1: JString; P2: JString; P3: JString; P4: JString; P5: Integer; P6: JString; P7: Integer): JString; cdecl;
    procedure rtk_sc_reset; cdecl;
    procedure rtk_sc_init; cdecl;
    procedure rtk_sc_exit; cdecl;
    procedure rtk_sc_set_ssid(P1: JString); cdecl;
    procedure rtk_sc_set_password(P1: JString); cdecl;
    procedure rtk_sc_set_ip(P1: Integer); cdecl;
    procedure rtk_sc_set_bssid(P1: JString); cdecl;
    procedure rtk_sc_set_default_pin(P1: JString); cdecl;
    function rtk_sc_get_default_pin: JString; cdecl;
    procedure rtk_sc_set_pin(P1: JString); cdecl;
    procedure rtk_sc_set_deviceNum(P1: Integer); cdecl;
    procedure rtk_sc_build_profile; cdecl;
    procedure rtk_sc_start(P1: JString; P2: JString; P3: JString; P4: JString; P5: Integer; P6: Integer; P7: Byte; P8: Integer; P9: Integer; P10: Byte; P11: Integer); cdecl; overload;
    procedure rtk_sc_start; cdecl; overload;
    procedure rtk_sc_stop; cdecl;
    function rtk_sc_get_connected_sta_num: Integer; cdecl;
    function rtk_sc_get_connected_sta_info(P1: JList): Integer; cdecl;
    function rtk_sc_send_discover_packet(P1: TJavaArray<Byte>; P2: JString): Integer; cdecl;
    function rtk_sc_send_control_packet(P1: TJavaArray<Byte>; P2: JString): Integer; cdecl;

    { Property }
    property TreadMsgHandler: JHandler read _GetTreadMsgHandler write _SetTreadMsgHandler;
  end;

  TJSCLibrary = class(TJavaGenericImport<JSCLibraryClass, JSCLibrary>) end;

  JSCNetworkOpsClass = interface(JObjectClass)
  ['{28DF4E18-3CD3-4F31-8560-F108E2A7DECB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSCNetworkOps; cdecl;
    {class} function int2byteLE(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function int2byteBE(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function IPStr2IntegerBE(P1: JString): Int64; cdecl;
    {class} function IntegerLE2IPStr(P1: Integer): JString; cdecl;
    {class} function IntegerBE2IPStr(P1: Integer): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCNetworkOps')]
  JSCNetworkOps = interface(JObject)
  ['{46E5FE94-2029-47CC-9CCE-EC4138FA201E}']
    { Property Methods }

    { methods }
    procedure WifiInit(P1: JContext); cdecl;
    procedure WifiScanFilter_Init(P1: JIntentFilter); cdecl;
    function WifiGetConfigNetworks: JList; cdecl;
//    function getWifiInfo: JWifiConfiguration; cdecl;
//    function getWifiDHCPinfo: JDhcpInfo; cdecl;
    function removeWifiConfig(P1: Integer): Boolean; cdecl;
    function getMacAddr_method1: JString; cdecl;
    procedure WifiOpen; cdecl;
    procedure WifiClose; cdecl;
    procedure WifiReAssociate; cdecl;
    procedure WifiStartScan; cdecl;
    function WifiGetScanResults: JList; cdecl;
    function WifiGetConfiguredNetworks: JList; cdecl;
    function WifiStatus: Integer; cdecl;
    function WifiAvailable: JString; cdecl;
    function isWifiConnected(P1: JString): Boolean; cdecl;
    function getConnectedWifiSSID: JString; cdecl;
    function getConnectedWifiBSSID: JString; cdecl;
    function WifiGetMacStr: JString; cdecl;
    function WifiGetIpInt: Integer; cdecl;
    procedure BroadcastSocketCreate; cdecl;
    procedure BroadcastSocketDestroy; cdecl;
    procedure UnicastSocketCreate; cdecl;
    procedure UnicastSocketDestroy; cdecl;
    procedure R3_UnicastSocketCreate; cdecl;
    procedure R3_UnicastSocketDestroy; cdecl;
    procedure UDPBroadcastSend; cdecl;
    procedure UDPUnicastSend; cdecl;
    function UDPUnicastRecv: Boolean; cdecl;
    function R3_UDPUnicastRecv: Boolean; cdecl;

    { Property }
  end;

  TJSCNetworkOps = class(TJavaGenericImport<JSCNetworkOpsClass, JSCNetworkOps>) end;

  JSCParam_FlagClass = interface(JObjectClass)
  ['{CBB2A934-D8A3-48AF-B6BE-7CF704C3BB0A}']
    { static Property Methods }
    {class} function _GetVersion: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRequestFlag: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetResponseFlag: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDiscover: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSaveProf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDelProf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRenameDev: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetReturnACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNewAPReq: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCfgSuccessACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDiscoverACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSaveProfACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDelProfACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRenameDevACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCFGTimeSendBack: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCfgSuccessACKFinish: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNewAPACK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property Version: Integer read _GetVersion;
    {class} property RequestFlag: Integer read _GetRequestFlag;
    {class} property ResponseFlag: Integer read _GetResponseFlag;
    {class} property Discover: Integer read _GetDiscover;
    {class} property SaveProf: Integer read _GetSaveProf;
    {class} property DelProf: Integer read _GetDelProf;
    {class} property RenameDev: Integer read _GetRenameDev;
    {class} property ReturnACK: Integer read _GetReturnACK;
    {class} property NewAPReq: Integer read _GetNewAPReq;
    {class} property CfgSuccessACK: Integer read _GetCfgSuccessACK;
    {class} property DiscoverACK: Integer read _GetDiscoverACK;
    {class} property SaveProfACK: Integer read _GetSaveProfACK;
    {class} property DelProfACK: Integer read _GetDelProfACK;
    {class} property RenameDevACK: Integer read _GetRenameDevACK;
    {class} property CFGTimeSendBack: Integer read _GetCFGTimeSendBack;
    {class} property CfgSuccessACKFinish: Integer read _GetCfgSuccessACKFinish;
    {class} property NewAPACK: Integer read _GetNewAPACK;
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCParam$Flag')]
  JSCParam_Flag = interface(JObject)
  ['{982B2BB3-087E-42FE-98E6-634045D4AD21}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCParam_Flag = class(TJavaGenericImport<JSCParam_FlagClass, JSCParam_Flag>) end;

  JSCParam_Flag_OtherClass = interface(JObjectClass)
  ['{9B5BDD6A-5A50-449A-9809-A6721EF2864D}']
    { static Property Methods }
    {class} function _GetSiteSurveyFinish: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property SiteSurveyFinish: Integer read _GetSiteSurveyFinish;
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCParam$Flag_Other')]
  JSCParam_Flag_Other = interface(JObject)
  ['{DACD2CB8-DA83-474E-BAD6-330C33D7E435}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCParam_Flag_Other = class(TJavaGenericImport<JSCParam_Flag_OtherClass, JSCParam_Flag_Other>) end;

  JSCParam_R3_UDPUcastClass = interface(JObjectClass)
  ['{79E421AB-CE8A-4247-BEC9-6821D7D252F5}']
    { static Property Methods }
//    {class} function _GetUcastSock: JDatagramSocket;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIPAddr: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSrcPort: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDestPort: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSendMsg: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSendLen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecvBuf: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecvLen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIN_ACK_LENGTH: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSCParam_R3_UDPUcast; cdecl;

    { static Property }
//    {class} property UcastSock: JDatagramSocket read _GetUcastSock;
    {class} property IPAddr: JString read _GetIPAddr;
    {class} property SrcPort: Integer read _GetSrcPort;
    {class} property DestPort: Integer read _GetDestPort;
    {class} property SendMsg: TJavaArray<Byte> read _GetSendMsg;
    {class} property SendLen: Integer read _GetSendLen;
    {class} property RecvBuf: TJavaArray<Byte> read _GetRecvBuf;
    {class} property RecvLen: Integer read _GetRecvLen;
    {class} property MIN_ACK_LENGTH: Byte read _GetMIN_ACK_LENGTH;
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCParam$R3_UDPUcast')]
  JSCParam_R3_UDPUcast = interface(JObject)
  ['{4D76A5B5-257E-489E-9C70-4AD03285B42B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCParam_R3_UDPUcast = class(TJavaGenericImport<JSCParam_R3_UDPUcastClass, JSCParam_R3_UDPUcast>) end;

  JSCParam_RecvACKClass = interface(JObjectClass)
  ['{37D5E88E-1C70-4620-B506-8F4A3C6B3FE7}']
    { static Property Methods }
    {class} function _GetMaxCfgNum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMac: TJavaArray<TJavaArray<Byte>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStatus: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetType: TJavaArray<TJavaArray<Byte>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIPBuf: TJavaArray<TJavaArray<Byte>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIP: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNameBuf: TJavaArray<TJavaArray<Byte>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetName: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUsePin: TJavaObjectArray<JBoolean>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSCParam_RecvACK; cdecl;

    { static Property }
    {class} property MaxCfgNum: Integer read _GetMaxCfgNum;
    {class} property Mac: TJavaArray<TJavaArray<Byte>> read _GetMac;
    {class} property Status: TJavaArray<Byte> read _GetStatus;
    {class} property &Type: TJavaArray<TJavaArray<Byte>> read _GetType;
    {class} property IPBuf: TJavaArray<TJavaArray<Byte>> read _GetIPBuf;
    {class} property IP: TJavaObjectArray<JString> read _GetIP;
    {class} property NameBuf: TJavaArray<TJavaArray<Byte>> read _GetNameBuf;
    {class} property Name: TJavaObjectArray<JString> read _GetName;
    {class} property UsePin: TJavaObjectArray<JBoolean> read _GetUsePin;
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCParam$RecvACK')]
  JSCParam_RecvACK = interface(JObject)
  ['{FBBAE5E7-8BAE-46A8-970A-5DC8A5171B07}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCParam_RecvACK = class(TJavaGenericImport<JSCParam_RecvACKClass, JSCParam_RecvACK>) end;

  JSCParam_SoftAPMode_ParamClass = interface(JObjectClass)
  ['{6F8966C0-30B3-40BE-A7A3-A32AA68ED8E2}']
    { static Property Methods }
    {class} function _GetCfgDUTNum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMaxDUT_AP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getparam_SSID: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getparam_BSSID: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSCParam_SoftAPMode_Param; cdecl;

    { static Property }
    {class} property CfgDUTNum: Integer read _GetCfgDUTNum;
    {class} property MaxDUT_AP: Integer read _GetMaxDUT_AP;
    {class} property param_SSID: TJavaObjectArray<JString> read _Getparam_SSID;
    {class} property param_BSSID: TJavaObjectArray<JString> read _Getparam_BSSID;
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCParam$SoftAPMode_Param')]
  JSCParam_SoftAPMode_Param = interface(JObject)
  ['{5E4C413A-18B1-48ED-8331-CAF52CFBE472}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCParam_SoftAPMode_Param = class(TJavaGenericImport<JSCParam_SoftAPMode_ParamClass, JSCParam_SoftAPMode_Param>) end;

  JSCParam_UDPBcastClass = interface(JObjectClass)
  ['{4F503797-393B-40EA-9412-EC042DC72059}']
    { static Property Methods }
//    {class} function _GetBcastSock: JDatagramSocket;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIPAddr: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSrcPort: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDestPort: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSendMsg: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSendLen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
//    {class} property BcastSock: JDatagramSocket read _GetBcastSock;
    {class} property IPAddr: JString read _GetIPAddr;
    {class} property SrcPort: Integer read _GetSrcPort;
    {class} property DestPort: Integer read _GetDestPort;
    {class} property SendMsg: TJavaArray<Byte> read _GetSendMsg;
    {class} property SendLen: Integer read _GetSendLen;
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCParam$UDPBcast')]
  JSCParam_UDPBcast = interface(JObject)
  ['{D8A41BE3-AFBB-4193-A5AD-A954D19D70A5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCParam_UDPBcast = class(TJavaGenericImport<JSCParam_UDPBcastClass, JSCParam_UDPBcast>) end;

  JSCParam_UDPUcastClass = interface(JObjectClass)
  ['{91BDBFB6-001A-4702-B1AB-9D2D8DD0E9A2}']
    { static Property Methods }
//    {class} function _GetUcastSock: JDatagramSocket;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIPAddr: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSrcPort: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDestPort: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSendMsg: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSendLen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecvBuf: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRecvLen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIN_ACK_LENGTH: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSCParam_UDPUcast; cdecl;

    { static Property }
//    {class} property UcastSock: JDatagramSocket read _GetUcastSock;
    {class} property IPAddr: JString read _GetIPAddr;
    {class} property SrcPort: Integer read _GetSrcPort;
    {class} property DestPort: Integer read _GetDestPort;
    {class} property SendMsg: TJavaArray<Byte> read _GetSendMsg;
    {class} property SendLen: Integer read _GetSendLen;
    {class} property RecvBuf: TJavaArray<Byte> read _GetRecvBuf;
    {class} property RecvLen: Integer read _GetRecvLen;
    {class} property MIN_ACK_LENGTH: Byte read _GetMIN_ACK_LENGTH;
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCParam$UDPUcast')]
  JSCParam_UDPUcast = interface(JObject)
  ['{41A72620-96E3-42F8-9FF4-C58FD5FF043F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCParam_UDPUcast = class(TJavaGenericImport<JSCParam_UDPUcastClass, JSCParam_UDPUcast>) end;

  JSCParamClass = interface(JObjectClass)
  ['{537360C0-498D-43C7-9A21-7C6BF0D38E53}']
    { static Property Methods }
    {class} function _GetMODE_1: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_2: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_3: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDefault_PIN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSC_SSID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSC_PASSWD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSC_PIN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSC_BSSID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSC_IP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSC_NUM_DEVICE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_CLIENTS_NUM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX_CONFIG_NUM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBROADCAST_SPORT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBROADCAST_DPORT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNICAST_SPORT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNICAST_DPORT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetR3_UNICAST_SPORT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetR3_UNICAST_DPORT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSCParam; cdecl;
    {class} function BIT(P1: Integer): Integer; cdecl;

    { static Property }
    {class} property MODE_1: Byte read _GetMODE_1;
    {class} property MODE_2: Byte read _GetMODE_2;
    {class} property MODE_3: Byte read _GetMODE_3;
    {class} property Default_PIN: JString read _GetDefault_PIN;
    {class} property SC_SSID: JString read _GetSC_SSID;
    {class} property SC_PASSWD: JString read _GetSC_PASSWD;
    {class} property SC_PIN: JString read _GetSC_PIN;
    {class} property SC_BSSID: JString read _GetSC_BSSID;
    {class} property SC_IP: Integer read _GetSC_IP;
    {class} property SC_NUM_DEVICE: Integer read _GetSC_NUM_DEVICE;
    {class} property MAX_CLIENTS_NUM: Integer read _GetMAX_CLIENTS_NUM;
    {class} property MAX_CONFIG_NUM: Integer read _GetMAX_CONFIG_NUM;
    {class} property BROADCAST_SPORT: Integer read _GetBROADCAST_SPORT;
    {class} property BROADCAST_DPORT: Integer read _GetBROADCAST_DPORT;
    {class} property UNICAST_SPORT: Integer read _GetUNICAST_SPORT;
    {class} property UNICAST_DPORT: Integer read _GetUNICAST_DPORT;
    {class} property R3_UNICAST_SPORT: Integer read _GetR3_UNICAST_SPORT;
    {class} property R3_UNICAST_DPORT: Integer read _GetR3_UNICAST_DPORT;
  end;

  [JavaSignature('com/realtek/simpleconfiglib/SCParam')]
  JSCParam = interface(JObject)
  ['{0B9B921B-94C7-4E6A-99ED-85F07301EA96}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSCParam = class(TJavaGenericImport<JSCParamClass, JSCParam>) end;

  JGZIPFrameClass = interface(JObjectClass)
  ['{68719570-4989-4D48-8B52-393F8C8036C9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGZIPFrame; cdecl;
    {class} function codec(P1: TJavaArray<Byte>; P2: Integer): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('zpSDK/zpSDK/GZIPFrame')]
  JGZIPFrame = interface(JObject)
  ['{A1A5F635-9520-46C2-BBFE-0B6D9FEC84AA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGZIPFrame = class(TJavaGenericImport<JGZIPFrameClass, JGZIPFrame>) end;

  JPrinterInterfaceClass = interface(JObjectClass)
  ['{55202699-F9E7-4F12-90E0-FBAF1D4168F8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('zpSDK/zpSDK/PrinterInterface')]
  JPrinterInterface = interface(IJavaInstance)
  ['{09D93128-545F-49A5-8C61-6D7E47EFC33C}']
    { Property Methods }

    { methods }
    function getAllPrinters: JArrayList; cdecl;
    function getAllPrintersName: JArrayList; cdecl;
    function openPrinterSync(P1: JString): Boolean; cdecl;
    function getConnectedPrinterName: JString; cdecl;
    function getConnectedPrinterInfo: JMap; cdecl;
    function getPrintersState: Integer; cdecl;
    procedure cancel; cdecl;
    procedure close; cdecl;
    function reOpenPrinterSync: Boolean; cdecl;
    function onPrintProgress: Boolean; cdecl;
    function onStateChange: Integer; cdecl;
    function startJob(P1: Integer): Boolean; cdecl;
    function startPage(P1: Integer; P2: Integer; P3: Integer): Boolean; cdecl;
    function endPage: Boolean; cdecl;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean; P9: Integer): Boolean; cdecl;
    function drawTextRegular(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Boolean; cdecl;
    procedure setFontFamily(P1: Integer); cdecl;
    function drawBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Boolean; cdecl;
    function drawQrCode(P1: JString; P2: Integer; P3: Integer; P4: Integer): Boolean; cdecl;
    function drawLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Boolean; cdecl;
    function drawRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Boolean; cdecl;
    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Boolean; cdecl;
    function mmToPixel(P1: Integer): Integer; cdecl;
    procedure SetFirmware(P1: JString); cdecl;
    function pixelToMm(P1: Integer): Integer; cdecl;
    procedure zp_printer_status_detect; cdecl;
    function zp_printer_status_get(P1: Integer): Integer; cdecl;
    function printselftest: Integer; cdecl;
    procedure settingblackness(P1: Integer); cdecl;

    { Property }
  end;

  TJPrinterInterface = class(TJavaGenericImport<JPrinterInterfaceClass, JPrinterInterface>) end;

//  JzpBluetoothPrinter_printClass = interface(JObjectClass)
//  ['{2946A69D-E529-4624-95B1-5ACB2C1883C5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JzpBluetoothPrinter): JzpBluetoothPrinter_print; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('zpSDK/zpSDK/zpBluetoothPrinter$print')]
//  JzpBluetoothPrinter_print = interface(JObject)
//  ['{A663E0FE-55AF-4C8E-90A7-C5CF4642FA4C}']
//    { Property Methods }
//    function _Getname: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setname(aname: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getmac: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setmac(amac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getthis_0: JzpBluetoothPrinter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setthis_0(athis_0: JzpBluetoothPrinter);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function GetName: JString; cdecl;
//    function Getmac: JString; cdecl;
//
//    { Property }
//    property name: JString read _Getname write _Setname;
//    property mac: JString read _Getmac write _Setmac;
//    property this_0: JzpBluetoothPrinter read _Getthis_0 write _Setthis_0;
//  end;
//
//  TJzpBluetoothPrinter_print = class(TJavaGenericImport<JzpBluetoothPrinter_printClass, JzpBluetoothPrinter_print>) end;

//  JzpBluetoothPrinter__fontstyleClass = interface(JObjectClass)
//  ['{DA0B80AE-5460-46DC-8E4A-EABFF530D8A8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JzpBluetoothPrinter): JzpBluetoothPrinter__fontstyle; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('zpSDK/zpSDK/zpBluetoothPrinter$_fontstyle')]
//  JzpBluetoothPrinter__fontstyle = interface(JObject)
//  ['{D151A23B-3E37-4C7A-8EA6-92CC97E2D5ED}']
//    { Property Methods }
//    function _Getbold: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setbold(abold: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getthis_0: JzpBluetoothPrinter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setthis_0(athis_0: JzpBluetoothPrinter);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property bold: Integer read _Getbold write _Setbold;
//    property this_0: JzpBluetoothPrinter read _Getthis_0 write _Setthis_0;
//  end;
//
//  TJzpBluetoothPrinter__fontstyle = class(TJavaGenericImport<JzpBluetoothPrinter__fontstyleClass, JzpBluetoothPrinter__fontstyle>) end;

  JzpBluetoothPrinterClass = interface(JObjectClass)
  ['{1840A154-2132-48F3-8BAC-47F08ECE21BA}']
    { static Property Methods }
//    {class} function _GetmyBluetoothAdapter: JBluetoothAdapter;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JzpBluetoothPrinter; cdecl; overload;
    {class} function init(P1: JContext): JzpBluetoothPrinter; cdecl; overload;
    {class} function zp_page_create(P1: Double; P2: Double): Boolean; cdecl;
    {class} procedure zp_page_free; cdecl;
    {class} procedure zp_page_clear; cdecl;

    { static Property }
//    {class} property myBluetoothAdapter: JBluetoothAdapter read _GetmyBluetoothAdapter;
  end;

  [JavaSignature('zpSDK/zpSDK/zpBluetoothPrinter')]
  JzpBluetoothPrinter = interface(JObject)
  ['{8A2F4A1C-04E3-4B6D-86B1-0155E2E995CE}']
    { Property Methods }
    function _Getprints: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setprints(aprints: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure AddPrints(P1: JString; P2: JString); cdecl;
    function getAllPrinters: JArrayList; cdecl;
    function getAllPrintersName: JArrayList; cdecl;
    function openPrinterSync(P1: JString): Boolean; cdecl;
    function getConnectedPrinterName: JString; cdecl;
    function getConnectedPrinterInfo: JMap; cdecl;
    function getPrintersState: Integer; cdecl;
    procedure cancel; cdecl;
    procedure close; cdecl;
    function reOpenPrinterSync: Boolean; cdecl;
    function onPrintProgress: Boolean; cdecl;
    function onStateChange: Integer; cdecl;
    function startJob(P1: Integer): Boolean; cdecl;
    function startPage(P1: Integer; P2: Integer; P3: Integer): Boolean; cdecl;
    function endPage: Boolean; cdecl;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean; P9: Integer): Boolean; cdecl;
    function drawTextRegular(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Boolean; cdecl;
    procedure setFontFamily(P1: Integer); cdecl;
    function drawBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Boolean; cdecl;
    function drawQrCode(P1: JString; P2: Integer; P3: Integer; P4: Integer): Boolean; cdecl;
    function drawLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Boolean; cdecl;
    function drawRectangle(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Boolean; cdecl;
    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Boolean; cdecl;
    procedure zp_page_print; cdecl;
    function mmToPixel(P1: Integer): Integer; cdecl;
    function pixelToMm(P1: Integer): Integer; cdecl;
    procedure zp_printer_status_detect; cdecl;
    function zp_printer_status_get(P1: Integer): Integer; cdecl;
    function printselftest: Integer; cdecl;
    procedure SetFirmware(P1: JString); cdecl;
    procedure settingblackness(P1: Integer); cdecl;

    { Property }
    property prints: JList read _Getprints write _Setprints;
  end;

  TJzpBluetoothPrinter = class(TJavaGenericImport<JzpBluetoothPrinterClass, JzpBluetoothPrinter>) end;

  J_PrinterPageImplClass = interface(JObjectClass)
  ['{5A6510B0-8D66-4C74-BEF4-1064E6BEF195}']
    { static Property Methods }
    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: J_PrinterPageImpl; cdecl; overload;
//    {class} function init: J_PrinterPageImpl; cdecl; overload;

    { static Property }
    {class} property a: Integer read _Geta;
  end;

  [JavaSignature('zpSDK/zpSDK/_PrinterPageImpl')]
  J_PrinterPageImpl = interface(JObject)
  ['{5610F535-B079-46EF-8234-92C1C67BA526}']
    { Property Methods }
    function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seth(ah: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getw: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setw(aw: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure Create(P1: Integer; P2: Integer; P3: Integer); cdecl;
    procedure Clear; cdecl;
    function getlen: Integer; cdecl;
    function GetData(P1: Integer): TJavaArray<Byte>; cdecl;
    procedure DrawText(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: Boolean; P7: Integer); cdecl; overload;
    procedure DrawText(P1: Integer; P2: Integer; P3: JString); cdecl; overload;
    procedure DrawLine(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure DrawBox(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer); cdecl;
    procedure DrawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Boolean); cdecl;
    procedure DrawBarcode1D(P1: JString; P2: Integer; P3: Integer; P4: JString; P5: Integer; P6: Integer; P7: Boolean); cdecl;
    procedure DrawBarcodePDF417(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Boolean); cdecl;
    procedure DrawBarcodeQRcode(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: JString; P6: Boolean); cdecl;
    procedure PageFree; cdecl;
    procedure _drawbitmap(P1: Integer; P2: Integer; P3: JBitmap; P4: Boolean; P5: Boolean); cdecl;

    { Property }
    property h: Integer read _Geth write _Seth;
    property w: Integer read _Getw write _Setw;
  end;

  TJ_PrinterPageImpl = class(TJavaGenericImport<J_PrinterPageImplClass, J_PrinterPageImpl>) end;


{$ENDIF}
implementation

end.

