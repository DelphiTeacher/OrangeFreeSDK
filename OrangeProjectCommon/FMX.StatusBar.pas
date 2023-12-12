unit FMX.StatusBar;

{
  author : ZuBy
  rzaripov1990@gmail.com

  2016
}

interface

uses
  System.UITypes, FMX.Platform
{$IFDEF ANDROID} ,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNIBridge, Androidapi.Helpers,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.App, Androidapi.JNI.Util, FMX.Platform.Android, FMX.Helpers.Android
{$ELSEIF defined(IOS)}
    , FMX.Helpers.iOS, FMX.Platform.iOS, iOSapi.UIKit, iOSapi.Foundation, iOSapi.CoreGraphics, iOSapi.CoreImage
{$ENDIF};

{$IFDEF ANDROID}

type
  JWindowManager_LayoutParamsClassExt = interface(JWindowManager_LayoutParamsClass)
    ['{48861EC2-BC53-440A-B1B8-76FF4DF36F97}']
    { class } function _GetFLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS: Integer; cdecl;
    { class } property FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS: Integer read _GetFLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS;
  end;

  TJWindowManager_LayoutParamsExt = class(TJavaGenericImport<JWindowManager_LayoutParamsClassExt,
    JWindowManager_LayoutParams>)
  end;

  [JavaSignature('android/view/Window')]
  JWindowExt = interface(JWindow)
    ['{2810B178-9634-453D-8963-19CE145E6669}']
    procedure setStatusBarColor(color: Integer); cdecl;
    procedure setNavigationBarColor(color: Integer); cdecl;
    function getStatusBarColor: Integer; cdecl;
  end;

  TJWindowExt = class(TJavaGenericImport<JWindowClass, JWindowExt>)
  end;

function GetWindowExt: JWindowExt;
{$ENDIF}
function Darker(color: TAlphaColor; Percent: Byte): TAlphaColor;

procedure StatusBarGetBounds(out StatusBar, NavigationBar: Integer);
procedure StatusBarSetColor(const aColor: TAlphaColor);overload;
procedure StatusBarSetColor(const aColor: integer);overload;
procedure NavigationBarSetColor(color: TAlphaColor);
Function  StatusBarColor:integer;

procedure StatusBarLight(Value: Boolean);
procedure StatusBarTransparent(value:Boolean);

implementation

uses
  System.SysUtils;

function MulDiv(nNumber, nNumerator, nDenominator: Integer): Integer;

  function MathRound(AValue: Extended): Int64; inline;
  begin
    if AValue >= 0 then
      Result := Trunc(AValue + 0.5)
    else
      Result := Trunc(AValue - 0.5);
  end;

begin
  if nDenominator = 0 then
    Result := -1
  else
    Result := MathRound(Int64(nNumber) * Int64(nNumerator) / nDenominator);
end;

function Darker(color: TAlphaColor; Percent: Byte): TAlphaColor;
var
  r, g, b: Byte;
begin
  r := TAlphaColorRec(color).r;
  g := TAlphaColorRec(color).g;
  b := TAlphaColorRec(color).b;
  r := r - MulDiv(r, Percent, 100);
  g := g - MulDiv(g, Percent, 100);
  b := b - MulDiv(b, Percent, 100);
  Result := TAlphaColorF.Create(r / 255, g / 255, b / 255, 1).ToAlphaColor;
end;

function Lighter(color: TAlphaColor; Percent: Byte): TAlphaColor;
var
  r, g, b: Byte;
begin
  r := TAlphaColorRec(color).r;
  g := TAlphaColorRec(color).g;
  b := TAlphaColorRec(color).b;
  r := r + MulDiv(255 - r, Percent, 100);
  g := g + MulDiv(255 - g, Percent, 100);
  b := b + MulDiv(255 - b, Percent, 100);
  Result := TAlphaColorF.Create(r / 255, g / 255, b / 255, 1).ToAlphaColor;
end;

{$IFDEF ANDROID}

function GetWindowExt: JWindowExt;
begin
  Result := TJWindowExt.Wrap((MainActivity.getWindow as ILocalObject).GetObjectID);
end;
{$ENDIF}

