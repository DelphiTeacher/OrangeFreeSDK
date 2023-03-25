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
//  生成时间：2023-03-25 14:18:25
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.jetified_scanplus_2_9_0_300_aar;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.Util,
  Androidapi.JNI.Hardware;
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.android.os.IBinder,
//  Androidapi.JNI.android.os.Parcel,
//  Androidapi.JNI.com.huawei.hms.feature.dynamic.IObjectWrapper,
//  Androidapi.JNI.android.os.Bundle,
//  Androidapi.JNI.android.os.Parcelable_Creator,
//  Androidapi.JNI.android.graphics.Bitmap,
//  Androidapi.JNI.android.view.View,
//  Androidapi.JNI.android.app.Activity,
//  Androidapi.JNI.com.huawei.hms.feature.dynamic.OnDelegateCreatedListener,
//  Androidapi.JNI.android.view.LayoutInflater,
//  Androidapi.JNI.android.view.ViewGroup,
//  Androidapi.JNI.android.graphics.Rect,
//  Androidapi.JNI.android.content.Intent,
//  Androidapi.JNI.android.app.Fragment,
//  Androidapi.JNI.com.huawei.hms.mlsdk.common.MLFrame,
//  Androidapi.JNI.android.graphics.Point,
//  Androidapi.JNI.android.util.SparseArray,
//  Androidapi.JNI.com.huawei.hmf.tasks.Task,
//  Androidapi.JNI.android.os.Message,
//  Androidapi.JNI.android.graphics.SurfaceTexture,
//  Androidapi.JNI.android.view.TextureView,
//  Androidapi.JNI.android.view.MotionEvent,
//  Androidapi.JNI.android.animation.ValueAnimator,
//  Androidapi.JNI.android.animation.Animator,
//  Androidapi.JNI.android.content.res.Resources,
//  Androidapi.JNI.org.xmlpull.v1.XmlPullParser,
//  Androidapi.JNI.android.util.AttributeSet,
//  Androidapi.JNI.android.content.res.Resources_Theme,
//  Androidapi.JNI.android.graphics.Canvas,
//  Androidapi.JNI.android.graphics.ColorFilter,
//  Androidapi.JNI.android.hardware.SensorEvent,
//  Androidapi.JNI.android.hardware.Sensor,
//  Androidapi.JNI.android.hardware.Camera_Parameters,
//  Androidapi.JNI.android.hardware.Camera,
//  Androidapi.JNI.java.nio.ByteBuffer,
//  Androidapi.JNI.android.view.animation.Interpolator,
//  Androidapi.JNI.java.nio.charset.Charset,
//  Androidapi.JNI.android.content.pm.ResolveInfo,
//  Androidapi.JNI.android.net.Uri
//    ;


type

// ===== Forward declarations =====

  JDynamicModuleInitializer = interface; //com.huawei.hms.feature.DynamicModuleInitializer
//  Ja = interface; //com.huawei.hms.hmsscankit.a
  JIOnErrorCallback_Default = interface; //com.huawei.hms.hmsscankit.api.IOnErrorCallback$Default
  JIOnErrorCallback_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IOnErrorCallback$Stub$Proxy
  JIOnErrorCallback_Stub = interface; //com.huawei.hms.hmsscankit.api.IOnErrorCallback$Stub
  JIOnErrorCallback = interface; //com.huawei.hms.hmsscankit.api.IOnErrorCallback
  JIOnLightCallback_Default = interface; //com.huawei.hms.hmsscankit.api.IOnLightCallback$Default
  JIOnLightCallback_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IOnLightCallback$Stub$Proxy
  JIOnLightCallback_Stub = interface; //com.huawei.hms.hmsscankit.api.IOnLightCallback$Stub
  JIOnLightCallback = interface; //com.huawei.hms.hmsscankit.api.IOnLightCallback
  JIOnResultCallback_Default = interface; //com.huawei.hms.hmsscankit.api.IOnResultCallback$Default
  JIOnResultCallback_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IOnResultCallback$Stub$Proxy
  JIOnResultCallback_Stub = interface; //com.huawei.hms.hmsscankit.api.IOnResultCallback$Stub
  JIOnResultCallback = interface; //com.huawei.hms.hmsscankit.api.IOnResultCallback
  JIRemoteCreator_Default = interface; //com.huawei.hms.hmsscankit.api.IRemoteCreator$Default
  JIRemoteCreator_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteCreator$Stub$Proxy
  JIRemoteCreator_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteCreator$Stub
  JIRemoteCreator = interface; //com.huawei.hms.hmsscankit.api.IRemoteCreator
  JIRemoteDecoderCreator_Default = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderCreator$Default
  JIRemoteDecoderCreator_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderCreator$Stub$Proxy
  JIRemoteDecoderCreator_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderCreator$Stub
  JIRemoteDecoderCreator = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderCreator
  JIRemoteDecoderDelegate_Default = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate$Default
  JIRemoteDecoderDelegate_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate$Stub$Proxy
  JIRemoteDecoderDelegate_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate$Stub
  JIRemoteDecoderDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate
  JIRemoteFrameDecoderDelegate_Default = interface; //com.huawei.hms.hmsscankit.api.IRemoteFrameDecoderDelegate$Default
  JIRemoteFrameDecoderDelegate_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteFrameDecoderDelegate$Stub$Proxy
  JIRemoteFrameDecoderDelegate_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteFrameDecoderDelegate$Stub
  JIRemoteFrameDecoderDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteFrameDecoderDelegate
  JIRemoteHmsDecoderDelegate_Default = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$Default
  JIRemoteHmsDecoderDelegate_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$Stub$Proxy
  JIRemoteHmsDecoderDelegate_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$Stub
  JIRemoteHmsDecoderDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate
  JIRemoteViewDelegate_Default = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$Default
  JIRemoteViewDelegate_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$Stub$Proxy
  JIRemoteViewDelegate_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$Stub
  JIRemoteViewDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate
//  Jb = interface; //com.huawei.hms.hmsscankit.b
//  Jc = interface; //com.huawei.hms.hmsscankit.c
//  Jd = interface; //com.huawei.hms.hmsscankit.d
//  JDetailRect_a = interface; //com.huawei.hms.hmsscankit.DetailRect$a
  JDetailRect = interface; //com.huawei.hms.hmsscankit.DetailRect
//  Je_a = interface; //com.huawei.hms.hmsscankit.e$a
//  Je = interface; //com.huawei.hms.hmsscankit.e
//  Jf = interface; //com.huawei.hms.hmsscankit.f
  JOnErrorCallback = interface; //com.huawei.hms.hmsscankit.OnErrorCallback
  JOnLightVisibleCallBack = interface; //com.huawei.hms.hmsscankit.OnLightVisibleCallBack
  JOnResultCallback = interface; //com.huawei.hms.hmsscankit.OnResultCallback
//  JRemoteView_a_a = interface; //com.huawei.hms.hmsscankit.RemoteView$a$a
//  JRemoteView_a_b = interface; //com.huawei.hms.hmsscankit.RemoteView$a$b
//  JRemoteView_a = interface; //com.huawei.hms.hmsscankit.RemoteView$a
//  JRemoteView_b = interface; //com.huawei.hms.hmsscankit.RemoteView$b
  JRemoteView_Builder = interface; //com.huawei.hms.hmsscankit.RemoteView$Builder
  JRemoteView = interface; //com.huawei.hms.hmsscankit.RemoteView
//  JScanKitActivity_1 = interface; //com.huawei.hms.hmsscankit.ScanKitActivity$1
//  JScanKitActivity_2 = interface; //com.huawei.hms.hmsscankit.ScanKitActivity$2
  JScanKitActivity = interface; //com.huawei.hms.hmsscankit.ScanKitActivity
  JScanUtil = interface; //com.huawei.hms.hmsscankit.ScanUtil
  JWriterException = interface; //com.huawei.hms.hmsscankit.WriterException
//  JHmsBuildBitmapOption_1 = interface; //com.huawei.hms.ml.scan.HmsBuildBitmapOption$1
  JHmsBuildBitmapOption_Creator = interface; //com.huawei.hms.ml.scan.HmsBuildBitmapOption$Creator
  JHmsBuildBitmapOption_ErrorCorrectionLevel = interface; //com.huawei.hms.ml.scan.HmsBuildBitmapOption$ErrorCorrectionLevel
  JHmsBuildBitmapOption = interface; //com.huawei.hms.ml.scan.HmsBuildBitmapOption
//  JHmsScan_1 = interface; //com.huawei.hms.ml.scan.HmsScan$1
//  JHmsScan_AddressInfo_1 = interface; //com.huawei.hms.ml.scan.HmsScan$AddressInfo$1
  JHmsScan_AddressInfo_ADDRESS_TYPE = interface; //com.huawei.hms.ml.scan.HmsScan$AddressInfo$ADDRESS_TYPE
  JHmsScan_AddressInfo = interface; //com.huawei.hms.ml.scan.HmsScan$AddressInfo
//  JHmsScan_ContactDetail_1 = interface; //com.huawei.hms.ml.scan.HmsScan$ContactDetail$1
  JHmsScan_ContactDetail = interface; //com.huawei.hms.ml.scan.HmsScan$ContactDetail
//  JHmsScan_DriverInfo_1 = interface; //com.huawei.hms.ml.scan.HmsScan$DriverInfo$1
  JHmsScan_DriverInfo = interface; //com.huawei.hms.ml.scan.HmsScan$DriverInfo
//  JHmsScan_EmailContent_1 = interface; //com.huawei.hms.ml.scan.HmsScan$EmailContent$1
  JHmsScan_EmailContent_EMAIL_TYPE = interface; //com.huawei.hms.ml.scan.HmsScan$EmailContent$EMAIL_TYPE
  JHmsScan_EmailContent = interface; //com.huawei.hms.ml.scan.HmsScan$EmailContent
//  JHmsScan_EventInfo_1 = interface; //com.huawei.hms.ml.scan.HmsScan$EventInfo$1
  JHmsScan_EventInfo = interface; //com.huawei.hms.ml.scan.HmsScan$EventInfo
//  JHmsScan_EventTime_1 = interface; //com.huawei.hms.ml.scan.HmsScan$EventTime$1
  JHmsScan_EventTime = interface; //com.huawei.hms.ml.scan.HmsScan$EventTime
//  JHmsScan_LinkUrl_1 = interface; //com.huawei.hms.ml.scan.HmsScan$LinkUrl$1
  JHmsScan_LinkUrl = interface; //com.huawei.hms.ml.scan.HmsScan$LinkUrl
//  JHmsScan_LocationCoordinate_1 = interface; //com.huawei.hms.ml.scan.HmsScan$LocationCoordinate$1
  JHmsScan_LocationCoordinate = interface; //com.huawei.hms.ml.scan.HmsScan$LocationCoordinate
//  JHmsScan_PeopleName_1 = interface; //com.huawei.hms.ml.scan.HmsScan$PeopleName$1
  JHmsScan_PeopleName = interface; //com.huawei.hms.ml.scan.HmsScan$PeopleName
  JHmsScan_SCAN_TYPE_FORMAT = interface; //com.huawei.hms.ml.scan.HmsScan$SCAN_TYPE_FORMAT
//  JHmsScan_SmsContent_1 = interface; //com.huawei.hms.ml.scan.HmsScan$SmsContent$1
  JHmsScan_SmsContent = interface; //com.huawei.hms.ml.scan.HmsScan$SmsContent
//  JHmsScan_TelPhoneNumber_1 = interface; //com.huawei.hms.ml.scan.HmsScan$TelPhoneNumber$1
  JHmsScan_TelPhoneNumber_USE_TYPE = interface; //com.huawei.hms.ml.scan.HmsScan$TelPhoneNumber$USE_TYPE
  JHmsScan_TelPhoneNumber = interface; //com.huawei.hms.ml.scan.HmsScan$TelPhoneNumber
//  JHmsScan_WiFiConnectionInfo_1 = interface; //com.huawei.hms.ml.scan.HmsScan$WiFiConnectionInfo$1
  JHmsScan_WiFiConnectionInfo_CIPHER_MODE = interface; //com.huawei.hms.ml.scan.HmsScan$WiFiConnectionInfo$CIPHER_MODE
  JHmsScan_WiFiConnectionInfo = interface; //com.huawei.hms.ml.scan.HmsScan$WiFiConnectionInfo
  JHmsScan = interface; //com.huawei.hms.ml.scan.HmsScan
//  JHmsScanAnalyzer_1 = interface; //com.huawei.hms.ml.scan.HmsScanAnalyzer$1
  JHmsScanAnalyzer_Creator = interface; //com.huawei.hms.ml.scan.HmsScanAnalyzer$Creator
//  JHmsScanAnalyzer = interface; //com.huawei.hms.ml.scan.HmsScanAnalyzer
//  JHmsScanAnalyzerOptions_1 = interface; //com.huawei.hms.ml.scan.HmsScanAnalyzerOptions$1
  JHmsScanAnalyzerOptions_Creator = interface; //com.huawei.hms.ml.scan.HmsScanAnalyzerOptions$Creator
  JHmsScanAnalyzerOptions = interface; //com.huawei.hms.ml.scan.HmsScanAnalyzerOptions
  JHmsScanBase_SCAN_TYPE = interface; //com.huawei.hms.ml.scan.HmsScanBase$SCAN_TYPE
  JHmsScanBase = interface; //com.huawei.hms.ml.scan.HmsScanBase
//  Ja_a = interface; //com.huawei.hms.scankit.a$a
//  Ja_104 = interface; //com.huawei.hms.scankit.a
//  JBarcodeFormat_a = interface; //com.huawei.hms.scankit.aiscan.common.BarcodeFormat$a
  JBarcodeFormat = interface; //com.huawei.hms.scankit.aiscan.common.BarcodeFormat
//  Jb_a = interface; //com.huawei.hms.scankit.b$a
//  Jb_b = interface; //com.huawei.hms.scankit.b$b
//  Jb_c = interface; //com.huawei.hms.scankit.b$c
//  Jb_d = interface; //com.huawei.hms.scankit.b$d
//  Jb_111 = interface; //com.huawei.hms.scankit.b
//  Jc_a = interface; //com.huawei.hms.scankit.c$a
//  Jc_113 = interface; //com.huawei.hms.scankit.c
  JCreator = interface; //com.huawei.hms.scankit.Creator
//  Jd_115 = interface; //com.huawei.hms.scankit.d
  JDecoderCreator = interface; //com.huawei.hms.scankit.DecoderCreator
//  JScanDrawable_a = interface; //com.huawei.hms.scankit.drawable.ScanDrawable$a
//  JScanDrawable_b = interface; //com.huawei.hms.scankit.drawable.ScanDrawable$b
//  JScanDrawable_c = interface; //com.huawei.hms.scankit.drawable.ScanDrawable$c
  JScanDrawable = interface; //com.huawei.hms.scankit.drawable.ScanDrawable
//  Je_a_121 = interface; //com.huawei.hms.scankit.e$a
//  Je_b = interface; //com.huawei.hms.scankit.e$b
//  Je_c = interface; //com.huawei.hms.scankit.e$c
//  Je_124 = interface; //com.huawei.hms.scankit.e
//  Jf_125 = interface; //com.huawei.hms.scankit.f
//  Jg = interface; //com.huawei.hms.scankit.g
//  Jh_a = interface; //com.huawei.hms.scankit.h$a
//  Jh = interface; //com.huawei.hms.scankit.h
//  Ji_a = interface; //com.huawei.hms.scankit.i$a
//  Ji_b = interface; //com.huawei.hms.scankit.i$b
//  Ji = interface; //com.huawei.hms.scankit.i
//  Jj = interface; //com.huawei.hms.scankit.j
//  Ja_133 = interface; //com.huawei.hms.scankit.p.a
//  Ja0 = interface; //com.huawei.hms.scankit.p.a0
//  Ja1_a = interface; //com.huawei.hms.scankit.p.a1$a
//  Ja1_b = interface; //com.huawei.hms.scankit.p.a1$b
//  Ja1_c = interface; //com.huawei.hms.scankit.p.a1$c
//  Ja1_d = interface; //com.huawei.hms.scankit.p.a1$d
//  Ja1_e = interface; //com.huawei.hms.scankit.p.a1$e
//  Ja1_f = interface; //com.huawei.hms.scankit.p.a1$f
//  Ja1_g = interface; //com.huawei.hms.scankit.p.a1$g
//  Ja1_h = interface; //com.huawei.hms.scankit.p.a1$h
//  Ja1 = interface; //com.huawei.hms.scankit.p.a1
//  Ja2 = interface; //com.huawei.hms.scankit.p.a2
//  Ja3 = interface; //com.huawei.hms.scankit.p.a3
//  Ja4 = interface; //com.huawei.hms.scankit.p.a4
//  Ja5 = interface; //com.huawei.hms.scankit.p.a5
//  Ja6 = interface; //com.huawei.hms.scankit.p.a6
//  Ja7 = interface; //com.huawei.hms.scankit.p.a7
//  Jb_150 = interface; //com.huawei.hms.scankit.p.b
//  Jb0 = interface; //com.huawei.hms.scankit.p.b0
//  Jb1 = interface; //com.huawei.hms.scankit.p.b1
//  Jb2 = interface; //com.huawei.hms.scankit.p.b2
//  Jb3 = interface; //com.huawei.hms.scankit.p.b3
//  Jb4 = interface; //com.huawei.hms.scankit.p.b4
//  Jb5 = interface; //com.huawei.hms.scankit.p.b5
//  Jb6 = interface; //com.huawei.hms.scankit.p.b6
//  Jb7_a = interface; //com.huawei.hms.scankit.p.b7$a
//  Jb7_b = interface; //com.huawei.hms.scankit.p.b7$b
//  Jb7_c = interface; //com.huawei.hms.scankit.p.b7$c
//  Jb7 = interface; //com.huawei.hms.scankit.p.b7
//  Jc_162 = interface; //com.huawei.hms.scankit.p.c
//  Jc0_a = interface; //com.huawei.hms.scankit.p.c0$a
//  Jc0_b = interface; //com.huawei.hms.scankit.p.c0$b
//  Jc0 = interface; //com.huawei.hms.scankit.p.c0
//  Jc1 = interface; //com.huawei.hms.scankit.p.c1
//  Jc2 = interface; //com.huawei.hms.scankit.p.c2
//  Jc3 = interface; //com.huawei.hms.scankit.p.c3
//  Jc4 = interface; //com.huawei.hms.scankit.p.c4
//  Jc5 = interface; //com.huawei.hms.scankit.p.c5
//  Jc6 = interface; //com.huawei.hms.scankit.p.c6
//  Jc7_a = interface; //com.huawei.hms.scankit.p.c7$a
//  Jc7_b = interface; //com.huawei.hms.scankit.p.c7$b
//  Jc7 = interface; //com.huawei.hms.scankit.p.c7
//  Jd_175 = interface; //com.huawei.hms.scankit.p.d
//  Jd0 = interface; //com.huawei.hms.scankit.p.d0
//  Jd1 = interface; //com.huawei.hms.scankit.p.d1
//  Jd2_a = interface; //com.huawei.hms.scankit.p.d2$a
//  Jd2 = interface; //com.huawei.hms.scankit.p.d2
//  Jd3 = interface; //com.huawei.hms.scankit.p.d3
//  Jd4 = interface; //com.huawei.hms.scankit.p.d4
//  Jd5 = interface; //com.huawei.hms.scankit.p.d5
//  Jd6 = interface; //com.huawei.hms.scankit.p.d6
//  Jd7 = interface; //com.huawei.hms.scankit.p.d7
//  Je_185 = interface; //com.huawei.hms.scankit.p.e
//  Je0 = interface; //com.huawei.hms.scankit.p.e0
//  Je1 = interface; //com.huawei.hms.scankit.p.e1
//  Je2 = interface; //com.huawei.hms.scankit.p.e2
//  Je3_a = interface; //com.huawei.hms.scankit.p.e3$a
//  Je3_b = interface; //com.huawei.hms.scankit.p.e3$b
//  Je3 = interface; //com.huawei.hms.scankit.p.e3
//  Je4 = interface; //com.huawei.hms.scankit.p.e4
//  Je5 = interface; //com.huawei.hms.scankit.p.e5
//  Je6 = interface; //com.huawei.hms.scankit.p.e6
//  Je7 = interface; //com.huawei.hms.scankit.p.e7
//  Jf_196 = interface; //com.huawei.hms.scankit.p.f
//  Jf0 = interface; //com.huawei.hms.scankit.p.f0
//  Jf1 = interface; //com.huawei.hms.scankit.p.f1
//  Jf2 = interface; //com.huawei.hms.scankit.p.f2
//  Jf3_a = interface; //com.huawei.hms.scankit.p.f3$a
//  Jf3_b = interface; //com.huawei.hms.scankit.p.f3$b
//  Jf3 = interface; //com.huawei.hms.scankit.p.f3
//  Jf4 = interface; //com.huawei.hms.scankit.p.f4
//  Jf5 = interface; //com.huawei.hms.scankit.p.f5
//  Jf6 = interface; //com.huawei.hms.scankit.p.f6
//  Jf7 = interface; //com.huawei.hms.scankit.p.f7
//  Jg_207 = interface; //com.huawei.hms.scankit.p.g
//  Jg0_a = interface; //com.huawei.hms.scankit.p.g0$a
//  Jg0_b = interface; //com.huawei.hms.scankit.p.g0$b
//  Jg0_c = interface; //com.huawei.hms.scankit.p.g0$c
//  Jg0_d = interface; //com.huawei.hms.scankit.p.g0$d
//  Jg0_e = interface; //com.huawei.hms.scankit.p.g0$e
//  Jg0_f = interface; //com.huawei.hms.scankit.p.g0$f
//  Jg0 = interface; //com.huawei.hms.scankit.p.g0
//  Jg1 = interface; //com.huawei.hms.scankit.p.g1
//  Jg2 = interface; //com.huawei.hms.scankit.p.g2
//  Jg3_a = interface; //com.huawei.hms.scankit.p.g3$a
//  Jg3_b = interface; //com.huawei.hms.scankit.p.g3$b
//  Jg3_c = interface; //com.huawei.hms.scankit.p.g3$c
//  Jg3_d_a = interface; //com.huawei.hms.scankit.p.g3$d$a
//  Jg3_d_b = interface; //com.huawei.hms.scankit.p.g3$d$b
//  Jg3_d_c_a = interface; //com.huawei.hms.scankit.p.g3$d$c$a
//  Jg3_d_c_b = interface; //com.huawei.hms.scankit.p.g3$d$c$b
//  Jg3_d_c = interface; //com.huawei.hms.scankit.p.g3$d$c
//  Jg3_d = interface; //com.huawei.hms.scankit.p.g3$d
//  Jg3 = interface; //com.huawei.hms.scankit.p.g3
//  Jg4 = interface; //com.huawei.hms.scankit.p.g4
//  Jg5 = interface; //com.huawei.hms.scankit.p.g5
//  Jg6 = interface; //com.huawei.hms.scankit.p.g6
//  Jg7 = interface; //com.huawei.hms.scankit.p.g7
//  Jh_231 = interface; //com.huawei.hms.scankit.p.h
//  Jh0_a = interface; //com.huawei.hms.scankit.p.h0$a
//  Jh0 = interface; //com.huawei.hms.scankit.p.h0
//  Jh1 = interface; //com.huawei.hms.scankit.p.h1
//  Jh2 = interface; //com.huawei.hms.scankit.p.h2
//  Jh3_a = interface; //com.huawei.hms.scankit.p.h3$a
//  Jh3 = interface; //com.huawei.hms.scankit.p.h3
//  Jh4 = interface; //com.huawei.hms.scankit.p.h4
//  Jh5 = interface; //com.huawei.hms.scankit.p.h5
//  Jh6 = interface; //com.huawei.hms.scankit.p.h6
//  Jh7 = interface; //com.huawei.hms.scankit.p.h7
//  Ji_242 = interface; //com.huawei.hms.scankit.p.i
//  Ji0 = interface; //com.huawei.hms.scankit.p.i0
//  Ji1_a = interface; //com.huawei.hms.scankit.p.i1$a
//  Ji1_b = interface; //com.huawei.hms.scankit.p.i1$b
//  Ji1 = interface; //com.huawei.hms.scankit.p.i1
//  Ji2 = interface; //com.huawei.hms.scankit.p.i2
//  Ji3 = interface; //com.huawei.hms.scankit.p.i3
//  Ji4 = interface; //com.huawei.hms.scankit.p.i4
//  Ji5 = interface; //com.huawei.hms.scankit.p.i5
//  Ji6 = interface; //com.huawei.hms.scankit.p.i6
//  Ji7 = interface; //com.huawei.hms.scankit.p.i7
//  Jj_253 = interface; //com.huawei.hms.scankit.p.j
//  Jj0 = interface; //com.huawei.hms.scankit.p.j0
//  Jj1_a = interface; //com.huawei.hms.scankit.p.j1$a
//  Jj1_b = interface; //com.huawei.hms.scankit.p.j1$b
//  Jj1 = interface; //com.huawei.hms.scankit.p.j1
//  Jj2 = interface; //com.huawei.hms.scankit.p.j2
//  Jj3_a = interface; //com.huawei.hms.scankit.p.j3$a
//  Jj3_b = interface; //com.huawei.hms.scankit.p.j3$b
//  Jj3_c = interface; //com.huawei.hms.scankit.p.j3$c
//  Jj3 = interface; //com.huawei.hms.scankit.p.j3
//  Jj4 = interface; //com.huawei.hms.scankit.p.j4
//  Jj5 = interface; //com.huawei.hms.scankit.p.j5
//  Jj6 = interface; //com.huawei.hms.scankit.p.j6
//  Jk = interface; //com.huawei.hms.scankit.p.k
//  Jk0 = interface; //com.huawei.hms.scankit.p.k0
//  Jk1_a = interface; //com.huawei.hms.scankit.p.k1$a
//  Jk1 = interface; //com.huawei.hms.scankit.p.k1
//  Jk2 = interface; //com.huawei.hms.scankit.p.k2
//  Jk3 = interface; //com.huawei.hms.scankit.p.k3
//  Jk4_a = interface; //com.huawei.hms.scankit.p.k4$a
//  Jk4 = interface; //com.huawei.hms.scankit.p.k4
//  Jk5 = interface; //com.huawei.hms.scankit.p.k5
//  Jk6 = interface; //com.huawei.hms.scankit.p.k6
//  Jl = interface; //com.huawei.hms.scankit.p.l
//  Jl0 = interface; //com.huawei.hms.scankit.p.l0
//  Jl1_a = interface; //com.huawei.hms.scankit.p.l1$a
//  Jl1_b = interface; //com.huawei.hms.scankit.p.l1$b
//  Jl1 = interface; //com.huawei.hms.scankit.p.l1
//  Jl2 = interface; //com.huawei.hms.scankit.p.l2
//  Jl3_a = interface; //com.huawei.hms.scankit.p.l3$a
//  Jl3 = interface; //com.huawei.hms.scankit.p.l3
//  Jl4 = interface; //com.huawei.hms.scankit.p.l4
//  Jl5 = interface; //com.huawei.hms.scankit.p.l5
//  Jl6 = interface; //com.huawei.hms.scankit.p.l6
//  Jm = interface; //com.huawei.hms.scankit.p.m
//  Jm0 = interface; //com.huawei.hms.scankit.p.m0
//  Jm1 = interface; //com.huawei.hms.scankit.p.m1
//  Jm2_a = interface; //com.huawei.hms.scankit.p.m2$a
//  Jm2 = interface; //com.huawei.hms.scankit.p.m2
//  Jm3 = interface; //com.huawei.hms.scankit.p.m3
//  Jm4 = interface; //com.huawei.hms.scankit.p.m4
//  Jm5 = interface; //com.huawei.hms.scankit.p.m5
//  Jm6 = interface; //com.huawei.hms.scankit.p.m6
//  Jn = interface; //com.huawei.hms.scankit.p.n
//  Jn0 = interface; //com.huawei.hms.scankit.p.n0
//  Jn1 = interface; //com.huawei.hms.scankit.p.n1
//  Jn2 = interface; //com.huawei.hms.scankit.p.n2
//  Jn3 = interface; //com.huawei.hms.scankit.p.n3
//  Jn4 = interface; //com.huawei.hms.scankit.p.n4
//  Jn5 = interface; //com.huawei.hms.scankit.p.n5
//  Jn6 = interface; //com.huawei.hms.scankit.p.n6
//  Jo = interface; //com.huawei.hms.scankit.p.o
//  Jo0 = interface; //com.huawei.hms.scankit.p.o0
//  Jo1 = interface; //com.huawei.hms.scankit.p.o1
//  Jo2 = interface; //com.huawei.hms.scankit.p.o2
//  Jo3 = interface; //com.huawei.hms.scankit.p.o3
//  Jo4 = interface; //com.huawei.hms.scankit.p.o4
//  Jo5 = interface; //com.huawei.hms.scankit.p.o5
//  Jo6 = interface; //com.huawei.hms.scankit.p.o6
//  Jp = interface; //com.huawei.hms.scankit.p.p
//  Jp0_a = interface; //com.huawei.hms.scankit.p.p0$a
//  Jp0 = interface; //com.huawei.hms.scankit.p.p0
//  Jp1 = interface; //com.huawei.hms.scankit.p.p1
//  Jp2 = interface; //com.huawei.hms.scankit.p.p2
//  Jp3 = interface; //com.huawei.hms.scankit.p.p3
//  Jp4 = interface; //com.huawei.hms.scankit.p.p4
//  Jp5 = interface; //com.huawei.hms.scankit.p.p5
//  Jp6 = interface; //com.huawei.hms.scankit.p.p6
//  Jq = interface; //com.huawei.hms.scankit.p.q
//  Jq0 = interface; //com.huawei.hms.scankit.p.q0
//  Jq1 = interface; //com.huawei.hms.scankit.p.q1
//  Jq2 = interface; //com.huawei.hms.scankit.p.q2
//  Jq3 = interface; //com.huawei.hms.scankit.p.q3
//  Jq4 = interface; //com.huawei.hms.scankit.p.q4
//  Jq5 = interface; //com.huawei.hms.scankit.p.q5
//  Jq6 = interface; //com.huawei.hms.scankit.p.q6
//  Jr = interface; //com.huawei.hms.scankit.p.r
//  Jr0 = interface; //com.huawei.hms.scankit.p.r0
//  Jr1 = interface; //com.huawei.hms.scankit.p.r1
//  Jr2 = interface; //com.huawei.hms.scankit.p.r2
//  Jr3 = interface; //com.huawei.hms.scankit.p.r3
//  Jr4 = interface; //com.huawei.hms.scankit.p.r4
//  Jr5 = interface; //com.huawei.hms.scankit.p.r5
//  Jr6 = interface; //com.huawei.hms.scankit.p.r6
//  Js = interface; //com.huawei.hms.scankit.p.s
//  Js0 = interface; //com.huawei.hms.scankit.p.s0
//  Js1 = interface; //com.huawei.hms.scankit.p.s1
//  Js2 = interface; //com.huawei.hms.scankit.p.s2
//  Js3 = interface; //com.huawei.hms.scankit.p.s3
//  Js4 = interface; //com.huawei.hms.scankit.p.s4
//  Js5 = interface; //com.huawei.hms.scankit.p.s5
//  Js6 = interface; //com.huawei.hms.scankit.p.s6
//  Jt = interface; //com.huawei.hms.scankit.p.t
//  Jt0 = interface; //com.huawei.hms.scankit.p.t0
//  Jt1 = interface; //com.huawei.hms.scankit.p.t1
//  Jt2 = interface; //com.huawei.hms.scankit.p.t2
//  Jt3 = interface; //com.huawei.hms.scankit.p.t3
//  Jt4 = interface; //com.huawei.hms.scankit.p.t4
//  Jt5 = interface; //com.huawei.hms.scankit.p.t5
//  Jt6 = interface; //com.huawei.hms.scankit.p.t6
//  Ju = interface; //com.huawei.hms.scankit.p.u
//  Ju0 = interface; //com.huawei.hms.scankit.p.u0
//  Ju1_a = interface; //com.huawei.hms.scankit.p.u1$a
//  Ju1 = interface; //com.huawei.hms.scankit.p.u1
//  Ju2_a = interface; //com.huawei.hms.scankit.p.u2$a
//  Ju2_b = interface; //com.huawei.hms.scankit.p.u2$b
//  Ju2_c = interface; //com.huawei.hms.scankit.p.u2$c
//  Ju2_d = interface; //com.huawei.hms.scankit.p.u2$d
//  Ju2 = interface; //com.huawei.hms.scankit.p.u2
//  Ju3 = interface; //com.huawei.hms.scankit.p.u3
//  Ju4 = interface; //com.huawei.hms.scankit.p.u4
//  Ju5 = interface; //com.huawei.hms.scankit.p.u5
//  Ju6 = interface; //com.huawei.hms.scankit.p.u6
//  Jv = interface; //com.huawei.hms.scankit.p.v
//  Jv0 = interface; //com.huawei.hms.scankit.p.v0
//  Jv1 = interface; //com.huawei.hms.scankit.p.v1
//  Jv2 = interface; //com.huawei.hms.scankit.p.v2
//  Jv3 = interface; //com.huawei.hms.scankit.p.v3
//  Jv4 = interface; //com.huawei.hms.scankit.p.v4
//  Jv5 = interface; //com.huawei.hms.scankit.p.v5
//  Jv6 = interface; //com.huawei.hms.scankit.p.v6
//  Jw = interface; //com.huawei.hms.scankit.p.w
//  Jw0 = interface; //com.huawei.hms.scankit.p.w0
//  Jw1 = interface; //com.huawei.hms.scankit.p.w1
//  Jw2 = interface; //com.huawei.hms.scankit.p.w2
//  Jw3 = interface; //com.huawei.hms.scankit.p.w3
//  Jw4_a = interface; //com.huawei.hms.scankit.p.w4$a
//  Jw4 = interface; //com.huawei.hms.scankit.p.w4
//  Jw5_a = interface; //com.huawei.hms.scankit.p.w5$a
//  Jw5 = interface; //com.huawei.hms.scankit.p.w5
//  Jw6 = interface; //com.huawei.hms.scankit.p.w6
//  Jx = interface; //com.huawei.hms.scankit.p.x
//  Jx0 = interface; //com.huawei.hms.scankit.p.x0
//  Jx1 = interface; //com.huawei.hms.scankit.p.x1
//  Jx2 = interface; //com.huawei.hms.scankit.p.x2
//  Jx3 = interface; //com.huawei.hms.scankit.p.x3
//  Jx4 = interface; //com.huawei.hms.scankit.p.x4
//  Jx5 = interface; //com.huawei.hms.scankit.p.x5
//  Jx6 = interface; //com.huawei.hms.scankit.p.x6
//  Jy = interface; //com.huawei.hms.scankit.p.y
//  Jy0 = interface; //com.huawei.hms.scankit.p.y0
//  Jy1 = interface; //com.huawei.hms.scankit.p.y1
//  Jy2 = interface; //com.huawei.hms.scankit.p.y2
//  Jy3 = interface; //com.huawei.hms.scankit.p.y3
//  Jy4 = interface; //com.huawei.hms.scankit.p.y4
//  Jy5_a = interface; //com.huawei.hms.scankit.p.y5$a
//  Jy5 = interface; //com.huawei.hms.scankit.p.y5
//  Jy6 = interface; //com.huawei.hms.scankit.p.y6
//  Jz = interface; //com.huawei.hms.scankit.p.z
//  Jz0 = interface; //com.huawei.hms.scankit.p.z0
//  Jz1 = interface; //com.huawei.hms.scankit.p.z1
//  Jz2 = interface; //com.huawei.hms.scankit.p.z2
//  Jz3 = interface; //com.huawei.hms.scankit.p.z3
//  Jz4 = interface; //com.huawei.hms.scankit.p.z4
//  Jz5 = interface; //com.huawei.hms.scankit.p.z5
//  Jz6 = interface; //com.huawei.hms.scankit.p.z6
//  JProviderRemoteView = interface; //com.huawei.hms.scankit.ProviderRemoteView
  JLoadOpencvJNIUtil = interface; //com.huawei.hms.scankit.util.LoadOpencvJNIUtil
  JOpencvJNI = interface; //com.huawei.hms.scankit.util.OpencvJNI
//  JViewfinderView_a = interface; //com.huawei.hms.scankit.ViewfinderView$a
//  JViewfinderView_b = interface; //com.huawei.hms.scankit.ViewfinderView$b
//  JViewfinderView_c = interface; //com.huawei.hms.scankit.ViewfinderView$c
  JViewfinderView = interface; //com.huawei.hms.scankit.ViewfinderView

// ===== Forward SuperClasses declarations =====

  JIOnErrorCallback_StubClass = interface; //com.huawei.hms.hmsscankit.api.IOnErrorCallback$Stub
  JIOnLightCallback_StubClass = interface; //com.huawei.hms.hmsscankit.api.IOnLightCallback$Stub
  JIOnResultCallback_StubClass = interface; //com.huawei.hms.hmsscankit.api.IOnResultCallback$Stub
  JHmsScanBaseClass = interface; //com.huawei.hms.ml.scan.HmsScanBase
  JIRemoteCreator_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteCreator$Stub
  JIRemoteDecoderCreator_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderCreator$Stub
  JIRemoteViewDelegate_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$Stub
  JIRemoteDecoderDelegate_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate$Stub
  JIRemoteHmsDecoderDelegate_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$Stub
//  JiClass = interface; //com.huawei.hms.scankit.i
//  Je_124Class = interface; //com.huawei.hms.scankit.e
//  Ja1Class = interface; //com.huawei.hms.scankit.p.a1
//  JoClass = interface; //com.huawei.hms.scankit.p.o
//  Jx5Class = interface; //com.huawei.hms.scankit.p.x5
//  Jg6Class = interface; //com.huawei.hms.scankit.p.g6
//  Jy5Class = interface; //com.huawei.hms.scankit.p.y5
//  Jk6Class = interface; //com.huawei.hms.scankit.p.k6
//  Js6Class = interface; //com.huawei.hms.scankit.p.s6
//  Jt6Class = interface; //com.huawei.hms.scankit.p.t6
//  Je3Class = interface; //com.huawei.hms.scankit.p.e3
//  Jz1Class = interface; //com.huawei.hms.scankit.p.z1
//  Jo4Class = interface; //com.huawei.hms.scankit.p.o4
//  Jb0Class = interface; //com.huawei.hms.scankit.p.b0
//  Jy3Class = interface; //com.huawei.hms.scankit.p.y3
//  Jp4Class = interface; //com.huawei.hms.scankit.p.p4
//  Ja3Class = interface; //com.huawei.hms.scankit.p.a3
//  Jc3Class = interface; //com.huawei.hms.scankit.p.c3
  JIRemoteFrameDecoderDelegate_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteFrameDecoderDelegate$Stub
//  Js1Class = interface; //com.huawei.hms.scankit.p.s1

// ===== Interface declarations =====

  JDynamicModuleInitializerClass = interface(JObjectClass)
  ['{6DBA7BC6-6BFA-4E8E-9E4B-8CE1F747EB8B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDynamicModuleInitializer; cdecl;
    {class} procedure initializeModule(P1: JContext); cdecl;
    {class} function getContext: JContext; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/feature/DynamicModuleInitializer')]
  JDynamicModuleInitializer = interface(JObject)
  ['{E5D98A2C-82E0-4C4E-812E-3A2CFBEAAC94}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDynamicModuleInitializer = class(TJavaGenericImport<JDynamicModuleInitializerClass, JDynamicModuleInitializer>) end;

//  JaClass = interface(JObjectClass)
//  ['{541B93F0-A3A6-4307-B6C7-02A251428282}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/a')]
//  Ja = interface(JObject)
//  ['{CF6FA22C-8123-478B-9B0B-641C5C6E18C6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

  JIOnErrorCallback_DefaultClass = interface(JObjectClass)
  ['{8C8D9BD3-D59B-4D64-846C-1BC305E0244A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnErrorCallback_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnErrorCallback$Default')]
  JIOnErrorCallback_Default = interface(JObject)
  ['{98B13288-27DA-4799-8073-2BEBF8022F1A}']
    { Property Methods }

    { methods }
    procedure onError(P1: Integer); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIOnErrorCallback_Default = class(TJavaGenericImport<JIOnErrorCallback_DefaultClass, JIOnErrorCallback_Default>) end;

  JIOnErrorCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{D567F05E-04B6-40EB-8BE6-147BBBE01303}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JIOnErrorCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JIOnErrorCallback read _GetsDefaultImpl;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnErrorCallback$Stub$Proxy')]
  JIOnErrorCallback_Stub_Proxy = interface(JObject)
  ['{082BAD72-89C7-447C-BD35-EB8135597B31}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onError(P1: Integer); cdecl;

    { Property }
  end;

  TJIOnErrorCallback_Stub_Proxy = class(TJavaGenericImport<JIOnErrorCallback_Stub_ProxyClass, JIOnErrorCallback_Stub_Proxy>) end;

  JIOnErrorCallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{8DE2D27C-D8ED-4A75-AA55-493DBF09DC9A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnErrorCallback_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIOnErrorCallback; cdecl;
    {class} function setDefaultImpl(P1: JIOnErrorCallback): Boolean; cdecl;
    {class} function getDefaultImpl: JIOnErrorCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnErrorCallback$Stub')]
  JIOnErrorCallback_Stub = interface(JBinder) // or JObject
  ['{EED3B953-88A2-40C9-80F8-6CA0D2B9AF60}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIOnErrorCallback_Stub = class(TJavaGenericImport<JIOnErrorCallback_StubClass, JIOnErrorCallback_Stub>) end;

  JIOnErrorCallbackClass = interface(JObjectClass)
  ['{0DC6E20E-18AF-4FDF-9251-9695D5DFF4E0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnErrorCallback')]
  JIOnErrorCallback = interface(IJavaInstance)
  ['{DC5EFFB2-13DE-4375-B6C0-0336ABB821BD}']
    { Property Methods }

    { methods }
    procedure onError(P1: Integer); cdecl;

    { Property }
  end;

  TJIOnErrorCallback = class(TJavaGenericImport<JIOnErrorCallbackClass, JIOnErrorCallback>) end;

  JIOnLightCallback_DefaultClass = interface(JObjectClass)
  ['{4F2BB535-4AC7-4956-AAF7-DFA4CE609052}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnLightCallback_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback$Default')]
  JIOnLightCallback_Default = interface(JObject)
  ['{CDD83FD4-BBC0-48EA-B3BE-93E9CC2EB3F4}']
    { Property Methods }

    { methods }
    procedure onVisibleChanged(P1: Boolean); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIOnLightCallback_Default = class(TJavaGenericImport<JIOnLightCallback_DefaultClass, JIOnLightCallback_Default>) end;

  JIOnLightCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{4E61C6A1-90B8-4CFA-B0F1-3778957F21A9}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JIOnLightCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JIOnLightCallback read _GetsDefaultImpl;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback$Stub$Proxy')]
  JIOnLightCallback_Stub_Proxy = interface(JObject)
  ['{94753DAB-88B4-4F67-A42F-84917B616F81}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onVisibleChanged(P1: Boolean); cdecl;

    { Property }
  end;

  TJIOnLightCallback_Stub_Proxy = class(TJavaGenericImport<JIOnLightCallback_Stub_ProxyClass, JIOnLightCallback_Stub_Proxy>) end;

  JIOnLightCallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{0DC667E2-5232-4F53-835B-13BFF54E0201}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnLightCallback_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIOnLightCallback; cdecl;
    {class} function setDefaultImpl(P1: JIOnLightCallback): Boolean; cdecl;
    {class} function getDefaultImpl: JIOnLightCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback$Stub')]
  JIOnLightCallback_Stub = interface(JBinder) // or JObject
  ['{96FCBBE9-A405-4663-96B6-FEF911F0CC9A}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIOnLightCallback_Stub = class(TJavaGenericImport<JIOnLightCallback_StubClass, JIOnLightCallback_Stub>) end;

  JIOnLightCallbackClass = interface(JObjectClass)
  ['{9427F7A7-75E2-4E48-A756-9DD3D7D2A17B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback')]
  JIOnLightCallback = interface(IJavaInstance)
  ['{92DA0004-B382-48AC-AEAA-74D4026D25C6}']
    { Property Methods }

    { methods }
    procedure onVisibleChanged(P1: Boolean); cdecl;

    { Property }
  end;

  TJIOnLightCallback = class(TJavaGenericImport<JIOnLightCallbackClass, JIOnLightCallback>) end;

  JIOnResultCallback_DefaultClass = interface(JObjectClass)
  ['{1D52FB19-233C-48FC-986F-1DA7454489ED}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnResultCallback_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback$Default')]
  JIOnResultCallback_Default = interface(JObject)
  ['{F51DDDE4-91FF-4AF0-BAA8-85C871F7BBFD}']
    { Property Methods }

    { methods }
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIOnResultCallback_Default = class(TJavaGenericImport<JIOnResultCallback_DefaultClass, JIOnResultCallback_Default>) end;

  JIOnResultCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{EA6526F4-6605-4664-8A1E-0E4B111B011B}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JIOnResultCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JIOnResultCallback read _GetsDefaultImpl;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback$Stub$Proxy')]
  JIOnResultCallback_Stub_Proxy = interface(JObject)
  ['{90B3A2D7-7B49-4C96-9695-0F106047AB7F}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;

    { Property }
  end;

  TJIOnResultCallback_Stub_Proxy = class(TJavaGenericImport<JIOnResultCallback_Stub_ProxyClass, JIOnResultCallback_Stub_Proxy>) end;

  JIOnResultCallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{96222526-B5C8-4313-B56E-1746989A036F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnResultCallback_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIOnResultCallback; cdecl;
    {class} function setDefaultImpl(P1: JIOnResultCallback): Boolean; cdecl;
    {class} function getDefaultImpl: JIOnResultCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback$Stub')]
  JIOnResultCallback_Stub = interface(JBinder) // or JObject
  ['{3761D726-EC81-457C-A838-51859E36FF20}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIOnResultCallback_Stub = class(TJavaGenericImport<JIOnResultCallback_StubClass, JIOnResultCallback_Stub>) end;

  JIOnResultCallbackClass = interface(JObjectClass)
  ['{F52D4A5C-F635-4117-8D35-ADEFB0AD377B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback')]
  JIOnResultCallback = interface(IJavaInstance)
  ['{06D15ECF-0056-4F65-93CF-66568CAA90CD}']
    { Property Methods }

    { methods }
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;

    { Property }
  end;

  TJIOnResultCallback = class(TJavaGenericImport<JIOnResultCallbackClass, JIOnResultCallback>) end;

  JIRemoteCreator_DefaultClass = interface(JObjectClass)
  ['{67E2FEBE-80E4-4BDA-BB25-B82829569FED}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteCreator_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator$Default')]
  JIRemoteCreator_Default = interface(JObject)
  ['{37E21389-E4C0-4975-A829-9C4E7154B82F}']
    { Property Methods }

    { methods }
//    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteCreator_Default = class(TJavaGenericImport<JIRemoteCreator_DefaultClass, JIRemoteCreator_Default>) end;

  JIRemoteCreator_Stub_ProxyClass = interface(JObjectClass)
  ['{0E51F48B-70B5-4EF7-93DE-299D61DC48D3}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JIRemoteCreator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JIRemoteCreator read _GetsDefaultImpl;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator$Stub$Proxy')]
  JIRemoteCreator_Stub_Proxy = interface(JObject)
  ['{DB04CB14-FF90-4DDB-8368-744C8D806A1D}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
//    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl;

    { Property }
  end;

  TJIRemoteCreator_Stub_Proxy = class(TJavaGenericImport<JIRemoteCreator_Stub_ProxyClass, JIRemoteCreator_Stub_Proxy>) end;

  JIRemoteCreator_StubClass = interface(JBinderClass) // or JObjectClass
  ['{05FB3393-A2E1-4A84-A324-AEF3E5318121}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteCreator_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteCreator; cdecl;
    {class} function setDefaultImpl(P1: JIRemoteCreator): Boolean; cdecl;
    {class} function getDefaultImpl: JIRemoteCreator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator$Stub')]
  JIRemoteCreator_Stub = interface(JBinder) // or JObject
  ['{1D9AD6D4-3293-4585-BB30-189F425B6F4A}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteCreator_Stub = class(TJavaGenericImport<JIRemoteCreator_StubClass, JIRemoteCreator_Stub>) end;

  JIRemoteCreatorClass = interface(JObjectClass)
  ['{99035863-0A6B-48AE-8D6A-287EF685132C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator')]
  JIRemoteCreator = interface(IJavaInstance)
  ['{DC70653D-8A51-4221-92CF-A4EE2FAF1861}']
    { Property Methods }

    { methods }
//    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl;

    { Property }
  end;

  TJIRemoteCreator = class(TJavaGenericImport<JIRemoteCreatorClass, JIRemoteCreator>) end;

  JIRemoteDecoderCreator_DefaultClass = interface(JObjectClass)
  ['{E3336310-B3EE-4941-81F3-B990FB26D2E4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteDecoderCreator_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderCreator$Default')]
  JIRemoteDecoderCreator_Default = interface(JObject)
  ['{C8E30842-AF1E-4BD5-81B3-AFC2B0DBD458}']
    { Property Methods }

    { methods }
    function newRemoteFrameDecoderDelegate: JIRemoteFrameDecoderDelegate; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteDecoderCreator_Default = class(TJavaGenericImport<JIRemoteDecoderCreator_DefaultClass, JIRemoteDecoderCreator_Default>) end;

  JIRemoteDecoderCreator_Stub_ProxyClass = interface(JObjectClass)
  ['{231E3494-23E2-4509-A3A1-FE8555EC6E1F}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JIRemoteDecoderCreator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JIRemoteDecoderCreator read _GetsDefaultImpl;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderCreator$Stub$Proxy')]
  JIRemoteDecoderCreator_Stub_Proxy = interface(JObject)
  ['{E56889DF-273D-4B52-8FC0-AC909EB4D3CD}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function newRemoteFrameDecoderDelegate: JIRemoteFrameDecoderDelegate; cdecl;

    { Property }
  end;

  TJIRemoteDecoderCreator_Stub_Proxy = class(TJavaGenericImport<JIRemoteDecoderCreator_Stub_ProxyClass, JIRemoteDecoderCreator_Stub_Proxy>) end;

  JIRemoteDecoderCreator_StubClass = interface(JBinderClass) // or JObjectClass
  ['{08DCEA91-E2E9-4B4C-82B9-2B4568F8B025}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteDecoderCreator_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteDecoderCreator; cdecl;
    {class} function setDefaultImpl(P1: JIRemoteDecoderCreator): Boolean; cdecl;
    {class} function getDefaultImpl: JIRemoteDecoderCreator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderCreator$Stub')]
  JIRemoteDecoderCreator_Stub = interface(JBinder) // or JObject
  ['{F5EBCFA7-EBA3-4B0A-91CB-2C75870A3D53}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteDecoderCreator_Stub = class(TJavaGenericImport<JIRemoteDecoderCreator_StubClass, JIRemoteDecoderCreator_Stub>) end;

  JIRemoteDecoderCreatorClass = interface(JObjectClass)
  ['{37800E04-07C7-41FC-893B-EC48002D64FE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderCreator')]
  JIRemoteDecoderCreator = interface(IJavaInstance)
  ['{3C28F61D-0BEF-41A7-BD60-0A70CF518B53}']
    { Property Methods }

    { methods }
    function newRemoteFrameDecoderDelegate: JIRemoteFrameDecoderDelegate; cdecl;

    { Property }
  end;

  TJIRemoteDecoderCreator = class(TJavaGenericImport<JIRemoteDecoderCreatorClass, JIRemoteDecoderCreator>) end;

  JIRemoteDecoderDelegate_DefaultClass = interface(JObjectClass)
  ['{ED320D76-00F5-4E01-BF4E-E41D464446BA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteDecoderDelegate_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$Default')]
  JIRemoteDecoderDelegate_Default = interface(JObject)
  ['{FAD4A830-F73D-4CF9-AF8F-FD448F9BE23B}']
    { Property Methods }

    { methods }
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl;
//    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
//    function queryDeepLinkInfo(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteDecoderDelegate_Default = class(TJavaGenericImport<JIRemoteDecoderDelegate_DefaultClass, JIRemoteDecoderDelegate_Default>) end;

  JIRemoteDecoderDelegate_Stub_ProxyClass = interface(JObjectClass)
  ['{326966A2-8DF0-49BB-B898-00174F918727}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JIRemoteDecoderDelegate;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JIRemoteDecoderDelegate read _GetsDefaultImpl;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$Stub$Proxy')]
  JIRemoteDecoderDelegate_Stub_Proxy = interface(JObject)
  ['{076FCD7C-104A-48C3-B14A-31D998176AD8}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl;
//    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
//    function queryDeepLinkInfo(P1: JIObjectWrapper): JIObjectWrapper; cdecl;

    { Property }
  end;

  TJIRemoteDecoderDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteDecoderDelegate_Stub_ProxyClass, JIRemoteDecoderDelegate_Stub_Proxy>) end;

  JIRemoteDecoderDelegate_StubClass = interface(JBinderClass) // or JObjectClass
  ['{411C2A37-D589-42DB-A77B-C2FDC87D9D87}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteDecoderDelegate_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteDecoderDelegate; cdecl;
    {class} function setDefaultImpl(P1: JIRemoteDecoderDelegate): Boolean; cdecl;
    {class} function getDefaultImpl: JIRemoteDecoderDelegate; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$Stub')]
  JIRemoteDecoderDelegate_Stub = interface(JBinder) // or JObject
  ['{922555AF-B420-4BCC-A679-5469A87ACA55}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteDecoderDelegate_Stub = class(TJavaGenericImport<JIRemoteDecoderDelegate_StubClass, JIRemoteDecoderDelegate_Stub>) end;

  JIRemoteDecoderDelegateClass = interface(JObjectClass)
  ['{9F12E4FE-C1D6-457E-9612-62C84BBCD47C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate')]
  JIRemoteDecoderDelegate = interface(IJavaInstance)
  ['{5F9C2EFC-052C-488D-BA90-5A4ECEB82EA2}']
    { Property Methods }

    { methods }
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl;
//    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
//    function queryDeepLinkInfo(P1: JIObjectWrapper): JIObjectWrapper; cdecl;

    { Property }
  end;

  TJIRemoteDecoderDelegate = class(TJavaGenericImport<JIRemoteDecoderDelegateClass, JIRemoteDecoderDelegate>) end;

  JIRemoteFrameDecoderDelegate_DefaultClass = interface(JObjectClass)
  ['{5A53B9B4-A799-4E50-958D-645AC458B753}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteFrameDecoderDelegate_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteFrameDecoderDelegate$Default')]
  JIRemoteFrameDecoderDelegate_Default = interface(JObject)
  ['{B132BAF3-2DA0-4492-BE73-A8BD73892BF0}']
    { Property Methods }

    { methods }
//    function decode(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JIObjectWrapper): TJavaObjectArray<Jw5>; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteFrameDecoderDelegate_Default = class(TJavaGenericImport<JIRemoteFrameDecoderDelegate_DefaultClass, JIRemoteFrameDecoderDelegate_Default>) end;

  JIRemoteFrameDecoderDelegate_Stub_ProxyClass = interface(JObjectClass)
  ['{40265A66-0EFA-4693-BC19-5E5CB54D350B}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JIRemoteFrameDecoderDelegate;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JIRemoteFrameDecoderDelegate read _GetsDefaultImpl;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteFrameDecoderDelegate$Stub$Proxy')]
  JIRemoteFrameDecoderDelegate_Stub_Proxy = interface(JObject)
  ['{E1B49133-1391-452E-9764-007EECF44B99}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
//    function decode(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JIObjectWrapper): TJavaObjectArray<Jw5>; cdecl;

    { Property }
  end;

  TJIRemoteFrameDecoderDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteFrameDecoderDelegate_Stub_ProxyClass, JIRemoteFrameDecoderDelegate_Stub_Proxy>) end;

  JIRemoteFrameDecoderDelegate_StubClass = interface(JBinderClass) // or JObjectClass
  ['{CC0441B1-DD8E-44B3-85B9-01691B2F8F28}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteFrameDecoderDelegate_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteFrameDecoderDelegate; cdecl;
    {class} function setDefaultImpl(P1: JIRemoteFrameDecoderDelegate): Boolean; cdecl;
    {class} function getDefaultImpl: JIRemoteFrameDecoderDelegate; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteFrameDecoderDelegate$Stub')]
  JIRemoteFrameDecoderDelegate_Stub = interface(JBinder) // or JObject
  ['{DCAFAE25-9CFC-4F72-A8C6-47E257CF980A}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteFrameDecoderDelegate_Stub = class(TJavaGenericImport<JIRemoteFrameDecoderDelegate_StubClass, JIRemoteFrameDecoderDelegate_Stub>) end;

  JIRemoteFrameDecoderDelegateClass = interface(JObjectClass)
  ['{814DA39B-1196-4013-95D2-2BEC4DA7483B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteFrameDecoderDelegate')]
  JIRemoteFrameDecoderDelegate = interface(IJavaInstance)
  ['{B536A9EF-137B-4B39-970D-A23285323E7D}']
    { Property Methods }

    { methods }
//    function decode(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JIObjectWrapper): TJavaObjectArray<Jw5>; cdecl;

    { Property }
  end;

  TJIRemoteFrameDecoderDelegate = class(TJavaGenericImport<JIRemoteFrameDecoderDelegateClass, JIRemoteFrameDecoderDelegate>) end;

  JIRemoteHmsDecoderDelegate_DefaultClass = interface(JObjectClass)
  ['{546C3468-5A89-434E-9A9A-80BA747A3975}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteHmsDecoderDelegate_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$Default')]
  JIRemoteHmsDecoderDelegate_Default = interface(JObject)
  ['{0368490F-3EE5-43AC-A209-006131C986B2}']
    { Property Methods }

    { methods }
//    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate_Default = class(TJavaGenericImport<JIRemoteHmsDecoderDelegate_DefaultClass, JIRemoteHmsDecoderDelegate_Default>) end;

  JIRemoteHmsDecoderDelegate_Stub_ProxyClass = interface(JObjectClass)
  ['{0E3C3717-FE5A-4FE4-90B4-906F50888378}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JIRemoteHmsDecoderDelegate;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JIRemoteHmsDecoderDelegate read _GetsDefaultImpl;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$Stub$Proxy')]
  JIRemoteHmsDecoderDelegate_Stub_Proxy = interface(JObject)
  ['{AEBC80C4-C788-4F44-8F88-E423B652A639}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
//    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteHmsDecoderDelegate_Stub_ProxyClass, JIRemoteHmsDecoderDelegate_Stub_Proxy>) end;

  JIRemoteHmsDecoderDelegate_StubClass = interface(JBinderClass) // or JObjectClass
  ['{EB9B92F3-F0B0-4CD6-B45E-794A06329AC2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteHmsDecoderDelegate_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteHmsDecoderDelegate; cdecl;
    {class} function setDefaultImpl(P1: JIRemoteHmsDecoderDelegate): Boolean; cdecl;
    {class} function getDefaultImpl: JIRemoteHmsDecoderDelegate; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$Stub')]
  JIRemoteHmsDecoderDelegate_Stub = interface(JBinder) // or JObject
  ['{8FE65DF9-F660-4ED4-9A9F-2A8940264B0F}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate_Stub = class(TJavaGenericImport<JIRemoteHmsDecoderDelegate_StubClass, JIRemoteHmsDecoderDelegate_Stub>) end;

  JIRemoteHmsDecoderDelegateClass = interface(JObjectClass)
  ['{E8B04016-6BAB-4183-AB3D-99D919FF8599}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate')]
  JIRemoteHmsDecoderDelegate = interface(IJavaInstance)
  ['{2271EC80-1A5B-4915-AB68-8E426AEC82F5}']
    { Property Methods }

    { methods }
//    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate = class(TJavaGenericImport<JIRemoteHmsDecoderDelegateClass, JIRemoteHmsDecoderDelegate>) end;

  JIRemoteViewDelegate_DefaultClass = interface(JObjectClass)
  ['{902C1371-ACC1-436C-90D7-E5D2EA75B2A1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteViewDelegate_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$Default')]
  JIRemoteViewDelegate_Default = interface(JObject)
  ['{FAAA2403-BB84-4B9A-AD13-39B8894549F2}']
    { Property Methods }

    { methods }
//    function getView: JIObjectWrapper; cdecl;
    procedure onCreate(P1: JBundle); cdecl;
    procedure onDestroy; cdecl;
    procedure onPause; cdecl;
    procedure onResume; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure setOnResultCallback(P1: JIOnResultCallback); cdecl;
//    procedure setOnClickListener(P1: JIObjectWrapper); cdecl;
    procedure turnOnLight; cdecl;
    procedure turnOffLight; cdecl;
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    procedure setOnLightVisbleCallBack(P1: JIOnLightCallback); cdecl;
    function getLightStatus: Boolean; cdecl;
    procedure resumeContinuouslyScan; cdecl;
    procedure pauseContinuouslyScan; cdecl;
    procedure setOnErrorCallback(P1: JIOnErrorCallback); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteViewDelegate_Default = class(TJavaGenericImport<JIRemoteViewDelegate_DefaultClass, JIRemoteViewDelegate_Default>) end;

  JIRemoteViewDelegate_Stub_ProxyClass = interface(JObjectClass)
  ['{D589BCAF-25CA-46C0-B924-04AF05F7A1D7}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JIRemoteViewDelegate;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JIRemoteViewDelegate read _GetsDefaultImpl;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$Stub$Proxy')]
  JIRemoteViewDelegate_Stub_Proxy = interface(JObject)
  ['{D2F8AC77-DDB4-43B0-A2D2-313937754E88}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
//    function getView: JIObjectWrapper; cdecl;
    procedure onCreate(P1: JBundle); cdecl;
    procedure onDestroy; cdecl;
    procedure onPause; cdecl;
    procedure onResume; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure setOnResultCallback(P1: JIOnResultCallback); cdecl;
//    procedure setOnClickListener(P1: JIObjectWrapper); cdecl;
    procedure turnOnLight; cdecl;
    procedure turnOffLight; cdecl;
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    procedure setOnLightVisbleCallBack(P1: JIOnLightCallback); cdecl;
    function getLightStatus: Boolean; cdecl;
    procedure resumeContinuouslyScan; cdecl;
    procedure pauseContinuouslyScan; cdecl;
    procedure setOnErrorCallback(P1: JIOnErrorCallback); cdecl;

    { Property }
  end;

  TJIRemoteViewDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteViewDelegate_Stub_ProxyClass, JIRemoteViewDelegate_Stub_Proxy>) end;

  JIRemoteViewDelegate_StubClass = interface(JBinderClass) // or JObjectClass
  ['{6BE53112-C65E-4F21-AD26-2C7373AAF661}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteViewDelegate_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteViewDelegate; cdecl;
    {class} function setDefaultImpl(P1: JIRemoteViewDelegate): Boolean; cdecl;
    {class} function getDefaultImpl: JIRemoteViewDelegate; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$Stub')]
  JIRemoteViewDelegate_Stub = interface(JBinder) // or JObject
  ['{85B28B3F-BA36-455A-9031-2F17487CE600}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteViewDelegate_Stub = class(TJavaGenericImport<JIRemoteViewDelegate_StubClass, JIRemoteViewDelegate_Stub>) end;

  JIRemoteViewDelegateClass = interface(JObjectClass)
  ['{220E6EB0-BDCF-4441-B053-08D4E225688F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate')]
  JIRemoteViewDelegate = interface(IJavaInstance)
  ['{904D15FE-CDDD-4604-A25E-5DD0B79C5492}']
    { Property Methods }

    { methods }
//    function getView: JIObjectWrapper; cdecl;
    procedure onCreate(P1: JBundle); cdecl;
    procedure onDestroy; cdecl;
    procedure onPause; cdecl;
    procedure onResume; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure setOnResultCallback(P1: JIOnResultCallback); cdecl;
//    procedure setOnClickListener(P1: JIObjectWrapper); cdecl;
    procedure turnOnLight; cdecl;
    procedure turnOffLight; cdecl;
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    procedure setOnLightVisbleCallBack(P1: JIOnLightCallback); cdecl;
    function getLightStatus: Boolean; cdecl;
    procedure resumeContinuouslyScan; cdecl;
    procedure pauseContinuouslyScan; cdecl;
    procedure setOnErrorCallback(P1: JIOnErrorCallback); cdecl;

    { Property }
  end;

  TJIRemoteViewDelegate = class(TJavaGenericImport<JIRemoteViewDelegateClass, JIRemoteViewDelegate>) end;

//  JbClass = interface(JIOnErrorCallback_StubClass) // or JObjectClass
//  ['{C89CB722-3D02-400D-B933-E1FB1FB52043}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/b')]
//  Jb = interface(JIOnErrorCallback_Stub) // or JObject
//  ['{F041B36E-EB16-44F4-9F63-055E924A4665}']
//    { Property Methods }
//
//    { methods }
//    procedure onError(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JIOnLightCallback_StubClass) // or JObjectClass
//  ['{572F6D1A-DB96-4DA2-8757-281879D6A448}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/c')]
//  Jc = interface(JIOnLightCallback_Stub) // or JObject
//  ['{83FF32D0-83A8-4003-AF9B-56D83DB901ED}']
//    { Property Methods }
//
//    { methods }
//    procedure onVisibleChanged(P1: Boolean); cdecl;
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  JdClass = interface(JIOnResultCallback_StubClass) // or JObjectClass
//  ['{2AD46816-55A3-4725-8805-F2A9A42F192C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/d')]
//  Jd = interface(JIOnResultCallback_Stub) // or JObject
//  ['{30BC0D48-9681-491E-83FF-E1E5014DC3EA}']
//    { Property Methods }
//
//    { methods }
//    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;
//
//    { Property }
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  JDetailRect_aClass = interface(JObjectClass)
//  ['{9E472491-F8D9-45E9-885D-777384AFB9F4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/DetailRect$a')]
//  JDetailRect_a = interface(JObject)
//  ['{A64747F7-A0E0-4C4B-8B39-6E74EFEA81CE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JParcel): JDetailRect; cdecl; overload;
//    function a(P1: Integer): TJavaObjectArray<JDetailRect>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl;
//    function createFromParcel(P1: JParcel): JObject; cdecl;
//
//    { Property }
//  end;

//  TJDetailRect_a = class(TJavaGenericImport<JDetailRect_aClass, JDetailRect_a>) end;

  JDetailRectClass = interface(JObjectClass)
  ['{BD480554-46BB-4A9E-8BDA-2E1C0C60AE1D}']
    { static Property Methods }
    {class} function _GetCUSTOMED_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRECT_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHOTO_MODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_TRANS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRETURN_BITMAP: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEEPLINK_VALUE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEEPLINK_JUMP_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEEPLINK_BACK_COLOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_OFFSCEEN_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_NEW_UI: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_LOCAL_DECODER: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_VIEWTYPE_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVALUE_HMS_SCAN_VERSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHMSSCAN_SDK_VALUE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFALT_HMS_SCAN_VERSIONU: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDetailRect; cdecl; overload;
    {class} function init(P1: Integer; P2: Integer): JDetailRect; cdecl; overload;

    { static Property }
    {class} property CUSTOMED_FLAG: JString read _GetCUSTOMED_FLAG;
    {class} property FORMAT_FLAG: JString read _GetFORMAT_FLAG;
    {class} property RECT_FLAG: JString read _GetRECT_FLAG;
    {class} property PHOTO_MODE: JString read _GetPHOTO_MODE;
    {class} property TYPE_TRANS: JString read _GetTYPE_TRANS;
    {class} property RETURN_BITMAP: JString read _GetRETURN_BITMAP;
    {class} property DEEPLINK_VALUE: JString read _GetDEEPLINK_VALUE;
    {class} property DEEPLINK_JUMP_FLAG: JString read _GetDEEPLINK_JUMP_FLAG;
    {class} property DEEPLINK_BACK_COLOR: JString read _GetDEEPLINK_BACK_COLOR;
    {class} property SCAN_OFFSCEEN_FLAG: JString read _GetSCAN_OFFSCEEN_FLAG;
    {class} property SCAN_NEW_UI: JString read _GetSCAN_NEW_UI;
    {class} property SCAN_LOCAL_DECODER: JString read _GetSCAN_LOCAL_DECODER;
    {class} property SCAN_VIEWTYPE_FLAG: JString read _GetSCAN_VIEWTYPE_FLAG;
    {class} property VALUE_HMS_SCAN_VERSION: Integer read _GetVALUE_HMS_SCAN_VERSION;
    {class} property HMSSCAN_SDK_VALUE: Integer read _GetHMSSCAN_SDK_VALUE;
    {class} property DEFALT_HMS_SCAN_VERSIONU: Integer read _GetDEFALT_HMS_SCAN_VERSIONU;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/DetailRect')]
  JDetailRect = interface(JObject)
  ['{EE7306EF-230E-4A33-BD43-C7A0B9E76EBF}']
    { Property Methods }
    function _Getwidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setwidth(awidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getheight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setheight(aheight: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
    property width: Integer read _Getwidth write _Setwidth;
    property height: Integer read _Getheight write _Setheight;
  end;

  TJDetailRect = class(TJavaGenericImport<JDetailRectClass, JDetailRect>) end;

//  Je_aClass = interface(JSimpleDateFormatClass) // or JObjectClass
//  ['{C65C5798-BA01-44B7-84BC-5D78836BBDD1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/e$a')]
//  Je_a = interface(JSimpleDateFormat) // or JObject
//  ['{4B9E7167-2B59-43BD-AF4A-F245A3265E30}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

//  JeClass = interface(JObjectClass)
//  ['{7029E6CC-97DD-444A-AA11-F59F21CCD2CE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: JHmsBuildBitmapOption): JBundle; cdecl; overload;
//    {class} procedure a(P1: Integer; P2: JBitmap; P3: JBundle); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/e')]
//  Je = interface(JObject)
//  ['{93A65C80-A223-41E5-8D34-A93E0AA7AA81}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  JfClass = interface(JObjectClass)
//  ['{C8FFC4EE-F52F-45FE-9808-93D0DC732665}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function e(P1: JContext): JContext; cdecl;
//    {class} procedure b(P1: JContext); cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/f')]
//  Jf = interface(JObject)
//  ['{A527620B-3DC1-4433-A2F7-A57ACB288B2F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

  JOnErrorCallbackClass = interface(JObjectClass)
  ['{4F557955-9148-4E2D-B4A3-D2F5EE9C84FB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/OnErrorCallback')]
  JOnErrorCallback = interface(IJavaInstance)
  ['{942016F6-DDC8-4A1B-B7E9-1EF8F23279C8}']
    { Property Methods }

    { methods }
    procedure onError(P1: Integer); cdecl;

    { Property }
  end;

  TJOnErrorCallback = class(TJavaGenericImport<JOnErrorCallbackClass, JOnErrorCallback>) end;

  JOnLightVisibleCallBackClass = interface(JObjectClass)
  ['{21642CA2-75E3-4133-88B8-822D5AA78CD0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/OnLightVisibleCallBack')]
  JOnLightVisibleCallBack = interface(IJavaInstance)
  ['{21D61AFB-BB41-4CF6-84C1-AC6F127C7768}']
    { Property Methods }

    { methods }
    procedure onVisibleChanged(P1: Boolean); cdecl;

    { Property }
  end;

  TJOnLightVisibleCallBack = class(TJavaGenericImport<JOnLightVisibleCallBackClass, JOnLightVisibleCallBack>) end;

  JOnResultCallbackClass = interface(JObjectClass)
  ['{DB30D737-9C04-46A4-AF47-32459F41CEFA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/OnResultCallback')]
  JOnResultCallback = interface(IJavaInstance)
  ['{55A90A29-18B2-4617-A9CB-4E3E29AA50DD}']
    { Property Methods }

    { methods }
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;

    { Property }
  end;

  TJOnResultCallback = class(TJavaGenericImport<JOnResultCallbackClass, JOnResultCallback>) end;

//  JRemoteView_a_aClass = interface(JObjectClass)
//  ['{34F9C80D-BEDC-4231-9694-742069F445E9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$a$a')]
//  JRemoteView_a_a = interface(JObject)
//  ['{72772126-06B3-451C-82D7-E51A11A31BA5}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJRemoteView_a_a = class(TJavaGenericImport<JRemoteView_a_aClass, JRemoteView_a_a>) end;

//  JRemoteView_a_bClass = interface(JObjectClass)
//  ['{3E46277E-A47C-4B09-A39D-B0CF9FFCBB6D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$a$b')]
//  JRemoteView_a_b = interface(JObject)
//  ['{A75F5E24-5D28-4A75-84E8-5B48A20DBAF7}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJRemoteView_a_b = class(TJavaGenericImport<JRemoteView_a_bClass, JRemoteView_a_b>) end;

//  JRemoteView_aClass = interface(JDeferredLifecycleHelperClass) // or JObjectClass
//  ['{60F17943-BD7F-49C5-B2C3-0F143DA9B16A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$a')]
//  JRemoteView_a = interface(JDeferredLifecycleHelper) // or JObject
//  ['{5D3B5C92-119A-418A-8A59-180775A7A025}']
//    { Property Methods }
//    function _Getb: JActivity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JActivity);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure b(P1: Boolean); cdecl;
//    procedure c(P1: Boolean); cdecl;
//    procedure createDelegate(P1: JOnDelegateCreatedListener); cdecl;
//
//    { Property }
//    property b: JActivity read _Getb write _Setb;
//  end;

//  TJRemoteView_a = class(TJavaGenericImport<JRemoteView_aClass, JRemoteView_a>) end;

//  JRemoteView_bClass = interface(JObjectClass)
//  ['{BAF34AA7-CE5F-4FC6-9A0C-388EA6829AA8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$b')]
//  JRemoteView_b = interface(JObject)
//  ['{078E7FE1-7773-403C-B542-8B22B0BAC4A3}']
//    { Property Methods }
//
//    { methods }
//    procedure onInflate(P1: JActivity; P2: JBundle; P3: JBundle); cdecl;
//    procedure onCreate(P1: JBundle); cdecl;
//    function onCreateView(P1: JLayoutInflater; P2: JViewGroup; P3: JBundle): JView; cdecl;
//    procedure onStart; cdecl;
//    procedure onResume; cdecl;
//    procedure onPause; cdecl;
//    procedure onStop; cdecl;
//    procedure onDestroyView; cdecl;
//    procedure onDestroy; cdecl;
//    procedure onLowMemory; cdecl;
//    procedure onSaveInstanceState(P1: JBundle); cdecl;
//
//    { Property }
//  end;

//  TJRemoteView_b = class(TJavaGenericImport<JRemoteView_bClass, JRemoteView_b>) end;

  JRemoteView_BuilderClass = interface(JObjectClass)
  ['{0401E56E-DCC2-43FB-99F4-D8A68F79FF90}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRemoteView_Builder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$Builder')]
  JRemoteView_Builder = interface(JObject)
  ['{9F27F9E4-F130-413C-A537-3C6C58151C68}']
    { Property Methods }

    { methods }
    function setBoundingBox(P1: JRect): JRemoteView_Builder; cdecl;
    function setFormat(P1: Integer; P2: TJavaArray<Integer>): JRemoteView_Builder; cdecl;
    function setContext(P1: JActivity): JRemoteView_Builder; cdecl;
    function setContinuouslyScan(P1: Boolean): JRemoteView_Builder; cdecl;
    function enableReturnBitmap: JRemoteView_Builder; cdecl;
    function build: JRemoteView; cdecl;

    { Property }
  end;

  TJRemoteView_Builder = class(TJavaGenericImport<JRemoteView_BuilderClass, JRemoteView_Builder>) end;

  JRemoteViewClass = interface(JObjectClass) // or JObjectClass
  ['{FD8CF267-F1E1-4F2E-840D-2C79AE2D040F}']
    { static Property Methods }
    {class} function _GetREQUEST_CODE_PHOTO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property REQUEST_CODE_PHOTO: Integer read _GetREQUEST_CODE_PHOTO;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView')]
  JRemoteView = interface(JObject) // or
  ['{C803B47C-08C8-471A-A0D4-A90ADAEF5789}']
    { Property Methods }

    { methods }
    procedure onCreate(P1: JBundle); cdecl;
    procedure onResume; cdecl;
    procedure onPause; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onDestroy; cdecl;
    procedure setOnResultCallback(P1: JOnResultCallback); cdecl;
    procedure setOnErrorCallback(P1: JOnErrorCallback); cdecl;
    procedure setOnLightVisibleCallback(P1: JOnLightVisibleCallBack); cdecl;
    procedure onActivityResult(P1: Integer; P2: Integer; P3: JIntent); cdecl;
    function switchLight: Boolean; cdecl;
    procedure resumeContinuouslyScan; cdecl;
    procedure pauseContinuouslyScan; cdecl;
    function getLightStatus: Boolean; cdecl;
    procedure selectPictureFromLocalFile; cdecl;
    procedure selectPictureFromLocalFileFragment(P1: JFragment); cdecl;
    procedure onRequestPermissionsResult(P1: Integer; P2: TJavaObjectArray<JString>; P3: TJavaArray<Integer>; P4: JActivity); cdecl;

    { Property }
  end;

  TJRemoteView = class(TJavaGenericImport<JRemoteViewClass, JRemoteView>) end;

//  JScanKitActivity_1Class = interface(JObjectClass)
//  ['{021613F5-0824-4DFA-80EE-4525F181B7DE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$1')]
//  JScanKitActivity_1 = interface(JObject)
//  ['{D1F58C1B-2112-4F26-95BE-E67CF2B3FA61}']
//    { Property Methods }
//
//    { methods }
//    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;
//
//    { Property }
//  end;

//  TJScanKitActivity_1 = class(TJavaGenericImport<JScanKitActivity_1Class, JScanKitActivity_1>) end;

//  JScanKitActivity_2Class = interface(JOrientationEventListenerClass) // or JObjectClass
//  ['{F76BA5BE-F003-4060-844E-FCD703DFD593}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$2')]
//  JScanKitActivity_2 = interface(JOrientationEventListener) // or JObject
//  ['{A02FA23C-7644-45BC-85A0-5EA6E661F48C}']
//    { Property Methods }
//
//    { methods }
//    procedure onOrientationChanged(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJScanKitActivity_2 = class(TJavaGenericImport<JScanKitActivity_2Class, JScanKitActivity_2>) end;

  JScanKitActivityClass = interface(JActivityClass) // or JObjectClass
  ['{4F8ABE06-EFAF-4C18-A94C-8CE508C7AB2C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JScanKitActivity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity')]
  JScanKitActivity = interface(JActivity) // or JObject
  ['{5E0F66F1-559D-41BB-B702-718770FED2CB}']
    { Property Methods }

    { methods }
    procedure onRequestPermissionsResult(P1: Integer; P2: TJavaObjectArray<JString>; P3: TJavaArray<Integer>); cdecl;

    { Property }
  end;

  TJScanKitActivity = class(TJavaGenericImport<JScanKitActivityClass, JScanKitActivity>) end;

  JScanUtilClass = interface(JObjectClass)
  ['{F69453DF-E51D-439A-9AD2-039D7541B7AD}']
    { static Property Methods }
    {class} function _GetSUCCESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_NO_CAMERA_PERMISSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_NO_READ_PERMISSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_ABNORMAL_RESTART: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCAMERA_ININT_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESULT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JScanUtil; cdecl;
    {class} function startScan(P1: JActivity; P2: Integer; P3: JHmsScanAnalyzerOptions): Integer; cdecl;
    {class} function decodeWithBitmap(P1: JContext; P2: JBitmap; P3: JHmsScanAnalyzerOptions): TJavaObjectArray<JHmsScan>; cdecl;
//    {class} function detectForHmsDector(P1: JContext; P2: JMLFrame; P3: JHmsScanAnalyzerOptions): TJavaObjectArray<JHmsScan>; cdecl;
    {class} function isScanAvailable(P1: JContext): Boolean; cdecl;
    {class} function selfPermissionGranted(P1: JContext; P2: Integer; P3: JString): Boolean; cdecl;
    {class} function compressBitmap(P1: JContext; P2: JString): JBitmap; cdecl;
    {class} function buildBitmap(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: JHmsBuildBitmapOption): JBitmap; cdecl;
    {class} function compressBitmapForAndroid29(P1: JContext; P2: JString): JBitmap; cdecl;

    { static Property }
    {class} property SUCCESS: Integer read _GetSUCCESS;
    {class} property ERROR_NO_CAMERA_PERMISSION: Integer read _GetERROR_NO_CAMERA_PERMISSION;
    {class} property ERROR_NO_READ_PERMISSION: Integer read _GetERROR_NO_READ_PERMISSION;
    {class} property ERROR_ABNORMAL_RESTART: Integer read _GetERROR_ABNORMAL_RESTART;
    {class} property CAMERA_ININT_ERROR: Integer read _GetCAMERA_ININT_ERROR;
    {class} property RESULT: JString read _GetRESULT;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/ScanUtil')]
  JScanUtil = interface(JObject)
  ['{A1220477-EC35-4CCE-A473-624AB29EDB92}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJScanUtil = class(TJavaGenericImport<JScanUtilClass, JScanUtil>) end;

  JWriterExceptionClass = interface(JExceptionClass) // or JObjectClass
  ['{23554858-47D4-4CCE-B2EB-711EEFE97DFD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWriterException; cdecl; overload;
    {class} function init(P1: JString; P2: JString): JWriterException; cdecl; overload;
    {class} function init(P1: JString): JWriterException; cdecl; overload;
    {class} function init(P1: JThrowable): JWriterException; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/WriterException')]
  JWriterException = interface(JException) // or JObject
  ['{A892AC45-EAC5-4E73-846F-1E8F4948783D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWriterException = class(TJavaGenericImport<JWriterExceptionClass, JWriterException>) end;

//  JHmsBuildBitmapOption_1Class = interface(JObjectClass)
//  ['{E6EAD636-0C1F-4897-B827-6E628697BC57}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsBuildBitmapOption$1')]
//  JHmsBuildBitmapOption_1 = interface(JObject)
//  ['{9DE47ECA-DDC5-482B-86A2-5E4BD5953761}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJHmsBuildBitmapOption_1 = class(TJavaGenericImport<JHmsBuildBitmapOption_1Class, JHmsBuildBitmapOption_1>) end;

  JHmsBuildBitmapOption_CreatorClass = interface(JObjectClass)
  ['{191F6170-1DD5-43F0-A477-BCCD2C5C5131}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHmsBuildBitmapOption_Creator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsBuildBitmapOption$Creator')]
  JHmsBuildBitmapOption_Creator = interface(JObject)
  ['{C92DFDD8-C48A-4C48-8BC1-8298C1709B11}']
    { Property Methods }

    { methods }
    function setBitmapMargin(P1: Integer): JHmsBuildBitmapOption_Creator; cdecl;
    function setBitmapColor(P1: Integer): JHmsBuildBitmapOption_Creator; cdecl;
    function setBitmapBackgroundColor(P1: Integer): JHmsBuildBitmapOption_Creator; cdecl;
    function setQRErrorCorrection(P1: JHmsBuildBitmapOption_ErrorCorrectionLevel): JHmsBuildBitmapOption_Creator; cdecl;
    function setQRLogoBitmap(P1: JBitmap): JHmsBuildBitmapOption_Creator; cdecl;
    function create: JHmsBuildBitmapOption; cdecl;

    { Property }
  end;

  TJHmsBuildBitmapOption_Creator = class(TJavaGenericImport<JHmsBuildBitmapOption_CreatorClass, JHmsBuildBitmapOption_Creator>) end;

  JHmsBuildBitmapOption_ErrorCorrectionLevelClass = interface(JEnumClass) // or JObjectClass
  ['{E5C33195-ED3C-4B40-ACF4-15C5F8F5DDA0}']
    { static Property Methods }
    {class} function _GetL: JHmsBuildBitmapOption_ErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM: JHmsBuildBitmapOption_ErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQ: JHmsBuildBitmapOption_ErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetH: JHmsBuildBitmapOption_ErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsBuildBitmapOption_ErrorCorrectionLevel>; cdecl;
    {class} function valueOf(P1: JString): JHmsBuildBitmapOption_ErrorCorrectionLevel; cdecl;

    { static Property }
    {class} property L: JHmsBuildBitmapOption_ErrorCorrectionLevel read _GetL;
    {class} property M: JHmsBuildBitmapOption_ErrorCorrectionLevel read _GetM;
    {class} property Q: JHmsBuildBitmapOption_ErrorCorrectionLevel read _GetQ;
    {class} property H: JHmsBuildBitmapOption_ErrorCorrectionLevel read _GetH;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel')]
  JHmsBuildBitmapOption_ErrorCorrectionLevel = interface(JEnum) // or JObject
  ['{E50D58CC-0ACC-4D59-A72A-287B0386C816}']
    { Property Methods }
    function _Getvalue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setvalue(avalue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property value: JString read _Getvalue write _Setvalue;
  end;

  TJHmsBuildBitmapOption_ErrorCorrectionLevel = class(TJavaGenericImport<JHmsBuildBitmapOption_ErrorCorrectionLevelClass, JHmsBuildBitmapOption_ErrorCorrectionLevel>) end;

  JHmsBuildBitmapOptionClass = interface(JObjectClass)
  ['{924534AD-A9A5-4BA5-8F47-7D89F68F4DA4}']
    { static Property Methods }
    {class} function _GetTYPE_BUILD_BITMAP_CONTENT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_BUILD_BITMAP_WIDTH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_BUILD_BITMAP_HEIGHT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_BUILD_BITMAP_FOTMAT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_BUILD_BITMAP_MARGIN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_BUILD_BITMAP_COLOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_BUILD_BITMAP_BACKCOLOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property TYPE_BUILD_BITMAP_CONTENT: JString read _GetTYPE_BUILD_BITMAP_CONTENT;
    {class} property TYPE_BUILD_BITMAP_WIDTH: JString read _GetTYPE_BUILD_BITMAP_WIDTH;
    {class} property TYPE_BUILD_BITMAP_HEIGHT: JString read _GetTYPE_BUILD_BITMAP_HEIGHT;
    {class} property TYPE_BUILD_BITMAP_FOTMAT: JString read _GetTYPE_BUILD_BITMAP_FOTMAT;
    {class} property TYPE_BUILD_BITMAP_MARGIN: JString read _GetTYPE_BUILD_BITMAP_MARGIN;
    {class} property TYPE_BUILD_BITMAP_COLOR: JString read _GetTYPE_BUILD_BITMAP_COLOR;
    {class} property TYPE_BUILD_BITMAP_BACKCOLOR: JString read _GetTYPE_BUILD_BITMAP_BACKCOLOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsBuildBitmapOption')]
  JHmsBuildBitmapOption = interface(JObject)
  ['{CF437D8A-A576-4FFD-A698-D57A0C3FFC9E}']
    { Property Methods }
    function _Getmargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setmargin(amargin: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbitmapBackgroundColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbitmapBackgroundColor(abitmapBackgroundColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbimapColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbimapColor(abimapColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetQRErrorCorrection: JHmsBuildBitmapOption_ErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetQRErrorCorrection(aQRErrorCorrection: JHmsBuildBitmapOption_ErrorCorrectionLevel);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlogoBitmap: JBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlogoBitmap(alogoBitmap: JBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function toString: JString; cdecl;

    { Property }
    property margin: Integer read _Getmargin write _Setmargin;
    property bitmapBackgroundColor: Integer read _GetbitmapBackgroundColor write _SetbitmapBackgroundColor;
    property bimapColor: Integer read _GetbimapColor write _SetbimapColor;
    property QRErrorCorrection: JHmsBuildBitmapOption_ErrorCorrectionLevel read _GetQRErrorCorrection write _SetQRErrorCorrection;
    property logoBitmap: JBitmap read _GetlogoBitmap write _SetlogoBitmap;
  end;

  TJHmsBuildBitmapOption = class(TJavaGenericImport<JHmsBuildBitmapOptionClass, JHmsBuildBitmapOption>) end;

//  JHmsScan_1Class = interface(JObjectClass)
//  ['{032358BB-79E1-48C9-8BA3-55C2DCDB60BF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$1')]
//  JHmsScan_1 = interface(JObject)
//  ['{D9DACCDE-15F9-4053-8ED6-C543D7186F5F}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_1 = class(TJavaGenericImport<JHmsScan_1Class, JHmsScan_1>) end;

//  JHmsScan_AddressInfo_1Class = interface(JObjectClass)
//  ['{F6E64001-2577-4EAC-B9E6-1725D42EF05B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$AddressInfo$1')]
//  JHmsScan_AddressInfo_1 = interface(JObject)
//  ['{AC228174-D09C-4CB9-95BE-8E96EA25BD56}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_AddressInfo; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_AddressInfo>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_AddressInfo_1 = class(TJavaGenericImport<JHmsScan_AddressInfo_1Class, JHmsScan_AddressInfo_1>) end;

  JHmsScan_AddressInfo_ADDRESS_TYPEClass = interface(JEnumClass) // or JObjectClass
  ['{70D6F792-B9F1-4A5C-99BA-FD2FE0B36231}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOFFICE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESIDENTIAL_USE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScan_AddressInfo_ADDRESS_TYPE>; cdecl;
    {class} function valueOf(P1: JString): JHmsScan_AddressInfo_ADDRESS_TYPE; cdecl;

    { static Property }
    {class} property OTHER_USE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE read _GetOTHER_USE_TYPE;
    {class} property OFFICE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE read _GetOFFICE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE read _GetRESIDENTIAL_USE_TYPE;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$AddressInfo$ADDRESS_TYPE')]
  JHmsScan_AddressInfo_ADDRESS_TYPE = interface(JEnum) // or JObject
  ['{35E443B0-0C07-4C10-B3A5-CC32C227578C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_AddressInfo_ADDRESS_TYPE = class(TJavaGenericImport<JHmsScan_AddressInfo_ADDRESS_TYPEClass, JHmsScan_AddressInfo_ADDRESS_TYPE>) end;

  JHmsScan_AddressInfoClass = interface(JObjectClass)
  ['{1D48C12D-C553-49FD-9567-A5D5B479DF30}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOFFICE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESIDENTIAL_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHmsScan_AddressInfo; cdecl; overload;
    {class} function init(P1: TJavaObjectArray<JString>; P2: Integer): JHmsScan_AddressInfo; cdecl; overload;

    { static Property }
    {class} property OTHER_USE_TYPE: Integer read _GetOTHER_USE_TYPE;
    {class} property OFFICE_TYPE: Integer read _GetOFFICE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: Integer read _GetRESIDENTIAL_USE_TYPE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$AddressInfo')]
  JHmsScan_AddressInfo = interface(JObject)
  ['{5595D783-A198-48D1-BCD2-E4BFA17AA24F}']
    { Property Methods }
    function _GetaddressDetails: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaddressDetails(aaddressDetails: TJavaObjectArray<JString>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetaddressType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaddressType(aaddressType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getAddressDetails: TJavaObjectArray<JString>; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function getAddressType: Integer; cdecl;

    { Property }
    property addressDetails: TJavaObjectArray<JString> read _GetaddressDetails write _SetaddressDetails;
    property addressType: Integer read _GetaddressType write _SetaddressType;
  end;

  TJHmsScan_AddressInfo = class(TJavaGenericImport<JHmsScan_AddressInfoClass, JHmsScan_AddressInfo>) end;

//  JHmsScan_ContactDetail_1Class = interface(JObjectClass)
//  ['{1BBB338F-0C0C-4926-82DB-D0D444A63A5D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$ContactDetail$1')]
//  JHmsScan_ContactDetail_1 = interface(JObject)
//  ['{3EFA2F34-2AA1-42B0-8CFD-82D1B9B3A4CB}']
//    { Property Methods }
//
//    { methods }
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_ContactDetail>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JHmsScan_ContactDetail; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_ContactDetail_1 = class(TJavaGenericImport<JHmsScan_ContactDetail_1Class, JHmsScan_ContactDetail_1>) end;

  JHmsScan_ContactDetailClass = interface(JObjectClass)
  ['{48198C60-AAA2-4156-A7B4-F8C50888AB56}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JHmsScan_PeopleName; P2: JString; P3: JString; P4: TJavaObjectArray<JHmsScan_TelPhoneNumber>; P5: TJavaObjectArray<JHmsScan_EmailContent>; P6: TJavaObjectArray<JHmsScan_AddressInfo>; P7: TJavaObjectArray<JString>; P8: JString): JHmsScan_ContactDetail; cdecl; overload;
    {class} function init(P1: JHmsScan_PeopleName; P2: TJavaObjectArray<JHmsScan_TelPhoneNumber>; P3: TJavaObjectArray<JHmsScan_EmailContent>): JHmsScan_ContactDetail; cdecl; overload;
    {class} function init: JHmsScan_ContactDetail; cdecl; overload;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$ContactDetail')]
  JHmsScan_ContactDetail = interface(JObject)
  ['{7111D7D2-029E-47AA-A7A4-4590F0F06D52}']
    { Property Methods }
    function _GetaddressesInfos: TJavaObjectArray<JHmsScan_AddressInfo>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaddressesInfos(aaddressesInfos: TJavaObjectArray<JHmsScan_AddressInfo>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GeteMailContents: TJavaObjectArray<JHmsScan_EmailContent>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeteMailContents(aeMailContents: TJavaObjectArray<JHmsScan_EmailContent>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetpeopleName: JHmsScan_PeopleName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetpeopleName(apeopleName: JHmsScan_PeopleName);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getcompany: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcompany(acompany: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettelPhoneNumbers: TJavaObjectArray<JHmsScan_TelPhoneNumber>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettelPhoneNumbers(atelPhoneNumbers: TJavaObjectArray<JHmsScan_TelPhoneNumber>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettitle: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settitle(atitle: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcontactLinks: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcontactLinks(acontactLinks: TJavaObjectArray<JString>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getnote: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setnote(anote: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function getPeopleName: JHmsScan_PeopleName; cdecl;
    function getCompany: JString; cdecl;
    function getTitle: JString; cdecl;
    function getTelPhoneNumbers: JList; cdecl;
    function getEmailContents: JList; cdecl;
    function getContactLinks: TJavaObjectArray<JString>; cdecl;
    function getAddressesInfos: JList; cdecl;
    function getNote: JString; cdecl;

    { Property }
    property addressesInfos: TJavaObjectArray<JHmsScan_AddressInfo> read _GetaddressesInfos write _SetaddressesInfos;
    property eMailContents: TJavaObjectArray<JHmsScan_EmailContent> read _GeteMailContents write _SeteMailContents;
    property peopleName: JHmsScan_PeopleName read _GetpeopleName write _SetpeopleName;
    property company: JString read _Getcompany write _Setcompany;
    property telPhoneNumbers: TJavaObjectArray<JHmsScan_TelPhoneNumber> read _GettelPhoneNumbers write _SettelPhoneNumbers;
    property title: JString read _Gettitle write _Settitle;
    property contactLinks: TJavaObjectArray<JString> read _GetcontactLinks write _SetcontactLinks;
    property note: JString read _Getnote write _Setnote;
  end;

  TJHmsScan_ContactDetail = class(TJavaGenericImport<JHmsScan_ContactDetailClass, JHmsScan_ContactDetail>) end;

//  JHmsScan_DriverInfo_1Class = interface(JObjectClass)
//  ['{A10DFDCF-DAB6-4E2F-8768-324AE1A0A0EF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$DriverInfo$1')]
//  JHmsScan_DriverInfo_1 = interface(JObject)
//  ['{5FE1FB7E-78E2-4FEA-AC1C-25A1A7891B34}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_DriverInfo; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_DriverInfo>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_DriverInfo_1 = class(TJavaGenericImport<JHmsScan_DriverInfo_1Class, JHmsScan_DriverInfo_1>) end;

  JHmsScan_DriverInfoClass = interface(JObjectClass)
  ['{A63207AA-851D-40B3-8E87-520FD0AEA5FC}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString; P8: JString; P9: JString; P10: JString; P11: JString; P12: JString; P13: JString; P14: JString; P15: JString; P16: JString; P17: JString; P18: JString): JHmsScan_DriverInfo; cdecl; overload;
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString): JHmsScan_DriverInfo; cdecl; overload;
    {class} function init: JHmsScan_DriverInfo; cdecl; overload;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$DriverInfo')]
  JHmsScan_DriverInfo = interface(JObject)
  ['{2B99ECFE-F652-490A-8321-A13EAE26EC60}']
    { Property Methods }
    function _Getcity: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcity(acity: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getprovince: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setprovince(aprovince: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getavenue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setavenue(aavenue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetzipCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetzipCode(azipCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdateOfBirth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdateOfBirth(adateOfBirth: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcertificateType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcertificateType(acertificateType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdateOfExpire: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdateOfExpire(adateOfExpire: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetgivenName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetgivenName(agivenName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getsex: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setsex(asex: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdateOfIssue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdateOfIssue(adateOfIssue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcountryOfIssue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcountryOfIssue(acountryOfIssue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetfamilyName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetfamilyName(afamilyName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcertificateNumber: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcertificateNumber(acertificateNumber: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmiddleName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmiddleName(amiddleName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GeteyeColor: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeteyeColor(aeyeColor: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GethairColor: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SethairColor(ahairColor: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getheight: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setheight(aheight: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetweightRange: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetweightRange(aweightRange: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getCertificateType: JString; cdecl;
    function getGivenName: JString; cdecl;
    function getMiddleName: JString; cdecl;
    function getFamilyName: JString; cdecl;
    function getSex: JString; cdecl;
    function getAvenue: JString; cdecl;
    function getCity: JString; cdecl;
    function getProvince: JString; cdecl;
    function getZipCode: JString; cdecl;
    function getCertificateNumber: JString; cdecl;
    function getDateOfIssue: JString; cdecl;
    function getDateOfExpire: JString; cdecl;
    function getDateOfBirth: JString; cdecl;
    function getCountryOfIssue: JString; cdecl;
    function getEyeColor: JString; cdecl;
    function getHairColor: JString; cdecl;
    function getHeight: JString; cdecl;
    function getWeightRange: JString; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
    property city: JString read _Getcity write _Setcity;
    property province: JString read _Getprovince write _Setprovince;
    property avenue: JString read _Getavenue write _Setavenue;
    property zipCode: JString read _GetzipCode write _SetzipCode;
    property dateOfBirth: JString read _GetdateOfBirth write _SetdateOfBirth;
    property certificateType: JString read _GetcertificateType write _SetcertificateType;
    property dateOfExpire: JString read _GetdateOfExpire write _SetdateOfExpire;
    property givenName: JString read _GetgivenName write _SetgivenName;
    property sex: JString read _Getsex write _Setsex;
    property dateOfIssue: JString read _GetdateOfIssue write _SetdateOfIssue;
    property countryOfIssue: JString read _GetcountryOfIssue write _SetcountryOfIssue;
    property familyName: JString read _GetfamilyName write _SetfamilyName;
    property certificateNumber: JString read _GetcertificateNumber write _SetcertificateNumber;
    property middleName: JString read _GetmiddleName write _SetmiddleName;
    property eyeColor: JString read _GeteyeColor write _SeteyeColor;
    property hairColor: JString read _GethairColor write _SethairColor;
    property height: JString read _Getheight write _Setheight;
    property weightRange: JString read _GetweightRange write _SetweightRange;
  end;

  TJHmsScan_DriverInfo = class(TJavaGenericImport<JHmsScan_DriverInfoClass, JHmsScan_DriverInfo>) end;

//  JHmsScan_EmailContent_1Class = interface(JObjectClass)
//  ['{2B5F0487-1C29-4CBE-8D86-8A52673C9ADD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EmailContent$1')]
//  JHmsScan_EmailContent_1 = interface(JObject)
//  ['{4BA48A45-3DD7-4302-B6A4-352930C5B0E0}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_EmailContent; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_EmailContent>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_EmailContent_1 = class(TJavaGenericImport<JHmsScan_EmailContent_1Class, JHmsScan_EmailContent_1>) end;

  JHmsScan_EmailContent_EMAIL_TYPEClass = interface(JEnumClass) // or JObjectClass
  ['{047D6F4C-0876-45E9-95AF-687055C39594}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOFFICE_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESIDENTIAL_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScan_EmailContent_EMAIL_TYPE>; cdecl;
    {class} function valueOf(P1: JString): JHmsScan_EmailContent_EMAIL_TYPE; cdecl;

    { static Property }
    {class} property OTHER_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE read _GetOTHER_USE_TYPE;
    {class} property OFFICE_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE read _GetOFFICE_USE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE read _GetRESIDENTIAL_USE_TYPE;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EmailContent$EMAIL_TYPE')]
  JHmsScan_EmailContent_EMAIL_TYPE = interface(JEnum) // or JObject
  ['{7F2EDF41-2732-4BB9-8FBE-DC4D03CF0E4B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_EmailContent_EMAIL_TYPE = class(TJavaGenericImport<JHmsScan_EmailContent_EMAIL_TYPEClass, JHmsScan_EmailContent_EMAIL_TYPE>) end;

  JHmsScan_EmailContentClass = interface(JObjectClass)
  ['{605628C4-8635-4A8B-9E68-DB9620796F6F}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOFFICE_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESIDENTIAL_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JString; P4: Integer): JHmsScan_EmailContent; cdecl; overload;
    {class} function init: JHmsScan_EmailContent; cdecl; overload;

    { static Property }
    {class} property OTHER_USE_TYPE: Integer read _GetOTHER_USE_TYPE;
    {class} property OFFICE_USE_TYPE: Integer read _GetOFFICE_USE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: Integer read _GetRESIDENTIAL_USE_TYPE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EmailContent')]
  JHmsScan_EmailContent = interface(JObject)
  ['{380A95C3-F846-451A-AF23-81C0290A2C5F}']
    { Property Methods }
    function _GetaddressInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaddressInfo(aaddressInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbodyInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbodyInfo(abodyInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsubjectInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsubjectInfo(asubjectInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetaddressType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaddressType(aaddressType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function getAddressType: Integer; cdecl;
    function getAddressInfo: JString; cdecl;
    function getSubjectInfo: JString; cdecl;
    function getBodyInfo: JString; cdecl;

    { Property }
    property addressInfo: JString read _GetaddressInfo write _SetaddressInfo;
    property bodyInfo: JString read _GetbodyInfo write _SetbodyInfo;
    property subjectInfo: JString read _GetsubjectInfo write _SetsubjectInfo;
    property addressType: Integer read _GetaddressType write _SetaddressType;
  end;

  TJHmsScan_EmailContent = class(TJavaGenericImport<JHmsScan_EmailContentClass, JHmsScan_EmailContent>) end;

//  JHmsScan_EventInfo_1Class = interface(JObjectClass)
//  ['{C4A38CAF-C834-4E6D-A58A-A84D196F0AC8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EventInfo$1')]
//  JHmsScan_EventInfo_1 = interface(JObject)
//  ['{C30A4C20-B19C-40D6-9A27-AC0007F6E9C1}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_EventInfo; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_EventInfo>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_EventInfo_1 = class(TJavaGenericImport<JHmsScan_EventInfo_1Class, JHmsScan_EventInfo_1>) end;

  JHmsScan_EventInfoClass = interface(JObjectClass)
  ['{54C595C2-FEFE-4F4A-A16D-47BD418F12B9}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString; P2: JHmsScan_EventTime; P3: JHmsScan_EventTime; P4: JString; P5: JString; P6: JString; P7: JString): JHmsScan_EventInfo; cdecl; overload;
    {class} function init(P1: JString; P2: JHmsScan_EventTime; P3: JHmsScan_EventTime; P4: JString): JHmsScan_EventInfo; cdecl; overload;
    {class} function init: JHmsScan_EventInfo; cdecl; overload;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EventInfo')]
  JHmsScan_EventInfo = interface(JObject)
  ['{2F75AD3F-0F0D-4195-A54A-C8AE3CB0BA81}']
    { Property Methods }
    function _GetabstractInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetabstractInfo(aabstractInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcloseTime: JHmsScan_EventTime;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcloseTime(acloseTime: JHmsScan_EventTime);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetplaceInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetplaceInfo(aplaceInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getsponsor: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setsponsor(asponsor: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbeginTime: JHmsScan_EventTime;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbeginTime(abeginTime: JHmsScan_EventTime);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getcondition: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcondition(acondition: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettheme: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settheme(atheme: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function getTheme: JString; cdecl;
    function getAbstractInfo: JString; cdecl;
    function getPlaceInfo: JString; cdecl;
    function getSponsor: JString; cdecl;
    function getCondition: JString; cdecl;
    function getBeginTime: JHmsScan_EventTime; cdecl;
    function getCloseTime: JHmsScan_EventTime; cdecl;

    { Property }
    property abstractInfo: JString read _GetabstractInfo write _SetabstractInfo;
    property closeTime: JHmsScan_EventTime read _GetcloseTime write _SetcloseTime;
    property placeInfo: JString read _GetplaceInfo write _SetplaceInfo;
    property sponsor: JString read _Getsponsor write _Setsponsor;
    property beginTime: JHmsScan_EventTime read _GetbeginTime write _SetbeginTime;
    property condition: JString read _Getcondition write _Setcondition;
    property theme: JString read _Gettheme write _Settheme;
  end;

  TJHmsScan_EventInfo = class(TJavaGenericImport<JHmsScan_EventInfoClass, JHmsScan_EventInfo>) end;

//  JHmsScan_EventTime_1Class = interface(JObjectClass)
//  ['{C1644ACC-1C59-4312-96D0-D362E6E15696}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EventTime$1')]
//  JHmsScan_EventTime_1 = interface(JObject)
//  ['{0597ECF3-CCB8-46ED-9A9E-0BC2F649B437}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_EventTime; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_EventTime>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_EventTime_1 = class(TJavaGenericImport<JHmsScan_EventTime_1Class, JHmsScan_EventTime_1>) end;

  JHmsScan_EventTimeClass = interface(JObjectClass)
  ['{96C0A5B1-5555-4C94-B1AD-8B1D6265B77F}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Boolean; P8: JString): JHmsScan_EventTime; cdecl; overload;
    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): JHmsScan_EventTime; cdecl; overload;
    {class} function init: JHmsScan_EventTime; cdecl; overload;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EventTime')]
  JHmsScan_EventTime = interface(JObject)
  ['{9A4AC692-91CD-480B-9294-5617AEEAA621}']
    { Property Methods }
    function _Getday: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setday(aday: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gethours: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sethours(ahours: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisUTCTime: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisUTCTime(aisUTCTime: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getminutes: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setminutes(aminutes: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getmonth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setmonth(amonth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetoriginalValue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetoriginalValue(aoriginalValue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getseconds: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setseconds(aseconds: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getyear: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setyear(ayear: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getYear: Integer; cdecl;
    function getMonth: Integer; cdecl;
    function getDay: Integer; cdecl;
    function getHours: Integer; cdecl;
    function getMinutes: Integer; cdecl;
    function getSeconds: Integer; cdecl;
    function isUTCTime: Boolean; cdecl;
    function getOriginalValue: JString; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
    property day: Integer read _Getday write _Setday;
    property hours: Integer read _Gethours write _Sethours;
    property isUTCTime: Boolean read _GetisUTCTime write _SetisUTCTime;
    property minutes: Integer read _Getminutes write _Setminutes;
    property month: Integer read _Getmonth write _Setmonth;
    property originalValue: JString read _GetoriginalValue write _SetoriginalValue;
    property seconds: Integer read _Getseconds write _Setseconds;
    property year: Integer read _Getyear write _Setyear;
  end;

  TJHmsScan_EventTime = class(TJavaGenericImport<JHmsScan_EventTimeClass, JHmsScan_EventTime>) end;

//  JHmsScan_LinkUrl_1Class = interface(JObjectClass)
//  ['{0C38D2DA-DE9A-4A84-8F4A-E6F3EA0CBCD9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$LinkUrl$1')]
//  JHmsScan_LinkUrl_1 = interface(JObject)
//  ['{E99B3042-3876-4197-9189-B8D3C79E6FAF}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_LinkUrl; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_LinkUrl>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_LinkUrl_1 = class(TJavaGenericImport<JHmsScan_LinkUrl_1Class, JHmsScan_LinkUrl_1>) end;

  JHmsScan_LinkUrlClass = interface(JObjectClass)
  ['{761C9DFD-0D49-4B71-887B-F1A73E80C90F}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString; P2: JString): JHmsScan_LinkUrl; cdecl; overload;
    {class} function init: JHmsScan_LinkUrl; cdecl; overload;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$LinkUrl')]
  JHmsScan_LinkUrl = interface(JObject)
  ['{D1046C73-1527-403D-908D-CE126566A662}']
    { Property Methods }
    function _Gettheme: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settheme(atheme: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getlinkvalue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setlinkvalue(alinkvalue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getTheme: JString; cdecl;
    function getLinkValue: JString; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
    property theme: JString read _Gettheme write _Settheme;
    property linkvalue: JString read _Getlinkvalue write _Setlinkvalue;
  end;

  TJHmsScan_LinkUrl = class(TJavaGenericImport<JHmsScan_LinkUrlClass, JHmsScan_LinkUrl>) end;

//  JHmsScan_LocationCoordinate_1Class = interface(JObjectClass)
//  ['{ACC1B8FF-B985-4AE2-9518-D0B70B556337}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$LocationCoordinate$1')]
//  JHmsScan_LocationCoordinate_1 = interface(JObject)
//  ['{B34DF772-EBBC-471B-AA5A-FB8DEA90D81A}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_LocationCoordinate; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_LocationCoordinate>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_LocationCoordinate_1 = class(TJavaGenericImport<JHmsScan_LocationCoordinate_1Class, JHmsScan_LocationCoordinate_1>) end;

  JHmsScan_LocationCoordinateClass = interface(JObjectClass)
  ['{CEA63413-B419-4FEF-90D9-3F505FC446CA}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: Double; P2: Double): JHmsScan_LocationCoordinate; cdecl; overload;
    {class} function init: JHmsScan_LocationCoordinate; cdecl; overload;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$LocationCoordinate')]
  JHmsScan_LocationCoordinate = interface(JObject)
  ['{80B64072-EF90-4832-8A78-5A10354B48F3}']
    { Property Methods }
    function _Getlatitude: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setlatitude(alatitude: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getlongitude: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setlongitude(alongitude: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getLatitude: Double; cdecl;
    function getLongitude: Double; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
    property latitude: Double read _Getlatitude write _Setlatitude;
    property longitude: Double read _Getlongitude write _Setlongitude;
  end;

  TJHmsScan_LocationCoordinate = class(TJavaGenericImport<JHmsScan_LocationCoordinateClass, JHmsScan_LocationCoordinate>) end;

//  JHmsScan_PeopleName_1Class = interface(JObjectClass)
//  ['{E3BEC02B-693C-4E9D-819D-B56999A3FB7B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$PeopleName$1')]
//  JHmsScan_PeopleName_1 = interface(JObject)
//  ['{7679FF42-5E55-4C87-9031-CA820B3D8FF9}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_PeopleName; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_PeopleName>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_PeopleName_1 = class(TJavaGenericImport<JHmsScan_PeopleName_1Class, JHmsScan_PeopleName_1>) end;

  JHmsScan_PeopleNameClass = interface(JObjectClass)
  ['{45F41E7E-70BE-443A-8EFA-1DBB296E2F22}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString): JHmsScan_PeopleName; cdecl; overload;
    {class} function init(P1: JString; P2: JString; P3: JString): JHmsScan_PeopleName; cdecl; overload;
    {class} function init: JHmsScan_PeopleName; cdecl; overload;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$PeopleName')]
  JHmsScan_PeopleName = interface(JObject)
  ['{23DDD3E5-F21A-4AC5-9FCB-A115826227F2}']
    { Property Methods }
    function _GetgivenName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetgivenName(agivenName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetfullName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetfullName(afullName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetfamilyName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetfamilyName(afamilyName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmiddleName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmiddleName(amiddleName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnamePrefix: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnamePrefix(anamePrefix: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getspelling: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setspelling(aspelling: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnameSuffix: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnameSuffix(anameSuffix: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function getSpelling: JString; cdecl;
    function getFullName: JString; cdecl;
    function getNamePrefix: JString; cdecl;
    function getGivenName: JString; cdecl;
    function getFamilyName: JString; cdecl;
    function getMiddleName: JString; cdecl;
    function getNameSuffix: JString; cdecl;

    { Property }
    property givenName: JString read _GetgivenName write _SetgivenName;
    property fullName: JString read _GetfullName write _SetfullName;
    property familyName: JString read _GetfamilyName write _SetfamilyName;
    property middleName: JString read _GetmiddleName write _SetmiddleName;
    property namePrefix: JString read _GetnamePrefix write _SetnamePrefix;
    property spelling: JString read _Getspelling write _Setspelling;
    property nameSuffix: JString read _GetnameSuffix write _SetnameSuffix;
  end;

  TJHmsScan_PeopleName = class(TJavaGenericImport<JHmsScan_PeopleNameClass, JHmsScan_PeopleName>) end;

  JHmsScan_SCAN_TYPE_FORMATClass = interface(JEnumClass) // or JObjectClass
  ['{0FA5B951-A742-4CB2-818B-41EC9FEBE6A7}']
    { static Property Methods }
    {class} function _GetARTICLE_NUMBER_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMAIL_CONTENT_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEL_PHONE_NUMBER_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPURE_TEXT_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMS_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetURL_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWIFI_CONNECT_INFO_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEVENT_INFO_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONTACT_DETAIL_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDRIVER_INFO_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOCATION_COORDINATE_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISBN_NUMBER_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOOK_MARK_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVEHICLEINFO_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScan_SCAN_TYPE_FORMAT>; cdecl;
    {class} function valueOf(P1: JString): JHmsScan_SCAN_TYPE_FORMAT; cdecl;

    { static Property }
    {class} property ARTICLE_NUMBER_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetARTICLE_NUMBER_FORM;
    {class} property EMAIL_CONTENT_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetEMAIL_CONTENT_FORM;
    {class} property TEL_PHONE_NUMBER_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetTEL_PHONE_NUMBER_FORM;
    {class} property PURE_TEXT_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetPURE_TEXT_FORM;
    {class} property SMS_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetSMS_FORM;
    {class} property URL_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetURL_FORM;
    {class} property WIFI_CONNECT_INFO_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetWIFI_CONNECT_INFO_FORM;
    {class} property EVENT_INFO_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetEVENT_INFO_FORM;
    {class} property CONTACT_DETAIL_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetCONTACT_DETAIL_FORM;
    {class} property DRIVER_INFO_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetDRIVER_INFO_FORM;
    {class} property LOCATION_COORDINATE_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetLOCATION_COORDINATE_FORM;
    {class} property ISBN_NUMBER_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetISBN_NUMBER_FORM;
    {class} property BOOK_MARK_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetBOOK_MARK_FORM;
    {class} property VEHICLEINFO_FORM: JHmsScan_SCAN_TYPE_FORMAT read _GetVEHICLEINFO_FORM;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT')]
  JHmsScan_SCAN_TYPE_FORMAT = interface(JEnum) // or JObject
  ['{5ADE6698-7B5C-47B5-A5B6-F864ACB21A62}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_SCAN_TYPE_FORMAT = class(TJavaGenericImport<JHmsScan_SCAN_TYPE_FORMATClass, JHmsScan_SCAN_TYPE_FORMAT>) end;

//  JHmsScan_SmsContent_1Class = interface(JObjectClass)
//  ['{58F0BAAA-1DCE-4FFC-BA53-89442A3AB11C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$SmsContent$1')]
//  JHmsScan_SmsContent_1 = interface(JObject)
//  ['{D3836CC3-A807-47F6-8A29-2513CCEC6BB4}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_SmsContent; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_SmsContent>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_SmsContent_1 = class(TJavaGenericImport<JHmsScan_SmsContent_1Class, JHmsScan_SmsContent_1>) end;

  JHmsScan_SmsContentClass = interface(JObjectClass)
  ['{E099D419-FF95-43E3-BAA7-B8762EEACF1A}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString; P2: JString): JHmsScan_SmsContent; cdecl; overload;
    {class} function init: JHmsScan_SmsContent; cdecl; overload;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$SmsContent')]
  JHmsScan_SmsContent = interface(JObject)
  ['{43377D87-54CA-464E-BFD6-FD8F9799B81B}']
    { Property Methods }
    function _GetmsgContent: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmsgContent(amsgContent: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdestPhoneNumber: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdestPhoneNumber(adestPhoneNumber: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function getMsgContent: JString; cdecl;
    function getDestPhoneNumber: JString; cdecl;

    { Property }
    property msgContent: JString read _GetmsgContent write _SetmsgContent;
    property destPhoneNumber: JString read _GetdestPhoneNumber write _SetdestPhoneNumber;
  end;

  TJHmsScan_SmsContent = class(TJavaGenericImport<JHmsScan_SmsContentClass, JHmsScan_SmsContent>) end;

//  JHmsScan_TelPhoneNumber_1Class = interface(JObjectClass)
//  ['{567AB32D-F08A-4482-B27A-13BE017199E0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$1')]
//  JHmsScan_TelPhoneNumber_1 = interface(JObject)
//  ['{78C21097-9382-4A6F-8B19-EFCAFFC77A76}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_TelPhoneNumber; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_TelPhoneNumber>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_TelPhoneNumber_1 = class(TJavaGenericImport<JHmsScan_TelPhoneNumber_1Class, JHmsScan_TelPhoneNumber_1>) end;

  JHmsScan_TelPhoneNumber_USE_TYPEClass = interface(JEnumClass) // or JObjectClass
  ['{5D665B32-84F2-4479-A277-9D737CE1A8AB}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESIDENTIAL_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFAX_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCELLPHONE_NUMBER_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOFFICE_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScan_TelPhoneNumber_USE_TYPE>; cdecl;
    {class} function valueOf(P1: JString): JHmsScan_TelPhoneNumber_USE_TYPE; cdecl;

    { static Property }
    {class} property OTHER_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE read _GetOTHER_USE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE read _GetRESIDENTIAL_USE_TYPE;
    {class} property FAX_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE read _GetFAX_USE_TYPE;
    {class} property CELLPHONE_NUMBER_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE read _GetCELLPHONE_NUMBER_USE_TYPE;
    {class} property OFFICE_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE read _GetOFFICE_USE_TYPE;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$USE_TYPE')]
  JHmsScan_TelPhoneNumber_USE_TYPE = interface(JEnum) // or JObject
  ['{0CFBD83D-6A8A-4FE6-B9D3-D40C0508B51E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_TelPhoneNumber_USE_TYPE = class(TJavaGenericImport<JHmsScan_TelPhoneNumber_USE_TYPEClass, JHmsScan_TelPhoneNumber_USE_TYPE>) end;

  JHmsScan_TelPhoneNumberClass = interface(JObjectClass)
  ['{CE9BD2E1-04AB-4E38-8F55-2F96F2348E80}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOFFICE_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESIDENTIAL_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFAX_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCELLPHONE_NUMBER_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: Integer; P2: JString): JHmsScan_TelPhoneNumber; cdecl; overload;
    {class} function init: JHmsScan_TelPhoneNumber; cdecl; overload;

    { static Property }
    {class} property OTHER_USE_TYPE: Integer read _GetOTHER_USE_TYPE;
    {class} property OFFICE_USE_TYPE: Integer read _GetOFFICE_USE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: Integer read _GetRESIDENTIAL_USE_TYPE;
    {class} property FAX_USE_TYPE: Integer read _GetFAX_USE_TYPE;
    {class} property CELLPHONE_NUMBER_USE_TYPE: Integer read _GetCELLPHONE_NUMBER_USE_TYPE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$TelPhoneNumber')]
  JHmsScan_TelPhoneNumber = interface(JObject)
  ['{137C460F-91BC-4096-8F7C-A745EAE2776A}']
    { Property Methods }
    function _GettelPhoneNumber: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettelPhoneNumber(atelPhoneNumber: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetuseType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetuseType(auseType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function getTelPhoneNumber: JString; cdecl;
    function getUseType: Integer; cdecl;

    { Property }
    property telPhoneNumber: JString read _GettelPhoneNumber write _SettelPhoneNumber;
    property useType: Integer read _GetuseType write _SetuseType;
  end;

  TJHmsScan_TelPhoneNumber = class(TJavaGenericImport<JHmsScan_TelPhoneNumberClass, JHmsScan_TelPhoneNumber>) end;

//  JHmsScan_WiFiConnectionInfo_1Class = interface(JObjectClass)
//  ['{CF7EC5D9-EC73-46B2-8F59-33C919D9110C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo$1')]
//  JHmsScan_WiFiConnectionInfo_1 = interface(JObject)
//  ['{66CEEA38-53F1-4FEF-9238-A6D72ED81257}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_WiFiConnectionInfo; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_WiFiConnectionInfo>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScan_WiFiConnectionInfo_1 = class(TJavaGenericImport<JHmsScan_WiFiConnectionInfo_1Class, JHmsScan_WiFiConnectionInfo_1>) end;

  JHmsScan_WiFiConnectionInfo_CIPHER_MODEClass = interface(JEnumClass) // or JObjectClass
  ['{68ECB933-A1AC-4985-A0E7-27CEF606FB59}']
    { static Property Methods }
    {class} function _GetSAE_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWEP_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNO_PASSWORD_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWPA_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScan_WiFiConnectionInfo_CIPHER_MODE>; cdecl;
    {class} function valueOf(P1: JString): JHmsScan_WiFiConnectionInfo_CIPHER_MODE; cdecl;

    { static Property }
    {class} property SAE_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE read _GetSAE_MODE_TYPE;
    {class} property WEP_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE read _GetWEP_MODE_TYPE;
    {class} property NO_PASSWORD_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE read _GetNO_PASSWORD_MODE_TYPE;
    {class} property WPA_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE read _GetWPA_MODE_TYPE;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo$CIPHER_MODE')]
  JHmsScan_WiFiConnectionInfo_CIPHER_MODE = interface(JEnum) // or JObject
  ['{219BBD64-F78E-49DA-B8FD-C4AC4A56312C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_WiFiConnectionInfo_CIPHER_MODE = class(TJavaGenericImport<JHmsScan_WiFiConnectionInfo_CIPHER_MODEClass, JHmsScan_WiFiConnectionInfo_CIPHER_MODE>) end;

  JHmsScan_WiFiConnectionInfoClass = interface(JObjectClass)
  ['{0E167698-EBA3-4003-9632-90BE49FF0EC8}']
    { static Property Methods }
    {class} function _GetNO_PASSWORD_MODE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWEP_MODE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWPA_MODE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSAE_MODE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: Integer): JHmsScan_WiFiConnectionInfo; cdecl; overload;
    {class} function init: JHmsScan_WiFiConnectionInfo; cdecl; overload;

    { static Property }
    {class} property NO_PASSWORD_MODE_TYPE: Integer read _GetNO_PASSWORD_MODE_TYPE;
    {class} property WEP_MODE_TYPE: Integer read _GetWEP_MODE_TYPE;
    {class} property WPA_MODE_TYPE: Integer read _GetWPA_MODE_TYPE;
    {class} property SAE_MODE_TYPE: Integer read _GetSAE_MODE_TYPE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo')]
  JHmsScan_WiFiConnectionInfo = interface(JObject)
  ['{8368D230-0AC2-49F7-BF27-9137829BDC9A}']
    { Property Methods }
    function _GetcipherMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcipherMode(acipherMode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getpassword: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setpassword(apassword: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetssidNumber: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetssidNumber(assidNumber: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getSsidNumber: JString; cdecl;
    function getPassword: JString; cdecl;
    function getCipherMode: Integer; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
    property cipherMode: Integer read _GetcipherMode write _SetcipherMode;
    property password: JString read _Getpassword write _Setpassword;
    property ssidNumber: JString read _GetssidNumber write _SetssidNumber;
  end;

  TJHmsScan_WiFiConnectionInfo = class(TJavaGenericImport<JHmsScan_WiFiConnectionInfoClass, JHmsScan_WiFiConnectionInfo>) end;



  JHmsScanBaseClass = interface(JObjectClass)
  ['{052E6CC7-979F-4DA3-988A-D0589FDF5026}']
    { static Property Methods }
    {class} function _GetSCAN_FORMAT_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_VIEW_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT_UNKNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALL_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCODE_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAZTEC_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATAMATRIX_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPDF417_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE39_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE93_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE128_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEAN13_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEAN8_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetITF14_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPCCODE_A_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPCCODE_E_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODABAR_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOTHER_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHmsScanBase; cdecl; overload;
    {class} function init(P1: JString; P2: Integer; P3: JString; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaObjectArray<JPoint>; P7: JHmsScanAnalyzerOptions): JHmsScanBase; cdecl; overload;

    { static Property }
    {class} property SCAN_FORMAT_FLAG: JString read _GetSCAN_FORMAT_FLAG;
    {class} property SCAN_VIEW_FLAG: JString read _GetSCAN_VIEW_FLAG;
    {class} property FORMAT_UNKNOWN: Integer read _GetFORMAT_UNKNOWN;
    {class} property ALL_SCAN_TYPE: Integer read _GetALL_SCAN_TYPE;
    {class} property QRCODE_SCAN_TYPE: Integer read _GetQRCODE_SCAN_TYPE;
    {class} property AZTEC_SCAN_TYPE: Integer read _GetAZTEC_SCAN_TYPE;
    {class} property DATAMATRIX_SCAN_TYPE: Integer read _GetDATAMATRIX_SCAN_TYPE;
    {class} property PDF417_SCAN_TYPE: Integer read _GetPDF417_SCAN_TYPE;
    {class} property CODE39_SCAN_TYPE: Integer read _GetCODE39_SCAN_TYPE;
    {class} property CODE93_SCAN_TYPE: Integer read _GetCODE93_SCAN_TYPE;
    {class} property CODE128_SCAN_TYPE: Integer read _GetCODE128_SCAN_TYPE;
    {class} property EAN13_SCAN_TYPE: Integer read _GetEAN13_SCAN_TYPE;
    {class} property EAN8_SCAN_TYPE: Integer read _GetEAN8_SCAN_TYPE;
    {class} property ITF14_SCAN_TYPE: Integer read _GetITF14_SCAN_TYPE;
    {class} property UPCCODE_A_SCAN_TYPE: Integer read _GetUPCCODE_A_SCAN_TYPE;
    {class} property UPCCODE_E_SCAN_TYPE: Integer read _GetUPCCODE_E_SCAN_TYPE;
    {class} property CODABAR_SCAN_TYPE: Integer read _GetCODABAR_SCAN_TYPE;
    {class} property OTHER_FORM: Integer read _GetOTHER_FORM;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanBase')]
  JHmsScanBase = interface(JObject)
  ['{2C946481-14CF-487A-80C4-6CAA7C3CEE82}']
    { Property Methods }
    function _GetscanTypeForm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetscanTypeForm(ascanTypeForm: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcornerPoints: TJavaObjectArray<JPoint>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcornerPoints(acornerPoints: TJavaObjectArray<JPoint>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetshowResult: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetshowResult(ashowResult: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetscanType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetscanType(ascanType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetzoomValue: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetzoomValue(azoomValue: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetoriginValueByte: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetoriginValueByte(aoriginValueByte: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetoriginalValue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetoriginalValue(aoriginalValue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getoptions: JHmsScanAnalyzerOptions;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setoptions(aoptions: JHmsScanAnalyzerOptions);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetoriginalBitmap: JBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetoriginalBitmap(aoriginalBitmap: JBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getScanTypeForm: Integer; cdecl;
    function getZoomValue: Double; cdecl;
    function getOriginValueByte: TJavaArray<Byte>; cdecl;
    function getOriginalBitmap: JBitmap; cdecl;
    function getOriginalValue: JString; cdecl;
    function getBorderRect: JRect; cdecl;
    function getCornerPoints: TJavaObjectArray<JPoint>; cdecl;
    function getShowResult: JString; cdecl;
    function getScanType: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    function describeContents: Integer; cdecl;

    { Property }
    property scanTypeForm: Integer read _GetscanTypeForm write _SetscanTypeForm;
    property cornerPoints: TJavaObjectArray<JPoint> read _GetcornerPoints write _SetcornerPoints;
    property showResult: JString read _GetshowResult write _SetshowResult;
    property scanType: Integer read _GetscanType write _SetscanType;
    property zoomValue: Double read _GetzoomValue write _SetzoomValue;
    property originValueByte: TJavaArray<Byte> read _GetoriginValueByte write _SetoriginValueByte;
    property originalValue: JString read _GetoriginalValue write _SetoriginalValue;
    property options: JHmsScanAnalyzerOptions read _Getoptions write _Setoptions;
    property originalBitmap: JBitmap read _GetoriginalBitmap write _SetoriginalBitmap;
  end;

  TJHmsScanBase = class(TJavaGenericImport<JHmsScanBaseClass, JHmsScanBase>) end;



  JHmsScanClass = interface(JHmsScanBaseClass) // or JObjectClass
  ['{A4158266-8F05-4183-A5EA-C9D1603B7F22}']
    { static Property Methods }
    {class} function _GetARTICLE_NUMBER_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPURE_TEXT_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISBN_NUMBER_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEVENT_INFO_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONTACT_DETAIL_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDRIVER_INFO_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMAIL_CONTENT_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOCATION_COORDINATE_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEL_PHONE_NUMBER_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMS_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetURL_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWIFI_CONNECT_INFO_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHmsScan; cdecl; overload;
    {class} function init(P1: JString; P2: Integer; P3: JString; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaObjectArray<JPoint>; P7: JHmsScanAnalyzerOptions): JHmsScan; cdecl; overload;
//    {class} function init(P1: JString; P2: Integer; P3: JString; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaObjectArray<JPoint>; P7: JHmsScanAnalyzerOptions; P8: Jc6): JHmsScan; cdecl; overload;

    { static Property }
    {class} property ARTICLE_NUMBER_FORM: Integer read _GetARTICLE_NUMBER_FORM;
    {class} property PURE_TEXT_FORM: Integer read _GetPURE_TEXT_FORM;
    {class} property ISBN_NUMBER_FORM: Integer read _GetISBN_NUMBER_FORM;
    {class} property EVENT_INFO_FORM: Integer read _GetEVENT_INFO_FORM;
    {class} property CONTACT_DETAIL_FORM: Integer read _GetCONTACT_DETAIL_FORM;
    {class} property DRIVER_INFO_FORM: Integer read _GetDRIVER_INFO_FORM;
    {class} property EMAIL_CONTENT_FORM: Integer read _GetEMAIL_CONTENT_FORM;
    {class} property LOCATION_COORDINATE_FORM: Integer read _GetLOCATION_COORDINATE_FORM;
    {class} property TEL_PHONE_NUMBER_FORM: Integer read _GetTEL_PHONE_NUMBER_FORM;
    {class} property SMS_FORM: Integer read _GetSMS_FORM;
    {class} property URL_FORM: Integer read _GetURL_FORM;
    {class} property WIFI_CONNECT_INFO_FORM: Integer read _GetWIFI_CONNECT_INFO_FORM;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan')]
  JHmsScan = interface(JHmsScanBase) // or JObject
  ['{FE2EC61A-5779-410D-8968-66CA57F4829B}']
    { Property Methods }
    function _GeteventInfo: JHmsScan_EventInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeteventInfo(aeventInfo: JHmsScan_EventInfo);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcontactDetail: JHmsScan_ContactDetail;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcontactDetail(acontactDetail: JHmsScan_ContactDetail);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdriverInfo: JHmsScan_DriverInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdriverInfo(adriverInfo: JHmsScan_DriverInfo);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlinkUrl: JHmsScan_LinkUrl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlinkUrl(alinkUrl: JHmsScan_LinkUrl);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetwifiConnectionInfo: JHmsScan_WiFiConnectionInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetwifiConnectionInfo(awifiConnectionInfo: JHmsScan_WiFiConnectionInfo);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsmsContent: JHmsScan_SmsContent;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsmsContent(asmsContent: JHmsScan_SmsContent);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetemailContent: JHmsScan_EmailContent;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetemailContent(aemailContent: JHmsScan_EmailContent);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlocationCoordinate: JHmsScan_LocationCoordinate;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlocationCoordinate(alocationCoordinate: JHmsScan_LocationCoordinate);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettelPhoneNumber: JHmsScan_TelPhoneNumber;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettelPhoneNumber(atelPhoneNumber: JHmsScan_TelPhoneNumber);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getEventInfo: JHmsScan_EventInfo; cdecl;
    function getContactDetail: JHmsScan_ContactDetail; cdecl;
    function getDriverInfo: JHmsScan_DriverInfo; cdecl;
    function getLinkUrl: JHmsScan_LinkUrl; cdecl;
    function getWiFiConnectionInfo: JHmsScan_WiFiConnectionInfo; cdecl;
    function getSmsContent: JHmsScan_SmsContent; cdecl;
    function getEmailContent: JHmsScan_EmailContent; cdecl;
    function getLocationCoordinate: JHmsScan_LocationCoordinate; cdecl;
    function getTelPhoneNumber: JHmsScan_TelPhoneNumber; cdecl;
    function setZoomValue(P1: Double): JHmsScan; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    function describeContents: Integer; cdecl;

    { Property }
    property eventInfo: JHmsScan_EventInfo read _GeteventInfo write _SeteventInfo;
    property contactDetail: JHmsScan_ContactDetail read _GetcontactDetail write _SetcontactDetail;
    property driverInfo: JHmsScan_DriverInfo read _GetdriverInfo write _SetdriverInfo;
    property linkUrl: JHmsScan_LinkUrl read _GetlinkUrl write _SetlinkUrl;
    property wifiConnectionInfo: JHmsScan_WiFiConnectionInfo read _GetwifiConnectionInfo write _SetwifiConnectionInfo;
    property smsContent: JHmsScan_SmsContent read _GetsmsContent write _SetsmsContent;
    property emailContent: JHmsScan_EmailContent read _GetemailContent write _SetemailContent;
    property locationCoordinate: JHmsScan_LocationCoordinate read _GetlocationCoordinate write _SetlocationCoordinate;
    property telPhoneNumber: JHmsScan_TelPhoneNumber read _GettelPhoneNumber write _SettelPhoneNumber;
  end;

  TJHmsScan = class(TJavaGenericImport<JHmsScanClass, JHmsScan>) end;

//  JHmsScanAnalyzer_1Class = interface(JObjectClass)
//  ['{2088EB46-CC2E-4F0E-9774-A76765A5C38F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzer$1')]
//  JHmsScanAnalyzer_1 = interface(JObject)
//  ['{CD6280A2-2325-480D-9B0E-E013BE1A4CC0}']
//    { Property Methods }
//
//    { methods }
//    function call: JList; cdecl; overload;
//    function call: JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScanAnalyzer_1 = class(TJavaGenericImport<JHmsScanAnalyzer_1Class, JHmsScanAnalyzer_1>) end;

  JHmsScanAnalyzer_CreatorClass = interface(JObjectClass)
  ['{C2865D93-5201-4A9A-A869-22D9604ACBE7}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JHmsScanAnalyzer_Creator; cdecl; overload;
    {class} function init: JHmsScanAnalyzer_Creator; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzer$Creator')]
  JHmsScanAnalyzer_Creator = interface(JObject)
  ['{760974CE-24FC-4CC2-A445-6A24318517AE}']
    { Property Methods }

    { methods }
//    function create: JHmsScanAnalyzer; cdecl;
    function setHmsScanTypes(P1: Integer; P2: TJavaArray<Integer>): JHmsScanAnalyzer_Creator; cdecl; overload;
    function setHmsScanTypes(P1: JHmsScanAnalyzerOptions): JHmsScanAnalyzer_Creator; cdecl; overload;

    { Property }
  end;

  TJHmsScanAnalyzer_Creator = class(TJavaGenericImport<JHmsScanAnalyzer_CreatorClass, JHmsScanAnalyzer_Creator>) end;

//  JHmsScanAnalyzerClass = interface(JMLAnalyzerClass) // or JObjectClass
//  ['{A3241B30-7CF3-4A63-AF61-0587F12524FA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHmsScanAnalyzerOptions): JHmsScanAnalyzer; cdecl; overload;
//    {class} function init: JHmsScanAnalyzer; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzer')]
//  JHmsScanAnalyzer = interface(JMLAnalyzer) // or JObject
//  ['{204736CC-AC97-465A-815C-ED79D05199B2}']
//    { Property Methods }
//
//    { methods }
//    function analyseFrame(P1: JMLFrame): JSparseArray; cdecl;
//    function isAvailable: Boolean; cdecl;
//    procedure destory; cdecl;
//    function analyzInAsyn(P1: JMLFrame): JTask; cdecl;
//
//    { Property }
//  end;
//
//  TJHmsScanAnalyzer = class(TJavaGenericImport<JHmsScanAnalyzerClass, JHmsScanAnalyzer>) end;

//  JHmsScanAnalyzerOptions_1Class = interface(JObjectClass)
//  ['{9AEE1879-661C-453E-B21C-BDB6368C3348}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzerOptions$1')]
//  JHmsScanAnalyzerOptions_1 = interface(JObject)
//  ['{E63EE60B-4982-4298-A95E-9AB0AA6A2B98}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJHmsScanAnalyzerOptions_1 = class(TJavaGenericImport<JHmsScanAnalyzerOptions_1Class, JHmsScanAnalyzerOptions_1>) end;

  JHmsScanAnalyzerOptions_CreatorClass = interface(JObjectClass)
  ['{E397172C-AFDE-43F6-BAE1-3E44008C72A8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHmsScanAnalyzerOptions_Creator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzerOptions$Creator')]
  JHmsScanAnalyzerOptions_Creator = interface(JObject)
  ['{CCFE9FD6-7D9A-433F-A571-A4FD2C42B7E8}']
    { Property Methods }

    { methods }
    function setHmsScanTypes(P1: Integer; P2: TJavaArray<Integer>): JHmsScanAnalyzerOptions_Creator; cdecl;
    function setPhotoMode(P1: Boolean): JHmsScanAnalyzerOptions_Creator; cdecl;
    function setViewType(P1: Integer): JHmsScanAnalyzerOptions_Creator; cdecl;
    function create: JHmsScanAnalyzerOptions; cdecl;

    { Property }
  end;

  TJHmsScanAnalyzerOptions_Creator = class(TJavaGenericImport<JHmsScanAnalyzerOptions_CreatorClass, JHmsScanAnalyzerOptions_Creator>) end;

  JHmsScanAnalyzerOptionsClass = interface(JObjectClass)
  ['{E4098482-FC4A-4EE5-9A77-1E21C057748F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzerOptions')]
  JHmsScanAnalyzerOptions = interface(JObject)
  ['{761BA35C-7EF4-4E58-B6E5-40FC1BF1A853}']
    { Property Methods }
    function _Getmode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setmode(amode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetphotoMode: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetphotoMode(aphotoMode: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetviewType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetviewType(aviewType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
    property mode: Integer read _Getmode write _Setmode;
    property photoMode: Boolean read _GetphotoMode write _SetphotoMode;
    property viewType: Integer read _GetviewType write _SetviewType;
  end;

  TJHmsScanAnalyzerOptions = class(TJavaGenericImport<JHmsScanAnalyzerOptionsClass, JHmsScanAnalyzerOptions>) end;

  JHmsScanBase_SCAN_TYPEClass = interface(JEnumClass) // or JObjectClass
  ['{1172580D-7235-41F4-8754-1644C95A6180}']
    { static Property Methods }
    {class} function _GetFORMAT_UNKNOWN: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALL_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQRCODE_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAZTEC_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATAMATRIX_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPDF417_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE39_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE93_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE128_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEAN13_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEAN8_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetITF14_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPCCODE_A_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPCCODE_E_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODABAR_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScanBase_SCAN_TYPE>; cdecl;
    {class} function valueOf(P1: JString): JHmsScanBase_SCAN_TYPE; cdecl;

    { static Property }
    {class} property FORMAT_UNKNOWN: JHmsScanBase_SCAN_TYPE read _GetFORMAT_UNKNOWN;
    {class} property ALL_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetALL_SCAN_TYPE;
    {class} property QRCODE_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetQRCODE_SCAN_TYPE;
    {class} property AZTEC_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetAZTEC_SCAN_TYPE;
    {class} property DATAMATRIX_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetDATAMATRIX_SCAN_TYPE;
    {class} property PDF417_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetPDF417_SCAN_TYPE;
    {class} property CODE39_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetCODE39_SCAN_TYPE;
    {class} property CODE93_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetCODE93_SCAN_TYPE;
    {class} property CODE128_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetCODE128_SCAN_TYPE;
    {class} property EAN13_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetEAN13_SCAN_TYPE;
    {class} property EAN8_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetEAN8_SCAN_TYPE;
    {class} property ITF14_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetITF14_SCAN_TYPE;
    {class} property UPCCODE_A_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetUPCCODE_A_SCAN_TYPE;
    {class} property UPCCODE_E_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetUPCCODE_E_SCAN_TYPE;
    {class} property CODABAR_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetCODABAR_SCAN_TYPE;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE')]
  JHmsScanBase_SCAN_TYPE = interface(JEnum) // or JObject
  ['{603D0259-14D7-48BD-98DB-40054C243A62}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScanBase_SCAN_TYPE = class(TJavaGenericImport<JHmsScanBase_SCAN_TYPEClass, JHmsScanBase_SCAN_TYPE>) end;

//  Ja_aClass = interface(JEnumClass) // or JObjectClass
//  ['{DA206037-5096-414E-B20B-B8E6506F9371}']
//    { static Property Methods }
//    {class} function _Geta: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ja_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ja_a>; cdecl;
//    {class} function valueOf(P1: JString): Ja_a; cdecl;
//
//    { static Property }
//    {class} property a: Ja_a read _Geta;
//    {class} property b: Ja_a read _Getb;
//    {class} property c: Ja_a read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/a$a')]
//  Ja_a = interface(JEnum) // or JObject
//  ['{9D772369-3B01-4E00-9CC8-E6616777B658}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  Ja_104Class = interface(JHandlerClass) // or JObjectClass
//  ['{C4AE1989-C944-448D-9A4F-D6DD79910E9D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/a')]
//  Ja_104 = interface(JHandler) // or JObject
//  ['{CD7241A7-16A6-44FD-9468-B6A695A5EBD0}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl; overload;
//    procedure a(P1: Jm4); cdecl; overload;
//    function a: Boolean; cdecl; overload;
//    procedure handleMessage(P1: JMessage); cdecl;
//    procedure e; cdecl;
//    procedure f; cdecl;
//    procedure a(P1: Jy5); cdecl; overload;
//    procedure c(P1: Boolean); cdecl; overload;
//    function c: Boolean; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    function d: Boolean; cdecl;
//    procedure b(P1: Boolean); cdecl; overload;
//
//    { Property }
//  end;

//  TJa_104 = class(TJavaGenericImport<Ja_104Class, Ja_104>) end;

//  JBarcodeFormat_aClass = interface(JObjectClass)
//  ['{F97F6313-EA82-44C5-994E-28A321259A28}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/aiscan/common/BarcodeFormat$a')]
//  JBarcodeFormat_a = interface(JObject)
//  ['{C0FDB304-B610-4038-ACB9-BEA1AC2A61A6}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JParcel): JBarcodeFormat; cdecl; overload;
//    function a(P1: Integer): TJavaObjectArray<JBarcodeFormat>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl;
//    function createFromParcel(P1: JParcel): JObject; cdecl;
//
//    { Property }
//  end;

//  TJBarcodeFormat_a = class(TJavaGenericImport<JBarcodeFormat_aClass, JBarcodeFormat_a>) end;

  JBarcodeFormatClass = interface(JEnumClass) // or JObjectClass
  ['{2B56064C-E6DA-4D2C-8C90-F98DBDD943AB}']
    { static Property Methods }
    {class} function _Geta: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getb: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getc: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getd: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gete: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getf: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getg: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geth: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geti: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getj: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getk: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getl: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getm: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getn: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Geto: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JBarcodeFormat>; cdecl;
    {class} function valueOf(P1: JString): JBarcodeFormat; cdecl;

    { static Property }
    {class} property a: JBarcodeFormat read _Geta;
    {class} property b: JBarcodeFormat read _Getb;
    {class} property c: JBarcodeFormat read _Getc;
    {class} property d: JBarcodeFormat read _Getd;
    {class} property e: JBarcodeFormat read _Gete;
    {class} property f: JBarcodeFormat read _Getf;
    {class} property g: JBarcodeFormat read _Getg;
    {class} property h: JBarcodeFormat read _Geth;
    {class} property i: JBarcodeFormat read _Geti;
    {class} property j: JBarcodeFormat read _Getj;
    {class} property k: JBarcodeFormat read _Getk;
    {class} property l: JBarcodeFormat read _Getl;
    {class} property m: JBarcodeFormat read _Getm;
    {class} property n: JBarcodeFormat read _Getn;
    {class} property o: JBarcodeFormat read _Geto;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/scankit/aiscan/common/BarcodeFormat')]
  JBarcodeFormat = interface(JEnum) // or JObject
  ['{FFD54826-CE31-4BB3-8288-CCC5D92C0128}']
    { Property Methods }

    { methods }
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
  end;

  TJBarcodeFormat = class(TJavaGenericImport<JBarcodeFormatClass, JBarcodeFormat>) end;

//  Jb_aClass = interface(JObjectClass)
//  ['{DB4D84BA-83D2-4A2E-81A8-089D869057A2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b$a')]
//  Jb_a = interface(JObject)
//  ['{7E897571-DBA0-4D34-9EBE-A2D5850A293F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  Jb_bClass = interface(JObjectClass)
//  ['{A94931A3-5AE4-42F9-9442-7A5B2C9564AC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b$b')]
//  Jb_b = interface(JObject)
//  ['{42404C77-DCB2-4E0A-9882-60DFD09F28C4}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl;
//    procedure c; cdecl;
//    procedure b; cdecl;
//
//    { Property }
//  end;

//  TJb_b = class(TJavaGenericImport<Jb_bClass, Jb_b>) end;

//  Jb_cClass = interface(JObjectClass)
//  ['{7D12AD14-CDA4-4E66-A8B5-34D7C211EE77}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b$c')]
//  Jb_c = interface(JObject)
//  ['{A83C1F98-722D-47D4-B977-87D616B35C6B}']
//    { Property Methods }
//
//    { methods }
//    procedure onSurfaceTextureAvailable(P1: JSurfaceTexture; P2: Integer; P3: Integer); cdecl;
//    procedure onSurfaceTextureSizeChanged(P1: JSurfaceTexture; P2: Integer; P3: Integer); cdecl;
//    function onSurfaceTextureDestroyed(P1: JSurfaceTexture): Boolean; cdecl;
//    procedure onSurfaceTextureUpdated(P1: JSurfaceTexture); cdecl;
//
//    { Property }
//  end;

//  TJb_c = class(TJavaGenericImport<Jb_cClass, Jb_c>) end;

//  Jb_dClass = interface(JObjectClass)
//  ['{4E500624-05E0-4597-BFEC-1F48054A2BB3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b$d')]
//  Jb_d = interface(JObject)
//  ['{6DA7BD52-2E7E-4332-971C-89A7305403CA}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: JBitmap; P3: Single); cdecl;
//
//    { Property }
//  end;

//  TJb_d = class(TJavaGenericImport<Jb_dClass, Jb_d>) end;

//  Jb_111Class = interface(JObjectClass)
//  ['{503C9096-3E2C-49EF-9BDE-F414B7EAA56E}']
//    { static Property Methods }
//    {class} function _GetG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetH: Jf3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetI: Jg3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JTextureView; P3: JViewfinderView; P4: JRect; P5: Integer; P6: JIObjectWrapper; P7: Boolean; P8: JString; P9: Boolean): Jb_111; cdecl;
//
//    { static Property }
//    {class} property G: JString read _GetG;
//    {class} property H: Jf3 read _GetH;
//    {class} property I: Jg3 read _GetI;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b')]
//  Jb_111 = interface(JObject)
//  ['{539B1462-2B12-49E8-B7A1-E62F43E24316}']
//    { Property Methods }
//    function _Geti: JTextureView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JTextureView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure c; cdecl;
//    procedure g; cdecl;
//    procedure f; cdecl;
//    procedure h; cdecl;
//    procedure e; cdecl;
//    procedure d; cdecl;
//    function b(P1: JMotionEvent): Boolean; cdecl; overload;
//    procedure b(P1: Boolean); cdecl; overload;
//    procedure i; cdecl;
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: JBitmap); cdecl; overload;
//    function a(P1: Boolean): Jb; cdecl; overload;
//    function a(P1: Jm4): Jb; cdecl; overload;
//    procedure a(P1: JIOnResultCallback); cdecl; overload;
//    function a: Jg0; cdecl; overload;
//    procedure a(P1: JIOnErrorCallback); cdecl; overload;
//    function b: Boolean; cdecl; overload;
//
//    { Property }
//    property i: JTextureView read _Geti write _Seti;
//  end;

//  TJb_111 = class(TJavaGenericImport<Jb_111Class, Jb_111>) end;

//  Jc_aClass = interface(JAsyncTaskClass) // or JObjectClass
//  ['{9F0E84F4-6843-49C0-A614-2EEA28ECD099}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc): Jc_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/c$a')]
//  Jc_a = interface(JAsyncTask) // or JObject
//  ['{3797A65B-EAF3-4F6C-A934-0F23B9CA50E0}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer); cdecl; overload;
//    procedure b(P1: Integer); cdecl; overload;
//    procedure b(P1: JList; P2: Integer; P3: Integer; P4: Boolean); cdecl; overload;
//    procedure a(P1: JList; P2: Integer; P3: Integer; P4: Boolean); cdecl; overload;
//
//    { Property }
//  end;

//  TJc_a = class(TJavaGenericImport<Jc_aClass, Jc_a>) end;

//  Jc_113Class = interface(JHandlerClass) // or JObjectClass
//  ['{76187174-E2B7-4452-B81E-8866BE1A8321}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/c')]
//  Jc_113 = interface(JHandler) // or JObject
//  ['{CEF98EDA-A28F-48A6-BA60-9F4B40A22F56}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//    function b(P1: Single): Boolean; cdecl; overload;
//    procedure a(P1: Integer; P2: JList); cdecl; overload;
//    function a(P1: Single): Integer; cdecl; overload;
//    function c: Single; cdecl;
//    function b: JList; cdecl; overload;
//
//    { Property }
//  end;

//  TJc_113 = class(TJavaGenericImport<Jc_113Class, Jc_113>) end;

  JCreatorClass = interface(JIRemoteCreator_StubClass) // or JObjectClass
  ['{95449935-31AF-4D74-A8AE-D3B383F8E031}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCreator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/Creator')]
  JCreator = interface(JIRemoteCreator_Stub) // or JObject
  ['{9EBD9A66-A68A-47C2-994E-3B2E645A2AD3}']
    { Property Methods }

    { methods }
//    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl;

    { Property }
  end;

  TJCreator = class(TJavaGenericImport<JCreatorClass, JCreator>) end;

//  Jd_115Class = interface(JThreadClass) // or JObjectClass
//  ['{3E6F2ABD-2563-4005-B47D-E6A25C42C70C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/d')]
//  Jd_115 = interface(JThread) // or JObject
//  ['{294E5DC7-BC01-4377-A89F-5A3C6632BA89}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JRect); cdecl; overload;
//    procedure run; cdecl;
//    procedure b; cdecl;
//    procedure a(P1: Boolean); cdecl; overload;
//
//    { Property }
//  end;

//  TJd_115 = class(TJavaGenericImport<Jd_115Class, Jd_115>) end;

  JDecoderCreatorClass = interface(JIRemoteDecoderCreator_StubClass) // or JObjectClass
  ['{7367225A-2F4C-4FA6-A823-19B68A604942}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDecoderCreator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/DecoderCreator')]
  JDecoderCreator = interface(JIRemoteDecoderCreator_Stub) // or JObject
  ['{940D8D1E-C2EB-45D2-AAA8-FE89EFFB830D}']
    { Property Methods }

    { methods }
    function newRemoteFrameDecoderDelegate: JIRemoteFrameDecoderDelegate; cdecl;

    { Property }
  end;

  TJDecoderCreator = class(TJavaGenericImport<JDecoderCreatorClass, JDecoderCreator>) end;

//  JScanDrawable_aClass = interface(JObjectClass)
//  ['{1902AF64-3437-4322-85B6-09509C820085}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/drawable/ScanDrawable$a')]
//  JScanDrawable_a = interface(JObject)
//  ['{9D3B3019-6755-4973-B4A0-A04D48B2D4CE}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(P1: JValueAnimator); cdecl;
//
//    { Property }
//  end;

//  TJScanDrawable_a = class(TJavaGenericImport<JScanDrawable_aClass, JScanDrawable_a>) end;

//  JScanDrawable_bClass = interface(JAnimatorListenerAdapterClass) // or JObjectClass
//  ['{BD4FC9B7-15F5-43AD-AAA7-A42E887FED2B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/drawable/ScanDrawable$b')]
//  JScanDrawable_b = interface(JAnimatorListenerAdapter) // or JObject
//  ['{7E8C30A0-BD11-45EF-8CF9-311D421BBF3A}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationRepeat(P1: JAnimator); cdecl;
//
//    { Property }
//  end;

//  TJScanDrawable_b = class(TJavaGenericImport<JScanDrawable_bClass, JScanDrawable_b>) end;

//  JScanDrawable_cClass = interface(JAnimatorListenerAdapterClass) // or JObjectClass
//  ['{D06B88AF-2162-46AF-8E76-19D900008C37}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/drawable/ScanDrawable$c')]
//  JScanDrawable_c = interface(JAnimatorListenerAdapter) // or JObject
//  ['{C7019BCB-BEC8-4608-B590-8CF8E63D6165}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationRepeat(P1: JAnimator); cdecl;
//
//    { Property }
//  end;

//  TJScanDrawable_c = class(TJavaGenericImport<JScanDrawable_cClass, JScanDrawable_c>) end;

  JScanDrawableClass = interface(JDrawableClass) // or JObjectClass
  ['{E227EF37-3279-46DB-A456-B2509579C3F1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JScanDrawable; cdecl; overload;
    {class} function init(P1: JResources): JScanDrawable; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/drawable/ScanDrawable')]
  JScanDrawable = interface(JDrawable) // or JObject
  ['{A498B0BF-9A06-4E88-919D-05B27A3C1765}']
    { Property Methods }

    { methods }
    procedure inflate(P1: JResources; P2: JXmlPullParser; P3: JAttributeSet; P4: JResources_Theme); cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
    function isRunning: Boolean; cdecl;
    procedure draw(P1: JCanvas); cdecl;
    procedure setAlpha(P1: Integer); cdecl;
    procedure setColorFilter(P1: JColorFilter); cdecl;
    function getOpacity: Integer; cdecl;

    { Property }
  end;

  TJScanDrawable = class(TJavaGenericImport<JScanDrawableClass, JScanDrawable>) end;

//  Je_a_121Class = interface(JObjectClass)
//  ['{DCE97C1A-B677-4F61-B9E8-4F92815056BD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/e$a')]
//  Je_a_121 = interface(JObject)
//  ['{090C7C2C-9D62-4989-99AD-CB40CE2F89A5}']
//    { Property Methods }
//
//    { methods }
//    function onTouch(P1: JView; P2: JMotionEvent): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJe_a_121 = class(TJavaGenericImport<Je_a_121Class, Je_a_121>) end;

//  Je_bClass = interface(JOrientationEventListenerClass) // or JObjectClass
//  ['{0B7861AB-0497-4742-95C9-F04D52396C07}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/e$b')]
//  Je_b = interface(JOrientationEventListener) // or JObject
//  ['{20F6A68C-CF49-4924-B226-225DB42A7200}']
//    { Property Methods }
//
//    { methods }
//    procedure onOrientationChanged(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJe_b = class(TJavaGenericImport<Je_bClass, Je_b>) end;

//  Je_cClass = interface(JObjectClass)
//  ['{EF29C596-9B1A-4890-A7EE-07482AFEE1F9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/e$c')]
//  Je_c = interface(JObject)
//  ['{9F2833F9-3708-4BD1-8BC1-BF08DCFA5B79}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJe_c = class(TJavaGenericImport<Je_cClass, Je_c>) end;

//  Je_124Class = interface(JIRemoteViewDelegate_StubClass) // or JObjectClass
//  ['{9662A891-4439-4BD3-BD55-07FC94378CCC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Integer; P3: JObject; P4: JIObjectWrapper; P5: Boolean; P6: Boolean; P7: Boolean): Je_124; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/e')]
//  Je_124 = interface(JIRemoteViewDelegate_Stub) // or JObject
//  ['{D6233F49-98FD-4088-8ED6-88B6CC6B1A90}']
//    { Property Methods }
//
//    { methods }
//    function getView: JIObjectWrapper; cdecl;
//    procedure onCreate(P1: JBundle); cdecl;
//    procedure onSensorChanged(P1: JSensorEvent); cdecl;
//    procedure onAccuracyChanged(P1: JSensor; P2: Integer); cdecl;
//    procedure g; cdecl;
//    procedure onPause; cdecl;
//    procedure onDestroy; cdecl;
//    procedure onResume; cdecl;
//    procedure onStart; cdecl;
//    procedure onStop; cdecl;
//    procedure setOnResultCallback(P1: JIOnResultCallback); cdecl;
//    function a(P1: TJavaObjectArray<JHmsScan>): Boolean; cdecl; overload;
//    function a: Boolean; cdecl; overload;
//    procedure setOnClickListener(P1: JIObjectWrapper); cdecl;
//    procedure turnOnLight; cdecl;
//    procedure turnOffLight; cdecl;
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    procedure setOnLightVisbleCallBack(P1: JIOnLightCallback); cdecl;
//    function getLightStatus: Boolean; cdecl;
//    procedure resumeContinuouslyScan; cdecl;
//    procedure pauseContinuouslyScan; cdecl;
//    procedure setOnErrorCallback(P1: JIOnErrorCallback); cdecl;
//
//    { Property }
//  end;

//  TJe_124 = class(TJavaGenericImport<Je_124Class, Je_124>) end;

//  Jf_125Class = interface(JIRemoteDecoderDelegate_StubClass) // or JObjectClass
//  ['{3B9B2D97-65D0-41FE-BF99-62B6C196DD23}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf_125; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/f')]
//  Jf_125 = interface(JIRemoteDecoderDelegate_Stub) // or JObject
//  ['{DC7B6A9B-4DB3-4A9C-B4D3-F1D00C5A7995}']
//    { Property Methods }
//
//    { methods }
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl;
//    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
//    function queryDeepLinkInfo(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
//
//    { Property }
//  end;

//  TJf_125 = class(TJavaGenericImport<Jf_125Class, Jf_125>) end;

//  JgClass = interface(JIRemoteHmsDecoderDelegate_StubClass) // or JObjectClass
//  ['{887B051E-295C-4502-9CFF-63A07FAF4F5F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/g')]
//  Jg = interface(JIRemoteHmsDecoderDelegate_Stub) // or JObject
//  ['{F5A2500E-57BF-41B2-BB04-731560D8442E}']
//    { Property Methods }
//
//    { methods }
//    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  Jh_aClass = interface(JObjectClass)
//  ['{028B873F-1C89-4F7D-84B3-915C52FBD19E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/h$a')]
//  Jh_a = interface(JObject)
//  ['{68A72201-6CDA-4F60-B317-F21C117B777F}']
//    { Property Methods }
//
//    { methods }
//    procedure onGlobalLayout; cdecl;
//
//    { Property }
//  end;

//  TJh_a = class(TJavaGenericImport<Jh_aClass, Jh_a>) end;

//  JhClass = interface(JiClass) // or JObjectClass
//  ['{E0190EE0-9027-4A3B-9906-6985D54B08F0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Integer; P3: JIObjectWrapper; P4: Boolean; P5: Boolean; P6: Integer): Jh; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/h')]
//  Jh = interface(Ji) // or JObject
//  ['{F4C88B00-3869-4C31-BFD3-8CAC800C5F53}']
//    { Property Methods }
//
//    { methods }
//    procedure onStart; cdecl;
//    procedure onStop; cdecl;
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJh = class(TJavaGenericImport<JhClass, Jh>) end;

//  Ji_aClass = interface(JObjectClass)
//  ['{EDFEF21E-600B-4C0C-9BE5-02D43073A7FE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/i$a')]
//  Ji_a = interface(JObject)
//  ['{9B004B71-09D5-4F7C-BB97-ECB4E9CBFCDF}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJi_a = class(TJavaGenericImport<Ji_aClass, Ji_a>) end;

//  Ji_bClass = interface(JObjectClass)
//  ['{912EC7A5-A0FF-41BF-8B7E-B8C0A2386A19}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/i$b')]
//  Ji_b = interface(JObject)
//  ['{B44DE626-516E-4BE6-8ADA-5357DE054B00}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJi_b = class(TJavaGenericImport<Ji_bClass, Ji_b>) end;

//  JiClass = interface(Je_124Class) // or JObjectClass
//  ['{258AEBDA-27FE-4CDE-83AD-563E0A6C2477}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Integer; P3: JIObjectWrapper; P4: Boolean; P5: Boolean): Ji; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/i')]
//  Ji = interface(Je_124) // or JObject
//  ['{E361A9F9-A97F-4527-9834-40C22ED1B391}']
//    { Property Methods }
//
//    { methods }
//    function getView: JIObjectWrapper; cdecl;
//    procedure onCreate(P1: JBundle); cdecl;
//    procedure onResume; cdecl;
//    procedure onAccuracyChanged(P1: JSensor; P2: Integer); cdecl;
//    procedure setOnClickListener(P1: JIObjectWrapper); cdecl;
//    procedure turnOnLight; cdecl;
//    procedure turnOffLight; cdecl;
//
//    { Property }
//  end;

//  TJi = class(TJavaGenericImport<JiClass, Ji>) end;

//  JjClass = interface(JObjectClass)
//  ['{DA13207D-E05F-470B-85BE-162C1B947049}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Jj; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/j')]
//  Jj = interface(JObject)
//  ['{03927ABD-AD1C-4403-BB96-1F0874D8A443}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Byte>); cdecl;
//
//    { Property }
//  end;

//  TJj = class(TJavaGenericImport<JjClass, Jj>) end;

//  Ja_133Class = interface(JExceptionClass) // or JObjectClass
//  ['{42B55D5E-AF75-4117-A749-0A740A681E69}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Ja; cdecl; overload;
//    {class} function a(P1: JString): Ja; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a')]
//  Ja_133 = interface(JException) // or JObject
//  ['{5BA262CB-11FC-497C-9EA4-0E48E4DA916D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_133 = class(TJavaGenericImport<Ja_133Class, Ja_133>) end;

//  Ja0Class = interface(JObjectClass)
//  ['{24C360AB-AA19-45EE-ABCA-031C9B854FDC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): Ja0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a0')]
//  Ja0 = interface(JObject)
//  ['{2B3439CC-B2F7-4898-8E8E-084018ED519B}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function a(P1: Integer; P2: Integer): Byte; cdecl; overload;
//    function a: TJavaArray<TJavaArray<Byte>>; cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: Boolean); cdecl; overload;
//    procedure a(P1: Byte); cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJa0 = class(TJavaGenericImport<Ja0Class, Ja0>) end;

//  Ja1_aClass = interface(Ja1Class) // or JObjectClass
//  ['{9981FB32-7C62-45F3-83F7-EB611212DA80}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a1$a')]
//  Ja1_a = interface(Ja1) // or JObject
//  ['{05AE1BD0-B726-41BA-A0EA-0763FD3652AC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1_a = class(TJavaGenericImport<Ja1_aClass, Ja1_a>) end;

//  Ja1_bClass = interface(Ja1Class) // or JObjectClass
//  ['{6F0D4BDC-CC13-4649-BD60-DCD1D3CBB66B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a1$b')]
//  Ja1_b = interface(Ja1) // or JObject
//  ['{24C193D9-F441-449D-B5DF-0A75C55C4B77}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1_b = class(TJavaGenericImport<Ja1_bClass, Ja1_b>) end;

//  Ja1_cClass = interface(Ja1Class) // or JObjectClass
//  ['{1064F659-3835-4023-B7FB-B9B62C724D60}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a1$c')]
//  Ja1_c = interface(Ja1) // or JObject
//  ['{4EB6F023-0AC4-460C-9E9D-883480ADB0D6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1_c = class(TJavaGenericImport<Ja1_cClass, Ja1_c>) end;

//  Ja1_dClass = interface(Ja1Class) // or JObjectClass
//  ['{A08799BB-4619-409C-B695-E13226479003}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a1$d')]
//  Ja1_d = interface(Ja1) // or JObject
//  ['{9E677D75-A7C4-4C59-B983-71A72CF249F4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1_d = class(TJavaGenericImport<Ja1_dClass, Ja1_d>) end;

//  Ja1_eClass = interface(Ja1Class) // or JObjectClass
//  ['{8B1BB4AE-9305-4B8D-B282-88404806AC4E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a1$e')]
//  Ja1_e = interface(Ja1) // or JObject
//  ['{09BE3546-E813-4700-AE84-76B52329694B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1_e = class(TJavaGenericImport<Ja1_eClass, Ja1_e>) end;

//  Ja1_fClass = interface(Ja1Class) // or JObjectClass
//  ['{3136A289-E213-4A30-BF6F-B4BEF56FB521}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a1$f')]
//  Ja1_f = interface(Ja1) // or JObject
//  ['{E8C7E8FC-5D9C-4F92-989E-C582E30D5004}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1_f = class(TJavaGenericImport<Ja1_fClass, Ja1_f>) end;

//  Ja1_gClass = interface(Ja1Class) // or JObjectClass
//  ['{191C11A6-024A-4142-A997-11384A0C0235}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a1$g')]
//  Ja1_g = interface(Ja1) // or JObject
//  ['{CB4562D0-FEDB-49AA-9D1F-2ADB980BDEB7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1_g = class(TJavaGenericImport<Ja1_gClass, Ja1_g>) end;

//  Ja1_hClass = interface(Ja1Class) // or JObjectClass
//  ['{9D40C821-F2F3-4E18-BC79-4319158BDEBF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a1$h')]
//  Ja1_h = interface(Ja1) // or JObject
//  ['{7CC5FFEC-8936-4AF1-B633-6FDE9B6287BA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1_h = class(TJavaGenericImport<Ja1_hClass, Ja1_h>) end;

//  Ja1Class = interface(JEnumClass) // or JObjectClass
//  ['{54B6E12B-8C52-4B35-A5B3-13AFAEC4D400}']
//    { static Property Methods }
//    {class} function _Geta: Ja1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ja1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ja1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Ja1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Ja1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Ja1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Ja1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Ja1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ja1>; cdecl;
//    {class} function valueOf(P1: JString): Ja1; cdecl;
//
//    { static Property }
//    {class} property a: Ja1 read _Geta;
//    {class} property b: Ja1 read _Getb;
//    {class} property c: Ja1 read _Getc;
//    {class} property d: Ja1 read _Getd;
//    {class} property e: Ja1 read _Gete;
//    {class} property f: Ja1 read _Getf;
//    {class} property g: Ja1 read _Getg;
//    {class} property h: Ja1 read _Geth;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a1')]
//  Ja1 = interface(JEnum) // or JObject
//  ['{3CF9ADFE-126C-468C-8D71-979156A53393}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa1 = class(TJavaGenericImport<Ja1Class, Ja1>) end;

//  Ja2Class = interface(JObjectClass)
//  ['{791C71B1-3BF6-4B77-A931-0A38589FF8EE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Boolean; P2: Jp; P3: Integer; P4: Boolean): JList; cdecl; overload;
//    {class} function a(P1: Boolean; P2: Jp; P3: Jy1): Boolean; cdecl; overload;
//    {class} procedure a(P1: Js; P2: Jw5; P3: Single; P4: Jy1); cdecl; overload;
//    {class} procedure a(P1: TJavaObjectArray<Jy5>; P2: Single; P3: Jy1); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a2')]
//  Ja2 = interface(JObject)
//  ['{EA970031-98CF-447F-B9D1-6B2579947E6C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa2 = class(TJavaGenericImport<Ja2Class, Ja2>) end;

//  Ja3Class = interface(JoClass) // or JObjectClass
//  ['{832EE2FB-7807-42EC-BB7E-71A9173C48EC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jy3): Ja3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a3')]
//  Ja3 = interface(Jo) // or JObject
//  ['{A29FFEFC-0EB7-40EB-B7DF-BD9A3EFC93C0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr): Jr; cdecl; overload;
//    function a: Js; cdecl; overload;
//    function a(P1: Jy3): Jo; cdecl; overload;
//
//    { Property }
//  end;

//  TJa3 = class(TJavaGenericImport<Ja3Class, Ja3>) end;

//  Ja4Class = interface(JObjectClass)
//  ['{A16107B8-DB4F-443C-9EFA-BE5A083C4607}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a4')]
//  Ja4 = interface(JObject)
//  ['{D5A4FB25-75CE-4D05-B271-3B9DCF0D3119}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa4 = class(TJavaGenericImport<Ja4Class, Ja4>) end;

//  Ja5Class = interface(JObjectClass)
//  ['{6122A89F-8673-4508-97EF-4A13BDB66FD3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a5')]
//  Ja5 = interface(JObject)
//  ['{F565A9B0-E9CC-45E6-AD47-3F53180105B2}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJa5 = class(TJavaGenericImport<Ja5Class, Ja5>) end;

//  Ja6Class = interface(Jx5Class) // or JObjectClass
//  ['{1D8F6F5D-2B2B-4252-B4E3-87EC64170D3F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a6')]
//  Ja6 = interface(Jx5) // or JObject
//  ['{418D15AA-9199-4617-A5CA-A7B4E1A19113}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJa6 = class(TJavaGenericImport<Ja6Class, Ja6>) end;

//  Ja7Class = interface(Jx5Class) // or JObjectClass
//  ['{B29C7E27-8DC1-4CB7-9B73-B2B0EDE7A0F2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a7')]
//  Ja7 = interface(Jx5) // or JObject
//  ['{C6B9D12C-1D53-4409-A1DE-E8E87C44D079}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJa7 = class(TJavaGenericImport<Ja7Class, Ja7>) end;

//  Jb_150Class = interface(JObjectClass)
//  ['{83A5D463-2D37-4CBD-84D1-9875E70421DD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b')]
//  Jb_150 = interface(JObject)
//  ['{3ECBF2F1-E170-42B7-9235-64908D3E0B78}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jo2); cdecl; overload;
//
//    { Property }
//  end;

//  TJb_150 = class(TJavaGenericImport<Jb_150Class, Jb_150>) end;

//  Jb0Class = interface(JObjectClass)
//  ['{09CCBF13-F5BB-4D8C-B07D-B957E8039DCA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b0')]
//  Jb0 = interface(JObject)
//  ['{85211740-31C3-49DA-A76A-41A3F6B4469C}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jo2); cdecl; overload;
//
//    { Property }
//  end;

//  TJb0 = class(TJavaGenericImport<Jb0Class, Jb0>) end;

//  Jb1Class = interface(JObjectClass)
//  ['{08A18796-911E-4101-B82C-737CCC3756AC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b1')]
//  Jb1 = interface(JObject)
//  ['{BEAFAB5F-BA21-4A5D-85F1-42788CAB4471}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Jw5; cdecl;
//
//    { Property }
//  end;

//  TJb1 = class(TJavaGenericImport<Jb1Class, Jb1>) end;

//  Jb2Class = interface(JObjectClass)
//  ['{D35B7DE6-E82E-420A-9CE4-AD5BEEA2CD61}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b2')]
//  Jb2 = interface(JObject)
//  ['{1B461266-091D-4A79-BC6A-9D716ECDB82E}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function a: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJb2 = class(TJavaGenericImport<Jb2Class, Jb2>) end;

//  Jb3Class = interface(JObjectClass)
//  ['{D9AEE9E0-4EBA-458B-82EE-00FA58330DDD}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getq: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr: TJavaArray<Boolean>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gets: JStack;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gett: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a; cdecl; overload;
//    {class} procedure a(P1: Integer); cdecl; overload;
//    {class} procedure a(P1: Jb6); cdecl; overload;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: Boolean read _Getb;
//    {class} property c: Boolean read _Getc;
//    {class} property d: Boolean read _Getd;
//    {class} property e: Single read _Gete;
//    {class} property f: Integer read _Getf;
//    {class} property g: Integer read _Getg;
//    {class} property h: Boolean read _Geth;
//    {class} property i: Boolean read _Geti;
//    {class} property j: Boolean read _Getj;
//    {class} property k: Boolean read _Getk;
//    {class} property l: Boolean read _Getl;
//    {class} property m: Boolean read _Getm;
//    {class} property n: Boolean read _Getn;
//    {class} property o: Boolean read _Geto;
//    {class} property p: Boolean read _Getp;
//    {class} property q: Boolean read _Getq;
//    {class} property r: TJavaArray<Boolean> read _Getr;
//    {class} property s: JStack read _Gets;
//    {class} property t: Boolean read _Gett;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b3')]
//  Jb3 = interface(JObject)
//  ['{E5219F92-F9EB-41EE-96A9-EDA288E06267}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb3 = class(TJavaGenericImport<Jb3Class, Jb3>) end;

//  Jb4Class = interface(JObjectClass)
//  ['{EB668260-8CC5-4D9D-8820-7A48D0D669F8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Single): Integer; cdecl; overload;
//    {class} function a(P1: Single; P2: Single; P3: Single; P4: Single): Single; cdecl; overload;
//    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Single; cdecl; overload;
//    {class} function a(P1: TJavaArray<Integer>): Integer; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b4')]
//  Jb4 = interface(JObject)
//  ['{1D1EAA87-30E4-4837-97B5-CE568EB72389}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb4 = class(TJavaGenericImport<Jb4Class, Jb4>) end;

//  Jb5Class = interface(JObjectClass)
//  ['{F65E987D-72BB-4D61-9A8C-1A1A9D83FF45}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBitmap): Jb5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b5')]
//  Jb5 = interface(JObject)
//  ['{85273786-23F4-43B3-9CA5-F5F424D706DC}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Int64; P2: Single; P3: Single; P4: Int64; P5: Jo3); cdecl; overload;
//    function a(P1: Int64): Boolean; cdecl; overload;
//    function f: Single; cdecl;
//    procedure b(P1: Single); cdecl; overload;
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    function b: Integer; cdecl; overload;
//    procedure b(P1: Integer); cdecl; overload;
//    function c: Single; cdecl;
//    function d: Single; cdecl;
//    function e: Integer; cdecl;
//    procedure a(P1: Single); cdecl; overload;
//
//    { Property }
//  end;

//  TJb5 = class(TJavaGenericImport<Jb5Class, Jb5>) end;

//  Jb6Class = interface(JObjectClass)
//  ['{D0948C6E-DB83-4AD3-8DA0-47BC49A80FB3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb6): Jb6; cdecl; overload;
//    {class} function init(P1: Integer; P2: Boolean): Jb6; cdecl; overload;
//    {class} function init(P1: Integer; P2: Integer; P3: Integer): Jb6; cdecl; overload;
//    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Jb6; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b6')]
//  Jb6 = interface(JObject)
//  ['{0CCB3332-6A16-42CE-A338-E981B8768CD6}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setf(af: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setg(ag: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seth(ah: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geti: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getj: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setj(aj: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Integer): Jb6; cdecl;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//    property d: Boolean read _Getd write _Setd;
//    property e: Boolean read _Gete write _Sete;
//    property f: Integer read _Getf write _Setf;
//    property g: Boolean read _Getg write _Setg;
//    property h: Integer read _Geth write _Seth;
//    property i: Integer read _Geti write _Seti;
//    property j: Boolean read _Getj write _Setj;
//  end;

//  TJb6 = class(TJavaGenericImport<Jb6Class, Jb6>) end;

//  Jb7_aClass = interface(JObjectClass)
//  ['{84BA16A9-8E13-462D-B66E-8DB2834273C4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b7$a')]
//  Jb7_a = interface(JObject)
//  ['{B4ADC7FF-3850-46AD-923E-1385EFC7950A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb7_a = class(TJavaGenericImport<Jb7_aClass, Jb7_a>) end;

//  Jb7_bClass = interface(JObjectClass)
//  ['{97B5E1B3-808C-49B4-B142-F32DE39648C7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b7$b')]
//  Jb7_b = interface(JObject)
//  ['{3515A525-57D2-46D3-9FBA-8EBA392CD0F9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb7_b = class(TJavaGenericImport<Jb7_bClass, Jb7_b>) end;

//  Jb7_cClass = interface(JObjectClass)
//  ['{A2FDC0EF-FCD1-4C9C-A48D-E576996768ED}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b7$c')]
//  Jb7_c = interface(JObject)
//  ['{87A44BE9-E4D5-47F1-BB9D-581022583DD7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb7_c = class(TJavaGenericImport<Jb7_cClass, Jb7_c>) end;

//  Jb7Class = interface(JObjectClass)
//  ['{F7668314-AF42-4989-8E30-BB26388BA3B1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Integer): Jb7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b7')]
//  Jb7 = interface(JObject)
//  ['{96B337B1-5A86-4051-BBB0-C2137264972F}']
//    { Property Methods }
//
//    { methods }
//    function h: Integer; cdecl;
//    function f: Integer; cdecl;
//    function e: Integer; cdecl;
//    function c: Integer; cdecl;
//    function b: Integer; cdecl;
//    function g: Integer; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJb7 = class(TJavaGenericImport<Jb7Class, Jb7>) end;

//  Jc_162Class = interface(Jx5Class) // or JObjectClass
//  ['{7F053A8B-F53F-43D2-A7FC-2E5CD725A06E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_162; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c')]
//  Jc_162 = interface(Jx5) // or JObject
//  ['{1098B89C-7066-4CB9-8E6D-22771E205F1E}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJc_162 = class(TJavaGenericImport<Jc_162Class, Jc_162>) end;

//  Jc0_aClass = interface(JObjectClass)
//  ['{27EAEF0C-E2C6-4C04-A1AB-D1053B1B3D73}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c0$a')]
//  Jc0_a = interface(JObject)
//  ['{53122DCF-2868-4D2E-AD0C-1DBC18AD57D6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc0_a = class(TJavaGenericImport<Jc0_aClass, Jc0_a>) end;

//  Jc0_bClass = interface(JObjectClass)
//  ['{F9C18F14-F576-4D39-8F2B-EEB6005DD759}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc0_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c0$b')]
//  Jc0_b = interface(JObject)
//  ['{A6820D66-A923-4595-86C9-B6EC8A1E7404}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer): Jc0_b; cdecl; overload;
//    function b(P1: Integer): Jc0_b; cdecl; overload;
//    function a(P1: JPoint): Jc0_b; cdecl; overload;
//    function b(P1: Boolean): Jc0_b; cdecl; overload;
//    function a(P1: Boolean): Jc0_b; cdecl; overload;
//    function a: Jc0; cdecl; overload;
//
//    { Property }
//  end;

//  TJc0_b = class(TJavaGenericImport<Jc0_bClass, Jc0_b>) end;

//  Jc0Class = interface(JObjectClass)
//  ['{CD6E5360-7026-443E-B01A-CA07AE0865FA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c0')]
//  Jc0 = interface(JObject)
//  ['{9C07ECE2-BBEF-427A-AE17-F0786FCBA85D}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function f: JString; cdecl;
//    function d: Integer; cdecl;
//    procedure a(P1: Integer); cdecl; overload;
//    function a: JPoint; cdecl; overload;
//    procedure a(P1: JPoint); cdecl; overload;
//    function e: Boolean; cdecl;
//
//    { Property }
//  end;

//  TJc0 = class(TJavaGenericImport<Jc0Class, Jc0>) end;

//  Jc1Class = interface(Jg6Class) // or JObjectClass
//  ['{AFBD58C3-0147-40E3-915A-93BB97C2072C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c1')]
//  Jc1 = interface(Jg6) // or JObject
//  ['{094B1956-F386-4FAF-8F3D-4D354AF88DFB}']
//    { Property Methods }
//
//    { methods }
//    function d: Integer; cdecl;
//    function a(P1: Integer): Integer; cdecl;
//
//    { Property }
//  end;

//  TJc1 = class(TJavaGenericImport<Jc1Class, Jc1>) end;

//  Jc2Class = interface(JObjectClass)
//  ['{151DDB83-7E81-4CA8-9CC3-A78B9F6A3B43}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c2')]
//  Jc2 = interface(JObject)
//  ['{A08F5784-9D9F-49A1-A136-27CC53E9D116}']
//    { Property Methods }
//
//    { methods }
//    function c: Integer; cdecl;
//    function a: Integer; cdecl;
//    function d: Integer; cdecl;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJc2 = class(TJavaGenericImport<Jc2Class, Jc2>) end;

//  Jc3Class = interface(JObjectClass)
//  ['{671B55E6-44A6-411E-AE8E-7B9D9F2CF4DC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc3; cdecl;
//    {class} function a: Jc3; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c3')]
//  Jc3 = interface(JObject)
//  ['{E807CFFB-03B9-4ABE-B80B-41840952C74D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Js; P2: Integer; P3: Integer; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single; P17: Single; P18: Single; P19: Single): Js; cdecl; overload;
//    function a(P1: Js; P2: Integer; P3: Integer; P4: Ji5; P5: Boolean): Js; cdecl; overload;
//
//    { Property }
//  end;

//  TJc3 = class(TJavaGenericImport<Jc3Class, Jc3>) end;

//  Jc4Class = interface(JObjectClass)
//  ['{EFEFF32B-6278-41F5-8EFA-39AF1D26CF35}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c4')]
//  Jc4 = interface(JObject)
//  ['{D5DE6E36-2363-49D0-8C17-50FD96BDE342}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc4 = class(TJavaGenericImport<Jc4Class, Jc4>) end;

//  Jc5Class = interface(JObjectClass)
//  ['{B6218D89-BB30-4ADD-A527-87A8F2361768}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c5')]
//  Jc5 = interface(JObject)
//  ['{CF942335-E17D-4399-B078-2B0224202ADF}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jb5; P2: Int64); cdecl; overload;
//    procedure a(P1: Jo3); cdecl; overload;
//
//    { Property }
//  end;

//  TJc5 = class(TJavaGenericImport<Jc5Class, Jc5>) end;

//  Jc6Class = interface(JObjectClass)
//  ['{DABC2DA2-58CF-4B48-951C-0ED54576F989}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JObject): Jc6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c6')]
//  Jc6 = interface(JObject)
//  ['{6B6BA28A-B3CA-4060-9024-262A4EEE4A48}']
//    { Property Methods }
//
//    { methods }
//    function a: JObject; cdecl;
//
//    { Property }
//  end;

//  TJc6 = class(TJavaGenericImport<Jc6Class, Jc6>) end;

//  Jc7_aClass = interface(JObjectClass)
//  ['{F0847B3F-D0A1-465B-87C2-F3E7259D3572}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c7$a')]
//  Jc7_a = interface(JObject)
//  ['{0B9C89B4-C92F-4C96-8E55-A3155A0CD990}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJc7_a = class(TJavaGenericImport<Jc7_aClass, Jc7_a>) end;

//  Jc7_bClass = interface(JObjectClass)
//  ['{1FAB65DB-79BF-49F5-BCE3-6AC2F1A4F667}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c7$b')]
//  Jc7_b = interface(JObject)
//  ['{16607019-79E2-4D6B-81A3-57C384980F6A}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function d: Integer; cdecl;
//    function a: TJavaObjectArray<Jc7_a>; cdecl;
//
//    { Property }
//  end;

//  TJc7_b = class(TJavaGenericImport<Jc7_bClass, Jc7_b>) end;

//  Jc7Class = interface(JObjectClass)
//  ['{1311FAD5-666D-4110-B421-345EF09FC483}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: Integer): Jc7; cdecl;
//    {class} function c(P1: Integer): Jc7; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c7')]
//  Jc7 = interface(JObject)
//  ['{D942D948-848F-4E74-A3A4-28C58ACB8802}']
//    { Property Methods }
//
//    { methods }
//    function f: Integer; cdecl;
//    function c: TJavaArray<Integer>; cdecl; overload;
//    function e: Integer; cdecl;
//    function d: Integer; cdecl;
//    function a(P1: Jr2): Jc7_b; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJc7 = class(TJavaGenericImport<Jc7Class, Jc7>) end;

//  Jd_175Class = interface(Jy5Class) // or JObjectClass
//  ['{7F794C7D-8ECC-4A78-B730-83577B6E5396}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d')]
//  Jd_175 = interface(Jy5) // or JObject
//  ['{FAA492AC-F107-4AE3-8D79-6EA2DA275C8E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_175 = class(TJavaGenericImport<Jd_175Class, Jd_175>) end;

//  Jd0Class = interface(JObjectClass)
//  ['{D95FB944-170F-4354-B324-27710EC789A4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd0; cdecl;
//    {class} procedure a(P1: JCamera_Parameters; P2: Boolean); cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d0')]
//  Jd0 = interface(JObject)
//  ['{0094B2C6-E8C7-4950-A030-EA62C93745DA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd0 = class(TJavaGenericImport<Jd0Class, Jd0>) end;

//  Jd1Class = interface(JObjectClass)
//  ['{CD55B28F-83AC-443C-89EC-6D1767C58C56}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d1')]
//  Jd1 = interface(JObject)
//  ['{A9F4AC09-5019-488C-BB38-A857B4A669E3}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJd1 = class(TJavaGenericImport<Jd1Class, Jd1>) end;

//  Jd2_aClass = interface(JArrayListClass) // or JObjectClass
//  ['{988857FB-363A-4EFB-926A-C66FE33837B2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d2$a')]
//  Jd2_a = interface(JArrayList) // or JObject
//  ['{D2EDE51E-32B7-43AB-B1F3-D3CACFBB90F3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd2_a = class(TJavaGenericImport<Jd2_aClass, Jd2_a>) end;

//  Jd2Class = interface(Jx5Class) // or JObjectClass
//  ['{FDEF1481-1B43-4AB0-A058-EFE451525F6C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d2')]
//  Jd2 = interface(Jx5) // or JObject
//  ['{546C30BC-12FE-4D66-BDBF-AD93D2FB3F1B}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//    function a(P1: TJavaObjectArray<JString>; P2: JString): JHmsScan_DriverInfo; cdecl;
//
//    { Property }
//  end;

//  TJd2 = class(TJavaGenericImport<Jd2Class, Jd2>) end;

//  Jd3Class = interface(Jx5Class) // or JObjectClass
//  ['{27C4D444-6CF0-41AF-B4E6-F5F00F11E01F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d3')]
//  Jd3 = interface(Jx5) // or JObject
//  ['{B2BF8F45-993D-46CC-BC44-8F809B3C9D48}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJd3 = class(TJavaGenericImport<Jd3Class, Jd3>) end;

//  Jd4Class = interface(JEnumClass) // or JObjectClass
//  ['{946E9E4E-66F6-4502-9A92-2C6802F359FE}']
//    { static Property Methods }
//    {class} function _Getc: Jd4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jd4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jd4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jd4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jd4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jd4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jd4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jd4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jd4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jd4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jd4>; cdecl;
//    {class} function valueOf(P1: JString): Jd4; cdecl;
//    {class} function a(P1: Integer): Jd4; cdecl; overload;
//
//    { static Property }
//    {class} property c: Jd4 read _Getc;
//    {class} property d: Jd4 read _Getd;
//    {class} property e: Jd4 read _Gete;
//    {class} property f: Jd4 read _Getf;
//    {class} property g: Jd4 read _Getg;
//    {class} property h: Jd4 read _Geth;
//    {class} property i: Jd4 read _Geti;
//    {class} property j: Jd4 read _Getj;
//    {class} property k: Jd4 read _Getk;
//    {class} property l: Jd4 read _Getl;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d4')]
//  Jd4 = interface(JEnum) // or JObject
//  ['{2CA099B9-3556-4B35-926B-559B6BC72877}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jc7): Integer; cdecl; overload;
//    function a: Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJd4 = class(TJavaGenericImport<Jd4Class, Jd4>) end;

//  Jd5Class = interface(JObjectClass)
//  ['{C4A8D922-F5CB-4268-95DD-CB85808928A8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jg5; P2: JRect; P3: Integer; P4: Single; P5: TJavaArray<Integer>): Jd5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d5')]
//  Jd5 = interface(JObject)
//  ['{ADF76DF1-A5DE-4384-ADBE-EBE2654B9DB4}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JCanvas; P2: JRect); cdecl;
//
//    { Property }
//  end;

//  TJd5 = class(TJavaGenericImport<Jd5Class, Jd5>) end;

//  Jd6Class = interface(Jk6Class) // or JObjectClass
//  ['{700A8993-13A5-40BA-93C0-ACD5F102FCCE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d6')]
//  Jd6 = interface(Jk6) // or JObject
//  ['{EF4F4E13-2FAF-4C66-BF3A-DA009C1444D6}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJd6 = class(TJavaGenericImport<Jd6Class, Jd6>) end;

//  Jd7Class = interface(JObjectClass)
//  ['{49EDD4C7-CAFE-4467-AF8D-33D1C6664E7C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: JContext): JPoint; cdecl;
//    {class} function a(P1: JContext): Integer; cdecl; overload;
//    {class} function a(P1: JContext; P2: Integer): Integer; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d7')]
//  Jd7 = interface(JObject)
//  ['{33502480-28AE-463D-AA57-155EB8055634}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd7 = class(TJavaGenericImport<Jd7Class, Jd7>) end;

//  Je_185Class = interface(JObjectClass)
//  ['{D7996E30-5171-499D-94F2-93D21ACDC6AC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e')]
//  Je_185 = interface(JObject)
//  ['{20DD61EE-A1CD-4BF2-943F-E141C6AA212F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_185 = class(TJavaGenericImport<Je_185Class, Je_185>) end;

//  Je0Class = interface(JObjectClass)
//  ['{6A4B09FE-0A16-46E4-8BE0-67BE90FDC1DD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Single): Je0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e0')]
//  Je0 = interface(JObject)
//  ['{8F85A3A1-1F73-4023-AF63-017C2C2A2585}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJe0 = class(TJavaGenericImport<Je0Class, Je0>) end;

//  Je1Class = interface(JObjectClass)
//  ['{BD1B43F4-76CF-4815-B1F6-7645229A1232}']
//    { static Property Methods }
//    {class} function _Geta: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: JSet read _Geta;
//    {class} property b: JSet read _Getb;
//    {class} property c: JSet read _Getc;
//    {class} property d: JSet read _Getd;
//    {class} property e: JSet read _Gete;
//    {class} property f: JSet read _Getf;
//    {class} property g: JSet read _Getg;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e1')]
//  Je1 = interface(JObject)
//  ['{8516491E-6B0F-4E24-95BC-110C9C6340B7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe1 = class(TJavaGenericImport<Je1Class, Je1>) end;

//  Je2Class = interface(Js6Class) // or JObjectClass
//  ['{5D90310A-7BE7-40CF-AA9D-1B8C593C9CED}']
//    { static Property Methods }
//    {class} function _Getj: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Je2; cdecl;
//
//    { static Property }
//    {class} property j: TJavaArray<Integer> read _Getj;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e2')]
//  Je2 = interface(Js6) // or JObject
//  ['{D36FBE45-3B0F-452D-8ED3-F4C1BA221279}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe2 = class(TJavaGenericImport<Je2Class, Je2>) end;

//  Je3_aClass = interface(JSparseArrayClass) // or JObjectClass
//  ['{CE5D3AA8-0AB3-4868-B49E-58F660E62F71}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e3$a')]
//  Je3_a = interface(JSparseArray) // or JObject
//  ['{969E0647-C3E0-48FA-A659-A0E2999CD62D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe3_a = class(TJavaGenericImport<Je3_aClass, Je3_a>) end;

//  Je3_bClass = interface(JSparseArrayClass) // or JObjectClass
//  ['{1B7D71A3-CF91-477A-81A0-482C20102E5A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e3$b')]
//  Je3_b = interface(JSparseArray) // or JObject
//  ['{30C02BF9-5FDB-4371-84A7-96317D607BF8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe3_b = class(TJavaGenericImport<Je3_bClass, Je3_b>) end;

//  Je3Class = interface(JObjectClass)
//  ['{35CEC0CB-BA9A-42A5-820A-68BA0EBACE61}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e3')]
//  Je3 = interface(JObject)
//  ['{A154FCE2-8D6C-441E-8FD8-FD1B22C68621}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe3 = class(TJavaGenericImport<Je3Class, Je3>) end;

//  Je4Class = interface(JObjectClass)
//  ['{5A193566-4E3E-4DE4-AED1-C2C16D3AA8E9}']
//    { static Property Methods }
//    {class} function _Getf: Je4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property f: Je4 read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e4')]
//  Je4 = interface(JObject)
//  ['{E89532BD-23EF-4E1B-8371-2E8014583660}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe4 = class(TJavaGenericImport<Je4Class, Je4>) end;

//  Je5Class = interface(JObjectClass)
//  ['{510DD43B-7058-465E-ACF3-D9DECE03C775}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e5')]
//  Je5 = interface(JObject)
//  ['{FF3A3C58-F717-4BB9-A0FC-D63FFA0BEC74}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jb5); cdecl; overload;
//    procedure a(P1: Jp3); cdecl; overload;
//
//    { Property }
//  end;

//  TJe5 = class(TJavaGenericImport<Je5Class, Je5>) end;

//  Je6Class = interface(JObjectClass)
//  ['{F4DF927D-B5A4-41B1-84F5-28AA57885A38}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e6')]
//  Je6 = interface(JObject)
//  ['{BA9A206F-0BB2-40BE-A11C-141112FA89E8}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJe6 = class(TJavaGenericImport<Je6Class, Je6>) end;

//  Je7Class = interface(JObjectClass)
//  ['{5B765BE0-C198-4838-9C3D-912B3C8B521A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Je7; cdecl; overload;
//    {class} function init(P1: Js; P2: Integer; P3: Integer; P4: Integer): Je7; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e7')]
//  Je7 = interface(JObject)
//  ['{0A4D0E0F-43C4-4EE1-B3A1-833BEC83116A}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaObjectArray<Jy5>; cdecl;
//
//    { Property }
//  end;

//  TJe7 = class(TJavaGenericImport<Je7Class, Je7>) end;

//  Jf_196Class = interface(JObjectClass)
//  ['{EACA07C9-D79D-41E5-A439-F4A6B76CB550}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf_196; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f')]
//  Jf_196 = interface(JObject)
//  ['{5893DD2D-3488-4775-A9B8-738A1B44F85D}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure c(P1: Integer); cdecl;
//    procedure b(P1: Integer); cdecl;
//    procedure a(P1: Integer); cdecl; overload;
//    function a: Js; cdecl; overload;
//    procedure a(P1: Js); cdecl; overload;
//
//    { Property }
//  end;

//  TJf_196 = class(TJavaGenericImport<Jf_196Class, Jf_196>) end;

//  Jf0Class = interface(JObjectClass)
//  ['{9BC40723-6F47-4322-A21E-00C0291DF066}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f0')]
//  Jf0 = interface(JObject)
//  ['{C2EB32D4-4783-4C7E-AA52-82817C2767AD}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JCamera); cdecl; overload;
//    function a: Je0; cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//
//    { Property }
//  end;

//  TJf0 = class(TJavaGenericImport<Jf0Class, Jf0>) end;

//  Jf1Class = interface(JEnumClass) // or JObjectClass
//  ['{17AE4841-9DC0-4F57-9F6E-270798DD36A7}']
//    { static Property Methods }
//    {class} function _Getb: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jf1>; cdecl;
//    {class} function valueOf(P1: JString): Jf1; cdecl;
//
//    { static Property }
//    {class} property b: Jf1 read _Getb;
//    {class} property c: Jf1 read _Getc;
//    {class} property d: Jf1 read _Getd;
//    {class} property e: Jf1 read _Gete;
//    {class} property f: Jf1 read _Getf;
//    {class} property g: Jf1 read _Getg;
//    {class} property h: Jf1 read _Geth;
//    {class} property i: Jf1 read _Geti;
//    {class} property j: Jf1 read _Getj;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f1')]
//  Jf1 = interface(JEnum) // or JObject
//  ['{3008F887-2B45-41D6-AFAE-3DADE0BB3735}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf1 = class(TJavaGenericImport<Jf1Class, Jf1>) end;

//  Jf2Class = interface(Jt6Class) // or JObjectClass
//  ['{78B3EEC7-1AF7-460C-A53E-CC9D56BC9D6D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f2')]
//  Jf2 = interface(Jt6) // or JObject
//  ['{E99F6709-2B0F-4743-BC19-BB325F5E465A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJf2 = class(TJavaGenericImport<Jf2Class, Jf2>) end;

//  Jf3_aClass = interface(JSimpleDateFormatClass) // or JObjectClass
//  ['{4DF12FE4-D634-4DB8-8470-A5FC4D9733D0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f3$a')]
//  Jf3_a = interface(JSimpleDateFormat) // or JObject
//  ['{C3131B7F-4AA7-4A02-8844-CE1255E4728F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf3_a = class(TJavaGenericImport<Jf3_aClass, Jf3_a>) end;

//  Jf3_bClass = interface(JLinkedHashMapClass) // or JObjectClass
//  ['{1D746EBC-6481-4C04-A74F-93476AA93F05}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f3$b')]
//  Jf3_b = interface(JLinkedHashMap) // or JObject
//  ['{4EE1B693-B181-4725-A75C-95D88459D569}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf3_b = class(TJavaGenericImport<Jf3_bClass, Jf3_b>) end;

//  Jf3Class = interface(Je3Class) // or JObjectClass
//  ['{1ABF5B41-313F-40CA-A528-7A8A295AD783}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBundle; P2: JString): Jf3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f3')]
//  Jf3 = interface(Je3) // or JObject
//  ['{3CD3FB9F-33E3-408D-B152-A1F2434B1DE0}']
//    { Property Methods }
//
//    { methods }
//    procedure h; cdecl;
//    procedure i; cdecl;
//    procedure a(P1: Int64); cdecl; overload;
//    procedure a(P1: Int64; P2: Int64; P3: Boolean); cdecl; overload;
//    procedure a(P1: TJavaObjectArray<JHmsScan>); cdecl; overload;
//    procedure c(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJf3 = class(TJavaGenericImport<Jf3Class, Jf3>) end;

//  Jf4Class = interface(JObjectClass)
//  ['{9F4A80DB-29DE-46CC-88FA-2ED75ADC05CD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f4')]
//  Jf4 = interface(JObject)
//  ['{DC0CFB0E-1E2F-4A99-8BC5-C5A86708820F}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJf4 = class(TJavaGenericImport<Jf4Class, Jf4>) end;

//  Jf5Class = interface(JObjectClass)
//  ['{2B1B20F2-FAFB-4E19-AED3-0A2FEBAE4946}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single): Jf5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f5')]
//  Jf5 = interface(JObject)
//  ['{7B6A8D6A-9B38-4FEE-B299-BE08D7B7734A}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jb5); cdecl;
//
//    { Property }
//  end;

//  TJf5 = class(TJavaGenericImport<Jf5Class, Jf5>) end;

//  Jf6Class = interface(JObjectClass)
//  ['{212C9DBC-A674-42AC-AE6C-67D0465A11CC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: JMap): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Boolean; P3: Boolean; P4: Boolean; P5: Integer; P6: Integer; P7: Boolean; P8: Integer; P9: Integer; P10: Integer; P11: Integer; P12: Integer; P13: Integer; P14: Integer; P15: Integer): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): JBoolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f6')]
//  Jf6 = interface(JObject)
//  ['{F1EEF7E7-50A7-47B4-84E9-87B8DB333A5B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf6 = class(TJavaGenericImport<Jf6Class, Jf6>) end;

//  Jf7Class = interface(Jx5Class) // or JObjectClass
//  ['{8F706658-7C95-43E8-A50E-7333BA0993D0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f7')]
//  Jf7 = interface(Jx5) // or JObject
//  ['{8CA46C83-A5CD-44AE-918E-6E050DBD154B}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJf7 = class(TJavaGenericImport<Jf7Class, Jf7>) end;

//  Jg_207Class = interface(Jz1Class) // or JObjectClass
//  ['{711DC4BA-FF0F-40E9-8676-DB4780700D30}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js; P2: TJavaObjectArray<Jy5>; P3: Boolean; P4: Integer; P5: Integer): Jg_207; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g')]
//  Jg_207 = interface(Jz1) // or JObject
//  ['{FB47AB69-5521-4D5E-9100-37003E2ADFC6}']
//    { Property Methods }
//
//    { methods }
//    function f: Integer; cdecl;
//    function e: Integer; cdecl;
//    function g: Boolean; cdecl;
//
//    { Property }
//  end;

//  TJg_207 = class(TJavaGenericImport<Jg_207Class, Jg_207>) end;

//  Jg0_aClass = interface(JObjectClass)
//  ['{DB452D07-9B1C-4B53-9223-B2688902E0C0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g0$a')]
//  Jg0_a = interface(JObject)
//  ['{A7E481CD-D4B1-4A06-8F70-7D023930F48C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg0_a = class(TJavaGenericImport<Jg0_aClass, Jg0_a>) end;

//  Jg0_bClass = interface(JObjectClass)
//  ['{6283E9E2-8DE9-4346-AE0E-659680B82F9E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g0$b')]
//  Jg0_b = interface(IJavaInstance)
//  ['{F21959AE-5821-4DB2-8FA1-A86E313E4752}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JPoint); cdecl;
//
//    { Property }
//  end;

//  TJg0_b = class(TJavaGenericImport<Jg0_bClass, Jg0_b>) end;

//  Jg0_cClass = interface(JEnumClass) // or JObjectClass
//  ['{A82F21A0-B79E-426E-908C-3CFEA45A1363}']
//    { static Property Methods }
//    {class} function _Getb: Jg0_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jg0_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jg0_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jg0_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jg0_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jg0_c>; cdecl;
//    {class} function valueOf(P1: JString): Jg0_c; cdecl;
//
//    { static Property }
//    {class} property b: Jg0_c read _Getb;
//    {class} property c: Jg0_c read _Getc;
//    {class} property d: Jg0_c read _Getd;
//    {class} property e: Jg0_c read _Gete;
//    {class} property f: Jg0_c read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g0$c')]
//  Jg0_c = interface(JEnum) // or JObject
//  ['{42E21D1D-96F7-47D8-984F-00218BE9867B}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJg0_c = class(TJavaGenericImport<Jg0_cClass, Jg0_c>) end;

//  Jg0_dClass = interface(JObjectClass)
//  ['{6D29A2B2-FB00-4FF8-8CC1-76D4EC8BC16D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g0$d')]
//  Jg0_d = interface(IJavaInstance)
//  ['{14DBD24A-43C2-4C48-B01E-0B1EA6124F8A}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl;
//    procedure c; cdecl;
//    procedure b; cdecl;
//
//    { Property }
//  end;

//  TJg0_d = class(TJavaGenericImport<Jg0_dClass, Jg0_d>) end;

//  Jg0_eClass = interface(JObjectClass)
//  ['{559D9DED-C792-47F1-BBA1-3287FA4FA981}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g0$e')]
//  Jg0_e = interface(IJavaInstance)
//  ['{8BE32B02-0FBC-4161-9E84-25E58012ADAF}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Byte>); cdecl;
//
//    { Property }
//  end;

//  TJg0_e = class(TJavaGenericImport<Jg0_eClass, Jg0_e>) end;

//  Jg0_fClass = interface(JObjectClass)
//  ['{19854082-D8CA-4091-A74B-9CD8AC69FEB1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g0$f')]
//  Jg0_f = interface(JObject)
//  ['{8F29B39B-DBD5-4F21-813C-D68B5C5493B3}']
//    { Property Methods }
//
//    { methods }
//    procedure onPreviewFrame(P1: TJavaArray<Byte>; P2: JCamera); cdecl;
//
//    { Property }
//  end;

//  TJg0_f = class(TJavaGenericImport<Jg0_fClass, Jg0_f>) end;

//  Jg0Class = interface(JObjectClass)
//  ['{7EADB104-0C98-4C94-A4A0-3CC1316E3837}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Jc0): Jg0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g0')]
//  Jg0 = interface(JObject)
//  ['{ACEC1B73-7DF3-42C6-AD8F-DBB05AF1FB16}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jg0_e); cdecl; overload;
//    procedure a(P1: Jg0_d); cdecl; overload;
//    procedure a(P1: JTextureView); cdecl; overload;
//    procedure m; cdecl;
//    procedure l; cdecl;
//    procedure k; cdecl;
//    procedure a(P1: JString); cdecl; overload;
//    function h: JString; cdecl;
//    procedure p; cdecl;
//    procedure q; cdecl;
//    procedure o; cdecl;
//    procedure a; cdecl; overload;
//    function e: JPoint; cdecl;
//    procedure n; cdecl;
//    function j: Boolean; cdecl;
//    function f: Jg0_c; cdecl;
//    function b: Je0; cdecl; overload;
//    procedure c(P1: Integer); cdecl; overload;
//    function g: Jj0; cdecl;
//    procedure d(P1: Integer); cdecl; overload;
//    function c: Jh0; cdecl; overload;
//    procedure a(P1: JList); cdecl; overload;
//    function d: Integer; cdecl; overload;
//    procedure b(P1: Integer); cdecl; overload;
//    function i: Boolean; cdecl;
//
//    { Property }
//  end;

//  TJg0 = class(TJavaGenericImport<Jg0Class, Jg0>) end;

//  Jg1Class = interface(JObjectClass)
//  ['{BDA02CFB-1485-4911-87EC-02100DA76152}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: JBitmap; P2: Jb6): TJavaObjectArray<Jw5>; cdecl; overload;
//    {class} function c(P1: TJavaArray<Byte>; P2: Jb6): TJavaObjectArray<Jw5>; cdecl;
//    {class} function b(P1: Jy3; P2: Jb6): TJavaObjectArray<Jw5>; cdecl; overload;
//    {class} function a(P1: JList; P2: Jh1): Jw5; cdecl; overload;
//    {class} function b(P1: JList; P2: Jh1; P3: JList): Jw5; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: Jb6): TJavaObjectArray<Jw5>; cdecl; overload;
//    {class} function a(P1: JByteBuffer; P2: Jb6): TJavaObjectArray<Jw5>; cdecl; overload;
//    {class} function b(P1: TJavaArray<Byte>; P2: Jb6): TJavaObjectArray<Jw5>; cdecl; overload;
//    {class} function a(P1: Jy3; P2: Jb6): TJavaObjectArray<Jw5>; cdecl; overload;
//    {class} function a(P1: JList; P2: Jh1; P3: JList): JList; cdecl; overload;
//    {class} procedure a(P1: Boolean); cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Jb6; P3: Boolean): TJavaObjectArray<Jw5>; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g1')]
//  Jg1 = interface(JObject)
//  ['{041DB1BB-1718-4B45-878C-F8F1595E2700}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg1 = class(TJavaGenericImport<Jg1Class, Jg1>) end;

//  Jg2Class = interface(Js6Class) // or JObjectClass
//  ['{910B0656-8634-43A9-959C-7D55F2F645D4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g2')]
//  Jg2 = interface(Js6) // or JObject
//  ['{E7CD88EA-CD9F-48C3-AD12-30EEF9B49FBF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Jr): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJg2 = class(TJavaGenericImport<Jg2Class, Jg2>) end;

//  Jg3_aClass = interface(JSimpleDateFormatClass) // or JObjectClass
//  ['{53A590D3-3EE7-4DB3-9380-6E5BB1703C6A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3$a')]
//  Jg3_a = interface(JSimpleDateFormat) // or JObject
//  ['{B3AEBC8D-A7EA-4A7E-9279-96DAFF685F58}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg3_a = class(TJavaGenericImport<Jg3_aClass, Jg3_a>) end;

//  Jg3_bClass = interface(JSimpleDateFormatClass) // or JObjectClass
//  ['{C82245BC-7417-4983-9D08-CA90656FDF6F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3$b')]
//  Jg3_b = interface(JSimpleDateFormat) // or JObject
//  ['{A6544AAC-3947-4829-912A-052817AEE4A8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg3_b = class(TJavaGenericImport<Jg3_bClass, Jg3_b>) end;

//  Jg3_cClass = interface(JObjectClass)
//  ['{0A670F1D-EB88-4521-8932-C7D4E7BF5DCA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3$c')]
//  Jg3_c = interface(JObject)
//  ['{CEAA8BAB-C8D0-4E3D-80BD-B950138DB777}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer): Jg3_c; cdecl;
//
//    { Property }
//  end;

//  TJg3_c = class(TJavaGenericImport<Jg3_cClass, Jg3_c>) end;

//  Jg3_d_aClass = interface(JTimerTaskClass) // or JObjectClass
//  ['{B872A072-F7B9-41EE-A232-18ED694B6FC1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3$d$a')]
//  Jg3_d_a = interface(JTimerTask) // or JObject
//  ['{C407AD30-60F6-4E72-97A5-974E9BA12556}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg3_d_a = class(TJavaGenericImport<Jg3_d_aClass, Jg3_d_a>) end;

//  Jg3_d_bClass = interface(JObjectClass)
//  ['{A2592CF1-E42C-4683-8B2A-9068C74BEB3F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3$d$b')]
//  Jg3_d_b = interface(JObject)
//  ['{9AA942FA-E2F6-486C-B448-B54565BDE55B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg3_d_b = class(TJavaGenericImport<Jg3_d_bClass, Jg3_d_b>) end;

//  Jg3_d_c_aClass = interface(JSparseArrayClass) // or JObjectClass
//  ['{F43DA0A5-ED18-437C-8C8F-06B08F430DB5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3$d$c$a')]
//  Jg3_d_c_a = interface(JSparseArray) // or JObject
//  ['{75FA4305-6DB8-4BC7-A1B0-C10A8B9287E1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg3_d_c_a = class(TJavaGenericImport<Jg3_d_c_aClass, Jg3_d_c_a>) end;

//  Jg3_d_c_bClass = interface(JAtomicIntegerClass) // or JObjectClass
//  ['{1EDE4D80-B448-4039-A7BD-E0D83F0B4AE6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3$d$c$b')]
//  Jg3_d_c_b = interface(JAtomicInteger) // or JObject
//  ['{AB1C6580-EEC9-4E7D-8748-9EBE09C1C5EE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg3_d_c_b = class(TJavaGenericImport<Jg3_d_c_bClass, Jg3_d_c_b>) end;

//  Jg3_d_cClass = interface(JObjectClass)
//  ['{479B0236-971B-4D9C-9244-514FD0065DBC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3$d$c')]
//  Jg3_d_c = interface(JObject)
//  ['{65915CFE-B85F-4F02-8B8D-81D8D1674F36}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg3_d_c = class(TJavaGenericImport<Jg3_d_cClass, Jg3_d_c>) end;

//  Jg3_dClass = interface(JObjectClass)
//  ['{CBA23737-4552-47AB-9D23-4352525CC59A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jg3): Jg3_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3$d')]
//  Jg3_d = interface(JObject)
//  ['{A223926B-54E5-44F4-9180-77C0F2076DF7}']
//    { Property Methods }
//    function _Getb: JTimer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: JTimer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure b; cdecl;
//
//    { Property }
//    property b: JTimer read _Getb write _Setb;
//  end;

//  TJg3_d = class(TJavaGenericImport<Jg3_dClass, Jg3_d>) end;

//  Jg3Class = interface(Je3Class) // or JObjectClass
//  ['{599125B7-3677-4360-A096-4D8C126AA298}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBundle; P2: JString): Jg3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3')]
//  Jg3 = interface(Je3) // or JObject
//  ['{49E30D26-3BFB-4397-B5D1-84CA9E60872C}']
//    { Property Methods }
//    function _Getl: Jg3_d;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Jg3_d);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload;
//    function a(P1: Boolean; P2: Integer): Jg3_c; cdecl; overload;
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: Jg3_c); cdecl; overload;
//
//    { Property }
//    property l: Jg3_d read _Getl write _Setl;
//  end;

//  TJg3 = class(TJavaGenericImport<Jg3Class, Jg3>) end;

//  Jg4Class = interface(JObjectClass)
//  ['{3EE41D66-A2E4-441A-B5E0-1D3701408EA1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure c(P1: JContext; P2: JString); cdecl; overload;
//    {class} function c: TJavaArray<Byte>; cdecl; overload;
//    {class} function a: TJavaArray<Byte>; cdecl; overload;
//    {class} function b: TJavaArray<Byte>; cdecl; overload;
//    {class} procedure a(P1: JContext; P2: JString); cdecl; overload;
//    {class} procedure b(P1: JContext; P2: JString); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g4')]
//  Jg4 = interface(JObject)
//  ['{CE4D77F4-409D-487C-9C36-850DB105CE3F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg4 = class(TJavaGenericImport<Jg4Class, Jg4>) end;

//  Jg5Class = interface(JObjectClass)
//  ['{B8C72045-4544-41E6-8C7E-A6DDB20121E0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Int64): Jg5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g5')]
//  Jg5 = interface(JObject)
//  ['{9CFF64B3-16AA-447D-BBC5-888F744DB134}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Single; P2: Single): Jg5; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Int64; P4: Int64; P5: JInterpolator): Jg5; cdecl; overload;
//    procedure a(P1: JRect; P2: Integer); cdecl; overload;
//    procedure b(P1: Int64); cdecl; overload;
//    function c: JList; cdecl;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJg5 = class(TJavaGenericImport<Jg5Class, Jg5>) end;

//  Jg6Class = interface(JObjectClass)
//  ['{1001E33E-FF5E-4A0A-B8CC-861E0496E308}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Boolean; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Jg6; cdecl;
//    {class} function a(P1: Integer; P2: Jh6; P3: Jb2; P4: Jb2; P5: Boolean): Jg6; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g6')]
//  Jg6 = interface(JObject)
//  ['{6CDFDECE-AEAB-4C1D-9A56-54F8A56E84AA}']
//    { Property Methods }
//    function _Getd: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setd(ad: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gete: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sete(ae: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function f: Integer; cdecl;
//    function e: Integer; cdecl;
//    function h: Integer; cdecl;
//    function g: Integer; cdecl;
//    function d: Integer; cdecl;
//    function a: Integer; cdecl; overload;
//    function b: Integer; cdecl; overload;
//    function a(P1: Integer): Integer; cdecl; overload;
//    function b(P1: Integer): Integer; cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//    property d: Integer read _Getd write _Setd;
//    property e: Integer read _Gete write _Sete;
//  end;

//  TJg6 = class(TJavaGenericImport<Jg6Class, Jg6>) end;

//  Jg7Class = interface(JObjectClass)
//  ['{511FEEED-1792-44AC-8E3D-6B5170598840}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g7')]
//  Jg7 = interface(IJavaInstance)
//  ['{64EFECF7-23D7-43EC-B50B-1ED95F2B72B7}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJg7 = class(TJavaGenericImport<Jg7Class, Jg7>) end;

//  Jh_231Class = interface(JObjectClass)
//  ['{1682C013-ED29-4832-B31F-A7C499BBCB2E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_231; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h')]
//  Jh_231 = interface(JObject)
//  ['{40CD94FC-633C-40A7-A4FF-CA8349DE24F5}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Jw5; cdecl;
//
//    { Property }
//  end;

//  TJh_231 = class(TJavaGenericImport<Jh_231Class, Jh_231>) end;

//  Jh0_aClass = interface(JObjectClass)
//  ['{F5F00054-DDB5-4258-B23D-9B9F463FA770}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JRect; P2: Integer): Jh0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h0$a')]
//  Jh0_a = interface(JObject)
//  ['{6B5E6611-3374-4F11-A1E9-A8665DEFFD31}']
//    { Property Methods }
//    function _Geta: JRect;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JRect);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//
//    { Property }
//    property a: JRect read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//  end;

//  TJh0_a = class(TJavaGenericImport<Jh0_aClass, Jh0_a>) end;

//  Jh0Class = interface(JObjectClass)
//  ['{00173F05-910B-44A2-AF57-38CA12E8BFBB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: JRect): Jh0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h0')]
//  Jh0 = interface(JObject)
//  ['{160D7B57-788A-41EB-B636-DBC1C8E88829}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//    function b: JRect; cdecl;
//
//    { Property }
//  end;

//  TJh0 = class(TJavaGenericImport<Jh0Class, Jh0>) end;

//  Jh1Class = interface(JObjectClass)
//  ['{EA2344C1-D074-4F75-8B1D-1D64DBC55378}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Js; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h1')]
//  Jh1 = interface(JObject)
//  ['{DAD33FE8-9116-46A5-9A5E-AAF6E192557C}']
//    { Property Methods }
//    function _Geti: Jv3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jv3);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Jp; cdecl; overload;
//    function d(P1: JList; P2: Jy1): Jw5; cdecl; overload;
//    function a(P1: JMap; P2: Jy1): Jw5; cdecl; overload;
//    function a(P1: JMap): Jw5; cdecl; overload;
//    function f(P1: JList; P2: Jy1): Jw5; cdecl;
//    function e(P1: JList; P2: Jy1): Jw5; cdecl; overload;
//    function a(P1: JList; P2: Jy1): Jw5; cdecl; overload;
//    function c(P1: JList; P2: Jy1): Jw5; cdecl; overload;
//    function b(P1: JList; P2: Jy1): Jw5; cdecl; overload;
//    function a(P1: Integer; P2: Boolean): JList; cdecl; overload;
//    procedure a(P1: Jy1); cdecl; overload;
//    function c(P1: Jp): Single; cdecl; overload;
//    function c: Single; cdecl; overload;
//    function d: Single; cdecl; overload;
//    function e: Single; cdecl; overload;
//    function b: Boolean; cdecl; overload;
//    function b(P1: JList): Boolean; cdecl; overload;
//
//    { Property }
//    property i: Jv3 read _Geti write _Seti;
//  end;

//  TJh1 = class(TJavaGenericImport<Jh1Class, Jh1>) end;

//  Jh2Class = interface(Jt6Class) // or JObjectClass
//  ['{266D4F7E-BADC-4E50-826A-F7B4C8C868ED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h2')]
//  Jh2 = interface(Jt6) // or JObject
//  ['{0CBA4277-4D05-4942-9BD3-43D660432796}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJh2 = class(TJavaGenericImport<Jh2Class, Jh2>) end;

//  Jh3_aClass = interface(JLinkedHashMapClass) // or JObjectClass
//  ['{044341D5-7EBA-4D06-9F10-65336A5CABC1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h3$a')]
//  Jh3_a = interface(JLinkedHashMap) // or JObject
//  ['{D15B09E8-5B86-4C7B-86C9-D22EADAAC323}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh3_a = class(TJavaGenericImport<Jh3_aClass, Jh3_a>) end;

//  Jh3Class = interface(Je3Class) // or JObjectClass
//  ['{59B73B50-5F84-4682-822F-3EE2125D4D28}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h3')]
//  Jh3 = interface(Je3) // or JObject
//  ['{64601C2A-1987-480D-A3EB-C6F5BA4523C5}']
//    { Property Methods }
//
//    { methods }
//    procedure c(P1: JBundle); cdecl;
//
//    { Property }
//  end;

//  TJh3 = class(TJavaGenericImport<Jh3Class, Jh3>) end;

//  Jh4Class = interface(Jo4Class) // or JObjectClass
//  ['{F41C50FC-4590-4610-B840-37A20FE60C24}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JMap): Jh4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h4')]
//  Jh4 = interface(Jo4) // or JObject
//  ['{7FA1C77D-29E8-4B3D-B974-2D4ED4AA3134}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Jw5; cdecl;
//
//    { Property }
//  end;

//  TJh4 = class(TJavaGenericImport<Jh4Class, Jh4>) end;

//  Jh5Class = interface(JObjectClass)
//  ['{CA97112B-9ED4-46F0-B4FB-918513D1206A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jy1; P2: Integer): Jh5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h5')]
//  Jh5 = interface(JObject)
//  ['{5D4DC239-0F8E-4A05-B681-FD578DDB3B79}']
//    { Property Methods }
//    function _Geta: Jy1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jy1);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Jh5): Integer; cdecl;
//    function compareTo(P1: JObject): Integer; cdecl;
//
//    { Property }
//    property a: Jy1 read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//  end;

//  TJh5 = class(TJavaGenericImport<Jh5Class, Jh5>) end;

//  Jh6Class = interface(JEnumClass) // or JObjectClass
//  ['{C06EF167-3DBC-451B-BD21-5B1D3B3F9D1B}']
//    { static Property Methods }
//    {class} function _Geta: Jh6;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jh6;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jh6;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jh6>; cdecl;
//    {class} function valueOf(P1: JString): Jh6; cdecl;
//
//    { static Property }
//    {class} property a: Jh6 read _Geta;
//    {class} property b: Jh6 read _Getb;
//    {class} property c: Jh6 read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h6')]
//  Jh6 = interface(JEnum) // or JObject
//  ['{B52F77BE-0A01-46DB-BC7A-C09C851BDE76}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh6 = class(TJavaGenericImport<Jh6Class, Jh6>) end;

//  Jh7Class = interface(Jb0Class) // or JObjectClass
//  ['{AC0FAFCA-364D-451B-AC3A-73F9D44F0F22}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h7')]
//  Jh7 = interface(Jb0) // or JObject
//  ['{A3CA2956-4E9F-4A7C-B710-F4CAF34C1B15}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jo2); cdecl; overload;
//
//    { Property }
//  end;

//  TJh7 = class(TJavaGenericImport<Jh7Class, Jh7>) end;

//  Ji_242Class = interface(JObjectClass)
//  ['{E0AF966C-6A26-4144-BC72-FF8EAD9FF14E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji_242; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i')]
//  Ji_242 = interface(JObject)
//  ['{D9226B26-723C-4649-9760-E168DBB8CE2D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJi_242 = class(TJavaGenericImport<Ji_242Class, Ji_242>) end;

//  Ji0Class = interface(JObjectClass)
//  ['{ED28DAA3-6907-4954-B663-3A0C26CE8099}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i0')]
//  Ji0 = interface(JObject)
//  ['{5C509933-E2E1-4694-AE1A-63F4EFE52F36}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JCamera); cdecl; overload;
//    function a: Jh0; cdecl; overload;
//    procedure a(P1: JList); cdecl; overload;
//
//    { Property }
//  end;

//  TJi0 = class(TJavaGenericImport<Ji0Class, Ji0>) end;

//  Ji1_aClass = interface(JObjectClass)
//  ['{2C4BE994-B7AD-4EAE-A45E-993B67167E43}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i1$a')]
//  Ji1_a = interface(JObject)
//  ['{05DD2384-2135-4BAD-9E07-2FFE72D34BF2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi1_a = class(TJavaGenericImport<Ji1_aClass, Ji1_a>) end;

//  Ji1_bClass = interface(JEnumClass) // or JObjectClass
//  ['{27771C8B-935D-41F1-8057-3ED2E05679B2}']
//    { static Property Methods }
//    {class} function _Geta: Ji1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ji1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ji1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Ji1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Ji1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Ji1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Ji1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Ji1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ji1_b>; cdecl;
//    {class} function valueOf(P1: JString): Ji1_b; cdecl;
//
//    { static Property }
//    {class} property a: Ji1_b read _Geta;
//    {class} property b: Ji1_b read _Getb;
//    {class} property c: Ji1_b read _Getc;
//    {class} property d: Ji1_b read _Getd;
//    {class} property e: Ji1_b read _Gete;
//    {class} property f: Ji1_b read _Getf;
//    {class} property g: Ji1_b read _Getg;
//    {class} property h: Ji1_b read _Geth;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i1$b')]
//  Ji1_b = interface(JEnum) // or JObject
//  ['{677C488C-58E3-4352-AB07-096DC7475695}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi1_b = class(TJavaGenericImport<Ji1_bClass, Ji1_b>) end;

//  Ji1Class = interface(JObjectClass)
//  ['{286AE7A3-7384-414C-9303-0C8B91DB2797}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i1')]
//  Ji1 = interface(JObject)
//  ['{B60617AE-0DAF-422A-9C0C-FC3387C4CE29}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi1 = class(TJavaGenericImport<Ji1Class, Ji1>) end;

//  Ji2Class = interface(JObjectClass)
//  ['{4F8CC0A1-5BCC-4C8F-8B36-86A9E9E46E50}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i2')]
//  Ji2 = interface(JObject)
//  ['{1D8A6FDD-F68F-458E-A862-E8C6C0C297D7}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jo2); cdecl; overload;
//
//    { Property }
//  end;

//  TJi2 = class(TJavaGenericImport<Ji2Class, Ji2>) end;

//  Ji3Class = interface(JObjectClass)
//  ['{F2D366DB-912E-4BFF-9B7F-C97A9045850F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext): JBundle; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i3')]
//  Ji3 = interface(JObject)
//  ['{9909504A-1710-4416-BA53-9E5FE2C6D1B1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi3 = class(TJavaGenericImport<Ji3Class, Ji3>) end;

//  Ji4Class = interface(JObjectClass)
//  ['{BC3B43FE-3107-4615-88BC-18066C9DB196}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji4; cdecl;
//    {class} function a(P1: Jw5; P2: Single; P3: Single): Boolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i4')]
//  Ji4 = interface(JObject)
//  ['{3F293396-DDBF-4952-AB42-A39F73B11070}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Jw5; cdecl; overload;
//    function a(P1: JMap): TJavaObjectArray<Js5>; cdecl; overload;
//    function a(P1: Jp; P2: Jp; P3: JMap; P4: Jv3; P5: Jy1): Jw5; cdecl; overload;
//    function a(P1: Jp; P2: Jp; P3: Jp; P4: JMap; P5: Jv3; P6: Jy1): Jw5; cdecl; overload;
//    function a(P1: Jp; P2: Jv3; P3: JMap; P4: Jy1): Jw5; cdecl; overload;
//    function a(P1: Jp; P2: Jp; P3: Jv3; P4: JMap): Jw5; cdecl; overload;
//
//    { Property }
//  end;

//  TJi4 = class(TJavaGenericImport<Ji4Class, Ji4>) end;

//  Ji5Class = interface(JObjectClass)
//  ['{D23182EC-DB2C-4786-AFD1-FCD6035C4B58}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single): Ji5; cdecl;
//    {class} function a(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single): Ji5; cdecl; overload;
//    {class} function b(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single): Ji5; cdecl; overload;
//    {class} function a(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single): Ji5; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i5')]
//  Ji5 = interface(JObject)
//  ['{E38A6597-ED4D-4C33-A40C-B48C5A13AA38}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single); cdecl; overload;
//    procedure a(P1: TJavaArray<Single>); cdecl; overload;
//    procedure b(P1: TJavaArray<Single>); cdecl; overload;
//
//    { Property }
//  end;

//  TJi5 = class(TJavaGenericImport<Ji5Class, Ji5>) end;

//  Ji6Class = interface(Jx5Class) // or JObjectClass
//  ['{400B070E-54EE-4F21-9BA0-361F3306FEA7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i6')]
//  Ji6 = interface(Jx5) // or JObject
//  ['{2AD689FB-A3E3-428A-9D7B-594DFA05FB11}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJi6 = class(TJavaGenericImport<Ji6Class, Ji6>) end;

//  Ji7Class = interface(JObjectClass)
//  ['{DBBD7AA2-33EF-439E-B85D-451A5D524391}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Integer; P3: TJavaObjectArray<Jy5>): Single; cdecl;
//    {class} function b(P1: Integer; P2: Integer; P3: TJavaObjectArray<Jy5>): Single; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i7')]
//  Ji7 = interface(JObject)
//  ['{5C61389A-FCDB-42A1-B216-1817A67A316E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi7 = class(TJavaGenericImport<Ji7Class, Ji7>) end;

//  Jj_253Class = interface(JObjectClass)
//  ['{70CFCAC0-ACF7-4309-A8BA-7EE4AC255445}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j')]
//  Jj_253 = interface(JObject)
//  ['{125C0083-664E-4718-BFF5-C8A9D36E81B1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer): TJavaArray<TJavaArray<Byte>>; cdecl;
//
//    { Property }
//  end;

//  TJj_253 = class(TJavaGenericImport<Jj_253Class, Jj_253>) end;

//  Jj0Class = interface(JObjectClass)
//  ['{4761CD2F-BD3D-4D1F-B1CD-1BA2A84D8A81}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: JList): Jj0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j0')]
//  Jj0 = interface(JObject)
//  ['{4DFD27CB-ABD9-432E-993D-E1492D37D789}']
//    { Property Methods }
//
//    { methods }
//    function c: Integer; cdecl;
//    function b: Integer; cdecl;
//    function a: JList; cdecl;
//
//    { Property }
//  end;

//  TJj0 = class(TJavaGenericImport<Jj0Class, Jj0>) end;

//  Jj1_aClass = interface(JObjectClass)
//  ['{F083FADE-A31C-4023-9D6F-6A7479AEEBDE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j1$a')]
//  Jj1_a = interface(JObject)
//  ['{CA950822-EE6C-4256-B9CC-4800391F63BE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj1_a = class(TJavaGenericImport<Jj1_aClass, Jj1_a>) end;

//  Jj1_bClass = interface(JEnumClass) // or JObjectClass
//  ['{6BA0AEF5-949C-4414-A99E-5E1F144C0EBB}']
//    { static Property Methods }
//    {class} function _Geta: Jj1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jj1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jj1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jj1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jj1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jj1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jj1_b>; cdecl;
//    {class} function valueOf(P1: JString): Jj1_b; cdecl;
//
//    { static Property }
//    {class} property a: Jj1_b read _Geta;
//    {class} property b: Jj1_b read _Getb;
//    {class} property c: Jj1_b read _Getc;
//    {class} property d: Jj1_b read _Getd;
//    {class} property e: Jj1_b read _Gete;
//    {class} property f: Jj1_b read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j1$b')]
//  Jj1_b = interface(JEnum) // or JObject
//  ['{C6C102F6-1D9E-4749-B15C-CA4ED1B6E6F9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj1_b = class(TJavaGenericImport<Jj1_bClass, Jj1_b>) end;

//  Jj1Class = interface(JObjectClass)
//  ['{24375477-82EF-4F9D-BBF7-B2493B55D6BE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j1')]
//  Jj1 = interface(JObject)
//  ['{B7FBDD21-36F2-4690-B129-B5A395E7C8E7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj1 = class(TJavaGenericImport<Jj1Class, Jj1>) end;

//  Jj2Class = interface(Jx5Class) // or JObjectClass
//  ['{D75AE08B-7059-4778-B98C-784C705B0280}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j2')]
//  Jj2 = interface(Jx5) // or JObject
//  ['{FB75E0A9-8B8C-4DE9-BF7B-8EB6F5DD1CB3}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJj2 = class(TJavaGenericImport<Jj2Class, Jj2>) end;

//  Jj3_aClass = interface(JThreadClass) // or JObjectClass
//  ['{CEF4074A-93F3-4776-A914-7BBC4AFD3039}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j3$a')]
//  Jj3_a = interface(JThread) // or JObject
//  ['{96E03496-6A18-41D9-ABE1-CF02486B9093}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJj3_a = class(TJavaGenericImport<Jj3_aClass, Jj3_a>) end;

//  Jj3_bClass = interface(JObjectClass)
//  ['{41C38C9F-FE79-4D0C-AB80-4CE2B103A010}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j3$b')]
//  Jj3_b = interface(JObject)
//  ['{88384429-5828-48D4-A820-692892DD5597}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj3_b = class(TJavaGenericImport<Jj3_bClass, Jj3_b>) end;

//  Jj3_cClass = interface(JTimerTaskClass) // or JObjectClass
//  ['{690ED4C8-0122-4B9A-9C91-9348DD283FC0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j3$c')]
//  Jj3_c = interface(JTimerTask) // or JObject
//  ['{96447707-92A0-48E9-95A2-DA0A8EF780FB}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJj3_c = class(TJavaGenericImport<Jj3_cClass, Jj3_c>) end;

//  Jj3Class = interface(JObjectClass)
//  ['{F3336251-9209-4836-B172-01EC26AFA685}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b: Jj3; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j3')]
//  Jj3 = interface(JObject)
//  ['{41F59F89-01CE-4411-B3AD-3F1984B9DCF7}']
//    { Property Methods }
//
//    { methods }
//    procedure b(P1: JString; P2: JLinkedHashMap); cdecl; overload;
//
//    { Property }
//  end;

//  TJj3 = class(TJavaGenericImport<Jj3Class, Jj3>) end;

//  Jj4Class = interface(Jo4Class) // or JObjectClass
//  ['{D9931FF9-7127-4CCB-9AD8-060D6A19C4A1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JMap): Jj4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j4')]
//  Jj4 = interface(Jo4) // or JObject
//  ['{6BA21DE3-7F44-4E35-A4DC-6A663B7BC573}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Jw5; cdecl;
//
//    { Property }
//  end;

//  TJj4 = class(TJavaGenericImport<Jj4Class, Jj4>) end;

//  Jj5Class = interface(Jy3Class) // or JObjectClass
//  ['{36CE2618-7287-4F13-BB1F-FF68FD32931C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Boolean): Jj5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j5')]
//  Jj5 = interface(Jy3) // or JObject
//  ['{75FD42CC-0885-4D0D-8144-F6ED03D4A34B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    function b: TJavaArray<Byte>; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jy3; cdecl; overload;
//    function b(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jy3; cdecl; overload;
//
//    { Property }
//  end;

//  TJj5 = class(TJavaGenericImport<Jj5Class, Jj5>) end;

//  Jj6Class = interface(Jb0Class) // or JObjectClass
//  ['{C1431538-A62E-4313-9164-6EF0884629D0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j6')]
//  Jj6 = interface(Jb0) // or JObject
//  ['{C8BCA38A-6551-4369-B8F1-953276EFFC19}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJj6 = class(TJavaGenericImport<Jj6Class, Jj6>) end;

//  JkClass = interface(JObjectClass)
//  ['{BA4C1929-2C74-41BF-B35A-D45EE3F29553}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k')]
//  Jk = interface(JObject)
//  ['{7F25EB1C-04DB-4AC7-87AE-EBED8DB2673F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk = class(TJavaGenericImport<JkClass, Jk>) end;

//  Jk0Class = interface(JObjectClass)
//  ['{BA0E2788-F7A4-4DB8-8D30-F026705020B9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k0')]
//  Jk0 = interface(JObject)
//  ['{D31913F2-FB26-42B7-8FE1-3AFD51E9DEA6}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JCamera); cdecl; overload;
//    function a: Jj0; cdecl; overload;
//    function b: Boolean; cdecl;
//    procedure a(P1: Integer); cdecl; overload;
//
//    { Property }
//  end;

//  TJk0 = class(TJavaGenericImport<Jk0Class, Jk0>) end;

//  Jk1_aClass = interface(JObjectClass)
//  ['{4165CCB4-DA3A-4345-A985-B4F899824F59}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k1$a')]
//  Jk1_a = interface(JObject)
//  ['{3AF39BE8-A171-48BD-8A99-DB06AD7D1397}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk1_a = class(TJavaGenericImport<Jk1_aClass, Jk1_a>) end;

//  Jk1Class = interface(JObjectClass)
//  ['{9837D6A4-FA38-4C12-BAA6-3B2B13BEFCF4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k1')]
//  Jk1 = interface(JObject)
//  ['{C63E2B96-4337-4810-842C-5EE072F31EEF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk1 = class(TJavaGenericImport<Jk1Class, Jk1>) end;

//  Jk2Class = interface(JEnumClass) // or JObjectClass
//  ['{C1D8FF92-824C-4BE7-8F43-137B1B72F22C}']
//    { static Property Methods }
//    {class} function _Geta: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Jk2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jk2>; cdecl;
//    {class} function valueOf(P1: JString): Jk2; cdecl;
//
//    { static Property }
//    {class} property a: Jk2 read _Geta;
//    {class} property b: Jk2 read _Getb;
//    {class} property c: Jk2 read _Getc;
//    {class} property d: Jk2 read _Getd;
//    {class} property e: Jk2 read _Gete;
//    {class} property f: Jk2 read _Getf;
//    {class} property g: Jk2 read _Getg;
//    {class} property h: Jk2 read _Geth;
//    {class} property i: Jk2 read _Geti;
//    {class} property j: Jk2 read _Getj;
//    {class} property k: Jk2 read _Getk;
//    {class} property l: Jk2 read _Getl;
//    {class} property m: Jk2 read _Getm;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k2')]
//  Jk2 = interface(JEnum) // or JObject
//  ['{CF92CAC0-F994-4770-9842-7C16AEB12E74}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk2 = class(TJavaGenericImport<Jk2Class, Jk2>) end;

//  Jk3Class = interface(JObjectClass)
//  ['{B533C963-3042-4CA1-934A-07C7E077F40D}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function b(P1: JContext): JString; cdecl; overload;
//    {class} function c: JString; cdecl;
//    {class} function d: JString; cdecl;
//    {class} function a(P1: JContext): JString; cdecl; overload;
//    {class} function a: JString; cdecl; overload;
//    {class} function b: JString; cdecl; overload;
//    {class} function a(P1: JContext; P2: Boolean): JString; cdecl; overload;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: JString read _Getb;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k3')]
//  Jk3 = interface(JObject)
//  ['{9D1B1229-33A0-4A0B-94F4-5337A1664578}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk3 = class(TJavaGenericImport<Jk3Class, Jk3>) end;

//  Jk4_aClass = interface(JObjectClass)
//  ['{20E5C198-34B8-43D8-BF0F-20A3B08917FA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k4$a')]
//  Jk4_a = interface(JObject)
//  ['{BC466261-8EBC-482D-87D8-13F90139048B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk4_a = class(TJavaGenericImport<Jk4_aClass, Jk4_a>) end;

//  Jk4Class = interface(JObjectClass)
//  ['{73298AF6-3E83-499B-A417-76FF49623133}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k4')]
//  Jk4 = interface(JObject)
//  ['{7EC817CB-4191-4473-AA97-0F61C9CC8913}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: JHmsBuildBitmapOption): JBitmap; cdecl; overload;
//
//    { Property }
//  end;

//  TJk4 = class(TJavaGenericImport<Jk4Class, Jk4>) end;

//  Jk5Class = interface(JObjectClass)
//  ['{17E90B16-88C1-455A-8954-A08A7B2FD756}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jg0_e): Jk5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k5')]
//  Jk5 = interface(JObject)
//  ['{98409FB5-C641-4058-8B78-305814CD8755}']
//    { Property Methods }
//
//    { methods }
//    procedure onPreviewFrame(P1: TJavaArray<Byte>; P2: JCamera); cdecl;
//
//    { Property }
//  end;

//  TJk5 = class(TJavaGenericImport<Jk5Class, Jk5>) end;

//  Jk6Class = interface(JObjectClass)
//  ['{CAC79653-4D2F-4973-B670-AEED6F7F7617}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k6')]
//  Jk6 = interface(JObject)
//  ['{2FDF9552-2CA5-4A6E-B648-B1AC688D58AE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk6 = class(TJavaGenericImport<Jk6Class, Jk6>) end;

//  JlClass = interface(JObjectClass)
//  ['{A4DFACD8-2D45-440B-9FF8-96380CF160AB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l')]
//  Jl = interface(JObject)
//  ['{389182BD-03DC-42ED-B17A-526DDB0D2B74}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl = class(TJavaGenericImport<JlClass, Jl>) end;

//  Jl0Class = interface(JEnumClass) // or JObjectClass
//  ['{57BE2CFE-7DB7-4336-BF85-192CC74FE210}']
//    { static Property Methods }
//    {class} function _Getc: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getq: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gets: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gett: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getu: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getv: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getw: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getx: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gety: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getz: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetA: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetB: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetC: Jl0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jl0>; cdecl;
//    {class} function valueOf(P1: JString): Jl0; cdecl;
//    {class} function a(P1: Integer): Jl0; cdecl; overload;
//    {class} function a(P1: JString): Jl0; cdecl; overload;
//
//    { static Property }
//    {class} property c: Jl0 read _Getc;
//    {class} property d: Jl0 read _Getd;
//    {class} property e: Jl0 read _Gete;
//    {class} property f: Jl0 read _Getf;
//    {class} property g: Jl0 read _Getg;
//    {class} property h: Jl0 read _Geth;
//    {class} property i: Jl0 read _Geti;
//    {class} property j: Jl0 read _Getj;
//    {class} property k: Jl0 read _Getk;
//    {class} property l: Jl0 read _Getl;
//    {class} property m: Jl0 read _Getm;
//    {class} property n: Jl0 read _Getn;
//    {class} property o: Jl0 read _Geto;
//    {class} property p: Jl0 read _Getp;
//    {class} property q: Jl0 read _Getq;
//    {class} property r: Jl0 read _Getr;
//    {class} property s: Jl0 read _Gets;
//    {class} property t: Jl0 read _Gett;
//    {class} property u: Jl0 read _Getu;
//    {class} property v: Jl0 read _Getv;
//    {class} property w: Jl0 read _Getw;
//    {class} property x: Jl0 read _Getx;
//    {class} property y: Jl0 read _Gety;
//    {class} property z: Jl0 read _Getz;
//    {class} property A: Jl0 read _GetA;
//    {class} property B: Jl0 read _GetB;
//    {class} property C: Jl0 read _GetC;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l0')]
//  Jl0 = interface(JEnum) // or JObject
//  ['{05137678-F94A-44D2-8F42-399AE20A4915}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJl0 = class(TJavaGenericImport<Jl0Class, Jl0>) end;

//  Jl1_aClass = interface(JObjectClass)
//  ['{B430BF05-9A7B-4DB3-A1D5-83822412F7CF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l1$a')]
//  Jl1_a = interface(JObject)
//  ['{4503B685-B739-4D6F-BE62-7B19F467C3F2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl1_a = class(TJavaGenericImport<Jl1_aClass, Jl1_a>) end;

//  Jl1_bClass = interface(JEnumClass) // or JObjectClass
//  ['{4B57E62D-5188-4887-90DB-CB368D7693C9}']
//    { static Property Methods }
//    {class} function _Geta: Jl1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jl1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jl1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jl1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jl1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jl1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jl1_b>; cdecl;
//    {class} function valueOf(P1: JString): Jl1_b; cdecl;
//
//    { static Property }
//    {class} property a: Jl1_b read _Geta;
//    {class} property b: Jl1_b read _Getb;
//    {class} property c: Jl1_b read _Getc;
//    {class} property d: Jl1_b read _Getd;
//    {class} property e: Jl1_b read _Gete;
//    {class} property f: Jl1_b read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l1$b')]
//  Jl1_b = interface(JEnum) // or JObject
//  ['{0E956164-5188-4AF1-98CC-8BC920C3982C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl1_b = class(TJavaGenericImport<Jl1_bClass, Jl1_b>) end;

//  Jl1Class = interface(JObjectClass)
//  ['{C9A0D41A-A2FF-483F-9F4E-1BD3D8A51478}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l1')]
//  Jl1 = interface(JObject)
//  ['{55CA528F-A727-4841-8AB3-90FC4BA2325A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jg; P2: JMap): Jo1; cdecl;
//
//    { Property }
//  end;

//  TJl1 = class(TJavaGenericImport<Jl1Class, Jl1>) end;

//  Jl2Class = interface(JObjectClass)
//  ['{AB7BBB0E-D030-4B3E-A21A-1E6E58E527E2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l2')]
//  Jl2 = interface(IJavaInstance)
//  ['{F0059CEC-43EE-48DE-B644-95D0FDF4B0B7}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jo2); cdecl;
//
//    { Property }
//  end;

//  TJl2 = class(TJavaGenericImport<Jl2Class, Jl2>) end;

//  Jl3_aClass = interface(JObjectClass)
//  ['{5A031193-6787-484E-A1C6-37F26BD69376}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l3$a')]
//  Jl3_a = interface(JObject)
//  ['{DDE3C8DA-D214-45C9-820F-7A3CBA327492}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Je6; P2: Je6): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJl3_a = class(TJavaGenericImport<Jl3_aClass, Jl3_a>) end;

//  Jl3Class = interface(JObjectClass)
//  ['{9CEB70B2-3FC0-439C-B0CE-2B07C6F4917C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>): Jl3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l3')]
//  Jl3 = interface(JObject)
//  ['{F5543B97-76FC-4552-9285-3EC3F91063A5}']
//    { Property Methods }
//
//    { methods }
//    function a: Jr; cdecl;
//
//    { Property }
//  end;

//  TJl3 = class(TJavaGenericImport<Jl3Class, Jl3>) end;

//  Jl4Class = interface(JObjectClass)
//  ['{564D242D-AAB4-4803-9FA7-67B1A1ACD2BE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l4')]
//  Jl4 = interface(JObject)
//  ['{2F782DB6-B084-4D44-A57E-5A1CC03FB746}']
//    { Property Methods }
//    function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: Boolean; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: Boolean); cdecl;
//
//    { Property }
//    property a: JList read _Geta write _Seta;
//  end;

//  TJl4 = class(TJavaGenericImport<Jl4Class, Jl4>) end;

//  Jl5Class = interface(Jx5Class) // or JObjectClass
//  ['{BC0686C6-4AD0-4FEA-BD14-FE40543B9525}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l5')]
//  Jl5 = interface(Jx5) // or JObject
//  ['{DC469931-22C5-431D-83D9-A448C5C12D81}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJl5 = class(TJavaGenericImport<Jl5Class, Jl5>) end;

//  Jl6Class = interface(JObjectClass)
//  ['{8E1A9EC7-492E-433B-9F0D-F2F78AE35C8C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: Jy3): Jy3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l6')]
//  Jl6 = interface(JObject)
//  ['{F409D1AA-05D5-480D-823D-DCEBA97D5A41}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl6 = class(TJavaGenericImport<Jl6Class, Jl6>) end;

//  JmClass = interface(JObjectClass)
//  ['{B1BF4566-5BA9-4B10-AC7B-BAC5B746E6D7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m')]
//  Jm = interface(JObject)
//  ['{0372A1E4-C925-4863-9F22-B4DBA204F891}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm = class(TJavaGenericImport<JmClass, Jm>) end;

//  Jm0Class = interface(Jo4Class) // or JObjectClass
//  ['{6DE2E5A6-4062-4320-A697-8C36AEF4482B}']
//    { static Property Methods }
//    {class} function _Gete: TJavaArray<Char>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jm0; cdecl;
//    {class} function a(P1: TJavaArray<Char>; P2: Char): Boolean; cdecl; overload;
//
//    { static Property }
//    {class} property e: TJavaArray<Char> read _Gete;
//    {class} property f: TJavaArray<Integer> read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m0')]
//  Jm0 = interface(Jo4) // or JObject
//  ['{1D03D9F9-9514-4BCE-828F-A64A5470A04E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Jw5; cdecl; overload;
//
//    { Property }
//  end;

//  TJm0 = class(TJavaGenericImport<Jm0Class, Jm0>) end;

//  Jm1Class = interface(JObjectClass)
//  ['{35534A04-FEB6-44BA-A0E0-786A81CAE062}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m1')]
//  Jm1 = interface(JObject)
//  ['{D1DB6825-D22A-4221-B536-20FD652D4E74}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Js; P2: JMap): Jo1; cdecl; overload;
//    function a: Jb7; cdecl; overload;
//
//    { Property }
//  end;

//  TJm1 = class(TJavaGenericImport<Jm1Class, Jm1>) end;

//  Jm2_aClass = interface(JObjectClass)
//  ['{C67415D8-552E-4B1F-B203-4B65FF17AF69}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m2$a')]
//  Jm2_a = interface(JObject)
//  ['{7BCD331D-7259-42DF-808F-7605A099E399}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm2_a = class(TJavaGenericImport<Jm2_aClass, Jm2_a>) end;

//  Jm2Class = interface(JObjectClass)
//  ['{216B62FF-5295-4DCB-B7D9-C0393B97CE4E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jr2; P3: JMap): Jm5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m2')]
//  Jm2 = interface(JObject)
//  ['{31EECC53-64B3-4078-93AC-BC1EDEFE6D2C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm2 = class(TJavaGenericImport<Jm2Class, Jm2>) end;

//  Jm3Class = interface(JObjectClass)
//  ['{58115148-4303-410F-BC21-E5EDC264DE81}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jh6; P3: Jb2; P4: Jb2): JString; cdecl; overload;
//    {class} function a(P1: JCharSequence; P2: Integer): Integer; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m3')]
//  Jm3 = interface(JObject)
//  ['{1259BE1F-61B9-45D1-B3E2-019C5915484E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm3 = class(TJavaGenericImport<Jm3Class, Jm3>) end;

//  Jm4Class = interface(JObjectClass)
//  ['{2C77D7AF-7A19-4A92-A3B7-DEC1C641DEAB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m4')]
//  Jm4 = interface(IJavaInstance)
//  ['{81F88462-C658-4FE8-8E6C-76C544AB7B80}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JHmsScan>): Boolean; cdecl; overload;
//    function a: Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJm4 = class(TJavaGenericImport<Jm4Class, Jm4>) end;

//  Jm5Class = interface(JObjectClass)
//  ['{E2BDC1B0-9643-491F-B9D1-77D699709E8E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm5; cdecl;
//    {class} function a(P1: Integer): Boolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m5')]
//  Jm5 = interface(JObject)
//  ['{6FA5558B-3D7E-41E7-8675-1109675059EE}']
//    { Property Methods }
//
//    { methods }
//    function a: Ja0; cdecl; overload;
//    function toString: JString; cdecl;
//    procedure a(P1: Jd4); cdecl; overload;
//    procedure a(P1: Jr2); cdecl; overload;
//    procedure a(P1: Jc7); cdecl; overload;
//    procedure b(P1: Integer); cdecl;
//    procedure a(P1: Ja0); cdecl; overload;
//
//    { Property }
//  end;

//  TJm5 = class(TJavaGenericImport<Jm5Class, Jm5>) end;

//  Jm6Class = interface(JObjectClass)
//  ['{038D9EB3-50ED-4F8C-85D7-DA7511E7C983}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Jp; P2: JMap; P3: Jw5; P4: TJavaArray<Integer>; P5: TJavaArray<Double>): TJavaArray<Byte>; cdecl; overload;
//    {class} function a(P1: Jy5; P2: Jy5): Double; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<Jy5>; P2: Integer; P3: Integer; P4: TJavaArray<Double>): TJavaObjectArray<Jy5>; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m6')]
//  Jm6 = interface(JObject)
//  ['{F973A4F1-3203-4ADA-BC76-0F266B8211FE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm6 = class(TJavaGenericImport<Jm6Class, Jm6>) end;

//  JnClass = interface(JObjectClass)
//  ['{779A9884-73FA-4D1C-9781-A72567483391}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n')]
//  Jn = interface(JObject)
//  ['{FD6B162D-0DD8-488A-B517-D326322A4A4A}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jo2); cdecl; overload;
//
//    { Property }
//  end;

//  TJn = class(TJavaGenericImport<JnClass, Jn>) end;

//  Jn0Class = interface(Jp4Class) // or JObjectClass
//  ['{1CD842EA-5F63-4769-BE74-39014AADFA7C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n0')]
//  Jn0 = interface(Jp4) // or JObject
//  ['{A8E84870-8338-4D0E-8698-5DC8B0F1AC8D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//
//    { Property }
//  end;

//  TJn0 = class(TJavaGenericImport<Jn0Class, Jn0>) end;

//  Jn1Class = interface(JObjectClass)
//  ['{6E27EE89-6B52-4F65-9E39-8EE528E0B72C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n1')]
//  Jn1 = interface(JObject)
//  ['{31A27F56-9CFE-4226-8B60-5C46BA2F2CB8}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Js; P2: JMap): Jo1; cdecl;
//
//    { Property }
//  end;

//  TJn1 = class(TJavaGenericImport<Jn1Class, Jn1>) end;

//  Jn2Class = interface(JObjectClass)
//  ['{1A63BA72-B68B-4FDF-AB51-2322C5D8FE8B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Jf; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n2')]
//  Jn2 = interface(JObject)
//  ['{349E77DA-B097-44DA-9FAE-21EB72AC539C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn2 = class(TJavaGenericImport<Jn2Class, Jn2>) end;

//  Jn3Class = interface(Ja3Class) // or JObjectClass
//  ['{39F8FA5B-7CEA-4F23-8049-E26CE330552E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jy3): Jn3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n3')]
//  Jn3 = interface(Ja3) // or JObject
//  ['{EC019054-1E5C-446A-810E-6A5F4796EDDF}']
//    { Property Methods }
//
//    { methods }
//    function a: Js; cdecl; overload;
//    function a(P1: Jy3): Jo; cdecl; overload;
//
//    { Property }
//  end;

//  TJn3 = class(TJavaGenericImport<Jn3Class, Jn3>) end;

//  Jn4Class = interface(JObjectClass)
//  ['{BF728381-5A0E-4F57-819B-3C893EC676BF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n4')]
//  Jn4 = interface(IJavaInstance)
//  ['{EEA29CFA-D677-49B0-B424-7A9B5D5244DD}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: JBitmap; P3: Single); cdecl;
//
//    { Property }
//  end;

//  TJn4 = class(TJavaGenericImport<Jn4Class, Jn4>) end;

//  Jn5Class = interface(JObjectClass)
//  ['{C77F2CF8-55D9-4526-B88C-9CBD1E4B4CB9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n5')]
//  Jn5 = interface(JObject)
//  ['{B628992A-9217-47A3-B415-352B3647B492}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaObjectArray<Jy5>); cdecl;
//
//    { Property }
//  end;

//  TJn5 = class(TJavaGenericImport<Jn5Class, Jn5>) end;

//  Jn6Class = interface(Js6Class) // or JObjectClass
//  ['{123B4071-5F4C-4351-BCFF-42CD58A692A8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n6')]
//  Jn6 = interface(Js6) // or JObject
//  ['{32DEFE20-7BDB-436F-A08E-988B312ABA84}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Jr): Boolean; cdecl; overload;
//    function a(P1: Integer; P2: Jr; P3: TJavaArray<Integer>; P4: JMap): Jw5; cdecl; overload;
//    function a(P1: Integer; P2: Jr; P3: JMap): Jw5; cdecl; overload;
//    function a(P1: Jp; P2: JMap): Jw5; cdecl; overload;
//
//    { Property }
//  end;

//  TJn6 = class(TJavaGenericImport<Jn6Class, Jn6>) end;

//  JoClass = interface(JObjectClass)
//  ['{F31385DE-64B0-45E2-9F9D-F9DF65CB9772}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o')]
//  Jo = interface(JObject)
//  ['{D2F2B02A-0486-4AF0-BD26-EC52DA9F39B2}']
//    { Property Methods }
//
//    { methods }
//    function c: Jy3; cdecl;
//    function a(P1: Integer; P2: Jr): Jr; cdecl; overload;
//    function a: Js; cdecl; overload;
//    function a(P1: Jy3): Jo; cdecl; overload;
//    function d: Integer; cdecl;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJo = class(TJavaGenericImport<JoClass, Jo>) end;

//  Jo0Class = interface(Jo4Class) // or JObjectClass
//  ['{F67BE98E-ED4F-403B-AEAD-DEE1231EE996}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jo0; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<TJavaArray<Integer>> read _Geta;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o0')]
//  Jo0 = interface(Jo4) // or JObject
//  ['{89E9BEB8-E063-43C1-A75C-03AFE1614034}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Jw5; cdecl;
//
//    { Property }
//  end;

//  TJo0 = class(TJavaGenericImport<Jo0Class, Jo0>) end;

//  Jo1Class = interface(JObjectClass)
//  ['{14F9DA07-A112-49CA-AF4A-0D0F57E12C11}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>; P2: JString; P3: JList; P4: JString): Jo1; cdecl; overload;
//    {class} function init(P1: TJavaArray<Byte>; P2: JString; P3: JList; P4: JString; P5: Integer; P6: Integer): Jo1; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o1')]
//  Jo1 = interface(JObject)
//  ['{0E894933-BF9A-4D5A-A257-9A8B41449281}']
//    { Property Methods }
//
//    { methods }
//    function c: TJavaArray<Byte>; cdecl;
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    function d: JString; cdecl;
//    procedure b(P1: JInteger); cdecl; overload;
//    procedure a(P1: JInteger); cdecl; overload;
//    function b: JObject; cdecl; overload;
//    procedure a(P1: JObject); cdecl; overload;
//
//    { Property }
//  end;

//  TJo1 = class(TJavaGenericImport<Jo1Class, Jo1>) end;

//  Jo2Class = interface(JObjectClass)
//  ['{179D304B-AF9E-49AC-89B2-BD077136F486}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o2')]
//  Jo2 = interface(JObject)
//  ['{DA5D2133-24A5-44CA-8400-6FCE937AFC79}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jh6); cdecl; overload;
//    procedure a(P1: Jb2; P2: Jb2); cdecl; overload;
//    function d: JString; cdecl;
//    procedure a(P1: Integer); cdecl; overload;
//    function c: Char; cdecl; overload;
//    function b: JStringBuilder; cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: Char); cdecl; overload;
//    function a: Integer; cdecl; overload;
//    function e: Integer; cdecl;
//    procedure b(P1: Integer); cdecl; overload;
//    procedure j; cdecl;
//    function i: Boolean; cdecl;
//    function f: Integer; cdecl;
//    function g: Jg6; cdecl;
//    procedure l; cdecl;
//    procedure c(P1: Integer); cdecl; overload;
//    procedure k; cdecl;
//
//    { Property }
//  end;

//  TJo2 = class(TJavaGenericImport<Jo2Class, Jo2>) end;

//  Jo3Class = interface(JObjectClass)
//  ['{8A612923-7F8D-47A4-96C7-14EA2B736D8A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o3')]
//  Jo3 = interface(IJavaInstance)
//  ['{B04BD1DE-736A-4197-AFB7-2366247BCEB3}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jb5; P2: Int64); cdecl;
//
//    { Property }
//  end;

//  TJo3 = class(TJavaGenericImport<Jo3Class, Jo3>) end;

//  Jo4Class = interface(JObjectClass)
//  ['{823726B0-E9FD-4CC7-A5EE-187A775BE15F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jo4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o4')]
//  Jo4 = interface(JObject)
//  ['{7891BFC1-1C6F-4F2F-B9A5-FD9E15598DD2}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Jw5; cdecl; overload;
//    function a(P1: Integer; P2: Jr; P3: JMap): Jw5; cdecl; overload;
//
//    { Property }
//  end;

//  TJo4 = class(TJavaGenericImport<Jo4Class, Jo4>) end;

//  Jo5Class = interface(JObjectClass)
//  ['{9B61E586-A2AB-476E-9A2A-6ED815B665A8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jo5; cdecl;
//    {class} procedure a(P1: Jy3); cdecl; overload;
//    {class} procedure a(P1: Jy3; P2: Jw5); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o5')]
//  Jo5 = interface(JObject)
//  ['{E35F27E9-D9FF-4EB1-80B1-D2B233B4467E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Jw5; cdecl; overload;
//
//    { Property }
//  end;

//  TJo5 = class(TJavaGenericImport<Jo5Class, Jo5>) end;

//  Jo6Class = interface(JObjectClass)
//  ['{82CDC0FD-586A-41B3-85AE-3572ACC95554}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jo6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o6')]
//  Jo6 = interface(JObject)
//  ['{73834076-3F74-4C78-AD02-33AC6F8446EA}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJo6 = class(TJavaGenericImport<Jo6Class, Jo6>) end;

//  JpClass = interface(JObjectClass)
//  ['{CC349D1D-BFF4-45B8-BBDB-93B1812FD012}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jo): Jp; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p')]
//  Jp = interface(JObject)
//  ['{8F4E0628-BA41-4B9E-B798-22D0C962BB52}']
//    { Property Methods }
//
//    { methods }
//    function e: Integer; cdecl;
//    function a(P1: Integer; P2: Integer): Jr; cdecl; overload;
//    function c: Integer; cdecl;
//    function a(P1: Integer; P2: Jr): Jr; cdecl; overload;
//    function b: Js; cdecl;
//    procedure a(P1: Js); cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jp; cdecl; overload;
//    function a: Jo; cdecl; overload;
//    function d: TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;

//  TJp = class(TJavaGenericImport<JpClass, Jp>) end;

//  Jp0_aClass = interface(JEnumClass) // or JObjectClass
//  ['{B0224CC1-F24A-4668-9553-DD27F4276C0A}']
//    { static Property Methods }
//    {class} function _Geta: Jp0_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jp0_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jp0_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jp0_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jp0_a>; cdecl;
//    {class} function valueOf(P1: JString): Jp0_a; cdecl;
//
//    { static Property }
//    {class} property a: Jp0_a read _Geta;
//    {class} property b: Jp0_a read _Getb;
//    {class} property c: Jp0_a read _Getc;
//    {class} property d: Jp0_a read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p0$a')]
//  Jp0_a = interface(JEnum) // or JObject
//  ['{E2B573A8-2E7F-423B-98C3-21F319577B5F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp0_a = class(TJavaGenericImport<Jp0_aClass, Jp0_a>) end;

//  Jp0Class = interface(Jp4Class) // or JObjectClass
//  ['{94159C28-733C-47F6-90E6-CCBF802CD11A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jp0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p0')]
//  Jp0 = interface(Jp4) // or JObject
//  ['{3D58BC5C-46D0-4159-BC05-A02199052CE4}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJp0 = class(TJavaGenericImport<Jp0Class, Jp0>) end;

//  Jp1Class = interface(Jc3Class) // or JObjectClass
//  ['{6F845670-7190-4CAD-A74F-D32EA77D7797}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jp1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p1')]
//  Jp1 = interface(Jc3) // or JObject
//  ['{A68F6227-F087-4F27-8CE2-55A5A7BAF954}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Js; P2: Integer; P3: Integer; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single; P17: Single; P18: Single; P19: Single): Js; cdecl; overload;
//    function a(P1: Js; P2: Integer; P3: Integer; P4: Ji5; P5: Boolean): Js; cdecl; overload;
//    function a(P1: Js; P2: Integer; P3: Integer; P4: Ji5): Js; cdecl; overload;
//    function b(P1: Js; P2: Integer; P3: Integer; P4: Ji5): Js; cdecl;
//
//    { Property }
//  end;

//  TJp1 = class(TJavaGenericImport<Jp1Class, Jp1>) end;

//  Jp2Class = interface(JObjectClass)
//  ['{961589DC-B166-4E1B-9D2B-C2BFC5B6C864}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jg6): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p2')]
//  Jp2 = interface(JObject)
//  ['{D316466B-7785-4C15-9BA9-BBD4CACCC674}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp2 = class(TJavaGenericImport<Jp2Class, Jp2>) end;

//  Jp3Class = interface(JObjectClass)
//  ['{D19D74D1-187A-44A4-8686-75AFA37C3494}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p3')]
//  Jp3 = interface(IJavaInstance)
//  ['{676711E7-52AE-4B76-94D5-471939A4E4B0}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jb5); cdecl;
//
//    { Property }
//  end;

//  TJp3 = class(TJavaGenericImport<Jp3Class, Jp3>) end;

//  Jp4Class = interface(JObjectClass)
//  ['{94249520-832F-4DC5-9BAF-ECACAD7EA213}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jp4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p4')]
//  Jp4 = interface(JObject)
//  ['{D0D211EB-F1D6-4E4D-80DD-30F0E57FD80B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a: Integer; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJp4 = class(TJavaGenericImport<Jp4Class, Jp4>) end;

//  Jp5Class = interface(JObjectClass)
//  ['{4E544E66-128B-4679-8F22-1F662ADC3FB9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jp5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p5')]
//  Jp5 = interface(JObject)
//  ['{4101B44A-F41F-4076-B1D3-33E6F82C5927}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJp5 = class(TJavaGenericImport<Jp5Class, Jp5>) end;

//  Jp6Class = interface(JObjectClass)
//  ['{3BC026BF-176A-4086-B550-8B97510553EC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p6')]
//  Jp6 = interface(JObject)
//  ['{A8F0EAA8-2615-491F-96D9-EF4083FF292B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp6 = class(TJavaGenericImport<Jp6Class, Jp6>) end;

//  JqClass = interface(Jk6Class) // or JObjectClass
//  ['{7A0B5895-7673-4A7C-8114-DBA572799A38}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q')]
//  Jq = interface(Jk6) // or JObject
//  ['{E82CC44D-73EC-4170-8F3E-EE48EB8638C7}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jr; P2: TJavaArray<Byte>); cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJq = class(TJavaGenericImport<JqClass, Jq>) end;

//  Jq0Class = interface(Jo4Class) // or JObjectClass
//  ['{5D063019-C23D-4898-9C63-3A986827BE3A}']
//    { static Property Methods }
//    {class} function _Gete: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jq0; cdecl; overload;
//    {class} function init(P1: Boolean): Jq0; cdecl; overload;
//    {class} function init(P1: Boolean; P2: Boolean): Jq0; cdecl; overload;
//
//    { static Property }
//    {class} property e: TJavaArray<Integer> read _Gete;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q0')]
//  Jq0 = interface(Jo4) // or JObject
//  ['{197CCAC4-4386-4C58-B53F-E6F96B9AA582}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Jw5; cdecl;
//
//    { Property }
//  end;

//  TJq0 = class(TJavaGenericImport<Jq0Class, Jq0>) end;

//  Jq1Class = interface(JObjectClass)
//  ['{5087B9FD-0A25-4020-80D9-80BA814750C5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JCharSequence; P2: Integer; P3: Integer): Jq1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q1')]
//  Jq1 = interface(JObject)
//  ['{0663B1BF-7075-4512-B0C9-90BBCAA3FCED}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJq1 = class(TJavaGenericImport<Jq1Class, Jq1>) end;

//  Jq2Class = interface(JObjectClass)
//  ['{CE167DC7-E2CB-43FE-9615-8414C486C1CD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q2')]
//  Jq2 = interface(JObject)
//  ['{FD4AE358-2E1E-4E7C-9E2B-FA462F6CA669}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Integer>; P2: Integer; P3: TJavaArray<Integer>): Integer; cdecl;
//
//    { Property }
//  end;

//  TJq2 = class(TJavaGenericImport<Jq2Class, Jq2>) end;

//  Jq3Class = interface(JIRemoteFrameDecoderDelegate_StubClass) // or JObjectClass
//  ['{F2687CA8-156B-48DB-9A7F-7684C54034F3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jq3; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q3')]
//  Jq3 = interface(JIRemoteFrameDecoderDelegate_Stub) // or JObject
//  ['{759F1E81-8FF2-44B0-857B-2C75B91F4B9A}']
//    { Property Methods }
//
//    { methods }
//    function decode(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JIObjectWrapper): TJavaObjectArray<Jw5>; cdecl;
//    function a(P1: Integer; P2: Integer): JRect; cdecl; overload;
//    function b(P1: Integer; P2: Integer): JRect; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Jj5; cdecl; overload;
//
//    { Property }
//  end;

//  TJq3 = class(TJavaGenericImport<Jq3Class, Jq3>) end;

//  Jq4Class = interface(JObjectClass)
//  ['{E548BC02-D035-4E0D-B38D-B80A83622A0E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: Int64; P4: Int64; P5: JInterpolator): Jq4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q4')]
//  Jq4 = interface(JObject)
//  ['{8679B8E0-52CE-40BA-8CB1-0A784C6DD945}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jb5; P2: Int64); cdecl;
//
//    { Property }
//  end;

//  TJq4 = class(TJavaGenericImport<Jq4Class, Jq4>) end;

//  Jq5Class = interface(Jy3Class) // or JObjectClass
//  ['{AEFC0A99-E20C-48CC-80FB-42E4764439EC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: TJavaArray<Integer>): Jq5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q5')]
//  Jq5 = interface(Jy3) // or JObject
//  ['{31A53B85-CF47-40C1-888B-9A6CBA236E03}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    function b: TJavaArray<Byte>; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jy3; cdecl; overload;
//    function b(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jy3; cdecl; overload;
//
//    { Property }
//  end;

//  TJq5 = class(TJavaGenericImport<Jq5Class, Jq5>) end;

//  Jq6Class = interface(JObjectClass)
//  ['{215D52FC-2D94-42BA-8AFC-5451A187CEE6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q6')]
//  Jq6 = interface(JObject)
//  ['{F6CA8A0F-0B4A-487A-959D-CEEB1513C4B3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJq6 = class(TJavaGenericImport<Jq6Class, Jq6>) end;

//  JrClass = interface(JObjectClass)
//  ['{F974591C-11CE-4724-8476-623E9324A2DA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr; cdecl; overload;
//    {class} function init(P1: Integer): Jr; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r')]
//  Jr = interface(JObject)
//  ['{4456239F-C3FE-4168-9BE2-7607552E153F}']
//    { Property Methods }
//
//    { methods }
//    function e: Integer; cdecl;
//    function f: Integer; cdecl;
//    procedure i; cdecl;
//    procedure c; cdecl; overload;
//    procedure g; cdecl; overload;
//    procedure j; cdecl;
//    function b(P1: Integer): Boolean; cdecl; overload;
//    procedure g(P1: Integer); cdecl; overload;
//    procedure h(P1: Integer); cdecl; overload;
//    function c(P1: Integer): Integer; cdecl; overload;
//    function d(P1: Integer): Integer; cdecl; overload;
//    procedure b(P1: Integer; P2: Integer); cdecl; overload;
//    procedure c(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Boolean; P4: Boolean): Boolean; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: Jr); cdecl; overload;
//    procedure b(P1: Jr); cdecl; overload;
//    procedure a(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer); cdecl; overload;
//    function d: TJavaArray<Integer>; cdecl; overload;
//    procedure h; cdecl; overload;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//    function b: Jr; cdecl; overload;
//    function clone: JObject; cdecl;
//
//    { Property }
//  end;

//  TJr = class(TJavaGenericImport<JrClass, Jr>) end;

//  Jr0Class = interface(Jp4Class) // or JObjectClass
//  ['{7A04E02F-7D67-442B-9682-5EE20DEEA342}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r0')]
//  Jr0 = interface(Jp4) // or JObject
//  ['{8390DA8D-7313-4D4C-8D24-D93098AD5BBE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJr0 = class(TJavaGenericImport<Jr0Class, Jr0>) end;

//  Jr1Class = interface(JObjectClass)
//  ['{32D6C260-C89F-4495-88AA-463A7F016242}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r1')]
//  Jr1 = interface(JObject)
//  ['{3C16BC5B-600C-4BFB-A260-0D90478D95F6}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJr1 = class(TJavaGenericImport<Jr1Class, Jr1>) end;

//  Jr2Class = interface(JEnumClass) // or JObjectClass
//  ['{9A72A206-08E2-4A1A-980D-6EBEFE2C1531}']
//    { static Property Methods }
//    {class} function _Getb: Jr2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jr2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jr2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jr2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jr2>; cdecl;
//    {class} function valueOf(P1: JString): Jr2; cdecl;
//    {class} function a(P1: Integer): Jr2; cdecl; overload;
//
//    { static Property }
//    {class} property b: Jr2 read _Getb;
//    {class} property c: Jr2 read _Getc;
//    {class} property d: Jr2 read _Getd;
//    {class} property e: Jr2 read _Gete;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r2')]
//  Jr2 = interface(JEnum) // or JObject
//  ['{4BD64BC8-3AAF-43AF-A1FE-1DDCA4A01BEC}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJr2 = class(TJavaGenericImport<Jr2Class, Jr2>) end;

//  Jr3Class = interface(Jx5Class) // or JObjectClass
//  ['{E3E069C1-C014-437C-83AA-EE3F5BAF320D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r3')]
//  Jr3 = interface(Jx5) // or JObject
//  ['{17D20157-8ED5-4A15-B5EF-84EDDFACE8D3}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJr3 = class(TJavaGenericImport<Jr3Class, Jr3>) end;

//  Jr4Class = interface(JObjectClass)
//  ['{8A6521BC-8B64-4D49-921F-F2FFC707BE82}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr4; cdecl; overload;
//    {class} function init(P1: Boolean): Jr4; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r4')]
//  Jr4 = interface(JObject)
//  ['{FDB32842-20CC-4D94-80A5-B45E139F5162}']
//    { Property Methods }
//
//    { methods }
//    function a: Jj; cdecl; overload;
//    procedure a(P1: JString; P2: Integer); cdecl; overload;
//    procedure b(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
//    procedure a(P1: Jv0); cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JCharset); cdecl; overload;
//
//    { Property }
//  end;

//  TJr4 = class(TJavaGenericImport<Jr4Class, Jr4>) end;

//  Jr5Class = interface(JObjectClass)
//  ['{C8EA4C48-D664-45F7-9046-DDB9510E7AC6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): Integer; cdecl; overload;
//    {class} function a(P1: Single): Single; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r5')]
//  Jr5 = interface(JObject)
//  ['{C9DF577D-0589-4B2C-9521-863742CE6DF5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr5 = class(TJavaGenericImport<Jr5Class, Jr5>) end;

//  Jr6Class = interface(JObjectClass)
//  ['{810FD7EE-E3B9-4341-AD52-FB2538B7ADB7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r6')]
//  Jr6 = interface(JObject)
//  ['{4552E813-A7CC-4B04-835E-F66BC1843846}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr6 = class(TJavaGenericImport<Jr6Class, Jr6>) end;

//  JsClass = interface(JObjectClass)
//  ['{A3B4B1F7-2067-41BC-8403-BEC2F4E7C256}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Js; cdecl; overload;
//    {class} function init(P1: Integer; P2: Integer): Js; cdecl; overload;
//    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Integer>): Js; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s')]
//  Js = interface(JObject)
//  ['{F7504191-A4BC-43F8-9610-D3E2B0AA118E}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Integer; P2: Integer): Boolean; cdecl; overload;
//    procedure c(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a(P1: Integer; P2: Integer); cdecl; overload;
//    procedure a; cdecl; overload;
//    procedure a(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl; overload;
//    function a(P1: Integer; P2: Jr): Jr; cdecl; overload;
//    procedure b(P1: Integer; P2: Jr); cdecl; overload;
//    procedure f; cdecl;
//    function e: Integer; cdecl;
//    function c: Integer; cdecl; overload;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//    function a(P1: JString; P2: JString): JString; cdecl; overload;
//    function b: Js; cdecl; overload;
//    function d: Js; cdecl;
//    function clone: JObject; cdecl;
//
//    { Property }
//  end;

//  TJs = class(TJavaGenericImport<JsClass, Js>) end;

//  Js0Class = interface(Jo4Class) // or JObjectClass
//  ['{3162162E-66C0-461D-A214-FCC7C61FEC7C}']
//    { static Property Methods }
//    {class} function _Getd: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Js0; cdecl;
//
//    { static Property }
//    {class} property d: TJavaArray<Integer> read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s0')]
//  Js0 = interface(Jo4) // or JObject
//  ['{345F3079-53CC-4016-A9E6-B22B06F7116C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Jw5; cdecl;
//
//    { Property }
//  end;

//  TJs0 = class(TJavaGenericImport<Js0Class, Js0>) end;

//  Js1Class = interface(JObjectClass)
//  ['{B401D7E1-BD2E-426F-AAA9-EC141C1FB56D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s1')]
//  Js1 = interface(JObject)
//  ['{8081F7F9-F653-4721-A388-2252C99307B6}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJs1 = class(TJavaGenericImport<Js1Class, Js1>) end;

//  Js2Class = interface(JObjectClass)
//  ['{EB4C9502-3B15-429C-B23C-311749C70FA1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s2')]
//  Js2 = interface(JObject)
//  ['{720F227A-3C3C-4E5C-94CE-FA4C7F85C599}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJs2 = class(TJavaGenericImport<Js2Class, Js2>) end;

//  Js3Class = interface(Jo4Class) // or JObjectClass
//  ['{CC71977D-AEF9-4EE7-8E32-70464D3ED556}']
//    { static Property Methods }
//    {class} function _Getf: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Js3; cdecl;
//
//    { static Property }
//    {class} property f: TJavaArray<TJavaArray<Integer>> read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s3')]
//  Js3 = interface(Jo4) // or JObject
//  ['{B8980E38-382B-4722-8E57-74E10C83A1B5}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Jw5; cdecl;
//
//    { Property }
//  end;

//  TJs3 = class(TJavaGenericImport<Js3Class, Js3>) end;

//  Js4Class = interface(JObjectClass)
//  ['{52DBB68F-D34B-4262-AF19-17433869305E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s4')]
//  Js4 = interface(JObject)
//  ['{CC20AC62-0B19-4C2E-92D5-75CA9669A5CF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJs4 = class(TJavaGenericImport<Js4Class, Js4>) end;

//  Js5Class = interface(JObjectClass)
//  ['{A27296CB-D3E7-4302-A4A3-01D57E5D2465}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s5')]
//  Js5 = interface(IJavaInstance)
//  ['{8E0025F5-400D-499B-892E-4E8574C741D9}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Jw5; cdecl;
//
//    { Property }
//  end;

//  TJs5 = class(TJavaGenericImport<Js5Class, Js5>) end;

//  Js6Class = interface(Jo4Class) // or JObjectClass
//  ['{440DF844-A056-4D61-A2D2-77D6F769252B}']
//    { static Property Methods }
//    {class} function _Getc: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JCharSequence): Boolean; cdecl; overload;
//    {class} function b(P1: JCharSequence): Integer; cdecl;
//
//    { static Property }
//    {class} property c: TJavaArray<Integer> read _Getc;
//    {class} property d: TJavaArray<Integer> read _Getd;
//    {class} property e: TJavaArray<Integer> read _Gete;
//    {class} property f: TJavaArray<TJavaArray<Integer>> read _Getf;
//    {class} property g: TJavaArray<TJavaArray<Integer>> read _Getg;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s6')]
//  Js6 = interface(Jo4) // or JObject
//  ['{12458EC4-5412-4FDC-956F-7C9CA2DBD1FF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Jw5; cdecl; overload;
//    function a(P1: Integer; P2: Jr; P3: TJavaArray<Integer>; P4: JMap): Jw5; cdecl; overload;
//
//    { Property }
//  end;

//  TJs6 = class(TJavaGenericImport<Js6Class, Js6>) end;

//  JtClass = interface(JObjectClass)
//  ['{9227E81A-5705-4845-A88A-DA539A37636C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t')]
//  Jt = interface(JObject)
//  ['{CD2C69F2-353F-47A2-BAAE-2FD27510F795}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt = class(TJavaGenericImport<JtClass, Jt>) end;

//  Jt0Class = interface(Jp4Class) // or JObjectClass
//  ['{CF795394-3B0F-4417-939C-CF154D3E0B49}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t0')]
//  Jt0 = interface(Jp4) // or JObject
//  ['{EF3A8056-8607-4FCF-9462-C18C8B9AEFFA}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJt0 = class(TJavaGenericImport<Jt0Class, Jt0>) end;

//  Jt1Class = interface(Js1Class) // or JObjectClass
//  ['{21BAC85C-FBEA-4A6F-8965-1566CAA8A397}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t1')]
//  Jt1 = interface(Js1) // or JObject
//  ['{88976383-7743-451A-AEC0-C6AA70BECCB8}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJt1 = class(TJavaGenericImport<Jt1Class, Jt1>) end;

//  Jt2Class = interface(Jy5Class) // or JObjectClass
//  ['{3F51C4A3-8730-4093-904D-1F667BE74025}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Single; P4: Boolean; P5: Integer): Jt2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t2')]
//  Jt2 = interface(Jy5) // or JObject
//  ['{68F7F925-4927-4EAE-B076-4942748C97C5}']
//    { Property Methods }
//
//    { methods }
//    function e: Single; cdecl;
//    function d: Boolean; cdecl;
//
//    { Property }
//  end;

//  TJt2 = class(TJavaGenericImport<Jt2Class, Jt2>) end;

//  Jt3Class = interface(Jp4Class) // or JObjectClass
//  ['{23319EC3-A084-4E6D-B88D-4639CC57B4FB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t3')]
//  Jt3 = interface(Jp4) // or JObject
//  ['{44FBC759-28D9-4CEC-B27C-4158C412A5F0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJt3 = class(TJavaGenericImport<Jt3Class, Jt3>) end;

//  Jt4Class = interface(JObjectClass)
//  ['{7A7E62A3-0E11-4DA0-B203-01E5A1E38256}']
//    { static Property Methods }
//    {class} function _Getb: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JCollection): TJavaArray<Integer>; cdecl; overload;
//    {class} function a(P1: Integer): Integer; cdecl; overload;
//
//    { static Property }
//    {class} property b: TJavaArray<Integer> read _Getb;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t4')]
//  Jt4 = interface(JObject)
//  ['{268B6716-DEEF-4344-BF8B-BFCB4681395D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt4 = class(TJavaGenericImport<Jt4Class, Jt4>) end;

//  Jt5Class = interface(JObjectClass)
//  ['{F34AF986-C442-41D1-8535-5BA05A391A93}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jy2): Jt5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t5')]
//  Jt5 = interface(JObject)
//  ['{B91640C2-4C70-4D07-B28B-EEB6F2F6CDC1}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Integer>; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJt5 = class(TJavaGenericImport<Jt5Class, Jt5>) end;

//  Jt6Class = interface(Jp4Class) // or JObjectClass
//  ['{5A5E4EC0-5CC7-4557-9D2F-5DD802F7EF07}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t6')]
//  Jt6 = interface(Jp4) // or JObject
//  ['{30F9E1BB-B1E5-4093-A991-2F3F61E34A73}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJt6 = class(TJavaGenericImport<Jt6Class, Jt6>) end;

//  JuClass = interface(JObjectClass)
//  ['{C4682040-A178-4278-A73A-5DF2178BB612}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u')]
//  Ju = interface(JObject)
//  ['{E667C01C-9AEA-4B39-91A6-1542E2E793E7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu = class(TJavaGenericImport<JuClass, Ju>) end;

//  Ju0Class = interface(JObjectClass)
//  ['{A3B21528-0D92-4139-83B5-2598B287D2DD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u0')]
//  Ju0 = interface(JObject)
//  ['{9F5F4769-1685-4666-A420-817934E2E681}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJu0 = class(TJavaGenericImport<Ju0Class, Ju0>) end;

//  Ju1_aClass = interface(JObjectClass)
//  ['{3FB05702-EA57-4F45-B1F4-61715050E2B7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u1$a')]
//  Ju1_a = interface(JObject)
//  ['{257503D1-4F59-4C60-B3DC-6FD048C7C08A}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJu1_a = class(TJavaGenericImport<Ju1_aClass, Ju1_a>) end;

//  Ju1Class = interface(JObjectClass)
//  ['{547C33DB-0E9C-4DF2-BE87-957306904470}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Ju1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u1')]
//  Ju1 = interface(JObject)
//  ['{D7A68BB5-F170-4D93-8C43-F375C675759E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Boolean): Jg; cdecl;
//
//    { Property }
//  end;

//  TJu1 = class(TJavaGenericImport<Ju1Class, Ju1>) end;

//  Ju2_aClass = interface(JObjectClass)
//  ['{3A73B606-6ECD-4808-BA4E-BB29F339A4F4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u2$a')]
//  Ju2_a = interface(JObject)
//  ['{7BE68A52-B92F-41EC-B62D-82AC56C1DE15}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu2_a = class(TJavaGenericImport<Ju2_aClass, Ju2_a>) end;

//  Ju2_bClass = interface(JObjectClass)
//  ['{12BC27D7-CBDB-4825-B5CA-8A256612BC31}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u2$b')]
//  Ju2_b = interface(JObject)
//  ['{05994A9B-48E8-43BF-925F-01281FDD39E0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jt2; P2: Jt2): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJu2_b = class(TJavaGenericImport<Ju2_bClass, Ju2_b>) end;

//  Ju2_cClass = interface(JObjectClass)
//  ['{52CF9061-E6D9-4024-8229-220C974F9EEC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u2$c')]
//  Ju2_c = interface(JObject)
//  ['{2E491EBD-96F0-4722-A24B-E3DD4DE2249F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jt2; P2: Jt2): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJu2_c = class(TJavaGenericImport<Ju2_cClass, Ju2_c>) end;

//  Ju2_dClass = interface(JObjectClass)
//  ['{4A8BB8EA-FB0A-4713-A3A1-7C9D72CB7EED}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u2$d')]
//  Ju2_d = interface(JObject)
//  ['{8EE3FBDC-6374-4EC1-B482-D774BFAFA618}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jt2; P2: Jt2): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJu2_d = class(TJavaGenericImport<Ju2_dClass, Ju2_d>) end;

//  Ju2Class = interface(JObjectClass)
//  ['{776AA672-E63C-4208-8DC0-B11A48AB30A4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js; P2: Jz5): Ju2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u2')]
//  Ju2 = interface(JObject)
//  ['{310807B8-2BBF-4918-A2AC-80BE3BD7A144}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu2 = class(TJavaGenericImport<Ju2Class, Ju2>) end;

//  Ju3Class = interface(JObjectClass)
//  ['{F0DAF0AF-92C3-446F-8416-797FB3A0EC83}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl; overload;
//    {class} function a(P1: Jp): Jp; cdecl; overload;
//    {class} function a(P1: Jp; P2: Single): Jp; cdecl; overload;
//    {class} function a(P1: Boolean; P2: Jp; P3: Single): Jp; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u3')]
//  Ju3 = interface(JObject)
//  ['{ADD530FA-A2C9-4EBA-9470-F50A501C2D1D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu3 = class(TJavaGenericImport<Ju3Class, Ju3>) end;

//  Ju4Class = interface(JObjectClass)
//  ['{EAF0AA8D-AF8A-4194-82F9-7B4789670B89}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js; P2: JList): Ju4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u4')]
//  Ju4 = interface(JObject)
//  ['{EDFB27E5-9464-4CF3-8B07-7E5F86CC27F9}']
//    { Property Methods }
//
//    { methods }
//    function a: Js; cdecl;
//    function b: JList; cdecl;
//
//    { Property }
//  end;

//  TJu4 = class(TJavaGenericImport<Ju4Class, Ju4>) end;

//  Ju5Class = interface(JObjectClass)
//  ['{67E4C777-AC3A-452B-B620-6D175DCC23BC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jy2): Ju5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u5')]
//  Ju5 = interface(JObject)
//  ['{F894CD6D-E1EE-475C-BD58-EB9761F6E2A5}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Integer>; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJu5 = class(TJavaGenericImport<Ju5Class, Ju5>) end;

//  Ju6Class = interface(Js6Class) // or JObjectClass
//  ['{2E019678-DBBA-46BD-BEBE-C1947354FF98}']
//    { static Property Methods }
//    {class} function _Getj: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Ju6; cdecl;
//    {class} function b(P1: JString): JString; cdecl;
//
//    { static Property }
//    {class} property j: TJavaArray<TJavaArray<Integer>> read _Getj;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u6')]
//  Ju6 = interface(Js6) // or JObject
//  ['{486DCF0F-DC58-444E-AA7C-4E45EF6D4D88}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Jr): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJu6 = class(TJavaGenericImport<Ju6Class, Ju6>) end;

//  JvClass = interface(JObjectClass)
//  ['{2087B298-82CA-4585-985D-A0EC6DCA7A16}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>): Jv; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v')]
//  Jv = interface(JObject)
//  ['{AB8AE485-0614-42A2-9F20-DF47BCEDE97A}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function a(P1: Integer): Integer; cdecl; overload;
//    function a: Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJv = class(TJavaGenericImport<JvClass, Jv>) end;

//  Jv0Class = interface(JEnumClass) // or JObjectClass
//  ['{BB6826CD-E148-4330-8856-5D63F9975E61}']
//    { static Property Methods }
//    {class} function _Geta: Jv0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jv0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jv0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jv0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jv0>; cdecl;
//    {class} function valueOf(P1: JString): Jv0; cdecl;
//
//    { static Property }
//    {class} property a: Jv0 read _Geta;
//    {class} property b: Jv0 read _Getb;
//    {class} property c: Jv0 read _Getc;
//    {class} property d: Jv0 read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v0')]
//  Jv0 = interface(JEnum) // or JObject
//  ['{06E34041-5ED5-4654-A8B4-55AA969D2A0E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJv0 = class(TJavaGenericImport<Jv0Class, Jv0>) end;

//  Jv1Class = interface(JObjectClass)
//  ['{A5F5AEB6-2EDE-49FD-B4FE-CF517933CAB0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Jv1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v1')]
//  Jv1 = interface(JObject)
//  ['{C871C1FA-F599-4DC5-B6A6-14494E0B49CB}']
//    { Property Methods }
//
//    { methods }
//    function a: Jz1; cdecl;
//
//    { Property }
//  end;

//  TJv1 = class(TJavaGenericImport<Jv1Class, Jv1>) end;

//  Jv2Class = interface(JObjectClass)
//  ['{0D106367-610C-4D6A-8665-716E54919788}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaObjectArray<Jt2>): Jv2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v2')]
//  Jv2 = interface(JObject)
//  ['{7228D2B8-1AB7-4846-8063-0751207C6DC9}']
//    { Property Methods }
//
//    { methods }
//    function a: Jt2; cdecl;
//    function b: Jt2; cdecl;
//    function c: Jt2; cdecl;
//
//    { Property }
//  end;

//  TJv2 = class(TJavaGenericImport<Jv2Class, Jv2>) end;

//  Jv3Class = interface(JObjectClass)
//  ['{0777643D-9E71-4F4E-8141-05A916387220}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jv3; cdecl;
//    {class} function h(P1: Jp): Jp; cdecl; overload;
//    {class} function a(P1: Jp): Jp; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v3')]
//  Jv3 = interface(JObject)
//  ['{5D677DCA-1791-4F8D-89E8-E6068F2F3BD8}']
//    { Property Methods }
//
//    { methods }
//    function e(P1: Jp; P2: Single): Jp; cdecl; overload;
//    function a(P1: Jp; P2: Single): Jp; cdecl; overload;
//    function b(P1: Jp; P2: Single): Jp; cdecl; overload;
//    function d(P1: Jp): Jp; cdecl; overload;
//    function b(P1: Jp): Jp; cdecl; overload;
//    function c(P1: Jp): Jp; cdecl; overload;
//    function d(P1: Jp; P2: Single): Jp; cdecl; overload;
//    function h(P1: Jp; P2: Single): Jp; cdecl; overload;
//    function c(P1: Jp; P2: Single): Jp; cdecl; overload;
//    function g(P1: Jp; P2: Single): Jp; cdecl; overload;
//    function g(P1: Jp): Jp; cdecl; overload;
//    function f(P1: Jp; P2: Single): Jp; cdecl; overload;
//    function e(P1: Jp): Jp; cdecl; overload;
//    function f(P1: Jp): Jp; cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJv3 = class(TJavaGenericImport<Jv3Class, Jv3>) end;

//  Jv4Class = interface(JObjectClass)
//  ['{9D4F8332-D2A1-47AD-9B08-4268603D90E3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v4')]
//  Jv4 = interface(JObject)
//  ['{3C75331B-6471-4B13-85DF-C759111D9126}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJv4 = class(TJavaGenericImport<Jv4Class, Jv4>) end;

//  Jv5Class = interface(JObjectClass)
//  ['{34AD64D7-359F-4B04-806C-23F7267998F8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jv5; cdecl;
//    {class} function a: Jv5; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v5')]
//  Jv5 = interface(JObject)
//  ['{7442B905-E20A-4ABE-85CF-4DC3F95115D3}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: JBitmap; P2: Integer; P3: Boolean; P4: Jg3): TJavaObjectArray<JHmsScan>; cdecl;
//    function a(P1: JBitmap; P2: Integer; P3: Boolean; P4: Jg3): TJavaObjectArray<JHmsScan>; cdecl; overload;
//    function a(P1: JByteBuffer; P2: Integer; P3: Integer; P4: Integer; P5: Boolean; P6: Jg3): TJavaObjectArray<JHmsScan>; cdecl; overload;
//
//    { Property }
//  end;

//  TJv5 = class(TJavaGenericImport<Jv5Class, Jv5>) end;

//  Jv6Class = interface(Jt6Class) // or JObjectClass
//  ['{4621E728-F092-424D-8822-B1814146E759}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jv6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v6')]
//  Jv6 = interface(Jt6) // or JObject
//  ['{4F561075-8BBA-4A9C-935D-4E261CA9D5EB}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJv6 = class(TJavaGenericImport<Jv6Class, Jv6>) end;

//  JwClass = interface(Jx5Class) // or JObjectClass
//  ['{E08E000A-2295-4032-BE25-D528B887869E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w')]
//  Jw = interface(Jx5) // or JObject
//  ['{77E4ABC2-F576-4A53-AF1E-4B5EA765A465}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJw = class(TJavaGenericImport<JwClass, Jw>) end;

//  Jw0Class = interface(JObjectClass)
//  ['{16D45ED7-CE33-4444-9D25-D5420133F5B5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Boolean): Jw0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w0')]
//  Jw0 = interface(JObject)
//  ['{24ECAEED-4559-48E9-BA64-3F047B0833BE}']
//    { Property Methods }
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//  end;

//  TJw0 = class(TJavaGenericImport<Jw0Class, Jw0>) end;

//  Jw1Class = interface(JObjectClass)
//  ['{BC586CDF-5073-4CBA-9FDD-3B30FDDE1C69}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Jp; P2: JMap; P3: Boolean): Ju4; cdecl; overload;
//    {class} procedure a(P1: Boolean); cdecl; overload;
//    {class} function a: Boolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w1')]
//  Jw1 = interface(JObject)
//  ['{8E1331EB-1541-42BE-BE25-17D467C4CCF9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw1 = class(TJavaGenericImport<Jw1Class, Jw1>) end;

//  Jw2Class = interface(JObjectClass)
//  ['{F60672D8-8285-46E9-BCB7-1C43E3DC4378}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w2')]
//  Jw2 = interface(JObject)
//  ['{54A4E151-BC2A-450A-A0A3-D2487D1CECA9}']
//    { Property Methods }
//
//    { methods }
//    function hashCode: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJw2 = class(TJavaGenericImport<Jw2Class, Jw2>) end;

//  Jw3Class = interface(Jx5Class) // or JObjectClass
//  ['{CA849179-3771-4148-A04B-1CBE8CA141BF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3')]
//  Jw3 = interface(Jx5) // or JObject
//  ['{718F1CF1-4097-4C7F-9E32-80FDA1EBB951}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJw3 = class(TJavaGenericImport<Jw3Class, Jw3>) end;

//  Jw4_aClass = interface(JObjectClass)
//  ['{DC3E4EF2-8AB1-48FA-92AA-0D6A48782A50}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w4$a')]
//  Jw4_a = interface(JObject)
//  ['{9FF7E679-C29E-4F96-B0A4-CF2ACE12EAF0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw4_a = class(TJavaGenericImport<Jw4_aClass, Jw4_a>) end;

//  Jw4Class = interface(JObjectClass)
//  ['{2FADFE98-92F8-4D26-9DDD-F3C011F6D720}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w4')]
//  Jw4 = interface(JObject)
//  ['{467278B9-5B81-4B1E-946F-A2EE1FD8A273}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw4 = class(TJavaGenericImport<Jw4Class, Jw4>) end;

//  Jw5_aClass = interface(JObjectClass)
//  ['{649E023D-6F70-4BEF-9261-53E602494744}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w5$a')]
//  Jw5_a = interface(JObject)
//  ['{78787C53-1C33-4520-B048-189D5CBB87AA}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JParcel): Jw5; cdecl; overload;
//    function a(P1: Integer): TJavaObjectArray<Jw5>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl;
//    function createFromParcel(P1: JParcel): JObject; cdecl;
//
//    { Property }
//  end;

//  TJw5_a = class(TJavaGenericImport<Jw5_aClass, Jw5_a>) end;

//  Jw5Class = interface(JObjectClass)
//  ['{6D969E84-181E-42ED-8812-11CFB6E8DFE1}']
//    { static Property Methods }
//    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Single): Jw5; cdecl; overload;
//    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: TJavaObjectArray<Jy5>; P4: JBarcodeFormat): Jw5; cdecl; overload;
//    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: TJavaObjectArray<Jy5>; P4: JBarcodeFormat; P5: Int64): Jw5; cdecl; overload;
//    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaObjectArray<Jy5>; P5: JBarcodeFormat; P6: Int64): Jw5; cdecl; overload;
//
//    { static Property }
//    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w5')]
//  Jw5 = interface(JObject)
//  ['{5A567E85-7EF2-41B7-B378-5A8ACFF6F12E}']
//    { Property Methods }
//
//    { methods }
//    procedure c(P1: Boolean); cdecl; overload;
//    function l: Single; cdecl;
//    procedure a(P1: Single); cdecl; overload;
//    procedure b(P1: Single); cdecl; overload;
//    function f: Integer; cdecl;
//    procedure a(P1: Jy1); cdecl; overload;
//    procedure b(P1: Jy1); cdecl; overload;
//    function n: Boolean; cdecl;
//    procedure b(P1: Boolean); cdecl; overload;
//    function h: Integer; cdecl;
//    procedure a(P1: Integer); cdecl; overload;
//    function d: JList; cdecl;
//    function g: JList; cdecl;
//    function k: JString; cdecl;
//    function i: TJavaArray<Byte>; cdecl;
//    function j: TJavaObjectArray<Jy5>; cdecl;
//    function c: JBarcodeFormat; cdecl; overload;
//    procedure a(P1: TJavaObjectArray<Jy5>); cdecl; overload;
//    function e: Int64; cdecl;
//    procedure b(P1: Int64); cdecl; overload;
//    function b: Int64; cdecl; overload;
//    procedure a(P1: Int64); cdecl; overload;
//    function m: Boolean; cdecl;
//    procedure a(P1: Boolean); cdecl; overload;
//    function toString: JString; cdecl;
//    procedure a; cdecl; overload;
//    procedure b(P1: TJavaObjectArray<Jy5>); cdecl; overload;
//    function describeContents: Integer; cdecl;
//    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJw5 = class(TJavaGenericImport<Jw5Class, Jw5>) end;

//  Jw6Class = interface(Jx5Class) // or JObjectClass
//  ['{00B26A7C-8D70-43F8-A5A1-586FB310A05B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w6')]
//  Jw6 = interface(Jx5) // or JObject
//  ['{F0C8FE12-49A4-46DC-9029-369576E436B0}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJw6 = class(TJavaGenericImport<Jw6Class, Jw6>) end;

//  JxClass = interface(JObjectClass)
//  ['{1C6D401B-468F-41BF-AF63-DBCF2CC694F2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x')]
//  Jx = interface(JObject)
//  ['{114E5022-1454-43D7-9A50-837C9584215E}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaArray<Byte>; cdecl;
//    function b: TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;

//  TJx = class(TJavaGenericImport<JxClass, Jx>) end;

//  Jx0Class = interface(JObjectClass)
//  ['{76A57417-CD57-4AB6-9E23-53BC5CFA4221}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Single; P4: Single): Jx0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x0')]
//  Jx0 = interface(JObject)
//  ['{DDC75799-8845-4D34-898A-08F9B56E7C98}']
//    { Property Methods }
//
//    { methods }
//    function getInterpolation(P1: Single): Single; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJx0 = class(TJavaGenericImport<Jx0Class, Jx0>) end;

//  Jx1Class = interface(JObjectClass)
//  ['{132E9401-4A36-463F-9E5C-F7CCB8345432}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Jx1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x1')]
//  Jx1 = interface(JObject)
//  ['{BB6F93A7-4B1B-4058-9627-8EAC7269A427}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JMap): Jz1; cdecl;
//
//    { Property }
//  end;

//  TJx1 = class(TJavaGenericImport<Jx1Class, Jx1>) end;

//  Jx2Class = interface(JObjectClass)
//  ['{01B86FDD-D21B-43C0-A762-C67CD4EE3693}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): JList; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x2')]
//  Jx2 = interface(JObject)
//  ['{F0FA0778-1231-47A0-B2F9-0EED91C32537}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJx2 = class(TJavaGenericImport<Jx2Class, Jx2>) end;

//  Jx3Class = interface(JObjectClass)
//  ['{2713C4EA-FD54-4AE7-9DC9-B6FE05DDDB86}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JString; P2: JString); cdecl; overload;
//    {class} procedure c(P1: JString; P2: JString); cdecl;
//    {class} procedure d(P1: JString; P2: JString); cdecl;
//    {class} procedure a(P1: JString; P2: JString; P3: JThrowable); cdecl; overload;
//    {class} procedure b(P1: JString; P2: JString); cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x3')]
//  Jx3 = interface(JObject)
//  ['{5080F652-2760-43AC-9A16-366FFBD9FECA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJx3 = class(TJavaGenericImport<Jx3Class, Jx3>) end;

//  Jx4Class = interface(JObjectClass)
//  ['{B0E16211-9104-4758-A4AF-D3BD4823A2F2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jx4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x4')]
//  Jx4 = interface(JObject)
//  ['{A08E9FB2-C156-454B-B141-6AC5625C1FF7}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Jw5; cdecl;
//
//    { Property }
//  end;

//  TJx4 = class(TJavaGenericImport<Jx4Class, Jx4>) end;

//  Jx5Class = interface(JObjectClass)
//  ['{0589A823-D2B9-4109-BD68-CA63F6659F09}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jx5; cdecl;
//    {class} function c(P1: Jw5): JHmsScan; cdecl;
//    {class} function a(P1: TJavaObjectArray<Jw5>): TJavaObjectArray<JHmsScan>; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x5')]
//  Jx5 = interface(JObject)
//  ['{1C743FF0-4BE8-4A12-9EC1-FF6D6EE416AD}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJx5 = class(TJavaGenericImport<Jx5Class, Jx5>) end;

//  Jx6Class = interface(JObjectClass)
//  ['{97E2616C-49AC-4A7E-BE94-25F3E2CB0FD0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JList): JList; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<Jy5>; P2: TJavaObjectArray<Jy5>): Single; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x6')]
//  Jx6 = interface(JObject)
//  ['{79B07365-DC97-450A-A9E2-D49413215E9C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJx6 = class(TJavaGenericImport<Jx6Class, Jx6>) end;

//  JyClass = interface(Jx5Class) // or JObjectClass
//  ['{A92977C9-E609-4136-B9C4-8A56619AC25A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jy; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y')]
//  Jy = interface(Jx5) // or JObject
//  ['{CFD78535-41D8-430C-A6D7-6C3116E8C6F7}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJy = class(TJavaGenericImport<JyClass, Jy>) end;

//  Jy0Class = interface(JObjectClass)
//  ['{C8D1680D-DF5B-4106-9223-0FB56F0EC170}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y0')]
//  Jy0 = interface(JObject)
//  ['{9F65AB33-272C-492A-8069-44B610192208}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJy0 = class(TJavaGenericImport<Jy0Class, Jy0>) end;

//  Jy1Class = interface(JObjectClass)
//  ['{B9E75131-3E82-4DFA-9768-F56045C3E976}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Boolean; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single): Jy1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y1')]
//  Jy1 = interface(JObject)
//  ['{B10C245B-1116-443F-9258-6B4179D056C0}']
//    { Property Methods }
//    function _Getl: Jp;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Jp);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getm: TJavaArray<Single>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setm(am: TJavaArray<Single>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getn: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setn(an: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Geto: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seto(ao: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getp: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setp(ap: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getq: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setq(aq: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getr: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setr(ar: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gets: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sets(as: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Gett: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Sett(at: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getu: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setu(au: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getv: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setv(av: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function d: Single; cdecl;
//    function e: Single; cdecl;
//    function f: Single; cdecl;
//    function c: Single; cdecl;
//    function j: Single; cdecl;
//    function k: Single; cdecl;
//    function h: Single; cdecl;
//    function i: Single; cdecl;
//    function g: Single; cdecl;
//    function l: Single; cdecl;
//    function m: Single; cdecl;
//    procedure a(P1: Integer; P2: Integer; P3: Single; P4: Single); cdecl; overload;
//    procedure a(P1: Single; P2: Single); cdecl; overload;
//    procedure b(P1: Single; P2: Single); cdecl; overload;
//    function b: Single; cdecl; overload;
//    function a: Single; cdecl; overload;
//    function n: Single; cdecl;
//    function a(P1: Jy1): Integer; cdecl; overload;
//    function compareTo(P1: JObject): Integer; cdecl;
//
//    { Property }
//    property l: Jp read _Getl write _Setl;
//    property m: TJavaArray<Single> read _Getm write _Setm;
//    property n: Single read _Getn write _Setn;
//    property o: Single read _Geto write _Seto;
//    property p: Integer read _Getp write _Setp;
//    property q: Integer read _Getq write _Setq;
//    property r: Integer read _Getr write _Setr;
//    property s: Integer read _Gets write _Sets;
//    property t: Integer read _Gett write _Sett;
//    property u: Integer read _Getu write _Setu;
//    property v: Single read _Getv write _Setv;
//  end;

//  TJy1 = class(TJavaGenericImport<Jy1Class, Jy1>) end;

//  Jy2Class = interface(JObjectClass)
//  ['{4AAD40D0-693B-4C44-AD69-D3446E6A9841}']
//    { static Property Methods }
//    {class} function _Geth: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: Jy2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: Integer): Jy2; cdecl;
//
//    { static Property }
//    {class} property h: Jy2 read _Geth;
//    {class} property i: Jy2 read _Geti;
//    {class} property j: Jy2 read _Getj;
//    {class} property k: Jy2 read _Getk;
//    {class} property l: Jy2 read _Getl;
//    {class} property m: Jy2 read _Getm;
//    {class} property n: Jy2 read _Getn;
//    {class} property o: Jy2 read _Geto;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y2')]
//  Jy2 = interface(JObject)
//  ['{578290C5-EC8B-488E-835A-637AE2E6AFD7}']
//    { Property Methods }
//
//    { methods }
//    function c: Integer; cdecl;
//    function a: Integer; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJy2 = class(TJavaGenericImport<Jy2Class, Jy2>) end;

//  Jy3Class = interface(JObjectClass)
//  ['{C15CAD97-975F-4EFB-A92B-FFE661195F3A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y3')]
//  Jy3 = interface(JObject)
//  ['{A72E9830-58D2-477A-A61D-3E58D0DB0E56}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    function b: TJavaArray<Byte>; cdecl; overload;
//    function c: Integer; cdecl;
//    function a: Integer; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jy3; cdecl; overload;
//    function toString: JString; cdecl;
//    function b(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jy3; cdecl; overload;
//
//    { Property }
//  end;

//  TJy3 = class(TJavaGenericImport<Jy3Class, Jy3>) end;

//  Jy4Class = interface(JObjectClass)
//  ['{972B847E-6484-4B8E-9B17-AF8B37E80703}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jy4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y4')]
//  Jy4 = interface(JObject)
//  ['{CD2A6282-FCE4-4B7E-B8B7-6DD8106CF65D}']
//    { Property Methods }
//
//    { methods }
//    procedure c(P1: Integer); cdecl; overload;
//    procedure b(P1: JString); cdecl; overload;
//    procedure a(P1: TJavaArray<Integer>); cdecl; overload; //Deprecated
//    function a: Boolean; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure b(P1: Integer); cdecl; overload;
//    procedure d(P1: JString); cdecl;
//    procedure a(P1: JString); cdecl; overload;
//    procedure c(P1: JString); cdecl; overload;
//    procedure a(P1: Int64); cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    procedure b(P1: Int64); cdecl; overload;
//
//    { Property }
//  end;

//  TJy4 = class(TJavaGenericImport<Jy4Class, Jy4>) end;

//  Jy5_aClass = interface(JObjectClass)
//  ['{378D8C6C-9DC6-439F-89CE-D1650FC587E5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y5$a')]
//  Jy5_a = interface(JObject)
//  ['{7F8F8CC5-7A3C-4A8A-8B06-BE78285827D6}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JParcel): Jy5; cdecl; overload;
//    function a(P1: Integer): TJavaObjectArray<Jy5>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl;
//    function createFromParcel(P1: JParcel): JObject; cdecl;
//
//    { Property }
//  end;

//  TJy5_a = class(TJavaGenericImport<Jy5_aClass, Jy5_a>) end;

//  Jy5Class = interface(JObjectClass)
//  ['{8CDD9B58-3FA4-47FF-87DE-D99052512419}']
//    { static Property Methods }
//    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Integer): Jy5; cdecl; overload;
//    {class} function init(P1: Single; P2: Single): Jy5; cdecl; overload;
//    {class} function init(P1: Single; P2: Single; P3: Boolean): Jy5; cdecl; overload;
//    {class} procedure a(P1: TJavaObjectArray<Jy5>); cdecl; overload;
//    {class} function a(P1: Jy5; P2: Jy5): Single; cdecl; overload;
//
//    { static Property }
//    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y5')]
//  Jy5 = interface(JObject)
//  ['{DB6EB9F5-5B1F-46F5-842A-A69AC2A6FCF5}']
//    { Property Methods }
//
//    { methods }
//    function b: Single; cdecl;
//    function c: Single; cdecl;
//    function a: Integer; cdecl; overload;
//    function d: Boolean; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//    function describeContents: Integer; cdecl;
//    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJy5 = class(TJavaGenericImport<Jy5Class, Jy5>) end;

//  Jy6Class = interface(JObjectClass)
//  ['{C7CE2FAB-9519-4E34-92EF-6638C8C585F5}']
//    { static Property Methods }
//    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Integer>; P2: Integer): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaArray<Integer>; P2: Integer): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<JString>; P2: Integer): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaArray<Single>; P2: Integer): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<JHmsScan>): TJavaObjectArray<JHmsScan>; cdecl; overload;
//    {class} function a(P1: Integer): Integer; cdecl; overload;
//    {class} function b(P1: Integer): Integer; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: Integer; P3: Integer): JBitmap; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: Single; P3: Single): JBitmap; cdecl; overload;
//    {class} function a(P1: JContext; P2: JString): Integer; cdecl; overload;
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function j(P1: JContext): Boolean; cdecl;
//    {class} function c(P1: JContext): Integer; cdecl; overload;
//    {class} function a(P1: JIntent; P2: JString; P3: JActivity): JResolveInfo; cdecl; overload;
//    {class} function a(P1: JString; P2: JActivity): Boolean; cdecl; overload;
//    {class} function f(P1: JContext): Boolean; cdecl;
//    {class} function b: Boolean; cdecl; overload;
//    {class} function d: Boolean; cdecl; overload;
//    {class} function a(P1: JActivity): Integer; cdecl; overload;
//    {class} function e(P1: JContext): Boolean; cdecl; overload;
//    {class} function d(P1: JContext): Boolean; cdecl; overload;
//    {class} function b(P1: JActivity): Boolean; cdecl; overload;
//    {class} function a(P1: JContext): Boolean; cdecl; overload;
//    {class} function b(P1: JContext): Boolean; cdecl; overload;
//    {class} function c(P1: JActivity): Boolean; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: Single): JBitmap; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: Integer): JBitmap; cdecl; overload;
//    {class} function a(P1: JContext; P2: JIntent): JBitmap; cdecl; overload;
//    {class} function a(P1: JContext; P2: JUri): JBitmap; cdecl; overload;
//    {class} function a(P1: JInputStream): TJavaArray<Byte>; cdecl; overload;
//    {class} function i(P1: JContext): Boolean; cdecl;
//    {class} function g(P1: JContext): Boolean; cdecl;
//    {class} function h(P1: JContext): Boolean; cdecl;
//    {class} function e: Boolean; cdecl; overload;
//    {class} function c: Boolean; cdecl; overload;
//
//    { static Property }
//    {class} property c: Boolean read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y6')]
//  Jy6 = interface(JObject)
//  ['{22B5EB87-9703-4FE6-BC0B-68757D5A89DE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJy6 = class(TJavaGenericImport<Jy6Class, Jy6>) end;

//  JzClass = interface(JObjectClass)
//  ['{12C21498-1A91-40AF-997D-7B67C4FEDDD3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z')]
//  Jz = interface(JObject)
//  ['{947BB174-C44B-4C69-BC2B-11BFA5D4F562}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz = class(TJavaGenericImport<JzClass, Jz>) end;

//  Jz0Class = interface(JObjectClass)
//  ['{BB20B716-CB1C-4541-A732-FC75D72C8CF1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z0')]
//  Jz0 = interface(JObject)
//  ['{D265CAF4-A12F-4716-A1C9-FAB885B9EBCA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz0 = class(TJavaGenericImport<Jz0Class, Jz0>) end;

//  Jz1Class = interface(JObjectClass)
//  ['{6458C97C-747E-4231-9A25-AB04FBCFFCDD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js; P2: TJavaObjectArray<Jy5>): Jz1; cdecl; overload;
//    {class} function init(P1: Js; P2: TJavaObjectArray<Jy5>; P3: TJavaObjectArray<Jy5>; P4: Single): Jz1; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z1')]
//  Jz1 = interface(JObject)
//  ['{CE55A4D1-7AFF-4814-9C56-EDB8C6BBD194}']
//    { Property Methods }
//
//    { methods }
//    function b: TJavaObjectArray<Jy5>; cdecl;
//    function c: Single; cdecl;
//    function a: Js; cdecl;
//    function d: TJavaObjectArray<Jy5>; cdecl;
//
//    { Property }
//  end;

//  TJz1 = class(TJavaGenericImport<Jz1Class, Jz1>) end;

//  Jz2Class = interface(JObjectClass)
//  ['{A8EF8322-AFF5-43EE-90F4-87F86D57F0EC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z2')]
//  Jz2 = interface(JObject)
//  ['{FDB3954D-D3A8-4A43-BC10-34BD13E27D2A}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJz2 = class(TJavaGenericImport<Jz2Class, Jz2>) end;

//  Jz3Class = interface(Jx5Class) // or JObjectClass
//  ['{5453AF45-655A-4CAB-A2A3-FF00D4C9BE07}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jz3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z3')]
//  Jz3 = interface(Jx5) // or JObject
//  ['{15BE635C-FF9D-433B-9FC2-231AB9596773}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJz3 = class(TJavaGenericImport<Jz3Class, Jz3>) end;

//  Jz4Class = interface(JObjectClass)
//  ['{5C5F0015-E846-4FF7-BEB2-4E0106BDDF1D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Js; P2: Jy5; P3: Jy5; P4: Jy5; P5: Jy5; P6: Integer; P7: Integer; P8: JMap): Jo1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z4')]
//  Jz4 = interface(JObject)
//  ['{EF9814F3-EE70-44C8-8F05-160EE56B8BAE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz4 = class(TJavaGenericImport<Jz4Class, Jz4>) end;

//  Jz5Class = interface(JObjectClass)
//  ['{EFDF7CA4-98F4-4592-8D64-18269B214AE2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z5')]
//  Jz5 = interface(IJavaInstance)
//  ['{45E4C282-8F95-4142-BBDA-9627A1B5D56F}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jy5); cdecl;
//
//    { Property }
//  end;

//  TJz5 = class(TJavaGenericImport<Jz5Class, Jz5>) end;

//  Jz6Class = interface(Jx5Class) // or JObjectClass
//  ['{123ABC6E-E6BE-45DB-8FD5-3239C10D7B3F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jz6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z6')]
//  Jz6 = interface(Jx5) // or JObject
//  ['{3CFC2886-2AF3-4E10-9E1D-389D548A340B}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Jw5): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJz6 = class(TJavaGenericImport<Jz6Class, Jz6>) end;

//  JProviderRemoteViewClass = interface(JLinearLayoutClass) // or JObjectClass
//  ['{68F59AAE-DE4C-4E6D-B2A8-CBC9A28F5AC6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Boolean; P3: Boolean): JProviderRemoteView; cdecl; overload;
//    {class} function init(P1: JContext; P2: Boolean): JProviderRemoteView; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/huawei/hms/scankit/ProviderRemoteView')]
//  JProviderRemoteView = interface(JLinearLayout) // or JObject
//  ['{8FB28BE2-72D7-44AA-A570-A85C45DE8DBB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJProviderRemoteView = class(TJavaGenericImport<JProviderRemoteViewClass, JProviderRemoteView>) end;

  JLoadOpencvJNIUtilClass = interface(JObjectClass)
  ['{434921E1-8B53-4A45-8AF2-5113CB089B23}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLoadOpencvJNIUtil; cdecl;
    {class} function QuadFitting(P1: TJavaArray<Single>; P2: Integer; P3: TJavaArray<Single>): TJavaArray<Single>; cdecl;
    {class} procedure setModel(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: Integer); cdecl;
    {class} function adaptivebinary(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): TJavaArray<Byte>; cdecl;
    {class} function multiBarcodeDetect(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Boolean): TJavaArray<Single>; cdecl;
    {class} function imageRotate(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Single; P7: Double): TJavaArray<Byte>; cdecl;
    {class} function imageResize(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer): TJavaArray<Byte>; cdecl;
    {class} function QRCornerDetect(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Single>): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/util/LoadOpencvJNIUtil')]
  JLoadOpencvJNIUtil = interface(JObject)
  ['{7865CE23-4B3C-445D-8ACD-5266DDCDC5C4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLoadOpencvJNIUtil = class(TJavaGenericImport<JLoadOpencvJNIUtilClass, JLoadOpencvJNIUtil>) end;

  JOpencvJNIClass = interface(JObjectClass)
  ['{B1D22DFC-25F3-4242-85FF-95CDF22EDF87}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOpencvJNI; cdecl; overload;
//    {class} procedure init; cdecl; overload;
    {class} function QuadFitting(P1: TJavaArray<Single>; P2: Integer; P3: TJavaArray<Single>): TJavaArray<Single>; cdecl;
    {class} function multiBarcodeDetect(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Boolean): TJavaArray<Single>; cdecl;
    {class} procedure setModel(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: Integer); cdecl;
    {class} function imageResize(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer): TJavaArray<Byte>; cdecl;
    {class} function imageRotate(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Single; P7: Double): TJavaArray<Byte>; cdecl;
    {class} function adaptiveBinary(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): TJavaArray<Byte>; cdecl;
    {class} function QRCornerDetect(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Single>): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/util/OpencvJNI')]
  JOpencvJNI = interface(JObject)
  ['{18B52BA6-BACB-4918-8CDF-9B129EDF6F78}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOpencvJNI = class(TJavaGenericImport<JOpencvJNIClass, JOpencvJNI>) end;

//  JViewfinderView_aClass = interface(JObjectClass)
//  ['{F3997D49-54F5-4C1C-BE0A-ACC0F5ECBBE5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/ViewfinderView$a')]
//  JViewfinderView_a = interface(JObject)
//  ['{8967C04B-5415-4447-8DFD-1064886B0484}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(P1: JValueAnimator); cdecl;
//
//    { Property }
//  end;

//  TJViewfinderView_a = class(TJavaGenericImport<JViewfinderView_aClass, JViewfinderView_a>) end;

//  JViewfinderView_bClass = interface(JEnumClass) // or JObjectClass
//  ['{8B8B652C-C376-4293-9C4B-04959327FF44}']
//    { static Property Methods }
//    {class} function _Getb: JViewfinderView_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JViewfinderView_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JViewfinderView_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<JViewfinderView_b>; cdecl;
//    {class} function valueOf(P1: JString): JViewfinderView_b; cdecl;
//
//    { static Property }
//    {class} property b: JViewfinderView_b read _Getb;
//    {class} property c: JViewfinderView_b read _Getc;
//    {class} property d: JViewfinderView_b read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/ViewfinderView$b')]
//  JViewfinderView_b = interface(JEnum) // or JObject
//  ['{E6B20C5F-6DB4-4579-ABA5-04C0FBE02770}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJViewfinderView_b = class(TJavaGenericImport<JViewfinderView_bClass, JViewfinderView_b>) end;

//  JViewfinderView_cClass = interface(JEnumClass) // or JObjectClass
//  ['{E20C78CB-7C5A-40C5-8CBD-400B274E18E3}']
//    { static Property Methods }
//    {class} function _Getb: JViewfinderView_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JViewfinderView_c;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<JViewfinderView_c>; cdecl;
//    {class} function valueOf(P1: JString): JViewfinderView_c; cdecl;
//
//    { static Property }
//    {class} property b: JViewfinderView_c read _Getb;
//    {class} property c: JViewfinderView_c read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/ViewfinderView$c')]
//  JViewfinderView_c = interface(JEnum) // or JObject
//  ['{944F5DB4-DA07-4FF7-9008-5DF53E335BF0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJViewfinderView_c = class(TJavaGenericImport<JViewfinderView_cClass, JViewfinderView_c>) end;

  JViewfinderViewClass = interface(JViewClass) // or JObjectClass
  ['{93F2EB05-3157-49DD-9E3A-E046BBCD8CF2}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JViewfinderView; cdecl; overload;
    {class} function init(P1: JContext; P2: JAttributeSet): JViewfinderView; cdecl; overload;
    {class} function init(P1: JContext; P2: JAttributeSet; P3: Integer): JViewfinderView; cdecl; overload;
    {class} function b(P1: JContext; P2: Integer): Integer; cdecl;
    {class} function a(P1: JContext; P2: Integer): Integer; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/ViewfinderView')]
  JViewfinderView = interface(JView) // or JObject
  ['{494C8074-CE70-49CA-9122-9EDD23EB3114}']
    { Property Methods }
    function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setm(am: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setn(an: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure onDraw(P1: JCanvas); cdecl;
//    procedure a(P1: Jy5); cdecl; overload;
    procedure a; cdecl; overload;
    procedure a(P1: JRect; P2: Boolean; P3: JPoint); cdecl; overload;

    { Property }
    property m: Integer read _Getm write _Setm;
    property n: Integer read _Getn write _Setn;
  end;

  TJViewfinderView = class(TJavaGenericImport<JViewfinderViewClass, JViewfinderView>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JDynamicModuleInitializer',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JDynamicModuleInitializer));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnErrorCallback_Default',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnErrorCallback_Default));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnErrorCallback_Stub_Proxy',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnErrorCallback_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnErrorCallback_Stub',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnErrorCallback_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnErrorCallback',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnErrorCallback));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnLightCallback_Default',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnLightCallback_Default));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnLightCallback_Stub_Proxy',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnLightCallback_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnLightCallback_Stub',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnLightCallback_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnLightCallback',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnLightCallback));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnResultCallback_Default',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnResultCallback_Default));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnResultCallback_Stub_Proxy',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnResultCallback_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnResultCallback_Stub',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnResultCallback_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnResultCallback',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIOnResultCallback));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteCreator_Default',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteCreator_Default));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteCreator_Stub_Proxy',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteCreator_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteCreator_Stub',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteCreator_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteCreator',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteCreator));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderCreator_Default',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderCreator_Default));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderCreator_Stub_Proxy',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderCreator_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderCreator_Stub',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderCreator_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderCreator',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderCreator));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderDelegate_Default',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderDelegate_Default));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderDelegate_Stub_Proxy',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderDelegate_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderDelegate_Stub',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderDelegate_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderDelegate',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteDecoderDelegate));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteFrameDecoderDelegate_Default',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteFrameDecoderDelegate_Default));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteFrameDecoderDelegate_Stub_Proxy',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteFrameDecoderDelegate_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteFrameDecoderDelegate_Stub',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteFrameDecoderDelegate_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteFrameDecoderDelegate',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteFrameDecoderDelegate));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteHmsDecoderDelegate_Default',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteHmsDecoderDelegate_Default));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteHmsDecoderDelegate_Stub_Proxy',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteHmsDecoderDelegate_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteHmsDecoderDelegate_Stub',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteHmsDecoderDelegate_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteHmsDecoderDelegate',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteHmsDecoderDelegate));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteViewDelegate_Default',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteViewDelegate_Default));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteViewDelegate_Stub_Proxy',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteViewDelegate_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteViewDelegate_Stub',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteViewDelegate_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteViewDelegate',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JIRemoteViewDelegate));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JDetailRect_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JDetailRect_a));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JDetailRect',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JDetailRect));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JOnErrorCallback',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JOnErrorCallback));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JOnLightVisibleCallBack',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JOnLightVisibleCallBack));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JOnResultCallback',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JOnResultCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView_a_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView_a_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView_a_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView_a_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView_b));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView_Builder',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JRemoteView));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanKitActivity_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanKitActivity_1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanKitActivity_2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanKitActivity_2));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanKitActivity',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanKitActivity));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanUtil',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanUtil));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JWriterException',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JWriterException));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsBuildBitmapOption_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsBuildBitmapOption_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsBuildBitmapOption_Creator',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsBuildBitmapOption_Creator));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsBuildBitmapOption_ErrorCorrectionLevel',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsBuildBitmapOption_ErrorCorrectionLevel));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsBuildBitmapOption',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsBuildBitmapOption));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_AddressInfo_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_AddressInfo_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_AddressInfo_ADDRESS_TYPE',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_AddressInfo_ADDRESS_TYPE));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_AddressInfo',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_AddressInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_ContactDetail_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_ContactDetail_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_ContactDetail',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_ContactDetail));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_DriverInfo_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_DriverInfo_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_DriverInfo',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_DriverInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EmailContent_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EmailContent_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EmailContent_EMAIL_TYPE',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EmailContent_EMAIL_TYPE));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EmailContent',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EmailContent));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EventInfo_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EventInfo_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EventInfo',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EventInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EventTime_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EventTime_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EventTime',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_EventTime));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_LinkUrl_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_LinkUrl_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_LinkUrl',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_LinkUrl));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_LocationCoordinate_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_LocationCoordinate_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_LocationCoordinate',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_LocationCoordinate));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_PeopleName_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_PeopleName_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_PeopleName',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_PeopleName));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_SCAN_TYPE_FORMAT',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_SCAN_TYPE_FORMAT));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_SmsContent_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_SmsContent_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_SmsContent',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_SmsContent));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_TelPhoneNumber_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_TelPhoneNumber_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_TelPhoneNumber_USE_TYPE',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_TelPhoneNumber_USE_TYPE));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_TelPhoneNumber',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_TelPhoneNumber));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_WiFiConnectionInfo_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_WiFiConnectionInfo_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_WiFiConnectionInfo_CIPHER_MODE',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_WiFiConnectionInfo_CIPHER_MODE));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_WiFiConnectionInfo',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan_WiFiConnectionInfo));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScan));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzer_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzer_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzer_Creator',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzer_Creator));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzer',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzer));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzerOptions_1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzerOptions_1));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzerOptions_Creator',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzerOptions_Creator));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzerOptions',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanAnalyzerOptions));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanBase_SCAN_TYPE',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanBase_SCAN_TYPE));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanBase',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JHmsScanBase));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja_104',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja_104));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JBarcodeFormat_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JBarcodeFormat_a));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JBarcodeFormat',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JBarcodeFormat));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_c));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_d',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_d));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_111',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_111));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc_113',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc_113));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JCreator',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JCreator));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd_115',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd_115));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JDecoderCreator',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JDecoderCreator));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanDrawable_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanDrawable_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanDrawable_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanDrawable_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanDrawable_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanDrawable_c));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanDrawable',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JScanDrawable));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_a_121',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_a_121));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_c));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_124',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_124));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf_125',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf_125));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja_133',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja_133));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_c));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_d',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_d));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_e',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_e));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_f',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_f));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_g',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_g));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_h',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1_h));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja7',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ja7));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_150',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb_150));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb7_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb7_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb7_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb7_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb7_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb7_c));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb7',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jb7));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc_162',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc_162));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc0_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc0_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc0_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc7_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc7_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc7_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc7_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc7',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jc7));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd_175',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd_175));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd2_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd7',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jd7));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_185',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je_185));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je3_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je3_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je3_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je7',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Je7));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf_196',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf_196));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf3_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf3_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf3_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf7',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jf7));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg_207',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg_207));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_c));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_d',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_d));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_e',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_e));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_f',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0_f));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_c));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d_c_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d_c_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d_c_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d_c_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d_c));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3_d));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg7',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jg7));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh_231',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh_231));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh0_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh3_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh7',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jh7));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji_242',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji_242));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji1_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji1_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji1_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji7',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ji7));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj_253',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj_253));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj1_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj1_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj1_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj3_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj3_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj3_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj3_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj3_c));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jj6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk1_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk4_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jk6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl1_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl1_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl1_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl3_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl3_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jl6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm2_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jm6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jn6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jo6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp0_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp0_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jp6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jq6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jr6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Js6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jt6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju1_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju1_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju2_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju2_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju2_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju2_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju2_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju2_c));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju2_d',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju2_d));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Ju6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jv6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw4_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw4_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw5_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw5_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jw6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jx6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy5_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy5_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jy6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz0',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz0));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz1',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz1));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz2',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz2));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz3',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz3));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz4',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz4));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz5',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz5));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz6',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.Jz6));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JProviderRemoteView',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JProviderRemoteView));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JLoadOpencvJNIUtil',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JLoadOpencvJNIUtil));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JOpencvJNI',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JOpencvJNI));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JViewfinderView_a',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JViewfinderView_a));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JViewfinderView_b',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JViewfinderView_b));
//  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JViewfinderView_c',
//    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JViewfinderView_c));
  TRegTypes.RegisterType('Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JViewfinderView',
    TypeInfo(Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.JViewfinderView));
end;


initialization
  RegisterTypes;

end.

