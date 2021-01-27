(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2013-09-19　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.2.3(10.2 Release 3)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)

{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2016-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Platform.Screen.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.TypInfo, System.Generics.Collections, Androidapi.JNI.Util, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Hardware, Androidapi.JNI.App, FMX.Platform, FMX.Types, FMX.Forms;

type

  /// <summary>Implementations of screen's services: <c>IFMXMultiDisplayService</c>, <c>IFMXScreenService</c>,
  ///  <c>IFMXDeviceMetricsService</c></summary>
  TAndroidScreenServices = class(TInterfacedObject, IFMXMultiDisplayService, IFMXScreenService,
    IFMXDeviceMetricsService, IFMXFullScreenWindowService)
  private type
    TDisplayAndroid = record
      Display: TDisplay;
      Id: Integer;
      constructor Create(const AIndex: Integer; const APrimary: Boolean; const ABounds, AWorkArea: TRect;
        const AId: Integer);
    end;
  private
    FScreenScale: Single;
    FScreenSize: TPointF;
    FDisplayManager: JDisplayManager;
    FWindowManager: JWindowManager;
    FDisplayCount: Integer;
    FSystemDisplayCount: Integer;
    FWorkAreaRect: TRect;
    FDesktopRect: TRect;
    FDisplayList: TList<TDisplayAndroid>;
    function GetDisplayInfo(const Display: JDisplay; var BoundsRect, WorkareaRect: TRect): Boolean;
    function FindDisplay(const Activity: JActivity): TDisplay;
  protected
    /// <summary>Registers screen's services in the platform</summary>
    procedure RegisterServices; virtual;
    /// <summary>Unregisters screen's services</summary>
    procedure UnregisterServices; virtual;
    procedure UpdateDisplays;
  public
    constructor Create;
    destructor Destroy; override;
    class function ScaleByMetrics(const Metrics: JDisplayMetrics): Single; static;
    class function OrientationByDisplay(const Display: JDisplay): TScreenOrientation; static;
    { IFMXMultiDisplayService }
    /// <summary>Refreshes current information about all displays in system</summary>
    procedure UpdateDisplayInformation;
    /// <summary>Returns count of displays in system</summary>
    function GetDisplayCount: Integer;
    /// <summary>Declares the method that tries to return a rectangle having the specified Size and positioned
    /// in the center of the virtual screen.</summary>
    function GetDesktopCenterRect(const Size: TSize): TRect;
    /// <summary>Returns region on main screen allocated for showing application</summary>
    function GetWorkAreaRect: TRect;
    /// <summary>Returns union of all displays</summary>
    function GetDesktopRect: TRect;
    /// <summary>Returns display information by specified display index</summary>
    function GetDisplay(const AIndex: Integer): TDisplay;
    /// <summary>Returns display, which is related with specified form <c>AHandle</c></summary>
    function DisplayFromWindow(const AHandle: TWindowHandle): TDisplay;
    /// <summary>Returns display, which is related with specified form <c>AHandle</c> and <c>APoint</c></summary>
    /// <remarks>Form can be placed on two displays at the same time (on a border of two displays), but not on iOS.
    /// So <c>APoint</c> parameter is not supported on iOS. It works like a <c>DisplayFromWindow</c></remarks>
    function DisplayFromPoint(const AHandle: TWindowHandle; const APoint: TPoint): TDisplay; inline;
    { IFMXScreenService }
    /// <summary>Returns logical size of main screen</summary>
    function GetScreenSize: TPointF;
    /// <summary>Returns scale of main screen</summary>
    function GetScreenScale: Single;
    /// <summary>Returns screen orientation</summary>
    function GetScreenOrientation: TScreenOrientation;
    /// <summary>Allows to set prefered screen orientation</summary>
    /// <remarks>Not needed for iOS</remarks>
    procedure SetScreenOrientation(AOrientations: TScreenOrientations);
    { IFMXDeviceMetricsService }
    /// <summary>Returns metrics of current display (physical and logical screen size, scale, aspect ration,
    /// DPI and etc)</summary>
    function GetDisplayMetrics: TDeviceDisplayMetrics;
    { IFMXFullScreenWindowService }
    procedure SetFullScreen(const AForm: TCommonCustomForm; const AValue: Boolean);
    function GetFullScreen(const AForm: TCommonCustomForm): Boolean;
    procedure SetShowFullScreenIcon(const AForm: TCommonCustomForm; const AValue: Boolean);
  public
    property DisplayManager: JDisplayManager read FDisplayManager;
    property WindowManager: JWindowManager read FWindowManager;
  end;

  TScreenScaleOverrideHook = procedure(const UserContext: Pointer; const DensityScale, DensityDPI: Single;
    var ScreenScale: Single);

procedure SetScreenScaleOverrideHook(const UserContext: Pointer; const Hook: TScreenScaleOverrideHook);
procedure UnsetScreenScaleOverrideHook;

implementation

uses
  System.Math, System.Math.Vectors, System.SysUtils, System.RTLConsts, Androidapi.Helpers, Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge, Androidapi.JNI, FMX.Platform.Android, FMX.Consts;

var
  ScreenScaleOverrideHook: TScreenScaleOverrideHook;
  ScreenScaleOverrideHookContext: Pointer;

procedure SetScreenScaleOverrideHook(const UserContext: Pointer; const Hook: TScreenScaleOverrideHook);
begin
  ScreenScaleOverrideHook := Hook;
  ScreenScaleOverrideHookContext := UserContext;
end;

procedure UnsetScreenScaleOverrideHook;
begin
  ScreenScaleOverrideHook := nil;
  ScreenScaleOverrideHookContext := nil;
end;

{ TAndroidScreenServices }

constructor TAndroidScreenServices.Create;
var
  ServiceClassName: string;
  WindowService, DisplayService: JObject;
begin
  inherited;
  if TOSVersion.Check(4, 2) then
    DisplayService := TAndroidHelper.Activity.getSystemService(TJContext.JavaClass.DISPLAY_SERVICE)
  else
    DisplayService := nil;
  if DisplayService <> nil then
  begin
    ServiceClassName := JStringToString(DisplayService.getClass.getName);
    if string.Compare(ServiceClassName, 'android.hardware.display.DisplayManager', True) = 0 then
    begin
      FDisplayManager := TJDisplayManager.Wrap(DisplayService);
      WindowService := TAndroidHelper.Activity.getSystemService(TJContext.JavaClass.WINDOW_SERVICE);
      if WindowService <> nil then
        FWindowManager := TJWindowManager.Wrap(WindowService);
      if FWindowManager = nil then
        raise EUnsupportedPlatformService.CreateFMT(SUnsupportedPlatformService, ['IFMXMultiDisplayService']);
    end;
  end;

  RegisterServices;
end;

destructor TAndroidScreenServices.Destroy;
begin
  UnregisterServices;
  inherited;
end;

function TAndroidScreenServices.DisplayFromPoint(const AHandle: TWindowHandle; const APoint: TPoint): TDisplay;
begin
  Result := DisplayFromWindow(AHandle);
end;

function TAndroidScreenServices.DisplayFromWindow(const AHandle: TWindowHandle): TDisplay;
begin
  Result := FindDisplay(TAndroidHelper.Activity);
end;

function TAndroidScreenServices.FindDisplay(const Activity: JActivity): TDisplay;

  function DoFind(const Id: Integer): Integer;
  var
    I: Integer;
  begin
    Result := -1;
    if FDisplayList <> nil then
      for I := 0 to FDisplayList.Count - 1 do
        if Id = FDisplayList[I].Id then
          Exit(I);
  end;

var
  Index, DisplayId: Integer;
begin
  if (Activity = nil) or (Activity.getWindowManager = nil) or (Activity.getWindowManager.getDefaultDisplay = nil) then
    raise EInvalidFmxHandle.Create(sArgumentInvalid);
  DisplayId := Activity.getWindowManager.getDefaultDisplay.getDisplayId;
  Index := DoFind(DisplayId);
  if Index = -1 then
  begin
    UpdateDisplays;
    Index := DoFind(DisplayId);
  end;
  if Index = -1 then
    raise EInvalidArgument.Create(sArgumentInvalid)
  else
    Result := FDisplayList[Index].Display;
end;

function TAndroidScreenServices.GetDesktopCenterRect(const Size: TSize): TRect;
var
  DesktopCenter: TPoint;
begin
  DesktopCenter := GetWorkAreaRect.CenterPoint;
  Result := TRect.Create(TPoint.Create(DesktopCenter.X - Size.cx div 2, DesktopCenter.Y - Size.cy div 2), Size.cx,
    Size.cy);
end;

function TAndroidScreenServices.GetDesktopRect: TRect;
var
  I: Integer;
begin
  if FDesktopRect.IsEmpty then
  begin
    FDesktopRect := TRect.Empty;
    for I := 0 to GetDisplayCount - 1 do
      FDesktopRect.Union(GetDisplay(I).BoundsRect);
  end;
  Result := FDesktopRect;
end;

function TAndroidScreenServices.GetDisplay(const AIndex: Integer): TDisplay;
begin
  if AIndex < 0 then
    raise EListError.CreateFmt(SListIndexError, [AIndex]);
  if (FDisplayList = nil) or (FSystemDisplayCount <> DisplayManager.getDisplays.Length) then
    UpdateDisplays;
  if AIndex >= GetDisplayCount then
    raise EListError.CreateFmt(SListIndexError, [AIndex]);
  Result := FDisplayList[AIndex].Display;
end;

function TAndroidScreenServices.GetDisplayCount: Integer;
begin
  if FDisplayCount = 0 then
    UpdateDisplays;
  Result := FDisplayCount;
end;

function TAndroidScreenServices.GetDisplayInfo(const Display: JDisplay; var BoundsRect, WorkareaRect: TRect): Boolean;
var
  LMetrics: JDisplayMetrics;
  Scale: Single;
  R: JRect;
  PW, PH: JPoint;
  W, H: Single;
  //Fix By Flying Wang.
  MaxW, MaxH: Single;
//  AFMXWindowService: IFMXWindowService;
  //indowRect: TRectF;
begin
  if Display = nil then
    raise EArgumentNilException.Create(SArgumentNil);
  Result := False;
  R := TJRect.Create;
  PW := TJPoint.Create;
  PH := TJPoint.Create;
  LMetrics := TJDisplayMetrics.Create;
  Display.getMetrics(LMetrics);
  Scale := ScaleByMetrics(LMetrics);
  if Scale > 0 then
  begin
    Display.getRectSize(R);
    if (R.width > 0) and (R.height > 0) then
    begin
      BoundsRect := TRect.Create(Trunc(R.left / Scale), Trunc(R.top / Scale), Trunc(R.right / Scale),
        Trunc(R.bottom / Scale));
      Result := True;
      Display.getCurrentSizeRange(PW, PH);
      if OrientationByDisplay(Display) in [TScreenOrientation.Portrait, TScreenOrientation.InvertedPortrait] then
      begin
        W := PW.x;
        H := PH.y;
        MaxW := PW.x;
        MaxH := PH.x;
      end
      else
      begin
        W := PH.x;
        H := PW.y;
        MaxW := PH.x;
        MaxH := PW.x;
      end;
      WorkareaRect := TRect.Create(TPoint.Create(Round((R.right - W) / Scale),
        Round((R.bottom - H) / Scale)), Trunc(W / Scale), Trunc(H / Scale));
      //Fix By Flying Wang.
      //fix for Redmi Note 5 失败
      // NDK R.bottom 的位置，无法修改。 top 其实是 根据 bottom 反推的。
      //test by [青岛]东南(40847505)
//      if (MaxH > R.height) or (MaxW > R.width) then
//      begin
//        BoundsRect := TRect.Create(Trunc(R.left / Scale), Trunc(R.top / Scale), Trunc(MaxW / Scale),
//          Trunc(MaxH / Scale));
//        WorkareaRect := TRect.Create(TPoint.Create(Round((MaxW - W) / Scale),
//          Round((MaxH - H) / Scale)), Trunc(W / Scale), Trunc(H / Scale));
//      end;
    end;
//    //Fix By Flying Wang.
//    AFMXWindowService := IFMXWindowService(TPlatformServices.Current.GetPlatformService(IFMXWindowService));
//    if AFMXWindowService <> nil then
//    begin
//      AWindowRect := AFMXWindowService.GetWindowRect(nil);
//      if WorkareaRect.Top < AWindowRect.Top then
//        WorkareaRect.Top := Round(AWindowRect.Top);
//      if WorkareaRect.Left < AWindowRect.Left then
//        WorkareaRect.Left := Round(AWindowRect.Left);
//      if WorkareaRect.Right > AWindowRect.Right then
//        WorkareaRect.Right := Round(AWindowRect.Right);
//      if WorkareaRect.Bottom > AWindowRect.Bottom then
//        WorkareaRect.Bottom := Round(AWindowRect.Bottom);
//      if BoundsRect.Top < AWindowRect.Top then
//        BoundsRect.Top := Round(AWindowRect.Top);
//      if BoundsRect.Left < AWindowRect.Left then
//        BoundsRect.Left := Round(AWindowRect.Left);
//      if BoundsRect.Right > AWindowRect.Right then
//        BoundsRect.Right := Round(AWindowRect.Right);
//      if BoundsRect.Bottom > AWindowRect.Bottom then
//        BoundsRect.Bottom := Round(AWindowRect.Bottom);
//    end;
  end;
end;

function TAndroidScreenServices.GetDisplayMetrics: TDeviceDisplayMetrics;
var
  Metrics: JDisplayMetrics;
  RawScreenSize: JPoint;
  DensityDPI: Single;
begin
  Metrics := TAndroidHelper.DisplayMetrics;
  if Metrics <> nil then
  begin
    Result.PhysicalScreenSize := TSize.Create(Metrics.widthPixels, Metrics.heightPixels);
    DensityDPI := Round((Metrics.xdpi + Metrics.ydpi) / 2);
    if DensityDPI <> 0 then
    begin
      Result.LogicalScreenSize.cx := Trunc(Metrics.widthPixels / DensityDPI);
      Result.LogicalScreenSize.cy := Trunc(Metrics.heightPixels / DensityDPI);
    end
    else
      Result.LogicalScreenSize := Result.PhysicalScreenSize;
    if Metrics.widthPixels <> 0 then
      Result.AspectRatio := Metrics.heightPixels / Metrics.widthPixels
    else
      Result.AspectRatio := 1;
    Result.PixelsPerInch := Round(DensityDPI);
    Result.ScreenScale := Metrics.density;
    Result.FontScale := Metrics.scaledDensity;
  end
  else
    Result := TDeviceDisplayMetrics.Default;
  RawScreenSize := MainActivity.getRawDisplaySize;
  if RawScreenSize <> nil then
    if (Result.PhysicalScreenSize.cx > Result.PhysicalScreenSize.cy) and (RawScreenSize.x > RawScreenSize.y) then
      Result.RawScreenSize := TSize.Create(RawScreenSize.x, RawScreenSize.y)
    else
      Result.RawScreenSize := TSize.Create(RawScreenSize.y, RawScreenSize.x)
  else
    Result.RawScreenSize := Result.PhysicalScreenSize;
end;

function TAndroidScreenServices.GetFullScreen(const AForm: TCommonCustomForm): Boolean;
begin
  Result := not MainActivity.getSystemUIVisibility;
end;

function TAndroidScreenServices.GetScreenOrientation: TScreenOrientation;
begin
  Result := OrientationByDisplay(TAndroidHelper.Display);
end;

function TAndroidScreenServices.GetScreenScale: Single;
var
  Metrics: JDisplayMetrics;
begin
  if SameValue(FScreenScale, 0, TEpsilon.Scale) then
  begin
    Metrics := TAndroidHelper.DisplayMetrics;
    FScreenScale := ScaleByMetrics(Metrics);
  end;
  Result := FScreenScale;
end;

function TAndroidScreenServices.GetScreenSize: TPointF;
var
  Metrics: JDisplayMetrics;
begin
  Metrics := TAndroidHelper.DisplayMetrics;
  if Metrics <> nil then
    FScreenSize := TPointF.Create(Trunc(Metrics.widthPixels / GetScreenScale), Trunc(Metrics.heightPixels / GetScreenScale))
  else
    FScreenSize := TPointF.Zero;
  Result := FScreenSize;
end;

function TAndroidScreenServices.GetWorkAreaRect: TRect;
var
  TmpRect: TRect;
begin
  if FWorkAreaRect.IsEmpty then
    GetDisplayInfo(WindowManager.getDefaultDisplay, TmpRect, FWorkAreaRect);
  Result := FWorkAreaRect;
end;

class function TAndroidScreenServices.OrientationByDisplay(const Display: JDisplay): TScreenOrientation;

  function IsLandscapeDevice(const Rotation: Integer): Boolean;
  var
    Resources: JResources;
    Configuration: JConfiguration;
    Straight: Boolean;
  begin
    Straight := (Rotation = TJSurface.JavaClass.ROTATION_0) or (Rotation = TJSurface.JavaClass.ROTATION_180);
    if TAndroidHelper.Context <> nil then
    begin
      Resources := TAndroidHelper.Context.getResources;
      if Resources <> nil then
      begin
        Configuration := Resources.getConfiguration;
        if Configuration <> nil then
          Exit(((Configuration.orientation = TJConfiguration.JavaClass.ORIENTATION_LANDSCAPE) and Straight) or
            ((Configuration.orientation = TJConfiguration.JavaClass.ORIENTATION_PORTRAIT) and not Straight));
      end;
    end;
    Result := ((Screen.Width > Screen.Height) and Straight) or ((Screen.Width < Screen.Height) and not Straight);
  end;

var
  Rotation: Integer;
begin
  if Display <> nil then
  begin
    Rotation := Display.getRotation;
    if IsLandscapeDevice(Rotation) then
    begin // landscape device
      if Rotation = TJSurface.JavaClass.ROTATION_180 then
        Result := TScreenOrientation.InvertedLandscape
      else if Rotation = TJSurface.JavaClass.ROTATION_90 then
        Result := TScreenOrientation.InvertedPortrait
      else if Rotation = TJSurface.JavaClass.ROTATION_270 then
        Result := TScreenOrientation.Portrait
      else
        Result := TScreenOrientation.Landscape;
    end
    else
    begin // portrait device
      if Rotation = TJSurface.JavaClass.ROTATION_180 then
        Result := TScreenOrientation.InvertedPortrait
      else if Rotation = TJSurface.JavaClass.ROTATION_90 then
        Result := TScreenOrientation.Landscape
      else if Rotation = TJSurface.JavaClass.ROTATION_270 then
        Result := TScreenOrientation.InvertedLandscape
      else
        Result := TScreenOrientation.Portrait;
    end;
  end
  else
    Result := TScreenOrientation.Portrait;
end;

procedure TAndroidScreenServices.RegisterServices;
begin
  if TOSVersion.Check(4, 2) and not TPlatformServices.Current.SupportsPlatformService(IFMXMultiDisplayService) then
    TPlatformServices.Current.AddPlatformService(IFMXMultiDisplayService, Self);
  if not TPlatformServices.Current.SupportsPlatformService(IFMXScreenService) then
    TPlatformServices.Current.AddPlatformService(IFMXScreenService, Self);
  if not TPlatformServices.Current.SupportsPlatformService(IFMXDeviceMetricsService) then
    TPlatformServices.Current.AddPlatformService(IFMXDeviceMetricsService, Self);
  if not TPlatformServices.Current.SupportsPlatformService(IFMXFullScreenWindowService) then
    TPlatformServices.Current.AddPlatformService(IFMXFullScreenWindowService, Self);
end;

class function TAndroidScreenServices.ScaleByMetrics(const Metrics: JDisplayMetrics): Single;
const
// Default values taken from Android SDK reference:
// http://developer.android.com/reference/android/util/DisplayMetrics.html#density
  DefaultDensityScale = 1;
  DefaultDensityDPI = 160;
var
  DensityScale, DensityDPI: Single;
begin
  if Metrics <> nil then
  begin
    DensityScale := Metrics.density; // API level 1
    DensityDPI := Metrics.densityDpi; // API level 4
  end
  else
  begin
    DensityScale := DefaultDensityScale;
    DensityDPI := DefaultDensityDPI;
  end;

  // Some devices (for example: ZTE Nubia Z9 MAX) can return 0.01 value.
  if DensityScale <= 0.01 then
    if Metrics.widthPixels > Metrics.heightPixels then
      DensityScale := RoundTo(Metrics.widthPixels / Screen.Width, -2)
    else
      DensityScale := RoundTo(Metrics.heightPixels / Screen.Height, -2);
  if DensityScale <= 0.01 then
    DensityScale := 1;    

  Result := DensityScale;

  if Assigned(ScreenScaleOverrideHook) then
  begin
    ScreenScaleOverrideHook(ScreenScaleOverrideHookContext, DensityScale, DensityDPI, Result);
    Result := EnsureRange(Result, 1, 3);
  end;
end;

procedure TAndroidScreenServices.SetFullScreen(const AForm: TCommonCustomForm; const AValue: Boolean);
begin
  MainActivity.setSystemUIVisibility(not AValue);
end;

procedure TAndroidScreenServices.SetScreenOrientation(AOrientations: TScreenOrientations);
begin
  if (TScreenOrientation.Portrait in AOrientations) and
     (TScreenOrientation.Landscape in AOrientations) and
     (TScreenOrientation.InvertedPortrait in AOrientations) and
     (TScreenOrientation.InvertedLandscape in AOrientations) then
    MainActivity.embSetOrientation(-1)
  else if TScreenOrientation.Portrait in AOrientations then
    MainActivity.embSetOrientation(Integer(TScreenOrientation.Portrait))
  else if TScreenOrientation.Landscape in AOrientations then
    MainActivity.embSetOrientation(Integer(TScreenOrientation.Landscape))
  else if TScreenOrientation.InvertedPortrait in AOrientations then
    MainActivity.embSetOrientation(Integer(TScreenOrientation.InvertedPortrait))
  else if TScreenOrientation.InvertedLandscape in AOrientations then
    MainActivity.embSetOrientation(Integer(TScreenOrientation.InvertedLandscape));
end;

procedure TAndroidScreenServices.SetShowFullScreenIcon(const AForm: TCommonCustomForm; const AValue: Boolean);
begin

end;

procedure TAndroidScreenServices.UnregisterServices;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXMultiDisplayService);
  TPlatformServices.Current.RemovePlatformService(IFMXScreenService);
  TPlatformServices.Current.RemovePlatformService(IFMXDeviceMetricsService);
  TPlatformServices.Current.RemovePlatformService(IFMXFullScreenWindowService);
