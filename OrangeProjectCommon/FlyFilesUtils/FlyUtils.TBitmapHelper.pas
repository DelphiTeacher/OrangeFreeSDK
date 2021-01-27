unit FlyUtils.TBitmapHelper;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2015-02-10　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

//Version 1.1.2015.728

interface

//好像不起作用。
{$IF Declared(FireMonkeyVersion) and (FireMonkeyVersion > 16.0)}
//FMX。
  {$DEFINE FMX}
{$ELSE}
//VCL
{$ENDIF}

//是不是启用 FMX 只能靠自己写 DEFINE 了。{.$DEFINE FMX} 就是禁用。
{$DEFINE FMX}

uses
{$IFDEF FMX}
  FMX.Graphics,
{$ELSE}
  Vcl.Graphics,
{$ENDIF}
  System.UITypes,
  System.Classes;

{$IFDEF FMX}
{$ELSE}
resourcestring
    SBitmapSavingFailed = 'Saving bitmap failed.';
    SBitmapSavingFailedNamed = 'Saving bitmap failed (%s).';
{$ENDIF}

var
  MonochromeChange_Threshold: Byte = 120;
  MonochromeChange_Weighting_Red: Double = 0.3;
  MonochromeChange_Weighting_Green: Double = 0.59;
  MonochromeChange_Weighting_Blue: Double = 0.11;

type
  /// <summary>
  ///   转黑白的方法
  /// </summary>
  TMonochromeChangeType = (
    /// <summary>
    ///   平均值 <br />
    /// </summary>
    Average,
    /// <summary>
    ///   最大值
    /// </summary>
    Weighting,
    /// <summary>
    ///   权值
    /// </summary>
    Max);

  /// <summary>
  ///   <para>
  ///     TBitmap Save As BMP
  ///   </para>
  ///   <para>
  ///     BytesPerPixel = -1 表示自动
  ///   </para>
  /// </summary>
  TFlyBitmapHelper = class helper for TBitmap
  public
    function SaveAsBMPToFile(const AFileName: string; const BytesPerPixel: Integer = 3;
      const MonochromeChangeType: TMonochromeChangeType = TMonochromeChangeType.Average): Boolean; overload;
    procedure SaveAsBMPToFileDef(const AFileName: string); overload;
    function SaveAsBMPToStream(const AStream: TStream; const BytesPerPixel: Integer = 3;
      const MonochromeChangeType: TMonochromeChangeType = TMonochromeChangeType.Average): Boolean; overload;
    procedure SaveAsBMPToStreamDef(Stream: TStream); overload;
{$IFDEF FMX}
    /// <summary>
    /// 用于在线程中代替 LoadThumbnailFromFile ，不用自己调用 Synchronize 了。
    /// </summary>
    procedure SyncLoadThumbnailFromFile(const AFileName: string; const AFitWidth, AFitHeight: Single;
      const UseEmbedded: Boolean = True);
{$ENDIF}
  end;

{$IFDEF FMX}
{$ELSE}
procedure GraphicToBitmap(const Src: Vcl.Graphics.TGraphic;
  const Dest: Vcl.Graphics.TBitmap; const TransparentColor: Vcl.Graphics.TColor = Vcl.Graphics.clNone);
{$ENDIF}

implementation

uses
  System.Types,
{$IFDEF FMX}
  FMX.Types,
  FMX.Consts,
  FMX.Surfaces,
{$ELSE}
  Vcl.Consts,
{$ENDIF}
  System.SysConst,
  System.SysUtils,
  System.Math;


//add by 爱吃猪头肉。
type
//感谢 yu  273637089 的测试和 提供 packed 信息。
{$IFDEF FMX}
{$ELSE}
  tagRGBTRIPLE = packed record
    rgbtBlue: Byte;
    rgbtGreen: Byte;
    rgbtRed: Byte;
  end;
  PRGBTripleArray = ^TRGBTripleArray;
  TRGBTripleArray = array [Byte] of tagRGBTRIPLE;
{$ENDIF}

  tagBITMAPFILEHEADER = packed record
    bfType: Word;
    bfSize: DWORD;
    bfReserved1: Word;
    bfReserved2: Word;
    bfOffBits: DWORD;
  end;

  tagBITMAPINFOHEADER = packed record
    biSize: DWORD;
    biWidth: Longint;
    biHeight: Longint;
    biPlanes: Word;
    biBitCount: Word;
    biCompression: DWORD;
    biSizeImage: DWORD;
    biXPelsPerMeter: Longint;
    biYPelsPerMeter: Longint;
    biClrUsed: DWORD;
    biClrImportant: DWORD;
  end;

  tagRGBQUAD = packed record
    rgbBlue: Byte;
    rgbGreen: Byte;
    rgbRed: Byte;
    rgbReserved: Byte;
  end;

