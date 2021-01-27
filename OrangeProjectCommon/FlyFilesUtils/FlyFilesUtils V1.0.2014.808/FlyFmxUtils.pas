unit FlyFmxUtils;

(* ************************************************ *)
(*��������������������������������������������������*)
(*������ƣ�������ͷ�� & Flying Wang 2013-11-30���� *)
(*����������������İ�Ȩ�����벻Ҫ�Ƴ���������������*)
(*������������Ver 1.0.2014.1125  ��������������������*)
(*��������������������������������������������������*)
(* ************************************************ *)

interface

uses
  System.Types,
  FMX.Forms,
  FMX.Types;


/// <summary>
///   ��ȡ��Ļ���ظ߿�
/// </summary>
/// <param name="Context">
///   ���鴫����
/// </param>
function GetScreenPixelsXY(const Context: TFmxObject = nil): TPoint;

/// <summary>
///   ��ȡ��Ļ�����������ظ߿�
/// </summary>
/// <param name="Context">
///   ���鴫����
/// </param>
function GetScreenClientPixelsXY(const Context: TFmxObject = nil): TPoint;

/// <summary>
///   ��ȡ��ĻӢ��߿�
/// </summary>
/// <param name="Context">
///   ���鴫����
/// </param>
function GetScreenInchXY(const Context: TFmxObject = nil): TPointF;

/// <summary>
///   ��ȡ��Ļ�߿�� DPI �� PPI��Ҳ���������ܶȡ�
/// </summary>
/// <param name="Context">
///   ���鴫����
/// </param>
function GetScreenDPIXY(const Context: TFmxObject = nil): TPointF;

/// <summary>
///   ��ȡ��Ļ�� DPI �� PPI��Ҳ���������ܶȡ�
/// </summary>
/// <param name="Context">
///   ���鴫����
/// </param>
function GetScreenDPI(const Context: TFmxObject = nil): Single;

/// <summary>
///   ��ȡ��Ļ�Խ���Ӣ��
/// </summary>
/// <param name="Context">
///   ���鴫����
/// </param>
function GetScreenInches(const Context: TFmxObject = nil): Single;

/// <summary>
///   ��ȡ����ĸ߿�(�������أ�����Ӣ�磬�� FMX ����)��
/// </summary>
function GetFormXY(const AForm: TCustomForm): TPointF;

/// <summary>
///   ��ȡ����Ŀ��ø߿�(�������أ�����Ӣ�磬�� FMX ����)��
/// </summary>
function GetFormClientXY(const AForm: TCustomForm): TPointF;

/// <summary>
///   ��ȡ����Ŀ�����ʾ����(�������أ�����Ӣ�磬�� FMX ����)��
/// </summary>
function GetFormClient(const AForm: TCustomForm): TRectF;

/// <summary>
///   ��ȡ��������ظ߿�
/// </summary>
function GetFormPixelsXY(const AForm: TCustomForm): TPointF;

/// <summary>
///   ��ȡ����Ŀ������ظ߿�
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
    Result := dm.densityDpi; //���ֵ�� xdpi ydip ��Ȼ��һ�����ɶ�Ĺȸ�����ǿɶ��Ӳ�����ҡ�
    exit;
  end;
{$ENDIF}
  if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior,
    DeviceBehavior, Context) then
  begin
    DisplayMetrics := DeviceBehavior.GetDisplayMetrics(Context);
    Result := DisplayMetrics.PixelsPerInch; //XE8 ȡ���� xdpi ydpi �ľ�ֵ��
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
