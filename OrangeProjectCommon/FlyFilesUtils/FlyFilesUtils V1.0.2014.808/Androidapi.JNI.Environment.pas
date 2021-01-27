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
//  生成时间：2015-4-29 9:10:58
//  工具版本：1.0.2014.12.24
//
//====================================================
unit Androidapi.JNI.Environment;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes;


type
// ===== Forward declarations =====

  JEnvironment = interface; //android.os.Environment

// ===== Interface declarations =====

  JEnvironmentClass = interface(JObjectClass)
  ['{C910516D-F0DA-441F-99E3-9B83A35DFCC7}']
    { static Property Methods }
    {class} function _GetDIRECTORY_MUSIC: JString; //Ljava/lang/String;
    {class} function _GetDIRECTORY_PODCASTS: JString; //Ljava/lang/String;
    {class} function _GetDIRECTORY_RINGTONES: JString; //Ljava/lang/String;
    {class} function _GetDIRECTORY_ALARMS: JString; //Ljava/lang/String;
    {class} function _GetDIRECTORY_NOTIFICATIONS: JString; //Ljava/lang/String;
    {class} function _GetDIRECTORY_PICTURES: JString; //Ljava/lang/String;
    {class} function _GetDIRECTORY_MOVIES: JString; //Ljava/lang/String;
    {class} function _GetDIRECTORY_DOWNLOADS: JString; //Ljava/lang/String;
    {class} function _GetDIRECTORY_DCIM: JString; //Ljava/lang/String;
    {class} function _GetDIRECTORY_DOCUMENTS: JString; //Ljava/lang/String;
    {class} function _GetMEDIA_UNKNOWN: JString; //Ljava/lang/String;
    {class} function _GetMEDIA_REMOVED: JString; //Ljava/lang/String;
    {class} function _GetMEDIA_UNMOUNTED: JString; //Ljava/lang/String;
    {class} function _GetMEDIA_CHECKING: JString; //Ljava/lang/String;
    {class} function _GetMEDIA_NOFS: JString; //Ljava/lang/String;
    {class} function _GetMEDIA_MOUNTED: JString; //Ljava/lang/String;
    {class} function _GetMEDIA_MOUNTED_READ_ONLY: JString; //Ljava/lang/String;
    {class} function _GetMEDIA_SHARED: JString; //Ljava/lang/String;
    {class} function _GetMEDIA_BAD_REMOVAL: JString; //Ljava/lang/String;
    {class} function _GetMEDIA_UNMOUNTABLE: JString; //Ljava/lang/String;

    { static Methods }
    {class} function init: JEnvironment; cdecl; //()V
    {class} function getRootDirectory: JFile; cdecl; //()Ljava/io/File;
    {class} function getDataDirectory: JFile; cdecl; //()Ljava/io/File;
    {class} function getExternalStorageDirectory: JFile; cdecl; //()Ljava/io/File;
    {class} function getExternalStoragePublicDirectory(P1: JString): JFile; cdecl; //(Ljava/lang/String;)Ljava/io/File;
    {class} function getDownloadCacheDirectory: JFile; cdecl; //()Ljava/io/File;
    {class} function getExternalStorageState: JString; cdecl; //()Ljava/lang/String;
    {class} function getStorageState(P1: JFile): JString; cdecl; //(Ljava/io/File;)Ljava/lang/String;
    {class} function isExternalStorageRemovable: Boolean; cdecl; //()Z
    {class} function isExternalStorageEmulated: Boolean; cdecl; //()Z

    { static Property }
    {class} property DIRECTORY_MUSIC: JString read _GetDIRECTORY_MUSIC;
    {class} property DIRECTORY_PODCASTS: JString read _GetDIRECTORY_PODCASTS;
    {class} property DIRECTORY_RINGTONES: JString read _GetDIRECTORY_RINGTONES;
    {class} property DIRECTORY_ALARMS: JString read _GetDIRECTORY_ALARMS;
    {class} property DIRECTORY_NOTIFICATIONS: JString read _GetDIRECTORY_NOTIFICATIONS;
    {class} property DIRECTORY_PICTURES: JString read _GetDIRECTORY_PICTURES;
    {class} property DIRECTORY_MOVIES: JString read _GetDIRECTORY_MOVIES;
    {class} property DIRECTORY_DOWNLOADS: JString read _GetDIRECTORY_DOWNLOADS;
    {class} property DIRECTORY_DCIM: JString read _GetDIRECTORY_DCIM;
    {class} property DIRECTORY_DOCUMENTS: JString read _GetDIRECTORY_DOCUMENTS;
    {class} property MEDIA_UNKNOWN: JString read _GetMEDIA_UNKNOWN;
    {class} property MEDIA_REMOVED: JString read _GetMEDIA_REMOVED;
    {class} property MEDIA_UNMOUNTED: JString read _GetMEDIA_UNMOUNTED;
    {class} property MEDIA_CHECKING: JString read _GetMEDIA_CHECKING;
    {class} property MEDIA_NOFS: JString read _GetMEDIA_NOFS;
    {class} property MEDIA_MOUNTED: JString read _GetMEDIA_MOUNTED;
    {class} property MEDIA_MOUNTED_READ_ONLY: JString read _GetMEDIA_MOUNTED_READ_ONLY;
    {class} property MEDIA_SHARED: JString read _GetMEDIA_SHARED;
    {class} property MEDIA_BAD_REMOVAL: JString read _GetMEDIA_BAD_REMOVAL;
    {class} property MEDIA_UNMOUNTABLE: JString read _GetMEDIA_UNMOUNTABLE;
  end;

  [JavaSignature('android/os/Environment')]
  JEnvironment = interface(JObject)
  ['{7645859A-81E0-4864-AFFD-0EE53FCDBDCA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEnvironment = class(TJavaGenericImport<JEnvironmentClass, JEnvironment>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Environment.JEnvironment',
    TypeInfo(Androidapi.JNI.Environment.JEnvironment));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.