const
  { constants for the biCompression field }
  {$EXTERNALSYM BI_RGB}
  BI_RGB = 0;
  {$EXTERNALSYM BI_RLE8}
  BI_RLE8 = 1;
  {$EXTERNALSYM BI_RLE4}
  BI_RLE4 = 2;
  {$EXTERNALSYM BI_BITFIELDS}
  BI_BITFIELDS = 3;

const
  RGB565_MASK_RED   = $F800;
  RGB565_MASK_GREEN = $07E0;
  RGB565_MASK_BLUE  = $001F;
  RGB565ExtDataLen  = 12;

function rgb_24_2_565(r,g,b: Byte): UInt16;
begin
//  r := r * 31 div 255;
//  g := g * 64 div 255;
//  b := b * 31 div 255;
//  Result := r *2048 or g *32 or b;
//  Result := ((r shl 8) and RGB565_MASK_RED) or ((g shl 3) and RGB565_MASK_GREEN) or (b shr 3);
  Result := ((r shr 3) shl 11) or ((g shr 2 ) shl 5) or (b shr 3);
end;
{
    return (USHORT)(((unsigned(r) << 8) & 0xF800) |
            ((unsigned(g) << 3) & 0x7E0)  |
            ((unsigned(b) >> 3)));
}

procedure rgb565_2_rgb24(rgb24: TBytes; rgb565: UInt16);
begin
 //extract RGB
 rgb24[2] := (rgb565 and RGB565_MASK_RED) shr 11;
 rgb24[1] := (rgb565 and RGB565_MASK_GREEN) shr 5;
 rgb24[0] := (rgb565 and RGB565_MASK_BLUE);

 //amplify the image
 rgb24[2] := rgb24[2] shl 3;
 rgb24[1] := rgb24[2] shl 2;
 rgb24[0] := rgb24[2] shl 3;
end;
{
 //extract RGB
 rgb24[2] = (rgb565 & RGB565_MASK_RED) >> 11;
 rgb24[1] = (rgb565 & RGB565_MASK_GREEN) >> 5;
 rgb24[0] = (rgb565 & RGB565_MASK_BLUE);

 //amplify the image
 rgb24[2] <<= 3;
 rgb24[1] <<= 2;
 rgb24[0] <<= 3;
}

const
  RGB555_MASK_RED   = $7C00;
  RGB555_MASK_GREEN = $03E0;
  RGB555_MASK_BLUE  = $001F;

function rgb_24_2_555(r,g,b: Byte): UInt16;
begin
  Result := ((r shl 7) and RGB555_MASK_RED) or ((g shl 2) and RGB555_MASK_GREEN) or (b shr 3);
end;

procedure rgb555_2_rgb24(rgb24: TBytes; rgb555: UInt16);
begin
 //extract RGB
 rgb24[0] := (rgb555 shl 3) and $00F8;
 rgb24[1] := (rgb555 shr 2) and $00F8;
 rgb24[2] := (rgb555 shr 7) and $00F8;
end;

{$IFDEF FMX}
{$ELSE}
procedure GraphicToBitmap(const Src: Vcl.Graphics.TGraphic;
  const Dest: Vcl.Graphics.TBitmap; const TransparentColor: Vcl.Graphics.TColor = Vcl.Graphics.clNone);
begin
  // Do nothing if either source or destination are nil
  if not Assigned(Src) or not Assigned(Dest) then
    Exit;
  if Src.Empty then exit;
  
  // Size the bitmap
  Dest.Width := Src.Width;
  Dest.Height := Src.Height;
  if Src.Transparent then
  begin
    // Source graphic is transparent, make bitmap behave transparently
    Dest.Transparent := True;
    if (TransparentColor <> Vcl.Graphics.clNone) then
    begin
      // Set destination as transparent using required colour key
      Dest.TransparentColor := TransparentColor;
      Dest.TransparentMode := Vcl.Graphics.tmFixed;
      // Set background colour of bitmap to transparent colour
      Dest.Canvas.Brush.Color := TransparentColor;
    end
    else
      // No transparent colour: set transparency to automatic
      Dest.TransparentMode := Vcl.Graphics.tmAuto;
  end;
  // Clear bitmap to required background colour and draw bitmap
  Dest.Canvas.FillRect(System.Classes.Rect(0, 0, Dest.Width, Dest.Height));
  Dest.Canvas.Draw(0, 0, Src);
