(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2018-10-31　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.3.1(10.3 Release 1)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)

{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2012-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Media.Mac;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, Macapi.ObjectiveC, Macapi.CocoaTypes, Macapi.QTKit, Macapi.AVFoundation, Macapi.CoreMedia,
  FMX.Helpers.Mac, FMX.Media, FMX.Media.AVFoundation, FMX.Graphics;

type

  /// <summary>AVFoundation delegate specialization for OSX.</summary>
  TAVVideoSampleDelegate = class(TVideoSampleDelegateBase, AVCaptureVideoDataOutputSampleBufferDelegate)
  public
    /// <summary>Constructor with a device.</summary>
    constructor Create(const ACaptureDevice: TAVVideoCaptureDeviceBase);
    /// <summary>Delegate selector for captured video buffer.</summary>
    procedure captureOutput(captureOutput: AVCaptureOutput; didOutputSampleBuffer: CMSampleBufferRef;
      fromConnection: AVCaptureConnection); cdecl;
  end;

{ TQTCaptureDeviceManager }

  TQTCaptureDeviceManager = class(TCaptureDeviceManager)
  private
  protected
  public
    constructor Create; override;
  end;

{ TQTAudioCaptureDevice }

  TQTAudioCaptureDevice = class(TAudioCaptureDevice)
  private
    FDevice: QTCaptureDevice;
    FCaptureSession: QTCaptureSession;
    FCaptureInput: QTCaptureDeviceInput;
    FCaptureOutput: QTCaptureFileOutput;
  protected
    procedure DoStartCapture; override;
    procedure DoStopCapture; override;
    function GetDeviceProperty(const Prop: TCaptureDevice.TProperty): string; override;
    function GetDeviceState: TCaptureDeviceState; override;
    function GetFilterString: string; override;
  public
    constructor Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean; const ADevice: QTCaptureDevice); reintroduce;
  end;

{ TQTVideoCaptureDevice }

  TQTVideoCaptureDevice = class;

  TCaptureVideoPreviewOutputDelegate = class(TOCLocal, QTCaptureVideoPreviewOutput_Delegate)
  public
    FDevice: TQTVideoCaptureDevice;
    procedure captureOutput(captureOutput: QTCaptureOutput; didOutputVideoFrame: CVImageBufferRef;
      withSampleBuffer: QTSampleBuffer; fromConnection: QTCaptureConnection); cdecl;
  end;

  TQTVideoCaptureDevice = class(TVideoCaptureDevice)
  private
    FDevice: QTCaptureDevice;
    FCaptureSession: QTCaptureSession;
    FCaptureVideoDeviceInput: QTCaptureDeviceInput;
    FCaptureVideoPreviewOutput: QTCaptureVideoPreviewOutput;
    FDelegate: TCaptureVideoPreviewOutputDelegate;
    FVideoFrame: CVImageBufferRef;
    FCaptureSetting: TVideoCaptureSetting;
    procedure CallFromDelegate(AVideoFrame: CVImageBufferRef);
    procedure SyncCall;
  protected
    procedure DoStartCapture; override;
    procedure DoStopCapture; override;
    procedure DoSampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean); override;
    function GetDeviceProperty(const Prop: TCaptureDevice.TProperty): string; override;
    function GetDeviceState: TCaptureDeviceState; override;
    /// <summary>Inherited from TVideoCaptureDevice.</summary>
    function GetCaptureSetting: TVideoCaptureSetting; override;
    /// <summary>Inherited from TVideoCaptureDevice.</summary>
    function DoSetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean; override;
    /// <summary>Inherited from TVideoCaptureDevice.</summary>
    function DoGetAvailableCaptureSettings: TArray<TVideoCaptureSetting>; override;
    /// <summary>Inherited from TVideoCaptureDevice.</summary>
    procedure DoSetQuality(const Value: TVideoCaptureQuality); override;
  public
    constructor Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean; const ADevice: QTCaptureDevice); reintroduce;
    destructor Destroy; override;
  end;

