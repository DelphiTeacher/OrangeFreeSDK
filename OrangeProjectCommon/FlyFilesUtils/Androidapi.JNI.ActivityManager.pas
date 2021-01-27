{
  android.app.ActivityManager imported by flcop(zylove619@hotmail.com)
}

unit Androidapi.JNI.ActivityManager;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,
  Androidapi.JNI.App;

type

{ Class forward declarations }
  JDebug_MemoryInfo = interface;
  JActivityManager_MemoryInfo = interface;
  JActivityManager_ProcessErrorStateInfo = interface;
  JActivityManager_RecentTaskInfo = interface;
  JActivityManager_RunningAppProcessInfo = interface;
  JActivityManager_RunningServiceInfo = interface;
  JActivityManager_RunningTaskInfo = interface;
  JActivityManager = interface;

{ http://developer.android.com/reference/android/os/Debug.MemoryInfo.html
  Added in API level 1 }
  JDebug_MemoryInfoClass = interface(JObjectClass)
  ['{E7545CF8-CFF5-40EE-9082-380FA48C4464}']
    { Property Methods }
    function _GetCREATOR: JParcelable_Creator;
    { Methods }
    function init: JDebug_MemoryInfo; cdecl;
    { Properties }
    property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/os/Debug$MemoryInfo')]
  JDebug_MemoryInfo = interface(JObject)
  ['{577F2E29-A53C-4A3C-8548-21F6D6001EF6}']
    { Property Methods }
    function _GetdalvikPrivateDirty: Integer;
    procedure _SetdalvikPrivateDirty(Value: Integer);
    function _GetdalvikPss: Integer;
    procedure _SetdalvikPss(Value: Integer);
    function _GetdalvikSharedDirty: Integer;
    procedure _SetdalvikSharedDirty(Value: Integer);
    function _GetnativePrivateDirty: Integer;
    procedure _SetnativePrivateDirty(Value: Integer);
    function _GetnativePss: Integer;
    procedure _SetnativePss(Value: Integer);
    function _GetnativeSharedDirty: Integer;
    procedure _SetnativeSharedDirty(Value: Integer);
    function _GetotherPrivateDirty: Integer;
    procedure _SetotherPrivateDirty(Value: Integer);
    function _GetotherPss: Integer;
    procedure _SetotherPss(Value: Integer);
    function _GetotherSharedDirty: Integer;
    procedure _SetotherSharedDirty(Value: Integer);
    { Methods }
    // Added in API level 5
    function describeContents: Integer; cdecl;
    // Added in API level 5
    function getTotalPrivateDirty: Integer; cdecl;
    // Added in API level 5
    function getTotalPss: Integer; cdecl;
    // Added in API level 5
    function getTotalSharedDirty: Integer; cdecl;
    // Added in API level 5
    procedure readFromParcel(source: JParcel); cdecl;
    // Added in API level 5
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    { Properties }
    property dalvikPrivateDirty: Integer read _GetdalvikPrivateDirty write _SetdalvikPrivateDirty;
    property dalvikPss: Integer read _GetdalvikPss write _SetdalvikPss;
    property dalvikSharedDirty: Integer read _GetdalvikSharedDirty write _SetdalvikSharedDirty;
    property nativePrivateDirty: Integer read _GetnativePrivateDirty write _SetnativePrivateDirty;
    property nativePss: Integer read _GetnativePss write _SetnativePss;
    property nativeSharedDirty: Integer read _GetnativeSharedDirty write _SetnativeSharedDirty;
    property otherPrivateDirty: Integer read _GetotherPrivateDirty write _SetotherPrivateDirty;
    property otherPss: Integer read _GetotherPss write _SetotherPss;
    property otherSharedDirty: Integer read _GetotherSharedDirty write _SetotherSharedDirty;
  end;
  TJDebug_MemoryInfo = class(TJavaGenericImport<JDebug_MemoryInfoClass,
    JDebug_MemoryInfo>) end;

