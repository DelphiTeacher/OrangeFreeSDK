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
//  生成时间：2023-10-13 16:09:30
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar;

interface

//uses
//  Androidapi.JNIBridge,
//  Androidapi.JNI.JavaTypes,
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.android.app.Activity,
//  Androidapi.JNI.org.json.JSONObject,
//  Androidapi.JNI.android.os.Bundle,
//  Androidapi.JNI.android.accounts.Account,
//  Androidapi.JNI.android.net.Uri,
//  Androidapi.JNI.android.view.View,
//  Androidapi.JNI.android.app.Dialog,
//  Androidapi.JNI.android.content.Intent,
//  Androidapi.JNI.kotlin.jvm.internal.DefaultConstructorMarker,
//  Androidapi.JNI.android.os.Handler,
//  Androidapi.JNI.kotlin.jvm.functions.Function0,
//  Androidapi.JNI.com.bytedance.mpaas.IEncryptor,
//  Androidapi.JNI.com.volcengine.onekit.component.ComponentContainer,
//  Androidapi.JNI.android.widget.TextView,
//  Androidapi.JNI.com.bytedance.applog.log.IAppLogLogger,
//  Androidapi.JNI.org.json.JSONArray,
//  Androidapi.JNI.android.webkit.WebView,
//  Androidapi.JNI.android.content.SharedPreferences,
//  Androidapi.JNI.com.bytedance.applog.log.EventBus_DataFetcher,
//  Androidapi.JNI.android.os.Looper,
//  Androidapi.JNI.kotlin.jvm.functions.Function1,
//  Androidapi.JNI.kotlin.reflect.KProperty,
//  Androidapi.JNI.kotlin.Lazy,
//  Androidapi.JNI.com.bytedance.applog.aggregation.IMetricsTracker,
//  Androidapi.JNI.android.os.Message,
//  Androidapi.JNI.android.app.Application,
//  Androidapi.JNI.android.content.ComponentName,
//  Androidapi.JNI.android.os.IBinder,
//  Androidapi.JNI.android.accounts.AccountManager,
//  Androidapi.JNI.java.text.SimpleDateFormat,
//  Androidapi.JNI.android.database.Cursor,
//  Androidapi.JNI.android.content.ContentValues,
//  Androidapi.JNI.android.content.pm.PackageInfo,
//  Androidapi.JNI.android.graphics.Paint,
//  Androidapi.JNI.android.graphics.drawable.Drawable,
//  Androidapi.JNI.android.graphics.Canvas,
//  Androidapi.JNI.android.graphics.Rect,
//  Androidapi.JNI.android.graphics.ColorFilter,
//  Androidapi.JNI.android.graphics.Region,
//  Androidapi.JNI.android.content.res.ColorStateList,
//  Androidapi.JNI.android.graphics.PorterDuff_Mode,
//  Androidapi.JNI.android.database.sqlite.SQLiteDatabase,
//  Androidapi.JNI.android.database.sqlite.SQLiteDatabase_CursorFactory,
//  Androidapi.JNI.android.view.ViewTreeObserver_OnDrawListener,
//  Androidapi.JNI.android.view.ViewTreeObserver_OnGlobalLayoutListener,
//  Androidapi.JNI.android.view.ViewTreeObserver_OnGlobalFocusChangeListener,
//  Androidapi.JNI.android.view.ViewTreeObserver_OnScrollChangedListener,
//  Androidapi.JNI.android.view.ViewTreeObserver_OnWindowFocusChangeListener,
//  Androidapi.JNI.android.util.SparseArray,
//  Androidapi.JNI.android.util.LruCache,
//  Androidapi.JNI.com.bytedance.applog.log.LogInfo;


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
  JIPickerCallback = interface; //com.bytedance.applog.IPickerCallback
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
  JSimulateLaunchActivity = interface; //com.bytedance.applog.simulate.SimulateLaunchActivity
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
//  Ja1_a = interface; //com.bytedance.bdtracker.a1$a
//  Ja1 = interface; //com.bytedance.bdtracker.a1
//  Ja2_a = interface; //com.bytedance.bdtracker.a2$a
//  Ja2_b = interface; //com.bytedance.bdtracker.a2$b
//  Ja2_c = interface; //com.bytedance.bdtracker.a2$c
//  Ja2 = interface; //com.bytedance.bdtracker.a2
//  Ja3_a = interface; //com.bytedance.bdtracker.a3$a
//  Ja3 = interface; //com.bytedance.bdtracker.a3
//  Ja4 = interface; //com.bytedance.bdtracker.a4
//  Ja5 = interface; //com.bytedance.bdtracker.a5
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
//  Jb5 = interface; //com.bytedance.bdtracker.b5
//  Jc_a = interface; //com.bytedance.bdtracker.c$a
//  Jc = interface; //com.bytedance.bdtracker.c
//  Jc0_a = interface; //com.bytedance.bdtracker.c0$a
//  Jc0_b = interface; //com.bytedance.bdtracker.c0$b
//  Jc0_c = interface; //com.bytedance.bdtracker.c0$c
//  Jc0_d = interface; //com.bytedance.bdtracker.c0$d
//  Jc0 = interface; //com.bytedance.bdtracker.c0
//  Jc1 = interface; //com.bytedance.bdtracker.c1
//  Jc2 = interface; //com.bytedance.bdtracker.c2
//  Jc3 = interface; //com.bytedance.bdtracker.c3
//  Jc4 = interface; //com.bytedance.bdtracker.c4
//  Jc5 = interface; //com.bytedance.bdtracker.c5
//  Jd_a = interface; //com.bytedance.bdtracker.d$a
//  Jd_b = interface; //com.bytedance.bdtracker.d$b
//  Jd_c = interface; //com.bytedance.bdtracker.d$c
//  Jd_d = interface; //com.bytedance.bdtracker.d$d
//  Jd = interface; //com.bytedance.bdtracker.d
//  Jd0 = interface; //com.bytedance.bdtracker.d0
//  Jd1 = interface; //com.bytedance.bdtracker.d1
//  Jd2 = interface; //com.bytedance.bdtracker.d2
//  Jd3 = interface; //com.bytedance.bdtracker.d3
//  Jd4 = interface; //com.bytedance.bdtracker.d4
//  Jd5_a = interface; //com.bytedance.bdtracker.d5$a
//  Jd5_b = interface; //com.bytedance.bdtracker.d5$b
//  Jd5 = interface; //com.bytedance.bdtracker.d5
//  Je = interface; //com.bytedance.bdtracker.e
//  Je0 = interface; //com.bytedance.bdtracker.e0
//  Je1 = interface; //com.bytedance.bdtracker.e1
//  Je2 = interface; //com.bytedance.bdtracker.e2
//  Je3_a = interface; //com.bytedance.bdtracker.e3$a
//  Je3_b = interface; //com.bytedance.bdtracker.e3$b
//  Je3 = interface; //com.bytedance.bdtracker.e3
//  Je4 = interface; //com.bytedance.bdtracker.e4
//  Jf = interface; //com.bytedance.bdtracker.f
//  Jf0_a = interface; //com.bytedance.bdtracker.f0$a
//  Jf0 = interface; //com.bytedance.bdtracker.f0
//  Jf1 = interface; //com.bytedance.bdtracker.f1
//  Jf2 = interface; //com.bytedance.bdtracker.f2
//  Jf3 = interface; //com.bytedance.bdtracker.f3
//  Jf4 = interface; //com.bytedance.bdtracker.f4
//  Jg = interface; //com.bytedance.bdtracker.g
//  Jg0_a = interface; //com.bytedance.bdtracker.g0$a
//  Jg0 = interface; //com.bytedance.bdtracker.g0
//  Jg1 = interface; //com.bytedance.bdtracker.g1
//  Jg2_a = interface; //com.bytedance.bdtracker.g2$a
//  Jg2 = interface; //com.bytedance.bdtracker.g2
//  Jg3_a = interface; //com.bytedance.bdtracker.g3$a
//  Jg3 = interface; //com.bytedance.bdtracker.g3
//  Jg4 = interface; //com.bytedance.bdtracker.g4
//  Jh = interface; //com.bytedance.bdtracker.h
//  Jh0_a = interface; //com.bytedance.bdtracker.h0$a
//  Jh0_b = interface; //com.bytedance.bdtracker.h0$b
//  Jh0 = interface; //com.bytedance.bdtracker.h0
//  Jh1 = interface; //com.bytedance.bdtracker.h1
//  Jh2 = interface; //com.bytedance.bdtracker.h2
//  Jh3 = interface; //com.bytedance.bdtracker.h3
//  Jh4 = interface; //com.bytedance.bdtracker.h4
//  Ji = interface; //com.bytedance.bdtracker.i
//  Ji0 = interface; //com.bytedance.bdtracker.i0
//  Ji1_a = interface; //com.bytedance.bdtracker.i1$a
//  Ji1 = interface; //com.bytedance.bdtracker.i1
//  Ji2 = interface; //com.bytedance.bdtracker.i2
//  Ji3_a = interface; //com.bytedance.bdtracker.i3$a
//  Ji3 = interface; //com.bytedance.bdtracker.i3
//  Ji4_a = interface; //com.bytedance.bdtracker.i4$a
//  Ji4 = interface; //com.bytedance.bdtracker.i4
//  Jj = interface; //com.bytedance.bdtracker.j
//  Jj0 = interface; //com.bytedance.bdtracker.j0
//  Jj1 = interface; //com.bytedance.bdtracker.j1
//  Jj2 = interface; //com.bytedance.bdtracker.j2
//  Jj3_a = interface; //com.bytedance.bdtracker.j3$a
//  Jj3 = interface; //com.bytedance.bdtracker.j3
//  Jj4 = interface; //com.bytedance.bdtracker.j4
//  Jk = interface; //com.bytedance.bdtracker.k
//  Jk0_a = interface; //com.bytedance.bdtracker.k0$a
//  Jk0_b = interface; //com.bytedance.bdtracker.k0$b
//  Jk0 = interface; //com.bytedance.bdtracker.k0
//  Jk1_a = interface; //com.bytedance.bdtracker.k1$a
//  Jk1 = interface; //com.bytedance.bdtracker.k1
//  Jk2 = interface; //com.bytedance.bdtracker.k2
//  Jk3_a = interface; //com.bytedance.bdtracker.k3$a
//  Jk3_b = interface; //com.bytedance.bdtracker.k3$b
//  Jk3_c = interface; //com.bytedance.bdtracker.k3$c
//  Jk3_d = interface; //com.bytedance.bdtracker.k3$d
//  Jk3_e = interface; //com.bytedance.bdtracker.k3$e
//  Jk3_f = interface; //com.bytedance.bdtracker.k3$f
//  Jk3_g = interface; //com.bytedance.bdtracker.k3$g
//  Jk3_h = interface; //com.bytedance.bdtracker.k3$h
//  Jk3 = interface; //com.bytedance.bdtracker.k3
//  Jk4 = interface; //com.bytedance.bdtracker.k4
//  Jl_a = interface; //com.bytedance.bdtracker.l$a
//  Jl = interface; //com.bytedance.bdtracker.l
//  Jl0 = interface; //com.bytedance.bdtracker.l0
//  Jl1 = interface; //com.bytedance.bdtracker.l1
//  Jl2 = interface; //com.bytedance.bdtracker.l2
//  Jl3 = interface; //com.bytedance.bdtracker.l3
//  Jl4_a = interface; //com.bytedance.bdtracker.l4$a
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
//  Jn1 = interface; //com.bytedance.bdtracker.n1
//  Jn2 = interface; //com.bytedance.bdtracker.n2
//  Jn3 = interface; //com.bytedance.bdtracker.n3
//  Jn4_a = interface; //com.bytedance.bdtracker.n4$a
//  Jn4 = interface; //com.bytedance.bdtracker.n4
//  Jo_a = interface; //com.bytedance.bdtracker.o$a
//  Jo = interface; //com.bytedance.bdtracker.o
//  Jo0 = interface; //com.bytedance.bdtracker.o0
//  Jo1 = interface; //com.bytedance.bdtracker.o1
//  Jo2 = interface; //com.bytedance.bdtracker.o2
//  Jo3 = interface; //com.bytedance.bdtracker.o3
//  Jo4_a = interface; //com.bytedance.bdtracker.o4$a
//  Jo4 = interface; //com.bytedance.bdtracker.o4
//  Jp = interface; //com.bytedance.bdtracker.p
//  Jp0 = interface; //com.bytedance.bdtracker.p0
//  Jp1 = interface; //com.bytedance.bdtracker.p1
//  Jp2 = interface; //com.bytedance.bdtracker.p2
//  Jp3 = interface; //com.bytedance.bdtracker.p3
//  Jp4 = interface; //com.bytedance.bdtracker.p4
//  Jq = interface; //com.bytedance.bdtracker.q
//  Jq0 = interface; //com.bytedance.bdtracker.q0
//  Jq1 = interface; //com.bytedance.bdtracker.q1
//  Jq2 = interface; //com.bytedance.bdtracker.q2
//  Jq3 = interface; //com.bytedance.bdtracker.q3
//  Jq4 = interface; //com.bytedance.bdtracker.q4
//  Jr = interface; //com.bytedance.bdtracker.r
//  Jr0_a = interface; //com.bytedance.bdtracker.r0$a
//  Jr0_b = interface; //com.bytedance.bdtracker.r0$b
//  Jr0_c = interface; //com.bytedance.bdtracker.r0$c
//  Jr0_d = interface; //com.bytedance.bdtracker.r0$d
//  Jr0_e = interface; //com.bytedance.bdtracker.r0$e
//  Jr0 = interface; //com.bytedance.bdtracker.r0
//  Jr1 = interface; //com.bytedance.bdtracker.r1
//  Jr2 = interface; //com.bytedance.bdtracker.r2
//  Jr3 = interface; //com.bytedance.bdtracker.r3
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
//  Jt2 = interface; //com.bytedance.bdtracker.t2
//  Jt3 = interface; //com.bytedance.bdtracker.t3
//  Jt4 = interface; //com.bytedance.bdtracker.t4
//  Ju = interface; //com.bytedance.bdtracker.u
//  Ju0 = interface; //com.bytedance.bdtracker.u0
//  Ju1 = interface; //com.bytedance.bdtracker.u1
//  Ju2 = interface; //com.bytedance.bdtracker.u2
//  Ju3 = interface; //com.bytedance.bdtracker.u3
//  Ju4 = interface; //com.bytedance.bdtracker.u4
//  Jv = interface; //com.bytedance.bdtracker.v
//  Jv0 = interface; //com.bytedance.bdtracker.v0
//  Jv1 = interface; //com.bytedance.bdtracker.v1
//  Jv2 = interface; //com.bytedance.bdtracker.v2
//  Jv3_a = interface; //com.bytedance.bdtracker.v3$a
//  Jv3 = interface; //com.bytedance.bdtracker.v3
//  Jv4 = interface; //com.bytedance.bdtracker.v4
//  Jw_a = interface; //com.bytedance.bdtracker.w$a
//  Jw_b = interface; //com.bytedance.bdtracker.w$b
//  Jw = interface; //com.bytedance.bdtracker.w
//  Jw0 = interface; //com.bytedance.bdtracker.w0
//  Jw1 = interface; //com.bytedance.bdtracker.w1
//  Jw2 = interface; //com.bytedance.bdtracker.w2
//  Jw3 = interface; //com.bytedance.bdtracker.w3
//  Jw4_a = interface; //com.bytedance.bdtracker.w4$a
//  Jw4 = interface; //com.bytedance.bdtracker.w4
//  Jx = interface; //com.bytedance.bdtracker.x
//  Jx0 = interface; //com.bytedance.bdtracker.x0
//  Jx1 = interface; //com.bytedance.bdtracker.x1
//  Jx2 = interface; //com.bytedance.bdtracker.x2
//  Jx3 = interface; //com.bytedance.bdtracker.x3
//  Jx4_a = interface; //com.bytedance.bdtracker.x4$a
//  Jx4 = interface; //com.bytedance.bdtracker.x4
//  Jy = interface; //com.bytedance.bdtracker.y
//  Jy0 = interface; //com.bytedance.bdtracker.y0
//  Jy1 = interface; //com.bytedance.bdtracker.y1
//  Jy2 = interface; //com.bytedance.bdtracker.y2
//  Jy3 = interface; //com.bytedance.bdtracker.y3
//  Jy4 = interface; //com.bytedance.bdtracker.y4
//  Jz = interface; //com.bytedance.bdtracker.z
//  Jz0 = interface; //com.bytedance.bdtracker.z0
//  Jz1 = interface; //com.bytedance.bdtracker.z1
//  Jz2_a = interface; //com.bytedance.bdtracker.z2$a
//  Jz2_b = interface; //com.bytedance.bdtracker.z2$b
//  Jz2 = interface; //com.bytedance.bdtracker.z2
//  Jz3 = interface; //com.bytedance.bdtracker.z3
//  Jz4_a = interface; //com.bytedance.bdtracker.z4$a
//  Jz4 = interface; //com.bytedance.bdtracker.z4
//  Ja_a_a = interface; //com.bytedance.dr.aidl.a$a$a
//  Ja_a = interface; //com.bytedance.dr.aidl.a$a
//  Ja_304 = interface; //com.bytedance.dr.aidl.a
//  Jb_a_a = interface; //com.bytedance.dr.aidl.b$a$a
//  Jb_a_306 = interface; //com.bytedance.dr.aidl.b$a
//  Jb_307 = interface; //com.bytedance.dr.aidl.b
//  Jc_a_a = interface; //com.bytedance.dr.aidl.c$a$a
//  Jc_a_309 = interface; //com.bytedance.dr.aidl.c$a
//  Jc_310 = interface; //com.bytedance.dr.aidl.c
//  Jd_a_a = interface; //com.bytedance.dr.aidl.d$a$a
//  Jd_a_312 = interface; //com.bytedance.dr.aidl.d$a
//  Jd_313 = interface; //com.bytedance.dr.aidl.d
//  Je_a_a = interface; //com.bytedance.dr.aidl.e$a$a
//  Je_a = interface; //com.bytedance.dr.aidl.e$a
//  Je_316 = interface; //com.bytedance.dr.aidl.e
//  Jf_a_a = interface; //com.bytedance.dr.aidl.f$a$a
//  Jf_a = interface; //com.bytedance.dr.aidl.f$a
//  Jf_319 = interface; //com.bytedance.dr.aidl.f
//  Jg_a_a = interface; //com.bytedance.dr.aidl.g$a$a
//  Jg_a = interface; //com.bytedance.dr.aidl.g$a
//  Jg_322 = interface; //com.bytedance.dr.aidl.g
//  Ja_a_323 = interface; //com.bytedance.dr.impl.a$a
//  Ja_324 = interface; //com.bytedance.dr.impl.a
//  Jb_a_325 = interface; //com.bytedance.dr.impl.b$a
//  Jb_326 = interface; //com.bytedance.dr.impl.b
//  Jc_a_327 = interface; //com.bytedance.dr.impl.c$a
//  Jc_328 = interface; //com.bytedance.dr.impl.c
//  Jd_a_329 = interface; //com.bytedance.dr.impl.d$a
//  Jd_330 = interface; //com.bytedance.dr.impl.d
//  Je_a_331 = interface; //com.bytedance.dr.impl.e$a
//  Je_b = interface; //com.bytedance.dr.impl.e$b
//  Je_333 = interface; //com.bytedance.dr.impl.e
//  Jf_334 = interface; //com.bytedance.dr.impl.f
//  Jg_a_335 = interface; //com.bytedance.dr.impl.g$a
//  Jg_336 = interface; //com.bytedance.dr.impl.g
//  Jh_a = interface; //com.bytedance.dr.impl.h$a
//  Jh_338 = interface; //com.bytedance.dr.impl.h
//  Ji_339 = interface; //com.bytedance.dr.impl.i
//  Jj_a = interface; //com.bytedance.dr.impl.j$a
//  Jj_341 = interface; //com.bytedance.dr.impl.j
//  Jk_a = interface; //com.bytedance.dr.impl.k$a
//  Jk_b = interface; //com.bytedance.dr.impl.k$b
//  Jk_344 = interface; //com.bytedance.dr.impl.k
//  Jl_a_345 = interface; //com.bytedance.dr.impl.l$a
//  Jl_346 = interface; //com.bytedance.dr.impl.l
//  Jm_347 = interface; //com.bytedance.dr.impl.m
//  JOaidApi_a = interface; //com.bytedance.dr.OaidApi$a
  JOaidApi = interface; //com.bytedance.dr.OaidApi
  JOaidFactory = interface; //com.bytedance.dr.OaidFactory

// ===== Forward SuperClasses declarations =====

//  Ja0Class = interface; //com.bytedance.bdtracker.a0
//  Jd1Class = interface; //com.bytedance.bdtracker.d1
//  Jc0_cClass = interface; //com.bytedance.bdtracker.c0$c
//  Jw3Class = interface; //com.bytedance.bdtracker.w3
//  Jk3Class = interface; //com.bytedance.bdtracker.k3
//  JoClass = interface; //com.bytedance.bdtracker.o
//  Jy3Class = interface; //com.bytedance.bdtracker.y3
//  Jm0Class = interface; //com.bytedance.bdtracker.m0
//  Jq3Class = interface; //com.bytedance.bdtracker.q3
//  Jj3Class = interface; //com.bytedance.bdtracker.j3
  JRangersHttpExceptionClass = interface; //com.bytedance.applog.network.RangersHttpException
//  Js0Class = interface; //com.bytedance.bdtracker.s0
//  Jv4Class = interface; //com.bytedance.bdtracker.v4
//  Jb_326Class = interface; //com.bytedance.dr.impl.b
//  JOaidApi_aClass = interface; //com.bytedance.dr.OaidApi$a

// ===== Interface declarations =====

  JIALinkListenerClass = interface(JObjectClass)
  ['{6D864EC2-2E99-4C53-B8CE-7D9E88ACA486}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/alink/IALinkListener')]
  JIALinkListener = interface(IJavaInstance)
  ['{DD165DFA-2201-41F3-A421-08E9E0A7F4BD}']
    { Property Methods }

    { methods }
    procedure onALinkData(P1: JMap; P2: JException); cdecl;
    procedure onAttributionData(P1: JMap; P2: JException); cdecl;

    { Property }
  end;

  TJIALinkListener = class(TJavaGenericImport<JIALinkListenerClass, JIALinkListener>) end;

  JPageMetaClass = interface(JObjectClass)
  ['{D7820236-D08E-476D-93C4-69E2E6FCAFAC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/annotation/PageMeta')]
  JPageMeta = interface(IJavaInstance)
  ['{DC1D7F2F-7433-415C-9FF5-8E0E779623F6}']
    { Property Methods }

    { methods }
    function title: JString; cdecl;
    function path: JString; cdecl;

    { Property }
  end;

  TJPageMeta = class(TJavaGenericImport<JPageMetaClass, JPageMeta>) end;

  JAppLogClass = interface(JObjectClass)
  ['{96F837FC-E53B-4207-B71C-74078431D9BE}']
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
    {class} procedure setDevToolsEnable(P1: Boolean); cdecl;
