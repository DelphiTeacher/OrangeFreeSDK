(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2013-09-19　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.3.1(10.3 Release 1)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)
//https://quality.embarcadero.com/browse/RSP-18043

{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Platform.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.Messaging, System.Classes, System.SysUtils, System.Generics.Collections,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.Os, Androidapi.NativeActivity, Androidapi.Input, Androidapi.AppGlue,
  Androidapi.JNI.Embarcadero, Androidapi.JNIBridge, Androidapi.JNI.GraphicsContentViewText, FMX.Forms, FMX.Types,
  FMX.Gestures, FMX.Consts, FMX.Platform, FMX.VirtualKeyboard.Android, FMX.Dialogs.Android, FMX.Platform.Timer.Android,
  FMX.Platform.Device.Android, FMX.Platform.Logger.Android, FMX.Platform.SaveState.Android, FMX.Platform.Screen.Android,
  FMX.Platform.Metrics.Android, FMX.Platform.UI.Android, FMX.Graphics.Android, FMX.Controls.Android;

type

  { Broadcast messages: Taking images }

  TMessageCancelReceivingImage = class(TMessage<Integer>);

  TMessageReceivedImagePath = class(TMessage<string>)
  public
    RequestCode: Integer;
  end;

  TFMXNativeActivityListener = class(TJavaLocal, JOnActivityListener)
  public
    procedure onCancelReceiveImage(ARequestCode: Integer); cdecl;
    procedure onReceiveImagePath(ARequestCode: Integer; AFileName: JString); cdecl;
    procedure onReceiveNotification(AIntent: JIntent); cdecl;
    procedure onReceiveResult(ARequestCode, AResultCode: Integer; AResultObject: JIntent); cdecl;
    procedure onRequestPermissionsResult(ARequestCode: Integer;
      APermissions: TJavaObjectArray<JString>; AGrantResults: TJavaArray<Integer>); cdecl;
  end;

{ TPlatformAndroid }

  TMainThreadWakeup = class(TThread)
  private
    FSignal: TObject;
    FRunnable: JRunnable;
  protected
    procedure Execute; override;
    procedure TerminatedSet; override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure WakeUp;
  end;

  TRecognizerServiceMap = class(TInterfacedObject, IFMXGestureRecognizersService)
    procedure AddRecognizer(const ARec: TInteractiveGesture; const AForm: TCommonCustomForm);
    procedure RemoveRecognizer(const ARec: TInteractiveGesture; const AForm: TCommonCustomForm);
  end;

  TRunnable = class;

  TPlatformAndroid = class(TInterfacedObject, IFMXApplicationEventService, IFMXApplicationService)
  private const
    UndefinedOrientation = TScreenOrientation(-1);
  private type
    TMessageQueueIdleHandler = class(TJavaLocal, JMessageQueue_IdleHandler)
    private
      [Weak] FPlatform: TPlatformAndroid;
      FHandler: JHandler;
      FEmptyRunnable : TRunnable;
    public
      constructor Create(APlatform: TPlatformAndroid);
      function queueIdle: Boolean; cdecl;
    end;
  private
    { Core services }
    FTimerService: TAndroidTimerService;
    FDeviceServices: TAndroidDeviceServices;
    FLoggerService: TAndroidLoggerService;
    FSaveStateService: TAndroidSaveStateService;
    FScreenServices: TAndroidScreenServices;
    FGraphicServices: TAndroidGraphicsServices;
    FMetricsServices: TAndroidMetricsServices;
    FVirtualKeyboardService: TVirtualKeyboardAndroid;
    FWindowService: TWindowServiceAndroid;
    FRecognizerServiceMap: TRecognizerServiceMap;
    FTextInputManager: TAndroidTextInputManager;
    FIdleHandler: TMessageQueueIdleHandler;
    { Internal }
    FMainThreadWakeup: TMainThreadWakeup;
    FOnApplicationEvent: TApplicationEventHandler;
    FActivityListener: TFMXNativeActivityListener;
    FFirstRun: Boolean;
    FLastOrientation: TScreenOrientation;
    FRunning: Boolean;
    FTerminating: Boolean;
    FTitle: string;
    procedure CheckOrientationChange;
    procedure RegisterWakeMainThread;
    procedure UnregisterWakeMainThread;
    procedure WakeMainThread(Sender: TObject);
    procedure RegisterServices;
    procedure UnregisterServices;
    procedure BindAppGlueEvents;
    procedure UnbindAppGlueEvents;
    procedure RegisterIdleHandler;
    procedure UnregisterIdleHandler;
  protected
    function HandleAndroidInputEvent(const AAppGlue: TAndroidApplicationGlue; const AEvent: PAInputEvent): Int32;
    procedure HandleApplicationCommandEvent(const AAppGlue: TAndroidApplicationGlue; const ACommand: TAndroidApplicationCommand);
    procedure HandleContentRectChanged(const AAppGlue: TAndroidApplicationGlue; const ARect: TRect);
  public
    constructor Create;
    destructor Destroy; override;
    procedure InternalProcessMessages;
    function ProcessOnIdleEvent: Boolean;
    { IFMXApplicationService }
    procedure Run;
    function HandleMessage: Boolean;
    procedure WaitMessage;
    function GetDefaultTitle: string;
    function GetTitle: string;
    procedure SetTitle(const AValue: string);
    function GetVersionString: string;
    function Running: Boolean;
    function Terminating: Boolean;
    procedure Terminate;
    { IFMXApplicationEventService }
    procedure SetApplicationEventHandler(AEventHandler: TApplicationEventHandler);
    function HandleApplicationEvent(const AEvent: TApplicationEvent): Boolean;
  public
    property DeviceManager: TAndroidDeviceServices read FDeviceServices;
    property Logger: TAndroidLoggerService read FLoggerService;
    property Metrics: TAndroidMetricsServices read FMetricsServices;
    property SaveStateManager: TAndroidSaveStateService read FSaveStateService;
    property ScreenManager: TAndroidScreenServices read FScreenServices;
    property TextInputManager: TAndroidTextInputManager read FTextInputManager;
    property TimerManager: TAndroidTimerService read FTimerService;
    property VirtualKeyboard: TVirtualKeyboardAndroid read FVirtualKeyboardService;
    property WindowService: TWindowServiceAndroid read FWindowService;
  end;

  TRunnable = class(TJavaLocal, JRunnable)
  private
    FCallback: TProc;
  public
    constructor Create(const ACallback: TProc);
    { JRunnable }
    procedure run; cdecl;
  end;

var
  PlatformAndroid: TPlatformAndroid;

function WindowHandleToPlatform(const AHandle: TWindowHandle): TAndroidWindowHandle;
function MainActivity: JFMXNativeActivity;

procedure RegisterCorePlatformServices;
procedure UnregisterCorePlatformServices;

//Fix or Add By Flying Wang
var
  /// <summary>
  ///   获取当前状态条高度（非 fmx 高度，像素高度）
  /// </summary>
  CurrStatusBarPixelHeight: Single = 20;
  /// <summary>
  ///   获取当前状态条高度（fmx 高度）
  /// </summary>
  CurrStatusBarFmxHeight: Single = 10;
  /// <summary>
  ///   强行要求不计算状态条的高度。
  /// </summary>
  ForceNoStatusBar: Boolean = False;
  /// <summary>
  ///   获取当前输入法高度（非 fmx 高度，像素高度）
  /// </summary>
  CurrVirtualKeyboardPixelTotalHeight: Single = 0;
  /// <summary>
  ///   获取当前输入法高度（fmx 高度）
  /// </summary>
  CurrVirtualKeyboardTotalFmxHeight: Single = 0;
  /// <summary>
  ///   获取当前输入法顶点（非 fmx，像素）
  /// </summary>
  CurrVirtualKeyboardPixelTop: Single = 0;
  CurrVirtualKeyboardPixelTopForEvent: Single = 0;
  /// <summary>
  ///   获取当前输入法顶点（fmx）
  /// </summary>
  CurrVirtualKeyboardFmxTop: Single = 0;


//Fix or Add By Flying Wang
/// <summary>
///   获取 StatusBar 的像素高
/// </summary>
function GetStatusBarPixelHeight: Integer;
function GetStatusBarHeight: Single;

/// <summary>
///   获取 NavigationBar 的像素高
/// </summary>
function GetNavigationBarPixelHeight(ForVKOrTopOrBottom: Boolean = False; ForLeftOrRigth: Boolean = False; Force: Boolean = False): Integer;
function GetNavigationBarHeight(ForVKOrTopOrBottom: Boolean = False; ForLeftOrRigth: Boolean = False): Single;
function GetNavigationBarIsTranslucent: Boolean;
function GetNavigationBarIsTranslucentAndNoHide: Boolean;
function GetNavigationBarIsHide: Boolean;
function GetIsFullScreen(WithTranslucentStatusBar: Boolean): Boolean;
function SetNavigationBarHide(IsHide: Boolean): Boolean;

//Android 判断是否是刘海屏 - yuan7016的博客 - CSDN博客
//https://blog.csdn.net/yuan7016/article/details/81101072
function IsHasNotchScreen: Boolean;
function IsRoundScreen: Boolean;

///	<summary>
///	  查找一个 JAVA 类是否可以使用
///	</summary>
///	<param name="NamePath">
///	  类的全路径
///	</param>
function IsCanFindJavaClass(const NamePath: string): Boolean;
function IsCanFindJavaMethod(const MethodName, Signature: string; const CalssNamePath: string = ''): Boolean;
function IsCanFindJavaStaticMethod(const MethodName, Signature: string; const CalssNamePath: string = ''): Boolean;


//Fix or Add By Flying Wang
procedure ForceUpdateScreenSize;

implementation

uses
//Fix or Add By Flying Wang
  Androidapi.Jni,
  Androidapi.JNI.Util,
  System.Devices, Androidapi.Helpers, AndroidApi.JNI.App, FMX.KeyMapping;

//Fix or Add By Flying Wang
function GetStatusBarPixelHeight: Integer;
var
  resourceId: Integer;
begin
//http://blog.csdn.net/u012764110/article/details/49783465
  Result := 20;
  try
    resourceId := TAndroidHelper.Context.getResources.getIdentifier(
      StringToJString('status_bar_height'),
      StringToJString('dimen'),
      StringToJString('android'));
    if resourceId <> 0 then
      Result := TAndroidHelper.Context.getResources.getDimensionPixelSize(resourceId);
  except
    Result := 20;
  end;
end;

function GetStatusBarHeight: Single;
var
  TempP: TPointF;
begin
  TempP.X := 0;
  TempP.Y := GetStatusBarPixelHeight;
  Result := ConvertPixelToPoint(TempP).Y;
end;

//Fix or Add By Flying Wang
type
  JSystemPropertiesClass = interface(IJavaClass)
    ['{C14AB573-CC6F-4087-A1FB-047E92F8E718}']
    function get(name: JString): JString; cdecl;
    function getInt(name: JString; default: Integer): Integer; cdecl;
  end;

  [JavaSignature('android/os/SystemProperties')]
  JSystemProperties = interface(IJavaInstance)
    ['{58A4A7BF-80D0-4FF8-9CF3-F94123C8EEB7}']
  end;
  TJSystemProperties = class(TJavaGenericImport<JSystemPropertiesClass, JSystemProperties>) end;

//Fix or Add By Flying Wang
function GetNavigationBarPixelHeight(ForVKOrTopOrBottom: Boolean = False; ForLeftOrRigth: Boolean = False; Force: Boolean = False): Integer;
var
  //oObj: JSystemProperties;
  oStr: JString;
  resourceId: Integer;
  AStr: string;
  HasNavigationBar: Boolean;
  FWindowManager: JWindowManager;
  WindowService: JObject;
  RP, P: JPoint;
  StatusBarPixelHeight,
  TempValue,
  RealValue: Integer;
begin
//http://blog.csdn.net/u012764110/article/details/49783465
  Result := 0;
  RealValue := 0;
  resourceId := TAndroidHelper.Context.getResources.getIdentifier(
    StringToJString('config_showNavigationBar'),
    StringToJString('bool'),
    StringToJString('android'));
  if (resourceId <> 0) then
  begin
    RealValue := 0;
    HasNavigationBar := TAndroidHelper.Context.getResources.getBoolean(resourceId);
    if (not TOSVersion.Check(9)) then
    begin
      //不能用 hide api.
      AStr := '';
      try
        //http://blog.csdn.net/lgaojiantong/article/details/42874529
        oStr := TJSystemProperties.JavaClass.get(StringToJString('qemu.hw.mainkeys'));
        if oStr <> nil then
          AStr := JStringToString(oStr).Trim;
      except
        AStr := '';
      end;
      if AStr <> '' then
      begin
        if AStr = '0' then
        begin
          HasNavigationBar := True;
        end
        else if AStr = '1' then
        begin
          HasNavigationBar := False;
        end
        else
        begin
          if TryStrToBool(AStr, HasNavigationBar) then
          begin
            HasNavigationBar := not HasNavigationBar;
          end;
        end;
      end;
    end;
    if HasNavigationBar then
    begin
      resourceId := TAndroidHelper.Context.getResources.getIdentifier(
        StringToJString('navigation_bar_height'),
        StringToJString('dimen'),
        StringToJString('android'));
      if resourceId <> 0 then
        RealValue := TAndroidHelper.Context.getResources.getDimensionPixelSize(resourceId);
    end;
  end;
  HasNavigationBar := False;
  try
    FWindowManager := nil;
    WindowService := TAndroidHelper.Activity.getSystemService(TJContext.JavaClass.WINDOW_SERVICE);
    if WindowService <> nil then
      FWindowManager := TJWindowManager.Wrap(WindowService);
    if FWindowManager <> nil then
    begin
      P := TJPoint.Create;
      RP := TJPoint.Create;
//      FWindowManager.getDefaultDisplay.getRealSize(RP);
      RP.x := TAndroidHelper.Activity.getWindow.getDecorView.getWidth;
      RP.y := TAndroidHelper.Activity.getWindow.getDecorView.getHeight;
      FWindowManager.getDefaultDisplay.getSize(P);
      if ForLeftOrRigth then
      begin
        Result := RP.x - P.x;
      end
      else if (RP.y <> P.y) or ForVKOrTopOrBottom then
      begin
        Result := RP.y - P.y;
      end
      else
      begin
        Result := RP.x - P.x;
      end;
    end;
    StatusBarPixelHeight := GetStatusBarPixelHeight;
    TempValue := Result - StatusBarPixelHeight;
    if (Result <> 0) and (TempValue <> 0) then
    begin
      Result := TempValue;
      if Result < RealValue then
        Result := RealValue;
    end
    else
    begin
      if (Result = StatusBarPixelHeight) and (StatusBarPixelHeight <> RealValue) then
        Result := 0;
      if (RealValue + StatusBarPixelHeight) = Result then
        Result := RealValue;
    end;
    if (Result <> 0) or Force then
    begin
      if RealValue <> 0 then
        Result := RealValue;
    end;
  except
    Result := 0;
  end;
end;

function GetNavigationBarHeight(ForVKOrTopOrBottom: Boolean = False; ForLeftOrRigth: Boolean = False): Single;
var
  TempP: TPointF;
begin
  TempP.X := 0;
  TempP.Y := GetNavigationBarPixelHeight(ForVKOrTopOrBottom, ForLeftOrRigth);
  Result := ConvertPixelToPoint(TempP).Y;
end;

function GetNavigationBarIsTranslucent: Boolean;
var
  Attributes_flags: Integer;
begin
  Result := False;
  Attributes_flags := 0;
  Attributes_flags := TAndroidHelper.Activity.getWindow.getAttributes.flags;
  if TOSVersion.Check(4, 4) then
  begin
    Result := (Attributes_flags and
      TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_NAVIGATION) =
        TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_NAVIGATION;
  end;
end;

function GetNavigationBarIsHide: Boolean;
var
  SYSTEM_UI_FLAG_HIDE_NAVIGATION,
  SystemUiVisibility: Integer;
  IsFullScreen: Boolean;
begin
  Result := False;
  SystemUiVisibility := 0;
  SYSTEM_UI_FLAG_HIDE_NAVIGATION := -1;
  IsFullScreen := PlatformAndroid.ScreenManager.GetFullScreen(nil);
  SystemUiVisibility := SharedActivity.getWindow.getDecorView.getSystemUiVisibility;
  SYSTEM_UI_FLAG_HIDE_NAVIGATION := TJView.JavaClass.SYSTEM_UI_FLAG_HIDE_NAVIGATION;
  if IsFullScreen or
    (SystemUiVisibility and SYSTEM_UI_FLAG_HIDE_NAVIGATION = SYSTEM_UI_FLAG_HIDE_NAVIGATION) then
  begin
    Result := True;
  end;
end;

function SetNavigationBarHide(IsHide: Boolean): Boolean;
var
  SystemUiVisibility: Integer;
  IsFullScreen: Boolean;
begin
  Result := False;
  SystemUiVisibility := 0;
  SystemUiVisibility := SharedActivity.getWindow.getDecorView.getSystemUiVisibility;
  SystemUiVisibility := SystemUiVisibility or TJView.JavaClass.SYSTEM_UI_FLAG_HIDE_NAVIGATION;
  SharedActivity.getWindow.getDecorView.setSystemUiVisibility(SystemUiVisibility);
  Result := IsHide = GetNavigationBarIsHide;
end;

//Fix or Add By Flying Wang
function IsCanFindJavaClass(const NamePath: string): Boolean;
var
  PEnv: PJNIEnv;
{$IF CompilerVersion < 30.0} // < RAD10
  PActivity: PANativeActivity;
{$ELSE}
  ContextClass: JNIClass;
{$ENDIF}
  TempClass: JNIClass;
  AMS: MarshaledAString;
begin
  try
    TempClass := nil;
{$IF CompilerVersion < 30.0} // < RAD10
    PActivity := PANativeActivity(System.DelphiActivity);
    PActivity^.vm^.AttachCurrentThread(PActivity^.vm, @PEnv, nil);
{$ELSE}
    PJavaVM(System.JavaMachine)^.AttachCurrentThread(System.JavaMachine, @PEnv, nil);
    ContextClass := nil;
    ContextClass := PEnv^.GetObjectClass(PEnv, System.JavaContext);
{$ENDIF}
    AMS := MarshaledAString(Utf8Encode(NamePath.Trim.Replace('.', '/', [rfReplaceAll])));
    try
      TempClass := PEnv^.FindClass(PEnv, AMS);
      PEnv^.ExceptionClear(PEnv);
      Result := TempClass <> nil;
    finally
      if TempClass <> nil then
        PEnv^.DeleteLocalRef(PEnv, TempClass);
{$IF CompilerVersion < 30.0} // < RAD10
{$ELSE}
      if ContextClass <> nil then
        PEnv^.DeleteLocalRef(PEnv, ContextClass);
{$ENDIF}
    end;
  except
    Result := False;
  end;
end;

function IsCanFindJavaMethod(const MethodName, Signature: string; const CalssNamePath: string = ''): Boolean;
var
  PEnv: PJNIEnv;
{$IF CompilerVersion < 30.0} // < RAD10
  PActivity: PANativeActivity;
{$ELSE}
  ContextClass: JNIClass;
{$ENDIF}
  ActivityClass: JNIClass;
  GetMethod: JNIMethodID;
  ASignature: string;
  AMSMethodName, AMSSignature: MarshaledAString;
begin
  try
    Result := False;
    AMSMethodName := MarshaledAString(Utf8Encode(MethodName.Trim));

{$IF CompilerVersion < 30.0} // < RAD10
    PActivity := PANativeActivity(System.DelphiActivity);
    PActivity^.vm^.AttachCurrentThread(PActivity^.vm, @PEnv, nil);
{$ELSE}
    PJavaVM(System.JavaMachine)^.AttachCurrentThread(System.JavaMachine, @PEnv, nil);
    ContextClass := nil;
    ContextClass := PEnv^.GetObjectClass(PEnv, System.JavaContext);
{$ENDIF}
    ActivityClass := nil;
    try
      if CalssNamePath.Trim <> '' then
      begin
        ASignature := CalssNamePath.Trim.Replace('.', '/', [rfReplaceAll]);
        AMSSignature := MarshaledAString(Utf8Encode(ASignature));
        ActivityClass := PEnv^.FindClass(PEnv, AMSSignature);
        PEnv^.ExceptionClear(PEnv);
      end
      else
      begin
{$IF CompilerVersion < 30.0} // < RAD10
        ActivityClass := PEnv^.GetObjectClass(PEnv, PActivity^.clazz);
{$ELSE}
        ActivityClass := PEnv^.GetObjectClass(PEnv, System.JavaContext);
{$ENDIF}
      end;
      if ActivityClass <> nil then
      begin
        ASignature := Signature.Trim;
        AMSSignature := MarshaledAString(Utf8Encode(ASignature));
        GetMethod := PEnv^.GetMethodID(PEnv, ActivityClass, AMSMethodName, AMSSignature);
        PEnv^.ExceptionClear(PEnv);
        Result := GetMethod <> nil;
      end;
    finally
      if ActivityClass <> nil then
        PEnv^.DeleteLocalRef(PEnv, ActivityClass);
{$IF CompilerVersion < 30.0} // < RAD10
{$ELSE}
      if ContextClass <> nil then
        PEnv^.DeleteLocalRef(PEnv, ContextClass);
{$ENDIF}
    end;
  except
    Result := False;
  end;
end;

function IsCanFindJavaStaticMethod(const MethodName, Signature: string; const CalssNamePath: string = ''): Boolean;
var
  PEnv: PJNIEnv;
{$IF CompilerVersion < 30.0} // < RAD10
  PActivity: PANativeActivity;
{$ELSE}
  ContextClass: JNIClass;
{$ENDIF}
  ActivityClass: JNIClass;
  GetMethod: JNIMethodID;
  ASignature: string;
  AMSMethodName, AMSSignature: MarshaledAString;
begin
  try
    Result := False;
    AMSMethodName := MarshaledAString(Utf8Encode(MethodName.Trim));

{$IF CompilerVersion < 30.0} // < RAD10
    PActivity := PANativeActivity(System.DelphiActivity);
    PActivity^.vm^.AttachCurrentThread(PActivity^.vm, @PEnv, nil);
{$ELSE}
    PJavaVM(System.JavaMachine)^.AttachCurrentThread(System.JavaMachine, @PEnv, nil);
    ContextClass := nil;
    ContextClass := PEnv^.GetObjectClass(PEnv, System.JavaContext);
{$ENDIF}
    ActivityClass := nil;
    try
      if CalssNamePath.Trim <> '' then
      begin
        ASignature := CalssNamePath.Trim.Replace('.', '/', [rfReplaceAll]);
        AMSSignature := MarshaledAString(Utf8Encode(ASignature));
        ActivityClass := PEnv^.FindClass(PEnv, AMSSignature);
        PEnv^.ExceptionClear(PEnv);
      end
      else
      begin
{$IF CompilerVersion < 30.0} // < RAD10
        ActivityClass := PEnv^.GetObjectClass(PEnv, PActivity^.clazz);
{$ELSE}
        ActivityClass := PEnv^.GetObjectClass(PEnv, System.JavaContext);
{$ENDIF}
      end;
      if ActivityClass <> nil then
      begin
        ASignature := Signature.Trim;
        AMSSignature := MarshaledAString(Utf8Encode(ASignature));
        GetMethod := PEnv^.GetStaticMethodID(PEnv, ActivityClass, AMSMethodName, AMSSignature);
        PEnv^.ExceptionClear(PEnv);
        Result := GetMethod <> nil;
      end;
    finally
      if ActivityClass <> nil then
        PEnv^.DeleteLocalRef(PEnv, ActivityClass);
{$IF CompilerVersion < 30.0} // < RAD10
{$ELSE}
      if ContextClass <> nil then
        PEnv^.DeleteLocalRef(PEnv, ContextClass);
{$ENDIF}
    end;
  except
    Result := False;
  end;
end;

function IsXiaoMi: Boolean;
begin
  Result := False;
  var Str: string := JStringToString(TJBuild.JavaClass.MANUFACTURER);
  Result := Str.Contains('Xiaomi') or Str.Contains('Redmi');
end;

type
  JDisplayCutout = interface;

  JDisplayCutoutClass = interface(JObjectClass)
  ['{D617B756-F637-4042-996E-49E9F4838F53}']
    { static Property Methods }

    { static Methods }
    {class} function init(safeInsets: JRect; boundingRects: JList): JDisplayCutout; cdecl; //(Landroid/graphics/Rect;Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('android/view/DisplayCutout')]
  JDisplayCutout = interface(JObject)
  ['{48C7FAF1-09DA-441E-AF39-69B53A16F613}']
    { Property Methods }

    { methods }
    function getSafeInsetTop: Integer; cdecl; //()I
    function getSafeInsetBottom: Integer; cdecl; //()I
    function getSafeInsetLeft: Integer; cdecl; //()I
    function getSafeInsetRight: Integer; cdecl; //()I
    function getBoundingRects: JList; cdecl; //()Ljava/util/List;
    function hashCode: Integer; cdecl; //()I
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  JWindowInsetsP = interface;

  TJDisplayCutout = class(TJavaGenericImport<JDisplayCutoutClass, JDisplayCutout>) end;

  JWindowInsetsPClass = interface(JObjectClass)
    ['{F8F2589B-5934-4381-B696-2FBD940A1B06}']
  end;

  [JavaSignature('android/view/WindowInsets')]
  JWindowInsetsP = interface(JObject)
    ['{74588E20-683A-4A39-B5CC-CE37EC4305CD}']
    function getDisplayCutout: JDisplayCutout; cdecl; //()Landroid/view/DisplayCutout;
    function consumeDisplayCutout: JWindowInsets; cdecl; //()Landroid/view/WindowInsets;
  end;
  TJWindowInsetsP = class(TJavaGenericImport<JWindowInsetsPClass, JWindowInsetsP>) end;

  JHwNotchSizeUtil = interface;

  JHwNotchSizeUtilClass = interface(JObjectClass)
    ['{ED5B3BEA-C7D5-4DE3-8AF4-736AEB1F9C1B}']
    function hasNotchInScreen: Boolean;  cdecl;
  end;

  [JavaSignature('com.huawei.android.util.HwNotchSizeUtil')]
  JHwNotchSizeUtil = interface(JObject)
    ['{643BE943-B47F-4495-B8B3-F4B03E4ADDF8}']
  end;
  TJHwNotchSizeUtil = class(TJavaGenericImport<JHwNotchSizeUtilClass, JHwNotchSizeUtil>) end;

const
  VIVO_NOTCH = $00000020;//是否有刘海
  VIVO_FILLET = $00000008;//是否有圆角

type
  JFtFeatureUtil = interface;

  JFtFeatureUtilClass = interface(JObjectClass)
    ['{99FCABB0-5ADE-44CE-8578-F1A52C130F25}']
    function isFeatureSupport(mask: Integer): Boolean;  cdecl;
  end;

  [JavaSignature('android.util.FtFeature')]
  JFtFeatureUtil = interface(JObject)
    ['{E2A163ED-468A-4FA5-97E0-ADE8C7DEF8A7}']
  end;
  TJFtFeatureUtil = class(TJavaGenericImport<JFtFeatureUtilClass, JFtFeatureUtil>) end;

  JMethod2Invoke = interface;

  JMethod2InvokeClass = interface(JObjectClass) // or JObjectClass // SuperSignature: java/lang/reflect/AccessibleObject
  ['{78FDACCD-05FA-478C-AA11-4BF4794DFC7C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('java/lang/reflect/Method')]
  JMethod2Invoke = interface(JObject) // or JObject // SuperSignature: java/lang/reflect/AccessibleObject
  ['{6190D24D-0B94-4836-92C4-7F8B23C4FC9B}']
    { Property Methods }

    { methods }
    function invoke(receiver: JObject; args: TJavaObjectArray<JObject>): JObject; cdecl; //(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    { Property }
  end;

  TJMethod2Invoke = class(TJavaGenericImport<JMethod2InvokeClass, JMethod2Invoke>) end;

var
  IsVivoFeatureSupportMethod: JMethod2Invoke = nil;
  ftFeatureClass: Jlang_Class = nil;
function IsVivoFeatureSupport(Mask: Integer): Boolean;
begin
  Result := False;
  try
    if (IsVivoFeatureSupportMethod = nil) or (ftFeatureClass = nil) then
    begin
      var ClassName := 'android.util.FtFeature';
      var MethodName := 'isFeatureSupport';
      var Signature := '(I)Z';
      if IsCanFindJavaStaticMethod(MethodName, Signature, ClassName) then
      begin
        //Result := TJFtFeatureUtil.JavaClass.isFeatureSupport(Mask);
        //狗屁 vivo 一定要用反射调用。
        var cl:JClassLoader := TAndroidHelper.Context.getClassLoader;
        ftFeatureClass := cl.loadClass(StringToJString(ClassName));
  //      var methods:TJavaObjectArray<JMethod> := ftFeatureClass.getDeclaredMethods;
        var methods:TJavaObjectArray<JMethod> := ftFeatureClass.getMethods;
        if (methods  <> nil) then
        begin
          var method: JMethod := nil;
          for var I := 0 to methods.length - 1 do
          begin
            method := methods[I];
            if (method.getName.equalsIgnoreCase(StringToJString(MethodName))) then
            begin
              IsVivoFeatureSupportMethod := JMethod2Invoke(method);
              break;
            end;
          end;
        end;
      end;
    end;
    if (IsVivoFeatureSupportMethod <> nil) and (ftFeatureClass <> nil) then
    begin
      var args := TJavaObjectArray<JObject>.Create(1); //maybe auto free
      try
        args.Items[0] := TJInteger.JavaClass.init(Mask);
        Result := JBoolean(IsVivoFeatureSupportMethod.invoke(ftFeatureClass, args)).booleanValue;
      finally
        FreeAndNil(args);
      end;
    end;
  except
    Result := False;
  end;
end;

function IsHasNotchScreen: Boolean;
  function hasNotchAtLenovo: Boolean;
  begin
    Result := False;
    try
      var Str: string := JStringToString(TJBuild.JavaClass.MODEL).ToUpper;
      Result := Str.Contains('Lenovo L58041'.ToUpper) or Str.Contains('Lenovo L78011'.ToUpper);
      if Result then
      begin
        var Metrics: JDisplayMetrics := TAndroidHelper.DisplayMetrics;
        var RealSize: JPoint := TJPoint.Create;
        RealSize.x := TAndroidHelper.Activity.getWindow.getDecorView.getWidth;
        RealSize.y := TAndroidHelper.Activity.getWindow.getDecorView.getHeight;
        if (Metrics <> nil) and (PlatformAndroid <> nil) and (PlatformAndroid.ScreenManager <> nil) then
        begin
          var AScreenOrientation := PlatformAndroid.ScreenManager.GetScreenOrientation;
          var NavigationBarPixelHeight :=  GetNavigationBarPixelHeight(False, False, False);
          var StatusBarPixelHeight :=  GetStatusBarPixelHeight;
          if (AScreenOrientation = TScreenOrientation.InvertedLandscape) or
           (AScreenOrientation = TScreenOrientation.Landscape) then
          begin
            Result := ((Metrics.widthPixels + StatusBarPixelHeight + NavigationBarPixelHeight) = RealSize.x);
          end
          else
          begin
            if GetIsFullScreen(False) then
            begin
              Result := ((Metrics.heightPixels + GetNavigationBarPixelHeight(False, False, True)) = RealSize.y);
              if not Result then
                Result := (Metrics.heightPixels = RealSize.y);
            end
            else
            begin
              Result := ((Metrics.heightPixels + StatusBarPixelHeight + NavigationBarPixelHeight) = RealSize.y);
            end;
            if Result then
            begin
              Result := GetIsFullScreen(True);
            end;
          end;
        end;
      end;
    except
      Result := False;
    end;
  end;
  function hasNotchAtXiaomi: Boolean;
  begin
    Result := False;
    try
      if IsXiaoMi then
      begin
        var TempInt: Integer := 0;
        if (not TOSVersion.Check(9)) then
        //不能用 hide api.
          TempInt := TJSystemProperties.JavaClass.getInt(StringToJString('ro.miui.notch'), TempInt);
        Result := (TempInt <> 0);
      end;
    except
      Result := False;
    end;
  end;
  function hasNotchAtHuawei: Boolean;
  begin
    Result := False;
    try
      var ClassName := 'com.huawei.android.util.HwNotchSizeUtil';
      var MethodName := 'hasNotchInScreen';
      var Signature := '()Z';
      if IsCanFindJavaStaticMethod(MethodName, Signature, ClassName) then
        Result := TJHwNotchSizeUtil.JavaClass.hasNotchInScreen;
    except
      Result := False;
    end;
  end;
  function hasNotchAtVivo: Boolean;
  begin
    try
      Result := IsVivoFeatureSupport(VIVO_NOTCH);
    except
      Result := False;
    end;
  end;
  function hasNotchAtOPPO: Boolean;
  begin
    Result := False;
    try
      Result := TAndroidHelper.Context.getPackageManager.hasSystemFeature(
        StringToJString('com.oppo.feature.screen.heteromorphism'));
    except
      Result := False;
    end;
  end;
begin
  Result := False;
  if TOSVersion.Check(9) then
  begin
    var WindowInsets: JWindowInsetsP := JWindowInsetsP(TAndroidHelper.Activity.getWindow.getDecorView.getRootWindowInsets);
    if WindowInsets <> nil then
    begin
      try
        Result := WindowInsets.getDisplayCutout <> nil;
      except
        Result := False;
      end;
    end;
  end
  else
    Result := hasNotchAtHuawei or hasNotchAtXiaomi or hasNotchAtVivo or hasNotchAtOPPO or hasNotchAtLenovo;
end;

function IsRoundScreen: Boolean;
  function IsRoundScreenAtLenovo: Boolean;
  begin
    Result := False;
    try
      var Str: string := JStringToString(TJBuild.JavaClass.MODEL).ToUpper;
      Result := Str.Contains('Lenovo L58041'.ToUpper) or Str.Contains('Lenovo L78011'.ToUpper);
      if Result and (GetIsFullScreen(True) or (GetNavigationBarPixelHeight(False, False, False) = 0)) then
      begin
        Result := True;
      end
      else
      begin
        Result := False;
      end;
    except
      Result := False;
    end;
  end;
  function IsRoundScreenAtVivo: Boolean;
  begin
    try
      Result := IsVivoFeatureSupport(VIVO_FILLET);
    except
      Result := False;
    end;
  end;
begin
  Result := False;
  if TOSVersion.Check(6) then
  begin
    var WindowInsets: JWindowInsets := TAndroidHelper.Activity.getWindow.getDecorView.getRootWindowInsets;
    if WindowInsets <> nil then
    begin
      Result := WindowInsets.isRound;
    end;
  end;
  if not Result then
  begin
    Result := IsRoundScreenAtLenovo or IsRoundScreenAtVivo;
  end;
end;

function GetIsFullScreen(WithTranslucentStatusBar: Boolean): Boolean;
var
  FLAG_FULLSCREEN,
  FLAG_TRANSLUCENT_STATUS,
  Attributes_flags: Integer;
  IsFullScreen: Boolean;
begin
  Result := False;
  Attributes_flags := 0;
  FLAG_FULLSCREEN := -1;
  FLAG_TRANSLUCENT_STATUS := -1;
  IsFullScreen := PlatformAndroid.ScreenManager.GetFullScreen(nil);
  Attributes_flags := TAndroidHelper.Activity.getWindow.getAttributes.flags;
  FLAG_FULLSCREEN := TJWindowManager_LayoutParams.JavaClass.FLAG_FULLSCREEN;
  if TOSVersion.Check(4, 4) and WithTranslucentStatusBar then
    FLAG_TRANSLUCENT_STATUS := TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS;
  if WithTranslucentStatusBar then
  begin
    if IsFullScreen or
      (Attributes_flags and FLAG_FULLSCREEN = FLAG_FULLSCREEN) or
      (Attributes_flags and FLAG_TRANSLUCENT_STATUS = FLAG_TRANSLUCENT_STATUS) then
    begin
      Result := True;
    end;
  end
  else
  begin
    if IsFullScreen or
      (Attributes_flags and FLAG_FULLSCREEN = FLAG_FULLSCREEN) then
    begin
      Result := True;
    end;
  end;
end;

function GetNavigationBarIsTranslucentAndNoHide: Boolean;
var
  IsFullScreen: Boolean;
begin
  Result := GetNavigationBarIsTranslucent;
  if GetNavigationBarIsHide then
  begin
    Result := False;
  end;
end;

//Fix or Add By Flying Wang
procedure ForceUpdateScreenSize;
begin
  PlatformAndroid.ScreenManager.UpdateDisplayInformation;
  if Screen.ActiveForm <> nil then
  begin
    PlatformAndroid.WindowService.SetWindowRect(Screen.ActiveForm, Screen.WorkAreaRect);
  end;
end;
//fix end.

function WindowHandleToPlatform(const AHandle: TWindowHandle): TAndroidWindowHandle;
begin
  Result := TAndroidWindowHandle(AHandle);
end;

function MainActivity: JFMXNativeActivity;
begin
  if TAndroidApplicationGlue.Current <> nil then
    Result := TJFMXNativeActivity.Wrap(TAndroidApplicationGlue.Current.NativeActivity.clazz)
  else
    Result := nil;
end;

procedure RegisterCorePlatformServices;
begin
  PlatformAndroid := TPlatformAndroid.Create;
end;

procedure UnregisterCorePlatformServices;
begin
  FreeAndNil(PlatformAndroid);
end;

{ TPlatformAndroid }

constructor TPlatformAndroid.Create;
begin
  inherited;
  BindAppGlueEvents;

  { Creates core services }
  FLoggerService := TAndroidLoggerService.Create;
  FTimerService := TAndroidTimerService.Create;
  FSaveStateService := TAndroidSaveStateService.Create;
  FScreenServices := TAndroidScreenServices.Create;
  FMetricsServices := TAndroidMetricsServices.Create;
  FDeviceServices := TAndroidDeviceServices.Create;
  if DeviceManager.GetDeviceClass <> TDeviceInfo.TDeviceClass.Watch then
    FVirtualKeyboardService := TVirtualKeyboardAndroid.Create;
  FGraphicServices := TAndroidGraphicsServices.Create;
  FWindowService := TWindowServiceAndroid.Create;
  FRecognizerServiceMap := TRecognizerServiceMap.Create;
  FTextInputManager := TAndroidTextInputManager.Create;
  FIdleHandler := TMessageQueueIdleHandler.Create(Self);

  Application := TApplication.Create(nil);
  FFirstRun := True;
  FRunning := False;
  FActivityListener := TFMXNativeActivityListener.Create;
  MainActivity.setListener(FActivityListener);
  FMainThreadWakeup := TMainThreadWakeup.Create;
  FLastOrientation := UndefinedOrientation;
  if DeviceManager.GetModel = 'Glass 1' then
    TPlatformServices.Current.GlobalFlags.Add(EnableGlassFPSWorkaround, True);

  RegisterServices;
  RegisterWakeMainThread;
  RegisterIdleHandler;
end;

destructor TPlatformAndroid.Destroy;
begin
  FTextInputManager.Free;
  FRecognizerServiceMap.Free;
  FWindowService.Free;
  FGraphicServices.Free;
  FVirtualKeyboardService.Free;
  FDeviceServices.Free;
  FMetricsServices.Free;
  FScreenServices.Free;
  FSaveStateService.Free;
  FTimerService.Free;
  FLoggerService.Free;

  UnregisterIdleHandler;
  UnregisterServices;
  UnbindAppGlueEvents;

  FMainThreadWakeup.DisposeOf;
  FActivityListener.DisposeOf;
  UnregisterWakeMainThread;
  inherited;
end;

procedure TPlatformAndroid.Run;
begin
  FRunning := True;
  { Although calling this routine is not really necessary, but it is a way to ensure that "Androidapi.AppGlue.pas" is
    kept in uses list, in order to export ANativeActivity_onCreate callback. }
  app_dummy;
  InternalProcessMessages;
end;

function TPlatformAndroid.Running: Boolean;
begin
  Result := FRunning;
end;

function TPlatformAndroid.Terminating: Boolean;
begin
  Result := FTerminating;
end;

procedure TPlatformAndroid.Terminate;
begin
  FRunning := False;
  FTerminating := True;
  TMessageManager.DefaultManager.SendMessage(nil, TApplicationTerminatingMessage.Create);
  // When we manually finish our activity, Android will not generate OnSaveInstanceState event, because it is generated
  // only in cases when the system is going to kill our activity to reclaim resources. In this particular case we
  // initiate correct termination of the application, so we have to invoke OnSaveInstanceState manually to make sure
  // that TForm.OnSaveState is invoked before the application is closed
  HandleApplicationCommandEvent(TAndroidApplicationGlue.Current, TAndroidApplicationCommand.SaveState);
  ANativeActivity_finish(System.DelphiActivity);
end;

function TPlatformAndroid.HandleAndroidInputEvent(const AAppGlue: TAndroidApplicationGlue; const AEvent: PAInputEvent): Int32;
var
  EventType: Int32;
begin
  EventType := AInputEvent_getType(AEvent);

  if EventType = AINPUT_EVENT_TYPE_KEY then
    // Keyboard input
    Result := TextInputManager.HandleAndroidKeyEvent(AEvent)
  else
    Result := 0;
end;

function TPlatformAndroid.HandleMessage: Boolean;
begin
  InternalProcessMessages;
  Result := False;
end;

procedure TPlatformAndroid.BindAppGlueEvents;
var
  AndroidAppGlue: TAndroidApplicationGlue;
begin
  AndroidAppGlue := PANativeActivity(System.DelphiActivity)^.instance;
  AndroidAppGlue.OnApplicationCommandEvent := HandleApplicationCommandEvent;
  AndroidAppGlue.OnContentRectEvent := HandleContentRectChanged;
  AndroidAppGlue.OnInputEvent := HandleAndroidInputEvent;
end;

procedure TPlatformAndroid.CheckOrientationChange;
var
  LOrientation: TScreenOrientation;
begin
  LOrientation := ScreenManager.GetScreenOrientation;
  if FLastOrientation <> LOrientation then
  begin
    FLastOrientation := LOrientation;
    TMessageManager.DefaultManager.SendMessage(Self, TOrientationChangedMessage.Create, True);
  end;
end;

procedure TPlatformAndroid.WaitMessage;
begin
  InternalProcessMessages;
end;

procedure TPlatformAndroid.RegisterWakeMainThread;
begin
  System.Classes.WakeMainThread := WakeMainThread;
end;

procedure TPlatformAndroid.UnregisterWakeMainThread;
begin
  System.Classes.WakeMainThread := nil;
end;

{ TWakeMainThreadRunnable }

constructor TMainThreadWakeup.Create;
begin
  inherited Create;
  FRunnable := TRunnable.Create(procedure begin
    PlatformAndroid.InternalProcessMessages;
  end);

  FSignal := TObject.Create;
end;

destructor TMainThreadWakeup.Destroy;
begin
  FRunnable := nil;
  inherited;
  FSignal.Free;
end;

procedure TMainThreadWakeup.Execute;
begin
  repeat
    TMonitor.Enter(FSignal);
    try
      TMonitor.Wait(FSignal, INFINITE);
    finally
      TMonitor.Exit(FSignal);
    end;
    if not Terminated then
      TAndroidHelper.Activity.runOnUiThread(FRunnable);
  until Terminated;
end;

procedure TMainThreadWakeup.TerminatedSet;
begin
  inherited;
  WakeUp;
end;

procedure TMainThreadWakeup.WakeUp;
begin
  TMonitor.Pulse(FSignal);
end;

procedure TPlatformAndroid.WakeMainThread(Sender: TObject);
begin
  FMainThreadWakeup.WakeUp;
end;

procedure TPlatformAndroid.InternalProcessMessages;
begin
  CheckSynchronize;
  ProcessOnIdleEvent;
end;

function TPlatformAndroid.ProcessOnIdleEvent: Boolean;
begin
  Result := True;
  if not Terminating then
    try
      Application.DoIdle(Result);
    except
      Application.HandleException(Application);
    end;
end;

function TPlatformAndroid.GetDefaultTitle: string;
begin
  Result := TAndroidHelper.ApplicationTitle;
end;

function TPlatformAndroid.GetTitle: string;
begin
  Result := FTitle;
end;

function TPlatformAndroid.GetVersionString: string;
var
  PackageInfo: JPackageInfo;
  PackageManager: JPackageManager;
  AppContext: JContext;
begin
  AppContext := TAndroidHelper.Context;
  if AppContext <> nil then
  begin
    PackageManager := AppContext.getPackageManager;
    if PackageManager <> nil then
    begin
      PackageInfo := AppContext.getPackageManager.getPackageInfo(AppContext.getPackageName, 0);
      if PackageInfo <> nil then
        Exit(JStringToString(PackageInfo.versionName));
    end;
  end;
  Result := string.Empty;
end;

procedure TPlatformAndroid.SetTitle(const AValue: string);
begin
  FTitle := AValue;
end;

procedure TPlatformAndroid.SetApplicationEventHandler(AEventHandler: TApplicationEventHandler);
begin
  FOnApplicationEvent := AEventHandler;
end;

function TPlatformAndroid.HandleApplicationEvent(const AEvent: TApplicationEvent): Boolean;
var
  ApplicationEventMessage: TApplicationEventMessage;
begin
  Result := False;

  { Send broadcast message }
  ApplicationEventMessage := TApplicationEventMessage.Create(TApplicationEventData.Create(AEvent, nil));
  TMessageManager.DefaultManager.SendMessage(nil, ApplicationEventMessage);

  { Invoke application event}
  if Assigned(FOnApplicationEvent) then
    try
      Result := FOnApplicationEvent(AEvent, nil);
    except
      Application.HandleException(Self);
    end;
end;

procedure TPlatformAndroid.HandleContentRectChanged(const AAppGlue: TAndroidApplicationGlue; const ARect: TRect);
begin
  ScreenManager.UpdateDisplayInformation;
end;

procedure TPlatformAndroid.HandleApplicationCommandEvent(const AAppGlue: TAndroidApplicationGlue; const ACommand: TAndroidApplicationCommand);
begin
  case ACommand of
    TAndroidApplicationCommand.Start:
      begin
        FRunning := True;
        FTerminating := False;
        if not Application.IsRealCreateFormsCalled then
        begin
          Application.RealCreateForms;
          // Android has logic of clipping native views in Window.
          // https://developer.android.com/reference/kotlin/android/view/Window#setClipToOutline%28kotlin.Boolean
          // It clips content of native Window by background drawable. We special disable it for FMX. Because we use
          // Window background for showing splash screen image. But splash screen image is not stretched on all Window
          // and as result Window clips native control.
          //
          // Unfortunately some Samsung devices doesn't respect windowClipToOutline property value in style-v21.xml file.
          //  Therefore, we forcibly reset the splash screen background after launching the application (see RSP-22928).
          TAndroidHelper.Activity.getWindow.setBackgroundDrawable(nil);
        end;

        if FFirstRun then
        begin
          FFirstRun := False;
          HandleApplicationEvent(TApplicationEvent.FinishedLaunching);
        end;
      end;

    TAndroidApplicationCommand.Resume:
      HandleApplicationEvent(TApplicationEvent.WillBecomeForeground);

    TAndroidApplicationCommand.Pause:
      HandleApplicationEvent(TApplicationEvent.EnteredBackground);

    TAndroidApplicationCommand.GainedFocus:
      HandleApplicationEvent(TApplicationEvent.BecameActive);

    TAndroidApplicationCommand.LostFocus:
      HandleApplicationEvent(TApplicationEvent.WillBecomeInactive);

    TAndroidApplicationCommand.SaveState:
      TMessageManager.DefaultManager.SendMessage(Self, TSaveStateMessage.Create);

    TAndroidApplicationCommand.ConfigChanged:
      CheckOrientationChange;

    TAndroidApplicationCommand.LowMemory:
      PlatformAndroid.HandleApplicationEvent(TApplicationEvent.LowMemory);

    TAndroidApplicationCommand.Destroy:
      HandleApplicationEvent(TApplicationEvent.WillTerminate);
  end;
end;

procedure TPlatformAndroid.RegisterIdleHandler;
var
  MessageQueue: JMessageQueue;
begin
  MessageQueue := TJLooper.JavaClass.getMainLooper.getQueue;
  MessageQueue.addIdleHandler(FIdleHandler);
end;

procedure TPlatformAndroid.RegisterServices;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService) then
    TPlatformServices.Current.AddPlatformService(IFMXApplicationService, Self);
  if not TPlatformServices.Current.SupportsPlatformService(IFMXApplicationEventService) then
    TPlatformServices.Current.AddPlatformService(IFMXApplicationEventService, Self);
  if not TPlatformServices.Current.SupportsPlatformService(IFMXWindowService) then
    TPlatformServices.Current.AddPlatformService(IFMXWindowService, WindowService);
  if not TPlatformServices.Current.SupportsPlatformService(IFMXMouseService) then
    TPlatformServices.Current.AddPlatformService(IFMXMouseService, WindowService);
  if not TPlatformServices.Current.SupportsPlatformService(IFMXGestureRecognizersService) then
    TPlatformServices.Current.AddPlatformService(IFMXGestureRecognizersService, FRecognizerServiceMap);

  if not TPlatformServices.Current.SupportsPlatformService(IFMXTextService) then
    TPlatformServices.Current.AddPlatformService(IFMXTextService, FTextInputManager);
  if (FVirtualKeyboardService <> nil) and not TPlatformServices.Current.SupportsPlatformService(IFMXKeyMappingService) then
    TPlatformServices.Current.AddPlatformService(IFMXKeyMappingService, FTextInputManager);
end;

procedure TPlatformAndroid.UnbindAppGlueEvents;
var
  AndroidAppGlue: TAndroidApplicationGlue;
begin
  AndroidAppGlue := PANativeActivity(System.DelphiActivity)^.instance;
  if AndroidAppGlue <> nil then
  begin
    AndroidAppGlue.OnApplicationCommandEvent := nil;
    AndroidAppGlue.OnContentRectEvent := nil;
    AndroidAppGlue.OnInputEvent := nil;
  end;
end;

procedure TPlatformAndroid.UnregisterIdleHandler;
var
  MessageQueue: JMessageQueue;
begin
  MessageQueue := TJLooper.JavaClass.getMainLooper.getQueue;
  MessageQueue.removeIdleHandler(FIdleHandler);
end;

procedure TPlatformAndroid.UnregisterServices;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXApplicationService);
  TPlatformServices.Current.RemovePlatformService(IFMXApplicationEventService);
  TPlatformServices.Current.RemovePlatformService(IFMXWindowService);
  TPlatformServices.Current.RemovePlatformService(IFMXMouseService);
  TPlatformServices.Current.RemovePlatformService(IFMXGestureRecognizersService);
  TPlatformServices.Current.RemovePlatformService(IFMXTextService);
  TPlatformServices.Current.RemovePlatformService(IFMXKeyMappingService);
