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
//  生成时间：2018-05-30 14:03:37
//  工具版本：1.0.2018.1.26
//
//====================================================
unit Androidapi.JNI.mysummipay;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.xiaoxu;


type
// ===== Forward declarations =====

  JMyReadCardCallbackClass = interface; //com.ggggcexx.mysummipay.MyReadCardCallbackClass
  JMyReadCardCallbackListener = interface; //com.ggggcexx.mysummipay.MyReadCardCallbackListener

// ===== Interface declarations =====

  JMyReadCardCallbackClassClass = interface(JReadCardCallback_StubClass) // or JObjectClass // SuperSignature: com/sunmi/payservice/hardware/aidl/ReadCardCallback$Stub
  ['{B9E0DBC3-3E92-4729-A41D-2FB36AABA47A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMyReadCardCallbackClass; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/mysummipay/MyReadCardCallbackClass')]
  JMyReadCardCallbackClass = interface(JReadCardCallback_Stub) // or JObject // SuperSignature: com/sunmi/payservice/hardware/aidl/ReadCardCallback$Stub
  ['{26DA34DE-6E10-48B6-9FEF-FF76892B6F85}']
    { Property Methods }

    { methods }
    procedure setMyReadCardCallbackListener(AMyReadCardCallbackListener: JMyReadCardCallbackListener); cdecl; //(Lcom/ggggcexx/mysummipay/MyReadCardCallbackListener;)V
    procedure onCardDetected(cardInfo: JPayCardInfo); cdecl; //(Lcom/sunmi/payservice/hardware/aidl/bean/PayCardInfo;)V
    procedure onError(code: Integer; amessage: JString); cdecl; //(ILjava/lang/String;)V
    procedure onStartCheckCard; cdecl; //()V

    { Property }
  end;

  TJMyReadCardCallbackClass = class(TJavaGenericImport<JMyReadCardCallbackClassClass, JMyReadCardCallbackClass>) end;

  JMyReadCardCallbackListenerClass = interface(JObjectClass)
  ['{DD85F3BF-7484-4B10-A54D-01797C639776}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/mysummipay/MyReadCardCallbackListener')]
  JMyReadCardCallbackListener = interface(IJavaInstance)
  ['{1E6471A6-D3AC-4B87-8045-ABCDC03FFB0A}']
    { Property Methods }

    { methods }
    procedure onCardDetected(P1: JPayCardInfo); cdecl; //(Lcom/sunmi/payservice/hardware/aidl/bean/PayCardInfo;)V
    procedure onError(P1: Integer; P2: JString); cdecl; //(ILjava/lang/String;)V
    procedure onStartCheckCard; cdecl; //()V

    { Property }
  end;

  TJMyReadCardCallbackListener = class(TJavaGenericImport<JMyReadCardCallbackListenerClass, JMyReadCardCallbackListener>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.mysummipay.JMyReadCardCallbackClass', 
    TypeInfo(Androidapi.JNI.mysummipay.JMyReadCardCallbackClass));
  TRegTypes.RegisterType('Androidapi.JNI.mysummipay.JMyReadCardCallbackListener', 
    TypeInfo(Androidapi.JNI.mysummipay.JMyReadCardCallbackListener));
end;


initialization
  RegisterTypes;

end.
