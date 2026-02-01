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
//  生成时间：2025/10/5 11:01:30
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.LPAPI_2024_10_21_R;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.android.os.Message, 
  Androidapi.JNI.android.graphics.Bitmap, 
  Androidapi.JNI.android.bluetooth.BluetoothDevice, 
  Androidapi.JNI.android.bluetooth.BluetoothAdapter, 
  Androidapi.JNI.android.bluetooth.BluetoothSocket, 
  Androidapi.JNI.android.bluetooth.BluetoothGatt, 
  Androidapi.JNI.android.bluetooth.BluetoothGattCharacteristic, 
  Androidapi.JNI.android.bluetooth.BluetoothGattDescriptor, 
  Androidapi.JNI.android.content.Context, 
  Androidapi.JNI.android.content.Intent, 
  Androidapi.JNI.android.content.BroadcastReceiver, 
  Androidapi.JNI.android.content.IntentFilter, 
  Androidapi.JNI.android.app.Application, 
  Androidapi.JNI.android.content.pm.PackageInfo, 
  Androidapi.JNI.android.os.Handler, 
  Androidapi.JNI.android.content.res.Configuration, 
  Androidapi.JNI.java.text.SimpleDateFormat, 
  Androidapi.JNI.android.widget.Toast, 
  Androidapi.JNI.android.app.Activity, 
  Androidapi.JNI.android.os.Bundle, 
  Androidapi.JNI.android.graphics.Bitmap_Config, 
  Androidapi.JNI.android.os.Parcel, 
  Androidapi.JNI.org.xmlpull.v1.XmlPullParser, 
  Androidapi.JNI.org.xmlpull.v1.XmlSerializer, 
  Androidapi.JNI.android.hardware.usb.UsbInterface, 
  Androidapi.JNI.android.hardware.usb.UsbEndpoint, 
  Androidapi.JNI.android.hardware.usb.UsbDevice, 
  Androidapi.JNI.android.hardware.usb.UsbDeviceConnection, 
  Androidapi.JNI.android.hardware.usb.UsbManager, 
  Androidapi.JNI.java.nio.charset.Charset, 
  Androidapi.JNI.android.graphics.Point, 
  Androidapi.JNI.android.webkit.WebView, 
  Androidapi.JNI.android.os.Handler_Callback, 
  Androidapi.JNI.android.view.View;


type

// ===== Forward declarations =====

  Ja = interface; //com.dothantech.a.a.a
  Jb = interface; //com.dothantech.a.a.b
  Jc_a = interface; //com.dothantech.a.a.c$a
  Jc = interface; //com.dothantech.a.a.c
  Jd = interface; //com.dothantech.a.a.d
  Je = interface; //com.dothantech.a.a.e
  Jf = interface; //com.dothantech.a.a.f
  Ja_a = interface; //com.dothantech.b.a$a
  Ja_008 = interface; //com.dothantech.b.a
  Jb_a = interface; //com.dothantech.b.b$a
  Jb_b = interface; //com.dothantech.b.b$b
  Jb_c = interface; //com.dothantech.b.b$c
  Jb_012 = interface; //com.dothantech.b.b
  Jc_013 = interface; //com.dothantech.b.c
  Jd_014 = interface; //com.dothantech.b.d
  Je_a = interface; //com.dothantech.b.e$a
  Je_016 = interface; //com.dothantech.b.e
  Jf_017 = interface; //com.dothantech.b.f
  Jg = interface; //com.dothantech.b.g
  Jh = interface; //com.dothantech.b.h
  Ji = interface; //com.dothantech.b.i
  Jj = interface; //com.dothantech.b.j
  Jk = interface; //com.dothantech.b.k
  Jl = interface; //com.dothantech.b.l
  Jm = interface; //com.dothantech.b.m
  Jn = interface; //com.dothantech.b.n
  Jo = interface; //com.dothantech.b.o
  Jp = interface; //com.dothantech.b.p
  Jq = interface; //com.dothantech.b.q
  Jr = interface; //com.dothantech.b.r
  Js = interface; //com.dothantech.b.s
  Jt = interface; //com.dothantech.b.t
  Ja_032 = interface; //com.dothantech.c.a
  Jb_033 = interface; //com.dothantech.c.b
  Jc_034 = interface; //com.dothantech.c.c
  Ja_a_035 = interface; //com.dothantech.common.a$a
  Ja_b = interface; //com.dothantech.common.a$b
  Ja_037 = interface; //com.dothantech.common.a
  Jaa_a = interface; //com.dothantech.common.aa$a
  Jaa = interface; //com.dothantech.common.aa
  Jab = interface; //com.dothantech.common.ab
  Jac = interface; //com.dothantech.common.ac
  Jad = interface; //com.dothantech.common.ad
  Jae = interface; //com.dothantech.common.ae
  Jaf = interface; //com.dothantech.common.af
  Jag_a = interface; //com.dothantech.common.ag$a
  Jag = interface; //com.dothantech.common.ag
  Jah = interface; //com.dothantech.common.ah
  Jai = interface; //com.dothantech.common.ai
  Jaj = interface; //com.dothantech.common.aj
  Jak = interface; //com.dothantech.common.ak
  Jal = interface; //com.dothantech.common.al
  Jam = interface; //com.dothantech.common.am
  Jan = interface; //com.dothantech.common.an
  Jao_a = interface; //com.dothantech.common.ao$a
  Jao = interface; //com.dothantech.common.ao
  Jap = interface; //com.dothantech.common.ap
  Jaq = interface; //com.dothantech.common.aq
  Jar = interface; //com.dothantech.common.ar
  Jas = interface; //com.dothantech.common.as
  Jat = interface; //com.dothantech.common.at
  Jau_a = interface; //com.dothantech.common.au$a
  Jau = interface; //com.dothantech.common.au
  Jav = interface; //com.dothantech.common.av
  Jaw = interface; //com.dothantech.common.aw
  Jax = interface; //com.dothantech.common.ax
  Jay = interface; //com.dothantech.common.ay
  Jb_067 = interface; //com.dothantech.common.b
  Jc_068 = interface; //com.dothantech.common.c
  Jd_069 = interface; //com.dothantech.common.d
  JDzSystem = interface; //com.dothantech.common.DzSystem
  Je_071 = interface; //com.dothantech.common.e
  Jf_a = interface; //com.dothantech.common.f$a
  Jf_073 = interface; //com.dothantech.common.f
  Jg_074 = interface; //com.dothantech.common.g
  Jh_075 = interface; //com.dothantech.common.h
  Ji_a = interface; //com.dothantech.common.i$a
  Ji_077 = interface; //com.dothantech.common.i
  Jj_078 = interface; //com.dothantech.common.j
  Jk_079 = interface; //com.dothantech.common.k
  Jl_080 = interface; //com.dothantech.common.l
  Jm_081 = interface; //com.dothantech.common.m
  Jn_a = interface; //com.dothantech.common.n$a
  Jn_083 = interface; //com.dothantech.common.n
  Jo_084 = interface; //com.dothantech.common.o
  Jp_085 = interface; //com.dothantech.common.p
  Jq_a = interface; //com.dothantech.common.q$a
  Jq_087 = interface; //com.dothantech.common.q
  Jr_a = interface; //com.dothantech.common.r$a
  Jr_089 = interface; //com.dothantech.common.r
  JReflection = interface; //com.dothantech.common.Reflection
  Js_091 = interface; //com.dothantech.common.s
  Jt_092 = interface; //com.dothantech.common.t
  Ju = interface; //com.dothantech.common.u
  Jv = interface; //com.dothantech.common.v
  Jw_a = interface; //com.dothantech.common.w$a
  Jw_b = interface; //com.dothantech.common.w$b
  Jw_c = interface; //com.dothantech.common.w$c
  Jw_d = interface; //com.dothantech.common.w$d
  Jw_e = interface; //com.dothantech.common.w$e
  Jw_f = interface; //com.dothantech.common.w$f
  Jw_g = interface; //com.dothantech.common.w$g
  Jw = interface; //com.dothantech.common.w
  Jx = interface; //com.dothantech.common.x
  Jy = interface; //com.dothantech.common.y
  Jz = interface; //com.dothantech.common.z
  Ja_106 = interface; //com.dothantech.d.a
  Ja_a_107 = interface; //com.dothantech.data.a$a
  Ja_108 = interface; //com.dothantech.data.a
  Jb_109 = interface; //com.dothantech.data.b
  Jc_110 = interface; //com.dothantech.data.c
  Jd_a_a = interface; //com.dothantech.data.d$a$a
  Jd_a = interface; //com.dothantech.data.d$a
  Jd_b = interface; //com.dothantech.data.d$b
  Jd_114 = interface; //com.dothantech.data.d
  JDzTagObject_a = interface; //com.dothantech.data.DzTagObject$a
  JDzTagObject = interface; //com.dothantech.data.DzTagObject
  Je_a_117 = interface; //com.dothantech.data.e$a
  Je_118 = interface; //com.dothantech.data.e
  Jf_119 = interface; //com.dothantech.data.f
  Jg_120 = interface; //com.dothantech.data.g
  Jh_a = interface; //com.dothantech.data.h$a
  Jh_b = interface; //com.dothantech.data.h$b
  Jh_123 = interface; //com.dothantech.data.h
  Ji_a_124 = interface; //com.dothantech.data.i$a
  Ji_125 = interface; //com.dothantech.data.i
  Jj_a = interface; //com.dothantech.data.j$a
  Jj_b = interface; //com.dothantech.data.j$b
  Jj_c = interface; //com.dothantech.data.j$c
  Jj_129 = interface; //com.dothantech.data.j
  Ja_130 = interface; //com.dothantech.e.a
  Jb_131 = interface; //com.dothantech.e.b
  Jc_132 = interface; //com.dothantech.e.c
  Jd_133 = interface; //com.dothantech.e.d
  Je_134 = interface; //com.dothantech.e.e
  Jf_135 = interface; //com.dothantech.e.f
  Ja_136 = interface; //com.dothantech.f.a
  Jb_137 = interface; //com.dothantech.f.b
  Jc_138 = interface; //com.dothantech.f.c
  Jd_139 = interface; //com.dothantech.f.d
  Ja_a_140 = interface; //com.dothantech.g.a$a
  Ja_141 = interface; //com.dothantech.g.a
  Jb_142 = interface; //com.dothantech.g.b
  Jc_143 = interface; //com.dothantech.g.c
  Jd_144 = interface; //com.dothantech.g.d
  Je_145 = interface; //com.dothantech.g.e
  Jf_146 = interface; //com.dothantech.g.f
  Jg_147 = interface; //com.dothantech.g.g
  Jh_148 = interface; //com.dothantech.g.h
  Ja_149 = interface; //com.dothantech.h.a.a.a
  Jb_150 = interface; //com.dothantech.h.a.a.b
  Jc_151 = interface; //com.dothantech.h.a.a.c
  Ja_152 = interface; //com.dothantech.h.a.a
  Jb_153 = interface; //com.dothantech.h.a.b
  Jc_154 = interface; //com.dothantech.h.a.c
  Jd_155 = interface; //com.dothantech.h.a.d
  Je_a_156 = interface; //com.dothantech.h.a.e$a
  Je_157 = interface; //com.dothantech.h.a.e
  Jf_158 = interface; //com.dothantech.h.a.f
  Ja_159 = interface; //com.dothantech.h.a
  Ja_160 = interface; //com.dothantech.h.b.a.a
  Jb_161 = interface; //com.dothantech.h.b.a.b
  Jc_162 = interface; //com.dothantech.h.b.a.c
  Jd_163 = interface; //com.dothantech.h.b.a.d
  Je_164 = interface; //com.dothantech.h.b.a.e
  Jf_165 = interface; //com.dothantech.h.b.a.f
  Jg_166 = interface; //com.dothantech.h.b.a.g
  Jh_167 = interface; //com.dothantech.h.b.a.h
  Ji_a_168 = interface; //com.dothantech.h.b.a.i$a
  Ji_b = interface; //com.dothantech.h.b.a.i$b
  Ji_c = interface; //com.dothantech.h.b.a.i$c
  Ji_d = interface; //com.dothantech.h.b.a.i$d
  Ji_172 = interface; //com.dothantech.h.b.a.i
  Jj_173 = interface; //com.dothantech.h.b.a.j
  Jk_174 = interface; //com.dothantech.h.b.a.k
  Jl_175 = interface; //com.dothantech.h.b.a.l
  Jm_176 = interface; //com.dothantech.h.b.a.m
  Jn_177 = interface; //com.dothantech.h.b.a.n
  Jb_178 = interface; //com.dothantech.h.b
  Ja_179 = interface; //com.dothantech.h.c.a
  Jb_180 = interface; //com.dothantech.h.c.b
  Jc_181 = interface; //com.dothantech.h.c.c
  Jd_a_182 = interface; //com.dothantech.h.c.d$a
  Jd_b_183 = interface; //com.dothantech.h.c.d$b
  Jd_184 = interface; //com.dothantech.h.c.d
  Je_185 = interface; //com.dothantech.h.c.e
  Jf_186 = interface; //com.dothantech.h.c.f
  Jg_a = interface; //com.dothantech.h.c.g$a
  Jg_b = interface; //com.dothantech.h.c.g$b
  Jg_189 = interface; //com.dothantech.h.c.g
  Jh_a_190 = interface; //com.dothantech.h.c.h$a
  Jh_191 = interface; //com.dothantech.h.c.h
  Ji_192 = interface; //com.dothantech.h.c.i
  Jj_a_193 = interface; //com.dothantech.h.c.j$a
  Jj_b_194 = interface; //com.dothantech.h.c.j$b
  Jj_c_195 = interface; //com.dothantech.h.c.j$c
  Jj_d = interface; //com.dothantech.h.c.j$d
  Jj_197 = interface; //com.dothantech.h.c.j
  Jk_198 = interface; //com.dothantech.h.c.k
  Jl_199 = interface; //com.dothantech.h.c.l
  Jm_a = interface; //com.dothantech.h.c.m$a
  Jm_201 = interface; //com.dothantech.h.c.m
  Jc_202 = interface; //com.dothantech.h.c
  Ja_203 = interface; //com.dothantech.h.d.a.a
  Jb_204 = interface; //com.dothantech.h.d.a.b
  Jc_a_205 = interface; //com.dothantech.h.d.a.c$a
  Jc_b = interface; //com.dothantech.h.d.a.c$b
  Jc_207 = interface; //com.dothantech.h.d.a.c
  Ja_208 = interface; //com.dothantech.h.d.b.a
  Jb_209 = interface; //com.dothantech.h.d.b.b
  Jc_210 = interface; //com.dothantech.h.d.b.c
  Jd_211 = interface; //com.dothantech.h.d.b.d
  Je_a_212 = interface; //com.dothantech.h.d.b.e$a
  Je_b_a = interface; //com.dothantech.h.d.b.e$b$a
  Je_b = interface; //com.dothantech.h.d.b.e$b
  Je_c = interface; //com.dothantech.h.d.b.e$c
  Je_216 = interface; //com.dothantech.h.d.b.e
  Jf_217 = interface; //com.dothantech.h.d.b.f
  Jd_218 = interface; //com.dothantech.h.d
  Je_219 = interface; //com.dothantech.h.e
  Jf_220 = interface; //com.dothantech.h.f
  Jg_221 = interface; //com.dothantech.h.g
  Ja_222 = interface; //com.dothantech.lpapi.a
  Jb_223 = interface; //com.dothantech.lpapi.b
  JIAtBitmap_BarcodeType1D = interface; //com.dothantech.lpapi.IAtBitmap$BarcodeType1D
  JIAtBitmap_DrawParamName = interface; //com.dothantech.lpapi.IAtBitmap$DrawParamName
  JIAtBitmap_ErrorCorrectionLevel = interface; //com.dothantech.lpapi.IAtBitmap$ErrorCorrectionLevel
  JIAtBitmap_Factory = interface; //com.dothantech.lpapi.IAtBitmap$Factory
  JIAtBitmap_FontStyle = interface; //com.dothantech.lpapi.IAtBitmap$FontStyle
  JIAtBitmap_ItemAlignment = interface; //com.dothantech.lpapi.IAtBitmap$ItemAlignment
  JIAtBitmap_LabelScaleUnit = interface; //com.dothantech.lpapi.IAtBitmap$LabelScaleUnit
  JIAtBitmap_PenAlignment = interface; //com.dothantech.lpapi.IAtBitmap$PenAlignment
  JIAtBitmap_ResultCode = interface; //com.dothantech.lpapi.IAtBitmap$ResultCode
  JIAtBitmap = interface; //com.dothantech.lpapi.IAtBitmap
  JLPAPI_1 = interface; //com.dothantech.lpapi.LPAPI$1
  JLPAPI_BarcodeType = interface; //com.dothantech.lpapi.LPAPI$BarcodeType
  JLPAPI_Callback = interface; //com.dothantech.lpapi.LPAPI$Callback
  JLPAPI_Factory = interface; //com.dothantech.lpapi.LPAPI$Factory
  JLPAPI_FontStyle = interface; //com.dothantech.lpapi.LPAPI$FontStyle
  JLPAPI_ItemAlignment = interface; //com.dothantech.lpapi.LPAPI$ItemAlignment
  JLPAPI_PenAlignment = interface; //com.dothantech.lpapi.LPAPI$PenAlignment
  JLPAPI_PrintParamName = interface; //com.dothantech.lpapi.LPAPI$PrintParamName
  JLPAPI_PrintParamValue = interface; //com.dothantech.lpapi.LPAPI$PrintParamValue
  JLPAPI = interface; //com.dothantech.lpapi.LPAPI
  Ja_244 = interface; //com.dothantech.printer.a
  Jaa_245 = interface; //com.dothantech.printer.aa
  Jab_246 = interface; //com.dothantech.printer.ab
  Jac_a = interface; //com.dothantech.printer.ac$a
  Jac_248 = interface; //com.dothantech.printer.ac
  Jb_249 = interface; //com.dothantech.printer.b
  Jc_250 = interface; //com.dothantech.printer.c
  Jd_251 = interface; //com.dothantech.printer.d
  JDzPrinter_a = interface; //com.dothantech.printer.DzPrinter$a
  JDzPrinter_b = interface; //com.dothantech.printer.DzPrinter$b
  JDzPrinter_c = interface; //com.dothantech.printer.DzPrinter$c
  JDzPrinter_d = interface; //com.dothantech.printer.DzPrinter$d
  JDzPrinter_e = interface; //com.dothantech.printer.DzPrinter$e
  JDzPrinter_f = interface; //com.dothantech.printer.DzPrinter$f
  JDzPrinter_g = interface; //com.dothantech.printer.DzPrinter$g
  JDzPrinter_h = interface; //com.dothantech.printer.DzPrinter$h
  JDzPrinter = interface; //com.dothantech.printer.DzPrinter
  Je_261 = interface; //com.dothantech.printer.e
  Jf_262 = interface; //com.dothantech.printer.f
  Jg_263 = interface; //com.dothantech.printer.g
  Jh_264 = interface; //com.dothantech.printer.h
  Ji_265 = interface; //com.dothantech.printer.i
  JIDzPrinter_1 = interface; //com.dothantech.printer.IDzPrinter$1
  JIDzPrinter_AddressType = interface; //com.dothantech.printer.IDzPrinter$AddressType
  JIDzPrinter_Factory = interface; //com.dothantech.printer.IDzPrinter$Factory
  JIDzPrinter_GeneralProgress = interface; //com.dothantech.printer.IDzPrinter$GeneralProgress
  JIDzPrinter_IActionCallback = interface; //com.dothantech.printer.IDzPrinter$IActionCallback
  JIDzPrinter_IActionWithResponseCallback = interface; //com.dothantech.printer.IDzPrinter$IActionWithResponseCallback
  JIDzPrinter_IDzPrinterCallback = interface; //com.dothantech.printer.IDzPrinter$IDzPrinterCallback
  JIDzPrinter_PrintData = interface; //com.dothantech.printer.IDzPrinter$PrintData
  JIDzPrinter_PrinterAddress = interface; //com.dothantech.printer.IDzPrinter$PrinterAddress
  JIDzPrinter_PrinterInfo = interface; //com.dothantech.printer.IDzPrinter$PrinterInfo
  JIDzPrinter_PrinterState = interface; //com.dothantech.printer.IDzPrinter$PrinterState
  JIDzPrinter_PrintFailReason = interface; //com.dothantech.printer.IDzPrinter$PrintFailReason
  JIDzPrinter_PrintParamName = interface; //com.dothantech.printer.IDzPrinter$PrintParamName
  JIDzPrinter_PrintParamValue = interface; //com.dothantech.printer.IDzPrinter$PrintParamValue
  JIDzPrinter_PrintProgress = interface; //com.dothantech.printer.IDzPrinter$PrintProgress
  JIDzPrinter_ProgressInfo = interface; //com.dothantech.printer.IDzPrinter$ProgressInfo
  JIDzPrinter = interface; //com.dothantech.printer.IDzPrinter
  JIDzPrinter2_DiscoveriedPrinter = interface; //com.dothantech.printer.IDzPrinter2$DiscoveriedPrinter
  JIDzPrinter2_IDzPrinterCallback2 = interface; //com.dothantech.printer.IDzPrinter2$IDzPrinterCallback2
  JIDzPrinter2_PrinterParam = interface; //com.dothantech.printer.IDzPrinter2$PrinterParam
  JIDzPrinter2_PrinterParamName = interface; //com.dothantech.printer.IDzPrinter2$PrinterParamName
  JIDzPrinter2 = interface; //com.dothantech.printer.IDzPrinter2
  Jj_288 = interface; //com.dothantech.printer.j
  Jk_289 = interface; //com.dothantech.printer.k
  Jl_290 = interface; //com.dothantech.printer.l
  Jm_291 = interface; //com.dothantech.printer.m
  Jn_292 = interface; //com.dothantech.printer.n
  Jo_293 = interface; //com.dothantech.printer.o
  Jp_294 = interface; //com.dothantech.printer.p
  Jq_295 = interface; //com.dothantech.printer.q
  Jr_296 = interface; //com.dothantech.printer.r
  Js_297 = interface; //com.dothantech.printer.s
  Jt_298 = interface; //com.dothantech.printer.t
  Ju_299 = interface; //com.dothantech.printer.u
  Jv_300 = interface; //com.dothantech.printer.v
  Jw_301 = interface; //com.dothantech.printer.w
  Jx_302 = interface; //com.dothantech.printer.x
  Jy_303 = interface; //com.dothantech.printer.y
  Jz_304 = interface; //com.dothantech.printer.z
  Ja_305 = interface; //com.dothantech.view.a
  Jb_306 = interface; //com.dothantech.view.b
  Jc_307 = interface; //com.dothantech.view.c
  Jd_308 = interface; //com.dothantech.view.d
  JDzWindow_1 = interface; //com.dothantech.view.DzWindow$1
  JDzWindow_ViewInfo = interface; //com.dothantech.view.DzWindow$ViewInfo
  JDzWindow_ViewInfoType = interface; //com.dothantech.view.DzWindow$ViewInfoType
  JDzWindow = interface; //com.dothantech.view.DzWindow

// ===== Forward SuperClasses declarations =====

  JcClass = interface; //com.dothantech.a.a.c
  JasClass = interface; //com.dothantech.common.as
  Ji_125Class = interface; //com.dothantech.data.i
  Ja_136Class = interface; //com.dothantech.f.a
  Jag_aClass = interface; //com.dothantech.common.ag$a
  Jw_bClass = interface; //com.dothantech.common.w$b
  Jh_123Class = interface; //com.dothantech.data.h
  Jh_aClass = interface; //com.dothantech.data.h$a
  Jd_133Class = interface; //com.dothantech.e.d
  Jf_135Class = interface; //com.dothantech.e.f
  Jc_138Class = interface; //com.dothantech.f.c
  Jf_146Class = interface; //com.dothantech.g.f
  Jk_174Class = interface; //com.dothantech.h.b.a.k
  Je_157Class = interface; //com.dothantech.h.a.e
  Jc_162Class = interface; //com.dothantech.h.b.a.c
  Jk_198Class = interface; //com.dothantech.h.c.k
  Jg_189Class = interface; //com.dothantech.h.c.g
  Jd_184Class = interface; //com.dothantech.h.c.d
  Jh_191Class = interface; //com.dothantech.h.c.h
  Jm_201Class = interface; //com.dothantech.h.c.m
  Jj_197Class = interface; //com.dothantech.h.c.j
  Jf_220Class = interface; //com.dothantech.h.f
  JIAtBitmap_BarcodeType1DClass = interface; //com.dothantech.lpapi.IAtBitmap$BarcodeType1D
  JDzPrinter_bClass = interface; //com.dothantech.printer.DzPrinter$b
  Jc_143Class = interface; //com.dothantech.g.c
  JawClass = interface; //com.dothantech.common.aw
  JIDzPrinter_PrinterAddressClass = interface; //com.dothantech.printer.IDzPrinter$PrinterAddress
  JrClass = interface; //com.dothantech.b.r
  Je_016Class = interface; //com.dothantech.b.e
  Ja_141Class = interface; //com.dothantech.g.a