function hasNavbar(out navBarHeight: Integer): boolean;
// uses Androidapi.JNI.Util,
{$IFDEF ANDROID}
var
  Window: JWindowExt;
  realSize: JPoint;
  screenSize: JPoint;
  metrics: JDisplayMetrics;
  difference, resourceID: Integer;
{$ENDIF}
begin
  Result := false;
  navBarHeight := 0;
{$IFDEF ANDROID}
  metrics := TJDisplayMetrics.Create;
  realSize := TJPoint.Create;
  screenSize := TJPoint.Create;

  Window := GetWindowExt;
  Window.getWindowManager.getDefaultDisplay.getRealMetrics(metrics);
  realSize.x := metrics.widthPixels;
  realSize.y := metrics.heightPixels;

  Window.getWindowManager.getDefaultDisplay.getSize(screenSize);
  if realSize.x <> screenSize.y then
  begin
    difference := realSize.y - screenSize.y;
    resourceID := TAndroidHelper.Activity.getResources.getIdentifier(StringToJString('navigation_bar_height'),
      StringToJString('dimen'), StringToJString('android'));
    if resourceID > 0 then
      navBarHeight := Trunc(TAndroidHelper.Activity.getResources.getDimensionPixelSize(resourceID));

    if navBarHeight > 0 then
      Result := difference = navBarHeight;
  end;
{$ENDIF}
end;

procedure StatusBarGetBounds(out StatusBar, NavigationBar: Integer);
{$IFDEF ANDROID}
var
  // KeyCharacterMap: JKeyCharacterMap;
  resourceID: Integer;
  ScreenService: IFMXScreenService;
  sScale: Single;
{$ENDIF}
begin
  NavigationBar := 0;
  StatusBar := 0;
{$IFDEF ANDROID}
  if TOSVersion.Check(5, 0) then // врод?только работает ?5.0 ниже не?устройства проверит?
  begin
    sScale := 1;
    if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
      sScale := ScreenService.GetScreenScale; // получаем скей?

    resourceID := TAndroidHelper.Activity.getResources.getIdentifier(StringToJString('status_bar_height'),
      StringToJString('dimen'), StringToJString('android'));
    if resourceID > 0 then
      StatusBar := Trunc(TAndroidHelper.Activity.getResources.getDimensionPixelSize(resourceID) / sScale);

    if hasNavbar(NavigationBar) then
      NavigationBar := Trunc(NavigationBar / sScale);
  end;
{$ENDIF}
end;

{$IFDEF IOS}

function GetStatusBarView: UIView;
var
  I: Integer;
  LViews: NSArray;
  LView: UIView;
begin
  Result := nil;
  LViews := SharedApplication.keyWindow.rootViewController.view.subviews;
  for I := 0 to LViews.count - 1 do
  begin
    LView := TUIView.Wrap(LViews.objectAtIndex(I));
    {$IF (CompilerVersion<=33.0) }
    if CGRectEqualToRect(LView.frame, SharedApplication.statusBarFrame) <> 0 then
    {$ELSE}
    if CGRectEqualToRect(LView.frame, SharedApplication.statusBarFrame) then
    {$ENDIF}
    begin
      Result := LView;
      Break;
    end;
  end;
end;

procedure SetStatusBarBackgroundColor(const ABackgroundColor: TAlphaColor);
var
  Red: Single;
  Green: Single;
  Blue: Single;
  ColorCI: CIColor;
  ColorUI: UIColor;
  StatusBarView: UIView;
begin
  StatusBarView := GetStatusBarView;
  if StatusBarView = nil then
    Exit;
  Red := TAlphaColorRec(ABackgroundColor).r / 255;
  Green := TAlphaColorRec(ABackgroundColor).g / 255;
  Blue := TAlphaColorRec(ABackgroundColor).b / 255;
  ColorCI := TCIColor.Wrap(TCIColor.OCClass.colorWithRed(Red, Green, Blue));
  ColorUI := TUIColor.Wrap(TUIColor.OCClass.colorWithCIColor(ColorCI));
  StatusBarView.setBackgroundColor(ColorUI);
  if TOSVersion.Check(7, 0) then
    SharedApplication.keyWindow.rootViewController.setNeedsStatusBarAppearanceUpdate;
end;
{$ENDIF}

