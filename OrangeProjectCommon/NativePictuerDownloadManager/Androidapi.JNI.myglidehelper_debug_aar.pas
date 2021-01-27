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
//  生成时间：2020/12/21 13:45:05
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.myglidehelper_debug_aar;

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

  JBuildConfig = interface; //com.ggggcexx.myglidehelper.BuildConfig
  JMyGlideSimpleBitmapTarget = interface; //com.ggggcexx.myglidehelper.MyGlideSimpleBitmapTarget
  JMySimpleBitmapTargetEvent = interface; //com.ggggcexx.myglidehelper.MySimpleBitmapTargetEvent
  JTransition = JObject;
// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{79979A47-A7FD-4606-A219-CD78CAEDB510}']
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

  [JavaSignature('com/ggggcexx/myglidehelper/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{BE465508-2687-42C6-8B2C-025B0BD3E906}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JMyGlideSimpleBitmapTargetClass = interface(JSimpleTargetClass) // or JObjectClass
  ['{67A76968-5E38-49DF-9265-57B73EB192F5}']
    { static Property Methods }

    { static Methods }
    {class} function init(aevent: JMySimpleBitmapTargetEvent): JMyGlideSimpleBitmapTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/myglidehelper/MyGlideSimpleBitmapTarget')]
  JMyGlideSimpleBitmapTarget = interface(JSimpleTarget) // or JObject
  ['{0C9B297C-A64D-46A0-A8ED-BF71332B50BD}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JDrawable; transition: JTransition); cdecl; overload;
    procedure onResourceReady(this: JObject; P2: JTransition); cdecl; overload;

    { Property }
  end;

  TJMyGlideSimpleBitmapTarget = class(TJavaGenericImport<JMyGlideSimpleBitmapTargetClass, JMyGlideSimpleBitmapTarget>) end;

  JMySimpleBitmapTargetEventClass = interface(JObjectClass)
  ['{935D786B-22A7-49A2-A51E-B7B3AFB91C17}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/myglidehelper/MySimpleBitmapTargetEvent')]
  JMySimpleBitmapTargetEvent = interface(IJavaInstance)
  ['{26C8BCAB-E022-474A-A75A-1E352FA96287}']
    { Property Methods }

    { methods }
    procedure onResourceReady(P1: JDrawable); cdecl;

    { Property }
  end;

  TJMySimpleBitmapTargetEvent = class(TJavaGenericImport<JMySimpleBitmapTargetEventClass, JMySimpleBitmapTargetEvent>) end;


{$ENDIF}


implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.myglidehelper_debug_aar.JBuildConfig',
//    TypeInfo(Androidapi.JNI.myglidehelper_debug_aar.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.myglidehelper_debug_aar.JMyGlideSimpleBitmapTarget',
//    TypeInfo(Androidapi.JNI.myglidehelper_debug_aar.JMyGlideSimpleBitmapTarget));
//  TRegTypes.RegisterType('Androidapi.JNI.myglidehelper_debug_aar.JMySimpleBitmapTargetEvent',
//    TypeInfo(Androidapi.JNI.myglidehelper_debug_aar.JMySimpleBitmapTargetEvent));
//end;
//
//
//initialization
//  RegisterTypes;

end.
