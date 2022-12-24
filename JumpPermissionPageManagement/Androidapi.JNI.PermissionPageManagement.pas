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
//  生成时间：2022-12-24 10:04:22
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.PermissionPageManagement;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.App;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.ggggcexx.jump_permission_setting.BuildConfig
  JPermissionPageManagement = interface; //com.ggggcexx.jump_permission_setting.PermissionPageManagement

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{D2ED371B-5374-4977-A1DA-365B5A839210}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JBuildConfig; cdecl; //()V

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
  end;

  [JavaSignature('com/ggggcexx/jump_permission_setting/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{0816B385-6A5B-44E0-9ACA-DD77D6F7A7DB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JPermissionPageManagementClass = interface(JObjectClass)
  ['{C63E04DF-70ED-4F8D-B5C9-24921612643D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPermissionPageManagement; cdecl; //()V
    {class} procedure goToSetting(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure Huawei(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure Meizu(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure Xiaomi(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure Sony(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure OPPO(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure VIVO(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure LG(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure _360(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure ApplicationInfo(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    {class} procedure SystemConfig(activity: JActivity); cdecl; //(Landroid/app/Activity;)V

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/jump_permission_setting/PermissionPageManagement')]
  JPermissionPageManagement = interface(JObject)
  ['{051C00B3-C598-4A9D-8FB6-131F85E142FC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPermissionPageManagement = class(TJavaGenericImport<JPermissionPageManagementClass, JPermissionPageManagement>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.PermissionPageManagement.JBuildConfig', 
    TypeInfo(Androidapi.JNI.PermissionPageManagement.JBuildConfig));
  TRegTypes.RegisterType('Androidapi.JNI.PermissionPageManagement.JPermissionPageManagement', 
    TypeInfo(Androidapi.JNI.PermissionPageManagement.JPermissionPageManagement));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
