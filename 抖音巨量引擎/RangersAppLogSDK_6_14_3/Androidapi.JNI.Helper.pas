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
//  生成时间：2023-10-14 09:56:25
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.Helper;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.RangersAppLog_Lite_cn_6_14_3_aar;


type

// ===== Forward declarations =====

  JHelper = interface; //net.plonline.mylibrary.Helper

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JHelperClass = interface(JObjectClass)
  ['{2A0EB44D-1EF7-4325-A936-E3A14EBD26E1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHelper; cdecl;
    {class} procedure initAppLog(context: JContext; config: JInitConfig); cdecl;
    {class} procedure initAppLog2(context: JContext; config: JInitConfig; activity: JActivity); cdecl;

    { static Property }
  end;

  [JavaSignature('net/plonline/mylibrary/Helper')]
  JHelper = interface(JObject)
  ['{E230EE02-0D12-4085-9523-20A43FE54485}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHelper = class(TJavaGenericImport<JHelperClass, JHelper>) end;

implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.net.plonline.mylibrary.Helper.JHelper',
//    TypeInfo(Androidapi.JNI.net.plonline.mylibrary.Helper.JHelper));
//end;
//
//
//initialization
//  RegisterTypes;

end.