procedure StatusBarSetColor(const aColor: TAlphaColor);
{$IFDEF ANDROID}
var
  Window: JWindowExt;
{$ENDIF}
begin
{$IFDEF ANDROID}
  CallInUIThread(
    procedure
    begin
      if TOSVersion.Check(5, 0) then
      begin
        Window := GetWindowExt;

//        Window.addFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);
        Window.addFlags(TJWindowManager_LayoutParamsExt.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.clearFlags(TJWindowManager_LayoutParamsExt.JavaClass.FLAG_TRANSLUCENT_STATUS);

    //    Window.setFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS,
//          TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);
//        Window.setFlags(TJWindowManager_LayoutParamsExt.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS,
  //        TJWindowManager_LayoutParamsExt.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);

        Window.setStatusBarColor(TJcolor.JavaClass.RGB(
        TAlphaColorRec(acolor).R,
        TAlphaColorRec(acolor).G,
        TAlphaColorRec(acolor).B
        )); // -16777216);
      end;
    end);
{$ENDIF}
{$IFDEF IOS}
  SetStatusBarBackgroundColor(aColor);
{$ENDIF}
end;

procedure NavigationBarSetColor(color: TAlphaColor);
{$IFDEF ANDROID}
var
  Window: JWindowExt;
{$ENDIF}
begin
{$IFDEF ANDROID}
  CallInUIThread(
    procedure
    begin
      if TOSVersion.Check(5, 0) then
      begin
        Window := GetWindowExt;

        Window.setNavigationBarColor(TJcolor.JavaClass.RGB(
        TAlphaColorRec(color).R,
        TAlphaColorRec(color).G,
        TAlphaColorRec(color).B
        )); // -16777216);
      end;
    end);
{$ENDIF}
end;

procedure StatusBarSetColor(const aColor: integer);overload;
{$IFDEF ANDROID}
var
  Window: JWindowExt;
{$ENDIF}
begin
{$IFDEF ANDROID}
  CallInUIThread(
    procedure
    begin
      if TOSVersion.Check(5, 0) then
      begin
        Window := GetWindowExt;
        Window.addFlags(TJWindowManager_LayoutParamsExt.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.clearFlags(TJWindowManager_LayoutParamsExt.JavaClass.FLAG_TRANSLUCENT_STATUS);

        Window.setStatusBarColor(aColor);
      end;
    end);
{$ENDIF}
{$IFDEF IOS}
//  SetStatusBarBackgroundColor(aColor);
{$ENDIF}

end;

procedure StatusBarLight(Value: Boolean);
{$IFDEF ANDROID}
var
  Window: JWindowExt;
{$ENDIF}
Begin
{$IFDEF ANDROID}
  CallInUIThread(
    procedure
    begin
      if TOSVersion.Check(6, 0) then
      begin
        Window := GetWindowExt;
        if Value then
           Window.getDecorView.setSystemUiVisibility(TJView.JavaClass.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
        Else
           Window.getDecorView.setSystemUiVisibility(TJView.JavaClass.SYSTEM_UI_FLAG_LAYOUT_STABLE)
      end;
    end);
{$ENDIF}

End;
procedure StatusBarTransparent(value:Boolean);
{$IFDEF ANDROID}
var
  Window: JWindowExt;
{$ENDIF}
Begin
{$IFDEF ANDROID}
  CallInUIThread(
    procedure
    begin
      if TOSVersion.Check(5, 0) then
      begin
        Window := GetWindowExt;
        if Value then begin
        Window.addFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);
        Window.addFlags(TJWindowManager_LayoutParamsExt.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);

        Window.setFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS,
          TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);
        Window.setFlags(TJWindowManager_LayoutParamsExt.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS,
          TJWindowManager_LayoutParamsExt.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);

        Window.setStatusBarColor(TJcolor.JavaClass.TRANSPARENT); // -16777216);
        end
        Else
        Begin
        Window.ClearFlags(TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);
        Window.ClearFlags(TJWindowManager_LayoutParamsExt.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);

        end;



      end;
    end);

{$ENDIF}
End;

Function  StatusBarColor:integer;
{$IFDEF ANDROID}
var
  Window: JWindowExt;
{$ENDIF}
begin
{$IFDEF ANDROID}
      if TOSVersion.Check(5, 0) then
      begin
        Window := GetWindowExt;
        Result := Window.getStatusBarColor;
      end;
{$ENDIF}


end;

end.