{ TQTMedia }

  TQTMedia = class(TMedia)
  private
    FMovie: QTMovie;
    FMovieView: QTMovieView;
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; override;
    function GetDuration: TMediaTime; override;
    function GetCurrent: TMediaTime; override;
    procedure SetCurrent(const Value: TMediaTime); override;
    function GetVideoSize: TPointF; override;
    function GetMediaState: TMediaState; override;
    function GetVolume: Single; override;
    procedure SetVolume(const Value: Single); override;
    procedure UpdateMediaFromControl; override;
    procedure DoPlay; override;
    procedure DoStop; override;
  public
    constructor Create(const AFileName: string); override;
    destructor Destroy; override;
//Fix By Flying Wang and 爱吃猪头肉.
  private
    FStretch: Boolean;
    FProportional: Boolean;
    procedure SetStretch(const Value: Boolean); override;
    procedure SetProportional(const Value: Boolean); override;
    function GetStretch: Boolean; override;
    function GetProportional: Boolean; override;
  public
    function GetRealWebMediaObject: IUnknown; override;
  end;

{ TQTMediaCodec }

  TQTMediaCodec = class(TCustomMediaCodec)
  public
    function CreateFromFile(const AFileName: string): TMedia; override;
  end;

implementation

uses
  Macapi.Foundation, Macapi.Dispatch, Macapi.CoreVideo, Macapi.CoreGraphics, Macapi.CoreFoundation, Macapi.AppKit,
  Macapi.Quicktime, Macapi.Helpers, FMX.Consts, FMX.Types, FMX.Types3D,FMX.Forms,FMX.Canvas.Mac, FMX.Platform.Mac,
  System.Variants, System.UITypes, System.Classes, System.SysUtils, System.Math, System.Generics.Collections,
  System.RTLConsts;

const
  PresetCaptureWidth: array[0..7] of Integer = (160, 320, 352, 640, 720, 960, 1280, 1920);
  PresetCaptureHeight: array[0..7] of Integer = (120, 240, 288, 480, 480, 540, 720, 1080);
  PresetCaptureFramerate: array[0..7] of Integer = (30, 30, 30, 30, 30, 30, 30, 30);
  DefaultPresetCaptureWidthIndex = 3;
  DefaultPresetCaptureHeightIndex = 3;
  DefaultPresetCaptureFramerateIndex = 3;

{ TQTCaptureDeviceManager }

constructor TQTCaptureDeviceManager.Create;
var
  I: Integer;
  DP: Pointer;
  D: QTCaptureDevice;
begin
  inherited;
  for I := 0 to Integer(TQTCaptureDevice.OCClass.inputDevicesWithMediaType(QTMediaTypeSound).count) - 1 do
  begin
    DP := TQTCaptureDevice.OCClass.inputDevicesWithMediaType(QTMediaTypeSound).objectAtIndex(I);
    D := TQTCaptureDevice.Wrap(DP);
    TQTAudioCaptureDevice.Create(Self, TQTCaptureDevice.OCClass.defaultInputDeviceWithMediaType(QTMediaTypeSound) = DP, D);
  end;
  for I := 0 to Integer(TQTCaptureDevice.OCClass.inputDevicesWithMediaType(QTMediaTypeVideo).count) - 1 do
  begin
    DP := TQTCaptureDevice.OCClass.inputDevicesWithMediaType(QTMediaTypeVideo).objectAtIndex(I);
    D := TQTCaptureDevice.Wrap(DP);
    TQTVideoCaptureDevice.Create(Self, TQTCaptureDevice.OCClass.defaultInputDeviceWithMediaType(QTMediaTypeVideo) = DP, D);
  end;
end;

{ TQTAudioCaptureDevice }

constructor TQTAudioCaptureDevice.Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean; const ADevice: QTCaptureDevice);
begin
  inherited Create(AManager, ADefault);
  FDevice := ADevice;
end;

procedure TQTAudioCaptureDevice.DoStartCapture;
var
  URL: NSUrl;
  Error: NSError;
begin
  FDevice.open(Error);
  if Error <> nil then Exit;

  FCaptureSession := TQTCaptureSession.Create;

  FCaptureInput := TQTCaptureDeviceInput.Wrap(TQTCaptureDeviceInput.OCClass.deviceInputWithDevice(FDevice));
  FCaptureSession.addInput(FCaptureInput, Error);

  URL := TNSUrl.Wrap(TNSUrl.OCClass.fileURLWithPath(StrToNSStr(FileName)));

  FCaptureOutput := TQTCaptureMovieFileOutput.Create;

  FCaptureSession.addOutput(FCaptureOutput, Error);
  if Error <> nil then Exit;

  FCaptureSession.startRunning;
  FCaptureOutput.recordToOutputFileURL(URL);
