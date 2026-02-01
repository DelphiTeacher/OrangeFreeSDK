//Code Fix By [金华]DelphiTeacher(452330643)

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
//  生成时间：2025/10/5 11:03:15
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.LPAPI_2024_10_21_R;

interface

uses
//  Androidapi.JNI.android.os.Message,
//  Androidapi.JNI.android.graphics.Bitmap,
//  Androidapi.JNI.android.bluetooth.BluetoothDevice,
//  Androidapi.JNI.android.bluetooth.BluetoothAdapter,
//  Androidapi.JNI.android.bluetooth.BluetoothSocket,
//  Androidapi.JNI.android.bluetooth.BluetoothGatt,
//  Androidapi.JNI.android.bluetooth.BluetoothGattCharacteristic,
//  Androidapi.JNI.android.bluetooth.BluetoothGattDescriptor,
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.android.content.Intent,
//  Androidapi.JNI.android.content.BroadcastReceiver,
//  Androidapi.JNI.android.content.IntentFilter,
//  Androidapi.JNI.android.app.Application,
//  Androidapi.JNI.android.content.pm.PackageInfo,
//  Androidapi.JNI.android.os.Handler,
//  Androidapi.JNI.android.content.res.Configuration,
//  Androidapi.JNI.java.text.SimpleDateFormat,
//  Androidapi.JNI.android.widget.Toast,
//  Androidapi.JNI.android.app.Activity,
//  Androidapi.JNI.android.os.Bundle,
//  Androidapi.JNI.android.graphics.Bitmap_Config,
//  Androidapi.JNI.android.os.Parcel,
//  Androidapi.JNI.org.xmlpull.v1.XmlPullParser,
//  Androidapi.JNI.org.xmlpull.v1.XmlSerializer,
//  Androidapi.JNI.android.hardware.usb.UsbInterface,
//  Androidapi.JNI.android.hardware.usb.UsbEndpoint,
//  Androidapi.JNI.android.hardware.usb.UsbDevice,
//  Androidapi.JNI.android.hardware.usb.UsbDeviceConnection,
//  Androidapi.JNI.android.hardware.usb.UsbManager,
//  Androidapi.JNI.java.nio.charset.Charset,
//  Androidapi.JNI.android.graphics.Point,
//  Androidapi.JNI.android.webkit.WebView,
//  Androidapi.JNI.android.os.Handler_Callback,
//  Androidapi.JNI.android.view.View;
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.Util,
  Androidapi.JNI.WebKit,
  Androidapi.JNI.Bluetooth,
  Androidapi.JNI.Hardware;


type

// ===== Forward declarations =====

//  Ja = interface; //com.dothantech.a.a.a
//  Jb = interface; //com.dothantech.a.a.b
//  Jc_a = interface; //com.dothantech.a.a.c$a
//  Jc = interface; //com.dothantech.a.a.c
//  Jd = interface; //com.dothantech.a.a.d
//  Je = interface; //com.dothantech.a.a.e
//  Jf = interface; //com.dothantech.a.a.f
//  Ja_a = interface; //com.dothantech.b.a$a
//  Ja_008 = interface; //com.dothantech.b.a
//  Jb_a = interface; //com.dothantech.b.b$a
//  Jb_b = interface; //com.dothantech.b.b$b
//  Jb_c = interface; //com.dothantech.b.b$c
//  Jb_012 = interface; //com.dothantech.b.b
//  Jc_013 = interface; //com.dothantech.b.c
//  Jd_014 = interface; //com.dothantech.b.d
//  Je_a = interface; //com.dothantech.b.e$a
//  Je_016 = interface; //com.dothantech.b.e
//  Jf_017 = interface; //com.dothantech.b.f
//  Jg = interface; //com.dothantech.b.g
//  Jh = interface; //com.dothantech.b.h
//  Ji = interface; //com.dothantech.b.i
//  Jj = interface; //com.dothantech.b.j
//  Jk = interface; //com.dothantech.b.k
//  Jl = interface; //com.dothantech.b.l
//  Jm = interface; //com.dothantech.b.m
//  Jn = interface; //com.dothantech.b.n
//  Jo = interface; //com.dothantech.b.o
//  Jp = interface; //com.dothantech.b.p
//  Jq = interface; //com.dothantech.b.q
//  Jr = interface; //com.dothantech.b.r
//  Js = interface; //com.dothantech.b.s
//  Jt = interface; //com.dothantech.b.t
//  Ja_032 = interface; //com.dothantech.c.a
//  Jb_033 = interface; //com.dothantech.c.b
//  Jc_034 = interface; //com.dothantech.c.c
//  Ja_a_035 = interface; //com.dothantech.common.a$a
//  Ja_b = interface; //com.dothantech.common.a$b
//  Ja_037 = interface; //com.dothantech.common.a
//  Jaa_a = interface; //com.dothantech.common.aa$a
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
//  Jan = interface; //com.dothantech.common.an
//  Jao_a = interface; //com.dothantech.common.ao$a
//  Jao = interface; //com.dothantech.common.ao
//  Jap = interface; //com.dothantech.common.ap
//  Jaq = interface; //com.dothantech.common.aq
//  Jar = interface; //com.dothantech.common.ar
//  Jas = interface; //com.dothantech.common.as
//  Jat = interface; //com.dothantech.common.at
//  Jau_a = interface; //com.dothantech.common.au$a
//  Jau = interface; //com.dothantech.common.au
//  Jav = interface; //com.dothantech.common.av
  Jaw = interface; //com.dothantech.common.aw
//  Jax = interface; //com.dothantech.common.ax
//  Jay = interface; //com.dothantech.common.ay
//  Jb_067 = interface; //com.dothantech.common.b
//  Jc_068 = interface; //com.dothantech.common.c
//  Jd_069 = interface; //com.dothantech.common.d
  JDzSystem = interface; //com.dothantech.common.DzSystem
//  Je_071 = interface; //com.dothantech.common.e
//  Jf_a = interface; //com.dothantech.common.f$a
//  Jf_073 = interface; //com.dothantech.common.f
//  Jg_074 = interface; //com.dothantech.common.g
//  Jh_075 = interface; //com.dothantech.common.h
//  Ji_a = interface; //com.dothantech.common.i$a
//  Ji_077 = interface; //com.dothantech.common.i
//  Jj_078 = interface; //com.dothantech.common.j
//  Jk_079 = interface; //com.dothantech.common.k
//  Jl_080 = interface; //com.dothantech.common.l
//  Jm_081 = interface; //com.dothantech.common.m
//  Jn_a = interface; //com.dothantech.common.n$a
//  Jn_083 = interface; //com.dothantech.common.n
//  Jo_084 = interface; //com.dothantech.common.o
//  Jp_085 = interface; //com.dothantech.common.p
//  Jq_a = interface; //com.dothantech.common.q$a
//  Jq_087 = interface; //com.dothantech.common.q
//  Jr_a = interface; //com.dothantech.common.r$a
//  Jr_089 = interface; //com.dothantech.common.r
  JReflection = interface; //com.dothantech.common.Reflection
//  Js_091 = interface; //com.dothantech.common.s
//  Jt_092 = interface; //com.dothantech.common.t
//  Ju = interface; //com.dothantech.common.u
//  Jv = interface; //com.dothantech.common.v
//  Jw_a = interface; //com.dothantech.common.w$a
//  Jw_b = interface; //com.dothantech.common.w$b
//  Jw_c = interface; //com.dothantech.common.w$c
//  Jw_d = interface; //com.dothantech.common.w$d
//  Jw_e = interface; //com.dothantech.common.w$e
//  Jw_f = interface; //com.dothantech.common.w$f
//  Jw_g = interface; //com.dothantech.common.w$g
//  Jw = interface; //com.dothantech.common.w
//  Jx = interface; //com.dothantech.common.x
//  Jy = interface; //com.dothantech.common.y
//  Jz = interface; //com.dothantech.common.z
//  Ja_106 = interface; //com.dothantech.d.a
//  Ja_a_107 = interface; //com.dothantech.data.a$a
//  Ja_108 = interface; //com.dothantech.data.a
//  Jb_109 = interface; //com.dothantech.data.b
//  Jc_110 = interface; //com.dothantech.data.c
//  Jd_a_a = interface; //com.dothantech.data.d$a$a
//  Jd_a = interface; //com.dothantech.data.d$a
//  Jd_b = interface; //com.dothantech.data.d$b
//  Jd_114 = interface; //com.dothantech.data.d
//  JDzTagObject_a = interface; //com.dothantech.data.DzTagObject$a
  JDzTagObject = interface; //com.dothantech.data.DzTagObject
//  Je_a_117 = interface; //com.dothantech.data.e$a
//  Je_118 = interface; //com.dothantech.data.e
//  Jf_119 = interface; //com.dothantech.data.f
//  Jg_120 = interface; //com.dothantech.data.g
//  Jh_a = interface; //com.dothantech.data.h$a
//  Jh_b = interface; //com.dothantech.data.h$b
//  Jh_123 = interface; //com.dothantech.data.h
//  Ji_a_124 = interface; //com.dothantech.data.i$a
//  Ji_125 = interface; //com.dothantech.data.i
//  Jj_a = interface; //com.dothantech.data.j$a
//  Jj_b = interface; //com.dothantech.data.j$b
//  Jj_c = interface; //com.dothantech.data.j$c
//  Jj_129 = interface; //com.dothantech.data.j
//  Ja_130 = interface; //com.dothantech.e.a
//  Jb_131 = interface; //com.dothantech.e.b
//  Jc_132 = interface; //com.dothantech.e.c
//  Jd_133 = interface; //com.dothantech.e.d
//  Je_134 = interface; //com.dothantech.e.e
//  Jf_135 = interface; //com.dothantech.e.f
//  Ja_136 = interface; //com.dothantech.f.a
//  Jb_137 = interface; //com.dothantech.f.b
//  Jc_138 = interface; //com.dothantech.f.c
//  Jd_139 = interface; //com.dothantech.f.d
//  Ja_a_140 = interface; //com.dothantech.g.a$a
//  Ja_141 = interface; //com.dothantech.g.a
//  Jb_142 = interface; //com.dothantech.g.b
//  Jc_143 = interface; //com.dothantech.g.c
//  Jd_144 = interface; //com.dothantech.g.d
//  Je_145 = interface; //com.dothantech.g.e
//  Jf_146 = interface; //com.dothantech.g.f
//  Jg_147 = interface; //com.dothantech.g.g
//  Jh_148 = interface; //com.dothantech.g.h
//  Ja_149 = interface; //com.dothantech.h.a.a.a
//  Jb_150 = interface; //com.dothantech.h.a.a.b
//  Jc_151 = interface; //com.dothantech.h.a.a.c
//  Ja_152 = interface; //com.dothantech.h.a.a
//  Jb_153 = interface; //com.dothantech.h.a.b
//  Jc_154 = interface; //com.dothantech.h.a.c
//  Jd_155 = interface; //com.dothantech.h.a.d
//  Je_a_156 = interface; //com.dothantech.h.a.e$a
//  Je_157 = interface; //com.dothantech.h.a.e
//  Jf_158 = interface; //com.dothantech.h.a.f
//  Ja_159 = interface; //com.dothantech.h.a
//  Ja_160 = interface; //com.dothantech.h.b.a.a
//  Jb_161 = interface; //com.dothantech.h.b.a.b
//  Jc_162 = interface; //com.dothantech.h.b.a.c
//  Jd_163 = interface; //com.dothantech.h.b.a.d
//  Je_164 = interface; //com.dothantech.h.b.a.e
//  Jf_165 = interface; //com.dothantech.h.b.a.f
//  Jg_166 = interface; //com.dothantech.h.b.a.g
//  Jh_167 = interface; //com.dothantech.h.b.a.h
//  Ji_a_168 = interface; //com.dothantech.h.b.a.i$a
//  Ji_b = interface; //com.dothantech.h.b.a.i$b
//  Ji_c = interface; //com.dothantech.h.b.a.i$c
//  Ji_d = interface; //com.dothantech.h.b.a.i$d
//  Ji_172 = interface; //com.dothantech.h.b.a.i
//  Jj_173 = interface; //com.dothantech.h.b.a.j
//  Jk_174 = interface; //com.dothantech.h.b.a.k
//  Jl_175 = interface; //com.dothantech.h.b.a.l
//  Jm_176 = interface; //com.dothantech.h.b.a.m
//  Jn_177 = interface; //com.dothantech.h.b.a.n
//  Jb_178 = interface; //com.dothantech.h.b
//  Ja_179 = interface; //com.dothantech.h.c.a
//  Jb_180 = interface; //com.dothantech.h.c.b
//  Jc_181 = interface; //com.dothantech.h.c.c
//  Jd_a_182 = interface; //com.dothantech.h.c.d$a
//  Jd_b_183 = interface; //com.dothantech.h.c.d$b
//  Jd_184 = interface; //com.dothantech.h.c.d
//  Je_185 = interface; //com.dothantech.h.c.e
//  Jf_186 = interface; //com.dothantech.h.c.f
//  Jg_a = interface; //com.dothantech.h.c.g$a
//  Jg_b = interface; //com.dothantech.h.c.g$b
//  Jg_189 = interface; //com.dothantech.h.c.g
//  Jh_a_190 = interface; //com.dothantech.h.c.h$a
//  Jh_191 = interface; //com.dothantech.h.c.h
//  Ji_192 = interface; //com.dothantech.h.c.i
//  Jj_a_193 = interface; //com.dothantech.h.c.j$a
//  Jj_b_194 = interface; //com.dothantech.h.c.j$b
//  Jj_c_195 = interface; //com.dothantech.h.c.j$c
//  Jj_d = interface; //com.dothantech.h.c.j$d
//  Jj_197 = interface; //com.dothantech.h.c.j
//  Jk_198 = interface; //com.dothantech.h.c.k
//  Jl_199 = interface; //com.dothantech.h.c.l
//  Jm_a = interface; //com.dothantech.h.c.m$a
//  Jm_201 = interface; //com.dothantech.h.c.m
//  Jc_202 = interface; //com.dothantech.h.c
//  Ja_203 = interface; //com.dothantech.h.d.a.a
//  Jb_204 = interface; //com.dothantech.h.d.a.b
//  Jc_a_205 = interface; //com.dothantech.h.d.a.c$a
//  Jc_b = interface; //com.dothantech.h.d.a.c$b
//  Jc_207 = interface; //com.dothantech.h.d.a.c
//  Ja_208 = interface; //com.dothantech.h.d.b.a
//  Jb_209 = interface; //com.dothantech.h.d.b.b
//  Jc_210 = interface; //com.dothantech.h.d.b.c
//  Jd_211 = interface; //com.dothantech.h.d.b.d
//  Je_a_212 = interface; //com.dothantech.h.d.b.e$a
//  Je_b_a = interface; //com.dothantech.h.d.b.e$b$a
//  Je_b = interface; //com.dothantech.h.d.b.e$b
//  Je_c = interface; //com.dothantech.h.d.b.e$c
//  Je_216 = interface; //com.dothantech.h.d.b.e
//  Jf_217 = interface; //com.dothantech.h.d.b.f
//  Jd_218 = interface; //com.dothantech.h.d
//  Je_219 = interface; //com.dothantech.h.e
//  Jf_220 = interface; //com.dothantech.h.f
//  Jg_221 = interface; //com.dothantech.h.g
//  Ja_222 = interface; //com.dothantech.lpapi.a
//  Jb_223 = interface; //com.dothantech.lpapi.b
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
//  Ja_244 = interface; //com.dothantech.printer.a
//  Jaa_245 = interface; //com.dothantech.printer.aa
//  Jab_246 = interface; //com.dothantech.printer.ab
//  Jac_a = interface; //com.dothantech.printer.ac$a
//  Jac_248 = interface; //com.dothantech.printer.ac
//  Jb_249 = interface; //com.dothantech.printer.b
//  Jc_250 = interface; //com.dothantech.printer.c
//  Jd_251 = interface; //com.dothantech.printer.d
//  JDzPrinter_a = interface; //com.dothantech.printer.DzPrinter$a
//  JDzPrinter_b = interface; //com.dothantech.printer.DzPrinter$b
//  JDzPrinter_c = interface; //com.dothantech.printer.DzPrinter$c
//  JDzPrinter_d = interface; //com.dothantech.printer.DzPrinter$d
//  JDzPrinter_e = interface; //com.dothantech.printer.DzPrinter$e
//  JDzPrinter_f = interface; //com.dothantech.printer.DzPrinter$f
//  JDzPrinter_g = interface; //com.dothantech.printer.DzPrinter$g
//  JDzPrinter_h = interface; //com.dothantech.printer.DzPrinter$h
  JDzPrinter = interface; //com.dothantech.printer.DzPrinter
//  Je_261 = interface; //com.dothantech.printer.e
//  Jf_262 = interface; //com.dothantech.printer.f
//  Jg_263 = interface; //com.dothantech.printer.g
//  Jh_264 = interface; //com.dothantech.printer.h
//  Ji_265 = interface; //com.dothantech.printer.i
//  JIDzPrinter_1 = interface; //com.dothantech.printer.IDzPrinter$1
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
//  Jj_288 = interface; //com.dothantech.printer.j
//  Jk_289 = interface; //com.dothantech.printer.k
//  Jl_290 = interface; //com.dothantech.printer.l
//  Jm_291 = interface; //com.dothantech.printer.m
//  Jn_292 = interface; //com.dothantech.printer.n
//  Jo_293 = interface; //com.dothantech.printer.o
//  Jp_294 = interface; //com.dothantech.printer.p
//  Jq_295 = interface; //com.dothantech.printer.q
//  Jr_296 = interface; //com.dothantech.printer.r
//  Js_297 = interface; //com.dothantech.printer.s
//  Jt_298 = interface; //com.dothantech.printer.t
//  Ju_299 = interface; //com.dothantech.printer.u
//  Jv_300 = interface; //com.dothantech.printer.v
//  Jw_301 = interface; //com.dothantech.printer.w
//  Jx_302 = interface; //com.dothantech.printer.x
//  Jy_303 = interface; //com.dothantech.printer.y
//  Jz_304 = interface; //com.dothantech.printer.z
//  Ja_305 = interface; //com.dothantech.view.a
//  Jb_306 = interface; //com.dothantech.view.b
//  Jc_307 = interface; //com.dothantech.view.c
//  Jd_308 = interface; //com.dothantech.view.d
//  JDzWindow_1 = interface; //com.dothantech.view.DzWindow$1
  JDzWindow_ViewInfo = interface; //com.dothantech.view.DzWindow$ViewInfo
  JDzWindow_ViewInfoType = interface; //com.dothantech.view.DzWindow$ViewInfoType
  JDzWindow = interface; //com.dothantech.view.DzWindow

// ===== Forward SuperClasses declarations =====

//  JcClass = interface; //com.dothantech.a.a.c
//  JasClass = interface; //com.dothantech.common.as
//  Ji_125Class = interface; //com.dothantech.data.i
//  Ja_136Class = interface; //com.dothantech.f.a
//  Jag_aClass = interface; //com.dothantech.common.ag$a
//  Jw_bClass = interface; //com.dothantech.common.w$b
//  Jh_123Class = interface; //com.dothantech.data.h
//  Jh_aClass = interface; //com.dothantech.data.h$a
//  Jd_133Class = interface; //com.dothantech.e.d
//  Jf_135Class = interface; //com.dothantech.e.f
//  Jc_138Class = interface; //com.dothantech.f.c
//  Jf_146Class = interface; //com.dothantech.g.f
//  Jk_174Class = interface; //com.dothantech.h.b.a.k
//  Je_157Class = interface; //com.dothantech.h.a.e
//  Jc_162Class = interface; //com.dothantech.h.b.a.c
//  Jk_198Class = interface; //com.dothantech.h.c.k
//  Jg_189Class = interface; //com.dothantech.h.c.g
//  Jd_184Class = interface; //com.dothantech.h.c.d
//  Jh_191Class = interface; //com.dothantech.h.c.h
//  Jm_201Class = interface; //com.dothantech.h.c.m
//  Jj_197Class = interface; //com.dothantech.h.c.j
//  Jf_220Class = interface; //com.dothantech.h.f
  JIAtBitmap_BarcodeType1DClass = interface; //com.dothantech.lpapi.IAtBitmap$BarcodeType1D
//  JDzPrinter_bClass = interface; //com.dothantech.printer.DzPrinter$b
//  Jc_143Class = interface; //com.dothantech.g.c
  JawClass = interface; //com.dothantech.common.aw
  JIDzPrinter_PrinterAddressClass = interface; //com.dothantech.printer.IDzPrinter$PrinterAddress
//  JrClass = interface; //com.dothantech.b.r
//  Je_016Class = interface; //com.dothantech.b.e
//  Ja_141Class = interface; //com.dothantech.g.a

// ===== Interface declarations =====

//  JaClass = interface(JcClass) // or JObjectClass
//  ['{C2A95A73-73D5-4B45-9E5F-5F9D725760AA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja; cdecl; overload;
//    {class} function init(P1: Ja; P2: JMap): Ja; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/a/a/a')]
//  Ja = interface(Jc) // or JObject
//  ['{82485490-9FD9-4623-90C7-5E3B5D73E0C1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Integer; P3: Integer): Je; cdecl;
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  JbClass = interface(JObjectClass)
//  ['{6D7A6098-577A-415A-8228-C157E0997341}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/a/a/b')]
//  Jb = interface(JObject)
//  ['{CAAD88D4-C5BF-4F5A-9CD6-2E4D26CEC25B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  Jc_aClass = interface(JObjectClass)
//  ['{7FE1AFEC-C0FB-4D24-B43C-7D18A53DFDBD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja; P2: JString): Jc_a; cdecl; overload;
//    {class} function init(P1: Ja; P2: JString; P3: Boolean; P4: Boolean; P5: Boolean): Jc_a; cdecl; overload;
//    {class} function init(P1: Ja; P2: JString; P3: Boolean; P4: Boolean; P5: Boolean; P6: Boolean): Jc_a; cdecl; overload;
//    {class} function init(P1: Jc_a; P2: Ja): Jc_a; cdecl; overload;
//    {class} function init(P1: Jc_a; P2: Boolean): Jc_a; cdecl; overload;
//    {class} function init(P1: Jc_a; P2: JString; P3: Boolean): Jc_a; cdecl; overload;
//    {class} function init(P1: Jc_a; P2: JString; P3: Boolean; P4: Boolean): Jc_a; cdecl; overload;
//    {class} function a(P1: Integer; P2: Integer; P3: Boolean): Integer; cdecl; overload;
//    {class} function a(P1: Char): Integer; cdecl; overload;
//    {class} function a(P1: JMessage): JMessage; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/a/a/c$a')]
//  Jc_a = interface(JObject)
//  ['{68B90022-A523-4B0F-8A6F-19C8C0239C8A}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//    property c: Boolean read _Getc write _Setc;
//  end;

//  TJc_a = class(TJavaGenericImport<Jc_aClass, Jc_a>) end;

//  JcClass = interface(JObjectClass)
//  ['{21DB1408-1A69-4D36-8C20-A572AFFD0BFF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Jb): JBitmap; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/a/a/c')]
//  Jc = interface(JObject)
//  ['{9D127BC8-41F7-4AE7-94CB-CA3DF69A020E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Integer; P3: Integer): Je; cdecl; overload;
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  JdClass = interface(JcClass) // or JObjectClass
//  ['{58BBD1DE-5305-4EBA-8EF0-8B08AA2AC983}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/a/a/d')]
//  Jd = interface(Jc) // or JObject
//  ['{5E1310A4-34F1-43BD-9FD6-FE84ACA69F55}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Integer; P3: Integer): Je; cdecl;
//
//    { Property }
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  JeClass = interface(JObjectClass)
//  ['{45BA0D8E-5A55-47F1-BF8C-39E020342675}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc_a; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Jb): Je; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/a/a/e')]
//  Je = interface(JObject)
//  ['{7D7C06A2-18DE-4967-AB46-ACD84A0C70E3}']
//    { Property Methods }
//    function _Geta: Jc_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc_a);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jb);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: Jc_a read _Geta write _Seta;
//    property b: Jb read _Getb write _Setb;
//  end;