end;

{ TFMXNativeActivityListener }

procedure TFMXNativeActivityListener.onCancelReceiveImage(ARequestCode: Integer);
begin
  TThread.Queue(nil, procedure
  begin
    TMessageManager.DefaultManager.SendMessage(nil, TMessageCancelReceivingImage.Create(ARequestCode));
  end);
end;

procedure TFMXNativeActivityListener.onReceiveImagePath(ARequestCode: Integer; AFileName: JString);
var
  Message: TMessageReceivedImagePath;
begin
  TThread.Queue(nil, procedure
  var
    ImageFileName: string;
  begin
    ImageFileName := JStringToString(AFileName);
    Message := TMessageReceivedImagePath.Create(ImageFileName);
    Message.RequestCode := ARequestCode;
    TMessageManager.DefaultManager.SendMessage(nil, Message);
  end);
end;

procedure TFMXNativeActivityListener.onReceiveNotification(AIntent: JIntent);
begin
  TMessageManager.DefaultManager.SendMessage(nil, TMessageReceivedNotification.Create(AIntent));
end;

procedure TFMXNativeActivityListener.onReceiveResult(ARequestCode, AResultCode: Integer; AResultObject: JIntent);
var
  Msg: TMessageResultNotification;
begin
  Msg := TMessageResultNotification.Create(AResultObject);
  Msg.RequestCode := ARequestCode;
  Msg.ResultCode := AResultCode;
  TMessageManager.DefaultManager.SendMessage(nil, Msg);