end;

procedure TQTAudioCaptureDevice.DoStopCapture;
begin
  if FCaptureSession <> nil then
  begin
    FCaptureOutput.recordToOutputFileURL(nil);
    FCaptureSession.stopRunning;

    FCaptureInput := nil;
    FCaptureOutput := nil;
    FCaptureSession := nil;

    FDevice.close;
  end;
end;

function TQTAudioCaptureDevice.GetDeviceProperty(const Prop: TCaptureDevice.TProperty): string;
begin
  if FDevice <> nil then
  begin
    case Prop of
      TProperty.Description: Result := '';
      TProperty.Name: Result := UTF8ToString(FDevice.localizedDisplayName.UTF8String);
      TProperty.UniqueID: Result := UTF8ToString(FDevice.uniqueID.UTF8String);
    else
      Result := '';
    end;
  end
  else
    Result := '';
end;

function TQTAudioCaptureDevice.GetDeviceState: TCaptureDeviceState;
begin
  if FCaptureSession <> nil then
    Result := TCaptureDeviceState.Capturing
  else
    Result := TCaptureDeviceState.Stopped;
end;

function TQTAudioCaptureDevice.GetFilterString: string;
begin
  Result := SVWAVFiles + '(*.wav)|*.wav';
end;

{ TCaptureVideoPreviewOutputDelegate }

procedure TCaptureVideoPreviewOutputDelegate.captureOutput(captureOutput: QTCaptureOutput;
  didOutputVideoFrame: CVImageBufferRef; withSampleBuffer: QTSampleBuffer; fromConnection: QTCaptureConnection);
begin
  FDevice.CallFromDelegate(didOutputVideoFrame);
end;

{ TQTVideoCaptureDevice }

constructor TQTVideoCaptureDevice.Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean; const ADevice: QTCaptureDevice);
begin
  inherited Create(AManager, ADefault);
  FDevice := ADevice;
  FCaptureSession := TQTCaptureSession.Create;
  // There is no limit so we init the preview setting with some values
  FCaptureSetting := TVideoCaptureSetting.Create(PresetCaptureWidth[DefaultPresetCaptureWidthIndex],
    PresetCaptureHeight[DefaultPresetCaptureHeightIndex], PresetCaptureFramerate[DefaultPresetCaptureFramerateIndex]);
end;

destructor TQTVideoCaptureDevice.Destroy;
begin
  inherited;
end;

procedure TQTVideoCaptureDevice.SyncCall;
begin
  SampleBufferReady(0);
end;

procedure TQTVideoCaptureDevice.CallFromDelegate(AVideoFrame: CVImageBufferRef);
begin
  FVideoFrame := AVideoFrame;
  CVBufferRetain(FVideoFrame);
  try
    TThread.Synchronize(TThread.CurrentThread, SyncCall);
  finally
    CVBufferRelease(FVideoFrame);
    FVideoFrame := 0;
  end;
end;

function CGRectFromRect(const R: TRectF): CGRect;
begin
  Result.origin.x := R.Left;
  Result.origin.Y := R.Top;
  Result.size.Width := R.Right - R.Left;
  Result.size.Height := R.Bottom - R.Top;
end;

function TQTVideoCaptureDevice.DoGetAvailableCaptureSettings: TArray<TVideoCaptureSetting>;
var
  List: TList<TVideoCaptureSetting>;
  I: Integer;
begin
  List := TList<TVideoCaptureSetting>.Create;
  try
    // Since there is no limit in QT, we emulate some common implementations in order to the user can
    // work as the same way than with others platforms
    for I := 0 to High(PresetCaptureWidth) do
      List.Add(TVideoCaptureSetting.Create(PresetCaptureWidth[I], PresetCaptureHeight[I], PresetCaptureFramerate[I]));
    Result := List.ToArray;
  finally
    List.Free;
  end;