end;
{$ENDIF}
//该代码片段来自于: http://www.sharejs.com/codes/delphi/2248


{TFlyBitmapHelper}

function TFlyBitmapHelper.SaveAsBMPToFile(const AFileName: string; const BytesPerPixel: Integer = 3;
  const MonochromeChangeType: TMonochromeChangeType = TMonochromeChangeType.Average): Boolean;
var
  AStream: TStream;
begin
  Result := False;
{$IFDEF FMX}
  if IsEmpty then exit;
{$ELSE}
  if Empty then exit;
{$ENDIF}
  AStream := TFileStream.Create(AFileName, fmCreate);// or fmOpenReadWrite);
  try
    Result := SaveAsBMPToStream(AStream, BytesPerPixel);
//    if Result then
//      AStream.Size := AStream.Position;
  finally
    FreeAndNil(AStream);
  end;
end;

procedure TFlyBitmapHelper.SaveAsBMPToFileDef(const AFileName: string);
begin
  if not SaveAsBMPToFile(AFileName) then
  begin
{$IFDEF FMX}
    raise EBitmapSavingFailed.CreateFMT(SBitmapSavingFailed, [AFileName]);
{$ELSE}
    raise EInvalidGraphicOperation.CreateFmt(SBitmapSavingFailed, [AFileName]);
{$ENDIF}
  end;
end;

//http://blog.csdn.net/pjpsmile/article/details/8985523
function TFlyBitmapHelper.SaveAsBMPToStream(const AStream: TStream; const BytesPerPixel: Integer = 3;
  const MonochromeChangeType: TMonochromeChangeType = TMonochromeChangeType.Average): Boolean;
var
  I, CurrBytesPerPixel,
  wWidth, nCol, wRow, wByteIdex,
  bfReserved1, bfReserved2,
  nBmpWidth, nBmpHeight, bufferSize: Integer;
  BitmapInfo: tagBITMAPINFOHEADER;
  BMF: tagBITMAPFILEHEADER;
{$IFDEF FMX}
  Data: TBitmapData;
  clr: TAlphaColor;
{$ELSE}
  Pixs : pRGBTripleArray;
{$ENDIF}
  bmpData: TBytes;
  A32BitData: UInt32;
  ABitIndex,
  A8BitData: Byte;
  RGBQUAD: tagRGBQUAD;
//  FileSizeFix,
  A16BitData,
  GrayeData: UInt16;
