unit FlyFmxUtils;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2013-11-30　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　Ver 1.0.2014.1125  　　　　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

uses
  System.Types,
  FMX.Forms,
  FMX.Types;


/// <summary>
///   获取屏幕像素高宽
/// </summary>
/// <param name="Context">
///   建议传窗体
/// </param>
function GetScreenPixelsXY(const Context: TFmxObject = nil): TPoint;

/// <summary>
///   获取屏幕可用区域像素高宽
/// </summary>
/// <param name="Context">
///   建议传窗体
/// </param>
function GetScreenClientPixelsXY(const Context: TFmxObject = nil): TPoint;

/// <summary>
///   获取屏幕英寸高宽
/// </summary>
/// <param name="Context">
///   建议传窗体
/// </param>
function GetScreenInchXY(const Context: TFmxObject = nil): TPointF;

/// <summary>
///   获取屏幕高宽的 DPI 或 PPI，也就是像素密度。
/// </summary>
/// <param name="Context">
///   建议传窗体
/// </param>
function GetScreenDPIXY(const Context: TFmxObject = nil): TPointF;

/// <summary>
///   获取屏幕的 DPI 或 PPI，也就是像素密度。
/// </summary>
/// <param name="Context">
///   建议传窗体
/// </param>
function GetScreenDPI(const Context: TFmxObject = nil): Single;

/// <summary>
///   获取屏幕对角线英寸
/// </summary>
/// <param name="Context">
///   建议传窗体
/// </param>
function GetScreenInches(const Context: TFmxObject = nil): Single;

/// <summary>
///   获取窗体的高宽(不是像素，不是英寸，是 FMX 坐标)。
/// </summary>
function GetFormXY(const AForm: TCustomForm): TPointF;

/// <summary>
///   获取窗体的可用高宽(不是像素，不是英寸，是 FMX 坐标)。
/// </summary>
function GetFormClientXY(const AForm: TCustomForm): TPointF;

/// <summary>
///   获取窗体的可用显示区域(不是像素，不是英寸，是 FMX 坐标)。
/// </summary>
function GetFormClient(const AForm: TCustomForm): TRectF;

/// <summary>
///   获取窗体的像素高宽。
/// </summary>
function GetFormPixelsXY(const AForm: TCustomForm): TPointF;

/// <summary>
///   获取窗体的可用像素高宽。
/// </summary>
function GetFormClientPixelsXY(const AForm: TCustomForm): TPointF;

implementation

uses
{$IFDEF ANDROID}
{$IF CompilerVersion >= 27.0} // >= XE6
  Androidapi.Helpers,
{$ENDIF}
{$IF CompilerVersion < 28.0} // < XE7
  FMX.Helpers.Android,
{$ENDIF}
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Util,
{$ENDIF}
//  FMX.Dialogs,
  FMX.Controls,
  FMX.Platform,
  FMX.BehaviorManager,
  System.Math;

function GetFormPixelsXY(const AForm: TCustomForm): TPointF;
begin
  Result.X := 0;
  Result.Y := 0;
  if AForm = nil then exit;
  Result.X := AForm.Width * IScene(AForm).GetSceneScale;
  Result.Y :=AForm.Height * IScene(AForm).GetSceneScale;
end;

function GetFormClientPixelsXY(const AForm: TCustomForm): TPointF;
begin
  Result.X := 0;
  Result.Y := 0;
  if AForm = nil then exit;
  Result.X := AForm.ClientWidth * IScene(AForm).GetSceneScale;
  Result.Y :=AForm.ClientHeight * IScene(AForm).GetSceneScale;
end;

function GetFormClient(const AForm: TCustomForm): TRectF;
begin
  Result := TRectF.Empty;
  if AForm = nil then exit;
  Result := AForm.ClientRect;
end;

function GetFormClientXY(const AForm: TCustomForm): TPointF;
begin
  Result.X := 0;
  Result.Y := 0;
  if AForm = nil then exit;
  Result.X := AForm.ClientWidth;
  Result.Y :=AForm.ClientHeight;
end;

function GetFormXY(const AForm: TCustomForm): TPointF;
begin
  Result.X := 0;
  Result.Y := 0;
  if AForm = nil then exit;
  Result.X := AForm.Width;
  Result.Y :=AForm.Height;