end;

procedure TQTVideoCaptureDevice.DoSampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean);
const
  BitsPerComponent = 8;
  BitsPerPixel = 32;
var
  BytesPerRow, Width, Height, BufferSize: Integer;
  BaseAddress: Pointer;
  DataProvider: CGDataProviderRef;
  ImageRef: CGImageRef;
  ColorSpace: CGColorSpaceRef;
  BitmapData: TBitmapData;
  ContextRef: CGContextRef;
begin
  if CVPixelBufferLockBaseAddress(FVideoFrame, 0) <> 0 then
    raise EVideoCaptureFault.Create(SVideoCaptureFault);
  try
    BytesPerRow := CVPixelBufferGetBytesPerRow(FVideoFrame);
    Width := CVPixelBufferGetWidth(FVideoFrame);
    Height := CVPixelBufferGetHeight(FVideoFrame);
    BaseAddress := CVPixelBufferGetBaseAddress(FVideoFrame);
    BufferSize := CVPixelBufferGetDataSize(FVideoFrame);
    ColorSpace := CGColorSpaceCreateDeviceRGB;
    if ColorSpace = nil then
      raise EVideoCaptureFault.Create(SVideoCaptureFault);
    try
      DataProvider := CGDataProviderCreateWithData(nil, BaseAddress, BufferSize, nil);
      try
        ImageRef := CGImageCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, ColorSpace,
          kCGImageAlphaNoneSkipFirst or kCGBitmapByteOrder32Little, DataProvider, nil, 1, kCGRenderingIntentDefault);
        try
          if ASetSize then
            ABitmap.SetSize(Width, Height);
          if ABitmap.Map(TMapAccess.Write, BitmapData) then
          try
            ContextRef := CGBitmapContextCreate(BitmapData.Data, ABitmap.Width, ABitmap.Height, 8, BitmapData.Pitch,
              ColorSpace, kCGImageAlphaPremultipliedLast);
            if ContextRef = nil then
              raise EVideoCaptureFault.Create(SVideoCaptureFault);
            try
              CGContextDrawImage(ContextRef, CGRectFromRect(TRectF.Create(0, 0, ABitmap.Width, ABitmap.Height)),
                ImageRef);
            finally
              CGContextRelease(ContextRef);
            end;
          finally
            ABitmap.Unmap(BitmapData);
          end;
        finally
          CGImageRelease(ImageRef);
        end;
      finally
        CGDataProviderRelease(DataProvider);
      end;
    finally
      CGColorSpaceRelease(ColorSpace);
    end;
  finally
    CVPixelBufferUnlockBaseAddress(FVideoFrame, 0);
  end;
end;

function TQTVideoCaptureDevice.DoSetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean;
begin
  FCaptureSetting := ASetting;
  Result := True;
end;

procedure TQTVideoCaptureDevice.DoSetQuality(const Value: TVideoCaptureQuality);
begin
  if Value <> TVideoCaptureQuality.CaptureSettings then
  begin
    case Value of
      TVideoCaptureQuality.PhotoQuality:
        SetCaptureSetting(TVideoCaptureSetting.Create(PresetCaptureWidth[High(PresetCaptureWidth)],
          PresetCaptureHeight[High(PresetCaptureHeight)], PresetCaptureFramerate[High(PresetCaptureFramerate)]));
      TVideoCaptureQuality.HighQuality:
        SetCaptureSetting(TVideoCaptureSetting.Create(PresetCaptureWidth[High(PresetCaptureWidth)],
          PresetCaptureHeight[High(PresetCaptureHeight)], PresetCaptureFramerate[High(PresetCaptureFramerate)]));
      TVideoCaptureQuality.MediumQuality:
        SetCaptureSetting(TVideoCaptureSetting.Create(PresetCaptureWidth[High(PresetCaptureWidth) div 2],
          PresetCaptureHeight[High(PresetCaptureHeight) div 2], PresetCaptureFramerate[High(PresetCaptureFramerate) div 2]));
      TVideoCaptureQuality.LowQuality:
        SetCaptureSetting(TVideoCaptureSetting.Create(PresetCaptureWidth[0], PresetCaptureHeight[0], PresetCaptureFramerate[0]));
    end;
  end;
  inherited;