begin
  Result := False;
{$IFDEF FMX}
  if IsEmpty then exit;
{$ELSE}
  if Empty then exit;
{$ENDIF}
  if not Assigned(AStream) then exit;
  CurrBytesPerPixel := BytesPerPixel;
{$IFDEF FMX}
  Map(TMapAccess.Read, Data);
{$ELSE}
{$ENDIF}
  try
    if CurrBytesPerPixel = -1 then
    begin
{$IFDEF FMX}
      CurrBytesPerPixel := Data.BytesPerPixel;
{$ELSE}
      CurrBytesPerPixel := 3;
      if PixelFormat = pf1bit then
        CurrBytesPerPixel := 0;
      if PixelFormat = pf4bit then
        CurrBytesPerPixel := 2;
      if PixelFormat = pf8bit then
        CurrBytesPerPixel := 2;
      if PixelFormat = pf15bit then
        CurrBytesPerPixel := 2;
      if PixelFormat = pf16bit then
        CurrBytesPerPixel := 2;
      if PixelFormat = pf24bit then
        CurrBytesPerPixel := 3;
      if PixelFormat = pf32bit then
        CurrBytesPerPixel := 4;
{$ENDIF}
      if not (CurrBytesPerPixel in [0,1,2,4]) then
        CurrBytesPerPixel := 3;
    end;
    if not (CurrBytesPerPixel in [0,1,2,3,4]) then
      exit;
    //不打算支持 8 位的。
    if CurrBytesPerPixel = 1 then exit;
{$IFDEF FMX}
    nBmpWidth := Data.Width;
    nBmpHeight := Data.Height;
{$ELSE}
    nBmpWidth := Width;
    nBmpHeight := Height;
{$ENDIF}
    // 像素扫描
    if CurrBytesPerPixel > 0 then
    begin
      wWidth := nBmpWidth * CurrBytesPerPixel;
      if (wWidth mod 4) > 0 then
      begin
        wWidth := wWidth +  4 - (wWidth mod 4);
      end;
    end
    else if (nBmpWidth mod 32) > 0 then
    begin
      wWidth := ((nBmpWidth div 32) + 1) * 4;;
    end
    else
    begin
      wWidth := (nBmpWidth div 8);
    end;
    bufferSize := nBmpHeight * wWidth;
    // bmp文件头
    BMF.bfType := $4D42;
    BMF.bfSize := 14 + 40 + bufferSize;
    BMF.bfReserved1 := 0;
    BMF.bfReserved2 := 0;
    BMF.bfOffBits := 14 + 40;
    if (CurrBytesPerPixel = 0) then
    begin
      BMF.bfOffBits := BMF.bfOffBits + 2 * Sizeof(RGBQUAD);
      BMF.bfSize := BMF.bfSize + 2 * Sizeof(RGBQUAD);
    end;
    if (CurrBytesPerPixel = 1) then
    begin
      BMF.bfOffBits := BMF.bfOffBits + 256 * Sizeof(RGBQUAD);
      BMF.bfSize := BMF.bfSize + 256 * Sizeof(RGBQUAD);
    end;
    if (CurrBytesPerPixel = 2) then
    begin
      //多谢 [西安]老一门(yyimen@foxmail.com) 提供的 565 格式说明。
      BMF.bfOffBits := BMF.bfOffBits + RGB565ExtDataLen;
      BMF.bfSize := BMF.bfSize + RGB565ExtDataLen;
    end;
//    FileSizeFix := 0;
//    if (BMF.bfSize mod 4) > 0 then
//    begin
//      FileSizeFix := 4 - BMF.bfSize mod 4;
//    end;
//    bufferSize := bufferSize + FileSizeFix;
//    BMF.bfSize := BMF.bfSize + FileSizeFix;
    // 保存bmp文件头
    AStream.WriteBuffer(BMF, Sizeof(BMF));
    // bmp信息头
    FillChar(BitmapInfo, Sizeof(BitmapInfo), 0);
    BitmapInfo.biSize := 40;
//    if (CurrBytesPerPixel = 2) then
//    begin
//      //AcdSee 不支持这种大小的 BitmapInfo
//      BitmapInfo.biSize := 40 + RGB565ExtDataLen;
//    end;
    BitmapInfo.biWidth := nBmpWidth;
    BitmapInfo.biHeight := nBmpHeight;
    BitmapInfo.biPlanes := 1;
    if CurrBytesPerPixel > 0 then
    begin
      BitmapInfo.biBitCount := CurrBytesPerPixel * 8;
    end
    else
    begin
      BitmapInfo.biBitCount := 1;
    end;
    BitmapInfo.biSizeImage := bufferSize;