{ http://developer.android.com/reference/android/app/ActivityManager.MemoryInfo.html
  Added in API level 1 }
  JActivityManager_MemoryInfoClass = interface(JObjectClass)
  ['{093B391C-56F6-47F9-96A5-CF4F4101F614}']
    { Property Methods }
    function _GetCREATOR: JParcelable_Creator;
    { Methods }
    function init: JActivityManager_MemoryInfo; cdecl;
    { Properties }
    property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/app/ActivityManager$MemoryInfo')]
  JActivityManager_MemoryInfo = interface(JObject)
  ['{B6B801F7-3E6F-4BF9-9952-8356A7026725}']
    { Property Methods }
    function _GetavailMem: Int64;
    function _GetlowMemory: Boolean;
    function _Getthreshold: Int64;
    function _GettotalMem: Int64;
    { Methods }
    function describeContents: Integer; cdecl;
    procedure readFromParcel(source: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    { Properties }
    property availMem: Int64 read _GetavailMem;
    property lowMemory: Boolean read _GetlowMemory;
    property threshold: Int64 read _Getthreshold;
    // Added in API level 16
    property totalMem: Int64 read _GettotalMem;
  end;
  TJActivityManager_MemoryInfo = class(TJavaGenericImport<JActivityManager_MemoryInfoClass,
    JActivityManager_MemoryInfo>) end;

{ http://developer.android.com/reference/android/app/ActivityManager.ProcessErrorStateInfo.html
  Added in API level 1 }
  JActivityManager_ProcessErrorStateInfoClass = interface(JObjectClass)
  ['{B2DDD02D-B205-4412-89B7-418BC28DA58D}']
    { Property Methods }
    function _GetCREATOR: JParcelable_Creator;
    function _GetCRASHED: Integer;
    function _GetNOT_RESPONDING: Integer;
    function _GetNO_ERROR: Integer;
    { Methods }
    function init: JActivityManager_ProcessErrorStateInfo; cdecl;
    { Properties }
    property CREATOR: JParcelable_Creator read _GetCREATOR;
    property CRASHED: Integer read _GetCRASHED;
    property NOT_RESPONDING: Integer read _GetNOT_RESPONDING;
    property NO_ERROR: Integer read _GetNO_ERROR;
  end;

  [JavaSignature('android/app/ActivityManager$ProcessErrorStateInfo')]
  JActivityManager_ProcessErrorStateInfo = interface(JObject)
  ['{7406BE27-6395-44F4-8CC7-633375617A2A}']
    { Property Methods }
    function _Getcondition: Integer;
    procedure _Setcondition(Value: Integer);
    function _GetcrashData: TJavaArray<Byte>;
    procedure _SetcrashData(Value: TJavaArray<Byte>);
    function _GetlongMsg: JString;
    procedure _SetlongMsg(Value: JString);
    function _Getpid: Integer;
    procedure _Setpid(Value: Integer);
    function _GetprocessName: JString;
    procedure _SetprocessName(Value: JString);
    function _GetshortMsg: JString;
    procedure _SetshortMsg(Value: JString);
    function _GetstackTrace: JString;
    procedure _SetstackTrace(Value: JString);
    function _Gettag: JString;
    procedure _Settag(Value: JString);
    function _Getuid: Integer;
    procedure _Setuid(Value: Integer);
    { Methods }
    function describeContents: Integer; cdecl;
    procedure readFromParcel(source: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    { Properties }
    property condition: Integer read _Getcondition write _Setcondition;
    property crashData: TJavaArray<Byte> read _GetcrashData write _SetcrashData;
    property longMsg: JString read _GetlongMsg write _SetlongMsg;
    property pid: Integer read _Getpid write _Setpid;
    property processName: JString read _GetprocessName write _SetprocessName;
    property shortMsg: JString read _GetshortMsg write _SetshortMsg;
    // Added in API level 8
    property stackTrace: JString read _GetstackTrace write _SetstackTrace;
    property tag: JString read _Gettag write _Settag;
    property uid: Integer read _Getuid write _Setuid;
  end;
  TJActivityManager_ProcessErrorStateInfo = class(TJavaGenericImport<JActivityManager_ProcessErrorStateInfoClass,
    JActivityManager_ProcessErrorStateInfo>) end;

{ http://developer.android.com/reference/android/app/ActivityManager.RecentTaskInfo.html
  Added in API level 1 }
  JActivityManager_RecentTaskInfoClass = interface(JObjectClass)
  ['{4AE6025B-0BEA-4D81-8E3F-4EC6F7BA8EEF}']
    { Property Methods }
    function _GetCREATOR: JParcelable_Creator;
    { Methods }
    function init: JActivityManager_RecentTaskInfo; cdecl;
    { Properties }
    property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/app/ActivityManager$RecentTaskInfo')]
  JActivityManager_RecentTaskInfo = interface(JObject)
  ['{02A5EDBF-B7CC-4C63-BACD-0F1A195C6969}']
    { Property Methods }
    function _GetbaseIntent: JIntent;
    procedure _SetbaseIntent(Value: JIntent);
    function _Getdescription: JCharSequence;
    procedure _Setdescription(Value: JCharSequence);
    function _Getid: Integer;
    procedure _Setid(Value: Integer);
    function _GetorigActivity: JComponentName;
    procedure _SetorigActivity(Value: JComponentName);
    function _GetpersistentId: Integer;
    procedure _SetpersistentId(Value: Integer);
    { Methods }
    function describeContents: Integer; cdecl;
    procedure readFromParcel(source: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    { Properties }
    property baseIntent: JIntent read _GetbaseIntent write _SetbaseIntent;
    // Added in API level 11
    property description: JCharSequence read _Getdescription write _Setdescription;
    property id: Integer read _Getid write _Setid;
    property origActivity: JComponentName read _GetorigActivity write _SetorigActivity;
    // Added in API level 12
    property persistentId: Integer read _GetpersistentId write _SetpersistentId;
  end;
  TJActivityManager_RecentTaskInfo = class(TJavaGenericImport<JActivityManager_RecentTaskInfoClass,
    JActivityManager_RecentTaskInfo>) end;

{ http://developer.android.com/reference/android/app/ActivityManager.RunningAppProcessInfo.html
  Added in API level 3 }
  JActivityManager_RunningAppProcessInfoClass = interface(JObjectClass)
  ['{F24C0121-C062-4A2B-9363-E97A50E2FC41}']
    { Property Methods }
    function _GetCREATOR: JParcelable_Creator;
    function _GetIMPORTANCE_BACKGROUND: Integer;
    function _GetIMPORTANCE_EMPTY: Integer;
    function _GetIMPORTANCE_FOREGROUND: Integer;
    function _GetIMPORTANCE_PERCEPTIBLE: Integer;
    function _GetIMPORTANCE_SERVICE: Integer;
    function _GetIMPORTANCE_VISIBLE: Integer;
    function _GetREASON_PROVIDER_IN_USE: Integer;
    function _GetREASON_SERVICE_IN_USE: Integer;
    function _GetREASON_UNKNOWN: Integer;
    { Methods }
    function init: JActivityManager_RunningAppProcessInfo; cdecl; overload;
    function init(pProcessName: JString; pPid: Integer; pArr: TJavaObjectArray<JString>):
      JActivityManager_RunningAppProcessInfo; cdecl; overload;
    { Properties }
    property CREATOR: JParcelable_Creator read _GetCREATOR;
    property IMPORTANCE_BACKGROUND: Integer read _GetIMPORTANCE_BACKGROUND;
    property IMPORTANCE_EMPTY: Integer read _GetIMPORTANCE_EMPTY;
    property IMPORTANCE_FOREGROUND: Integer read _GetIMPORTANCE_FOREGROUND;
    // Added in API level 9
    property IMPORTANCE_PERCEPTIBLE: Integer read _GetIMPORTANCE_PERCEPTIBLE;
    property IMPORTANCE_SERVICE: Integer read _GetIMPORTANCE_SERVICE;
    property IMPORTANCE_VISIBLE: Integer read _GetIMPORTANCE_VISIBLE;
    // Added in API level 5
    property REASON_PROVIDER_IN_USE: Integer read _GetREASON_PROVIDER_IN_USE;
    // Added in API level 5
    property REASON_SERVICE_IN_USE: Integer read _GetREASON_SERVICE_IN_USE;
    // Added in API level 5
    property REASON_UNKNOWN: Integer read _GetREASON_UNKNOWN;
  end;

  [JavaSignature('android/app/ActivityManager$RunningAppProcessInfo')]
  JActivityManager_RunningAppProcessInfo = interface(JObject)
  ['{3E72F05C-6CF2-4971-B34B-5FE4C414913D}']
    { Property Methods }
    function _Getimportance: Integer;
    procedure _Setimportance(Value: Integer);
    function _GetimportanceReasonCode: Integer;
    procedure _SetimportanceReasonCode(Value: Integer);
    function _GetimportanceReasonComponent: JComponentName;
    procedure _SetimportanceReasonComponent(Value: JComponentName);
    function _GetimportanceReasonPid: Integer;
    procedure _SetimportanceReasonPid(Value: Integer);
    function _GetlastTrimLevel: Integer;
    procedure _SetlastTrimLevel(Value: Integer);
    function _Getlru: Integer;
    procedure _Setlru(Value: Integer);
    function _Getpid: Integer;
    procedure _Setpid(Value: Integer);
    function _GetpkgList: TJavaObjectArray<JString>;
    procedure _SetpkgList(Value: TJavaObjectArray<JString>);
    function _GetprocessName: JString;
    procedure _SetprocessName(Value: JString);
    function _Getuid: Integer;
    procedure _Setuid(Value: Integer);
    { Methods }
    function describeContents: Integer; cdecl;
    procedure readFromParcel(source: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    { Properties }
    property importance: Integer read _Getimportance write _Setimportance;
    // Added in API level 5
    property importanceReasonCode: Integer read _GetimportanceReasonCode write _SetimportanceReasonCode;
    // Added in API level 5
    property importanceReasonComponent: JComponentName read _GetimportanceReasonComponent write _SetimportanceReasonComponent;
    // Added in API level 5
    property importanceReasonPid: Integer read _GetimportanceReasonPid write _SetimportanceReasonPid;
    // Added in API level 16
    property lastTrimLevel: Integer read _GetlastTrimLevel write _SetlastTrimLevel;
    property lru: Integer read _Getlru write _Setlru;
    property pid: Integer read _Getpid write _Setpid;
    property pkgList: TJavaObjectArray<JString> read _GetpkgList write _SetpkgList;
    property processName: JString read _GetprocessName write _SetprocessName;
    // Added in API level 5
    property uid: Integer read _Getuid write _Setuid;
  end;
  TJActivityManager_RunningAppProcessInfo = class(TJavaGenericImport<JActivityManager_RunningAppProcessInfoClass,
    JActivityManager_RunningAppProcessInfo>) end;

{ http://developer.android.com/reference/android/app/ActivityManager.RunningServiceInfo.html
  Added in API level 1 }
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

{ http://developer.android.com/reference/android/app/ActivityManager.RunningTaskInfo.html
  Added in API level 1 }
  JActivityManager_RunningTaskInfoClass = interface(JObjectClass)
  ['{CB509FD6-FB15-495C-AFE8-DF705BFDD1CB}']
    { Property Methods }
    function _GetCREATOR: JParcelable_Creator;
    { Methods }
    function init: JActivityManager_RunningTaskInfo; cdecl;
    { Properties }
    property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/app/ActivityManager$RunningTaskInfo')]
  JActivityManager_RunningTaskInfo = interface(JObject)
  ['{48B0FF17-C6E7-46A9-8C4E-55186F86CE58}']
    { Property Methods }
    function _GetbaseActivity: JComponentName;
    procedure _SetbaseActivity(Value: JComponentName);
    function _Getdescription: JCharSequence;
    procedure _Setdescription(Value: JCharSequence);
    function _Getid: Integer;
    procedure _Setid(Value: Integer);
    function _GetnumActivities: Integer;
    procedure _SetnumActivities(Value: Integer);
    function _GetnumRunning: Integer;
    procedure _SetnumRunning(Value: Integer);
    function _Getthumbnail: JBitmap;
    procedure _Setthumbnail(Value: JBitmap);
    function _GettopActivity: JComponentName;
    procedure _SettopActivity(Value: JComponentName);
    { Methods }
    function describeContents: Integer; cdecl;
    procedure readFromParcel(source: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    { Properties }
    property baseActivity: JComponentName read _GetbaseActivity write _SetbaseActivity;
    property description: JCharSequence read _Getdescription write _Setdescription;
    property id: Integer read _Getid write _Setid;
    property numActivities: Integer read _GetnumActivities write _SetnumActivities;
    property numRunning: Integer read _GetnumRunning write _SetnumRunning;
    property thumbnail: JBitmap read _Getthumbnail write _Setthumbnail;
    property topActivity: JComponentName read _GettopActivity write _SettopActivity;
  end;
  TJActivityManager_RunningTaskInfo = class(TJavaGenericImport<JActivityManager_RunningTaskInfoClass,
    JActivityManager_RunningTaskInfo>) end;

{ http://developer.android.com/reference/android/app/ActivityManager.html
  Added in API level 1 }
  JActivityManagerClass = interface(JObjectClass)
  ['{DE9F8D5B-3354-4E29-86BA-E47715ECD75B}']
    { Property Methods }
    function _GetMOVE_TASK_NO_USER_ACTION: Integer;
    function _GetMOVE_TASK_WITH_HOME: Integer;
    function _GetRECENT_IGNORE_UNAVAILABLE: Integer;
    function _GetRECENT_WITH_EXCLUDED: Integer;
    { Methods }
    function init: JActivityManager; cdecl;
    // Added in API level 16
    procedure getMyMemoryState(outState: JActivityManager_RunningAppProcessInfo); cdecl;
    // Added in API level 11
    function isRunningInTestHarness: Boolean; cdecl;
    // Added in API level 8
    function isUserAMonkey: Boolean; cdecl;
    { Properties }
    // Added in API level 12
    property MOVE_TASK_NO_USER_ACTION: Integer read _GetMOVE_TASK_NO_USER_ACTION;
    // Added in API level 11
    property MOVE_TASK_WITH_HOME: Integer read _GetMOVE_TASK_WITH_HOME;
    // Added in API level 11
    property RECENT_IGNORE_UNAVAILABLE: Integer read _GetRECENT_IGNORE_UNAVAILABLE;
    property RECENT_WITH_EXCLUDEDread: Integer read _GetRECENT_WITH_EXCLUDED;
  end;

  [JavaSignature('android/app/ActivityManager')]
  JActivityManager = interface(JObject)
  ['{AC5C42D6-E307-41EC-890A-DC846F528B0D}']
    { Methods }
    // Added in API level 3
    function getDeviceConfigurationInfo: JConfigurationInfo; cdecl;
    // Added in API level 11
    function getLargeMemoryClass: Integer; cdecl;
    // Added in API level 11
    function getLauncherLargeIconDensity: Integer; cdecl;
    // Added in API level 11
    function getLauncherLargeIconSize: Integer; cdecl;
    // Added in API level 5
    function getMemoryClass: Integer; cdecl;
    procedure getMemoryInfo(outInfo: JActivityManager_MemoryInfo); cdecl;
    // Added in API level 5
    function getProcessMemoryInfo(pids: TJavaArray<Integer>): TJavaObjectArray<JDebug_MemoryInfo>; cdecl;
    function getProcessesInErrorState: JList{<JActivityManager_ProcessErrorStateInfo>}; cdecl;
    function getRecentTasks(maxNum: Integer; flags: Integer): JList{<JActivityManager_RecentTaskInfo>}; cdecl;
    // Added in API level 3
    function getRunningAppProcesses: JList{<JActivityManager_RunningAppProcessInfo>}; cdecl;
    // Added in API level 5
    function getRunningServiceControlPanel(service: JComponentName): JPendingIntent; cdecl;
    function getRunningServices(maxNum: Integer): JList{<JActivityManager_RunningServiceInfo>}; cdecl;
    function getRunningTasks(maxNum: Integer): JList{<JActivityManager_RunningTaskInfo>};cdecl;
    // Added in API level 8
    procedure killBackgroundProcesses(packageName: JString); cdecl;
    // Added in API level 16
    procedure moveTaskToFront(taskId: Integer; flags: Integer; options: JBundle); cdecl; overload;
    // Added in API level 11
    procedure moveTaskToFront(taskId: Integer; flags: Integer) cdecl; overload;
    // Added in API level 3
    procedure restartPackage(packageName: JString); cdecl;
  end;
  TJActivityManager = class(TJavaGenericImport<JActivityManagerClass, JActivityManager>) end;
{$ENDIF}

implementation

end.