// ===== Interface declarations =====

  JaClass = interface(JcClass) // or JObjectClass
  ['{EF175EAB-7795-472D-9783-1C5DCA7C1291}']
    { static Property Methods }

    { static Methods }
    {class} function init: Ja; cdecl; overload;
    {class} function init(P1: Ja; P2: JMap): Ja; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/a/a/a')]
  Ja = interface(Jc) // or JObject
  ['{9BC4CD7B-C338-4E85-8AF1-6C0E12B57EEA}']
    { Property Methods }

    { methods }
    function a(P1: JString; P2: Integer; P3: Integer): Je; cdecl;

    { Property }
  end;

  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

  JbClass = interface(JObjectClass)
  ['{9A58626C-162E-4096-9F7C-9980C2AFDBAE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/a/a/b')]
  Jb = interface(JObject)
  ['{E32C0CA8-230D-4494-AA1B-83C5EF9A03EB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

  Jc_aClass = interface(JObjectClass)
  ['{6897EF92-D50F-405C-95FC-BCB80AE3D6E2}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Ja; P2: JString): Jc_a; cdecl; overload;
    {class} function init(P1: Ja; P2: JString; P3: Boolean; P4: Boolean; P5: Boolean): Jc_a; cdecl; overload;
    {class} function init(P1: Ja; P2: JString; P3: Boolean; P4: Boolean; P5: Boolean; P6: Boolean): Jc_a; cdecl; overload;
    {class} function init(P1: Jc_a; P2: Ja): Jc_a; cdecl; overload;
    {class} function init(P1: Jc_a; P2: Boolean): Jc_a; cdecl; overload;
    {class} function init(P1: Jc_a; P2: JString; P3: Boolean): Jc_a; cdecl; overload;
    {class} function init(P1: Jc_a; P2: JString; P3: Boolean; P4: Boolean): Jc_a; cdecl; overload;
    {class} function a(P1: Integer; P2: Integer; P3: Boolean): Integer; cdecl; overload;
    {class} function a(P1: Char): Integer; cdecl; overload;
    {class} function a(P1: JMessage): JMessage; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/a/a/c$a')]
  Jc_a = interface(JObject)
  ['{B9855AAD-1C5C-4312-A447-A93DF1AF2C58}']
    { Property Methods }
    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property a: JString read _Geta write _Seta;
    property b: Boolean read _Getb write _Setb;
    property c: Boolean read _Getc write _Setc;
  end;

  TJc_a = class(TJavaGenericImport<Jc_aClass, Jc_a>) end;

  JcClass = interface(JObjectClass)
  ['{BD05E3C3-435C-4F77-A8ED-81068421BCED}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: Jb): JBitmap; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/a/a/c')]
  Jc = interface(JObject)
  ['{D8ADC092-C217-4900-BD40-D580A9D12094}']
    { Property Methods }

    { methods }
    function a(P1: JString; P2: Integer; P3: Integer): Je; cdecl; overload;

    { Property }
  end;

  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

  JdClass = interface(JcClass) // or JObjectClass
  ['{3DBEEDA8-CDF5-435C-A084-3D5B94800DE8}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jd; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/a/a/d')]
  Jd = interface(Jc) // or JObject
  ['{34CC60FF-7E33-452D-AEA1-7CF3137BBB8F}']
    { Property Methods }

    { methods }
    function a(P1: JString; P2: Integer; P3: Integer): Je; cdecl;

    { Property }
  end;

  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

  JeClass = interface(JObjectClass)
  ['{78D2A0DF-66E2-43FF-9091-B0740804E00C}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Jc_a; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Jb): Je; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/a/a/e')]
  Je = interface(JObject)
  ['{59CE3B77-4D20-404A-A989-934C2FF407AE}']
    { Property Methods }
    function _Geta: Jc_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: Jc_a);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: Jb);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property a: Jc_a read _Geta write _Seta;
    property b: Jb read _Getb write _Setb;
  end;

  TJe = class(TJavaGenericImport<JeClass, Je>) end;

  JfClass = interface(JcClass) // or JObjectClass
  ['{171B4D61-DC5B-4B20-88C4-F095EA177A25}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jf; cdecl; overload;
    {class} function init(P1: JMap): Jf; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/a/a/f')]
  Jf = interface(Jc) // or JObject
  ['{67D94B22-2FC4-4F37-A4AE-68DB85F56641}']
    { Property Methods }

    { methods }
    function a(P1: JString; P2: Integer; P3: Integer): Je; cdecl;

    { Property }
  end;

  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

  Ja_aClass = interface(JObjectClass)
  ['{48356D13-5D8D-4E7D-B6D0-A48B9D1CAF32}']
    { static Property Methods }

    { static Methods }
    {class} function init: Ja_a; cdecl;
    {class} function a(P1: JString): Ja_a; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/a$a')]
  Ja_a = interface(JObject)
  ['{BFC406B0-2162-4989-95E5-BB6E4FA99D22}']
    { Property Methods }
    function _Geta: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getd: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd(ad: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gete: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sete(ae: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getg: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setg(ag: Char);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geth: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seth(ah: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property a: Word read _Geta write _Seta;
    property b: Word read _Getb write _Setb;
    property c: Word read _Getc write _Setc;
    property d: Word read _Getd write _Setd;
    property e: Word read _Gete write _Sete;
    property f: JString read _Getf write _Setf;
    property g: Char read _Getg write _Setg;
    property h: Word read _Geth write _Seth;
  end;

  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

  Ja_008Class = interface(JObjectClass)
  ['{7F5E2A12-B2B5-4A55-983A-C35771301EBF}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/a')]
  Ja_008 = interface(JObject)
  ['{226D8115-D4B3-4633-9EAA-5FBCCFAA860C}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;

    { Property }
  end;

  TJa_008 = class(TJavaGenericImport<Ja_008Class, Ja_008>) end;

  Jb_aClass = interface(JObjectClass)
  ['{ED0A449A-C00C-4D69-85B8-181C20001AE1}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jb_a; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/b$a')]
  Jb_a = interface(JObject)
  ['{EE1FE4C2-D699-4D3E-B721-03BE83745E70}']
    { Property Methods }
    function _Geta: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setf(af: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function clone: JObject; cdecl;

    { Property }
    property a: Word read _Geta write _Seta;
    property b: Word read _Getb write _Setb;
    property c: JString read _Getc write _Setc;
    property d: Integer read _Getd write _Setd;
    property e: Integer read _Gete write _Sete;
    property f: Integer read _Getf write _Setf;
  end;

  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

  Jb_bClass = interface(JEnumClass) // or JObjectClass
  ['{362CE59A-A63F-440D-A222-A85BADA8F4C2}']
    { static Property Methods }
    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function a: TJavaArray<Integer>; cdecl;

    { static Property }
    {class} property a: Integer read _Geta;
    {class} property b: Integer read _Getb;
    {class} property c: Integer read _Getc;
    {class} property d: Integer read _Getd;
    {class} property e: Integer read _Gete;
  end;

  [JavaSignature('com/dothantech/b/b$b')]
  Jb_b = interface(JEnum) // or JObject
  ['{DCEC65FD-61FD-45BF-9E22-A0BEFD8C7E7A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJb_b = class(TJavaGenericImport<Jb_bClass, Jb_b>) end;

  Jb_cClass = interface(JObjectClass)
  ['{42CD0C9A-C893-4BC6-A091-AC5865DA67C1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/b$c')]
  Jb_c = interface(JObject)
  ['{EC569136-3A37-4272-B8CD-3E602C50ECC8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJb_c = class(TJavaGenericImport<Jb_cClass, Jb_c>) end;

  Jb_012Class = interface(JObjectClass)
  ['{C9A1321D-9225-47C4-B7D9-A8DE9F8858DD}']
    { static Property Methods }
    {class} function _Geta: JUUID;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: Jb_012; cdecl;
    {class} function a(P1: JBluetoothDevice; P2: JString): Boolean; cdecl; overload;
    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
    {class} function a(P1: JString; P2: Integer): JList; cdecl; overload;
    {class} function a: Boolean; cdecl; overload;
    {class} function a(P1: JString): JBluetoothDevice; cdecl; overload;
    {class} function a(P1: JBluetoothAdapter; P2: JString): JBluetoothDevice; cdecl; overload;
    {class} function b(P1: JString): JString; cdecl; overload;
    {class} function a(P1: JBluetoothDevice): JString; cdecl; overload;
    {class} function b(P1: JBluetoothDevice): JIDzPrinter_AddressType; cdecl; overload;
    {class} function c(P1: JBluetoothDevice): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function c(P1: JString): JBluetoothDevice; cdecl; overload;
    {class} function d(P1: JString): Integer; cdecl; overload;
    {class} function d(P1: JBluetoothDevice): Boolean; cdecl; overload;
    {class} function e(P1: JBluetoothDevice): Boolean; cdecl; overload;
    {class} function b(P1: JBluetoothDevice; P2: JString): Boolean; cdecl; overload;
    {class} procedure a(P1: JBluetoothSocket); cdecl; overload;
    {class} procedure b; cdecl; overload;
    {class} function e(P1: JString): JString; cdecl; overload;
    {class} function f(P1: JString): Integer; cdecl; overload;
    {class} function a(P1: JString; P2: Jb_a): Integer; cdecl; overload;
    {class} function f(P1: JBluetoothDevice): Boolean; cdecl; overload;
    {class} function g(P1: JString): Boolean; cdecl;
    {class} function h(P1: JString): JIDzPrinter_PrinterAddress; cdecl;

    { static Property }
    {class} property a: JUUID read _Geta;
  end;

  [JavaSignature('com/dothantech/b/b')]
  Jb_012 = interface(JObject)
  ['{29AE25EE-EDAF-44D6-805F-D8A5D4EF9F74}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJb_012 = class(TJavaGenericImport<Jb_012Class, Jb_012>) end;

  Jc_013Class = interface(JObjectClass)
  ['{E656590D-A2B8-4F25-91AE-0EF28E933084}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/c')]
  Jc_013 = interface(JObject)
  ['{A26210DD-B257-4A5C-9AAF-B6EDC6B66BAE}']
    { Property Methods }

    { methods }
    function compare(P1: JObject; P2: JObject): Integer; cdecl;

    { Property }
  end;

  TJc_013 = class(TJavaGenericImport<Jc_013Class, Jc_013>) end;

  Jd_014Class = interface(JObjectClass)
  ['{D45DB6BF-1027-469A-BBF9-3768BED68DDB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/d')]
  Jd_014 = interface(JObject)
  ['{5B084966-BB11-45FD-9C6E-B7AC16916F75}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJd_014 = class(TJavaGenericImport<Jd_014Class, Jd_014>) end;

  Je_aClass = interface(JBluetoothGattCallbackClass) // or JObjectClass
  ['{07D1596A-28A7-41E1-A191-E01925E6A15F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/e$a')]
  Je_a = interface(JBluetoothGattCallback) // or JObject
  ['{6E168C81-82A9-46D1-98CE-8119B67AB0B0}']
    { Property Methods }

    { methods }
    procedure onConnectionStateChange(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
    procedure onServicesDiscovered(P1: JBluetoothGatt; P2: Integer); cdecl;
    procedure onCharacteristicRead(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic; P3: Integer); cdecl;
    procedure onDescriptorWrite(P1: JBluetoothGatt; P2: JBluetoothGattDescriptor; P3: Integer); cdecl;
    procedure onMtuChanged(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
    procedure onReadRemoteRssi(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
    procedure onCharacteristicWrite(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic; P3: Integer); cdecl;
    procedure onCharacteristicChanged(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic); cdecl;

    { Property }
  end;

  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

  Je_016Class = interface(JasClass) // or JObjectClass
  ['{91E9B93E-6496-4622-8A68-BD8C9DE119AC}']
    { static Property Methods }
    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JContext): Je_016; cdecl;

    { static Property }
    {class} property a: Jw read _Geta;
  end;

  [JavaSignature('com/dothantech/b/e')]
  Je_016 = interface(Jas) // or JObject
  ['{8B2BCDE7-25DE-4E30-9D93-9F04C5DB3AB3}']
    { Property Methods }

    { methods }
    function a(P1: JBluetoothDevice): Boolean; cdecl; overload;
    procedure a; cdecl; overload;
    function b: JString; cdecl; overload;
    function a(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
    function b(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
    procedure a(P1: Ji_a); cdecl; overload;
    function c: Integer; cdecl;
    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): Boolean; cdecl; overload;
    function a(P1: Boolean): Boolean; cdecl; overload;
    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl; overload;

    { Property }
  end;

  TJe_016 = class(TJavaGenericImport<Je_016Class, Je_016>) end;

  Jf_017Class = interface(JObjectClass)
  ['{2BDFF6F9-6934-427C-B12F-C98E82A74054}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/f')]
  Jf_017 = interface(JObject)
  ['{B29F30D3-1D30-4BEC-894B-2EAC2EE7C45F}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJf_017 = class(TJavaGenericImport<Jf_017Class, Jf_017>) end;

  JgClass = interface(JObjectClass)
  ['{5ACA1688-C65D-43FB-96C3-F2BAEF28BEAF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/g')]
  Jg = interface(JObject)
  ['{E980D229-38BC-4372-BCD0-D2005C8D2080}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

  JhClass = interface(Ji_125Class) // or JObjectClass
  ['{205A0137-C497-4C3B-AD14-9371346154F8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/h')]
  Jh = interface(Ji_125) // or JObject
  ['{1ABD4356-185B-45DF-9437-959C9BA821BB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJh = class(TJavaGenericImport<JhClass, Jh>) end;

  JiClass = interface(JObjectClass)
  ['{23A83626-9915-4E61-9E89-2BBD6E78A4D2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/i')]
  Ji = interface(JObject)
  ['{B4B70F92-9BCA-4159-9372-361909C16B0C}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJi = class(TJavaGenericImport<JiClass, Ji>) end;

  JjClass = interface(JObjectClass)
  ['{BE629A2C-1E86-4B87-A2E9-D7441ED84B8A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/j')]
  Jj = interface(JObject)
  ['{B6344D89-BEC4-441D-9BEF-D7B59580C44C}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJj = class(TJavaGenericImport<JjClass, Jj>) end;

  JkClass = interface(JObjectClass)
  ['{BD2F92BF-31F1-4EF8-BFDA-927B409401D1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/k')]
  Jk = interface(JObject)
  ['{5C70F27F-722A-41D5-83F6-18C57FC52C54}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJk = class(TJavaGenericImport<JkClass, Jk>) end;

  JlClass = interface(JObjectClass)
  ['{6DCFDFE9-3187-42CA-AE87-2D87357CDD83}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/l')]
  Jl = interface(JObject)
  ['{7E6109A1-70E0-4996-BF70-999B29EB3C2B}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJl = class(TJavaGenericImport<JlClass, Jl>) end;

  JmClass = interface(JObjectClass)
  ['{9160D8BC-49E4-411B-8B53-81E3F7A5BDBC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/m')]
  Jm = interface(JObject)
  ['{41372504-5587-4DA8-B140-8D2B84F272F8}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJm = class(TJavaGenericImport<JmClass, Jm>) end;

  JnClass = interface(JObjectClass)
  ['{355AEEE0-19FC-477B-B521-B509AAC9465F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/n')]
  Jn = interface(JObject)
  ['{9D220B95-3B62-463C-8CE0-1A49EDBD5D35}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJn = class(TJavaGenericImport<JnClass, Jn>) end;

  JoClass = interface(JObjectClass)
  ['{E0FF55A6-E48A-40FA-89DA-5A81E9C39C83}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/o')]
  Jo = interface(JObject)
  ['{B4C8B1D7-3C59-4BAD-9FAC-A9F8A8013C0A}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJo = class(TJavaGenericImport<JoClass, Jo>) end;

  JpClass = interface(JObjectClass)
  ['{9CFAD2D7-28F9-47AE-ACAB-E609D50BDC40}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/p')]
  Jp = interface(JObject)
  ['{913727ED-062F-4F00-BD03-58B76E7A341D}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJp = class(TJavaGenericImport<JpClass, Jp>) end;

  JqClass = interface(JObjectClass)
  ['{EA68720D-0689-4A33-B544-FE30E362C992}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/q')]
  Jq = interface(JObject)
  ['{694E58B9-32E2-4CA1-8B12-97E79A52233C}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJq = class(TJavaGenericImport<JqClass, Jq>) end;

  JrClass = interface(JObjectClass)
  ['{502450B7-6A86-4383-BE64-EE6840822BC5}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBluetoothSocket): Jr; cdecl;
    {class} function a(P1: Integer; P2: Boolean): Boolean; cdecl; overload;
    {class} function a(P1: Integer; P2: JString): JString; cdecl; overload;
    {class} function a(P1: Integer; P2: Integer): Integer; cdecl; overload;
    {class} function a(P1: JString): JString; cdecl; overload;
    {class} function a(P1: JContext; P2: JBroadcastReceiver; P3: JIntentFilter): JIntent; cdecl; overload;
    {class} procedure a(P1: JContext; P2: JBroadcastReceiver); cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/r')]
  Jr = interface(JObject)
  ['{C0309B1A-1BC2-4DB7-8AFA-58D8CDAC3E1B}']
    { Property Methods }

    { methods }
    function b: JString; cdecl; overload;
    function a(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
    function b(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
    procedure a(P1: Ji_a); cdecl; overload;
    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): Boolean; cdecl; overload;
    procedure a; cdecl; overload;

    { Property }
  end;

  TJr = class(TJavaGenericImport<JrClass, Jr>) end;

  JsClass = interface(Ja_136Class) // or JObjectClass
  ['{5A7891A1-2417-4026-8C89-21BE80997455}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/s')]
  Js = interface(Ja_136) // or JObject
  ['{7E7D221B-3827-4472-94A3-A4BAF1EEE808}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJs = class(TJavaGenericImport<JsClass, Js>) end;

  JtClass = interface(JObjectClass)
  ['{A114D6C2-B111-45AE-BD4F-37EEC3EFD477}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JString; P2: Jb_a): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/b/t')]
  Jt = interface(JObject)
  ['{A4509E0B-F964-4BEF-91B1-546DCD278063}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJt = class(TJavaGenericImport<JtClass, Jt>) end;

  Ja_032Class = interface(JObjectClass)
  ['{89D6D381-E27F-48AE-A8C9-81CB2AF2C44C}']
    { static Property Methods }
    {class} function _Getb: Jw_g;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} procedure a; cdecl; overload;
    {class} procedure b; cdecl;
    {class} procedure c; cdecl;
    {class} function init(P1: Integer; P2: Integer): Ja_032; cdecl;

    { static Property }
    {class} property b: Jw_g read _Getb;
  end;

  [JavaSignature('com/dothantech/c/a')]
  Ja_032 = interface(JObject)
  ['{51D61990-3E9C-46D0-B8E7-750DC39E49C8}']
    { Property Methods }

    { methods }
    function d: Integer; cdecl;
    function e: Integer; cdecl;
    function a(P1: Integer; P2: Integer): Byte; cdecl; overload;
    function f: TJavaArray<TJavaArray<Byte>>; cdecl;
    procedure a(P1: Integer; P2: Integer; P3: Integer); cdecl; overload;
    procedure a(P1: Integer; P2: Integer; P3: Boolean); cdecl; overload;
    procedure a(P1: Byte); cdecl; overload;
    function toString: JString; cdecl;

    { Property }
  end;

  TJa_032 = class(TJavaGenericImport<Ja_032Class, Ja_032>) end;

  Jb_033Class = interface(JObjectClass)
  ['{FD0E6D16-DED8-4B84-8FA9-8241E8952457}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/c/b')]
  Jb_033 = interface(JObject)
  ['{9D6526E4-05AC-4174-938D-A96110EDD4E4}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJb_033 = class(TJavaGenericImport<Jb_033Class, Jb_033>) end;

  Jc_034Class = interface(JTypeReferenceClass) // or JObjectClass
  ['{5A59E4B5-D57F-4D5E-A871-793A1B056378}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/c/c')]
  Jc_034 = interface(JTypeReference) // or JObject
  ['{F0CD7F80-E05D-4DF5-B52A-CB9443FD2F8D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJc_034 = class(TJavaGenericImport<Jc_034Class, Jc_034>) end;

  Ja_a_035Class = interface(JEnumClass) // or JObjectClass
  ['{0FB8E467-63D6-47AC-82F3-86B63C3E741F}']
    { static Property Methods }
    {class} function _Geta: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<Ja_a>; cdecl;
    {class} function valueOf(P1: JString): Ja_a; cdecl;
    {class} function a(P1: JLocale): Ja_a; cdecl; overload;
    {class} function b(P1: JLocale): Boolean; cdecl;
    {class} function a(P1: JLocale; P2: JLocale): Boolean; cdecl; overload;

    { static Property }
    {class} property a: Ja_a read _Geta;
    {class} property b: Ja_a read _Getb;
    {class} property c: Ja_a read _Getc;
  end;

  [JavaSignature('com/dothantech/common/a$a')]
  Ja_a_035 = interface(JEnum) // or JObject
  ['{6A2BE429-85B9-4786-94A6-E921AE72DBB2}']
    { Property Methods }
    function _Getd: JLocale;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd(ad: JLocale);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property d: JLocale read _Getd write _Setd;
    property e: JString read _Gete write _Sete;
  end;

  TJa_a_035 = class(TJavaGenericImport<Ja_a_035Class, Ja_a_035>) end;

  Ja_bClass = interface(JEnumClass) // or JObjectClass
  ['{F61E88BE-02A7-4FC5-B3A4-6A2030EE0137}']
    { static Property Methods }
    {class} function _Geta: Ja_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Ja_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Ja_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<Ja_b>; cdecl;
    {class} function valueOf(P1: JString): Ja_b; cdecl;

    { static Property }
    {class} property a: Ja_b read _Geta;
    {class} property b: Ja_b read _Getb;
    {class} property c: Ja_b read _Getc;
  end;

  [JavaSignature('com/dothantech/common/a$b')]
  Ja_b = interface(JEnum) // or JObject
  ['{B8906718-B010-4E7D-8E05-435B2FC34695}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJa_b = class(TJavaGenericImport<Ja_bClass, Ja_b>) end;

  Ja_037Class = interface(JApplicationClass) // or JObjectClass
  ['{1FC8784D-7C9F-4901-BE60-BEB7125D22FA}']
    { static Property Methods }
    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function a: JApplication; cdecl; overload;
    {class} function b: JContext; cdecl; overload;
    {class} function a(P1: Boolean): JString; cdecl; overload;
    {class} function c: JPackageInfo; cdecl; overload;
    {class} function b(P1: Boolean): JString; cdecl; overload;
    {class} function d: Boolean; cdecl;
    {class} function e: Ja_b; cdecl;
    {class} function f: Boolean; cdecl;
    {class} function g: Boolean; cdecl;
    {class} procedure a(P1: Int64); cdecl; overload;
    {class} function h: Boolean; cdecl;
    {class} function a(P1: JString): JString; cdecl; overload;
    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
    {class} function b(P1: JString): Boolean; cdecl; overload;
    {class} procedure a(P1: JHandler); cdecl; overload;
    {class} procedure i; cdecl;
    {class} procedure b(P1: Int64); cdecl; overload;
    {class} function j: Ja_b; cdecl;
    {class} function k: TJavaObjectArray<Ja_a>; cdecl;
    {class} function a(P1: JLocale; P2: JLocale): Boolean; cdecl; overload;
    {class} function b(P1: JLocale; P2: JLocale): Boolean; cdecl; overload;
    {class} function c(P1: JLocale; P2: JLocale): Boolean; cdecl; overload;
    {class} function l: JLocale; cdecl;
    {class} function m: JString; cdecl;
    {class} procedure n; cdecl;

    { static Property }
    {class} property a: Jw read _Geta;
    {class} property b: Jf read _Getb;
    {class} property c: JObject read _Getc;
  end;

  [JavaSignature('com/dothantech/common/a')]
  Ja_037 = interface(JApplication) // or JObject
  ['{2F58ADAD-BE1B-4E89-A2D1-3CC6E6FF73E3}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    procedure onLowMemory; cdecl;
    procedure onConfigurationChanged(P1: JConfiguration); cdecl;
    procedure onTerminate; cdecl;

    { Property }
  end;

  TJa_037 = class(TJavaGenericImport<Ja_037Class, Ja_037>) end;

  Jaa_aClass = interface(JObjectClass)
  ['{E500D57B-C53B-4637-B604-FFDEDEB2E5EE}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JContext): Jaa_a; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/aa$a')]
  Jaa_a = interface(JObject)
  ['{7A9E3655-52A1-495B-89BE-435559383126}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJaa_a = class(TJavaGenericImport<Jaa_aClass, Jaa_a>) end;

  JaaClass = interface(JObjectClass)
  ['{98CDCFC8-424F-4D98-A969-D4279807B2E9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/aa')]
  Jaa = interface(IJavaInstance)
  ['{F6375F3E-FB23-4753-8732-B3902EE3B9D4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJaa = class(TJavaGenericImport<JaaClass, Jaa>) end;

  JabClass = interface(JObjectClass)
  ['{A6391D2E-98F8-4C85-A2CF-E015B45B0ED4}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JCharSequence): Boolean; cdecl; overload;
    {class} function a(P1: JCharSequence; P2: JCharSequence): Boolean; cdecl; overload;
    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
    {class} function b(P1: JString; P2: JString): Integer; cdecl; overload;
    {class} function c(P1: JString; P2: JString): Integer; cdecl; overload;
    {class} function d(P1: JString; P2: JString): Boolean; cdecl; overload;
    {class} function a(P1: JString): JString; cdecl; overload;
    {class} function a(P1: JString; P2: Integer; P3: Integer): JString; cdecl; overload;
    {class} function a(P1: JString; P2: Integer): JString; cdecl; overload;
    {class} function b(P1: JString): JString; cdecl; overload;
    {class} function c(P1: JString): JString; cdecl; overload;
    {class} function d(P1: JString): JString; cdecl; overload;
    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
    {class} function a(P1: TJavaArray<Byte>; P2: Ju; P3: Integer; P4: JString): JString; cdecl; overload;
    {class} function e(P1: JString): Boolean; cdecl; overload;
    {class} function b(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function a(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl; overload;
    {class} function e(P1: JString; P2: JString): Integer; cdecl; overload;
    {class} function f(P1: JString): TJavaObjectArray<JString>; cdecl; overload;
    {class} function a(P1: JString; P2: Char): TJavaObjectArray<JString>; cdecl; overload;
    {class} function a(P1: Char; P2: Integer): JString; cdecl; overload;
    {class} function f(P1: JString; P2: JString): Integer; cdecl; overload;
    {class} function a(P1: JString; P2: Jab; P3: Jab): Boolean; cdecl; overload;
    {class} function init: Jab; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ab')]
  Jab = interface(JObject)
  ['{AB180D98-6CC2-4CE1-916D-4C8F585571B4}']
    { Property Methods }
    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function toString: JString; cdecl;
    function hashCode: Integer; cdecl;
    function equals(P1: JObject): Boolean; cdecl;

    { Property }
    property a: JString read _Geta write _Seta;
  end;

  TJab = class(TJavaGenericImport<JabClass, Jab>) end;

  JacClass = interface(JObjectClass)
  ['{1F485557-29B9-48D5-ABC2-45C9DDEBE734}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ac')]
  Jac = interface(JObject)
  ['{73E0CA86-1D88-4F13-A710-66983BF46A1A}']
    { Property Methods }

    { methods }
    function compare(P1: JObject; P2: JObject): Integer; cdecl;

    { Property }
  end;

  TJac = class(TJavaGenericImport<JacClass, Jac>) end;

  JadClass = interface(JObjectClass)
  ['{A2B65F43-942A-4782-90A9-B80286F9E455}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ad')]
  Jad = interface(JObject)
  ['{1233895D-7AD2-4D03-B6FA-28D8286FA217}']
    { Property Methods }

    { methods }
    function compare(P1: JObject; P2: JObject): Integer; cdecl;

    { Property }
  end;

  TJad = class(TJavaGenericImport<JadClass, Jad>) end;

  JaeClass = interface(JObjectClass)
  ['{B10E6C10-521E-4CFF-A95C-54791145516A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ae')]
  Jae = interface(JObject)
  ['{C8C039D5-C149-4B8B-82C6-97C276FA14A0}']
    { Property Methods }

    { methods }
    function compare(P1: JObject; P2: JObject): Integer; cdecl;

    { Property }
  end;

  TJae = class(TJavaGenericImport<JaeClass, Jae>) end;

  JafClass = interface(JObjectClass)
  ['{F89DEB77-2449-4A07-9349-F948D1E0C299}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/af')]
  Jaf = interface(JObject)
  ['{3C26ADB3-B164-4760-8EA6-8CF3DD530892}']
    { Property Methods }

    { methods }
    function compare(P1: JObject; P2: JObject): Integer; cdecl;

    { Property }
  end;

  TJaf = class(TJavaGenericImport<JafClass, Jaf>) end;

  Jag_aClass = interface(JEnumClass) // or JObjectClass
  ['{BD0CC5ED-9D3E-4409-8C35-091FBD7C0F3C}']
    { static Property Methods }
    {class} function _Geta: Jag_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Jag_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<Jag_a>; cdecl;
    {class} function valueOf(P1: JString): Jag_a; cdecl;

    { static Property }
    {class} property a: Jag_a read _Geta;
    {class} property b: Jag_a read _Getb;
  end;

  [JavaSignature('com/dothantech/common/ag$a')]
  Jag_a = interface(JEnum) // or JObject
  ['{E04CC90E-A4B2-42FC-AD66-24B0A78EBC70}']
    { Property Methods }
    function _Getc: JSimpleDateFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JSimpleDateFormat);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function toString: JString; cdecl;

    { Property }
    property c: JSimpleDateFormat read _Getc write _Setc;
  end;

  TJag_a = class(TJavaGenericImport<Jag_aClass, Jag_a>) end;

  JagClass = interface(JObjectClass)
  ['{4149918C-AB5D-444C-BF9D-12CD037FA3DA}']
    { static Property Methods }

    { static Methods }
    {class} function a: JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ag')]
  Jag = interface(JObject)
  ['{D7BA6599-5BDA-4282-AF53-846DF3C4A62E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJag = class(TJavaGenericImport<JagClass, Jag>) end;

  JahClass = interface(Jag_aClass) // or JObjectClass
  ['{E41FF5AF-EF11-4508-9D1C-3BB7D14BA374}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ah')]
  Jah = interface(Jag_a) // or JObject
  ['{61DE113C-65FE-47B0-979E-AAB0AAEFDF17}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJah = class(TJavaGenericImport<JahClass, Jah>) end;

  JaiClass = interface(Jag_aClass) // or JObjectClass
  ['{85AA1586-53CE-426A-A00D-3362430A6413}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ai')]
  Jai = interface(Jag_a) // or JObject
  ['{99337CE7-F137-4731-9D54-EDC2460D1DAD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJai = class(TJavaGenericImport<JaiClass, Jai>) end;

  JajClass = interface(Jag_aClass) // or JObjectClass
  ['{D1801230-615B-4E81-8E4F-FBF0E678AB0E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/aj')]
  Jaj = interface(Jag_a) // or JObject
  ['{5A490557-31D5-4A7E-91E1-C8885FD00E96}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJaj = class(TJavaGenericImport<JajClass, Jaj>) end;

  JakClass = interface(Jag_aClass) // or JObjectClass
  ['{324BC439-EA90-4BE4-A700-F986A87F9BD4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ak')]
  Jak = interface(Jag_a) // or JObject
  ['{45FB38E2-8740-49C4-8694-613347575BED}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJak = class(TJavaGenericImport<JakClass, Jak>) end;

  JalClass = interface(Jag_aClass) // or JObjectClass
  ['{F01F24AC-40D0-4C18-BB00-BDC1360D14C8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/al')]
  Jal = interface(Jag_a) // or JObject
  ['{EB6931E7-C12F-4F02-B423-D2E06E56F870}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJal = class(TJavaGenericImport<JalClass, Jal>) end;

  JamClass = interface(Jag_aClass) // or JObjectClass
  ['{A00DAF2E-E219-4B35-9262-4D4FC571EE97}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/am')]
  Jam = interface(Jag_a) // or JObject
  ['{B070ADB5-8F40-48DA-AF76-34A601AFEBDF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJam = class(TJavaGenericImport<JamClass, Jam>) end;

  JanClass = interface(Jag_aClass) // or JObjectClass
  ['{687C4DE0-5B8E-4ED3-B445-6AD7688285D3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/an')]
  Jan = interface(Jag_a) // or JObject
  ['{071051D8-0EE7-4C52-87D3-061169D081AA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJan = class(TJavaGenericImport<JanClass, Jan>) end;

  Jao_aClass = interface(JObjectClass)
  ['{6917275B-3933-4A16-A25C-483096A58DAA}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JToast): Jao_a; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ao$a')]
  Jao_a = interface(JObject)
  ['{9BF953BA-7D29-4D61-992F-ABBEA88E7C1A}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJao_a = class(TJavaGenericImport<Jao_aClass, Jao_a>) end;

  JaoClass = interface(JObjectClass)
  ['{7D1DC51C-5A07-4C57-B896-A263EDCD0878}']
    { static Property Methods }
    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: Jao; cdecl;
    {class} procedure a(P1: JCharSequence); cdecl; overload;
    {class} procedure a(P1: JToast; P2: JObject); cdecl; overload;
    {class} function a(P1: JContext; P2: JCharSequence; P3: Integer): JToast; cdecl; overload;

    { static Property }
    {class} property a: Jw read _Geta;
  end;

  [JavaSignature('com/dothantech/common/ao')]
  Jao = interface(JObject)
  ['{937B78C5-DD6C-471A-9D09-32537210CC93}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJao = class(TJavaGenericImport<JaoClass, Jao>) end;

  JapClass = interface(JObjectClass)
  ['{300ADE0B-F24A-4D96-B64E-B355497B4491}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ap')]
  Jap = interface(JObject)
  ['{E0BD4991-98E2-4D84-9F77-56E5F528F584}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJap = class(TJavaGenericImport<JapClass, Jap>) end;

  JaqClass = interface(JObjectClass)
  ['{E175CF8E-7C30-4EE6-9260-D883DA89F5EB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/aq')]
  Jaq = interface(JObject)
  ['{DE6EEC8E-50BA-404E-AC72-F98E179E8A7F}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJaq = class(TJavaGenericImport<JaqClass, Jaq>) end;

  JarClass = interface(JObjectClass)
  ['{16E61B51-AC1A-477E-A763-D86748C6F909}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ar')]
  Jar = interface(JObject)
  ['{B1818336-6289-4BFF-BC32-0E2A86737E44}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJar = class(TJavaGenericImport<JarClass, Jar>) end;

  JasClass = interface(JObjectClass)
  ['{AB81088C-706E-47D4-9E6A-C4BDDA22EC44}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString): Jas; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/as')]
  Jas = interface(JObject)
  ['{F135B019-FBAB-4896-96D8-07017DC13BFF}']
    { Property Methods }
    function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setg(ag: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl; overload;
    procedure a(P1: Integer); cdecl; overload;
    procedure a(P1: Integer; P2: Integer); cdecl; overload;
    procedure a(P1: Integer; P2: Integer; P3: JObject); cdecl; overload;
    function b(P1: Integer; P2: Integer): Integer; cdecl; overload;
    function a(P1: Integer; P2: JObject): Integer; cdecl; overload;
    function b(P1: Integer; P2: Integer; P3: JObject): Integer; cdecl; overload;
    function c(P1: Integer; P2: Integer; P3: JObject): Boolean; cdecl; overload;
    function a(P1: JRunnable): Boolean; cdecl; overload;
    function b(P1: Integer): Boolean; cdecl; overload;
    procedure a(P1: Int64); cdecl; overload;
    procedure b(P1: Int64); cdecl; overload;
    procedure c(P1: Int64); cdecl; overload;
    procedure d(P1: Int64); cdecl; overload;
    procedure d; cdecl; overload;
    procedure e; cdecl;
    procedure f; cdecl;
    procedure g; cdecl;
    function h: Boolean; cdecl;
    function i: Boolean; cdecl;
    procedure j; cdecl;

    { Property }
    property g: Integer read _Getg write _Setg;
  end;

  TJas = class(TJavaGenericImport<JasClass, Jas>) end;

  JatClass = interface(JObjectClass)
  ['{E63147F5-98DA-4DA0-9CA0-4BB347F83D00}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/at')]
  Jat = interface(JObject)
  ['{D9261319-B170-4565-A044-39CF7F131EB0}']
    { Property Methods }

    { methods }
    function handleMessage(P1: JMessage): Boolean; cdecl;

    { Property }
  end;

  TJat = class(TJavaGenericImport<JatClass, Jat>) end;

  Jau_aClass = interface(JObjectClass)
  ['{60A55F94-D58A-455B-B372-7E45F5BB98BF}']
    { static Property Methods }
    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geti: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getq: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getr: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gets: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gett: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getv: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getw: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gety: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getz: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property a: Integer read _Geta;
    {class} property b: Integer read _Getb;
    {class} property c: Integer read _Getc;
    {class} property d: Integer read _Getd;
    {class} property e: Integer read _Gete;
    {class} property f: Integer read _Getf;
    {class} property g: Integer read _Getg;
    {class} property h: Integer read _Geth;
    {class} property i: Integer read _Geti;
    {class} property j: Integer read _Getj;
    {class} property k: Integer read _Getk;
    {class} property l: Integer read _Getl;
    {class} property m: Integer read _Getm;
    {class} property n: Integer read _Getn;
    {class} property o: Integer read _Geto;
    {class} property p: Integer read _Getp;
    {class} property q: Integer read _Getq;
    {class} property r: Integer read _Getr;
    {class} property s: Integer read _Gets;
    {class} property t: Integer read _Gett;
    {class} property u: Integer read _Getu;
    {class} property v: Integer read _Getv;
    {class} property w: Integer read _Getw;
    {class} property x: Integer read _Getx;
    {class} property y: Integer read _Gety;
    {class} property z: Integer read _Getz;
    {class} property A: Integer read _GetA;
    {class} property B: Integer read _GetB;
    {class} property C: Integer read _GetC;
    {class} property D: Integer read _GetD;
    {class} property E: Integer read _GetE;
    {class} property F: Integer read _GetF;
  end;

  [JavaSignature('com/dothantech/common/au$a')]
  Jau_a = interface(JObject)
  ['{4612A4F5-EC66-4E8D-8126-EEE8159E0AAA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJau_a = class(TJavaGenericImport<Jau_aClass, Jau_a>) end;

  JauClass = interface(JObjectClass)
  ['{295275E7-52EA-4DE2-9F3A-7B4D76D5E843}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JCharSequence; P2: Integer; P3: Integer): Jau; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/au')]
  Jau = interface(JObject)
  ['{4A03D747-44BD-4E52-9D8E-79185D8F55BE}']
    { Property Methods }

    { methods }
    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
    procedure a; cdecl; overload;

    { Property }
  end;

  TJau = class(TJavaGenericImport<JauClass, Jau>) end;

  JavClass = interface(JObjectClass)
  ['{48A1935F-2DA1-4DD2-BB0D-7D2D96B5BD16}']
    { static Property Methods }

    { static Methods }
    {class} function a: Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/av')]
  Jav = interface(JObject)
  ['{C3B40F79-AA5B-4F28-BD9A-5F2CDB650515}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJav = class(TJavaGenericImport<JavClass, Jav>) end;

  JawClass = interface(JObjectClass)
  ['{4EB9E4B7-463C-4E99-9687-3C198B2FB9CC}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jaw; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/aw')]
  Jaw = interface(JObject)
  ['{2E2528D9-3B2B-4CCE-891D-E79D7F0D4D77}']
    { Property Methods }

    { methods }
    function a(P1: Integer): Boolean; cdecl; overload;
    function a: Boolean; cdecl; overload;
    function a(P1: JMessage): Boolean; cdecl; overload;
    function b(P1: Integer): Boolean; cdecl; overload;
    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
    function a(P1: Integer; P2: JObject): Boolean; cdecl; overload;
    function a(P1: Integer; P2: Integer; P3: JObject): Boolean; cdecl; overload;
    function a(P1: JRunnable): Boolean; cdecl; overload;
    function a(P1: JRunnable; P2: Int64): Boolean; cdecl; overload;
    procedure b; cdecl; overload;
    procedure b(P1: JRunnable); cdecl; overload;
    procedure quit; cdecl;
    procedure run; cdecl;

    { Property }
  end;

  TJaw = class(TJavaGenericImport<JawClass, Jaw>) end;

  JaxClass = interface(JObjectClass)
  ['{101818D7-55F8-4A16-AFB4-4A3130EDFC88}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ax')]
  Jax = interface(JObject)
  ['{37A81CA8-08B7-45D4-B748-836F51F15116}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJax = class(TJavaGenericImport<JaxClass, Jax>) end;

  JayClass = interface(JObjectClass)
  ['{72016A3A-70AB-44A8-A658-5B95081E3136}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/ay')]
  Jay = interface(JObject)
  ['{279B2465-1EC6-43B5-B8C1-115F2C35A6C2}']
    { Property Methods }

    { methods }
    function handleMessage(P1: JMessage): Boolean; cdecl;

    { Property }
  end;

  TJay = class(TJavaGenericImport<JayClass, Jay>) end;

  Jb_067Class = interface(JObjectClass)
  ['{ECE3796F-9691-4B3F-9F52-FB7E0119DC2C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/b')]
  Jb_067 = interface(JObject)
  ['{6431089A-BDC1-4B5E-98B3-B780B23180A2}']
    { Property Methods }

    { methods }
    procedure onActivityCreated(P1: JActivity; P2: JBundle); cdecl;
    procedure onActivityStarted(P1: JActivity); cdecl;
    procedure onActivityResumed(P1: JActivity); cdecl;
    procedure onActivityPaused(P1: JActivity); cdecl;
    procedure onActivityStopped(P1: JActivity); cdecl;
    procedure onActivitySaveInstanceState(P1: JActivity; P2: JBundle); cdecl;
    procedure onActivityDestroyed(P1: JActivity); cdecl;

    { Property }
  end;

  TJb_067 = class(TJavaGenericImport<Jb_067Class, Jb_067>) end;

  Jc_068Class = interface(JBroadcastReceiverClass) // or JObjectClass
  ['{BF9C1A33-323C-4741-AA78-29726FC78E05}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/c')]
  Jc_068 = interface(JBroadcastReceiver) // or JObject
  ['{599A0659-F5DC-4EA5-B038-3B1740596157}']
    { Property Methods }

    { methods }
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;

    { Property }
  end;

  TJc_068 = class(TJavaGenericImport<Jc_068Class, Jc_068>) end;

  Jd_069Class = interface(JObjectClass)
  ['{0DAAD4A6-22BB-4E81-AF5C-A27C193F6405}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/d')]
  Jd_069 = interface(JObject)
  ['{F950EBDD-9106-4FE7-B5E4-06D30AB36B47}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJd_069 = class(TJavaGenericImport<Jd_069Class, Jd_069>) end;

  JDzSystemClass = interface(JObjectClass)
  ['{FEA0F5A8-F94A-406A-B3C5-DBB9CC78A6B2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDzSystem; cdecl;
    {class} function getSystemID: JString; cdecl;
    {class} function getSystemVersion: Integer; cdecl;
    {class} function getSystemModel: JString; cdecl;
    {class} function getSystemDevice: JString; cdecl;
    {class} function getSystemProduct: JString; cdecl;
    {class} function getSystemManufacturer: JString; cdecl;
    {class} function getSystemHardware: JString; cdecl;
    {class} function getSystemFingerprint: JString; cdecl;
    {class} function getSystemBrand: JString; cdecl;
    {class} function getSystemBoard: JString; cdecl;
    {class} function getSystemDisplay: JString; cdecl;
    {class} function getSystemBootloader: JString; cdecl;
    {class} function getSystemSerial: JString; cdecl;
    {class} function getSystemType: JString; cdecl;
    {class} function getSystemTags: JString; cdecl;
    {class} function getSystemHost: JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/DzSystem')]
  JDzSystem = interface(JObject)
  ['{03F02A12-F803-4502-A371-1FF9485A6D02}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzSystem = class(TJavaGenericImport<JDzSystemClass, JDzSystem>) end;

  Je_071Class = interface(JArrayListClass) // or JObjectClass
  ['{0126F26B-2E71-4246-8EAF-E5C48A1AF4CF}']
    { static Property Methods }

    { static Methods }
    {class} function init: Je_071; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/e')]
  Je_071 = interface(JArrayList) // or JObject
  ['{7F212689-50E0-4487-9878-2FA147D18F3B}']
    { Property Methods }

    { methods }
    procedure sort(P1: JComparator); cdecl;

    { Property }
  end;

  TJe_071 = class(TJavaGenericImport<Je_071Class, Je_071>) end;

  Jf_aClass = interface(JEnumClass) // or JObjectClass
  ['{592DF457-8637-4A71-B714-F642523A568F}']
    { static Property Methods }
    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function a: TJavaArray<Integer>; cdecl;

    { static Property }
    {class} property a: Integer read _Geta;
    {class} property b: Integer read _Getb;
    {class} property c: Integer read _Getc;
  end;

  [JavaSignature('com/dothantech/common/f$a')]
  Jf_a = interface(JEnum) // or JObject
  ['{E1F615A8-E68A-4348-98D4-9CA159A10603}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJf_a = class(TJavaGenericImport<Jf_aClass, Jf_a>) end;

  Jf_073Class = interface(JObjectClass)
  ['{FC65814F-4F67-4C75-9307-7DC1FC198036}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function a(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl; overload;
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): JString; cdecl; overload;
    {class} procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>); cdecl; overload;
    {class} procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: Integer); cdecl; overload;
    {class} procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: Byte); cdecl; overload;
    {class} function a(P1: TJavaObjectArray<JString>; P2: JString): Boolean; cdecl; overload;
    {class} function a(P1: TJavaObjectArray<JObject>): Boolean; cdecl; overload;
    {class} function init: Jf_073; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/f')]
  Jf_073 = interface(JObject)
  ['{5107D4BD-5C4C-4A39-BCDB-D7D7716039DF}']
    { Property Methods }

    { methods }
    procedure a(P1: JHandler); cdecl; overload;
    procedure b(P1: JHandler); cdecl;
    function a(P1: JMessage): Boolean; cdecl; overload;
    function a(P1: Integer): Boolean; cdecl; overload;
    function a(P1: Integer; P2: JObject): Boolean; cdecl; overload;
    function toString: JString; cdecl;

    { Property }
  end;

  TJf_073 = class(TJavaGenericImport<Jf_073Class, Jf_073>) end;

  Jg_074Class = interface(JObjectClass)
  ['{9D211B38-8066-4297-BC73-2C6D31C1A8D6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/g')]
  Jg_074 = interface(JObject)
  ['{AAFCCB50-63EC-44B5-837D-FECDAB558B30}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJg_074 = class(TJavaGenericImport<Jg_074Class, Jg_074>) end;

  Jh_075Class = interface(JObjectClass)
  ['{B3BEADD5-D0BF-470E-B9F9-79BE27FC5117}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jh_075; cdecl;
    {class} function a(P1: JString; P2: Integer): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/h')]
  Jh_075 = interface(JObject)
  ['{1F1C6529-C9B1-4F79-86CE-EF298A095552}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJh_075 = class(TJavaGenericImport<Jh_075Class, Jh_075>) end;

  Ji_aClass = interface(JEnumClass) // or JObjectClass
  ['{668CD2AB-DF02-4A57-8092-D1C1303B5628}']
    { static Property Methods }
    {class} function _Geta: Ji_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<Ji_a>; cdecl;
    {class} function valueOf(P1: JString): Ji_a; cdecl;
    {class} function a(P1: Integer): Ji_a; cdecl;

    { static Property }
    {class} property a: Ji_a read _Geta;
  end;

  [JavaSignature('com/dothantech/common/i$a')]
  Ji_a = interface(JEnum) // or JObject
  ['{887432C1-1872-4F9D-947D-0FB847A2646B}']
    { Property Methods }

    { methods }
    function value: Integer; cdecl;

    { Property }
  end;

  TJi_a = class(TJavaGenericImport<Ji_aClass, Ji_a>) end;

  Ji_077Class = interface(JObjectClass)
  ['{BE3A2CA2-FC81-4311-8B31-86154C73AD1B}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JBitmap; P2: Integer): JBitmap; cdecl; overload;
    {class} function a(P1: JBitmap; P2: Ji_a; P3: JBitmap_Config): JBitmap; cdecl; overload;
    {class} function a(P1: Integer): Integer; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/i')]
  Ji_077 = interface(JObject)
  ['{F789A0B6-80F8-4F22-9D95-C967C2D5DB07}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJi_077 = class(TJavaGenericImport<Ji_077Class, Ji_077>) end;

  Jj_078Class = interface(JObjectClass)
  ['{78171CC7-22D9-44C4-B6D8-1E547D63D8B0}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JString; P2: Boolean): Boolean; cdecl; overload;
    {class} function a(P1: JObject): Jj; cdecl; overload;
    {class} function init: Jj_078; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/j')]
  Jj_078 = interface(JObject)
  ['{3E5A91D5-D4F8-4700-8465-C7870A3AA287}']
    { Property Methods }
    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function equals(P1: JObject): Boolean; cdecl;
    function toString: JString; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
    property a: Boolean read _Geta write _Seta;
  end;

  TJj_078 = class(TJavaGenericImport<Jj_078Class, Jj_078>) end;

  Jk_079Class = interface(JObjectClass)
  ['{0A2064F1-A94D-4EFF-A732-2193F18FF355}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function a(P1: Byte): Integer; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/k')]
  Jk_079 = interface(JObject)
  ['{D9C0F0AB-9E99-44C2-9F8A-1EF0AD64378E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJk_079 = class(TJavaGenericImport<Jk_079Class, Jk_079>) end;

  Jl_080Class = interface(JObjectClass)
  ['{9678CADD-112E-4B2D-89C4-361CA67AA3B3}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JObject; P2: JString): Boolean; cdecl; overload;
    {class} function b(P1: JObject; P2: JString): JObject; cdecl;
    {class} function a(P1: JClass; P2: JString; P3: TJavaObjectArray<JClass>): JMethod; cdecl; overload;
    {class} function a(P1: JMethod; P2: JObject; P3: TJavaObjectArray<JObject>): JObject; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/l')]
  Jl_080 = interface(JObject)
  ['{8321315B-0FB9-4DE5-9D70-1EC7E0F80F48}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJl_080 = class(TJavaGenericImport<Jl_080Class, Jl_080>) end;

  Jm_081Class = interface(JObjectClass)
  ['{EE7C51D8-F95E-4057-95E1-F683EE9CDFF6}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jm_081; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/m')]
  Jm_081 = interface(JObject)
  ['{794351B5-9C24-447E-ABD3-85A6426328B2}']
    { Property Methods }

    { methods }
    function a: Boolean; cdecl; overload;
    function a(P1: Int64): Boolean; cdecl; overload;
    procedure b; cdecl;
    procedure c; cdecl;

    { Property }
  end;

  TJm_081 = class(TJavaGenericImport<Jm_081Class, Jm_081>) end;

  Jn_aClass = interface(JObjectClass)
  ['{B974795A-5455-407C-8A05-D46BF06F82E5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/n$a')]
  Jn_a = interface(IJavaInstance)
  ['{3AEE81A9-C0A3-4F98-AAEF-904B61EA790B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJn_a = class(TJavaGenericImport<Jn_aClass, Jn_a>) end;

  Jn_083Class = interface(JObjectClass)
  ['{C1D5F719-6708-45C3-9CC0-E8BB21B219AA}']
    { static Property Methods }

    { static Methods }
    {class} procedure a(P1: Jn_a); cdecl;
    {class} function init: Jn_083; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/n')]
  Jn_083 = interface(JObject)
  ['{25DAEBD3-0CB6-46D5-9153-AF2E08BB665F}']
    { Property Methods }

    { methods }
    procedure uncaughtException(P1: JThread; P2: JThrowable); cdecl;

    { Property }
  end;

  TJn_083 = class(TJavaGenericImport<Jn_083Class, Jn_083>) end;

  Jo_084Class = interface(JThreadClass) // or JObjectClass
  ['{2EB97FE8-43A4-4945-8EE6-2DA8B20B7CFB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/o')]
  Jo_084 = interface(JThread) // or JObject
  ['{06B3B428-489E-438D-9CAB-54E71F2A9321}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJo_084 = class(TJavaGenericImport<Jo_084Class, Jo_084>) end;

  Jp_085Class = interface(JObjectClass)
  ['{C99DC742-9740-4538-8480-47C7CC5DB84C}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JString): JString; cdecl; overload;
    {class} function b(P1: JString): Boolean; cdecl;
    {class} function c(P1: JString): Boolean; cdecl;
    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/p')]
  Jp_085 = interface(JObject)
  ['{A242606D-9D94-4076-A5D1-21F6B0750476}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJp_085 = class(TJavaGenericImport<Jp_085Class, Jp_085>) end;

  Jq_aClass = interface(JObjectClass)
  ['{95948178-B416-419A-BF32-FBBD95FB7E7D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/q$a')]
  Jq_a = interface(IJavaInstance)
  ['{22E4EE3B-482D-494E-9375-3C50E88559C3}']
    { Property Methods }

    { methods }
    function value: Integer; cdecl;

    { Property }
  end;

  TJq_a = class(TJavaGenericImport<Jq_aClass, Jq_a>) end;

  Jq_087Class = interface(JObjectClass)
  ['{7CF637FD-ED2E-408D-82FD-9DEE7FB535A6}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: TJavaObjectArray<JEnum>; P2: JObject; P3: JEnum): JEnum; cdecl; overload;
    {class} function init: Jq_087; cdecl;
    {class} function a(P1: JString; P2: Ja; P3: Integer; P4: Integer; P5: JMap): Jb; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/q')]
  Jq_087 = interface(JObject)
  ['{E404DFDE-6F0E-40AF-A3CA-C4A32BC2EF8B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJq_087 = class(TJavaGenericImport<Jq_087Class, Jq_087>) end;

  Jr_aClass = interface(JObjectClass)
  ['{6586EE25-8F92-417B-817F-C867EFA0F440}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString): Jr_a; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/r$a')]
  Jr_a = interface(JObject)
  ['{B98067C6-CD35-44A4-B176-C0662B1C57FE}']
    { Property Methods }
    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property a: JString read _Geta write _Seta;
    property b: Integer read _Getb write _Setb;
    property c: JString read _Getc write _Setc;
  end;

  TJr_a = class(TJavaGenericImport<Jr_aClass, Jr_a>) end;

  Jr_089Class = interface(JObjectClass)
  ['{F764E001-53DA-49AB-9E8E-7ED1D4A691CB}']
    { static Property Methods }
    {class} function _Geta: JComparator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function a(P1: JString): JString; cdecl; overload;
    {class} function b(P1: JString): JString; cdecl; overload;
    {class} function a(P1: JString; P2: JString; P3: JString): JString; cdecl; overload;
    {class} function c(P1: JString): Boolean; cdecl;
    {class} function a(P1: JInputStream; P2: JString): Boolean; cdecl; overload;
    {class} function d(P1: JString): Boolean; cdecl;
    {class} function a(P1: JFile; P2: Boolean): Boolean; cdecl; overload;
    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
    {class} function e(P1: JString): JString; cdecl;
    {class} function b(P1: JString; P2: JString): Boolean; cdecl; overload;

    { static Property }
    {class} property a: JComparator read _Geta;
  end;

  [JavaSignature('com/dothantech/common/r')]
  Jr_089 = interface(JObject)
  ['{914B75C0-1B6B-40A5-8D16-2349EF3E9E72}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJr_089 = class(TJavaGenericImport<Jr_089Class, Jr_089>) end;

  JReflectionClass = interface(JObjectClass)
  ['{E4E4492C-8F10-43C9-BC15-DAB17F6B572F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReflection; cdecl;
    {class} function unseal(P1: JContext): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/Reflection')]
  JReflection = interface(JObject)
  ['{8E7F25ED-01E0-4786-94AF-30B9A371E1AF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReflection = class(TJavaGenericImport<JReflectionClass, JReflection>) end;

  Js_091Class = interface(JObjectClass)
  ['{42CC4387-40BD-473F-B979-C747BA383FA0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/s')]
  Js_091 = interface(JObject)
  ['{BEE0588D-2A30-4BF9-A2A8-FE6776A32B2E}']
    { Property Methods }

    { methods }
    function compare(P1: JObject; P2: JObject): Integer; cdecl;

    { Property }
  end;

  TJs_091 = class(TJavaGenericImport<Js_091Class, Js_091>) end;

  Jt_092Class = interface(JObjectClass)
  ['{A1E9899A-2CA3-4F7E-95A2-89A01F28B359}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/t')]
  Jt_092 = interface(JObject)
  ['{DB2274E5-B28D-4854-B871-7146B39BBF51}']
    { Property Methods }

    { methods }
    function compare(P1: JObject; P2: JObject): Integer; cdecl;

    { Property }
  end;

  TJt_092 = class(TJavaGenericImport<Jt_092Class, Jt_092>) end;

  JuClass = interface(JObjectClass)
  ['{82A1429C-9B85-4E95-8AF2-8D549FA1BFCC}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: Byte): JString; cdecl; overload;
    {class} function a(P1: Byte; P2: Boolean): JString; cdecl; overload;
    {class} function a(P1: Byte; P2: Boolean; P3: Integer): JString; cdecl; overload;
    {class} function a(P1: Integer): JString; cdecl; overload;
    {class} function a(P1: Integer; P2: Boolean; P3: Integer): JString; cdecl; overload;
    {class} function a(P1: Byte; P2: Byte): Integer; cdecl; overload;
    {class} function b(P1: Integer): Byte; cdecl;
    {class} function a(P1: JString; P2: Integer): Integer; cdecl; overload;
    {class} function a(P1: JObject): Ju; cdecl; overload;
    {class} function init: Ju; cdecl; overload;
    {class} function init(P1: Integer): Ju; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/u')]
  Ju = interface(JObject)
  ['{EFE39C4F-2A1D-4ED2-BAC8-EDFA13EB5B1E}']
    { Property Methods }
    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function equals(P1: JObject): Boolean; cdecl;
    function toString: JString; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
    property a: Integer read _Geta write _Seta;
  end;

  TJu = class(TJavaGenericImport<JuClass, Ju>) end;

  JvClass = interface(JObjectClass)
  ['{FB5FCE8E-67FB-4653-B0E7-ED69B0F3FABA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/v')]
  Jv = interface(JObject)
  ['{7C2D4CEF-A8CF-44D9-B1BD-69FC209D1B2A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJv = class(TJavaGenericImport<JvClass, Jv>) end;

  Jw_aClass = interface(JObjectClass)
  ['{AC8ACB1A-864A-4431-8F87-D4E8BE0AA965}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jw_a; cdecl; overload;
    {class} function init(P1: JString): Jw_a; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/w$a')]
  Jw_a = interface(JObject)
  ['{0ED8F26D-F210-4BE8-9FDA-8E05A8C6C7F3}']
    { Property Methods }
    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
    property a: JString read _Geta write _Seta;
  end;

  TJw_a = class(TJavaGenericImport<Jw_aClass, Jw_a>) end;

  Jw_bClass = interface(JObjectClass)
  ['{FACDA4A5-0CCB-4488-AAA4-63DF61C5F432}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/w$b')]
  Jw_b = interface(JObject)
  ['{5FEE2730-0170-4F1A-B17D-F9791D0EED4F}']
    { Property Methods }
    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property a: Integer read _Geta write _Seta;
  end;

  TJw_b = class(TJavaGenericImport<Jw_bClass, Jw_b>) end;

  Jw_cClass = interface(Jw_bClass) // or JObjectClass
  ['{C241A450-48B2-497D-863E-C6390A381250}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/w$c')]
  Jw_c = interface(Jw_b) // or JObject
  ['{430115FB-7B7B-4A96-905A-482D0CD38535}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJw_c = class(TJavaGenericImport<Jw_cClass, Jw_c>) end;

  Jw_dClass = interface(Jw_bClass) // or JObjectClass
  ['{ECC5D81B-E6DD-4D29-A3E8-5F3A7A45A8F1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/w$d')]
  Jw_d = interface(Jw_b) // or JObject
  ['{7929B82C-704E-4809-B17F-071BB7C6FE63}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJw_d = class(TJavaGenericImport<Jw_dClass, Jw_d>) end;

  Jw_eClass = interface(JObjectClass)
  ['{88205135-C6C7-4F36-8144-7D98494F2FDC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/w$e')]
  Jw_e = interface(JObject)
  ['{A141418F-4D1D-4682-BAA0-F0A4E013786C}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJw_e = class(TJavaGenericImport<Jw_eClass, Jw_e>) end;

  Jw_fClass = interface(Jw_bClass) // or JObjectClass
  ['{CB7350D5-9549-4E69-A736-BF1B1B0D0546}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/w$f')]
  Jw_f = interface(Jw_b) // or JObject
  ['{43E655B2-62AC-4EFE-A356-1E0D7973E8D2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJw_f = class(TJavaGenericImport<Jw_fClass, Jw_f>) end;

  Jw_gClass = interface(Jw_bClass) // or JObjectClass
  ['{B265AF8D-5013-43C1-9C18-F6CCB71C5ABE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/w$g')]
  Jw_g = interface(Jw_b) // or JObject
  ['{54176B50-9C43-49EA-A962-9A586E978172}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJw_g = class(TJavaGenericImport<Jw_gClass, Jw_g>) end;

  JwClass = interface(JObjectClass)
  ['{5D8AF000-A7FE-4103-9000-71C2C022EDA8}']
    { static Property Methods }
    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getg: Jw_e;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function a(P1: JString): Jw; cdecl; overload;
    {class} procedure e; cdecl; overload;
    {class} procedure a(P1: JMap); cdecl; overload;

    { static Property }
    {class} property a: JString read _Geta;
    {class} property b: Jf read _Getb;
    {class} property g: Jw_e read _Getg;
  end;

  [JavaSignature('com/dothantech/common/w')]
  Jw = interface(JObject)
  ['{B63231E0-321F-4E1F-83CC-3D13B156F39C}']
    { Property Methods }
    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function a: Boolean; cdecl; overload;
    procedure b(P1: JString); cdecl; overload;
    procedure a(P1: JString; P2: TJavaObjectArray<JObject>); cdecl; overload;
    function b: Boolean; cdecl; overload;
    procedure c(P1: JString); cdecl; overload;
    function c: Boolean; cdecl; overload;
    procedure d(P1: JString); cdecl; overload;
    procedure b(P1: JString; P2: TJavaObjectArray<JObject>); cdecl; overload;
    procedure e(P1: JString); cdecl; overload;
    procedure c(P1: JString; P2: TJavaObjectArray<JObject>); cdecl; overload;
    function d: Boolean; cdecl; overload;
    procedure f(P1: JString); cdecl;
    procedure d(P1: JString; P2: TJavaObjectArray<JObject>); cdecl; overload;

    { Property }
    property h: JString read _Geth write _Seth;
  end;

  TJw = class(TJavaGenericImport<JwClass, Jw>) end;

  JxClass = interface(JObjectClass)
  ['{17355562-2B9C-4A24-95A1-48F98A051608}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/x')]
  Jx = interface(JObject)
  ['{14C4212B-3762-4866-A4AF-BA130CDF349B}']
    { Property Methods }

    { methods }
    function handleMessage(P1: JMessage): Boolean; cdecl;

    { Property }
  end;

  TJx = class(TJavaGenericImport<JxClass, Jx>) end;

  JyClass = interface(JObjectClass)
  ['{33F75751-E812-416B-9344-29EC45C0FDFE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/y')]
  Jy = interface(JObject)
  ['{2434CAC1-3F38-4C25-B941-07DDDCE4722D}']
    { Property Methods }

    { methods }
    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl;
    function createFromParcel(P1: JParcel): JObject; cdecl;

    { Property }
  end;

  TJy = class(TJavaGenericImport<JyClass, Jy>) end;

  JzClass = interface(JObjectClass)
  ['{1D7BC7B4-F2B3-423D-AD06-CC5E9B0A238B}']
    { static Property Methods }

    { static Methods }
    {class} function a: Jz; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/z')]
  Jz = interface(JObject)
  ['{3EC3791D-7BDA-460A-B08E-0F42F667C014}']
    { Property Methods }

    { methods }
    function a(P1: TJavaObjectArray<JEnum>; P2: JString; P3: JEnum): JEnum; cdecl; overload;

    { Property }
  end;

  TJz = class(TJavaGenericImport<JzClass, Jz>) end;

  Ja_106Class = interface(JBroadcastReceiverClass) // or JObjectClass
  ['{15646C4D-F2A3-430B-9A38-C973FE8279F1}']
    { static Property Methods }

    { static Methods }
    {class} function init: Ja_106; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/d/a')]
  Ja_106 = interface(JBroadcastReceiver) // or JObject
  ['{DA81F261-0155-4E65-A7CC-13C909791A56}']
    { Property Methods }

    { methods }
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;

    { Property }
  end;

  TJa_106 = class(TJavaGenericImport<Ja_106Class, Ja_106>) end;

  Ja_a_107Class = interface(JEnumClass) // or JObjectClass
  ['{BC86F7D6-8FD4-42DE-8C41-79B10B668E30}']
    { static Property Methods }
    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function a: TJavaArray<Integer>; cdecl;

    { static Property }
    {class} property a: Integer read _Geta;
    {class} property b: Integer read _Getb;
    {class} property c: Integer read _Getc;
  end;

  [JavaSignature('com/dothantech/data/a$a')]
  Ja_a_107 = interface(JEnum) // or JObject
  ['{D3FA91CE-8613-41CF-AA14-D016D4763194}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJa_a_107 = class(TJavaGenericImport<Ja_a_107Class, Ja_a_107>) end;

  Ja_108Class = interface(JObjectClass)
  ['{DB20F8AF-273D-43D2-A3A2-B2501BCAD061}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Jb_a; P2: JIDzPrinter2_PrinterParam): Ja_108; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/a')]
  Ja_108 = interface(JObject)
  ['{9D454AE4-1130-4CDF-AA24-FA05F85B10F1}']
    { Property Methods }

    { methods }
    function a(P1: JBitmap; P2: JBundle): Boolean; cdecl; overload;
    function a: Jh_a; cdecl; overload;
    function toString: JString; cdecl;

    { Property }
  end;

  TJa_108 = class(TJavaGenericImport<Ja_108Class, Ja_108>) end;

  Jb_109Class = interface(JObjectClass)
  ['{A88E6B2E-9C74-43B5-89BF-ECA3DCDAD510}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/b')]
  Jb_109 = interface(JObject)
  ['{6A3F664E-19CC-4A2B-90D1-16718D4F0D52}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJb_109 = class(TJavaGenericImport<Jb_109Class, Jb_109>) end;

  Jc_110Class = interface(JObjectClass)
  ['{16E5755B-01DD-4042-B7ED-7131A4A2E89A}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JIDzPrinter_PrinterAddress): JIDzPrinter2_PrinterParam; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/c')]
  Jc_110 = interface(JObject)
  ['{7B010A67-10FE-4E10-8E41-CBA73E1ED6C3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJc_110 = class(TJavaGenericImport<Jc_110Class, Jc_110>) end;

  Jd_a_aClass = interface(JEnumClass) // or JObjectClass
  ['{BC3A3C71-1531-47DE-AB4C-EB9E90846347}']
    { static Property Methods }
    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property a: Integer read _Geta;
    {class} property b: Integer read _Getb;
    {class} property c: Integer read _Getc;
  end;

  [JavaSignature('com/dothantech/data/d$a$a')]
  Jd_a_a = interface(JEnum) // or JObject
  ['{2E4C9B3E-B277-4962-B3FE-C4FE6BB22437}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJd_a_a = class(TJavaGenericImport<Jd_a_aClass, Jd_a_a>) end;

  Jd_aClass = interface(JObjectClass)
  ['{B9EA7D18-3478-4EBE-8239-1755D44E49A4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/d$a')]
  Jd_a = interface(IJavaInstance)
  ['{101FC332-5251-4751-B642-2A0AADED0AAC}']
    { Property Methods }

    { methods }
    procedure b(P1: Boolean); cdecl;
    function c: Integer; cdecl;

    { Property }
  end;

  TJd_a = class(TJavaGenericImport<Jd_aClass, Jd_a>) end;

  Jd_bClass = interface(JObjectClass)
  ['{F3CC6962-1FFF-480F-91D0-216731155008}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/d$b')]
  Jd_b = interface(IJavaInstance)
  ['{38CB40E2-1AC3-47A8-B3F9-D81B84569729}']
    { Property Methods }

    { methods }
    function a(P1: Boolean): Boolean; cdecl;
    procedure a_(P1: Integer); cdecl;

    { Property }
  end;

  TJd_b = class(TJavaGenericImport<Jd_bClass, Jd_b>) end;

  Jd_114Class = interface(JObjectClass)
  ['{B016D941-88B3-4C6C-B6C1-F688DC72FF5A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/d')]
  Jd_114 = interface(IJavaInstance)
  ['{BE334F6A-065F-447F-A411-14C91EDF8E67}']
    { Property Methods }

    { methods }
    function b: JString; cdecl; overload;
    procedure a(P1: Ji_a); cdecl; overload;
    procedure a(P1: JIDzPrinter_PrinterState); cdecl; overload;
    function a(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
    function b(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
    procedure a(P1: Je); cdecl; overload;
    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): Boolean; cdecl; overload;
    procedure a; cdecl; overload;

    { Property }
  end;

  TJd_114 = class(TJavaGenericImport<Jd_114Class, Jd_114>) end;

  JDzTagObject_aClass = interface(JEnumClass) // or JObjectClass
  ['{B9D9E3E1-3EBF-4AD9-8182-376F10219EA6}']
    { static Property Methods }
    {class} function _Geta: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDzTagObject_a>; cdecl;
    {class} function valueOf(P1: JString): JDzTagObject_a; cdecl;

    { static Property }
    {class} property a: JDzTagObject_a read _Geta;
    {class} property b: JDzTagObject_a read _Getb;
    {class} property c: JDzTagObject_a read _Getc;
  end;

  [JavaSignature('com/dothantech/data/DzTagObject$a')]
  JDzTagObject_a = interface(JEnum) // or JObject
  ['{3F7DB0AF-0DF5-4ABB-B4D7-F7F355DF0CD3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzTagObject_a = class(TJavaGenericImport<JDzTagObject_aClass, JDzTagObject_a>) end;

  JDzTagObjectClass = interface(JObjectClass)
  ['{8E9554C2-A244-4E78-98F4-0E46EF111B0D}']
    { static Property Methods }
    {class} function _GetXmlSerializerIndent: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetXmlSerializerNewLine: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString): JDzTagObject; cdecl; overload;
    {class} function init(P1: JString; P2: JString; P3: JDzTagObject_a): JDzTagObject; cdecl; overload;
    {class} function load(P1: JXmlPullParser): JDzTagObject; cdecl; overload;
    {class} function load(P1: JInputStream): JDzTagObject; cdecl; overload;
    {class} function load(P1: JString): JDzTagObject; cdecl; overload;
    {class} function valueOf(P1: JString): JDzTagObject; cdecl;
    {class} function nextUntil(P1: JXmlPullParser; P2: Integer): Boolean; cdecl;

    { static Property }
    {class} property XmlSerializerIndent: JString read _GetXmlSerializerIndent;
    {class} property XmlSerializerNewLine: JString read _GetXmlSerializerNewLine;
  end;

  [JavaSignature('com/dothantech/data/DzTagObject')]
  JDzTagObject = interface(JObject)
  ['{5412BF82-D246-4464-977D-D8954C2170FC}']
    { Property Methods }
    function _GetTagName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTagName(aTagName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetTagValue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTagValue(aTagValue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetTagType: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTagType(aTagType: JDzTagObject_a);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetChildren: Je;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetChildren(aChildren: Je);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

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
    function safeChildren: Je; cdecl;
    function getChild(P1: JString): JDzTagObject; cdecl;
    function getChildren(P1: JString): Je; cdecl;

    { Property }
    property TagName: JString read _GetTagName write _SetTagName;
    property TagValue: JString read _GetTagValue write _SetTagValue;
    property TagType: JDzTagObject_a read _GetTagType write _SetTagType;
    property Children: Je read _GetChildren write _SetChildren;
  end;

  TJDzTagObject = class(TJavaGenericImport<JDzTagObjectClass, JDzTagObject>) end;

  Je_a_117Class = interface(JObjectClass)
  ['{2A802C30-0EAB-4084-ADC6-8BA3E78455C9}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Je): Je_a_117; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/e$a')]
  Je_a_117 = interface(JObject)
  ['{D85ADB61-C74F-408E-BE1C-FA5FA4BA9444}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl; overload;
    function b: Byte; cdecl;
    function c: Word; cdecl;
    function d: Word; cdecl;
    function e: Integer; cdecl;
    function f: JString; cdecl;
    function a(P1: JString): JString; cdecl; overload;
    function g: TJavaArray<Byte>; cdecl;
    function a(P1: Integer): TJavaArray<Byte>; cdecl; overload;
    function h: TJavaArray<Integer>; cdecl;

    { Property }
  end;

  TJe_a_117 = class(TJavaGenericImport<Je_a_117Class, Je_a_117>) end;

  Je_118Class = interface(JObjectClass)
  ['{248FF2C8-2873-478A-9C81-31F45BF522B0}']
    { static Property Methods }
    {class} function _Geta: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} procedure a; cdecl; overload;
    {class} procedure b; cdecl; overload;
    {class} function c: Boolean; cdecl;
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Je; cdecl; overload;
    {class} function a(P1: TJavaArray<Byte>): Je; cdecl; overload;
    {class} function a(P1: TJavaArray<Byte>; P2: Integer): Je; cdecl; overload;
    {class} function init(P1: Byte): Je_118; cdecl; overload;
    {class} function init(P1: Byte; P2: TJavaArray<Byte>): Je_118; cdecl; overload;
    {class} function init(P1: Byte; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: Integer; P7: Integer): Je_118; cdecl; overload;
    {class} function init(P1: Byte; P2: Byte): Je_118; cdecl; overload;
    {class} function init(P1: Byte; P2: Byte; P3: Byte): Je_118; cdecl; overload;
    {class} function init(P1: Byte; P2: Byte; P3: Byte; P4: Byte): Je_118; cdecl; overload;
    {class} function init(P1: Byte; P2: Word): Je_118; cdecl; overload;
    {class} function init(P1: Byte; P2: Word; P3: Boolean): Je_118; cdecl; overload;
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Word): Integer; cdecl; overload;
    {class} function b(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl; overload;

    { static Property }
    {class} property a: Byte read _Geta;
    {class} property b: Byte read _Getb;
    {class} property c: Boolean read _Getc;
  end;

  [JavaSignature('com/dothantech/data/e')]
  Je_118 = interface(JObject)
  ['{A00FD550-5C31-45C6-AE98-95C42AF17B53}']
    { Property Methods }
    function _Getd: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd(ad: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gete: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sete(ae: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function d: Integer; cdecl;
    function e: TJavaArray<Byte>; cdecl;
    function toString: JString; cdecl;

    { Property }
    property d: Byte read _Getd write _Setd;
    property e: TJavaArray<Byte> read _Gete write _Sete;
  end;

  TJe_118 = class(TJavaGenericImport<Je_118Class, Je_118>) end;

  Jf_119Class = interface(JObjectClass)
  ['{EF58994E-AB4A-4B27-8128-DA6B200E013F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/f')]
  Jf_119 = interface(JObject)
  ['{223CBCDA-946F-4CF3-B52A-7BD62202803E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJf_119 = class(TJavaGenericImport<Jf_119Class, Jf_119>) end;

  Jg_120Class = interface(JObjectClass)
  ['{C26F33CE-123B-4E7F-B370-579C983A9E6C}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Jab; P2: JBundle): Jg_120; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/g')]
  Jg_120 = interface(JObject)
  ['{DBE3A03F-1FB7-4B62-995E-F76767EBE82E}']
    { Property Methods }

    { methods }
    function a: Jh_a; cdecl;

    { Property }
  end;

  TJg_120 = class(TJavaGenericImport<Jg_120Class, Jg_120>) end;

  Jh_aClass = interface(JObjectClass)
  ['{9497B450-ECF3-4FF5-A92C-C94B2BE6DC7B}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jh_a; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/h$a')]
  Jh_a = interface(JObject)
  ['{8EFC2C85-C14A-4639-A4DE-B97C5D0988B3}']
    { Property Methods }

    { methods }
    function a: Jh_b; cdecl; overload;
    function b: Integer; cdecl;
    function c: Integer; cdecl;
    function d: Boolean; cdecl;
    function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Boolean; cdecl; overload;
    function a(P1: TJavaArray<Byte>; P2: Integer): Boolean; cdecl; overload;
    function a(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
    function a(P1: Je): Boolean; cdecl; overload;
    function a(P1: Byte; P2: Byte): Boolean; cdecl; overload;
    function a(P1: Jh_a): Boolean; cdecl; overload;

    { Property }
  end;

  TJh_a = class(TJavaGenericImport<Jh_aClass, Jh_a>) end;

  Jh_bClass = interface(Jh_123Class) // or JObjectClass
  ['{C238CFBE-FAF3-4EB2-A271-DB6DF77A9D89}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jh_b; cdecl; overload;
    {class} function init(P1: TJavaArray<Byte>; P2: Integer): Jh_b; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/h$b')]
  Jh_b = interface(Jh_123) // or JObject
  ['{5156358D-65E5-440D-B461-416B0843FC29}']
    { Property Methods }

    { methods }
    function d: Jh_b; cdecl;

    { Property }
  end;

  TJh_b = class(TJavaGenericImport<Jh_bClass, Jh_b>) end;

  Jh_123Class = interface(JObjectClass)
  ['{4FA21F9D-1694-4C13-8D15-B2E23A455D7B}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jh_123; cdecl; overload;
    {class} function init(P1: TJavaArray<Byte>; P2: Integer): Jh_123; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/h')]
  Jh_123 = interface(JObject)
  ['{8EF8ECE9-EA94-4CD4-A04C-502B5FDB73B4}']
    { Property Methods }
    function _Geta: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function a: Integer; cdecl; overload;
    function a(P1: TJavaArray<Byte>; P2: Integer): Boolean; cdecl; overload;
    function a(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
    function a(P1: Byte): Boolean; cdecl; overload;
    function a(P1: Byte; P2: TJavaArray<Byte>): Boolean; cdecl; overload;
    function a(P1: Byte; P2: Byte): Boolean; cdecl; overload;
    function a(P1: Byte; P2: Byte; P3: Byte): Boolean; cdecl; overload;
    function a(P1: Byte; P2: Word): Boolean; cdecl; overload;
    function a(P1: Byte; P2: Word; P3: Boolean): Boolean; cdecl; overload;
    function b: Integer; cdecl;
    function c: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property a: TJavaArray<Byte> read _Geta write _Seta;
  end;

  TJh_123 = class(TJavaGenericImport<Jh_123Class, Jh_123>) end;

  Ji_a_124Class = interface(JObjectClass)
  ['{E179238D-C7E8-4A8B-AF8F-5241A96F0EE0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/i$a')]
  Ji_a_124 = interface(IJavaInstance)
  ['{E0B0EC48-A3FC-4BBA-A733-CE8E5C632969}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl;

    { Property }
  end;

  TJi_a_124 = class(TJavaGenericImport<Ji_a_124Class, Ji_a_124>) end;

  Ji_125Class = interface(JObjectClass)
  ['{CFE4637D-77A0-4408-A687-157DBECC9855}']
    { static Property Methods }

    { static Methods }
    {class} function init: Ji_125; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/i')]
  Ji_125 = interface(JObject)
  ['{F69584E9-F3E2-4157-9C9F-D8FB7EA5D52B}']
    { Property Methods }

    { methods }
    procedure a(P1: Ji_a); cdecl; overload;
    procedure a(P1: Byte); cdecl; overload;
    procedure a(P1: TJavaArray<Byte>; P2: Integer); cdecl; overload;
    procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer); cdecl; overload;

    { Property }
  end;

  TJi_125 = class(TJavaGenericImport<Ji_125Class, Ji_125>) end;

  Jj_aClass = interface(Jh_aClass) // or JObjectClass
  ['{BDD9FC34-9AD5-4ABD-B8C7-ECC2414A9824}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jj_a; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/j$a')]
  Jj_a = interface(Jh_a) // or JObject
  ['{EC94FBF1-0A3F-4C29-893D-E891B68943B5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJj_a = class(TJavaGenericImport<Jj_aClass, Jj_a>) end;

  Jj_bClass = interface(JExceptionClass) // or JObjectClass
  ['{0CB1719B-7067-4D3D-AB0B-51D2C59BFB0A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/j$b')]
  Jj_b = interface(JException) // or JObject
  ['{36A7C0DC-D45E-44DB-888E-F32CC1971666}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJj_b = class(TJavaGenericImport<Jj_bClass, Jj_b>) end;

  Jj_cClass = interface(JEnumClass) // or JObjectClass
  ['{A2E1A1A9-AAC0-4530-AA14-69E10FB37D50}']
    { static Property Methods }
    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property a: Integer read _Geta;
    {class} property b: Integer read _Getb;
    {class} property c: Integer read _Getc;
    {class} property d: Integer read _Getd;
  end;

  [JavaSignature('com/dothantech/data/j$c')]
  Jj_c = interface(JEnum) // or JObject
  ['{B253BDDC-2056-4C77-955F-AF3BFFE0BC2F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJj_c = class(TJavaGenericImport<Jj_cClass, Jj_c>) end;

  Jj_129Class = interface(JObjectClass)
  ['{116C41DC-6CC8-4AA7-8376-140B339AFDE5}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jj_129; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/data/j')]
  Jj_129 = interface(JObject)
  ['{38055DD5-8142-471E-861F-4A39F147D1C7}']
    { Property Methods }
    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function a(P1: JContext; P2: JString): Integer; cdecl;

    { Property }
    property a: Integer read _Geta write _Seta;
    property b: JArrayList read _Getb write _Setb;
  end;

  TJj_129 = class(TJavaGenericImport<Jj_129Class, Jj_129>) end;

  Ja_130Class = interface(Jd_133Class) // or JObjectClass
  ['{76EC1373-2B23-43D7-A671-98F096D810CC}']
    { static Property Methods }
    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property a: TJavaArray<Integer> read _Geta;
  end;

  [JavaSignature('com/dothantech/e/a')]
  Ja_130 = interface(Jd_133) // or JObject
  ['{0D315A80-7B19-4A22-973D-0596CA26B8B0}']
    { Property Methods }

    { methods }
    function a(P1: JString): Boolean; cdecl;

    { Property }
  end;

  TJa_130 = class(TJavaGenericImport<Ja_130Class, Ja_130>) end;

  Jb_131Class = interface(Jf_135Class) // or JObjectClass
  ['{257391E7-081E-4550-A1AA-3E026B47D402}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/e/b')]
  Jb_131 = interface(Jf_135) // or JObject
  ['{41DE4BBF-A81F-44C0-8C14-864B54F88347}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJb_131 = class(TJavaGenericImport<Jb_131Class, Jb_131>) end;

  Jc_132Class = interface(Jf_135Class) // or JObjectClass
  ['{2EAF227D-CC6A-4742-957F-D24B46DBDEFF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/e/c')]
  Jc_132 = interface(Jf_135) // or JObject
  ['{34D02C4D-A2B8-44AE-AFE7-7807BBA34231}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJc_132 = class(TJavaGenericImport<Jc_132Class, Jc_132>) end;

  Jd_133Class = interface(JObjectClass)
  ['{93B6B447-440D-493A-9417-DD43DFF1DD49}']
    { static Property Methods }

    { static Methods }
    {class} function b(P1: JString): Integer; cdecl;
    {class} function c(P1: JString): Jd; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/e/d')]
  Jd_133 = interface(JObject)
  ['{6737F439-0DEB-4154-B71E-A37B3F482F6A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJd_133 = class(TJavaGenericImport<Jd_133Class, Jd_133>) end;

  Je_134Class = interface(Jf_135Class) // or JObjectClass
  ['{ED309072-D61A-4A14-9F94-A0A6C07B9E90}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/e/e')]
  Je_134 = interface(Jf_135) // or JObject
  ['{4282A8F4-0E54-4580-A08C-397C94D12854}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJe_134 = class(TJavaGenericImport<Je_134Class, Je_134>) end;

  Jf_135Class = interface(Jd_133Class) // or JObjectClass
  ['{7DB4F2E2-4F1E-4B29-A1EE-8045BEE1A9A7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/e/f')]
  Jf_135 = interface(Jd_133) // or JObject
  ['{71B12A1A-70FD-4CEE-A7D8-CBEF9CFA0D8A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJf_135 = class(TJavaGenericImport<Jf_135Class, Jf_135>) end;

  Ja_136Class = interface(Jc_138Class) // or JObjectClass
  ['{25D4D985-2362-45D8-98FD-9100AA92C099}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JInputStream): Ja_136; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/f/a')]
  Ja_136 = interface(Jc_138) // or JObject
  ['{0C511A6C-4D9A-44E3-9E7C-E2D6AD94A305}']
    { Property Methods }

    { methods }
    procedure a(P1: Ji_a); cdecl;

    { Property }
  end;

  TJa_136 = class(TJavaGenericImport<Ja_136Class, Ja_136>) end;

  Jb_137Class = interface(Ji_125Class) // or JObjectClass
  ['{6AAC64C5-93A2-4140-A965-524917AFAC54}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/f/b')]
  Jb_137 = interface(Ji_125) // or JObject
  ['{6826B99B-5A7A-4991-9ACE-8218F92654F1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJb_137 = class(TJavaGenericImport<Jb_137Class, Jb_137>) end;

  Jc_138Class = interface(JObjectClass)
  ['{5F503B76-865E-47A3-A000-738BD15E5AC8}']
    { static Property Methods }
    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JInputStream): Jc_138; cdecl;

    { static Property }
    {class} property a: Jw read _Geta;
  end;

  [JavaSignature('com/dothantech/f/c')]
  Jc_138 = interface(JObject)
  ['{A9822BDE-9CFE-49F5-BDA4-84AC97B8DD7E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJc_138 = class(TJavaGenericImport<Jc_138Class, Jc_138>) end;

  Jd_139Class = interface(JThreadClass) // or JObjectClass
  ['{17803DB0-FF77-4798-B998-2370DCFC7120}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/f/d')]
  Jd_139 = interface(JThread) // or JObject
  ['{6055AB06-6354-4446-A2AA-FAC123C3098A}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJd_139 = class(TJavaGenericImport<Jd_139Class, Jd_139>) end;

  Ja_a_140Class = interface(JObjectClass)
  ['{CC8BDFC3-246B-444C-9F04-78EC4B9617D6}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JUsbInterface; P3: JUsbEndpoint; P4: JUsbEndpoint): Ja_a_140; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/g/a$a')]
  Ja_a_140 = interface(JObject)
  ['{CAD2BBC2-9F26-4A04-88CE-D2265674743C}']
    { Property Methods }
    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: JUsbInterface;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: JUsbInterface);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: JUsbEndpoint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JUsbEndpoint);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getd: JUsbEndpoint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd(ad: JUsbEndpoint);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property a: JString read _Geta write _Seta;
    property b: JUsbInterface read _Getb write _Setb;
    property c: JUsbEndpoint read _Getc write _Setc;
    property d: JUsbEndpoint read _Getd write _Setd;
  end;

  TJa_a_140 = class(TJavaGenericImport<Ja_a_140Class, Ja_a_140>) end;

  Ja_141Class = interface(JObjectClass)
  ['{40725D22-3C47-44CE-8C2B-FFCCDD579696}']
    { static Property Methods }
    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function a(P1: JUsbDevice): Ja_a; cdecl; overload;
    {class} function init(P1: JUsbDevice; P2: JUsbDeviceConnection; P3: Ja_a): Ja_141; cdecl;

    { static Property }
    {class} property a: Jw read _Geta;
  end;

  [JavaSignature('com/dothantech/g/a')]
  Ja_141 = interface(JObject)
  ['{987CB476-633D-468D-B631-5DB9F51BA5FE}']
    { Property Methods }

    { methods }
    function b: JString; cdecl; overload;
    function a(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
    function b(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
    procedure a(P1: Ji_a); cdecl; overload;
    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): Boolean; cdecl; overload;
    procedure a; cdecl; overload;

    { Property }
  end;

  TJa_141 = class(TJavaGenericImport<Ja_141Class, Ja_141>) end;

  Jb_142Class = interface(Jf_146Class) // or JObjectClass
  ['{FD546295-B4B5-44A9-8DA7-421801ED9992}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/g/b')]
  Jb_142 = interface(Jf_146) // or JObject
  ['{46D02FDB-B3CC-4ED3-A042-3D107867DA33}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJb_142 = class(TJavaGenericImport<Jb_142Class, Jb_142>) end;

  Jc_143Class = interface(JObjectClass)
  ['{05D12A59-DEFB-484C-8C93-2006D1FD751C}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): Jc_143; cdecl;
    {class} function a(P1: JUsbManager; P2: JUsbDevice): JUsbDeviceConnection; cdecl; overload;
    {class} procedure a(P1: JUsbDeviceConnection); cdecl; overload;
    {class} function d(P1: JUsbDevice): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/g/c')]
  Jc_143 = interface(JObject)
  ['{CAF16CC2-0B71-4C0D-B6D2-F81A082D9566}']
    { Property Methods }
    function _Geta: JUsbManager;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JUsbManager);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure a; cdecl; overload;
    function b: JUsbDevice; cdecl; overload;
    function a(P1: JString; P2: Boolean): JUsbDevice; cdecl; overload;
    function b(P1: JString; P2: Boolean): JUsbDevice; cdecl; overload;
    function e(P1: JUsbDevice): Boolean; cdecl;
    function c(P1: JUsbDevice): Boolean; cdecl;

    { Property }
    property a: JUsbManager read _Geta write _Seta;
  end;

  TJc_143 = class(TJavaGenericImport<Jc_143Class, Jc_143>) end;

  Jd_144Class = interface(JBroadcastReceiverClass) // or JObjectClass
  ['{82055DAA-59C1-4943-B535-E968F8242340}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/g/d')]
  Jd_144 = interface(JBroadcastReceiver) // or JObject
  ['{1DECB87A-BD3E-430E-B01F-F7A713F49CC4}']
    { Property Methods }

    { methods }
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;

    { Property }
  end;

  TJd_144 = class(TJavaGenericImport<Jd_144Class, Jd_144>) end;

  Je_145Class = interface(JBroadcastReceiverClass) // or JObjectClass
  ['{6C4F3F5B-12FC-4AFA-979E-9FEFCB022672}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/g/e')]
  Je_145 = interface(JBroadcastReceiver) // or JObject
  ['{2C4FCCC0-C8DC-4E04-BD56-89CA9A419B27}']
    { Property Methods }

    { methods }
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;

    { Property }
  end;

  TJe_145 = class(TJavaGenericImport<Je_145Class, Je_145>) end;

  Jf_146Class = interface(JObjectClass)
  ['{74769E4A-7647-4448-B997-24F41B6DC248}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JUsbDeviceConnection; P2: JUsbEndpoint): Jf_146; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/g/f')]
  Jf_146 = interface(JObject)
  ['{11AAD733-8D2E-43A1-9003-C544636B2E40}']
    { Property Methods }

    { methods }
    procedure b; cdecl;
    procedure a(P1: Ji_a); cdecl;

    { Property }
  end;

  TJf_146 = class(TJavaGenericImport<Jf_146Class, Jf_146>) end;

  Jg_147Class = interface(JThreadClass) // or JObjectClass
  ['{AF814207-DFA9-4E44-9828-F9F7CD7BD630}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/g/g')]
  Jg_147 = interface(JThread) // or JObject
  ['{1E7B3A6F-F454-4C97-AC74-E85F9FD7BFB3}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJg_147 = class(TJavaGenericImport<Jg_147Class, Jg_147>) end;

  Jh_148Class = interface(Ji_125Class) // or JObjectClass
  ['{CEAF572B-B45F-4A4D-9531-D95723103976}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/g/h')]
  Jh_148 = interface(Ji_125) // or JObject
  ['{CC38B025-70D6-4A20-AE86-188E4D938FB9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJh_148 = class(TJavaGenericImport<Jh_148Class, Jh_148>) end;

  Ja_149Class = interface(JObjectClass)
  ['{F3104C5A-50A1-4223-886C-6669118195DA}']
    { static Property Methods }
    {class} function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property a: Ja read _Geta;
  end;

  [JavaSignature('com/dothantech/h/a/a/a')]
  Ja_149 = interface(JObject)
  ['{10CD5976-9F39-483B-9ECF-9D4EC6AAA9D1}']
    { Property Methods }

    { methods }
    function b: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJa_149 = class(TJavaGenericImport<Ja_149Class, Ja_149>) end;

  Jb_150Class = interface(JObjectClass)
  ['{9DFC6D8D-7CC0-4FF1-9A35-94A74624D994}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/a/a/b')]
  Jb_150 = interface(JObject)
  ['{5D6D5EAE-5CD4-40D9-A29D-21B4568EF01B}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;

    { Property }
  end;

  TJb_150 = class(TJavaGenericImport<Jb_150Class, Jb_150>) end;

  Jc_151Class = interface(JObjectClass)
  ['{968FE599-EF37-4618-BB11-0E3845A79355}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Ja): Jc_151; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/a/a/c')]
  Jc_151 = interface(JObject)
  ['{A690DEFB-EC33-44F4-A9D3-347743ABC446}']
    { Property Methods }

    { methods }
    procedure a(P1: TJavaArray<Integer>; P2: Integer); cdecl;

    { Property }
  end;

  TJc_151 = class(TJavaGenericImport<Jc_151Class, Jc_151>) end;

  Ja_152Class = interface(JObjectClass)
  ['{CA7627DE-F0E1-48D3-BC89-7E167B2A7F08}']
    { static Property Methods }

    { static Methods }
    {class} function init: Ja_152; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/a/a')]
  Ja_152 = interface(JObject)
  ['{02390F5E-8202-4D98-B019-4F2D38CCA70B}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl; overload;
    function b: Integer; cdecl; overload;
    function a(P1: Integer): Boolean; cdecl; overload;
    procedure a(P1: Boolean); cdecl; overload;
    procedure a(P1: Integer; P2: Integer); cdecl; overload;
    procedure a(P1: Ja); cdecl; overload;
    procedure a(P1: TJavaArray<Byte>); cdecl; overload;
    procedure b(P1: Ja); cdecl; overload;
    procedure a(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer); cdecl; overload;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    function clone: JObject; cdecl;

    { Property }
  end;

  TJa_152 = class(TJavaGenericImport<Ja_152Class, Ja_152>) end;

  Jb_153Class = interface(JObjectClass)
  ['{8C61D243-D163-40E8-9AF5-FFE634B46DCA}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: Integer): Jb_153; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/a/b')]
  Jb_153 = interface(JObject)
  ['{D2DA8E07-2365-472A-8FA5-34FD1BF03B30}']
    { Property Methods }

    { methods }
    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
    procedure a; cdecl; overload;
    procedure a(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl; overload;
    function b: Integer; cdecl;
    function c: Integer; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    function clone: JObject; cdecl;

    { Property }
  end;

  TJb_153 = class(TJavaGenericImport<Jb_153Class, Jb_153>) end;

  Jc_154Class = interface(JEnumClass) // or JObjectClass
  ['{7DE9D8B8-63B9-4D10-8694-C014E05E850D}']
    { static Property Methods }

    { static Methods }
    {class} function values: TJavaObjectArray<Jc>; cdecl;
    {class} function valueOf(P1: JString): Jc; cdecl;
    {class} function a(P1: JCharset): Jc; cdecl; overload;
    {class} function a(P1: JString): Jc; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/a/c')]
  Jc_154 = interface(JEnum) // or JObject
  ['{A34A9916-5546-41D5-AF9F-DF7FC959EDA1}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl; overload;

    { Property }
  end;

  TJc_154 = class(TJavaGenericImport<Jc_154Class, Jc_154>) end;

  Jd_155Class = interface(JObjectClass)
  ['{BDA70E31-626D-4501-AE23-89F0EF6ACA50}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JCharset; P3: Integer): Jd_155; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/a/d')]
  Jd_155 = interface(JObject)
  ['{A05F93D9-765E-4173-8876-D345758C4DB2}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl; overload;
    function a(P1: Integer): JCharset; cdecl; overload;
    function b(P1: Integer): Integer; cdecl; overload;
    function b: Integer; cdecl; overload;
    function a(P1: Char; P2: Integer): Boolean; cdecl; overload;
    function b(P1: Char; P2: Integer): TJavaArray<Byte>; cdecl; overload;
    function a(P1: JString; P2: Integer): TJavaArray<Byte>; cdecl; overload;

    { Property }
  end;

  TJd_155 = class(TJavaGenericImport<Jd_155Class, Jd_155>) end;

  Je_a_156Class = interface(JObjectClass)
  ['{38C8790D-0E8D-4FC1-884B-5BF1DE5F6EE4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/a/e$a')]
  Je_a_156 = interface(JObject)
  ['{E7042530-3CCB-4159-BC42-F54FD1FBE5CA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJe_a_156 = class(TJavaGenericImport<Je_a_156Class, Je_a_156>) end;

  Je_157Class = interface(JObjectClass)
  ['{250E1122-738A-4FCA-B911-C4861F923567}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JCharset; P3: Integer): Je_157; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/a/e')]
  Je_157 = interface(JObject)
  ['{18C9FA1D-A091-492D-BFD5-F56E2FFA9ECB}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl; overload;
    function b: Integer; cdecl; overload;
    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
    function a(P1: Integer): Char; cdecl; overload;
    function b(P1: Integer): Boolean; cdecl; overload;
    function c(P1: Integer): Boolean; cdecl;
    function d(P1: Integer): Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJe_157 = class(TJavaGenericImport<Je_157Class, Je_157>) end;

  Jf_158Class = interface(JObjectClass)
  ['{51F0C6B1-768B-4E3D-8166-223433002D1B}']
    { static Property Methods }
    {class} function _Geta: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property a: JCharset read _Geta;
  end;

  [JavaSignature('com/dothantech/h/a/f')]
  Jf_158 = interface(JObject)
  ['{C352B91E-CD1F-4DBA-B159-12256782DABA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJf_158 = class(TJavaGenericImport<Jf_158Class, Jf_158>) end;

  Ja_159Class = interface(JEnumClass) // or JObjectClass
  ['{BF65AE3D-519A-458A-9DFB-E7E70F52D258}']
    { static Property Methods }
    {class} function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getd: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gete: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getf: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getg: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geth: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geti: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getj: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getk: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getl: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getm: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getn: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geto: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getp: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getq: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<Ja>; cdecl;
    {class} function valueOf(P1: JString): Ja; cdecl;

    { static Property }
    {class} property a: Ja read _Geta;
    {class} property b: Ja read _Getb;
    {class} property c: Ja read _Getc;
    {class} property d: Ja read _Getd;
    {class} property e: Ja read _Gete;
    {class} property f: Ja read _Getf;
    {class} property g: Ja read _Getg;
    {class} property h: Ja read _Geth;
    {class} property i: Ja read _Geti;
    {class} property j: Ja read _Getj;
    {class} property k: Ja read _Getk;
    {class} property l: Ja read _Getl;
    {class} property m: Ja read _Getm;
    {class} property n: Ja read _Getn;
    {class} property o: Ja read _Geto;
    {class} property p: Ja read _Getp;
    {class} property q: Ja read _Getq;
  end;

  [JavaSignature('com/dothantech/h/a')]
  Ja_159 = interface(JEnum) // or JObject
  ['{A76D2594-EC09-40BA-8DDF-9D865E96454D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJa_159 = class(TJavaGenericImport<Ja_159Class, Ja_159>) end;

  Ja_160Class = interface(JObjectClass)
  ['{E00F15BA-0687-4467-8268-AF12A9632079}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JString; P2: Jl; P3: Jb; P4: Jb; P5: Boolean): JString; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/a')]
  Ja_160 = interface(JObject)
  ['{6B0C8010-BB02-4A46-9C51-46CDD5ADC03F}']
    { Property Methods }

    { methods }
    procedure a(P1: Jg); cdecl; overload;

    { Property }
  end;

  TJa_160 = class(TJavaGenericImport<Ja_160Class, Ja_160>) end;

  Jb_161Class = interface(JObjectClass)
  ['{106A037E-CE1D-4DC9-919C-F1D4C0E52918}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/b')]
  Jb_161 = interface(JObject)
  ['{DE08EDD9-0805-415C-8D2B-D5F5EB1E0CF7}']
    { Property Methods }

    { methods }
    procedure a(P1: Jg); cdecl;

    { Property }
  end;

  TJb_161 = class(TJavaGenericImport<Jb_161Class, Jb_161>) end;

  Jc_162Class = interface(JObjectClass)
  ['{A473A79B-280E-4DCF-9E64-6909505DE272}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/c')]
  Jc_162 = interface(JObject)
  ['{18675CA3-5018-4A34-A1DE-C646AC2AD5F0}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl; overload;
    procedure a(P1: Jg); cdecl; overload;

    { Property }
  end;

  TJc_162 = class(TJavaGenericImport<Jc_162Class, Jc_162>) end;

  Jd_163Class = interface(Jk_174Class) // or JObjectClass
  ['{8A94DAF6-71A9-4182-898A-ED6DFA6CE5A6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/d')]
  Jd_163 = interface(Jk_174) // or JObject
  ['{714D19B3-1CDB-49D2-91F9-3D97FFA2E9D8}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl; overload;
    function a(P1: Integer): Integer; cdecl; overload;

    { Property }
  end;

  TJd_163 = class(TJavaGenericImport<Jd_163Class, Jd_163>) end;

  Je_164Class = interface(JObjectClass)
  ['{0A762946-C3AA-4F58-9C4B-5A40EDAC047C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/e')]
  Je_164 = interface(JObject)
  ['{B71F1C3D-F419-4F31-9275-ACA24DF27E4C}']
    { Property Methods }

    { methods }
    procedure a(P1: Jg); cdecl;

    { Property }
  end;

  TJe_164 = class(TJavaGenericImport<Je_164Class, Je_164>) end;

  Jf_165Class = interface(JObjectClass)
  ['{19D18840-C594-4605-B201-50604A6D1F55}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/f')]
  Jf_165 = interface(IJavaInstance)
  ['{2C7ECB6E-0FFF-4626-8E8C-EC41629C38E5}']
    { Property Methods }

    { methods }
    procedure a(P1: Jg); cdecl;

    { Property }
  end;

  TJf_165 = class(TJavaGenericImport<Jf_165Class, Jf_165>) end;

  Jg_166Class = interface(JObjectClass)
  ['{7C9C65A1-1B2C-4425-8BC9-8088BDF0C6D3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/g')]
  Jg_166 = interface(JObject)
  ['{4FFC6A85-115B-4B8B-BECC-B4AD514E855B}']
    { Property Methods }

    { methods }
    procedure a(P1: Jl); cdecl; overload;
    procedure a(P1: Jb; P2: Jb); cdecl; overload;
    function a: JString; cdecl; overload;
    procedure a(P1: Integer); cdecl; overload;
    function b: Char; cdecl; overload;
    function c: JStringBuilder; cdecl; overload;
    procedure a(P1: JString); cdecl; overload;
    procedure a(P1: Char); cdecl; overload;
    function d: Integer; cdecl;
    function e: Integer; cdecl;
    procedure b(P1: Integer); cdecl; overload;
    procedure f; cdecl;
    function g: Boolean; cdecl;
    function h: Integer; cdecl;
    function i: Jk; cdecl;
    procedure j; cdecl;
    procedure c(P1: Integer); cdecl; overload;
    procedure k; cdecl;

    { Property }
  end;

  TJg_166 = class(TJavaGenericImport<Jg_166Class, Jg_166>) end;

  Jh_167Class = interface(JObjectClass)
  ['{450907A5-2BBE-4F13-949A-F18B5630E207}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JString; P2: Jk): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/h')]
  Jh_167 = interface(JObject)
  ['{6E93B256-9D57-4AC6-81A4-DD5AA0A8C172}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJh_167 = class(TJavaGenericImport<Jh_167Class, Jh_167>) end;

  Ji_a_168Class = interface(JObjectClass)
  ['{333F5FF8-5BC2-424B-9F2C-231F4C03309D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/i$a')]
  Ji_a_168 = interface(JObject)
  ['{7FB0CDAE-8BC2-439F-BBD7-F7ADDF76FD35}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJi_a_168 = class(TJavaGenericImport<Ji_a_168Class, Ji_a_168>) end;

  Ji_bClass = interface(Je_157Class) // or JObjectClass
  ['{0B4EE5EB-4086-49FE-A01C-906C56DFAFCF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/i$b')]
  Ji_b = interface(Je_157) // or JObject
  ['{66963463-83E4-4C2B-8FF8-C0B261A94B6C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJi_b = class(TJavaGenericImport<Ji_bClass, Ji_b>) end;

  Ji_cClass = interface(JEnumClass) // or JObjectClass
  ['{28643BD9-BD48-423D-9B98-2729F2607CAE}']
    { static Property Methods }
    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function a: TJavaArray<Integer>; cdecl;

    { static Property }
    {class} property a: Integer read _Geta;
    {class} property b: Integer read _Getb;
    {class} property c: Integer read _Getc;
    {class} property d: Integer read _Getd;
    {class} property e: Integer read _Gete;
    {class} property f: Integer read _Getf;
  end;

  [JavaSignature('com/dothantech/h/b/a/i$c')]
  Ji_c = interface(JEnum) // or JObject
  ['{82E6DDE6-B4F5-450B-82CE-C9AECFE0FA93}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJi_c = class(TJavaGenericImport<Ji_cClass, Ji_c>) end;

  Ji_dClass = interface(JObjectClass)
  ['{17C63969-0424-455D-B0A3-3CD4A50B5D3A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/i$d')]
  Ji_d = interface(JObject)
  ['{C75451B4-3C38-47FE-BEB3-F75F2CB5A46C}']
    { Property Methods }

    { methods }
    function a: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJi_d = class(TJavaGenericImport<Ji_dClass, Ji_d>) end;

  Ji_172Class = interface(JObjectClass)
  ['{DCDBD759-8DB7-4265-9D5F-6E5F60FC56AB}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JString; P2: JCharset; P3: Integer; P4: Jl): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/i')]
  Ji_172 = interface(JObject)
  ['{A941AE1D-3419-4E31-8E0E-BBB069D1AC7B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJi_172 = class(TJavaGenericImport<Ji_172Class, Ji_172>) end;

  Jj_173Class = interface(JObjectClass)
  ['{FD948245-91FB-4CC0-9FB3-3CA6124D76D4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/j')]
  Jj_173 = interface(JObject)
  ['{A6E9A844-CCD9-4EDA-B165-BD1E1D87D668}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJj_173 = class(TJavaGenericImport<Jj_173Class, Jj_173>) end;

  Jk_174Class = interface(JObjectClass)
  ['{2EB38005-DD09-4DDE-9F33-250AA17BBE28}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: Integer; P2: Jl; P3: Jb; P4: Jb): Jk; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/k')]
  Jk_174 = interface(JObject)
  ['{F44A39EB-1118-4104-BD01-939345EE34AC}']
    { Property Methods }
    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function b: Integer; cdecl;
    function c: Integer; cdecl;
    function d: Integer; cdecl;
    function e: Integer; cdecl;
    function a: Integer; cdecl; overload;
    function f: Integer; cdecl;
    function g: Integer; cdecl;
    function a(P1: Integer): Integer; cdecl; overload;
    function h: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property a: Integer read _Geta write _Seta;
    property b: Integer read _Getb write _Setb;
  end;

  TJk_174 = class(TJavaGenericImport<Jk_174Class, Jk_174>) end;

  Jl_175Class = interface(JEnumClass) // or JObjectClass
  ['{962FA757-CAB5-4F9C-B193-28D32999064C}']
    { static Property Methods }
    {class} function _Geta: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<Jl>; cdecl;
    {class} function valueOf(P1: JString): Jl; cdecl;

    { static Property }
    {class} property a: Jl read _Geta;
    {class} property b: Jl read _Getb;
    {class} property c: Jl read _Getc;
  end;

  [JavaSignature('com/dothantech/h/b/a/l')]
  Jl_175 = interface(JEnum) // or JObject
  ['{9942E5A2-2D0E-411A-B0AB-13969F6273AF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJl_175 = class(TJavaGenericImport<Jl_175Class, Jl_175>) end;

  Jm_176Class = interface(Jc_162Class) // or JObjectClass
  ['{8B6B66BF-1E53-46A7-8B53-E1877A7ECFF4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/m')]
  Jm_176 = interface(Jc_162) // or JObject
  ['{9FA036C3-8AD8-4079-A3D2-CCA5083F89B5}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl;

    { Property }
  end;

  TJm_176 = class(TJavaGenericImport<Jm_176Class, Jm_176>) end;

  Jn_177Class = interface(Jc_162Class) // or JObjectClass
  ['{50144164-8925-4606-AA52-3FBFFE6D9372}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b/a/n')]
  Jn_177 = interface(Jc_162) // or JObject
  ['{16CC0F25-E1AE-4806-8ABC-B15EAEB1BCD8}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl; overload;
    procedure a(P1: Jg); cdecl; overload;

    { Property }
  end;

  TJn_177 = class(TJavaGenericImport<Jn_177Class, Jn_177>) end;

  Jb_178Class = interface(JObjectClass)
  ['{21A87FE6-78BD-4254-8534-3D397FA2BC7B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/b')]
  Jb_178 = interface(JObject)
  ['{4E000B65-FF3B-42D2-AF06-8A925BF59D3E}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl;
    function b: Integer; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJb_178 = class(TJavaGenericImport<Jb_178Class, Jb_178>) end;

  Ja_179Class = interface(Jk_198Class) // or JObjectClass
  ['{49B9CAE2-9790-4412-97BC-585EA62AFC80}']
    { static Property Methods }

    { static Methods }
    {class} function init: Ja_179; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/a')]
  Ja_179 = interface(Jk_198) // or JObject
  ['{DC23B3D8-4D27-4593-82BF-F2A4530AA7AE}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJa_179 = class(TJavaGenericImport<Ja_179Class, Ja_179>) end;

  Jb_180Class = interface(Jk_198Class) // or JObjectClass
  ['{7C595CBB-BF2D-4922-917D-06175D1975E4}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jb_180; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/b')]
  Jb_180 = interface(Jk_198) // or JObject
  ['{D7218949-4467-48A6-9327-54659665B66C}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJb_180 = class(TJavaGenericImport<Jb_180Class, Jb_180>) end;

  Jc_181Class = interface(Jg_189Class) // or JObjectClass
  ['{2922A504-4089-46B2-9A2A-BD068FFEB40C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/c')]
  Jc_181 = interface(Jg_189) // or JObject
  ['{E1249DDB-BFED-4400-B8EE-234D99A430E7}']
    { Property Methods }

    { methods }
    function a(P1: Char): Boolean; cdecl;

    { Property }
  end;

  TJc_181 = class(TJavaGenericImport<Jc_181Class, Jc_181>) end;

  Jd_a_182Class = interface(Jd_184Class) // or JObjectClass
  ['{CB1E54AE-3701-4A8C-8B1A-67BA090F82F2}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jd_a_182; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/d$a')]
  Jd_a_182 = interface(Jd_184) // or JObject
  ['{2F51AA71-F28C-4731-A3AD-0668C5A5911C}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJd_a_182 = class(TJavaGenericImport<Jd_a_182Class, Jd_a_182>) end;

  Jd_b_183Class = interface(Jd_184Class) // or JObjectClass
  ['{2E3B5834-894F-47CF-8989-7420C37C1BD6}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jd_b_183; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/d$b')]
  Jd_b_183 = interface(Jd_184) // or JObject
  ['{AB3C26FD-5CA3-4CD9-A034-743AF73394A3}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJd_b_183 = class(TJavaGenericImport<Jd_b_183Class, Jd_b_183>) end;

  Jd_184Class = interface(Jk_198Class) // or JObjectClass
  ['{AA637696-2B8A-4395-B932-BAB47911F4BB}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jd_184; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/d')]
  Jd_184 = interface(Jk_198) // or JObject
  ['{B7540542-0AAF-4F07-8739-410FB95F7DC3}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJd_184 = class(TJavaGenericImport<Jd_184Class, Jd_184>) end;

  Je_185Class = interface(Jg_189Class) // or JObjectClass
  ['{CCE2A927-5FD0-4154-871B-FAAC1D58E2F4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/e')]
  Je_185 = interface(Jg_189) // or JObject
  ['{C75246A4-BF26-4E9D-B109-236EE6BCC6B7}']
    { Property Methods }

    { methods }
    function a(P1: Char): Boolean; cdecl;

    { Property }
  end;

  TJe_185 = class(TJavaGenericImport<Je_185Class, Je_185>) end;

  Jf_186Class = interface(Jg_189Class) // or JObjectClass
  ['{DAFD155E-BBE8-4273-82C4-DB5A885D959D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/f')]
  Jf_186 = interface(Jg_189) // or JObject
  ['{B37D7FEC-4EBF-47DD-BB9F-C9AB129F648E}']
    { Property Methods }

    { methods }
    function a(P1: Char): Boolean; cdecl;

    { Property }
  end;

  TJf_186 = class(TJavaGenericImport<Jf_186Class, Jf_186>) end;

  Jg_aClass = interface(Jg_189Class) // or JObjectClass
  ['{06A3C4FE-6FD0-4F78-8F3B-170695DC2523}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jg_a; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/g$a')]
  Jg_a = interface(Jg_189) // or JObject
  ['{DD5912D1-3B89-4CE0-A0FF-4B63954E75A7}']
    { Property Methods }

    { methods }
    function a(P1: Char): Boolean; cdecl;

    { Property }
  end;

  TJg_a = class(TJavaGenericImport<Jg_aClass, Jg_a>) end;

  Jg_bClass = interface(Jg_189Class) // or JObjectClass
  ['{61D5D96A-4271-42CC-809E-383508F356A6}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString): Jg_b; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/g$b')]
  Jg_b = interface(Jg_189) // or JObject
  ['{99963562-3610-4E71-9E75-28CE24985295}']
    { Property Methods }

    { methods }
    function a(P1: Char): Boolean; cdecl;

    { Property }
  end;

  TJg_b = class(TJavaGenericImport<Jg_bClass, Jg_b>) end;

  Jg_189Class = interface(JObjectClass)
  ['{00013929-4C50-42E2-BD51-878C62149E13}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jg_189; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/g')]
  Jg_189 = interface(JObject)
  ['{6A8B5492-FEB0-4AE0-A816-6CCDD91CD1BA}']
    { Property Methods }

    { methods }
    function a(P1: Char): Boolean; cdecl;

    { Property }
  end;

  TJg_189 = class(TJavaGenericImport<Jg_189Class, Jg_189>) end;

  Jh_a_190Class = interface(Jh_191Class) // or JObjectClass
  ['{4D70ED7F-4AFC-4D54-A607-9B73DA11E7FC}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jh_a_190; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/h$a')]
  Jh_a_190 = interface(Jh_191) // or JObject
  ['{E097CA93-97CA-45EA-9B35-0DFEBB36132C}']
    { Property Methods }

    { methods }
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJh_a_190 = class(TJavaGenericImport<Jh_a_190Class, Jh_a_190>) end;

  Jh_191Class = interface(Jm_201Class) // or JObjectClass
  ['{F761FD24-7DE2-47B5-B254-268B2696F8C3}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jh_191; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/h')]
  Jh_191 = interface(Jm_201) // or JObject
  ['{31468C7E-20B8-4F7F-B200-84CECF0D3946}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJh_191 = class(TJavaGenericImport<Jh_191Class, Jh_191>) end;

  Ji_192Class = interface(Jm_201Class) // or JObjectClass
  ['{A6826553-5A25-407B-A072-FE1B8E29AF46}']
    { static Property Methods }

    { static Methods }
    {class} function init: Ji_192; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/i')]
  Ji_192 = interface(Jm_201) // or JObject
  ['{CCF97DCD-11DA-4D24-AF87-367BDB8DB56E}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJi_192 = class(TJavaGenericImport<Ji_192Class, Ji_192>) end;

  Jj_a_193Class = interface(Jj_197Class) // or JObjectClass
  ['{DD5597BB-EF40-4D48-9372-9D4EEE562FD9}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jj_a_193; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/j$a')]
  Jj_a_193 = interface(Jj_197) // or JObject
  ['{6A586F9C-CD93-4A40-9528-2AFEC58813F3}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJj_a_193 = class(TJavaGenericImport<Jj_a_193Class, Jj_a_193>) end;

  Jj_b_194Class = interface(Jj_197Class) // or JObjectClass
  ['{C24363B9-1EC8-470C-BA92-B21D8E90E8D4}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jj_b_194; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/j$b')]
  Jj_b_194 = interface(Jj_197) // or JObject
  ['{E27F9605-F1E7-4BF9-947C-CFD5F59B50AB}']
    { Property Methods }

    { methods }
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJj_b_194 = class(TJavaGenericImport<Jj_b_194Class, Jj_b_194>) end;

  Jj_c_195Class = interface(Jj_197Class) // or JObjectClass
  ['{60E9BB7D-F333-41C1-A1CA-24017B8DB8E1}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jj_c_195; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/j$c')]
  Jj_c_195 = interface(Jj_197) // or JObject
  ['{52CEC98E-9D44-4870-85A1-8F27A060C982}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJj_c_195 = class(TJavaGenericImport<Jj_c_195Class, Jj_c_195>) end;

  Jj_dClass = interface(Jj_197Class) // or JObjectClass
  ['{A62B74A5-D23E-46C9-88AC-0990BEA94762}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jj_d; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/j$d')]
  Jj_d = interface(Jj_197) // or JObject
  ['{0591A638-CAE2-4AC5-81F4-2BFD8E7CC331}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJj_d = class(TJavaGenericImport<Jj_dClass, Jj_d>) end;

  Jj_197Class = interface(Jk_198Class) // or JObjectClass
  ['{40271F29-F2D4-4633-B314-EFFA58C328F8}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jj_197; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/j')]
  Jj_197 = interface(Jk_198) // or JObject
  ['{643C6FB9-BDB7-46CD-8374-0C6D3F37B336}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJj_197 = class(TJavaGenericImport<Jj_197Class, Jj_197>) end;

  Jk_198Class = interface(JObjectClass)
  ['{CC520718-66CE-423B-AF73-EDD2B94F86EE}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jk_198; cdecl;
    {class} function a(P1: Ja; P2: JString; P3: Integer; P4: Char): Jc_a; cdecl; overload;
    {class} function a(P1: Ja; P2: JString; P3: Integer; P4: JString; P5: Char): Jc_a; cdecl; overload;
    {class} function a(P1: Ja; P2: JString; P3: Integer; P4: Jg; P5: Char): Jc_a; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/k')]
  Jk_198 = interface(JObject)
  ['{9E623C77-67BE-4B0B-B445-A92039739BDF}']
    { Property Methods }
    function _Getc: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
    property c: JMap read _Getc write _Setc;
  end;

  TJk_198 = class(TJavaGenericImport<Jk_198Class, Jk_198>) end;

  Jl_199Class = interface(Jk_198Class) // or JObjectClass
  ['{03C4AF0A-BD20-437B-99AC-1F5FE28A5711}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jl_199; cdecl;
    {class} function d(P1: JString): Char; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/l')]
  Jl_199 = interface(Jk_198) // or JObject
  ['{111B06CE-71CA-428C-ADF7-274890892581}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJl_199 = class(TJavaGenericImport<Jl_199Class, Jl_199>) end;

  Jm_aClass = interface(Jm_201Class) // or JObjectClass
  ['{295EEE8C-B854-458A-B81B-95B0710A001F}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jm_a; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/m$a')]
  Jm_a = interface(Jm_201) // or JObject
  ['{33DEA65C-8B4E-4A30-9166-234E43AAD0CB}']
    { Property Methods }

    { methods }
    function a(P1: JString): TJavaArray<Boolean>; cdecl;
    function b(P1: JString): Jc_a; cdecl;

    { Property }
  end;

  TJm_a = class(TJavaGenericImport<Jm_aClass, Jm_a>) end;

  Jm_201Class = interface(Jk_198Class) // or JObjectClass
  ['{CE25AE56-327F-4C7B-99A6-C8A12001DB15}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jm_201; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/c/m')]
  Jm_201 = interface(Jk_198) // or JObject
  ['{55D1406B-F9F8-4B1B-AC87-808412B6E0DA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJm_201 = class(TJavaGenericImport<Jm_201Class, Jm_201>) end;

  Jc_202Class = interface(JEnumClass) // or JObjectClass
  ['{77A33FE8-6D22-41C7-90C0-A0C1F71EC762}']
    { static Property Methods }
    {class} function _Geta: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getd: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gete: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getf: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getg: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geth: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geti: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getj: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getk: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getl: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getm: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getn: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geto: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getp: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getq: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getr: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gets: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<Jc>; cdecl;
    {class} function valueOf(P1: JString): Jc; cdecl;

    { static Property }
    {class} property a: Jc read _Geta;
    {class} property b: Jc read _Getb;
    {class} property c: Jc read _Getc;
    {class} property d: Jc read _Getd;
    {class} property e: Jc read _Gete;
    {class} property f: Jc read _Getf;
    {class} property g: Jc read _Getg;
    {class} property h: Jc read _Geth;
    {class} property i: Jc read _Geti;
    {class} property j: Jc read _Getj;
    {class} property k: Jc read _Getk;
    {class} property l: Jc read _Getl;
    {class} property m: Jc read _Getm;
    {class} property n: Jc read _Getn;
    {class} property o: Jc read _Geto;
    {class} property p: Jc read _Getp;
    {class} property q: Jc read _Getq;
    {class} property r: Jc read _Getr;
    {class} property s: Jc read _Gets;
  end;

  [JavaSignature('com/dothantech/h/c')]
  Jc_202 = interface(JEnum) // or JObject
  ['{E5DD61F7-0EE7-4C53-B96B-0452798D1944}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJc_202 = class(TJavaGenericImport<Jc_202Class, Jc_202>) end;

  Ja_203Class = interface(JEnumClass) // or JObjectClass
  ['{D76B6B59-B2C0-4DC1-8159-9E81A075A00E}']
    { static Property Methods }
    {class} function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<Ja>; cdecl;
    {class} function valueOf(P1: JString): Ja; cdecl;

    { static Property }
    {class} property a: Ja read _Geta;
  end;

  [JavaSignature('com/dothantech/h/d/a/a')]
  Ja_203 = interface(JEnum) // or JObject
  ['{14DEAD58-3843-4092-B5E7-357FAA6EC6EA}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl;

    { Property }
  end;

  TJa_203 = class(TJavaGenericImport<Ja_203Class, Ja_203>) end;

  Jb_204Class = interface(JEnumClass) // or JObjectClass
  ['{117B4D48-EF5F-4327-A7B9-C2C7E85C2A75}']
    { static Property Methods }
    {class} function _Geta: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getd: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gete: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getf: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getg: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<Jb>; cdecl;
    {class} function valueOf(P1: JString): Jb; cdecl;
    {class} function a(P1: Integer): Jb; cdecl; overload;

    { static Property }
    {class} property a: Jb read _Geta;
    {class} property b: Jb read _Getb;
    {class} property c: Jb read _Getc;
    {class} property d: Jb read _Getd;
    {class} property e: Jb read _Gete;
    {class} property f: Jb read _Getf;
    {class} property g: Jb read _Getg;
  end;

  [JavaSignature('com/dothantech/h/d/a/b')]
  Jb_204 = interface(JEnum) // or JObject
  ['{9E034EEA-31A2-4046-AE37-7DCEEA21FDD1}']
    { Property Methods }

    { methods }
    function a(P1: Jc): Integer; cdecl; overload;
    function a: Integer; cdecl; overload;

    { Property }
  end;

  TJb_204 = class(TJavaGenericImport<Jb_204Class, Jb_204>) end;

  Jc_a_205Class = interface(JObjectClass)
  ['{EFA4F5A4-8666-4C11-88A4-D13466B89771}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/a/c$a')]
  Jc_a_205 = interface(JObject)
  ['{5BB37A26-A683-4B9F-9D33-86272F99725A}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl;
    function b: Integer; cdecl;

    { Property }
  end;

  TJc_a_205 = class(TJavaGenericImport<Jc_a_205Class, Jc_a_205>) end;

  Jc_bClass = interface(JObjectClass)
  ['{CD8C99E9-80DF-419E-BC93-89E06BB93A9C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/a/c$b')]
  Jc_b = interface(JObject)
  ['{5B62469D-B659-41E0-8F97-CE4E6D4AA50C}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl;
    function b: Integer; cdecl;
    function c: Integer; cdecl;
    function d: TJavaObjectArray<Jc_a>; cdecl;

    { Property }
  end;

  TJc_b = class(TJavaGenericImport<Jc_bClass, Jc_b>) end;

  Jc_207Class = interface(JObjectClass)
  ['{74BA7272-4E43-48EC-B685-611B7DF0A5B0}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: Integer): Jc; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/a/c')]
  Jc_207 = interface(JObject)
  ['{A1ADA96A-6C97-4B21-8B31-8BF873F60A92}']
    { Property Methods }

    { methods }
    function a: Integer; cdecl; overload;
    function b: Integer; cdecl;
    function c: Integer; cdecl;
    function a(P1: Ja): Jc_b; cdecl; overload;
    function toString: JString; cdecl;

    { Property }
  end;

  TJc_207 = class(TJavaGenericImport<Jc_207Class, Jc_207>) end;

  Ja_208Class = interface(JObjectClass)
  ['{1704923E-7574-438A-9960-88569A94B901}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/b/a')]
  Ja_208 = interface(JObject)
  ['{4AAADF19-DA2E-479F-9B6C-E15E8A85A0F5}']
    { Property Methods }

    { methods }
    function a: TJavaArray<Byte>; cdecl;
    function b: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJa_208 = class(TJavaGenericImport<Ja_208Class, Ja_208>) end;

  Jb_209Class = interface(JObjectClass)
  ['{CC8305F1-4AB7-4587-ADBA-16E18BFA8324}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JString; P2: Ja; P3: JMap): Jac; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/b/b')]
  Jb_209 = interface(JObject)
  ['{7469E3C1-8F7C-4F16-BF94-E0E77A93F461}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJb_209 = class(TJavaGenericImport<Jb_209Class, Jb_209>) end;

  Jc_210Class = interface(JObjectClass)
  ['{D951979B-A222-4112-9C90-A243157CF72F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/b/c')]
  Jc_210 = interface(JObject)
  ['{993C1254-D098-4784-8177-68A918174DE2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJc_210 = class(TJavaGenericImport<Jc_210Class, Jc_210>) end;

  Jd_211Class = interface(JObjectClass)
  ['{DF94CA19-C824-4D8D-994D-0EF5BB162F14}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/b/d')]
  Jd_211 = interface(JObject)
  ['{4DD9E1C1-996E-4D97-A2BD-47267B0012AD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJd_211 = class(TJavaGenericImport<Jd_211Class, Jd_211>) end;

  Je_a_212Class = interface(JObjectClass)
  ['{97E2E254-BE3E-4500-9918-7C3E9D052DAE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/b/e$a')]
  Je_a_212 = interface(JObject)
  ['{1FE05BCD-ED99-4692-B1AB-8FC0E2796578}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJe_a_212 = class(TJavaGenericImport<Je_a_212Class, Je_a_212>) end;

  Je_b_aClass = interface(JObjectClass)
  ['{1FDCC670-1D4D-4003-963B-62A0750B7626}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/b/e$b$a')]
  Je_b_a = interface(JObject)
  ['{62D51D99-E9A6-4EBF-8B0B-98F40E098105}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;

    { Property }
  end;

  TJe_b_a = class(TJavaGenericImport<Je_b_aClass, Je_b_a>) end;

  Je_bClass = interface(JObjectClass)
  ['{F20DE8AA-5248-448D-99E9-5DBDBB94D2E9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/b/e$b')]
  Je_b = interface(JObject)
  ['{DDCED529-470C-4B2A-8EE7-A8F80609A405}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;

    { Property }
  end;

  TJe_b = class(TJavaGenericImport<Je_bClass, Je_b>) end;

  Je_cClass = interface(JEnumClass) // or JObjectClass
  ['{6C9413B9-A1EF-4649-A676-78C996F3A614}']
    { static Property Methods }
    {class} function _Geta: Je_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Je_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Je_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<Je_c>; cdecl;
    {class} function valueOf(P1: JString): Je_c; cdecl;

    { static Property }
    {class} property a: Je_c read _Geta;
    {class} property b: Je_c read _Getb;
    {class} property c: Je_c read _Getc;
  end;

  [JavaSignature('com/dothantech/h/d/b/e$c')]
  Je_c = interface(JEnum) // or JObject
  ['{B42FD067-1FA3-40D9-8809-471766A741E2}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;

    { Property }
  end;

  TJe_c = class(TJavaGenericImport<Je_cClass, Je_c>) end;

  Je_216Class = interface(JObjectClass)
  ['{A8CCB7B7-0444-4890-ACEA-93B39158CFF6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/b/e')]
  Je_216 = interface(JObject)
  ['{F71593C0-8C03-4D3A-AAFE-D0E6D2F1BA00}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJe_216 = class(TJavaGenericImport<Je_216Class, Je_216>) end;

  Jf_217Class = interface(JObjectClass)
  ['{C366CB2A-2AD8-4A59-B21A-880C98D0E121}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d/b/f')]
  Jf_217 = interface(JObject)
  ['{E4395AFD-3450-47B9-83B0-4153F200D2DE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJf_217 = class(TJavaGenericImport<Jf_217Class, Jf_217>) end;

  Jd_218Class = interface(Jf_220Class) // or JObjectClass
  ['{4D3DA8D3-B4A2-45C2-8069-A6EF892D718F}']
    { static Property Methods }

    { static Methods }
    {class} function a: Jd; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/d')]
  Jd_218 = interface(Jf_220) // or JObject
  ['{5B8A28C5-E324-4A63-AF33-55A823F3ED22}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJd_218 = class(TJavaGenericImport<Jd_218Class, Jd_218>) end;

  Je_219Class = interface(JObjectClass)
  ['{0E2F9D8C-A492-448B-8BA1-F97015EE6205}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JString; P2: TJavaArray<Byte>; P3: Integer): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/e')]
  Je_219 = interface(JObject)
  ['{68B8D989-8D85-44F8-BCFC-651AB2F91240}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJe_219 = class(TJavaGenericImport<Je_219Class, Je_219>) end;

  Jf_220Class = interface(JExceptionClass) // or JObjectClass
  ['{80900D70-D52E-4931-ABCB-7BC02E46F851}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/f')]
  Jf_220 = interface(JException) // or JObject
  ['{BECF9E00-55C0-41A2-9E1D-F89C8FBBEF9F}']
    { Property Methods }

    { methods }
    function fillInStackTrace: JThrowable; cdecl;

    { Property }
  end;

  TJf_220 = class(TJavaGenericImport<Jf_220Class, Jf_220>) end;

  Jg_221Class = interface(JExceptionClass) // or JObjectClass
  ['{2CC4CC47-6993-4432-80CD-E898ED8153FF}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jg_221; cdecl; overload;
    {class} function init(P1: JString): Jg_221; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/h/g')]
  Jg_221 = interface(JException) // or JObject
  ['{B9E6A2DF-6CBF-4611-B476-9BBE7022CAF0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJg_221 = class(TJavaGenericImport<Jg_221Class, Jg_221>) end;

  Ja_222Class = interface(JObjectClass)
  ['{B755C62B-8C9E-4ADF-B3A5-EA2A673EFCC7}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JIDzPrinter): Ja_222; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/a')]
  Ja_222 = interface(JObject)
  ['{2A14A1F7-32D3-48E2-B133-1674719D08C4}']
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
    function a: JList; cdecl;
    function startPage: Integer; cdecl;
    function endPage: Integer; cdecl;
    procedure setDPI(P1: Integer); cdecl;
    procedure setDrawParam(P1: JString; P2: JObject); cdecl;
    function setItemOrientation(P1: Integer): Integer; cdecl;
    function getItemOrientation: Integer; cdecl;
    function setItemHorizontalAlignment(P1: Integer): Integer; cdecl;
    function getItemHorizontalAlignment: Integer; cdecl;
    function setItemVerticalAlignment(P1: Integer): Integer; cdecl;
    function getItemVerticalAlignment: Integer; cdecl;
    function setItemPenAlignment(P1: Integer): Integer; cdecl;
    function getItemPenAlignment: Integer; cdecl;
    function getStrPrintSize(P1: JString; P2: Integer; P3: Integer): JPoint; cdecl;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Single): Integer; cdecl; overload;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Single; P9: Boolean; P10: Boolean): Integer; cdecl; overload;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
    function drawRichText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl;
    function draw1DBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;
    function draw1DBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function draw2DQRCode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function draw2DQRCode(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
    function draw2DPdf417(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    function draw2DDataMatrix(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function draw2DDataMatrix(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
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
    function drawImage(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function drawImage(P1: JString; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function measureFontHeight(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Single): Integer; cdecl;

    { Property }
  end;

  TJa_222 = class(TJavaGenericImport<Ja_222Class, Ja_222>) end;

  Jb_223Class = interface(JThreadClass) // or JObjectClass
  ['{3081A880-9C18-4772-88E1-A250CF1B98BA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/b')]
  Jb_223 = interface(JThread) // or JObject
  ['{AA93CA82-D722-4890-8711-EAC3B342E534}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJb_223 = class(TJavaGenericImport<Jb_223Class, Jb_223>) end;

  JIAtBitmap_BarcodeType1DClass = interface(JObjectClass)
  ['{2F9C9EDD-28B9-4651-974D-555C6AFB1AEF}']
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
    {class} function _GetCODE128_A: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE128_B: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE128_C: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISBN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetECODE39: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JIAtBitmap_BarcodeType1D; cdecl;

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
    {class} property CODE128_A: Integer read _GetCODE128_A;
    {class} property CODE128_B: Integer read _GetCODE128_B;
    {class} property CODE128_C: Integer read _GetCODE128_C;
    {class} property ISBN: Integer read _GetISBN;
    {class} property ECODE39: Integer read _GetECODE39;
    {class} property AUTO: Integer read _GetAUTO;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$BarcodeType1D')]
  JIAtBitmap_BarcodeType1D = interface(JObject)
  ['{3253322D-1191-4B75-ADF1-E8EA61173BD6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_BarcodeType1D = class(TJavaGenericImport<JIAtBitmap_BarcodeType1DClass, JIAtBitmap_BarcodeType1D>) end;

  JIAtBitmap_DrawParamNameClass = interface(JObjectClass)
  ['{2AA8F587-E49B-4F2F-93F0-18234CAC29F3}']
    { static Property Methods }
    {class} function _GetFONT_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCODE_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_CORRECTION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHARACTER_SET: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMARGIN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetANTI_COLOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFONT_WRAP: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property FONT_NAME: JString read _GetFONT_NAME;
    {class} property QRCODE_VERSION: JString read _GetQRCODE_VERSION;
    {class} property ERROR_CORRECTION: JString read _GetERROR_CORRECTION;
    {class} property CHARACTER_SET: JString read _GetCHARACTER_SET;
    {class} property MARGIN: JString read _GetMARGIN;
    {class} property ANTI_COLOR: JString read _GetANTI_COLOR;
    {class} property FONT_WRAP: JString read _GetFONT_WRAP;
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$DrawParamName')]
  JIAtBitmap_DrawParamName = interface(IJavaInstance)
  ['{421736AE-8635-40C3-8D80-E8F1366DBF02}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_DrawParamName = class(TJavaGenericImport<JIAtBitmap_DrawParamNameClass, JIAtBitmap_DrawParamName>) end;

  JIAtBitmap_ErrorCorrectionLevelClass = interface(JObjectClass)
  ['{9278225E-EA37-409C-A20B-E83F15C8A97A}']
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
  ['{3C00E571-323D-44B7-BECB-8AE72106F145}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_ErrorCorrectionLevel = class(TJavaGenericImport<JIAtBitmap_ErrorCorrectionLevelClass, JIAtBitmap_ErrorCorrectionLevel>) end;

  JIAtBitmap_FactoryClass = interface(JObjectClass)
  ['{65F64C1C-7B87-4C81-B2FB-51866528DB97}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIAtBitmap_Factory; cdecl;
    {class} function createInstance: JIAtBitmap; cdecl; overload;
    {class} function createInstance(P1: JIDzPrinter): JIAtBitmap; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$Factory')]
  JIAtBitmap_Factory = interface(JObject)
  ['{1E9594D8-3D2F-4C25-835F-F30D47E7E9E0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_Factory = class(TJavaGenericImport<JIAtBitmap_FactoryClass, JIAtBitmap_Factory>) end;

  JIAtBitmap_FontStyleClass = interface(JObjectClass)
  ['{25D2D0D9-1198-4CBD-90E2-07037CA299F6}']
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
  ['{A0D62038-5879-4028-95CD-2733DD13902A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_FontStyle = class(TJavaGenericImport<JIAtBitmap_FontStyleClass, JIAtBitmap_FontStyle>) end;

  JIAtBitmap_ItemAlignmentClass = interface(JObjectClass)
  ['{5E97DE91-FB57-47B9-B65B-ADB1F1DD5608}']
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
  ['{5CEB95FC-0E7A-473E-8F66-9A4F2DE3BA14}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_ItemAlignment = class(TJavaGenericImport<JIAtBitmap_ItemAlignmentClass, JIAtBitmap_ItemAlignment>) end;

  JIAtBitmap_LabelScaleUnitClass = interface(JObjectClass)
  ['{329A882B-FF06-4CD1-AAAB-332359B864EF}']
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
  ['{6B7DAF98-E7BD-4B6B-926E-9A912E02F7C7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_LabelScaleUnit = class(TJavaGenericImport<JIAtBitmap_LabelScaleUnitClass, JIAtBitmap_LabelScaleUnit>) end;

  JIAtBitmap_PenAlignmentClass = interface(JObjectClass)
  ['{DD5D9FD5-79C9-4C31-A404-25E455189142}']
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
  ['{BF499F77-DB4B-4DE3-96A2-E8A2CED631B4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_PenAlignment = class(TJavaGenericImport<JIAtBitmap_PenAlignmentClass, JIAtBitmap_PenAlignment>) end;

  JIAtBitmap_ResultCodeClass = interface(JObjectClass)
  ['{3AB829E6-3A3C-45F0-8EB9-C78426FCC62E}']
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
  ['{783C4811-2E19-4229-AD43-2DDCE69A6AA4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_ResultCode = class(TJavaGenericImport<JIAtBitmap_ResultCodeClass, JIAtBitmap_ResultCode>) end;

  JIAtBitmapClass = interface(JObjectClass)
  ['{BECC0436-1A7F-4AAE-83C1-407DC6C89E90}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap')]
  JIAtBitmap = interface(IJavaInstance)
  ['{4EA80E16-D7D6-4959-B9C7-2EB845E89DD6}']
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
    procedure setDPI(P1: Integer); cdecl;
    procedure setDrawParam(P1: JString; P2: JObject); cdecl;
    function setItemOrientation(P1: Integer): Integer; cdecl;
    function getItemOrientation: Integer; cdecl;
    function setItemHorizontalAlignment(P1: Integer): Integer; cdecl;
    function getItemHorizontalAlignment: Integer; cdecl;
    function setItemVerticalAlignment(P1: Integer): Integer; cdecl;
    function getItemVerticalAlignment: Integer; cdecl;
    function setItemPenAlignment(P1: Integer): Integer; cdecl;
    function getItemPenAlignment: Integer; cdecl;
    function getStrPrintSize(P1: JString; P2: Integer; P3: Integer): JPoint; cdecl;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Single; P9: Boolean; P10: Boolean): Integer; cdecl; overload;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Single): Integer; cdecl; overload;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
    function drawText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function drawRichText(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl;
    function draw1DBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;
    function draw1DBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function draw2DQRCode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function draw2DQRCode(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
    function draw2DPdf417(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
    function draw2DDataMatrix(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function draw2DDataMatrix(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
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
    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer): Integer; cdecl; overload;
    function drawBitmap(P1: JInputStream; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
    function measureFontHeight(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Single): Integer; cdecl;

    { Property }
  end;

  TJIAtBitmap = class(TJavaGenericImport<JIAtBitmapClass, JIAtBitmap>) end;

  JLPAPI_1Class = interface(JObjectClass)
  ['{E990E5D6-C316-4831-81B6-8DD409B6D4EF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$1')]
  JLPAPI_1 = interface(JObject)
  ['{3CEE4106-3613-4EA5-9E25-D5240B023A4E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_1 = class(TJavaGenericImport<JLPAPI_1Class, JLPAPI_1>) end;

  JLPAPI_BarcodeTypeClass = interface(JIAtBitmap_BarcodeType1DClass) // or JObjectClass
  ['{0424EE48-26ED-47A2-9CFD-972AB3DD2B5C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLPAPI_BarcodeType; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$BarcodeType')]
  JLPAPI_BarcodeType = interface(JIAtBitmap_BarcodeType1D) // or JObject
  ['{3564193A-4A48-4371-A5DD-C700EB51BDF4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_BarcodeType = class(TJavaGenericImport<JLPAPI_BarcodeTypeClass, JLPAPI_BarcodeType>) end;

  JLPAPI_CallbackClass = interface(JObjectClass)
  ['{553C20A3-D9B2-449A-BCA2-53BD6F0EE7FA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$Callback')]
  JLPAPI_Callback = interface(IJavaInstance)
  ['{989B65E9-FF5C-48DE-87D5-D556EF74FFBA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_Callback = class(TJavaGenericImport<JLPAPI_CallbackClass, JLPAPI_Callback>) end;

  JLPAPI_FactoryClass = interface(JObjectClass)
  ['{72B2FBEA-00D4-44FC-846A-850D2B8D9EFA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLPAPI_Factory; cdecl;
    {class} function getPrinterAddress(P1: JBluetoothDevice): JIDzPrinter_PrinterAddress; cdecl;
    {class} function hasWaterMark(P1: JString; P2: TJavaArray<Byte>; P3: Integer): Boolean; cdecl;
    {class} function createInstance: JLPAPI; cdecl; overload;
    {class} function createInstance(P1: JLPAPI_Callback): JLPAPI; cdecl; overload;
    {class} function createInstance(P1: JBundle; P2: JLPAPI_Callback): JLPAPI; cdecl; overload;
    {class} function createInstance(P1: JWebView): JLPAPI; cdecl; overload;
    {class} function createInstance(P1: JWebView; P2: JLPAPI_Callback): JLPAPI; cdecl; overload;
    {class} function createInstance(P1: JWebView; P2: JString; P3: JLPAPI_Callback): JLPAPI; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$Factory')]
  JLPAPI_Factory = interface(JObject)
  ['{02C6BA20-B85C-4F87-BD6C-6E605C6B344D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_Factory = class(TJavaGenericImport<JLPAPI_FactoryClass, JLPAPI_Factory>) end;

  JLPAPI_FontStyleClass = interface(JObjectClass)
  ['{1B08B451-E01B-4E4E-BA51-E2E1EC56DDA4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$FontStyle')]
  JLPAPI_FontStyle = interface(IJavaInstance)
  ['{DF0FB4C8-9A6D-4F9E-8164-D73173028768}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_FontStyle = class(TJavaGenericImport<JLPAPI_FontStyleClass, JLPAPI_FontStyle>) end;

  JLPAPI_ItemAlignmentClass = interface(JObjectClass)
  ['{183241BE-C33A-4B1E-B8AF-3702CF7D0EF4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$ItemAlignment')]
  JLPAPI_ItemAlignment = interface(IJavaInstance)
  ['{C04CF980-3863-438C-BF1E-BC7C0CFCA8ED}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_ItemAlignment = class(TJavaGenericImport<JLPAPI_ItemAlignmentClass, JLPAPI_ItemAlignment>) end;

  JLPAPI_PenAlignmentClass = interface(JObjectClass)
  ['{DCC17D16-C1F8-4A14-85BD-D3D71D764C0C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$PenAlignment')]
  JLPAPI_PenAlignment = interface(IJavaInstance)
  ['{A68BA909-A7F8-4ACD-A502-D2497C5B5C30}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_PenAlignment = class(TJavaGenericImport<JLPAPI_PenAlignmentClass, JLPAPI_PenAlignment>) end;

  JLPAPI_PrintParamNameClass = interface(JObjectClass)
  ['{7C34985B-AE0D-4112-A6CC-21F7D064F901}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$PrintParamName')]
  JLPAPI_PrintParamName = interface(IJavaInstance)
  ['{49D0CA57-EFC2-4383-8010-62870F3C03C9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_PrintParamName = class(TJavaGenericImport<JLPAPI_PrintParamNameClass, JLPAPI_PrintParamName>) end;

  JLPAPI_PrintParamValueClass = interface(JObjectClass)
  ['{246049B9-48FA-4358-9FDD-0B965805B6E8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$PrintParamValue')]
  JLPAPI_PrintParamValue = interface(IJavaInstance)
  ['{298AA0F6-78FA-49ED-A8AF-F7D56314D37C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_PrintParamValue = class(TJavaGenericImport<JLPAPI_PrintParamValueClass, JLPAPI_PrintParamValue>) end;

  JLPAPIClass = interface(JObjectClass)
  ['{ADDAB49B-CA1C-4B0C-AE2B-4CFE0680F757}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI')]
  JLPAPI = interface(JObject)
  ['{82940678-8EC8-4970-B803-A6035E36154B}']
    { Property Methods }

    { methods }
    function discovery: Boolean; cdecl;
    procedure stopDiscovery; cdecl;
    function isDeviceSupported(P1: JBluetoothDevice; P2: JString): Boolean; cdecl;
    function isPrinterSupported(P1: JString; P2: JString): Boolean; cdecl;
    function getAllPrinters(P1: JString): JString; cdecl;
    function getAllPrinterAddresses(P1: JString): JList; cdecl;
    function getFirstPrinter(P1: JString): JString; cdecl;
    function getFirstPrinterAddress(P1: JString): JIDzPrinter_PrinterAddress; cdecl;
    function openPrinter(P1: JString): Boolean; cdecl; overload;
    function openPrinter(P1: JBluetoothDevice): Boolean; cdecl; overload;
    function openPrinterByAddress(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl;
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
    procedure setPrintPageGapType(P1: Integer); cdecl;
    procedure setPrintPageGapLength(P1: Integer); cdecl;
    procedure setPrintDarkness(P1: Integer); cdecl;
    procedure setPrintSpeed(P1: Integer); cdecl;
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
    function drawText(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double): Boolean; cdecl; overload;
    function drawText(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer): Boolean; cdecl; overload;
    function drawTextRegular(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer): Boolean; cdecl; overload;
    function drawTextRegular(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Single): Boolean; cdecl; overload;
    function drawRichText(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer): Boolean; cdecl;
    function drawTextWithIndent(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Single): Boolean; cdecl;
    function drawTextWithScale(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Integer; P8: Single; P9: Boolean): Boolean; cdecl;
    function measureFontHeight(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Double; P7: Single): Double; cdecl;
    function draw1DBarcode(P1: JString; P2: Integer; P3: Double; P4: Double; P5: Double; P6: Double; P7: Double): Boolean; cdecl;
    function draw2DQRCode(P1: JString; P2: Double; P3: Double; P4: Double): Boolean; cdecl;
    function draw2DDataMatrix(P1: JString; P2: Double; P3: Double; P4: Double): Boolean; cdecl;
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
    function drawImage(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double): Boolean; cdecl;
    function drawImageWithActualSize(P1: JString; P2: Double; P3: Double): Boolean; cdecl;
    function drawImageWithThreshold(P1: JString; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer): Boolean; cdecl;
    function drawBitmap(P1: JBitmap; P2: Double; P3: Double; P4: Double; P5: Double): Boolean; cdecl;
    function drawBitmapWithActualSize(P1: JBitmap; P2: Double; P3: Double): Boolean; cdecl;
    function drawBitmapWithThreshold(P1: JBitmap; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer): Boolean; cdecl;
    function drawBitmapStream(P1: JInputStream; P2: Double; P3: Double; P4: Double; P5: Double): Boolean; cdecl;
    function drawBitmapStreamWithActualSize(P1: JInputStream; P2: Double; P3: Double): Boolean; cdecl;
    function drawBitmapStreamWithThreshold(P1: JInputStream; P2: Double; P3: Double; P4: Double; P5: Double; P6: Integer): Boolean; cdecl;

    { Property }
  end;

  TJLPAPI = class(TJavaGenericImport<JLPAPIClass, JLPAPI>) end;

  Ja_244Class = interface(JObjectClass)
  ['{B9025040-7FE6-483A-96CC-BB68A6E20B81}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/a')]
  Ja_244 = interface(JObject)
  ['{19A17BDA-F6A5-4631-B1D2-F4DA6D1C1EE3}']
    { Property Methods }

    { methods }
    procedure onProgress(P1: JIDzPrinter_GeneralProgress; P2: JObject); cdecl;

    { Property }
  end;

  TJa_244 = class(TJavaGenericImport<Ja_244Class, Ja_244>) end;

  Jaa_245Class = interface(JObjectClass)
  ['{12D46BC8-4F33-4AE8-98FB-C84F034AFF74}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/aa')]
  Jaa_245 = interface(IJavaInstance)
  ['{874982FE-9CF1-4381-BFC2-55A075916590}']
    { Property Methods }

    { methods }
    function a: JList; cdecl;

    { Property }
  end;

  TJaa_245 = class(TJavaGenericImport<Jaa_245Class, Jaa_245>) end;

  Jab_246Class = interface(JObjectClass)
  ['{870C9620-AC8F-4AD5-BDFB-1686882B843B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/ab')]
  Jab_246 = interface(IJavaInstance)
  ['{CCCE2490-2721-44D8-8169-41B8FBD79FFC}']
    { Property Methods }

    { methods }
    function a: Jh_a; cdecl;

    { Property }
  end;

  TJab_246 = class(TJavaGenericImport<Jab_246Class, Jab_246>) end;

  Jac_aClass = interface(JObjectClass)
  ['{AD2C2588-125E-49C4-B4F0-D887E02FE0A7}']
    { static Property Methods }
    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geti: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property a: Integer read _Geta;
    {class} property b: Integer read _Getb;
    {class} property c: Integer read _Getc;
    {class} property d: Integer read _Getd;
    {class} property e: Integer read _Gete;
    {class} property f: Integer read _Getf;
    {class} property g: Integer read _Getg;
    {class} property h: Integer read _Geth;
    {class} property i: Integer read _Geti;
    {class} property j: Integer read _Getj;
    {class} property k: Integer read _Getk;
    {class} property l: Integer read _Getl;
    {class} property m: Integer read _Getm;
  end;

  [JavaSignature('com/dothantech/printer/ac$a')]
  Jac_a = interface(JObject)
  ['{9A512A96-44C7-497C-8E17-C4C67FE0E1D7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJac_a = class(TJavaGenericImport<Jac_aClass, Jac_a>) end;

  Jac_248Class = interface(JObjectClass)
  ['{3EFF9851-368C-406A-B0B6-6ABBB7AB11EC}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jac_248; cdecl;
    {class} function b(P1: Integer): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/ac')]
  Jac_248 = interface(JObject)
  ['{B5FFAEDE-F5CA-4885-AAC3-7CCAC2AA0239}']
    { Property Methods }

    { methods }
    function a: Ja; cdecl; overload;
    function toString: JString; cdecl;
    procedure a(P1: Jb); cdecl; overload;
    procedure a(P1: Ja); cdecl; overload;
    procedure a(P1: Jc); cdecl; overload;
    procedure a(P1: Integer); cdecl; overload;
    procedure a(P1: Ja); cdecl; overload;

    { Property }
  end;

  TJac_248 = class(TJavaGenericImport<Jac_248Class, Jac_248>) end;

  Jb_249Class = interface(JObjectClass)
  ['{6303F9FA-E63B-4AA1-9039-607EFA8E4BC5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/b')]
  Jb_249 = interface(JObject)
  ['{7F8631A0-D4C9-4F0B-BD25-3BDE5148F15A}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJb_249 = class(TJavaGenericImport<Jb_249Class, Jb_249>) end;

  Jc_250Class = interface(JHandlerClass) // or JObjectClass
  ['{8557BD5C-CF45-47F0-9F63-D85740669F69}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/c')]
  Jc_250 = interface(JHandler) // or JObject
  ['{EB0D691B-505C-4381-9F65-5387209F17EA}']
    { Property Methods }

    { methods }
    procedure handleMessage(P1: JMessage); cdecl;

    { Property }
  end;

  TJc_250 = class(TJavaGenericImport<Jc_250Class, Jc_250>) end;

  Jd_251Class = interface(JObjectClass)
  ['{60D6A547-2791-44B2-BE97-F9B37C39EE97}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/d')]
  Jd_251 = interface(JObject)
  ['{C939F1DD-CE0B-4D87-952C-BB12A59E5381}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJd_251 = class(TJavaGenericImport<Jd_251Class, Jd_251>) end;

  JDzPrinter_aClass = interface(JDzPrinter_bClass) // or JObjectClass
  ['{8C0C4118-C977-498C-BD60-CAB0F008C739}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/DzPrinter$a')]
  JDzPrinter_a = interface(JDzPrinter_b) // or JObject
  ['{4B437F9F-D514-454E-A6E4-6DFE8A001693}']
    { Property Methods }
    function _Geta: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JIDzPrinter_AddressType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function a: JIDzPrinter_PrinterAddress; cdecl;

    { Property }
    property a: JIDzPrinter_AddressType read _Geta write _Seta;
  end;

  TJDzPrinter_a = class(TJavaGenericImport<JDzPrinter_aClass, JDzPrinter_a>) end;

  JDzPrinter_bClass = interface(JObjectClass)
  ['{80511519-EAD1-43DF-BDD1-8BC02FF0D8CF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/DzPrinter$b')]
  JDzPrinter_b = interface(JObject)
  ['{49A400EB-9137-4A15-AEF6-E54B7AFA3480}']
    { Property Methods }
    function _Getb: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: JIDzPrinter_IActionCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JIDzPrinter_IActionCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property b: JObject read _Getb write _Setb;
    property c: JIDzPrinter_IActionCallback read _Getc write _Setc;
  end;

  TJDzPrinter_b = class(TJavaGenericImport<JDzPrinter_bClass, JDzPrinter_b>) end;

  JDzPrinter_cClass = interface(JDzPrinter_bClass) // or JObjectClass
  ['{90F66F98-8C97-4A47-9DDB-59FC738C9A29}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBitmap; P2: JBundle; P3: JIDzPrinter_IActionCallback): JDzPrinter_c; cdecl; overload;
    {class} function init(P1: Jab; P2: JBundle; P3: JIDzPrinter_IActionCallback): JDzPrinter_c; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/DzPrinter$c')]
  JDzPrinter_c = interface(JDzPrinter_b) // or JObject
  ['{163CE7A8-66D9-4363-81FB-1B806FF18976}']
    { Property Methods }
    function _Geta: JBundle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JBundle);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property a: JBundle read _Geta write _Seta;
  end;

  TJDzPrinter_c = class(TJavaGenericImport<JDzPrinter_cClass, JDzPrinter_c>) end;

  JDzPrinter_dClass = interface(JDzPrinter_bClass) // or JObjectClass
  ['{C7F33E54-7CA4-4D17-A6D7-54B05C2753A6}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Jh_a; P2: JIDzPrinter_IActionCallback): JDzPrinter_d; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/DzPrinter$d')]
  JDzPrinter_d = interface(JDzPrinter_b) // or JObject
  ['{F91A89C8-B888-497E-ACB3-18EAAC9D9433}']
    { Property Methods }

    { methods }
    function a: Jh_a; cdecl;

    { Property }
  end;

  TJDzPrinter_d = class(TJavaGenericImport<JDzPrinter_dClass, JDzPrinter_d>) end;

  JDzPrinter_eClass = interface(JDzPrinter_bClass) // or JObjectClass
  ['{9DA8A7C9-A19D-4C31-9D1B-7D8CEE01E218}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/DzPrinter$e')]
  JDzPrinter_e = interface(JDzPrinter_b) // or JObject
  ['{398C2586-2907-4310-A143-B1BDB893E063}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzPrinter_e = class(TJavaGenericImport<JDzPrinter_eClass, JDzPrinter_e>) end;

  JDzPrinter_fClass = interface(JObjectClass)
  ['{7470FD4A-C96A-475E-B54D-C884439823F1}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JDzPrinter; P2: JString; P3: JString): JDzPrinter_f; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/DzPrinter$f')]
  JDzPrinter_f = interface(JObject)
  ['{DCA60557-2AFE-4D69-908D-830AE511777D}']
    { Property Methods }
    function _Geta: JIDzPrinter_PrinterAddress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JIDzPrinter_PrinterAddress);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property a: JIDzPrinter_PrinterAddress read _Geta write _Seta;
    property b: JString read _Getb write _Setb;
  end;

  TJDzPrinter_f = class(TJavaGenericImport<JDzPrinter_fClass, JDzPrinter_f>) end;

  JDzPrinter_gClass = interface(JObjectClass)
  ['{9E278BC5-787C-49F1-B746-3C3DD81B925D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/DzPrinter$g')]
  JDzPrinter_g = interface(JObject)
  ['{1914FBC6-3512-4977-8B37-92DE58D33497}']
    { Property Methods }
    function _Geta: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure a; cdecl; overload;
    procedure b; cdecl;
    procedure a(P1: JIDzPrinter_PrinterAddress; P2: Boolean); cdecl; overload;
    procedure c; cdecl;

    { Property }
    property a: JMap read _Geta write _Seta;
  end;

  TJDzPrinter_g = class(TJavaGenericImport<JDzPrinter_gClass, JDzPrinter_g>) end;

  JDzPrinter_hClass = interface(Jc_143Class) // or JObjectClass
  ['{B76A49B6-8F22-487F-B8DE-572C6C2EA789}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JDzPrinter_h; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/DzPrinter$h')]
  JDzPrinter_h = interface(Jc_143) // or JObject
  ['{93628384-CA8A-4D0B-A76B-FEDD1650B79A}']
    { Property Methods }

    { methods }
    function c(P1: JUsbDevice): Boolean; cdecl;

    { Property }
  end;

  TJDzPrinter_h = class(TJavaGenericImport<JDzPrinter_hClass, JDzPrinter_h>) end;

  JDzPrinterClass = interface(JawClass) // or JObjectClass
  ['{D7B8F7D4-1885-4676-9919-2222B2EDBD03}']
    { static Property Methods }
    {class} function _Getc: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function e: Boolean; cdecl;
    {class} procedure a(P1: Boolean); cdecl; overload;
    {class} function getInstance: JIDzPrinter2; cdecl;
    {class} function a(P1: JBundle): JIDzPrinter2; cdecl; overload;
    {class} function f: Jc; cdecl;
    {class} function a(P1: JIntent): JInteger; cdecl; overload;

    { static Property }
    {class} property c: Jw read _Getc;
  end;

  [JavaSignature('com/dothantech/printer/DzPrinter')]
  JDzPrinter = interface(Jaw) // or JObject
  ['{EC1CB22C-6026-4262-BC45-F7A596A84717}']
    { Property Methods }

    { methods }
    function init(P1: JContext; P2: JIDzPrinter_IDzPrinterCallback): Boolean; cdecl;
    procedure quit; cdecl;
    function discovery: Boolean; cdecl; overload;
    function discovery(P1: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function discovery(P1: JIDzPrinter_AddressType): Boolean; cdecl; overload;
    function discovery(P1: JIDzPrinter_AddressType; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function connect(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl; overload;
    function connect(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function connect(P1: JBluetoothDevice): Boolean; cdecl; overload;
    function connect(P1: JBluetoothDevice; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function connect(P1: JString): Boolean; cdecl; overload;
    function connect(P1: JString; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function connectSync(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl; overload;
    function connectSync(P1: JString): Boolean; cdecl; overload;
    procedure disconnect; cdecl;
    function reconnect: Boolean; cdecl; overload;
    function reconnect(P1: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function reconnectSync: Boolean; cdecl;
    function getPrinterState: JIDzPrinter_PrinterState; cdecl;
    function generatePageKey: Integer; cdecl;
    function print(P1: JBitmap; P2: JBundle): Boolean; cdecl; overload;
    function print(P1: JBitmap; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function print(P1: Jaa; P2: JBundle): Boolean; cdecl; overload;
    function print(P1: Jaa; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function print(P1: Jab; P2: JBundle): Boolean; cdecl; overload;
    function print(P1: Jab; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function command(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
    function command(P1: TJavaArray<Byte>; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function upgrade(P1: JString): Boolean; cdecl; overload;
    function upgrade(P1: JString; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    procedure cancel; cdecl; overload;
    procedure cancel(P1: Integer); cdecl; overload;
    function bond(P1: JString): Boolean; cdecl; overload;
    function bond(P1: JString; P2: JString): Boolean; cdecl; overload;
    function onNfcDiscovery(P1: JIntent): Boolean; cdecl;
    function getPrinterCapability: Jb_a; cdecl;
    function getPrinterParam: JIDzPrinter2_PrinterParam; cdecl;
    function getPrinterInfo: JIDzPrinter_PrinterInfo; cdecl;
    function getDiscoveriedPrinterAddresses: JList; cdecl;
    function waitPrinterState(P1: JIDzPrinter_PrinterState; P2: Int64): Boolean; cdecl;
    function refreshPrinterParam: Boolean; cdecl;
    function setPrinterParam(P1: JBundle): Boolean; cdecl; overload;
    function setPrinterParam(P1: JBundle; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function sendDataPackage(P1: Jh_a): Boolean; cdecl; overload;
    function sendDataPackage(P1: Jh_a; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function startDeviceDiscovery(P1: JIDzPrinter_AddressType): Boolean; cdecl; overload;
    function startDeviceDiscovery(P1: JIDzPrinter_AddressType; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    procedure onProgressInfo(P1: JIDzPrinter_ProgressInfo; P2: JObject); cdecl;
    procedure onStateChange(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrinterState); cdecl;
    procedure onPrintProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrintData; P3: JIDzPrinter_PrintProgress; P4: JObject); cdecl;
    procedure onPrinterDiscovery(P1: JIDzPrinter_PrinterAddress; P2: JObject); cdecl;
    procedure onBondProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onSetParamProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onSendDataProgress(P1: Jh_a; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onPrinterParamChanged(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter2_PrinterParam; P3: JIDzPrinter2_PrinterParam); cdecl;
    function a: Boolean; cdecl; overload;

    { Property }
  end;

  TJDzPrinter = class(TJavaGenericImport<JDzPrinterClass, JDzPrinter>) end;

  Je_261Class = interface(JObjectClass)
  ['{AC118315-39EC-4151-BCDA-7B2AAB80F029}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/e')]
  Je_261 = interface(JObject)
  ['{582AFB1B-5B31-4B96-AE98-078DD6781E3B}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJe_261 = class(TJavaGenericImport<Je_261Class, Je_261>) end;

  Jf_262Class = interface(JObjectClass)
  ['{F5D69B26-F2C9-45A8-90AD-8511FDED81E0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/f')]
  Jf_262 = interface(JObject)
  ['{04251277-68A9-464E-A317-2044C3B039FC}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJf_262 = class(TJavaGenericImport<Jf_262Class, Jf_262>) end;

  Jg_263Class = interface(JObjectClass)
  ['{0D1AACFD-1A91-42C7-95C3-3666AD7A32FA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/g')]
  Jg_263 = interface(JObject)
  ['{7B438FFE-0AAE-479A-813A-E55364C3A2CD}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJg_263 = class(TJavaGenericImport<Jg_263Class, Jg_263>) end;

  Jh_264Class = interface(JObjectClass)
  ['{FD337B3F-5927-4D7D-A06B-7EFC2E4F3C55}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/h')]
  Jh_264 = interface(JObject)
  ['{5559EEAD-1357-429C-B69E-2D26E3BFBB88}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJh_264 = class(TJavaGenericImport<Jh_264Class, Jh_264>) end;

  Ji_265Class = interface(JObjectClass)
  ['{3E595D1D-2766-4752-B009-1DF0F26E3E49}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/i')]
  Ji_265 = interface(JObject)
  ['{CBE4A3E1-C794-41A8-8B9D-60A9DE8C1B6D}']
    { Property Methods }

    { methods }
    procedure onLeScan(P1: JBluetoothDevice; P2: Integer; P3: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJi_265 = class(TJavaGenericImport<Ji_265Class, Ji_265>) end;

  JIDzPrinter_1Class = interface(JObjectClass)
  ['{11BEA117-221C-4025-A216-DBABCFE759E5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$1')]
  JIDzPrinter_1 = interface(JObject)
  ['{DBE04618-9686-4F69-AB52-819804501122}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_1 = class(TJavaGenericImport<JIDzPrinter_1Class, JIDzPrinter_1>) end;

  JIDzPrinter_AddressTypeClass = interface(JEnumClass) // or JObjectClass
  ['{78112B35-0B84-468A-A0CC-16714DA71F09}']
    { static Property Methods }
    {class} function _GetSPP: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBLE: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUAL: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWiFi: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUSB: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JIDzPrinter_AddressType>; cdecl;
    {class} function valueOf(P1: JString): JIDzPrinter_AddressType; cdecl; overload;
    {class} function value(P1: JIDzPrinter_AddressType): Integer; cdecl; overload;
    {class} function valueOf(P1: Byte): JIDzPrinter_AddressType; cdecl; overload;
    {class} function valueOf(P1: Integer): JIDzPrinter_AddressType; cdecl; overload;
    {class} function isBluetooth(P1: JIDzPrinter_AddressType): Boolean; cdecl;
    {class} function isWiFi(P1: JIDzPrinter_AddressType): Boolean; cdecl;
    {class} function isUSB(P1: JIDzPrinter_AddressType): Boolean; cdecl;

    { static Property }
    {class} property SPP: JIDzPrinter_AddressType read _GetSPP;
    {class} property BLE: JIDzPrinter_AddressType read _GetBLE;
    {class} property DUAL: JIDzPrinter_AddressType read _GetDUAL;
    {class} property WiFi: JIDzPrinter_AddressType read _GetWiFi;
    {class} property USB: JIDzPrinter_AddressType read _GetUSB;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$AddressType')]
  JIDzPrinter_AddressType = interface(JEnum) // or JObject
  ['{1954274E-84C2-4E7E-8B27-30154896D966}']
    { Property Methods }

    { methods }
    function value: Integer; cdecl; overload;

    { Property }
  end;

  TJIDzPrinter_AddressType = class(TJavaGenericImport<JIDzPrinter_AddressTypeClass, JIDzPrinter_AddressType>) end;

  JIDzPrinter_FactoryClass = interface(JObjectClass)
  ['{AA33C238-809A-4E20-A6E9-9F0C735B4373}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIDzPrinter_Factory; cdecl;
    {class} function getInstance: JIDzPrinter; cdecl; overload;
    {class} function getInstance(P1: JBundle): JIDzPrinter; cdecl; overload;
    {class} function isPrinterSupported(P1: JBluetoothDevice): Boolean; cdecl; overload;
    {class} function isPrinterSupported(P1: JString): Boolean; cdecl; overload;
    {class} function isPrinterSupported(P1: JBluetoothDevice; P2: JString): Boolean; cdecl; overload;
    {class} function isPrinterSupported(P1: JString; P2: JString): Boolean; cdecl; overload;
    {class} function getFirstPrinter: JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function getFirstPrinter(P1: JString): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function getAllPrinters: JList; cdecl; overload;
    {class} function getAllPrinters(P1: JString): JList; cdecl; overload;
    {class} function hasUsbPrinter: Boolean; cdecl; overload;
    {class} function hasUsbPrinter(P1: JString): Boolean; cdecl; overload;
    {class} function getUsbPrinter: JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function getUsbPrinter(P1: JString): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} procedure enableAutoDisconnect(P1: Boolean); cdecl;
    {class} function generatePageKey: Integer; cdecl;
    {class} function setPrintPageGapType(P1: Integer): Boolean; cdecl;
    {class} function setPrintPageGapLength(P1: Integer): Boolean; cdecl;
    {class} function setPrintDarkness(P1: Integer): Boolean; cdecl;
    {class} function setPrintSpeed(P1: Integer): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$Factory')]
  JIDzPrinter_Factory = interface(JObject)
  ['{FA6BAC64-F217-4D6E-94D8-B827EAF294F8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_Factory = class(TJavaGenericImport<JIDzPrinter_FactoryClass, JIDzPrinter_Factory>) end;

  JIDzPrinter_GeneralProgressClass = interface(JEnumClass) // or JObjectClass
  ['{96CC6610-9755-4E54-8920-F2E6874DCC32}']
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
  ['{158090B8-045E-48BA-B0B5-51C8D1570C0A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_GeneralProgress = class(TJavaGenericImport<JIDzPrinter_GeneralProgressClass, JIDzPrinter_GeneralProgress>) end;

  JIDzPrinter_IActionCallbackClass = interface(JObjectClass)
  ['{554D7D18-7AD7-4B51-B5CF-B1EF8CF77807}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$IActionCallback')]
  JIDzPrinter_IActionCallback = interface(IJavaInstance)
  ['{F9E72A12-5E10-4F6E-A50A-5AC8585B1B56}']
    { Property Methods }

    { methods }
    procedure onProgress(P1: JIDzPrinter_GeneralProgress; P2: JObject); cdecl;

    { Property }
  end;

  TJIDzPrinter_IActionCallback = class(TJavaGenericImport<JIDzPrinter_IActionCallbackClass, JIDzPrinter_IActionCallback>) end;

  JIDzPrinter_IActionWithResponseCallbackClass = interface(JObjectClass)
  ['{C5D30E01-4490-418E-A897-B138EE6563ED}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$IActionWithResponseCallback')]
  JIDzPrinter_IActionWithResponseCallback = interface(IJavaInstance)
  ['{035B3474-5287-45D4-8A73-9E7FA643F1A3}']
    { Property Methods }

    { methods }
    procedure onResponse(P1: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJIDzPrinter_IActionWithResponseCallback = class(TJavaGenericImport<JIDzPrinter_IActionWithResponseCallbackClass, JIDzPrinter_IActionWithResponseCallback>) end;

  JIDzPrinter_IDzPrinterCallbackClass = interface(JObjectClass)
  ['{6706AA1A-F0D0-451E-8E41-83C315A0CF68}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$IDzPrinterCallback')]
  JIDzPrinter_IDzPrinterCallback = interface(IJavaInstance)
  ['{477B7485-E3D7-46D1-BBE4-2CD7870CC755}']
    { Property Methods }

    { methods }
    procedure onProgressInfo(P1: JIDzPrinter_ProgressInfo; P2: JObject); cdecl;
    procedure onStateChange(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrinterState); cdecl;
    procedure onPrintProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrintData; P3: JIDzPrinter_PrintProgress; P4: JObject); cdecl;
    procedure onPrinterDiscovery(P1: JIDzPrinter_PrinterAddress; P2: JObject); cdecl;

    { Property }
  end;

  TJIDzPrinter_IDzPrinterCallback = class(TJavaGenericImport<JIDzPrinter_IDzPrinterCallbackClass, JIDzPrinter_IDzPrinterCallback>) end;

  JIDzPrinter_PrintDataClass = interface(JObjectClass)
  ['{58756C4C-0722-4DE4-A51A-F75338443674}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JObject; P2: JBundle): JIDzPrinter_PrintData; cdecl; overload;
    {class} function init(P1: JObject; P2: JBundle; P3: Integer; P4: Integer): JIDzPrinter_PrintData; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrintData')]
  JIDzPrinter_PrintData = interface(JObject)
  ['{BB5E5417-1C86-4CDA-910F-ED3CAF52EA6A}']
    { Property Methods }
    function _GetprintObj: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprintObj(aprintObj: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprintParam: JBundle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprintParam(aprintParam: JBundle);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprintCopy: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprintCopy(aprintCopy: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetpageKey: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetpageKey(apageKey: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function cloneWith(P1: Integer; P2: Integer): JIDzPrinter_PrintData; cdecl;
    function toString: JString; cdecl;

    { Property }
    property printObj: JObject read _GetprintObj write _SetprintObj;
    property printParam: JBundle read _GetprintParam write _SetprintParam;
    property printCopy: Integer read _GetprintCopy write _SetprintCopy;
    property pageKey: Integer read _GetpageKey write _SetpageKey;
  end;

  TJIDzPrinter_PrintData = class(TJavaGenericImport<JIDzPrinter_PrintDataClass, JIDzPrinter_PrintData>) end;

  JIDzPrinter_PrinterAddressClass = interface(JObjectClass)
  ['{7AED61B1-C43F-4BF5-82AA-229996A223C8}']
    { static Property Methods }
    {class} function _GetUSB: JIDzPrinter_PrinterAddress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JIDzPrinter_PrinterAddress): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JString; P2: JIDzPrinter_AddressType): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JIDzPrinter_PrinterAddress; P2: JString): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JString; P2: JString; P3: JIDzPrinter_AddressType): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JUsbDevice): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JUsbDevice; P2: JString): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function isBluetooth(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl;
    {class} function isWiFi(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl;
    {class} function isUSB(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl;

    { static Property }
    {class} property USB: JIDzPrinter_PrinterAddress read _GetUSB;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrinterAddress')]
  JIDzPrinter_PrinterAddress = interface(JObject)
  ['{A3D6D0A3-518A-42B4-84DF-C8CA5213E61B}']
    { Property Methods }
    function _GetmacAddress: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmacAddress(amacAddress: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetaddressType: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaddressType(aaddressType: JIDzPrinter_AddressType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetshownName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetshownName(ashownName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function isValid: Boolean; cdecl;
    function key: JString; cdecl;
    function clone: JIDzPrinter_PrinterAddress; cdecl; overload;
    function toString: JString; cdecl;
    function equals(P1: JString): Boolean; cdecl; overload;
    function equals(P1: JObject): Boolean; cdecl; overload;
    function clone: JObject; cdecl; overload;

    { Property }
    property macAddress: JString read _GetmacAddress write _SetmacAddress;
    property addressType: JIDzPrinter_AddressType read _GetaddressType write _SetaddressType;
    property shownName: JString read _GetshownName write _SetshownName;
  end;

  TJIDzPrinter_PrinterAddress = class(TJavaGenericImport<JIDzPrinter_PrinterAddressClass, JIDzPrinter_PrinterAddress>) end;

  JIDzPrinter_PrinterInfoClass = interface(JObjectClass)
  ['{5340852F-A638-4311-A2D5-C37BCAFA1C63}']
    { static Property Methods }

    { static Methods }
    {class} function valueOf(P1: JIntent): JIDzPrinter_PrinterInfo; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrinterInfo')]
  JIDzPrinter_PrinterInfo = interface(JObject)
  ['{E258A324-4819-46C3-A849-C3CF7FB6BADE}']
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
    function _GetmcuId: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmcuId(amcuId: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getAddressType: JIDzPrinter_AddressType; cdecl;
    function getPrinterAddress: JIDzPrinter_PrinterAddress; cdecl;
    function toString: JString; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function clone: JIDzPrinter_PrinterInfo; cdecl; overload;
    function clone: JObject; cdecl; overload;

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
    property mcuId: JString read _GetmcuId write _SetmcuId;
  end;

  TJIDzPrinter_PrinterInfo = class(TJavaGenericImport<JIDzPrinter_PrinterInfoClass, JIDzPrinter_PrinterInfo>) end;

  JIDzPrinter_PrinterStateClass = interface(JEnumClass) // or JObjectClass
  ['{20E857BC-654B-4F6D-B03A-3D904FD97AD0}']
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
    {class} function valuesOfOrdinal(P1: Integer): JIDzPrinter_PrinterState; cdecl;

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
  ['{65A357B2-0ECE-481B-BE4A-846ECAA119E0}']
    { Property Methods }

    { methods }
    function group: Integer; cdecl;

    { Property }
  end;

  TJIDzPrinter_PrinterState = class(TJavaGenericImport<JIDzPrinter_PrinterStateClass, JIDzPrinter_PrinterState>) end;

  JIDzPrinter_PrintFailReasonClass = interface(JEnumClass) // or JObjectClass
  ['{AFF4B69C-E359-4FD0-BE69-B229B81EC394}']
    { static Property Methods }
    {class} function _GetOK: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIsPrinting: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIsRotating: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCancelled: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEnvNotReady: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVolTooLow: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVolTooHigh: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTphNotFound: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTphTooHot: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCoverOpened: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNo_Paper: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTphOpened: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNo_Ribbon: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUnmatched_Ribbon: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTphTooCold: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUsedup_Ribbon: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUsedup_Ribbon2: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNo_Label: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUnmatched_Label: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUsedup_Label: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNo_Ribbon2: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUnmatched_Ribbon2: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLabelCanOpend: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDisconnected: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTimeout: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOther: JIDzPrinter_PrintFailReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JIDzPrinter_PrintFailReason>; cdecl;
    {class} function valueOf(P1: JString): JIDzPrinter_PrintFailReason; cdecl;

    { static Property }
    {class} property OK: JIDzPrinter_PrintFailReason read _GetOK;
    {class} property IsPrinting: JIDzPrinter_PrintFailReason read _GetIsPrinting;
    {class} property IsRotating: JIDzPrinter_PrintFailReason read _GetIsRotating;
    {class} property Cancelled: JIDzPrinter_PrintFailReason read _GetCancelled;
    {class} property EnvNotReady: JIDzPrinter_PrintFailReason read _GetEnvNotReady;
    {class} property VolTooLow: JIDzPrinter_PrintFailReason read _GetVolTooLow;
    {class} property VolTooHigh: JIDzPrinter_PrintFailReason read _GetVolTooHigh;
    {class} property TphNotFound: JIDzPrinter_PrintFailReason read _GetTphNotFound;
    {class} property TphTooHot: JIDzPrinter_PrintFailReason read _GetTphTooHot;
    {class} property CoverOpened: JIDzPrinter_PrintFailReason read _GetCoverOpened;
    {class} property No_Paper: JIDzPrinter_PrintFailReason read _GetNo_Paper;
    {class} property TphOpened: JIDzPrinter_PrintFailReason read _GetTphOpened;
    {class} property No_Ribbon: JIDzPrinter_PrintFailReason read _GetNo_Ribbon;
    {class} property Unmatched_Ribbon: JIDzPrinter_PrintFailReason read _GetUnmatched_Ribbon;
    {class} property TphTooCold: JIDzPrinter_PrintFailReason read _GetTphTooCold;
    {class} property Usedup_Ribbon: JIDzPrinter_PrintFailReason read _GetUsedup_Ribbon;
    {class} property Usedup_Ribbon2: JIDzPrinter_PrintFailReason read _GetUsedup_Ribbon2;
    {class} property No_Label: JIDzPrinter_PrintFailReason read _GetNo_Label;
    {class} property Unmatched_Label: JIDzPrinter_PrintFailReason read _GetUnmatched_Label;
    {class} property Usedup_Label: JIDzPrinter_PrintFailReason read _GetUsedup_Label;
    {class} property No_Ribbon2: JIDzPrinter_PrintFailReason read _GetNo_Ribbon2;
    {class} property Unmatched_Ribbon2: JIDzPrinter_PrintFailReason read _GetUnmatched_Ribbon2;
    {class} property LabelCanOpend: JIDzPrinter_PrintFailReason read _GetLabelCanOpend;
    {class} property Disconnected: JIDzPrinter_PrintFailReason read _GetDisconnected;
    {class} property Timeout: JIDzPrinter_PrintFailReason read _GetTimeout;
    {class} property Other: JIDzPrinter_PrintFailReason read _GetOther;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrintFailReason')]
  JIDzPrinter_PrintFailReason = interface(JEnum) // or JObject
  ['{6DF934EA-5AEB-4B5D-AEAB-22DBFB9F47B7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintFailReason = class(TJavaGenericImport<JIDzPrinter_PrintFailReasonClass, JIDzPrinter_PrintFailReason>) end;

  JIDzPrinter_PrintParamNameClass = interface(JObjectClass)
  ['{C4C3B77D-062A-4532-9FC7-DB3581CC4F5C}']
    { static Property Methods }
    {class} function _GetPAGE_KEY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
    {class} function _GetHOR_FLIP: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
    {class} function _GetPRINT_BLE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_CT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_DPI: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property PAGE_KEY: JString read _GetPAGE_KEY;
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
    {class} property HOR_FLIP: JString read _GetHOR_FLIP;
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
    {class} property PRINT_BLE: JString read _GetPRINT_BLE;
    {class} property PRINT_CT: JString read _GetPRINT_CT;
    {class} property PRINT_DPI: JString read _GetPRINT_DPI;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrintParamName')]
  JIDzPrinter_PrintParamName = interface(IJavaInstance)
  ['{FA51CB7A-2868-4511-A0EF-675A33E2BACC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintParamName = class(TJavaGenericImport<JIDzPrinter_PrintParamNameClass, JIDzPrinter_PrintParamName>) end;

  JIDzPrinter_PrintParamValueClass = interface(JObjectClass)
  ['{19445435-C297-450A-95DF-2527990F058B}']
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
  ['{57B813A3-6BF9-4FF1-910F-18411C72D8FA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintParamValue = class(TJavaGenericImport<JIDzPrinter_PrintParamValueClass, JIDzPrinter_PrintParamValue>) end;

  JIDzPrinter_PrintProgressClass = interface(JEnumClass) // or JObjectClass
  ['{C73FC072-8992-4EFC-B662-B5BF8D4F381C}']
    { static Property Methods }
    {class} function _GetConnected: JIDzPrinter_PrintProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetStartCopy: JIDzPrinter_PrintProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDataEnded: JIDzPrinter_PrintProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSuccess: JIDzPrinter_PrintProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFailed: JIDzPrinter_PrintProgress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JIDzPrinter_PrintProgress>; cdecl;
    {class} function valueOf(P1: JString): JIDzPrinter_PrintProgress; cdecl;

    { static Property }
    {class} property Connected: JIDzPrinter_PrintProgress read _GetConnected;
    {class} property StartCopy: JIDzPrinter_PrintProgress read _GetStartCopy;
    {class} property DataEnded: JIDzPrinter_PrintProgress read _GetDataEnded;
    {class} property Success: JIDzPrinter_PrintProgress read _GetSuccess;
    {class} property Failed: JIDzPrinter_PrintProgress read _GetFailed;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrintProgress')]
  JIDzPrinter_PrintProgress = interface(JEnum) // or JObject
  ['{7024D9A5-511A-4B7E-8003-A12244D03AB8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintProgress = class(TJavaGenericImport<JIDzPrinter_PrintProgressClass, JIDzPrinter_PrintProgress>) end;

  JIDzPrinter_ProgressInfoClass = interface(JEnumClass) // or JObjectClass
  ['{6639B2E9-FB80-42DE-BCB9-A8B7CE7958AB}']
    { static Property Methods }
    {class} function _GetAdapterEnabling: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAdapterEnabled: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAdapterDisabled: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDeviceBonding: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDeviceBonded: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDeviceUnbonded: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDeviceLocateWrong: JIDzPrinter_ProgressInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JIDzPrinter_ProgressInfo>; cdecl;
    {class} function valueOf(P1: JString): JIDzPrinter_ProgressInfo; cdecl;

    { static Property }
    {class} property AdapterEnabling: JIDzPrinter_ProgressInfo read _GetAdapterEnabling;
    {class} property AdapterEnabled: JIDzPrinter_ProgressInfo read _GetAdapterEnabled;
    {class} property AdapterDisabled: JIDzPrinter_ProgressInfo read _GetAdapterDisabled;
    {class} property DeviceBonding: JIDzPrinter_ProgressInfo read _GetDeviceBonding;
    {class} property DeviceBonded: JIDzPrinter_ProgressInfo read _GetDeviceBonded;
    {class} property DeviceUnbonded: JIDzPrinter_ProgressInfo read _GetDeviceUnbonded;
    {class} property DeviceLocateWrong: JIDzPrinter_ProgressInfo read _GetDeviceLocateWrong;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$ProgressInfo')]
  JIDzPrinter_ProgressInfo = interface(JEnum) // or JObject
  ['{9ECF859C-2C6C-4A05-9D41-CF4A989932F0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_ProgressInfo = class(TJavaGenericImport<JIDzPrinter_ProgressInfoClass, JIDzPrinter_ProgressInfo>) end;

  JIDzPrinterClass = interface(JObjectClass)
  ['{66A5A7C6-3B13-4AB3-951E-8604A07B43E3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter')]
  JIDzPrinter = interface(IJavaInstance)
  ['{BE3B6645-6AF1-49AF-806B-1FE4ADAD5869}']
    { Property Methods }

    { methods }
    function init(P1: JContext; P2: JIDzPrinter_IDzPrinterCallback): Boolean; cdecl;
    procedure quit; cdecl;
    function discovery: Boolean; cdecl; overload;
    function discovery(P1: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function discovery(P1: JIDzPrinter_AddressType): Boolean; cdecl; overload;
    function discovery(P1: JIDzPrinter_AddressType; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function connect(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl; overload;
    function connect(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function connect(P1: JBluetoothDevice): Boolean; cdecl; overload;
    function connect(P1: JBluetoothDevice; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
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
    function getDiscoveriedPrinterAddresses: JList; cdecl;
    function waitPrinterState(P1: JIDzPrinter_PrinterState; P2: Int64): Boolean; cdecl;
    function generatePageKey: Integer; cdecl;
    function print(P1: JBitmap; P2: JBundle): Boolean; cdecl; overload;
    function print(P1: JBitmap; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function print(P1: Jaa; P2: JBundle): Boolean; cdecl; overload;
    function print(P1: Jaa; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function print(P1: Jab; P2: JBundle): Boolean; cdecl; overload;
    function print(P1: Jab; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function command(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
    function command(P1: TJavaArray<Byte>; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function upgrade(P1: JString): Boolean; cdecl; overload;
    function upgrade(P1: JString; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    procedure cancel; cdecl; overload;
    procedure cancel(P1: Integer); cdecl; overload;

    { Property }
  end;

  TJIDzPrinter = class(TJavaGenericImport<JIDzPrinterClass, JIDzPrinter>) end;

  JIDzPrinter2_DiscoveriedPrinterClass = interface(JIDzPrinter_PrinterAddressClass) // or JObjectClass
  ['{299574C0-7D59-4AB0-87D1-2087E7CAAC6C}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JIDzPrinter_AddressType; P4: JIDzPrinter_AddressType; P5: JInteger): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function init(P1: JIDzPrinter_PrinterAddress): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function init(P1: JIDzPrinter2_DiscoveriedPrinter): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function init(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_AddressType; P3: JInteger): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function init(P1: JIDzPrinter2_DiscoveriedPrinter; P2: JIDzPrinter_AddressType): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function init(P1: JIDzPrinter2_DiscoveriedPrinter; P2: JInteger): JIDzPrinter2_DiscoveriedPrinter; cdecl; overload;
    {class} function getShownRssiLevel(P1: JInteger): Integer; cdecl; overload;
    {class} function getRssiLevel(P1: JInteger): Integer; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2$DiscoveriedPrinter')]
  JIDzPrinter2_DiscoveriedPrinter = interface(JIDzPrinter_PrinterAddress) // or JObject
  ['{C80EB8B8-BC5D-4713-9277-061C8BB6A132}']
    { Property Methods }
    function _GetdiscoveriedType: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdiscoveriedType(adiscoveriedType: JIDzPrinter_AddressType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getrssi: JInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setrssi(arssi: JInteger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getShownRssiLevel: Integer; cdecl; overload;
    function getRssiLevel: Integer; cdecl; overload;
    function toString: JString; cdecl;
    function equals(P1: JObject): Boolean; cdecl; overload;
    function equals(P1: JIDzPrinter2_DiscoveriedPrinter; P2: Boolean): Boolean; cdecl; overload;

    { Property }
    property discoveriedType: JIDzPrinter_AddressType read _GetdiscoveriedType write _SetdiscoveriedType;
    property rssi: JInteger read _Getrssi write _Setrssi;
  end;

  TJIDzPrinter2_DiscoveriedPrinter = class(TJavaGenericImport<JIDzPrinter2_DiscoveriedPrinterClass, JIDzPrinter2_DiscoveriedPrinter>) end;

  JIDzPrinter2_IDzPrinterCallback2Class = interface(JObjectClass)
  ['{A652D742-1B0D-496F-9EAA-990D9426071D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2$IDzPrinterCallback2')]
  JIDzPrinter2_IDzPrinterCallback2 = interface(IJavaInstance)
  ['{6F7C6499-4450-421B-AD2A-29D96CEC1C77}']
    { Property Methods }

    { methods }
    procedure onBondProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onSetParamProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onSendDataProgress(P1: Jh_a; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onPrinterParamChanged(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter2_PrinterParam; P3: JIDzPrinter2_PrinterParam); cdecl;

    { Property }
  end;

  TJIDzPrinter2_IDzPrinterCallback2 = class(TJavaGenericImport<JIDzPrinter2_IDzPrinterCallback2Class, JIDzPrinter2_IDzPrinterCallback2>) end;

  JIDzPrinter2_PrinterParamClass = interface(JObjectClass)
  ['{5F6B72FD-A765-4D88-B23A-803F724538A5}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: JString; P3: JString; P4: JString; P5: JString; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: Integer; P11: Integer; P12: Integer; P13: Integer; P14: Integer; P15: Integer; P16: Integer; P17: Integer; P18: Integer; P19: TJavaArray<Integer>; P20: TJavaArray<Integer>; P21: TJavaArray<Integer>; P22: JString; P23: JString; P24: JString; P25: Integer; P26: Integer; P27: Integer; P28: Integer; P29: Integer): JIDzPrinter2_PrinterParam; cdecl;
    {class} function getAddressGroup(P1: Integer): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2$PrinterParam')]
  JIDzPrinter2_PrinterParam = interface(JObject)
  ['{B6692527-2E00-44BE-9EE4-12327851C934}']
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
    function _GetpaperWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetpaperWidth(apaperWidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprinterLocateArea: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprinterLocateArea(aprinterLocateArea: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
    function _GetupgradeCRC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetupgradeCRC(aupgradeCRC: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetopenHintVoice: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetopenHintVoice(aopenHintVoice: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetautoOutPage: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetautoOutPage(aautoOutPage: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcanSetGenFlags: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcanSetGenFlags(acanSetGenFlags: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprinterHeadTem: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprinterHeadTem(aprinterHeadTem: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbatteryVoltage: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbatteryVoltage(abatteryVoltage: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmanuShipTime: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmanuShipTime(amanuShipTime: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmcuId: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmcuId(amcuId: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstackHead: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstackHead(astackHead: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstackTail: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstackTail(astackTail: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetheapHead: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetheapHead(aheapHead: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetheapTail: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetheapTail(aheapTail: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmaxStack: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmaxStack(amaxStack: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetheapUnused: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetheapUnused(aheapUnused: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetheapMinUnused: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetheapMinUnused(aheapMinUnused: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getdebug1: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setdebug1(adebug1: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getdebug2: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setdebug2(adebug2: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getdebug3: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setdebug3(adebug3: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getdebug4: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setdebug4(adebug4: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetworkLines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetworkLines(aworkLines: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprintLines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprintLines(aprintLines: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnullLines: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnullLines(anullLines: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprintPages: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprintPages(aprintPages: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetchargeStatus: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetchargeStatus(achargeStatus: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprinterStatus: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprinterStatus(aprinterStatus: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbatteryCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbatteryCount(abatteryCount: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure setSupportedGapTypes(P1: TJavaArray<Integer>); cdecl;
    procedure setSupportedMotorModes(P1: TJavaArray<Integer>); cdecl;
    procedure setSupportedLanguages(P1: TJavaArray<Integer>); cdecl;
    function getAddressType: JIDzPrinter_AddressType; cdecl;
    function toString: JString; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function clone: JIDzPrinter2_PrinterParam; cdecl; overload;
    function clone: JObject; cdecl; overload;

    { Property }
    property deviceType: Integer read _GetdeviceType write _SetdeviceType;
    property deviceName: JString read _GetdeviceName write _SetdeviceName;
    property deviceVersion: JString read _GetdeviceVersion write _SetdeviceVersion;
    property softwareVersion: JString read _GetsoftwareVersion write _SetsoftwareVersion;
    property deviceAddress: JString read _GetdeviceAddress write _SetdeviceAddress;
    property deviceAddrType: Integer read _GetdeviceAddrType write _SetdeviceAddrType;
    property printerDPI: Integer read _GetprinterDPI write _SetprinterDPI;
    property printerWidth: Integer read _GetprinterWidth write _SetprinterWidth;
    property paperWidth: Integer read _GetpaperWidth write _SetpaperWidth;
    property printerLocateArea: Integer read _GetprinterLocateArea write _SetprinterLocateArea;
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
    property upgradeCRC: Integer read _GetupgradeCRC write _SetupgradeCRC;
    property openHintVoice: Boolean read _GetopenHintVoice write _SetopenHintVoice;
    property autoOutPage: Boolean read _GetautoOutPage write _SetautoOutPage;
    property canSetGenFlags: Boolean read _GetcanSetGenFlags write _SetcanSetGenFlags;
    property printerHeadTem: Double read _GetprinterHeadTem write _SetprinterHeadTem;
    property batteryVoltage: Double read _GetbatteryVoltage write _SetbatteryVoltage;
    property manuShipTime: JString read _GetmanuShipTime write _SetmanuShipTime;
    property mcuId: JString read _GetmcuId write _SetmcuId;
    property stackHead: JString read _GetstackHead write _SetstackHead;
    property stackTail: JString read _GetstackTail write _SetstackTail;
    property heapHead: JString read _GetheapHead write _SetheapHead;
    property heapTail: JString read _GetheapTail write _SetheapTail;
    property maxStack: Integer read _GetmaxStack write _SetmaxStack;
    property heapUnused: Integer read _GetheapUnused write _SetheapUnused;
    property heapMinUnused: Integer read _GetheapMinUnused write _SetheapMinUnused;
    property debug1: JString read _Getdebug1 write _Setdebug1;
    property debug2: JString read _Getdebug2 write _Setdebug2;
    property debug3: JString read _Getdebug3 write _Setdebug3;
    property debug4: JString read _Getdebug4 write _Setdebug4;
    property workLines: Integer read _GetworkLines write _SetworkLines;
    property printLines: Integer read _GetprintLines write _SetprintLines;
    property nullLines: Integer read _GetnullLines write _SetnullLines;
    property printPages: Integer read _GetprintPages write _SetprintPages;
    property chargeStatus: Integer read _GetchargeStatus write _SetchargeStatus;
    property printerStatus: Integer read _GetprinterStatus write _SetprinterStatus;
    property batteryCount: Integer read _GetbatteryCount write _SetbatteryCount;
  end;

  TJIDzPrinter2_PrinterParam = class(TJavaGenericImport<JIDzPrinter2_PrinterParamClass, JIDzPrinter2_PrinterParam>) end;

  JIDzPrinter2_PrinterParamNameClass = interface(JObjectClass)
  ['{8AF20918-0FE8-4D26-AD39-714C76A4CF4D}']
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
  ['{ED6E929B-0682-478C-A1AE-AC2F45A4D6C7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter2_PrinterParamName = class(TJavaGenericImport<JIDzPrinter2_PrinterParamNameClass, JIDzPrinter2_PrinterParamName>) end;

  JIDzPrinter2Class = interface(JObjectClass)
  ['{55A604D2-D3CD-474F-9C99-4FAD6F17412F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2')]
  JIDzPrinter2 = interface(IJavaInstance)
  ['{209E042D-B0FE-429C-B3AA-F590AC8BF580}']
    { Property Methods }

    { methods }
    function bond(P1: JString): Boolean; cdecl; overload;
    function bond(P1: JString; P2: JString): Boolean; cdecl; overload;
    function onNfcDiscovery(P1: JIntent): Boolean; cdecl;
    function getPrinterCapability: Jb_a; cdecl;
    function getPrinterParam: JIDzPrinter2_PrinterParam; cdecl;
    function refreshPrinterParam: Boolean; cdecl;
    function setPrinterParam(P1: JBundle): Boolean; cdecl; overload;
    function setPrinterParam(P1: JBundle; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function sendDataPackage(P1: Jh_a): Boolean; cdecl; overload;
    function sendDataPackage(P1: Jh_a; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function startDeviceDiscovery(P1: JIDzPrinter_AddressType): Boolean; cdecl; overload;
    function startDeviceDiscovery(P1: JIDzPrinter_AddressType; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;

    { Property }
  end;

  TJIDzPrinter2 = class(TJavaGenericImport<JIDzPrinter2Class, JIDzPrinter2>) end;

  Jj_288Class = interface(JObjectClass)
  ['{E0540F69-B7B7-429B-BA27-8BB47776474F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/j')]
  Jj_288 = interface(JObject)
  ['{B51487E6-F108-4ED6-8E57-AAE0519C475E}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJj_288 = class(TJavaGenericImport<Jj_288Class, Jj_288>) end;

  Jk_289Class = interface(JBroadcastReceiverClass) // or JObjectClass
  ['{03A94A26-3D13-4BDC-99C5-130D60A65F8A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/k')]
  Jk_289 = interface(JBroadcastReceiver) // or JObject
  ['{B00F34E5-9C2F-415C-A5FA-6DFFCC70A748}']
    { Property Methods }

    { methods }
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;

    { Property }
  end;

  TJk_289 = class(TJavaGenericImport<Jk_289Class, Jk_289>) end;

  Jl_290Class = interface(JObjectClass)
  ['{E5E13097-2B11-49A1-A855-69C7BDB32F2A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/l')]
  Jl_290 = interface(JObject)
  ['{2FC87AF7-3C77-43DB-A34B-13ADB1F78630}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJl_290 = class(TJavaGenericImport<Jl_290Class, Jl_290>) end;

  Jm_291Class = interface(JObjectClass)
  ['{B7CE9B8D-5C46-4011-8CA4-80CCBD0FB7DB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/m')]
  Jm_291 = interface(JObject)
  ['{2E66A687-1B37-45C1-BCE9-F226ECFB4F7B}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJm_291 = class(TJavaGenericImport<Jm_291Class, Jm_291>) end;

  Jn_292Class = interface(JObjectClass)
  ['{96230419-220A-4ADC-A9A0-5D0F43EAD98C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/n')]
  Jn_292 = interface(JObject)
  ['{5D95BE88-3658-4E80-98B3-2DA01FD643D2}']
    { Property Methods }

    { methods }
    procedure onProgress(P1: JIDzPrinter_GeneralProgress; P2: JObject); cdecl;

    { Property }
  end;

  TJn_292 = class(TJavaGenericImport<Jn_292Class, Jn_292>) end;

  Jo_293Class = interface(JasClass) // or JObjectClass
  ['{791B1B12-F09C-40CD-9B34-3F7DF3A5D00B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/o')]
  Jo_293 = interface(Jas) // or JObject
  ['{0C637037-A167-4388-BAAF-86A923F688CF}']
    { Property Methods }

    { methods }
    function b(P1: Integer; P2: Integer; P3: JObject): Integer; cdecl;
    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl;

    { Property }
  end;

  TJo_293 = class(TJavaGenericImport<Jo_293Class, Jo_293>) end;

  Jp_294Class = interface(JObjectClass)
  ['{19782B22-1B87-4238-9160-9D2F78D9D156}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/p')]
  Jp_294 = interface(JObject)
  ['{1FD0E9A4-5938-4CA0-AC02-1EDC299EF01D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJp_294 = class(TJavaGenericImport<Jp_294Class, Jp_294>) end;

  Jq_295Class = interface(JasClass) // or JObjectClass
  ['{CE33028B-31BD-4F77-9886-86F29AF3F5A4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/q')]
  Jq_295 = interface(Jas) // or JObject
  ['{DB79D90F-9EFD-41D4-B058-96E717857E27}']
    { Property Methods }

    { methods }
    function b(P1: Integer; P2: Integer; P3: JObject): Integer; cdecl;
    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl;

    { Property }
  end;

  TJq_295 = class(TJavaGenericImport<Jq_295Class, Jq_295>) end;

  Jr_296Class = interface(JBroadcastReceiverClass) // or JObjectClass
  ['{26DE36BF-1AA8-4AFE-B34C-A0C3FBBFEFC9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/r')]
  Jr_296 = interface(JBroadcastReceiver) // or JObject
  ['{11D2E2BC-13F8-4EB2-8138-94EF945BF1B9}']
    { Property Methods }

    { methods }
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;

    { Property }
  end;

  TJr_296 = class(TJavaGenericImport<Jr_296Class, Jr_296>) end;

  Js_297Class = interface(JObjectClass)
  ['{34FAC258-7918-4878-8B1E-14C120D5951E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/s')]
  Js_297 = interface(JObject)
  ['{4FDE545B-1E06-49B0-BE39-F4DEE0E3BDF9}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJs_297 = class(TJavaGenericImport<Js_297Class, Js_297>) end;

  Jt_298Class = interface(JObjectClass)
  ['{F71B64F8-EF44-46E7-9309-30E7CBB6CB98}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/t')]
  Jt_298 = interface(JObject)
  ['{7E6CFC94-6240-47D1-ADAB-785AB35DCF01}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJt_298 = class(TJavaGenericImport<Jt_298Class, Jt_298>) end;

  Ju_299Class = interface(JrClass) // or JObjectClass
  ['{568109DA-82AC-4713-BD88-2283FB6FA37A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/u')]
  Ju_299 = interface(Jr) // or JObject
  ['{5C727831-CCE6-4CD6-955E-FF2AB186C2A9}']
    { Property Methods }

    { methods }
    procedure a(P1: Je); cdecl; overload;
    procedure a(P1: JIDzPrinter_PrinterState); cdecl; overload;

    { Property }
  end;

  TJu_299 = class(TJavaGenericImport<Ju_299Class, Ju_299>) end;

  Jv_300Class = interface(Je_016Class) // or JObjectClass
  ['{E9377995-72FF-436B-8DF7-46F06ACCCD69}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/v')]
  Jv_300 = interface(Je_016) // or JObject
  ['{F1E79321-0A32-45B8-90D5-01851AC8185A}']
    { Property Methods }

    { methods }
    procedure b(P1: Boolean); cdecl;
    procedure a(P1: Je); cdecl; overload;
    procedure a(P1: JIDzPrinter_PrinterState); cdecl; overload;
    procedure a_(P1: Integer); cdecl;

    { Property }
  end;

  TJv_300 = class(TJavaGenericImport<Jv_300Class, Jv_300>) end;

  Jw_301Class = interface(JObjectClass)
  ['{1600490C-2A22-4493-8DBA-EA7C3373FB4B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/w')]
  Jw_301 = interface(JObject)
  ['{AD31C3E8-4D8C-49DB-841E-21A13C1FB612}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJw_301 = class(TJavaGenericImport<Jw_301Class, Jw_301>) end;

  Jx_302Class = interface(JObjectClass)
  ['{A22C0877-284A-4A61-AF8C-5D4451DE4A43}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/x')]
  Jx_302 = interface(JObject)
  ['{A08F52CC-F4B1-4B40-AD59-0F500B6BA253}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJx_302 = class(TJavaGenericImport<Jx_302Class, Jx_302>) end;

  Jy_303Class = interface(Ja_141Class) // or JObjectClass
  ['{D617EC64-03B4-44CA-BA27-4162F39FED9D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/y')]
  Jy_303 = interface(Ja_141) // or JObject
  ['{FDB3A4C8-330A-48AA-A8C6-518229F290BF}']
    { Property Methods }

    { methods }
    procedure a(P1: JIDzPrinter_PrinterState); cdecl; overload;
    procedure a(P1: Je); cdecl; overload;

    { Property }
  end;

  TJy_303 = class(TJavaGenericImport<Jy_303Class, Jy_303>) end;

  Jz_304Class = interface(JObjectClass)
  ['{891E8D2E-9CAB-4CB2-8B6B-8DD4B1582E66}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/z')]
  Jz_304 = interface(JObject)
  ['{04F070E9-71D5-4E45-9C07-03C4CB68355C}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJz_304 = class(TJavaGenericImport<Jz_304Class, Jz_304>) end;

  Ja_305Class = interface(JObjectClass)
  ['{80EAFBAE-8522-4949-91FD-08F6829CFBB9}']
    { static Property Methods }

    { static Methods }
    {class} function a: JHandler; cdecl; overload;
    {class} function a(P1: JHandler_Callback): JHandler; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/view/a')]
  Ja_305 = interface(JObject)
  ['{CBE55722-7B51-4F55-970F-CCBA1809BAF7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJa_305 = class(TJavaGenericImport<Ja_305Class, Ja_305>) end;

  Jb_306Class = interface(JObjectClass)
  ['{FCA6CF0C-DEF0-4748-B2B7-AA0964AC75B9}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: Integer): JString; cdecl; overload;
    {class} function a(P1: Integer; P2: TJavaObjectArray<JObject>): JString; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/view/b')]
  Jb_306 = interface(JObject)
  ['{FE1CA4B9-33B6-49F3-91A3-85D9CA28BE1F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJb_306 = class(TJavaGenericImport<Jb_306Class, Jb_306>) end;

  Jc_307Class = interface(JObjectClass)
  ['{18B8866A-CC1E-491F-B56B-C206DD48FF5B}']
    { static Property Methods }

    { static Methods }
    {class} function a(P1: JView; P2: JClass): JView; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/view/c')]
  Jc_307 = interface(JObject)
  ['{2D76006B-866A-40D8-805C-908B83236A5C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJc_307 = class(TJavaGenericImport<Jc_307Class, Jc_307>) end;

  Jd_308Class = interface(JObjectClass)
  ['{EF28DA13-1D93-453C-A901-178509A6FE03}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/view/d')]
  Jd_308 = interface(JObject)
  ['{0E917212-7BDC-4E8C-8458-27A19785C82F}']
    { Property Methods }

    { methods }
    procedure onClick(P1: JView); cdecl;

    { Property }
  end;

  TJd_308 = class(TJavaGenericImport<Jd_308Class, Jd_308>) end;

  JDzWindow_1Class = interface(JObjectClass)
  ['{2688B6D8-32FA-4B3B-AA0F-7135B81E5437}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/view/DzWindow$1')]
  JDzWindow_1 = interface(JObject)
  ['{BF6BE0BB-9722-439C-A6D7-C5F7F4E8AC35}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzWindow_1 = class(TJavaGenericImport<JDzWindow_1Class, JDzWindow_1>) end;

  JDzWindow_ViewInfoClass = interface(JObjectClass)
  ['{ABA933CB-A934-447C-9B8D-E7142F110C03}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JObject): JDzWindow_ViewInfo; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/view/DzWindow$ViewInfo')]
  JDzWindow_ViewInfo = interface(JObject)
  ['{863F7618-16FB-4591-BA7F-DDD1BFF51F07}']
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
  ['{80A50BD3-6498-4F7D-A238-ABB514D3D38C}']
    { static Property Methods }
    {class} function _GetAll: JDzWindow_ViewInfoType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetValid: JDzWindow_ViewInfoType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVisible: JDzWindow_ViewInfoType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDzWindow_ViewInfoType>; cdecl;
    {class} function valueOf(P1: JString): JDzWindow_ViewInfoType; cdecl;

    { static Property }
    {class} property All: JDzWindow_ViewInfoType read _GetAll;
    {class} property Valid: JDzWindow_ViewInfoType read _GetValid;
    {class} property Visible: JDzWindow_ViewInfoType read _GetVisible;
  end;

  [JavaSignature('com/dothantech/view/DzWindow$ViewInfoType')]
  JDzWindow_ViewInfoType = interface(JEnum) // or JObject
  ['{C28CA11E-DA17-4EA9-BE63-3A46619C2F03}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzWindow_ViewInfoType = class(TJavaGenericImport<JDzWindow_ViewInfoTypeClass, JDzWindow_ViewInfoType>) end;

  JDzWindowClass = interface(JObjectClass)
  ['{FC5AEBFC-5779-4031-8C00-A40C9DE2C7EF}']
    { static Property Methods }
    {class} function _GetLog: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDzWindow; cdecl;
    {class} function getViewInfos: JArrayList; cdecl; overload;
    {class} function getViewCount: Integer; cdecl; overload;
    {class} function getViewCount(P1: JDzWindow_ViewInfoType): Integer; cdecl; overload;
    {class} function getViewInfos(P1: JClass): JArrayList; cdecl; overload;
    {class} function getViewInfos(P1: JString): JArrayList; cdecl; overload;
    {class} function getViewInfosByTitle(P1: JString): JArrayList; cdecl;
    {class} function getActiveViewInfo: JDzWindow_ViewInfo; cdecl;
    {class} function getActiveActivity: JActivity; cdecl;
    {class} function getMainViewInfo: JDzWindow_ViewInfo; cdecl;
    {class} function getMainActivity: JActivity; cdecl;
    {class} function backToMainActivity: Integer; cdecl;
    {class} function getActivity(P1: JClass): JActivity; cdecl; overload;
    {class} function getActivity(P1: JString): JActivity; cdecl; overload;
    {class} function getActivityByTitle(P1: JString): JActivity; cdecl;

    { static Property }
    {class} property Log: Jw read _GetLog;
  end;

  [JavaSignature('com/dothantech/view/DzWindow')]
  JDzWindow = interface(JObject)
  ['{B5021AFE-2088-4701-BDF7-FC6843D3B607}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzWindow = class(TJavaGenericImport<JDzWindowClass, JDzWindow>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_008', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_008));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_c', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_c));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_012', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_012));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_013', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_013));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_014', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_014));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_016', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_016));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_017', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_017));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jk', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jk));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jl', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jl));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jn', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jn));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jo', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jo));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jp', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jp));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jq', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jq));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jr', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jr));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Js', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Js));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jt', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jt));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_032', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_032));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_033', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_033));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_034', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_034));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_035', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_035));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_037', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_037));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaa_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaa_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaa', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaa));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jab', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jab));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jac', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jac));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jad', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jad));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jae', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jae));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaf', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaf));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jag_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jag_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jag', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jag));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jah', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jah));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jai', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jai));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaj', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaj));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jak', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jak));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jal', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jal));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jam', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jam));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jan', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jan));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jao_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jao_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jao', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jao));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jap', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jap));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaq', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaq));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jar', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jar));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jas', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jas));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jat', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jat));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jau_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jau_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jau', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jau));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jav', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jav));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaw', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaw));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jax', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jax));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jay', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jay));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_067', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_067));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_068', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_068));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_069', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_069));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzSystem', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzSystem));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_071', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_071));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_073', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_073));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_074', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_074));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_075', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_075));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_077', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_077));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_078', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_078));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jk_079', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jk_079));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jl_080', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jl_080));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm_081', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm_081));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jn_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jn_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jn_083', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jn_083));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jo_084', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jo_084));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jp_085', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jp_085));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jq_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jq_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jq_087', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jq_087));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jr_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jr_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jr_089', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jr_089));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JReflection', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JReflection));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Js_091', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Js_091));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jt_092', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jt_092));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ju', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ju));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jv', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jv));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_c', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_c));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_d', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_d));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_e', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_e));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_f', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_f));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_g', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_g));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jx', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jx));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jy', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jy));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jz', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jz));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_106', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_106));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_107', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_107));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_108', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_108));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_109', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_109));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_110', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_110));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_114', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_114));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzTagObject_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzTagObject_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzTagObject', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzTagObject));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_117', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_117));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_118', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_118));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_119', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_119));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_120', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_120));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_123', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_123));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a_124', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a_124));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_125', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_125));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_c', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_c));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_129', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_129));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_130', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_130));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_131', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_131));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_132', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_132));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_133', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_133));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_134', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_134));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_135', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_135));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_136', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_136));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_137', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_137));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_138', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_138));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_139', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_139));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_140', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_140));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_141', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_141));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_142', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_142));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_143', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_143));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_144', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_144));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_145', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_145));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_146', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_146));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_147', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_147));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_148', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_148));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_149', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_149));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_150', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_150));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_151', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_151));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_152', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_152));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_153', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_153));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_154', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_154));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_155', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_155));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_156', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_156));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_157', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_157));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_158', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_158));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_159', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_159));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_160', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_160));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_161', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_161));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_162', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_162));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_163', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_163));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_164', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_164));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_165', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_165));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_166', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_166));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_167', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_167));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a_168', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a_168));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_c', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_c));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_d', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_d));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_172', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_172));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_173', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_173));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jk_174', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jk_174));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jl_175', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jl_175));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm_176', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm_176));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jn_177', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jn_177));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_178', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_178));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_179', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_179));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_180', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_180));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_181', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_181));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a_182', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a_182));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_b_183', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_b_183));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_184', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_184));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_185', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_185));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_186', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_186));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_189', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_189));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_a_190', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_a_190));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_191', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_191));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_192', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_192));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_a_193', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_a_193));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_b_194', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_b_194));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_c_195', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_c_195));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_d', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_d));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_197', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_197));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jk_198', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jk_198));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jl_199', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jl_199));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm_201', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm_201));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_202', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_202));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_203', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_203));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_204', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_204));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_a_205', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_a_205));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_207', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_207));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_208', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_208));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_209', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_209));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_210', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_210));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_211', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_211));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_212', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_212));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_b_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_b_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_c', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_c));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_216', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_216));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_217', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_217));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_218', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_218));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_219', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_219));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_220', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_220));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_221', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_221));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_222', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_222));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_223', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_223));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_BarcodeType1D', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_BarcodeType1D));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_DrawParamName', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_DrawParamName));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_ErrorCorrectionLevel', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_ErrorCorrectionLevel));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_Factory', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_Factory));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_FontStyle', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_FontStyle));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_ItemAlignment', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_ItemAlignment));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_LabelScaleUnit', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_LabelScaleUnit));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_PenAlignment', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_PenAlignment));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_ResultCode', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap_ResultCode));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIAtBitmap));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_1', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_1));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_BarcodeType', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_BarcodeType));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_Callback', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_Factory', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_Factory));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_FontStyle', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_FontStyle));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_ItemAlignment', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_ItemAlignment));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_PenAlignment', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_PenAlignment));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_PrintParamName', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_PrintParamName));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_PrintParamValue', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_PrintParamValue));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_244', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_244));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaa_245', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaa_245));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jab_246', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jab_246));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jac_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jac_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jac_248', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jac_248));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_249', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_249));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_250', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_250));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_251', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_251));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_a', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_b', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_b));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_c', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_c));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_d', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_d));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_e', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_e));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_f', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_f));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_g', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_g));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_h', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_h));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_261', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_261));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_262', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_262));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_263', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_263));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_264', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_264));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_265', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_265));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_1', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_1));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_AddressType', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_AddressType));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_Factory', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_Factory));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_GeneralProgress', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_GeneralProgress));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_IActionCallback', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_IActionCallback));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_IActionWithResponseCallback', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_IActionWithResponseCallback));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_IDzPrinterCallback', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_IDzPrinterCallback));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrintData', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrintData));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrinterAddress', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrinterAddress));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrinterInfo', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrinterInfo));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrinterState', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrinterState));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrintFailReason', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrintFailReason));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrintParamName', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrintParamName));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrintParamValue', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrintParamValue));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrintProgress', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_PrintProgress));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_ProgressInfo', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_ProgressInfo));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter2_DiscoveriedPrinter', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter2_DiscoveriedPrinter));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter2_IDzPrinterCallback2', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter2_IDzPrinterCallback2));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter2_PrinterParam', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter2_PrinterParam));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter2_PrinterParamName', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter2_PrinterParamName));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter2', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter2));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_288', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_288));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jk_289', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jk_289));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jl_290', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jl_290));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm_291', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm_291));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jn_292', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jn_292));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jo_293', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jo_293));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jp_294', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jp_294));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jq_295', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jq_295));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jr_296', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jr_296));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Js_297', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Js_297));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jt_298', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jt_298));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ju_299', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ju_299));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jv_300', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jv_300));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_301', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_301));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jx_302', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jx_302));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jy_303', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jy_303));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jz_304', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jz_304));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_305', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_305));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_306', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_306));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_307', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_307));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_308', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_308));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzWindow_1', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzWindow_1));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzWindow_ViewInfo', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzWindow_ViewInfo));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzWindow_ViewInfoType', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzWindow_ViewInfoType));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzWindow', 
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzWindow));
end;


initialization
  RegisterTypes;

end.