//    {class} function init: JAppLog; cdecl; overload;

    { static Property }
    {class} property a: JIAppLogInstance read _Geta;
    {class} property b: Boolean read _Getb;
  end;

  [JavaSignature('com/bytedance/applog/AppLog')]
  JAppLog = interface(JObject)
  ['{1C5306AC-F99D-420D-B26F-9DF5FAC4AA38}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAppLog = class(TJavaGenericImport<JAppLogClass, JAppLog>) end;

  JAppLogManagerClass = interface(JObjectClass)
  ['{28875A8F-57DC-4832-867A-E98A38451102}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAppLogManager; cdecl;
    {class} function getInstance(P1: JString): JIAppLogInstance; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/AppLogManager')]
  JAppLogManager = interface(JObject)
  ['{695A7B25-62DB-4BB1-A4E4-EF71E9FD56A5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAppLogManager = class(TJavaGenericImport<JAppLogManagerClass, JAppLogManager>) end;

  JCollectorClass = interface(JBroadcastReceiverClass) // or JObjectClass
  ['{629C38B7-6EB6-4178-9797-9B1E58EE3154}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCollector; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/collector/Collector')]
  JCollector = interface(JBroadcastReceiver) // or JObject
  ['{8070A3D3-0FA1-46C8-B167-5A8B724A742D}']
    { Property Methods }

    { methods }
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;

    { Property }
  end;

  TJCollector = class(TJavaGenericImport<JCollectorClass, JCollector>) end;

  JAutoTrackEventTypeClass = interface(JObjectClass)
  ['{BAEA6B1C-66E8-44B0-BFE9-8F4C7E175BD4}']
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
  ['{06F4D7B2-7885-463C-8A87-F984D2CE4A2F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAutoTrackEventType = class(TJavaGenericImport<JAutoTrackEventTypeClass, JAutoTrackEventType>) end;

  JEventBuilderClass = interface(JObjectClass)
  ['{F0F83F36-4CFC-4010-82D6-62216413C1F0}']
    { static Property Methods }

    { static Methods }
//    {class} function init(P1: Jd): JEventBuilder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/event/EventBuilder')]
  JEventBuilder = interface(JObject)
  ['{DF3272AE-93E6-48C5-AA73-50DCA1694056}']
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
//    function build: Jq3; cdecl;
    procedure track; cdecl;

    { Property }
//    property a: Jd read _Geta write _Seta;
    property b: JString read _Getb write _Setb;
    property c: JString read _Getc write _Setc;
    property d: JJSONObject read _Getd write _Setd;
  end;

  TJEventBuilder = class(TJavaGenericImport<JEventBuilderClass, JEventBuilder>) end;

  JEventPolicyClass = interface(JEnumClass) // or JObjectClass
  ['{DEB53F97-F179-41A6-8F37-61202E51759C}']
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
  ['{627AEAB5-9FA0-4469-BF00-42AB4942A8C5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEventPolicy = class(TJavaGenericImport<JEventPolicyClass, JEventPolicy>) end;

  JEventTypeClass = interface(JObjectClass)
  ['{BA919C09-13AA-4118-BE3B-9F6666B3FB84}']
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
  ['{C28EBA36-3CE3-498A-9D44-D2C38C821FCE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEventType = class(TJavaGenericImport<JEventTypeClass, JEventType>) end;

  JIEventHandlerClass = interface(JObjectClass)
  ['{9995A31D-65C6-4C3A-B03D-475F862699D8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/event/IEventHandler')]
  JIEventHandler = interface(IJavaInstance)
  ['{2A5203DC-E91E-471B-8F63-6C31C102453B}']
    { Property Methods }

    { methods }
    function acceptType: Integer; cdecl;
    function onReceive(P1: Integer; P2: JString; P3: JJSONObject): JEventPolicy; cdecl;

    { Property }
  end;

  TJIEventHandler = class(TJavaGenericImport<JIEventHandlerClass, JIEventHandler>) end;

  JAppCrashTypeClass = interface(JObjectClass)
  ['{84C26C43-0BC0-4CB6-B482-8E2B739E15C5}']
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
  ['{162BDDE1-A927-42A9-83B2-94B225B1B498}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAppCrashType = class(TJavaGenericImport<JAppCrashTypeClass, JAppCrashType>) end;

  JViewExposureConfigClass = interface(JObjectClass)
  ['{8D2383CC-29D3-43C2-9D6D-8BCFFA2CEA6D}']
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
  ['{A078C906-46D8-40A1-BAC7-73C836D3AC76}']
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
  ['{7C5C340D-21EB-477D-ACE4-B9833455BCD1}']
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
  ['{429BA8BE-46E4-437F-97A0-22C5EE062F64}']
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
//  ['{D9AB509B-2CD2-4A9C-B31A-8BC08A0DE80E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDefaultConstructorMarker): JViewExposureManager_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$a')]
//  JViewExposureManager_a = interface(JObject)
//  ['{8679A804-DD0E-41F6-AC2C-1244F722D9C1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJViewExposureManager_a = class(TJavaGenericImport<JViewExposureManager_aClass, JViewExposureManager_a>) end;

//  JViewExposureManager_bClass = interface(JObjectClass)
//  ['{CB9777EA-1EA5-4864-9041-C3DEF3F80795}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager): JViewExposureManager_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$b')]
//  JViewExposureManager_b = interface(JObject)
//  ['{1AA08D8F-FCA3-4AD9-A019-CAF2769DAE92}']
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
//  ['{A0D2F90F-0729-4B48-B969-5795CCE32277}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager; P2: JActivity): JViewExposureManager_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$c')]
//  JViewExposureManager_c = interface(JLambda) // or JObject
//  ['{FCBB26BC-7D51-432E-A185-1BB20F888D50}']
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
//  ['{ADDB7736-7EE5-4420-99CB-3FC6DCC36E23}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager; P2: JView): JViewExposureManager_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$d')]
//  JViewExposureManager_d = interface(JLambda) // or JObject
//  ['{D369E302-C5E1-489B-9D2A-D3778A060C08}']
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
//  ['{26016B6A-12A7-4232-A62C-D39BE11E51CA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager; P2: JView; P3: JViewExposureData): JViewExposureManager_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$e')]
//  JViewExposureManager_e = interface(JLambda) // or JObject
//  ['{433F047F-3F57-428B-A7BB-46B8402281CA}']
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
//  ['{889F917D-AF3B-4A87-98EF-9043C29B33AB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager; P2: JViewExposureData; P3: JView): JViewExposureManager_f; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager$f')]
//  JViewExposureManager_f = interface(JLambda) // or JObject
//  ['{5219BC78-30C9-496F-AC81-7AE87C0A5413}']
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
  ['{7580134C-4C07-41C0-A0E2-E21416579148}']
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
//    {class} function access_getViewTreeChangeObserver_p(P1: JViewExposureManager): Jr0; cdecl;
//    {class} procedure access_setViewTreeChangeObserver_p(P1: JViewExposureManager; P2: Jr0); cdecl;

    { static Property }
    {class} property h: JViewExposureConfig read _Geth;
//    {class} property Companion: JViewExposureManager_a read _GetCompanion;
  end;

  [JavaSignature('com/bytedance/applog/exposure/ViewExposureManager')]
  JViewExposureManager = interface(JObject)
  ['{CE9C0C1E-5095-4DB2-945D-CC38628F6E40}']
    { Property Methods }
//    function _Geta: JWeakHashMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JWeakHashMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jr0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jr0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    property c: Jr0 read _Getc write _Setc;
    property d: JViewExposureConfig read _Getd write _Setd;
    property e: JHandler read _Gete write _Sete;
    property f: JRunnable read _Getf write _Setf;
//    property g: Jd read _Getg write _Setg;
  end;

  TJViewExposureManager = class(TJavaGenericImport<JViewExposureManagerClass, JViewExposureManager>) end;

  JGameReportHelperClass = interface(JObjectClass)
  ['{AF809C39-B126-4A45-BB43-0FDBD048688E}']
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
  ['{D873A943-96A8-4788-96A9-0F575036B297}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGameReportHelper = class(TJavaGenericImport<JGameReportHelperClass, JGameReportHelper>) end;

  JOhayooGameHelperClass = interface(JObjectClass)
  ['{E90B9479-CF79-455A-A6B9-C45AE9653014}']
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
  ['{12121524-22A0-46B2-9133-1EBF4D69B6AB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOhayooGameHelper = class(TJavaGenericImport<JOhayooGameHelperClass, JOhayooGameHelper>) end;

//  JUnityPlugin_aClass = interface(JObjectClass)
//  ['{FEB4C33D-9EB7-4A8C-B931-8B22FAC4FC34}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JUnityPlugin): JUnityPlugin_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/game/UnityPlugin$a')]
//  JUnityPlugin_a = interface(JObject)
//  ['{7B5182E3-D4E7-4014-95AB-27CF0336EDEB}']
//    { Property Methods }
//
//    { methods }
//    procedure log(P1: JString; P2: JThrowable); cdecl;
//
//    { Property }
//  end;

//  TJUnityPlugin_a = class(TJavaGenericImport<JUnityPlugin_aClass, JUnityPlugin_a>) end;

  JUnityPluginClass = interface(JObjectClass)
  ['{2F83D69D-250D-493B-B9EC-D738050876AE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnityPlugin; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/game/UnityPlugin')]
  JUnityPlugin = interface(JObject)
  ['{66F17768-7301-4F45-8DBF-3E7CBCF9FECE}']
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
  ['{C8A54A80-D465-44FE-9EEC-29D6DEDBD86A}']
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
  ['{9F59E6E5-4EF7-4696-991F-1FA1699C910D}']
    { Property Methods }
    function _GetgameResult: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetgameResult(agameResult: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property gameResult: JString read _GetgameResult write _SetgameResult;
  end;

  TJWhalerGameHelper_Result = class(TJavaGenericImport<JWhalerGameHelper_ResultClass, JWhalerGameHelper_Result>) end;

  JWhalerGameHelperClass = interface(JObjectClass)
  ['{4B2C7CCF-192E-40C7-B673-211F362C859A}']
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
  ['{1D4C8D94-74C8-4772-9829-1DF8E02F99FD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWhalerGameHelper = class(TJavaGenericImport<JWhalerGameHelperClass, JWhalerGameHelper>) end;

  JIActiveCustomParamsCallbackClass = interface(JObjectClass)
  ['{29CA6ACA-0C2F-473B-8C85-708CEB505C51}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IActiveCustomParamsCallback')]
  JIActiveCustomParamsCallback = interface(IJavaInstance)
  ['{CB3750F3-D57C-49E0-8530-92C64DAA936E}']
    { Property Methods }

    { methods }
    function getParams: JMap; cdecl;

    { Property }
  end;

  TJIActiveCustomParamsCallback = class(TJavaGenericImport<JIActiveCustomParamsCallbackClass, JIActiveCustomParamsCallback>) end;

  JIAppLogInstanceClass = interface(JObjectClass)
  ['{68A7112B-C180-40FC-BDEB-282F49E66986}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IAppLogInstance')]
  JIAppLogInstance = interface(IJavaInstance)
  ['{930427A1-E8E1-4580-8252-2643986A3128}']
    { Property Methods }

    { methods }
    function getAppId: JString; cdecl;
//    procedure receive(P1: Jj3); cdecl; overload;
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
//    function getEventFilterByClient: Js0; cdecl;
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
//    function getMonitor: Jz1; cdecl;
    procedure initWebViewBridge(P1: JView; P2: JString); cdecl;
    procedure bind(P1: JMap; P2: JIDBindCallback); cdecl;

    { Property }
  end;

  TJIAppLogInstance = class(TJavaGenericImport<JIAppLogInstanceClass, JIAppLogInstance>) end;

  JIDataObserverClass = interface(JObjectClass)
  ['{5291D5E4-2C6F-4889-9DDD-D38B47D2AF1C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IDataObserver')]
  JIDataObserver = interface(IJavaInstance)
  ['{13A73190-7F2B-4758-BC53-629BB3502C1A}']
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
  ['{5539EF38-E2E1-4F86-90D9-D3FF95732969}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IEventObserver')]
  JIEventObserver = interface(IJavaInstance)
  ['{F75966E6-4560-407E-B58B-9489D8F509FC}']
    { Property Methods }

    { methods }
    procedure onEvent(P1: JString; P2: JString; P3: JString; P4: Int64; P5: Int64; P6: JString); cdecl;
    procedure onEventV3(P1: JString; P2: JJSONObject); cdecl;

    { Property }
  end;

  TJIEventObserver = class(TJavaGenericImport<JIEventObserverClass, JIEventObserver>) end;

  JIExtraParamsClass = interface(JObjectClass)
  ['{2BF247F8-7ECE-497A-8770-C04457D11829}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IExtraParams')]
  JIExtraParams = interface(IJavaInstance)
  ['{F637592A-DA72-4EAA-A5A2-CA56296A05CC}']
    { Property Methods }

    { methods }
    function getExtraParams(P1: JLevel): JHashMap; cdecl;

    { Property }
  end;

  TJIExtraParams = class(TJavaGenericImport<JIExtraParamsClass, JIExtraParams>) end;

  JIHeaderCustomTimelyCallbackClass = interface(JObjectClass)
  ['{39CED658-0F84-46AE-8910-6012E2A7690F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IHeaderCustomTimelyCallback')]
  JIHeaderCustomTimelyCallback = interface(IJavaInstance)
  ['{E073BA3B-D17A-4D8D-978B-B02DF1679FD6}']
    { Property Methods }

    { methods }
    procedure updateHeader(P1: JJSONObject); cdecl;

    { Property }
  end;

  TJIHeaderCustomTimelyCallback = class(TJavaGenericImport<JIHeaderCustomTimelyCallbackClass, JIHeaderCustomTimelyCallback>) end;

  JILoggerClass = interface(JObjectClass)
  ['{9F75300E-CE28-4971-9ABE-2A22532DCCAC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/ILogger')]
  JILogger = interface(IJavaInstance)
  ['{E77BB7F2-5FA0-4B17-98A0-7F33364194AD}']
    { Property Methods }

    { methods }
    procedure log(P1: JString; P2: JThrowable); cdecl;

    { Property }
  end;

  TJILogger = class(TJavaGenericImport<JILoggerClass, JILogger>) end;

  JInitConfig_IpcDataCheckerClass = interface(JObjectClass)
  ['{5C46F773-6133-4EC5-B07C-D74D9261B2FC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/InitConfig$IpcDataChecker')]
  JInitConfig_IpcDataChecker = interface(IJavaInstance)
  ['{8708F49D-6294-47AB-80FB-0F8679168E5C}']
    { Property Methods }

    { methods }
    function checkIpcData(P1: TJavaObjectArray<JString>): Boolean; cdecl;

    { Property }
  end;

  TJInitConfig_IpcDataChecker = class(TJavaGenericImport<JInitConfig_IpcDataCheckerClass, JInitConfig_IpcDataChecker>) end;

  JInitConfigClass = interface(JObjectClass)
  ['{1E4CEAB7-0713-45C4-9937-38F38AEBB1DA}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JString): JInitConfig; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/InitConfig')]
  JInitConfig = interface(JObject)
  ['{8EB3D240-1A2E-41E1-9387-75BEC882512A}']
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
//    function _GetE: JINetworkClient;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetE(aE: JINetworkClient);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    function _Geta0: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
    function _Gett0: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sett0(at0: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function setLogger(P1: JILogger): JInitConfig; cdecl;
    function getLogger: JILogger; cdecl;
    function autoStart: Boolean; cdecl;
    function setAutoStart(P1: Boolean): JInitConfig; cdecl;
//    function setPreInstallChannelCallback(P1: Jc5): JInitConfig; cdecl;
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
//    function getUriConfig: JUriConfig; cdecl;
//    function setEncryptor(P1: JIEncryptor): JInitConfig; cdecl;
//    function getEncryptor: JIEncryptor; cdecl;
//    function setAnonymous(P1: Boolean): JInitConfig; cdecl;
//    function getAnonymous: Boolean; cdecl;
//    function setLocalTest(P1: Boolean): JInitConfig; cdecl;
//    function getLocalTest: Boolean; cdecl;
//    function setAccount(P1: JAccount): JInitConfig; cdecl;
//    function getAccount: JAccount; cdecl;
//    procedure clearDidAndIid(P1: JString); cdecl;
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
//    function getPreInstallCallback: Jc5; cdecl;
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
    function isIccIdEnabled: Boolean; cdecl;
    procedure setIccIdEnabled(P1: Boolean); cdecl;

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
//    property E: JINetworkClient read _GetE write _SetE;
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
//    property a0: JString read _Geta0 write _Seta0;
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
    property t0: Boolean read _Gett0 write _Sett0;
  end;

  TJInitConfig = class(TJavaGenericImport<JInitConfigClass, JInitConfig>) end;

  JIOaidObserver_OaidClass = interface(JObjectClass)
  ['{65A5372B-DCA2-402B-AC42-18466DD49F1A}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString): JIOaidObserver_Oaid; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IOaidObserver$Oaid')]
  JIOaidObserver_Oaid = interface(JObject)
  ['{A71D6D95-7DD6-4B13-92A9-10F7A9D5447A}']
    { Property Methods }
    function _Getid: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setid(aid: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property id: JString read _Getid write _Setid;
  end;

  TJIOaidObserver_Oaid = class(TJavaGenericImport<JIOaidObserver_OaidClass, JIOaidObserver_Oaid>) end;

  JIOaidObserverClass = interface(JObjectClass)
  ['{3DC79E32-F5A1-4CC4-8DDF-3AA976AFF9B8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IOaidObserver')]
  JIOaidObserver = interface(IJavaInstance)
  ['{72DCA4CF-DE1A-4602-B6C6-8615D294FB4B}']
    { Property Methods }

    { methods }
    procedure onOaidLoaded(P1: JIOaidObserver_Oaid); cdecl;

    { Property }
  end;

  TJIOaidObserver = class(TJavaGenericImport<JIOaidObserverClass, JIOaidObserver>) end;

  JIPageMetaClass = interface(JObjectClass)
  ['{A83B789D-9634-4274-865D-65086FD6B4E1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IPageMeta')]
  JIPageMeta = interface(IJavaInstance)
  ['{B178793C-389D-423C-879C-9652D31F6DB5}']
    { Property Methods }

    { methods }
    function path: JString; cdecl;
    function title: JString; cdecl;
    function pageProperties: JJSONObject; cdecl;

    { Property }
  end;

  TJIPageMeta = class(TJavaGenericImport<JIPageMetaClass, JIPageMeta>) end;

  JIPickerClass = interface(JObjectClass)
  ['{2C69C54B-E27E-4EBF-94A7-1C45CDD508DB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IPicker')]
  JIPicker = interface(IJavaInstance)
  ['{BC7C0110-5628-43C1-B4A6-1380F53BC49F}']
    { Property Methods }

    { methods }
    procedure setMarqueeCookie(P1: JString); cdecl;
    function getMarqueeCookie: JString; cdecl;

    { Property }
  end;

  TJIPicker = class(TJavaGenericImport<JIPickerClass, JIPicker>) end;

  JIPickerCallbackClass = interface(JObjectClass)
  ['{3BD81242-CC47-4437-9064-75CD3D092D92}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IPickerCallback')]
  JIPickerCallback = interface(IJavaInstance)
  ['{29F7FF1B-1987-4235-A189-905CD2228091}']
    { Property Methods }

    { methods }
    procedure success(P1: JJSONObject); cdecl;
    procedure failed(P1: JString); cdecl;

    { Property }
  end;

  TJIPickerCallback = class(TJavaGenericImport<JIPickerCallbackClass, JIPickerCallback>) end;

  JIPullAbTestConfigCallbackClass = interface(JObjectClass)
  ['{45F6CB3E-8681-47D4-A287-8F6A292D028B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/IPullAbTestConfigCallback')]
  JIPullAbTestConfigCallback = interface(IJavaInstance)
  ['{F3736FB1-5F09-4A06-9E87-8D14628139CD}']
    { Property Methods }

    { methods }
    procedure onRemoteConfig(P1: JJSONObject); cdecl;
    procedure onTimeoutError; cdecl;
    procedure onThrottle(P1: Int64); cdecl;

    { Property }
  end;

  TJIPullAbTestConfigCallback = class(TJavaGenericImport<JIPullAbTestConfigCallbackClass, JIPullAbTestConfigCallback>) end;

  JISensitiveInfoProviderClass = interface(JObjectClass)
  ['{84F683DD-D062-4878-8CB6-E48CCFD0C897}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/ISensitiveInfoProvider')]
  JISensitiveInfoProvider = interface(IJavaInstance)
  ['{7357F4B7-3A92-4DB7-8520-B0A2C5B93011}']
    { Property Methods }

    { methods }
    function getImsi: JString; cdecl;
    function getMac: JString; cdecl;

    { Property }
  end;

  TJISensitiveInfoProvider = class(TJavaGenericImport<JISensitiveInfoProviderClass, JISensitiveInfoProvider>) end;

  JISessionObserverClass = interface(JObjectClass)
  ['{0E46491E-4FF6-44E4-AB9F-717BEA145D75}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/ISessionObserver')]
  JISessionObserver = interface(IJavaInstance)
  ['{4B4DAB95-5C99-4672-9A62-81AFE4B8DFAD}']
    { Property Methods }

    { methods }
    procedure onSessionStart(P1: Int64; P2: JString); cdecl;
    procedure onSessionTerminate(P1: Int64; P2: JString; P3: JJSONObject); cdecl;
    procedure onSessionBatchEvent(P1: Int64; P2: JString; P3: JJSONObject); cdecl;

    { Property }
  end;

  TJISessionObserver = class(TJavaGenericImport<JISessionObserverClass, JISessionObserver>) end;

  JLevelClass = interface(JEnumClass) // or JObjectClass
  ['{2FA6CDBC-E9CD-434F-B93D-64D1AF07C092}']
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
  ['{9C8D7702-329E-4509-97BC-2A7A6B1C21E0}']
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
  ['{9C508C40-80D7-4070-BE9E-8A5D8145EBE9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMigrateDetectorActivity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/migrate/MigrateDetectorActivity')]
  JMigrateDetectorActivity = interface(JActivity) // or JObject
  ['{C7D1A0D1-24A8-4184-8130-2FA6B207B264}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMigrateDetectorActivity = class(TJavaGenericImport<JMigrateDetectorActivityClass, JMigrateDetectorActivity>) end;

  JINetworkClientClass = interface(JObjectClass)
  ['{33860D59-F683-4A26-AC8C-86F1E7667502}']
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
  ['{DB3C36ED-970C-4D02-8E70-4B65110B1F6C}']
    { Property Methods }

    { methods }
    function execute(P1: Byte; P2: JString; P3: JJSONObject; P4: JMap; P5: Byte; P6: Boolean; P7: Integer): TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJINetworkClient = class(TJavaGenericImport<JINetworkClientClass, JINetworkClient>) end;

  JRangersHttpExceptionClass = interface(JExceptionClass) // or JObjectClass
  ['{41FFD5F8-9D7B-499E-988E-23C49C1D1252}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: JString): JRangersHttpException; cdecl; overload;
    {class} function init(P1: Integer; P2: JThrowable): JRangersHttpException; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/network/RangersHttpException')]
  JRangersHttpException = interface(JException) // or JObject
  ['{9FB626EF-9D68-4224-B736-9958F6F36B27}']
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
  ['{01FE72C1-3059-481A-9529-787F102870A4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/oneid/IDBindCallback')]
  JIDBindCallback = interface(IJavaInstance)
  ['{659093AE-BB1F-460F-8702-8940FC4C3867}']
    { Property Methods }

    { methods }
    procedure onSuccess(P1: JIDBindResult); cdecl;
    procedure onFail(P1: Integer; P2: JString); cdecl;

    { Property }
  end;

  TJIDBindCallback = class(TJavaGenericImport<JIDBindCallbackClass, JIDBindCallback>) end;

  JIDBindResultClass = interface(JObjectClass)
  ['{7D367A01-AA9E-4AB6-A474-07833A72336B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JString): JIDBindResult; cdecl;
    {class} function copy_default(P1: JIDBindResult; P2: JString; P3: JString; P4: Integer; P5: JObject): JIDBindResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/oneid/IDBindResult')]
  JIDBindResult = interface(JObject)
  ['{E79A50D7-5540-4597-BA2C-0EAF2ACC5B02}']
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
//  ['{43CE1A4B-D4AF-442D-9ADA-2566EF39226E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JAnalyticsComponentRegistrar): JAnalyticsComponentRegistrar_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/onekit/AnalyticsComponentRegistrar$a')]
//  JAnalyticsComponentRegistrar_a = interface(JObject)
//  ['{F888946A-116F-4E8E-B1C1-43AC3F6C7936}']
//    { Property Methods }
//
//    { methods }
//    function create(P1: JComponentContainer): JObject; cdecl;
//
//    { Property }
//  end;

//  TJAnalyticsComponentRegistrar_a = class(TJavaGenericImport<JAnalyticsComponentRegistrar_aClass, JAnalyticsComponentRegistrar_a>) end;

  JAnalyticsComponentRegistrarClass = interface(JObjectClass)
  ['{6FFF46EF-9C50-4A2C-A59E-A32DFA3ADD5D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAnalyticsComponentRegistrar; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/onekit/AnalyticsComponentRegistrar')]
  JAnalyticsComponentRegistrar = interface(JObject)
  ['{8B1558BD-330C-4C26-89EE-9AF2EFE4B857}']
    { Property Methods }

    { methods }
    function getComponents: JList; cdecl;

    { Property }
  end;

  TJAnalyticsComponentRegistrar = class(TJavaGenericImport<JAnalyticsComponentRegistrarClass, JAnalyticsComponentRegistrar>) end;

//  JDeviceComponentRegistrar_aClass = interface(JObjectClass)
//  ['{E591CC97-1950-4A80-8571-494A9AC3E927}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDeviceComponentRegistrar): JDeviceComponentRegistrar_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/onekit/DeviceComponentRegistrar$a')]
//  JDeviceComponentRegistrar_a = interface(JObject)
//  ['{722CE879-6CE9-4346-9C42-5E9E0CD0566D}']
//    { Property Methods }
//
//    { methods }
//    function create(P1: JComponentContainer): JObject; cdecl;
//
//    { Property }
//  end;

//  TJDeviceComponentRegistrar_a = class(TJavaGenericImport<JDeviceComponentRegistrar_aClass, JDeviceComponentRegistrar_a>) end;

  JDeviceComponentRegistrarClass = interface(JObjectClass)
  ['{35DE4D9A-2592-4995-BC2F-518ADC832BD4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDeviceComponentRegistrar; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/onekit/DeviceComponentRegistrar')]
  JDeviceComponentRegistrar = interface(JObject)
  ['{1612C3DB-C8D2-4007-82D3-6D7BEF714FD1}']
    { Property Methods }

    { methods }
    function getComponents: JList; cdecl;

    { Property }
  end;

  TJDeviceComponentRegistrar = class(TJavaGenericImport<JDeviceComponentRegistrarClass, JDeviceComponentRegistrar>) end;

  JUserProfileCallbackClass = interface(JObjectClass)
  ['{E61EACF8-6636-49E6-83C8-FF0CAC18D6CB}']
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
  ['{9AF6266D-7A6D-41CA-9824-2942401C7EE2}']
    { Property Methods }

    { methods }
    procedure onSuccess; cdecl;
    procedure onFail(P1: Integer); cdecl;

    { Property }
  end;

  TJUserProfileCallback = class(TJavaGenericImport<JUserProfileCallbackClass, JUserProfileCallback>) end;

  JSimulateLaunchActivityClass = interface(JActivityClass) // or JObjectClass
  ['{4EA6574C-EE24-4F7A-B5E8-8D92E1179436}']
    { static Property Methods }
    {class} function _GetKEY_URL_PREFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_URL_PREFIX_NO_QR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEBUG_LOG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBIND_QUERY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_QR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_NO_QR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetentryAppId: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetentryMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetentryUrlPrefix: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetentryQrParam: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetentryType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSimulateLaunchActivity; cdecl;
    {class} procedure startSimulatorWithoutQR(P1: JContext; P2: JString); cdecl; overload;
    {class} procedure startSimulatorWithoutQR(P1: JContext; P2: JString; P3: JString); cdecl; overload;

    { static Property }
    {class} property KEY_URL_PREFIX: JString read _GetKEY_URL_PREFIX;
    {class} property KEY_URL_PREFIX_NO_QR: JString read _GetKEY_URL_PREFIX_NO_QR;
    {class} property DEBUG_LOG: JString read _GetDEBUG_LOG;
    {class} property BIND_QUERY: JString read _GetBIND_QUERY;
    {class} property MODE_QR: Integer read _GetMODE_QR;
    {class} property MODE_NO_QR: Integer read _GetMODE_NO_QR;
    {class} property entryAppId: JString read _GetentryAppId;
    {class} property entryMode: Integer read _GetentryMode;
    {class} property entryUrlPrefix: JString read _GetentryUrlPrefix;
    {class} property entryQrParam: JString read _GetentryQrParam;
    {class} property entryType: JString read _GetentryType;
  end;

  [JavaSignature('com/bytedance/applog/simulate/SimulateLaunchActivity')]
  JSimulateLaunchActivity = interface(JActivity) // or JObject
  ['{6EDB966E-A4A8-459E-BE51-D2A40BE12864}']
    { Property Methods }
//    function _Geta: JTextView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JTextView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure onCreate(P1: JBundle); cdecl;
    procedure onDestroy; cdecl;
    function pageProperties: JJSONObject; cdecl;
    function title: JString; cdecl;
    function path: JString; cdecl;
//    function a: JIAppLogLogger; cdecl;
//
//    { Property }
//    property a: JTextView read _Geta write _Seta;
  end;

  TJSimulateLaunchActivity = class(TJavaGenericImport<JSimulateLaunchActivityClass, JSimulateLaunchActivity>) end;