end;

procedure TQTVideoCaptureDevice.DoStartCapture;
  function GetCaptureSettings(AWidth, AHeight: Integer): NSMutableDictionary;
  begin
    Result := TNSMutableDictionary.Create;
    Result.setObject(TNSNumber.OCClass.numberWithInt(AWidth), Pointer(kCVPixelBufferWidthKey));
    Result.setObject(TNSNumber.OCClass.numberWithInt(AHeight), Pointer(kCVPixelBufferHeightKey));
    Result.setObject(TNSNumber.OCClass.numberWithInt(kCVPixelFormatType_32BGRA), Pointer(kCVPixelBufferPixelFormatTypeKey));
  end;
var
  I: Integer;
  Error: NSError;
  PixelBufferAttributes: NSDictionary;
  Inputs, Outputs: NSArray;
  Input: QTCaptureInput;
  Output: QTCaptureOutput;
begin
  FDevice.open(Error);
  if Error <> nil then Exit;

  // Remove all inputs
  Inputs := FCaptureSession.inputs;
  if (Inputs <> nil) and (Inputs.count > 0) then
    for I := 0 to Inputs.count - 1 do
    begin
      Input := TQTCaptureInput.Wrap(Inputs.objectAtIndex(I));
      FCaptureSession.removeInput(Input);
    end;

  // Remove all outputs
  Outputs := FCaptureSession.outputs;
  if (Outputs <> nil) and (Outputs.count > 0) then
    for I := 0 to Outputs.count - 1 do
    begin
      Output := TQTCaptureOutput.Wrap(Outputs.objectAtIndex(I));
      FCaptureSession.removeOutput(Output);
    end;

  FCaptureVideoDeviceInput := TQTCaptureDeviceInput.Wrap(TQTCaptureDeviceInput.OCClass.deviceInputWithDevice(FDevice));
  FCaptureSession.addInput(FCaptureVideoDeviceInput, Error);

  FDelegate := TCaptureVideoPreviewOutputDelegate.Create;
  FDelegate.FDevice := Self;

  FCaptureVideoPreviewOutput := TQTCaptureVideoPreviewOutput.Create;

  FCaptureVideoPreviewOutput.setDelegate(FDelegate.GetObjectID);
  PixelBufferAttributes := GetCaptureSettings(FCaptureSetting.Width, FCaptureSetting.Height);
  FCaptureVideoPreviewOutput.setPixelBufferAttributes(PixelBufferAttributes);

  FCaptureSession.addOutput(FCaptureVideoPreviewOutput, Error);

  FCaptureSession.startRunning;
end;

procedure TQTVideoCaptureDevice.DoStopCapture;
begin
  if FCaptureSession <> nil then
  begin
    FCaptureSession.stopRunning;

    FCaptureVideoDeviceInput := nil;
    FCaptureVideoPreviewOutput := nil;
    FreeAndNil(FDelegate);

    FDevice.close;
  end;
end;

function TQTVideoCaptureDevice.GetDeviceProperty(const Prop: TCaptureDevice.TProperty): string;
begin
  if FDevice <> nil then
  begin
    case Prop of
      TProperty.Description: Result := '';
      TProperty.Name: Result := UTF8ToString(FDevice.localizedDisplayName.UTF8String);
      TProperty.UniqueID: Result := UTF8ToString(FDevice.uniqueID.UTF8String);
    else
      Result := '';
    end;
  end
  else
    Result := '';
end;

function TQTVideoCaptureDevice.GetDeviceState: TCaptureDeviceState;
begin
  if FCaptureSession <> nil then
    Result := TCaptureDeviceState.Capturing
  else
    Result := TCaptureDeviceState.Stopped;
end;

function TQTVideoCaptureDevice.GetCaptureSetting: TVideoCaptureSetting;
begin
  Result := FCaptureSetting;
end;

{ TQTMedia }

constructor TQTMedia.Create(const AFileName: string);
var
  URL: NSUrl;
  Error: NSError;
