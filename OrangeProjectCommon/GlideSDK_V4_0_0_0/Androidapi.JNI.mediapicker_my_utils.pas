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
//  生成时间：2020-11-06 15:50:25
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.mediapicker_my_utils;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.glide_4_0_0,
  Androidapi.JNI.GraphicsContentViewText, 
//  Androidapi.JNI.com.bumptech.glide.request.transition.Transition,
  Androidapi.JNI.Widget;


type

// ===== Forward declarations =====

//  JMySimpleBitmapTarget_1 = interface; //com.ggggcexx.mediapicker.utils.MySimpleBitmapTarget$1
  JMySimpleBitmapTarget = interface; //com.ggggcexx.mediapicker.utils.MySimpleBitmapTarget
  JMySimpleBitmapTargetEvent = interface; //com.ggggcexx.mediapicker.utils.MySimpleBitmapTargetEvent

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

//  JMySimpleBitmapTarget_1Class = interface(JSimpleTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/SimpleTarget
//  ['{C09054FA-29A2-415D-B44D-055EB09FDF06}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/ggggcexx/mediapicker/utils/MySimpleBitmapTarget$1')]
//  JMySimpleBitmapTarget_1 = interface(JSimpleTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/SimpleTarget
//  ['{90B15EA0-2CFA-46CC-894B-349520523023}']
//    { Property Methods }
//
//    { methods }
//    procedure onResourceReady(resource: JDrawable; transition: JTransition); cdecl; overload; //(Landroid/graphics/drawable/Drawable;Lcom/bumptech/glide/request/transition/Transition;)V
//    procedure onResourceReady(this: JObject; P2: JTransition); cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
//
//    { Property }
//  end;

//  TJMySimpleBitmapTarget_1 = class(TJavaGenericImport<JMySimpleBitmapTarget_1Class, JMySimpleBitmapTarget_1>) end;

  JMySimpleBitmapTargetClass = interface(JObjectClass)
  ['{C472DCF7-2515-4669-B57F-A1C662100401}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMySimpleBitmapTarget; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/mediapicker/utils/MySimpleBitmapTarget')]
  JMySimpleBitmapTarget = interface(JObject)
  ['{A88B0A29-9081-4606-8E48-3DDC2E8167B2}']
    { Property Methods }

    { methods }
    procedure getFileThumb(context: JContext; filepath: JString; event: JMySimpleBitmapTargetEvent; imgView: JImageView); cdecl; //(Landroid/content/Context;Ljava/lang/String;Lcom/ggggcexx/mediapicker/utils/MySimpleBitmapTargetEvent;Landroid/widget/ImageView;)V

    { Property }
  end;

  TJMySimpleBitmapTarget = class(TJavaGenericImport<JMySimpleBitmapTargetClass, JMySimpleBitmapTarget>) end;

  JMySimpleBitmapTargetEventClass = interface(JObjectClass)
  ['{FC33CC20-F835-45D3-B522-07D281509DB9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/mediapicker/utils/MySimpleBitmapTargetEvent')]
  JMySimpleBitmapTargetEvent = interface(IJavaInstance)
  ['{B3345B47-7945-4BEC-94B2-C11749681FFB}']
    { Property Methods }

    { methods }
    procedure onResourceReady(P1: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V

    { Property }
  end;

  TJMySimpleBitmapTargetEvent = class(TJavaGenericImport<JMySimpleBitmapTargetEventClass, JMySimpleBitmapTargetEvent>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


//procedure RegisterTypes;
//begin
////  TRegTypes.RegisterType('Androidapi.JNI.mediapicker_my_utils.JMySimpleBitmapTarget_1',
////    TypeInfo(Androidapi.JNI.mediapicker_my_utils.JMySimpleBitmapTarget_1));
//  TRegTypes.RegisterType('Androidapi.JNI.mediapicker_my_utils.JMySimpleBitmapTarget',
//    TypeInfo(Androidapi.JNI.mediapicker_my_utils.JMySimpleBitmapTarget));
//  TRegTypes.RegisterType('Androidapi.JNI.mediapicker_my_utils.JMySimpleBitmapTargetEvent',
//    TypeInfo(Androidapi.JNI.mediapicker_my_utils.JMySimpleBitmapTargetEvent));
//end;
//
//
//initialization
//  RegisterTypes;

{$ENDIF}

end.