end;

function GetScreenInches(const Context: TFmxObject = nil): Single;
var
  ScreenPixelsXY: TPointF;
  ScreenDPI: Real;
//  x,y: Double;
begin
  ScreenPixelsXY := GetScreenPixelsXY(Context);
  ScreenDPI := GetScreenDPI(Context);
//  x := System.Math.Power(ScreenPixelsXY.X / ScreenDPIXY.X, 2);
//  y := System.Math.Power(ScreenPixelsXY.Y / ScreenDPIXY.Y, 2);
//  Result := Sqrt(x + y);
  Result := Sqrt(ScreenPixelsXY.X *
    ScreenPixelsXY.X / ScreenDPI / ScreenDPI +
    ScreenPixelsXY.Y * ScreenPixelsXY.Y / ScreenDPI / ScreenDPI);
end;

function GetScreenDPI(const Context: TFmxObject = nil): Single;
var
  DeviceBehavior: IDeviceBehavior;
  DisplayMetrics: TDeviceDisplayMetrics;
  ScreenService: IFMXScreenService;
{$IFDEF ANDROID}
  dm: JDisplayMetrics;
{$ENDIF}
begin
  Result := 0;
{$IFDEF ANDROID}
  dm := GetJDisplayMetrics;
  if dm <> nil then
  begin
    Result := dm.densityDpi; //这个值和 xdpi ydip 居然不一样。可恶的谷歌或者是可恶的硬件厂家。
    exit;
  end;
{$ENDIF}
  if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior,
    DeviceBehavior, Context) then
  begin
    DisplayMetrics := DeviceBehavior.GetDisplayMetrics(Context);
    Result := DisplayMetrics.PixelsPerInch; //XE8 取得是 xdpi ydpi 的均值。
  end;
end;

function GetScreenDPIXY(const Context: TFmxObject = nil): TPointF;
var
  DeviceBehavior: IDeviceBehavior;
  DisplayMetrics: TDeviceDisplayMetrics;
  ScreenService: IFMXScreenService;
  AIScene : IScene;
{$IFDEF ANDROID}
  dm: JDisplayMetrics;
{$ENDIF}
begin
  Result.X := 0;
  Result.Y := 0;
{$IFDEF ANDROID}
  if SameValue(Result.X, 0) and SameValue(Result.Y, 0) then
  begin
    dm := GetJDisplayMetrics;
    if dm <> nil then
    begin
      Result.X := dm.xdpi;
      Result.Y := dm.ydpi;
    end;
  end;
{$ENDIF}
  if SameValue(Result.X, 0) and SameValue(Result.Y, 0) then
  begin
    if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior,
      DeviceBehavior, Context) then
    begin
      DisplayMetrics := DeviceBehavior.GetDisplayMetrics(Context);
      Result.X := DisplayMetrics.PixelsPerInch;
      Result.Y := DisplayMetrics.PixelsPerInch;
    end;
  end;
end;

function GetScreenInchXY(const Context: TFmxObject = nil): TPointF;
var
  DeviceBehavior: IDeviceBehavior;
  DisplayMetrics: TDeviceDisplayMetrics;
  ScreenService: IFMXScreenService;
  AIScene : IScene;
  PixelsXY: TPointF;
{$IFDEF ANDROID}
  PWReal: JPoint;
  dm: JDisplayMetrics;
{$ENDIF}
begin
  Result.X := 0;
  Result.Y := 0;
  PixelsXY.X := 0;
  PixelsXY.Y := 0;
{$IFDEF ANDROID}
  if SameValue(PixelsXY.X, 0) and SameValue(PixelsXY.Y, 0) then
  begin
    try
      PWReal := TJPoint.JavaClass.init;
      SharedActivity.getWindowManager.getDefaultDisplay.getRealSize(PWReal);
      PixelsXY.X := PWReal.x;
      PixelsXY.Y := PWReal.y;
    except
    end;
  end;
{$ENDIF}
  if SameValue(PixelsXY.X, 0) and SameValue(PixelsXY.Y, 0) then
  begin
    if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior,
      DeviceBehavior, Context) then
    begin
      DisplayMetrics := DeviceBehavior.GetDisplayMetrics(Context);
      PixelsXY.X := DisplayMetrics.PhysicalScreenSize.cx;
      PixelsXY.Y := DisplayMetrics.PhysicalScreenSize.cy;
    end
    else if (TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
      IInterface(ScreenService))) and (Context.GetInterface(IScene, AIScene)) then
    begin
      PixelsXY := ScreenService.GetScreenSize;
      PixelsXY.X := Round(AIScene.GetSceneScale * PixelsXY.X);
      PixelsXY.Y := Round(AIScene.GetSceneScale * PixelsXY.Y);
    end
    else if (TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
      IInterface(ScreenService))) and (Context is TControl) and
      (TControl(Context).Scene <> nil) then
    begin
      PixelsXY := ScreenService.GetScreenSize;
      PixelsXY.X := Round(TControl(Context).Scene.GetSceneScale * PixelsXY.X);
      PixelsXY.Y := Round(TControl(Context).Scene.GetSceneScale * PixelsXY.Y);
    end;
  end;
  if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior,
      DeviceBehavior, Context) then
  begin
    DisplayMetrics := DeviceBehavior.GetDisplayMetrics(Context);
    Result.X := PixelsXY.X / DisplayMetrics.PixelsPerInch;
    Result.Y := PixelsXY.Y / DisplayMetrics.PixelsPerInch;
  end;