begin
  inherited Create(AFileName);
  //Fix By Flying Wang and 爱吃猪头肉.
  FStretch := True;
  FProportional := True;
  QTMediaTypeSound; // force load framework

  if FileExists(FileName) then
    URL := TNSUrl.Wrap(TNSUrl.OCClass.fileURLWithPath(StrToNSStr(FileName)))
  else
    URL := TNSUrl.Wrap(TNSUrl.OCClass.URLWithString(StrToNSStr(FileName)));

  if URL = nil then
    raise EFileNotFoundException.Create(SFileNotFound);

  FMovie := TQTMovie.Wrap(TQTMovie.OCClass.movieWithURL(URL, Error));
  FMovieView := TQTMovieView.Create;
  FMovieView := TQTMovieView.Wrap(FMovieView.initWithFrame(MakeNSRect(0, 0, 0, 0)));
  FMovieView.setControllerVisible(False);
  FMovieView.setAutoresizingMask(NSViewMinYMargin);
  //Fix By Flying Wang and 爱吃猪头肉.
  if Stretch and Proportional then
  begin
  //FMovieView.setAutoresizingMask(NSViewMinYMargin);
    FMovieView.setAutoresizingMask(NSViewMinXMargin and NSViewMinYMargin);
  end
  else if Proportional then
  begin
    FMovieView.setAutoresizingMask(NSViewNotSizable);
  end
  else
  begin
    FMovieView.setAutoresizingMask(NSViewMaxXMargin and NSViewMaxYMargin);
  end;
  FMovieView.setMovie(FMovie);
end;

destructor TQTMedia.Destroy;
begin
  if FMovie <> nil then
    FMovie.stop;

  if FMovieView <> nil then
  begin
    FMovieView.setMovie(nil);
    FMovieView.removeFromSuperview;
  end;

  FMovie := nil;
  FMovieView := nil;
  inherited Destroy;
end;

function TQTMedia.GetCurrent: TMediaTime;
begin
  if (FMovie <> nil) then
    Result := Trunc(FMovie.currentTime.timeValue / FMovie.currentTime.timeScale * MediaTimeScale)
  else
    Result := 0;
end;

function TQTMedia.GetDuration: TMediaTime;
begin
  if (FMovie <> nil) then
    Result := Trunc(FMovie.duration.timeValue / FMovie.duration.timeScale * MediaTimeScale)
  else
    Result := 0;
end;

function TQTMedia.GetMediaState: TMediaState;
begin
  if (FMovie <> nil) then
  begin
    if FMovie.Rate > 0 then
      Result := TMediaState.Playing
    else
      Result := TMediaState.Stopped
  end
  else
    Result := TMediaState.Unavailable;
end;

function TQTMedia.GetVideoSize: TPointF;
var
  V: NSValue;
  S: NSSize;
begin
  Result := TPointF.Zero;
  if (FMovie <> nil) then
  begin
    V := TNSValue.Wrap(FMovie.attributeForKey(QTMovieNaturalSizeAttribute));
    if V <> nil then
    begin
      S := V.sizeValue;
      Result := TPointF.Create(S.width, S.height);
    end;
  end;
end;

function TQTMedia.GetVolume: Single;
begin
  if (FMovie <> nil) then
    Result := FMovie.volume
  else
    Result := 1.0;
end;

function TQTMedia.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := E_NOTIMPL;
  if (FMovie <> nil) and (FMovie.QueryInterface(IID, Obj) = S_OK) then
    Exit(S_OK);
  if (FMovieView <> nil) and (FMovieView.QueryInterface(IID, Obj) = S_OK) then
    Exit(S_OK);
end;

procedure TQTMedia.SetCurrent(const Value: TMediaTime);
var
  T: QTTime;
begin
  if (FMovie <> nil) then
  begin
    T.timeValue := Value;
    T.timeScale := MediaTimeScale;
    T.flags := 0;
    FMovie.setCurrentTime(T);
  end;
end;

procedure TQTMedia.SetVolume(const Value: Single);
begin
  if (FMovie <> nil) then
    FMovie.setVolume(Value);
end;

procedure TQTMedia.UpdateMediaFromControl;
var
  View: NSView;
  Bounds: TRectF;
  P: TPointF;
  Form: TCommonCustomForm;
