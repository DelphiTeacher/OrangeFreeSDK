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
//  生成时间：2023-03-31 10:22:51
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.BaiduLBS_Android;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.Util,
  Androidapi.JNI.Location,
  Androidapi.JNI.Hardware;
//uses
//  Androidapi.JNIBridge,
//  Androidapi.JNI.JavaTypes,
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.org.json.JSONObject,
//  Androidapi.JNI.android.content.pm.PackageInfo,
//  Androidapi.JNI.android.net.Uri,
//  Androidapi.JNI.android.content.pm.ApplicationInfo,
//  Androidapi.JNI.java.security.SecureRandom,
//  Androidapi.JNI.java.math.BigInteger,
//  Androidapi.JNI.javax.crypto.spec.OAEPParameterSpec,
//  Androidapi.JNI.javax.net.ssl.SSLSession,
//  Androidapi.JNI.android.os.Message,
//  Androidapi.JNI.java.security.KeyPair,
//  Androidapi.JNI.android.os.Parcel,
//  Androidapi.JNI.android.location.GnssNavigationMessage,
//  Androidapi.JNI.android.location.Location,
//  Androidapi.JNI.android.os.Messenger,
//  Androidapi.JNI.android.os.Bundle,
//  Androidapi.JNI.android.content.Intent,
//  Androidapi.JNI.android.net.wifi.WifiManager,
//  Androidapi.JNI.android.telephony.CellLocation,
//  Androidapi.JNI.android.telephony.TelephonyManager,
//  Androidapi.JNI.java.net.URL,
//  Androidapi.JNI.android.webkit.WebView,
//  Androidapi.JNI.android.os.Handler,
//  Androidapi.JNI.android.content.SharedPreferences,
//  Androidapi.JNI.android.hardware.SensorEvent,
//  Androidapi.JNI.android.hardware.Sensor,
//  Androidapi.JNI.android.os.HandlerThread,
//  Androidapi.JNI.android.content.ComponentName,
//  Androidapi.JNI.android.os.IBinder,
//  Androidapi.JNI.android.os.Parcelable_Creator,
//  Androidapi.JNI.android.telephony.SignalStrength,
//  Androidapi.JNI.android.telephony.CellInfo,
//  Androidapi.JNI.android.telephony.CellIdentityNr,
//  Androidapi.JNI.android.location.GnssMeasurementsEvent,
//  Androidapi.JNI.android.location.GnssStatus,
//  Androidapi.JNI.android.net.wifi.WifiInfo,
//  Androidapi.JNI.android.os.Looper,
//  Androidapi.JNI.javax.net.ssl.SSLSocketFactory,
//  Androidapi.JNI.java.security.cert.X509Certificate,
//  Androidapi.JNI.android.app.Notification;


type

// ===== Forward declarations =====

//  Ja = interface; //com.baidu.a.a.a.a.a
//  Ja_001 = interface; //com.baidu.b.a.a
//  Jb = interface; //com.baidu.b.a.b
//  Jc = interface; //com.baidu.b.a.c
//  Jd = interface; //com.baidu.b.a.d
//  Je_a = interface; //com.baidu.b.a.e$a
//  Je = interface; //com.baidu.b.a.e
//  Jf = interface; //com.baidu.b.a.f
//  Jg = interface; //com.baidu.b.a.g
//  Jh_a = interface; //com.baidu.b.a.h$a
//  Jh = interface; //com.baidu.b.a.h
//  Ji = interface; //com.baidu.b.a.i
//  Jj = interface; //com.baidu.b.a.j
//  Jk = interface; //com.baidu.b.a.k
//  Ja_014 = interface; //com.baidu.b.a
//  Ja_a = interface; //com.baidu.b.b.a$a
//  Ja_b = interface; //com.baidu.b.b.a$b
//  Ja_c = interface; //com.baidu.b.b.a$c
//  Ja_d = interface; //com.baidu.b.b.a$d
//  Ja_e = interface; //com.baidu.b.b.a$e
//  Ja_020 = interface; //com.baidu.b.b.a
//  Jb_021 = interface; //com.baidu.b.b.b
//  Jc_a = interface; //com.baidu.b.b.c$a
//  Jc_023 = interface; //com.baidu.b.b.c
//  Jd_a = interface; //com.baidu.b.b.d$a
//  Jd_b = interface; //com.baidu.b.b.d$b
//  Jd_026 = interface; //com.baidu.b.b.d
//  Je_a_027 = interface; //com.baidu.b.b.e$a
//  Je_b = interface; //com.baidu.b.b.e$b
//  Je_c_a = interface; //com.baidu.b.b.e$c$a
//  Je_c = interface; //com.baidu.b.b.e$c
//  Je_d = interface; //com.baidu.b.b.e$d
//  Je_e = interface; //com.baidu.b.b.e$e
//  Je_f = interface; //com.baidu.b.b.e$f
//  Je_034 = interface; //com.baidu.b.b.e
//  Jf_035 = interface; //com.baidu.b.b.f
//  Jb_036 = interface; //com.baidu.b.b
//  Ja_037 = interface; //com.baidu.b.c.a.a
//  Jb_038 = interface; //com.baidu.b.c.a.b
//  Jc_039 = interface; //com.baidu.b.c.a.c
//  Jd_040 = interface; //com.baidu.b.c.a.d
//  Je_041 = interface; //com.baidu.b.c.a.e
//  Jf_042 = interface; //com.baidu.b.c.a.f
//  Jg_043 = interface; //com.baidu.b.c.a.g
//  Jh_044 = interface; //com.baidu.b.c.a.h
//  Ji_045 = interface; //com.baidu.b.c.a.i
//  Ja_046 = interface; //com.baidu.b.c.b.a
//  Jb_047 = interface; //com.baidu.b.c.b.b
//  Jc_048 = interface; //com.baidu.b.c.b.c
//  Ja_049 = interface; //com.baidu.b.c.c.a
//  Jb_050 = interface; //com.baidu.b.c.c.b
//  Ja_051 = interface; //com.baidu.b.c.d.a
//  Jb_052 = interface; //com.baidu.b.c.d.b
//  Jc_053 = interface; //com.baidu.b.c.d.c
//  Jd_054 = interface; //com.baidu.b.c.d.d
//  Je_055 = interface; //com.baidu.b.c.d.e
//  Jf_056 = interface; //com.baidu.b.c.d.f
//  Jc_057 = interface; //com.baidu.b.c
//  Ja_058 = interface; //com.baidu.b.d.a
//  Jb_059 = interface; //com.baidu.b.d.b
//  Jc_060 = interface; //com.baidu.b.d.c
//  Jd_061 = interface; //com.baidu.b.d
//  Ja_a_062 = interface; //com.baidu.b.e.a$a
//  Ja_063 = interface; //com.baidu.b.e.a
//  Je_064 = interface; //com.baidu.b.e
//  Ja_065 = interface; //com.baidu.b.f.a
//  Jb_066 = interface; //com.baidu.b.f.b
//  Jc_067 = interface; //com.baidu.b.f.c
//  Jf_068 = interface; //com.baidu.b.f
//  Jg_069 = interface; //com.baidu.b.g
//  Jh_a_070 = interface; //com.baidu.b.h$a
//  Jh_071 = interface; //com.baidu.b.h
//  Ja_072 = interface; //com.baidu.lbsapi.auth.a
//  Jb_073 = interface; //com.baidu.lbsapi.auth.b
//  Jc_074 = interface; //com.baidu.lbsapi.auth.c
//  Jd_a_075 = interface; //com.baidu.lbsapi.auth.d$a
//  Jd_076 = interface; //com.baidu.lbsapi.auth.d
//  Je_a_077 = interface; //com.baidu.lbsapi.auth.e$a
//  Je_078 = interface; //com.baidu.lbsapi.auth.e
  JErrorMessage = interface; //com.baidu.lbsapi.auth.ErrorMessage
//  Jf_080 = interface; //com.baidu.lbsapi.auth.f
//  Jg_a = interface; //com.baidu.lbsapi.auth.g$a
//  Jg_082 = interface; //com.baidu.lbsapi.auth.g
//  Jh_083 = interface; //com.baidu.lbsapi.auth.h
//  Ji_084 = interface; //com.baidu.lbsapi.auth.i
//  Jj_085 = interface; //com.baidu.lbsapi.auth.j
//  Jk_086 = interface; //com.baidu.lbsapi.auth.k
//  Jl = interface; //com.baidu.lbsapi.auth.l
  JLBSAuthManager = interface; //com.baidu.lbsapi.auth.LBSAuthManager
  JLBSAuthManagerListener = interface; //com.baidu.lbsapi.auth.LBSAuthManagerListener
//  Jm = interface; //com.baidu.lbsapi.auth.m
//  Jn = interface; //com.baidu.lbsapi.auth.n
//  Jo = interface; //com.baidu.lbsapi.auth.o
//  Jp = interface; //com.baidu.lbsapi.auth.p
//  Jq = interface; //com.baidu.lbsapi.auth.q
//  Ja_095 = interface; //com.baidu.location.a.a
//  Ja_096 = interface; //com.baidu.location.a
//  JAddress_1 = interface; //com.baidu.location.Address$1
  JAddress_Builder = interface; //com.baidu.location.Address$Builder
  JAddress = interface; //com.baidu.location.Address
//  Ja_1 = interface; //com.baidu.location.b.a$1
//  Ja_a_101 = interface; //com.baidu.location.b.a$a
//  Ja_b_102 = interface; //com.baidu.location.b.a$b
//  Ja_103 = interface; //com.baidu.location.b.a
//  Jaa = interface; //com.baidu.location.b.aa
//  Jab = interface; //com.baidu.location.b.ab
//  Jb_1 = interface; //com.baidu.location.b.b$1
//  Jb_a = interface; //com.baidu.location.b.b$a
//  Jb_b = interface; //com.baidu.location.b.b$b
//  Jb_c = interface; //com.baidu.location.b.b$c
//  Jb_110 = interface; //com.baidu.location.b.b
//  Jc_a_111 = interface; //com.baidu.location.b.c$a
//  Jc_112 = interface; //com.baidu.location.b.c
//  Jd_113 = interface; //com.baidu.location.b.d
//  Je_a_114 = interface; //com.baidu.location.b.e$a
//  Je_b_115 = interface; //com.baidu.location.b.e$b
//  Je_c_a_116 = interface; //com.baidu.location.b.e$c$a
//  Je_c_117 = interface; //com.baidu.location.b.e$c
//  Je_d_118 = interface; //com.baidu.location.b.e$d
//  Je_e_119 = interface; //com.baidu.location.b.e$e
//  Je_f_120 = interface; //com.baidu.location.b.e$f
//  Je_121 = interface; //com.baidu.location.b.e
//  Jf_122 = interface; //com.baidu.location.b.f
//  Jg_123 = interface; //com.baidu.location.b.g
//  Jh_a_124 = interface; //com.baidu.location.b.h$a
//  Jh_b = interface; //com.baidu.location.b.h$b
//  Jh_126 = interface; //com.baidu.location.b.h
//  Ji_127 = interface; //com.baidu.location.b.i
//  Jj_128 = interface; //com.baidu.location.b.j
//  Jk_129 = interface; //com.baidu.location.b.k
//  Jl_a = interface; //com.baidu.location.b.l$a
//  Jl_131 = interface; //com.baidu.location.b.l
//  Jm_a = interface; //com.baidu.location.b.m$a
//  Jm_b = interface; //com.baidu.location.b.m$b
//  Jm_134 = interface; //com.baidu.location.b.m
//  Jn_1 = interface; //com.baidu.location.b.n$1
//  Jn_a = interface; //com.baidu.location.b.n$a
//  Jn_137 = interface; //com.baidu.location.b.n
//  Jo_1 = interface; //com.baidu.location.b.o$1
//  Jo_a = interface; //com.baidu.location.b.o$a
//  Jo_b = interface; //com.baidu.location.b.o$b
//  Jo_c = interface; //com.baidu.location.b.o$c
//  Jo_d = interface; //com.baidu.location.b.o$d
//  Jo_e = interface; //com.baidu.location.b.o$e
//  Jo_f = interface; //com.baidu.location.b.o$f
//  Jo_145 = interface; //com.baidu.location.b.o
//  Jp_a = interface; //com.baidu.location.b.p$a
//  Jp_b = interface; //com.baidu.location.b.p$b
//  Jp_148 = interface; //com.baidu.location.b.p
//  Jq_149 = interface; //com.baidu.location.b.q
//  Jr_1 = interface; //com.baidu.location.b.r$1
//  Jr_a = interface; //com.baidu.location.b.r$a
//  Jr_b = interface; //com.baidu.location.b.r$b
//  Jr_c = interface; //com.baidu.location.b.r$c
//  Jr = interface; //com.baidu.location.b.r
//  Js = interface; //com.baidu.location.b.s
//  Jt_a = interface; //com.baidu.location.b.t$a
//  Jt_b = interface; //com.baidu.location.b.t$b
//  Jt_c = interface; //com.baidu.location.b.t$c
//  Jt = interface; //com.baidu.location.b.t
//  Ju_1 = interface; //com.baidu.location.b.u$1
//  Ju_a = interface; //com.baidu.location.b.u$a
//  Ju = interface; //com.baidu.location.b.u
//  Jv = interface; //com.baidu.location.b.v
//  Jw = interface; //com.baidu.location.b.w
//  Jx_1 = interface; //com.baidu.location.b.x$1
//  Jx_a = interface; //com.baidu.location.b.x$a
//  Jx = interface; //com.baidu.location.b.x
//  Jy_a = interface; //com.baidu.location.b.y$a
//  Jy_b = interface; //com.baidu.location.b.y$b
//  Jy = interface; //com.baidu.location.b.y
//  Jz_a = interface; //com.baidu.location.b.z$a
//  Jz = interface; //com.baidu.location.b.z
//  Jb_173 = interface; //com.baidu.location.b
  JBDAbstractLocationListener = interface; //com.baidu.location.BDAbstractLocationListener
  JBDLocation = interface; //com.baidu.location.BDLocation
  JBDLocationListener = interface; //com.baidu.location.BDLocationListener
//  Ja_177 = interface; //com.baidu.location.c.a
//  Jb_1_178 = interface; //com.baidu.location.c.b$1
//  Jb_a_179 = interface; //com.baidu.location.c.b$a
//  Jb_b_180 = interface; //com.baidu.location.c.b$b
//  Jb_c_181 = interface; //com.baidu.location.c.b$c
//  Jb_d = interface; //com.baidu.location.c.b$d
//  Jb_e = interface; //com.baidu.location.c.b$e
//  Jb_f = interface; //com.baidu.location.c.b$f
//  Jb_185 = interface; //com.baidu.location.c.b
//  Jc_186 = interface; //com.baidu.location.c.c
//  Jd_187 = interface; //com.baidu.location.c.d
//  Je_a_188 = interface; //com.baidu.location.c.e$a
//  Je_b_189 = interface; //com.baidu.location.c.e$b
//  Je_190 = interface; //com.baidu.location.c.e
//  Jf_191 = interface; //com.baidu.location.c.f
//  Jg_a_192 = interface; //com.baidu.location.c.g$a
//  Jg_b = interface; //com.baidu.location.c.g$b
//  Jg_c = interface; //com.baidu.location.c.g$c
//  Jg_d = interface; //com.baidu.location.c.g$d
//  Jg_e = interface; //com.baidu.location.c.g$e
//  Jg_f = interface; //com.baidu.location.c.g$f
//  Jg_g = interface; //com.baidu.location.c.g$g
//  Jg_h = interface; //com.baidu.location.c.g$h
//  Jg_200 = interface; //com.baidu.location.c.g
//  Jh_201 = interface; //com.baidu.location.c.h
//  Ji_202 = interface; //com.baidu.location.c.i
//  Jj_203 = interface; //com.baidu.location.c.j
//  Jk_204 = interface; //com.baidu.location.c.k
//  Jl_205 = interface; //com.baidu.location.c.l
//  Jm_1 = interface; //com.baidu.location.c.m$1
//  Jm_a_207 = interface; //com.baidu.location.c.m$a
//  Jm_208 = interface; //com.baidu.location.c.m
//  Jn_209 = interface; //com.baidu.location.c.n
//  Jc_210 = interface; //com.baidu.location.c
//  Ja_a_211 = interface; //com.baidu.location.d.a$a
//  Ja_212 = interface; //com.baidu.location.d.a
//  Jb_213 = interface; //com.baidu.location.d.b
//  Jd_214 = interface; //com.baidu.location.d
//  Ja_215 = interface; //com.baidu.location.e.a
//  Jb_1_216 = interface; //com.baidu.location.e.b$1
//  Jb_a_217 = interface; //com.baidu.location.e.b$a
//  Jb_218 = interface; //com.baidu.location.e.b
//  Jc_219 = interface; //com.baidu.location.e.c
//  Jd_220 = interface; //com.baidu.location.e.d
//  Je_a_221 = interface; //com.baidu.location.e.e$a
//  Je_b_222 = interface; //com.baidu.location.e.e$b
//  Je_223 = interface; //com.baidu.location.e.e
//  Jf_a = interface; //com.baidu.location.e.f$a
//  Jf_225 = interface; //com.baidu.location.e.f
//  Jg_226 = interface; //com.baidu.location.e.g
//  Jh_227 = interface; //com.baidu.location.e.h
//  Ji_228 = interface; //com.baidu.location.e.i
//  Jj_229 = interface; //com.baidu.location.e.j
//  Jk_230 = interface; //com.baidu.location.e.k
//  Jl_231 = interface; //com.baidu.location.e.l
//  Je_232 = interface; //com.baidu.location.e
//  Jf_233 = interface; //com.baidu.location.f
  JJni = interface; //com.baidu.location.Jni
  JLLSInterface = interface; //com.baidu.location.LLSInterface
//  JLocationClient_a = interface; //com.baidu.location.LocationClient$a
//  JLocationClient_b = interface; //com.baidu.location.LocationClient$b
//  JLocationClient_c = interface; //com.baidu.location.LocationClient$c
  JLocationClient = interface; //com.baidu.location.LocationClient
//  JLocationClientOption_1 = interface; //com.baidu.location.LocationClientOption$1
  JLocationClientOption_BDLocationPurpose = interface; //com.baidu.location.LocationClientOption$BDLocationPurpose
  JLocationClientOption_FirstLocType = interface; //com.baidu.location.LocationClientOption$FirstLocType
  JLocationClientOption_LocationMode = interface; //com.baidu.location.LocationClientOption$LocationMode
  JLocationClientOption = interface; //com.baidu.location.LocationClientOption
  JLocationConst_PoiDataConst = interface; //com.baidu.location.LocationConst$PoiDataConst
  JLocationConst_SceneType = interface; //com.baidu.location.LocationConst$SceneType
  JLocationConst_SubWayErrorCode = interface; //com.baidu.location.LocationConst$SubWayErrorCode
  JLocationConst_TrafficStatus = interface; //com.baidu.location.LocationConst$TrafficStatus
  JLocationConst = interface; //com.baidu.location.LocationConst
  JPoi = interface; //com.baidu.location.Poi
  JPoiRegion = interface; //com.baidu.location.PoiRegion

// ===== Forward SuperClasses declarations =====

//  JgClass = interface; //com.baidu.b.a.g
//  Ja_bClass = interface; //com.baidu.b.b.a$b
//  Ja_020Class = interface; //com.baidu.b.b.a
//  Jf_042Class = interface; //com.baidu.b.c.a.f
//  Jf_225Class = interface; //com.baidu.location.e.f
  JBDAbstractLocationListenerClass = interface; //com.baidu.location.BDAbstractLocationListener
//  Jm_134Class = interface; //com.baidu.location.b.m
//  Ji_202Class = interface; //com.baidu.location.c.i

// ===== Interface declarations =====

//  JaClass = interface(JObjectClass)
//  ['{6C3C03FC-6E1E-4E1A-932B-6A88863BD0B6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext): JString; cdecl; overload;
//    {class} procedure a(P1: JString); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/a/a/a/a/a')]
//  Ja = interface(JObject)
//  ['{2E109D28-3627-4F55-9FA8-A75014B76DDD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  Ja_001Class = interface(JObjectClass)
//  ['{D0C01B7E-CAA1-4B42-9EB0-25D6DA702E4C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_001; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/a')]
//  Ja_001 = interface(JObject)
//  ['{BBD4C9C3-F76D-49D8-A6A7-7966716B89D1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;

//  TJa_001 = class(TJavaGenericImport<Ja_001Class, Ja_001>) end;

//  JbClass = interface(JObjectClass)
//  ['{57090A2A-0C09-468C-8B41-2C31E05ADBA7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb; cdecl; overload;
//    {class} function init(P1: Integer): Jb; cdecl; overload;
//    {class} function a(P1: TJavaArray<Int64>): Jb; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/b')]
//  Jb = interface(JObject)
//  ['{C54CA150-6A21-47E4-9411-25D9F5EE28EB}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaArray<Byte>; cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Boolean); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: Boolean); cdecl; overload;
//    procedure b(P1: Integer); cdecl; overload;
//    procedure b(P1: Integer; P2: Integer); cdecl; overload;
//    function c(P1: Integer): Boolean; cdecl; overload;
//    function c(P1: Integer; P2: Integer): Jb; cdecl; overload;
//    function d(P1: Integer): Integer; cdecl; overload;
//    function e(P1: Integer): Integer; cdecl;
//    function b: Integer; cdecl; overload;
//    function c: Integer; cdecl; overload;
//    procedure a(P1: Jb); cdecl; overload;
//    procedure b(P1: Jb); cdecl; overload;
//    procedure c(P1: Jb); cdecl; overload;
//    procedure d(P1: Jb); cdecl; overload;
//    function hashCode: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//    function clone: JObject; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JObjectClass)
//  ['{5644ED4C-73FE-466E-B6DD-6DFF820C50C8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): TJavaArray<Byte>; cdecl; overload;
//    {class} procedure a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/c')]
//  Jc = interface(JObject)
//  ['{717667BC-A0D7-4BF8-914A-01D122C6CCA8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  JdClass = interface(JObjectClass)
//  ['{FEAF0D72-0B46-4C41-9AC1-FDFF0A5D9C8B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: TJavaArray<Byte>; cdecl;
//    {class} function b: TJavaArray<Byte>; cdecl;
//    {class} function c: TJavaArray<Byte>; cdecl;
//    {class} function d: TJavaArray<Byte>; cdecl;
//    {class} function e: TJavaArray<Byte>; cdecl;
//    {class} function f: TJavaArray<Byte>; cdecl;
//    {class} function g: TJavaArray<Byte>; cdecl;
//    {class} function h: TJavaArray<Byte>; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/d')]
//  Jd = interface(JObject)
//  ['{0FBCFE8C-8774-45A0-B987-492C59122852}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  Je_aClass = interface(JExceptionClass) // or JObjectClass
//  ['{02ABBC52-E7D5-43B8-815B-03CBA942DDE9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Je_a; cdecl; overload;
//    {class} function init(P1: JThrowable): Je_a; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/e$a')]
//  Je_a = interface(JException) // or JObject
//  ['{E43D8543-1596-4A5F-B1F6-04A3964C793B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

//  JeClass = interface(JObjectClass)
//  ['{9E4FAD94-3F15-4E74-84C1-0C6C49D45B6A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JClass; P2: JString; P3: TJavaObjectArray<JClass>): JMethod; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/e')]
//  Je = interface(JObject)
//  ['{B1EB3B32-C273-400A-9D53-D84505F93C83}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  JfClass = interface(JObjectClass)
//  ['{92261884-4C44-49E0-9469-C85530F23035}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jf; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//  end;

//  [JavaSignature('com/baidu/b/a/f')]
//  Jf = interface(JObject)
//  ['{0FCDDEB7-1A18-4250-9A94-52440FDB27E3}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jb; P2: Integer; P3: Integer; P4: Integer); cdecl; overload;
//    function a: TJavaArray<Byte>; cdecl; overload;
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

//  JgClass = interface(JObjectClass)
//  ['{F5277C1C-B4ED-4E51-8A78-087CD8E7E6E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/g')]
//  Jg = interface(JObject)
//  ['{886D3F39-F49F-4310-8EE2-5692AD8DBAD8}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Jb; cdecl; overload;
//    function a: Integer; cdecl; overload;
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  Jh_aClass = interface(JObjectClass)
//  ['{9492E2A6-BB90-4799-B722-9CA784D07597}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/h$a')]
//  Jh_a = interface(JObject)
//  ['{7E5BAF78-D4C1-426C-B33A-C0C95334D05E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh_a = class(TJavaGenericImport<Jh_aClass, Jh_a>) end;

//  JhClass = interface(JgClass) // or JObjectClass
//  ['{178F3571-A4DE-41F7-8EFE-97E95365A75E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): Jh; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/h')]
//  Jh = interface(Jg) // or JObject
//  ['{3634171F-1A96-4F0D-A20F-423AC1FEE52D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Jb; cdecl;
//
//    { Property }
//  end;

//  TJh = class(TJavaGenericImport<JhClass, Jh>) end;

//  JiClass = interface(JObjectClass)
//  ['{5FE4160E-64B9-4E29-9150-AF501ED9F46F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/i')]
//  Ji = interface(JObject)
//  ['{D2D15E9A-DEEB-4BFD-839B-58D5098C0A5D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi = class(TJavaGenericImport<JiClass, Ji>) end;

//  JjClass = interface(JgClass) // or JObjectClass
//  ['{90A7D3C7-CC62-45EB-B1C9-E0568F10074F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): Jj; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/j')]
//  Jj = interface(Jg) // or JObject
//  ['{39FB8391-7683-42B4-8139-95CA93125007}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Jb; cdecl;
//
//    { Property }
//  end;

//  TJj = class(TJavaGenericImport<JjClass, Jj>) end;

//  JkClass = interface(JObjectClass)
//  ['{4FD6D39C-5EA3-4E10-A1A6-716ACDF39C7A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a/k')]
//  Jk = interface(JObject)
//  ['{5CA761C0-603E-433A-B588-69F2347A2D79}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk = class(TJavaGenericImport<JkClass, Jk>) end;

//  Ja_014Class = interface(JObjectClass)
//  ['{C8E10662-B004-4C0D-B26F-92078EA6A7FB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_014; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/a')]
//  Ja_014 = interface(JObject)
//  ['{CBFDACC4-8FA8-42B0-8189-5BEE30B46933}']
//    { Property Methods }
//
//    { methods }
//    function a: JList; cdecl;
//
//    { Property }
//  end;

//  TJa_014 = class(TJavaGenericImport<Ja_014Class, Ja_014>) end;

//  Ja_aClass = interface(JObjectClass)
//  ['{0C10F5E9-0920-4AC6-87D7-63734BB775D7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/a$a')]
//  Ja_a = interface(JObject)
//  ['{DFD1068D-7814-4D57-A37F-DCCC8478EF48}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Ja);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//    property b: Ja read _Getb write _Setb;
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  Ja_bClass = interface(JObjectClass)
//  ['{528C2999-AF76-446C-BBC6-9278E6BA67B1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja_a; P2: JString): Ja_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/a$b')]
//  Ja_b = interface(JObject)
//  ['{CBFE5803-4A03-4E68-A78A-333812055162}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function a: Boolean; cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function b: Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJa_b = class(TJavaGenericImport<Ja_bClass, Ja_b>) end;

