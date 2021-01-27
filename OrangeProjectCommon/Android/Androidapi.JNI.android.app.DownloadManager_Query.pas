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
unit Androidapi.JNI.android.app.DownloadManager_Query;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.App;


type
// ===== Forward declarations =====

  JDownloadManager_Query = interface; //android.app.DownloadManager$Query

// ===== Interface declarations =====

  JDownloadManager_QueryClass = interface(JObjectClass)
  ['{C1AAC8FE-2529-4103-908A-0507984A7350}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDownloadManager_Query; cdecl;

    { static Property }
  end;

  [JavaSignature('android/app/DownloadManager$Query')]
  JDownloadManager_Query = interface(JObject)
  ['{50E75DE2-24A9-46AD-9D84-6E15C0116DA6}']
    { Property Methods }

    { methods }
    function setFilterById(ids: TJavaArray<Int64>): JDownloadManager_Query; cdecl;
    function setFilterByStatus(flags: Integer): JDownloadManager_Query; cdecl;

    { Property }
  end;

  TJDownloadManager_Query = class(TJavaGenericImport<JDownloadManager_QueryClass, JDownloadManager_Query>) end;

implementation

end.