//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  JfClass = interface(JcClass) // or JObjectClass
//  ['{6C120516-E5CD-4090-A4EB-5F5B51101771}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf; cdecl; overload;
//    {class} function init(P1: JMap): Jf; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/a/a/f')]
//  Jf = interface(Jc) // or JObject
//  ['{58CA07F8-DC1F-42EF-9F77-AE177471BA32}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Integer; P3: Integer): Je; cdecl;
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

//  Ja_aClass = interface(JObjectClass)
//  ['{14A1A0EA-7614-4E17-92F6-329ED532226E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_a; cdecl;
//    {class} function a(P1: JString): Ja_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/a$a')]
//  Ja_a = interface(JObject)
//  ['{9ECA28FC-8E64-4EB0-BD19-2840160A24E7}']
//    { Property Methods }
//    function _Geta: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Char);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: Word read _Geta write _Seta;
//    property b: Word read _Getb write _Setb;
//    property c: Word read _Getc write _Setc;
//    property d: Word read _Getd write _Setd;
//    property e: Word read _Gete write _Sete;
//    property f: JString read _Getf write _Setf;
//    property g: Char read _Getg write _Setg;
//    property h: Word read _Geth write _Seth;
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  Ja_008Class = interface(JObjectClass)
//  ['{1EBE3C3A-7237-4064-94D3-F25B3A5E7A5C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/a')]
//  Ja_008 = interface(JObject)
//  ['{BA74312F-ACC0-469E-A758-A766888ADF19}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJa_008 = class(TJavaGenericImport<Ja_008Class, Ja_008>) end;

//  Jb_aClass = interface(JObjectClass)
//  ['{06E5A1F6-D9AC-47DB-A926-63372440EBC6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/b$a')]
//  Jb_a = interface(JObject)
//  ['{D71568CC-90E7-4FE6-879D-5654F4AAB7EB}']
//    { Property Methods }
//    function _Geta: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function clone: JObject; cdecl;
//
//    { Property }
//    property a: Word read _Geta write _Seta;
//    property b: Word read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//    property f: Integer read _Getf write _Setf;
//  end;

//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  Jb_bClass = interface(JEnumClass) // or JObjectClass
//  ['{36864DFC-4B29-4F78-B4F9-8707158C533A}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: TJavaArray<Integer>; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: Integer read _Getc;
//    {class} property d: Integer read _Getd;
//    {class} property e: Integer read _Gete;
//  end;

//  [JavaSignature('com/dothantech/b/b$b')]
//  Jb_b = interface(JEnum) // or JObject
//  ['{6A281979-61FA-42BF-BE20-01626681A912}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_b = class(TJavaGenericImport<Jb_bClass, Jb_b>) end;

//  Jb_cClass = interface(JObjectClass)
//  ['{7A132EE8-17BC-456C-BB1F-C79D6D00E52B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/b$c')]
//  Jb_c = interface(JObject)
//  ['{767773ED-1A1D-48FC-9363-31BBC350EEFC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_c = class(TJavaGenericImport<Jb_cClass, Jb_c>) end;

//  Jb_012Class = interface(JObjectClass)
//  ['{E217A441-EC27-4B96-9DB3-669AF9388602}']
//    { static Property Methods }
//    {class} function _Geta: JUUID;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jb_012; cdecl;
//    {class} function a(P1: JBluetoothDevice; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JString; P2: Integer): JList; cdecl; overload;
//    {class} function a: Boolean; cdecl; overload;
//    {class} function a(P1: JString): JBluetoothDevice; cdecl; overload;
//    {class} function a(P1: JBluetoothAdapter; P2: JString): JBluetoothDevice; cdecl; overload;
//    {class} function b(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: JBluetoothDevice): JString; cdecl; overload;
//    {class} function b(P1: JBluetoothDevice): JIDzPrinter_AddressType; cdecl; overload;
//    {class} function c(P1: JBluetoothDevice): JIDzPrinter_PrinterAddress; cdecl; overload;
//    {class} function c(P1: JString): JBluetoothDevice; cdecl; overload;
//    {class} function d(P1: JString): Integer; cdecl; overload;
//    {class} function d(P1: JBluetoothDevice): Boolean; cdecl; overload;
//    {class} function e(P1: JBluetoothDevice): Boolean; cdecl; overload;
//    {class} function b(P1: JBluetoothDevice; P2: JString): Boolean; cdecl; overload;
//    {class} procedure a(P1: JBluetoothSocket); cdecl; overload;
//    {class} procedure b; cdecl; overload;
//    {class} function e(P1: JString): JString; cdecl; overload;
//    {class} function f(P1: JString): Integer; cdecl; overload;
//    {class} function a(P1: JString; P2: Jb_a): Integer; cdecl; overload;
//    {class} function f(P1: JBluetoothDevice): Boolean; cdecl; overload;
//    {class} function g(P1: JString): Boolean; cdecl;
//    {class} function h(P1: JString): JIDzPrinter_PrinterAddress; cdecl;
//
//    { static Property }
//    {class} property a: JUUID read _Geta;
//  end;

//  [JavaSignature('com/dothantech/b/b')]
//  Jb_012 = interface(JObject)
//  ['{7EFDF2CA-45DB-4693-9092-DEF19D08DA15}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_012 = class(TJavaGenericImport<Jb_012Class, Jb_012>) end;

//  Jc_013Class = interface(JObjectClass)
//  ['{14DD05BD-A8E3-4406-953A-26F5C02CF7DE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/c')]
//  Jc_013 = interface(JObject)
//  ['{4AE8B1A5-C36B-41D8-A7F9-C47B2D961271}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJc_013 = class(TJavaGenericImport<Jc_013Class, Jc_013>) end;

//  Jd_014Class = interface(JObjectClass)
//  ['{02424A30-6544-4C28-A6E9-881861B246D8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/d')]
//  Jd_014 = interface(JObject)
//  ['{C33179CC-C29C-481A-B574-0A15C1EA9F11}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_014 = class(TJavaGenericImport<Jd_014Class, Jd_014>) end;

//  Je_aClass = interface(JBluetoothGattCallbackClass) // or JObjectClass
//  ['{837E893C-0F9B-48E7-B6F4-098E06DC1F2B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/e$a')]
//  Je_a = interface(JBluetoothGattCallback) // or JObject
//  ['{161FFCEE-6D59-45C5-A293-2B5E8084F5DE}']
//    { Property Methods }
//
//    { methods }
//    procedure onConnectionStateChange(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
//    procedure onServicesDiscovered(P1: JBluetoothGatt; P2: Integer); cdecl;
//    procedure onCharacteristicRead(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic; P3: Integer); cdecl;
//    procedure onDescriptorWrite(P1: JBluetoothGatt; P2: JBluetoothGattDescriptor; P3: Integer); cdecl;
//    procedure onMtuChanged(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
//    procedure onReadRemoteRssi(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
//    procedure onCharacteristicWrite(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic; P3: Integer); cdecl;
//    procedure onCharacteristicChanged(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic); cdecl;
//
//    { Property }
//  end;

//  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

//  Je_016Class = interface(JasClass) // or JObjectClass
//  ['{5F14DA59-14AE-4F9A-B2DF-A9A38B3EBADE}']
//    { static Property Methods }
//    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JContext): Je_016; cdecl;
//
//    { static Property }
//    {class} property a: Jw read _Geta;
//  end;

//  [JavaSignature('com/dothantech/b/e')]
//  Je_016 = interface(Jas) // or JObject
//  ['{83F4B3EA-5554-42FC-8706-F73A1CFB76D9}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JBluetoothDevice): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//    function b: JString; cdecl; overload;
//    function a(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
//    function b(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
//    procedure a(P1: Ji_a); cdecl; overload;
//    function c: Integer; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): Boolean; cdecl; overload;
//    function a(P1: Boolean): Boolean; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJe_016 = class(TJavaGenericImport<Je_016Class, Je_016>) end;

//  Jf_017Class = interface(JObjectClass)
//  ['{69C54D2E-973B-44B4-9802-3B076587C944}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/f')]
//  Jf_017 = interface(JObject)
//  ['{4A7E7B68-EBA0-4025-9E72-5A92B0025AE7}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJf_017 = class(TJavaGenericImport<Jf_017Class, Jf_017>) end;

//  JgClass = interface(JObjectClass)
//  ['{F33B1659-A822-4511-A7CE-CC5708D5EA37}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/g')]
//  Jg = interface(JObject)
//  ['{26366112-76DD-4B3F-9230-4F1E3D8C792C}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  JhClass = interface(Ji_125Class) // or JObjectClass
//  ['{7F04C5CB-B0C6-481B-AD6C-3CC403A60E30}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/h')]
//  Jh = interface(Ji_125) // or JObject
//  ['{ABD0FD56-8821-48FC-9743-E6A7F7BC1175}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh = class(TJavaGenericImport<JhClass, Jh>) end;

//  JiClass = interface(JObjectClass)
//  ['{16860655-F1CB-4700-9FB8-26B52D837419}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/i')]
//  Ji = interface(JObject)
//  ['{9F2E45D5-D1ED-4627-BBE1-C384649D6FC6}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJi = class(TJavaGenericImport<JiClass, Ji>) end;

//  JjClass = interface(JObjectClass)
//  ['{E751CB92-5856-4787-BC0F-E4430DEA927F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/j')]
//  Jj = interface(JObject)
//  ['{00EA25C4-5DB1-4035-9A62-702016AF3087}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJj = class(TJavaGenericImport<JjClass, Jj>) end;

//  JkClass = interface(JObjectClass)
//  ['{FE419257-4090-4A59-A0DE-8D348A155769}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/k')]
//  Jk = interface(JObject)
//  ['{71285369-D635-4041-9C65-83522317DB8E}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJk = class(TJavaGenericImport<JkClass, Jk>) end;

//  JlClass = interface(JObjectClass)
//  ['{D0B0270F-FA6A-4B98-8D18-2A6F067901A9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/l')]
//  Jl = interface(JObject)
//  ['{A001A223-244D-4176-8622-23D127191A5D}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJl = class(TJavaGenericImport<JlClass, Jl>) end;

//  JmClass = interface(JObjectClass)
//  ['{818B7265-5EA9-45C5-AFC8-927E3E3A77D2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/m')]
//  Jm = interface(JObject)
//  ['{A86F912D-998F-44D8-BB34-D7F9F969B6D7}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJm = class(TJavaGenericImport<JmClass, Jm>) end;

//  JnClass = interface(JObjectClass)
//  ['{2FF4CE2C-8FD3-4AE7-BE61-EB18DCBD9D71}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/n')]
//  Jn = interface(JObject)
//  ['{2591CDBD-1910-4706-9020-409EC12D67A6}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJn = class(TJavaGenericImport<JnClass, Jn>) end;

//  JoClass = interface(JObjectClass)
//  ['{4FA03D88-2A20-4A37-A7B8-8C4DAC28F487}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/o')]
//  Jo = interface(JObject)
//  ['{7E4A457C-40FE-40FC-94EC-6D8F17CC6A34}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJo = class(TJavaGenericImport<JoClass, Jo>) end;

//  JpClass = interface(JObjectClass)
//  ['{819F7266-D3BC-48F0-BF00-6258B9BBEDFC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/p')]
//  Jp = interface(JObject)
//  ['{EF06CB2C-ACCC-49A9-BDB3-35CDFDA052BF}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJp = class(TJavaGenericImport<JpClass, Jp>) end;

//  JqClass = interface(JObjectClass)
//  ['{D5E15AB4-C93C-4197-A33E-148380EA002F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/q')]
//  Jq = interface(JObject)
//  ['{B379EE65-582F-485C-9148-E62E612A3129}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJq = class(TJavaGenericImport<JqClass, Jq>) end;

//  JrClass = interface(JObjectClass)
//  ['{D4D60A3A-5B99-4BC9-85B4-3F97342B6447}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBluetoothSocket): Jr; cdecl;
//    {class} function a(P1: Integer; P2: Boolean): Boolean; cdecl; overload;
//    {class} function a(P1: Integer; P2: JString): JString; cdecl; overload;
//    {class} function a(P1: Integer; P2: Integer): Integer; cdecl; overload;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: JContext; P2: JBroadcastReceiver; P3: JIntentFilter): JIntent; cdecl; overload;
//    {class} procedure a(P1: JContext; P2: JBroadcastReceiver); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/r')]
//  Jr = interface(JObject)
//  ['{F38DBD4E-6C06-4235-B1EB-80D56D087C0B}']
//    { Property Methods }
//
//    { methods }
//    function b: JString; cdecl; overload;
//    function a(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
//    function b(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
//    procedure a(P1: Ji_a); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJr = class(TJavaGenericImport<JrClass, Jr>) end;

//  JsClass = interface(Ja_136Class) // or JObjectClass
//  ['{DD4E906F-99BD-48F9-B50A-003C172CE4F8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/s')]
//  Js = interface(Ja_136) // or JObject
//  ['{749458B1-27F9-421C-9804-A889444A7D82}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJs = class(TJavaGenericImport<JsClass, Js>) end;

//  JtClass = interface(JObjectClass)
//  ['{0A07B221-9B6F-4B1F-A966-1269D88524FA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jb_a): Integer; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/b/t')]
//  Jt = interface(JObject)
//  ['{0B394D3E-1771-4A95-AD32-482B8905E5FC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt = class(TJavaGenericImport<JtClass, Jt>) end;

//  Ja_032Class = interface(JObjectClass)
//  ['{DE9033FE-1677-40E2-97C9-C67D7D700E25}']
//    { static Property Methods }
//    {class} function _Getb: Jw_g;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a; cdecl; overload;
//    {class} procedure b; cdecl;
//    {class} procedure c; cdecl;
//    {class} function init(P1: Integer; P2: Integer): Ja_032; cdecl;
//
//    { static Property }
//    {class} property b: Jw_g read _Getb;
//  end;

//  [JavaSignature('com/dothantech/c/a')]
//  Ja_032 = interface(JObject)
//  ['{D3C75185-4164-4506-A166-4D19A7074BF4}']
//    { Property Methods }
//
//    { methods }
//    function d: Integer; cdecl;
//    function e: Integer; cdecl;
//    function a(P1: Integer; P2: Integer): Byte; cdecl; overload;
//    function f: TJavaArray<TJavaArray<Byte>>; cdecl;
//    procedure a(P1: Integer; P2: Integer; P3: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: Boolean); cdecl; overload;
//    procedure a(P1: Byte); cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJa_032 = class(TJavaGenericImport<Ja_032Class, Ja_032>) end;

//  Jb_033Class = interface(JObjectClass)
//  ['{B5574DA6-483E-4B90-82B3-6F19D0CC6A9F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/c/b')]
//  Jb_033 = interface(JObject)
//  ['{E20AC38C-F743-4854-8521-C1EE780542FC}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJb_033 = class(TJavaGenericImport<Jb_033Class, Jb_033>) end;

//  Jc_034Class = interface(JTypeReferenceClass) // or JObjectClass
//  ['{F99D479B-8FDB-41C6-9870-496FA3C62725}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/c/c')]
//  Jc_034 = interface(JTypeReference) // or JObject
//  ['{104E9323-9504-450E-A977-111AE2D9BE8D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_034 = class(TJavaGenericImport<Jc_034Class, Jc_034>) end;

//  Ja_a_035Class = interface(JEnumClass) // or JObjectClass
//  ['{3B721F62-BABD-42B3-A2BD-A6D5B2769164}']
//    { static Property Methods }
//    {class} function _Geta: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ja_a>; cdecl;
//    {class} function valueOf(P1: JString): Ja_a; cdecl;
//    {class} function a(P1: JLocale): Ja_a; cdecl; overload;
//    {class} function b(P1: JLocale): Boolean; cdecl;
//    {class} function a(P1: JLocale; P2: JLocale): Boolean; cdecl; overload;
//
//    { static Property }
//    {class} property a: Ja_a read _Geta;
//    {class} property b: Ja_a read _Getb;
//    {class} property c: Ja_a read _Getc;
//  end;

//  [JavaSignature('com/dothantech/common/a$a')]
//  Ja_a_035 = interface(JEnum) // or JObject
//  ['{86C11B31-0EED-499A-851F-F7FD6C82E05A}']
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

//  TJa_a_035 = class(TJavaGenericImport<Ja_a_035Class, Ja_a_035>) end;

//  Ja_bClass = interface(JEnumClass) // or JObjectClass
//  ['{25AC3D2C-018F-4425-A71A-30255E993B09}']
//    { static Property Methods }
//    {class} function _Geta: Ja_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ja_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ja_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ja_b>; cdecl;
//    {class} function valueOf(P1: JString): Ja_b; cdecl;
//
//    { static Property }
//    {class} property a: Ja_b read _Geta;
//    {class} property b: Ja_b read _Getb;
//    {class} property c: Ja_b read _Getc;
//  end;

//  [JavaSignature('com/dothantech/common/a$b')]
//  Ja_b = interface(JEnum) // or JObject
//  ['{4DCA1C69-A68F-4536-9E09-37D1F25F829D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_b = class(TJavaGenericImport<Ja_bClass, Ja_b>) end;

//  Ja_037Class = interface(JApplicationClass) // or JObjectClass
//  ['{423AB0C4-2313-46DD-8668-2E673960F238}']
//    { static Property Methods }
//    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: JApplication; cdecl; overload;
//    {class} function b: JContext; cdecl; overload;
//    {class} function a(P1: Boolean): JString; cdecl; overload;
//    {class} function c: JPackageInfo; cdecl; overload;
//    {class} function b(P1: Boolean): JString; cdecl; overload;
//    {class} function d: Boolean; cdecl;
//    {class} function e: Ja_b; cdecl;
//    {class} function f: Boolean; cdecl;
//    {class} function g: Boolean; cdecl;
//    {class} procedure a(P1: Int64); cdecl; overload;
//    {class} function h: Boolean; cdecl;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
//    {class} function b(P1: JString): Boolean; cdecl; overload;
//    {class} procedure a(P1: JHandler); cdecl; overload;
//    {class} procedure i; cdecl;
//    {class} procedure b(P1: Int64); cdecl; overload;
//    {class} function j: Ja_b; cdecl;
//    {class} function k: TJavaObjectArray<Ja_a>; cdecl;
//    {class} function a(P1: JLocale; P2: JLocale): Boolean; cdecl; overload;
//    {class} function b(P1: JLocale; P2: JLocale): Boolean; cdecl; overload;
//    {class} function c(P1: JLocale; P2: JLocale): Boolean; cdecl; overload;
//    {class} function l: JLocale; cdecl;
//    {class} function m: JString; cdecl;
//    {class} procedure n; cdecl;
//
//    { static Property }
//    {class} property a: Jw read _Geta;
//    {class} property b: Jf read _Getb;
//    {class} property c: JObject read _Getc;
//  end;

//  [JavaSignature('com/dothantech/common/a')]
//  Ja_037 = interface(JApplication) // or JObject
//  ['{C4EEEAFD-C8A7-4A88-B0F1-86B921E27D26}']
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

//  TJa_037 = class(TJavaGenericImport<Ja_037Class, Ja_037>) end;

//  Jaa_aClass = interface(JObjectClass)
//  ['{F1D9DFC0-4F7C-4C4B-9820-3A801E2531BF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext): Jaa_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/aa$a')]
//  Jaa_a = interface(JObject)
//  ['{17D0B49F-B8CA-493A-A29D-E411AAABC739}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJaa_a = class(TJavaGenericImport<Jaa_aClass, Jaa_a>) end;

//  JaaClass = interface(JObjectClass)
//  ['{0F9A2B41-C351-4365-A90F-06ED2FA4ABF5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/aa')]
//  Jaa = interface(IJavaInstance)
//  ['{03D53863-B55B-4DDC-BC80-10FDE21D0D43}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJaa = class(TJavaGenericImport<JaaClass, Jaa>) end;

//  JabClass = interface(JObjectClass)
//  ['{9F1265C5-E253-426C-A9C4-BB606A65AF98}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JCharSequence): Boolean; cdecl; overload;
//    {class} function a(P1: JCharSequence; P2: JCharSequence): Boolean; cdecl; overload;
//    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
//    {class} function b(P1: JString; P2: JString): Integer; cdecl; overload;
//    {class} function c(P1: JString; P2: JString): Integer; cdecl; overload;
//    {class} function d(P1: JString; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: JString; P2: Integer; P3: Integer): JString; cdecl; overload;
//    {class} function a(P1: JString; P2: Integer): JString; cdecl; overload;
//    {class} function b(P1: JString): JString; cdecl; overload;
//    {class} function c(P1: JString): JString; cdecl; overload;
//    {class} function d(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Ju; P3: Integer; P4: JString): JString; cdecl; overload;
//    {class} function e(P1: JString): Boolean; cdecl; overload;
//    {class} function b(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl; overload;
//    {class} function e(P1: JString; P2: JString): Integer; cdecl; overload;
//    {class} function f(P1: JString): TJavaObjectArray<JString>; cdecl; overload;
//    {class} function a(P1: JString; P2: Char): TJavaObjectArray<JString>; cdecl; overload;
//    {class} function a(P1: Char; P2: Integer): JString; cdecl; overload;
//    {class} function f(P1: JString; P2: JString): Integer; cdecl; overload;
//    {class} function a(P1: JString; P2: Jab; P3: Jab): Boolean; cdecl; overload;
//    {class} function init: Jab; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ab')]
//  Jab = interface(JObject)
//  ['{1E0DCD0F-6BB7-4D72-9F33-6EFCE07E118F}']
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

//  TJab = class(TJavaGenericImport<JabClass, Jab>) end;

//  JacClass = interface(JObjectClass)
//  ['{3D041BA4-7AB3-4172-BC86-CDD7BC542368}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ac')]
//  Jac = interface(JObject)
//  ['{9050F0BD-B212-4A6C-9A6F-054253C02641}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJac = class(TJavaGenericImport<JacClass, Jac>) end;

//  JadClass = interface(JObjectClass)
//  ['{7BDBD5CA-76E0-40CF-AF6B-DBC48D8F860E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ad')]
//  Jad = interface(JObject)
//  ['{D1F658EF-1D1B-484E-976F-85D93514075C}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJad = class(TJavaGenericImport<JadClass, Jad>) end;

//  JaeClass = interface(JObjectClass)
//  ['{36AC6CAA-F8B4-4574-A34A-94782A894CE7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ae')]
//  Jae = interface(JObject)
//  ['{5AEFBCC2-6C39-4D36-AE72-A488A95CCEB1}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJae = class(TJavaGenericImport<JaeClass, Jae>) end;

//  JafClass = interface(JObjectClass)
//  ['{3C7BA286-72C0-41FD-97C4-1CB83018870A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/af')]
//  Jaf = interface(JObject)
//  ['{1507AEB1-7933-4311-B268-D4DC1DB08843}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJaf = class(TJavaGenericImport<JafClass, Jaf>) end;

//  Jag_aClass = interface(JEnumClass) // or JObjectClass
//  ['{DE2D9AB1-D16E-47E1-9851-CADD640CAFA0}']
//    { static Property Methods }
//    {class} function _Geta: Jag_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jag_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jag_a>; cdecl;
//    {class} function valueOf(P1: JString): Jag_a; cdecl;
//
//    { static Property }
//    {class} property a: Jag_a read _Geta;
//    {class} property b: Jag_a read _Getb;
//  end;

//  [JavaSignature('com/dothantech/common/ag$a')]
//  Jag_a = interface(JEnum) // or JObject
//  ['{DB5AEFD0-3420-44FB-87AC-642A73EEA7AB}']
//    { Property Methods }
//    function _Getc: JSimpleDateFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JSimpleDateFormat);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//    property c: JSimpleDateFormat read _Getc write _Setc;
//  end;