//  Ja_cClass = interface(JObjectClass)
//  ['{FD1572A1-D35C-4861-948F-05D0BDB03208}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/a$c')]
//  Ja_c = interface(JObject)
//  ['{B4C6B09F-B8C8-4181-B602-CEDF94196B86}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_c = class(TJavaGenericImport<Ja_cClass, Ja_c>) end;

//  Ja_dClass = interface(JObjectClass)
//  ['{36EF541E-2BD0-49D9-A13B-ECF778A62B1D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/a$d')]
//  Ja_d = interface(JObject)
//  ['{71F541C5-A5D1-4182-A2C6-61C6F0F4D745}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//  end;

//  TJa_d = class(TJavaGenericImport<Ja_dClass, Ja_d>) end;

//  Ja_eClass = interface(JObjectClass)
//  ['{9CC1B056-6366-45F9-9795-BE896897D4B8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Jh_a; P3: JException): Ja_e; cdecl;
//    {class} function a(P1: Jh_a): Ja_e; cdecl; overload;
//    {class} function a(P1: Integer): Ja_e; cdecl; overload;
//    {class} function a: Ja_e; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/a$e')]
//  Ja_e = interface(JObject)
//  ['{55E20068-D963-40B0-A69E-E7A62B7ACCDC}']
//    { Property Methods }
//    function _Geta: Jh_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jh_a);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JException;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JException);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: Boolean; cdecl;
//
//    { Property }
//    property a: Jh_a read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: JException read _Getc write _Setc;
//  end;

//  TJa_e = class(TJavaGenericImport<Ja_eClass, Ja_e>) end;

//  Ja_020Class = interface(JObjectClass)
//  ['{D28F469F-621B-4435-8480-5E0FD6B3D858}']
//    { static Property Methods }
//    {class} function _Geta: JComparator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Int64): Ja_020; cdecl;
//
//    { static Property }
//    {class} property a: JComparator read _Geta;
//  end;

//  [JavaSignature('com/baidu/b/b/a')]
//  Ja_020 = interface(JObject)
//  ['{8FFDF463-C23B-4CBC-9D71-335ECEAA9346}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Ja_a); cdecl; overload;
//    function a: JString; cdecl; overload;
//    function b: Int64; cdecl;
//    procedure a(P1: Ja_c); cdecl; overload;
//    function a(P1: JString; P2: Ja_d): Ja_e; cdecl; overload;
//
//    { Property }
//  end;

//  TJa_020 = class(TJavaGenericImport<Ja_020Class, Ja_020>) end;

//  Jb_021Class = interface(JObjectClass)
//  ['{AFC23805-456B-479E-8F51-10BBA3BD5D82}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/b')]
//  Jb_021 = interface(JObject)
//  ['{C451A858-B41A-4B3E-A1F5-9A11CB9530EE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Ja; P2: Ja): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJb_021 = class(TJavaGenericImport<Jb_021Class, Jb_021>) end;

//  Jc_aClass = interface(JObjectClass)
//  ['{10DF20D0-6A6C-4A74-A7AB-B1ED7F7CCB9B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/c$a')]
//  Jc_a = interface(IJavaInstance)
//  ['{4D980322-2481-4798-914D-E8E6E0130648}']
//    { Property Methods }
//
//    { methods }
//    function a: JList; cdecl;
//
//    { Property }
//  end;

//  TJc_a = class(TJavaGenericImport<Jc_aClass, Jc_a>) end;

//  Jc_023Class = interface(JObjectClass)
//  ['{654CCDF8-4558-454A-8C52-E2130EE75B03}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc_a): Jc_023; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/c')]
//  Jc_023 = interface(JObject)
//  ['{7EA6D620-CB1D-4626-9881-709305924A16}']
//    { Property Methods }
//
//    { methods }
//    function a: JList; cdecl;
//
//    { Property }
//  end;

//  TJc_023 = class(TJavaGenericImport<Jc_023Class, Jc_023>) end;

//  Jd_aClass = interface(JObjectClass)
//  ['{4A07CA73-70BA-4CD2-9A11-FA924CA40760}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/d$a')]
//  Jd_a = interface(JObject)
//  ['{9B0622F1-DDCB-4B7A-950F-14480C3F0548}']
//    { Property Methods }
//
//    { methods }
//    function a: Int64; cdecl; overload;
//    function b: Jh_a; cdecl;
//    function a(P1: JPackageInfo): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJd_a = class(TJavaGenericImport<Jd_aClass, Jd_a>) end;

//  Jd_bClass = interface(Ja_bClass) // or JObjectClass
//  ['{35D53D0B-E73E-4AF3-84BA-6F98AA5A2789}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JString): Jd_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/d$b')]
//  Jd_b = interface(Ja_b) // or JObject
//  ['{B4DA7EB9-F23A-4B6B-8AE4-404D45821C36}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): Boolean; cdecl; overload;
//    function c: JString; cdecl; overload;
//    function a(P1: Jh_a): Boolean; cdecl; overload;
//    function d: Jh_a; cdecl;
//    function a(P1: Int64): Boolean; cdecl; overload;
//    function b(P1: Int64): Boolean; cdecl; overload;
//    function c(P1: Int64): Boolean; cdecl; overload;
//    function e: Int64; cdecl;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    procedure a(P1: Jd_a); cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//
//    { Property }
//  end;

//  TJd_b = class(TJavaGenericImport<Jd_bClass, Jd_b>) end;

//  Jd_026Class = interface(Ja_020Class) // or JObjectClass
//  ['{C911AAE0-2BE8-4B13-934C-C93337236648}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_026; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/d')]
//  Jd_026 = interface(Ja_020) // or JObject
//  ['{E81B1F90-2336-470E-B66D-CC3A4F693F3B}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Ja_c); cdecl; overload;
//    function a(P1: JString; P2: Ja_d): Ja_e; cdecl; overload;
//
//    { Property }
//  end;

//  TJd_026 = class(TJavaGenericImport<Jd_026Class, Jd_026>) end;

//  Je_a_027Class = interface(JObjectClass)
//  ['{593C7A9E-15F6-4895-9AFC-73635ABDEFED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Byte; P2: Boolean): Je_a; cdecl; overload;
//    {class} function a(P1: Integer): Je_a; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/e$a')]
//  Je_a_027 = interface(JObject)
//  ['{A89B89EE-E873-4EF8-91E9-53104EAA1C04}']
//    { Property Methods }
//
//    { methods }
//    function a: JString; cdecl; overload;
//    function b: Byte; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function a(P1: Je_a): Integer; cdecl; overload;
//    function compareTo(P1: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJe_a_027 = class(TJavaGenericImport<Je_a_027Class, Je_a_027>) end;

//  Je_bClass = interface(JObjectClass)
//  ['{7AD8B810-E326-414D-964B-8F32268B7E70}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je): Je_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/e$b')]
//  Je_b = interface(JObject)
//  ['{CD9BDE36-474B-444F-B8DD-FE816300728B}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Je_a); cdecl; overload;
//    function a(P1: Integer): Je_a; cdecl; overload;
//    function a: Integer; cdecl; overload;
//    function b: TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;

//  TJe_b = class(TJavaGenericImport<Je_bClass, Je_b>) end;

//  Je_c_aClass = interface(JObjectClass)
//  ['{CD761B92-D56B-4F69-9092-3D104B4CA499}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je_a): Je_c_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/e$c$a')]
//  Je_c_a = interface(JObject)
//  ['{8CF34845-22C4-4748-ABF2-E465DC9C4DE1}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl;
//
//    { Property }
//  end;

//  TJe_c_a = class(TJavaGenericImport<Je_c_aClass, Je_c_a>) end;

//  Je_cClass = interface(JObjectClass)
//  ['{C2872D35-7B85-409D-9A44-4CCE0FD96FB0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/e$c')]
//  Je_c = interface(JObject)
//  ['{BF7C6029-B334-4A33-8D38-48144C8FA4BC}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Je_a); cdecl; overload;
//    function a: JList; cdecl; overload;
//
//    { Property }
//  end;

//  TJe_c = class(TJavaGenericImport<Je_cClass, Je_c>) end;

//  Je_dClass = interface(JObjectClass)
//  ['{7E24A6B5-F09E-4F14-8DA3-49A477E89212}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>; P2: Byte; P3: TJavaArray<Byte>): Je_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/e$d')]
//  Je_d = interface(JObject)
//  ['{599A4880-2822-45F4-9839-6B8009A43BDE}']
//    { Property Methods }
//
//    { methods }
//    function a: Jh_a; cdecl;
//
//    { Property }
//  end;

//  TJe_d = class(TJavaGenericImport<Je_dClass, Je_d>) end;

//  Je_eClass = interface(JObjectClass)
//  ['{C0F0A99E-48DF-4D8B-A8D8-43E37E6BFBA6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/e$e')]
//  Je_e = interface(JObject)
//  ['{F757BC25-4FD2-42DD-824E-544EAE877CBF}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//  end;

//  TJe_e = class(TJavaGenericImport<Je_eClass, Je_e>) end;

//  Je_fClass = interface(JObjectClass)
//  ['{2202F14F-3BC6-4649-BB48-A8C149D90C50}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/e$f')]
//  Je_f = interface(JObject)
//  ['{C912F61F-5FFE-4A20-AE4D-CC8D66326FB5}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JContext; P2: JUri; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;
//
//    { Property }
//  end;

//  TJe_f = class(TJavaGenericImport<Je_fClass, Je_f>) end;

//  Je_034Class = interface(Ja_020Class) // or JObjectClass
//  ['{247ED4A9-3E33-4DAA-A9E5-D6E68DC22D34}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_034; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/e')]
//  Je_034 = interface(Ja_020) // or JObject
//  ['{68E4FDD2-31F3-462A-995D-81ED6AB7C459}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Ja_c); cdecl; overload;
//    function a(P1: JString; P2: Ja_d): Ja_e; cdecl; overload;
//
//    { Property }
//  end;

//  TJe_034 = class(TJavaGenericImport<Je_034Class, Je_034>) end;

//  Jf_035Class = interface(JObjectClass)
//  ['{22EFE3CD-F147-40FF-AE62-98298140178B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b/f')]
//  Jf_035 = interface(JObject)
//  ['{9C97DA5F-2A30-43B1-8131-39835C17402D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Je_c_a; P2: Je_c_a): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJf_035 = class(TJavaGenericImport<Jf_035Class, Jf_035>) end;

//  Jb_036Class = interface(JObjectClass)
//  ['{D5661361-B3D6-4766-80D8-E939A59C2779}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_036; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/b')]
//  Jb_036 = interface(JObject)
//  ['{26773AEB-CD82-4EE8-9589-524E63383788}']
//    { Property Methods }
//    function _Geta: JApplicationInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JApplicationInfo);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JApplicationInfo read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: Boolean read _Getc write _Setc;
//    property d: Boolean read _Getd write _Setd;
//  end;

//  TJb_036 = class(TJavaGenericImport<Jb_036Class, Jb_036>) end;

//  Ja_037Class = interface(JObjectClass)
//  ['{A5EB2494-B747-408D-84EF-0F3ECDB87AAF}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;

//  [JavaSignature('com/baidu/b/c/a/a')]
//  Ja_037 = interface(IJavaInstance)
//  ['{33FAEC01-A64F-4146-9B42-601710079B45}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_037 = class(TJavaGenericImport<Ja_037Class, Ja_037>) end;

//  Jb_038Class = interface(JObjectClass)
//  ['{C54A4A8C-B9B2-4E46-8D30-695C672F025E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_038; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/a/b')]
//  Jb_038 = interface(JObject)
//  ['{A6360F9E-46CF-4061-8F2F-73CEEFDE9DCD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_038 = class(TJavaGenericImport<Jb_038Class, Jb_038>) end;

//  Jc_039Class = interface(JObjectClass)
//  ['{EB5F8657-DDFF-40DB-99E2-5B0A3A54E87D}']
//    { static Property Methods }
//    {class} function _Geta: JSecureRandom;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jc_039; cdecl;
//    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//
//    { static Property }
//    {class} property a: JSecureRandom read _Geta;
//  end;

//  [JavaSignature('com/baidu/b/c/a/c')]
//  Jc_039 = interface(JObject)
//  ['{B0B4AB06-1040-4B31-8317-C4C69596D7BD}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>); cdecl; overload;
//    function a(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//
//    { Property }
//  end;

//  TJc_039 = class(TJavaGenericImport<Jc_039Class, Jc_039>) end;

//  Jd_040Class = interface(Jf_042Class) // or JObjectClass
//  ['{0AD9E1ED-E068-4350-88BD-29BB72722472}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/a/d')]
//  Jd_040 = interface(Jf_042) // or JObject
//  ['{D2C44720-CAB6-4F3A-AB4D-778D9E0C9FA1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_040 = class(TJavaGenericImport<Jd_040Class, Jd_040>) end;

//  Je_041Class = interface(JObjectClass)
//  ['{C0AE3A30-A8B3-4CED-8DCE-8C201E8F1325}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb; P2: Integer): Je_041; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/a/e')]
//  Je_041 = interface(JObject)
//  ['{A0968276-2546-4763-8D17-DBEDBAC6AA60}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: JSecureRandom); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Byte>; cdecl; overload;
//
//    { Property }
//  end;

//  TJe_041 = class(TJavaGenericImport<Je_041Class, Je_041>) end;

//  Jf_042Class = interface(JObjectClass)
//  ['{BEC2F5A6-C5A2-4BD7-9BA1-BECBADE74992}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/a/f')]
//  Jf_042 = interface(JObject)
//  ['{28D3B795-2A32-4C8A-8851-A6CE6DE380BE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_042 = class(TJavaGenericImport<Jf_042Class, Jf_042>) end;

//  Jg_043Class = interface(JObjectClass)
//  ['{D1C795F7-1D91-47A9-804F-594972318FBA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg_043; cdecl;
//    {class} function a: TJavaArray<Byte>; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/a/g')]
//  Jg_043 = interface(JObject)
//  ['{99996CE3-224C-4505-AF9D-8555B98EE5F3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg_043 = class(TJavaGenericImport<Jg_043Class, Jg_043>) end;

//  Jh_044Class = interface(JObjectClass)
//  ['{A0562EF5-8EA0-4F30-824C-A4482F8301AF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/a/h')]
//  Jh_044 = interface(JObject)
//  ['{93264305-44E4-4B23-8C07-175A30404D55}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer); cdecl; overload;
//    function b(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl;
//    function a(P1: Integer): Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJh_044 = class(TJavaGenericImport<Jh_044Class, Jh_044>) end;

//  Ji_045Class = interface(JObjectClass)
//  ['{4F709465-6295-423E-BFB8-937046A4731B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/a/i')]
//  Ji_045 = interface(IJavaInstance)
//  ['{535BA3F1-363E-49CB-AD81-17448B5C5499}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer); cdecl; overload;
//    function b(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl;
//    function a(P1: Integer): Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJi_045 = class(TJavaGenericImport<Ji_045Class, Ji_045>) end;

//  Ja_046Class = interface(JObjectClass)
//  ['{D33C3AFF-28DF-4E97-B54F-D1E1A9F90D18}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/b/a')]
//  Ja_046 = interface(JObject)
//  ['{517CD456-1C64-4EA0-9B46-A05DEDFFEFEF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_046 = class(TJavaGenericImport<Ja_046Class, Ja_046>) end;

//  Jb_047Class = interface(JObjectClass)
//  ['{D879C21E-FCBD-45A9-ACBC-37B652CDB92C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jb_047; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/b/b')]
//  Jb_047 = interface(JObject)
//  ['{1490B616-B188-4E17-A45C-3814944061CA}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
//    function c(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;

//  TJb_047 = class(TJavaGenericImport<Jb_047Class, Jb_047>) end;

//  Jc_048Class = interface(JObjectClass)
//  ['{E219D290-572C-435E-AA51-6B8B87C112CB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_048; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/b/c')]
//  Jc_048 = interface(JObject)
//  ['{FBAA932F-E0F7-4143-9199-977C620C6CA1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
//    function b(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;

//  TJc_048 = class(TJavaGenericImport<Jc_048Class, Jc_048>) end;

//  Ja_049Class = interface(JObjectClass)
//  ['{09A2553E-031F-44C9-A398-BCFFF96A1785}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: TJavaArray<Byte> read _Geta;
//    {class} property b: TJavaArray<Byte> read _Getb;
//    {class} property c: TJavaArray<Byte> read _Getc;
//    {class} property d: TJavaArray<Byte> read _Getd;
//    {class} property e: TJavaArray<Byte> read _Gete;
//  end;

//  [JavaSignature('com/baidu/b/c/c/a')]
//  Ja_049 = interface(JObject)
//  ['{E3BFB72C-8254-4EAC-8864-A6AFBFC224FC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_049 = class(TJavaGenericImport<Ja_049Class, Ja_049>) end;

//  Jb_050Class = interface(JObjectClass)
//  ['{CAE0E487-7AF2-4EA5-B98B-E0EB62F98B48}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: TJavaArray<Byte>; cdecl;
//    {class} function b: TJavaArray<Byte>; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/c/b')]
//  Jb_050 = interface(JObject)
//  ['{FAF19B74-B90C-410C-A5E9-44891DAFEB0D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_050 = class(TJavaGenericImport<Jb_050Class, Jb_050>) end;

//  Ja_051Class = interface(JObjectClass)
//  ['{65957950-79DF-4178-BC0D-55B9474A013F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Ja; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/d/a')]
//  Ja_051 = interface(JObject)
//  ['{F9E06739-8F22-4724-8EEE-36BB6CF0197C}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer; P2: Jd); cdecl; overload;
//    function a(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//
//    { Property }
//  end;

//  TJa_051 = class(TJavaGenericImport<Ja_051Class, Ja_051>) end;

//  Jb_052Class = interface(JObjectClass)
//  ['{5E3B7A39-6F8D-4E56-A6B4-E6A69628F3F4}']
//    { static Property Methods }
//    {class} function _Geta: JSecureRandom;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JBigInteger): Integer; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Byte>; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Jd): TJavaArray<Byte>; cdecl; overload;
//
//    { static Property }
//    {class} property a: JSecureRandom read _Geta;
//  end;

//  [JavaSignature('com/baidu/b/c/d/b')]
//  Jb_052 = interface(JObject)
//  ['{4F0CC738-D07E-4612-B729-8D17B3EDB459}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_052 = class(TJavaGenericImport<Jb_052Class, Jb_052>) end;

//  Jc_053Class = interface(JObjectClass)
//  ['{D6D98829-6D42-4EB9-910B-9A960FA6D947}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_053; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/d/c')]
//  Jc_053 = interface(JObject)
//  ['{34C8BD65-95B6-4B87-A193-36B797D7DCD7}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: Integer; P2: Jd; P3: JSecureRandom); cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Byte>; cdecl; overload;
//
//    { Property }
//  end;

//  TJc_053 = class(TJavaGenericImport<Jc_053Class, Jc_053>) end;

//  Jd_054Class = interface(JObjectClass)
//  ['{8121EC7A-7454-489E-A5B6-4863C82C32DB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/d/d')]
//  Jd_054 = interface(IJavaInstance)
//  ['{CF6949B9-276E-40CB-A039-A1248B9A0636}']
//    { Property Methods }
//
//    { methods }
//    function a: JBigInteger; cdecl;
//    function b: JBigInteger; cdecl;
//
//    { Property }
//  end;

//  TJd_054 = class(TJavaGenericImport<Jd_054Class, Jd_054>) end;

//  Je_055Class = interface(JObjectClass)
//  ['{5E865CC0-21D0-4011-8C21-B63F500E2DC7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Je_055; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/d/e')]
//  Je_055 = interface(JObject)
//  ['{8D7F958E-05E6-4A09-8B7E-F7D6E79E2156}']
//    { Property Methods }
//
//    { methods }
//    function b: JBigInteger; cdecl;
//    function a: JBigInteger; cdecl;
//
//    { Property }
//  end;

//  TJe_055 = class(TJavaGenericImport<Je_055Class, Je_055>) end;

//  Jf_056Class = interface(JObjectClass)
//  ['{9DFF1803-C571-465C-9532-59438E6326F4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Integer; P3: JSecureRandom): Jf; cdecl; overload;
//    {class} function a(P1: Integer; P2: Integer; P3: JSecureRandom; P4: JOAEPParameterSpec): Jf; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c/d/f')]
//  Jf_056 = interface(JObject)
//  ['{A86B4230-F572-4851-AB9F-CE289A609244}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Byte>; cdecl; overload;
//    function a(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    function b(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;

//  TJf_056 = class(TJavaGenericImport<Jf_056Class, Jf_056>) end;

//  Jc_057Class = interface(JObjectClass)
//  ['{D2700791-2546-4CC3-B552-8A81D271014E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_057; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/c')]
//  Jc_057 = interface(JObject)
//  ['{B84DA1FA-04FF-4A16-916A-BF86DAF4CA61}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JContext): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJc_057 = class(TJavaGenericImport<Jc_057Class, Jc_057>) end;

//  Ja_058Class = interface(JObjectClass)
//  ['{86BCB407-77EA-4746-8A2D-A29DB0BA8CF6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): TJavaArray<Byte>; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/d/a')]
//  Ja_058 = interface(JObject)
//  ['{B25C9A0C-5A66-49E9-9815-5337D2E49AA2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_058 = class(TJavaGenericImport<Ja_058Class, Ja_058>) end;

//  Jb_059Class = interface(JObjectClass)
//  ['{EE6EBA49-37D1-45E7-BEB1-CC23206D5B5B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: Boolean): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: JString; P3: Boolean): JString; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/d/b')]
//  Jb_059 = interface(JObject)
//  ['{602D0395-F117-4362-A2D9-F011430D0C05}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_059 = class(TJavaGenericImport<Jb_059Class, Jb_059>) end;

//  Jc_060Class = interface(JObjectClass)
//  ['{B9615596-F15D-48A9-9BBA-1F5548812D5D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/d/c')]
//  Jc_060 = interface(JObject)
//  ['{D70E8443-44D9-44DC-B387-41FCB41B611F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_060 = class(TJavaGenericImport<Jc_060Class, Jc_060>) end;

//  Jd_061Class = interface(JObjectClass)
//  ['{B2331CE7-F795-44BD-B9FE-21D8B070E01F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/d')]
//  Jd_061 = interface(JObject)
//  ['{A1912DDD-0D28-48B5-BC29-0372D39E15B9}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jb; P2: Jb): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJd_061 = class(TJavaGenericImport<Jd_061Class, Jd_061>) end;

//  Ja_a_062Class = interface(JObjectClass)
//  ['{4520CA4E-9578-4EFC-9C47-39789EF5BCC6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/e/a$a')]
//  Ja_a_062 = interface(JObject)
//  ['{B9A8F12A-362F-49BF-ABDD-024B6A84E5B6}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload;
//    function b: JFile; cdecl;
//    function c: JString; cdecl;
//    function a(P1: JString): Ja_a; cdecl; overload;
//    function d: Ja_a; cdecl;
//    function a(P1: JString; P2: JString; P3: Boolean): Boolean; cdecl; overload;
//    function a(P1: JString; P2: Boolean): JString; cdecl; overload;
//    function a(P1: JFile): Ja_a; cdecl; overload;
//
//    { Property }
//  end;

//  TJa_a_062 = class(TJavaGenericImport<Ja_a_062Class, Ja_a_062>) end;

//  Ja_063Class = interface(JObjectClass)
//  ['{C2CB4B5B-958F-492B-A884-D1B7A8C85C77}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Ja_063; cdecl;
//    {class} procedure a(P1: JFile); cdecl; overload;
//    {class} function a(P1: JFile; P2: JString; P3: JString; P4: JString; P5: Boolean): Boolean; cdecl; overload;
//    {class} function a(P1: JFile; P2: JString; P3: JString; P4: Boolean): JString; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/e/a')]
//  Ja_063 = interface(JObject)
//  ['{3C7CAF1D-BA63-4EA4-B6F1-B6A07AF586D6}']
//    { Property Methods }
//
//    { methods }
//    function a: JFile; cdecl; overload;
//    function b: Ja_a; cdecl;
//
//    { Property }
//  end;

//  TJa_063 = class(TJavaGenericImport<Ja_063Class, Ja_063>) end;

//  Je_064Class = interface(JObjectClass)
//  ['{F67A077F-7F0E-466F-86A1-4AD309399BC9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: TJavaArray<Byte>; cdecl;
//    {class} function b: TJavaArray<Byte>; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/e')]
//  Je_064 = interface(JObject)
//  ['{A7C471B4-F47A-4476-981D-CF9E6EF7794D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_064 = class(TJavaGenericImport<Je_064Class, Je_064>) end;

//  Ja_065Class = interface(JObjectClass)
//  ['{9E105C7B-130B-4905-B02E-7DEACB85A720}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Boolean; P3: Boolean): Ja_065; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/f/a')]
//  Ja_065 = interface(JObject)
//  ['{5FEF1ADB-B21E-4096-BC18-06248CE35783}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Byte>): JString; cdecl;
//
//    { Property }
//  end;

//  TJa_065 = class(TJavaGenericImport<Ja_065Class, Ja_065>) end;

//  Jb_066Class = interface(JObjectClass)
//  ['{53235712-5C56-4A17-A767-73D1FBA48BCE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_066; cdecl; overload;
//    {class} function init(P1: Int64): Jb_066; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/f/b')]
//  Jb_066 = interface(JObject)
//  ['{177EB5E1-5E22-44AC-A5B2-E46E4710B20E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_066 = class(TJavaGenericImport<Jb_066Class, Jb_066>) end;

//  Jc_067Class = interface(JObjectClass)
//  ['{D8183E06-FAA7-4006-967D-0F5B2D72E99E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JFile): JString; cdecl; overload;
//    {class} procedure a(P1: JThrowable); cdecl; overload;
//    {class} procedure a(P1: JCloseable); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/f/c')]
//  Jc_067 = interface(JObject)
//  ['{A07DF508-058C-45E8-A723-58385985DCEC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_067 = class(TJavaGenericImport<Jc_067Class, Jc_067>) end;

//  Jf_068Class = interface(JObjectClass)
//  ['{30DA820D-A9B2-4E59-BA8E-17616069FFF4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf_068; cdecl;
//    {class} function a(P1: JString): Boolean; cdecl; overload;
//    {class} function a(P1: Integer): Boolean; cdecl; overload;
//    {class} function b(P1: JString): Jf; cdecl;
//    {class} function a(P1: JString; P2: JString): Jf; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/f')]
//  Jf_068 = interface(JObject)
//  ['{30A93DE4-0EEE-44BB-A970-DD09BD54A09A}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//  end;

//  TJf_068 = class(TJavaGenericImport<Jf_068Class, Jf_068>) end;

//  Jg_069Class = interface(JObjectClass)
//  ['{8C54C014-8323-4765-ACF0-C15BD202CE62}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Jc): Jg_069; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/g')]
//  Jg_069 = interface(JObject)
//  ['{3FF2DF83-6153-499D-A4D8-5F24D2C6E55D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): Jf; cdecl;
//
//    { Property }
//  end;

//  TJg_069 = class(TJavaGenericImport<Jg_069Class, Jg_069>) end;