end;

procedure TAndroidScreenServices.UpdateDisplayInformation;
begin
  FDisplayCount := 0;
  FSystemDisplayCount := 0;
  FDesktopRect := TRect.Empty;
  FWorkAreaRect := TRect.Empty;
  FreeAndNil(FDisplayList);
end;

procedure TAndroidScreenServices.UpdateDisplays;
type
  TTmpDisplay = record
    Default: Boolean;
    BoundsRect, WorkareaRect: TRect;
    Id: Integer;
  end;
var
  I, DefaultId: Integer;
  Display: JDisplay;
  DefaultExists: Boolean;
  TmpDisplay: TTmpDisplay;
  TmpDisplays: TList<TTmpDisplay>;
begin
  UpdateDisplayInformation;
  if DisplayManager <> nil then
  begin
    FSystemDisplayCount := DisplayManager.getDisplays.Length;
    DefaultId := FWindowManager.getDefaultDisplay.getDisplayId;
    if FDisplayList = nil then
      FDisplayList := TList<TDisplayAndroid>.Create
    else
      FDisplayList.Clear;

    TmpDisplays := TList<TTmpDisplay>.Create;
    try
      DefaultExists := False;
      for I := 0 to FSystemDisplayCount - 1 do
      begin
        Display := DisplayManager.getDisplays[I];
        // We use only displays with the correct information
        if GetDisplayInfo(Display, TmpDisplay.BoundsRect, TmpDisplay.WorkareaRect) then
        begin
          if Display.getDisplayId = DefaultId then
            DefaultExists := True;
          TmpDisplay.Default := Display.getDisplayId = DefaultId;
          TmpDisplay.Id := Display.getDisplayId;
          TmpDisplays.Add(TmpDisplay);
        end;
      end;
      FDisplayCount := TmpDisplays.Count;
      // If there is no primary display use the first on the list
      if (FDisplayCount > 0) and not DefaultExists then
      begin
        TmpDisplay := TmpDisplays[0];
        TmpDisplay.Default := True;
        TmpDisplays[0] := TmpDisplay;
      end;
      for I := 0 to FDisplayCount - 1 do
        FDisplayList.Add(TDisplayAndroid.Create(I, TmpDisplays[I].Default, TmpDisplays[I].BoundsRect,
          TmpDisplays[I].WorkareaRect, TmpDisplays[I].Id));
    finally
      TmpDisplays.Free;
    end;
  end;
end;

{ TAndroidScreenServices.TDisplayAndroid }

constructor TAndroidScreenServices.TDisplayAndroid.Create(const AIndex: Integer; const APrimary: Boolean; const ABounds,
  AWorkArea: TRect; const AId: Integer);
begin
  Display := TDisplay.Create(AIndex, APrimary, ABounds, AWorkArea);
  Id := AId;
end;

end.
