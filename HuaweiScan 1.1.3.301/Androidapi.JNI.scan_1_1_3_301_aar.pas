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
//  生成时间：2020-10-21 20:36:40
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.scan_1_1_3_301_aar;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.Util,
  Androidapi.JNI.Hardware;
//  Androidapi.JNI.com.huawei.hms.mlsdk.common.MLFrame,
//  Androidapi.JNI.com.huawei.hmf.tasks.Task,
//  Androidapi.JNI.com.huawei.hms.ml.camera.CameraManager,
//  Androidapi.JNI.java.nio.ByteBuffer,
//  Androidapi.JNI.java.nio.charset.Charset,
//  Androidapi.JNI.com.huawei.hms.feature.dynamic.IObjectWrapper,


type

// ===== Forward declarations =====

  JDynamicModuleInitializer = interface; //com.huawei.hms.feature.DynamicModuleInitializer
//  Ja = interface; //com.huawei.hms.hmsscankit.a
  JIOnLightCallback_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IOnLightCallback$Stub$Proxy
  JIOnLightCallback_Stub = interface; //com.huawei.hms.hmsscankit.api.IOnLightCallback$Stub
  JIOnLightCallback = interface; //com.huawei.hms.hmsscankit.api.IOnLightCallback
  JIOnResultCallback_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IOnResultCallback$Stub$Proxy
  JIOnResultCallback_Stub = interface; //com.huawei.hms.hmsscankit.api.IOnResultCallback$Stub
  JIOnResultCallback = interface; //com.huawei.hms.hmsscankit.api.IOnResultCallback
  JIRemoteCreator_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteCreator$Stub$Proxy
  JIRemoteCreator_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteCreator$Stub
  JIRemoteCreator = interface; //com.huawei.hms.hmsscankit.api.IRemoteCreator
  JIRemoteDecoderDelegate_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate$Stub$Proxy
  JIRemoteDecoderDelegate_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate$Stub
  JIRemoteDecoderDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate
  JIRemoteHmsDecoderDelegate_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$Stub$Proxy
  JIRemoteHmsDecoderDelegate_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$Stub
  JIRemoteHmsDecoderDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate
  JIRemoteViewDelegate_Stub_Proxy = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$Stub$Proxy
  JIRemoteViewDelegate_Stub = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$Stub
  JIRemoteViewDelegate = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate
//  Jb = interface; //com.huawei.hms.hmsscankit.b
//  Jc = interface; //com.huawei.hms.hmsscankit.c
//  Jd = interface; //com.huawei.hms.hmsscankit.d
//  JDetailRect_1 = interface; //com.huawei.hms.hmsscankit.DetailRect$1
  JDetailRect = interface; //com.huawei.hms.hmsscankit.DetailRect
//  Je_1 = interface; //com.huawei.hms.hmsscankit.e$1
//  Je = interface; //com.huawei.hms.hmsscankit.e
//  Jf = interface; //com.huawei.hms.hmsscankit.f
  JOnLightVisibleCallBack = interface; //com.huawei.hms.hmsscankit.OnLightVisibleCallBack
  JOnResultCallback = interface; //com.huawei.hms.hmsscankit.OnResultCallback
//  JRemoteView_a_1 = interface; //com.huawei.hms.hmsscankit.RemoteView$a$1
//  JRemoteView_a_2 = interface; //com.huawei.hms.hmsscankit.RemoteView$a$2
//  JRemoteView_a = interface; //com.huawei.hms.hmsscankit.RemoteView$a
//  JRemoteView_b = interface; //com.huawei.hms.hmsscankit.RemoteView$b
  JRemoteView_Builder = interface; //com.huawei.hms.hmsscankit.RemoteView$Builder
//  JRemoteView = interface; //com.huawei.hms.hmsscankit.RemoteView
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
//  JHmsScan_BookMarkInfo_1 = interface; //com.huawei.hms.ml.scan.HmsScan$BookMarkInfo$1
  JHmsScan_BookMarkInfo = interface; //com.huawei.hms.ml.scan.HmsScan$BookMarkInfo
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
//  JHmsScan_VehicleInfo_1 = interface; //com.huawei.hms.ml.scan.HmsScan$VehicleInfo$1
  JHmsScan_VehicleInfo = interface; //com.huawei.hms.ml.scan.HmsScan$VehicleInfo
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
//  Ja_088 = interface; //com.huawei.hms.scankit.a
//  Jb_a = interface; //com.huawei.hms.scankit.b$a
//  Jb_090 = interface; //com.huawei.hms.scankit.b
//  Jc_1 = interface; //com.huawei.hms.scankit.c$1
//  Jc_2 = interface; //com.huawei.hms.scankit.c$2
//  Jc_093 = interface; //com.huawei.hms.scankit.c
  JCreator = interface; //com.huawei.hms.scankit.Creator
//  Jd_095 = interface; //com.huawei.hms.scankit.d
//  Je_a = interface; //com.huawei.hms.scankit.e$a
//  Je_097 = interface; //com.huawei.hms.scankit.e
//  Jf_098 = interface; //com.huawei.hms.scankit.f
//  Jg = interface; //com.huawei.hms.scankit.g
//  Jh = interface; //com.huawei.hms.scankit.h
//  Ji = interface; //com.huawei.hms.scankit.i
//  Jj_1 = interface; //com.huawei.hms.scankit.j$1
//  Jj_2 = interface; //com.huawei.hms.scankit.j$2
//  Jj = interface; //com.huawei.hms.scankit.j
//  Jk = interface; //com.huawei.hms.scankit.k
//  Jl = interface; //com.huawei.hms.scankit.l
//  Jm_1 = interface; //com.huawei.hms.scankit.m$1
//  Jm_2 = interface; //com.huawei.hms.scankit.m$2
//  Jm = interface; //com.huawei.hms.scankit.m
//  Jn = interface; //com.huawei.hms.scankit.n
//  Jo = interface; //com.huawei.hms.scankit.o
//  Ja_112 = interface; //com.huawei.hms.scankit.p.a
//  Jaa = interface; //com.huawei.hms.scankit.p.aa
//  Jab = interface; //com.huawei.hms.scankit.p.ab
//  Jac = interface; //com.huawei.hms.scankit.p.ac
//  Jad = interface; //com.huawei.hms.scankit.p.ad
//  Jae = interface; //com.huawei.hms.scankit.p.ae
//  Jaf = interface; //com.huawei.hms.scankit.p.af
//  Jag = interface; //com.huawei.hms.scankit.p.ag
//  Jah = interface; //com.huawei.hms.scankit.p.ah
//  Jai = interface; //com.huawei.hms.scankit.p.ai
//  Jaj = interface; //com.huawei.hms.scankit.p.aj
//  Jak = interface; //com.huawei.hms.scankit.p.ak
//  Jal = interface; //com.huawei.hms.scankit.p.al
//  Jam = interface; //com.huawei.hms.scankit.p.am
//  Jan = interface; //com.huawei.hms.scankit.p.an
//  Jao = interface; //com.huawei.hms.scankit.p.ao
//  Jap = interface; //com.huawei.hms.scankit.p.ap
//  Jaq_1 = interface; //com.huawei.hms.scankit.p.aq$1
//  Jaq_a = interface; //com.huawei.hms.scankit.p.aq$a
//  Jaq = interface; //com.huawei.hms.scankit.p.aq
//  Jar = interface; //com.huawei.hms.scankit.p.ar
//  Jas = interface; //com.huawei.hms.scankit.p.as
//  Jat_1 = interface; //com.huawei.hms.scankit.p.at$1
//  Jat_a = interface; //com.huawei.hms.scankit.p.at$a
//  Jat_b = interface; //com.huawei.hms.scankit.p.at$b
//  Jat = interface; //com.huawei.hms.scankit.p.at
//  Jau = interface; //com.huawei.hms.scankit.p.au
//  Jav = interface; //com.huawei.hms.scankit.p.av
//  Jaw = interface; //com.huawei.hms.scankit.p.aw
//  Jax = interface; //com.huawei.hms.scankit.p.ax
//  Jay = interface; //com.huawei.hms.scankit.p.ay
//  Jaz = interface; //com.huawei.hms.scankit.p.az
//  Jb_144 = interface; //com.huawei.hms.scankit.p.b
//  Jba = interface; //com.huawei.hms.scankit.p.ba
//  Jbb = interface; //com.huawei.hms.scankit.p.bb
//  Jbc = interface; //com.huawei.hms.scankit.p.bc
//  Jbd = interface; //com.huawei.hms.scankit.p.bd
//  Jbe = interface; //com.huawei.hms.scankit.p.be
//  Jbf = interface; //com.huawei.hms.scankit.p.bf
//  Jbg = interface; //com.huawei.hms.scankit.p.bg
//  Jbh = interface; //com.huawei.hms.scankit.p.bh
//  Jbi = interface; //com.huawei.hms.scankit.p.bi
//  Jbj = interface; //com.huawei.hms.scankit.p.bj
//  Jbk = interface; //com.huawei.hms.scankit.p.bk
//  Jbl = interface; //com.huawei.hms.scankit.p.bl
//  Jbm = interface; //com.huawei.hms.scankit.p.bm
//  Jbn = interface; //com.huawei.hms.scankit.p.bn
//  Jbo = interface; //com.huawei.hms.scankit.p.bo
//  Jbp = interface; //com.huawei.hms.scankit.p.bp
//  Jbq = interface; //com.huawei.hms.scankit.p.bq
//  Jbr_1 = interface; //com.huawei.hms.scankit.p.br$1
//  Jbr_a = interface; //com.huawei.hms.scankit.p.br$a
//  Jbr = interface; //com.huawei.hms.scankit.p.br
//  Jbs = interface; //com.huawei.hms.scankit.p.bs
//  Jbt = interface; //com.huawei.hms.scankit.p.bt
//  Jbu = interface; //com.huawei.hms.scankit.p.bu
//  Jbv = interface; //com.huawei.hms.scankit.p.bv
//  Jbw = interface; //com.huawei.hms.scankit.p.bw
//  Jbx = interface; //com.huawei.hms.scankit.p.bx
//  Jby = interface; //com.huawei.hms.scankit.p.by
//  Jbz = interface; //com.huawei.hms.scankit.p.bz
//  Jc_1_173 = interface; //com.huawei.hms.scankit.p.c$1
//  Jc_a = interface; //com.huawei.hms.scankit.p.c$a
//  Jc_175 = interface; //com.huawei.hms.scankit.p.c
//  Jca = interface; //com.huawei.hms.scankit.p.ca
//  Jcb = interface; //com.huawei.hms.scankit.p.cb
//  Jcc = interface; //com.huawei.hms.scankit.p.cc
//  Jcd = interface; //com.huawei.hms.scankit.p.cd
//  Jce = interface; //com.huawei.hms.scankit.p.ce
//  Jcf = interface; //com.huawei.hms.scankit.p.cf
//  Jcg = interface; //com.huawei.hms.scankit.p.cg
//  Jch = interface; //com.huawei.hms.scankit.p.ch
//  Jci = interface; //com.huawei.hms.scankit.p.ci
//  Jcj_1 = interface; //com.huawei.hms.scankit.p.cj$1
//  Jcj_2 = interface; //com.huawei.hms.scankit.p.cj$2
//  Jcj_3 = interface; //com.huawei.hms.scankit.p.cj$3
//  Jcj_4 = interface; //com.huawei.hms.scankit.p.cj$4
//  Jcj_5 = interface; //com.huawei.hms.scankit.p.cj$5
//  Jcj_6 = interface; //com.huawei.hms.scankit.p.cj$6
//  Jcj_7 = interface; //com.huawei.hms.scankit.p.cj$7
//  Jcj_8 = interface; //com.huawei.hms.scankit.p.cj$8
//  Jcj = interface; //com.huawei.hms.scankit.p.cj
//  Jck_1 = interface; //com.huawei.hms.scankit.p.ck$1
//  Jck = interface; //com.huawei.hms.scankit.p.ck
//  Jcl = interface; //com.huawei.hms.scankit.p.cl
//  Jcm = interface; //com.huawei.hms.scankit.p.cm
//  Jcn = interface; //com.huawei.hms.scankit.p.cn
//  Jco = interface; //com.huawei.hms.scankit.p.co
//  Jcp_1 = interface; //com.huawei.hms.scankit.p.cp$1
//  Jcp_a = interface; //com.huawei.hms.scankit.p.cp$a
//  Jcp_b = interface; //com.huawei.hms.scankit.p.cp$b
//  Jcp_c = interface; //com.huawei.hms.scankit.p.cp$c
//  Jcp = interface; //com.huawei.hms.scankit.p.cp
//  Jcq = interface; //com.huawei.hms.scankit.p.cq
//  Jcr = interface; //com.huawei.hms.scankit.p.cr
//  Jcs = interface; //com.huawei.hms.scankit.p.cs
//  Jct = interface; //com.huawei.hms.scankit.p.ct
//  Jcu = interface; //com.huawei.hms.scankit.p.cu
//  Jcv_a = interface; //com.huawei.hms.scankit.p.cv$a
//  Jcv_b = interface; //com.huawei.hms.scankit.p.cv$b
//  Jcv = interface; //com.huawei.hms.scankit.p.cv
//  Jcw = interface; //com.huawei.hms.scankit.p.cw
//  Jcx = interface; //com.huawei.hms.scankit.p.cx
//  Jcy = interface; //com.huawei.hms.scankit.p.cy
//  Jcz = interface; //com.huawei.hms.scankit.p.cz
//  Jd_a = interface; //com.huawei.hms.scankit.p.d$a
//  Jd_218 = interface; //com.huawei.hms.scankit.p.d
//  Jda = interface; //com.huawei.hms.scankit.p.da
//  Jdb_1 = interface; //com.huawei.hms.scankit.p.db$1
//  Jdb_2 = interface; //com.huawei.hms.scankit.p.db$2
//  Jdb = interface; //com.huawei.hms.scankit.p.db
//  Jdc_1 = interface; //com.huawei.hms.scankit.p.dc$1
//  Jdc_2 = interface; //com.huawei.hms.scankit.p.dc$2
//  Jdc = interface; //com.huawei.hms.scankit.p.dc
//  Jdd_1 = interface; //com.huawei.hms.scankit.p.dd$1
//  Jdd_2 = interface; //com.huawei.hms.scankit.p.dd$2
//  Jdd_a = interface; //com.huawei.hms.scankit.p.dd$a
//  Jdd_b_1 = interface; //com.huawei.hms.scankit.p.dd$b$1
//  Jdd_b_a = interface; //com.huawei.hms.scankit.p.dd$b$a
//  Jdd_b_b_1 = interface; //com.huawei.hms.scankit.p.dd$b$b$1
//  Jdd_b_b_2 = interface; //com.huawei.hms.scankit.p.dd$b$b$2
//  Jdd_b_b = interface; //com.huawei.hms.scankit.p.dd$b$b
//  Jdd_b = interface; //com.huawei.hms.scankit.p.dd$b
//  Jdd = interface; //com.huawei.hms.scankit.p.dd
//  Jde_1 = interface; //com.huawei.hms.scankit.p.de$1
//  Jde = interface; //com.huawei.hms.scankit.p.de
//  Jdf = interface; //com.huawei.hms.scankit.p.df
//  Jdg_1 = interface; //com.huawei.hms.scankit.p.dg$1
//  Jdg_a = interface; //com.huawei.hms.scankit.p.dg$a
//  Jdg_b = interface; //com.huawei.hms.scankit.p.dg$b
//  Jdg = interface; //com.huawei.hms.scankit.p.dg
//  Jdh = interface; //com.huawei.hms.scankit.p.dh
//  Jdi = interface; //com.huawei.hms.scankit.p.di
//  Jdj = interface; //com.huawei.hms.scankit.p.dj
//  Jdk = interface; //com.huawei.hms.scankit.p.dk
//  Jdl_1 = interface; //com.huawei.hms.scankit.p.dl$1
//  Jdl = interface; //com.huawei.hms.scankit.p.dl
//  Jdm = interface; //com.huawei.hms.scankit.p.dm
//  Jdn = interface; //com.huawei.hms.scankit.p.dn
//  Jdo = interface; //com.huawei.hms.scankit.p.do
//  Jdp = interface; //com.huawei.hms.scankit.p.dp
//  Jdq = interface; //com.huawei.hms.scankit.p.dq
//  Jdr = interface; //com.huawei.hms.scankit.p.dr
//  Jds = interface; //com.huawei.hms.scankit.p.ds
//  Jdt = interface; //com.huawei.hms.scankit.p.dt
//  Jdu = interface; //com.huawei.hms.scankit.p.du
//  Jdv = interface; //com.huawei.hms.scankit.p.dv
//  Jdw = interface; //com.huawei.hms.scankit.p.dw
//  Jdx = interface; //com.huawei.hms.scankit.p.dx
//  Jdy = interface; //com.huawei.hms.scankit.p.dy
//  Jdz = interface; //com.huawei.hms.scankit.p.dz
//  Je_263 = interface; //com.huawei.hms.scankit.p.e
//  Jea = interface; //com.huawei.hms.scankit.p.ea
//  Jeb_1 = interface; //com.huawei.hms.scankit.p.eb$1
//  Jeb = interface; //com.huawei.hms.scankit.p.eb
//  Jec = interface; //com.huawei.hms.scankit.p.ec
//  Jed = interface; //com.huawei.hms.scankit.p.ed
//  Jee = interface; //com.huawei.hms.scankit.p.ee
//  Jef = interface; //com.huawei.hms.scankit.p.ef
//  Jeg = interface; //com.huawei.hms.scankit.p.eg
//  Jeh_a = interface; //com.huawei.hms.scankit.p.eh$a
//  Jeh = interface; //com.huawei.hms.scankit.p.eh
//  Jei = interface; //com.huawei.hms.scankit.p.ei
//  Jej = interface; //com.huawei.hms.scankit.p.ej
//  Jek = interface; //com.huawei.hms.scankit.p.ek
//  Jel = interface; //com.huawei.hms.scankit.p.el
//  Jem = interface; //com.huawei.hms.scankit.p.em
//  Jen = interface; //com.huawei.hms.scankit.p.en
//  Jeo = interface; //com.huawei.hms.scankit.p.eo
//  Jep = interface; //com.huawei.hms.scankit.p.ep
//  Jeq = interface; //com.huawei.hms.scankit.p.eq
//  Jer = interface; //com.huawei.hms.scankit.p.er
//  Jes = interface; //com.huawei.hms.scankit.p.es
//  Jet = interface; //com.huawei.hms.scankit.p.et
//  Jeu = interface; //com.huawei.hms.scankit.p.eu
//  Jev = interface; //com.huawei.hms.scankit.p.ev
//  Jew = interface; //com.huawei.hms.scankit.p.ew
//  Jex = interface; //com.huawei.hms.scankit.p.ex
//  Jey = interface; //com.huawei.hms.scankit.p.ey
//  Jez = interface; //com.huawei.hms.scankit.p.ez
//  Jf_292 = interface; //com.huawei.hms.scankit.p.f
//  Jfa = interface; //com.huawei.hms.scankit.p.fa
//  Jfb_a = interface; //com.huawei.hms.scankit.p.fb$a
//  Jfb = interface; //com.huawei.hms.scankit.p.fb
//  Jfc = interface; //com.huawei.hms.scankit.p.fc
//  Jfd = interface; //com.huawei.hms.scankit.p.fd
//  Jfe = interface; //com.huawei.hms.scankit.p.fe
//  Jff = interface; //com.huawei.hms.scankit.p.ff
//  Jfg = interface; //com.huawei.hms.scankit.p.fg
//  Jfh = interface; //com.huawei.hms.scankit.p.fh
//  Jfi = interface; //com.huawei.hms.scankit.p.fi
//  Jfj = interface; //com.huawei.hms.scankit.p.fj
//  Jfk = interface; //com.huawei.hms.scankit.p.fk
//  Jfl = interface; //com.huawei.hms.scankit.p.fl
//  Jfm = interface; //com.huawei.hms.scankit.p.fm
//  Jfn = interface; //com.huawei.hms.scankit.p.fn
//  Jfo = interface; //com.huawei.hms.scankit.p.fo
//  Jfp = interface; //com.huawei.hms.scankit.p.fp
//  Jfq = interface; //com.huawei.hms.scankit.p.fq
//  Jfr = interface; //com.huawei.hms.scankit.p.fr
//  Jfs_1 = interface; //com.huawei.hms.scankit.p.fs$1
//  Jfs = interface; //com.huawei.hms.scankit.p.fs
//  Jft = interface; //com.huawei.hms.scankit.p.ft
//  Jfu = interface; //com.huawei.hms.scankit.p.fu
//  Jfv = interface; //com.huawei.hms.scankit.p.fv
//  Jfw = interface; //com.huawei.hms.scankit.p.fw
//  Jfx_1 = interface; //com.huawei.hms.scankit.p.fx$1
//  Jfx = interface; //com.huawei.hms.scankit.p.fx
//  Jfy = interface; //com.huawei.hms.scankit.p.fy
//  Jfz = interface; //com.huawei.hms.scankit.p.fz
//  Jg_322 = interface; //com.huawei.hms.scankit.p.g
//  Jga = interface; //com.huawei.hms.scankit.p.ga
//  Jh_324 = interface; //com.huawei.hms.scankit.p.h
//  Ji_325 = interface; //com.huawei.hms.scankit.p.i
//  Jj_326 = interface; //com.huawei.hms.scankit.p.j
//  Jk_327 = interface; //com.huawei.hms.scankit.p.k
//  Jl_328 = interface; //com.huawei.hms.scankit.p.l
//  Jm_329 = interface; //com.huawei.hms.scankit.p.m
//  Jn_330 = interface; //com.huawei.hms.scankit.p.n
//  Jo_331 = interface; //com.huawei.hms.scankit.p.o
//  Jp = interface; //com.huawei.hms.scankit.p.p
//  Jq = interface; //com.huawei.hms.scankit.p.q
//  Jr = interface; //com.huawei.hms.scankit.p.r
//  Js = interface; //com.huawei.hms.scankit.p.s
//  Jt = interface; //com.huawei.hms.scankit.p.t
//  Ju = interface; //com.huawei.hms.scankit.p.u
//  Jv = interface; //com.huawei.hms.scankit.p.v
//  Jw = interface; //com.huawei.hms.scankit.p.w
//  Jx = interface; //com.huawei.hms.scankit.p.x
//  Jy = interface; //com.huawei.hms.scankit.p.y
//  Jz = interface; //com.huawei.hms.scankit.p.z
//  Jp_343 = interface; //com.huawei.hms.scankit.p
//  JProviderRemoteView = interface; //com.huawei.hms.scankit.ProviderRemoteView
//  Jq_345 = interface; //com.huawei.hms.scankit.q
//  Js_346 = interface; //com.huawei.hms.scankit.s
//  Jt_347 = interface; //com.huawei.hms.scankit.t
//  Ju_348 = interface; //com.huawei.hms.scankit.u
//  Ja_349 = interface; //com.huawei.hms.scankit.util.a
//  Jb_350 = interface; //com.huawei.hms.scankit.util.b
//  Jc_351 = interface; //com.huawei.hms.scankit.util.c
  JLoadOpencvJNIUtil = interface; //com.huawei.hms.scankit.util.LoadOpencvJNIUtil
  JOpencvJNI = interface; //com.huawei.hms.scankit.util.OpencvJNI
//  JViewfinderView_1 = interface; //com.huawei.hms.scankit.ViewfinderView$1
//  JViewfinderView_a = interface; //com.huawei.hms.scankit.ViewfinderView$a
//  JViewfinderView_b = interface; //com.huawei.hms.scankit.ViewfinderView$b
  JViewfinderView = interface; //com.huawei.hms.scankit.ViewfinderView

// ===== Forward SuperClasses declarations =====

  JIOnLightCallback_StubClass = interface; //com.huawei.hms.hmsscankit.api.IOnLightCallback$Stub
  JIOnResultCallback_StubClass = interface; //com.huawei.hms.hmsscankit.api.IOnResultCallback$Stub
  JHmsScanBaseClass = interface; //com.huawei.hms.ml.scan.HmsScanBase
  JIRemoteCreator_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteCreator$Stub
  JIRemoteViewDelegate_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteViewDelegate$Stub
  JIRemoteDecoderDelegate_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteDecoderDelegate$Stub
  JIRemoteHmsDecoderDelegate_StubClass = interface; //com.huawei.hms.hmsscankit.api.IRemoteHmsDecoderDelegate$Stub
//  JjClass = interface; //com.huawei.hms.scankit.j
//  Jk_327Class = interface; //com.huawei.hms.scankit.p.k
//  JagClass = interface; //com.huawei.hms.scankit.p.ag
//  JalClass = interface; //com.huawei.hms.scankit.p.al
//  JbgClass = interface; //com.huawei.hms.scankit.p.bg
//  JblClass = interface; //com.huawei.hms.scankit.p.bl
//  JbtClass = interface; //com.huawei.hms.scankit.p.bt
//  JaaClass = interface; //com.huawei.hms.scankit.p.aa
//  JcjClass = interface; //com.huawei.hms.scankit.p.cj
//  JdbClass = interface; //com.huawei.hms.scankit.p.db
//  JdtClass = interface; //com.huawei.hms.scankit.p.dt
//  JekClass = interface; //com.huawei.hms.scankit.p.ek
//  JewClass = interface; //com.huawei.hms.scankit.p.ew
//  JeoClass = interface; //com.huawei.hms.scankit.p.eo
//  JfhClass = interface; //com.huawei.hms.scankit.p.fh
//  JfjClass = interface; //com.huawei.hms.scankit.p.fj
//  Jn_330Class = interface; //com.huawei.hms.scankit.p.n
//  JqClass = interface; //com.huawei.hms.scankit.p.q

// ===== Interface declarations =====

  JDynamicModuleInitializerClass = interface(JObjectClass)
  ['{5D3D44FA-709E-4496-A032-9BC9E3186BFC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDynamicModuleInitializer; cdecl; //()V
    {class} procedure initializeModule(P1: JContext); cdecl; //(Landroid/content/Context;)V
    {class} function getContext: JContext; cdecl; //()Landroid/content/Context;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/feature/DynamicModuleInitializer')]
  JDynamicModuleInitializer = interface(JObject)
  ['{2F1E78D1-25BB-4F2C-AC10-CC8439271E83}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDynamicModuleInitializer = class(TJavaGenericImport<JDynamicModuleInitializerClass, JDynamicModuleInitializer>) end;

//  JaClass = interface(JObjectClass)
//  ['{83CDD15E-C7A0-444D-947B-740E3589742F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a; cdecl; overload; //()V
//    {class} function a(P1: Integer): Integer; cdecl; overload; //(I)I
//    {class} procedure a(P1: TJavaObjectArray<JHmsScan>); cdecl; overload; //([Lcom/huawei/hms/ml/scan/HmsScan;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/a')]
//  Ja = interface(JObject)
//  ['{6024A854-EE17-4FA9-9F1B-F87313683642}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;


  JIObjectWrapper  = interface(JObject)

  end;



  JIOnLightCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{0F12C36C-4B71-42E6-8AA5-9CA47CF9B626}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback$Stub$Proxy')]
  JIOnLightCallback_Stub_Proxy = interface(JObject)
  ['{764D781A-680F-4658-9EB4-096059CA6E3F}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
    procedure onVisibleChanged(P1: Boolean); cdecl; //(Z)V

    { Property }
  end;

  TJIOnLightCallback_Stub_Proxy = class(TJavaGenericImport<JIOnLightCallback_Stub_ProxyClass, JIOnLightCallback_Stub_Proxy>) end;

  JIOnLightCallback_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{FB89AD55-41BD-48A1-950B-9FADEABDB0AF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnLightCallback_Stub; cdecl; //()V
    {class} function asInterface(P1: JIBinder): JIOnLightCallback; cdecl; //(Landroid/os/IBinder;)Lcom/huawei/hms/hmsscankit/api/IOnLightCallback;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback$Stub')]
  JIOnLightCallback_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{66132291-95F6-4764-9A9E-423B15E691F4}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJIOnLightCallback_Stub = class(TJavaGenericImport<JIOnLightCallback_StubClass, JIOnLightCallback_Stub>) end;

  JIOnLightCallbackClass = interface(JObjectClass)
  ['{AD285445-32CE-4E94-8ABE-1FEAB3100023}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnLightCallback')]
  JIOnLightCallback = interface(IJavaInstance)
  ['{8CE0E2D1-E34C-4000-9B23-537D77F7F872}']
    { Property Methods }

    { methods }
    procedure onVisibleChanged(P1: Boolean); cdecl; //(Z)V

    { Property }
  end;

  TJIOnLightCallback = class(TJavaGenericImport<JIOnLightCallbackClass, JIOnLightCallback>) end;

  JIOnResultCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{00077EC4-3C39-4FCA-A836-F5B0A87E28C0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback$Stub$Proxy')]
  JIOnResultCallback_Stub_Proxy = interface(JObject)
  ['{D9DC476B-15B2-4510-9091-85F1B9D2BDE2}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl; //([Lcom/huawei/hms/ml/scan/HmsScan;)V

    { Property }
  end;

  TJIOnResultCallback_Stub_Proxy = class(TJavaGenericImport<JIOnResultCallback_Stub_ProxyClass, JIOnResultCallback_Stub_Proxy>) end;

  JIOnResultCallback_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{5C22C5D8-B15D-4EF0-A785-F45B78567717}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIOnResultCallback_Stub; cdecl; //()V
    {class} function asInterface(P1: JIBinder): JIOnResultCallback; cdecl; //(Landroid/os/IBinder;)Lcom/huawei/hms/hmsscankit/api/IOnResultCallback;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback$Stub')]
  JIOnResultCallback_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{EF3FB12C-DEE2-43F5-9888-424C06B59726}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJIOnResultCallback_Stub = class(TJavaGenericImport<JIOnResultCallback_StubClass, JIOnResultCallback_Stub>) end;

  JIOnResultCallbackClass = interface(JObjectClass)
  ['{4E915EF1-5B71-4840-B5EA-8A24EE80B6FA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IOnResultCallback')]
  JIOnResultCallback = interface(IJavaInstance)
  ['{EC026635-9D42-43B6-849E-C809D621AD6E}']
    { Property Methods }

    { methods }
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl; //([Lcom/huawei/hms/ml/scan/HmsScan;)V

    { Property }
  end;

  TJIOnResultCallback = class(TJavaGenericImport<JIOnResultCallbackClass, JIOnResultCallback>) end;

  JIRemoteCreator_Stub_ProxyClass = interface(JObjectClass)
  ['{B40174F6-F7F4-4273-BA68-0A2BEE59C6CE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator$Stub$Proxy')]
  JIRemoteCreator_Stub_Proxy = interface(JObject)
  ['{5BAFEB41-7548-4F2B-8C0B-53245B674AE8}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
//    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)Lcom/huawei/hms/hmsscankit/api/IRemoteViewDelegate;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl; //()Lcom/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl; //()Lcom/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate;

    { Property }
  end;

  TJIRemoteCreator_Stub_Proxy = class(TJavaGenericImport<JIRemoteCreator_Stub_ProxyClass, JIRemoteCreator_Stub_Proxy>) end;

  JIRemoteCreator_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{73F26FA0-D8AC-412A-B7A7-B3821CF51E0E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteCreator_Stub; cdecl; //()V
    {class} function asInterface(P1: JIBinder): JIRemoteCreator; cdecl; //(Landroid/os/IBinder;)Lcom/huawei/hms/hmsscankit/api/IRemoteCreator;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator$Stub')]
  JIRemoteCreator_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{4D15F267-4F91-49CD-A3AE-0FA3DC97C23A}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJIRemoteCreator_Stub = class(TJavaGenericImport<JIRemoteCreator_StubClass, JIRemoteCreator_Stub>) end;

  JIRemoteCreatorClass = interface(JObjectClass)
  ['{55B7E19B-E969-4DE8-8F2F-71D784EA6D04}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteCreator')]
  JIRemoteCreator = interface(IJavaInstance)
  ['{AC09228B-9755-4143-BC5F-4ADCC072A116}']
    { Property Methods }

    { methods }
//    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)Lcom/huawei/hms/hmsscankit/api/IRemoteViewDelegate;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl; //()Lcom/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl; //()Lcom/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate;

    { Property }
  end;

  TJIRemoteCreator = class(TJavaGenericImport<JIRemoteCreatorClass, JIRemoteCreator>) end;

  JIRemoteDecoderDelegate_Stub_ProxyClass = interface(JObjectClass)
  ['{F40E823B-42F9-46B7-9C84-E66F1AA83E36}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$Stub$Proxy')]
  JIRemoteDecoderDelegate_Stub_Proxy = interface(JObject)
  ['{3EFF80F2-69E0-4FE6-9F6B-7E04D46FCB0F}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)V
//    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)Lcom/huawei/hms/feature/dynamic/IObjectWrapper;

    { Property }
  end;

  TJIRemoteDecoderDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteDecoderDelegate_Stub_ProxyClass, JIRemoteDecoderDelegate_Stub_Proxy>) end;

  JIRemoteDecoderDelegate_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{403C29AD-42C4-462A-9351-4B30CABB2540}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteDecoderDelegate_Stub; cdecl; //()V
    {class} function asInterface(P1: JIBinder): JIRemoteDecoderDelegate; cdecl; //(Landroid/os/IBinder;)Lcom/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$Stub')]
  JIRemoteDecoderDelegate_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{74F2E0DB-D076-46A5-BCC2-1E79BAC8A750}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJIRemoteDecoderDelegate_Stub = class(TJavaGenericImport<JIRemoteDecoderDelegate_StubClass, JIRemoteDecoderDelegate_Stub>) end;

  JIRemoteDecoderDelegateClass = interface(JObjectClass)
  ['{EB477845-2751-44EF-B266-318527B15FBE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate')]
  JIRemoteDecoderDelegate = interface(IJavaInstance)
  ['{4A28C7FE-8774-42E0-9345-520EF24E83B5}']
    { Property Methods }

    { methods }
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)V
//    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)Lcom/huawei/hms/feature/dynamic/IObjectWrapper;

    { Property }
  end;

  TJIRemoteDecoderDelegate = class(TJavaGenericImport<JIRemoteDecoderDelegateClass, JIRemoteDecoderDelegate>) end;

  JIRemoteHmsDecoderDelegate_Stub_ProxyClass = interface(JObjectClass)
  ['{B80C028F-14CC-4D1D-A63E-90812E7C8940}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$Stub$Proxy')]
  JIRemoteHmsDecoderDelegate_Stub_Proxy = interface(JObject)
  ['{CC958A07-AEF9-4B05-9CEE-431A1BFEA5B1}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
//    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/hmsscankit/DetailRect;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/hmsscankit/DetailRect;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteHmsDecoderDelegate_Stub_ProxyClass, JIRemoteHmsDecoderDelegate_Stub_Proxy>) end;

  JIRemoteHmsDecoderDelegate_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{BE78BC9C-5E99-4F20-AABB-16381D59C143}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteHmsDecoderDelegate_Stub; cdecl; //()V
    {class} function asInterface(P1: JIBinder): JIRemoteHmsDecoderDelegate; cdecl; //(Landroid/os/IBinder;)Lcom/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$Stub')]
  JIRemoteHmsDecoderDelegate_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{635F03FA-ADE9-47A2-A021-2C8C3E1361A9}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate_Stub = class(TJavaGenericImport<JIRemoteHmsDecoderDelegate_StubClass, JIRemoteHmsDecoderDelegate_Stub>) end;

  JIRemoteHmsDecoderDelegateClass = interface(JObjectClass)
  ['{CD5F39DF-F871-41E3-9271-DB9856590C1D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate')]
  JIRemoteHmsDecoderDelegate = interface(IJavaInstance)
  ['{C3262972-519F-4650-9304-FEAE92D5E1E3}']
    { Property Methods }

    { methods }
//    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/hmsscankit/DetailRect;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/hmsscankit/DetailRect;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;

    { Property }
  end;

  TJIRemoteHmsDecoderDelegate = class(TJavaGenericImport<JIRemoteHmsDecoderDelegateClass, JIRemoteHmsDecoderDelegate>) end;

  JIRemoteViewDelegate_Stub_ProxyClass = interface(JObjectClass)
  ['{6DFFA214-8725-48C3-9A62-D2E614EB042F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$Stub$Proxy')]
  JIRemoteViewDelegate_Stub_Proxy = interface(JObject)
  ['{F2D2FFCA-DA12-4E90-A05F-0999510826DF}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
//    function getView: JIObjectWrapper; cdecl; //()Lcom/huawei/hms/feature/dynamic/IObjectWrapper;
    procedure onCreate(P1: JBundle); cdecl; //(Landroid/os/Bundle;)V
    procedure onDestroy; cdecl; //()V
    procedure onPause; cdecl; //()V
    procedure onResume; cdecl; //()V
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure setOnResultCallback(P1: JIOnResultCallback); cdecl; //(Lcom/huawei/hms/hmsscankit/api/IOnResultCallback;)V
//    procedure setOnClickListener(P1: JIObjectWrapper); cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)V
    procedure turnOnLight; cdecl; //()V
    procedure turnOffLight; cdecl; //()V
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;
    procedure setOnLightVisbleCallBack(P1: JIOnLightCallback); cdecl; //(Lcom/huawei/hms/hmsscankit/api/IOnLightCallback;)V
    function getLightStatus: Boolean; cdecl; //()Z
    procedure resumeContinuouslyScan; cdecl; //()V
    procedure pauseContinuouslyScan; cdecl; //()V

    { Property }
  end;

  TJIRemoteViewDelegate_Stub_Proxy = class(TJavaGenericImport<JIRemoteViewDelegate_Stub_ProxyClass, JIRemoteViewDelegate_Stub_Proxy>) end;

  JIRemoteViewDelegate_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{8580BD69-3693-4CBE-8FBF-A236D3557938}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIRemoteViewDelegate_Stub; cdecl; //()V
    {class} function asInterface(P1: JIBinder): JIRemoteViewDelegate; cdecl; //(Landroid/os/IBinder;)Lcom/huawei/hms/hmsscankit/api/IRemoteViewDelegate;

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$Stub')]
  JIRemoteViewDelegate_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{435A9006-F3E8-4C7D-A5B8-1E55091815F9}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJIRemoteViewDelegate_Stub = class(TJavaGenericImport<JIRemoteViewDelegate_StubClass, JIRemoteViewDelegate_Stub>) end;

  JIRemoteViewDelegateClass = interface(JObjectClass)
  ['{2AA5A048-0F42-4DDF-BD9D-83932B0C09B1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/api/IRemoteViewDelegate')]
  JIRemoteViewDelegate = interface(IJavaInstance)
  ['{79513BFB-94E1-4932-B082-3B6354A73522}']
    { Property Methods }

    { methods }