//  TJag_a = class(TJavaGenericImport<Jag_aClass, Jag_a>) end;

//  JagClass = interface(JObjectClass)
//  ['{FE7B0007-6383-4698-BA7B-8E99AC9B670B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ag')]
//  Jag = interface(JObject)
//  ['{96693F79-4678-4215-8186-E8DD853DAD59}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJag = class(TJavaGenericImport<JagClass, Jag>) end;

//  JahClass = interface(Jag_aClass) // or JObjectClass
//  ['{79C2592E-7D07-4DE5-9C64-059033055ACD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ah')]
//  Jah = interface(Jag_a) // or JObject
//  ['{E260EE39-D143-4F33-95E6-A3FE8CF3FE72}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJah = class(TJavaGenericImport<JahClass, Jah>) end;

//  JaiClass = interface(Jag_aClass) // or JObjectClass
//  ['{2329EBB4-845C-433E-B262-2A59EF7247B2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ai')]
//  Jai = interface(Jag_a) // or JObject
//  ['{9D3D2638-5B33-46FD-A820-0F3B115E80B3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJai = class(TJavaGenericImport<JaiClass, Jai>) end;

//  JajClass = interface(Jag_aClass) // or JObjectClass
//  ['{CBD9F315-A233-4015-B7FC-34FDBCBCF454}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/aj')]
//  Jaj = interface(Jag_a) // or JObject
//  ['{653C93F1-1BA6-4756-BAEA-804FA92EC017}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJaj = class(TJavaGenericImport<JajClass, Jaj>) end;

//  JakClass = interface(Jag_aClass) // or JObjectClass
//  ['{DC3E23F5-561E-4893-AEB1-893A2F3DF017}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ak')]
//  Jak = interface(Jag_a) // or JObject
//  ['{4340C1AC-28C1-48EE-B1D6-CA0EC2666D1F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJak = class(TJavaGenericImport<JakClass, Jak>) end;

//  JalClass = interface(Jag_aClass) // or JObjectClass
//  ['{AC10F053-4F48-4ACC-A54C-E7DDEA86C239}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/al')]
//  Jal = interface(Jag_a) // or JObject
//  ['{FF334036-193C-4C6B-B71B-314D39FCFC80}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJal = class(TJavaGenericImport<JalClass, Jal>) end;

//  JamClass = interface(Jag_aClass) // or JObjectClass
//  ['{1D03F88A-0BDE-4F56-BA94-A9A7C066FE9B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/am')]
//  Jam = interface(Jag_a) // or JObject
//  ['{6C847D63-9026-4ED9-A4DA-6EF0F3AE7034}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJam = class(TJavaGenericImport<JamClass, Jam>) end;

//  JanClass = interface(Jag_aClass) // or JObjectClass
//  ['{2B89558E-E4D1-4CCE-80E8-6458CCFC05D4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/an')]
//  Jan = interface(Jag_a) // or JObject
//  ['{3C035783-85FB-4074-952D-6CAEC04E567F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJan = class(TJavaGenericImport<JanClass, Jan>) end;

//  Jao_aClass = interface(JObjectClass)
//  ['{FCF01D4D-4312-44D4-97F0-EEA09CBEE8AE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JToast): Jao_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ao$a')]
//  Jao_a = interface(JObject)
//  ['{44F8D6EB-CC72-4D8A-B67F-3FAA74EB9D8B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJao_a = class(TJavaGenericImport<Jao_aClass, Jao_a>) end;

//  JaoClass = interface(JObjectClass)
//  ['{01A246B1-A083-4028-AA5A-9D4FC775E31A}']
//    { static Property Methods }
//    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jao; cdecl;
//    {class} procedure a(P1: JCharSequence); cdecl; overload;
//    {class} procedure a(P1: JToast; P2: JObject); cdecl; overload;
//    {class} function a(P1: JContext; P2: JCharSequence; P3: Integer): JToast; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jw read _Geta;
//  end;

//  [JavaSignature('com/dothantech/common/ao')]
//  Jao = interface(JObject)
//  ['{E9D5EFD9-8325-40FA-A680-2A61478B415D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJao = class(TJavaGenericImport<JaoClass, Jao>) end;

//  JapClass = interface(JObjectClass)
//  ['{41685E2D-5879-4AC5-BDDE-E451D4097C91}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ap')]
//  Jap = interface(JObject)
//  ['{20F1C1CF-D3F2-4447-8F36-E2DD05419310}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJap = class(TJavaGenericImport<JapClass, Jap>) end;

//  JaqClass = interface(JObjectClass)
//  ['{548FC89B-C2B8-445F-890A-47669E822372}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/aq')]
//  Jaq = interface(JObject)
//  ['{9F5BA99B-C424-4447-A621-4187B98A63D6}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJaq = class(TJavaGenericImport<JaqClass, Jaq>) end;

//  JarClass = interface(JObjectClass)
//  ['{4C8AE401-F2E8-4508-88BB-50323D73A785}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ar')]
//  Jar = interface(JObject)
//  ['{5DB509F8-BDB4-4D1F-9DE8-44014D000CC2}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJar = class(TJavaGenericImport<JarClass, Jar>) end;

//  JasClass = interface(JObjectClass)
//  ['{6A6CFBD8-8870-4761-BF87-23687801C302}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Jas; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/as')]
//  Jas = interface(JObject)
//  ['{D63918B6-8F71-4702-B40B-6D4DD0667EB6}']
//    { Property Methods }
//    function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: JObject); cdecl; overload;
//    function b(P1: Integer; P2: Integer): Integer; cdecl; overload;
//    function a(P1: Integer; P2: JObject): Integer; cdecl; overload;
//    function b(P1: Integer; P2: Integer; P3: JObject): Integer; cdecl; overload;
//    function c(P1: Integer; P2: Integer; P3: JObject): Boolean; cdecl; overload;
//    function a(P1: JRunnable): Boolean; cdecl; overload;
//    function b(P1: Integer): Boolean; cdecl; overload;
//    procedure a(P1: Int64); cdecl; overload;
//    procedure b(P1: Int64); cdecl; overload;
//    procedure c(P1: Int64); cdecl; overload;
//    procedure d(P1: Int64); cdecl; overload;
//    procedure d; cdecl; overload;
//    procedure e; cdecl;
//    procedure f; cdecl;
//    procedure g; cdecl;
//    function h: Boolean; cdecl;
//    function i: Boolean; cdecl;
//    procedure j; cdecl;
//
//    { Property }
//    property g: Integer read _Getg write _Setg;
//  end;

//  TJas = class(TJavaGenericImport<JasClass, Jas>) end;

//  JatClass = interface(JObjectClass)
//  ['{536C79EC-FA8E-4FEE-BEBC-513FFDF864CC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/at')]
//  Jat = interface(JObject)
//  ['{521CA995-FF69-423F-8AB3-FB1188DC694B}']
//    { Property Methods }
//
//    { methods }
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJat = class(TJavaGenericImport<JatClass, Jat>) end;

//  Jau_aClass = interface(JObjectClass)
//  ['{5105A467-B91A-4CDE-B758-D77EB6EBFA73}']
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
//    {class} function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getq: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gets: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gett: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getv: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getw: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gety: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getz: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
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
//    {class} property k: Integer read _Getk;
//    {class} property l: Integer read _Getl;
//    {class} property m: Integer read _Getm;
//    {class} property n: Integer read _Getn;
//    {class} property o: Integer read _Geto;
//    {class} property p: Integer read _Getp;
//    {class} property q: Integer read _Getq;
//    {class} property r: Integer read _Getr;
//    {class} property s: Integer read _Gets;
//    {class} property t: Integer read _Gett;
//    {class} property u: Integer read _Getu;
//    {class} property v: Integer read _Getv;
//    {class} property w: Integer read _Getw;
//    {class} property x: Integer read _Getx;
//    {class} property y: Integer read _Gety;
//    {class} property z: Integer read _Getz;
//    {class} property A: Integer read _GetA;
//    {class} property B: Integer read _GetB;
//    {class} property C: Integer read _GetC;
//    {class} property D: Integer read _GetD;
//    {class} property E: Integer read _GetE;
//    {class} property F: Integer read _GetF;
//  end;

//  [JavaSignature('com/dothantech/common/au$a')]
//  Jau_a = interface(JObject)
//  ['{70D034EA-5F29-4174-AE95-83C8B663A4C9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJau_a = class(TJavaGenericImport<Jau_aClass, Jau_a>) end;

//  JauClass = interface(JObjectClass)
//  ['{A05BCDC5-8714-4232-B30F-2D2367EE65A0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JCharSequence; P2: Integer; P3: Integer): Jau; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/au')]
//  Jau = interface(JObject)
//  ['{FC21BF98-4EEC-427D-B389-B7B4BF1CCA7E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJau = class(TJavaGenericImport<JauClass, Jau>) end;

//  JavClass = interface(JObjectClass)
//  ['{574F669E-501C-496D-B301-8F5B59549E22}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Boolean; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/av')]
//  Jav = interface(JObject)
//  ['{514AB026-E7C0-40C0-958A-B38906408007}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJav = class(TJavaGenericImport<JavClass, Jav>) end;

  JawClass = interface(JObjectClass)
  ['{597728E6-CD8B-40A2-989F-286868A71950}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jaw; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/aw')]
  Jaw = interface(JObject)
  ['{B6484EC2-8195-4682-AE92-9E55B2E48BB0}']
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

//  JaxClass = interface(JObjectClass)
//  ['{15254E01-3F38-4EF5-8BD7-DCD2806C9D4C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ax')]
//  Jax = interface(JObject)
//  ['{5832AFB1-AB31-4259-BF7C-6A216F57F570}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJax = class(TJavaGenericImport<JaxClass, Jax>) end;

//  JayClass = interface(JObjectClass)
//  ['{9B629D1F-276F-4D46-92AE-4656980606E8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/ay')]
//  Jay = interface(JObject)
//  ['{C67F3915-FA5C-4CFE-9C4D-DE41317CD300}']
//    { Property Methods }
//
//    { methods }
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJay = class(TJavaGenericImport<JayClass, Jay>) end;

//  Jb_067Class = interface(JObjectClass)
//  ['{CD550F3B-8B7F-4E6B-B108-52CFCD416C04}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/b')]
//  Jb_067 = interface(JObject)
//  ['{10C76DB8-9CD9-447F-937B-88CF89716C5B}']
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

//  TJb_067 = class(TJavaGenericImport<Jb_067Class, Jb_067>) end;

//  Jc_068Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{C4636545-1245-4A69-8A24-CE2889EA3299}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/c')]
//  Jc_068 = interface(JBroadcastReceiver) // or JObject
//  ['{F84C316F-8A64-47A4-ADA2-4CE461D5587E}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJc_068 = class(TJavaGenericImport<Jc_068Class, Jc_068>) end;

