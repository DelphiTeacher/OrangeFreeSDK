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
unit Androidapi.JNI.android.app.DownloadManager;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.App, 
  Androidapi.JNI.GraphicsContentViewText, 
  Androidapi.JNI.android.app.DownloadManager_Request,
  Androidapi.JNI.android.app.DownloadManager_Query,
  Androidapi.JNI.os,
  Androidapi.JNI.Net;


type
// ===== Forward declarations =====

  JDownloadManager = interface; //android.app.DownloadManager

// ===== Interface declarations =====

  JDownloadManagerClass = interface(JObjectClass)
  ['{EBF357EC-1F7D-4142-BC3A-15FAEF1425D4}']
    { static Property Methods }
    {class} function _GetACTION_DOWNLOAD_COMPLETE: JString;
    {class} function _GetACTION_NOTIFICATION_CLICKED: JString;
    {class} function _GetACTION_VIEW_DOWNLOADS: JString;
    {class} function _GetCOLUMN_BYTES_DOWNLOADED_SO_FAR: JString;
    {class} function _GetCOLUMN_DESCRIPTION: JString;
    {class} function _GetCOLUMN_ID: JString;
    {class} function _GetCOLUMN_LAST_MODIFIED_TIMESTAMP: JString;
    {class} function _GetCOLUMN_LOCAL_FILENAME: JString;
    {class} function _GetCOLUMN_LOCAL_URI: JString;
    {class} function _GetCOLUMN_MEDIAPROVIDER_URI: JString;
    {class} function _GetCOLUMN_MEDIA_TYPE: JString;
    {class} function _GetCOLUMN_REASON: JString;
    {class} function _GetCOLUMN_STATUS: JString;
    {class} function _GetCOLUMN_TITLE: JString;
    {class} function _GetCOLUMN_TOTAL_SIZE_BYTES: JString;
    {class} function _GetCOLUMN_URI: JString;
    {class} function _GetERROR_CANNOT_RESUME: Integer;
    {class} function _GetERROR_DEVICE_NOT_FOUND: Integer;
    {class} function _GetERROR_FILE_ALREADY_EXISTS: Integer;
    {class} function _GetERROR_FILE_ERROR: Integer;
    {class} function _GetERROR_HTTP_DATA_ERROR: Integer;
    {class} function _GetERROR_INSUFFICIENT_SPACE: Integer;
    {class} function _GetERROR_TOO_MANY_REDIRECTS: Integer;
    {class} function _GetERROR_UNHANDLED_HTTP_CODE: Integer;
    {class} function _GetERROR_UNKNOWN: Integer;
    {class} function _GetEXTRA_DOWNLOAD_ID: JString;
    {class} function _GetEXTRA_NOTIFICATION_CLICK_DOWNLOAD_IDS: JString;
    {class} function _GetINTENT_EXTRAS_SORT_BY_SIZE: JString;
    {class} function _GetPAUSED_QUEUED_FOR_WIFI: Integer;
    {class} function _GetPAUSED_UNKNOWN: Integer;
    {class} function _GetPAUSED_WAITING_FOR_NETWORK: Integer;
    {class} function _GetPAUSED_WAITING_TO_RETRY: Integer;
    {class} function _GetSTATUS_FAILED: Integer;
    {class} function _GetSTATUS_PAUSED: Integer;
    {class} function _GetSTATUS_PENDING: Integer;
    {class} function _GetSTATUS_RUNNING: Integer;
    {class} function _GetSTATUS_SUCCESSFUL: Integer;

    { static Methods }
    {class} function getMaxBytesOverMobile(P1: JContext): JLong; cdecl;
    {class} function getRecommendedMaxBytesOverMobile(P1: JContext): JLong; cdecl;

    { static Property }
    {class} property ACTION_DOWNLOAD_COMPLETE: JString read _GetACTION_DOWNLOAD_COMPLETE;
    {class} property ACTION_NOTIFICATION_CLICKED: JString read _GetACTION_NOTIFICATION_CLICKED;
    {class} property ACTION_VIEW_DOWNLOADS: JString read _GetACTION_VIEW_DOWNLOADS;
    {class} property COLUMN_BYTES_DOWNLOADED_SO_FAR: JString read _GetCOLUMN_BYTES_DOWNLOADED_SO_FAR;
    {class} property COLUMN_DESCRIPTION: JString read _GetCOLUMN_DESCRIPTION;
    {class} property COLUMN_ID: JString read _GetCOLUMN_ID;
    {class} property COLUMN_LAST_MODIFIED_TIMESTAMP: JString read _GetCOLUMN_LAST_MODIFIED_TIMESTAMP;
    {class} property COLUMN_LOCAL_FILENAME: JString read _GetCOLUMN_LOCAL_FILENAME;
    {class} property COLUMN_LOCAL_URI: JString read _GetCOLUMN_LOCAL_URI;
    {class} property COLUMN_MEDIAPROVIDER_URI: JString read _GetCOLUMN_MEDIAPROVIDER_URI;
    {class} property COLUMN_MEDIA_TYPE: JString read _GetCOLUMN_MEDIA_TYPE;
    {class} property COLUMN_REASON: JString read _GetCOLUMN_REASON;
    {class} property COLUMN_STATUS: JString read _GetCOLUMN_STATUS;
    {class} property COLUMN_TITLE: JString read _GetCOLUMN_TITLE;
    {class} property COLUMN_TOTAL_SIZE_BYTES: JString read _GetCOLUMN_TOTAL_SIZE_BYTES;
    {class} property COLUMN_URI: JString read _GetCOLUMN_URI;
    {class} property ERROR_CANNOT_RESUME: Integer read _GetERROR_CANNOT_RESUME;
    {class} property ERROR_DEVICE_NOT_FOUND: Integer read _GetERROR_DEVICE_NOT_FOUND;
    {class} property ERROR_FILE_ALREADY_EXISTS: Integer read _GetERROR_FILE_ALREADY_EXISTS;
    {class} property ERROR_FILE_ERROR: Integer read _GetERROR_FILE_ERROR;
    {class} property ERROR_HTTP_DATA_ERROR: Integer read _GetERROR_HTTP_DATA_ERROR;
    {class} property ERROR_INSUFFICIENT_SPACE: Integer read _GetERROR_INSUFFICIENT_SPACE;
    {class} property ERROR_TOO_MANY_REDIRECTS: Integer read _GetERROR_TOO_MANY_REDIRECTS;
    {class} property ERROR_UNHANDLED_HTTP_CODE: Integer read _GetERROR_UNHANDLED_HTTP_CODE;
    {class} property ERROR_UNKNOWN: Integer read _GetERROR_UNKNOWN;
    {class} property EXTRA_DOWNLOAD_ID: JString read _GetEXTRA_DOWNLOAD_ID;
    {class} property EXTRA_NOTIFICATION_CLICK_DOWNLOAD_IDS: JString read _GetEXTRA_NOTIFICATION_CLICK_DOWNLOAD_IDS;
    {class} property INTENT_EXTRAS_SORT_BY_SIZE: JString read _GetINTENT_EXTRAS_SORT_BY_SIZE;
    {class} property PAUSED_QUEUED_FOR_WIFI: Integer read _GetPAUSED_QUEUED_FOR_WIFI;
    {class} property PAUSED_UNKNOWN: Integer read _GetPAUSED_UNKNOWN;
    {class} property PAUSED_WAITING_FOR_NETWORK: Integer read _GetPAUSED_WAITING_FOR_NETWORK;
    {class} property PAUSED_WAITING_TO_RETRY: Integer read _GetPAUSED_WAITING_TO_RETRY;
    {class} property STATUS_FAILED: Integer read _GetSTATUS_FAILED;
    {class} property STATUS_PAUSED: Integer read _GetSTATUS_PAUSED;
    {class} property STATUS_PENDING: Integer read _GetSTATUS_PENDING;
    {class} property STATUS_RUNNING: Integer read _GetSTATUS_RUNNING;
    {class} property STATUS_SUCCESSFUL: Integer read _GetSTATUS_SUCCESSFUL;
  end;

  [JavaSignature('android/app/DownloadManager')]
  JDownloadManager = interface(JObject)
  ['{45A58175-B807-44F9-BCD0-7AF2FA1DA3BE}']
    { Property Methods }

    { methods }
    function enqueue(request: JDownloadManager_Request): Int64; cdecl;
    function remove(ids: TJavaArray<Int64>): Integer; cdecl;
    function query(query: JDownloadManager_Query): JCursor; cdecl;
    function openDownloadedFile(id: Int64): JParcelFileDescriptor; cdecl;
    function getUriForDownloadedFile(id: Int64): Jnet_Uri; cdecl;
    function getMimeTypeForDownloadedFile(id: Int64): JString; cdecl;
    function addCompletedDownload(title: JString; description: JString; isMediaScannerScannable: Boolean; mimeType: JString; path: JString; length: Int64; showNotification: Boolean): Int64; cdecl;

    { Property }
  end;

  TJDownloadManager = class(TJavaGenericImport<JDownloadManagerClass, JDownloadManager>) end;

implementation

end.
