{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Graphics.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.Classes, Androidapi.JNI.GraphicsContentViewText, FMX.Surfaces, FMX.Graphics, FMX.Platform;

type

{ TBitmapCodecAndroid }

  TBitmapCodecAndroid = class(TCustomBitmapCodec)
  private const
    DefaultSaveQuality = 75;
  private
    class function GetMovieSize(const FileName: string): TPoint; overload;
    class function GetMovieSize(const Stream: TStream): TPoint; overload;
    class function IsGIFStream(const Stream: TStream): Boolean;
    function LoadMovieFromStream(const Stream: TStream; const Surface: TBitmapSurface): Boolean;
    function LoadMovieFromFile(const FileName: string; const Surface: TBitmapSurface): Boolean;
    function LoadMovieFromFileScaled(const FileName: string; const Surface: TBitmapSurface;
      const FitSize: TPoint): Boolean;
    function StretchIfNeed(const SrcBitmap: JBitmap; const Bitmap: TBitmapSurface;
      const LoadOptions: JBitmapFactory_Options; const MaxSizeLimit: Cardinal): Boolean;
  public
    class function GetImageSize(const AFileName: string): TPointF; override;
    class function IsValid(const AStream: TStream): Boolean; override;
    function LoadFromFile(const AFileName: string; const Bitmap: TBitmapSurface;
      const MaxSizeLimit: Cardinal): Boolean; override;
    function LoadThumbnailFromFile(const AFileName: string; const AFitWidth, AFitHeight: Single;
      const UseEmbedded: Boolean; const Bitmap: TBitmapSurface): Boolean; override;
    function SaveToFile(const AFileName: string; const Bitmap: TBitmapSurface;
      const SaveParams: PBitmapCodecSaveParams): Boolean; override;
    function LoadFromStream(const AStream: TStream; const Bitmap: TBitmapSurface;
      const MaxSizeLimit: Cardinal): Boolean; override;
    function SaveToStream(const AStream: TStream; const Bitmap: TBitmapSurface; const Extension: string;
       const SaveParams: PBitmapCodecSaveParams): Boolean; override;
  end;

{ TAndroidGraphicsServices }

  /// <summary>Implementations of <c>IFMXContextService</c> and <c>IFMXCanvasService</c> services for Android</summary>
  TAndroidGraphicsServices = class(TInterfacedObject, IFMXContextService, IFMXCanvasService)
  private
    procedure RegisterServices;
    procedure UnregisterServices;
  public
    constructor Create;
    destructor Destroy; override;
    { IFMXContextService }
    /// <summary>Registers class of context</summary>
    procedure RegisterContextClasses;
    /// <summary>Unregisters class of context</summary>
    procedure UnregisterContextClasses;
    { IFMXCanvasService }
    /// <summary>Registers class of canvas</summary>
    procedure RegisterCanvasClasses;
    /// <summary>Unregisters class of canvas</summary>
    procedure UnregisterCanvasClasses;
  end;

implementation

uses
  Androidapi.Jni, Androidapi.JNIBridge, Androidapi.JNI.JavaTypes, Androidapi.Helpers, System.SysUtils, System.IOUtils,
  FMX.Consts, FMX.Types, FMX.Helpers.Android, FMX.Canvas.GPU, FMX.Context.GLES.Android;

{ TBitmapCodecAndroid }

class function TBitmapCodecAndroid.GetMovieSize(const FileName: string): TPoint;
var
  Stream: TFileStream;
  TempArray: TJavaArray<Byte>;
  Movie: JMovie;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    TempArray := TJavaArray<Byte>.Create(Stream.Size);
    Stream.ReadBuffer(TempArray.Data^, Stream.Size);
  finally
    Stream.Free;
  end;

  Movie := TJMovie.JavaClass.decodeByteArray(TempArray, 0, TempArray.Length);
  Result := TPoint.Create(Movie.width, Movie.height);
end;

class function TBitmapCodecAndroid.GetMovieSize(const Stream: TStream): TPoint;
var
  PrevPosition: Int64;
  TempArray: TJavaArray<Byte>;
  Movie: JMovie;
begin
  PrevPosition := Stream.Position;
  try
    TempArray := TJavaArray<Byte>.Create(Stream.Size - Stream.Position);
    Stream.ReadBuffer(TempArray.Data^, TempArray.Length);

    Movie := TJMovie.JavaClass.decodeByteArray(TempArray, 0, TempArray.Length);
    Result := TPoint.Create(Movie.width, Movie.height);
  finally
    Stream.Position := PrevPosition;
  end;
end;

function TBitmapCodecAndroid.LoadMovieFromStream(const Stream: TStream; const Surface: TBitmapSurface): Boolean;
var
  PrevPosition: Int64;
  TempArray: TJavaArray<Byte>;
  Movie: JMovie;
  Bitmap: JBitmap;
  Canvas: JCanvas;
begin
  PrevPosition := Stream.Position;
  try
    TempArray := TJavaArray<Byte>.Create(Stream.Size - Stream.Position);
    Stream.ReadBuffer(TempArray.Data^, TempArray.Length);
  finally
    Stream.Position := PrevPosition;
  end;

  Movie := TJMovie.JavaClass.decodeByteArray(TempArray, 0, TempArray.Length);
  TempArray := nil;

  Bitmap := TJBitmap.JavaClass.createBitmap(Movie.width, Movie.height, TJBitmap_Config.JavaClass.ARGB_8888);
  if Bitmap = nil then //kngstr fixed
    Exit(False);
  try
    Canvas := TJCanvas.JavaClass.init(Bitmap);
    try
      Movie.setTime(0);
      Movie.draw(Canvas, 0, 0);
    finally
      Canvas := nil;
    end;

    Result := JBitmapToSurface(Bitmap, Surface);
  finally
    Bitmap.recycle;
  end;
end;

function TBitmapCodecAndroid.LoadMovieFromFile(const FileName: string; const Surface: TBitmapSurface): Boolean;
var
  Stream: TFileStream;
  TempArray: TJavaArray<Byte>;
  Movie: JMovie;
  Bitmap: JBitmap;
  Canvas: JCanvas;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    TempArray := TJavaArray<Byte>.Create(Stream.Size);
    Stream.ReadBuffer(TempArray.Data^, Stream.Size);
  finally
    Stream.Free;
  end;

  Movie := TJMovie.JavaClass.decodeByteArray(TempArray, 0, TempArray.Length);
  TempArray := nil;

  Bitmap := TJBitmap.JavaClass.createBitmap(Movie.width, Movie.height, TJBitmap_Config.JavaClass.ARGB_8888);
  if Bitmap = nil then //kngstr fixed
    Exit(False);
  try
    Canvas := TJCanvas.JavaClass.init(Bitmap);
    try
      Movie.setTime(0);
      Movie.draw(Canvas, 0, 0);
    finally
      Canvas := nil;
    end;

    Result := JBitmapToSurface(Bitmap, Surface);
  finally
    Bitmap.recycle;
  end;
end;

function TBitmapCodecAndroid.LoadMovieFromFileScaled(const FileName: string; const Surface: TBitmapSurface;
  const FitSize: TPoint): Boolean;
var
  Stream: TFileStream;
  TempArray: TJavaArray<Byte>;
  Movie: JMovie;
  OrigBitmap, Bitmap: JBitmap;
  Canvas: JCanvas;
  OrigSize: TPoint;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    TempArray := TJavaArray<Byte>.Create(Stream.Size);
    Stream.ReadBuffer(TempArray.Data^, Stream.Size);
  finally
    Stream.Free;
  end;

  Movie := TJMovie.JavaClass.decodeByteArray(TempArray, 0, TempArray.Length);
  TempArray := nil;

  OrigSize := TPoint.Create(Movie.width, Movie.height);
  OrigBitmap := TJBitmap.JavaClass.createBitmap(OrigSize.X, OrigSize.Y, TJBitmap_Config.JavaClass.ARGB_8888);
  if OrigBitmap = nil then //kngstr fixed
    Exit(False);
  try
    Canvas := TJCanvas.JavaClass.init(OrigBitmap);
    try
      Movie.setTime(0);
      Movie.draw(Canvas, 0, 0);
    finally
      Canvas := nil;
    end;

    Movie := nil;

    Bitmap := TJBitmap.JavaClass.createBitmap(FitSize.X, FitSize.Y, TJBitmap_Config.JavaClass.ARGB_8888);
    if Bitmap = nil then //kngstr fixed
      Exit(False);
    try
      Canvas := TJCanvas.JavaClass.init(Bitmap);
      try
        Canvas.drawBitmap(OrigBitmap, TJRect.JavaClass.init(0, 0, OrigSize.X, OrigSize.Y), TJRect.JavaClass.init(0, 0,
          FitSize.X, FitSize.y), nil);
      finally
        Canvas := nil;
      end;

      Result := JBitmapToSurface(Bitmap, Surface);
    finally
      Bitmap.recycle; //kngstr fixed
    end;
  finally
    OrigBitmap.recycle;
  end;
end;

class function TBitmapCodecAndroid.GetImageSize(const AFileName: string): TPointF;
var
  Options: JBitmapFactory_Options;
begin
  if SameText(ExtractFileExt(AFileName), SGIFImageExtension) then
    Result := GetMovieSize(AFileName)
  else
  begin
    Options := TJBitmapFactory_Options.JavaClass.init;
    Options.inJustDecodeBounds := True;

    TJBitmapFactory.JavaClass.decodeFile(StringToJString(AFileName), Options);

    Result := TPointF.Create(Options.outWidth, Options.outHeight);
  end;
end;

class function TBitmapCodecAndroid.IsGIFStream(const Stream: TStream): Boolean;
begin
  Result := TImageTypeChecker.GetType(Stream) = SGIFImageExtension;
end;

class function TBitmapCodecAndroid.IsValid(const AStream: TStream): Boolean;
var
  MovieSize: TPoint;
  MemStream: TMemoryStream;
  SavePosition: Int64;
  BitmapArray: TJavaArray<Byte>;
  Options: JBitmapFactory_Options;
begin
  if IsGIFStream(AStream) then
  begin
    MovieSize := GetMovieSize(AStream);
    Result := (MovieSize.X > 0) and (MovieSize.Y > 0);
  end
  else
  try
    SavePosition := AStream.Position;
    try
      Options := TJBitmapFactory_Options.JavaClass.init;
      Options.inJustDecodeBounds := True;

      MemStream := TMemoryStream.Create;
      try
        MemStream.CopyFrom(AStream, AStream.Size);

        BitmapArray := TJavaArray<Byte>.Create(MemStream.Size);
        Move(MemStream.Memory^, BitmapArray.Data^, MemStream.Size);

        TJBitmapFactory.JavaClass.decodeByteArray(BitmapArray, 0, MemStream.Size, Options);
      finally
        MemStream.Free;
      end;

      Result := (Options.outWidth > 0) and (Options.outHeight > 0);
    finally
      AStream.Position := SavePosition;
    end;
  except
    Exit(False);
  end;
end;

function TBitmapCodecAndroid.LoadFromStream(const AStream: TStream; const Bitmap: TBitmapSurface;
  const MaxSizeLimit: Cardinal): Boolean;
var
  TempStream: TMemoryStream;
  TempArray: TJavaArray<Byte>;
  NativeBitmap: JBitmap;
  LoadOptions: JBitmapFactory_Options;
  SavePosition: Int64;
begin
  if IsGIFStream(AStream) then
    Result := LoadMovieFromStream(AStream, Bitmap)
  else
  begin
    SavePosition := AStream.Position;
    try
      TempStream := TMemoryStream.Create;
      try
        TempStream.CopyFrom(AStream, AStream.Size);

        TempArray := TJavaArray<Byte>.Create(TempStream.Size);
        Move(TempStream.Memory^, TempArray.Data^, TempStream.Size);

        LoadOptions := TJBitmapFactory_Options.JavaClass.init;
        NativeBitmap := TJBitmapFactory.JavaClass.decodeByteArray(TempArray, 0, TempStream.Size, LoadOptions);
        if NativeBitmap = nil then //kngstr fixed
          Exit(False);
        try
          if (LoadOptions.outWidth < 1) or (LoadOptions.outHeight < 1) then
            Exit(False);

          Result := StretchIfNeed(NativeBitmap, Bitmap, LoadOptions, MaxSizeLimit);
        finally
          NativeBitmap.recycle;
        end;
      finally
        TempStream.Free;
      end;
    finally
      AStream.Position := SavePosition;
    end;
  end;
end;

function TBitmapCodecAndroid.SaveToStream(const AStream: TStream; const Bitmap: TBitmapSurface;
  const Extension: string; const SaveParams: PBitmapCodecSaveParams): Boolean;
var
  NativeBitmap: JBitmap;
  SaveFormat: JBitmap_CompressFormat;
  SaveQuality: Integer;
  OutByteStream: JByteArrayOutputStream;
  ContentBytes: TJavaArray<Byte>;
begin
  if SameText(Extension, SGIFImageExtension) then
    raise EBitmapFormatUnsupported.Create(SBitmapFormatUnsupported);

  NativeBitmap := TJBitmap.JavaClass.createBitmap(Bitmap.Width, Bitmap.Height, TJBitmap_Config.JavaClass.ARGB_8888);
  if NativeBitmap = nil then //kngstr fixed
    Exit(False);
  try
    Result := SurfaceToJBitmap(Bitmap, NativeBitmap);
    if not Result then
      Exit;

    if SameText(Extension, SPNGImageExtension) then
      SaveFormat := TJBitmap_CompressFormat.JavaClass.PNG
    else
      SaveFormat := TJBitmap_CompressFormat.JavaClass.JPEG;

    OutByteStream := TJByteArrayOutputStream.JavaClass.init(0);

    SaveQuality := DefaultSaveQuality;

    if SaveParams <> nil then
      SaveQuality := SaveParams.Quality;

    Result := NativeBitmap.compress(SaveFormat, SaveQuality, OutByteStream);
  finally
    NativeBitmap.recycle;
  end;
  if Result and (OutByteStream.size > 0) then
  begin
    ContentBytes := OutByteStream.toByteArray;
    AStream.WriteBuffer(ContentBytes.Data^, OutByteStream.size);
  end;

  Result := Result and (OutByteStream.size > 0);
end;

function TBitmapCodecAndroid.StretchIfNeed(const SrcBitmap: JBitmap; const Bitmap: TBitmapSurface;
  const LoadOptions: JBitmapFactory_Options; const MaxSizeLimit: Cardinal): Boolean;
var
  R: TRectF;
  ScaledBitmap: JBitmap;
begin
  if (MaxSizeLimit > 0) and ((LoadOptions.outWidth > Integer(MaxSizeLimit)) or
    (LoadOptions.outHeight > Integer(MaxSizeLimit))) then
  begin
    R := TRectF.Create(0, 0, LoadOptions.outWidth, LoadOptions.outHeight);
    R.Fit(TRectF.Create(0, 0, MaxSizeLimit, MaxSizeLimit));
    ScaledBitmap := TJBitmap.JavaClass.createScaledBitmap(SrcBitmap, R.Truncate.Width, R.Truncate.Height, True);
    if ScaledBitmap = nil then //kngstr fixed
      Exit(False);
    try
      Result := JBitmapToSurface(ScaledBitmap, Bitmap);
    finally
      ScaledBitmap.recycle;
    end;
  end
  else
    Result := JBitmapToSurface(SrcBitmap, Bitmap);
end;

function TBitmapCodecAndroid.LoadFromFile(const AFileName: string; const Bitmap: TBitmapSurface;
  const MaxSizeLimit: Cardinal): Boolean;
var
  NativeBitmap: JBitmap;
  LoadOptions: JBitmapFactory_Options;
begin
  if SameText(ExtractFileExt(AFileName), SGIFImageExtension) then
    Result := LoadMovieFromFile(AFileName, Bitmap)
  else
  begin // PNG and JPEG formats can be loaded directly.
    LoadOptions := TJBitmapFactory_Options.JavaClass.init;
    NativeBitmap := TJBitmapFactory.JavaClass.decodeFile(StringToJString(AFileName), LoadOptions);
    if NativeBitmap = nil then
      Exit(False);
    try
      if (LoadOptions.outWidth < 1) or (LoadOptions.outHeight < 1) then
        Exit(False);

      Result := StretchIfNeed(NativeBitmap, Bitmap, LoadOptions, MaxSizeLimit);
    finally
      NativeBitmap.recycle;
    end;
  end;
end;

function TBitmapCodecAndroid.LoadThumbnailFromFile(const AFileName: string; const AFitWidth, AFitHeight: Single;
  const UseEmbedded: Boolean; const Bitmap: TBitmapSurface): Boolean;
var
  NativeBitmap1, NativeBitmap2: JBitmap;
  LoadOptions: JBitmapFactory_Options;
begin
  if SameText(ExtractFileExt(AFileName), SGIFImageExtension) then
    Result := LoadMovieFromFileScaled(AFileName, Bitmap, TPoint.Create(Round(AFitWidth), Round(AFitHeight)))
  else
  begin
    LoadOptions := TJBitmapFactory_Options.JavaClass.init;
    NativeBitmap1 := TJBitmapFactory.JavaClass.decodeFile(StringToJString(AFileName), LoadOptions);
    if NativeBitmap1 = nil then
      Exit(False);
    try
      if (LoadOptions.outWidth < 1) or (LoadOptions.outHeight < 1) then
        Exit(False);

      NativeBitmap2 := TJBitmap.JavaClass.createScaledBitmap(NativeBitmap1, Round(AFitWidth), Round(AFitHeight), True);
      if NativeBitmap2 = nil then //kngstr fixed
        Exit(False);
      try
        Result := JBitmapToSurface(NativeBitmap2, Bitmap);
      finally
        NativeBitmap2.recycle;
      end;
    finally
      NativeBitmap1.recycle;
    end;
  end;
end;

function TBitmapCodecAndroid.SaveToFile(const AFileName: string; const Bitmap: TBitmapSurface;
  const SaveParams: PBitmapCodecSaveParams): Boolean;
var
  NativeBitmap: JBitmap;
  SaveFormat: JBitmap_CompressFormat;
  OutFileStream: JFileOutputStream;
  SaveQuality: Integer;
begin
  if SameText(ExtractFileExt(AFileName), SGIFImageExtension) then
    raise EBitmapFormatUnsupported.Create(SBitmapFormatUnsupported);

  NativeBitmap := TJBitmap.JavaClass.createBitmap(Bitmap.Width, Bitmap.Height, TJBitmap_Config.JavaClass.ARGB_8888);
  if NativeBitmap = nil then //kngstr fixed
    Exit(False);
  try
    Result := SurfaceToJBitmap(Bitmap, NativeBitmap);
    if not Result then
      Exit;

    if SameText(ExtractFileExt(AFileName), SPNGImageExtension) then
      SaveFormat := TJBitmap_CompressFormat.JavaClass.PNG
    else
      SaveFormat := TJBitmap_CompressFormat.JavaClass.JPEG;

    OutFileStream := TJFileOutputStream.JavaClass.init(StringToJString(AFileName));

    SaveQuality := DefaultSaveQuality;

    if SaveParams <> nil then
      SaveQuality := SaveParams.Quality;

    Result := NativeBitmap.compress(SaveFormat, SaveQuality, OutFileStream);
  finally
    NativeBitmap.recycle;
  end;
end;

{ TAndroidGraphicsServices }

constructor TAndroidGraphicsServices.Create;
begin
  inherited;
  RegisterServices;
end;

destructor TAndroidGraphicsServices.Destroy;
begin
  UnregisterServices;
  inherited;
end;

procedure TAndroidGraphicsServices.RegisterCanvasClasses;
begin
  FMX.Canvas.GPU.RegisterCanvasClasses;
end;

procedure TAndroidGraphicsServices.RegisterContextClasses;
begin
  FMX.Context.GLES.Android.RegisterContextClasses;
end;

procedure TAndroidGraphicsServices.RegisterServices;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXContextService) then
    TPlatformServices.Current.AddPlatformService(IFMXContextService, Self);
  if not TPlatformServices.Current.SupportsPlatformService(IFMXCanvasService) then
    TPlatformServices.Current.AddPlatformService(IFMXCanvasService, Self);
end;

procedure TAndroidGraphicsServices.UnregisterCanvasClasses;
begin
  FMX.Canvas.GPU.UnregisterCanvasClasses;
end;

procedure TAndroidGraphicsServices.UnregisterContextClasses;
begin
  FMX.Context.GLES.Android.UnregisterContextClasses;
end;

procedure TAndroidGraphicsServices.UnregisterServices;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXContextService);
  TPlatformServices.Current.RemovePlatformService(IFMXCanvasService);
end;

initialization
  TBitmapCodecManager.RegisterBitmapCodecClass(SJPGImageExtension, SVJPGImages, True, TBitmapCodecAndroid);
  TBitmapCodecManager.RegisterBitmapCodecClass(SJPEGImageExtension, SVJPGImages, True, TBitmapCodecAndroid);
  TBitmapCodecManager.RegisterBitmapCodecClass(SPNGImageExtension, SVPNGImages, True, TBitmapCodecAndroid);
  TBitmapCodecManager.RegisterBitmapCodecClass(SGIFImageExtension, SVPNGImages, True, TBitmapCodecAndroid);
end.
