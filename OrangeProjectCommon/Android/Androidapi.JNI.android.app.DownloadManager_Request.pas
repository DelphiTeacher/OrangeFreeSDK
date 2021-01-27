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
//  生成时间：2017-12-30 13:33:19
//  工具版本：1.0.2015.5.11
//
//====================================================
unit Androidapi.JNI.android.app.DownloadManager_Request;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.Net, 
  Androidapi.JNI.App, 
  Androidapi.JNI.GraphicsContentViewText;


type
// ===== Forward declarations =====

  JDownloadManager_Request = interface; //android.app.DownloadManager$Request

// ===== Interface declarations =====

  JDownloadManager_RequestClass = interface(JObjectClass)
  ['{8A7FB41B-B301-447F-B434-B59AD4BC7247}']
    { static Property Methods }
    {class} function _GetNETWORK_MOBILE: Integer;
    {class} function _GetNETWORK_WIFI: Integer;
    {class} function _GetVISIBILITY_HIDDEN: Integer;
    {class} function _GetVISIBILITY_VISIBLE: Integer;
    {class} function _GetVISIBILITY_VISIBLE_NOTIFY_COMPLETED: Integer;
    {class} function _GetVISIBILITY_VISIBLE_NOTIFY_ONLY_COMPLETION: Integer;

    { static Methods }
    {class} function init(uri: Jnet_Uri): JDownloadManager_Request; cdecl;

    { static Property }
    {class} property NETWORK_MOBILE: Integer read _GetNETWORK_MOBILE;
    {class} property NETWORK_WIFI: Integer read _GetNETWORK_WIFI;
    {class} property VISIBILITY_HIDDEN: Integer read _GetVISIBILITY_HIDDEN;
    {class} property VISIBILITY_VISIBLE: Integer read _GetVISIBILITY_VISIBLE;
    {class} property VISIBILITY_VISIBLE_NOTIFY_COMPLETED: Integer read _GetVISIBILITY_VISIBLE_NOTIFY_COMPLETED;
    {class} property VISIBILITY_VISIBLE_NOTIFY_ONLY_COMPLETION: Integer read _GetVISIBILITY_VISIBLE_NOTIFY_ONLY_COMPLETION;
  end;

  [JavaSignature('android/app/DownloadManager$Request')]
  JDownloadManager_Request = interface(JObject)
  ['{BD06E70D-948B-42C9-9016-444E2A7BF2F1}']
    { Property Methods }

    { methods }
    function setDestinationUri(uri: Jnet_Uri): JDownloadManager_Request; cdecl;
    function setDestinationInExternalFilesDir(context: JContext; dirType: JString; subPath: JString): JDownloadManager_Request; cdecl;
    function setDestinationInExternalPublicDir(dirType: JString; subPath: JString): JDownloadManager_Request; cdecl;
    procedure allowScanningByMediaScanner; cdecl;
    function addRequestHeader(header: JString; value: JString): JDownloadManager_Request; cdecl;
    function setTitle(title: JCharSequence): JDownloadManager_Request; cdecl;
    function setDescription(description: JCharSequence): JDownloadManager_Request; cdecl;
    function setMimeType(mimeType: JString): JDownloadManager_Request; cdecl;
    function setShowRunningNotification(show: Boolean): JDownloadManager_Request; cdecl; //Deprecated
    function setNotificationVisibility(visibility: Integer): JDownloadManager_Request; cdecl;
    function setAllowedNetworkTypes(flags: Integer): JDownloadManager_Request; cdecl;
    function setAllowedOverRoaming(allowed: Boolean): JDownloadManager_Request; cdecl;
    function setAllowedOverMetered(allow: Boolean): JDownloadManager_Request; cdecl;
    function setVisibleInDownloadsUi(isVisible: Boolean): JDownloadManager_Request; cdecl;

    { Property }
  end;

  TJDownloadManager_Request = class(TJavaGenericImport<JDownloadManager_RequestClass, JDownloadManager_Request>) end;

implementation

end.