//    if True then
//    begin
//      //96
//      BitmapInfo.biXPelsPerMeter := $0EC4;
//      BitmapInfo.biYPelsPerMeter := $0EC4;
//    end
//    else
//    begin
//      //72
//      BitmapInfo.biXPelsPerMeter := $0B12;
//      BitmapInfo.biYPelsPerMeter := $0B12;
//    end;
    BitmapInfo.biXPelsPerMeter := 0;
    BitmapInfo.biYPelsPerMeter := 0;
    if (CurrBytesPerPixel = 2) then
    begin
      //可以采用 RGB555 代替 RGB565
      BitmapInfo.biCompression := BI_BITFIELDS; //0是 555 3 是 565
    end;
    // 保存bmp信息头
    AStream.WriteBuffer(BitmapInfo, Sizeof(BitmapInfo));
    if (CurrBytesPerPixel = 2) then
    begin
      // 保存 565 RGB Mask
      A32BitData := RGB565_MASK_RED;
      AStream.WriteBuffer(A32BitData, Sizeof(A32BitData));
      A32BitData := RGB565_MASK_GREEN;
      AStream.WriteBuffer(A32BitData, Sizeof(A32BitData));
      A32BitData := RGB565_MASK_BLUE;
      AStream.WriteBuffer(A32BitData, Sizeof(A32BitData));
      if RGB565ExtDataLen >= 16 then
      begin
        A32BitData := 0;
        AStream.WriteBuffer(A32BitData, Sizeof(A32BitData));
      end;
    end;
    if (CurrBytesPerPixel = 0) or (CurrBytesPerPixel = 1) then
    begin
      //颜色表
      RGBQUAD.rgbBlue := 0;
      RGBQUAD.rgbGreen := 0;
      RGBQUAD.rgbRed := 0;
      RGBQUAD.rgbReserved := 0;
      if (CurrBytesPerPixel = 1) then
      begin
        for I := 0 to 255 do
        begin
          AStream.WriteBuffer(RGBQUAD, Sizeof(RGBQUAD));
        end;
        BitmapInfo.biClrUsed := $FF;
      end
      else
      begin
        AStream.WriteBuffer(RGBQUAD, Sizeof(RGBQUAD));
        RGBQUAD.rgbBlue := $FF;
        RGBQUAD.rgbGreen := $FF;
        RGBQUAD.rgbRed := $FF;
        RGBQUAD.rgbReserved := 0;
        AStream.WriteBuffer(RGBQUAD, Sizeof(RGBQUAD));
        BitmapInfo.biClrUsed := 2;
      end;
    end;
    // 像素扫描
    SetLength(bmpData, wWidth);
    for nCol := nBmpHeight - 1 downto 0 do
    begin
      FillChar(bmpData[0], wWidth, 0);
      wByteIdex := 0;
      //0 是单色图
      if (CurrBytesPerPixel = 0) or (CurrBytesPerPixel = 1) then
      begin
        A8BitData := 0;
        ABitIndex := 0;
{$IFDEF FMX}
{$ELSE}
        Pixs := ScanLine[nCol];
{$ENDIF}
        for wRow := 0 to nBmpWidth - 1 do
        begin
{$IFDEF FMX}
          //X 是行坐标，Y 是 列坐标。
          clr := Data.GetPixel(wRow, nCol);
{$ELSE}
{$ENDIF}
          GrayeData := 0;
{$IFDEF FMX}
          if MonochromeChangeType = TMonochromeChangeType.Average then
          begin
            GrayeData := TAlphaColorRec(clr).R + TAlphaColorRec(clr).G + TAlphaColorRec(clr).B;
            GrayeData := GrayeData div 3;
          end;
          if MonochromeChangeType = TMonochromeChangeType.Weighting then
          begin
            GrayeData := Round((TAlphaColorRec(clr).R * MonochromeChange_Weighting_Red +
               TAlphaColorRec(clr).G * MonochromeChange_Weighting_Green +
               TAlphaColorRec(clr).B * MonochromeChange_Weighting_Blue) / 3);
          end;
          if MonochromeChangeType = TMonochromeChangeType.Max then
          begin
            GrayeData := System.Math.Max(System.Math.Max(TAlphaColorRec(clr).R, TAlphaColorRec(clr).G),
                                         TAlphaColorRec(clr).B);
          end;
{$ELSE}
          if MonochromeChangeType = TMonochromeChangeType.Average then
          begin
            GrayeData := Pixs[wRow].rgbtRed + Pixs[wRow].rgbtGreen + Pixs[wRow].rgbtBlue;
            GrayeData := GrayeData div 3;
          end;
          if MonochromeChangeType = TMonochromeChangeType.Weighting then
          begin
            GrayeData := Round((Pixs[wRow].rgbtRed * MonochromeChange_Weighting_Red +
               Pixs[wRow].rgbtGreen * MonochromeChange_Weighting_Green +
               Pixs[wRow].rgbtBlue * MonochromeChange_Weighting_Blue) / 3);
          end;
          if MonochromeChangeType = TMonochromeChangeType.Max then
          begin
            GrayeData := System.Math.Max(System.Math.Max(Pixs[wRow].rgbtRed, Pixs[wRow].rgbtGreen),
                                         Pixs[wRow].rgbtBlue);
          end;
{$ENDIF}
          if GrayeData > MonochromeChange_Threshold then
          begin
            A8BitData := A8BitData or ($80 shr ABitIndex);
          end;
          inc(ABitIndex);
          if ABitIndex > 7 then
          begin
            ABitIndex := 0;
            if (CurrBytesPerPixel = 0) then
            begin
              bmpData[wByteIdex] := A8BitData;
              A8BitData := 0;
              inc(wByteIdex);
            end;
          end;
        end;
        if (CurrBytesPerPixel = 0) then
        begin
          if ABitIndex > 0 then
          begin
            bmpData[wByteIdex] := A8BitData;
            A8BitData := 0;
          end;
        end;
      end
      else
      begin
{$IFDEF FMX}
        for wRow := 0 to nBmpWidth - 1 do
        begin
          //X 是行坐标，Y 是 列坐标。
          clr := Data.GetPixel(wRow, nCol);
          case CurrBytesPerPixel of
            1:
            begin
              //不支持。
            end;
            2:
            begin
              A16BitData := rgb_24_2_565(TAlphaColorRec(clr).R, TAlphaColorRec(clr).G, TAlphaColorRec(clr).B);
              bmpData[wByteIdex + 0] := WordRec(A16BitData).Lo;
              bmpData[wByteIdex + 1] := WordRec(A16BitData).Hi;
            end;
            3,4:
            begin
              bmpData[wByteIdex + 0] := TAlphaColorRec(clr).B;
              bmpData[wByteIdex + 1] := TAlphaColorRec(clr).G;
              bmpData[wByteIdex + 2] := TAlphaColorRec(clr).R;
            end;
          end;
          if CurrBytesPerPixel = 4 then
          begin
            bmpData[wByteIdex + 3] := TAlphaColorRec(clr).A;
          end;
          Inc(wByteIdex, CurrBytesPerPixel);
        end;
{$ELSE}
        Pixs := ScanLine[nCol];
        for wRow := 0 to nBmpWidth - 1 do
        begin
          case CurrBytesPerPixel of
            1:
            begin
              //不支持。
            end;
            2:
            begin
              A16BitData := rgb_24_2_565(Pixs[wRow].rgbtRed, Pixs[wRow].rgbtGreen, Pixs[wRow].rgbtBlue);
              bmpData[wByteIdex + 0] := WordRec(A16BitData).Lo;
              bmpData[wByteIdex + 1] := WordRec(A16BitData).Hi;
            end;
            3,4:
            begin
              bmpData[wByteIdex + 0] := Pixs[wRow].rgbtBlue;
              bmpData[wByteIdex + 1] := Pixs[wRow].rgbtGreen;
              bmpData[wByteIdex + 2] := Pixs[wRow].rgbtRed;
            end;
          end;
          if CurrBytesPerPixel = 4 then
          begin
            bmpData[wByteIdex + 3] := $FF;
          end;
          Inc(wByteIdex, CurrBytesPerPixel);
        end;
{$ENDIF}
      end;
      AStream.WriteBuffer(bmpData, wWidth);
    end;
