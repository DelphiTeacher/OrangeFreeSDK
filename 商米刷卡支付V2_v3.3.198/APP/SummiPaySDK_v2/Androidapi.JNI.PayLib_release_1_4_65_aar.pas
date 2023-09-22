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
//  生成时间：2023-07-24 09:44:38
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.PayLib_release_1_4_65_aar;

interface

//uses
//  Androidapi.JNIBridge,
//  Androidapi.JNI.JavaTypes,
//  Androidapi.JNI.android.os.Parcel,
//  Androidapi.JNI.android.os.Parcelable_Creator,
//  Androidapi.JNI.android.os.IBinder,
//  Androidapi.JNI.android.os.Bundle,
//  Androidapi.JNI.android.content.ComponentName,
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.android.view.Window,
//  Androidapi.JNI.android.app.Dialog,
//  Androidapi.JNI.android.content.DialogInterface,
//  Androidapi.JNI.android.view.KeyEvent,
//  Androidapi.JNI.android.view.View,
//  Androidapi.JNI.android.app.Activity;

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText;



type

// ===== Forward declarations =====

  JAidlConstants_CardExistStatus = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$CardExistStatus
  JAidlConstants_CardType = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$CardType
  JAidlConstants_CertType = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$CertType
  JAidlConstants_EMV_AID = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV$AID
  JAidlConstants_EMV_CAPK = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV$CAPK
  JAidlConstants_EMV_ClearDataOpCode = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV$ClearDataOpCode
  JAidlConstants_EMV_FlowType = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV$FlowType
  JAidlConstants_EMV_KernelType = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV$KernelType
  JAidlConstants_EMV_OnlineResult = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV$OnlineResult
  JAidlConstants_EMV_ParamType = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV$ParamType
  JAidlConstants_EMV_PinPad = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV$PinPad
  JAidlConstants_EMV_TLVOpCode = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV$TLVOpCode
  JAidlConstants_EMV_TransResult = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV$TransResult
  JAidlConstants_EMV = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$EMV
  JAidlConstants_KBBeepMode = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$KBBeepMode
  JAidlConstants_LedLight = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$LedLight
  JAidlConstants_PinBlockFormat = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$PinBlockFormat
  JAidlConstants_PinPadMode = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$PinPadMode
  JAidlConstants_PowerManage = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$PowerManage
  JAidlConstants_PrinterStatus = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$PrinterStatus
  JAidlConstants_ReadCard = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$ReadCard
  JAidlConstants_Security = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$Security
  JAidlConstants_SysParam = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$SysParam
  JAidlConstants_SystemUI = interface; //com.sunmi.pay.hardware.aidl.AidlConstants$SystemUI
  JAidlConstants = interface; //com.sunmi.pay.hardware.aidl.AidlConstants
  JAidlErrorCode = interface; //com.sunmi.pay.hardware.aidl.AidlErrorCode
//  JCardInfo_1 = interface; //com.sunmi.pay.hardware.aidl.bean.CardInfo$1
  JCardInfo = interface; //com.sunmi.pay.hardware.aidl.bean.CardInfo
//  JEmvTermParam_1 = interface; //com.sunmi.pay.hardware.aidl.bean.EmvTermParam$1
  JEmvTermParam = interface; //com.sunmi.pay.hardware.aidl.bean.EmvTermParam
//  JPinPadConfig_1 = interface; //com.sunmi.pay.hardware.aidl.bean.PinPadConfig$1
  JPinPadConfig = interface; //com.sunmi.pay.hardware.aidl.bean.PinPadConfig
//  JPinPadData_1 = interface; //com.sunmi.pay.hardware.aidl.bean.PinPadData$1
  JPinPadData = interface; //com.sunmi.pay.hardware.aidl.bean.PinPadData
//  JTransData_1 = interface; //com.sunmi.pay.hardware.aidl.bean.TransData$1
  JTransData = interface; //com.sunmi.pay.hardware.aidl.bean.TransData
  JDeviceProvide_Default = interface; //com.sunmi.pay.hardware.aidl.DeviceProvide$Default
  JDeviceProvide_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.DeviceProvide$Stub$Proxy
  JDeviceProvide_Stub = interface; //com.sunmi.pay.hardware.aidl.DeviceProvide$Stub
  JDeviceProvide = interface; //com.sunmi.pay.hardware.aidl.DeviceProvide
  JEMVListener_Default = interface; //com.sunmi.pay.hardware.aidl.emv.EMVListener$Default
  JEMVListener_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.emv.EMVListener$Stub$Proxy
  JEMVListener_Stub = interface; //com.sunmi.pay.hardware.aidl.emv.EMVListener$Stub
  JEMVListener = interface; //com.sunmi.pay.hardware.aidl.emv.EMVListener
  JEMVOpt_Default = interface; //com.sunmi.pay.hardware.aidl.emv.EMVOpt$Default
  JEMVOpt_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.emv.EMVOpt$Stub$Proxy
  JEMVOpt_Stub = interface; //com.sunmi.pay.hardware.aidl.emv.EMVOpt$Stub
  JEMVOpt = interface; //com.sunmi.pay.hardware.aidl.emv.EMVOpt
  JPinPadListener_Default = interface; //com.sunmi.pay.hardware.aidl.pinpad.PinPadListener$Default
  JPinPadListener_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.pinpad.PinPadListener$Stub$Proxy
  JPinPadListener_Stub = interface; //com.sunmi.pay.hardware.aidl.pinpad.PinPadListener$Stub
  JPinPadListener = interface; //com.sunmi.pay.hardware.aidl.pinpad.PinPadListener
  JPinPadOpt_Default = interface; //com.sunmi.pay.hardware.aidl.pinpad.PinPadOpt$Default
  JPinPadOpt_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.pinpad.PinPadOpt$Stub$Proxy
  JPinPadOpt_Stub = interface; //com.sunmi.pay.hardware.aidl.pinpad.PinPadOpt$Stub
  JPinPadOpt = interface; //com.sunmi.pay.hardware.aidl.pinpad.PinPadOpt
  JPrinterCallback_Default = interface; //com.sunmi.pay.hardware.aidl.print.PrinterCallback$Default
  JPrinterCallback_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.print.PrinterCallback$Stub$Proxy
  JPrinterCallback_Stub = interface; //com.sunmi.pay.hardware.aidl.print.PrinterCallback$Stub
  JPrinterCallback = interface; //com.sunmi.pay.hardware.aidl.print.PrinterCallback
  JPrinterOpt_Default = interface; //com.sunmi.pay.hardware.aidl.print.PrinterOpt$Default
  JPrinterOpt_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.print.PrinterOpt$Stub$Proxy
  JPrinterOpt_Stub = interface; //com.sunmi.pay.hardware.aidl.print.PrinterOpt$Stub
  JPrinterOpt = interface; //com.sunmi.pay.hardware.aidl.print.PrinterOpt
  JCheckCardCallback_Default = interface; //com.sunmi.pay.hardware.aidl.readcard.CheckCardCallback$Default
  JCheckCardCallback_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.readcard.CheckCardCallback$Stub$Proxy
  JCheckCardCallback_Stub = interface; //com.sunmi.pay.hardware.aidl.readcard.CheckCardCallback$Stub
  JCheckCardCallback = interface; //com.sunmi.pay.hardware.aidl.readcard.CheckCardCallback
  JReadCardCallback_Default = interface; //com.sunmi.pay.hardware.aidl.readcard.ReadCardCallback$Default
  JReadCardCallback_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.readcard.ReadCardCallback$Stub$Proxy
  JReadCardCallback_Stub = interface; //com.sunmi.pay.hardware.aidl.readcard.ReadCardCallback$Stub
  JReadCardCallback = interface; //com.sunmi.pay.hardware.aidl.readcard.ReadCardCallback
  JReadCardOpt_Default = interface; //com.sunmi.pay.hardware.aidl.readcard.ReadCardOpt$Default
  JReadCardOpt_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.readcard.ReadCardOpt$Stub$Proxy
  JReadCardOpt_Stub = interface; //com.sunmi.pay.hardware.aidl.readcard.ReadCardOpt$Stub
  JReadCardOpt = interface; //com.sunmi.pay.hardware.aidl.readcard.ReadCardOpt
  JSecurityOpt_Default = interface; //com.sunmi.pay.hardware.aidl.security.SecurityOpt$Default
  JSecurityOpt_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.security.SecurityOpt$Stub$Proxy
  JSecurityOpt_Stub = interface; //com.sunmi.pay.hardware.aidl.security.SecurityOpt$Stub
  JSecurityOpt = interface; //com.sunmi.pay.hardware.aidl.security.SecurityOpt
  JSPErrorCode = interface; //com.sunmi.pay.hardware.aidl.SPErrorCode
  JBasicOpt_Default = interface; //com.sunmi.pay.hardware.aidl.system.BasicOpt$Default
  JBasicOpt_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.system.BasicOpt$Stub$Proxy
  JBasicOpt_Stub = interface; //com.sunmi.pay.hardware.aidl.system.BasicOpt$Stub
  JBasicOpt = interface; //com.sunmi.pay.hardware.aidl.system.BasicOpt
  JTaxOpt_Default = interface; //com.sunmi.pay.hardware.aidl.tax.TaxOpt$Default
  JTaxOpt_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidl.tax.TaxOpt$Stub$Proxy
  JTaxOpt_Stub = interface; //com.sunmi.pay.hardware.aidl.tax.TaxOpt$Stub
  JTaxOpt = interface; //com.sunmi.pay.hardware.aidl.tax.TaxOpt
  JAidlConstantsV2 = interface; //com.sunmi.pay.hardware.aidlv2.AidlConstantsV2
  JAidlErrorCodeV2 = interface; //com.sunmi.pay.hardware.aidlv2.AidlErrorCodeV2
//  JAidV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.AidV2$1
  JAidV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.AidV2
//  JApduRecvV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.ApduRecvV2$1
  JApduRecvV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.ApduRecvV2
//  JApduSendV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.ApduSendV2$1
  JApduSendV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.ApduSendV2
//  JCapkV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.CapkV2$1
  JCapkV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.CapkV2
//  JDrlV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.DrlV2$1
  JDrlV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.DrlV2
//  JEMVCandidateV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.EMVCandidateV2$1
  JEMVCandidateV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.EMVCandidateV2
//  JEmvTermParamV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.EmvTermParamV2$1
  JEmvTermParamV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.EmvTermParamV2
//  JEMVTransDataV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.EMVTransDataV2$1
  JEMVTransDataV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.EMVTransDataV2
//  JETCInfoV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.ETCInfoV2$1
  JETCInfoV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.ETCInfoV2
//  JPinPadConfigV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.PinPadConfigV2$1
  JPinPadConfigV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.PinPadConfigV2
//  JPinPadDataV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.PinPadDataV2$1
  JPinPadDataV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.PinPadDataV2
//  JPinPadTextConfigV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.PinPadTextConfigV2$1
  JPinPadTextConfigV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.PinPadTextConfigV2
//  JRevocListV2_1 = interface; //com.sunmi.pay.hardware.aidlv2.bean.RevocListV2$1
  JRevocListV2 = interface; //com.sunmi.pay.hardware.aidlv2.bean.RevocListV2
  JEMVDataListenerV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVDataListenerV2$Default
  JEMVDataListenerV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVDataListenerV2$Stub$Proxy
  JEMVDataListenerV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVDataListenerV2$Stub
  JEMVDataListenerV2 = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVDataListenerV2
  JEMVListenerV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVListenerV2$Default
  JEMVListenerV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVListenerV2$Stub$Proxy
  JEMVListenerV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVListenerV2$Stub
  JEMVListenerV2 = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVListenerV2
  JEMVOptV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVOptV2$Default
  JEMVOptV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVOptV2$Stub$Proxy
  JEMVOptV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVOptV2$Stub
  JEMVOptV2 = interface; //com.sunmi.pay.hardware.aidlv2.emv.EMVOptV2
  JETCOptV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCOptV2$Default
  JETCOptV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCOptV2$Stub$Proxy
  JETCOptV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCOptV2$Stub
  JETCOptV2 = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCOptV2
  JETCSearchListenerV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCSearchListenerV2$Default
  JETCSearchListenerV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCSearchListenerV2$Stub$Proxy
  JETCSearchListenerV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCSearchListenerV2$Stub
  JETCSearchListenerV2 = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCSearchListenerV2
  JETCSearchTradeOBUListenerV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCSearchTradeOBUListenerV2$Default
  JETCSearchTradeOBUListenerV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCSearchTradeOBUListenerV2$Stub$Proxy
  JETCSearchTradeOBUListenerV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCSearchTradeOBUListenerV2$Stub
  JETCSearchTradeOBUListenerV2 = interface; //com.sunmi.pay.hardware.aidlv2.etc.ETCSearchTradeOBUListenerV2
  JPinPadListenerV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.pinpad.PinPadListenerV2$Default
  JPinPadListenerV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.pinpad.PinPadListenerV2$Stub$Proxy
  JPinPadListenerV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.pinpad.PinPadListenerV2$Stub
  JPinPadListenerV2 = interface; //com.sunmi.pay.hardware.aidlv2.pinpad.PinPadListenerV2
  JPinPadOptV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.pinpad.PinPadOptV2$Default
  JPinPadOptV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.pinpad.PinPadOptV2$Stub$Proxy
  JPinPadOptV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.pinpad.PinPadOptV2$Stub
  JPinPadOptV2 = interface; //com.sunmi.pay.hardware.aidlv2.pinpad.PinPadOptV2
  JPrinterCallbackV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.print.PrinterCallbackV2$Default
  JPrinterCallbackV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.print.PrinterCallbackV2$Stub$Proxy
  JPrinterCallbackV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.print.PrinterCallbackV2$Stub
  JPrinterCallbackV2 = interface; //com.sunmi.pay.hardware.aidlv2.print.PrinterCallbackV2
  JPrinterOptV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.print.PrinterOptV2$Default
  JPrinterOptV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.print.PrinterOptV2$Stub$Proxy
  JPrinterOptV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.print.PrinterOptV2$Stub
  JPrinterOptV2 = interface; //com.sunmi.pay.hardware.aidlv2.print.PrinterOptV2
  JCheckCardCallbackV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.readcard.CheckCardCallbackV2$Default
  JCheckCardCallbackV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.readcard.CheckCardCallbackV2$Stub$Proxy
  JCheckCardCallbackV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.readcard.CheckCardCallbackV2$Stub
  JCheckCardCallbackV2 = interface; //com.sunmi.pay.hardware.aidlv2.readcard.CheckCardCallbackV2
  JReadCardOptV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.readcard.ReadCardOptV2$Default
  JReadCardOptV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.readcard.ReadCardOptV2$Stub$Proxy
  JReadCardOptV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.readcard.ReadCardOptV2$Stub
  JReadCardOptV2 = interface; //com.sunmi.pay.hardware.aidlv2.readcard.ReadCardOptV2
  JSecurityOptV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.security.SecurityOptV2$Default
  JSecurityOptV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.security.SecurityOptV2$Stub$Proxy
  JSecurityOptV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.security.SecurityOptV2$Stub
  JSecurityOptV2 = interface; //com.sunmi.pay.hardware.aidlv2.security.SecurityOptV2
  JBasicOptV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.system.BasicOptV2$Default
  JBasicOptV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.system.BasicOptV2$Stub$Proxy
  JBasicOptV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.system.BasicOptV2$Stub
  JBasicOptV2 = interface; //com.sunmi.pay.hardware.aidlv2.system.BasicOptV2
  JTaxOptV2_Default = interface; //com.sunmi.pay.hardware.aidlv2.tax.TaxOptV2$Default
  JTaxOptV2_Stub_Proxy = interface; //com.sunmi.pay.hardware.aidlv2.tax.TaxOptV2$Stub$Proxy
  JTaxOptV2_Stub = interface; //com.sunmi.pay.hardware.aidlv2.tax.TaxOptV2$Stub
  JTaxOptV2 = interface; //com.sunmi.pay.hardware.aidlv2.tax.TaxOptV2
  JBuildConfig = interface; //com.sunmi.paylib.BuildConfig
//  JSunmiPayKernel_1 = interface; //sunmi.paylib.SunmiPayKernel$1
  JSunmiPayKernel_ConnCallback = interface; //sunmi.paylib.SunmiPayKernel$ConnCallback
  JSunmiPayKernel_ConnectCallback = interface; //sunmi.paylib.SunmiPayKernel$ConnectCallback
  JSunmiPayKernel = interface; //sunmi.paylib.SunmiPayKernel
//  JUIUtils_1 = interface; //sunmi.paylib.UIUtils$1
  JUIUtils = interface; //sunmi.paylib.UIUtils

// ===== Forward SuperClasses declarations =====

  JAidlConstantsClass = interface; //com.sunmi.pay.hardware.aidl.AidlConstants

// ===== Interface declarations =====

  JAidlConstants_CardExistStatusClass = interface(JObjectClass)
  ['{024C5FD2-729A-4AA3-A896-7F56FF5EA01C}']
    { static Property Methods }
    {class} function _GetCARD_ABSENT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_PRESENT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_CardExistStatus; cdecl;

    { static Property }
    {class} property CARD_ABSENT: Integer read _GetCARD_ABSENT;
    {class} property CARD_PRESENT: Integer read _GetCARD_PRESENT;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$CardExistStatus')]
  JAidlConstants_CardExistStatus = interface(JObject)
  ['{9C58AC1F-95EC-4895-8F23-56E079756442}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_CardExistStatus = class(TJavaGenericImport<JAidlConstants_CardExistStatusClass, JAidlConstants_CardExistStatus>) end;

  JAidlConstants_CardTypeClass = interface(JEnumClass) // or JObjectClass
  ['{B26A9A4E-60A1-46D3-945B-D3F790159BED}']
    { static Property Methods }
    {class} function _GetMAGNETIC: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNFC: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIC: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPSAM0: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSAM1: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIFARE: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFELICA: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIFARE_PLUS: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIFARE_DESFIRE: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT24C01: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT24C02: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT24C04: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT24C08: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT24C16: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT24C32: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT24C64: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT24C128: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT24C256: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT24C512: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSLE4442: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSLE4428: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT88SC1608: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCTX512B: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSAM2: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSAM3: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSRI: JAidlConstants_CardType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JAidlConstants_CardType>; cdecl;
    {class} function valueOf(name: JString): JAidlConstants_CardType; cdecl;
    {class} function getDeviceId(value: Integer): JString; cdecl;

    { static Property }
    {class} property MAGNETIC: JAidlConstants_CardType read _GetMAGNETIC;
    {class} property NFC: JAidlConstants_CardType read _GetNFC;
    {class} property IC: JAidlConstants_CardType read _GetIC;
    {class} property PSAM0: JAidlConstants_CardType read _GetPSAM0;
    {class} property SAM1: JAidlConstants_CardType read _GetSAM1;
    {class} property MIFARE: JAidlConstants_CardType read _GetMIFARE;
    {class} property FELICA: JAidlConstants_CardType read _GetFELICA;
    {class} property MIFARE_PLUS: JAidlConstants_CardType read _GetMIFARE_PLUS;
    {class} property MIFARE_DESFIRE: JAidlConstants_CardType read _GetMIFARE_DESFIRE;
    {class} property AT24C01: JAidlConstants_CardType read _GetAT24C01;
    {class} property AT24C02: JAidlConstants_CardType read _GetAT24C02;
    {class} property AT24C04: JAidlConstants_CardType read _GetAT24C04;
    {class} property AT24C08: JAidlConstants_CardType read _GetAT24C08;
    {class} property AT24C16: JAidlConstants_CardType read _GetAT24C16;
    {class} property AT24C32: JAidlConstants_CardType read _GetAT24C32;
    {class} property AT24C64: JAidlConstants_CardType read _GetAT24C64;
    {class} property AT24C128: JAidlConstants_CardType read _GetAT24C128;
    {class} property AT24C256: JAidlConstants_CardType read _GetAT24C256;
    {class} property AT24C512: JAidlConstants_CardType read _GetAT24C512;
    {class} property SLE4442: JAidlConstants_CardType read _GetSLE4442;
    {class} property SLE4428: JAidlConstants_CardType read _GetSLE4428;
    {class} property AT88SC1608: JAidlConstants_CardType read _GetAT88SC1608;
    {class} property CTX512B: JAidlConstants_CardType read _GetCTX512B;
    {class} property SAM2: JAidlConstants_CardType read _GetSAM2;
    {class} property SAM3: JAidlConstants_CardType read _GetSAM3;
    {class} property SRI: JAidlConstants_CardType read _GetSRI;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$CardType')]
  JAidlConstants_CardType = interface(JEnum) // or JObject
  ['{3E34629D-82DD-4C31-B42E-905FB85D81F8}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getMessage: JString; cdecl;

    { Property }
  end;

  TJAidlConstants_CardType = class(TJavaGenericImport<JAidlConstants_CardTypeClass, JAidlConstants_CardType>) end;

  JAidlConstants_CertTypeClass = interface(JObjectClass)
  ['{72EFBB3A-56ED-4DDD-A486-6E4BCC05FD3F}']
    { static Property Methods }
    {class} function _GetIDCARD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetARMYCARD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPASSPORT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetARRIVALCARD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEMPIDCARD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOTHERCARD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_CertType; cdecl;

    { static Property }
    {class} property IDCARD: Integer read _GetIDCARD;
    {class} property ARMYCARD: Integer read _GetARMYCARD;
    {class} property PASSPORT: Integer read _GetPASSPORT;
    {class} property ARRIVALCARD: Integer read _GetARRIVALCARD;
    {class} property TEMPIDCARD: Integer read _GetTEMPIDCARD;
    {class} property OTHERCARD: Integer read _GetOTHERCARD;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$CertType')]
  JAidlConstants_CertType = interface(JObject)
  ['{21973D26-9E06-44AD-802F-A8E4016D8BAA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_CertType = class(TJavaGenericImport<JAidlConstants_CertTypeClass, JAidlConstants_CertType>) end;

  JAidlConstants_EMV_AIDClass = interface(JObjectClass)
  ['{972DC5AB-6269-4839-B626-1256DD254293}']
    { static Property Methods }
    {class} function _GetACTION_AID_ADD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACTION_AID_DEL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV_AID; cdecl;

    { static Property }
    {class} property ACTION_AID_ADD: Integer read _GetACTION_AID_ADD;
    {class} property ACTION_AID_DEL: Integer read _GetACTION_AID_DEL;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV$AID')]
  JAidlConstants_EMV_AID = interface(JObject)
  ['{B664C8A3-25D6-4CF5-9CF6-B13F8D11774E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV_AID = class(TJavaGenericImport<JAidlConstants_EMV_AIDClass, JAidlConstants_EMV_AID>) end;

  JAidlConstants_EMV_CAPKClass = interface(JObjectClass)
  ['{57120994-0E51-49D1-9AD0-53C7B328BC6A}']
    { static Property Methods }
    {class} function _GetACTION_CAPK_ADD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACTION_CAPK_DEL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV_CAPK; cdecl;

    { static Property }
    {class} property ACTION_CAPK_ADD: Integer read _GetACTION_CAPK_ADD;
    {class} property ACTION_CAPK_DEL: Integer read _GetACTION_CAPK_DEL;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV$CAPK')]
  JAidlConstants_EMV_CAPK = interface(JObject)
  ['{A60EF178-9D0D-469C-8FDB-A420D83247B9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV_CAPK = class(TJavaGenericImport<JAidlConstants_EMV_CAPKClass, JAidlConstants_EMV_CAPK>) end;

  JAidlConstants_EMV_ClearDataOpCodeClass = interface(JObjectClass)
  ['{6B3EDB9F-C198-4C41-A61C-A0477F935165}']
    { static Property Methods }
    {class} function _GetOP_CLEAR_DATA_ALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_CLEAR_DATA_TERMINAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_CLEAR_DATA_CARD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV_ClearDataOpCode; cdecl;

    { static Property }
    {class} property OP_CLEAR_DATA_ALL: Integer read _GetOP_CLEAR_DATA_ALL;
    {class} property OP_CLEAR_DATA_TERMINAL: Integer read _GetOP_CLEAR_DATA_TERMINAL;
    {class} property OP_CLEAR_DATA_CARD: Integer read _GetOP_CLEAR_DATA_CARD;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV$ClearDataOpCode')]
  JAidlConstants_EMV_ClearDataOpCode = interface(JObject)
  ['{E7635FDC-077A-48E2-8957-8AE336492D11}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV_ClearDataOpCode = class(TJavaGenericImport<JAidlConstants_EMV_ClearDataOpCodeClass, JAidlConstants_EMV_ClearDataOpCode>) end;

  JAidlConstants_EMV_FlowTypeClass = interface(JObjectClass)
  ['{DF9CAF58-435E-4A91-9F64-AE369C813AA1}']
    { static Property Methods }
    {class} function _GetTYPE_EMV_STANDARD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_EMV_BRIEF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_NFC_SKIP_CVM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_NFC_SPEEDUP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE_NFC_SPEEDUP_FULL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV_FlowType; cdecl;

    { static Property }
    {class} property TYPE_EMV_STANDARD: Integer read _GetTYPE_EMV_STANDARD;
    {class} property TYPE_EMV_BRIEF: Integer read _GetTYPE_EMV_BRIEF;
    {class} property TYPE_NFC_SKIP_CVM: Integer read _GetTYPE_NFC_SKIP_CVM;
    {class} property TYPE_NFC_SPEEDUP: Integer read _GetTYPE_NFC_SPEEDUP;
    {class} property TYPE_NFC_SPEEDUP_FULL: Integer read _GetTYPE_NFC_SPEEDUP_FULL;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV$FlowType')]
  JAidlConstants_EMV_FlowType = interface(JObject)
  ['{9443D8D2-6F15-4BAF-827C-31332142AAD3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV_FlowType = class(TJavaGenericImport<JAidlConstants_EMV_FlowTypeClass, JAidlConstants_EMV_FlowType>) end;

  JAidlConstants_EMV_KernelTypeClass = interface(JObjectClass)
  ['{5C7BB2F7-FC65-4D34-B5A2-74C6F761176E}']
    { static Property Methods }
    {class} function _GetEMV: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQPBOC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAYPASS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAYWAVE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDISCOVER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJCB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFLASH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMCCS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRUPAY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAGO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEFTPOS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV_KernelType; cdecl;

    { static Property }
    {class} property EMV: Integer read _GetEMV;
    {class} property QPBOC: Integer read _GetQPBOC;
    {class} property PAYPASS: Integer read _GetPAYPASS;
    {class} property PAYWAVE: Integer read _GetPAYWAVE;
    {class} property AE: Integer read _GetAE;
    {class} property DISCOVER: Integer read _GetDISCOVER;
    {class} property JCB: Integer read _GetJCB;
    {class} property FLASH: Integer read _GetFLASH;
    {class} property MIR: Integer read _GetMIR;
    {class} property MCCS: Integer read _GetMCCS;
    {class} property RUPAY: Integer read _GetRUPAY;
    {class} property PAGO: Integer read _GetPAGO;
    {class} property EFTPOS: Integer read _GetEFTPOS;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV$KernelType')]
  JAidlConstants_EMV_KernelType = interface(JObject)
  ['{E2663979-7739-43B2-B378-9D06046E01C3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV_KernelType = class(TJavaGenericImport<JAidlConstants_EMV_KernelTypeClass, JAidlConstants_EMV_KernelType>) end;

  JAidlConstants_EMV_OnlineResultClass = interface(JObjectClass)
  ['{7C620B00-F05C-42B1-BC47-D7CEEEB98B11}']
    { static Property Methods }
    {class} function _GetONLINE_APPROVAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetONLINE_DECLINE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetONLINE_FAIL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetONLINE_APPROVAL_2_TAP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetONLINE_DECLINE_2_TAP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetONLINE_FAIL_2_TAP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOFFLINE_DECLINE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetONLINE_FAIL_FULL_ONLINE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetONLINE_SUCCESS_NO_SCRIPT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV_OnlineResult; cdecl;

    { static Property }
    {class} property ONLINE_APPROVAL: Integer read _GetONLINE_APPROVAL;
    {class} property ONLINE_DECLINE: Integer read _GetONLINE_DECLINE;
    {class} property ONLINE_FAIL: Integer read _GetONLINE_FAIL;
    {class} property ONLINE_APPROVAL_2_TAP: Integer read _GetONLINE_APPROVAL_2_TAP;
    {class} property ONLINE_DECLINE_2_TAP: Integer read _GetONLINE_DECLINE_2_TAP;
    {class} property ONLINE_FAIL_2_TAP: Integer read _GetONLINE_FAIL_2_TAP;
    {class} property OFFLINE_DECLINE: Integer read _GetOFFLINE_DECLINE;
    {class} property ONLINE_FAIL_FULL_ONLINE: Integer read _GetONLINE_FAIL_FULL_ONLINE;
    {class} property ONLINE_SUCCESS_NO_SCRIPT: Integer read _GetONLINE_SUCCESS_NO_SCRIPT;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV$OnlineResult')]
  JAidlConstants_EMV_OnlineResult = interface(JObject)
  ['{74F15523-69F6-46BF-AC20-122B69B2118E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV_OnlineResult = class(TJavaGenericImport<JAidlConstants_EMV_OnlineResultClass, JAidlConstants_EMV_OnlineResult>) end;

  JAidlConstants_EMV_ParamTypeClass = interface(JObjectClass)
  ['{0874EDD6-FB75-43AA-BC8E-86935137B1ED}']
    { static Property Methods }
    {class} function _GetDEFAULT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONTACT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONTACTLESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV_ParamType; cdecl;

    { static Property }
    {class} property DEFAULT: Integer read _GetDEFAULT;
    {class} property CONTACT: Integer read _GetCONTACT;
    {class} property CONTACTLESS: Integer read _GetCONTACTLESS;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV$ParamType')]
  JAidlConstants_EMV_ParamType = interface(JObject)
  ['{6F1DEB1F-F59D-4096-81E5-5A72DD5E5DFB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV_ParamType = class(TJavaGenericImport<JAidlConstants_EMV_ParamTypeClass, JAidlConstants_EMV_ParamType>) end;

  JAidlConstants_EMV_PinPadClass = interface(JObjectClass)
  ['{B30C22B7-384B-4BA3-A1ED-757DE40F6263}']
    { static Property Methods }
    {class} function _GetEMV_PINPAD_TIMEOUT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PINPAD_CANCEL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PINPAD_CONNFIRM: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV_PinPad; cdecl;

    { static Property }
    {class} property EMV_PINPAD_TIMEOUT: Integer read _GetEMV_PINPAD_TIMEOUT;
    {class} property EMV_PINPAD_CANCEL: Integer read _GetEMV_PINPAD_CANCEL;
    {class} property EMV_PINPAD_CONNFIRM: Integer read _GetEMV_PINPAD_CONNFIRM;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV$PinPad')]
  JAidlConstants_EMV_PinPad = interface(JObject)
  ['{0551CD22-C6F0-4F32-B991-F99680A97E3A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV_PinPad = class(TJavaGenericImport<JAidlConstants_EMV_PinPadClass, JAidlConstants_EMV_PinPad>) end;

  JAidlConstants_EMV_TLVOpCodeClass = interface(JObjectClass)
  ['{D27AC6EF-F300-4FA0-88FD-3ACC4FE448B2}']
    { static Property Methods }
    {class} function _GetOP_NORMAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_PAYPASS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_PAYWAVE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_MIR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_PAGO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_JCB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_PURE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_AE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_FLASH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_DPAS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_RUPAY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_EFTPOS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_AID_RELEVANT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_ADD_SELF_DEFINE_TAG: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_DEL_SELF_DEFINE_TAG: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_SET_TAG_NOT_PRESENT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOP_SET_TAG_EMPTY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV_TLVOpCode; cdecl;

    { static Property }
    {class} property OP_NORMAL: Integer read _GetOP_NORMAL;
    {class} property OP_PAYPASS: Integer read _GetOP_PAYPASS;
    {class} property OP_PAYWAVE: Integer read _GetOP_PAYWAVE;
    {class} property OP_MIR: Integer read _GetOP_MIR;
    {class} property OP_PAGO: Integer read _GetOP_PAGO;
    {class} property OP_JCB: Integer read _GetOP_JCB;
    {class} property OP_PURE: Integer read _GetOP_PURE;
    {class} property OP_AE: Integer read _GetOP_AE;
    {class} property OP_FLASH: Integer read _GetOP_FLASH;
    {class} property OP_DPAS: Integer read _GetOP_DPAS;
    {class} property OP_RUPAY: Integer read _GetOP_RUPAY;
    {class} property OP_EFTPOS: Integer read _GetOP_EFTPOS;
    {class} property OP_AID_RELEVANT: Integer read _GetOP_AID_RELEVANT;
    {class} property OP_ADD_SELF_DEFINE_TAG: Integer read _GetOP_ADD_SELF_DEFINE_TAG;
    {class} property OP_DEL_SELF_DEFINE_TAG: Integer read _GetOP_DEL_SELF_DEFINE_TAG;
    {class} property OP_SET_TAG_NOT_PRESENT: Integer read _GetOP_SET_TAG_NOT_PRESENT;
    {class} property OP_SET_TAG_EMPTY: Integer read _GetOP_SET_TAG_EMPTY;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV$TLVOpCode')]
  JAidlConstants_EMV_TLVOpCode = interface(JObject)
  ['{89779981-B8CE-4276-8D36-7CE747F45D38}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV_TLVOpCode = class(TJavaGenericImport<JAidlConstants_EMV_TLVOpCodeClass, JAidlConstants_EMV_TLVOpCode>) end;

  JAidlConstants_EMV_TransResultClass = interface(JObjectClass)
  ['{DB54D5E4-5BB2-490E-A796-1DAC894A4296}']
    { static Property Methods }
    {class} function _GetSUCCESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOFFLINE_APPROVAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOFFLINE_DECLINE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESERVE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRY_AGAIN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetONLINE_APPROVAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetONLINE_DECLINE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV_TransResult; cdecl;

    { static Property }
    {class} property SUCCESS: Integer read _GetSUCCESS;
    {class} property OFFLINE_APPROVAL: Integer read _GetOFFLINE_APPROVAL;
    {class} property OFFLINE_DECLINE: Integer read _GetOFFLINE_DECLINE;
    {class} property RESERVE: Integer read _GetRESERVE;
    {class} property TRY_AGAIN: Integer read _GetTRY_AGAIN;
    {class} property ONLINE_APPROVAL: Integer read _GetONLINE_APPROVAL;
    {class} property ONLINE_DECLINE: Integer read _GetONLINE_DECLINE;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV$TransResult')]
  JAidlConstants_EMV_TransResult = interface(JObject)
  ['{6EF2CBF9-0820-4A12-838B-7FDC596A2E02}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV_TransResult = class(TJavaGenericImport<JAidlConstants_EMV_TransResultClass, JAidlConstants_EMV_TransResult>) end;

  JAidlConstants_EMVClass = interface(JObjectClass)
  ['{21908EBE-3FD5-4FDE-B081-60A25CCDBDDE}']
    { static Property Methods }
    {class} function _GetFORCE_ONLINE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNO_ONLINE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXIST_ALL_NOT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXIST_ALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXIST_CAPK_NOT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXIST_AID_NOT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_RESULT_FINISHED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_RESULT_TERMINATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_ERROR_PINBLOCK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_UNSUPPORTED_TRANS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_EMV; cdecl;

    { static Property }
    {class} property FORCE_ONLINE: Integer read _GetFORCE_ONLINE;
    {class} property NO_ONLINE: Integer read _GetNO_ONLINE;
    {class} property EXIST_ALL_NOT: Integer read _GetEXIST_ALL_NOT;
    {class} property EXIST_ALL: Integer read _GetEXIST_ALL;
    {class} property EXIST_CAPK_NOT: Integer read _GetEXIST_CAPK_NOT;
    {class} property EXIST_AID_NOT: Integer read _GetEXIST_AID_NOT;
    {class} property EMV_RESULT_FINISHED: Integer read _GetEMV_RESULT_FINISHED;
    {class} property EMV_RESULT_TERMINATION: Integer read _GetEMV_RESULT_TERMINATION;
    {class} property EMV_ERROR_PINBLOCK: Integer read _GetEMV_ERROR_PINBLOCK;
    {class} property EMV_UNSUPPORTED_TRANS: Integer read _GetEMV_UNSUPPORTED_TRANS;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$EMV')]
  JAidlConstants_EMV = interface(JObject)
  ['{765DB120-8AEB-46D8-8863-1E7E5A5BF643}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_EMV = class(TJavaGenericImport<JAidlConstants_EMVClass, JAidlConstants_EMV>) end;

  JAidlConstants_KBBeepModeClass = interface(JObjectClass)
  ['{CAC281EC-4127-486F-AB3C-F4324C99B9B9}']
    { static Property Methods }
    {class} function _GetMODE_ON: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_OFF: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_KBBeepMode; cdecl;

    { static Property }
    {class} property MODE_ON: JString read _GetMODE_ON;
    {class} property MODE_OFF: JString read _GetMODE_OFF;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$KBBeepMode')]
  JAidlConstants_KBBeepMode = interface(JObject)
  ['{438BCD70-9967-46C1-9F3D-820EDBE05AAE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_KBBeepMode = class(TJavaGenericImport<JAidlConstants_KBBeepModeClass, JAidlConstants_KBBeepMode>) end;

  JAidlConstants_LedLightClass = interface(JObjectClass)
  ['{BC816C69-EBED-4234-A337-BE7FC30FAF70}']
    { static Property Methods }
    {class} function _GetRED_LIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREEN_LIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetYELLOW_LIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBLUE_LIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWHITE_LIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_LedLight; cdecl;

    { static Property }
    {class} property RED_LIGHT: Integer read _GetRED_LIGHT;
    {class} property GREEN_LIGHT: Integer read _GetGREEN_LIGHT;
    {class} property YELLOW_LIGHT: Integer read _GetYELLOW_LIGHT;
    {class} property BLUE_LIGHT: Integer read _GetBLUE_LIGHT;
    {class} property WHITE_LIGHT: Integer read _GetWHITE_LIGHT;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$LedLight')]
  JAidlConstants_LedLight = interface(JObject)
  ['{1BA33597-37BD-43A7-8369-B264170618AF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_LedLight = class(TJavaGenericImport<JAidlConstants_LedLightClass, JAidlConstants_LedLight>) end;

  JAidlConstants_PinBlockFormatClass = interface(JObjectClass)
  ['{00F6771B-4FE7-41B5-A804-CCCC4B99AB17}']
    { static Property Methods }
    {class} function _GetSEC_PIN_BLK_ISO_FMT0: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_PIN_BLK_ISO_FMT1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_PIN_BLK_ISO_FMT3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_PIN_BLK_ISO_FMT4: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_PinBlockFormat; cdecl;

    { static Property }
    {class} property SEC_PIN_BLK_ISO_FMT0: Integer read _GetSEC_PIN_BLK_ISO_FMT0;
    {class} property SEC_PIN_BLK_ISO_FMT1: Integer read _GetSEC_PIN_BLK_ISO_FMT1;
    {class} property SEC_PIN_BLK_ISO_FMT3: Integer read _GetSEC_PIN_BLK_ISO_FMT3;
    {class} property SEC_PIN_BLK_ISO_FMT4: Integer read _GetSEC_PIN_BLK_ISO_FMT4;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$PinBlockFormat')]
  JAidlConstants_PinBlockFormat = interface(JObject)
  ['{67B80756-5981-4F12-BCCE-4E86DC187078}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_PinBlockFormat = class(TJavaGenericImport<JAidlConstants_PinBlockFormatClass, JAidlConstants_PinBlockFormat>) end;

  JAidlConstants_PinPadModeClass = interface(JObjectClass)
  ['{1458E0D5-A0B3-4AA6-B842-36A6125C157A}']
    { static Property Methods }
    {class} function _GetMODE_NORMAL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_MEITUAN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_SILENT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE_LEDOFF: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_PinPadMode; cdecl;

    { static Property }
    {class} property MODE_NORMAL: JString read _GetMODE_NORMAL;
    {class} property MODE_MEITUAN: JString read _GetMODE_MEITUAN;
    {class} property MODE_SILENT: JString read _GetMODE_SILENT;
    {class} property MODE_LEDOFF: JString read _GetMODE_LEDOFF;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$PinPadMode')]
  JAidlConstants_PinPadMode = interface(JObject)
  ['{65C15019-3262-4AC0-8088-8B492E8F3D08}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_PinPadMode = class(TJavaGenericImport<JAidlConstants_PinPadModeClass, JAidlConstants_PinPadMode>) end;

  JAidlConstants_PowerManageClass = interface(JObjectClass)
  ['{38B1311E-1975-4D4F-8787-45F85B675B22}']
    { static Property Methods }
    {class} function _GetSYS_POWER_SLEEP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_SHUTDOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_REBOOT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_PowerManage; cdecl;

    { static Property }
    {class} property SYS_POWER_SLEEP: Integer read _GetSYS_POWER_SLEEP;
    {class} property SYS_SHUTDOWN: Integer read _GetSYS_SHUTDOWN;
    {class} property SYS_REBOOT: Integer read _GetSYS_REBOOT;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$PowerManage')]
  JAidlConstants_PowerManage = interface(JObject)
  ['{09C8512B-00FA-4B16-8328-85C8F8907E8F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_PowerManage = class(TJavaGenericImport<JAidlConstants_PowerManageClass, JAidlConstants_PowerManage>) end;

  JAidlConstants_PrinterStatusClass = interface(JObjectClass)
  ['{79911F88-1EEC-4E99-A9DC-DE936BC3B091}']
    { static Property Methods }
    {class} function _GetIDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAPERLESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOVERTEMPERATURE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOW_BATTERY_VOLTAGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_PrinterStatus; cdecl;

    { static Property }
    {class} property IDLE: Integer read _GetIDLE;
    {class} property PRINTING: Integer read _GetPRINTING;
    {class} property PAPERLESS: Integer read _GetPAPERLESS;
    {class} property OVERTEMPERATURE: Integer read _GetOVERTEMPERATURE;
    {class} property LOW_BATTERY_VOLTAGE: Integer read _GetLOW_BATTERY_VOLTAGE;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$PrinterStatus')]
  JAidlConstants_PrinterStatus = interface(JObject)
  ['{4F30E03F-1D3A-4ADB-A2CC-D4CDE1A3A7B7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_PrinterStatus = class(TJavaGenericImport<JAidlConstants_PrinterStatusClass, JAidlConstants_PrinterStatus>) end;

  JAidlConstants_ReadCardClass = interface(JObjectClass)
  ['{6C3AB8C0-EFD4-4A56-BAC9-5999A9361192}']
    { static Property Methods }
    {class} function _GetERR_TRACK_SUCCESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERR_TRACK_NO_DATA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERR_TRACK_PARITY_CHECK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERR_TRACK_LRC_CHECK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_ReadCard; cdecl;

    { static Property }
    {class} property ERR_TRACK_SUCCESS: Integer read _GetERR_TRACK_SUCCESS;
    {class} property ERR_TRACK_NO_DATA: Integer read _GetERR_TRACK_NO_DATA;
    {class} property ERR_TRACK_PARITY_CHECK: Integer read _GetERR_TRACK_PARITY_CHECK;
    {class} property ERR_TRACK_LRC_CHECK: Integer read _GetERR_TRACK_LRC_CHECK;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$ReadCard')]
  JAidlConstants_ReadCard = interface(JObject)
  ['{B01DDBC6-C34C-4688-BBA3-7564702AF6F8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_ReadCard = class(TJavaGenericImport<JAidlConstants_ReadCardClass, JAidlConstants_ReadCard>) end;

  JAidlConstants_SecurityClass = interface(JObjectClass)
  ['{51BE8C27-EE28-4C91-842C-CA0C84AC7E1F}']
    { static Property Methods }
    {class} function _GetKEY_TYPE_KEK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_TYPE_TMK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_TYPE_PIK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_TYPE_MAK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_TYPE_TDK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_TYPE_REC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_TYPE_DUPKT_BDK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_TYPE_DUPKT_IPEK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_TYPE_KBPK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_TYPE_TADK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_ALG_TYPE_3DES: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_ALG_TYPE_AES: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_ALG_TYPE_SM4: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_ISO_9797_1_MAC_ALG1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_ISO_9797_1_MAC_ALG3: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_ISO_16609_MAC_ALG1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_FAST_MODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_X9_19: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_CBC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_CUP_SM4_MAC_ALG1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_CUP_SM4_MAC_ALG2: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_X9_19_DEA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_FAST_MODE_INTERNATIONAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAC_ALG_CBC_INTERNATIONAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_STATUS_MONITOR_ZERO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_STATUS_MONITOR_ONE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_STATUS_MONITOR_TWO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_STATUS_MONITOR_THREE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTH_TYPE_DEBUGMODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEBUGMODE_YES: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEBUGMODE_NO: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_CTRL_GETKCV: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_CTRL_DUKPT_ADD_KSN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_CTRL_DUKPT_GET_KSN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_CTRL_ERASE_KEY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_MKSK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_DUKPT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_RSA_KEY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_SM2_KEY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ECC_KEY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MODE_ECB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MODE_CBC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MODE_OFB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_MODE_CFB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_SELECT_KEY_PIN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_SELECT_KEY_MAC_BOTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_SELECT_KEY_MAC_RSP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_SELECT_KEY_DATA_BOTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_SELECT_KEY_DATA_RSP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_SELECT_KEY_MAC_GEN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_SELECT_KEY_DATA_ENC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_SELECT_KEY_KEY_ENC_KEY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_SELECT_KEY_DERIVATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_SELECT_KEY_DERIVATION_INIT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_TYPE_2TDEA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_TYPE_3TDEA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_TYPE_AES128: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_TYPE_AES192: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDUKPT_KEY_TYPE_AES256: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHASH_SHA_TYPE_1: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHASH_SHA_TYPE_224: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHASH_SHA_TYPE_256: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHASH_SHA_TYPE_384: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHASH_SHA_TYPE_512: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHASH_SM3_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_TRANSFORMATION_1: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_TRANSFORMATION_2: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_TRANSFORMATION_3: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_TRANSFORMATION_4: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_TRANSFORMATION_5: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_TRANSFORMATION_6: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_TRANSFORMATION_7: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_SIGN_ALG_1: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_SIGN_ALG_2: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_SIGN_ALG_3: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_SIGN_ALG_4: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSA_SIGN_ALG_5: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ECDH_STEP1_MODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ECDH_STEP2_MODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_OAEP_MODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ECC_PARAM_P256: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ECC_PARAM_P384: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ECC_PARAM_P521: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetECC_KEYTYPE_PK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetECC_KEYTYPE_SK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKCV_MODE_NOCHK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKCV_MODE_CHK0: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKCV_MODE_CHKFIX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKCV_MODE_CHKMAC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKCV_MODE_CHKCMAC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_CTRL_PANPARA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_CTRL_AUTHPARA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_CTRL_APACSMAC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKEY_VARIANT_XOR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOTHING_PADDING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPKCS1_PADDING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPKCS7_PADDING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPKCS5_PADDING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPKCS1_OAEP_PADDING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPKCS1_V1_5_SHA512: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_Security; cdecl;

    { static Property }
    {class} property KEY_TYPE_KEK: Integer read _GetKEY_TYPE_KEK;
    {class} property KEY_TYPE_TMK: Integer read _GetKEY_TYPE_TMK;
    {class} property KEY_TYPE_PIK: Integer read _GetKEY_TYPE_PIK;
    {class} property KEY_TYPE_MAK: Integer read _GetKEY_TYPE_MAK;
    {class} property KEY_TYPE_TDK: Integer read _GetKEY_TYPE_TDK;
    {class} property KEY_TYPE_REC: Integer read _GetKEY_TYPE_REC;
    {class} property KEY_TYPE_DUPKT_BDK: Integer read _GetKEY_TYPE_DUPKT_BDK;
    {class} property KEY_TYPE_DUPKT_IPEK: Integer read _GetKEY_TYPE_DUPKT_IPEK;
    {class} property KEY_TYPE_KBPK: Integer read _GetKEY_TYPE_KBPK;
    {class} property KEY_TYPE_TADK: Integer read _GetKEY_TYPE_TADK;
    {class} property KEY_ALG_TYPE_3DES: Integer read _GetKEY_ALG_TYPE_3DES;
    {class} property KEY_ALG_TYPE_AES: Integer read _GetKEY_ALG_TYPE_AES;
    {class} property KEY_ALG_TYPE_SM4: Integer read _GetKEY_ALG_TYPE_SM4;
    {class} property MAC_ALG_ISO_9797_1_MAC_ALG1: Integer read _GetMAC_ALG_ISO_9797_1_MAC_ALG1;
    {class} property MAC_ALG_ISO_9797_1_MAC_ALG3: Integer read _GetMAC_ALG_ISO_9797_1_MAC_ALG3;
    {class} property MAC_ALG_ISO_16609_MAC_ALG1: Integer read _GetMAC_ALG_ISO_16609_MAC_ALG1;
    {class} property MAC_ALG_FAST_MODE: Integer read _GetMAC_ALG_FAST_MODE;
    {class} property MAC_ALG_X9_19: Integer read _GetMAC_ALG_X9_19;
    {class} property MAC_ALG_CBC: Integer read _GetMAC_ALG_CBC;
    {class} property MAC_ALG_CUP_SM4_MAC_ALG1: Integer read _GetMAC_ALG_CUP_SM4_MAC_ALG1;
    {class} property MAC_ALG_CUP_SM4_MAC_ALG2: Integer read _GetMAC_ALG_CUP_SM4_MAC_ALG2;
    {class} property MAC_ALG_X9_19_DEA: Integer read _GetMAC_ALG_X9_19_DEA;
    {class} property MAC_ALG_FAST_MODE_INTERNATIONAL: Integer read _GetMAC_ALG_FAST_MODE_INTERNATIONAL;
    {class} property MAC_ALG_CBC_INTERNATIONAL: Integer read _GetMAC_ALG_CBC_INTERNATIONAL;
    {class} property SEC_STATUS_MONITOR_ZERO: Integer read _GetSEC_STATUS_MONITOR_ZERO;
    {class} property SEC_STATUS_MONITOR_ONE: Integer read _GetSEC_STATUS_MONITOR_ONE;
    {class} property SEC_STATUS_MONITOR_TWO: Integer read _GetSEC_STATUS_MONITOR_TWO;
    {class} property SEC_STATUS_MONITOR_THREE: Integer read _GetSEC_STATUS_MONITOR_THREE;
    {class} property AUTH_TYPE_DEBUGMODE: Integer read _GetAUTH_TYPE_DEBUGMODE;
    {class} property DEBUGMODE_YES: JString read _GetDEBUGMODE_YES;
    {class} property DEBUGMODE_NO: JString read _GetDEBUGMODE_NO;
    {class} property SEC_CTRL_GETKCV: Integer read _GetSEC_CTRL_GETKCV;
    {class} property SEC_CTRL_DUKPT_ADD_KSN: Integer read _GetSEC_CTRL_DUKPT_ADD_KSN;
    {class} property SEC_CTRL_DUKPT_GET_KSN: Integer read _GetSEC_CTRL_DUKPT_GET_KSN;
    {class} property SEC_CTRL_ERASE_KEY: Integer read _GetSEC_CTRL_ERASE_KEY;
    {class} property SEC_MKSK: Integer read _GetSEC_MKSK;
    {class} property SEC_DUKPT: Integer read _GetSEC_DUKPT;
    {class} property SEC_RSA_KEY: Integer read _GetSEC_RSA_KEY;
    {class} property SEC_SM2_KEY: Integer read _GetSEC_SM2_KEY;
    {class} property SEC_ECC_KEY: Integer read _GetSEC_ECC_KEY;
    {class} property DATA_MODE_ECB: Integer read _GetDATA_MODE_ECB;
    {class} property DATA_MODE_CBC: Integer read _GetDATA_MODE_CBC;
    {class} property DATA_MODE_OFB: Integer read _GetDATA_MODE_OFB;
    {class} property DATA_MODE_CFB: Integer read _GetDATA_MODE_CFB;
    {class} property DUKPT_KEY_SELECT_KEY_PIN: Integer read _GetDUKPT_KEY_SELECT_KEY_PIN;
    {class} property DUKPT_KEY_SELECT_KEY_MAC_BOTH: Integer read _GetDUKPT_KEY_SELECT_KEY_MAC_BOTH;
    {class} property DUKPT_KEY_SELECT_KEY_MAC_RSP: Integer read _GetDUKPT_KEY_SELECT_KEY_MAC_RSP;
    {class} property DUKPT_KEY_SELECT_KEY_DATA_BOTH: Integer read _GetDUKPT_KEY_SELECT_KEY_DATA_BOTH;
    {class} property DUKPT_KEY_SELECT_KEY_DATA_RSP: Integer read _GetDUKPT_KEY_SELECT_KEY_DATA_RSP;
    {class} property DUKPT_KEY_SELECT_KEY_MAC_GEN: Integer read _GetDUKPT_KEY_SELECT_KEY_MAC_GEN;
    {class} property DUKPT_KEY_SELECT_KEY_DATA_ENC: Integer read _GetDUKPT_KEY_SELECT_KEY_DATA_ENC;
    {class} property DUKPT_KEY_SELECT_KEY_KEY_ENC_KEY: Integer read _GetDUKPT_KEY_SELECT_KEY_KEY_ENC_KEY;
    {class} property DUKPT_KEY_SELECT_KEY_DERIVATION: Integer read _GetDUKPT_KEY_SELECT_KEY_DERIVATION;
    {class} property DUKPT_KEY_SELECT_KEY_DERIVATION_INIT: Integer read _GetDUKPT_KEY_SELECT_KEY_DERIVATION_INIT;
    {class} property DUKPT_KEY_TYPE_2TDEA: Integer read _GetDUKPT_KEY_TYPE_2TDEA;
    {class} property DUKPT_KEY_TYPE_3TDEA: Integer read _GetDUKPT_KEY_TYPE_3TDEA;
    {class} property DUKPT_KEY_TYPE_AES128: Integer read _GetDUKPT_KEY_TYPE_AES128;
    {class} property DUKPT_KEY_TYPE_AES192: Integer read _GetDUKPT_KEY_TYPE_AES192;
    {class} property DUKPT_KEY_TYPE_AES256: Integer read _GetDUKPT_KEY_TYPE_AES256;
    {class} property HASH_SHA_TYPE_1: Integer read _GetHASH_SHA_TYPE_1;
    {class} property HASH_SHA_TYPE_224: Integer read _GetHASH_SHA_TYPE_224;
    {class} property HASH_SHA_TYPE_256: Integer read _GetHASH_SHA_TYPE_256;
    {class} property HASH_SHA_TYPE_384: Integer read _GetHASH_SHA_TYPE_384;
    {class} property HASH_SHA_TYPE_512: Integer read _GetHASH_SHA_TYPE_512;
    {class} property HASH_SM3_TYPE: Integer read _GetHASH_SM3_TYPE;
    {class} property RSA_TRANSFORMATION_1: JString read _GetRSA_TRANSFORMATION_1;
    {class} property RSA_TRANSFORMATION_2: JString read _GetRSA_TRANSFORMATION_2;
    {class} property RSA_TRANSFORMATION_3: JString read _GetRSA_TRANSFORMATION_3;
    {class} property RSA_TRANSFORMATION_4: JString read _GetRSA_TRANSFORMATION_4;
    {class} property RSA_TRANSFORMATION_5: JString read _GetRSA_TRANSFORMATION_5;
    {class} property RSA_TRANSFORMATION_6: JString read _GetRSA_TRANSFORMATION_6;
    {class} property RSA_TRANSFORMATION_7: JString read _GetRSA_TRANSFORMATION_7;
    {class} property RSA_SIGN_ALG_1: JString read _GetRSA_SIGN_ALG_1;
    {class} property RSA_SIGN_ALG_2: JString read _GetRSA_SIGN_ALG_2;
    {class} property RSA_SIGN_ALG_3: JString read _GetRSA_SIGN_ALG_3;
    {class} property RSA_SIGN_ALG_4: JString read _GetRSA_SIGN_ALG_4;
    {class} property RSA_SIGN_ALG_5: JString read _GetRSA_SIGN_ALG_5;
    {class} property SEC_ECDH_STEP1_MODE: Integer read _GetSEC_ECDH_STEP1_MODE;
    {class} property SEC_ECDH_STEP2_MODE: Integer read _GetSEC_ECDH_STEP2_MODE;
    {class} property SEC_OAEP_MODE: Integer read _GetSEC_OAEP_MODE;
    {class} property SEC_ECC_PARAM_P256: JString read _GetSEC_ECC_PARAM_P256;
    {class} property SEC_ECC_PARAM_P384: JString read _GetSEC_ECC_PARAM_P384;
    {class} property SEC_ECC_PARAM_P521: JString read _GetSEC_ECC_PARAM_P521;
    {class} property ECC_KEYTYPE_PK: Integer read _GetECC_KEYTYPE_PK;
    {class} property ECC_KEYTYPE_SK: Integer read _GetECC_KEYTYPE_SK;
    {class} property KCV_MODE_NOCHK: Integer read _GetKCV_MODE_NOCHK;
    {class} property KCV_MODE_CHK0: Integer read _GetKCV_MODE_CHK0;
    {class} property KCV_MODE_CHKFIX: Integer read _GetKCV_MODE_CHKFIX;
    {class} property KCV_MODE_CHKMAC: Integer read _GetKCV_MODE_CHKMAC;
    {class} property KCV_MODE_CHKCMAC: Integer read _GetKCV_MODE_CHKCMAC;
    {class} property KEY_CTRL_PANPARA: Integer read _GetKEY_CTRL_PANPARA;
    {class} property KEY_CTRL_AUTHPARA: Integer read _GetKEY_CTRL_AUTHPARA;
    {class} property KEY_CTRL_APACSMAC: Integer read _GetKEY_CTRL_APACSMAC;
    {class} property KEY_VARIANT_XOR: Integer read _GetKEY_VARIANT_XOR;
    {class} property NOTHING_PADDING: Integer read _GetNOTHING_PADDING;
    {class} property PKCS1_PADDING: Integer read _GetPKCS1_PADDING;
    {class} property PKCS7_PADDING: Integer read _GetPKCS7_PADDING;
    {class} property PKCS5_PADDING: Integer read _GetPKCS5_PADDING;
    {class} property PKCS1_OAEP_PADDING: Integer read _GetPKCS1_OAEP_PADDING;
    {class} property PKCS1_V1_5_SHA512: Integer read _GetPKCS1_V1_5_SHA512;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$Security')]
  JAidlConstants_Security = interface(JObject)
  ['{E0227395-91B2-4010-8637-173205658D2E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_Security = class(TJavaGenericImport<JAidlConstants_SecurityClass, JAidlConstants_Security>) end;

  JAidlConstants_SysParamClass = interface(JObjectClass)
  ['{52FE0D3E-E561-41C7-A1F8-B45973BDCA8F}']
    { static Property Methods }
    {class} function _GetBASE_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMSR2_FW_VER: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHARDWARE_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFIRMWARE_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSM_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetETC_FIRM_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBootVersion: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCFG_FILE_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFW_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTUSN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEVICE_CODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEVICE_MODEL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESERVED: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPINPAD_MODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPCD_PARAM_A: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPCD_PARAM_B: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPCD_PARAM_C: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPUSH_CFG_FILE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUPPORT_ETC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTUSN_KEY_KCV: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_MODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPCD_IFM_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKB_BEEP_MODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSAM_COUNT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSM_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAYPASS_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAYWAVE_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQPBOC_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENTRY_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIR_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJCB_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAGO_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPURE_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAE_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFLASH_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDPAS_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAPEMV_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEFTPOS_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMVBASE_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKD_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRUPAY_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_KERNEL_CHECKSUM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPURE_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEFTPOS_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAYPASS_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAYWAVE_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQPBOC_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENTRY_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIR_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJCB_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAGO_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAE_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFLASH_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDPAS_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMVBASE_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKD_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRUPAY_RELEASE_DATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAMPER_LOG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLEAR_TAMPER_LOG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTERM_STATUS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLEAR_TAMPER: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEBUG_MODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_MASK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_SysParam; cdecl;

    { static Property }
    {class} property BASE_VERSION: JString read _GetBASE_VERSION;
    {class} property MSR2_FW_VER: JString read _GetMSR2_FW_VER;
    {class} property HARDWARE_VERSION: JString read _GetHARDWARE_VERSION;
    {class} property FIRMWARE_VERSION: JString read _GetFIRMWARE_VERSION;
    {class} property SM_VERSION: JString read _GetSM_VERSION;
    {class} property ETC_FIRM_VERSION: JString read _GetETC_FIRM_VERSION;
    {class} property BootVersion: JString read _GetBootVersion;
    {class} property CFG_FILE_VERSION: JString read _GetCFG_FILE_VERSION;
    {class} property FW_VERSION: JString read _GetFW_VERSION;
    {class} property SN: JString read _GetSN;
    {class} property PN: JString read _GetPN;
    {class} property TUSN: JString read _GetTUSN;
    {class} property DEVICE_CODE: JString read _GetDEVICE_CODE;
    {class} property DEVICE_MODEL: JString read _GetDEVICE_MODEL;
    {class} property RESERVED: JString read _GetRESERVED;
    {class} property PINPAD_MODE: JString read _GetPINPAD_MODE;
    {class} property PCD_PARAM_A: JString read _GetPCD_PARAM_A;
    {class} property PCD_PARAM_B: JString read _GetPCD_PARAM_B;
    {class} property PCD_PARAM_C: JString read _GetPCD_PARAM_C;
    {class} property PUSH_CFG_FILE: JString read _GetPUSH_CFG_FILE;
    {class} property SUPPORT_ETC: JString read _GetSUPPORT_ETC;
    {class} property TUSN_KEY_KCV: JString read _GetTUSN_KEY_KCV;
    {class} property SEC_MODE: JString read _GetSEC_MODE;
    {class} property PCD_IFM_VERSION: JString read _GetPCD_IFM_VERSION;
    {class} property KB_BEEP_MODE: JString read _GetKB_BEEP_MODE;
    {class} property SAM_COUNT: JString read _GetSAM_COUNT;
    {class} property SM_TYPE: JString read _GetSM_TYPE;
    {class} property EMV_VERSION: JString read _GetEMV_VERSION;
    {class} property PAYPASS_VERSION: JString read _GetPAYPASS_VERSION;
    {class} property PAYWAVE_VERSION: JString read _GetPAYWAVE_VERSION;
    {class} property QPBOC_VERSION: JString read _GetQPBOC_VERSION;
    {class} property ENTRY_VERSION: JString read _GetENTRY_VERSION;
    {class} property MIR_VERSION: JString read _GetMIR_VERSION;
    {class} property JCB_VERSION: JString read _GetJCB_VERSION;
    {class} property PAGO_VERSION: JString read _GetPAGO_VERSION;
    {class} property PURE_VERSION: JString read _GetPURE_VERSION;
    {class} property AE_VERSION: JString read _GetAE_VERSION;
    {class} property FLASH_VERSION: JString read _GetFLASH_VERSION;
    {class} property DPAS_VERSION: JString read _GetDPAS_VERSION;
    {class} property APEMV_VERSION: JString read _GetAPEMV_VERSION;
    {class} property EFTPOS_VERSION: JString read _GetEFTPOS_VERSION;
    {class} property EMVBASE_VERSION: JString read _GetEMVBASE_VERSION;
    {class} property KD_VERSION: JString read _GetKD_VERSION;
    {class} property RUPAY_VERSION: JString read _GetRUPAY_VERSION;
    {class} property EMV_KERNEL_CHECKSUM: JString read _GetEMV_KERNEL_CHECKSUM;
    {class} property PURE_RELEASE_DATE: JString read _GetPURE_RELEASE_DATE;
    {class} property EFTPOS_RELEASE_DATE: JString read _GetEFTPOS_RELEASE_DATE;
    {class} property EMV_RELEASE_DATE: JString read _GetEMV_RELEASE_DATE;
    {class} property PAYPASS_RELEASE_DATE: JString read _GetPAYPASS_RELEASE_DATE;
    {class} property PAYWAVE_RELEASE_DATE: JString read _GetPAYWAVE_RELEASE_DATE;
    {class} property QPBOC_RELEASE_DATE: JString read _GetQPBOC_RELEASE_DATE;
    {class} property ENTRY_RELEASE_DATE: JString read _GetENTRY_RELEASE_DATE;
    {class} property MIR_RELEASE_DATE: JString read _GetMIR_RELEASE_DATE;
    {class} property JCB_RELEASE_DATE: JString read _GetJCB_RELEASE_DATE;
    {class} property PAGO_RELEASE_DATE: JString read _GetPAGO_RELEASE_DATE;
    {class} property AE_RELEASE_DATE: JString read _GetAE_RELEASE_DATE;
    {class} property FLASH_RELEASE_DATE: JString read _GetFLASH_RELEASE_DATE;
    {class} property DPAS_RELEASE_DATE: JString read _GetDPAS_RELEASE_DATE;
    {class} property EMVBASE_RELEASE_DATE: JString read _GetEMVBASE_RELEASE_DATE;
    {class} property KD_RELEASE_DATE: JString read _GetKD_RELEASE_DATE;
    {class} property RUPAY_RELEASE_DATE: JString read _GetRUPAY_RELEASE_DATE;
    {class} property TAMPER_LOG: JString read _GetTAMPER_LOG;
    {class} property CLEAR_TAMPER_LOG: JString read _GetCLEAR_TAMPER_LOG;
    {class} property TERM_STATUS: JString read _GetTERM_STATUS;
    {class} property CLEAR_TAMPER: JString read _GetCLEAR_TAMPER;
    {class} property DEBUG_MODE: JString read _GetDEBUG_MODE;
    {class} property EMV_MASK: JString read _GetEMV_MASK;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$SysParam')]
  JAidlConstants_SysParam = interface(JObject)
  ['{E767554D-A328-4AE3-AC9D-97E02085B1C4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_SysParam = class(TJavaGenericImport<JAidlConstants_SysParamClass, JAidlConstants_SysParam>) end;

  JAidlConstants_SystemUIClass = interface(JObjectClass)
  ['{81652B40-8BB9-495A-AE73-A88CD1AEA3EA}']
    { static Property Methods }
    {class} function _GetSET_SCREEN_MONOPOLY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLEAR_SCREEN_MONOPOLY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDISABLE_STATUS_BAR_DROP_DOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENABLE_STATUS_BAR_DROP_DOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHIDE_NAV_BAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSHOW_NAV_BAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHIDE_NAV_ITEM_BACK_KEY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHIDE_NAV_ITEM_HOME_KEY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHIDE_NAV_ITEM_RECENT_KEY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidlConstants_SystemUI; cdecl;

    { static Property }
    {class} property SET_SCREEN_MONOPOLY: Integer read _GetSET_SCREEN_MONOPOLY;
    {class} property CLEAR_SCREEN_MONOPOLY: Integer read _GetCLEAR_SCREEN_MONOPOLY;
    {class} property DISABLE_STATUS_BAR_DROP_DOWN: Integer read _GetDISABLE_STATUS_BAR_DROP_DOWN;
    {class} property ENABLE_STATUS_BAR_DROP_DOWN: Integer read _GetENABLE_STATUS_BAR_DROP_DOWN;
    {class} property HIDE_NAV_BAR: Integer read _GetHIDE_NAV_BAR;
    {class} property SHOW_NAV_BAR: Integer read _GetSHOW_NAV_BAR;
    {class} property HIDE_NAV_ITEM_BACK_KEY: Integer read _GetHIDE_NAV_ITEM_BACK_KEY;
    {class} property HIDE_NAV_ITEM_HOME_KEY: Integer read _GetHIDE_NAV_ITEM_HOME_KEY;
    {class} property HIDE_NAV_ITEM_RECENT_KEY: Integer read _GetHIDE_NAV_ITEM_RECENT_KEY;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants$SystemUI')]
  JAidlConstants_SystemUI = interface(JObject)
  ['{3E728797-CA35-4FB9-B156-9E975378E247}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_SystemUI = class(TJavaGenericImport<JAidlConstants_SystemUIClass, JAidlConstants_SystemUI>) end;

  JAidlConstantsClass = interface(JObjectClass)
  ['{C37FC41D-3506-4C21-B169-B60EE64B8E90}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAidlConstants; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlConstants')]
  JAidlConstants = interface(JObject)
  ['{A71E6819-5257-4909-87B0-95FD16643B90}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants = class(TJavaGenericImport<JAidlConstantsClass, JAidlConstants>) end;

  JAidlErrorCodeClass = interface(JEnumClass) // or JObjectClass
  ['{7CB2BCA9-3DEE-4232-828B-725520DA3F24}']
    { static Property Methods }
    {class} function _GetUNKNOWN: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSPBASE_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINVOKING_REPEAT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINVOKING_WAIT_UPDATE: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINVOKING_ERROR_PARAMS: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINVOKING_THREAD_EXCEPTION: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINVOKING_PUBLIC_KEY_LEN_NOT_MATCH: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFIRMWARE_UPDATE_FAIL: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFIRMWARE_VERIFY_FAIL: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_FAIL: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_UNKNOWN_TYPE: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_FAIL_NFC: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_FAIL_IC: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_TIMEOUT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_TRACK1: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_TRACK2: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_TRACK3: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_TRACK1_2_3: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_TRACK1_2: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_TRACK1_3: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_TRACK2_3: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_FALLBACK: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_BUILD_APP_TIMEOUT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_EXCHANGE: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_CARD_EXCHANGE_PARAMETER: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_VERIFY_APK_SIGN: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_LENGTH: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_CHECK_VALUE: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_SAVE_FAIL: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_MAC: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_ENCRYPT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_BAD_ARRAY_LENGTH: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_MAC_TYPE: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_CHECKVALUE_LENGTH: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_KEY_INDEX: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_DECRYPT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_KEY_LENGTH: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGEN_RANDOM_KEY_FAIL: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_INDEX_NO_KEY: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_SAVE_PK_FAIL: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERIFY_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_SMSTATUS_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_KEY_PARTITION_EXHAUSTED: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_INJECT_BDK: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_UNSUPPORTED_TRANSFORMATION: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PREPARE_FAIL: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_TRANS_PROCESS_FAIL: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_KERNEL_EXCEPTION: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PAN_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PINPAD_CALLBACK_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_KERNEL_MSG_NULL: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_KEYBOARD_PARAMS_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_IN_PROCESS: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_TRANS_TYPE_UNSUPPORT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_CONFIRM_CARD_INFO_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_NFC_CVM_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_DB_OPT_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_DB_NO_MATCHED_CAPK: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_DB_SAVE_TERM_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_DB_NO_MATCHED_AID: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_CARDINFO_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_TIMING_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_TRANSDATA_INVALID: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PIN_CANCELED: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PIN_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_APP_SELECT_INDEX_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_CERT_VERIFY_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_ONLINE_PROCESS_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_FINAL_SELECT_TIMEOUT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_FINAL_SELECT_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_SIGNATURE_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_UNKNOWN_CVM_TYPE: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_DATA_EXCHANGE_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_DATA_EXCHANGE_TIMEOUT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_TERMINAL_RISK_MANAGEMENT_TIMEOUT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_TERMINAL_RISK_MANAGEMENT_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PRE_FIRST_GAC_TIMEOUT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PRE_FIRST_GAC_ERROR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_INPUT_TIMEOUT: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_START_PINPAD: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PINPAD_TYPE: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_RETURN_PINBLOCK: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_INTERRUPTED: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PERMISSION_READ_MSR: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PERMISSION_READ_ICC: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PERMISSION_READ_CONTACTLESS: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PERMISSION_PINPAD: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PERMISSION_SECURITY: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PERMISSION_LED: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINTER_PINPAD_ONGOING: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_ETC_NO_DEVICE_SEARCHED: JAidlErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JAidlErrorCode>; cdecl;
    {class} function valueOf(name: JString): JAidlErrorCode; cdecl; overload;
    {class} function valueOf(errCode: Integer): JAidlErrorCode; cdecl; overload;

    { static Property }
    {class} property UNKNOWN: JAidlErrorCode read _GetUNKNOWN;
    {class} property SPBASE_ERROR: JAidlErrorCode read _GetSPBASE_ERROR;
    {class} property INVOKING_REPEAT: JAidlErrorCode read _GetINVOKING_REPEAT;
    {class} property INVOKING_WAIT_UPDATE: JAidlErrorCode read _GetINVOKING_WAIT_UPDATE;
    {class} property INVOKING_ERROR_PARAMS: JAidlErrorCode read _GetINVOKING_ERROR_PARAMS;
    {class} property INVOKING_THREAD_EXCEPTION: JAidlErrorCode read _GetINVOKING_THREAD_EXCEPTION;
    {class} property INVOKING_PUBLIC_KEY_LEN_NOT_MATCH: JAidlErrorCode read _GetINVOKING_PUBLIC_KEY_LEN_NOT_MATCH;
    {class} property FIRMWARE_UPDATE_FAIL: JAidlErrorCode read _GetFIRMWARE_UPDATE_FAIL;
    {class} property FIRMWARE_VERIFY_FAIL: JAidlErrorCode read _GetFIRMWARE_VERIFY_FAIL;
    {class} property READ_CARD_FAIL: JAidlErrorCode read _GetREAD_CARD_FAIL;
    {class} property READ_CARD_UNKNOWN_TYPE: JAidlErrorCode read _GetREAD_CARD_UNKNOWN_TYPE;
    {class} property READ_CARD_FAIL_NFC: JAidlErrorCode read _GetREAD_CARD_FAIL_NFC;
    {class} property READ_CARD_FAIL_IC: JAidlErrorCode read _GetREAD_CARD_FAIL_IC;
    {class} property READ_CARD_TIMEOUT: JAidlErrorCode read _GetREAD_CARD_TIMEOUT;
    {class} property READ_CARD_TRACK1: JAidlErrorCode read _GetREAD_CARD_TRACK1;
    {class} property READ_CARD_TRACK2: JAidlErrorCode read _GetREAD_CARD_TRACK2;
    {class} property READ_CARD_TRACK3: JAidlErrorCode read _GetREAD_CARD_TRACK3;
    {class} property READ_CARD_TRACK1_2_3: JAidlErrorCode read _GetREAD_CARD_TRACK1_2_3;
    {class} property READ_CARD_TRACK1_2: JAidlErrorCode read _GetREAD_CARD_TRACK1_2;
    {class} property READ_CARD_TRACK1_3: JAidlErrorCode read _GetREAD_CARD_TRACK1_3;
    {class} property READ_CARD_TRACK2_3: JAidlErrorCode read _GetREAD_CARD_TRACK2_3;
    {class} property READ_CARD_FALLBACK: JAidlErrorCode read _GetREAD_CARD_FALLBACK;
    {class} property READ_CARD_BUILD_APP_TIMEOUT: JAidlErrorCode read _GetREAD_CARD_BUILD_APP_TIMEOUT;
    {class} property READ_CARD_EXCHANGE: JAidlErrorCode read _GetREAD_CARD_EXCHANGE;
    {class} property READ_CARD_EXCHANGE_PARAMETER: JAidlErrorCode read _GetREAD_CARD_EXCHANGE_PARAMETER;
    {class} property ERROR_VERIFY_APK_SIGN: JAidlErrorCode read _GetERROR_VERIFY_APK_SIGN;
    {class} property ERROR_LENGTH: JAidlErrorCode read _GetERROR_LENGTH;
    {class} property ERROR_CHECK_VALUE: JAidlErrorCode read _GetERROR_CHECK_VALUE;
    {class} property ERROR_SAVE_FAIL: JAidlErrorCode read _GetERROR_SAVE_FAIL;
    {class} property ERROR_MAC: JAidlErrorCode read _GetERROR_MAC;
    {class} property ERROR_ENCRYPT: JAidlErrorCode read _GetERROR_ENCRYPT;
    {class} property ERROR_BAD_ARRAY_LENGTH: JAidlErrorCode read _GetERROR_BAD_ARRAY_LENGTH;
    {class} property ERROR_MAC_TYPE: JAidlErrorCode read _GetERROR_MAC_TYPE;
    {class} property ERROR_CHECKVALUE_LENGTH: JAidlErrorCode read _GetERROR_CHECKVALUE_LENGTH;
    {class} property ERROR_KEY_INDEX: JAidlErrorCode read _GetERROR_KEY_INDEX;
    {class} property ERROR_DECRYPT: JAidlErrorCode read _GetERROR_DECRYPT;
    {class} property ERROR_KEY_LENGTH: JAidlErrorCode read _GetERROR_KEY_LENGTH;
    {class} property GEN_RANDOM_KEY_FAIL: JAidlErrorCode read _GetGEN_RANDOM_KEY_FAIL;
    {class} property ERROR_INDEX_NO_KEY: JAidlErrorCode read _GetERROR_INDEX_NO_KEY;
    {class} property ERROR_SAVE_PK_FAIL: JAidlErrorCode read _GetERROR_SAVE_PK_FAIL;
    {class} property VERIFY_ERROR: JAidlErrorCode read _GetVERIFY_ERROR;
    {class} property GET_SMSTATUS_ERROR: JAidlErrorCode read _GetGET_SMSTATUS_ERROR;
    {class} property ERROR_KEY_PARTITION_EXHAUSTED: JAidlErrorCode read _GetERROR_KEY_PARTITION_EXHAUSTED;
    {class} property ERROR_INJECT_BDK: JAidlErrorCode read _GetERROR_INJECT_BDK;
    {class} property ERROR_UNSUPPORTED_TRANSFORMATION: JAidlErrorCode read _GetERROR_UNSUPPORTED_TRANSFORMATION;
    {class} property EMV_PREPARE_FAIL: JAidlErrorCode read _GetEMV_PREPARE_FAIL;
    {class} property EMV_TRANS_PROCESS_FAIL: JAidlErrorCode read _GetEMV_TRANS_PROCESS_FAIL;
    {class} property EMV_KERNEL_EXCEPTION: JAidlErrorCode read _GetEMV_KERNEL_EXCEPTION;
    {class} property EMV_PAN_ERROR: JAidlErrorCode read _GetEMV_PAN_ERROR;
    {class} property EMV_PINPAD_CALLBACK_ERROR: JAidlErrorCode read _GetEMV_PINPAD_CALLBACK_ERROR;
    {class} property EMV_KERNEL_MSG_NULL: JAidlErrorCode read _GetEMV_KERNEL_MSG_NULL;
    {class} property EMV_KEYBOARD_PARAMS_ERROR: JAidlErrorCode read _GetEMV_KEYBOARD_PARAMS_ERROR;
    {class} property EMV_IN_PROCESS: JAidlErrorCode read _GetEMV_IN_PROCESS;
    {class} property EMV_TRANS_TYPE_UNSUPPORT: JAidlErrorCode read _GetEMV_TRANS_TYPE_UNSUPPORT;
    {class} property EMV_CONFIRM_CARD_INFO_ERROR: JAidlErrorCode read _GetEMV_CONFIRM_CARD_INFO_ERROR;
    {class} property EMV_NFC_CVM_ERROR: JAidlErrorCode read _GetEMV_NFC_CVM_ERROR;
    {class} property EMV_DB_OPT_ERROR: JAidlErrorCode read _GetEMV_DB_OPT_ERROR;
    {class} property EMV_DB_NO_MATCHED_CAPK: JAidlErrorCode read _GetEMV_DB_NO_MATCHED_CAPK;
    {class} property EMV_DB_SAVE_TERM_ERROR: JAidlErrorCode read _GetEMV_DB_SAVE_TERM_ERROR;
    {class} property EMV_DB_NO_MATCHED_AID: JAidlErrorCode read _GetEMV_DB_NO_MATCHED_AID;
    {class} property EMV_CARDINFO_ERROR: JAidlErrorCode read _GetEMV_CARDINFO_ERROR;
    {class} property EMV_TIMING_ERROR: JAidlErrorCode read _GetEMV_TIMING_ERROR;
    {class} property EMV_TRANSDATA_INVALID: JAidlErrorCode read _GetEMV_TRANSDATA_INVALID;
    {class} property EMV_PIN_CANCELED: JAidlErrorCode read _GetEMV_PIN_CANCELED;
    {class} property EMV_PIN_ERROR: JAidlErrorCode read _GetEMV_PIN_ERROR;
    {class} property EMV_APP_SELECT_INDEX_ERROR: JAidlErrorCode read _GetEMV_APP_SELECT_INDEX_ERROR;
    {class} property EMV_CERT_VERIFY_ERROR: JAidlErrorCode read _GetEMV_CERT_VERIFY_ERROR;
    {class} property EMV_ONLINE_PROCESS_ERROR: JAidlErrorCode read _GetEMV_ONLINE_PROCESS_ERROR;
    {class} property EMV_FINAL_SELECT_TIMEOUT: JAidlErrorCode read _GetEMV_FINAL_SELECT_TIMEOUT;
    {class} property EMV_FINAL_SELECT_ERROR: JAidlErrorCode read _GetEMV_FINAL_SELECT_ERROR;
    {class} property EMV_SIGNATURE_ERROR: JAidlErrorCode read _GetEMV_SIGNATURE_ERROR;
    {class} property EMV_UNKNOWN_CVM_TYPE: JAidlErrorCode read _GetEMV_UNKNOWN_CVM_TYPE;
    {class} property EMV_DATA_EXCHANGE_ERROR: JAidlErrorCode read _GetEMV_DATA_EXCHANGE_ERROR;
    {class} property EMV_DATA_EXCHANGE_TIMEOUT: JAidlErrorCode read _GetEMV_DATA_EXCHANGE_TIMEOUT;
    {class} property EMV_TERMINAL_RISK_MANAGEMENT_TIMEOUT: JAidlErrorCode read _GetEMV_TERMINAL_RISK_MANAGEMENT_TIMEOUT;
    {class} property EMV_TERMINAL_RISK_MANAGEMENT_ERROR: JAidlErrorCode read _GetEMV_TERMINAL_RISK_MANAGEMENT_ERROR;
    {class} property EMV_PRE_FIRST_GAC_TIMEOUT: JAidlErrorCode read _GetEMV_PRE_FIRST_GAC_TIMEOUT;
    {class} property EMV_PRE_FIRST_GAC_ERROR: JAidlErrorCode read _GetEMV_PRE_FIRST_GAC_ERROR;
    {class} property ERROR_INPUT_TIMEOUT: JAidlErrorCode read _GetERROR_INPUT_TIMEOUT;
    {class} property ERROR_START_PINPAD: JAidlErrorCode read _GetERROR_START_PINPAD;
    {class} property ERROR_PINPAD_TYPE: JAidlErrorCode read _GetERROR_PINPAD_TYPE;
    {class} property ERROR_RETURN_PINBLOCK: JAidlErrorCode read _GetERROR_RETURN_PINBLOCK;
    {class} property ERROR_INTERRUPTED: JAidlErrorCode read _GetERROR_INTERRUPTED;
    {class} property ERROR_PERMISSION_READ_MSR: JAidlErrorCode read _GetERROR_PERMISSION_READ_MSR;
    {class} property ERROR_PERMISSION_READ_ICC: JAidlErrorCode read _GetERROR_PERMISSION_READ_ICC;
    {class} property ERROR_PERMISSION_READ_CONTACTLESS: JAidlErrorCode read _GetERROR_PERMISSION_READ_CONTACTLESS;
    {class} property ERROR_PERMISSION_PINPAD: JAidlErrorCode read _GetERROR_PERMISSION_PINPAD;
    {class} property ERROR_PERMISSION_SECURITY: JAidlErrorCode read _GetERROR_PERMISSION_SECURITY;
    {class} property ERROR_PERMISSION_LED: JAidlErrorCode read _GetERROR_PERMISSION_LED;
    {class} property ERROR_PRINTER_PINPAD_ONGOING: JAidlErrorCode read _GetERROR_PRINTER_PINPAD_ONGOING;
    {class} property ERROR_ETC_NO_DEVICE_SEARCHED: JAidlErrorCode read _GetERROR_ETC_NO_DEVICE_SEARCHED;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/AidlErrorCode')]
  JAidlErrorCode = interface(JEnum) // or JObject
  ['{3FABF31E-55D0-41AE-BA97-2967B944E0D9}']
    { Property Methods }

    { methods }
    function getCode: Integer; cdecl;
    function getMsg: JString; cdecl;
    procedure setCode(code: Integer); cdecl;
    procedure setMsg(msg: JString); cdecl;

    { Property }
  end;

  TJAidlErrorCode = class(TJavaGenericImport<JAidlErrorCodeClass, JAidlErrorCode>) end;

//  JCardInfo_1Class = interface(JObjectClass)
//  ['{A8EBD757-116F-4841-A53A-51CED3FBC238}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidl/bean/CardInfo$1')]
//  JCardInfo_1 = interface(JObject)
//  ['{E5BA24E7-942A-4C40-98F0-41B85B5FCF34}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(ain: JParcel): JCardInfo; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JCardInfo>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJCardInfo_1 = class(TJavaGenericImport<JCardInfo_1Class, JCardInfo_1>) end;

  JCardInfoClass = interface(JObjectClass)
  ['{5AAB93A5-0CB2-4032-8552-78294A30BE46}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCardInfo; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/bean/CardInfo')]
  JCardInfo = interface(JObject)
  ['{2DE1106A-75A6-4C16-AC54-CE8E2AD6F77E}']
    { Property Methods }
    function _GetcardType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcardType(acardType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcardNo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcardNo(acardNo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettrack1: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settrack1(atrack1: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettrack2: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settrack2(atrack2: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettrack3: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settrack3(atrack3: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetexpireDate: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetexpireDate(aexpireDate: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetserviceCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetserviceCode(aserviceCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcountryCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcountryCode(acountryCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisCardSerialNo: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisCardSerialNo(aisCardSerialNo: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcardSerialNo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcardSerialNo(acardSerialNo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getuuid: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setuuid(auuid: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getatr: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setatr(aatr: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    procedure readFromParcel(ain: JParcel); cdecl;
    function toString: JString; cdecl;

    { Property }
    property cardType: Integer read _GetcardType write _SetcardType;
    property cardNo: JString read _GetcardNo write _SetcardNo;
    property track1: JString read _Gettrack1 write _Settrack1;
    property track2: JString read _Gettrack2 write _Settrack2;
    property track3: JString read _Gettrack3 write _Settrack3;
    property expireDate: JString read _GetexpireDate write _SetexpireDate;
    property serviceCode: JString read _GetserviceCode write _SetserviceCode;
    property countryCode: JString read _GetcountryCode write _SetcountryCode;
    property isCardSerialNo: Boolean read _GetisCardSerialNo write _SetisCardSerialNo;
    property cardSerialNo: JString read _GetcardSerialNo write _SetcardSerialNo;
    property uuid: JString read _Getuuid write _Setuuid;
    property atr: JString read _Getatr write _Setatr;
  end;

  TJCardInfo = class(TJavaGenericImport<JCardInfoClass, JCardInfo>) end;

//  JEmvTermParam_1Class = interface(JObjectClass)
//  ['{D195FA87-8EF5-4EC0-A767-455FA59DFBDA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidl/bean/EmvTermParam$1')]
//  JEmvTermParam_1 = interface(JObject)
//  ['{8D69B22C-DDFC-4478-A907-02C6FB407C28}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(ain: JParcel): JEmvTermParam; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JEmvTermParam>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJEmvTermParam_1 = class(TJavaGenericImport<JEmvTermParam_1Class, JEmvTermParam_1>) end;

  JEmvTermParamClass = interface(JObjectClass)
  ['{C559AF84-14D9-4DA0-B3CC-62A7533B6A60}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JEmvTermParam; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/bean/EmvTermParam')]
  JEmvTermParam = interface(JObject)
  ['{91D0596C-1B7C-4EEE-A111-FE560A975269}']
    { Property Methods }
    function _Gettag9F1E: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settag9F1E(atag9F1E: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettag9F35: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settag9F35(atag9F35: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettag9F1A: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settag9F1A(atag9F1A: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetforceOnline: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetforceOnline(aforceOnline: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetgetDataPIN: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetgetDataPIN(agetDataPIN: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsurportPSESel: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsurportPSESel(asurportPSESel: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetuseTermAIPFlg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetuseTermAIPFlg(auseTermAIPFlg: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermAIP: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermAIP(atermAIP: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbypassAllFlg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbypassAllFlg(abypassAllFlg: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbypassPin: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbypassPin(abypassPin: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbatchCapture: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbatchCapture(abatchCapture: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetectSiFlg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetectSiFlg(aectSiFlg: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetectSiVal: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetectSiVal(aectSiVal: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetectTlFlg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetectTlFlg(aectTlFlg: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetectTlVal: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetectTlVal(aectTlVal: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettag9F33: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settag9F33(atag9F33: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettag9F40: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settag9F40(atag9F40: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetscriptMode: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetscriptMode(ascriptMode: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetadviceFlag: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetadviceFlag(aadviceFlag: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisSupportSM: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisSupportSM(aisSupportSM: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisSupportTransLog: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisSupportTransLog(aisSupportTransLog: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisSupportMultiLang: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisSupportMultiLang(aisSupportMultiLang: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisSupportExceptFile: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisSupportExceptFile(aisSupportExceptFile: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisSupportAccountSelect: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisSupportAccountSelect(aisSupportAccountSelect: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetTTQ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTTQ(aTTQ: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetIsReadLogInCard: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetIsReadLogInCard(aIsReadLogInCard: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcurrencyCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcurrencyCode(acurrencyCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcurrencyExp: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcurrencyExp(acurrencyExp: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetaccountType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaccountType(aaccountType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function toString: JString; cdecl;

    { Property }
    property tag9F1E: JString read _Gettag9F1E write _Settag9F1E;
    property tag9F35: JString read _Gettag9F35 write _Settag9F35;
    property tag9F1A: JString read _Gettag9F1A write _Settag9F1A;
    property forceOnline: Boolean read _GetforceOnline write _SetforceOnline;
    property getDataPIN: Boolean read _GetgetDataPIN write _SetgetDataPIN;
    property surportPSESel: Boolean read _GetsurportPSESel write _SetsurportPSESel;
    property useTermAIPFlg: Boolean read _GetuseTermAIPFlg write _SetuseTermAIPFlg;
    property termAIP: Boolean read _GettermAIP write _SettermAIP;
    property bypassAllFlg: Boolean read _GetbypassAllFlg write _SetbypassAllFlg;
    property bypassPin: Boolean read _GetbypassPin write _SetbypassPin;
    property batchCapture: Boolean read _GetbatchCapture write _SetbatchCapture;
    property ectSiFlg: Boolean read _GetectSiFlg write _SetectSiFlg;
    property ectSiVal: Boolean read _GetectSiVal write _SetectSiVal;
    property ectTlFlg: Boolean read _GetectTlFlg write _SetectTlFlg;
    property ectTlVal: JString read _GetectTlVal write _SetectTlVal;
    property tag9F33: JString read _Gettag9F33 write _Settag9F33;
    property tag9F40: JString read _Gettag9F40 write _Settag9F40;
    property scriptMode: Boolean read _GetscriptMode write _SetscriptMode;
    property adviceFlag: Boolean read _GetadviceFlag write _SetadviceFlag;
    property isSupportSM: Boolean read _GetisSupportSM write _SetisSupportSM;
    property isSupportTransLog: Boolean read _GetisSupportTransLog write _SetisSupportTransLog;
    property isSupportMultiLang: Boolean read _GetisSupportMultiLang write _SetisSupportMultiLang;
    property isSupportExceptFile: Boolean read _GetisSupportExceptFile write _SetisSupportExceptFile;
    property isSupportAccountSelect: Boolean read _GetisSupportAccountSelect write _SetisSupportAccountSelect;
    property TTQ: JString read _GetTTQ write _SetTTQ;
    property IsReadLogInCard: Boolean read _GetIsReadLogInCard write _SetIsReadLogInCard;
    property currencyCode: JString read _GetcurrencyCode write _SetcurrencyCode;
    property currencyExp: JString read _GetcurrencyExp write _SetcurrencyExp;
    property accountType: JString read _GetaccountType write _SetaccountType;
  end;

  TJEmvTermParam = class(TJavaGenericImport<JEmvTermParamClass, JEmvTermParam>) end;

//  JPinPadConfig_1Class = interface(JObjectClass)
//  ['{AAB943DA-6A13-487D-9DEC-968BC1F29676}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidl/bean/PinPadConfig$1')]
//  JPinPadConfig_1 = interface(JObject)
//  ['{73CD0ABE-275E-42A8-9ACC-4C7E4AE89DC4}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(ain: JParcel): JPinPadConfig; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JPinPadConfig>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJPinPadConfig_1 = class(TJavaGenericImport<JPinPadConfig_1Class, JPinPadConfig_1>) end;

  JPinPadConfigClass = interface(JObjectClass)
  ['{DA8D6A58-EC45-4E34-A9F5-B08C47E0075D}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPinPadConfig; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/bean/PinPadConfig')]
  JPinPadConfig = interface(JObject)
  ['{421914D8-2C08-4889-AE18-7E26B4BEBD9C}']
    { Property Methods }

    { methods }
    function getPinPadType: Integer; cdecl;
    procedure setPinPadType(pinPadType: Integer); cdecl;
    function getPinType: Integer; cdecl;
    procedure setPinType(pinType: Integer); cdecl;
    function isOrderNumKey: Boolean; cdecl;
    procedure setOrderNumKey(orderNumKey: Boolean); cdecl;
    function getPan: TJavaArray<Byte>; cdecl;
    procedure setPan(pan: TJavaArray<Byte>); cdecl;
    function getPinKeyIndex: Integer; cdecl;
    procedure setPinKeyIndex(pinKeyIndex: Integer); cdecl;
    function getMaxInput: Integer; cdecl;
    procedure setMaxInput(maxInput: Integer); cdecl;
    function getMinInput: Integer; cdecl;
    procedure setMinInput(minInput: Integer); cdecl;
    function getTimeout: Integer; cdecl;
    procedure setTimeout(timeout: Integer); cdecl;
    procedure readFromParcel(ain: JParcel); cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;

    { Property }
  end;

  TJPinPadConfig = class(TJavaGenericImport<JPinPadConfigClass, JPinPadConfig>) end;

//  JPinPadData_1Class = interface(JObjectClass)
//  ['{B8B44D65-1652-4145-9749-6F08C1545C31}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidl/bean/PinPadData$1')]
//  JPinPadData_1 = interface(JObject)
//  ['{574C899B-DB1E-4697-BACD-272466FED923}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(ain: JParcel): JPinPadData; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JPinPadData>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJPinPadData_1 = class(TJavaGenericImport<JPinPadData_1Class, JPinPadData_1>) end;

  JPinPadDataClass = interface(JObjectClass)
  ['{9CB94C26-D187-417B-84BA-6A64E85394DA}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPinPadData; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/bean/PinPadData')]
  JPinPadData = interface(JObject)
  ['{2AC23315-1712-4627-A94D-14EBC46C704D}']
    { Property Methods }
    function _GetnumX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnumX(anumX: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnumY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnumY(anumY: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnumH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnumH(anumH: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnumW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnumW(anumW: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlineW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlineW(alineW: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcancelX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcancelX(acancelX: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcancelY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcancelY(acancelY: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcancelH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcancelH(acancelH: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcancelW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcancelW(acancelW: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getrows: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setrows(arows: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getclos: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setclos(aclos: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetkeyMap: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetkeyMap(akeyMap: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getNumX: Integer; cdecl;
    procedure setNumX(numX: Integer); cdecl;
    function getNumY: Integer; cdecl;
    procedure setNumY(numY: Integer); cdecl;
    function getNumH: Integer; cdecl;
    procedure setNumH(numH: Integer); cdecl;
    function getNumW: Integer; cdecl;
    procedure setNumW(numW: Integer); cdecl;
    function getLineW: Integer; cdecl;
    procedure setLineW(lineW: Integer); cdecl;
    function getCancelX: Integer; cdecl;
    procedure setCancelX(cancelX: Integer); cdecl;
    function getCancelY: Integer; cdecl;
    procedure setCancelY(cancelY: Integer); cdecl;
    function getCancelH: Integer; cdecl;
    procedure setCancelH(cancelH: Integer); cdecl;
    function getCancelW: Integer; cdecl;
    procedure setCancelW(cancelW: Integer); cdecl;
    function getRows: Integer; cdecl;
    procedure setRows(rows: Integer); cdecl;
    function getClos: Integer; cdecl;
    procedure setClos(clos: Integer); cdecl;
    function getKeyMap: TJavaArray<Byte>; cdecl;
    procedure setKeyMap(keyMap: TJavaArray<Byte>); cdecl;
    function check: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure readFromParcel(ain: JParcel); cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;

    { Property }
    property numX: Integer read _GetnumX write _SetnumX;
    property numY: Integer read _GetnumY write _SetnumY;
    property numH: Integer read _GetnumH write _SetnumH;
    property numW: Integer read _GetnumW write _SetnumW;
    property lineW: Integer read _GetlineW write _SetlineW;
    property cancelX: Integer read _GetcancelX write _SetcancelX;
    property cancelY: Integer read _GetcancelY write _SetcancelY;
    property cancelH: Integer read _GetcancelH write _SetcancelH;
    property cancelW: Integer read _GetcancelW write _SetcancelW;
    property rows: Integer read _Getrows write _Setrows;
    property clos: Integer read _Getclos write _Setclos;
    property keyMap: TJavaArray<Byte> read _GetkeyMap write _SetkeyMap;
  end;

  TJPinPadData = class(TJavaGenericImport<JPinPadDataClass, JPinPadData>) end;

//  JTransData_1Class = interface(JObjectClass)
//  ['{824356AA-6887-4D1B-8F6A-F26687740926}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidl/bean/TransData$1')]
//  JTransData_1 = interface(JObject)
//  ['{AFBD0EF1-A67E-4710-9D83-6B80FD59EF27}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(ain: JParcel): JTransData; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JTransData>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJTransData_1 = class(TJavaGenericImport<JTransData_1Class, JTransData_1>) end;

  JTransDataClass = interface(JObjectClass)
  ['{442E596F-D7B7-42AA-B94F-C9776907D3DA}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JTransData; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/bean/TransData')]
  JTransData = interface(JObject)
  ['{712D1AD5-B66C-4288-91FA-29761320AA07}']
    { Property Methods }
    function _Getamount: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setamount(aamount: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettransType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettransType(atransType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisForceOnline: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisForceOnline(aisForceOnline: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;

    { Property }
    property amount: JString read _Getamount write _Setamount;
    property transType: JString read _GettransType write _SettransType;
    property isForceOnline: Integer read _GetisForceOnline write _SetisForceOnline;
  end;

  TJTransData = class(TJavaGenericImport<JTransDataClass, JTransData>) end;

  JDeviceProvide_DefaultClass = interface(JObjectClass)
  ['{4F8D2AE3-24B2-432F-B2A5-D2FA2D14CAC2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDeviceProvide_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/DeviceProvide$Default')]
  JDeviceProvide_Default = interface(JObject)
  ['{C00A4801-3961-4373-A8C1-8C611B1AA4D6}']
    { Property Methods }

    { methods }
    function getBasicOpt: JBasicOpt; cdecl;
    function getReadCardOpt: JReadCardOpt; cdecl;
    function getPinPadOpt: JPinPadOpt; cdecl;
    function getEMVOpt: JEMVOpt; cdecl;
    function getSecurityOpt: JSecurityOpt; cdecl;
    function setBinder(client: JIBinder): Integer; cdecl;
    function getPrinterOpt: JPrinterOpt; cdecl;
    function getTaxOpt: JTaxOpt; cdecl;
    function getBasicOptV2: JBasicOptV2; cdecl;
    function getReadCardOptV2: JReadCardOptV2; cdecl;
    function getPinPadOptV2: JPinPadOptV2; cdecl;
    function getEMVOptV2: JEMVOptV2; cdecl;
    function getSecurityOptV2: JSecurityOptV2; cdecl;
    function getPrinterOptV2: JPrinterOptV2; cdecl;
    function getTaxOptV2: JTaxOptV2; cdecl;
    function getETCOptV2: JETCOptV2; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJDeviceProvide_Default = class(TJavaGenericImport<JDeviceProvide_DefaultClass, JDeviceProvide_Default>) end;

  JDeviceProvide_Stub_ProxyClass = interface(JObjectClass)
  ['{C6D438EE-4DB5-480A-9BB6-5DEB6F10C8DE}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JDeviceProvide;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JDeviceProvide read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/DeviceProvide$Stub$Proxy')]
  JDeviceProvide_Stub_Proxy = interface(JObject)
  ['{A01F8D50-D81B-45AC-B472-26C06375288D}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function getBasicOpt: JBasicOpt; cdecl;
    function getReadCardOpt: JReadCardOpt; cdecl;
    function getPinPadOpt: JPinPadOpt; cdecl;
    function getEMVOpt: JEMVOpt; cdecl;
    function getSecurityOpt: JSecurityOpt; cdecl;
    function setBinder(client: JIBinder): Integer; cdecl;
    function getPrinterOpt: JPrinterOpt; cdecl;
    function getTaxOpt: JTaxOpt; cdecl;
    function getBasicOptV2: JBasicOptV2; cdecl;
    function getReadCardOptV2: JReadCardOptV2; cdecl;
    function getPinPadOptV2: JPinPadOptV2; cdecl;
    function getEMVOptV2: JEMVOptV2; cdecl;
    function getSecurityOptV2: JSecurityOptV2; cdecl;
    function getPrinterOptV2: JPrinterOptV2; cdecl;
    function getTaxOptV2: JTaxOptV2; cdecl;
    function getETCOptV2: JETCOptV2; cdecl;

    { Property }
  end;

  TJDeviceProvide_Stub_Proxy = class(TJavaGenericImport<JDeviceProvide_Stub_ProxyClass, JDeviceProvide_Stub_Proxy>) end;

  JDeviceProvide_StubClass = interface(JBinderClass) // or JObjectClass
  ['{BEC49DB7-BC0E-4302-B6ED-434E5B290AB8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDeviceProvide_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JDeviceProvide; cdecl;
    {class} function setDefaultImpl(impl: JDeviceProvide): Boolean; cdecl;
    {class} function getDefaultImpl: JDeviceProvide; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/DeviceProvide$Stub')]
  JDeviceProvide_Stub = interface(JBinder) // or JObject
  ['{BAADCD5D-7B31-40AD-BEC0-2D76354342D3}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJDeviceProvide_Stub = class(TJavaGenericImport<JDeviceProvide_StubClass, JDeviceProvide_Stub>) end;

  JDeviceProvideClass = interface(JObjectClass)
  ['{C0CF2EC7-9BD6-4201-8BBD-34B1E5C1E755}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/DeviceProvide')]
  JDeviceProvide = interface(IJavaInstance)
  ['{354AB5F0-F28F-49A9-9E45-5FAEEC42F56E}']
    { Property Methods }

    { methods }
    function getBasicOpt: JBasicOpt; cdecl;
    function getReadCardOpt: JReadCardOpt; cdecl;
    function getPinPadOpt: JPinPadOpt; cdecl;
    function getEMVOpt: JEMVOpt; cdecl;
    function getSecurityOpt: JSecurityOpt; cdecl;
    function setBinder(P1: JIBinder): Integer; cdecl;
    function getPrinterOpt: JPrinterOpt; cdecl;
    function getTaxOpt: JTaxOpt; cdecl;
    function getBasicOptV2: JBasicOptV2; cdecl;
    function getReadCardOptV2: JReadCardOptV2; cdecl;
    function getPinPadOptV2: JPinPadOptV2; cdecl;
    function getEMVOptV2: JEMVOptV2; cdecl;
    function getSecurityOptV2: JSecurityOptV2; cdecl;
    function getPrinterOptV2: JPrinterOptV2; cdecl;
    function getTaxOptV2: JTaxOptV2; cdecl;
    function getETCOptV2: JETCOptV2; cdecl;

    { Property }
  end;

  TJDeviceProvide = class(TJavaGenericImport<JDeviceProvideClass, JDeviceProvide>) end;

  JEMVListener_DefaultClass = interface(JObjectClass)
  ['{AD60C4EE-8EBE-4656-8B6C-D9DDEEFDC709}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEMVListener_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/emv/EMVListener$Default')]
  JEMVListener_Default = interface(JObject)
  ['{CF9E9B4B-D986-440C-B7D8-B11233EAE162}']
    { Property Methods }

    { methods }
    procedure requestShowPinPad(pinType: Integer); cdecl;
    procedure onProcessEnd; cdecl;
    procedure onError(erroCode: Integer); cdecl;
    procedure offlineApproval; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJEMVListener_Default = class(TJavaGenericImport<JEMVListener_DefaultClass, JEMVListener_Default>) end;

  JEMVListener_Stub_ProxyClass = interface(JObjectClass)
  ['{8E3A5E20-C3BE-4C26-8FE3-B4E69065F9B8}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JEMVListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JEMVListener read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/emv/EMVListener$Stub$Proxy')]
  JEMVListener_Stub_Proxy = interface(JObject)
  ['{91D1B64E-7E38-4187-8452-51D227526F5A}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure requestShowPinPad(pinType: Integer); cdecl;
    procedure onProcessEnd; cdecl;
    procedure onError(erroCode: Integer); cdecl;
    procedure offlineApproval; cdecl;

    { Property }
  end;

  TJEMVListener_Stub_Proxy = class(TJavaGenericImport<JEMVListener_Stub_ProxyClass, JEMVListener_Stub_Proxy>) end;

  JEMVListener_StubClass = interface(JBinderClass) // or JObjectClass
  ['{1A27C0E4-50CA-4680-8169-75C1E2F67754}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEMVListener_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JEMVListener; cdecl;
    {class} function setDefaultImpl(impl: JEMVListener): Boolean; cdecl;
    {class} function getDefaultImpl: JEMVListener; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/emv/EMVListener$Stub')]
  JEMVListener_Stub = interface(JBinder) // or JObject
  ['{7B204AD5-552D-4F24-9D7F-EE78F88B0A87}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJEMVListener_Stub = class(TJavaGenericImport<JEMVListener_StubClass, JEMVListener_Stub>) end;

  JEMVListenerClass = interface(JObjectClass)
  ['{30800E04-47E0-49C0-B443-3E3483EB49AD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/emv/EMVListener')]
  JEMVListener = interface(IJavaInstance)
  ['{975347AE-3127-4A07-BA53-2EECDF68CB6B}']
    { Property Methods }

    { methods }
    procedure requestShowPinPad(P1: Integer); cdecl;
    procedure onProcessEnd; cdecl;
    procedure onError(P1: Integer); cdecl;
    procedure offlineApproval; cdecl;

    { Property }
  end;

  TJEMVListener = class(TJavaGenericImport<JEMVListenerClass, JEMVListener>) end;

  JEMVOpt_DefaultClass = interface(JObjectClass)
  ['{2A49D482-E713-4702-99EC-6C1D40ECF1B5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEMVOpt_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/emv/EMVOpt$Default')]
  JEMVOpt_Default = interface(JObject)
  ['{C18409FD-E209-41E2-A638-6AD5DB498776}']
    { Property Methods }

    { methods }
    function updateAID(actType: Integer; aid: JString): Integer; cdecl;
    function updateCAPK(actType: Integer; capk: JString): Integer; cdecl;
    function insertAID(aidList: JList): Integer; cdecl;
    function insertCAPK(capkList: JList): Integer; cdecl;
    function syncParam: Integer; cdecl;
    function setTerminalParam(emvTermParam: JEmvTermParam): Integer; cdecl;
    function isExistCapkAndAID: Integer; cdecl;
    procedure transactProcess(listener: JEMVListener); cdecl;
    function readKernelData(tags: TJavaObjectArray<JString>; outData: TJavaArray<Byte>): Integer; cdecl;
    function importResponseData(onlineResult: Integer; tagIn: TJavaArray<Byte>; tagInLength: Integer; tagOut: TJavaArray<Byte>): Integer; cdecl;
    function readTransLog(logType: Integer; infoOut: JList): Integer; cdecl;
    procedure importPinInputStatus(pinType: Integer; inputResult: Integer); cdecl;
    function TransPreProcess(icCardType: Integer; transData: JTransData): Integer; cdecl;
    function setKernelData(tlvData: TJavaArray<Byte>): Integer; cdecl;
    procedure abortTransactProcess; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJEMVOpt_Default = class(TJavaGenericImport<JEMVOpt_DefaultClass, JEMVOpt_Default>) end;

  JEMVOpt_Stub_ProxyClass = interface(JObjectClass)
  ['{A1C85D3F-DA88-41DD-A6ED-BB2624AC1CCA}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JEMVOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JEMVOpt read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/emv/EMVOpt$Stub$Proxy')]
  JEMVOpt_Stub_Proxy = interface(JObject)
  ['{E7471B64-D661-4291-BFE0-5B8CBEAB2A81}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function updateAID(actType: Integer; aid: JString): Integer; cdecl;
    function updateCAPK(actType: Integer; capk: JString): Integer; cdecl;
    function insertAID(aidList: JList): Integer; cdecl;
    function insertCAPK(capkList: JList): Integer; cdecl;
    function syncParam: Integer; cdecl;
    function setTerminalParam(emvTermParam: JEmvTermParam): Integer; cdecl;
    function isExistCapkAndAID: Integer; cdecl;
    procedure transactProcess(listener: JEMVListener); cdecl;
    function readKernelData(tags: TJavaObjectArray<JString>; outData: TJavaArray<Byte>): Integer; cdecl;
    function importResponseData(onlineResult: Integer; tagIn: TJavaArray<Byte>; tagInLength: Integer; tagOut: TJavaArray<Byte>): Integer; cdecl;
    function readTransLog(logType: Integer; infoOut: JList): Integer; cdecl;
    procedure importPinInputStatus(pinType: Integer; inputResult: Integer); cdecl;
    function TransPreProcess(icCardType: Integer; transData: JTransData): Integer; cdecl;
    function setKernelData(tlvData: TJavaArray<Byte>): Integer; cdecl;
    procedure abortTransactProcess; cdecl;

    { Property }
  end;

  TJEMVOpt_Stub_Proxy = class(TJavaGenericImport<JEMVOpt_Stub_ProxyClass, JEMVOpt_Stub_Proxy>) end;

  JEMVOpt_StubClass = interface(JBinderClass) // or JObjectClass
  ['{AD76E5A6-ABC8-4F3A-ADC4-4B85A4F5F1F9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEMVOpt_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JEMVOpt; cdecl;
    {class} function setDefaultImpl(impl: JEMVOpt): Boolean; cdecl;
    {class} function getDefaultImpl: JEMVOpt; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/emv/EMVOpt$Stub')]
  JEMVOpt_Stub = interface(JBinder) // or JObject
  ['{D08C0C92-19DA-439E-A74E-56CC8597FA78}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJEMVOpt_Stub = class(TJavaGenericImport<JEMVOpt_StubClass, JEMVOpt_Stub>) end;

  JEMVOptClass = interface(JObjectClass)
  ['{99D7B852-28E6-44B2-A780-833398996910}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/emv/EMVOpt')]
  JEMVOpt = interface(IJavaInstance)
  ['{71565194-90DE-4659-8748-14560290FA17}']
    { Property Methods }

    { methods }
    function updateAID(P1: Integer; P2: JString): Integer; cdecl;
    function updateCAPK(P1: Integer; P2: JString): Integer; cdecl;
    function insertAID(P1: JList): Integer; cdecl;
    function insertCAPK(P1: JList): Integer; cdecl;
    function syncParam: Integer; cdecl;
    function setTerminalParam(P1: JEmvTermParam): Integer; cdecl;
    function isExistCapkAndAID: Integer; cdecl;
    procedure transactProcess(P1: JEMVListener); cdecl;
    function readKernelData(P1: TJavaObjectArray<JString>; P2: TJavaArray<Byte>): Integer; cdecl;
    function importResponseData(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;
    function readTransLog(P1: Integer; P2: JList): Integer; cdecl;
    procedure importPinInputStatus(P1: Integer; P2: Integer); cdecl;
    function TransPreProcess(P1: Integer; P2: JTransData): Integer; cdecl;
    function setKernelData(P1: TJavaArray<Byte>): Integer; cdecl;
    procedure abortTransactProcess; cdecl;

    { Property }
  end;

  TJEMVOpt = class(TJavaGenericImport<JEMVOptClass, JEMVOpt>) end;

  JPinPadListener_DefaultClass = interface(JObjectClass)
  ['{EDA1DE22-463A-4932-B58B-DE254A3FDDE2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPinPadListener_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/pinpad/PinPadListener$Default')]
  JPinPadListener_Default = interface(JObject)
  ['{3E4AFB2C-DDC1-450C-A868-C8B526C521B6}']
    { Property Methods }

    { methods }
    procedure onPinLength(length: Integer); cdecl;
    procedure onConfirm(atype: Integer; pinBlock: TJavaArray<Byte>); cdecl;
    procedure onCancel; cdecl;
    procedure onError(errorCode: Integer); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJPinPadListener_Default = class(TJavaGenericImport<JPinPadListener_DefaultClass, JPinPadListener_Default>) end;

  JPinPadListener_Stub_ProxyClass = interface(JObjectClass)
  ['{4FE88C3C-47C8-4F8E-95E1-69814CD9950D}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JPinPadListener;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JPinPadListener read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/pinpad/PinPadListener$Stub$Proxy')]
  JPinPadListener_Stub_Proxy = interface(JObject)
  ['{84D01C2C-1111-4EEE-B4BB-9B3F469FA5C8}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onPinLength(length: Integer); cdecl;
    procedure onConfirm(atype: Integer; pinBlock: TJavaArray<Byte>); cdecl;
    procedure onCancel; cdecl;
    procedure onError(errorCode: Integer); cdecl;

    { Property }
  end;

  TJPinPadListener_Stub_Proxy = class(TJavaGenericImport<JPinPadListener_Stub_ProxyClass, JPinPadListener_Stub_Proxy>) end;

  JPinPadListener_StubClass = interface(JBinderClass) // or JObjectClass
  ['{4962C01B-8765-4CFF-94F3-080D944D4F18}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPinPadListener_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JPinPadListener; cdecl;
    {class} function setDefaultImpl(impl: JPinPadListener): Boolean; cdecl;
    {class} function getDefaultImpl: JPinPadListener; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/pinpad/PinPadListener$Stub')]
  JPinPadListener_Stub = interface(JBinder) // or JObject
  ['{6BF3BBA4-AE64-426A-9B62-BF99E99E73DF}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJPinPadListener_Stub = class(TJavaGenericImport<JPinPadListener_StubClass, JPinPadListener_Stub>) end;

  JPinPadListenerClass = interface(JObjectClass)
  ['{81AECEE8-DD36-4855-8287-F269FD32C4D4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/pinpad/PinPadListener')]
  JPinPadListener = interface(IJavaInstance)
  ['{10D7D4EB-62F9-4797-86E4-D2CF99E1EF1C}']
    { Property Methods }

    { methods }
    procedure onPinLength(P1: Integer); cdecl;
    procedure onConfirm(P1: Integer; P2: TJavaArray<Byte>); cdecl;
    procedure onCancel; cdecl;
    procedure onError(P1: Integer); cdecl;

    { Property }
  end;

  TJPinPadListener = class(TJavaGenericImport<JPinPadListenerClass, JPinPadListener>) end;

  JPinPadOpt_DefaultClass = interface(JObjectClass)
  ['{5ABB92B0-A660-4277-BAD3-2EA5D482E437}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPinPadOpt_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/pinpad/PinPadOpt$Default')]
  JPinPadOpt_Default = interface(JObject)
  ['{3EFCAB4A-FE89-40B2-95BC-3067C2B76C17}']
    { Property Methods }

    { methods }
    function initPinPad(config: JPinPadConfig; listerner: JPinPadListener): JString; cdecl;
    procedure importPinPadData(data: JPinPadData); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJPinPadOpt_Default = class(TJavaGenericImport<JPinPadOpt_DefaultClass, JPinPadOpt_Default>) end;

  JPinPadOpt_Stub_ProxyClass = interface(JObjectClass)
  ['{0CA433A7-F8AF-45B5-B093-01DC27ABA850}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JPinPadOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JPinPadOpt read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/pinpad/PinPadOpt$Stub$Proxy')]
  JPinPadOpt_Stub_Proxy = interface(JObject)
  ['{DF4D9BC2-5FAE-4FE2-A078-712DE35E11D1}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function initPinPad(config: JPinPadConfig; listerner: JPinPadListener): JString; cdecl;
    procedure importPinPadData(data: JPinPadData); cdecl;

    { Property }
  end;

  TJPinPadOpt_Stub_Proxy = class(TJavaGenericImport<JPinPadOpt_Stub_ProxyClass, JPinPadOpt_Stub_Proxy>) end;

  JPinPadOpt_StubClass = interface(JBinderClass) // or JObjectClass
  ['{C9A9A917-AB5A-451E-97DD-6D2980A4EEEF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPinPadOpt_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JPinPadOpt; cdecl;
    {class} function setDefaultImpl(impl: JPinPadOpt): Boolean; cdecl;
    {class} function getDefaultImpl: JPinPadOpt; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/pinpad/PinPadOpt$Stub')]
  JPinPadOpt_Stub = interface(JBinder) // or JObject
  ['{E3E43EDB-A976-41C5-BFBA-8FD7E3D4C208}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJPinPadOpt_Stub = class(TJavaGenericImport<JPinPadOpt_StubClass, JPinPadOpt_Stub>) end;

  JPinPadOptClass = interface(JObjectClass)
  ['{5A2C8F99-DD7A-479C-BA1F-F6374A06EEB2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/pinpad/PinPadOpt')]
  JPinPadOpt = interface(IJavaInstance)
  ['{9DCCDFD4-2F67-400F-8E98-FFDA59916ECC}']
    { Property Methods }

    { methods }
    function initPinPad(P1: JPinPadConfig; P2: JPinPadListener): JString; cdecl;
    procedure importPinPadData(P1: JPinPadData); cdecl;

    { Property }
  end;

  TJPinPadOpt = class(TJavaGenericImport<JPinPadOptClass, JPinPadOpt>) end;

  JPrinterCallback_DefaultClass = interface(JObjectClass)
  ['{55B276C5-BAF8-4EF7-A4C7-AB7AE61768E6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrinterCallback_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/print/PrinterCallback$Default')]
  JPrinterCallback_Default = interface(JObject)
  ['{92ACDCF7-CA4F-408F-A602-4CE0FDEF80A9}']
    { Property Methods }

    { methods }
    procedure onPrinterStatusUpdate(status: Integer); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJPrinterCallback_Default = class(TJavaGenericImport<JPrinterCallback_DefaultClass, JPrinterCallback_Default>) end;

  JPrinterCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{2973AC3A-A54A-4A3C-B9DB-A5EFAE9D094E}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JPrinterCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JPrinterCallback read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/print/PrinterCallback$Stub$Proxy')]
  JPrinterCallback_Stub_Proxy = interface(JObject)
  ['{380BC984-F32F-47F3-A1A7-B2A8D816AD37}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onPrinterStatusUpdate(status: Integer); cdecl;

    { Property }
  end;

  TJPrinterCallback_Stub_Proxy = class(TJavaGenericImport<JPrinterCallback_Stub_ProxyClass, JPrinterCallback_Stub_Proxy>) end;

  JPrinterCallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{E2BCEE45-75F1-43ED-864F-D1464534D131}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrinterCallback_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JPrinterCallback; cdecl;
    {class} function setDefaultImpl(impl: JPrinterCallback): Boolean; cdecl;
    {class} function getDefaultImpl: JPrinterCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/print/PrinterCallback$Stub')]
  JPrinterCallback_Stub = interface(JBinder) // or JObject
  ['{56DDB788-641E-4EA0-AE53-D416D7ADDB83}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJPrinterCallback_Stub = class(TJavaGenericImport<JPrinterCallback_StubClass, JPrinterCallback_Stub>) end;

  JPrinterCallbackClass = interface(JObjectClass)
  ['{C92D5788-3E17-4987-AD4E-090ACB10F460}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/print/PrinterCallback')]
  JPrinterCallback = interface(IJavaInstance)
  ['{20C2FDBB-719E-4C75-83F7-05CDF7CA9F42}']
    { Property Methods }

    { methods }
    procedure onPrinterStatusUpdate(P1: Integer); cdecl;

    { Property }
  end;

  TJPrinterCallback = class(TJavaGenericImport<JPrinterCallbackClass, JPrinterCallback>) end;

  JPrinterOpt_DefaultClass = interface(JObjectClass)
  ['{ECCFD9FF-DF9B-4F2D-9AC0-E1C9F2AEF9D1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrinterOpt_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/print/PrinterOpt$Default')]
  JPrinterOpt_Default = interface(JObject)
  ['{9D8A9F37-2C1B-42A6-A01A-1A1629BBFEDF}']
    { Property Methods }

    { methods }
    function printOpen: Integer; cdecl;
    function printClose: Integer; cdecl;
    function printPointLine(pointRowData: TJavaArray<Byte>): Integer; cdecl;
    function printFeedPaper(nPixels: Integer): Integer; cdecl;
    function getPrinterStatus: Integer; cdecl;
    function getPrinterDriverVersion: JString; cdecl;
    function setGrayLevel(level: Integer): Integer; cdecl;
    function getBufferRemainingRows: Integer; cdecl;
    function getPrinterConfig: JString; cdecl;
    function getPrintGrayLevel: Integer; cdecl;
    function getTotalPrintDistance: Integer; cdecl;
    function getPrinterSN: JString; cdecl;
    procedure registerPrintCallback(callback: JPrinterCallback); cdecl;
    procedure unregisterPrintCallback; cdecl;
    function setPrintSpeed(speed: Integer): Integer; cdecl;
    function setPrintHeatPoint(pointNum: Integer): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJPrinterOpt_Default = class(TJavaGenericImport<JPrinterOpt_DefaultClass, JPrinterOpt_Default>) end;

  JPrinterOpt_Stub_ProxyClass = interface(JObjectClass)
  ['{B370F8C9-9D7F-4B5D-9905-EF98B69E3106}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JPrinterOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JPrinterOpt read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/print/PrinterOpt$Stub$Proxy')]
  JPrinterOpt_Stub_Proxy = interface(JObject)
  ['{B72108FB-0CBB-4946-B127-43C6EC7FAE97}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function printOpen: Integer; cdecl;
    function printClose: Integer; cdecl;
    function printPointLine(pointRowData: TJavaArray<Byte>): Integer; cdecl;
    function printFeedPaper(nPixels: Integer): Integer; cdecl;
    function getPrinterStatus: Integer; cdecl;
    function getPrinterDriverVersion: JString; cdecl;
    function setGrayLevel(level: Integer): Integer; cdecl;
    function getBufferRemainingRows: Integer; cdecl;
    function getPrinterConfig: JString; cdecl;
    function getPrintGrayLevel: Integer; cdecl;
    function getTotalPrintDistance: Integer; cdecl;
    function getPrinterSN: JString; cdecl;
    procedure registerPrintCallback(callback: JPrinterCallback); cdecl;
    procedure unregisterPrintCallback; cdecl;
    function setPrintSpeed(speed: Integer): Integer; cdecl;
    function setPrintHeatPoint(pointNum: Integer): Integer; cdecl;

    { Property }
  end;

  TJPrinterOpt_Stub_Proxy = class(TJavaGenericImport<JPrinterOpt_Stub_ProxyClass, JPrinterOpt_Stub_Proxy>) end;

  JPrinterOpt_StubClass = interface(JBinderClass) // or JObjectClass
  ['{349AB6EC-2BDE-47A6-948D-D5BEC95BEE57}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrinterOpt_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JPrinterOpt; cdecl;
    {class} function setDefaultImpl(impl: JPrinterOpt): Boolean; cdecl;
    {class} function getDefaultImpl: JPrinterOpt; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/print/PrinterOpt$Stub')]
  JPrinterOpt_Stub = interface(JBinder) // or JObject
  ['{283FCAC5-4E2C-4D9B-B180-CF5431019EFF}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJPrinterOpt_Stub = class(TJavaGenericImport<JPrinterOpt_StubClass, JPrinterOpt_Stub>) end;

  JPrinterOptClass = interface(JObjectClass)
  ['{A88822C3-EF95-49F7-A539-4110F4FC7363}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/print/PrinterOpt')]
  JPrinterOpt = interface(IJavaInstance)
  ['{5AD97CDD-217F-432E-8A9D-337B70D7B4BB}']
    { Property Methods }

    { methods }
    function printOpen: Integer; cdecl;
    function printClose: Integer; cdecl;
    function printPointLine(P1: TJavaArray<Byte>): Integer; cdecl;
    function printFeedPaper(P1: Integer): Integer; cdecl;
    function getPrinterStatus: Integer; cdecl;
    function getPrinterDriverVersion: JString; cdecl;
    function setGrayLevel(P1: Integer): Integer; cdecl;
    function getBufferRemainingRows: Integer; cdecl;
    function getPrinterConfig: JString; cdecl;
    function getPrintGrayLevel: Integer; cdecl;
    function getTotalPrintDistance: Integer; cdecl;
    function getPrinterSN: JString; cdecl;
    procedure registerPrintCallback(P1: JPrinterCallback); cdecl;
    procedure unregisterPrintCallback; cdecl;
    function setPrintSpeed(P1: Integer): Integer; cdecl;
    function setPrintHeatPoint(P1: Integer): Integer; cdecl;

    { Property }
  end;

  TJPrinterOpt = class(TJavaGenericImport<JPrinterOptClass, JPrinterOpt>) end;

  JCheckCardCallback_DefaultClass = interface(JObjectClass)
  ['{64FCC151-B6FD-4DD4-A452-50C5F2B87E82}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCheckCardCallback_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/CheckCardCallback$Default')]
  JCheckCardCallback_Default = interface(JObject)
  ['{52BF9457-691A-4728-9D71-58FC166F0BC8}']
    { Property Methods }

    { methods }
    procedure onStartCheckCard; cdecl;
    procedure findMagCard(bundle: JBundle); cdecl;
    procedure findICCard(atr: JString); cdecl;
    procedure findRFCard(uuid: JString); cdecl;
    procedure onError(code: Integer; amessage: JString); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJCheckCardCallback_Default = class(TJavaGenericImport<JCheckCardCallback_DefaultClass, JCheckCardCallback_Default>) end;

  JCheckCardCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{B80A391D-0EF4-448C-8A9C-BBB03ECB1BD9}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JCheckCardCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JCheckCardCallback read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/CheckCardCallback$Stub$Proxy')]
  JCheckCardCallback_Stub_Proxy = interface(JObject)
  ['{592CF749-9E84-4A23-B937-A13752ACE1BC}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onStartCheckCard; cdecl;
    procedure findMagCard(bundle: JBundle); cdecl;
    procedure findICCard(atr: JString); cdecl;
    procedure findRFCard(uuid: JString); cdecl;
    procedure onError(code: Integer; amessage: JString); cdecl;

    { Property }
  end;

  TJCheckCardCallback_Stub_Proxy = class(TJavaGenericImport<JCheckCardCallback_Stub_ProxyClass, JCheckCardCallback_Stub_Proxy>) end;

  JCheckCardCallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{DFB43F42-3A02-4612-9326-4D248F5D47B5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCheckCardCallback_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JCheckCardCallback; cdecl;
    {class} function setDefaultImpl(impl: JCheckCardCallback): Boolean; cdecl;
    {class} function getDefaultImpl: JCheckCardCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/CheckCardCallback$Stub')]
  JCheckCardCallback_Stub = interface(JBinder) // or JObject
  ['{620A0FB8-C86D-4C82-AD1D-990C97208025}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJCheckCardCallback_Stub = class(TJavaGenericImport<JCheckCardCallback_StubClass, JCheckCardCallback_Stub>) end;

  JCheckCardCallbackClass = interface(JObjectClass)
  ['{39EFE813-E71F-41A0-8C1D-A4183DEFC167}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/CheckCardCallback')]
  JCheckCardCallback = interface(IJavaInstance)
  ['{3F69F032-E859-45D2-BB9E-54C0092E7676}']
    { Property Methods }

    { methods }
    procedure onStartCheckCard; cdecl;
    procedure findMagCard(P1: JBundle); cdecl;
    procedure findICCard(P1: JString); cdecl;
    procedure findRFCard(P1: JString); cdecl;
    procedure onError(P1: Integer; P2: JString); cdecl;

    { Property }
  end;

  TJCheckCardCallback = class(TJavaGenericImport<JCheckCardCallbackClass, JCheckCardCallback>) end;

  JReadCardCallback_DefaultClass = interface(JObjectClass)
  ['{31EF37B2-5B89-435D-86AC-0311F34C2E6B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReadCardCallback_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/ReadCardCallback$Default')]
  JReadCardCallback_Default = interface(JObject)
  ['{5A44E161-143B-42CE-AD70-D6BB889368AB}']
    { Property Methods }

    { methods }
    procedure onCardDetected(cardInfo: JCardInfo); cdecl;
    procedure onError(code: Integer; amessage: JString); cdecl;
    procedure onStartCheckCard; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJReadCardCallback_Default = class(TJavaGenericImport<JReadCardCallback_DefaultClass, JReadCardCallback_Default>) end;

  JReadCardCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{B55D9106-73C5-4680-BE53-8795F4B43EB5}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JReadCardCallback;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JReadCardCallback read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/ReadCardCallback$Stub$Proxy')]
  JReadCardCallback_Stub_Proxy = interface(JObject)
  ['{701DAF76-7337-43C4-A609-F2501E955999}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onCardDetected(cardInfo: JCardInfo); cdecl;
    procedure onError(code: Integer; amessage: JString); cdecl;
    procedure onStartCheckCard; cdecl;

    { Property }
  end;

  TJReadCardCallback_Stub_Proxy = class(TJavaGenericImport<JReadCardCallback_Stub_ProxyClass, JReadCardCallback_Stub_Proxy>) end;

  JReadCardCallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{6C2E939E-E046-42C2-BDF1-B4780DECFF16}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReadCardCallback_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JReadCardCallback; cdecl;
    {class} function setDefaultImpl(impl: JReadCardCallback): Boolean; cdecl;
    {class} function getDefaultImpl: JReadCardCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/ReadCardCallback$Stub')]
  JReadCardCallback_Stub = interface(JBinder) // or JObject
  ['{DBE28650-05A2-4D0D-A86E-919768D8390B}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJReadCardCallback_Stub = class(TJavaGenericImport<JReadCardCallback_StubClass, JReadCardCallback_Stub>) end;

  JReadCardCallbackClass = interface(JObjectClass)
  ['{2C3F5796-C960-4C51-AEA3-7F6BC4AAF7DF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/ReadCardCallback')]
  JReadCardCallback = interface(IJavaInstance)
  ['{669FE404-36BE-4F28-A1C8-520F55C56F21}']
    { Property Methods }

    { methods }
    procedure onCardDetected(P1: JCardInfo); cdecl;
    procedure onError(P1: Integer; P2: JString); cdecl;
    procedure onStartCheckCard; cdecl;

    { Property }
  end;

  TJReadCardCallback = class(TJavaGenericImport<JReadCardCallbackClass, JReadCardCallback>) end;

  JReadCardOpt_DefaultClass = interface(JObjectClass)
  ['{95A18D1F-8978-4AC6-8439-93BA76C967FE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReadCardOpt_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/ReadCardOpt$Default')]
  JReadCardOpt_Default = interface(JObject)
  ['{79518D83-8613-41D7-80B7-B109E97B008A}']
    { Property Methods }

    { methods }
    procedure checkBankCard(cardType: Integer; callback: JReadCardCallback; timeout: Integer); cdecl;
    procedure checkCard(cardType: Integer; callback: JReadCardCallback; timeout: Integer); cdecl;
    procedure cancelCheckCard; cdecl;
    function smartCardExchange(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function cardOff(cardType: Integer): Integer; cdecl;
    function mifareAuth(keyType: Integer; block: Integer; key: TJavaArray<Byte>): Integer; cdecl;
    function mifareReadBlock(block: Integer; blockData: TJavaArray<Byte>): Integer; cdecl;
    function mifareWriteBlock(block: Integer; blockData: TJavaArray<Byte>): Integer; cdecl;
    function mifareIncValue(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function mifareDecValue(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function initTransData(transData: JTransData): Integer; cdecl;
    function smartCardExChangeNISO(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function getCardExistStatus(cardType: Integer): Integer; cdecl;
    procedure detectCard(cardType: Integer; checkCardCallback: JCheckCardCallback; timeout: Integer); cdecl;
    function smartCardExChangePASS(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function smartCardExChangePASSNoLength(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJReadCardOpt_Default = class(TJavaGenericImport<JReadCardOpt_DefaultClass, JReadCardOpt_Default>) end;

  JReadCardOpt_Stub_ProxyClass = interface(JObjectClass)
  ['{7B44692B-C392-4833-9632-D5FFA9D2544B}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JReadCardOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JReadCardOpt read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/ReadCardOpt$Stub$Proxy')]
  JReadCardOpt_Stub_Proxy = interface(JObject)
  ['{4F7A40E9-B231-4150-97B4-B10A0A1BFA9F}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure checkBankCard(cardType: Integer; callback: JReadCardCallback; timeout: Integer); cdecl;
    procedure checkCard(cardType: Integer; callback: JReadCardCallback; timeout: Integer); cdecl;
    procedure cancelCheckCard; cdecl;
    function smartCardExchange(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function cardOff(cardType: Integer): Integer; cdecl;
    function mifareAuth(keyType: Integer; block: Integer; key: TJavaArray<Byte>): Integer; cdecl;
    function mifareReadBlock(block: Integer; blockData: TJavaArray<Byte>): Integer; cdecl;
    function mifareWriteBlock(block: Integer; blockData: TJavaArray<Byte>): Integer; cdecl;
    function mifareIncValue(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function mifareDecValue(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function initTransData(transData: JTransData): Integer; cdecl;
    function smartCardExChangeNISO(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function getCardExistStatus(cardType: Integer): Integer; cdecl;
    procedure detectCard(cardType: Integer; checkCardCallback: JCheckCardCallback; timeout: Integer); cdecl;
    function smartCardExChangePASS(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function smartCardExChangePASSNoLength(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJReadCardOpt_Stub_Proxy = class(TJavaGenericImport<JReadCardOpt_Stub_ProxyClass, JReadCardOpt_Stub_Proxy>) end;

  JReadCardOpt_StubClass = interface(JBinderClass) // or JObjectClass
  ['{090BCA8D-B648-4B45-BCF2-83CA9037248C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReadCardOpt_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JReadCardOpt; cdecl;
    {class} function setDefaultImpl(impl: JReadCardOpt): Boolean; cdecl;
    {class} function getDefaultImpl: JReadCardOpt; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/ReadCardOpt$Stub')]
  JReadCardOpt_Stub = interface(JBinder) // or JObject
  ['{AD71237D-CC88-4D44-B8B7-9C55609A53CA}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJReadCardOpt_Stub = class(TJavaGenericImport<JReadCardOpt_StubClass, JReadCardOpt_Stub>) end;

  JReadCardOptClass = interface(JObjectClass)
  ['{50BB57DC-FAF5-41D6-858E-8D24008B13C5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/readcard/ReadCardOpt')]
  JReadCardOpt = interface(IJavaInstance)
  ['{9527EF25-ED40-43B8-A1F2-472DABBA79E2}']
    { Property Methods }

    { methods }
    procedure checkBankCard(P1: Integer; P2: JReadCardCallback; P3: Integer); cdecl;
    procedure checkCard(P1: Integer; P2: JReadCardCallback; P3: Integer); cdecl;
    procedure cancelCheckCard; cdecl;
    function smartCardExchange(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function cardOff(P1: Integer): Integer; cdecl;
    function mifareAuth(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;
    function mifareReadBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareWriteBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareIncValue(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareDecValue(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function initTransData(P1: JTransData): Integer; cdecl;
    function smartCardExChangeNISO(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function getCardExistStatus(P1: Integer): Integer; cdecl;
    procedure detectCard(P1: Integer; P2: JCheckCardCallback; P3: Integer); cdecl;
    function smartCardExChangePASS(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function smartCardExChangePASSNoLength(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJReadCardOpt = class(TJavaGenericImport<JReadCardOptClass, JReadCardOpt>) end;

  JSecurityOpt_DefaultClass = interface(JObjectClass)
  ['{C588861C-2BCC-4426-B05C-19C6344E7E91}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSecurityOpt_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/security/SecurityOpt$Default')]
  JSecurityOpt_Default = interface(JObject)
  ['{10F78CDB-D29E-4F7E-B39B-0B4A9DA72500}']
    { Property Methods }

    { methods }
    function saveKey(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; encryptIndex: Integer; keyAlgType: Integer; keyIndex: Integer; isEncrypt: Boolean): Integer; cdecl;
    function dataEncrypt(keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function calcMac(keyIndex: Integer; macType: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getEncryptTUSN(dataIn: JString; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function storeSM4Key(dataIn: TJavaArray<Byte>): Integer; cdecl;
    function encryptDataBySM4Key(dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getSecStatus: Integer; cdecl;
    function verifyApkSign(hashMessage: TJavaArray<Byte>; signData: TJavaArray<Byte>): Integer; cdecl;
    function getAuthStatus(atype: Integer): JString; cdecl;
    function getTermStatus: JString; cdecl;
    function setTermStatus: Integer; cdecl;
    function sysRequestAuth(reqType: Byte; authCode: Integer; SN: JString; authData: TJavaArray<Byte>): Integer; cdecl;
    function sysConfirmAuth(dataIn: TJavaArray<Byte>): Integer; cdecl;
    function saveTerminalKey(dataInPuk: TJavaArray<Byte>; dataInPvk: TJavaArray<Byte>): Integer; cdecl;
    function readTerminalPuk(dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getTerminalCertData(dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function saveBaseKey(destinationIndex: Integer; keyData: TJavaArray<Byte>): Integer; cdecl;
    function dataDecrypt(keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function saveKeyDukpt(keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; ksn: TJavaArray<Byte>; encryptIndex: Integer; encryptType: Integer; keyIndex: Integer; isEncrypt: Boolean): Integer; cdecl;
    function calcMacDukpt(keyIndex: Integer; macType: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataEncryptDukpt(keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptDukpt(keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function calcSecKey(keySystem: Integer; keyIndex: Integer; ctrlCode: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm1EncryptData(dataIn: TJavaArray<Byte>; sk: TJavaArray<Byte>; ak: TJavaArray<Byte>; ek: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm1DecryptData(dataIn: TJavaArray<Byte>; sk: TJavaArray<Byte>; ak: TJavaArray<Byte>; ek: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm2EncryptData(dataIn: TJavaArray<Byte>; key: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm2DecryptData(dataIn: TJavaArray<Byte>; key: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm2SignData(userId: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; pubKey: TJavaArray<Byte>; priKey: TJavaArray<Byte>; sign: TJavaArray<Byte>; eValue: TJavaArray<Byte>): Integer; cdecl;
    function sm2VerifySign(userId: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; pubKey: TJavaArray<Byte>; priKey: TJavaArray<Byte>; sign: TJavaArray<Byte>): Integer; cdecl;
    function sm3CalHash(userId: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm4EncryptData(dataIn: TJavaArray<Byte>; key: TJavaArray<Byte>; encryptMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm4DecryptData(dataIn: TJavaArray<Byte>; key: TJavaArray<Byte>; encryptMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function calcSM4Mac(macKey: TJavaArray<Byte>; iv: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJSecurityOpt_Default = class(TJavaGenericImport<JSecurityOpt_DefaultClass, JSecurityOpt_Default>) end;

  JSecurityOpt_Stub_ProxyClass = interface(JObjectClass)
  ['{176A85EA-0012-461B-8D5C-80B117BACFC6}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JSecurityOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JSecurityOpt read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/security/SecurityOpt$Stub$Proxy')]
  JSecurityOpt_Stub_Proxy = interface(JObject)
  ['{42FABD6D-7B68-4A2E-9729-5A511B9AA6FF}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function saveKey(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; encryptIndex: Integer; keyAlgType: Integer; keyIndex: Integer; isEncrypt: Boolean): Integer; cdecl;
    function dataEncrypt(keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function calcMac(keyIndex: Integer; macType: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getEncryptTUSN(dataIn: JString; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function storeSM4Key(dataIn: TJavaArray<Byte>): Integer; cdecl;
    function encryptDataBySM4Key(dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getSecStatus: Integer; cdecl;
    function verifyApkSign(hashMessage: TJavaArray<Byte>; signData: TJavaArray<Byte>): Integer; cdecl;
    function getAuthStatus(atype: Integer): JString; cdecl;
    function getTermStatus: JString; cdecl;
    function setTermStatus: Integer; cdecl;
    function sysRequestAuth(reqType: Byte; authCode: Integer; SN: JString; authData: TJavaArray<Byte>): Integer; cdecl;
    function sysConfirmAuth(dataIn: TJavaArray<Byte>): Integer; cdecl;
    function saveTerminalKey(dataInPuk: TJavaArray<Byte>; dataInPvk: TJavaArray<Byte>): Integer; cdecl;
    function readTerminalPuk(dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getTerminalCertData(dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function saveBaseKey(destinationIndex: Integer; keyData: TJavaArray<Byte>): Integer; cdecl;
    function dataDecrypt(keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function saveKeyDukpt(keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; ksn: TJavaArray<Byte>; encryptIndex: Integer; encryptType: Integer; keyIndex: Integer; isEncrypt: Boolean): Integer; cdecl;
    function calcMacDukpt(keyIndex: Integer; macType: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataEncryptDukpt(keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptDukpt(keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function calcSecKey(keySystem: Integer; keyIndex: Integer; ctrlCode: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm1EncryptData(dataIn: TJavaArray<Byte>; sk: TJavaArray<Byte>; ak: TJavaArray<Byte>; ek: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm1DecryptData(dataIn: TJavaArray<Byte>; sk: TJavaArray<Byte>; ak: TJavaArray<Byte>; ek: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm2EncryptData(dataIn: TJavaArray<Byte>; key: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm2DecryptData(dataIn: TJavaArray<Byte>; key: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm2SignData(userId: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; pubKey: TJavaArray<Byte>; priKey: TJavaArray<Byte>; sign: TJavaArray<Byte>; eValue: TJavaArray<Byte>): Integer; cdecl;
    function sm2VerifySign(userId: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; pubKey: TJavaArray<Byte>; priKey: TJavaArray<Byte>; sign: TJavaArray<Byte>): Integer; cdecl;
    function sm3CalHash(userId: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm4EncryptData(dataIn: TJavaArray<Byte>; key: TJavaArray<Byte>; encryptMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm4DecryptData(dataIn: TJavaArray<Byte>; key: TJavaArray<Byte>; encryptMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function calcSM4Mac(macKey: TJavaArray<Byte>; iv: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJSecurityOpt_Stub_Proxy = class(TJavaGenericImport<JSecurityOpt_Stub_ProxyClass, JSecurityOpt_Stub_Proxy>) end;

  JSecurityOpt_StubClass = interface(JBinderClass) // or JObjectClass
  ['{4899191C-4B4D-446D-A85F-76C204FD1F04}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSecurityOpt_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JSecurityOpt; cdecl;
    {class} function setDefaultImpl(impl: JSecurityOpt): Boolean; cdecl;
    {class} function getDefaultImpl: JSecurityOpt; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/security/SecurityOpt$Stub')]
  JSecurityOpt_Stub = interface(JBinder) // or JObject
  ['{FACAE069-6A83-4891-B704-F7150811AF7D}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJSecurityOpt_Stub = class(TJavaGenericImport<JSecurityOpt_StubClass, JSecurityOpt_Stub>) end;

  JSecurityOptClass = interface(JObjectClass)
  ['{341F9AEE-31CE-44E0-A722-9EDC0795F97A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/security/SecurityOpt')]
  JSecurityOpt = interface(IJavaInstance)
  ['{B406C97E-8F02-46D0-9A4B-857210AC3871}']
    { Property Methods }

    { methods }
    function saveKey(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: Integer; P5: Integer; P6: Integer; P7: Boolean): Integer; cdecl;
    function dataEncrypt(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function calcMac(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function getEncryptTUSN(P1: JString; P2: TJavaArray<Byte>): Integer; cdecl;
    function storeSM4Key(P1: TJavaArray<Byte>): Integer; cdecl;
    function encryptDataBySM4Key(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;
    function getSecStatus: Integer; cdecl;
    function verifyApkSign(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;
    function getAuthStatus(P1: Integer): JString; cdecl;
    function getTermStatus: JString; cdecl;
    function setTermStatus: Integer; cdecl;
    function sysRequestAuth(P1: Byte; P2: Integer; P3: JString; P4: TJavaArray<Byte>): Integer; cdecl;
    function sysConfirmAuth(P1: TJavaArray<Byte>): Integer; cdecl;
    function saveTerminalKey(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;
    function readTerminalPuk(P1: TJavaArray<Byte>): Integer; cdecl;
    function getTerminalCertData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;
    function saveBaseKey(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function dataDecrypt(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function saveKeyDukpt(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: Integer; P5: Integer; P6: Integer; P7: Boolean): Integer; cdecl;
    function calcMacDukpt(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function dataEncryptDukpt(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptDukpt(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function calcSecKey(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;
    function sm1EncryptData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl;
    function sm1DecryptData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl;
    function sm2EncryptData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function sm2DecryptData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function sm2SignData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>): Integer; cdecl;
    function sm2VerifySign(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function sm3CalHash(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function sm4EncryptData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function sm4DecryptData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function calcSM4Mac(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJSecurityOpt = class(TJavaGenericImport<JSecurityOptClass, JSecurityOpt>) end;

  JSPErrorCodeClass = interface(JEnumClass) // or JObjectClass
  ['{95E27957-434B-4EA6-999B-C143FABBF15A}']
    { static Property Methods }
    {class} function _GetSUCCESS: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLOSED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTIME_OUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLRC_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEQ_UNMATCH: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINITIALIZING: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREBOOTING: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRECONNECTING: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUSY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSLEEP: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_COPY_FILE_FAILED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_UPGRADING: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_CONN_FAILED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_OPEN_FILE_FAILED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_DATA_PKG_TIMEOUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_DATA_PKG_PROCESS_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_STRING_OVERLONG: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_FAILED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_GET_WRONG_SDK_VERSION: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_GET_SAME_SDK_VERSION: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_QUERY_DEFAULT_INFO_FAILED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_VERSION_NOT_DOWNGRADE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDL_UPGRADE_CANCELED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBI_INPUT_PARAM_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBI_ILLEGAL_DATA_LENGTH: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBI_RSP_DATA_PARSE_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKL_KERNEL_REBOOTED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EPERM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENOENT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ESRCH: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EINTR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EIO: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENXIO: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_E2BIG: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENOEXEC: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EBADF: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ECHILD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EAGAIN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENOMEM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EACCES: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EFAULT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENOTBLK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EBUSY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EEXIST: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EXDEV: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENODEV: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENOTDIR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EISDIR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EINVAL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENFILE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EMFILE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENOTTY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ETXTBSY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EFBIG: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENOSPC: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ESPIPE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EROFS: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EMLINK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EPIPE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_EDOM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ERANGE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_ENOTCONN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_EACK_PARAM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_EACK_OVERFLOW: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ECMD_OVERFLOW: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ECMD_CHECK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ECMD_NOSPACE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ECMD_TIMEOUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ECMD_SEQ: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ECMD_PARAM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ECMD_UNSUPPORT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_UPGRADE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_UPGRADE_SIZE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_UPGRADE_VERIFY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_UPGRADE_NAME: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_UPGRADE_CMD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_UPGRADE_FLASH: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERR_DEVICECODE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBASE_ERROR_SETYPE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAM_COUNT_LENGTH_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDC_UNSUPPORTED_CMD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_PARAM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_NOSUPPORT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_INITFAIL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_ILLEGALYEAR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_ILLEGALMONTH: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_ILLEGALDAY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_ILLEGALHOUR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_ILLEGALMIN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_ILLEGALSEC: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_HARD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYS_ERR_BUFLEN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_ERR_PARAM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_ERR_NOCARD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_MULT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPS_MIFARE_ERR_NACK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPS_MIFARE_ERR_COMM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPS_MIFARE_ERR_AUTHEN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPS_MIFARE_ERR_AUTHE_FAIL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPS_MIFARE_ERR_RESPONSE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPS_MIFARE_ERR_INVAILD_PARAM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPS_MIFARE_ERR_CMAC_CALC_FAIL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPS_MIFARE_ERR_CMAC_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPS_MIFARE_ERR_AES_DECTYPT_FAIL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPS_MIFARE_ERR_AES_ENCRYPT_FAIL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_ERR_DECODE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_MODULE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_CORE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_POWERDWN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_CARRIEROFF: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_TIMEOUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_FIFO: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_FRAME: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_PARITY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_COLL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_PROT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_CRC: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_M1AUTH: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_M1PARAM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_HAL_ERR_CARDEXIST: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEA_ERR_NUMBER: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEA_ERR_ATQA: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEA_ERR_BCC: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEA_ERR_UIDTAG: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEA_ERR_TL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEA_ERR_T0: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEA_ERR_TA1: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEA_ERR_TB1: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEA_ERR_TC1: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEB_ERR_NUMBER: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEB_ERR_ATQB0: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEB_ERR_PTYPE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEB_ERR_CID: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_TYPEB_ERR_HLTB: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_PROTOCOL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_BLOCK_TYPE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_IBLOCK_PROTOCOL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_IBLOCK_ATCHAIN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_IBLOCK_SN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_RBLOCK_PROTOCOL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_RBLOCK_NAK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_RBLOCK_SN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_SBLOCK_PROTOCOL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_SBLOCK_NOWTX: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_SBLOCK_WTX: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_EXCEED_FSD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_IDCARD_GUID: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_USER_CANCEL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLS_ERR_MSR_IC_INTERRUPTED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_HAL_ERR_PARITY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_HAL_ERR_TIMEOUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_HAL_ERR_STEP: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCI_ERR_ATR_DATA: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCI_ERR_COMMU: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCI_ERR_PPS: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCI_ERR_T0_PARAM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCI_ERR_T0_PROB: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCI_ERR_T1_PARAM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCI_ERR_T1_LRC: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCI_ERR_T1_BLOCK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_NO_CARD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_ERROR_CHANNEL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_DEVICE_NOT_OPEN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_INVALID_RESET: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_ADDRESS_OVERFLOW: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_INVALID_POINTER: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_NO_POWER: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_INVALID_VALUE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_VERIFY_PSC_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_INVALID_OPERATION: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMC_SYNC_NACK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_RET_OK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_RET_PARAM_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ROOTKEY_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_LOCKED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_DATA: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KEYINDEX: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KEYFAIL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_NOPIN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_INPUT_CANCEL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_PIN_TIMEOUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_SMALL_INTERVAL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KCV_MODE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KCV_FAIL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KCV_ODD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_NO_MATCH: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KEYTPYE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KEYLEN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_EXPLEN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_DSTKEY_INDEX: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_SRCKEY_INDEX: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_SRCKEY_TYPE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_GROUP_INDEX: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_NULL_PTR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_NOKCV: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_DUKPT_OVERFLOW: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_DUKPT_KEYTYPE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_NEED_ADD_KSN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KEY_USAGE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_MODE_OF_KEY_USE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_NOT_SUPPORT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KEYATTR_NOT_MATCH: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_NO_AUTH: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_CMAC_ENCKEY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_CMAC_MACKEY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_CMAC: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_DATALEN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_ALGBLOCK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_ALG_DES: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_ALG_AES: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_ALG_SM4: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_ALG_SM2: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_ALG_SM3: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_ALG_RSA: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_ALG_HASH: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_POS_PKSK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_PAN_TIMEOUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_OVERNUM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_PWD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KEY_INVALID: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_NEWPWD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_REQ_SSA: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_WAIT_INTERVAL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_KEY_SAME: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_READ: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_WRITE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_VERIFY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_LOST: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_OPEN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_STATUS: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_WRITE_MODE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_INVALID: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_TIMOUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_DELETE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEC_ERR_APKEY_OTHER: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIR_DATA_EXCHANGE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_SELECT_NEXT_APP_MAX_LIMIT_EXCEED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_CVM_REENTER_PIN_LAST: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_CVM_REENTER_PIN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_CVM_STEP_NEXT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_TRY_AGAIN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_SELECT_NEXT_APP: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_ONLINE_REQUEST: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_APPROVE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_OK_CONTINUE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_DECLINED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_TRY_ANOTHER_INTERFACE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_ENDAPPLICATION: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_SEE_PHONE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_FINALSELECT_DATA_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWAVE_GOTO_DRL_FUNCTION: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWAVE_GOTO_SECOND_TAP: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_CMD_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_CMD_TIMEOUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_CMD_SWAB_6985: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_CMD_RSP_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_CARD_BLOCK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_APP_BLOCK: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_TMAPP_EMPTY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_NO_SCAPP: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_DATA_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_DATA_DUPLICATE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_NOT_ACCEPT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_CARD_EXPIRED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_NO_PREPARAM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L1_TIMEOUT_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L1_TRANSMISSION_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L1_PROTOCAL_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_CARD_DATA_MISSING: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_CAM_FAIL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_STATUS_BYTE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_PARSING_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_MAX_LIMIT_EXCEED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_CARD_DATA_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_MAG_NOT_SUPPORT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_NO_PPSE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_PPSE_FAULT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_EMPTY_CAND_LIST: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_IDS_READ_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_IDS_WRITE_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_IDS_DATA_ERRR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_IDS_NO_MATCH_AC: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_TERMINAL_DATA_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L3_TIMEOUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L3_STOP: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L3_AMOUNT_NOT_PRESENT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_REPRESENT_CARD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_OTHER_CARD_WITHRECORD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_OTHER_CARD: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_CMD_RSP_ERR_GPO: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L2_CARD_DATA_FINALSEL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_L3_NO_DET_DATA: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_KERNEL_NOT_SUPPORT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_CLSS_LIMIT_EXCEED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_ZERO_AMOUNT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRY_ANOTHER_INTERFACE_PREPROC: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENDAPPLICATION_SPEEDUP_KERNEL_NOT_SUPPORT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_INVALID_PARAM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_SUM_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PARAM_NOT_EXIST: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_PARAM_DATA_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPBOC_NO_LOG: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPBOC_LOG_DATA_ERR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMV_NO_DATA: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPBOC_NO_LOG_FMT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIR_TWO_PRESENTATIONS: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIR_COMPLETE_TRANS_WITH_EMPTY: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIR_COMPLETE_TRANS_WITH_ODOL: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIR_COMPLETE_TRANS_RESELECT_APP: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIR_READCORD_TRANS_RESELECT_APP: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALG_RET_PARAM_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALG_RET_SEND_SM_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALG_RET_RCV_SM_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALG_ERR_NOGM: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTER_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTER_LOW_VOLTAGE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTER_PAPERLESS: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTER_OVER_TEMPERATURE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTER_DATA_ERROR: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTER_INVALID_PARAMETER: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTER_NOT_OPEN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTER_BUFFER_OVERFLOW: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTER_not_support: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAX_ERR_WRITE: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAX_ERR_READ: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetI2C_SEND_DATA_FAILED: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetI2C_RECV_DATA_TIMEOUT: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JSPErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JSPErrorCode>; cdecl;
    {class} function valueOf(name: JString): JSPErrorCode; cdecl; overload;
    {class} function valueOf(errCode: Integer): JSPErrorCode; cdecl; overload;

    { static Property }
    {class} property SUCCESS: JSPErrorCode read _GetSUCCESS;
    {class} property CLOSED: JSPErrorCode read _GetCLOSED;
    {class} property TIME_OUT: JSPErrorCode read _GetTIME_OUT;
    {class} property LRC_ERROR: JSPErrorCode read _GetLRC_ERROR;
    {class} property SEQ_UNMATCH: JSPErrorCode read _GetSEQ_UNMATCH;
    {class} property INITIALIZING: JSPErrorCode read _GetINITIALIZING;
    {class} property REBOOTING: JSPErrorCode read _GetREBOOTING;
    {class} property RECONNECTING: JSPErrorCode read _GetRECONNECTING;
    {class} property BUSY: JSPErrorCode read _GetBUSY;
    {class} property SLEEP: JSPErrorCode read _GetSLEEP;
    {class} property DL_COPY_FILE_FAILED: JSPErrorCode read _GetDL_COPY_FILE_FAILED;
    {class} property DL_UPGRADING: JSPErrorCode read _GetDL_UPGRADING;
    {class} property DL_CONN_FAILED: JSPErrorCode read _GetDL_CONN_FAILED;
    {class} property DL_OPEN_FILE_FAILED: JSPErrorCode read _GetDL_OPEN_FILE_FAILED;
    {class} property DL_DATA_PKG_TIMEOUT: JSPErrorCode read _GetDL_DATA_PKG_TIMEOUT;
    {class} property DL_DATA_PKG_PROCESS_ERROR: JSPErrorCode read _GetDL_DATA_PKG_PROCESS_ERROR;
    {class} property DL_STRING_OVERLONG: JSPErrorCode read _GetDL_STRING_OVERLONG;
    {class} property DL_FAILED: JSPErrorCode read _GetDL_FAILED;
    {class} property DL_GET_WRONG_SDK_VERSION: JSPErrorCode read _GetDL_GET_WRONG_SDK_VERSION;
    {class} property DL_GET_SAME_SDK_VERSION: JSPErrorCode read _GetDL_GET_SAME_SDK_VERSION;
    {class} property DL_QUERY_DEFAULT_INFO_FAILED: JSPErrorCode read _GetDL_QUERY_DEFAULT_INFO_FAILED;
    {class} property DL_VERSION_NOT_DOWNGRADE: JSPErrorCode read _GetDL_VERSION_NOT_DOWNGRADE;
    {class} property DL_UPGRADE_CANCELED: JSPErrorCode read _GetDL_UPGRADE_CANCELED;
    {class} property BI_INPUT_PARAM_ERROR: JSPErrorCode read _GetBI_INPUT_PARAM_ERROR;
    {class} property BI_ILLEGAL_DATA_LENGTH: JSPErrorCode read _GetBI_ILLEGAL_DATA_LENGTH;
    {class} property BI_RSP_DATA_PARSE_ERROR: JSPErrorCode read _GetBI_RSP_DATA_PARSE_ERROR;
    {class} property KL_KERNEL_REBOOTED: JSPErrorCode read _GetKL_KERNEL_REBOOTED;
    {class} property BASE_ERROR: JSPErrorCode read _GetBASE_ERROR;
    {class} property BASE_ERROR_EPERM: JSPErrorCode read _GetBASE_ERROR_EPERM;
    {class} property BASE_ERROR_ENOENT: JSPErrorCode read _GetBASE_ERROR_ENOENT;
    {class} property BASE_ERROR_ESRCH: JSPErrorCode read _GetBASE_ERROR_ESRCH;
    {class} property BASE_ERROR_EINTR: JSPErrorCode read _GetBASE_ERROR_EINTR;
    {class} property BASE_ERROR_EIO: JSPErrorCode read _GetBASE_ERROR_EIO;
    {class} property BASE_ERROR_ENXIO: JSPErrorCode read _GetBASE_ERROR_ENXIO;
    {class} property BASE_ERROR_E2BIG: JSPErrorCode read _GetBASE_ERROR_E2BIG;
    {class} property BASE_ERROR_ENOEXEC: JSPErrorCode read _GetBASE_ERROR_ENOEXEC;
    {class} property BASE_ERROR_EBADF: JSPErrorCode read _GetBASE_ERROR_EBADF;
    {class} property BASE_ERROR_ECHILD: JSPErrorCode read _GetBASE_ERROR_ECHILD;
    {class} property BASE_ERROR_EAGAIN: JSPErrorCode read _GetBASE_ERROR_EAGAIN;
    {class} property BASE_ERROR_ENOMEM: JSPErrorCode read _GetBASE_ERROR_ENOMEM;
    {class} property BASE_ERROR_EACCES: JSPErrorCode read _GetBASE_ERROR_EACCES;
    {class} property BASE_ERROR_EFAULT: JSPErrorCode read _GetBASE_ERROR_EFAULT;
    {class} property BASE_ERROR_ENOTBLK: JSPErrorCode read _GetBASE_ERROR_ENOTBLK;
    {class} property BASE_ERROR_EBUSY: JSPErrorCode read _GetBASE_ERROR_EBUSY;
    {class} property BASE_ERROR_EEXIST: JSPErrorCode read _GetBASE_ERROR_EEXIST;
    {class} property BASE_ERROR_EXDEV: JSPErrorCode read _GetBASE_ERROR_EXDEV;
    {class} property BASE_ERROR_ENODEV: JSPErrorCode read _GetBASE_ERROR_ENODEV;
    {class} property BASE_ERROR_ENOTDIR: JSPErrorCode read _GetBASE_ERROR_ENOTDIR;
    {class} property BASE_ERROR_EISDIR: JSPErrorCode read _GetBASE_ERROR_EISDIR;
    {class} property BASE_ERROR_EINVAL: JSPErrorCode read _GetBASE_ERROR_EINVAL;
    {class} property BASE_ERROR_ENFILE: JSPErrorCode read _GetBASE_ERROR_ENFILE;
    {class} property BASE_ERROR_EMFILE: JSPErrorCode read _GetBASE_ERROR_EMFILE;
    {class} property BASE_ERROR_ENOTTY: JSPErrorCode read _GetBASE_ERROR_ENOTTY;
    {class} property BASE_ERROR_ETXTBSY: JSPErrorCode read _GetBASE_ERROR_ETXTBSY;
    {class} property BASE_ERROR_EFBIG: JSPErrorCode read _GetBASE_ERROR_EFBIG;
    {class} property BASE_ERROR_ENOSPC: JSPErrorCode read _GetBASE_ERROR_ENOSPC;
    {class} property BASE_ERROR_ESPIPE: JSPErrorCode read _GetBASE_ERROR_ESPIPE;
    {class} property BASE_ERROR_EROFS: JSPErrorCode read _GetBASE_ERROR_EROFS;
    {class} property BASE_ERROR_EMLINK: JSPErrorCode read _GetBASE_ERROR_EMLINK;
    {class} property BASE_ERROR_EPIPE: JSPErrorCode read _GetBASE_ERROR_EPIPE;
    {class} property BASE_ERROR_EDOM: JSPErrorCode read _GetBASE_ERROR_EDOM;
    {class} property BASE_ERROR_ERANGE: JSPErrorCode read _GetBASE_ERROR_ERANGE;
    {class} property BASE_ERROR_ENOTCONN: JSPErrorCode read _GetBASE_ERROR_ENOTCONN;
    {class} property BASE_EACK_PARAM: JSPErrorCode read _GetBASE_EACK_PARAM;
    {class} property BASE_EACK_OVERFLOW: JSPErrorCode read _GetBASE_EACK_OVERFLOW;
    {class} property BASE_ECMD_OVERFLOW: JSPErrorCode read _GetBASE_ECMD_OVERFLOW;
    {class} property BASE_ECMD_CHECK: JSPErrorCode read _GetBASE_ECMD_CHECK;
    {class} property BASE_ECMD_NOSPACE: JSPErrorCode read _GetBASE_ECMD_NOSPACE;
    {class} property BASE_ECMD_TIMEOUT: JSPErrorCode read _GetBASE_ECMD_TIMEOUT;
    {class} property BASE_ECMD_SEQ: JSPErrorCode read _GetBASE_ECMD_SEQ;
    {class} property BASE_ECMD_PARAM: JSPErrorCode read _GetBASE_ECMD_PARAM;
    {class} property BASE_ECMD_UNSUPPORT: JSPErrorCode read _GetBASE_ECMD_UNSUPPORT;
    {class} property BASE_ERROR_UPGRADE: JSPErrorCode read _GetBASE_ERROR_UPGRADE;
    {class} property BASE_UPGRADE_SIZE: JSPErrorCode read _GetBASE_UPGRADE_SIZE;
    {class} property BASE_UPGRADE_VERIFY: JSPErrorCode read _GetBASE_UPGRADE_VERIFY;
    {class} property BASE_UPGRADE_NAME: JSPErrorCode read _GetBASE_UPGRADE_NAME;
    {class} property BASE_UPGRADE_CMD: JSPErrorCode read _GetBASE_UPGRADE_CMD;
    {class} property BASE_UPGRADE_FLASH: JSPErrorCode read _GetBASE_UPGRADE_FLASH;
    {class} property BASE_ERR_DEVICECODE: JSPErrorCode read _GetBASE_ERR_DEVICECODE;
    {class} property BASE_ERROR_SETYPE: JSPErrorCode read _GetBASE_ERROR_SETYPE;
    {class} property PARAM_COUNT_LENGTH_ERR: JSPErrorCode read _GetPARAM_COUNT_LENGTH_ERR;
    {class} property DC_UNSUPPORTED_CMD: JSPErrorCode read _GetDC_UNSUPPORTED_CMD;
    {class} property SYS_ERR_PARAM: JSPErrorCode read _GetSYS_ERR_PARAM;
    {class} property SYS_ERR_NOSUPPORT: JSPErrorCode read _GetSYS_ERR_NOSUPPORT;
    {class} property SYS_ERR_INITFAIL: JSPErrorCode read _GetSYS_ERR_INITFAIL;
    {class} property SYS_ERR_ILLEGALYEAR: JSPErrorCode read _GetSYS_ERR_ILLEGALYEAR;
    {class} property SYS_ERR_ILLEGALMONTH: JSPErrorCode read _GetSYS_ERR_ILLEGALMONTH;
    {class} property SYS_ERR_ILLEGALDAY: JSPErrorCode read _GetSYS_ERR_ILLEGALDAY;
    {class} property SYS_ERR_ILLEGALHOUR: JSPErrorCode read _GetSYS_ERR_ILLEGALHOUR;
    {class} property SYS_ERR_ILLEGALMIN: JSPErrorCode read _GetSYS_ERR_ILLEGALMIN;
    {class} property SYS_ERR_ILLEGALSEC: JSPErrorCode read _GetSYS_ERR_ILLEGALSEC;
    {class} property SYS_ERR_HARD: JSPErrorCode read _GetSYS_ERR_HARD;
    {class} property SYS_ERR_BUFLEN: JSPErrorCode read _GetSYS_ERR_BUFLEN;
    {class} property CARD_ERR_PARAM: JSPErrorCode read _GetCARD_ERR_PARAM;
    {class} property CARD_ERR_NOCARD: JSPErrorCode read _GetCARD_ERR_NOCARD;
    {class} property CLS_ERR_MULT: JSPErrorCode read _GetCLS_ERR_MULT;
    {class} property PHILIPS_MIFARE_ERR_NACK: JSPErrorCode read _GetPHILIPS_MIFARE_ERR_NACK;
    {class} property PHILIPS_MIFARE_ERR_COMM: JSPErrorCode read _GetPHILIPS_MIFARE_ERR_COMM;
    {class} property PHILIPS_MIFARE_ERR_AUTHEN: JSPErrorCode read _GetPHILIPS_MIFARE_ERR_AUTHEN;
    {class} property PHILIPS_MIFARE_ERR_AUTHE_FAIL: JSPErrorCode read _GetPHILIPS_MIFARE_ERR_AUTHE_FAIL;
    {class} property PHILIPS_MIFARE_ERR_RESPONSE: JSPErrorCode read _GetPHILIPS_MIFARE_ERR_RESPONSE;
    {class} property PHILIPS_MIFARE_ERR_INVAILD_PARAM: JSPErrorCode read _GetPHILIPS_MIFARE_ERR_INVAILD_PARAM;
    {class} property PHILIPS_MIFARE_ERR_CMAC_CALC_FAIL: JSPErrorCode read _GetPHILIPS_MIFARE_ERR_CMAC_CALC_FAIL;
    {class} property PHILIPS_MIFARE_ERR_CMAC_ERR: JSPErrorCode read _GetPHILIPS_MIFARE_ERR_CMAC_ERR;
    {class} property PHILIPS_MIFARE_ERR_AES_DECTYPT_FAIL: JSPErrorCode read _GetPHILIPS_MIFARE_ERR_AES_DECTYPT_FAIL;
    {class} property PHILIPS_MIFARE_ERR_AES_ENCRYPT_FAIL: JSPErrorCode read _GetPHILIPS_MIFARE_ERR_AES_ENCRYPT_FAIL;
    {class} property CARD_ERR_DECODE: JSPErrorCode read _GetCARD_ERR_DECODE;
    {class} property CLS_HAL_ERR_MODULE: JSPErrorCode read _GetCLS_HAL_ERR_MODULE;
    {class} property CLS_HAL_ERR_CORE: JSPErrorCode read _GetCLS_HAL_ERR_CORE;
    {class} property CLS_HAL_ERR_POWERDWN: JSPErrorCode read _GetCLS_HAL_ERR_POWERDWN;
    {class} property CLS_HAL_ERR_CARRIEROFF: JSPErrorCode read _GetCLS_HAL_ERR_CARRIEROFF;
    {class} property CLS_HAL_ERR_TIMEOUT: JSPErrorCode read _GetCLS_HAL_ERR_TIMEOUT;
    {class} property CLS_HAL_ERR_FIFO: JSPErrorCode read _GetCLS_HAL_ERR_FIFO;
    {class} property CLS_HAL_ERR_FRAME: JSPErrorCode read _GetCLS_HAL_ERR_FRAME;
    {class} property CLS_HAL_ERR_PARITY: JSPErrorCode read _GetCLS_HAL_ERR_PARITY;
    {class} property CLS_HAL_ERR_COLL: JSPErrorCode read _GetCLS_HAL_ERR_COLL;
    {class} property CLS_HAL_ERR_PROT: JSPErrorCode read _GetCLS_HAL_ERR_PROT;
    {class} property CLS_HAL_ERR_CRC: JSPErrorCode read _GetCLS_HAL_ERR_CRC;
    {class} property CLS_HAL_ERR_M1AUTH: JSPErrorCode read _GetCLS_HAL_ERR_M1AUTH;
    {class} property CLS_HAL_ERR_M1PARAM: JSPErrorCode read _GetCLS_HAL_ERR_M1PARAM;
    {class} property CLS_HAL_ERR_CARDEXIST: JSPErrorCode read _GetCLS_HAL_ERR_CARDEXIST;
    {class} property CLS_TYPEA_ERR_NUMBER: JSPErrorCode read _GetCLS_TYPEA_ERR_NUMBER;
    {class} property CLS_TYPEA_ERR_ATQA: JSPErrorCode read _GetCLS_TYPEA_ERR_ATQA;
    {class} property CLS_TYPEA_ERR_BCC: JSPErrorCode read _GetCLS_TYPEA_ERR_BCC;
    {class} property CLS_TYPEA_ERR_UIDTAG: JSPErrorCode read _GetCLS_TYPEA_ERR_UIDTAG;
    {class} property CLS_TYPEA_ERR_TL: JSPErrorCode read _GetCLS_TYPEA_ERR_TL;
    {class} property CLS_TYPEA_ERR_T0: JSPErrorCode read _GetCLS_TYPEA_ERR_T0;
    {class} property CLS_TYPEA_ERR_TA1: JSPErrorCode read _GetCLS_TYPEA_ERR_TA1;
    {class} property CLS_TYPEA_ERR_TB1: JSPErrorCode read _GetCLS_TYPEA_ERR_TB1;
    {class} property CLS_TYPEA_ERR_TC1: JSPErrorCode read _GetCLS_TYPEA_ERR_TC1;
    {class} property CLS_TYPEB_ERR_NUMBER: JSPErrorCode read _GetCLS_TYPEB_ERR_NUMBER;
    {class} property CLS_TYPEB_ERR_ATQB0: JSPErrorCode read _GetCLS_TYPEB_ERR_ATQB0;
    {class} property CLS_TYPEB_ERR_PTYPE: JSPErrorCode read _GetCLS_TYPEB_ERR_PTYPE;
    {class} property CLS_TYPEB_ERR_CID: JSPErrorCode read _GetCLS_TYPEB_ERR_CID;
    {class} property CLS_TYPEB_ERR_HLTB: JSPErrorCode read _GetCLS_TYPEB_ERR_HLTB;
    {class} property CLS_ERR_PROTOCOL: JSPErrorCode read _GetCLS_ERR_PROTOCOL;
    {class} property CLS_ERR_BLOCK_TYPE: JSPErrorCode read _GetCLS_ERR_BLOCK_TYPE;
    {class} property CLS_ERR_IBLOCK_PROTOCOL: JSPErrorCode read _GetCLS_ERR_IBLOCK_PROTOCOL;
    {class} property CLS_ERR_IBLOCK_ATCHAIN: JSPErrorCode read _GetCLS_ERR_IBLOCK_ATCHAIN;
    {class} property CLS_ERR_IBLOCK_SN: JSPErrorCode read _GetCLS_ERR_IBLOCK_SN;
    {class} property CLS_ERR_RBLOCK_PROTOCOL: JSPErrorCode read _GetCLS_ERR_RBLOCK_PROTOCOL;
    {class} property CLS_ERR_RBLOCK_NAK: JSPErrorCode read _GetCLS_ERR_RBLOCK_NAK;
    {class} property CLS_ERR_RBLOCK_SN: JSPErrorCode read _GetCLS_ERR_RBLOCK_SN;
    {class} property CLS_ERR_SBLOCK_PROTOCOL: JSPErrorCode read _GetCLS_ERR_SBLOCK_PROTOCOL;
    {class} property CLS_ERR_SBLOCK_NOWTX: JSPErrorCode read _GetCLS_ERR_SBLOCK_NOWTX;
    {class} property CLS_ERR_SBLOCK_WTX: JSPErrorCode read _GetCLS_ERR_SBLOCK_WTX;
    {class} property CLS_ERR_EXCEED_FSD: JSPErrorCode read _GetCLS_ERR_EXCEED_FSD;
    {class} property CLS_ERR_IDCARD_GUID: JSPErrorCode read _GetCLS_ERR_IDCARD_GUID;
    {class} property CLS_ERR_USER_CANCEL: JSPErrorCode read _GetCLS_ERR_USER_CANCEL;
    {class} property CLS_ERR_MSR_IC_INTERRUPTED: JSPErrorCode read _GetCLS_ERR_MSR_IC_INTERRUPTED;
    {class} property SMC_HAL_ERR_PARITY: JSPErrorCode read _GetSMC_HAL_ERR_PARITY;
    {class} property SMC_HAL_ERR_TIMEOUT: JSPErrorCode read _GetSMC_HAL_ERR_TIMEOUT;
    {class} property SMC_HAL_ERR_STEP: JSPErrorCode read _GetSMC_HAL_ERR_STEP;
    {class} property SCI_ERR_ATR_DATA: JSPErrorCode read _GetSCI_ERR_ATR_DATA;
    {class} property SCI_ERR_COMMU: JSPErrorCode read _GetSCI_ERR_COMMU;
    {class} property SCI_ERR_PPS: JSPErrorCode read _GetSCI_ERR_PPS;
    {class} property SCI_ERR_T0_PARAM: JSPErrorCode read _GetSCI_ERR_T0_PARAM;
    {class} property SCI_ERR_T0_PROB: JSPErrorCode read _GetSCI_ERR_T0_PROB;
    {class} property SCI_ERR_T1_PARAM: JSPErrorCode read _GetSCI_ERR_T1_PARAM;
    {class} property SCI_ERR_T1_LRC: JSPErrorCode read _GetSCI_ERR_T1_LRC;
    {class} property SCI_ERR_T1_BLOCK: JSPErrorCode read _GetSCI_ERR_T1_BLOCK;
    {class} property SMC_SYNC_NO_CARD: JSPErrorCode read _GetSMC_SYNC_NO_CARD;
    {class} property SMC_SYNC_ERROR_CHANNEL: JSPErrorCode read _GetSMC_SYNC_ERROR_CHANNEL;
    {class} property SMC_SYNC_DEVICE_NOT_OPEN: JSPErrorCode read _GetSMC_SYNC_DEVICE_NOT_OPEN;
    {class} property SMC_SYNC_INVALID_RESET: JSPErrorCode read _GetSMC_SYNC_INVALID_RESET;
    {class} property SMC_SYNC_ADDRESS_OVERFLOW: JSPErrorCode read _GetSMC_SYNC_ADDRESS_OVERFLOW;
    {class} property SMC_SYNC_INVALID_POINTER: JSPErrorCode read _GetSMC_SYNC_INVALID_POINTER;
    {class} property SMC_SYNC_NO_POWER: JSPErrorCode read _GetSMC_SYNC_NO_POWER;
    {class} property SMC_SYNC_INVALID_VALUE: JSPErrorCode read _GetSMC_SYNC_INVALID_VALUE;
    {class} property SMC_SYNC_VERIFY_PSC_ERROR: JSPErrorCode read _GetSMC_SYNC_VERIFY_PSC_ERROR;
    {class} property SMC_SYNC_INVALID_OPERATION: JSPErrorCode read _GetSMC_SYNC_INVALID_OPERATION;
    {class} property SMC_SYNC_NACK: JSPErrorCode read _GetSMC_SYNC_NACK;
    {class} property SEC_RET_OK: JSPErrorCode read _GetSEC_RET_OK;
    {class} property SEC_RET_PARAM_ERROR: JSPErrorCode read _GetSEC_RET_PARAM_ERROR;
    {class} property SEC_ROOTKEY_ERROR: JSPErrorCode read _GetSEC_ROOTKEY_ERROR;
    {class} property SEC_ERR_LOCKED: JSPErrorCode read _GetSEC_ERR_LOCKED;
    {class} property SEC_ERR_DATA: JSPErrorCode read _GetSEC_ERR_DATA;
    {class} property SEC_ERR_KEYINDEX: JSPErrorCode read _GetSEC_ERR_KEYINDEX;
    {class} property SEC_ERR_KEYFAIL: JSPErrorCode read _GetSEC_ERR_KEYFAIL;
    {class} property SEC_ERR_NOPIN: JSPErrorCode read _GetSEC_ERR_NOPIN;
    {class} property SEC_ERR_INPUT_CANCEL: JSPErrorCode read _GetSEC_ERR_INPUT_CANCEL;
    {class} property SEC_ERR_PIN_TIMEOUT: JSPErrorCode read _GetSEC_ERR_PIN_TIMEOUT;
    {class} property SEC_ERR_SMALL_INTERVAL: JSPErrorCode read _GetSEC_ERR_SMALL_INTERVAL;
    {class} property SEC_ERR_KCV_MODE: JSPErrorCode read _GetSEC_ERR_KCV_MODE;
    {class} property SEC_ERR_KCV_FAIL: JSPErrorCode read _GetSEC_ERR_KCV_FAIL;
    {class} property SEC_ERR_KCV_ODD: JSPErrorCode read _GetSEC_ERR_KCV_ODD;
    {class} property SEC_ERR_NO_MATCH: JSPErrorCode read _GetSEC_ERR_NO_MATCH;
    {class} property SEC_ERR_KEYTPYE: JSPErrorCode read _GetSEC_ERR_KEYTPYE;
    {class} property SEC_ERR_KEYLEN: JSPErrorCode read _GetSEC_ERR_KEYLEN;
    {class} property SEC_ERR_EXPLEN: JSPErrorCode read _GetSEC_ERR_EXPLEN;
    {class} property SEC_ERR_DSTKEY_INDEX: JSPErrorCode read _GetSEC_ERR_DSTKEY_INDEX;
    {class} property SEC_ERR_SRCKEY_INDEX: JSPErrorCode read _GetSEC_ERR_SRCKEY_INDEX;
    {class} property SEC_ERR_SRCKEY_TYPE: JSPErrorCode read _GetSEC_ERR_SRCKEY_TYPE;
    {class} property SEC_ERR_GROUP_INDEX: JSPErrorCode read _GetSEC_ERR_GROUP_INDEX;
    {class} property SEC_ERR_NULL_PTR: JSPErrorCode read _GetSEC_ERR_NULL_PTR;
    {class} property SEC_ERR_NOKCV: JSPErrorCode read _GetSEC_ERR_NOKCV;
    {class} property SEC_ERR_DUKPT_OVERFLOW: JSPErrorCode read _GetSEC_ERR_DUKPT_OVERFLOW;
    {class} property SEC_ERR_DUKPT_KEYTYPE: JSPErrorCode read _GetSEC_ERR_DUKPT_KEYTYPE;
    {class} property SEC_ERR_NEED_ADD_KSN: JSPErrorCode read _GetSEC_ERR_NEED_ADD_KSN;
    {class} property SEC_ERR_KEY_USAGE: JSPErrorCode read _GetSEC_ERR_KEY_USAGE;
    {class} property SEC_ERR_MODE_OF_KEY_USE: JSPErrorCode read _GetSEC_ERR_MODE_OF_KEY_USE;
    {class} property SEC_ERR_NOT_SUPPORT: JSPErrorCode read _GetSEC_ERR_NOT_SUPPORT;
    {class} property SEC_ERR_KEYATTR_NOT_MATCH: JSPErrorCode read _GetSEC_ERR_KEYATTR_NOT_MATCH;
    {class} property SEC_ERR_NO_AUTH: JSPErrorCode read _GetSEC_ERR_NO_AUTH;
    {class} property SEC_ERR_CMAC_ENCKEY: JSPErrorCode read _GetSEC_ERR_CMAC_ENCKEY;
    {class} property SEC_ERR_CMAC_MACKEY: JSPErrorCode read _GetSEC_ERR_CMAC_MACKEY;
    {class} property SEC_ERR_CMAC: JSPErrorCode read _GetSEC_ERR_CMAC;
    {class} property SEC_ERR_DATALEN: JSPErrorCode read _GetSEC_ERR_DATALEN;
    {class} property SEC_ERR_ALGBLOCK: JSPErrorCode read _GetSEC_ERR_ALGBLOCK;
    {class} property SEC_ERR_ALG_DES: JSPErrorCode read _GetSEC_ERR_ALG_DES;
    {class} property SEC_ERR_ALG_AES: JSPErrorCode read _GetSEC_ERR_ALG_AES;
    {class} property SEC_ERR_ALG_SM4: JSPErrorCode read _GetSEC_ERR_ALG_SM4;
    {class} property SEC_ERR_ALG_SM2: JSPErrorCode read _GetSEC_ERR_ALG_SM2;
    {class} property SEC_ERR_ALG_SM3: JSPErrorCode read _GetSEC_ERR_ALG_SM3;
    {class} property SEC_ERR_ALG_RSA: JSPErrorCode read _GetSEC_ERR_ALG_RSA;
    {class} property SEC_ERR_ALG_HASH: JSPErrorCode read _GetSEC_ERR_ALG_HASH;
    {class} property SEC_ERR_POS_PKSK: JSPErrorCode read _GetSEC_ERR_POS_PKSK;
    {class} property SEC_ERR_PAN_TIMEOUT: JSPErrorCode read _GetSEC_ERR_PAN_TIMEOUT;
    {class} property SEC_ERR_OVERNUM: JSPErrorCode read _GetSEC_ERR_OVERNUM;
    {class} property SEC_ERR_PWD: JSPErrorCode read _GetSEC_ERR_PWD;
    {class} property SEC_ERR_KEY_INVALID: JSPErrorCode read _GetSEC_ERR_KEY_INVALID;
    {class} property SEC_ERR_NEWPWD: JSPErrorCode read _GetSEC_ERR_NEWPWD;
    {class} property SEC_ERR_REQ_SSA: JSPErrorCode read _GetSEC_ERR_REQ_SSA;
    {class} property SEC_ERR_WAIT_INTERVAL: JSPErrorCode read _GetSEC_ERR_WAIT_INTERVAL;
    {class} property SEC_ERR_KEY_SAME: JSPErrorCode read _GetSEC_ERR_KEY_SAME;
    {class} property SEC_ERR_APKEY_READ: JSPErrorCode read _GetSEC_ERR_APKEY_READ;
    {class} property SEC_ERR_APKEY_WRITE: JSPErrorCode read _GetSEC_ERR_APKEY_WRITE;
    {class} property SEC_ERR_APKEY_VERIFY: JSPErrorCode read _GetSEC_ERR_APKEY_VERIFY;
    {class} property SEC_ERR_APKEY_LOST: JSPErrorCode read _GetSEC_ERR_APKEY_LOST;
    {class} property SEC_ERR_APKEY_OPEN: JSPErrorCode read _GetSEC_ERR_APKEY_OPEN;
    {class} property SEC_ERR_APKEY_STATUS: JSPErrorCode read _GetSEC_ERR_APKEY_STATUS;
    {class} property SEC_ERR_APKEY_WRITE_MODE: JSPErrorCode read _GetSEC_ERR_APKEY_WRITE_MODE;
    {class} property SEC_ERR_APKEY_INVALID: JSPErrorCode read _GetSEC_ERR_APKEY_INVALID;
    {class} property SEC_ERR_APKEY_TIMOUT: JSPErrorCode read _GetSEC_ERR_APKEY_TIMOUT;
    {class} property SEC_ERR_APKEY_DELETE: JSPErrorCode read _GetSEC_ERR_APKEY_DELETE;
    {class} property SEC_ERR_APKEY_OTHER: JSPErrorCode read _GetSEC_ERR_APKEY_OTHER;
    {class} property MIR_DATA_EXCHANGE: JSPErrorCode read _GetMIR_DATA_EXCHANGE;
    {class} property EMV_SELECT_NEXT_APP_MAX_LIMIT_EXCEED: JSPErrorCode read _GetEMV_SELECT_NEXT_APP_MAX_LIMIT_EXCEED;
    {class} property EMV_CVM_REENTER_PIN_LAST: JSPErrorCode read _GetEMV_CVM_REENTER_PIN_LAST;
    {class} property EMV_CVM_REENTER_PIN: JSPErrorCode read _GetEMV_CVM_REENTER_PIN;
    {class} property EMV_CVM_STEP_NEXT: JSPErrorCode read _GetEMV_CVM_STEP_NEXT;
    {class} property EMV_TRY_AGAIN: JSPErrorCode read _GetEMV_TRY_AGAIN;
    {class} property EMV_SELECT_NEXT_APP: JSPErrorCode read _GetEMV_SELECT_NEXT_APP;
    {class} property EMV_ONLINE_REQUEST: JSPErrorCode read _GetEMV_ONLINE_REQUEST;
    {class} property EMV_APPROVE: JSPErrorCode read _GetEMV_APPROVE;
    {class} property EMV_OK_CONTINUE: JSPErrorCode read _GetEMV_OK_CONTINUE;
    {class} property EMV_DECLINED: JSPErrorCode read _GetEMV_DECLINED;
    {class} property EMV_TRY_ANOTHER_INTERFACE: JSPErrorCode read _GetEMV_TRY_ANOTHER_INTERFACE;
    {class} property EMV_ENDAPPLICATION: JSPErrorCode read _GetEMV_ENDAPPLICATION;
    {class} property EMV_SEE_PHONE: JSPErrorCode read _GetEMV_SEE_PHONE;
    {class} property EMV_FINALSELECT_DATA_ERR: JSPErrorCode read _GetEMV_FINALSELECT_DATA_ERR;
    {class} property WAVE_GOTO_DRL_FUNCTION: JSPErrorCode read _GetWAVE_GOTO_DRL_FUNCTION;
    {class} property WAVE_GOTO_SECOND_TAP: JSPErrorCode read _GetWAVE_GOTO_SECOND_TAP;
    {class} property ENDAPPLICATION_CMD_ERR: JSPErrorCode read _GetENDAPPLICATION_CMD_ERR;
    {class} property ENDAPPLICATION_CMD_TIMEOUT: JSPErrorCode read _GetENDAPPLICATION_CMD_TIMEOUT;
    {class} property ENDAPPLICATION_CMD_SWAB_6985: JSPErrorCode read _GetENDAPPLICATION_CMD_SWAB_6985;
    {class} property ENDAPPLICATION_CMD_RSP_ERR: JSPErrorCode read _GetENDAPPLICATION_CMD_RSP_ERR;
    {class} property ENDAPPLICATION_CARD_BLOCK: JSPErrorCode read _GetENDAPPLICATION_CARD_BLOCK;
    {class} property ENDAPPLICATION_APP_BLOCK: JSPErrorCode read _GetENDAPPLICATION_APP_BLOCK;
    {class} property ENDAPPLICATION_TMAPP_EMPTY: JSPErrorCode read _GetENDAPPLICATION_TMAPP_EMPTY;
    {class} property ENDAPPLICATION_NO_SCAPP: JSPErrorCode read _GetENDAPPLICATION_NO_SCAPP;
    {class} property ENDAPPLICATION_DATA_ERR: JSPErrorCode read _GetENDAPPLICATION_DATA_ERR;
    {class} property ENDAPPLICATION_DATA_DUPLICATE: JSPErrorCode read _GetENDAPPLICATION_DATA_DUPLICATE;
    {class} property ENDAPPLICATION_NOT_ACCEPT: JSPErrorCode read _GetENDAPPLICATION_NOT_ACCEPT;
    {class} property ENDAPPLICATION_CARD_EXPIRED: JSPErrorCode read _GetENDAPPLICATION_CARD_EXPIRED;
    {class} property EMV_NO_PREPARAM: JSPErrorCode read _GetEMV_NO_PREPARAM;
    {class} property ENDAPPLICATION_L1_TIMEOUT_ERR: JSPErrorCode read _GetENDAPPLICATION_L1_TIMEOUT_ERR;
    {class} property ENDAPPLICATION_L1_TRANSMISSION_ERR: JSPErrorCode read _GetENDAPPLICATION_L1_TRANSMISSION_ERR;
    {class} property ENDAPPLICATION_L1_PROTOCAL_ERR: JSPErrorCode read _GetENDAPPLICATION_L1_PROTOCAL_ERR;
    {class} property ENDAPPLICATION_L2_CARD_DATA_MISSING: JSPErrorCode read _GetENDAPPLICATION_L2_CARD_DATA_MISSING;
    {class} property ENDAPPLICATION_L2_CAM_FAIL: JSPErrorCode read _GetENDAPPLICATION_L2_CAM_FAIL;
    {class} property ENDAPPLICATION_L2_STATUS_BYTE: JSPErrorCode read _GetENDAPPLICATION_L2_STATUS_BYTE;
    {class} property ENDAPPLICATION_L2_PARSING_ERR: JSPErrorCode read _GetENDAPPLICATION_L2_PARSING_ERR;
    {class} property ENDAPPLICATION_L2_MAX_LIMIT_EXCEED: JSPErrorCode read _GetENDAPPLICATION_L2_MAX_LIMIT_EXCEED;
    {class} property ENDAPPLICATION_L2_CARD_DATA_ERR: JSPErrorCode read _GetENDAPPLICATION_L2_CARD_DATA_ERR;
    {class} property ENDAPPLICATION_L2_MAG_NOT_SUPPORT: JSPErrorCode read _GetENDAPPLICATION_L2_MAG_NOT_SUPPORT;
    {class} property ENDAPPLICATION_L2_NO_PPSE: JSPErrorCode read _GetENDAPPLICATION_L2_NO_PPSE;
    {class} property ENDAPPLICATION_L2_PPSE_FAULT: JSPErrorCode read _GetENDAPPLICATION_L2_PPSE_FAULT;
    {class} property ENDAPPLICATION_L2_EMPTY_CAND_LIST: JSPErrorCode read _GetENDAPPLICATION_L2_EMPTY_CAND_LIST;
    {class} property ENDAPPLICATION_L2_IDS_READ_ERR: JSPErrorCode read _GetENDAPPLICATION_L2_IDS_READ_ERR;
    {class} property ENDAPPLICATION_L2_IDS_WRITE_ERR: JSPErrorCode read _GetENDAPPLICATION_L2_IDS_WRITE_ERR;
    {class} property ENDAPPLICATION_L2_IDS_DATA_ERRR: JSPErrorCode read _GetENDAPPLICATION_L2_IDS_DATA_ERRR;
    {class} property ENDAPPLICATION_L2_IDS_NO_MATCH_AC: JSPErrorCode read _GetENDAPPLICATION_L2_IDS_NO_MATCH_AC;
    {class} property ENDAPPLICATION_L2_TERMINAL_DATA_ERR: JSPErrorCode read _GetENDAPPLICATION_L2_TERMINAL_DATA_ERR;
    {class} property ENDAPPLICATION_L3_TIMEOUT: JSPErrorCode read _GetENDAPPLICATION_L3_TIMEOUT;
    {class} property ENDAPPLICATION_L3_STOP: JSPErrorCode read _GetENDAPPLICATION_L3_STOP;
    {class} property ENDAPPLICATION_L3_AMOUNT_NOT_PRESENT: JSPErrorCode read _GetENDAPPLICATION_L3_AMOUNT_NOT_PRESENT;
    {class} property ENDAPPLICATION_REPRESENT_CARD: JSPErrorCode read _GetENDAPPLICATION_REPRESENT_CARD;
    {class} property ENDAPPLICATION_OTHER_CARD_WITHRECORD: JSPErrorCode read _GetENDAPPLICATION_OTHER_CARD_WITHRECORD;
    {class} property ENDAPPLICATION_OTHER_CARD: JSPErrorCode read _GetENDAPPLICATION_OTHER_CARD;
    {class} property ENDAPPLICATION_CMD_RSP_ERR_GPO: JSPErrorCode read _GetENDAPPLICATION_CMD_RSP_ERR_GPO;
    {class} property ENDAPPLICATION_L2_CARD_DATA_FINALSEL: JSPErrorCode read _GetENDAPPLICATION_L2_CARD_DATA_FINALSEL;
    {class} property ENDAPPLICATION_L3_NO_DET_DATA: JSPErrorCode read _GetENDAPPLICATION_L3_NO_DET_DATA;
    {class} property ENDAPPLICATION_KERNEL_NOT_SUPPORT: JSPErrorCode read _GetENDAPPLICATION_KERNEL_NOT_SUPPORT;
    {class} property ENDAPPLICATION_CLSS_LIMIT_EXCEED: JSPErrorCode read _GetENDAPPLICATION_CLSS_LIMIT_EXCEED;
    {class} property ENDAPPLICATION_ZERO_AMOUNT: JSPErrorCode read _GetENDAPPLICATION_ZERO_AMOUNT;
    {class} property TRY_ANOTHER_INTERFACE_PREPROC: JSPErrorCode read _GetTRY_ANOTHER_INTERFACE_PREPROC;
    {class} property ENDAPPLICATION_SPEEDUP_KERNEL_NOT_SUPPORT: JSPErrorCode read _GetENDAPPLICATION_SPEEDUP_KERNEL_NOT_SUPPORT;
    {class} property EMV_INVALID_PARAM: JSPErrorCode read _GetEMV_INVALID_PARAM;
    {class} property EMV_SUM_ERR: JSPErrorCode read _GetEMV_SUM_ERR;
    {class} property EMV_PARAM_NOT_EXIST: JSPErrorCode read _GetEMV_PARAM_NOT_EXIST;
    {class} property EMV_PARAM_DATA_ERROR: JSPErrorCode read _GetEMV_PARAM_DATA_ERROR;
    {class} property PBOC_NO_LOG: JSPErrorCode read _GetPBOC_NO_LOG;
    {class} property PBOC_LOG_DATA_ERR: JSPErrorCode read _GetPBOC_LOG_DATA_ERR;
    {class} property EMV_NO_DATA: JSPErrorCode read _GetEMV_NO_DATA;
    {class} property PBOC_NO_LOG_FMT: JSPErrorCode read _GetPBOC_NO_LOG_FMT;
    {class} property MIR_TWO_PRESENTATIONS: JSPErrorCode read _GetMIR_TWO_PRESENTATIONS;
    {class} property MIR_COMPLETE_TRANS_WITH_EMPTY: JSPErrorCode read _GetMIR_COMPLETE_TRANS_WITH_EMPTY;
    {class} property MIR_COMPLETE_TRANS_WITH_ODOL: JSPErrorCode read _GetMIR_COMPLETE_TRANS_WITH_ODOL;
    {class} property MIR_COMPLETE_TRANS_RESELECT_APP: JSPErrorCode read _GetMIR_COMPLETE_TRANS_RESELECT_APP;
    {class} property MIR_READCORD_TRANS_RESELECT_APP: JSPErrorCode read _GetMIR_READCORD_TRANS_RESELECT_APP;
    {class} property ALG_RET_PARAM_ERROR: JSPErrorCode read _GetALG_RET_PARAM_ERROR;
    {class} property ALG_RET_SEND_SM_ERROR: JSPErrorCode read _GetALG_RET_SEND_SM_ERROR;
    {class} property ALG_RET_RCV_SM_ERROR: JSPErrorCode read _GetALG_RET_RCV_SM_ERROR;
    {class} property ALG_ERR_NOGM: JSPErrorCode read _GetALG_ERR_NOGM;
    {class} property PRINTER_ERROR: JSPErrorCode read _GetPRINTER_ERROR;
    {class} property PRINTER_LOW_VOLTAGE: JSPErrorCode read _GetPRINTER_LOW_VOLTAGE;
    {class} property PRINTER_PAPERLESS: JSPErrorCode read _GetPRINTER_PAPERLESS;
    {class} property PRINTER_OVER_TEMPERATURE: JSPErrorCode read _GetPRINTER_OVER_TEMPERATURE;
    {class} property PRINTER_DATA_ERROR: JSPErrorCode read _GetPRINTER_DATA_ERROR;
    {class} property PRINTER_INVALID_PARAMETER: JSPErrorCode read _GetPRINTER_INVALID_PARAMETER;
    {class} property PRINTER_NOT_OPEN: JSPErrorCode read _GetPRINTER_NOT_OPEN;
    {class} property PRINTER_BUFFER_OVERFLOW: JSPErrorCode read _GetPRINTER_BUFFER_OVERFLOW;
    {class} property PRINTER_not_support: JSPErrorCode read _GetPRINTER_not_support;
    {class} property TAX_ERR_WRITE: JSPErrorCode read _GetTAX_ERR_WRITE;
    {class} property TAX_ERR_READ: JSPErrorCode read _GetTAX_ERR_READ;
    {class} property I2C_SEND_DATA_FAILED: JSPErrorCode read _GetI2C_SEND_DATA_FAILED;
    {class} property I2C_RECV_DATA_TIMEOUT: JSPErrorCode read _GetI2C_RECV_DATA_TIMEOUT;
    {class} property UNKNOWN: JSPErrorCode read _GetUNKNOWN;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/SPErrorCode')]
  JSPErrorCode = interface(JEnum) // or JObject
  ['{2B88CBD6-FB3C-4E13-A172-2807D9517B53}']
    { Property Methods }

    { methods }
    function getCode: Integer; cdecl;
    function getResId: Integer; cdecl;

    { Property }
  end;

  TJSPErrorCode = class(TJavaGenericImport<JSPErrorCodeClass, JSPErrorCode>) end;

  JBasicOpt_DefaultClass = interface(JObjectClass)
  ['{FE3AA754-364C-42EC-A5EF-3F60443DA305}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBasicOpt_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/system/BasicOpt$Default')]
  JBasicOpt_Default = interface(JObject)
  ['{D7F0FB3E-8679-438A-A79A-C60DE4385CDA}']
    { Property Methods }

    { methods }
    function getSysParam(key: JString): JString; cdecl;
    function setSysParam(key: JString; value: JString): Integer; cdecl;
    function buzzerOnDevice(times: Integer): Integer; cdecl;
    function ledStatusOnDevice(ledIndex: Integer; ledStatus: Integer): Integer; cdecl;
    function setScreenMode(mode: Integer): Integer; cdecl;
    procedure resetSP; cdecl;
    function sysPowerManager(mode: Integer): Integer; cdecl;
    function sysGetRandom(randData: TJavaArray<Byte>; len: Integer): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJBasicOpt_Default = class(TJavaGenericImport<JBasicOpt_DefaultClass, JBasicOpt_Default>) end;

  JBasicOpt_Stub_ProxyClass = interface(JObjectClass)
  ['{03E72939-6812-4674-B0AB-3519EF995DC2}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JBasicOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JBasicOpt read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/system/BasicOpt$Stub$Proxy')]
  JBasicOpt_Stub_Proxy = interface(JObject)
  ['{5EB6FCEC-B951-40BA-91BA-FDA8C852799A}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function getSysParam(key: JString): JString; cdecl;
    function setSysParam(key: JString; value: JString): Integer; cdecl;
    function buzzerOnDevice(times: Integer): Integer; cdecl;
    function ledStatusOnDevice(ledIndex: Integer; ledStatus: Integer): Integer; cdecl;
    function setScreenMode(mode: Integer): Integer; cdecl;
    procedure resetSP; cdecl;
    function sysPowerManager(mode: Integer): Integer; cdecl;
    function sysGetRandom(randData: TJavaArray<Byte>; len: Integer): Integer; cdecl;

    { Property }
  end;

  TJBasicOpt_Stub_Proxy = class(TJavaGenericImport<JBasicOpt_Stub_ProxyClass, JBasicOpt_Stub_Proxy>) end;

  JBasicOpt_StubClass = interface(JBinderClass) // or JObjectClass
  ['{06BD7736-D224-4E6E-8D1A-03339C777324}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBasicOpt_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JBasicOpt; cdecl;
    {class} function setDefaultImpl(impl: JBasicOpt): Boolean; cdecl;
    {class} function getDefaultImpl: JBasicOpt; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/system/BasicOpt$Stub')]
  JBasicOpt_Stub = interface(JBinder) // or JObject
  ['{A05B6DD0-5188-484D-9D38-66C28E62CE00}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJBasicOpt_Stub = class(TJavaGenericImport<JBasicOpt_StubClass, JBasicOpt_Stub>) end;

  JBasicOptClass = interface(JObjectClass)
  ['{F9DD5CE7-B74A-4C99-B6A2-B6B2BEDE766F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/system/BasicOpt')]
  JBasicOpt = interface(IJavaInstance)
  ['{4989BCEF-1C5D-4854-849D-8D73DC230EAA}']
    { Property Methods }

    { methods }
    function getSysParam(P1: JString): JString; cdecl;
    function setSysParam(P1: JString; P2: JString): Integer; cdecl;
    function buzzerOnDevice(P1: Integer): Integer; cdecl;
    function ledStatusOnDevice(P1: Integer; P2: Integer): Integer; cdecl;
    function setScreenMode(P1: Integer): Integer; cdecl;
    procedure resetSP; cdecl;
    function sysPowerManager(P1: Integer): Integer; cdecl;
    function sysGetRandom(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;

    { Property }
  end;

  TJBasicOpt = class(TJavaGenericImport<JBasicOptClass, JBasicOpt>) end;

  JTaxOpt_DefaultClass = interface(JObjectClass)
  ['{41160F1E-788D-41A8-8F95-56BBD38E3E0A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTaxOpt_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/tax/TaxOpt$Default')]
  JTaxOpt_Default = interface(JObject)
  ['{1F86ADAF-E457-4852-8B45-8C2369CD0C07}']
    { Property Methods }

    { methods }
    function taxDataExchange(taxSend: TJavaArray<Byte>; taxRecv: TJavaArray<Byte>): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJTaxOpt_Default = class(TJavaGenericImport<JTaxOpt_DefaultClass, JTaxOpt_Default>) end;

  JTaxOpt_Stub_ProxyClass = interface(JObjectClass)
  ['{D36FD8F2-9025-4F94-8229-D77F5D10A11C}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JTaxOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JTaxOpt read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/tax/TaxOpt$Stub$Proxy')]
  JTaxOpt_Stub_Proxy = interface(JObject)
  ['{343F3891-ACF9-4F24-809C-958FC9D43B6E}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function taxDataExchange(taxSend: TJavaArray<Byte>; taxRecv: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJTaxOpt_Stub_Proxy = class(TJavaGenericImport<JTaxOpt_Stub_ProxyClass, JTaxOpt_Stub_Proxy>) end;

  JTaxOpt_StubClass = interface(JBinderClass) // or JObjectClass
  ['{976F7719-C65D-4F61-A9BF-D9B05E066609}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTaxOpt_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JTaxOpt; cdecl;
    {class} function setDefaultImpl(impl: JTaxOpt): Boolean; cdecl;
    {class} function getDefaultImpl: JTaxOpt; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/tax/TaxOpt$Stub')]
  JTaxOpt_Stub = interface(JBinder) // or JObject
  ['{F5CC916B-B099-48DF-B70B-0214F64C94ED}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJTaxOpt_Stub = class(TJavaGenericImport<JTaxOpt_StubClass, JTaxOpt_Stub>) end;

  JTaxOptClass = interface(JObjectClass)
  ['{7DB13D5F-F0AA-4424-B337-03E8F0FD47D2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidl/tax/TaxOpt')]
  JTaxOpt = interface(IJavaInstance)
  ['{876DF564-F52D-4063-B96B-DED364DEF86E}']
    { Property Methods }

    { methods }
    function taxDataExchange(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJTaxOpt = class(TJavaGenericImport<JTaxOptClass, JTaxOpt>) end;

  JAidlConstantsV2Class = interface(JAidlConstantsClass) // or JObjectClass
  ['{8E8EE883-C3C4-4414-8D15-EFFB8EA514EB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAidlConstantsV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/AidlConstantsV2')]
  JAidlConstantsV2 = interface(JAidlConstants) // or JObject
  ['{4618876B-FFD5-4D8C-9DF4-816A1D00BF74}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstantsV2 = class(TJavaGenericImport<JAidlConstantsV2Class, JAidlConstantsV2>) end;

  JAidlErrorCodeV2Class = interface(JEnumClass) // or JObjectClass
  ['{542F1D74-7DC8-4F08-AB50-685F817DADB5}']
    { static Property Methods }
    {class} function _GetAIDL_ERROR: JAidlErrorCodeV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JAidlErrorCodeV2>; cdecl;
    {class} function valueOf(name: JString): JAidlErrorCodeV2; cdecl; overload;
    {class} function valueOf(errCode: Integer): JAidlErrorCodeV2; cdecl; overload;

    { static Property }
    {class} property AIDL_ERROR: JAidlErrorCodeV2 read _GetAIDL_ERROR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/AidlErrorCodeV2')]
  JAidlErrorCodeV2 = interface(JEnum) // or JObject
  ['{50F89669-7792-4698-B4C6-A7959B69123D}']
    { Property Methods }

    { methods }
    function getCode: Integer; cdecl;
    function getMsg: JString; cdecl;

    { Property }
  end;

  TJAidlErrorCodeV2 = class(TJavaGenericImport<JAidlErrorCodeV2Class, JAidlErrorCodeV2>) end;

//  JAidV2_1Class = interface(JObjectClass)
//  ['{9AD92B96-F0B8-4EF3-8FE7-F9480DDDC269}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/AidV2$1')]
//  JAidV2_1 = interface(JObject)
//  ['{F7A54385-6B57-4DCF-8804-4C2E78A7C8DF}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(source: JParcel): JAidV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JAidV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJAidV2_1 = class(TJavaGenericImport<JAidV2_1Class, JAidV2_1>) end;

  JAidV2Class = interface(JObjectClass)
  ['{575A52B3-9D20-4811-8ABC-6F9FF412212A}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JAidV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/AidV2')]
  JAidV2 = interface(JObject)
  ['{DFF0EDAA-6765-44BA-99BF-29130859437F}']
    { Property Methods }
    function _Getaid: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setaid(aaid: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcvmLmt: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcvmLmt(acvmLmt: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermClssLmt: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermClssLmt(atermClssLmt: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermClssOfflineFloorLmt: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermClssOfflineFloorLmt(atermClssOfflineFloorLmt: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermOfflineFloorLmt: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermOfflineFloorLmt(atermOfflineFloorLmt: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetselFlag: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetselFlag(aselFlag: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettargetPer: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettargetPer(atargetPer: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmaxTargetPer: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmaxTargetPer(amaxTargetPer: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetfloorLimit: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetfloorLimit(afloorLimit: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetrandTransSel: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetrandTransSel(arandTransSel: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetvelocityCheck: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetvelocityCheck(avelocityCheck: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getthreshold: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setthreshold(athreshold: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetTACDenial: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTACDenial(aTACDenial: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetTACOnline: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTACOnline(aTACOnline: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetTACDefault: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTACDefault(aTACDefault: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetAcquierId: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetAcquierId(aAcquierId: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdDOL: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdDOL(adDOL: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettDOL: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettDOL(atDOL: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getversion: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setversion(aversion: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetrMDLen: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetrMDLen(arMDLen: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetriskManData: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetriskManData(ariskManData: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmerchName: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmerchName(amerchName: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmerchCateCode: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmerchCateCode(amerchCateCode: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmerchId: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmerchId(amerchId: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermId: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermId(atermId: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetreferCurrCode: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetreferCurrCode(areferCurrCode: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetreferCurrExp: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetreferCurrExp(areferCurrExp: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetreferCurrCon: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetreferCurrCon(areferCurrCon: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetclsStatusCheck: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetclsStatusCheck(aclsStatusCheck: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetzeroCheck: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetzeroCheck(azeroCheck: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetkernelType: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetkernelType(akernelType: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetparamType: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetparamType(aparamType: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getttq: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setttq(attq: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetkernelID: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetkernelID(akernelID: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetextSelectSupFlg: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetextSelectSupFlg(aextSelectSupFlg: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property aid: TJavaArray<Byte> read _Getaid write _Setaid;
    property cvmLmt: TJavaArray<Byte> read _GetcvmLmt write _SetcvmLmt;
    property termClssLmt: TJavaArray<Byte> read _GettermClssLmt write _SettermClssLmt;
    property termClssOfflineFloorLmt: TJavaArray<Byte> read _GettermClssOfflineFloorLmt write _SettermClssOfflineFloorLmt;
    property termOfflineFloorLmt: TJavaArray<Byte> read _GettermOfflineFloorLmt write _SettermOfflineFloorLmt;
    property selFlag: Byte read _GetselFlag write _SetselFlag;
    property targetPer: Byte read _GettargetPer write _SettargetPer;
    property maxTargetPer: Byte read _GetmaxTargetPer write _SetmaxTargetPer;
    property floorLimit: TJavaArray<Byte> read _GetfloorLimit write _SetfloorLimit;
    property randTransSel: Byte read _GetrandTransSel write _SetrandTransSel;
    property velocityCheck: Byte read _GetvelocityCheck write _SetvelocityCheck;
    property threshold: TJavaArray<Byte> read _Getthreshold write _Setthreshold;
    property TACDenial: TJavaArray<Byte> read _GetTACDenial write _SetTACDenial;
    property TACOnline: TJavaArray<Byte> read _GetTACOnline write _SetTACOnline;
    property TACDefault: TJavaArray<Byte> read _GetTACDefault write _SetTACDefault;
    property AcquierId: TJavaArray<Byte> read _GetAcquierId write _SetAcquierId;
    property dDOL: TJavaArray<Byte> read _GetdDOL write _SetdDOL;
    property tDOL: TJavaArray<Byte> read _GettDOL write _SettDOL;
    property version: TJavaArray<Byte> read _Getversion write _Setversion;
    property rMDLen: Byte read _GetrMDLen write _SetrMDLen;
    property riskManData: TJavaArray<Byte> read _GetriskManData write _SetriskManData;
    property merchName: TJavaArray<Byte> read _GetmerchName write _SetmerchName;
    property merchCateCode: TJavaArray<Byte> read _GetmerchCateCode write _SetmerchCateCode;
    property merchId: TJavaArray<Byte> read _GetmerchId write _SetmerchId;
    property termId: TJavaArray<Byte> read _GettermId write _SettermId;
    property referCurrCode: TJavaArray<Byte> read _GetreferCurrCode write _SetreferCurrCode;
    property referCurrExp: Byte read _GetreferCurrExp write _SetreferCurrExp;
    property referCurrCon: TJavaArray<Byte> read _GetreferCurrCon write _SetreferCurrCon;
    property clsStatusCheck: Byte read _GetclsStatusCheck write _SetclsStatusCheck;
    property zeroCheck: Byte read _GetzeroCheck write _SetzeroCheck;
    property kernelType: Byte read _GetkernelType write _SetkernelType;
    property paramType: Byte read _GetparamType write _SetparamType;
    property ttq: TJavaArray<Byte> read _Getttq write _Setttq;
    property kernelID: TJavaArray<Byte> read _GetkernelID write _SetkernelID;
    property extSelectSupFlg: Byte read _GetextSelectSupFlg write _SetextSelectSupFlg;
  end;

  TJAidV2 = class(TJavaGenericImport<JAidV2Class, JAidV2>) end;

//  JApduRecvV2_1Class = interface(JObjectClass)
//  ['{90657E7D-9877-453A-B10D-AFE3CEC66BD5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/ApduRecvV2$1')]
//  JApduRecvV2_1 = interface(JObject)
//  ['{DE646E39-B30B-463C-A58E-1929231996C3}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(source: JParcel): JApduRecvV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JApduRecvV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJApduRecvV2_1 = class(TJavaGenericImport<JApduRecvV2_1Class, JApduRecvV2_1>) end;

  JApduRecvV2Class = interface(JObjectClass)
  ['{59769741-D0B6-4FB7-9150-CA30123419FA}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JApduRecvV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/ApduRecvV2')]
  JApduRecvV2 = interface(JObject)
  ['{E9C183BE-7783-4609-8904-12DBA2B6C0FD}']
    { Property Methods }
    function _Getoutlen: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setoutlen(aoutlen: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetoutData: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetoutData(aoutData: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getswa: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setswa(aswa: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getswb: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setswb(aswb: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property outlen: Word read _Getoutlen write _Setoutlen;
    property outData: TJavaArray<Byte> read _GetoutData write _SetoutData;
    property swa: Byte read _Getswa write _Setswa;
    property swb: Byte read _Getswb write _Setswb;
  end;

  TJApduRecvV2 = class(TJavaGenericImport<JApduRecvV2Class, JApduRecvV2>) end;

//  JApduSendV2_1Class = interface(JObjectClass)
//  ['{2DD989A4-B3C7-4A22-8AD2-3E721AFF6FD5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/ApduSendV2$1')]
//  JApduSendV2_1 = interface(JObject)
//  ['{D5B0B5C9-8022-4D26-8F57-18DACF19AECF}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(source: JParcel): JApduSendV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JApduSendV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJApduSendV2_1 = class(TJavaGenericImport<JApduSendV2_1Class, JApduSendV2_1>) end;

  JApduSendV2Class = interface(JObjectClass)
  ['{18966EDE-3E56-4FE2-8926-664C97ED0864}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JApduSendV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/ApduSendV2')]
  JApduSendV2 = interface(JObject)
  ['{FEAD39B0-A5B5-4BC9-A795-9BF0C6A9BFA2}']
    { Property Methods }
    function _Getcommand: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcommand(acommand: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getlc: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setlc(alc: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdataIn: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdataIn(adataIn: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getle: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setle(ale: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property command: TJavaArray<Byte> read _Getcommand write _Setcommand;
    property lc: Word read _Getlc write _Setlc;
    property dataIn: TJavaArray<Byte> read _GetdataIn write _SetdataIn;
    property le: Word read _Getle write _Setle;
  end;

  TJApduSendV2 = class(TJavaGenericImport<JApduSendV2Class, JApduSendV2>) end;

//  JCapkV2_1Class = interface(JObjectClass)
//  ['{0049A7A4-875E-4178-92B5-5858CBAE01A4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/CapkV2$1')]
//  JCapkV2_1 = interface(JObject)
//  ['{6FA7E282-54B5-4E54-8C94-1937CE1498A5}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(source: JParcel): JCapkV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JCapkV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJCapkV2_1 = class(TJavaGenericImport<JCapkV2_1Class, JCapkV2_1>) end;

  JCapkV2Class = interface(JObjectClass)
  ['{FD33E391-D517-43D1-8DE6-53B45CB0476F}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCapkV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/CapkV2')]
  JCapkV2 = interface(JObject)
  ['{31832C5D-1C2B-4773-9850-BFB21009ABEC}']
    { Property Methods }
    function _Getrid: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setrid(arid: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getindex: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setindex(aindex: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GethashInd: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SethashInd(ahashInd: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetarithInd: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetarithInd(aarithInd: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getmodul: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setmodul(amodul: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getexponent: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setexponent(aexponent: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetexpDate: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetexpDate(aexpDate: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcheckSum: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcheckSum(acheckSum: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property rid: TJavaArray<Byte> read _Getrid write _Setrid;
    property index: Byte read _Getindex write _Setindex;
    property hashInd: Byte read _GethashInd write _SethashInd;
    property arithInd: Byte read _GetarithInd write _SetarithInd;
    property modul: TJavaArray<Byte> read _Getmodul write _Setmodul;
    property exponent: TJavaArray<Byte> read _Getexponent write _Setexponent;
    property expDate: TJavaArray<Byte> read _GetexpDate write _SetexpDate;
    property checkSum: TJavaArray<Byte> read _GetcheckSum write _SetcheckSum;
  end;

  TJCapkV2 = class(TJavaGenericImport<JCapkV2Class, JCapkV2>) end;

//  JDrlV2_1Class = interface(JObjectClass)
//  ['{A0630983-1951-40D7-B8AD-59BDE876D800}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/DrlV2$1')]
//  JDrlV2_1 = interface(JObject)
//  ['{3C1AA460-5962-4FA0-A309-2B7A4A066116}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(source: JParcel): JDrlV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JDrlV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJDrlV2_1 = class(TJavaGenericImport<JDrlV2_1Class, JDrlV2_1>) end;

  JDrlV2Class = interface(JObjectClass)
  ['{99BDAC96-1455-4469-AFFD-33C20EA5A968}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDrlV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/DrlV2')]
  JDrlV2 = interface(JObject)
  ['{C860A86D-E7C7-40D2-A556-8A6463FA8D77}']
    { Property Methods }
    function _GetisDefaultLmt: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisDefaultLmt(aisDefaultLmt: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstatusCheck: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstatusCheck(astatusCheck: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetzeroCheck: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetzeroCheck(azeroCheck: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetprogramID: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetprogramID(aprogramID: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcvmLmt: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcvmLmt(acvmLmt: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermClssLmt: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermClssLmt(atermClssLmt: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermClssFloorLmt: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermClssFloorLmt(atermClssFloorLmt: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermFloorLmt: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermFloorLmt(atermFloorLmt: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcvmLmtActivate: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcvmLmtActivate(acvmLmtActivate: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermClssLmtActivate: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermClssLmtActivate(atermClssLmtActivate: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermClssFloorLmtActivate: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermClssFloorLmtActivate(atermClssFloorLmtActivate: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property isDefaultLmt: Boolean read _GetisDefaultLmt write _SetisDefaultLmt;
    property statusCheck: Boolean read _GetstatusCheck write _SetstatusCheck;
    property zeroCheck: Byte read _GetzeroCheck write _SetzeroCheck;
    property programID: TJavaArray<Byte> read _GetprogramID write _SetprogramID;
    property cvmLmt: TJavaArray<Byte> read _GetcvmLmt write _SetcvmLmt;
    property termClssLmt: TJavaArray<Byte> read _GettermClssLmt write _SettermClssLmt;
    property termClssFloorLmt: TJavaArray<Byte> read _GettermClssFloorLmt write _SettermClssFloorLmt;
    property termFloorLmt: TJavaArray<Byte> read _GettermFloorLmt write _SettermFloorLmt;
    property cvmLmtActivate: Boolean read _GetcvmLmtActivate write _SetcvmLmtActivate;
    property termClssLmtActivate: Boolean read _GettermClssLmtActivate write _SettermClssLmtActivate;
    property termClssFloorLmtActivate: Byte read _GettermClssFloorLmtActivate write _SettermClssFloorLmtActivate;
  end;

  TJDrlV2 = class(TJavaGenericImport<JDrlV2Class, JDrlV2>) end;

//  JEMVCandidateV2_1Class = interface(JObjectClass)
//  ['{30957D4A-030B-4F9B-91BB-77EFADD2834B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/EMVCandidateV2$1')]
//  JEMVCandidateV2_1 = interface(JObject)
//  ['{BF6C2384-8B24-453E-A0B8-E8A698D17F8B}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(source: JParcel): JEMVCandidateV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JEMVCandidateV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJEMVCandidateV2_1 = class(TJavaGenericImport<JEMVCandidateV2_1Class, JEMVCandidateV2_1>) end;

  JEMVCandidateV2Class = interface(JObjectClass)
  ['{86D98B45-6274-4A88-A9F4-7514E3E7ECAE}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JEMVCandidateV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/EMVCandidateV2')]
  JEMVCandidateV2 = interface(JObject)
  ['{934861BE-EB6B-4676-A3B2-7FD96E03F51A}']
    { Property Methods }
    function _Getindex: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setindex(aindex: Word);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getaid: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setaid(aaid: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetappPreName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetappPreName(aappPreName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetappLabel: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetappLabel(aappLabel: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetissDiscrData: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetissDiscrData(aissDiscrData: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getpriority: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setpriority(apriority: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetappName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetappName(aappName: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetkernelType: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetkernelType(akernelType: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property index: Word read _Getindex write _Setindex;
    property aid: JString read _Getaid write _Setaid;
    property appPreName: JString read _GetappPreName write _SetappPreName;
    property appLabel: JString read _GetappLabel write _SetappLabel;
    property issDiscrData: JString read _GetissDiscrData write _SetissDiscrData;
    property priority: Byte read _Getpriority write _Setpriority;
    property appName: JString read _GetappName write _SetappName;
    property kernelType: Byte read _GetkernelType write _SetkernelType;
  end;

  TJEMVCandidateV2 = class(TJavaGenericImport<JEMVCandidateV2Class, JEMVCandidateV2>) end;

//  JEmvTermParamV2_1Class = interface(JObjectClass)
//  ['{075ED206-8CB0-4C05-BA85-246FD3A2DACB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/EmvTermParamV2$1')]
//  JEmvTermParamV2_1 = interface(JObject)
//  ['{CFB190B8-126E-4C83-B304-F4A640141C59}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(ain: JParcel): JEmvTermParamV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JEmvTermParamV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJEmvTermParamV2_1 = class(TJavaGenericImport<JEmvTermParamV2_1Class, JEmvTermParamV2_1>) end;

  JEmvTermParamV2Class = interface(JObjectClass)
  ['{202D3DD7-0A04-496A-A99A-12E628588459}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JEmvTermParamV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/EmvTermParamV2')]
  JEmvTermParamV2 = interface(JObject)
  ['{CAB2308B-3003-4D6F-B5B8-DC73B95BBD63}']
    { Property Methods }
    function _GetifDsn: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetifDsn(aifDsn: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetterminalType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetterminalType(aterminalType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcountryCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcountryCode(acountryCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetforceOnline: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetforceOnline(aforceOnline: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetgetDataPIN: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetgetDataPIN(agetDataPIN: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsurportPSESel: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsurportPSESel(asurportPSESel: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetuseTermAIPFlg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetuseTermAIPFlg(auseTermAIPFlg: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettermAIP: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettermAIP(atermAIP: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbypassAllFlg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbypassAllFlg(abypassAllFlg: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbypassPin: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbypassPin(abypassPin: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbatchCapture: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbatchCapture(abatchCapture: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetectSiFlg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetectSiFlg(aectSiFlg: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetectSiVal: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetectSiVal(aectSiVal: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetectTlFlg: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetectTlFlg(aectTlFlg: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetectTlVal: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetectTlVal(aectTlVal: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getcapability: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcapability(acapability: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetaddCapability: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaddCapability(aaddCapability: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetscriptMode: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetscriptMode(ascriptMode: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetadviceFlag: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetadviceFlag(aadviceFlag: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisSupportSM: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisSupportSM(aisSupportSM: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisSupportTransLog: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisSupportTransLog(aisSupportTransLog: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisSupportMultiLang: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisSupportMultiLang(aisSupportMultiLang: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisSupportExceptFile: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisSupportExceptFile(aisSupportExceptFile: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetisSupportAccountSelect: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetisSupportAccountSelect(aisSupportAccountSelect: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetTTQ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetTTQ(aTTQ: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetIsReadLogInCard: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetIsReadLogInCard(aIsReadLogInCard: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcurrencyCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcurrencyCode(acurrencyCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcurrencyExp: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcurrencyExp(acurrencyExp: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetaccountType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetaccountType(aaccountType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property ifDsn: JString read _GetifDsn write _SetifDsn;
    property terminalType: JString read _GetterminalType write _SetterminalType;
    property countryCode: JString read _GetcountryCode write _SetcountryCode;
    property forceOnline: Boolean read _GetforceOnline write _SetforceOnline;
    property getDataPIN: Boolean read _GetgetDataPIN write _SetgetDataPIN;
    property surportPSESel: Boolean read _GetsurportPSESel write _SetsurportPSESel;
    property useTermAIPFlg: Boolean read _GetuseTermAIPFlg write _SetuseTermAIPFlg;
    property termAIP: Boolean read _GettermAIP write _SettermAIP;
    property bypassAllFlg: Boolean read _GetbypassAllFlg write _SetbypassAllFlg;
    property bypassPin: Boolean read _GetbypassPin write _SetbypassPin;
    property batchCapture: Boolean read _GetbatchCapture write _SetbatchCapture;
    property ectSiFlg: Boolean read _GetectSiFlg write _SetectSiFlg;
    property ectSiVal: Boolean read _GetectSiVal write _SetectSiVal;
    property ectTlFlg: Boolean read _GetectTlFlg write _SetectTlFlg;
    property ectTlVal: JString read _GetectTlVal write _SetectTlVal;
    property capability: JString read _Getcapability write _Setcapability;
    property addCapability: JString read _GetaddCapability write _SetaddCapability;
    property scriptMode: Boolean read _GetscriptMode write _SetscriptMode;
    property adviceFlag: Boolean read _GetadviceFlag write _SetadviceFlag;
    property isSupportSM: Boolean read _GetisSupportSM write _SetisSupportSM;
    property isSupportTransLog: Boolean read _GetisSupportTransLog write _SetisSupportTransLog;
    property isSupportMultiLang: Boolean read _GetisSupportMultiLang write _SetisSupportMultiLang;
    property isSupportExceptFile: Boolean read _GetisSupportExceptFile write _SetisSupportExceptFile;
    property isSupportAccountSelect: Boolean read _GetisSupportAccountSelect write _SetisSupportAccountSelect;
    property TTQ: JString read _GetTTQ write _SetTTQ;
    property IsReadLogInCard: Boolean read _GetIsReadLogInCard write _SetIsReadLogInCard;
    property currencyCode: JString read _GetcurrencyCode write _SetcurrencyCode;
    property currencyExp: JString read _GetcurrencyExp write _SetcurrencyExp;
    property accountType: JString read _GetaccountType write _SetaccountType;
  end;

  TJEmvTermParamV2 = class(TJavaGenericImport<JEmvTermParamV2Class, JEmvTermParamV2>) end;

//  JEMVTransDataV2_1Class = interface(JObjectClass)
//  ['{B36E56CA-8DCC-4C3E-B4CC-2F85BF82D307}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/EMVTransDataV2$1')]
//  JEMVTransDataV2_1 = interface(JObject)
//  ['{A8DCD3C0-8DCC-48D7-972E-A25C86C680C8}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(source: JParcel): JEMVTransDataV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JEMVTransDataV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJEMVTransDataV2_1 = class(TJavaGenericImport<JEMVTransDataV2_1Class, JEMVTransDataV2_1>) end;

  JEMVTransDataV2Class = interface(JObjectClass)
  ['{5A8725EE-B28E-4FE8-94BD-781F95859323}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JEMVTransDataV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/EMVTransDataV2')]
  JEMVTransDataV2 = interface(JObject)
  ['{8AF97D49-4560-4DBF-90D8-5B827C8745E7}']
    { Property Methods }
    function _Getamount: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setamount(aamount: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GettransType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SettransType(atransType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetflowType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetflowType(aflowType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcardType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcardType(acardType: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property amount: JString read _Getamount write _Setamount;
    property transType: JString read _GettransType write _SettransType;
    property flowType: Integer read _GetflowType write _SetflowType;
    property cardType: Integer read _GetcardType write _SetcardType;
  end;

  TJEMVTransDataV2 = class(TJavaGenericImport<JEMVTransDataV2Class, JEMVTransDataV2>) end;

//  JETCInfoV2_1Class = interface(JObjectClass)
//  ['{02AA19F7-33B4-4325-B7D9-382FD3D43F11}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/ETCInfoV2$1')]
//  JETCInfoV2_1 = interface(JObject)
//  ['{62F83F56-AFB5-42CE-A2E0-6AF5907B3F61}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(source: JParcel): JETCInfoV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JETCInfoV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJETCInfoV2_1 = class(TJavaGenericImport<JETCInfoV2_1Class, JETCInfoV2_1>) end;

  JETCInfoV2Class = interface(JObjectClass)
  ['{9922FE3C-9927-4281-8B05-122615C949D4}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JETCInfoV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/ETCInfoV2')]
  JETCInfoV2 = interface(JObject)
  ['{6A93A9B2-7E98-42C5-B256-6C34CC49FF50}']
    { Property Methods }
    function _GetdeviceNo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceNo(adeviceNo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdeviceStatus: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdeviceStatus(adeviceStatus: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcardType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcardType(acardType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getamount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setamount(aamount: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlicensePlateColor: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlicensePlateColor(alicensePlateColor: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlicensePlateNo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlicensePlateNo(alicensePlateNo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getsignal: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setsignal(asignal: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property deviceNo: JString read _GetdeviceNo write _SetdeviceNo;
    property deviceStatus: JString read _GetdeviceStatus write _SetdeviceStatus;
    property cardType: JString read _GetcardType write _SetcardType;
    property amount: Integer read _Getamount write _Setamount;
    property licensePlateColor: JString read _GetlicensePlateColor write _SetlicensePlateColor;
    property licensePlateNo: JString read _GetlicensePlateNo write _SetlicensePlateNo;
    property signal: Integer read _Getsignal write _Setsignal;
  end;

  TJETCInfoV2 = class(TJavaGenericImport<JETCInfoV2Class, JETCInfoV2>) end;

//  JPinPadConfigV2_1Class = interface(JObjectClass)
//  ['{525EC219-B6C1-483E-921C-D5EA19753987}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/PinPadConfigV2$1')]
//  JPinPadConfigV2_1 = interface(JObject)
//  ['{160501EF-7296-48E4-B17F-52D8D0737C75}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(ain: JParcel): JPinPadConfigV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JPinPadConfigV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJPinPadConfigV2_1 = class(TJavaGenericImport<JPinPadConfigV2_1Class, JPinPadConfigV2_1>) end;

  JPinPadConfigV2Class = interface(JObjectClass)
  ['{E9B35220-B37B-4A15-AFC2-64E5E5F1527D}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPinPadConfigV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/PinPadConfigV2')]
  JPinPadConfigV2 = interface(JObject)
  ['{6187BD4E-4991-4397-B008-EEC0E78162E5}']
    { Property Methods }

    { methods }
    function getPinPadType: Integer; cdecl;
    procedure setPinPadType(pinPadType: Integer); cdecl;
    function getPinType: Integer; cdecl;
    procedure setPinType(pinType: Integer); cdecl;
    function isOrderNumKey: Boolean; cdecl;
    procedure setOrderNumKey(orderNumKey: Boolean); cdecl;
    function getPan: TJavaArray<Byte>; cdecl;
    procedure setPan(pan: TJavaArray<Byte>); cdecl;
    function getPinKeyIndex: Integer; cdecl;
    procedure setPinKeyIndex(pinKeyIndex: Integer); cdecl;
    function getMaxInput: Integer; cdecl;
    procedure setMaxInput(maxInput: Integer); cdecl;
    function getMinInput: Integer; cdecl;
    procedure setMinInput(minInput: Integer); cdecl;
    function getTimeout: Integer; cdecl;
    procedure setTimeout(timeout: Integer); cdecl;
    function isSupportbypass: Boolean; cdecl;
    procedure setSupportbypass(supportbypass: Boolean); cdecl;
    function getPinblockFormat: Integer; cdecl;
    procedure setPinblockFormat(pinblockFormat: Integer); cdecl;
    function getAlgorithmType: Integer; cdecl;
    procedure setAlgorithmType(algorithmType: Integer); cdecl;
    function getKeySystem: Integer; cdecl;
    procedure setKeySystem(keySystem: Integer); cdecl;
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJPinPadConfigV2 = class(TJavaGenericImport<JPinPadConfigV2Class, JPinPadConfigV2>) end;

//  JPinPadDataV2_1Class = interface(JObjectClass)
//  ['{57462E24-7D52-4623-8F83-84EE39C1DF31}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/PinPadDataV2$1')]
//  JPinPadDataV2_1 = interface(JObject)
//  ['{C3FFC7B5-4CD6-433E-86C9-C4D081003E19}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(ain: JParcel): JPinPadDataV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JPinPadDataV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJPinPadDataV2_1 = class(TJavaGenericImport<JPinPadDataV2_1Class, JPinPadDataV2_1>) end;

  JPinPadDataV2Class = interface(JObjectClass)
  ['{F7195064-311F-4CE9-963C-6ACA13AB7584}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPinPadDataV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/PinPadDataV2')]
  JPinPadDataV2 = interface(JObject)
  ['{2DFD2261-FA9F-44EE-89DD-EA923E265697}']
    { Property Methods }
    function _GetnumX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnumX(anumX: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnumY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnumY(anumY: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnumH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnumH(anumH: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnumW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnumW(anumW: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlineW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlineW(alineW: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcancelX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcancelX(acancelX: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcancelY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcancelY(acancelY: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcancelH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcancelH(acancelH: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcancelW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcancelW(acancelW: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getrows: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setrows(arows: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getclos: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setclos(aclos: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetkeyMap: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetkeyMap(akeyMap: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getNumX: Integer; cdecl;
    procedure setNumX(numX: Integer); cdecl;
    function getNumY: Integer; cdecl;
    procedure setNumY(numY: Integer); cdecl;
    function getNumH: Integer; cdecl;
    procedure setNumH(numH: Integer); cdecl;
    function getNumW: Integer; cdecl;
    procedure setNumW(numW: Integer); cdecl;
    function getLineW: Integer; cdecl;
    procedure setLineW(lineW: Integer); cdecl;
    function getCancelX: Integer; cdecl;
    procedure setCancelX(cancelX: Integer); cdecl;
    function getCancelY: Integer; cdecl;
    procedure setCancelY(cancelY: Integer); cdecl;
    function getCancelH: Integer; cdecl;
    procedure setCancelH(cancelH: Integer); cdecl;
    function getCancelW: Integer; cdecl;
    procedure setCancelW(cancelW: Integer); cdecl;
    function getRows: Integer; cdecl;
    procedure setRows(rows: Integer); cdecl;
    function getClos: Integer; cdecl;
    procedure setClos(clos: Integer); cdecl;
    function getKeyMap: TJavaArray<Byte>; cdecl;
    procedure setKeyMap(keyMap: TJavaArray<Byte>); cdecl;
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
    property numX: Integer read _GetnumX write _SetnumX;
    property numY: Integer read _GetnumY write _SetnumY;
    property numH: Integer read _GetnumH write _SetnumH;
    property numW: Integer read _GetnumW write _SetnumW;
    property lineW: Integer read _GetlineW write _SetlineW;
    property cancelX: Integer read _GetcancelX write _SetcancelX;
    property cancelY: Integer read _GetcancelY write _SetcancelY;
    property cancelH: Integer read _GetcancelH write _SetcancelH;
    property cancelW: Integer read _GetcancelW write _SetcancelW;
    property rows: Integer read _Getrows write _Setrows;
    property clos: Integer read _Getclos write _Setclos;
    property keyMap: TJavaArray<Byte> read _GetkeyMap write _SetkeyMap;
  end;

  TJPinPadDataV2 = class(TJavaGenericImport<JPinPadDataV2Class, JPinPadDataV2>) end;

//  JPinPadTextConfigV2_1Class = interface(JObjectClass)
//  ['{D74E47E8-53CB-4B26-AC0E-FFFAE5E449E9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/PinPadTextConfigV2$1')]
//  JPinPadTextConfigV2_1 = interface(JObject)
//  ['{5A6E0F99-42C8-4217-918C-0F41FB668181}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(source: JParcel): JPinPadTextConfigV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JPinPadTextConfigV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJPinPadTextConfigV2_1 = class(TJavaGenericImport<JPinPadTextConfigV2_1Class, JPinPadTextConfigV2_1>) end;

  JPinPadTextConfigV2Class = interface(JObjectClass)
  ['{AD01D904-49D5-47D3-911C-AE4168A68A1F}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPinPadTextConfigV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/PinPadTextConfigV2')]
  JPinPadTextConfigV2 = interface(JObject)
  ['{40088FC7-D964-462F-B679-13B5701C08D7}']
    { Property Methods }
    function _Getconfirm: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setconfirm(aconfirm: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetinputPin: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetinputPin(ainputPin: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetinputOfflinePin: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetinputOfflinePin(ainputOfflinePin: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetreinputOfflinePinFormat: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetreinputOfflinePinFormat(areinputOfflinePinFormat: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function describeContents: Integer; cdecl;

    { Property }
    property confirm: JString read _Getconfirm write _Setconfirm;
    property inputPin: JString read _GetinputPin write _SetinputPin;
    property inputOfflinePin: JString read _GetinputOfflinePin write _SetinputOfflinePin;
    property reinputOfflinePinFormat: JString read _GetreinputOfflinePinFormat write _SetreinputOfflinePinFormat;
  end;

  TJPinPadTextConfigV2 = class(TJavaGenericImport<JPinPadTextConfigV2Class, JPinPadTextConfigV2>) end;

//  JRevocListV2_1Class = interface(JObjectClass)
//  ['{03B9F291-1F3F-45E4-8C4A-0A1D095D8B0D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/RevocListV2$1')]
//  JRevocListV2_1 = interface(JObject)
//  ['{1E40463B-A616-4050-A831-1125D5FCF263}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(ain: JParcel): JRevocListV2; cdecl; overload;
//    function newArray(size: Integer): TJavaObjectArray<JRevocListV2>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;
//
//    { Property }
//  end;

//  TJRevocListV2_1 = class(TJavaGenericImport<JRevocListV2_1Class, JRevocListV2_1>) end;

  JRevocListV2Class = interface(JObjectClass)
  ['{50BDABB1-43BA-4912-9C6F-10DF98011FD0}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JRevocListV2; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/bean/RevocListV2')]
  JRevocListV2 = interface(JObject)
  ['{6ACBA470-5D8C-4E9F-99F9-16DC0529D634}']
    { Property Methods }
    function _Getrid: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setrid(arid: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getindex: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setindex(aindex: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getsn: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setsn(asn: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getreserved: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setreserved(areserved: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure readFromParcel(ain: JParcel); cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    function toString: JString; cdecl;
    function toTlvString: JString; cdecl;

    { Property }
    property rid: TJavaArray<Byte> read _Getrid write _Setrid;
    property index: Byte read _Getindex write _Setindex;
    property sn: TJavaArray<Byte> read _Getsn write _Setsn;
    property reserved: TJavaArray<Byte> read _Getreserved write _Setreserved;
  end;

  TJRevocListV2 = class(TJavaGenericImport<JRevocListV2Class, JRevocListV2>) end;

  JEMVDataListenerV2_DefaultClass = interface(JObjectClass)
  ['{FC9666BC-96D2-4452-958E-3943AA8C5847}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEMVDataListenerV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVDataListenerV2$Default')]
  JEMVDataListenerV2_Default = interface(JObject)
  ['{7FFFD29E-0C65-4BBB-A4B8-205BA970E2A1}']
    { Property Methods }

    { methods }
    procedure onRequestDETData(data: TJavaArray<Byte>); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJEMVDataListenerV2_Default = class(TJavaGenericImport<JEMVDataListenerV2_DefaultClass, JEMVDataListenerV2_Default>) end;

  JEMVDataListenerV2_Stub_ProxyClass = interface(JObjectClass)
  ['{49CD8364-7A89-4241-9C5C-6326E3EA577C}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JEMVDataListenerV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JEMVDataListenerV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVDataListenerV2$Stub$Proxy')]
  JEMVDataListenerV2_Stub_Proxy = interface(JObject)
  ['{D9F6FC81-8196-4DCC-A435-ABC6657CC8A6}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onRequestDETData(data: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJEMVDataListenerV2_Stub_Proxy = class(TJavaGenericImport<JEMVDataListenerV2_Stub_ProxyClass, JEMVDataListenerV2_Stub_Proxy>) end;

  JEMVDataListenerV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{ADC13494-79E8-4DDB-88CA-22116053D8B9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEMVDataListenerV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JEMVDataListenerV2; cdecl;
    {class} function setDefaultImpl(impl: JEMVDataListenerV2): Boolean; cdecl;
    {class} function getDefaultImpl: JEMVDataListenerV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVDataListenerV2$Stub')]
  JEMVDataListenerV2_Stub = interface(JBinder) // or JObject
  ['{0148EEDD-037A-49B6-A7BA-85D65B53D6BA}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJEMVDataListenerV2_Stub = class(TJavaGenericImport<JEMVDataListenerV2_StubClass, JEMVDataListenerV2_Stub>) end;

  JEMVDataListenerV2Class = interface(JObjectClass)
  ['{8ADEF9E0-ADEA-462D-A5EA-593098790906}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVDataListenerV2')]
  JEMVDataListenerV2 = interface(IJavaInstance)
  ['{50BD143C-F2AC-4695-8D1F-E643608BA022}']
    { Property Methods }

    { methods }
    procedure onRequestDETData(P1: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJEMVDataListenerV2 = class(TJavaGenericImport<JEMVDataListenerV2Class, JEMVDataListenerV2>) end;

  JEMVListenerV2_DefaultClass = interface(JObjectClass)
  ['{628FF127-CF2A-4A0B-8F31-4CDE328DCD38}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEMVListenerV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVListenerV2$Default')]
  JEMVListenerV2_Default = interface(JObject)
  ['{E2514304-E63D-49DF-A73E-8B401ECE0577}']
    { Property Methods }

    { methods }
    procedure onWaitAppSelect(candList: JList; P2: Boolean); cdecl;
    procedure onAppFinalSelect(tag9F06Value: JString); cdecl;
    procedure onConfirmCardNo(cardNo: JString); cdecl;
    procedure onRequestShowPinPad(pinType: Integer; remainTimes: Integer); cdecl;
    procedure onRequestSignature; cdecl;
    procedure onCertVerify(certType: Integer; certInfo: JString); cdecl;
    procedure onOnlineProc; cdecl;
    procedure onCardDataExchangeComplete; cdecl;
    procedure onTransResult(code: Integer; desc: JString); cdecl;
    procedure onConfirmationCodeVerified; cdecl;
    procedure onRequestDataExchange(cardNo: JString); cdecl;
    procedure onTermRiskManagement; cdecl;
    procedure onPreFirstGenAC; cdecl;
    procedure onDataStorageProc(containerID: TJavaObjectArray<JString>; containerContent: TJavaObjectArray<JString>); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJEMVListenerV2_Default = class(TJavaGenericImport<JEMVListenerV2_DefaultClass, JEMVListenerV2_Default>) end;

  JEMVListenerV2_Stub_ProxyClass = interface(JObjectClass)
  ['{FE5767B5-1642-467D-8C57-D3DF8D418A9B}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JEMVListenerV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JEMVListenerV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVListenerV2$Stub$Proxy')]
  JEMVListenerV2_Stub_Proxy = interface(JObject)
  ['{065952AF-2B52-4A8C-88B8-76BE93242695}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onWaitAppSelect(candList: JList; P2: Boolean); cdecl;
    procedure onAppFinalSelect(tag9F06Value: JString); cdecl;
    procedure onConfirmCardNo(cardNo: JString); cdecl;
    procedure onRequestShowPinPad(pinType: Integer; remainTimes: Integer); cdecl;
    procedure onRequestSignature; cdecl;
    procedure onCertVerify(certType: Integer; certInfo: JString); cdecl;
    procedure onOnlineProc; cdecl;
    procedure onCardDataExchangeComplete; cdecl;
    procedure onTransResult(code: Integer; desc: JString); cdecl;
    procedure onConfirmationCodeVerified; cdecl;
    procedure onRequestDataExchange(cardNo: JString); cdecl;
    procedure onTermRiskManagement; cdecl;
    procedure onPreFirstGenAC; cdecl;
    procedure onDataStorageProc(containerID: TJavaObjectArray<JString>; containerContent: TJavaObjectArray<JString>); cdecl;

    { Property }
  end;

  TJEMVListenerV2_Stub_Proxy = class(TJavaGenericImport<JEMVListenerV2_Stub_ProxyClass, JEMVListenerV2_Stub_Proxy>) end;

  JEMVListenerV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{9BBA2446-97D0-4926-8A20-CE47301D0329}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEMVListenerV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JEMVListenerV2; cdecl;
    {class} function setDefaultImpl(impl: JEMVListenerV2): Boolean; cdecl;
    {class} function getDefaultImpl: JEMVListenerV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVListenerV2$Stub')]
  JEMVListenerV2_Stub = interface(JBinder) // or JObject
  ['{5B7A7DCE-CBF3-4044-A8E3-A45C13A4182B}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJEMVListenerV2_Stub = class(TJavaGenericImport<JEMVListenerV2_StubClass, JEMVListenerV2_Stub>) end;

  JEMVListenerV2Class = interface(JObjectClass)
  ['{1D716E78-18CF-4A5B-A880-B78E6B8BFCD3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVListenerV2')]
  JEMVListenerV2 = interface(IJavaInstance)
  ['{A56D5BEB-B4B6-4A75-8B63-06590FA30CFD}']
    { Property Methods }

    { methods }
    procedure onWaitAppSelect(P1: JList; P2: Boolean); cdecl;
    procedure onAppFinalSelect(P1: JString); cdecl;
    procedure onConfirmCardNo(P1: JString); cdecl;
    procedure onRequestShowPinPad(P1: Integer; P2: Integer); cdecl;
    procedure onRequestSignature; cdecl;
    procedure onCertVerify(P1: Integer; P2: JString); cdecl;
    procedure onOnlineProc; cdecl;
    procedure onCardDataExchangeComplete; cdecl;
    procedure onTransResult(P1: Integer; P2: JString); cdecl;
    procedure onConfirmationCodeVerified; cdecl;
    procedure onRequestDataExchange(P1: JString); cdecl;
    procedure onTermRiskManagement; cdecl;
    procedure onPreFirstGenAC; cdecl;
    procedure onDataStorageProc(P1: TJavaObjectArray<JString>; P2: TJavaObjectArray<JString>); cdecl;

    { Property }
  end;

  TJEMVListenerV2 = class(TJavaGenericImport<JEMVListenerV2Class, JEMVListenerV2>) end;

  JEMVOptV2_DefaultClass = interface(JObjectClass)
  ['{B3194C44-BA64-4E96-BABA-1CC1D1ECFCC2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEMVOptV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVOptV2$Default')]
  JEMVOptV2_Default = interface(JObject)
  ['{083D5905-8DD7-4C3B-BC40-9EB463DB2139}']
    { Property Methods }

    { methods }
    function addAid(aid: JAidV2): Integer; cdecl;
    function deleteAid(tag9F06Value: JString): Integer; cdecl;
    function addCapk(capk: JCapkV2): Integer; cdecl;
    function deleteCapk(tag9F06Value: JString; tag9F22Value: JString): Integer; cdecl;
    function setTerminalParam(termParam: JEmvTermParamV2): Integer; cdecl;
    function checkAidAndCapk: Integer; cdecl;
    function initEmvProcess: Integer; cdecl;
    procedure transactProcess(transData: JEMVTransDataV2; listener: JEMVListenerV2); cdecl;
    function getTlv(opCode: Integer; tag: JString; outData: TJavaArray<Byte>): Integer; cdecl;
    function getTlvList(opCode: Integer; tags: TJavaObjectArray<JString>; outData: TJavaArray<Byte>): Integer; cdecl;
    procedure setTlv(opCode: Integer; tag: JString; hexValue: JString); cdecl;
    procedure setTlvList(opCode: Integer; tags: TJavaObjectArray<JString>; hexValues: TJavaObjectArray<JString>); cdecl;
    procedure importAppSelect(selectIndex: Integer); cdecl;
    procedure importAppFinalSelectStatus(status: Integer); cdecl;
    procedure importPinInputStatus(pinType: Integer; inputResult: Integer); cdecl;
    procedure importSignatureStatus(status: Integer); cdecl;
    procedure importCertStatus(status: Integer); cdecl;
    procedure importCardNoStatus(status: Integer); cdecl;
    function importOnlineProcStatus(status: Integer; tags: TJavaObjectArray<JString>; hexValues: TJavaObjectArray<JString>; outData: TJavaArray<Byte>): Integer; cdecl;
    function readTransLog(logType: Integer; infoOut: JList): Integer; cdecl;
    procedure abortTransactProcess; cdecl;
    procedure importDataExchangeStatus(status: Integer); cdecl;
    procedure transactProcessEx(transData: JBundle; listener: JEMVListenerV2); cdecl;
    function queryECBalance(bundle: JBundle): Integer; cdecl;
    function addDrlLimitSet(drl: JDrlV2): Integer; cdecl;
    function deleteDrlLimitSet(programId: JString): Integer; cdecl;
    procedure setTermParamEx(bundle: JBundle); cdecl;
    function queryAidCapkList(atype: Integer; list: JList): Integer; cdecl;
    function transactPreProcess: Integer; cdecl;
    function addRevocList(revocList: JRevocListV2): Integer; cdecl;
    function deleteRevocList(revocList: JRevocListV2): Integer; cdecl;
    function sysSetTime(timeStamp: Int64): Integer; cdecl;
    function sysGetTime(outData: TJavaArray<Byte>): Integer; cdecl;
    function clearData(opCode: Integer): Integer; cdecl;
    function setAccountDataSecParam(bundle: JBundle): Integer; cdecl;
    function getAccountSecData(opCode: Integer; tags: TJavaObjectArray<JString>; bundle: JBundle): Integer; cdecl;
    procedure importTermRiskManagementStatus(status: Integer); cdecl;
    procedure importPreFirstGenACStatus(status: Integer); cdecl;
    procedure importDataStorage(tags: TJavaObjectArray<JString>; hexValues: TJavaObjectArray<JString>); cdecl;
    procedure addEMVDataListener(listener: JEMVDataListenerV2); cdecl;
    function addDETData(data: TJavaArray<Byte>): Integer; cdecl;
    function dataInputOutputProcess(mode: Integer; procType: Integer; inData: TJavaArray<Byte>; outData: TJavaArray<Byte>): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJEMVOptV2_Default = class(TJavaGenericImport<JEMVOptV2_DefaultClass, JEMVOptV2_Default>) end;

  JEMVOptV2_Stub_ProxyClass = interface(JObjectClass)
  ['{E76D31BF-A7C4-410A-B2E4-4BC16F11BE23}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JEMVOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JEMVOptV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVOptV2$Stub$Proxy')]
  JEMVOptV2_Stub_Proxy = interface(JObject)
  ['{1E87FB5D-DCCF-4FD1-9AAA-D51246CE6880}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function addAid(aid: JAidV2): Integer; cdecl;
    function deleteAid(tag9F06Value: JString): Integer; cdecl;
    function addCapk(capk: JCapkV2): Integer; cdecl;
    function deleteCapk(tag9F06Value: JString; tag9F22Value: JString): Integer; cdecl;
    function setTerminalParam(termParam: JEmvTermParamV2): Integer; cdecl;
    function checkAidAndCapk: Integer; cdecl;
    function initEmvProcess: Integer; cdecl;
    procedure transactProcess(transData: JEMVTransDataV2; listener: JEMVListenerV2); cdecl;
    function getTlv(opCode: Integer; tag: JString; outData: TJavaArray<Byte>): Integer; cdecl;
    function getTlvList(opCode: Integer; tags: TJavaObjectArray<JString>; outData: TJavaArray<Byte>): Integer; cdecl;
    procedure setTlv(opCode: Integer; tag: JString; hexValue: JString); cdecl;
    procedure setTlvList(opCode: Integer; tags: TJavaObjectArray<JString>; hexValues: TJavaObjectArray<JString>); cdecl;
    procedure importAppSelect(selectIndex: Integer); cdecl;
    procedure importAppFinalSelectStatus(status: Integer); cdecl;
    procedure importPinInputStatus(pinType: Integer; inputResult: Integer); cdecl;
    procedure importSignatureStatus(status: Integer); cdecl;
    procedure importCertStatus(status: Integer); cdecl;
    procedure importCardNoStatus(status: Integer); cdecl;
    function importOnlineProcStatus(status: Integer; tags: TJavaObjectArray<JString>; hexValues: TJavaObjectArray<JString>; outData: TJavaArray<Byte>): Integer; cdecl;
    function readTransLog(logType: Integer; infoOut: JList): Integer; cdecl;
    procedure abortTransactProcess; cdecl;
    procedure importDataExchangeStatus(status: Integer); cdecl;
    procedure transactProcessEx(transData: JBundle; listener: JEMVListenerV2); cdecl;
    function queryECBalance(bundle: JBundle): Integer; cdecl;
    function addDrlLimitSet(drl: JDrlV2): Integer; cdecl;
    function deleteDrlLimitSet(programId: JString): Integer; cdecl;
    procedure setTermParamEx(bundle: JBundle); cdecl;
    function queryAidCapkList(atype: Integer; list: JList): Integer; cdecl;
    function transactPreProcess: Integer; cdecl;
    function addRevocList(revocList: JRevocListV2): Integer; cdecl;
    function deleteRevocList(revocList: JRevocListV2): Integer; cdecl;
    function sysSetTime(timeStamp: Int64): Integer; cdecl;
    function sysGetTime(outData: TJavaArray<Byte>): Integer; cdecl;
    function clearData(opCode: Integer): Integer; cdecl;
    function setAccountDataSecParam(bundle: JBundle): Integer; cdecl;
    function getAccountSecData(opCode: Integer; tags: TJavaObjectArray<JString>; bundle: JBundle): Integer; cdecl;
    procedure importTermRiskManagementStatus(status: Integer); cdecl;
    procedure importPreFirstGenACStatus(status: Integer); cdecl;
    procedure importDataStorage(tags: TJavaObjectArray<JString>; hexValues: TJavaObjectArray<JString>); cdecl;
    procedure addEMVDataListener(listener: JEMVDataListenerV2); cdecl;
    function addDETData(data: TJavaArray<Byte>): Integer; cdecl;
    function dataInputOutputProcess(mode: Integer; procType: Integer; inData: TJavaArray<Byte>; outData: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJEMVOptV2_Stub_Proxy = class(TJavaGenericImport<JEMVOptV2_Stub_ProxyClass, JEMVOptV2_Stub_Proxy>) end;

  JEMVOptV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{BCE59D92-63EB-4D99-B9FC-3B9CF6096456}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEMVOptV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JEMVOptV2; cdecl;
    {class} function setDefaultImpl(impl: JEMVOptV2): Boolean; cdecl;
    {class} function getDefaultImpl: JEMVOptV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVOptV2$Stub')]
  JEMVOptV2_Stub = interface(JBinder) // or JObject
  ['{30F05F58-9A92-44A7-81AC-9F6DC36A916A}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJEMVOptV2_Stub = class(TJavaGenericImport<JEMVOptV2_StubClass, JEMVOptV2_Stub>) end;

  JEMVOptV2Class = interface(JObjectClass)
  ['{67ECD941-EBE9-4298-8AA5-4B1AEA49E413}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/emv/EMVOptV2')]
  JEMVOptV2 = interface(IJavaInstance)
  ['{77E84E89-F29E-49BD-94DA-9F76BB11597C}']
    { Property Methods }

    { methods }
    function addAid(P1: JAidV2): Integer; cdecl;
    function deleteAid(P1: JString): Integer; cdecl;
    function addCapk(P1: JCapkV2): Integer; cdecl;
    function deleteCapk(P1: JString; P2: JString): Integer; cdecl;
    function setTerminalParam(P1: JEmvTermParamV2): Integer; cdecl;
    function checkAidAndCapk: Integer; cdecl;
    function initEmvProcess: Integer; cdecl;
    procedure transactProcess(P1: JEMVTransDataV2; P2: JEMVListenerV2); cdecl;
    function getTlv(P1: Integer; P2: JString; P3: TJavaArray<Byte>): Integer; cdecl;
    function getTlvList(P1: Integer; P2: TJavaObjectArray<JString>; P3: TJavaArray<Byte>): Integer; cdecl;
    procedure setTlv(P1: Integer; P2: JString; P3: JString); cdecl;
    procedure setTlvList(P1: Integer; P2: TJavaObjectArray<JString>; P3: TJavaObjectArray<JString>); cdecl;
    procedure importAppSelect(P1: Integer); cdecl;
    procedure importAppFinalSelectStatus(P1: Integer); cdecl;
    procedure importPinInputStatus(P1: Integer; P2: Integer); cdecl;
    procedure importSignatureStatus(P1: Integer); cdecl;
    procedure importCertStatus(P1: Integer); cdecl;
    procedure importCardNoStatus(P1: Integer); cdecl;
    function importOnlineProcStatus(P1: Integer; P2: TJavaObjectArray<JString>; P3: TJavaObjectArray<JString>; P4: TJavaArray<Byte>): Integer; cdecl;
    function readTransLog(P1: Integer; P2: JList): Integer; cdecl;
    procedure abortTransactProcess; cdecl;
    procedure importDataExchangeStatus(P1: Integer); cdecl;
    procedure transactProcessEx(P1: JBundle; P2: JEMVListenerV2); cdecl;
    function queryECBalance(P1: JBundle): Integer; cdecl;
    function addDrlLimitSet(P1: JDrlV2): Integer; cdecl;
    function deleteDrlLimitSet(P1: JString): Integer; cdecl;
    procedure setTermParamEx(P1: JBundle); cdecl;
    function queryAidCapkList(P1: Integer; P2: JList): Integer; cdecl;
    function transactPreProcess: Integer; cdecl;
    function addRevocList(P1: JRevocListV2): Integer; cdecl;
    function deleteRevocList(P1: JRevocListV2): Integer; cdecl;
    function sysSetTime(P1: Int64): Integer; cdecl;
    function sysGetTime(P1: TJavaArray<Byte>): Integer; cdecl;
    function clearData(P1: Integer): Integer; cdecl;
    function setAccountDataSecParam(P1: JBundle): Integer; cdecl;
    function getAccountSecData(P1: Integer; P2: TJavaObjectArray<JString>; P3: JBundle): Integer; cdecl;
    procedure importTermRiskManagementStatus(P1: Integer); cdecl;
    procedure importPreFirstGenACStatus(P1: Integer); cdecl;
    procedure importDataStorage(P1: TJavaObjectArray<JString>; P2: TJavaObjectArray<JString>); cdecl;
    procedure addEMVDataListener(P1: JEMVDataListenerV2); cdecl;
    function addDETData(P1: TJavaArray<Byte>): Integer; cdecl;
    function dataInputOutputProcess(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJEMVOptV2 = class(TJavaGenericImport<JEMVOptV2Class, JEMVOptV2>) end;

  JETCOptV2_DefaultClass = interface(JObjectClass)
  ['{86DF5E73-6086-4A34-84F1-7627F8D7DA32}']
    { static Property Methods }

    { static Methods }
    {class} function init: JETCOptV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCOptV2$Default')]
  JETCOptV2_Default = interface(JObject)
  ['{A7D529ED-C692-46F5-9968-2B12ED24A15D}']
    { Property Methods }

    { methods }
    function i2cDataExchange(addr: Integer; send: TJavaArray<Byte>; expOutLen: Integer; timeout: Integer; recv: TJavaArray<Byte>): Integer; cdecl;
    procedure search(maxNum: Integer; listener: JETCSearchListenerV2; timeout: Integer); cdecl;
    procedure cancelSearch; cdecl;
    function setSearchParam(bundle: JBundle): Integer; cdecl;
    procedure searchTradeOBU(unixTime: Integer; obuId: JString; timeout: Integer; listener: JETCSearchTradeOBUListenerV2); cdecl;
    function getTradeVehicleCipherInfo(expectLen: Integer; random: JString; macKeyVersion: Integer; encryptVersion: Integer; bundle: JBundle): Integer; cdecl;
    function getTradeRecord(bundle: JBundle): Integer; cdecl;
    function initTrade(keyIndex: Integer; amount: Integer; terminalNo: JString; bundle: JBundle): Integer; cdecl;
    function complexTrade(cacheData: TJavaArray<Byte>; tradeNo: JString; tradeDate: JString; tradeTime: JString; mac: JString; bundle: JBundle): Integer; cdecl;
    function finishTrade(tradeResult: Integer): Integer; cdecl;
    function tradeHeartbeat: Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJETCOptV2_Default = class(TJavaGenericImport<JETCOptV2_DefaultClass, JETCOptV2_Default>) end;

  JETCOptV2_Stub_ProxyClass = interface(JObjectClass)
  ['{69DC3536-0533-4A64-A858-EDD7CFFBB6E7}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JETCOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JETCOptV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCOptV2$Stub$Proxy')]
  JETCOptV2_Stub_Proxy = interface(JObject)
  ['{EB45B618-8AD3-469A-8E44-9825C534B877}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function i2cDataExchange(addr: Integer; send: TJavaArray<Byte>; expOutLen: Integer; timeout: Integer; recv: TJavaArray<Byte>): Integer; cdecl;
    procedure search(maxNum: Integer; listener: JETCSearchListenerV2; timeout: Integer); cdecl;
    procedure cancelSearch; cdecl;
    function setSearchParam(bundle: JBundle): Integer; cdecl;
    procedure searchTradeOBU(unixTime: Integer; obuId: JString; timeout: Integer; listener: JETCSearchTradeOBUListenerV2); cdecl;
    function getTradeVehicleCipherInfo(expectLen: Integer; random: JString; macKeyVersion: Integer; encryptVersion: Integer; bundle: JBundle): Integer; cdecl;
    function getTradeRecord(bundle: JBundle): Integer; cdecl;
    function initTrade(keyIndex: Integer; amount: Integer; terminalNo: JString; bundle: JBundle): Integer; cdecl;
    function complexTrade(cacheData: TJavaArray<Byte>; tradeNo: JString; tradeDate: JString; tradeTime: JString; mac: JString; bundle: JBundle): Integer; cdecl;
    function finishTrade(tradeResult: Integer): Integer; cdecl;
    function tradeHeartbeat: Integer; cdecl;

    { Property }
  end;

  TJETCOptV2_Stub_Proxy = class(TJavaGenericImport<JETCOptV2_Stub_ProxyClass, JETCOptV2_Stub_Proxy>) end;

  JETCOptV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{892C5753-6FC8-4076-9A67-861C8A573F55}']
    { static Property Methods }

    { static Methods }
    {class} function init: JETCOptV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JETCOptV2; cdecl;
    {class} function setDefaultImpl(impl: JETCOptV2): Boolean; cdecl;
    {class} function getDefaultImpl: JETCOptV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCOptV2$Stub')]
  JETCOptV2_Stub = interface(JBinder) // or JObject
  ['{10C0C7E1-281A-4868-8F9F-69E958A040B7}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJETCOptV2_Stub = class(TJavaGenericImport<JETCOptV2_StubClass, JETCOptV2_Stub>) end;

  JETCOptV2Class = interface(JObjectClass)
  ['{94952537-0FAD-4828-90A4-52FA00AE6548}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCOptV2')]
  JETCOptV2 = interface(IJavaInstance)
  ['{9B7AE8F3-E9A4-4230-950B-B5256DC32658}']
    { Property Methods }

    { methods }
    function i2cDataExchange(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: TJavaArray<Byte>): Integer; cdecl;
    procedure search(P1: Integer; P2: JETCSearchListenerV2; P3: Integer); cdecl;
    procedure cancelSearch; cdecl;
    function setSearchParam(P1: JBundle): Integer; cdecl;
    procedure searchTradeOBU(P1: Integer; P2: JString; P3: Integer; P4: JETCSearchTradeOBUListenerV2); cdecl;
    function getTradeVehicleCipherInfo(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: JBundle): Integer; cdecl;
    function getTradeRecord(P1: JBundle): Integer; cdecl;
    function initTrade(P1: Integer; P2: Integer; P3: JString; P4: JBundle): Integer; cdecl;
    function complexTrade(P1: TJavaArray<Byte>; P2: JString; P3: JString; P4: JString; P5: JString; P6: JBundle): Integer; cdecl;
    function finishTrade(P1: Integer): Integer; cdecl;
    function tradeHeartbeat: Integer; cdecl;

    { Property }
  end;

  TJETCOptV2 = class(TJavaGenericImport<JETCOptV2Class, JETCOptV2>) end;

  JETCSearchListenerV2_DefaultClass = interface(JObjectClass)
  ['{0C7FF69D-30CC-4656-8002-F55B0FA81F52}']
    { static Property Methods }

    { static Methods }
    {class} function init: JETCSearchListenerV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCSearchListenerV2$Default')]
  JETCSearchListenerV2_Default = interface(JObject)
  ['{44E2C4A5-E192-4903-8FBF-A921E647EAC8}']
    { Property Methods }

    { methods }
    procedure onSuccess(list: JList); cdecl;
    procedure onError(code: Integer); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJETCSearchListenerV2_Default = class(TJavaGenericImport<JETCSearchListenerV2_DefaultClass, JETCSearchListenerV2_Default>) end;

  JETCSearchListenerV2_Stub_ProxyClass = interface(JObjectClass)
  ['{399CEF30-4061-43DD-93B3-12AB61B5507E}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JETCSearchListenerV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JETCSearchListenerV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCSearchListenerV2$Stub$Proxy')]
  JETCSearchListenerV2_Stub_Proxy = interface(JObject)
  ['{78F50D82-4664-4929-94FA-2B6221E35672}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onSuccess(list: JList); cdecl;
    procedure onError(code: Integer); cdecl;

    { Property }
  end;

  TJETCSearchListenerV2_Stub_Proxy = class(TJavaGenericImport<JETCSearchListenerV2_Stub_ProxyClass, JETCSearchListenerV2_Stub_Proxy>) end;

  JETCSearchListenerV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{72FC7D7D-C1D8-4055-9933-0705D8F24368}']
    { static Property Methods }

    { static Methods }
    {class} function init: JETCSearchListenerV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JETCSearchListenerV2; cdecl;
    {class} function setDefaultImpl(impl: JETCSearchListenerV2): Boolean; cdecl;
    {class} function getDefaultImpl: JETCSearchListenerV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCSearchListenerV2$Stub')]
  JETCSearchListenerV2_Stub = interface(JBinder) // or JObject
  ['{1E98C5D0-1831-44DA-8FC4-E10E9C0B2BD4}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJETCSearchListenerV2_Stub = class(TJavaGenericImport<JETCSearchListenerV2_StubClass, JETCSearchListenerV2_Stub>) end;

  JETCSearchListenerV2Class = interface(JObjectClass)
  ['{8BBC02CE-BD8C-402F-A49D-F1C888C4CD70}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCSearchListenerV2')]
  JETCSearchListenerV2 = interface(IJavaInstance)
  ['{E8F9A9D4-5302-4A48-BA87-74DB96927D8F}']
    { Property Methods }

    { methods }
    procedure onSuccess(P1: JList); cdecl;
    procedure onError(P1: Integer); cdecl;

    { Property }
  end;

  TJETCSearchListenerV2 = class(TJavaGenericImport<JETCSearchListenerV2Class, JETCSearchListenerV2>) end;

  JETCSearchTradeOBUListenerV2_DefaultClass = interface(JObjectClass)
  ['{B0449204-ACD5-41C5-8181-0ECA5301BA95}']
    { static Property Methods }

    { static Methods }
    {class} function init: JETCSearchTradeOBUListenerV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCSearchTradeOBUListenerV2$Default')]
  JETCSearchTradeOBUListenerV2_Default = interface(JObject)
  ['{E09F1382-E226-4069-8828-4EB71C8A076D}']
    { Property Methods }

    { methods }
    procedure onSuccess(bundle: JBundle); cdecl;
    procedure onError(code: Integer); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJETCSearchTradeOBUListenerV2_Default = class(TJavaGenericImport<JETCSearchTradeOBUListenerV2_DefaultClass, JETCSearchTradeOBUListenerV2_Default>) end;

  JETCSearchTradeOBUListenerV2_Stub_ProxyClass = interface(JObjectClass)
  ['{66E1FA52-87B5-4D8D-A08B-2E8CEA2BBAF1}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JETCSearchTradeOBUListenerV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JETCSearchTradeOBUListenerV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCSearchTradeOBUListenerV2$Stub$Proxy')]
  JETCSearchTradeOBUListenerV2_Stub_Proxy = interface(JObject)
  ['{94CF7ABC-A35B-499C-8308-6F20B0D2D60B}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onSuccess(bundle: JBundle); cdecl;
    procedure onError(code: Integer); cdecl;

    { Property }
  end;

  TJETCSearchTradeOBUListenerV2_Stub_Proxy = class(TJavaGenericImport<JETCSearchTradeOBUListenerV2_Stub_ProxyClass, JETCSearchTradeOBUListenerV2_Stub_Proxy>) end;

  JETCSearchTradeOBUListenerV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{25F82E63-364A-4FFC-91BF-41C063E67EB6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JETCSearchTradeOBUListenerV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JETCSearchTradeOBUListenerV2; cdecl;
    {class} function setDefaultImpl(impl: JETCSearchTradeOBUListenerV2): Boolean; cdecl;
    {class} function getDefaultImpl: JETCSearchTradeOBUListenerV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCSearchTradeOBUListenerV2$Stub')]
  JETCSearchTradeOBUListenerV2_Stub = interface(JBinder) // or JObject
  ['{98765DB0-6C43-4AB0-8D49-9B2E44C401F7}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJETCSearchTradeOBUListenerV2_Stub = class(TJavaGenericImport<JETCSearchTradeOBUListenerV2_StubClass, JETCSearchTradeOBUListenerV2_Stub>) end;

  JETCSearchTradeOBUListenerV2Class = interface(JObjectClass)
  ['{170A6EC4-6B42-409C-A96F-BAE1C14878B8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/etc/ETCSearchTradeOBUListenerV2')]
  JETCSearchTradeOBUListenerV2 = interface(IJavaInstance)
  ['{FB17079E-0494-4FD6-90E8-302891099E28}']
    { Property Methods }

    { methods }
    procedure onSuccess(P1: JBundle); cdecl;
    procedure onError(P1: Integer); cdecl;

    { Property }
  end;

  TJETCSearchTradeOBUListenerV2 = class(TJavaGenericImport<JETCSearchTradeOBUListenerV2Class, JETCSearchTradeOBUListenerV2>) end;

  JPinPadListenerV2_DefaultClass = interface(JObjectClass)
  ['{B2E8DCFA-31BC-4AE5-93C1-696CE9CAEF47}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPinPadListenerV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/pinpad/PinPadListenerV2$Default')]
  JPinPadListenerV2_Default = interface(JObject)
  ['{FC32F0C8-7ECD-4CD9-BC5C-0919AF36779B}']
    { Property Methods }

    { methods }
    procedure onPinLength(length: Integer); cdecl;
    procedure onConfirm(atype: Integer; pinBlock: TJavaArray<Byte>); cdecl;
    procedure onCancel; cdecl;
    procedure onError(errorCode: Integer); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJPinPadListenerV2_Default = class(TJavaGenericImport<JPinPadListenerV2_DefaultClass, JPinPadListenerV2_Default>) end;

  JPinPadListenerV2_Stub_ProxyClass = interface(JObjectClass)
  ['{5B707B99-5423-44E0-BD89-8CC697C20211}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JPinPadListenerV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JPinPadListenerV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/pinpad/PinPadListenerV2$Stub$Proxy')]
  JPinPadListenerV2_Stub_Proxy = interface(JObject)
  ['{0C05805C-A2B5-473A-92A9-DA6165AC3AC0}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onPinLength(length: Integer); cdecl;
    procedure onConfirm(atype: Integer; pinBlock: TJavaArray<Byte>); cdecl;
    procedure onCancel; cdecl;
    procedure onError(errorCode: Integer); cdecl;

    { Property }
  end;

  TJPinPadListenerV2_Stub_Proxy = class(TJavaGenericImport<JPinPadListenerV2_Stub_ProxyClass, JPinPadListenerV2_Stub_Proxy>) end;

  JPinPadListenerV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{D6957BE5-DF93-4273-98A0-B527D5DA3153}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPinPadListenerV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JPinPadListenerV2; cdecl;
    {class} function setDefaultImpl(impl: JPinPadListenerV2): Boolean; cdecl;
    {class} function getDefaultImpl: JPinPadListenerV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/pinpad/PinPadListenerV2$Stub')]
  JPinPadListenerV2_Stub = interface(JBinder) // or JObject
  ['{B9A0A2A4-9851-4259-BC32-75D921FE03EB}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJPinPadListenerV2_Stub = class(TJavaGenericImport<JPinPadListenerV2_StubClass, JPinPadListenerV2_Stub>) end;

  JPinPadListenerV2Class = interface(JObjectClass)
  ['{E83BCC5D-017C-490D-ACF8-EAD375E94FBB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/pinpad/PinPadListenerV2')]
  JPinPadListenerV2 = interface(IJavaInstance)
  ['{7D218045-4F89-4B53-8203-8DC71F1C08B2}']
    { Property Methods }

    { methods }
    procedure onPinLength(P1: Integer); cdecl;
    procedure onConfirm(P1: Integer; P2: TJavaArray<Byte>); cdecl;
    procedure onCancel; cdecl;
    procedure onError(P1: Integer); cdecl;

    { Property }
  end;

  TJPinPadListenerV2 = class(TJavaGenericImport<JPinPadListenerV2Class, JPinPadListenerV2>) end;

  JPinPadOptV2_DefaultClass = interface(JObjectClass)
  ['{697A5F56-3ABD-4307-A83F-5F333AD061A9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPinPadOptV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/pinpad/PinPadOptV2$Default')]
  JPinPadOptV2_Default = interface(JObject)
  ['{9AB774E8-4401-4373-BC7C-9BB9FFDD95EF}']
    { Property Methods }

    { methods }
    function initPinPad(config: JPinPadConfigV2; listener: JPinPadListenerV2): JString; cdecl;
    procedure importPinPadData(data: JPinPadDataV2); cdecl;
    procedure cancelInputPin; cdecl;
    procedure setPinPadText(config: JPinPadTextConfigV2); cdecl;
    function setPinPadMode(bundle: JBundle): Integer; cdecl;
    function getPinPadMode(bundle: JBundle): Integer; cdecl;
    function initPinPadEx(config: JBundle; listener: JPinPadListenerV2): JString; cdecl;
    function setAntiExhaustiveProtectionMode(level: Integer): Integer; cdecl;
    function getAntiExhaustiveProtectionMode: Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJPinPadOptV2_Default = class(TJavaGenericImport<JPinPadOptV2_DefaultClass, JPinPadOptV2_Default>) end;

  JPinPadOptV2_Stub_ProxyClass = interface(JObjectClass)
  ['{E2BF0AFC-4A05-47D9-A20C-B7525C5BA149}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JPinPadOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JPinPadOptV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/pinpad/PinPadOptV2$Stub$Proxy')]
  JPinPadOptV2_Stub_Proxy = interface(JObject)
  ['{C918B27F-6C92-4666-B750-2F3B1E1A540F}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function initPinPad(config: JPinPadConfigV2; listener: JPinPadListenerV2): JString; cdecl;
    procedure importPinPadData(data: JPinPadDataV2); cdecl;
    procedure cancelInputPin; cdecl;
    procedure setPinPadText(config: JPinPadTextConfigV2); cdecl;
    function setPinPadMode(bundle: JBundle): Integer; cdecl;
    function getPinPadMode(bundle: JBundle): Integer; cdecl;
    function initPinPadEx(config: JBundle; listener: JPinPadListenerV2): JString; cdecl;
    function setAntiExhaustiveProtectionMode(level: Integer): Integer; cdecl;
    function getAntiExhaustiveProtectionMode: Integer; cdecl;

    { Property }
  end;

  TJPinPadOptV2_Stub_Proxy = class(TJavaGenericImport<JPinPadOptV2_Stub_ProxyClass, JPinPadOptV2_Stub_Proxy>) end;

  JPinPadOptV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{6D97E0EC-9F96-4810-880B-C2CA42B860B9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPinPadOptV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JPinPadOptV2; cdecl;
    {class} function setDefaultImpl(impl: JPinPadOptV2): Boolean; cdecl;
    {class} function getDefaultImpl: JPinPadOptV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/pinpad/PinPadOptV2$Stub')]
  JPinPadOptV2_Stub = interface(JBinder) // or JObject
  ['{27CB1474-F995-4A1C-AF23-A8B2C3E275CE}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJPinPadOptV2_Stub = class(TJavaGenericImport<JPinPadOptV2_StubClass, JPinPadOptV2_Stub>) end;

  JPinPadOptV2Class = interface(JObjectClass)
  ['{DCA13B27-EAE7-4F03-B6ED-0373E0DD9803}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/pinpad/PinPadOptV2')]
  JPinPadOptV2 = interface(IJavaInstance)
  ['{6CA3FDA4-6E20-4814-9DF8-955DD17BD570}']
    { Property Methods }

    { methods }
    function initPinPad(P1: JPinPadConfigV2; P2: JPinPadListenerV2): JString; cdecl;
    procedure importPinPadData(P1: JPinPadDataV2); cdecl;
    procedure cancelInputPin; cdecl;
    procedure setPinPadText(P1: JPinPadTextConfigV2); cdecl;
    function setPinPadMode(P1: JBundle): Integer; cdecl;
    function getPinPadMode(P1: JBundle): Integer; cdecl;
    function initPinPadEx(P1: JBundle; P2: JPinPadListenerV2): JString; cdecl;
    function setAntiExhaustiveProtectionMode(P1: Integer): Integer; cdecl;
    function getAntiExhaustiveProtectionMode: Integer; cdecl;

    { Property }
  end;

  TJPinPadOptV2 = class(TJavaGenericImport<JPinPadOptV2Class, JPinPadOptV2>) end;

  JPrinterCallbackV2_DefaultClass = interface(JObjectClass)
  ['{FFE41AD0-5AF2-48B7-895C-BE2F2AF2233C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrinterCallbackV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/print/PrinterCallbackV2$Default')]
  JPrinterCallbackV2_Default = interface(JObject)
  ['{BDF31CB7-995A-4F61-A78D-4E03325B3024}']
    { Property Methods }

    { methods }
    procedure onPrinterStatusUpdate(status: Integer); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJPrinterCallbackV2_Default = class(TJavaGenericImport<JPrinterCallbackV2_DefaultClass, JPrinterCallbackV2_Default>) end;

  JPrinterCallbackV2_Stub_ProxyClass = interface(JObjectClass)
  ['{3F928C79-B284-4C6A-810E-4041F46AD955}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JPrinterCallbackV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JPrinterCallbackV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/print/PrinterCallbackV2$Stub$Proxy')]
  JPrinterCallbackV2_Stub_Proxy = interface(JObject)
  ['{4796ECC9-4227-4E47-911E-1080954D176A}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onPrinterStatusUpdate(status: Integer); cdecl;

    { Property }
  end;

  TJPrinterCallbackV2_Stub_Proxy = class(TJavaGenericImport<JPrinterCallbackV2_Stub_ProxyClass, JPrinterCallbackV2_Stub_Proxy>) end;

  JPrinterCallbackV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{D57C1DC9-EAF0-438E-9F9A-DE645EA304EB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrinterCallbackV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JPrinterCallbackV2; cdecl;
    {class} function setDefaultImpl(impl: JPrinterCallbackV2): Boolean; cdecl;
    {class} function getDefaultImpl: JPrinterCallbackV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/print/PrinterCallbackV2$Stub')]
  JPrinterCallbackV2_Stub = interface(JBinder) // or JObject
  ['{7F10C25E-3B5B-40FF-8F02-9743FCE92A02}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJPrinterCallbackV2_Stub = class(TJavaGenericImport<JPrinterCallbackV2_StubClass, JPrinterCallbackV2_Stub>) end;

  JPrinterCallbackV2Class = interface(JObjectClass)
  ['{0DC85B09-6502-4226-A7E6-3F1F85CB7F79}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/print/PrinterCallbackV2')]
  JPrinterCallbackV2 = interface(IJavaInstance)
  ['{00697E12-ED38-43C8-A8DC-3631CE535178}']
    { Property Methods }

    { methods }
    procedure onPrinterStatusUpdate(P1: Integer); cdecl;

    { Property }
  end;

  TJPrinterCallbackV2 = class(TJavaGenericImport<JPrinterCallbackV2Class, JPrinterCallbackV2>) end;

  JPrinterOptV2_DefaultClass = interface(JObjectClass)
  ['{D1294FEA-817E-4218-8EA7-27E8EE0AE0CA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrinterOptV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/print/PrinterOptV2$Default')]
  JPrinterOptV2_Default = interface(JObject)
  ['{D557A447-41E7-45B8-8CED-1FF84D52DF1B}']
    { Property Methods }

    { methods }
    function printOpen: Integer; cdecl;
    function printClose: Integer; cdecl;
    function printPointLine(pointRowData: TJavaArray<Byte>): Integer; cdecl;
    function printFeedPaper(nPixels: Integer): Integer; cdecl;
    function getPrinterStatus: Integer; cdecl;
    function getPrinterDriverVersion: JString; cdecl;
    function setGrayLevel(level: Integer): Integer; cdecl;
    function getBufferRemainingRows: Integer; cdecl;
    function getPrinterConfig: JString; cdecl;
    function getPrintGrayLevel: Integer; cdecl;
    function getTotalPrintDistance: Integer; cdecl;
    function getPrinterSN: JString; cdecl;
    procedure registerPrintCallback(callback: JPrinterCallbackV2); cdecl;
    procedure unregisterPrintCallback; cdecl;
    function setPrintSpeed(speed: Integer): Integer; cdecl;
    function setPrintHeatPoint(pointNum: Integer): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJPrinterOptV2_Default = class(TJavaGenericImport<JPrinterOptV2_DefaultClass, JPrinterOptV2_Default>) end;

  JPrinterOptV2_Stub_ProxyClass = interface(JObjectClass)
  ['{998E8D82-7FBF-4AB6-887C-E523FE537555}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JPrinterOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JPrinterOptV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/print/PrinterOptV2$Stub$Proxy')]
  JPrinterOptV2_Stub_Proxy = interface(JObject)
  ['{1680CA2F-336B-4816-B356-7E6EB9FC6154}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function printOpen: Integer; cdecl;
    function printClose: Integer; cdecl;
    function printPointLine(pointRowData: TJavaArray<Byte>): Integer; cdecl;
    function printFeedPaper(nPixels: Integer): Integer; cdecl;
    function getPrinterStatus: Integer; cdecl;
    function getPrinterDriverVersion: JString; cdecl;
    function setGrayLevel(level: Integer): Integer; cdecl;
    function getBufferRemainingRows: Integer; cdecl;
    function getPrinterConfig: JString; cdecl;
    function getPrintGrayLevel: Integer; cdecl;
    function getTotalPrintDistance: Integer; cdecl;
    function getPrinterSN: JString; cdecl;
    procedure registerPrintCallback(callback: JPrinterCallbackV2); cdecl;
    procedure unregisterPrintCallback; cdecl;
    function setPrintSpeed(speed: Integer): Integer; cdecl;
    function setPrintHeatPoint(pointNum: Integer): Integer; cdecl;

    { Property }
  end;

  TJPrinterOptV2_Stub_Proxy = class(TJavaGenericImport<JPrinterOptV2_Stub_ProxyClass, JPrinterOptV2_Stub_Proxy>) end;

  JPrinterOptV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{C801424E-8EFA-4F23-A068-50CC51A6C5B3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrinterOptV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JPrinterOptV2; cdecl;
    {class} function setDefaultImpl(impl: JPrinterOptV2): Boolean; cdecl;
    {class} function getDefaultImpl: JPrinterOptV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/print/PrinterOptV2$Stub')]
  JPrinterOptV2_Stub = interface(JBinder) // or JObject
  ['{92BED7D2-3B18-4459-9820-C71CED710184}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJPrinterOptV2_Stub = class(TJavaGenericImport<JPrinterOptV2_StubClass, JPrinterOptV2_Stub>) end;

  JPrinterOptV2Class = interface(JObjectClass)
  ['{B1D0C7E9-0ACE-4593-B043-FC6EA220A14F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/print/PrinterOptV2')]
  JPrinterOptV2 = interface(IJavaInstance)
  ['{AD3076AF-AE2A-4203-9BC8-96F1E9A9462E}']
    { Property Methods }

    { methods }
    function printOpen: Integer; cdecl;
    function printClose: Integer; cdecl;
    function printPointLine(P1: TJavaArray<Byte>): Integer; cdecl;
    function printFeedPaper(P1: Integer): Integer; cdecl;
    function getPrinterStatus: Integer; cdecl;
    function getPrinterDriverVersion: JString; cdecl;
    function setGrayLevel(P1: Integer): Integer; cdecl;
    function getBufferRemainingRows: Integer; cdecl;
    function getPrinterConfig: JString; cdecl;
    function getPrintGrayLevel: Integer; cdecl;
    function getTotalPrintDistance: Integer; cdecl;
    function getPrinterSN: JString; cdecl;
    procedure registerPrintCallback(P1: JPrinterCallbackV2); cdecl;
    procedure unregisterPrintCallback; cdecl;
    function setPrintSpeed(P1: Integer): Integer; cdecl;
    function setPrintHeatPoint(P1: Integer): Integer; cdecl;

    { Property }
  end;

  TJPrinterOptV2 = class(TJavaGenericImport<JPrinterOptV2Class, JPrinterOptV2>) end;

  JCheckCardCallbackV2_DefaultClass = interface(JObjectClass)
  ['{1D1BD468-3804-4116-8D66-728977AEA098}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCheckCardCallbackV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/readcard/CheckCardCallbackV2$Default')]
  JCheckCardCallbackV2_Default = interface(JObject)
  ['{03F0EA18-C600-4CD9-8ADE-06176673AB6D}']
    { Property Methods }

    { methods }
    procedure findMagCard(info: JBundle); cdecl;
    procedure findICCard(atr: JString); cdecl;
    procedure findRFCard(uuid: JString); cdecl;
    procedure onError(code: Integer; amessage: JString); cdecl;
    procedure findICCardEx(info: JBundle); cdecl;
    procedure findRFCardEx(info: JBundle); cdecl;
    procedure onErrorEx(info: JBundle); cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJCheckCardCallbackV2_Default = class(TJavaGenericImport<JCheckCardCallbackV2_DefaultClass, JCheckCardCallbackV2_Default>) end;

  JCheckCardCallbackV2_Stub_ProxyClass = interface(JObjectClass)
  ['{1D104CF1-C6BA-41A4-8851-8E94CD6BC5B1}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JCheckCardCallbackV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JCheckCardCallbackV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/readcard/CheckCardCallbackV2$Stub$Proxy')]
  JCheckCardCallbackV2_Stub_Proxy = interface(JObject)
  ['{63DEC11C-C264-4CD7-B00C-6B22A13EAE64}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure findMagCard(info: JBundle); cdecl;
    procedure findICCard(atr: JString); cdecl;
    procedure findRFCard(uuid: JString); cdecl;
    procedure onError(code: Integer; amessage: JString); cdecl;
    procedure findICCardEx(info: JBundle); cdecl;
    procedure findRFCardEx(info: JBundle); cdecl;
    procedure onErrorEx(info: JBundle); cdecl;

    { Property }
  end;

  TJCheckCardCallbackV2_Stub_Proxy = class(TJavaGenericImport<JCheckCardCallbackV2_Stub_ProxyClass, JCheckCardCallbackV2_Stub_Proxy>) end;

  JCheckCardCallbackV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{787AA8AF-4CB1-43E5-A37D-C200E6C6A835}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCheckCardCallbackV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JCheckCardCallbackV2; cdecl;
    {class} function setDefaultImpl(impl: JCheckCardCallbackV2): Boolean; cdecl;
    {class} function getDefaultImpl: JCheckCardCallbackV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/readcard/CheckCardCallbackV2$Stub')]
  JCheckCardCallbackV2_Stub = interface(JBinder) // or JObject
  ['{F0282A15-6B51-45B1-A106-B70DC1D97795}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJCheckCardCallbackV2_Stub = class(TJavaGenericImport<JCheckCardCallbackV2_StubClass, JCheckCardCallbackV2_Stub>) end;

  JCheckCardCallbackV2Class = interface(JObjectClass)
  ['{AA7DC2A1-5C18-4349-B060-DAE53EFAE6B5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/readcard/CheckCardCallbackV2')]
  JCheckCardCallbackV2 = interface(IJavaInstance)
  ['{A08D4E7D-3CBE-4EB4-904E-929E26597D27}']
    { Property Methods }

    { methods }
    procedure findMagCard(P1: JBundle); cdecl;
    procedure findICCard(P1: JString); cdecl;
    procedure findRFCard(P1: JString); cdecl;
    procedure onError(P1: Integer; P2: JString); cdecl;
    procedure findICCardEx(P1: JBundle); cdecl;
    procedure findRFCardEx(P1: JBundle); cdecl;
    procedure onErrorEx(P1: JBundle); cdecl;

    { Property }
  end;

  TJCheckCardCallbackV2 = class(TJavaGenericImport<JCheckCardCallbackV2Class, JCheckCardCallbackV2>) end;

  JReadCardOptV2_DefaultClass = interface(JObjectClass)
  ['{79A37DA3-FB99-4432-A6C4-6DD2879B5A4C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReadCardOptV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/readcard/ReadCardOptV2$Default')]
  JReadCardOptV2_Default = interface(JObject)
  ['{94042F28-6C07-4636-A356-8F8AC2C5A9F8}']
    { Property Methods }

    { methods }
    procedure checkCard(cardType: Integer; checkCardCallback: JCheckCardCallbackV2; timeout: Integer); cdecl;
    procedure cancelCheckCard; cdecl;
    function apduCommand(cardType: Integer; send: JApduSendV2; recv: JApduRecvV2): Integer; cdecl;
    function smartCardExchange(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function transmitApdu(cardType: Integer; sendBuff: TJavaArray<Byte>; recvBuff: TJavaArray<Byte>): Integer; cdecl;
    function cardOff(cardType: Integer): Integer; cdecl;
    function getCardExistStatus(cardType: Integer): Integer; cdecl;
    function mifareAuth(keyType: Integer; block: Integer; key: TJavaArray<Byte>): Integer; cdecl;
    function mifareReadBlock(block: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function mifareWriteBlock(block: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function mifareIncValue(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function mifareDecValue(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function mifareUltralightCAuth(authKey: TJavaArray<Byte>): Integer; cdecl;
    function mifareUltralightCReadData(block: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function mifareUltralightCWriteData(block: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function smartCardExChangePASS(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function smartCardExChangePASSNoLength(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function mifarePlusReadBlock(block: Integer; key: TJavaArray<Byte>; outData: TJavaArray<Byte>): Integer; cdecl;
    function mifarePlusWriteBlock(block: Integer; key: TJavaArray<Byte>; data: TJavaArray<Byte>): Integer; cdecl;
    function mifarePlusChangeBlockKey(block: Integer; oldKey: TJavaArray<Byte>; newKey: TJavaArray<Byte>): Integer; cdecl;
    function sleAuthKey(key: TJavaArray<Byte>): Integer; cdecl;
    function sleChangeKey(newKey: TJavaArray<Byte>): Integer; cdecl;
    function sleReadData(startAddress: Integer; length: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function sleWriteData(startAddress: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function sleGetRemainAuthCount: Integer; cdecl;
    function sleWriteProtectionMemory(startAddress: Integer; length: Integer): Integer; cdecl;
    function sleReadMemoryProtectionStatus(startAddress: Integer; length: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function at24cReadData(startAddress: Integer; length: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function at24cWriteData(startAddress: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function at88scAuthKey(key: TJavaArray<Byte>; rwFlag: Integer; zoneNo: Integer): Integer; cdecl;
    function at88scChangeKey(newKey: TJavaArray<Byte>; rwFlag: Integer; zoneNo: Integer): Integer; cdecl;
    function at88scReadData(startAddress: Integer; length: Integer; zoneFlag: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function at88scWriteData(startAddress: Integer; zoneFlag: Integer; dataIn: TJavaArray<Byte>): Integer; cdecl;
    function at88scGetRemainAuthCount(rwFlag: Integer; zoneNo: Integer): Integer; cdecl;
    function transmitApduEx(cardType: Integer; sendBuff: TJavaArray<Byte>; recvBuff: TJavaArray<Byte>): Integer; cdecl;
    function ctx512ReadBlock(block: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function ctx512WriteBlock(block: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function ctx512UpdateBlock(block: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function ctx512GetSignature(block: Integer; random: TJavaArray<Byte>; outData: TJavaArray<Byte>): Integer; cdecl;
    function ctx512MultiReadBlock(startBlock: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function mifareIncValueDx(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function mifareDecValueDx(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function mifareTransfer(destBlock: Integer): Integer; cdecl;
    function mifareRestore(srcBlock: Integer): Integer; cdecl;
    procedure checkCardEx(cardType: Integer; ctrCode: Integer; stopOnError: Integer; checkCardCallback: JCheckCardCallbackV2; timeout: Integer); cdecl;
    function transmitApduExx(cardType: Integer; ctrCode: Integer; sendBuff: TJavaArray<Byte>; recvBuff: TJavaArray<Byte>): Integer; cdecl;
    function transmitMultiApdus(cardType: Integer; ctrCode: Integer; sendList: JList; P4: JList): Integer; cdecl;
    function checkCardEnc(bundle: JBundle; checkCardCallback: JCheckCardCallbackV2; timeout: Integer): Integer; cdecl;
    function smartCardIoControl(cardType: Integer; ctrCode: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sriGetUid(bundle: JBundle): Integer; cdecl;
    function sriReadBlock32(address: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sriWriteBlock32(address: Integer; dataIn: TJavaArray<Byte>): Integer; cdecl;
    function sriProtectBlock(nLockReg: Byte): Integer; cdecl;
    function sriGetBlockProtection(dataOut: TJavaArray<Byte>): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJReadCardOptV2_Default = class(TJavaGenericImport<JReadCardOptV2_DefaultClass, JReadCardOptV2_Default>) end;

  JReadCardOptV2_Stub_ProxyClass = interface(JObjectClass)
  ['{F3190736-D1CC-4427-A854-66812231AD6C}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JReadCardOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JReadCardOptV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/readcard/ReadCardOptV2$Stub$Proxy')]
  JReadCardOptV2_Stub_Proxy = interface(JObject)
  ['{33CA814E-F3FB-4D9A-B31A-E9D76B8FA26A}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure checkCard(cardType: Integer; checkCardCallback: JCheckCardCallbackV2; timeout: Integer); cdecl;
    procedure cancelCheckCard; cdecl;
    function apduCommand(cardType: Integer; send: JApduSendV2; recv: JApduRecvV2): Integer; cdecl;
    function smartCardExchange(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function transmitApdu(cardType: Integer; sendBuff: TJavaArray<Byte>; recvBuff: TJavaArray<Byte>): Integer; cdecl;
    function cardOff(cardType: Integer): Integer; cdecl;
    function getCardExistStatus(cardType: Integer): Integer; cdecl;
    function mifareAuth(keyType: Integer; block: Integer; key: TJavaArray<Byte>): Integer; cdecl;
    function mifareReadBlock(block: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function mifareWriteBlock(block: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function mifareIncValue(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function mifareDecValue(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function mifareUltralightCAuth(authKey: TJavaArray<Byte>): Integer; cdecl;
    function mifareUltralightCReadData(block: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function mifareUltralightCWriteData(block: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function smartCardExChangePASS(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function smartCardExChangePASSNoLength(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl;
    function mifarePlusReadBlock(block: Integer; key: TJavaArray<Byte>; outData: TJavaArray<Byte>): Integer; cdecl;
    function mifarePlusWriteBlock(block: Integer; key: TJavaArray<Byte>; data: TJavaArray<Byte>): Integer; cdecl;
    function mifarePlusChangeBlockKey(block: Integer; oldKey: TJavaArray<Byte>; newKey: TJavaArray<Byte>): Integer; cdecl;
    function sleAuthKey(key: TJavaArray<Byte>): Integer; cdecl;
    function sleChangeKey(newKey: TJavaArray<Byte>): Integer; cdecl;
    function sleReadData(startAddress: Integer; length: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function sleWriteData(startAddress: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function sleGetRemainAuthCount: Integer; cdecl;
    function sleWriteProtectionMemory(startAddress: Integer; length: Integer): Integer; cdecl;
    function sleReadMemoryProtectionStatus(startAddress: Integer; length: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function at24cReadData(startAddress: Integer; length: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function at24cWriteData(startAddress: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function at88scAuthKey(key: TJavaArray<Byte>; rwFlag: Integer; zoneNo: Integer): Integer; cdecl;
    function at88scChangeKey(newKey: TJavaArray<Byte>; rwFlag: Integer; zoneNo: Integer): Integer; cdecl;
    function at88scReadData(startAddress: Integer; length: Integer; zoneFlag: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function at88scWriteData(startAddress: Integer; zoneFlag: Integer; dataIn: TJavaArray<Byte>): Integer; cdecl;
    function at88scGetRemainAuthCount(rwFlag: Integer; zoneNo: Integer): Integer; cdecl;
    function transmitApduEx(cardType: Integer; sendBuff: TJavaArray<Byte>; recvBuff: TJavaArray<Byte>): Integer; cdecl;
    function ctx512ReadBlock(block: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function ctx512WriteBlock(block: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function ctx512UpdateBlock(block: Integer; data: TJavaArray<Byte>): Integer; cdecl;
    function ctx512GetSignature(block: Integer; random: TJavaArray<Byte>; outData: TJavaArray<Byte>): Integer; cdecl;
    function ctx512MultiReadBlock(startBlock: Integer; outData: TJavaArray<Byte>): Integer; cdecl;
    function mifareIncValueDx(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function mifareDecValueDx(block: Integer; value: TJavaArray<Byte>): Integer; cdecl;
    function mifareTransfer(destBlock: Integer): Integer; cdecl;
    function mifareRestore(srcBlock: Integer): Integer; cdecl;
    procedure checkCardEx(cardType: Integer; ctrCode: Integer; stopOnError: Integer; checkCardCallback: JCheckCardCallbackV2; timeout: Integer); cdecl;
    function transmitApduExx(cardType: Integer; ctrCode: Integer; sendBuff: TJavaArray<Byte>; recvBuff: TJavaArray<Byte>): Integer; cdecl;
    function transmitMultiApdus(cardType: Integer; ctrCode: Integer; sendList: JList; P4: JList): Integer; cdecl;
    function checkCardEnc(bundle: JBundle; checkCardCallback: JCheckCardCallbackV2; timeout: Integer): Integer; cdecl;
    function smartCardIoControl(cardType: Integer; ctrCode: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sriGetUid(bundle: JBundle): Integer; cdecl;
    function sriReadBlock32(address: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sriWriteBlock32(address: Integer; dataIn: TJavaArray<Byte>): Integer; cdecl;
    function sriProtectBlock(nLockReg: Byte): Integer; cdecl;
    function sriGetBlockProtection(dataOut: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJReadCardOptV2_Stub_Proxy = class(TJavaGenericImport<JReadCardOptV2_Stub_ProxyClass, JReadCardOptV2_Stub_Proxy>) end;

  JReadCardOptV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{D037B348-0CF1-4062-BAE4-1B6CC73F790C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReadCardOptV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JReadCardOptV2; cdecl;
    {class} function setDefaultImpl(impl: JReadCardOptV2): Boolean; cdecl;
    {class} function getDefaultImpl: JReadCardOptV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/readcard/ReadCardOptV2$Stub')]
  JReadCardOptV2_Stub = interface(JBinder) // or JObject
  ['{89805822-E6DF-4A80-A346-CADD5BCEF761}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJReadCardOptV2_Stub = class(TJavaGenericImport<JReadCardOptV2_StubClass, JReadCardOptV2_Stub>) end;

  JReadCardOptV2Class = interface(JObjectClass)
  ['{B0B4EDDB-C41F-4F50-8BE4-4ED1FAF7D943}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/readcard/ReadCardOptV2')]
  JReadCardOptV2 = interface(IJavaInstance)
  ['{6F42AE08-B3BB-4B88-BF77-466D2F7BC4AA}']
    { Property Methods }

    { methods }
    procedure checkCard(P1: Integer; P2: JCheckCardCallbackV2; P3: Integer); cdecl;
    procedure cancelCheckCard; cdecl;
    function apduCommand(P1: Integer; P2: JApduSendV2; P3: JApduRecvV2): Integer; cdecl;
    function smartCardExchange(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function transmitApdu(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function cardOff(P1: Integer): Integer; cdecl;
    function getCardExistStatus(P1: Integer): Integer; cdecl;
    function mifareAuth(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;
    function mifareReadBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareWriteBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareIncValue(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareDecValue(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareUltralightCAuth(P1: TJavaArray<Byte>): Integer; cdecl;
    function mifareUltralightCReadData(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareUltralightCWriteData(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function smartCardExChangePASS(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function smartCardExChangePASSNoLength(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function mifarePlusReadBlock(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function mifarePlusWriteBlock(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function mifarePlusChangeBlockKey(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function sleAuthKey(P1: TJavaArray<Byte>): Integer; cdecl;
    function sleChangeKey(P1: TJavaArray<Byte>): Integer; cdecl;
    function sleReadData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;
    function sleWriteData(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function sleGetRemainAuthCount: Integer; cdecl;
    function sleWriteProtectionMemory(P1: Integer; P2: Integer): Integer; cdecl;
    function sleReadMemoryProtectionStatus(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;
    function at24cReadData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;
    function at24cWriteData(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function at88scAuthKey(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl;
    function at88scChangeKey(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl;
    function at88scReadData(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;
    function at88scWriteData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;
    function at88scGetRemainAuthCount(P1: Integer; P2: Integer): Integer; cdecl;
    function transmitApduEx(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function ctx512ReadBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function ctx512WriteBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function ctx512UpdateBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function ctx512GetSignature(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function ctx512MultiReadBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareIncValueDx(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareDecValueDx(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function mifareTransfer(P1: Integer): Integer; cdecl;
    function mifareRestore(P1: Integer): Integer; cdecl;
    procedure checkCardEx(P1: Integer; P2: Integer; P3: Integer; P4: JCheckCardCallbackV2; P5: Integer); cdecl;
    function transmitApduExx(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function transmitMultiApdus(P1: Integer; P2: Integer; P3: JList; P4: JList): Integer; cdecl;
    function checkCardEnc(P1: JBundle; P2: JCheckCardCallbackV2; P3: Integer): Integer; cdecl;
    function smartCardIoControl(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function sriGetUid(P1: JBundle): Integer; cdecl;
    function sriReadBlock32(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function sriWriteBlock32(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function sriProtectBlock(P1: Byte): Integer; cdecl;
    function sriGetBlockProtection(P1: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJReadCardOptV2 = class(TJavaGenericImport<JReadCardOptV2Class, JReadCardOptV2>) end;

  JSecurityOptV2_DefaultClass = interface(JObjectClass)
  ['{254A0564-F0B0-4183-86A8-F5B6A6764251}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSecurityOptV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/security/SecurityOptV2$Default')]
  JSecurityOptV2_Default = interface(JObject)
  ['{24877973-F48E-42E3-849E-780A5B026CB9}']
    { Property Methods }

    { methods }
    function saveBaseKey(destinationIndex: Integer; keyData: TJavaArray<Byte>): Integer; cdecl;
    function savePlaintextKey(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; keyAlgType: Integer; keyIndex: Integer): Integer; cdecl;
    function saveCiphertextKey(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; encryptIndex: Integer; keyAlgType: Integer; keyIndex: Integer): Integer; cdecl;
    function calcMac(keyIndex: Integer; macAlgType: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataEncrypt(keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataDecrypt(keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function saveKeyDukpt(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; ksn: TJavaArray<Byte>; encryptType: Integer; keyIndex: Integer): Integer; cdecl;
    function calcMacDukpt(keyIndex: Integer; macType: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataEncryptDukpt(keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptDukpt(keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dukptIncreaseKSN(keyIndex: Integer): Integer; cdecl;
    function dukptCurrentKSN(keyIndex: Integer; outKSN: TJavaArray<Byte>): Integer; cdecl;
    function getKeyCheckValue(keySystem: Integer; keyIndex: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getTUSNEncryptData(dataIn: JString; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function storeSM4Key(dataIn: TJavaArray<Byte>): Integer; cdecl;
    function encryptDataBySM4Key(dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getSecStatus: Integer; cdecl;
    function verifyApkSign(hashMessage: TJavaArray<Byte>; signData: TJavaArray<Byte>): Integer; cdecl;
    function getAuthStatus(atype: Integer): JString; cdecl;
    function getTermStatus: JString; cdecl;
    function setTermStatus: Integer; cdecl;
    function sysRequestAuth(reqType: Byte; authCode: Integer; SN: JString; authData: TJavaArray<Byte>): Integer; cdecl;
    function sysConfirmAuth(dataIn: TJavaArray<Byte>): Integer; cdecl;
    function saveTerminalKey(dataInPuk: TJavaArray<Byte>; dataInPvk: TJavaArray<Byte>): Integer; cdecl;
    function readTerminalPuk(dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getTerminalCertData(dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function generateRSAKeys(pubKeyIndex: Integer; pvtKeyIndex: Integer; keysize: Integer; pubExponent: JString): Integer; cdecl;
    function getRSAPublicKey(pubKeyIndex: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getRSAPrivateKey(pvtKeyIndex: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataEncryptRSA(transformation: JString; keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptRSA(transformation: JString; keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function removeRSAKey(keyIndex: Integer): Integer; cdecl;
    function storeCertificate(certIndex: Integer; certData: TJavaArray<Byte>): Integer; cdecl;
    function getCertificate(certIndex: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dukptGetInitKSN(outKSN: TJavaArray<Byte>): Integer; cdecl;
    function signingRSA(signAlg: JString; pvtKeyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function verifySignatureRSA(signAlg: JString; pubKey: TJavaArray<Byte>; srcData: TJavaArray<Byte>; signature: TJavaArray<Byte>): Integer; cdecl;
    function injectPlaintextKey(targetPkgName: JString; keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; keyAlgType: Integer; keyIndex: Integer): Integer; cdecl;
    function injectCiphertextKey(targetPkgName: JString; keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; encryptIndex: Integer; keyAlgType: Integer; keyIndex: Integer): Integer; cdecl;
    function dataEncryptDukptEx(keySelect: Integer; keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptDukptEx(keySelect: Integer; keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function calcMacDukptEx(keySelect: Integer; keyIndex: Integer; macType: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function verifyMacDukptEx(keySelect: Integer; keyIndex: Integer; macType: Integer; dataIn: TJavaArray<Byte>; macData: TJavaArray<Byte>): Integer; cdecl;
    function saveTR31Key(keyValue: TJavaArray<Byte>; kbpkIndex: Integer; keyIndex: Integer): Integer; cdecl;
    function saveCiphertextKeyRSA(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; keyAlgType: Integer; keyIndex: Integer; encryptIndexRSA: Integer; transformation: JString): Integer; cdecl;
    function saveRSAKey(keyType: Integer; keyValue: TJavaArray<Byte>; keyIndex: Integer): Integer; cdecl;
    function deleteKey(keySystem: Integer; keyIndex: Integer): Integer; cdecl;
    function saveKeyDukptAES(dukptKeyType: Integer; keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; ksn: TJavaArray<Byte>; encryptType: Integer; keyIndex: Integer): Integer; cdecl;
    function calcMacEx(keyIndex: Integer; keyLen: Integer; macAlgType: Integer; diversify: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function generateSM2Keypair(pvkIndex: Integer; pubKey: JBundle): Integer; cdecl;
    function injectSM2Key(keyIndex: Integer; keyData: JBundle): Integer; cdecl;
    function sm2Sign(pukIndex: Integer; pvkIndex: Integer; userId: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm2VerifySign(pukIndex: Integer; userId: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; signData: TJavaArray<Byte>): Integer; cdecl;
    function sm2EncryptData(pukIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm2DecryptData(pvkIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function calcSecHash(mode: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function verifyMac(keyIndex: Integer; macAlgType: Integer; dataIn: TJavaArray<Byte>; mac: TJavaArray<Byte>): Integer; cdecl;
    function generateRSAKeypair(pvkIndex: Integer; keySize: Integer; pubExponent: JString; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function injectRSAKey(keyIndex: Integer; keySize: Integer; module: JString; exponent: JString): Integer; cdecl;
    function generateSymKey(keyIndex: Integer; keyType: Integer; keyAlgType: Integer): Integer; cdecl;
    function injectSymKey(keyIndex: Integer; keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; keyAlgType: Integer): Integer; cdecl;
    function hsmSaveKeyShare(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; keyAlgType: Integer; keyIndex: Integer): Integer; cdecl;
    function hsmSaveKeyShareDukpt(dukptKeyType: Integer; keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; ksn: TJavaArray<Byte>; encryptType: Integer; keyIndex: Integer): Integer; cdecl;
    function hsmCombineKeyShare(keyType: Integer; keyAlgType: Integer; keyIndex: Integer; keyShareIndex1: Integer; keyShareIndex2: Integer; keyShareIndex3: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function hsmGenerateRSAKeypair(pvtKeyIndex: Integer; keySize: Integer; pubExponent: JString; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function hsmInjectRSAKey(keyIndex: Integer; keySize: Integer; module: JString; exponent: JString): Integer; cdecl;
    function hsmSaveKeyUnderKEK(keyIndex: Integer; keyValue: TJavaArray<Byte>; keyType: Integer; keyAlgType: Integer; encryptKeySystem: Integer; encryptIndex: Integer): Integer; cdecl;
    function hsmExportKeyUnderKEK(keyIndex: Integer; kekIndex: Integer; kekKeySystem: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function hsmExportTR31KeyBlock(keyIndex: Integer; encryptIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function hsmDestroyKey(keyIndex: Integer): Integer; cdecl;
    function hsmExchangeKeyEcc(mode: Integer; curveParam: JString; keyIndex: Integer; keyType: Integer; keyAlgType: Integer; pubKeyA: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; pubKeyB: TJavaArray<Byte>): Integer; cdecl;
    function hsmAsymKeyFun(mode: Integer; keySystem: Integer; keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function operateSensitiveService(mode: Integer; pinPadParam: TJavaArray<Byte>): Integer; cdecl;
    function rsaEncryptOrDecryptData(keyIndex: Integer; padding: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function storeDeviceCertPrivateKey(certIndex: Integer; mode: Integer; encryptIndex: Integer; certData: TJavaArray<Byte>; pvkData: TJavaArray<Byte>): Integer; cdecl;
    function getDeviceCertificate(certIndex: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function devicePrivateKeyRecover(keyIndex: Integer; mode: Integer; padding: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getKeyCheckValueEx(bundle: JBundle; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function deleteKeyEx(bundle: JBundle): Integer; cdecl;
    function injectCiphertextKeyEx(bundle: JBundle): Integer; cdecl;
    function injectKeyDukptEx(bundle: JBundle): Integer; cdecl;
    function secKeyIoControl(keyIndex: Integer; ctrCode: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function apacsMac(initMakIndex: Integer; makIndex: Integer; pikIndex: Integer; ctrCode: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function saveKeyEx(bundle: JBundle): Integer; cdecl;
    function hsmSaveKeyUnderKEKEx(bundle: JBundle): Integer; cdecl;
    function hsmExportKeyUnderKEKEx(bundle: JBundle; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function hsmGenerateKeyByOaep(keyIndex: Integer; dependIndex: Integer; keyType: Integer; keyAlgType: Integer; checkValue: TJavaArray<Byte>; keyData: TJavaArray<Byte>): Integer; cdecl;
    function saveCiphertextKeyUnderRSA(keyIndex: Integer; rsaKeyIndex: Integer; keyType: Integer; keyAlgType: Integer; checkValue: TJavaArray<Byte>; keyData: TJavaArray<Byte>): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJSecurityOptV2_Default = class(TJavaGenericImport<JSecurityOptV2_DefaultClass, JSecurityOptV2_Default>) end;

  JSecurityOptV2_Stub_ProxyClass = interface(JObjectClass)
  ['{720E3572-6A28-4E2A-B4C3-78107C797ECF}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JSecurityOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JSecurityOptV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/security/SecurityOptV2$Stub$Proxy')]
  JSecurityOptV2_Stub_Proxy = interface(JObject)
  ['{5F6DCDCB-84A4-4C53-A208-51AE9BAC3EBF}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function saveBaseKey(destinationIndex: Integer; keyData: TJavaArray<Byte>): Integer; cdecl;
    function savePlaintextKey(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; keyAlgType: Integer; keyIndex: Integer): Integer; cdecl;
    function saveCiphertextKey(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; encryptIndex: Integer; keyAlgType: Integer; keyIndex: Integer): Integer; cdecl;
    function calcMac(keyIndex: Integer; macAlgType: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataEncrypt(keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataDecrypt(keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function saveKeyDukpt(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; ksn: TJavaArray<Byte>; encryptType: Integer; keyIndex: Integer): Integer; cdecl;
    function calcMacDukpt(keyIndex: Integer; macType: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataEncryptDukpt(keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptDukpt(keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dukptIncreaseKSN(keyIndex: Integer): Integer; cdecl;
    function dukptCurrentKSN(keyIndex: Integer; outKSN: TJavaArray<Byte>): Integer; cdecl;
    function getKeyCheckValue(keySystem: Integer; keyIndex: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getTUSNEncryptData(dataIn: JString; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function storeSM4Key(dataIn: TJavaArray<Byte>): Integer; cdecl;
    function encryptDataBySM4Key(dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getSecStatus: Integer; cdecl;
    function verifyApkSign(hashMessage: TJavaArray<Byte>; signData: TJavaArray<Byte>): Integer; cdecl;
    function getAuthStatus(atype: Integer): JString; cdecl;
    function getTermStatus: JString; cdecl;
    function setTermStatus: Integer; cdecl;
    function sysRequestAuth(reqType: Byte; authCode: Integer; SN: JString; authData: TJavaArray<Byte>): Integer; cdecl;
    function sysConfirmAuth(dataIn: TJavaArray<Byte>): Integer; cdecl;
    function saveTerminalKey(dataInPuk: TJavaArray<Byte>; dataInPvk: TJavaArray<Byte>): Integer; cdecl;
    function readTerminalPuk(dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getTerminalCertData(dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function generateRSAKeys(pubKeyIndex: Integer; pvtKeyIndex: Integer; keysize: Integer; pubExponent: JString): Integer; cdecl;
    function getRSAPublicKey(pubKeyIndex: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getRSAPrivateKey(pvtKeyIndex: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataEncryptRSA(transformation: JString; keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptRSA(transformation: JString; keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function removeRSAKey(keyIndex: Integer): Integer; cdecl;
    function storeCertificate(certIndex: Integer; certData: TJavaArray<Byte>): Integer; cdecl;
    function getCertificate(certIndex: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dukptGetInitKSN(outKSN: TJavaArray<Byte>): Integer; cdecl;
    function signingRSA(signAlg: JString; pvtKeyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function verifySignatureRSA(signAlg: JString; pubKey: TJavaArray<Byte>; srcData: TJavaArray<Byte>; signature: TJavaArray<Byte>): Integer; cdecl;
    function injectPlaintextKey(targetPkgName: JString; keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; keyAlgType: Integer; keyIndex: Integer): Integer; cdecl;
    function injectCiphertextKey(targetPkgName: JString; keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; encryptIndex: Integer; keyAlgType: Integer; keyIndex: Integer): Integer; cdecl;
    function dataEncryptDukptEx(keySelect: Integer; keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptDukptEx(keySelect: Integer; keyIndex: Integer; dataIn: TJavaArray<Byte>; encryptionMode: Integer; iv: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function calcMacDukptEx(keySelect: Integer; keyIndex: Integer; macType: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function verifyMacDukptEx(keySelect: Integer; keyIndex: Integer; macType: Integer; dataIn: TJavaArray<Byte>; macData: TJavaArray<Byte>): Integer; cdecl;
    function saveTR31Key(keyValue: TJavaArray<Byte>; kbpkIndex: Integer; keyIndex: Integer): Integer; cdecl;
    function saveCiphertextKeyRSA(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; keyAlgType: Integer; keyIndex: Integer; encryptIndexRSA: Integer; transformation: JString): Integer; cdecl;
    function saveRSAKey(keyType: Integer; keyValue: TJavaArray<Byte>; keyIndex: Integer): Integer; cdecl;
    function deleteKey(keySystem: Integer; keyIndex: Integer): Integer; cdecl;
    function saveKeyDukptAES(dukptKeyType: Integer; keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; ksn: TJavaArray<Byte>; encryptType: Integer; keyIndex: Integer): Integer; cdecl;
    function calcMacEx(keyIndex: Integer; keyLen: Integer; macAlgType: Integer; diversify: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function generateSM2Keypair(pvkIndex: Integer; pubKey: JBundle): Integer; cdecl;
    function injectSM2Key(keyIndex: Integer; keyData: JBundle): Integer; cdecl;
    function sm2Sign(pukIndex: Integer; pvkIndex: Integer; userId: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm2VerifySign(pukIndex: Integer; userId: TJavaArray<Byte>; dataIn: TJavaArray<Byte>; signData: TJavaArray<Byte>): Integer; cdecl;
    function sm2EncryptData(pukIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function sm2DecryptData(pvkIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function calcSecHash(mode: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function verifyMac(keyIndex: Integer; macAlgType: Integer; dataIn: TJavaArray<Byte>; mac: TJavaArray<Byte>): Integer; cdecl;
    function generateRSAKeypair(pvkIndex: Integer; keySize: Integer; pubExponent: JString; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function injectRSAKey(keyIndex: Integer; keySize: Integer; module: JString; exponent: JString): Integer; cdecl;
    function generateSymKey(keyIndex: Integer; keyType: Integer; keyAlgType: Integer): Integer; cdecl;
    function injectSymKey(keyIndex: Integer; keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; keyAlgType: Integer): Integer; cdecl;
    function hsmSaveKeyShare(keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; keyAlgType: Integer; keyIndex: Integer): Integer; cdecl;
    function hsmSaveKeyShareDukpt(dukptKeyType: Integer; keyType: Integer; keyValue: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; ksn: TJavaArray<Byte>; encryptType: Integer; keyIndex: Integer): Integer; cdecl;
    function hsmCombineKeyShare(keyType: Integer; keyAlgType: Integer; keyIndex: Integer; keyShareIndex1: Integer; keyShareIndex2: Integer; keyShareIndex3: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function hsmGenerateRSAKeypair(pvtKeyIndex: Integer; keySize: Integer; pubExponent: JString; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function hsmInjectRSAKey(keyIndex: Integer; keySize: Integer; module: JString; exponent: JString): Integer; cdecl;
    function hsmSaveKeyUnderKEK(keyIndex: Integer; keyValue: TJavaArray<Byte>; keyType: Integer; keyAlgType: Integer; encryptKeySystem: Integer; encryptIndex: Integer): Integer; cdecl;
    function hsmExportKeyUnderKEK(keyIndex: Integer; kekIndex: Integer; kekKeySystem: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function hsmExportTR31KeyBlock(keyIndex: Integer; encryptIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function hsmDestroyKey(keyIndex: Integer): Integer; cdecl;
    function hsmExchangeKeyEcc(mode: Integer; curveParam: JString; keyIndex: Integer; keyType: Integer; keyAlgType: Integer; pubKeyA: TJavaArray<Byte>; checkValue: TJavaArray<Byte>; pubKeyB: TJavaArray<Byte>): Integer; cdecl;
    function hsmAsymKeyFun(mode: Integer; keySystem: Integer; keyIndex: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function operateSensitiveService(mode: Integer; pinPadParam: TJavaArray<Byte>): Integer; cdecl;
    function rsaEncryptOrDecryptData(keyIndex: Integer; padding: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function storeDeviceCertPrivateKey(certIndex: Integer; mode: Integer; encryptIndex: Integer; certData: TJavaArray<Byte>; pvkData: TJavaArray<Byte>): Integer; cdecl;
    function getDeviceCertificate(certIndex: Integer; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function devicePrivateKeyRecover(keyIndex: Integer; mode: Integer; padding: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function getKeyCheckValueEx(bundle: JBundle; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function deleteKeyEx(bundle: JBundle): Integer; cdecl;
    function injectCiphertextKeyEx(bundle: JBundle): Integer; cdecl;
    function injectKeyDukptEx(bundle: JBundle): Integer; cdecl;
    function secKeyIoControl(keyIndex: Integer; ctrCode: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function apacsMac(initMakIndex: Integer; makIndex: Integer; pikIndex: Integer; ctrCode: Integer; dataIn: TJavaArray<Byte>; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function saveKeyEx(bundle: JBundle): Integer; cdecl;
    function hsmSaveKeyUnderKEKEx(bundle: JBundle): Integer; cdecl;
    function hsmExportKeyUnderKEKEx(bundle: JBundle; dataOut: TJavaArray<Byte>): Integer; cdecl;
    function hsmGenerateKeyByOaep(keyIndex: Integer; dependIndex: Integer; keyType: Integer; keyAlgType: Integer; checkValue: TJavaArray<Byte>; keyData: TJavaArray<Byte>): Integer; cdecl;
    function saveCiphertextKeyUnderRSA(keyIndex: Integer; rsaKeyIndex: Integer; keyType: Integer; keyAlgType: Integer; checkValue: TJavaArray<Byte>; keyData: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJSecurityOptV2_Stub_Proxy = class(TJavaGenericImport<JSecurityOptV2_Stub_ProxyClass, JSecurityOptV2_Stub_Proxy>) end;

  JSecurityOptV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{A98C538A-B39B-4BF9-B8E2-D133F9976826}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSecurityOptV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JSecurityOptV2; cdecl;
    {class} function setDefaultImpl(impl: JSecurityOptV2): Boolean; cdecl;
    {class} function getDefaultImpl: JSecurityOptV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/security/SecurityOptV2$Stub')]
  JSecurityOptV2_Stub = interface(JBinder) // or JObject
  ['{BB1D9296-0BDF-4C9B-A837-AB8E50A05590}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJSecurityOptV2_Stub = class(TJavaGenericImport<JSecurityOptV2_StubClass, JSecurityOptV2_Stub>) end;

  JSecurityOptV2Class = interface(JObjectClass)
  ['{BDF92F67-6060-4C5B-AC84-BDBFA795AA2A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/security/SecurityOptV2')]
  JSecurityOptV2 = interface(IJavaInstance)
  ['{52C1D2F3-CF04-420B-AC3D-53CFA3148E6F}']
    { Property Methods }

    { methods }
    function saveBaseKey(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function savePlaintextKey(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: Integer; P5: Integer): Integer; cdecl;
    function saveCiphertextKey(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl;
    function calcMac(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function dataEncrypt(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function dataDecrypt(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function saveKeyDukpt(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: Integer; P6: Integer): Integer; cdecl;
    function calcMacDukpt(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function dataEncryptDukpt(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptDukpt(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function dukptIncreaseKSN(P1: Integer): Integer; cdecl;
    function dukptCurrentKSN(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function getKeyCheckValue(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;
    function getTUSNEncryptData(P1: JString; P2: TJavaArray<Byte>): Integer; cdecl;
    function storeSM4Key(P1: TJavaArray<Byte>): Integer; cdecl;
    function encryptDataBySM4Key(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;
    function getSecStatus: Integer; cdecl;
    function verifyApkSign(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;
    function getAuthStatus(P1: Integer): JString; cdecl;
    function getTermStatus: JString; cdecl;
    function setTermStatus: Integer; cdecl;
    function sysRequestAuth(P1: Byte; P2: Integer; P3: JString; P4: TJavaArray<Byte>): Integer; cdecl;
    function sysConfirmAuth(P1: TJavaArray<Byte>): Integer; cdecl;
    function saveTerminalKey(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;
    function readTerminalPuk(P1: TJavaArray<Byte>): Integer; cdecl;
    function getTerminalCertData(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;
    function generateRSAKeys(P1: Integer; P2: Integer; P3: Integer; P4: JString): Integer; cdecl;
    function getRSAPublicKey(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function getRSAPrivateKey(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function dataEncryptRSA(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptRSA(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function removeRSAKey(P1: Integer): Integer; cdecl;
    function storeCertificate(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function getCertificate(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function dukptGetInitKSN(P1: TJavaArray<Byte>): Integer; cdecl;
    function signingRSA(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function verifySignatureRSA(P1: JString; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function injectPlaintextKey(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: Integer; P6: Integer): Integer; cdecl;
    function injectCiphertextKey(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl;
    function dataEncryptDukptEx(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>): Integer; cdecl;
    function dataDecryptDukptEx(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>): Integer; cdecl;
    function calcMacDukptEx(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function verifyMacDukptEx(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function saveTR31Key(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl;
    function saveCiphertextKeyRSA(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: Integer; P5: Integer; P6: Integer; P7: JString): Integer; cdecl;
    function saveRSAKey(P1: Integer; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl;
    function deleteKey(P1: Integer; P2: Integer): Integer; cdecl;
    function saveKeyDukptAES(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Integer; P7: Integer): Integer; cdecl;
    function calcMacEx(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>): Integer; cdecl;
    function generateSM2Keypair(P1: Integer; P2: JBundle): Integer; cdecl;
    function injectSM2Key(P1: Integer; P2: JBundle): Integer; cdecl;
    function sm2Sign(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function sm2VerifySign(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function sm2EncryptData(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function sm2DecryptData(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function calcSecHash(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl;
    function verifyMac(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function generateRSAKeypair(P1: Integer; P2: Integer; P3: JString; P4: TJavaArray<Byte>): Integer; cdecl;
    function injectRSAKey(P1: Integer; P2: Integer; P3: JString; P4: JString): Integer; cdecl;
    function generateSymKey(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;
    function injectSymKey(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: Integer): Integer; cdecl;
    function hsmSaveKeyShare(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: Integer; P5: Integer): Integer; cdecl;
    function hsmSaveKeyShareDukpt(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Integer; P7: Integer): Integer; cdecl;
    function hsmCombineKeyShare(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>): Integer; cdecl;
    function hsmGenerateRSAKeypair(P1: Integer; P2: Integer; P3: JString; P4: TJavaArray<Byte>): Integer; cdecl;
    function hsmInjectRSAKey(P1: Integer; P2: Integer; P3: JString; P4: JString): Integer; cdecl;
    function hsmSaveKeyUnderKEK(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: Integer; P6: Integer): Integer; cdecl;
    function hsmExportKeyUnderKEK(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;
    function hsmExportTR31KeyBlock(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function hsmDestroyKey(P1: Integer): Integer; cdecl;
    function hsmExchangeKeyEcc(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Byte>): Integer; cdecl;
    function hsmAsymKeyFun(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function operateSensitiveService(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function rsaEncryptOrDecryptData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function storeDeviceCertPrivateKey(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function getDeviceCertificate(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;
    function devicePrivateKeyRecover(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;
    function getKeyCheckValueEx(P1: JBundle; P2: TJavaArray<Byte>): Integer; cdecl;
    function deleteKeyEx(P1: JBundle): Integer; cdecl;
    function injectCiphertextKeyEx(P1: JBundle): Integer; cdecl;
    function injectKeyDukptEx(P1: JBundle): Integer; cdecl;
    function secKeyIoControl(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;
    function apacsMac(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>): Integer; cdecl;
    function saveKeyEx(P1: JBundle): Integer; cdecl;
    function hsmSaveKeyUnderKEKEx(P1: JBundle): Integer; cdecl;
    function hsmExportKeyUnderKEKEx(P1: JBundle; P2: TJavaArray<Byte>): Integer; cdecl;
    function hsmGenerateKeyByOaep(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>): Integer; cdecl;
    function saveCiphertextKeyUnderRSA(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJSecurityOptV2 = class(TJavaGenericImport<JSecurityOptV2Class, JSecurityOptV2>) end;

  JBasicOptV2_DefaultClass = interface(JObjectClass)
  ['{D2B4B455-F596-4AA4-A9E5-20C3E6B9C72E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBasicOptV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/system/BasicOptV2$Default')]
  JBasicOptV2_Default = interface(JObject)
  ['{808E9069-6F6B-4462-A507-E421C077D4ED}']
    { Property Methods }

    { methods }
    function getSysParam(key: JString): JString; cdecl;
    function setSysParam(key: JString; value: JString): Integer; cdecl;
    procedure buzzerOnDevice(count: Integer; freq: Integer; duration: Integer; interval: Integer); cdecl;
    function ledStatusOnDevice(ledIndex: Integer; ledStatus: Integer): Integer; cdecl;
    function setScreenMode(mode: Integer): Integer; cdecl;
    function sysGetRandom(randData: TJavaArray<Byte>; len: Integer): Integer; cdecl;
    function ledStatusOnDeviceEx(redStatus: Integer; greenStatus: Integer; yellowStatus: Integer; blueStatus: Integer): Integer; cdecl;
    function setStatusBarDropDownMode(mode: Integer): Integer; cdecl;
    function setNavigationBarVisibility(visibility: Integer): Integer; cdecl;
    function setHideNavigationBarItems(flag: Integer): Integer; cdecl;
    function sysPowerManage(mode: Integer): Integer; cdecl;
    function sysSetWakeup(channel: Integer; mode: Integer; attr: JBundle): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJBasicOptV2_Default = class(TJavaGenericImport<JBasicOptV2_DefaultClass, JBasicOptV2_Default>) end;

  JBasicOptV2_Stub_ProxyClass = interface(JObjectClass)
  ['{CA9D8A58-7176-44A0-928C-A07A52A3B121}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JBasicOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JBasicOptV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/system/BasicOptV2$Stub$Proxy')]
  JBasicOptV2_Stub_Proxy = interface(JObject)
  ['{40CF2DA4-0A7B-45E8-ADF3-388F19383F03}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function getSysParam(key: JString): JString; cdecl;
    function setSysParam(key: JString; value: JString): Integer; cdecl;
    procedure buzzerOnDevice(count: Integer; freq: Integer; duration: Integer; interval: Integer); cdecl;
    function ledStatusOnDevice(ledIndex: Integer; ledStatus: Integer): Integer; cdecl;
    function setScreenMode(mode: Integer): Integer; cdecl;
    function sysGetRandom(randData: TJavaArray<Byte>; len: Integer): Integer; cdecl;
    function ledStatusOnDeviceEx(redStatus: Integer; greenStatus: Integer; yellowStatus: Integer; blueStatus: Integer): Integer; cdecl;
    function setStatusBarDropDownMode(mode: Integer): Integer; cdecl;
    function setNavigationBarVisibility(visibility: Integer): Integer; cdecl;
    function setHideNavigationBarItems(flag: Integer): Integer; cdecl;
    function sysPowerManage(mode: Integer): Integer; cdecl;
    function sysSetWakeup(channel: Integer; mode: Integer; attr: JBundle): Integer; cdecl;

    { Property }
  end;

  TJBasicOptV2_Stub_Proxy = class(TJavaGenericImport<JBasicOptV2_Stub_ProxyClass, JBasicOptV2_Stub_Proxy>) end;

  JBasicOptV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{C6728B1B-1302-4C76-8F3E-490CCCF729C2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBasicOptV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JBasicOptV2; cdecl;
    {class} function setDefaultImpl(impl: JBasicOptV2): Boolean; cdecl;
    {class} function getDefaultImpl: JBasicOptV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/system/BasicOptV2$Stub')]
  JBasicOptV2_Stub = interface(JBinder) // or JObject
  ['{0854E6FF-1CEB-4F71-80DB-9FD825C9C0A5}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJBasicOptV2_Stub = class(TJavaGenericImport<JBasicOptV2_StubClass, JBasicOptV2_Stub>) end;

  JBasicOptV2Class = interface(JObjectClass)
  ['{ACF3560B-01D0-427A-858E-FD7533954489}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/system/BasicOptV2')]
  JBasicOptV2 = interface(IJavaInstance)
  ['{5F3A4B97-AE39-437D-A886-A3BFB49B16E5}']
    { Property Methods }

    { methods }
    function getSysParam(P1: JString): JString; cdecl;
    function setSysParam(P1: JString; P2: JString): Integer; cdecl;
    procedure buzzerOnDevice(P1: Integer; P2: Integer; P3: Integer; P4: Integer); cdecl;
    function ledStatusOnDevice(P1: Integer; P2: Integer): Integer; cdecl;
    function setScreenMode(P1: Integer): Integer; cdecl;
    function sysGetRandom(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    function ledStatusOnDeviceEx(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;
    function setStatusBarDropDownMode(P1: Integer): Integer; cdecl;
    function setNavigationBarVisibility(P1: Integer): Integer; cdecl;
    function setHideNavigationBarItems(P1: Integer): Integer; cdecl;
    function sysPowerManage(P1: Integer): Integer; cdecl;
    function sysSetWakeup(P1: Integer; P2: Integer; P3: JBundle): Integer; cdecl;

    { Property }
  end;

  TJBasicOptV2 = class(TJavaGenericImport<JBasicOptV2Class, JBasicOptV2>) end;

  JTaxOptV2_DefaultClass = interface(JObjectClass)
  ['{2ED49BDD-B6EE-4544-97DE-2F1946DAB3EF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTaxOptV2_Default; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/tax/TaxOptV2$Default')]
  JTaxOptV2_Default = interface(JObject)
  ['{586486AF-D530-401C-B390-D969B483154B}']
    { Property Methods }

    { methods }
    function taxDataExchange(taxSend: TJavaArray<Byte>; taxRecv: TJavaArray<Byte>): Integer; cdecl;
    function asBinder: JIBinder; cdecl;

    { Property }
  end;

  TJTaxOptV2_Default = class(TJavaGenericImport<JTaxOptV2_DefaultClass, JTaxOptV2_Default>) end;

  JTaxOptV2_Stub_ProxyClass = interface(JObjectClass)
  ['{E95AF249-EC13-4569-9EF7-422B58EE12D0}']
    { static Property Methods }
    {class} function _GetsDefaultImpl: JTaxOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property sDefaultImpl: JTaxOptV2 read _GetsDefaultImpl;
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/tax/TaxOptV2$Stub$Proxy')]
  JTaxOptV2_Stub_Proxy = interface(JObject)
  ['{725A1A9E-4046-4FF2-9297-829DF1FB447E}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function taxDataExchange(taxSend: TJavaArray<Byte>; taxRecv: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJTaxOptV2_Stub_Proxy = class(TJavaGenericImport<JTaxOptV2_Stub_ProxyClass, JTaxOptV2_Stub_Proxy>) end;

  JTaxOptV2_StubClass = interface(JBinderClass) // or JObjectClass
  ['{29FE893A-B31A-4D88-9ACD-CD406E992540}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTaxOptV2_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JTaxOptV2; cdecl;
    {class} function setDefaultImpl(impl: JTaxOptV2): Boolean; cdecl;
    {class} function getDefaultImpl: JTaxOptV2; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/tax/TaxOptV2$Stub')]
  JTaxOptV2_Stub = interface(JBinder) // or JObject
  ['{7C272C82-866F-410B-8694-F57D66BC58BF}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJTaxOptV2_Stub = class(TJavaGenericImport<JTaxOptV2_StubClass, JTaxOptV2_Stub>) end;

  JTaxOptV2Class = interface(JObjectClass)
  ['{E55B6CC7-F68B-4E9F-B01B-90415A75FE6E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/pay/hardware/aidlv2/tax/TaxOptV2')]
  JTaxOptV2 = interface(IJavaInstance)
  ['{3DCE7191-05B1-40A1-84F4-B3B675BCF94F}']
    { Property Methods }

    { methods }
    function taxDataExchange(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJTaxOptV2 = class(TJavaGenericImport<JTaxOptV2Class, JTaxOptV2>) end;

  JBuildConfigClass = interface(JObjectClass)
  ['{1EC48E0C-CD3A-44D9-8352-06937EF4E320}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBuildConfig; cdecl;

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
  end;

  [JavaSignature('com/sunmi/paylib/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{BF031712-99B2-4C37-AA8A-DFE893F8E86E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

//  JSunmiPayKernel_1Class = interface(JObjectClass)
//  ['{91A5703D-1BFE-4C3A-8786-A2C1940A9394}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('sunmi/paylib/SunmiPayKernel$1')]
//  JSunmiPayKernel_1 = interface(JObject)
//  ['{3B8CE0B5-AE00-4525-A89E-CA532CF9B2DA}']
//    { Property Methods }
//
//    { methods }
//    procedure onServiceConnected(name: JComponentName; service: JIBinder); cdecl;
//    procedure onServiceDisconnected(name: JComponentName); cdecl;
//
//    { Property }
//  end;

//  TJSunmiPayKernel_1 = class(TJavaGenericImport<JSunmiPayKernel_1Class, JSunmiPayKernel_1>) end;

  JSunmiPayKernel_ConnCallbackClass = interface(JObjectClass)
  ['{E390BF15-61BD-4FBB-8B7F-5685E4EAB62A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('sunmi/paylib/SunmiPayKernel$ConnCallback')]
  JSunmiPayKernel_ConnCallback = interface(IJavaInstance)
  ['{CFF2B92A-5FC1-46D6-A3A1-3B5C628061FF}']
    { Property Methods }

    { methods }
    procedure onServiceConnected; cdecl;
    procedure onServiceDisconnected; cdecl;

    { Property }
  end;

  TJSunmiPayKernel_ConnCallback = class(TJavaGenericImport<JSunmiPayKernel_ConnCallbackClass, JSunmiPayKernel_ConnCallback>) end;

  JSunmiPayKernel_ConnectCallbackClass = interface(JObjectClass)
  ['{8E802DBF-F5F6-459C-AEB8-D6A546A3212F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('sunmi/paylib/SunmiPayKernel$ConnectCallback')]
  JSunmiPayKernel_ConnectCallback = interface(IJavaInstance)
  ['{63E8C8DF-FC95-4964-A963-5E3A00B2F659}']
    { Property Methods }

    { methods }
    procedure onConnectPaySDK; cdecl;
    procedure onDisconnectPaySDK; cdecl;

    { Property }
  end;

  TJSunmiPayKernel_ConnectCallback = class(TJavaGenericImport<JSunmiPayKernel_ConnectCallbackClass, JSunmiPayKernel_ConnectCallback>) end;

  JSunmiPayKernelClass = interface(JObjectClass)
  ['{4DC11DE7-5397-4D2B-B309-47954514DF18}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JSunmiPayKernel; cdecl;
    {class} procedure screenMonopoly(window: JWindow); cdecl; overload;
//    {class} procedure screenMonopoly(dialog: JDialog); cdecl; overload;

    { static Property }
  end;

  [JavaSignature('sunmi/paylib/SunmiPayKernel')]
  JSunmiPayKernel = interface(JObject)
  ['{172F78FE-9EF6-4505-AB55-08FD7D0FB14B}']
    { Property Methods }
    function _GetmBasicOpt: JBasicOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmBasicOpt(amBasicOpt: JBasicOpt);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmReadCardOpt: JReadCardOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmReadCardOpt(amReadCardOpt: JReadCardOpt);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmPinPadOpt: JPinPadOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmPinPadOpt(amPinPadOpt: JPinPadOpt);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmEMVOpt: JEMVOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmEMVOpt(amEMVOpt: JEMVOpt);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmSecurityOpt: JSecurityOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmSecurityOpt(amSecurityOpt: JSecurityOpt);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmPrinterOpt: JPrinterOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmPrinterOpt(amPrinterOpt: JPrinterOpt);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmTaxOpt: JTaxOpt;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmTaxOpt(amTaxOpt: JTaxOpt);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmBasicOptV2: JBasicOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmBasicOptV2(amBasicOptV2: JBasicOptV2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmReadCardOptV2: JReadCardOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmReadCardOptV2(amReadCardOptV2: JReadCardOptV2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmPinPadOptV2: JPinPadOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmPinPadOptV2(amPinPadOptV2: JPinPadOptV2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmEMVOptV2: JEMVOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmEMVOptV2(amEMVOptV2: JEMVOptV2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmSecurityOptV2: JSecurityOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmSecurityOptV2(amSecurityOptV2: JSecurityOptV2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmPrinterOptV2: JPrinterOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmPrinterOptV2(amPrinterOptV2: JPrinterOptV2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmTaxOptV2: JTaxOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmTaxOptV2(amTaxOptV2: JTaxOptV2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmETCOptV2: JETCOptV2;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmETCOptV2(amETCOptV2: JETCOptV2);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getAppContext: JContext; cdecl;
    procedure setAppContext(appContext: JContext); cdecl;
    function getPayLibVersion: JString; cdecl;
    function getMatchedPaySDKVersion: JString; cdecl;
    procedure connectPayService(context: JContext; connCallback: JSunmiPayKernel_ConnCallback); cdecl; //Deprecated
    function initPaySDK(context: JContext; callback: JSunmiPayKernel_ConnectCallback): Boolean; cdecl;
    procedure unbindPayService(context: JContext); cdecl; //Deprecated
    procedure destroyPaySDK; cdecl;

    { Property }
    property mBasicOpt: JBasicOpt read _GetmBasicOpt write _SetmBasicOpt;
    property mReadCardOpt: JReadCardOpt read _GetmReadCardOpt write _SetmReadCardOpt;
    property mPinPadOpt: JPinPadOpt read _GetmPinPadOpt write _SetmPinPadOpt;
    property mEMVOpt: JEMVOpt read _GetmEMVOpt write _SetmEMVOpt;
    property mSecurityOpt: JSecurityOpt read _GetmSecurityOpt write _SetmSecurityOpt;
    property mPrinterOpt: JPrinterOpt read _GetmPrinterOpt write _SetmPrinterOpt;
    property mTaxOpt: JTaxOpt read _GetmTaxOpt write _SetmTaxOpt;
    property mBasicOptV2: JBasicOptV2 read _GetmBasicOptV2 write _SetmBasicOptV2;
    property mReadCardOptV2: JReadCardOptV2 read _GetmReadCardOptV2 write _SetmReadCardOptV2;
    property mPinPadOptV2: JPinPadOptV2 read _GetmPinPadOptV2 write _SetmPinPadOptV2;
    property mEMVOptV2: JEMVOptV2 read _GetmEMVOptV2 write _SetmEMVOptV2;
    property mSecurityOptV2: JSecurityOptV2 read _GetmSecurityOptV2 write _SetmSecurityOptV2;
    property mPrinterOptV2: JPrinterOptV2 read _GetmPrinterOptV2 write _SetmPrinterOptV2;
    property mTaxOptV2: JTaxOptV2 read _GetmTaxOptV2 write _SetmTaxOptV2;
    property mETCOptV2: JETCOptV2 read _GetmETCOptV2 write _SetmETCOptV2;
  end;

  TJSunmiPayKernel = class(TJavaGenericImport<JSunmiPayKernelClass, JSunmiPayKernel>) end;

//  JUIUtils_1Class = interface(JObjectClass)
//  ['{B9C812A6-CCB8-4F93-AB97-20494C9DD040}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('sunmi/paylib/UIUtils$1')]
//  JUIUtils_1 = interface(JObject)
//  ['{925D79FC-1FC4-42E3-9074-0259270B4085}']
//    { Property Methods }
//
//    { methods }
//    function onKey(dialog: JDialogInterface; keyCode: Integer; event: JKeyEvent): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJUIUtils_1 = class(TJavaGenericImport<JUIUtils_1Class, JUIUtils_1>) end;

  JUIUtilsClass = interface(JObjectClass)
  ['{F57005A9-635A-45F6-B1FC-4FC73BF338DD}']
    { static Property Methods }

    { static Methods }
    {class} procedure setSunmiSecStatusBar(view: JView); cdecl;
    {class} procedure banPowerKey(window: JWindow); cdecl;
//    {class} procedure banVolumeKey(dialog: JDialog); cdecl;
    {class} procedure screenMonopoly(window: JWindow); cdecl; overload;
    {class} procedure screenMonopoly(dialog: JDialog); cdecl; overload;
    {class} procedure setLight(context: JActivity; brightness: Integer); cdecl;

    { static Property }
  end;

  [JavaSignature('sunmi/paylib/UIUtils')]
  JUIUtils = interface(JObject)
  ['{AC0A239F-F6FB-4423-9303-535AAC8DEE90}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUIUtils = class(TJavaGenericImport<JUIUtilsClass, JUIUtils>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_CardExistStatus',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_CardExistStatus));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_CardType',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_CardType));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_CertType',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_CertType));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_AID',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_AID));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_CAPK',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_CAPK));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_ClearDataOpCode',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_ClearDataOpCode));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_FlowType',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_FlowType));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_KernelType',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_KernelType));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_OnlineResult',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_OnlineResult));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_ParamType',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_ParamType));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_PinPad',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_PinPad));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_TLVOpCode',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_TLVOpCode));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_TransResult',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV_TransResult));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_EMV));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_KBBeepMode',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_KBBeepMode));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_LedLight',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_LedLight));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_PinBlockFormat',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_PinBlockFormat));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_PinPadMode',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_PinPadMode));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_PowerManage',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_PowerManage));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_PrinterStatus',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_PrinterStatus));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_ReadCard',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_ReadCard));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_Security',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_Security));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_SysParam',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_SysParam));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_SystemUI',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants_SystemUI));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstants));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlErrorCode',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlErrorCode));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCardInfo_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCardInfo_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCardInfo',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCardInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEmvTermParam_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEmvTermParam_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEmvTermParam',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEmvTermParam));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadConfig_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadConfig_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadConfig',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadData_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadData_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadData',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadData));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JTransData_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JTransData_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JTransData',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JTransData));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JDeviceProvide_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JDeviceProvide_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JDeviceProvide_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JDeviceProvide_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JDeviceProvide_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JDeviceProvide_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JDeviceProvide',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JDeviceProvide));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListener_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListener_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListener_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListener_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListener_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListener_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListener',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListener));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOpt_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOpt_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOpt_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOpt_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOpt_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOpt_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOpt',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOpt));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListener_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListener_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListener_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListener_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListener_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListener_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListener',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListener));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOpt_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOpt_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOpt_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOpt_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOpt_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOpt_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOpt',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOpt));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallback_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallback_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallback_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallback_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallback_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallback_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallback',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallback));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOpt_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOpt_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOpt_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOpt_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOpt_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOpt_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOpt',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOpt));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallback_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallback_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallback_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallback_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallback_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallback_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallback',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallback));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardCallback_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardCallback_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardCallback_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardCallback_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardCallback_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardCallback_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardCallback',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardCallback));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOpt_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOpt_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOpt_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOpt_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOpt_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOpt_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOpt',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOpt));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOpt_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOpt_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOpt_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOpt_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOpt_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOpt_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOpt',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOpt));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSPErrorCode',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSPErrorCode));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOpt_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOpt_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOpt_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOpt_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOpt_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOpt_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOpt',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOpt));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOpt_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOpt_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOpt_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOpt_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOpt_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOpt_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOpt',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOpt));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstantsV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlConstantsV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlErrorCodeV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidlErrorCodeV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JAidV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JAidV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JApduRecvV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JApduRecvV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JApduRecvV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JApduRecvV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JApduSendV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JApduSendV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JApduSendV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JApduSendV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCapkV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCapkV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCapkV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCapkV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JDrlV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JDrlV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JDrlV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JDrlV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVCandidateV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVCandidateV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVCandidateV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVCandidateV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEmvTermParamV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEmvTermParamV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEmvTermParamV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEmvTermParamV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVTransDataV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVTransDataV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVTransDataV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVTransDataV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCInfoV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCInfoV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCInfoV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCInfoV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadConfigV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadConfigV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadConfigV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadConfigV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadDataV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadDataV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadDataV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadDataV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadTextConfigV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadTextConfigV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadTextConfigV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadTextConfigV2));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JRevocListV2_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JRevocListV2_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JRevocListV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JRevocListV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVDataListenerV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVDataListenerV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVDataListenerV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVDataListenerV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVDataListenerV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVDataListenerV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVDataListenerV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVDataListenerV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListenerV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListenerV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListenerV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListenerV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListenerV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListenerV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListenerV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVListenerV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOptV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOptV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOptV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOptV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOptV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOptV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOptV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JEMVOptV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCOptV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCOptV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCOptV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCOptV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCOptV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCOptV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCOptV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCOptV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchListenerV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchListenerV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchListenerV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchListenerV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchListenerV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchListenerV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchListenerV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchListenerV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchTradeOBUListenerV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchTradeOBUListenerV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchTradeOBUListenerV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchTradeOBUListenerV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchTradeOBUListenerV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchTradeOBUListenerV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchTradeOBUListenerV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JETCSearchTradeOBUListenerV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListenerV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListenerV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListenerV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListenerV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListenerV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListenerV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListenerV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadListenerV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOptV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOptV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOptV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOptV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOptV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOptV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOptV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPinPadOptV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallbackV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallbackV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallbackV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallbackV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallbackV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallbackV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallbackV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterCallbackV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOptV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOptV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOptV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOptV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOptV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOptV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOptV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JPrinterOptV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallbackV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallbackV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallbackV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallbackV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallbackV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallbackV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallbackV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JCheckCardCallbackV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOptV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOptV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOptV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOptV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOptV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOptV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOptV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JReadCardOptV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOptV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOptV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOptV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOptV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOptV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOptV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOptV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSecurityOptV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOptV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOptV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOptV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOptV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOptV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOptV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOptV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JBasicOptV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOptV2_Default',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOptV2_Default));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOptV2_Stub_Proxy',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOptV2_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOptV2_Stub',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOptV2_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOptV2',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JTaxOptV2));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JBuildConfig',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSunmiPayKernel_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSunmiPayKernel_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSunmiPayKernel_ConnCallback',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSunmiPayKernel_ConnCallback));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSunmiPayKernel_ConnectCallback',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSunmiPayKernel_ConnectCallback));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JSunmiPayKernel',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JSunmiPayKernel));
//  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JUIUtils_1',
//    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JUIUtils_1));
  TRegTypes.RegisterType('Androidapi.JNI.PayLib_release_1_4_65_aar.JUIUtils',
    TypeInfo(Androidapi.JNI.PayLib_release_1_4_65_aar.JUIUtils));
end;


initialization
  RegisterTypes;

end.
