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
//  生成时间：2026-02-02 13:34:55
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.scanplus_2_13_0_302;

interface


uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Widget,
  Androidapi.JNI.os,
//  Androidapi.JNI.com.huawei.hms.feature.dynamic.IObjectWrapper,
  Androidapi.JNI.App,
//  Androidapi.JNI.com.huawei.hms.feature.dynamic.OnDelegateCreatedListener,
//  Androidapi.JNI.com.huawei.hms.mlsdk.common.MLFrame,
  Androidapi.JNI.Util,
  Androidapi.JNI,
//  Androidapi.JNI.com.huawei.hmf.tasks.Task,
//  Androidapi.JNI.android.animation.ValueAnimator,
//  Androidapi.JNI.android.animation.Animator,
//  Androidapi.JNI.org.xmlpull.v1.XmlPullParser,
  Androidapi.JNI.Hardware,
//  Androidapi.JNI.java.nio.ByteBuffer,
//  Androidapi.JNI.java.nio.charset.Charset,
  Androidapi.JNI.Net;



type

// ===== Forward declarations =====

  JDynamicModuleInitializer = interface; //com.huawei.hms.feature.DynamicModuleInitializer
//  Ja_a = interface; //com.huawei.hms.hmsscankit.a$a
//  Ja_b = interface; //com.huawei.hms.hmsscankit.a$b
//  Ja_c = interface; //com.huawei.hms.hmsscankit.a$c
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
  JIRemoteDecoderDelegate__Parcel = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate$_Parcel
  JIRemoteDecoderDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate
  JIRemoteFrameDecoderDelegate_Default = interface; //com.huawei.hms.hmsscankit.api.IRemoteFrameDecoderDelegate$Default
  JIRemoteFrameDecoderDelegate_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteFrameDecoderDelegate$Stub$Proxy
  JIRemoteFrameDecoderDelegate_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteFrameDecoderDelegate$Stub
  JIRemoteFrameDecoderDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteFrameDecoderDelegate
  JIRemoteHmsDecoderDelegate_Default = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$Default
  JIRemoteHmsDecoderDelegate_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$Stub$Proxy
  JIRemoteHmsDecoderDelegate_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$Stub
  JIRemoteHmsDecoderDelegate__Parcel = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$_Parcel
  JIRemoteHmsDecoderDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate
  JIRemoteViewDelegate_Default = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$Default
  JIRemoteViewDelegate_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$Stub$Proxy
  JIRemoteViewDelegate_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$Stub
  JIRemoteViewDelegate__Parcel = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$_Parcel
  JIRemoteViewDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate
//  Jb = interface; //com.huawei.hms.hmsscankit.b
//  Jc = interface; //com.huawei.hms.hmsscankit.c
//  Jd = interface; //com.huawei.hms.hmsscankit.d
//  JDetailRect_a = interface; //com.huawei.hms.hmsscankit.DetailRect$a
  JDetailRect = interface; //com.huawei.hms.hmsscankit.DetailRect
//  Je = interface; //com.huawei.hms.hmsscankit.e
//  Jf_a = interface; //com.huawei.hms.hmsscankit.f$a
//  Jf = interface; //com.huawei.hms.hmsscankit.f
//  Jg = interface; //com.huawei.hms.hmsscankit.g
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
//  JScanKitActivity_3 = interface; //com.huawei.hms.hmsscankit.ScanKitActivity$3
//  JScanKitActivity_4 = interface; //com.huawei.hms.hmsscankit.ScanKitActivity$4
//  JScanKitActivity_5 = interface; //com.huawei.hms.hmsscankit.ScanKitActivity$5
//  JScanKitActivity_6 = interface; //com.huawei.hms.hmsscankit.ScanKitActivity$6
//  JScanKitActivity_7 = interface; //com.huawei.hms.hmsscankit.ScanKitActivity$7
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
  JHmsScanFrame = interface; //com.huawei.hms.ml.scan.HmsScanFrame
//  JHmsScanFrameOptions_1 = interface; //com.huawei.hms.ml.scan.HmsScanFrameOptions$1
  JHmsScanFrameOptions_Creator = interface; //com.huawei.hms.ml.scan.HmsScanFrameOptions$Creator
  JHmsScanFrameOptions = interface; //com.huawei.hms.ml.scan.HmsScanFrameOptions
//  JHmsScanResult_1 = interface; //com.huawei.hms.ml.scan.HmsScanResult$1
  JHmsScanResult = interface; //com.huawei.hms.ml.scan.HmsScanResult
//  Ja_a_121 = interface; //com.huawei.hms.scankit.a$a
//  Ja_122 = interface; //com.huawei.hms.scankit.a
//  JBarcodeFormat_a = interface; //com.huawei.hms.scankit.aiscan.common.BarcodeFormat$a
  JBarcodeFormat = interface; //com.huawei.hms.scankit.aiscan.common.BarcodeFormat
//  Jb_a = interface; //com.huawei.hms.scankit.b$a
//  Jb_b = interface; //com.huawei.hms.scankit.b$b
//  Jb_c = interface; //com.huawei.hms.scankit.b$c
//  Jb_d = interface; //com.huawei.hms.scankit.b$d
//  Jb_129 = interface; //com.huawei.hms.scankit.b
//  Jc_a = interface; //com.huawei.hms.scankit.c$a
//  Jc_131 = interface; //com.huawei.hms.scankit.c
  JCreator = interface; //com.huawei.hms.scankit.Creator
//  Jd_133 = interface; //com.huawei.hms.scankit.d
  JDecoderCreator = interface; //com.huawei.hms.scankit.DecoderCreator
//  JScanDrawable_a = interface; //com.huawei.hms.scankit.drawable.ScanDrawable$a
//  JScanDrawable_b = interface; //com.huawei.hms.scankit.drawable.ScanDrawable$b
//  JScanDrawable_c = interface; //com.huawei.hms.scankit.drawable.ScanDrawable$c
  JScanDrawable = interface; //com.huawei.hms.scankit.drawable.ScanDrawable
//  Je_a = interface; //com.huawei.hms.scankit.e$a
//  Je_b = interface; //com.huawei.hms.scankit.e$b
//  Je_c = interface; //com.huawei.hms.scankit.e$c
//  Je_142 = interface; //com.huawei.hms.scankit.e
//  Jf_143 = interface; //com.huawei.hms.scankit.f
//  Jg_144 = interface; //com.huawei.hms.scankit.g
//  Jh_a = interface; //com.huawei.hms.scankit.h$a
//  Jh = interface; //com.huawei.hms.scankit.h
//  Ji_a = interface; //com.huawei.hms.scankit.i$a
//  Ji_b = interface; //com.huawei.hms.scankit.i$b
//  Ji_c = interface; //com.huawei.hms.scankit.i$c
//  Ji = interface; //com.huawei.hms.scankit.i
//  Jj = interface; //com.huawei.hms.scankit.j
//  Ja_152 = interface; //com.huawei.hms.scankit.p.a
//  Ja0 = interface; //com.huawei.hms.scankit.p.a0
//  Ja1 = interface; //com.huawei.hms.scankit.p.a1
//  Ja2 = interface; //com.huawei.hms.scankit.p.a2
//  Ja3 = interface; //com.huawei.hms.scankit.p.a3
//  Ja4_a = interface; //com.huawei.hms.scankit.p.a4$a
//  Ja4_b = interface; //com.huawei.hms.scankit.p.a4$b
//  Ja4_c = interface; //com.huawei.hms.scankit.p.a4$c
//  Ja4 = interface; //com.huawei.hms.scankit.p.a4
//  Ja5 = interface; //com.huawei.hms.scankit.p.a5
//  Ja6 = interface; //com.huawei.hms.scankit.p.a6
//  Ja7 = interface; //com.huawei.hms.scankit.p.a7
//  Ja8_a = interface; //com.huawei.hms.scankit.p.a8$a
//  Ja8_b = interface; //com.huawei.hms.scankit.p.a8$b
//  Ja8 = interface; //com.huawei.hms.scankit.p.a8
//  Jb_167 = interface; //com.huawei.hms.scankit.p.b
//  Jb0 = interface; //com.huawei.hms.scankit.p.b0
//  Jb1 = interface; //com.huawei.hms.scankit.p.b1
//  Jb2 = interface; //com.huawei.hms.scankit.p.b2
//  Jb3 = interface; //com.huawei.hms.scankit.p.b3
//  Jb4 = interface; //com.huawei.hms.scankit.p.b4
//  Jb5 = interface; //com.huawei.hms.scankit.p.b5
//  Jb6 = interface; //com.huawei.hms.scankit.p.b6
//  Jb7 = interface; //com.huawei.hms.scankit.p.b7
//  Jb8_a = interface; //com.huawei.hms.scankit.p.b8$a
//  Jb8_b = interface; //com.huawei.hms.scankit.p.b8$b
//  Jb8 = interface; //com.huawei.hms.scankit.p.b8
//  Jc_179 = interface; //com.huawei.hms.scankit.p.c
//  Jc0 = interface; //com.huawei.hms.scankit.p.c0
//  Jc1 = interface; //com.huawei.hms.scankit.p.c1
//  Jc2 = interface; //com.huawei.hms.scankit.p.c2
//  Jc3 = interface; //com.huawei.hms.scankit.p.c3
//  Jc4_a = interface; //com.huawei.hms.scankit.p.c4$a
//  Jc4 = interface; //com.huawei.hms.scankit.p.c4
//  Jc5_a = interface; //com.huawei.hms.scankit.p.c5$a
//  Jc5 = interface; //com.huawei.hms.scankit.p.c5
//  Jc6 = interface; //com.huawei.hms.scankit.p.c6
//  Jc7 = interface; //com.huawei.hms.scankit.p.c7
//  Jc8 = interface; //com.huawei.hms.scankit.p.c8
//  Jd_191 = interface; //com.huawei.hms.scankit.p.d
//  Jd0 = interface; //com.huawei.hms.scankit.p.d0
//  Jd1 = interface; //com.huawei.hms.scankit.p.d1
//  Jd2_a = interface; //com.huawei.hms.scankit.p.d2$a
//  Jd2 = interface; //com.huawei.hms.scankit.p.d2
//  Jd3 = interface; //com.huawei.hms.scankit.p.d3
//  Jd4 = interface; //com.huawei.hms.scankit.p.d4
//  Jd5 = interface; //com.huawei.hms.scankit.p.d5
//  Jd6 = interface; //com.huawei.hms.scankit.p.d6
//  Jd7 = interface; //com.huawei.hms.scankit.p.d7
//  Jd8 = interface; //com.huawei.hms.scankit.p.d8
//  Je_202 = interface; //com.huawei.hms.scankit.p.e
//  Je0_a = interface; //com.huawei.hms.scankit.p.e0$a
//  Je0_b = interface; //com.huawei.hms.scankit.p.e0$b
//  Je0 = interface; //com.huawei.hms.scankit.p.e0
//  Je1 = interface; //com.huawei.hms.scankit.p.e1
//  Je2 = interface; //com.huawei.hms.scankit.p.e2
//  Je3 = interface; //com.huawei.hms.scankit.p.e3
//  Je4 = interface; //com.huawei.hms.scankit.p.e4
//  Je5 = interface; //com.huawei.hms.scankit.p.e5
//  Je6 = interface; //com.huawei.hms.scankit.p.e6
//  Je7 = interface; //com.huawei.hms.scankit.p.e7
//  Je8 = interface; //com.huawei.hms.scankit.p.e8
//  Jf_214 = interface; //com.huawei.hms.scankit.p.f
//  Jf0 = interface; //com.huawei.hms.scankit.p.f0
//  Jf1_a = interface; //com.huawei.hms.scankit.p.f1$a
//  Jf1_b = interface; //com.huawei.hms.scankit.p.f1$b
//  Jf1_c = interface; //com.huawei.hms.scankit.p.f1$c
//  Jf1_d = interface; //com.huawei.hms.scankit.p.f1$d
//  Jf1_e = interface; //com.huawei.hms.scankit.p.f1$e
//  Jf1_f = interface; //com.huawei.hms.scankit.p.f1$f
//  Jf1_g = interface; //com.huawei.hms.scankit.p.f1$g
//  Jf1_h = interface; //com.huawei.hms.scankit.p.f1$h
//  Jf1 = interface; //com.huawei.hms.scankit.p.f1
//  Jf2 = interface; //com.huawei.hms.scankit.p.f2
//  Jf3 = interface; //com.huawei.hms.scankit.p.f3
//  Jf4 = interface; //com.huawei.hms.scankit.p.f4
//  Jf5 = interface; //com.huawei.hms.scankit.p.f5
//  Jf6 = interface; //com.huawei.hms.scankit.p.f6
//  Jf7 = interface; //com.huawei.hms.scankit.p.f7
//  Jf8 = interface; //com.huawei.hms.scankit.p.f8
//  Jg_232 = interface; //com.huawei.hms.scankit.p.g
//  Jg0 = interface; //com.huawei.hms.scankit.p.g0
//  Jg1_a = interface; //com.huawei.hms.scankit.p.g1$a
//  Jg1_b = interface; //com.huawei.hms.scankit.p.g1$b
//  Jg1_c = interface; //com.huawei.hms.scankit.p.g1$c
//  Jg1_d = interface; //com.huawei.hms.scankit.p.g1$d
//  Jg1_e = interface; //com.huawei.hms.scankit.p.g1$e
//  Jg1_f = interface; //com.huawei.hms.scankit.p.g1$f
//  Jg1_g = interface; //com.huawei.hms.scankit.p.g1$g
//  Jg1_h = interface; //com.huawei.hms.scankit.p.g1$h
//  Jg1 = interface; //com.huawei.hms.scankit.p.g1
//  Jg2 = interface; //com.huawei.hms.scankit.p.g2
//  Jg3 = interface; //com.huawei.hms.scankit.p.g3
//  Jg4 = interface; //com.huawei.hms.scankit.p.g4
//  Jg5 = interface; //com.huawei.hms.scankit.p.g5
//  Jg6 = interface; //com.huawei.hms.scankit.p.g6
//  Jg7 = interface; //com.huawei.hms.scankit.p.g7
//  Jg8 = interface; //com.huawei.hms.scankit.p.g8
//  Jh_250 = interface; //com.huawei.hms.scankit.p.h
//  Jh0 = interface; //com.huawei.hms.scankit.p.h0
//  Jh1 = interface; //com.huawei.hms.scankit.p.h1
//  Jh2 = interface; //com.huawei.hms.scankit.p.h2
//  Jh3_a = interface; //com.huawei.hms.scankit.p.h3$a
//  Jh3_b = interface; //com.huawei.hms.scankit.p.h3$b
//  Jh3_c = interface; //com.huawei.hms.scankit.p.h3$c
//  Jh3_d = interface; //com.huawei.hms.scankit.p.h3$d
//  Jh3 = interface; //com.huawei.hms.scankit.p.h3
//  Jh4 = interface; //com.huawei.hms.scankit.p.h4
//  Jh5 = interface; //com.huawei.hms.scankit.p.h5
//  Jh6 = interface; //com.huawei.hms.scankit.p.h6
//  Jh7 = interface; //com.huawei.hms.scankit.p.h7
//  Jh8 = interface; //com.huawei.hms.scankit.p.h8
//  Ji_264 = interface; //com.huawei.hms.scankit.p.i
//  Ji0_a = interface; //com.huawei.hms.scankit.p.i0$a
//  Ji0 = interface; //com.huawei.hms.scankit.p.i0
//  Ji1 = interface; //com.huawei.hms.scankit.p.i1
//  Ji2 = interface; //com.huawei.hms.scankit.p.i2
//  Ji3_a = interface; //com.huawei.hms.scankit.p.i3$a
//  Ji3_b = interface; //com.huawei.hms.scankit.p.i3$b
//  Ji3_c = interface; //com.huawei.hms.scankit.p.i3$c
//  Ji3_d = interface; //com.huawei.hms.scankit.p.i3$d
//  Ji3_e = interface; //com.huawei.hms.scankit.p.i3$e
//  Ji3_f = interface; //com.huawei.hms.scankit.p.i3$f
//  Ji3_g = interface; //com.huawei.hms.scankit.p.i3$g
//  Ji3 = interface; //com.huawei.hms.scankit.p.i3
//  Ji4 = interface; //com.huawei.hms.scankit.p.i4
//  Ji5 = interface; //com.huawei.hms.scankit.p.i5
//  Ji6 = interface; //com.huawei.hms.scankit.p.i6
//  Ji7 = interface; //com.huawei.hms.scankit.p.i7
//  Ji8 = interface; //com.huawei.hms.scankit.p.i8
//  Jj_282 = interface; //com.huawei.hms.scankit.p.j
//  Jj0_a = interface; //com.huawei.hms.scankit.p.j0$a
//  Jj0_b = interface; //com.huawei.hms.scankit.p.j0$b
//  Jj0_c = interface; //com.huawei.hms.scankit.p.j0$c
//  Jj0_d = interface; //com.huawei.hms.scankit.p.j0$d
//  Jj0_e = interface; //com.huawei.hms.scankit.p.j0$e
//  Jj0 = interface; //com.huawei.hms.scankit.p.j0
//  Jj1 = interface; //com.huawei.hms.scankit.p.j1
//  Jj2 = interface; //com.huawei.hms.scankit.p.j2
//  Jj3_a = interface; //com.huawei.hms.scankit.p.j3$a
//  Jj3_b = interface; //com.huawei.hms.scankit.p.j3$b
//  Jj3_c = interface; //com.huawei.hms.scankit.p.j3$c
//  Jj3 = interface; //com.huawei.hms.scankit.p.j3
//  Jj4 = interface; //com.huawei.hms.scankit.p.j4
//  Jj5 = interface; //com.huawei.hms.scankit.p.j5
//  Jj6 = interface; //com.huawei.hms.scankit.p.j6
//  Jj7 = interface; //com.huawei.hms.scankit.p.j7
//  Jj8 = interface; //com.huawei.hms.scankit.p.j8
//  Jk = interface; //com.huawei.hms.scankit.p.k
//  Jk0_a = interface; //com.huawei.hms.scankit.p.k0$a
//  Jk0 = interface; //com.huawei.hms.scankit.p.k0
//  Jk1 = interface; //com.huawei.hms.scankit.p.k1
//  Jk2 = interface; //com.huawei.hms.scankit.p.k2
//  Jk3 = interface; //com.huawei.hms.scankit.p.k3
//  Jk4 = interface; //com.huawei.hms.scankit.p.k4
//  Jk5 = interface; //com.huawei.hms.scankit.p.k5
//  Jk6 = interface; //com.huawei.hms.scankit.p.k6
//  Jk7 = interface; //com.huawei.hms.scankit.p.k7
//  Jk8 = interface; //com.huawei.hms.scankit.p.k8
//  Jl = interface; //com.huawei.hms.scankit.p.l
//  Jl0 = interface; //com.huawei.hms.scankit.p.l0
//  Jl1 = interface; //com.huawei.hms.scankit.p.l1
//  Jl2 = interface; //com.huawei.hms.scankit.p.l2
//  Jl3 = interface; //com.huawei.hms.scankit.p.l3
//  Jl4 = interface; //com.huawei.hms.scankit.p.l4
//  Jl5 = interface; //com.huawei.hms.scankit.p.l5
//  Jl6 = interface; //com.huawei.hms.scankit.p.l6
//  Jl7 = interface; //com.huawei.hms.scankit.p.l7
//  Jl8 = interface; //com.huawei.hms.scankit.p.l8
//  Jm = interface; //com.huawei.hms.scankit.p.m
//  Jm0 = interface; //com.huawei.hms.scankit.p.m0
//  Jm1 = interface; //com.huawei.hms.scankit.p.m1
//  Jm2 = interface; //com.huawei.hms.scankit.p.m2
//  Jm3 = interface; //com.huawei.hms.scankit.p.m3
//  Jm4 = interface; //com.huawei.hms.scankit.p.m4
//  Jm5 = interface; //com.huawei.hms.scankit.p.m5
//  Jm6 = interface; //com.huawei.hms.scankit.p.m6
//  Jm7 = interface; //com.huawei.hms.scankit.p.m7
//  Jm8 = interface; //com.huawei.hms.scankit.p.m8
//  Jn = interface; //com.huawei.hms.scankit.p.n
//  Jn0 = interface; //com.huawei.hms.scankit.p.n0
//  Jn1 = interface; //com.huawei.hms.scankit.p.n1
//  Jn2_a = interface; //com.huawei.hms.scankit.p.n2$a
//  Jn2 = interface; //com.huawei.hms.scankit.p.n2
//  Jn3 = interface; //com.huawei.hms.scankit.p.n3
//  Jn4 = interface; //com.huawei.hms.scankit.p.n4
//  Jn5 = interface; //com.huawei.hms.scankit.p.n5
//  Jn6 = interface; //com.huawei.hms.scankit.p.n6
//  Jn7 = interface; //com.huawei.hms.scankit.p.n7
//  Jn8 = interface; //com.huawei.hms.scankit.p.n8
//  Jo = interface; //com.huawei.hms.scankit.p.o
//  Jo0 = interface; //com.huawei.hms.scankit.p.o0
//  Jo1 = interface; //com.huawei.hms.scankit.p.o1
//  Jo2 = interface; //com.huawei.hms.scankit.p.o2
//  Jo3 = interface; //com.huawei.hms.scankit.p.o3
//  Jo4 = interface; //com.huawei.hms.scankit.p.o4
//  Jo5 = interface; //com.huawei.hms.scankit.p.o5
//  Jo6 = interface; //com.huawei.hms.scankit.p.o6
//  Jo7 = interface; //com.huawei.hms.scankit.p.o7
//  Jo8 = interface; //com.huawei.hms.scankit.p.o8
//  Jp = interface; //com.huawei.hms.scankit.p.p
//  Jp0 = interface; //com.huawei.hms.scankit.p.p0
//  Jp1_a = interface; //com.huawei.hms.scankit.p.p1$a
//  Jp1_b = interface; //com.huawei.hms.scankit.p.p1$b
//  Jp1 = interface; //com.huawei.hms.scankit.p.p1
//  Jp2 = interface; //com.huawei.hms.scankit.p.p2
//  Jp3 = interface; //com.huawei.hms.scankit.p.p3
//  Jp4 = interface; //com.huawei.hms.scankit.p.p4
//  Jp5 = interface; //com.huawei.hms.scankit.p.p5
//  Jp6 = interface; //com.huawei.hms.scankit.p.p6
//  Jp7 = interface; //com.huawei.hms.scankit.p.p7
//  Jq = interface; //com.huawei.hms.scankit.p.q
//  Jq0 = interface; //com.huawei.hms.scankit.p.q0
//  Jq1_a = interface; //com.huawei.hms.scankit.p.q1$a
//  Jq1 = interface; //com.huawei.hms.scankit.p.q1
//  Jq2 = interface; //com.huawei.hms.scankit.p.q2
//  Jq3 = interface; //com.huawei.hms.scankit.p.q3
//  Jq4 = interface; //com.huawei.hms.scankit.p.q4
//  Jq5_a = interface; //com.huawei.hms.scankit.p.q5$a
//  Jq5 = interface; //com.huawei.hms.scankit.p.q5
//  Jq6 = interface; //com.huawei.hms.scankit.p.q6
//  Jq7 = interface; //com.huawei.hms.scankit.p.q7
//  Jr = interface; //com.huawei.hms.scankit.p.r
//  Jr0 = interface; //com.huawei.hms.scankit.p.r0
//  Jr1_a = interface; //com.huawei.hms.scankit.p.r1$a
//  Jr1_b = interface; //com.huawei.hms.scankit.p.r1$b
//  Jr1 = interface; //com.huawei.hms.scankit.p.r1
//  Jr2 = interface; //com.huawei.hms.scankit.p.r2
//  Jr3 = interface; //com.huawei.hms.scankit.p.r3
//  Jr4 = interface; //com.huawei.hms.scankit.p.r4
//  Jr5 = interface; //com.huawei.hms.scankit.p.r5
//  Jr6 = interface; //com.huawei.hms.scankit.p.r6
//  Jr7 = interface; //com.huawei.hms.scankit.p.r7
//  Js = interface; //com.huawei.hms.scankit.p.s
//  Js0_a = interface; //com.huawei.hms.scankit.p.s0$a
//  Js0 = interface; //com.huawei.hms.scankit.p.s0
//  Js1_a = interface; //com.huawei.hms.scankit.p.s1$a
//  Js1 = interface; //com.huawei.hms.scankit.p.s1
//  Js2 = interface; //com.huawei.hms.scankit.p.s2
//  Js3 = interface; //com.huawei.hms.scankit.p.s3
//  Js4 = interface; //com.huawei.hms.scankit.p.s4
//  Js5 = interface; //com.huawei.hms.scankit.p.s5
//  Js6_a = interface; //com.huawei.hms.scankit.p.s6$a
//  Js6 = interface; //com.huawei.hms.scankit.p.s6
//  Js7 = interface; //com.huawei.hms.scankit.p.s7
//  Jt = interface; //com.huawei.hms.scankit.p.t
//  Jt0 = interface; //com.huawei.hms.scankit.p.t0
//  Jt1_a = interface; //com.huawei.hms.scankit.p.t1$a
//  Jt1_b = interface; //com.huawei.hms.scankit.p.t1$b
//  Jt1 = interface; //com.huawei.hms.scankit.p.t1
//  Jt2 = interface; //com.huawei.hms.scankit.p.t2
//  Jt3 = interface; //com.huawei.hms.scankit.p.t3
//  Jt4 = interface; //com.huawei.hms.scankit.p.t4
//  Jt5 = interface; //com.huawei.hms.scankit.p.t5
//  Jt6 = interface; //com.huawei.hms.scankit.p.t6
//  Jt7 = interface; //com.huawei.hms.scankit.p.t7
//  Ju = interface; //com.huawei.hms.scankit.p.u
//  Ju0 = interface; //com.huawei.hms.scankit.p.u0
//  Ju1 = interface; //com.huawei.hms.scankit.p.u1
//  Ju2 = interface; //com.huawei.hms.scankit.p.u2
//  Ju3_a = interface; //com.huawei.hms.scankit.p.u3$a
//  Ju3_b = interface; //com.huawei.hms.scankit.p.u3$b
//  Ju3 = interface; //com.huawei.hms.scankit.p.u3
//  Ju4 = interface; //com.huawei.hms.scankit.p.u4
//  Ju5 = interface; //com.huawei.hms.scankit.p.u5
//  Ju6_a = interface; //com.huawei.hms.scankit.p.u6$a
//  Ju6 = interface; //com.huawei.hms.scankit.p.u6
//  Ju7 = interface; //com.huawei.hms.scankit.p.u7
//  Jv = interface; //com.huawei.hms.scankit.p.v
//  Jv0 = interface; //com.huawei.hms.scankit.p.v0
//  Jv1 = interface; //com.huawei.hms.scankit.p.v1
//  Jv2 = interface; //com.huawei.hms.scankit.p.v2
//  Jv3_a = interface; //com.huawei.hms.scankit.p.v3$a
//  Jv3_b = interface; //com.huawei.hms.scankit.p.v3$b
//  Jv3 = interface; //com.huawei.hms.scankit.p.v3
//  Jv4 = interface; //com.huawei.hms.scankit.p.v4
//  Jv5 = interface; //com.huawei.hms.scankit.p.v5
//  Jv6 = interface; //com.huawei.hms.scankit.p.v6
//  Jv7 = interface; //com.huawei.hms.scankit.p.v7
//  Jw = interface; //com.huawei.hms.scankit.p.w
//  Jw0 = interface; //com.huawei.hms.scankit.p.w0
//  Jw1 = interface; //com.huawei.hms.scankit.p.w1
//  Jw2_a = interface; //com.huawei.hms.scankit.p.w2$a
//  Jw2 = interface; //com.huawei.hms.scankit.p.w2
//  Jw3_a = interface; //com.huawei.hms.scankit.p.w3$a
//  Jw3_b = interface; //com.huawei.hms.scankit.p.w3$b
//  Jw3_c = interface; //com.huawei.hms.scankit.p.w3$c
//  Jw3_d_a = interface; //com.huawei.hms.scankit.p.w3$d$a
//  Jw3_d_b = interface; //com.huawei.hms.scankit.p.w3$d$b
//  Jw3_d_c_a = interface; //com.huawei.hms.scankit.p.w3$d$c$a
//  Jw3_d_c_b = interface; //com.huawei.hms.scankit.p.w3$d$c$b
//  Jw3_d_c = interface; //com.huawei.hms.scankit.p.w3$d$c
//  Jw3_d = interface; //com.huawei.hms.scankit.p.w3$d
//  Jw3 = interface; //com.huawei.hms.scankit.p.w3
//  Jw4 = interface; //com.huawei.hms.scankit.p.w4
//  Jw5 = interface; //com.huawei.hms.scankit.p.w5
//  Jw6 = interface; //com.huawei.hms.scankit.p.w6
//  Jw7 = interface; //com.huawei.hms.scankit.p.w7
//  Jx = interface; //com.huawei.hms.scankit.p.x
//  Jx0 = interface; //com.huawei.hms.scankit.p.x0
//  Jx1 = interface; //com.huawei.hms.scankit.p.x1
//  Jx2 = interface; //com.huawei.hms.scankit.p.x2
//  Jx3_a = interface; //com.huawei.hms.scankit.p.x3$a
//  Jx3 = interface; //com.huawei.hms.scankit.p.x3
//  Jx4 = interface; //com.huawei.hms.scankit.p.x4
//  Jx5 = interface; //com.huawei.hms.scankit.p.x5
//  Jx6 = interface; //com.huawei.hms.scankit.p.x6
//  Jx7 = interface; //com.huawei.hms.scankit.p.x7
//  Jy = interface; //com.huawei.hms.scankit.p.y
//  Jy0 = interface; //com.huawei.hms.scankit.p.y0
//  Jy1 = interface; //com.huawei.hms.scankit.p.y1
//  Jy2 = interface; //com.huawei.hms.scankit.p.y2
//  Jy3 = interface; //com.huawei.hms.scankit.p.y3
//  Jy4 = interface; //com.huawei.hms.scankit.p.y4
//  Jy5 = interface; //com.huawei.hms.scankit.p.y5
//  Jy6 = interface; //com.huawei.hms.scankit.p.y6
//  Jy7 = interface; //com.huawei.hms.scankit.p.y7
//  Jz = interface; //com.huawei.hms.scankit.p.z
//  Jz0 = interface; //com.huawei.hms.scankit.p.z0
//  Jz1 = interface; //com.huawei.hms.scankit.p.z1
//  Jz2 = interface; //com.huawei.hms.scankit.p.z2
//  Jz3 = interface; //com.huawei.hms.scankit.p.z3
//  Jz4 = interface; //com.huawei.hms.scankit.p.z4
//  Jz5 = interface; //com.huawei.hms.scankit.p.z5
//  Jz6 = interface; //com.huawei.hms.scankit.p.z6
//  Jz7_a = interface; //com.huawei.hms.scankit.p.z7$a
//  Jz7_b = interface; //com.huawei.hms.scankit.p.z7$b
//  Jz7_c = interface; //com.huawei.hms.scankit.p.z7$c
//  Jz7 = interface; //com.huawei.hms.scankit.p.z7
  JProviderRemoteView = interface; //com.huawei.hms.scankit.ProviderRemoteView
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
//  Je_142Class = interface; //com.huawei.hms.scankit.e
//  Ji7Class = interface; //com.huawei.hms.scankit.p.i7
//  Jg5Class = interface; //com.huawei.hms.scankit.p.g5
//  Jt6Class = interface; //com.huawei.hms.scankit.p.t6
//  Jb2Class = interface; //com.huawei.hms.scankit.p.b2
//  Ju6Class = interface; //com.huawei.hms.scankit.p.u6
//  Jq3Class = interface; //com.huawei.hms.scankit.p.q3
//  Jp4Class = interface; //com.huawei.hms.scankit.p.p4
//  Jf1Class = interface; //com.huawei.hms.scankit.p.f1
//  Jk2Class = interface; //com.huawei.hms.scankit.p.k2
//  Jg1Class = interface; //com.huawei.hms.scankit.p.g1
//  Jd0Class = interface; //com.huawei.hms.scankit.p.d0
  JIRemoteFrameDecoderDelegate_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteFrameDecoderDelegate$Stub
//  Jd7Class = interface; //com.huawei.hms.scankit.p.d7
//  Jh5Class = interface; //com.huawei.hms.scankit.p.h5
//  Jq7Class = interface; //com.huawei.hms.scankit.p.q7
//  Jr7Class = interface; //com.huawei.hms.scankit.p.r7
//  JoClass = interface; //com.huawei.hms.scankit.p.o
//  Ju3Class = interface; //com.huawei.hms.scankit.p.u3
//  Js3Class = interface; //com.huawei.hms.scankit.p.s3

// ===== Interface declarations =====


  JIObjectWrapper=JObject;

  JDynamicModuleInitializerClass = interface(JObjectClass)
  ['{64C0D4F7-E325-4FAB-A26D-52349D335654}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDynamicModuleInitializer; cdecl;
    {class} procedure initializeModule(P1: JContext); cdecl;
    {class} function getContext: JContext; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/feature/DynamicModuleInitializer')]
  JDynamicModuleInitializer = interface(JObject)
  ['{0240AD0D-E64D-49C9-B38A-E2841F5AFAA6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDynamicModuleInitializer = class(TJavaGenericImport<JDynamicModuleInitializerClass, JDynamicModuleInitializer>) end;

//  Ja_aClass = interface(JObjectClass)
//  ['{2F5344AD-3B99-42CA-BDDA-DBEEE2FD0B0D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/a$a')]
//  Ja_a = interface(JObject)
//  ['{A8CBD766-82D1-482B-9455-9129372F6B23}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  Ja_bClass = interface(JObjectClass)
//  ['{96382C59-3EE5-4681-8205-604A26D8492C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/a$b')]
//  Ja_b = interface(JObject)
//  ['{27977BB8-8746-42A6-B298-A6A84EE3C87A}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJa_b = class(TJavaGenericImport<Ja_bClass, Ja_b>) end;

//  Ja_cClass = interface(JObjectClass)
//  ['{7DB09E55-47F2-4F65-94D0-210E305C7BC2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Ja_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/a$c')]
//  Ja_c = interface(JObject)
//  ['{92D567E1-029B-439D-ACB3-22C5857CE906}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: JCharSequence): Ja_c; cdecl; overload;
//    function a(P1: JCharSequence): Ja_c; cdecl; overload;
//    function b(P1: JString; P2: JDialogInterface_OnClickListener): Ja_c; cdecl; overload;
//    function a(P1: JString; P2: JDialogInterface_OnClickListener): Ja_c; cdecl; overload;
//    function a: Ja; cdecl; overload;
//
//    { Property }
//  end;

//  TJa_c = class(TJavaGenericImport<Ja_cClass, Ja_c>) end;

//  JaClass = interface(JObjectClass)
//  ['{E15033C8-5397-4AB4-9219-14AB5812B28B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/a')]
//  Ja = interface(JObject)
//  ['{D42D5915-E5E0-4AD9-90F3-FBA48969325A}']
//    { Property Methods }
//
//    { methods }
//    procedure c; cdecl;
//    procedure cancel; cdecl;
//    procedure dismiss; cdecl;
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

  JIOnErrorCallback_DefaultClass = interface(JObjectClass)
  ['{32160390-EBE6-483B-8C04-38D269DF68E8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnErrorCallback_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnErrorCallback$Default')]
  JIOnErrorCallback_Default = interface(JObject)
  ['{DA3F60CD-81F2-401F-B5F2-1E5E60228D17}']
    { Property Methods }

    { methods }
    procedure onError(P1: Integer); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIOnErrorCallback_Default = class(TJavaGenericImport<JIOnErrorCallback_DefaultClass, JIOnErrorCallback_Default>) end;

  JIOnErrorCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{7FA2FCCB-0E10-4D11-AB35-DEE87C439844}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnErrorCallback$Stub$Proxy')]
  JIOnErrorCallback_Stub_Proxy = interface(JObject)
  ['{333E218A-4F59-4F1B-AD18-0C02EE1E2D46}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onError(P1: Integer); cdecl;

    { Property }
  end;

  TJIOnErrorCallback_Stub_Proxy = class(TJavaGenericImport<JIOnErrorCallback_Stub_ProxyClass, JIOnErrorCallback_Stub_Proxy>) end;

  JIOnErrorCallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{B8BF3C9C-9FC3-4CCB-B7E5-FB289C79B459}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnErrorCallback_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIOnErrorCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnErrorCallback$Stub')]
  JIOnErrorCallback_Stub = interface(JBinder) // or JObject
  ['{2A9A4D4B-702E-47A6-8B30-B37B5CF24642}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIOnErrorCallback_Stub = class(TJavaGenericImport<JIOnErrorCallback_StubClass, JIOnErrorCallback_Stub>) end;

  JIOnErrorCallbackClass = interface(JObjectClass)
  ['{0BEEDD41-D673-4EE5-B2C6-49D93362507C}']
    { static Property Methods }
    {class} function _GetDESCRIPTOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnErrorCallback')]
  JIOnErrorCallback = interface(IJavaInstance)
  ['{3E864C64-FA71-4471-8010-E2087FB3FB7F}']
    { Property Methods }

    { methods }
    procedure onError(P1: Integer); cdecl;

    { Property }
  end;

  TJIOnErrorCallback = class(TJavaGenericImport<JIOnErrorCallbackClass, JIOnErrorCallback>) end;

  JIOnLightCallback_DefaultClass = interface(JObjectClass)
  ['{B090CE20-65EC-4249-AD9C-54E8B866F482}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnLightCallback_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback$Default')]
  JIOnLightCallback_Default = interface(JObject)
  ['{6206561E-45D0-4C7C-B2F7-B816A4EF2F31}']
    { Property Methods }

    { methods }
    procedure onVisibleChanged(P1: Boolean); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIOnLightCallback_Default = class(TJavaGenericImport<JIOnLightCallback_DefaultClass, JIOnLightCallback_Default>) end;

  JIOnLightCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{0D9C2E7D-EA6F-45ED-BCA9-A4FE28BD5FCF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback$Stub$Proxy')]
  JIOnLightCallback_Stub_Proxy = interface(JObject)
  ['{55A0A495-D391-4D8E-9E67-AAED87DF3E53}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onVisibleChanged(P1: Boolean); cdecl;

    { Property }
  end;

  TJIOnLightCallback_Stub_Proxy = class(TJavaGenericImport<JIOnLightCallback_Stub_ProxyClass, JIOnLightCallback_Stub_Proxy>) end;

  JIOnLightCallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{DCBD42FA-9DC4-4465-AB72-5B8242B6216B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnLightCallback_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIOnLightCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback$Stub')]
  JIOnLightCallback_Stub = interface(JBinder) // or JObject
  ['{25024CD0-DE7F-4DEF-A1A4-0460FA2576DC}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIOnLightCallback_Stub = class(TJavaGenericImport<JIOnLightCallback_StubClass, JIOnLightCallback_Stub>) end;

  JIOnLightCallbackClass = interface(JObjectClass)
  ['{B4494267-4422-44D0-850A-8FFC99AD65E5}']
    { static Property Methods }
    {class} function _GetDESCRIPTOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback')]
  JIOnLightCallback = interface(IJavaInstance)
  ['{B7D519D3-16AB-4064-8D03-83D74CAAB03C}']
    { Property Methods }

    { methods }
    procedure onVisibleChanged(P1: Boolean); cdecl;

    { Property }
  end;

  TJIOnLightCallback = class(TJavaGenericImport<JIOnLightCallbackClass, JIOnLightCallback>) end;

  JIOnResultCallback_DefaultClass = interface(JObjectClass)
  ['{FB53FD7F-B696-4060-9AB9-F173AC397CC6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnResultCallback_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback$Default')]
  JIOnResultCallback_Default = interface(JObject)
  ['{8C0F4994-38E3-416B-B315-D3888B11095B}']
    { Property Methods }

    { methods }
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIOnResultCallback_Default = class(TJavaGenericImport<JIOnResultCallback_DefaultClass, JIOnResultCallback_Default>) end;

  JIOnResultCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{631E8E3C-AB3C-4646-BBB2-368C7353578C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback$Stub$Proxy')]
  JIOnResultCallback_Stub_Proxy = interface(JObject)
  ['{FB5A6629-14DA-40D0-86A0-CA89D0C39BEC}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;

    { Property }
  end;

  TJIOnResultCallback_Stub_Proxy = class(TJavaGenericImport<JIOnResultCallback_Stub_ProxyClass, JIOnResultCallback_Stub_Proxy>) end;

  JIOnResultCallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{AA7C9782-7E49-4742-B590-A92EDD7F9C98}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnResultCallback_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIOnResultCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback$Stub')]
  JIOnResultCallback_Stub = interface(JBinder) // or JObject
  ['{40D4EF0D-AA1F-4E86-8B59-F8F43F92A6A4}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIOnResultCallback_Stub = class(TJavaGenericImport<JIOnResultCallback_StubClass, JIOnResultCallback_Stub>) end;

  JIOnResultCallbackClass = interface(JObjectClass)
  ['{ACF4E8AA-477E-440A-90B8-6344A8E15AF1}']
    { static Property Methods }
    {class} function _GetDESCRIPTOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback')]
  JIOnResultCallback = interface(IJavaInstance)
  ['{636A97F6-289F-40CD-B42E-0EBF82A16B16}']
    { Property Methods }

    { methods }
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;

    { Property }
  end;

  TJIOnResultCallback = class(TJavaGenericImport<JIOnResultCallbackClass, JIOnResultCallback>) end;

  JIRemoteCreator_DefaultClass = interface(JObjectClass)
  ['{01963B6A-1CA2-484A-9DE7-E41F82697CB7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteCreator_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator$Default')]
  JIRemoteCreator_Default = interface(JObject)
  ['{A7B7E562-70E8-4AC3-8324-11730B2E69A2}']
    { Property Methods }

    { methods }
    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteCreator_Default = class(TJavaGenericImport<JIRemoteCreator_DefaultClass, JIRemoteCreator_Default>) end;

  JIRemoteCreator_Stub_ProxyClass = interface(JObjectClass)
  ['{62360327-4CDB-46C9-9867-F5AA4A6DB4EC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator$Stub$Proxy')]
  JIRemoteCreator_Stub_Proxy = interface(JObject)
  ['{8238B8DA-5AD9-4137-B408-A22B35E1D541}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl;

    { Property }
  end;

  TJIRemoteCreator_Stub_Proxy = class(TJavaGenericImport<JIRemoteCreator_Stub_ProxyClass, JIRemoteCreator_Stub_Proxy>) end;

  JIRemoteCreator_StubClass = interface(JBinderClass) // or JObjectClass
  ['{B7DC424E-42FD-4FBA-92D1-7BCA80E30B63}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteCreator_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteCreator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator$Stub')]
  JIRemoteCreator_Stub = interface(JBinder) // or JObject
  ['{386708EF-74ED-454C-AF06-DFA1DA8AE983}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteCreator_Stub = class(TJavaGenericImport<JIRemoteCreator_StubClass, JIRemoteCreator_Stub>) end;

  JIRemoteCreatorClass = interface(JObjectClass)
  ['{6EA8BA59-B6ED-4ADE-9A21-D00261613499}']
    { static Property Methods }
    {class} function _GetDESCRIPTOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator')]
  JIRemoteCreator = interface(IJavaInstance)
  ['{FF557D71-B167-4C57-BD74-F505ACB47907}']
    { Property Methods }

    { methods }
    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl;

    { Property }
  end;

  TJIRemoteCreator = class(TJavaGenericImport<JIRemoteCreatorClass, JIRemoteCreator>) end;

  JIRemoteDecoderCreator_DefaultClass = interface(JObjectClass)
  ['{6C8C28E7-9D9F-462B-AA06-C472E6BB08DA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteDecoderCreator_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderCreator$Default')]
  JIRemoteDecoderCreator_Default = interface(JObject)
  ['{47703220-AAC0-41F8-BAC6-297268460544}']
    { Property Methods }

    { methods }
    function newRemoteFrameDecoderDelegate: JIRemoteFrameDecoderDelegate; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteDecoderCreator_Default = class(TJavaGenericImport<JIRemoteDecoderCreator_DefaultClass, JIRemoteDecoderCreator_Default>) end;

  JIRemoteDecoderCreator_Stub_ProxyClass = interface(JObjectClass)
  ['{89CF396C-EFEA-4E21-BB76-FF7AE157333D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderCreator$Stub$Proxy')]
  JIRemoteDecoderCreator_Stub_Proxy = interface(JObject)
  ['{0C2B2E22-4862-4608-9BBA-90C836C54005}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function newRemoteFrameDecoderDelegate: JIRemoteFrameDecoderDelegate; cdecl;

    { Property }
  end;

  TJIRemoteDecoderCreator_Stub_Proxy = class(TJavaGenericImport<JIRemoteDecoderCreator_Stub_ProxyClass, JIRemoteDecoderCreator_Stub_Proxy>) end;

  JIRemoteDecoderCreator_StubClass = interface(JBinderClass) // or JObjectClass
  ['{961ADA90-E246-4B1A-AD57-C6B25D7B18CB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteDecoderCreator_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteDecoderCreator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderCreator$Stub')]
  JIRemoteDecoderCreator_Stub = interface(JBinder) // or JObject
  ['{E8F64380-1F0D-447B-9283-D1A2E14B6414}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteDecoderCreator_Stub = class(TJavaGenericImport<JIRemoteDecoderCreator_StubClass, JIRemoteDecoderCreator_Stub>) end;

  JIRemoteDecoderCreatorClass = interface(JObjectClass)
  ['{D70AC99E-E711-4D39-A079-8A8D305E4492}']
    { static Property Methods }
    {class} function _GetDESCRIPTOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderCreator')]
  JIRemoteDecoderCreator = interface(IJavaInstance)
  ['{14E55A40-9F77-4AD9-A4B5-31C098DB543F}']
    { Property Methods }

    { methods }
    function newRemoteFrameDecoderDelegate: JIRemoteFrameDecoderDelegate; cdecl;

    { Property }
  end;

  TJIRemoteDecoderCreator = class(TJavaGenericImport<JIRemoteDecoderCreatorClass, JIRemoteDecoderCreator>) end;

  JIRemoteDecoderDelegate_DefaultClass = interface(JObjectClass)
  ['{4FCAE32C-B8D2-40FE-B62B-E3F99A117376}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteDecoderDelegate_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$Default')]
  JIRemoteDecoderDelegate_Default = interface(JObject)
  ['{58F0C7E2-036D-4902-A52F-947728B60381}']
    { Property Methods }

    { methods }
    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    function decodeWithBuffer(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: JIObjectWrapper): JHmsScanResult; cdecl;
    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl;
    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
    function queryDeepLinkInfo(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteDecoderDelegate_Default = class(TJavaGenericImport<JIRemoteDecoderDelegate_DefaultClass, JIRemoteDecoderDelegate_Default>) end;

  JIRemoteDecoderDelegate_Stub_ProxyClass = interface(JObjectClass)
  ['{54E5B7F1-8601-45C6-AE11-86101EC225EB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$Stub$Proxy')]
  JIRemoteDecoderDelegate_Stub_Proxy = interface(JObject)
  ['{F5DA68C8-F60B-41F2-8CDE-3F119F453DB7}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    function decodeWithBuffer(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: JIObjectWrapper): JHmsScanResult; cdecl;
    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl;
    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
    function queryDeepLinkInfo(P1: JIObjectWrapper): JIObjectWrapper; cdecl;

    { Property }
  end;

  TJIRemoteDecoderDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteDecoderDelegate_Stub_ProxyClass, JIRemoteDecoderDelegate_Stub_Proxy>) end;

  JIRemoteDecoderDelegate_StubClass = interface(JBinderClass) // or JObjectClass
  ['{4EE9F537-E896-4E30-BE9C-093C6BDDF985}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteDecoderDelegate_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteDecoderDelegate; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$Stub')]
  JIRemoteDecoderDelegate_Stub = interface(JBinder) // or JObject
  ['{02D34846-1773-4A54-96CF-90A74AA398F0}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteDecoderDelegate_Stub = class(TJavaGenericImport<JIRemoteDecoderDelegate_StubClass, JIRemoteDecoderDelegate_Stub>) end;

  JIRemoteDecoderDelegate__ParcelClass = interface(JObjectClass)
  ['{35B1FE9B-E907-453D-B4D7-398BF8A41BAC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteDecoderDelegate__Parcel; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$_Parcel')]
  JIRemoteDecoderDelegate__Parcel = interface(JObject)
  ['{D1B5B5F2-95A6-4605-BBBF-4081E3AB7F21}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIRemoteDecoderDelegate__Parcel = class(TJavaGenericImport<JIRemoteDecoderDelegate__ParcelClass, JIRemoteDecoderDelegate__Parcel>) end;

  JIRemoteDecoderDelegateClass = interface(JObjectClass)
  ['{4EBF7DD8-0587-49E8-ADE1-BD4D019BAB9E}']
    { static Property Methods }
    {class} function _GetDESCRIPTOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate')]
  JIRemoteDecoderDelegate = interface(IJavaInstance)
  ['{CAC3FD69-D629-424D-8AAE-C1947E93BD76}']
    { Property Methods }

    { methods }
    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    function decodeWithBuffer(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: JIObjectWrapper): JHmsScanResult; cdecl;
    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl;
    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
    function queryDeepLinkInfo(P1: JIObjectWrapper): JIObjectWrapper; cdecl;

    { Property }
  end;

  TJIRemoteDecoderDelegate = class(TJavaGenericImport<JIRemoteDecoderDelegateClass, JIRemoteDecoderDelegate>) end;

  JIRemoteFrameDecoderDelegate_DefaultClass = interface(JObjectClass)
  ['{37636F9B-5350-4046-B369-3D8B710128BD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteFrameDecoderDelegate_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteFrameDecoderDelegate$Default')]
  JIRemoteFrameDecoderDelegate_Default = interface(JObject)
  ['{6673CF8A-CDB4-4F24-99BD-FD682D3B09C7}']
    { Property Methods }

    { methods }
//    function decode(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JIObjectWrapper): TJavaObjectArray<Js6>; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteFrameDecoderDelegate_Default = class(TJavaGenericImport<JIRemoteFrameDecoderDelegate_DefaultClass, JIRemoteFrameDecoderDelegate_Default>) end;

  JIRemoteFrameDecoderDelegate_Stub_ProxyClass = interface(JObjectClass)
  ['{90ECB5D1-8C8F-43CA-B8AC-42B00B6FB935}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteFrameDecoderDelegate$Stub$Proxy')]
  JIRemoteFrameDecoderDelegate_Stub_Proxy = interface(JObject)
  ['{CE1D5501-D7AE-4ABF-8703-522B9A8DBBD5}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
//    function decode(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JIObjectWrapper): TJavaObjectArray<Js6>; cdecl;

    { Property }
  end;

  TJIRemoteFrameDecoderDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteFrameDecoderDelegate_Stub_ProxyClass, JIRemoteFrameDecoderDelegate_Stub_Proxy>) end;

  JIRemoteFrameDecoderDelegate_StubClass = interface(JBinderClass) // or JObjectClass
  ['{C6AF39B7-DA63-4630-AD1F-82AB0CB22600}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteFrameDecoderDelegate_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteFrameDecoderDelegate; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteFrameDecoderDelegate$Stub')]
  JIRemoteFrameDecoderDelegate_Stub = interface(JBinder) // or JObject
  ['{736C6E75-385A-48D0-85C5-104AC77C81D2}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteFrameDecoderDelegate_Stub = class(TJavaGenericImport<JIRemoteFrameDecoderDelegate_StubClass, JIRemoteFrameDecoderDelegate_Stub>) end;

  JIRemoteFrameDecoderDelegateClass = interface(JObjectClass)
  ['{12A92AA9-0875-4E6C-BFBC-2BC009FDDAC7}']
    { static Property Methods }
    {class} function _GetDESCRIPTOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteFrameDecoderDelegate')]
  JIRemoteFrameDecoderDelegate = interface(IJavaInstance)
  ['{A1A00B79-E053-44BD-90A5-EA1E0FE4F387}']
    { Property Methods }

    { methods }
//    function decode(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JIObjectWrapper): TJavaObjectArray<Js6>; cdecl;

    { Property }
  end;

  TJIRemoteFrameDecoderDelegate = class(TJavaGenericImport<JIRemoteFrameDecoderDelegateClass, JIRemoteFrameDecoderDelegate>) end;

  JIRemoteHmsDecoderDelegate_DefaultClass = interface(JObjectClass)
  ['{BF6EFC38-224E-4A77-8A9D-FF504F1C6F5D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteHmsDecoderDelegate_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$Default')]
  JIRemoteHmsDecoderDelegate_Default = interface(JObject)
  ['{55ADBF93-89B7-4472-BE6C-09E090729E54}']
    { Property Methods }

    { methods }
    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate_Default = class(TJavaGenericImport<JIRemoteHmsDecoderDelegate_DefaultClass, JIRemoteHmsDecoderDelegate_Default>) end;

  JIRemoteHmsDecoderDelegate_Stub_ProxyClass = interface(JObjectClass)
  ['{3349131E-BE02-4819-BED4-9EC26BE0D371}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$Stub$Proxy')]
  JIRemoteHmsDecoderDelegate_Stub_Proxy = interface(JObject)
  ['{C1F7B811-B65F-49E1-AC0C-5C9E59C77E0F}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteHmsDecoderDelegate_Stub_ProxyClass, JIRemoteHmsDecoderDelegate_Stub_Proxy>) end;

  JIRemoteHmsDecoderDelegate_StubClass = interface(JBinderClass) // or JObjectClass
  ['{F3C03346-02FB-4B8F-9A82-F88C092E031F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteHmsDecoderDelegate_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteHmsDecoderDelegate; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$Stub')]
  JIRemoteHmsDecoderDelegate_Stub = interface(JBinder) // or JObject
  ['{199AC857-4CC1-43CD-B292-EFDA67858692}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate_Stub = class(TJavaGenericImport<JIRemoteHmsDecoderDelegate_StubClass, JIRemoteHmsDecoderDelegate_Stub>) end;

  JIRemoteHmsDecoderDelegate__ParcelClass = interface(JObjectClass)
  ['{6369CD74-062D-408E-90A4-C4D045F64B58}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteHmsDecoderDelegate__Parcel; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$_Parcel')]
  JIRemoteHmsDecoderDelegate__Parcel = interface(JObject)
  ['{A24C0387-6095-422F-BDF9-DBB6BE4BE7B4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate__Parcel = class(TJavaGenericImport<JIRemoteHmsDecoderDelegate__ParcelClass, JIRemoteHmsDecoderDelegate__Parcel>) end;

  JIRemoteHmsDecoderDelegateClass = interface(JObjectClass)
  ['{CC9496AB-276C-4DB1-921F-98AE75886D09}']
    { static Property Methods }
    {class} function _GetDESCRIPTOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate')]
  JIRemoteHmsDecoderDelegate = interface(IJavaInstance)
  ['{77409AC5-B0C5-4E7B-A982-6A8C0954DD60}']
    { Property Methods }

    { methods }
    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate = class(TJavaGenericImport<JIRemoteHmsDecoderDelegateClass, JIRemoteHmsDecoderDelegate>) end;

  JIRemoteViewDelegate_DefaultClass = interface(JObjectClass)
  ['{B14E428B-98D9-4251-9C83-32F2BB7F4290}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteViewDelegate_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$Default')]
  JIRemoteViewDelegate_Default = interface(JObject)
  ['{562B6FAE-A3EA-4ABD-826C-66670FE86CC5}']
    { Property Methods }

    { methods }
    function getView: JIObjectWrapper; cdecl;
    procedure onCreate(P1: JBundle); cdecl;
    procedure onDestroy; cdecl;
    procedure onPause; cdecl;
    procedure onResume; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure setOnResultCallback(P1: JIOnResultCallback); cdecl;
    procedure setOnClickListener(P1: JIObjectWrapper); cdecl;
    procedure turnOnLight; cdecl;
    procedure turnOffLight; cdecl;
    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
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
  ['{044A7A29-CD5C-4A28-9093-FE905FD34191}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$Stub$Proxy')]
  JIRemoteViewDelegate_Stub_Proxy = interface(JObject)
  ['{28604923-CBF0-482C-B7C0-A3DD0B6039A4}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function getView: JIObjectWrapper; cdecl;
    procedure onCreate(P1: JBundle); cdecl;
    procedure onDestroy; cdecl;
    procedure onPause; cdecl;
    procedure onResume; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure setOnResultCallback(P1: JIOnResultCallback); cdecl;
    procedure setOnClickListener(P1: JIObjectWrapper); cdecl;
    procedure turnOnLight; cdecl;
    procedure turnOffLight; cdecl;
    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    procedure setOnLightVisbleCallBack(P1: JIOnLightCallback); cdecl;
    function getLightStatus: Boolean; cdecl;
    procedure resumeContinuouslyScan; cdecl;
    procedure pauseContinuouslyScan; cdecl;
    procedure setOnErrorCallback(P1: JIOnErrorCallback); cdecl;

    { Property }
  end;

  TJIRemoteViewDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteViewDelegate_Stub_ProxyClass, JIRemoteViewDelegate_Stub_Proxy>) end;

  JIRemoteViewDelegate_StubClass = interface(JBinderClass) // or JObjectClass
  ['{CC8FB9CA-27DA-441A-9575-75E8A1B8DF93}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteViewDelegate_Stub; cdecl;
    {class} function asInterface(P1: JIBinder): JIRemoteViewDelegate; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$Stub')]
  JIRemoteViewDelegate_Stub = interface(JBinder) // or JObject
  ['{C004A468-6090-4032-ADC5-BD4964BB51FC}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;

    { Property }
  end;

  TJIRemoteViewDelegate_Stub = class(TJavaGenericImport<JIRemoteViewDelegate_StubClass, JIRemoteViewDelegate_Stub>) end;

  JIRemoteViewDelegate__ParcelClass = interface(JObjectClass)
  ['{BA75CE50-B2AE-4738-A3ED-411F8C13280E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteViewDelegate__Parcel; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$_Parcel')]
  JIRemoteViewDelegate__Parcel = interface(JObject)
  ['{1C1BDF88-C36A-4A16-A1BE-D188E29F1607}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIRemoteViewDelegate__Parcel = class(TJavaGenericImport<JIRemoteViewDelegate__ParcelClass, JIRemoteViewDelegate__Parcel>) end;

  JIRemoteViewDelegateClass = interface(JObjectClass)
  ['{DDB6FB4E-C617-43EA-AC66-41924866069E}']
    { static Property Methods }
    {class} function _GetDESCRIPTOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DESCRIPTOR: JString read _GetDESCRIPTOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate')]
  JIRemoteViewDelegate = interface(IJavaInstance)
  ['{1E98F6D0-8FA6-41D0-AF96-46DF79871C9F}']
    { Property Methods }

    { methods }
    function getView: JIObjectWrapper; cdecl;
    procedure onCreate(P1: JBundle); cdecl;
    procedure onDestroy; cdecl;
    procedure onPause; cdecl;
    procedure onResume; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure setOnResultCallback(P1: JIOnResultCallback); cdecl;
    procedure setOnClickListener(P1: JIObjectWrapper); cdecl;
    procedure turnOnLight; cdecl;
    procedure turnOffLight; cdecl;
    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
    procedure setOnLightVisbleCallBack(P1: JIOnLightCallback); cdecl;
    function getLightStatus: Boolean; cdecl;
    procedure resumeContinuouslyScan; cdecl;
    procedure pauseContinuouslyScan; cdecl;
    procedure setOnErrorCallback(P1: JIOnErrorCallback); cdecl;

    { Property }
  end;

  TJIRemoteViewDelegate = class(TJavaGenericImport<JIRemoteViewDelegateClass, JIRemoteViewDelegate>) end;

//  JbClass = interface(JObjectClass)
//  ['{B437AE58-B68A-4A69-8AD6-5EFB4B5A2C4B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/b')]
//  Jb = interface(JObject)
//  ['{4401CC8A-3805-442D-AAE5-EE202A1D50F5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JIOnErrorCallback_StubClass) // or JObjectClass
//  ['{C7230066-1FFA-4412-AC1E-79361654A411}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/c')]
//  Jc = interface(JIOnErrorCallback_Stub) // or JObject
//  ['{6581D0AF-F01C-47BF-BE09-4B0DBA2AE48B}']
//    { Property Methods }
//
//    { methods }
//    procedure onError(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  JdClass = interface(JIOnLightCallback_StubClass) // or JObjectClass
//  ['{13A98042-15B6-46E1-B701-396741DEEDC4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/d')]
//  Jd = interface(JIOnLightCallback_Stub) // or JObject
//  ['{9E157BB3-EC35-4797-A677-8D108C8AB2D0}']
//    { Property Methods }
//
//    { methods }
//    procedure onVisibleChanged(P1: Boolean); cdecl;
//
//    { Property }
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  JDetailRect_aClass = interface(JObjectClass)
//  ['{3A65B643-E043-4954-86B9-54A783777181}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/DetailRect$a')]
//  JDetailRect_a = interface(JObject)
//  ['{1F989DAB-C0BB-49B5-B4CC-5CFF8DDCA816}']
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
  ['{01539980-8377-4991-8D2D-E948031D096B}']
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
    {class} function _GetCP_PACKAGE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_LOCAL_DECODER: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_VIEWTYPE_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_CAMERA_PERMISSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVALUE_HMS_SCAN_VERSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHMSSCAN_SDK_VALUE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARSE_RESULT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNEW_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUPPORT_ROLLBACK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUSE_APK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
    {class} property CP_PACKAGE: JString read _GetCP_PACKAGE;
    {class} property SCAN_LOCAL_DECODER: JString read _GetSCAN_LOCAL_DECODER;
    {class} property SCAN_VIEWTYPE_FLAG: JString read _GetSCAN_VIEWTYPE_FLAG;
    {class} property SCAN_CAMERA_PERMISSION: JString read _GetSCAN_CAMERA_PERMISSION;
    {class} property VALUE_HMS_SCAN_VERSION: Integer read _GetVALUE_HMS_SCAN_VERSION;
    {class} property HMSSCAN_SDK_VALUE: Integer read _GetHMSSCAN_SDK_VALUE;
    {class} property PARSE_RESULT: JString read _GetPARSE_RESULT;
    {class} property NEW_VERSION: JString read _GetNEW_VERSION;
    {class} property SUPPORT_ROLLBACK: JString read _GetSUPPORT_ROLLBACK;
    {class} property USE_APK: JString read _GetUSE_APK;
    {class} property DEFALT_HMS_SCAN_VERSIONU: Integer read _GetDEFALT_HMS_SCAN_VERSIONU;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/DetailRect')]
  JDetailRect = interface(JObject)
  ['{37DFF08B-E95E-4897-BBAF-D3F06D7AFD30}']
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

//  JeClass = interface(JIOnResultCallback_StubClass) // or JObjectClass
//  ['{3FAD4BC8-7245-4A68-821D-C268FADEFBD3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/e')]
//  Je = interface(JIOnResultCallback_Stub) // or JObject
//  ['{DAC47BA6-A5E0-4255-AD62-150C70B73B0F}']
//    { Property Methods }
//
//    { methods }
//    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;
//
//    { Property }
//  end;

//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  Jf_aClass = interface(JSimpleDateFormatClass) // or JObjectClass
//  ['{C26581FF-96E5-477C-A73D-D282E5585E9E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/f$a')]
//  Jf_a = interface(JSimpleDateFormat) // or JObject
//  ['{69EB29B5-DA6C-489C-8368-277A5E885ACE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_a = class(TJavaGenericImport<Jf_aClass, Jf_a>) end;

//  JfClass = interface(JObjectClass)
//  ['{B19BD7F9-AEB9-4D84-8C72-78BF0EF5EFC9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: TJavaObjectArray<JHmsScan>); cdecl; overload;
//    {class} procedure a(P1: TJavaObjectArray<Js6>); cdecl; overload;
//    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: JHmsBuildBitmapOption): JBundle; cdecl; overload;
//    {class} procedure a(P1: Integer; P2: JBitmap; P3: JBundle); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/f')]
//  Jf = interface(JObject)
//  ['{2BD55209-DFBF-4E0A-B077-8CA37CC3B6E0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

//  JgClass = interface(JObjectClass)
//  ['{37FBA4D4-8A2B-471B-B0E3-7DF42B273064}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function e(P1: JContext): JContext; cdecl;
//    {class} procedure b(P1: JContext); cdecl;
//    {class} function a(P1: JContext): Integer; cdecl; overload;
//    {class} function a: Boolean; cdecl; overload;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: Boolean read _Getb;
//    {class} property c: Boolean read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/g')]
//  Jg = interface(JObject)
//  ['{B90E48EA-0CE2-4C0A-8663-487F2831D739}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

  JOnErrorCallbackClass = interface(JObjectClass)
  ['{2CEA6B23-821A-4AED-BAD4-3F366242C14A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/OnErrorCallback')]
  JOnErrorCallback = interface(IJavaInstance)
  ['{41400D3C-2776-41CD-9E14-895B027F74E0}']
    { Property Methods }

    { methods }
    procedure onError(P1: Integer); cdecl;

    { Property }
  end;

  TJOnErrorCallback = class(TJavaGenericImport<JOnErrorCallbackClass, JOnErrorCallback>) end;

  JOnLightVisibleCallBackClass = interface(JObjectClass)
  ['{3AB31D16-BA2D-41DB-A1F6-0A6E78587E26}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/OnLightVisibleCallBack')]
  JOnLightVisibleCallBack = interface(IJavaInstance)
  ['{D6E487CE-F650-4F13-B7F1-771C9CD67CBC}']
    { Property Methods }

    { methods }
    procedure onVisibleChanged(P1: Boolean); cdecl;

    { Property }
  end;

  TJOnLightVisibleCallBack = class(TJavaGenericImport<JOnLightVisibleCallBackClass, JOnLightVisibleCallBack>) end;

  JOnResultCallbackClass = interface(JObjectClass)
  ['{659019ED-E9D0-4726-9E41-ACA66B6FE123}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/OnResultCallback')]
  JOnResultCallback = interface(IJavaInstance)
  ['{E9258DCF-447B-4489-A457-1D3D5FDE982D}']
    { Property Methods }

    { methods }
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;

    { Property }
  end;

  TJOnResultCallback = class(TJavaGenericImport<JOnResultCallbackClass, JOnResultCallback>) end;

//  JRemoteView_a_aClass = interface(JObjectClass)
//  ['{AAFAC1C9-8681-4080-A977-16719AC7A5C9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$a$a')]
//  JRemoteView_a_a = interface(JObject)
//  ['{81104FC5-51DD-48FA-AB63-6A47E0557174}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJRemoteView_a_a = class(TJavaGenericImport<JRemoteView_a_aClass, JRemoteView_a_a>) end;

//  JRemoteView_a_bClass = interface(JObjectClass)
//  ['{4C7E055C-A84F-4B9B-8B2C-3E6878A4C8F4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$a$b')]
//  JRemoteView_a_b = interface(JObject)
//  ['{CCA0DD35-100A-4B54-AE14-7DC939E54A4B}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJRemoteView_a_b = class(TJavaGenericImport<JRemoteView_a_bClass, JRemoteView_a_b>) end;

//  JRemoteView_aClass = interface(JDeferredLifecycleHelperClass) // or JObjectClass
//  ['{EDFFF31C-519B-4125-9DBE-6647FCAF1718}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$a')]
//  JRemoteView_a = interface(JDeferredLifecycleHelper) // or JObject
//  ['{441689A0-390F-472D-B160-2C307A8BCBD4}']
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
//  ['{15DA60EA-755B-468F-9FE4-4C5F00EC6DBA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$b')]
//  JRemoteView_b = interface(JObject)
//  ['{302C895D-ED08-491B-8126-211D689D0BEE}']
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
  ['{B9A6D21A-C3D0-4013-BD41-EDAF068906E7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRemoteView_Builder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$Builder')]
  JRemoteView_Builder = interface(JObject)
  ['{CCAFFCB2-4557-4419-8C50-833A69BD678C}']
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

  JRemoteViewClass = interface(JFrameLayoutClass) // or JObjectClass
  ['{F1DA8CAD-ADE3-4B87-A26F-2FE92CC7AF58}']
    { static Property Methods }
    {class} function _GetREQUEST_CODE_PHOTO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property REQUEST_CODE_PHOTO: Integer read _GetREQUEST_CODE_PHOTO;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView')]
  JRemoteView = interface(JFrameLayout) // or JObject
  ['{FEF94C7E-0C9F-4D12-B931-D8C6F99FB3CE}']
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
    procedure onRequestPermissionsResult(P1: Integer; P2: TJavaObjectArray<JString>; P3: TJavaArray<Integer>; P4: JActivity); cdecl;

    { Property }
  end;

  TJRemoteView = class(TJavaGenericImport<JRemoteViewClass, JRemoteView>) end;

//  JScanKitActivity_1Class = interface(JObjectClass)
//  ['{0549F00A-04B4-4F6F-A144-41F7E1F256ED}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$1')]
//  JScanKitActivity_1 = interface(JObject)
//  ['{26B8783F-D26E-42C5-8A2C-748D0026D528}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JDialogInterface; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJScanKitActivity_1 = class(TJavaGenericImport<JScanKitActivity_1Class, JScanKitActivity_1>) end;

//  JScanKitActivity_2Class = interface(JObjectClass)
//  ['{B6CE0FE0-3D23-419D-8AE4-0C5ACC0F6F75}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$2')]
//  JScanKitActivity_2 = interface(JObject)
//  ['{379E68AD-764D-4316-861A-F9A0630D27C9}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JDialogInterface; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJScanKitActivity_2 = class(TJavaGenericImport<JScanKitActivity_2Class, JScanKitActivity_2>) end;

//  JScanKitActivity_3Class = interface(JObjectClass)
//  ['{BCFB6923-DA9A-4DAA-B1C4-BB20651A93CD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$3')]
//  JScanKitActivity_3 = interface(JObject)
//  ['{924D7AA1-6E94-4E9F-8AD6-6AA0E44D8DAC}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JDialogInterface; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJScanKitActivity_3 = class(TJavaGenericImport<JScanKitActivity_3Class, JScanKitActivity_3>) end;

//  JScanKitActivity_4Class = interface(JObjectClass)
//  ['{4311BBF5-4B48-45E5-ACAF-E7A50D7B3437}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$4')]
//  JScanKitActivity_4 = interface(JObject)
//  ['{0920CF58-B8FC-49F4-8043-83ADB7DF7BC7}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JDialogInterface; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJScanKitActivity_4 = class(TJavaGenericImport<JScanKitActivity_4Class, JScanKitActivity_4>) end;

//  JScanKitActivity_5Class = interface(JObjectClass)
//  ['{89A4DE56-5D45-412C-B934-C15D1DBF6412}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$5')]
//  JScanKitActivity_5 = interface(JObject)
//  ['{4F642E5B-D91F-41FA-9743-93F9529F6CDF}']
//    { Property Methods }
//
//    { methods }
//    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl;
//
//    { Property }
//  end;

//  TJScanKitActivity_5 = class(TJavaGenericImport<JScanKitActivity_5Class, JScanKitActivity_5>) end;

//  JScanKitActivity_6Class = interface(JObjectClass)
//  ['{7E361601-794E-4F7D-A2AD-19CDCE4FA69D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$6')]
//  JScanKitActivity_6 = interface(JObject)
//  ['{88CEECA8-3E3F-4E37-BA21-5E575966B28E}']
//    { Property Methods }
//
//    { methods }
//    procedure onError(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJScanKitActivity_6 = class(TJavaGenericImport<JScanKitActivity_6Class, JScanKitActivity_6>) end;

//  JScanKitActivity_7Class = interface(JOrientationEventListenerClass) // or JObjectClass
//  ['{330134A2-225A-4043-87EB-B2C982F18B88}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$7')]
//  JScanKitActivity_7 = interface(JOrientationEventListener) // or JObject
//  ['{20C6491C-DAE5-496E-AF1F-05E419C9F627}']
//    { Property Methods }
//
//    { methods }
//    procedure onOrientationChanged(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJScanKitActivity_7 = class(TJavaGenericImport<JScanKitActivity_7Class, JScanKitActivity_7>) end;

  JScanKitActivityClass = interface(JActivityClass) // or JObjectClass
  ['{621E5409-4305-483D-9936-5D059502207B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JScanKitActivity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity')]
  JScanKitActivity = interface(JActivity) // or JObject
  ['{3945DA20-385A-4E0E-8894-BABBABC2D4F6}']
    { Property Methods }

    { methods }
    procedure finish; cdecl;
    procedure onRequestPermissionsResult(P1: Integer; P2: TJavaObjectArray<JString>; P3: TJavaArray<Integer>); cdecl;

    { Property }
  end;

  TJScanKitActivity = class(TJavaGenericImport<JScanKitActivityClass, JScanKitActivity>) end;

  JScanUtilClass = interface(JObjectClass)
  ['{51F023A2-63D2-4A88-A0A1-89F1FA2F990E}']
    { static Property Methods }
    {class} function _GetSUCCESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_NO_CAMERA_PERMISSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_NO_READ_PERMISSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_ABNORMAL_RESTART: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_INVALID_PARAM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCAMERA_INIT_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESULT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESULT_CODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_NO_DETECTED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JScanUtil; cdecl;
    {class} function startScan(P1: JActivity; P2: Integer; P3: JHmsScanAnalyzerOptions): Integer; cdecl;
    {class} function decode(P1: JContext; P2: JHmsScanFrame; P3: JHmsScanFrameOptions): JHmsScanResult; cdecl;
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
    {class} property ERROR_INVALID_PARAM: Integer read _GetERROR_INVALID_PARAM;
    {class} property CAMERA_INIT_ERROR: Integer read _GetCAMERA_INIT_ERROR;
    {class} property RESULT: JString read _GetRESULT;
    {class} property RESULT_CODE: JString read _GetRESULT_CODE;
    {class} property SCAN_NO_DETECTED: Integer read _GetSCAN_NO_DETECTED;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/ScanUtil')]
  JScanUtil = interface(JObject)
  ['{956F96AD-450C-4AC0-9B7E-F69F8DD658F4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJScanUtil = class(TJavaGenericImport<JScanUtilClass, JScanUtil>) end;

  JWriterExceptionClass = interface(JExceptionClass) // or JObjectClass
  ['{F49EEA7B-1E95-4D05-BEA5-B4CD59C5447B}']
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
  ['{5AD2F6A4-2D80-4A69-B75A-D0D1D7A86EF9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWriterException = class(TJavaGenericImport<JWriterExceptionClass, JWriterException>) end;

//  JHmsBuildBitmapOption_1Class = interface(JObjectClass)
//  ['{A100518E-2E37-44A6-BA6E-05CC589A13E0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsBuildBitmapOption$1')]
//  JHmsBuildBitmapOption_1 = interface(JObject)
//  ['{E6E686FB-0425-4C48-83B5-D32029593F9C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJHmsBuildBitmapOption_1 = class(TJavaGenericImport<JHmsBuildBitmapOption_1Class, JHmsBuildBitmapOption_1>) end;

  JHmsBuildBitmapOption_CreatorClass = interface(JObjectClass)
  ['{A613049D-5390-44C0-A4C2-38E98610F930}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHmsBuildBitmapOption_Creator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsBuildBitmapOption$Creator')]
  JHmsBuildBitmapOption_Creator = interface(JObject)
  ['{6851D56B-E4AE-40A6-B4DA-EE0FE0A8A270}']
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
  ['{4EABE02B-AAA5-46C0-8029-829E7873B186}']
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
  ['{EB2995DB-A9A9-40AD-B44E-8D123B9E5A9F}']
    { Property Methods }
    function _Getvalue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setvalue(avalue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property value: JString read _Getvalue write _Setvalue;
  end;

  TJHmsBuildBitmapOption_ErrorCorrectionLevel = class(TJavaGenericImport<JHmsBuildBitmapOption_ErrorCorrectionLevelClass, JHmsBuildBitmapOption_ErrorCorrectionLevel>) end;

  JHmsBuildBitmapOptionClass = interface(JObjectClass)
  ['{7758A8AC-BA9A-489E-A3A0-C67BF81F8A65}']
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
  ['{D33F54BF-44FE-4D22-9752-C4954605FF76}']
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
//  ['{E8D9FB0F-B49A-4E4A-BE1B-9F70256D54A4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$1')]
//  JHmsScan_1 = interface(JObject)
//  ['{D06DDFC6-69FD-48FF-9890-874F1A46161E}']
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
//  ['{5F938223-A7AA-4753-A90D-E1805FD339A0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$AddressInfo$1')]
//  JHmsScan_AddressInfo_1 = interface(JObject)
//  ['{18930A92-5A4D-406A-B21B-17189F64EF8C}']
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
  ['{E267AE88-77DC-4C58-807B-C98F1C2B618D}']
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
  ['{6F10C464-FF16-479A-854C-83B8D4FAC9E4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_AddressInfo_ADDRESS_TYPE = class(TJavaGenericImport<JHmsScan_AddressInfo_ADDRESS_TYPEClass, JHmsScan_AddressInfo_ADDRESS_TYPE>) end;

  JHmsScan_AddressInfoClass = interface(JObjectClass)
  ['{E239E973-CD77-4B49-BB8E-28F83BBAD0FA}']
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
  ['{BE0DFCBE-2F8C-4ADA-A8D7-B6E54B6A371F}']
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
//  ['{044780B5-FCCF-40DC-8D3A-2F365C7F12E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$ContactDetail$1')]
//  JHmsScan_ContactDetail_1 = interface(JObject)
//  ['{178E635F-3E4D-4144-A30E-971F2A78D885}']
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
  ['{ABD6A254-3BEE-4E78-B05A-0C9761626F6D}']
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
  ['{057E2D80-410E-4CDD-A363-3F53F8C22FC2}']
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
//  ['{047E156B-0DE7-4881-9563-C61E4F072670}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$DriverInfo$1')]
//  JHmsScan_DriverInfo_1 = interface(JObject)
//  ['{2F240CE2-7FD9-4CAC-BDB5-5409841697DE}']
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
  ['{73BA30A8-ECDA-4ADD-BBD1-7DEDBC534517}']
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
  ['{85485211-9B88-43DA-A5FA-3A9D46730287}']
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
//  ['{276CC674-0E6C-4913-80C3-EA1F3ACE750B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EmailContent$1')]
//  JHmsScan_EmailContent_1 = interface(JObject)
//  ['{C5761B79-CC61-422A-9748-B2A78207D934}']
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
  ['{9DC32685-F9F3-479C-8D56-0B67C430DFE8}']
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
  ['{DBF6E772-175B-4F06-AAA3-3737857BA246}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_EmailContent_EMAIL_TYPE = class(TJavaGenericImport<JHmsScan_EmailContent_EMAIL_TYPEClass, JHmsScan_EmailContent_EMAIL_TYPE>) end;

  JHmsScan_EmailContentClass = interface(JObjectClass)
  ['{CAA0FA2D-C2A7-4EBF-9E78-4FF7D77F744D}']
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
  ['{F7EEDAB0-2EAF-4463-8B2D-2149BD9F3454}']
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
//  ['{180C47EA-F23C-4493-A49A-97C20722AE6E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EventInfo$1')]
//  JHmsScan_EventInfo_1 = interface(JObject)
//  ['{6F3B48E8-2F8E-4CA3-A920-652886FE805B}']
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
  ['{193CB522-970E-4691-A9F5-853A8C628AB1}']
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
  ['{24B4B2B1-5A67-49FF-BD1B-489DC58C7E5C}']
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
//  ['{99DEE5D5-E6AD-4F85-9899-5B7C0D1C6614}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EventTime$1')]
//  JHmsScan_EventTime_1 = interface(JObject)
//  ['{876ECDC7-C444-433D-846A-221836F1A070}']
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
  ['{C6C9458E-640D-431E-8E73-42AA4CF6BAA9}']
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
  ['{5F26E56E-5052-45F8-B6BB-0754A3BAB6E2}']
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
//  ['{28624F67-E71B-44C8-802E-7356AF219586}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$LinkUrl$1')]
//  JHmsScan_LinkUrl_1 = interface(JObject)
//  ['{5D07BE7F-0B23-440D-ADA6-6BB5F33EEAF1}']
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
  ['{7E9CEFC9-8A32-4A89-88E7-1CF81900ABC5}']
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
  ['{6B9280C0-C5A3-401E-BCC8-F41106C94D4D}']
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
//  ['{F3856AFC-EC03-4E38-BF37-8ACC3944C305}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$LocationCoordinate$1')]
//  JHmsScan_LocationCoordinate_1 = interface(JObject)
//  ['{8BD3B607-C54E-44AD-B614-89AE23580C86}']
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
  ['{CE201114-7E3C-441F-9764-97AF29F8040F}']
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
  ['{5907E8D4-7286-4103-92A0-64374B807D9F}']
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
//  ['{A58FD495-ADE0-4527-9A82-7339B2978E84}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$PeopleName$1')]
//  JHmsScan_PeopleName_1 = interface(JObject)
//  ['{3E362DF1-469F-4678-89F2-161276738427}']
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
  ['{C06022F9-DC25-44F1-81F5-BAFF1B00BC44}']
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
  ['{76D396C0-57EC-47DA-ADC1-63DB61DC8E70}']
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
  ['{8E82E55A-7E7B-4F62-A102-987F3DCE3F5E}']
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
  ['{F5D23592-8E61-4B10-BB3D-90207F1BA159}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_SCAN_TYPE_FORMAT = class(TJavaGenericImport<JHmsScan_SCAN_TYPE_FORMATClass, JHmsScan_SCAN_TYPE_FORMAT>) end;

//  JHmsScan_SmsContent_1Class = interface(JObjectClass)
//  ['{A3304DCE-E56F-42DF-8C74-6B2FE285CE44}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$SmsContent$1')]
//  JHmsScan_SmsContent_1 = interface(JObject)
//  ['{425D2C16-5310-4500-A87A-7A5B279F8B01}']
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
  ['{4685BBDE-AAA0-4BA6-BAB0-1F9680F9DD85}']
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
  ['{876EA342-513A-4C6F-8DFD-F197AEBCAA2D}']
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
//  ['{5A3AC72B-D970-4F77-9ADA-BB1C94638D19}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$1')]
//  JHmsScan_TelPhoneNumber_1 = interface(JObject)
//  ['{21442D46-9DB0-402A-9DB0-8D84566B01A9}']
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
  ['{A0FED64F-2895-41F8-A205-16B29B94E20A}']
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
  ['{6C33D95F-6358-47D7-91F3-C6A8171CE4BB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_TelPhoneNumber_USE_TYPE = class(TJavaGenericImport<JHmsScan_TelPhoneNumber_USE_TYPEClass, JHmsScan_TelPhoneNumber_USE_TYPE>) end;

  JHmsScan_TelPhoneNumberClass = interface(JObjectClass)
  ['{E5BF7C57-BD51-49E9-88DB-1122B6F669FF}']
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
  ['{2B8B28D9-4D24-44E7-B4FE-66295617DCBE}']
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
//  ['{90543548-27A1-42AA-8FBB-AB875212DB6E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo$1')]
//  JHmsScan_WiFiConnectionInfo_1 = interface(JObject)
//  ['{B5A9FBE4-C7AE-4547-BBBE-B263598EACD7}']
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
  ['{3E440B17-12E2-4750-88AA-F1B74B60D1F2}']
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
  ['{E9E5265D-4020-4980-944D-50A182EC3A84}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_WiFiConnectionInfo_CIPHER_MODE = class(TJavaGenericImport<JHmsScan_WiFiConnectionInfo_CIPHER_MODEClass, JHmsScan_WiFiConnectionInfo_CIPHER_MODE>) end;

  JHmsScan_WiFiConnectionInfoClass = interface(JObjectClass)
  ['{B1BDAF49-9DD8-4DE3-AA43-E602C61E2FFA}']
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
  ['{5390EC9A-DD44-47CD-8CD8-7D35859E2D8C}']
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
  ['{B0DFA431-275E-4907-8798-397B52BB3BD5}']
    { static Property Methods }
    {class} function _GetSCAN_FORMAT_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_VIEW_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_ERROR_CHECK_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_GUIDE_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
    {class} function _GetMULTI_FUNCTIONAL_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWX_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOTHER_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHmsScanBase; cdecl; overload;
    {class} function init(P1: JString; P2: Integer; P3: JString; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaObjectArray<JPoint>; P7: JHmsScanAnalyzerOptions): JHmsScanBase; cdecl; overload;

    { static Property }
    {class} property SCAN_FORMAT_FLAG: JString read _GetSCAN_FORMAT_FLAG;
    {class} property SCAN_VIEW_FLAG: JString read _GetSCAN_VIEW_FLAG;
    {class} property SCAN_ERROR_CHECK_FLAG: JString read _GetSCAN_ERROR_CHECK_FLAG;
    {class} property SCAN_GUIDE_FLAG: JString read _GetSCAN_GUIDE_FLAG;
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
    {class} property MULTI_FUNCTIONAL_SCAN_TYPE: Integer read _GetMULTI_FUNCTIONAL_SCAN_TYPE;
    {class} property WX_SCAN_TYPE: Integer read _GetWX_SCAN_TYPE;
    {class} property OTHER_FORM: Integer read _GetOTHER_FORM;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanBase')]
  JHmsScanBase = interface(JObject)
  ['{080F66C4-8BE3-4E6F-9507-65506D49E814}']
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
  ['{9DD7232C-F4F7-4D6B-85CC-E0875F275622}']
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
//    {class} function init(P1: JString; P2: Integer; P3: JString; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaObjectArray<JPoint>; P7: JHmsScanAnalyzerOptions; P8: Jz6): JHmsScan; cdecl; overload;

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
  ['{662282ED-B293-47B0-A7CA-29AA2413D2B0}']
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
//  ['{C458DAFE-DB67-4795-BF13-7C583A3E7EDF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzer$1')]
//  JHmsScanAnalyzer_1 = interface(JObject)
//  ['{EB384839-9AB5-4512-8645-153BE0A2AB52}']
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
  ['{FDFBA6D3-CCDE-44E3-B454-F6DC3FC8D83E}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JHmsScanAnalyzer_Creator; cdecl; overload;
    {class} function init: JHmsScanAnalyzer_Creator; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzer$Creator')]
  JHmsScanAnalyzer_Creator = interface(JObject)
  ['{67A31A82-2628-4D5D-9E5D-FA3A84874904}']
    { Property Methods }

    { methods }
//    function create: JHmsScanAnalyzer; cdecl;
    function setHmsScanTypes(P1: Integer; P2: TJavaArray<Integer>): JHmsScanAnalyzer_Creator; cdecl; overload;
    function setHmsScanTypes(P1: JHmsScanAnalyzerOptions): JHmsScanAnalyzer_Creator; cdecl; overload;

    { Property }
  end;

  TJHmsScanAnalyzer_Creator = class(TJavaGenericImport<JHmsScanAnalyzer_CreatorClass, JHmsScanAnalyzer_Creator>) end;

//  JHmsScanAnalyzerClass = interface(JMLAnalyzerClass) // or JObjectClass
//  ['{618B4C71-7784-49D8-84D0-39DE7AE1695C}']
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
//  ['{8E0B347E-074C-476A-A4DB-3A506ECD1E1E}']
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
//  ['{0CA110CD-FD7D-4F29-A4C0-36FFC56A2DC4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzerOptions$1')]
//  JHmsScanAnalyzerOptions_1 = interface(JObject)
//  ['{71DC3F28-A6A3-456B-9193-479F847A62EF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJHmsScanAnalyzerOptions_1 = class(TJavaGenericImport<JHmsScanAnalyzerOptions_1Class, JHmsScanAnalyzerOptions_1>) end;

  JHmsScanAnalyzerOptions_CreatorClass = interface(JObjectClass)
  ['{D7429D1A-ABCA-44C2-A4EE-983891E57431}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHmsScanAnalyzerOptions_Creator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzerOptions$Creator')]
  JHmsScanAnalyzerOptions_Creator = interface(JObject)
  ['{FB020A99-85EE-46FF-8217-C230A4F459A9}']
    { Property Methods }

    { methods }
    function setHmsScanTypes(P1: Integer; P2: TJavaArray<Integer>): JHmsScanAnalyzerOptions_Creator; cdecl;
    function setPhotoMode(P1: Boolean): JHmsScanAnalyzerOptions_Creator; cdecl;
    function setViewType(P1: Integer): JHmsScanAnalyzerOptions_Creator; cdecl;
    function setErrorCheck(P1: Boolean): JHmsScanAnalyzerOptions_Creator; cdecl;
    function setParseResult(P1: Boolean): JHmsScanAnalyzerOptions_Creator; cdecl;
    function setShowGuide(P1: Boolean): JHmsScanAnalyzerOptions_Creator; cdecl;
    function create: JHmsScanAnalyzerOptions; cdecl;

    { Property }
  end;

  TJHmsScanAnalyzerOptions_Creator = class(TJavaGenericImport<JHmsScanAnalyzerOptions_CreatorClass, JHmsScanAnalyzerOptions_Creator>) end;

  JHmsScanAnalyzerOptionsClass = interface(JObjectClass)
  ['{63447439-A84A-4C80-9868-EDB67D07BA58}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzerOptions')]
  JHmsScanAnalyzerOptions = interface(JObject)
  ['{A96A2851-7C69-4ED0-B57E-72C2B263E3E0}']
    { Property Methods }
    function _Getmode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setmode(amode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetphotoMode: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetphotoMode(aphotoMode: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetparseResult: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetparseResult(aparseResult: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetviewType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetviewType(aviewType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GeterrorCheck: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeterrorCheck(aerrorCheck: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetshowGuide: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetshowGuide(ashowGuide: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
    property mode: Integer read _Getmode write _Setmode;
    property photoMode: Boolean read _GetphotoMode write _SetphotoMode;
    property parseResult: Boolean read _GetparseResult write _SetparseResult;
    property viewType: Integer read _GetviewType write _SetviewType;
    property errorCheck: Boolean read _GeterrorCheck write _SeterrorCheck;
    property showGuide: Boolean read _GetshowGuide write _SetshowGuide;
  end;

  TJHmsScanAnalyzerOptions = class(TJavaGenericImport<JHmsScanAnalyzerOptionsClass, JHmsScanAnalyzerOptions>) end;

  JHmsScanBase_SCAN_TYPEClass = interface(JEnumClass) // or JObjectClass
  ['{6EA97644-AE10-4D77-B3E1-D60D29AADDBB}']
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
    {class} function _GetMULTI_FUNCTIONAL_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWX_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

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
    {class} property MULTI_FUNCTIONAL_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetMULTI_FUNCTIONAL_SCAN_TYPE;
    {class} property WX_SCAN_TYPE: JHmsScanBase_SCAN_TYPE read _GetWX_SCAN_TYPE;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE')]
  JHmsScanBase_SCAN_TYPE = interface(JEnum) // or JObject
  ['{B90BF5B3-A4F3-4AF2-8CE6-DFABF6590897}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScanBase_SCAN_TYPE = class(TJavaGenericImport<JHmsScanBase_SCAN_TYPEClass, JHmsScanBase_SCAN_TYPE>) end;

  JHmsScanFrameClass = interface(JObjectClass)
  ['{26073FCF-E3BF-47B4-B885-DC5F71298974}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JYuvImage): JHmsScanFrame; cdecl; overload;
    {class} function init(P1: JBitmap): JHmsScanFrame; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanFrame')]
  JHmsScanFrame = interface(JObject)
  ['{2A5FB2BD-FE9A-49BD-A71A-9C512D5F0432}']
    { Property Methods }

    { methods }
    function getBitmap: JBitmap; cdecl;
    function getYuvImage: JYuvImage; cdecl;
    function getWidth: Integer; cdecl;
    function getHeight: Integer; cdecl;

    { Property }
  end;

  TJHmsScanFrame = class(TJavaGenericImport<JHmsScanFrameClass, JHmsScanFrame>) end;

//  JHmsScanFrameOptions_1Class = interface(JObjectClass)
//  ['{BDB82D1F-93C2-4A97-B1FA-D5101655E903}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScanFrameOptions$1')]
//  JHmsScanFrameOptions_1 = interface(JObject)
//  ['{CDB739BB-955F-4814-8F25-FE28583B53EA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJHmsScanFrameOptions_1 = class(TJavaGenericImport<JHmsScanFrameOptions_1Class, JHmsScanFrameOptions_1>) end;

  JHmsScanFrameOptions_CreatorClass = interface(JObjectClass)
  ['{AA2B5916-B42E-4E6E-A0B6-23DA03F782B7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHmsScanFrameOptions_Creator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanFrameOptions$Creator')]
  JHmsScanFrameOptions_Creator = interface(JObject)
  ['{3C189A30-1541-4833-9F9F-9D08350A6861}']
    { Property Methods }

    { methods }
    function setHmsScanTypes(P1: Integer; P2: TJavaArray<Integer>): JHmsScanFrameOptions_Creator; cdecl;
    function setPhotoMode(P1: Boolean): JHmsScanFrameOptions_Creator; cdecl;
    function setMultiMode(P1: Boolean): JHmsScanFrameOptions_Creator; cdecl;
    function setParseResult(P1: Boolean): JHmsScanFrameOptions_Creator; cdecl;
    function create: JHmsScanFrameOptions; cdecl;

    { Property }
  end;

  TJHmsScanFrameOptions_Creator = class(TJavaGenericImport<JHmsScanFrameOptions_CreatorClass, JHmsScanFrameOptions_Creator>) end;

  JHmsScanFrameOptionsClass = interface(JObjectClass)
  ['{D4620969-21DF-4A10-AE1A-FC44662B3370}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanFrameOptions')]
  JHmsScanFrameOptions = interface(JObject)
  ['{6E192C63-2025-4CBA-B210-15849F4DEE0C}']
    { Property Methods }

    { methods }
    function getType: Integer; cdecl;
    function isMultiMode: Boolean; cdecl;
    function isPhotoMode: Boolean; cdecl;
    function isParseResult: Boolean; cdecl;

    { Property }
  end;

  TJHmsScanFrameOptions = class(TJavaGenericImport<JHmsScanFrameOptionsClass, JHmsScanFrameOptions>) end;

//  JHmsScanResult_1Class = interface(JObjectClass)
//  ['{60DD2A83-55FB-4925-A127-49454D0AB1A4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScanResult$1')]
//  JHmsScanResult_1 = interface(JObject)
//  ['{A4156DC9-7D13-40BC-B419-63BE32025568}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScanResult; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScanResult>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJHmsScanResult_1 = class(TJavaGenericImport<JHmsScanResult_1Class, JHmsScanResult_1>) end;

  JHmsScanResultClass = interface(JObjectClass)
  ['{CAB1B547-B097-4DBA-8749-89D5A0A537FD}']
    { static Property Methods }
    {class} function _GetSCAN_PARSE_FAILED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_NEED_ZOOM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_OVEREXPOSED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_UNDEREXPOSED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: Integer; P2: TJavaObjectArray<JHmsScan>): JHmsScanResult; cdecl;

    { static Property }
    {class} property SCAN_PARSE_FAILED: Integer read _GetSCAN_PARSE_FAILED;
    {class} property SCAN_NEED_ZOOM: Integer read _GetSCAN_NEED_ZOOM;
    {class} property SCAN_OVEREXPOSED: Integer read _GetSCAN_OVEREXPOSED;
    {class} property SCAN_UNDEREXPOSED: Integer read _GetSCAN_UNDEREXPOSED;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanResult')]
  JHmsScanResult = interface(JObject)
  ['{282D0CA4-2756-41AD-97A6-EA9B2F55D4B5}']
    { Property Methods }

    { methods }
    function getState: Integer; cdecl;
    function getHmsScans: TJavaObjectArray<JHmsScan>; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
  end;

  TJHmsScanResult = class(TJavaGenericImport<JHmsScanResultClass, JHmsScanResult>) end;

//  Ja_a_121Class = interface(JEnumClass) // or JObjectClass
//  ['{F990555A-3B75-446F-81E4-7B621E6C5900}']
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
//  Ja_a_121 = interface(JEnum) // or JObject
//  ['{2AA1B3B8-452C-432A-8331-5676E16B0645}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_a_121 = class(TJavaGenericImport<Ja_a_121Class, Ja_a_121>) end;

//  Ja_122Class = interface(JHandlerClass) // or JObjectClass
//  ['{DB53F50E-4E8E-435B-B4C5-2504972FB7F9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/a')]
//  Ja_122 = interface(JHandler) // or JObject
//  ['{90606D74-E8EA-4D9E-BA03-7DAD9FEF9CED}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl; overload;
//    procedure a(P1: Je5); cdecl; overload;
//    function a: Boolean; cdecl; overload;
//    procedure handleMessage(P1: JMessage); cdecl;
//    procedure e; cdecl;
//    procedure f; cdecl;
//    procedure a(P1: Ju6); cdecl; overload;
//    procedure c(P1: Boolean); cdecl; overload;
//    function c: Boolean; cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    function d: Boolean; cdecl;
//    procedure b(P1: Boolean); cdecl; overload;
//
//    { Property }
//  end;

//  TJa_122 = class(TJavaGenericImport<Ja_122Class, Ja_122>) end;

//  JBarcodeFormat_aClass = interface(JObjectClass)
//  ['{3CE11068-6938-4893-A577-64F2893D2A54}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/aiscan/common/BarcodeFormat$a')]
//  JBarcodeFormat_a = interface(JObject)
//  ['{F3D6A569-C027-4784-BB6E-7D303E3D6AAD}']
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
  ['{9047171F-6F29-4791-8708-C9BFA92C17B2}']
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
    {class} function _Getp: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getq: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
    {class} property p: JBarcodeFormat read _Getp;
    {class} property q: JBarcodeFormat read _Getq;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/scankit/aiscan/common/BarcodeFormat')]
  JBarcodeFormat = interface(JEnum) // or JObject
  ['{8E6FB7E6-1881-4E13-BB5C-E149CA083FF7}']
    { Property Methods }

    { methods }
    function describeContents: Integer; cdecl;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;

    { Property }
  end;

  TJBarcodeFormat = class(TJavaGenericImport<JBarcodeFormatClass, JBarcodeFormat>) end;

//  Jb_aClass = interface(JObjectClass)
//  ['{940EB91C-7AD2-4C0E-93B1-0306EAA63403}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b$a')]
//  Jb_a = interface(JObject)
//  ['{9E0AD078-B21F-4971-90DE-E050F7475CDE}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  Jb_bClass = interface(JObjectClass)
//  ['{D535ECF2-825D-44C3-A250-B7B3A3456C57}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b$b')]
//  Jb_b = interface(JObject)
//  ['{CB06D802-A41D-4763-BBEF-EA50A9266AD9}']
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
//  ['{0E90549C-402F-4AE2-92DC-A5B7EFE9FB34}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b$c')]
//  Jb_c = interface(JObject)
//  ['{77948B1C-5F97-43A4-9700-383A2039D1F5}']
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
//  ['{59F50762-EFED-49F9-8811-6F952AA8C365}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b$d')]
//  Jb_d = interface(JObject)
//  ['{DA04E3B5-2107-4212-A902-2D38169FA14E}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: JBitmap; P3: Single); cdecl;
//
//    { Property }
//  end;

//  TJb_d = class(TJavaGenericImport<Jb_dClass, Jb_d>) end;

//  Jb_129Class = interface(JObjectClass)
//  ['{A5D79448-7646-4F5A-B142-B8E2D57BD801}']
//    { static Property Methods }
//    {class} function _GetH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetI: Jv3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetJ: Jw3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JTextureView; P3: JViewfinderView; P4: JRect; P5: Integer; P6: JIObjectWrapper; P7: Boolean; P8: JString; P9: Boolean): Jb_129; cdecl;
//
//    { static Property }
//    {class} property H: JString read _GetH;
//    {class} property I: Jv3 read _GetI;
//    {class} property J: Jw3 read _GetJ;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b')]
//  Jb_129 = interface(JObject)
//  ['{AF7C4F1C-BD23-41CE-8576-F28E42782640}']
//    { Property Methods }
//    function _Geti: JTextureView;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: JTextureView);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure c; cdecl; overload;
//    procedure g; cdecl;
//    procedure f; cdecl;
//    procedure h; cdecl;
//    procedure e; cdecl;
//    procedure d; cdecl;
//    function b(P1: JMotionEvent): Boolean; cdecl; overload;
//    procedure b(P1: Boolean); cdecl; overload;
//    procedure c(P1: Boolean); cdecl; overload;
//    procedure i; cdecl;
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: JBitmap); cdecl; overload;
//    function a(P1: Boolean): Jb; cdecl; overload;
//    function a(P1: Je5): Jb; cdecl; overload;
//    procedure a(P1: JIOnResultCallback); cdecl; overload;
//    function a: Jj0; cdecl; overload;
//    procedure a(P1: JIOnErrorCallback); cdecl; overload;
//    function b: Boolean; cdecl; overload;
//
//    { Property }
//    property i: JTextureView read _Geti write _Seti;
//  end;

//  TJb_129 = class(TJavaGenericImport<Jb_129Class, Jb_129>) end;

//  Jc_aClass = interface(JAsyncTaskClass) // or JObjectClass
//  ['{F0CC21FA-4205-46EE-9B6E-370808646831}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc): Jc_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/c$a')]
//  Jc_a = interface(JAsyncTask) // or JObject
//  ['{CE9A0C4A-A3CB-499A-ADE4-D0FD647B824C}']
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

//  Jc_131Class = interface(JHandlerClass) // or JObjectClass
//  ['{509FFE12-D078-4BE0-9765-EBDF2E053200}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/c')]
//  Jc_131 = interface(JHandler) // or JObject
//  ['{A25C67CD-2A49-4DFE-A661-BA2675B04542}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//    procedure a(P1: JRect; P2: Boolean); cdecl; overload;
//    function b(P1: Single): Boolean; cdecl; overload;
//    procedure a(P1: Integer; P2: JList); cdecl; overload;
//    function a(P1: Single): Integer; cdecl; overload;
//    function c: Single; cdecl;
//    function b: JList; cdecl; overload;
//
//    { Property }
//  end;

//  TJc_131 = class(TJavaGenericImport<Jc_131Class, Jc_131>) end;

  JCreatorClass = interface(JIRemoteCreator_StubClass) // or JObjectClass
  ['{88B2A6FB-2E94-4F73-94D2-BC60F6206B39}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCreator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/Creator')]
  JCreator = interface(JIRemoteCreator_Stub) // or JObject
  ['{F5D939A0-B070-4030-8699-2D01496DADA3}']
    { Property Methods }

    { methods }
    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl;

    { Property }
  end;

  TJCreator = class(TJavaGenericImport<JCreatorClass, JCreator>) end;

//  Jd_133Class = interface(JThreadClass) // or JObjectClass
//  ['{9E440006-3BE2-401D-998F-1289D323720B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/d')]
//  Jd_133 = interface(JThread) // or JObject
//  ['{D3A013AA-99BA-45A0-BB72-3328713F7F8A}']
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

//  TJd_133 = class(TJavaGenericImport<Jd_133Class, Jd_133>) end;

  JDecoderCreatorClass = interface(JIRemoteDecoderCreator_StubClass) // or JObjectClass
  ['{90849550-1886-4FBE-BBBB-5A147DF99D25}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDecoderCreator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/DecoderCreator')]
  JDecoderCreator = interface(JIRemoteDecoderCreator_Stub) // or JObject
  ['{C44C57A8-DA41-4F3E-9DF0-70F75F1118C5}']
    { Property Methods }

    { methods }
    function newRemoteFrameDecoderDelegate: JIRemoteFrameDecoderDelegate; cdecl;

    { Property }
  end;

  TJDecoderCreator = class(TJavaGenericImport<JDecoderCreatorClass, JDecoderCreator>) end;

//  JScanDrawable_aClass = interface(JObjectClass)
//  ['{10C540BD-4012-448A-8E25-6607AF31692B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/drawable/ScanDrawable$a')]
//  JScanDrawable_a = interface(JObject)
//  ['{9EC67019-C2C5-4CAB-91C6-FE9A7B216F1F}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(P1: JValueAnimator); cdecl;
//
//    { Property }
//  end;

//  TJScanDrawable_a = class(TJavaGenericImport<JScanDrawable_aClass, JScanDrawable_a>) end;

//  JScanDrawable_bClass = interface(JAnimatorListenerAdapterClass) // or JObjectClass
//  ['{BD1992D2-BA68-44DE-80EA-9E5CC0939D59}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/drawable/ScanDrawable$b')]
//  JScanDrawable_b = interface(JAnimatorListenerAdapter) // or JObject
//  ['{438EF68B-3CC4-492C-83B6-4D5098CDBE74}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationRepeat(P1: JAnimator); cdecl;
//
//    { Property }
//  end;

//  TJScanDrawable_b = class(TJavaGenericImport<JScanDrawable_bClass, JScanDrawable_b>) end;

//  JScanDrawable_cClass = interface(JAnimatorListenerAdapterClass) // or JObjectClass
//  ['{15243657-0900-4337-983F-CC393D912A12}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/drawable/ScanDrawable$c')]
//  JScanDrawable_c = interface(JAnimatorListenerAdapter) // or JObject
//  ['{86CDBD0A-B77E-4945-BE98-2B5C4B2AA0DC}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationRepeat(P1: JAnimator); cdecl;
//
//    { Property }
//  end;

//  TJScanDrawable_c = class(TJavaGenericImport<JScanDrawable_cClass, JScanDrawable_c>) end;

  JScanDrawableClass = interface(JDrawableClass) // or JObjectClass
  ['{0616346C-1436-44D0-B16A-0B62A57AD344}']
    { static Property Methods }

    { static Methods }
    {class} function init: JScanDrawable; cdecl; overload;
    {class} function init(P1: JResources): JScanDrawable; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/drawable/ScanDrawable')]
  JScanDrawable = interface(JDrawable) // or JObject
  ['{9F329E1E-FC74-46BA-9334-A9964D5ED8D6}']
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

//  Je_aClass = interface(JObjectClass)
//  ['{D0FB746A-82D7-4179-B53B-92829A16FD12}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/e$a')]
//  Je_a = interface(JObject)
//  ['{DA8FACA3-0D26-4316-8B78-5F0BB3D2C330}']
//    { Property Methods }
//
//    { methods }
//    function onTouch(P1: JView; P2: JMotionEvent): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

//  Je_bClass = interface(JOrientationEventListenerClass) // or JObjectClass
//  ['{FDCF4B31-ACFD-4F6E-A94E-29FA8254EA91}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/e$b')]
//  Je_b = interface(JOrientationEventListener) // or JObject
//  ['{AE9252DB-5419-40C2-8DA6-C7B98DF0115A}']
//    { Property Methods }
//
//    { methods }
//    procedure onOrientationChanged(P1: Integer); cdecl;
//
//    { Property }
//  end;

//  TJe_b = class(TJavaGenericImport<Je_bClass, Je_b>) end;

//  Je_cClass = interface(JObjectClass)
//  ['{27188617-2250-4075-B394-50CD3687954F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/e$c')]
//  Je_c = interface(JObject)
//  ['{BFA887A5-6AC0-40BE-ABDC-B704D0A37E10}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJe_c = class(TJavaGenericImport<Je_cClass, Je_c>) end;

//  Je_142Class = interface(JIRemoteViewDelegate_StubClass) // or JObjectClass
//  ['{FCAA4F97-EB1C-4A98-AD4D-FABC29527058}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Integer; P3: JObject; P4: JIObjectWrapper; P5: Boolean; P6: Boolean; P7: Boolean): Je_142; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/e')]
//  Je_142 = interface(JIRemoteViewDelegate_Stub) // or JObject
//  ['{EBA3DBCA-AD70-45B4-86C1-D09C61E45524}']
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

//  TJe_142 = class(TJavaGenericImport<Je_142Class, Je_142>) end;

//  Jf_143Class = interface(JIRemoteDecoderDelegate_StubClass) // or JObjectClass
//  ['{89C142B8-4AB8-46AF-8A2A-37F4DD48C325}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf_143; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/f')]
//  Jf_143 = interface(JIRemoteDecoderDelegate_Stub) // or JObject
//  ['{415C0682-A53C-4117-B133-E1FEEA616398}']
//    { Property Methods }
//
//    { methods }
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    function decodeWithBuffer(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: JIObjectWrapper): JHmsScanResult; cdecl;
//    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl;
//    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
//    function queryDeepLinkInfo(P1: JIObjectWrapper): JIObjectWrapper; cdecl;
//
//    { Property }
//  end;

//  TJf_143 = class(TJavaGenericImport<Jf_143Class, Jf_143>) end;

//  Jg_144Class = interface(JIRemoteHmsDecoderDelegate_StubClass) // or JObjectClass
//  ['{6B615C4C-2501-4A5C-BEEB-7065CC566E0B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg_144; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/g')]
//  Jg_144 = interface(JIRemoteHmsDecoderDelegate_Stub) // or JObject
//  ['{51452C31-D46E-403C-AD22-D2EE24ECD1E3}']
//    { Property Methods }
//
//    { methods }
//    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl;
//
//    { Property }
//  end;

//  TJg_144 = class(TJavaGenericImport<Jg_144Class, Jg_144>) end;

//  Jh_aClass = interface(JObjectClass)
//  ['{878E01BD-6266-4BCF-9BCA-FF02BD689BE7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/h$a')]
//  Jh_a = interface(JObject)
//  ['{80363FCB-5F77-44E5-80C0-9E8A3F90C7F3}']
//    { Property Methods }
//
//    { methods }
//    procedure onGlobalLayout; cdecl;
//
//    { Property }
//  end;

//  TJh_a = class(TJavaGenericImport<Jh_aClass, Jh_a>) end;

//  JhClass = interface(JiClass) // or JObjectClass
//  ['{A635B3E2-2A2B-4CB6-AD5E-C0E889D72B7E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Integer; P3: JIObjectWrapper; P4: Boolean; P5: Boolean; P6: Integer; P7: Boolean; P8: Boolean): Jh; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/h')]
//  Jh = interface(Ji) // or JObject
//  ['{8B1461BC-E4FE-4F74-99B4-FD7F0B317F7D}']
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
//  ['{CC77310D-25AC-40B8-86A2-5ED4FAF406B8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/i$a')]
//  Ji_a = interface(JObject)
//  ['{12E6455F-AEB5-406B-8AB2-77F9F7AAFC21}']
//    { Property Methods }
//
//    { methods }
//    procedure onGlobalLayout; cdecl;
//
//    { Property }
//  end;

//  TJi_a = class(TJavaGenericImport<Ji_aClass, Ji_a>) end;

//  Ji_bClass = interface(JObjectClass)
//  ['{155865EE-D0E8-443B-AD28-EDDF787CB633}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/i$b')]
//  Ji_b = interface(JObject)
//  ['{F6120615-4C05-41DC-B9BC-33262C4CD75A}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJi_b = class(TJavaGenericImport<Ji_bClass, Ji_b>) end;

//  Ji_cClass = interface(JObjectClass)
//  ['{231629A3-955A-4C02-B06F-E1A98483D37F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/i$c')]
//  Ji_c = interface(JObject)
//  ['{7824DCF6-F4BF-4C30-B258-E735438C151D}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJi_c = class(TJavaGenericImport<Ji_cClass, Ji_c>) end;

//  JiClass = interface(Je_142Class) // or JObjectClass
//  ['{738F6941-7A02-46FD-B43A-C392804088E5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Integer; P3: JIObjectWrapper; P4: Boolean; P5: Boolean): Ji; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/i')]
//  Ji = interface(Je_142) // or JObject
//  ['{2B5DFB1F-1DF6-4EB9-BE84-9FA11A0E01E3}']
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
//  ['{D8AB0389-F69C-4396-A772-C424F6FE41B1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jd): Jj; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/j')]
//  Jj = interface(JObject)
//  ['{63FD181C-C98E-4DB6-81D6-FC47400947E5}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Byte>); cdecl;
//
//    { Property }
//  end;

//  TJj = class(TJavaGenericImport<JjClass, Jj>) end;

//  Ja_152Class = interface(JExceptionClass) // or JObjectClass
//  ['{AADE08B1-7818-4027-A1F8-32D1A6C14B4E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Ja; cdecl; overload;
//    {class} function a(P1: JString): Ja; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a')]
//  Ja_152 = interface(JException) // or JObject
//  ['{A0166863-FF89-40C9-9BA9-16810BE29924}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_152 = class(TJavaGenericImport<Ja_152Class, Ja_152>) end;

//  Ja0Class = interface(JObjectClass)
//  ['{3457F7E8-DEA4-46AE-85BF-F56C14043A66}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a0')]
//  Ja0 = interface(JObject)
//  ['{1106F537-42EE-46EC-9E20-DB56DE717030}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa0 = class(TJavaGenericImport<Ja0Class, Ja0>) end;

//  Ja1Class = interface(JObjectClass)
//  ['{9FD510AB-BB46-48A4-91CF-A34B9BE6A8CE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Boolean): Ja1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a1')]
//  Ja1 = interface(JObject)
//  ['{2464646F-9926-44D8-805F-7B0340CD3E89}']
//    { Property Methods }
//
//    { methods }
//    function a: JString; cdecl;
//
//    { Property }
//  end;

//  TJa1 = class(TJavaGenericImport<Ja1Class, Ja1>) end;

//  Ja2Class = interface(JObjectClass)
//  ['{90104F00-AD42-487B-BDC7-C2761D24BDB3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a2')]
//  Ja2 = interface(JObject)
//  ['{AEBAE97B-6EB9-48BB-BFB0-D40B74A98414}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJa2 = class(TJavaGenericImport<Ja2Class, Ja2>) end;

//  Ja3Class = interface(JObjectClass)
//  ['{6F1C8D30-8E3A-4A6C-AF69-A508D9D16C19}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a3')]
//  Ja3 = interface(JObject)
//  ['{D7B63D2E-BB7E-4010-9A18-713B220695AB}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Integer>; P2: Integer; P3: TJavaArray<Integer>): Integer; cdecl;
//
//    { Property }
//  end;

//  TJa3 = class(TJavaGenericImport<Ja3Class, Ja3>) end;

//  Ja4_aClass = interface(JThreadClass) // or JObjectClass
//  ['{0D9C6545-5141-4173-881F-082AA4E256FA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a4$a')]
//  Ja4_a = interface(JThread) // or JObject
//  ['{640DECF9-15C8-406D-A667-0AA59242654A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJa4_a = class(TJavaGenericImport<Ja4_aClass, Ja4_a>) end;

//  Ja4_bClass = interface(JObjectClass)
//  ['{2572CD2F-B0D6-44BB-A6A9-03BFE51E6B55}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a4$b')]
//  Ja4_b = interface(JObject)
//  ['{24F268EF-87EB-4A6A-A6CC-2D59AF7F878B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa4_b = class(TJavaGenericImport<Ja4_bClass, Ja4_b>) end;

//  Ja4_cClass = interface(JTimerTaskClass) // or JObjectClass
//  ['{55247A6C-ADCD-4787-A9A9-D6FD24FB91E2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a4$c')]
//  Ja4_c = interface(JTimerTask) // or JObject
//  ['{3D7C7DE2-1B47-4F22-A2F3-92B9E1E149BD}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJa4_c = class(TJavaGenericImport<Ja4_cClass, Ja4_c>) end;

//  Ja4Class = interface(JObjectClass)
//  ['{A1E12510-502B-4F71-AAFE-DC45F67AE667}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b: Ja4; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a4')]
//  Ja4 = interface(JObject)
//  ['{B99CAFC9-2315-465A-B4FB-1A83D144FFD0}']
//    { Property Methods }
//
//    { methods }
//    procedure b(P1: JString; P2: JLinkedHashMap); cdecl; overload;
//
//    { Property }
//  end;

//  TJa4 = class(TJavaGenericImport<Ja4Class, Ja4>) end;

//  Ja5Class = interface(JObjectClass)
//  ['{9DF2F90A-2230-49F9-9962-003B9824CA26}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja5; cdecl;
//    {class} function a(P1: Js6; P2: Single; P3: Single): Boolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a5')]
//  Ja5 = interface(JObject)
//  ['{43F1714E-6E95-4D14-A426-809A8179A5EE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Js6; cdecl; overload;
//    function a(P1: JMap): TJavaObjectArray<Jo6>; cdecl; overload;
//    function a(P1: Jp; P2: Jp; P3: JMap; P4: Jm4; P5: Jj2): Js6; cdecl; overload;
//    function a(P1: Jp; P2: Jp; P3: Jp; P4: JMap; P5: Jm4; P6: Jj2): Js6; cdecl; overload;
//    function c(P1: Jp; P2: Jm4; P3: JMap; P4: Jj2): Js6; cdecl;
//    function b(P1: Jp; P2: Jp; P3: Jp; P4: JMap; P5: Jm4; P6: Jj2): Js6; cdecl; overload;
//    function b(P1: Jp; P2: Jm4; P3: JMap; P4: Jj2): Js6; cdecl; overload;
//    function a(P1: Jp; P2: Jp; P3: Jm4; P4: JMap): Js6; cdecl; overload;
//
//    { Property }
//  end;

//  TJa5 = class(TJavaGenericImport<Ja5Class, Ja5>) end;

//  Ja6Class = interface(JObjectClass)
//  ['{71CFC582-A1C6-4A48-832C-CB98B528CAD0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single): Ja6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a6')]
//  Ja6 = interface(JObject)
//  ['{F3C19430-16AE-47E7-8ED4-77299A989131}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jw5); cdecl;
//
//    { Property }
//  end;

//  TJa6 = class(TJavaGenericImport<Ja6Class, Ja6>) end;

//  Ja7Class = interface(Ji7Class) // or JObjectClass
//  ['{2DB65B08-73C0-4BDA-8C06-39F385CA8A1C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a7')]
//  Ja7 = interface(Ji7) // or JObject
//  ['{AC465760-602D-4957-BDF8-CEF597ED8782}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJa7 = class(TJavaGenericImport<Ja7Class, Ja7>) end;

//  Ja8_aClass = interface(JObjectClass)
//  ['{7D9E703B-FC9B-4F45-B785-2136D5D9E715}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a8$a')]
//  Ja8_a = interface(JObject)
//  ['{51478CED-DA72-4DFC-B14A-0D26E4590C2B}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJa8_a = class(TJavaGenericImport<Ja8_aClass, Ja8_a>) end;

//  Ja8_bClass = interface(JObjectClass)
//  ['{EE38D583-D549-44E4-A799-1742AA99810B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a8$b')]
//  Ja8_b = interface(JObject)
//  ['{5A895B9F-4907-4D5B-912F-F12F8C1E44E4}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function a: TJavaObjectArray<Ja8_a>; cdecl;
//
//    { Property }
//  end;

//  TJa8_b = class(TJavaGenericImport<Ja8_bClass, Ja8_b>) end;

//  Ja8Class = interface(JObjectClass)
//  ['{2828C0C1-E8CD-48D1-AAF0-B2B2E7A094C3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: Integer): Ja8; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a8')]
//  Ja8 = interface(JObject)
//  ['{C5326249-A214-4D6A-A576-7ECD919EAE06}']
//    { Property Methods }
//
//    { methods }
//    function m: Integer; cdecl;
//    function l: Integer; cdecl;
//    function k: Integer; cdecl;
//    function a(P1: Jc3): Ja8_b; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJa8 = class(TJavaGenericImport<Ja8Class, Ja8>) end;

//  Jb_167Class = interface(JObjectClass)
//  ['{819A359E-F7DD-4DE2-AB4B-ACD5F42E8EE3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b')]
//  Jb_167 = interface(JObject)
//  ['{75B0E121-D9FE-4754-A225-81C11E72C0F9}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jy2); cdecl; overload;
//
//    { Property }
//  end;

//  TJb_167 = class(TJavaGenericImport<Jb_167Class, Jb_167>) end;

//  Jb0Class = interface(JObjectClass)
//  ['{A6078723-C4D1-4E3B-A214-B582BA9D9792}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b0')]
//  Jb0 = interface(JObject)
//  ['{8ED95D2D-1831-43C9-A850-0BF738107298}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb0 = class(TJavaGenericImport<Jb0Class, Jb0>) end;

//  Jb1Class = interface(JObjectClass)
//  ['{3D421BEF-6193-4DB9-BB25-A89A010B27FE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Single; P4: Single): Jb1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b1')]
//  Jb1 = interface(JObject)
//  ['{6A233BB4-FA62-4945-B134-BE00CE32D2E6}']
//    { Property Methods }
//
//    { methods }
//    function getInterpolation(P1: Single): Single; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJb1 = class(TJavaGenericImport<Jb1Class, Jb1>) end;

//  Jb2Class = interface(JObjectClass)
//  ['{E39AF335-F591-4B34-8E23-90C707CA72E9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b2')]
//  Jb2 = interface(JObject)
//  ['{83435AE2-53C4-451E-A3E1-40D1E9EFAB13}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJb2 = class(TJavaGenericImport<Jb2Class, Jb2>) end;

//  Jb3Class = interface(JEnumClass) // or JObjectClass
//  ['{1A823F30-2089-46CC-A1E8-44EF0EE46A28}']
//    { static Property Methods }
//    {class} function _Getb: Jb3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jb3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jb3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jb3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jb3>; cdecl;
//    {class} function valueOf(P1: JString): Jb3; cdecl;
//    {class} function a(P1: Integer): Jb3; cdecl;
//
//    { static Property }
//    {class} property b: Jb3 read _Getb;
//    {class} property c: Jb3 read _Getc;
//    {class} property d: Jb3 read _Getd;
//    {class} property e: Jb3 read _Gete;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b3')]
//  Jb3 = interface(JEnum) // or JObject
//  ['{99405687-A1B5-4AC3-A6F6-62411CBB7BD2}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJb3 = class(TJavaGenericImport<Jb3Class, Jb3>) end;

//  Jb4Class = interface(JObjectClass)
//  ['{5091087B-8E55-4EBD-ABD9-EADB68920AF4}']
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

//  [JavaSignature('com/huawei/hms/scankit/p/b4')]
//  Jb4 = interface(JObject)
//  ['{2296C393-5256-455F-B459-CD0991AC5640}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb4 = class(TJavaGenericImport<Jb4Class, Jb4>) end;

//  Jb5Class = interface(Jg5Class) // or JObjectClass
//  ['{02E1CF15-0D78-4B0D-8C0C-14600381B2C3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JMap): Jb5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b5')]
//  Jb5 = interface(Jg5) // or JObject
//  ['{CDC88A4E-35DA-4306-9D68-7154A04637CF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJb5 = class(TJavaGenericImport<Jb5Class, Jb5>) end;

//  Jb6Class = interface(JObjectClass)
//  ['{4AA80665-36FE-4673-93C9-160F30B4F5D5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Int64): Jb6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b6')]
//  Jb6 = interface(JObject)
//  ['{CDA2E757-AABA-4F16-A28A-777F4E10C3C7}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Single; P2: Single): Jb6; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Int64; P4: Int64; P5: JInterpolator): Jb6; cdecl; overload;
//    procedure a(P1: JRect; P2: Integer); cdecl; overload;
//    procedure b(P1: Int64); cdecl; overload;
//    function c: JList; cdecl;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJb6 = class(TJavaGenericImport<Jb6Class, Jb6>) end;

//  Jb7Class = interface(JObjectClass)
//  ['{E6781060-4FD8-4CF9-9314-ECE33D465C13}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b7')]
//  Jb7 = interface(JObject)
//  ['{97581F5E-5C9A-4399-9AFE-80980E61BA0B}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJb7 = class(TJavaGenericImport<Jb7Class, Jb7>) end;

//  Jb8_aClass = interface(JObjectClass)
//  ['{1FF5CB5B-17F5-458E-9BD4-5C35B6BF7615}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b8$a')]
//  Jb8_a = interface(JObject)
//  ['{9FC6CB44-37BC-450A-8331-EB4E3535EBCE}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJb8_a = class(TJavaGenericImport<Jb8_aClass, Jb8_a>) end;

//  Jb8_bClass = interface(JObjectClass)
//  ['{70B6E030-5577-4281-9E88-F945FDE32E20}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b8$b')]
//  Jb8_b = interface(JObject)
//  ['{3FF767BB-4A5B-4385-B300-C2AF1B0B5667}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function d: Integer; cdecl;
//    function a: TJavaObjectArray<Jb8_a>; cdecl;
//
//    { Property }
//  end;

//  TJb8_b = class(TJavaGenericImport<Jb8_bClass, Jb8_b>) end;

//  Jb8Class = interface(JObjectClass)
//  ['{BA221A36-2FF5-4E7B-B57C-E525FBAF32C7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: Integer): Jb8; cdecl;
//    {class} function c(P1: Integer): Jb8; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b8')]
//  Jb8 = interface(JObject)
//  ['{229F0206-2C7C-4818-AA4B-D8BE7B4C1A3D}']
//    { Property Methods }
//
//    { methods }
//    function f: Integer; cdecl;
//    function c: TJavaArray<Integer>; cdecl; overload;
//    function e: Integer; cdecl;
//    function d: Integer; cdecl;
//    function a(P1: Jb3): Jb8_b; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJb8 = class(TJavaGenericImport<Jb8Class, Jb8>) end;

//  Jc_179Class = interface(Jt6Class) // or JObjectClass
//  ['{BED6608E-860B-44D3-9B16-B6BCCA2015F1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_179; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c')]
//  Jc_179 = interface(Jt6) // or JObject
//  ['{64795926-B25F-46ED-B406-6721F24FC793}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJc_179 = class(TJavaGenericImport<Jc_179Class, Jc_179>) end;

//  Jc0Class = interface(JObjectClass)
//  ['{C39234D6-6CFE-4BB4-96D2-0C3CF2F9A6B4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): Jc0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c0')]
//  Jc0 = interface(JObject)
//  ['{99D52F0C-F25D-4E2A-A81B-09EAB3510381}']
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

//  TJc0 = class(TJavaGenericImport<Jc0Class, Jc0>) end;

//  Jc1Class = interface(JObjectClass)
//  ['{F156D9FD-F0AC-456D-8B5F-3E66C0D0783A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c1')]
//  Jc1 = interface(JObject)
//  ['{3CE9DE6D-D8BE-4BDD-BFB8-42E7C58F2DF6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc1 = class(TJavaGenericImport<Jc1Class, Jc1>) end;

//  Jc2Class = interface(Jb2Class) // or JObjectClass
//  ['{DD548A28-C864-462B-9B5E-EF25D47A4A0F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c2')]
//  Jc2 = interface(Jb2) // or JObject
//  ['{25BEE64D-850F-4D07-A98D-084C9817864C}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJc2 = class(TJavaGenericImport<Jc2Class, Jc2>) end;

//  Jc3Class = interface(JEnumClass) // or JObjectClass
//  ['{3FDC1B65-55EB-493B-B62C-7B07FF920040}']
//    { static Property Methods }
//    {class} function _Getb: Jc3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jc3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jc3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jc3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jc3>; cdecl;
//    {class} function valueOf(P1: JString): Jc3; cdecl;
//    {class} function a(P1: Integer): Jc3; cdecl;
//
//    { static Property }
//    {class} property b: Jc3 read _Getb;
//    {class} property c: Jc3 read _Getc;
//    {class} property d: Jc3 read _Getd;
//    {class} property e: Jc3 read _Gete;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c3')]
//  Jc3 = interface(JEnum) // or JObject
//  ['{0DD96B89-182E-49B9-93AB-0A71B0B7AF37}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc3 = class(TJavaGenericImport<Jc3Class, Jc3>) end;

//  Jc4_aClass = interface(JObjectClass)
//  ['{9C2BB9B1-25B1-4C26-B276-D9654AD49949}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c4$a')]
//  Jc4_a = interface(JObject)
//  ['{178E7AA3-4E71-44E5-977C-C4C72EBFE9AF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jb7; P2: Jb7): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJc4_a = class(TJavaGenericImport<Jc4_aClass, Jc4_a>) end;

//  Jc4Class = interface(JObjectClass)
//  ['{9F68DDCC-5D67-44D7-839A-B7A06B3E2336}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>): Jc4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c4')]
//  Jc4 = interface(JObject)
//  ['{3D5C22FF-1877-4F74-8915-627007D42613}']
//    { Property Methods }
//
//    { methods }
//    function a: Jr; cdecl;
//
//    { Property }
//  end;

//  TJc4 = class(TJavaGenericImport<Jc4Class, Jc4>) end;

//  Jc5_aClass = interface(JObjectClass)
//  ['{88E9BD0B-14CD-4C1B-AE6B-5422DEFC8B04}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c5$a')]
//  Jc5_a = interface(JObject)
//  ['{A55CDCA9-FB8F-492E-9BA5-B6DC5758A2FA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc5_a = class(TJavaGenericImport<Jc5_aClass, Jc5_a>) end;

//  Jc5Class = interface(JObjectClass)
//  ['{B9EE5A93-FC23-462A-8DBE-A880FB5C645C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c5')]
//  Jc5 = interface(JObject)
//  ['{E89E5BF4-172B-4115-844C-E2ACD8BD4544}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: JHmsBuildBitmapOption): JBitmap; cdecl; overload;
//
//    { Property }
//  end;

//  TJc5 = class(TJavaGenericImport<Jc5Class, Jc5>) end;

//  Jc6Class = interface(JObjectClass)
//  ['{C88D77C7-7FC7-40AA-B679-861B941C8187}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jj2; P2: Integer): Jc6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c6')]
//  Jc6 = interface(JObject)
//  ['{C3193DDA-CC64-44B6-92DB-76699788AC3F}']
//    { Property Methods }
//    function _Geta: Jj2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: Jj2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a(P1: Jc6): Integer; cdecl;
//    function compareTo(P1: JObject): Integer; cdecl;
//
//    { Property }
//    property a: Jj2 read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//  end;

//  TJc6 = class(TJavaGenericImport<Jc6Class, Jc6>) end;

//  Jc7Class = interface(JObjectClass)
//  ['{DB2BE592-6D9D-4AC7-8934-B4A84777CE22}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: JMap): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Boolean; P3: Boolean; P4: Boolean; P5: Integer; P6: Integer; P7: Boolean; P8: Integer; P9: Integer; P10: Integer; P11: Integer; P12: Integer; P13: Integer; P14: Integer; P15: Integer): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): JBoolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c7')]
//  Jc7 = interface(JObject)
//  ['{3E03D6BE-8117-44A5-B3B9-901E6FB2F2B1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc7 = class(TJavaGenericImport<Jc7Class, Jc7>) end;

//  Jc8Class = interface(JObjectClass)
//  ['{3096374B-9956-4594-A043-D542D2AD117B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl; overload;
//    {class} function a(P1: Js; P2: Js; P3: Integer; P4: Double): Js; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c8')]
//  Jc8 = interface(JObject)
//  ['{1361B821-F92D-402F-A69C-9F391036184C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc8 = class(TJavaGenericImport<Jc8Class, Jc8>) end;

//  Jd_191Class = interface(Ju6Class) // or JObjectClass
//  ['{4578072E-9461-4050-8693-8FEF236BE44E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d')]
//  Jd_191 = interface(Ju6) // or JObject
//  ['{6E6D0A06-A748-4C6B-AD42-04AC02087D32}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_191 = class(TJavaGenericImport<Jd_191Class, Jd_191>) end;

//  Jd0Class = interface(JObjectClass)
//  ['{158D959D-3B7C-4B93-B9D0-704B25949602}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d0')]
//  Jd0 = interface(JObject)
//  ['{B9B57F67-03BD-4D13-8416-83649290AA8E}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jy2); cdecl; overload;
//
//    { Property }
//  end;

//  TJd0 = class(TJavaGenericImport<Jd0Class, Jd0>) end;

//  Jd1Class = interface(JObjectClass)
//  ['{DF0D7B26-91E4-4B47-873C-5FC5734068DE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d1')]
//  Jd1 = interface(JObject)
//  ['{69AA3CA5-C958-4881-8A63-CB6053FAB668}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd1 = class(TJavaGenericImport<Jd1Class, Jd1>) end;

//  Jd2_aClass = interface(JObjectClass)
//  ['{40B2CCC0-9AB7-451D-8DA7-F643964AD5CD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d2$a')]
//  Jd2_a = interface(JObject)
//  ['{4E92FDFA-E117-40D6-B253-D96DBF91BCCC}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJd2_a = class(TJavaGenericImport<Jd2_aClass, Jd2_a>) end;

//  Jd2Class = interface(JObjectClass)
//  ['{FF1379BA-967A-4F73-9B3D-8BCE72ED5AD2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Jd2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d2')]
//  Jd2 = interface(JObject)
//  ['{9EB72625-09FD-4228-B850-B82C1EDBFD54}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Boolean): Jg; cdecl;
//
//    { Property }
//  end;

//  TJd2 = class(TJavaGenericImport<Jd2Class, Jd2>) end;

//  Jd3Class = interface(JObjectClass)
//  ['{598B9012-07B6-4A48-9492-0FEDB624BAFC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d3')]
//  Jd3 = interface(JObject)
//  ['{E4ED97B9-F3C2-478C-A66C-DC07B6D21D4F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd3 = class(TJavaGenericImport<Jd3Class, Jd3>) end;

//  Jd4Class = interface(JObjectClass)
//  ['{1E3293A4-F7B1-4079-A2F6-B6A420D5B59B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Je7; P3: Jm2; P4: Jm2): JString; cdecl; overload;
//    {class} function a(P1: JCharSequence; P2: Integer): Integer; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d4')]
//  Jd4 = interface(JObject)
//  ['{95CB7DDB-AFBE-4415-AEFA-5DDF29B01AAE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd4 = class(TJavaGenericImport<Jd4Class, Jd4>) end;

//  Jd5Class = interface(JObjectClass)
//  ['{49D357E4-301B-45E8-83CA-4B252E16ADEB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d5')]
//  Jd5 = interface(JObject)
//  ['{65FAB1B9-7512-4DD3-AF72-6828C5358016}']
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

//  TJd5 = class(TJavaGenericImport<Jd5Class, Jd5>) end;

//  Jd6Class = interface(JObjectClass)
//  ['{B2FEF1CB-373F-474F-B3D3-E24574C43441}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single): Jd6; cdecl;
//    {class} function a(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single): Jd6; cdecl; overload;
//    {class} function b(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single): Jd6; cdecl; overload;
//    {class} function a(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single): Jd6; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d6')]
//  Jd6 = interface(JObject)
//  ['{5ABA9B19-E4DB-4714-947A-30AD2F574C62}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single); cdecl; overload;
//    procedure a(P1: TJavaArray<Single>); cdecl; overload;
//    procedure b(P1: TJavaArray<Single>); cdecl; overload;
//
//    { Property }
//  end;

//  TJd6 = class(TJavaGenericImport<Jd6Class, Jd6>) end;

//  Jd7Class = interface(JObjectClass)
//  ['{4CE16BE2-6F34-446B-BC09-32A113071AA9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Boolean; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Jd7; cdecl;
//    {class} function a(P1: Integer; P2: Je7; P3: Jm2; P4: Jm2; P5: Boolean): Jd7; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d7')]
//  Jd7 = interface(JObject)
//  ['{1473CD92-9602-44CC-BA04-46C18D8BFDF9}']
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

//  TJd7 = class(TJavaGenericImport<Jd7Class, Jd7>) end;

//  Jd8Class = interface(JObjectClass)
//  ['{CB019F39-55C0-4817-8B8C-6CC993072EA9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl; overload;
//    {class} function a(P1: Js; P2: Js; P3: Integer; P4: Double): Js; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d8')]
//  Jd8 = interface(JObject)
//  ['{ACDDA1D9-540F-4307-8FC3-CE24AB8C9E63}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd8 = class(TJavaGenericImport<Jd8Class, Jd8>) end;

//  Je_202Class = interface(JObjectClass)
//  ['{E17CEE96-01B6-49D4-A71E-5521A97069D7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e')]
//  Je_202 = interface(JObject)
//  ['{C63D8B9A-7CD4-48E5-99D0-CDA1ADCC8B1F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_202 = class(TJavaGenericImport<Je_202Class, Je_202>) end;

//  Je0_aClass = interface(JObjectClass)
//  ['{D762DC88-1F0C-4728-960C-47509C73CDBD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e0$a')]
//  Je0_a = interface(JObject)
//  ['{5A5CE353-BB3A-4BE5-8C49-6A884C193EF7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe0_a = class(TJavaGenericImport<Je0_aClass, Je0_a>) end;

//  Je0_bClass = interface(JObjectClass)
//  ['{D2197B4F-205D-4BFE-844A-D552C8189D1C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Je0_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e0$b')]
//  Je0_b = interface(JObject)
//  ['{48BDD915-176B-4EC4-B3AB-35C7C7DAEC81}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer): Je0_b; cdecl; overload;
//    function b(P1: Integer): Je0_b; cdecl; overload;
//    function a(P1: JPoint): Je0_b; cdecl; overload;
//    function b(P1: Boolean): Je0_b; cdecl; overload;
//    function a(P1: Boolean): Je0_b; cdecl; overload;
//    function a: Je0; cdecl; overload;
//
//    { Property }
//  end;

//  TJe0_b = class(TJavaGenericImport<Je0_bClass, Je0_b>) end;

//  Je0Class = interface(JObjectClass)
//  ['{0898A76F-CDA7-4CCD-B23D-18F21C8B9D39}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e0')]
//  Je0 = interface(JObject)
//  ['{F798A78F-4E1B-4C06-A033-CED70EC0EE2B}']
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

//  TJe0 = class(TJavaGenericImport<Je0Class, Je0>) end;

//  Je1Class = interface(JObjectClass)
//  ['{8E2C7EBB-A0F4-40F0-B06E-54E2993BB4A3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e1')]
//  Je1 = interface(JObject)
//  ['{CFD547E9-E991-4A99-9647-827ADA767540}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe1 = class(TJavaGenericImport<Je1Class, Je1>) end;

//  Je2Class = interface(JObjectClass)
//  ['{A4D4B488-41F4-4943-A22E-E9148BF92118}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Je2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e2')]
//  Je2 = interface(JObject)
//  ['{00BCAB38-8217-426C-A17A-93EB7B907B4F}']
//    { Property Methods }
//
//    { methods }
//    function a: Jk2; cdecl;
//
//    { Property }
//  end;

//  TJe2 = class(TJavaGenericImport<Je2Class, Je2>) end;

//  Je3Class = interface(Ju6Class) // or JObjectClass
//  ['{48715114-6E5A-4CDE-9EC3-5F5C07DFF5EA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Single; P4: Boolean; P5: Integer): Je3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e3')]
//  Je3 = interface(Ju6) // or JObject
//  ['{8AAF3B69-32F1-4F32-9BDB-8E44A9D4BE42}']
//    { Property Methods }
//
//    { methods }
//    function e: Single; cdecl;
//    function d: Boolean; cdecl;
//
//    { Property }
//  end;

//  TJe3 = class(TJavaGenericImport<Je3Class, Je3>) end;

//  Je4Class = interface(Jq3Class) // or JObjectClass
//  ['{E8763CDD-766B-4395-82F2-567651CD87F6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jp4): Je4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e4')]
//  Je4 = interface(Jq3) // or JObject
//  ['{F3444940-CB2F-4E56-BEF0-980B8AB65BFA}']
//    { Property Methods }
//
//    { methods }
//    function a: Js; cdecl; overload;
//    function a(P1: Jp4): Jo; cdecl; overload;
//
//    { Property }
//  end;

//  TJe4 = class(TJavaGenericImport<Je4Class, Je4>) end;

//  Je5Class = interface(JObjectClass)
//  ['{98E27E20-AC21-43A5-815E-8C5F44D792D6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e5')]
//  Je5 = interface(IJavaInstance)
//  ['{3D8D3A3E-E79D-43B5-847B-3E35E99C5154}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JHmsScan>): Boolean; cdecl; overload;
//    function a: Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJe5 = class(TJavaGenericImport<Je5Class, Je5>) end;

//  Je6Class = interface(Jp4Class) // or JObjectClass
//  ['{889141C9-EEDF-4294-86CA-D77BA1AE9654}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Boolean): Je6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e6')]
//  Je6 = interface(Jp4) // or JObject
//  ['{968E88A1-6560-44F8-9F6A-C687EE5B33E4}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    function b: TJavaArray<Byte>; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jp4; cdecl; overload;
//
//    { Property }
//  end;

//  TJe6 = class(TJavaGenericImport<Je6Class, Je6>) end;

//  Je7Class = interface(JEnumClass) // or JObjectClass
//  ['{27FD2B92-03B7-4ED5-806F-AD136714FF09}']
//    { static Property Methods }
//    {class} function _Geta: Je7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Je7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Je7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Je7>; cdecl;
//    {class} function valueOf(P1: JString): Je7; cdecl;
//
//    { static Property }
//    {class} property a: Je7 read _Geta;
//    {class} property b: Je7 read _Getb;
//    {class} property c: Je7 read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e7')]
//  Je7 = interface(JEnum) // or JObject
//  ['{DADB9732-5852-42CB-9FE5-29939B08ACE2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe7 = class(TJavaGenericImport<Je7Class, Je7>) end;

//  Je8Class = interface(JObjectClass)
//  ['{2256DC09-BD55-4138-B30B-88AECFF19000}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl; overload;
//    {class} function a(P1: Js; P2: Js; P3: Integer; P4: Double): Js; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e8')]
//  Je8 = interface(JObject)
//  ['{3C0CDC93-E734-400C-BA25-17EC60C24615}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe8 = class(TJavaGenericImport<Je8Class, Je8>) end;

//  Jf_214Class = interface(JObjectClass)
//  ['{64AC0BAE-F96F-49EF-ACB2-177E6DF0B50A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf_214; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f')]
//  Jf_214 = interface(JObject)
//  ['{0814AFFA-8DED-430F-98B7-ACF59739F6BF}']
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

//  TJf_214 = class(TJavaGenericImport<Jf_214Class, Jf_214>) end;

//  Jf0Class = interface(JObjectClass)
//  ['{CCE27EF2-08C0-4257-8153-0C7152B85B34}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf0; cdecl;
//    {class} procedure a(P1: JCamera_Parameters; P2: Boolean); cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f0')]
//  Jf0 = interface(JObject)
//  ['{7458CC4B-7D85-4C6A-A508-6320D476DE75}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf0 = class(TJavaGenericImport<Jf0Class, Jf0>) end;

//  Jf1_aClass = interface(Jf1Class) // or JObjectClass
//  ['{11FC53DD-4839-43F0-8F81-BEBAB35E3548}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f1$a')]
//  Jf1_a = interface(Jf1) // or JObject
//  ['{B0DDE755-F83E-446A-BEFA-7DE93D6C05D3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf1_a = class(TJavaGenericImport<Jf1_aClass, Jf1_a>) end;

//  Jf1_bClass = interface(Jf1Class) // or JObjectClass
//  ['{879A1769-BCD0-414A-ADB2-1AED53DC24E1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f1$b')]
//  Jf1_b = interface(Jf1) // or JObject
//  ['{C6DB323A-E5C9-4ECC-9BC4-1F567D8AF5AD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf1_b = class(TJavaGenericImport<Jf1_bClass, Jf1_b>) end;

//  Jf1_cClass = interface(Jf1Class) // or JObjectClass
//  ['{C34DA195-4A40-4D75-B5E4-B2A5397C6019}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f1$c')]
//  Jf1_c = interface(Jf1) // or JObject
//  ['{38C0448F-A589-477B-B049-A91647D3F16E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf1_c = class(TJavaGenericImport<Jf1_cClass, Jf1_c>) end;

//  Jf1_dClass = interface(Jf1Class) // or JObjectClass
//  ['{F67F5013-83E8-47F6-860D-D73E7E623042}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f1$d')]
//  Jf1_d = interface(Jf1) // or JObject
//  ['{A2DE8613-3A50-4777-81D5-79A867AE18E8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf1_d = class(TJavaGenericImport<Jf1_dClass, Jf1_d>) end;

//  Jf1_eClass = interface(Jf1Class) // or JObjectClass
//  ['{515EBA2C-A9D4-4887-B811-B87CD704B3F2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f1$e')]
//  Jf1_e = interface(Jf1) // or JObject
//  ['{4388229F-8A70-4EBE-8DFE-F57966380630}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf1_e = class(TJavaGenericImport<Jf1_eClass, Jf1_e>) end;

//  Jf1_fClass = interface(Jf1Class) // or JObjectClass
//  ['{B13BC86A-AE8B-4BAE-8EF7-C02763C89962}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f1$f')]
//  Jf1_f = interface(Jf1) // or JObject
//  ['{88151F33-1C77-4154-AE9A-A454F6D96C6D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf1_f = class(TJavaGenericImport<Jf1_fClass, Jf1_f>) end;

//  Jf1_gClass = interface(Jf1Class) // or JObjectClass
//  ['{F6E7E604-D0A7-468D-BC08-5BDE59FC9C66}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f1$g')]
//  Jf1_g = interface(Jf1) // or JObject
//  ['{AF71AD74-14F3-499A-ABD5-B4291AA9D06B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf1_g = class(TJavaGenericImport<Jf1_gClass, Jf1_g>) end;

//  Jf1_hClass = interface(Jf1Class) // or JObjectClass
//  ['{F64D5AD5-D046-4A29-8662-4F3C1C6CE5A8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f1$h')]
//  Jf1_h = interface(Jf1) // or JObject
//  ['{FD2C66E8-342F-4523-A902-C3FBFB59D106}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf1_h = class(TJavaGenericImport<Jf1_hClass, Jf1_h>) end;

//  Jf1Class = interface(JEnumClass) // or JObjectClass
//  ['{49AD5624-A77F-4F37-A993-2057D82418F4}']
//    { static Property Methods }
//    {class} function _Geta: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jf1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jf1>; cdecl;
//    {class} function valueOf(P1: JString): Jf1; cdecl;
//
//    { static Property }
//    {class} property a: Jf1 read _Geta;
//    {class} property b: Jf1 read _Getb;
//    {class} property c: Jf1 read _Getc;
//    {class} property d: Jf1 read _Getd;
//    {class} property e: Jf1 read _Gete;
//    {class} property f: Jf1 read _Getf;
//    {class} property g: Jf1 read _Getg;
//    {class} property h: Jf1 read _Geth;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f1')]
//  Jf1 = interface(JEnum) // or JObject
//  ['{372FC6E1-7DBF-4900-B128-A406497A8780}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf1 = class(TJavaGenericImport<Jf1Class, Jf1>) end;

//  Jf2Class = interface(JObjectClass)
//  ['{D317A786-A376-4598-9D92-31C1210D7C6F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Jf2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f2')]
//  Jf2 = interface(JObject)
//  ['{A1B2F232-ECC3-4F58-8DF3-B6198157AE9F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JMap): TJavaObjectArray<Jg3>; cdecl; overload;
//    function a(P1: TJavaObjectArray<Jg3>; P2: Jg3): Integer; cdecl; overload;
//    function a(P1: Integer): Jk2; cdecl; overload;
//
//    { Property }
//  end;

//  TJf2 = class(TJavaGenericImport<Jf2Class, Jf2>) end;

//  Jf3Class = interface(Ju6Class) // or JObjectClass
//  ['{2D04E9E8-0168-4EA4-BC30-CF7F4D6F9D68}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f3')]
//  Jf3 = interface(Ju6) // or JObject
//  ['{0E40BE8B-58A5-4495-8CD8-35AEE5D78E80}']
//    { Property Methods }
//
//    { methods }
//    function e: Single; cdecl;
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJf3 = class(TJavaGenericImport<Jf3Class, Jf3>) end;

//  Jf4Class = interface(JObjectClass)
//  ['{9F18AEE8-7C4C-4DD9-AF13-BD8556FDD398}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f4')]
//  Jf4 = interface(IJavaInstance)
//  ['{69E914A0-91E0-42A3-B640-365364B1A6EE}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jw5; P2: Int64); cdecl;
//
//    { Property }
//  end;

//  TJf4 = class(TJavaGenericImport<Jf4Class, Jf4>) end;

//  Jf5Class = interface(JObjectClass)
//  ['{1E6594CE-270C-4AAA-BF24-174768910840}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f5')]
//  Jf5 = interface(IJavaInstance)
//  ['{B426BC95-01E4-46AB-8133-0A276736F717}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: JBitmap; P3: Single); cdecl;
//
//    { Property }
//  end;

//  TJf5 = class(TJavaGenericImport<Jf5Class, Jf5>) end;

//  Jf6Class = interface(JObjectClass)
//  ['{BC1A0A64-10EB-4FE8-B064-5178633FA78A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jj0_d): Jf6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f6')]
//  Jf6 = interface(JObject)
//  ['{79135E7E-269C-4635-B8AD-B688060A97C5}']
//    { Property Methods }
//
//    { methods }
//    procedure onPreviewFrame(P1: TJavaArray<Byte>; P2: JCamera); cdecl;
//
//    { Property }
//  end;

//  TJf6 = class(TJavaGenericImport<Jf6Class, Jf6>) end;

//  Jf7Class = interface(Jt6Class) // or JObjectClass
//  ['{D7384D48-4E7C-4B70-B4A4-E291C6D71282}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f7')]
//  Jf7 = interface(Jt6) // or JObject
//  ['{AD49368C-F0B3-4DD2-9612-2E3CD1B1ECA6}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJf7 = class(TJavaGenericImport<Jf7Class, Jf7>) end;

//  Jf8Class = interface(JObjectClass)
//  ['{B65BD40E-C6DB-4DC9-AC93-51E984A0932E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl; overload;
//    {class} function a(P1: Js; P2: Js; P3: Integer; P4: Double): Js; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f8')]
//  Jf8 = interface(JObject)
//  ['{FB283D8A-5BB7-4778-9E02-47CD2DD8F760}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf8 = class(TJavaGenericImport<Jf8Class, Jf8>) end;

//  Jg_232Class = interface(Jk2Class) // or JObjectClass
//  ['{23DB5FAE-288B-490F-B8F3-C7CB708D1329}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js; P2: TJavaObjectArray<Ju6>; P3: Boolean; P4: Integer; P5: Integer): Jg_232; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g')]
//  Jg_232 = interface(Jk2) // or JObject
//  ['{26635861-94AA-45E6-82D8-94E3E1B44E59}']
//    { Property Methods }
//
//    { methods }
//    function f: Integer; cdecl;
//    function e: Integer; cdecl;
//    function g: Boolean; cdecl;
//
//    { Property }
//  end;

//  TJg_232 = class(TJavaGenericImport<Jg_232Class, Jg_232>) end;

//  Jg0Class = interface(JObjectClass)
//  ['{AAF0046E-20C3-404C-8B64-E50153D34F12}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Single): Jg0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g0')]
//  Jg0 = interface(JObject)
//  ['{9CA6F5D2-63E1-4629-B401-F42C0BD1C552}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//    function c: Integer; cdecl;
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJg0 = class(TJavaGenericImport<Jg0Class, Jg0>) end;

//  Jg1_aClass = interface(Jg1Class) // or JObjectClass
//  ['{8D100924-DE4A-4DD4-A1C0-6BF0E44F2B87}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g1$a')]
//  Jg1_a = interface(Jg1) // or JObject
//  ['{F555A7A9-1875-4F89-A731-59135DCF2048}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg1_a = class(TJavaGenericImport<Jg1_aClass, Jg1_a>) end;

//  Jg1_bClass = interface(Jg1Class) // or JObjectClass
//  ['{72D5F422-CF5F-48D5-936E-13A873F0A94D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g1$b')]
//  Jg1_b = interface(Jg1) // or JObject
//  ['{0CCF2CFA-3023-4936-A376-8B1A5EB243D6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg1_b = class(TJavaGenericImport<Jg1_bClass, Jg1_b>) end;

//  Jg1_cClass = interface(Jg1Class) // or JObjectClass
//  ['{60539730-2A2E-4835-B535-E2BB46E50D96}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g1$c')]
//  Jg1_c = interface(Jg1) // or JObject
//  ['{288F0DBE-0DD2-4F7D-AC2D-69E8AF77DD0C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg1_c = class(TJavaGenericImport<Jg1_cClass, Jg1_c>) end;

//  Jg1_dClass = interface(Jg1Class) // or JObjectClass
//  ['{58EEE318-8F98-44AD-9878-125137A49B92}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g1$d')]
//  Jg1_d = interface(Jg1) // or JObject
//  ['{9ED65F54-E290-496C-8FCB-AC3F93AF79A0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg1_d = class(TJavaGenericImport<Jg1_dClass, Jg1_d>) end;

//  Jg1_eClass = interface(Jg1Class) // or JObjectClass
//  ['{CD4C284A-6970-45EC-A0CD-3CBF4ED5A828}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g1$e')]
//  Jg1_e = interface(Jg1) // or JObject
//  ['{A59E4732-2E54-4348-8BCA-C2F74789B7E6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg1_e = class(TJavaGenericImport<Jg1_eClass, Jg1_e>) end;

//  Jg1_fClass = interface(Jg1Class) // or JObjectClass
//  ['{A1E204B1-2BFA-48B7-896E-E55DBE8C870E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g1$f')]
//  Jg1_f = interface(Jg1) // or JObject
//  ['{E173DE34-7E1A-4BBC-BD00-3672DA8853E9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg1_f = class(TJavaGenericImport<Jg1_fClass, Jg1_f>) end;

//  Jg1_gClass = interface(Jg1Class) // or JObjectClass
//  ['{AE018A13-A592-4933-9D1E-8A5CC9551109}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g1$g')]
//  Jg1_g = interface(Jg1) // or JObject
//  ['{8AE48FA9-5D7E-4F80-BE7E-A8B41EEF8742}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg1_g = class(TJavaGenericImport<Jg1_gClass, Jg1_g>) end;

//  Jg1_hClass = interface(Jg1Class) // or JObjectClass
//  ['{070F5B86-67BA-4095-A86F-286DF0D522F4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g1$h')]
//  Jg1_h = interface(Jg1) // or JObject
//  ['{4A08FB2C-5985-43F1-B3BF-236754955067}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg1_h = class(TJavaGenericImport<Jg1_hClass, Jg1_h>) end;

//  Jg1Class = interface(JEnumClass) // or JObjectClass
//  ['{C889039E-FAD5-4741-819B-AE95A5B524AF}']
//    { static Property Methods }
//    {class} function _Geta: Jg1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jg1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jg1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jg1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jg1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jg1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jg1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jg1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jg1>; cdecl;
//    {class} function valueOf(P1: JString): Jg1; cdecl;
//
//    { static Property }
//    {class} property a: Jg1 read _Geta;
//    {class} property b: Jg1 read _Getb;
//    {class} property c: Jg1 read _Getc;
//    {class} property d: Jg1 read _Getd;
//    {class} property e: Jg1 read _Gete;
//    {class} property f: Jg1 read _Getf;
//    {class} property g: Jg1 read _Getg;
//    {class} property h: Jg1 read _Geth;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g1')]
//  Jg1 = interface(JEnum) // or JObject
//  ['{CFC7572D-9E14-46A0-A87D-17E55061B739}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg1 = class(TJavaGenericImport<Jg1Class, Jg1>) end;

//  Jg2Class = interface(JObjectClass)
//  ['{B587029F-AB07-46B6-BBBF-52B985EA8E11}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Jp; P2: JMap; P3: Boolean): Jo5; cdecl; overload;
//    {class} procedure a(P1: Boolean); cdecl; overload;
//    {class} function a: Boolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g2')]
//  Jg2 = interface(JObject)
//  ['{1A0DDB56-97F2-43EA-AA96-4AA2FC0B362F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg2 = class(TJavaGenericImport<Jg2Class, Jg2>) end;

//  Jg3Class = interface(Ju6Class) // or JObjectClass
//  ['{CAD6C121-D23F-4DB3-A080-C70104261A5A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g3')]
//  Jg3 = interface(Ju6) // or JObject
//  ['{341CF218-763E-43D9-A4E3-81F382B05F15}']
//    { Property Methods }
//
//    { methods }
//    function e: Single; cdecl;
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJg3 = class(TJavaGenericImport<Jg3Class, Jg3>) end;

//  Jg4Class = interface(JObjectClass)
//  ['{4FDA0C13-2DF3-485D-A72E-CAF34E3EB52F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g4')]
//  Jg4 = interface(IJavaInstance)
//  ['{2EAE4AA4-355F-4DA1-8104-B7603FCD7E94}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jw5); cdecl;
//
//    { Property }
//  end;

//  TJg4 = class(TJavaGenericImport<Jg4Class, Jg4>) end;

//  Jg5Class = interface(JObjectClass)
//  ['{E959580F-631B-43D2-BE7E-7F54715420F4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g5')]
//  Jg5 = interface(JObject)
//  ['{B7A36C9D-B8E0-42A3-AD79-555FF38FADB2}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Js6; cdecl; overload;
//    function a(P1: Integer; P2: Jr; P3: JMap): Js6; cdecl; overload;
//
//    { Property }
//  end;

//  TJg5 = class(TJavaGenericImport<Jg5Class, Jg5>) end;

//  Jg6Class = interface(Jt6Class) // or JObjectClass
//  ['{891EF4D5-9351-4C3A-ABA4-3A9A55EE8BE1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g6')]
//  Jg6 = interface(Jt6) // or JObject
//  ['{5D625A14-1A3C-4D8E-A32F-91575A81B130}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJg6 = class(TJavaGenericImport<Jg6Class, Jg6>) end;

//  Jg7Class = interface(Jd0Class) // or JObjectClass
//  ['{84762A70-7B65-4848-BF91-3355097039C9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g7')]
//  Jg7 = interface(Jd0) // or JObject
//  ['{92C56738-6A56-465D-B4EC-E5F4318D04B4}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJg7 = class(TJavaGenericImport<Jg7Class, Jg7>) end;

//  Jg8Class = interface(JObjectClass)
//  ['{F15FA7AA-7531-4E91-B5C4-ADB498542F45}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl; overload;
//    {class} function a(P1: Js; P2: Js; P3: Integer; P4: Double): Js; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g8')]
//  Jg8 = interface(JObject)
//  ['{90E1D902-CADE-4375-BB9B-ECF3CFC95A54}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg8 = class(TJavaGenericImport<Jg8Class, Jg8>) end;

//  Jh_250Class = interface(JObjectClass)
//  ['{86EB48C1-B4CB-48D9-8A31-48EADB986315}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh_250; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h')]
//  Jh_250 = interface(JObject)
//  ['{AA7C9D5F-4815-48B6-8609-D78DA15BBB60}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJh_250 = class(TJavaGenericImport<Jh_250Class, Jh_250>) end;

//  Jh0Class = interface(JObjectClass)
//  ['{EEC05703-2CD4-4482-B876-0625041564D4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h0')]
//  Jh0 = interface(JObject)
//  ['{6F160C15-DDFD-42A1-BD2D-235EE3217B68}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JCamera); cdecl; overload;
//    function a: Jg0; cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//
//    { Property }
//  end;

//  TJh0 = class(TJavaGenericImport<Jh0Class, Jh0>) end;

//  Jh1Class = interface(JObjectClass)
//  ['{BD80BDF3-C49D-48EA-A604-F061D9E5FE33}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h1')]
//  Jh1 = interface(JObject)
//  ['{5FF7F8DD-5378-4E4E-91F6-89A1EA33220B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJh1 = class(TJavaGenericImport<Jh1Class, Jh1>) end;

//  Jh2Class = interface(JObjectClass)
//  ['{2CBDAB99-6781-40B7-AA5C-99C8F53FC7CD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Jh2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h2')]
//  Jh2 = interface(JObject)
//  ['{FFD67002-1AB2-454D-B17E-0832FAE7BB2F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JMap): Jk2; cdecl;
//
//    { Property }
//  end;

//  TJh2 = class(TJavaGenericImport<Jh2Class, Jh2>) end;

//  Jh3_aClass = interface(JObjectClass)
//  ['{292F6F09-426A-43CB-9D49-AE146A8ED4F0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h3$a')]
//  Jh3_a = interface(JObject)
//  ['{43B4288E-1D57-49F3-9607-A883F9D69562}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh3_a = class(TJavaGenericImport<Jh3_aClass, Jh3_a>) end;

//  Jh3_bClass = interface(JObjectClass)
//  ['{31B7E642-F980-4785-A2B8-9A0D5457E853}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h3$b')]
//  Jh3_b = interface(JObject)
//  ['{F9A0D613-5547-425B-8A09-21D1FBCF7CF7}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jg3; P2: Jg3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJh3_b = class(TJavaGenericImport<Jh3_bClass, Jh3_b>) end;

//  Jh3_cClass = interface(JObjectClass)
//  ['{C0F8A1A6-5F60-45EC-886A-81384838D0FE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h3$c')]
//  Jh3_c = interface(JObject)
//  ['{BD17319D-DA60-4359-AD3F-62E04ECA24B6}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jg3; P2: Jg3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJh3_c = class(TJavaGenericImport<Jh3_cClass, Jh3_c>) end;

//  Jh3_dClass = interface(JObjectClass)
//  ['{2C5D51D4-F400-4038-A5EE-387558D6C311}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h3$d')]
//  Jh3_d = interface(JObject)
//  ['{6F47AA4E-BD66-4C38-9A2A-31E2C9D1D1BC}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jg3; P2: Jg3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJh3_d = class(TJavaGenericImport<Jh3_dClass, Jh3_d>) end;

//  Jh3Class = interface(JObjectClass)
//  ['{BE2874F8-8D5C-4E33-9899-42C0666101B4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js; P2: Jv6): Jh3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h3')]
//  Jh3 = interface(JObject)
//  ['{163B3662-CABB-4907-94A7-1E8D89BEB936}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh3 = class(TJavaGenericImport<Jh3Class, Jh3>) end;

//  Jh4Class = interface(JIRemoteFrameDecoderDelegate_StubClass) // or JObjectClass
//  ['{AC775DF3-E752-43DA-9DC8-709EF6B4911B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jh4; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h4')]
//  Jh4 = interface(JIRemoteFrameDecoderDelegate_Stub) // or JObject
//  ['{2680765F-04C4-4704-B0D8-24E6372C9406}']
//    { Property Methods }
//
//    { methods }
//    function decode(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JIObjectWrapper): TJavaObjectArray<Js6>; cdecl;
//    function a(P1: Integer; P2: Integer): JRect; cdecl; overload;
//    function b(P1: Integer; P2: Integer): JRect; cdecl;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Je6; cdecl; overload;
//
//    { Property }
//  end;

//  TJh4 = class(TJavaGenericImport<Jh4Class, Jh4>) end;

//  Jh5Class = interface(JObjectClass)
//  ['{E35F5272-B24B-430D-BA4A-A76FB50BB7EA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h5')]
//  Jh5 = interface(JObject)
//  ['{E0B2D34F-2F97-477E-91E1-8F2481811BF0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a: Integer; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJh5 = class(TJavaGenericImport<Jh5Class, Jh5>) end;

//  Jh6Class = interface(JObjectClass)
//  ['{5FCF5AD1-40C7-4C08-B090-DFD861553731}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jh6; cdecl;
//    {class} function a(P1: Integer): Boolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h6')]
//  Jh6 = interface(JObject)
//  ['{C75E8B02-1C7C-4E95-8142-D08E437077F0}']
//    { Property Methods }
//
//    { methods }
//    function a: Jc0; cdecl; overload;
//    function toString: JString; cdecl;
//    procedure a(P1: Ju4); cdecl; overload;
//    procedure a(P1: Jb3); cdecl; overload;
//    procedure a(P1: Jb8); cdecl; overload;
//    procedure b(P1: Integer); cdecl;
//    procedure a(P1: Jc0); cdecl; overload;
//
//    { Property }
//  end;

//  TJh6 = class(TJavaGenericImport<Jh6Class, Jh6>) end;

//  Jh7Class = interface(JObjectClass)
//  ['{984AE671-D967-448B-A721-174E7FD20288}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h7')]
//  Jh7 = interface(JObject)
//  ['{9407D025-4974-47D4-95A6-17525637F668}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh7 = class(TJavaGenericImport<Jh7Class, Jh7>) end;

//  Jh8Class = interface(JObjectClass)
//  ['{3DF49560-C016-404C-AFFD-AB6C813C3450}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl; overload;
//    {class} function a(P1: Js; P2: Js; P3: Integer; P4: Double): Js; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h8')]
//  Jh8 = interface(JObject)
//  ['{A58F01A7-21A0-4486-BEB3-3B66978519E7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh8 = class(TJavaGenericImport<Jh8Class, Jh8>) end;

//  Ji_264Class = interface(JObjectClass)
//  ['{BA2D6C3F-6855-4BC2-B96C-EDB0723E22D1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji_264; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i')]
//  Ji_264 = interface(JObject)
//  ['{731BA644-1A59-4C1A-A733-CCBD1F1B750F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJi_264 = class(TJavaGenericImport<Ji_264Class, Ji_264>) end;

//  Ji0_aClass = interface(JAsyncTaskClass) // or JObjectClass
//  ['{7521C901-44EA-4E22-AFD7-F4B40715ADE3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i0$a')]
//  Ji0_a = interface(JAsyncTask) // or JObject
//  ['{3C603FEB-D9FA-49B1-A421-B7910E391DE0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi0_a = class(TJavaGenericImport<Ji0_aClass, Ji0_a>) end;

//  Ji0Class = interface(JObjectClass)
//  ['{5A54A169-B917-4F2F-901E-150DED69D420}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JMatrix; P2: Boolean; P3: Integer); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i0')]
//  Ji0 = interface(JObject)
//  ['{955FADF6-B842-4C9D-A2A1-7DEA889BB059}']
//    { Property Methods }
//
//    { methods }
//    procedure onAutoFocus(P1: Boolean; P2: JCamera); cdecl;
//    procedure d; cdecl;
//    procedure a(P1: JRect; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean); cdecl; overload;
//
//    { Property }
//  end;

//  TJi0 = class(TJavaGenericImport<Ji0Class, Ji0>) end;

//  Ji1Class = interface(Jd7Class) // or JObjectClass
//  ['{DDED61B4-E3ED-407B-93C8-DC0E47B311A4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i1')]
//  Ji1 = interface(Jd7) // or JObject
//  ['{BACA6D28-85B9-4202-BD9B-81B40B6F277D}']
//    { Property Methods }
//
//    { methods }
//    function d: Integer; cdecl;
//    function a(P1: Integer): Integer; cdecl;
//
//    { Property }
//  end;

//  TJi1 = class(TJavaGenericImport<Ji1Class, Ji1>) end;

//  Ji2Class = interface(JObjectClass)
//  ['{7691EE60-76CF-4113-800B-54A5A2A83884}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Ji2; cdecl;
//    {class} function a(P1: Jf3; P2: Jf3; P3: Jf3): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<Jf3>; P2: TJavaObjectArray<Jf3>; P3: TJavaArray<Integer>): Boolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i2')]
//  Ji2 = interface(JObject)
//  ['{930197A6-23D0-4D16-86D0-BE1343688ED5}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JMap): TJavaObjectArray<Jf3>; cdecl; overload;
//
//    { Property }
//  end;

//  TJi2 = class(TJavaGenericImport<Ji2Class, Ji2>) end;

//  Ji3_aClass = interface(JObjectClass)
//  ['{68BCF7BD-7724-46B1-A17F-3A92D4B74862}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i3$a')]
//  Ji3_a = interface(JObject)
//  ['{AC2460A6-C6F0-4581-BAC2-93A37FD7E21D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi3_a = class(TJavaGenericImport<Ji3_aClass, Ji3_a>) end;

//  Ji3_bClass = interface(JObjectClass)
//  ['{5C31F360-A3BF-411C-8AF4-331AC47E1E85}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i3$b')]
//  Ji3_b = interface(JObject)
//  ['{FFDA38CE-7A64-46B1-AC68-462630CA2698}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Je3; P2: Je3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJi3_b = class(TJavaGenericImport<Ji3_bClass, Ji3_b>) end;

//  Ji3_cClass = interface(JObjectClass)
//  ['{3A561569-4ED3-4AA3-95E7-90EB2B5CC6C6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i3$c')]
//  Ji3_c = interface(JObject)
//  ['{BDC38670-DBA1-4E5D-B956-DFB9DBC74122}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Je3; P2: Je3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJi3_c = class(TJavaGenericImport<Ji3_cClass, Ji3_c>) end;

//  Ji3_dClass = interface(JObjectClass)
//  ['{9079F771-CFE6-479C-AFD8-950CF11D08B1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i3$d')]
//  Ji3_d = interface(JObject)
//  ['{08F15D98-54EE-4BE0-AC15-41EE8E693DD7}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Je3; P2: Je3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJi3_d = class(TJavaGenericImport<Ji3_dClass, Ji3_d>) end;

//  Ji3_eClass = interface(JObjectClass)
//  ['{63640E22-175E-4913-8924-7BAA3E09CF1A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i3$e')]
//  Ji3_e = interface(JObject)
//  ['{057BBE71-4CF2-4251-9C56-1DB88884BB39}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Je3; P2: Je3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJi3_e = class(TJavaGenericImport<Ji3_eClass, Ji3_e>) end;

//  Ji3_fClass = interface(JObjectClass)
//  ['{AED402DD-32CF-4736-9FE5-1FD53D73CBFE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i3$f')]
//  Ji3_f = interface(JObject)
//  ['{A602E91F-530F-4193-A594-2D032E10549B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Je3; P2: Je3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJi3_f = class(TJavaGenericImport<Ji3_fClass, Ji3_f>) end;

//  Ji3_gClass = interface(JObjectClass)
//  ['{C7A22E93-9D86-4300-A9BD-DD0B70D8E4CC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i3$g')]
//  Ji3_g = interface(JObject)
//  ['{526AB717-442D-4927-A537-83865FF2213A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Je3; P2: Je3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJi3_g = class(TJavaGenericImport<Ji3_gClass, Ji3_g>) end;

//  Ji3Class = interface(JObjectClass)
//  ['{7631EC84-53D2-481A-9ED1-A0C8FED1BA50}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js; P2: Jv6): Ji3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i3')]
//  Ji3 = interface(JObject)
//  ['{27FEE84F-87DB-4C00-AD74-7F67A0999200}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi3 = class(TJavaGenericImport<Ji3Class, Ji3>) end;

//  Ji4Class = interface(Jt6Class) // or JObjectClass
//  ['{41A1D046-690F-444C-8582-E2F324E34F4C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i4')]
//  Ji4 = interface(Jt6) // or JObject
//  ['{5778BE7B-7F75-42CD-A760-CB3DB971AF74}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJi4 = class(TJavaGenericImport<Ji4Class, Ji4>) end;

//  Ji5Class = interface(JObjectClass)
//  ['{49527ABC-5F91-4E03-8676-9C113BD2E07A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Js; P2: Js; P3: Integer; P4: TJavaArray<Double>): Js; cdecl; overload;
//    {class} function a(P1: Double; P2: TJavaArray<Double>; P3: JString): TJavaArray<TJavaArray<Double>>; cdecl; overload;
//    {class} function a(P1: TJavaArray<Double>): JStringBuffer; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i5')]
//  Ji5 = interface(JObject)
//  ['{6C23B80E-F2CE-4A7A-831A-731EA1FBB38F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi5 = class(TJavaGenericImport<Ji5Class, Ji5>) end;

//  Ji6Class = interface(JObjectClass)
//  ['{03EA02B1-4178-4A29-9AC7-BE147E427413}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i6')]
//  Ji6 = interface(JObject)
//  ['{C2484FFE-870D-47D8-9E8E-0EA5A5275997}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaObjectArray<Ju6>); cdecl;
//
//    { Property }
//  end;

//  TJi6 = class(TJavaGenericImport<Ji6Class, Ji6>) end;

//  Ji7Class = interface(JObjectClass)
//  ['{A2DA2937-A840-4CF7-A0A9-0D4BF8E82D50}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i7')]
//  Ji7 = interface(JObject)
//  ['{247C910E-DAAF-47C5-860A-63B9955F824F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi7 = class(TJavaGenericImport<Ji7Class, Ji7>) end;

//  Ji8Class = interface(JObjectClass)
//  ['{B77C1764-D2FF-4453-8117-8C9214FC46D0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: JContext): JPoint; cdecl;
//    {class} function a(P1: JContext): Integer; cdecl; overload;
//    {class} function a(P1: JContext; P2: Integer): Integer; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i8')]
//  Ji8 = interface(JObject)
//  ['{162F45F6-5A0E-4DF7-9536-EB0C76ECCBE7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi8 = class(TJavaGenericImport<Ji8Class, Ji8>) end;

//  Jj_282Class = interface(JObjectClass)
//  ['{EC5FEB8E-95AF-4171-94EE-08C87D5C222B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j')]
//  Jj_282 = interface(JObject)
//  ['{995E5D57-5000-4835-B7CC-3319746D8742}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer): TJavaArray<TJavaArray<Byte>>; cdecl;
//
//    { Property }
//  end;

//  TJj_282 = class(TJavaGenericImport<Jj_282Class, Jj_282>) end;

//  Jj0_aClass = interface(JObjectClass)
//  ['{89C57503-BD29-4326-85EB-E828C6F52CC9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j0$a')]
//  Jj0_a = interface(JObject)
//  ['{8F0E8CD4-C10C-4CAA-A7C8-4E4DAA10776F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj0_a = class(TJavaGenericImport<Jj0_aClass, Jj0_a>) end;

//  Jj0_bClass = interface(JEnumClass) // or JObjectClass
//  ['{6C9FA9E7-0004-44B8-AD91-EDB65A9E502B}']
//    { static Property Methods }
//    {class} function _Getb: Jj0_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jj0_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jj0_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jj0_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jj0_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jj0_b>; cdecl;
//    {class} function valueOf(P1: JString): Jj0_b; cdecl;
//
//    { static Property }
//    {class} property b: Jj0_b read _Getb;
//    {class} property c: Jj0_b read _Getc;
//    {class} property d: Jj0_b read _Getd;
//    {class} property e: Jj0_b read _Gete;
//    {class} property f: Jj0_b read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j0$b')]
//  Jj0_b = interface(JEnum) // or JObject
//  ['{28B09FA5-2FB3-493F-BA9B-6C7F5C8B81CC}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJj0_b = class(TJavaGenericImport<Jj0_bClass, Jj0_b>) end;

//  Jj0_cClass = interface(JObjectClass)
//  ['{FD3A317D-1BE0-4815-BAC9-E090FA23A65A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j0$c')]
//  Jj0_c = interface(IJavaInstance)
//  ['{B65E362F-1F57-4A24-A5DE-37C55D535547}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl;
//    procedure c; cdecl;
//    procedure b; cdecl;
//
//    { Property }
//  end;

//  TJj0_c = class(TJavaGenericImport<Jj0_cClass, Jj0_c>) end;

//  Jj0_dClass = interface(JObjectClass)
//  ['{3E1AD67E-2E44-421B-B939-5B0C63702077}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j0$d')]
//  Jj0_d = interface(IJavaInstance)
//  ['{365CC31C-764E-4B0D-8E5A-9A6873A60649}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Byte>); cdecl;
//
//    { Property }
//  end;

//  TJj0_d = class(TJavaGenericImport<Jj0_dClass, Jj0_d>) end;

//  Jj0_eClass = interface(JObjectClass)
//  ['{1A494B96-50DB-47C7-90AE-AD2C6E24C5CA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j0$e')]
//  Jj0_e = interface(JObject)
//  ['{5687B3A3-A752-4EE4-A79E-D120490E2862}']
//    { Property Methods }
//
//    { methods }
//    procedure onPreviewFrame(P1: TJavaArray<Byte>; P2: JCamera); cdecl;
//
//    { Property }
//  end;

//  TJj0_e = class(TJavaGenericImport<Jj0_eClass, Jj0_e>) end;

//  Jj0Class = interface(JObjectClass)
//  ['{806B9EDC-13A4-438C-B4E5-1576F43483E0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Je0): Jj0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j0')]
//  Jj0 = interface(JObject)
//  ['{6742BBB1-F371-499E-B9B3-1452253A3136}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jj0_d); cdecl; overload;
//    procedure a(P1: Jj0_c); cdecl; overload;
//    procedure a(P1: JTextureView); cdecl; overload;
//    procedure m; cdecl;
//    procedure l; cdecl;
//    procedure k; cdecl;
//    procedure a(P1: JString); cdecl; overload;
//    function h: JString; cdecl;
//    procedure p; cdecl;
//    procedure q; cdecl;
//    procedure o; cdecl;
//    procedure a(P1: JRect; P2: Boolean); cdecl; overload;
//    procedure a; cdecl; overload;
//    function e: JPoint; cdecl;
//    procedure n; cdecl;
//    function j: Boolean; cdecl;
//    function f: Jj0_b; cdecl;
//    function b: Jg0; cdecl; overload;
//    procedure c(P1: Integer); cdecl; overload;
//    function g: Jm0; cdecl;
//    procedure d(P1: Integer); cdecl; overload;
//    function c: Jk0; cdecl; overload;
//    procedure a(P1: JList); cdecl; overload;
//    function d: Integer; cdecl; overload;
//    procedure b(P1: Integer); cdecl; overload;
//    function i: Boolean; cdecl;
//
//    { Property }
//  end;

//  TJj0 = class(TJavaGenericImport<Jj0Class, Jj0>) end;

//  Jj1Class = interface(JObjectClass)
//  ['{6E0175F5-DBAE-459E-B9C5-F37571B468AF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JObject); cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j1')]
//  Jj1 = interface(JObject)
//  ['{663AF800-C8DC-4624-848B-6FA459214399}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj1 = class(TJavaGenericImport<Jj1Class, Jj1>) end;

//  Jj2Class = interface(JObjectClass)
//  ['{3B8EF6A9-2995-4A71-A689-C5BBD6231F0D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Boolean; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single): Jj2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j2')]
//  Jj2 = interface(JObject)
//  ['{B7558476-E808-4206-855C-76439E32DBBD}']
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
//    function a(P1: Jj2): Integer; cdecl; overload;
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

//  TJj2 = class(TJavaGenericImport<Jj2Class, Jj2>) end;

//  Jj3_aClass = interface(JObjectClass)
//  ['{0C273423-244F-4FD8-8C28-EA39A7F92776}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j3$a')]
//  Jj3_a = interface(JObject)
//  ['{3330A8FB-D306-4FB8-8C89-7F695451FB63}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj3_a = class(TJavaGenericImport<Jj3_aClass, Jj3_a>) end;

//  Jj3_bClass = interface(JObjectClass)
//  ['{760B7CF4-815C-4F89-A8BD-AA7ED8011B6E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j3$b')]
//  Jj3_b = interface(JObject)
//  ['{CB9E4751-C0AE-4289-9C40-AABD00DA4D63}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jf3; P2: Jf3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJj3_b = class(TJavaGenericImport<Jj3_bClass, Jj3_b>) end;

//  Jj3_cClass = interface(JObjectClass)
//  ['{27AB3280-3692-40F2-A20B-30B9658B1E46}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j3$c')]
//  Jj3_c = interface(JObject)
//  ['{8BE22F8C-56DD-487F-B12A-F5CED39BD385}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jf3; P2: Jf3): Integer; cdecl;
//    function compare(P1: JObject; P2: JObject): Integer; cdecl;
//
//    { Property }
//  end;

//  TJj3_c = class(TJavaGenericImport<Jj3_cClass, Jj3_c>) end;

//  Jj3Class = interface(JObjectClass)
//  ['{8FD9892A-AE4B-4FA3-BF9D-1001CD11BBF3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js; P2: Jv6): Jj3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j3')]
//  Jj3 = interface(JObject)
//  ['{E8141583-F51E-4EEA-B040-8D679C23CBEB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj3 = class(TJavaGenericImport<Jj3Class, Jj3>) end;

//  Jj4Class = interface(Jg5Class) // or JObjectClass
//  ['{C750149E-EC5E-4CAB-8F66-2C6481C0BCA1}']
//    { static Property Methods }
//    {class} function _Getf: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jj4; cdecl;
//
//    { static Property }
//    {class} property f: TJavaArray<TJavaArray<Integer>> read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j4')]
//  Jj4 = interface(Jg5) // or JObject
//  ['{CAC0C27B-4F9E-4201-86F1-F382E2AFB12A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJj4 = class(TJavaGenericImport<Jj4Class, Jj4>) end;

//  Jj5Class = interface(JObjectClass)
//  ['{52D7F8DF-F2DE-48A6-A64D-FF3B70A47454}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: Int64; P4: Int64; P5: JInterpolator): Jj5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j5')]
//  Jj5 = interface(JObject)
//  ['{138BC035-2596-4E3C-81ED-AFE20234F339}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jw5; P2: Int64); cdecl;
//
//    { Property }
//  end;

//  TJj5 = class(TJavaGenericImport<Jj5Class, Jj5>) end;

//  Jj6Class = interface(JObjectClass)
//  ['{20CEA9E7-76CB-4E4E-8362-5E8AD609AF61}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj6; cdecl;
//    {class} procedure a(P1: Jp4); cdecl; overload;
//    {class} procedure a(P1: Jp4; P2: Js6); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j6')]
//  Jj6 = interface(JObject)
//  ['{25321F71-5F67-45E6-95AB-4FD58B736BF9}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Js6; cdecl; overload;
//
//    { Property }
//  end;

//  TJj6 = class(TJavaGenericImport<Jj6Class, Jj6>) end;

//  Jj7Class = interface(JObjectClass)
//  ['{E34E289F-D3DC-42A4-B9EF-55B51311C018}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: Jp4): Jp4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j7')]
//  Jj7 = interface(JObject)
//  ['{121F972D-C8F7-454E-A1AD-E7AA853F8424}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJj7 = class(TJavaGenericImport<Jj7Class, Jj7>) end;

//  Jj8Class = interface(JObjectClass)
//  ['{BBE4084A-D581-414D-B6F2-A3BAD2C594CD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js): Jj8; cdecl; overload;
//    {class} function init(P1: Js; P2: Integer; P3: Integer; P4: Integer): Jj8; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j8')]
//  Jj8 = interface(JObject)
//  ['{B2C12CB7-D09E-4659-9EDD-8D28AECDCC17}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaObjectArray<Ju6>; cdecl;
//
//    { Property }
//  end;

//  TJj8 = class(TJavaGenericImport<Jj8Class, Jj8>) end;

//  JkClass = interface(JObjectClass)
//  ['{91029F66-4477-4529-B13D-A290F9C39A9A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k')]
//  Jk = interface(JObject)
//  ['{91765D96-CEA0-4F11-A769-5FD47D9DA64B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk = class(TJavaGenericImport<JkClass, Jk>) end;

//  Jk0_aClass = interface(JObjectClass)
//  ['{A483530E-91E3-4BDB-A733-B33229062C7D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JRect; P2: Integer): Jk0_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k0$a')]
//  Jk0_a = interface(JObject)
//  ['{63987E06-B4F8-4D88-9509-67C941945B3E}']
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

//  TJk0_a = class(TJavaGenericImport<Jk0_aClass, Jk0_a>) end;

//  Jk0Class = interface(JObjectClass)
//  ['{11ECB398-4815-49AF-8336-6D74F0D5B893}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: JRect): Jk0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k0')]
//  Jk0 = interface(JObject)
//  ['{D4B3AD31-A3A0-479D-9445-E950E37A49EC}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//    function b: JRect; cdecl;
//
//    { Property }
//  end;

//  TJk0 = class(TJavaGenericImport<Jk0Class, Jk0>) end;

//  Jk1Class = interface(JObjectClass)
//  ['{96B18613-3807-48A0-97DF-EFD13CA2E1F0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k1')]
//  Jk1 = interface(JObject)
//  ['{D0F50079-27C6-4CEE-A76A-4A66BA2F1B3E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJk1 = class(TJavaGenericImport<Jk1Class, Jk1>) end;

//  Jk2Class = interface(JObjectClass)
//  ['{568E7D6A-2599-4250-9BA0-3C2B6EA0A0B9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js; P2: TJavaObjectArray<Ju6>): Jk2; cdecl; overload;
//    {class} function init(P1: Js; P2: TJavaObjectArray<Ju6>; P3: TJavaObjectArray<Ju6>; P4: Single): Jk2; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k2')]
//  Jk2 = interface(JObject)
//  ['{7D0E983A-8B74-47F9-AA76-1E257AFAA6DA}']
//    { Property Methods }
//
//    { methods }
//    function b: TJavaObjectArray<Ju6>; cdecl;
//    function c: Single; cdecl;
//    function a: Js; cdecl;
//    function d: TJavaObjectArray<Ju6>; cdecl;
//
//    { Property }
//  end;

//  TJk2 = class(TJavaGenericImport<Jk2Class, Jk2>) end;

//  Jk3Class = interface(JObjectClass)
//  ['{E300380C-AB9D-48D9-A192-6F0248AD96C7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaObjectArray<Je3>): Jk3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k3')]
//  Jk3 = interface(JObject)
//  ['{71986F94-CC31-4CC2-A03B-118D254D120A}']
//    { Property Methods }
//
//    { methods }
//    function a: Je3; cdecl;
//    function b: Je3; cdecl;
//    function c: Je3; cdecl;
//
//    { Property }
//  end;

//  TJk3 = class(TJavaGenericImport<Jk3Class, Jk3>) end;

//  Jk4Class = interface(Jh5Class) // or JObjectClass
//  ['{87188E7E-F55C-4FB2-BF26-F9F13B24DC85}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k4')]
//  Jk4 = interface(Jh5) // or JObject
//  ['{7BA33092-C2E0-4D9D-A875-581A87599813}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJk4 = class(TJavaGenericImport<Jk4Class, Jk4>) end;

//  Jk5Class = interface(Jq3Class) // or JObjectClass
//  ['{CD1BDADF-F98D-4BC4-83C3-9FE035522EF5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jp4): Jk5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k5')]
//  Jk5 = interface(Jq3) // or JObject
//  ['{246257CC-F9F8-411E-9085-F2A4C63D30EF}']
//    { Property Methods }
//
//    { methods }
//    function a: Js; cdecl;
//
//    { Property }
//  end;

//  TJk5 = class(TJavaGenericImport<Jk5Class, Jk5>) end;

//  Jk6Class = interface(JObjectClass)
//  ['{E42738D7-504E-4C97-A4CE-757B8521BE0A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k6')]
//  Jk6 = interface(JObject)
//  ['{0A77124E-53F7-406D-B7D6-635F3DDBBE58}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJk6 = class(TJavaGenericImport<Jk6Class, Jk6>) end;

//  Jk7Class = interface(JObjectClass)
//  ['{FE9463F0-09E3-47D3-94E2-D127620474C1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Jp; P2: JMap; P3: Js6; P4: TJavaArray<Integer>; P5: TJavaArray<Double>): TJavaArray<Byte>; cdecl; overload;
//    {class} function a(P1: Ju6; P2: Ju6): Double; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<Ju6>; P2: Integer; P3: Integer; P4: TJavaArray<Double>): TJavaObjectArray<Ju6>; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k7')]
//  Jk7 = interface(JObject)
//  ['{51D34B19-52C1-4D7D-AD80-2272FAD9B73F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJk7 = class(TJavaGenericImport<Jk7Class, Jk7>) end;

//  Jk8Class = interface(Jt6Class) // or JObjectClass
//  ['{7DCB5E23-A022-4400-BACC-AC9E7174FAD3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk8; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k8')]
//  Jk8 = interface(Jt6) // or JObject
//  ['{DF725DB3-E277-48AF-A9EC-A654D9115D6B}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJk8 = class(TJavaGenericImport<Jk8Class, Jk8>) end;

//  JlClass = interface(JObjectClass)
//  ['{7318E045-4EA2-4CCB-ABC6-98866FF302CC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l')]
//  Jl = interface(JObject)
//  ['{220AB40C-1319-4D80-898D-54FD93E6BF71}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl = class(TJavaGenericImport<JlClass, Jl>) end;

//  Jl0Class = interface(JObjectClass)
//  ['{3227D312-DD73-4103-8591-1C36ADD9AE9C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l0')]
//  Jl0 = interface(JObject)
//  ['{ED9D2A2E-0FA1-4CDC-A1E3-15AEEF6188E4}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JCamera); cdecl; overload;
//    function a: Jk0; cdecl; overload;
//    procedure a(P1: JList); cdecl; overload;
//
//    { Property }
//  end;

//  TJl0 = class(TJavaGenericImport<Jl0Class, Jl0>) end;

//  Jl1Class = interface(JObjectClass)
//  ['{CDC42AFD-ADC0-40F4-833E-F21EC9596314}']
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

//  [JavaSignature('com/huawei/hms/scankit/p/l1')]
//  Jl1 = interface(JObject)
//  ['{844A0B95-B237-46AE-ABE8-C4441A80AB32}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl1 = class(TJavaGenericImport<Jl1Class, Jl1>) end;

//  Jl2Class = interface(JObjectClass)
//  ['{FDD4EB2C-D6E0-44EA-91F5-70AF13508800}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Boolean; P2: Jp; P3: Integer; P4: Boolean): JList; cdecl; overload;
//    {class} function a(P1: Boolean; P2: Jp; P3: Jj2): Boolean; cdecl; overload;
//    {class} procedure a(P1: Js; P2: Js6; P3: Single; P4: Jj2); cdecl; overload;
//    {class} procedure a(P1: TJavaObjectArray<Ju6>; P2: Single; P3: Jj2); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l2')]
//  Jl2 = interface(JObject)
//  ['{1F1EF665-686B-4881-943D-B58E08E6F822}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl2 = class(TJavaGenericImport<Jl2Class, Jl2>) end;

//  Jl3Class = interface(JObjectClass)
//  ['{BE5E06C5-86F7-445D-9584-685BE4CCCD59}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l3')]
//  Jl3 = interface(JObject)
//  ['{0073A501-E8E7-45A8-9D44-A8D3EDFA6E8F}']
//    { Property Methods }
//
//    { methods }
//    function hashCode: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJl3 = class(TJavaGenericImport<Jl3Class, Jl3>) end;

//  Jl4Class = interface(JObjectClass)
//  ['{0B6AAE50-F73F-47CB-9FB5-F99EA8831624}']
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

//  [JavaSignature('com/huawei/hms/scankit/p/l4')]
//  Jl4 = interface(JObject)
//  ['{BA4F5196-A088-4C3C-9030-D4683551B65C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl4 = class(TJavaGenericImport<Jl4Class, Jl4>) end;

//  Jl5Class = interface(JObjectClass)
//  ['{D66856DE-C0E1-477A-B274-1491589BD0AD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl5; cdecl; overload;
//    {class} function init(P1: Boolean): Jl5; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l5')]
//  Jl5 = interface(JObject)
//  ['{D61EB5AC-89ED-4F1C-8886-46E2AB1E2BBE}']
//    { Property Methods }
//
//    { methods }
//    function a: Jj; cdecl; overload;
//    procedure a(P1: JString; P2: Integer); cdecl; overload;
//    procedure a(P1: Jy0); cdecl; overload;
//    procedure a(P1: Boolean); cdecl; overload;
//    procedure a(P1: JCharset); cdecl; overload;
//
//    { Property }
//  end;

//  TJl5 = class(TJavaGenericImport<Jl5Class, Jl5>) end;

//  Jl6Class = interface(JObjectClass)
//  ['{921634C4-B92D-457D-A053-D895EC10DDF4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l6')]
//  Jl6 = interface(JObject)
//  ['{2DC2864C-2E7A-4E3C-A735-19F0A9D6CF2C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJl6 = class(TJavaGenericImport<Jl6Class, Jl6>) end;

//  Jl7Class = interface(Jq7Class) // or JObjectClass
//  ['{274BD0A2-7B85-42E5-A514-B81A45E56612}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l7')]
//  Jl7 = interface(Jq7) // or JObject
//  ['{8D758887-C896-464F-8E2F-2E11BCF3666B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Jr): Boolean; cdecl; overload;
//    function a(P1: Integer; P2: Jr; P3: TJavaArray<Integer>; P4: JMap): Js6; cdecl; overload;
//    function a(P1: Integer; P2: Jr; P3: JMap): Js6; cdecl; overload;
//    function a(P1: Jp; P2: JMap): Js6; cdecl; overload;
//
//    { Property }
//  end;

//  TJl7 = class(TJavaGenericImport<Jl7Class, Jl7>) end;

//  Jl8Class = interface(JObjectClass)
//  ['{EBC4E8D5-536F-47CC-BD79-03438E4F10D6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l8')]
//  Jl8 = interface(IJavaInstance)
//  ['{0986FE6F-06B0-4602-B52F-89B60F36C3C3}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJl8 = class(TJavaGenericImport<Jl8Class, Jl8>) end;

//  JmClass = interface(JObjectClass)
//  ['{6CA10788-9E82-45F1-9532-B53A4AA16AAE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m')]
//  Jm = interface(JObject)
//  ['{71356090-ACB2-4DD2-8249-AA4C064D9A2B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm = class(TJavaGenericImport<JmClass, Jm>) end;

//  Jm0Class = interface(JObjectClass)
//  ['{1924AFB0-2551-4363-8F6E-3D8AA2C6D882}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: JList): Jm0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m0')]
//  Jm0 = interface(JObject)
//  ['{10D48449-CD8D-4E78-A165-58F6EAA900E0}']
//    { Property Methods }
//
//    { methods }
//    function c: Integer; cdecl;
//    function b: Integer; cdecl;
//    function a: JList; cdecl;
//
//    { Property }
//  end;

//  TJm0 = class(TJavaGenericImport<Jm0Class, Jm0>) end;

//  Jm1Class = interface(JEnumClass) // or JObjectClass
//  ['{00C01F82-0C7C-4A2B-8C83-5FA62888874C}']
//    { static Property Methods }
//    {class} function _Getb: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jm1;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jm1>; cdecl;
//    {class} function valueOf(P1: JString): Jm1; cdecl;
//
//    { static Property }
//    {class} property b: Jm1 read _Getb;
//    {class} property c: Jm1 read _Getc;
//    {class} property d: Jm1 read _Getd;
//    {class} property e: Jm1 read _Gete;
//    {class} property f: Jm1 read _Getf;
//    {class} property g: Jm1 read _Getg;
//    {class} property h: Jm1 read _Geth;
//    {class} property i: Jm1 read _Geti;
//    {class} property j: Jm1 read _Getj;
//    {class} property k: Jm1 read _Getk;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m1')]
//  Jm1 = interface(JEnum) // or JObject
//  ['{C33A9F51-47E9-44BE-9674-1F973AAE7E8D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm1 = class(TJavaGenericImport<Jm1Class, Jm1>) end;

//  Jm2Class = interface(JObjectClass)
//  ['{A81AA69A-448C-4BEE-80F0-CA48382D085B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m2')]
//  Jm2 = interface(JObject)
//  ['{C2055157-EF9D-4A5E-B9CD-B9DCA5B17115}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm2 = class(TJavaGenericImport<Jm2Class, Jm2>) end;

//  Jm3Class = interface(JObjectClass)
//  ['{AEEABFD9-F034-451C-A422-13C112563BDA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m3')]
//  Jm3 = interface(JObject)
//  ['{76A4B85B-7561-4BA1-9E56-7A849B6414A4}']
//    { Property Methods }
//
//    { methods }
//    function hashCode: Integer; cdecl;
//    function equals(P1: JObject): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJm3 = class(TJavaGenericImport<Jm3Class, Jm3>) end;

//  Jm4Class = interface(JObjectClass)
//  ['{527B9039-3A7F-4958-B444-E1639FB4E862}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm4; cdecl;
//    {class} function h(P1: Jp): Jp; cdecl; overload;
//    {class} function a(P1: Jp): Jp; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m4')]
//  Jm4 = interface(JObject)
//  ['{D6F006E9-B7A1-48F3-9796-9A913A1C20FD}']
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
//    function i(P1: Jp; P2: Single): Jp; cdecl;
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

//  TJm4 = class(TJavaGenericImport<Jm4Class, Jm4>) end;

//  Jm5Class = interface(JObjectClass)
//  ['{B47034B5-0260-4FDD-9B58-3612BFB1702E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m5')]
//  Jm5 = interface(JObject)
//  ['{DCD75956-C5D1-4E67-8B73-104FE1FC7325}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJm5 = class(TJavaGenericImport<Jm5Class, Jm5>) end;

//  Jm6Class = interface(Jp4Class) // or JObjectClass
//  ['{F08E3D9B-A75F-4D85-B4A9-35BA36EFE43A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: JByteBuffer): Jm6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m6')]
//  Jm6 = interface(Jp4) // or JObject
//  ['{72BA46C8-68DA-49A9-8320-8C728027BCD9}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    function b: TJavaArray<Byte>; cdecl;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jp4; cdecl; overload;
//
//    { Property }
//  end;

//  TJm6 = class(TJavaGenericImport<Jm6Class, Jm6>) end;

//  Jm7Class = interface(JObjectClass)
//  ['{3495E471-124A-43B8-B19B-362A4780A5A5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m7')]
//  Jm7 = interface(JObject)
//  ['{03CAB4AD-3E27-4569-8150-6CFC0158A5D1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJm7 = class(TJavaGenericImport<Jm7Class, Jm7>) end;

//  Jm8Class = interface(JObjectClass)
//  ['{710BEB45-B8C7-49EE-8C7C-30007ACE7564}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jm8; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m8')]
//  Jm8 = interface(JObject)
//  ['{62B56AAA-E68E-4AC3-8188-1DD37742B552}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJm8 = class(TJavaGenericImport<Jm8Class, Jm8>) end;

//  JnClass = interface(JObjectClass)
//  ['{DE7DBAED-48B0-4680-AF33-479075E6682B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n')]
//  Jn = interface(JObject)
//  ['{0BFDF81E-EF9E-4B1E-AC55-597B0ED74AE0}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jy2); cdecl; overload;
//
//    { Property }
//  end;

//  TJn = class(TJavaGenericImport<JnClass, Jn>) end;

//  Jn0Class = interface(JObjectClass)
//  ['{8DD06FDA-CE00-4FD7-A25F-39151162A253}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n0')]
//  Jn0 = interface(JObject)
//  ['{C7D05C8B-F414-4815-8E30-0A4671DCCCB6}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JCamera); cdecl; overload;
//    function a: Jm0; cdecl; overload;
//    function b: Boolean; cdecl;
//    procedure a(P1: Integer); cdecl; overload;
//
//    { Property }
//  end;

//  TJn0 = class(TJavaGenericImport<Jn0Class, Jn0>) end;

//  Jn1Class = interface(JObjectClass)
//  ['{ADE9A210-BAD0-4E8A-AB7E-139D25339E40}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function b(P1: JBitmap; P2: Jx6): TJavaObjectArray<Js6>; cdecl; overload;
//    {class} function c(P1: TJavaArray<Byte>; P2: Jx6): TJavaObjectArray<Js6>; cdecl;
//    {class} function b(P1: Jp4; P2: Jx6): TJavaObjectArray<Js6>; cdecl; overload;
//    {class} function a(P1: JList; P2: Jo1): Js6; cdecl; overload;
//    {class} function b(P1: JList; P2: Jo1; P3: JList): Js6; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: Jx6): TJavaObjectArray<Js6>; cdecl; overload;
//    {class} function a(P1: JByteBuffer; P2: Jx6): TJavaObjectArray<Js6>; cdecl; overload;
//    {class} function b(P1: TJavaArray<Byte>; P2: Jx6): TJavaObjectArray<Js6>; cdecl; overload;
//    {class} function a(P1: Jp4; P2: Jx6): TJavaObjectArray<Js6>; cdecl; overload;
//    {class} function a(P1: JList; P2: Jo1; P3: JList): JList; cdecl; overload;
//    {class} procedure a(P1: Boolean); cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Jx6; P3: Boolean): TJavaObjectArray<Js6>; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n1')]
//  Jn1 = interface(JObject)
//  ['{351FE819-2BBC-45DC-926C-28C839F52574}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn1 = class(TJavaGenericImport<Jn1Class, Jn1>) end;

//  Jn2_aClass = interface(JArrayListClass) // or JObjectClass
//  ['{0A0B0C17-0BC3-43C5-9418-039651EFC1B7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n2$a')]
//  Jn2_a = interface(JArrayList) // or JObject
//  ['{B6ED127E-3552-498A-B59E-DB78EA5BA2C0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn2_a = class(TJavaGenericImport<Jn2_aClass, Jn2_a>) end;

//  Jn2Class = interface(Jt6Class) // or JObjectClass
//  ['{7CB2223D-ADD6-4D3B-ACA0-E9A69D4437E1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n2')]
//  Jn2 = interface(Jt6) // or JObject
//  ['{37860DFE-01DC-441C-9475-B24F3C9983A5}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//    function a(P1: TJavaObjectArray<JString>; P2: JString): JHmsScan_DriverInfo; cdecl;
//
//    { Property }
//  end;

//  TJn2 = class(TJavaGenericImport<Jn2Class, Jn2>) end;

//  Jn3Class = interface(JObjectClass)
//  ['{A2098604-8AD6-473F-A9CE-44366CFE8B6B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): JList; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n3')]
//  Jn3 = interface(JObject)
//  ['{D84D50A9-2440-4D6C-9608-A9A1BB23CE66}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn3 = class(TJavaGenericImport<Jn3Class, Jn3>) end;

//  Jn4Class = interface(Jt6Class) // or JObjectClass
//  ['{26BC2FB7-059C-4F71-8C50-7DE70DA48EC8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n4')]
//  Jn4 = interface(Jt6) // or JObject
//  ['{E1ADDB6D-5F0E-45D4-BD4F-9E7A65CA328D}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJn4 = class(TJavaGenericImport<Jn4Class, Jn4>) end;

//  Jn5Class = interface(JObjectClass)
//  ['{34E14431-D4A4-43B8-BE8D-84B2EAA12303}']
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

//  [JavaSignature('com/huawei/hms/scankit/p/n5')]
//  Jn5 = interface(JObject)
//  ['{7B6DF841-8EBB-4C20-B365-B71067B6EA25}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn5 = class(TJavaGenericImport<Jn5Class, Jn5>) end;

//  Jn6Class = interface(JObjectClass)
//  ['{E02D0478-F4E2-449E-BBDA-70E59D7C0881}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): Integer; cdecl; overload;
//    {class} function a(P1: Single): Single; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n6')]
//  Jn6 = interface(JObject)
//  ['{70135426-4EE1-45AD-88CE-4A38C7FFBA0F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn6 = class(TJavaGenericImport<Jn6Class, Jn6>) end;

//  Jn7Class = interface(JObjectClass)
//  ['{C27CA9F2-71B0-4B09-8AD8-5C195A0B569E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n7')]
//  Jn7 = interface(JObject)
//  ['{91523718-38BD-4779-ACE9-074B370D451E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJn7 = class(TJavaGenericImport<Jn7Class, Jn7>) end;

//  Jn8Class = interface(Jd0Class) // or JObjectClass
//  ['{4205A5AE-D606-44A5-8DE5-7A7CB77E312F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n8')]
//  Jn8 = interface(Jd0) // or JObject
//  ['{9E64F198-0585-4111-BCD3-AF84BA7EEDC2}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jy2); cdecl; overload;
//
//    { Property }
//  end;

//  TJn8 = class(TJavaGenericImport<Jn8Class, Jn8>) end;

//  JoClass = interface(JObjectClass)
//  ['{B14129C6-91CA-474B-88A8-7676A7883123}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o')]
//  Jo = interface(JObject)
//  ['{F0BD25A0-F33F-42A6-9E28-03C4E3343644}']
//    { Property Methods }
//
//    { methods }
//    function c: Jp4; cdecl;
//    function a(P1: Integer; P2: Jr): Jr; cdecl; overload;
//    function a: Js; cdecl; overload;
//    function a(P1: Jp4): Jo; cdecl; overload;
//    function d: Integer; cdecl;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJo = class(TJavaGenericImport<JoClass, Jo>) end;

//  Jo0Class = interface(JEnumClass) // or JObjectClass
//  ['{D6797DA0-09A7-48A5-9A03-FC62C91CDD6C}']
//    { static Property Methods }
//    {class} function _Getc: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getq: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gets: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gett: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getu: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getv: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getw: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getx: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gety: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getz: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetA: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetB: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetC: Jo0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jo0>; cdecl;
//    {class} function valueOf(P1: JString): Jo0; cdecl;
//    {class} function a(P1: Integer): Jo0; cdecl; overload;
//    {class} function a(P1: JString): Jo0; cdecl; overload;
//
//    { static Property }
//    {class} property c: Jo0 read _Getc;
//    {class} property d: Jo0 read _Getd;
//    {class} property e: Jo0 read _Gete;
//    {class} property f: Jo0 read _Getf;
//    {class} property g: Jo0 read _Getg;
//    {class} property h: Jo0 read _Geth;
//    {class} property i: Jo0 read _Geti;
//    {class} property j: Jo0 read _Getj;
//    {class} property k: Jo0 read _Getk;
//    {class} property l: Jo0 read _Getl;
//    {class} property m: Jo0 read _Getm;
//    {class} property n: Jo0 read _Getn;
//    {class} property o: Jo0 read _Geto;
//    {class} property p: Jo0 read _Getp;
//    {class} property q: Jo0 read _Getq;
//    {class} property r: Jo0 read _Getr;
//    {class} property s: Jo0 read _Gets;
//    {class} property t: Jo0 read _Gett;
//    {class} property u: Jo0 read _Getu;
//    {class} property v: Jo0 read _Getv;
//    {class} property w: Jo0 read _Getw;
//    {class} property x: Jo0 read _Getx;
//    {class} property y: Jo0 read _Gety;
//    {class} property z: Jo0 read _Getz;
//    {class} property A: Jo0 read _GetA;
//    {class} property B: Jo0 read _GetB;
//    {class} property C: Jo0 read _GetC;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o0')]
//  Jo0 = interface(JEnum) // or JObject
//  ['{5D17A0F3-1AEA-4BF5-825F-C8ADC68F1589}']
//    { Property Methods }
//
//    { methods }
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJo0 = class(TJavaGenericImport<Jo0Class, Jo0>) end;

//  Jo1Class = interface(JObjectClass)
//  ['{2A8668E9-E10C-4F1F-BB79-7E65A12B0A8A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JList; P2: Boolean): Boolean; cdecl; overload;
//    {class} function a(P1: TJavaArray<Single>): Single; cdecl; overload;
//    {class} function a(P1: Jj2): TJavaArray<Single>; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Boolean): Js; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Jp; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o1')]
//  Jo1 = interface(JObject)
//  ['{3E0DB5C3-1D17-4EDD-B761-2E5198F7241F}']
//    { Property Methods }
//    function _Geti: Jm4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seti(ai: Jm4);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: Jp; cdecl; overload;
//    function e(P1: JList; P2: Jj2): Js6; cdecl; overload;
//    function a(P1: JMap; P2: Jj2): Js6; cdecl; overload;
//    function a(P1: JMap): Js6; cdecl; overload;
//    function g(P1: JList; P2: Jj2): Js6; cdecl;
//    function f(P1: JList; P2: Jj2): Js6; cdecl;
//    function a(P1: JList; P2: Jj2): Js6; cdecl; overload;
//    function d(P1: JList; P2: Jj2): Js6; cdecl; overload;
//    function b(P1: JList; P2: Jj2): Js6; cdecl; overload;
//    function c(P1: JList; P2: Jj2): Js6; cdecl; overload;
//    function h(P1: JList; P2: Jj2): Js6; cdecl;
//    function a(P1: Integer; P2: Boolean): JList; cdecl; overload;
//    procedure b(P1: Jj2); cdecl; overload;
//    function c(P1: Jp): Single; cdecl; overload;
//    function c: Single; cdecl; overload;
//    function d: Single; cdecl; overload;
//    function e: Single; cdecl; overload;
//    function b: Boolean; cdecl; overload;
//    function b(P1: JList): Boolean; cdecl; overload;
//    function c(P1: JList): Boolean; cdecl; overload;
//
//    { Property }
//    property i: Jm4 read _Geti write _Seti;
//  end;

//  TJo1 = class(TJavaGenericImport<Jo1Class, Jo1>) end;

//  Jo2Class = interface(Jq7Class) // or JObjectClass
//  ['{4BF6C2C8-7BBA-47F3-AB19-CE3399A790EA}']
//    { static Property Methods }
//    {class} function _Getj: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jo2; cdecl;
//
//    { static Property }
//    {class} property j: TJavaArray<Integer> read _Getj;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o2')]
//  Jo2 = interface(Jq7) // or JObject
//  ['{20024262-1439-4AD6-B5E0-E1743CA30E90}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJo2 = class(TJavaGenericImport<Jo2Class, Jo2>) end;

//  Jo3Class = interface(JObjectClass)
//  ['{A4026A68-B0C9-4126-A1EE-F035E2E78D48}']
//    { static Property Methods }
//    {class} function _Geth: Jo3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jo3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jo3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jo3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jo3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Jo3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Jo3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: Jo3;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: Integer): Jo3; cdecl;
//
//    { static Property }
//    {class} property h: Jo3 read _Geth;
//    {class} property i: Jo3 read _Geti;
//    {class} property j: Jo3 read _Getj;
//    {class} property k: Jo3 read _Getk;
//    {class} property l: Jo3 read _Getl;
//    {class} property m: Jo3 read _Getm;
//    {class} property n: Jo3 read _Getn;
//    {class} property o: Jo3 read _Geto;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o3')]
//  Jo3 = interface(JObject)
//  ['{4370E73C-5485-41AD-82F7-432F1DCBA873}']
//    { Property Methods }
//
//    { methods }
//    function c: Integer; cdecl;
//    function a: Integer; cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJo3 = class(TJavaGenericImport<Jo3Class, Jo3>) end;

//  Jo4Class = interface(JObjectClass)
//  ['{49233951-FAF1-4C1E-AD41-F9F47C744B71}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JString; P2: JString); cdecl; overload;
//    {class} procedure a(P1: JString; P2: JString; P3: JString); cdecl; overload;
//    {class} procedure d(P1: JString; P2: JString); cdecl;
//    {class} procedure e(P1: JString; P2: JString); cdecl;
//    {class} procedure a(P1: JString; P2: JString; P3: JThrowable); cdecl; overload;
//    {class} procedure b(P1: JString; P2: JString); cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o4')]
//  Jo4 = interface(JObject)
//  ['{CEBB7153-B693-41DD-BEAE-281FC1C881DD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJo4 = class(TJavaGenericImport<Jo4Class, Jo4>) end;

//  Jo5Class = interface(JObjectClass)
//  ['{A1C94904-FA3D-4A88-B058-5934220E0585}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Js; P2: JList): Jo5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o5')]
//  Jo5 = interface(JObject)
//  ['{8A41E5B8-363E-4CC6-8E72-2929B9A9221E}']
//    { Property Methods }
//
//    { methods }
//    function a: Js; cdecl;
//    function b: JList; cdecl;
//
//    { Property }
//  end;

//  TJo5 = class(TJavaGenericImport<Jo5Class, Jo5>) end;

//  Jo6Class = interface(JObjectClass)
//  ['{89678845-24F7-4002-915B-830334DD10A3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o6')]
//  Jo6 = interface(IJavaInstance)
//  ['{8FD9459C-9EC9-44E9-A28F-9B5584A23B3F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJo6 = class(TJavaGenericImport<Jo6Class, Jo6>) end;

//  Jo7Class = interface(JObjectClass)
//  ['{E28FA3EB-8A42-4735-B658-7BD4302097D9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o7')]
//  Jo7 = interface(JObject)
//  ['{69B1EF2C-9A12-4C84-AAF9-FB252074D247}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJo7 = class(TJavaGenericImport<Jo7Class, Jo7>) end;

//  Jo8Class = interface(JObjectClass)
//  ['{722D1A04-D73C-42E3-93E6-0C090E165746}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Integer; P3: TJavaObjectArray<Ju6>): Single; cdecl;
//    {class} function b(P1: Integer; P2: Integer; P3: TJavaObjectArray<Ju6>): Single; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o8')]
//  Jo8 = interface(JObject)
//  ['{C0D28F30-90A5-4785-9EB0-1E93E608CBDF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJo8 = class(TJavaGenericImport<Jo8Class, Jo8>) end;

//  JpClass = interface(JObjectClass)
//  ['{27709107-A9A6-4762-824D-B6D465FFF2DA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jo): Jp; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p')]
//  Jp = interface(JObject)
//  ['{BBD6B066-B27D-4F80-A6B1-A4429BFDAE22}']
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

//  Jp0Class = interface(Jg5Class) // or JObjectClass
//  ['{AB770A6A-F483-4624-B360-DCBEB757C466}']
//    { static Property Methods }
//    {class} function _Gete: TJavaArray<Char>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jp0; cdecl;
//    {class} function a(P1: TJavaArray<Char>; P2: Char): Boolean; cdecl; overload;
//
//    { static Property }
//    {class} property e: TJavaArray<Char> read _Gete;
//    {class} property f: TJavaArray<Integer> read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p0')]
//  Jp0 = interface(Jg5) // or JObject
//  ['{7860F44E-8222-468A-8F6E-5F53D11834D7}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Js6; cdecl; overload;
//
//    { Property }
//  end;

//  TJp0 = class(TJavaGenericImport<Jp0Class, Jp0>) end;

//  Jp1_aClass = interface(JObjectClass)
//  ['{9CC55068-F371-48D7-BC90-C226BECD037F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p1$a')]
//  Jp1_a = interface(JObject)
//  ['{F011674A-80BB-4631-8414-25C540E3252C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp1_a = class(TJavaGenericImport<Jp1_aClass, Jp1_a>) end;

//  Jp1_bClass = interface(JEnumClass) // or JObjectClass
//  ['{F677F629-ECF5-4A4A-9D21-973155F3DD76}']
//    { static Property Methods }
//    {class} function _Geta: Jp1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jp1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jp1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jp1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jp1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jp1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jp1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jp1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jp1_b>; cdecl;
//    {class} function valueOf(P1: JString): Jp1_b; cdecl;
//
//    { static Property }
//    {class} property a: Jp1_b read _Geta;
//    {class} property b: Jp1_b read _Getb;
//    {class} property c: Jp1_b read _Getc;
//    {class} property d: Jp1_b read _Getd;
//    {class} property e: Jp1_b read _Gete;
//    {class} property f: Jp1_b read _Getf;
//    {class} property g: Jp1_b read _Getg;
//    {class} property h: Jp1_b read _Geth;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p1$b')]
//  Jp1_b = interface(JEnum) // or JObject
//  ['{BE0EE6A8-DC62-4BA5-80FE-E998B5F7B2AF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp1_b = class(TJavaGenericImport<Jp1_bClass, Jp1_b>) end;

//  Jp1Class = interface(JObjectClass)
//  ['{64ADC6DE-F9BB-4095-B545-0EF19A61954A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p1')]
//  Jp1 = interface(JObject)
//  ['{D6E18B28-54C1-4526-A0A8-80EFEB2916C9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp1 = class(TJavaGenericImport<Jp1Class, Jp1>) end;

//  Jp2Class = interface(Jr7Class) // or JObjectClass
//  ['{D2828FA2-05F8-4A64-8758-0A393F0D214F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jp2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p2')]
//  Jp2 = interface(Jr7) // or JObject
//  ['{3502BB1A-226C-45F7-9F3E-D698FF8AFC99}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJp2 = class(TJavaGenericImport<Jp2Class, Jp2>) end;

//  Jp3Class = interface(JObjectClass)
//  ['{D8AEDAF6-AC55-486B-9D65-21AB5DE90BD0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p3')]
//  Jp3 = interface(JObject)
//  ['{205E9C12-930F-4A99-A2DD-D21B4BB67D92}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJp3 = class(TJavaGenericImport<Jp3Class, Jp3>) end;

//  Jp4Class = interface(JObjectClass)
//  ['{1539F4D6-44CF-4AD5-BB8A-A17B98459657}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p4')]
//  Jp4 = interface(JObject)
//  ['{BB188A41-03C5-44D7-A8CF-05C614236673}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
//    function b: TJavaArray<Byte>; cdecl;
//    function c: Integer; cdecl;
//    function a: Integer; cdecl; overload;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jp4; cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJp4 = class(TJavaGenericImport<Jp4Class, Jp4>) end;

//  Jp5Class = interface(JObjectClass)
//  ['{8DAC0589-6E20-4D8A-8B75-B158046ABF44}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p5')]
//  Jp5 = interface(JObject)
//  ['{C702E39E-3F15-4614-8633-49789239F93E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp5 = class(TJavaGenericImport<Jp5Class, Jp5>) end;

//  Jp6Class = interface(JObjectClass)
//  ['{28C505FB-F1CC-4238-A1E8-38ACB65DA494}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jo3): Jp6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p6')]
//  Jp6 = interface(JObject)
//  ['{5AF6F2E2-8214-4C21-9A01-27BD63881488}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Integer>; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJp6 = class(TJavaGenericImport<Jp6Class, Jp6>) end;

//  Jp7Class = interface(JObjectClass)
//  ['{BBD1B5CB-D212-4783-858A-DBE0E0DBDD73}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p7')]
//  Jp7 = interface(JObject)
//  ['{5BD31A25-D6AF-4AFC-9523-6EC59A2DFCBF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJp7 = class(TJavaGenericImport<Jp7Class, Jp7>) end;

//  JqClass = interface(Ji7Class) // or JObjectClass
//  ['{64ACA978-05A1-49B6-8995-7C33118399CC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q')]
//  Jq = interface(Ji7) // or JObject
//  ['{79728E10-6C99-4C0D-9A04-6934F19E171F}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jr; P2: TJavaArray<Byte>); cdecl;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJq = class(TJavaGenericImport<JqClass, Jq>) end;

//  Jq0Class = interface(Jh5Class) // or JObjectClass
//  ['{45ACB8A4-3888-41B0-AF8F-712836FA5CC2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q0')]
//  Jq0 = interface(Jh5) // or JObject
//  ['{8A04987B-B5F1-4A0A-B89E-121D596F1A72}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl;
//
//    { Property }
//  end;

//  TJq0 = class(TJavaGenericImport<Jq0Class, Jq0>) end;

//  Jq1_aClass = interface(JObjectClass)
//  ['{8548DBE2-1105-4AC5-8171-F5DCC75A968E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q1$a')]
//  Jq1_a = interface(JObject)
//  ['{0370A827-A05C-4039-80A2-EED7C914ED8B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJq1_a = class(TJavaGenericImport<Jq1_aClass, Jq1_a>) end;

//  Jq1Class = interface(JObjectClass)
//  ['{581B226E-AB17-4167-9FB0-1FFE57AEE59F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q1')]
//  Jq1 = interface(JObject)
//  ['{D6BC097B-2CC5-456A-897C-38D5D57C5540}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJq1 = class(TJavaGenericImport<Jq1Class, Jq1>) end;

//  Jq2Class = interface(Jq7Class) // or JObjectClass
//  ['{D6B86D87-1D1B-4E6D-BD68-4137F01A525D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q2')]
//  Jq2 = interface(Jq7) // or JObject
//  ['{6F4879D9-DC20-497C-9743-68BF777AE758}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Jr): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJq2 = class(TJavaGenericImport<Jq2Class, Jq2>) end;

//  Jq3Class = interface(JoClass) // or JObjectClass
//  ['{C05712C3-1581-40C6-878F-C3685249A9E1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jp4): Jq3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q3')]
//  Jq3 = interface(Jo) // or JObject
//  ['{854C1465-0CC1-47B0-A7C9-6D9F20F3BAD6}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr): Jr; cdecl; overload;
//    function a: Js; cdecl; overload;
//    function a(P1: Jp4): Jo; cdecl; overload;
//
//    { Property }
//  end;

//  TJq3 = class(TJavaGenericImport<Jq3Class, Jq3>) end;

//  Jq4Class = interface(Jt6Class) // or JObjectClass
//  ['{E08C857B-ED07-4D49-BD7C-12E628EC790B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q4')]
//  Jq4 = interface(Jt6) // or JObject
//  ['{C567AF5F-A1D1-45F2-9864-6FE6D715EA3D}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJq4 = class(TJavaGenericImport<Jq4Class, Jq4>) end;

//  Jq5_aClass = interface(JObjectClass)
//  ['{27B20176-F306-4451-9646-4235DE1591A9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q5$a')]
//  Jq5_a = interface(JObject)
//  ['{02B3D97F-0AF4-4D93-B54B-341C1573A1DE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJq5_a = class(TJavaGenericImport<Jq5_aClass, Jq5_a>) end;

//  Jq5Class = interface(JObjectClass)
//  ['{F69DD384-544E-424A-BEFE-C6977F5943D3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q5')]
//  Jq5 = interface(JObject)
//  ['{9FC9DACE-1F54-4D1A-BEB7-C3A1B6358F25}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJq5 = class(TJavaGenericImport<Jq5Class, Jq5>) end;

//  Jq6Class = interface(JObjectClass)
//  ['{200B6ACB-C98F-41E7-B266-3E61FAF66A95}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jo3): Jq6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q6')]
//  Jq6 = interface(JObject)
//  ['{3EB3AF84-7C72-4D9F-B800-8241F555DC7B}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Integer>; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJq6 = class(TJavaGenericImport<Jq6Class, Jq6>) end;

//  Jq7Class = interface(Jg5Class) // or JObjectClass
//  ['{F2433BFD-FACB-47C4-B74F-99D3BEBEB61B}']
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

//  [JavaSignature('com/huawei/hms/scankit/p/q7')]
//  Jq7 = interface(Jg5) // or JObject
//  ['{43D7C877-5275-4667-B1F6-EE77220D017C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Js6; cdecl; overload;
//    function a(P1: Integer; P2: Jr; P3: TJavaArray<Integer>; P4: JMap): Js6; cdecl; overload;
//
//    { Property }
//  end;

//  TJq7 = class(TJavaGenericImport<Jq7Class, Jq7>) end;

//  JrClass = interface(JObjectClass)
//  ['{9AC45CF5-182F-4985-9448-EAF150CBCE96}']
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
//  ['{59677AA0-A7DC-473A-AD1F-654F2C7373B4}']
//    { Property Methods }
//
//    { methods }
//    function d: Integer; cdecl; overload;
//    function e: Integer; cdecl;
//    procedure h; cdecl; overload;
//    procedure b; cdecl; overload;
//    procedure f; cdecl;
//    procedure i; cdecl;
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
//    function c: TJavaArray<Integer>; cdecl; overload;
//    procedure g; cdecl; overload;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//    function clone: Jr; cdecl; overload;
//    function clone: JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJr = class(TJavaGenericImport<JrClass, Jr>) end;

//  Jr0Class = interface(Jg5Class) // or JObjectClass
//  ['{3C23BA37-89C7-4CB9-9567-A2D0861FCFD8}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jr0; cdecl;
//
//    { static Property }
//    {class} property a: TJavaArray<TJavaArray<Integer>> read _Geta;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r0')]
//  Jr0 = interface(Jg5) // or JObject
//  ['{A59F6F57-8E85-4865-9EB4-27AE8C6FCE88}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJr0 = class(TJavaGenericImport<Jr0Class, Jr0>) end;

//  Jr1_aClass = interface(JObjectClass)
//  ['{C83C13AB-C01A-4069-8F51-0839A2718D7F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r1$a')]
//  Jr1_a = interface(JObject)
//  ['{74C20133-D8B8-4AF3-90F7-9E5F81F4F6C9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr1_a = class(TJavaGenericImport<Jr1_aClass, Jr1_a>) end;

//  Jr1_bClass = interface(JEnumClass) // or JObjectClass
//  ['{28D27587-9707-4F92-9F83-5BF6D83FBBC6}']
//    { static Property Methods }
//    {class} function _Geta: Jr1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jr1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jr1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jr1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jr1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jr1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jr1_b>; cdecl;
//    {class} function valueOf(P1: JString): Jr1_b; cdecl;
//
//    { static Property }
//    {class} property a: Jr1_b read _Geta;
//    {class} property b: Jr1_b read _Getb;
//    {class} property c: Jr1_b read _Getc;
//    {class} property d: Jr1_b read _Getd;
//    {class} property e: Jr1_b read _Gete;
//    {class} property f: Jr1_b read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r1$b')]
//  Jr1_b = interface(JEnum) // or JObject
//  ['{700A0E17-B28C-4B61-BD80-A39A85C61604}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr1_b = class(TJavaGenericImport<Jr1_bClass, Jr1_b>) end;

//  Jr1Class = interface(JObjectClass)
//  ['{83D2C697-86BB-4F33-A43D-B51E7BF9A903}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r1')]
//  Jr1 = interface(JObject)
//  ['{212B9959-D6AE-4927-99D1-1164259C0F8C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr1 = class(TJavaGenericImport<Jr1Class, Jr1>) end;

//  Jr2Class = interface(Jr7Class) // or JObjectClass
//  ['{7F017EB1-AED9-4428-8E4F-28A5EEB737A0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r2')]
//  Jr2 = interface(Jr7) // or JObject
//  ['{864A96A9-E4B7-429F-8F72-C576EA24B9CC}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJr2 = class(TJavaGenericImport<Jr2Class, Jr2>) end;

//  Jr3Class = interface(JObjectClass)
//  ['{A003A143-2717-4A9E-9274-38D84A59ED9C}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geto: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getp: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getq: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getr: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gets: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gett: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getu: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getv: TJavaArray<Boolean>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getw: JStack;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getx: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gety: TJavaArray<Single>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getz: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetA: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure a; cdecl; overload;
//    {class} procedure a(P1: Integer); cdecl; overload;
//    {class} procedure a(P1: Jx6); cdecl; overload;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: Boolean read _Getb;
//    {class} property c: Boolean read _Getc;
//    {class} property d: Boolean read _Getd;
//    {class} property e: Boolean read _Gete;
//    {class} property f: Boolean read _Getf;
//    {class} property g: Boolean read _Getg;
//    {class} property h: Boolean read _Geth;
//    {class} property i: Single read _Geti;
//    {class} property j: Integer read _Getj;
//    {class} property k: Integer read _Getk;
//    {class} property l: Boolean read _Getl;
//    {class} property m: Boolean read _Getm;
//    {class} property n: Boolean read _Getn;
//    {class} property o: Boolean read _Geto;
//    {class} property p: Boolean read _Getp;
//    {class} property q: Boolean read _Getq;
//    {class} property r: Boolean read _Getr;
//    {class} property s: Boolean read _Gets;
//    {class} property t: Boolean read _Gett;
//    {class} property u: Boolean read _Getu;
//    {class} property v: TJavaArray<Boolean> read _Getv;
//    {class} property w: JStack read _Getw;
//    {class} property x: Boolean read _Getx;
//    {class} property y: TJavaArray<Single> read _Gety;
//    {class} property z: Integer read _Getz;
//    {class} property A: Boolean read _GetA;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r3')]
//  Jr3 = interface(JObject)
//  ['{7BF4C4D6-EAE7-4E5E-A569-CCEC32F4C881}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr3 = class(TJavaGenericImport<Jr3Class, Jr3>) end;

//  Jr4Class = interface(JObjectClass)
//  ['{36654359-9C0E-48A1-8C46-C647DB3201CA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r4')]
//  Jr4 = interface(JObject)
//  ['{DC5809C4-37B7-4838-99D1-3EE83E5ADB16}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr4 = class(TJavaGenericImport<Jr4Class, Jr4>) end;

//  Jr5Class = interface(JObjectClass)
//  ['{171AAEF9-C9D3-4C85-BD96-2B756E540AFC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r5')]
//  Jr5 = interface(JObject)
//  ['{D5C30E98-E7B6-4657-93AB-9A7B2ACD4454}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJr5 = class(TJavaGenericImport<Jr5Class, Jr5>) end;

//  Jr6Class = interface(JObjectClass)
//  ['{15FF2A2A-2EA0-44E1-9598-84A46DB5D641}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr6; cdecl;
//    {class} function a: Jr6; cdecl; overload;
//    {class} function b: JHmsScan; cdecl; overload;
//    {class} function c: Js6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r6')]
//  Jr6 = interface(JObject)
//  ['{A0E9CBED-3B82-4717-BCA7-F5573B32C05E}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: JBitmap; P2: Integer; P3: Boolean; P4: Jw3): TJavaObjectArray<JHmsScan>; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Boolean; P6: Boolean; P7: Jw3): JHmsScanResult; cdecl; overload;
//    function a(P1: JBitmap; P2: Integer; P3: Boolean; P4: Jw3): TJavaObjectArray<JHmsScan>; cdecl; overload;
//    function a(P1: JByteBuffer; P2: Integer; P3: Integer; P4: Integer; P5: Boolean; P6: Jw3): TJavaObjectArray<JHmsScan>; cdecl; overload;
//
//    { Property }
//  end;

//  TJr6 = class(TJavaGenericImport<Jr6Class, Jr6>) end;

//  Jr7Class = interface(Jh5Class) // or JObjectClass
//  ['{D3618FBF-7C96-4EE6-9AD2-7D1D859598E4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jr7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r7')]
//  Jr7 = interface(Jh5) // or JObject
//  ['{4CBBECE4-338D-4292-B4D1-BD529A2A216C}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl;
//
//    { Property }
//  end;

//  TJr7 = class(TJavaGenericImport<Jr7Class, Jr7>) end;

//  JsClass = interface(JObjectClass)
//  ['{B277BB7B-A655-40C4-A994-110815449009}']
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
//  ['{3B2A971D-9194-4F4F-9A9D-05CE885EC1EF}']
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
//    procedure e; cdecl;
//    function d: Integer; cdecl;
//    function b: Integer; cdecl; overload;
//    function equals(P1: JObject): Boolean; cdecl;
//    function hashCode: Integer; cdecl;
//    function toString: JString; cdecl;
//    function a(P1: JString; P2: JString): JString; cdecl; overload;
//    function clone: Js; cdecl; overload;
//    function c: Js; cdecl; overload;
//    function clone: JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJs = class(TJavaGenericImport<JsClass, Js>) end;

//  Js0_aClass = interface(JEnumClass) // or JObjectClass
//  ['{1DE4E471-0697-42E3-A57F-7274504B07B5}']
//    { static Property Methods }
//    {class} function _Geta: Js0_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Js0_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Js0_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Js0_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Js0_a>; cdecl;
//    {class} function valueOf(P1: JString): Js0_a; cdecl;
//
//    { static Property }
//    {class} property a: Js0_a read _Geta;
//    {class} property b: Js0_a read _Getb;
//    {class} property c: Js0_a read _Getc;
//    {class} property d: Js0_a read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s0$a')]
//  Js0_a = interface(JEnum) // or JObject
//  ['{2568B2C9-B887-47CB-8EFD-9EAB18DA635A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJs0_a = class(TJavaGenericImport<Js0_aClass, Js0_a>) end;

//  Js0Class = interface(Jh5Class) // or JObjectClass
//  ['{669A404F-A8D5-4BF4-B09A-4575FC8EED06}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Js0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s0')]
//  Js0 = interface(Jh5) // or JObject
//  ['{4D911027-A392-4F3F-97D8-E2015A695C70}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJs0 = class(TJavaGenericImport<Js0Class, Js0>) end;

//  Js1_aClass = interface(JObjectClass)
//  ['{5A89964C-1E2E-4B80-88CC-B5C82C5A5366}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s1$a')]
//  Js1_a = interface(JObject)
//  ['{491E27F0-3142-44CA-A207-701DDD1F83AB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJs1_a = class(TJavaGenericImport<Js1_aClass, Js1_a>) end;

//  Js1Class = interface(JObjectClass)
//  ['{3F50FCC1-482F-4DA6-9ED8-B598BEF5CBDA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s1')]
//  Js1 = interface(JObject)
//  ['{75BE2328-DF32-4F48-9CD7-39CC5EB09E53}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJs1 = class(TJavaGenericImport<Js1Class, Js1>) end;

//  Js2Class = interface(JObjectClass)
//  ['{612DD8AD-C89F-4666-92D5-D4E1057387F3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s2')]
//  Js2 = interface(JObject)
//  ['{ACBE0D05-D84C-411F-98EA-48650A18F942}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload;
//    procedure a(P1: Jy2); cdecl; overload;
//
//    { Property }
//  end;

//  TJs2 = class(TJavaGenericImport<Js2Class, Js2>) end;

//  Js3Class = interface(JObjectClass)
//  ['{C3D22AE4-EEF2-4DCC-AD9C-21C972C63DE8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Js3; cdecl;
//    {class} function a: Js3; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s3')]
//  Js3 = interface(JObject)
//  ['{3AC7637E-D316-4749-97F9-8C52419CA0CF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Js; P2: Integer; P3: Integer; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single; P17: Single; P18: Single; P19: Single): Js; cdecl; overload;
//    function a(P1: Js; P2: Integer; P3: Integer; P4: Jd6; P5: Boolean): Js; cdecl; overload;
//
//    { Property }
//  end;

//  TJs3 = class(TJavaGenericImport<Js3Class, Js3>) end;

//  Js4Class = interface(JObjectClass)
//  ['{6B7E08E9-13C7-498B-A71A-499BBE7249E9}']
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

//  [JavaSignature('com/huawei/hms/scankit/p/s4')]
//  Js4 = interface(JObject)
//  ['{21560FF6-C3F2-4940-8C86-E8F58F372EC7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJs4 = class(TJavaGenericImport<Js4Class, Js4>) end;

//  Js5Class = interface(JObjectClass)
//  ['{54AF9AD6-C1F8-434B-8194-D376C6556027}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Js5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s5')]
//  Js5 = interface(JObject)
//  ['{365FA025-6C57-44D4-8FB1-DDAADAC61B8B}']
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

//  TJs5 = class(TJavaGenericImport<Js5Class, Js5>) end;

//  Js6_aClass = interface(JObjectClass)
//  ['{0D9C1D19-F25D-4E0B-B9B2-0ACA1A6E0B94}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s6$a')]
//  Js6_a = interface(JObject)
//  ['{5FB9D137-E121-4CFD-A373-1C7F465003AF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JParcel): Js6; cdecl; overload;
//    function a(P1: Integer): TJavaObjectArray<Js6>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl;
//    function createFromParcel(P1: JParcel): JObject; cdecl;
//
//    { Property }
//  end;

//  TJs6_a = class(TJavaGenericImport<Js6_aClass, Js6_a>) end;

//  Js6Class = interface(JObjectClass)
//  ['{931D46D4-12E7-44B0-803C-E12C67240BB2}']
//    { static Property Methods }
//    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Single): Js6; cdecl; overload;
//    {class} function init(P1: Single; P2: Boolean): Js6; cdecl; overload;
//    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: TJavaObjectArray<Ju6>; P4: JBarcodeFormat): Js6; cdecl; overload;
//    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: TJavaObjectArray<Ju6>; P4: JBarcodeFormat; P5: Int64): Js6; cdecl; overload;
//    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaObjectArray<Ju6>; P5: JBarcodeFormat; P6: Int64): Js6; cdecl; overload;
//
//    { static Property }
//    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s6')]
//  Js6 = interface(JObject)
//  ['{B54D1303-A3B2-4700-8F9C-98D4C4FCDE69}']
//    { Property Methods }
//
//    { methods }
//    function p: Boolean; cdecl;
//    procedure c(P1: Boolean); cdecl; overload;
//    function l: Single; cdecl;
//    function o: Boolean; cdecl;
//    procedure a(P1: Single); cdecl; overload;
//    procedure b(P1: Single); cdecl; overload;
//    function f: Integer; cdecl;
//    procedure a(P1: Jj2); cdecl; overload;
//    procedure b(P1: Jj2); cdecl; overload;
//    function n: Boolean; cdecl;
//    procedure b(P1: Boolean); cdecl; overload;
//    function h: Integer; cdecl;
//    procedure a(P1: Integer); cdecl; overload;
//    function d: JList; cdecl;
//    function g: JList; cdecl;
//    function k: JString; cdecl;
//    function i: TJavaArray<Byte>; cdecl;
//    function j: TJavaObjectArray<Ju6>; cdecl;
//    function c: JBarcodeFormat; cdecl; overload;
//    procedure a(P1: TJavaObjectArray<Ju6>); cdecl; overload;
//    function e: Int64; cdecl;
//    procedure b(P1: Int64); cdecl; overload;
//    function b: Int64; cdecl; overload;
//    procedure a(P1: Int64); cdecl; overload;
//    function m: Boolean; cdecl;
//    procedure a(P1: Boolean); cdecl; overload;
//    function toString: JString; cdecl;
//    procedure a; cdecl; overload;
//    procedure b(P1: TJavaObjectArray<Ju6>); cdecl; overload;
//    function describeContents: Integer; cdecl;
//    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
//
//    { Property }
//  end;

//  TJs6 = class(TJavaGenericImport<Js6Class, Js6>) end;

//  Js7Class = interface(Jq7Class) // or JObjectClass
//  ['{F370686E-A20F-4F0D-8576-A37E0CF477F0}']
//    { static Property Methods }
//    {class} function _Getj: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Js7; cdecl;
//    {class} function b(P1: JString): JString; cdecl;
//
//    { static Property }
//    {class} property j: TJavaArray<TJavaArray<Integer>> read _Getj;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s7')]
//  Js7 = interface(Jq7) // or JObject
//  ['{5A8C5192-B570-4E3E-967B-94E823DCC5AE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Jr): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJs7 = class(TJavaGenericImport<Js7Class, Js7>) end;

//  JtClass = interface(JObjectClass)
//  ['{CE0C5040-E77B-4355-AC23-D8BD56ED1B0E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t')]
//  Jt = interface(JObject)
//  ['{0D63D402-59F3-42AF-996F-8747ACBCFAC1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt = class(TJavaGenericImport<JtClass, Jt>) end;

//  Jt0Class = interface(Jg5Class) // or JObjectClass
//  ['{E6553E3C-1691-4D31-B6A9-74F1D9068385}']
//    { static Property Methods }
//    {class} function _Gete: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jt0; cdecl; overload;
//    {class} function init(P1: Boolean): Jt0; cdecl; overload;
//    {class} function init(P1: Boolean; P2: Boolean): Jt0; cdecl; overload;
//
//    { static Property }
//    {class} property e: TJavaArray<Integer> read _Gete;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t0')]
//  Jt0 = interface(Jg5) // or JObject
//  ['{2DC59129-CADB-4FF4-AF6F-DC548E175C4A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJt0 = class(TJavaGenericImport<Jt0Class, Jt0>) end;

//  Jt1_aClass = interface(JObjectClass)
//  ['{EB32B54C-7A9F-4E26-9BF6-84A7848A9578}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t1$a')]
//  Jt1_a = interface(JObject)
//  ['{A9EEACF0-FA11-4712-8196-792362D87587}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt1_a = class(TJavaGenericImport<Jt1_aClass, Jt1_a>) end;

//  Jt1_bClass = interface(JEnumClass) // or JObjectClass
//  ['{65CF74BD-9A3A-43BE-ABA5-D0CDD70389A2}']
//    { static Property Methods }
//    {class} function _Geta: Jt1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jt1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jt1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jt1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jt1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jt1_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jt1_b>; cdecl;
//    {class} function valueOf(P1: JString): Jt1_b; cdecl;
//
//    { static Property }
//    {class} property a: Jt1_b read _Geta;
//    {class} property b: Jt1_b read _Getb;
//    {class} property c: Jt1_b read _Getc;
//    {class} property d: Jt1_b read _Getd;
//    {class} property e: Jt1_b read _Gete;
//    {class} property f: Jt1_b read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t1$b')]
//  Jt1_b = interface(JEnum) // or JObject
//  ['{419CED69-5971-4ACB-828F-3438589874E2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt1_b = class(TJavaGenericImport<Jt1_bClass, Jt1_b>) end;

//  Jt1Class = interface(JObjectClass)
//  ['{1CD2701C-20DA-4BD3-8348-DA8BD64A5A1C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t1')]
//  Jt1 = interface(JObject)
//  ['{2C4B2059-DE50-4613-BC3A-B97332755C2D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jg; P2: JMap): Jx1; cdecl;
//
//    { Property }
//  end;

//  TJt1 = class(TJavaGenericImport<Jt1Class, Jt1>) end;

//  Jt2Class = interface(Jt6Class) // or JObjectClass
//  ['{15CA5D84-F98D-42C6-86BB-39E23A818DFA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt2; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t2')]
//  Jt2 = interface(Jt6) // or JObject
//  ['{3AB55E6B-BE64-4942-A30D-30292217C06F}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJt2 = class(TJavaGenericImport<Jt2Class, Jt2>) end;

//  Jt3Class = interface(Jt6Class) // or JObjectClass
//  ['{7DD502A8-C556-4264-BD30-14D48D253647}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t3')]
//  Jt3 = interface(Jt6) // or JObject
//  ['{F5655584-154C-4E6A-8F21-6CEF7CE10E41}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJt3 = class(TJavaGenericImport<Jt3Class, Jt3>) end;

//  Jt4Class = interface(JObjectClass)
//  ['{74371CA7-B7F4-4714-9872-14D5D8D21314}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t4')]
//  Jt4 = interface(JObject)
//  ['{F217ABD7-5758-4367-A240-EF581354CFE9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt4 = class(TJavaGenericImport<Jt4Class, Jt4>) end;

//  Jt5Class = interface(JObjectClass)
//  ['{0B345B85-96E9-4C97-8669-43B93DACD01A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Js; P2: Ju6; P3: Ju6; P4: Ju6; P5: Ju6; P6: Integer; P7: Integer; P8: JMap): Jx1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t5')]
//  Jt5 = interface(JObject)
//  ['{C4DD6396-2EB9-480B-981B-A31D2DE15F1A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJt5 = class(TJavaGenericImport<Jt5Class, Jt5>) end;

//  Jt6Class = interface(JObjectClass)
//  ['{F52D32E7-4900-4528-BB58-6BE5118673BA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt6; cdecl;
//    {class} function a(P1: JBarcodeFormat): Integer; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<Ju6>): TJavaObjectArray<JPoint>; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t6')]
//  Jt6 = interface(JObject)
//  ['{7B09666B-7AEA-4877-8F72-10236382C6FE}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJt6 = class(TJavaGenericImport<Jt6Class, Jt6>) end;

//  Jt7Class = interface(Jr7Class) // or JObjectClass
//  ['{CFA39655-84F5-4E10-8AB4-22AD975D3BCE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jt7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t7')]
//  Jt7 = interface(Jr7) // or JObject
//  ['{9CA63E72-E65A-427F-943F-F4DA4C42E764}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJt7 = class(TJavaGenericImport<Jt7Class, Jt7>) end;

//  JuClass = interface(JObjectClass)
//  ['{E8C584A5-C087-4914-B279-B08100DB9776}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u')]
//  Ju = interface(JObject)
//  ['{A825400B-A857-4EE4-84B4-22A48CB83167}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu = class(TJavaGenericImport<JuClass, Ju>) end;

//  Ju0Class = interface(Jh5Class) // or JObjectClass
//  ['{B938F427-C748-45A7-ADB6-05BC4C64B866}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ju0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u0')]
//  Ju0 = interface(Jh5) // or JObject
//  ['{58E5DFF9-3CC1-4E04-A943-2BDE675A87E1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJu0 = class(TJavaGenericImport<Ju0Class, Ju0>) end;

//  Ju1Class = interface(JObjectClass)
//  ['{DD4CF8CB-3A59-4E6F-BF81-2652E64BC6E1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ju1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u1')]
//  Ju1 = interface(JObject)
//  ['{B093EB70-CBDF-40AD-AC17-EBFA08FC1F6C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Js; P2: JMap): Jx1; cdecl; overload;
//    function a: Jz7; cdecl; overload;
//
//    { Property }
//  end;

//  TJu1 = class(TJavaGenericImport<Ju1Class, Ju1>) end;

//  Ju2Class = interface(JEnumClass) // or JObjectClass
//  ['{0EE93EED-0844-4EC6-AF41-C619446960D2}']
//    { static Property Methods }
//    {class} function _Geta: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Ju2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ju2>; cdecl;
//    {class} function valueOf(P1: JString): Ju2; cdecl;
//
//    { static Property }
//    {class} property a: Ju2 read _Geta;
//    {class} property b: Ju2 read _Getb;
//    {class} property c: Ju2 read _Getc;
//    {class} property d: Ju2 read _Getd;
//    {class} property e: Ju2 read _Gete;
//    {class} property f: Ju2 read _Getf;
//    {class} property g: Ju2 read _Getg;
//    {class} property h: Ju2 read _Geth;
//    {class} property i: Ju2 read _Geti;
//    {class} property j: Ju2 read _Getj;
//    {class} property k: Ju2 read _Getk;
//    {class} property l: Ju2 read _Getl;
//    {class} property m: Ju2 read _Getm;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u2')]
//  Ju2 = interface(JEnum) // or JObject
//  ['{A94BD11B-E8BF-4455-8663-5CBBF1D19B61}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu2 = class(TJavaGenericImport<Ju2Class, Ju2>) end;

//  Ju3_aClass = interface(JSparseArrayClass) // or JObjectClass
//  ['{F0FFAAD5-D02E-4F42-80B5-B1AC560F4A91}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u3$a')]
//  Ju3_a = interface(JSparseArray) // or JObject
//  ['{AD3A2ADF-D1E9-452F-8D96-F918F2D5F2DD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu3_a = class(TJavaGenericImport<Ju3_aClass, Ju3_a>) end;

//  Ju3_bClass = interface(JSparseArrayClass) // or JObjectClass
//  ['{10B87A7F-A14C-43DA-81BE-312BC00D6476}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u3$b')]
//  Ju3_b = interface(JSparseArray) // or JObject
//  ['{D4C0B9D7-90ED-48D9-BA9E-F74E997E64DA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu3_b = class(TJavaGenericImport<Ju3_bClass, Ju3_b>) end;

//  Ju3Class = interface(JObjectClass)
//  ['{D33462E4-5F2E-4347-8EC9-C426D632A5D1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u3')]
//  Ju3 = interface(JObject)
//  ['{8BD7A051-1CA7-4125-B291-98043ECC97C3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu3 = class(TJavaGenericImport<Ju3Class, Ju3>) end;

//  Ju4Class = interface(JEnumClass) // or JObjectClass
//  ['{7A62AAAD-2CE5-473E-80D8-EA763D6EFAFC}']
//    { static Property Methods }
//    {class} function _Getc: Ju4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Ju4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Ju4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Ju4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Ju4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Ju4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Ju4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Ju4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Ju4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Ju4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Ju4>; cdecl;
//    {class} function valueOf(P1: JString): Ju4; cdecl;
//    {class} function a(P1: Integer): Ju4; cdecl; overload;
//
//    { static Property }
//    {class} property c: Ju4 read _Getc;
//    {class} property d: Ju4 read _Getd;
//    {class} property e: Ju4 read _Gete;
//    {class} property f: Ju4 read _Getf;
//    {class} property g: Ju4 read _Getg;
//    {class} property h: Ju4 read _Geth;
//    {class} property i: Ju4 read _Geti;
//    {class} property j: Ju4 read _Getj;
//    {class} property k: Ju4 read _Getk;
//    {class} property l: Ju4 read _Getl;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u4')]
//  Ju4 = interface(JEnum) // or JObject
//  ['{6888D0C8-0715-4521-BC43-B8E0AD4FC522}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jb8): Integer; cdecl; overload;
//    function b: Integer; cdecl;
//
//    { Property }
//  end;

//  TJu4 = class(TJavaGenericImport<Ju4Class, Ju4>) end;

//  Ju5Class = interface(JObjectClass)
//  ['{A63FFE13-F680-435A-9EF4-C48B1C647037}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ju5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u5')]
//  Ju5 = interface(JObject)
//  ['{AB790D2E-688F-4A33-A743-D062E294525F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl;
//
//    { Property }
//  end;

//  TJu5 = class(TJavaGenericImport<Ju5Class, Ju5>) end;

//  Ju6_aClass = interface(JObjectClass)
//  ['{D080FBAA-A5A5-438A-B4BD-489462614DD8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u6$a')]
//  Ju6_a = interface(JObject)
//  ['{78829D66-897B-4305-93B6-EF7F16C8E27B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JParcel): Ju6; cdecl; overload;
//    function a(P1: Integer): TJavaObjectArray<Ju6>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl;
//    function createFromParcel(P1: JParcel): JObject; cdecl;
//
//    { Property }
//  end;

//  TJu6_a = class(TJavaGenericImport<Ju6_aClass, Ju6_a>) end;

//  Ju6Class = interface(JObjectClass)
//  ['{8BB9ADBB-3140-4B93-88D3-919C8D697FDF}']
//    { static Property Methods }
//    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Integer): Ju6; cdecl; overload;
//    {class} function init(P1: Single; P2: Single): Ju6; cdecl; overload;
//    {class} function init(P1: Single; P2: Single; P3: Boolean): Ju6; cdecl; overload;
//    {class} procedure a(P1: TJavaObjectArray<Ju6>); cdecl; overload;
//    {class} function a(P1: Ju6; P2: Ju6): Single; cdecl; overload;
//
//    { static Property }
//    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u6')]
//  Ju6 = interface(JObject)
//  ['{FF0AE595-FCD4-4A63-BEEC-162D2D92FFAC}']
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

//  TJu6 = class(TJavaGenericImport<Ju6Class, Ju6>) end;

//  Ju7Class = interface(Jt6Class) // or JObjectClass
//  ['{835FF4F1-8358-4897-BCBB-450016FBFDC4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ju7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u7')]
//  Ju7 = interface(Jt6) // or JObject
//  ['{CC2B8337-7775-42A5-AFBE-D491E2C250D5}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJu7 = class(TJavaGenericImport<Ju7Class, Ju7>) end;

//  JvClass = interface(JObjectClass)
//  ['{9F8E6760-CF6D-4326-9021-A4E60E70BD9A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v')]
//  Jv = interface(JObject)
//  ['{8A2B8E52-5FCA-47A8-A707-7587D667DBB5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJv = class(TJavaGenericImport<JvClass, Jv>) end;

//  Jv0Class = interface(Jg5Class) // or JObjectClass
//  ['{8DFC7A2A-3B9F-4B3B-B13F-D94F923738BD}']
//    { static Property Methods }
//    {class} function _Getd: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jv0; cdecl;
//
//    { static Property }
//    {class} property d: TJavaArray<Integer> read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v0')]
//  Jv0 = interface(Jg5) // or JObject
//  ['{2D9E6E6E-85F2-48D8-A3CE-6C7B253EC937}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJv0 = class(TJavaGenericImport<Jv0Class, Jv0>) end;

//  Jv1Class = interface(JObjectClass)
//  ['{BABD5E58-76F4-429B-8A5E-EF7C85A816DA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jv1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v1')]
//  Jv1 = interface(JObject)
//  ['{AD495C9D-2D6C-46B5-A682-ED3D54B04A78}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Js; P2: JMap): Jx1; cdecl;
//
//    { Property }
//  end;

//  TJv1 = class(TJavaGenericImport<Jv1Class, Jv1>) end;

//  Jv2Class = interface(JObjectClass)
//  ['{239557D4-307E-4B12-BBB6-5E0C8D435A43}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v2')]
//  Jv2 = interface(IJavaInstance)
//  ['{531C1310-7BCA-4BED-BC04-D6B1A4E3D315}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jy2); cdecl;
//
//    { Property }
//  end;

//  TJv2 = class(TJavaGenericImport<Jv2Class, Jv2>) end;

//  Jv3_aClass = interface(JSimpleDateFormatClass) // or JObjectClass
//  ['{C799E824-1C75-4B4F-A34A-D4CDA6153808}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v3$a')]
//  Jv3_a = interface(JSimpleDateFormat) // or JObject
//  ['{B7D0F74A-9DC4-413D-9A06-3C0D5E208618}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJv3_a = class(TJavaGenericImport<Jv3_aClass, Jv3_a>) end;

//  Jv3_bClass = interface(JLinkedHashMapClass) // or JObjectClass
//  ['{6DCFFDBB-7B29-41E8-99C3-AE30BD47C532}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v3$b')]
//  Jv3_b = interface(JLinkedHashMap) // or JObject
//  ['{FC1C06D9-7791-4970-8AA9-A0A4987EFF2A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJv3_b = class(TJavaGenericImport<Jv3_bClass, Jv3_b>) end;

//  Jv3Class = interface(Ju3Class) // or JObjectClass
//  ['{F30202C8-5B7A-4BAC-9248-D35C8003C6F3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBundle; P2: JString): Jv3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v3')]
//  Jv3 = interface(Ju3) // or JObject
//  ['{1BDA7A34-A3A1-43EE-814F-FBB1DD78954F}']
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

//  TJv3 = class(TJavaGenericImport<Jv3Class, Jv3>) end;

//  Jv4Class = interface(JEnumClass) // or JObjectClass
//  ['{963904DE-56AD-432C-AD9F-62924B908F4F}']
//    { static Property Methods }
//    {class} function _Getc: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geth: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Geti: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getj: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getk: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getl: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getm: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getn: Jv4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jv4>; cdecl;
//    {class} function valueOf(P1: JString): Jv4; cdecl;
//    {class} function a(P1: Integer): Jv4; cdecl; overload;
//
//    { static Property }
//    {class} property c: Jv4 read _Getc;
//    {class} property d: Jv4 read _Getd;
//    {class} property e: Jv4 read _Gete;
//    {class} property f: Jv4 read _Getf;
//    {class} property g: Jv4 read _Getg;
//    {class} property h: Jv4 read _Geth;
//    {class} property i: Jv4 read _Geti;
//    {class} property j: Jv4 read _Getj;
//    {class} property k: Jv4 read _Getk;
//    {class} property l: Jv4 read _Getl;
//    {class} property m: Jv4 read _Getm;
//    {class} property n: Jv4 read _Getn;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v4')]
//  Jv4 = interface(JEnum) // or JObject
//  ['{024A38AA-0FA2-4A5D-9ABE-2187CE73AB27}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Ja8): Integer; cdecl; overload;
//
//    { Property }
//  end;

//  TJv4 = class(TJavaGenericImport<Jv4Class, Jv4>) end;

//  Jv5Class = interface(JObjectClass)
//  ['{35385397-20B1-485B-BF46-80AD5DBCC22A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Js6): JHmsScan; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v5')]
//  Jv5 = interface(JObject)
//  ['{788FE096-027D-4FBA-9A84-CB9845967344}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJv5 = class(TJavaGenericImport<Jv5Class, Jv5>) end;

//  Jv6Class = interface(JObjectClass)
//  ['{255875E4-E1A7-48AE-873E-246A0EA55E99}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v6')]
//  Jv6 = interface(IJavaInstance)
//  ['{A5DD8068-EBF7-4BB1-B2DE-4EE4F3E4970D}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Ju6); cdecl;
//
//    { Property }
//  end;

//  TJv6 = class(TJavaGenericImport<Jv6Class, Jv6>) end;

//  Jv7Class = interface(JObjectClass)
//  ['{85182315-DE33-48E1-B392-C4B99D70A994}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JList): JList; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<Ju6>; P2: TJavaObjectArray<Ju6>): Single; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v7')]
//  Jv7 = interface(JObject)
//  ['{BDB71FDC-7749-47D3-887E-D56BFB211E59}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJv7 = class(TJavaGenericImport<Jv7Class, Jv7>) end;

//  JwClass = interface(JObjectClass)
//  ['{B5D3C08A-E649-494A-9B6A-516F297EEA6D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>): Jw; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w')]
//  Jw = interface(JObject)
//  ['{026FC8A1-472A-44FB-ABC0-74BEF91F4EC9}']
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

//  TJw = class(TJavaGenericImport<JwClass, Jw>) end;

//  Jw0Class = interface(Jh5Class) // or JObjectClass
//  ['{E4BA6A52-67C9-4BDD-86FE-029DCA754057}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw0; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w0')]
//  Jw0 = interface(Jh5) // or JObject
//  ['{1670FBC6-8CA7-494F-AB73-74C77FA16F92}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): Js; cdecl; overload;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload;
//
//    { Property }
//  end;

//  TJw0 = class(TJavaGenericImport<Jw0Class, Jw0>) end;

//  Jw1Class = interface(JObjectClass)
//  ['{ABFF8CEC-2FAC-4791-93B8-B9E1DD4ABCD8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w1')]
//  Jw1 = interface(JObject)
//  ['{FCAC7CEA-711D-47F2-930A-355BE03558BD}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Js; P2: JMap): Jx1; cdecl;
//
//    { Property }
//  end;

//  TJw1 = class(TJavaGenericImport<Jw1Class, Jw1>) end;

//  Jw2_aClass = interface(JObjectClass)
//  ['{19479E92-AD56-435D-9D49-DBABBC312C15}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w2$a')]
//  Jw2_a = interface(JObject)
//  ['{FF7D5E34-F1CA-47CB-A5FA-0E5DF23FC367}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw2_a = class(TJavaGenericImport<Jw2_aClass, Jw2_a>) end;

//  Jw2Class = interface(JObjectClass)
//  ['{15551D91-7EE4-40A6-9FC3-58ECAF1D2C81}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jb3; P3: JMap): Jh6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w2')]
//  Jw2 = interface(JObject)
//  ['{1CFAF419-EE61-4AC9-8D17-41E321FA72A9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw2 = class(TJavaGenericImport<Jw2Class, Jw2>) end;

//  Jw3_aClass = interface(JSimpleDateFormatClass) // or JObjectClass
//  ['{01933908-F04A-4EC3-8B90-6AD77ED026C2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3$a')]
//  Jw3_a = interface(JSimpleDateFormat) // or JObject
//  ['{C2F847FE-1271-4DB4-BBAE-A70B76BCA80C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw3_a = class(TJavaGenericImport<Jw3_aClass, Jw3_a>) end;

//  Jw3_bClass = interface(JSimpleDateFormatClass) // or JObjectClass
//  ['{98ABAB00-847C-4826-B5A9-62E745864610}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3$b')]
//  Jw3_b = interface(JSimpleDateFormat) // or JObject
//  ['{CEA3F73A-9B08-4BE1-9EE7-0CE809F86F0C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw3_b = class(TJavaGenericImport<Jw3_bClass, Jw3_b>) end;

//  Jw3_cClass = interface(JObjectClass)
//  ['{5F9FA1A2-3963-4605-B3E1-45B546E9A714}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3$c')]
//  Jw3_c = interface(JObject)
//  ['{03D2C3AC-EF91-4495-9ABE-1F2F1F5ED5E2}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer): Jw3_c; cdecl;
//
//    { Property }
//  end;

//  TJw3_c = class(TJavaGenericImport<Jw3_cClass, Jw3_c>) end;

//  Jw3_d_aClass = interface(JTimerTaskClass) // or JObjectClass
//  ['{46E20E60-C947-4389-8054-C1C15F230FD0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3$d$a')]
//  Jw3_d_a = interface(JTimerTask) // or JObject
//  ['{0F0C4983-AF8D-49BF-8628-FF9BA0A547E7}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJw3_d_a = class(TJavaGenericImport<Jw3_d_aClass, Jw3_d_a>) end;

//  Jw3_d_bClass = interface(JObjectClass)
//  ['{65C94592-F6FB-4FD8-B52E-5CF45EACF578}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3$d$b')]
//  Jw3_d_b = interface(JObject)
//  ['{B5B8F67A-436F-4C0F-B044-1CE3B1914345}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw3_d_b = class(TJavaGenericImport<Jw3_d_bClass, Jw3_d_b>) end;

//  Jw3_d_c_aClass = interface(JSparseArrayClass) // or JObjectClass
//  ['{4EA9D24D-EC89-40BB-9AFC-18C1DDB3591E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3$d$c$a')]
//  Jw3_d_c_a = interface(JSparseArray) // or JObject
//  ['{000D7B89-AA01-4B08-AC4E-4D0E97126759}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw3_d_c_a = class(TJavaGenericImport<Jw3_d_c_aClass, Jw3_d_c_a>) end;

//  Jw3_d_c_bClass = interface(JAtomicIntegerClass) // or JObjectClass
//  ['{CD7405D7-DD56-4AA3-84BE-A8050B72E9E9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3$d$c$b')]
//  Jw3_d_c_b = interface(JAtomicInteger) // or JObject
//  ['{A80E26EF-51C2-4B11-8DC7-8A4F0C3DA57B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw3_d_c_b = class(TJavaGenericImport<Jw3_d_c_bClass, Jw3_d_c_b>) end;

//  Jw3_d_cClass = interface(JObjectClass)
//  ['{8EC3851C-0BD7-47E7-82BE-6A1FE67B119C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3$d$c')]
//  Jw3_d_c = interface(JObject)
//  ['{C01A47EA-642B-47BC-A0A3-1D314D8C2941}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw3_d_c = class(TJavaGenericImport<Jw3_d_cClass, Jw3_d_c>) end;

//  Jw3_dClass = interface(JObjectClass)
//  ['{EBDC4582-EB9C-4291-B8AA-BDBC5EB3CAD0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jw3): Jw3_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3$d')]
//  Jw3_d = interface(JObject)
//  ['{1612D380-3617-4029-ADB8-E40174EE5953}']
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

//  TJw3_d = class(TJavaGenericImport<Jw3_dClass, Jw3_d>) end;

//  Jw3Class = interface(Ju3Class) // or JObjectClass
//  ['{07C7D208-92E2-44AC-BAA7-5B9F9E9E382C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBundle; P2: JString): Jw3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w3')]
//  Jw3 = interface(Ju3) // or JObject
//  ['{BD56F759-6C26-464E-A25C-AAD88473E392}']
//    { Property Methods }
//    function _Getl: Jw3_d;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Setl(al: Jw3_d);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload;
//    function a(P1: Boolean; P2: Integer): Jw3_c; cdecl; overload;
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: Jw3_c); cdecl; overload;
//
//    { Property }
//    property l: Jw3_d read _Getl write _Setl;
//  end;

//  TJw3 = class(TJavaGenericImport<Jw3Class, Jw3>) end;

//  Jw4Class = interface(JObjectClass)
//  ['{5210DF67-44F8-448C-92B5-537185D781AF}']
//    { static Property Methods }
//    {class} function _Getf: Jw4;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property f: Jw4 read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w4')]
//  Jw4 = interface(JObject)
//  ['{EE2A9E82-D75F-4C2C-9227-1D630586D2A4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw4 = class(TJavaGenericImport<Jw4Class, Jw4>) end;

//  Jw5Class = interface(JObjectClass)
//  ['{B42908DE-351B-46B6-911B-ED916717B826}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBitmap): Jw5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w5')]
//  Jw5 = interface(JObject)
//  ['{B586DE97-5FBF-4338-A317-2D101BF74F3B}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Int64; P2: Single; P3: Single; P4: Int64; P5: Jf4); cdecl; overload;
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

//  TJw5 = class(TJavaGenericImport<Jw5Class, Jw5>) end;

//  Jw6Class = interface(Jt6Class) // or JObjectClass
//  ['{B71544B6-EAD2-467B-964D-B9D99B1EE7EC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jw6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w6')]
//  Jw6 = interface(Jt6) // or JObject
//  ['{1938B97B-21CE-4B92-893F-CAD41903CCE8}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJw6 = class(TJavaGenericImport<Jw6Class, Jw6>) end;

//  Jw7Class = interface(JObjectClass)
//  ['{E7FCB4FE-5C4C-48F8-A898-C5A806E1E54A}']
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
//    {class} function k(P1: JContext): Boolean; cdecl;
//    {class} function d(P1: JContext): Integer; cdecl; overload;
//    {class} function a(P1: JIntent; P2: JString; P3: JActivity): JResolveInfo; cdecl; overload;
//    {class} function a(P1: JString; P2: JActivity): Boolean; cdecl; overload;
//    {class} function g(P1: JContext): Boolean; cdecl;
//    {class} function b: Boolean; cdecl; overload;
//    {class} function e: Boolean; cdecl; overload;
//    {class} function a(P1: JActivity): Integer; cdecl; overload;
//    {class} function f(P1: JContext): Boolean; cdecl; overload;
//    {class} function e(P1: JContext): Boolean; cdecl; overload;
//    {class} function b(P1: JActivity): Boolean; cdecl; overload;
//    {class} function b(P1: JContext): Boolean; cdecl; overload;
//    {class} function c(P1: JContext): Boolean; cdecl; overload;
//    {class} function c(P1: JActivity): Boolean; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: Single): JBitmap; cdecl; overload;
//    {class} function a(P1: JBitmap; P2: Integer): JBitmap; cdecl; overload;
//    {class} function a(P1: JContext; P2: JIntent): JBitmap; cdecl; overload;
//    {class} function a(P1: JContext; P2: JUri): JBitmap; cdecl; overload;
//    {class} function a(P1: JInputStream): TJavaArray<Byte>; cdecl; overload;
//    {class} function j(P1: JContext): Boolean; cdecl;
//    {class} function h(P1: JContext): Boolean; cdecl;
//    {class} function i(P1: JContext): Boolean; cdecl;
//    {class} function f: Boolean; cdecl; overload;
//    {class} function d: Boolean; cdecl; overload;
//    {class} function a(P1: JContext): Boolean; cdecl; overload;
//    {class} function c: Boolean; cdecl; overload;
//
//    { static Property }
//    {class} property c: Boolean read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w7')]
//  Jw7 = interface(JObject)
//  ['{972BD8E6-C0D9-4C67-80C6-BBAD20244B91}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJw7 = class(TJavaGenericImport<Jw7Class, Jw7>) end;

//  JxClass = interface(Jt6Class) // or JObjectClass
//  ['{F4803C36-0C96-42C6-9B6A-27726BBE51AF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jx; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x')]
//  Jx = interface(Jt6) // or JObject
//  ['{44B477F9-1437-4141-AEE2-87E3F5799292}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJx = class(TJavaGenericImport<JxClass, Jx>) end;

//  Jx0Class = interface(JObjectClass)
//  ['{5CBF08FC-75A1-4507-9FA3-0E5D825C9115}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x0')]
//  Jx0 = interface(JObject)
//  ['{686EC31A-7AA1-4706-B40C-AD26364FDA7B}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJx0 = class(TJavaGenericImport<Jx0Class, Jx0>) end;

//  Jx1Class = interface(JObjectClass)
//  ['{55DC1AF2-2151-4E5D-BEFD-40B8EC754830}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>; P2: JString; P3: JList; P4: JString): Jx1; cdecl; overload;
//    {class} function init(P1: TJavaArray<Byte>; P2: JString; P3: JList; P4: JString; P5: Integer; P6: Integer): Jx1; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x1')]
//  Jx1 = interface(JObject)
//  ['{E890E86F-BA21-47C6-A0AA-6E866ECDC50F}']
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

//  TJx1 = class(TJavaGenericImport<Jx1Class, Jx1>) end;

//  Jx2Class = interface(JObjectClass)
//  ['{E9582164-64FE-48CA-9F54-E5E1D951C7E8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Jf; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x2')]
//  Jx2 = interface(JObject)
//  ['{AA5B1D8F-BF75-45B1-9C8C-BA3AF13B9861}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJx2 = class(TJavaGenericImport<Jx2Class, Jx2>) end;

//  Jx3_aClass = interface(JLinkedHashMapClass) // or JObjectClass
//  ['{E94B3506-4272-47F8-8C27-6D7A15943D2D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x3$a')]
//  Jx3_a = interface(JLinkedHashMap) // or JObject
//  ['{DDBD16FF-D2EA-47A5-B7E1-027C215633F3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJx3_a = class(TJavaGenericImport<Jx3_aClass, Jx3_a>) end;

//  Jx3Class = interface(Ju3Class) // or JObjectClass
//  ['{58AF5BA6-30FA-40AA-A0C1-D187B4438C36}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jx3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x3')]
//  Jx3 = interface(Ju3) // or JObject
//  ['{4903C3B8-436C-425E-A52C-E0B9C2F4A61F}']
//    { Property Methods }
//
//    { methods }
//    procedure c(P1: JBundle); cdecl;
//
//    { Property }
//  end;

//  TJx3 = class(TJavaGenericImport<Jx3Class, Jx3>) end;

//  Jx4Class = interface(JObjectClass)
//  ['{8C3884F2-18AB-42B1-968B-DFCC7FF39E5D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x4')]
//  Jx4 = interface(JObject)
//  ['{41F77E3C-C8D5-4547-8AF8-941D8E7FCBE7}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJx4 = class(TJavaGenericImport<Jx4Class, Jx4>) end;

//  Jx5Class = interface(JObjectClass)
//  ['{F7E2EAE6-B578-4E4C-8FA9-8FE18CFEDE01}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jx5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x5')]
//  Jx5 = interface(JObject)
//  ['{DB06F177-A6D8-4ACA-8F04-8F91DCBFE975}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jw5; P2: Int64); cdecl; overload;
//    procedure a(P1: Jf4); cdecl; overload;
//
//    { Property }
//  end;

//  TJx5 = class(TJavaGenericImport<Jx5Class, Jx5>) end;

//  Jx6Class = interface(JObjectClass)
//  ['{F6740E34-6168-4A97-AA4D-38863CA0AFB4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jx6): Jx6; cdecl; overload;
//    {class} function init(P1: Integer; P2: Boolean): Jx6; cdecl; overload;
//    {class} function init(P1: Integer; P2: Integer; P3: Integer): Jx6; cdecl; overload;
//    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Jx6; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x6')]
//  Jx6 = interface(JObject)
//  ['{E0E8D6C2-94F6-41F5-AE3B-9097E2875DAD}']
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
//    function a(P1: Integer): Jx6; cdecl;
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

//  TJx6 = class(TJavaGenericImport<Jx6Class, Jx6>) end;

//  Jx7Class = interface(Jt6Class) // or JObjectClass
//  ['{95A0DAC1-8003-474E-A328-AD09366C941D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jx7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x7')]
//  Jx7 = interface(Jt6) // or JObject
//  ['{54C5B9AA-40CB-42AA-A69E-0BCE38D24FD2}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJx7 = class(TJavaGenericImport<Jx7Class, Jx7>) end;

//  JyClass = interface(JObjectClass)
//  ['{F3EEECA6-70C2-48F9-A9D4-997732908A3E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y')]
//  Jy = interface(JObject)
//  ['{2C8A23F2-47CC-430D-B741-0217C08BA845}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaArray<Byte>; cdecl;
//    function b: TJavaArray<Byte>; cdecl;
//
//    { Property }
//  end;

//  TJy = class(TJavaGenericImport<JyClass, Jy>) end;

//  Jy0Class = interface(JEnumClass) // or JObjectClass
//  ['{BF2B371B-07DD-4B45-9EBA-B7C79BC1DA6D}']
//    { static Property Methods }
//    {class} function _Geta: Jy0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: Jy0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: Jy0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: Jy0;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jy0>; cdecl;
//    {class} function valueOf(P1: JString): Jy0; cdecl;
//
//    { static Property }
//    {class} property a: Jy0 read _Geta;
//    {class} property b: Jy0 read _Getb;
//    {class} property c: Jy0 read _Getc;
//    {class} property d: Jy0 read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y0')]
//  Jy0 = interface(JEnum) // or JObject
//  ['{9FA840E3-30F1-425C-9C1F-C27258C6008F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJy0 = class(TJavaGenericImport<Jy0Class, Jy0>) end;

//  Jy1Class = interface(Js3Class) // or JObjectClass
//  ['{030BD361-917C-4F5F-9C91-159A01B36178}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jy1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y1')]
//  Jy1 = interface(Js3) // or JObject
//  ['{D5AC6CAA-2527-491C-836B-3E0D3D838E30}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Js; P2: Integer; P3: Integer; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single; P17: Single; P18: Single; P19: Single): Js; cdecl; overload;
//    function a(P1: Js; P2: Integer; P3: Integer; P4: Jd6; P5: Boolean): Js; cdecl; overload;
//    function a(P1: Js; P2: Integer; P3: Integer; P4: Jd6): Js; cdecl; overload;
//    function b(P1: Js; P2: Integer; P3: Integer; P4: Jd6): Js; cdecl;
//
//    { Property }
//  end;

//  TJy1 = class(TJavaGenericImport<Jy1Class, Jy1>) end;

//  Jy2Class = interface(JObjectClass)
//  ['{B76E4A18-B18C-4792-8CD2-F1F14F152982}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y2')]
//  Jy2 = interface(JObject)
//  ['{656C747D-D229-45CC-A7BA-DB119B1DC9CE}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Je7); cdecl; overload;
//    procedure a(P1: Jm2; P2: Jm2); cdecl; overload;
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
//    function g: Jd7; cdecl;
//    procedure l; cdecl;
//    procedure c(P1: Integer); cdecl; overload;
//    procedure k; cdecl;
//
//    { Property }
//  end;

//  TJy2 = class(TJavaGenericImport<Jy2Class, Jy2>) end;

//  Jy3Class = interface(JObjectClass)
//  ['{BFCE5A9B-633A-47B1-8941-6182385813E9}']
//    { static Property Methods }
//    {class} function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JHashSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JContext): JBundle; cdecl; overload;
//    {class} function b(P1: JContext): JString; cdecl;
//    {class} function a: JHashSet; cdecl; overload;
//    {class} function a(P1: JString; P2: JHashSet): Boolean; cdecl; overload;
//
//    { static Property }
//    {class} property c: JString read _Getc;
//    {class} property d: JHashSet read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y3')]
//  Jy3 = interface(JObject)
//  ['{4E130432-4E13-4AF2-87E6-F5B4ABC259A0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJy3 = class(TJavaGenericImport<Jy3Class, Jy3>) end;

//  Jy4Class = interface(JObjectClass)
//  ['{CC334B5E-194D-453D-9229-2EA05EAF27AA}']
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

//  [JavaSignature('com/huawei/hms/scankit/p/y4')]
//  Jy4 = interface(JObject)
//  ['{FC68C141-1A4C-48CE-A912-B55C1A0D1EC4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJy4 = class(TJavaGenericImport<Jy4Class, Jy4>) end;

//  Jy5Class = interface(JObjectClass)
//  ['{ABCC6565-4F53-4291-8AD5-F24FFDDC7401}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb6; P2: JRect; P3: Integer; P4: Single; P5: TJavaArray<Integer>): Jy5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y5')]
//  Jy5 = interface(JObject)
//  ['{27AC4B8E-8346-4C40-9435-E52045258254}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JCanvas; P2: JRect); cdecl;
//
//    { Property }
//  end;

//  TJy5 = class(TJavaGenericImport<Jy5Class, Jy5>) end;

//  Jy6Class = interface(JObjectClass)
//  ['{EC621F89-2B90-45D2-8C8A-C72B4860DA13}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Js6): JHmsScan; cdecl; overload;
//    {class} function a(P1: TJavaObjectArray<Js6>): TJavaObjectArray<JHmsScan>; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y6')]
//  Jy6 = interface(JObject)
//  ['{F6B30F14-8E13-41D0-9BF8-DCFA8A660992}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJy6 = class(TJavaGenericImport<Jy6Class, Jy6>) end;

//  Jy7Class = interface(Jt6Class) // or JObjectClass
//  ['{11C5EA3E-6383-4D8E-A179-46119010EB16}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jy7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y7')]
//  Jy7 = interface(Jt6) // or JObject
//  ['{78088AD7-4824-45D7-865A-C2A27822885B}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJy7 = class(TJavaGenericImport<Jy7Class, Jy7>) end;

//  JzClass = interface(Jt6Class) // or JObjectClass
//  ['{A7A4D0F2-EFC6-49A5-9460-87112A8D71A1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jz; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z')]
//  Jz = interface(Jt6) // or JObject
//  ['{D388F30A-8AF2-4849-BD2C-0B77CF218DB1}']
//    { Property Methods }
//
//    { methods }
//    function b(P1: Js6): JHmsScan; cdecl;
//
//    { Property }
//  end;

//  TJz = class(TJavaGenericImport<JzClass, Jz>) end;

//  Jz0Class = interface(JObjectClass)
//  ['{C6361F19-BAD1-4303-BA56-139CC2600BD6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z0')]
//  Jz0 = interface(JObject)
//  ['{B62B51C2-50EC-4C1C-8A50-FE729876ACD5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz0 = class(TJavaGenericImport<Jz0Class, Jz0>) end;

//  Jz1Class = interface(JObjectClass)
//  ['{65036FD4-3E4A-41B7-AF7F-4C496A23C75E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JCharSequence; P2: Integer; P3: Integer): Jz1; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z1')]
//  Jz1 = interface(JObject)
//  ['{C1737421-1814-476E-82E8-E4F2AD9EF0B2}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJz1 = class(TJavaGenericImport<Jz1Class, Jz1>) end;

//  Jz2Class = interface(JObjectClass)
//  ['{7D7D1A99-BDB8-4A89-962E-2C34B85A44BB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jd7): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z2')]
//  Jz2 = interface(JObject)
//  ['{BDE79B04-3DD5-4ED5-884A-639E962ECFAC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz2 = class(TJavaGenericImport<Jz2Class, Jz2>) end;

//  Jz3Class = interface(JObjectClass)
//  ['{E66D2E7E-63A7-4989-8C46-A05E073D8388}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jz3; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z3')]
//  Jz3 = interface(JObject)
//  ['{788C6CB3-310A-4339-A8A0-68AC2BB63113}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jp; P2: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJz3 = class(TJavaGenericImport<Jz3Class, Jz3>) end;

//  Jz4Class = interface(Jg5Class) // or JObjectClass
//  ['{D8FB2601-FC8B-4908-975F-1E377700A0D6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JMap): Jz4; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z4')]
//  Jz4 = interface(Jg5) // or JObject
//  ['{16654C3C-0B33-4F6F-BB29-62C07C40A199}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jr; P3: JMap): Js6; cdecl;
//
//    { Property }
//  end;

//  TJz4 = class(TJavaGenericImport<Jz4Class, Jz4>) end;

//  Jz5Class = interface(JObjectClass)
//  ['{5674A07D-DB36-402C-AE36-56213BA79342}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jz5; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z5')]
//  Jz5 = interface(JObject)
//  ['{82496B3C-AA26-429A-9912-E8B1D797F6E4}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jw5); cdecl; overload;
//    procedure a(P1: Jg4); cdecl; overload;
//
//    { Property }
//  end;

//  TJz5 = class(TJavaGenericImport<Jz5Class, Jz5>) end;

//  Jz6Class = interface(JObjectClass)
//  ['{6EB44C94-FD5F-40AF-B8BE-CCDCB1B52F0E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JObject): Jz6; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z6')]
//  Jz6 = interface(JObject)
//  ['{FEA09D66-FB3A-45A4-9D5D-A8CAC58342B3}']
//    { Property Methods }
//
//    { methods }
//    function a: JObject; cdecl;
//
//    { Property }
//  end;

//  TJz6 = class(TJavaGenericImport<Jz6Class, Jz6>) end;

//  Jz7_aClass = interface(JObjectClass)
//  ['{0136E239-3676-4B7B-BBC3-45D21185669C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z7$a')]
//  Jz7_a = interface(JObject)
//  ['{E09E8C71-EE49-47BB-8A30-00E598333AC9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz7_a = class(TJavaGenericImport<Jz7_aClass, Jz7_a>) end;

//  Jz7_bClass = interface(JObjectClass)
//  ['{625DDCEA-718A-41FF-AAEA-2D5C69F43AC4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z7$b')]
//  Jz7_b = interface(JObject)
//  ['{8047F990-FE00-4D4B-ACB8-07112DDCF5FF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz7_b = class(TJavaGenericImport<Jz7_bClass, Jz7_b>) end;

//  Jz7_cClass = interface(JObjectClass)
//  ['{9BD1F886-EB69-4949-82D1-B311F78155A3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z7$c')]
//  Jz7_c = interface(JObject)
//  ['{A5574F11-C270-4B95-80C7-C0D9BE15ED45}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJz7_c = class(TJavaGenericImport<Jz7_cClass, Jz7_c>) end;

//  Jz7Class = interface(JObjectClass)
//  ['{B2E8A4AA-513B-47D6-BBBD-176FA691CF40}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Integer): Jz7; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z7')]
//  Jz7 = interface(JObject)
//  ['{7DC79035-FF82-4BF3-9FD3-80F0B5B0AAB2}']
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

//  TJz7 = class(TJavaGenericImport<Jz7Class, Jz7>) end;

  JProviderRemoteViewClass = interface(JLinearLayoutClass) // or JObjectClass
  ['{4C6A6511-8A62-42A0-9E0E-D83D0D13E525}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext; P2: Boolean; P3: Boolean): JProviderRemoteView; cdecl; overload;
    {class} function init(P1: JContext; P2: Boolean): JProviderRemoteView; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/ProviderRemoteView')]
  JProviderRemoteView = interface(JLinearLayout) // or JObject
  ['{7607DCA5-6F8D-4B72-8145-C072F59AC441}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJProviderRemoteView = class(TJavaGenericImport<JProviderRemoteViewClass, JProviderRemoteView>) end;

  JLoadOpencvJNIUtilClass = interface(JObjectClass)
  ['{982F1CA4-6913-477F-9D85-1D540A9286D0}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLoadOpencvJNIUtil; cdecl;
    {class} function QuadFitting(P1: TJavaArray<Single>; P2: Integer; P3: TJavaArray<Single>): TJavaArray<Single>; cdecl;
    {class} procedure setModel(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: Integer); cdecl;
    {class} function adaptivebinary(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Boolean): TJavaArray<Byte>; cdecl;
    {class} function multiBarcodeDetect(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Boolean): TJavaArray<Single>; cdecl;
    {class} function imageRotate(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Single; P7: Double): TJavaArray<Byte>; cdecl;
    {class} function imageResize(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer): TJavaArray<Byte>; cdecl;
    {class} function QRCornerDetect(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Single>): TJavaArray<Byte>; cdecl;
    {class} function sharpen(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Byte>; cdecl;
    {class} function removeMoirePattern(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/util/LoadOpencvJNIUtil')]
  JLoadOpencvJNIUtil = interface(JObject)
  ['{78A8D94B-5003-4CF5-B159-68D302A9CEC5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLoadOpencvJNIUtil = class(TJavaGenericImport<JLoadOpencvJNIUtilClass, JLoadOpencvJNIUtil>) end;

  JOpencvJNIClass = interface(JObjectClass)
  ['{D1848B47-C247-4E22-AC8D-C2E9522D75B8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOpencvJNI; cdecl; overload;
//    {class} procedure init; cdecl; overload;
    {class} function QuadFitting(P1: TJavaArray<Single>; P2: Integer; P3: TJavaArray<Single>): TJavaArray<Single>; cdecl;
    {class} function multiBarcodeDetect(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Boolean): TJavaArray<Single>; cdecl;
    {class} procedure setModel(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: Integer); cdecl;
    {class} function imageResize(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer): TJavaArray<Byte>; cdecl;
    {class} function imageRotate(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Single; P7: Double): TJavaArray<Byte>; cdecl;
    {class} function adaptiveBinary(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Boolean): TJavaArray<Byte>; cdecl;
    {class} function QRCornerDetect(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Single>): TJavaArray<Byte>; cdecl;
    {class} function sharpen(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Byte>; cdecl;
    {class} function removeMoirePattern(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/util/OpencvJNI')]
  JOpencvJNI = interface(JObject)
  ['{968E9C3F-9FA8-4BCA-921E-EB891DF177E5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOpencvJNI = class(TJavaGenericImport<JOpencvJNIClass, JOpencvJNI>) end;

//  JViewfinderView_aClass = interface(JObjectClass)
//  ['{540D1B22-549C-4E75-A10A-25129334F950}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/ViewfinderView$a')]
//  JViewfinderView_a = interface(JObject)
//  ['{E3976C44-E341-4EBA-902D-A838BCD4771F}']
//    { Property Methods }
//
//    { methods }
//    procedure onAnimationUpdate(P1: JValueAnimator); cdecl;
//
//    { Property }
//  end;

//  TJViewfinderView_a = class(TJavaGenericImport<JViewfinderView_aClass, JViewfinderView_a>) end;

//  JViewfinderView_bClass = interface(JEnumClass) // or JObjectClass
//  ['{2E349404-D5C0-4F64-950A-BAEE5551BD8F}']
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
//  ['{25400D80-D535-4A87-8E57-0FD40C4A54D5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJViewfinderView_b = class(TJavaGenericImport<JViewfinderView_bClass, JViewfinderView_b>) end;

//  JViewfinderView_cClass = interface(JEnumClass) // or JObjectClass
//  ['{B67C2CBD-729C-4D1E-8EEB-7F23CD41DAAF}']
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
//  ['{4AE3CBF7-E6B5-4CE6-88C0-81F0A36E864A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJViewfinderView_c = class(TJavaGenericImport<JViewfinderView_cClass, JViewfinderView_c>) end;

  JViewfinderViewClass = interface(JViewClass) // or JObjectClass
  ['{26961869-3F12-4C05-96CD-CBDC0121EC88}']
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
  ['{3B8F71BF-2A8F-4443-AF05-F943BABE9FEB}']
    { Property Methods }
    function _Getm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setm(am: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setn(an: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure onDraw(P1: JCanvas); cdecl;
//    procedure a(P1: Ju6); cdecl; overload;
    procedure a; cdecl; overload;
    procedure a(P1: JRect; P2: Boolean; P3: JPoint); cdecl; overload;

    { Property }
    property m: Integer read _Getm write _Setm;
    property n: Integer read _Getn write _Setn;
  end;

  TJViewfinderView = class(TJavaGenericImport<JViewfinderViewClass, JViewfinderView>) end;

implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JDynamicModuleInitializer',
//    TypeInfo(Androidapi.JNI.classes.JDynamicModuleInitializer));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja_a',
////    TypeInfo(Androidapi.JNI.classes.Ja_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja_b',
////    TypeInfo(Androidapi.JNI.classes.Ja_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja_c',
////    TypeInfo(Androidapi.JNI.classes.Ja_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja',
////    TypeInfo(Androidapi.JNI.classes.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnErrorCallback_Default',
//    TypeInfo(Androidapi.JNI.classes.JIOnErrorCallback_Default));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnErrorCallback_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.classes.JIOnErrorCallback_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnErrorCallback_Stub',
//    TypeInfo(Androidapi.JNI.classes.JIOnErrorCallback_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnErrorCallback',
//    TypeInfo(Androidapi.JNI.classes.JIOnErrorCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnLightCallback_Default',
//    TypeInfo(Androidapi.JNI.classes.JIOnLightCallback_Default));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnLightCallback_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.classes.JIOnLightCallback_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnLightCallback_Stub',
//    TypeInfo(Androidapi.JNI.classes.JIOnLightCallback_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnLightCallback',
//    TypeInfo(Androidapi.JNI.classes.JIOnLightCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnResultCallback_Default',
//    TypeInfo(Androidapi.JNI.classes.JIOnResultCallback_Default));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnResultCallback_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.classes.JIOnResultCallback_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnResultCallback_Stub',
//    TypeInfo(Androidapi.JNI.classes.JIOnResultCallback_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIOnResultCallback',
//    TypeInfo(Androidapi.JNI.classes.JIOnResultCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteCreator_Default',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteCreator_Default));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteCreator_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteCreator_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteCreator_Stub',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteCreator_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteCreator',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteCreator));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteDecoderCreator_Default',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteDecoderCreator_Default));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteDecoderCreator_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteDecoderCreator_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteDecoderCreator_Stub',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteDecoderCreator_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteDecoderCreator',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteDecoderCreator));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteDecoderDelegate_Default',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteDecoderDelegate_Default));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteDecoderDelegate_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteDecoderDelegate_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteDecoderDelegate_Stub',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteDecoderDelegate_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteDecoderDelegate__Parcel',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteDecoderDelegate__Parcel));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteDecoderDelegate',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteDecoderDelegate));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteFrameDecoderDelegate_Default',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteFrameDecoderDelegate_Default));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteFrameDecoderDelegate_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteFrameDecoderDelegate_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteFrameDecoderDelegate_Stub',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteFrameDecoderDelegate_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteFrameDecoderDelegate',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteFrameDecoderDelegate));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteHmsDecoderDelegate_Default',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteHmsDecoderDelegate_Default));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteHmsDecoderDelegate_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteHmsDecoderDelegate_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteHmsDecoderDelegate_Stub',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteHmsDecoderDelegate_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteHmsDecoderDelegate__Parcel',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteHmsDecoderDelegate__Parcel));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteHmsDecoderDelegate',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteHmsDecoderDelegate));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteViewDelegate_Default',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteViewDelegate_Default));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteViewDelegate_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteViewDelegate_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteViewDelegate_Stub',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteViewDelegate_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteViewDelegate__Parcel',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteViewDelegate__Parcel));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JIRemoteViewDelegate',
//    TypeInfo(Androidapi.JNI.classes.JIRemoteViewDelegate));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb',
////    TypeInfo(Androidapi.JNI.classes.Jb));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc',
////    TypeInfo(Androidapi.JNI.classes.Jc));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd',
////    TypeInfo(Androidapi.JNI.classes.Jd));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JDetailRect_a',
////    TypeInfo(Androidapi.JNI.classes.JDetailRect_a));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JDetailRect',
//    TypeInfo(Androidapi.JNI.classes.JDetailRect));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je',
////    TypeInfo(Androidapi.JNI.classes.Je));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf_a',
////    TypeInfo(Androidapi.JNI.classes.Jf_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf',
////    TypeInfo(Androidapi.JNI.classes.Jf));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg',
////    TypeInfo(Androidapi.JNI.classes.Jg));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JOnErrorCallback',
//    TypeInfo(Androidapi.JNI.classes.JOnErrorCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JOnLightVisibleCallBack',
//    TypeInfo(Androidapi.JNI.classes.JOnLightVisibleCallBack));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JOnResultCallback',
//    TypeInfo(Androidapi.JNI.classes.JOnResultCallback));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JRemoteView_a_a',
////    TypeInfo(Androidapi.JNI.classes.JRemoteView_a_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JRemoteView_a_b',
////    TypeInfo(Androidapi.JNI.classes.JRemoteView_a_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JRemoteView_a',
////    TypeInfo(Androidapi.JNI.classes.JRemoteView_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JRemoteView_b',
////    TypeInfo(Androidapi.JNI.classes.JRemoteView_b));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JRemoteView_Builder',
//    TypeInfo(Androidapi.JNI.classes.JRemoteView_Builder));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JRemoteView',
//    TypeInfo(Androidapi.JNI.classes.JRemoteView));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanKitActivity_1',
////    TypeInfo(Androidapi.JNI.classes.JScanKitActivity_1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanKitActivity_2',
////    TypeInfo(Androidapi.JNI.classes.JScanKitActivity_2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanKitActivity_3',
////    TypeInfo(Androidapi.JNI.classes.JScanKitActivity_3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanKitActivity_4',
////    TypeInfo(Androidapi.JNI.classes.JScanKitActivity_4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanKitActivity_5',
////    TypeInfo(Androidapi.JNI.classes.JScanKitActivity_5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanKitActivity_6',
////    TypeInfo(Androidapi.JNI.classes.JScanKitActivity_6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanKitActivity_7',
////    TypeInfo(Androidapi.JNI.classes.JScanKitActivity_7));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanKitActivity',
//    TypeInfo(Androidapi.JNI.classes.JScanKitActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanUtil',
//    TypeInfo(Androidapi.JNI.classes.JScanUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JWriterException',
//    TypeInfo(Androidapi.JNI.classes.JWriterException));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsBuildBitmapOption_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsBuildBitmapOption_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsBuildBitmapOption_Creator',
//    TypeInfo(Androidapi.JNI.classes.JHmsBuildBitmapOption_Creator));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsBuildBitmapOption_ErrorCorrectionLevel',
//    TypeInfo(Androidapi.JNI.classes.JHmsBuildBitmapOption_ErrorCorrectionLevel));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsBuildBitmapOption',
//    TypeInfo(Androidapi.JNI.classes.JHmsBuildBitmapOption));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_AddressInfo_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_AddressInfo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_AddressInfo_ADDRESS_TYPE',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_AddressInfo_ADDRESS_TYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_AddressInfo',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_AddressInfo));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_ContactDetail_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_ContactDetail_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_ContactDetail',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_ContactDetail));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_DriverInfo_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_DriverInfo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_DriverInfo',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_DriverInfo));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_EmailContent_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_EmailContent_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_EmailContent_EMAIL_TYPE',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_EmailContent_EMAIL_TYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_EmailContent',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_EmailContent));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_EventInfo_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_EventInfo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_EventInfo',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_EventInfo));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_EventTime_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_EventTime_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_EventTime',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_EventTime));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_LinkUrl_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_LinkUrl_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_LinkUrl',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_LinkUrl));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_LocationCoordinate_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_LocationCoordinate_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_LocationCoordinate',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_LocationCoordinate));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_PeopleName_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_PeopleName_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_PeopleName',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_PeopleName));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_SCAN_TYPE_FORMAT',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_SCAN_TYPE_FORMAT));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_SmsContent_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_SmsContent_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_SmsContent',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_SmsContent));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_TelPhoneNumber_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_TelPhoneNumber_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_TelPhoneNumber_USE_TYPE',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_TelPhoneNumber_USE_TYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_TelPhoneNumber',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_TelPhoneNumber));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_WiFiConnectionInfo_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScan_WiFiConnectionInfo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_WiFiConnectionInfo_CIPHER_MODE',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_WiFiConnectionInfo_CIPHER_MODE));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan_WiFiConnectionInfo',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan_WiFiConnectionInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScan',
//    TypeInfo(Androidapi.JNI.classes.JHmsScan));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanAnalyzer_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScanAnalyzer_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanAnalyzer_Creator',
//    TypeInfo(Androidapi.JNI.classes.JHmsScanAnalyzer_Creator));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanAnalyzer',
//    TypeInfo(Androidapi.JNI.classes.JHmsScanAnalyzer));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanAnalyzerOptions_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScanAnalyzerOptions_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanAnalyzerOptions_Creator',
//    TypeInfo(Androidapi.JNI.classes.JHmsScanAnalyzerOptions_Creator));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanAnalyzerOptions',
//    TypeInfo(Androidapi.JNI.classes.JHmsScanAnalyzerOptions));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanBase_SCAN_TYPE',
//    TypeInfo(Androidapi.JNI.classes.JHmsScanBase_SCAN_TYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanBase',
//    TypeInfo(Androidapi.JNI.classes.JHmsScanBase));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanFrame',
//    TypeInfo(Androidapi.JNI.classes.JHmsScanFrame));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanFrameOptions_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScanFrameOptions_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanFrameOptions_Creator',
//    TypeInfo(Androidapi.JNI.classes.JHmsScanFrameOptions_Creator));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanFrameOptions',
//    TypeInfo(Androidapi.JNI.classes.JHmsScanFrameOptions));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanResult_1',
////    TypeInfo(Androidapi.JNI.classes.JHmsScanResult_1));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JHmsScanResult',
//    TypeInfo(Androidapi.JNI.classes.JHmsScanResult));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja_a_121',
////    TypeInfo(Androidapi.JNI.classes.Ja_a_121));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja_122',
////    TypeInfo(Androidapi.JNI.classes.Ja_122));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JBarcodeFormat_a',
////    TypeInfo(Androidapi.JNI.classes.JBarcodeFormat_a));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JBarcodeFormat',
//    TypeInfo(Androidapi.JNI.classes.JBarcodeFormat));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb_a',
////    TypeInfo(Androidapi.JNI.classes.Jb_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb_b',
////    TypeInfo(Androidapi.JNI.classes.Jb_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb_c',
////    TypeInfo(Androidapi.JNI.classes.Jb_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb_d',
////    TypeInfo(Androidapi.JNI.classes.Jb_d));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb_129',
////    TypeInfo(Androidapi.JNI.classes.Jb_129));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc_a',
////    TypeInfo(Androidapi.JNI.classes.Jc_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc_131',
////    TypeInfo(Androidapi.JNI.classes.Jc_131));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JCreator',
//    TypeInfo(Androidapi.JNI.classes.JCreator));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd_133',
////    TypeInfo(Androidapi.JNI.classes.Jd_133));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JDecoderCreator',
//    TypeInfo(Androidapi.JNI.classes.JDecoderCreator));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanDrawable_a',
////    TypeInfo(Androidapi.JNI.classes.JScanDrawable_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanDrawable_b',
////    TypeInfo(Androidapi.JNI.classes.JScanDrawable_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanDrawable_c',
////    TypeInfo(Androidapi.JNI.classes.JScanDrawable_c));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JScanDrawable',
//    TypeInfo(Androidapi.JNI.classes.JScanDrawable));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je_a',
////    TypeInfo(Androidapi.JNI.classes.Je_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je_b',
////    TypeInfo(Androidapi.JNI.classes.Je_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je_c',
////    TypeInfo(Androidapi.JNI.classes.Je_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je_142',
////    TypeInfo(Androidapi.JNI.classes.Je_142));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf_143',
////    TypeInfo(Androidapi.JNI.classes.Jf_143));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg_144',
////    TypeInfo(Androidapi.JNI.classes.Jg_144));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh_a',
////    TypeInfo(Androidapi.JNI.classes.Jh_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh',
////    TypeInfo(Androidapi.JNI.classes.Jh));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji_a',
////    TypeInfo(Androidapi.JNI.classes.Ji_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji_b',
////    TypeInfo(Androidapi.JNI.classes.Ji_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji_c',
////    TypeInfo(Androidapi.JNI.classes.Ji_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji',
////    TypeInfo(Androidapi.JNI.classes.Ji));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj',
////    TypeInfo(Androidapi.JNI.classes.Jj));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja_152',
////    TypeInfo(Androidapi.JNI.classes.Ja_152));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja0',
////    TypeInfo(Androidapi.JNI.classes.Ja0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja1',
////    TypeInfo(Androidapi.JNI.classes.Ja1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja2',
////    TypeInfo(Androidapi.JNI.classes.Ja2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja3',
////    TypeInfo(Androidapi.JNI.classes.Ja3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja4_a',
////    TypeInfo(Androidapi.JNI.classes.Ja4_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja4_b',
////    TypeInfo(Androidapi.JNI.classes.Ja4_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja4_c',
////    TypeInfo(Androidapi.JNI.classes.Ja4_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja4',
////    TypeInfo(Androidapi.JNI.classes.Ja4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja5',
////    TypeInfo(Androidapi.JNI.classes.Ja5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja6',
////    TypeInfo(Androidapi.JNI.classes.Ja6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja7',
////    TypeInfo(Androidapi.JNI.classes.Ja7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja8_a',
////    TypeInfo(Androidapi.JNI.classes.Ja8_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja8_b',
////    TypeInfo(Androidapi.JNI.classes.Ja8_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ja8',
////    TypeInfo(Androidapi.JNI.classes.Ja8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb_167',
////    TypeInfo(Androidapi.JNI.classes.Jb_167));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb0',
////    TypeInfo(Androidapi.JNI.classes.Jb0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb1',
////    TypeInfo(Androidapi.JNI.classes.Jb1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb2',
////    TypeInfo(Androidapi.JNI.classes.Jb2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb3',
////    TypeInfo(Androidapi.JNI.classes.Jb3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb4',
////    TypeInfo(Androidapi.JNI.classes.Jb4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb5',
////    TypeInfo(Androidapi.JNI.classes.Jb5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb6',
////    TypeInfo(Androidapi.JNI.classes.Jb6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb7',
////    TypeInfo(Androidapi.JNI.classes.Jb7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb8_a',
////    TypeInfo(Androidapi.JNI.classes.Jb8_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb8_b',
////    TypeInfo(Androidapi.JNI.classes.Jb8_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jb8',
////    TypeInfo(Androidapi.JNI.classes.Jb8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc_179',
////    TypeInfo(Androidapi.JNI.classes.Jc_179));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc0',
////    TypeInfo(Androidapi.JNI.classes.Jc0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc1',
////    TypeInfo(Androidapi.JNI.classes.Jc1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc2',
////    TypeInfo(Androidapi.JNI.classes.Jc2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc3',
////    TypeInfo(Androidapi.JNI.classes.Jc3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc4_a',
////    TypeInfo(Androidapi.JNI.classes.Jc4_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc4',
////    TypeInfo(Androidapi.JNI.classes.Jc4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc5_a',
////    TypeInfo(Androidapi.JNI.classes.Jc5_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc5',
////    TypeInfo(Androidapi.JNI.classes.Jc5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc6',
////    TypeInfo(Androidapi.JNI.classes.Jc6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc7',
////    TypeInfo(Androidapi.JNI.classes.Jc7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jc8',
////    TypeInfo(Androidapi.JNI.classes.Jc8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd_191',
////    TypeInfo(Androidapi.JNI.classes.Jd_191));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd0',
////    TypeInfo(Androidapi.JNI.classes.Jd0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd1',
////    TypeInfo(Androidapi.JNI.classes.Jd1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd2_a',
////    TypeInfo(Androidapi.JNI.classes.Jd2_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd2',
////    TypeInfo(Androidapi.JNI.classes.Jd2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd3',
////    TypeInfo(Androidapi.JNI.classes.Jd3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd4',
////    TypeInfo(Androidapi.JNI.classes.Jd4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd5',
////    TypeInfo(Androidapi.JNI.classes.Jd5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd6',
////    TypeInfo(Androidapi.JNI.classes.Jd6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd7',
////    TypeInfo(Androidapi.JNI.classes.Jd7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jd8',
////    TypeInfo(Androidapi.JNI.classes.Jd8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je_202',
////    TypeInfo(Androidapi.JNI.classes.Je_202));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je0_a',
////    TypeInfo(Androidapi.JNI.classes.Je0_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je0_b',
////    TypeInfo(Androidapi.JNI.classes.Je0_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je0',
////    TypeInfo(Androidapi.JNI.classes.Je0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je1',
////    TypeInfo(Androidapi.JNI.classes.Je1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je2',
////    TypeInfo(Androidapi.JNI.classes.Je2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je3',
////    TypeInfo(Androidapi.JNI.classes.Je3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je4',
////    TypeInfo(Androidapi.JNI.classes.Je4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je5',
////    TypeInfo(Androidapi.JNI.classes.Je5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je6',
////    TypeInfo(Androidapi.JNI.classes.Je6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je7',
////    TypeInfo(Androidapi.JNI.classes.Je7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Je8',
////    TypeInfo(Androidapi.JNI.classes.Je8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf_214',
////    TypeInfo(Androidapi.JNI.classes.Jf_214));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf0',
////    TypeInfo(Androidapi.JNI.classes.Jf0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf1_a',
////    TypeInfo(Androidapi.JNI.classes.Jf1_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf1_b',
////    TypeInfo(Androidapi.JNI.classes.Jf1_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf1_c',
////    TypeInfo(Androidapi.JNI.classes.Jf1_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf1_d',
////    TypeInfo(Androidapi.JNI.classes.Jf1_d));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf1_e',
////    TypeInfo(Androidapi.JNI.classes.Jf1_e));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf1_f',
////    TypeInfo(Androidapi.JNI.classes.Jf1_f));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf1_g',
////    TypeInfo(Androidapi.JNI.classes.Jf1_g));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf1_h',
////    TypeInfo(Androidapi.JNI.classes.Jf1_h));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf1',
////    TypeInfo(Androidapi.JNI.classes.Jf1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf2',
////    TypeInfo(Androidapi.JNI.classes.Jf2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf3',
////    TypeInfo(Androidapi.JNI.classes.Jf3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf4',
////    TypeInfo(Androidapi.JNI.classes.Jf4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf5',
////    TypeInfo(Androidapi.JNI.classes.Jf5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf6',
////    TypeInfo(Androidapi.JNI.classes.Jf6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf7',
////    TypeInfo(Androidapi.JNI.classes.Jf7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jf8',
////    TypeInfo(Androidapi.JNI.classes.Jf8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg_232',
////    TypeInfo(Androidapi.JNI.classes.Jg_232));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg0',
////    TypeInfo(Androidapi.JNI.classes.Jg0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg1_a',
////    TypeInfo(Androidapi.JNI.classes.Jg1_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg1_b',
////    TypeInfo(Androidapi.JNI.classes.Jg1_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg1_c',
////    TypeInfo(Androidapi.JNI.classes.Jg1_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg1_d',
////    TypeInfo(Androidapi.JNI.classes.Jg1_d));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg1_e',
////    TypeInfo(Androidapi.JNI.classes.Jg1_e));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg1_f',
////    TypeInfo(Androidapi.JNI.classes.Jg1_f));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg1_g',
////    TypeInfo(Androidapi.JNI.classes.Jg1_g));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg1_h',
////    TypeInfo(Androidapi.JNI.classes.Jg1_h));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg1',
////    TypeInfo(Androidapi.JNI.classes.Jg1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg2',
////    TypeInfo(Androidapi.JNI.classes.Jg2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg3',
////    TypeInfo(Androidapi.JNI.classes.Jg3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg4',
////    TypeInfo(Androidapi.JNI.classes.Jg4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg5',
////    TypeInfo(Androidapi.JNI.classes.Jg5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg6',
////    TypeInfo(Androidapi.JNI.classes.Jg6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg7',
////    TypeInfo(Androidapi.JNI.classes.Jg7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jg8',
////    TypeInfo(Androidapi.JNI.classes.Jg8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh_250',
////    TypeInfo(Androidapi.JNI.classes.Jh_250));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh0',
////    TypeInfo(Androidapi.JNI.classes.Jh0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh1',
////    TypeInfo(Androidapi.JNI.classes.Jh1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh2',
////    TypeInfo(Androidapi.JNI.classes.Jh2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh3_a',
////    TypeInfo(Androidapi.JNI.classes.Jh3_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh3_b',
////    TypeInfo(Androidapi.JNI.classes.Jh3_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh3_c',
////    TypeInfo(Androidapi.JNI.classes.Jh3_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh3_d',
////    TypeInfo(Androidapi.JNI.classes.Jh3_d));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh3',
////    TypeInfo(Androidapi.JNI.classes.Jh3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh4',
////    TypeInfo(Androidapi.JNI.classes.Jh4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh5',
////    TypeInfo(Androidapi.JNI.classes.Jh5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh6',
////    TypeInfo(Androidapi.JNI.classes.Jh6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh7',
////    TypeInfo(Androidapi.JNI.classes.Jh7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jh8',
////    TypeInfo(Androidapi.JNI.classes.Jh8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji_264',
////    TypeInfo(Androidapi.JNI.classes.Ji_264));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji0_a',
////    TypeInfo(Androidapi.JNI.classes.Ji0_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji0',
////    TypeInfo(Androidapi.JNI.classes.Ji0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji1',
////    TypeInfo(Androidapi.JNI.classes.Ji1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji2',
////    TypeInfo(Androidapi.JNI.classes.Ji2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji3_a',
////    TypeInfo(Androidapi.JNI.classes.Ji3_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji3_b',
////    TypeInfo(Androidapi.JNI.classes.Ji3_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji3_c',
////    TypeInfo(Androidapi.JNI.classes.Ji3_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji3_d',
////    TypeInfo(Androidapi.JNI.classes.Ji3_d));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji3_e',
////    TypeInfo(Androidapi.JNI.classes.Ji3_e));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji3_f',
////    TypeInfo(Androidapi.JNI.classes.Ji3_f));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji3_g',
////    TypeInfo(Androidapi.JNI.classes.Ji3_g));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji3',
////    TypeInfo(Androidapi.JNI.classes.Ji3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji4',
////    TypeInfo(Androidapi.JNI.classes.Ji4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji5',
////    TypeInfo(Androidapi.JNI.classes.Ji5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji6',
////    TypeInfo(Androidapi.JNI.classes.Ji6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji7',
////    TypeInfo(Androidapi.JNI.classes.Ji7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ji8',
////    TypeInfo(Androidapi.JNI.classes.Ji8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj_282',
////    TypeInfo(Androidapi.JNI.classes.Jj_282));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj0_a',
////    TypeInfo(Androidapi.JNI.classes.Jj0_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj0_b',
////    TypeInfo(Androidapi.JNI.classes.Jj0_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj0_c',
////    TypeInfo(Androidapi.JNI.classes.Jj0_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj0_d',
////    TypeInfo(Androidapi.JNI.classes.Jj0_d));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj0_e',
////    TypeInfo(Androidapi.JNI.classes.Jj0_e));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj0',
////    TypeInfo(Androidapi.JNI.classes.Jj0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj1',
////    TypeInfo(Androidapi.JNI.classes.Jj1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj2',
////    TypeInfo(Androidapi.JNI.classes.Jj2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj3_a',
////    TypeInfo(Androidapi.JNI.classes.Jj3_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj3_b',
////    TypeInfo(Androidapi.JNI.classes.Jj3_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj3_c',
////    TypeInfo(Androidapi.JNI.classes.Jj3_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj3',
////    TypeInfo(Androidapi.JNI.classes.Jj3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj4',
////    TypeInfo(Androidapi.JNI.classes.Jj4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj5',
////    TypeInfo(Androidapi.JNI.classes.Jj5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj6',
////    TypeInfo(Androidapi.JNI.classes.Jj6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj7',
////    TypeInfo(Androidapi.JNI.classes.Jj7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jj8',
////    TypeInfo(Androidapi.JNI.classes.Jj8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk',
////    TypeInfo(Androidapi.JNI.classes.Jk));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk0_a',
////    TypeInfo(Androidapi.JNI.classes.Jk0_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk0',
////    TypeInfo(Androidapi.JNI.classes.Jk0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk1',
////    TypeInfo(Androidapi.JNI.classes.Jk1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk2',
////    TypeInfo(Androidapi.JNI.classes.Jk2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk3',
////    TypeInfo(Androidapi.JNI.classes.Jk3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk4',
////    TypeInfo(Androidapi.JNI.classes.Jk4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk5',
////    TypeInfo(Androidapi.JNI.classes.Jk5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk6',
////    TypeInfo(Androidapi.JNI.classes.Jk6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk7',
////    TypeInfo(Androidapi.JNI.classes.Jk7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jk8',
////    TypeInfo(Androidapi.JNI.classes.Jk8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jl',
////    TypeInfo(Androidapi.JNI.classes.Jl));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jl0',
////    TypeInfo(Androidapi.JNI.classes.Jl0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jl1',
////    TypeInfo(Androidapi.JNI.classes.Jl1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jl2',
////    TypeInfo(Androidapi.JNI.classes.Jl2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jl3',
////    TypeInfo(Androidapi.JNI.classes.Jl3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jl4',
////    TypeInfo(Androidapi.JNI.classes.Jl4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jl5',
////    TypeInfo(Androidapi.JNI.classes.Jl5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jl6',
////    TypeInfo(Androidapi.JNI.classes.Jl6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jl7',
////    TypeInfo(Androidapi.JNI.classes.Jl7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jl8',
////    TypeInfo(Androidapi.JNI.classes.Jl8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jm',
////    TypeInfo(Androidapi.JNI.classes.Jm));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jm0',
////    TypeInfo(Androidapi.JNI.classes.Jm0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jm1',
////    TypeInfo(Androidapi.JNI.classes.Jm1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jm2',
////    TypeInfo(Androidapi.JNI.classes.Jm2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jm3',
////    TypeInfo(Androidapi.JNI.classes.Jm3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jm4',
////    TypeInfo(Androidapi.JNI.classes.Jm4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jm5',
////    TypeInfo(Androidapi.JNI.classes.Jm5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jm6',
////    TypeInfo(Androidapi.JNI.classes.Jm6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jm7',
////    TypeInfo(Androidapi.JNI.classes.Jm7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jm8',
////    TypeInfo(Androidapi.JNI.classes.Jm8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn',
////    TypeInfo(Androidapi.JNI.classes.Jn));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn0',
////    TypeInfo(Androidapi.JNI.classes.Jn0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn1',
////    TypeInfo(Androidapi.JNI.classes.Jn1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn2_a',
////    TypeInfo(Androidapi.JNI.classes.Jn2_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn2',
////    TypeInfo(Androidapi.JNI.classes.Jn2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn3',
////    TypeInfo(Androidapi.JNI.classes.Jn3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn4',
////    TypeInfo(Androidapi.JNI.classes.Jn4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn5',
////    TypeInfo(Androidapi.JNI.classes.Jn5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn6',
////    TypeInfo(Androidapi.JNI.classes.Jn6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn7',
////    TypeInfo(Androidapi.JNI.classes.Jn7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jn8',
////    TypeInfo(Androidapi.JNI.classes.Jn8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jo',
////    TypeInfo(Androidapi.JNI.classes.Jo));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jo0',
////    TypeInfo(Androidapi.JNI.classes.Jo0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jo1',
////    TypeInfo(Androidapi.JNI.classes.Jo1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jo2',
////    TypeInfo(Androidapi.JNI.classes.Jo2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jo3',
////    TypeInfo(Androidapi.JNI.classes.Jo3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jo4',
////    TypeInfo(Androidapi.JNI.classes.Jo4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jo5',
////    TypeInfo(Androidapi.JNI.classes.Jo5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jo6',
////    TypeInfo(Androidapi.JNI.classes.Jo6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jo7',
////    TypeInfo(Androidapi.JNI.classes.Jo7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jo8',
////    TypeInfo(Androidapi.JNI.classes.Jo8));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp',
////    TypeInfo(Androidapi.JNI.classes.Jp));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp0',
////    TypeInfo(Androidapi.JNI.classes.Jp0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp1_a',
////    TypeInfo(Androidapi.JNI.classes.Jp1_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp1_b',
////    TypeInfo(Androidapi.JNI.classes.Jp1_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp1',
////    TypeInfo(Androidapi.JNI.classes.Jp1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp2',
////    TypeInfo(Androidapi.JNI.classes.Jp2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp3',
////    TypeInfo(Androidapi.JNI.classes.Jp3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp4',
////    TypeInfo(Androidapi.JNI.classes.Jp4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp5',
////    TypeInfo(Androidapi.JNI.classes.Jp5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp6',
////    TypeInfo(Androidapi.JNI.classes.Jp6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jp7',
////    TypeInfo(Androidapi.JNI.classes.Jp7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq',
////    TypeInfo(Androidapi.JNI.classes.Jq));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq0',
////    TypeInfo(Androidapi.JNI.classes.Jq0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq1_a',
////    TypeInfo(Androidapi.JNI.classes.Jq1_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq1',
////    TypeInfo(Androidapi.JNI.classes.Jq1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq2',
////    TypeInfo(Androidapi.JNI.classes.Jq2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq3',
////    TypeInfo(Androidapi.JNI.classes.Jq3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq4',
////    TypeInfo(Androidapi.JNI.classes.Jq4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq5_a',
////    TypeInfo(Androidapi.JNI.classes.Jq5_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq5',
////    TypeInfo(Androidapi.JNI.classes.Jq5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq6',
////    TypeInfo(Androidapi.JNI.classes.Jq6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jq7',
////    TypeInfo(Androidapi.JNI.classes.Jq7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr',
////    TypeInfo(Androidapi.JNI.classes.Jr));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr0',
////    TypeInfo(Androidapi.JNI.classes.Jr0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr1_a',
////    TypeInfo(Androidapi.JNI.classes.Jr1_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr1_b',
////    TypeInfo(Androidapi.JNI.classes.Jr1_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr1',
////    TypeInfo(Androidapi.JNI.classes.Jr1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr2',
////    TypeInfo(Androidapi.JNI.classes.Jr2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr3',
////    TypeInfo(Androidapi.JNI.classes.Jr3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr4',
////    TypeInfo(Androidapi.JNI.classes.Jr4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr5',
////    TypeInfo(Androidapi.JNI.classes.Jr5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr6',
////    TypeInfo(Androidapi.JNI.classes.Jr6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jr7',
////    TypeInfo(Androidapi.JNI.classes.Jr7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js',
////    TypeInfo(Androidapi.JNI.classes.Js));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js0_a',
////    TypeInfo(Androidapi.JNI.classes.Js0_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js0',
////    TypeInfo(Androidapi.JNI.classes.Js0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js1_a',
////    TypeInfo(Androidapi.JNI.classes.Js1_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js1',
////    TypeInfo(Androidapi.JNI.classes.Js1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js2',
////    TypeInfo(Androidapi.JNI.classes.Js2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js3',
////    TypeInfo(Androidapi.JNI.classes.Js3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js4',
////    TypeInfo(Androidapi.JNI.classes.Js4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js5',
////    TypeInfo(Androidapi.JNI.classes.Js5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js6_a',
////    TypeInfo(Androidapi.JNI.classes.Js6_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js6',
////    TypeInfo(Androidapi.JNI.classes.Js6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Js7',
////    TypeInfo(Androidapi.JNI.classes.Js7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt',
////    TypeInfo(Androidapi.JNI.classes.Jt));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt0',
////    TypeInfo(Androidapi.JNI.classes.Jt0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt1_a',
////    TypeInfo(Androidapi.JNI.classes.Jt1_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt1_b',
////    TypeInfo(Androidapi.JNI.classes.Jt1_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt1',
////    TypeInfo(Androidapi.JNI.classes.Jt1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt2',
////    TypeInfo(Androidapi.JNI.classes.Jt2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt3',
////    TypeInfo(Androidapi.JNI.classes.Jt3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt4',
////    TypeInfo(Androidapi.JNI.classes.Jt4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt5',
////    TypeInfo(Androidapi.JNI.classes.Jt5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt6',
////    TypeInfo(Androidapi.JNI.classes.Jt6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jt7',
////    TypeInfo(Androidapi.JNI.classes.Jt7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju',
////    TypeInfo(Androidapi.JNI.classes.Ju));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju0',
////    TypeInfo(Androidapi.JNI.classes.Ju0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju1',
////    TypeInfo(Androidapi.JNI.classes.Ju1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju2',
////    TypeInfo(Androidapi.JNI.classes.Ju2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju3_a',
////    TypeInfo(Androidapi.JNI.classes.Ju3_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju3_b',
////    TypeInfo(Androidapi.JNI.classes.Ju3_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju3',
////    TypeInfo(Androidapi.JNI.classes.Ju3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju4',
////    TypeInfo(Androidapi.JNI.classes.Ju4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju5',
////    TypeInfo(Androidapi.JNI.classes.Ju5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju6_a',
////    TypeInfo(Androidapi.JNI.classes.Ju6_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju6',
////    TypeInfo(Androidapi.JNI.classes.Ju6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Ju7',
////    TypeInfo(Androidapi.JNI.classes.Ju7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv',
////    TypeInfo(Androidapi.JNI.classes.Jv));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv0',
////    TypeInfo(Androidapi.JNI.classes.Jv0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv1',
////    TypeInfo(Androidapi.JNI.classes.Jv1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv2',
////    TypeInfo(Androidapi.JNI.classes.Jv2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv3_a',
////    TypeInfo(Androidapi.JNI.classes.Jv3_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv3_b',
////    TypeInfo(Androidapi.JNI.classes.Jv3_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv3',
////    TypeInfo(Androidapi.JNI.classes.Jv3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv4',
////    TypeInfo(Androidapi.JNI.classes.Jv4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv5',
////    TypeInfo(Androidapi.JNI.classes.Jv5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv6',
////    TypeInfo(Androidapi.JNI.classes.Jv6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jv7',
////    TypeInfo(Androidapi.JNI.classes.Jv7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw',
////    TypeInfo(Androidapi.JNI.classes.Jw));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw0',
////    TypeInfo(Androidapi.JNI.classes.Jw0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw1',
////    TypeInfo(Androidapi.JNI.classes.Jw1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw2_a',
////    TypeInfo(Androidapi.JNI.classes.Jw2_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw2',
////    TypeInfo(Androidapi.JNI.classes.Jw2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw3_a',
////    TypeInfo(Androidapi.JNI.classes.Jw3_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw3_b',
////    TypeInfo(Androidapi.JNI.classes.Jw3_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw3_c',
////    TypeInfo(Androidapi.JNI.classes.Jw3_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw3_d_a',
////    TypeInfo(Androidapi.JNI.classes.Jw3_d_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw3_d_b',
////    TypeInfo(Androidapi.JNI.classes.Jw3_d_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw3_d_c_a',
////    TypeInfo(Androidapi.JNI.classes.Jw3_d_c_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw3_d_c_b',
////    TypeInfo(Androidapi.JNI.classes.Jw3_d_c_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw3_d_c',
////    TypeInfo(Androidapi.JNI.classes.Jw3_d_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw3_d',
////    TypeInfo(Androidapi.JNI.classes.Jw3_d));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw3',
////    TypeInfo(Androidapi.JNI.classes.Jw3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw4',
////    TypeInfo(Androidapi.JNI.classes.Jw4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw5',
////    TypeInfo(Androidapi.JNI.classes.Jw5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw6',
////    TypeInfo(Androidapi.JNI.classes.Jw6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jw7',
////    TypeInfo(Androidapi.JNI.classes.Jw7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jx',
////    TypeInfo(Androidapi.JNI.classes.Jx));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jx0',
////    TypeInfo(Androidapi.JNI.classes.Jx0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jx1',
////    TypeInfo(Androidapi.JNI.classes.Jx1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jx2',
////    TypeInfo(Androidapi.JNI.classes.Jx2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jx3_a',
////    TypeInfo(Androidapi.JNI.classes.Jx3_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jx3',
////    TypeInfo(Androidapi.JNI.classes.Jx3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jx4',
////    TypeInfo(Androidapi.JNI.classes.Jx4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jx5',
////    TypeInfo(Androidapi.JNI.classes.Jx5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jx6',
////    TypeInfo(Androidapi.JNI.classes.Jx6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jx7',
////    TypeInfo(Androidapi.JNI.classes.Jx7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jy',
////    TypeInfo(Androidapi.JNI.classes.Jy));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jy0',
////    TypeInfo(Androidapi.JNI.classes.Jy0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jy1',
////    TypeInfo(Androidapi.JNI.classes.Jy1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jy2',
////    TypeInfo(Androidapi.JNI.classes.Jy2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jy3',
////    TypeInfo(Androidapi.JNI.classes.Jy3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jy4',
////    TypeInfo(Androidapi.JNI.classes.Jy4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jy5',
////    TypeInfo(Androidapi.JNI.classes.Jy5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jy6',
////    TypeInfo(Androidapi.JNI.classes.Jy6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jy7',
////    TypeInfo(Androidapi.JNI.classes.Jy7));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz',
////    TypeInfo(Androidapi.JNI.classes.Jz));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz0',
////    TypeInfo(Androidapi.JNI.classes.Jz0));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz1',
////    TypeInfo(Androidapi.JNI.classes.Jz1));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz2',
////    TypeInfo(Androidapi.JNI.classes.Jz2));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz3',
////    TypeInfo(Androidapi.JNI.classes.Jz3));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz4',
////    TypeInfo(Androidapi.JNI.classes.Jz4));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz5',
////    TypeInfo(Androidapi.JNI.classes.Jz5));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz6',
////    TypeInfo(Androidapi.JNI.classes.Jz6));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz7_a',
////    TypeInfo(Androidapi.JNI.classes.Jz7_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz7_b',
////    TypeInfo(Androidapi.JNI.classes.Jz7_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz7_c',
////    TypeInfo(Androidapi.JNI.classes.Jz7_c));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.Jz7',
////    TypeInfo(Androidapi.JNI.classes.Jz7));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JProviderRemoteView',
//    TypeInfo(Androidapi.JNI.classes.JProviderRemoteView));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JLoadOpencvJNIUtil',
//    TypeInfo(Androidapi.JNI.classes.JLoadOpencvJNIUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JOpencvJNI',
//    TypeInfo(Androidapi.JNI.classes.JOpencvJNI));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JViewfinderView_a',
////    TypeInfo(Androidapi.JNI.classes.JViewfinderView_a));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JViewfinderView_b',
////    TypeInfo(Androidapi.JNI.classes.JViewfinderView_b));
////  TRegTypes.RegisterType('Androidapi.JNI.classes.JViewfinderView_c',
////    TypeInfo(Androidapi.JNI.classes.JViewfinderView_c));
//  TRegTypes.RegisterType('Androidapi.JNI.classes.JViewfinderView',
//    TypeInfo(Androidapi.JNI.classes.JViewfinderView));
//end;
//
//
//initialization
//  RegisterTypes;
//
end.