//    A8BitData := 0;
//    for I := 0 to FileSizeFix - 1 do
//    begin
//      AStream.WriteBuffer(A8BitData, 1);
//    end;
    Result := True;
  finally
{$IFDEF FMX}
    Unmap(Data);
{$ELSE}
{$ENDIF}
  end;
end;

procedure TFlyBitmapHelper.SaveAsBMPToStreamDef(Stream: TStream);
begin
  if not SaveAsBMPToStream(Stream) then
  begin
{$IFDEF FMX}
    raise EBitmapSavingFailed.Create(SBitmapSavingFailed);
{$ELSE}
    raise EInvalidGraphicOperation.Create(SBitmapSavingFailed);
{$ENDIF}
  end;
end;

{$IFDEF FMX}
procedure TFlyBitmapHelper.SyncLoadThumbnailFromFile(const AFileName: string; const AFitWidth, AFitHeight: Single;
  const UseEmbedded: Boolean = True);
var
  Surf: TBitmapSurface;
begin
  Surf := TBitmapSurface.Create;
  try
    if TBitmapCodecManager.LoadThumbnailFromFile(AFileName, AFitWidth, AFitHeight, UseEmbedded, Surf) then
    begin
      TThread.Synchronize(nil, procedure begin Assign(Surf); end);
    end
    else
      raise EThumbnailLoadingFailed.CreateFMT(SThumbnailLoadingFailedNamed, [AFileName]);
  finally
    Surf.Free;
  end;
end;
{$ENDIF}

end.
