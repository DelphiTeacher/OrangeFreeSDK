unit Androidapi.JNI.RunningServiceInfo;

interface

  {$IFDEF ANDROID}

uses
  Androidapi.JNI.App
  ,Androidapi.JNIBridge
  ,Androidapi.JNI.GraphicsContentViewText
  ,Androidapi.JNI.JavaTypes
  ,Androidapi.JNI.Os
;

type
{ Class forward declarations }
  JActivityManager_RunningServiceInfo = interface;

{  http://developer.android.com/reference/android/app/ActivityManager.RunningServiceInfo.html Added in API level 1 }
  JActivityManager_RunningServiceInfoClass = interface(JObjectClass)
  ['{8A01CD6D-5177-4F74-A65E-20BAC0B76F0F}']
    { Property Methods }
    function _GetCREATOR: JParcelable_Creator;
    function _GetFLAG_FOREGROUND: Integer;
    function _GetFLAG_PERSISTENT_PROCESS: Integer;
    function _GetFLAG_STARTED: Integer;
    function _GetFLAG_SYSTEM_PROCESS: Integer;
    { Methods }
    function init: JActivityManager_RunningServiceInfo; cdecl;
    { Properties }
    property CREATOR: JParcelable_Creator read _GetCREATOR;
    // Added in API level 5
    property FLAG_FOREGROUND: Integer read _GetFLAG_FOREGROUND;
    // Added in API level 5
    property FLAG_PERSISTENT_PROCESS: Integer read _GetFLAG_PERSISTENT_PROCESS;
    // Added in API level 5
    property FLAG_STARTED: Integer read _GetFLAG_STARTED;
    // Added in API level 5
    property FLAG_SYSTEM_PROCESS: Integer read _GetFLAG_SYSTEM_PROCESS;
  end;

  [JavaSignature('android/app/ActivityManager$RunningServiceInfo')]
  JActivityManager_RunningServiceInfo = interface(JObject)
  ['{CEECA783-977A-4E16-8907-C4F65F25D168}']
    { Property Methods }
    function _GetactiveSince: Int64;
    procedure _SetactiveSince(Value: Int64);
    function _GetclientCount: Integer;
    procedure _SetclientCount(Value: Integer);
    function _GetclientLabel: Integer;
    procedure _SetclientLabel(Value: Integer);
    function _GetclientPackage: JString;
    procedure _SetclientPackage(Value: JString);
    function _GetcrashCount: Integer;
    procedure _SetcrashCount(Value: Integer);
    function _Getflags: Integer;
    procedure _Setflags(Value: Integer);
    function _Getforeground: Boolean;
    procedure _Setforeground(Value: Boolean);
    function _GetlastActivityTime: Int64;
    procedure _SetlastActivityTime(Value: Int64);
    function _Getpid: Integer;
    procedure _Setpid(Value: Integer);
    function _Getprocess: JString;
    procedure _Setprocess(Value: JString);
    function _Getrestarting: Int64;
    procedure _Setrestarting(Value: Int64);
    function _Getservice: JComponentName;
    procedure _Setservice(Value: JComponentName);
    function _Getstarted: Boolean;
    procedure _Setstarted(Value: Boolean);
    function _Getuid: Integer;
    procedure _Setuid(Value: Integer);
    { Methods }
    function describeContents: Integer; cdecl;
    procedure readFromParcel(source: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    { Properties }
    property activeSince: Int64 read _GetactiveSince write _SetactiveSince;
    property clientCount: Integer read _GetclientCount write _SetclientCount;
    // API level 5
    property clientLabel: Integer read _GetclientLabel write _SetclientLabel;
    // API level 5
    property clientPackage: JString read _GetclientPackage write _SetclientPackage;
    property crashCount: Integer read _GetcrashCount write _SetcrashCount;
    // API level 5
    property flags: Integer read _Getflags write _Setflags;
    property foreground: Boolean read _Getforeground write _Setforeground;
    property lastActivityTime: Int64 read _GetlastActivityTime write _SetlastActivityTime;
    property pid: Integer read _Getpid write _Setpid;
    property process: JString read _Getprocess write _Setprocess;
    property restarting: Int64 read _Getrestarting write _Setrestarting;
    property service: JComponentName read _Getservice write _Setservice;
    property started: Boolean read _Getstarted write _Setstarted;
    // API level 5
    property uid: Integer read _Getuid write _Setuid;
  end;
  TJActivityManager_RunningServiceInfo = class(TJavaGenericImport<JActivityManager_RunningServiceInfoClass,
    JActivityManager_RunningServiceInfo>) end;

  {$ENDIF}



implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.RunningServiceInfo.JActivityManager_RunningServiceInfo',
//    TypeInfo(Androidapi.JNI.RunningServiceInfo.JActivityManager_RunningServiceInfo));
//end;
//
//initialization
//  RegisterTypes;


end.