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
//  生成时间：2023-07-01 13:47:09
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.Util,
  Androidapi.JNI.Webkit,
  Androidapi.JNI.Java.Net,
  Androidapi.JNI.Hardware;

type

// ===== Forward declarations =====

  JIALinkListener = interface; //com.bytedance.applog.alink.IALinkListener
  JPageMeta = interface; //com.bytedance.applog.annotation.PageMeta
  JAppLog = interface; //com.bytedance.applog.AppLog
  JAppLogManager = interface; //com.bytedance.applog.AppLogManager
  JCollector = interface; //com.bytedance.applog.collector.Collector
  JAutoTrackEventType = interface; //com.bytedance.applog.event.AutoTrackEventType
  JEventBuilder = interface; //com.bytedance.applog.event.EventBuilder
  JEventPolicy = interface; //com.bytedance.applog.event.EventPolicy
  JEventType = interface; //com.bytedance.applog.event.EventType
  JIEventHandler = interface; //com.bytedance.applog.event.IEventHandler
  JAppCrashType = interface; //com.bytedance.applog.exception.AppCrashType
  JViewExposureConfig = interface; //com.bytedance.applog.exposure.ViewExposureConfig
  JViewExposureData = interface; //com.bytedance.applog.exposure.ViewExposureData
//  JViewExposureManager_a = interface; //com.bytedance.applog.exposure.ViewExposureManager$a
//  JViewExposureManager_b = interface; //com.bytedance.applog.exposure.ViewExposureManager$b
//  JViewExposureManager_c = interface; //com.bytedance.applog.exposure.ViewExposureManager$c
//  JViewExposureManager_d = interface; //com.bytedance.applog.exposure.ViewExposureManager$d
//  JViewExposureManager_e = interface; //com.bytedance.applog.exposure.ViewExposureManager$e
//  JViewExposureManager_f = interface; //com.bytedance.applog.exposure.ViewExposureManager$f
  JViewExposureManager = interface; //com.bytedance.applog.exposure.ViewExposureManager
  JGameReportHelper = interface; //com.bytedance.applog.game.GameReportHelper
  JOhayooGameHelper = interface; //com.bytedance.applog.game.OhayooGameHelper
//  JUnityPlugin_a = interface; //com.bytedance.applog.game.UnityPlugin$a
  JUnityPlugin = interface; //com.bytedance.applog.game.UnityPlugin
  JWhalerGameHelper_Result = interface; //com.bytedance.applog.game.WhalerGameHelper$Result
  JWhalerGameHelper = interface; //com.bytedance.applog.game.WhalerGameHelper
  JIActiveCustomParamsCallback = interface; //com.bytedance.applog.IActiveCustomParamsCallback
  JIAppLogInstance = interface; //com.bytedance.applog.IAppLogInstance
  JIDataObserver = interface; //com.bytedance.applog.IDataObserver
  JIEventObserver = interface; //com.bytedance.applog.IEventObserver
  JIExtraParams = interface; //com.bytedance.applog.IExtraParams
  JIHeaderCustomTimelyCallback = interface; //com.bytedance.applog.IHeaderCustomTimelyCallback
  JILogger = interface; //com.bytedance.applog.ILogger
  JInitConfig_IpcDataChecker = interface; //com.bytedance.applog.InitConfig$IpcDataChecker
  JInitConfig = interface; //com.bytedance.applog.InitConfig
  JIOaidObserver_Oaid = interface; //com.bytedance.applog.IOaidObserver$Oaid
  JIOaidObserver = interface; //com.bytedance.applog.IOaidObserver
  JIPageMeta = interface; //com.bytedance.applog.IPageMeta
  JIPicker = interface; //com.bytedance.applog.IPicker
  JIPullAbTestConfigCallback = interface; //com.bytedance.applog.IPullAbTestConfigCallback
  JISensitiveInfoProvider = interface; //com.bytedance.applog.ISensitiveInfoProvider
  JISessionObserver = interface; //com.bytedance.applog.ISessionObserver
  JLevel = interface; //com.bytedance.applog.Level
  JMigrateDetectorActivity = interface; //com.bytedance.applog.migrate.MigrateDetectorActivity
  JINetworkClient = interface; //com.bytedance.applog.network.INetworkClient
  JRangersHttpException = interface; //com.bytedance.applog.network.RangersHttpException
  JIDBindCallback = interface; //com.bytedance.applog.oneid.IDBindCallback
  JIDBindResult = interface; //com.bytedance.applog.oneid.IDBindResult
//  JAnalyticsComponentRegistrar_a = interface; //com.bytedance.applog.onekit.AnalyticsComponentRegistrar$a
  JAnalyticsComponentRegistrar = interface; //com.bytedance.applog.onekit.AnalyticsComponentRegistrar
//  JDeviceComponentRegistrar_a = interface; //com.bytedance.applog.onekit.DeviceComponentRegistrar$a
  JDeviceComponentRegistrar = interface; //com.bytedance.applog.onekit.DeviceComponentRegistrar
  JUserProfileCallback = interface; //com.bytedance.applog.profile.UserProfileCallback
//  JSimulateLaunchActivity = interface; //com.bytedance.applog.simulate.SimulateLaunchActivity
//  JUriConfig_a = interface; //com.bytedance.applog.UriConfig$a
  JUriConfig_Builder = interface; //com.bytedance.applog.UriConfig$Builder
  JUriConfig = interface; //com.bytedance.applog.UriConfig
  JGeoCoordinateSystemConst = interface; //com.bytedance.applog.util.GeoCoordinateSystemConst
//  JHardwareUtils_a = interface; //com.bytedance.applog.util.HardwareUtils$a
  JHardwareUtils = interface; //com.bytedance.applog.util.HardwareUtils
//  JSensitiveUtils_a = interface; //com.bytedance.applog.util.SensitiveUtils$a
//  JSensitiveUtils_b = interface; //com.bytedance.applog.util.SensitiveUtils$b
//  JSensitiveUtils_c = interface; //com.bytedance.applog.util.SensitiveUtils$c
//  JSensitiveUtils_d = interface; //com.bytedance.applog.util.SensitiveUtils$d
//  JSensitiveUtils_e = interface; //com.bytedance.applog.util.SensitiveUtils$e
  JSensitiveUtils = interface; //com.bytedance.applog.util.SensitiveUtils
  JUriConstants = interface; //com.bytedance.applog.util.UriConstants
//  JWebViewJsUtil_a = interface; //com.bytedance.applog.util.WebViewJsUtil$a
//  JWebViewJsUtil_b = interface; //com.bytedance.applog.util.WebViewJsUtil$b
//  JWebViewJsUtil_c = interface; //com.bytedance.applog.util.WebViewJsUtil$c
//  JWebViewJsUtil_d = interface; //com.bytedance.applog.util.WebViewJsUtil$d
//  JWebViewJsUtil_e = interface; //com.bytedance.applog.util.WebViewJsUtil$e
//  JWebViewJsUtil_f = interface; //com.bytedance.applog.util.WebViewJsUtil$f
//  JWebViewJsUtil_g = interface; //com.bytedance.applog.util.WebViewJsUtil$g
//  JWebViewJsUtil_h = interface; //com.bytedance.applog.util.WebViewJsUtil$h
  JWebViewJsUtil = interface; //com.bytedance.applog.util.WebViewJsUtil
//  Ja = interface; //com.bytedance.bdtracker.a
//  Ja0 = interface; //com.bytedance.bdtracker.a0
//  Ja1 = interface; //com.bytedance.bdtracker.a1
//  Ja2 = interface; //com.bytedance.bdtracker.a2
//  Ja3_a = interface; //com.bytedance.bdtracker.a3$a
//  Ja3 = interface; //com.bytedance.bdtracker.a3
//  Ja4 = interface; //com.bytedance.bdtracker.a4
//  Jb_a = interface; //com.bytedance.bdtracker.b$a
//  Jb_b = interface; //com.bytedance.bdtracker.b$b
//  Jb_c = interface; //com.bytedance.bdtracker.b$c
//  Jb_d = interface; //com.bytedance.bdtracker.b$d
//  Jb_e = interface; //com.bytedance.bdtracker.b$e
//  Jb = interface; //com.bytedance.bdtracker.b
//  Jb0_a = interface; //com.bytedance.bdtracker.b0$a
//  Jb0 = interface; //com.bytedance.bdtracker.b0
//  Jb1 = interface; //com.bytedance.bdtracker.b1
//  Jb2 = interface; //com.bytedance.bdtracker.b2
//  Jb3 = interface; //com.bytedance.bdtracker.b3
//  Jb4 = interface; //com.bytedance.bdtracker.b4
//  Jc_a = interface; //com.bytedance.bdtracker.c$a
//  Jc = interface; //com.bytedance.bdtracker.c
//  Jc0_a = interface; //com.bytedance.bdtracker.c0$a
//  Jc0_b = interface; //com.bytedance.bdtracker.c0$b
//  Jc0_c = interface; //com.bytedance.bdtracker.c0$c
//  Jc0_d = interface; //com.bytedance.bdtracker.c0$d
//  Jc0 = interface; //com.bytedance.bdtracker.c0
//  Jc1 = interface; //com.bytedance.bdtracker.c1
//  Jc2 = interface; //com.bytedance.bdtracker.c2
//  Jc3_a = interface; //com.bytedance.bdtracker.c3$a
//  Jc3 = interface; //com.bytedance.bdtracker.c3
//  Jc4_a = interface; //com.bytedance.bdtracker.c4$a
//  Jc4 = interface; //com.bytedance.bdtracker.c4
//  Jd_a = interface; //com.bytedance.bdtracker.d$a
//  Jd_b = interface; //com.bytedance.bdtracker.d$b
//  Jd_c = interface; //com.bytedance.bdtracker.d$c
//  Jd_d = interface; //com.bytedance.bdtracker.d$d
//  Jd = interface; //com.bytedance.bdtracker.d
//  Jd0 = interface; //com.bytedance.bdtracker.d0
//  Jd1_a = interface; //com.bytedance.bdtracker.d1$a
//  Jd1 = interface; //com.bytedance.bdtracker.d1
//  Jd2 = interface; //com.bytedance.bdtracker.d2
//  Jd3_a = interface; //com.bytedance.bdtracker.d3$a
//  Jd3 = interface; //com.bytedance.bdtracker.d3
//  Jd4 = interface; //com.bytedance.bdtracker.d4
//  Je = interface; //com.bytedance.bdtracker.e
//  Je0 = interface; //com.bytedance.bdtracker.e0
//  Je1 = interface; //com.bytedance.bdtracker.e1
//  Je2 = interface; //com.bytedance.bdtracker.e2
//  Je3_a = interface; //com.bytedance.bdtracker.e3$a
//  Je3_b = interface; //com.bytedance.bdtracker.e3$b
//  Je3_c = interface; //com.bytedance.bdtracker.e3$c
//  Je3_d = interface; //com.bytedance.bdtracker.e3$d
//  Je3_e = interface; //com.bytedance.bdtracker.e3$e
//  Je3_f = interface; //com.bytedance.bdtracker.e3$f
//  Je3_g = interface; //com.bytedance.bdtracker.e3$g
//  Je3_h = interface; //com.bytedance.bdtracker.e3$h
//  Je3 = interface; //com.bytedance.bdtracker.e3
//  Je4 = interface; //com.bytedance.bdtracker.e4
//  Jf = interface; //com.bytedance.bdtracker.f
//  Jf0_a = interface; //com.bytedance.bdtracker.f0$a
//  Jf0 = interface; //com.bytedance.bdtracker.f0
//  Jf1 = interface; //com.bytedance.bdtracker.f1
//  Jf2 = interface; //com.bytedance.bdtracker.f2
//  Jf3 = interface; //com.bytedance.bdtracker.f3
//  Jf4_a = interface; //com.bytedance.bdtracker.f4$a
//  Jf4 = interface; //com.bytedance.bdtracker.f4
//  Jg = interface; //com.bytedance.bdtracker.g
//  Jg0_a = interface; //com.bytedance.bdtracker.g0$a
//  Jg0 = interface; //com.bytedance.bdtracker.g0
//  Jg1 = interface; //com.bytedance.bdtracker.g1
//  Jg2 = interface; //com.bytedance.bdtracker.g2
//  Jg3 = interface; //com.bytedance.bdtracker.g3
//  Jg4 = interface; //com.bytedance.bdtracker.g4
//  Jh = interface; //com.bytedance.bdtracker.h
//  Jh0_a = interface; //com.bytedance.bdtracker.h0$a
//  Jh0_b = interface; //com.bytedance.bdtracker.h0$b
//  Jh0 = interface; //com.bytedance.bdtracker.h0
//  Jh1 = interface; //com.bytedance.bdtracker.h1
//  Jh2 = interface; //com.bytedance.bdtracker.h2
//  Jh3 = interface; //com.bytedance.bdtracker.h3
//  Jh4_a = interface; //com.bytedance.bdtracker.h4$a
//  Jh4 = interface; //com.bytedance.bdtracker.h4
//  Ji = interface; //com.bytedance.bdtracker.i
//  Ji0 = interface; //com.bytedance.bdtracker.i0
//  Ji1 = interface; //com.bytedance.bdtracker.i1
//  Ji2 = interface; //com.bytedance.bdtracker.i2
//  Ji3 = interface; //com.bytedance.bdtracker.i3
//  Ji4_a = interface; //com.bytedance.bdtracker.i4$a
//  Ji4 = interface; //com.bytedance.bdtracker.i4
//  Jj = interface; //com.bytedance.bdtracker.j
//  Jj0 = interface; //com.bytedance.bdtracker.j0
//  Jj1 = interface; //com.bytedance.bdtracker.j1
//  Jj2 = interface; //com.bytedance.bdtracker.j2
//  Jj3 = interface; //com.bytedance.bdtracker.j3
//  Jj4 = interface; //com.bytedance.bdtracker.j4
//  Jk = interface; //com.bytedance.bdtracker.k
//  Jk0_a = interface; //com.bytedance.bdtracker.k0$a
//  Jk0_b = interface; //com.bytedance.bdtracker.k0$b
//  Jk0 = interface; //com.bytedance.bdtracker.k0
//  Jk1 = interface; //com.bytedance.bdtracker.k1
//  Jk2 = interface; //com.bytedance.bdtracker.k2
//  Jk3 = interface; //com.bytedance.bdtracker.k3
//  Jk4 = interface; //com.bytedance.bdtracker.k4
//  Jl_a = interface; //com.bytedance.bdtracker.l$a
//  Jl = interface; //com.bytedance.bdtracker.l
//  Jl0 = interface; //com.bytedance.bdtracker.l0
//  Jl1_a = interface; //com.bytedance.bdtracker.l1$a
//  Jl1 = interface; //com.bytedance.bdtracker.l1
//  Jl2 = interface; //com.bytedance.bdtracker.l2
//  Jl3 = interface; //com.bytedance.bdtracker.l3
//  Jl4 = interface; //com.bytedance.bdtracker.l4
//  Jm_a = interface; //com.bytedance.bdtracker.m$a
//  Jm = interface; //com.bytedance.bdtracker.m
//  Jm0 = interface; //com.bytedance.bdtracker.m0
//  Jm1 = interface; //com.bytedance.bdtracker.m1
//  Jm2 = interface; //com.bytedance.bdtracker.m2
//  Jm3 = interface; //com.bytedance.bdtracker.m3
//  Jm4 = interface; //com.bytedance.bdtracker.m4
//  Jn = interface; //com.bytedance.bdtracker.n
//  Jn0 = interface; //com.bytedance.bdtracker.n0
//  Jn1_a = interface; //com.bytedance.bdtracker.n1$a
//  Jn1 = interface; //com.bytedance.bdtracker.n1
//  Jn2_a = interface; //com.bytedance.bdtracker.n2$a
//  Jn2 = interface; //com.bytedance.bdtracker.n2
//  Jn3 = interface; //com.bytedance.bdtracker.n3
//  Jn4 = interface; //com.bytedance.bdtracker.n4
//  Jo_a = interface; //com.bytedance.bdtracker.o$a
//  Jo = interface; //com.bytedance.bdtracker.o
//  Jo0 = interface; //com.bytedance.bdtracker.o0
//  Jo1 = interface; //com.bytedance.bdtracker.o1
//  Jo2 = interface; //com.bytedance.bdtracker.o2
//  Jo3 = interface; //com.bytedance.bdtracker.o3
//  Jo4 = interface; //com.bytedance.bdtracker.o4
//  Jp = interface; //com.bytedance.bdtracker.p
//  Jp0 = interface; //com.bytedance.bdtracker.p0
//  Jp1 = interface; //com.bytedance.bdtracker.p1
//  Jp2 = interface; //com.bytedance.bdtracker.p2
//  Jp3_a = interface; //com.bytedance.bdtracker.p3$a
//  Jp3 = interface; //com.bytedance.bdtracker.p3
//  Jp4 = interface; //com.bytedance.bdtracker.p4
//  Jq = interface; //com.bytedance.bdtracker.q
//  Jq0_a = interface; //com.bytedance.bdtracker.q0$a
//  Jq0_b = interface; //com.bytedance.bdtracker.q0$b
//  Jq0_c = interface; //com.bytedance.bdtracker.q0$c
//  Jq0_d = interface; //com.bytedance.bdtracker.q0$d
//  Jq0_e = interface; //com.bytedance.bdtracker.q0$e
//  Jq0 = interface; //com.bytedance.bdtracker.q0
//  Jq1 = interface; //com.bytedance.bdtracker.q1
//  Jq2 = interface; //com.bytedance.bdtracker.q2
//  Jq3 = interface; //com.bytedance.bdtracker.q3
//  Jq4_a = interface; //com.bytedance.bdtracker.q4$a
//  Jq4 = interface; //com.bytedance.bdtracker.q4
//  Jr = interface; //com.bytedance.bdtracker.r
//  Jr0 = interface; //com.bytedance.bdtracker.r0
//  Jr1 = interface; //com.bytedance.bdtracker.r1
//  Jr2 = interface; //com.bytedance.bdtracker.r2
//  Jr3 = interface; //com.bytedance.bdtracker.r3
//  Jr4_a = interface; //com.bytedance.bdtracker.r4$a
//  Jr4 = interface; //com.bytedance.bdtracker.r4
//  Js = interface; //com.bytedance.bdtracker.s
//  Js0 = interface; //com.bytedance.bdtracker.s0
//  Js1 = interface; //com.bytedance.bdtracker.s1
//  Js2 = interface; //com.bytedance.bdtracker.s2
//  Js3 = interface; //com.bytedance.bdtracker.s3
//  Js4 = interface; //com.bytedance.bdtracker.s4
//  Jt = interface; //com.bytedance.bdtracker.t
//  Jt0 = interface; //com.bytedance.bdtracker.t0
//  Jt1 = interface; //com.bytedance.bdtracker.t1
//  Jt2_a = interface; //com.bytedance.bdtracker.t2$a
//  Jt2_b = interface; //com.bytedance.bdtracker.t2$b
//  Jt2 = interface; //com.bytedance.bdtracker.t2
//  Jt3 = interface; //com.bytedance.bdtracker.t3
//  Jt4_a = interface; //com.bytedance.bdtracker.t4$a
//  Jt4 = interface; //com.bytedance.bdtracker.t4
//  Ju = interface; //com.bytedance.bdtracker.u
//  Ju0 = interface; //com.bytedance.bdtracker.u0
//  Ju1 = interface; //com.bytedance.bdtracker.u1
//  Ju2_a = interface; //com.bytedance.bdtracker.u2$a
//  Ju2 = interface; //com.bytedance.bdtracker.u2
//  Ju3 = interface; //com.bytedance.bdtracker.u3
//  Ju4 = interface; //com.bytedance.bdtracker.u4
//  Jv = interface; //com.bytedance.bdtracker.v
//  Jv0 = interface; //com.bytedance.bdtracker.v0
//  Jv1 = interface; //com.bytedance.bdtracker.v1
//  Jv2 = interface; //com.bytedance.bdtracker.v2
//  Jv3 = interface; //com.bytedance.bdtracker.v3
//  Jv4 = interface; //com.bytedance.bdtracker.v4
//  Jw_a = interface; //com.bytedance.bdtracker.w$a
//  Jw_b = interface; //com.bytedance.bdtracker.w$b
//  Jw = interface; //com.bytedance.bdtracker.w
//  Jw0 = interface; //com.bytedance.bdtracker.w0
//  Jw1 = interface; //com.bytedance.bdtracker.w1
//  Jw2 = interface; //com.bytedance.bdtracker.w2
//  Jw3 = interface; //com.bytedance.bdtracker.w3
//  Jw4 = interface; //com.bytedance.bdtracker.w4
//  Jx = interface; //com.bytedance.bdtracker.x
//  Jx0 = interface; //com.bytedance.bdtracker.x0
//  Jx1 = interface; //com.bytedance.bdtracker.x1
//  Jx2 = interface; //com.bytedance.bdtracker.x2
//  Jx3 = interface; //com.bytedance.bdtracker.x3
//  Jx4_a = interface; //com.bytedance.bdtracker.x4$a
//  Jx4_b = interface; //com.bytedance.bdtracker.x4$b
//  Jx4 = interface; //com.bytedance.bdtracker.x4
//  Jy = interface; //com.bytedance.bdtracker.y
//  Jy0 = interface; //com.bytedance.bdtracker.y0
//  Jy1 = interface; //com.bytedance.bdtracker.y1
//  Jy2_a = interface; //com.bytedance.bdtracker.y2$a
//  Jy2_b = interface; //com.bytedance.bdtracker.y2$b
//  Jy2 = interface; //com.bytedance.bdtracker.y2
//  Jy3 = interface; //com.bytedance.bdtracker.y3
//  Jz = interface; //com.bytedance.bdtracker.z
//  Jz0 = interface; //com.bytedance.bdtracker.z0
//  Jz1 = interface; //com.bytedance.bdtracker.z1
//  Jz2 = interface; //com.bytedance.bdtracker.z2
//  Jz3 = interface; //com.bytedance.bdtracker.z3
//  Ja_a_a = interface; //com.bytedance.dr.aidl.a$a$a
//  Ja_a = interface; //com.bytedance.dr.aidl.a$a
//  Ja_293 = interface; //com.bytedance.dr.aidl.a
//  Jb_a_a = interface; //com.bytedance.dr.aidl.b$a$a
//  Jb_a_295 = interface; //com.bytedance.dr.aidl.b$a
//  Jb_296 = interface; //com.bytedance.dr.aidl.b
//  Jc_a_a = interface; //com.bytedance.dr.aidl.c$a$a
//  Jc_a_298 = interface; //com.bytedance.dr.aidl.c$a
//  Jc_299 = interface; //com.bytedance.dr.aidl.c
//  Jd_a_a = interface; //com.bytedance.dr.aidl.d$a$a
//  Jd_a_301 = interface; //com.bytedance.dr.aidl.d$a
//  Jd_302 = interface; //com.bytedance.dr.aidl.d
//  Je_a_a = interface; //com.bytedance.dr.aidl.e$a$a
//  Je_a = interface; //com.bytedance.dr.aidl.e$a
//  Je_305 = interface; //com.bytedance.dr.aidl.e
//  Jf_a_a = interface; //com.bytedance.dr.aidl.f$a$a
//  Jf_a = interface; //com.bytedance.dr.aidl.f$a
//  Jf_308 = interface; //com.bytedance.dr.aidl.f
//  Jg_a_a = interface; //com.bytedance.dr.aidl.g$a$a
//  Jg_a = interface; //com.bytedance.dr.aidl.g$a
//  Jg_311 = interface; //com.bytedance.dr.aidl.g
//  Ja_a_312 = interface; //com.bytedance.dr.impl.a$a
//  Ja_313 = interface; //com.bytedance.dr.impl.a
//  Jb_a_314 = interface; //com.bytedance.dr.impl.b$a
//  Jb_315 = interface; //com.bytedance.dr.impl.b
//  Jc_a_316 = interface; //com.bytedance.dr.impl.c$a
//  Jc_317 = interface; //com.bytedance.dr.impl.c
//  Jd_a_318 = interface; //com.bytedance.dr.impl.d$a
//  Jd_319 = interface; //com.bytedance.dr.impl.d
//  Je_a_320 = interface; //com.bytedance.dr.impl.e$a
//  Je_b = interface; //com.bytedance.dr.impl.e$b
//  Je_322 = interface; //com.bytedance.dr.impl.e
//  Jf_323 = interface; //com.bytedance.dr.impl.f
//  Jg_a_324 = interface; //com.bytedance.dr.impl.g$a
//  Jg_325 = interface; //com.bytedance.dr.impl.g
//  Jh_a = interface; //com.bytedance.dr.impl.h$a
//  Jh_327 = interface; //com.bytedance.dr.impl.h
//  Ji_328 = interface; //com.bytedance.dr.impl.i
//  Jj_a = interface; //com.bytedance.dr.impl.j$a
//  Jj_330 = interface; //com.bytedance.dr.impl.j
//  Jk_a = interface; //com.bytedance.dr.impl.k$a
//  Jk_b = interface; //com.bytedance.dr.impl.k$b
//  Jk_333 = interface; //com.bytedance.dr.impl.k
//  Jl_a_334 = interface; //com.bytedance.dr.impl.l$a
//  Jl_335 = interface; //com.bytedance.dr.impl.l
//  Jm_336 = interface; //com.bytedance.dr.impl.m
//  JOaidApi_a = interface; //com.bytedance.dr.OaidApi$a
  JOaidApi = interface; //com.bytedance.dr.OaidApi
  JOaidFactory = interface; //com.bytedance.dr.OaidFactory

// ===== Forward SuperClasses declarations =====

//  Jg1Class = interface; //com.bytedance.bdtracker.g1
//  Ja0Class = interface; //com.bytedance.bdtracker.a0
//  Jc0_cClass = interface; //com.bytedance.bdtracker.c0$c
//  Je3Class = interface; //com.bytedance.bdtracker.e3
//  Js3Class = interface; //com.bytedance.bdtracker.s3
//  Jk3Class = interface; //com.bytedance.bdtracker.k3
//  Jd3Class = interface; //com.bytedance.bdtracker.d3
//  Jq3Class = interface; //com.bytedance.bdtracker.q3
//  JoClass = interface; //com.bytedance.bdtracker.o
//  Jm0Class = interface; //com.bytedance.bdtracker.m0
  JRangersHttpExceptionClass = interface; //com.bytedance.applog.network.RangersHttpException
//  Jp4Class = interface; //com.bytedance.bdtracker.p4
//  Jr0Class = interface; //com.bytedance.bdtracker.r0
//  Jb_315Class = interface; //com.bytedance.dr.impl.b
//  JOaidApi_aClass = interface; //com.bytedance.dr.OaidApi$a

// ===== Interface declarations =====

  JIALinkListenerClass = interface(JObjectClass)
  ['{98A1F93D-C70B-4CAE-915A-9B686EC1E729}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/alink/IALinkListener')]
  JIALinkListener = interface(IJavaInstance)
  ['{6CF95664-27A3-4579-AE8F-4087711D140A}']
    { Property Methods }

    { methods }
    procedure onALinkData(P1: JMap; P2: JException); cdecl;
    procedure onAttributionData(P1: JMap; P2: JException); cdecl;

    { Property }
  end;

  TJIALinkListener = class(TJavaGenericImport<JIALinkListenerClass, JIALinkListener>) end;

  JPageMetaClass = interface(JObjectClass)
  ['{5EAFB6D6-2E79-4D93-BBAD-5B879F8053A0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/annotation/PageMeta')]
  JPageMeta = interface(IJavaInstance)
  ['{6FEB696D-4A63-439E-93B1-1B63FB80C21F}']
    { Property Methods }

    { methods }
    function title: JString; cdecl;
    function path: JString; cdecl;

    { Property }
  end;

  TJPageMeta = class(TJavaGenericImport<JPageMetaClass, JPageMeta>) end;

  JAppLogClass = interface(JObjectClass)
  ['{C0916F0F-2E43-4A53-87A0-88D2E8D00993}']
    { static Property Methods }
    {class} function _Geta: JIAppLogInstance;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAppLog; cdecl; overload;
    {class} function getInstance: JIAppLogInstance; cdecl;
    {class} function getContext: JContext; cdecl;
//    {class} procedure setAppContext(P1: Jf); cdecl;
//    {class} function getAppContext: Jf; cdecl;
    {class} function newInstance: JIAppLogInstance; cdecl;
    {class} procedure init(P1: JContext; P2: JInitConfig); cdecl; overload;
    {class} procedure init(P1: JContext; P2: JInitConfig; P3: JActivity); cdecl; overload;
    {class} procedure start; cdecl;
    {class} function hasStarted: Boolean; cdecl;
    {class} function getInitConfig: JInitConfig; cdecl;
    {class} procedure flush; cdecl;
    {class} function isH5BridgeEnable: Boolean; cdecl;
    {class} function isH5CollectEnable: Boolean; cdecl;
    {class} procedure setUserID(P1: Int64); cdecl;
    {class} procedure setAppLanguageAndRegion(P1: JString; P2: JString); cdecl;
    {class} procedure setGoogleAid(P1: JString); cdecl;
    {class} function addNetCommonParams(P1: JContext; P2: JString; P3: Boolean; P4: JLevel): JString; cdecl;
    {class} procedure putCommonParams(P1: JContext; P2: JMap; P3: Boolean; P4: JLevel); cdecl;
    {class} procedure setUserUniqueID(P1: JString); cdecl; overload;
    {class} procedure setUserUniqueID(P1: JString; P2: JString); cdecl; overload;
    {class} procedure setExtraParams(P1: JIExtraParams); cdecl;
    {class} procedure setActiveCustomParams(P1: JIActiveCustomParamsCallback); cdecl;
    {class} function getActiveCustomParams: JIActiveCustomParamsCallback; cdecl;
    {class} procedure setTouchPoint(P1: JString); cdecl;
    {class} procedure setHeaderInfo(P1: JHashMap); cdecl; overload;
    {class} procedure setHeaderInfo(P1: JString; P2: JObject); cdecl; overload;
    {class} procedure removeHeaderInfo(P1: JString); cdecl;
    {class} procedure setExternalAbVersion(P1: JString); cdecl;
    {class} function getAbSdkVersion: JString; cdecl;
    {class} function getAbConfig(P1: JString; P2: JObject): JObject; cdecl;
    {class} procedure pullAbTestConfigs; cdecl; overload;
    {class} procedure pullAbTestConfigs(P1: Integer; P2: JIPullAbTestConfigCallback); cdecl; overload;
    {class} procedure setPullAbTestConfigsThrottleMills(P1: JLong); cdecl;
    {class} function getAid: JString; cdecl;
    {class} function getAppId: JString; cdecl;
//    {class} function getHeaderValue(P1: JString; P2: JObject; P3: JClass): JObject; cdecl;
    {class} procedure setTracerData(P1: JJSONObject); cdecl;
    {class} procedure setUserAgent(P1: JString); cdecl;
    {class} procedure onEventV3(P1: JString); cdecl; overload;
    {class} procedure onEventV3(P1: JString; P2: JJSONObject); cdecl; overload;
    {class} procedure onEventV3(P1: JString; P2: JJSONObject; P3: Integer); cdecl; overload;
    {class} procedure onEventV3(P1: JString; P2: JBundle; P3: Integer); cdecl; overload;
    {class} procedure onEventV3(P1: JString; P2: JBundle); cdecl; overload;
    {class} function newEvent(P1: JString): JEventBuilder; cdecl;
    {class} procedure onMiscEvent(P1: JString; P2: JJSONObject); cdecl;
    {class} procedure setEncryptAndCompress(P1: Boolean); cdecl;
    {class} function getEncryptAndCompress: Boolean; cdecl;
    {class} function manualActivate: Boolean; cdecl;
    {class} procedure setForbidReportPhoneDetailInfo(P1: Boolean); cdecl;
    {class} function reportPhoneDetailInfo: Boolean; cdecl;
    {class} function getDid: JString; cdecl;
    {class} function getUdid: JString; cdecl;
    {class} procedure addSessionHook(P1: JISessionObserver); cdecl;
    {class} procedure removeSessionHook(P1: JISessionObserver); cdecl;
    {class} procedure addEventObserver(P1: JIEventObserver); cdecl;
    {class} procedure removeEventObserver(P1: JIEventObserver); cdecl;
//    {class} procedure setAccount(P1: JAccount); cdecl;
    {class} function getIid: JString; cdecl;
    {class} function getSsid: JString; cdecl;
    {class} function getUserUniqueID: JString; cdecl;
    {class} function getUserID: JString; cdecl;
    {class} function getClientUdid: JString; cdecl;
    {class} function getOpenUdid: JString; cdecl;
    {class} procedure setUriRuntime(P1: JUriConfig); cdecl;
    {class} procedure getSsidGroup(P1: JMap); cdecl;
    {class} procedure addDataObserver(P1: JIDataObserver); cdecl;
    {class} procedure removeDataObserver(P1: JIDataObserver); cdecl;
    {class} procedure removeAllDataObserver; cdecl;
    {class} procedure setOaidObserver(P1: JIOaidObserver); cdecl;
    {class} procedure removeOaidObserver(P1: JIOaidObserver); cdecl;
    {class} function getNetClient: JINetworkClient; cdecl;
    {class} function getHeader: JJSONObject; cdecl;
    {class} procedure setAppTrack(P1: JJSONObject); cdecl;
    {class} function isNewUser: Boolean; cdecl;
    {class} procedure onResume(P1: JContext); cdecl;
    {class} procedure onPause(P1: JContext); cdecl;
    {class} procedure onActivityResumed(P1: JActivity; P2: Integer); cdecl;
    {class} procedure onActivityPause; cdecl;
    {class} procedure registerHeaderCustomCallback(P1: JIHeaderCustomTimelyCallback); cdecl;
    {class} function getHeaderCustomCallback: JIHeaderCustomTimelyCallback; cdecl;
    {class} procedure userProfileSetOnce(P1: JJSONObject; P2: JUserProfileCallback); cdecl;
    {class} procedure userProfileSync(P1: JJSONObject; P2: JUserProfileCallback); cdecl;
    {class} procedure startSimulator(P1: JString); cdecl;
    {class} procedure setRangersEventVerifyEnable(P1: Boolean; P2: JString); cdecl;
    {class} procedure profileSet(P1: JJSONObject); cdecl;
    {class} procedure profileSetOnce(P1: JJSONObject); cdecl;
    {class} procedure profileUnset(P1: JString); cdecl;
    {class} procedure profileIncrement(P1: JJSONObject); cdecl;
    {class} procedure profileAppend(P1: JJSONObject); cdecl;
    {class} procedure setEventFilterByClient(P1: JList; P2: Boolean); cdecl;
    {class} function getRequestHeader: JMap; cdecl;
    {class} function getSessionId: JString; cdecl;
    {class} procedure setALinkListener(P1: JIALinkListener); cdecl;
    {class} procedure setClipboardEnabled(P1: Boolean); cdecl;
    {class} procedure activateALink(P1: JUri); cdecl;
    {class} function getSdkVersion: JString; cdecl;
    {class} function getAllAbTestConfigs: JJSONObject; cdecl;
    {class} procedure setPrivacyMode(P1: Boolean); cdecl;
    {class} function isPrivacyMode: Boolean; cdecl;
    {class} procedure setViewId(P1: JView; P2: JString); cdecl; overload;
    {class} procedure setViewId(P1: JDialog; P2: JString); cdecl; overload;
    {class} procedure setViewId(P1: JObject; P2: JString); cdecl; overload;
    {class} procedure setViewProperties(P1: JView; P2: JJSONObject); cdecl;
    {class} function getViewProperties(P1: JView): JJSONObject; cdecl;
//    {class} procedure ignoreAutoTrackPage(P1: TJavaObjectArray<JClass>); cdecl;
//    {class} function isAutoTrackPageIgnored(P1: JClass): Boolean; cdecl;
    {class} procedure ignoreAutoTrackClick(P1: JView); cdecl;
//    {class} procedure ignoreAutoTrackClickByViewType(P1: TJavaObjectArray<JClass>); cdecl;
    {class} function isAutoTrackClickIgnored(P1: JView): Boolean; cdecl;
    {class} procedure trackPage(P1: JObject); cdecl; overload;
    {class} procedure trackPage(P1: JObject; P2: JJSONObject); cdecl; overload;
    {class} procedure trackPage(P1: JActivity); cdecl; overload;
    {class} procedure trackPage(P1: JActivity; P2: JJSONObject); cdecl; overload;
    {class} procedure trackClick(P1: JView); cdecl; overload;
    {class} procedure trackClick(P1: JView; P2: JJSONObject); cdecl; overload;
    {class} procedure setEventHandler(P1: JIEventHandler); cdecl;
    {class} procedure initH5Bridge(P1: JView; P2: JString); cdecl;
    {class} procedure setGPSLocation(P1: Single; P2: Single; P3: JString); cdecl;
    {class} procedure startDurationEvent(P1: JString); cdecl;
    {class} procedure pauseDurationEvent(P1: JString); cdecl;
    {class} procedure resumeDurationEvent(P1: JString); cdecl;
    {class} procedure stopDurationEvent(P1: JString; P2: JJSONObject); cdecl;
    {class} function getViewExposureManager: JViewExposureManager; cdecl;
    {class} procedure clearDb; cdecl;
    {class} procedure initWebViewBridge(P1: JView; P2: JString); cdecl;
    {class} procedure bind(P1: JMap; P2: JIDBindCallback); cdecl;
//    {class} function init: JAppLog; cdecl; overload;

    { static Property }
    {class} property a: JIAppLogInstance read _Geta;
    {class} property b: Boolean read _Getb;
  end;

  [JavaSignature('com/bytedance/applog/AppLog')]
  JAppLog = interface(JObject)
  ['{139CB059-DF28-4693-B02E-3A6A1BB35A74}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAppLog = class(TJavaGenericImport<JAppLogClass, JAppLog>) end;

  JAppLogManagerClass = interface(JObjectClass)
  ['{314494E0-0920-41E5-93F6-B36EF70AE096}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAppLogManager; cdecl;
    {class} function getInstance(P1: JString): JIAppLogInstance; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/AppLogManager')]
  JAppLogManager = interface(JObject)
  ['{FD551342-7A07-404A-95B6-BFD06CFBCE07}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAppLogManager = class(TJavaGenericImport<JAppLogManagerClass, JAppLogManager>) end;

  JCollectorClass = interface(JBroadcastReceiverClass) // or JObjectClass
  ['{43C70F04-DE16-433C-AA1D-F7A56CECC971}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCollector; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/collector/Collector')]
  JCollector = interface(JBroadcastReceiver) // or JObject
  ['{C2A5B47C-7040-4159-833A-9B94194AF282}']
    { Property Methods }

    { methods }
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;

    { Property }
  end;

  TJCollector = class(TJavaGenericImport<JCollectorClass, JCollector>) end;

  JAutoTrackEventTypeClass = interface(JObjectClass)
  ['{2AB77A2D-C2B9-45CC-87B7-635D6266BE55}']
    { static Property Methods }
    {class} function _GetALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLICK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAGE_LEAVE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAutoTrackEventType; cdecl;
    {class} function a(P1: Integer; P2: Integer): Boolean; cdecl;

    { static Property }
    {class} property ALL: Integer read _GetALL;
    {class} property PAGE: Integer read _GetPAGE;
    {class} property CLICK: Integer read _GetCLICK;
    {class} property PAGE_LEAVE: Integer read _GetPAGE_LEAVE;
  end;

  [JavaSignature('com/bytedance/applog/event/AutoTrackEventType')]
  JAutoTrackEventType = interface(JObject)
  ['{9F4304D7-41C7-4AA2-947E-E77A6CE5E891}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAutoTrackEventType = class(TJavaGenericImport<JAutoTrackEventTypeClass, JAutoTrackEventType>) end;

  JEventBuilderClass = interface(JObjectClass)
  ['{37CA5450-AA19-4379-873E-5469706DCC36}']
    { static Property Methods }

    { static Methods }
//    {class} function init(P1: Jd): JEventBuilder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/event/EventBuilder')]
  JEventBuilder = interface(JObject)
  ['{94C37514-594A-4261-A757-8C175988E553}']
    { Property Methods }
//    function _Geta: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getd: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd(ad: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function setEvent(P1: JString): JEventBuilder; cdecl;
    function setAbSdkVersion(P1: JString): JEventBuilder; cdecl;
    function addParam(P1: JString; P2: JObject): JEventBuilder; cdecl;
//    function build: Jk3; cdecl;
    procedure track; cdecl;

    { Property }
//    property a: Jd read _Geta write _Seta;
    property b: JString read _Getb write _Setb;
    property c: JString read _Getc write _Setc;
    property d: JJSONObject read _Getd write _Setd;
  end;

  TJEventBuilder = class(TJavaGenericImport<JEventBuilderClass, JEventBuilder>) end;

  JEventPolicyClass = interface(JEnumClass) // or JObjectClass
  ['{81AC9C8F-2DBD-42CF-AFC3-78288E2365F2}']
    { static Property Methods }
    {class} function _GetACCEPT: JEventPolicy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDENY: JEventPolicy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Get_VALUES: TJavaObjectArray<JEventPolicy>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JEventPolicy>; cdecl;
    {class} function valueOf(P1: JString): JEventPolicy; cdecl;
    {class} function init(P1: JString; P2: Integer): JEventPolicy; cdecl; overload;
    {class} function init: JEventPolicy; cdecl; overload;

    { static Property }
    {class} property ACCEPT: JEventPolicy read _GetACCEPT;
    {class} property DENY: JEventPolicy read _GetDENY;
    {class} property _VALUES: TJavaObjectArray<JEventPolicy> read _Get_VALUES;
  end;

  [JavaSignature('com/bytedance/applog/event/EventPolicy')]
  JEventPolicy = interface(JEnum) // or JObject
  ['{8C2DB420-BCBA-4213-9464-EB62C21E2038}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEventPolicy = class(TJavaGenericImport<JEventPolicyClass, JEventPolicy>) end;

  JEventTypeClass = interface(JObjectClass)
  ['{3558D567-F2F3-477B-BFDF-7BEB3A3F7F32}']
    { static Property Methods }
    {class} function _GetEVENT_ALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUSER_EVENT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEVENT_PROFILE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEVENT_PAGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEVENT_CLICK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JEventType; cdecl;
    {class} function a(P1: Integer; P2: Integer): Boolean; cdecl;

    { static Property }
    {class} property EVENT_ALL: Integer read _GetEVENT_ALL;
    {class} property USER_EVENT: Integer read _GetUSER_EVENT;
    {class} property EVENT_PROFILE: Integer read _GetEVENT_PROFILE;
    {class} property EVENT_PAGE: Integer read _GetEVENT_PAGE;
    {class} property EVENT_CLICK: Integer read _GetEVENT_CLICK;
  end;

  [JavaSignature('com/bytedance/applog/event/EventType')]
  JEventType = interface(JObject)
  ['{6ED664CC-9FB9-44C6-927B-5A969D1A60A2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEventType = class(TJavaGenericImport<JEventTypeClass, JEventType>) end;

  JIEventHandlerClass = interface(JObjectClass)
  ['{90997A92-0D22-428A-9101-26A849DEF619}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/event/IEventHandler')]
  JIEventHandler = interface(IJavaInstance)
  ['{85BDCE8C-89E0-424C-84F9-3925B7D6AB7F}']
    { Property Methods }

    { methods }
    function acceptType: Integer; cdecl;
    function onReceive(P1: Integer; P2: JString; P3: JJSONObject): JEventPolicy; cdecl;

    { Property }
  end;

  TJIEventHandler = class(TJavaGenericImport<JIEventHandlerClass, JIEventHandler>) end;

  JAppCrashTypeClass = interface(JObjectClass)
  ['{72F0EDB8-D474-4348-8F0E-F99E343A5EF1}']
    { static Property Methods }
    {class} function _GetALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJAVA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAppCrashType; cdecl;
    {class} function hasCrashType(P1: Integer; P2: Integer): Boolean; cdecl;
    {class} function hasJavaCrashType(P1: Integer): Boolean; cdecl;

    { static Property }
    {class} property ALL: Integer read _GetALL;
    {class} property JAVA: Integer read _GetJAVA;
  end;

  [JavaSignature('com/bytedance/applog/exception/AppCrashType')]
  JAppCrashType = interface(JObject)
  ['{495154A1-5964-4F7B-897D-161D31378175}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAppCrashType = class(TJavaGenericImport<JAppCrashTypeClass, JAppCrashType>) end;

  JViewExposureConfigClass = interface(JObjectClass)
  ['{CA690DC3-3B6B-4BC9-8BAF-285C1DB5383D}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JFloat; P2: JBoolean): JViewExposureConfig; cdecl; overload;
//    {class} function init(P1: JFloat; P2: JBoolean; P3: Integer; P4: JDefaultConstructorMarker): JViewExposureConfig; cdecl; overload;
    {class} function init: JViewExposureConfig; cdecl; overload;
    {class} function copy_default(P1: JViewExposureConfig; P2: JFloat; P3: JBoolean; P4: Integer; P5: JObject): JViewExposureConfig; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/exposure/ViewExposureConfig')]
  JViewExposureConfig = interface(JObject)
  ['{6BE78BDD-B804-42A4-8FBD-71C76DA7174F}']
    { Property Methods }
    function _Geta: JFloat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JFloat);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: JBoolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: JBoolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getAreaRatio: JFloat; cdecl;
    function getVisualDiagnosis: JBoolean; cdecl;
    function component1: JFloat; cdecl;
    function component2: JBoolean; cdecl;
    function copy(P1: JFloat; P2: JBoolean): JViewExposureConfig; cdecl;
    function toString: JString; cdecl;
    function hashCode: Integer; cdecl;
    function equals(P1: JObject): Boolean; cdecl;

    { Property }
    property a: JFloat read _Geta write _Seta;
    property b: JBoolean read _Getb write _Setb;
  end;

  TJViewExposureConfig = class(TJavaGenericImport<JViewExposureConfigClass, JViewExposureConfig>) end;

  JViewExposureDataClass = interface(JObjectClass)
  ['{3A912ADB-2542-4704-AA2F-18DC4FC0E87C}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JJSONObject; P3: JViewExposureConfig): JViewExposureData; cdecl; overload;
//    {class} function init(P1: JString; P2: JJSONObject; P3: JViewExposureConfig; P4: Integer; P5: JDefaultConstructorMarker): JViewExposureData; cdecl; overload;
    {class} function init: JViewExposureData; cdecl; overload;
    {class} function copy_default(P1: JViewExposureData; P2: JString; P3: JJSONObject; P4: JViewExposureConfig; P5: Integer; P6: JObject): JViewExposureData; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/exposure/ViewExposureData')]
  JViewExposureData = interface(JObject)
  ['{1C4C3429-68C1-45B0-AD48-4388E12A752A}']
    { Property Methods }
    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: JViewExposureConfig;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JViewExposureConfig);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getEventName: JString; cdecl;
    function getProperties: JJSONObject; cdecl;
    function getConfig: JViewExposureConfig; cdecl;
    procedure setConfig(P1: JViewExposureConfig); cdecl;
    function component1: JString; cdecl;
    function component2: JJSONObject; cdecl;
    function component3: JViewExposureConfig; cdecl;
    function copy(P1: JString; P2: JJSONObject; P3: JViewExposureConfig): JViewExposureData; cdecl;
    function toString: JString; cdecl;
    function hashCode: Integer; cdecl;
    function equals(P1: JObject): Boolean; cdecl;

    { Property }
    property a: JString read _Geta write _Seta;
    property b: JJSONObject read _Getb write _Setb;
    property c: JViewExposureConfig read _Getc write _Setc;
  end;

  TJViewExposureData = class(TJavaGenericImport<JViewExposureDataClass, JViewExposureData>) end;

//  JViewExposureManager_aClass = interface(JObjectClass)
//  ['{9174EDD7-58D9-4873-8051-8F5998C177EE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDefaultConstructorMarker): JViewExposureManager_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$a')]
//  JViewExposureManager_a = interface(JObject)
//  ['{5D4B251D-69C4-4901-8210-DAEEF7CC9AF4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJViewExposureManager_a = class(TJavaGenericImport<JViewExposureManager_aClass, JViewExposureManager_a>) end;

//  JViewExposureManager_bClass = interface(JObjectClass)
//  ['{075E91B5-DB35-4900-9CE5-E640EA3D04F3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager): JViewExposureManager_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$b')]
//  JViewExposureManager_b = interface(JObject)
//  ['{D4479CE5-F0B5-435F-8936-4D2ECEADB133}']
//    { Property Methods }
//    function _Geta: JViewExposureManager;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JViewExposureManager);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JViewExposureManager read _Geta write _Seta;
//  end;

//  TJViewExposureManager_b = class(TJavaGenericImport<JViewExposureManager_bClass, JViewExposureManager_b>) end;

//  JViewExposureManager_cClass = interface(JLambdaClass) // or JObjectClass
//  ['{19CEA676-8AEC-4231-B21B-FC6C29C9ED5E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager; P2: JActivity): JViewExposureManager_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$c')]
//  JViewExposureManager_c = interface(JLambda) // or JObject
//  ['{A602AB45-AC01-467B-A4DF-B32F22C2F317}']
//    { Property Methods }
//    function _Geta: JViewExposureManager;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JViewExposureManager);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JActivity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JActivity);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function invoke: JObject; cdecl;
//
//    { Property }
//    property a: JViewExposureManager read _Geta write _Seta;
//    property b: JActivity read _Getb write _Setb;
//  end;

//  TJViewExposureManager_c = class(TJavaGenericImport<JViewExposureManager_cClass, JViewExposureManager_c>) end;

//  JViewExposureManager_dClass = interface(JLambdaClass) // or JObjectClass
//  ['{841EA669-BB60-445A-85A6-70570E22E011}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager; P2: JView): JViewExposureManager_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$d')]
//  JViewExposureManager_d = interface(JLambda) // or JObject
//  ['{E44CB083-724C-4878-A42E-5968F0A4AFC9}']
//    { Property Methods }
//    function _Geta: JViewExposureManager;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JViewExposureManager);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function invoke: JObject; cdecl;
//
//    { Property }
//    property a: JViewExposureManager read _Geta write _Seta;
//    property b: JView read _Getb write _Setb;
//  end;

//  TJViewExposureManager_d = class(TJavaGenericImport<JViewExposureManager_dClass, JViewExposureManager_d>) end;

//  JViewExposureManager_eClass = interface(JLambdaClass) // or JObjectClass
//  ['{6DBBF371-6A29-4B50-92E1-AAEFEBA0E2A8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager; P2: JView; P3: JViewExposureData): JViewExposureManager_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$e')]
//  JViewExposureManager_e = interface(JLambda) // or JObject
//  ['{A98E0C56-CC1A-4DF0-9167-3C63F580B650}']
//    { Property Methods }
//    function _Geta: JViewExposureManager;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JViewExposureManager);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JViewExposureData;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JViewExposureData);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function invoke: JObject; cdecl;
//
//    { Property }
//    property a: JViewExposureManager read _Geta write _Seta;
//    property b: JView read _Getb write _Setb;
//    property c: JViewExposureData read _Getc write _Setc;
//  end;

//  TJViewExposureManager_e = class(TJavaGenericImport<JViewExposureManager_eClass, JViewExposureManager_e>) end;

//  JViewExposureManager_fClass = interface(JLambdaClass) // or JObjectClass
//  ['{11F93FAC-67B9-4198-A6D2-9E60D3906DD3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager; P2: JViewExposureData; P3: JView): JViewExposureManager_f; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$f')]
//  JViewExposureManager_f = interface(JLambda) // or JObject
//  ['{0BDB1BA8-DF68-47A9-85DF-46A5579553E3}']
//    { Property Methods }
//    function _Geta: JViewExposureManager;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JViewExposureManager);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JViewExposureData;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JViewExposureData);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function invoke: JObject; cdecl;
//
//    { Property }
//    property a: JViewExposureManager read _Geta write _Seta;
//    property b: JViewExposureData read _Getb write _Setb;
//    property c: JView read _Getc write _Setc;
//  end;

//  TJViewExposureManager_f = class(TJavaGenericImport<JViewExposureManager_fClass, JViewExposureManager_f>) end;

  JViewExposureManagerClass = interface(JObjectClass)
  ['{FD09870E-B73A-4E25-9FEF-11176F4CC32F}']
    { static Property Methods }
    {class} function _Geth: JViewExposureConfig;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetCompanion: JViewExposureManager_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
//    {class} function init(P1: Jd): JViewExposureManager; cdecl; overload;
    {class} function init: JViewExposureManager; cdecl; overload;
//    {class} function access_getActivitiesMap_p(P1: JViewExposureManager): JWeakHashMap; cdecl;
    {class} function access_getGlobalConfig_p(P1: JViewExposureManager): JViewExposureConfig; cdecl;
    {class} procedure access_checkViewExposureFromActivity(P1: JViewExposureManager; P2: JActivity); cdecl;
    {class} procedure access_sendViewExposureEvent(P1: JViewExposureManager; P2: JView; P3: JViewExposureData); cdecl;
    {class} function access_getMainHandler_p(P1: JViewExposureManager): JHandler; cdecl;
    {class} function access_getCheckTask_p(P1: JViewExposureManager): JRunnable; cdecl;
//    {class} function access_getViewTreeChangeObserver_p(P1: JViewExposureManager): Jq0; cdecl;
//    {class} procedure access_setViewTreeChangeObserver_p(P1: JViewExposureManager; P2: Jq0); cdecl;

    { static Property }
    {class} property h: JViewExposureConfig read _Geth;
//    {class} property Companion: JViewExposureManager_a read _GetCompanion;
  end;

  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager')]
  JViewExposureManager = interface(JObject)
  ['{B931F639-F394-49EE-B644-9224A491AC6C}']
    { Property Methods }
//    function _Geta: JWeakHashMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JWeakHashMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jq0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jq0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getd: JViewExposureConfig;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd(ad: JViewExposureConfig);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gete: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sete(ae: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getf: JRunnable;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setf(af: JRunnable);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure observeViewExposure(P1: JView); cdecl; overload;
    procedure observeViewExposure(P1: JView; P2: JViewExposureData); cdecl; overload;
    procedure disposeViewExposure(P1: JView); cdecl;
//    function getAppLog: Jd; cdecl;
    procedure a(P1: JActivity); cdecl; overload;
    procedure a(P1: JView; P2: JViewExposureData); cdecl; overload;
//    procedure a(P1: JFunction0); cdecl; overload;

    { Property }
//    property a: JWeakHashMap read _Geta write _Seta;
    property b: Boolean read _Getb write _Setb;
//    property c: Jq0 read _Getc write _Setc;
    property d: JViewExposureConfig read _Getd write _Setd;
    property e: JHandler read _Gete write _Sete;
    property f: JRunnable read _Getf write _Setf;
//    property g: Jd read _Getg write _Setg;
  end;

  TJViewExposureManager = class(TJavaGenericImport<JViewExposureManagerClass, JViewExposureManager>) end;

  JGameReportHelperClass = interface(JObjectClass)
  ['{DEFD6A0B-F080-4C33-B7E4-EF9B186788E2}']
    { static Property Methods }
    {class} function _GetREGISTER: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOG_IN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPURCHASE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACCESS_ACCOUNT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQUEST: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPDATE_LEVEL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCREATE_GAMEROLE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_OUT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetADD_TO_FAVORITE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACCESS_PAYMENT_CHANNEL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetADD_CART: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVIEW_CONTENT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JGameReportHelper; cdecl;
    {class} procedure onEventRegister(P1: JString; P2: Boolean); cdecl;
    {class} procedure onEventLogin(P1: JString; P2: Boolean); cdecl;
    {class} procedure onEventPurchase(P1: JString; P2: JString; P3: JString; P4: Integer; P5: JString; P6: JString; P7: Boolean; P8: Integer); cdecl;
    {class} procedure onEventAccessAccount(P1: JString; P2: Boolean); cdecl;
    {class} procedure onEventQuest(P1: JString; P2: JString; P3: JString; P4: Integer; P5: Boolean; P6: JString); cdecl;
    {class} procedure onEventUpdateLevel(P1: Integer); cdecl;
    {class} procedure onEventCreateGameRole(P1: JString); cdecl;
    {class} procedure onEventCheckOut(P1: JString; P2: JString; P3: JString; P4: Integer; P5: Boolean; P6: JString; P7: JString; P8: Boolean; P9: Integer); cdecl;
    {class} procedure onEventAddToFavorite(P1: JString; P2: JString; P3: JString; P4: Integer; P5: Boolean); cdecl;
    {class} procedure onEventAccessPaymentChannel(P1: JString; P2: Boolean); cdecl;
    {class} procedure onEventAddCart(P1: JString; P2: JString; P3: JString; P4: Integer; P5: Boolean); cdecl;
    {class} procedure onEventViewContent(P1: JString; P2: JString; P3: JString); cdecl;

    { static Property }
    {class} property &REGISTER: JString read _GetREGISTER;
    {class} property LOG_IN: JString read _GetLOG_IN;
    {class} property PURCHASE: JString read _GetPURCHASE;
    {class} property ACCESS_ACCOUNT: JString read _GetACCESS_ACCOUNT;
    {class} property QUEST: JString read _GetQUEST;
    {class} property UPDATE_LEVEL: JString read _GetUPDATE_LEVEL;
    {class} property CREATE_GAMEROLE: JString read _GetCREATE_GAMEROLE;
    {class} property CHECK_OUT: JString read _GetCHECK_OUT;
    {class} property ADD_TO_FAVORITE: JString read _GetADD_TO_FAVORITE;
    {class} property ACCESS_PAYMENT_CHANNEL: JString read _GetACCESS_PAYMENT_CHANNEL;
    {class} property ADD_CART: JString read _GetADD_CART;
    {class} property VIEW_CONTENT: JString read _GetVIEW_CONTENT;
  end;

  [JavaSignature('com/bytedance/applog/game/GameReportHelper')]
  JGameReportHelper = interface(JObject)
  ['{B0D9034F-EB8A-4853-A6DB-BF9814D62DC5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGameReportHelper = class(TJavaGenericImport<JGameReportHelperClass, JGameReportHelper>) end;

  JOhayooGameHelperClass = interface(JObjectClass)
  ['{530A7E3F-4A80-4A9D-B2CC-100FE0493A13}']
    { static Property Methods }
    {class} function _GetGAME_TASK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAME_ACTIVITY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAME_UNLOCK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAME_RANK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAME_GUILD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAME_SNS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAME_SHARE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAME_BUTTONCLICK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_PACKAGE_CHANNEL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_ZONE_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_SERVER_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_SDK_OPEN_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_USER_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_ROLE_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_LEVEL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JOhayooGameHelper; cdecl;
    {class} procedure fillOtherParams(P1: JHashMap; P2: JJSONObject); cdecl;
    {class} procedure onEventGameTask(P1: JString; P2: JString; P3: JString; P4: JString; P5: Integer; P6: JHashMap); cdecl;
    {class} procedure onEventGameActivity(P1: JString; P2: JString; P3: JString; P4: JString; P5: Integer; P6: JString; P7: Int64; P8: Int64; P9: JHashMap); cdecl;
    {class} procedure onEventGameUnlock(P1: JString; P2: JString; P3: JString; P4: JHashMap); cdecl;
    {class} procedure onEventGameRank(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: JHashMap); cdecl;
    {class} procedure onEventGameGuild(P1: JString; P2: JString; P3: JString; P4: Integer; P5: Integer; P6: Integer; P7: JHashMap); cdecl;
    {class} procedure onEventGameSns(P1: Integer; P2: Integer; P3: JString; P4: JString; P5: JHashMap); cdecl;
    {class} procedure onEventGameShare(P1: JString; P2: JString; P3: Integer; P4: JString; P5: JString; P6: JHashMap); cdecl;
    {class} procedure onEventGameButtonClick(P1: JString; P2: JString; P3: JString; P4: Integer; P5: JHashMap); cdecl;
    {class} procedure setOhayooCustomHeader(P1: JString; P2: JObject); cdecl;

    { static Property }
    {class} property GAME_TASK: JString read _GetGAME_TASK;
    {class} property GAME_ACTIVITY: JString read _GetGAME_ACTIVITY;
    {class} property GAME_UNLOCK: JString read _GetGAME_UNLOCK;
    {class} property GAME_RANK: JString read _GetGAME_RANK;
    {class} property GAME_GUILD: JString read _GetGAME_GUILD;
    {class} property GAME_SNS: JString read _GetGAME_SNS;
    {class} property GAME_SHARE: JString read _GetGAME_SHARE;
    {class} property GAME_BUTTONCLICK: JString read _GetGAME_BUTTONCLICK;
    {class} property KEY_PACKAGE_CHANNEL: JString read _GetKEY_PACKAGE_CHANNEL;
    {class} property KEY_ZONE_ID: JString read _GetKEY_ZONE_ID;
    {class} property KEY_SERVER_ID: JString read _GetKEY_SERVER_ID;
    {class} property KEY_SDK_OPEN_ID: JString read _GetKEY_SDK_OPEN_ID;
    {class} property KEY_USER_TYPE: JString read _GetKEY_USER_TYPE;
    {class} property KEY_ROLE_ID: JString read _GetKEY_ROLE_ID;
    {class} property KEY_LEVEL: JString read _GetKEY_LEVEL;
  end;

  [JavaSignature('com/bytedance/applog/game/OhayooGameHelper')]
  JOhayooGameHelper = interface(JObject)
  ['{8E2E667B-603F-44A0-91B0-696ECA67F41F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOhayooGameHelper = class(TJavaGenericImport<JOhayooGameHelperClass, JOhayooGameHelper>) end;

//  JUnityPlugin_aClass = interface(JObjectClass)
//  ['{ABA9D351-F346-4198-B36F-F4E7BF8160D2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JUnityPlugin): JUnityPlugin_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/game/UnityPlugin$a')]
//  JUnityPlugin_a = interface(JObject)
//  ['{FC95397B-1A4C-41E0-BFED-4E4B2DA71956}']
//    { Property Methods }
//
//    { methods }
//    procedure log(P1: JString; P2: JThrowable); cdecl;
//
//    { Property }
//  end;

//  TJUnityPlugin_a = class(TJavaGenericImport<JUnityPlugin_aClass, JUnityPlugin_a>) end;

  JUnityPluginClass = interface(JObjectClass)
  ['{CEA26CD0-9DAA-467E-8F1F-6401A343E620}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnityPlugin; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/game/UnityPlugin')]
  JUnityPlugin = interface(JObject)
  ['{2E6016DA-A37F-47D8-AE8F-4B5898BA7E07}']
    { Property Methods }
    function _Geta: JActivity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JActivity);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure onEventV3(P1: JString; P2: JString); cdecl;
    procedure init(P1: JString; P2: JString; P3: Boolean; P4: Boolean; P5: Boolean; P6: JString); cdecl; overload;
    procedure setCustomHeaderInfo(P1: JString; P2: JString); cdecl;
    procedure removeCustomHeaderInfo(P1: JString); cdecl;
    procedure profileSet(P1: JString); cdecl;
    procedure profileAppend(P1: JString); cdecl;
    procedure profileSetOnce(P1: JString); cdecl;
    procedure profileUnset(P1: JString); cdecl;
    procedure profileIncrement(P1: JString); cdecl;
    function getAbSdkVersion: JString; cdecl;
    function getAllAbTestConfigs: JString; cdecl;
    function getAbConfig(P1: JString; P2: JString): JString; cdecl;
    procedure setExternalAbVersion(P1: JString); cdecl;
    function getDeviceId: JString; cdecl;
    function getSsid: JString; cdecl;
    function getIid: JString; cdecl;
    procedure flush; cdecl;
    procedure setUserUniqueID(P1: JString); cdecl;
    function getUserUniqueID: JString; cdecl;
    function getAid: JString; cdecl;

    { Property }
    property a: JActivity read _Geta write _Seta;
  end;

  TJUnityPlugin = class(TJavaGenericImport<JUnityPluginClass, JUnityPlugin>) end;

  JWhalerGameHelper_ResultClass = interface(JEnumClass) // or JObjectClass
  ['{946A738A-17A2-451F-A487-97117854AE04}']
    { static Property Methods }
    {class} function _GetUNCOMPLETED: JWhalerGameHelper_Result;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUCCESS: JWhalerGameHelper_Result;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFAIL: JWhalerGameHelper_Result;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Get_VALUES: TJavaObjectArray<JWhalerGameHelper_Result>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JWhalerGameHelper_Result>; cdecl;
    {class} function valueOf(P1: JString): JWhalerGameHelper_Result; cdecl;
    {class} function init(P1: JString; P2: Integer; P3: JString): JWhalerGameHelper_Result; cdecl; overload;
    {class} function init: JWhalerGameHelper_Result; cdecl; overload;

    { static Property }
    {class} property UNCOMPLETED: JWhalerGameHelper_Result read _GetUNCOMPLETED;
    {class} property SUCCESS: JWhalerGameHelper_Result read _GetSUCCESS;
    {class} property FAIL: JWhalerGameHelper_Result read _GetFAIL;
    {class} property _VALUES: TJavaObjectArray<JWhalerGameHelper_Result> read _Get_VALUES;
  end;

  [JavaSignature('com/bytedance/applog/game/WhalerGameHelper$Result')]
  JWhalerGameHelper_Result = interface(JEnum) // or JObject
  ['{AF98D869-0DC1-4B41-BA2F-4BD100C2E9F4}']
    { Property Methods }
    function _GetgameResult: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetgameResult(agameResult: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property gameResult: JString read _GetgameResult write _SetgameResult;
  end;

  TJWhalerGameHelper_Result = class(TJavaGenericImport<JWhalerGameHelper_ResultClass, JWhalerGameHelper_Result>) end;

  JWhalerGameHelperClass = interface(JObjectClass)
  ['{E5D35AE6-8A3B-460A-ACA4-3A60FB11F9F6}']
    { static Property Methods }
    {class} function _GetGT_AD_BUTTON_CLICK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGT_AD_SHOW: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGT_AD_SHOW_END: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGT_LEVELUP: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGT_START_PLAY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGT_END_PLAY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPURCHASE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGT_INIT_INFO: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGT_GET_COINS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGT_COST_COINS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JWhalerGameHelper; cdecl;
    {class} procedure fillOtherParams(P1: JHashMap; P2: JJSONObject); cdecl;
    {class} procedure adButtonClick(P1: JString; P2: JString; P3: JString; P4: JHashMap); cdecl;
    {class} procedure adShow(P1: JString; P2: JString; P3: JString; P4: JHashMap); cdecl;
    {class} procedure adShowEnd(P1: JString; P2: JString; P3: JString; P4: JString; P5: JHashMap); cdecl;
    {class} procedure levelUp(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: JHashMap); cdecl;
    {class} procedure startPlay(P1: JString; P2: JHashMap); cdecl;
    {class} procedure endPlay(P1: JString; P2: JWhalerGameHelper_Result; P3: Integer; P4: JHashMap); cdecl;
    {class} procedure purchase(P1: JString; P2: JString; P3: JString; P4: Integer; P5: JString; P6: JString; P7: JString; P8: Integer; P9: JHashMap); cdecl;
    {class} procedure gameInitInfo(P1: Integer; P2: JString; P3: Integer; P4: JHashMap); cdecl;
    {class} procedure getCoins(P1: JString; P2: JString; P3: Integer; P4: JHashMap); cdecl;
    {class} procedure costCoins(P1: JString; P2: JString; P3: Integer; P4: JHashMap); cdecl;

    { static Property }
    {class} property GT_AD_BUTTON_CLICK: JString read _GetGT_AD_BUTTON_CLICK;
    {class} property GT_AD_SHOW: JString read _GetGT_AD_SHOW;
    {class} property GT_AD_SHOW_END: JString read _GetGT_AD_SHOW_END;
    {class} property GT_LEVELUP: JString read _GetGT_LEVELUP;
    {class} property GT_START_PLAY: JString read _GetGT_START_PLAY;
    {class} property GT_END_PLAY: JString read _GetGT_END_PLAY;
    {class} property PURCHASE: JString read _GetPURCHASE;
    {class} property GT_INIT_INFO: JString read _GetGT_INIT_INFO;
    {class} property GT_GET_COINS: JString read _GetGT_GET_COINS;
    {class} property GT_COST_COINS: JString read _GetGT_COST_COINS;
  end;

  [JavaSignature('com/bytedance/applog/game/WhalerGameHelper')]
  JWhalerGameHelper = interface(JObject)
  ['{0FEC046D-1370-4121-86D6-1E08ACE96A69}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWhalerGameHelper = class(TJavaGenericImport<JWhalerGameHelperClass, JWhalerGameHelper>) end;

  JIActiveCustomParamsCallbackClass = interface(JObjectClass)
  ['{4F029BE0-454A-4B07-843F-5748C300A490}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IActiveCustomParamsCallback')]
  JIActiveCustomParamsCallback = interface(IJavaInstance)
  ['{AA7E266A-B10E-41F8-82BC-31BBC52EDBCF}']
    { Property Methods }

    { methods }
    function getParams: JMap; cdecl;

    { Property }
  end;

  TJIActiveCustomParamsCallback = class(TJavaGenericImport<JIActiveCustomParamsCallbackClass, JIActiveCustomParamsCallback>) end;

  JIAppLogInstanceClass = interface(JObjectClass)
  ['{823EE60A-8E79-4159-8D9E-6F636284D3B0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IAppLogInstance')]
  JIAppLogInstance = interface(IJavaInstance)
  ['{9334618F-CB5D-4833-8EB4-14B596D8AF0E}']
    { Property Methods }

    { methods }
    function getAppId: JString; cdecl;
//    procedure receive(P1: Jd3); cdecl; overload;
    procedure receive(P1: TJavaObjectArray<JString>); cdecl; overload;
//    procedure setAppContext(P1: Jf); cdecl;
//    function getAppContext: Jf; cdecl;
    function getContext: JContext; cdecl;
    procedure init(P1: JContext; P2: JInitConfig); cdecl; overload;
    procedure init(P1: JContext; P2: JInitConfig; P3: JActivity); cdecl; overload;
    procedure initMetaSec(P1: JContext); cdecl;
    procedure start; cdecl;
    function hasStarted: Boolean; cdecl;
    function getInitConfig: JInitConfig; cdecl;
    function isBavEnabled: Boolean; cdecl;
    procedure flush; cdecl;
    function isH5BridgeEnable: Boolean; cdecl;
    function isH5CollectEnable: Boolean; cdecl;
    procedure setUserID(P1: Int64); cdecl;
    procedure setAppLanguageAndRegion(P1: JString; P2: JString); cdecl;
    procedure setGoogleAid(P1: JString); cdecl;
    function addNetCommonParams(P1: JContext; P2: JString; P3: Boolean; P4: JLevel): JString; cdecl;
    procedure putCommonParams(P1: JContext; P2: JMap; P3: Boolean; P4: JLevel); cdecl;
    procedure setUserUniqueID(P1: JString); cdecl; overload;
    procedure setUserUniqueID(P1: JString; P2: JString); cdecl; overload;
    procedure setExtraParams(P1: JIExtraParams); cdecl;
    procedure setActiveCustomParams(P1: JIActiveCustomParamsCallback); cdecl;
    function getActiveCustomParams: JIActiveCustomParamsCallback; cdecl;
    procedure setTouchPoint(P1: JString); cdecl;
    procedure setHeaderInfo(P1: JHashMap); cdecl; overload;
    procedure setHeaderInfo(P1: JString; P2: JObject); cdecl; overload;
    procedure removeHeaderInfo(P1: JString); cdecl;
    procedure setExternalAbVersion(P1: JString); cdecl;
    function getAbSdkVersion: JString; cdecl;
    function getAbConfig(P1: JString; P2: JObject): JObject; cdecl;
    procedure pullAbTestConfigs; cdecl; overload;
    procedure pullAbTestConfigs(P1: Integer; P2: JIPullAbTestConfigCallback); cdecl; overload;
    procedure setPullAbTestConfigsThrottleMills(P1: JLong); cdecl;
    function getAid: JString; cdecl;
//    function getHeaderValue(P1: JString; P2: JObject; P3: JClass): JObject; cdecl;
    procedure setTracerData(P1: JJSONObject); cdecl;
    procedure setUserAgent(P1: JString); cdecl;
    procedure onEventV3(P1: JString); cdecl; overload;
    procedure onEventV3(P1: JString; P2: JJSONObject); cdecl; overload;
    procedure onEventV3(P1: JString; P2: JJSONObject; P3: Integer); cdecl; overload;
    procedure onEventV3(P1: JString; P2: JBundle; P3: Integer); cdecl; overload;
    procedure onEventV3(P1: JString; P2: JBundle); cdecl; overload;
    function newEvent(P1: JString): JEventBuilder; cdecl;
    procedure onMiscEvent(P1: JString; P2: JJSONObject); cdecl;
    procedure setEncryptAndCompress(P1: Boolean); cdecl;
    function getEncryptAndCompress: Boolean; cdecl;
    function manualActivate: Boolean; cdecl;
    procedure setForbidReportPhoneDetailInfo(P1: Boolean); cdecl;
    function reportPhoneDetailInfo: Boolean; cdecl;
    function getDid: JString; cdecl;
    function getUdid: JString; cdecl;
    procedure addSessionHook(P1: JISessionObserver); cdecl;
    procedure removeSessionHook(P1: JISessionObserver); cdecl;
    procedure addEventObserver(P1: JIEventObserver); cdecl;
    procedure removeEventObserver(P1: JIEventObserver); cdecl;
//    procedure setAccount(P1: JAccount); cdecl;
    function getIid: JString; cdecl;
    function getSsid: JString; cdecl;
    function getUserUniqueID: JString; cdecl;
    function getUserID: JString; cdecl;
    function getClientUdid: JString; cdecl;
    function getOpenUdid: JString; cdecl;
    procedure setUriRuntime(P1: JUriConfig); cdecl;
    procedure getSsidGroup(P1: JMap); cdecl;
    procedure addDataObserver(P1: JIDataObserver); cdecl;
    procedure removeDataObserver(P1: JIDataObserver); cdecl;
    procedure removeAllDataObserver; cdecl;
    procedure setOaidObserver(P1: JIOaidObserver); cdecl;
    procedure removeOaidObserver(P1: JIOaidObserver); cdecl;
    function getNetClient: JINetworkClient; cdecl;
    function getHeader: JJSONObject; cdecl;
    procedure setAppTrack(P1: JJSONObject); cdecl;
    function isNewUser: Boolean; cdecl;
    procedure onResume(P1: JContext); cdecl;
    procedure onPause(P1: JContext); cdecl;
    procedure onActivityResumed(P1: JActivity; P2: Integer); cdecl;
    procedure onActivityPause; cdecl;
    procedure registerHeaderCustomCallback(P1: JIHeaderCustomTimelyCallback); cdecl;
    function getHeaderCustomCallback: JIHeaderCustomTimelyCallback; cdecl;
    procedure userProfileSetOnce(P1: JJSONObject; P2: JUserProfileCallback); cdecl;
    procedure userProfileSync(P1: JJSONObject; P2: JUserProfileCallback); cdecl;
    procedure startSimulator(P1: JString); cdecl;
    procedure setRangersEventVerifyEnable(P1: Boolean; P2: JString); cdecl;
    procedure profileSet(P1: JJSONObject); cdecl;
    procedure profileSetOnce(P1: JJSONObject); cdecl;
    procedure profileUnset(P1: JString); cdecl;
    procedure profileIncrement(P1: JJSONObject); cdecl;
    procedure profileAppend(P1: JJSONObject); cdecl;
    procedure setEventFilterByClient(P1: JList; P2: Boolean); cdecl;
//    function getEventFilterByClient: Jr0; cdecl;
    function getRequestHeader: JMap; cdecl;
    function getSessionId: JString; cdecl;
    procedure setALinkListener(P1: JIALinkListener); cdecl;
    function getALinkListener: JIALinkListener; cdecl;
    procedure setClipboardEnabled(P1: Boolean); cdecl;
    procedure activateALink(P1: JUri); cdecl;
    function getSdkVersion: JString; cdecl;
    function getAllAbTestConfigs: JJSONObject; cdecl;
    procedure setPrivacyMode(P1: Boolean); cdecl;
    function isPrivacyMode: Boolean; cdecl;
    procedure setViewId(P1: JView; P2: JString); cdecl; overload;
    procedure setViewId(P1: JDialog; P2: JString); cdecl; overload;
    procedure setViewId(P1: JObject; P2: JString); cdecl; overload;
    function getLaunchFrom: Integer; cdecl;
    procedure setLaunchFrom(P1: Integer); cdecl;
    function getDeepLinkUrl: JString; cdecl;
    procedure setViewProperties(P1: JView; P2: JJSONObject); cdecl;
    function getViewProperties(P1: JView): JJSONObject; cdecl;
//    procedure ignoreAutoTrackPage(P1: TJavaObjectArray<JClass>); cdecl;
//    function isAutoTrackPageIgnored(P1: JClass): Boolean; cdecl;
    procedure ignoreAutoTrackClick(P1: JView); cdecl;
//    procedure ignoreAutoTrackClickByViewType(P1: TJavaObjectArray<JClass>); cdecl;
    function isAutoTrackClickIgnored(P1: JView): Boolean; cdecl;
    procedure trackPage(P1: JObject); cdecl; overload;
    procedure trackPage(P1: JObject; P2: JJSONObject); cdecl; overload;
    procedure trackPage(P1: JActivity); cdecl; overload;
    procedure trackPage(P1: JActivity; P2: JJSONObject); cdecl; overload;
    procedure trackClick(P1: JView); cdecl; overload;
    procedure trackClick(P1: JView; P2: JJSONObject); cdecl; overload;
    procedure setEventHandler(P1: JIEventHandler); cdecl;
    function getEventHandler: JIEventHandler; cdecl;
    procedure initH5Bridge(P1: JView; P2: JString); cdecl;
    function getViewExposureManager: JViewExposureManager; cdecl;
    procedure setGPSLocation(P1: Single; P2: Single; P3: JString); cdecl;
    procedure startDurationEvent(P1: JString); cdecl;
    procedure pauseDurationEvent(P1: JString); cdecl;
    procedure resumeDurationEvent(P1: JString); cdecl;
    procedure stopDurationEvent(P1: JString; P2: JJSONObject); cdecl;
    procedure clearDb; cdecl;
//    function getMonitor: Jc2; cdecl;
    procedure initWebViewBridge(P1: JView; P2: JString); cdecl;
    procedure bind(P1: JMap; P2: JIDBindCallback); cdecl;

    { Property }
  end;

  TJIAppLogInstance = class(TJavaGenericImport<JIAppLogInstanceClass, JIAppLogInstance>) end;

  JIDataObserverClass = interface(JObjectClass)
  ['{E79C9161-EB14-495C-932C-73E6DCDA89D0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IDataObserver')]
  JIDataObserver = interface(IJavaInstance)
  ['{EC91DEF5-766D-473D-BB78-929282CAB03D}']
    { Property Methods }

    { methods }
    procedure onIdLoaded(P1: JString; P2: JString; P3: JString); cdecl;
    procedure onRemoteIdGet(P1: Boolean; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString); cdecl;
    procedure onRemoteConfigGet(P1: Boolean; P2: JJSONObject); cdecl;
    procedure onRemoteAbConfigGet(P1: Boolean; P2: JJSONObject); cdecl;
    procedure onAbVidsChange(P1: JString; P2: JString); cdecl;

    { Property }
  end;

  TJIDataObserver = class(TJavaGenericImport<JIDataObserverClass, JIDataObserver>) end;

  JIEventObserverClass = interface(JObjectClass)
  ['{94F5A39B-AE82-4701-B21F-781118C12F4F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IEventObserver')]
  JIEventObserver = interface(IJavaInstance)
  ['{3B0A0289-73AC-4171-B458-2E8BB801AC1A}']
    { Property Methods }

    { methods }
    procedure onEvent(P1: JString; P2: JString; P3: JString; P4: Int64; P5: Int64; P6: JString); cdecl;
    procedure onEventV3(P1: JString; P2: JJSONObject); cdecl;

    { Property }
  end;

  TJIEventObserver = class(TJavaGenericImport<JIEventObserverClass, JIEventObserver>) end;

  JIExtraParamsClass = interface(JObjectClass)
  ['{0A74E4D9-DDBA-4C24-B206-E02B5E2DD973}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IExtraParams')]
  JIExtraParams = interface(IJavaInstance)
  ['{808841E7-C845-4673-908D-FB3FAACFF250}']
    { Property Methods }

    { methods }
    function getExtraParams(P1: JLevel): JHashMap; cdecl;

    { Property }
  end;

  TJIExtraParams = class(TJavaGenericImport<JIExtraParamsClass, JIExtraParams>) end;

  JIHeaderCustomTimelyCallbackClass = interface(JObjectClass)
  ['{8A65A3DB-7BCD-431B-A426-83152C64DDF7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IHeaderCustomTimelyCallback')]
  JIHeaderCustomTimelyCallback = interface(IJavaInstance)
  ['{49A13B32-36D8-491F-A4FA-887141201AB6}']
    { Property Methods }

    { methods }
    procedure updateHeader(P1: JJSONObject); cdecl;

    { Property }
  end;

  TJIHeaderCustomTimelyCallback = class(TJavaGenericImport<JIHeaderCustomTimelyCallbackClass, JIHeaderCustomTimelyCallback>) end;

  JILoggerClass = interface(JObjectClass)
  ['{BB043AA6-EEAA-4FB9-9196-FCB17B4930C9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/ILogger')]
  JILogger = interface(IJavaInstance)
  ['{A3387636-C9B0-4DF3-A810-5DBB0EECD7D6}']
    { Property Methods }

    { methods }
    procedure log(P1: JString; P2: JThrowable); cdecl;

    { Property }
  end;

  TJILogger = class(TJavaGenericImport<JILoggerClass, JILogger>) end;

  JInitConfig_IpcDataCheckerClass = interface(JObjectClass)
  ['{ED144BCE-42F7-426D-B836-18613BA75BE3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/InitConfig$IpcDataChecker')]
  JInitConfig_IpcDataChecker = interface(IJavaInstance)
  ['{3924B5CD-4843-4851-84DE-75BD2B377299}']
    { Property Methods }

    { methods }
    function checkIpcData(P1: TJavaObjectArray<JString>): Boolean; cdecl;

    { Property }
  end;

  TJInitConfig_IpcDataChecker = class(TJavaGenericImport<JInitConfig_IpcDataCheckerClass, JInitConfig_IpcDataChecker>) end;

  JInitConfigClass = interface(JObjectClass)
  ['{F4F8E9A3-1B61-4B87-AF45-6C1A1C18786B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JString): JInitConfig; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/InitConfig')]
  JInitConfig = interface(JObject)
  ['{76D5F0B7-F8ED-42F7-8F61-26C5F2780A87}']
    { Property Methods }
    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JIEncryptor;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JIEncryptor);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geth: JILogger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seth(ah: JILogger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seti(ai: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getj: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setj(aj: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getk: JIPicker;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setk(ak: JIPicker);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getl: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setl(al: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getm: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setm(am: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setn(an: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seto(ao: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getp: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setp(ap: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getq: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setq(aq: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getr: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setr(ar: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gets: JUriConfig;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JUriConfig);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gett: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sett(at: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getu: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setu(au: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getv: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setv(av: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getw: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setw(aw: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setx(ax: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gety: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sety(ay: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getz: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setz(az: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetA: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetA(aA: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetB: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetC: JAccount;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetC(aC: JAccount);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetD: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetD(aD: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetE: JINetworkClient;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetE(aE: JINetworkClient);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetF: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetF(aF: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetG(aG: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetH: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetH(aH: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetI: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetI(aI: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetJ: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetJ(aJ: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetK: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetK(aK: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetL(aL: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetM(aM: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetN: JISensitiveInfoProvider;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetN(aN: JISensitiveInfoProvider);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetO: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetO(aO: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetP: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetP(aP: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetQ: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetQ(aQ: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetR: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetR(aR: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetS: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetS(aS: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetT: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetT(aT: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetU: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetU(aU: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetV: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetV(aV: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetW: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetW(aW: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetX(aX: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetY: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetY(aY: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetZ: JInitConfig_IpcDataChecker;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetZ(aZ: JInitConfig_IpcDataChecker);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geta0: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta0(aa0: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb0: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb0(ab0: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc0(ac0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getd0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd0(ad0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gete0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sete0(ae0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getf0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setf0(af0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getg0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setg0(ag0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geth0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seth0(ah0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geti0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seti0(ai0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getj0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setj0(aj0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getk0: JViewExposureConfig;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setk0(ak0: JViewExposureConfig);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getl0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setl0(al0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getm0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setm0(am0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getn0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setn0(an0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geto0: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seto0(ao0: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getp0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setp0(ap0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getq0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setq0(aq0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getr0: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setr0(ar0: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gets0: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sets0(as0: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function setLogger(P1: JILogger): JInitConfig; cdecl;
    function getLogger: JILogger; cdecl;
    function autoStart: Boolean; cdecl;
    function setAutoStart(P1: Boolean): JInitConfig; cdecl;
//    function setPreInstallChannelCallback(P1: Jw4): JInitConfig; cdecl;
    procedure setChannel(P1: JString); cdecl;
    function setReleaseBuild(P1: JString): JInitConfig; cdecl;
    function getReleaseBuild: JString; cdecl;
    function setNotRequestSender(P1: Boolean): JInitConfig; cdecl;
    function getNotReuqestSender: Boolean; cdecl;
    function putCommonHeader(P1: JMap): JInitConfig; cdecl;
    function getCommonHeader: JMap; cdecl;
    function setEnablePlay(P1: Boolean): JInitConfig; cdecl;
    function isPlayEnable: Boolean; cdecl;
    function getAid: JString; cdecl;
    function getChannel: JString; cdecl;
    function setGoogleAid(P1: JString): JInitConfig; cdecl;
    function getGoogleAid: JString; cdecl;
    function setLanguage(P1: JString): JInitConfig; cdecl;
    function getLanguage: JString; cdecl;
    function setRegion(P1: JString): JInitConfig; cdecl;
    function getRegion: JString; cdecl;
    function setAliyunUdid(P1: JString): JInitConfig; cdecl;
    function getAliyunUdid: JString; cdecl;
    function setProcess(P1: Integer): JInitConfig; cdecl;
    function setMainProcess: JInitConfig; cdecl;
    function getProcess: Integer; cdecl;
    function getPicker: JIPicker; cdecl;
    function setPicker(P1: JIPicker): JInitConfig; cdecl;
    function setUriConfig(P1: Integer): JInitConfig; cdecl; overload;
    function setUriConfig(P1: JUriConfig): JInitConfig; cdecl; overload;
    function getUriConfig: JUriConfig; cdecl;
//    function setEncryptor(P1: JIEncryptor): JInitConfig; cdecl;
//    function getEncryptor: JIEncryptor; cdecl;
    function setAnonymous(P1: Boolean): JInitConfig; cdecl;
    function getAnonymous: Boolean; cdecl;
    function setLocalTest(P1: Boolean): JInitConfig; cdecl;
    function getLocalTest: Boolean; cdecl;
//    function setAccount(P1: JAccount): JInitConfig; cdecl;
//    function getAccount: JAccount; cdecl;
    procedure clearDidAndIid(P1: JString); cdecl;
    function isClearDidAndIid: Boolean; cdecl;
    function getClearKey: JString; cdecl;
    function setNetworkClient(P1: JINetworkClient): JInitConfig; cdecl;
    function getNetworkClient: JINetworkClient; cdecl;
    function setAppName(P1: JString): JInitConfig; cdecl;
    function getAppName: JString; cdecl;
    function setVersion(P1: JString): JInitConfig; cdecl;
    function getVersion: JString; cdecl;
    function setTweakedChannel(P1: JString): JInitConfig; cdecl;
    function getTweakedChannel: JString; cdecl;
    function setVersionCode(P1: Integer): JInitConfig; cdecl;
    function getVersionCode: Integer; cdecl;
    function setUserUniqueId(P1: JString): JInitConfig; cdecl;
    function getUserUniqueId: JString; cdecl;
    function setUserUniqueIdType(P1: JString): JInitConfig; cdecl;
    function getUserUniqueIdType: JString; cdecl;
    function setUpdateVersionCode(P1: Integer): JInitConfig; cdecl;
    function getUpdateVersionCode: Integer; cdecl;
    function setManifestVersionCode(P1: Integer): JInitConfig; cdecl;
    function getManifestVersionCode: Integer; cdecl;
    function setManifestVersion(P1: JString): JInitConfig; cdecl;
    function getManifestVersion: JString; cdecl;
    function setVersionMinor(P1: JString): JInitConfig; cdecl;
    function getVersionMinor: JString; cdecl;
    function setZiJieCloudPkg(P1: JString): JInitConfig; cdecl;
    function getZiJieCloudPkg: JString; cdecl;
    function isSilenceInBackground: Boolean; cdecl;
    procedure setSilenceInBackground(P1: Boolean); cdecl;
    function isAutoActive: Boolean; cdecl;
    procedure setAutoActive(P1: Boolean); cdecl;
    function isAbEnable: Boolean; cdecl;
    procedure setAbEnable(P1: Boolean); cdecl;
    procedure setAutoTrackEnabled(P1: Boolean); cdecl;
    function isAutoTrackEnabled: Boolean; cdecl;
    function isHandleLifeCycle: Boolean; cdecl;
    procedure setHandleLifeCycle(P1: Boolean); cdecl;
    function isCongestionControlEnable: Boolean; cdecl;
    procedure setCongestionControlEnable(P1: Boolean); cdecl;
    function getDbName: JString; cdecl;
    function setDbName(P1: JString): JInitConfig; cdecl;
    function getSpName: JString; cdecl;
    function setSpName(P1: JString): JInitConfig; cdecl;
//    function getPreInstallCallback: Jw4; cdecl;
    function getSensitiveInfoProvider: JISensitiveInfoProvider; cdecl;
    procedure setSensitiveInfoProvider(P1: JISensitiveInfoProvider); cdecl;
    function isMacEnable: Boolean; cdecl;
    function isDeferredALinkEnabled: Boolean; cdecl;
    function isH5BridgeEnable: Boolean; cdecl;
    function isH5CollectEnable: Boolean; cdecl;
    function isLogEnable: Boolean; cdecl;
    function getH5BridgeAllowlist: JList; cdecl;
    function isH5BridgeAllowAll: Boolean; cdecl;
    procedure setMacEnable(P1: Boolean); cdecl;
    function setH5BridgeEnable(P1: Boolean): JInitConfig; cdecl;
    function setH5CollectEnable(P1: Boolean): JInitConfig; cdecl;
    function setLogEnable(P1: Boolean): JInitConfig; cdecl;
    function clearABCacheOnUserChange(P1: Boolean): JInitConfig; cdecl;
    function setH5BridgeAllowlist(P1: JList): JInitConfig; cdecl;
    function setH5BridgeAllowAll(P1: Boolean): JInitConfig; cdecl;
    function isClearABCacheOnUserChange: Boolean; cdecl;
    function disableDeferredALink: JInitConfig; cdecl;
    function enableDeferredALink: JInitConfig; cdecl;
    function isImeiEnable: Boolean; cdecl;
    function setImeiEnable(P1: Boolean): JInitConfig; cdecl;
    function getAppImei: JString; cdecl;
    procedure setAppImei(P1: JString); cdecl;
    function isEventFilterEnable: Boolean; cdecl;
    procedure setEventFilterEnable(P1: Boolean); cdecl;
    function setIpcDataChecker(P1: JInitConfig_IpcDataChecker): JInitConfig; cdecl;
    function getIpcDataChecker: JInitConfig_IpcDataChecker; cdecl;
    function isTrackEventEnabled: Boolean; cdecl;
    procedure setTrackEventEnabled(P1: Boolean); cdecl;
    function isAutoTrackFragmentEnabled: Boolean; cdecl;
    procedure setAutoTrackFragmentEnabled(P1: Boolean); cdecl;
    procedure setHarmonyEnable(P1: Boolean); cdecl;
    function isHarmonyEnabled: Boolean; cdecl;
    procedure setMetaSecEnabled(P1: Boolean); cdecl;
    function isMetaSecEnabled: Boolean; cdecl;
    procedure setOaidEnabled(P1: Boolean); cdecl;
    function isOaidEnabled: Boolean; cdecl;
    procedure setAndroidIdEnabled(P1: Boolean); cdecl;
    function isAndroidIdEnabled: Boolean; cdecl;
    procedure setScreenOrientationEnabled(P1: Boolean); cdecl;
    function isScreenOrientationEnabled: Boolean; cdecl;
    function isReportOaidEnable: Boolean; cdecl;
    procedure setReportOaidEnable(P1: Boolean); cdecl;
    procedure setExposureEnabled(P1: Boolean); cdecl;
    function isExposureEnabled: Boolean; cdecl;
    procedure setMonitorEnabled(P1: Boolean); cdecl;
    function isMonitorEnabled: Boolean; cdecl;
    procedure setOperatorInfoEnabled(P1: Boolean); cdecl;
    function isOperatorInfoEnabled: Boolean; cdecl;
    function getExposureConfig: JViewExposureConfig; cdecl;
    procedure setExposureConfig(P1: JViewExposureConfig); cdecl;
    procedure setAutoTrackEventType(P1: Integer); cdecl;
    function getAutoTrackEventType: Integer; cdecl;
    procedure setMigrateEnabled(P1: Boolean); cdecl;
    function isMigrateEnabled: Boolean; cdecl;
    procedure setTrackCrashType(P1: Integer); cdecl;
    function getTrackCrashType: Integer; cdecl;
    procedure setGaidEnabled(P1: Boolean); cdecl;
    function isGaidEnabled: Boolean; cdecl;
    function getHttpHeaders: JMap; cdecl;
    procedure setHttpHeaders(P1: JMap); cdecl;

    { Property }
    property a: JString read _Geta write _Seta;
    property b: Boolean read _Getb write _Setb;
    property c: JString read _Getc write _Setc;
    property d: JString read _Getd write _Setd;
//    property e: JIEncryptor read _Gete write _Sete;
    property f: JString read _Getf write _Setf;
    property g: JString read _Getg write _Setg;
    property h: JILogger read _Geth write _Seth;
    property i: JString read _Geti write _Seti;
    property j: JString read _Getj write _Setj;
    property k: JIPicker read _Getk write _Setk;
    property l: Boolean read _Getl write _Setl;
    property m: Boolean read _Getm write _Setm;
    property n: Boolean read _Getn write _Setn;
    property o: Integer read _Geto write _Seto;
    property p: JString read _Getp write _Setp;
    property q: Boolean read _Getq write _Setq;
    property r: JString read _Getr write _Setr;
//    property s: JUriConfig read _Gets write _Sets;
    property t: JString read _Gett write _Sett;
    property u: JString read _Getu write _Setu;
    property v: Integer read _Getv write _Setv;
    property w: Integer read _Getw write _Setw;
    property x: Integer read _Getx write _Setx;
    property y: JString read _Gety write _Sety;
    property z: JString read _Getz write _Setz;
    property A: JString read _GetA write _SetA;
//    property B: JMap read _GetB write _SetB;
//    property C: JAccount read _GetC write _SetC;
//    property D: Boolean read _GetD write _SetD;
    property E: JINetworkClient read _GetE write _SetE;
//    property F: Boolean read _GetF write _SetF;
//    property G: Boolean read _GetG write _SetG;
//    property H: Boolean read _GetH write _SetH;
//    property I: Boolean read _GetI write _SetI;
//    property J: Boolean read _GetJ write _SetJ;
//    property K: Boolean read _GetK write _SetK;
//    property L: JString read _GetL write _SetL;
//    property M: JString read _GetM write _SetM;
//    property N: JISensitiveInfoProvider read _GetN write _SetN;
//    property O: Boolean read _GetO write _SetO;
//    property P: Boolean read _GetP write _SetP;
//    property Q: Boolean read _GetQ write _SetQ;
//    property R: Boolean read _GetR write _SetR;
//    property S: Boolean read _GetS write _SetS;
//    property T: JList read _GetT write _SetT;
//    property U: Boolean read _GetU write _SetU;
//    property V: Boolean read _GetV write _SetV;
//    property W: Boolean read _GetW write _SetW;
//    property X: JString read _GetX write _SetX;
//    property Y: Boolean read _GetY write _SetY;
//    property Z: JInitConfig_IpcDataChecker read _GetZ write _SetZ;
    property a0: JString read _Geta0 write _Seta0;
    property b0: JString read _Getb0 write _Setb0;
    property c0: Boolean read _Getc0 write _Setc0;
    property d0: Boolean read _Getd0 write _Setd0;
    property e0: Boolean read _Gete0 write _Sete0;
    property f0: Boolean read _Getf0 write _Setf0;
    property g0: Boolean read _Getg0 write _Setg0;
    property h0: Boolean read _Geth0 write _Seth0;
    property i0: Boolean read _Geti0 write _Seti0;
    property j0: Boolean read _Getj0 write _Setj0;
    property k0: JViewExposureConfig read _Getk0 write _Setk0;
    property l0: Boolean read _Getl0 write _Setl0;
    property m0: Boolean read _Getm0 write _Setm0;
    property n0: Boolean read _Getn0 write _Setn0;
    property o0: Integer read _Geto0 write _Seto0;
    property p0: Boolean read _Getp0 write _Setp0;
    property q0: Boolean read _Getq0 write _Setq0;
    property r0: Integer read _Getr0 write _Setr0;
    property s0: JMap read _Gets0 write _Sets0;
  end;

  TJInitConfig = class(TJavaGenericImport<JInitConfigClass, JInitConfig>) end;

  JIOaidObserver_OaidClass = interface(JObjectClass)
  ['{7A15F7D9-0350-4606-8D0F-C1B2FBA8E4BD}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString): JIOaidObserver_Oaid; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IOaidObserver$Oaid')]
  JIOaidObserver_Oaid = interface(JObject)
  ['{6D32F414-BCC3-4F0B-8BF6-FAA20F1E74F1}']
    { Property Methods }
    function _Getid: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setid(aid: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property id: JString read _Getid write _Setid;
  end;

  TJIOaidObserver_Oaid = class(TJavaGenericImport<JIOaidObserver_OaidClass, JIOaidObserver_Oaid>) end;

  JIOaidObserverClass = interface(JObjectClass)
  ['{A66C8212-6060-408B-9C29-31890F49D6C4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IOaidObserver')]
  JIOaidObserver = interface(IJavaInstance)
  ['{8F6F3222-769D-4252-B1C2-668141B41FC3}']
    { Property Methods }

    { methods }
    procedure onOaidLoaded(P1: JIOaidObserver_Oaid); cdecl;

    { Property }
  end;

  TJIOaidObserver = class(TJavaGenericImport<JIOaidObserverClass, JIOaidObserver>) end;

  JIPageMetaClass = interface(JObjectClass)
  ['{25AF8173-B12E-465B-A8E5-3A716BFAEF1E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IPageMeta')]
  JIPageMeta = interface(IJavaInstance)
  ['{378B050A-1A7A-47E7-B90B-A5F451F1E893}']
    { Property Methods }

    { methods }
    function path: JString; cdecl;
    function title: JString; cdecl;
    function pageProperties: JJSONObject; cdecl;

    { Property }
  end;

  TJIPageMeta = class(TJavaGenericImport<JIPageMetaClass, JIPageMeta>) end;

  JIPickerClass = interface(JObjectClass)
  ['{52B5C7F2-D093-4E00-9AFE-8F8E5AEFAC9C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IPicker')]
  JIPicker = interface(IJavaInstance)
  ['{EBCBD555-D85C-490E-802C-9CE0FC38BFB5}']
    { Property Methods }

    { methods }
    procedure setMarqueeCookie(P1: JString); cdecl;
    function getMarqueeCookie: JString; cdecl;

    { Property }
  end;

  TJIPicker = class(TJavaGenericImport<JIPickerClass, JIPicker>) end;

  JIPullAbTestConfigCallbackClass = interface(JObjectClass)
  ['{FA7351BA-0E21-41F5-8A29-B076ECFDB82D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IPullAbTestConfigCallback')]
  JIPullAbTestConfigCallback = interface(IJavaInstance)
  ['{54C18313-C6C6-4CC3-892A-881EB663483A}']
    { Property Methods }

    { methods }
    procedure onRemoteConfig(P1: JJSONObject); cdecl;
    procedure onTimeoutError; cdecl;
    procedure onThrottle(P1: Int64); cdecl;

    { Property }
  end;

  TJIPullAbTestConfigCallback = class(TJavaGenericImport<JIPullAbTestConfigCallbackClass, JIPullAbTestConfigCallback>) end;

  JISensitiveInfoProviderClass = interface(JObjectClass)
  ['{DA5B6EBD-E84D-447C-9571-DAA806FD812D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/ISensitiveInfoProvider')]
  JISensitiveInfoProvider = interface(IJavaInstance)
  ['{FD5756AC-9216-4FD4-9035-097D5794B6FD}']
    { Property Methods }

    { methods }
    function getImsi: JString; cdecl;
    function getMac: JString; cdecl;

    { Property }
  end;

  TJISensitiveInfoProvider = class(TJavaGenericImport<JISensitiveInfoProviderClass, JISensitiveInfoProvider>) end;

  JISessionObserverClass = interface(JObjectClass)
  ['{8BCDB4E3-574C-4B75-9234-A2960BB689A7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/ISessionObserver')]
  JISessionObserver = interface(IJavaInstance)
  ['{37AEFB45-B4D9-4A83-98FF-543173A86D25}']
    { Property Methods }

    { methods }
    procedure onSessionStart(P1: Int64; P2: JString); cdecl;
    procedure onSessionTerminate(P1: Int64; P2: JString; P3: JJSONObject); cdecl;
    procedure onSessionBatchEvent(P1: Int64; P2: JString; P3: JJSONObject); cdecl;

    { Property }
  end;

  TJISessionObserver = class(TJavaGenericImport<JISessionObserverClass, JISessionObserver>) end;

  JLevelClass = interface(JEnumClass) // or JObjectClass
  ['{55F9E8C4-CCD2-4943-B2CD-72FAFECC502B}']
    { static Property Methods }
    {class} function _GetL0: JLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetL1: JLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: TJavaObjectArray<JLevel>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JLevel>; cdecl;
    {class} function valueOf(P1: JString): JLevel; cdecl;
    {class} function init(P1: JString; P2: Integer; P3: Integer): JLevel; cdecl; overload;
    {class} function init: JLevel; cdecl; overload;

    { static Property }
    {class} property L0: JLevel read _GetL0;
    {class} property L1: JLevel read _GetL1;
    {class} property b: TJavaObjectArray<JLevel> read _Getb;
  end;

  [JavaSignature('com/bytedance/applog/Level')]
  JLevel = interface(JEnum) // or JObject
  ['{475CE04A-6F1D-4013-9E83-3F48A4DCC13E}']
    { Property Methods }
    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function value: Integer; cdecl;

    { Property }
    property a: Integer read _Geta write _Seta;
  end;

  TJLevel = class(TJavaGenericImport<JLevelClass, JLevel>) end;

  JMigrateDetectorActivityClass = interface(JActivityClass) // or JObjectClass
  ['{5CFC22A9-8BAE-45C6-9056-D561E0346750}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMigrateDetectorActivity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/migrate/MigrateDetectorActivity')]
  JMigrateDetectorActivity = interface(JActivity) // or JObject
  ['{1F3BD41D-B67F-4423-9757-E424D4D7F024}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMigrateDetectorActivity = class(TJavaGenericImport<JMigrateDetectorActivityClass, JMigrateDetectorActivity>) end;

  JINetworkClientClass = interface(JObjectClass)
  ['{201A1CE8-2196-4A59-AB04-058B361FB6E2}']
    { static Property Methods }
    {class} function _GetMETHOD_GET: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMETHOD_POST: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESPONSE_TYPE_STRING: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESPONSE_TYPE_STREAM: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property METHOD_GET: Byte read _GetMETHOD_GET;
    {class} property METHOD_POST: Byte read _GetMETHOD_POST;
    {class} property RESPONSE_TYPE_STRING: Byte read _GetRESPONSE_TYPE_STRING;
    {class} property RESPONSE_TYPE_STREAM: Byte read _GetRESPONSE_TYPE_STREAM;
  end;

  [JavaSignature('com/bytedance/applog/network/INetworkClient')]
  JINetworkClient = interface(IJavaInstance)
  ['{B0176FB1-6256-4806-A09E-3AD909E6542B}']
    { Property Methods }

    { methods }
    function execute(P1: Byte; P2: JString; P3: JJSONObject; P4: JMap; P5: Byte; P6: Boolean; P7: Integer): TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJINetworkClient = class(TJavaGenericImport<JINetworkClientClass, JINetworkClient>) end;

  JRangersHttpExceptionClass = interface(JExceptionClass) // or JObjectClass
  ['{F9DE8242-59BF-4A84-8EEA-D0CD57063A1F}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: JString): JRangersHttpException; cdecl; overload;
    {class} function init(P1: Integer; P2: JThrowable): JRangersHttpException; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/network/RangersHttpException')]
  JRangersHttpException = interface(JException) // or JObject
  ['{CC11F53F-40AC-4381-A5AB-25A1212ADB0C}']
    { Property Methods }
    function _GetmResponseCode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmResponseCode(amResponseCode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getResponseCode: Integer; cdecl;

    { Property }
    property mResponseCode: Integer read _GetmResponseCode write _SetmResponseCode;
  end;

  TJRangersHttpException = class(TJavaGenericImport<JRangersHttpExceptionClass, JRangersHttpException>) end;

  JIDBindCallbackClass = interface(JObjectClass)
  ['{C36FE529-06A9-45C8-8C77-C2B6619A9464}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/oneid/IDBindCallback')]
  JIDBindCallback = interface(IJavaInstance)
  ['{B0DFA840-25CC-4867-99E6-7AAB7811305C}']
    { Property Methods }

    { methods }
    procedure onSuccess(P1: JIDBindResult); cdecl;
    procedure onFail(P1: Integer; P2: JString); cdecl;

    { Property }
  end;

  TJIDBindCallback = class(TJavaGenericImport<JIDBindCallbackClass, JIDBindCallback>) end;

  JIDBindResultClass = interface(JObjectClass)
  ['{591C41C2-3554-4285-990E-9292C32D4B8D}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JString): JIDBindResult; cdecl;
    {class} function copy_default(P1: JIDBindResult; P2: JString; P3: JString; P4: Integer; P5: JObject): JIDBindResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/oneid/IDBindResult')]
  JIDBindResult = interface(JObject)
  ['{2B7FA815-8947-4BAC-90B0-D3E28BC8071C}']
    { Property Methods }
    function _GetnewSsid: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnewSsid(anewSsid: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetfailedIdList: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetfailedIdList(afailedIdList: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getNewSsid: JString; cdecl;
    function getFailedIdList: JString; cdecl;
    function component1: JString; cdecl;
    function component2: JString; cdecl;
    function copy(P1: JString; P2: JString): JIDBindResult; cdecl;
    function toString: JString; cdecl;
    function hashCode: Integer; cdecl;
    function equals(P1: JObject): Boolean; cdecl;

    { Property }
    property newSsid: JString read _GetnewSsid write _SetnewSsid;
    property failedIdList: JString read _GetfailedIdList write _SetfailedIdList;
  end;

  TJIDBindResult = class(TJavaGenericImport<JIDBindResultClass, JIDBindResult>) end;

//  JAnalyticsComponentRegistrar_aClass = interface(JObjectClass)
//  ['{2DF977F4-87EE-4CFD-96D3-A0FB56A5F389}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JAnalyticsComponentRegistrar): JAnalyticsComponentRegistrar_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/onekit/AnalyticsComponentRegistrar$a')]
//  JAnalyticsComponentRegistrar_a = interface(JObject)
//  ['{BD85E9D8-7332-426A-B9AA-33F032F14383}']
//    { Property Methods }
//
//    { methods }
//    function create(P1: JComponentContainer): JObject; cdecl;
//
//    { Property }
//  end;

//  TJAnalyticsComponentRegistrar_a = class(TJavaGenericImport<JAnalyticsComponentRegistrar_aClass, JAnalyticsComponentRegistrar_a>) end;

  JAnalyticsComponentRegistrarClass = interface(JObjectClass)
  ['{12726D9F-CD2A-4521-95BD-E6B9B72F9F62}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAnalyticsComponentRegistrar; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/onekit/AnalyticsComponentRegistrar')]
  JAnalyticsComponentRegistrar = interface(JObject)
  ['{1FDC2CAD-D642-4B9D-9AE0-515D6F51C813}']
    { Property Methods }

    { methods }
    function getComponents: JList; cdecl;

    { Property }
  end;

  TJAnalyticsComponentRegistrar = class(TJavaGenericImport<JAnalyticsComponentRegistrarClass, JAnalyticsComponentRegistrar>) end;

//  JDeviceComponentRegistrar_aClass = interface(JObjectClass)
//  ['{DE62F907-A94E-4AA6-9CE7-93BBDC32C57A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDeviceComponentRegistrar): JDeviceComponentRegistrar_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/onekit/DeviceComponentRegistrar$a')]
//  JDeviceComponentRegistrar_a = interface(JObject)
//  ['{FF9F9E24-7D5F-41F5-9AD1-45B3F450B0A7}']
//    { Property Methods }
//
//    { methods }
//    function create(P1: JComponentContainer): JObject; cdecl;
//
//    { Property }
//  end;

//  TJDeviceComponentRegistrar_a = class(TJavaGenericImport<JDeviceComponentRegistrar_aClass, JDeviceComponentRegistrar_a>) end;

  JDeviceComponentRegistrarClass = interface(JObjectClass)
  ['{B87F3A99-32D2-44C5-9B6D-9392E3A4E785}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDeviceComponentRegistrar; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/onekit/DeviceComponentRegistrar')]
  JDeviceComponentRegistrar = interface(JObject)
  ['{00B895FE-5E45-4B06-92D6-2C0247A6483C}']
    { Property Methods }

    { methods }
    function getComponents: JList; cdecl;

    { Property }
  end;

  TJDeviceComponentRegistrar = class(TJavaGenericImport<JDeviceComponentRegistrarClass, JDeviceComponentRegistrar>) end;

  JUserProfileCallbackClass = interface(JObjectClass)
  ['{525015DC-BC57-4BE2-8986-7CB6522FEFEF}']
    { static Property Methods }
    {class} function _GetNO_NET: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNET_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESULT_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOT_SATISFY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREQUEST_LIMIT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property NO_NET: Integer read _GetNO_NET;
    {class} property NET_ERROR: Integer read _GetNET_ERROR;
    {class} property RESULT_ERROR: Integer read _GetRESULT_ERROR;
    {class} property NOT_SATISFY: Integer read _GetNOT_SATISFY;
    {class} property REQUEST_LIMIT: Integer read _GetREQUEST_LIMIT;
  end;

  [JavaSignature('com/bytedance/applog/profile/UserProfileCallback')]
  JUserProfileCallback = interface(IJavaInstance)
  ['{347F58F8-209A-4E4A-9BDA-95F46E839F99}']
    { Property Methods }

    { methods }
    procedure onSuccess; cdecl;
    procedure onFail(P1: Integer); cdecl;

    { Property }
  end;

  TJUserProfileCallback = class(TJavaGenericImport<JUserProfileCallbackClass, JUserProfileCallback>) end;

//  JSimulateLaunchActivityClass = interface(JAppCompatActivityClass) // or JObjectClass
//  ['{59D83B46-3A54-4F38-997F-23C8E6290834}']
//    { static Property Methods }
//    {class} function _GetKEY_URL_PREFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetKEY_URL_PREFIX_NO_QR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetDEBUG_LOG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetBIND_QUERY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetMODE_QR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetMODE_NO_QR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetentryAppId: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetentryMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetentryUrlPrefix: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetentryQrParam: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetentryType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JSimulateLaunchActivity; cdecl;
//    {class} procedure startSimulatorWithoutQR(P1: JContext; P2: JString); cdecl; overload;
//    {class} procedure startSimulatorWithoutQR(P1: JContext; P2: JString; P3: JString); cdecl; overload;
//
//    { static Property }
//    {class} property KEY_URL_PREFIX: JString read _GetKEY_URL_PREFIX;
//    {class} property KEY_URL_PREFIX_NO_QR: JString read _GetKEY_URL_PREFIX_NO_QR;
//    {class} property DEBUG_LOG: JString read _GetDEBUG_LOG;
//    {class} property BIND_QUERY: JString read _GetBIND_QUERY;
//    {class} property MODE_QR: Integer read _GetMODE_QR;
//    {class} property MODE_NO_QR: Integer read _GetMODE_NO_QR;
//    {class} property entryAppId: JString read _GetentryAppId;
//    {class} property entryMode: Integer read _GetentryMode;
//    {class} property entryUrlPrefix: JString read _GetentryUrlPrefix;
//    {class} property entryQrParam: JString read _GetentryQrParam;
//    {class} property entryType: JString read _GetentryType;
//  end;
//
//  [JavaSignature('com/bytedance/applog/simulate/SimulateLaunchActivity')]
//  JSimulateLaunchActivity = interface(JAppCompatActivity) // or JObject
//  ['{10CADC94-5EB0-4450-A124-9D174FDA60BE}']
//    { Property Methods }
//    function _Geta: JTextView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JTextView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onCreate(P1: JBundle); cdecl;
//    procedure onDestroy; cdecl;
//    function pageProperties: JJSONObject; cdecl;
//    function title: JString; cdecl;
//    function path: JString; cdecl;
//    function a: JIAppLogLogger; cdecl;
//
//    { Property }
//    property a: JTextView read _Geta write _Seta;
//  end;
//
//  TJSimulateLaunchActivity = class(TJavaGenericImport<JSimulateLaunchActivityClass, JSimulateLaunchActivity>) end;

//  JUriConfig_aClass = interface(JObjectClass)
//  ['{3C3DEA29-7C68-4282-9150-2F58D7EE7FB3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/UriConfig$a')]
//  JUriConfig_a = interface(JObject)
//  ['{CBB72C9E-B779-4BCA-9979-8811B4849258}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJUriConfig_a = class(TJavaGenericImport<JUriConfig_aClass, JUriConfig_a>) end;

  JUriConfig_BuilderClass = interface(JObjectClass)
  ['{4976C4A1-44E4-4EBF-B0FC-180A0E0F1822}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUriConfig_Builder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/UriConfig$Builder')]
  JUriConfig_Builder = interface(JObject)
  ['{5BB1AA40-2627-401D-8434-FD8EAD5CA1D2}']
    { Property Methods }
    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getd: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd(ad: TJavaObjectArray<JString>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seti(ai: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getj: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setj(aj: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getk: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setk(ak: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function setRegisterUri(P1: JString): JUriConfig_Builder; cdecl;
    function setReportOaidUri(P1: JString): JUriConfig_Builder; cdecl;
    function setActiveUri(P1: JString): JUriConfig_Builder; cdecl;
    function setSendUris(P1: TJavaObjectArray<JString>): JUriConfig_Builder; cdecl;
    function setSettingUri(P1: JString): JUriConfig_Builder; cdecl;
    function setAbUri(P1: JString): JUriConfig_Builder; cdecl;
    function setProfileUri(P1: JString): JUriConfig_Builder; cdecl;
    function setBusinessUri(P1: JString): JUriConfig_Builder; cdecl;
    function setALinkQueryUri(P1: JString): JUriConfig_Builder; cdecl;
    function setALinkAttributionUri(P1: JString): JUriConfig_Builder; cdecl;
    function setIDBindUri(P1: JString): JUriConfig_Builder; cdecl;
    function build: JUriConfig; cdecl;

    { Property }
    property a: JString read _Geta write _Seta;
    property b: JString read _Getb write _Setb;
    property c: JString read _Getc write _Setc;
    property d: TJavaObjectArray<JString> read _Getd write _Setd;
    property e: JString read _Gete write _Sete;
    property f: JString read _Getf write _Setf;
    property g: JString read _Getg write _Setg;
    property h: JString read _Geth write _Seth;
    property i: JString read _Geti write _Seti;
    property j: JString read _Getj write _Setj;
    property k: JString read _Getk write _Setk;
  end;

  TJUriConfig_Builder = class(TJavaGenericImport<JUriConfig_BuilderClass, JUriConfig_Builder>) end;

  JUriConfigClass = interface(JObjectClass)
  ['{EF3F1D56-06E2-48CB-99AE-1A76EDD4F46B}']
    { static Property Methods }
    {class} function _GetPATH_REGISTER: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATH_DEVICE_UPDATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATH_ACTIVE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATH_SEND: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATH_CONFIG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATH_AB: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATH_PROFILE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATH_ALINK_QUERY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATH_ALINK_ATTRIBUTION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATH_ID_BIND: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOMAIN_BUSINESS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function createUriConfig(P1: Integer): JUriConfig; cdecl;
    {class} function createByDomain(P1: JString; P2: TJavaObjectArray<JString>): JUriConfig; cdecl;
//    {class} function init(P1: JUriConfig_Builder; P2: JUriConfig_a): JUriConfig; cdecl;

    { static Property }
    {class} property PATH_REGISTER: JString read _GetPATH_REGISTER;
    {class} property PATH_DEVICE_UPDATE: JString read _GetPATH_DEVICE_UPDATE;
    {class} property PATH_ACTIVE: JString read _GetPATH_ACTIVE;
    {class} property PATH_SEND: JString read _GetPATH_SEND;
    {class} property PATH_CONFIG: JString read _GetPATH_CONFIG;
    {class} property PATH_AB: JString read _GetPATH_AB;
    {class} property PATH_PROFILE: JString read _GetPATH_PROFILE;
    {class} property PATH_ALINK_QUERY: JString read _GetPATH_ALINK_QUERY;
    {class} property PATH_ALINK_ATTRIBUTION: JString read _GetPATH_ALINK_ATTRIBUTION;
    {class} property PATH_ID_BIND: JString read _GetPATH_ID_BIND;
    {class} property DOMAIN_BUSINESS: JString read _GetDOMAIN_BUSINESS;
  end;

  [JavaSignature('com/bytedance/applog/UriConfig')]
  JUriConfig = interface(JObject)
  ['{A2BF0625-243B-47FC-9E51-CE239DBCB0A4}']
    { Property Methods }
    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getd: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setd(ad: TJavaObjectArray<JString>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Seti(ai: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getj: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setj(aj: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getk: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setk(ak: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getRegisterUri: JString; cdecl;
    function getReportOaidUri: JString; cdecl;
    function getActiveUri: JString; cdecl;
    function getSendUris: TJavaObjectArray<JString>; cdecl;
    function getSettingUri: JString; cdecl;
    function getAbUri: JString; cdecl;
    function getProfileUri: JString; cdecl;
    function getBusinessUri: JString; cdecl;
    function getAlinkAttributionUri: JString; cdecl;
    function getAlinkQueryUri: JString; cdecl;
    function getIDBindUri: JString; cdecl;
    procedure setRegisterUri(P1: JString); cdecl;
    procedure setReportOaidUri(P1: JString); cdecl;
    procedure setActiveUri(P1: JString); cdecl;
    procedure setSendUris(P1: TJavaObjectArray<JString>); cdecl;
    procedure setSettingUri(P1: JString); cdecl;
    procedure setAbUri(P1: JString); cdecl;
    procedure setProfileUri(P1: JString); cdecl;
    procedure setBusinessUri(P1: JString); cdecl;
    procedure setALinkQueryUri(P1: JString); cdecl;
    procedure setALinkAttributionUri(P1: JString); cdecl;

    { Property }
    property a: JString read _Geta write _Seta;
    property b: JString read _Getb write _Setb;
    property c: JString read _Getc write _Setc;
    property d: TJavaObjectArray<JString> read _Getd write _Setd;
    property e: JString read _Gete write _Sete;
    property f: JString read _Getf write _Setf;
    property g: JString read _Getg write _Setg;
    property h: JString read _Geth write _Seth;
    property i: JString read _Geti write _Seti;
    property j: JString read _Getj write _Setj;
    property k: JString read _Getk write _Setk;
  end;

  TJUriConfig = class(TJavaGenericImport<JUriConfigClass, JUriConfig>) end;

  JGeoCoordinateSystemConstClass = interface(JObjectClass)
  ['{50133C70-D33C-4F97-96BB-9AD1B91E340C}']
    { static Property Methods }
    {class} function _GetWGS84: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGCJ02: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBD09: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBDCS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JGeoCoordinateSystemConst; cdecl;

    { static Property }
    {class} property WGS84: JString read _GetWGS84;
    {class} property GCJ02: JString read _GetGCJ02;
    {class} property BD09: JString read _GetBD09;
    {class} property BDCS: JString read _GetBDCS;
  end;

  [JavaSignature('com/bytedance/applog/util/GeoCoordinateSystemConst')]
  JGeoCoordinateSystemConst = interface(JObject)
  ['{B24D6E35-5324-4D13-9867-7A439222F9CE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGeoCoordinateSystemConst = class(TJavaGenericImport<JGeoCoordinateSystemConstClass, JGeoCoordinateSystemConst>) end;

//  JHardwareUtils_aClass = interface(JObjectClass)
//  ['{495795B4-8847-4F65-82C1-A70B3F0E5331}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JHardwareUtils_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/HardwareUtils$a')]
//  JHardwareUtils_a = interface(JObject)
//  ['{C50933AB-E491-4EEF-BD89-B826EE1848EC}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//  end;

//  TJHardwareUtils_a = class(TJavaGenericImport<JHardwareUtils_aClass, JHardwareUtils_a>) end;

  JHardwareUtilsClass = interface(JObjectClass)
  ['{63308B2C-5AEE-4764-B3A9-D4D6142EABC8}']
    { static Property Methods }
    {class} function _GetGLOBAL_CACHE_GET_ANDROID_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHardwareUtils; cdecl;
    {class} function getSecureAndroidId(P1: JContext): JString; cdecl;
    {class} function getScreenOrientation(P1: JContext): Integer; cdecl;
    {class} function getOperatorName(P1: JContext): JString; cdecl;
    {class} function getOperatorMccMnc(P1: JContext): JString; cdecl;

    { static Property }
    {class} property GLOBAL_CACHE_GET_ANDROID_ID: JString read _GetGLOBAL_CACHE_GET_ANDROID_ID;
  end;

  [JavaSignature('com/bytedance/applog/util/HardwareUtils')]
  JHardwareUtils = interface(JObject)
  ['{A646F643-AC24-4EE5-A207-4A0717FF6951}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHardwareUtils = class(TJavaGenericImport<JHardwareUtilsClass, JHardwareUtils>) end;

//  JSensitiveUtils_aClass = interface(JObjectClass)
//  ['{5D0664DA-D4AB-4EAE-B312-AA0A0CF2A7EB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JSensitiveUtils_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/SensitiveUtils$a')]
//  JSensitiveUtils_a = interface(JObject)
//  ['{C8AAE544-B6B9-4A09-9DEF-148B8A6A4941}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//  end;

//  TJSensitiveUtils_a = class(TJavaGenericImport<JSensitiveUtils_aClass, JSensitiveUtils_a>) end;

//  JSensitiveUtils_bClass = interface(JObjectClass)
//  ['{2C91456B-15FC-4510-A8B9-A465A2F11070}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JSensitiveUtils_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/SensitiveUtils$b')]
//  JSensitiveUtils_b = interface(JObject)
//  ['{DBFFAF61-B8A4-4DB7-9449-C9DBCF9739FD}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//  end;

//  TJSensitiveUtils_b = class(TJavaGenericImport<JSensitiveUtils_bClass, JSensitiveUtils_b>) end;

//  JSensitiveUtils_cClass = interface(JObjectClass)
//  ['{7FB8A1CA-AE6B-4FD4-9B04-DBE037E91F47}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JSensitiveUtils_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/SensitiveUtils$c')]
//  JSensitiveUtils_c = interface(JObject)
//  ['{2926FD30-C3B8-44B3-8ACA-D7C7D050D31F}']
//    { Property Methods }
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//  end;

//  TJSensitiveUtils_c = class(TJavaGenericImport<JSensitiveUtils_cClass, JSensitiveUtils_c>) end;

//  JSensitiveUtils_dClass = interface(JObjectClass)
//  ['{3D4E90FD-7F1C-4D64-97DA-41260082184D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JSensitiveUtils_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/SensitiveUtils$d')]
//  JSensitiveUtils_d = interface(JObject)
//  ['{3DDB20E8-EF2D-4BE7-95F9-E5A7E02CD647}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//  end;

//  TJSensitiveUtils_d = class(TJavaGenericImport<JSensitiveUtils_dClass, JSensitiveUtils_d>) end;

//  JSensitiveUtils_eClass = interface(JObjectClass)
//  ['{7AFAF711-9E11-4791-8F9D-D7C1F510854D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JSensitiveUtils_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/SensitiveUtils$e')]
//  JSensitiveUtils_e = interface(JObject)
//  ['{51F8915B-DE56-4526-93CB-F104A35BEFE5}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//  end;

//  TJSensitiveUtils_e = class(TJavaGenericImport<JSensitiveUtils_eClass, JSensitiveUtils_e>) end;

  JSensitiveUtilsClass = interface(JObjectClass)
  ['{E265AD27-4DFA-4513-BB7D-47A25EE79451}']
    { static Property Methods }
    {class} function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHANNEL_APP_KEY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_MAC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_MC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_BUILD_SERIAL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_ALIYUN_UUID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSensitiveUtils; cdecl; overload;
    {class} function getDeviceId(P1: JContext): JString; cdecl;
    {class} function getSimSerialNumbers(P1: JContext): TJavaObjectArray<JString>; cdecl;
    {class} function getMacAddress(P1: JISensitiveInfoProvider; P2: JContext): JString; cdecl;
    {class} function getMacAddressFromSystem(P1: JContext): JString; cdecl;
    {class} function getMultiImeiFromSystem(P1: JContext): JJSONArray; cdecl;
    {class} function getMultiImeiFallback(P1: JContext): JJSONArray; cdecl;
    {class} function validMultiImei(P1: JString): Boolean; cdecl; overload;
    {class} function validMultiImei(P1: JJSONArray): Boolean; cdecl; overload;
    {class} function a(P1: JString; P2: Integer; P3: JString): JJSONObject; cdecl; overload;
//    {class} function a(P1: JString): TJavaObjectArray<JClass>; cdecl; overload;
    {class} function a(P1: JContext; P2: Integer): JString; cdecl; overload;
    {class} function getSerialNumber(P1: JContext): JString; cdecl;
//    {class} procedure appendSensitiveParams(P1: Ja3; P2: JJSONObject; P3: JMap; P4: Boolean; P5: JLevel); cdecl;
//    {class} procedure addSensitiveParamsForUrlQuery(P1: Ja3; P2: JStringBuilder; P3: JJSONObject); cdecl;
    {class} function hasReadPhoneStatePermission(P1: JContext): Boolean; cdecl;
    {class} function hasPermission(P1: JContext; P2: JString): Boolean; cdecl;
//    {class} function init: JSensitiveUtils; cdecl; overload;

    { static Property }
    {class} property a: JList read _Geta;
    {class} property CHANNEL_APP_KEY: JString read _GetCHANNEL_APP_KEY;
    {class} property KEY_MAC: JString read _GetKEY_MAC;
    {class} property KEY_MC: JString read _GetKEY_MC;
    {class} property KEY_BUILD_SERIAL: JString read _GetKEY_BUILD_SERIAL;
    {class} property KEY_ALIYUN_UUID: JString read _GetKEY_ALIYUN_UUID;
  end;

  [JavaSignature('com/bytedance/applog/util/SensitiveUtils')]
  JSensitiveUtils = interface(JObject)
  ['{054175DF-5032-4AF3-8E04-3570A905F101}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSensitiveUtils = class(TJavaGenericImport<JSensitiveUtilsClass, JSensitiveUtils>) end;

  JUriConstantsClass = interface(JObjectClass)
  ['{14AA8538-C124-4BF4-9CDC-FFB50A95F1AC}']
    { static Property Methods }
    {class} function _GetDEFAULT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREGION_DEFAULT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOB_CHINA_NEW: JUriConfig;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JUriConstants; cdecl; overload;
    {class} function createUriConfig(P1: Integer): JUriConfig; cdecl;
//    {class} function init: JUriConstants; cdecl; overload;

    { static Property }
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property REGION_DEFAULT: Integer read _GetREGION_DEFAULT;
    {class} property TOB_CHINA_NEW: JUriConfig read _GetTOB_CHINA_NEW;
  end;

  [JavaSignature('com/bytedance/applog/util/UriConstants')]
  JUriConstants = interface(JObject)
  ['{504F7216-C399-4C69-BFA1-17D7EB020D42}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUriConstants = class(TJavaGenericImport<JUriConstantsClass, JUriConstants>) end;

//  JWebViewJsUtil_aClass = interface(JObjectClass)
//  ['{0FFDB708-43CB-4D22-93C0-9479C01CA926}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHandler; P2: JWebView): JWebViewJsUtil_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$a')]
//  JWebViewJsUtil_a = interface(JObject)
//  ['{BBAC3805-AF5A-4AA9-803C-1BB398B590E5}']
//    { Property Methods }
//    function _Geta: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JWebView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JWebView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onReceiveValue(P1: JObject); cdecl;
//
//    { Property }
//    property a: JHandler read _Geta write _Seta;
//    property b: JWebView read _Getb write _Setb;
//  end;

//  TJWebViewJsUtil_a = class(TJavaGenericImport<JWebViewJsUtil_aClass, JWebViewJsUtil_a>) end;

//  JWebViewJsUtil_bClass = interface(JObjectClass)
//  ['{0D7F6A98-FBB1-476D-8527-1E38C93C9984}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JWebViewJsUtil_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$b')]
//  JWebViewJsUtil_b = interface(JObject)
//  ['{AC07DCD0-EE35-4C9F-AF98-147E3F3A9360}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJWebViewJsUtil_b = class(TJavaGenericImport<JWebViewJsUtil_bClass, JWebViewJsUtil_b>) end;

//  JWebViewJsUtil_cClass = interface(JObjectClass)
//  ['{B6750754-5F0E-4A4B-A44F-7A0B02FE6D42}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JWebViewJsUtil_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$c')]
//  JWebViewJsUtil_c = interface(JObject)
//  ['{3D429CB5-DC4C-41F9-A660-AB5462B4932F}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl;
//
//    { Property }
//  end;

//  TJWebViewJsUtil_c = class(TJavaGenericImport<JWebViewJsUtil_cClass, JWebViewJsUtil_c>) end;

//  JWebViewJsUtil_dClass = interface(JObjectClass)
//  ['{D9F7D19E-D3C1-4A21-A97F-3319A44A7B7A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JWebViewJsUtil_g): JWebViewJsUtil_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$d')]
//  JWebViewJsUtil_d = interface(JObject)
//  ['{41A3AC4D-4E72-4F4F-8B30-39D88F9D960A}']
//    { Property Methods }
//    function _Geta: JWebViewJsUtil_g;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JWebViewJsUtil_g);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onReceiveValue(P1: JObject); cdecl;
//
//    { Property }
//    property a: JWebViewJsUtil_g read _Geta write _Seta;
//  end;

//  TJWebViewJsUtil_d = class(TJavaGenericImport<JWebViewJsUtil_dClass, JWebViewJsUtil_d>) end;

//  JWebViewJsUtil_eClass = interface(JObjectClass)
//  ['{008C6D83-05A2-4E86-A9AD-BC17C4579940}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JWebViewJsUtil_g): JWebViewJsUtil_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$e')]
//  JWebViewJsUtil_e = interface(JObject)
//  ['{763CE871-6384-4671-97EB-568ECBD2015E}']
//    { Property Methods }
//    function _Geta: JWebViewJsUtil_g;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JWebViewJsUtil_g);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onReceiveValue(P1: JObject); cdecl;
//
//    { Property }
//    property a: JWebViewJsUtil_g read _Geta write _Seta;
//  end;

//  TJWebViewJsUtil_e = class(TJavaGenericImport<JWebViewJsUtil_eClass, JWebViewJsUtil_e>) end;

//  JWebViewJsUtil_fClass = interface(JObjectClass)
//  ['{D0B105F2-D94A-443C-BA5A-6FF25415739D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JString; P3: Boolean; P4: JJSONObject): JWebViewJsUtil_f; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$f')]
//  JWebViewJsUtil_f = interface(JObject)
//  ['{8A4B40F4-5B18-419F-9F35-E0BE410B349C}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Jd3; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: Boolean read _Getc write _Setc;
//    property d: JJSONObject read _Getd write _Setd;
//  end;

//  TJWebViewJsUtil_f = class(TJavaGenericImport<JWebViewJsUtil_fClass, JWebViewJsUtil_f>) end;

//  JWebViewJsUtil_gClass = interface(JObjectClass)
//  ['{E7ABBD75-7B7A-4262-A43D-E83DE203048D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$g')]
//  JWebViewJsUtil_g = interface(IJavaInstance)
//  ['{AA25C2EB-FC62-4583-B1D1-BC70B7D0FF5C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJWebViewJsUtil_g = class(TJavaGenericImport<JWebViewJsUtil_gClass, JWebViewJsUtil_g>) end;

//  JWebViewJsUtil_hClass = interface(JObjectClass)
//  ['{64AB4D7C-2B9C-4FFC-9025-B80128C58262}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JWebViewJsUtil_h; cdecl; overload;
//    {class} function init(P1: JWebViewJsUtil_a): JWebViewJsUtil_h; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$h')]
//  JWebViewJsUtil_h = interface(JObject)
//  ['{A17DA62C-952E-45AE-8416-E004D5F5C4D5}']
//    { Property Methods }
//
//    { methods }
//    procedure postMessage(P1: JString); cdecl;
//
//    { Property }
//  end;

//  TJWebViewJsUtil_h = class(TJavaGenericImport<JWebViewJsUtil_hClass, JWebViewJsUtil_h>) end;

  JWebViewJsUtilClass = interface(JObjectClass)
  ['{5F5BB83A-041C-4DF8-9662-564FC6586C9F}']
    { static Property Methods }
    {class} function _GetloggerTags: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUNDLE_WEB_INFO: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJS_URL_PREFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJS_CODE_COLLECT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJS_CODE_MARQUEE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JWebViewJsUtil; cdecl; overload;
    {class} procedure getWebInfo(P1: JWebView; P2: JHandler); cdecl;
    {class} procedure injectNativeReportCallback(P1: JView); cdecl;
    {class} procedure injectCollectJs(P1: JView; P2: JString); cdecl;
    {class} procedure evaluateJavascript(P1: JView; P2: JString); cdecl; overload;
//    {class} procedure evaluateJavascript(P1: JView; P2: JString; P3: JWebViewJsUtil_g); cdecl; overload;
    {class} procedure loadUrl(P1: JView; P2: JString; P3: JMap); cdecl;
    {class} procedure loadData(P1: JView; P2: JString; P3: JString; P4: JString); cdecl;
    {class} procedure loadDataWithBaseURL(P1: JView; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString); cdecl;
    {class} function getJsCodeUrl(P1: JString): JString; cdecl;
    {class} procedure sendWebClick(P1: JString); cdecl;
//    {class} function create(P1: JString; P2: JString; P3: Boolean; P4: JJSONObject): Jk3; cdecl;
    {class} function access_000: JList; cdecl;
    {class} procedure access_100(P1: JString); cdecl;
//    {class} function access_300(P1: JString; P2: JString; P3: Boolean; P4: JJSONObject): Jk3; cdecl;
//    {class} function init: JWebViewJsUtil; cdecl; overload;

    { static Property }
    {class} property loggerTags: JList read _GetloggerTags;
    {class} property BUNDLE_WEB_INFO: JString read _GetBUNDLE_WEB_INFO;
    {class} property JS_URL_PREFIX: JString read _GetJS_URL_PREFIX;
    {class} property JS_CODE_COLLECT: JString read _GetJS_CODE_COLLECT;
    {class} property JS_CODE_MARQUEE: JString read _GetJS_CODE_MARQUEE;
  end;

  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil')]
  JWebViewJsUtil = interface(JObject)
  ['{FC26458C-C13F-450B-A189-E130CBE8856A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWebViewJsUtil = class(TJavaGenericImport<JWebViewJsUtilClass, JWebViewJsUtil>) end;

//  JaClass = interface(JObjectClass)
//  ['{131A52EC-9523-4AA9-B076-3FD54575E678}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): JStringBuilder; cdecl; overload;
//    {class} procedure a(P1: JSharedPreferences; P2: JString; P3: JString); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a')]
//  Ja = interface(JObject)
//  ['{38D654F4-129A-4353-9BEC-EE9F11C2B6A3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  Ja0Class = interface(JObjectClass)
//  ['{265BDFC6-E5C9-4772-B051-04A58D5FA8F5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Ja0; cdecl; overload;
//    {class} function init(P1: Jc0; P2: Int64): Ja0; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a0')]
//  Ja0 = interface(JObject)
//  ['{3FF47B62-8E44-4C69-BF21-BB613D3345E7}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Int64; cdecl;
//    function f: Boolean; cdecl;
//    function g: Int64; cdecl;
//    function e: TJavaArray<Int64>; cdecl;
//    function c: Boolean; cdecl;
//    function d: JString; cdecl;
//    function b: Int64; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//    property c: Int64 read _Getc write _Setc;
//    property d: Boolean read _Getd write _Setd;
//    property e: Jc0 read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//  end;

//  TJa0 = class(TJavaGenericImport<Ja0Class, Ja0>) end;

//  Ja1Class = interface(JObjectClass)
//  ['{3D9BBB14-A74F-424F-B155-FC558B532DEF}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JFile): JString; cdecl; overload;
//    {class} function a(P1: JDataInput): Word; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
//    {class} function init: Ja1; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Byte> read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a1')]
//  Ja1 = interface(JObject)
//  ['{0080A423-F673-4A3B-8364-7A1E2E2C8B79}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1 = class(TJavaGenericImport<Ja1Class, Ja1>) end;

//  Ja2Class = interface(Jg1Class) // or JObjectClass
//  ['{2628D7FF-9938-47F2-9A55-78E6CED82238}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Ja2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a2')]
//  Ja2 = interface(Jg1) // or JObject
//  ['{6F0F6375-188C-40AA-8DCE-93591F8681DF}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//  end;

//  TJa2 = class(TJavaGenericImport<Ja2Class, Ja2>) end;

//  Ja3_aClass = interface(JObjectClass)
//  ['{6A9EB818-58F4-4BF2-A90E-8299B0D16097}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JString; P3: JClass): Ja3_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a3$a')]
//  Ja3_a = interface(JObject)
//  ['{530CE866-90E7-4C48-AF1F-CAF5858A11B8}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JClass;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JClass);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JClass read _Getc write _Setc;
//  end;

//  TJa3_a = class(TJavaGenericImport<Ja3_aClass, Ja3_a>) end;

//  Ja3Class = interface(JObjectClass)
//  ['{54F396F0-D53C-4720-8A2E-3081D789691E}']
//    { static Property Methods }
//    {class} function _Getc: TJavaObjectArray<Ja3_a>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd): Ja3; cdecl; overload;
//    {class} function init: Ja3; cdecl; overload;
//
//    { static Property }
//    {class} property c: TJavaObjectArray<Ja3_a> read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a3')]
//  Ja3 = interface(JObject)
//  ['{CCDEC0C3-AF10-4C2F-A82A-5A219CC8240E}']
//    { Property Methods }
//    function _Geta: JIExtraParams;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIExtraParams);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject; P2: JString; P3: Boolean; P4: JLevel): JString; cdecl; overload;
//    procedure a(P1: JJSONObject; P2: Boolean; P3: JMap; P4: JLevel); cdecl; overload;
//    function a(P1: Jc0; P2: JJSONObject; P3: Integer): TJavaObjectArray<JString>; cdecl; overload;
//    function a(P1: JJSONObject; P2: JString; P3: JObject; P4: JClass): JObject; cdecl; overload;
//
//    { Property }
//    property a: JIExtraParams read _Geta write _Seta;
//    property b: Jd read _Getb write _Setb;
//  end;

//  TJa3 = class(TJavaGenericImport<Ja3Class, Ja3>) end;

//  Ja4Class = interface(JObjectClass)
//  ['{A51F9D8B-0080-4FE8-B395-D570D6A3E496}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a4')]
//  Ja4 = interface(IJavaInstance)
//  ['{2E0DFD8C-4D6D-4576-A2DF-E7939AA7CCBE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa4 = class(TJavaGenericImport<Ja4Class, Ja4>) end;

//  Jb_aClass = interface(JObjectClass)
//  ['{1890012C-230E-498E-A012-D8C781919F12}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b$a')]
//  Jb_a = interface(JObject)
//  ['{15F3674F-117C-4181-9858-FD8F538127C9}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  Jb_bClass = interface(JObjectClass)
//  ['{5522835E-8F15-4E90-854E-7F22BAF30D36}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b$b')]
//  Jb_b = interface(JObject)
//  ['{B244D562-1924-48A7-8912-F3C6B37AA401}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJb_b = class(TJavaGenericImport<Jb_bClass, Jb_b>) end;

//  Jb_cClass = interface(JObjectClass)
//  ['{337916AC-3B5C-4BA8-B5A8-496DABD4FB2D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b$c')]
//  Jb_c = interface(IJavaInstance)
//  ['{3CF728B0-817D-4C2E-853E-C0098D51D225}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jd); cdecl;
//
//    { Property }
//  end;

//  TJb_c = class(TJavaGenericImport<Jb_cClass, Jb_c>) end;

//  Jb_dClass = interface(JObjectClass)
//  ['{3327917A-B077-4E88-8C41-70D27AF2A108}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b$d')]
//  Jb_d = interface(IJavaInstance)
//  ['{6CB9DE70-0191-4B58-8728-A5C1FC4DC246}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJb_d = class(TJavaGenericImport<Jb_dClass, Jb_d>) end;

//  Jb_eClass = interface(JObjectClass)
//  ['{8CF11205-C6F3-4B11-8565-98841D4034A8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b$e')]
//  Jb_e = interface(IJavaInstance)
//  ['{D8676704-ED4D-4650-B7C1-0EF6BD65CA34}']
//    { Property Methods }
//
//    { methods }
//    function a: Jd3; cdecl;
//
//    { Property }
//  end;

//  TJb_e = class(TJavaGenericImport<Jb_eClass, Jb_e>) end;

//  JbClass = interface(JObjectClass)
//  ['{3157D3E9-BE36-492F-8211-90F88C82FD14}']
//    { static Property Methods }
//    {class} function _Geta: Jb_d;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jb_d;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function b(P1: JString): Boolean; cdecl;
//    {class} function a(P1: JString): Jd; cdecl; overload;
//    {class} procedure a(P1: TJavaObjectArray<JString>); cdecl; overload;
//    {class} procedure a(P1: Jd3; P2: Jb_d); cdecl; overload;
//    {class} procedure a(P1: Jb_e; P2: Jb_d); cdecl; overload;
//    {class} function a(P1: Jb_d): Boolean; cdecl; overload;
//    {class} procedure a(P1: Jb_c); cdecl; overload;
//    {class} function a(P1: JIAppLogInstance; P2: JString): JString; cdecl; overload;
//    {class} function init: Jb; cdecl;
//
//    { static Property }
//    {class} property a: Jb_d read _Geta;
//    {class} property b: Jb_d read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b')]
//  Jb = interface(JObject)
//  ['{CC909CDE-CBEC-4387-ADDE-7016CD570D6A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  Jb0_aClass = interface(JObjectClass)
//  ['{2B2E530A-676B-4515-97C9-D46712AAD10C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb0; P2: JJSONObject): Jb0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b0$a')]
//  Jb0_a = interface(JObject)
//  ['{B9C46D6D-F858-4BAA-AAD3-0CECD182B79B}']
//    { Property Methods }
//    function _Geta: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jb0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jb0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JJSONObject read _Geta write _Seta;
//    property b: Jb0 read _Getb write _Setb;
//  end;

//  TJb0_a = class(TJavaGenericImport<Jb0_aClass, Jb0_a>) end;

//  Jb0Class = interface(Ja0Class) // or JObjectClass
//  ['{57945F61-F6E8-4397-975F-CDD3EC00780A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jb0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b0')]
//  Jb0 = interface(Ja0) // or JObject
//  ['{DDC309DD-3EDA-4448-9B1A-811E9686D1DD}']
//    { Property Methods }
//
//    { methods }
//    function f: Boolean; cdecl;
//    function g: Int64; cdecl;
//    function e: TJavaArray<Int64>; cdecl;
//    function c: Boolean; cdecl;
//    function d: JString; cdecl;
//
//    { Property }
//  end;

//  TJb0 = class(TJavaGenericImport<Jb0Class, Jb0>) end;

//  Jb1Class = interface(JObjectClass)
//  ['{8D3E3E31-FFB5-4F52-A8DD-0FFFF057C8D6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Jb1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b1')]
//  Jb1 = interface(JObject)
//  ['{767FA19C-D5BA-438F-8526-C8EF8FBBB735}']
//    { Property Methods }
//
//    { methods }
//    procedure onLog(P1: JLogInfo); cdecl;
//
//    { Property }
//  end;

//  TJb1 = class(TJavaGenericImport<Jb1Class, Jb1>) end;

//  Jb2Class = interface(JObjectClass)
//  ['{48B92586-46CF-405A-ACA3-71E464AD53B9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b2')]
//  Jb2 = interface(JObject)
//  ['{F66D24F9-F08A-4B03-A93E-AEBE56F90EB5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb2 = class(TJavaGenericImport<Jb2Class, Jb2>) end;

//  Jb3Class = interface(JAsyncTaskClass) // or JObjectClass
//  ['{4D229901-CF93-40EA-BC1E-506AF7F786BA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: Jd); cdecl;
//    {class} function init(P1: Jd): Jb3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b3')]
//  Jb3 = interface(JAsyncTask) // or JObject
//  ['{EA09AEA6-269B-4362-8E87-C98A96F8E60A}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onPostExecute(P1: JObject); cdecl;
//    function doInBackground(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JString read _Getf write _Setf;
//    property g: Jd read _Getg write _Setg;
//  end;

//  TJb3 = class(TJavaGenericImport<Jb3Class, Jb3>) end;

//  Jb4Class = interface(JObjectClass)
//  ['{2134518A-E787-48D1-B280-CD8266BA7DE1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b4')]
//  Jb4 = interface(JObject)
//  ['{ACE07D91-9D9D-4DFD-A2FD-9684559CD391}']
//    { Property Methods }
//    function _Geta: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JObject read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//  end;

//  TJb4 = class(TJavaGenericImport<Jb4Class, Jb4>) end;

//  Jc_aClass = interface(JObjectClass)
//  ['{4FC472C8-A9E0-4E82-8752-BA5E2D1E48ED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc; P2: Jd): Jc_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c$a')]
//  Jc_a = interface(JObject)
//  ['{697D0DCB-FA2F-40CB-8904-ED568E735226}']
//    { Property Methods }
//    function _Geta: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jd read _Geta write _Seta;
//  end;

//  TJc_a = class(TJavaGenericImport<Jc_aClass, Jc_a>) end;

//  JcClass = interface(JObjectClass)
//  ['{A4233E0D-1AA2-4FAE-8E09-4EF7BAEEDA87}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c')]
//  Jc = interface(JObject)
//  ['{DE8089D6-450C-413F-ACED-A17AA4C7735A}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jd); cdecl;
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  Jc0_aClass = interface(JObjectClass)
//  ['{FC630ED7-D173-4B7B-933A-E888937E9422}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jc0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c0$a')]
//  Jc0_a = interface(JObject)
//  ['{56353FA6-4B0A-4C60-A20A-46F0F9D3F2EF}']
//    { Property Methods }
//    function _Geta: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: Jc0 read _Geta write _Seta;
//  end;

//  TJc0_a = class(TJavaGenericImport<Jc0_aClass, Jc0_a>) end;

//  Jc0_bClass = interface(JObjectClass)
//  ['{F12E449B-774D-477D-A67E-49F1EF81280B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jc0_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c0$b')]
//  Jc0_b = interface(JObject)
//  ['{84CE7310-DAD5-4960-91BE-8F8E48F7FFC1}']
//    { Property Methods }
//    function _Geta: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JMap); cdecl;
//
//    { Property }
//    property a: Jc0 read _Geta write _Seta;
//  end;

//  TJc0_b = class(TJavaGenericImport<Jc0_bClass, Jc0_b>) end;

//  Jc0_cClass = interface(JObjectClass)
//  ['{F54055B4-AB68-40C2-A8F3-E46EF8BFED64}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: JObject): Jc0_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c0$c')]
//  Jc0_c = interface(JObject)
//  ['{4A50A8FC-444F-4D81-949C-679E4F665ADB}']
//    { Property Methods }
//    function _Geta: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JObject read _Geta write _Seta;
//  end;

//  TJc0_c = class(TJavaGenericImport<Jc0_cClass, Jc0_c>) end;

//  Jc0_dClass = interface(Jc0_cClass) // or JObjectClass
//  ['{ADB15A79-F86E-4481-B94C-399B4D8511F3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: JString): Jc0_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c0$d')]
//  Jc0_d = interface(Jc0_c) // or JObject
//  ['{CD09E25A-A430-4FAC-8991-0824075E45E2}']
//    { Property Methods }
//    function _Getb: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property b: Jc0 read _Getb write _Setb;
//  end;

//  TJc0_d = class(TJavaGenericImport<Jc0_dClass, Jc0_d>) end;

//  Jc0Class = interface(JObjectClass)
//  ['{0535920A-0401-480B-942E-920615707E40}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Jl1; P3: Jn1; P4: Jf1): Jc0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c0')]
//  Jc0 = interface(JObject)
//  ['{F89BA059-1373-4EC6-B129-CA7F94E61C33}']
//    { Property Methods }
//    function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jz;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jz);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jb0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jb0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Jj3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Jj3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Jn1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jn1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Jf0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Jf0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Jg0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Jg0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: Jy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: Jy);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Jh0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Jh0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: JUriConfig;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: JUriConfig);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: Jc2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Jc2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: Ja0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Ja0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: Je0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: Je0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: Jr0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: Jr0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: JInitConfig_IpcDataChecker;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: JInitConfig_IpcDataChecker);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetA: Jt2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetA(aA: Jt2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetB: Ji;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: Ji);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetC: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetC(aC: Jf1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetD: Jd0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetD(aD: Jd0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetE: Jn2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetE(aE: Jn2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function d: JString; cdecl; overload;
//    function b: JContext; cdecl; overload;
//    procedure a(P1: JLong); cdecl; overload;
//    function c: Jj3; cdecl; overload;
//    function e: JUriConfig; cdecl; overload;
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//    function a(P1: Boolean): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//    procedure a(P1: TJavaObjectArray<JString>; P2: Boolean); cdecl; overload;
//    function g: Boolean; cdecl;
//    procedure b(P1: Jd3); cdecl; overload;
//    procedure a(P1: Jd3); cdecl; overload;
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    procedure d(P1: JJSONObject); cdecl; overload;
//    procedure e(P1: JJSONObject); cdecl; overload;
//    procedure f(P1: JJSONObject); cdecl; overload;
//    procedure c(P1: JJSONObject); cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//    procedure a(P1: Ja0); cdecl; overload;
//    procedure a(P1: JString; P2: JString); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//    function f: Boolean; cdecl; overload;
//
//    { Property }
//    property a: Int64 read _Geta write _Seta;
//    property b: Jz read _Getb write _Setb;
//    property c: Boolean read _Getc write _Setc;
//    property d: Jd read _Getd write _Setd;
//    property e: Jl1 read _Gete write _Sete;
//    property f: Jb0 read _Getf write _Setf;
//    property g: JArrayList read _Getg write _Setg;
//    property h: Jj3 read _Geth write _Seth;
//    property i: Jn1 read _Geti write _Seti;
//    property j: JHandler read _Getj write _Setj;
//    property k: Jf0 read _Getk write _Setk;
//    property l: Jg0 read _Getl write _Setl;
//    property m: Jy read _Getm write _Setm;
//    property n: Jh0 read _Getn write _Setn;
//    property o: JUriConfig read _Geto write _Seto;
//    property p: JHandler read _Getp write _Setp;
//    property q: Jc2 read _Getq write _Setq;
//    property r: Boolean read _Getr write _Setr;
//    property s: Ja0 read _Gets write _Sets;
//    property t: Je0 read _Gett write _Sett;
//    property u: JArrayList read _Getu write _Setu;
//    property v: Boolean read _Getv write _Setv;
//    property w: Int64 read _Getw write _Setw;
//    property x: JList read _Getx write _Setx;
//    property y: Jr0 read _Gety write _Sety;
//    property z: JInitConfig_IpcDataChecker read _Getz write _Setz;
//    property A: Jt2 read _GetA write _SetA;
//    property B: Ji read _GetB write _SetB;
//    property C: Jf1 read _GetC write _SetC;
//    property D: Jd0 read _GetD write _SetD;
//    property E: Jn2 read _GetE write _SetE;
//  end;

//  TJc0 = class(TJavaGenericImport<Jc0Class, Jc0>) end;

//  Jc1Class = interface(JObjectClass)
//  ['{FD3E0511-4C79-4B60-BF70-3428A23C6568}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JILogger): Jc1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c1')]
//  Jc1 = interface(JObject)
//  ['{4157AA1E-05BA-470F-BBBB-E75197DABB28}']
//    { Property Methods }
//    function _Geta: JILogger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JILogger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onLog(P1: JLogInfo); cdecl;
//
//    { Property }
//    property a: JILogger read _Geta write _Seta;
//  end;

//  TJc1 = class(TJavaGenericImport<Jc1Class, Jc1>) end;

//  Jc2Class = interface(JObjectClass)
//  ['{CA78365E-ECDD-4190-98DD-9465F5B86E53}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c2')]
//  Jc2 = interface(IJavaInstance)
//  ['{AC34683B-0799-4644-A52A-B3567AD470E0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc2 = class(TJavaGenericImport<Jc2Class, Jc2>) end;

//  Jc3_aClass = interface(JObjectClass)
//  ['{A713C111-A8F6-419F-8704-850635746F77}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc3; P2: JAccount): Jc3_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c3$a')]
//  Jc3_a = interface(JObject)
//  ['{479916BA-6CC8-4316-B169-DB23E2700EAA}']
//    { Property Methods }
//    function _Geta: JAccount;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JAccount);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jc3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jc3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JAccount read _Geta write _Seta;
//    property b: Jc3 read _Getb write _Setb;
//  end;

//  TJc3_a = class(TJavaGenericImport<Jc3_aClass, Jc3_a>) end;

//  Jc3Class = interface(Je3Class) // or JObjectClass
//  ['{40FCF28F-EFA3-4BF4-830E-A86DAB85DA2E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext): Jc3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c3')]
//  Jc3 = interface(Je3) // or JObject
//  ['{CBA099A2-ADA6-474D-ABD2-41030A441B1D}']
//    { Property Methods }
//    function _Getc: JAccountManager;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JAccountManager);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JAccount;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JAccount);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JConcurrentHashMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JConcurrentHashMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JString; P2: JString); cdecl; overload;
//    function b(P1: JString): JString; cdecl;
//    function c(P1: JString): TJavaObjectArray<JString>; cdecl;
//    procedure a(P1: JString; P2: TJavaObjectArray<JString>); cdecl; overload;
//    procedure a(P1: JAccount); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//    property c: JAccountManager read _Getc write _Setc;
//    property d: JAccount read _Getd write _Setd;
//    property e: JConcurrentHashMap read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//  end;

//  TJc3 = class(TJavaGenericImport<Jc3Class, Jc3>) end;

//  Jc4_aClass = interface(JEnumClass) // or JObjectClass
//  ['{12E68461-44D8-498C-AC4B-A912F79A9634}']
//    { static Property Methods }
//    {class} function _Getb: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: TJavaObjectArray<Jc4_a>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jc4_a>; cdecl;
//    {class} function valueOf(P1: JString): Jc4_a; cdecl;
//    {class} function init(P1: JString; P2: Integer; P3: Integer): Jc4_a; cdecl; overload;
//    {class} function init: Jc4_a; cdecl; overload;
//
//    { static Property }
//    {class} property b: Jc4_a read _Getb;
//    {class} property c: Jc4_a read _Getc;
//    {class} property d: Jc4_a read _Getd;
//    {class} property e: Jc4_a read _Gete;
//    {class} property f: Jc4_a read _Getf;
//    {class} property g: Jc4_a read _Getg;
//    {class} property h: Jc4_a read _Geth;
//    {class} property i: Jc4_a read _Geti;
//    {class} property j: Jc4_a read _Getj;
//    {class} property k: Jc4_a read _Getk;
//    {class} property l: Jc4_a read _Getl;
//    {class} property m: Jc4_a read _Getm;
//    {class} property n: TJavaObjectArray<Jc4_a> read _Getn;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c4$a')]
//  Jc4_a = interface(JEnum) // or JObject
//  ['{C6B828F7-7A29-437E-8C05-78FEF5198A98}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Boolean; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;

//  TJc4_a = class(TJavaGenericImport<Jc4_aClass, Jc4_a>) end;

//  Jc4Class = interface(JObjectClass)
//  ['{47A59E0E-AE73-4B5F-82E6-120121757209}']
//    { static Property Methods }
//    {class} function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jc4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JContext; P2: Boolean): JString; cdecl; overload;
//    {class} function a(P1: JContext): Jc4_a; cdecl; overload;
//    {class} function b(P1: JContext; P2: Boolean): Jc4_a; cdecl; overload;
//    {class} function b(P1: JContext): Boolean; cdecl; overload;
//    {class} function init: Jc4; cdecl;
//
//    { static Property }
//    {class} property a: Int64 read _Geta;
//    {class} property b: Jc4_a read _Getb;
//    {class} property c: Boolean read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c4')]
//  Jc4 = interface(JObject)
//  ['{8FC09BB0-2278-497F-80E7-F5D8AF673A80}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc4 = class(TJavaGenericImport<Jc4Class, Jc4>) end;

//  Jd_aClass = interface(JObjectClass)
//  ['{4E4EC51C-49B9-47D7-97D0-2956B4644115}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Boolean): Jd_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d$a')]
//  Jd_a = interface(JObject)
//  ['{A900C4DA-108B-4C44-AFE8-179B21584A05}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//    property b: Jd read _Getb write _Setb;
//  end;

//  TJd_a = class(TJavaGenericImport<Jd_aClass, Jd_a>) end;

//  Jd_bClass = interface(JObjectClass)
//  ['{649624A8-102A-4CCC-9CDF-4B66EEA57A61}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Boolean): Jd_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d$b')]
//  Jd_b = interface(JObject)
//  ['{D7A3DB66-D3F6-49B7-8B76-C6555B45D15D}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//    property b: Jd read _Getb write _Setb;
//  end;

//  TJd_b = class(TJavaGenericImport<Jd_bClass, Jd_b>) end;

//  Jd_cClass = interface(JObjectClass)
//  ['{745FEEC1-BF7D-4EA7-B581-CAFB566D136D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Boolean): Jd_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d$c')]
//  Jd_c = interface(JObject)
//  ['{AE0CF440-EA33-4F95-AE64-8D9A4E39F892}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//    property b: Jd read _Getb write _Setb;
//  end;

//  TJd_c = class(TJavaGenericImport<Jd_cClass, Jd_c>) end;

//  Jd_dClass = interface(JObjectClass)
//  ['{A9012026-1C9F-4BB3-AC0B-41E9E4060AE1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Boolean): Jd_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d$d')]
//  Jd_d = interface(JObject)
//  ['{CA6BCEBF-BC3F-412B-AD42-02DD88F5573E}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//    property b: Jd read _Getb write _Setb;
//  end;

//  TJd_d = class(TJavaGenericImport<Jd_dClass, Jd_d>) end;

//  JdClass = interface(JObjectClass)
//  ['{0878CD83-F2E9-4535-8BE6-6FE9EB378D3D}']
//    { static Property Methods }
//    {class} function _GetJ: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetK: JAtomicInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jd; cdecl; overload;
//    {class} function init: Jd; cdecl; overload;
//
//    { static Property }
//    {class} property J: JList read _GetJ;
//    {class} property K: JAtomicInteger read _GetK;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d')]
//  Jd = interface(JObject)
//  ['{9683A56D-0762-4E33-95F2-61F772D15522}']
//    { Property Methods }
//    function _Geta: JConcurrentHashMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JConcurrentHashMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jw0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jw0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jv0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jv0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jq1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jq1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jf1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Ja3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Ja3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Jy2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: JApplication;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: JApplication);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: Jn1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: Jn1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: Jv;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: Jv);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: JViewExposureManager;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JViewExposureManager);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: JINetworkClient;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: JINetworkClient);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: JIHeaderCustomTimelyCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: JIHeaderCustomTimelyCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: Jr0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: Jr0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: Ju0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: Ju0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: JIALinkListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: JIALinkListener);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetA: JIActiveCustomParamsCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetA(aA: JIActiveCustomParamsCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetB: Jr;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: Jr);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetC: JIEventHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetC(aC: JIEventHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetD: JIAppLogLogger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetD(aD: JIAppLogLogger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetE: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetE(aE: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetF: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetF(aF: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetG(aG: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetH: Jb4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetH(aH: Jb4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetI: Jb4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetI(aI: Jb4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure init(P1: JContext; P2: JInitConfig); cdecl; overload;
//    procedure init(P1: JContext; P2: JInitConfig; P3: JActivity); cdecl; overload;
//    function toString: JString; cdecl;
//    function getAppId: JString; cdecl;
//    procedure receive(P1: Jd3); cdecl; overload;
//    procedure receive(P1: TJavaObjectArray<JString>); cdecl; overload;
//    procedure setAppContext(P1: Jf); cdecl;
//    function getAppContext: Jf; cdecl;
//    function getContext: JContext; cdecl;
//    procedure initMetaSec(P1: JContext); cdecl;
//    procedure start; cdecl;
//    function hasStarted: Boolean; cdecl;
//    function getInitConfig: JInitConfig; cdecl;
//    function isBavEnabled: Boolean; cdecl;
//    procedure flush; cdecl;
//    function isH5BridgeEnable: Boolean; cdecl;
//    function isH5CollectEnable: Boolean; cdecl;
//    procedure setUserID(P1: Int64); cdecl;
//    procedure setAppLanguageAndRegion(P1: JString; P2: JString); cdecl;
//    procedure setGoogleAid(P1: JString); cdecl;
//    function addNetCommonParams(P1: JContext; P2: JString; P3: Boolean; P4: JLevel): JString; cdecl;
//    procedure putCommonParams(P1: JContext; P2: JMap; P3: Boolean; P4: JLevel); cdecl;
//    procedure setUserUniqueID(P1: JString); cdecl; overload;
//    procedure setUserUniqueID(P1: JString; P2: JString); cdecl; overload;
//    procedure setExtraParams(P1: JIExtraParams); cdecl;
//    procedure setActiveCustomParams(P1: JIActiveCustomParamsCallback); cdecl;
//    function getActiveCustomParams: JIActiveCustomParamsCallback; cdecl;
//    procedure setTouchPoint(P1: JString); cdecl;
//    procedure setHeaderInfo(P1: JHashMap); cdecl; overload;
//    procedure setHeaderInfo(P1: JString; P2: JObject); cdecl; overload;
//    procedure removeHeaderInfo(P1: JString); cdecl;
//    procedure setExternalAbVersion(P1: JString); cdecl;
//    function getAbSdkVersion: JString; cdecl;
//    function getAbConfig(P1: JString; P2: JObject): JObject; cdecl;
//    procedure pullAbTestConfigs; cdecl; overload;
//    procedure pullAbTestConfigs(P1: Integer; P2: JIPullAbTestConfigCallback); cdecl; overload;
//    procedure setPullAbTestConfigsThrottleMills(P1: JLong); cdecl;
//    function getAid: JString; cdecl;
//    function getHeaderValue(P1: JString; P2: JObject; P3: JClass): JObject; cdecl;
//    procedure setTracerData(P1: JJSONObject); cdecl;
//    procedure setUserAgent(P1: JString); cdecl;
//    procedure onEventV3(P1: JString); cdecl; overload;
//    procedure onEventV3(P1: JString; P2: JJSONObject); cdecl; overload;
//    procedure onEventV3(P1: JString; P2: JJSONObject; P3: Integer); cdecl; overload;
//    procedure onEventV3(P1: JString; P2: JBundle; P3: Integer); cdecl; overload;
//    procedure onEventV3(P1: JString; P2: JBundle); cdecl; overload;
//    function newEvent(P1: JString): JEventBuilder; cdecl;
//    procedure onMiscEvent(P1: JString; P2: JJSONObject); cdecl;
//    procedure setEncryptAndCompress(P1: Boolean); cdecl;
//    function getEncryptAndCompress: Boolean; cdecl;
//    function manualActivate: Boolean; cdecl;
//    procedure setForbidReportPhoneDetailInfo(P1: Boolean); cdecl;
//    function reportPhoneDetailInfo: Boolean; cdecl;
//    function getDid: JString; cdecl;
//    function getUdid: JString; cdecl;
//    procedure addSessionHook(P1: JISessionObserver); cdecl;
//    procedure removeSessionHook(P1: JISessionObserver); cdecl;
//    procedure addEventObserver(P1: JIEventObserver); cdecl;
//    procedure removeEventObserver(P1: JIEventObserver); cdecl;
//    procedure setAccount(P1: JAccount); cdecl;
//    function getIid: JString; cdecl;
//    function getSsid: JString; cdecl;
//    function getUserUniqueID: JString; cdecl;
//    function getUserID: JString; cdecl;
//    function getClientUdid: JString; cdecl;
//    function getOpenUdid: JString; cdecl;
//    procedure setUriRuntime(P1: JUriConfig); cdecl;
//    procedure getSsidGroup(P1: JMap); cdecl;
//    procedure addDataObserver(P1: JIDataObserver); cdecl;
//    procedure removeDataObserver(P1: JIDataObserver); cdecl;
//    procedure removeAllDataObserver; cdecl;
//    procedure setOaidObserver(P1: JIOaidObserver); cdecl;
//    procedure removeOaidObserver(P1: JIOaidObserver); cdecl;
//    function getNetClient: JINetworkClient; cdecl;
//    function getHeader: JJSONObject; cdecl;
//    procedure setAppTrack(P1: JJSONObject); cdecl;
//    function isNewUser: Boolean; cdecl;
//    procedure onResume(P1: JContext); cdecl;
//    procedure onPause(P1: JContext); cdecl;
//    procedure onActivityResumed(P1: JActivity; P2: Integer); cdecl;
//    procedure onActivityPause; cdecl;
//    procedure registerHeaderCustomCallback(P1: JIHeaderCustomTimelyCallback); cdecl;
//    function getHeaderCustomCallback: JIHeaderCustomTimelyCallback; cdecl;
//    procedure userProfileSetOnce(P1: JJSONObject; P2: JUserProfileCallback); cdecl;
//    procedure userProfileSync(P1: JJSONObject; P2: JUserProfileCallback); cdecl;
//    procedure startSimulator(P1: JString); cdecl;
//    procedure setRangersEventVerifyEnable(P1: Boolean; P2: JString); cdecl;
//    procedure profileSet(P1: JJSONObject); cdecl;
//    procedure profileSetOnce(P1: JJSONObject); cdecl;
//    procedure profileUnset(P1: JString); cdecl;
//    procedure profileIncrement(P1: JJSONObject); cdecl;
//    procedure profileAppend(P1: JJSONObject); cdecl;
//    procedure bind(P1: JMap; P2: JIDBindCallback); cdecl;
//    procedure setEventFilterByClient(P1: JList; P2: Boolean); cdecl;
//    function getEventFilterByClient: Jr0; cdecl;
//    function getRequestHeader: JMap; cdecl;
//    function getSessionId: JString; cdecl;
//    procedure setALinkListener(P1: JIALinkListener); cdecl;
//    function getALinkListener: JIALinkListener; cdecl;
//    procedure setClipboardEnabled(P1: Boolean); cdecl;
//    procedure activateALink(P1: JUri); cdecl;
//    function getSdkVersion: JString; cdecl;
//    function getAllAbTestConfigs: JJSONObject; cdecl;
//    procedure setPrivacyMode(P1: Boolean); cdecl;
//    function isPrivacyMode: Boolean; cdecl;
//    procedure setViewId(P1: JView; P2: JString); cdecl; overload;
//    procedure setViewId(P1: JDialog; P2: JString); cdecl; overload;
//    procedure setViewId(P1: JObject; P2: JString); cdecl; overload;
//    function getLaunchFrom: Integer; cdecl;
//    procedure setLaunchFrom(P1: Integer); cdecl;
//    function getDeepLinkUrl: JString; cdecl;
//    procedure setViewProperties(P1: JView; P2: JJSONObject); cdecl;
//    function getViewProperties(P1: JView): JJSONObject; cdecl;
//    procedure ignoreAutoTrackPage(P1: TJavaObjectArray<JClass>); cdecl;
//    function isAutoTrackPageIgnored(P1: JClass): Boolean; cdecl;
//    procedure ignoreAutoTrackClick(P1: JView); cdecl;
//    procedure ignoreAutoTrackClickByViewType(P1: TJavaObjectArray<JClass>); cdecl;
//    function isAutoTrackClickIgnored(P1: JView): Boolean; cdecl;
//    procedure trackPage(P1: JObject); cdecl; overload;
//    procedure trackPage(P1: JObject; P2: JJSONObject); cdecl; overload;
//    procedure trackPage(P1: JActivity); cdecl; overload;
//    procedure trackPage(P1: JActivity; P2: JJSONObject); cdecl; overload;
//    procedure trackClick(P1: JView); cdecl; overload;
//    procedure trackClick(P1: JView; P2: JJSONObject); cdecl; overload;
//    procedure setEventHandler(P1: JIEventHandler); cdecl;
//    function getEventHandler: JIEventHandler; cdecl;
//    procedure initH5Bridge(P1: JView; P2: JString); cdecl;
//    procedure setGPSLocation(P1: Single; P2: Single; P3: JString); cdecl;
//    procedure startDurationEvent(P1: JString); cdecl;
//    procedure pauseDurationEvent(P1: JString); cdecl;
//    procedure resumeDurationEvent(P1: JString); cdecl;
//    procedure stopDurationEvent(P1: JString; P2: JJSONObject); cdecl;
//    procedure clearDb; cdecl;
//    function getMonitor: Jc2; cdecl;
//    procedure initWebViewBridge(P1: JView; P2: JString); cdecl;
//    function c: Jq1; cdecl;
//    function getViewExposureManager: JViewExposureManager; cdecl;
//    function d: Boolean; cdecl;
//    procedure e; cdecl;
//    procedure a(P1: JObject; P2: JJSONObject); cdecl; overload;
//    function b: Boolean; cdecl;
//    function a: Boolean; cdecl; overload;
//    procedure a(P1: JString; P2: Int64); cdecl; overload;
//
//    { Property }
//    property a: JConcurrentHashMap read _Geta write _Seta;
//    property b: Jw0 read _Getb write _Setb;
//    property c: Jv0 read _Getc write _Setc;
//    property d: Jq1 read _Getd write _Setd;
//    property e: Jf1 read _Gete write _Sete;
//    property f: JSet read _Getf write _Setf;
//    property g: JSet read _Getg write _Setg;
//    property h: JSet read _Geth write _Seth;
//    property i: JMap read _Geti write _Seti;
//    property j: Ja3 read _Getj write _Setj;
//    property k: Jy2 read _Getk write _Setk;
//    property l: Integer read _Getl write _Setl;
//    property m: JString read _Getm write _Setm;
//    property n: JApplication read _Getn write _Setn;
//    property o: Jl1 read _Geto write _Seto;
//    property p: Jn1 read _Getp write _Setp;
//    property q: Jc0 read _Getq write _Setq;
//    property r: Jv read _Getr write _Setr;
//    property s: JViewExposureManager read _Gets write _Sets;
//    property t: JINetworkClient read _Gett write _Sett;
//    property u: Boolean read _Getu write _Setu;
//    property v: JIHeaderCustomTimelyCallback read _Getv write _Setv;
//    property w: Jr0 read _Getw write _Setw;
//    property x: Boolean read _Getx write _Setx;
//    property y: Ju0 read _Gety write _Sety;
//    property z: JIALinkListener read _Getz write _Setz;
//    property A: JIActiveCustomParamsCallback read _GetA write _SetA;
//    property B: Jr read _GetB write _SetB;
//    property C: JIEventHandler read _GetC write _SetC;
//    property D: JIAppLogLogger read _GetD write _SetD;
//    property E: Boolean read _GetE write _SetE;
//    property F: Int64 read _GetF write _SetF;
//    property G: Boolean read _GetG write _SetG;
//    property H: Jb4 read _GetH write _SetH;
//    property I: Jb4 read _GetI write _SetI;
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  Jd0Class = interface(JObjectClass)
//  ['{E0049D07-FD62-4862-B840-905311BA33A6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jd0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d0')]
//  Jd0 = interface(JObject)
//  ['{7B996A78-0421-4761-AF15-719ABF13ED92}']
//    { Property Methods }
//    function _Geta: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Jd3); cdecl;
//
//    { Property }
//    property a: Jc0 read _Geta write _Seta;
//  end;

//  TJd0 = class(TJavaGenericImport<Jd0Class, Jd0>) end;

//  Jd1_aClass = interface(JObjectClass)
//  ['{564B97E4-E149-4214-B4C4-AB67EB964F59}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JObject): Jd1_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d1$a')]
//  Jd1_a = interface(JObject)
//  ['{E02D4860-B061-431E-ACA4-DA93A7CB6D81}']
//    { Property Methods }
//    function _Geta: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JObject read _Geta write _Seta;
//  end;

//  TJd1_a = class(TJavaGenericImport<Jd1_aClass, Jd1_a>) end;

//  Jd1Class = interface(JObjectClass)
//  ['{01220A21-0C80-4930-A7EB-1AA39B50AEF3}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a(P1: JString; P2: JEventBus_DataFetcher); cdecl; overload;
//    {class} procedure a(P1: JString; P2: JObject); cdecl; overload;
//    {class} function a(P1: JString): JString; cdecl; overload;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d1')]
//  Jd1 = interface(JObject)
//  ['{6BC0C0C3-E1C2-47BD-BAA7-A6F67826EBDF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd1 = class(TJavaGenericImport<Jd1Class, Jd1>) end;

//  Jd2Class = interface(JObjectClass)
//  ['{7D49BD0A-004B-4809-9B9B-D867A8E98D7D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jd2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d2')]
//  Jd2 = interface(JObject)
//  ['{3CD0D56F-D2DD-4CF6-A14C-E12025DE8598}']
//    { Property Methods }
//    function _Geta: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Jg2); cdecl; overload;
//    function a(P1: JList): JList; cdecl; overload;
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//
//    { Property }
//    property a: JHandler read _Geta write _Seta;
//    property b: Jc0 read _Getb write _Setb;
//  end;

//  TJd2 = class(TJavaGenericImport<Jd2Class, Jd2>) end;

//  Jd3_aClass = interface(Js3Class) // or JObjectClass
//  ['{4D44E8FF-F699-43D4-BAB2-C83836666831}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd3_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d3$a')]
//  Jd3_a = interface(Js3) // or JObject
//  ['{BFB1C79F-F0A8-4A15-8369-25AFC8641394}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJd3_a = class(TJavaGenericImport<Jd3_aClass, Jd3_a>) end;

//  Jd3Class = interface(JObjectClass)
//  ['{71B69A2E-7C62-4A16-AFF8-5F4063EADC17}']
//    { static Property Methods }
//    {class} function _Getq: JSimpleDateFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr: Js3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jd3; cdecl; overload;
//    {class} function j: JHashMap; cdecl;
//    {class} function b(P1: Int64): JString; cdecl; overload;
//    {class} function a(P1: JString): Jd3; cdecl; overload;
//    {class} function init: Jd3; cdecl; overload;
//
//    { static Property }
//    {class} property q: JSimpleDateFormat read _Getq;
//    {class} property r: Js3 read _Getr;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d3')]
//  Jd3 = interface(JObject)
//  ['{1CE78826-E1CC-449D-9280-359A39FA6C77}']
//    { Property Methods }
//    function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Int64); cdecl; overload;
//    function b: JList; cdecl; overload;
//    function a(P1: JCursor): Integer; cdecl; overload;
//    procedure b(P1: JContentValues); cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function i: JJSONObject; cdecl;
//    function a(P1: JJSONObject): Jd3; cdecl; overload;
//    function a(P1: JContentValues): JContentValues; cdecl; overload;
//    function a: JString; cdecl; overload;
//    function f: JString; cdecl;
//    function g: JJSONObject; cdecl;
//    function h: JJSONObject; cdecl;
//    function clone: Jd3; cdecl; overload;
//    function toString: JString; cdecl;
//    function c: JString; cdecl;
//    function e: JString; cdecl;
//    procedure a(P1: JJSONObject; P2: JString); cdecl; overload;
//    procedure a(P1: JJSONObject; P2: JJSONObject); cdecl; overload;
//    function d: JIAppLogLogger; cdecl;
//    function clone: JObject; cdecl; overload;
//
//    { Property }
//    property a: JList read _Geta write _Seta;
//    property b: Int64 read _Getb write _Setb;
//    property c: Int64 read _Getc write _Setc;
//    property d: Int64 read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: Int64 read _Getf write _Setf;
//    property g: JString read _Getg write _Setg;
//    property h: JString read _Geth write _Seth;
//    property i: JString read _Geti write _Seti;
//    property j: JString read _Getj write _Setj;
//    property k: Integer read _Getk write _Setk;
//    property l: Integer read _Getl write _Setl;
//    property m: JString read _Getm write _Setm;
//    property n: JString read _Getn write _Setn;
//    property o: JJSONObject read _Geto write _Seto;
//    property p: JString read _Getp write _Setp;
//  end;

//  TJd3 = class(TJavaGenericImport<Jd3Class, Jd3>) end;

//  Jd4Class = interface(JObjectClass)
//  ['{B99004DB-6F58-496A-9574-00AB7865F86E}']
//    { static Property Methods }
//    {class} function _Geta: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JContext; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JContext; P2: JString; P3: Integer): JPackageInfo; cdecl; overload;
//    {class} function init: Jd4; cdecl;
//
//    { static Property }
//    {class} property a: JMap read _Geta;
//    {class} property b: JMap read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d4')]
//  Jd4 = interface(JObject)
//  ['{43BE6C20-3C4F-45CE-9F0C-50E0578A1CB2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd4 = class(TJavaGenericImport<Jd4Class, Jd4>) end;

//  JeClass = interface(JObjectClass)
//  ['{7474083B-CC9E-4874-960B-23B043F19DBE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JInitConfig): Je; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e')]
//  Je = interface(JObject)
//  ['{6E4381C8-8613-4567-BE7C-37057E9906B5}']
//    { Property Methods }
//    function _Geta: JInitConfig;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JInitConfig);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JInitConfig read _Geta write _Seta;
//    property b: Jd read _Getb write _Setb;
//  end;

//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  Je0Class = interface(Ja0Class) // or JObjectClass
//  ['{DDDC4162-5CC2-4722-A495-C6B4E3480F68}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: JString): Je0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e0')]
//  Je0 = interface(Ja0) // or JObject
//  ['{0A70CB45-9538-4285-9473-F642C47C10CC}']
//    { Property Methods }
//    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function f: Boolean; cdecl;
//    function g: Int64; cdecl;
//    function e: TJavaArray<Int64>; cdecl;
//    function c: Boolean; cdecl;
//    function d: JString; cdecl;
//
//    { Property }
//    property g: JString read _Getg write _Setg;
//    property h: Integer read _Geth write _Seth;
//  end;

//  TJe0 = class(TJavaGenericImport<Je0Class, Je0>) end;

//  Je1Class = interface(Jg1Class) // or JObjectClass
//  ['{AF5ABC2A-2E64-489F-BCBB-FE8188451A50}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Je1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e1')]
//  Je1 = interface(Jg1) // or JObject
//  ['{8169BB36-7A95-43FA-8E47-0121C89E195B}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//  end;

//  TJe1 = class(TJavaGenericImport<Je1Class, Je1>) end;

//  Je2Class = interface(JObjectClass)
//  ['{3639B5A9-AC25-4F26-9DC5-580C42228AB9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e2')]
//  Je2 = interface(IJavaInstance)
//  ['{6265CDE8-365D-4FD8-82EF-39928B809A65}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe2 = class(TJavaGenericImport<Je2Class, Je2>) end;

//  Je3_aClass = interface(JObjectClass)
//  ['{A8C15FD2-0444-455F-A91D-78836759FDE7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3): Je3_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3$a')]
//  Je3_a = interface(JObject)
//  ['{8CD68AFB-EA6B-4DB3-92C6-93F19A257655}']
//    { Property Methods }
//    function _Geta: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Je3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Je3 read _Geta write _Seta;
//  end;

//  TJe3_a = class(TJavaGenericImport<Je3_aClass, Je3_a>) end;

//  Je3_bClass = interface(JObjectClass)
//  ['{AE40C665-CFA2-4057-80F5-C73CA103FD70}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3): Je3_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3$b')]
//  Je3_b = interface(JObject)
//  ['{243E10D3-CA73-442B-AFA6-69282D5089F1}']
//    { Property Methods }
//    function _Geta: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Je3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Je3 read _Geta write _Seta;
//  end;

//  TJe3_b = class(TJavaGenericImport<Je3_bClass, Je3_b>) end;

//  Je3_cClass = interface(JObjectClass)
//  ['{52CB3F32-CBBF-4FCC-98B0-4C62F8548F9C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3): Je3_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3$c')]
//  Je3_c = interface(JObject)
//  ['{99AC0FAB-694C-4945-9ED1-B820697177C6}']
//    { Property Methods }
//    function _Geta: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Je3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Je3 read _Geta write _Seta;
//  end;

//  TJe3_c = class(TJavaGenericImport<Je3_cClass, Je3_c>) end;

//  Je3_dClass = interface(JObjectClass)
//  ['{D7F87282-86E9-4920-9D8F-71B2EF696B6F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3): Je3_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3$d')]
//  Je3_d = interface(JObject)
//  ['{67147980-8DDE-4129-B09D-A6F953D570D4}']
//    { Property Methods }
//    function _Geta: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Je3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Je3 read _Geta write _Seta;
//  end;

//  TJe3_d = class(TJavaGenericImport<Je3_dClass, Je3_d>) end;

//  Je3_eClass = interface(JObjectClass)
//  ['{35E4F231-4CA3-4752-AC64-2C8D7C58A464}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3): Je3_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3$e')]
//  Je3_e = interface(JObject)
//  ['{AB2189F5-1496-41AB-A8A5-923A417EF02E}']
//    { Property Methods }
//    function _Geta: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Je3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Je3 read _Geta write _Seta;
//  end;

//  TJe3_e = class(TJavaGenericImport<Je3_eClass, Je3_e>) end;

//  Je3_fClass = interface(JObjectClass)
//  ['{23EE3004-48CA-4330-8993-937AC0A6C6AF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3): Je3_f; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3$f')]
//  Je3_f = interface(JObject)
//  ['{CC00E5BF-38E0-4EF0-905E-7BA178BF4202}']
//    { Property Methods }
//    function _Geta: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Je3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Je3 read _Geta write _Seta;
//  end;

//  TJe3_f = class(TJavaGenericImport<Je3_fClass, Je3_f>) end;

//  Je3_gClass = interface(JObjectClass)
//  ['{E66AD8C7-3EB3-4833-9B47-0B89DB6B7BFE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3): Je3_g; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3$g')]
//  Je3_g = interface(JObject)
//  ['{7839C3D3-567E-4990-A3FF-0603B9F9D694}']
//    { Property Methods }
//    function _Geta: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Je3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Je3 read _Geta write _Seta;
//  end;

//  TJe3_g = class(TJavaGenericImport<Je3_gClass, Je3_g>) end;

//  Je3_hClass = interface(JObjectClass)
//  ['{5B7900EC-F771-480F-AAF9-1B02A9D08FB6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3$h')]
//  Je3_h = interface(IJavaInstance)
//  ['{B848F23F-60F5-4F5A-A256-07A3B03D84A0}']
//    { Property Methods }
//
//    { methods }
//    function a: JObject; cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    procedure a(P1: JObject); cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Je3): JObject; cdecl; overload;
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJe3_h = class(TJavaGenericImport<Je3_hClass, Je3_h>) end;

//  Je3Class = interface(JObjectClass)
//  ['{AEDF05A8-4C79-456C-A6BB-440A0D0BBB05}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3')]
//  Je3 = interface(JObject)
//  ['{18A172BC-736E-4D5A-AD73-E1F0687728B8}']
//    { Property Methods }
//    function _Geta: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JHandler); cdecl; overload;
//    function d(P1: JString; P2: JString): JString; cdecl;
//    function b(P1: JString; P2: JString): JString; cdecl; overload;
//    function e(P1: JString; P2: JString): JString; cdecl;
//    function a(P1: TJavaObjectArray<JString>; P2: TJavaObjectArray<JString>): TJavaObjectArray<JString>; cdecl; overload;
//    function f(P1: JString; P2: JString): JString; cdecl;
//    function g(P1: JString; P2: JString): JString; cdecl;
//    function c(P1: JString; P2: JString): JString; cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: JString; P2: JString); cdecl; overload;
//    function b(P1: JString): JString; cdecl; overload;
//    function c(P1: JString): TJavaObjectArray<JString>; cdecl; overload;
//    procedure a(P1: JString; P2: TJavaObjectArray<JString>); cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Je3_h): JObject; cdecl; overload;
//
//    { Property }
//    property a: Je3 read _Geta write _Seta;
//    property b: JHandler read _Getb write _Setb;
//  end;

//  TJe3 = class(TJavaGenericImport<Je3Class, Je3>) end;

//  Je4Class = interface(JObjectClass)
//  ['{E7147CFC-47CE-4269-A347-07B91AFC9E49}']
//    { static Property Methods }
//    {class} function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function c(P1: JObject): JString; cdecl;
//    {class} function b(P1: JObject): JString; cdecl;
//    {class} function d(P1: JObject): JJSONObject; cdecl;
//    {class} function a(P1: JObject): JView; cdecl;
//    {class} function init: Je4; cdecl;
//
//    { static Property }
//    {class} property a: JList read _Geta;
//    {class} property b: JList read _Getb;
//    {class} property c: JList read _Getc;
//    {class} property d: JList read _Getd;
//    {class} property e: JList read _Gete;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e4')]
//  Je4 = interface(JObject)
//  ['{8DA3E47D-3409-4479-98A3-918C8A696E9C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe4 = class(TJavaGenericImport<Je4Class, Je4>) end;

//  JfClass = interface(JObjectClass)
//  ['{B3014A28-07D5-4D56-8745-1A4D9D4BDA27}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f')]
//  Jf = interface(IJavaInstance)
//  ['{9F587A4E-7630-4993-A0C2-A20C9BE2D35A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

//  Jf0_aClass = interface(JObjectClass)
//  ['{5379FFE6-A251-484B-828A-6C780666C887}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jf0; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString): Jf0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f0$a')]
//  Jf0_a = interface(JObject)
//  ['{69E38843-290C-489F-A850-977B07CEE466}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Jf0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jf0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JString read _Getf write _Setf;
//    property g: Jf0 read _Getg write _Setg;
//  end;

//  TJf0_a = class(TJavaGenericImport<Jf0_aClass, Jf0_a>) end;

//  Jf0Class = interface(Ja0Class) // or JObjectClass
//  ['{8CF55410-E881-44D4-941B-C5FE56145084}']
//    { static Property Methods }
//    {class} function _Getg: TJavaArray<Int64>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: TJavaArray<Int64>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: TJavaArray<Int64>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jf0; cdecl; overload;
//    {class} function init: Jf0; cdecl; overload;
//
//    { static Property }
//    {class} property g: TJavaArray<Int64> read _Getg;
//    {class} property h: TJavaArray<Int64> read _Geth;
//    {class} property i: TJavaArray<Int64> read _Geti;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f0')]
//  Jf0 = interface(Ja0) // or JObject
//  ['{3FF758CA-2D91-4E29-A1B2-A67EB221A49E}']
//    { Property Methods }
//
//    { methods }
//    function f: Boolean; cdecl;
//    function g: Int64; cdecl;
//    function e: TJavaArray<Int64>; cdecl;
//    function c: Boolean; cdecl; overload;
//    function a(P1: JJSONObject): Boolean; cdecl;
//    function b(P1: JJSONObject): JJSONObject; cdecl;
//    function c(P1: JJSONObject): JJSONObject; cdecl; overload;
//    function d: JString; cdecl;
//
//    { Property }
//  end;

//  TJf0 = class(TJavaGenericImport<Jf0Class, Jf0>) end;

//  Jf1Class = interface(JObjectClass)
//  ['{59BADA07-0521-444F-AEBE-C0942CCA3801}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f1')]
//  Jf1 = interface(JObject)
//  ['{9F1E1834-FDEF-43FC-B992-BE8BE8E2E892}']
//    { Property Methods }
//    function _Geta: JLinkedList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JLinkedList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JLinkedList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JLinkedList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Jd3); cdecl; overload;
//    procedure a(P1: TJavaObjectArray<JString>); cdecl; overload;
//    function a(P1: JArrayList): Integer; cdecl; overload;
//
//    { Property }
//    property a: JLinkedList read _Geta write _Seta;
//    property b: JLinkedList read _Getb write _Setb;
//  end;

//  TJf1 = class(TJavaGenericImport<Jf1Class, Jf1>) end;

//  Jf2Class = interface(JObjectClass)
//  ['{E4E06DE3-0EBA-49CB-8BA5-FBEB5CCA772F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f2')]
//  Jf2 = interface(JObject)
//  ['{865ADE45-DF4E-4553-9A55-21A146FD6083}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function c: JString; cdecl;
//    function a: JString; cdecl; overload;
//    function d: JObject; cdecl;
//    function b: JJSONObject; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Int64 read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//  end;

//  TJf2 = class(TJavaGenericImport<Jf2Class, Jf2>) end;

//  Jf3Class = interface(Jk3Class) // or JObjectClass
//  ['{70EB190C-AC2B-45C9-9BFF-2FEF72134229}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: JArrayList; P11: JArrayList): Jf3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f3')]
//  Jf3 = interface(Jk3) // or JObject
//  ['{11455DDC-01FA-40BE-8B7B-C61CE8520812}']
//    { Property Methods }
//    function _Getv: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetA: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetA(aA: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetB: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetC(aC: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetD(aD: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetE(aE: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetF(aF: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure k; cdecl;
//
//    { Property }
//    property v: JString read _Getv write _Setv;
//    property w: JString read _Getw write _Setw;
//    property x: JString read _Getx write _Setx;
//    property y: JString read _Gety write _Sety;
//    property z: JString read _Getz write _Setz;
//    property A: JArrayList read _GetA write _SetA;
//    property B: JArrayList read _GetB write _SetB;
//    property C: Integer read _GetC write _SetC;
//    property D: Integer read _GetD write _SetD;
//    property E: Integer read _GetE write _SetE;
//    property F: Integer read _GetF write _SetF;
//  end;

//  TJf3 = class(TJavaGenericImport<Jf3Class, Jf3>) end;

//  Jf4_aClass = interface(Js3Class) // or JObjectClass
//  ['{4A539330-56FF-4DEE-998E-04F889C7F785}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f4$a')]
//  Jf4_a = interface(Js3) // or JObject
//  ['{B95A8374-90EB-498E-81E1-C20BF0A87188}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJf4_a = class(TJavaGenericImport<Jf4_aClass, Jf4_a>) end;

//  Jf4Class = interface(JObjectClass)
//  ['{EEC94241-C579-4598-AEFC-44162A700EA5}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Js3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JContext): Boolean; cdecl;
//    {class} function init: Jf4; cdecl;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: Js3 read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f4')]
//  Jf4 = interface(JObject)
//  ['{C407E388-AA96-4A1D-8ED4-E7C1C8DA696C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf4 = class(TJavaGenericImport<Jf4Class, Jf4>) end;

//  JgClass = interface(JObjectClass)
//  ['{44B6B836-961C-4810-AA44-2BE3CD742DE2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g')]
//  Jg = interface(IJavaInstance)
//  ['{D55F2990-1273-4500-87D8-96A1EA465E37}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  Jg0_aClass = interface(JObjectClass)
//  ['{37D17A37-1242-4C79-82E8-D877656FFCF8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jg0; P2: JSet; P3: Boolean): Jg0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g0$a')]
//  Jg0_a = interface(JObject)
//  ['{F395F38C-CEC6-4A7E-8405-CAE6AA22895B}']
//    { Property Methods }
//    function _Geta: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jg0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jg0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JSet read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//    property c: Jg0 read _Getc write _Setc;
//  end;

//  TJg0_a = class(TJavaGenericImport<Jg0_aClass, Jg0_a>) end;

//  Jg0Class = interface(Ja0Class) // or JObjectClass
//  ['{6ED92313-A285-4865-96DD-EA3F7D90A9DF}']
//    { static Property Methods }
//    {class} function _Geth: TJavaArray<Int64>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jg0; cdecl; overload;
//    {class} function init: Jg0; cdecl; overload;
//
//    { static Property }
//    {class} property h: TJavaArray<Int64> read _Geth;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g0')]
//  Jg0 = interface(Ja0) // or JObject
//  ['{83DC4895-7820-4354-A498-AF777AF0AC28}']
//    { Property Methods }
//    function _Getg: Jj2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jj2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function f: Boolean; cdecl;
//    function g: Int64; cdecl;
//    function e: TJavaArray<Int64>; cdecl;
//    function c: Boolean; cdecl;
//    function d: JString; cdecl;
//    procedure a(P1: JSet; P2: Boolean); cdecl;
//
//    { Property }
//    property g: Jj2 read _Getg write _Setg;
//  end;

//  TJg0 = class(TJavaGenericImport<Jg0Class, Jg0>) end;

//  Jg1Class = interface(JObjectClass)
//  ['{3CE1171B-1E9F-481E-9F7C-66B5852FDDDA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Boolean; P2: Boolean): Jg1; cdecl; overload;
//    {class} function init(P1: Boolean; P2: Boolean; P3: Boolean): Jg1; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g1')]
//  Jg1 = interface(JObject)
//  ['{54340A2F-842D-45D4-A26C-C19437DFC641}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//    property c: Boolean read _Getc write _Setc;
//    property d: Boolean read _Getd write _Setd;
//  end;

//  TJg1 = class(TJavaGenericImport<Jg1Class, Jg1>) end;

//  Jg2Class = interface(JObjectClass)
//  ['{4FC40E13-6345-4859-B013-615B28A39E59}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g2')]
//  Jg2 = interface(IJavaInstance)
//  ['{4B782A2E-231E-4728-AC9B-B105EBEE1611}']
//    { Property Methods }
//
//    { methods }
//    function b: JJSONObject; cdecl;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function c: JString; cdecl;
//    function a: JString; cdecl; overload;
//    function d: JObject; cdecl;
//
//    { Property }
//  end;

//  TJg2 = class(TJavaGenericImport<Jg2Class, Jg2>) end;

//  Jg3Class = interface(Jd3Class) // or JObjectClass
//  ['{4BE33A40-2126-4E26-BA63-4D2DF258A849}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg3; cdecl; overload;
//    {class} function init(P1: JString; P2: JJSONObject): Jg3; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g3')]
//  Jg3 = interface(Jd3) // or JObject
//  ['{0FD5CEF0-E9B7-4585-B3B7-08D5D6045CD5}']
//    { Property Methods }
//    function _Gets: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: JList; cdecl; overload;
//    function a(P1: JCursor): Integer; cdecl; overload;
//    procedure b(P1: JContentValues); cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function i: JJSONObject; cdecl;
//    function a(P1: JJSONObject): Jd3; cdecl; overload;
//    function f: JString; cdecl;
//    function c: JString; cdecl;
//
//    { Property }
//    property s: JString read _Gets write _Sets;
//    property t: JString read _Gett write _Sett;
//  end;

//  TJg3 = class(TJavaGenericImport<Jg3Class, Jg3>) end;

//  Jg4Class = interface(JObjectClass)
//  ['{3B35B9C1-B2C0-4D7F-AC61-DC17D29A0CD6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jg4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g4')]
//  Jg4 = interface(JObject)
//  ['{A8D676A8-5A27-4EB7-9664-F70E19749440}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//  end;

//  TJg4 = class(TJavaGenericImport<Jg4Class, Jg4>) end;

//  JhClass = interface(JObjectClass)
//  ['{CD4F2B5E-C929-45A1-9A71-29D813AAB910}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JApplication; P2: JString): Jh; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h')]
//  Jh = interface(JObject)
//  ['{2EEA82C1-58AB-4912-AD93-476AD7ADD3A7}']
//    { Property Methods }
//    function _Geta: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JString; P2: JClass): Jo; cdecl; overload;
//    procedure a(P1: JString; P2: Jo; P3: Int64); cdecl; overload;
//    procedure a(P1: JString; P2: JString; P3: Int64); cdecl; overload;
//    function a(P1: JString): JString; cdecl; overload;
//
//    { Property }
//    property a: JSharedPreferences read _Geta write _Seta;
//  end;

//  TJh = class(TJavaGenericImport<JhClass, Jh>) end;

//  Jh0_aClass = interface(JObjectClass)
//  ['{E1BFF706-0674-4090-9BBE-C88966E37FCC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jh0; P2: Jd; P3: Boolean; P4: Int64): Jh0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h0$a')]
//  Jh0_a = interface(JObject)
//  ['{F972DA1A-5558-4DBF-A86C-49D990A4C727}']
//    { Property Methods }
//    function _Geta: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jh0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jh0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: Jd read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//    property c: Int64 read _Getc write _Setc;
//    property d: Jh0 read _Getd write _Setd;
//  end;

//  TJh0_a = class(TJavaGenericImport<Jh0_aClass, Jh0_a>) end;

//  Jh0_bClass = interface(Jq3Class) // or JObjectClass
//  ['{7010AD77-7BBE-4626-81EA-7E5460534343}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jh0_a): Jh0_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h0$b')]
//  Jh0_b = interface(Jq3) // or JObject
//  ['{80C8E2DF-BC7E-4594-83A9-B47071DB0D75}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh0_b = class(TJavaGenericImport<Jh0_bClass, Jh0_b>) end;

//  Jh0Class = interface(JObjectClass)
//  ['{9E536809-6346-40E1-BFDB-BCBC84D2AB69}']
//    { static Property Methods }
//    {class} function _Geto: JAtomicLong;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: Jh0_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jh0; cdecl; overload;
//    {class} function a(P1: Jd3): Boolean; cdecl; overload;
//    {class} function init: Jh0; cdecl; overload;
//
//    { static Property }
//    {class} property o: JAtomicLong read _Geto;
//    {class} property p: Jh0_b read _Getp;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h0')]
//  Jh0 = interface(JObject)
//  ['{28EF5B2A-D722-40F8-92BA-FE4B2BF8AE9D}']
//    { Property Methods }
//    function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jn3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jn3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jn3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jn3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JString; cdecl; overload;
//    function b: JString; cdecl;
//    function a(P1: Int64; P2: Int64): JBundle; cdecl; overload;
//    function c: Boolean; cdecl;
//    function a(P1: Jd; P2: Jd3; P3: JList; P4: Boolean): Jl3; cdecl; overload;
//    function a(P1: Jd; P2: Jd3; P3: JArrayList): Boolean; cdecl; overload;
//    procedure a(P1: JIAppLogInstance; P2: Jd3); cdecl; overload;
//
//    { Property }
//    property a: Int64 read _Geta write _Seta;
//    property b: Jc0 read _Getb write _Setb;
//    property c: Jn3 read _Getc write _Setc;
//    property d: Jn3 read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: Int64 read _Getf write _Setf;
//    property g: Integer read _Getg write _Setg;
//    property h: Int64 read _Geth write _Seth;
//    property i: Boolean read _Geti write _Seti;
//    property j: Int64 read _Getj write _Setj;
//    property k: Integer read _Getk write _Setk;
//    property l: JString read _Getl write _Setl;
//    property m: JString read _Getm write _Setm;
//    property n: Boolean read _Getn write _Setn;
//  end;

//  TJh0 = class(TJavaGenericImport<Jh0Class, Jh0>) end;

//  Jh1Class = interface(Jg1Class) // or JObjectClass
//  ['{6B1AE54D-03AF-477F-9647-ED029CA5E615}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Jl1): Jh1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h1')]
//  Jh1 = interface(Jg1) // or JObject
//  ['{5F1776F8-EAF7-4288-AFCC-230F3BF6C059}']
//    { Property Methods }
//    function _Gete: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: Jl1 read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//  end;

//  TJh1 = class(TJavaGenericImport<Jh1Class, Jh1>) end;

//  Jh2Class = interface(JObjectClass)
//  ['{3E89E301-F4AE-4909-A0AE-A3B758ACF5EE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JThrowable): Jh2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h2')]
//  Jh2 = interface(JObject)
//  ['{61A54F43-D643-42E4-9D14-BE872B0E4937}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JThrowable;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JThrowable);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function c: JString; cdecl;
//    function a: JString; cdecl; overload;
//    function d: JObject; cdecl;
//    function b: JJSONObject; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JThrowable read _Getb write _Setb;
//  end;

//  TJh2 = class(TJavaGenericImport<Jh2Class, Jh2>) end;

//  Jh3Class = interface(JSQLiteOpenHelperClass) // or JObjectClass
//  ['{52697646-5A87-4C8D-9BEE-440C2D886EBD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: JString; P3: JSQLiteDatabase_CursorFactory; P4: Integer): Jh3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h3')]
//  Jh3 = interface(JSQLiteOpenHelper) // or JObject
//  ['{F0CA0338-1C63-4F8B-88B9-A3E70D3E13FE}']
//    { Property Methods }
//    function _Geta: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onCreate(P1: JSQLiteDatabase); cdecl;
//    procedure onUpgrade(P1: JSQLiteDatabase; P2: Integer; P3: Integer); cdecl;
//    procedure onDowngrade(P1: JSQLiteDatabase; P2: Integer; P3: Integer); cdecl;
//    procedure a(P1: JThrowable); cdecl;
//
//    { Property }
//    property a: Jc0 read _Geta write _Seta;
//  end;

//  TJh3 = class(TJavaGenericImport<Jh3Class, Jh3>) end;

//  Jh4_aClass = interface(Js3Class) // or JObjectClass
//  ['{091DA2BF-85C3-45CA-81E3-89F485435612}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h4$a')]
//  Jh4_a = interface(Js3) // or JObject
//  ['{6F19E3CA-BE09-46F7-BF1B-E34B19B93A61}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJh4_a = class(TJavaGenericImport<Jh4_aClass, Jh4_a>) end;

//  Jh4Class = interface(JObjectClass)
//  ['{66CB8E9C-46C8-42ED-838E-36E8283BFE03}']
//    { static Property Methods }
//    {class} function _Geta: Js3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: JString; cdecl;
//    {class} function init: Jh4; cdecl;
//
//    { static Property }
//    {class} property a: Js3 read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h4')]
//  Jh4 = interface(JObject)
//  ['{E4F15984-1A6F-4F3F-A6B3-16DA743827BB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh4 = class(TJavaGenericImport<Jh4Class, Jh4>) end;

//  JiClass = interface(JObjectClass)
//  ['{3CB36AF5-90C7-4891-9E8B-5AAC32E2F505}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Ji; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i')]
//  Ji = interface(JObject)
//  ['{CC39ABE1-2DAF-4414-A59C-6B607B41F18C}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jh);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jp;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jp);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a; cdecl;
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//    procedure onIdLoaded(P1: JString; P2: JString; P3: JString); cdecl;
//    procedure onRemoteIdGet(P1: Boolean; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString); cdecl;
//    procedure onRemoteConfigGet(P1: Boolean; P2: JJSONObject); cdecl;
//    procedure onRemoteAbConfigGet(P1: Boolean; P2: JJSONObject); cdecl;
//    procedure onAbVidsChange(P1: JString; P2: JString); cdecl;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//    property b: JHandler read _Getb write _Setb;
//    property c: Jc0 read _Getc write _Setc;
//    property d: Jh read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//    property f: Jp read _Getf write _Setf;
//    property g: Integer read _Getg write _Setg;
//    property h: JString read _Geth write _Seth;
//    property i: JList read _Geti write _Seti;
//    property j: JList read _Getj write _Setj;
//  end;

//  TJi = class(TJavaGenericImport<JiClass, Ji>) end;

//  Ji0Class = interface(JObjectClass)
//  ['{978F8B4A-30E5-46BC-9FA4-5AA84EAD40C5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIAppLogLogger; P2: JString): Ji0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i0')]
//  Ji0 = interface(JObject)
//  ['{C4BB2B07-C242-410B-83BF-AD5DCAEDA8D0}']
//    { Property Methods }
//    function _Geta: JIAppLogLogger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIAppLogLogger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure c(P1: Int64); cdecl;
//    procedure b(P1: Int64); cdecl;
//    procedure a(P1: Int64); cdecl;
//
//    { Property }
//    property a: JIAppLogLogger read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: Int64 read _Getc write _Setc;
//    property d: Int64 read _Getd write _Setd;
//  end;

//  TJi0 = class(TJavaGenericImport<Ji0Class, Ji0>) end;

//  Ji1Class = interface(Jg1Class) // or JObjectClass
//  ['{4BA4C4D2-ADF1-44AE-83C2-C09D4A4362F3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jl1): Ji1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i1')]
//  Ji1 = interface(Jg1) // or JObject
//  ['{0CFB0673-C835-4CD1-918E-41E134DD284F}']
//    { Property Methods }
//    function _Gete: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: Jl1 read _Gete write _Sete;
//  end;

//  TJi1 = class(TJavaGenericImport<Ji1Class, Ji1>) end;

//  Ji2Class = interface(JObjectClass)
//  ['{5CECCB0F-9ACF-48D3-9500-43BBF3AED0D6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i2')]
//  Ji2 = interface(JObject)
//  ['{344540A6-7EB3-470E-8E87-3C5FAF3709EA}']
//    { Property Methods }
//    function _Geta: JInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JInteger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function c: JString; cdecl;
//    function a: JString; cdecl; overload;
//    function d: JObject; cdecl;
//    function b: JJSONObject; cdecl;
//
//    { Property }
//    property a: JInteger read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: Int64 read _Getd write _Setd;
//  end;

//  TJi2 = class(TJavaGenericImport<Ji2Class, Ji2>) end;

//  Ji3Class = interface(JObjectClass)
//  ['{A8C53CE1-C7F4-427A-BE7F-4001BB480C06}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: Jh3): Ji3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i3')]
//  Ji3 = interface(JObject)
//  ['{BF2134D4-747A-40A6-A0EA-C2F5BB45A79E}']
//    { Property Methods }
//    function _Geta: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jh3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jh3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JList); cdecl; overload;
//    function a(P1: JIEventHandler; P2: Jd3): Boolean; cdecl; overload;
//    function a(P1: JIEventHandler; P2: Integer; P3: JString; P4: Jd3; P5: JJSONObject): JEventPolicy; cdecl; overload;
//
//    { Property }
//    property a: Jc0 read _Geta write _Seta;
//    property b: Jh3 read _Getb write _Setb;
//  end;

//  TJi3 = class(TJavaGenericImport<Ji3Class, Ji3>) end;

//  Ji4_aClass = interface(Js3Class) // or JObjectClass
//  ['{8D446730-4D5D-4133-AAAF-C2A453CBCC64}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i4$a')]
//  Ji4_a = interface(Js3) // or JObject
//  ['{AEBC35C3-82A7-4B8C-8F22-EA72C018030B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJi4_a = class(TJavaGenericImport<Ji4_aClass, Ji4_a>) end;

//  Ji4Class = interface(JObjectClass)
//  ['{48D530E0-D1D8-42F6-9960-AA39635B44C6}']
//    { static Property Methods }
//    {class} function _Geta: JCharSequence;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JCharSequence;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Js3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function c: Boolean; cdecl;
//    {class} function d: Boolean; cdecl;
//    {class} function e: Boolean; cdecl;
//    {class} function b: Boolean; cdecl;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a: JString; cdecl; overload;
//    {class} function init: Ji4; cdecl;
//
//    { static Property }
//    {class} property a: JCharSequence read _Geta;
//    {class} property b: JCharSequence read _Getb;
//    {class} property c: Js3 read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i4')]
//  Ji4 = interface(JObject)
//  ['{B24BEDAB-57D0-4707-9268-B85658F3912E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi4 = class(TJavaGenericImport<Ji4Class, Ji4>) end;

//  JjClass = interface(JoClass) // or JObjectClass
//  ['{E800332A-8BE4-4933-A0F9-CC1DCB57C2D9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j')]
//  Jj = interface(Jo) // or JObject
//  ['{9B5D3FB1-2363-4504-B0B5-753AE1B0AF07}']
//    { Property Methods }
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JJSONObject; cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//
//    { Property }
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JString read _Getf write _Setf;
//    property g: JString read _Getg write _Setg;
//    property h: JString read _Geth write _Seth;
//    property i: JString read _Geti write _Seti;
//    property j: JString read _Getj write _Setj;
//    property k: JString read _Getk write _Setk;
//    property l: JString read _Getl write _Setl;
//    property m: JString read _Getm write _Setm;
//    property n: Boolean read _Getn write _Setn;
//    property o: Integer read _Geto write _Seto;
//    property p: Int64 read _Getp write _Setp;
//    property q: JString read _Getq write _Setq;
//    property r: JString read _Getr write _Setr;
//    property s: JString read _Gets write _Sets;
//  end;

//  TJj = class(TJavaGenericImport<JjClass, Jj>) end;

//  Jj0Class = interface(JThrowableClass) // or JObjectClass
//  ['{16CAA294-8F37-4A74-9C29-453DAA7A55F4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j0')]
//  Jj0 = interface(JThrowable) // or JObject
//  ['{4872E6A5-6D8F-41A0-8717-DE9E546652E8}']
//    { Property Methods }
//
//    { methods }
//    procedure printStackTrace; cdecl;
//
//    { Property }
//  end;

//  TJj0 = class(TJavaGenericImport<Jj0Class, Jj0>) end;

//  Jj1Class = interface(Jg1Class) // or JObjectClass
//  ['{D2481547-736C-4BFB-B76C-679AC2F82A18}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Jj1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j1')]
//  Jj1 = interface(Jg1) // or JObject
//  ['{7EB4480F-21C4-4C78-ACCD-79D64F5697E8}']
//    { Property Methods }
//    function _Gete: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: Jd read _Gete write _Sete;
//  end;

//  TJj1 = class(TJavaGenericImport<Jj1Class, Jj1>) end;

//  Jj2Class = interface(JObjectClass)
//  ['{72E636FB-12D2-4D0A-8200-B72A810D4605}']
//    { static Property Methods }
//    {class} function _Geth: TJavaObjectArray<TJavaArray<Int64>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Jl1): Jj2; cdecl; overload;
//    {class} function init: Jj2; cdecl; overload;
//
//    { static Property }
//    {class} property h: TJavaObjectArray<TJavaArray<Int64>> read _Geth;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j2')]
//  Jj2 = interface(JObject)
//  ['{E91A91D7-046C-4F3B-82A1-1E3DDE4B5FEA}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure b; cdecl;
//    procedure c; cdecl;
//    function a: Boolean; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Jl1 read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//    property f: Int64 read _Getf write _Setf;
//    property g: Int64 read _Getg write _Setg;
//  end;

//  TJj2 = class(TJavaGenericImport<Jj2Class, Jj2>) end;

//  Jj3Class = interface(JObjectClass)
//  ['{44712DBD-DBD9-4FE4-B210-325A1DC383D7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: JString): Jj3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j3')]
//  Jj3 = interface(JObject)
//  ['{E9083D4A-C076-430C-8FDD-8560E54FD948}']
//    { Property Methods }
//    function _Geta: Jh3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jh3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Ji3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Ji3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: JString; P2: JJSONObject); cdecl; overload;
//    procedure a(P1: JString; P2: JJSONObject; P3: Je2); cdecl; overload;
//    procedure b(P1: JList); cdecl; overload;
//    function a(P1: JString): JMap; cdecl; overload;
//    procedure a(P1: JList); cdecl; overload;
//    procedure c(P1: JList); cdecl; overload;
//    procedure a(P1: JString; P2: JString); cdecl; overload;
//    procedure a(P1: JSQLiteDatabase; P2: Jm3); cdecl; overload;
//    function a(P1: JList; P2: JList): JList; cdecl; overload;
//    function a(P1: JSQLiteDatabase; P2: JString; P3: JString): JSet; cdecl; overload;
//    function b(P1: JSQLiteDatabase; P2: JString; P3: JString): JList; cdecl; overload;
//    function a(P1: JSQLiteDatabase; P2: JString; P3: JString; P4: TJavaObjectArray<JString>): Integer; cdecl; overload;
//    function c(P1: JSQLiteDatabase; P2: JString; P3: JString): JList; cdecl; overload;
//    function a(P1: JSQLiteDatabase; P2: JString; P3: JString; P4: Integer): JList; cdecl; overload;
//    function b(P1: JSQLiteDatabase; P2: JString; P3: JString; P4: Integer): JList; cdecl; overload;
//    function a(P1: JSQLiteDatabase; P2: JString): JList; cdecl; overload;
//
//    { Property }
//    property a: Jh3 read _Geta write _Seta;
//    property b: Jc0 read _Getb write _Setb;
//    property c: Ji3 read _Getc write _Setc;
//  end;

//  TJj3 = class(TJavaGenericImport<Jj3Class, Jj3>) end;

//  Jj4Class = interface(JObjectClass)
//  ['{DDB8234D-7FA0-4EDD-A913-32D7E95DC081}']
//    { static Property Methods }
//    {class} function _Getb: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jj4; cdecl;
//
//    { static Property }
//    {class} property b: JObject read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j4')]
//  Jj4 = interface(JObject)
//  ['{589C2E23-E39B-4D85-80EF-E650B66B5C36}']
//    { Property Methods }
//    function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JString): JString; cdecl; overload;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: JList read _Geta write _Seta;
//  end;

//  TJj4 = class(TJavaGenericImport<Jj4Class, Jj4>) end;

//  JkClass = interface(JoClass) // or JObjectClass
//  ['{811308EE-CD00-4023-9743-263C1C257AE9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k')]
//  Jk = interface(Jo) // or JObject
//  ['{29775549-A3DB-4F01-978B-7C8093A50261}']
//    { Property Methods }
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: JInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: JInteger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload;
//    procedure b(P1: JString); cdecl;
//    procedure c(P1: JString); cdecl; overload;
//    procedure d(P1: JString); cdecl; overload;
//    function c: JString; cdecl; overload;
//    function e: JString; cdecl;
//    function d: JString; cdecl; overload;
//    function a: JJSONObject; cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//
//    { Property }
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JString read _Getf write _Setf;
//    property g: JString read _Getg write _Setg;
//    property h: JString read _Geth write _Seth;
//    property i: JString read _Geti write _Seti;
//    property j: JString read _Getj write _Setj;
//    property k: JString read _Getk write _Setk;
//    property l: JString read _Getl write _Setl;
//    property m: JString read _Getm write _Setm;
//    property n: JString read _Getn write _Setn;
//    property o: JString read _Geto write _Seto;
//    property p: JInteger read _Getp write _Setp;
//    property q: JString read _Getq write _Setq;
//    property r: JString read _Getr write _Setr;
//    property s: JString read _Gets write _Sets;
//    property t: JString read _Gett write _Sett;
//    property u: JString read _Getu write _Setu;
//    property v: JString read _Getv write _Setv;
//  end;

//  TJk = class(TJavaGenericImport<JkClass, Jk>) end;

//  Jk0_aClass = interface(JObjectClass)
//  ['{C41B8AEE-943A-42B7-945B-5D4EB3F9E014}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk0): Jk0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k0$a')]
//  Jk0_a = interface(JObject)
//  ['{6F8DBAC6-3077-4246-B247-478D1EEDE5E1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJk0_a = class(TJavaGenericImport<Jk0_aClass, Jk0_a>) end;

//  Jk0_bClass = interface(JObjectClass)
//  ['{4A17A2A2-4C93-41C7-ABE4-67EBE93D3690}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk0; P2: Jb_d; P3: Jk3): Jk0_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k0$b')]
//  Jk0_b = interface(JObject)
//  ['{21172781-7A6B-4877-83BB-07B6D46A7D75}']
//    { Property Methods }
//    function _Geta: Jb_d;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jb_d);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jk3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jk3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Jd); cdecl;
//
//    { Property }
//    property a: Jb_d read _Geta write _Seta;
//    property b: Jk3 read _Getb write _Setb;
//  end;

//  TJk0_b = class(TJavaGenericImport<Jk0_bClass, Jk0_b>) end;

//  Jk0Class = interface(JObjectClass)
//  ['{A2D18513-5484-465F-9B86-FD46A4427CA0}']
//    { static Property Methods }
//    {class} function _Getb: Jk0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a; cdecl;
//    {class} function init: Jk0; cdecl;
//
//    { static Property }
//    {class} property b: Jk0 read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k0')]
//  Jk0 = interface(JObject)
//  ['{1DE73166-29F3-48DD-A864-A0BEDD2FBC29}']
//    { Property Methods }
//    function _Geta: JThread_UncaughtExceptionHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JThread_UncaughtExceptionHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure uncaughtException(P1: JThread; P2: JThrowable); cdecl;
//
//    { Property }
//    property a: JThread_UncaughtExceptionHandler read _Geta write _Seta;
//  end;

//  TJk0 = class(TJavaGenericImport<Jk0Class, Jk0>) end;

//  Jk1Class = interface(Jg1Class) // or JObjectClass
//  ['{2DB637B9-1A0C-4789-9F46-366651B85E8E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext; P3: Jl1): Jk1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k1')]
//  Jk1 = interface(Jg1) // or JObject
//  ['{7C2D3F7C-0B4D-4E92-B4EE-817F7439527F}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//    property g: Jl1 read _Getg write _Setg;
//  end;

//  TJk1 = class(TJavaGenericImport<Jk1Class, Jk1>) end;

//  Jk2Class = interface(JObjectClass)
//  ['{6248BA91-3867-4D95-ADD8-667B1AAB3108}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jy2): Jk2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k2')]
//  Jk2 = interface(JObject)
//  ['{295BE489-DF2D-4379-B84B-3D064E886DD7}']
//    { Property Methods }
//    function _Geta: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jy2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function execute(P1: Byte; P2: JString; P3: JJSONObject; P4: JMap; P5: Byte; P6: Boolean; P7: Integer): TJavaArray<Byte>; cdecl;
//
//    { Property }
//    property a: Jy2 read _Geta write _Seta;
//  end;

//  TJk2 = class(TJavaGenericImport<Jk2Class, Jk2>) end;

//  Jk3Class = interface(Jd3Class) // or JObjectClass
//  ['{D6EBD70E-2C3F-47BF-ADBB-952267A86D73}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk3; cdecl; overload;
//    {class} function init(P1: JString): Jk3; cdecl; overload;
//    {class} function init(P1: JString; P2: Boolean): Jk3; cdecl; overload;
//    {class} function init(P1: JString; P2: JJSONObject): Jk3; cdecl; overload;
//    {class} function init(P1: JString; P2: JString; P3: Boolean; P4: JString): Jk3; cdecl; overload;
//    {class} function init(P1: JString; P2: JString; P3: Boolean; P4: JString; P5: Integer): Jk3; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k3')]
//  Jk3 = interface(Jd3) // or JObject
//  ['{B8B0143D-E5DA-40AF-95AE-953BC9941023}']
//    { Property Methods }
//    function _Gets: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: JList; cdecl; overload;
//    function a(P1: JCursor): Integer; cdecl; overload;
//    procedure b(P1: JContentValues); cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function i: JJSONObject; cdecl;
//    function a(P1: JJSONObject): Jd3; cdecl; overload;
//    procedure k; cdecl;
//    function f: JString; cdecl;
//    function c: JString; cdecl;
//    function e: JString; cdecl;
//
//    { Property }
//    property s: JString read _Gets write _Sets;
//    property t: Boolean read _Gett write _Sett;
//    property u: JString read _Getu write _Setu;
//  end;

//  TJk3 = class(TJavaGenericImport<Jk3Class, Jk3>) end;

//  Jk4Class = interface(JObjectClass)
//  ['{FB3D7D00-2AF1-4936-A4BE-35639BE7AA87}']
//    { static Property Methods }
//    {class} function _Geta: Jj4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JString): JString; cdecl;
//    {class} function init: Jk4; cdecl;
//
//    { static Property }
//    {class} property a: Jj4 read _Geta;
//    {class} property b: JMap read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k4')]
//  Jk4 = interface(JObject)
//  ['{D06DEF9D-0541-418C-ACD1-91EDC0175218}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk4 = class(TJavaGenericImport<Jk4Class, Jk4>) end;

//  Jl_aClass = interface(JObjectClass)
//  ['{090EC693-A19A-451D-8A65-2C910B2F425B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDefaultConstructorMarker): Jl_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l$a')]
//  Jl_a = interface(JObject)
//  ['{6D05E0F7-2267-4EE4-AE2A-F9D8C147DD5A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JClass): Jl; cdecl;
//
//    { Property }
//  end;

//  TJl_a = class(TJavaGenericImport<Jl_aClass, Jl_a>) end;

//  JlClass = interface(JObjectClass)
//  ['{5FEE7AE3-D9A8-4F55-A0B9-C63E3EA4F0C8}']
//    { static Property Methods }
//    {class} function _Getb: Jl_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jl; cdecl; overload;
//    {class} function init: Jl; cdecl; overload;
//
//    { static Property }
//    {class} property b: Jl_a read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l')]
//  Jl = interface(JObject)
//  ['{0A8B2FC6-0DD2-4E76-8A7C-9A9F490A348D}']
//    { Property Methods }
//    function _Geta: Jo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jo);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Jo; cdecl;
//
//    { Property }
//    property a: Jo read _Geta write _Seta;
//  end;

//  TJl = class(TJavaGenericImport<JlClass, Jl>) end;

//  Jl0Class = interface(Jm0Class) // or JObjectClass
//  ['{422F5E6A-C024-4C39-84A5-1729C948584F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDrawable): Jl0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l0')]
//  Jl0 = interface(Jm0) // or JObject
//  ['{172629DA-8785-40CB-ACAE-1A3DC1E3CDB4}']
//    { Property Methods }
//    function _Getb: JPaint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JPaint);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure draw(P1: JCanvas); cdecl;
//    procedure a(P1: Integer); cdecl;
//
//    { Property }
//    property b: JPaint read _Getb write _Setb;
//  end;

//  TJl0 = class(TJavaGenericImport<Jl0Class, Jl0>) end;

//  Jl1_aClass = interface(JObjectClass)
//  ['{FD73D1CC-8175-4816-91C2-8ED54DF40227}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jl1): Jl1_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l1$a')]
//  Jl1_a = interface(JObject)
//  ['{45DA613F-9810-4F29-BAFB-D4353F70E5BB}']
//    { Property Methods }
//    function _Geta: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: Jl1 read _Geta write _Seta;
//  end;

//  TJl1_a = class(TJavaGenericImport<Jl1_aClass, Jl1_a>) end;

//  Jl1Class = interface(JObjectClass)
//  ['{30A55329-98F5-4DAC-8907-C7DCB29B4B61}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext; P3: JInitConfig): Jl1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l1')]
//  Jl1 = interface(JObject)
//  ['{82C987D2-AEEC-43A4-B959-F588B4EFCF2C}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JInitConfig;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JInitConfig);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function i: Boolean; cdecl;
//    procedure k; cdecl;
//    function b: JString; cdecl;
//    function d: JString; cdecl;
//    function g: JString; cdecl;
//    function h: Boolean; cdecl;
//    function a: JJSONObject; cdecl; overload;
//    function c: JString; cdecl;
//    function e: Int64; cdecl;
//    function a(P1: JList): Boolean; cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function f: JString; cdecl;
//    function j: Boolean; cdecl;
//    function a(P1: Int64): Boolean; cdecl; overload;
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//    property b: Jd read _Getb write _Setb;
//    property c: JInitConfig read _Getc write _Setc;
//    property d: JSharedPreferences read _Getd write _Setd;
//    property e: JSharedPreferences read _Gete write _Sete;
//    property f: JSharedPreferences read _Getf write _Setf;
//    property g: JJSONObject read _Getg write _Setg;
//    property h: JString read _Geth write _Seth;
//    property i: JJSONObject read _Geti write _Seti;
//    property j: JSet read _Getj write _Setj;
//    property k: JSet read _Getk write _Setk;
//    property l: Integer read _Getl write _Setl;
//    property m: Integer read _Getm write _Setm;
//    property n: Int64 read _Getn write _Setn;
//    property o: Integer read _Geto write _Seto;
//    property p: Int64 read _Getp write _Setp;
//    property q: Boolean read _Getq write _Setq;
//    property r: Integer read _Getr write _Setr;
//  end;

//  TJl1 = class(TJavaGenericImport<Jl1Class, Jl1>) end;

//  Jl2Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{49F7B900-7990-4212-B1B5-2B210556E8C8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l2')]
//  Jl2 = interface(JBroadcastReceiver) // or JObject
//  ['{7A3C0ACE-71DE-4129-94A4-29A3F1C9E87B}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJl2 = class(TJavaGenericImport<Jl2Class, Jl2>) end;

//  Jl3Class = interface(Jd3Class) // or JObjectClass
//  ['{45E2327E-B929-4DAD-B052-AD62A22E567B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l3')]
//  Jl3 = interface(Jd3) // or JObject
//  ['{7AD25509-32C6-461C-A31B-EDC50F7FB218}']
//    { Property Methods }
//    function _Gets: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: JList; cdecl; overload;
//    function a(P1: JCursor): Integer; cdecl; overload;
//    procedure b(P1: JContentValues); cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function i: JJSONObject; cdecl;
//    function a(P1: JJSONObject): Jd3; cdecl; overload;
//    function f: JString; cdecl;
//    function c: JString; cdecl;
//
//    { Property }
//    property s: Integer read _Gets write _Sets;
//    property t: JString read _Gett write _Sett;
//    property u: Boolean read _Getu write _Setu;
//    property v: JString read _Getv write _Setv;
//    property w: Integer read _Getw write _Setw;
//    property x: JString read _Getx write _Setx;
//    property y: JString read _Gety write _Sety;
//    property z: Boolean read _Getz write _Setz;
//  end;

//  TJl3 = class(TJavaGenericImport<Jl3Class, Jl3>) end;

//  Jl4Class = interface(JObjectClass)
//  ['{DFD51F1F-82E9-438C-9097-60F683B0452C}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: JString read _Geta;
//    {class} property b: Integer read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l4')]
//  Jl4 = interface(JObject)
//  ['{647F3FFA-E1F2-421D-8EEE-755E5E7D0A5B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl4 = class(TJavaGenericImport<Jl4Class, Jl4>) end;

//  Jm_aClass = interface(JEnumClass) // or JObjectClass
//  ['{2349FE91-075D-441F-BC03-489BB1AFA51D}']
//    { static Property Methods }
//    {class} function _Geta: Jm_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jm_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: TJavaObjectArray<Jm_a>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jm_a; cdecl; overload;
//    {class} function init(P1: JString; P2: Integer): Jm_a; cdecl; overload;
//    {class} function values: TJavaObjectArray<Jm_a>; cdecl;
//    {class} function valueOf(P1: JString): Jm_a; cdecl;
//
//    { static Property }
//    {class} property a: Jm_a read _Geta;
//    {class} property b: Jm_a read _Getb;
//    {class} property c: TJavaObjectArray<Jm_a> read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m$a')]
//  Jm_a = interface(JEnum) // or JObject
//  ['{9FB0749D-6713-4536-9754-5B5246B7B7C4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm_a = class(TJavaGenericImport<Jm_aClass, Jm_a>) end;

//  JmClass = interface(JoClass) // or JObjectClass
//  ['{236F8B2D-95CE-49A2-B212-434ECB8DED15}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m')]
//  Jm = interface(Jo) // or JObject
//  ['{1DA8DAD8-3BF6-472C-BC7A-44AFA15D3F2A}']
//    { Property Methods }
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetA: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetA(aA: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetB: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetC(aC: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetD(aD: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetE: Jm_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetE(aE: Jm_a);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetF: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetF(aF: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetG(aG: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JJSONObject; cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//
//    { Property }
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JString read _Getf write _Setf;
//    property g: JString read _Getg write _Setg;
//    property h: JString read _Geth write _Seth;
//    property i: JString read _Geti write _Seti;
//    property j: JString read _Getj write _Setj;
//    property k: JString read _Getk write _Setk;
//    property l: JString read _Getl write _Setl;
//    property m: JString read _Getm write _Setm;
//    property n: Boolean read _Getn write _Setn;
//    property o: Integer read _Geto write _Seto;
//    property p: JString read _Getp write _Setp;
//    property q: JString read _Getq write _Setq;
//    property r: JString read _Getr write _Setr;
//    property s: JString read _Gets write _Sets;
//    property t: JString read _Gett write _Sett;
//    property u: JString read _Getu write _Setu;
//    property v: JString read _Getv write _Setv;
//    property w: JString read _Getw write _Setw;
//    property x: JString read _Getx write _Setx;
//    property y: JString read _Gety write _Sety;
//    property z: JString read _Getz write _Setz;
//    property A: JString read _GetA write _SetA;
//    property B: JString read _GetB write _SetB;
//    property C: JString read _GetC write _SetC;
//    property D: JString read _GetD write _SetD;
//    property E: Jm_a read _GetE write _SetE;
//    property F: JString read _GetF write _SetF;
//    property G: Boolean read _GetG write _SetG;
//  end;

//  TJm = class(TJavaGenericImport<JmClass, Jm>) end;

//  Jm0Class = interface(JDrawableClass) // or JObjectClass
//  ['{F4DBBF0A-F715-4A40-913F-A9F67C1FEA7E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDrawable): Jm0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m0')]
//  Jm0 = interface(JDrawable) // or JObject
//  ['{C1A8E755-94E8-462E-B629-0E7D7ABCFCA6}']
//    { Property Methods }
//    function _Geta: JDrawable;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JDrawable);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onBoundsChange(P1: JRect); cdecl;
//    procedure setChangingConfigurations(P1: Integer); cdecl;
//    function getChangingConfigurations: Integer; cdecl;
//    procedure setDither(P1: Boolean); cdecl;
//    procedure setFilterBitmap(P1: Boolean); cdecl;
//    procedure setAlpha(P1: Integer); cdecl;
//    procedure setColorFilter(P1: JColorFilter); cdecl;
//    function isStateful: Boolean; cdecl;
//    function setState(P1: TJavaArray<Integer>): Boolean; cdecl;
//    function getState: TJavaArray<Integer>; cdecl;
//    procedure jumpToCurrentState; cdecl;
//    function getCurrent: JDrawable; cdecl;
//    function setVisible(P1: Boolean; P2: Boolean): Boolean; cdecl;
//    function getOpacity: Integer; cdecl;
//    function getTransparentRegion: JRegion; cdecl;
//    function getIntrinsicWidth: Integer; cdecl;
//    function getIntrinsicHeight: Integer; cdecl;
//    function getMinimumWidth: Integer; cdecl;
//    function getMinimumHeight: Integer; cdecl;
//    function getPadding(P1: JRect): Boolean; cdecl;
//    procedure invalidateDrawable(P1: JDrawable); cdecl;
//    procedure scheduleDrawable(P1: JDrawable; P2: JRunnable; P3: Int64); cdecl;
//    procedure unscheduleDrawable(P1: JDrawable; P2: JRunnable); cdecl;
//    function onLevelChange(P1: Integer): Boolean; cdecl;
//    procedure setAutoMirrored(P1: Boolean); cdecl;
//    function isAutoMirrored: Boolean; cdecl;
//    procedure setTint(P1: Integer); cdecl;
//    procedure setTintList(P1: JColorStateList); cdecl;
//    procedure setTintMode(P1: JPorterDuff_Mode); cdecl;
//    procedure setHotspot(P1: Single; P2: Single); cdecl;
//    procedure setHotspotBounds(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
//    function a: JDrawable; cdecl;
//
//    { Property }
//    property a: JDrawable read _Geta write _Seta;
//  end;

//  TJm0 = class(TJavaGenericImport<Jm0Class, Jm0>) end;

//  Jm1Class = interface(JObjectClass)
//  ['{54C1633E-0330-414B-A780-737210C4FBF0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jl1; P2: JJSONObject): Jm1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m1')]
//  Jm1 = interface(JObject)
//  ['{609D817E-9C6D-4E3C-9394-178E7363205C}']
//    { Property Methods }
//    function _Geta: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JJSONObject read _Geta write _Seta;
//    property b: Jl1 read _Getb write _Setb;
//  end;

//  TJm1 = class(TJavaGenericImport<Jm1Class, Jm1>) end;

//  Jm2Class = interface(JRangersHttpExceptionClass) // or JObjectClass
//  ['{D3EF7AFC-C165-44AB-85CB-5FE843FEB3EE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Jm2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m2')]
//  Jm2 = interface(JRangersHttpException) // or JObject
//  ['{6D776103-EEA5-4CA5-95DA-BF4F2EF74277}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm2 = class(TJavaGenericImport<Jm2Class, Jm2>) end;

//  Jm3Class = interface(Jd3Class) // or JObjectClass
//  ['{3D40EFF9-5D9E-42F5-A205-F725887D2316}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m3')]
//  Jm3 = interface(Jd3) // or JObject
//  ['{D026770C-EC81-4831-88BF-7409AA6C9117}']
//    { Property Methods }
//    function _Gets: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetA(aA: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetB: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: JList; cdecl; overload;
//    function a(P1: JCursor): Integer; cdecl; overload;
//    procedure b(P1: JContentValues); cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function i: JJSONObject; cdecl;
//    function a(P1: JJSONObject): Jd3; cdecl; overload;
//    function f: JString; cdecl;
//    function c: JString; cdecl;
//    function k: Integer; cdecl;
//    procedure m; cdecl;
//    procedure n; cdecl;
//    function toString: JString; cdecl;
//    function l: JSet; cdecl;
//    function a(P1: JSet): JJSONArray; cdecl; overload;
//
//    { Property }
//    property s: JList read _Gets write _Sets;
//    property t: JList read _Gett write _Sett;
//    property u: JList read _Getu write _Setu;
//    property v: JList read _Getv write _Setv;
//    property w: JList read _Getw write _Setw;
//    property x: JList read _Getx write _Setx;
//    property y: JJSONObject read _Gety write _Sety;
//    property z: TJavaArray<Byte> read _Getz write _Setz;
//    property A: Integer read _GetA write _SetA;
//    property B: JString read _GetB write _SetB;
//  end;

//  TJm3 = class(TJavaGenericImport<Jm3Class, Jm3>) end;

//  Jm4Class = interface(JObjectClass)
//  ['{8ED77A9C-4E00-4626-8209-D9EBE27BEF5F}']
//    { static Property Methods }
//    {class} function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a(P1: JIAppLogLogger; P2: JString; P3: JJSONObject); cdecl; overload;
//    {class} procedure a(P1: JIAppLogLogger; P2: JMap); cdecl; overload;
//    {class} procedure a(P1: JIAppLogLogger; P2: JJSONObject); cdecl; overload;
//    {class} function init: Jm4; cdecl;
//
//    { static Property }
//    {class} property a: JList read _Geta;
//    {class} property b: JPattern read _Getb;
//    {class} property c: JList read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m4')]
//  Jm4 = interface(JObject)
//  ['{8C3E740C-EE52-4940-9ACC-09069078348E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm4 = class(TJavaGenericImport<Jm4Class, Jm4>) end;

//  JnClass = interface(JoClass) // or JObjectClass
//  ['{C97A477E-D667-4106-B6FF-AB5D00B994E5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n')]
//  Jn = interface(Jo) // or JObject
//  ['{F9AA0FDD-0E3E-4EBB-9EF9-67753629B91F}']
//    { Property Methods }
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JJSONObject; cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//
//    { Property }
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//    property f: JString read _Getf write _Setf;
//    property g: JString read _Getg write _Setg;
//    property h: Boolean read _Geth write _Seth;
//    property i: Boolean read _Geti write _Seti;
//    property j: JString read _Getj write _Setj;
//    property k: JString read _Getk write _Setk;
//    property l: JString read _Getl write _Setl;
//    property m: JString read _Getm write _Setm;
//    property n: JString read _Getn write _Setn;
//    property o: JString read _Geto write _Seto;
//    property p: JString read _Getp write _Setp;
//    property q: JString read _Getq write _Setq;
//    property r: JString read _Getr write _Setr;
//    property s: JString read _Gets write _Sets;
//  end;

//  TJn = class(TJavaGenericImport<JnClass, Jn>) end;

//  Jn0Class = interface(JObjectClass)
//  ['{4500D727-A373-477C-B809-4782A3C26857}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JView; P2: JFloat): Boolean; cdecl; overload;
//    {class} function a(P1: JFileChannel): Jy0; cdecl; overload;
//    {class} function a(P1: JByteBuffer): JMap; cdecl; overload;
//    {class} function a(P1: Jg2): JJSONObject; cdecl; overload;
//    {class} function a(P1: JContext): JActivity; cdecl; overload;
//    {class} function a(P1: JView): JActivity; cdecl; overload;
//    {class} function a(P1: Boolean; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JObject; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JJSONObject; P2: JJSONObject; P3: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JObject; P2: JObject; P3: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    {class} function a(P1: JJSONObject; P2: TJavaObjectArray<JClass>; P3: TJavaObjectArray<JClass>): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<JObject>; P2: JObject): Boolean; cdecl; overload;
//    {class} function b(P1: JJSONObject; P2: JJSONObject): JJSONObject; cdecl; overload;
//    {class} function b(P1: JString): JClass; cdecl; overload;
//    {class} function a(P1: JObject; P2: TJavaObjectArray<JString>): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<JString>): JClass; cdecl; overload;
//    {class} function a(P1: JObject): JString; cdecl; overload;
//    {class} function b(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    {class} function d(P1: JString): Boolean; cdecl; overload;
//    {class} function c(P1: JString): Boolean; cdecl; overload;
//    {class} function a: JString; cdecl; overload;
//    {class} function e(P1: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JJSONObject; P2: JJSONObject): JJSONObject; cdecl; overload;
//    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: Boolean): JString; cdecl; overload;
//    {class} procedure a(P1: JCloseable); cdecl; overload;
//    {class} procedure a(P1: JCursor); cdecl; overload;
//    {class} procedure a(P1: JSQLiteDatabase); cdecl; overload;
//    {class} function a(P1: JString): Boolean; cdecl; overload;
//    {class} function b: JString; cdecl; overload;
//    {class} function a(P1: JView; P2: Boolean): Jf3; cdecl; overload;
//    {class} function d(P1: JView): Boolean; cdecl; overload;
//    {class} function e(P1: JView): Boolean; cdecl; overload;
//    {class} function b(P1: JView): JString; cdecl; overload;
//    {class} function c(P1: JView): JString; cdecl; overload;
//
//    { static Property }
//    {class} property a: JString read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n0')]
//  Jn0 = interface(JObject)
//  ['{30126899-1A32-4236-94CE-06B7D23F3208}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn0 = class(TJavaGenericImport<Jn0Class, Jn0>) end;

//  Jn1_aClass = interface(JObjectClass)
//  ['{708F4D31-7C8F-4445-BA06-5737D2212DAE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jn1): Jn1_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n1$a')]
//  Jn1_a = interface(JObject)
//  ['{310663A2-0F6E-4F13-A2A5-F4FE72C44C77}']
//    { Property Methods }
//    function _Geta: Jn1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jn1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: Jn1 read _Geta write _Seta;
//  end;

//  TJn1_a = class(TJavaGenericImport<Jn1_aClass, Jn1_a>) end;

//  Jn1Class = interface(JObjectClass)
//  ['{54BCE3B5-2E0B-4A72-9DC6-A79835B8E68C}']
//    { static Property Methods }
//    {class} function _Getl: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext; P3: Jl1): Jn1; cdecl; overload;
//    {class} procedure a(P1: JJSONObject; P2: JString; P3: JString); cdecl; overload;
//    {class} function init: Jn1; cdecl; overload;
//
//    { static Property }
//    {class} property l: TJavaObjectArray<JString> read _Getl;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n1')]
//  Jn1 = interface(JObject)
//  ['{92C1123A-27AD-4CA5-9AED-14B1018C14EC}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Ja4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Ja4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure b(P1: JString); cdecl; overload;
//    function e: JJSONObject; cdecl; overload;
//    function a(P1: JString; P2: JObject; P3: JClass): JObject; cdecl; overload;
//    function n: Integer; cdecl;
//    function o: JString; cdecl;
//    function q: Boolean; cdecl;
//    procedure f(P1: JString); cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    procedure a(P1: JHashMap); cdecl; overload;
//    procedure d(P1: JString); cdecl; overload;
//    function l: JString; cdecl;
//    function m: JString; cdecl;
//    function c: JString; cdecl; overload;
//    function b: JString; cdecl; overload;
//    function k: JString; cdecl;
//    function f: JString; cdecl; overload;
//    function j: JString; cdecl;
//    function h: JString; cdecl; overload;
//    procedure e(P1: JString); cdecl; overload;
//    function h(P1: JString): Boolean; cdecl; overload;
//    function b(P1: JString; P2: JString): Boolean; cdecl; overload;
//    procedure i(P1: JString); cdecl; overload;
//    function g(P1: JString): Boolean; cdecl; overload;
//    function g: Integer; cdecl; overload;
//    function i: Integer; cdecl; overload;
//    function a(P1: JJSONObject; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString): Boolean; cdecl; overload;
//    function p: Boolean; cdecl;
//    function r: Boolean; cdecl;
//    function a: JString; cdecl; overload;
//    procedure c(P1: JJSONObject); cdecl; overload;
//    function a(P1: JSet): JString; cdecl; overload;
//    function c(P1: JString): JSet; cdecl; overload;
//    function d: JJSONObject; cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function a(P1: JString; P2: JObject): Boolean; cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: JString; P2: JString); cdecl; overload;
//
//    { Property }
//    property a: Boolean read _Geta write _Seta;
//    property b: JContext read _Getb write _Setb;
//    property c: Jl1 read _Getc write _Setc;
//    property d: JJSONObject read _Getd write _Setd;
//    property e: Boolean read _Gete write _Sete;
//    property f: JArrayList read _Getf write _Setf;
//    property g: JSharedPreferences read _Getg write _Setg;
//    property h: Ja4 read _Geth write _Seth;
//    property i: Jd read _Geti write _Seti;
//    property j: Integer read _Getj write _Setj;
//    property k: Boolean read _Getk write _Setk;
//  end;

//  TJn1 = class(TJavaGenericImport<Jn1Class, Jn1>) end;

//  Jn2_aClass = interface(JObjectClass)
//  ['{CD87174E-F579-44B6-A103-85510874A649}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jn2; P2: JMap; P3: JIDBindCallback): Jn2_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n2$a')]
//  Jn2_a = interface(JObject)
//  ['{67EA8E0D-A4DA-4FC0-9A0F-E96EC697B754}']
//    { Property Methods }
//    function _Geta: Jn2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jn2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JIDBindCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JIDBindCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jn2 read _Geta write _Seta;
//    property b: JMap read _Getb write _Setb;
//    property c: JIDBindCallback read _Getc write _Setc;
//  end;

//  TJn2_a = class(TJavaGenericImport<Jn2_aClass, Jn2_a>) end;

//  Jn2Class = interface(JObjectClass)
//  ['{6470AF39-CDB4-409C-BF39-BBEDB5041521}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jn2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n2')]
//  Jn2 = interface(JObject)
//  ['{EF36D105-8B2F-4405-B504-0FA55FED823C}']
//    { Property Methods }
//    function _Geta: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JIAppLogLogger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JIAppLogLogger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JMap; P2: JIDBindCallback); cdecl;
//
//    { Property }
//    property a: Jd read _Geta write _Seta;
//    property b: JHandler read _Getb write _Setb;
//    property c: JIAppLogLogger read _Getc write _Setc;
//    property d: Jc0 read _Getd write _Setd;
//  end;

//  TJn2 = class(TJavaGenericImport<Jn2Class, Jn2>) end;

//  Jn3Class = interface(Jd3Class) // or JObjectClass
//  ['{47AAE14A-6DD2-4993-AED4-8EB00B3432FB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n3')]
//  Jn3 = interface(Jd3) // or JObject
//  ['{0B8402F7-FC28-438D-9A91-9A37C6E9BDA0}']
//    { Property Methods }
//    function _Gets: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getw: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetA(aA: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetB: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetC: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetC(aC: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetD: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetD(aD: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetE: JClass;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetE(aE: JClass);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: JList; cdecl; overload;
//    function a(P1: JCursor): Integer; cdecl; overload;
//    procedure b(P1: JContentValues); cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function a(P1: JJSONObject): Jd3; cdecl; overload;
//    function i: JJSONObject; cdecl;
//    function f: JString; cdecl;
//    function k: Boolean; cdecl;
//    function c: JString; cdecl;
//
//    { Property }
//    property s: Int64 read _Gets write _Sets;
//    property t: JString read _Gett write _Sett;
//    property u: JString read _Getu write _Setu;
//    property v: JString read _Getv write _Setv;
//    property w: JString read _Getw write _Setw;
//    property x: JString read _Getx write _Setx;
//    property y: JString read _Gety write _Sety;
//    property z: Int64 read _Getz write _Setz;
//    property A: Integer read _GetA write _SetA;
//    property B: JString read _GetB write _SetB;
//    property C: Boolean read _GetC write _SetC;
//    property D: Boolean read _GetD write _SetD;
//    property E: JClass read _GetE write _SetE;
//  end;

//  TJn3 = class(TJavaGenericImport<Jn3Class, Jn3>) end;

//  Jn4Class = interface(JObjectClass)
//  ['{C99625E0-75F3-4C24-AD78-E40DEBD3D10F}']
//    { static Property Methods }
//    {class} function _Geta: JSparseArray;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JLruCache;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JClass): JString; cdecl; overload;
//    {class} function a(P1: JView; P2: JString): JArrayList; cdecl; overload;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: JView; P2: Boolean): JString; cdecl; overload;
//    {class} function b(P1: JView): Boolean; cdecl;
//    {class} function a(P1: JView): Integer; cdecl; overload;
//    {class} function a(P1: JContext; P2: Integer): Boolean; cdecl; overload;
//    {class} function a(P1: JWebView): Boolean; cdecl; overload;
//    {class} function init: Jn4; cdecl;
//
//    { static Property }
//    {class} property a: JSparseArray read _Geta;
//    {class} property b: JSet read _Getb;
//    {class} property c: JLruCache read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n4')]
//  Jn4 = interface(JObject)
//  ['{219459D4-FC8E-46E4-933C-594D046E5F24}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn4 = class(TJavaGenericImport<Jn4Class, Jn4>) end;

//  Jo_aClass = interface(JObjectClass)
//  ['{8B06300B-8A81-4503-B7FA-E0AB247A516E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDefaultConstructorMarker): Jo_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o$a')]
//  Jo_a = interface(JObject)
//  ['{A8170903-9FA1-42EA-BF91-D980271BFE05}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JJSONObject; P2: JClass): Jo; cdecl;
//
//    { Property }
//  end;

//  TJo_a = class(TJavaGenericImport<Jo_aClass, Jo_a>) end;

//  JoClass = interface(JObjectClass)
//  ['{8CCA1756-35C3-472F-BFE5-83C8E5F7F311}']
//    { static Property Methods }
//    {class} function _Geta: Jo_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jo; cdecl; overload;
//    {class} function init: Jo; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jo_a read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o')]
//  Jo = interface(JObject)
//  ['{838BEAF1-BF76-4510-88D0-621AABCFC9EC}']
//    { Property Methods }
//
//    { methods }
//    function a: JJSONObject; cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function b: JMap; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJo = class(TJavaGenericImport<JoClass, Jo>) end;

//  Jo0Class = interface(JObjectClass)
//  ['{AC1A418F-3061-4624-8571-6A7B1FB3F8F6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureData; P2: Boolean; P3: Integer): Jo0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o0')]
//  Jo0 = interface(JObject)
//  ['{8AC0CD3B-FA29-42C8-9C31-BC875DC90DFA}']
//    { Property Methods }
//    function _Geta: JViewExposureData;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JViewExposureData);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JViewExposureData; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//
//    { Property }
//    property a: JViewExposureData read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//  end;

//  TJo0 = class(TJavaGenericImport<Jo0Class, Jo0>) end;

//  Jo1Class = interface(JObjectClass)
//  ['{536C9205-D581-4B76-9308-DD6C6816CBB3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jn1; P2: JJSONObject): Jo1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o1')]
//  Jo1 = interface(JObject)
//  ['{A85E5CF7-45E0-4631-B9BB-18AE9281A147}']
//    { Property Methods }
//    function _Geta: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jn1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jn1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JJSONObject read _Geta write _Seta;
//    property b: Jn1 read _Getb write _Setb;
//  end;

//  TJo1 = class(TJavaGenericImport<Jo1Class, Jo1>) end;

//  Jo2Class = interface(JObjectClass)
//  ['{EAC3E9FE-596C-4E5E-AD01-E9C15E967CC3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIDBindCallback; P2: Integer; P3: JString): Jo2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o2')]
//  Jo2 = interface(JObject)
//  ['{4982BB1A-B2E4-4DCE-BC2E-4BF4A69B18E9}']
//    { Property Methods }
//    function _Geta: JIDBindCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIDBindCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JIDBindCallback read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//  end;

//  TJo2 = class(TJavaGenericImport<Jo2Class, Jo2>) end;

//  Jo3Class = interface(Jd3Class) // or JObjectClass
//  ['{71CCAC26-6241-46A9-82FC-12A87B92FB94}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jo3; cdecl; overload;
//    {class} function init(P1: JString; P2: JString): Jo3; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o3')]
//  Jo3 = interface(Jd3) // or JObject
//  ['{D7DF5D7F-B8B6-4FEC-B298-7BC2176AB3AF}']
//    { Property Methods }
//    function _Gets: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: JList; cdecl; overload;
//    function a(P1: JCursor): Integer; cdecl; overload;
//    procedure b(P1: JContentValues); cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function i: JJSONObject; cdecl;
//    function a(P1: JJSONObject): Jd3; cdecl; overload;
//    function f: JString; cdecl;
//    function c: JString; cdecl;
//    function e: JString; cdecl;
//
//    { Property }
//    property s: JString read _Gets write _Sets;
//    property t: JString read _Gett write _Sett;
//  end;

//  TJo3 = class(TJavaGenericImport<Jo3Class, Jo3>) end;

//  Jo4Class = interface(JObjectClass)
//  ['{E6C67A80-B3AF-4011-B7A6-99F7396D0162}']
//    { static Property Methods }
//    {class} function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JField;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JClass;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JClass;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a; cdecl; overload;
//    {class} function a(P1: JView): Boolean; cdecl; overload;
//    {class} function init: Jo4; cdecl;
//
//    { static Property }
//    {class} property a: JList read _Geta;
//    {class} property b: JField read _Getb;
//    {class} property c: JClass read _Getc;
//    {class} property d: JClass read _Getd;
//    {class} property e: Boolean read _Gete;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o4')]
//  Jo4 = interface(JObject)
//  ['{C82C3A45-C355-4FF2-9527-E59C65793BBB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJo4 = class(TJavaGenericImport<Jo4Class, Jo4>) end;

//  JpClass = interface(JObjectClass)
//  ['{119D98FA-5EEB-4685-8281-ABE5EFA2E7E0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Jp; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p')]
//  Jp = interface(JObject)
//  ['{5B06BAFE-0722-460C-940C-EFD20887CD11}']
//    { Property Methods }
//    function _Geta: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JString; P2: Jk): Jl; cdecl; overload;
//    function a(P1: JString; P2: Jn; P3: Jk): Jl; cdecl; overload;
//    function a: JHashMap; cdecl; overload;
//    function a(P1: JString; P2: JJSONObject): JString; cdecl; overload;
//
//    { Property }
//    property a: Jd read _Geta write _Seta;
//  end;

//  TJp = class(TJavaGenericImport<JpClass, Jp>) end;

//  Jp0Class = interface(JLambdaClass) // or JObjectClass
//  ['{3ADA960E-5571-4147-8CDD-E73440716C72}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager): Jp0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p0')]
//  Jp0 = interface(JLambda) // or JObject
//  ['{92B7841F-A149-4B68-8958-CFCAABDBF8E8}']
//    { Property Methods }
//    function _Geta: JViewExposureManager;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JViewExposureManager);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function invoke(P1: JObject): JObject; cdecl;
//
//    { Property }
//    property a: JViewExposureManager read _Geta write _Seta;
//  end;

//  TJp0 = class(TJavaGenericImport<Jp0Class, Jp0>) end;

//  Jp1Class = interface(Jg1Class) // or JObjectClass
//  ['{2E081B3A-8BDA-476D-80EB-C9167E247755}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Jl1; P3: Jn1): Jp1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p1')]
//  Jp1 = interface(Jg1) // or JObject
//  ['{E9399983-9471-4FD0-A6D3-2F68D1375810}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jn1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jn1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//    property f: Jn1 read _Getf write _Setf;
//    property g: Jl1 read _Getg write _Setg;
//  end;

//  TJp1 = class(TJavaGenericImport<Jp1Class, Jp1>) end;

//  Jp2Class = interface(JObjectClass)
//  ['{A2432617-267C-4752-90BE-B13CA8D999B1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIDBindCallback; P2: JIDBindResult): Jp2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p2')]
//  Jp2 = interface(JObject)
//  ['{94BFFF99-6E87-4044-8D3A-091A378B2C6E}']
//    { Property Methods }
//    function _Geta: JIDBindCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIDBindCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JIDBindResult;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JIDBindResult);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JIDBindCallback read _Geta write _Seta;
//    property b: JIDBindResult read _Getb write _Setb;
//  end;

//  TJp2 = class(TJavaGenericImport<Jp2Class, Jp2>) end;

//  Jp3_aClass = interface(JObjectClass)
//  ['{651D0534-C6AC-496E-93C6-83F0E19B7691}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p3$a')]
//  Jp3_a = interface(IJavaInstance)
//  ['{FB685070-B486-4FBF-8F0B-20218612A6F3}']
//    { Property Methods }
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//  end;

//  TJp3_a = class(TJavaGenericImport<Jp3_aClass, Jp3_a>) end;

//  Jp3Class = interface(Je3Class) // or JObjectClass
//  ['{5BCC43FD-4940-4286-A002-5694C2F66B61}']
//    { static Property Methods }
//    {class} function _Getf: Jp3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JContext): Jp3; cdecl; overload;
//    {class} function init(P1: JContext; P2: JString; P3: Boolean): Jp3; cdecl; overload;
//    {class} function init(P1: JContext; P2: JString; P3: JString): Jp3; cdecl; overload;
//    {class} function a(P1: JContext; P2: JString; P3: Integer): JSharedPreferences; cdecl; overload;
//
//    { static Property }
//    {class} property f: Jp3 read _Getf;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p3')]
//  Jp3 = interface(Je3) // or JObject
//  ['{90B7AC0D-B5AE-49E3-992D-AFFC1EA7BCAC}']
//    { Property Methods }
//    function _Getc: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JString; P2: Jp3_a): JString; cdecl; overload;
//    procedure a(P1: JString; P2: JString); cdecl; overload;
//    function b(P1: JString): JString; cdecl;
//    function c(P1: JString): TJavaObjectArray<JString>; cdecl;
//    procedure a(P1: JString; P2: TJavaObjectArray<JString>); cdecl; overload;
//    function e(P1: JString): JString; cdecl;
//    procedure h(P1: JString; P2: JString); cdecl;
//    function d(P1: JString): JSharedPreferences; cdecl;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//    property c: JSharedPreferences read _Getc write _Setc;
//    property d: JSharedPreferences read _Getd write _Setd;
//    property e: Boolean read _Gete write _Sete;
//  end;

//  TJp3 = class(TJavaGenericImport<Jp3Class, Jp3>) end;

//  Jp4Class = interface(JObjectClass)
//  ['{E0EA1E58-8DAE-40C7-955B-165FC52F65B0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jp4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p4')]
//  Jp4 = interface(JObject)
//  ['{21A01785-A97A-47D7-ADB6-89737C4CD4B2}']
//    { Property Methods }
//    function _Geta: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//    function b(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//    property a: JObject read _Geta write _Seta;
//  end;

//  TJp4 = class(TJavaGenericImport<Jp4Class, Jp4>) end;

//  JqClass = interface(JObjectClass)
//  ['{6029C182-EFAE-4B03-B0C6-F33816028392}']
//    { static Property Methods }
//    {class} function _Geta: Jq;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jq; cdecl; overload;
//    {class} function init: Jq; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jq read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q')]
//  Jq = interface(JObject)
//  ['{5A741071-64E9-44D9-BF0C-20A05840944B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JUri): JJSONObject; cdecl; overload;
//    function a(P1: JContext): JJSONObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJq = class(TJavaGenericImport<JqClass, Jq>) end;

//  Jq0_aClass = interface(JObjectClass)
//  ['{7B742422-B462-4E8A-B26A-C180A1209777}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jq0): Jq0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q0$a')]
//  Jq0_a = interface(JObject)
//  ['{B9700A33-37F2-473D-BA66-67921D327661}']
//    { Property Methods }
//    function _Geta: Jq0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jq0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onDraw; cdecl;
//
//    { Property }
//    property a: Jq0 read _Geta write _Seta;
//  end;

//  TJq0_a = class(TJavaGenericImport<Jq0_aClass, Jq0_a>) end;

//  Jq0_bClass = interface(JObjectClass)
//  ['{2F36F478-81DF-4316-8E9C-3D7950BE5864}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jq0): Jq0_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q0$b')]
//  Jq0_b = interface(JObject)
//  ['{AEB5913C-9A55-441F-9686-2C7674D0980E}']
//    { Property Methods }
//    function _Geta: Jq0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jq0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onGlobalFocusChanged(P1: JView; P2: JView); cdecl;
//
//    { Property }
//    property a: Jq0 read _Geta write _Seta;
//  end;

//  TJq0_b = class(TJavaGenericImport<Jq0_bClass, Jq0_b>) end;

//  Jq0_cClass = interface(JObjectClass)
//  ['{8EBD7D12-CBBB-476E-834A-6D4FD253F33A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jq0): Jq0_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q0$c')]
//  Jq0_c = interface(JObject)
//  ['{F7FB08D2-0998-4903-9E5A-8AF6D04BF988}']
//    { Property Methods }
//    function _Geta: Jq0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jq0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onGlobalLayout; cdecl;
//
//    { Property }
//    property a: Jq0 read _Geta write _Seta;
//  end;

//  TJq0_c = class(TJavaGenericImport<Jq0_cClass, Jq0_c>) end;

//  Jq0_dClass = interface(JObjectClass)
//  ['{19CF9541-E71A-4B8E-95F3-EE64825489FC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jq0): Jq0_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q0$d')]
//  Jq0_d = interface(JObject)
//  ['{FA62D703-A141-46FD-A976-6B4EAC844EE3}']
//    { Property Methods }
//    function _Geta: Jq0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jq0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onScrollChanged; cdecl;
//
//    { Property }
//    property a: Jq0 read _Geta write _Seta;
//  end;

//  TJq0_d = class(TJavaGenericImport<Jq0_dClass, Jq0_d>) end;

//  Jq0_eClass = interface(JObjectClass)
//  ['{2D834FD9-BDD6-4F67-8205-247E4D17CBD3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jq0): Jq0_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q0$e')]
//  Jq0_e = interface(JObject)
//  ['{CF3EDF24-CB80-4739-96A6-50E51A93E915}']
//    { Property Methods }
//    function _Geta: Jq0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jq0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onWindowFocusChanged(P1: Boolean); cdecl;
//
//    { Property }
//    property a: Jq0 read _Geta write _Seta;
//  end;

//  TJq0_e = class(TJavaGenericImport<Jq0_eClass, Jq0_e>) end;

//  Jq0Class = interface(JObjectClass)
//  ['{0EA04289-3455-480D-ACD8-6F0035D115CE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JApplication): Jq0; cdecl;
//    {class} procedure a(P1: Jq0); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q0')]
//  Jq0 = interface(JObject)
//  ['{3905D379-66EF-4EF4-99D6-E4461EB6F76F}']
//    { Property Methods }
//    function _Geta: JWeakReference;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JWeakReference);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JViewTreeObserver_OnDrawListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JViewTreeObserver_OnDrawListener);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JViewTreeObserver_OnGlobalLayoutListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JViewTreeObserver_OnGlobalLayoutListener);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JViewTreeObserver_OnGlobalFocusChangeListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JViewTreeObserver_OnGlobalFocusChangeListener);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JViewTreeObserver_OnScrollChangedListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JViewTreeObserver_OnScrollChangedListener);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JViewTreeObserver_OnWindowFocusChangeListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JViewTreeObserver_OnWindowFocusChangeListener);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JFunction1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JFunction1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JApplication;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JApplication);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JFunction1); cdecl; overload;
//    procedure onActivityResumed(P1: JActivity); cdecl;
//    procedure onActivityPaused(P1: JActivity); cdecl;
//    procedure onActivityCreated(P1: JActivity; P2: JBundle); cdecl;
//    procedure onActivityStarted(P1: JActivity); cdecl;
//    procedure onActivityStopped(P1: JActivity); cdecl;
//    procedure onActivitySaveInstanceState(P1: JActivity; P2: JBundle); cdecl;
//    procedure onActivityDestroyed(P1: JActivity); cdecl;
//
//    { Property }
//    property a: JWeakReference read _Geta write _Seta;
//    property b: JViewTreeObserver_OnDrawListener read _Getb write _Setb;
//    property c: JViewTreeObserver_OnGlobalLayoutListener read _Getc write _Setc;
//    property d: JViewTreeObserver_OnGlobalFocusChangeListener read _Getd write _Setd;
//    property e: JViewTreeObserver_OnScrollChangedListener read _Gete write _Sete;
//    property f: JViewTreeObserver_OnWindowFocusChangeListener read _Getf write _Setf;
//    property g: JFunction1 read _Getg write _Setg;
//    property h: JApplication read _Geth write _Seth;
//  end;

//  TJq0 = class(TJavaGenericImport<Jq0Class, Jq0>) end;

//  Jq1Class = interface(JObjectClass)
//  ['{6F7B7F15-1A8B-47EC-843F-E209A42905EA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q1')]
//  Jq1 = interface(JObject)
//  ['{6366A55B-C34D-43D3-B0F6-0FFD169D889B}']
//    { Property Methods }
//    function _Geta: Ja4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Ja4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JAccount;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JAccount);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jc3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jc3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Jd; P2: JContext; P3: Jl1): Ja4; cdecl;
//
//    { Property }
//    property a: Ja4 read _Geta write _Seta;
//    property b: JAccount read _Getb write _Setb;
//    property c: Jc3 read _Getc write _Setc;
//  end;

//  TJq1 = class(TJavaGenericImport<Jq1Class, Jq1>) end;

//  Jq2Class = interface(JObjectClass)
//  ['{8A88A747-67AE-4A10-BE2D-D4AA3C11BC43}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q2')]
//  Jq2 = interface(JObject)
//  ['{1F84AD3B-C3C2-4E3C-B4F1-595ACCE7954E}']
//    { Property Methods }
//
//    { methods }
//    procedure onEventV3(P1: JString; P2: JJSONObject); cdecl; overload;
//    procedure onEventV3(P1: JString; P2: JBundle); cdecl; overload;
//
//    { Property }
//  end;

//  TJq2 = class(TJavaGenericImport<Jq2Class, Jq2>) end;

//  Jq3Class = interface(Jd3Class) // or JObjectClass
//  ['{81FDD1C9-3C90-46A4-AD22-7FA375569F29}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q3')]
//  Jq3 = interface(Jd3) // or JObject
//  ['{6EA271D1-2E33-4E92-9B1B-130D9273DFFE}']
//    { Property Methods }
//    function _Gets: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: JList; cdecl; overload;
//    procedure b(P1: JContentValues); cdecl; overload;
//    procedure b(P1: JJSONObject); cdecl; overload;
//    function i: JJSONObject; cdecl;
//    function a(P1: JJSONObject): Jd3; cdecl;
//    function f: JString; cdecl;
//    function c: JString; cdecl;
//
//    { Property }
//    property s: Int64 read _Gets write _Sets;
//    property t: Int64 read _Gett write _Sett;
//    property u: JString read _Getu write _Setu;
//  end;

//  TJq3 = class(TJavaGenericImport<Jq3Class, Jq3>) end;

//  Jq4_aClass = interface(Jp4Class) // or JObjectClass
//  ['{0F74BB4C-1101-4A93-AA19-40B00CDCAFE3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q4$a')]
//  Jq4_a = interface(Jp4) // or JObject
//  ['{DCCB365F-CFD4-4346-A0A0-0EACC6516F1D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJq4_a = class(TJavaGenericImport<Jq4_aClass, Jq4_a>) end;

//  Jq4Class = interface(JObjectClass)
//  ['{3733314B-A129-466D-A792-E78C9ADA672B}']
//    { static Property Methods }
//    {class} function _Geta: Jp4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jq4; cdecl;
//
//    { static Property }
//    {class} property a: Jp4 read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q4')]
//  Jq4 = interface(JObject)
//  ['{743DBD52-7BC6-4F5D-A6C7-AA4FA6CC7E83}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJq4 = class(TJavaGenericImport<Jq4Class, Jq4>) end;

//  JrClass = interface(JObjectClass)
//  ['{3D08DF08-209F-41A3-A403-2843FE979B67}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: JString): Jr; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r')]
//  Jr = interface(JObject)
//  ['{4E090390-223A-4C87-A86F-8DFDF9A35180}']
//    { Property Methods }
//    function _Geta: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: Single read _Geta write _Seta;
//    property b: Single read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//  end;

//  TJr = class(TJavaGenericImport<JrClass, Jr>) end;

//  Jr0Class = interface(JObjectClass)
//  ['{64EAF7B9-F059-4C4E-B93F-182A65BF6FC5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHashSet; P2: JHashMap): Jr0; cdecl;
//    {class} function a(P1: JContext; P2: JString; P3: JJSONObject): Jr0; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r0')]
//  Jr0 = interface(JObject)
//  ['{04CA63D3-7F08-4778-BAD1-DF8419D43B8B}']
//    { Property Methods }
//    function _Geta: JHashSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JHashSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JHashMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JHashMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JString): Boolean; cdecl; overload;
//    function a(P1: JHashSet; P2: JString): Boolean; cdecl; overload;
//    function a(P1: JString; P2: JString): Boolean; cdecl; overload;
//
//    { Property }
//    property a: JHashSet read _Geta write _Seta;
//    property b: JHashMap read _Getb write _Setb;
//  end;

//  TJr0 = class(TJavaGenericImport<Jr0Class, Jr0>) end;

//  Jr1Class = interface(Jg1Class) // or JObjectClass
//  ['{A356454A-2ECC-46A1-B788-6F82DB828956}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext): Jr1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r1')]
//  Jr1 = interface(Jg1) // or JObject
//  ['{EB341CED-7567-4598-92A9-5E12F926D81A}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//  end;

//  TJr1 = class(TJavaGenericImport<Jr1Class, Jr1>) end;

//  Jr2Class = interface(JObjectClass)
//  ['{4971E379-78A0-41D7-9959-9A4E4B4957EB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDeviceComponentRegistrar_a; P2: JComponentContainer): Jr2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r2')]
//  Jr2 = interface(JObject)
//  ['{1A8A31E2-8BEB-454F-9A64-3D17C691BC7C}']
//    { Property Methods }
//    function _Geta: JComponentContainer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JComponentContainer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onIdLoaded(P1: JString; P2: JString; P3: JString); cdecl;
//    procedure onRemoteIdGet(P1: Boolean; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString); cdecl;
//    procedure onRemoteConfigGet(P1: Boolean; P2: JJSONObject); cdecl;
//    procedure onRemoteAbConfigGet(P1: Boolean; P2: JJSONObject); cdecl;
//    procedure onAbVidsChange(P1: JString; P2: JString); cdecl;
//
//    { Property }
//    property a: JComponentContainer read _Geta write _Seta;
//  end;

//  TJr2 = class(TJavaGenericImport<Jr2Class, Jr2>) end;

//  Jr3Class = interface(Jd3Class) // or JObjectClass
//  ['{F23D73A9-00F2-4B65-AADD-2F40CDAC1BE5}']
//    { static Property Methods }
//    {class} function _Gets: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jr3; cdecl; overload;
//    {class} function init: Jr3; cdecl; overload;
//
//    { static Property }
//    {class} property s: JJSONObject read _Gets;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r3')]
//  Jr3 = interface(Jd3) // or JObject
//  ['{54B0E139-D184-4E6B-83B5-BE38027034D0}']
//    { Property Methods }
//
//    { methods }
//    function i: JJSONObject; cdecl;
//    function f: JString; cdecl;
//
//    { Property }
//  end;

//  TJr3 = class(TJavaGenericImport<Jr3Class, Jr3>) end;

//  Jr4_aClass = interface(Jp4Class) // or JObjectClass
//  ['{0B4F31EF-BB40-4021-96DD-37FC07075E65}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r4$a')]
//  Jr4_a = interface(Jp4) // or JObject
//  ['{C7F53F7D-6F77-4A69-994D-E43C88F8AEB8}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJr4_a = class(TJavaGenericImport<Jr4_aClass, Jr4_a>) end;

//  Jr4Class = interface(JObjectClass)
//  ['{4C21A893-18AA-44AA-B03F-53B247DF9739}']
//    { static Property Methods }
//    {class} function _Geta: Jp4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JSharedPreferences): JString; cdecl; overload;
//    {class} function a(P1: JContext): JMap; cdecl; overload;
//    {class} function a(P1: JJSONObject): JString; cdecl; overload;
//    {class} procedure a(P1: JIOaidObserver); cdecl; overload;
//    {class} procedure a(P1: Jg); cdecl; overload;
//    {class} procedure b(P1: JIOaidObserver); cdecl;
//    {class} function init: Jr4; cdecl;
//
//    { static Property }
//    {class} property a: Jp4 read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r4')]
//  Jr4 = interface(JObject)
//  ['{07BE0EE0-62C1-4C0D-9FB5-675EF12A31C7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr4 = class(TJavaGenericImport<Jr4Class, Jr4>) end;

//  JsClass = interface(JObjectClass)
//  ['{76C6802F-A06B-44F3-B7FA-0E2A178C5B8C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jn3): Js; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s')]
//  Js = interface(JObject)
//  ['{4530CFE7-C340-4CCD-A751-C25C44E3E9A0}']
//    { Property Methods }
//    function _Geta: Jn3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jn3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Jd3; cdecl;
//
//    { Property }
//    property a: Jn3 read _Geta write _Seta;
//  end;

//  TJs = class(TJavaGenericImport<JsClass, Js>) end;

//  Js0Class = interface(Jr0Class) // or JObjectClass
//  ['{3C4A7933-F402-4DD3-9E39-336E86BFDCC3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHashSet; P2: JHashMap): Js0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s0')]
//  Js0 = interface(Jr0) // or JObject
//  ['{5093080C-D15C-4492-BCFD-09C24032CDAE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): Boolean; cdecl; overload;
//    function a(P1: JHashSet; P2: JString): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJs0 = class(TJavaGenericImport<Js0Class, Js0>) end;

//  Js1Class = interface(Jg1Class) // or JObjectClass
//  ['{352D450B-5E45-40D2-AC34-568226F385EB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Js1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s1')]
//  Js1 = interface(Jg1) // or JObject
//  ['{92716E8A-9DAA-4534-A6BA-6C89105FF177}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//  end;

//  TJs1 = class(TJavaGenericImport<Js1Class, Js1>) end;

//  Js2Class = interface(JObjectClass)
//  ['{104403D5-77B2-486B-8C02-19EFBF1D372F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Js2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s2')]
//  Js2 = interface(JObject)
//  ['{1ACAA87A-0545-441E-AB99-15DED83CE853}']
//    { Property Methods }
//
//    { methods }
//    function getDeviceID: JString; cdecl;
//    function getInstallID: JString; cdecl;
//    function getSsID: JString; cdecl;
//
//    { Property }
//  end;

//  TJs2 = class(TJavaGenericImport<Js2Class, Js2>) end;

//  Js3Class = interface(JObjectClass)
//  ['{B5612C6D-9E68-401E-B86B-694DCF135235}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Js3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s3')]
//  Js3 = interface(JObject)
//  ['{E1C245F4-774B-452D-A90F-7DEC7A334944}']
//    { Property Methods }
//    function _Geta: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//    function b(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//    property a: JObject read _Geta write _Seta;
//  end;

//  TJs3 = class(TJavaGenericImport<Js3Class, Js3>) end;

//  Js4Class = interface(JObjectClass)
//  ['{7F251421-7EC6-4C0C-980C-D4EFF0448BAF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JRunnable; P2: JString): Js4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s4')]
//  Js4 = interface(JObject)
//  ['{B38A5DF3-DB8D-4248-9B3B-B103C85A172E}']
//    { Property Methods }
//    function _Geta: JRunnable;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JRunnable);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JRunnable read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//  end;

//  TJs4 = class(TJavaGenericImport<Js4Class, Js4>) end;

//  JtClass = interface(JObjectClass)
//  ['{68908D02-38BF-4539-B1C1-368E83DFC53F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t')]
//  Jt = interface(JObject)
//  ['{05150F9F-0DAD-4C57-8CB1-FE91C75E3429}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJt = class(TJavaGenericImport<JtClass, Jt>) end;

//  Jt0Class = interface(Jr0Class) // or JObjectClass
//  ['{50438693-B429-4010-B19C-3142654723D2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHashSet; P2: JHashMap): Jt0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t0')]
//  Jt0 = interface(Jr0) // or JObject
//  ['{3D308602-0696-4EB3-946A-54697AD8F1F3}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): Boolean; cdecl; overload;
//    function a(P1: JHashSet; P2: JString): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJt0 = class(TJavaGenericImport<Jt0Class, Jt0>) end;

//  Jt1Class = interface(Jg1Class) // or JObjectClass
//  ['{E4559279-2F4C-4C5C-8034-0538255D9066}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jt1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t1')]
//  Jt1 = interface(Jg1) // or JObject
//  ['{3FDA1035-CC1E-46DA-85E4-D7F6C41D882B}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//  end;

//  TJt1 = class(TJavaGenericImport<Jt1Class, Jt1>) end;

//  Jt2_aClass = interface(JObjectClass)
//  ['{69C3E97F-E420-4ED9-82A3-58BBDA4CDAE2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jt2; P2: JJSONObject; P3: Boolean): Jt2_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t2$a')]
//  Jt2_a = interface(JObject)
//  ['{2AAF8899-A6E8-4D47-8F93-C96025E3DC36}']
//    { Property Methods }
//    function _Geta: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JJSONObject read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//  end;

//  TJt2_a = class(TJavaGenericImport<Jt2_aClass, Jt2_a>) end;

//  Jt2_bClass = interface(JObjectClass)
//  ['{43F7DA06-6102-4B40-BEB8-92C5E5B89E03}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Int64; P2: JString; P3: JJSONObject): Jt2_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t2$b')]
//  Jt2_b = interface(JObject)
//  ['{097ED062-AD92-4FDA-8282-8648E8C0CE2D}']
//    { Property Methods }
//    function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//    property a: Int64 read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JJSONObject read _Getc write _Setc;
//  end;

//  TJt2_b = class(TJavaGenericImport<Jt2_bClass, Jt2_b>) end;

//  Jt2Class = interface(JObjectClass)
//  ['{0C8F8F63-9C88-456D-BF7C-D042F6434C83}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jt2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t2')]
//  Jt2 = interface(JObject)
//  ['{A41292C6-B3DB-422B-9445-C73A77D26724}']
//    { Property Methods }
//    function _Geta: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure c(P1: JJSONObject); cdecl;
//    procedure d(P1: JJSONObject); cdecl;
//    procedure b(P1: JJSONObject); cdecl;
//    procedure e(P1: JJSONObject); cdecl;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//    procedure a(P1: Integer; P2: Jt2_b); cdecl; overload;
//    procedure a(P1: Jt2_b); cdecl; overload;
//    procedure a(P1: JJSONArray; P2: Boolean); cdecl; overload;
//
//    { Property }
//    property a: Jc0 read _Geta write _Seta;
//    property b: JHandler read _Getb write _Setb;
//    property c: JMap read _Getc write _Setc;
//    property d: JSet read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//  end;

//  TJt2 = class(TJavaGenericImport<Jt2Class, Jt2>) end;

//  Jt3Class = interface(JObjectClass)
//  ['{ADD1F2F9-06DE-46B4-8C44-420160DE3C35}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JClass;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JMethod;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JClass): JClass; cdecl; overload;
//    {class} function b(P1: JObject): Boolean; cdecl; overload;
//    {class} function a(P1: JObject): Boolean; cdecl; overload;
//    {class} function a(P1: JView): Boolean; cdecl; overload;
//    {class} function b(P1: JView): Boolean; cdecl; overload;
//    {class} function init: Jt3; cdecl;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: JClass read _Getb;
//    {class} property c: JMethod read _Getc;
//    {class} property d: Boolean read _Getd;
//    {class} property e: Boolean read _Gete;
//    {class} property f: Boolean read _Getf;
//    {class} property g: Boolean read _Getg;
//    {class} property h: Boolean read _Geth;
//    {class} property i: Boolean read _Geti;
//    {class} property j: Boolean read _Getj;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t3')]
//  Jt3 = interface(JObject)
//  ['{81FCA2D3-2F7D-4D36-A31D-07F4B868E0D3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt3 = class(TJavaGenericImport<Jt3Class, Jt3>) end;

//  Jt4_aClass = interface(JObjectClass)
//  ['{5C5B724A-4E4E-45EE-A8D5-D2741E24FBA2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jt4): Jt4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t4$a')]
//  Jt4_a = interface(JObject)
//  ['{A1F510C1-6D5D-4E5D-BCC5-23DE60D2DE46}']
//    { Property Methods }
//    function _Geta: Jt4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jt4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jt4 read _Geta write _Seta;
//  end;

//  TJt4_a = class(TJavaGenericImport<Jt4_aClass, Jt4_a>) end;

//  Jt4Class = interface(JObjectClass)
//  ['{8F823BA8-B4D7-4C23-B2B4-7230475B48D7}']
//    { static Property Methods }
//    {class} function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JContext): Jt4; cdecl; overload;
//    {class} procedure a(P1: JIOaidObserver); cdecl; overload;
//    {class} procedure b(P1: JIOaidObserver); cdecl; overload;
//    {class} function c: TJavaObjectArray<JObject>; cdecl;
//    {class} procedure a(P1: JIOaidObserver_Oaid; P2: TJavaObjectArray<JObject>); cdecl; overload;
//    {class} procedure a(P1: JJSONObject; P2: JString; P3: JObject); cdecl; overload;
//    {class} procedure a(P1: JMap; P2: JObject; P3: JObject); cdecl; overload;
//    {class} procedure a(P1: Jt4); cdecl; overload;
//    {class} function init: Jt4; cdecl; overload;
//
//    { static Property }
//    {class} property h: JString read _Geth;
//    {class} property i: JString read _Geti;
//    {class} property j: JList read _Getj;
//    {class} property k: Jg read _Getk;
//    {class} property l: JString read _Getl;
//    {class} property m: JMap read _Getm;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t4')]
//  Jt4 = interface(JObject)
//  ['{0EA89A6D-ABD4-4631-8842-6DC244E2076E}']
//    { Property Methods }
//    function _Geta: JReentrantLock;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JReentrantLock);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JOaidApi;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JOaidApi);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jv4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JAtomicBoolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JAtomicBoolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JLong;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JLong);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure b; cdecl; overload;
//
//    { Property }
//    property a: JReentrantLock read _Geta write _Seta;
//    property b: JOaidApi read _Getb write _Setb;
//    property c: Boolean read _Getc write _Setc;
//    property d: Jv4 read _Getd write _Setd;
//    property e: JContext read _Gete write _Sete;
//    property f: JAtomicBoolean read _Getf write _Setf;
//    property g: JLong read _Getg write _Setg;
//  end;

//  TJt4 = class(TJavaGenericImport<Jt4Class, Jt4>) end;

//  JuClass = interface(JObjectClass)
//  ['{95B6F23F-94BF-4F7B-905F-9EB953B8B931}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jn3): Ju; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u')]
//  Ju = interface(JObject)
//  ['{8FBE4ED2-F7B1-4A71-9BF5-A9E93C1FE158}']
//    { Property Methods }
//    function _Geta: Jn3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jn3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//    property a: Jn3 read _Geta write _Seta;
//  end;

//  TJu = class(TJavaGenericImport<JuClass, Ju>) end;

//  Ju0Class = interface(JObjectClass)
//  ['{9E4BA986-1C4F-4950-A091-D76993571787}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ju0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u0')]
//  Ju0 = interface(JObject)
//  ['{9931EA5B-EEAD-4552-89CF-2EC7984E6F31}']
//    { Property Methods }
//    function _Geta: JCopyOnWriteArraySet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JCopyOnWriteArraySet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onIdLoaded(P1: JString; P2: JString; P3: JString); cdecl;
//    procedure onRemoteIdGet(P1: Boolean; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString); cdecl;
//    procedure onRemoteConfigGet(P1: Boolean; P2: JJSONObject); cdecl;
//    procedure onRemoteAbConfigGet(P1: Boolean; P2: JJSONObject); cdecl;
//    procedure onAbVidsChange(P1: JString; P2: JString); cdecl;
//    procedure a(P1: JIDataObserver); cdecl;
//    procedure b(P1: JIDataObserver); cdecl;
//
//    { Property }
//    property a: JCopyOnWriteArraySet read _Geta write _Seta;
//  end;

//  TJu0 = class(TJavaGenericImport<Ju0Class, Ju0>) end;

//  Ju1Class = interface(Jg1Class) // or JObjectClass
//  ['{627E3A21-F7A8-467D-B2C8-7C43BC7827B8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Jl1): Ju1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u1')]
//  Ju1 = interface(Jg1) // or JObject
//  ['{6CEAD638-14CB-4BCA-A9CE-CC7EA9021E71}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//    property f: Jl1 read _Getf write _Setf;
//  end;

//  TJu1 = class(TJavaGenericImport<Ju1Class, Ju1>) end;

//  Ju2_aClass = interface(JObjectClass)
//  ['{BE481529-0418-4B15-BB12-9CF63FF5785E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: JJSONObject; P3: JUserProfileCallback): Ju2_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u2$a')]
//  Ju2_a = interface(JObject)
//  ['{5FC1137F-E3B1-4A43-B88B-CEB95B2B1F6C}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JUserProfileCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JUserProfileCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onSuccess; cdecl;
//    procedure onFail(P1: Integer); cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: JJSONObject read _Getb write _Setb;
//    property c: JUserProfileCallback read _Getc write _Setc;
//  end;

//  TJu2_a = class(TJavaGenericImport<Ju2_aClass, Ju2_a>) end;

//  Ju2Class = interface(JObjectClass)
//  ['{7DC51ECA-0A0B-4211-B9EA-F5A12921CDC4}']
//    { static Property Methods }
//    {class} function _Geta: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: TJavaArray<Int64>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a(P1: Jc0; P2: Integer; P3: JJSONObject; P4: JUserProfileCallback; P5: JHandler; P6: Boolean); cdecl;
//    {class} function init: Ju2; cdecl;
//
//    { static Property }
//    {class} property a: TJavaObjectArray<JString> read _Geta;
//    {class} property b: TJavaObjectArray<JString> read _Getb;
//    {class} property c: TJavaArray<Integer> read _Getc;
//    {class} property d: TJavaArray<Int64> read _Getd;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u2')]
//  Ju2 = interface(JObject)
//  ['{9E83F3AF-3126-44BD-80F2-39B073CE57B5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu2 = class(TJavaGenericImport<Ju2Class, Ju2>) end;

//  Ju3Class = interface(JObjectClass)
//  ['{4F7E1709-D340-4C98-8E31-81DC88CCD7F7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jv3): Ju3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u3')]
//  Ju3 = interface(JObject)
//  ['{27EA4ECB-2167-4FF5-8DE6-C56C8D451EAD}']
//    { Property Methods }
//    function _Geta: Jv3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jv3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jv3 read _Geta write _Seta;
//  end;

//  TJu3 = class(TJavaGenericImport<Ju3Class, Ju3>) end;

//  Ju4Class = interface(JObjectClass)
//  ['{7B38FF9F-D693-46B6-B3EC-926BD6C3FB64}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JString; P3: JBoolean; P4: JLong; P5: JLong; P6: JInteger; P7: JLong): Ju4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u4')]
//  Ju4 = interface(JObject)
//  ['{9FB588C9-EB40-4D7A-8316-013DEC82FCBD}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JBoolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JBoolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JLong;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JLong);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JLong;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JLong);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JInteger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JLong;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JLong);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function toString: JString; cdecl;
//    function a: JMap; cdecl;
//    function b: JJSONObject; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JBoolean read _Getc write _Setc;
//    property d: JLong read _Getd write _Setd;
//    property e: JLong read _Gete write _Sete;
//    property f: JInteger read _Getf write _Setf;
//    property g: JLong read _Getg write _Setg;
//  end;

//  TJu4 = class(TJavaGenericImport<Ju4Class, Ju4>) end;

//  JvClass = interface(JObjectClass)
//  ['{23FEB0E1-63C4-4425-853C-75B374BEC3BC}']
//    { static Property Methods }
//    {class} function _Geta: Ji0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jn3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jn3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jn3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: JHashSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Jv;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jv; cdecl; overload;
//    {class} function a(P1: JApplication): Jv; cdecl; overload;
//    {class} function a: Jn3; cdecl; overload;
//    {class} function a(P1: JClass; P2: Boolean; P3: JString; P4: JString; P5: JString; P6: JString; P7: Int64; P8: JJSONObject): Jn3; cdecl; overload;
//    {class} function a(P1: Boolean; P2: Jn3; P3: Int64): Jn3; cdecl; overload;
//    {class} function init: Jv; cdecl; overload;
//
//    { static Property }
//    {class} property a: Ji0 read _Geta;
//    {class} property b: Boolean read _Getb;
//    {class} property c: Integer read _Getc;
//    {class} property d: Jn3 read _Getd;
//    {class} property e: Jn3 read _Gete;
//    {class} property f: Int64 read _Getf;
//    {class} property g: JString read _Getg;
//    {class} property h: JObject read _Geth;
//    {class} property i: Int64 read _Geti;
//    {class} property j: JMap read _Getj;
//    {class} property k: JList read _Getk;
//    {class} property l: Jn3 read _Getl;
//    {class} property m: JHashSet read _Getm;
//    {class} property n: Jv read _Getn;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v')]
//  Jv = interface(JObject)
//  ['{F35331C6-FA5F-4DC3-B541-0C82F5F98164}']
//    { Property Methods }
//
//    { methods }
//    procedure onActivityResumed(P1: JActivity); cdecl;
//    procedure a(P1: JActivity; P2: Integer); cdecl; overload;
//    procedure onActivityPaused(P1: JActivity); cdecl;
//    procedure onActivityStarted(P1: JActivity); cdecl;
//    procedure onActivityStopped(P1: JActivity); cdecl;
//    procedure onActivitySaveInstanceState(P1: JActivity; P2: JBundle); cdecl;
//    procedure onActivityDestroyed(P1: JActivity); cdecl;
//    procedure onActivityCreated(P1: JActivity; P2: JBundle); cdecl;
//
//    { Property }
//  end;

//  TJv = class(TJavaGenericImport<JvClass, Jv>) end;

//  Jv0Class = interface(JObjectClass)
//  ['{4B173328-C393-4272-A0D3-F89DDA5A3070}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jv0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v0')]
//  Jv0 = interface(JObject)
//  ['{81955D9D-FB3F-4143-8D03-A77437958F59}']
//    { Property Methods }
//    function _Geta: JCopyOnWriteArraySet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JCopyOnWriteArraySet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onEvent(P1: JString; P2: JString; P3: JString; P4: Int64; P5: Int64; P6: JString); cdecl;
//    procedure onEventV3(P1: JString; P2: JJSONObject); cdecl;
//    procedure a(P1: JIEventObserver); cdecl;
//    procedure b(P1: JIEventObserver); cdecl;
//
//    { Property }
//    property a: JCopyOnWriteArraySet read _Geta write _Seta;
//  end;

//  TJv0 = class(TJavaGenericImport<Jv0Class, Jv0>) end;

//  Jv1Class = interface(Jg1Class) // or JObjectClass
//  ['{0EF08BF8-D0E1-47B0-87C8-DB55B63DF36F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext; P3: Jl1): Jv1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v1')]
//  Jv1 = interface(Jg1) // or JObject
//  ['{929A4351-1B39-4BA4-AAAE-19B44BDC59A0}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//    property g: Jl1 read _Getg write _Setg;
//  end;

//  TJv1 = class(TJavaGenericImport<Jv1Class, Jv1>) end;

//  Jv2Class = interface(JObjectClass)
//  ['{61120C4C-21A8-4968-B5BE-1A997D2E79B3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jx2; P2: Integer): Jv2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v2')]
//  Jv2 = interface(JObject)
//  ['{B66752E0-9383-48A1-9D71-82F550C5FFE7}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jx2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jx2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Jx2 read _Getb write _Setb;
//  end;

//  TJv2 = class(TJavaGenericImport<Jv2Class, Jv2>) end;

//  Jv3Class = interface(JObjectClass)
//  ['{11FC312E-11A1-4B92-9BA8-1ADEA8AC327C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jv3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v3')]
//  Jv3 = interface(JObject)
//  ['{077390EC-E91D-4F90-8A21-AE245EEA114A}']
//    { Property Methods }
//    function _Geta: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JString; P2: JString); cdecl;
//
//    { Property }
//    property a: JArrayList read _Geta write _Seta;
//  end;

//  TJv3 = class(TJavaGenericImport<Jv3Class, Jv3>) end;

//  Jv4Class = interface(JObjectClass)
//  ['{1547BE34-0FF9-43E6-B4DB-5A1DE69CBDAF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jv4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v4')]
//  Jv4 = interface(JObject)
//  ['{46CD254A-1F6F-42E5-804A-7F31D7A36676}']
//    { Property Methods }
//    function _Geta: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Ju4); cdecl; overload;
//    function a: Ju4; cdecl; overload;
//
//    { Property }
//    property a: JSharedPreferences read _Geta write _Seta;
//  end;

//  TJv4 = class(TJavaGenericImport<Jv4Class, Jv4>) end;

//  Jw_aClass = interface(JObjectClass)
//  ['{FE205222-4DCD-45DC-B106-743F1F6B5737}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w$a')]
//  Jw_a = interface(JObject)
//  ['{30525077-BA2A-4C0B-8CCE-5988F0CF8335}']
//    { Property Methods }
//
//    { methods }
//    procedure rejectedExecution(P1: JRunnable; P2: JThreadPoolExecutor); cdecl;
//
//    { Property }
//  end;

//  TJw_a = class(TJavaGenericImport<Jw_aClass, Jw_a>) end;

//  Jw_bClass = interface(JObjectClass)
//  ['{24F8370D-9A9F-4C23-8F34-31B559959F26}']
//    { static Property Methods }
//    {class} function _Getd: JAtomicInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JString): Jw_b; cdecl; overload;
//    {class} function init: Jw_b; cdecl; overload;
//
//    { static Property }
//    {class} property d: JAtomicInteger read _Getd;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w$b')]
//  Jw_b = interface(JObject)
//  ['{9A066D74-DF12-46B7-8DDD-236CD4F580B8}']
//    { Property Methods }
//    function _Geta: JThreadGroup;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JThreadGroup);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JAtomicInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JAtomicInteger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function newThread(P1: JRunnable): JThread; cdecl;
//
//    { Property }
//    property a: JThreadGroup read _Geta write _Seta;
//    property b: JAtomicInteger read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//  end;

//  TJw_b = class(TJavaGenericImport<Jw_bClass, Jw_b>) end;

//  JwClass = interface(JObjectClass)
//  ['{33B93EC2-449B-4DE5-9026-486F52174A7B}']
//    { static Property Methods }
//    {class} function _Geta: JExecutorService;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: JBlockingQueue;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jw_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: JRejectedExecutionHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jw; cdecl;
//
//    { static Property }
//    {class} property a: JExecutorService read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: Integer read _Getc;
//    {class} property d: Integer read _Getd;
//    {class} property e: Integer read _Gete;
//    {class} property f: JBlockingQueue read _Getf;
//    {class} property g: Jw_b read _Getg;
//    {class} property h: JRejectedExecutionHandler read _Geth;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w')]
//  Jw = interface(JObject)
//  ['{E4F62C35-6103-464A-AD5A-8A689EB2DAB4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw = class(TJavaGenericImport<JwClass, Jw>) end;

//  Jw0Class = interface(JObjectClass)
//  ['{DA8D5E1C-54A7-4A76-80AC-ACED8815CEDD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w0')]
//  Jw0 = interface(JObject)
//  ['{0097BAD0-59F0-4745-A607-01DB15B2AB37}']
//    { Property Methods }
//    function _Geta: JCopyOnWriteArraySet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JCopyOnWriteArraySet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onSessionStart(P1: Int64; P2: JString); cdecl;
//    procedure onSessionTerminate(P1: Int64; P2: JString; P3: JJSONObject); cdecl;
//    procedure onSessionBatchEvent(P1: Int64; P2: JString; P3: JJSONObject); cdecl;
//    procedure a(P1: JISessionObserver); cdecl;
//    procedure b(P1: JISessionObserver); cdecl;
//
//    { Property }
//    property a: JCopyOnWriteArraySet read _Geta write _Seta;
//  end;

//  TJw0 = class(TJavaGenericImport<Jw0Class, Jw0>) end;

//  Jw1Class = interface(Jg1Class) // or JObjectClass
//  ['{ACB07B0D-ACEB-4D06-ACAC-321F6E5D9BFC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w1')]
//  Jw1 = interface(Jg1) // or JObject
//  ['{9728C70D-614F-4C34-A7C4-53FE6B555105}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//  end;

//  TJw1 = class(TJavaGenericImport<Jw1Class, Jw1>) end;

//  Jw2Class = interface(JObjectClass)
//  ['{DEDB5D91-BAC0-4E23-A66A-62437B12D05A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jx2): Jw2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w2')]
//  Jw2 = interface(JObject)
//  ['{0A5C7F3E-0189-4090-B0EF-821A779C13DF}']
//    { Property Methods }
//    function _Geta: Jx2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jx2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jx2 read _Geta write _Seta;
//  end;

//  TJw2 = class(TJavaGenericImport<Jw2Class, Jw2>) end;

//  Jw3Class = interface(JObjectClass)
//  ['{B3004591-E367-4AF6-9C0D-B6524D32ABAF}']
//    { static Property Methods }
//    {class} function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: JJSONArray;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext; P3: Jl1; P4: Jc3): Jw3; cdecl;
//
//    { static Property }
//    {class} property h: JString read _Geth;
//    {class} property i: JString read _Geti;
//    {class} property j: JString read _Getj;
//    {class} property k: JJSONArray read _Getk;
//    {class} property l: JString read _Getl;
//    {class} property m: TJavaObjectArray<JString> read _Getm;
//    {class} property n: JString read _Getn;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w3')]
//  Jw3 = interface(JObject)
//  ['{DF62E4B8-A809-42C3-8DBD-59321D87A34F}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jc3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jc3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function c: JString; cdecl;
//    function a: JString; cdecl; overload;
//    function d: JString; cdecl;
//    function e: TJavaObjectArray<JString>; cdecl;
//    function f: JString; cdecl;
//    function g: JJSONArray; cdecl;
//    function b: JString; cdecl; overload;
//    procedure b(P1: JString); cdecl; overload;
//    procedure a(P1: JAccount); cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//    property b: Je3 read _Getb write _Setb;
//    property c: Jc3 read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: Jd read _Gete write _Sete;
//    property f: Jl1 read _Getf write _Setf;
//    property g: JList read _Getg write _Setg;
//  end;

//  TJw3 = class(TJavaGenericImport<Jw3Class, Jw3>) end;

//  Jw4Class = interface(JObjectClass)
//  ['{F561A69C-025E-44AB-A361-F81C8CDC267B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w4')]
//  Jw4 = interface(IJavaInstance)
//  ['{A5CD0320-BFEA-46FC-A5AA-E003AADEB1D0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw4 = class(TJavaGenericImport<Jw4Class, Jw4>) end;

//  JxClass = interface(JThreadPoolExecutorClass) // or JObjectClass
//  ['{5740320B-1C89-4A1D-BA4E-99A42855163B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: Int64; P4: JTimeUnit; P5: JBlockingQueue; P6: JThreadFactory; P7: JRejectedExecutionHandler): Jx; cdecl; overload;
//    {class} function init: Jx; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x')]
//  Jx = interface(JThreadPoolExecutor) // or JObject
//  ['{59BAF800-E44B-4BA9-B9EB-62E1242F0836}']
//    { Property Methods }
//
//    { methods }
//    function shutdownNow: JList; cdecl;
//    procedure shutdown; cdecl;
//
//    { Property }
//  end;

//  TJx = class(TJavaGenericImport<JxClass, Jx>) end;

//  Jx0Class = interface(JObjectClass)
//  ['{97FA4D59-F798-4096-B10C-D23DBC16406B}']
//    { static Property Methods }
//    {class} function _Geta: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JContext): JString; cdecl;
//    {class} function init: Jx0; cdecl;
//
//    { static Property }
//    {class} property a: TJavaObjectArray<JString> read _Geta;
//    {class} property b: Boolean read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x0')]
//  Jx0 = interface(JObject)
//  ['{90377C4A-8F6D-474B-A251-F5B0A215D401}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJx0 = class(TJavaGenericImport<Jx0Class, Jx0>) end;

//  Jx1Class = interface(Jg1Class) // or JObjectClass
//  ['{1449871D-829C-455B-9819-84CE36059206}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Jl1; P3: Jn1; P4: JISensitiveInfoProvider): Jx1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x1')]
//  Jx1 = interface(Jg1) // or JObject
//  ['{FC6CF32C-C529-4661-977F-7EBCC7FC15C4}']
//    { Property Methods }
//    function _Gete: JISensitiveInfoProvider;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JISensitiveInfoProvider);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Jn1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Jn1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JISensitiveInfoProvider read _Gete write _Sete;
//    property f: JContext read _Getf write _Setf;
//    property g: Jl1 read _Getg write _Setg;
//    property h: Jn1 read _Geth write _Seth;
//  end;

//  TJx1 = class(TJavaGenericImport<Jx1Class, Jx1>) end;

//  Jx2Class = interface(JObjectClass)
//  ['{1B60605A-B52B-4C30-915C-3F8B8B89C05F}']
//    { static Property Methods }
//    {class} function _Getg: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JString; P3: JString; P4: JJSONObject; P5: JUserProfileCallback; P6: JContext): Jx2; cdecl; overload;
//    {class} function init: Jx2; cdecl; overload;
//
//    { static Property }
//    {class} property g: JHandler read _Getg;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x2')]
//  Jx2 = interface(JObject)
//  ['{421579A1-C46C-4ED1-A2A9-6855671DEEBB}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JUserProfileCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JUserProfileCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JJSONObject read _Getc write _Setc;
//    property d: JUserProfileCallback read _Getd write _Setd;
//    property e: JContext read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//  end;

//  TJx2 = class(TJavaGenericImport<Jx2Class, Jx2>) end;

//  Jx3Class = interface(JObjectClass)
//  ['{77187B62-212A-422C-BAF5-708387A67A09}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Char>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function b(P1: TJavaArray<Byte>): JString; cdecl;
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl;
//    {class} function init: Jx3; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Char> read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x3')]
//  Jx3 = interface(JObject)
//  ['{7AF3FC85-3C24-4BDC-AAC1-7C29BFE3A2C6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJx3 = class(TJavaGenericImport<Jx3Class, Jx3>) end;

//  Jx4_aClass = interface(JObjectClass)
//  ['{80BF60E9-CA6B-441F-AAF5-948A3F1FF034}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jx4; P2: JCountDownLatch; P3: Jx4_b): Jx4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x4$a')]
//  Jx4_a = interface(JObject)
//  ['{B558EA80-5B5E-4813-AF3C-D71F79C3E760}']
//    { Property Methods }
//    function _Geta: JCountDownLatch;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JCountDownLatch);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jx4_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jx4_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onServiceConnected(P1: JComponentName; P2: JIBinder); cdecl;
//    procedure onServiceDisconnected(P1: JComponentName); cdecl;
//    procedure onBindingDied(P1: JComponentName); cdecl;
//    procedure onNullBinding(P1: JComponentName); cdecl;
//
//    { Property }
//    property a: JCountDownLatch read _Geta write _Seta;
//    property b: Jx4_b read _Getb write _Setb;
//    property c: JObject read _Getc write _Setc;
//  end;

//  TJx4_a = class(TJavaGenericImport<Jx4_aClass, Jx4_a>) end;

//  Jx4_bClass = interface(JObjectClass)
//  ['{0828FD23-CC9B-4CC7-971B-6AF6D2E3035B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x4$b')]
//  Jx4_b = interface(IJavaInstance)
//  ['{A9340F8F-C898-4DA8-A6FA-A0615D2B8C3F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JIBinder): JObject; cdecl; overload;
//    function a(P1: JObject): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJx4_b = class(TJavaGenericImport<Jx4_bClass, Jx4_b>) end;

//  Jx4Class = interface(JObjectClass)
//  ['{177C6600-2484-4126-98B5-DF909D098BF1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JIntent; P3: Jx4_b): Jx4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x4')]
//  Jx4 = interface(JObject)
//  ['{A2988579-0B6F-49FC-A9F8-789578AAE9B6}']
//    { Property Methods }
//    function _Geta: JCountDownLatch;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JCountDownLatch);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JIntent;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JIntent);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jx4_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jx4_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JObject; cdecl; overload;
//    procedure a(P1: Jx4_a); cdecl; overload;
//
//    { Property }
//    property a: JCountDownLatch read _Geta write _Seta;
//    property b: JIntent read _Getb write _Setb;
//    property c: Jx4_b read _Getc write _Setc;
//    property d: JContext read _Getd write _Setd;
//  end;

//  TJx4 = class(TJavaGenericImport<Jx4Class, Jx4>) end;

//  JyClass = interface(Ja0Class) // or JObjectClass
//  ['{BF51526A-F79E-41C8-AFF9-6D8123843DC5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jy; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y')]
//  Jy = interface(Ja0) // or JObject
//  ['{6A31F66D-8361-466E-ADFC-FF03DDAA034D}']
//    { Property Methods }
//    function _Getg: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function f: Boolean; cdecl;
//    function g: Int64; cdecl;
//    function e: TJavaArray<Int64>; cdecl;
//    function c: Boolean; cdecl;
//    function d: JString; cdecl;
//    function a(P1: Integer): JJSONObject; cdecl;
//
//    { Property }
//    property g: Int64 read _Getg write _Setg;
//    property h: JJSONObject read _Geth write _Seth;
//  end;

//  TJy = class(TJavaGenericImport<JyClass, Jy>) end;

//  Jy0Class = interface(JObjectClass)
//  ['{A1F6B661-3BBF-4937-9B78-E708A9CE0EDD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JObject; P2: JObject): Jy0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y0')]
//  Jy0 = interface(JObject)
//  ['{C4DEAE40-F5DF-4E82-ACD4-F537000E9182}']
//    { Property Methods }
//    function _Geta: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function hashCode: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//
//    { Property }
//    property a: JObject read _Geta write _Seta;
//    property b: JObject read _Getb write _Setb;
//  end;

//  TJy0 = class(TJavaGenericImport<Jy0Class, Jy0>) end;

//  Jy1Class = interface(Jg1Class) // or JObjectClass
//  ['{454F7A04-CF50-4BC0-A2DF-01B1E65A4985}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Jl1; P3: Jn1): Jy1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y1')]
//  Jy1 = interface(Jg1) // or JObject
//  ['{A763C6A7-D909-46CD-968B-DD91DEBA06BA}']
//    { Property Methods }
//    function _Gete: Jl1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jl1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: Jl1 read _Gete write _Sete;
//  end;

//  TJy1 = class(TJavaGenericImport<Jy1Class, Jy1>) end;

//  Jy2_aClass = interface(JObjectClass)
//  ['{5F212EE4-2A5D-487C-AD97-4754D4D7FB46}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jy2; P2: JJSONObject): Jy2_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y2$a')]
//  Jy2_a = interface(JObject)
//  ['{7581971A-1DFD-4399-AEE1-9DD5AB40B814}']
//    { Property Methods }
//    function _Geta: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jy2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JJSONObject read _Geta write _Seta;
//    property b: Jy2 read _Getb write _Setb;
//  end;

//  TJy2_a = class(TJavaGenericImport<Jy2_aClass, Jy2_a>) end;

//  Jy2_bClass = interface(JObjectClass)
//  ['{783633DF-7F2A-43F8-BC75-BE53D74510B0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jy2; P2: JString; P3: Integer; P4: TJavaArray<Byte>; P5: JString; P6: Int64; P7: JJSONObject): Jy2_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y2$b')]
//  Jy2_b = interface(JObject)
//  ['{B20DD640-3A6B-4FF3-BB5F-966A05FEE2AD}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jy2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: TJavaArray<Byte> read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: Int64 read _Gete write _Sete;
//    property f: JJSONObject read _Getf write _Setf;
//    property g: Jy2 read _Getg write _Setg;
//  end;

//  TJy2_b = class(TJavaGenericImport<Jy2_bClass, Jy2_b>) end;

//  Jy2Class = interface(JObjectClass)
//  ['{1A2E28BC-E44F-40AD-9A97-92F41F18DADB}']
//    { static Property Methods }
//    {class} function _Getd: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd): Jy2; cdecl;
//    {class} function a(P1: JString; P2: TJavaObjectArray<JString>): JString; cdecl; overload;
//    {class} procedure a(P1: JStringBuilder; P2: JString; P3: JString); cdecl; overload;
//    {class} function a(P1: JString; P2: JString): JJSONObject; cdecl; overload;
//    {class} function b(P1: JJSONObject): JJSONObject; cdecl; overload;
//
//    { static Property }
//    {class} property d: JJSONObject read _Getd;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y2')]
//  Jy2 = interface(JObject)
//  ['{1C6E15D2-6804-455E-8E00-79B491D6A147}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jy3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jy3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject; P2: JString): Boolean; cdecl; overload;
//    function a(P1: TJavaObjectArray<JString>; P2: JJSONObject; P3: Jl1): Integer; cdecl; overload;
//    function a(P1: JString; P2: JJSONObject): JJSONObject; cdecl; overload;
//    function b(P1: JString; P2: JJSONObject): JJSONObject; cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function a: JHashMap; cdecl; overload;
//    function a(P1: JString): JJSONObject; cdecl; overload;
//    procedure a(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: JString; P5: Int64; P6: JJSONObject); cdecl; overload;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Jd read _Getb write _Setb;
//    property c: Jy3 read _Getc write _Setc;
//  end;

//  TJy2 = class(TJavaGenericImport<Jy2Class, Jy2>) end;

//  Jy3Class = interface(JObjectClass)
//  ['{77CF3CFB-FEBA-4565-9352-0572C2679DF5}']
//    { static Property Methods }
//    {class} function _Getb: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd): Jy3; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function a: TJavaObjectArray<JString>; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: JString; P3: JString): TJavaArray<Byte>; cdecl; overload;
//    {class} function b(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    {class} function init: Jy3; cdecl; overload;
//
//    { static Property }
//    {class} property b: TJavaObjectArray<JString> read _Getb;
//    {class} property c: TJavaObjectArray<JString> read _Getc;
//    {class} property d: TJavaObjectArray<JString> read _Getd;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y3')]
//  Jy3 = interface(JObject)
//  ['{396D0B52-1A1F-4ECC-A359-E7E13B6F6254}']
//    { Property Methods }
//    function _Geta: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JString): JString; cdecl; overload;
//    function b(P1: JString): TJavaArray<Byte>; cdecl; overload;
//
//    { Property }
//    property a: Jd read _Geta write _Seta;
//  end;

//  TJy3 = class(TJavaGenericImport<Jy3Class, Jy3>) end;

//  JzClass = interface(Ja0Class) // or JObjectClass
//  ['{74AE919A-2D1B-4EAD-8A76-644B11B7C9ED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jz; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z')]
//  Jz = interface(Ja0) // or JObject
//  ['{8D3B234C-0CF1-46D2-A4CD-F5C0CDC6CD64}']
//    { Property Methods }
//
//    { methods }
//    function f: Boolean; cdecl;
//    function g: Int64; cdecl;
//    function e: TJavaArray<Int64>; cdecl;
//    function c: Boolean; cdecl;
//    function d: JString; cdecl;
//
//    { Property }
//  end;

//  TJz = class(TJavaGenericImport<JzClass, Jz>) end;

//  Jz0Class = interface(JExceptionClass) // or JObjectClass
//  ['{4F07B3CE-0F8B-4748-8153-AFABF21A6C32}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Jz0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z0')]
//  Jz0 = interface(JException) // or JObject
//  ['{AEA881A0-7CF4-47D3-9146-256BF2D15865}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz0 = class(TJavaGenericImport<Jz0Class, Jz0>) end;

//  Jz1Class = interface(Jg1Class) // or JObjectClass
//  ['{F1F6EA61-0E53-463A-9DB5-4C00E848BBF9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext): Jz1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z1')]
//  Jz1 = interface(Jg1) // or JObject
//  ['{96611984-2C14-499D-89F2-CA3BAD8909C8}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//  end;

//  TJz1 = class(TJavaGenericImport<Jz1Class, Jz1>) end;

//  Jz2Class = interface(JObjectClass)
//  ['{29F35B84-7F58-441B-B2C5-8090622F4926}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jy2; P2: JString; P3: JString; P4: JJSONObject; P5: JJSONObject; P6: Byte; P7: Int64): Jz2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z2')]
//  Jz2 = interface(JObject)
//  ['{5ADDA423-51C0-4B52-A65F-B699F3E0F738}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jy2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: JJSONObject read _Getc write _Setc;
//    property d: JJSONObject read _Getd write _Setd;
//    property e: Byte read _Gete write _Sete;
//    property f: Int64 read _Getf write _Setf;
//    property g: Jy2 read _Getg write _Setg;
//  end;

//  TJz2 = class(TJavaGenericImport<Jz2Class, Jz2>) end;

//  Jz3Class = interface(JObjectClass)
//  ['{35DFC31D-DD14-4C4F-921A-C3F5F4EA3B15}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jz3; cdecl;
//    {class} function a(P1: JContext; P2: Jl1): JString; cdecl;
//
//    { static Property }
//    {class} property a: JString read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z3')]
//  Jz3 = interface(JObject)
//  ['{2F19F8DD-2590-4EF7-8007-A1E4095B1635}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz3 = class(TJavaGenericImport<Jz3Class, Jz3>) end;

//  Ja_a_aClass = interface(JObjectClass)
//  ['{C39BF939-99E3-403A-9A2B-06BC0015E5DE}']
//    { static Property Methods }
//    {class} function _Getb: Ja;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Ja_a_a; cdecl;
//
//    { static Property }
//    {class} property b: Ja read _Getb;
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/a$a$a')]
//  Ja_a_a = interface(JObject)
//  ['{8C64113C-6842-4AF7-BF11-882750275132}']
//    { Property Methods }
//    function _Geta: JIBinder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIBinder);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//    function a(P1: JString): JString; cdecl;
//
//    { Property }
//    property a: JIBinder read _Geta write _Seta;
//  end;

//  TJa_a_a = class(TJavaGenericImport<Ja_a_aClass, Ja_a_a>) end;

//  Ja_aClass = interface(JBinderClass) // or JObjectClass
//  ['{7BBA78CC-FD86-4C56-A329-6362AC8DC174}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Ja; cdecl; overload;
//    {class} function a: Ja; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/a$a')]
//  Ja_a = interface(JBinder) // or JObject
//  ['{FBA9DDB8-AE46-4F58-94FA-CF968ACCD699}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  Ja_293Class = interface(JObjectClass)
//  ['{77AC2895-5C8A-4F39-99F9-EE4DE066EC97}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/a')]
//  Ja_293 = interface(IJavaInstance)
//  ['{0BA25155-2DA0-4FC2-90E6-51510D92ABCC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_293 = class(TJavaGenericImport<Ja_293Class, Ja_293>) end;

//  Jb_a_aClass = interface(JObjectClass)
//  ['{71A9310A-6AAC-4332-8296-EEF47AAA0FCA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Jb_a_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/b$a$a')]
//  Jb_a_a = interface(JObject)
//  ['{62335281-DBA1-4661-866D-B43EFCBA6A3B}']
//    { Property Methods }
//    function _Geta: JIBinder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIBinder);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//    function a: JString; cdecl;
//
//    { Property }
//    property a: JIBinder read _Geta write _Seta;
//  end;

//  TJb_a_a = class(TJavaGenericImport<Jb_a_aClass, Jb_a_a>) end;

//  Jb_a_295Class = interface(JBinderClass) // or JObjectClass
//  ['{FEEBC8E6-1188-4059-8960-B32CABE1101F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Jb; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/b$a')]
//  Jb_a_295 = interface(JBinder) // or JObject
//  ['{EAD45148-0F7B-4B6B-B94E-0A9C5F71D6E2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_a_295 = class(TJavaGenericImport<Jb_a_295Class, Jb_a_295>) end;

//  Jb_296Class = interface(JObjectClass)
//  ['{E2813943-E5EA-48C3-93C9-96641DD49F3E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/b')]
//  Jb_296 = interface(IJavaInstance)
//  ['{2850AFE7-06D6-4DA9-85DC-5362169DA0DB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_296 = class(TJavaGenericImport<Jb_296Class, Jb_296>) end;

//  Jc_a_aClass = interface(JObjectClass)
//  ['{6F99F54C-A7DD-40F3-AB25-5F2F52CEC1AB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Jc_a_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/c$a$a')]
//  Jc_a_a = interface(JObject)
//  ['{3193815B-D547-4052-A17E-8620E41023C8}']
//    { Property Methods }
//    function _Geta: JIBinder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIBinder);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//
//    { Property }
//    property a: JIBinder read _Geta write _Seta;
//  end;

//  TJc_a_a = class(TJavaGenericImport<Jc_a_aClass, Jc_a_a>) end;

//  Jc_a_298Class = interface(JBinderClass) // or JObjectClass
//  ['{8289F783-6EEA-4BBD-A4EE-AEA261A208E7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Jc; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/c$a')]
//  Jc_a_298 = interface(JBinder) // or JObject
//  ['{133F881A-7A4B-47D2-9B3F-0D8A1DAFC557}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_a_298 = class(TJavaGenericImport<Jc_a_298Class, Jc_a_298>) end;

//  Jc_299Class = interface(JObjectClass)
//  ['{C8AD692D-4458-4BEB-9254-A086310C0792}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/c')]
//  Jc_299 = interface(IJavaInstance)
//  ['{B6FE2691-7151-43BD-B694-5890F5F04AEA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_299 = class(TJavaGenericImport<Jc_299Class, Jc_299>) end;

//  Jd_a_aClass = interface(JObjectClass)
//  ['{F642A479-2B38-4337-A8EB-9589D5E3A7A4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Jd_a_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/d$a$a')]
//  Jd_a_a = interface(JObject)
//  ['{6CAC8F36-950D-4761-B5ED-322F41EC562C}']
//    { Property Methods }
//    function _Geta: JIBinder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIBinder);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//
//    { Property }
//    property a: JIBinder read _Geta write _Seta;
//  end;

//  TJd_a_a = class(TJavaGenericImport<Jd_a_aClass, Jd_a_a>) end;

//  Jd_a_301Class = interface(JBinderClass) // or JObjectClass
//  ['{F6FB21F9-0C6F-4084-A2F4-D3B360613A98}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Jd; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/d$a')]
//  Jd_a_301 = interface(JBinder) // or JObject
//  ['{88B4C51A-D3B3-4A65-BE27-AACFB506F99A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_a_301 = class(TJavaGenericImport<Jd_a_301Class, Jd_a_301>) end;

//  Jd_302Class = interface(JObjectClass)
//  ['{946020B7-8755-4B03-84AE-BFF9A1660527}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/d')]
//  Jd_302 = interface(IJavaInstance)
//  ['{B0E087FC-EB3E-48F2-A03F-29982480ADD7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_302 = class(TJavaGenericImport<Jd_302Class, Jd_302>) end;

//  Je_a_aClass = interface(JObjectClass)
//  ['{7D68B2D8-4693-425E-BE27-44313B0D03AB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Je_a_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/e$a$a')]
//  Je_a_a = interface(JObject)
//  ['{F554DD25-62FB-4567-9366-794D9DD0F7C3}']
//    { Property Methods }
//    function _Geta: JIBinder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIBinder);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//
//    { Property }
//    property a: JIBinder read _Geta write _Seta;
//  end;

//  TJe_a_a = class(TJavaGenericImport<Je_a_aClass, Je_a_a>) end;

//  Je_aClass = interface(JBinderClass) // or JObjectClass
//  ['{F9CEDB78-C148-4C3A-905E-9627A4D8306E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Je; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/e$a')]
//  Je_a = interface(JBinder) // or JObject
//  ['{666DA090-4AF5-4864-B699-E98A98E80479}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

//  Je_305Class = interface(JObjectClass)
//  ['{6B6183DD-8432-4172-9D94-B186B20B8830}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/e')]
//  Je_305 = interface(IJavaInstance)
//  ['{0797D64A-ADBF-46CC-86A0-D6073936A82F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_305 = class(TJavaGenericImport<Je_305Class, Je_305>) end;

//  Jf_a_aClass = interface(JObjectClass)
//  ['{D458CDDE-9300-4A17-BEEC-445AECFF9948}']
//    { static Property Methods }
//    {class} function _Getb: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Jf_a_a; cdecl;
//
//    { static Property }
//    {class} property b: Jf read _Getb;
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/f$a$a')]
//  Jf_a_a = interface(JObject)
//  ['{4C178E1F-C89F-439D-8509-852F292FC3DC}']
//    { Property Methods }
//    function _Geta: JIBinder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIBinder);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//    function a: JString; cdecl;
//
//    { Property }
//    property a: JIBinder read _Geta write _Seta;
//  end;

//  TJf_a_a = class(TJavaGenericImport<Jf_a_aClass, Jf_a_a>) end;

//  Jf_aClass = interface(JBinderClass) // or JObjectClass
//  ['{327AEAFE-61EE-44D4-B845-EFC8F98EEFC8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Jf; cdecl; overload;
//    {class} function a: Jf; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/f$a')]
//  Jf_a = interface(JBinder) // or JObject
//  ['{33B8D702-C13E-4B6C-8815-BD7681953F31}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_a = class(TJavaGenericImport<Jf_aClass, Jf_a>) end;

//  Jf_308Class = interface(JObjectClass)
//  ['{C153B8C2-7900-4638-83F2-DD7610DC28F7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/f')]
//  Jf_308 = interface(IJavaInstance)
//  ['{0BE677C0-A92E-45F9-9BDF-45DFBF2DB0A1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_308 = class(TJavaGenericImport<Jf_308Class, Jf_308>) end;

//  Jg_a_aClass = interface(JObjectClass)
//  ['{FBBE7BA0-9395-4996-A9C0-7B0EC3931004}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Jg_a_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/g$a$a')]
//  Jg_a_a = interface(JObject)
//  ['{23318351-0ECE-4895-B3D3-33C4AD866CA0}']
//    { Property Methods }
//    function _Geta: JIBinder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JIBinder);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//
//    { Property }
//    property a: JIBinder read _Geta write _Seta;
//  end;

//  TJg_a_a = class(TJavaGenericImport<Jg_a_aClass, Jg_a_a>) end;

//  Jg_aClass = interface(JBinderClass) // or JObjectClass
//  ['{8B46A850-3B5E-45BA-A9E0-75AD13771763}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Jg; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/g$a')]
//  Jg_a = interface(JBinder) // or JObject
//  ['{6BC404A2-2048-4756-A47C-48EC4DBDB265}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg_a = class(TJavaGenericImport<Jg_aClass, Jg_a>) end;

//  Jg_311Class = interface(JObjectClass)
//  ['{17A15EA6-1DBD-478F-B8EF-4A6714CDCC52}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/g')]
//  Jg_311 = interface(IJavaInstance)
//  ['{D119BEBA-3226-4FE9-88F4-E96B2D362379}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg_311 = class(TJavaGenericImport<Jg_311Class, Jg_311>) end;

//  Ja_a_312Class = interface(JObjectClass)
//  ['{5F5DA161-1455-41DD-9FA5-E71FEDA0A049}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja): Ja_a_312; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/a$a')]
//  Ja_a_312 = interface(JObject)
//  ['{662AFD58-42DB-44E7-A406-A44F34924308}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJa_a_312 = class(TJavaGenericImport<Ja_a_312Class, Ja_a_312>) end;

//  Ja_313Class = interface(Jb_315Class) // or JObjectClass
//  ['{D014E3E1-5710-4047-B1DB-80CC66B71308}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_313; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/a')]
//  Ja_313 = interface(Jb_315) // or JObject
//  ['{808AE4AC-A918-402C-9AD7-A0AB23AF7556}']
//    { Property Methods }
//
//    { methods }
//    function a: Jx4_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJa_313 = class(TJavaGenericImport<Ja_313Class, Ja_313>) end;

//  Jb_a_314Class = interface(Jp4Class) // or JObjectClass
//  ['{87B3C52F-D316-45F1-A8CE-47B365D9AE3F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb): Jb_a_314; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/b$a')]
//  Jb_a_314 = interface(Jp4) // or JObject
//  ['{253EAD34-9519-405C-9883-5BBCFC5883A8}']
//    { Property Methods }
//    function _Getb: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jb);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//    property b: Jb read _Getb write _Setb;
//  end;

//  TJb_a_314 = class(TJavaGenericImport<Jb_a_314Class, Jb_a_314>) end;

//  Jb_315Class = interface(JObjectClass)
//  ['{75CE2A53-3ECB-429A-A4A4-14A9BE8468AA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Jb_315; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/b')]
//  Jb_315 = interface(JObject)
//  ['{37B06EEB-49F2-44AE-9EA5-693B467786E3}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jp4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jp4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function a: Jx4_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Jp4 read _Getb write _Setb;
//  end;

//  TJb_315 = class(TJavaGenericImport<Jb_315Class, Jb_315>) end;

//  Jc_a_316Class = interface(JObjectClass)
//  ['{CDCB5A62-5C1A-425A-A67B-EB39A021BDAD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc): Jc_a_316; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/c$a')]
//  Jc_a_316 = interface(JObject)
//  ['{D884D626-1D9A-4058-B6A8-96C8B261A4EB}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJc_a_316 = class(TJavaGenericImport<Jc_a_316Class, Jc_a_316>) end;

//  Jc_317Class = interface(Jb_315Class) // or JObjectClass
//  ['{1BE3A483-AB6D-4BDF-A23D-AD04EA8F8849}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_317; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/c')]
//  Jc_317 = interface(Jb_315) // or JObject
//  ['{97608BD6-12D9-482B-8D0A-B144C1C6964D}']
//    { Property Methods }
//
//    { methods }
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//    function a: Jx4_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//
//    { Property }
//  end;

//  TJc_317 = class(TJavaGenericImport<Jc_317Class, Jc_317>) end;

//  Jd_a_318Class = interface(JObjectClass)
//  ['{95335615-24D0-4426-98FB-916F4AB1834E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Jd_a_318; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/d$a')]
//  Jd_a_318 = interface(JObject)
//  ['{734997FE-58E3-4D25-97EF-90D359811F56}']
//    { Property Methods }
//    function _Geta: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//    property a: Jd read _Geta write _Seta;
//  end;

//  TJd_a_318 = class(TJavaGenericImport<Jd_a_318Class, Jd_a_318>) end;

//  Jd_319Class = interface(Jb_315Class) // or JObjectClass
//  ['{34FE9200-C25E-4688-9151-EE98BAB0C92D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jd_319; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/d')]
//  Jd_319 = interface(Jb_315) // or JObject
//  ['{E2026DE0-66E6-4F99-8130-ACA910660032}']
//    { Property Methods }
//    function _Getc: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Jx4_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//
//    { Property }
//    property c: JContext read _Getc write _Setc;
//  end;

//  TJd_319 = class(TJavaGenericImport<Jd_319Class, Jd_319>) end;

//  Je_a_320Class = interface(Jp4Class) // or JObjectClass
//  ['{2B2A1A3E-124C-47CF-A0C5-A810BBC3F7E5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_a_320; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/e$a')]
//  Je_a_320 = interface(Jp4) // or JObject
//  ['{4B8AA6AA-79F1-4768-9B65-D9CA9B2B062D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJe_a_320 = class(TJavaGenericImport<Je_a_320Class, Je_a_320>) end;

//  Je_bClass = interface(JOaidApi_aClass) // or JObjectClass
//  ['{BBC18BD0-3618-4C33-8B5C-1D0051E5D492}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/e$b')]
//  Je_b = interface(JOaidApi_a) // or JObject
//  ['{8B089393-572E-4B3D-9B64-410CBC72D344}']
//    { Property Methods }
//    function _Getc: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property c: Int64 read _Getc write _Setc;
//  end;

//  TJe_b = class(TJavaGenericImport<Je_bClass, Je_b>) end;

//  Je_322Class = interface(JObjectClass)
//  ['{178EE626-04C1-4F88-BA19-55300E1BB0EF}']
//    { static Property Methods }
//    {class} function _Getb: Jp4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Je_322; cdecl; overload;
//    {class} function a(P1: JContext): Boolean; cdecl;
//    {class} function init: Je_322; cdecl; overload;
//
//    { static Property }
//    {class} property b: Jp4 read _Getb;
//  end;

//  [JavaSignature('com/bytedance/dr/impl/e')]
//  Je_322 = interface(JObject)
//  ['{874C699E-6B68-426A-A293-C3FDAA28A811}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getName: JString; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//  end;

//  TJe_322 = class(TJavaGenericImport<Je_322Class, Je_322>) end;

//  Jf_323Class = interface(JObjectClass)
//  ['{4CFD6710-E611-4740-A86C-87947946563C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je): Jf_323; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/f')]
//  Jf_323 = interface(JObject)
//  ['{564CE265-8BDC-4269-8CDE-0D59DF5193C1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJf_323 = class(TJavaGenericImport<Jf_323Class, Jf_323>) end;

//  Jg_a_324Class = interface(JObjectClass)
//  ['{6E7AA8B1-527D-4E18-B693-09F7F123868A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jg): Jg_a_324; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/g$a')]
//  Jg_a_324 = interface(JObject)
//  ['{36D8C66B-747F-42CB-AFA3-C6DB5367DF4E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJg_a_324 = class(TJavaGenericImport<Jg_a_324Class, Jg_a_324>) end;

//  Jg_325Class = interface(Jb_315Class) // or JObjectClass
//  ['{D72BD523-AD47-4437-9DD9-F7A1409B5A84}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg_325; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/g')]
//  Jg_325 = interface(Jb_315) // or JObject
//  ['{CD6E6B08-21C9-47F5-A770-822F0B72B8E6}']
//    { Property Methods }
//
//    { methods }
//    function a: Jx4_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJg_325 = class(TJavaGenericImport<Jg_325Class, Jg_325>) end;

//  Jh_aClass = interface(Jp4Class) // or JObjectClass
//  ['{D4012125-7774-4BFC-B05B-A1F1DAA280FC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jh): Jh_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/h$a')]
//  Jh_a = interface(Jp4) // or JObject
//  ['{81044582-325B-4F5E-A2E0-A7B5E0DCD38E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJh_a = class(TJavaGenericImport<Jh_aClass, Jh_a>) end;

//  Jh_327Class = interface(JObjectClass)
//  ['{DB49D3A8-4B4F-496B-AB7B-C66EF888928F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_327; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/h')]
//  Jh_327 = interface(JObject)
//  ['{10F8B4BC-D80C-4F07-A60E-E21261FFC3AE}']
//    { Property Methods }
//    function _Geta: Jp4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jp4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//
//    { Property }
//    property a: Jp4 read _Geta write _Seta;
//  end;

//  TJh_327 = class(TJavaGenericImport<Jh_327Class, Jh_327>) end;

//  Ji_328Class = interface(JObjectClass)
//  ['{2E52EA23-6073-4816-B40F-2CBEC0410BC5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji_328; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/i')]
//  Ji_328 = interface(JObject)
//  ['{40CEDED8-ADDB-49A7-A7F2-2B6478F68CEF}']
//    { Property Methods }
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJi_328 = class(TJavaGenericImport<Ji_328Class, Ji_328>) end;

//  Jj_aClass = interface(Jp4Class) // or JObjectClass
//  ['{5FC9753B-89DD-4710-8B0C-DCC4BA772EFD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/j$a')]
//  Jj_a = interface(Jp4) // or JObject
//  ['{0DA6EF0D-610A-4397-8932-20E5D456C40C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJj_a = class(TJavaGenericImport<Jj_aClass, Jj_a>) end;

//  Jj_330Class = interface(JObjectClass)
//  ['{1FD4315C-AF09-4263-BF50-F2970B6668B8}']
//    { static Property Methods }
//    {class} function _Geta: Jp4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jj_330; cdecl; overload;
//    {class} function a(P1: JString; P2: JString): JString; cdecl;
//    {class} function init: Jj_330; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jp4 read _Geta;
//  end;

//  [JavaSignature('com/bytedance/dr/impl/j')]
//  Jj_330 = interface(JObject)
//  ['{DF0924B4-75E3-492C-923E-F56C89E78075}']
//    { Property Methods }
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJj_330 = class(TJavaGenericImport<Jj_330Class, Jj_330>) end;

//  Jk_aClass = interface(Jp4Class) // or JObjectClass
//  ['{0B5A4A57-2D11-4824-8585-66761A957C66}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk): Jk_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/k$a')]
//  Jk_a = interface(Jp4) // or JObject
//  ['{8B1E0E5A-C674-474D-A0F9-33D297E0A66E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJk_a = class(TJavaGenericImport<Jk_aClass, Jk_a>) end;

//  Jk_bClass = interface(JObjectClass)
//  ['{1A899C78-4F4F-41E1-A0AB-750149B44B29}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk; P2: JContext): Jk_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/k$b')]
//  Jk_b = interface(JObject)
//  ['{824F84CA-BEFD-48BC-9157-A8A727BC12F2}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jk;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jk);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//    property a: JContext read _Geta write _Seta;
//    property b: Jk read _Getb write _Setb;
//  end;

//  TJk_b = class(TJavaGenericImport<Jk_bClass, Jk_b>) end;

//  Jk_333Class = interface(JObjectClass)
//  ['{43D6BBBA-3586-4FC5-B2F5-14E4B11BB737}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JOaidApi): Jk_333; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/k')]
//  Jk_333 = interface(JObject)
//  ['{C5B0BA27-357B-4A65-82B7-D5884AB5A4C7}']
//    { Property Methods }
//    function _Geta: JOaidApi;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JOaidApi);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jp4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jp4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//    function a(P1: JContext): JString; cdecl;
//
//    { Property }
//    property a: JOaidApi read _Geta write _Seta;
//    property b: Jp4 read _Getb write _Setb;
//  end;

//  TJk_333 = class(TJavaGenericImport<Jk_333Class, Jk_333>) end;

//  Jl_a_334Class = interface(JObjectClass)
//  ['{32B3FEDE-FB60-481A-B259-1AE747B436A1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jl): Jl_a_334; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/l$a')]
//  Jl_a_334 = interface(JObject)
//  ['{BED0AC06-D3E2-4ED7-BCBD-F5AD60E8430D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJl_a_334 = class(TJavaGenericImport<Jl_a_334Class, Jl_a_334>) end;

//  Jl_335Class = interface(Jb_315Class) // or JObjectClass
//  ['{73670BE2-3C07-4B85-B71A-5D307572DAEF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl_335; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/l')]
//  Jl_335 = interface(Jb_315) // or JObject
//  ['{C63E6A3E-2495-45A4-8D55-9C589AE83C3F}']
//    { Property Methods }
//
//    { methods }
//    function a: Jx4_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJl_335 = class(TJavaGenericImport<Jl_335Class, Jl_335>) end;

//  Jm_336Class = interface(JObjectClass)
//  ['{8EE780C3-DF9D-494D-B337-1C15F05AADAF}']
//    { static Property Methods }
//    {class} function _Geta: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JClass;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JMethod;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jm_336; cdecl; overload;
//    {class} function init: Jm_336; cdecl; overload;
//
//    { static Property }
//    {class} property a: JObject read _Geta;
//    {class} property b: JClass read _Getb;
//    {class} property c: JMethod read _Getc;
//  end;

//  [JavaSignature('com/bytedance/dr/impl/m')]
//  Jm_336 = interface(JObject)
//  ['{E1CE50D6-7DE0-48C0-ACE2-9BBD58E41FBA}']
//    { Property Methods }
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJm_336 = class(TJavaGenericImport<Jm_336Class, Jm_336>) end;

//  JOaidApi_aClass = interface(JObjectClass)
//  ['{EBB303E2-9762-4103-8D92-9CDE73298DFB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JOaidApi_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/OaidApi$a')]
//  JOaidApi_a = interface(JObject)
//  ['{905E3D6B-532E-4B2F-B969-8D7E411967FB}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//  end;

//  TJOaidApi_a = class(TJavaGenericImport<JOaidApi_aClass, JOaidApi_a>) end;

  JOaidApiClass = interface(JObjectClass)
  ['{01550FCF-4F11-48B5-863F-AB783E99510A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/dr/OaidApi')]
  JOaidApi = interface(IJavaInstance)
  ['{3D1FDE2A-A7BA-4CFE-9E50-DD2AB96E77B6}']
    { Property Methods }

    { methods }
    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
    function getName: JString; cdecl;

    { Property }
  end;

  TJOaidApi = class(TJavaGenericImport<JOaidApiClass, JOaidApi>) end;

  JOaidFactoryClass = interface(JObjectClass)
  ['{0140B460-BDFC-45B1-B1F4-A9155CFC4E31}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOaidFactory; cdecl;
    {class} function createOaidImpl(P1: JContext): JOaidApi; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/dr/OaidFactory')]
  JOaidFactory = interface(JObject)
  ['{C0126C13-8FA8-41CF-9D9E-FCAA6786F6F4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOaidFactory = class(TJavaGenericImport<JOaidFactoryClass, JOaidFactory>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIALinkListener',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIALinkListener));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JPageMeta',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JPageMeta));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAppLog',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAppLog));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAppLogManager',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAppLogManager));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JCollector',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JCollector));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAutoTrackEventType',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAutoTrackEventType));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JEventBuilder',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JEventBuilder));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JEventPolicy',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JEventPolicy));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JEventType',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JEventType));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIEventHandler',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIEventHandler));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAppCrashType',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAppCrashType));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureConfig',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureConfig));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureData',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureData));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_e));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_f',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager_f));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JViewExposureManager));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JGameReportHelper',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JGameReportHelper));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JOhayooGameHelper',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JOhayooGameHelper));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUnityPlugin_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUnityPlugin_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUnityPlugin',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUnityPlugin));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWhalerGameHelper_Result',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWhalerGameHelper_Result));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWhalerGameHelper',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWhalerGameHelper));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIActiveCustomParamsCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIActiveCustomParamsCallback));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIAppLogInstance',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIAppLogInstance));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIDataObserver',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIDataObserver));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIEventObserver',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIEventObserver));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIExtraParams',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIExtraParams));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIHeaderCustomTimelyCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIHeaderCustomTimelyCallback));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JILogger',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JILogger));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JInitConfig_IpcDataChecker',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JInitConfig_IpcDataChecker));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JInitConfig',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JInitConfig));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIOaidObserver_Oaid',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIOaidObserver_Oaid));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIOaidObserver',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIOaidObserver));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIPageMeta',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIPageMeta));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIPicker',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIPicker));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIPullAbTestConfigCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIPullAbTestConfigCallback));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JISensitiveInfoProvider',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JISensitiveInfoProvider));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JISessionObserver',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JISessionObserver));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JLevel',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JLevel));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JMigrateDetectorActivity',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JMigrateDetectorActivity));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JINetworkClient',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JINetworkClient));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JRangersHttpException',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JRangersHttpException));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIDBindCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIDBindCallback));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIDBindResult',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JIDBindResult));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAnalyticsComponentRegistrar_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAnalyticsComponentRegistrar_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAnalyticsComponentRegistrar',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JAnalyticsComponentRegistrar));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JDeviceComponentRegistrar_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JDeviceComponentRegistrar_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JDeviceComponentRegistrar',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JDeviceComponentRegistrar));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUserProfileCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUserProfileCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSimulateLaunchActivity',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSimulateLaunchActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUriConfig_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUriConfig_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUriConfig_Builder',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUriConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUriConfig',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUriConfig));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JGeoCoordinateSystemConst',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JGeoCoordinateSystemConst));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JHardwareUtils_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JHardwareUtils_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JHardwareUtils',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JHardwareUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils_e));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JSensitiveUtils));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUriConstants',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JUriConstants));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_e));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_f',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_f));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_g',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_g));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_h',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil_h));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JWebViewJsUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_e));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc0_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc0_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc0_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc0_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc0_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc0_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd1_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_e));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_f',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_f));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_g',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_g));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_h',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3_h));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh0_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh0_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk0_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk0_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl1_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn1_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn2_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jn4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jo4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jp4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0_e));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jq4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jr4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Js4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt2_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt2_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt2_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jt4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju2_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ju4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jv4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jw4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx4_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx4_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jx4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy2_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy2_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy2_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jy3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jz',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jz));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jz0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jz0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jz1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jz1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jz2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jz2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jz3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jz3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja_293',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja_293));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_a_295',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_a_295));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_296',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_296));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_a_298',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_a_298));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_299',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_299));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_a_301',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_a_301));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_302',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_302));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_305',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_305));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf_308',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf_308));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg_311',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg_311));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja_a_312',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja_a_312));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja_313',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ja_313));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_a_314',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_a_314));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_315',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jb_315));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_a_316',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_a_316));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_317',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jc_317));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_a_318',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_a_318));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_319',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jd_319));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_a_320',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_a_320));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_322',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Je_322));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf_323',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jf_323));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg_a_324',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg_a_324));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg_325',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jg_325));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh_327',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jh_327));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji_328',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Ji_328));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj_330',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jj_330));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk_333',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jk_333));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl_a_334',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl_a_334));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl_335',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jl_335));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm_336',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.Jm_336));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JOaidApi_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JOaidApi_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JOaidApi',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JOaidApi));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JOaidFactory',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar.JOaidFactory));
end;


initialization
  RegisterTypes;

end.