//  Jh_a_070Class = interface(JObjectClass)
//  ['{C29F3063-AAD3-42E1-A821-B990E3B98892}']
//    { static Property Methods }
//    {class} function _Geta: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jh_a_070; cdecl;
//
//    { static Property }
//    {class} property a: TJavaObjectArray<JString> read _Geta;
//  end;

//  [JavaSignature('com/baidu/b/h$a')]
//  Jh_a_070 = interface(JObject)
//  ['{D0B50DFD-C92A-4132-8AC3-7951FA09681E}']
//    { Property Methods }
//
//    { methods }
//    function a: JString; cdecl;
//    function b: JString; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//
//    { Property }
//  end;

//  TJh_a_070 = class(TJavaGenericImport<Jh_a_070Class, Jh_a_070>) end;

//  Jh_071Class = interface(JObjectClass)
//  ['{E4CF22C2-C393-4F7F-8DBD-5E151363288A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Ja; P3: Jc): Jh_071; cdecl;
//    {class} function a(P1: JString): Jh_a; cdecl; overload;
//    {class} function a(P1: JString; P2: JString; P3: JString): Jh_a; cdecl; overload;
//    {class} procedure b(P1: JString); cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/b/h')]
//  Jh_071 = interface(JObject)
//  ['{56682771-7351-4981-AE88-C352054A8AC2}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jf): Jh_a; cdecl; overload;
//    function c(P1: JString): Jh_a; cdecl;
//    function a: Jh_a; cdecl; overload;
//
//    { Property }
//  end;

//  TJh_071 = class(TJavaGenericImport<Jh_071Class, Jh_071>) end;

//  Ja_072Class = interface(JObjectClass)
//  ['{9ED85A82-EE5E-4C41-A3BF-B64BC9B1D4BA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/a')]
//  Ja_072 = interface(JObject)
//  ['{DA304649-28FB-4D22-AC61-99A43F325C29}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_072 = class(TJavaGenericImport<Ja_072Class, Ja_072>) end;

//  Jb_073Class = interface(JObjectClass)
//  ['{E6B9481E-7242-409C-A035-445468C4DCC7}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a(P1: JString); cdecl; overload;
//    {class} procedure b(P1: JString); cdecl;
//    {class} procedure c(P1: JString); cdecl;
//    {class} function a: JString; cdecl; overload;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/b')]
//  Jb_073 = interface(JObject)
//  ['{38C6293B-B6DB-431D-AD15-AB5FFB779CF3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_073 = class(TJavaGenericImport<Jb_073Class, Jb_073>) end;

//  Jc_074Class = interface(JObjectClass)
//  ['{2317B551-A422-4B41-9561-00AB151F265F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): TJavaArray<Byte>; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: JString): JString; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/c')]
//  Jc_074 = interface(JObject)
//  ['{9D86B4A4-059F-4157-928D-E2B46D9CBB0B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_074 = class(TJavaGenericImport<Jc_074Class, Jc_074>) end;

//  Jd_a_075Class = interface(JObjectClass)
//  ['{C9FE3199-6BA3-4611-9681-FF4E5CDDD595}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/d$a')]
//  Jd_a_075 = interface(JObject)
//  ['{3653FDAA-6846-45A9-B186-B041D513F3F2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_a_075 = class(TJavaGenericImport<Jd_a_075Class, Jd_a_075>) end;

//  Jd_076Class = interface(JObjectClass)
//  ['{C889B0EA-82DC-4A80-A1E6-D3D4B552B692}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/d')]
//  Jd_076 = interface(JObject)
//  ['{0C33878B-597D-4C75-A89E-05BFE41B55E8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_076 = class(TJavaGenericImport<Jd_076Class, Jd_076>) end;

//  Je_a_077Class = interface(JObjectClass)
//  ['{8703187B-200C-4662-AF8E-5DACE864F22A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/e$a')]
//  Je_a_077 = interface(IJavaInstance)
//  ['{F1651CC7-F729-4695-B8AF-BA00447B2B89}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JObject); cdecl;
//
//    { Property }
//  end;

//  TJe_a_077 = class(TJavaGenericImport<Je_a_077Class, Je_a_077>) end;

//  Je_078Class = interface(JObjectClass)
//  ['{B19346EE-69C3-42D2-AF38-F3DA5B75944F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/e')]
//  Je_078 = interface(JObject)
//  ['{0034E4FD-8461-482D-ABC0-5EC935373CE3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_078 = class(TJavaGenericImport<Je_078Class, Je_078>) end;

  JErrorMessageClass = interface(JObjectClass)
  ['{045E4C20-6676-4DAE-84DF-45331E3E1312}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/lbsapi/auth/ErrorMessage')]
  JErrorMessage = interface(JObject)
  ['{7719FD64-904D-4126-B4A1-FD5102385782}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJErrorMessage = class(TJavaGenericImport<JErrorMessageClass, JErrorMessage>) end;

//  Jf_080Class = interface(JObjectClass)
//  ['{E0965423-F369-4421-A41D-D5572C9758B9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/f')]
//  Jf_080 = interface(JObject)
//  ['{CFE67928-9A63-4517-835D-FE480A8D000C}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJf_080 = class(TJavaGenericImport<Jf_080Class, Jf_080>) end;

//  Jg_aClass = interface(JObjectClass)
//  ['{E16FC39C-EFB3-4804-9DD7-8D3C736FD0CD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/g$a')]
//  Jg_a = interface(IJavaInstance)
//  ['{DC4C8C27-8006-47AA-9E11-4E9B69E727B9}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JObject); cdecl;
//
//    { Property }
//  end;

//  TJg_a = class(TJavaGenericImport<Jg_aClass, Jg_a>) end;

//  Jg_082Class = interface(JObjectClass)
//  ['{CF32C600-1796-49EC-AF02-3FA92BD0A391}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/g')]
//  Jg_082 = interface(JObject)
//  ['{AEA0614D-B895-4502-A68E-9439BE2791EF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg_082 = class(TJavaGenericImport<Jg_082Class, Jg_082>) end;

//  Jh_083Class = interface(JObjectClass)
//  ['{FB1FFA1F-4FBB-4877-9A9E-F673EFCCD4FB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/h')]
//  Jh_083 = interface(JObject)
//  ['{506DE7DD-E9F9-4A31-8CA7-957A6DF90E7F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJh_083 = class(TJavaGenericImport<Jh_083Class, Jh_083>) end;

//  Ji_084Class = interface(JObjectClass)
//  ['{E0CEDEA7-5DCB-4EBD-AF2F-FD6B1B60D0ED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Ji_084; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/i')]
//  Ji_084 = interface(JObject)
//  ['{0E02A4F3-549A-4834-8949-47A7CF11467B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi_084 = class(TJavaGenericImport<Ji_084Class, Ji_084>) end;

//  Jj_085Class = interface(JObjectClass)
//  ['{B630E887-DB82-4422-A821-F885ABBBE5BA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/j')]
//  Jj_085 = interface(JObject)
//  ['{CF227CB4-BB36-4BB1-865B-E23FFEC673F1}']
//    { Property Methods }
//
//    { methods }
//    function verify(P1: JString; P2: JSSLSession): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJj_085 = class(TJavaGenericImport<Jj_085Class, Jj_085>) end;

//  Jk_086Class = interface(JHandlerClass) // or JObjectClass
//  ['{6C0BB0D9-A877-45B0-AF0C-BC30BF69C746}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/k')]
//  Jk_086 = interface(JHandler) // or JObject
//  ['{B4366BD6-DD46-44C5-A9A4-2C452291673E}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJk_086 = class(TJavaGenericImport<Jk_086Class, Jk_086>) end;

//  JlClass = interface(JObjectClass)
//  ['{B1AC7C56-A34E-45A9-BCED-4476BEBF3DF9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/l')]
//  Jl = interface(JObject)
//  ['{9DD6A51D-D02E-4DD6-8656-1B91404FA668}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJl = class(TJavaGenericImport<JlClass, Jl>) end;

  JLBSAuthManagerClass = interface(JObjectClass)
  ['{226210E9-A3C0-44CE-AA93-0901406F7C66}']
    { static Property Methods }
    {class} function _GetCODE_UNAUTHENTICATE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE_AUTHENTICATING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE_AUTHENTICATE_SUCC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE_INNER_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE_NETWORK_INVALID: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE_NETWORK_FAILED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE_KEY_NOT_EXIST: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getInstance(P1: JContext): JLBSAuthManager; cdecl;

    { static Property }
    {class} property CODE_UNAUTHENTICATE: Integer read _GetCODE_UNAUTHENTICATE;
    {class} property CODE_AUTHENTICATING: Integer read _GetCODE_AUTHENTICATING;
    {class} property CODE_AUTHENTICATE_SUCC: Integer read _GetCODE_AUTHENTICATE_SUCC;
    {class} property CODE_INNER_ERROR: Integer read _GetCODE_INNER_ERROR;
    {class} property CODE_NETWORK_INVALID: Integer read _GetCODE_NETWORK_INVALID;
    {class} property CODE_NETWORK_FAILED: Integer read _GetCODE_NETWORK_FAILED;
    {class} property CODE_KEY_NOT_EXIST: Integer read _GetCODE_KEY_NOT_EXIST;
    {class} property VERSION: JString read _GetVERSION;
  end;

  [JavaSignature('com/baidu/lbsapi/auth/LBSAuthManager')]
  JLBSAuthManager = interface(JObject)
  ['{7FF4E61C-29F5-47E7-979F-59DE0D548B58}']
    { Property Methods }

    { methods }
    procedure setPackageName(P1: JString); cdecl;
    procedure setKey(P1: JString); cdecl;
    function getKey: JString; cdecl;
    procedure setAndroidId(P1: JString); cdecl;
    function getMCode: JString; cdecl;
    function getCUID: JString; cdecl;
    procedure setPrivacyMode(P1: Boolean); cdecl;
    function getPrivacyMode: Boolean; cdecl;
    function getPublicKey(P1: JContext): JString; cdecl;
    function decodeAESMessage(P1: JString): JString; cdecl;
    function authenticate(P1: Boolean; P2: JString; P3: JHashtable; P4: JLBSAuthManagerListener): Integer; cdecl;

    { Property }
  end;

  TJLBSAuthManager = class(TJavaGenericImport<JLBSAuthManagerClass, JLBSAuthManager>) end;

  JLBSAuthManagerListenerClass = interface(JObjectClass)
  ['{661B5694-7C5F-4826-BCCE-7B3BA7B6237E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/lbsapi/auth/LBSAuthManagerListener')]
  JLBSAuthManagerListener = interface(IJavaInstance)
  ['{666F9991-CA99-4B2F-9E39-BD5788C02333}']
    { Property Methods }

    { methods }
    procedure onAuthResult(P1: Integer; P2: JString); cdecl;

    { Property }
  end;

  TJLBSAuthManagerListener = class(TJavaGenericImport<JLBSAuthManagerListenerClass, JLBSAuthManagerListener>) end;

//  JmClass = interface(JObjectClass)
//  ['{6D0A9359-1EEB-4FA0-A590-E73B873EB50E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/m')]
//  Jm = interface(JObject)
//  ['{51B4FA8F-31A0-4505-88EB-6A93F719443F}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//
//    { Property }
//  end;

//  TJm = class(TJavaGenericImport<JmClass, Jm>) end;

//  JnClass = interface(JObjectClass)
//  ['{7E0E3241-C25B-4A2D-898B-31EEBDED296E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/n')]
//  Jn = interface(JObject)
//  ['{6DA37693-7DBF-447D-AB3A-1DCCB58AED77}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//
//    { Property }
//  end;

//  TJn = class(TJavaGenericImport<JnClass, Jn>) end;

//  JoClass = interface(JThreadClass) // or JObjectClass
//  ['{33F0B3EF-FB5B-4660-8BB8-F2847334F4EA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/o')]
//  Jo = interface(JThread) // or JObject
//  ['{AED05998-C72C-485B-A8F4-2352E72CC3EA}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//    procedure a; cdecl;
//    procedure b; cdecl;
//    procedure c; cdecl;
//
//    { Property }
//  end;

//  TJo = class(TJavaGenericImport<JoClass, Jo>) end;

//  JpClass = interface(JObjectClass)
//  ['{B53802E0-3E2E-461C-936A-0DC8C5909A31}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: Boolean): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: JString; P3: Boolean): JString; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/p')]
//  Jp = interface(JObject)
//  ['{439D1960-829C-4036-8EE0-63706AD1BAAB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp = class(TJavaGenericImport<JpClass, Jp>) end;

//  JqClass = interface(JObjectClass)
//  ['{B65D13CE-2E4E-420D-BA39-58A1D632C419}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JKeyPair; cdecl; overload;
//    {class} function b: JString; cdecl; overload;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function b(P1: JString): TJavaArray<Byte>; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/lbsapi/auth/q')]
//  Jq = interface(JObject)
//  ['{62FE61C6-AA98-4FBB-9837-5F294CE3D7CF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJq = class(TJavaGenericImport<JqClass, Jq>) end;

//  Ja_095Class = interface(JObjectClass)
//  ['{82D5BA47-F504-4B06-9983-1C02E0D8A8F5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Ja; cdecl; overload;
//    {class} function init: Ja_095; cdecl;
//    {class} function b(P1: JContext): JString; cdecl; overload;
//    {class} function c(P1: JContext): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/a/a')]
//  Ja_095 = interface(JObject)
//  ['{BE1FA5B1-57B9-486F-8D4E-C9A90F9C9AE3}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JContext); cdecl; overload;
//    procedure a(P1: JContext; P2: JString); cdecl; overload;
//    function b: Boolean; cdecl; overload;
//    procedure onAuthResult(P1: Integer; P2: JString); cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;

//  TJa_095 = class(TJavaGenericImport<Ja_095Class, Ja_095>) end;

//  Ja_096Class = interface(JObjectClass)
//  ['{F88ACA0D-F973-4E61-A6E2-1C4DF3403172}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/a')]
//  Ja_096 = interface(JObject)
//  ['{D0776D84-69B1-4869-B55E-49C27DED940F}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JBDLocation; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JBDLocation>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJa_096 = class(TJavaGenericImport<Ja_096Class, Ja_096>) end;