//  Jd_069Class = interface(JObjectClass)
//  ['{B47139A9-0C67-4772-97DA-A41BEBFDC345}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/d')]
//  Jd_069 = interface(JObject)
//  ['{F49B7311-8F09-4427-BE76-B6DE7926222A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJd_069 = class(TJavaGenericImport<Jd_069Class, Jd_069>) end;

  JDzSystemClass = interface(JObjectClass)
  ['{00DEAF09-C32C-4FB2-87C6-A5207A65CD79}']
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
  ['{D1BB0A85-62FB-4499-86AA-F981EFF36FE7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzSystem = class(TJavaGenericImport<JDzSystemClass, JDzSystem>) end;

//  Je_071Class = interface(JArrayListClass) // or JObjectClass
//  ['{6C616B00-F81D-4695-ADA9-EF5DD8F36750}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_071; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/e')]
//  Je_071 = interface(JArrayList) // or JObject
//  ['{4C6A4909-D6CF-4555-AFB0-D47C30C50284}']
//    { Property Methods }
//
//    { methods }
//    procedure sort(P1: JComparator); cdecl;
//
//    { Property }
//  end;

//  TJe_071 = class(TJavaGenericImport<Je_071Class, Je_071>) end;

//  Jf_aClass = interface(JEnumClass) // or JObjectClass
//  ['{751B906E-AAD7-466E-B596-D3B8FBAE60A2}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: TJavaArray<Integer>; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: Integer read _Getc;
//  end;

//  [JavaSignature('com/dothantech/common/f$a')]
//  Jf_a = interface(JEnum) // or JObject
//  ['{F20419A9-A795-4B22-B524-AD2ECA03F0B5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_a = class(TJavaGenericImport<Jf_aClass, Jf_a>) end;

//  Jf_073Class = interface(JObjectClass)
//  ['{BB362FEF-85C1-47D1-BACB-FAB49C32CA91}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): JString; cdecl; overload;
//    {class} procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>); cdecl; overload;
//    {class} procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: Integer); cdecl; overload;
//    {class} procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: Byte); cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<JString>; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<JObject>): Boolean; cdecl; overload;
//    {class} function init: Jf_073; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/f')]
//  Jf_073 = interface(JObject)
//  ['{7743F052-C468-4DAC-A259-1E5EB186C8B4}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JHandler); cdecl; overload;
//    procedure b(P1: JHandler); cdecl;
//    function a(P1: JMessage): Boolean; cdecl; overload;
//    function a(P1: Integer): Boolean; cdecl; overload;
//    function a(P1: Integer; P2: JObject): Boolean; cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJf_073 = class(TJavaGenericImport<Jf_073Class, Jf_073>) end;

//  Jg_074Class = interface(JObjectClass)
//  ['{547893D2-766B-4C81-AF88-6685A9BBC46B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/g')]
//  Jg_074 = interface(JObject)
//  ['{15C7CDC8-DE7A-4A2A-A04D-A29094B57AD5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg_074 = class(TJavaGenericImport<Jg_074Class, Jg_074>) end;

//  Jh_075Class = interface(JObjectClass)
//  ['{420607A5-3DE8-43B1-BA85-E67614BEC450}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_075; cdecl;
//    {class} function a(P1: JString; P2: Integer): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/h')]
//  Jh_075 = interface(JObject)
//  ['{BE445E05-C5FA-47E2-BD14-2DEAD92377BE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh_075 = class(TJavaGenericImport<Jh_075Class, Jh_075>) end;

//  Ji_aClass = interface(JEnumClass) // or JObjectClass
//  ['{5D41139B-5B5D-4196-8719-BAFB1597EF08}']
//    { static Property Methods }
//    {class} function _Geta: Ji_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ji_a>; cdecl;
//    {class} function valueOf(P1: JString): Ji_a; cdecl;
//    {class} function a(P1: Integer): Ji_a; cdecl;
//
//    { static Property }
//    {class} property a: Ji_a read _Geta;
//  end;

//  [JavaSignature('com/dothantech/common/i$a')]
//  Ji_a = interface(JEnum) // or JObject
//  ['{B7F278EB-5482-41CC-8C26-AEB15F4FD30B}']
//    { Property Methods }
//
//    { methods }
//    function value: Integer; cdecl;
//
//    { Property }
//  end;

//  TJi_a = class(TJavaGenericImport<Ji_aClass, Ji_a>) end;

//  Ji_077Class = interface(JObjectClass)
//  ['{7DCC05B7-95F9-4323-A18F-EAE117084D73}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JBitmap; P2: Integer): JBitmap; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: Ji_a; P3: JBitmap_Config): JBitmap; cdecl; overload;
//    {class} function a(P1: Integer): Integer; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/i')]
//  Ji_077 = interface(JObject)
//  ['{69990762-1573-433D-9726-E159A7383535}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi_077 = class(TJavaGenericImport<Ji_077Class, Ji_077>) end;

//  Jj_078Class = interface(JObjectClass)
//  ['{ECABCC05-CD9B-4340-ACC5-EB718786BEDA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Boolean): Boolean; cdecl; overload;
//    {class} function a(P1: JObject): Jj; cdecl; overload;
//    {class} function init: Jj_078; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/j')]
//  Jj_078 = interface(JObject)
//  ['{A1FBF0BC-C73E-401A-BAD3-88B6AE06E6BA}']
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

//  TJj_078 = class(TJavaGenericImport<Jj_078Class, Jj_078>) end;

//  Jk_079Class = interface(JObjectClass)
//  ['{59406EB5-5B90-43C0-B80A-39C11EE8DCBE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function a(P1: Byte): Integer; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/k')]
//  Jk_079 = interface(JObject)
//  ['{14131E71-939C-4F40-AF63-E46478AC656C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk_079 = class(TJavaGenericImport<Jk_079Class, Jk_079>) end;

//  Jl_080Class = interface(JObjectClass)
//  ['{9ACECDC0-67A1-467E-85DC-D4E1CEE35095}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JObject; P2: JString): Boolean; cdecl; overload;
//    {class} function b(P1: JObject; P2: JString): JObject; cdecl;
//    {class} function a(P1: JClass; P2: JString; P3: TJavaObjectArray<JClass>): JMethod; cdecl; overload;
//    {class} function a(P1: JMethod; P2: JObject; P3: TJavaObjectArray<JObject>): JObject; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/l')]
//  Jl_080 = interface(JObject)
//  ['{617FEDDB-0C9A-4D6C-B986-1B2C541767E9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl_080 = class(TJavaGenericImport<Jl_080Class, Jl_080>) end;

//  Jm_081Class = interface(JObjectClass)
//  ['{511EA195-DE47-4202-8566-8BD28C9879B5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm_081; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/m')]
//  Jm_081 = interface(JObject)
//  ['{2204E25E-8385-4F98-A95C-D767DFC6C797}']
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

//  TJm_081 = class(TJavaGenericImport<Jm_081Class, Jm_081>) end;

//  Jn_aClass = interface(JObjectClass)
//  ['{45FA949A-5341-4753-9161-5F90EF7D0BD3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/n$a')]
//  Jn_a = interface(IJavaInstance)
//  ['{439C486B-B7DF-4CEB-9AD4-667346CAA5E1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn_a = class(TJavaGenericImport<Jn_aClass, Jn_a>) end;

//  Jn_083Class = interface(JObjectClass)
//  ['{77CA35D1-4129-46C7-8242-53BAB48D30ED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: Jn_a); cdecl;
//    {class} function init: Jn_083; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/n')]
//  Jn_083 = interface(JObject)
//  ['{FA0CE92D-57A4-4F6E-8588-A89A84CD7A8B}']
//    { Property Methods }
//
//    { methods }
//    procedure uncaughtException(P1: JThread; P2: JThrowable); cdecl;
//
//    { Property }
//  end;

//  TJn_083 = class(TJavaGenericImport<Jn_083Class, Jn_083>) end;

//  Jo_084Class = interface(JThreadClass) // or JObjectClass
//  ['{29D199BD-7567-4E2A-BF6C-83D76DF6F37D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/o')]
//  Jo_084 = interface(JThread) // or JObject
//  ['{5F0C3A19-EEB8-42E5-AC31-F14F5B24DEFE}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJo_084 = class(TJavaGenericImport<Jo_084Class, Jo_084>) end;

//  Jp_085Class = interface(JObjectClass)
//  ['{860CB533-E3F1-47CF-AB41-A1F0070AEC61}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function b(P1: JString): Boolean; cdecl;
//    {class} function c(P1: JString): Boolean; cdecl;
//    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/p')]
//  Jp_085 = interface(JObject)
//  ['{03AE290A-EADA-4B7A-9094-86099B8541D8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp_085 = class(TJavaGenericImport<Jp_085Class, Jp_085>) end;

//  Jq_aClass = interface(JObjectClass)
//  ['{E7ABE957-7272-4AFE-861E-BB944FD6D6D5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/q$a')]
//  Jq_a = interface(IJavaInstance)
//  ['{85198EEF-044F-4486-8280-E71F1F2AC971}']
//    { Property Methods }
//
//    { methods }
//    function value: Integer; cdecl;
//
//    { Property }
//  end;

//  TJq_a = class(TJavaGenericImport<Jq_aClass, Jq_a>) end;

//  Jq_087Class = interface(JObjectClass)
//  ['{5191BA01-CEB8-4660-8454-7DCD897AFD36}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaObjectArray<JEnum>; P2: JObject; P3: JEnum): JEnum; cdecl; overload;
//    {class} function init: Jq_087; cdecl;
//    {class} function a(P1: JString; P2: Ja; P3: Integer; P4: Integer; P5: JMap): Jb; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/q')]
//  Jq_087 = interface(JObject)
//  ['{00067B27-A250-4C78-923B-EAACCF45603B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJq_087 = class(TJavaGenericImport<Jq_087Class, Jq_087>) end;

//  Jr_aClass = interface(JObjectClass)
//  ['{6AD9FDB2-23A0-4627-BC77-8092EDEF2AAB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Jr_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/r$a')]
//  Jr_a = interface(JObject)
//  ['{801BA750-F3D2-473C-9BC5-C40B0A4BDE0C}']
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

//  TJr_a = class(TJavaGenericImport<Jr_aClass, Jr_a>) end;

//  Jr_089Class = interface(JObjectClass)
//  ['{B1B91F28-BEE7-4AEA-B76D-AC51BE5D628C}']
//    { static Property Methods }
//    {class} function _Geta: JComparator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function b(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: JString; P2: JString; P3: JString): JString; cdecl; overload;
//    {class} function c(P1: JString): Boolean; cdecl;
//    {class} function a(P1: JInputStream; P2: JString): Boolean; cdecl; overload;
//    {class} function d(P1: JString): Boolean; cdecl;
//    {class} function a(P1: JFile; P2: Boolean): Boolean; cdecl; overload;
//    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
//    {class} function e(P1: JString): JString; cdecl;
//    {class} function b(P1: JString; P2: JString): Boolean; cdecl; overload;
//
//    { static Property }
//    {class} property a: JComparator read _Geta;
//  end;

//  [JavaSignature('com/dothantech/common/r')]
//  Jr_089 = interface(JObject)
//  ['{8B74E8B3-CD29-4FB9-AB7D-2BD05AE264A5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr_089 = class(TJavaGenericImport<Jr_089Class, Jr_089>) end;

  JReflectionClass = interface(JObjectClass)
  ['{6F128C6F-F61B-425B-995F-7AFA0BC732BA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReflection; cdecl;
    {class} function unseal(P1: JContext): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/common/Reflection')]
  JReflection = interface(JObject)
  ['{DB3421FD-9747-41E0-BD01-71D6BCB65369}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReflection = class(TJavaGenericImport<JReflectionClass, JReflection>) end;

//  Js_091Class = interface(JObjectClass)
//  ['{8EA9A3A7-8751-4712-9977-7FC23D38369E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/s')]
//  Js_091 = interface(JObject)
//  ['{5BB484CA-31CB-4732-A1B4-739D9172B92B}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJs_091 = class(TJavaGenericImport<Js_091Class, Js_091>) end;

//  Jt_092Class = interface(JObjectClass)
//  ['{3E4592F1-08E8-4DD5-B41E-DED234E27E62}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/t')]
//  Jt_092 = interface(JObject)
//  ['{E5AC7443-39C8-4F7F-AB0D-22EE6C08E2A6}']
//    { Property Methods }
//
//    { methods }
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJt_092 = class(TJavaGenericImport<Jt_092Class, Jt_092>) end;

//  JuClass = interface(JObjectClass)
//  ['{BF2AADCA-4B7F-4CD1-9CA3-291C90A7E81E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Byte): JString; cdecl; overload;
//    {class} function a(P1: Byte; P2: Boolean): JString; cdecl; overload;
//    {class} function a(P1: Byte; P2: Boolean; P3: Integer): JString; cdecl; overload;
//    {class} function a(P1: Integer): JString; cdecl; overload;
//    {class} function a(P1: Integer; P2: Boolean; P3: Integer): JString; cdecl; overload;
//    {class} function a(P1: Byte; P2: Byte): Integer; cdecl; overload;
//    {class} function b(P1: Integer): Byte; cdecl;
//    {class} function a(P1: JString; P2: Integer): Integer; cdecl; overload;
//    {class} function a(P1: JObject): Ju; cdecl; overload;
//    {class} function init: Ju; cdecl; overload;
//    {class} function init(P1: Integer): Ju; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/u')]
//  Ju = interface(JObject)
//  ['{68E7E8D1-1D10-447A-8E2C-2101C7C2D980}']
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

//  TJu = class(TJavaGenericImport<JuClass, Ju>) end;

//  JvClass = interface(JObjectClass)
//  ['{E7ADC9EE-DB4B-4E3A-BAF4-71BF39901898}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/v')]
//  Jv = interface(JObject)
//  ['{776EFB1D-A8B3-47E5-8BE5-FDA0B201B998}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJv = class(TJavaGenericImport<JvClass, Jv>) end;

//  Jw_aClass = interface(JObjectClass)
//  ['{D149B5E5-2C7D-4844-ACBE-975F7F43D443}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw_a; cdecl; overload;
//    {class} function init(P1: JString): Jw_a; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/w$a')]
//  Jw_a = interface(JObject)
//  ['{9AD220E1-4E37-47E3-AF40-DC2159F5EA5F}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function describeContents: Integer; cdecl;
//    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//  end;

//  TJw_a = class(TJavaGenericImport<Jw_aClass, Jw_a>) end;

//  Jw_bClass = interface(JObjectClass)
//  ['{DAAC4806-DD2C-4378-842F-B669A9E1CF78}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/w$b')]
//  Jw_b = interface(JObject)
//  ['{BC499F68-D6D0-4DBE-969D-D27BADDB2E57}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;

//  TJw_b = class(TJavaGenericImport<Jw_bClass, Jw_b>) end;

//  Jw_cClass = interface(Jw_bClass) // or JObjectClass
//  ['{D2578629-DC34-4CB1-BDAD-7B0AC5423556}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/w$c')]
//  Jw_c = interface(Jw_b) // or JObject
//  ['{35AAE219-10F1-4977-8D88-3F74DEC34890}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw_c = class(TJavaGenericImport<Jw_cClass, Jw_c>) end;

//  Jw_dClass = interface(Jw_bClass) // or JObjectClass
//  ['{49E26816-9D75-456C-92E5-D8E817E9EC5F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/w$d')]
//  Jw_d = interface(Jw_b) // or JObject
//  ['{1A9B4662-1E29-4D1C-81C4-B9B1E04AC51D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw_d = class(TJavaGenericImport<Jw_dClass, Jw_d>) end;

//  Jw_eClass = interface(JObjectClass)
//  ['{A670589D-DC88-406D-A9BA-501C23AB851E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/w$e')]
//  Jw_e = interface(JObject)
//  ['{16662447-F336-4ACC-8EEA-19FED59C30DD}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJw_e = class(TJavaGenericImport<Jw_eClass, Jw_e>) end;

//  Jw_fClass = interface(Jw_bClass) // or JObjectClass
//  ['{0DA3B8F3-3A68-4F43-B185-03C5DA9C3DCD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/w$f')]
//  Jw_f = interface(Jw_b) // or JObject
//  ['{0AD1F58E-7DDA-4B31-AE85-FA83D4C69EC5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw_f = class(TJavaGenericImport<Jw_fClass, Jw_f>) end;

//  Jw_gClass = interface(Jw_bClass) // or JObjectClass
//  ['{81B068E1-C4B0-4753-824F-216005129F13}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/w$g')]
//  Jw_g = interface(Jw_b) // or JObject
//  ['{8BCD6B51-31D9-4663-AFCF-B673BCCD5A0D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw_g = class(TJavaGenericImport<Jw_gClass, Jw_g>) end;

//  JwClass = interface(JObjectClass)
//  ['{1EED06D9-2094-47B9-BF41-1797C4071762}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jw_e;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JString): Jw; cdecl; overload;
//    {class} procedure e; cdecl; overload;
//    {class} procedure a(P1: JMap); cdecl; overload;
//
//    { static Property }
//    {class} property a: JString read _Geta;
//    {class} property b: Jf read _Getb;
//    {class} property g: Jw_e read _Getg;
//  end;

//  [JavaSignature('com/dothantech/common/w')]
//  Jw = interface(JObject)
//  ['{5BE458BE-B961-45EB-8826-FEA5178DBF37}']
//    { Property Methods }
//    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    property h: JString read _Geth write _Seth;
//  end;

//  TJw = class(TJavaGenericImport<JwClass, Jw>) end;

//  JxClass = interface(JObjectClass)
//  ['{A1633FC2-F75E-4BFB-9694-86CB041236F0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/x')]
//  Jx = interface(JObject)
//  ['{6700A70A-276B-4C1D-BF30-1A84E09585CA}']
//    { Property Methods }
//
//    { methods }
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJx = class(TJavaGenericImport<JxClass, Jx>) end;

//  JyClass = interface(JObjectClass)
//  ['{C827D959-AEE8-4C64-B17D-1A78F0D061D1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/y')]
//  Jy = interface(JObject)
//  ['{3E2302F2-9408-487D-AEE4-B8BB56C27BFD}']
//    { Property Methods }
//
//    { methods }
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl;
//    function createFromParcel(P1: JParcel): JObject; cdecl;
//
//    { Property }
//  end;

//  TJy = class(TJavaGenericImport<JyClass, Jy>) end;

//  JzClass = interface(JObjectClass)
//  ['{EE355E66-21AC-423C-A808-31F2ADCCFD3B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jz; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/common/z')]
//  Jz = interface(JObject)
//  ['{255279EA-FCB9-4274-8767-336568643289}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JEnum>; P2: JString; P3: JEnum): JEnum; cdecl; overload;
//
//    { Property }
//  end;

//  TJz = class(TJavaGenericImport<JzClass, Jz>) end;

//  Ja_106Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{4DF207F8-C9E8-441E-8137-EA5CDC23B47D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_106; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/d/a')]
//  Ja_106 = interface(JBroadcastReceiver) // or JObject
//  ['{FC885910-50C7-4BBB-B5AE-D7481714749D}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJa_106 = class(TJavaGenericImport<Ja_106Class, Ja_106>) end;

//  Ja_a_107Class = interface(JEnumClass) // or JObjectClass
//  ['{7B2EFA3C-6621-4F71-8D97-C23B72E4E2B5}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: TJavaArray<Integer>; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: Integer read _Getc;
//  end;

//  [JavaSignature('com/dothantech/data/a$a')]
//  Ja_a_107 = interface(JEnum) // or JObject
//  ['{9CCE027B-BD3B-41E1-B84E-5FE5DB052AED}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_a_107 = class(TJavaGenericImport<Ja_a_107Class, Ja_a_107>) end;

//  Ja_108Class = interface(JObjectClass)
//  ['{66A27C3C-35F6-489A-ABEA-9A1FA56903E2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb_a; P2: JIDzPrinter2_PrinterParam): Ja_108; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/a')]
//  Ja_108 = interface(JObject)
//  ['{A20FD017-3E73-4D58-9804-6C3F2CCB6CD0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JBitmap; P2: JBundle): Boolean; cdecl; overload;
//    function a: Jh_a; cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJa_108 = class(TJavaGenericImport<Ja_108Class, Ja_108>) end;

//  Jb_109Class = interface(JObjectClass)
//  ['{21B5E902-B7DB-4A2A-8357-E6F69A94EDC0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/b')]
//  Jb_109 = interface(JObject)
//  ['{EE34A941-168E-4533-A4A5-392A582A8C2D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_109 = class(TJavaGenericImport<Jb_109Class, Jb_109>) end;

//  Jc_110Class = interface(JObjectClass)
//  ['{B91EC8F8-9163-496C-A2E7-ADFE03DC54FF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIDzPrinter_PrinterAddress): JIDzPrinter2_PrinterParam; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/c')]
//  Jc_110 = interface(JObject)
//  ['{83802DDE-779D-414E-9629-60074D661284}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_110 = class(TJavaGenericImport<Jc_110Class, Jc_110>) end;

//  Jd_a_aClass = interface(JEnumClass) // or JObjectClass
//  ['{09763A4A-DEB3-4E88-95F6-BD99A1F2797D}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: Integer read _Getc;
//  end;

//  [JavaSignature('com/dothantech/data/d$a$a')]
//  Jd_a_a = interface(JEnum) // or JObject
//  ['{D87B7CFA-F301-4012-BC7E-59AC72D09ED8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_a_a = class(TJavaGenericImport<Jd_a_aClass, Jd_a_a>) end;

//  Jd_aClass = interface(JObjectClass)
//  ['{433DC043-ADFF-483C-8B74-EA59A0FBAD8E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/d$a')]
//  Jd_a = interface(IJavaInstance)
//  ['{AD713F6C-44CC-421F-B8D9-186DA6C5510E}']
//    { Property Methods }
//
//    { methods }
//    procedure b(P1: Boolean); cdecl;
//    function c: Integer; cdecl;
//
//    { Property }
//  end;

//  TJd_a = class(TJavaGenericImport<Jd_aClass, Jd_a>) end;

//  Jd_bClass = interface(JObjectClass)
//  ['{433E0027-57C3-4D65-A7FD-05BB619CB67B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/d$b')]
//  Jd_b = interface(IJavaInstance)
//  ['{8285DCF1-260A-4D40-B80C-888CA4A28DE1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Boolean): Boolean; cdecl;
//    procedure a_(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJd_b = class(TJavaGenericImport<Jd_bClass, Jd_b>) end;

//  Jd_114Class = interface(JObjectClass)
//  ['{624B5C99-E861-4031-8353-0A0AA7A41139}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/d')]
//  Jd_114 = interface(IJavaInstance)
//  ['{C2776DEF-3E9A-4E3B-9D43-070A90607AC1}']
//    { Property Methods }
//
//    { methods }
//    function b: JString; cdecl; overload;
//    procedure a(P1: Ji_a); cdecl; overload;
//    procedure a(P1: JIDzPrinter_PrinterState); cdecl; overload;
//    function a(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
//    function b(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
//    procedure a(P1: Je); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJd_114 = class(TJavaGenericImport<Jd_114Class, Jd_114>) end;

//  JDzTagObject_aClass = interface(JEnumClass) // or JObjectClass
//  ['{A6CB26B8-F896-4C4F-A61F-11E46E7469A5}']
//    { static Property Methods }
//    {class} function _Geta: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<JDzTagObject_a>; cdecl;
//    {class} function valueOf(P1: JString): JDzTagObject_a; cdecl;
//
//    { static Property }
//    {class} property a: JDzTagObject_a read _Geta;
//    {class} property b: JDzTagObject_a read _Getb;
//    {class} property c: JDzTagObject_a read _Getc;
//  end;

//  [JavaSignature('com/dothantech/data/DzTagObject$a')]
//  JDzTagObject_a = interface(JEnum) // or JObject
//  ['{991A933A-508B-43EE-A1F6-57C1A7EA04B2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDzTagObject_a = class(TJavaGenericImport<JDzTagObject_aClass, JDzTagObject_a>) end;

  JDzTagObjectClass = interface(JObjectClass)
  ['{242FF4C0-F2D2-4193-BB47-B90194B5F5F6}']
    { static Property Methods }
    {class} function _GetXmlSerializerIndent: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetXmlSerializerNewLine: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString): JDzTagObject; cdecl; overload;
//    {class} function init(P1: JString; P2: JString; P3: JDzTagObject_a): JDzTagObject; cdecl; overload;
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
  ['{D50DD55A-AD2B-4653-BBCB-01842E88B40B}']
    { Property Methods }
    function _GetTagName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTagName(aTagName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetTagValue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTagValue(aTagValue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetTagType: JDzTagObject_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetTagType(aTagType: JDzTagObject_a);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetChildren: Je;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetChildren(aChildren: Je);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

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
//    function safeChildren: Je; cdecl;
//    function getChild(P1: JString): JDzTagObject; cdecl;
//    function getChildren(P1: JString): Je; cdecl;

    { Property }
    property TagName: JString read _GetTagName write _SetTagName;
    property TagValue: JString read _GetTagValue write _SetTagValue;
//    property TagType: JDzTagObject_a read _GetTagType write _SetTagType;
//    property Children: Je read _GetChildren write _SetChildren;
  end;

  TJDzTagObject = class(TJavaGenericImport<JDzTagObjectClass, JDzTagObject>) end;

//  Je_a_117Class = interface(JObjectClass)
//  ['{9DE736A9-B677-4E11-9A42-80CF82C6971E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je): Je_a_117; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/e$a')]
//  Je_a_117 = interface(JObject)
//  ['{AB306518-1262-46CC-8A62-DEAEEC151E9C}']
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
//    function g: TJavaArray<Byte>; cdecl;
//    function a(P1: Integer): TJavaArray<Byte>; cdecl; overload;
//    function h: TJavaArray<Integer>; cdecl;
//
//    { Property }
//  end;

//  TJe_a_117 = class(TJavaGenericImport<Je_a_117Class, Je_a_117>) end;

//  Je_118Class = interface(JObjectClass)
//  ['{A92039A6-B304-45B0-AC9E-3C19225DF6CB}']
//    { static Property Methods }
//    {class} function _Geta: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a; cdecl; overload;
//    {class} procedure b; cdecl; overload;
//    {class} function c: Boolean; cdecl;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Je; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): Je; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): Je; cdecl; overload;
//    {class} function init(P1: Byte): Je_118; cdecl; overload;
//    {class} function init(P1: Byte; P2: TJavaArray<Byte>): Je_118; cdecl; overload;
//    {class} function init(P1: Byte; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: Integer; P7: Integer): Je_118; cdecl; overload;
//    {class} function init(P1: Byte; P2: Byte): Je_118; cdecl; overload;
//    {class} function init(P1: Byte; P2: Byte; P3: Byte): Je_118; cdecl; overload;
//    {class} function init(P1: Byte; P2: Byte; P3: Byte; P4: Byte): Je_118; cdecl; overload;
//    {class} function init(P1: Byte; P2: Word): Je_118; cdecl; overload;
//    {class} function init(P1: Byte; P2: Word; P3: Boolean): Je_118; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Word): Integer; cdecl; overload;
//    {class} function b(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl; overload;
//
//    { static Property }
//    {class} property a: Byte read _Geta;
//    {class} property b: Byte read _Getb;
//    {class} property c: Boolean read _Getc;
//  end;

//  [JavaSignature('com/dothantech/data/e')]
//  Je_118 = interface(JObject)
//  ['{A677C761-EE20-49AB-AB98-8DFAF714B100}']
//    { Property Methods }
//    function _Getd: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function d: Integer; cdecl;
//    function e: TJavaArray<Byte>; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//    property d: Byte read _Getd write _Setd;
//    property e: TJavaArray<Byte> read _Gete write _Sete;
//  end;

//  TJe_118 = class(TJavaGenericImport<Je_118Class, Je_118>) end;

//  Jf_119Class = interface(JObjectClass)
//  ['{D634ED74-A07E-4F0A-9D95-EC9594D38A47}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/f')]
//  Jf_119 = interface(JObject)
//  ['{2124C61B-AB01-4636-814F-3CC98D85D4FA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_119 = class(TJavaGenericImport<Jf_119Class, Jf_119>) end;

//  Jg_120Class = interface(JObjectClass)
//  ['{6A8DEA73-FFED-4BF2-BF6C-0A22564879C0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jab; P2: JBundle): Jg_120; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/g')]
//  Jg_120 = interface(JObject)
//  ['{AFF4073B-2DB3-45B5-8EAE-9F0F4D51727A}']
//    { Property Methods }
//
//    { methods }
//    function a: Jh_a; cdecl;
//
//    { Property }
//  end;

//  TJg_120 = class(TJavaGenericImport<Jg_120Class, Jg_120>) end;

//  Jh_aClass = interface(JObjectClass)
//  ['{576C8BA7-F927-40DA-8CB0-3046EDE36F07}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/h$a')]
//  Jh_a = interface(JObject)
//  ['{AAAFE8D0-F33B-4A7E-944B-4216516C1C10}']
//    { Property Methods }
//
//    { methods }
//    function a: Jh_b; cdecl; overload;
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function d: Boolean; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Boolean; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer): Boolean; cdecl; overload;
//    function a(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
//    function a(P1: Je): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: Byte): Boolean; cdecl; overload;
//    function a(P1: Jh_a): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJh_a = class(TJavaGenericImport<Jh_aClass, Jh_a>) end;

//  Jh_bClass = interface(Jh_123Class) // or JObjectClass
//  ['{578C8B92-C2C6-4DC5-BE4A-0F5113629389}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_b; cdecl; overload;
//    {class} function init(P1: TJavaArray<Byte>; P2: Integer): Jh_b; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/h$b')]
//  Jh_b = interface(Jh_123) // or JObject
//  ['{64964555-B768-4839-84ED-F408D614E7C6}']
//    { Property Methods }
//
//    { methods }
//    function d: Jh_b; cdecl;
//
//    { Property }
//  end;

//  TJh_b = class(TJavaGenericImport<Jh_bClass, Jh_b>) end;

//  Jh_123Class = interface(JObjectClass)
//  ['{1802A35E-A206-4C2D-A828-F8D6444A774D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_123; cdecl; overload;
//    {class} function init(P1: TJavaArray<Byte>; P2: Integer): Jh_123; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/h')]
//  Jh_123 = interface(JObject)
//  ['{5C90F629-0C13-4E29-857F-DFD50561D959}']
//    { Property Methods }
//    function _Geta: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer): Boolean; cdecl; overload;
//    function a(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
//    function a(P1: Byte): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: TJavaArray<Byte>): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: Byte): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: Byte; P3: Byte): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: Word): Boolean; cdecl; overload;
//    function a(P1: Byte; P2: Word; P3: Boolean): Boolean; cdecl; overload;
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//    property a: TJavaArray<Byte> read _Geta write _Seta;
//  end;

//  TJh_123 = class(TJavaGenericImport<Jh_123Class, Jh_123>) end;

//  Ji_a_124Class = interface(JObjectClass)
//  ['{BE8C2BD3-3856-4148-8572-7F61B2E53336}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/i$a')]
//  Ji_a_124 = interface(IJavaInstance)
//  ['{AB3A8C88-65C8-4B99-BDC8-EDA69ABB1ED5}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJi_a_124 = class(TJavaGenericImport<Ji_a_124Class, Ji_a_124>) end;

//  Ji_125Class = interface(JObjectClass)
//  ['{FA7F3855-A428-4AAF-85D1-62F2948CBCA7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji_125; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/i')]
//  Ji_125 = interface(JObject)
//  ['{B1112490-6F9B-4433-BC7C-E79B432C514F}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Ji_a); cdecl; overload;
//    procedure a(P1: Byte); cdecl; overload;
//    procedure a(P1: TJavaArray<Byte>; P2: Integer); cdecl; overload;
//    procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer); cdecl; overload;
//
//    { Property }
//  end;

//  TJi_125 = class(TJavaGenericImport<Ji_125Class, Ji_125>) end;

//  Jj_aClass = interface(Jh_aClass) // or JObjectClass
//  ['{3D174912-7C0C-4047-A844-08F6CDF328FC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/j$a')]
//  Jj_a = interface(Jh_a) // or JObject
//  ['{5F19DD56-A672-4C4A-B126-E0661CA33630}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj_a = class(TJavaGenericImport<Jj_aClass, Jj_a>) end;

//  Jj_bClass = interface(JExceptionClass) // or JObjectClass
//  ['{13CCBD63-8710-4271-BE68-6C875D3B7E9F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/j$b')]
//  Jj_b = interface(JException) // or JObject
//  ['{7DCC03DA-EA64-43D2-AAB4-E2BC3F0506C2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj_b = class(TJavaGenericImport<Jj_bClass, Jj_b>) end;

//  Jj_cClass = interface(JEnumClass) // or JObjectClass
//  ['{2894C90F-2C72-4113-9071-5E04DC08141B}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: Integer read _Getc;
//    {class} property d: Integer read _Getd;
//  end;

//  [JavaSignature('com/dothantech/data/j$c')]
//  Jj_c = interface(JEnum) // or JObject
//  ['{5D788262-9F11-4C11-9EE5-15CE5782CB4E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj_c = class(TJavaGenericImport<Jj_cClass, Jj_c>) end;

//  Jj_129Class = interface(JObjectClass)
//  ['{C63DDF28-AE90-40EC-8558-EDE02C6D1131}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_129; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/data/j')]
//  Jj_129 = interface(JObject)
//  ['{8EE40C73-A099-4BD1-AF3E-FFCD5507A00F}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JContext; P2: JString): Integer; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: JArrayList read _Getb write _Setb;
//  end;

//  TJj_129 = class(TJavaGenericImport<Jj_129Class, Jj_129>) end;

//  Ja_130Class = interface(Jd_133Class) // or JObjectClass
//  ['{E859D5A2-B1ED-4F22-997D-56ABD2E52342}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;

//  [JavaSignature('com/dothantech/e/a')]
//  Ja_130 = interface(Jd_133) // or JObject
//  ['{E7A9CFE4-A2CB-4E87-8664-4A737BC55CFF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJa_130 = class(TJavaGenericImport<Ja_130Class, Ja_130>) end;

//  Jb_131Class = interface(Jf_135Class) // or JObjectClass
//  ['{ED72E275-60A8-48FF-BCC9-31A7F9EF84C0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/e/b')]
//  Jb_131 = interface(Jf_135) // or JObject
//  ['{5DB3A4AB-1101-4020-8D30-285EFA678BF6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_131 = class(TJavaGenericImport<Jb_131Class, Jb_131>) end;

//  Jc_132Class = interface(Jf_135Class) // or JObjectClass
//  ['{2DA2F225-5B73-4E2F-AF40-594E09247BE1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/e/c')]
//  Jc_132 = interface(Jf_135) // or JObject
//  ['{36B5BDDC-9703-4543-B669-0C9DEB76315C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_132 = class(TJavaGenericImport<Jc_132Class, Jc_132>) end;

//  Jd_133Class = interface(JObjectClass)
//  ['{EF5D3AE1-4840-4C9A-B81F-EBD625C2EDF2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: JString): Integer; cdecl;
//    {class} function c(P1: JString): Jd; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/e/d')]
//  Jd_133 = interface(JObject)
//  ['{22928745-7221-4343-9C33-794F0C53E0A4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_133 = class(TJavaGenericImport<Jd_133Class, Jd_133>) end;

//  Je_134Class = interface(Jf_135Class) // or JObjectClass
//  ['{8667D3F6-9F4F-4C06-8936-DFC8C5DB649E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/e/e')]
//  Je_134 = interface(Jf_135) // or JObject
//  ['{83D9EC6F-0D80-4901-A005-FA1C6706F4DA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_134 = class(TJavaGenericImport<Je_134Class, Je_134>) end;

//  Jf_135Class = interface(Jd_133Class) // or JObjectClass
//  ['{C53E6D5F-A0D3-4BB3-B143-1D4B5F006F4A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/e/f')]
//  Jf_135 = interface(Jd_133) // or JObject
//  ['{058682AB-0C8B-42F0-9DE5-B2DA97CA4880}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_135 = class(TJavaGenericImport<Jf_135Class, Jf_135>) end;

//  Ja_136Class = interface(Jc_138Class) // or JObjectClass
//  ['{E5A9E0F2-774C-4383-9BE0-23062577F83E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JInputStream): Ja_136; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/f/a')]
//  Ja_136 = interface(Jc_138) // or JObject
//  ['{1516CBDE-9275-43B0-958C-F1B8811EA60E}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Ji_a); cdecl;
//
//    { Property }
//  end;

//  TJa_136 = class(TJavaGenericImport<Ja_136Class, Ja_136>) end;

//  Jb_137Class = interface(Ji_125Class) // or JObjectClass
//  ['{B663F0DD-5CCC-47E4-94ED-0A0235E08270}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/f/b')]
//  Jb_137 = interface(Ji_125) // or JObject
//  ['{72F02F04-DC16-4866-A44C-564F0831C06B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_137 = class(TJavaGenericImport<Jb_137Class, Jb_137>) end;

//  Jc_138Class = interface(JObjectClass)
//  ['{41562589-C596-466F-8191-6F4970134129}']
//    { static Property Methods }
//    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JInputStream): Jc_138; cdecl;
//
//    { static Property }
//    {class} property a: Jw read _Geta;
//  end;

//  [JavaSignature('com/dothantech/f/c')]
//  Jc_138 = interface(JObject)
//  ['{7244DEF8-94DF-452A-B687-7FD90E32A967}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_138 = class(TJavaGenericImport<Jc_138Class, Jc_138>) end;

//  Jd_139Class = interface(JThreadClass) // or JObjectClass
//  ['{B57B1D3D-DF1A-475E-BD0A-A8F35FBFB1EF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/f/d')]
//  Jd_139 = interface(JThread) // or JObject
//  ['{EBA363C2-17BF-4586-BFC4-71C0DB799A7E}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJd_139 = class(TJavaGenericImport<Jd_139Class, Jd_139>) end;

//  Ja_a_140Class = interface(JObjectClass)
//  ['{0793CFC8-3BBC-42CA-A02D-206DBC770E1F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JUsbInterface; P3: JUsbEndpoint; P4: JUsbEndpoint): Ja_a_140; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/g/a$a')]
//  Ja_a_140 = interface(JObject)
//  ['{99312AF1-7DF5-41F9-86A8-4F3B7090D871}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JUsbInterface;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JUsbInterface);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JUsbEndpoint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JUsbEndpoint);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JUsbEndpoint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JUsbEndpoint);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JUsbInterface read _Getb write _Setb;
//    property c: JUsbEndpoint read _Getc write _Setc;
//    property d: JUsbEndpoint read _Getd write _Setd;
//  end;

//  TJa_a_140 = class(TJavaGenericImport<Ja_a_140Class, Ja_a_140>) end;

//  Ja_141Class = interface(JObjectClass)
//  ['{AF6B2D56-A0A0-4D56-B70B-3F111C640166}']
//    { static Property Methods }
//    {class} function _Geta: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JUsbDevice): Ja_a; cdecl; overload;
//    {class} function init(P1: JUsbDevice; P2: JUsbDeviceConnection; P3: Ja_a): Ja_141; cdecl;
//
//    { static Property }
//    {class} property a: Jw read _Geta;
//  end;

//  [JavaSignature('com/dothantech/g/a')]
//  Ja_141 = interface(JObject)
//  ['{93AA2FF5-A314-4E16-A205-EE2F36D4476A}']
//    { Property Methods }
//
//    { methods }
//    function b: JString; cdecl; overload;
//    function a(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
//    function b(P1: JIDzPrinter2_PrinterParam): Boolean; cdecl; overload;
//    procedure a(P1: Ji_a); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJa_141 = class(TJavaGenericImport<Ja_141Class, Ja_141>) end;

//  Jb_142Class = interface(Jf_146Class) // or JObjectClass
//  ['{FF232A23-E598-4B51-B4EF-6399F64C43EC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/g/b')]
//  Jb_142 = interface(Jf_146) // or JObject
//  ['{0F8044E4-0977-4387-8551-3A75C1E916B1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_142 = class(TJavaGenericImport<Jb_142Class, Jb_142>) end;

//  Jc_143Class = interface(JObjectClass)
//  ['{6D2EADAE-F908-4B2E-8D51-44254C053501}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jc_143; cdecl;
//    {class} function a(P1: JUsbManager; P2: JUsbDevice): JUsbDeviceConnection; cdecl; overload;
//    {class} procedure a(P1: JUsbDeviceConnection); cdecl; overload;
//    {class} function d(P1: JUsbDevice): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/g/c')]
//  Jc_143 = interface(JObject)
//  ['{862A1A9C-E3BC-4A63-9419-087670090FDA}']
//    { Property Methods }
//    function _Geta: JUsbManager;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JUsbManager);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a; cdecl; overload;
//    function b: JUsbDevice; cdecl; overload;
//    function a(P1: JString; P2: Boolean): JUsbDevice; cdecl; overload;
//    function b(P1: JString; P2: Boolean): JUsbDevice; cdecl; overload;
//    function e(P1: JUsbDevice): Boolean; cdecl;
//    function c(P1: JUsbDevice): Boolean; cdecl;
//
//    { Property }
//    property a: JUsbManager read _Geta write _Seta;
//  end;

//  TJc_143 = class(TJavaGenericImport<Jc_143Class, Jc_143>) end;

//  Jd_144Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{9ECD0387-597B-4535-8BAF-CC1A0BB63E1A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/g/d')]
//  Jd_144 = interface(JBroadcastReceiver) // or JObject
//  ['{3CA1DF09-36AD-41ED-9A8A-B36927B5A062}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJd_144 = class(TJavaGenericImport<Jd_144Class, Jd_144>) end;

//  Je_145Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{CA0F1C9D-6CB2-4E54-9B2F-942ECB9B4BF9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/g/e')]
//  Je_145 = interface(JBroadcastReceiver) // or JObject
//  ['{D42B4051-BE7C-48FA-9BA8-206591D3DC63}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJe_145 = class(TJavaGenericImport<Je_145Class, Je_145>) end;

//  Jf_146Class = interface(JObjectClass)
//  ['{B82017DD-596A-4A44-A8CB-95011C6F4ED4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JUsbDeviceConnection; P2: JUsbEndpoint): Jf_146; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/g/f')]
//  Jf_146 = interface(JObject)
//  ['{1ED13A81-6A9F-42EE-B9B0-81539AC6724A}']
//    { Property Methods }
//
//    { methods }
//    procedure b; cdecl;
//    procedure a(P1: Ji_a); cdecl;
//
//    { Property }
//  end;

//  TJf_146 = class(TJavaGenericImport<Jf_146Class, Jf_146>) end;

//  Jg_147Class = interface(JThreadClass) // or JObjectClass
//  ['{C0BC033B-A320-4463-B626-29096DA840E2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/g/g')]
//  Jg_147 = interface(JThread) // or JObject
//  ['{E0949D02-41B1-463D-8A6B-277E5F3C4C1E}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg_147 = class(TJavaGenericImport<Jg_147Class, Jg_147>) end;

//  Jh_148Class = interface(Ji_125Class) // or JObjectClass
//  ['{481AA023-30F7-4ACE-8C93-BDD6278C5549}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/g/h')]
//  Jh_148 = interface(Ji_125) // or JObject
//  ['{E128DFF5-2961-42E0-BB7E-C535067AFB7B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh_148 = class(TJavaGenericImport<Jh_148Class, Jh_148>) end;

//  Ja_149Class = interface(JObjectClass)
//  ['{E3124612-755C-444E-A44B-1985915DB05B}']
//    { static Property Methods }
//    {class} function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: Ja read _Geta;
//  end;

//  [JavaSignature('com/dothantech/h/a/a/a')]
//  Ja_149 = interface(JObject)
//  ['{707C5931-A7B6-4066-BADA-63551B29D30F}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJa_149 = class(TJavaGenericImport<Ja_149Class, Ja_149>) end;

//  Jb_150Class = interface(JObjectClass)
//  ['{E41934F6-A20A-4BB9-BC39-BDDC798B9215}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/a/a/b')]
//  Jb_150 = interface(JObject)
//  ['{44B030A2-ECDF-43C1-A0B5-A320DFF20D2A}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJb_150 = class(TJavaGenericImport<Jb_150Class, Jb_150>) end;

//  Jc_151Class = interface(JObjectClass)
//  ['{68981735-06CF-481D-B087-294696F1DEAA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja): Jc_151; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/a/a/c')]
//  Jc_151 = interface(JObject)
//  ['{D0A33416-9C69-459D-85EF-9ACE83DACFBC}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Integer>; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJc_151 = class(TJavaGenericImport<Jc_151Class, Jc_151>) end;

//  Ja_152Class = interface(JObjectClass)
//  ['{7012A20C-9C34-4569-9961-DBC5B8494626}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_152; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/a/a')]
//  Ja_152 = interface(JObject)
//  ['{5E5D9CA1-5057-4CE2-97A9-38666A857449}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function a(P1: Integer): Boolean; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: Ja); cdecl; overload;
//    procedure a(P1: TJavaArray<Byte>); cdecl; overload;
//    procedure b(P1: Ja); cdecl; overload;
//    procedure a(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer); cdecl; overload;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//    function clone: JObject; cdecl;
//
//    { Property }
//  end;

//  TJa_152 = class(TJavaGenericImport<Ja_152Class, Ja_152>) end;

//  Jb_153Class = interface(JObjectClass)
//  ['{3C83F6BB-5516-4E10-87BE-66CFDC6CCD2B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): Jb_153; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/a/b')]
//  Jb_153 = interface(JObject)
//  ['{CF53C43D-08A5-4AB4-857F-5506D999747B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl; overload;
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//    function clone: JObject; cdecl;
//
//    { Property }
//  end;

//  TJb_153 = class(TJavaGenericImport<Jb_153Class, Jb_153>) end;

//  Jc_154Class = interface(JEnumClass) // or JObjectClass
//  ['{2E18D97B-78AD-4B43-87C8-D288F113F40C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jc>; cdecl;
//    {class} function valueOf(P1: JString): Jc; cdecl;
//    {class} function a(P1: JCharset): Jc; cdecl; overload;
//    {class} function a(P1: JString): Jc; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/a/c')]
//  Jc_154 = interface(JEnum) // or JObject
//  ['{A0446E3D-3D44-49B0-BB28-DACDA858256A}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJc_154 = class(TJavaGenericImport<Jc_154Class, Jc_154>) end;

//  Jd_155Class = interface(JObjectClass)
//  ['{AF94E9EA-CE9E-4EB1-A6AC-D0C4C034AF98}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JCharset; P3: Integer): Jd_155; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/a/d')]
//  Jd_155 = interface(JObject)
//  ['{BC4E3003-49D3-479B-8D79-344DCE2B808A}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function a(P1: Integer): JCharset; cdecl; overload;
//    function b(P1: Integer): Integer; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function a(P1: Char; P2: Integer): Boolean; cdecl; overload;
//    function b(P1: Char; P2: Integer): TJavaArray<Byte>; cdecl; overload;
//    function a(P1: JString; P2: Integer): TJavaArray<Byte>; cdecl; overload;
//
//    { Property }
//  end;

//  TJd_155 = class(TJavaGenericImport<Jd_155Class, Jd_155>) end;

//  Je_a_156Class = interface(JObjectClass)
//  ['{E67FEC86-0524-42CD-9FFE-C6FB43FAAC19}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/a/e$a')]
//  Je_a_156 = interface(JObject)
//  ['{F6E86529-6009-4A9B-A4F2-A3B84D9EFB20}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_a_156 = class(TJavaGenericImport<Je_a_156Class, Je_a_156>) end;

//  Je_157Class = interface(JObjectClass)
//  ['{DFED40E8-EDE1-4778-BC61-0F7F6CEAF11C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JCharset; P3: Integer): Je_157; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/a/e')]
//  Je_157 = interface(JObject)
//  ['{AB550638-02F8-4BCC-9E93-02B06BA1B827}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
//    function a(P1: Integer): Char; cdecl; overload;
//    function b(P1: Integer): Boolean; cdecl; overload;
//    function c(P1: Integer): Boolean; cdecl;
//    function d(P1: Integer): Integer; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJe_157 = class(TJavaGenericImport<Je_157Class, Je_157>) end;

//  Jf_158Class = interface(JObjectClass)
//  ['{D11642A5-9CEE-4578-A532-6D905FCAFA7B}']
//    { static Property Methods }
//    {class} function _Geta: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: JCharset read _Geta;
//  end;

//  [JavaSignature('com/dothantech/h/a/f')]
//  Jf_158 = interface(JObject)
//  ['{A7F9526B-8E46-4BC6-8549-68819143BF66}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_158 = class(TJavaGenericImport<Jf_158Class, Jf_158>) end;

//  Ja_159Class = interface(JEnumClass) // or JObjectClass
//  ['{70369900-C99D-46FB-991B-AF7B60061F63}']
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

//  [JavaSignature('com/dothantech/h/a')]
//  Ja_159 = interface(JEnum) // or JObject
//  ['{CC03C3F6-D8C1-4D55-BF67-8F6C3CF32A37}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_159 = class(TJavaGenericImport<Ja_159Class, Ja_159>) end;

//  Ja_160Class = interface(JObjectClass)
//  ['{3C690555-732B-42F9-9C34-8C17F18DEA83}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jl; P3: Jb; P4: Jb; P5: Boolean): JString; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/a')]
//  Ja_160 = interface(JObject)
//  ['{62640FC2-D786-4FCF-A5C0-F19A15B51D83}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jg); cdecl; overload;
//
//    { Property }
//  end;

//  TJa_160 = class(TJavaGenericImport<Ja_160Class, Ja_160>) end;

//  Jb_161Class = interface(JObjectClass)
//  ['{E25EDD34-46E8-4400-98B0-C91DB699DAC2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/b')]
//  Jb_161 = interface(JObject)
//  ['{E1CA386A-174A-43FC-BF6F-79F02B5E239E}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jg); cdecl;
//
//    { Property }
//  end;

//  TJb_161 = class(TJavaGenericImport<Jb_161Class, Jb_161>) end;

//  Jc_162Class = interface(JObjectClass)
//  ['{45CD7DA2-63C2-4068-BDE1-0CB97E12CCC2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/c')]
//  Jc_162 = interface(JObject)
//  ['{58F50D7E-9960-4434-9489-BF86246EB2F7}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jg); cdecl; overload;
//
//    { Property }
//  end;

//  TJc_162 = class(TJavaGenericImport<Jc_162Class, Jc_162>) end;

//  Jd_163Class = interface(Jk_174Class) // or JObjectClass
//  ['{C4C6CF8E-C374-41BF-86A9-BA0A1D3D88C1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/d')]
//  Jd_163 = interface(Jk_174) // or JObject
//  ['{27F384F9-68EC-4D7C-A486-748FE6D78E68}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function a(P1: Integer): Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJd_163 = class(TJavaGenericImport<Jd_163Class, Jd_163>) end;

//  Je_164Class = interface(JObjectClass)
//  ['{D447928E-3038-40B7-949B-2BC21D77EE74}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/e')]
//  Je_164 = interface(JObject)
//  ['{F94DDD75-6FB3-4077-988A-0CFE8DA8D054}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jg); cdecl;
//
//    { Property }
//  end;

//  TJe_164 = class(TJavaGenericImport<Je_164Class, Je_164>) end;

//  Jf_165Class = interface(JObjectClass)
//  ['{D0AE5F0C-A4D7-41AB-805E-F11C58F0359C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/f')]
//  Jf_165 = interface(IJavaInstance)
//  ['{864E7D60-41D6-4C33-8249-3E4F8EBBE145}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jg); cdecl;
//
//    { Property }
//  end;

//  TJf_165 = class(TJavaGenericImport<Jf_165Class, Jf_165>) end;

//  Jg_166Class = interface(JObjectClass)
//  ['{632075CF-8385-4527-9C10-BCEB5CB575F6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/g')]
//  Jg_166 = interface(JObject)
//  ['{8E7B4CA8-8D41-48AC-BAB0-24E0FC7C9A8B}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jl); cdecl; overload;
//    procedure a(P1: Jb; P2: Jb); cdecl; overload;
//    function a: JString; cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    function b: Char; cdecl; overload;
//    function c: JStringBuilder; cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: Char); cdecl; overload;
//    function d: Integer; cdecl;
//    function e: Integer; cdecl;
//    procedure b(P1: Integer); cdecl; overload;
//    procedure f; cdecl;
//    function g: Boolean; cdecl;
//    function h: Integer; cdecl;
//    function i: Jk; cdecl;
//    procedure j; cdecl;
//    procedure c(P1: Integer); cdecl; overload;
//    procedure k; cdecl;
//
//    { Property }
//  end;

//  TJg_166 = class(TJavaGenericImport<Jg_166Class, Jg_166>) end;

//  Jh_167Class = interface(JObjectClass)
//  ['{841C9851-76CE-4B6F-9AD1-63219E621776}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jk): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/h')]
//  Jh_167 = interface(JObject)
//  ['{52BE6F71-1DAC-46BE-A8C5-890E1B4A4995}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh_167 = class(TJavaGenericImport<Jh_167Class, Jh_167>) end;

//  Ji_a_168Class = interface(JObjectClass)
//  ['{5A8A25D0-47A8-48DD-BA9A-75CD0F8C14A4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/i$a')]
//  Ji_a_168 = interface(JObject)
//  ['{BD237657-C9CA-47DA-9C00-08D90B7D0ADE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi_a_168 = class(TJavaGenericImport<Ji_a_168Class, Ji_a_168>) end;

//  Ji_bClass = interface(Je_157Class) // or JObjectClass
//  ['{E48E55E7-534D-4470-A42A-BA4CABD38D5F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/i$b')]
//  Ji_b = interface(Je_157) // or JObject
//  ['{12D15D87-89AC-4148-A2BA-6D474548E2CF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi_b = class(TJavaGenericImport<Ji_bClass, Ji_b>) end;

//  Ji_cClass = interface(JEnumClass) // or JObjectClass
//  ['{F17526BD-6DFB-4DCA-BF7A-B8409C653805}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: TJavaArray<Integer>; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: Integer read _Getc;
//    {class} property d: Integer read _Getd;
//    {class} property e: Integer read _Gete;
//    {class} property f: Integer read _Getf;
//  end;

//  [JavaSignature('com/dothantech/h/b/a/i$c')]
//  Ji_c = interface(JEnum) // or JObject
//  ['{85C7235F-D862-4DAA-9A6D-2B7C382ECA83}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi_c = class(TJavaGenericImport<Ji_cClass, Ji_c>) end;

//  Ji_dClass = interface(JObjectClass)
//  ['{EB78AE81-FE88-443B-BB67-9D3D71BC090C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/i$d')]
//  Ji_d = interface(JObject)
//  ['{8F98E36C-77F7-41C5-9BDE-1CD5EE61EE8E}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;

//  TJi_d = class(TJavaGenericImport<Ji_dClass, Ji_d>) end;

//  Ji_172Class = interface(JObjectClass)
//  ['{B8F913D6-1F95-424C-BEA5-2229B82CFF67}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: JCharset; P3: Integer; P4: Jl): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/i')]
//  Ji_172 = interface(JObject)
//  ['{E510FBDF-8AC5-4A00-9C4A-E1C1F91AE120}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi_172 = class(TJavaGenericImport<Ji_172Class, Ji_172>) end;

//  Jj_173Class = interface(JObjectClass)
//  ['{4D3CA4C4-3517-4CAB-99B5-10A862E9A5CE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/j')]
//  Jj_173 = interface(JObject)
//  ['{2B4F7E0F-3758-4997-91EB-B937D1B48177}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj_173 = class(TJavaGenericImport<Jj_173Class, Jj_173>) end;

//  Jk_174Class = interface(JObjectClass)
//  ['{3A385A05-036C-4F14-8157-D6937FFBD028}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Jl; P3: Jb; P4: Jb): Jk; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/k')]
//  Jk_174 = interface(JObject)
//  ['{5F5EED2D-4714-4949-9B0F-9B7A025B3379}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function d: Integer; cdecl;
//    function e: Integer; cdecl;
//    function a: Integer; cdecl; overload;
//    function f: Integer; cdecl;
//    function g: Integer; cdecl;
//    function a(P1: Integer): Integer; cdecl; overload;
//    function h: Integer; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//  end;

//  TJk_174 = class(TJavaGenericImport<Jk_174Class, Jk_174>) end;

//  Jl_175Class = interface(JEnumClass) // or JObjectClass
//  ['{5418020E-2ADF-48B5-BE5C-6E4CDF5C0C40}']
//    { static Property Methods }
//    {class} function _Geta: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jl>; cdecl;
//    {class} function valueOf(P1: JString): Jl; cdecl;
//
//    { static Property }
//    {class} property a: Jl read _Geta;
//    {class} property b: Jl read _Getb;
//    {class} property c: Jl read _Getc;
//  end;

//  [JavaSignature('com/dothantech/h/b/a/l')]
//  Jl_175 = interface(JEnum) // or JObject
//  ['{AF7D8276-C147-4098-BE35-9C7E19ED490B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl_175 = class(TJavaGenericImport<Jl_175Class, Jl_175>) end;

//  Jm_176Class = interface(Jc_162Class) // or JObjectClass
//  ['{BC52B8B9-ED74-4203-A770-63D7F2264AEA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/m')]
//  Jm_176 = interface(Jc_162) // or JObject
//  ['{91A6D2E9-BF44-4BA8-8AD5-4AA291F6F91B}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJm_176 = class(TJavaGenericImport<Jm_176Class, Jm_176>) end;

//  Jn_177Class = interface(Jc_162Class) // or JObjectClass
//  ['{25C98F51-9B00-4ECF-A0C0-E4CF4C06181E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b/a/n')]
//  Jn_177 = interface(Jc_162) // or JObject
//  ['{C93A2625-DCA3-4B94-BAAD-D0894FD5610C}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jg); cdecl; overload;
//
//    { Property }
//  end;

//  TJn_177 = class(TJavaGenericImport<Jn_177Class, Jn_177>) end;

//  Jb_178Class = interface(JObjectClass)
//  ['{A1F2EC97-4C75-4DDF-8798-D62AA390DF86}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/b')]
//  Jb_178 = interface(JObject)
//  ['{DE234E54-31D3-482D-BA42-B6AA2BE2D723}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//    function b: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJb_178 = class(TJavaGenericImport<Jb_178Class, Jb_178>) end;

//  Ja_179Class = interface(Jk_198Class) // or JObjectClass
//  ['{A2F51891-BD38-4898-A43B-F5D3305C8922}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_179; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/a')]
//  Ja_179 = interface(Jk_198) // or JObject
//  ['{92BF171A-E014-44B4-BBC0-2374298D50E2}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJa_179 = class(TJavaGenericImport<Ja_179Class, Ja_179>) end;

//  Jb_180Class = interface(Jk_198Class) // or JObjectClass
//  ['{42B88A74-BE1B-4FC4-ADB5-A004C39E6A82}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_180; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/b')]
//  Jb_180 = interface(Jk_198) // or JObject
//  ['{82182542-1C5A-4A44-99FC-A472940F6049}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJb_180 = class(TJavaGenericImport<Jb_180Class, Jb_180>) end;

//  Jc_181Class = interface(Jg_189Class) // or JObjectClass
//  ['{D707F804-FEC0-4689-8FE3-36FE588FBD9F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/c')]
//  Jc_181 = interface(Jg_189) // or JObject
//  ['{31DC75DB-B93C-43E5-84A9-5A3608B66F9F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJc_181 = class(TJavaGenericImport<Jc_181Class, Jc_181>) end;

//  Jd_a_182Class = interface(Jd_184Class) // or JObjectClass
//  ['{A5D56FD8-FEF5-4408-9D78-CF024177DC94}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_a_182; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/d$a')]
//  Jd_a_182 = interface(Jd_184) // or JObject
//  ['{ABE12E2A-E0A8-4E57-9138-7C8895F3D82B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJd_a_182 = class(TJavaGenericImport<Jd_a_182Class, Jd_a_182>) end;

//  Jd_b_183Class = interface(Jd_184Class) // or JObjectClass
//  ['{4753D6B6-5BB9-40B8-82F5-42993D98FA55}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_b_183; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/d$b')]
//  Jd_b_183 = interface(Jd_184) // or JObject
//  ['{93B08BA5-55CB-4312-9CC7-58364C699A64}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJd_b_183 = class(TJavaGenericImport<Jd_b_183Class, Jd_b_183>) end;

//  Jd_184Class = interface(Jk_198Class) // or JObjectClass
//  ['{6FDEA310-B88F-4785-817A-5547E2843A2D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_184; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/d')]
//  Jd_184 = interface(Jk_198) // or JObject
//  ['{7F0A6BCC-38C2-4D69-B187-3BD696831566}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJd_184 = class(TJavaGenericImport<Jd_184Class, Jd_184>) end;

//  Je_185Class = interface(Jg_189Class) // or JObjectClass
//  ['{1351CA1C-DBEF-4AF4-9C85-9D6D20208E1F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/e')]
//  Je_185 = interface(Jg_189) // or JObject
//  ['{082D7BA4-29DA-427D-8688-752D8F357BB1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJe_185 = class(TJavaGenericImport<Je_185Class, Je_185>) end;

//  Jf_186Class = interface(Jg_189Class) // or JObjectClass
//  ['{9FA38DF4-4A09-463F-AB75-C3AEFDE55E0E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/f')]
//  Jf_186 = interface(Jg_189) // or JObject
//  ['{8E7BFB7F-2B05-45AC-91F4-4B85F3015BA2}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJf_186 = class(TJavaGenericImport<Jf_186Class, Jf_186>) end;

//  Jg_aClass = interface(Jg_189Class) // or JObjectClass
//  ['{E615E924-781E-4338-82F0-AB7403E9CC7E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/g$a')]
//  Jg_a = interface(Jg_189) // or JObject
//  ['{4689A539-F4EF-4ACE-A58A-CD827AB736CD}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJg_a = class(TJavaGenericImport<Jg_aClass, Jg_a>) end;

//  Jg_bClass = interface(Jg_189Class) // or JObjectClass
//  ['{831F60D6-7C43-4230-AEC1-37CD5FFD9525}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Jg_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/g$b')]
//  Jg_b = interface(Jg_189) // or JObject
//  ['{E14D2316-1B8A-4719-BA54-8C17B7A1B93A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJg_b = class(TJavaGenericImport<Jg_bClass, Jg_b>) end;

//  Jg_189Class = interface(JObjectClass)
//  ['{420F2061-2771-4FDF-9E54-DFFA034C5A87}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg_189; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/g')]
//  Jg_189 = interface(JObject)
//  ['{3F3CDCEE-82E2-486A-A11C-A4B30A204671}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Char): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJg_189 = class(TJavaGenericImport<Jg_189Class, Jg_189>) end;

//  Jh_a_190Class = interface(Jh_191Class) // or JObjectClass
//  ['{B87426CC-BF94-42C1-857C-54EAF04C026B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_a_190; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/h$a')]
//  Jh_a_190 = interface(Jh_191) // or JObject
//  ['{4100CD6D-35BB-4F2E-8007-B6BBD1D9DA99}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJh_a_190 = class(TJavaGenericImport<Jh_a_190Class, Jh_a_190>) end;

//  Jh_191Class = interface(Jm_201Class) // or JObjectClass
//  ['{39A5F721-C034-4C81-8D3D-F5054D92C873}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_191; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/h')]
//  Jh_191 = interface(Jm_201) // or JObject
//  ['{E99E7BEA-5848-43A4-A59D-99DBC9D7E182}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJh_191 = class(TJavaGenericImport<Jh_191Class, Jh_191>) end;

//  Ji_192Class = interface(Jm_201Class) // or JObjectClass
//  ['{D7EC1390-7027-46FC-B5DB-FD80A896747D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji_192; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/i')]
//  Ji_192 = interface(Jm_201) // or JObject
//  ['{0F7152F1-2109-46A0-8A33-5ABB52E97C85}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJi_192 = class(TJavaGenericImport<Ji_192Class, Ji_192>) end;

//  Jj_a_193Class = interface(Jj_197Class) // or JObjectClass
//  ['{DBBE7CDC-139F-4D20-A27E-F6B10DBD08C8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_a_193; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/j$a')]
//  Jj_a_193 = interface(Jj_197) // or JObject
//  ['{306A0B3C-913F-449C-88BE-32316D3ECB70}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJj_a_193 = class(TJavaGenericImport<Jj_a_193Class, Jj_a_193>) end;

//  Jj_b_194Class = interface(Jj_197Class) // or JObjectClass
//  ['{8064162A-F146-48CF-8CFB-2E661CEC2D4F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_b_194; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/j$b')]
//  Jj_b_194 = interface(Jj_197) // or JObject
//  ['{DB6AEDCE-5CC2-459B-891D-9E13BF0F0B25}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJj_b_194 = class(TJavaGenericImport<Jj_b_194Class, Jj_b_194>) end;

//  Jj_c_195Class = interface(Jj_197Class) // or JObjectClass
//  ['{D24FBAC8-0A44-4260-A763-6DF517161C02}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_c_195; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/j$c')]
//  Jj_c_195 = interface(Jj_197) // or JObject
//  ['{86756012-5B40-4622-A381-D96F6F9EF08F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJj_c_195 = class(TJavaGenericImport<Jj_c_195Class, Jj_c_195>) end;

//  Jj_dClass = interface(Jj_197Class) // or JObjectClass
//  ['{A491AE46-FBA3-4590-8BDC-EEA3995C7418}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/j$d')]
//  Jj_d = interface(Jj_197) // or JObject
//  ['{FCAAC6CF-A188-4C2B-AFB9-9471E90BA069}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJj_d = class(TJavaGenericImport<Jj_dClass, Jj_d>) end;

//  Jj_197Class = interface(Jk_198Class) // or JObjectClass
//  ['{4F116C61-6004-4848-B1A9-82637EC283C5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_197; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/j')]
//  Jj_197 = interface(Jk_198) // or JObject
//  ['{B4283B51-0E59-4D41-93BA-B8A0CADAEC1E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJj_197 = class(TJavaGenericImport<Jj_197Class, Jj_197>) end;

//  Jk_198Class = interface(JObjectClass)
//  ['{10A9A8B3-AD9B-493C-B0B8-8C9289E57DA6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk_198; cdecl;
//    {class} function a(P1: Ja; P2: JString; P3: Integer; P4: Char): Jc_a; cdecl; overload;
//    {class} function a(P1: Ja; P2: JString; P3: Integer; P4: JString; P5: Char): Jc_a; cdecl; overload;
//    {class} function a(P1: Ja; P2: JString; P3: Integer; P4: Jg; P5: Char): Jc_a; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/k')]
//  Jk_198 = interface(JObject)
//  ['{ED578BC6-A69E-47BD-9F99-558F208B952C}']
//    { Property Methods }
//    function _Getc: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//    property c: JMap read _Getc write _Setc;
//  end;

//  TJk_198 = class(TJavaGenericImport<Jk_198Class, Jk_198>) end;

//  Jl_199Class = interface(Jk_198Class) // or JObjectClass
//  ['{106A5C2E-0B48-4565-BFD6-05C81AB110D7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl_199; cdecl;
//    {class} function d(P1: JString): Char; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/l')]
//  Jl_199 = interface(Jk_198) // or JObject
//  ['{3B5777F1-53E7-4BC4-AA65-B4256E478476}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJl_199 = class(TJavaGenericImport<Jl_199Class, Jl_199>) end;

//  Jm_aClass = interface(Jm_201Class) // or JObjectClass
//  ['{E8E659A7-1E3F-4B2F-93D0-170E570B371D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/m$a')]
//  Jm_a = interface(Jm_201) // or JObject
//  ['{19B36F19-A41B-45A7-9F09-D149302F218E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//    function b(P1: JString): Jc_a; cdecl;
//
//    { Property }
//  end;

//  TJm_a = class(TJavaGenericImport<Jm_aClass, Jm_a>) end;

//  Jm_201Class = interface(Jk_198Class) // or JObjectClass
//  ['{E98BF570-DAAD-4BCC-A870-54CB1B0FE5BB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm_201; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/c/m')]
//  Jm_201 = interface(Jk_198) // or JObject
//  ['{E51BA9DA-6A36-42DA-8313-6859D71229ED}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm_201 = class(TJavaGenericImport<Jm_201Class, Jm_201>) end;

//  Jc_202Class = interface(JEnumClass) // or JObjectClass
//  ['{33A31582-BA6B-47FB-836C-B2A29A3460F9}']
//    { static Property Methods }
//    {class} function _Geta: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getq: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gets: Jc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jc>; cdecl;
//    {class} function valueOf(P1: JString): Jc; cdecl;
//
//    { static Property }
//    {class} property a: Jc read _Geta;
//    {class} property b: Jc read _Getb;
//    {class} property c: Jc read _Getc;
//    {class} property d: Jc read _Getd;
//    {class} property e: Jc read _Gete;
//    {class} property f: Jc read _Getf;
//    {class} property g: Jc read _Getg;
//    {class} property h: Jc read _Geth;
//    {class} property i: Jc read _Geti;
//    {class} property j: Jc read _Getj;
//    {class} property k: Jc read _Getk;
//    {class} property l: Jc read _Getl;
//    {class} property m: Jc read _Getm;
//    {class} property n: Jc read _Getn;
//    {class} property o: Jc read _Geto;
//    {class} property p: Jc read _Getp;
//    {class} property q: Jc read _Getq;
//    {class} property r: Jc read _Getr;
//    {class} property s: Jc read _Gets;
//  end;

//  [JavaSignature('com/dothantech/h/c')]
//  Jc_202 = interface(JEnum) // or JObject
//  ['{0DAAB810-6776-45E8-8BCC-12CBD50F07E7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_202 = class(TJavaGenericImport<Jc_202Class, Jc_202>) end;

//  Ja_203Class = interface(JEnumClass) // or JObjectClass
//  ['{9F280A0C-875C-47EB-BE63-C0E704FA085C}']
//    { static Property Methods }
//    {class} function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ja>; cdecl;
//    {class} function valueOf(P1: JString): Ja; cdecl;
//
//    { static Property }
//    {class} property a: Ja read _Geta;
//  end;

//  [JavaSignature('com/dothantech/h/d/a/a')]
//  Ja_203 = interface(JEnum) // or JObject
//  ['{6DA3FEEF-47A5-4884-BE9E-D7DEC933BE38}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJa_203 = class(TJavaGenericImport<Ja_203Class, Ja_203>) end;

//  Jb_204Class = interface(JEnumClass) // or JObjectClass
//  ['{D781D7DB-CCE6-41C1-9560-296B3484A498}']
//    { static Property Methods }
//    {class} function _Geta: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jb>; cdecl;
//    {class} function valueOf(P1: JString): Jb; cdecl;
//    {class} function a(P1: Integer): Jb; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jb read _Geta;
//    {class} property b: Jb read _Getb;
//    {class} property c: Jb read _Getc;
//    {class} property d: Jb read _Getd;
//    {class} property e: Jb read _Gete;
//    {class} property f: Jb read _Getf;
//    {class} property g: Jb read _Getg;
//  end;

//  [JavaSignature('com/dothantech/h/d/a/b')]
//  Jb_204 = interface(JEnum) // or JObject
//  ['{5BB5E53F-CA88-414A-9DBC-3F28BCE183AE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jc): Integer; cdecl; overload;
//    function a: Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJb_204 = class(TJavaGenericImport<Jb_204Class, Jb_204>) end;

//  Jc_a_205Class = interface(JObjectClass)
//  ['{7DFC360B-B43D-42E6-91C4-C7EDDCA93F54}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/a/c$a')]
//  Jc_a_205 = interface(JObject)
//  ['{B243340D-23F6-4B4D-AD28-A839060663C0}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJc_a_205 = class(TJavaGenericImport<Jc_a_205Class, Jc_a_205>) end;

//  Jc_bClass = interface(JObjectClass)
//  ['{8704CAB7-D761-43C1-8D4D-DBE47CD2C2FF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/a/c$b')]
//  Jc_b = interface(JObject)
//  ['{980135DF-F7FF-43F7-8AB0-B675B08DD995}']
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

//  TJc_b = class(TJavaGenericImport<Jc_bClass, Jc_b>) end;

//  Jc_207Class = interface(JObjectClass)
//  ['{1826C328-6C32-4BEF-92C8-542DEE0DEB70}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): Jc; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/a/c')]
//  Jc_207 = interface(JObject)
//  ['{37F3E977-6DC7-4FD4-A811-26FEB7C77488}']
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

//  TJc_207 = class(TJavaGenericImport<Jc_207Class, Jc_207>) end;

//  Ja_208Class = interface(JObjectClass)
//  ['{3FAB4E91-9F38-49DD-9F1A-B7A4FE67B220}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/b/a')]
//  Ja_208 = interface(JObject)
//  ['{28EFD390-D1A8-47B9-B26A-87EE870E1ABB}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaArray<Byte>; cdecl;
//    function b: TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;

//  TJa_208 = class(TJavaGenericImport<Ja_208Class, Ja_208>) end;

//  Jb_209Class = interface(JObjectClass)
//  ['{F3641F12-8EDE-4B6C-8A0D-8EAF71E41A07}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Ja; P3: JMap): Jac; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/b/b')]
//  Jb_209 = interface(JObject)
//  ['{FBE2C224-9869-4495-A2FA-FC4D1D0DF9AA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_209 = class(TJavaGenericImport<Jb_209Class, Jb_209>) end;

//  Jc_210Class = interface(JObjectClass)
//  ['{8610A18C-614E-42D3-9059-C7983F73969D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/b/c')]
//  Jc_210 = interface(JObject)
//  ['{4DA543F7-0B58-4AB3-9A76-1D59CD44C95C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_210 = class(TJavaGenericImport<Jc_210Class, Jc_210>) end;

//  Jd_211Class = interface(JObjectClass)
//  ['{F2A15426-C1EB-408B-986F-155E0962C41B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/b/d')]
//  Jd_211 = interface(JObject)
//  ['{613D2D43-6DE2-4E46-A3FC-8D9E488D4036}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_211 = class(TJavaGenericImport<Jd_211Class, Jd_211>) end;

//  Je_a_212Class = interface(JObjectClass)
//  ['{FAD12484-70D1-4019-A090-01119AA511EA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/b/e$a')]
//  Je_a_212 = interface(JObject)
//  ['{ABED2E51-CB44-49BB-9187-C14A6657FE7B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_a_212 = class(TJavaGenericImport<Je_a_212Class, Je_a_212>) end;

//  Je_b_aClass = interface(JObjectClass)
//  ['{90AD7652-6703-4A08-A2A6-B96F6E32C670}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/b/e$b$a')]
//  Je_b_a = interface(JObject)
//  ['{C9393BB7-E528-4AF5-86A5-ED846E013282}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJe_b_a = class(TJavaGenericImport<Je_b_aClass, Je_b_a>) end;

//  Je_bClass = interface(JObjectClass)
//  ['{3B68A9B3-808F-49CD-8323-022D5851FFA0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/b/e$b')]
//  Je_b = interface(JObject)
//  ['{8452ED76-F9D1-4456-B83C-7476D2EE4DE8}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJe_b = class(TJavaGenericImport<Je_bClass, Je_b>) end;

//  Je_cClass = interface(JEnumClass) // or JObjectClass
//  ['{8A22C98B-F0C6-443B-8E5D-C4F106AD8487}']
//    { static Property Methods }
//    {class} function _Geta: Je_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Je_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Je_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Je_c>; cdecl;
//    {class} function valueOf(P1: JString): Je_c; cdecl;
//
//    { static Property }
//    {class} property a: Je_c read _Geta;
//    {class} property b: Je_c read _Getb;
//    {class} property c: Je_c read _Getc;
//  end;

//  [JavaSignature('com/dothantech/h/d/b/e$c')]
//  Je_c = interface(JEnum) // or JObject
//  ['{1174D26A-3417-4367-8D04-D1E5DE7BD7D5}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJe_c = class(TJavaGenericImport<Je_cClass, Je_c>) end;

//  Je_216Class = interface(JObjectClass)
//  ['{C632A1A8-7B19-4E4B-B4E9-D4D331F5A7A2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/b/e')]
//  Je_216 = interface(JObject)
//  ['{C9A63F80-D934-473B-9171-AA2C2EC09C6A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_216 = class(TJavaGenericImport<Je_216Class, Je_216>) end;

//  Jf_217Class = interface(JObjectClass)
//  ['{6EB62076-B3B1-49B6-9227-ABB0DEB44EEE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d/b/f')]
//  Jf_217 = interface(JObject)
//  ['{D3553644-056C-4A73-856C-EAE53EFEC3C6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_217 = class(TJavaGenericImport<Jf_217Class, Jf_217>) end;

//  Jd_218Class = interface(Jf_220Class) // or JObjectClass
//  ['{95C70FE4-C33D-45E9-B998-83028CA54BD3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jd; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/d')]
//  Jd_218 = interface(Jf_220) // or JObject
//  ['{F7F46A23-5648-44C7-B1A0-83D42F9174CE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_218 = class(TJavaGenericImport<Jd_218Class, Jd_218>) end;

//  Je_219Class = interface(JObjectClass)
//  ['{46DF9DE8-A48C-4566-B8F5-807CBC24CBCF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: TJavaArray<Byte>; P3: Integer): Boolean; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/e')]
//  Je_219 = interface(JObject)
//  ['{3B392CA3-223E-4731-94FB-D0ADDC1E95AA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_219 = class(TJavaGenericImport<Je_219Class, Je_219>) end;

//  Jf_220Class = interface(JExceptionClass) // or JObjectClass
//  ['{59CF7B57-0530-45D5-B90E-B6BD6FFC17A8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/f')]
//  Jf_220 = interface(JException) // or JObject
//  ['{0DC54A46-AE25-4A28-8EDE-97BBCFBE2D27}']
//    { Property Methods }
//
//    { methods }
//    function fillInStackTrace: JThrowable; cdecl;
//
//    { Property }
//  end;

//  TJf_220 = class(TJavaGenericImport<Jf_220Class, Jf_220>) end;

//  Jg_221Class = interface(JExceptionClass) // or JObjectClass
//  ['{034165AE-51A0-4FE8-A6DA-47903721A662}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg_221; cdecl; overload;
//    {class} function init(P1: JString): Jg_221; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/h/g')]
//  Jg_221 = interface(JException) // or JObject
//  ['{963E7B47-4A74-497A-9B94-401F326EE342}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg_221 = class(TJavaGenericImport<Jg_221Class, Jg_221>) end;

//  Ja_222Class = interface(JObjectClass)
//  ['{0C2BCBAB-3A4F-4C03-BB8D-09E715BEE338}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIDzPrinter): Ja_222; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/lpapi/a')]
//  Ja_222 = interface(JObject)
//  ['{602A28EF-8345-49D7-8642-3A618B502A07}']
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
//    procedure setDPI(P1: Integer); cdecl;
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
//    function draw1DBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;
//    function draw1DBarcode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function draw2DQRCode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function draw2DQRCode(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
//    function draw2DPdf417(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
//    function draw2DDataMatrix(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;
//    function draw2DDataMatrix(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
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
//
//    { Property }
//  end;

//  TJa_222 = class(TJavaGenericImport<Ja_222Class, Ja_222>) end;

//  Jb_223Class = interface(JThreadClass) // or JObjectClass
//  ['{E5C4E6BF-0917-4E35-B4C1-6AE0E534517E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/lpapi/b')]
//  Jb_223 = interface(JThread) // or JObject
//  ['{7BEB6280-010C-4530-A168-11F41A72D868}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJb_223 = class(TJavaGenericImport<Jb_223Class, Jb_223>) end;

  JIAtBitmap_BarcodeType1DClass = interface(JObjectClass)
  ['{081BEF2C-FE2F-4484-BE98-83FC644BF3F3}']
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
  ['{3A283B51-6EE2-4F0A-8020-A1351857802A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_BarcodeType1D = class(TJavaGenericImport<JIAtBitmap_BarcodeType1DClass, JIAtBitmap_BarcodeType1D>) end;

  JIAtBitmap_DrawParamNameClass = interface(JObjectClass)
  ['{ED890340-BDD9-488F-85E8-0F5E4A0A1570}']
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
  ['{C03C6B35-A09C-4B29-93DD-148555652F47}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_DrawParamName = class(TJavaGenericImport<JIAtBitmap_DrawParamNameClass, JIAtBitmap_DrawParamName>) end;

  JIAtBitmap_ErrorCorrectionLevelClass = interface(JObjectClass)
  ['{907F02CA-E103-4B2D-A95D-72127D73BA56}']
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
  ['{B2B48B8E-F2F8-40E9-984F-CBA43C35641C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_ErrorCorrectionLevel = class(TJavaGenericImport<JIAtBitmap_ErrorCorrectionLevelClass, JIAtBitmap_ErrorCorrectionLevel>) end;

  JIAtBitmap_FactoryClass = interface(JObjectClass)
  ['{4438C006-FE49-4EF8-91FC-4DA89D24F2D7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIAtBitmap_Factory; cdecl;
    {class} function createInstance: JIAtBitmap; cdecl; overload;
    {class} function createInstance(P1: JIDzPrinter): JIAtBitmap; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap$Factory')]
  JIAtBitmap_Factory = interface(JObject)
  ['{2135F348-59F5-4BE1-8BD3-F45E458B9C11}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_Factory = class(TJavaGenericImport<JIAtBitmap_FactoryClass, JIAtBitmap_Factory>) end;

  JIAtBitmap_FontStyleClass = interface(JObjectClass)
  ['{1C04DF9C-C724-460F-A970-49999D4933D8}']
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
  ['{6C49D24F-C22D-48D0-A89A-7AF763181B00}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_FontStyle = class(TJavaGenericImport<JIAtBitmap_FontStyleClass, JIAtBitmap_FontStyle>) end;

  JIAtBitmap_ItemAlignmentClass = interface(JObjectClass)
  ['{09062877-CAD1-4F93-BFF6-A561610D7C19}']
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
  ['{34830981-E277-4BD9-AC43-D2918DE911AA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_ItemAlignment = class(TJavaGenericImport<JIAtBitmap_ItemAlignmentClass, JIAtBitmap_ItemAlignment>) end;

  JIAtBitmap_LabelScaleUnitClass = interface(JObjectClass)
  ['{531805FA-0E80-4AC7-AE2D-A447E807D1DB}']
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
  ['{01828422-1EA2-4F57-8121-9474BB05C3D7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_LabelScaleUnit = class(TJavaGenericImport<JIAtBitmap_LabelScaleUnitClass, JIAtBitmap_LabelScaleUnit>) end;

  JIAtBitmap_PenAlignmentClass = interface(JObjectClass)
  ['{6FCFC152-D161-4F5E-AD67-9A134E898E24}']
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
  ['{64E60535-C124-484A-9A12-4A894A524494}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_PenAlignment = class(TJavaGenericImport<JIAtBitmap_PenAlignmentClass, JIAtBitmap_PenAlignment>) end;

  JIAtBitmap_ResultCodeClass = interface(JObjectClass)
  ['{828B7DC2-450F-46F3-A835-838E400D6B21}']
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
  ['{400FFC4E-015A-4D46-B539-07E396464273}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIAtBitmap_ResultCode = class(TJavaGenericImport<JIAtBitmap_ResultCodeClass, JIAtBitmap_ResultCode>) end;

  JIAtBitmapClass = interface(JObjectClass)
  ['{42E5FF8A-DB54-487B-BB00-19A512529F0B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/IAtBitmap')]
  JIAtBitmap = interface(IJavaInstance)
  ['{AB48CD6D-762F-4E76-82F6-9CB61927DB10}']
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

//  JLPAPI_1Class = interface(JObjectClass)
//  ['{CCEA10C2-E97D-4CC7-AD28-6BF57516D31D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/lpapi/LPAPI$1')]
//  JLPAPI_1 = interface(JObject)
//  ['{A62CF18F-6475-4E42-9552-1696F3ECD8F6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJLPAPI_1 = class(TJavaGenericImport<JLPAPI_1Class, JLPAPI_1>) end;

  JLPAPI_BarcodeTypeClass = interface(JIAtBitmap_BarcodeType1DClass) // or JObjectClass
  ['{189028CF-FF70-469E-8D43-3E41D797C192}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLPAPI_BarcodeType; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$BarcodeType')]
  JLPAPI_BarcodeType = interface(JIAtBitmap_BarcodeType1D) // or JObject
  ['{9D5B486B-E0EF-4904-89EB-076A8E1EC1B7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_BarcodeType = class(TJavaGenericImport<JLPAPI_BarcodeTypeClass, JLPAPI_BarcodeType>) end;

  JLPAPI_CallbackClass = interface(JObjectClass)
  ['{F149E2A1-B5E9-4DF1-83A7-1C09942C6ACC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$Callback')]
  JLPAPI_Callback = interface(IJavaInstance)
  ['{C8F75793-8EDB-4910-BE91-F7DC12B1572A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_Callback = class(TJavaGenericImport<JLPAPI_CallbackClass, JLPAPI_Callback>) end;

  JLPAPI_FactoryClass = interface(JObjectClass)
  ['{EAC8E5B6-8AA7-42C4-9D14-F8C0EEF40215}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLPAPI_Factory; cdecl;
    {class} function getPrinterAddress(P1: JBluetoothDevice): JIDzPrinter_PrinterAddress; cdecl;
    {class} function hasWaterMark(P1: JString; P2: TJavaArray<Byte>; P3: Integer): Boolean; cdecl;
//    {class} function createInstance: JLPAPI; cdecl; overload;
    {class} function createInstance(P1: JLPAPI_Callback): JLPAPI; cdecl; overload;
//    {class} function createInstance(P1: JBundle; P2: JLPAPI_Callback): JLPAPI; cdecl; overload;
//    {class} function createInstance(P1: JWebView): JLPAPI; cdecl; overload;
//    {class} function createInstance(P1: JWebView; P2: JLPAPI_Callback): JLPAPI; cdecl; overload;
//    {class} function createInstance(P1: JWebView; P2: JString; P3: JLPAPI_Callback): JLPAPI; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$Factory')]
  JLPAPI_Factory = interface(JObject)
  ['{F660A3DB-59F6-4613-B2AB-CBC06373237C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_Factory = class(TJavaGenericImport<JLPAPI_FactoryClass, JLPAPI_Factory>) end;

  JLPAPI_FontStyleClass = interface(JObjectClass)
  ['{0B42E8EA-1675-46AC-A3D7-91ED34F17021}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$FontStyle')]
  JLPAPI_FontStyle = interface(IJavaInstance)
  ['{821DB181-3C03-41F6-BCDD-8E4527DF085A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_FontStyle = class(TJavaGenericImport<JLPAPI_FontStyleClass, JLPAPI_FontStyle>) end;

  JLPAPI_ItemAlignmentClass = interface(JObjectClass)
  ['{3D4389D5-E61E-455B-96B7-76F0D62547BB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$ItemAlignment')]
  JLPAPI_ItemAlignment = interface(IJavaInstance)
  ['{AF512244-60E1-40DD-9463-58390E70EAE7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_ItemAlignment = class(TJavaGenericImport<JLPAPI_ItemAlignmentClass, JLPAPI_ItemAlignment>) end;

  JLPAPI_PenAlignmentClass = interface(JObjectClass)
  ['{69543B0F-E21D-49F2-B03A-1F324C0908F4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$PenAlignment')]
  JLPAPI_PenAlignment = interface(IJavaInstance)
  ['{31747046-DDFF-4299-AC46-371135BA2B69}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_PenAlignment = class(TJavaGenericImport<JLPAPI_PenAlignmentClass, JLPAPI_PenAlignment>) end;

  JLPAPI_PrintParamNameClass = interface(JObjectClass)
  ['{52A3E413-DDB7-489F-9A33-2130C9B74D82}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$PrintParamName')]
  JLPAPI_PrintParamName = interface(IJavaInstance)
  ['{3B3DDE4D-9181-4804-9124-946CAF29AFBD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_PrintParamName = class(TJavaGenericImport<JLPAPI_PrintParamNameClass, JLPAPI_PrintParamName>) end;

  JLPAPI_PrintParamValueClass = interface(JObjectClass)
  ['{A1858B7E-FDB9-4925-AE29-B3A2A2843F19}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI$PrintParamValue')]
  JLPAPI_PrintParamValue = interface(IJavaInstance)
  ['{0D86BD0D-0004-49AD-9A4C-3BE4D1368F3F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLPAPI_PrintParamValue = class(TJavaGenericImport<JLPAPI_PrintParamValueClass, JLPAPI_PrintParamValue>) end;

  JLPAPIClass = interface(JObjectClass)
  ['{052E6F85-DA26-4D9A-A884-8BC57C613625}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/lpapi/LPAPI')]
  JLPAPI = interface(JObject)
  ['{4E441CD2-831C-42FD-9631-5B25EC4B2D9B}']
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

//  Ja_244Class = interface(JObjectClass)
//  ['{B3333220-D909-40B8-9BF7-33553B243148}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/a')]
//  Ja_244 = interface(JObject)
//  ['{598F4648-5330-427E-8328-C475B71FF061}']
//    { Property Methods }
//
//    { methods }
//    procedure onProgress(P1: JIDzPrinter_GeneralProgress; P2: JObject); cdecl;
//
//    { Property }
//  end;

//  TJa_244 = class(TJavaGenericImport<Ja_244Class, Ja_244>) end;

//  Jaa_245Class = interface(JObjectClass)
//  ['{9B0DED25-F91C-4A37-924E-FF148F73F456}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/aa')]
//  Jaa_245 = interface(IJavaInstance)
//  ['{C53EC648-E22B-4F7B-90C2-8A72E91BA518}']
//    { Property Methods }
//
//    { methods }
//    function a: JList; cdecl;
//
//    { Property }
//  end;

//  TJaa_245 = class(TJavaGenericImport<Jaa_245Class, Jaa_245>) end;

//  Jab_246Class = interface(JObjectClass)
//  ['{D5B1FFDB-D6ED-4CAA-95E7-D2E67E9A3E44}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/ab')]
//  Jab_246 = interface(IJavaInstance)
//  ['{98656875-853B-422F-9CAC-B207A95C6A32}']
//    { Property Methods }
//
//    { methods }
//    function a: Jh_a; cdecl;
//
//    { Property }
//  end;

//  TJab_246 = class(TJavaGenericImport<Jab_246Class, Jab_246>) end;

//  Jac_aClass = interface(JObjectClass)
//  ['{F30AEB66-90B9-4372-B2D3-24ED62793247}']
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
//    {class} function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
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
//    {class} property k: Integer read _Getk;
//    {class} property l: Integer read _Getl;
//    {class} property m: Integer read _Getm;
//  end;

//  [JavaSignature('com/dothantech/printer/ac$a')]
//  Jac_a = interface(JObject)
//  ['{27462A1C-4433-4B08-985F-6A764FAB9ABA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJac_a = class(TJavaGenericImport<Jac_aClass, Jac_a>) end;

//  Jac_248Class = interface(JObjectClass)
//  ['{FC2D9C44-AD33-4E59-BFB2-0EE0BBABD55D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jac_248; cdecl;
//    {class} function b(P1: Integer): Boolean; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/ac')]
//  Jac_248 = interface(JObject)
//  ['{DCE5735F-7A30-47DF-9B22-3CEB382518C9}']
//    { Property Methods }
//
//    { methods }
//    function a: Ja; cdecl; overload;
//    function toString: JString; cdecl;
//    procedure a(P1: Jb); cdecl; overload;
//    procedure a(P1: Ja); cdecl; overload;
//    procedure a(P1: Jc); cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    procedure a(P1: Ja); cdecl; overload;
//
//    { Property }
//  end;

//  TJac_248 = class(TJavaGenericImport<Jac_248Class, Jac_248>) end;

//  Jb_249Class = interface(JObjectClass)
//  ['{73F3A29D-FBF5-4D93-8CC6-DC1E573AB18C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/b')]
//  Jb_249 = interface(JObject)
//  ['{A1CC9F4C-292B-462C-8A90-7884051FB4F5}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJb_249 = class(TJavaGenericImport<Jb_249Class, Jb_249>) end;

//  Jc_250Class = interface(JHandlerClass) // or JObjectClass
//  ['{F0F88ED8-E773-4FED-9D5F-4EA124E544A4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/c')]
//  Jc_250 = interface(JHandler) // or JObject
//  ['{5FC2B95F-419F-4F51-809C-F417860A15A8}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJc_250 = class(TJavaGenericImport<Jc_250Class, Jc_250>) end;

//  Jd_251Class = interface(JObjectClass)
//  ['{F809FE81-EEF4-4AF8-BD51-B3DD181CA8C6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/d')]
//  Jd_251 = interface(JObject)
//  ['{CA2B724F-3638-4C29-B0D4-1F01BE3C0E7B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJd_251 = class(TJavaGenericImport<Jd_251Class, Jd_251>) end;

//  JDzPrinter_aClass = interface(JDzPrinter_bClass) // or JObjectClass
//  ['{87376ED2-FC18-4BC4-8FC2-8EB3FA16970C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/DzPrinter$a')]
//  JDzPrinter_a = interface(JDzPrinter_b) // or JObject
//  ['{A20F0EA4-8A19-4086-B374-A5984845ED22}']
//    { Property Methods }
//    function _Geta: JIDzPrinter_AddressType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIDzPrinter_AddressType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JIDzPrinter_PrinterAddress; cdecl;
//
//    { Property }
//    property a: JIDzPrinter_AddressType read _Geta write _Seta;
//  end;

//  TJDzPrinter_a = class(TJavaGenericImport<JDzPrinter_aClass, JDzPrinter_a>) end;

//  JDzPrinter_bClass = interface(JObjectClass)
//  ['{FDAFE68F-B7BB-426A-88E1-E6BCF8FEB8C7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/DzPrinter$b')]
//  JDzPrinter_b = interface(JObject)
//  ['{09A40679-7242-4410-A6C7-B0BAB9B0E5FE}']
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

//  TJDzPrinter_b = class(TJavaGenericImport<JDzPrinter_bClass, JDzPrinter_b>) end;

//  JDzPrinter_cClass = interface(JDzPrinter_bClass) // or JObjectClass
//  ['{E5E7A56A-9D8C-4FD9-B1F9-BC0C980C70C4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBitmap; P2: JBundle; P3: JIDzPrinter_IActionCallback): JDzPrinter_c; cdecl; overload;
//    {class} function init(P1: Jab; P2: JBundle; P3: JIDzPrinter_IActionCallback): JDzPrinter_c; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/DzPrinter$c')]
//  JDzPrinter_c = interface(JDzPrinter_b) // or JObject
//  ['{C55815AF-DF03-4992-8755-9C9AF4284944}']
//    { Property Methods }
//    function _Geta: JBundle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JBundle);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JBundle read _Geta write _Seta;
//  end;

//  TJDzPrinter_c = class(TJavaGenericImport<JDzPrinter_cClass, JDzPrinter_c>) end;

//  JDzPrinter_dClass = interface(JDzPrinter_bClass) // or JObjectClass
//  ['{BAA0860A-E5C3-465D-BA18-D5F128777C95}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jh_a; P2: JIDzPrinter_IActionCallback): JDzPrinter_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/DzPrinter$d')]
//  JDzPrinter_d = interface(JDzPrinter_b) // or JObject
//  ['{56F10146-963E-4957-B478-D098996EC694}']
//    { Property Methods }
//
//    { methods }
//    function a: Jh_a; cdecl;
//
//    { Property }
//  end;

//  TJDzPrinter_d = class(TJavaGenericImport<JDzPrinter_dClass, JDzPrinter_d>) end;

//  JDzPrinter_eClass = interface(JDzPrinter_bClass) // or JObjectClass
//  ['{AB6437AB-8773-496F-9766-3E62DFF44CE9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/DzPrinter$e')]
//  JDzPrinter_e = interface(JDzPrinter_b) // or JObject
//  ['{AF41C5BE-F8F6-4F31-B88C-0D59ECA94055}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDzPrinter_e = class(TJavaGenericImport<JDzPrinter_eClass, JDzPrinter_e>) end;

//  JDzPrinter_fClass = interface(JObjectClass)
//  ['{B97CA5CC-0942-4C2D-A707-48765F6EEA17}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDzPrinter; P2: JString; P3: JString): JDzPrinter_f; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/DzPrinter$f')]
//  JDzPrinter_f = interface(JObject)
//  ['{9445C387-94BD-421D-8981-3D7B92DE93A7}']
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

//  TJDzPrinter_f = class(TJavaGenericImport<JDzPrinter_fClass, JDzPrinter_f>) end;

//  JDzPrinter_gClass = interface(JObjectClass)
//  ['{E7E43320-4F5B-4B03-8202-CCAFFAD33291}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/DzPrinter$g')]
//  JDzPrinter_g = interface(JObject)
//  ['{195BA706-2CC4-467B-B0C7-9019EBECAB18}']
//    { Property Methods }
//    function _Geta: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure b; cdecl;
//    procedure a(P1: JIDzPrinter_PrinterAddress; P2: Boolean); cdecl; overload;
//    procedure c; cdecl;
//
//    { Property }
//    property a: JMap read _Geta write _Seta;
//  end;

//  TJDzPrinter_g = class(TJavaGenericImport<JDzPrinter_gClass, JDzPrinter_g>) end;

//  JDzPrinter_hClass = interface(Jc_143Class) // or JObjectClass
//  ['{C1FB53F2-20D0-4FC3-962E-5FE7B36C7137}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JDzPrinter_h; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/DzPrinter$h')]
//  JDzPrinter_h = interface(Jc_143) // or JObject
//  ['{63964FF1-063F-4EAE-92F3-D6AB366FDD74}']
//    { Property Methods }
//
//    { methods }
//    function c(P1: JUsbDevice): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJDzPrinter_h = class(TJavaGenericImport<JDzPrinter_hClass, JDzPrinter_h>) end;

  JDzPrinterClass = interface(JawClass) // or JObjectClass
  ['{D508FECE-36F6-44CF-BE98-8883A46CE4EA}']
    { static Property Methods }
//    {class} function _Getc: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function e: Boolean; cdecl;
    {class} procedure a(P1: Boolean); cdecl; overload;
    {class} function getInstance: JIDzPrinter2; cdecl;
    {class} function a(P1: JBundle): JIDzPrinter2; cdecl; overload;
//    {class} function f: Jc; cdecl;
    {class} function a(P1: JIntent): JInteger; cdecl; overload;

    { static Property }
//    {class} property c: Jw read _Getc;
  end;

  [JavaSignature('com/dothantech/printer/DzPrinter')]
  JDzPrinter = interface(Jaw) // or JObject
  ['{5FF6CBEC-DCBF-45E9-8BF3-605723CA9BE0}']
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
//    function print(P1: Jaa; P2: JBundle): Boolean; cdecl; overload;
//    function print(P1: Jaa; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function print(P1: Jab; P2: JBundle): Boolean; cdecl; overload;
//    function print(P1: Jab; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function command(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
    function command(P1: TJavaArray<Byte>; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function upgrade(P1: JString): Boolean; cdecl; overload;
    function upgrade(P1: JString; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    procedure cancel; cdecl; overload;
    procedure cancel(P1: Integer); cdecl; overload;
    function bond(P1: JString): Boolean; cdecl; overload;
    function bond(P1: JString; P2: JString): Boolean; cdecl; overload;
    function onNfcDiscovery(P1: JIntent): Boolean; cdecl;
//    function getPrinterCapability: Jb_a; cdecl;
    function getPrinterParam: JIDzPrinter2_PrinterParam; cdecl;
    function getPrinterInfo: JIDzPrinter_PrinterInfo; cdecl;
    function getDiscoveriedPrinterAddresses: JList; cdecl;
    function waitPrinterState(P1: JIDzPrinter_PrinterState; P2: Int64): Boolean; cdecl;
    function refreshPrinterParam: Boolean; cdecl;
    function setPrinterParam(P1: JBundle): Boolean; cdecl; overload;
    function setPrinterParam(P1: JBundle; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function sendDataPackage(P1: Jh_a): Boolean; cdecl; overload;
//    function sendDataPackage(P1: Jh_a; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function startDeviceDiscovery(P1: JIDzPrinter_AddressType): Boolean; cdecl; overload;
    function startDeviceDiscovery(P1: JIDzPrinter_AddressType; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    procedure onProgressInfo(P1: JIDzPrinter_ProgressInfo; P2: JObject); cdecl;
    procedure onStateChange(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrinterState); cdecl;
    procedure onPrintProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_PrintData; P3: JIDzPrinter_PrintProgress; P4: JObject); cdecl;
    procedure onPrinterDiscovery(P1: JIDzPrinter_PrinterAddress; P2: JObject); cdecl;
    procedure onBondProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onSetParamProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
//    procedure onSendDataProgress(P1: Jh_a; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onPrinterParamChanged(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter2_PrinterParam; P3: JIDzPrinter2_PrinterParam); cdecl;
    function a: Boolean; cdecl; overload;

    { Property }
  end;

  TJDzPrinter = class(TJavaGenericImport<JDzPrinterClass, JDzPrinter>) end;

//  Je_261Class = interface(JObjectClass)
//  ['{5FD4D718-75B9-4EE2-AF19-0B2C929E499B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/e')]
//  Je_261 = interface(JObject)
//  ['{589865C4-D81D-41D1-856F-A2DC4345C046}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJe_261 = class(TJavaGenericImport<Je_261Class, Je_261>) end;

//  Jf_262Class = interface(JObjectClass)
//  ['{7D380E66-A085-4D57-BA56-9CF056C2AABA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/f')]
//  Jf_262 = interface(JObject)
//  ['{E0D8DBF8-7894-48FE-8366-E3A133DD1FD3}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJf_262 = class(TJavaGenericImport<Jf_262Class, Jf_262>) end;

//  Jg_263Class = interface(JObjectClass)
//  ['{B186BCF7-4AC3-4F05-ABE7-3C92F9BB06EE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/g')]
//  Jg_263 = interface(JObject)
//  ['{2F7BEE9F-F6B7-421D-98B6-23B5078EF17C}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg_263 = class(TJavaGenericImport<Jg_263Class, Jg_263>) end;

//  Jh_264Class = interface(JObjectClass)
//  ['{5FC14F74-018C-4940-A7F8-B32A8CDA0CC9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/h')]
//  Jh_264 = interface(JObject)
//  ['{F03581D0-07D0-43B6-BAC3-07D6C97CF82A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJh_264 = class(TJavaGenericImport<Jh_264Class, Jh_264>) end;

//  Ji_265Class = interface(JObjectClass)
//  ['{1E032D9C-76AF-4A32-9B59-AF84378162BB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/i')]
//  Ji_265 = interface(JObject)
//  ['{0C7AB278-6312-44F3-92B1-1E102730BEF4}']
//    { Property Methods }
//
//    { methods }
//    procedure onLeScan(P1: JBluetoothDevice; P2: Integer; P3: TJavaArray<Byte>); cdecl;
//
//    { Property }
//  end;

//  TJi_265 = class(TJavaGenericImport<Ji_265Class, Ji_265>) end;

//  JIDzPrinter_1Class = interface(JObjectClass)
//  ['{0295EE7D-205D-401A-9338-C94D30FBFCD5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/IDzPrinter$1')]
//  JIDzPrinter_1 = interface(JObject)
//  ['{96ED5056-FA0B-4AD5-B190-D5B920F4B436}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJIDzPrinter_1 = class(TJavaGenericImport<JIDzPrinter_1Class, JIDzPrinter_1>) end;

  JIDzPrinter_AddressTypeClass = interface(JEnumClass) // or JObjectClass
  ['{526E30FC-D27E-42F6-8B60-82FDE77C5B3A}']
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
  ['{CDC1E5CB-99C1-4059-89E3-978285890F26}']
    { Property Methods }

    { methods }
    function value: Integer; cdecl; overload;

    { Property }
  end;

  TJIDzPrinter_AddressType = class(TJavaGenericImport<JIDzPrinter_AddressTypeClass, JIDzPrinter_AddressType>) end;

  JIDzPrinter_FactoryClass = interface(JObjectClass)
  ['{8C5F44CF-9DF6-4F11-82DB-7859734DF092}']
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
  ['{DAFE565C-A441-4802-9BA8-28D11159F235}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_Factory = class(TJavaGenericImport<JIDzPrinter_FactoryClass, JIDzPrinter_Factory>) end;

  JIDzPrinter_GeneralProgressClass = interface(JEnumClass) // or JObjectClass
  ['{6D148DD1-03AD-4D84-AAB7-26CECFBCD5E6}']
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
  ['{448FD1B1-4982-435A-8E52-6C116CF45FFB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_GeneralProgress = class(TJavaGenericImport<JIDzPrinter_GeneralProgressClass, JIDzPrinter_GeneralProgress>) end;

  JIDzPrinter_IActionCallbackClass = interface(JObjectClass)
  ['{D0FFA019-4D79-414A-B9AD-71EE83274998}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$IActionCallback')]
  JIDzPrinter_IActionCallback = interface(IJavaInstance)
  ['{1F3E3C52-0045-4EA8-AD01-C7B59C2BDECC}']
    { Property Methods }

    { methods }
    procedure onProgress(P1: JIDzPrinter_GeneralProgress; P2: JObject); cdecl;

    { Property }
  end;

  TJIDzPrinter_IActionCallback = class(TJavaGenericImport<JIDzPrinter_IActionCallbackClass, JIDzPrinter_IActionCallback>) end;

  JIDzPrinter_IActionWithResponseCallbackClass = interface(JObjectClass)
  ['{82D02F4B-689E-48A1-9C5F-8F7E59F54FBE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$IActionWithResponseCallback')]
  JIDzPrinter_IActionWithResponseCallback = interface(IJavaInstance)
  ['{3CC852EE-D321-4140-823D-F2A5987F565C}']
    { Property Methods }

    { methods }
    procedure onResponse(P1: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJIDzPrinter_IActionWithResponseCallback = class(TJavaGenericImport<JIDzPrinter_IActionWithResponseCallbackClass, JIDzPrinter_IActionWithResponseCallback>) end;

  JIDzPrinter_IDzPrinterCallbackClass = interface(JObjectClass)
  ['{EE5B38E0-560B-476A-AB38-84CB542C2A71}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$IDzPrinterCallback')]
  JIDzPrinter_IDzPrinterCallback = interface(IJavaInstance)
  ['{687BD6BD-6DB6-432D-89A1-40CC40281718}']
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
  ['{6CEE320C-2442-48D6-95D6-C08D411CFAED}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JObject; P2: JBundle): JIDzPrinter_PrintData; cdecl; overload;
    {class} function init(P1: JObject; P2: JBundle; P3: Integer; P4: Integer): JIDzPrinter_PrintData; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrintData')]
  JIDzPrinter_PrintData = interface(JObject)
  ['{E5E0D704-ED4D-46A3-938C-B4B4E7429015}']
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
  ['{B7CE7D21-C44A-47D7-8DAC-447C2100B21B}']
    { static Property Methods }
    {class} function _GetUSB: JIDzPrinter_PrinterAddress;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JIDzPrinter_PrinterAddress): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JString; P2: JIDzPrinter_AddressType): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JIDzPrinter_PrinterAddress; P2: JString): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function init(P1: JString; P2: JString; P3: JIDzPrinter_AddressType): JIDzPrinter_PrinterAddress; cdecl; overload;
//    {class} function init(P1: JUsbDevice): JIDzPrinter_PrinterAddress; cdecl; overload;
//    {class} function init(P1: JUsbDevice; P2: JString): JIDzPrinter_PrinterAddress; cdecl; overload;
    {class} function isBluetooth(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl;
    {class} function isWiFi(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl;
    {class} function isUSB(P1: JIDzPrinter_PrinterAddress): Boolean; cdecl;

    { static Property }
    {class} property USB: JIDzPrinter_PrinterAddress read _GetUSB;
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrinterAddress')]
  JIDzPrinter_PrinterAddress = interface(JObject)
  ['{55EAE773-147D-4749-BC92-11BA0E483950}']
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
//    function clone: JObject; cdecl; overload;

    { Property }
    property macAddress: JString read _GetmacAddress write _SetmacAddress;
    property addressType: JIDzPrinter_AddressType read _GetaddressType write _SetaddressType;
    property shownName: JString read _GetshownName write _SetshownName;
  end;

  TJIDzPrinter_PrinterAddress = class(TJavaGenericImport<JIDzPrinter_PrinterAddressClass, JIDzPrinter_PrinterAddress>) end;

  JIDzPrinter_PrinterInfoClass = interface(JObjectClass)
  ['{7F945D48-FC08-46E7-8CF5-B438689C243B}']
    { static Property Methods }

    { static Methods }
    {class} function valueOf(P1: JIntent): JIDzPrinter_PrinterInfo; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter$PrinterInfo')]
  JIDzPrinter_PrinterInfo = interface(JObject)
  ['{99732FEE-076D-4A3E-98CB-EE2F6BFFF96F}']
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
    property mcuId: JString read _GetmcuId write _SetmcuId;
  end;

  TJIDzPrinter_PrinterInfo = class(TJavaGenericImport<JIDzPrinter_PrinterInfoClass, JIDzPrinter_PrinterInfo>) end;

  JIDzPrinter_PrinterStateClass = interface(JEnumClass) // or JObjectClass
  ['{AD0C1A84-617A-4FAF-B7FF-7F2C744C28E6}']
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
  ['{76DFD68A-7EA1-4186-9CA3-689A4CBFF196}']
    { Property Methods }

    { methods }
    function group: Integer; cdecl;

    { Property }
  end;

  TJIDzPrinter_PrinterState = class(TJavaGenericImport<JIDzPrinter_PrinterStateClass, JIDzPrinter_PrinterState>) end;

  JIDzPrinter_PrintFailReasonClass = interface(JEnumClass) // or JObjectClass
  ['{3F6A3C2B-0AEC-43AE-BEF3-9ADCB817F6FB}']
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
  ['{B6089C17-1403-4AB1-8C3A-117D45174C7F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintFailReason = class(TJavaGenericImport<JIDzPrinter_PrintFailReasonClass, JIDzPrinter_PrintFailReason>) end;

  JIDzPrinter_PrintParamNameClass = interface(JObjectClass)
  ['{F9DC7684-C526-4449-B997-F5604911A23A}']
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
  ['{23224D9E-9EA0-4CD1-A764-5033AC50CCBD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintParamName = class(TJavaGenericImport<JIDzPrinter_PrintParamNameClass, JIDzPrinter_PrintParamName>) end;

  JIDzPrinter_PrintParamValueClass = interface(JObjectClass)
  ['{055EF3E8-049F-4425-B0EC-D289A4C7C502}']
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
  ['{5CC64F55-E9C8-49B8-8437-6CF699B068D5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintParamValue = class(TJavaGenericImport<JIDzPrinter_PrintParamValueClass, JIDzPrinter_PrintParamValue>) end;

  JIDzPrinter_PrintProgressClass = interface(JEnumClass) // or JObjectClass
  ['{2842891C-E88C-4709-8891-E68D2A6EF934}']
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
  ['{F06F9043-E269-4C5B-83FD-43AFC6595771}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_PrintProgress = class(TJavaGenericImport<JIDzPrinter_PrintProgressClass, JIDzPrinter_PrintProgress>) end;

  JIDzPrinter_ProgressInfoClass = interface(JEnumClass) // or JObjectClass
  ['{288A63E6-A1DE-4F84-A006-9317F78AAC8D}']
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
  ['{A870DC2A-5285-4B3C-80C6-0F0350D0B858}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter_ProgressInfo = class(TJavaGenericImport<JIDzPrinter_ProgressInfoClass, JIDzPrinter_ProgressInfo>) end;

  JIDzPrinterClass = interface(JObjectClass)
  ['{FF2DF5A5-2AA6-43CF-B765-592D31CCCB7A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter')]
  JIDzPrinter = interface(IJavaInstance)
  ['{D951E29C-F723-426A-A234-06BEAD11688C}']
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
//    function print(P1: Jaa; P2: JBundle): Boolean; cdecl; overload;
//    function print(P1: Jaa; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function print(P1: Jab; P2: JBundle): Boolean; cdecl; overload;
//    function print(P1: Jab; P2: JBundle; P3: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
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
  ['{94B952B1-1990-4F3F-B6FA-794DD4F952FE}']
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
  ['{2725F731-43B3-4EA1-BE87-15BF3FA04E06}']
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
  ['{850A3F70-EF0D-45B7-B3C0-6E2FC0D39781}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2$IDzPrinterCallback2')]
  JIDzPrinter2_IDzPrinterCallback2 = interface(IJavaInstance)
  ['{AAFC5A78-1F9D-46BF-B2F0-4E03BD8B68D9}']
    { Property Methods }

    { methods }
    procedure onBondProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onSetParamProgress(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter_GeneralProgress); cdecl;
//    procedure onSendDataProgress(P1: Jh_a; P2: JIDzPrinter_GeneralProgress); cdecl;
    procedure onPrinterParamChanged(P1: JIDzPrinter_PrinterAddress; P2: JIDzPrinter2_PrinterParam; P3: JIDzPrinter2_PrinterParam); cdecl;

    { Property }
  end;

  TJIDzPrinter2_IDzPrinterCallback2 = class(TJavaGenericImport<JIDzPrinter2_IDzPrinterCallback2Class, JIDzPrinter2_IDzPrinterCallback2>) end;

  JIDzPrinter2_PrinterParamClass = interface(JObjectClass)
  ['{8BB84896-C999-4E04-A405-E700CC65A318}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: JString; P3: JString; P4: JString; P5: JString; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: Integer; P11: Integer; P12: Integer; P13: Integer; P14: Integer; P15: Integer; P16: Integer; P17: Integer; P18: Integer; P19: TJavaArray<Integer>; P20: TJavaArray<Integer>; P21: TJavaArray<Integer>; P22: JString; P23: JString; P24: JString; P25: Integer; P26: Integer; P27: Integer; P28: Integer; P29: Integer): JIDzPrinter2_PrinterParam; cdecl;
    {class} function getAddressGroup(P1: Integer): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2$PrinterParam')]
  JIDzPrinter2_PrinterParam = interface(JObject)
  ['{08964854-1B8B-4F1C-911F-64CCD290D189}']
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
  ['{4F006124-22E6-40B5-92E0-F95A514E3D2B}']
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
  ['{04665E1C-3D89-4DAF-95F2-2A48421D17DB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIDzPrinter2_PrinterParamName = class(TJavaGenericImport<JIDzPrinter2_PrinterParamNameClass, JIDzPrinter2_PrinterParamName>) end;

  JIDzPrinter2Class = interface(JObjectClass)
  ['{22E8DB53-F3A8-45D2-AB48-6FADB10E73B0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/dothantech/printer/IDzPrinter2')]
  JIDzPrinter2 = interface(IJavaInstance)
  ['{33E0219E-C64E-4CD5-85E9-1B0DAD35A474}']
    { Property Methods }

    { methods }
    function bond(P1: JString): Boolean; cdecl; overload;
    function bond(P1: JString; P2: JString): Boolean; cdecl; overload;
    function onNfcDiscovery(P1: JIntent): Boolean; cdecl;
//    function getPrinterCapability: Jb_a; cdecl;
    function getPrinterParam: JIDzPrinter2_PrinterParam; cdecl;
    function refreshPrinterParam: Boolean; cdecl;
    function setPrinterParam(P1: JBundle): Boolean; cdecl; overload;
    function setPrinterParam(P1: JBundle; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
//    function sendDataPackage(P1: Jh_a): Boolean; cdecl; overload;
//    function sendDataPackage(P1: Jh_a; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;
    function startDeviceDiscovery(P1: JIDzPrinter_AddressType): Boolean; cdecl; overload;
    function startDeviceDiscovery(P1: JIDzPrinter_AddressType; P2: JIDzPrinter_IActionCallback): Boolean; cdecl; overload;

    { Property }
  end;

  TJIDzPrinter2 = class(TJavaGenericImport<JIDzPrinter2Class, JIDzPrinter2>) end;

//  Jj_288Class = interface(JObjectClass)
//  ['{A3A8D400-3BC6-4A29-A812-450018CFF224}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/j')]
//  Jj_288 = interface(JObject)
//  ['{36853A52-6B7E-4772-B0C2-BD3FCF86D4BA}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJj_288 = class(TJavaGenericImport<Jj_288Class, Jj_288>) end;

//  Jk_289Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{92885202-4E77-416E-BB81-65E448D21BBD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/k')]
//  Jk_289 = interface(JBroadcastReceiver) // or JObject
//  ['{A7E9D754-0CE1-4C49-9C9B-A7479CDD037D}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJk_289 = class(TJavaGenericImport<Jk_289Class, Jk_289>) end;

//  Jl_290Class = interface(JObjectClass)
//  ['{F213E850-F9E5-4DEF-BCC0-A0401F3451F6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/l')]
//  Jl_290 = interface(JObject)
//  ['{51899473-606D-43AC-8D79-7696AD2A8F38}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJl_290 = class(TJavaGenericImport<Jl_290Class, Jl_290>) end;

//  Jm_291Class = interface(JObjectClass)
//  ['{C023FBFC-FB08-4413-B903-9E1B17ED2DEF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/m')]
//  Jm_291 = interface(JObject)
//  ['{D979C38F-9359-4D96-A571-6FD37CD04462}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJm_291 = class(TJavaGenericImport<Jm_291Class, Jm_291>) end;

//  Jn_292Class = interface(JObjectClass)
//  ['{36A16C89-6F9F-49C1-BD17-A1C03D226E3C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/n')]
//  Jn_292 = interface(JObject)
//  ['{21F2FD2F-2E94-4235-89C3-B96B22BDCE14}']
//    { Property Methods }
//
//    { methods }
//    procedure onProgress(P1: JIDzPrinter_GeneralProgress; P2: JObject); cdecl;
//
//    { Property }
//  end;

//  TJn_292 = class(TJavaGenericImport<Jn_292Class, Jn_292>) end;

//  Jo_293Class = interface(JasClass) // or JObjectClass
//  ['{80B75198-BF45-4A4F-84AC-2638422FA7CE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/o')]
//  Jo_293 = interface(Jas) // or JObject
//  ['{778F37CC-07E2-4B87-A3F9-882C89B03452}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Integer; P2: Integer; P3: JObject): Integer; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJo_293 = class(TJavaGenericImport<Jo_293Class, Jo_293>) end;

//  Jp_294Class = interface(JObjectClass)
//  ['{CB2A30B9-F794-4F23-A9DE-A64F078994E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/p')]
//  Jp_294 = interface(JObject)
//  ['{53CE2B5E-CE63-451A-8BC5-31AB24941D14}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp_294 = class(TJavaGenericImport<Jp_294Class, Jp_294>) end;

//  Jq_295Class = interface(JasClass) // or JObjectClass
//  ['{C5FCEED8-D53E-4E4F-8352-1D8F0FD086D0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/q')]
//  Jq_295 = interface(Jas) // or JObject
//  ['{CBB5D1BA-6D85-4EBC-BBE7-E7A875F232CF}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Integer; P2: Integer; P3: JObject): Integer; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJq_295 = class(TJavaGenericImport<Jq_295Class, Jq_295>) end;

//  Jr_296Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{8A3664A1-2896-4027-B58D-55F61226F8CF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/r')]
//  Jr_296 = interface(JBroadcastReceiver) // or JObject
//  ['{5C8494E8-1292-4E94-AC95-469BD1F00F99}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJr_296 = class(TJavaGenericImport<Jr_296Class, Jr_296>) end;

//  Js_297Class = interface(JObjectClass)
//  ['{1AC6DDE9-0E95-4E40-BFC1-C1861EF95D25}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/s')]
//  Js_297 = interface(JObject)
//  ['{50B275B4-1E36-4E27-92CA-9950B11C7BD7}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJs_297 = class(TJavaGenericImport<Js_297Class, Js_297>) end;

//  Jt_298Class = interface(JObjectClass)
//  ['{93245A05-91B3-4238-83F9-199427D48C0D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/t')]
//  Jt_298 = interface(JObject)
//  ['{EB89AC89-01CC-45C1-BB74-DEA241AB73FE}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJt_298 = class(TJavaGenericImport<Jt_298Class, Jt_298>) end;

//  Ju_299Class = interface(JrClass) // or JObjectClass
//  ['{D1F806C6-2198-49A4-BC0E-AA15B3719037}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/u')]
//  Ju_299 = interface(Jr) // or JObject
//  ['{6BC29057-064F-43BC-893F-123EBD8EEF77}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Je); cdecl; overload;
//    procedure a(P1: JIDzPrinter_PrinterState); cdecl; overload;
//
//    { Property }
//  end;

//  TJu_299 = class(TJavaGenericImport<Ju_299Class, Ju_299>) end;

//  Jv_300Class = interface(Je_016Class) // or JObjectClass
//  ['{F977DD7F-A839-4DFB-9614-6AAD183DE8BE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/v')]
//  Jv_300 = interface(Je_016) // or JObject
//  ['{8094AF53-423B-4225-8484-8A7D64E1FCB5}']
//    { Property Methods }
//
//    { methods }
//    procedure b(P1: Boolean); cdecl;
//    procedure a(P1: Je); cdecl; overload;
//    procedure a(P1: JIDzPrinter_PrinterState); cdecl; overload;
//    procedure a_(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJv_300 = class(TJavaGenericImport<Jv_300Class, Jv_300>) end;

//  Jw_301Class = interface(JObjectClass)
//  ['{56AAC203-B71C-47B0-B102-3EEF7388683D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/w')]
//  Jw_301 = interface(JObject)
//  ['{4B0450E9-6C6C-4FB2-A6B0-184B122D40EC}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJw_301 = class(TJavaGenericImport<Jw_301Class, Jw_301>) end;

//  Jx_302Class = interface(JObjectClass)
//  ['{DD32D157-F331-487F-9724-8215834F37DF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/x')]
//  Jx_302 = interface(JObject)
//  ['{84E259EE-75BB-4BA3-BDB1-A41C4D46A4C4}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJx_302 = class(TJavaGenericImport<Jx_302Class, Jx_302>) end;

//  Jy_303Class = interface(Ja_141Class) // or JObjectClass
//  ['{B345EA8A-D106-413C-8691-432C591B6A1B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/y')]
//  Jy_303 = interface(Ja_141) // or JObject
//  ['{A7EE8971-F012-4D4D-B573-1EFD8CE072A8}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JIDzPrinter_PrinterState); cdecl; overload;
//    procedure a(P1: Je); cdecl; overload;
//
//    { Property }
//  end;

//  TJy_303 = class(TJavaGenericImport<Jy_303Class, Jy_303>) end;

//  Jz_304Class = interface(JObjectClass)
//  ['{D7EAC2B1-B504-43C1-82EF-53C60B3FD1B3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/printer/z')]
//  Jz_304 = interface(JObject)
//  ['{1C0C82FE-8534-41EE-B4F4-5D383358BB76}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJz_304 = class(TJavaGenericImport<Jz_304Class, Jz_304>) end;

//  Ja_305Class = interface(JObjectClass)
//  ['{AAF75B78-1304-45A6-8643-58A2099B3974}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JHandler; cdecl; overload;
//    {class} function a(P1: JHandler_Callback): JHandler; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/view/a')]
//  Ja_305 = interface(JObject)
//  ['{C2AB031C-44DB-492C-857E-7C106E050294}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_305 = class(TJavaGenericImport<Ja_305Class, Ja_305>) end;

//  Jb_306Class = interface(JObjectClass)
//  ['{B9379206-E872-42C2-8888-AC2FC4F3B959}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): JString; cdecl; overload;
//    {class} function a(P1: Integer; P2: TJavaObjectArray<JObject>): JString; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/view/b')]
//  Jb_306 = interface(JObject)
//  ['{C7670FDC-54D1-4F5D-97F4-6B1448B3D7A5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_306 = class(TJavaGenericImport<Jb_306Class, Jb_306>) end;

//  Jc_307Class = interface(JObjectClass)
//  ['{97DB3E7B-9405-472B-8359-68A0FA491A5D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JView; P2: JClass): JView; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/view/c')]
//  Jc_307 = interface(JObject)
//  ['{67936AD0-609B-4747-BB9C-0892A28B67DE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_307 = class(TJavaGenericImport<Jc_307Class, Jc_307>) end;

//  Jd_308Class = interface(JObjectClass)
//  ['{C64F7F8E-A1D0-4993-BA9F-8EE2F71E0656}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/view/d')]
//  Jd_308 = interface(JObject)
//  ['{F9FE603E-8B73-495A-BA1B-A78B591B6767}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJd_308 = class(TJavaGenericImport<Jd_308Class, Jd_308>) end;

//  JDzWindow_1Class = interface(JObjectClass)
//  ['{365591CD-2EE9-4AD6-88DE-308409E9970C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/dothantech/view/DzWindow$1')]
//  JDzWindow_1 = interface(JObject)
//  ['{0589FB9C-5687-4D43-A23D-17C035CBF2C5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDzWindow_1 = class(TJavaGenericImport<JDzWindow_1Class, JDzWindow_1>) end;

  JDzWindow_ViewInfoClass = interface(JObjectClass)
  ['{EB2EC9FE-9FFD-42AB-8B52-B2A466A50046}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JObject): JDzWindow_ViewInfo; cdecl;

    { static Property }
  end;

  [JavaSignature('com/dothantech/view/DzWindow$ViewInfo')]
  JDzWindow_ViewInfo = interface(JObject)
  ['{160C3273-1A18-4636-9B28-4D1DFA73255B}']
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
  ['{42709B41-FFEC-4B9F-98A3-EE76C25D8636}']
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
  ['{D0F6542E-FBD9-4B21-BD0C-3EB616B2AFC6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzWindow_ViewInfoType = class(TJavaGenericImport<JDzWindow_ViewInfoTypeClass, JDzWindow_ViewInfoType>) end;

  JDzWindowClass = interface(JObjectClass)
  ['{91F9E693-40BF-40AA-A925-E163D46F49FC}']
    { static Property Methods }
//    {class} function _GetLog: Jw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDzWindow; cdecl;
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

    { static Property }
//    {class} property Log: Jw read _GetLog;
  end;

  [JavaSignature('com/dothantech/view/DzWindow')]
  JDzWindow = interface(JObject)
  ['{597E6B57-45A1-4695-A09E-66EF6AFB92AB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDzWindow = class(TJavaGenericImport<JDzWindowClass, JDzWindow>) end;

implementation

procedure RegisterTypes;
begin
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_008',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_008));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_c',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_c));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_012',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_012));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_013',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_013));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_014',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_014));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_016',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_016));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_017',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_017));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jk',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jk));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jl',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jl));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jn',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jn));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jo',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jo));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jp',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jp));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jq',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jq));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jr',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jr));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Js',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Js));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jt',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jt));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_032',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_032));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_033',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_033));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_034',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_034));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_035',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_035));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_037',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_037));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaa_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaa_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaa',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaa));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jab',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jab));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jac',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jac));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jad',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jad));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jae',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jae));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaf',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaf));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jag_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jag_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jag',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jag));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jah',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jah));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jai',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jai));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaj',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaj));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jak',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jak));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jal',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jal));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jam',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jam));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jan',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jan));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jao_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jao_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jao',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jao));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jap',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jap));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaq',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaq));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jar',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jar));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jas',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jas));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jat',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jat));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jau_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jau_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jau',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jau));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jav',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jav));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaw',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaw));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jax',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jax));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jay',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jay));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_067',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_067));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_068',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_068));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_069',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_069));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzSystem',
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzSystem));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_071',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_071));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_073',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_073));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_074',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_074));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_075',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_075));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_077',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_077));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_078',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_078));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jk_079',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jk_079));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jl_080',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jl_080));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm_081',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm_081));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jn_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jn_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jn_083',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jn_083));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jo_084',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jo_084));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jp_085',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jp_085));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jq_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jq_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jq_087',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jq_087));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jr_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jr_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jr_089',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jr_089));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JReflection',
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JReflection));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Js_091',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Js_091));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jt_092',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jt_092));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ju',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ju));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jv',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jv));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_c',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_c));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_d',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_d));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_e',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_e));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_f',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_f));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_g',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_g));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jx',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jx));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jy',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jy));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jz',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jz));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_106',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_106));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_107',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_107));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_108',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_108));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_109',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_109));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_110',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_110));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_114',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_114));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzTagObject_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzTagObject_a));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzTagObject',
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzTagObject));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_117',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_117));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_118',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_118));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_119',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_119));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_120',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_120));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_123',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_123));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a_124',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a_124));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_125',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_125));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_c',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_c));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_129',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_129));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_130',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_130));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_131',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_131));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_132',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_132));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_133',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_133));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_134',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_134));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_135',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_135));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_136',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_136));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_137',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_137));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_138',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_138));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_139',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_139));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_140',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_a_140));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_141',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_141));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_142',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_142));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_143',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_143));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_144',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_144));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_145',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_145));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_146',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_146));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_147',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_147));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_148',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_148));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_149',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_149));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_150',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_150));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_151',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_151));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_152',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_152));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_153',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_153));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_154',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_154));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_155',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_155));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_156',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_156));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_157',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_157));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_158',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_158));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_159',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_159));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_160',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_160));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_161',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_161));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_162',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_162));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_163',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_163));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_164',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_164));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_165',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_165));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_166',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_166));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_167',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_167));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a_168',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_a_168));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_c',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_c));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_d',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_d));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_172',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_172));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_173',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_173));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jk_174',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jk_174));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jl_175',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jl_175));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm_176',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm_176));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jn_177',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jn_177));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_178',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_178));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_179',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_179));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_180',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_180));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_181',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_181));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a_182',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_a_182));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_b_183',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_b_183));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_184',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_184));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_185',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_185));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_186',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_186));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_189',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_189));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_a_190',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_a_190));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_191',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_191));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_192',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_192));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_a_193',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_a_193));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_b_194',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_b_194));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_c_195',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_c_195));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_d',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_d));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_197',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_197));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jk_198',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jk_198));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jl_199',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jl_199));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm_201',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm_201));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_202',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_202));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_203',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_203));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_204',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_204));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_a_205',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_a_205));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_207',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_207));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_208',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_208));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_209',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_209));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_210',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_210));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_211',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_211));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_212',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_a_212));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_b_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_b_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_c',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_c));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_216',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_216));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_217',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_217));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_218',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_218));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_219',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_219));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_220',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_220));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_221',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_221));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_222',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_222));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_223',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_223));
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
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_1',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JLPAPI_1));
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
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_244',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_244));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jaa_245',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jaa_245));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jab_246',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jab_246));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jac_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jac_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jac_248',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jac_248));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_249',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_249));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_250',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_250));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_251',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_251));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_a',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_a));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_b',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_b));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_c',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_c));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_d',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_d));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_e',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_e));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_f',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_f));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_g',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_g));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_h',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter_h));
  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter',
    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzPrinter));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Je_261',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Je_261));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jf_262',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jf_262));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jg_263',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jg_263));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jh_264',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jh_264));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ji_265',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ji_265));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_1',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JIDzPrinter_1));
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
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jj_288',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jj_288));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jk_289',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jk_289));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jl_290',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jl_290));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jm_291',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jm_291));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jn_292',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jn_292));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jo_293',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jo_293));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jp_294',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jp_294));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jq_295',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jq_295));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jr_296',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jr_296));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Js_297',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Js_297));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jt_298',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jt_298));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ju_299',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ju_299));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jv_300',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jv_300));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jw_301',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jw_301));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jx_302',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jx_302));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jy_303',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jy_303));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jz_304',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jz_304));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Ja_305',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Ja_305));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jb_306',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jb_306));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jc_307',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jc_307));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.Jd_308',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.Jd_308));
//  TRegTypes.RegisterType('Androidapi.JNI.LPAPI_2024_10_21_R.JDzWindow_1',
//    TypeInfo(Androidapi.JNI.LPAPI_2024_10_21_R.JDzWindow_1));
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