//    function getView: JIObjectWrapper; cdecl; //()Lcom/huawei/hms/feature/dynamic/IObjectWrapper;
    procedure onCreate(P1: JBundle); cdecl; //(Landroid/os/Bundle;)V
    procedure onDestroy; cdecl; //()V
    procedure onPause; cdecl; //()V
    procedure onResume; cdecl; //()V
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure setOnResultCallback(P1: JIOnResultCallback); cdecl; //(Lcom/huawei/hms/hmsscankit/api/IOnResultCallback;)V
    procedure setOnClickListener(P1: JIObjectWrapper); cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)V
    procedure turnOnLight; cdecl; //()V
    procedure turnOffLight; cdecl; //()V
    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;
    procedure setOnLightVisbleCallBack(P1: JIOnLightCallback); cdecl; //(Lcom/huawei/hms/hmsscankit/api/IOnLightCallback;)V
    function getLightStatus: Boolean; cdecl; //()Z
    procedure resumeContinuouslyScan; cdecl; //()V
    procedure pauseContinuouslyScan; cdecl; //()V

    { Property }
  end;

  TJIRemoteViewDelegate = class(TJavaGenericImport<JIRemoteViewDelegateClass, JIRemoteViewDelegate>) end;

//  JbClass = interface(JObjectClass)
//  ['{AFEEFD72-DB7B-4F7B-8C4F-8131913C3932}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/b')]
//  Jb = interface(JObject)
//  ['{C4A86A1F-F4E4-4B75-8FEA-19FB7AFB7C4E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JIOnLightCallback_StubClass) // or JObjectClass // SuperSignature: com/huawei/hms/hmsscankit/api/IOnLightCallback$Stub
//  ['{300EE63D-5916-40F8-A47E-8FF8D9666508}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/c')]
//  Jc = interface(JIOnLightCallback_Stub) // or JObject // SuperSignature: com/huawei/hms/hmsscankit/api/IOnLightCallback$Stub
//  ['{6AEBB49C-74BA-4252-8217-1906D2894C3A}']
//    { Property Methods }
//
//    { methods }
//    procedure onVisibleChanged(P1: Boolean); cdecl; //(Z)V
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  JdClass = interface(JIOnResultCallback_StubClass) // or JObjectClass // SuperSignature: com/huawei/hms/hmsscankit/api/IOnResultCallback$Stub
//  ['{EAABE68A-D475-40D5-BF5E-09A23106F492}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/d')]
//  Jd = interface(JIOnResultCallback_Stub) // or JObject // SuperSignature: com/huawei/hms/hmsscankit/api/IOnResultCallback$Stub
//  ['{3703C778-1D3F-487C-8A11-F02028E189C0}']
//    { Property Methods }
//
//    { methods }
//    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl; //([Lcom/huawei/hms/ml/scan/HmsScan;)V
//
//    { Property }
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  JDetailRect_1Class = interface(JObjectClass)
//  ['{C69942C9-AD36-4F73-B7E5-0AEC59C778EE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/DetailRect$1')]
//  JDetailRect_1 = interface(JObject)
//  ['{D4B17AAA-9ED4-4A11-AE21-7EA51FB3928D}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JParcel): JDetailRect; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/hmsscankit/DetailRect;
//    function a(P1: Integer): TJavaObjectArray<JDetailRect>; cdecl; overload; //(I)[Lcom/huawei/hms/hmsscankit/DetailRect;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJDetailRect_1 = class(TJavaGenericImport<JDetailRect_1Class, JDetailRect_1>) end;

  JDetailRectClass = interface(JObjectClass)
  ['{2C0E0DF9-B713-4A33-A6A0-F531DE8B4960}']
    { static Property Methods }
    {class} function _GetCUSTOMED_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFORMAT_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetRECT_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPHOTO_MODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTYPE_TRANS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetVALUE_HMS_SCAN_VERSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDEFALT_HMS_SCAN_VERSIONU: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init: JDetailRect; cdecl; overload; //()V
    {class} function init(P1: Integer; P2: Integer): JDetailRect; cdecl; overload; //(II)V

    { static Property }
    {class} property CUSTOMED_FLAG: JString read _GetCUSTOMED_FLAG;
    {class} property FORMAT_FLAG: JString read _GetFORMAT_FLAG;
    {class} property RECT_FLAG: JString read _GetRECT_FLAG;
    {class} property PHOTO_MODE: JString read _GetPHOTO_MODE;
    {class} property TYPE_TRANS: JString read _GetTYPE_TRANS;
    {class} property VALUE_HMS_SCAN_VERSION: Integer read _GetVALUE_HMS_SCAN_VERSION;
    {class} property DEFALT_HMS_SCAN_VERSIONU: Integer read _GetDEFALT_HMS_SCAN_VERSIONU;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/DetailRect')]
  JDetailRect = interface(JObject)
  ['{63E5D1D2-E044-4CBF-83E3-CDD227A396BE}']
    { Property Methods }
    function _Getwidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setwidth(awidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Getheight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setheight(aheight: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }
    function describeContents: Integer; cdecl; //()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V

    { Property }
    property width: Integer read _Getwidth write _Setwidth;
    property height: Integer read _Getheight write _Setheight;
  end;

  TJDetailRect = class(TJavaGenericImport<JDetailRectClass, JDetailRect>) end;

//  Je_1Class = interface(JSimpleDateFormatClass) // or JObjectClass // SuperSignature: java/text/SimpleDateFormat
//  ['{9550DA12-06AD-42C7-9E3B-A10AC6ECCCA9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/e$1')]
//  Je_1 = interface(JSimpleDateFormat) // or JObject // SuperSignature: java/text/SimpleDateFormat
//  ['{5D430EBF-2728-4233-8183-134F91BF1039}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_1 = class(TJavaGenericImport<Je_1Class, Je_1>) end;

//  JeClass = interface(JObjectClass)
//  ['{389F6612-5AC0-4D86-89CA-B0ABD3E0D047}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: JHmsBuildBitmapOption): JBundle; cdecl; overload; //(Ljava/lang/String;IIILcom/huawei/hms/ml/scan/HmsBuildBitmapOption;)Landroid/os/Bundle;
//    {class} procedure a(P1: Integer; P2: JBitmap; P3: JBundle); cdecl; overload; //(ILandroid/graphics/Bitmap;Landroid/os/Bundle;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/e')]
//  Je = interface(JObject)
//  ['{D4036D63-EB67-47CD-AD4A-D5999BD686EE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  JfClass = interface(JObjectClass)
//  ['{0E5D5123-71CC-458E-8A2A-E358D6D52820}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/f')]
//  Jf = interface(JObject)
//  ['{CA174FBF-2F10-4F59-B850-99CF910EA165}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

  JOnLightVisibleCallBackClass = interface(JObjectClass)
  ['{DC4BBFF4-5E4A-409C-8D07-F2E6F7E52246}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/OnLightVisibleCallBack')]
  JOnLightVisibleCallBack = interface(IJavaInstance)
  ['{25D67574-ED7E-418B-9975-8EA6A9C69300}']
    { Property Methods }

    { methods }
    procedure onVisibleChanged(P1: Boolean); cdecl; //(Z)V

    { Property }
  end;

  TJOnLightVisibleCallBack = class(TJavaGenericImport<JOnLightVisibleCallBackClass, JOnLightVisibleCallBack>) end;

  JOnResultCallbackClass = interface(JObjectClass)
  ['{076DFEF9-4954-4A56-8244-F2766DC06CAF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/OnResultCallback')]
  JOnResultCallback = interface(IJavaInstance)
  ['{A1D73393-4DDB-4391-A2FD-02A2ABDA6375}']
    { Property Methods }

    { methods }
    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl; //([Lcom/huawei/hms/ml/scan/HmsScan;)V

    { Property }
  end;

  TJOnResultCallback = class(TJavaGenericImport<JOnResultCallbackClass, JOnResultCallback>) end;

//  JRemoteView_a_1Class = interface(JObjectClass)
//  ['{CDA85B79-499A-41B3-A6F9-6AC0E48C69B9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$a$1')]
//  JRemoteView_a_1 = interface(JObject)
//  ['{6978C9E8-4208-4403-9386-02C608300D99}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJRemoteView_a_1 = class(TJavaGenericImport<JRemoteView_a_1Class, JRemoteView_a_1>) end;

//  JRemoteView_a_2Class = interface(JObjectClass)
//  ['{DE05777B-E478-47B1-9E36-BD6CB918FE03}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$a$2')]
//  JRemoteView_a_2 = interface(JObject)
//  ['{FE0DEC25-ABCF-4164-B9BE-9237CFE6A2DD}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJRemoteView_a_2 = class(TJavaGenericImport<JRemoteView_a_2Class, JRemoteView_a_2>) end;

//  JRemoteView_aClass = interface(JDeferredLifecycleHelperClass) // or JObjectClass // SuperSignature: com/huawei/hms/feature/dynamic/DeferredLifecycleHelper
//  ['{3B380E71-9767-4952-812D-29E441116B41}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$a')]
//  JRemoteView_a = interface(JDeferredLifecycleHelper) // or JObject // SuperSignature: com/huawei/hms/feature/dynamic/DeferredLifecycleHelper
//  ['{F2A4363A-4350-40C4-8895-08411FA86083}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJRemoteView_a = class(TJavaGenericImport<JRemoteView_aClass, JRemoteView_a>) end;

//  JRemoteView_bClass = interface(JObjectClass)
//  ['{C4B7E6CA-B361-4C3A-98B7-61801608BFC3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$b')]
//  JRemoteView_b = interface(JObject)
//  ['{0CCC332B-88FC-4BD5-BAB0-BF4719F4FA68}']
//    { Property Methods }
//
//    { methods }
//    procedure onInflate(P1: JActivity; P2: JBundle; P3: JBundle); cdecl; //(Landroid/app/Activity;Landroid/os/Bundle;Landroid/os/Bundle;)V
//    procedure onCreate(P1: JBundle); cdecl; //(Landroid/os/Bundle;)V
//    function onCreateView(P1: JLayoutInflater; P2: JViewGroup; P3: JBundle): JView; cdecl; //(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
//    procedure onStart; cdecl; //()V
//    procedure onResume; cdecl; //()V
//    procedure onPause; cdecl; //()V
//    procedure onStop; cdecl; //()V
//    procedure onDestroyView; cdecl; //()V
//    procedure onDestroy; cdecl; //()V
//    procedure onLowMemory; cdecl; //()V
//    procedure onSaveInstanceState(P1: JBundle); cdecl; //(Landroid/os/Bundle;)V
//
//    { Property }
//  end;

//  TJRemoteView_b = class(TJavaGenericImport<JRemoteView_bClass, JRemoteView_b>) end;

  JRemoteView_BuilderClass = interface(JObjectClass)
  ['{51D22584-79EE-4159-AE71-C57F9C78925F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRemoteView_Builder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView$Builder')]
  JRemoteView_Builder = interface(JObject)
  ['{40CB603B-C828-438D-A2C3-488B08AB4CB6}']
    { Property Methods }

    { methods }
    function setBoundingBox(P1: JRect): JRemoteView_Builder; cdecl; //(Landroid/graphics/Rect;)Lcom/huawei/hms/hmsscankit/RemoteView$Builder;
    function setFormat(P1: Integer; P2: TJavaArray<Integer>): JRemoteView_Builder; cdecl; //(I[I)Lcom/huawei/hms/hmsscankit/RemoteView$Builder;
    function setIsCustomView(P1: Boolean): JRemoteView_Builder; cdecl; //(Z)Lcom/huawei/hms/hmsscankit/RemoteView$Builder;
    function setContext(P1: JActivity): JRemoteView_Builder; cdecl; //(Landroid/app/Activity;)Lcom/huawei/hms/hmsscankit/RemoteView$Builder;
//    function build: JRemoteView; cdecl; //()Lcom/huawei/hms/hmsscankit/RemoteView;

    { Property }
  end;

  TJRemoteView_Builder = class(TJavaGenericImport<JRemoteView_BuilderClass, JRemoteView_Builder>) end;

//  JRemoteViewClass = interface(JFrameLayoutClass) // or JObjectClass // SuperSignature: android/widget/FrameLayout
//  ['{01642105-2024-48CD-B902-7C0DB203DBD3}']
//    { static Property Methods }
//    {class} function _GetREQUEST_CODE_PHOTO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//
//    { static Methods }
//
//    { static Property }
//    {class} property REQUEST_CODE_PHOTO: Integer read _GetREQUEST_CODE_PHOTO;
//  end;
//
//  [JavaSignature('com/huawei/hms/hmsscankit/RemoteView')]
//  JRemoteView = interface(JFrameLayout) // or JObject // SuperSignature: android/widget/FrameLayout
//  ['{414D2152-4F51-4017-9D0F-6979DAD515F1}']
//    { Property Methods }
//
//    { methods }
//    procedure onCreate(P1: JBundle); cdecl; //(Landroid/os/Bundle;)V
//    procedure onResume; cdecl; //()V
//    procedure onPause; cdecl; //()V
//    procedure onStart; cdecl; //()V
//    procedure onStop; cdecl; //()V
//    procedure onDestroy; cdecl; //()V
//    procedure setOnResultCallback(P1: JOnResultCallback); cdecl; //(Lcom/huawei/hms/hmsscankit/OnResultCallback;)V
//    procedure setOnLightVisibleCallback(P1: JOnLightVisibleCallBack); cdecl; //(Lcom/huawei/hms/hmsscankit/OnLightVisibleCallBack;)V
//    procedure onActivityResult(P1: Integer; P2: Integer; P3: JIntent); cdecl; //(IILandroid/content/Intent;)V
//    function switchLight: Boolean; cdecl; //()Z
//    procedure resumeContinuouslyScan; cdecl; //()V
//    procedure pauseContinuouslyScan; cdecl; //()V
//    function getLightStatus: Boolean; cdecl; //()Z
//    procedure selectPictureFromLocalFile; cdecl; //()V
//    procedure selectPictureFromLocalFileFragment(P1: JFragment); cdecl; //(Landroid/app/Fragment;)V
//    procedure onRequestPermissionsResult(P1: Integer; P2: TJavaObjectArray<JString>; P3: TJavaArray<Integer>; P4: JActivity); cdecl; //(I[Ljava/lang/String;[ILandroid/app/Activity;)V
//
//    { Property }
//  end;
//
//  TJRemoteView = class(TJavaGenericImport<JRemoteViewClass, JRemoteView>) end;

//  JScanKitActivity_1Class = interface(JObjectClass)
//  ['{266B3060-7A7A-4584-A0F2-6E38F9826571}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$1')]
//  JScanKitActivity_1 = interface(JObject)
//  ['{571ECB46-4A0C-4AB3-8434-33809DB18135}']
//    { Property Methods }
//
//    { methods }
//    procedure onResult(P1: TJavaObjectArray<JHmsScan>); cdecl; //([Lcom/huawei/hms/ml/scan/HmsScan;)V
//
//    { Property }
//  end;

//  TJScanKitActivity_1 = class(TJavaGenericImport<JScanKitActivity_1Class, JScanKitActivity_1>) end;