//  JAddress_1Class = interface(JObjectClass)
//  ['{FEF50204-D308-4D7F-A257-5E9ACD582980}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/Address$1')]
//  JAddress_1 = interface(JObject)
//  ['{0D707093-ED76-4A66-956A-1232B1C061F8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJAddress_1 = class(TJavaGenericImport<JAddress_1Class, JAddress_1>) end;

  JAddress_BuilderClass = interface(JObjectClass)
  ['{B595286E-F6C1-4E39-B07C-D25E15775165}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAddress_Builder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/baidu/location/Address$Builder')]
  JAddress_Builder = interface(JObject)
  ['{CC55F6BF-3EDD-4CFC-A7B5-82D3B0B2DBFD}']
    { Property Methods }

    { methods }
    function country(P1: JString): JAddress_Builder; cdecl;
    function adcode(P1: JString): JAddress_Builder; cdecl;
    function countryCode(P1: JString): JAddress_Builder; cdecl;
    function province(P1: JString): JAddress_Builder; cdecl;
    function city(P1: JString): JAddress_Builder; cdecl;
    function cityCode(P1: JString): JAddress_Builder; cdecl;
    function district(P1: JString): JAddress_Builder; cdecl;
    function street(P1: JString): JAddress_Builder; cdecl;
    function streetNumber(P1: JString): JAddress_Builder; cdecl;
    function town(P1: JString): JAddress_Builder; cdecl;
    function build: JAddress; cdecl;

    { Property }
  end;

  TJAddress_Builder = class(TJavaGenericImport<JAddress_BuilderClass, JAddress_Builder>) end;

  JAddressClass = interface(JObjectClass)
  ['{EBBA0FCA-02B1-4556-B948-1D54F277A954}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/location/Address')]
  JAddress = interface(JObject)
  ['{25890760-36A3-4333-B57B-23F2985B356D}']
    { Property Methods }
    function _Getcountry: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcountry(acountry: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcountryCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcountryCode(acountryCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getprovince: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setprovince(aprovince: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getcity: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcity(acity: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcityCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcityCode(acityCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getdistrict: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setdistrict(adistrict: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getstreet: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setstreet(astreet: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstreetNumber: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstreetNumber(astreetNumber: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getaddress: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setaddress(aaddress: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getadcode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setadcode(aadcode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettown: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settown(atown: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property country: JString read _Getcountry write _Setcountry;
    property countryCode: JString read _GetcountryCode write _SetcountryCode;
    property province: JString read _Getprovince write _Setprovince;
    property city: JString read _Getcity write _Setcity;
    property cityCode: JString read _GetcityCode write _SetcityCode;
    property district: JString read _Getdistrict write _Setdistrict;
    property street: JString read _Getstreet write _Setstreet;
    property streetNumber: JString read _GetstreetNumber write _SetstreetNumber;
    property address: JString read _Getaddress write _Setaddress;
    property adcode: JString read _Getadcode write _Setadcode;
    property town: JString read _Gettown write _Settown;
  end;

  TJAddress = class(TJavaGenericImport<JAddressClass, JAddress>) end;

//  Ja_1Class = interface(JObjectClass)
//  ['{B7B8290E-7501-40D6-8E31-871D88672EF0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/a$1')]
//  Ja_1 = interface(JObject)
//  ['{E783EBDF-8300-495A-9E00-2BD965D95056}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_1 = class(TJavaGenericImport<Ja_1Class, Ja_1>) end;

//  Ja_a_101Class = interface(Jf_225Class) // or JObjectClass
//  ['{3E43658B-5CD1-47E2-BB6D-36087B86BCF7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja): Ja_a_101; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/a$a')]
//  Ja_a_101 = interface(Jf_225) // or JObject
//  ['{087B4030-CEFA-4201-B222-1E7F457F4EB8}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//  end;

//  TJa_a_101 = class(TJavaGenericImport<Ja_a_101Class, Ja_a_101>) end;

//  Ja_b_102Class = interface(JObjectClass)
//  ['{7499482C-D0E4-4D34-8017-4C8F6CE6E920}']
//    { static Property Methods }
//    {class} function _Geta: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: Ja read _Geta;
//  end;

//  [JavaSignature('com/baidu/location/b/a$b')]
//  Ja_b_102 = interface(JObject)
//  ['{3CF37FCE-71F7-4B25-82F2-3B039CD44260}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_b_102 = class(TJavaGenericImport<Ja_b_102Class, Ja_b_102>) end;

//  Ja_103Class = interface(JObjectClass)
//  ['{3EBAD3BA-C627-4190-AA7F-A7DE02472373}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Ja; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/a')]
//  Ja_103 = interface(JObject)
//  ['{435C7AB8-714A-4436-886A-9F9B9EE63BB1}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: TJavaArray<Double>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: TJavaArray<Double>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JContext; P2: JLocationClientOption; P3: JString); cdecl; overload;
//    procedure a(P1: Double; P2: Double; P3: JString); cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: Double read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//    property f: Double read _Getf write _Setf;
//    property g: Integer read _Getg write _Setg;
//    property h: Integer read _Geth write _Seth;
//    property i: Integer read _Geti write _Seti;
//    property j: Integer read _Getj write _Setj;
//    property k: Integer read _Getk write _Setk;
//    property l: Integer read _Getl write _Setl;
//    property m: TJavaArray<Double> read _Getm write _Setm;
//    property n: Integer read _Getn write _Setn;
//    property o: Integer read _Geto write _Seto;
//    property p: Integer read _Getp write _Setp;
//    property q: Integer read _Getq write _Setq;
//    property r: Integer read _Getr write _Setr;
//    property s: Single read _Gets write _Sets;
//    property t: Single read _Gett write _Sett;
//  end;

//  TJa_103 = class(TJavaGenericImport<Ja_103Class, Ja_103>) end;

//  JaaClass = interface(JObjectClass)
//  ['{9CF41004-AFEC-4807-81F6-0416D71FEFA5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jaa; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/aa')]
//  Jaa = interface(JObject)
//  ['{03C936CD-4BF3-4D61-A904-70AA06BAE652}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JGnssNavigationMessage; P2: Int64); cdecl; overload;
//    procedure a(P1: JLocation; P2: Integer); cdecl; overload;
//    procedure b; cdecl;
//    procedure c; cdecl;
//    procedure d; cdecl;
//    procedure e; cdecl;
//    procedure f; cdecl;
//
//    { Property }
//  end;

//  TJaa = class(TJavaGenericImport<JaaClass, Jaa>) end;

//  JabClass = interface(JHandlerClass) // or JObjectClass
//  ['{720BB2C0-A085-4D6C-82AC-D745E78A94DA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/ab')]
//  Jab = interface(JHandler) // or JObject
//  ['{2A3F4112-C715-47D6-B647-D1580BE04612}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJab = class(TJavaGenericImport<JabClass, Jab>) end;

//  Jb_1Class = interface(JObjectClass)
//  ['{376D94FB-DE57-4F20-8BD8-ED6BBE35C414}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/b$1')]
//  Jb_1 = interface(JObject)
//  ['{6360783F-C69C-4BC2-BA49-D13F096EC54D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_1 = class(TJavaGenericImport<Jb_1Class, Jb_1>) end;

//  Jb_aClass = interface(JObjectClass)
//  ['{D921FE14-2186-4E13-9EB7-7A07B4282A83}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb; P2: JMessage): Jb_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/b$a')]
//  Jb_a = interface(JObject)
//  ['{82D764BB-92FB-445D-9C47-3C6E496860B3}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JMessenger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JMessenger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JLocationClientOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JLocationClientOption);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JBDLocation); cdecl; overload;
//    function a(P1: Integer; P2: Boolean; P3: JBDLocation): Integer; cdecl; overload;
//    procedure a(P1: JBDLocation; P2: Integer); cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JMessenger read _Getb write _Setb;
//    property c: JLocationClientOption read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//  end;

//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  Jb_bClass = interface(JObjectClass)
//  ['{4BCAEC27-89EC-45DF-BEF0-2A6241BE1452}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/b$b')]
//  Jb_b = interface(JObject)
//  ['{F8468104-7D39-40F1-9D60-EF3AB31F1244}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_b = class(TJavaGenericImport<Jb_bClass, Jb_b>) end;

//  Jb_cClass = interface(JObjectClass)
//  ['{626344CA-7F7C-4977-9C9E-C5A7E44D38DF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/b$c')]
//  Jb_c = interface(JObject)
//  ['{0BD8907A-8B9C-4F5C-BA4E-3DC4B5F4CFFF}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJb_c = class(TJavaGenericImport<Jb_cClass, Jb_c>) end;

//  Jb_110Class = interface(JObjectClass)
//  ['{AD1261E8-DCFD-44F3-91C7-7E52D5E8EF68}']
//    { static Property Methods }
//    {class} function _Getc: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: Jb; cdecl; overload;
//
//    { static Property }
//    {class} property c: Int64 read _Getc;
//    {class} property d: Integer read _Getd;
//  end;

//  [JavaSignature('com/baidu/location/b/b')]
//  Jb_110 = interface(JObject)
//  ['{B387C47A-200B-4F6D-9E47-75734B7643CC}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure b; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JMessage); cdecl; overload;
//    procedure b(P1: JMessage); cdecl; overload;
//    function c(P1: JMessage): Boolean; cdecl; overload;
//    procedure a(P1: JBDLocation); cdecl; overload;
//    procedure b(P1: JBDLocation); cdecl; overload;
//    procedure a(P1: JBundle; P2: Integer); cdecl; overload;
//    procedure c(P1: JBDLocation); cdecl; overload;
//    procedure d(P1: JBDLocation); cdecl; overload;
//    function c: JString; cdecl; overload;
//    function d(P1: JMessage): Integer; cdecl; overload;
//    function e(P1: JMessage): Integer; cdecl;
//    procedure d; cdecl; overload;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//  end;

//  TJb_110 = class(TJavaGenericImport<Jb_110Class, Jb_110>) end;

//  Jc_a_111Class = interface(JObjectClass)
//  ['{E127A9A6-B050-45DF-98D8-6A61DBC34B59}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/c$a')]
//  Jc_a_111 = interface(JObject)
//  ['{264C5378-8C13-4EFB-8CD7-03BC71EC43FB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_a_111 = class(TJavaGenericImport<Jc_a_111Class, Jc_a_111>) end;

//  Jc_112Class = interface(JObjectClass)
//  ['{461DF435-7C18-4805-B85F-0B4B46AF653E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jc; cdecl; overload;
//    {class} function init: Jc_112; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/c')]
//  Jc_112 = interface(JObject)
//  ['{4FE01D10-F827-4E43-916D-514EB7656CE7}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JContext); cdecl; overload;
//    procedure a(P1: JBDLocation; P2: JString; P3: JLocation); cdecl; overload;
//    function b: JString; cdecl;
//    function c: JString; cdecl;
//
//    { Property }
//  end;

//  TJc_112 = class(TJavaGenericImport<Jc_112Class, Jc_112>) end;

//  Jd_113Class = interface(JObjectClass)
//  ['{83C61A0D-E3F4-46EA-82B0-DB9ABD0DF7DF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jd; cdecl; overload;
//    {class} function init: Jd_113; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/d')]
//  Jd_113 = interface(JObject)
//  ['{697FAC0B-933B-4FE4-8370-810F6E6FDD51}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer; P2: Integer; P3: JString); cdecl; overload;
//
//    { Property }
//  end;

//  TJd_113 = class(TJavaGenericImport<Jd_113Class, Jd_113>) end;

//  Je_a_114Class = interface(JTelephonyManager_CellInfoCallbackClass) // or JObjectClass
//  ['{B9FE0099-9876-4FBD-9F3F-63CE5A950921}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/e$a')]
//  Je_a_114 = interface(JTelephonyManager_CellInfoCallback) // or JObject
//  ['{3214645D-6BE6-4049-9C97-F351A09E88F6}']
//    { Property Methods }
//
//    { methods }
//    procedure onCellInfo(P1: JList); cdecl;
//
//    { Property }
//  end;

//  TJe_a_114 = class(TJavaGenericImport<Je_a_114Class, Je_a_114>) end;

//  Je_b_115Class = interface(JObjectClass)
//  ['{E04A585B-4414-49D4-837A-B684C0604E1D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/e$b')]
//  Je_b_115 = interface(IJavaInstance)
//  ['{5D7E0EA5-29EF-452D-A278-D7BABC968B7F}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceiveLocation(P1: JBDLocation); cdecl;
//
//    { Property }
//  end;

//  TJe_b_115 = class(TJavaGenericImport<Je_b_115Class, Je_b_115>) end;

//  Je_c_a_116Class = interface(JObjectClass)
//  ['{7EB2D4CD-1D04-4178-AE96-883DF4C7A401}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/e$c$a')]
//  Je_c_a_116 = interface(JObject)
//  ['{F70CBDEB-3690-4C21-8D92-DBBA69462638}']
//    { Property Methods }
//
//    { methods }
//    procedure onLocationChanged(P1: JLocation); cdecl;
//    procedure onStatusChanged(P1: JString; P2: Integer; P3: JBundle); cdecl;
//    procedure onProviderEnabled(P1: JString); cdecl;
//    procedure onProviderDisabled(P1: JString); cdecl;
//
//    { Property }
//  end;

//  TJe_c_a_116 = class(TJavaGenericImport<Je_c_a_116Class, Je_c_a_116>) end;

//  Je_c_117Class = interface(Jf_225Class) // or JObjectClass
//  ['{51D1F4A6-396E-461A-A7EF-2F51E3A39C31}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/e$c')]
//  Je_c_117 = interface(Jf_225) // or JObject
//  ['{6F79B418-74EB-443D-8B45-65E36613F2E0}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//  end;

//  TJe_c_117 = class(TJavaGenericImport<Je_c_117Class, Je_c_117>) end;

//  Je_d_118Class = interface(JObjectClass)
//  ['{4AF892C0-3322-439C-9EA6-A2D04DCCC315}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/e$d')]
//  Je_d_118 = interface(JObject)
//  ['{9206047E-A1DA-4C6F-94FC-BCED7116DC3B}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//  end;

//  TJe_d_118 = class(TJavaGenericImport<Je_d_118Class, Je_d_118>) end;

//  Je_e_119Class = interface(JObjectClass)
//  ['{FECB9360-F4D9-4369-84B1-7E1594DC4ED5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JList): Je_e_119; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/e$e')]
//  Je_e_119 = interface(JObject)
//  ['{7D1BDD5A-0477-4E16-A4FE-11BFCF762DA2}']
//    { Property Methods }
//    function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function a(P1: Integer; P2: JString; P3: Boolean; P4: Integer): JString; cdecl; overload;
//
//    { Property }
//    property a: JList read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//  end;

//  TJe_e_119 = class(TJavaGenericImport<Je_e_119Class, Je_e_119>) end;

//  Je_f_120Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{371B70C2-D6CF-44DE-B591-687154B077B0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/e$f')]
//  Je_f_120 = interface(JBroadcastReceiver) // or JObject
//  ['{FA2C1B95-4789-4E9D-8002-AF89DE7423C0}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJe_f_120 = class(TJavaGenericImport<Je_f_120Class, Je_f_120>) end;

//  Je_121Class = interface(JObjectClass)
//  ['{041D1065-1C40-46BD-B432-D158954D283B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JLocationClientOption; P3: Je_b; P4: JString): Je_121; cdecl;
//    {class} function a(P1: JWifiManager): Boolean; cdecl; overload;
//    {class} function a(P1: JCellLocation; P2: JTelephonyManager; P3: Ja): Ja; cdecl; overload;
//    {class} function b(P1: JWifiManager): JString; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/e')]
//  Je_121 = interface(JObject)
//  ['{67BA6BFA-A540-439C-8D58-61E160C8164F}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload;
//    function b: JString; cdecl; overload;
//    procedure c; cdecl;
//    procedure d; cdecl;
//    procedure e; cdecl;
//
//    { Property }
//  end;

//  TJe_121 = class(TJavaGenericImport<Je_121Class, Je_121>) end;

//  Jf_122Class = interface(JObjectClass)
//  ['{7630D062-1E38-4F5C-9616-4440F6B4FD93}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/f')]
//  Jf_122 = interface(JObject)
//  ['{CC03BDD5-8B19-4213-9AAD-6D6F0F786358}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Je_d; P2: Je_d): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJf_122 = class(TJavaGenericImport<Jf_122Class, Jf_122>) end;

//  Jg_123Class = interface(JTimerTaskClass) // or JObjectClass
//  ['{0F19D5EC-4859-42AB-8733-A366E4ACEFA4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/g')]
//  Jg_123 = interface(JTimerTask) // or JObject
//  ['{4C33FA94-BCEF-465B-90B1-3C4DDE55E684}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg_123 = class(TJavaGenericImport<Jg_123Class, Jg_123>) end;

//  Jh_a_124Class = interface(JObjectClass)
//  ['{495E0161-9DB1-4F88-B961-D1104BA1F071}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JURL): Jh_a_124; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/h$a')]
//  Jh_a_124 = interface(JObject)
//  ['{45A361B0-59F9-42F3-A10E-78AEC3083A35}']
//    { Property Methods }
//
//    { methods }
//    function verify(P1: JString; P2: JSSLSession): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJh_a_124 = class(TJavaGenericImport<Jh_a_124Class, Jh_a_124>) end;

//  Jh_bClass = interface(Jf_225Class) // or JObjectClass
//  ['{A975D0DD-6822-4FD1-ADB8-83767C50262F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jh): Jh_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/h$b')]
//  Jh_b = interface(Jf_225) // or JObject
//  ['{4CC9DE58-9594-4169-8EE1-235321898922}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//  end;

//  TJh_b = class(TJavaGenericImport<Jh_bClass, Jh_b>) end;

//  Jh_126Class = interface(JObjectClass)
//  ['{0E9099AD-13FD-4FC5-B883-A44BB526A73F}']
//    { static Property Methods }
//    {class} function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: Jh; cdecl; overload;
//
//    { static Property }
//    {class} property f: JString read _Getf;
//  end;

//  [JavaSignature('com/baidu/location/b/h')]
//  Jh_126 = interface(JObject)
//  ['{D0E46DD4-B13B-4A40-9420-815F4241E26C}']
//    { Property Methods }
//
//    { methods }
//    procedure b; cdecl;
//    procedure a(P1: JLocation); cdecl; overload;
//
//    { Property }
//  end;

//  TJh_126 = class(TJavaGenericImport<Jh_126Class, Jh_126>) end;

//  Ji_127Class = interface(JObjectClass)
//  ['{92C5E08E-B2E7-424E-B065-B25BFBB38E14}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/i')]
//  Ji_127 = interface(JObject)
//  ['{5C788D72-3701-446A-9918-A9256D318F25}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJi_127 = class(TJavaGenericImport<Ji_127Class, Ji_127>) end;

//  Jj_128Class = interface(JThreadClass) // or JObjectClass
//  ['{232869A9-12F7-4DC7-A364-F8815F79EA42}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/j')]
//  Jj_128 = interface(JThread) // or JObject
//  ['{331E8072-A689-4BB7-BA4D-31035C49AAF7}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJj_128 = class(TJavaGenericImport<Jj_128Class, Jj_128>) end;

//  Jk_129Class = interface(JObjectClass)
//  ['{52E9DCA1-910C-440D-8F74-C1C7300CE275}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/k')]
//  Jk_129 = interface(JObject)
//  ['{58C3418E-8B65-40BD-8308-D20E37D008CE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk_129 = class(TJavaGenericImport<Jk_129Class, Jk_129>) end;

//  Jl_aClass = interface(Jf_225Class) // or JObjectClass
//  ['{A22827BA-2C08-4737-821C-5CEFEC59E9B3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/l$a')]
//  Jl_a = interface(Jf_225) // or JObject
//  ['{9E6E47DF-146D-48A4-8B3A-8A54FB9133B6}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JString; P2: JString); cdecl; overload;
//
//    { Property }
//  end;

//  TJl_a = class(TJavaGenericImport<Jl_aClass, Jl_a>) end;

//  Jl_131Class = interface(JObjectClass)
//  ['{320EC387-D600-4B7C-8AA2-B099EC7F6EAF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jl; cdecl; overload;
//    {class} function init: Jl_131; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/l')]
//  Jl_131 = interface(JObject)
//  ['{838F3301-6CD0-442D-BABE-4DBDDAC133A1}']
//    { Property Methods }
//
//    { methods }
//    procedure b; cdecl;
//    procedure c; cdecl;
//    procedure a(P1: JString); cdecl; overload;
//    function d: Integer; cdecl;
//    procedure e; cdecl;
//
//    { Property }
//  end;

//  TJl_131 = class(TJavaGenericImport<Jl_131Class, Jl_131>) end;

//  Jm_aClass = interface(JHandlerClass) // or JObjectClass
//  ['{BBA9A251-8DF3-445F-B0E7-2E053E092E96}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jm): Jm_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/m$a')]
//  Jm_a = interface(JHandler) // or JObject
//  ['{691583F0-1029-4CF3-A0E7-B497397E43F5}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJm_a = class(TJavaGenericImport<Jm_aClass, Jm_a>) end;

//  Jm_bClass = interface(Jf_225Class) // or JObjectClass
//  ['{D9BD8AD2-2B81-4995-AE65-841E9A256814}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jm): Jm_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/m$b')]
//  Jm_b = interface(Jf_225) // or JObject
//  ['{59B5231E-B3F0-498A-807A-C860C9F67127}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JString; P2: Int64); cdecl; overload;
//
//    { Property }
//  end;

//  TJm_b = class(TJavaGenericImport<Jm_bClass, Jm_b>) end;

//  Jm_134Class = interface(JObjectClass)
//  ['{B4248345-42A8-43D6-8D98-82900397FDF2}']
//    { static Property Methods }
//    {class} function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jm_134; cdecl;
//
//    { static Property }
//    {class} property d: JString read _Getd;
//  end;

//  [JavaSignature('com/baidu/location/b/m')]
//  Jm_134 = interface(JObject)
//  ['{E0449473-CF67-410D-8206-7F2545F9F549}']
//    { Property Methods }
//    function _Geta: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jl);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Ja);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JHashSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JHashSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JMessage); cdecl; overload;
//    procedure a; cdecl; overload;
//    function a(P1: JString): JString; cdecl; overload;
//    function b: JString; cdecl;
//
//    { Property }
//    property a: Jl read _Geta write _Seta;
//    property b: Ja read _Getb write _Setb;
//    property c: JHashSet read _Getc write _Setc;
//  end;

//  TJm_134 = class(TJavaGenericImport<Jm_134Class, Jm_134>) end;

//  Jn_1Class = interface(JObjectClass)
//  ['{1DC234FF-87C1-4D29-A916-1D24E58A92EC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/n$1')]
//  Jn_1 = interface(JObject)
//  ['{97155AFD-036C-412C-94AD-F76F810553E0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn_1 = class(TJavaGenericImport<Jn_1Class, Jn_1>) end;

//  Jn_aClass = interface(JObjectClass)
//  ['{47ED245B-8B85-4282-9B9C-FE91CF90EC03}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/n$a')]
//  Jn_a = interface(JObject)
//  ['{A7BC5E56-081E-476D-AAB4-FDBDCC87220E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn_a = class(TJavaGenericImport<Jn_aClass, Jn_a>) end;

//  Jn_137Class = interface(JObjectClass)
//  ['{5187FDD8-E79E-49AB-A7D4-AE4264AD5C22}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jn; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/n')]
//  Jn_137 = interface(JObject)
//  ['{84C47147-39D2-4F3F-AE1B-020314E1D2B5}']
//    { Property Methods }
//
//    { methods }
//    function b: Boolean; cdecl; overload;
//    function a(P1: JString): JString; cdecl; overload;
//    function b(P1: JString): JString; cdecl; overload;
//
//    { Property }
//  end;

//  TJn_137 = class(TJavaGenericImport<Jn_137Class, Jn_137>) end;

//  Jo_1Class = interface(JObjectClass)
//  ['{BBF8B7B0-1F26-4076-8AAC-8A8FEE63A31F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/o$1')]
//  Jo_1 = interface(JObject)
//  ['{8B85A43B-5F7C-4020-90A6-CE28BBF8CD40}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJo_1 = class(TJavaGenericImport<Jo_1Class, Jo_1>) end;

//  Jo_aClass = interface(JHandlerClass) // or JObjectClass
//  ['{757074D3-FF0C-43AC-88CA-B4586F4DD78E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/o$a')]
//  Jo_a = interface(JHandler) // or JObject
//  ['{391259F3-7DFD-4475-B4ED-4447F928903C}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJo_a = class(TJavaGenericImport<Jo_aClass, Jo_a>) end;

//  Jo_bClass = interface(JObjectClass)
//  ['{2F26874C-AE37-451F-AA9A-C83E92E2DCB4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/o$b')]
//  Jo_b = interface(JObject)
//  ['{1789D52A-63DC-436B-8DEF-CE37BF09CD3A}']
//    { Property Methods }
//
//    { methods }
//    function a: JString; cdecl;
//    function b: JString; cdecl;
//
//    { Property }
//  end;

//  TJo_b = class(TJavaGenericImport<Jo_bClass, Jo_b>) end;

//  Jo_cClass = interface(JObjectClass)
//  ['{A07219BB-4600-4D2A-8326-B909144F3E6D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/o$c')]
//  Jo_c = interface(JObject)
//  ['{441F101C-FC81-4FF5-AC22-91F99EB08738}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJo_c = class(TJavaGenericImport<Jo_cClass, Jo_c>) end;

//  Jo_dClass = interface(JObjectClass)
//  ['{9F688419-9268-44F2-A35F-790E4BC5F477}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/o$d')]
//  Jo_d = interface(JObject)
//  ['{7D70DDAD-E087-4E66-A1D3-70B00BE23F3F}']
//    { Property Methods }
//
//    { methods }
//    procedure sendMessage(P1: JString); cdecl;
//    procedure showLog(P1: JString); cdecl;
//
//    { Property }
//  end;

//  TJo_d = class(TJavaGenericImport<Jo_dClass, Jo_d>) end;

//  Jo_eClass = interface(JBDAbstractLocationListenerClass) // or JObjectClass
//  ['{BB7A2B36-3DB8-42F5-98B7-C34B9FB2D4E4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jo): Jo_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/o$e')]
//  Jo_e = interface(JBDAbstractLocationListener) // or JObject
//  ['{D8AAFD3C-C5A1-46F7-8006-4DD70B578FEA}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceiveLocation(P1: JBDLocation); cdecl;
//
//    { Property }
//  end;

//  TJo_e = class(TJavaGenericImport<Jo_eClass, Jo_e>) end;

//  Jo_fClass = interface(JObjectClass)
//  ['{06BBF928-851A-413F-9707-FA60545B6C74}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/o$f')]
//  Jo_f = interface(JObject)
//  ['{2E48F5A2-E7F7-4903-A7A0-E2B75C020C4B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJo_f = class(TJavaGenericImport<Jo_fClass, Jo_f>) end;

//  Jo_145Class = interface(JObjectClass)
//  ['{F9492FDE-1678-453B-8D0E-09F55F4775FF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jo; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/o')]
//  Jo_145 = interface(JObject)
//  ['{81A44165-B2B9-4B41-9687-9BDC0185ECB0}']
//    { Property Methods }
//    function _Geta: Jo_e;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jo_e);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JContext; P2: JWebView; P3: JLocationClient); cdecl; overload;
//    procedure b; cdecl;
//
//    { Property }
//    property a: Jo_e read _Geta write _Seta;
//  end;

//  TJo_145 = class(TJavaGenericImport<Jo_145Class, Jo_145>) end;

//  Jp_aClass = interface(JObjectClass)
//  ['{7A96B56C-CF49-47E4-A969-5BEEBFEF6E50}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/p$a')]
//  Jp_a = interface(JObject)
//  ['{111242BA-67A9-480B-8E57-5B7D8FA2557B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJp_a = class(TJavaGenericImport<Jp_aClass, Jp_a>) end;

//  Jp_bClass = interface(JObjectClass)
//  ['{B35E9DA1-B4CB-41B2-B603-010EE0CC6FF2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/p$b')]
//  Jp_b = interface(JObject)
//  ['{B16323B6-DCAA-4DEC-8975-E704B61D37D6}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJp_b = class(TJavaGenericImport<Jp_bClass, Jp_b>) end;

//  Jp_148Class = interface(Jm_134Class) // or JObjectClass
//  ['{BC15E70D-5FFB-46B1-B4D4-B3F225E35CB0}']
//    { static Property Methods }
//    {class} function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function c: Jp; cdecl; overload;
//
//    { static Property }
//    {class} property g: JString read _Getg;
//    {class} property i: Boolean read _Geti;
//  end;

//  [JavaSignature('com/baidu/location/b/p')]
//  Jp_148 = interface(Jm_134) // or JObject
//  ['{6252341B-C978-4EBE-BFCD-79690AFFFBF4}']
//    { Property Methods }
//    function _Getf: Jm_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jm_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure b(P1: JMessage); cdecl; overload;
//    procedure d; cdecl;
//    procedure e; cdecl;
//    function a(P1: JBDLocation): JAddress; cdecl; overload;
//    function f: JString; cdecl;
//    function g: JList; cdecl;
//    function h: JPoiRegion; cdecl;
//    procedure i; cdecl;
//    function j: Boolean; cdecl;
//    procedure a(P1: JMessage); cdecl; overload;
//    procedure b(P1: JBDLocation); cdecl; overload;
//    procedure a; cdecl; overload;
//    procedure k; cdecl;
//    procedure c(P1: JBDLocation); cdecl; overload;
//
//    { Property }
//    property f: Jm_b read _Getf write _Setf;
//    property h: JHandler read _Geth write _Seth;
//  end;

//  TJp_148 = class(TJavaGenericImport<Jp_148Class, Jp_148>) end;

//  Jq_149Class = interface(JObjectClass)
//  ['{A44CE3EC-FBE1-4953-A5B3-5792B7DF9630}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/q')]
//  Jq_149 = interface(JObject)
//  ['{0A92B44F-D97C-40F5-86C5-3B621C8253B1}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJq_149 = class(TJavaGenericImport<Jq_149Class, Jq_149>) end;

//  Jr_1Class = interface(JObjectClass)
//  ['{4C1BBCE2-11F8-4640-8A8A-3B58E919EC56}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/r$1')]
//  Jr_1 = interface(JObject)
//  ['{19A8E800-5A9F-4D44-86BF-C6FC8C7FBD5E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr_1 = class(TJavaGenericImport<Jr_1Class, Jr_1>) end;

//  Jr_aClass = interface(JObjectClass)
//  ['{B0827509-B9C3-4EC2-AB14-FE92D4A3E038}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/r$a')]
//  Jr_a = interface(JObject)
//  ['{F90ECA0A-DDC1-4B83-B64A-C6F97AC8ECAB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr_a = class(TJavaGenericImport<Jr_aClass, Jr_a>) end;

//  Jr_bClass = interface(JObjectClass)
//  ['{4F2FCA1E-461C-4FBB-810E-E54C071435EE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/r$b')]
//  Jr_b = interface(JObject)
//  ['{7836D355-CC44-4B55-BD03-37D8A725034C}']
//    { Property Methods }
//
//    { methods }
//    procedure onLocationChanged(P1: JLocation); cdecl;
//    procedure onStatusChanged(P1: JString; P2: Integer; P3: JBundle); cdecl;
//    procedure onProviderEnabled(P1: JString); cdecl;
//    procedure onProviderDisabled(P1: JString); cdecl;
//
//    { Property }
//  end;

//  TJr_b = class(TJavaGenericImport<Jr_bClass, Jr_b>) end;

//  Jr_cClass = interface(JObjectClass)
//  ['{2C942865-750D-4AFB-BBEB-AD8FD806ECC9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/r$c')]
//  Jr_c = interface(IJavaInstance)
//  ['{EA7F19CB-835E-4C21-90E7-C043FF8BFD02}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JLocation); cdecl;
//
//    { Property }
//  end;

//  TJr_c = class(TJavaGenericImport<Jr_cClass, Jr_c>) end;

//  JrClass = interface(JObjectClass)
//  ['{ED1EFBDE-06B1-4883-98D6-C8B19DA1580E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr; cdecl;
//    {class} function a: Jr; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/r')]
//  Jr = interface(JObject)
//  ['{A5097D50-4267-4824-BBFF-A1D23178E4EA}']
//    { Property Methods }
//    function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Jr_c); cdecl; overload;
//    procedure b(P1: Jr_c); cdecl; overload;
//    procedure b; cdecl; overload;
//    procedure c; cdecl;
//
//    { Property }
//    property a: JList read _Geta write _Seta;
//  end;

//  TJr = class(TJavaGenericImport<JrClass, Jr>) end;

//  JsClass = interface(JObjectClass)
//  ['{DC9CBBCC-6CF2-48CF-A61F-8487D64A2CAC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Js; cdecl; overload;
//    {class} function init: Js; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/s')]
//  Js = interface(JObject)
//  ['{C85491F9-2081-4945-898D-EA2D412BCC00}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JContext): JSharedPreferences; cdecl; overload;
//
//    { Property }
//  end;

//  TJs = class(TJavaGenericImport<JsClass, Js>) end;

//  Jt_aClass = interface(JObjectClass)
//  ['{0B01A940-5A59-4DD2-B872-2E22DA39A678}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/t$a')]
//  Jt_a = interface(JObject)
//  ['{AB72366B-A142-406F-B8AD-5B132FF840C7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt_a = class(TJavaGenericImport<Jt_aClass, Jt_a>) end;

//  Jt_bClass = interface(JObjectClass)
//  ['{89A00F94-6E35-46CE-AB6F-0AA1BC533593}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jt): Jt_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/t$b')]
//  Jt_b = interface(JObject)
//  ['{E4A3720E-8609-403D-BFE4-E108D0C2B54E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt_b = class(TJavaGenericImport<Jt_bClass, Jt_b>) end;

//  Jt_cClass = interface(JObjectClass)
//  ['{DF90B991-649E-4E37-B9FA-4013DF622267}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jt; P2: Integer; P3: Integer): Jt_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/t$c')]
//  Jt_c = interface(JObject)
//  ['{A5A20CCA-EA73-4573-8A0B-6311551A2080}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt_c = class(TJavaGenericImport<Jt_cClass, Jt_c>) end;

//  JtClass = interface(JObjectClass)
//  ['{703AB970-6930-4F9D-B246-F653E92B7E16}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jt; cdecl; overload;
//    {class} function init: Jt; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/t')]
//  Jt = interface(JObject)
//  ['{324652B1-38A9-4353-8DB4-2203CE41C147}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JGnssNavigationMessage; P2: Int64); cdecl; overload;
//    function b: JArrayList; cdecl;
//
//    { Property }
//  end;

//  TJt = class(TJavaGenericImport<JtClass, Jt>) end;

//  Ju_1Class = interface(JObjectClass)
//  ['{5FE3A4B5-F3BC-443C-A4D5-3A6B5D1D36C8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/u$1')]
//  Ju_1 = interface(JObject)
//  ['{D39A97AF-746F-4085-A2B6-48A8EB627608}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu_1 = class(TJavaGenericImport<Ju_1Class, Ju_1>) end;

//  Ju_aClass = interface(JObjectClass)
//  ['{2D5B536A-D0A8-4858-9E5E-292886C1C7D7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/u$a')]
//  Ju_a = interface(JObject)
//  ['{0371E820-BEB7-4A67-899D-988999A8DE4A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu_a = class(TJavaGenericImport<Ju_aClass, Ju_a>) end;

//  JuClass = interface(JObjectClass)
//  ['{016C9494-E857-4330-BECB-2363E631F82E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Ju; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/u')]
//  Ju = interface(JObject)
//  ['{D0974DFA-14DF-493F-AE6F-ABE992CAA762}']
//    { Property Methods }
//
//    { methods }
//    procedure b; cdecl;
//    procedure c; cdecl;
//    procedure onSensorChanged(P1: JSensorEvent); cdecl;
//    procedure onAccuracyChanged(P1: JSensor; P2: Integer); cdecl;
//    procedure a(P1: Boolean); cdecl; overload;
//    function d: Boolean; cdecl;
//    function e: Single; cdecl;
//
//    { Property }
//  end;

//  TJu = class(TJavaGenericImport<JuClass, Ju>) end;

//  JvClass = interface(JObjectClass)
//  ['{FBE0DEAF-6082-4937-8FC8-F0734C92DBB8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JString); cdecl; overload;
//    {class} function a: JString; cdecl; overload;
//    {class} function b: Int64; cdecl; overload;
//    {class} procedure a(P1: Int64); cdecl; overload;
//    {class} function c: Ja; cdecl;
//    {class} procedure a(P1: Ja); cdecl; overload;
//    {class} function d: JLocation; cdecl;
//    {class} procedure a(P1: JLocation); cdecl; overload;
//    {class} procedure b(P1: JString); cdecl; overload;
//    {class} function e: JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/v')]
//  Jv = interface(JObject)
//  ['{401C6B6E-997E-438A-81C5-3C04AC22D1FD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJv = class(TJavaGenericImport<JvClass, Jv>) end;

//  JwClass = interface(JObjectClass)
//  ['{B9937145-46F7-450D-B2B4-602E37AE94E1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JHandlerThread; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/w')]
//  Jw = interface(JObject)
//  ['{D868EAAD-0ACC-40FF-BCB2-302906452DC0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw = class(TJavaGenericImport<JwClass, Jw>) end;

//  Jx_1Class = interface(JObjectClass)
//  ['{BBBAB44B-989C-42F7-A05F-45F371C90E1F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/x$1')]
//  Jx_1 = interface(JObject)
//  ['{6FC2C17C-4980-4165-8174-BFAA7DE868A6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJx_1 = class(TJavaGenericImport<Jx_1Class, Jx_1>) end;

//  Jx_aClass = interface(JObjectClass)
//  ['{BA5FABBA-3932-4A40-9AED-DD5BD849F6A3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/x$a')]
//  Jx_a = interface(JObject)
//  ['{15982705-CCC7-4B38-A304-C925A7ED981A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJx_a = class(TJavaGenericImport<Jx_aClass, Jx_a>) end;

//  JxClass = interface(JObjectClass)
//  ['{02F6DC31-DB92-4795-A43F-5E63E842189C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jx; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/x')]
//  Jx = interface(JObject)
//  ['{7DF4D452-5630-4624-AEBF-1E1DF6B6FC15}']
//    { Property Methods }
//
//    { methods }
//    function b: JExecutorService; cdecl;
//    function c: JExecutorService; cdecl;
//    procedure d; cdecl;
//
//    { Property }
//  end;

//  TJx = class(TJavaGenericImport<JxClass, Jx>) end;

//  Jy_aClass = interface(JObjectClass)
//  ['{93FACA32-22C9-4F75-818A-CAD826373A8F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/y$a')]
//  Jy_a = interface(JObject)
//  ['{012D0FB4-783A-4FB9-837C-A2607414D931}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJy_a = class(TJavaGenericImport<Jy_aClass, Jy_a>) end;

//  Jy_bClass = interface(Jf_225Class) // or JObjectClass
//  ['{F4257E10-B2DA-4A1C-8C16-EDD6BC6A0BDB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jy): Jy_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/y$b')]
//  Jy_b = interface(Jf_225) // or JObject
//  ['{E1D8773C-BB94-463D-99A4-E6ACEE01101F}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    function b: Boolean; cdecl;
//    procedure a(P1: JString; P2: Int64); cdecl; overload;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//    property b: Int64 read _Getb write _Setb;
//  end;

//  TJy_b = class(TJavaGenericImport<Jy_bClass, Jy_b>) end;

//  JyClass = interface(JObjectClass)
//  ['{EE9D51BA-E63C-42E7-BC56-997BD6D04884}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jy; cdecl;
//    {class} function a: Jy; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/y')]
//  Jy = interface(JObject)
//  ['{CFF4A8F7-112F-40C8-86A0-EFB9FDA6F530}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JGnssNavigationMessage; P2: Int64); cdecl; overload;
//    procedure b; cdecl;
//
//    { Property }
//  end;

//  TJy = class(TJavaGenericImport<JyClass, Jy>) end;

//  Jz_aClass = interface(Jf_225Class) // or JObjectClass
//  ['{CE6C4C62-A339-4945-B901-43D78AD7A08E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jz): Jz_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/z$a')]
//  Jz_a = interface(Jf_225) // or JObject
//  ['{9C21E1E2-5AA3-4280-A9D9-719446DBE397}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure b; cdecl;
//
//    { Property }
//  end;

//  TJz_a = class(TJavaGenericImport<Jz_aClass, Jz_a>) end;

//  JzClass = interface(JObjectClass)
//  ['{E04E4737-3F49-4B55-8AD5-CCF8276F9AA2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jz; cdecl; overload;
//    {class} function b: JString; cdecl;
//    {class} procedure a(P1: Ja; P2: Jl; P3: JLocation; P4: JString; P5: JString); cdecl; overload;
//    {class} function a(P1: JLocation; P2: Boolean): Boolean; cdecl; overload;
//    {class} procedure d; cdecl;
//    {class} function e: JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b/z')]
//  Jz = interface(JObject)
//  ['{07F29F43-40C7-48FA-9FE9-0A9BB9F52913}']
//    { Property Methods }
//
//    { methods }
//    procedure c; cdecl;
//
//    { Property }
//  end;

//  TJz = class(TJavaGenericImport<JzClass, Jz>) end;

//  Jb_173Class = interface(JObjectClass)
//  ['{9329E6A0-EC31-4EEA-8F94-C989BB4595EE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/b')]
//  Jb_173 = interface(JObject)
//  ['{13E8F9A6-DAB2-4B71-AB46-B46C495B6AC0}']
//    { Property Methods }
//
//    { methods }
//    procedure onServiceConnected(P1: JComponentName; P2: JIBinder); cdecl;
//    procedure onServiceDisconnected(P1: JComponentName); cdecl;
//
//    { Property }
//  end;

//  TJb_173 = class(TJavaGenericImport<Jb_173Class, Jb_173>) end;

  JBDAbstractLocationListenerClass = interface(JObjectClass)
  ['{9728316A-6C71-4E96-9EA4-B6CF35198AA4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBDAbstractLocationListener; cdecl;

    { static Property }
  end;

  [JavaSignature('com/baidu/location/BDAbstractLocationListener')]
  JBDAbstractLocationListener = interface(JObject)
  ['{B2F2A3C5-5903-4490-B0A6-44E5436B7B9D}']
    { Property Methods }

    { methods }
    procedure onReceiveLocation(P1: JBDLocation); cdecl;
    procedure onConnectHotSpotMessage(P1: JString; P2: Integer); cdecl;
    procedure onLocDiagnosticMessage(P1: Integer; P2: Integer; P3: JString); cdecl;
    procedure onReceiveVdrLocation(P1: JBDLocation); cdecl;
    procedure onReceiveLocString(P1: JString); cdecl;

    { Property }
  end;

  TJBDAbstractLocationListener = class(TJavaGenericImport<JBDAbstractLocationListenerClass, JBDAbstractLocationListener>) end;

  JBDLocationClass = interface(JObjectClass)
  ['{EFD17273-B125-46A2-8F22-0CBAD65FDE15}']
    { static Property Methods }
    {class} function _GetTypeNone: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeGpsLocation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeGnssLocation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeCriteriaException: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeNetWorkException: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeOffLineLocation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeOffLineLocationFail: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeOffLineLocationNetworkFail: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_CLOSE_LOCATION_SERVICE_SWITCH_FAIL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_NO_PERMISSION_LOCATION_FAIL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_NO_PERMISSION_AND_CLOSE_SWITCH_FAIL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeCoarseLocation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeNetWorkLocation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeCacheLocation: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeServerError: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeServerDecryptError: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTypeServerCheckKeyError: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_HD_LOCATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_BMS_HD_LOCATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOCATION_WHERE_UNKNOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOCATION_WHERE_IN_CN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOCATION_WHERE_OUT_CN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUSER_INDOOR_UNKNOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUSER_INDDOR_TRUE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUSER_INDOOR_FALSE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_LOCATION_NEARBY_SURPPORT_TRUE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_LOCATION_SURPPORT_TRUE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_LOCATION_SURPPORT_FALSE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_LOCATION_SOURCE_UNKNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_LOCATION_SOURCE_WIFI: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_LOCATION_SOURCE_MAGNETIC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_LOCATION_SOURCE_BLUETOOTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_LOCATION_SOURCE_SMALLCELLSTATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_NETWORK_STATE_HIGH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_NETWORK_STATE_MIDDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDOOR_NETWORK_STATE_LOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOPERATORS_TYPE_UNKONW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOPERATORS_TYPE_MOBILE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOPERATORS_TYPE_UNICOM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOPERATORS_TYPE_TELECOMU: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGPS_ACCURACY_GOOD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGPS_ACCURACY_MID: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGPS_ACCURACY_BAD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGPS_ACCURACY_UNKNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGNSS_ACCURACY_GOOD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGNSS_ACCURACY_MID: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGNSS_ACCURACY_BAD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGNSS_ACCURACY_UNKNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOCK_GPS_PROBABILITY_HIGH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOCK_GPS_PROBABILITY_MIDDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOCK_GPS_PROBABILITY_LOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOCK_GPS_PROBABILITY_ZERO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOCK_GPS_PROBABILITY_UNKNOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOCK_GNSS_PROBABILITY_HIGH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOCK_GNSS_PROBABILITY_MIDDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOCK_GNSS_PROBABILITY_LOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOCK_GNSS_PROBABILITY_ZERO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOCK_GNSS_PROBABILITY_UNKNOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_GCJ02_TO_BD09: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_GCJ02_TO_BD09LL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_BD09_TO_GCJ02: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_BD09LL_TO_GCJ02: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_WGS84_TO_GCJ02: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_COOR_TYPE_WGS84: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_COOR_TYPE_GCJ02: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_COOR_TYPE_GCJ03: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_COOR_TYPE_BD09MC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_COOR_TYPE_BD09LL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGPS_RECTIFY_NONE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGPS_RECTIFY_INDOOR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGPS_RECTIFY_OUTDOOR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_GNSS_PROVIDER_FROM_SYSTEM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDLOCATION_GNSS_PROVIDER_FROM_BAIDU_BEIDOU: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBDLocation; cdecl; overload;
    {class} function init(P1: JBDLocation): JBDLocation; cdecl; overload;
    {class} function init(P1: JString): JBDLocation; cdecl; overload;

    { static Property }
    {class} property TypeNone: Integer read _GetTypeNone;
    {class} property TypeGpsLocation: Integer read _GetTypeGpsLocation;
    {class} property TypeGnssLocation: Integer read _GetTypeGnssLocation;
    {class} property TypeCriteriaException: Integer read _GetTypeCriteriaException;
    {class} property TypeNetWorkException: Integer read _GetTypeNetWorkException;
    {class} property TypeOffLineLocation: Integer read _GetTypeOffLineLocation;
    {class} property TypeOffLineLocationFail: Integer read _GetTypeOffLineLocationFail;
    {class} property TypeOffLineLocationNetworkFail: Integer read _GetTypeOffLineLocationNetworkFail;
    {class} property TYPE_CLOSE_LOCATION_SERVICE_SWITCH_FAIL: Integer read _GetTYPE_CLOSE_LOCATION_SERVICE_SWITCH_FAIL;
    {class} property TYPE_NO_PERMISSION_LOCATION_FAIL: Integer read _GetTYPE_NO_PERMISSION_LOCATION_FAIL;
    {class} property TYPE_NO_PERMISSION_AND_CLOSE_SWITCH_FAIL: Integer read _GetTYPE_NO_PERMISSION_AND_CLOSE_SWITCH_FAIL;
    {class} property TypeCoarseLocation: Integer read _GetTypeCoarseLocation;
    {class} property TypeNetWorkLocation: Integer read _GetTypeNetWorkLocation;
    {class} property TypeCacheLocation: Integer read _GetTypeCacheLocation;
    {class} property TypeServerError: Integer read _GetTypeServerError;
    {class} property TypeServerDecryptError: Integer read _GetTypeServerDecryptError;
    {class} property TypeServerCheckKeyError: Integer read _GetTypeServerCheckKeyError;
    {class} property TYPE_HD_LOCATION: Integer read _GetTYPE_HD_LOCATION;
    {class} property TYPE_BMS_HD_LOCATION: Integer read _GetTYPE_BMS_HD_LOCATION;
    {class} property LOCATION_WHERE_UNKNOW: Integer read _GetLOCATION_WHERE_UNKNOW;
    {class} property LOCATION_WHERE_IN_CN: Integer read _GetLOCATION_WHERE_IN_CN;
    {class} property LOCATION_WHERE_OUT_CN: Integer read _GetLOCATION_WHERE_OUT_CN;
    {class} property USER_INDOOR_UNKNOW: Integer read _GetUSER_INDOOR_UNKNOW;
    {class} property USER_INDDOR_TRUE: Integer read _GetUSER_INDDOR_TRUE;
    {class} property USER_INDOOR_FALSE: Integer read _GetUSER_INDOOR_FALSE;
    {class} property INDOOR_LOCATION_NEARBY_SURPPORT_TRUE: Integer read _GetINDOOR_LOCATION_NEARBY_SURPPORT_TRUE;
    {class} property INDOOR_LOCATION_SURPPORT_TRUE: Integer read _GetINDOOR_LOCATION_SURPPORT_TRUE;
    {class} property INDOOR_LOCATION_SURPPORT_FALSE: Integer read _GetINDOOR_LOCATION_SURPPORT_FALSE;
    {class} property INDOOR_LOCATION_SOURCE_UNKNOWN: Integer read _GetINDOOR_LOCATION_SOURCE_UNKNOWN;
    {class} property INDOOR_LOCATION_SOURCE_WIFI: Integer read _GetINDOOR_LOCATION_SOURCE_WIFI;
    {class} property INDOOR_LOCATION_SOURCE_MAGNETIC: Integer read _GetINDOOR_LOCATION_SOURCE_MAGNETIC;
    {class} property INDOOR_LOCATION_SOURCE_BLUETOOTH: Integer read _GetINDOOR_LOCATION_SOURCE_BLUETOOTH;
    {class} property INDOOR_LOCATION_SOURCE_SMALLCELLSTATION: Integer read _GetINDOOR_LOCATION_SOURCE_SMALLCELLSTATION;
    {class} property INDOOR_NETWORK_STATE_HIGH: Integer read _GetINDOOR_NETWORK_STATE_HIGH;
    {class} property INDOOR_NETWORK_STATE_MIDDLE: Integer read _GetINDOOR_NETWORK_STATE_MIDDLE;
    {class} property INDOOR_NETWORK_STATE_LOW: Integer read _GetINDOOR_NETWORK_STATE_LOW;
    {class} property OPERATORS_TYPE_UNKONW: Integer read _GetOPERATORS_TYPE_UNKONW;
    {class} property OPERATORS_TYPE_MOBILE: Integer read _GetOPERATORS_TYPE_MOBILE;
    {class} property OPERATORS_TYPE_UNICOM: Integer read _GetOPERATORS_TYPE_UNICOM;
    {class} property OPERATORS_TYPE_TELECOMU: Integer read _GetOPERATORS_TYPE_TELECOMU;
    {class} property GPS_ACCURACY_GOOD: Integer read _GetGPS_ACCURACY_GOOD;
    {class} property GPS_ACCURACY_MID: Integer read _GetGPS_ACCURACY_MID;
    {class} property GPS_ACCURACY_BAD: Integer read _GetGPS_ACCURACY_BAD;
    {class} property GPS_ACCURACY_UNKNOWN: Integer read _GetGPS_ACCURACY_UNKNOWN;
    {class} property GNSS_ACCURACY_GOOD: Integer read _GetGNSS_ACCURACY_GOOD;
    {class} property GNSS_ACCURACY_MID: Integer read _GetGNSS_ACCURACY_MID;
    {class} property GNSS_ACCURACY_BAD: Integer read _GetGNSS_ACCURACY_BAD;
    {class} property GNSS_ACCURACY_UNKNOWN: Integer read _GetGNSS_ACCURACY_UNKNOWN;
    {class} property MOCK_GPS_PROBABILITY_HIGH: Integer read _GetMOCK_GPS_PROBABILITY_HIGH;
    {class} property MOCK_GPS_PROBABILITY_MIDDLE: Integer read _GetMOCK_GPS_PROBABILITY_MIDDLE;
    {class} property MOCK_GPS_PROBABILITY_LOW: Integer read _GetMOCK_GPS_PROBABILITY_LOW;
    {class} property MOCK_GPS_PROBABILITY_ZERO: Integer read _GetMOCK_GPS_PROBABILITY_ZERO;
    {class} property MOCK_GPS_PROBABILITY_UNKNOW: Integer read _GetMOCK_GPS_PROBABILITY_UNKNOW;
    {class} property MOCK_GNSS_PROBABILITY_HIGH: Integer read _GetMOCK_GNSS_PROBABILITY_HIGH;
    {class} property MOCK_GNSS_PROBABILITY_MIDDLE: Integer read _GetMOCK_GNSS_PROBABILITY_MIDDLE;
    {class} property MOCK_GNSS_PROBABILITY_LOW: Integer read _GetMOCK_GNSS_PROBABILITY_LOW;
    {class} property MOCK_GNSS_PROBABILITY_ZERO: Integer read _GetMOCK_GNSS_PROBABILITY_ZERO;
    {class} property MOCK_GNSS_PROBABILITY_UNKNOW: Integer read _GetMOCK_GNSS_PROBABILITY_UNKNOW;
    {class} property BDLOCATION_GCJ02_TO_BD09: JString read _GetBDLOCATION_GCJ02_TO_BD09;
    {class} property BDLOCATION_GCJ02_TO_BD09LL: JString read _GetBDLOCATION_GCJ02_TO_BD09LL;
    {class} property BDLOCATION_BD09_TO_GCJ02: JString read _GetBDLOCATION_BD09_TO_GCJ02;
    {class} property BDLOCATION_BD09LL_TO_GCJ02: JString read _GetBDLOCATION_BD09LL_TO_GCJ02;
    {class} property BDLOCATION_WGS84_TO_GCJ02: JString read _GetBDLOCATION_WGS84_TO_GCJ02;
    {class} property BDLOCATION_COOR_TYPE_WGS84: JString read _GetBDLOCATION_COOR_TYPE_WGS84;
    {class} property BDLOCATION_COOR_TYPE_GCJ02: JString read _GetBDLOCATION_COOR_TYPE_GCJ02;
    {class} property BDLOCATION_COOR_TYPE_GCJ03: JString read _GetBDLOCATION_COOR_TYPE_GCJ03;
    {class} property BDLOCATION_COOR_TYPE_BD09MC: JString read _GetBDLOCATION_COOR_TYPE_BD09MC;
    {class} property BDLOCATION_COOR_TYPE_BD09LL: JString read _GetBDLOCATION_COOR_TYPE_BD09LL;
    {class} property GPS_RECTIFY_NONE: Integer read _GetGPS_RECTIFY_NONE;
    {class} property GPS_RECTIFY_INDOOR: Integer read _GetGPS_RECTIFY_INDOOR;
    {class} property GPS_RECTIFY_OUTDOOR: Integer read _GetGPS_RECTIFY_OUTDOOR;
    {class} property BDLOCATION_GNSS_PROVIDER_FROM_SYSTEM: JString read _GetBDLOCATION_GNSS_PROVIDER_FROM_SYSTEM;
    {class} property BDLOCATION_GNSS_PROVIDER_FROM_BAIDU_BEIDOU: JString read _GetBDLOCATION_GNSS_PROVIDER_FROM_BAIDU_BEIDOU;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/location/BDLocation')]
  JBDLocation = interface(JObject)
  ['{B492C069-827A-4808-A0A0-BBE0AA94BA28}']
    { Property Methods }

    { methods }
    function getPoiList: JList; cdecl;
    procedure setPoiList(P1: JList); cdecl;
    function getPoiRegion: JPoiRegion; cdecl;
    procedure setPoiRegion(P1: JPoiRegion); cdecl;
    function isCellChangeFlag: Boolean; cdecl;
    function getUserIndoorState: Integer; cdecl;
    procedure setUserIndoorState(P1: Integer); cdecl;
    function getIndoorLocationSurpport: Integer; cdecl;
    function getIndoorLocationSurpportBuidlingName: JString; cdecl;
    function getIndoorLocationSurpportBuidlingID: JString; cdecl;
    procedure setIndoorLocationSurpport(P1: Integer); cdecl;
    function getIndoorNetworkState: Integer; cdecl;
    procedure setIndoorNetworkState(P1: Integer); cdecl;
    function getIndoorLocationSource: Integer; cdecl;
    procedure setIndoorLocationSource(P1: Integer); cdecl;
    function getIndoorSurpportPolygon: JString; cdecl;
    procedure setIndoorSurpportPolygon(P1: JString); cdecl;
    function getInOutStatus: Integer; cdecl;
    procedure setInOutStatus(P1: Integer); cdecl;
    function getAcc: Double; cdecl;
    procedure setAcc(P1: Double); cdecl;
    function getTime: JString; cdecl;
    procedure setTime(P1: JString); cdecl;
    procedure setTimeStamp(P1: Int64); cdecl;
    function getTimeStamp: Int64; cdecl;
    function getGnssProvider: JString; cdecl;
    procedure setGnssProvider(P1: JString); cdecl;
    function getRoadLocString: JString; cdecl;
    function getNrlResult: JString; cdecl;
    procedure setNrlData(P1: JString); cdecl;
    function getViaductResult: JString; cdecl;
    procedure setViaductData(P1: JString); cdecl;
    function getDelayTime: Int64; cdecl;
    procedure setDelayTime(P1: Int64); cdecl;
    function getGpsBiasProb: Single; cdecl; //Deprecated
    function getGnssBiasProb: Single; cdecl;
    procedure setGpsBiasProb(P1: Single); cdecl; //Deprecated
    procedure setGnssBiasProb(P1: Single); cdecl;
    procedure setRoadLocString(P1: Single; P2: Single; P3: JString; P4: JString); cdecl;
    function getLocationID: JString; cdecl;
    procedure setLocationID(P1: JString); cdecl;
    function getLatitude: Double; cdecl;
    procedure setLatitude(P1: Double); cdecl;
    function getLongitude: Double; cdecl;
    procedure setLongitude(P1: Double); cdecl;
    function getAltitude: Double; cdecl;
    procedure setAltitude(P1: Double); cdecl;
    function getSpeed: Single; cdecl;
    procedure setSpeed(P1: Single); cdecl;
    function getRadius: Single; cdecl;
    procedure setRadius(P1: Single); cdecl;
    function getTraffic: JString; cdecl;
    procedure setTraffic(P1: JString); cdecl;
    function isTrafficStation: Integer; cdecl;
    procedure setIsTrafficStation(P1: Integer); cdecl;
    function getTrafficConfidence: Single; cdecl;
    procedure setTrafficConfidence(P1: Single); cdecl;
    function getTrafficSkipProb: Single; cdecl;
    procedure setTrafficSkipProb(P1: Single); cdecl;
    function getCoorType: JString; cdecl;
    procedure setCoorType(P1: JString); cdecl;
    procedure setAddrStr(P1: JString); cdecl;
    procedure setIsInIndoorPark(P1: Boolean); cdecl;
    function isInIndoorPark: Boolean; cdecl;
    function hasAltitude: Boolean; cdecl;
    function hasSpeed: Boolean; cdecl;
    function hasRadius: Boolean; cdecl;
    procedure setLocType(P1: Integer); cdecl;
    function getLocType: Integer; cdecl;
    function getLocTypeDescription: JString; cdecl;
    procedure setLocTypeDescription(P1: JString); cdecl;
    procedure setSatelliteNumber(P1: Integer); cdecl;
    function getSatelliteNumber: Integer; cdecl;
    function getDerect: Single; cdecl; //Deprecated
    function getDirection: Single; cdecl;
    procedure setDirection(P1: Single); cdecl;
    function hasSateNumber: Boolean; cdecl;
    function hasAddr: Boolean; cdecl;
    function getAddress: JAddress; cdecl;
    procedure setAddr(P1: JAddress); cdecl;
    function getAddrStr: JString; cdecl;
    function getProvince: JString; cdecl;
    function getCity: JString; cdecl;
    function getAdCode: JString; cdecl;
    function getCityCode: JString; cdecl;
    function getCountry: JString; cdecl;
    function getCountryCode: JString; cdecl;
    function getDistrict: JString; cdecl;
    function getTown: JString; cdecl;
    function getStreet: JString; cdecl;
    function getStreetNumber: JString; cdecl;
    function getLocationDescribe: JString; cdecl;
    procedure setLocationDescribe(P1: JString); cdecl;
    function getFloor: JString; cdecl;
    procedure setFloor(P1: JString); cdecl;
    function getBuildingID: JString; cdecl;
    procedure setBuildingID(P1: JString); cdecl;
    function getBuildingName: JString; cdecl;
    procedure setBuildingName(P1: JString); cdecl;
    function isParkAvailable: Integer; cdecl;
    procedure setParkAvailable(P1: Integer); cdecl;
    function isIndoorLocMode: Boolean; cdecl;
    procedure setIndoorLocMode(P1: Boolean); cdecl;
    function getLocationWhere: Integer; cdecl;
    procedure setLocationWhere(P1: Integer); cdecl;
    function getGpsAccuracyStatus: Integer; cdecl; //Deprecated
    function getGnssAccuracyStatus: Integer; cdecl;
    procedure setGpsAccuracyStatus(P1: Integer); cdecl; //Deprecated
    procedure setGnssAccuracyStatus(P1: Integer); cdecl;
    function getSemaAptag: JString; cdecl; //Deprecated
    function getNetworkLocationType: JString; cdecl;
    procedure setNetworkLocationType(P1: JString); cdecl;
    function getOperators: Integer; cdecl; //Deprecated
    procedure setOperators(P1: Integer); cdecl;
    function describeContents: Integer; cdecl;
    procedure setGpsCheckStatus(P1: Integer); cdecl; //Deprecated
    procedure setGnssCheckStatus(P1: Integer); cdecl;
    function getGpsCheckStatus: Integer; cdecl; //Deprecated
    function getGnssCheckStatus: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    function getRetFields(P1: JString): JString; cdecl;
    procedure setRetFields(P1: JString; P2: JString); cdecl;
    function getExtraInfo: JBundle; cdecl;
    procedure setExtrainfo(P1: JBundle); cdecl;
    function getExtraLocation(P1: JString): JLocation; cdecl;
    function getNrlLat: Double; cdecl;
    function getNrlLon: Double; cdecl;
    function isNrlAvailable: Boolean; cdecl;
    procedure setExtraLocation(P1: JString; P2: JLocation); cdecl;
    function getFusionLocInfo(P1: JString): TJavaArray<Double>; cdecl;
    procedure setFusionLocInfo(P1: JString; P2: TJavaArray<Double>); cdecl;
    function getVdrJsonString: JString; cdecl;
    procedure setVdrJsonValue(P1: JString); cdecl;
    function toString: JString; cdecl;
    procedure setDisToRealLocation(P1: Double); cdecl;
    function getDisToRealLocation: Double; cdecl;
    procedure setMockGpsStrategy(P1: Integer); cdecl; //Deprecated
    procedure setMockGnssStrategy(P1: Integer); cdecl;
    function getMockGpsStrategy: Integer; cdecl; //Deprecated
    function getMockGnssStrategy: Integer; cdecl;
    procedure setMockGpsProbability(P1: Integer); cdecl; //Deprecated
    procedure setMockGnssProbability(P1: Integer); cdecl;
    function getMockGpsProbability: Integer; cdecl; //Deprecated
    function getMockGnssProbability: Integer; cdecl;
    procedure setReallLocation(P1: JBDLocation); cdecl;
    function getReallLocation: JBDLocation; cdecl;

    { Property }
  end;

  TJBDLocation = class(TJavaGenericImport<JBDLocationClass, JBDLocation>) end;

  JBDLocationListenerClass = interface(JObjectClass)
  ['{4FF804BE-A9ED-43DA-86C3-2DF80198B901}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/location/BDLocationListener')]
  JBDLocationListener = interface(IJavaInstance)
  ['{47D1A74C-4BBE-4129-A4DD-8FA2A52AFC78}']
    { Property Methods }

    { methods }
    procedure onReceiveLocation(P1: JBDLocation); cdecl;

    { Property }
  end;

  TJBDLocationListener = class(TJavaGenericImport<JBDLocationListenerClass, JBDLocationListener>) end;

//  Ja_177Class = interface(JObjectClass)
//  ['{DF7E17ED-F3AF-4AC5-B266-4AD35D559CDF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_177; cdecl; overload;
//    {class} function init(P1: Integer; P2: Int64; P3: Integer; P4: Integer; P5: Integer; P6: Char; P7: Integer): Ja_177; cdecl; overload;
//    {class} function init(P1: Ja): Ja_177; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/a')]
//  Ja_177 = interface(JObject)
//  ['{66FEA46F-2EE4-404F-B25F-735FBDE577E5}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Char);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Ja): Boolean; cdecl; overload;
//    function a: Boolean; cdecl; overload;
//    function b: Boolean; cdecl;
//    function c: Boolean; cdecl;
//    function d: Boolean; cdecl;
//    function e: Boolean; cdecl;
//    procedure f; cdecl;
//    function g: JString; cdecl;
//    function h: JString; cdecl;
//    function i: JString; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Int64 read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//    property f: Integer read _Getf write _Setf;
//    property g: Int64 read _Getg write _Setg;
//    property h: Integer read _Geth write _Seth;
//    property i: Char read _Geti write _Seti;
//    property j: Integer read _Getj write _Setj;
//    property k: Integer read _Getk write _Setk;
//    property l: Integer read _Getl write _Setl;
//    property m: JString read _Getm write _Setm;
//    property n: JString read _Getn write _Setn;
//    property o: JString read _Geto write _Seto;
//  end;

//  TJa_177 = class(TJavaGenericImport<Ja_177Class, Ja_177>) end;

//  Jb_1_178Class = interface(JObjectClass)
//  ['{0363F3B0-B053-4D39-BF64-8DA9BB21AE88}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/b$1')]
//  Jb_1_178 = interface(JObject)
//  ['{4D378E9D-A97B-49C9-99C2-F0F95C7C9208}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_1_178 = class(TJavaGenericImport<Jb_1_178Class, Jb_1_178>) end;

//  Jb_a_179Class = interface(JTelephonyManager_CellInfoCallbackClass) // or JObjectClass
//  ['{22AB1DB5-D1FC-434A-9994-5EAB952A5A3B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/b$a')]
//  Jb_a_179 = interface(JTelephonyManager_CellInfoCallback) // or JObject
//  ['{956EDC2B-D5AB-4386-8B6C-0B9C53103898}']
//    { Property Methods }
//
//    { methods }
//    procedure onCellInfo(P1: JList); cdecl;
//    procedure onError(P1: Integer; P2: JThrowable); cdecl;
//
//    { Property }
//  end;

//  TJb_a_179 = class(TJavaGenericImport<Jb_a_179Class, Jb_a_179>) end;

//  Jb_b_180Class = interface(JTelephonyManager_CellInfoCallbackClass) // or JObjectClass
//  ['{566DB2DD-F7BF-427B-A4A9-E9FF937508AB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/b$b')]
//  Jb_b_180 = interface(JTelephonyManager_CellInfoCallback) // or JObject
//  ['{1B965FCD-1994-463E-8A78-19FCF79A716F}']
//    { Property Methods }
//
//    { methods }
//    procedure onCellInfo(P1: JList); cdecl;
//
//    { Property }
//  end;

//  TJb_b_180 = class(TJavaGenericImport<Jb_b_180Class, Jb_b_180>) end;

//  Jb_c_181Class = interface(JTelephonyManager_CellInfoCallbackClass) // or JObjectClass
//  ['{33AFB0E4-F983-4E66-B244-D6FFCC0F0372}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/b$c')]
//  Jb_c_181 = interface(JTelephonyManager_CellInfoCallback) // or JObject
//  ['{195946AE-CBA4-44A0-9BD1-FDCE7E843419}']
//    { Property Methods }
//
//    { methods }
//    procedure onCellInfo(P1: JList); cdecl;
//
//    { Property }
//  end;

//  TJb_c_181 = class(TJavaGenericImport<Jb_c_181Class, Jb_c_181>) end;

//  Jb_dClass = interface(JPhoneStateListenerClass) // or JObjectClass
//  ['{0AB81C5D-519D-4336-BD09-C787C92C4F3E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb): Jb_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/b$d')]
//  Jb_d = interface(JPhoneStateListener) // or JObject
//  ['{F801779B-7FBD-4AEC-9106-BBF24589C1C4}']
//    { Property Methods }
//
//    { methods }
//    procedure onCellInfoChanged(P1: JList); cdecl;
//    procedure onSignalStrengthsChanged(P1: JSignalStrength); cdecl;
//
//    { Property }
//  end;

//  TJb_d = class(TJavaGenericImport<Jb_dClass, Jb_d>) end;

//  Jb_eClass = interface(JObjectClass)
//  ['{AE0E3E9F-E84F-4A52-98A1-CF75B1A5959F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/b$e')]
//  Jb_e = interface(JObject)
//  ['{E4B1DC78-D2BE-48F8-8E96-BA24ECE18434}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_e = class(TJavaGenericImport<Jb_eClass, Jb_e>) end;

//  Jb_fClass = interface(JObjectClass)
//  ['{A3C0345C-2517-401E-B2C7-5D69051B7FE2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/b$f')]
//  Jb_f = interface(JObject)
//  ['{E25B1268-5688-4005-98F7-2AA5E4AC9846}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Ji; P2: Ji): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJb_f = class(TJavaGenericImport<Jb_fClass, Jb_f>) end;

//  Jb_185Class = interface(JObjectClass)
//  ['{71D5429D-7BC7-4316-8368-32D48B972207}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: Jb; cdecl; overload;
//    {class} function a(P1: Ja; P2: JTelephonyManager; P3: Boolean): Ja; cdecl; overload;
//    {class} function a(P1: JCellInfo; P2: Ja; P3: JTelephonyManager): Ja; cdecl; overload;
//    {class} function a(P1: JString): Integer; cdecl; overload;
//    {class} function a(P1: JCellIdentityNr): Integer; cdecl; overload;
//    {class} function i: JString; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//  end;

//  [JavaSignature('com/baidu/location/c/b')]
//  Jb_185 = interface(JObject)
//  ['{F97FB549-E710-4E80-97FC-7F4916600CB6}']
//    { Property Methods }
//
//    { methods }
//    procedure b; cdecl; overload;
//    procedure c; cdecl; overload;
//    function d: Boolean; cdecl;
//    function e: Integer; cdecl;
//    function f: Ja; cdecl;
//    function g: JString; cdecl;
//    function h: Integer; cdecl;
//    function a(P1: Ja; P2: Ja): Boolean; cdecl; overload;
//    function a(P1: Ja): JHashSet; cdecl; overload;
//    function b(P1: Ja): JString; cdecl; overload;
//    function c(P1: Ja): JString; cdecl; overload;
//
//    { Property }
//  end;

//  TJb_185 = class(TJavaGenericImport<Jb_185Class, Jb_185>) end;

//  Jc_186Class = interface(JObjectClass)
//  ['{360E26E0-A712-4811-80E5-C24B211D15B7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/c')]
//  Jc_186 = interface(JObject)
//  ['{8DAE6041-16DF-4D3F-A599-43A12072EF4B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJc_186 = class(TJavaGenericImport<Jc_186Class, Jc_186>) end;

//  Jd_187Class = interface(JObjectClass)
//  ['{0A560441-06FA-4286-833E-CFF8AFD6FCB2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/d')]
//  Jd_187 = interface(JObject)
//  ['{0E722E05-AC8B-48F4-A2DD-ACBC63564540}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_187 = class(TJavaGenericImport<Jd_187Class, Jd_187>) end;

//  Je_a_188Class = interface(JObjectClass)
//  ['{B71A6197-A823-4D32-9419-150CA429C7E5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/e$a')]
//  Je_a_188 = interface(JObject)
//  ['{294B61B0-7DA1-4166-9F0D-6B3D2C7C5AEA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_a_188 = class(TJavaGenericImport<Je_a_188Class, Je_a_188>) end;

//  Je_b_189Class = interface(JObjectClass)
//  ['{B2710641-9458-4F67-90F6-DA89057CD927}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/e$b')]
//  Je_b_189 = interface(JObject)
//  ['{5F23796E-E686-4CB8-A017-E4C73F9878D5}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JLocation); cdecl;
//
//    { Property }
//  end;

//  TJe_b_189 = class(TJavaGenericImport<Je_b_189Class, Je_b_189>) end;

//  Je_190Class = interface(JObjectClass)
//  ['{BC355578-502C-49E4-B707-5DC73DC36CFE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_190; cdecl;
//    {class} function a: Je; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/e')]
//  Je_190 = interface(JObject)
//  ['{327F6476-9973-4C06-B888-A552D4C708E0}']
//    { Property Methods }
//    function _Geta: Je_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JLocation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JLocation);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JLocation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JLocation);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure b; cdecl; overload;
//    procedure c; cdecl;
//    procedure a(P1: JLocation); cdecl; overload;
//    function d: JLocation; cdecl;
//    function b(P1: JLocation): JString; cdecl; overload;
//    function a(P1: JLocation; P2: JLocation): Boolean; cdecl; overload;
//
//    { Property }
//    property a: Je_b read _Geta write _Seta;
//    property b: JLocation read _Getb write _Setb;
//    property c: JLocation read _Getc write _Setc;
//    property d: Int64 read _Getd write _Setd;
//    property e: Int64 read _Gete write _Sete;
//  end;

//  TJe_190 = class(TJavaGenericImport<Je_190Class, Je_190>) end;

//  Jf_191Class = interface(JTimerTaskClass) // or JObjectClass
//  ['{2B8C4559-AE2B-4A47-82B5-E2BD53915C51}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/f')]
//  Jf_191 = interface(JTimerTask) // or JObject
//  ['{5CE8B180-B8C3-4AD6-939F-8BA197A8444D}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJf_191 = class(TJavaGenericImport<Jf_191Class, Jf_191>) end;

//  Jg_a_192Class = interface(JGnssMeasurementsEvent_CallbackClass) // or JObjectClass
//  ['{415512C0-6E96-4EB5-B471-B00B425F29B1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/g$a')]
//  Jg_a_192 = interface(JGnssMeasurementsEvent_Callback) // or JObject
//  ['{F70C1DC7-5CEC-49D0-BAF4-E7218ED357D5}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onGnssMeasurementsReceived(P1: JGnssMeasurementsEvent); cdecl;
//    procedure onStatusChanged(P1: Integer); cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;

//  TJg_a_192 = class(TJavaGenericImport<Jg_a_192Class, Jg_a_192>) end;

//  Jg_bClass = interface(JGnssNavigationMessage_CallbackClass) // or JObjectClass
//  ['{0721C4E9-0399-4EE5-87C5-441B37B9AA3A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/g$b')]
//  Jg_b = interface(JGnssNavigationMessage_Callback) // or JObject
//  ['{E5041983-58E8-4B0B-8C7B-3A5A765E62B0}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onGnssNavigationMessageReceived(P1: JGnssNavigationMessage); cdecl;
//    procedure onStatusChanged(P1: Integer); cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;

//  TJg_b = class(TJavaGenericImport<Jg_bClass, Jg_b>) end;

//  Jg_cClass = interface(JGnssStatus_CallbackClass) // or JObjectClass
//  ['{B64358B2-0C6D-4079-8E85-CDCAD7A633E2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/g$c')]
//  Jg_c = interface(JGnssStatus_Callback) // or JObject
//  ['{EAE67BFB-CD60-4391-AA49-330E7238D820}']
//    { Property Methods }
//
//    { methods }
//    procedure onStarted; cdecl;
//    procedure onStopped; cdecl;
//    procedure onFirstFix(P1: Integer); cdecl;
//    procedure onSatelliteStatusChanged(P1: JGnssStatus); cdecl;
//
//    { Property }
//  end;

//  TJg_c = class(TJavaGenericImport<Jg_cClass, Jg_c>) end;

//  Jg_dClass = interface(JObjectClass)
//  ['{0ECF4F58-6CF1-40AF-BE2B-331DF03B7417}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/g$d')]
//  Jg_d = interface(JObject)
//  ['{1A0116E9-C19B-40A3-84A7-5463CCCC045F}']
//    { Property Methods }
//
//    { methods }
//    procedure onGpsStatusChanged(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJg_d = class(TJavaGenericImport<Jg_dClass, Jg_d>) end;

//  Jg_eClass = interface(JHandlerClass) // or JObjectClass
//  ['{4E1B4640-6398-425B-B751-CD7C62A7044E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/g$e')]
//  Jg_e = interface(JHandler) // or JObject
//  ['{DD7EC362-2D99-418A-A314-27B5C6BF11E1}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJg_e = class(TJavaGenericImport<Jg_eClass, Jg_e>) end;

//  Jg_fClass = interface(JObjectClass)
//  ['{DF164342-3128-4293-A3C9-14427C15F97E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/g$f')]
//  Jg_f = interface(JObject)
//  ['{D47534C6-FFF3-4C05-880C-23BB9A63394B}']
//    { Property Methods }
//
//    { methods }
//    procedure onLocationChanged(P1: JLocation); cdecl;
//    procedure onProviderDisabled(P1: JString); cdecl;
//    procedure onProviderEnabled(P1: JString); cdecl;
//    procedure onStatusChanged(P1: JString; P2: Integer; P3: JBundle); cdecl;
//
//    { Property }
//  end;

//  TJg_f = class(TJavaGenericImport<Jg_fClass, Jg_f>) end;

//  Jg_gClass = interface(JObjectClass)
//  ['{1104771F-D33C-4D0A-8DA1-F15EA2402907}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/g$g')]
//  Jg_g = interface(JObject)
//  ['{B3B8063A-5680-4381-A25E-A5865A58C566}']
//    { Property Methods }
//
//    { methods }
//    procedure onNmeaReceived(P1: Int64; P2: JString); cdecl;
//
//    { Property }
//  end;

//  TJg_g = class(TJavaGenericImport<Jg_gClass, Jg_g>) end;

//  Jg_hClass = interface(JObjectClass)
//  ['{A4CB6ED9-9141-4C34-8116-4EBB9C9DA0F7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/g$h')]
//  Jg_h = interface(JObject)
//  ['{430FDE74-0E15-4B81-A657-7BCAD341268A}']
//    { Property Methods }
//
//    { methods }
//    procedure onLocationChanged(P1: JLocation); cdecl;
//    procedure onProviderDisabled(P1: JString); cdecl;
//    procedure onProviderEnabled(P1: JString); cdecl;
//    procedure onStatusChanged(P1: JString; P2: Integer; P3: JBundle); cdecl;
//
//    { Property }
//  end;

//  TJg_h = class(TJavaGenericImport<Jg_hClass, Jg_h>) end;

//  Jg_200Class = interface(JObjectClass)
//  ['{4BA13584-5CAD-414C-AC1A-FB1F1B2CBBB8}']
//    { static Property Methods }
//    {class} function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: Jg; cdecl; overload;
//    {class} function a(P1: JLocation): JString; cdecl; overload;
//    {class} function a(P1: JLocation; P2: JLocation; P3: Boolean): Boolean; cdecl; overload;
//    {class} function b(P1: JLocation): JString; cdecl; overload;
//    {class} function c(P1: JLocation): JString; cdecl; overload;
//    {class} function k: JString; cdecl;
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: JString read _Getb;
//    {class} property c: JString read _Getc;
//  end;

//  [JavaSignature('com/baidu/location/c/g')]
//  Jg_200 = interface(JObject)
//  ['{9BD8E9E4-A9B9-4B00-ACDC-577915C1990A}']
//    { Property Methods }
//    function _Getd: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure b; cdecl; overload;
//    procedure c; cdecl; overload;
//    procedure d; cdecl;
//    procedure e; cdecl;
//    procedure a(P1: Boolean); cdecl; overload;
//    function f: JString; cdecl;
//    function g: JLocation; cdecl;
//    function h: JBDLocation; cdecl;
//    function i: Boolean; cdecl;
//    function j: Boolean; cdecl;
//    procedure a(P1: Integer); cdecl; overload;
//    function l: JString; cdecl;
//    procedure a(P1: JBDLocation); cdecl; overload;
//
//    { Property }
//    property d: Int64 read _Getd write _Setd;
//  end;

//  TJg_200 = class(TJavaGenericImport<Jg_200Class, Jg_200>) end;

//  Jh_201Class = interface(JObjectClass)
//  ['{0DD38710-1E40-448B-A072-62858793C916}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/h')]
//  Jh_201 = interface(JObject)
//  ['{49451DF7-33A4-4231-8954-BEE05CB99D4F}']
//    { Property Methods }
//
//    { methods }
//    procedure onNmeaMessage(P1: JString; P2: Int64); cdecl;
//
//    { Property }
//  end;

//  TJh_201 = class(TJavaGenericImport<Jh_201Class, Jh_201>) end;

//  Ji_202Class = interface(JObjectClass)
//  ['{64CA0DFB-E33A-47E3-AD83-F92274F9FE37}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji_202; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/i')]
//  Ji_202 = interface(JObject)
//  ['{574DDBC7-7087-409D-B11D-BCB95AD5434C}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Int64 read _Gete write _Sete;
//    property f: Integer read _Getf write _Setf;
//    property g: Integer read _Getg write _Setg;
//  end;

//  TJi_202 = class(TJavaGenericImport<Ji_202Class, Ji_202>) end;

//  Jj_203Class = interface(Ji_202Class) // or JObjectClass
//  ['{E28AA8E9-F941-4BB7-848A-1C46B2FB9C67}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_203; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/j')]
//  Jj_203 = interface(Ji_202) // or JObject
//  ['{00EB6431-39C1-4B97-B451-4B6CD96748BD}']
//    { Property Methods }
//    function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//    property h: Integer read _Geth write _Seth;
//    property i: Integer read _Geti write _Seti;
//    property j: Integer read _Getj write _Setj;
//    property k: Integer read _Getk write _Setk;
//    property l: Integer read _Getl write _Setl;
//    property m: Integer read _Getm write _Setm;
//    property n: Integer read _Getn write _Setn;
//    property o: Integer read _Geto write _Seto;
//    property p: Integer read _Getp write _Setp;
//    property q: Integer read _Getq write _Setq;
//    property r: Integer read _Getr write _Setr;
//  end;

//  TJj_203 = class(TJavaGenericImport<Jj_203Class, Jj_203>) end;

//  Jk_204Class = interface(Ji_202Class) // or JObjectClass
//  ['{52920007-43B6-4488-8257-B60119D54D9F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk_204; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/k')]
//  Jk_204 = interface(Ji_202) // or JObject
//  ['{5F1F00DC-B59B-4BBE-A0DC-09A26873A776}']
//    { Property Methods }
//    function _Geth: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//    property h: Int64 read _Geth write _Seth;
//    property i: Integer read _Geti write _Seti;
//    property j: Integer read _Getj write _Setj;
//    property k: Integer read _Getk write _Setk;
//    property l: Integer read _Getl write _Setl;
//    property m: Integer read _Getm write _Setm;
//    property n: Integer read _Getn write _Setn;
//    property o: Integer read _Geto write _Seto;
//    property p: Integer read _Getp write _Setp;
//    property q: Integer read _Getq write _Setq;
//  end;

//  TJk_204 = class(TJavaGenericImport<Jk_204Class, Jk_204>) end;

//  Jl_205Class = interface(JObjectClass)
//  ['{5C26EE26-F310-458D-B38B-6D622A80D0D2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JList; P2: Int64): Jl_205; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/l')]
//  Jl_205 = interface(JObject)
//  ['{F49CDEF9-3225-4725-8576-3B7C640FF2BC}']
//    { Property Methods }
//    function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    function b: JString; cdecl; overload;
//    function c: JString; cdecl; overload;
//    function d: JString; cdecl;
//    function e: Boolean; cdecl;
//    function a(P1: Int64): Boolean; cdecl; overload;
//    function f: Int64; cdecl;
//    function g: Int64; cdecl;
//    function a(P1: Integer): JString; cdecl; overload;
//    function a(P1: Integer; P2: Boolean; P3: Boolean): JString; cdecl; overload;
//    function b(P1: Integer): JString; cdecl; overload;
//    function a(P1: Jl): Boolean; cdecl; overload;
//    function b(P1: Jl): Boolean; cdecl; overload;
//    function c(P1: Jl): Boolean; cdecl; overload;
//    function h: Integer; cdecl;
//    function i: Boolean; cdecl;
//    function j: Boolean; cdecl;
//    function k: Boolean; cdecl;
//    function l: Boolean; cdecl;
//
//    { Property }
//    property a: JList read _Geta write _Seta;
//  end;

//  TJl_205 = class(TJavaGenericImport<Jl_205Class, Jl_205>) end;

//  Jm_1Class = interface(JObjectClass)
//  ['{B2C95BC4-84B9-4F02-A461-2DC575B9A3FC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/m$1')]
//  Jm_1 = interface(JObject)
//  ['{40C5867E-F78A-4AEA-9948-D5FB238B9898}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm_1 = class(TJavaGenericImport<Jm_1Class, Jm_1>) end;

//  Jm_a_207Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{E1C898C6-49F0-48E4-A6F1-3A6AD33AC6BB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/m$a')]
//  Jm_a_207 = interface(JBroadcastReceiver) // or JObject
//  ['{3F1AF43D-FCA3-4F5D-AE1A-F4FB97A37C5D}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJm_a_207 = class(TJavaGenericImport<Jm_a_207Class, Jm_a_207>) end;

//  Jm_208Class = interface(JObjectClass)
//  ['{105101F8-7381-47D5-94BA-35C6E8E0C718}']
//    { static Property Methods }
//    {class} function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: Jm; cdecl; overload;
//    {class} function a(P1: Jl; P2: Jl): Boolean; cdecl; overload;
//    {class} function a(P1: Jl; P2: Jl; P3: Single): Boolean; cdecl; overload;
//
//    { static Property }
//    {class} property a: Int64 read _Geta;
//  end;

//  [JavaSignature('com/baidu/location/c/m')]
//  Jm_208 = interface(JObject)
//  ['{9D6BADD7-AF8A-45DB-9991-2A9365F48980}']
//    { Property Methods }
//
//    { methods }
//    procedure b; cdecl;
//    procedure c; cdecl;
//    procedure d; cdecl;
//    function e: Boolean; cdecl;
//    function f: Boolean; cdecl;
//    function g: Boolean; cdecl;
//    function h: JString; cdecl;
//    function i: Boolean; cdecl;
//    function j: Boolean; cdecl;
//    function k: Boolean; cdecl;
//    function l: JWifiInfo; cdecl;
//    function m: JString; cdecl;
//    function n: JString; cdecl;
//    function o: Jl; cdecl;
//    function p: Jl; cdecl;
//    function q: Jl; cdecl;
//    function a(P1: JWifiManager; P2: Int64): Jl; cdecl; overload;
//
//    { Property }
//  end;

//  TJm_208 = class(TJavaGenericImport<Jm_208Class, Jm_208>) end;

//  Jn_209Class = interface(JObjectClass)
//  ['{A7219981-6788-4520-ADCA-56A4F14C54AD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c/n')]
//  Jn_209 = interface(JObject)
//  ['{8365A150-1CBF-4BD8-B518-60E22269574F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJn_209 = class(TJavaGenericImport<Jn_209Class, Jn_209>) end;

//  Jc_210Class = interface(JThreadClass) // or JObjectClass
//  ['{EB913446-41F4-4671-AF61-9EE61CBE591C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/c')]
//  Jc_210 = interface(JThread) // or JObject
//  ['{CDC46A96-E6E0-465B-9AB6-35D3D9337DE9}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJc_210 = class(TJavaGenericImport<Jc_210Class, Jc_210>) end;

//  Ja_a_211Class = interface(JHandlerClass) // or JObjectClass
//  ['{6EECD1C1-6779-42F3-B2DC-D921C2EF721F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JLooper; P2: Ja): Ja_a_211; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/d/a$a')]
//  Ja_a_211 = interface(JHandler) // or JObject
//  ['{CD7D9371-DC5B-4222-8413-EBD53A0EE208}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJa_a_211 = class(TJavaGenericImport<Ja_a_211Class, Ja_a_211>) end;

//  Ja_212Class = interface(JServiceClass) // or JObjectClass
//  ['{03A44D27-CDAF-43F6-AE8C-623AC299FC8A}']
//    { static Property Methods }
//    {class} function _Getc: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Ja_212; cdecl;
//
//    { static Property }
//    {class} property c: Int64 read _Getc;
//  end;

//  [JavaSignature('com/baidu/location/d/a')]
//  Ja_212 = interface(JService) // or JObject
//  ['{F38115AB-F35D-4B3A-B796-C2596B007FAA}']
//    { Property Methods }
//
//    { methods }
//    procedure onCreate(P1: JContext); cdecl;
//    procedure onTaskRemoved(P1: JIntent); cdecl;
//    function onBind(P1: JIntent): JIBinder; cdecl;
//    procedure onDestroy; cdecl;
//    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
//    function onUnBind(P1: JIntent): Boolean; cdecl;
//    function getVersion: Double; cdecl;
//
//    { Property }
//  end;

//  TJa_212 = class(TJavaGenericImport<Ja_212Class, Ja_212>) end;

//  Jb_213Class = interface(JObjectClass)
//  ['{2364B32D-B105-4C6E-8FBC-415EB20760CF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/d/b')]
//  Jb_213 = interface(JObject)
//  ['{548632C9-F3F4-4606-9C28-7591B4638105}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJb_213 = class(TJavaGenericImport<Jb_213Class, Jb_213>) end;

//  Jd_214Class = interface(JObjectClass)
//  ['{018FCD96-1461-46F4-80B5-0713AEF312F2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/d')]
//  Jd_214 = interface(JObject)
//  ['{9EDC021E-19A1-4C53-805F-CCD24F9D7D94}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JPoi; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JPoi>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJd_214 = class(TJavaGenericImport<Jd_214Class, Jd_214>) end;

//  Ja_215Class = interface(JObjectClass)
//  ['{43FCB5A5-ED21-41BD-A1D5-80CB70665021}']
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
//  end;

//  [JavaSignature('com/baidu/location/e/a')]
//  Ja_215 = interface(JObject)
//  ['{B0B885B6-5435-44C5-A36B-ADE2173F20DD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_215 = class(TJavaGenericImport<Ja_215Class, Ja_215>) end;

//  Jb_1_216Class = interface(JObjectClass)
//  ['{0552AF12-7625-444C-BA12-F38F48D35ABB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e/b$1')]
//  Jb_1_216 = interface(JObject)
//  ['{CE17A466-A964-4367-A3B3-3FBF81A9B240}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_1_216 = class(TJavaGenericImport<Jb_1_216Class, Jb_1_216>) end;

//  Jb_a_217Class = interface(JObjectClass)
//  ['{676719FB-7E67-4B2D-A372-46C7840EBFFA}']
//    { static Property Methods }
//    {class} function _Geta: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: Jb read _Geta;
//  end;

//  [JavaSignature('com/baidu/location/e/b$a')]
//  Jb_a_217 = interface(JObject)
//  ['{811CFBE6-8BCB-4B47-BD4A-14EC391AF124}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_a_217 = class(TJavaGenericImport<Jb_a_217Class, Jb_a_217>) end;

//  Jb_218Class = interface(JObjectClass)
//  ['{0B04D7DE-9C7F-4D92-B165-89C7C8A87EE6}']
//    { static Property Methods }
//    {class} function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: Jb; cdecl; overload;
//
//    { static Property }
//    {class} property e: JString read _Gete;
//    {class} property f: JString read _Getf;
//    {class} property g: JString read _Getg;
//    {class} property h: JString read _Geth;
//    {class} property i: JString read _Geti;
//    {class} property j: Integer read _Getj;
//    {class} property k: Integer read _Getk;
//    {class} property l: Int64 read _Getl;
//  end;

//  [JavaSignature('com/baidu/location/e/b')]
//  Jb_218 = interface(JObject)
//  ['{C7841FD5-82E6-4C3C-86C1-8CDA9A340BCC}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JContext); cdecl; overload;
//    procedure a(P1: JString; P2: JString); cdecl; overload;
//    function b: JString; cdecl;
//    function a(P1: Boolean): JString; cdecl; overload;
//    function a(P1: Boolean; P2: JString): JString; cdecl; overload;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//  end;

//  TJb_218 = class(TJavaGenericImport<Jb_218Class, Jb_218>) end;

//  Jc_219Class = interface(JObjectClass)
//  ['{CDD6984F-022A-4B91-AF34-9C497357C4D5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JArrayList): Integer; cdecl;
//    {class} function b(P1: JArrayList): Integer; cdecl;
//    {class} function c(P1: JArrayList): Integer; cdecl;
//    {class} function d(P1: JArrayList): Integer; cdecl;
//    {class} function e(P1: JArrayList): Integer; cdecl;
//    {class} function f(P1: JArrayList): Integer; cdecl;
//    {class} function g(P1: JArrayList): Integer; cdecl;
//    {class} function h(P1: JArrayList): Integer; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e/c')]
//  Jc_219 = interface(JObject)
//  ['{D1CB60E1-9833-4B27-AB53-63FEBD3EBBAF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_219 = class(TJavaGenericImport<Jc_219Class, Jc_219>) end;

//  Jd_220Class = interface(JObjectClass)
//  ['{DC0EA88B-B0CD-4E7F-BDA6-FA3F26C14860}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: JString read _Geta;
//    {class} property b: JString read _Getb;
//    {class} property c: JString read _Getc;
//    {class} property d: JString read _Getd;
//    {class} property e: JString read _Gete;
//    {class} property f: JString read _Getf;
//    {class} property g: JString read _Getg;
//    {class} property h: JString read _Geth;
//  end;

//  [JavaSignature('com/baidu/location/e/d')]
//  Jd_220 = interface(JObject)
//  ['{E3D1B278-E7F5-4A3D-A96D-D4413C5E8826}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_220 = class(TJavaGenericImport<Jd_220Class, Jd_220>) end;

//  Je_a_221Class = interface(JObjectClass)
//  ['{9C6B9A08-FD5C-4C19-BBFE-E754191FFC2F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e/e$a')]
//  Je_a_221 = interface(JObject)
//  ['{59A093F6-8C52-4255-A999-9093E93D2DEB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_a_221 = class(TJavaGenericImport<Je_a_221Class, Je_a_221>) end;

//  Je_b_222Class = interface(JObjectClass)
//  ['{030815AE-ED4D-426F-999B-36333501BFFA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e/e$b')]
//  Je_b_222 = interface(JObject)
//  ['{2902A75B-A169-4A80-B0D4-72BEE10FB81F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_b_222 = class(TJavaGenericImport<Je_b_222Class, Je_b_222>) end;

//  Je_223Class = interface(JObjectClass)
//  ['{C00FAFA9-4182-4747-B9FD-604B9B89F52D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Je; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e/e')]
//  Je_223 = interface(JObject)
//  ['{EDB81115-B4B1-4D07-975B-7B42B8D572B6}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Double; P2: Double): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJe_223 = class(TJavaGenericImport<Je_223Class, Je_223>) end;

//  Jf_aClass = interface(JObjectClass)
//  ['{D4856E8B-60E7-4691-BE2A-7DD0D070AF58}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JURL): Jf_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e/f$a')]
//  Jf_a = interface(JObject)
//  ['{ADF60D72-4C4D-46FD-8588-DA8E67563694}']
//    { Property Methods }
//
//    { methods }
//    function verify(P1: JString; P2: JSSLSession): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJf_a = class(TJavaGenericImport<Jf_aClass, Jf_a>) end;

//  Jf_225Class = interface(JObjectClass)
//  ['{81E31FFD-7DAF-4378-A1D7-1164A1230F69}']
//    { static Property Methods }
//    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jf_225; cdecl;
//
//    { static Property }
//    {class} property f: Integer read _Getf;
//  end;

//  [JavaSignature('com/baidu/location/e/f')]
//  Jf_225 = interface(JObject)
//  ['{BB301EC3-6236-451F-ACAC-538A899E951A}']
//    { Property Methods }
//    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JExecutorService; P2: Boolean; P3: JString); cdecl; overload;
//    procedure b(P1: JString); cdecl;
//    procedure a(P1: JExecutorService; P2: JString); cdecl; overload;
//
//    { Property }
//    property g: JString read _Getg write _Setg;
//    property h: Integer read _Geth write _Seth;
//    property i: JString read _Geti write _Seti;
//    property j: JMap read _Getj write _Setj;
//    property k: JString read _Getk write _Setk;
//    property l: TJavaArray<Byte> read _Getl write _Setl;
//    property m: TJavaArray<Byte> read _Getm write _Setm;
//    property n: JString read _Getn write _Setn;
//    property o: Boolean read _Geto write _Seto;
//  end;

//  TJf_225 = class(TJavaGenericImport<Jf_225Class, Jf_225>) end;

//  Jg_226Class = interface(JObjectClass)
//  ['{4BA34533-ECFB-4915-8145-933325B4BD08}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e/g')]
//  Jg_226 = interface(JObject)
//  ['{72855847-06BC-4312-976C-C9DC70AA3835}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg_226 = class(TJavaGenericImport<Jg_226Class, Jg_226>) end;

//  Jh_227Class = interface(JThreadClass) // or JObjectClass
//  ['{3E583B05-E9B8-47D0-B919-C6250AEF4846}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e/h')]
//  Jh_227 = interface(JThread) // or JObject
//  ['{3478621D-9C82-4F70-8FDE-04904BAD489B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJh_227 = class(TJavaGenericImport<Jh_227Class, Jh_227>) end;

//  Ji_228Class = interface(JObjectClass)
//  ['{53655806-CB35-49A5-917A-855821B34103}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e/i')]
//  Ji_228 = interface(JObject)
//  ['{3EFE14E7-B1C4-49EE-8846-39ECF4A890CD}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJi_228 = class(TJavaGenericImport<Ji_228Class, Ji_228>) end;

//  Jj_229Class = interface(JObjectClass)
//  ['{0C53B105-A6AD-45A5-9835-468DDEA405A5}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: JString read _Geta;
//  end;

//  [JavaSignature('com/baidu/location/e/j')]
//  Jj_229 = interface(JObject)
//  ['{BB18A399-36FD-47BB-A6CF-A054FA7F05D4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj_229 = class(TJavaGenericImport<Jj_229Class, Jj_229>) end;

//  Jk_230Class = interface(JObjectClass)
//  ['{55EC66AA-82E4-48A2-A8AD-9C334E878A99}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getq: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gets: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gett: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getv: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getw: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gety: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getz: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetA: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetB: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetG: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetI: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetJ: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetK: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetL: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetM: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetP: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetQ: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetR: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetS: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetT: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetU: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetV: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetZ: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getaa: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getab: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getac: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getad: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getae: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getaf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getag: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getah: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getai: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getaj: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getak: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getal: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getam: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getan: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getao: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getap: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getaq: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getar: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getas: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getat: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getau: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getav: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getaw: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getax: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getay: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getaz: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaA: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaG: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaH: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaI: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaJ: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaN: TJavaArray<Double>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaQ: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetaR: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: Single; P2: Single): Boolean; cdecl; overload;
//    {class} function a(P1: Double; P2: Double): Boolean; cdecl; overload;
//    {class} function a(P1: JString; P2: JString; P3: JString): Integer; cdecl; overload;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a: JString; cdecl; overload;
//    {class} function b: Boolean; cdecl; overload;
//    {class} function a(P1: Ja; P2: Jl; P3: JLocation; P4: JString; P5: Integer): JString; cdecl; overload;
//    {class} function a(P1: Ja; P2: Jl; P3: JLocation; P4: JString; P5: Integer; P6: Boolean): JString; cdecl; overload;
//    {class} function a(P1: JObject; P2: JString): Integer; cdecl; overload;
//    {class} function a(P1: JLocation): Boolean; cdecl; overload;
//    {class} function b(P1: JString): Boolean; cdecl; overload;
//    {class} function c: JString; cdecl; overload;
//    {class} function a(P1: JBDLocation): Boolean; cdecl; overload;
//    {class} function d: JString; cdecl; overload;
//    {class} function e: JString; cdecl; overload;
//    {class} function f: JString; cdecl; overload;
//    {class} function g: JString; cdecl; overload;
//    {class} function h: JString; cdecl;
//    {class} function i: JString; cdecl;
//    {class} function a(P1: JContext): Integer; cdecl; overload;
//    {class} function b(P1: JContext): Integer; cdecl; overload;
//    {class} function c(P1: JContext): Boolean; cdecl; overload;
//    {class} function d(P1: JContext): JString; cdecl; overload;
//    {class} function a(P1: JContext; P2: JString): Integer; cdecl; overload;
//    {class} function e(P1: JContext): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Boolean): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: JString; P3: Boolean): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    {class} function b(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    {class} function b(P1: JContext; P2: JString): Boolean; cdecl; overload;
//    {class} function c(P1: JString): JString; cdecl; overload;
//    {class} function j: JString; cdecl;
//    {class} function a(P1: Double; P2: Double; P3: Double; P4: Double): Double; cdecl; overload;
//    {class} function f(P1: JContext): JString; cdecl; overload;
//    {class} function d(P1: JString): Int64; cdecl; overload;
//    {class} function k: JSSLSocketFactory; cdecl;
//    {class} function g(P1: JContext): Integer; cdecl; overload;
//    {class} function l: Boolean; cdecl;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: Boolean read _Getb;
//    {class} property c: Boolean read _Getc;
//    {class} property d: Integer read _Getd;
//    {class} property e: JString read _Gete;
//    {class} property f: Integer read _Getf;
//    {class} property g: Boolean read _Getg;
//    {class} property h: Boolean read _Geth;
//    {class} property i: Boolean read _Geti;
//    {class} property j: Boolean read _Getj;
//    {class} property k: Boolean read _Getk;
//    {class} property l: Boolean read _Getl;
//    {class} property m: JString read _Getm;
//    {class} property n: JString read _Getn;
//    {class} property o: Boolean read _Geto;
//    {class} property p: Integer read _Getp;
//    {class} property q: Double read _Getq;
//    {class} property r: Double read _Getr;
//    {class} property s: Double read _Gets;
//    {class} property t: Double read _Gett;
//    {class} property u: Integer read _Getu;
//    {class} property v: TJavaArray<Byte> read _Getv;
//    {class} property w: Boolean read _Getw;
//    {class} property x: Integer read _Getx;
//    {class} property y: Single read _Gety;
//    {class} property z: Single read _Getz;
//    {class} property A: Single read _GetA;
//    {class} property B: Single read _GetB;
//    {class} property C: Integer read _GetC;
//    {class} property D: Integer read _GetD;
//    {class} property E: Integer read _GetE;
//    {class} property F: Integer read _GetF;
//    {class} property G: Integer read _GetG;
//    {class} property H: Integer read _GetH;
//    {class} property I: Integer read _GetI;
//    {class} property J: Single read _GetJ;
//    {class} property K: Single read _GetK;
//    {class} property L: Single read _GetL;
//    {class} property M: Single read _GetM;
//    {class} property N: Integer read _GetN;
//    {class} property O: Integer read _GetO;
//    {class} property P: Single read _GetP;
//    {class} property Q: Integer read _GetQ;
//    {class} property R: Single read _GetR;
//    {class} property S: Single read _GetS;
//    {class} property T: Single read _GetT;
//    {class} property U: Integer read _GetU;
//    {class} property V: Integer read _GetV;
//    {class} property W: Integer read _GetW;
//    {class} property X: Integer read _GetX;
//    {class} property Y: Integer read _GetY;
//    {class} property Z: Integer read _GetZ;
//    {class} property aa: Boolean read _Getaa;
//    {class} property ab: Boolean read _Getab;
//    {class} property ac: Integer read _Getac;
//    {class} property ad: Integer read _Getad;
//    {class} property ae: Integer read _Getae;
//    {class} property af: Integer read _Getaf;
//    {class} property ag: Int64 read _Getag;
//    {class} property ah: Int64 read _Getah;
//    {class} property ai: Int64 read _Getai;
//    {class} property aj: Int64 read _Getaj;
//    {class} property ak: Int64 read _Getak;
//    {class} property al: Int64 read _Getal;
//    {class} property am: Integer read _Getam;
//    {class} property an: Integer read _Getan;
//    {class} property ao: Integer read _Getao;
//    {class} property ap: Integer read _Getap;
//    {class} property aq: Single read _Getaq;
//    {class} property ar: Single read _Getar;
//    {class} property &as: Single read _Getas;
//    {class} property at: Integer read _Getat;
//    {class} property au: Integer read _Getau;
//    {class} property av: Integer read _Getav;
//    {class} property aw: JString read _Getaw;
//    {class} property ax: Boolean read _Getax;
//    {class} property ay: Integer read _Getay;
//    {class} property az: Single read _Getaz;
//    {class} property aA: Double read _GetaA;
//    {class} property aB: Integer read _GetaB;
//    {class} property aC: Integer read _GetaC;
//    {class} property aD: Integer read _GetaD;
//    {class} property aE: Integer read _GetaE;
//    {class} property aF: Integer read _GetaF;
//    {class} property aG: Single read _GetaG;
//    {class} property aH: Single read _GetaH;
//    {class} property aI: Boolean read _GetaI;
//    {class} property aJ: Integer read _GetaJ;
//    {class} property aK: Integer read _GetaK;
//    {class} property aL: Integer read _GetaL;
//    {class} property aM: Integer read _GetaM;
//    {class} property aN: TJavaArray<Double> read _GetaN;
//    {class} property aO: Integer read _GetaO;
//    {class} property aP: Integer read _GetaP;
//    {class} property aQ: Integer read _GetaQ;
//    {class} property aR: Boolean read _GetaR;
//  end;

//  [JavaSignature('com/baidu/location/e/k')]
//  Jk_230 = interface(JObject)
//  ['{FED9D9BA-03B1-4977-BEFD-B3E53DA1714F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk_230 = class(TJavaGenericImport<Jk_230Class, Jk_230>) end;

//  Jl_231Class = interface(JObjectClass)
//  ['{AE71A6E8-265E-49EA-8294-020CD05C9A26}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e/l')]
//  Jl_231 = interface(JObject)
//  ['{4B14ECF1-44B2-4FE4-8F35-CAF844B7B459}']
//    { Property Methods }
//
//    { methods }
//    function getAcceptedIssuers: TJavaObjectArray<JX509Certificate>; cdecl;
//    procedure checkClientTrusted(P1: TJavaObjectArray<JX509Certificate>; P2: JString); cdecl;
//    procedure checkServerTrusted(P1: TJavaObjectArray<JX509Certificate>; P2: JString); cdecl;
//
//    { Property }
//  end;

//  TJl_231 = class(TJavaGenericImport<Jl_231Class, Jl_231>) end;

//  Je_232Class = interface(JObjectClass)
//  ['{7CCD6F1E-5DF6-443B-9180-42DEA28B1801}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/e')]
//  Je_232 = interface(JObject)
//  ['{DD1EAE5D-51BE-4266-AA05-75A7EE3869A2}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JPoiRegion; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JPoiRegion>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJe_232 = class(TJavaGenericImport<Je_232Class, Je_232>) end;

//  Jf_233Class = interface(JServiceClass) // or JObjectClass
//  ['{B6BD5066-2F9B-4685-9F46-9874E3201891}']
//    { static Property Methods }
//    {class} function _GetreplaceFileName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetmC: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetisServing: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetisStartedServing: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jf_233; cdecl;
//    {class} function getFrameVersion: Single; cdecl;
//    {class} function getJarFileName: JString; cdecl;
//    {class} function getServiceContext: JContext; cdecl;
//    {class} procedure setServiceContext(P1: JContext); cdecl;
//
//    { static Property }
//    {class} property replaceFileName: JString read _GetreplaceFileName;
//    {class} property mC: JContext read _GetmC;
//    {class} property isServing: Boolean read _GetisServing;
//    {class} property isStartedServing: Boolean read _GetisStartedServing;
//  end;

//  [JavaSignature('com/baidu/location/f')]
//  Jf_233 = interface(JService) // or JObject
//  ['{FECA421E-4F57-4BF7-A55C-7E063D91FA46}']
//    { Property Methods }
//
//    { methods }
//    procedure onCreate; cdecl;
//    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
//    function onBind(P1: JIntent): JIBinder; cdecl;
//    function onUnbind(P1: JIntent): Boolean; cdecl;
//    procedure onDestroy; cdecl;
//    procedure onTaskRemoved(P1: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJf_233 = class(TJavaGenericImport<Jf_233Class, Jf_233>) end;

  JJniClass = interface(JObjectClass)
  ['{BFA26EB5-666B-4911-A860-8A2D48273756}']
    { static Property Methods }

    { static Methods }
    {class} function init: JJni; cdecl;
    {class} function encode(P1: JString): JString; cdecl;
    {class} function en1(P1: JString): JString; cdecl;
    {class} function encode2(P1: JString): JString; cdecl;
    {class} function encode3(P1: JString): JLong; cdecl;
    {class} function encodeOfflineLocationUpdateRequest(P1: JString): JString; cdecl;
    {class} function encodeTp4(P1: JString): JString; cdecl;
    {class} function encodeTp4NoTag(P1: JString): JString; cdecl;
    {class} function getGpsSwiftRadius(P1: Single; P2: Double; P3: Double): Double; cdecl;
    {class} function getldkaiv: JString; cdecl;
    {class} function coorEncrypt(P1: Double; P2: Double; P3: JString): TJavaArray<Double>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/baidu/location/Jni')]
  JJni = interface(JObject)
  ['{2D6D8E8D-CA32-4D8F-8C88-C5F9049A5B0F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJJni = class(TJavaGenericImport<JJniClass, JJni>) end;

  JLLSInterfaceClass = interface(JObjectClass)
  ['{F875D218-1318-4510-9819-F58610E09246}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/location/LLSInterface')]
  JLLSInterface = interface(IJavaInstance)
  ['{0AE46AC2-7D62-4FAC-A04F-3C31D905F1CE}']
    { Property Methods }

    { methods }
    procedure onCreate(P1: JContext); cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;
    function onUnBind(P1: JIntent): Boolean; cdecl;
    procedure onDestroy; cdecl;
    procedure onTaskRemoved(P1: JIntent); cdecl;
    function getVersion: Double; cdecl;

    { Property }
  end;

  TJLLSInterface = class(TJavaGenericImport<JLLSInterfaceClass, JLLSInterface>) end;

//  JLocationClient_aClass = interface(JHandlerClass) // or JObjectClass
//  ['{1649F504-D19E-4667-9557-B06C1181B4F7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/LocationClient$a')]
//  JLocationClient_a = interface(JHandler) // or JObject
//  ['{FB8DC129-EA5C-47B8-BA67-D378ED7B2A6E}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJLocationClient_a = class(TJavaGenericImport<JLocationClient_aClass, JLocationClient_a>) end;

//  JLocationClient_bClass = interface(JObjectClass)
//  ['{D6B6B807-1BB4-4D49-B24B-4441FCCC84D1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/LocationClient$b')]
//  JLocationClient_b = interface(JObject)
//  ['{24EDB268-E032-43CE-817D-D574965640F4}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJLocationClient_b = class(TJavaGenericImport<JLocationClient_bClass, JLocationClient_b>) end;

//  JLocationClient_cClass = interface(JThreadClass) // or JObjectClass
//  ['{B6FC693E-F07F-4CF7-B3A3-25ACC82C5E28}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/LocationClient$c')]
//  JLocationClient_c = interface(JThread) // or JObject
//  ['{B2940FFD-8553-44E9-9667-0E4355E05CF7}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJLocationClient_c = class(TJavaGenericImport<JLocationClient_cClass, JLocationClient_c>) end;

  JLocationClientClass = interface(JObjectClass)
  ['{F418F9FE-040E-4BEB-ACD6-955365744F05}']
    { static Property Methods }
    {class} function _GetCONNECT_HOT_SPOT_TRUE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONNECT_HOT_SPOT_FALSE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONNECT_HOT_SPOT_UNKNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_BETTER_OPEN_GPS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_BETTER_OPEN_WIFI: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_NEED_CHECK_NET: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_NEED_CHECK_LOC_PERMISSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_NEED_OPEN_PHONE_LOC_SWITCH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_NEED_INSERT_SIMCARD_OR_OPEN_WIFI: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_NEED_CLOSE_FLYMODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_SERVER_FAIL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_FAIL_UNKNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_BETTER_OPEN_FINE_PERMISSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_DIAGNOSTIC_TYPE_COARSE_FAIL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JContext): JLocationClient; cdecl; overload;
    {class} function init(P1: JContext; P2: JLocationClientOption): JLocationClient; cdecl; overload;
    {class} procedure setKey(P1: JString); cdecl;
    {class} procedure setAgreePrivacy(P1: Boolean); cdecl;
    {class} function getBDLocationInCoorType(P1: JBDLocation; P2: JString): JBDLocation; cdecl;

    { static Property }
    {class} property CONNECT_HOT_SPOT_TRUE: Integer read _GetCONNECT_HOT_SPOT_TRUE;
    {class} property CONNECT_HOT_SPOT_FALSE: Integer read _GetCONNECT_HOT_SPOT_FALSE;
    {class} property CONNECT_HOT_SPOT_UNKNOWN: Integer read _GetCONNECT_HOT_SPOT_UNKNOWN;
    {class} property LOC_DIAGNOSTIC_TYPE_BETTER_OPEN_GPS: Integer read _GetLOC_DIAGNOSTIC_TYPE_BETTER_OPEN_GPS;
    {class} property LOC_DIAGNOSTIC_TYPE_BETTER_OPEN_WIFI: Integer read _GetLOC_DIAGNOSTIC_TYPE_BETTER_OPEN_WIFI;
    {class} property LOC_DIAGNOSTIC_TYPE_NEED_CHECK_NET: Integer read _GetLOC_DIAGNOSTIC_TYPE_NEED_CHECK_NET;
    {class} property LOC_DIAGNOSTIC_TYPE_NEED_CHECK_LOC_PERMISSION: Integer read _GetLOC_DIAGNOSTIC_TYPE_NEED_CHECK_LOC_PERMISSION;
    {class} property LOC_DIAGNOSTIC_TYPE_NEED_OPEN_PHONE_LOC_SWITCH: Integer read _GetLOC_DIAGNOSTIC_TYPE_NEED_OPEN_PHONE_LOC_SWITCH;
    {class} property LOC_DIAGNOSTIC_TYPE_NEED_INSERT_SIMCARD_OR_OPEN_WIFI: Integer read _GetLOC_DIAGNOSTIC_TYPE_NEED_INSERT_SIMCARD_OR_OPEN_WIFI;
    {class} property LOC_DIAGNOSTIC_TYPE_NEED_CLOSE_FLYMODE: Integer read _GetLOC_DIAGNOSTIC_TYPE_NEED_CLOSE_FLYMODE;
    {class} property LOC_DIAGNOSTIC_TYPE_SERVER_FAIL: Integer read _GetLOC_DIAGNOSTIC_TYPE_SERVER_FAIL;
    {class} property LOC_DIAGNOSTIC_TYPE_FAIL_UNKNOWN: Integer read _GetLOC_DIAGNOSTIC_TYPE_FAIL_UNKNOWN;
    {class} property LOC_DIAGNOSTIC_TYPE_BETTER_OPEN_FINE_PERMISSION: Integer read _GetLOC_DIAGNOSTIC_TYPE_BETTER_OPEN_FINE_PERMISSION;
    {class} property LOC_DIAGNOSTIC_TYPE_COARSE_FAIL: Integer read _GetLOC_DIAGNOSTIC_TYPE_COARSE_FAIL;
  end;

  [JavaSignature('com/baidu/location/LocationClient')]
  JLocationClient = interface(JObject)
  ['{0002D2BD-34E2-4492-9065-C19C7F7CF549}']
    { Property Methods }

    { methods }
    function getLocOption: JLocationClientOption; cdecl;
    procedure setLocOption(P1: JLocationClientOption); cdecl;
    function updateLocation(P1: JLocation): Boolean; cdecl;
    function requestLocation: Integer; cdecl;
    function isStarted: Boolean; cdecl;
    function getLastKnownLocation: JBDLocation; cdecl;
    function getVersion: JString; cdecl;
    procedure restart; cdecl;
    procedure enableLocInForeground(P1: Integer; P2: JNotification); cdecl;
    procedure disableLocInForeground(P1: Boolean); cdecl;
//    procedure enableAssistantLocation(P1: JWebView); cdecl;
    procedure disableAssistantLocation; cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
    procedure registerLocationListener(P1: JBDLocationListener); cdecl; overload; //Deprecated
    procedure unRegisterLocationListener(P1: JBDLocationListener); cdecl; overload; //Deprecated
    procedure registerLocationListener(P1: JBDAbstractLocationListener); cdecl; overload;
    procedure unRegisterLocationListener(P1: JBDAbstractLocationListener); cdecl; overload;
    function requestHotSpotState: Boolean; cdecl;
    function getAccessKey: JString; cdecl;
    procedure onReceiveLocation(P1: JBDLocation); cdecl;
    procedure onReceiveLightLocString(P1: JString); cdecl;

    { Property }
  end;

  TJLocationClient = class(TJavaGenericImport<JLocationClientClass, JLocationClient>) end;

//  JLocationClientOption_1Class = interface(JObjectClass)
//  ['{80DB3F5E-F9FE-4E2C-BCDB-F6A38DA11CF3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/baidu/location/LocationClientOption$1')]
//  JLocationClientOption_1 = interface(JObject)
//  ['{BD3BC162-2E17-42E2-B1CB-25D0BE5783A8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJLocationClientOption_1 = class(TJavaGenericImport<JLocationClientOption_1Class, JLocationClientOption_1>) end;

  JLocationClientOption_BDLocationPurposeClass = interface(JEnumClass) // or JObjectClass
  ['{8655C4B3-E584-4BAE-89B5-6441EA90459E}']
    { static Property Methods }
    {class} function _GetSignIn: JLocationClientOption_BDLocationPurpose;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSport: JLocationClientOption_BDLocationPurpose;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTransport: JLocationClientOption_BDLocationPurpose;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JLocationClientOption_BDLocationPurpose>; cdecl;
    {class} function valueOf(P1: JString): JLocationClientOption_BDLocationPurpose; cdecl;

    { static Property }
    {class} property SignIn: JLocationClientOption_BDLocationPurpose read _GetSignIn;
    {class} property Sport: JLocationClientOption_BDLocationPurpose read _GetSport;
    {class} property Transport: JLocationClientOption_BDLocationPurpose read _GetTransport;
  end;

  [JavaSignature('com/baidu/location/LocationClientOption$BDLocationPurpose')]
  JLocationClientOption_BDLocationPurpose = interface(JEnum) // or JObject
  ['{0BB28B9C-C7E0-41F6-ACE1-024043D2941D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLocationClientOption_BDLocationPurpose = class(TJavaGenericImport<JLocationClientOption_BDLocationPurposeClass, JLocationClientOption_BDLocationPurpose>) end;

  JLocationClientOption_FirstLocTypeClass = interface(JEnumClass) // or JObjectClass
  ['{58DF07AC-1310-453C-9189-8E573E8FF631}']
    { static Property Methods }
    {class} function _GetSPEED_IN_FIRST_LOC: JLocationClientOption_FirstLocType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACCURACY_IN_FIRST_LOC: JLocationClientOption_FirstLocType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JLocationClientOption_FirstLocType>; cdecl;
    {class} function valueOf(P1: JString): JLocationClientOption_FirstLocType; cdecl;

    { static Property }
    {class} property SPEED_IN_FIRST_LOC: JLocationClientOption_FirstLocType read _GetSPEED_IN_FIRST_LOC;
    {class} property ACCURACY_IN_FIRST_LOC: JLocationClientOption_FirstLocType read _GetACCURACY_IN_FIRST_LOC;
  end;

  [JavaSignature('com/baidu/location/LocationClientOption$FirstLocType')]
  JLocationClientOption_FirstLocType = interface(JEnum) // or JObject
  ['{203064CF-A02F-4F45-A828-B91991D74B59}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLocationClientOption_FirstLocType = class(TJavaGenericImport<JLocationClientOption_FirstLocTypeClass, JLocationClientOption_FirstLocType>) end;

  JLocationClientOption_LocationModeClass = interface(JEnumClass) // or JObjectClass
  ['{22851DCA-38D2-48B4-A480-3910215D6540}']
    { static Property Methods }
    {class} function _GetHight_Accuracy: JLocationClientOption_LocationMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBattery_Saving: JLocationClientOption_LocationMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDevice_Sensors: JLocationClientOption_LocationMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFuzzy_Locating: JLocationClientOption_LocationMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JLocationClientOption_LocationMode>; cdecl;
    {class} function valueOf(P1: JString): JLocationClientOption_LocationMode; cdecl;

    { static Property }
    {class} property Hight_Accuracy: JLocationClientOption_LocationMode read _GetHight_Accuracy;
    {class} property Battery_Saving: JLocationClientOption_LocationMode read _GetBattery_Saving;
    {class} property Device_Sensors: JLocationClientOption_LocationMode read _GetDevice_Sensors;
    {class} property Fuzzy_Locating: JLocationClientOption_LocationMode read _GetFuzzy_Locating;
  end;

  [JavaSignature('com/baidu/location/LocationClientOption$LocationMode')]
  JLocationClientOption_LocationMode = interface(JEnum) // or JObject
  ['{5A761F1D-32E8-499A-8BD4-22D2E0648143}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLocationClientOption_LocationMode = class(TJavaGenericImport<JLocationClientOption_LocationModeClass, JLocationClientOption_LocationMode>) end;

  JLocationClientOptionClass = interface(JObjectClass)
  ['{370ED3E0-E84C-433A-B284-91F3C30BB7AC}']
    { static Property Methods }
    {class} function _GetMIN_SCAN_SPAN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGPS_FIRST: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_SENSITIVITY_HIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_SENSITIVITY_MIDDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOC_SENSITIVITY_LOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIN_AUTO_NOTIFY_INTERVAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGPS_ONLY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNETWORK_FIRST: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFUZZY_MODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JLocationClientOption; cdecl; overload;
    {class} function init(P1: JLocationClientOption): JLocationClientOption; cdecl; overload;

    { static Property }
    {class} property MIN_SCAN_SPAN: Integer read _GetMIN_SCAN_SPAN;
    {class} property GPS_FIRST: Integer read _GetGPS_FIRST;
    {class} property LOC_SENSITIVITY_HIGHT: Integer read _GetLOC_SENSITIVITY_HIGHT;
    {class} property LOC_SENSITIVITY_MIDDLE: Integer read _GetLOC_SENSITIVITY_MIDDLE;
    {class} property LOC_SENSITIVITY_LOW: Integer read _GetLOC_SENSITIVITY_LOW;
    {class} property MIN_AUTO_NOTIFY_INTERVAL: Integer read _GetMIN_AUTO_NOTIFY_INTERVAL;
    {class} property GPS_ONLY: Integer read _GetGPS_ONLY;
    {class} property NETWORK_FIRST: Integer read _GetNETWORK_FIRST;
    {class} property FUZZY_MODE: Integer read _GetFUZZY_MODE;
  end;

  [JavaSignature('com/baidu/location/LocationClientOption')]
  JLocationClientOption = interface(JObject)
  ['{6B95F77B-07C8-42BB-A62E-E79D564D2F88}']
    { Property Methods }
    function _GetcoorType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcoorType(acoorType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetaddrType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaddrType(aaddrType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetopenGps: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetopenGps(aopenGps: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetscanSpan: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetscanSpan(ascanSpan: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettimeOut: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettimeOut(atimeOut: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprodName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprodName(aprodName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getpriority: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setpriority(apriority: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getlocation_change_notify: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setlocation_change_notify(alocation_change_notify: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdisableLocCache: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdisableLocCache(adisableLocCache: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetenableSimulateGps: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetenableSimulateGps(aenableSimulateGps: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetserviceName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetserviceName(aserviceName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisIgnoreCacheException: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisIgnoreCacheException(aisIgnoreCacheException: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisIgnoreKillProcess: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisIgnoreKillProcess(aisIgnoreKillProcess: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmIsNeedDeviceDirect: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmIsNeedDeviceDirect(amIsNeedDeviceDirect: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisNeedAptag: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisNeedAptag(aisNeedAptag: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisNeedAptagd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisNeedAptagd(aisNeedAptagd: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisNeedPoiRegion: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisNeedPoiRegion(aisNeedPoiRegion: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisNeedRegular: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisNeedRegular(aisNeedRegular: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisNeedAltitude: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisNeedAltitude(aisNeedAltitude: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisNeedNewVersionRgc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisNeedNewVersionRgc(aisNeedNewVersionRgc: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisOnceLocation: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisOnceLocation(aisOnceLocation: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetautoNotifyMaxInterval: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetautoNotifyMaxInterval(aautoNotifyMaxInterval: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetautoNotifyLocSensitivity: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetautoNotifyLocSensitivity(aautoNotifyLocSensitivity: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetautoNotifyMinTimeInterval: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetautoNotifyMinTimeInterval(aautoNotifyMinTimeInterval: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetautoNotifyMinDistance: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetautoNotifyMinDistance(aautoNotifyMinDistance: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetwifiCacheTimeOut: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetwifiCacheTimeOut(awifiCacheTimeOut: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlocLegalStatus: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlocLegalStatus(alocLegalStatus: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisEnableBeidouMode: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisEnableBeidouMode(aisEnableBeidouMode: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetfirstLocType: JLocationClientOption_FirstLocType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetfirstLocType(afirstLocType: JLocationClientOption_FirstLocType);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function optionEquals(P1: JLocationClientOption): Boolean; cdecl;
    function getCoorType: JString; cdecl;
    procedure setCoorType(P1: JString); cdecl;
    function getAddrType: JString; cdecl;
    procedure setAddrType(P1: JString); cdecl; //Deprecated
    procedure setIsNeedAddress(P1: Boolean); cdecl;
    procedure setIsEnableBeidouMode(P1: Boolean); cdecl;
    procedure setLocStatus(P1: Boolean); cdecl;
    procedure setWifiCacheTimeOut(P1: Integer); cdecl;
    function isOpenGps: Boolean; cdecl; //Deprecated
    function isOpenGnss: Boolean; cdecl;
    procedure setOpenGps(P1: Boolean); cdecl; //Deprecated
    procedure setOpenGnss(P1: Boolean); cdecl;
    procedure setLocationPurpose(P1: JLocationClientOption_BDLocationPurpose); cdecl;
    function isLocationNotify: Boolean; cdecl;
    procedure setLocationNotify(P1: Boolean); cdecl;
    function isOnceLocation: Boolean; cdecl;
    procedure setOnceLocation(P1: Boolean); cdecl;
    procedure setOpenAutoNotifyMode; cdecl; overload;
    procedure setOpenAutoNotifyMode(P1: Integer; P2: Integer; P3: Integer); cdecl; overload;
    function getAutoNotifyMinTimeInterval: Integer; cdecl;
    function getAutoNotifyMinDistance: Integer; cdecl;
    function getScanSpan: Integer; cdecl;
    procedure setScanSpan(P1: Integer); cdecl;
    function getTimeOut: Integer; cdecl; //Deprecated
    procedure setTimeOut(P1: Integer); cdecl; //Deprecated
    function getProdName: JString; cdecl;
    procedure setProdName(P1: JString); cdecl;
    function getPriority: Integer; cdecl;
    procedure setPriority(P1: Integer); cdecl; //Deprecated
    procedure setLocationMode(P1: JLocationClientOption_LocationMode); cdecl;
    function getLocationMode: JLocationClientOption_LocationMode; cdecl;
    procedure setNeedDeviceDirect(P1: Boolean); cdecl;
    procedure setNeedNewVersionRgc(P1: Boolean); cdecl;
    function getServiceName: JString; cdecl; //Deprecated
    procedure setServiceName(P1: JString); cdecl; //Deprecated
    procedure setIsNeedLocationDescribe(P1: Boolean); cdecl;
    procedure setIsNeedAltitude(P1: Boolean); cdecl;
    procedure setIsNeedLocationPoiList(P1: Boolean); cdecl;
    procedure setSema(P1: Boolean; P2: Boolean; P3: Boolean); cdecl; //Deprecated
    procedure disableCache(P1: Boolean); cdecl; //Deprecated
    function isDisableCache: Boolean; cdecl; //Deprecated
    procedure SetIgnoreCacheException(P1: Boolean); cdecl;
    procedure setIgnoreKillProcess(P1: Boolean); cdecl;
    procedure setEnableSimulateGps(P1: Boolean); cdecl; //Deprecated
    procedure setEnableSimulateGnss(P1: Boolean); cdecl;
    procedure setFirstLocType(P1: JLocationClientOption_FirstLocType); cdecl;

    { Property }
    property coorType: JString read _GetcoorType write _SetcoorType;
    property addrType: JString read _GetaddrType write _SetaddrType;
    property openGps: Boolean read _GetopenGps write _SetopenGps;
    property scanSpan: Integer read _GetscanSpan write _SetscanSpan;
    property timeOut: Integer read _GettimeOut write _SettimeOut;
    property prodName: JString read _GetprodName write _SetprodName;
    property priority: Integer read _Getpriority write _Setpriority;
    property location_change_notify: Boolean read _Getlocation_change_notify write _Setlocation_change_notify;
    property disableLocCache: Boolean read _GetdisableLocCache write _SetdisableLocCache;
    property enableSimulateGps: Boolean read _GetenableSimulateGps write _SetenableSimulateGps;
    property serviceName: JString read _GetserviceName write _SetserviceName;
    property isIgnoreCacheException: Boolean read _GetisIgnoreCacheException write _SetisIgnoreCacheException;
    property isIgnoreKillProcess: Boolean read _GetisIgnoreKillProcess write _SetisIgnoreKillProcess;
    property mIsNeedDeviceDirect: Boolean read _GetmIsNeedDeviceDirect write _SetmIsNeedDeviceDirect;
    property isNeedAptag: Boolean read _GetisNeedAptag write _SetisNeedAptag;
    property isNeedAptagd: Boolean read _GetisNeedAptagd write _SetisNeedAptagd;
    property isNeedPoiRegion: Boolean read _GetisNeedPoiRegion write _SetisNeedPoiRegion;
    property isNeedRegular: Boolean read _GetisNeedRegular write _SetisNeedRegular;
    property isNeedAltitude: Boolean read _GetisNeedAltitude write _SetisNeedAltitude;
    property isNeedNewVersionRgc: Boolean read _GetisNeedNewVersionRgc write _SetisNeedNewVersionRgc;
    property isOnceLocation: Boolean read _GetisOnceLocation write _SetisOnceLocation;
    property autoNotifyMaxInterval: Integer read _GetautoNotifyMaxInterval write _SetautoNotifyMaxInterval;
    property autoNotifyLocSensitivity: Single read _GetautoNotifyLocSensitivity write _SetautoNotifyLocSensitivity;
    property autoNotifyMinTimeInterval: Integer read _GetautoNotifyMinTimeInterval write _SetautoNotifyMinTimeInterval;
    property autoNotifyMinDistance: Integer read _GetautoNotifyMinDistance write _SetautoNotifyMinDistance;
    property wifiCacheTimeOut: Integer read _GetwifiCacheTimeOut write _SetwifiCacheTimeOut;
    property locLegalStatus: Integer read _GetlocLegalStatus write _SetlocLegalStatus;
    property isEnableBeidouMode: Boolean read _GetisEnableBeidouMode write _SetisEnableBeidouMode;
    property firstLocType: JLocationClientOption_FirstLocType read _GetfirstLocType write _SetfirstLocType;
  end;

  TJLocationClientOption = class(TJavaGenericImport<JLocationClientOptionClass, JLocationClientOption>) end;

  JLocationConst_PoiDataConstClass = interface(JObjectClass)
  ['{F15E21C1-211C-4F4E-A003-AE9D5AF4ED4B}']
    { static Property Methods }
    {class} function _GetKEY_INDOOR_AREA: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_INDOOR_PARKING_LOT_NUM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_INDOOR_LOC_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_INDOOR_PARK_UID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_INDOOR_PARKING_LOT_UID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_INDOOR_USER_STATUS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_INDOOR_LOC_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JLocationConst_PoiDataConst; cdecl;

    { static Property }
    {class} property KEY_INDOOR_AREA: JString read _GetKEY_INDOOR_AREA;
    {class} property KEY_INDOOR_PARKING_LOT_NUM: JString read _GetKEY_INDOOR_PARKING_LOT_NUM;
    {class} property KEY_INDOOR_LOC_NAME: JString read _GetKEY_INDOOR_LOC_NAME;
    {class} property KEY_INDOOR_PARK_UID: JString read _GetKEY_INDOOR_PARK_UID;
    {class} property KEY_INDOOR_PARKING_LOT_UID: JString read _GetKEY_INDOOR_PARKING_LOT_UID;
    {class} property KEY_INDOOR_USER_STATUS: JString read _GetKEY_INDOOR_USER_STATUS;
    {class} property KEY_INDOOR_LOC_TYPE: JString read _GetKEY_INDOOR_LOC_TYPE;
  end;

  [JavaSignature('com/baidu/location/LocationConst$PoiDataConst')]
  JLocationConst_PoiDataConst = interface(JObject)
  ['{A710209B-01BB-43E3-A5DF-E081D2A0AF2B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLocationConst_PoiDataConst = class(TJavaGenericImport<JLocationConst_PoiDataConstClass, JLocationConst_PoiDataConst>) end;

  JLocationConst_SceneTypeClass = interface(JObjectClass)
  ['{EE59CC5E-F8F2-4999-8935-C41EF077A433}']
    { static Property Methods }
    {class} function _GetSCENE_TYPE_RECOGNITION_SUBWAY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCENE_TYPE_RECOGNITION_TRAFFIC_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JLocationConst_SceneType; cdecl;

    { static Property }
    {class} property SCENE_TYPE_RECOGNITION_SUBWAY: Integer read _GetSCENE_TYPE_RECOGNITION_SUBWAY;
    {class} property SCENE_TYPE_RECOGNITION_TRAFFIC_TYPE: Integer read _GetSCENE_TYPE_RECOGNITION_TRAFFIC_TYPE;
  end;

  [JavaSignature('com/baidu/location/LocationConst$SceneType')]
  JLocationConst_SceneType = interface(JObject)
  ['{1E1B5E8B-7934-49A1-8961-8DB7741C3BEF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLocationConst_SceneType = class(TJavaGenericImport<JLocationConst_SceneTypeClass, JLocationConst_SceneType>) end;

  JLocationConst_SubWayErrorCodeClass = interface(JObjectClass)
  ['{EA36E119-EB98-4AD7-A251-04A9B0564F0E}']
    { static Property Methods }
    {class} function _GetSUBWAY_ERROR_SWITCH_CLOSE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUBWAY_ERROR_NONSUPPORT_PRESSURE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUBWAY_LOC_SDK_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUBWAY_ERROR_LOC_ENGINE_MISS_DATA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUBWAY_ERROR_LOC_ENGINE_INTERNAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUBWAY_ERROR_LOC_KNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JLocationConst): JLocationConst_SubWayErrorCode; cdecl;

    { static Property }
    {class} property SUBWAY_ERROR_SWITCH_CLOSE: Integer read _GetSUBWAY_ERROR_SWITCH_CLOSE;
    {class} property SUBWAY_ERROR_NONSUPPORT_PRESSURE: Integer read _GetSUBWAY_ERROR_NONSUPPORT_PRESSURE;
    {class} property SUBWAY_LOC_SDK_ERROR: Integer read _GetSUBWAY_LOC_SDK_ERROR;
    {class} property SUBWAY_ERROR_LOC_ENGINE_MISS_DATA: Integer read _GetSUBWAY_ERROR_LOC_ENGINE_MISS_DATA;
    {class} property SUBWAY_ERROR_LOC_ENGINE_INTERNAL: Integer read _GetSUBWAY_ERROR_LOC_ENGINE_INTERNAL;
    {class} property SUBWAY_ERROR_LOC_KNOWN: Integer read _GetSUBWAY_ERROR_LOC_KNOWN;
  end;

  [JavaSignature('com/baidu/location/LocationConst$SubWayErrorCode')]
  JLocationConst_SubWayErrorCode = interface(JObject)
  ['{CEC4EC25-7FC1-4612-AD57-CF52D091AB5C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLocationConst_SubWayErrorCode = class(TJavaGenericImport<JLocationConst_SubWayErrorCodeClass, JLocationConst_SubWayErrorCode>) end;

  JLocationConst_TrafficStatusClass = interface(JObjectClass)
  ['{8A69F72E-E136-40C4-88CE-D2F6ABFC9447}']
    { static Property Methods }
    {class} function _GetTRAFFIC_STATUS_DRIVE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_STATUS_WALK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_STATUS_BUS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_STATUS_SUBWAY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_SCAN_BLUETOOTH_FINISH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_SCAN_BLUETOOTH_NO_DATA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_ERROR_PREDICT_GPS_NO_DATA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_ERROR_PREDICT_MODEL_CUL_FAILED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_ERROR_SWITCH_CLOSE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_ERROR_NONSUPPORT_BLUETOOTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_ERROR_NON_OPEN_BLUETOOTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_ERROR_LOC_SDK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_ERROR_LOC_ENGINE_MISS_DATA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_ERROR_LOC_ENGINE_INTERNAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_ERROR_LOC_KNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRAFFIC_ERROR_MODEL_LOAD_FAILED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JLocationConst): JLocationConst_TrafficStatus; cdecl;

    { static Property }
    {class} property TRAFFIC_STATUS_DRIVE: Integer read _GetTRAFFIC_STATUS_DRIVE;
    {class} property TRAFFIC_STATUS_WALK: Integer read _GetTRAFFIC_STATUS_WALK;
    {class} property TRAFFIC_STATUS_BUS: Integer read _GetTRAFFIC_STATUS_BUS;
    {class} property TRAFFIC_STATUS_SUBWAY: Integer read _GetTRAFFIC_STATUS_SUBWAY;
    {class} property TRAFFIC_SCAN_BLUETOOTH_FINISH: Integer read _GetTRAFFIC_SCAN_BLUETOOTH_FINISH;
    {class} property TRAFFIC_SCAN_BLUETOOTH_NO_DATA: Integer read _GetTRAFFIC_SCAN_BLUETOOTH_NO_DATA;
    {class} property TRAFFIC_ERROR_PREDICT_GPS_NO_DATA: Integer read _GetTRAFFIC_ERROR_PREDICT_GPS_NO_DATA;
    {class} property TRAFFIC_ERROR_PREDICT_MODEL_CUL_FAILED: Integer read _GetTRAFFIC_ERROR_PREDICT_MODEL_CUL_FAILED;
    {class} property TRAFFIC_ERROR_SWITCH_CLOSE: Integer read _GetTRAFFIC_ERROR_SWITCH_CLOSE;
    {class} property TRAFFIC_ERROR_NONSUPPORT_BLUETOOTH: Integer read _GetTRAFFIC_ERROR_NONSUPPORT_BLUETOOTH;
    {class} property TRAFFIC_ERROR_NON_OPEN_BLUETOOTH: Integer read _GetTRAFFIC_ERROR_NON_OPEN_BLUETOOTH;
    {class} property TRAFFIC_ERROR_LOC_SDK: Integer read _GetTRAFFIC_ERROR_LOC_SDK;
    {class} property TRAFFIC_ERROR_LOC_ENGINE_MISS_DATA: Integer read _GetTRAFFIC_ERROR_LOC_ENGINE_MISS_DATA;
    {class} property TRAFFIC_ERROR_LOC_ENGINE_INTERNAL: Integer read _GetTRAFFIC_ERROR_LOC_ENGINE_INTERNAL;
    {class} property TRAFFIC_ERROR_LOC_KNOWN: Integer read _GetTRAFFIC_ERROR_LOC_KNOWN;
    {class} property TRAFFIC_ERROR_MODEL_LOAD_FAILED: Integer read _GetTRAFFIC_ERROR_MODEL_LOAD_FAILED;
  end;

  [JavaSignature('com/baidu/location/LocationConst$TrafficStatus')]
  JLocationConst_TrafficStatus = interface(JObject)
  ['{955DC328-25BB-4C6F-9F55-58B6FBB6572C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLocationConst_TrafficStatus = class(TJavaGenericImport<JLocationConst_TrafficStatusClass, JLocationConst_TrafficStatus>) end;

  JLocationConstClass = interface(JObjectClass)
  ['{1F046974-D218-4C92-8E05-84F5A40DEC6E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLocationConst; cdecl;

    { static Property }
  end;

  [JavaSignature('com/baidu/location/LocationConst')]
  JLocationConst = interface(JObject)
  ['{7E006221-A9CA-4E0D-B123-4AE9453C7E19}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLocationConst = class(TJavaGenericImport<JLocationConstClass, JLocationConst>) end;

  JPoiClass = interface(JObjectClass)
  ['{A805E6E7-0AE8-4374-BBF7-46956156B45B}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: Double; P4: JString; P5: JString): JPoi; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/location/Poi')]
  JPoi = interface(JObject)
  ['{51116905-7F23-4B2C-90AC-EEF175F08C3B}']
    { Property Methods }

    { methods }
    function getId: JString; cdecl;
    function getRank: Double; cdecl;
    function getTags: JString; cdecl;
    function getAddr: JString; cdecl;
    function getName: JString; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
  end;

  TJPoi = class(TJavaGenericImport<JPoiClass, JPoi>) end;

  JPoiRegionClass = interface(JObjectClass)
  ['{0EC5D805-75D5-493B-812E-7D0F319DC72C}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JString): JPoiRegion; cdecl; overload;
    {class} function init(P1: JPoiRegion): JPoiRegion; cdecl; overload;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/location/PoiRegion')]
  JPoiRegion = interface(JObject)
  ['{70B3D860-A250-4716-B8B6-9C23F5DF87DD}']
    { Property Methods }

    { methods }
    function getTags: JString; cdecl;
    function getDerectionDesc: JString; cdecl;
    function getName: JString; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
  end;

  TJPoiRegion = class(TJavaGenericImport<JPoiRegionClass, JPoiRegion>) end;
{$ENDIF}

implementation

{$IFDEF ANDROID}

procedure RegisterTypes;
begin
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_001', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_001));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ji', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ji));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jj', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jj));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jk', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jk));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_014', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_014));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_c', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_c));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_d', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_d));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_e', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_e));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_020', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_020));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_021', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_021));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_023', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_023));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_026', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_026));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_a_027', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_a_027));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_c_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_c_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_c', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_c));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_d', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_d));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_e', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_e));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_f', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_f));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_034', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_034));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf_035', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf_035));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_036', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_036));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_037', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_037));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_038', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_038));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_039', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_039));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_040', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_040));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_041', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_041));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf_042', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf_042));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_043', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_043));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh_044', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh_044));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ji_045', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ji_045));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_046', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_046));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_047', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_047));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_048', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_048));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_049', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_049));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_050', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_050));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_051', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_051));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_052', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_052));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_053', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_053));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_054', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_054));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_055', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_055));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf_056', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf_056));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_057', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_057));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_058', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_058));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_059', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_059));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_060', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_060));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_061', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_061));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_a_062', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_a_062));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_063', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_063));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_064', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_064));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_065', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_065));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_066', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_066));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_067', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_067));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf_068', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf_068));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_069', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_069));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh_a_070', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh_a_070));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh_071', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh_071));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_072', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_072));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_073', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_073));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_074', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_074));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_a_075', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_a_075));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_076', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_076));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_a_077', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_a_077));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_078', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_078));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JErrorMessage', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JErrorMessage));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf_080', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf_080));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_082', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_082));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh_083', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh_083));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ji_084', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ji_084));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jj_085', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jj_085));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jk_086', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jk_086));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jl', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jl));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLBSAuthManager', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLBSAuthManager));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLBSAuthManagerListener', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLBSAuthManagerListener));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jm', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jm));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jn', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jn));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jo', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jo));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jp', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jp));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jq', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jq));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_095', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_095));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_096', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_096));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JAddress_1', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JAddress_1));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JAddress_Builder', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JAddress_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JAddress', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JAddress));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_1', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_1));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_a_101', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_a_101));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_b_102', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_b_102));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_103', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_103));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jaa', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jaa));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jab', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jab));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_1', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_1));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_c', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_c));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_110', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_110));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_a_111', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_a_111));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_112', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_112));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_113', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_113));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_a_114', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_a_114));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_b_115', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_b_115));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_c_a_116', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_c_a_116));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_c_117', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_c_117));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_d_118', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_d_118));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_e_119', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_e_119));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_f_120', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_f_120));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_121', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_121));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf_122', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf_122));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_123', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_123));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh_a_124', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh_a_124));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh_126', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh_126));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ji_127', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ji_127));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jj_128', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jj_128));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jk_129', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jk_129));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jl_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jl_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jl_131', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jl_131));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jm_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jm_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jm_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jm_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jm_134', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jm_134));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jn_1', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jn_1));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jn_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jn_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jn_137', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jn_137));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jo_1', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jo_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jo_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jo_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jo_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jo_c', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jo_c));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jo_d', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jo_d));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jo_e', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jo_e));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jo_f', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jo_f));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jo_145', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jo_145));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jp_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jp_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jp_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jp_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jp_148', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jp_148));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jq_149', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jq_149));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jr_1', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jr_1));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jr_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jr_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jr_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jr_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jr_c', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jr_c));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jr', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jr));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Js', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Js));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jt_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jt_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jt_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jt_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jt_c', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jt_c));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jt', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jt));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ju_1', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ju_1));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ju_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ju_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ju', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ju));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jv', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jv));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jw', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jw));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jx_1', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jx_1));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jx_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jx_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jx', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jx));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jy_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jy_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jy_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jy_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jy', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jy));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jz_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jz_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jz', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jz));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_173', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_173));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JBDAbstractLocationListener', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JBDAbstractLocationListener));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JBDLocation', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JBDLocation));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JBDLocationListener', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JBDLocationListener));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_177', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_177));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_1_178', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_1_178));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_a_179', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_a_179));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_b_180', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_b_180));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_c_181', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_c_181));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_d', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_d));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_e', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_e));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_f', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_f));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_185', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_185));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_186', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_186));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_187', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_187));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_a_188', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_a_188));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_b_189', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_b_189));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_190', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_190));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf_191', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf_191));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_a_192', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_a_192));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_c', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_c));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_d', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_d));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_e', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_e));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_f', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_f));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_g', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_g));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_h', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_h));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_200', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_200));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh_201', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh_201));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ji_202', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ji_202));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jj_203', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jj_203));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jk_204', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jk_204));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jl_205', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jl_205));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jm_1', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jm_1));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jm_a_207', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jm_a_207));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jm_208', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jm_208));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jn_209', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jn_209));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_210', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_210));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_a_211', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_a_211));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_212', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_212));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_213', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_213));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_214', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_214));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ja_215', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ja_215));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_1_216', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_1_216));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_a_217', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_a_217));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jb_218', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jb_218));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jc_219', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jc_219));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jd_220', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jd_220));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_a_221', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_a_221));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_b_222', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_b_222));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_223', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_223));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf_225', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf_225));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jg_226', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jg_226));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jh_227', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jh_227));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Ji_228', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Ji_228));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jj_229', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jj_229));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jk_230', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jk_230));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jl_231', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jl_231));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Je_232', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Je_232));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.Jf_233', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.Jf_233));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JJni', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JJni));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLLSInterface', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLLSInterface));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationClient_a', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationClient_a));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationClient_b', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationClient_b));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationClient_c', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationClient_c));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationClient', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationClient));
//  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationClientOption_1', 
//    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationClientOption_1));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationClientOption_BDLocationPurpose', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationClientOption_BDLocationPurpose));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationClientOption_FirstLocType', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationClientOption_FirstLocType));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationClientOption_LocationMode', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationClientOption_LocationMode));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationClientOption', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationClientOption));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationConst_PoiDataConst', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationConst_PoiDataConst));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationConst_SceneType', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationConst_SceneType));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationConst_SubWayErrorCode', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationConst_SubWayErrorCode));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationConst_TrafficStatus', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationConst_TrafficStatus));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JLocationConst', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JLocationConst));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JPoi', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JPoi));
  TRegTypes.RegisterType('Androidapi.JNI.BaiduLBS_Android.JPoiRegion', 
    TypeInfo(Androidapi.JNI.BaiduLBS_Android.JPoiRegion));
end;


initialization
  RegisterTypes;
{$ENDIF}

end.
