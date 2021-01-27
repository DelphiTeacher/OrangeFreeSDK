//https://quality.embarcadero.com/browse/RSP-18202
//http://www.cnblogs.com/onechen/p/6906823.html
//fix by 龟山Aone
//http://www.raysoftware.cn/?p=475
//fix or add by flying wang.
(*　仅支持 RAD10.2.3(10.2 Release 3)，其他版本请自行修改　*)

{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{Copyright(c) 2013-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.FontGlyphs.Android;

interface

{$SCOPEDENUMS ON}

uses
  FMX.FontGlyphs, Androidapi.JNI.GraphicsContentViewText;

type
  TAndroidFontGlyphManager = class(TFontGlyphManager)
  private
    FPaint: JPaint;
    //Current metrics
    FTop: Integer;
    FAscent: Integer;
    FDescent: Integer;
    FBottom: Integer;
    FLeading: Integer;
  protected
    procedure LoadResource; override;
    procedure FreeResource; override;
    function DoGetGlyph(const Char: UCS4Char; const Settings: TFontGlyphSettings;
      const UseColorfulPalette: Boolean): TFontGlyph; override;
    function DoGetBaseline: Single; override;
    function IsColorfulCharacter(const Char: UCS4Char): Boolean; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
//fix or add by flying wang
//fix by 武稀松(wr960204)
///引入System.IOUtils是为了能够获取Android的各种系统目录
  System.IOUtils,
  System.Types, System.Math, System.Character, System.Generics.Collections, System.UIConsts, System.UITypes,
  System.Classes, System.SysUtils, FMX.Types, FMX.Surfaces, FMX.Graphics, Androidapi.JNI.JavaTypes, Androidapi.Bitmap,
  Androidapi.JNIBridge, Androidapi.Helpers;

{ TAndroidFontGlyphManager }

constructor TAndroidFontGlyphManager.Create;
begin
  inherited Create;
  FPaint := TJPaint.Create;
end;

destructor TAndroidFontGlyphManager.Destroy;
begin
  FPaint := nil;
  inherited;
end;

procedure TAndroidFontGlyphManager.LoadResource;
var
  TypefaceFlag: Integer;
  Typeface: JTypeface;
  FamilyName: JString;
  Metrics: JPaint_FontMetricsInt;
  //Fix or add By Flying Wang.
  FontFile1, FontFile2: string;
begin
  FPaint.setAntiAlias(True);
  FPaint.setTextSize(CurrentSettings.Size * CurrentSettings.Scale);
  FPaint.setARGB(255, 255, 255, 255);
  if TOSVersion.Check(4, 0) then
    FPaint.setHinting(TJPaint.JavaClass.HINTING_ON);
  //Font
  try
    FamilyName := StringToJString(CurrentSettings.Family);
    if not CurrentSettings.Style.Slant.IsRegular and not CurrentSettings.Style.Weight.IsRegular then
      TypefaceFlag := TJTypeface.JavaClass.BOLD_ITALIC
    else
      if not CurrentSettings.Style.Weight.IsRegular then
        TypefaceFlag := TJTypeface.JavaClass.BOLD
      else
        if not CurrentSettings.Style.Slant.IsRegular then
          TypefaceFlag := TJTypeface.JavaClass.ITALIC
        else
          TypefaceFlag := TJTypeface.JavaClass.NORMAL;
    //Typeface := TJTypeface.JavaClass.create(FamilyName, TypefaceFlag);
    //{ Fix Begin 修改开始.如果在下载目录中存在跟字体同名的.ttf文件,那么优先使用ttf文件.
    //  我是放在SD卡的下载目录中.大家可以按需要任意改这个位置.
    //  甚至也可以放在Asset目录中,这样可以打包在APK中.
    //}
    //Fix or add By Flying Wang.
    FontFile1 := IncludeTrailingPathDelimiter(TPath.GetDocumentsPath) +
      CurrentSettings.Family + '.ttf';
    //结合了 http://blog.qdac.cc/?p=1861
    FontFile2 := IncludeTrailingPathDelimiter(TPath.GetSharedDownloadsPath) +
      CurrentSettings.Family + '.ttf';
    if FileExists(FontFile1) then
    begin
      Typeface := TJTypeface.JavaClass.createFromFile(StringToJString(FontFile1));
    end
    else if FileExists(FontFile2) then
    begin
      Typeface := TJTypeface.JavaClass.createFromFile(StringToJString(FontFile2));
    end
    else
    begin
      Typeface := TJTypeface.JavaClass.Create(FamilyName, TypefaceFlag);
    end;
    //{ Fix End 修改结束 }
    FPaint.setTypeface(Typeface);
    try
      Metrics := FPaint.getFontMetricsInt;
      //
      FTop := Metrics.top;
      FAscent := Metrics.ascent;
      FDescent := Metrics.descent;
      FBottom := Metrics.bottom;
      FLeading := Metrics.leading;
    finally
      Metrics := nil;
    end;
  finally
    FamilyName := nil;
    Typeface := nil;
  end;
end;

procedure TAndroidFontGlyphManager.FreeResource;
begin
  if FPaint <> nil then
    FPaint.reset;
end;

function TAndroidFontGlyphManager.DoGetBaseline: Single;
begin
  Result := Abs(FAscent);
end;

function TAndroidFontGlyphManager.DoGetGlyph(const Char: UCS4Char; const Settings: TFontGlyphSettings;
  const UseColorfulPalette: Boolean): TFontGlyph;
var
  Text: JString;
  Bitmap: JBitmap;
  Canvas: JCanvas;
  GlyphRect: TRect;
  C, I, J, Width, Height, OriginY: Integer;
  Advance: Single;
  Bounds: JRect;
  GlyphStyle: TFontGlyphStyles;
  PixelBuffer: Pointer;
  Data: PIntegerArray;
  Path: JPath;
  PathMeasure: JPathMeasure;
  PathLength: Single;
  Coords: TJavaArray<Single>;
  StartPoint, LastPoint, Point: TPointF;
  NewContour, HasStartPoint: Boolean;
begin
  Text := StringToJString(System.Char.ConvertFromUtf32(Char));
  try
    Advance := FPaint.measureText(Text);
    Height := Abs(FTop) + Abs(FBottom) + 2;
    Width := Ceil(Abs(Advance)) + 2;
    Bounds := TJRect.Create;
    try
      FPaint.getTextBounds(Text, 0, Text.length, Bounds);
      if Bounds.left < 0 then
        Width := Width - Bounds.left;
//fix or add by flying wang.
{+++>}

      // 加入修正代码: 文字斜粗显示 by Aone 2017.05.26
      if (FPaint.getTypeface <> nil) {add by kngstr} and FPaint.getTypeface.isItalic then
      begin
        if FPaint.getTypeface.isBold then
        begin
          Width := Round(Width * 1.2375);
        end
        else
        begin
          Width := Round(Width * 1.125);
        end;
      end;
{<+++}
      Bitmap := TJBitmap.JavaClass.createBitmap(Width, Height, TJBitmap_Config.JavaClass.ARGB_8888);
      try
        Canvas := TJCanvas.JavaClass.init(Bitmap);
        try
          if Bounds.left < 0 then
            Canvas.drawText(Text, -Bounds.left, -FAscent, FPaint)
          else
            Canvas.drawText(Text, 0, -FAscent, FPaint);
        finally
          Canvas := nil;
        end;

        GlyphStyle := [];
        if ((FAscent = 0) and (FDescent = 0)) or not HasGlyph(Char) then
          GlyphStyle := [TFontGlyphStyle.NoGlyph];
        if TFontGlyphSetting.Path in Settings then
          GlyphStyle := GlyphStyle + [TFontGlyphStyle.HasPath];
        if UseColorfulPalette then
          GlyphStyle := GlyphStyle + [TFontGlyphStyle.ColorGlyph];

        // For some font sizes Ascent line is below Bounds.top, cuting off part of a glyph.
        // Do not use Y-value of the origin point in such cases.
        if FAscent > Bounds.top then
          OriginY := 0
        else
          OriginY := Abs(FAscent - Bounds.top);
        Result := TFontGlyph.Create(TPoint.Create(Bounds.left, OriginY), Advance,
          Abs(FAscent) + Abs(FDescent) + Abs(FLeading), GlyphStyle);

        if (TFontGlyphSetting.Bitmap in Settings) and (HasGlyph(Char) or ((FAscent <> 0) or (FDescent <> 0))) and
           (AndroidBitmap_lockPixels(TJNIResolver.GetJNIEnv, (Bitmap as ILocalObject).GetObjectID, @PixelBuffer) = 0) then
        begin
          Data := PIntegerArray(PixelBuffer);
          GlyphRect.Left := Bounds.left;
          GlyphRect.Right := Bounds.Right;
          GlyphRect.Top := OriginY;
          GlyphRect.Bottom := Abs(FAscent - Bounds.bottom);

          if (GlyphRect.Width > 0) or (GlyphRect.Height > 0) then
          begin
            Result.Bitmap.SetSize(GlyphRect.Width + 1, GlyphRect.Height + 1, TPixelFormat.BGRA);
            if TFontGlyphSetting.PremultipliedAlpha in Settings then
            begin
              for I := GlyphRect.Top to GlyphRect.Bottom do
                Move(Data[I * Width + Max(GlyphRect.Left, 0)],
                  Result.Bitmap.GetPixelAddr(0, I - GlyphRect.Top)^, Result.Bitmap.Pitch);
            end
            else
              for I := GlyphRect.Top to GlyphRect.Bottom - 1 do
                for J := GlyphRect.Left to GlyphRect.Right - 1 do
                begin
                  C := Data[I * Width + J];
                  if C <> 0 then
                  begin
                    C := ((C shr 16) and $FF + (C shr 8) and $FF + (C and $FF)) div 3;
                    Result.Bitmap.Pixels[J - GlyphRect.Left, I - GlyphRect.Top] := MakeColor($FF, $FF, $FF, C);
                  end
                end;
          end;
          AndroidBitmap_unlockPixels(TJNIResolver.GetJNIEnv, (Bitmap as ILocalObject).GetObjectID);
        end;
        //Path
        if TFontGlyphSetting.Path in Settings then
        try
          Path := TJPath.Create;
          FPaint.getTextPath(Text, 0, Text.length, Result.Origin.X, Result.Origin.Y, Path);
          PathMeasure := TJPathMeasure.Create;
          PathMeasure.setPath(Path, False);
          Coords := TJavaArray<Single>.Create(2);
          if PathMeasure.getLength > 0 then
          repeat
            PathLength := PathMeasure.getLength;
            NewContour := True;
            HasStartPoint := False;
            I := 0;
            while I < PathLength do
            begin
              if PathMeasure.getPosTan(I, Coords, nil) then
              begin
                Point := PointF(Coords[0], Coords[1]);
                if NewContour then
                begin
                  Result.Path.MoveTo(Point);
                  NewContour := False;
                  HasStartPoint := False;
                end
                else
                  if Point <> LastPoint then
                  begin
                    if HasStartPoint and (LastPoint <> StartPoint) then
                      if not SameValue(((Point.Y - StartPoint.Y) / (Point.X - StartPoint.X)), ((Point.Y - LastPoint.Y) / (Point.X - LastPoint.X)), Epsilon) then
                      begin
                        Result.Path.LineTo(Point);
                        HasStartPoint := False;
                      end
                      else
                    else
                      Result.Path.LineTo(Point);
                  end;
                LastPoint := Point;
                if not HasStartPoint then
                begin
                  StartPoint := Point;
                  HasStartPoint := True;
                end;
              end;
              Inc(I);
            end;
            if Result.Path.Count > 0 then
              Result.Path.ClosePath;
          until not PathMeasure.nextContour;
          Point := Result.Path.GetBounds.TopLeft;
          Result.Path.Translate(-Point.X + Result.Origin.X, -Point.Y + Result.Origin.Y);
        finally
          FreeAndNil(Coords);
          Path := nil;
          PathMeasure := nil;
        end;
      finally
        Bitmap.recycle;
        Bitmap := nil;
      end;
    finally
      Bounds := nil;
    end;
  finally
    Text := nil;
  end;
end;

function TAndroidFontGlyphManager.IsColorfulCharacter(const Char: UCS4Char): Boolean;
begin
  Result := inherited or (
    (Char = $203C) or
    (Char = $2049) or
    (Char = $2122) or
    (Char = $2139) or
    ((Char >= $2194) and (Char <= $2199)) or
    ((Char >= $21A9) and (Char <= $21AA)) or
    ((Char >= $231A) and (Char <= $231B)) or
    (Char = $2328) or
    (Char = $23CF) or
    ((Char >= $23E9) and (Char <= $23F3)) or
    ((Char >= $23F8) and (Char <= $23FA)) or
    (Char = $24C2) or
    ((Char >= $25AA) and (Char <= $25AB)) or
    (Char = $25B6) or
    (Char = $25C0) or
    ((Char >= $25FB) and (Char <= $25FE)) or
    ((Char >= $2600) and (Char <= $2604)) or
    (Char = $260E) or
    (Char = $2611) or
    ((Char >= $2614) and (Char <= $2615)) or
    (Char = $2618) or
    (Char = $261D) or
    (Char = $2620) or
    ((Char >= $2622) and (Char <= $2623)) or
    (Char = $2626) or
    (Char = $262A) or
    ((Char >= $262E) and (Char <= $262F)) or
    ((Char >= $2638) and (Char <= $263A)) or
    (Char = $2640) or
    (Char = $2642) or
    ((Char >= $2648) and (Char <= $2653)) or
    (Char = $2660) or
    (Char = $2663) or
    ((Char >= $2665) and (Char <= $2666)) or
    (Char = $2668) or
    (Char = $267B) or
    (Char = $267F) or
    ((Char >= $2692) and (Char <= $2697)) or
    (Char = $2699) or
    ((Char >= $269B) and (Char <= $269C)) or
    ((Char >= $26A0) and (Char <= $26A1)) or
    ((Char >= $26AA) and (Char <= $26AB)) or
    ((Char >= $26B0) and (Char <= $26B1)) or
    ((Char >= $26BD) and (Char <= $26BE)) or
    ((Char >= $26C4) and (Char <= $26C5)) or
    (Char = $26C8) or
    ((Char >= $26CE) and (Char <= $26CF)) or
    (Char = $26D1) or
    ((Char >= $26D3) and (Char <= $26D4)) or
    ((Char >= $26E9) and (Char <= $26EA)) or
    ((Char >= $26F0) and (Char <= $26F5)) or
    ((Char >= $26F7) and (Char <= $26FA)) or
    (Char = $26FD) or
    (Char = $2702) or
    (Char = $2705) or
    ((Char >= $2708) and (Char <= $270D)) or
    (Char = $270F) or
    (Char = $2712) or
    (Char = $2714) or
    (Char = $2716) or
    (Char = $271D) or
    (Char = $2721) or
    (Char = $2728) or
    ((Char >= $2733) and (Char <= $2734)) or
    (Char = $2744) or
    (Char = $2747) or
    (Char = $274C) or
    (Char = $274E) or
    ((Char >= $2753) and (Char <= $2755)) or
    (Char = $2757) or
    ((Char >= $2763) and (Char <= $2764)) or
    ((Char >= $2795) and (Char <= $2797)) or
    (Char = $27A1) or
    (Char = $27B0) or
    (Char = $27BF) or
    ((Char >= $2934) and (Char <= $2935)) or
    ((Char >= $2B05) and (Char <= $2B07)) or
    ((Char >= $2B1B) and (Char <= $2B1C)) or
    (Char = $2B50) or
    (Char = $2B55) or
    (Char = $3030) or
    (Char = $303D) or
    (Char = $3297) or
    (Char = $3299) or
    (Char = $1F004) or
    (Char = $1F0CF) or
    ((Char >= $1F170) and (Char <= $1F171)) or
    ((Char >= $1F17E) and (Char <= $1F17F)) or
    (Char = $1F18E) or
    ((Char >= $1F191) and (Char <= $1F19A)) or
    ((Char >= $1F201) and (Char <= $1F202)) or
    (Char = $1F21A) or
    (Char = $1F22F) or
    ((Char >= $1F232) and (Char <= $1F23A)) or
    ((Char >= $1F250) and (Char <= $1F251)) or
    ((Char >= $1F300) and (Char <= $1F321)) or
    ((Char >= $1F324) and (Char <= $1F393)) or
    ((Char >= $1F396) and (Char <= $1F397)) or
    ((Char >= $1F399) and (Char <= $1F39B)) or
    ((Char >= $1F39E) and (Char <= $1F3F0)) or
    ((Char >= $1F3F3) and (Char <= $1F3F5)) or
    ((Char >= $1F3F7) and (Char <= $1F3FA)) or
    ((Char >= $1F400) and (Char <= $1F4FD)) or
    ((Char >= $1F4FF) and (Char <= $1F53D)) or
    ((Char >= $1F549) and (Char <= $1F54E)) or
    ((Char >= $1F550) and (Char <= $1F567)) or
    ((Char >= $1F56F) and (Char <= $1F570)) or
    ((Char >= $1F573) and (Char <= $1F57A)) or
    (Char = $1F587) or
    ((Char >= $1F58A) and (Char <= $1F58D)) or
    (Char = $1F590) or
    ((Char >= $1F595) and (Char <= $1F596)) or
    ((Char >= $1F5A4) and (Char <= $1F5A5)) or
    (Char = $1F5A8) or
    ((Char >= $1F5B1) and (Char <= $1F5B2)) or
    (Char = $1F5BC) or
    ((Char >= $1F5C2) and (Char <= $1F5C4)) or
    ((Char >= $1F5D1) and (Char <= $1F5D3)) or
    ((Char >= $1F5DC) and (Char <= $1F5DE)) or
    (Char = $1F5E1) or
    (Char = $1F5E3) or
    (Char = $1F5E8) or
    (Char = $1F5EF) or
    (Char = $1F5F3) or
    ((Char >= $1F5FA) and (Char <= $1F64F)) or
    ((Char >= $1F680) and (Char <= $1F6C5)) or
    ((Char >= $1F6CB) and (Char <= $1F6D2)) or
    ((Char >= $1F6E0) and (Char <= $1F6E5)) or
    (Char = $1F6E9) or
    ((Char >= $1F6EB) and (Char <= $1F6EC)) or
    (Char = $1F6F0) or
    ((Char >= $1F6F3) and (Char <= $1F6F8)) or
    ((Char >= $1F910) and (Char <= $1F93A)) or
    ((Char >= $1F93C) and (Char <= $1F93E)) or
    ((Char >= $1F940) and (Char <= $1F945)) or
    ((Char >= $1F947) and (Char <= $1F94C)) or
    ((Char >= $1F950) and (Char <= $1F96B)) or
    ((Char >= $1F980) and (Char <= $1F997)) or
    (Char = $1F9C0) or
    ((Char >= $1F9D0) and (Char <= $1F9E6))
  );
end;

end.