//  JScanKitActivity_2Class = interface(JObjectClass)
//  ['{03FB4272-656A-483F-84E9-9B521F21EE84}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity$2')]
//  JScanKitActivity_2 = interface(JObject)
//  ['{23D998E6-5389-4902-A226-0D988F5DD3EB}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJScanKitActivity_2 = class(TJavaGenericImport<JScanKitActivity_2Class, JScanKitActivity_2>) end;

  JScanKitActivityClass = interface(JActivityClass) // or JObjectClass // SuperSignature: android/app/Activity
  ['{BDEB690B-BA06-49BA-A3BA-5524928EBE7E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JScanKitActivity; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/ScanKitActivity')]
  JScanKitActivity = interface(JActivity) // or JObject // SuperSignature: android/app/Activity
  ['{2601396E-5E6F-4892-8605-D758D913A680}']
    { Property Methods }

    { methods }
    procedure onRequestPermissionsResult(P1: Integer; P2: TJavaObjectArray<JString>; P3: TJavaArray<Integer>); cdecl; //(I[Ljava/lang/String;[I)V

    { Property }
  end;

  TJScanKitActivity = class(TJavaGenericImport<JScanKitActivityClass, JScanKitActivity>) end;

  JScanUtilClass = interface(JObjectClass)
  ['{6918FBA2-2718-4799-A823-B1292126C7F8}']
    { static Property Methods }
    {class} function _GetSUCCESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetERROR_NO_CAMERA_PERMISSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetERROR_NO_READ_PERMISSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetERROR_HMS_NOT_AVAILABLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetRESULT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JScanUtil; cdecl; //()V
    {class} function startScan(P1: JActivity; P2: Integer; P3: JHmsScanAnalyzerOptions): Integer; cdecl; //(Landroid/app/Activity;ILcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;)I
    {class} function startScanFromFragment(P1: JFragment; P2: Integer; P3: JHmsScanAnalyzerOptions): Integer; cdecl; //(Landroid/app/Fragment;ILcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;)I
    {class} function decodeWithBitmap(P1: JContext; P2: JBitmap; P3: JHmsScanAnalyzerOptions): TJavaObjectArray<JHmsScan>; cdecl; //(Landroid/content/Context;Landroid/graphics/Bitmap;Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    {class} function detectForHmsDector(P1: JContext; P2: JMLFrame; P3: JHmsScanAnalyzerOptions): TJavaObjectArray<JHmsScan>; cdecl; //(Landroid/content/Context;Lcom/huawei/hms/mlsdk/common/MLFrame;Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;)[Lcom/huawei/hms/ml/scan/HmsScan;
    {class} function isScanAvailable(P1: JContext): Boolean; cdecl; //(Landroid/content/Context;)Z
    {class} function selfPermissionGranted(P1: JContext; P2: Integer; P3: JString): Boolean; cdecl; //(Landroid/content/Context;ILjava/lang/String;)Z
    {class} function compressBitmap(P1: JContext; P2: JString): JBitmap; cdecl; //(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    {class} function buildBitmap(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: JHmsBuildBitmapOption): JBitmap; cdecl; //(Ljava/lang/String;IIILcom/huawei/hms/ml/scan/HmsBuildBitmapOption;)Landroid/graphics/Bitmap;
    {class} function compressBitmapForAndroid29(P1: JContext; P2: JString): JBitmap; cdecl; //(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    { static Property }
    {class} property SUCCESS: Integer read _GetSUCCESS;
    {class} property ERROR_NO_CAMERA_PERMISSION: Integer read _GetERROR_NO_CAMERA_PERMISSION;
    {class} property ERROR_NO_READ_PERMISSION: Integer read _GetERROR_NO_READ_PERMISSION;
    {class} property ERROR_HMS_NOT_AVAILABLE: Integer read _GetERROR_HMS_NOT_AVAILABLE;
    {class} property RESULT: JString read _GetRESULT;
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/ScanUtil')]
  JScanUtil = interface(JObject)
  ['{2AB22A24-D792-456A-8AC7-6809FA864BF9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJScanUtil = class(TJavaGenericImport<JScanUtilClass, JScanUtil>) end;

  JWriterExceptionClass = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
  ['{85EE9333-D7A4-4594-A1E6-C8D0A8EF753B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWriterException; cdecl; overload; //()V
    {class} function init(P1: JString; P2: JString): JWriterException; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} function init(P1: JString): JWriterException; cdecl; overload; //(Ljava/lang/String;)V
    {class} function init(P1: JThrowable): JWriterException; cdecl; overload; //(Ljava/lang/Throwable;)V

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/hmsscankit/WriterException')]
  JWriterException = interface(JException) // or JObject // SuperSignature: java/lang/Exception
  ['{9699D040-6E42-4F73-BCE4-9D27932E5185}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWriterException = class(TJavaGenericImport<JWriterExceptionClass, JWriterException>) end;

//  JHmsBuildBitmapOption_1Class = interface(JObjectClass)
//  ['{A3359A1E-235B-4720-A809-05074E4C08D4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsBuildBitmapOption$1')]
//  JHmsBuildBitmapOption_1 = interface(JObject)
//  ['{A83A1963-A72C-459B-B1C1-B53D72C76E46}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJHmsBuildBitmapOption_1 = class(TJavaGenericImport<JHmsBuildBitmapOption_1Class, JHmsBuildBitmapOption_1>) end;

  JHmsBuildBitmapOption_CreatorClass = interface(JObjectClass)
  ['{E925048C-073D-417E-AB58-199174F6EEA9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHmsBuildBitmapOption_Creator; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsBuildBitmapOption$Creator')]
  JHmsBuildBitmapOption_Creator = interface(JObject)
  ['{1EA16417-C79B-4259-AF79-1C331CA0F03F}']
    { Property Methods }

    { methods }
    function setBitmapMargin(P1: Integer): JHmsBuildBitmapOption_Creator; cdecl; //(I)Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$Creator;
    function setBitmapColor(P1: Integer): JHmsBuildBitmapOption_Creator; cdecl; //(I)Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$Creator;
    function setBitmapBackgroundColor(P1: Integer): JHmsBuildBitmapOption_Creator; cdecl; //(I)Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$Creator;
    function setQRErrorCorrection(P1: JHmsBuildBitmapOption_ErrorCorrectionLevel): JHmsBuildBitmapOption_Creator; cdecl; //(Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel;)Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$Creator;
    function create: JHmsBuildBitmapOption; cdecl; //()Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption;

    { Property }
  end;

  TJHmsBuildBitmapOption_Creator = class(TJavaGenericImport<JHmsBuildBitmapOption_CreatorClass, JHmsBuildBitmapOption_Creator>) end;

  JHmsBuildBitmapOption_ErrorCorrectionLevelClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{47E38815-9628-4A3B-B6C2-244F90DA708A}']
    { static Property Methods }
    {class} function _GetL: JHmsBuildBitmapOption_ErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel;
    {class} function _GetM: JHmsBuildBitmapOption_ErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel;
    {class} function _GetQ: JHmsBuildBitmapOption_ErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel;
    {class} function _GetH: JHmsBuildBitmapOption_ErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel;

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsBuildBitmapOption_ErrorCorrectionLevel>; cdecl; //()[Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel;
    {class} function valueOf(P1: JString): JHmsBuildBitmapOption_ErrorCorrectionLevel; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel;

    { static Property }
    {class} property L: JHmsBuildBitmapOption_ErrorCorrectionLevel read _GetL;
    {class} property M: JHmsBuildBitmapOption_ErrorCorrectionLevel read _GetM;
    {class} property Q: JHmsBuildBitmapOption_ErrorCorrectionLevel read _GetQ;
    {class} property H: JHmsBuildBitmapOption_ErrorCorrectionLevel read _GetH;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel')]
  JHmsBuildBitmapOption_ErrorCorrectionLevel = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{DF548604-A283-4BC8-9A76-64B200D75CC0}']
    { Property Methods }
    function _Getvalue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setvalue(avalue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }

    { Property }
    property value: JString read _Getvalue write _Setvalue;
  end;

  TJHmsBuildBitmapOption_ErrorCorrectionLevel = class(TJavaGenericImport<JHmsBuildBitmapOption_ErrorCorrectionLevelClass, JHmsBuildBitmapOption_ErrorCorrectionLevel>) end;

  JHmsBuildBitmapOptionClass = interface(JObjectClass)
  ['{C660CE2F-8717-4784-8959-E508F0822E67}']
    { static Property Methods }
    {class} function _GetTYPE_BUILD_BITMAP_CONTENT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTYPE_BUILD_BITMAP_WIDTH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTYPE_BUILD_BITMAP_HEIGHT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTYPE_BUILD_BITMAP_FOTMAT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTYPE_BUILD_BITMAP_MARGIN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTYPE_BUILD_BITMAP_COLOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTYPE_BUILD_BITMAP_BACKCOLOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

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
  ['{A642DD91-E270-4DED-A773-B185EC30427A}']
    { Property Methods }
    function _Getmargin: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setmargin(amargin: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetbitmapBackgroundColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetbitmapBackgroundColor(abitmapBackgroundColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetbimapColor: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetbimapColor(abimapColor: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetQRErrorCorrection: JHmsBuildBitmapOption_ErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel;
    procedure _SetQRErrorCorrection(aQRErrorCorrection: JHmsBuildBitmapOption_ErrorCorrectionLevel);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsBuildBitmapOption$ErrorCorrectionLevel;)V

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
    property margin: Integer read _Getmargin write _Setmargin;
    property bitmapBackgroundColor: Integer read _GetbitmapBackgroundColor write _SetbitmapBackgroundColor;
    property bimapColor: Integer read _GetbimapColor write _SetbimapColor;
    property QRErrorCorrection: JHmsBuildBitmapOption_ErrorCorrectionLevel read _GetQRErrorCorrection write _SetQRErrorCorrection;
  end;

  TJHmsBuildBitmapOption = class(TJavaGenericImport<JHmsBuildBitmapOptionClass, JHmsBuildBitmapOption>) end;

//  JHmsScan_1Class = interface(JObjectClass)
//  ['{08FB03FA-AFAB-4C5C-90FA-1E3CF5AC5502}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$1')]
//  JHmsScan_1 = interface(JObject)
//  ['{0FE1FA0D-D03D-426F-8B37-C82F94E79BB5}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_1 = class(TJavaGenericImport<JHmsScan_1Class, JHmsScan_1>) end;

//  JHmsScan_AddressInfo_1Class = interface(JObjectClass)
//  ['{7B67C90E-B9EF-4D6C-B136-E7094E72887A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$AddressInfo$1')]
//  JHmsScan_AddressInfo_1 = interface(JObject)
//  ['{BF1D52E7-89D0-48AA-94CC-184435361280}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_AddressInfo; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$AddressInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_AddressInfo>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$AddressInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_AddressInfo_1 = class(TJavaGenericImport<JHmsScan_AddressInfo_1Class, JHmsScan_AddressInfo_1>) end;

  JHmsScan_AddressInfo_ADDRESS_TYPEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{BEB93E1C-364F-45A8-8E65-8B92B1BFBEFF}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$AddressInfo$ADDRESS_TYPE;
    {class} function _GetOFFICE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$AddressInfo$ADDRESS_TYPE;
    {class} function _GetRESIDENTIAL_USE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$AddressInfo$ADDRESS_TYPE;

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScan_AddressInfo_ADDRESS_TYPE>; cdecl; //()[Lcom/huawei/hms/ml/scan/HmsScan$AddressInfo$ADDRESS_TYPE;
    {class} function valueOf(P1: JString): JHmsScan_AddressInfo_ADDRESS_TYPE; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/ml/scan/HmsScan$AddressInfo$ADDRESS_TYPE;

    { static Property }
    {class} property OTHER_USE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE read _GetOTHER_USE_TYPE;
    {class} property OFFICE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE read _GetOFFICE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: JHmsScan_AddressInfo_ADDRESS_TYPE read _GetRESIDENTIAL_USE_TYPE;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$AddressInfo$ADDRESS_TYPE')]
  JHmsScan_AddressInfo_ADDRESS_TYPE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{2E291F04-58E7-4B60-B0F4-8A12E44B0136}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_AddressInfo_ADDRESS_TYPE = class(TJavaGenericImport<JHmsScan_AddressInfo_ADDRESS_TYPEClass, JHmsScan_AddressInfo_ADDRESS_TYPE>) end;

  JHmsScan_AddressInfoClass = interface(JObjectClass)
  ['{F279FEB3-E03C-4A87-B1D1-EE8DA53F2650}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetOFFICE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetRESIDENTIAL_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init: JHmsScan_AddressInfo; cdecl; overload; //()V
    {class} function init(P1: TJavaObjectArray<JString>; P2: Integer): JHmsScan_AddressInfo; cdecl; overload; //([Ljava/lang/String;I)V

    { static Property }
    {class} property OTHER_USE_TYPE: Integer read _GetOTHER_USE_TYPE;
    {class} property OFFICE_TYPE: Integer read _GetOFFICE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: Integer read _GetRESIDENTIAL_USE_TYPE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$AddressInfo')]
  JHmsScan_AddressInfo = interface(JObject)
  ['{B58601AF-45AC-4B23-8A1D-432E6FE0ED0A}']
    { Property Methods }
    function _GetaddressDetails: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[Ljava/lang/String;
    procedure _SetaddressDetails(aaddressDetails: TJavaObjectArray<JString>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([Ljava/lang/String;)V
    function _GetaddressType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetaddressType(aaddressType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }
    function getAddressDetails: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function getAddressType: Integer; cdecl; //()I

    { Property }
    property addressDetails: TJavaObjectArray<JString> read _GetaddressDetails write _SetaddressDetails;
    property addressType: Integer read _GetaddressType write _SetaddressType;
  end;

  TJHmsScan_AddressInfo = class(TJavaGenericImport<JHmsScan_AddressInfoClass, JHmsScan_AddressInfo>) end;

//  JHmsScan_BookMarkInfo_1Class = interface(JObjectClass)
//  ['{46AE6F85-201B-46DE-9E07-3C41EB03B42C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$BookMarkInfo$1')]
//  JHmsScan_BookMarkInfo_1 = interface(JObject)
//  ['{6444FFF9-E1F1-467B-8671-88354BEDCA25}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_ContactDetail; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$ContactDetail;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_ContactDetail>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$ContactDetail;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_BookMarkInfo_1 = class(TJavaGenericImport<JHmsScan_BookMarkInfo_1Class, JHmsScan_BookMarkInfo_1>) end;

  JHmsScan_BookMarkInfoClass = interface(JObjectClass)
  ['{0AA612A0-A2F4-40CA-B36B-8743787B5E5E}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: Integer; P2: Integer; P3: JString; P4: JString): JHmsScan_BookMarkInfo; cdecl; overload; //(IILjava/lang/String;Ljava/lang/String;)V
    {class} function init(P1: Integer; P2: Integer; P3: JString): JHmsScan_BookMarkInfo; cdecl; overload; //(IILjava/lang/String;)V
    {class} function init: JHmsScan_BookMarkInfo; cdecl; overload; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$BookMarkInfo')]
  JHmsScan_BookMarkInfo = interface(JObject)
  ['{E16D2328-4FEA-4F92-966F-3EE6A2C0A53F}']
    { Property Methods }
    function _GetbookType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetbookType(abookType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetbookNum: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetbookNum(abookNum: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetbookPlaceInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetbookPlaceInfo(abookPlaceInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetbookUri: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetbookUri(abookUri: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function getBookType: Integer; cdecl; //()I
    procedure setBookType(P1: Integer); cdecl; //(I)V
    function getBookNum: Integer; cdecl; //()I
    procedure setBookNum(P1: Integer); cdecl; //(I)V
    function getBookPlaceInfo: JString; cdecl; //()Ljava/lang/String;
    procedure setBookPlaceInfo(P1: JString); cdecl; //(Ljava/lang/String;)V
    function getBookUri: JString; cdecl; //()Ljava/lang/String;
    procedure setBookUri(P1: JString); cdecl; //(Ljava/lang/String;)V

    { Property }
    property bookType: Integer read _GetbookType write _SetbookType;
    property bookNum: Integer read _GetbookNum write _SetbookNum;
    property bookPlaceInfo: JString read _GetbookPlaceInfo write _SetbookPlaceInfo;
    property bookUri: JString read _GetbookUri write _SetbookUri;
  end;

  TJHmsScan_BookMarkInfo = class(TJavaGenericImport<JHmsScan_BookMarkInfoClass, JHmsScan_BookMarkInfo>) end;

//  JHmsScan_ContactDetail_1Class = interface(JObjectClass)
//  ['{D1E0DBA2-3561-4F9C-A363-0A9E3FB15B62}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$ContactDetail$1')]
//  JHmsScan_ContactDetail_1 = interface(JObject)
//  ['{1B76CC2C-259A-43FF-81F3-70CD041A95A2}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_ContactDetail; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$ContactDetail;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_ContactDetail>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$ContactDetail;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_ContactDetail_1 = class(TJavaGenericImport<JHmsScan_ContactDetail_1Class, JHmsScan_ContactDetail_1>) end;

  JHmsScan_ContactDetailClass = interface(JObjectClass)
  ['{CE6F860E-9A46-4DAD-83CB-16E5A2DC5185}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: JHmsScan_PeopleName; P2: JString; P3: JString; P4: TJavaObjectArray<JHmsScan_TelPhoneNumber>; P5: TJavaObjectArray<JHmsScan_EmailContent>; P6: TJavaObjectArray<JHmsScan_AddressInfo>; P7: TJavaObjectArray<JString>): JHmsScan_ContactDetail; cdecl; overload; //(Lcom/huawei/hms/ml/scan/HmsScan$PeopleName;Ljava/lang/String;Ljava/lang/String;[Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber;[Lcom/huawei/hms/ml/scan/HmsScan$EmailContent;[Lcom/huawei/hms/ml/scan/HmsScan$AddressInfo;[Ljava/lang/String;)V
    {class} function init(P1: JHmsScan_PeopleName; P2: TJavaObjectArray<JHmsScan_TelPhoneNumber>; P3: TJavaObjectArray<JHmsScan_EmailContent>): JHmsScan_ContactDetail; cdecl; overload; //(Lcom/huawei/hms/ml/scan/HmsScan$PeopleName;[Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber;[Lcom/huawei/hms/ml/scan/HmsScan$EmailContent;)V
    {class} function init: JHmsScan_ContactDetail; cdecl; overload; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$ContactDetail')]
  JHmsScan_ContactDetail = interface(JObject)
  ['{D1B5ACA0-06EC-40B4-B6B7-350F44A50BF0}']
    { Property Methods }
    function _GetaddressesInfos: TJavaObjectArray<JHmsScan_AddressInfo>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[Lcom/huawei/hms/ml/scan/HmsScan$AddressInfo;
    procedure _SetaddressesInfos(aaddressesInfos: TJavaObjectArray<JHmsScan_AddressInfo>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([Lcom/huawei/hms/ml/scan/HmsScan$AddressInfo;)V
    function _GeteMailContents: TJavaObjectArray<JHmsScan_EmailContent>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[Lcom/huawei/hms/ml/scan/HmsScan$EmailContent;
    procedure _SeteMailContents(aeMailContents: TJavaObjectArray<JHmsScan_EmailContent>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([Lcom/huawei/hms/ml/scan/HmsScan$EmailContent;)V
    function _GetpeopleName: JHmsScan_PeopleName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$PeopleName;
    procedure _SetpeopleName(apeopleName: JHmsScan_PeopleName);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$PeopleName;)V
    function _Getcompany: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setcompany(acompany: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GettelPhoneNumbers: TJavaObjectArray<JHmsScan_TelPhoneNumber>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber;
    procedure _SettelPhoneNumbers(atelPhoneNumbers: TJavaObjectArray<JHmsScan_TelPhoneNumber>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber;)V
    function _Gettitle: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Settitle(atitle: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetcontactLinks: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[Ljava/lang/String;
    procedure _SetcontactLinks(acontactLinks: TJavaObjectArray<JString>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([Ljava/lang/String;)V

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function getPeopleName: JHmsScan_PeopleName; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$PeopleName;
    function getCompany: JString; cdecl; //()Ljava/lang/String;
    function getTitle: JString; cdecl; //()Ljava/lang/String;
    function getTelPhoneNumbers: JList; cdecl; //()Ljava/util/List;
    function getEmailContents: JList; cdecl; //()Ljava/util/List;
    function getContactLinks: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getAddressesInfos: JList; cdecl; //()Ljava/util/List;

    { Property }
    property addressesInfos: TJavaObjectArray<JHmsScan_AddressInfo> read _GetaddressesInfos write _SetaddressesInfos;
    property eMailContents: TJavaObjectArray<JHmsScan_EmailContent> read _GeteMailContents write _SeteMailContents;
    property peopleName: JHmsScan_PeopleName read _GetpeopleName write _SetpeopleName;
    property company: JString read _Getcompany write _Setcompany;
    property telPhoneNumbers: TJavaObjectArray<JHmsScan_TelPhoneNumber> read _GettelPhoneNumbers write _SettelPhoneNumbers;
    property title: JString read _Gettitle write _Settitle;
    property contactLinks: TJavaObjectArray<JString> read _GetcontactLinks write _SetcontactLinks;
  end;

  TJHmsScan_ContactDetail = class(TJavaGenericImport<JHmsScan_ContactDetailClass, JHmsScan_ContactDetail>) end;

//  JHmsScan_DriverInfo_1Class = interface(JObjectClass)
//  ['{74CECF98-0603-4C30-97FC-BEF7455FC2AF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$DriverInfo$1')]
//  JHmsScan_DriverInfo_1 = interface(JObject)
//  ['{06A5119B-3872-434D-938C-166697A1965F}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_DriverInfo; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$DriverInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_DriverInfo>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$DriverInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_DriverInfo_1 = class(TJavaGenericImport<JHmsScan_DriverInfo_1Class, JHmsScan_DriverInfo_1>) end;

  JHmsScan_DriverInfoClass = interface(JObjectClass)
  ['{FABD13FC-8FF4-4E75-8F7F-0669C840B93E}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString; P8: JString; P9: JString; P10: JString; P11: JString; P12: JString; P13: JString; P14: JString; P15: JString; P16: JString; P17: JString; P18: JString): JHmsScan_DriverInfo; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString): JHmsScan_DriverInfo; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    {class} function init: JHmsScan_DriverInfo; cdecl; overload; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$DriverInfo')]
  JHmsScan_DriverInfo = interface(JObject)
  ['{73B83183-65E0-4C4D-AF0B-7A325504D8FD}']
    { Property Methods }
    function _Getcity: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setcity(acity: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getprovince: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setprovince(aprovince: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getavenue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setavenue(aavenue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetzipCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetzipCode(azipCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetdateOfBirth: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetdateOfBirth(adateOfBirth: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetcertificateType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetcertificateType(acertificateType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetdateOfExpire: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetdateOfExpire(adateOfExpire: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetgivenName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetgivenName(agivenName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getsex: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setsex(asex: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetdateOfIssue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetdateOfIssue(adateOfIssue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetcountryOfIssue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetcountryOfIssue(acountryOfIssue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetfamilyName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetfamilyName(afamilyName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetcertificateNumber: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetcertificateNumber(acertificateNumber: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetmiddleName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetmiddleName(amiddleName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GeteyeColor: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SeteyeColor(aeyeColor: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GethairColor: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SethairColor(ahairColor: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getheight: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setheight(aheight: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetweightRange: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetweightRange(aweightRange: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }
    function getCertificateType: JString; cdecl; //()Ljava/lang/String;
    function getGivenName: JString; cdecl; //()Ljava/lang/String;
    function getMiddleName: JString; cdecl; //()Ljava/lang/String;
    function getFamilyName: JString; cdecl; //()Ljava/lang/String;
    function getSex: JString; cdecl; //()Ljava/lang/String;
    function getAvenue: JString; cdecl; //()Ljava/lang/String;
    function getCity: JString; cdecl; //()Ljava/lang/String;
    function getProvince: JString; cdecl; //()Ljava/lang/String;
    function getZipCode: JString; cdecl; //()Ljava/lang/String;
    function getCertificateNumber: JString; cdecl; //()Ljava/lang/String;
    function getDateOfIssue: JString; cdecl; //()Ljava/lang/String;
    function getDateOfExpire: JString; cdecl; //()Ljava/lang/String;
    function getDateOfBirth: JString; cdecl; //()Ljava/lang/String;
    function getCountryOfIssue: JString; cdecl; //()Ljava/lang/String;
    function getEyeColor: JString; cdecl; //()Ljava/lang/String;
    function getHairColor: JString; cdecl; //()Ljava/lang/String;
    function getHeight: JString; cdecl; //()Ljava/lang/String;
    function getWeightRange: JString; cdecl; //()Ljava/lang/String;
    function describeContents: Integer; cdecl; //()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V

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
//  ['{AFDFEA4E-7B34-4398-A927-738AD9FB66EC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EmailContent$1')]
//  JHmsScan_EmailContent_1 = interface(JObject)
//  ['{B282F283-D0BD-480D-AB34-3812B8663856}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_EmailContent; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$EmailContent;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_EmailContent>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$EmailContent;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_EmailContent_1 = class(TJavaGenericImport<JHmsScan_EmailContent_1Class, JHmsScan_EmailContent_1>) end;

  JHmsScan_EmailContent_EMAIL_TYPEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{FF31A1FA-CFF1-458A-A309-2D445040CB05}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$EmailContent$EMAIL_TYPE;
    {class} function _GetOFFICE_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$EmailContent$EMAIL_TYPE;
    {class} function _GetRESIDENTIAL_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$EmailContent$EMAIL_TYPE;

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScan_EmailContent_EMAIL_TYPE>; cdecl; //()[Lcom/huawei/hms/ml/scan/HmsScan$EmailContent$EMAIL_TYPE;
    {class} function valueOf(P1: JString): JHmsScan_EmailContent_EMAIL_TYPE; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/ml/scan/HmsScan$EmailContent$EMAIL_TYPE;

    { static Property }
    {class} property OTHER_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE read _GetOTHER_USE_TYPE;
    {class} property OFFICE_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE read _GetOFFICE_USE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: JHmsScan_EmailContent_EMAIL_TYPE read _GetRESIDENTIAL_USE_TYPE;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EmailContent$EMAIL_TYPE')]
  JHmsScan_EmailContent_EMAIL_TYPE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{24DBE8ED-5682-4009-B3FF-FCBEC3EB46E2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_EmailContent_EMAIL_TYPE = class(TJavaGenericImport<JHmsScan_EmailContent_EMAIL_TYPEClass, JHmsScan_EmailContent_EMAIL_TYPE>) end;

  JHmsScan_EmailContentClass = interface(JObjectClass)
  ['{09D23018-DCBC-4053-87AF-76D4F75635FF}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetOFFICE_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetRESIDENTIAL_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JString; P4: Integer): JHmsScan_EmailContent; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    {class} function init: JHmsScan_EmailContent; cdecl; overload; //()V

    { static Property }
    {class} property OTHER_USE_TYPE: Integer read _GetOTHER_USE_TYPE;
    {class} property OFFICE_USE_TYPE: Integer read _GetOFFICE_USE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: Integer read _GetRESIDENTIAL_USE_TYPE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EmailContent')]
  JHmsScan_EmailContent = interface(JObject)
  ['{9E056C3E-C3B3-4479-9E1F-16B47C31120F}']
    { Property Methods }
    function _GetaddressInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetaddressInfo(aaddressInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetbodyInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetbodyInfo(abodyInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetsubjectInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetsubjectInfo(asubjectInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetaddressType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetaddressType(aaddressType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function getAddressType: Integer; cdecl; //()I
    function getAddressInfo: JString; cdecl; //()Ljava/lang/String;
    function getSubjectInfo: JString; cdecl; //()Ljava/lang/String;
    function getBodyInfo: JString; cdecl; //()Ljava/lang/String;

    { Property }
    property addressInfo: JString read _GetaddressInfo write _SetaddressInfo;
    property bodyInfo: JString read _GetbodyInfo write _SetbodyInfo;
    property subjectInfo: JString read _GetsubjectInfo write _SetsubjectInfo;
    property addressType: Integer read _GetaddressType write _SetaddressType;
  end;

  TJHmsScan_EmailContent = class(TJavaGenericImport<JHmsScan_EmailContentClass, JHmsScan_EmailContent>) end;

//  JHmsScan_EventInfo_1Class = interface(JObjectClass)
//  ['{4173E346-7AAD-4715-AB8F-E9376780FCB4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EventInfo$1')]
//  JHmsScan_EventInfo_1 = interface(JObject)
//  ['{C60FCFAB-2735-4165-9910-A8C43BB9DEF3}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_EventInfo; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$EventInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_EventInfo>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$EventInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_EventInfo_1 = class(TJavaGenericImport<JHmsScan_EventInfo_1Class, JHmsScan_EventInfo_1>) end;

  JHmsScan_EventInfoClass = interface(JObjectClass)
  ['{2BCD1AF6-93AC-4CE1-995E-429933750C75}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: JString; P2: JHmsScan_EventTime; P3: JHmsScan_EventTime; P4: JString; P5: JString; P6: JString; P7: JString): JHmsScan_EventInfo; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/ml/scan/HmsScan$EventTime;Lcom/huawei/hms/ml/scan/HmsScan$EventTime;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    {class} function init(P1: JString; P2: JHmsScan_EventTime; P3: JHmsScan_EventTime; P4: JString): JHmsScan_EventInfo; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/ml/scan/HmsScan$EventTime;Lcom/huawei/hms/ml/scan/HmsScan$EventTime;Ljava/lang/String;)V
    {class} function init: JHmsScan_EventInfo; cdecl; overload; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EventInfo')]
  JHmsScan_EventInfo = interface(JObject)
  ['{56A03EAA-FE22-4C3A-B1C8-2883353239DA}']
    { Property Methods }
    function _GetabstractInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetabstractInfo(aabstractInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetcloseTime: JHmsScan_EventTime;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$EventTime;
    procedure _SetcloseTime(acloseTime: JHmsScan_EventTime);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$EventTime;)V
    function _GetplaceInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetplaceInfo(aplaceInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getsponsor: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setsponsor(asponsor: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetbeginTime: JHmsScan_EventTime;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$EventTime;
    procedure _SetbeginTime(abeginTime: JHmsScan_EventTime);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$EventTime;)V
    function _Getcondition: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setcondition(acondition: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Gettheme: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Settheme(atheme: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function getTheme: JString; cdecl; //()Ljava/lang/String;
    function getAbstractInfo: JString; cdecl; //()Ljava/lang/String;
    function getPlaceInfo: JString; cdecl; //()Ljava/lang/String;
    function getSponsor: JString; cdecl; //()Ljava/lang/String;
    function getCondition: JString; cdecl; //()Ljava/lang/String;
    function getBeginTime: JHmsScan_EventTime; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$EventTime;
    function getCloseTime: JHmsScan_EventTime; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$EventTime;

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
//  ['{388A9273-293A-491D-9EE8-EF89E1DC5A04}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EventTime$1')]
//  JHmsScan_EventTime_1 = interface(JObject)
//  ['{FBB65D1A-4327-4198-8EB3-251421E21379}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_EventTime; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$EventTime;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_EventTime>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$EventTime;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_EventTime_1 = class(TJavaGenericImport<JHmsScan_EventTime_1Class, JHmsScan_EventTime_1>) end;

  JHmsScan_EventTimeClass = interface(JObjectClass)
  ['{C291865C-1FE2-4E59-B86D-C338781752C9}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Boolean; P8: JString): JHmsScan_EventTime; cdecl; overload; //(IIIIIIZLjava/lang/String;)V
    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): JHmsScan_EventTime; cdecl; overload; //(IIIIII)V
    {class} function init: JHmsScan_EventTime; cdecl; overload; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$EventTime')]
  JHmsScan_EventTime = interface(JObject)
  ['{54D9F618-9330-4DD5-9C24-BCAB5FC0969D}']
    { Property Methods }
    function _Getday: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setday(aday: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Gethours: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Sethours(ahours: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetisUTCTime: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetisUTCTime(aisUTCTime: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _Getminutes: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setminutes(aminutes: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Getmonth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setmonth(amonth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetoriginalValue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetoriginalValue(aoriginalValue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getseconds: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setseconds(aseconds: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Getyear: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setyear(ayear: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }
    function getYear: Integer; cdecl; //()I
    function getMonth: Integer; cdecl; //()I
    function getDay: Integer; cdecl; //()I
    function getHours: Integer; cdecl; //()I
    function getMinutes: Integer; cdecl; //()I
    function getSeconds: Integer; cdecl; //()I
    function isUTCTime: Boolean; cdecl; //()Z
    function getOriginalValue: JString; cdecl; //()Ljava/lang/String;
    function describeContents: Integer; cdecl; //()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V

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
//  ['{DC1535A0-5EBA-4779-84F3-B506DC782E2A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$LinkUrl$1')]
//  JHmsScan_LinkUrl_1 = interface(JObject)
//  ['{8E31DB16-62F3-41E9-8E12-6F81573757D2}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_LinkUrl; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$LinkUrl;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_LinkUrl>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$LinkUrl;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_LinkUrl_1 = class(TJavaGenericImport<JHmsScan_LinkUrl_1Class, JHmsScan_LinkUrl_1>) end;

  JHmsScan_LinkUrlClass = interface(JObjectClass)
  ['{FB0B0934-600A-416F-81B5-10CF6CF0D1EC}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: JString; P2: JString): JHmsScan_LinkUrl; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} function init: JHmsScan_LinkUrl; cdecl; overload; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$LinkUrl')]
  JHmsScan_LinkUrl = interface(JObject)
  ['{3BEE3746-E4C1-4E44-9A74-2915E7C4F07C}']
    { Property Methods }
    function _Gettheme: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Settheme(atheme: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getlinkvalue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setlinkvalue(alinkvalue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }
    function getTheme: JString; cdecl; //()Ljava/lang/String;
    function getLinkValue: JString; cdecl; //()Ljava/lang/String;
    function describeContents: Integer; cdecl; //()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V

    { Property }
    property theme: JString read _Gettheme write _Settheme;
    property linkvalue: JString read _Getlinkvalue write _Setlinkvalue;
  end;

  TJHmsScan_LinkUrl = class(TJavaGenericImport<JHmsScan_LinkUrlClass, JHmsScan_LinkUrl>) end;

//  JHmsScan_LocationCoordinate_1Class = interface(JObjectClass)
//  ['{F51D45B7-98CE-411C-BB58-84CD02A45A84}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$LocationCoordinate$1')]
//  JHmsScan_LocationCoordinate_1 = interface(JObject)
//  ['{8D4C15FB-655D-45E0-A384-39D05170D0C7}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_LocationCoordinate; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$LocationCoordinate;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_LocationCoordinate>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$LocationCoordinate;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_LocationCoordinate_1 = class(TJavaGenericImport<JHmsScan_LocationCoordinate_1Class, JHmsScan_LocationCoordinate_1>) end;

  JHmsScan_LocationCoordinateClass = interface(JObjectClass)
  ['{6919184A-B3B0-41E2-99A9-556337162C60}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: Double; P2: Double): JHmsScan_LocationCoordinate; cdecl; overload; //(DD)V
    {class} function init: JHmsScan_LocationCoordinate; cdecl; overload; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$LocationCoordinate')]
  JHmsScan_LocationCoordinate = interface(JObject)
  ['{F474DF7C-A4E2-48F8-9F2E-7454D4AD443A}']
    { Property Methods }
    function _Getlatitude: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //D
    procedure _Setlatitude(alatitude: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(D)V
    function _Getlongitude: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //D
    procedure _Setlongitude(alongitude: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(D)V

    { methods }
    function getLatitude: Double; cdecl; //()D
    function getLongitude: Double; cdecl; //()D
    function describeContents: Integer; cdecl; //()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V

    { Property }
    property latitude: Double read _Getlatitude write _Setlatitude;
    property longitude: Double read _Getlongitude write _Setlongitude;
  end;

  TJHmsScan_LocationCoordinate = class(TJavaGenericImport<JHmsScan_LocationCoordinateClass, JHmsScan_LocationCoordinate>) end;

//  JHmsScan_PeopleName_1Class = interface(JObjectClass)
//  ['{46140F0C-BD5B-4327-9BA1-C0554FB99C99}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$PeopleName$1')]
//  JHmsScan_PeopleName_1 = interface(JObject)
//  ['{A0AF672F-6BF6-478D-9200-62EACDDECF1E}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_PeopleName; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$PeopleName;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_PeopleName>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$PeopleName;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_PeopleName_1 = class(TJavaGenericImport<JHmsScan_PeopleName_1Class, JHmsScan_PeopleName_1>) end;

  JHmsScan_PeopleNameClass = interface(JObjectClass)
  ['{EDC78C27-9B17-4257-81C3-F28977739F57}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString): JHmsScan_PeopleName; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    {class} function init(P1: JString; P2: JString; P3: JString): JHmsScan_PeopleName; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    {class} function init: JHmsScan_PeopleName; cdecl; overload; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$PeopleName')]
  JHmsScan_PeopleName = interface(JObject)
  ['{0E6A4744-A194-43B0-A3B1-9B3041F100F5}']
    { Property Methods }
    function _GetgivenName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetgivenName(agivenName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetfullName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetfullName(afullName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetfamilyName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetfamilyName(afamilyName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetmiddleName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetmiddleName(amiddleName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetnamePrefix: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetnamePrefix(anamePrefix: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getspelling: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setspelling(aspelling: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetnameSuffix: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetnameSuffix(anameSuffix: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function getFullName: JString; cdecl; //()Ljava/lang/String;
    function getSpelling: JString; cdecl; //()Ljava/lang/String;
    function getNamePrefix: JString; cdecl; //()Ljava/lang/String;
    function getGivenName: JString; cdecl; //()Ljava/lang/String;
    function getMiddleName: JString; cdecl; //()Ljava/lang/String;
    function getFamilyName: JString; cdecl; //()Ljava/lang/String;
    function getNameSuffix: JString; cdecl; //()Ljava/lang/String;

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

  JHmsScan_SCAN_TYPE_FORMATClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{E9EE0DF0-3849-4F7B-B8D0-4378EF255E8A}']
    { static Property Methods }
    {class} function _GetARTICLE_NUMBER_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetEMAIL_CONTENT_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetTEL_PHONE_NUMBER_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetPURE_TEXT_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetSMS_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetURL_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetWIFI_CONNECT_INFO_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetEVENT_INFO_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetCONTACT_DETAIL_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetDRIVER_INFO_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetLOCATION_COORDINATE_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetISBN_NUMBER_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetBOOK_MARK_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function _GetVEHICLEINFO_FORM: JHmsScan_SCAN_TYPE_FORMAT;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScan_SCAN_TYPE_FORMAT>; cdecl; //()[Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;
    {class} function valueOf(P1: JString): JHmsScan_SCAN_TYPE_FORMAT; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/ml/scan/HmsScan$SCAN_TYPE_FORMAT;

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
  JHmsScan_SCAN_TYPE_FORMAT = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{F37915CD-01F0-4049-BA01-77012C5834C5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_SCAN_TYPE_FORMAT = class(TJavaGenericImport<JHmsScan_SCAN_TYPE_FORMATClass, JHmsScan_SCAN_TYPE_FORMAT>) end;

//  JHmsScan_SmsContent_1Class = interface(JObjectClass)
//  ['{B69570FE-7680-4C39-B0D1-C0B8D0E0EA76}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$SmsContent$1')]
//  JHmsScan_SmsContent_1 = interface(JObject)
//  ['{D7D61CFC-E2B0-41BB-8554-AEBDF7E273F0}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_SmsContent; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$SmsContent;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_SmsContent>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$SmsContent;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_SmsContent_1 = class(TJavaGenericImport<JHmsScan_SmsContent_1Class, JHmsScan_SmsContent_1>) end;

  JHmsScan_SmsContentClass = interface(JObjectClass)
  ['{62570040-1EEE-4BDD-ABA6-61B2DF9F858C}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: JString; P2: JString): JHmsScan_SmsContent; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} function init: JHmsScan_SmsContent; cdecl; overload; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$SmsContent')]
  JHmsScan_SmsContent = interface(JObject)
  ['{9133CC5C-60AC-48B0-B77C-3EE98939C441}']
    { Property Methods }
    function _GetmsgContent: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetmsgContent(amsgContent: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetdestPhoneNumber: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetdestPhoneNumber(adestPhoneNumber: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function getMsgContent: JString; cdecl; //()Ljava/lang/String;
    function getDestPhoneNumber: JString; cdecl; //()Ljava/lang/String;

    { Property }
    property msgContent: JString read _GetmsgContent write _SetmsgContent;
    property destPhoneNumber: JString read _GetdestPhoneNumber write _SetdestPhoneNumber;
  end;

  TJHmsScan_SmsContent = class(TJavaGenericImport<JHmsScan_SmsContentClass, JHmsScan_SmsContent>) end;

//  JHmsScan_TelPhoneNumber_1Class = interface(JObjectClass)
//  ['{5D33407E-F77D-4674-A537-B217ACBF3832}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$1')]
//  JHmsScan_TelPhoneNumber_1 = interface(JObject)
//  ['{43637074-0580-4C95-8AF9-536AE036006A}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_TelPhoneNumber; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_TelPhoneNumber>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_TelPhoneNumber_1 = class(TJavaGenericImport<JHmsScan_TelPhoneNumber_1Class, JHmsScan_TelPhoneNumber_1>) end;

  JHmsScan_TelPhoneNumber_USE_TYPEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{9F250182-A427-4B21-AA72-ADFFCD5F480A}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$USE_TYPE;
    {class} function _GetRESIDENTIAL_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$USE_TYPE;
    {class} function _GetFAX_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$USE_TYPE;
    {class} function _GetCELLPHONE_NUMBER_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$USE_TYPE;
    {class} function _GetOFFICE_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$USE_TYPE;

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScan_TelPhoneNumber_USE_TYPE>; cdecl; //()[Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$USE_TYPE;
    {class} function valueOf(P1: JString): JHmsScan_TelPhoneNumber_USE_TYPE; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$USE_TYPE;

    { static Property }
    {class} property OTHER_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE read _GetOTHER_USE_TYPE;
    {class} property RESIDENTIAL_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE read _GetRESIDENTIAL_USE_TYPE;
    {class} property FAX_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE read _GetFAX_USE_TYPE;
    {class} property CELLPHONE_NUMBER_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE read _GetCELLPHONE_NUMBER_USE_TYPE;
    {class} property OFFICE_USE_TYPE: JHmsScan_TelPhoneNumber_USE_TYPE read _GetOFFICE_USE_TYPE;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$TelPhoneNumber$USE_TYPE')]
  JHmsScan_TelPhoneNumber_USE_TYPE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{BB63CEBF-60A3-4A77-AA41-7E7698ED1657}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_TelPhoneNumber_USE_TYPE = class(TJavaGenericImport<JHmsScan_TelPhoneNumber_USE_TYPEClass, JHmsScan_TelPhoneNumber_USE_TYPE>) end;

  JHmsScan_TelPhoneNumberClass = interface(JObjectClass)
  ['{1D9B28D5-110C-4905-B743-8EC90DF91781}']
    { static Property Methods }
    {class} function _GetOTHER_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetOFFICE_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetRESIDENTIAL_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetFAX_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCELLPHONE_NUMBER_USE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: Integer; P2: JString): JHmsScan_TelPhoneNumber; cdecl; overload; //(ILjava/lang/String;)V
    {class} function init: JHmsScan_TelPhoneNumber; cdecl; overload; //()V

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
  ['{81CBAB78-3F15-4CFE-8726-97DD967A3C98}']
    { Property Methods }
    function _GettelPhoneNumber: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SettelPhoneNumber(atelPhoneNumber: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetuseType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetuseType(auseType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function getTelPhoneNumber: JString; cdecl; //()Ljava/lang/String;
    function getUseType: Integer; cdecl; //()I

    { Property }
    property telPhoneNumber: JString read _GettelPhoneNumber write _SettelPhoneNumber;
    property useType: Integer read _GetuseType write _SetuseType;
  end;

  TJHmsScan_TelPhoneNumber = class(TJavaGenericImport<JHmsScan_TelPhoneNumberClass, JHmsScan_TelPhoneNumber>) end;

//  JHmsScan_VehicleInfo_1Class = interface(JObjectClass)
//  ['{F5B56007-32AB-4FF4-8B94-04756646CB7C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$VehicleInfo$1')]
//  JHmsScan_VehicleInfo_1 = interface(JObject)
//  ['{B6AE641D-1192-4CA3-8C0A-22D3FF9193A9}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_VehicleInfo; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$VehicleInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_VehicleInfo>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$VehicleInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_VehicleInfo_1 = class(TJavaGenericImport<JHmsScan_VehicleInfo_1Class, JHmsScan_VehicleInfo_1>) end;

  JHmsScan_VehicleInfoClass = interface(JObjectClass)
  ['{0B42350E-21C9-42BF-A54A-DC19C85B9D15}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: Integer; P8: JString; P9: JString): JHmsScan_VehicleInfo; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    {class} function init(P1: JString; P2: JString; P3: JString; P4: JString; P5: Integer; P6: JString; P7: JString): JHmsScan_VehicleInfo; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    {class} function init(P1: JParcel): JHmsScan_VehicleInfo; cdecl; overload; //(Landroid/os/Parcel;)V
    {class} function init: JHmsScan_VehicleInfo; cdecl; overload; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$VehicleInfo')]
  JHmsScan_VehicleInfo = interface(JObject)
  ['{6299ACD4-CD59-43BA-9B00-C1B1BA793B6A}']
    { Property Methods }
    function _Getvin: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setvin(avin: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetworldManufacturerID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetworldManufacturerID(aworldManufacturerID: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetvehicleDescriptorSection: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetvehicleDescriptorSection(avehicleDescriptorSection: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetvehicleIdentifierSection: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetvehicleIdentifierSection(avehicleIdentifierSection: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetcountryCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetcountryCode(acountryCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetvehicleAttributes: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetvehicleAttributes(avehicleAttributes: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetmodelYear: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetmodelYear(amodelYear: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetplantCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetplantCode(aplantCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetsequentialNumber: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetsequentialNumber(asequentialNumber: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }
    function getVin: JString; cdecl; //()Ljava/lang/String;
    function getWorldManufacturerID: JString; cdecl; //()Ljava/lang/String;
    function getVehicleDescriptorSection: JString; cdecl; //()Ljava/lang/String;
    function getVehicleIdentifierSection: JString; cdecl; //()Ljava/lang/String;
    function getCountryCode: JString; cdecl; //()Ljava/lang/String;
    function getVehicleAttributes: JString; cdecl; //()Ljava/lang/String;
    function getModelYear: Integer; cdecl; //()I
    function getPlantCode: JString; cdecl; //()Ljava/lang/String;
    function getSequentialNumber: JString; cdecl; //()Ljava/lang/String;
    function describeContents: Integer; cdecl; //()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V

    { Property }
    property vin: JString read _Getvin write _Setvin;
    property worldManufacturerID: JString read _GetworldManufacturerID write _SetworldManufacturerID;
    property vehicleDescriptorSection: JString read _GetvehicleDescriptorSection write _SetvehicleDescriptorSection;
    property vehicleIdentifierSection: JString read _GetvehicleIdentifierSection write _SetvehicleIdentifierSection;
    property countryCode: JString read _GetcountryCode write _SetcountryCode;
    property vehicleAttributes: JString read _GetvehicleAttributes write _SetvehicleAttributes;
    property modelYear: Integer read _GetmodelYear write _SetmodelYear;
    property plantCode: JString read _GetplantCode write _SetplantCode;
    property sequentialNumber: JString read _GetsequentialNumber write _SetsequentialNumber;
  end;

  TJHmsScan_VehicleInfo = class(TJavaGenericImport<JHmsScan_VehicleInfoClass, JHmsScan_VehicleInfo>) end;

//  JHmsScan_WiFiConnectionInfo_1Class = interface(JObjectClass)
//  ['{0F9AE35A-56B3-47CF-9212-93E3B905D51C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo$1')]
//  JHmsScan_WiFiConnectionInfo_1 = interface(JObject)
//  ['{F61F78B6-F2B1-4C9E-9E11-27BC1A66F69F}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(P1: JParcel): JHmsScan_WiFiConnectionInfo; cdecl; overload; //(Landroid/os/Parcel;)Lcom/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JHmsScan_WiFiConnectionInfo>; cdecl; overload; //(I)[Lcom/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScan_WiFiConnectionInfo_1 = class(TJavaGenericImport<JHmsScan_WiFiConnectionInfo_1Class, JHmsScan_WiFiConnectionInfo_1>) end;

  JHmsScan_WiFiConnectionInfo_CIPHER_MODEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{952040FE-3D0D-4AB8-A199-D6FA8676EB33}']
    { static Property Methods }
    {class} function _GetEP_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo$CIPHER_MODE;
    {class} function _GetNO_PASSWORD_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo$CIPHER_MODE;
    {class} function _GetWPA_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo$CIPHER_MODE;

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScan_WiFiConnectionInfo_CIPHER_MODE>; cdecl; //()[Lcom/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo$CIPHER_MODE;
    {class} function valueOf(P1: JString): JHmsScan_WiFiConnectionInfo_CIPHER_MODE; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo$CIPHER_MODE;

    { static Property }
    {class} property EP_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE read _GetEP_MODE_TYPE;
    {class} property NO_PASSWORD_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE read _GetNO_PASSWORD_MODE_TYPE;
    {class} property WPA_MODE_TYPE: JHmsScan_WiFiConnectionInfo_CIPHER_MODE read _GetWPA_MODE_TYPE;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo$CIPHER_MODE')]
  JHmsScan_WiFiConnectionInfo_CIPHER_MODE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{E0347D93-BF4E-451E-9D74-C4619D1592AF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScan_WiFiConnectionInfo_CIPHER_MODE = class(TJavaGenericImport<JHmsScan_WiFiConnectionInfo_CIPHER_MODEClass, JHmsScan_WiFiConnectionInfo_CIPHER_MODE>) end;

  JHmsScan_WiFiConnectionInfoClass = interface(JObjectClass)
  ['{30FFE575-41C9-440F-AB09-7DFD636410BB}']
    { static Property Methods }
    {class} function _GetNO_PASSWORD_MODE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetWEP_MODE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetWPA_MODE_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: Integer): JHmsScan_WiFiConnectionInfo; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;I)V
    {class} function init: JHmsScan_WiFiConnectionInfo; cdecl; overload; //()V

    { static Property }
    {class} property NO_PASSWORD_MODE_TYPE: Integer read _GetNO_PASSWORD_MODE_TYPE;
    {class} property WEP_MODE_TYPE: Integer read _GetWEP_MODE_TYPE;
    {class} property WPA_MODE_TYPE: Integer read _GetWPA_MODE_TYPE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo')]
  JHmsScan_WiFiConnectionInfo = interface(JObject)
  ['{4C03A10D-44DC-4094-AB8F-1BE942640F5A}']
    { Property Methods }
    function _GetcipherMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetcipherMode(acipherMode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Getpassword: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setpassword(apassword: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetssidNumber: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetssidNumber(assidNumber: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }
    function getSsidNumber: JString; cdecl; //()Ljava/lang/String;
    function getPassword: JString; cdecl; //()Ljava/lang/String;
    function getCipherMode: Integer; cdecl; //()I
    function describeContents: Integer; cdecl; //()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V

    { Property }
    property cipherMode: Integer read _GetcipherMode write _SetcipherMode;
    property password: JString read _Getpassword write _Setpassword;
    property ssidNumber: JString read _GetssidNumber write _SetssidNumber;
  end;

  TJHmsScan_WiFiConnectionInfo = class(TJavaGenericImport<JHmsScan_WiFiConnectionInfoClass, JHmsScan_WiFiConnectionInfo>) end;






  JHmsScanBaseClass = interface(JObjectClass)
  ['{2900AC37-0CFE-4216-AFA2-86338678A9F0}']
    { static Property Methods }
    {class} function _GetSCAN_FORMAT_FLAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFORMAT_UNKNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetALL_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetQRCODE_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetAZTEC_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDATAMATRIX_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetPDF417_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCODE39_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCODE93_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCODE128_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetEAN13_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetEAN8_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetITF14_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetUPCCODE_A_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetUPCCODE_E_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCODABAR_SCAN_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetOTHER_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JHmsScanBase; cdecl; overload; //()V
    {class} function init(P1: JString; P2: Integer; P3: JString; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaObjectArray<JPoint>; P7: JHmsScanAnalyzerOptions): JHmsScanBase; cdecl; overload; //(Ljava/lang/String;ILjava/lang/String;I[B[Landroid/graphics/Point;Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;)V

    { static Property }
    {class} property SCAN_FORMAT_FLAG: JString read _GetSCAN_FORMAT_FLAG;
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
  ['{DB49B494-5346-4C81-BC12-6D44F8F14913}']
    { Property Methods }
    function _GetscanTypeForm: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetscanTypeForm(ascanTypeForm: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetcornerPoints: TJavaObjectArray<JPoint>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[Landroid/graphics/Point;
    procedure _SetcornerPoints(acornerPoints: TJavaObjectArray<JPoint>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([Landroid/graphics/Point;)V
    function _GetshowResult: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetshowResult(ashowResult: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetscanType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetscanType(ascanType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetzoomValue: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //D
    procedure _SetzoomValue(azoomValue: Double);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(D)V
    function _GetoriginValueByte: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[B
    procedure _SetoriginValueByte(aoriginValueByte: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //([B)V
    function _GetoriginalValue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetoriginalValue(aoriginalValue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getoptions: JHmsScanAnalyzerOptions;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;
    procedure _Setoptions(aoptions: JHmsScanAnalyzerOptions);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;)V

    { methods }
    function getScanTypeForm: Integer; cdecl; //()I
    function getZoomValue: Double; cdecl; //()D
    function getOriginValueByte: TJavaArray<Byte>; cdecl; //()[B
    function getOriginalValue: JString; cdecl; //()Ljava/lang/String;
    function getBorderRect: JRect; cdecl; //()Landroid/graphics/Rect;
    function getCornerPoints: TJavaObjectArray<JPoint>; cdecl; //()[Landroid/graphics/Point;
    function getShowResult: JString; cdecl; //()Ljava/lang/String;
    function getScanType: Integer; cdecl; //()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I

    { Property }
    property scanTypeForm: Integer read _GetscanTypeForm write _SetscanTypeForm;
    property cornerPoints: TJavaObjectArray<JPoint> read _GetcornerPoints write _SetcornerPoints;
    property showResult: JString read _GetshowResult write _SetshowResult;
    property scanType: Integer read _GetscanType write _SetscanType;
    property zoomValue: Double read _GetzoomValue write _SetzoomValue;
    property originValueByte: TJavaArray<Byte> read _GetoriginValueByte write _SetoriginValueByte;
    property originalValue: JString read _GetoriginalValue write _SetoriginalValue;
    property options: JHmsScanAnalyzerOptions read _Getoptions write _Setoptions;
  end;

  TJHmsScanBase = class(TJavaGenericImport<JHmsScanBaseClass, JHmsScanBase>) end;





  JHmsScanClass = interface(JHmsScanBaseClass) // or JObjectClass // SuperSignature: com/huawei/hms/ml/scan/HmsScanBase
  ['{79CA8B57-0A35-46F5-AD25-7A248575C8AA}']
    { static Property Methods }
    {class} function _GetARTICLE_NUMBER_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetPURE_TEXT_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetISBN_NUMBER_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetEVENT_INFO_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCONTACT_DETAIL_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBOOK_MARK_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDRIVER_INFO_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetEMAIL_CONTENT_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetLOCATION_COORDINATE_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetTEL_PHONE_NUMBER_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSMS_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetURL_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetWIFI_CONNECT_INFO_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;
    {class} function _GetVEHICLEINFO_FORM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JHmsScan; cdecl; overload; //()V
    {class} function init(P1: JString; P2: Integer; P3: JString; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaObjectArray<JPoint>; P7: JHmsScanAnalyzerOptions): JHmsScan; cdecl; overload; //(Ljava/lang/String;ILjava/lang/String;I[B[Landroid/graphics/Point;Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;)V
//    {class} function init(P1: JString; P2: Integer; P3: JString; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaObjectArray<JPoint>; P7: JHmsScanAnalyzerOptions; P8: Jt): JHmsScan; cdecl; overload; //(Ljava/lang/String;ILjava/lang/String;I[B[Landroid/graphics/Point;Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;Lcom/huawei/hms/scankit/t;)V

    { static Property }
    {class} property ARTICLE_NUMBER_FORM: Integer read _GetARTICLE_NUMBER_FORM;
    {class} property PURE_TEXT_FORM: Integer read _GetPURE_TEXT_FORM;
    {class} property ISBN_NUMBER_FORM: Integer read _GetISBN_NUMBER_FORM;
    {class} property EVENT_INFO_FORM: Integer read _GetEVENT_INFO_FORM;
    {class} property CONTACT_DETAIL_FORM: Integer read _GetCONTACT_DETAIL_FORM;
    {class} property BOOK_MARK_FORM: Integer read _GetBOOK_MARK_FORM;
    {class} property DRIVER_INFO_FORM: Integer read _GetDRIVER_INFO_FORM;
    {class} property EMAIL_CONTENT_FORM: Integer read _GetEMAIL_CONTENT_FORM;
    {class} property LOCATION_COORDINATE_FORM: Integer read _GetLOCATION_COORDINATE_FORM;
    {class} property TEL_PHONE_NUMBER_FORM: Integer read _GetTEL_PHONE_NUMBER_FORM;
    {class} property SMS_FORM: Integer read _GetSMS_FORM;
    {class} property URL_FORM: Integer read _GetURL_FORM;
    {class} property WIFI_CONNECT_INFO_FORM: Integer read _GetWIFI_CONNECT_INFO_FORM;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property VEHICLEINFO_FORM: Integer read _GetVEHICLEINFO_FORM;
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScan')]
  JHmsScan = interface(JHmsScanBase) // or JObject // SuperSignature: com/huawei/hms/ml/scan/HmsScanBase
  ['{65E78067-51DB-40A4-9445-DEE00E65115C}']
    { Property Methods }
    function _GeteventInfo: JHmsScan_EventInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$EventInfo;
    procedure _SeteventInfo(aeventInfo: JHmsScan_EventInfo);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$EventInfo;)V
    function _GetcontactDetail: JHmsScan_ContactDetail;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$ContactDetail;
    procedure _SetcontactDetail(acontactDetail: JHmsScan_ContactDetail);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$ContactDetail;)V
    function _GetdriverInfo: JHmsScan_DriverInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$DriverInfo;
    procedure _SetdriverInfo(adriverInfo: JHmsScan_DriverInfo);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$DriverInfo;)V
    function _GetlinkUrl: JHmsScan_LinkUrl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$LinkUrl;
    procedure _SetlinkUrl(alinkUrl: JHmsScan_LinkUrl);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$LinkUrl;)V
    function _GetwifiConnectionInfo: JHmsScan_WiFiConnectionInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo;
    procedure _SetwifiConnectionInfo(awifiConnectionInfo: JHmsScan_WiFiConnectionInfo);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo;)V
    function _GetsmsContent: JHmsScan_SmsContent;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$SmsContent;
    procedure _SetsmsContent(asmsContent: JHmsScan_SmsContent);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$SmsContent;)V
    function _GetemailContent: JHmsScan_EmailContent;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$EmailContent;
    procedure _SetemailContent(aemailContent: JHmsScan_EmailContent);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$EmailContent;)V
    function _GetlocationCoordinate: JHmsScan_LocationCoordinate;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$LocationCoordinate;
    procedure _SetlocationCoordinate(alocationCoordinate: JHmsScan_LocationCoordinate);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$LocationCoordinate;)V
    function _GetbookMarkInfo: JHmsScan_BookMarkInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$BookMarkInfo;
    procedure _SetbookMarkInfo(abookMarkInfo: JHmsScan_BookMarkInfo);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$BookMarkInfo;)V
    function _GettelPhoneNumber: JHmsScan_TelPhoneNumber;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber;
    procedure _SettelPhoneNumber(atelPhoneNumber: JHmsScan_TelPhoneNumber);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber;)V
    function _GetvehicleInfo: JHmsScan_VehicleInfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScan$VehicleInfo;
    procedure _SetvehicleInfo(avehicleInfo: JHmsScan_VehicleInfo);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/ml/scan/HmsScan$VehicleInfo;)V

    { methods }
    function getEventInfo: JHmsScan_EventInfo; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$EventInfo;
    function getContactDetail: JHmsScan_ContactDetail; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$ContactDetail;
    function getDriverInfo: JHmsScan_DriverInfo; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$DriverInfo;
    function getLinkUrl: JHmsScan_LinkUrl; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$LinkUrl;
    function getWiFiConnectionInfo: JHmsScan_WiFiConnectionInfo; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$WiFiConnectionInfo;
    function getSmsContent: JHmsScan_SmsContent; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$SmsContent;
    function getEmailContent: JHmsScan_EmailContent; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$EmailContent;
    function getLocationCoordinate: JHmsScan_LocationCoordinate; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$LocationCoordinate;
    function getBookMarkInfo: JHmsScan_BookMarkInfo; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$BookMarkInfo;
    function getTelPhoneNumber: JHmsScan_TelPhoneNumber; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$TelPhoneNumber;
    function setZoomValue(P1: Double): JHmsScan; cdecl; //(D)Lcom/huawei/hms/ml/scan/HmsScan;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function getVehicleInfo: JHmsScan_VehicleInfo; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScan$VehicleInfo;

    { Property }
    property eventInfo: JHmsScan_EventInfo read _GeteventInfo write _SeteventInfo;
    property contactDetail: JHmsScan_ContactDetail read _GetcontactDetail write _SetcontactDetail;
    property driverInfo: JHmsScan_DriverInfo read _GetdriverInfo write _SetdriverInfo;
    property linkUrl: JHmsScan_LinkUrl read _GetlinkUrl write _SetlinkUrl;
    property wifiConnectionInfo: JHmsScan_WiFiConnectionInfo read _GetwifiConnectionInfo write _SetwifiConnectionInfo;
    property smsContent: JHmsScan_SmsContent read _GetsmsContent write _SetsmsContent;
    property emailContent: JHmsScan_EmailContent read _GetemailContent write _SetemailContent;
    property locationCoordinate: JHmsScan_LocationCoordinate read _GetlocationCoordinate write _SetlocationCoordinate;
    property bookMarkInfo: JHmsScan_BookMarkInfo read _GetbookMarkInfo write _SetbookMarkInfo;
    property telPhoneNumber: JHmsScan_TelPhoneNumber read _GettelPhoneNumber write _SettelPhoneNumber;
    property vehicleInfo: JHmsScan_VehicleInfo read _GetvehicleInfo write _SetvehicleInfo;
  end;

  TJHmsScan = class(TJavaGenericImport<JHmsScanClass, JHmsScan>) end;

//  JHmsScanAnalyzer_1Class = interface(JObjectClass)
//  ['{B8FF1236-219A-4965-A287-BFC58F2A3F53}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzer$1')]
//  JHmsScanAnalyzer_1 = interface(JObject)
//  ['{993085FA-20B4-4AC6-9489-155768753D54}']
//    { Property Methods }
//
//    { methods }
//    function call: JList; cdecl; overload; //()Ljava/util/List;
//    function call: JObject; cdecl; overload; //()Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJHmsScanAnalyzer_1 = class(TJavaGenericImport<JHmsScanAnalyzer_1Class, JHmsScanAnalyzer_1>) end;

  JHmsScanAnalyzer_CreatorClass = interface(JObjectClass)
  ['{4DDCC90D-29E1-48BE-8055-83B0E6DAA4A5}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JHmsScanAnalyzer_Creator; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init: JHmsScanAnalyzer_Creator; cdecl; overload; //()V

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzer$Creator')]
  JHmsScanAnalyzer_Creator = interface(JObject)
  ['{D8FDD69A-229E-46FE-9D73-9EFDCB249916}']
    { Property Methods }

    { methods }
//    function create: JHmsScanAnalyzer; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScanAnalyzer;
    function setHmsScanTypes(P1: Integer; P2: TJavaArray<Integer>): JHmsScanAnalyzer_Creator; cdecl; overload; //(I[I)Lcom/huawei/hms/ml/scan/HmsScanAnalyzer$Creator;
    function setHmsScanTypes(P1: JHmsScanAnalyzerOptions): JHmsScanAnalyzer_Creator; cdecl; overload; //(Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;)Lcom/huawei/hms/ml/scan/HmsScanAnalyzer$Creator;

    { Property }
  end;

  TJHmsScanAnalyzer_Creator = class(TJavaGenericImport<JHmsScanAnalyzer_CreatorClass, JHmsScanAnalyzer_Creator>) end;

//  JHmsScanAnalyzerClass = interface(JMLAnalyzerClass) // or JObjectClass // SuperSignature: com/huawei/hms/mlsdk/common/MLAnalyzer
//  ['{BF1D63F6-B8C6-4DA8-AADD-5E24A8CA63EC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHmsScanAnalyzerOptions): JHmsScanAnalyzer; cdecl; overload; //(Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;)V
//    {class} function init: JHmsScanAnalyzer; cdecl; overload; //()V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzer')]
//  JHmsScanAnalyzer = interface(JMLAnalyzer) // or JObject // SuperSignature: com/huawei/hms/mlsdk/common/MLAnalyzer
//  ['{0071514C-E49E-483E-8011-421AC94D7DBF}']
//    { Property Methods }
//
//    { methods }
//    function analyseFrame(P1: JMLFrame): JSparseArray; cdecl; //(Lcom/huawei/hms/mlsdk/common/MLFrame;)Landroid/util/SparseArray;
//    function isAvailable: Boolean; cdecl; //()Z
//    procedure destory; cdecl; //()V
//    function analyzInAsyn(P1: JMLFrame): JTask; cdecl; //(Lcom/huawei/hms/mlsdk/common/MLFrame;)Lcom/huawei/hmf/tasks/Task;
//
//    { Property }
//  end;
//
//  TJHmsScanAnalyzer = class(TJavaGenericImport<JHmsScanAnalyzerClass, JHmsScanAnalyzer>) end;

//  JHmsScanAnalyzerOptions_1Class = interface(JObjectClass)
//  ['{E0AB19D5-F228-4DB5-B2B3-03F2177235B8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzerOptions$1')]
//  JHmsScanAnalyzerOptions_1 = interface(JObject)
//  ['{7407A65E-7EEB-457F-BC95-0E8641D746E5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJHmsScanAnalyzerOptions_1 = class(TJavaGenericImport<JHmsScanAnalyzerOptions_1Class, JHmsScanAnalyzerOptions_1>) end;

  JHmsScanAnalyzerOptions_CreatorClass = interface(JObjectClass)
  ['{639958D4-5C17-486E-9FB5-526F9F6D71DB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHmsScanAnalyzerOptions_Creator; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzerOptions$Creator')]
  JHmsScanAnalyzerOptions_Creator = interface(JObject)
  ['{33B8EC79-7F0E-4607-9C90-0D5C82D5E7FC}']
    { Property Methods }

    { methods }
    function setHmsScanTypes(P1: Integer; P2: TJavaArray<Integer>): JHmsScanAnalyzerOptions_Creator; cdecl; //(I[I)Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions$Creator;
    function setPhotoMode(P1: Boolean): JHmsScanAnalyzerOptions_Creator; cdecl; //(Z)Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions$Creator;
    function create: JHmsScanAnalyzerOptions; cdecl; //()Lcom/huawei/hms/ml/scan/HmsScanAnalyzerOptions;

    { Property }
  end;

  TJHmsScanAnalyzerOptions_Creator = class(TJavaGenericImport<JHmsScanAnalyzerOptions_CreatorClass, JHmsScanAnalyzerOptions_Creator>) end;

  JHmsScanAnalyzerOptionsClass = interface(JObjectClass)
  ['{DE54A92D-4EE0-4A33-B6E3-50A02C7B7F4E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/ml/scan/HmsScanAnalyzerOptions')]
  JHmsScanAnalyzerOptions = interface(JObject)
  ['{BBFEE9A8-1327-4CFC-9C02-A631A0ACC49F}']
    { Property Methods }
    function _Getmode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setmode(amode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetphotoMode: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetphotoMode(aphotoMode: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V

    { methods }
    function equals(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
    property mode: Integer read _Getmode write _Setmode;
    property photoMode: Boolean read _GetphotoMode write _SetphotoMode;
  end;

  TJHmsScanAnalyzerOptions = class(TJavaGenericImport<JHmsScanAnalyzerOptionsClass, JHmsScanAnalyzerOptions>) end;

  JHmsScanBase_SCAN_TYPEClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{D5EBA359-9629-4372-93BA-EA6FA0986E50}']
    { static Property Methods }
    {class} function _GetFORMAT_UNKNOWN: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetALL_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetQRCODE_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetAZTEC_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetDATAMATRIX_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetPDF417_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetCODE39_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetCODE93_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetCODE128_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetEAN13_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetEAN8_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetITF14_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetUPCCODE_A_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetUPCCODE_E_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function _GetCODABAR_SCAN_TYPE: JHmsScanBase_SCAN_TYPE;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;

    { static Methods }
    {class} function values: TJavaObjectArray<JHmsScanBase_SCAN_TYPE>; cdecl; //()[Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;
    {class} function valueOf(P1: JString): JHmsScanBase_SCAN_TYPE; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/ml/scan/HmsScanBase$SCAN_TYPE;

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
  JHmsScanBase_SCAN_TYPE = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{9B741889-50CD-4FF9-BBD4-1AD269D828F8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHmsScanBase_SCAN_TYPE = class(TJavaGenericImport<JHmsScanBase_SCAN_TYPEClass, JHmsScanBase_SCAN_TYPE>) end;

//  Ja_088Class = interface(JObjectClass)
//  ['{9DAA9503-90E6-455D-8CD7-9CBC92DE4AFF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/a')]
//  Ja_088 = interface(JObject)
//  ['{5E90A401-3B0A-46BB-9F64-7D7E1529ED17}']
//    { Property Methods }
//
//    { methods }
//    procedure onSensorChanged(P1: JSensorEvent); cdecl; //(Landroid/hardware/SensorEvent;)V
//    procedure onAccuracyChanged(P1: JSensor; P2: Integer); cdecl; //(Landroid/hardware/Sensor;I)V
//    procedure a(P1: Boolean); cdecl; //(Z)V
//
//    { Property }
//  end;

//  TJa_088 = class(TJavaGenericImport<Ja_088Class, Ja_088>) end;

//  Jb_aClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{34B6CEC1-C732-447F-9F24-9841FF5E90DF}']
//    { static Property Methods }
//    {class} function _Geta: Jb_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/b$a;
//    {class} function _Getb: Jb_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/b$a;
//    {class} function _Getc: Jb_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/b$a;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jb_a>; cdecl; //()[Lcom/huawei/hms/scankit/b$a;
//    {class} function valueOf(P1: JString): Jb_a; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/b$a;
//
//    { static Property }
//    {class} property a: Jb_a read _Geta;
//    {class} property b: Jb_a read _Getb;
//    {class} property c: Jb_a read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b$a')]
//  Jb_a = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{6CD492FA-12FA-446B-9F3D-79B1ED60E860}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  Jb_090Class = interface(JHandlerClass) // or JObjectClass // SuperSignature: android/os/Handler
//  ['{99A65C18-9E48-4E35-91CF-E5D0A4E4BC90}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/b')]
//  Jb_090 = interface(JHandler) // or JObject // SuperSignature: android/os/Handler
//  ['{28FB8775-F890-4917-A8D7-396A79E39868}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    procedure a(P1: Jn); cdecl; overload; //(Lcom/huawei/hms/scankit/n;)V
//    function b: Boolean; cdecl; overload; //()Z
//    procedure handleMessage(P1: JMessage); cdecl; //(Landroid/os/Message;)V
//    procedure c; cdecl; overload; //()V
//    procedure d; cdecl; //()V
//    procedure a(P1: Jaa); cdecl; overload; //(Lcom/huawei/hms/scankit/p/aa;)V
//    procedure a(P1: Boolean); cdecl; overload; //(Z)V
//    function e: Boolean; cdecl; //()Z
//    procedure b(P1: Boolean); cdecl; overload; //(Z)V
//    function f: Boolean; cdecl; //()Z
//    procedure c(P1: Boolean); cdecl; overload; //(Z)V
//
//    { Property }
//  end;

//  TJb_090 = class(TJavaGenericImport<Jb_090Class, Jb_090>) end;

//  Jc_1Class = interface(JObjectClass)
//  ['{A75B6808-511F-49D7-9143-4ED4E69A2889}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/c$1')]
//  Jc_1 = interface(JObject)
//  ['{8B1476AD-568D-4E8F-8DF2-D61203EBA446}']
//    { Property Methods }
//
//    { methods }
//    procedure surfaceCreated(P1: JSurfaceHolder); cdecl; //(Landroid/view/SurfaceHolder;)V
//    procedure surfaceChanged(P1: JSurfaceHolder; P2: Integer; P3: Integer; P4: Integer); cdecl; //(Landroid/view/SurfaceHolder;III)V
//    procedure surfaceDestroyed(P1: JSurfaceHolder); cdecl; //(Landroid/view/SurfaceHolder;)V
//
//    { Property }
//  end;

//  TJc_1 = class(TJavaGenericImport<Jc_1Class, Jc_1>) end;

//  Jc_2Class = interface(JObjectClass)
//  ['{F8D3AB68-3EA9-4137-B58D-DBDEB5B90CAE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/c$2')]
//  Jc_2 = interface(JObject)
//  ['{AD712913-F3E3-427F-A520-133A762D03A6}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: JBitmap; P3: Single); cdecl; //([Lcom/huawei/hms/ml/scan/HmsScan;Landroid/graphics/Bitmap;F)V
//
//    { Property }
//  end;

//  TJc_2 = class(TJavaGenericImport<Jc_2Class, Jc_2>) end;

//  Jc_093Class = interface(JObjectClass)
//  ['{020B4CF7-55CF-4121-AD9A-FBED36B8DF9B}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
//    {class} function _Getc: Jdd;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/dd;
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JSurfaceView; P3: JViewfinderView; P4: JRect; P5: Integer; P6: JIObjectWrapper; P7: Boolean; P8: JString): Jc_093; cdecl; //(Landroid/content/Context;Landroid/view/SurfaceView;Lcom/huawei/hms/scankit/ViewfinderView;Landroid/graphics/Rect;ILcom/huawei/hms/feature/dynamic/IObjectWrapper;ZLjava/lang/String;)V
//
//    { static Property }
//    {class} property a: JString read _Geta;
//    {class} property c: Jdd read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/c')]
//  Jc_093 = interface(JObject)
//  ['{33C12A75-9A8F-4E75-AECB-4F56EA47E7AD}']
//    { Property Methods }
//    function _Getb: Jdc;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/dc;
//    procedure _Setb(ab: Jdc);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/scankit/p/dc;)V
//
//    { methods }
//    procedure a; cdecl; overload; //()V
//    procedure b; cdecl; //()V
//    procedure c; cdecl; //()V
//    procedure d; cdecl; //()V
//    procedure e; cdecl; //()V
//    procedure f; cdecl; //()V
//    function a(P1: JMotionEvent): Boolean; cdecl; overload; //(Landroid/view/MotionEvent;)Z
//    procedure g; cdecl; //()V
//    procedure a(P1: TJavaObjectArray<JHmsScan>); cdecl; overload; //([Lcom/huawei/hms/ml/scan/HmsScan;)V
//    function a(P1: Jn): Jc; cdecl; overload; //(Lcom/huawei/hms/scankit/n;)Lcom/huawei/hms/scankit/c;
//    procedure a(P1: JIOnResultCallback); cdecl; overload; //(Lcom/huawei/hms/hmsscankit/api/IOnResultCallback;)V
//    function h: JCameraManager; cdecl; //()Lcom/huawei/hms/ml/camera/CameraManager;
//
//    { Property }
//    property b: Jdc read _Getb write _Setb;
//  end;

//  TJc_093 = class(TJavaGenericImport<Jc_093Class, Jc_093>) end;

  JCreatorClass = interface(JIRemoteCreator_StubClass) // or JObjectClass // SuperSignature: com/huawei/hms/hmsscankit/api/IRemoteCreator$Stub
  ['{F65A623D-5B4B-4642-B5DD-6E1B24DE87D7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCreator; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/Creator')]
  JCreator = interface(JIRemoteCreator_Stub) // or JObject // SuperSignature: com/huawei/hms/hmsscankit/api/IRemoteCreator$Stub
  ['{635A699B-4296-422A-8626-307F51827D59}']
    { Property Methods }

    { methods }
    function newRemoteViewDelegate(P1: JIObjectWrapper; P2: JIObjectWrapper): JIRemoteViewDelegate; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)Lcom/huawei/hms/hmsscankit/api/IRemoteViewDelegate;
    function newRemoteDecoderDelegate: JIRemoteDecoderDelegate; cdecl; //()Lcom/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate;
    function newRemoteHmsDecoderDelegate: JIRemoteHmsDecoderDelegate; cdecl; //()Lcom/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate;

    { Property }
  end;

  TJCreator = class(TJavaGenericImport<JCreatorClass, JCreator>) end;

//  Jd_095Class = interface(JObjectClass)
//  ['{B7A8D373-C38E-46BC-91B9-F799B508AF16}']
//    { static Property Methods }
//    {class} function _Geta: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/Set;
//    {class} function _Getb: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/Set;
//    {class} function _Getc: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/Set;
//    {class} function _Getd: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/Set;
//    {class} function _Gete: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/Set;
//    {class} function _Getf: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/Set;
//    {class} function _Getg: JSet;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/Set;
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

//  [JavaSignature('com/huawei/hms/scankit/d')]
//  Jd_095 = interface(JObject)
//  ['{8F6495A0-BC79-42E5-9C75-2088CB1206F5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_095 = class(TJavaGenericImport<Jd_095Class, Jd_095>) end;

//  Je_aClass = interface(JAsyncTaskClass) // or JObjectClass // SuperSignature: android/os/AsyncTask
//  ['{D80A336A-B78A-4463-B0BD-9C8744912536}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Je): Je_a; cdecl; //(Lcom/huawei/hms/scankit/e;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/e$a')]
//  Je_a = interface(JAsyncTask) // or JObject // SuperSignature: android/os/AsyncTask
//  ['{2C4E3B11-758A-40C0-ABBF-01CD13A97029}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer); cdecl; overload; //(I)V
//    procedure a(P1: JList; P2: Integer; P3: Integer; P4: Boolean); cdecl; overload; //(Ljava/util/List;IIZ)V
//
//    { Property }
//  end;

//  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

//  Je_097Class = interface(JHandlerClass) // or JObjectClass // SuperSignature: android/os/Handler
//  ['{AF691587-9462-4167-9832-A96BBB08C922}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/e')]
//  Je_097 = interface(JHandler) // or JObject // SuperSignature: android/os/Handler
//  ['{A8F54903-488C-4929-8929-0AF75D7FC42A}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl; //(Landroid/os/Message;)V
//    function a(P1: Single): Boolean; cdecl; overload; //(F)Z
//    procedure a(P1: Integer; P2: JList); cdecl; overload; //(ILjava/util/List;)V
//    function b(P1: Single): Integer; cdecl; overload; //(F)I
//    function a: Single; cdecl; overload; //()F
//    function b: JList; cdecl; overload; //()Ljava/util/List;
//
//    { Property }
//  end;

//  TJe_097 = class(TJavaGenericImport<Je_097Class, Je_097>) end;

//  Jf_098Class = interface(JObjectClass)
//  ['{364E0E43-3408-4A34-9CBA-1AE5D9AD8820}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JCameraManager; P2: JPoint; P3: JRect): Jf_098; cdecl; //(Lcom/huawei/hms/ml/camera/CameraManager;Landroid/graphics/Point;Landroid/graphics/Rect;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/f')]
//  Jf_098 = interface(JObject)
//  ['{21E4E322-4E14-4916-BA9A-CDB859B14EDB}']
//    { Property Methods }
//
//    { methods }
//    function a: JRect; cdecl; overload; //()Landroid/graphics/Rect;
//    function b: JRect; cdecl; //()Landroid/graphics/Rect;
//    function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Ju; cdecl; overload; //([BII)Lcom/huawei/hms/scankit/p/u;
//
//    { Property }
//  end;

//  TJf_098 = class(TJavaGenericImport<Jf_098Class, Jf_098>) end;

//  JgClass = interface(JObjectClass)
//  ['{86AFC240-01E9-43BB-A475-5FFEA1CA583B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JBitmap; P2: Js): TJavaObjectArray<Jz>; cdecl; overload; //(Landroid/graphics/Bitmap;Lcom/huawei/hms/scankit/s;)[Lcom/huawei/hms/scankit/p/z;
//    {class} function a(P1: TJavaArray<Byte>; P2: Js): TJavaObjectArray<Jz>; cdecl; overload; //([BLcom/huawei/hms/scankit/s;)[Lcom/huawei/hms/scankit/p/z;
//    {class} function a(P1: JList; P2: Jh): Jz; cdecl; overload; //(Ljava/util/List;Lcom/huawei/hms/scankit/h;)Lcom/huawei/hms/scankit/p/z;
//    {class} function a(P1: JList; P2: Jh; P3: JList): Jz; cdecl; overload; //(Ljava/util/List;Lcom/huawei/hms/scankit/h;Ljava/util/List;)Lcom/huawei/hms/scankit/p/z;
//    {class} function b(P1: JBitmap; P2: Js): TJavaObjectArray<Jz>; cdecl; overload; //(Landroid/graphics/Bitmap;Lcom/huawei/hms/scankit/s;)[Lcom/huawei/hms/scankit/p/z;
//    {class} function a(P1: JByteBuffer; P2: Js): TJavaObjectArray<Jz>; cdecl; overload; //(Ljava/nio/ByteBuffer;Lcom/huawei/hms/scankit/s;)[Lcom/huawei/hms/scankit/p/z;
//    {class} function b(P1: TJavaArray<Byte>; P2: Js): TJavaObjectArray<Jz>; cdecl; overload; //([BLcom/huawei/hms/scankit/s;)[Lcom/huawei/hms/scankit/p/z;
//    {class} function b(P1: JList; P2: Jh; P3: JList): JList; cdecl; overload; //(Ljava/util/List;Lcom/huawei/hms/scankit/h;Ljava/util/List;)Ljava/util/List;
//    {class} procedure a(P1: Boolean); cdecl; overload; //(Z)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/g')]
//  Jg = interface(JObject)
//  ['{A8E31109-D2FB-4258-AE59-527F987DFF39}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  JhClass = interface(JObjectClass)
//  ['{9A4B12EB-B224-4297-A508-FB8AF6722CE3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Jaj; cdecl; overload; //([BII)Lcom/huawei/hms/scankit/p/aj;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/h')]
//  Jh = interface(JObject)
//  ['{C4050CCE-CA1C-4814-83F7-162533208DF2}']
//    { Property Methods }
//    function _Geta: Jp;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/p;
//    procedure _Seta(aa: Jp);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/huawei/hms/scankit/p/p;)V
//
//    { methods }
//    function a(P1: JList): Jz; cdecl; overload; //(Ljava/util/List;)Lcom/huawei/hms/scankit/p/z;
//    function a(P1: JList; P2: Jau): Jz; cdecl; overload; //(Ljava/util/List;Lcom/huawei/hms/scankit/p/au;)Lcom/huawei/hms/scankit/p/z;
//    function a(P1: JMap): Jz; cdecl; overload; //(Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//    function b(P1: JMap): Jz; cdecl; overload; //(Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//    function b(P1: JList): Jz; cdecl; overload; //(Ljava/util/List;)Lcom/huawei/hms/scankit/p/z;
//    function b(P1: JList; P2: Jau): Jz; cdecl; overload; //(Ljava/util/List;Lcom/huawei/hms/scankit/p/au;)Lcom/huawei/hms/scankit/p/z;
//    function c(P1: JList; P2: Jau): Jz; cdecl; overload; //(Ljava/util/List;Lcom/huawei/hms/scankit/p/au;)Lcom/huawei/hms/scankit/p/z;
//    function d(P1: JList; P2: Jau): Jz; cdecl; overload; //(Ljava/util/List;Lcom/huawei/hms/scankit/p/au;)Lcom/huawei/hms/scankit/p/z;
//    function e(P1: JList; P2: Jau): Jz; cdecl; //(Ljava/util/List;Lcom/huawei/hms/scankit/p/au;)Lcom/huawei/hms/scankit/p/z;
//    function a(P1: Integer; P2: Boolean): JList; cdecl; overload; //(IZ)Ljava/util/List;
//    procedure a(P1: Jau); cdecl; overload; //(Lcom/huawei/hms/scankit/p/au;)V
//    function a: Single; cdecl; overload; //()F
//    function b: Single; cdecl; overload; //()F
//    function c: Single; cdecl; overload; //()F
//    function d: Boolean; cdecl; overload; //()Z
//
//    { Property }
//    property a: Jp read _Geta write _Seta;
//  end;

//  TJh = class(TJavaGenericImport<JhClass, Jh>) end;

//  JiClass = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
//  ['{4BB46570-7F67-4F08-8ACB-C88E7F1E6936}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/i')]
//  Ji = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
//  ['{9B633897-3AC1-4C4D-B218-B6B04A6206C9}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jf); cdecl; //(Lcom/huawei/hms/scankit/f;)V
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJi = class(TJavaGenericImport<JiClass, Ji>) end;

//  Jj_1Class = interface(JObjectClass)
//  ['{FBD3E8F5-3341-4EDB-96FB-051834ADE107}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/j$1')]
//  Jj_1 = interface(JObject)
//  ['{1391E679-C69B-4288-B100-2CB8A74FBEC3}']
//    { Property Methods }
//
//    { methods }
//    function onTouch(P1: JView; P2: JMotionEvent): Boolean; cdecl; //(Landroid/view/View;Landroid/view/MotionEvent;)Z
//
//    { Property }
//  end;

//  TJj_1 = class(TJavaGenericImport<Jj_1Class, Jj_1>) end;

//  Jj_2Class = interface(JObjectClass)
//  ['{0AA5E6BD-0367-4F5F-AFD3-BCE52F33CE6D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/j$2')]
//  Jj_2 = interface(JObject)
//  ['{2E641530-B544-4A10-ADD0-889F5E141927}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJj_2 = class(TJavaGenericImport<Jj_2Class, Jj_2>) end;

//  JjClass = interface(JIRemoteViewDelegate_StubClass) // or JObjectClass // SuperSignature: com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$Stub
//  ['{CAD680A6-CB6D-4D72-9F92-B5373CDD4D52}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Integer; P3: JObject; P4: JIObjectWrapper; P5: Boolean): Jj; cdecl; //(Landroid/content/Context;ILjava/lang/Object;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Z)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/j')]
//  Jj = interface(JIRemoteViewDelegate_Stub) // or JObject // SuperSignature: com/huawei/hms/hmsscankit/api/IRemoteViewDelegate$Stub
//  ['{5A98A7CB-153C-4447-8BE1-DBCE3FD83153}']
//    { Property Methods }
//
//    { methods }
//    function getView: JIObjectWrapper; cdecl; //()Lcom/huawei/hms/feature/dynamic/IObjectWrapper;
//    procedure onCreate(P1: JBundle); cdecl; //(Landroid/os/Bundle;)V
//    procedure onSensorChanged(P1: JSensorEvent); cdecl; //(Landroid/hardware/SensorEvent;)V
//    procedure onAccuracyChanged(P1: JSensor; P2: Integer); cdecl; //(Landroid/hardware/Sensor;I)V
//    procedure g; cdecl; //()V
//    procedure onPause; cdecl; //()V
//    procedure onDestroy; cdecl; //()V
//    procedure onResume; cdecl; //()V
//    procedure onStart; cdecl; //()V
//    procedure onStop; cdecl; //()V
//    procedure setOnResultCallback(P1: JIOnResultCallback); cdecl; //(Lcom/huawei/hms/hmsscankit/api/IOnResultCallback;)V
//    function a(P1: TJavaObjectArray<JHmsScan>): Boolean; cdecl; //([Lcom/huawei/hms/ml/scan/HmsScan;)Z
//    function h: Boolean; cdecl; //()Z
//    procedure setOnClickListener(P1: JIObjectWrapper); cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)V
//    procedure turnOnLight; cdecl; //()V
//    procedure turnOffLight; cdecl; //()V
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    procedure setOnLightVisbleCallBack(P1: JIOnLightCallback); cdecl; //(Lcom/huawei/hms/hmsscankit/api/IOnLightCallback;)V
//    function getLightStatus: Boolean; cdecl; //()Z
//    procedure resumeContinuouslyScan; cdecl; //()V
//    procedure pauseContinuouslyScan; cdecl; //()V
//
//    { Property }
//  end;

//  TJj = class(TJavaGenericImport<JjClass, Jj>) end;

//  JkClass = interface(JIRemoteDecoderDelegate_StubClass) // or JObjectClass // SuperSignature: com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$Stub
//  ['{73085169-55C6-4502-A1EC-D057618B013A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jk; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/k')]
//  Jk = interface(JIRemoteDecoderDelegate_Stub) // or JObject // SuperSignature: com/huawei/hms/hmsscankit/api/IRemoteDecoderDelegate$Stub
//  ['{3B3D3AC0-5E05-4FBE-BFD9-C8F09DDFD2EC}']
//    { Property Methods }
//
//    { methods }
//    function decodeWithBitmap(P1: JIObjectWrapper; P2: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    procedure buildBitmapLog(P1: JIObjectWrapper); cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)V
//    function buildBitmap(P1: JIObjectWrapper): JIObjectWrapper; cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)Lcom/huawei/hms/feature/dynamic/IObjectWrapper;
//
//    { Property }
//  end;

//  TJk = class(TJavaGenericImport<JkClass, Jk>) end;

//  JlClass = interface(JIRemoteHmsDecoderDelegate_StubClass) // or JObjectClass // SuperSignature: com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$Stub
//  ['{5F6184B9-366C-4346-923B-7F9A0726507A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jl; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/l')]
//  Jl = interface(JIRemoteHmsDecoderDelegate_Stub) // or JObject // SuperSignature: com/huawei/hms/hmsscankit/api/IRemoteHmsDecoderDelegate$Stub
//  ['{5131BB5F-E651-479E-8443-87C838613CFD}']
//    { Property Methods }
//
//    { methods }
//    function decodeInBitmap(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/hmsscankit/DetailRect;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    function detectWithByteBuffer(P1: JDetailRect; P2: JIObjectWrapper; P3: JIObjectWrapper): TJavaObjectArray<JHmsScan>; cdecl; //(Lcom/huawei/hms/hmsscankit/DetailRect;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)[Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJl = class(TJavaGenericImport<JlClass, Jl>) end;

//  Jm_1Class = interface(JObjectClass)
//  ['{64B3AC31-7AD4-4195-84E1-30153C4E4082}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/m$1')]
//  Jm_1 = interface(JObject)
//  ['{F30E419E-DF13-44D0-8F62-A4F293A53794}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJm_1 = class(TJavaGenericImport<Jm_1Class, Jm_1>) end;

//  Jm_2Class = interface(JObjectClass)
//  ['{FDD763CA-8F4C-4427-ACF3-6DEDA8A69D1D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/m$2')]
//  Jm_2 = interface(JObject)
//  ['{860EBD10-F9A9-4CDE-BBC3-234194171B04}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl; //(Landroid/view/View;)V
//
//    { Property }
//  end;

//  TJm_2 = class(TJavaGenericImport<Jm_2Class, Jm_2>) end;

//  JmClass = interface(JjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/j
//  ['{7447CC70-50F4-4FC2-A3CF-EC41ED8C4E53}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Integer; P3: JIObjectWrapper; P4: Boolean): Jm; cdecl; //(Landroid/content/Context;ILcom/huawei/hms/feature/dynamic/IObjectWrapper;Z)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/m')]
//  Jm = interface(Jj) // or JObject // SuperSignature: com/huawei/hms/scankit/j
//  ['{6C3A4A8E-B3CD-4E59-98CA-BEE9D9A2F584}']
//    { Property Methods }
//
//    { methods }
//    function getView: JIObjectWrapper; cdecl; //()Lcom/huawei/hms/feature/dynamic/IObjectWrapper;
//    procedure onCreate(P1: JBundle); cdecl; //(Landroid/os/Bundle;)V
//    procedure onResume; cdecl; //()V
//    procedure onAccuracyChanged(P1: JSensor; P2: Integer); cdecl; //(Landroid/hardware/Sensor;I)V
//    procedure setOnClickListener(P1: JIObjectWrapper); cdecl; //(Lcom/huawei/hms/feature/dynamic/IObjectWrapper;)V
//    procedure turnOnLight; cdecl; //()V
//    procedure turnOffLight; cdecl; //()V
//
//    { Property }
//  end;

//  TJm = class(TJavaGenericImport<JmClass, Jm>) end;

//  JnClass = interface(JObjectClass)
//  ['{A5F657CA-BC7E-48DB-A1E9-D710F7D6953B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/n')]
//  Jn = interface(IJavaInstance)
//  ['{32BF97BD-1F4E-49E6-B3D7-8563234E89CF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaObjectArray<JHmsScan>): Boolean; cdecl; //([Lcom/huawei/hms/ml/scan/HmsScan;)Z
//    function h: Boolean; cdecl; //()Z
//
//    { Property }
//  end;

//  TJn = class(TJavaGenericImport<JnClass, Jn>) end;

//  JoClass = interface(JObjectClass)
//  ['{7C52474E-9BE1-4977-A293-54632682B2A0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/o')]
//  Jo = interface(IJavaInstance)
//  ['{1B8B46F6-C011-4F7B-B95A-7ABF8FE1F523}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: JBitmap; P3: Single); cdecl; //([Lcom/huawei/hms/ml/scan/HmsScan;Landroid/graphics/Bitmap;F)V
//
//    { Property }
//  end;

//  TJo = class(TJavaGenericImport<JoClass, Jo>) end;

//  Ja_112Class = interface(Jk_327Class) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/k
//  ['{0CE2E733-7682-454E-95D2-222356CE81CD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jaj; P2: TJavaObjectArray<Jaa>; P3: Boolean; P4: Integer; P5: Integer): Ja_112; cdecl; //(Lcom/huawei/hms/scankit/p/aj;[Lcom/huawei/hms/scankit/p/aa;ZII)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/a')]
//  Ja_112 = interface(Jk_327) // or JObject // SuperSignature: com/huawei/hms/scankit/p/k
//  ['{7C310CFD-EE1E-421A-8C32-A92FC2110D80}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; //()I
//    function b: Integer; cdecl; //()I
//    function c: Boolean; cdecl; //()Z
//
//    { Property }
//  end;

//  TJa_112 = class(TJavaGenericImport<Ja_112Class, Ja_112>) end;

//  JaaClass = interface(JObjectClass)
//  ['{2FCB8D36-A5B0-482E-B5BE-018C1E10DBED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Integer): Jaa; cdecl; overload; //(FFI)V
//    {class} function init(P1: Single; P2: Single): Jaa; cdecl; overload; //(FF)V
//    {class} procedure a(P1: TJavaObjectArray<Jaa>); cdecl; overload; //([Lcom/huawei/hms/scankit/p/aa;)V
//    {class} function a(P1: Jaa; P2: Jaa): Single; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aa;Lcom/huawei/hms/scankit/p/aa;)F
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/aa')]
//  Jaa = interface(JObject)
//  ['{29D53311-C3D6-4D87-AA51-7233015C4403}']
//    { Property Methods }
//
//    { methods }
//    function a: Single; cdecl; overload; //()F
//    function b: Single; cdecl; //()F
//    function c: Integer; cdecl; //()I
//    function equals(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
//    function hashCode: Integer; cdecl; //()I
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJaa = class(TJavaGenericImport<JaaClass, Jaa>) end;

//  JabClass = interface(JObjectClass)
//  ['{7BCC5B94-3C1B-48B7-BD08-4B33F9B6B9BC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ab')]
//  Jab = interface(IJavaInstance)
//  ['{8F9C2D0B-908F-480A-8D71-F37EB4679946}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jaa); cdecl; //(Lcom/huawei/hms/scankit/p/aa;)V
//
//    { Property }
//  end;

//  TJab = class(TJavaGenericImport<JabClass, Jab>) end;

//  JacClass = interface(JObjectClass)
//  ['{C4960A68-D4F8-4CA9-A6F7-BF770685EB09}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: JMap): JString; cdecl; overload; //([BLjava/util/Map;)Ljava/lang/String;
//    {class} function a(P1: Boolean; P2: Boolean; P3: Boolean; P4: Integer; P5: Integer; P6: Boolean; P7: Integer; P8: Integer; P9: Integer; P10: Integer; P11: Integer; P12: Integer; P13: Integer; P14: Integer): JString; cdecl; overload; //(ZZZIIZIIIIIIII)Ljava/lang/String;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ac')]
//  Jac = interface(JObject)
//  ['{2D94FBE9-9A15-4E6B-9D44-3E17E383A3F7}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJac = class(TJavaGenericImport<JacClass, Jac>) end;

//  JadClass = interface(JObjectClass)
//  ['{58CAFB1C-E35C-4F44-ABBB-EBF751A6C39A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Jah; P2: JMap; P3: Jz; P4: TJavaArray<Integer>; P5: TJavaArray<Double>): TJavaArray<Byte>; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;Lcom/huawei/hms/scankit/p/z;[I[D)[B
//    {class} function a(P1: Jaa; P2: Jaa): Double; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aa;Lcom/huawei/hms/scankit/p/aa;)D
//    {class} function a(P1: TJavaObjectArray<Jaa>; P2: Integer; P3: Integer; P4: TJavaArray<Double>): TJavaObjectArray<Jaa>; cdecl; overload; //([Lcom/huawei/hms/scankit/p/aa;II[D)[Lcom/huawei/hms/scankit/p/aa;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ad')]
//  Jad = interface(JObject)
//  ['{8043407D-2A19-416A-A4C8-BE0DEB8114FB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJad = class(TJavaGenericImport<JadClass, Jad>) end;

//  JaeClass = interface(JObjectClass)
//  ['{03E481B4-B093-4A75-BBA6-7541F739D728}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JList): JList; cdecl; overload; //(Ljava/util/List;)Ljava/util/List;
//    {class} function a(P1: TJavaObjectArray<Jaa>; P2: TJavaObjectArray<Jaa>): Single; cdecl; overload; //([Lcom/huawei/hms/scankit/p/aa;[Lcom/huawei/hms/scankit/p/aa;)F
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ae')]
//  Jae = interface(JObject)
//  ['{66911EE8-F401-4BBA-A459-5ABA4AB2183A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJae = class(TJavaGenericImport<JaeClass, Jae>) end;

//  JafClass = interface(JObjectClass)
//  ['{4A159705-3BE5-4101-9621-E817BF7FDD2C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jaj): Jaf; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;)V
//    {class} function init(P1: Jaj; P2: Integer; P3: Integer; P4: Integer): Jaf; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;III)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/af')]
//  Jaf = interface(JObject)
//  ['{38D748E7-E1EB-492D-A988-555BBC111447}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaObjectArray<Jaa>; cdecl; //()[Lcom/huawei/hms/scankit/p/aa;
//
//    { Property }
//  end;

//  TJaf = class(TJavaGenericImport<JafClass, Jaf>) end;

//  JagClass = interface(JObjectClass)
//  ['{E08E8C4C-C40C-48E5-8DB3-57FEE48D60D9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ag')]
//  Jag = interface(JObject)
//  ['{FDAC9095-E8C6-4186-A194-E08D95601DC2}']
//    { Property Methods }
//
//    { methods }
//    function a: Jq; cdecl; overload; //()Lcom/huawei/hms/scankit/p/q;
//    function a(P1: Integer; P2: Jai): Jai; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;)Lcom/huawei/hms/scankit/p/ai;
//    function b: Jaj; cdecl; //()Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: Jq): Jag; cdecl; overload; //(Lcom/huawei/hms/scankit/p/q;)Lcom/huawei/hms/scankit/p/ag;
//    function c: Integer; cdecl; //()I
//    function d: Integer; cdecl; //()I
//
//    { Property }
//  end;

//  TJag = class(TJavaGenericImport<JagClass, Jag>) end;

//  JahClass = interface(JObjectClass)
//  ['{D07DAE4E-7E8E-42E7-A93A-C74F1DA22070}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jag): Jah; cdecl; //(Lcom/huawei/hms/scankit/p/ag;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ah')]
//  Jah = interface(JObject)
//  ['{425980E1-8543-456A-B780-BA9AB98157E9}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    function b: Integer; cdecl; //()I
//    function a(P1: Integer; P2: Jai): Jai; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;)Lcom/huawei/hms/scankit/p/ai;
//    function c: Jaj; cdecl; //()Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jah; cdecl; overload; //(IIII)Lcom/huawei/hms/scankit/p/ah;
//    function d: Jag; cdecl; //()Lcom/huawei/hms/scankit/p/ag;
//    function toString: JString; cdecl; //()Ljava/lang/String;
//    procedure a(P1: Jaj); cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;)V
//    function e: TJavaArray<Byte>; cdecl; //()[B
//
//    { Property }
//  end;

//  TJah = class(TJavaGenericImport<JahClass, Jah>) end;

//  JaiClass = interface(JObjectClass)
//  ['{0711E3F2-382A-4437-BF22-E19DA25FF7A1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jai; cdecl; overload; //()V
//    {class} function init(P1: Integer): Jai; cdecl; overload; //(I)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ai')]
//  Jai = interface(JObject)
//  ['{47B65278-06C7-415A-ABFC-5C57D6853456}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    function b: Integer; cdecl; overload; //()I
//    procedure c; cdecl; overload; //()V
//    procedure d; cdecl; overload; //()V
//    procedure e; cdecl; overload; //()V
//    procedure f; cdecl; //()V
//    function a(P1: Integer): Boolean; cdecl; overload; //(I)Z
//    procedure b(P1: Integer); cdecl; overload; //(I)V
//    procedure c(P1: Integer); cdecl; overload; //(I)V
//    function d(P1: Integer): Integer; cdecl; overload; //(I)I
//    function e(P1: Integer): Integer; cdecl; overload; //(I)I
//    procedure a(P1: Integer; P2: Integer); cdecl; overload; //(II)V
//    procedure g; cdecl; //()V
//    function a(P1: Integer; P2: Integer; P3: Boolean; P4: Boolean): Boolean; cdecl; overload; //(IIZZ)Z
//    procedure a(P1: Boolean); cdecl; overload; //(Z)V
//    procedure b(P1: Integer; P2: Integer); cdecl; overload; //(II)V
//    procedure a(P1: Jai); cdecl; overload; //(Lcom/huawei/hms/scankit/p/ai;)V
//    procedure b(P1: Jai); cdecl; overload; //(Lcom/huawei/hms/scankit/p/ai;)V
//    procedure a(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer); cdecl; overload; //(I[BII)V
//    function h: TJavaArray<Integer>; cdecl; //()[I
//    procedure i; cdecl; //()V
//    function equals(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
//    function hashCode: Integer; cdecl; //()I
//    function toString: JString; cdecl; //()Ljava/lang/String;
//    function j: Jai; cdecl; //()Lcom/huawei/hms/scankit/p/ai;
//    function clone: JObject; cdecl; //()Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJai = class(TJavaGenericImport<JaiClass, Jai>) end;

//  JajClass = interface(JObjectClass)
//  ['{22350DC3-C090-4B72-8CD1-413BA1A91CBC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer): Jaj; cdecl; overload; //(I)V
//    {class} function init(P1: Integer; P2: Integer): Jaj; cdecl; overload; //(II)V
//    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Integer>): Jaj; cdecl; overload; //(III[I)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/aj')]
//  Jaj = interface(JObject)
//  ['{D747ADB6-3FD1-4210-B95A-7FE97FF557FB}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload; //(II)Z
//    procedure b(P1: Integer; P2: Integer); cdecl; overload; //(II)V
//    procedure c(P1: Integer; P2: Integer); cdecl; overload; //(II)V
//    procedure a; cdecl; overload; //()V
//    procedure a(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl; overload; //(IIII)V
//    function a(P1: Integer; P2: Jai): Jai; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;)Lcom/huawei/hms/scankit/p/ai;
//    procedure b(P1: Integer; P2: Jai); cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;)V
//    procedure b; cdecl; overload; //()V
//    function c: Integer; cdecl; overload; //()I
//    function d: Integer; cdecl; //()I
//    function equals(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
//    function hashCode: Integer; cdecl; //()I
//    function toString: JString; cdecl; //()Ljava/lang/String;
//    function a(P1: JString; P2: JString): JString; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
//    function e: Jaj; cdecl; //()Lcom/huawei/hms/scankit/p/aj;
//    function f: Jaj; cdecl; //()Lcom/huawei/hms/scankit/p/aj;
//    function clone: JObject; cdecl; //()Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJaj = class(TJavaGenericImport<JajClass, Jaj>) end;

//  JakClass = interface(JObjectClass)
//  ['{22DB5348-8D90-40EF-BEF0-860274BBA190}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>): Jak; cdecl; //([B)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ak')]
//  Jak = interface(JObject)
//  ['{0145A43A-B9CF-4608-BE84-9950915B78B5}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    function b: Integer; cdecl; //()I
//    function a(P1: Integer): Integer; cdecl; overload; //(I)I
//    function c: Integer; cdecl; //()I
//
//    { Property }
//  end;

//  TJak = class(TJavaGenericImport<JakClass, Jak>) end;

//  JalClass = interface(JagClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/ag
//  ['{53014FDD-86F7-4135-94E0-45307A1FAE65}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jq): Jal; cdecl; //(Lcom/huawei/hms/scankit/p/q;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/al')]
//  Jal = interface(Jag) // or JObject // SuperSignature: com/huawei/hms/scankit/p/ag
//  ['{58E915FD-1BE2-42FD-807A-5497ACBA2D3F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jai): Jai; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;)Lcom/huawei/hms/scankit/p/ai;
//    function b: Jaj; cdecl; //()Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: Jq): Jag; cdecl; overload; //(Lcom/huawei/hms/scankit/p/q;)Lcom/huawei/hms/scankit/p/ag;
//
//    { Property }
//  end;

//  TJal = class(TJavaGenericImport<JalClass, Jal>) end;

//  JamClass = interface(JalClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/al
//  ['{6FD0E082-898D-4C0B-AC3D-447DA41625AD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jq): Jam; cdecl; //(Lcom/huawei/hms/scankit/p/q;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/am')]
//  Jam = interface(Jal) // or JObject // SuperSignature: com/huawei/hms/scankit/p/al
//  ['{25C618C5-7179-4DF3-98AF-3ABC9462805F}']
//    { Property Methods }
//
//    { methods }
//    function b: Jaj; cdecl; //()Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: Jq): Jag; cdecl; //(Lcom/huawei/hms/scankit/p/q;)Lcom/huawei/hms/scankit/p/ag;
//
//    { Property }
//  end;

//  TJam = class(TJavaGenericImport<JamClass, Jam>) end;

//  JanClass = interface(JObjectClass)
//  ['{D13CC77D-DD9F-46E5-B9FC-7CB04C01F08C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/an')]
//  Jan = interface(JObject)
//  ['{F00B23CE-D31F-49B0-AE90-8B9421DD78A6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJan = class(TJavaGenericImport<JanClass, Jan>) end;

//  JaoClass = interface(JObjectClass)
//  ['{E2E3B663-228B-458E-8EDC-63DEAE43857A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ao')]
//  Jao = interface(JObject)
//  ['{BA9C25AD-0FDA-4B46-B489-537C091E2994}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJao = class(TJavaGenericImport<JaoClass, Jao>) end;

//  JapClass = interface(JObjectClass)
//  ['{07E3CC8B-03EA-4EEB-96D2-1377E75DCD6F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jap; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ap')]
//  Jap = interface(JObject)
//  ['{74135B78-284F-4855-BCB4-CA3FC812DD1C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jah; P2: JMap): Jz; cdecl; //(Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJap = class(TJavaGenericImport<JapClass, Jap>) end;

//  Jaq_1Class = interface(JObjectClass)
//  ['{05315839-048F-457C-A76B-6E5CA2C0B526}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/aq$1')]
//  Jaq_1 = interface(JObject)
//  ['{78AA1FCA-2458-4468-AA75-FA204E4EFC03}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJaq_1 = class(TJavaGenericImport<Jaq_1Class, Jaq_1>) end;

//  Jaq_aClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{822FCC20-76F2-4722-97C3-7CE30D0AD5B1}']
//    { static Property Methods }
//    {class} function _Geta: Jaq_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/aq$a;
//    {class} function _Getb: Jaq_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/aq$a;
//    {class} function _Getc: Jaq_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/aq$a;
//    {class} function _Getd: Jaq_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/aq$a;
//    {class} function _Gete: Jaq_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/aq$a;
//    {class} function _Getf: Jaq_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/aq$a;
//    {class} function _Getg: Jaq_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/aq$a;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jaq_a>; cdecl; //()[Lcom/huawei/hms/scankit/p/aq$a;
//    {class} function valueOf(P1: JString): Jaq_a; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/aq$a;
//
//    { static Property }
//    {class} property a: Jaq_a read _Geta;
//    {class} property b: Jaq_a read _Getb;
//    {class} property c: Jaq_a read _Getc;
//    {class} property d: Jaq_a read _Getd;
//    {class} property e: Jaq_a read _Gete;
//    {class} property f: Jaq_a read _Getf;
//    {class} property g: Jaq_a read _Getg;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/aq$a')]
//  Jaq_a = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{B4A94DBA-42B8-4DC8-86C3-A95E4273FB96}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJaq_a = class(TJavaGenericImport<Jaq_aClass, Jaq_a>) end;

//  JaqClass = interface(JObjectClass)
//  ['{64E07274-56AD-422B-9966-A3D60BA5D38D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/aq')]
//  Jaq = interface(JObject)
//  ['{8556880C-8BF9-4A4A-8D9A-4E254EBACE2D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJaq = class(TJavaGenericImport<JaqClass, Jaq>) end;

//  JarClass = interface(JObjectClass)
//  ['{7DF32063-1FAF-4F54-AFEC-4EFAFF3BDC6E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jar; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ar')]
//  Jar = interface(JObject)
//  ['{DA7C823B-001A-4FA4-8437-44A1E6F1FDAC}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jaj; P2: JMap): Ji; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/i;
//    function a: Jat; cdecl; overload; //()Lcom/huawei/hms/scankit/p/at;
//
//    { Property }
//  end;

//  TJar = class(TJavaGenericImport<JarClass, Jar>) end;

//  JasClass = interface(JObjectClass)
//  ['{C52EDADE-35C3-4FC3-898D-B281E0FE722F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jaj): Jas; cdecl; //(Lcom/huawei/hms/scankit/p/aj;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/as')]
//  Jas = interface(JObject)
//  ['{199422EE-E329-46DB-8A01-D5C47F1E40E8}']
//    { Property Methods }
//
//    { methods }
//    function a: Jk; cdecl; //()Lcom/huawei/hms/scankit/p/k;
//
//    { Property }
//  end;

//  TJas = class(TJavaGenericImport<JasClass, Jas>) end;

//  Jat_1Class = interface(JObjectClass)
//  ['{73F185E4-88C5-4725-8FF0-28DA3ABDA36B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/at$1')]
//  Jat_1 = interface(JObject)
//  ['{DD72340E-D83F-4162-BD57-10AE120CA1B1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJat_1 = class(TJavaGenericImport<Jat_1Class, Jat_1>) end;

//  Jat_aClass = interface(JObjectClass)
//  ['{898D2EF8-4568-481F-BC0E-D41A00E2641B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/at$a')]
//  Jat_a = interface(JObject)
//  ['{B1EB35B6-0FAD-40E1-A414-88416A3AAC9E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJat_a = class(TJavaGenericImport<Jat_aClass, Jat_a>) end;

//  Jat_bClass = interface(JObjectClass)
//  ['{EB2B4EA4-901B-4786-8F31-A4524D816B74}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/at$b')]
//  Jat_b = interface(JObject)
//  ['{EB021FC8-A1D8-48A8-92AD-034643B8817C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJat_b = class(TJavaGenericImport<Jat_bClass, Jat_b>) end;

//  JatClass = interface(JObjectClass)
//  ['{9FE6FD81-2CE6-4CBB-85D4-E4A2B9FD9959}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Integer): Jat; cdecl; overload; //(II)Lcom/huawei/hms/scankit/p/at;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/at')]
//  Jat = interface(JObject)
//  ['{F2C17EA5-C60C-424A-937E-A8C7EF327ECD}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    function b: Integer; cdecl; //()I
//    function c: Integer; cdecl; //()I
//    function d: Integer; cdecl; //()I
//    function e: Integer; cdecl; //()I
//    function f: Integer; cdecl; //()I
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJat = class(TJavaGenericImport<JatClass, Jat>) end;

//  JauClass = interface(JObjectClass)
//  ['{99D038D6-0197-4E3C-BB4F-5FACC37804D9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single): Jau; cdecl; //(FFFFFFFFFF)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/au')]
//  Jau = interface(JObject)
//  ['{01392050-4771-4028-9C58-66F52C8443C3}']
//    { Property Methods }
//
//    { methods }
//    function a: Single; cdecl; //()F
//    function b: Single; cdecl; //()F
//    function c: Single; cdecl; //()F
//    function d: Single; cdecl; //()F
//    function e: Single; cdecl; //()F
//    function f: Single; cdecl; //()F
//    function g: Single; cdecl; //()F
//    function h: Single; cdecl; //()F
//    function i: Single; cdecl; //()F
//    function j: Single; cdecl; //()F
//
//    { Property }
//  end;

//  TJau = class(TJavaGenericImport<JauClass, Jau>) end;

//  JavClass = interface(JObjectClass)
//  ['{08600047-1C45-43C2-9548-7F5A7D1101B8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Boolean; P2: Jah; P3: Integer; P4: Boolean): JList; cdecl; overload; //(ZLcom/huawei/hms/scankit/p/ah;IZ)Ljava/util/List;
//    {class} function a(P1: Boolean; P2: Jah; P3: Jau): Boolean; cdecl; overload; //(ZLcom/huawei/hms/scankit/p/ah;Lcom/huawei/hms/scankit/p/au;)Z
//    {class} procedure a(P1: Jaj; P2: Jz; P3: Single); cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;Lcom/huawei/hms/scankit/p/z;F)V
//    {class} procedure a(P1: TJavaObjectArray<Jaa>; P2: Single); cdecl; overload; //([Lcom/huawei/hms/scankit/p/aa;F)V
//    {class} function a: Jah; cdecl; overload; //()Lcom/huawei/hms/scankit/p/ah;
//    {class} function b: Single; cdecl; //()F
//    {class} function c: Single; cdecl; //()F
//    {class} function d: Single; cdecl; //()F
//    {class} procedure a(P1: Boolean); cdecl; overload; //(Z)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/av')]
//  Jav = interface(JObject)
//  ['{B1714299-3123-41D5-A3B6-9F3595D1C3B6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJav = class(TJavaGenericImport<JavClass, Jav>) end;

//  JawClass = interface(JObjectClass)
//  ['{E4AA7CBF-2082-48A7-9778-F188DE9C9E51}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jaw; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/aw')]
//  Jaw = interface(JObject)
//  ['{3E108292-08F8-47E3-9864-6234287023C8}']
//    { Property Methods }
//    function _Geta: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/List;
//    procedure _Seta(aa: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/util/List;)V
//
//    { methods }
//    procedure a(P1: Boolean; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: Boolean); cdecl; //(Z[BIIIZ)V
//
//    { Property }
//    property a: JList read _Geta write _Seta;
//  end;

//  TJaw = class(TJavaGenericImport<JawClass, Jaw>) end;

//  JaxClass = interface(JbgClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{7F9EA509-015F-4A5D-A55A-4E9AE906112A}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Char>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[C
//    {class} function _Getb: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[I
//
//    { static Methods }
//    {class} function init: Jax; cdecl; //()V
//    {class} function a(P1: TJavaArray<Char>; P2: Char): Boolean; cdecl; overload; //([CC)Z
//
//    { static Property }
//    {class} property a: TJavaArray<Char> read _Geta;
//    {class} property b: TJavaArray<Integer> read _Getb;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ax')]
//  Jax = interface(Jbg) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{14BBF160-FE8F-4B1B-8BB3-89F1BA53A4EE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jai; P3: JMap): Jz; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJax = class(TJavaGenericImport<JaxClass, Jax>) end;

//  JayClass = interface(JbgClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{69E5F1EB-DEA5-4BA8-BF2D-0AD5C13263F3}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[[I
//
//    { static Methods }
//    {class} function init: Jay; cdecl; //()V
//
//    { static Property }
//    {class} property a: TJavaArray<TJavaArray<Integer>> read _Geta;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ay')]
//  Jay = interface(Jbg) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{034FA687-A061-4763-85A6-5A28F78AB49C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jai; P3: JMap): Jz; cdecl; //(ILcom/huawei/hms/scankit/p/ai;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJay = class(TJavaGenericImport<JayClass, Jay>) end;

//  JazClass = interface(JbgClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{583DCE3D-EEDF-478B-9E45-6B55C5B32254}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[I
//
//    { static Methods }
//    {class} function init: Jaz; cdecl; overload; //()V
//    {class} function init(P1: Boolean): Jaz; cdecl; overload; //(Z)V
//    {class} function init(P1: Boolean; P2: Boolean): Jaz; cdecl; overload; //(ZZ)V
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/az')]
//  Jaz = interface(Jbg) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{81920C9C-9307-4F23-B59D-D5932BB4CB54}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jai; P3: JMap): Jz; cdecl; //(ILcom/huawei/hms/scankit/p/ai;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJaz = class(TJavaGenericImport<JazClass, Jaz>) end;

//  Jb_144Class = interface(JObjectClass)
//  ['{39DC54CE-DD56-46FA-9640-50391DD7D823}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_144; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/b')]
//  Jb_144 = interface(JObject)
//  ['{79E7DDBA-E9B2-4B6D-B000-96EF33221133}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jah; P2: JMap): Jz; cdecl; //(Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJb_144 = class(TJavaGenericImport<Jb_144Class, Jb_144>) end;

//  JbaClass = interface(JbgClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{28785905-9A04-4367-ACD2-4992F5448C05}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[I
//
//    { static Methods }
//    {class} function init: Jba; cdecl; //()V
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ba')]
//  Jba = interface(Jbg) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{372E685F-D2F6-43E2-932C-3CEF5D0A929A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jai; P3: JMap): Jz; cdecl; //(ILcom/huawei/hms/scankit/p/ai;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJba = class(TJavaGenericImport<JbaClass, Jba>) end;

//  JbbClass = interface(JblClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bl
//  ['{524EDBB3-C581-43E4-BEAE-B9875182FAF5}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[I
//
//    { static Methods }
//    {class} function init: Jbb; cdecl; //()V
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bb')]
//  Jbb = interface(Jbl) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bl
//  ['{374777B0-AC4D-4254-BAEF-9F06F3400C2E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbb = class(TJavaGenericImport<JbbClass, Jbb>) end;

//  JbcClass = interface(JblClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bl
//  ['{62286CDA-6A40-47B9-8918-941056E2C666}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jbc; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bc')]
//  Jbc = interface(Jbl) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bl
//  ['{3328A867-B371-45CE-A2AF-8E190056104B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Jai): Boolean; cdecl; //(IILcom/huawei/hms/scankit/p/ai;)Z
//
//    { Property }
//  end;

//  TJbc = class(TJavaGenericImport<JbcClass, Jbc>) end;

//  JbdClass = interface(JbgClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{EEE62F9A-E439-4DAF-A1EE-3D8B972A8A4F}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[[I
//
//    { static Methods }
//    {class} function init: Jbd; cdecl; //()V
//
//    { static Property }
//    {class} property a: TJavaArray<TJavaArray<Integer>> read _Geta;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bd')]
//  Jbd = interface(Jbg) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{0F3223EC-58E4-45F9-9B4C-7C64456484CD}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jai; P3: JMap): Jz; cdecl; //(ILcom/huawei/hms/scankit/p/ai;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJbd = class(TJavaGenericImport<JbdClass, Jbd>) end;

//  JbeClass = interface(JbgClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{4F932E35-BB85-4B19-98D0-4074CD087E21}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JMap): Jbe; cdecl; //(Ljava/util/Map;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/be')]
//  Jbe = interface(Jbg) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{5E9D7C2B-A042-43E0-8D76-84EAE15DF68C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jai; P3: JMap): Jz; cdecl; //(ILcom/huawei/hms/scankit/p/ai;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJbe = class(TJavaGenericImport<JbeClass, Jbe>) end;

//  JbfClass = interface(JbgClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{AF284A9E-FC5E-4B34-9903-3CA2FABF4D26}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JMap): Jbf; cdecl; //(Ljava/util/Map;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bf')]
//  Jbf = interface(Jbg) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{2477561B-9332-4F36-8658-4DD17E915A0E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jai; P3: JMap): Jz; cdecl; //(ILcom/huawei/hms/scankit/p/ai;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJbf = class(TJavaGenericImport<JbfClass, Jbf>) end;

//  JbgClass = interface(JObjectClass)
//  ['{E74F1701-0D6D-4CBC-9056-59EC73AB26D2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jbg; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bg')]
//  Jbg = interface(JObject)
//  ['{23869E6E-09C3-4B76-A73E-193BF99BC1B1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jah; P2: JMap): Jz; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//    function a(P1: Integer; P2: Jai; P3: JMap): Jz; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJbg = class(TJavaGenericImport<JbgClass, Jbg>) end;

//  JbhClass = interface(JblClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bl
//  ['{7951CAF9-E689-44EB-A1A2-CC23E902C156}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jbh; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bh')]
//  Jbh = interface(Jbl) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bl
//  ['{1902C43A-A858-4624-835A-F908F893E0BF}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Jai): Boolean; cdecl; overload; //(IILcom/huawei/hms/scankit/p/ai;)Z
//    function a(P1: Integer; P2: Jai; P3: TJavaArray<Integer>; P4: JMap): Jz; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;[ILjava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//    function a(P1: Integer; P2: Jai; P3: JMap): Jz; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//    function a(P1: Jah; P2: JMap): Jz; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJbh = class(TJavaGenericImport<JbhClass, Jbh>) end;

//  JbiClass = interface(JObjectClass)
//  ['{1054A217-0C4E-431E-AB8E-9009FE2BDAFD}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bi')]
//  Jbi = interface(JObject)
//  ['{2B429B94-B3AA-4CB0-AE8D-5BFC8881139E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbi = class(TJavaGenericImport<JbiClass, Jbi>) end;

//  JbjClass = interface(JObjectClass)
//  ['{5F4CE66D-2DFE-483E-AC67-6C22D1E39D09}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bj')]
//  Jbj = interface(JObject)
//  ['{857D832B-01B6-4FAC-A12B-32D2DF76B1AD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbj = class(TJavaGenericImport<JbjClass, Jbj>) end;

//  JbkClass = interface(JObjectClass)
//  ['{21B5F3EF-2586-4B57-A8C7-ADD165A0323A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bk')]
//  Jbk = interface(JObject)
//  ['{845FF716-CB2F-4C59-8291-902D76CB0431}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbk = class(TJavaGenericImport<JbkClass, Jbk>) end;

//  JblClass = interface(JbgClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{6D6E147E-956B-49E3-A557-27B968876E33}']
//    { static Property Methods }
//    {class} function _Getb: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[I
//    {class} function _Getc: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[I
//    {class} function _Getd: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[I
//    {class} function _Gete: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[[I
//    {class} function _Getf: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[[I
//
//    { static Methods }
//    {class} function a(P1: JCharSequence): Boolean; cdecl; overload; //(Ljava/lang/CharSequence;)Z
//    {class} function b(P1: JCharSequence): Integer; cdecl; //(Ljava/lang/CharSequence;)I
//
//    { static Property }
//    {class} property b: TJavaArray<Integer> read _Getb;
//    {class} property c: TJavaArray<Integer> read _Getc;
//    {class} property d: TJavaArray<Integer> read _Getd;
//    {class} property e: TJavaArray<TJavaArray<Integer>> read _Gete;
//    {class} property f: TJavaArray<TJavaArray<Integer>> read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bl')]
//  Jbl = interface(Jbg) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bg
//  ['{0C8F1236-428A-441B-A170-EEFB820854F2}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Jai; P3: JMap): Jz; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//    function a(P1: Integer; P2: Jai; P3: TJavaArray<Integer>; P4: JMap): Jz; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ai;[ILjava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJbl = class(TJavaGenericImport<JblClass, Jbl>) end;

//  JbmClass = interface(JblClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bl
//  ['{CD50D407-85B9-4592-AB19-59BF844F0940}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<TJavaArray<Integer>>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[[I
//
//    { static Methods }
//    {class} function init: Jbm; cdecl; //()V
//    {class} function b(P1: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
//
//    { static Property }
//    {class} property a: TJavaArray<TJavaArray<Integer>> read _Geta;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bm')]
//  Jbm = interface(Jbl) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bl
//  ['{60DA703F-E79E-424D-9E7C-C95C2D2027C4}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer; P3: Jai): Boolean; cdecl; //(IILcom/huawei/hms/scankit/p/ai;)Z
//
//    { Property }
//  end;

//  TJbm = class(TJavaGenericImport<JbmClass, Jbm>) end;

//  JbnClass = interface(JObjectClass)
//  ['{79E58D4C-AAC5-4A70-87C7-DD02866E1C94}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bn')]
//  Jbn = interface(JObject)
//  ['{6A3D2FCA-116B-4943-892B-0A70BBD96CA2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbn = class(TJavaGenericImport<JbnClass, Jbn>) end;

//  JboClass = interface(JObjectClass)
//  ['{15D3BE0F-C439-4A94-B7DC-D2C4635906C1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bo')]
//  Jbo = interface(JObject)
//  ['{ED9C7247-F62D-46AE-A587-D131C40119BA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbo = class(TJavaGenericImport<JboClass, Jbo>) end;

//  JbpClass = interface(JObjectClass)
//  ['{3D452CE2-BEC9-447D-AF0E-D6411A6797F1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bp')]
//  Jbp = interface(JObject)
//  ['{BF722214-7AC8-4DFC-9AC1-BCA974EC8803}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbp = class(TJavaGenericImport<JbpClass, Jbp>) end;

//  JbqClass = interface(JObjectClass)
//  ['{03C201A2-A42B-4D2D-ADDD-FC219F9529F7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bq')]
//  Jbq = interface(JObject)
//  ['{C01FA944-3F8A-419B-AB7B-6592CDE5F284}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJbq = class(TJavaGenericImport<JbqClass, Jbq>) end;

//  Jbr_1Class = interface(JObjectClass)
//  ['{7235BA40-37DD-4CA4-8BDA-4E66AFC74AB9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/br$1')]
//  Jbr_1 = interface(JObject)
//  ['{A654DDEB-F3C3-4747-A545-6DEBE36D6D42}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbr_1 = class(TJavaGenericImport<Jbr_1Class, Jbr_1>) end;

//  Jbr_aClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{500728AB-9F58-44FE-BD94-9A9BB55F570A}']
//    { static Property Methods }
//    {class} function _Geta: Jbr_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/br$a;
//    {class} function _Getb: Jbr_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/br$a;
//    {class} function _Getc: Jbr_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/br$a;
//    {class} function _Getd: Jbr_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/br$a;
//    {class} function _Gete: Jbr_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/br$a;
//    {class} function _Getf: Jbr_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/br$a;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jbr_a>; cdecl; //()[Lcom/huawei/hms/scankit/p/br$a;
//    {class} function valueOf(P1: JString): Jbr_a; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/br$a;
//
//    { static Property }
//    {class} property a: Jbr_a read _Geta;
//    {class} property b: Jbr_a read _Getb;
//    {class} property c: Jbr_a read _Getc;
//    {class} property d: Jbr_a read _Getd;
//    {class} property e: Jbr_a read _Gete;
//    {class} property f: Jbr_a read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/br$a')]
//  Jbr_a = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{70C8157E-DD23-470B-8E66-DBDF04B36240}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbr_a = class(TJavaGenericImport<Jbr_aClass, Jbr_a>) end;

//  JbrClass = interface(JObjectClass)
//  ['{729A6DC1-AB2F-43BE-BBEF-3F82C0AF7FBB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/br')]
//  Jbr = interface(JObject)
//  ['{B3FF36B3-CC48-4AA7-A645-8D1E355EEEBA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbr = class(TJavaGenericImport<JbrClass, Jbr>) end;

//  JbsClass = interface(JObjectClass)
//  ['{F1D17B0B-50CC-4A16-8018-EDED9CC0DCC6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bs')]
//  Jbs = interface(JObject)
//  ['{462CF997-0B3D-46F0-8885-462EF817CA6A}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJbs = class(TJavaGenericImport<JbsClass, Jbs>) end;

//  JbtClass = interface(JObjectClass)
//  ['{AE542FDC-0003-40D0-8610-D692EC447F20}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bt')]
//  Jbt = interface(JObject)
//  ['{B4A85CBE-0B94-421F-A63F-4ECE1BE534BD}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJbt = class(TJavaGenericImport<JbtClass, Jbt>) end;

//  JbuClass = interface(JbtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/bt
//  ['{B475F1ED-28E2-4927-81EA-EC7359A3C51A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bu')]
//  Jbu = interface(Jbt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/bt
//  ['{CE68C78D-EE2B-42FC-9AD4-8DFA77600049}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJbu = class(TJavaGenericImport<JbuClass, Jbu>) end;

//  JbvClass = interface(JObjectClass)
//  ['{44D7B870-2EF7-42DF-9099-016E4ED9DC5A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Jah; P2: JMap; P3: Boolean): Jcb; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;Z)Lcom/huawei/hms/scankit/p/cb;
//    {class} procedure a(P1: Boolean); cdecl; overload; //(Z)V
//    {class} function a: Boolean; cdecl; overload; //()Z
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bv')]
//  Jbv = interface(JObject)
//  ['{1E02DB4F-80A0-4E56-A46F-CF704B1355B6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbv = class(TJavaGenericImport<JbvClass, Jbv>) end;

//  JbwClass = interface(JObjectClass)
//  ['{BEFC3ACE-58D8-4AFC-B042-091955A91C57}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jbw; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bw')]
//  Jbw = interface(JObject)
//  ['{03AE7298-7D78-4792-B814-69B7EC47895E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Integer>; P2: Integer; P3: TJavaArray<Integer>): Integer; cdecl; //([II[I)I
//
//    { Property }
//  end;

//  TJbw = class(TJavaGenericImport<JbwClass, Jbw>) end;

//  JbxClass = interface(JObjectClass)
//  ['{4F8830D8-33E7-4DEA-B3A1-9002C8CBACD2}']
//    { static Property Methods }
//    {class} function _Geta: Jbx;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/bx;
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: Jbx read _Geta;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bx')]
//  Jbx = interface(JObject)
//  ['{4938F8F5-4151-4C92-91D7-A89C91B3B231}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbx = class(TJavaGenericImport<JbxClass, Jbx>) end;

//  JbyClass = interface(JObjectClass)
//  ['{742607EA-4492-4254-A09E-EC1EA56E543F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/by')]
//  Jby = interface(JObject)
//  ['{AC473B53-B283-484E-9BAD-0900421274D4}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJby = class(TJavaGenericImport<JbyClass, Jby>) end;

//  JbzClass = interface(JObjectClass)
//  ['{92066DBC-392A-42BC-9CC7-C892B0031258}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/bz')]
//  Jbz = interface(JObject)
//  ['{642E4842-7037-4969-A415-F9F2EA1DCBD8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJbz = class(TJavaGenericImport<JbzClass, Jbz>) end;

//  Jc_1_173Class = interface(JObjectClass)
//  ['{D48993C7-A313-44BA-85C1-970B7A4C82C1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c$1')]
//  Jc_1_173 = interface(JObject)
//  ['{01CDD2CE-ACCC-43DB-8B4A-F1467D767FDC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_1_173 = class(TJavaGenericImport<Jc_1_173Class, Jc_1_173>) end;

//  Jc_aClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{48C6377C-38E8-4204-B5E8-2F6547EB3C94}']
//    { static Property Methods }
//    {class} function _Geta: Jc_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/c$a;
//    {class} function _Getb: Jc_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/c$a;
//    {class} function _Getc: Jc_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/c$a;
//    {class} function _Getd: Jc_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/c$a;
//    {class} function _Gete: Jc_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/c$a;
//    {class} function _Getf: Jc_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/c$a;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jc_a>; cdecl; //()[Lcom/huawei/hms/scankit/p/c$a;
//    {class} function valueOf(P1: JString): Jc_a; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/c$a;
//
//    { static Property }
//    {class} property a: Jc_a read _Geta;
//    {class} property b: Jc_a read _Getb;
//    {class} property c: Jc_a read _Getc;
//    {class} property d: Jc_a read _Getd;
//    {class} property e: Jc_a read _Gete;
//    {class} property f: Jc_a read _Getf;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c$a')]
//  Jc_a = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{1110B21B-7D97-47C7-8C65-AE41AAEB71EF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_a = class(TJavaGenericImport<Jc_aClass, Jc_a>) end;

//  Jc_175Class = interface(JObjectClass)
//  ['{8E685EA6-B047-46C9-90CF-E3E7D9BA909A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_175; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/c')]
//  Jc_175 = interface(JObject)
//  ['{DC5422E6-8479-4FAD-AC98-D6753D16E1B7}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Ja; P2: JMap): Ji; cdecl; //(Lcom/huawei/hms/scankit/p/a;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/i;
//
//    { Property }
//  end;

//  TJc_175 = class(TJavaGenericImport<Jc_175Class, Jc_175>) end;

//  JcaClass = interface(JObjectClass)
//  ['{E1B24830-1261-410F-98AD-D63ED80D5696}']
//    { static Property Methods }
//    {class} function _Geta: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[I
//
//    { static Methods }
//    {class} function a(P1: JCollection): TJavaArray<Integer>; cdecl; overload; //(Ljava/util/Collection;)[I
//    {class} function a(P1: Integer): Integer; cdecl; overload; //(I)I
//
//    { static Property }
//    {class} property a: TJavaArray<Integer> read _Geta;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ca')]
//  Jca = interface(JObject)
//  ['{67FDC3CF-4730-4064-A81A-2565BD3937CC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJca = class(TJavaGenericImport<JcaClass, Jca>) end;

//  JcbClass = interface(JObjectClass)
//  ['{A7CF1E6A-3CB6-4A51-B282-FCEDF32E47C6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jaj; P2: JList): Jcb; cdecl; //(Lcom/huawei/hms/scankit/p/aj;Ljava/util/List;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cb')]
//  Jcb = interface(JObject)
//  ['{86FE4DF3-ECAC-46E4-9105-B41BF7FDB501}']
//    { Property Methods }
//
//    { methods }
//    function a: Jaj; cdecl; //()Lcom/huawei/hms/scankit/p/aj;
//    function b: JList; cdecl; //()Ljava/util/List;
//
//    { Property }
//  end;

//  TJcb = class(TJavaGenericImport<JcbClass, Jcb>) end;

//  JccClass = interface(JObjectClass)
//  ['{FF1FCC62-7CF5-4CC5-8E31-1C1FDEBCCF04}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jcc; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cc')]
//  Jcc = interface(JObject)
//  ['{6C25F02F-B66D-4D80-8E9B-1FA06957A693}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jah; P2: JMap): Jz; cdecl; //(Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJcc = class(TJavaGenericImport<JccClass, Jcc>) end;

//  JcdClass = interface(JObjectClass)
//  ['{284A091A-75B4-41F9-A2DD-2329E2A68801}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jcd; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cd')]
//  Jcd = interface(JObject)
//  ['{73109A9F-AD5F-49DF-BAF3-3CB095FCBE26}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer); cdecl; overload; //(I)V
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    procedure a(P1: TJavaArray<Integer>); cdecl; overload; //Deprecated //([I)V
//    function a: Boolean; cdecl; overload; //()Z
//    procedure a(P1: Boolean); cdecl; overload; //(Z)V
//    procedure b(P1: Integer); cdecl; overload; //(I)V
//    procedure b(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    procedure c(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    procedure d(P1: JString); cdecl; //(Ljava/lang/String;)V
//    procedure a(P1: Int64); cdecl; overload; //(J)V
//    procedure c(P1: Integer); cdecl; overload; //(I)V
//    procedure b(P1: Int64); cdecl; overload; //(J)V
//
//    { Property }
//  end;

//  TJcd = class(TJavaGenericImport<JcdClass, Jcd>) end;

//  JceClass = interface(JObjectClass)
//  ['{A1B55CD6-0D7B-456F-835C-C5603C2FDE69}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Jaj; P2: Jaa; P3: Jaa; P4: Jaa; P5: Jaa; P6: Integer; P7: Integer; P8: JMap): Ji; cdecl; //(Lcom/huawei/hms/scankit/p/aj;Lcom/huawei/hms/scankit/p/aa;Lcom/huawei/hms/scankit/p/aa;Lcom/huawei/hms/scankit/p/aa;Lcom/huawei/hms/scankit/p/aa;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/i;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ce')]
//  Jce = interface(JObject)
//  ['{4F9DA875-F8F5-4A15-865A-6A20C29DF172}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJce = class(TJavaGenericImport<JceClass, Jce>) end;

//  JcfClass = interface(JaaClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/aa
//  ['{D1712856-7B22-44C8-B4AD-67A80783DA0A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cf')]
//  Jcf = interface(Jaa) // or JObject // SuperSignature: com/huawei/hms/scankit/p/aa
//  ['{F24B9CFF-E51B-43F3-8CCC-49A6E5F76D3E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcf = class(TJavaGenericImport<JcfClass, Jcf>) end;

//  JcgClass = interface(JObjectClass)
//  ['{C4B46469-14A7-4B2B-9FAE-3D4BF64C8850}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cg')]
//  Jcg = interface(JObject)
//  ['{7EFE1CF2-4754-4D23-A8E2-3A5E9F8F9BE0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcg = class(TJavaGenericImport<JcgClass, Jcg>) end;

//  JchClass = interface(JObjectClass)
//  ['{040F1DCE-F0F0-4E3F-9C06-A63E70AECC5C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ch')]
//  Jch = interface(JObject)
//  ['{FE8CDE8D-B8C2-4E3A-B57D-4D0ACCE82CFF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJch = class(TJavaGenericImport<JchClass, Jch>) end;

//  JciClass = interface(JObjectClass)
//  ['{0F8F99FC-A7F0-4A95-A320-709C1EBAD849}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ci')]
//  Jci = interface(JObject)
//  ['{B8DCE187-BBA7-40AB-90AA-15671CD175FE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJci = class(TJavaGenericImport<JciClass, Jci>) end;

//  Jcj_1Class = interface(JcjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{10C8C638-8560-4A2A-9E16-44282A30AC82}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cj$1')]
//  Jcj_1 = interface(Jcj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{42F46196-7666-4435-BC1A-C6CBC736969C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcj_1 = class(TJavaGenericImport<Jcj_1Class, Jcj_1>) end;

//  Jcj_2Class = interface(JcjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{AED45FC8-2B1F-488C-82AC-136B46DC2D46}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cj$2')]
//  Jcj_2 = interface(Jcj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{DD492A72-619F-4406-BEF2-6D536C7835D2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcj_2 = class(TJavaGenericImport<Jcj_2Class, Jcj_2>) end;

//  Jcj_3Class = interface(JcjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{40364819-D41E-449D-8817-78FCE9F74005}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cj$3')]
//  Jcj_3 = interface(Jcj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{7FF876DD-FBAE-4022-B0E0-B13EF2A62AE6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcj_3 = class(TJavaGenericImport<Jcj_3Class, Jcj_3>) end;

//  Jcj_4Class = interface(JcjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{9A6B0F2B-D97D-45B3-A7BB-8EF520E89811}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cj$4')]
//  Jcj_4 = interface(Jcj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{06457920-767B-4DCD-BC36-027F6C9ED963}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcj_4 = class(TJavaGenericImport<Jcj_4Class, Jcj_4>) end;

//  Jcj_5Class = interface(JcjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{1E9C74CC-F0E2-40FD-AC19-1705E7C891CE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cj$5')]
//  Jcj_5 = interface(Jcj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{E92D3112-7B94-466C-AF1D-174BC6AB15B0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcj_5 = class(TJavaGenericImport<Jcj_5Class, Jcj_5>) end;

//  Jcj_6Class = interface(JcjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{8DCB6198-86A1-4986-9904-9ABB30352527}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cj$6')]
//  Jcj_6 = interface(Jcj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{7B685D20-398C-466C-AC77-48CF265E9F47}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcj_6 = class(TJavaGenericImport<Jcj_6Class, Jcj_6>) end;

//  Jcj_7Class = interface(JcjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{EA731F9B-6C2C-4446-BFCF-FB66679E2AE9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cj$7')]
//  Jcj_7 = interface(Jcj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{07BF3F4F-15D0-4A50-8D3B-20B8F3051996}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcj_7 = class(TJavaGenericImport<Jcj_7Class, Jcj_7>) end;

//  Jcj_8Class = interface(JcjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{3FFC6B32-279D-4E87-9142-DF17CAA8F33D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cj$8')]
//  Jcj_8 = interface(Jcj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/cj
//  ['{CE6F9BA6-C421-4F8E-A10C-C5917437A0EB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcj_8 = class(TJavaGenericImport<Jcj_8Class, Jcj_8>) end;

//  JcjClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{4CF5E8C5-CF49-46DA-9A0A-A34536EF77A5}']
//    { static Property Methods }
//    {class} function _Geta: Jcj;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cj;
//    {class} function _Getb: Jcj;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cj;
//    {class} function _Getc: Jcj;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cj;
//    {class} function _Getd: Jcj;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cj;
//    {class} function _Gete: Jcj;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cj;
//    {class} function _Getf: Jcj;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cj;
//    {class} function _Getg: Jcj;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cj;
//    {class} function _Geth: Jcj;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cj;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jcj>; cdecl; //()[Lcom/huawei/hms/scankit/p/cj;
//    {class} function valueOf(P1: JString): Jcj; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/cj;
//
//    { static Property }
//    {class} property a: Jcj read _Geta;
//    {class} property b: Jcj read _Getb;
//    {class} property c: Jcj read _Getc;
//    {class} property d: Jcj read _Getd;
//    {class} property e: Jcj read _Gete;
//    {class} property f: Jcj read _Getf;
//    {class} property g: Jcj read _Getg;
//    {class} property h: Jcj read _Geth;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cj')]
//  Jcj = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{4835A7AA-2507-4428-BFA6-1C2135229A8B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcj = class(TJavaGenericImport<JcjClass, Jcj>) end;

//  Jck_1Class = interface(JObjectClass)
//  ['{FE4D7213-E198-4C67-8FC6-0A03EBA46A44}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ck$1')]
//  Jck_1 = interface(JObject)
//  ['{9F305562-75FE-4BA5-9DA8-90243F7A0475}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJck_1 = class(TJavaGenericImport<Jck_1Class, Jck_1>) end;

//  JckClass = interface(JObjectClass)
//  ['{FB5FDCCB-C6E8-4231-81E3-0271D8DD5E42}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ck')]
//  Jck = interface(JObject)
//  ['{C22CA885-72B0-48DB-925A-A8D4D266E6D4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJck = class(TJavaGenericImport<JckClass, Jck>) end;

//  JclClass = interface(JObjectClass)
//  ['{DE1E958E-39F6-42EA-8AE4-CFF371FC3A6F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jcl; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cl')]
//  Jcl = interface(JObject)
//  ['{9AF515AE-048B-4F99-9542-CCB0A930C18A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jaj; P2: JMap): Ji; cdecl; //(Lcom/huawei/hms/scankit/p/aj;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/i;
//
//    { Property }
//  end;

//  TJcl = class(TJavaGenericImport<JclClass, Jcl>) end;

//  JcmClass = interface(JObjectClass)
//  ['{6A4CFEA6-5001-4661-A479-9DB83748B3D8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jaj): Jcm; cdecl; //(Lcom/huawei/hms/scankit/p/aj;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cm')]
//  Jcm = interface(JObject)
//  ['{20DB5C70-733A-4DA4-A07A-57D8938A7871}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JMap): Jk; cdecl; //(Ljava/util/Map;)Lcom/huawei/hms/scankit/p/k;
//
//    { Property }
//  end;

//  TJcm = class(TJavaGenericImport<JcmClass, Jcm>) end;

//  JcnClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{D1BF95A4-A5B1-4BD8-86D5-4EFA5621D821}']
//    { static Property Methods }
//    {class} function _Geta: Jcn;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cn;
//    {class} function _Getb: Jcn;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cn;
//    {class} function _Getc: Jcn;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cn;
//    {class} function _Getd: Jcn;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cn;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jcn>; cdecl; //()[Lcom/huawei/hms/scankit/p/cn;
//    {class} function valueOf(P1: JString): Jcn; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/cn;
//    {class} function a(P1: Integer): Jcn; cdecl; overload; //(I)Lcom/huawei/hms/scankit/p/cn;
//
//    { static Property }
//    {class} property a: Jcn read _Geta;
//    {class} property b: Jcn read _Getb;
//    {class} property c: Jcn read _Getc;
//    {class} property d: Jcn read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cn')]
//  Jcn = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{4D373B41-C58D-4616-984F-D48F8A25DED1}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//
//    { Property }
//  end;

//  TJcn = class(TJavaGenericImport<JcnClass, Jcn>) end;

//  JcoClass = interface(JaaClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/aa
//  ['{A82355A0-970B-494B-B40B-FA3FB46D504D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single; P2: Single; P3: Single; P4: Integer): Jco; cdecl; //(FFFI)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/co')]
//  Jco = interface(Jaa) // or JObject // SuperSignature: com/huawei/hms/scankit/p/aa
//  ['{BDB8E1D6-13EC-402A-B8DE-7B55C710F5AE}']
//    { Property Methods }
//
//    { methods }
//    function d: Single; cdecl; //()F
//
//    { Property }
//  end;

//  TJco = class(TJavaGenericImport<JcoClass, Jco>) end;

//  Jcp_1Class = interface(JObjectClass)
//  ['{4BDF1B59-AE1C-430E-B829-0B25EFD38783}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cp$1')]
//  Jcp_1 = interface(JObject)
//  ['{0E8B1DFF-64D7-4392-899A-23F32D304065}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcp_1 = class(TJavaGenericImport<Jcp_1Class, Jcp_1>) end;

//  Jcp_aClass = interface(JObjectClass)
//  ['{90259EDF-A13A-47D2-8FCB-A665642B813F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cp$a')]
//  Jcp_a = interface(JObject)
//  ['{7B2570FD-F983-41BF-BD3C-D9BA6E423C17}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jco; P2: Jco): Integer; cdecl; //(Lcom/huawei/hms/scankit/p/co;Lcom/huawei/hms/scankit/p/co;)I
//    function compare(P1: JObject; P2: JObject): Integer; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)I
//
//    { Property }
//  end;

//  TJcp_a = class(TJavaGenericImport<Jcp_aClass, Jcp_a>) end;

//  Jcp_bClass = interface(JObjectClass)
//  ['{4C8F496C-6766-46D7-865A-B6E86F57A245}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cp$b')]
//  Jcp_b = interface(JObject)
//  ['{45FD628C-3384-4BF4-8676-5D7A471C8D37}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jco; P2: Jco): Integer; cdecl; //(Lcom/huawei/hms/scankit/p/co;Lcom/huawei/hms/scankit/p/co;)I
//    function compare(P1: JObject; P2: JObject): Integer; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)I
//
//    { Property }
//  end;

//  TJcp_b = class(TJavaGenericImport<Jcp_bClass, Jcp_b>) end;

//  Jcp_cClass = interface(JObjectClass)
//  ['{7C316D91-3442-4F72-BB09-DF68F7F1A8C5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cp$c')]
//  Jcp_c = interface(JObject)
//  ['{1C9DA399-BE47-4AB4-ABEE-50D7AFD630B5}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jco; P2: Jco): Integer; cdecl; //(Lcom/huawei/hms/scankit/p/co;Lcom/huawei/hms/scankit/p/co;)I
//    function compare(P1: JObject; P2: JObject): Integer; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)I
//
//    { Property }
//  end;

//  TJcp_c = class(TJavaGenericImport<Jcp_cClass, Jcp_c>) end;

//  JcpClass = interface(JObjectClass)
//  ['{E188384C-B447-46C9-91ED-C42464951A3B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jaj; P2: Jab): Jcp; cdecl; //(Lcom/huawei/hms/scankit/p/aj;Lcom/huawei/hms/scankit/p/ab;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cp')]
//  Jcp = interface(JObject)
//  ['{F758268E-77B1-4D2C-9C0C-7BD20CB4C2E2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcp = class(TJavaGenericImport<JcpClass, Jcp>) end;

//  JcqClass = interface(JObjectClass)
//  ['{4927E6D3-69C4-49C4-9C5E-EE7FAE146809}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaObjectArray<Jco>): Jcq; cdecl; //([Lcom/huawei/hms/scankit/p/co;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cq')]
//  Jcq = interface(JObject)
//  ['{921A58EC-3EFB-4031-B6B7-F0CC139FBB92}']
//    { Property Methods }
//
//    { methods }
//    function a: Jco; cdecl; //()Lcom/huawei/hms/scankit/p/co;
//    function b: Jco; cdecl; //()Lcom/huawei/hms/scankit/p/co;
//    function c: Jco; cdecl; //()Lcom/huawei/hms/scankit/p/co;
//
//    { Property }
//  end;

//  TJcq = class(TJavaGenericImport<JcqClass, Jcq>) end;

//  JcrClass = interface(JObjectClass)
//  ['{E654E0EB-4ADE-470E-86DE-16C76EDF2B97}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cr')]
//  Jcr = interface(JObject)
//  ['{754A8FE6-5B68-4173-BE9B-DDD94CEADE38}']
//    { Property Methods }
//
//    { methods }
//    function hashCode: Integer; cdecl; //()I
//    function equals(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
//
//    { Property }
//  end;

//  TJcr = class(TJavaGenericImport<JcrClass, Jcr>) end;

//  JcsClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{CE676D99-35BA-46A8-A043-4AFC78F648C8}']
//    { static Property Methods }
//    {class} function _Geta: Jcs;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cs;
//    {class} function _Getb: Jcs;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cs;
//    {class} function _Getc: Jcs;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cs;
//    {class} function _Getd: Jcs;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cs;
//    {class} function _Gete: Jcs;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cs;
//    {class} function _Getf: Jcs;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cs;
//    {class} function _Getg: Jcs;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cs;
//    {class} function _Geth: Jcs;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cs;
//    {class} function _Geti: Jcs;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cs;
//    {class} function _Getj: Jcs;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cs;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jcs>; cdecl; //()[Lcom/huawei/hms/scankit/p/cs;
//    {class} function valueOf(P1: JString): Jcs; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/cs;
//    {class} function a(P1: Integer): Jcs; cdecl; overload; //(I)Lcom/huawei/hms/scankit/p/cs;
//
//    { static Property }
//    {class} property a: Jcs read _Geta;
//    {class} property b: Jcs read _Getb;
//    {class} property c: Jcs read _Getc;
//    {class} property d: Jcs read _Getd;
//    {class} property e: Jcs read _Gete;
//    {class} property f: Jcs read _Getf;
//    {class} property g: Jcs read _Getg;
//    {class} property h: Jcs read _Geth;
//    {class} property i: Jcs read _Geti;
//    {class} property j: Jcs read _Getj;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cs')]
//  Jcs = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{EF4A2D9D-3498-4855-ADEA-828DE0C821FB}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jcv): Integer; cdecl; overload; //(Lcom/huawei/hms/scankit/p/cv;)I
//    function a: Integer; cdecl; overload; //()I
//
//    { Property }
//  end;

//  TJcs = class(TJavaGenericImport<JcsClass, Jcs>) end;

//  JctClass = interface(JObjectClass)
//  ['{C788E621-4977-4EF2-A19B-59FBC1848B10}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ct')]
//  Jct = interface(JObject)
//  ['{269F4C54-1A81-40A8-B553-37E97556F3EF}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaObjectArray<Jaa>); cdecl; //([Lcom/huawei/hms/scankit/p/aa;)V
//
//    { Property }
//  end;

//  TJct = class(TJavaGenericImport<JctClass, Jct>) end;

//  JcuClass = interface(JObjectClass)
//  ['{FEE3AD39-F7CD-42E6-9FFD-D8303F374E53}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jcu; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cu')]
//  Jcu = interface(JObject)
//  ['{AADB227E-F72F-468A-A0BE-AF7759C65252}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jah; P2: JMap): Jz; cdecl; //(Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJcu = class(TJavaGenericImport<JcuClass, Jcu>) end;

//  Jcv_aClass = interface(JObjectClass)
//  ['{00673916-D9E5-4DBF-8762-C60B778E0241}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cv$a')]
//  Jcv_a = interface(JObject)
//  ['{80ECDFE2-3E4E-4F77-B4CA-8E9740271240}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; //()I
//    function b: Integer; cdecl; //()I
//
//    { Property }
//  end;

//  TJcv_a = class(TJavaGenericImport<Jcv_aClass, Jcv_a>) end;

//  Jcv_bClass = interface(JObjectClass)
//  ['{608F577B-E3CA-48ED-B29F-3FF3F6A98BC8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cv$b')]
//  Jcv_b = interface(JObject)
//  ['{E3CE7EC3-297D-4B5B-8B18-81EA01C22E5B}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; //()I
//    function b: Integer; cdecl; //()I
//    function c: Integer; cdecl; //()I
//    function d: TJavaObjectArray<Jcv_a>; cdecl; //()[Lcom/huawei/hms/scankit/p/cv$a;
//
//    { Property }
//  end;

//  TJcv_b = class(TJavaGenericImport<Jcv_bClass, Jcv_b>) end;

//  JcvClass = interface(JObjectClass)
//  ['{351D04DD-202A-4B6C-A020-A6BF15244C6F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): Jcv; cdecl; overload; //(I)Lcom/huawei/hms/scankit/p/cv;
//    {class} function b(P1: Integer): Jcv; cdecl; overload; //(I)Lcom/huawei/hms/scankit/p/cv;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cv')]
//  Jcv = interface(JObject)
//  ['{942C52E9-C3C0-4027-95CB-4C3D69D9DCD6}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    function b: TJavaArray<Integer>; cdecl; overload; //()[I
//    function c: Integer; cdecl; //()I
//    function d: Integer; cdecl; //()I
//    function a(P1: Jcn): Jcv_b; cdecl; overload; //(Lcom/huawei/hms/scankit/p/cn;)Lcom/huawei/hms/scankit/p/cv$b;
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJcv = class(TJavaGenericImport<JcvClass, Jcv>) end;

//  JcwClass = interface(JObjectClass)
//  ['{CCD0DF17-9586-4111-AC08-B52E3DB67718}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JCameraManager; P2: Boolean); cdecl; //(Lcom/huawei/hms/ml/camera/CameraManager;Z)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cw')]
//  Jcw = interface(JObject)
//  ['{0F1F3902-C26E-46B7-8478-E8C7DE067729}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcw = class(TJavaGenericImport<JcwClass, Jcw>) end;

//  JcxClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{AAE95AE6-3818-4C7D-9D71-69A34A7CC6FA}']
//    { static Property Methods }
//    {class} function _Geta: Jcx;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cx;
//    {class} function _Getb: Jcx;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cx;
//    {class} function _Getc: Jcx;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/cx;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jcx>; cdecl; //()[Lcom/huawei/hms/scankit/p/cx;
//    {class} function valueOf(P1: JString): Jcx; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/cx;
//    {class} function a(P1: JSharedPreferences): Jcx; cdecl; //(Landroid/content/SharedPreferences;)Lcom/huawei/hms/scankit/p/cx;
//
//    { static Property }
//    {class} property a: Jcx read _Geta;
//    {class} property b: Jcx read _Getb;
//    {class} property c: Jcx read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cx')]
//  Jcx = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{60747127-01B7-447A-93F5-019B03A90B1C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcx = class(TJavaGenericImport<JcxClass, Jcx>) end;

//  JcyClass = interface(JObjectClass)
//  ['{9D7462E8-DCF8-4A91-94D0-E92FD3DB465F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer): JList; cdecl; //(I)Ljava/util/List;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cy')]
//  Jcy = interface(JObject)
//  ['{0F8D5D69-8DBA-4FB6-B195-6DCA1ECAE173}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcy = class(TJavaGenericImport<JcyClass, Jcy>) end;

//  JczClass = interface(JObjectClass)
//  ['{0EAD1B8D-4EBC-4E34-BF49-CB194AB74111}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
//    {class} function _Getb: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
//    {class} function _Getc: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
//    {class} function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
//    {class} function _Gete: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
//    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//    {class} function _Getg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
//    {class} function _Geth: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
//
//    { static Methods }
//    {class} procedure a; cdecl; overload; //()V
//    {class} procedure a(P1: Integer); cdecl; overload; //(I)V
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: Boolean read _Getb;
//    {class} property c: Boolean read _Getc;
//    {class} property d: Boolean read _Getd;
//    {class} property e: Single read _Gete;
//    {class} property f: Integer read _Getf;
//    {class} property g: Boolean read _Getg;
//    {class} property h: Boolean read _Geth;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/cz')]
//  Jcz = interface(JObject)
//  ['{B9E4904C-C72F-466F-ADE7-7AB833E9B02B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJcz = class(TJavaGenericImport<JczClass, Jcz>) end;

//  Jd_aClass = interface(JObjectClass)
//  ['{29FFC37B-88B3-4403-81DD-36C5DC36AB19}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d$a')]
//  Jd_a = interface(JObject)
//  ['{B46DFE75-C41B-4C4F-B0E2-A2E46D1DFE7A}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJd_a = class(TJavaGenericImport<Jd_aClass, Jd_a>) end;

//  Jd_218Class = interface(JObjectClass)
//  ['{C6E50807-15C7-4E9E-8602-7676B60BC208}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jaj): Jd_218; cdecl; //(Lcom/huawei/hms/scankit/p/aj;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/d')]
//  Jd_218 = interface(JObject)
//  ['{7873D94D-3769-498E-83E0-375F5ACE092E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Boolean): Ja; cdecl; //(Z)Lcom/huawei/hms/scankit/p/a;
//
//    { Property }
//  end;

//  TJd_218 = class(TJavaGenericImport<Jd_218Class, Jd_218>) end;

//  JdaClass = interface(JObjectClass)
//  ['{86F16088-B32C-4B45-A744-0E974F6209AF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Boolean): Jda; cdecl; //(Landroid/content/Context;Z)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/da')]
//  Jda = interface(JObject)
//  ['{BBC139B4-E7FE-4761-BC95-86AB78571EF9}']
//    { Property Methods }
//
//    { methods }
//    function a: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJda = class(TJavaGenericImport<JdaClass, Jda>) end;

//  Jdb_1Class = interface(JSparseArrayClass) // or JObjectClass // SuperSignature: android/util/SparseArray
//  ['{4F1C7EEF-FEA9-4978-BFE5-CFE31A5A2C4D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/db$1')]
//  Jdb_1 = interface(JSparseArray) // or JObject // SuperSignature: android/util/SparseArray
//  ['{65EA26A7-2C2E-4CDD-80CD-B99C0646A8AC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdb_1 = class(TJavaGenericImport<Jdb_1Class, Jdb_1>) end;

//  Jdb_2Class = interface(JSparseArrayClass) // or JObjectClass // SuperSignature: android/util/SparseArray
//  ['{EE1D9108-F59E-45D4-890D-3EF89C0E8C9E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/db$2')]
//  Jdb_2 = interface(JSparseArray) // or JObject // SuperSignature: android/util/SparseArray
//  ['{6A30F8D0-B901-4F05-A587-16156714D5E8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdb_2 = class(TJavaGenericImport<Jdb_2Class, Jdb_2>) end;

//  JdbClass = interface(JObjectClass)
//  ['{887A4000-F540-43B0-8C46-D9D53568722E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/db')]
//  Jdb = interface(JObject)
//  ['{1BFF9CCC-6C48-41E0-BED4-8CD013376757}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdb = class(TJavaGenericImport<JdbClass, Jdb>) end;

//  Jdc_1Class = interface(JSimpleDateFormatClass) // or JObjectClass // SuperSignature: java/text/SimpleDateFormat
//  ['{ABE7F38A-11DA-4150-ACC3-2C9D9AA54B9A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dc$1')]
//  Jdc_1 = interface(JSimpleDateFormat) // or JObject // SuperSignature: java/text/SimpleDateFormat
//  ['{411BC3EB-B76E-4345-BC20-0128F85C537F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdc_1 = class(TJavaGenericImport<Jdc_1Class, Jdc_1>) end;

//  Jdc_2Class = interface(JLinkedHashMapClass) // or JObjectClass // SuperSignature: java/util/LinkedHashMap
//  ['{11F1C682-6E8B-4E35-BDDE-63F9AE7EEC21}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dc$2')]
//  Jdc_2 = interface(JLinkedHashMap) // or JObject // SuperSignature: java/util/LinkedHashMap
//  ['{0F6E477A-BCE3-4F77-99FB-0D039F34CBF1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdc_2 = class(TJavaGenericImport<Jdc_2Class, Jdc_2>) end;

//  JdcClass = interface(JdbClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/db
//  ['{0412F765-F451-4358-BD52-9115CD5DC2D3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBundle; P2: JString): Jdc; cdecl; //(Landroid/os/Bundle;Ljava/lang/String;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dc')]
//  Jdc = interface(Jdb) // or JObject // SuperSignature: com/huawei/hms/scankit/p/db
//  ['{07C19AC0-9C43-46EF-9A74-1543F720DC59}']
//    { Property Methods }
//
//    { methods }
//    procedure b; cdecl; //()V
//    procedure c; cdecl; overload; //()V
//    procedure a(P1: TJavaObjectArray<JHmsScan>); cdecl; //([Lcom/huawei/hms/ml/scan/HmsScan;)V
//    procedure c(P1: Integer); cdecl; overload; //(I)V
//
//    { Property }
//  end;

//  TJdc = class(TJavaGenericImport<JdcClass, Jdc>) end;

//  Jdd_1Class = interface(JSimpleDateFormatClass) // or JObjectClass // SuperSignature: java/text/SimpleDateFormat
//  ['{522F8620-1D63-4EA7-8FB2-FC7387161DF0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dd$1')]
//  Jdd_1 = interface(JSimpleDateFormat) // or JObject // SuperSignature: java/text/SimpleDateFormat
//  ['{5B350AF1-36D1-47B3-8FE8-CD56B49C3739}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdd_1 = class(TJavaGenericImport<Jdd_1Class, Jdd_1>) end;

//  Jdd_2Class = interface(JSimpleDateFormatClass) // or JObjectClass // SuperSignature: java/text/SimpleDateFormat
//  ['{210F26AB-0C7D-4426-8F30-B7420B92CB45}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dd$2')]
//  Jdd_2 = interface(JSimpleDateFormat) // or JObject // SuperSignature: java/text/SimpleDateFormat
//  ['{2F11CA28-69F4-4720-8AE3-8DBDCDDB15C8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdd_2 = class(TJavaGenericImport<Jdd_2Class, Jdd_2>) end;

//  Jdd_aClass = interface(JObjectClass)
//  ['{662D4D3D-22B0-401B-AEFB-8FC9CE0ED2E1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dd$a')]
//  Jdd_a = interface(JObject)
//  ['{125CFECD-8ACD-4309-AE9E-B77BB5961C96}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer): Jdd_a; cdecl; //(I)Lcom/huawei/hms/scankit/p/dd$a;
//
//    { Property }
//  end;

//  TJdd_a = class(TJavaGenericImport<Jdd_aClass, Jdd_a>) end;

//  Jdd_b_1Class = interface(JTimerTaskClass) // or JObjectClass // SuperSignature: java/util/TimerTask
//  ['{9DAE863A-2D3F-4F4A-B045-3D58344039FC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dd$b$1')]
//  Jdd_b_1 = interface(JTimerTask) // or JObject // SuperSignature: java/util/TimerTask
//  ['{221DB3FD-7220-4425-94A4-07D9182CE31A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJdd_b_1 = class(TJavaGenericImport<Jdd_b_1Class, Jdd_b_1>) end;

//  Jdd_b_aClass = interface(JObjectClass)
//  ['{856B3904-EFA9-4339-AA5F-AF6B70E10E5A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dd$b$a')]
//  Jdd_b_a = interface(JObject)
//  ['{CC44ADBA-7AA6-4032-86E5-D6BFD1D0E92C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdd_b_a = class(TJavaGenericImport<Jdd_b_aClass, Jdd_b_a>) end;

//  Jdd_b_b_1Class = interface(JSparseArrayClass) // or JObjectClass // SuperSignature: android/util/SparseArray
//  ['{4CDAB255-1380-46E2-9EE0-3D07B3BE3D39}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dd$b$b$1')]
//  Jdd_b_b_1 = interface(JSparseArray) // or JObject // SuperSignature: android/util/SparseArray
//  ['{A744C09D-31EE-4DC6-B835-29C323CB4C01}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdd_b_b_1 = class(TJavaGenericImport<Jdd_b_b_1Class, Jdd_b_b_1>) end;

//  Jdd_b_b_2Class = interface(JAtomicIntegerClass) // or JObjectClass // SuperSignature: java/util/concurrent/atomic/AtomicInteger
//  ['{4B63487F-6832-4E17-8DB2-4DFCC0A565B0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dd$b$b$2')]
//  Jdd_b_b_2 = interface(JAtomicInteger) // or JObject // SuperSignature: java/util/concurrent/atomic/AtomicInteger
//  ['{7169AAF1-0979-48DB-8224-6A9DA48CF76D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdd_b_b_2 = class(TJavaGenericImport<Jdd_b_b_2Class, Jdd_b_b_2>) end;

//  Jdd_b_bClass = interface(JObjectClass)
//  ['{6611544F-38D0-4D65-87A5-9A1E55B9D96E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dd$b$b')]
//  Jdd_b_b = interface(JObject)
//  ['{4625B460-2E71-4CCA-BB0B-EC679D860FF2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdd_b_b = class(TJavaGenericImport<Jdd_b_bClass, Jdd_b_b>) end;

//  Jdd_bClass = interface(JObjectClass)
//  ['{56C1C35C-F80F-4AC3-8F19-1DD2263CB58C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dd$b')]
//  Jdd_b = interface(JObject)
//  ['{64D6AED9-70B4-41F8-9C81-A3FC294D0B7E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdd_b = class(TJavaGenericImport<Jdd_bClass, Jdd_b>) end;

//  JddClass = interface(JdbClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/db
//  ['{9BFEEEE1-CEFE-4413-AC22-08A334200746}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBundle; P2: JString): Jdd; cdecl; //(Landroid/os/Bundle;Ljava/lang/String;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dd')]
//  Jdd = interface(Jdb) // or JObject // SuperSignature: com/huawei/hms/scankit/p/db
//  ['{3A8DCB47-1953-4DE9-BCCC-BF115BDEB19D}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    function a(P1: Boolean; P2: Integer): Jdd_a; cdecl; overload; //(ZI)Lcom/huawei/hms/scankit/p/dd$a;
//    procedure a(P1: TJavaObjectArray<JHmsScan>; P2: Jdd_a); cdecl; overload; //([Lcom/huawei/hms/ml/scan/HmsScan;Lcom/huawei/hms/scankit/p/dd$a;)V
//
//    { Property }
//  end;

//  TJdd = class(TJavaGenericImport<JddClass, Jdd>) end;

//  Jde_1Class = interface(JLinkedHashMapClass) // or JObjectClass // SuperSignature: java/util/LinkedHashMap
//  ['{9A085F84-7728-4D4F-BDA5-6A4BBB36EEBE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/de$1')]
//  Jde_1 = interface(JLinkedHashMap) // or JObject // SuperSignature: java/util/LinkedHashMap
//  ['{069BAE22-6854-46E7-A7D5-70B900F0254A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJde_1 = class(TJavaGenericImport<Jde_1Class, Jde_1>) end;

//  JdeClass = interface(JdbClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/db
//  ['{2D50E86A-179D-436E-B44F-2262CB74C6BE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jde; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/de')]
//  Jde = interface(Jdb) // or JObject // SuperSignature: com/huawei/hms/scankit/p/db
//  ['{FDE3B6E2-73E5-4264-95A5-890E5643485C}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JBundle); cdecl; //(Landroid/os/Bundle;)V
//
//    { Property }
//  end;

//  TJde = class(TJavaGenericImport<JdeClass, Jde>) end;

//  JdfClass = interface(JObjectClass)
//  ['{6B5E30F2-F8D2-4F60-9F66-33361C53D2E4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdf; cdecl; //()V
//    {class} function a(P1: JContext): JBundle; cdecl; //(Landroid/content/Context;)Landroid/os/Bundle;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/df')]
//  Jdf = interface(JObject)
//  ['{CFD3D9E2-42A3-43FF-87E1-81CB2C381319}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdf = class(TJavaGenericImport<JdfClass, Jdf>) end;

//  Jdg_1Class = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
//  ['{A79A8A93-37A3-4A9C-A405-8513AD08B3B9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dg$1')]
//  Jdg_1 = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
//  ['{A47BF003-33CC-4E72-BFE7-3243C43F2186}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJdg_1 = class(TJavaGenericImport<Jdg_1Class, Jdg_1>) end;

//  Jdg_aClass = interface(JObjectClass)
//  ['{70D73401-904A-417E-9D50-8174A7D8BDB8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dg$a')]
//  Jdg_a = interface(JObject)
//  ['{2236AAFA-5EE4-403B-AB86-571A1C6D40F4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdg_a = class(TJavaGenericImport<Jdg_aClass, Jdg_a>) end;

//  Jdg_bClass = interface(JTimerTaskClass) // or JObjectClass // SuperSignature: java/util/TimerTask
//  ['{84E1F36B-DA2A-421C-979F-23F7B200E308}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dg$b')]
//  Jdg_b = interface(JTimerTask) // or JObject // SuperSignature: java/util/TimerTask
//  ['{5D7B02C0-5565-4E7A-9CFF-36B28863FAFA}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJdg_b = class(TJavaGenericImport<Jdg_bClass, Jdg_b>) end;

//  JdgClass = interface(JObjectClass)
//  ['{33802427-6FCF-4126-9CF8-1A44E3CDB377}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jdg; cdecl; overload; //()Lcom/huawei/hms/scankit/p/dg;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dg')]
//  Jdg = interface(JObject)
//  ['{204D197E-4F1D-4936-978C-3BE4B2048589}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString; P2: JLinkedHashMap); cdecl; overload; //(Ljava/lang/String;Ljava/util/LinkedHashMap;)V
//
//    { Property }
//  end;

//  TJdg = class(TJavaGenericImport<JdgClass, Jdg>) end;

//  JdhClass = interface(JObjectClass)
//  ['{9FDF56C7-282F-4A90-8B3F-F645BD9BB20B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext): JString; cdecl; overload; //(Landroid/content/Context;)Ljava/lang/String;
//    {class} function a: JString; cdecl; overload; //()Ljava/lang/String;
//    {class} function b: JString; cdecl; overload; //()Ljava/lang/String;
//    {class} function b(P1: JContext): JString; cdecl; overload; //(Landroid/content/Context;)Ljava/lang/String;
//    {class} function c: JString; cdecl; //()Ljava/lang/String;
//    {class} function d: JString; cdecl; //()Ljava/lang/String;
//    {class} function a(P1: JContext; P2: Boolean): JString; cdecl; overload; //(Landroid/content/Context;Z)Ljava/lang/String;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dh')]
//  Jdh = interface(JObject)
//  ['{39E46C2C-0BBF-490D-9796-C6C4674646B3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdh = class(TJavaGenericImport<JdhClass, Jdh>) end;

//  JdiClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{FB35C136-CB47-478C-84A9-7326E79DADB4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdi; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/di')]
//  Jdi = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{34D3FDB2-96CE-4DF3-8840-30015DF303B1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdi = class(TJavaGenericImport<JdiClass, Jdi>) end;

//  JdjClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{523D13BB-2263-4AC6-B59A-5ED556808E58}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdj; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dj')]
//  Jdj = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{846FE4C3-645C-4728-B695-68B7412732F2}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdj = class(TJavaGenericImport<JdjClass, Jdj>) end;

//  JdkClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{336D966D-C98C-44FB-9632-4AEA188FDE2D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdk; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dk')]
//  Jdk = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{AD9D499C-7C60-4152-B402-AFAEC58C1FD1}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdk = class(TJavaGenericImport<JdkClass, Jdk>) end;

//  Jdl_1Class = interface(JArrayListClass) // or JObjectClass // SuperSignature: java/util/ArrayList
//  ['{89D1669D-533D-4BCC-92D1-5B04818203BE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dl$1')]
//  Jdl_1 = interface(JArrayList) // or JObject // SuperSignature: java/util/ArrayList
//  ['{00457E2B-FC89-4284-B3B2-47043047C480}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdl_1 = class(TJavaGenericImport<Jdl_1Class, Jdl_1>) end;

//  JdlClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{2307F207-5790-4855-83F0-E25757810EB1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdl; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dl')]
//  Jdl = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{1F049EA7-FEE1-47E6-A7D8-0322143EAEBD}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; overload; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//    function a(P1: TJavaObjectArray<JString>; P2: JString): JHmsScan_DriverInfo; cdecl; overload; //([Ljava/lang/String;Ljava/lang/String;)Lcom/huawei/hms/ml/scan/HmsScan$DriverInfo;
//
//    { Property }
//  end;

//  TJdl = class(TJavaGenericImport<JdlClass, Jdl>) end;

//  JdmClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{8DB93927-E816-4F3B-BEF3-435DBE09BB37}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdm; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dm')]
//  Jdm = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{D6632BD6-AB05-446B-91E4-EB161AB6C6A0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdm = class(TJavaGenericImport<JdmClass, Jdm>) end;

//  JdnClass = interface(JObjectClass)
//  ['{13999B1F-157C-4A30-992E-2A23B296190E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dn')]
//  Jdn = interface(JObject)
//  ['{A41D5259-BB0B-4BFB-897D-BA79862D615C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJdn = class(TJavaGenericImport<JdnClass, Jdn>) end;

//  JdoClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{00D10576-1941-494F-B97F-BB1F90B02802}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdo; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/do')]
//  Jdo = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{ED046D22-BAD1-42C9-BE85-903293B670B0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdo = class(TJavaGenericImport<JdoClass, Jdo>) end;

//  JdpClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{59BAB176-DB21-406D-9F14-9FB2D099C2E4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdp; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dp')]
//  Jdp = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{608AB4B9-80C1-4F79-9C21-D1F61EA4C724}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdp = class(TJavaGenericImport<JdpClass, Jdp>) end;

//  JdqClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{FBE07E82-8A5F-43EC-AF30-E1E1F3B0849A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdq; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dq')]
//  Jdq = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{10E0EDD7-6ACE-4185-935B-4C8E84B0A9B0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdq = class(TJavaGenericImport<JdqClass, Jdq>) end;

//  JdrClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{60028039-D31B-4485-B31D-70B163DCDF93}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdr; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dr')]
//  Jdr = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{66DD435B-417B-4394-BC3E-DEC1EC5BB104}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdr = class(TJavaGenericImport<JdrClass, Jdr>) end;

//  JdsClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{462D6366-9EE2-4134-8CEF-AB592F762023}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jds; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ds')]
//  Jds = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{4D38C4EE-4A4D-41D5-854F-BECECE884D50}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJds = class(TJavaGenericImport<JdsClass, Jds>) end;

//  JdtClass = interface(JObjectClass)
//  ['{F5A27220-484F-4779-AA26-766FE81CFD46}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdt; cdecl; //()V
//    {class} function c(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//    {class} function a(P1: TJavaObjectArray<Jz>): TJavaObjectArray<JHmsScan>; cdecl; overload; //([Lcom/huawei/hms/scankit/p/z;)[Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dt')]
//  Jdt = interface(JObject)
//  ['{199CC417-B0C1-4907-BF77-B7383EF71189}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; overload; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdt = class(TJavaGenericImport<JdtClass, Jdt>) end;

//  JduClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{8C6DC97A-D378-4ABF-93F1-2EB9CDD804AB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdu; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/du')]
//  Jdu = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{192D37F8-9CFC-413B-9D6F-33634076E222}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdu = class(TJavaGenericImport<JduClass, Jdu>) end;

//  JdvClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{8B1B420F-FD0F-4B01-B7CD-BADD58ACA4D5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdv; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dv')]
//  Jdv = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{38C32170-D282-42B8-832F-41C03286F374}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdv = class(TJavaGenericImport<JdvClass, Jdv>) end;

//  JdwClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{5A06499B-4912-4D98-BAE5-47A4709E657B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdw; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dw')]
//  Jdw = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{73372A7E-EC25-40F1-BC93-50811779B850}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdw = class(TJavaGenericImport<JdwClass, Jdw>) end;

//  JdxClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{3A814274-0B07-4871-B137-2EBE6CCDD891}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdx; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dx')]
//  Jdx = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{2CCF6A7D-1BAB-474F-ADAB-5339A14C4C0C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdx = class(TJavaGenericImport<JdxClass, Jdx>) end;

//  JdyClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{69EEB540-77D3-4819-B257-798297BED580}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdy; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dy')]
//  Jdy = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{5C9A1EE6-3475-4764-8D51-5ECFB57E20D8}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdy = class(TJavaGenericImport<JdyClass, Jdy>) end;

//  JdzClass = interface(JdtClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{794505DA-3175-487A-8DA5-170017635390}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jdz; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/dz')]
//  Jdz = interface(Jdt) // or JObject // SuperSignature: com/huawei/hms/scankit/p/dt
//  ['{E8F0D6F1-5776-435B-BE70-01696C6E2E2C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jz): JHmsScan; cdecl; //(Lcom/huawei/hms/scankit/p/z;)Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJdz = class(TJavaGenericImport<JdzClass, Jdz>) end;

//  Je_263Class = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
//  ['{B9FCAED9-08D5-42A8-856B-4C588F39BBD6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Je; cdecl; overload; //()Lcom/huawei/hms/scankit/p/e;
//    {class} function a(P1: JString): Je; cdecl; overload; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/e;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/e')]
//  Je_263 = interface(JException) // or JObject // SuperSignature: java/lang/Exception
//  ['{F62E967A-78E8-47CE-AD24-65B2ED5E1F02}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe_263 = class(TJavaGenericImport<Je_263Class, Je_263>) end;

//  JeaClass = interface(JObjectClass)
//  ['{DBC1A552-6F47-4CAD-9304-0689EB213D90}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ea')]
//  Jea = interface(JObject)
//  ['{F6EDAE24-5094-4DC3-B6DC-9BC6160DCACD}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; //()I
//    function b: Integer; cdecl; //()I
//    function equals(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
//    function hashCode: Integer; cdecl; //()I
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJea = class(TJavaGenericImport<JeaClass, Jea>) end;

//  Jeb_1Class = interface(JObjectClass)
//  ['{4F4D8DC9-9F54-4686-9C54-E5ADF66013C1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/eb$1')]
//  Jeb_1 = interface(JObject)
//  ['{9A0AE1DF-230A-4FBC-8322-3DA6C66C7218}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJeb_1 = class(TJavaGenericImport<Jeb_1Class, Jeb_1>) end;

//  JebClass = interface(JObjectClass)
//  ['{79902BDF-69AE-481E-9F15-A0EDACF60F66}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jeb; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/eb')]
//  Jeb = interface(JObject)
//  ['{EF6AB3EC-AE88-4580-A62E-82524E1E5077}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: JHmsBuildBitmapOption): JBitmap; cdecl; overload; //(Ljava/lang/String;IIILcom/huawei/hms/ml/scan/HmsBuildBitmapOption;)Landroid/graphics/Bitmap;
//
//    { Property }
//  end;

//  TJeb = class(TJavaGenericImport<JebClass, Jeb>) end;

//  JecClass = interface(JObjectClass)
//  ['{5FBD298D-7115-4C0E-86EC-FE35D354EC3D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ec')]
//  Jec = interface(IJavaInstance)
//  ['{B2CBE887-259A-4588-9C58-E70BD296E4FC}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//
//    { Property }
//  end;

//  TJec = class(TJavaGenericImport<JecClass, Jec>) end;

//  JedClass = interface(JObjectClass)
//  ['{E2ED4E80-A0FA-46B2-BC47-A7B170F56F34}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jed; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ed')]
//  Jed = interface(JObject)
//  ['{78BEDF18-5574-47CB-8139-D2F6CB784C33}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//
//    { Property }
//  end;

//  TJed = class(TJavaGenericImport<JedClass, Jed>) end;

//  JeeClass = interface(JObjectClass)
//  ['{9A5EB433-0A3F-4986-AFE8-156F52876F2F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jee; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ee')]
//  Jee = interface(JObject)
//  ['{AFA9620D-F30F-4849-9303-5B990642CDE9}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Boolean); cdecl; overload; //(Z)V
//    procedure a(P1: Integer); cdecl; overload; //(I)V
//    procedure b(P1: Integer); cdecl; //(I)V
//    procedure c(P1: Integer); cdecl; //(I)V
//    function a: Jaj; cdecl; overload; //()Lcom/huawei/hms/scankit/p/aj;
//    procedure a(P1: Jaj); cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;)V
//
//    { Property }
//  end;

//  TJee = class(TJavaGenericImport<JeeClass, Jee>) end;

//  JefClass = interface(JekClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/ek
//  ['{16CCB314-FC9F-45ED-89AB-A46C6033BD5C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ef')]
//  Jef = interface(Jek) // or JObject // SuperSignature: com/huawei/hms/scankit/p/ek
//  ['{C23A0607-FFEC-4AB7-91A5-71E8D06B2E34}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jai; P2: TJavaArray<Byte>); cdecl; //(Lcom/huawei/hms/scankit/p/ai;[B)V
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJef = class(TJavaGenericImport<JefClass, Jef>) end;

//  JegClass = interface(JObjectClass)
//  ['{9FC600FD-961B-401D-ACCB-39FB0BB50D8C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Jee; cdecl; //([BII)Lcom/huawei/hms/scankit/p/ee;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/eg')]
//  Jeg = interface(JObject)
//  ['{49C6C754-C2E5-41E6-9A22-3AC80642EFF5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJeg = class(TJavaGenericImport<JegClass, Jeg>) end;

//  Jeh_aClass = interface(JObjectClass)
//  ['{3FB71AB4-439A-430B-9F46-ECB0B08A836C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/eh$a')]
//  Jeh_a = interface(JObject)
//  ['{E57BA916-8E38-4EC3-9DB5-F3240898BC13}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jej; P2: Jej): Integer; cdecl; //(Lcom/huawei/hms/scankit/p/ej;Lcom/huawei/hms/scankit/p/ej;)I
//    function compare(P1: JObject; P2: JObject): Integer; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)I
//
//    { Property }
//  end;

//  TJeh_a = class(TJavaGenericImport<Jeh_aClass, Jeh_a>) end;

//  JehClass = interface(JObjectClass)
//  ['{8DD572A6-9F5C-4BC0-BB4A-2725F98247B3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>): Jeh; cdecl; //([B)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/eh')]
//  Jeh = interface(JObject)
//  ['{B23E3854-4DD6-4A8F-9932-A410EA10DF01}']
//    { Property Methods }
//
//    { methods }
//    function a: Jai; cdecl; //()Lcom/huawei/hms/scankit/p/ai;
//
//    { Property }
//  end;

//  TJeh = class(TJavaGenericImport<JehClass, Jeh>) end;

//  JeiClass = interface(JekClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/ek
//  ['{EE0526AD-6C2C-4660-B189-8C0AB850461D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ei')]
//  Jei = interface(Jek) // or JObject // SuperSignature: com/huawei/hms/scankit/p/ek
//  ['{9166ED79-9172-4362-8F28-7EA5C2DDFBB0}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJei = class(TJavaGenericImport<JeiClass, Jei>) end;

//  JejClass = interface(JObjectClass)
//  ['{5E209BE0-A500-44E9-B679-30345E73BAB8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ej')]
//  Jej = interface(JObject)
//  ['{DCA9BCCA-8D38-4A56-BCF7-6AD4E1293877}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJej = class(TJavaGenericImport<JejClass, Jej>) end;

//  JekClass = interface(JObjectClass)
//  ['{8A65D2DB-7DF1-46FF-A3FC-DF5F7DAC8724}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ek')]
//  Jek = interface(JObject)
//  ['{0D0AFCA1-E1C8-4AEC-9EDC-E293FE390BE8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJek = class(TJavaGenericImport<JekClass, Jek>) end;

//  JelClass = interface(JObjectClass)
//  ['{2BD41FB6-3D6E-4ACB-8C6E-BA6C334E41CC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jel; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/el')]
//  Jel = interface(JObject)
//  ['{E9F1EF0E-2281-4A59-9886-1BA8B3C1DACE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//
//    { Property }
//  end;

//  TJel = class(TJavaGenericImport<JelClass, Jel>) end;

//  JemClass = interface(JObjectClass)
//  ['{8095515B-6517-4ACD-A4DE-495F18592A6A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/em')]
//  Jem = interface(JObject)
//  ['{50E9A9E8-CC47-4F78-AF90-A3A2EC836997}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    procedure a(P1: Jet); cdecl; overload; //(Lcom/huawei/hms/scankit/p/et;)V
//
//    { Property }
//  end;

//  TJem = class(TJavaGenericImport<JemClass, Jem>) end;

//  JenClass = interface(JObjectClass)
//  ['{D582B100-6875-4661-BB7C-CE0D6CD55B9C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/en')]
//  Jen = interface(JObject)
//  ['{6930728B-1129-41C5-BBC8-13447EC73BD5}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    procedure a(P1: Jet); cdecl; overload; //(Lcom/huawei/hms/scankit/p/et;)V
//
//    { Property }
//  end;

//  TJen = class(TJavaGenericImport<JenClass, Jen>) end;

//  JeoClass = interface(JObjectClass)
//  ['{C67700E4-EC90-4EA5-9906-B548E8DC2EA0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/eo')]
//  Jeo = interface(JObject)
//  ['{73387218-2544-4F55-A60D-02FAE5735F19}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    procedure a(P1: Jet); cdecl; overload; //(Lcom/huawei/hms/scankit/p/et;)V
//
//    { Property }
//  end;

//  TJeo = class(TJavaGenericImport<JeoClass, Jeo>) end;

//  JepClass = interface(JewClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/ew
//  ['{E5AA657A-9EE0-4386-B14F-8CA8DB25DCA7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ep')]
//  Jep = interface(Jew) // or JObject // SuperSignature: com/huawei/hms/scankit/p/ew
//  ['{942737F4-7831-45BA-9782-E92E23166477}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    function a(P1: Integer): Integer; cdecl; overload; //(I)I
//
//    { Property }
//  end;

//  TJep = class(TJavaGenericImport<JepClass, Jep>) end;

//  JeqClass = interface(JObjectClass)
//  ['{6C37F621-202F-414A-9284-EA9F758BA361}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JCharSequence; P2: Integer; P3: Integer): Jeq; cdecl; //(Ljava/lang/CharSequence;II)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/eq')]
//  Jeq = interface(JObject)
//  ['{3B8BC6D8-D984-4521-9D16-E5041D4B38C0}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer): Boolean; cdecl; overload; //(II)Z
//    procedure a; cdecl; overload; //()V
//
//    { Property }
//  end;

//  TJeq = class(TJavaGenericImport<JeqClass, Jeq>) end;

//  JerClass = interface(JObjectClass)
//  ['{5633568C-D5B3-4337-BB76-B18E0565106E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/er')]
//  Jer = interface(JObject)
//  ['{FA9580BC-BC1B-477C-B16E-72AE74CAEFB5}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    procedure a(P1: Jet); cdecl; overload; //(Lcom/huawei/hms/scankit/p/et;)V
//
//    { Property }
//  end;

//  TJer = class(TJavaGenericImport<JerClass, Jer>) end;

//  JesClass = interface(JObjectClass)
//  ['{2DECAE50-90F1-4A7C-BE8B-6C8974F509A4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/es')]
//  Jes = interface(IJavaInstance)
//  ['{076CBCAE-EB4A-45BD-8B4F-58D70C52DFA4}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jet); cdecl; //(Lcom/huawei/hms/scankit/p/et;)V
//
//    { Property }
//  end;

//  TJes = class(TJavaGenericImport<JesClass, Jes>) end;

//  JetClass = interface(JObjectClass)
//  ['{53B5C02F-7D1A-4D38-BDEC-3EF63AAC9E99}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/et')]
//  Jet = interface(JObject)
//  ['{9AB2640C-7302-40EB-8AEB-2BEE5D230A53}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Jex); cdecl; overload; //(Lcom/huawei/hms/scankit/p/ex;)V
//    procedure a(P1: Jea; P2: Jea); cdecl; overload; //(Lcom/huawei/hms/scankit/p/ea;Lcom/huawei/hms/scankit/p/ea;)V
//    function a: JString; cdecl; overload; //()Ljava/lang/String;
//    procedure a(P1: Integer); cdecl; overload; //(I)V
//    function b: Char; cdecl; overload; //()C
//    function c: JStringBuilder; cdecl; overload; //()Ljava/lang/StringBuilder;
//    procedure a(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
//    procedure a(P1: Char); cdecl; overload; //(C)V
//    function d: Integer; cdecl; //()I
//    function e: Integer; cdecl; //()I
//    procedure b(P1: Integer); cdecl; overload; //(I)V
//    procedure f; cdecl; //()V
//    function g: Boolean; cdecl; //()Z
//    function h: Integer; cdecl; //()I
//    function i: Jew; cdecl; //()Lcom/huawei/hms/scankit/p/ew;
//    procedure j; cdecl; //()V
//    procedure c(P1: Integer); cdecl; overload; //(I)V
//    procedure k; cdecl; //()V
//
//    { Property }
//  end;

//  TJet = class(TJavaGenericImport<JetClass, Jet>) end;

//  JeuClass = interface(JObjectClass)
//  ['{32E8887F-85BA-4D34-8D3E-4427413309C4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jew): JString; cdecl; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/ew;)Ljava/lang/String;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/eu')]
//  Jeu = interface(JObject)
//  ['{95C3D089-CD6E-4A8A-B632-A6519CEB30D4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJeu = class(TJavaGenericImport<JeuClass, Jeu>) end;

//  JevClass = interface(JObjectClass)
//  ['{580781EE-9A66-4811-821F-B2BE6F950D26}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jex; P3: Jea; P4: Jea): JString; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/ex;Lcom/huawei/hms/scankit/p/ea;Lcom/huawei/hms/scankit/p/ea;)Ljava/lang/String;
//    {class} function a(P1: JCharSequence; P2: Integer): Integer; cdecl; overload; //(Ljava/lang/CharSequence;I)I
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ev')]
//  Jev = interface(JObject)
//  ['{5B4416F3-FC29-4A33-B70B-A6748C896A6D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJev = class(TJavaGenericImport<JevClass, Jev>) end;

//  JewClass = interface(JObjectClass)
//  ['{D5B70EB8-FE4D-4E9A-99DB-951513E343AF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Boolean; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Jew; cdecl; //(ZIIIII)V
//    {class} function a(P1: Integer; P2: Jex; P3: Jea; P4: Jea; P5: Boolean): Jew; cdecl; overload; //(ILcom/huawei/hms/scankit/p/ex;Lcom/huawei/hms/scankit/p/ea;Lcom/huawei/hms/scankit/p/ea;Z)Lcom/huawei/hms/scankit/p/ew;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ew')]
//  Jew = interface(JObject)
//  ['{77DB794C-46B6-4049-82A3-769402878F9C}']
//    { Property Methods }
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
//
//    { methods }
//    function b: Integer; cdecl; overload; //()I
//    function c: Integer; cdecl; //()I
//    function d: Integer; cdecl; //()I
//    function e: Integer; cdecl; //()I
//    function a: Integer; cdecl; overload; //()I
//    function f: Integer; cdecl; //()I
//    function g: Integer; cdecl; //()I
//    function a(P1: Integer): Integer; cdecl; overload; //(I)I
//    function b(P1: Integer): Integer; cdecl; overload; //(I)I
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//    property b: Integer read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//  end;

//  TJew = class(TJavaGenericImport<JewClass, Jew>) end;

//  JexClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{ED48A760-C70E-4D1A-A6A4-875AD8943678}']
//    { static Property Methods }
//    {class} function _Geta: Jex;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/ex;
//    {class} function _Getb: Jex;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/ex;
//    {class} function _Getc: Jex;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/ex;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jex>; cdecl; //()[Lcom/huawei/hms/scankit/p/ex;
//    {class} function valueOf(P1: JString): Jex; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/ex;
//
//    { static Property }
//    {class} property a: Jex read _Geta;
//    {class} property b: Jex read _Getb;
//    {class} property c: Jex read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ex')]
//  Jex = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{143811EC-C01D-4B87-9D00-E36C98E3E8AB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJex = class(TJavaGenericImport<JexClass, Jex>) end;

//  JeyClass = interface(JeoClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/eo
//  ['{4B52544C-2698-44D1-87FB-FB1C18B02D21}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ey')]
//  Jey = interface(Jeo) // or JObject // SuperSignature: com/huawei/hms/scankit/p/eo
//  ['{B2D07F6C-B514-4B08-A475-8EAE53234631}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; //()I
//
//    { Property }
//  end;

//  TJey = class(TJavaGenericImport<JeyClass, Jey>) end;

//  JezClass = interface(JeoClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/eo
//  ['{8DD1AFE3-4237-4B0D-9A04-B71A04CD391E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ez')]
//  Jez = interface(Jeo) // or JObject // SuperSignature: com/huawei/hms/scankit/p/eo
//  ['{57B5F49D-603D-4BE1-A89A-3A19971A51E7}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    procedure a(P1: Jet); cdecl; overload; //(Lcom/huawei/hms/scankit/p/et;)V
//
//    { Property }
//  end;

//  TJez = class(TJavaGenericImport<JezClass, Jez>) end;

//  Jf_292Class = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{49C39978-50AB-4C48-AA03-59163204018E}']
//    { static Property Methods }
//    {class} function _Geta: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Getb: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Getc: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Getd: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Gete: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Getf: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Getg: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Geth: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Geti: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Getj: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Getk: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Getl: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Getm: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Getn: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//    {class} function _Geto: Jf;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/f;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jf>; cdecl; //()[Lcom/huawei/hms/scankit/p/f;
//    {class} function valueOf(P1: JString): Jf; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/f;
//
//    { static Property }
//    {class} property a: Jf read _Geta;
//    {class} property b: Jf read _Getb;
//    {class} property c: Jf read _Getc;
//    {class} property d: Jf read _Getd;
//    {class} property e: Jf read _Gete;
//    {class} property f: Jf read _Getf;
//    {class} property g: Jf read _Getg;
//    {class} property h: Jf read _Geth;
//    {class} property i: Jf read _Geti;
//    {class} property j: Jf read _Getj;
//    {class} property k: Jf read _Getk;
//    {class} property l: Jf read _Getl;
//    {class} property m: Jf read _Getm;
//    {class} property n: Jf read _Getn;
//    {class} property o: Jf read _Geto;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/f')]
//  Jf_292 = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{DFA0F551-758D-410E-BDB4-5441E3EF69DD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf_292 = class(TJavaGenericImport<Jf_292Class, Jf_292>) end;

//  JfaClass = interface(JfhClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{3209E8AB-C6B3-467B-9C3B-3B89624B079A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfa; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fa')]
//  Jfa = interface(Jfh) // or JObject // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{A43B2929-7C3D-4171-921E-8ECC6D6B29D5}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; //(Ljava/lang/String;)[Z
//
//    { Property }
//  end;

//  TJfa = class(TJavaGenericImport<JfaClass, Jfa>) end;

//  Jfb_aClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{EB98615C-3974-4C80-96D4-309B43135179}']
//    { static Property Methods }
//    {class} function _Geta: Jfb_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fb$a;
//    {class} function _Getb: Jfb_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fb$a;
//    {class} function _Getc: Jfb_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fb$a;
//    {class} function _Getd: Jfb_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fb$a;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jfb_a>; cdecl; //()[Lcom/huawei/hms/scankit/p/fb$a;
//    {class} function valueOf(P1: JString): Jfb_a; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/fb$a;
//
//    { static Property }
//    {class} property a: Jfb_a read _Geta;
//    {class} property b: Jfb_a read _Getb;
//    {class} property c: Jfb_a read _Getc;
//    {class} property d: Jfb_a read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fb$a')]
//  Jfb_a = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{DBB32EEC-FE22-4865-A2AC-A90457CA0530}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfb_a = class(TJavaGenericImport<Jfb_aClass, Jfb_a>) end;

//  JfbClass = interface(JfhClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{4C9FF9A2-E281-4E48-A31D-0D0B46D99120}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfb; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fb')]
//  Jfb = interface(Jfh) // or JObject // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{EAD6A0D1-20CF-4CA7-92F2-E2CD219DBC92}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z
//
//    { Property }
//  end;

//  TJfb = class(TJavaGenericImport<JfbClass, Jfb>) end;

//  JfcClass = interface(JfhClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{0AE2E98B-7B64-45C6-A925-022E8BBB052F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfc; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fc')]
//  Jfc = interface(Jfh) // or JObject // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{9AB22477-2FA2-4039-970B-D1F2280056C8}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z
//
//    { Property }
//  end;

//  TJfc = class(TJavaGenericImport<JfcClass, Jfc>) end;

//  JfdClass = interface(JfhClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{72EE7CBB-C582-49A3-B1B5-7A12F106AF1F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfd; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fd')]
//  Jfd = interface(Jfh) // or JObject // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{5D303BB2-9E8D-4D66-93BF-420D17DB10E6}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z
//
//    { Property }
//  end;

//  TJfd = class(TJavaGenericImport<JfdClass, Jfd>) end;

//  JfeClass = interface(JfjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/fj
//  ['{1053B647-4BD5-4CA9-9AE4-F7FCD658B848}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfe; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fe')]
//  Jfe = interface(Jfj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/fj
//  ['{0656E091-C48F-4567-B09E-0757E137DCBE}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z
//
//    { Property }
//  end;

//  TJfe = class(TJavaGenericImport<JfeClass, Jfe>) end;

//  JffClass = interface(JfjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/fj
//  ['{CFD1A9D2-8E79-47AE-A7C7-F60D6F8C0A59}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jff; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ff')]
//  Jff = interface(Jfj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/fj
//  ['{770592E0-66E9-425F-8E27-7C54742D8018}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z
//
//    { Property }
//  end;

//  TJff = class(TJavaGenericImport<JffClass, Jff>) end;

//  JfgClass = interface(JfhClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{67D23253-0A72-42D9-B705-A9D7ABB874F7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfg; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fg')]
//  Jfg = interface(Jfh) // or JObject // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{E720C8AE-D4BC-4A14-A9A3-70A94F389863}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z
//
//    { Property }
//  end;

//  TJfg = class(TJavaGenericImport<JfgClass, Jfg>) end;

//  JfhClass = interface(JObjectClass)
//  ['{C2F0C36D-B9D3-4FC7-B6E4-29AFCE3C5C61}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfh; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fh')]
//  Jfh = interface(JObject)
//  ['{4A33012C-52B4-496C-B9B4-B004DC3CE9F3}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//    function a: Integer; cdecl; overload; //()I
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z
//
//    { Property }
//  end;

//  TJfh = class(TJavaGenericImport<JfhClass, Jfh>) end;

//  JfiClass = interface(JObjectClass)
//  ['{412352D4-B283-4355-BBCB-CE1DB9DCF2F9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfi; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fi')]
//  Jfi = interface(JObject)
//  ['{912A3A31-C67B-4259-A7A7-0FB9F056E583}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//
//    { Property }
//  end;

//  TJfi = class(TJavaGenericImport<JfiClass, Jfi>) end;

//  JfjClass = interface(JfhClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{ECD483E1-3E50-41E0-943F-EAF75E591581}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfj; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fj')]
//  Jfj = interface(Jfh) // or JObject // SuperSignature: com/huawei/hms/scankit/p/fh
//  ['{B81B3D3E-15BC-4CC5-9578-906E38E4A1D0}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; //()I
//
//    { Property }
//  end;

//  TJfj = class(TJavaGenericImport<JfjClass, Jfj>) end;

//  JfkClass = interface(JfjClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/fj
//  ['{59F766F1-5CFD-49BF-8664-EF8D3C4B1724}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfk; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fk')]
//  Jfk = interface(Jfj) // or JObject // SuperSignature: com/huawei/hms/scankit/p/fj
//  ['{3BD16E88-558C-44CC-9DE3-257A0808387C}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; overload; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z
//
//    { Property }
//  end;

//  TJfk = class(TJavaGenericImport<JfkClass, Jfk>) end;

//  JflClass = interface(JObjectClass)
//  ['{F4BF1FAD-D1B4-45DE-B3EC-163FACE4F6E4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfl; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fl')]
//  Jfl = interface(JObject)
//  ['{E3839754-6D5E-44F4-A239-9CB94ED1C513}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//
//    { Property }
//  end;

//  TJfl = class(TJavaGenericImport<JflClass, Jfl>) end;

//  JfmClass = interface(JObjectClass)
//  ['{C59CC6F0-078E-4ED3-8863-6C44DD5DB240}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fm')]
//  Jfm = interface(JObject)
//  ['{8BF5ABE3-ECB7-48EB-A3CD-E9C27FB4403F}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: Integer): TJavaArray<TJavaArray<Byte>>; cdecl; //(II)[[B
//
//    { Property }
//  end;

//  TJfm = class(TJavaGenericImport<JfmClass, Jfm>) end;

//  JfnClass = interface(JObjectClass)
//  ['{CF610207-C6F8-49BC-8021-A291989C86C6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fn')]
//  Jfn = interface(JObject)
//  ['{EE453615-34C6-4D02-94A8-DF4A214A53AB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfn = class(TJavaGenericImport<JfnClass, Jfn>) end;

//  JfoClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{BD60AC62-4C3F-45A4-8DCA-7C3CFA7553C4}']
//    { static Property Methods }
//    {class} function _Geta: Jfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fo;
//    {class} function _Getb: Jfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fo;
//    {class} function _Getc: Jfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fo;
//    {class} function _Getd: Jfo;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fo;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jfo>; cdecl; //()[Lcom/huawei/hms/scankit/p/fo;
//    {class} function valueOf(P1: JString): Jfo; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/fo;
//
//    { static Property }
//    {class} property a: Jfo read _Geta;
//    {class} property b: Jfo read _Getb;
//    {class} property c: Jfo read _Getc;
//    {class} property d: Jfo read _Getd;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fo')]
//  Jfo = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{CAAB7DAC-3D8F-4185-B772-FA2B2AF95A78}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfo = class(TJavaGenericImport<JfoClass, Jfo>) end;

//  JfpClass = interface(JObjectClass)
//  ['{1D05F317-197B-4A13-B281-2C4A541512E4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fp')]
//  Jfp = interface(JObject)
//  ['{2C9A45AD-EA75-49CF-B0A6-BCFCFA2ECFEB}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; //()I
//    function b: Integer; cdecl; //()I
//    function c: Integer; cdecl; //()I
//    function d: Integer; cdecl; //()I
//
//    { Property }
//  end;

//  TJfp = class(TJavaGenericImport<JfpClass, Jfp>) end;

//  JfqClass = interface(JObjectClass)
//  ['{9D2EA53A-1405-4B86-B88B-15F504F729F1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jfq; cdecl; overload; //()V
//    {class} function init(P1: Boolean): Jfq; cdecl; overload; //(Z)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fq')]
//  Jfq = interface(JObject)
//  ['{67314D88-228B-4C13-A31D-3D7B794C5415}']
//    { Property Methods }
//
//    { methods }
//    function a: Jfm; cdecl; overload; //()Lcom/huawei/hms/scankit/p/fm;
//    procedure a(P1: JString; P2: Integer); cdecl; overload; //(Ljava/lang/String;I)V
//    procedure a(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl; overload; //(IIII)V
//    procedure a(P1: Jfo); cdecl; overload; //(Lcom/huawei/hms/scankit/p/fo;)V
//    procedure a(P1: Boolean); cdecl; overload; //(Z)V
//    procedure a(P1: JCharset); cdecl; overload; //(Ljava/nio/charset/Charset;)V
//
//    { Property }
//  end;

//  TJfq = class(TJavaGenericImport<JfqClass, Jfq>) end;

//  JfrClass = interface(JObjectClass)
//  ['{DF1E822C-47B2-49D8-991A-E376E48EEB1E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fr')]
//  Jfr = interface(JObject)
//  ['{4C43BF8F-A452-4446-B8F4-58FD65DAB0B6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfr = class(TJavaGenericImport<JfrClass, Jfr>) end;

//  Jfs_1Class = interface(JObjectClass)
//  ['{589AD8E9-A7D5-4254-8D05-AA6B534DE625}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fs$1')]
//  Jfs_1 = interface(JObject)
//  ['{D53DCFE0-625C-41BD-9D41-F7F3684386C2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfs_1 = class(TJavaGenericImport<Jfs_1Class, Jfs_1>) end;

//  JfsClass = interface(JObjectClass)
//  ['{A529F7F0-3330-4C71-9178-435D8337E0FA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fs')]
//  Jfs = interface(JObject)
//  ['{385D7848-05EB-4FAE-A20A-B079403C6948}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfs = class(TJavaGenericImport<JfsClass, Jfs>) end;

//  JftClass = interface(JObjectClass)
//  ['{1579B1A2-6E3B-40F0-98E1-0D7524457702}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jft; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ft')]
//  Jft = interface(JObject)
//  ['{343533F9-AF7E-48DD-9491-86DBDDC2E889}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString; P2: Jf; P3: Integer; P4: Integer; P5: JMap): Jaj; cdecl; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/f;IILjava/util/Map;)Lcom/huawei/hms/scankit/p/aj;
//
//    { Property }
//  end;

//  TJft = class(TJavaGenericImport<JftClass, Jft>) end;

//  JfuClass = interface(JObjectClass)
//  ['{BD8A2C63-7A5D-4508-AB1C-0B37FAD60E99}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fu')]
//  Jfu = interface(JObject)
//  ['{EA3CC80F-0FDD-47CC-895E-6368957993BA}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaArray<Byte>; cdecl; //()[B
//    function b: TJavaArray<Byte>; cdecl; //()[B
//
//    { Property }
//  end;

//  TJfu = class(TJavaGenericImport<JfuClass, Jfu>) end;

//  JfvClass = interface(JObjectClass)
//  ['{D7B951BC-DAD5-450D-B9F1-6A843FB2CC16}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer): Jfv; cdecl; //(II)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fv')]
//  Jfv = interface(JObject)
//  ['{72B3F9BF-895D-424A-BA97-BD263B118684}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//    function b: Integer; cdecl; //()I
//    function a(P1: Integer; P2: Integer): Byte; cdecl; overload; //(II)B
//    function c: TJavaArray<TJavaArray<Byte>>; cdecl; //()[[B
//    procedure a(P1: Integer; P2: Integer; P3: Integer); cdecl; overload; //(III)V
//    procedure a(P1: Integer; P2: Integer; P3: Boolean); cdecl; overload; //(IIZ)V
//    procedure a(P1: Byte); cdecl; overload; //(B)V
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJfv = class(TJavaGenericImport<JfvClass, Jfv>) end;

//  JfwClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{08019400-A7CA-4C92-9148-B42E9B2C0D0B}']
//    { static Property Methods }
//    {class} function _Geta: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Getb: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Getc: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Getd: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Gete: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Getf: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Getg: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Geth: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Geti: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Getj: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Getk: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//    {class} function _Getl: Jfw;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/fw;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jfw>; cdecl; //()[Lcom/huawei/hms/scankit/p/fw;
//    {class} function valueOf(P1: JString): Jfw; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/fw;
//
//    { static Property }
//    {class} property a: Jfw read _Geta;
//    {class} property b: Jfw read _Getb;
//    {class} property c: Jfw read _Getc;
//    {class} property d: Jfw read _Getd;
//    {class} property e: Jfw read _Gete;
//    {class} property f: Jfw read _Getf;
//    {class} property g: Jfw read _Getg;
//    {class} property h: Jfw read _Geth;
//    {class} property i: Jfw read _Geti;
//    {class} property j: Jfw read _Getj;
//    {class} property k: Jfw read _Getk;
//    {class} property l: Jfw read _Getl;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fw')]
//  Jfw = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{984FBF9B-63CE-4E6C-8921-11E30B63F2DD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfw = class(TJavaGenericImport<JfwClass, Jfw>) end;

//  Jfx_1Class = interface(JObjectClass)
//  ['{2FEBE98F-5700-495A-9845-35DE974B4385}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fx$1')]
//  Jfx_1 = interface(JObject)
//  ['{3BBC14D3-129D-4505-ABB0-24C05E9F5B89}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfx_1 = class(TJavaGenericImport<Jfx_1Class, Jfx_1>) end;

//  JfxClass = interface(JObjectClass)
//  ['{B5426DDD-FE27-4F51-AF2B-8CEB12AC1526}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: Jcn; P3: JMap): Jga; cdecl; //(Ljava/lang/String;Lcom/huawei/hms/scankit/p/cn;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/ga;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fx')]
//  Jfx = interface(JObject)
//  ['{54E3D8DE-21E7-4DF4-8ABF-65D3BA4E3CC2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfx = class(TJavaGenericImport<JfxClass, Jfx>) end;

//  JfyClass = interface(JObjectClass)
//  ['{ECD4544E-7F77-4B31-BFCE-07674FC349DC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fy')]
//  Jfy = interface(JObject)
//  ['{97C2BC7B-D829-4ACD-9822-82C7FB9360AA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfy = class(TJavaGenericImport<JfyClass, Jfy>) end;

//  JfzClass = interface(JObjectClass)
//  ['{FC5F112B-F60C-436C-91A6-6DB6D0488956}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/fz')]
//  Jfz = interface(JObject)
//  ['{5B3CD819-EB60-4FEC-8BA6-5DB151F8BB99}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJfz = class(TJavaGenericImport<JfzClass, Jfz>) end;

//  Jg_322Class = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{0E247D1F-4812-4B4D-8E5E-CCC9D4BAB84B}']
//    { static Property Methods }
//    {class} function _Geta: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getb: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getc: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getd: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Gete: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getf: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getg: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Geth: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Geti: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getj: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getk: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getl: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getm: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getn: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Geto: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getp: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getq: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getr: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Gets: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Gett: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getu: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getv: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getw: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getx: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Gety: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _Getz: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//    {class} function _GetA: Jg;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/g;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jg>; cdecl; //()[Lcom/huawei/hms/scankit/p/g;
//    {class} function valueOf(P1: JString): Jg; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/g;
//    {class} function a(P1: Integer): Jg; cdecl; overload; //(I)Lcom/huawei/hms/scankit/p/g;
//    {class} function a(P1: JString): Jg; cdecl; overload; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/g;
//
//    { static Property }
//    {class} property a: Jg read _Geta;
//    {class} property b: Jg read _Getb;
//    {class} property c: Jg read _Getc;
//    {class} property d: Jg read _Getd;
//    {class} property e: Jg read _Gete;
//    {class} property f: Jg read _Getf;
//    {class} property g: Jg read _Getg;
//    {class} property h: Jg read _Geth;
//    {class} property i: Jg read _Geti;
//    {class} property j: Jg read _Getj;
//    {class} property k: Jg read _Getk;
//    {class} property l: Jg read _Getl;
//    {class} property m: Jg read _Getm;
//    {class} property n: Jg read _Getn;
//    {class} property o: Jg read _Geto;
//    {class} property p: Jg read _Getp;
//    {class} property q: Jg read _Getq;
//    {class} property r: Jg read _Getr;
//    {class} property s: Jg read _Gets;
//    {class} property t: Jg read _Gett;
//    {class} property u: Jg read _Getu;
//    {class} property v: Jg read _Getv;
//    {class} property w: Jg read _Getw;
//    {class} property x: Jg read _Getx;
//    {class} property y: Jg read _Gety;
//    {class} property z: Jg read _Getz;
//    {class} property A: Jg read _GetA;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/g')]
//  Jg_322 = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{BC04760F-0067-4923-829F-F653C0FCD86B}']
//    { Property Methods }
//
//    { methods }
//    function a: Integer; cdecl; overload; //()I
//
//    { Property }
//  end;

//  TJg_322 = class(TJavaGenericImport<Jg_322Class, Jg_322>) end;

//  JgaClass = interface(JObjectClass)
//  ['{5897E44C-3ECD-4876-9FC7-4DEB06CF273F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jga; cdecl; //()V
//    {class} function b(P1: Integer): Boolean; cdecl; //(I)Z
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/ga')]
//  Jga = interface(JObject)
//  ['{D3EB08B0-2F00-4391-A19A-4A443D08EED0}']
//    { Property Methods }
//
//    { methods }
//    function a: Jfv; cdecl; overload; //()Lcom/huawei/hms/scankit/p/fv;
//    function toString: JString; cdecl; //()Ljava/lang/String;
//    procedure a(P1: Jcs); cdecl; overload; //(Lcom/huawei/hms/scankit/p/cs;)V
//    procedure a(P1: Jcn); cdecl; overload; //(Lcom/huawei/hms/scankit/p/cn;)V
//    procedure a(P1: Jcv); cdecl; overload; //(Lcom/huawei/hms/scankit/p/cv;)V
//    procedure a(P1: Integer); cdecl; overload; //(I)V
//    procedure a(P1: Jfv); cdecl; overload; //(Lcom/huawei/hms/scankit/p/fv;)V
//
//    { Property }
//  end;

//  TJga = class(TJavaGenericImport<JgaClass, Jga>) end;

//  Jh_324Class = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{AD897AFA-F71F-4CFE-B734-8AA7EDE786FB}']
//    { static Property Methods }
//    {class} function _Geta: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/h;
//    {class} function _Getb: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/h;
//    {class} function _Getc: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/h;
//    {class} function _Getd: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/h;
//    {class} function _Gete: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/h;
//    {class} function _Getf: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/h;
//    {class} function _Getg: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/h;
//    {class} function _Geth: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/h;
//    {class} function _Geti: Jh;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/h;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<Jh>; cdecl; //()[Lcom/huawei/hms/scankit/p/h;
//    {class} function valueOf(P1: JString): Jh; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/p/h;
//
//    { static Property }
//    {class} property a: Jh read _Geta;
//    {class} property b: Jh read _Getb;
//    {class} property c: Jh read _Getc;
//    {class} property d: Jh read _Getd;
//    {class} property e: Jh read _Gete;
//    {class} property f: Jh read _Getf;
//    {class} property g: Jh read _Getg;
//    {class} property h: Jh read _Geth;
//    {class} property i: Jh read _Geti;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/h')]
//  Jh_324 = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{3930BFDC-42FE-4D3B-A110-0481B162049D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh_324 = class(TJavaGenericImport<Jh_324Class, Jh_324>) end;

//  Ji_325Class = interface(JObjectClass)
//  ['{876974FA-FAFA-401B-BDE2-9577FE476E43}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>; P2: JString; P3: JList; P4: JString): Ji_325; cdecl; overload; //([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V
//    {class} function init(P1: TJavaArray<Byte>; P2: JString; P3: JList; P4: JString; P5: Integer; P6: Integer): Ji_325; cdecl; overload; //([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;II)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/i')]
//  Ji_325 = interface(JObject)
//  ['{A0A87953-60F7-4A6F-8C44-C8C2AE82C995}']
//    { Property Methods }
//
//    { methods }
//    function a: TJavaArray<Byte>; cdecl; overload; //()[B
//    function b: Integer; cdecl; overload; //()I
//    procedure a(P1: Integer); cdecl; overload; //(I)V
//    function c: JString; cdecl; //()Ljava/lang/String;
//    procedure a(P1: JInteger); cdecl; overload; //(Ljava/lang/Integer;)V
//    procedure b(P1: JInteger); cdecl; overload; //(Ljava/lang/Integer;)V
//    function d: JObject; cdecl; //()Ljava/lang/Object;
//    procedure a(P1: JObject); cdecl; overload; //(Ljava/lang/Object;)V
//
//    { Property }
//  end;

//  TJi_325 = class(TJavaGenericImport<Ji_325Class, Ji_325>) end;

//  Jj_326Class = interface(Jn_330Class) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/n
//  ['{8DFEF8B1-E57C-4463-8EF1-15ECC8A62CED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jj_326; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/j')]
//  Jj_326 = interface(Jn_330) // or JObject // SuperSignature: com/huawei/hms/scankit/p/n
//  ['{4B421E14-B3E7-40CC-B5AD-90D9C19BB93B}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jaj; P2: Integer; P3: Integer; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single; P17: Single; P18: Single; P19: Single): Jaj; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;IIFFFFFFFFFFFFFFFF)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: Jaj; P2: Integer; P3: Integer; P4: Jt; P5: Boolean): Jaj; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;IILcom/huawei/hms/scankit/p/t;Z)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: Jaj; P2: Integer; P3: Integer; P4: Jt): Jaj; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;IILcom/huawei/hms/scankit/p/t;)Lcom/huawei/hms/scankit/p/aj;
//    function b(P1: Jaj; P2: Integer; P3: Integer; P4: Jt): Jaj; cdecl; //(Lcom/huawei/hms/scankit/p/aj;IILcom/huawei/hms/scankit/p/t;)Lcom/huawei/hms/scankit/p/aj;
//
//    { Property }
//  end;

//  TJj_326 = class(TJavaGenericImport<Jj_326Class, Jj_326>) end;

//  Jk_327Class = interface(JObjectClass)
//  ['{918F7923-C42F-4BEE-B277-239E58CC5BED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jaj; P2: TJavaObjectArray<Jaa>): Jk_327; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;[Lcom/huawei/hms/scankit/p/aa;)V
//    {class} function init(P1: Jaj; P2: TJavaObjectArray<Jaa>; P3: TJavaObjectArray<Jaa>; P4: Single): Jk_327; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;[Lcom/huawei/hms/scankit/p/aa;[Lcom/huawei/hms/scankit/p/aa;F)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/k')]
//  Jk_327 = interface(JObject)
//  ['{D061F8A8-25AA-4E14-8303-A5969960F355}']
//    { Property Methods }
//
//    { methods }
//    function d: TJavaObjectArray<Jaa>; cdecl; //()[Lcom/huawei/hms/scankit/p/aa;
//    function e: Single; cdecl; //()F
//    function f: Jaj; cdecl; //()Lcom/huawei/hms/scankit/p/aj;
//    function g: TJavaObjectArray<Jaa>; cdecl; //()[Lcom/huawei/hms/scankit/p/aa;
//
//    { Property }
//  end;

//  TJk_327 = class(TJavaGenericImport<Jk_327Class, Jk_327>) end;

//  Jl_328Class = interface(JObjectClass)
//  ['{91F33E5D-1424-4D85-B438-61838E4BAF2C}']
//    { static Property Methods }
//    {class} function _Geta: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/l;
//    {class} function _Getb: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/l;
//    {class} function _Getc: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/l;
//    {class} function _Getd: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/l;
//    {class} function _Gete: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/l;
//    {class} function _Getf: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/l;
//    {class} function _Getg: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/l;
//    {class} function _Geth: Jl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/p/l;
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: Integer): Jl_328; cdecl; //(III)V
//
//    { static Property }
//    {class} property a: Jl read _Geta;
//    {class} property b: Jl read _Getb;
//    {class} property c: Jl read _Getc;
//    {class} property d: Jl read _Getd;
//    {class} property e: Jl read _Gete;
//    {class} property f: Jl read _Getf;
//    {class} property g: Jl read _Getg;
//    {class} property h: Jl read _Geth;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/l')]
//  Jl_328 = interface(JObject)
//  ['{B8E3968C-E88F-4D21-A2BA-E111297A00A8}']
//    { Property Methods }
//
//    { methods }
//    function c: Integer; cdecl; //()I
//    function d: Integer; cdecl; //()I
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJl_328 = class(TJavaGenericImport<Jl_328Class, Jl_328>) end;

//  Jm_329Class = interface(JObjectClass)
//  ['{24BE3E56-0350-40C4-A904-66EC9A850E17}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/m')]
//  Jm_329 = interface(JObject)
//  ['{6A70DD22-53F6-462A-B71E-4574711DB68F}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJm_329 = class(TJavaGenericImport<Jm_329Class, Jm_329>) end;

//  Jn_330Class = interface(JObjectClass)
//  ['{3330BF21-2476-4244-9C67-E741B323A766}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jn_330; cdecl; //()V
//    {class} function a: Jn; cdecl; overload; //()Lcom/huawei/hms/scankit/p/n;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/n')]
//  Jn_330 = interface(JObject)
//  ['{B8BEE3BA-F183-4C30-80F9-844BD47A6724}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jaj; P2: Integer; P3: Integer; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single; P17: Single; P18: Single; P19: Single): Jaj; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;IIFFFFFFFFFFFFFFFF)Lcom/huawei/hms/scankit/p/aj;
//    function a(P1: Jaj; P2: Integer; P3: Integer; P4: Jt; P5: Boolean): Jaj; cdecl; overload; //(Lcom/huawei/hms/scankit/p/aj;IILcom/huawei/hms/scankit/p/t;Z)Lcom/huawei/hms/scankit/p/aj;
//
//    { Property }
//  end;

//  TJn_330 = class(TJavaGenericImport<Jn_330Class, Jn_330>) end;

//  Jo_331Class = interface(JObjectClass)
//  ['{E043DB8F-8C5C-4E63-977F-E87C370890F2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl; overload; //(III)I
//    {class} function a(P1: Jah): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;)Lcom/huawei/hms/scankit/p/ah;
//    {class} function a(P1: Jah; P2: Single): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;F)Lcom/huawei/hms/scankit/p/ah;
//    {class} function a(P1: Boolean; P2: Jah; P3: Single): Jah; cdecl; overload; //(ZLcom/huawei/hms/scankit/p/ah;F)Lcom/huawei/hms/scankit/p/ah;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/o')]
//  Jo_331 = interface(JObject)
//  ['{0A6722B6-6E9E-4F96-94FA-A67CFCD4D517}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJo_331 = class(TJavaGenericImport<Jo_331Class, Jo_331>) end;

//  JpClass = interface(JObjectClass)
//  ['{0E73D834-E544-48CB-AFFC-FAE15E57C422}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jp; cdecl; //()V
//    {class} function g(P1: Jah): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;)Lcom/huawei/hms/scankit/p/ah;
//    {class} function h(P1: Jah): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;)Lcom/huawei/hms/scankit/p/ah;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/p')]
//  Jp = interface(JObject)
//  ['{E56D444E-F823-420A-A2DC-720BBCB351E4}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jah; P2: Single): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;F)Lcom/huawei/hms/scankit/p/ah;
//    function b(P1: Jah; P2: Single): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;F)Lcom/huawei/hms/scankit/p/ah;
//    function a(P1: Jah): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;)Lcom/huawei/hms/scankit/p/ah;
//    function b(P1: Jah): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;)Lcom/huawei/hms/scankit/p/ah;
//    function c(P1: Jah): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;)Lcom/huawei/hms/scankit/p/ah;
//    function c(P1: Jah; P2: Single): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;F)Lcom/huawei/hms/scankit/p/ah;
//    function d(P1: Jah; P2: Single): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;F)Lcom/huawei/hms/scankit/p/ah;
//    function e(P1: Jah; P2: Single): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;F)Lcom/huawei/hms/scankit/p/ah;
//    function f(P1: Jah; P2: Single): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;F)Lcom/huawei/hms/scankit/p/ah;
//    function g(P1: Jah; P2: Single): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;F)Lcom/huawei/hms/scankit/p/ah;
//    function d(P1: Jah): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;)Lcom/huawei/hms/scankit/p/ah;
//    function h(P1: Jah; P2: Single): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;F)Lcom/huawei/hms/scankit/p/ah;
//    function e(P1: Jah): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;)Lcom/huawei/hms/scankit/p/ah;
//    function f(P1: Jah): Jah; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;)Lcom/huawei/hms/scankit/p/ah;
//    procedure a; cdecl; overload; //()V
//
//    { Property }
//  end;

//  TJp = class(TJavaGenericImport<JpClass, Jp>) end;

//  JqClass = interface(JObjectClass)
//  ['{E316A677-9682-41C3-A9C0-44525C6DEBAC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/q')]
//  Jq = interface(JObject)
//  ['{773C3EA2-C999-4F08-8F89-4C015D115BA8}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload; //(I[B)[B
//    function a: TJavaArray<Byte>; cdecl; overload; //()[B
//    function b: Integer; cdecl; //()I
//    function c: Integer; cdecl; //()I
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jq; cdecl; overload; //(IIII)Lcom/huawei/hms/scankit/p/q;
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJq = class(TJavaGenericImport<JqClass, Jq>) end;

//  JrClass = interface(JObjectClass)
//  ['{15EA192D-E625-4214-A980-85F2900FB390}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Single): Integer; cdecl; overload; //(F)I
//    {class} function a(P1: Single; P2: Single; P3: Single; P4: Single): Single; cdecl; overload; //(FFFF)F
//    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Single; cdecl; overload; //(IIII)F
//    {class} function a(P1: TJavaArray<Integer>): Integer; cdecl; overload; //([I)I
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/r')]
//  Jr = interface(JObject)
//  ['{F395257E-1BEA-4FB0-9E8F-8F429FB700D4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJr = class(TJavaGenericImport<JrClass, Jr>) end;

//  JsClass = interface(JObjectClass)
//  ['{FD2A8FF4-4A5C-41A6-915E-7F77F663CFAB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Js; cdecl; //()V
//    {class} function a(P1: Jz; P2: Single; P3: Single): Boolean; cdecl; overload; //(Lcom/huawei/hms/scankit/p/z;FF)Z
//    {class} function b(P1: Jz; P2: Single; P3: Single): Boolean; cdecl; //(Lcom/huawei/hms/scankit/p/z;FF)Z
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/s')]
//  Js = interface(JObject)
//  ['{C30590CB-065C-493C-94A9-BF500C0DFF96}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jah; P2: JMap): Jz; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//    procedure a(P1: JMap); cdecl; overload; //(Ljava/util/Map;)V
//    function a(P1: Jah; P2: Jah; P3: JMap; P4: Jp): Jz; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;Lcom/huawei/hms/scankit/p/p;)Lcom/huawei/hms/scankit/p/z;
//    function a(P1: Jah; P2: Jah; P3: Jah; P4: JMap; P5: Jp): Jz; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;Lcom/huawei/hms/scankit/p/ah;Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;Lcom/huawei/hms/scankit/p/p;)Lcom/huawei/hms/scankit/p/z;
//    function a(P1: Jah; P2: Jp): Jz; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;Lcom/huawei/hms/scankit/p/p;)Lcom/huawei/hms/scankit/p/z;
//    function a(P1: Jah; P2: Jah; P3: Jp): Jz; cdecl; overload; //(Lcom/huawei/hms/scankit/p/ah;Lcom/huawei/hms/scankit/p/ah;Lcom/huawei/hms/scankit/p/p;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJs = class(TJavaGenericImport<JsClass, Js>) end;

//  JtClass = interface(JObjectClass)
//  ['{C0763CE9-4EB6-4F48-AB5F-602968E98DCA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single): Jt; cdecl; overload; //(FFFFFFFFFFFFFFFF)Lcom/huawei/hms/scankit/p/t;
//    {class} function a(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single): Jt; cdecl; overload; //(FFFFFFFF)Lcom/huawei/hms/scankit/p/t;
//    {class} function b(P1: Single; P2: Single; P3: Single; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single): Jt; cdecl; //(FFFFFFFF)Lcom/huawei/hms/scankit/p/t;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/t')]
//  Jt = interface(JObject)
//  ['{2AFA146E-F2E2-400C-B99D-9825988AB33E}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Single>); cdecl; overload; //([F)V
//
//    { Property }
//  end;

//  TJt = class(TJavaGenericImport<JtClass, Jt>) end;

//  JuClass = interface(JqClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/q
//  ['{A203C4FA-4A5F-49C1-9D44-3FC952DAAAC7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer; P8: Boolean): Ju; cdecl; //([BIIIIIIZ)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/u')]
//  Ju = interface(Jq) // or JObject // SuperSignature: com/huawei/hms/scankit/p/q
//  ['{FF6191A0-C3EB-449C-86AA-43D2583EBC2E}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload; //(I[B)[B
//    function a: TJavaArray<Byte>; cdecl; overload; //()[B
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jq; cdecl; overload; //(IIII)Lcom/huawei/hms/scankit/p/q;
//    function d: TJavaArray<Integer>; cdecl; //()[I
//    function e: Integer; cdecl; //()I
//    function f: Integer; cdecl; //()I
//
//    { Property }
//  end;

//  TJu = class(TJavaGenericImport<JuClass, Ju>) end;

//  JvClass = interface(JqClass) // or JObjectClass // SuperSignature: com/huawei/hms/scankit/p/q
//  ['{A9FCD9CA-8D0C-464F-B26F-946014E6913B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Integer; P3: TJavaArray<Integer>): Jv; cdecl; //(II[I)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/v')]
//  Jv = interface(Jq) // or JObject // SuperSignature: com/huawei/hms/scankit/p/q
//  ['{506E7444-0666-4692-9447-88D1D15FFB76}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload; //(I[B)[B
//    function a: TJavaArray<Byte>; cdecl; overload; //()[B
//    function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Jq; cdecl; overload; //(IIII)Lcom/huawei/hms/scankit/p/q;
//
//    { Property }
//  end;

//  TJv = class(TJavaGenericImport<JvClass, Jv>) end;

//  JwClass = interface(JObjectClass)
//  ['{EED7A0A8-C6B4-4B55-B3BF-3737C54A0391}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/w')]
//  Jw = interface(IJavaInstance)
//  ['{00950A09-AB73-4DD3-BB55-F1EAE13C0B85}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Jah; P2: JMap): Jz; cdecl; //(Lcom/huawei/hms/scankit/p/ah;Ljava/util/Map;)Lcom/huawei/hms/scankit/p/z;
//
//    { Property }
//  end;

//  TJw = class(TJavaGenericImport<JwClass, Jw>) end;

//  JxClass = interface(JObjectClass)
//  ['{52FD20CC-5A6F-4CBD-B436-6C0E31F936BA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jl): Jx; cdecl; //(Lcom/huawei/hms/scankit/p/l;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/x')]
//  Jx = interface(JObject)
//  ['{D1027E13-3154-4DBF-895C-7117A1728FCC}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Integer>; P2: Integer); cdecl; //([II)V
//
//    { Property }
//  end;

//  TJx = class(TJavaGenericImport<JxClass, Jx>) end;

//  JyClass = interface(JObjectClass)
//  ['{64152AF7-E981-4F32-8FEA-05317E003159}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jl): Jy; cdecl; //(Lcom/huawei/hms/scankit/p/l;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/y')]
//  Jy = interface(JObject)
//  ['{79BA26E4-A3FD-49E5-B069-87659C3A6159}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: TJavaArray<Integer>; P2: Integer); cdecl; //([II)V
//
//    { Property }
//  end;

//  TJy = class(TJavaGenericImport<JyClass, Jy>) end;

//  JzClass = interface(JObjectClass)
//  ['{E8206148-F2DB-41DA-891D-E23429F88070}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Single): Jz; cdecl; overload; //(F)V
//    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: TJavaObjectArray<Jaa>; P4: Jf): Jz; cdecl; overload; //(Ljava/lang/String;[B[Lcom/huawei/hms/scankit/p/aa;Lcom/huawei/hms/scankit/p/f;)V
//    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: TJavaObjectArray<Jaa>; P4: Jf; P5: Int64): Jz; cdecl; overload; //(Ljava/lang/String;[B[Lcom/huawei/hms/scankit/p/aa;Lcom/huawei/hms/scankit/p/f;J)V
//    {class} function init(P1: JString; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaObjectArray<Jaa>; P5: Jf; P6: Int64): Jz; cdecl; overload; //(Ljava/lang/String;[BI[Lcom/huawei/hms/scankit/p/aa;Lcom/huawei/hms/scankit/p/f;J)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p/z')]
//  Jz = interface(JObject)
//  ['{43A408B0-7863-4F99-AFAA-8DFA75912B3B}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Boolean); cdecl; overload; //(Z)V
//    function a: Single; cdecl; overload; //()F
//    procedure a(P1: Single); cdecl; overload; //(F)V
//    function b: Integer; cdecl; overload; //()I
//    procedure a(P1: JList); cdecl; overload; //(Ljava/util/List;)V
//    function c: JList; cdecl; //()Ljava/util/List;
//    function d: JString; cdecl; //()Ljava/lang/String;
//    function e: TJavaArray<Byte>; cdecl; //()[B
//    function f: TJavaObjectArray<Jaa>; cdecl; //()[Lcom/huawei/hms/scankit/p/aa;
//    function g: Jf; cdecl; //()Lcom/huawei/hms/scankit/p/f;
//    procedure a(P1: TJavaObjectArray<Jaa>); cdecl; overload; //([Lcom/huawei/hms/scankit/p/aa;)V
//    function toString: JString; cdecl; //()Ljava/lang/String;
//    procedure h; cdecl; //()V
//    procedure b(P1: TJavaObjectArray<Jaa>); cdecl; overload; //([Lcom/huawei/hms/scankit/p/aa;)V
//
//    { Property }
//  end;

//  TJz = class(TJavaGenericImport<JzClass, Jz>) end;

//  Jp_343Class = interface(JObjectClass)
//  ['{5BC86087-06B0-44E9-B83A-1416E105C69F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ji): Jp_343; cdecl; //(Lcom/huawei/hms/scankit/i;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/p')]
//  Jp_343 = interface(JObject)
//  ['{0CF55C71-48EE-4049-8B53-3E9457044945}']
//    { Property Methods }
//
//    { methods }
//    procedure onFrame(P1: TJavaArray<Byte>); cdecl; //([B)V
//
//    { Property }
//  end;

//  TJp_343 = class(TJavaGenericImport<Jp_343Class, Jp_343>) end;

//  JProviderRemoteViewClass = interface(JLinearLayoutClass) // or JObjectClass // SuperSignature: android/widget/LinearLayout
//  ['{AC762947-47B1-4E7C-8B41-03751613BA80}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Boolean): JProviderRemoteView; cdecl; //(Landroid/content/Context;Z)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/huawei/hms/scankit/ProviderRemoteView')]
//  JProviderRemoteView = interface(JLinearLayout) // or JObject // SuperSignature: android/widget/LinearLayout
//  ['{37084A39-0AA0-4BD1-968C-AF92133AF810}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJProviderRemoteView = class(TJavaGenericImport<JProviderRemoteViewClass, JProviderRemoteView>) end;

//  Jq_345Class = interface(JObjectClass)
//  ['{880695EB-45BE-4137-84F5-933FD6106CD2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jq_345; cdecl; //()V
//    {class} function a: Jq; cdecl; overload; //()Lcom/huawei/hms/scankit/q;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/q')]
//  Jq_345 = interface(JObject)
//  ['{9D264800-1C69-4DC8-AAAA-164A66EEA036}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JBitmap; P2: Integer; P3: Boolean; P4: Jdd): TJavaObjectArray<JHmsScan>; cdecl; overload; //(Landroid/graphics/Bitmap;IZLcom/huawei/hms/scankit/p/dd;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    function b(P1: JBitmap; P2: Integer; P3: Boolean; P4: Jdd): TJavaObjectArray<JHmsScan>; cdecl; //(Landroid/graphics/Bitmap;IZLcom/huawei/hms/scankit/p/dd;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    function a(P1: JByteBuffer; P2: Integer; P3: Integer; P4: Integer; P5: Boolean; P6: Jdd): TJavaObjectArray<JHmsScan>; cdecl; overload; //(Ljava/nio/ByteBuffer;IIIZLcom/huawei/hms/scankit/p/dd;)[Lcom/huawei/hms/ml/scan/HmsScan;
//
//    { Property }
//  end;

//  TJq_345 = class(TJavaGenericImport<Jq_345Class, Jq_345>) end;

//  Js_346Class = interface(JObjectClass)
//  ['{2388EB01-44BD-4919-BFD5-B0F5D641CF65}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Integer; P2: Boolean): Js_346; cdecl; overload; //(IZ)V
//    {class} function init(P1: Integer; P2: Integer; P3: Integer): Js_346; cdecl; overload; //(III)V
//    {class} function init(P1: Integer; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Js_346; cdecl; overload; //(IIIZZ)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/s')]
//  Js_346 = interface(JObject)
//  ['{9E3318CD-215F-4E5B-B2A3-B99E4A7E4D61}']
//    { Property Methods }
//    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
//    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
//    function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//    procedure _Setc(ac: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
//    function _Getd: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
//    procedure _Setd(ad: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
//    function _Gete: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
//    procedure _Sete(ae: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
//    function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
//    procedure _Setf(af: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
//
//    { methods }
//    function a(P1: Integer): Js; cdecl; //(I)Lcom/huawei/hms/scankit/s;
//
//    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//    property c: Integer read _Getc write _Setc;
//    property d: Boolean read _Getd write _Setd;
//    property e: Boolean read _Gete write _Sete;
//    property f: Integer read _Getf write _Setf;
//  end;

//  TJs_346 = class(TJavaGenericImport<Js_346Class, Js_346>) end;

//  Jt_347Class = interface(JObjectClass)
//  ['{84951BF6-9D6B-453D-84F7-49DEBF4CE818}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JObject): Jt_347; cdecl; //(Ljava/lang/Object;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/t')]
//  Jt_347 = interface(JObject)
//  ['{5C792E70-D1B0-4B50-BD6C-81F9672DC4C3}']
//    { Property Methods }
//
//    { methods }
//    function a: JObject; cdecl; //()Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJt_347 = class(TJavaGenericImport<Jt_347Class, Jt_347>) end;

//  Ju_348Class = interface(JObjectClass)
//  ['{A6E41DD1-9529-4889-8478-D906E621C893}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Integer; P3: TJavaObjectArray<Jaa>): Single; cdecl; //(II[Lcom/huawei/hms/scankit/p/aa;)F
//    {class} function b(P1: Integer; P2: Integer; P3: TJavaObjectArray<Jaa>): Single; cdecl; //(II[Lcom/huawei/hms/scankit/p/aa;)F
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/u')]
//  Ju_348 = interface(JObject)
//  ['{5E662EEA-ECAD-4C9A-AF0C-C96088A05A13}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJu_348 = class(TJavaGenericImport<Ju_348Class, Ju_348>) end;

//  Ja_349Class = interface(JObjectClass)
//  ['{777E88BD-0681-48C3-91EB-DBA0682901DF}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JString; P2: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
//    {class} procedure b(P1: JString; P2: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
//    {class} procedure c(P1: JString; P2: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
//    {class} procedure a(P1: JString; P2: JString; P3: JThrowable); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
//    {class} procedure d(P1: JString; P2: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/util/a')]
//  Ja_349 = interface(JObject)
//  ['{09589759-2990-422B-9B09-3049DBB4873C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_349 = class(TJavaGenericImport<Ja_349Class, Ja_349>) end;

//  Jb_350Class = interface(JObjectClass)
//  ['{810451D4-C81B-4226-913A-3143F4B2613A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Integer>; P2: Integer): Boolean; cdecl; overload; //([[II)Z
//    {class} function a(P1: TJavaArray<Integer>; P2: Integer): Boolean; cdecl; overload; //([II)Z
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): Boolean; cdecl; overload; //([BI)Z
//    {class} function a(P1: TJavaArray<Byte>; P2: Integer): Boolean; cdecl; overload; //([[BI)Z
//    {class} function a(P1: TJavaObjectArray<JString>; P2: Integer): Boolean; cdecl; overload; //([Ljava/lang/String;I)Z
//    {class} function a(P1: TJavaArray<Single>; P2: Integer): Boolean; cdecl; overload; //([FI)Z
//    {class} function a(P1: TJavaObjectArray<JHmsScan>): TJavaObjectArray<JHmsScan>; cdecl; overload; //([Lcom/huawei/hms/ml/scan/HmsScan;)[Lcom/huawei/hms/ml/scan/HmsScan;
//    {class} function a(P1: Integer): Integer; cdecl; overload; //(I)I
//    {class} function b(P1: Integer): Integer; cdecl; //(I)I
//    {class} function a(P1: JBitmap; P2: Integer; P3: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
//    {class} function a(P1: JBitmap; P2: Single; P3: Single): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;FF)Landroid/graphics/Bitmap;
//    {class} function a(P1: JContext; P2: JString): Integer; cdecl; overload; //(Landroid/content/Context;Ljava/lang/String;)I
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/util/b')]
//  Jb_350 = interface(JObject)
//  ['{E6E8A3CB-141F-424C-9332-C63A15A1EFBD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb_350 = class(TJavaGenericImport<Jb_350Class, Jb_350>) end;

//  Jc_351Class = interface(JObjectClass)
//  ['{3694E41E-FD3C-43F3-A66B-159685D4DA8D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext): JPoint; cdecl; //(Landroid/content/Context;)Landroid/graphics/Point;
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/util/c')]
//  Jc_351 = interface(JObject)
//  ['{B857C0B2-0883-4AF9-B099-086F8CA3E3C5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_351 = class(TJavaGenericImport<Jc_351Class, Jc_351>) end;

  JLoadOpencvJNIUtilClass = interface(JObjectClass)
  ['{C9C9D6B5-0A41-4B7C-B038-7E5E8DCAB0A8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLoadOpencvJNIUtil; cdecl; //()V
    {class} function adaptivebinary(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Byte>; cdecl; //([BII)[B
    {class} function rotateImage(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Integer>; P5: Double; P6: Double): TJavaArray<Byte>; cdecl; //([BII[IDD)[B
    {class} function opencvRotate(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Single): TJavaArray<Byte>; cdecl; //([BIIIIF)[B
    {class} function multiBarcodeDetect(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Boolean): TJavaArray<Single>; cdecl; //([BIIIZ)[F
    {class} function opencvImageResize(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer): TJavaArray<Byte>; cdecl; //([BIIII)[B
    {class} function imageRotateLiteSo(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Single): TJavaArray<Byte>; cdecl; //([BIIIIF)[B
    {class} function multiBarcodeDetectLiteSo(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Single>; cdecl; //([BII)[F
    {class} function imageResizeLiteSo(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer): TJavaArray<Byte>; cdecl; //([BIIII)[B

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/util/LoadOpencvJNIUtil')]
  JLoadOpencvJNIUtil = interface(JObject)
  ['{EB71FCF0-683D-4C86-A955-7FDE9F308331}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLoadOpencvJNIUtil = class(TJavaGenericImport<JLoadOpencvJNIUtilClass, JLoadOpencvJNIUtil>) end;

  JOpencvJNIClass = interface(JObjectClass)
  ['{D700DC4A-92D2-40EB-B30E-CAFDB689F6F9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOpencvJNI; cdecl; overload; //()V
//    {class} procedure init; cdecl; overload; //()V
    {class} function adaptivebinary(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Byte>; cdecl; //([BII)[B
    {class} function rotateImage(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Integer>; P5: Double; P6: Double): TJavaArray<Byte>; cdecl; //([BII[IDD)[B
    {class} function opencvRotate(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Single): TJavaArray<Byte>; cdecl; //([BIIIIF)[B
    {class} function multiBarcodeDetect(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Boolean): TJavaArray<Single>; cdecl; //([BIIIZ)[F
    {class} function opencvImageResize(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer): TJavaArray<Byte>; cdecl; //([BIIII)[B
    {class} function multiBarcodeDetectLiteSo(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): TJavaArray<Single>; cdecl; //([BII)[F
    {class} function imageResizeLiteSo(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer): TJavaArray<Byte>; cdecl; //([BIIII)[B
    {class} function imageRotateLiteSo(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Single): TJavaArray<Byte>; cdecl; //([BIIIIF)[B

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/util/OpencvJNI')]
  JOpencvJNI = interface(JObject)
  ['{4B79B941-066A-42BA-9DCE-4297F196BAFB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOpencvJNI = class(TJavaGenericImport<JOpencvJNIClass, JOpencvJNI>) end;

//  JViewfinderView_1Class = interface(JObjectClass)
//  ['{6EB6C923-27D4-4377-BCF1-346C6B9CD92C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/huawei/hms/scankit/ViewfinderView$1')]
//  JViewfinderView_1 = interface(JObject)
//  ['{8CBE2B00-E052-4583-90A4-4869A1F73A91}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJViewfinderView_1 = class(TJavaGenericImport<JViewfinderView_1Class, JViewfinderView_1>) end;

//  JViewfinderView_aClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{7EECDF0F-FC7A-4C0D-9CC3-5EFDB21314AA}']
//    { static Property Methods }
//    {class} function _Geta: JViewfinderView_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/ViewfinderView$a;
//    {class} function _Getb: JViewfinderView_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/ViewfinderView$a;
//    {class} function _Getc: JViewfinderView_a;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/ViewfinderView$a;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<JViewfinderView_a>; cdecl; //()[Lcom/huawei/hms/scankit/ViewfinderView$a;
//    {class} function valueOf(P1: JString): JViewfinderView_a; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/ViewfinderView$a;
//
//    { static Property }
//    {class} property a: JViewfinderView_a read _Geta;
//    {class} property b: JViewfinderView_a read _Getb;
//    {class} property c: JViewfinderView_a read _Getc;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/ViewfinderView$a')]
//  JViewfinderView_a = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{405820C4-7680-4BD6-A23B-895770C90F05}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJViewfinderView_a = class(TJavaGenericImport<JViewfinderView_aClass, JViewfinderView_a>) end;

//  JViewfinderView_bClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{A0F72701-0D29-4061-A955-27731AB955A1}']
//    { static Property Methods }
//    {class} function _Geta: JViewfinderView_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/ViewfinderView$b;
//    {class} function _Getb: JViewfinderView_b;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/huawei/hms/scankit/ViewfinderView$b;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<JViewfinderView_b>; cdecl; //()[Lcom/huawei/hms/scankit/ViewfinderView$b;
//    {class} function valueOf(P1: JString): JViewfinderView_b; cdecl; //(Ljava/lang/String;)Lcom/huawei/hms/scankit/ViewfinderView$b;
//
//    { static Property }
//    {class} property a: JViewfinderView_b read _Geta;
//    {class} property b: JViewfinderView_b read _Getb;
//  end;

//  [JavaSignature('com/huawei/hms/scankit/ViewfinderView$b')]
//  JViewfinderView_b = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{6931FE90-C51A-4680-8501-CB49E1E30C48}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJViewfinderView_b = class(TJavaGenericImport<JViewfinderView_bClass, JViewfinderView_b>) end;

  JViewfinderViewClass = interface(JViewClass) // or JObjectClass // SuperSignature: android/view/View
  ['{F57644E1-C24E-41DA-8BBA-E757187D992D}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext): JViewfinderView; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(P1: JContext; P2: JAttributeSet): JViewfinderView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;)V
    {class} function init(P1: JContext; P2: JAttributeSet; P3: Integer): JViewfinderView; cdecl; overload; //(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    {class} function a(P1: JContext; P2: Integer): Integer; cdecl; overload; //(Landroid/content/Context;I)I

    { static Property }
  end;

  [JavaSignature('com/huawei/hms/scankit/ViewfinderView')]
  JViewfinderView = interface(JView) // or JObject // SuperSignature: android/view/View
  ['{638AF845-5A03-48EE-AA4D-9B25F624F602}']
    { Property Methods }
    function _Geta: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Seta(aa: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _Getb: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setb(ab: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }
    procedure setLabelText(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure setLabelTextColor(P1: Integer); cdecl; //(I)V
    procedure setLabelTextColorResource(P1: Integer); cdecl; //(I)V
    procedure setLabelTextSize(P1: Single); cdecl; //(F)V
    procedure onDraw(P1: JCanvas); cdecl; //(Landroid/graphics/Canvas;)V
    function a(P1: Integer): Integer; cdecl; overload; //(I)I
    procedure a; cdecl; overload; //()V
//    procedure setLaserStyle(P1: JViewfinderView_a); cdecl; //(Lcom/huawei/hms/scankit/ViewfinderView$a;)V
    procedure setShowResultPoint(P1: Boolean); cdecl; //(Z)V
//    procedure a(P1: Jaa); cdecl; overload; //(Lcom/huawei/hms/scankit/p/aa;)V

    { Property }
//    property a: Integer read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
  end;

  TJViewfinderView = class(TJavaGenericImport<JViewfinderViewClass, JViewfinderView>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}

//
//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JDynamicModuleInitializer',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JDynamicModuleInitializer));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Ja',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIOnLightCallback_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIOnLightCallback_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIOnLightCallback_Stub',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIOnLightCallback_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIOnLightCallback',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIOnLightCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIOnResultCallback_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIOnResultCallback_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIOnResultCallback_Stub',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIOnResultCallback_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIOnResultCallback',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIOnResultCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteCreator_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteCreator_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteCreator_Stub',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteCreator_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteCreator',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteCreator));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteDecoderDelegate_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteDecoderDelegate_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteDecoderDelegate_Stub',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteDecoderDelegate_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteDecoderDelegate',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteDecoderDelegate));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteHmsDecoderDelegate_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteHmsDecoderDelegate_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteHmsDecoderDelegate_Stub',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteHmsDecoderDelegate_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteHmsDecoderDelegate',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteHmsDecoderDelegate));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteViewDelegate_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteViewDelegate_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteViewDelegate_Stub',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteViewDelegate_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteViewDelegate',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JIRemoteViewDelegate));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jb',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jb));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jc',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jc));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jd',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jd));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JDetailRect_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JDetailRect_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JDetailRect',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JDetailRect));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Je_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Je_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Je',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Je));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jf',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jf));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JOnLightVisibleCallBack',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JOnLightVisibleCallBack));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JOnResultCallback',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JOnResultCallback));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView_a_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView_a_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView_a_2',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView_a_2));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView_b',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView_b));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView_Builder',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView_Builder));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JRemoteView));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JScanKitActivity_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JScanKitActivity_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JScanKitActivity_2',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JScanKitActivity_2));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JScanKitActivity',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JScanKitActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JScanUtil',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JScanUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JWriterException',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JWriterException));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsBuildBitmapOption_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsBuildBitmapOption_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsBuildBitmapOption_Creator',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsBuildBitmapOption_Creator));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsBuildBitmapOption_ErrorCorrectionLevel',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsBuildBitmapOption_ErrorCorrectionLevel));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsBuildBitmapOption',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsBuildBitmapOption));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_AddressInfo_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_AddressInfo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_AddressInfo_ADDRESS_TYPE',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_AddressInfo_ADDRESS_TYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_AddressInfo',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_AddressInfo));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_BookMarkInfo_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_BookMarkInfo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_BookMarkInfo',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_BookMarkInfo));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_ContactDetail_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_ContactDetail_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_ContactDetail',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_ContactDetail));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_DriverInfo_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_DriverInfo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_DriverInfo',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_DriverInfo));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EmailContent_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EmailContent_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EmailContent_EMAIL_TYPE',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EmailContent_EMAIL_TYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EmailContent',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EmailContent));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EventInfo_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EventInfo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EventInfo',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EventInfo));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EventTime_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EventTime_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EventTime',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_EventTime));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_LinkUrl_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_LinkUrl_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_LinkUrl',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_LinkUrl));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_LocationCoordinate_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_LocationCoordinate_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_LocationCoordinate',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_LocationCoordinate));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_PeopleName_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_PeopleName_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_PeopleName',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_PeopleName));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_SCAN_TYPE_FORMAT',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_SCAN_TYPE_FORMAT));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_SmsContent_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_SmsContent_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_SmsContent',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_SmsContent));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_TelPhoneNumber_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_TelPhoneNumber_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_TelPhoneNumber_USE_TYPE',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_TelPhoneNumber_USE_TYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_TelPhoneNumber',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_TelPhoneNumber));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_VehicleInfo_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_VehicleInfo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_VehicleInfo',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_VehicleInfo));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_WiFiConnectionInfo_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_WiFiConnectionInfo_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_WiFiConnectionInfo_CIPHER_MODE',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_WiFiConnectionInfo_CIPHER_MODE));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_WiFiConnectionInfo',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan_WiFiConnectionInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScan));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzer_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzer_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzer_Creator',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzer_Creator));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzer',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzer));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzerOptions_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzerOptions_1));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzerOptions_Creator',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzerOptions_Creator));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzerOptions',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanAnalyzerOptions));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanBase_SCAN_TYPE',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanBase_SCAN_TYPE));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanBase',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JHmsScanBase));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Ja_088',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Ja_088));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jb_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jb_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jb_090',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jb_090));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jc_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jc_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jc_2',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jc_2));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jc_093',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jc_093));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JCreator',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JCreator));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jd_095',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jd_095));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Je_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Je_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Je_097',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Je_097));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jf_098',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jf_098));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jg',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jg));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jh',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jh));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Ji',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Ji));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jj_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jj_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jj_2',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jj_2));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jj',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jj));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jk',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jk));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jl',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jl));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jm_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jm_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jm_2',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jm_2));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jm',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jm));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jn',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jn));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jo',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jo));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Ja_112',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Ja_112));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jaa',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jaa));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jab',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jab));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jac',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jac));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jad',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jad));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jae',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jae));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jaf',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jaf));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jag',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jag));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jah',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jah));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jai',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jai));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jaj',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jaj));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jak',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jak));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jal',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jal));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jam',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jam));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jan',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jan));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jao',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jao));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jap',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jap));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jaq_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jaq_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jaq_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jaq_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jaq',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jaq));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jar',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jar));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jas',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jas));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jat_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jat_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jat_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jat_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jat_b',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jat_b));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jat',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jat));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jau',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jau));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jav',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jav));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jaw',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jaw));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jax',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jax));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jay',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jay));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jaz',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jaz));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jb_144',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jb_144));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jba',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jba));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbb',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbb));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbc',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbc));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbd',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbd));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbe',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbe));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbf',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbf));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbg',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbg));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbh',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbh));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbi',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbi));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbj',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbj));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbk',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbk));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbl',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbl));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbm',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbm));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbn',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbn));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbo',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbo));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbp',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbp));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbq',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbq));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbr_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbr_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbr_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbr_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbr',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbr));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbs',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbs));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbt',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbt));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbu',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbu));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbv',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbv));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbw',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbw));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbx',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbx));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jby',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jby));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jbz',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jbz));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jc_1_173',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jc_1_173));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jc_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jc_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jc_175',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jc_175));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jca',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jca));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcb',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcb));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcc',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcc));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcd',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcd));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jce',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jce));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcf',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcf));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcg',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcg));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jch',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jch));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jci',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jci));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcj_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcj_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcj_2',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcj_2));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcj_3',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcj_3));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcj_4',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcj_4));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcj_5',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcj_5));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcj_6',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcj_6));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcj_7',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcj_7));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcj_8',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcj_8));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcj',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcj));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jck_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jck_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jck',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jck));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcl',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcl));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcm',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcm));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcn',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcn));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jco',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jco));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcp_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcp_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcp_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcp_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcp_b',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcp_b));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcp_c',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcp_c));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcp',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcp));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcq',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcq));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcr',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcr));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcs',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcs));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jct',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jct));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcu',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcu));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcv_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcv_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcv_b',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcv_b));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcv',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcv));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcw',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcw));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcx',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcx));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcy',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcy));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jcz',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jcz));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jd_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jd_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jd_218',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jd_218));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jda',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jda));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdb_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdb_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdb_2',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdb_2));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdb',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdb));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdc_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdc_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdc_2',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdc_2));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdc',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdc));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdd_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdd_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdd_2',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdd_2));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdd_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdd_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b_b_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b_b_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b_b_2',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b_b_2));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b_b',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b_b));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdd_b));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdd',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdd));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jde_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jde_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jde',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jde));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdf',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdf));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdg_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdg_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdg_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdg_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdg_b',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdg_b));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdg',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdg));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdh',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdh));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdi',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdi));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdj',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdj));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdk',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdk));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdl_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdl_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdl',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdl));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdm',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdm));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdn',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdn));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdo',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdo));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdp',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdp));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdq',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdq));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdr',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdr));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jds',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jds));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdt',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdt));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdu',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdu));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdv',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdv));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdw',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdw));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdx',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdx));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdy',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdy));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jdz',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jdz));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Je_263',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Je_263));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jea',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jea));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jeb_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jeb_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jeb',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jeb));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jec',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jec));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jed',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jed));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jee',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jee));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jef',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jef));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jeg',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jeg));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jeh_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jeh_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jeh',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jeh));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jei',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jei));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jej',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jej));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jek',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jek));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jel',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jel));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jem',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jem));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jen',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jen));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jeo',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jeo));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jep',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jep));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jeq',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jeq));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jer',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jer));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jes',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jes));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jet',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jet));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jeu',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jeu));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jev',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jev));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jew',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jew));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jex',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jex));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jey',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jey));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jez',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jez));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jf_292',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jf_292));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfa',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfa));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfb_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfb_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfb',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfb));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfc',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfc));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfd',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfd));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfe',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfe));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jff',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jff));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfg',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfg));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfh',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfh));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfi',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfi));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfj',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfj));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfk',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfk));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfl',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfl));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfm',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfm));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfn',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfn));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfo',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfo));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfp',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfp));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfq',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfq));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfr',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfr));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfs_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfs_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfs',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfs));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jft',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jft));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfu',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfu));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfv',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfv));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfw',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfw));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfx_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfx_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfx',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfx));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfy',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfy));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jfz',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jfz));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jg_322',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jg_322));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jga',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jga));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jh_324',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jh_324));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Ji_325',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Ji_325));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jj_326',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jj_326));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jk_327',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jk_327));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jl_328',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jl_328));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jm_329',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jm_329));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jn_330',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jn_330));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jo_331',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jo_331));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jp',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jp));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jq',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jq));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jr',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jr));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Js',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Js));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jt',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jt));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Ju',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Ju));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jv',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jv));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jw',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jw));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jx',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jx));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jy',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jy));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jz',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jz));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jp_343',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jp_343));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JProviderRemoteView',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JProviderRemoteView));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jq_345',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jq_345));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Js_346',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Js_346));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jt_347',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jt_347));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Ju_348',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Ju_348));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Ja_349',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Ja_349));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jb_350',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jb_350));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.Jc_351',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.Jc_351));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JLoadOpencvJNIUtil',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JLoadOpencvJNIUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JOpencvJNI',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JOpencvJNI));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JViewfinderView_1',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JViewfinderView_1));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JViewfinderView_a',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JViewfinderView_a));
////  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JViewfinderView_b',
////    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JViewfinderView_b));
//  TRegTypes.RegisterType('Androidapi.JNI.scan_1_1_3_301_aar.JViewfinderView',
//    TypeInfo(Androidapi.JNI.scan_1_1_3_301_aar.JViewfinderView));
//end;
//
//
//initialization
//  RegisterTypes;

{$ENDIF}

end.