begin
  if FMovieView <> nil then
  begin
    if (Control <> nil) and not (csDesigning in Control.ComponentState) and
      (Control.Root <> nil) and (Control.Root.GetObject is TCommonCustomForm) then
    begin
      Form := TCommonCustomForm(Control.Root.GetObject);
      if Control.ParentedVisible then
      begin
        P := GetVideoSize;
        //Fix By Flying Wang.
        if Stretch then
          Bounds := TRectF.Create(0, 0, Control.AbsoluteWidth, Control.AbsoluteHeight)
        else
        Bounds := TRectF.Create(0, 0, P.X, P.Y);
      end
      else
        // we should move it into invisible area
        // if we make it invisible by calling setHidden playing media will stop
        Bounds := TRectF.Create(-2, -2, -1, -1);
      Bounds.Fit(Control.AbsoluteRect);
      //Fix By Flying Wang and 爱吃猪头肉.
      if Stretch and Proportional then
      begin
        FMovieView.setAutoresizingMask(NSViewMinXMargin and NSViewMinYMargin);
      end
      else if Proportional then
      begin
        FMovieView.setAutoresizingMask(NSViewNotSizable);
      end
      else
      begin
        FMovieView.setAutoresizingMask(NSViewMaxXMargin and NSViewMaxYMargin);
      end;
      View := TNSView.Wrap(WindowHandleToPlatform(Form.Handle).Wnd.contentView);
      View.addSubview(FMovieView, NSWindowBelow, nil);
      FMovieView.setFrame(MakeNSRect(Bounds.Left, Form.ClientHeight - Bounds.Bottom, Bounds.Width, Bounds.Height));
      FMovieView.setHidden(False);
    end
    else
      FMovieView.setHidden(True);
  end;
end;

procedure TQTMedia.DoStop;
begin
  if FMovie <> nil then
    FMovie.stop;
end;

procedure TQTMedia.DoPlay;
begin
  if FMovie <> nil then
    FMovie.play;
end;

//Fix By Flying Wang and 爱吃猪头肉.
procedure TQTMedia.SetStretch(const Value: Boolean);
begin
  FStretch := Value;
  UpdateMediaFromControl;
end;

procedure TQTMedia.SetProportional(const Value: Boolean);
begin
  FProportional := Value;
  UpdateMediaFromControl;
end;

function TQTMedia.GetStretch: Boolean;
begin
  Result := FStretch;
end;

function TQTMedia.GetProportional: Boolean;
begin
  Result := FProportional;
end;

function TQTMedia.GetRealWebMediaObject: IUnknown;
begin
  Result := FMovieView;
end;

{ TQTMediaCodec }

function TQTMediaCodec.CreateFromFile(const AFileName: string): TMedia;
begin
  Result := TQTMedia.Create(AFileName);
end;

{ TVideoSampleDelegate }

constructor TAVVideoSampleDelegate.Create(const ACaptureDevice: TAVVideoCaptureDeviceBase);
begin
  inherited;
  FIsProcessingCapture := False;
end;

procedure TAVVideoSampleDelegate.captureOutput(captureOutput: AVCaptureOutput; didOutputSampleBuffer: CMSampleBufferRef;
  fromConnection: AVCaptureConnection);
begin
  FIsProcessingCapture := True;
  try
    FCaptureDevice.SampleDelegate(didOutputSampleBuffer);
  finally
    FIsProcessingCapture := False;
  end;
end;


initialization
  TMediaCodecManager.RegisterMediaCodecClass('.mov', SVMOVFiles, TMediaType.Video, TQTMediaCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.m4v', SVM4VFiles, TMediaType.Video, TQTMediaCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.mp4', SVMP4Files, TMediaType.Video, TQTMediaCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.avi', SVAviFiles, TMediaType.Video, TQTMediaCodec);

  TMediaCodecManager.RegisterMediaCodecClass('.wav', SVWAVFiles, TMediaType.Audio, TQTMediaCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.m4a', SVM4AFiles, TMediaType.Audio, TQTMediaCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.caf', SVCAFFiles, TMediaType.Audio, TQTMediaCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.mp3', SVMP3Files, TMediaType.Audio, TQTMediaCodec);

  TMediaCodecManager.RegisterMediaCodecClass(SAllFilesExt, SDefault, TMediaType.Video, TQTMediaCodec);
end.
