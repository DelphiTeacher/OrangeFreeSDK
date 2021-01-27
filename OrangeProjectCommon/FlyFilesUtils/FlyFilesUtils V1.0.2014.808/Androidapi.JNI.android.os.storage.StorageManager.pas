//====================================================
//
//  转换来自JavaOrClass2Pas(原JavaClassToDelphiUnit)
//  原始作者：ying32
//  QQ: 1444386932
//      396506155
//  Email：yuanfen3287@vip.qq.com
//
//  修改 By：Flying Wang & 爱吃猪头肉
//  请不要移除以上的任何信息。
//  请不要将本版本发到城通网盘，否则死全家。
//
//  Email：1765535979@qq.com
//
//  生成时间：2015-4-28 16:27:17
//  工具版本：1.0.2014.12.24
//
//====================================================
unit Androidapi.JNI.android.os.storage.StorageManager;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.os;


type
// ===== Forward declarations =====

  JStorageManager = interface; //android.os.storage.StorageManager

// ===== Interface declarations =====

  JStorageManagerClass = interface(JObjectClass)
  ['{256DF816-8675-4094-ADDA-5BE7F98D2E10}']
    { static Property Methods }

    { static Methods }
    {class} function init: JStorageManager; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('android/os/storage/StorageManager')]
  JStorageManager = interface(JObject)
  ['{177ADFFD-D23A-4BD8-B205-260D87E9F4E2}']
    { Property Methods }

    { methods }
    function mountObb(rawPath: JString; key: JString; listener: JOnObbStateChangeListener): Boolean; cdecl; //(Ljava/lang/String;Ljava/lang/String;Landroid/os/storage/OnObbStateChangeListener;)Z
    function unmountObb(rawPath: JString; force: Boolean; listener: JOnObbStateChangeListener): Boolean; cdecl; //(Ljava/lang/String;ZLandroid/os/storage/OnObbStateChangeListener;)Z
    function isObbMounted(rawPath: JString): Boolean; cdecl; //(Ljava/lang/String;)Z
    function getMountedObbPath(rawPath: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    function getVolumePaths: TJavaObjectArray<JString>; cdecl;

    { Property }
  end;

  TJStorageManager = class(TJavaGenericImport<JStorageManagerClass, JStorageManager>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.android.os.storage.StorageManager.JStorageManager', 
    TypeInfo(Androidapi.JNI.android.os.storage.StorageManager.JStorageManager));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