end;

function GetScreenClientPixelsXY(const Context: TFmxObject = nil): TPoint;
var
  DeviceBehavior: IDeviceBehavior;
  DisplayMetrics: TDeviceDisplayMetrics;
  ScreenService: IFMXScreenService;
  ScreenSize: TPointF;
  AIScene : IScene;
begin
  Result.X := 0;
  Result.Y := 0;
  if (Context <> nil) and TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior,
    DeviceBehavior, Context) then
  begin
    DisplayMetrics := DeviceBehavior.GetDisplayMetrics(Context);
    Result.X := DisplayMetrics.PhysicalScreenSize.cx;
    Result.Y := DisplayMetrics.PhysicalScreenSize.cy;
  end
  else if (TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
    IInterface(ScreenService))) then
  begin
    ScreenSize := ScreenService.GetScreenSize;
    Result.X := Round(ScreenService.GetScreenScale * ScreenSize.X);
    Result.Y := Round(ScreenService.GetScreenScale * ScreenSize.Y);
  end;
end;

function GetScreenPixelsXY(const Context: TFmxObject = nil): TPoint;
var
  DeviceBehavior: IDeviceBehavior;
  DisplayMetrics: TDeviceDisplayMetrics;
  ScreenService: IFMXScreenService;
  ScreenSize: TPointF;
  AIScene : IScene;
{$IFDEF ANDROID}
  PWReal: JPoint;
  dm: JDisplayMetrics;
{$ENDIF}
begin
  Result.X := 0;
  Result.Y := 0;
{$IFDEF ANDROID}
  if SameValue(Result.X, 0) and SameValue(Result.Y, 0) then
  begin
    try
      PWReal := TJPoint.JavaClass.init;
      SharedActivity.getWindowManager.getDefaultDisplay.getRealSize(PWReal);
      Result.X := PWReal.x;
      Result.Y := PWReal.y;
    except
    end;
  end;
{$ENDIF}
  if SameValue(Result.X, 0) and SameValue(Result.Y, 0) then
  begin
    if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior,
      DeviceBehavior, Context) then
    begin
      DisplayMetrics := DeviceBehavior.GetDisplayMetrics(Context);
      Result.X := DisplayMetrics.PhysicalScreenSize.cx;
      Result.Y := DisplayMetrics.PhysicalScreenSize.cy;
    end
    else if (TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
      IInterface(ScreenService))) then
    begin
      ScreenSize := ScreenService.GetScreenSize;
      Result.X := Round(ScreenService.GetScreenScale * ScreenSize.X);
      Result.Y := Round(ScreenService.GetScreenScale * ScreenSize.Y);
    end;
  end;
{$IFDEF ANDROID}
  if SameValue(Result.X, 0) and SameValue(Result.Y, 0) then
  begin
    dm := GetJDisplayMetrics;
    if dm = nil then exit;
    Result.X := Round(dm.widthPixels * dm.density);
    Result.Y := Round(dm.heightPixels * dm.density);
  end;
{$ENDIF}
end;

end.