end;

procedure TFMXNativeActivityListener.onRequestPermissionsResult(ARequestCode: Integer;
  APermissions: TJavaObjectArray<JString>; AGrantResults: TJavaArray<Integer>);
var
  MsgData: TPermissionsRequestResultData;
  Msg: TPermissionsRequestResultMessage;
begin
  MsgData.RequestCode := ARequestCode;
  MsgData.Permissions := APermissions;
  MsgData.GrantResults := AGrantResults;
  Msg := TPermissionsRequestResultMessage.Create(MsgData);
  TMessageManager.DefaultManager.SendMessage(nil, Msg);
end;

{ TRecognizerServiceMap }

procedure TRecognizerServiceMap.AddRecognizer(const ARec: TInteractiveGesture; const AForm: TCommonCustomForm);
var
  Handle: TAndroidWindowHandle;
begin
  Handle := TAndroidWindowHandle(AForm.Handle);
  if Handle <> nil then
    Handle.MotionManager.AddRecognizer(ARec, AForm);
end;

procedure TRecognizerServiceMap.RemoveRecognizer(const ARec: TInteractiveGesture; const AForm: TCommonCustomForm);
var
  Handle: TAndroidWindowHandle;
begin
  Handle := TAndroidWindowHandle(AForm.Handle);
  if Handle <> nil then
    Handle.MotionManager.AddRecognizer(ARec, AForm);
end;

{ TPlatformAndroid.TMessageQueueIdleHandler }

constructor TPlatformAndroid.TMessageQueueIdleHandler.Create(APlatform: TPlatformAndroid);
begin
  inherited Create;
  FPlatform := APlatform;
  FHandler := TJHandler.JavaClass.init(TJLooper.JavaClass.getMainLooper);
  FEmptyRunnable := TRunnable.Create(procedure begin end);
end;

function TPlatformAndroid.TMessageQueueIdleHandler.queueIdle: Boolean;
begin
  Result := True;

  if not FPlatform.Terminating and not FPlatform.ProcessOnIdleEvent then
    // Reschedule next OnIdle invocation, if user returns False in Done parameter of OnIdle
    // We put our empty message into application EventQueue. It boosts invoking queueIdle again.
    FHandler.post(FEmptyRunnable);
end;

{ TRunnable }

constructor TRunnable.Create(const ACallback: TProc);
begin
  inherited Create;
  FCallback := ACallback;
end;

procedure TRunnable.run;
begin
  FCallback;
end;

end.