//  JUriConfig_aClass = interface(JObjectClass)
//  ['{5E014D63-901F-41C4-B457-1D73B9E9D308}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/UriConfig$a')]
//  JUriConfig_a = interface(JObject)
//  ['{4AED5542-B42C-4F95-9F18-71DE8C1FEFE0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJUriConfig_a = class(TJavaGenericImport<JUriConfig_aClass, JUriConfig_a>) end;

  JUriConfig_BuilderClass = interface(JObjectClass)
  ['{C614480B-C70E-47CC-BB68-EC17CBD34744}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUriConfig_Builder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/applog/UriConfig$Builder')]
  JUriConfig_Builder = interface(JObject)
  ['{A9545E16-0DE6-4E1B-9CCE-1EC4E6509B5E}']
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
  ['{7F4D3E5B-94E4-4141-8433-6D21E77CE337}']
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
  ['{32A00870-CF66-468C-8808-88F19813DEB6}']
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
  ['{0F560534-BCC2-4A29-BAAA-B281750D4B0D}']
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
  ['{EB6E1B0C-99AF-4394-940D-836BB0F0D9CA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGeoCoordinateSystemConst = class(TJavaGenericImport<JGeoCoordinateSystemConstClass, JGeoCoordinateSystemConst>) end;

//  JHardwareUtils_aClass = interface(JObjectClass)
//  ['{998BA097-E2D1-4F12-AED9-C0A095863577}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JHardwareUtils_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/HardwareUtils$a')]
//  JHardwareUtils_a = interface(JObject)
//  ['{4CDC21F6-9371-4B14-8DC3-4EBEB6BFC3AE}']
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
  ['{E224F83D-C0B3-4613-B113-E1427A22CCF0}']
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
  ['{2C5CCB18-34C1-4F77-8030-129B2EA95149}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHardwareUtils = class(TJavaGenericImport<JHardwareUtilsClass, JHardwareUtils>) end;

//  JSensitiveUtils_aClass = interface(JObjectClass)
//  ['{4A2D55B3-507A-48F1-AAD2-49A9441F15C1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JSensitiveUtils_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/SensitiveUtils$a')]
//  JSensitiveUtils_a = interface(JObject)
//  ['{AA4CEBA5-A471-4D0B-9C4B-6EFA6DF2B5E6}']
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
//  ['{864F65F1-BBC4-4944-AC48-59DC805AD600}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JSensitiveUtils_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/SensitiveUtils$b')]
//  JSensitiveUtils_b = interface(JObject)
//  ['{37CC897B-CAA3-44D7-A8D3-7DF0B5D9EC8C}']
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
//  ['{77896446-8F96-4895-BD7D-07B4F054D3A9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JSensitiveUtils_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/SensitiveUtils$c')]
//  JSensitiveUtils_c = interface(JObject)
//  ['{FB523E52-0A46-4F58-90CB-9B554DFDB399}']
//    { Property Methods }
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//  end;

//  TJSensitiveUtils_c = class(TJavaGenericImport<JSensitiveUtils_cClass, JSensitiveUtils_c>) end;

//  JSensitiveUtils_dClass = interface(JObjectClass)
//  ['{39002B58-A81D-45E5-A2C5-84388518AE99}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JSensitiveUtils_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/SensitiveUtils$d')]
//  JSensitiveUtils_d = interface(JObject)
//  ['{F6149F5A-8442-4858-82CA-DB68BF8126EC}']
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
//  ['{7D334D44-24F5-491B-A63B-65B2DC98E47D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): JSensitiveUtils_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/SensitiveUtils$e')]
//  JSensitiveUtils_e = interface(JObject)
//  ['{A7904901-F6FE-4992-B0B6-1D8C0FAC99F0}']
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
  ['{A3B46C8F-A9E1-4931-A2E6-5ABB04CE30D9}']
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
//    {class} function a(P1: JContext; P2: Integer): JString; cdecl; overload;
    {class} function getSerialNumber(P1: JContext): JString; cdecl;
//    {class} procedure appendSensitiveParams(P1: Jg3; P2: JJSONObject; P3: JMap; P4: Boolean; P5: JLevel); cdecl;
//    {class} procedure addSensitiveParamsForUrlQuery(P1: Jg3; P2: JStringBuilder; P3: JJSONObject); cdecl;
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
  ['{0F08A7DF-9BC4-475E-9790-B4F5CCDFBFA8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSensitiveUtils = class(TJavaGenericImport<JSensitiveUtilsClass, JSensitiveUtils>) end;

  JUriConstantsClass = interface(JObjectClass)
  ['{6B894B36-B91A-4D0D-8C5A-4EDF437307DD}']
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
  ['{366E5179-B927-41F7-A515-9892A7690FFC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUriConstants = class(TJavaGenericImport<JUriConstantsClass, JUriConstants>) end;

//  JWebViewJsUtil_aClass = interface(JObjectClass)
//  ['{DF52C562-7607-4D93-9E5E-E0307BB00A83}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHandler; P2: JWebView): JWebViewJsUtil_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$a')]
//  JWebViewJsUtil_a = interface(JObject)
//  ['{C1E14EDC-82D1-4464-AFA7-E26A473542DE}']
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
//  ['{AA3A9954-C1AE-4A76-9E14-18FCC6785E0F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JWebViewJsUtil_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$b')]
//  JWebViewJsUtil_b = interface(JObject)
//  ['{C6825BD4-7605-40C2-8F66-BEC8CA5C69AF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJWebViewJsUtil_b = class(TJavaGenericImport<JWebViewJsUtil_bClass, JWebViewJsUtil_b>) end;

//  JWebViewJsUtil_cClass = interface(JObjectClass)
//  ['{62419E71-AB94-4F5D-974F-4612946282D7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JWebViewJsUtil_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$c')]
//  JWebViewJsUtil_c = interface(JObject)
//  ['{80F1916D-8273-475D-8480-46DD6A90942A}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl;
//
//    { Property }
//  end;

//  TJWebViewJsUtil_c = class(TJavaGenericImport<JWebViewJsUtil_cClass, JWebViewJsUtil_c>) end;

//  JWebViewJsUtil_dClass = interface(JObjectClass)
//  ['{F1DDF301-3835-424D-BB80-9B0CDEB1DE2E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JWebViewJsUtil_g): JWebViewJsUtil_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$d')]
//  JWebViewJsUtil_d = interface(JObject)
//  ['{124526B5-470B-4520-A80B-8040A317204E}']
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
//  ['{4B6C56D0-7448-48EA-B618-EB054A4B4744}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JWebViewJsUtil_g): JWebViewJsUtil_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$e')]
//  JWebViewJsUtil_e = interface(JObject)
//  ['{CF921A15-C7BA-475D-9C82-1E2D5B2EAD92}']
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
//  ['{6ED212A2-5595-4746-84E6-B3AB1A7A65F6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JString; P3: Boolean; P4: JJSONObject): JWebViewJsUtil_f; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$f')]
//  JWebViewJsUtil_f = interface(JObject)
//  ['{9C693F73-C926-4E01-9D0B-302010A07AE6}']
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
//    function a: Jj3; cdecl;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: Boolean read _Getc write _Setc;
//    property d: JJSONObject read _Getd write _Setd;
//  end;

//  TJWebViewJsUtil_f = class(TJavaGenericImport<JWebViewJsUtil_fClass, JWebViewJsUtil_f>) end;

//  JWebViewJsUtil_gClass = interface(JObjectClass)
//  ['{8E5BC694-8DDB-48C0-9AE3-A11C3AA5E0CA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/applog/util/WebViewJsUtil$g')]
//  JWebViewJsUtil_g = interface(IJavaInstance)
//  ['{CF6B6353-DBE3-4034-A4EF-0A5D55509E1A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJWebViewJsUtil_g = class(TJavaGenericImport<JWebViewJsUtil_gClass, JWebViewJsUtil_g>) end;

//  JWebViewJsUtil_hClass = interface(JObjectClass)
//  ['{D038AC79-C917-4C13-B5EF-2C12702372DC}']
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
//  ['{A748018B-E948-424D-9BAA-B8423E08FEB1}']
//    { Property Methods }
//
//    { methods }
//    procedure postMessage(P1: JString); cdecl;
//
//    { Property }
//  end;

//  TJWebViewJsUtil_h = class(TJavaGenericImport<JWebViewJsUtil_hClass, JWebViewJsUtil_h>) end;

  JWebViewJsUtilClass = interface(JObjectClass)
  ['{6FD5C231-88C4-4911-8991-56F48AB4636B}']
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
//    {class} function create(P1: JString; P2: JString; P3: Boolean; P4: JJSONObject): Jq3; cdecl;
    {class} function access_000: JList; cdecl;
    {class} procedure access_100(P1: JString); cdecl;
//    {class} function access_300(P1: JString; P2: JString; P3: Boolean; P4: JJSONObject): Jq3; cdecl;
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
  ['{437BD666-F83A-4C4C-AB25-0DFFDF4C1008}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWebViewJsUtil = class(TJavaGenericImport<JWebViewJsUtilClass, JWebViewJsUtil>) end;

//  JaClass = interface(JObjectClass)
//  ['{B5D565E2-09B6-40FB-B06A-6347B3FE0B35}']
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
//  ['{7260955B-A9CF-4724-A828-6A12FA0B8057}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  Ja0Class = interface(JObjectClass)
//  ['{E4AAC505-F224-4760-9A94-08F80CA9E740}']
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
//  ['{CAFAB107-28C3-4653-88A8-095A5A9643ED}']
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

//  Ja1_aClass = interface(JObjectClass)
//  ['{6462305D-4061-43B0-BD7D-D61AC0A9A488}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JObject): Ja1_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a1$a')]
//  Ja1_a = interface(JObject)
//  ['{E2DC0EE0-9264-40B0-86C2-1C1DAED548C4}']
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

//  TJa1_a = class(TJavaGenericImport<Ja1_aClass, Ja1_a>) end;

//  Ja1Class = interface(JObjectClass)
//  ['{92352ED2-F835-443F-985D-0BCBBC2FB25E}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JBoolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a(P1: JString; P2: JEventBus_DataFetcher); cdecl; overload;
//    {class} procedure a(P1: JString; P2: JObject); cdecl; overload;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a: Boolean; cdecl; overload;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: JBoolean read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a1')]
//  Ja1 = interface(JObject)
//  ['{5456FC33-7E9A-490A-81B3-1F8DEBE8FB4B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1 = class(TJavaGenericImport<Ja1Class, Ja1>) end;

//  Ja2_aClass = interface(JLambdaClass) // or JObjectClass
//  ['{E6EB59FE-B128-4231-B498-9DD50FC2F787}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JLooper): Ja2_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a2$a')]
//  Ja2_a = interface(JLambda) // or JObject
//  ['{651AD69D-A968-4E47-8EFA-F7C3BB8C1828}']
//    { Property Methods }
//    function _Geta: JLooper;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JLooper);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function invoke: JObject; cdecl;
//
//    { Property }
//    property a: JLooper read _Geta write _Seta;
//  end;

//  TJa2_a = class(TJavaGenericImport<Ja2_aClass, Ja2_a>) end;

//  Ja2_bClass = interface(JObjectClass)
//  ['{659EC2E2-05D7-4AE0-B199-60DB753BFB6F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JFunction1): Ja2_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a2$b')]
//  Ja2_b = interface(JObject)
//  ['{D717ED3A-CB2A-449B-82D8-6A91FDC25CB3}']
//    { Property Methods }
//    function _Geta: JFunction1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JFunction1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onFinish(P1: JList); cdecl;
//
//    { Property }
//    property a: JFunction1 read _Geta write _Seta;
//  end;

//  TJa2_b = class(TJavaGenericImport<Ja2_bClass, Ja2_b>) end;

//  Ja2_cClass = interface(JLambdaClass) // or JObjectClass
//  ['{CBE4DE47-BC66-4D67-93BB-FE16EA2CDF04}']
//    { static Property Methods }
//    {class} function _Geta: Ja2_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Ja2_c; cdecl; overload;
//    {class} function init: Ja2_c; cdecl; overload;
//
//    { static Property }
//    {class} property a: Ja2_c read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a2$c')]
//  Ja2_c = interface(JLambda) // or JObject
//  ['{7177F3AD-924A-4A17-975E-3669C509E831}']
//    { Property Methods }
//
//    { methods }
//    function invoke: JObject; cdecl;
//
//    { Property }
//  end;

//  TJa2_c = class(TJavaGenericImport<Ja2_cClass, Ja2_c>) end;

//  Ja2Class = interface(JObjectClass)
//  ['{E0721A40-3200-4015-A127-7BB83F0EC314}']
//    { static Property Methods }
//    {class} function _Getc: TJavaObjectArray<JKProperty>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Ja2; cdecl; overload;
//    {class} function init(P1: JLooper): Ja2; cdecl; overload;
//
//    { static Property }
//    {class} property c: TJavaObjectArray<JKProperty> read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a2')]
//  Ja2 = interface(JObject)
//  ['{5C61C02F-A977-4806-9C85-67EBCF79FA02}']
//    { Property Methods }
//    function _Geta: JLazy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JLazy);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JLazy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JLazy);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Jg2): JIMetricsTracker; cdecl; overload;
//    procedure a(P1: JFunction1); cdecl; overload;
//
//    { Property }
//    property a: JLazy read _Geta write _Seta;
//    property b: JLazy read _Getb write _Setb;
//  end;

//  TJa2 = class(TJavaGenericImport<Ja2Class, Ja2>) end;

//  Ja3_aClass = interface(JObjectClass)
//  ['{67512AB9-4772-4059-B8B5-ADBB44861432}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: JJSONObject; P3: JUserProfileCallback): Ja3_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a3$a')]
//  Ja3_a = interface(JObject)
//  ['{6B8C02F4-7234-4912-AB5A-E791DF98F7E4}']
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

//  TJa3_a = class(TJavaGenericImport<Ja3_aClass, Ja3_a>) end;

//  Ja3Class = interface(JObjectClass)
//  ['{A8777D1E-0C4A-4038-A036-F401B8D6DC18}']
//    { static Property Methods }
//    {class} function _Geta: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: TJavaArray<Int64>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a(P1: Jc0; P2: Integer; P3: JJSONObject; P4: JUserProfileCallback; P5: JHandler; P6: Boolean); cdecl;
//    {class} function init: Ja3; cdecl;
//
//    { static Property }
//    {class} property a: TJavaObjectArray<JString> read _Geta;
//    {class} property b: TJavaObjectArray<JString> read _Getb;
//    {class} property c: TJavaArray<Integer> read _Getc;
//    {class} property d: TJavaArray<Int64> read _Getd;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a3')]
//  Ja3 = interface(JObject)
//  ['{9CCF583A-BDA2-4541-A9CC-5B52146DB1A3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa3 = class(TJavaGenericImport<Ja3Class, Ja3>) end;

//  Ja4Class = interface(JObjectClass)
//  ['{B54D43C4-3195-4647-BE6D-A4A806C11B5F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb4): Ja4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a4')]
//  Ja4 = interface(JObject)
//  ['{8FA17632-188A-4A4F-8F3A-450DEFA2B9CD}']
//    { Property Methods }
//    function _Geta: Jb4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jb4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jb4 read _Geta write _Seta;
//  end;

//  TJa4 = class(TJavaGenericImport<Ja4Class, Ja4>) end;

//  Ja5Class = interface(JObjectClass)
//  ['{531E9353-526F-4113-B2E5-7784CA2AC047}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JString; P3: JBoolean; P4: JLong; P5: JLong; P6: JInteger; P7: JLong): Ja5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/a5')]
//  Ja5 = interface(JObject)
//  ['{BA97CB8D-3DF8-4FDE-8A86-E5EBEBD10446}']
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

//  TJa5 = class(TJavaGenericImport<Ja5Class, Ja5>) end;

//  Jb_aClass = interface(JObjectClass)
//  ['{FE65C2BA-BB19-4A78-A3FE-8D41796EE44D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b$a')]
//  Jb_a = interface(JObject)
//  ['{5FC86C91-B3BF-4091-9631-092DC606AE70}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  Jb_bClass = interface(JObjectClass)
//  ['{6F931708-2BF2-43D5-9B66-E3BBE981255E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b$b')]
//  Jb_b = interface(JObject)
//  ['{489A7903-10F9-44ED-9E74-4E58B7A9F718}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJb_b = class(TJavaGenericImport<Jb_bClass, Jb_b>) end;

//  Jb_cClass = interface(JObjectClass)
//  ['{15E3F61F-2625-4F2F-A6E8-CC41A0BF9227}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b$c')]
//  Jb_c = interface(IJavaInstance)
//  ['{340DACDF-0774-4971-955B-A6B8593956A6}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jd); cdecl;
//
//    { Property }
//  end;

//  TJb_c = class(TJavaGenericImport<Jb_cClass, Jb_c>) end;

//  Jb_dClass = interface(JObjectClass)
//  ['{F5BDA260-6911-48AE-8DC6-F90F64AB54F2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b$d')]
//  Jb_d = interface(IJavaInstance)
//  ['{6B130A5A-8DCA-4BD0-8E8C-4A995830683C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJb_d = class(TJavaGenericImport<Jb_dClass, Jb_d>) end;

//  Jb_eClass = interface(JObjectClass)
//  ['{02F23832-8367-4620-B37B-B1807F4DBB24}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b$e')]
//  Jb_e = interface(IJavaInstance)
//  ['{9EC41F3E-C668-4BF8-8576-FC3865EF0BCC}']
//    { Property Methods }
//
//    { methods }
//    function a: Jj3; cdecl;
//
//    { Property }
//  end;

//  TJb_e = class(TJavaGenericImport<Jb_eClass, Jb_e>) end;

//  JbClass = interface(JObjectClass)
//  ['{1B12AAB6-C817-4D17-998D-424770570162}']
//    { static Property Methods }
//    {class} function _Geta: Jb_d;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jb_d;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function b(P1: JString): Boolean; cdecl;
//    {class} function a(P1: JString): Jd; cdecl; overload;
//    {class} procedure a(P1: TJavaObjectArray<JString>); cdecl; overload;
//    {class} procedure a(P1: Jj3; P2: Jb_d); cdecl; overload;
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
//  ['{CBD72E2C-515C-4BBB-927F-2AF2FFAC13E1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  Jb0_aClass = interface(JObjectClass)
//  ['{4B9C0ED5-537A-4DA6-8614-0EC0879BD6C4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb0; P2: JJSONObject): Jb0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b0$a')]
//  Jb0_a = interface(JObject)
//  ['{50F69FCA-7A79-4CF7-8852-63DEC8461608}']
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
//  ['{6270466D-2123-4BB6-8A8D-9B7525D7C8AF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jb0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b0')]
//  Jb0 = interface(Ja0) // or JObject
//  ['{3C1A33B4-DFAB-4AC4-A549-9C5F7ED0FFFB}']
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

//  Jb1Class = interface(Jd1Class) // or JObjectClass
//  ['{E6FAFC65-77A1-490F-ABD3-0DF374C9F99B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jb1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b1')]
//  Jb1 = interface(Jd1) // or JObject
//  ['{1D93E4B3-880B-47C1-89B6-D5450A32B903}']
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

//  TJb1 = class(TJavaGenericImport<Jb1Class, Jb1>) end;

//  Jb2Class = interface(JObjectClass)
//  ['{69CF8259-E6CD-4D97-9AEE-473E6032AD1D}']
//    { static Property Methods }
//    {class} function _Geta: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jb2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function b(P1: JInitConfig): JObject; cdecl;
//    {class} function a(P1: JInitConfig): Boolean; cdecl;
//    {class} function init: Jb2; cdecl; overload;
//    {class} function init: Jb2; cdecl; overload;
//
//    { static Property }
//    {class} property a: JMap read _Geta;
//    {class} property b: Jb2 read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b2')]
//  Jb2 = interface(JObject)
//  ['{F44B9EDE-0EA4-4761-AD66-CD147A0B37B8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb2 = class(TJavaGenericImport<Jb2Class, Jb2>) end;

//  Jb3Class = interface(JObjectClass)
//  ['{31FE781C-FFF5-4420-91EA-C165EBAEE3CF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd3; P2: Integer): Jb3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b3')]
//  Jb3 = interface(JObject)
//  ['{6DF80DFF-8024-4C55-B560-160B44A22CD4}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Jd3 read _Getb write _Setb;
//  end;

//  TJb3 = class(TJavaGenericImport<Jb3Class, Jb3>) end;

//  Jb4Class = interface(JObjectClass)
//  ['{5F8BC1A1-99AF-4FB4-AE10-C7D1D7A0E450}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b4')]
//  Jb4 = interface(JObject)
//  ['{2932A29D-1609-4F85-9941-87131CB18C03}']
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

//  TJb4 = class(TJavaGenericImport<Jb4Class, Jb4>) end;

//  Jb5Class = interface(JObjectClass)
//  ['{8A89F833-83A9-4EBA-B942-28ECB8560DAD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jb5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/b5')]
//  Jb5 = interface(JObject)
//  ['{E1047288-AD86-4334-9C29-BC926E79D9D3}']
//    { Property Methods }
//    function _Geta: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Ja5); cdecl; overload;
//    function a: Ja5; cdecl; overload;
//
//    { Property }
//    property a: JSharedPreferences read _Geta write _Seta;
//  end;

//  TJb5 = class(TJavaGenericImport<Jb5Class, Jb5>) end;

//  Jc_aClass = interface(JObjectClass)
//  ['{B0720F21-294A-4354-BA67-DAFB7BB799D3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc; P2: Jd): Jc_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c$a')]
//  Jc_a = interface(JObject)
//  ['{078C27E6-A35E-44E2-8DE3-FCC5671227CB}']
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
//  ['{E6EA7720-EAD3-439E-9CD7-ACC4BB15F9B0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c')]
//  Jc = interface(JObject)
//  ['{FFE264F2-1516-410E-82E9-B01701FC9819}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jd); cdecl;
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  Jc0_aClass = interface(JObjectClass)
//  ['{90B42640-9447-4F89-A8A5-AEE1D906E3D3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jc0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c0$a')]
//  Jc0_a = interface(JObject)
//  ['{F57988BA-32D2-4E20-90FE-121C2787FAF9}']
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
//  ['{02EE158A-F4BE-412A-9C74-1B81711CAD96}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jc0_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c0$b')]
//  Jc0_b = interface(JObject)
//  ['{09D3ACFC-7D48-4DA4-B477-1B4FC81044B5}']
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
//  ['{8197CE19-30E8-4B07-82C6-E6FAA8EBCD0B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: JObject): Jc0_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c0$c')]
//  Jc0_c = interface(JObject)
//  ['{4677DC2D-9743-4395-8A23-4C9DA9A716EF}']
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
//  ['{CB2A6B08-5AAD-4936-B1B7-42C4A8F411CE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: JString): Jc0_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c0$d')]
//  Jc0_d = interface(Jc0_c) // or JObject
//  ['{9359118B-DD7F-4CFC-8449-8589A83DBD0A}']
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
//  ['{F5ACF369-5268-4E1E-A173-5B4C2F6F7AA1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Ji1; P3: Jk1; P4: Jc1): Jc0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c0')]
//  Jc0 = interface(JObject)
//  ['{602F2624-FE67-49A8-A0D2-D0C4DE43527A}']
//    { Property Methods }
//    function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jz;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jz);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jb0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jb0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Jp3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Jp3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Jk1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jk1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    function _Getq: Jz1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Jz1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    function _Gety: Js0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: Js0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getz: JInitConfig_IpcDataChecker;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setz(az: JInitConfig_IpcDataChecker);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetA: Jz2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetA(aA: Jz2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetB: Ji;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetB(aB: Ji);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetC: Jc1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetC(aC: Jc1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetD: Jd0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetD(aD: Jd0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetE: Jt2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetE(aE: Jt2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function d: JString; cdecl; overload;
//    function b: JContext; cdecl; overload;
//    procedure a(P1: JLong); cdecl; overload;
//    function c: Jp3; cdecl; overload;
//    function e: JUriConfig; cdecl; overload;
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//    function a(P1: Boolean): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//    procedure a(P1: TJavaObjectArray<JString>; P2: Boolean); cdecl; overload;
//    function g: Boolean; cdecl;
//    procedure b(P1: Jj3); cdecl; overload;
//    procedure a(P1: Jj3); cdecl; overload;
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
//    property e: Ji1 read _Gete write _Sete;
//    property f: Jb0 read _Getf write _Setf;
//    property g: JArrayList read _Getg write _Setg;
//    property h: Jp3 read _Geth write _Seth;
//    property i: Jk1 read _Geti write _Seti;
//    property j: JHandler read _Getj write _Setj;
//    property k: Jf0 read _Getk write _Setk;
//    property l: Jg0 read _Getl write _Setl;
//    property m: Jy read _Getm write _Setm;
//    property n: Jh0 read _Getn write _Setn;
//    property o: JUriConfig read _Geto write _Seto;
//    property p: JHandler read _Getp write _Setp;
//    property q: Jz1 read _Getq write _Setq;
//    property r: Boolean read _Getr write _Setr;
//    property s: Ja0 read _Gets write _Sets;
//    property t: Je0 read _Gett write _Sett;
//    property u: JArrayList read _Getu write _Setu;
//    property v: Boolean read _Getv write _Setv;
//    property w: Int64 read _Getw write _Setw;
//    property x: JList read _Getx write _Setx;
//    property y: Js0 read _Gety write _Sety;
//    property z: JInitConfig_IpcDataChecker read _Getz write _Setz;
//    property A: Jz2 read _GetA write _SetA;
//    property B: Ji read _GetB write _SetB;
//    property C: Jc1 read _GetC write _SetC;
//    property D: Jd0 read _GetD write _SetD;
//    property E: Jt2 read _GetE write _SetE;
//  end;

//  TJc0 = class(TJavaGenericImport<Jc0Class, Jc0>) end;

//  Jc1Class = interface(JObjectClass)
//  ['{3E8F76BD-7544-4BE3-ACD9-D0BB878D04AA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c1')]
//  Jc1 = interface(JObject)
//  ['{0289BC4C-F3FF-4219-A470-FEDCB3B36C5D}']
//    { Property Methods }
//    function _Geta: JLinkedList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JLinkedList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JLinkedList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JLinkedList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Jj3); cdecl; overload;
//    procedure a(P1: TJavaObjectArray<JString>); cdecl; overload;
//    function a(P1: JArrayList): Integer; cdecl; overload;
//
//    { Property }
//    property a: JLinkedList read _Geta write _Seta;
//    property b: JLinkedList read _Getb write _Setb;
//  end;

//  TJc1 = class(TJavaGenericImport<Jc1Class, Jc1>) end;

//  Jc2Class = interface(JLambdaClass) // or JObjectClass
//  ['{30946BB1-93BC-47D0-9E02-582336C1AE21}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd2): Jc2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c2')]
//  Jc2 = interface(JLambda) // or JObject
//  ['{65D5A0C7-3583-4618-A471-9C0B608976BA}']
//    { Property Methods }
//    function _Geta: Jd2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jd2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function invoke(P1: JObject): JObject; cdecl;
//
//    { Property }
//    property a: Jd2 read _Geta write _Seta;
//  end;

//  TJc2 = class(TJavaGenericImport<Jc2Class, Jc2>) end;

//  Jc3Class = interface(JObjectClass)
//  ['{FDDE7B9D-228B-4614-A2D8-983B255EE96B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd3): Jc3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c3')]
//  Jc3 = interface(JObject)
//  ['{042BC043-DDEE-460B-8319-159E8B7718BA}']
//    { Property Methods }
//    function _Geta: Jd3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jd3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jd3 read _Geta write _Seta;
//  end;

//  TJc3 = class(TJavaGenericImport<Jc3Class, Jc3>) end;

//  Jc4Class = interface(JObjectClass)
//  ['{B272AFA2-6363-4DE8-9152-C334C7CB6356}']
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
//    {class} function init(P1: Jd; P2: JContext; P3: Ji1; P4: Ji3): Jc4; cdecl;
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

//  [JavaSignature('com/bytedance/bdtracker/c4')]
//  Jc4 = interface(JObject)
//  ['{94ED1DCB-B844-4DFE-B2F0-A76ED3ED97C4}']
//    { Property Methods }
//    function _Geta: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jk3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jk3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Ji3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Ji3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    property b: Jk3 read _Getb write _Setb;
//    property c: Ji3 read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: Jd read _Gete write _Sete;
//    property f: Ji1 read _Getf write _Setf;
//    property g: JList read _Getg write _Setg;
//  end;

//  TJc4 = class(TJavaGenericImport<Jc4Class, Jc4>) end;

//  Jc5Class = interface(JObjectClass)
//  ['{563F91E6-A286-4645-AB14-67EE6625ABA3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/c5')]
//  Jc5 = interface(IJavaInstance)
//  ['{E6B43BC6-9B9E-4E5C-91EE-45B8C16D68B9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc5 = class(TJavaGenericImport<Jc5Class, Jc5>) end;

//  Jd_aClass = interface(JObjectClass)
//  ['{345073A3-71ED-4674-B10C-8676F744F108}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Boolean): Jd_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d$a')]
//  Jd_a = interface(JObject)
//  ['{57BC2195-998F-4093-A63A-E736117BB553}']
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
//  ['{2BD2A007-93D7-4FBF-820B-9F1A4B394843}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Boolean): Jd_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d$b')]
//  Jd_b = interface(JObject)
//  ['{150A0937-530E-48F5-B3C5-0D75D2FADD90}']
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
//  ['{3DF1961B-AD27-41CB-A138-477D7C980707}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Boolean): Jd_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d$c')]
//  Jd_c = interface(JObject)
//  ['{2FED79FF-B25E-449C-B4B2-F19A3E5F0EA2}']
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
//  ['{A8DD231B-EED6-49FB-8710-7B9BF52D80A5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Boolean): Jd_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d$d')]
//  Jd_d = interface(JObject)
//  ['{C5BCEA2A-55E2-455C-BB30-8D93EFE147DB}']
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
//  ['{6B50CAC4-C301-47CC-AB20-4BFA9EA04ABE}']
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
//  ['{E11B7F34-51FE-4D74-BF75-800C4B72C753}']
//    { Property Methods }
//    function _Geta: JConcurrentHashMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JConcurrentHashMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jx0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jx0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jw0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jw0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jn1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jn1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Jc1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jc1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Jg3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Jg3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getk: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setk(ak: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getl: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: JApplication;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: JApplication);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: Jk1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: Jk1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    function _Getw: Js0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setw(aw: Js0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getx: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setx(ax: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gety: Jv0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sety(ay: Jv0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    function _GetH: Jh4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetH(aH: Jh4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _GetI: Jh4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _SetI(aI: Jh4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure init(P1: JContext; P2: JInitConfig); cdecl; overload;
//    procedure init(P1: JContext; P2: JInitConfig; P3: JActivity); cdecl; overload;
//    function toString: JString; cdecl;
//    function getAppId: JString; cdecl;
//    procedure receive(P1: Jj3); cdecl; overload;
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
//    function getEventFilterByClient: Js0; cdecl;
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
//    function getMonitor: Jz1; cdecl;
//    procedure initWebViewBridge(P1: JView; P2: JString); cdecl;
//    function c: Jn1; cdecl;
//    function getViewExposureManager: JViewExposureManager; cdecl;
//    function d: Boolean; cdecl;
//    procedure e; cdecl;
//    procedure a(P1: JObject; P2: JJSONObject); cdecl; overload;
//    function b: Boolean; cdecl;
//    function a: Boolean; cdecl; overload;
//    procedure a(P1: JString; P2: JString; P3: Int64); cdecl; overload;
//
//    { Property }
//    property a: JConcurrentHashMap read _Geta write _Seta;
//    property b: Jx0 read _Getb write _Setb;
//    property c: Jw0 read _Getc write _Setc;
//    property d: Jn1 read _Getd write _Setd;
//    property e: Jc1 read _Gete write _Sete;
//    property f: JSet read _Getf write _Setf;
//    property g: JSet read _Getg write _Setg;
//    property h: JSet read _Geth write _Seth;
//    property i: JMap read _Geti write _Seti;
//    property j: Jg3 read _Getj write _Setj;
//    property k: Je3 read _Getk write _Setk;
//    property l: Integer read _Getl write _Setl;
//    property m: JString read _Getm write _Setm;
//    property n: JApplication read _Getn write _Setn;
//    property o: Ji1 read _Geto write _Seto;
//    property p: Jk1 read _Getp write _Setp;
//    property q: Jc0 read _Getq write _Setq;
//    property r: Jv read _Getr write _Setr;
//    property s: JViewExposureManager read _Gets write _Sets;
//    property t: JINetworkClient read _Gett write _Sett;
//    property u: Boolean read _Getu write _Setu;
//    property v: JIHeaderCustomTimelyCallback read _Getv write _Setv;
//    property w: Js0 read _Getw write _Setw;
//    property x: Boolean read _Getx write _Setx;
//    property y: Jv0 read _Gety write _Sety;
//    property z: JIALinkListener read _Getz write _Setz;
//    property A: JIActiveCustomParamsCallback read _GetA write _SetA;
//    property B: Jr read _GetB write _SetB;
//    property C: JIEventHandler read _GetC write _SetC;
//    property D: JIAppLogLogger read _GetD write _SetD;
//    property E: Boolean read _GetE write _SetE;
//    property F: Int64 read _GetF write _SetF;
//    property G: Boolean read _GetG write _SetG;
//    property H: Jh4 read _GetH write _SetH;
//    property I: Jh4 read _GetI write _SetI;
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  Jd0Class = interface(JObjectClass)
//  ['{511585B7-6394-41BB-ADF4-F510B6B3D0F2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jd0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d0')]
//  Jd0 = interface(JObject)
//  ['{D14DC871-0C1B-483C-88F0-98B11A2DF257}']
//    { Property Methods }
//    function _Geta: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Jj3); cdecl;
//
//    { Property }
//    property a: Jc0 read _Geta write _Seta;
//  end;

//  TJd0 = class(TJavaGenericImport<Jd0Class, Jd0>) end;

//  Jd1Class = interface(JObjectClass)
//  ['{231AAFC9-C878-40EC-BA50-48F29A8AC66A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Boolean; P2: Boolean): Jd1; cdecl; overload;
//    {class} function init(P1: Boolean; P2: Boolean; P3: Boolean): Jd1; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d1')]
//  Jd1 = interface(JObject)
//  ['{04B2A289-C12A-44B1-B5EB-5008F0685599}']
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

//  TJd1 = class(TJavaGenericImport<Jd1Class, Jd1>) end;

//  Jd2Class = interface(JObjectClass)
//  ['{709C099E-BC91-47F4-B98B-BF7C74840E9B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jd2; cdecl;
//    {class} function a(P1: Jd2): Jc0; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d2')]
//  Jd2 = interface(JObject)
//  ['{8A857B16-3E93-48E0-BAB5-68F7EA99AB13}']
//    { Property Methods }
//    function _Geta: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JHandler);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Ja2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Ja2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Jg2); cdecl; overload;
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//
//    { Property }
//    property a: JHandler read _Geta write _Seta;
//    property b: Ja2 read _Getb write _Setb;
//    property c: Jc0 read _Getc write _Setc;
//  end;

//  TJd2 = class(TJavaGenericImport<Jd2Class, Jd2>) end;

//  Jd3Class = interface(JObjectClass)
//  ['{3FBB36A8-9970-4B55-860A-420D6D7F7BFA}']
//    { static Property Methods }
//    {class} function _Getg: JHandler;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JString; P3: JString; P4: JJSONObject; P5: JUserProfileCallback; P6: JContext): Jd3; cdecl; overload;
//    {class} function init: Jd3; cdecl; overload;
//
//    { static Property }
//    {class} property g: JHandler read _Getg;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d3')]
//  Jd3 = interface(JObject)
//  ['{00344B8F-C645-4C94-BD73-F93257D47A00}']
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

//  TJd3 = class(TJavaGenericImport<Jd3Class, Jd3>) end;

//  Jd4Class = interface(JObjectClass)
//  ['{F7B1BDCF-E0E2-4C70-A070-5045AF6F4BB9}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Char>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function b(P1: TJavaArray<Byte>): JString; cdecl;
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl;
//    {class} function init: Jd4; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<Char> read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d4')]
//  Jd4 = interface(JObject)
//  ['{E3C5B4E8-2022-4400-8C9F-408951361866}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd4 = class(TJavaGenericImport<Jd4Class, Jd4>) end;

//  Jd5_aClass = interface(JObjectClass)
//  ['{22E48429-7A47-43CE-9ECC-33F1F48C8BB6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd5; P2: JCountDownLatch; P3: Jd5_b): Jd5_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d5$a')]
//  Jd5_a = interface(JObject)
//  ['{2F580E10-5A81-446F-8AA5-E3840BEE0364}']
//    { Property Methods }
//    function _Geta: JCountDownLatch;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JCountDownLatch);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd5_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd5_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    property b: Jd5_b read _Getb write _Setb;
//    property c: JObject read _Getc write _Setc;
//  end;

//  TJd5_a = class(TJavaGenericImport<Jd5_aClass, Jd5_a>) end;

//  Jd5_bClass = interface(JObjectClass)
//  ['{9147D7BB-B5E3-4164-AE7D-37831EA6981B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d5$b')]
//  Jd5_b = interface(IJavaInstance)
//  ['{CA9999D2-5D5D-4419-B26F-D3C43586D885}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JIBinder): JObject; cdecl; overload;
//    function a(P1: JObject): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJd5_b = class(TJavaGenericImport<Jd5_bClass, Jd5_b>) end;

//  Jd5Class = interface(JObjectClass)
//  ['{4D675B19-831E-4B4E-AEB3-6C807E3A3026}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JIntent; P3: Jd5_b): Jd5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/d5')]
//  Jd5 = interface(JObject)
//  ['{4E73BDD0-F0D5-4122-B444-E55CAA8CDF2F}']
//    { Property Methods }
//    function _Geta: JCountDownLatch;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JCountDownLatch);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JIntent;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JIntent);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jd5_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jd5_b);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JObject; cdecl; overload;
//    procedure a(P1: Jd5_a); cdecl; overload;
//
//    { Property }
//    property a: JCountDownLatch read _Geta write _Seta;
//    property b: JIntent read _Getb write _Setb;
//    property c: Jd5_b read _Getc write _Setc;
//    property d: JContext read _Getd write _Setd;
//  end;

//  TJd5 = class(TJavaGenericImport<Jd5Class, Jd5>) end;

//  JeClass = interface(JObjectClass)
//  ['{04A32498-A95D-4158-8C9C-BD888F60BB82}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JInitConfig): Je; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e')]
//  Je = interface(JObject)
//  ['{E2A59F21-1EDB-43D5-88BC-3CB2444A78DB}']
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
//  ['{345E4FF7-89FA-4849-921E-38E14217D52A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: JString): Je0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e0')]
//  Je0 = interface(Ja0) // or JObject
//  ['{576BE0A8-2858-483E-AA3B-AF18D89B54B9}']
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

//  Je1Class = interface(Jd1Class) // or JObjectClass
//  ['{0DCB9BE8-89DA-4063-9EB5-108261190DDF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: Ji1): Je1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e1')]
//  Je1 = interface(Jd1) // or JObject
//  ['{BA3DB010-6D84-4BC9-A3C9-F8A55163DB71}']
//    { Property Methods }
//    function _Gete: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: Ji1 read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//  end;

//  TJe1 = class(TJavaGenericImport<Je1Class, Je1>) end;

//  Je2Class = interface(JObjectClass)
//  ['{FDCCA9FB-6F0B-4808-B345-6C3D8C369E53}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Int64): Je2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e2')]
//  Je2 = interface(JObject)
//  ['{96FAA1E9-3FD1-4680-BC5E-76F7995D8244}']
//    { Property Methods }
//    function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function h: Int64; cdecl;
//    function b: JString; cdecl;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function a: JList; cdecl; overload;
//    function e: JString; cdecl;
//    function g: JObject; cdecl;
//    function d: JJSONObject; cdecl;
//    function c: Integer; cdecl;
//    function f: JList; cdecl;
//
//    { Property }
//    property a: Int64 read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: Int64 read _Getc write _Setc;
//  end;

//  TJe2 = class(TJavaGenericImport<Je2Class, Je2>) end;

//  Je3_aClass = interface(JObjectClass)
//  ['{D5580783-5F7A-4D27-9FC5-725A2BA8D83B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3; P2: JJSONObject): Je3_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3$a')]
//  Je3_a = interface(JObject)
//  ['{622E4DB3-077D-40A9-A8E8-3818A0E9D0CC}']
//    { Property Methods }
//    function _Geta: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JJSONObject read _Geta write _Seta;
//    property b: Je3 read _Getb write _Setb;
//  end;

//  TJe3_a = class(TJavaGenericImport<Je3_aClass, Je3_a>) end;

//  Je3_bClass = interface(JObjectClass)
//  ['{C2712106-47FF-4A48-AF6B-F1FA74F8E745}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3; P2: JString; P3: Integer; P4: TJavaArray<Byte>; P5: JString; P6: Int64; P7: JJSONObject): Je3_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3$b')]
//  Je3_b = interface(JObject)
//  ['{91A492E7-0891-4FCD-8D04-34E681F8881E}']
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
//    function _Getg: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    property g: Je3 read _Getg write _Setg;
//  end;

//  TJe3_b = class(TJavaGenericImport<Je3_bClass, Je3_b>) end;

//  Je3Class = interface(JObjectClass)
//  ['{B05C49D4-9107-4F29-949C-F81DBC3EC892}']
//    { static Property Methods }
//    {class} function _Getd: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd): Je3; cdecl;
//    {class} function a(P1: JString; P2: TJavaObjectArray<JString>): JString; cdecl; overload;
//    {class} procedure a(P1: JStringBuilder; P2: JString; P3: JString); cdecl; overload;
//    {class} function a(P1: JString; P2: JString): JJSONObject; cdecl; overload;
//    {class} function b(P1: JJSONObject): JJSONObject; cdecl; overload;
//
//    { static Property }
//    {class} property d: JJSONObject read _Getd;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e3')]
//  Je3 = interface(JObject)
//  ['{E748D148-5ABE-478B-B173-2B1F7C5AB536}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Je4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Je4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject; P2: JString): Boolean; cdecl; overload;
//    function a(P1: TJavaObjectArray<JString>; P2: JJSONObject; P3: Ji1): Integer; cdecl; overload;
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
//    property c: Je4 read _Getc write _Setc;
//  end;

//  TJe3 = class(TJavaGenericImport<Je3Class, Je3>) end;

//  Je4Class = interface(JObjectClass)
//  ['{716D9464-EB6F-4111-924F-0EC4B918AEE2}']
//    { static Property Methods }
//    {class} function _Getb: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd): Je4; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function a: TJavaObjectArray<JString>; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: JString; P3: JString): TJavaArray<Byte>; cdecl; overload;
//    {class} function b(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    {class} function init: Je4; cdecl; overload;
//
//    { static Property }
//    {class} property b: TJavaObjectArray<JString> read _Getb;
//    {class} property c: TJavaObjectArray<JString> read _Getc;
//    {class} property d: TJavaObjectArray<JString> read _Getd;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/e4')]
//  Je4 = interface(JObject)
//  ['{F87C526C-6CA8-46D0-8B78-B3994C967DF8}']
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

//  TJe4 = class(TJavaGenericImport<Je4Class, Je4>) end;

//  JfClass = interface(JObjectClass)
//  ['{1B18C924-976C-4A4B-A5B8-CDEB17E8E893}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f')]
//  Jf = interface(IJavaInstance)
//  ['{733B1CF7-CD2D-4BAC-B178-E97D2F79642C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

//  Jf0_aClass = interface(JObjectClass)
//  ['{087455FB-3AAC-464E-9155-C3573251B779}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jf0; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString): Jf0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f0$a')]
//  Jf0_a = interface(JObject)
//  ['{E8542174-EDF4-43EE-A62F-F62112E2330C}']
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
//  ['{75970578-2DEC-4DB4-BB3D-0C87CF05F2BB}']
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
//  ['{EC150119-8B1A-41BB-B55D-878CD49D8184}']
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

//  Jf1Class = interface(Jd1Class) // or JObjectClass
//  ['{25829FA9-470D-4D74-8253-C80D9CE1F21B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Jf1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f1')]
//  Jf1 = interface(Jd1) // or JObject
//  ['{8A434275-9F59-466B-931C-472361A7B04C}']
//    { Property Methods }
//    function _Gete: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//    procedure a(P1: JString; P2: JJSONObject); cdecl; overload;
//
//    { Property }
//    property e: Jd read _Gete write _Sete;
//  end;

//  TJf1 = class(TJavaGenericImport<Jf1Class, Jf1>) end;

//  Jf2Class = interface(JObjectClass)
//  ['{D08FC941-A404-4D34-9E37-DCD181550DAF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f2')]
//  Jf2 = interface(IJavaInstance)
//  ['{7B5DC650-87B7-49F9-B962-70D8CDF9D269}']
//    { Property Methods }
//
//    { methods }
//    function c: Integer; cdecl;
//    function f: JList; cdecl;
//    function a: JList; cdecl;
//
//    { Property }
//  end;

//  TJf2 = class(TJavaGenericImport<Jf2Class, Jf2>) end;

//  Jf3Class = interface(JObjectClass)
//  ['{E4DE983A-06C3-4547-A2E3-0357BF8DC061}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3; P2: JString; P3: JString; P4: JJSONObject; P5: JJSONObject; P6: Byte; P7: Int64): Jf3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f3')]
//  Jf3 = interface(JObject)
//  ['{60F85D7D-00BF-414F-8564-BFEECDF5FAA9}']
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
//    function _Getg: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    property g: Je3 read _Getg write _Setg;
//  end;

//  TJf3 = class(TJavaGenericImport<Jf3Class, Jf3>) end;

//  Jf4Class = interface(JObjectClass)
//  ['{916FD372-E360-4F39-9414-DB4BC8D26BE2}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jf4; cdecl;
//    {class} function a(P1: JContext; P2: Ji1): JString; cdecl;
//
//    { static Property }
//    {class} property a: JString read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/f4')]
//  Jf4 = interface(JObject)
//  ['{2BCBBFFE-60A8-49B2-98C2-9D967EB8F39B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf4 = class(TJavaGenericImport<Jf4Class, Jf4>) end;

//  JgClass = interface(JObjectClass)
//  ['{6175F33D-E39D-40EF-B131-3E8ACF693A74}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g')]
//  Jg = interface(IJavaInstance)
//  ['{A5FF8F06-C11F-46FB-B743-E9B4596CA5D7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  Jg0_aClass = interface(JObjectClass)
//  ['{40A47F01-1762-4E05-AAD5-07505609CB1D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jg0; P2: JSet; P3: Boolean): Jg0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g0$a')]
//  Jg0_a = interface(JObject)
//  ['{4062B788-BADE-486A-BAFC-2E7740F61EF7}']
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
//  ['{1D34CD50-17C9-49FD-944F-1C556C9BA5B7}']
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
//  ['{68E99A39-5860-4736-A0F7-1C6A2C8577A3}']
//    { Property Methods }
//    function _Getg: Jp2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Jp2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    property g: Jp2 read _Getg write _Setg;
//  end;

//  TJg0 = class(TJavaGenericImport<Jg0Class, Jg0>) end;

//  Jg1Class = interface(Jd1Class) // or JObjectClass
//  ['{989C22B3-E662-464C-BCAA-CDFB7EBAF934}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ji1): Jg1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g1')]
//  Jg1 = interface(Jd1) // or JObject
//  ['{68E6DA05-DA2C-44B4-AC7A-3872F7B30EA2}']
//    { Property Methods }
//    function _Gete: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: Ji1 read _Gete write _Sete;
//  end;

//  TJg1 = class(TJavaGenericImport<Jg1Class, Jg1>) end;

//  Jg2_aClass = interface(JObjectClass)
//  ['{987FD09B-CF22-4ADA-B868-29BC44BFDF71}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Jg2): JJSONObject; cdecl; overload;
//    {class} procedure a(P1: JJSONObject); cdecl; overload;
//    {class} function b(P1: Jg2): JList; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g2$a')]
//  Jg2_a = interface(JObject)
//  ['{1D6551A6-3264-4ED3-8786-C4883A43392E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg2_a = class(TJavaGenericImport<Jg2_aClass, Jg2_a>) end;

//  Jg2Class = interface(JObjectClass)
//  ['{D43AEDA5-EE82-4A2D-AF05-54560B7FAC2A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g2')]
//  Jg2 = interface(IJavaInstance)
//  ['{DFA3B45F-0CF4-433E-B0A9-7F62E6868A38}']
//    { Property Methods }
//
//    { methods }
//    function d: JJSONObject; cdecl;
//    procedure a(P1: JJSONObject); cdecl;
//    function e: JString; cdecl;
//    function b: JString; cdecl;
//    function g: JObject; cdecl;
//
//    { Property }
//  end;

//  TJg2 = class(TJavaGenericImport<Jg2Class, Jg2>) end;

//  Jg3_aClass = interface(JObjectClass)
//  ['{024DB75B-6FEC-4EB9-986E-3D2437F0E8B9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JString; P3: JClass): Jg3_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g3$a')]
//  Jg3_a = interface(JObject)
//  ['{702FB901-6C0D-40CF-B99E-617AF1F32E62}']
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

//  TJg3_a = class(TJavaGenericImport<Jg3_aClass, Jg3_a>) end;

//  Jg3Class = interface(JObjectClass)
//  ['{DFE1D398-A51A-449E-82C2-BD9DEB1F226C}']
//    { static Property Methods }
//    {class} function _Getc: TJavaObjectArray<Jg3_a>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd): Jg3; cdecl; overload;
//    {class} function init: Jg3; cdecl; overload;
//
//    { static Property }
//    {class} property c: TJavaObjectArray<Jg3_a> read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g3')]
//  Jg3 = interface(JObject)
//  ['{9F2FAF65-579F-452D-AAAB-F0A07A6225DE}']
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

//  TJg3 = class(TJavaGenericImport<Jg3Class, Jg3>) end;

//  Jg4Class = interface(JObjectClass)
//  ['{8386F352-2721-42EE-BA12-84DE5DEBC4C9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/g4')]
//  Jg4 = interface(IJavaInstance)
//  ['{432087DC-16FA-4A99-B718-2511B08022BC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg4 = class(TJavaGenericImport<Jg4Class, Jg4>) end;

//  JhClass = interface(JObjectClass)
//  ['{3FBE70C9-0465-4334-9792-E22784C60B32}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JApplication; P2: JString): Jh; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h')]
//  Jh = interface(JObject)
//  ['{121F837A-8BA4-4B23-ADA1-A51D7711BBC0}']
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
//  ['{09E4ED51-293C-4E9C-8A13-2F3EAABC5F3C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jh0; P2: Jd; P3: Boolean; P4: Int64): Jh0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h0$a')]
//  Jh0_a = interface(JObject)
//  ['{DDB551FD-1EA7-401A-9A58-FBF9223F7829}']
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

//  Jh0_bClass = interface(Jw3Class) // or JObjectClass
//  ['{CA5B7FAE-3DA3-47CD-870F-B1EFE37BF7A1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jh0_a): Jh0_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h0$b')]
//  Jh0_b = interface(Jw3) // or JObject
//  ['{E2FBA2BB-91EE-4C7A-9993-FC8DC0EBE0EE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh0_b = class(TJavaGenericImport<Jh0_bClass, Jh0_b>) end;

//  Jh0Class = interface(JObjectClass)
//  ['{9E231A5F-6317-49B5-8F97-22FAC2648B59}']
//    { static Property Methods }
//    {class} function _Geto: JAtomicLong;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: Jh0_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jh0; cdecl; overload;
//    {class} function a(P1: Jj3): Boolean; cdecl; overload;
//    {class} function init: Jh0; cdecl; overload;
//
//    { static Property }
//    {class} property o: JAtomicLong read _Geto;
//    {class} property p: Jh0_b read _Getp;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h0')]
//  Jh0 = interface(JObject)
//  ['{B4EA8BF9-CBC8-437B-8F2A-29AE9738EADD}']
//    { Property Methods }
//    function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jt3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jt3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jt3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jt3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    function a(P1: Jd; P2: Jj3; P3: JList; P4: Boolean): Jr3; cdecl; overload;
//    function a(P1: Jd; P2: Jj3; P3: JArrayList): Boolean; cdecl; overload;
//    procedure a(P1: JIAppLogInstance; P2: Jj3); cdecl; overload;
//
//    { Property }
//    property a: Int64 read _Geta write _Seta;
//    property b: Jc0 read _Getb write _Setb;
//    property c: Jt3 read _Getc write _Setc;
//    property d: Jt3 read _Getd write _Setd;
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

//  Jh1Class = interface(Jd1Class) // or JObjectClass
//  ['{E5DEFCEC-032E-4FA7-9209-33786D5E1D4E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext; P3: Ji1): Jh1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h1')]
//  Jh1 = interface(Jd1) // or JObject
//  ['{BEFB7034-DE6A-4D82-9ADB-97A3E884711F}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//    property g: Ji1 read _Getg write _Setg;
//  end;

//  TJh1 = class(TJavaGenericImport<Jh1Class, Jh1>) end;

//  Jh2Class = interface(JObjectClass)
//  ['{82D75431-27A6-4C39-917D-08FF019EA24A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h2')]
//  Jh2 = interface(IJavaInstance)
//  ['{697AFFF1-A151-4EF6-AE09-8F07ADF05B0D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh2 = class(TJavaGenericImport<Jh2Class, Jh2>) end;

//  Jh3Class = interface(JAsyncTaskClass) // or JObjectClass
//  ['{40565B6A-7600-4231-BD18-19D0527C77D5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: Jd); cdecl;
//    {class} function init(P1: Jd): Jh3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h3')]
//  Jh3 = interface(JAsyncTask) // or JObject
//  ['{F1B7CA88-C897-4217-A2BF-A14E1EB96051}']
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

//  TJh3 = class(TJavaGenericImport<Jh3Class, Jh3>) end;

//  Jh4Class = interface(JObjectClass)
//  ['{6D06398B-9E42-4BFA-A756-710C6E018404}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/h4')]
//  Jh4 = interface(JObject)
//  ['{242E8D4F-227E-4511-A413-930C69CF1476}']
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

//  TJh4 = class(TJavaGenericImport<Jh4Class, Jh4>) end;

//  JiClass = interface(JObjectClass)
//  ['{051FEACD-B610-46D0-9B47-5A0485BBBE10}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Ji; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i')]
//  Ji = interface(JObject)
//  ['{D100204E-A377-457C-9786-D1F2EA9E2EC4}']
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
//  ['{14FF3C5A-19EA-4E41-B17A-1678BE1CAED7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIAppLogLogger; P2: JString): Ji0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i0')]
//  Ji0 = interface(JObject)
//  ['{E74158BD-93DC-4F6E-B822-2F86D8E114AF}']
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

//  Ji1_aClass = interface(JObjectClass)
//  ['{7A47A85D-A9B0-4A2D-AD1E-75D46F2C1251}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ji1): Ji1_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i1$a')]
//  Ji1_a = interface(JObject)
//  ['{DC91560A-A315-4CCE-A691-7F57BDC58871}']
//    { Property Methods }
//    function _Geta: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: Ji1 read _Geta write _Seta;
//  end;

//  TJi1_a = class(TJavaGenericImport<Ji1_aClass, Ji1_a>) end;

//  Ji1Class = interface(JObjectClass)
//  ['{4B1BF5D2-15D8-4793-ADF3-30CB419DB628}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext; P3: JInitConfig): Ji1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i1')]
//  Ji1 = interface(JObject)
//  ['{9E367D65-CD58-411C-8F16-A67D2E32D81C}']
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

//  TJi1 = class(TJavaGenericImport<Ji1Class, Ji1>) end;

//  Ji2Class = interface(JObjectClass)
//  ['{521D358B-709C-4D28-83DE-972484A815A3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Ji2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i2')]
//  Ji2 = interface(JObject)
//  ['{A1F08AA7-E16E-468C-89CD-070D48F8A7BE}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: JString; cdecl;
//    function g: JObject; cdecl;
//    function e: JString; cdecl;
//    function d: JJSONObject; cdecl;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function c: Integer; cdecl;
//    function f: JList; cdecl;
//    function a: JList; cdecl; overload;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//  end;

//  TJi2 = class(TJavaGenericImport<Ji2Class, Ji2>) end;

//  Ji3_aClass = interface(JObjectClass)
//  ['{017EA47A-9838-499A-81EB-8F41995C68DC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ji3; P2: JAccount): Ji3_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i3$a')]
//  Ji3_a = interface(JObject)
//  ['{2D86B029-F931-4E09-93F6-8074987A0E83}']
//    { Property Methods }
//    function _Geta: JAccount;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JAccount);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Ji3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Ji3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: JAccount read _Geta write _Seta;
//    property b: Ji3 read _Getb write _Setb;
//  end;

//  TJi3_a = class(TJavaGenericImport<Ji3_aClass, Ji3_a>) end;

//  Ji3Class = interface(Jk3Class) // or JObjectClass
//  ['{1ECD2FD5-4BBA-4463-9123-B18C1645E3B8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext): Ji3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i3')]
//  Ji3 = interface(Jk3) // or JObject
//  ['{7088C16B-8C4F-4968-80BF-A25FE73C87F0}']
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

//  TJi3 = class(TJavaGenericImport<Ji3Class, Ji3>) end;

//  Ji4_aClass = interface(JEnumClass) // or JObjectClass
//  ['{BADA06DE-14B6-4894-BA0E-3073910F8294}']
//    { static Property Methods }
//    {class} function _Getb: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: TJavaObjectArray<Ji4_a>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ji4_a>; cdecl;
//    {class} function valueOf(P1: JString): Ji4_a; cdecl;
//    {class} function init(P1: JString; P2: Integer; P3: Integer): Ji4_a; cdecl; overload;
//    {class} function init: Ji4_a; cdecl; overload;
//
//    { static Property }
//    {class} property b: Ji4_a read _Getb;
//    {class} property c: Ji4_a read _Getc;
//    {class} property d: Ji4_a read _Getd;
//    {class} property e: Ji4_a read _Gete;
//    {class} property f: Ji4_a read _Getf;
//    {class} property g: Ji4_a read _Getg;
//    {class} property h: Ji4_a read _Geth;
//    {class} property i: Ji4_a read _Geti;
//    {class} property j: Ji4_a read _Getj;
//    {class} property k: Ji4_a read _Getk;
//    {class} property l: Ji4_a read _Getl;
//    {class} property m: Ji4_a read _Getm;
//    {class} property n: TJavaObjectArray<Ji4_a> read _Getn;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i4$a')]
//  Ji4_a = interface(JEnum) // or JObject
//  ['{E7A6DDD5-2DA6-4D7C-BAFE-8143526270C4}']
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

//  TJi4_a = class(TJavaGenericImport<Ji4_aClass, Ji4_a>) end;

//  Ji4Class = interface(JObjectClass)
//  ['{261B03BC-33E4-4E03-82A8-6C14D05EBC5A}']
//    { static Property Methods }
//    {class} function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ji4_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JContext; P2: Boolean): JString; cdecl; overload;
//    {class} function a(P1: JContext): Ji4_a; cdecl; overload;
//    {class} function b(P1: JContext; P2: Boolean): Ji4_a; cdecl; overload;
//    {class} function b(P1: JContext): Boolean; cdecl; overload;
//    {class} function init: Ji4; cdecl;
//
//    { static Property }
//    {class} property a: Int64 read _Geta;
//    {class} property b: Ji4_a read _Getb;
//    {class} property c: Boolean read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/i4')]
//  Ji4 = interface(JObject)
//  ['{8EAE81FC-2839-4C15-B23A-CAE20264040A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi4 = class(TJavaGenericImport<Ji4Class, Ji4>) end;

//  JjClass = interface(JoClass) // or JObjectClass
//  ['{354A0704-59D1-4875-8557-B4E07AFFE40D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j')]
//  Jj = interface(Jo) // or JObject
//  ['{720AD46C-D437-4E72-A2A6-D24B805E939F}']
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
//  ['{1A45B7A4-6A98-4055-BF4C-8B00FBC62569}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j0')]
//  Jj0 = interface(JThrowable) // or JObject
//  ['{4492F24D-7646-45BF-97E3-E0DE1C378DC9}']
//    { Property Methods }
//
//    { methods }
//    procedure printStackTrace; cdecl;
//
//    { Property }
//  end;

//  TJj0 = class(TJavaGenericImport<Jj0Class, Jj0>) end;

//  Jj1Class = interface(JObjectClass)
//  ['{B4AEAA71-C4A0-4959-B3C0-50794B7F03AF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ji1; P2: JJSONObject): Jj1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j1')]
//  Jj1 = interface(JObject)
//  ['{88BB5C7F-FAF4-4C8D-BB47-53A2AB38CEA4}']
//    { Property Methods }
//    function _Geta: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JJSONObject read _Geta write _Seta;
//    property b: Ji1 read _Getb write _Setb;
//  end;

//  TJj1 = class(TJavaGenericImport<Jj1Class, Jj1>) end;

//  Jj2Class = interface(JObjectClass)
//  ['{B9382541-CE1D-459E-90E9-D27EDA0A3AE1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JThrowable): Jj2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j2')]
//  Jj2 = interface(JObject)
//  ['{CE5CC3E7-1AF7-4803-A449-668AB1F24EF0}']
//    { Property Methods }
//    function _Geta: JThrowable;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JThrowable);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function b: JString; cdecl;
//    function g: JObject; cdecl;
//    function a: JList; cdecl; overload;
//    function e: JString; cdecl;
//    function d: JJSONObject; cdecl;
//    function c: Integer; cdecl;
//    function f: JList; cdecl;
//
//    { Property }
//    property a: JThrowable read _Geta write _Seta;
//  end;

//  TJj2 = class(TJavaGenericImport<Jj2Class, Jj2>) end;

//  Jj3_aClass = interface(Jy3Class) // or JObjectClass
//  ['{9933309B-8A53-4179-9853-1E72DFFD56BF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj3_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j3$a')]
//  Jj3_a = interface(Jy3) // or JObject
//  ['{BC7C8B10-6A3F-4649-BC73-A40C57AC8048}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJj3_a = class(TJavaGenericImport<Jj3_aClass, Jj3_a>) end;

//  Jj3Class = interface(JObjectClass)
//  ['{3511EC95-9D38-4391-BDF6-4B8FF9E1DF07}']
//    { static Property Methods }
//    {class} function _Getq: JSimpleDateFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr: Jy3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jj3; cdecl; overload;
//    {class} function j: JHashMap; cdecl;
//    {class} function b(P1: Int64): JString; cdecl; overload;
//    {class} function a(P1: JString): Jj3; cdecl; overload;
//    {class} function init: Jj3; cdecl; overload;
//
//    { static Property }
//    {class} property q: JSimpleDateFormat read _Getq;
//    {class} property r: Jy3 read _Getr;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j3')]
//  Jj3 = interface(JObject)
//  ['{224BF79C-F8F4-4496-9AA9-32FBF5AF5974}']
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
//    function a(P1: JJSONObject): Jj3; cdecl; overload;
//    function a(P1: JContentValues): JContentValues; cdecl; overload;
//    function a: JString; cdecl; overload;
//    function f: JString; cdecl;
//    function g: JJSONObject; cdecl;
//    function h: JJSONObject; cdecl;
//    function clone: Jj3; cdecl; overload;
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

//  TJj3 = class(TJavaGenericImport<Jj3Class, Jj3>) end;

//  Jj4Class = interface(JObjectClass)
//  ['{F7712508-6A5A-48DF-8BBF-3ED058CE1EA7}']
//    { static Property Methods }
//    {class} function _Geta: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JContext; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JContext; P2: JString; P3: Integer): JPackageInfo; cdecl; overload;
//    {class} function init: Jj4; cdecl;
//
//    { static Property }
//    {class} property a: JMap read _Geta;
//    {class} property b: JMap read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/j4')]
//  Jj4 = interface(JObject)
//  ['{82376E6B-86EA-4191-8B4D-2568E93ED075}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj4 = class(TJavaGenericImport<Jj4Class, Jj4>) end;

//  JkClass = interface(JoClass) // or JObjectClass
//  ['{F52C7C5F-29CA-4164-9E08-4E21D008C692}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k')]
//  Jk = interface(Jo) // or JObject
//  ['{0B82907F-A6C3-4270-9809-DB3FA3B1AFD9}']
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
//  ['{05F2576C-6B5D-43B5-9570-89E0E4FDC6AB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk0): Jk0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k0$a')]
//  Jk0_a = interface(JObject)
//  ['{478999B7-A948-43A1-A304-E5E6D758DF5B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJk0_a = class(TJavaGenericImport<Jk0_aClass, Jk0_a>) end;

//  Jk0_bClass = interface(JObjectClass)
//  ['{BB7556E9-ACB7-408F-BBAE-6178E60B0BAB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk0; P2: Jb_d; P3: Jq3): Jk0_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k0$b')]
//  Jk0_b = interface(JObject)
//  ['{5EC044B3-1766-42EA-9774-1A25507314C8}']
//    { Property Methods }
//    function _Geta: Jb_d;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jb_d);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jq3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jq3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Jd); cdecl;
//
//    { Property }
//    property a: Jb_d read _Geta write _Seta;
//    property b: Jq3 read _Getb write _Setb;
//  end;

//  TJk0_b = class(TJavaGenericImport<Jk0_bClass, Jk0_b>) end;

//  Jk0Class = interface(JObjectClass)
//  ['{A2FFF5B6-588E-4D77-9BFB-8BCB6BD348FA}']
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
//  ['{CD95A363-DFC5-4993-BA55-3AE1D6AF6516}']
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

//  Jk1_aClass = interface(JObjectClass)
//  ['{7A0C4CDA-3879-44ED-9215-0D60606DA26D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk1): Jk1_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k1$a')]
//  Jk1_a = interface(JObject)
//  ['{FC491362-61D2-40F7-8B63-481AD8591EFF}']
//    { Property Methods }
//    function _Geta: Jk1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jk1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: Jk1 read _Geta write _Seta;
//  end;

//  TJk1_a = class(TJavaGenericImport<Jk1_aClass, Jk1_a>) end;

//  Jk1Class = interface(JObjectClass)
//  ['{76114E33-E86B-4980-8F54-11D2D2E891D0}']
//    { static Property Methods }
//    {class} function _Getl: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext; P3: Ji1): Jk1; cdecl; overload;
//    {class} procedure a(P1: JJSONObject; P2: JString; P3: JString); cdecl; overload;
//    {class} function init: Jk1; cdecl; overload;
//
//    { static Property }
//    {class} property l: TJavaObjectArray<JString> read _Getl;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k1')]
//  Jk1 = interface(JObject)
//  ['{B37849C5-2170-42AF-854E-4FC68CF79FAA}']
//    { Property Methods }
//    function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JArrayList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JArrayList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Jg4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Jg4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    property c: Ji1 read _Getc write _Setc;
//    property d: JJSONObject read _Getd write _Setd;
//    property e: Boolean read _Gete write _Sete;
//    property f: JArrayList read _Getf write _Setf;
//    property g: JSharedPreferences read _Getg write _Setg;
//    property h: Jg4 read _Geth write _Seth;
//    property i: Jd read _Geti write _Seti;
//    property j: Integer read _Getj write _Setj;
//    property k: Boolean read _Getk write _Setk;
//  end;

//  TJk1 = class(TJavaGenericImport<Jk1Class, Jk1>) end;

//  Jk2Class = interface(JObjectClass)
//  ['{97376E3E-4580-4046-BD8A-89E800F1B633}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k2')]
//  Jk2 = interface(JObject)
//  ['{CA8EE3F2-A025-472C-AE4D-57E8FBCC0FF5}']
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
//    function b: JString; cdecl;
//    function g: JObject; cdecl;
//    function e: JString; cdecl;
//    function d: JJSONObject; cdecl;
//    function c: Integer; cdecl;
//    function f: JList; cdecl;
//    function a: JList; cdecl; overload;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Int64 read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//  end;

//  TJk2 = class(TJavaGenericImport<Jk2Class, Jk2>) end;

//  Jk3_aClass = interface(JObjectClass)
//  ['{FC32946F-66AC-4D1A-B208-6B4087CAD63A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk3): Jk3_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k3$a')]
//  Jk3_a = interface(JObject)
//  ['{5EFE9BC5-DF7B-487D-B7FB-80B8E3AF556C}']
//    { Property Methods }
//    function _Geta: Jk3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jk3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Jk3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Jk3 read _Geta write _Seta;
//  end;

//  TJk3_a = class(TJavaGenericImport<Jk3_aClass, Jk3_a>) end;

//  Jk3_bClass = interface(JObjectClass)
//  ['{8AAE903D-AB83-462F-8524-1994ADA2CB70}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk3): Jk3_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k3$b')]
//  Jk3_b = interface(JObject)
//  ['{93B92165-51E3-4DA3-A82A-19CFE33E1640}']
//    { Property Methods }
//    function _Geta: Jk3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jk3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Jk3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Jk3 read _Geta write _Seta;
//  end;

//  TJk3_b = class(TJavaGenericImport<Jk3_bClass, Jk3_b>) end;

//  Jk3_cClass = interface(JObjectClass)
//  ['{0C6BFAC1-6707-47E4-BCB8-D6537F5097C1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk3): Jk3_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k3$c')]
//  Jk3_c = interface(JObject)
//  ['{ADAC25B4-1E11-4B35-B5F0-313D861B38A2}']
//    { Property Methods }
//    function _Geta: Jk3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jk3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Jk3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Jk3 read _Geta write _Seta;
//  end;

//  TJk3_c = class(TJavaGenericImport<Jk3_cClass, Jk3_c>) end;

//  Jk3_dClass = interface(JObjectClass)
//  ['{2F9FABEC-314C-429C-9530-6396EC913F99}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk3): Jk3_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k3$d')]
//  Jk3_d = interface(JObject)
//  ['{A07AC7C1-A93B-4DA3-AE2F-37CEEF82C300}']
//    { Property Methods }
//    function _Geta: Jk3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jk3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Jk3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Jk3 read _Geta write _Seta;
//  end;

//  TJk3_d = class(TJavaGenericImport<Jk3_dClass, Jk3_d>) end;

//  Jk3_eClass = interface(JObjectClass)
//  ['{FDD1FD20-4335-44B5-8860-3E5C5E35BFE3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk3): Jk3_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k3$e')]
//  Jk3_e = interface(JObject)
//  ['{DDC8C0A1-18BB-4B95-96EB-53A8781604D8}']
//    { Property Methods }
//    function _Geta: Jk3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jk3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Jk3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Jk3 read _Geta write _Seta;
//  end;

//  TJk3_e = class(TJavaGenericImport<Jk3_eClass, Jk3_e>) end;

//  Jk3_fClass = interface(JObjectClass)
//  ['{89EEAC8C-3D91-40CA-8E20-46D4AED5739C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk3): Jk3_f; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k3$f')]
//  Jk3_f = interface(JObject)
//  ['{F83BEFA4-7A73-47BF-A1B1-C3A6CF120AFC}']
//    { Property Methods }
//    function _Geta: Jk3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jk3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Jk3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Jk3 read _Geta write _Seta;
//  end;

//  TJk3_f = class(TJavaGenericImport<Jk3_fClass, Jk3_f>) end;

//  Jk3_gClass = interface(JObjectClass)
//  ['{7DD08875-930A-4D81-95DF-4E32A90FA470}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk3): Jk3_g; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k3$g')]
//  Jk3_g = interface(JObject)
//  ['{733B889A-0A03-4B4C-A0FC-731253116DAA}']
//    { Property Methods }
//    function _Geta: Jk3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jk3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Jk3): JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    function a: JObject; cdecl; overload;
//
//    { Property }
//    property a: Jk3 read _Geta write _Seta;
//  end;

//  TJk3_g = class(TJavaGenericImport<Jk3_gClass, Jk3_g>) end;

//  Jk3_hClass = interface(JObjectClass)
//  ['{FA8DB2A8-A516-431A-B028-2DCB64B3DBAD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k3$h')]
//  Jk3_h = interface(IJavaInstance)
//  ['{97F0B784-CCEE-43D7-8AB6-790A6D625292}']
//    { Property Methods }
//
//    { methods }
//    function a: JObject; cdecl; overload;
//    function b(P1: JObject): Boolean; cdecl;
//    procedure a(P1: JObject); cdecl; overload;
//    function a(P1: JObject; P2: JObject; P3: Jk3): JObject; cdecl; overload;
//    function a(P1: JObject; P2: JObject): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJk3_h = class(TJavaGenericImport<Jk3_hClass, Jk3_h>) end;

//  Jk3Class = interface(JObjectClass)
//  ['{F9BE1540-3601-45AB-A00D-7C4DEFA705FA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k3')]
//  Jk3 = interface(JObject)
//  ['{F8ECCCBC-500E-405F-8572-658875A11B80}']
//    { Property Methods }
//    function _Geta: Jk3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jk3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    function a(P1: JObject; P2: JObject; P3: Jk3_h): JObject; cdecl; overload;
//
//    { Property }
//    property a: Jk3 read _Geta write _Seta;
//    property b: JHandler read _Getb write _Setb;
//  end;

//  TJk3 = class(TJavaGenericImport<Jk3Class, Jk3>) end;

//  Jk4Class = interface(JObjectClass)
//  ['{717462A0-DCA7-469B-8D90-E804F927DAD0}']
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
//    {class} function init: Jk4; cdecl;
//
//    { static Property }
//    {class} property a: JList read _Geta;
//    {class} property b: JList read _Getb;
//    {class} property c: JList read _Getc;
//    {class} property d: JList read _Getd;
//    {class} property e: JList read _Gete;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/k4')]
//  Jk4 = interface(JObject)
//  ['{9FB4A322-531B-4C0C-87E1-CEAA75B2CC9F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk4 = class(TJavaGenericImport<Jk4Class, Jk4>) end;

//  Jl_aClass = interface(JObjectClass)
//  ['{5F053885-CA1B-49FD-BD5E-374E1AB07210}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDefaultConstructorMarker): Jl_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l$a')]
//  Jl_a = interface(JObject)
//  ['{2C65D9A4-3D38-45CA-9E30-B5AF1F9CF5F0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JClass): Jl; cdecl;
//
//    { Property }
//  end;

//  TJl_a = class(TJavaGenericImport<Jl_aClass, Jl_a>) end;

//  JlClass = interface(JObjectClass)
//  ['{A6B60D84-C8DB-431A-B058-DD4A4ADAC663}']
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
//  ['{CEB537E1-C831-4984-85D7-22CEBD016345}']
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
//  ['{3AFFDDCF-B9B7-4571-89FA-11F23D823C86}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDrawable): Jl0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l0')]
//  Jl0 = interface(Jm0) // or JObject
//  ['{37705348-49A7-46EE-9413-A70C6F7B6D82}']
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

//  Jl1Class = interface(JObjectClass)
//  ['{E65BB76F-82C0-4C26-B47E-3BE06D2B2FB2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk1; P2: JJSONObject): Jl1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l1')]
//  Jl1 = interface(JObject)
//  ['{3375F62E-B7E3-4785-AFE5-09B2660F7243}']
//    { Property Methods }
//    function _Geta: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JJSONObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jk1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jk1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JJSONObject read _Geta write _Seta;
//    property b: Jk1 read _Getb write _Setb;
//  end;

//  TJl1 = class(TJavaGenericImport<Jl1Class, Jl1>) end;

//  Jl2Class = interface(JObjectClass)
//  ['{F975A2D7-1F69-4DB8-8BBC-E399044E73D6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Int64): Jl2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l2')]
//  Jl2 = interface(JObject)
//  ['{5E4C5447-2D0C-41EC-9E54-AB09A8EC4273}']
//    { Property Methods }
//    function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function b: JString; cdecl;
//    function c: Integer; cdecl;
//    function f: JList; cdecl;
//    function h: Int64; cdecl;
//    function e: JString; cdecl;
//    function g: JObject; cdecl;
//    function d: JJSONObject; cdecl;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function a: JList; cdecl; overload;
//
//    { Property }
//    property a: Int64 read _Geta write _Seta;
//  end;

//  TJl2 = class(TJavaGenericImport<Jl2Class, Jl2>) end;

//  Jl3Class = interface(Jq3Class) // or JObjectClass
//  ['{FDE7673D-ECB2-43EA-BE1C-325F5A58679B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: Integer; P7: Integer; P8: Integer; P9: Integer; P10: JArrayList; P11: JArrayList): Jl3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l3')]
//  Jl3 = interface(Jq3) // or JObject
//  ['{58F0A645-F62E-40EF-B3E4-887191BF1EAF}']
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

//  TJl3 = class(TJavaGenericImport<Jl3Class, Jl3>) end;

//  Jl4_aClass = interface(Jy3Class) // or JObjectClass
//  ['{EA3A10FE-51F8-4AC8-B1CD-08D06C26AF56}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l4$a')]
//  Jl4_a = interface(Jy3) // or JObject
//  ['{4E882C0A-1F5F-4935-B5ED-65458907A409}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJl4_a = class(TJavaGenericImport<Jl4_aClass, Jl4_a>) end;

//  Jl4Class = interface(JObjectClass)
//  ['{787DB891-B13A-4D4A-BF27-0F48A7C84E4B}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jy3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JContext): Boolean; cdecl;
//    {class} function init: Jl4; cdecl;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: Jy3 read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/l4')]
//  Jl4 = interface(JObject)
//  ['{DA8C345E-FC18-49AB-8A1C-A91716C1FD34}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl4 = class(TJavaGenericImport<Jl4Class, Jl4>) end;

//  Jm_aClass = interface(JEnumClass) // or JObjectClass
//  ['{BBFF8A12-1BEC-4928-80FD-83E8819E18C5}']
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
//  ['{43B3330D-42C9-4FEC-99D5-3439CBA3200D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm_a = class(TJavaGenericImport<Jm_aClass, Jm_a>) end;

//  JmClass = interface(JoClass) // or JObjectClass
//  ['{56E8CCE5-E023-4F20-9475-DED62B03FD5E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m')]
//  Jm = interface(Jo) // or JObject
//  ['{C305A2EE-FA04-49DF-BF62-A9289FD5C104}']
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
//  ['{CBA2DC60-8951-4547-AC65-66A93FCF58D9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDrawable): Jm0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m0')]
//  Jm0 = interface(JDrawable) // or JObject
//  ['{D70D44B8-7BF3-4687-960C-1FE5CDEA22F3}']
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

//  Jm1Class = interface(Jd1Class) // or JObjectClass
//  ['{664C6022-627C-44DC-86E3-18284DAD4C1E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Ji1; P3: Jk1): Jm1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m1')]
//  Jm1 = interface(Jd1) // or JObject
//  ['{847A827D-3125-4A99-8843-2663BEA5EE5C}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jk1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jk1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//    property f: Jk1 read _Getf write _Setf;
//    property g: Ji1 read _Getg write _Setg;
//  end;

//  TJm1 = class(TJavaGenericImport<Jm1Class, Jm1>) end;

//  Jm2Class = interface(JObjectClass)
//  ['{401A2655-DF93-4971-8C10-502D3A07C536}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m2')]
//  Jm2 = interface(JObject)
//  ['{CB7DBF44-025F-4F67-9230-0996FAE99209}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JInteger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JInteger);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Integer); cdecl; overload;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function e: JString; cdecl;
//    function b: JString; cdecl;
//    function g: JObject; cdecl;
//    function a: JList; cdecl; overload;
//    function c: Integer; cdecl;
//    function f: JList; cdecl;
//    function d: JJSONObject; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: JInteger read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//    property d: JString read _Getd write _Setd;
//    property e: Int64 read _Gete write _Sete;
//  end;

//  TJm2 = class(TJavaGenericImport<Jm2Class, Jm2>) end;

//  Jm3Class = interface(Jj3Class) // or JObjectClass
//  ['{4315A5B5-1B89-4845-B2D5-896AA8073346}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm3; cdecl; overload;
//    {class} function init(P1: JString; P2: JJSONObject): Jm3; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m3')]
//  Jm3 = interface(Jj3) // or JObject
//  ['{C7A6FF9A-C089-42BA-AAD8-14B9A94B72ED}']
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
//    function a(P1: JJSONObject): Jj3; cdecl; overload;
//    function f: JString; cdecl;
//    function c: JString; cdecl;
//
//    { Property }
//    property s: JString read _Gets write _Sets;
//    property t: JString read _Gett write _Sett;
//  end;

//  TJm3 = class(TJavaGenericImport<Jm3Class, Jm3>) end;

//  Jm4Class = interface(JObjectClass)
//  ['{8C4433C1-0D67-4002-AE70-C2523C44BD28}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jm4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/m4')]
//  Jm4 = interface(JObject)
//  ['{C2304690-54BB-4AB0-8C3B-B41E1B49B03B}']
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

//  TJm4 = class(TJavaGenericImport<Jm4Class, Jm4>) end;

//  JnClass = interface(JoClass) // or JObjectClass
//  ['{89DBA67E-5A2D-432B-9625-0EA156FFB04A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n')]
//  Jn = interface(Jo) // or JObject
//  ['{A2EA2892-E770-4F05-B8B8-6BBD0E4AE195}']
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
//  ['{1FF9779D-E6BA-46B5-8BAF-DE658D415954}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JView; P2: JFloat): Boolean; cdecl; overload;
//    {class} function d: JList; cdecl; overload;
//    {class} function a: JList; cdecl; overload;
//    {class} procedure a(P1: Jo2; P2: JJSONObject); cdecl; overload;
//    {class} function a(P1: Jo2): JList; cdecl; overload;
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
//    {class} function b: JString; cdecl; overload;
//    {class} function e(P1: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JJSONObject; P2: JJSONObject): JJSONObject; cdecl; overload;
//    {class} function a(P1: JString; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: Boolean): JString; cdecl; overload;
//    {class} procedure a(P1: JCloseable); cdecl; overload;
//    {class} procedure a(P1: JCursor); cdecl; overload;
//    {class} procedure a(P1: JSQLiteDatabase); cdecl; overload;
//    {class} function a(P1: JString): Boolean; cdecl; overload;
//    {class} function c: JString; cdecl; overload;
//    {class} function a(P1: JView; P2: Boolean): Jl3; cdecl; overload;
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
//  ['{104B7C1D-D4AB-459E-A672-198541076D21}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn0 = class(TJavaGenericImport<Jn0Class, Jn0>) end;

//  Jn1Class = interface(JObjectClass)
//  ['{C3E7C7F2-2522-48C7-8C5B-5EF9AA84B173}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n1')]
//  Jn1 = interface(JObject)
//  ['{A97C02FF-9261-4EDA-AEC5-5EDED1C1A8F4}']
//    { Property Methods }
//    function _Geta: Jg4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jg4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JAccount;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JAccount);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Ji3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Ji3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Jd; P2: JContext; P3: Ji1): Jg4; cdecl;
//
//    { Property }
//    property a: Jg4 read _Geta write _Seta;
//    property b: JAccount read _Getb write _Setb;
//    property c: Ji3 read _Getc write _Setc;
//  end;

//  TJn1 = class(TJavaGenericImport<Jn1Class, Jn1>) end;

//  Jn2Class = interface(JObjectClass)
//  ['{31860D65-5F52-4F96-AD50-3DF54B24AC56}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Int64): Jn2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n2')]
//  Jn2 = interface(JObject)
//  ['{0A276A8A-1454-4028-9917-0BAEA8FA0322}']
//    { Property Methods }
//    function _Geta: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function h: Int64; cdecl;
//    function b: JString; cdecl;
//    function e: JString; cdecl;
//    function g: JObject; cdecl;
//    function d: JJSONObject; cdecl;
//    procedure a(P1: JJSONObject); cdecl; overload;
//    function c: Integer; cdecl;
//    function f: JList; cdecl;
//    function a: JList; cdecl; overload;
//
//    { Property }
//    property a: Int64 read _Geta write _Seta;
//  end;

//  TJn2 = class(TJavaGenericImport<Jn2Class, Jn2>) end;

//  Jn3Class = interface(JSQLiteOpenHelperClass) // or JObjectClass
//  ['{FDDA9EAB-D55D-4F5A-AC93-B5180CF5586B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: JString; P3: JSQLiteDatabase_CursorFactory; P4: Integer): Jn3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n3')]
//  Jn3 = interface(JSQLiteOpenHelper) // or JObject
//  ['{22A1B101-9A71-4595-BD78-917469B4F746}']
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

//  TJn3 = class(TJavaGenericImport<Jn3Class, Jn3>) end;

//  Jn4_aClass = interface(Jy3Class) // or JObjectClass
//  ['{5404A39C-9113-499A-B1E6-89336C9DE8E5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n4$a')]
//  Jn4_a = interface(Jy3) // or JObject
//  ['{63BA9878-3E2E-412F-A56A-A25432409BDE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJn4_a = class(TJavaGenericImport<Jn4_aClass, Jn4_a>) end;

//  Jn4Class = interface(JObjectClass)
//  ['{4710D505-420F-432A-ACB0-779DA1EA5DF8}']
//    { static Property Methods }
//    {class} function _Geta: Jy3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a: JString; cdecl;
//    {class} function init: Jn4; cdecl;
//
//    { static Property }
//    {class} property a: Jy3 read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/n4')]
//  Jn4 = interface(JObject)
//  ['{2D917467-9F78-4405-9FD2-745BFCF7A24C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn4 = class(TJavaGenericImport<Jn4Class, Jn4>) end;

//  Jo_aClass = interface(JObjectClass)
//  ['{7392301D-BF63-4860-BA5D-657DB6448AD4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDefaultConstructorMarker): Jo_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o$a')]
//  Jo_a = interface(JObject)
//  ['{ECB10865-08D1-4143-8CEE-E8D2A8FB06D7}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JJSONObject; P2: JClass): Jo; cdecl;
//
//    { Property }
//  end;

//  TJo_a = class(TJavaGenericImport<Jo_aClass, Jo_a>) end;

//  JoClass = interface(JObjectClass)
//  ['{0C2988A1-38DD-49BD-ADB9-25EB83B90F6F}']
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
//  ['{010BC90E-9631-4746-9438-59FA042AE3B0}']
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
//  ['{8C66C924-CA65-48F3-B647-2C25DA1EC6A8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureData; P2: Boolean; P3: Integer): Jo0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o0')]
//  Jo0 = interface(JObject)
//  ['{28963F24-5CBC-4C2D-B114-1C67DCDB7708}']
//    { Property Methods }
//    function _Geta: JViewExposureData;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JViewExposureData);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JViewExposureData; cdecl;
//
//    { Property }
//    property a: JViewExposureData read _Geta write _Seta;
//    property b: Boolean read _Getb write _Setb;
//  end;

//  TJo0 = class(TJavaGenericImport<Jo0Class, Jo0>) end;

//  Jo1Class = interface(Jd1Class) // or JObjectClass
//  ['{06130D6C-7FA2-4F2F-A07E-BF872136366A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext): Jo1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o1')]
//  Jo1 = interface(Jd1) // or JObject
//  ['{939FEE33-E7DE-4428-BCC0-3F4B74EAA51B}']
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

//  TJo1 = class(TJavaGenericImport<Jo1Class, Jo1>) end;

//  Jo2Class = interface(JObjectClass)
//  ['{53703EEF-948F-4C08-80F4-DECBE632817B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o2')]
//  Jo2 = interface(IJavaInstance)
//  ['{BC6DE2B7-5F19-40FA-8788-8092D1A36367}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJo2 = class(TJavaGenericImport<Jo2Class, Jo2>) end;

//  Jo3Class = interface(JObjectClass)
//  ['{EE6C5CBB-5308-4720-BD4A-0F7EF79C5734}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: Jn3): Jo3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o3')]
//  Jo3 = interface(JObject)
//  ['{EB054DD3-3C00-4A24-93AC-C94E778FA817}']
//    { Property Methods }
//    function _Geta: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jn3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jn3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JList); cdecl; overload;
//    function a(P1: JIEventHandler; P2: Jj3): Boolean; cdecl; overload;
//    function a(P1: JIEventHandler; P2: Integer; P3: JString; P4: Jj3; P5: JJSONObject): JEventPolicy; cdecl; overload;
//
//    { Property }
//    property a: Jc0 read _Geta write _Seta;
//    property b: Jn3 read _Getb write _Setb;
//  end;

//  TJo3 = class(TJavaGenericImport<Jo3Class, Jo3>) end;

//  Jo4_aClass = interface(Jy3Class) // or JObjectClass
//  ['{7F0C376E-51C6-4C4A-B835-86D8556BAE87}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jo4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o4$a')]
//  Jo4_a = interface(Jy3) // or JObject
//  ['{23FED822-1179-4D4B-A59C-AAA83EDAA53A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJo4_a = class(TJavaGenericImport<Jo4_aClass, Jo4_a>) end;

//  Jo4Class = interface(JObjectClass)
//  ['{680AD76F-8B30-4D8B-B95D-B81487D41800}']
//    { static Property Methods }
//    {class} function _Geta: JCharSequence;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JCharSequence;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jy3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function c: Boolean; cdecl;
//    {class} function d: Boolean; cdecl;
//    {class} function e: Boolean; cdecl;
//    {class} function b: Boolean; cdecl;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a: JString; cdecl; overload;
//    {class} function init: Jo4; cdecl;
//
//    { static Property }
//    {class} property a: JCharSequence read _Geta;
//    {class} property b: JCharSequence read _Getb;
//    {class} property c: Jy3 read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/o4')]
//  Jo4 = interface(JObject)
//  ['{4C4CCF9A-7B08-4C7C-A531-5A143280C3EF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJo4 = class(TJavaGenericImport<Jo4Class, Jo4>) end;

//  JpClass = interface(JObjectClass)
//  ['{AE10CF2B-EA3C-46C7-A2C1-A4D53B514128}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Jp; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p')]
//  Jp = interface(JObject)
//  ['{86058DC1-1CA1-4AAA-B370-887C75F96F15}']
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
//  ['{7C428F7F-157C-4120-886A-85F26D21E199}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager): Jp0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p0')]
//  Jp0 = interface(JLambda) // or JObject
//  ['{FB611389-1A2E-42F4-BA68-026FFBF3CE9A}']
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

//  Jp1Class = interface(Jd1Class) // or JObjectClass
//  ['{389DAB91-2C0D-4FB6-8C09-8AD16C0572E7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jp1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p1')]
//  Jp1 = interface(Jd1) // or JObject
//  ['{92070701-E966-4C52-8800-3D159C1AC299}']
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

//  TJp1 = class(TJavaGenericImport<Jp1Class, Jp1>) end;

//  Jp2Class = interface(JObjectClass)
//  ['{1A75C9A5-304A-46E8-9E7F-2927A40AFFAF}']
//    { static Property Methods }
//    {class} function _Geth: TJavaObjectArray<TJavaArray<Int64>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Ji1): Jp2; cdecl; overload;
//    {class} function init: Jp2; cdecl; overload;
//
//    { static Property }
//    {class} property h: TJavaObjectArray<TJavaArray<Int64>> read _Geth;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p2')]
//  Jp2 = interface(JObject)
//  ['{03FD162B-9A13-402A-86E9-012901B4C1F1}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    property b: Ji1 read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//    property d: Integer read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//    property f: Int64 read _Getf write _Setf;
//    property g: Int64 read _Getg write _Setg;
//  end;

//  TJp2 = class(TJavaGenericImport<Jp2Class, Jp2>) end;

//  Jp3Class = interface(JObjectClass)
//  ['{2C04AFCB-112F-4EE3-A99F-E1C55C40D443}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0; P2: JString): Jp3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p3')]
//  Jp3 = interface(JObject)
//  ['{30171DBC-B0E0-4503-B794-F688B5BE295D}']
//    { Property Methods }
//    function _Geta: Jn3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jn3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jc0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jc0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Jo3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Jo3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure a(P1: JString; P2: JJSONObject); cdecl; overload;
//    procedure b(P1: JString; P2: JJSONObject); cdecl; overload;
//    procedure b(P1: JList); cdecl; overload;
//    function a(P1: JString): JMap; cdecl; overload;
//    procedure a(P1: JList); cdecl; overload;
//    procedure c(P1: JList); cdecl; overload;
//    procedure a(P1: JString; P2: JString); cdecl; overload;
//    function a(P1: JJSONArray): JList; cdecl; overload;
//    procedure d(P1: JList); cdecl;
//    procedure a(P1: JSQLiteDatabase; P2: Js3); cdecl; overload;
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
//    property a: Jn3 read _Geta write _Seta;
//    property b: Jc0 read _Getb write _Setb;
//    property c: Jo3 read _Getc write _Setc;
//  end;

//  TJp3 = class(TJavaGenericImport<Jp3Class, Jp3>) end;

//  Jp4Class = interface(JObjectClass)
//  ['{BFA717F1-5D33-4F29-9845-2C2F4990F03A}']
//    { static Property Methods }
//    {class} function _Getb: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jp4; cdecl;
//
//    { static Property }
//    {class} property b: JObject read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/p4')]
//  Jp4 = interface(JObject)
//  ['{59816CCC-6D6B-4B7B-B910-2FB85AB4E1FA}']
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

//  TJp4 = class(TJavaGenericImport<Jp4Class, Jp4>) end;

//  JqClass = interface(JObjectClass)
//  ['{0BA606CD-D748-4A7E-BD8C-0552CE7A91FA}']
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
//  ['{359BC4E1-9EDC-48B1-A0B7-85A95AAD4619}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JUri): JJSONObject; cdecl; overload;
//    function a(P1: JContext): JJSONObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJq = class(TJavaGenericImport<JqClass, Jq>) end;

//  Jq0Class = interface(JLambdaClass) // or JObjectClass
//  ['{441F9DF3-4B10-4BD2-824F-46957FD075B5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JViewExposureManager): Jq0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q0')]
//  Jq0 = interface(JLambda) // or JObject
//  ['{732FD0F7-450E-4BD9-A55C-FB653DF23B8D}']
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

//  TJq0 = class(TJavaGenericImport<Jq0Class, Jq0>) end;

//  Jq1Class = interface(Jd1Class) // or JObjectClass
//  ['{C0709DD3-B87E-4455-99B9-10B1CFDD20DC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jq1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q1')]
//  Jq1 = interface(Jd1) // or JObject
//  ['{0ABC4DE7-D747-4F3E-A155-DA82C1A6F096}']
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

//  TJq1 = class(TJavaGenericImport<Jq1Class, Jq1>) end;

//  Jq2Class = interface(JObjectClass)
//  ['{0D83FA5C-986F-43D2-B2EE-761C86D3F0BD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je3): Jq2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q2')]
//  Jq2 = interface(JObject)
//  ['{8388D6B6-A570-4A37-A86B-52819E6FBF89}']
//    { Property Methods }
//    function _Geta: Je3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Je3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function execute(P1: Byte; P2: JString; P3: JJSONObject; P4: JMap; P5: Byte; P6: Boolean; P7: Integer): TJavaArray<Byte>; cdecl;
//
//    { Property }
//    property a: Je3 read _Geta write _Seta;
//  end;

//  TJq2 = class(TJavaGenericImport<Jq2Class, Jq2>) end;

//  Jq3Class = interface(Jj3Class) // or JObjectClass
//  ['{F4A3EE1D-77B9-4A29-A491-608185478962}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq3; cdecl; overload;
//    {class} function init(P1: JString): Jq3; cdecl; overload;
//    {class} function init(P1: JString; P2: Boolean): Jq3; cdecl; overload;
//    {class} function init(P1: JString; P2: JJSONObject): Jq3; cdecl; overload;
//    {class} function init(P1: JString; P2: JString; P3: Boolean; P4: JString): Jq3; cdecl; overload;
//    {class} function init(P1: JString; P2: JString; P3: Boolean; P4: JString; P5: Integer): Jq3; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q3')]
//  Jq3 = interface(Jj3) // or JObject
//  ['{ADE9E524-A5AC-4297-AC8A-3458E16E8F9E}']
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
//    function a(P1: JJSONObject): Jj3; cdecl; overload;
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

//  TJq3 = class(TJavaGenericImport<Jq3Class, Jq3>) end;

//  Jq4Class = interface(JObjectClass)
//  ['{47ACC93F-98E8-4095-BB76-4E1C63ED85EA}']
//    { static Property Methods }
//    {class} function _Geta: Jp4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JString): JString; cdecl;
//    {class} function init: Jq4; cdecl;
//
//    { static Property }
//    {class} property a: Jp4 read _Geta;
//    {class} property b: JMap read _Getb;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/q4')]
//  Jq4 = interface(JObject)
//  ['{326597B4-A576-4414-BFBA-8CB3CAD0DAB5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJq4 = class(TJavaGenericImport<Jq4Class, Jq4>) end;

//  JrClass = interface(JObjectClass)
//  ['{66B49438-3F7F-44B2-99F6-81BBC3527854}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: JString): Jr; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r')]
//  Jr = interface(JObject)
//  ['{19899051-11F3-486E-8C10-4F85BCAFFC0D}']
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

//  Jr0_aClass = interface(JObjectClass)
//  ['{A9086B9C-80A3-420A-87C0-9614543A9A69}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jr0): Jr0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r0$a')]
//  Jr0_a = interface(JObject)
//  ['{878A05AF-25BC-4191-8E6D-502E834245CE}']
//    { Property Methods }
//    function _Geta: Jr0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jr0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onDraw; cdecl;
//
//    { Property }
//    property a: Jr0 read _Geta write _Seta;
//  end;

//  TJr0_a = class(TJavaGenericImport<Jr0_aClass, Jr0_a>) end;

//  Jr0_bClass = interface(JObjectClass)
//  ['{EA5C23A9-9880-45FD-A381-92F65AC83D3B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jr0): Jr0_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r0$b')]
//  Jr0_b = interface(JObject)
//  ['{D1DE3FE3-3F27-43E3-81EC-EEBD19A0C624}']
//    { Property Methods }
//    function _Geta: Jr0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jr0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onGlobalFocusChanged(P1: JView; P2: JView); cdecl;
//
//    { Property }
//    property a: Jr0 read _Geta write _Seta;
//  end;

//  TJr0_b = class(TJavaGenericImport<Jr0_bClass, Jr0_b>) end;

//  Jr0_cClass = interface(JObjectClass)
//  ['{EAEE4175-3887-4A1B-A8D1-B4675685B0C5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jr0): Jr0_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r0$c')]
//  Jr0_c = interface(JObject)
//  ['{29811D8C-9EE9-483A-8881-0EB7D01EBABB}']
//    { Property Methods }
//    function _Geta: Jr0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jr0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onGlobalLayout; cdecl;
//
//    { Property }
//    property a: Jr0 read _Geta write _Seta;
//  end;

//  TJr0_c = class(TJavaGenericImport<Jr0_cClass, Jr0_c>) end;

//  Jr0_dClass = interface(JObjectClass)
//  ['{E2AB762E-319B-4C4B-8D07-03C848013AE4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jr0): Jr0_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r0$d')]
//  Jr0_d = interface(JObject)
//  ['{26C43750-1930-4F84-AB63-7E4F78D1DC56}']
//    { Property Methods }
//    function _Geta: Jr0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jr0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onScrollChanged; cdecl;
//
//    { Property }
//    property a: Jr0 read _Geta write _Seta;
//  end;

//  TJr0_d = class(TJavaGenericImport<Jr0_dClass, Jr0_d>) end;

//  Jr0_eClass = interface(JObjectClass)
//  ['{1ECB5352-ED53-44B3-ACF7-1B25AE8D2DAE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jr0): Jr0_e; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r0$e')]
//  Jr0_e = interface(JObject)
//  ['{16107C2C-978A-48C9-83BA-EF90BAF8D889}']
//    { Property Methods }
//    function _Geta: Jr0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jr0);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure onWindowFocusChanged(P1: Boolean); cdecl;
//
//    { Property }
//    property a: Jr0 read _Geta write _Seta;
//  end;

//  TJr0_e = class(TJavaGenericImport<Jr0_eClass, Jr0_e>) end;

//  Jr0Class = interface(JObjectClass)
//  ['{CFF56D53-1326-4515-8A10-93C72C6E8FDD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JApplication): Jr0; cdecl;
//    {class} procedure a(P1: Jr0); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r0')]
//  Jr0 = interface(JObject)
//  ['{6037766C-B302-4E11-841F-44327CE7305F}']
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
//    function _Geth: JFunction1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: JFunction1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: JApplication;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JApplication);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure b(P1: JFunction1); cdecl;
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
//    property h: JFunction1 read _Geth write _Seth;
//    property i: JApplication read _Geti write _Seti;
//  end;

//  TJr0 = class(TJavaGenericImport<Jr0Class, Jr0>) end;

//  Jr1Class = interface(Jd1Class) // or JObjectClass
//  ['{D4B9C7AC-187D-40D8-8721-E15DA48A1C9B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Ji1): Jr1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r1')]
//  Jr1 = interface(Jd1) // or JObject
//  ['{0279F0FB-5A16-4E39-B06D-7B40F2EEF59C}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//    property f: Ji1 read _Getf write _Setf;
//  end;

//  TJr1 = class(TJavaGenericImport<Jr1Class, Jr1>) end;

//  Jr2Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{66E90522-FA9C-441F-8D0B-329B645207F7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r2')]
//  Jr2 = interface(JBroadcastReceiver) // or JObject
//  ['{A430385A-B6D9-49B3-92A4-4A9454EC0546}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
//
//    { Property }
//  end;

//  TJr2 = class(TJavaGenericImport<Jr2Class, Jr2>) end;

//  Jr3Class = interface(Jj3Class) // or JObjectClass
//  ['{6DBAB399-FB37-4FF6-AB36-A3476BF5CE5E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/r3')]
//  Jr3 = interface(Jj3) // or JObject
//  ['{F5DE439D-BA8F-4A21-A8C1-431DD623EBCB}']
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
//    function a(P1: JJSONObject): Jj3; cdecl; overload;
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

//  TJr3 = class(TJavaGenericImport<Jr3Class, Jr3>) end;

//  Jr4Class = interface(JObjectClass)
//  ['{DD005C51-B00C-4F2D-9EBC-6103AAA2B9B7}']
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

//  [JavaSignature('com/bytedance/bdtracker/r4')]
//  Jr4 = interface(JObject)
//  ['{69608F4D-F7C0-434A-BF73-EAA040C5EC0A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr4 = class(TJavaGenericImport<Jr4Class, Jr4>) end;

//  JsClass = interface(JObjectClass)
//  ['{FA6C9173-3F4E-454A-A249-A794CE9F8679}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jt3): Js; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s')]
//  Js = interface(JObject)
//  ['{E344FDA7-5A83-4E1D-8E78-3D4DDD8B4879}']
//    { Property Methods }
//    function _Geta: Jt3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jt3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Jj3; cdecl;
//
//    { Property }
//    property a: Jt3 read _Geta write _Seta;
//  end;

//  TJs = class(TJavaGenericImport<JsClass, Js>) end;

//  Js0Class = interface(JObjectClass)
//  ['{0715B8A1-236A-4ECD-8BAD-6FB3223C1AFF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHashSet; P2: JHashMap): Js0; cdecl;
//    {class} function a(P1: JContext; P2: JString; P3: JJSONObject): Js0; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s0')]
//  Js0 = interface(JObject)
//  ['{E8AF0E39-C9B7-4817-BCFB-F62CFA124079}']
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

//  TJs0 = class(TJavaGenericImport<Js0Class, Js0>) end;

//  Js1Class = interface(Jd1Class) // or JObjectClass
//  ['{26446B7F-8EDB-4576-9ECC-70BDA69CABCC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext; P3: Ji1): Js1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s1')]
//  Js1 = interface(Jd1) // or JObject
//  ['{FD8EBD38-7963-45A8-8D74-4140AD5ADBCD}']
//    { Property Methods }
//    function _Gete: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Jd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Jd);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JContext read _Gete write _Sete;
//    property f: Jd read _Getf write _Setf;
//    property g: Ji1 read _Getg write _Setg;
//  end;

//  TJs1 = class(TJavaGenericImport<Js1Class, Js1>) end;

//  Js2Class = interface(JRangersHttpExceptionClass) // or JObjectClass
//  ['{BE14B75A-AE6F-4C7F-B07B-CC68953DB389}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Js2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s2')]
//  Js2 = interface(JRangersHttpException) // or JObject
//  ['{D2E38BCC-F158-4C39-9873-0EAA67853CF8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJs2 = class(TJavaGenericImport<Js2Class, Js2>) end;

//  Js3Class = interface(Jj3Class) // or JObjectClass
//  ['{AFE6FAE0-BAED-4E6F-9FFD-824352DD5B5C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Js3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s3')]
//  Js3 = interface(Jj3) // or JObject
//  ['{92AA778D-0501-46DB-9635-83E25182C436}']
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
//    function a(P1: JJSONObject): Jj3; cdecl; overload;
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

//  TJs3 = class(TJavaGenericImport<Js3Class, Js3>) end;

//  Js4Class = interface(JObjectClass)
//  ['{0F865AB4-067A-4626-BD67-12ED695C0B1D}']
//    { static Property Methods }
//    {class} function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a(P1: JIAppLogLogger; P2: JString; P3: JJSONObject); cdecl; overload;
//    {class} procedure a(P1: JIAppLogLogger; P2: JMap); cdecl; overload;
//    {class} procedure a(P1: JIAppLogLogger; P2: JJSONObject); cdecl; overload;
//    {class} function init: Js4; cdecl;
//
//    { static Property }
//    {class} property a: JList read _Geta;
//    {class} property b: JPattern read _Getb;
//    {class} property c: JList read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/s4')]
//  Js4 = interface(JObject)
//  ['{356FD06C-6D26-432E-82FD-017A821DBB5E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJs4 = class(TJavaGenericImport<Js4Class, Js4>) end;

//  JtClass = interface(JObjectClass)
//  ['{7F5D006C-4209-4D0D-9E0D-A507E8ADE706}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t')]
//  Jt = interface(JObject)
//  ['{BB5D7349-3F63-4B7F-AF24-2CB6BB4479C3}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJt = class(TJavaGenericImport<JtClass, Jt>) end;

//  Jt0Class = interface(Js0Class) // or JObjectClass
//  ['{098AFBAE-4BD3-4320-8D33-70286989775A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHashSet; P2: JHashMap): Jt0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t0')]
//  Jt0 = interface(Js0) // or JObject
//  ['{831C402F-CDB1-4C8A-BC64-9C0BE7202CD8}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): Boolean; cdecl; overload;
//    function a(P1: JHashSet; P2: JString): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJt0 = class(TJavaGenericImport<Jt0Class, Jt0>) end;

//  Jt1Class = interface(Jd1Class) // or JObjectClass
//  ['{F20206E3-2B91-4B85-9964-4D34A9B6A7EA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ji1): Jt1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t1')]
//  Jt1 = interface(Jd1) // or JObject
//  ['{95B73679-9AE5-405F-97B1-5738488B5B8A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//  end;

//  TJt1 = class(TJavaGenericImport<Jt1Class, Jt1>) end;

//  Jt2_aClass = interface(JObjectClass)
//  ['{9AA79BFF-0C11-4F86-9E88-D6FC56A0161E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jt2; P2: JMap; P3: JIDBindCallback): Jt2_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t2$a')]
//  Jt2_a = interface(JObject)
//  ['{CD3C8C1C-DDFF-44BF-BA9F-807020D65EA3}']
//    { Property Methods }
//    function _Geta: Jt2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jt2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JMap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: JIDBindCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JIDBindCallback);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jt2 read _Geta write _Seta;
//    property b: JMap read _Getb write _Setb;
//    property c: JIDBindCallback read _Getc write _Setc;
//  end;

//  TJt2_a = class(TJavaGenericImport<Jt2_aClass, Jt2_a>) end;

//  Jt2Class = interface(JObjectClass)
//  ['{6CAC622C-E84D-4414-AF64-E30C450EC7A3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jt2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t2')]
//  Jt2 = interface(JObject)
//  ['{49641D3A-E405-4B69-927F-91F16FC09B43}']
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

//  TJt2 = class(TJavaGenericImport<Jt2Class, Jt2>) end;

//  Jt3Class = interface(Jj3Class) // or JObjectClass
//  ['{315D8539-4073-4095-92CD-3F5A3D9BDD65}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t3')]
//  Jt3 = interface(Jj3) // or JObject
//  ['{82570A97-25FE-4AAD-A3B2-476AEF530118}']
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
//    function a(P1: JJSONObject): Jj3; cdecl; overload;
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

//  TJt3 = class(TJavaGenericImport<Jt3Class, Jt3>) end;

//  Jt4Class = interface(JObjectClass)
//  ['{4E406AE8-B169-4EF4-BC6E-6E994FD45840}']
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
//    {class} function init: Jt4; cdecl;
//
//    { static Property }
//    {class} property a: JSparseArray read _Geta;
//    {class} property b: JSet read _Getb;
//    {class} property c: JLruCache read _Getc;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/t4')]
//  Jt4 = interface(JObject)
//  ['{C573CC0C-D360-47AD-AB1D-44A6149B6AE3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt4 = class(TJavaGenericImport<Jt4Class, Jt4>) end;

//  JuClass = interface(JObjectClass)
//  ['{BA50E83B-9537-484A-BCEC-E98F09F905AD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jt3): Ju; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u')]
//  Ju = interface(JObject)
//  ['{5039E0EC-B5CD-44B9-92CE-E1FFC55FBFF0}']
//    { Property Methods }
//    function _Geta: Jt3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jt3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Jd): Boolean; cdecl;
//
//    { Property }
//    property a: Jt3 read _Geta write _Seta;
//  end;

//  TJu = class(TJavaGenericImport<JuClass, Ju>) end;

//  Ju0Class = interface(Js0Class) // or JObjectClass
//  ['{A0E08717-AD98-44DF-AF33-0E357E6127E4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHashSet; P2: JHashMap): Ju0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u0')]
//  Ju0 = interface(Js0) // or JObject
//  ['{830D14BF-6250-48B5-9F4D-22BDC79E7FE9}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): Boolean; cdecl; overload;
//    function a(P1: JHashSet; P2: JString): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJu0 = class(TJavaGenericImport<Ju0Class, Ju0>) end;

//  Ju1Class = interface(Jd1Class) // or JObjectClass
//  ['{82ABF181-B394-4C22-995D-5080EF8E768E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Ji1; P3: Jk1; P4: JISensitiveInfoProvider): Ju1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u1')]
//  Ju1 = interface(Jd1) // or JObject
//  ['{0416654A-F76E-4E11-BF08-30D1751D70B1}']
//    { Property Methods }
//    function _Gete: JISensitiveInfoProvider;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: JISensitiveInfoProvider);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Jk1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Jk1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: JISensitiveInfoProvider read _Gete write _Sete;
//    property f: JContext read _Getf write _Setf;
//    property g: Ji1 read _Getg write _Setg;
//    property h: Jk1 read _Geth write _Seth;
//  end;

//  TJu1 = class(TJavaGenericImport<Ju1Class, Ju1>) end;

//  Ju2Class = interface(JObjectClass)
//  ['{6A78D6F5-F346-4D8F-8353-D08248BBC747}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIDBindCallback; P2: Integer; P3: JString): Ju2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u2')]
//  Ju2 = interface(JObject)
//  ['{067B102E-5FCA-4E14-9C15-5A2CF1E6D11F}']
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

//  TJu2 = class(TJavaGenericImport<Ju2Class, Ju2>) end;

//  Ju3Class = interface(Jj3Class) // or JObjectClass
//  ['{85642782-6C1A-4B1F-A93D-872E8BB8E855}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ju3; cdecl; overload;
//    {class} function init(P1: JString; P2: JString): Ju3; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u3')]
//  Ju3 = interface(Jj3) // or JObject
//  ['{3DA134CE-4054-4EA2-8971-0E903B156E13}']
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
//    function a(P1: JJSONObject): Jj3; cdecl; overload;
//    function f: JString; cdecl;
//    function c: JString; cdecl;
//    function e: JString; cdecl;
//
//    { Property }
//    property s: JString read _Gets write _Sets;
//    property t: JString read _Gett write _Sett;
//  end;

//  TJu3 = class(TJavaGenericImport<Ju3Class, Ju3>) end;

//  Ju4Class = interface(JObjectClass)
//  ['{5551A679-5D33-4BCE-B332-8FEF86173E97}']
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
//    {class} function init: Ju4; cdecl;
//
//    { static Property }
//    {class} property a: JList read _Geta;
//    {class} property b: JField read _Getb;
//    {class} property c: JClass read _Getc;
//    {class} property d: JClass read _Getd;
//    {class} property e: Boolean read _Gete;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/u4')]
//  Ju4 = interface(JObject)
//  ['{04562F60-4FB0-4C31-A6EB-4175ACE28812}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu4 = class(TJavaGenericImport<Ju4Class, Ju4>) end;

//  JvClass = interface(JObjectClass)
//  ['{D6ECA1DC-FC53-4D5C-8650-199B4E778112}']
//    { static Property Methods }
//    {class} function _Geta: Ji0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jt3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jt3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jt3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: JHashSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Jv;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jv; cdecl; overload;
//    {class} function a(P1: JApplication): Jv; cdecl; overload;
//    {class} function a: Jt3; cdecl; overload;
//    {class} function a(P1: JClass; P2: Boolean; P3: JString; P4: JString; P5: JString; P6: JString; P7: Int64; P8: JJSONObject): Jt3; cdecl; overload;
//    {class} function a(P1: Boolean; P2: Jt3; P3: Int64): Jt3; cdecl; overload;
//    {class} function init: Jv; cdecl; overload;
//
//    { static Property }
//    {class} property a: Ji0 read _Geta;
//    {class} property b: Boolean read _Getb;
//    {class} property c: Integer read _Getc;
//    {class} property d: Jt3 read _Getd;
//    {class} property e: Jt3 read _Gete;
//    {class} property f: Int64 read _Getf;
//    {class} property g: JString read _Getg;
//    {class} property h: JObject read _Geth;
//    {class} property i: Int64 read _Geti;
//    {class} property j: JMap read _Getj;
//    {class} property k: JList read _Getk;
//    {class} property l: Jt3 read _Getl;
//    {class} property m: JHashSet read _Getm;
//    {class} property n: Jv read _Getn;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v')]
//  Jv = interface(JObject)
//  ['{92871268-D803-40BF-9F03-5405741D99ED}']
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
//  ['{A1417C8A-44CB-4150-A22F-892D52B5BA48}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jv0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v0')]
//  Jv0 = interface(JObject)
//  ['{10CF6828-FBB1-4582-B5CE-C395401C37EB}']
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

//  TJv0 = class(TJavaGenericImport<Jv0Class, Jv0>) end;

//  Jv1Class = interface(Jd1Class) // or JObjectClass
//  ['{B3E53EAC-6C15-4950-B18A-A0467BACD96F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Ji1; P3: Jk1): Jv1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v1')]
//  Jv1 = interface(Jd1) // or JObject
//  ['{49A578C0-27AC-4FF8-9214-EBC25029DCBB}']
//    { Property Methods }
//    function _Gete: Ji1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Ji1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JJSONObject): Boolean; cdecl; overload;
//    function a: JString; cdecl; overload;
//
//    { Property }
//    property e: Ji1 read _Gete write _Sete;
//  end;

//  TJv1 = class(TJavaGenericImport<Jv1Class, Jv1>) end;

//  Jv2Class = interface(JObjectClass)
//  ['{D821472D-CF25-45AE-B887-903F1D6217BE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIDBindCallback; P2: JIDBindResult): Jv2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v2')]
//  Jv2 = interface(JObject)
//  ['{8C07EB50-5058-4164-A463-25E4F60E4150}']
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

//  TJv2 = class(TJavaGenericImport<Jv2Class, Jv2>) end;

//  Jv3_aClass = interface(JObjectClass)
//  ['{0F22C3E8-9DF1-425A-A124-48823E14C417}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v3$a')]
//  Jv3_a = interface(IJavaInstance)
//  ['{AEA8C2CB-8A45-4F0A-92F9-EA9BA40FBBBF}']
//    { Property Methods }
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//  end;

//  TJv3_a = class(TJavaGenericImport<Jv3_aClass, Jv3_a>) end;

//  Jv3Class = interface(Jk3Class) // or JObjectClass
//  ['{874E71DC-905F-41E9-9DC9-4119DAD43774}']
//    { static Property Methods }
//    {class} function _Getf: Jv3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JContext): Jv3; cdecl; overload;
//    {class} function init(P1: JContext; P2: JString; P3: Boolean): Jv3; cdecl; overload;
//    {class} function init(P1: JContext; P2: JString; P3: JString): Jv3; cdecl; overload;
//    {class} function a(P1: JContext; P2: JString; P3: Integer): JSharedPreferences; cdecl; overload;
//
//    { static Property }
//    {class} property f: Jv3 read _Getf;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v3')]
//  Jv3 = interface(Jk3) // or JObject
//  ['{DAA3952A-49A7-48C0-9DD9-9D29D100529F}']
//    { Property Methods }
//    function _Getc: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: JSharedPreferences;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: JSharedPreferences);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: JString; P2: Jv3_a): JString; cdecl; overload;
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

//  TJv3 = class(TJavaGenericImport<Jv3Class, Jv3>) end;

//  Jv4Class = interface(JObjectClass)
//  ['{A327ECA3-1955-4344-8871-64952C45D350}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jv4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/v4')]
//  Jv4 = interface(JObject)
//  ['{20AAE11D-53AA-4BF8-BB16-A76EC200C299}']
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

//  TJv4 = class(TJavaGenericImport<Jv4Class, Jv4>) end;

//  Jw_aClass = interface(JObjectClass)
//  ['{277579D1-9487-4CA1-AE32-A63E5E322BD5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w$a')]
//  Jw_a = interface(JObject)
//  ['{7FE94C67-1215-4444-A39E-29312F7AAE89}']
//    { Property Methods }
//
//    { methods }
//    procedure rejectedExecution(P1: JRunnable; P2: JThreadPoolExecutor); cdecl;
//
//    { Property }
//  end;

//  TJw_a = class(TJavaGenericImport<Jw_aClass, Jw_a>) end;

//  Jw_bClass = interface(JObjectClass)
//  ['{236C9742-73B0-43D3-BE29-13290F0E3736}']
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
//  ['{0420E8FA-7E88-4C8B-A40B-D0A268591DA0}']
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
//  ['{C1D94F7C-CFB2-482C-94BD-D90B66AD8EDD}']
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
//  ['{1C5DE41F-7829-42AA-92B5-93E7F1B2A884}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw = class(TJavaGenericImport<JwClass, Jw>) end;

//  Jw0Class = interface(JObjectClass)
//  ['{282B073A-3521-4592-8BA3-D37467ABC9FA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w0')]
//  Jw0 = interface(JObject)
//  ['{38989861-2F7C-40A8-BBB8-9EE4BA9BE5C5}']
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

//  TJw0 = class(TJavaGenericImport<Jw0Class, Jw0>) end;

//  Jw1Class = interface(Jd1Class) // or JObjectClass
//  ['{5D444CF3-7237-4CB6-A010-B8D687969043}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd; P2: JContext): Jw1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w1')]
//  Jw1 = interface(Jd1) // or JObject
//  ['{9E6D369E-1EFD-42B5-808B-A2749F9C0E0F}']
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

//  TJw1 = class(TJavaGenericImport<Jw1Class, Jw1>) end;

//  Jw2Class = interface(JObjectClass)
//  ['{72685430-CDFC-40EF-9B31-B4F3ABB148A0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w2')]
//  Jw2 = interface(JObject)
//  ['{36322FFA-6874-4139-A1CF-8E01D5CF7263}']
//    { Property Methods }
//
//    { methods }
//    procedure onEventV3(P1: JString; P2: JJSONObject); cdecl; overload;
//    procedure onEventV3(P1: JString; P2: JBundle); cdecl; overload;
//
//    { Property }
//  end;

//  TJw2 = class(TJavaGenericImport<Jw2Class, Jw2>) end;

//  Jw3Class = interface(Jj3Class) // or JObjectClass
//  ['{4832DF5B-5872-4819-9A69-0F507D4534DB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w3')]
//  Jw3 = interface(Jj3) // or JObject
//  ['{4A37BDE1-DA90-40D1-A680-8A5DE59B25B4}']
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
//    function a(P1: JJSONObject): Jj3; cdecl;
//    function f: JString; cdecl;
//    function c: JString; cdecl;
//
//    { Property }
//    property s: Int64 read _Gets write _Sets;
//    property t: Int64 read _Gett write _Sett;
//    property u: JString read _Getu write _Setu;
//  end;

//  TJw3 = class(TJavaGenericImport<Jw3Class, Jw3>) end;

//  Jw4_aClass = interface(Jv4Class) // or JObjectClass
//  ['{AF1E512F-0EEF-4F39-A762-D8C7DA4B9900}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w4$a')]
//  Jw4_a = interface(Jv4) // or JObject
//  ['{37FEDA4E-44E5-4EB2-9398-D366A9B135AA}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJw4_a = class(TJavaGenericImport<Jw4_aClass, Jw4_a>) end;

//  Jw4Class = interface(JObjectClass)
//  ['{833ACF77-A917-4C24-9E19-90AB9117D27A}']
//    { static Property Methods }
//    {class} function _Geta: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jw4; cdecl;
//
//    { static Property }
//    {class} property a: Jv4 read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/w4')]
//  Jw4 = interface(JObject)
//  ['{B8937A63-7CAF-4367-9B0C-87B72FF107C7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw4 = class(TJavaGenericImport<Jw4Class, Jw4>) end;

//  JxClass = interface(JThreadPoolExecutorClass) // or JObjectClass
//  ['{BAAB1AED-4FCF-4A56-AF8D-03B9C5C89442}']
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
//  ['{862C71FA-9AF2-4B85-8D1B-E67E3D080DDB}']
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
//  ['{5A46E694-FDA8-4F83-892B-63926A1A6956}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jx0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x0')]
//  Jx0 = interface(JObject)
//  ['{8B74684E-469C-4F4E-BDFD-023C0E8CFDEF}']
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

//  TJx0 = class(TJavaGenericImport<Jx0Class, Jx0>) end;

//  Jx1Class = interface(Jd1Class) // or JObjectClass
//  ['{97DF1A55-FEF3-4FE6-B76C-573DF4F8D98F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jx1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x1')]
//  Jx1 = interface(Jd1) // or JObject
//  ['{E9FD268A-53C4-49F5-A865-E39B60E9E1EA}']
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

//  TJx1 = class(TJavaGenericImport<Jx1Class, Jx1>) end;

//  Jx2Class = interface(JObjectClass)
//  ['{78A38DA2-1408-40AC-8F77-EE6DEE9E71D2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDeviceComponentRegistrar_a; P2: JComponentContainer): Jx2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x2')]
//  Jx2 = interface(JObject)
//  ['{C7113D58-77BA-4748-8781-7875D287512C}']
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

//  TJx2 = class(TJavaGenericImport<Jx2Class, Jx2>) end;

//  Jx3Class = interface(Jj3Class) // or JObjectClass
//  ['{669544AA-7A4D-4E7F-99B4-54DF53594816}']
//    { static Property Methods }
//    {class} function _Gets: JJSONObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jx3; cdecl; overload;
//    {class} function init: Jx3; cdecl; overload;
//
//    { static Property }
//    {class} property s: JJSONObject read _Gets;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x3')]
//  Jx3 = interface(Jj3) // or JObject
//  ['{6F5184D1-6F27-4526-9686-439E8D0B9599}']
//    { Property Methods }
//
//    { methods }
//    function i: JJSONObject; cdecl;
//    function f: JString; cdecl;
//
//    { Property }
//  end;

//  TJx3 = class(TJavaGenericImport<Jx3Class, Jx3>) end;

//  Jx4_aClass = interface(Jv4Class) // or JObjectClass
//  ['{04B0FA72-83C6-4283-998B-B9F6CB2F27E6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jx4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x4$a')]
//  Jx4_a = interface(Jv4) // or JObject
//  ['{19503E75-FB13-4745-9724-6E7FF9D529EA}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJx4_a = class(TJavaGenericImport<Jx4_aClass, Jx4_a>) end;

//  Jx4Class = interface(JObjectClass)
//  ['{EB7E9294-5BB9-4789-A273-955A815C2F11}']
//    { static Property Methods }
//    {class} function _Geta: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JSharedPreferences): JString; cdecl; overload;
//    {class} function a(P1: JContext): JMap; cdecl; overload;
//    {class} function a(P1: JJSONObject): JString; cdecl; overload;
//    {class} procedure a(P1: JIOaidObserver); cdecl; overload;
//    {class} procedure a(P1: Jg); cdecl; overload;
//    {class} procedure b(P1: JIOaidObserver); cdecl;
//    {class} function init: Jx4; cdecl;
//
//    { static Property }
//    {class} property a: Jv4 read _Geta;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/x4')]
//  Jx4 = interface(JObject)
//  ['{D8E7E5B3-B36D-456C-8DC2-B849B2DCC631}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJx4 = class(TJavaGenericImport<Jx4Class, Jx4>) end;

//  JyClass = interface(Ja0Class) // or JObjectClass
//  ['{32A12B67-C545-4270-A104-513ACF3CBCFE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jy; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y')]
//  Jy = interface(Ja0) // or JObject
//  ['{2F44AF10-2F33-4015-B82C-8B5FCED36589}']
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
//  ['{12A09C13-7428-45CA-8DA3-2952B4BC1FB2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Jy0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y0')]
//  Jy0 = interface(JObject)
//  ['{0CC9A46C-AB34-4393-9E04-76C5C23122F5}']
//    { Property Methods }
//
//    { methods }
//    procedure onLog(P1: JLogInfo); cdecl;
//
//    { Property }
//  end;

//  TJy0 = class(TJavaGenericImport<Jy0Class, Jy0>) end;

//  Jy1Class = interface(JObjectClass)
//  ['{98D9B7D6-DB3B-4CBD-AAA7-271942DCA03F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y1')]
//  Jy1 = interface(JObject)
//  ['{4B030BD8-091C-467F-A147-4FECF4114911}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJy1 = class(TJavaGenericImport<Jy1Class, Jy1>) end;

//  Jy2Class = interface(JObjectClass)
//  ['{8F9D5A38-FC19-4989-BC1A-17FE4C953B7B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jy2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y2')]
//  Jy2 = interface(JObject)
//  ['{223AEA7B-4F3E-416F-B0CD-0D1020DC4374}']
//    { Property Methods }
//
//    { methods }
//    function getDeviceID: JString; cdecl;
//    function getInstallID: JString; cdecl;
//    function getSsID: JString; cdecl;
//
//    { Property }
//  end;

//  TJy2 = class(TJavaGenericImport<Jy2Class, Jy2>) end;

//  Jy3Class = interface(JObjectClass)
//  ['{8A9701F8-9314-4565-9F74-8E092B73E4CA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jy3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y3')]
//  Jy3 = interface(JObject)
//  ['{E11921DF-33C4-4703-BCE7-E2220A142F85}']
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

//  TJy3 = class(TJavaGenericImport<Jy3Class, Jy3>) end;

//  Jy4Class = interface(JObjectClass)
//  ['{2CB8336A-3C99-40C9-A4FC-7CB7A9F79FC1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JRunnable; P2: JString): Jy4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/y4')]
//  Jy4 = interface(JObject)
//  ['{2C043EAB-8534-48FB-9797-3D2C4714C71E}']
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

//  TJy4 = class(TJavaGenericImport<Jy4Class, Jy4>) end;

//  JzClass = interface(Ja0Class) // or JObjectClass
//  ['{3ED44A28-8517-4BAC-BB5B-F2F0E5BA121E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jz; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z')]
//  Jz = interface(Ja0) // or JObject
//  ['{A937DA3C-8B2E-4ECF-B428-E91763712C8B}']
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

//  Jz0Class = interface(JObjectClass)
//  ['{0125D27C-DA34-4594-9D7D-076E6BC6F23C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JILogger): Jz0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z0')]
//  Jz0 = interface(JObject)
//  ['{C23E6A50-0682-400B-8584-3B4342116ED3}']
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

//  TJz0 = class(TJavaGenericImport<Jz0Class, Jz0>) end;

//  Jz1Class = interface(JObjectClass)
//  ['{916D051E-0F28-48E4-9E3F-4935F58930AD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z1')]
//  Jz1 = interface(IJavaInstance)
//  ['{B68C0024-EE53-4698-97CF-EEE50A885FE9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz1 = class(TJavaGenericImport<Jz1Class, Jz1>) end;

//  Jz2_aClass = interface(JObjectClass)
//  ['{8D7E2EF3-C305-4794-8577-4F820BFA3311}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jz2; P2: JSet; P3: JString; P4: Boolean): Jz2_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z2$a')]
//  Jz2_a = interface(JObject)
//  ['{EFA86FA2-5E23-46C1-9743-B8CC195C0094}']
//    { Property Methods }
//    function _Geta: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JSet);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function fetch: JObject; cdecl;
//
//    { Property }
//    property a: JSet read _Geta write _Seta;
//    property b: JString read _Getb write _Setb;
//    property c: Boolean read _Getc write _Setc;
//  end;

//  TJz2_a = class(TJavaGenericImport<Jz2_aClass, Jz2_a>) end;

//  Jz2_bClass = interface(JObjectClass)
//  ['{FCF81D30-BC8D-4011-86EB-3A82289DBB06}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Int64; P2: JString; P3: JJSONObject): Jz2_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z2$b')]
//  Jz2_b = interface(JObject)
//  ['{D74A38F4-1757-46F3-8F37-EE8F42DDD8D1}']
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

//  TJz2_b = class(TJavaGenericImport<Jz2_bClass, Jz2_b>) end;

//  Jz2Class = interface(JObjectClass)
//  ['{9E75EE8F-726B-4231-BC92-01E5295B1773}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc0): Jz2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z2')]
//  Jz2 = interface(JObject)
//  ['{33965925-1619-4092-9087-7C7C4E32DC00}']
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
//    procedure a(P1: Integer; P2: Jz2_b); cdecl; overload;
//    procedure a(P1: Jz2_b); cdecl; overload;
//    procedure a(P1: JSet; P2: Boolean); cdecl; overload;
//
//    { Property }
//    property a: Jc0 read _Geta write _Seta;
//    property b: JHandler read _Getb write _Setb;
//    property c: JMap read _Getc write _Setc;
//    property d: JSet read _Getd write _Setd;
//    property e: JString read _Gete write _Sete;
//  end;

//  TJz2 = class(TJavaGenericImport<Jz2Class, Jz2>) end;

//  Jz3Class = interface(JObjectClass)
//  ['{19437860-634F-4F9F-B7E1-C9B261432154}']
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
//    {class} function c(P1: JObject): Boolean; cdecl;
//    {class} function a(P1: JView): Boolean; cdecl; overload;
//    {class} function b(P1: JView): Boolean; cdecl; overload;
//    {class} function init: Jz3; cdecl;
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

//  [JavaSignature('com/bytedance/bdtracker/z3')]
//  Jz3 = interface(JObject)
//  ['{E0D68594-7559-403E-AF24-0FD76E9C5B2B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz3 = class(TJavaGenericImport<Jz3Class, Jz3>) end;

//  Jz4_aClass = interface(JObjectClass)
//  ['{833DE8D4-F391-41F9-A999-59550726A85A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jz4): Jz4_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z4$a')]
//  Jz4_a = interface(JObject)
//  ['{BB81E236-1133-4F2A-9E30-3E0FF7501A2E}']
//    { Property Methods }
//    function _Geta: Jz4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jz4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//    property a: Jz4 read _Geta write _Seta;
//  end;

//  TJz4_a = class(TJavaGenericImport<Jz4_aClass, Jz4_a>) end;

//  Jz4Class = interface(JObjectClass)
//  ['{4A421680-D1EB-4230-8B74-C55C14582210}']
//    { static Property Methods }
//    {class} function _Geth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: JMap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JContext): Jz4; cdecl; overload;
//    {class} procedure a(P1: JIOaidObserver); cdecl; overload;
//    {class} procedure b(P1: JIOaidObserver); cdecl; overload;
//    {class} function c: TJavaObjectArray<JObject>; cdecl;
//    {class} procedure a(P1: JIOaidObserver_Oaid; P2: TJavaObjectArray<JObject>); cdecl; overload;
//    {class} procedure a(P1: JJSONObject; P2: JString; P3: JObject); cdecl; overload;
//    {class} procedure a(P1: JMap; P2: JObject; P3: JObject); cdecl; overload;
//    {class} procedure a(P1: Jz4); cdecl; overload;
//    {class} function init: Jz4; cdecl; overload;
//
//    { static Property }
//    {class} property h: JString read _Geth;
//    {class} property i: JString read _Geti;
//    {class} property j: JList read _Getj;
//    {class} property k: Jg read _Getk;
//    {class} property l: JString read _Getl;
//    {class} property m: JMap read _Getm;
//  end;

//  [JavaSignature('com/bytedance/bdtracker/z4')]
//  Jz4 = interface(JObject)
//  ['{F6D07868-9703-424E-9E70-79586EBA7954}']
//    { Property Methods }
//    function _Geta: JReentrantLock;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JReentrantLock);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: JOaidApi;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JOaidApi);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Jb5;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Jb5);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
//    property d: Jb5 read _Getd write _Setd;
//    property e: JContext read _Gete write _Sete;
//    property f: JAtomicBoolean read _Getf write _Setf;
//    property g: JLong read _Getg write _Setg;
//  end;

//  TJz4 = class(TJavaGenericImport<Jz4Class, Jz4>) end;

//  Ja_a_aClass = interface(JObjectClass)
//  ['{633A3D86-0581-4DD8-A73B-06BD1399AECE}']
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
//  ['{3BC3987A-5BE1-4892-B1A6-AFD081D76210}']
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
//  ['{04DB1D07-464B-41C1-8E88-47D852C0B6AD}']
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
//  ['{06572221-EABA-4272-9BDC-42BEDD5B15D5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  Ja_304Class = interface(JObjectClass)
//  ['{9DC9A88F-BB43-4216-9BCE-52B57A12DE2D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/a')]
//  Ja_304 = interface(IJavaInstance)
//  ['{EEF5C45E-D101-4F1E-9D5E-BBF4A5BAF64F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_304 = class(TJavaGenericImport<Ja_304Class, Ja_304>) end;

//  Jb_a_aClass = interface(JObjectClass)
//  ['{201527B1-4480-4AB2-B7F9-1F1287AD7FB4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Jb_a_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/b$a$a')]
//  Jb_a_a = interface(JObject)
//  ['{B8BF852F-7C8F-4672-B387-74090C2443EB}']
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

//  Jb_a_306Class = interface(JBinderClass) // or JObjectClass
//  ['{F12E55A9-DCFB-4135-A8C4-72D444EA7B01}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Jb; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/b$a')]
//  Jb_a_306 = interface(JBinder) // or JObject
//  ['{291B0A63-202D-45E5-9961-258B650BA952}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_a_306 = class(TJavaGenericImport<Jb_a_306Class, Jb_a_306>) end;

//  Jb_307Class = interface(JObjectClass)
//  ['{A8594F62-EA02-4F1A-A7E3-A673BDB8E7BC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/b')]
//  Jb_307 = interface(IJavaInstance)
//  ['{0CBB6076-9E68-440A-86B5-E926D81D86B8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_307 = class(TJavaGenericImport<Jb_307Class, Jb_307>) end;

//  Jc_a_aClass = interface(JObjectClass)
//  ['{E330AD5B-E5F0-4CA1-A29D-4DC69EDDA874}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Jc_a_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/c$a$a')]
//  Jc_a_a = interface(JObject)
//  ['{20D13CEB-2872-4763-98E5-177C35E72BAE}']
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

//  Jc_a_309Class = interface(JBinderClass) // or JObjectClass
//  ['{C3EE444F-EEFC-41A6-9040-CCDCAAA80125}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Jc; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/c$a')]
//  Jc_a_309 = interface(JBinder) // or JObject
//  ['{CA25859B-C56F-4E67-A75D-30198AB14C4C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_a_309 = class(TJavaGenericImport<Jc_a_309Class, Jc_a_309>) end;

//  Jc_310Class = interface(JObjectClass)
//  ['{B99ECFEE-F00B-4B84-AE42-DD5B786C450E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/c')]
//  Jc_310 = interface(IJavaInstance)
//  ['{2F1B000E-85CA-4E4A-B0DF-8BCC73A59DD1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_310 = class(TJavaGenericImport<Jc_310Class, Jc_310>) end;

//  Jd_a_aClass = interface(JObjectClass)
//  ['{82C42835-7C9C-45DD-8A57-0CFD51F24B12}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Jd_a_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/d$a$a')]
//  Jd_a_a = interface(JObject)
//  ['{71D160F4-C2BD-4D90-ACF1-F1E426E4B22C}']
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

//  Jd_a_312Class = interface(JBinderClass) // or JObjectClass
//  ['{01B77E5F-56BF-41FB-89AE-F89D556FC252}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Jd; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/d$a')]
//  Jd_a_312 = interface(JBinder) // or JObject
//  ['{49545CDB-D5AE-4055-8651-8AC760F4B431}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_a_312 = class(TJavaGenericImport<Jd_a_312Class, Jd_a_312>) end;

//  Jd_313Class = interface(JObjectClass)
//  ['{78C17EE2-4FC6-4924-860D-B032CBE65017}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/d')]
//  Jd_313 = interface(IJavaInstance)
//  ['{2F0FB6A3-4ADD-44A4-9DC6-F109F3729CE5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_313 = class(TJavaGenericImport<Jd_313Class, Jd_313>) end;

//  Je_a_aClass = interface(JObjectClass)
//  ['{F0196F46-0F08-4E21-AA75-97BAAEC86C87}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Je_a_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/e$a$a')]
//  Je_a_a = interface(JObject)
//  ['{3A95F49A-E307-4257-9B80-CC4F1B3C03B6}']
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
//  ['{A8A7EE4A-3781-4B58-B1A2-822D938B29F4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Je; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/e$a')]
//  Je_a = interface(JBinder) // or JObject
//  ['{A274E221-E5F2-43D8-B30A-E2EC9AD7C1C4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

//  Je_316Class = interface(JObjectClass)
//  ['{BE8999C3-3C30-4597-AD61-EEEC41BCE958}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/e')]
//  Je_316 = interface(IJavaInstance)
//  ['{A0C5182F-98BC-49DF-AEDE-C44228D2DAD9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_316 = class(TJavaGenericImport<Je_316Class, Je_316>) end;

//  Jf_a_aClass = interface(JObjectClass)
//  ['{622850FD-A915-497A-A5FC-016DB010C2A9}']
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
//  ['{7E9706CC-965D-4C8E-A3D6-D276F59B86E6}']
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
//  ['{B6E377AB-96ED-4F5F-A0D9-9464B3EAC0DF}']
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
//  ['{0782795B-48C2-45FF-8070-F84EFE39763F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_a = class(TJavaGenericImport<Jf_aClass, Jf_a>) end;

//  Jf_319Class = interface(JObjectClass)
//  ['{2F68314B-CF67-4B09-8AC9-0AFE89197AEF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/f')]
//  Jf_319 = interface(IJavaInstance)
//  ['{30E65FDC-9AD1-4C93-B0B1-F0B994F7AD62}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_319 = class(TJavaGenericImport<Jf_319Class, Jf_319>) end;

//  Jg_a_aClass = interface(JObjectClass)
//  ['{8517B630-E9E0-490E-A3A3-E731E2E10D8C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JIBinder): Jg_a_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/g$a$a')]
//  Jg_a_a = interface(JObject)
//  ['{CF009EA7-B356-40F1-87ED-ACD4318B4CE5}']
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
//  ['{CAA534B3-0074-4656-9626-4D7BFA2BB15B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Jg; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/g$a')]
//  Jg_a = interface(JBinder) // or JObject
//  ['{B2212DE8-9631-4FA6-BD02-BEDDF81F56FE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg_a = class(TJavaGenericImport<Jg_aClass, Jg_a>) end;

//  Jg_322Class = interface(JObjectClass)
//  ['{FB27CCD9-4B18-4C37-80FD-06B27568BA5C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/aidl/g')]
//  Jg_322 = interface(IJavaInstance)
//  ['{41E63BA8-2A57-4589-B426-7D4A7E9A21FD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg_322 = class(TJavaGenericImport<Jg_322Class, Jg_322>) end;

//  Ja_a_323Class = interface(JObjectClass)
//  ['{3D5389C0-B274-4AF2-9BCE-358995E6A172}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja): Ja_a_323; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/a$a')]
//  Ja_a_323 = interface(JObject)
//  ['{CA764E72-690C-4CC3-AF7C-CD73C5D62260}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJa_a_323 = class(TJavaGenericImport<Ja_a_323Class, Ja_a_323>) end;

//  Ja_324Class = interface(Jb_326Class) // or JObjectClass
//  ['{B0A5F71D-3725-458F-A89F-472F35F4A9EA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_324; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/a')]
//  Ja_324 = interface(Jb_326) // or JObject
//  ['{BF1C6413-0EE6-4FCB-8C99-C9D031908A01}']
//    { Property Methods }
//
//    { methods }
//    function a: Jd5_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJa_324 = class(TJavaGenericImport<Ja_324Class, Ja_324>) end;

//  Jb_a_325Class = interface(Jv4Class) // or JObjectClass
//  ['{5EC05CEE-6FE5-4C19-84CD-E47E5C99A0C6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb): Jb_a_325; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/b$a')]
//  Jb_a_325 = interface(Jv4) // or JObject
//  ['{2084B78E-DD2C-4C53-95DA-604A88B23606}']
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

//  TJb_a_325 = class(TJavaGenericImport<Jb_a_325Class, Jb_a_325>) end;

//  Jb_326Class = interface(JObjectClass)
//  ['{FFE5B5D3-E089-487B-A169-72EC65BDB5E8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString): Jb_326; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/b')]
//  Jb_326 = interface(JObject)
//  ['{6CC8597E-DBFC-4F07-8CD0-2F2D9EC5FD93}']
//    { Property Methods }
//    function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jv4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function a: Jd5_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Jv4 read _Getb write _Setb;
//  end;

//  TJb_326 = class(TJavaGenericImport<Jb_326Class, Jb_326>) end;

//  Jc_a_327Class = interface(JObjectClass)
//  ['{9CCBFDE7-91F4-44A3-A520-7276F821081F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc): Jc_a_327; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/c$a')]
//  Jc_a_327 = interface(JObject)
//  ['{CA0C59FE-71F5-4370-8CF7-1140DA8111C0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJc_a_327 = class(TJavaGenericImport<Jc_a_327Class, Jc_a_327>) end;

//  Jc_328Class = interface(Jb_326Class) // or JObjectClass
//  ['{D441E552-6A0C-41B9-BA6E-4D42C345FBAC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_328; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/c')]
//  Jc_328 = interface(Jb_326) // or JObject
//  ['{C7150D7B-F976-4F16-BD4C-B7E53396C415}']
//    { Property Methods }
//
//    { methods }
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//    function a: Jd5_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//
//    { Property }
//  end;

//  TJc_328 = class(TJavaGenericImport<Jc_328Class, Jc_328>) end;

//  Jd_a_329Class = interface(JObjectClass)
//  ['{4896E08E-C3E8-4FE7-AA16-279CCEBBC881}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Jd_a_329; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/d$a')]
//  Jd_a_329 = interface(JObject)
//  ['{3DB02768-9186-4768-AB05-BC8BAC5145CF}']
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

//  TJd_a_329 = class(TJavaGenericImport<Jd_a_329Class, Jd_a_329>) end;

//  Jd_330Class = interface(Jb_326Class) // or JObjectClass
//  ['{970FB890-B1FC-4714-BCD1-CDA726123316}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jd_330; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/d')]
//  Jd_330 = interface(Jb_326) // or JObject
//  ['{7834FA79-6973-48A6-91EE-5C6CE7C34D36}']
//    { Property Methods }
//    function _Getc: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Jd5_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//
//    { Property }
//    property c: JContext read _Getc write _Setc;
//  end;

//  TJd_330 = class(TJavaGenericImport<Jd_330Class, Jd_330>) end;

//  Je_a_331Class = interface(Jv4Class) // or JObjectClass
//  ['{088861A8-1FD5-4B73-AB37-4FE6B91EF304}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_a_331; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/e$a')]
//  Je_a_331 = interface(Jv4) // or JObject
//  ['{96BE6276-36FE-4B76-81FA-1C306F234616}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJe_a_331 = class(TJavaGenericImport<Je_a_331Class, Je_a_331>) end;

//  Je_bClass = interface(JOaidApi_aClass) // or JObjectClass
//  ['{ED293A49-0C35-4148-AD3C-2ECE84E7ECC3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/e$b')]
//  Je_b = interface(JOaidApi_a) // or JObject
//  ['{7BF5094E-2D6E-49E8-B001-0ACB10E99A54}']
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

//  Je_333Class = interface(JObjectClass)
//  ['{3EC0AC6D-4A5E-41F3-A121-295387124C65}']
//    { static Property Methods }
//    {class} function _Getb: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Je_333; cdecl; overload;
//    {class} function a(P1: JContext): Boolean; cdecl;
//    {class} function init: Je_333; cdecl; overload;
//
//    { static Property }
//    {class} property b: Jv4 read _Getb;
//  end;

//  [JavaSignature('com/bytedance/dr/impl/e')]
//  Je_333 = interface(JObject)
//  ['{086A4D09-6A41-43E0-B027-98B6518C0D09}']
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

//  TJe_333 = class(TJavaGenericImport<Je_333Class, Je_333>) end;

//  Jf_334Class = interface(JObjectClass)
//  ['{AEBDF6E4-D327-4985-A934-0527D26B4EC8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je): Jf_334; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/f')]
//  Jf_334 = interface(JObject)
//  ['{1D4EF3EA-F72D-4B46-AE4E-9C9F120A331C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJf_334 = class(TJavaGenericImport<Jf_334Class, Jf_334>) end;

//  Jg_a_335Class = interface(JObjectClass)
//  ['{2F64BE38-3AA5-4CA7-A97E-C59F3208B3C5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jg): Jg_a_335; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/g$a')]
//  Jg_a_335 = interface(JObject)
//  ['{9927AB2E-753C-45E2-A3FD-1C3650ECE26C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJg_a_335 = class(TJavaGenericImport<Jg_a_335Class, Jg_a_335>) end;

//  Jg_336Class = interface(Jb_326Class) // or JObjectClass
//  ['{66A0FCDA-4802-4599-9956-11CB8AAD8764}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg_336; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/g')]
//  Jg_336 = interface(Jb_326) // or JObject
//  ['{B64A84CF-C81B-40AD-8A4C-F0DFD1D80D86}']
//    { Property Methods }
//
//    { methods }
//    function a: Jd5_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJg_336 = class(TJavaGenericImport<Jg_336Class, Jg_336>) end;

//  Jh_aClass = interface(Jv4Class) // or JObjectClass
//  ['{F8C967D8-F237-4A36-B91E-0BBFC9EF8C69}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jh): Jh_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/h$a')]
//  Jh_a = interface(Jv4) // or JObject
//  ['{4473E2E0-CC7E-4658-B9DD-DB317643D885}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJh_a = class(TJavaGenericImport<Jh_aClass, Jh_a>) end;

//  Jh_338Class = interface(JObjectClass)
//  ['{FD454673-A169-4896-AEA2-BAD09B9FCE3A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_338; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/h')]
//  Jh_338 = interface(JObject)
//  ['{CFFED281-03F9-44B0-8176-DB171325B738}']
//    { Property Methods }
//    function _Geta: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jv4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//
//    { Property }
//    property a: Jv4 read _Geta write _Seta;
//  end;

//  TJh_338 = class(TJavaGenericImport<Jh_338Class, Jh_338>) end;

//  Ji_339Class = interface(JObjectClass)
//  ['{E7BBAEDF-E97F-4A4B-A27E-F5E6E7C0AC59}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji_339; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/i')]
//  Ji_339 = interface(JObject)
//  ['{4968AAA6-7EAB-4132-B311-EEEA4146D8DB}']
//    { Property Methods }
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJi_339 = class(TJavaGenericImport<Ji_339Class, Ji_339>) end;

//  Jj_aClass = interface(Jv4Class) // or JObjectClass
//  ['{77EDD687-1AE0-4C98-AFD2-5D4251847D29}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/j$a')]
//  Jj_a = interface(Jv4) // or JObject
//  ['{BC0A1606-D97D-461F-92D0-E651D05A9CDF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJj_a = class(TJavaGenericImport<Jj_aClass, Jj_a>) end;

//  Jj_341Class = interface(JObjectClass)
//  ['{D3E2D99F-B748-46A6-8D0E-D7A24DBA8025}']
//    { static Property Methods }
//    {class} function _Geta: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jj_341; cdecl; overload;
//    {class} function a(P1: JString; P2: JString): JString; cdecl;
//    {class} function init: Jj_341; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jv4 read _Geta;
//  end;

//  [JavaSignature('com/bytedance/dr/impl/j')]
//  Jj_341 = interface(JObject)
//  ['{AD833A7E-E833-498C-8574-71276A6799E6}']
//    { Property Methods }
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJj_341 = class(TJavaGenericImport<Jj_341Class, Jj_341>) end;

//  Jk_aClass = interface(Jv4Class) // or JObjectClass
//  ['{2CC17903-7B18-4AC9-8943-D3A746E5265F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk): Jk_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/k$a')]
//  Jk_a = interface(Jv4) // or JObject
//  ['{3BED48B7-4298-4992-BC2E-9D7F0EB7A850}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JObject>): JObject; cdecl;
//
//    { Property }
//  end;

//  TJk_a = class(TJavaGenericImport<Jk_aClass, Jk_a>) end;

//  Jk_bClass = interface(JObjectClass)
//  ['{AE0EC247-5CF4-49AF-AD1D-88D1B9CA4BF2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jk; P2: JContext): Jk_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/k$b')]
//  Jk_b = interface(JObject)
//  ['{1F81A768-9BA4-4BC4-9A62-DF781DCB3B98}']
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

//  Jk_344Class = interface(JObjectClass)
//  ['{17256887-D41F-4204-9F8F-1AD56C6411AF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JOaidApi): Jk_344; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/k')]
//  Jk_344 = interface(JObject)
//  ['{D2201A1E-8F32-4C44-BEA6-B5A673D815BC}']
//    { Property Methods }
//    function _Geta: JOaidApi;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JOaidApi);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Jv4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//    function a(P1: JContext): JString; cdecl;
//
//    { Property }
//    property a: JOaidApi read _Geta write _Seta;
//    property b: Jv4 read _Getb write _Setb;
//  end;

//  TJk_344 = class(TJavaGenericImport<Jk_344Class, Jk_344>) end;

//  Jl_a_345Class = interface(JObjectClass)
//  ['{0EC36D66-F1AE-4990-B3AE-0F67177C0F5A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jl): Jl_a_345; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/l$a')]
//  Jl_a_345 = interface(JObject)
//  ['{FC6511B7-BAD9-4F6C-9E86-8B08440E4691}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JObject): JObject; cdecl; overload;
//    function a(P1: JIBinder): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJl_a_345 = class(TJavaGenericImport<Jl_a_345Class, Jl_a_345>) end;

//  Jl_346Class = interface(Jb_326Class) // or JObjectClass
//  ['{3EFBF080-7E7D-454B-AC7C-7D78368D8883}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl_346; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/impl/l')]
//  Jl_346 = interface(Jb_326) // or JObject
//  ['{E4A30F65-5CCF-4D92-BB5D-65E32726F422}']
//    { Property Methods }
//
//    { methods }
//    function a: Jd5_b; cdecl; overload;
//    function a(P1: JContext): JIntent; cdecl; overload;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJl_346 = class(TJavaGenericImport<Jl_346Class, Jl_346>) end;

//  Jm_347Class = interface(JObjectClass)
//  ['{312B8157-FD84-4B81-A8AB-A8FED49D7C46}']
//    { static Property Methods }
//    {class} function _Geta: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JClass;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JMethod;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jm_347; cdecl; overload;
//    {class} function init: Jm_347; cdecl; overload;
//
//    { static Property }
//    {class} property a: JObject read _Geta;
//    {class} property b: JClass read _Getb;
//    {class} property c: JMethod read _Getc;
//  end;

//  [JavaSignature('com/bytedance/dr/impl/m')]
//  Jm_347 = interface(JObject)
//  ['{149F6906-2B9C-40E3-814C-F51F0451C25B}']
//    { Property Methods }
//
//    { methods }
//    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
//    function getName: JString; cdecl;
//
//    { Property }
//  end;

//  TJm_347 = class(TJavaGenericImport<Jm_347Class, Jm_347>) end;

//  JOaidApi_aClass = interface(JObjectClass)
//  ['{92F0F48D-C517-4037-83C1-0BAE37129C5E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JOaidApi_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/bytedance/dr/OaidApi$a')]
//  JOaidApi_a = interface(JObject)
//  ['{54071118-E047-45AC-B06F-A8D9CB357724}']
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
  ['{C5CB4C5A-3082-4B17-9A7E-E021A99AA0C1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bytedance/dr/OaidApi')]
  JOaidApi = interface(IJavaInstance)
  ['{935EF447-D685-44C8-BDA6-C48FBCC3903F}']
    { Property Methods }

    { methods }
    function support(P1: JContext): Boolean; cdecl;
//    function getOaid(P1: JContext): JOaidApi_a; cdecl;
    function getName: JString; cdecl;

    { Property }
  end;

  TJOaidApi = class(TJavaGenericImport<JOaidApiClass, JOaidApi>) end;

  JOaidFactoryClass = interface(JObjectClass)
  ['{70278E74-8492-40C7-BD08-035E7BE99A92}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOaidFactory; cdecl;
    {class} function createOaidImpl(P1: JContext): JOaidApi; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bytedance/dr/OaidFactory')]
  JOaidFactory = interface(JObject)
  ['{8C103A67-C14E-486E-83EA-54D7E3590EC4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOaidFactory = class(TJavaGenericImport<JOaidFactoryClass, JOaidFactory>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIALinkListener',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIALinkListener));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JPageMeta',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JPageMeta));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAppLog',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAppLog));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAppLogManager',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAppLogManager));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JCollector',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JCollector));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAutoTrackEventType',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAutoTrackEventType));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JEventBuilder',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JEventBuilder));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JEventPolicy',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JEventPolicy));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JEventType',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JEventType));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIEventHandler',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIEventHandler));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAppCrashType',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAppCrashType));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureConfig',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureConfig));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureData',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureData));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_e));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_f',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager_f));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JViewExposureManager));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JGameReportHelper',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JGameReportHelper));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JOhayooGameHelper',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JOhayooGameHelper));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUnityPlugin_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUnityPlugin_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUnityPlugin',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUnityPlugin));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWhalerGameHelper_Result',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWhalerGameHelper_Result));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWhalerGameHelper',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWhalerGameHelper));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIActiveCustomParamsCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIActiveCustomParamsCallback));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIAppLogInstance',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIAppLogInstance));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIDataObserver',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIDataObserver));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIEventObserver',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIEventObserver));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIExtraParams',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIExtraParams));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIHeaderCustomTimelyCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIHeaderCustomTimelyCallback));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JILogger',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JILogger));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JInitConfig_IpcDataChecker',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JInitConfig_IpcDataChecker));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JInitConfig',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JInitConfig));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIOaidObserver_Oaid',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIOaidObserver_Oaid));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIOaidObserver',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIOaidObserver));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIPageMeta',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIPageMeta));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIPicker',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIPicker));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIPickerCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIPickerCallback));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIPullAbTestConfigCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIPullAbTestConfigCallback));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JISensitiveInfoProvider',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JISensitiveInfoProvider));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JISessionObserver',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JISessionObserver));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JLevel',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JLevel));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JMigrateDetectorActivity',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JMigrateDetectorActivity));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JINetworkClient',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JINetworkClient));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JRangersHttpException',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JRangersHttpException));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIDBindCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIDBindCallback));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIDBindResult',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JIDBindResult));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAnalyticsComponentRegistrar_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAnalyticsComponentRegistrar_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAnalyticsComponentRegistrar',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JAnalyticsComponentRegistrar));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JDeviceComponentRegistrar_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JDeviceComponentRegistrar_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JDeviceComponentRegistrar',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JDeviceComponentRegistrar));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUserProfileCallback',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUserProfileCallback));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSimulateLaunchActivity',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSimulateLaunchActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUriConfig_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUriConfig_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUriConfig_Builder',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUriConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUriConfig',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUriConfig));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JGeoCoordinateSystemConst',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JGeoCoordinateSystemConst));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JHardwareUtils_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JHardwareUtils_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JHardwareUtils',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JHardwareUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils_e));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JSensitiveUtils));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUriConstants',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JUriConstants));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_e));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_f',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_f));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_g',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_g));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_h',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil_h));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JWebViewJsUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja1_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja2_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja2_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja2_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja2_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja2_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja5',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja5));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_e));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb5',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb5));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc0_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc0_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc0_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc0_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc0_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc0_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc5',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc5));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd5_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd5_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd5_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd5_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd5',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd5));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je3_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je3_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg2_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh0_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh0_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji1_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk0_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk0_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk1_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_e));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_f',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_f));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_g',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_g));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_h',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3_h));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jn4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jo4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jp4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jq4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0_c',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0_c));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0_d',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0_d));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0_e',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0_e));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jr4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Js4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt2_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jt4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ju4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv3_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jv4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jw4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jx4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jy4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz0',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz0));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz1',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz1));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz2_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz2_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz2_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz2',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz2));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz3',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz3));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz4_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz4',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jz4));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja_304',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja_304));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_a_306',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_a_306));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_307',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_307));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_a_309',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_a_309));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_310',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_310));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_a_312',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_a_312));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_313',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_313));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_316',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_316));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf_319',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf_319));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg_a_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg_322',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg_322));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja_a_323',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja_a_323));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja_324',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ja_324));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_a_325',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_a_325));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_326',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jb_326));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_a_327',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_a_327));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_328',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jc_328));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_a_329',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_a_329));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_330',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jd_330));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_a_331',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_a_331));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_333',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Je_333));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf_334',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jf_334));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg_a_335',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg_a_335));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg_336',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jg_336));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh_338',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jh_338));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji_339',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Ji_339));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj_341',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jj_341));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk_a));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk_b',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk_b));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk_344',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jk_344));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl_a_345',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl_a_345));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl_346',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jl_346));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm_347',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.Jm_347));
//  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JOaidApi_a',
//    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JOaidApi_a));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JOaidApi',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JOaidApi));
  TRegTypes.RegisterType('Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JOaidFactory',
    TypeInfo(Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar.JOaidFactory));
end;


initialization
  RegisterTypes;

end.
