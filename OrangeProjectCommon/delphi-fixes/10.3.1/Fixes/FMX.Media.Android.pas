//https://quality.embarcadero.com/browse/RSP-13208
//https://quality.embarcadero.com/browse/RSP-19678
//https://quality.embarcadero.com/browse/RSP-23791
(*　仅支持 RAD10.3.1(10.3 Release 1)，其他版本请自行修改　*)

{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2012-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Media.Android;

interface

{$SCOPEDENUMS ON}

uses
  Androidapi.JNI.Media, Androidapi.JNI.VideoView, Androidapi.JNI.App, Androidapi.JNI.Widget, System.Types,
  System.Messaging, FMX.Media, Androidapi.JNI.Embarcadero, FMX.Platform.Android, Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.JavaTypes, FMX.ZOrder.Android;

type
  TAndroidCaptureDeviceManager = class(TCaptureDeviceManager)
  public
    constructor Create; override;
  end;

  TAndroidMedia = class(TMedia)
  private
    FPlayer: JMediaPlayer;
    FVolume: Single;
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; override;
    procedure SeekToBegin;
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

  TAndroidMediaCodec = class(TCustomMediaCodec)
  public
    function CreateFromFile(const AFileName: string): TMedia; override;
  end;

  TAndroidVideo = class(TMedia)
  private
    type
      TCommonVolume = class
      strict private
        FAudioService: JObject;
        FAudioManager: JAudioManager;
        FMaxVolume: Integer;
        procedure SetVolume(const Value: Single);
        function GetVolume: Single;
      public
        constructor Create;
        property Value: Single read GetVolume write SetVolume;
      end;
  private
    FVolume: TCommonVolume;
    FScale: Single;
    FJustAudio: TAndroidMedia;
    FVideoPlayer: JVideoView;
    FVideoSize: TSize;
    FVideoEnabled: Boolean;
    function AllAssigned: Boolean;
    procedure RealignView;
    procedure RetreiveVideoSize;
    procedure CheckVideo;
    procedure InitInstance;
    function InstanceCreated: Boolean;
    function IsVideoEnabled: Boolean;
    function GetZOrderManager: TAndroidZOrderManager;
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; override;
    procedure SeekToBegin;
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
    property ZOrderManager: TAndroidZOrderManager read GetZOrderManager;
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

  TAndroidVideoCodec = class(TCustomMediaCodec)
  public
    function CreateFromFile(const AFileName: string): TMedia; override;
  end;

implementation

uses
  System.Classes,  System.RTLConsts,System.Threading, System.Math, System.Permissions, System.SysUtils, System.SyncObjs,
  System.Generics.Collections, Androidapi.Bitmap, Androidapi.JNI.Hardware, Androidapi.Gles, Androidapi.JNI.Os,
  Androidapi.Helpers, FMX.Consts, FMX.Types, FMX.Surfaces, FMX.Graphics, FMX.Helpers.Android, FMX.Forms, FMX.Platform;

const
  THEME_DARK_NOTITLE_FULLSCREEN = $0103000A;

type
  TVideoInstance = record
    VideoPlayer: JVideoView;
  end;

  TVideoPool = class
  private
    FUsed: TList<TVideoInstance>;
    FReadyToUse: TList<TVideoInstance>;
    procedure CreateOneMoreInstance;
    procedure UIFreezeInstance(const AInstance: TVideoInstance);
  public
    function UIGetInstance: TVideoInstance;
    procedure UIReturnInstance(const AInstance: TVideoInstance);
    destructor Destroy; override;
    constructor Create;
  end;

var
  VideoPool: TVideoPool;

{$REGION 'Local Class Declarations'}

type
  TAndroidAudioCaptureDevice = class(TAudioCaptureDevice)
  private
    FRecorder: JMediaRecorder;
  protected
    procedure DoStartCapture; override;
    procedure DoStopCapture; override;
    function GetDeviceState: TCaptureDeviceState; override;
  public
    destructor Destroy; override;
  end;

  TAndroidVideoCaptureDevice = class;

  TAndroidVideoCaptureCallback = class(TJavaLocal, JCamera_PreviewCallback)
  private
    [Weak] FCaptureDevice: TAndroidVideoCaptureDevice;
  public
    procedure onPreviewFrame(AData: TJavaArray<Byte>; ACamera: JCamera); cdecl;
  end;

  TAndroidVideoCaptureDevice = class(TVideoCaptureDevice)
  private const
    HighestJpegQuality = 100;
    MediumJpegQuality = 75;
    LowestJpegQuality = 50;
    DefaultCaptureTimeInterval = 33;
    JPEGQualityKey = 'jpeg-quality';

  private
    SurfaceSection: TCriticalSection;
    UpdatedSection: TCriticalSection;
    QueueSection: TCriticalSection;

    FCameraId: Integer;
    FCapturing: Boolean;
    FCaptureTimerInterval: Integer;
    FVideoConversionJPEGQuality: Integer;
    PreviewBufferSize: TPoint;
    SharedBuffer: TJavaArray<Byte>;
    SharedBufferSize: TPoint;
    SharedBufferBytes: Integer;
    QueuedBufferCount: Integer;
    SharedBufferFormat: Integer;
    SharedSurface: TBitmapSurface;
    SharedSurfaceUpdated: Boolean;
    SurfaceTexture: JSurfaceTexture;
    SurfaceTextureId: GLuint;
    CapturePollingTimer: TTimer;
    ManualBitmapRotation: Integer;
    FOrientationChangedId: Integer;
    FPreviewConversionTask: ITask;
    class var FCallback: TAndroidVideoCaptureCallback;
    class var FCurrentCamera: JCamera;
    class var FCurrentCameraID: Integer;

    function GetManualBitmapRotation: Integer;
    procedure CopyBufferToSurface(AnArray: TJavaArray<Byte>; ACamera: JCamera);
    procedure ConvertYuvToBitmapSurfaceHandler(Sender: TObject);
    function GetCamera: JCamera;
    procedure AddQueueBuffer;
    procedure RemoveQueueBuffer;
    procedure OnCaptureTimer(Sender: TObject);
    procedure OrientationChangedHandler(const Sender: TObject; const Msg: TMessage);
  protected
    procedure DoStartCapture; override;
    procedure DoStopCapture; override;
    procedure DoSampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean); override;
    function GetDeviceProperty(const Prop: TCaptureDevice.TProperty): string; override;
    function GetDeviceState: TCaptureDeviceState; override;
    function GetPosition: TDevicePosition; override;
    procedure DoSetQuality(const Value: TVideoCaptureQuality); override;
    function GetHasFlash: Boolean; override;
    function GetFlashMode: TFlashMode; override;
    procedure SetFlashMode(const Value: TFlashMode); override;
    function GetHasTorch: Boolean; override;
    function GetTorchMode: TTorchMode; override;
    procedure SetTorchMode(const Value: TTorchMode); override;
    function GetFocusMode: TFocusMode; override;
    procedure SetFocusMode(const Value: TFocusMode); override;
    class function GetCallbackInstance: TAndroidVideoCaptureCallback;
    function GetCaptureSetting: TVideoCaptureSetting; override;
    function DoSetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean; override;
    function DoGetAvailableCaptureSettings: TArray<TVideoCaptureSetting>; override;
  public
    property CameraId: Integer read FCameraId;
    property Camera: JCamera read GetCamera;

    constructor Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean); override;
    destructor Destroy; override;
  end;

{$ENDREGION}
{$REGION 'TAndroidCaptureDeviceManager'}

constructor TAndroidCaptureDeviceManager.Create;
var
  I: Integer;
  CameraDevice: TAndroidVideoCaptureDevice;
begin
  inherited;

  TAndroidAudioCaptureDevice.Create(Self, True);

  for I := 0 to TJCamera.JavaClass.getNumberOfCameras - 1 do
  begin
    CameraDevice := TAndroidVideoCaptureDevice.Create(Self, I = 0);
    CameraDevice.FCameraId := I;
  end;
end;

{$ENDREGION}
{$REGION 'TAndroidAudioCaptureDevice'}

destructor TAndroidAudioCaptureDevice.Destroy;
begin
  FRecorder := nil;

  inherited;
end;

procedure TAndroidAudioCaptureDevice.DoStartCapture;
begin
  if PermissionsService.IsPermissionGranted(JStringToString(TJManifest_permission.JavaClass.RECORD_AUDIO)) then
  begin
    FRecorder := TJMediaRecorder.JavaClass.init;
    FRecorder.setAudioSource(TJMediaRecorder_AudioSource.JavaClass.MIC);
    FRecorder.setOutputFormat(TJMediaRecorder_OutputFormat.JavaClass.THREE_GPP);
    FRecorder.setAudioEncoder(TJMediaRecorder_AudioEncoder.JavaClass.AMR_NB);
    FRecorder.setOutputFile(StringToJString(FileName));
    FRecorder.prepare;
    FRecorder.start;
  end
  else
    raise EPermissionException.CreateFmt(SRequiredPermissionsAreAbsent, ['RECORD_AUDIO']);
end;

procedure TAndroidAudioCaptureDevice.DoStopCapture;
begin
  if FRecorder <> nil then
  begin
    FRecorder.stop;
    FRecorder := nil;
  end;
end;

function TAndroidAudioCaptureDevice.GetDeviceState: TCaptureDeviceState;
begin
  if FRecorder <> nil then
    Result := TCaptureDeviceState.Capturing
  else
    Result := TCaptureDeviceState.Stopped;
end;

{$ENDREGION}
{$REGION 'TAndroidVideoCaptureDevice'}

procedure TAndroidVideoCaptureCallback.onPreviewFrame(AData: TJavaArray<Byte>; ACamera: JCamera);
begin
  if FCaptureDevice <> nil then
  begin
    if FCaptureDevice.FCapturing then
      FCaptureDevice.CopyBufferToSurface(AData, ACamera);
    FCaptureDevice.RemoveQueueBuffer;
  end;
end;

constructor TAndroidVideoCaptureDevice.Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean);
begin
  inherited;

  // Set default values
  FCaptureTimerInterval := DefaultCaptureTimeInterval;
  FVideoConversionJPEGQuality := MediumJpegQuality;

  SurfaceSection:= TCriticalSection.Create;
  UpdatedSection:= TCriticalSection.Create;
  QueueSection:= TCriticalSection.Create;

  FCapturing := False;
  FOrientationChangedId := TMessageManager.DefaultManager.SubscribeToMessage(TOrientationChangedMessage,
    OrientationChangedHandler);
end;

destructor TAndroidVideoCaptureDevice.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TOrientationChangedMessage, FOrientationChangedId);
  DoStopCapture;

  QueueSection.Free;
  UpdatedSection.Free;
  SurfaceSection.Free;

  inherited;
end;

function TAndroidVideoCaptureDevice.GetCamera: JCamera;
begin
  if not PermissionsService.IsPermissionGranted(
           JStringToString(TJManifest_permission.JavaClass.CAMERA)) then
    raise EPermissionException.CreateFmt(SRequiredPermissionsAreAbsent, ['CAMERA']);

  if FCurrentCamera = nil then
    FCurrentCamera := TJCamera.JavaClass.open(FCameraId)
  else if FCurrentCameraID <> FCameraId then
  begin
    FCurrentCamera.release;
    FCurrentCamera := TJCamera.JavaClass.open(FCameraId);
    FCurrentCameraID := FCameraId;
  end;

  Result := FCurrentCamera;
end;

function TAndroidVideoCaptureDevice.GetDeviceProperty(const Prop: TCaptureDevice.TProperty): string;
begin
  case Prop of
    TCaptureDevice.TProperty.UniqueID:
      Result := FCameraId.ToString;

    else
      Result := '';
  end;
end;

function TAndroidVideoCaptureDevice.GetDeviceState: TCaptureDeviceState;
begin
  if FCapturing then
    Result := TCaptureDeviceState.Capturing
  else
    Result := TCaptureDeviceState.Stopped;
end;

procedure TAndroidVideoCaptureDevice.DoSetQuality(const Value: TVideoCaptureQuality);
var
  Params: JCamera_Parameters;
  SettingsList: TArray<TVideoCaptureSetting>;
  Priority: TVideoCaptureSettingPriority;
begin
  if Value <> TVideoCaptureQuality.CaptureSettings then
  begin
    Priority := CaptureSettingPriority;
    try
      CaptureSettingPriority := TVideoCaptureSettingPriority.Resolution;
      SettingsList := AvailableCaptureSettings;
    finally
      CaptureSettingPriority := Priority;
    end;

    if Length(SettingsList) > 0 then
    begin
      case Value of
        TVideoCaptureQuality.PhotoQuality: CaptureSetting := SettingsList[0];
        TVideoCaptureQuality.HighQuality: CaptureSetting := SettingsList[0];
        TVideoCaptureQuality.MediumQuality: CaptureSetting := SettingsList[Length(SettingsList) div 2];
        TVideoCaptureQuality.LowQuality: CaptureSetting := SettingsList[High(SettingsList)];
      end;
    end;

    Params := Camera.getParameters;
    if Params <> nil then
    begin

      case Value of
        TVideoCaptureQuality.PhotoQuality: ;
        TVideoCaptureQuality.HighQuality:
        begin
          Params.setPictureFormat(TJImageFormat.JavaClass.JPEG);
          Params.&set(StringToJString(JPEGQualityKey), HighestJpegQuality);
          Params.setJpegQuality(HighestJpegQuality);
          FVideoConversionJPEGQuality := HighestJpegQuality;
        end;
        TVideoCaptureQuality.MediumQuality:
        begin
          Params.setPictureFormat(TJImageFormat.JavaClass.JPEG);
          Params.&set(StringToJString(JPEGQualityKey), MediumJpegQuality);
          Params.setJpegQuality(MediumJpegQuality);
          FVideoConversionJPEGQuality := MediumJpegQuality;
        end;
        TVideoCaptureQuality.LowQuality:
        begin
          Params.setPictureFormat(TJImageFormat.JavaClass.JPEG);
          Params.&set(StringToJString(JPEGQualityKey), LowestJpegQuality);
          Params.setJpegQuality(LowestJpegQuality);
          FVideoConversionJPEGQuality := LowestJpegQuality;
        end;
      end;
      Camera.setParameters(Params);
    end;
    inherited;
  end;
end;

function TAndroidVideoCaptureDevice.GetPosition: TDevicePosition;
var
  CameraInfo: JCamera_CameraInfo;
begin
  CameraInfo := TJCamera_CameraInfo.JavaClass.init;
  TJCamera.JavaClass.getCameraInfo(CameraId, CameraInfo);

  if CameraInfo.facing = TJCamera_CameraInfo.JavaClass.CAMERA_FACING_BACK then
    Result := TDevicePosition.Back
  else if CameraInfo.facing = TJCamera_CameraInfo.JavaClass.CAMERA_FACING_FRONT then
    Result := TDevicePosition.Front
  else
    Result := TDevicePosition.Unspecified;
end;

function TAndroidVideoCaptureDevice.GetCaptureSetting: TVideoCaptureSetting;
var
  Params: JCamera_Parameters;
  Size: JCamera_Size;
begin
  Result := TVideoCaptureSetting.Create;
  Params := Camera.getParameters;
  if Params <> nil then
  begin
    Size := Params.getPreviewSize;
    Result := TVideoCaptureSetting.Create(Size.width, Size.height, Params.getPreviewFrameRate);
  end;
end;

function TAndroidVideoCaptureDevice.GetHasFlash: Boolean;
var
  Params: JCamera_Parameters;
  ModeList: JList;
begin
  Params := Camera.getParameters;
  if Params = nil then
    Exit(False);

  ModeList := Params.getSupportedFlashModes;

  if ModeList = nil then
    Exit(False);

  Result := ModeList.contains(TJCamera_Parameters.JavaClass.FLASH_MODE_ON) or
    ModeList.contains(TJCamera_Parameters.JavaClass.FLASH_MODE_AUTO);
end;

function TAndroidVideoCaptureDevice.GetHasTorch: Boolean;
var
  Params: JCamera_Parameters;
  ModeList: JList;
begin
  Params := Camera.getParameters;
  if Params = nil then
    Exit(False);

  ModeList := Params.getSupportedFlashModes;

  if ModeList = nil then
    Exit(False);

  Result := ModeList.contains(TJCamera_Parameters.JavaClass.FLASH_MODE_TORCH);
end;

function TAndroidVideoCaptureDevice.GetFlashMode: TFlashMode;
var
  Params: JCamera_Parameters;
  FlashMode: JString;
  FlashModeText: string;
begin
  Params := Camera.getParameters;
  if Params = nil then
    Exit(inherited);

  FlashMode := Params.getFlashMode;
  if FlashMode = nil then
    Exit(inherited);

  FlashModeText := JStringToString(FlashMode);

  if SameText(FlashModeText, JStringToString(TJCamera_Parameters.JavaClass.FLASH_MODE_ON)) then
    Result := TFlashMode.FlashOn
  else if SameText(FlashModeText, JStringToString(TJCamera_Parameters.JavaClass.FLASH_MODE_AUTO)) then
    Result := TFlashMode.AutoFlash
  else
    Result := TFlashMode.FlashOff;
end;

procedure TAndroidVideoCaptureDevice.SetFlashMode(const Value: TFlashMode);
var
  Params: JCamera_Parameters;
begin
  Params := Camera.getParameters;
  if Params = nil then
    Exit;

  case Value of
    TFlashMode.AutoFlash:
      Params.setFlashMode(TJCamera_Parameters.JavaClass.FLASH_MODE_AUTO);

    TFlashMode.FlashOff:
      Params.setFlashMode(TJCamera_Parameters.JavaClass.FLASH_MODE_OFF);

    TFlashMode.FlashOn:
      Params.setFlashMode(TJCamera_Parameters.JavaClass.FLASH_MODE_ON);
  end;

  Camera.setParameters(Params);
end;

function TAndroidVideoCaptureDevice.GetFocusMode: TFocusMode;
var
  Params: JCamera_Parameters;
  FocusMode: JString;
  FocusModeText: string;
begin
  Params := Camera.getParameters;
  if Params = nil then
    Exit(inherited);

  FocusMode := Params.getFocusMode;
  if FocusMode = nil then
    Exit(inherited);

  FocusModeText := JStringToString(FocusMode);

  if SameText(FocusModeText, JStringToString(TJCamera_Parameters.JavaClass.FOCUS_MODE_AUTO)) then
    Result := TFocusMode.AutoFocus
  else if SameText(FocusModeText, JStringToString(TJCamera_Parameters.JavaClass.FOCUS_MODE_CONTINUOUS_VIDEO)) then
    Result := TFocusMode.ContinuousAutoFocus
  else if SameText(FocusModeText, JStringToString(TJCamera_Parameters.JavaClass.FOCUS_MODE_CONTINUOUS_PICTURE)) then
    Result := TFocusMode.ContinuousAutoFocus
  else
    Result := TFocusMode.Locked;
end;

procedure TAndroidVideoCaptureDevice.SetFocusMode(const Value: TFocusMode);
var
  Params: JCamera_Parameters;
begin
  Params := Camera.getParameters;
  if Params = nil then
    Exit;

  case Value of
    TFocusMode.AutoFocus:
      Params.setFocusMode(TJCamera_Parameters.JavaClass.FOCUS_MODE_AUTO);

    TFocusMode.ContinuousAutoFocus:
      Params.setFocusMode(TJCamera_Parameters.JavaClass.FOCUS_MODE_CONTINUOUS_PICTURE);

    TFocusMode.Locked:
      Params.setFocusMode(TJCamera_Parameters.JavaClass.FOCUS_MODE_FIXED);
  end;

  Camera.setParameters(Params);
////fix or add by flying wang.
////https://quality.embarcadero.com/browse/RSP-13208
//  if Value = TFocusMode.AutoFocus then
////  if Value <> TFocusMode.Locked then
//fix or add by flying wang.
  try
    if (Value <> TFocusMode.Locked) and FCapturing then
      Camera.autoFocus(nil);
  except
  end;
end;

function TAndroidVideoCaptureDevice.GetTorchMode: TTorchMode;
var
  Params: JCamera_Parameters;
  FlashMode: JString;
begin
  Params := Camera.getParameters;
  if Params = nil then
    Exit(inherited);

  FlashMode := Params.getFlashMode;
  if FlashMode = nil then
    Exit(inherited);

  if SameText(JStringToString(FlashMode), JStringToString(TJCamera_Parameters.JavaClass.FLASH_MODE_TORCH)) then
    Result := TTorchMode.ModeOn
  else
    Result := TTorchMode.ModeOff
end;

procedure TAndroidVideoCaptureDevice.SetTorchMode(const Value: TTorchMode);
var
  Params: JCamera_Parameters;
begin
  Params := Camera.getParameters;
  if Params = nil then
    Exit;

  case Value of
    TTorchMode.ModeOff:
      if GetTorchMode = TTorchMode.ModeOn then
      begin
        Params.setFlashMode(TJCamera_Parameters.JavaClass.FLASH_MODE_OFF);
        Camera.setParameters(Params);
      end;

    TTorchMode.ModeOn:
      if GetTorchMode = TTorchMode.ModeOff then
      begin
        Params.setFlashMode(TJCamera_Parameters.JavaClass.FLASH_MODE_TORCH);
        Camera.setParameters(Params);
      end;
  end;
end;

procedure TAndroidVideoCaptureDevice.AddQueueBuffer;
begin
  QueueSection.Acquire;
  try
    if QueuedBufferCount < 1 then
    begin
      FreeAndNil(SharedBuffer);
      SharedBuffer := TJavaArray<Byte>.Create(SharedBufferBytes);
      Camera.addCallbackBuffer(SharedBuffer);
      Inc(QueuedBufferCount);
    end;
  finally
    QueueSection.Release;
  end;
end;

procedure TAndroidVideoCaptureDevice.RemoveQueueBuffer;
begin
  QueueSection.Acquire;
  try
    QueuedBufferCount := Max(QueuedBufferCount - 1, 0);
  finally
    QueueSection.Release;
  end;
end;

function TAndroidVideoCaptureDevice.GetManualBitmapRotation: Integer;
var
  CameraInfo: JCamera_CameraInfo;
  Display: JDisplay;
  DisplayOrientation: Integer;
begin
  CameraInfo := TJCamera_CameraInfo.JavaClass.init;
  TJCamera.JavaClass.getCameraInfo(FCameraId, CameraInfo);

  Display := TAndroidHelper.Display;
  if Display = nil then
    Exit(0);

  case Display.getRotation of
    0: // TJSurface.JavaClass.ROTATION_0
      DisplayOrientation := 0;
    1: // TJSurface.JavaClass.ROTATION_90
      DisplayOrientation := 90;
    2: // TJSurface.JavaClass.ROTATION_180
      DisplayOrientation := 180;
    3: // TJSurface.JavaClass.ROTATION_270
      DisplayOrientation := 270;
  else
    Exit(0);
  end;

  if CameraInfo.facing = TJCamera_CameraInfo.JavaClass.CAMERA_FACING_FRONT then
    Result := (DisplayOrientation + CameraInfo.orientation) mod 360
  else
    Result := (360 + CameraInfo.orientation - DisplayOrientation) mod 360;
end;

procedure TAndroidVideoCaptureDevice.DoStartCapture;
var
  Params: JCamera_Parameters;
  PreviewSize: JCamera_Size;
begin
  if FCapturing then
    Exit;

  Params := Camera.getParameters;
  if Params = nil then
    Exit;

  // Workaround for Google Glass
  if TPlatformServices.Current.GlobalFlags.ContainsKey(EnableGlassFPSWorkaround) and
    TPlatformServices.Current.GlobalFlags[EnableGlassFPSWorkaround] then
  begin
    Params.setPreviewFpsRange(30000, 30000);
    Camera.setParameters(Params);
  end;

  ManualBitmapRotation := GetManualBitmapRotation;

  PreviewSize := Params.getPreviewSize;
  PreviewBufferSize := TPoint.Create(PreviewSize.width, PreviewSize.height);

  if (ManualBitmapRotation div 90) mod 2 > 0 then
    SharedBufferSize := TPoint.Create(PreviewSize.height, PreviewSize.width)
  else
    SharedBufferSize := TPoint.Create(PreviewSize.width, PreviewSize.height);

  SharedBufferFormat := Params.getPreviewFormat;
  SharedBufferBytes := SharedBufferSize.X * SharedBufferSize.Y *
    (TJImageFormat.JavaClass.getBitsPerPixel(SharedBufferFormat));

  GetCallbackInstance.FCaptureDevice := Self;

  SharedSurface := TBitmapSurface.Create;
  SharedSurface.SetSize(SharedBufferSize.X, SharedBufferSize.Y, TPixelFormat.RGBA);
  SharedSurfaceUpdated := False;

  // In Android 3.0 changed the behaviour of onPreviewFrame
  // forcing to assign a SurfaceTexture or SurfaveView in order to get called

  if TOSVersion.Check(3, 0) then
  begin
	  if SurfaceTexture <> nil then
	    SurfaceTexture.release;

    glGenTextures(1, @SurfaceTextureId);
    glBindTexture(GL_TEXTURE_2D, SurfaceTextureId);

    SurfaceTexture := TJSurfaceTexture.JavaClass.init(SurfaceTextureId);
    Camera.setPreviewTexture(SurfaceTexture);
  end
  else
    Camera.setPreviewDisplay(nil);

  // reset buffer
  QueuedBufferCount := 0;
  Camera.setPreviewCallbackWithBuffer(GetCallbackInstance);
  Camera.startPreview;
  //fix or add by flying wang for autoFocus(nil)
  Camera.cancelAutoFocus;
  AddQueueBuffer;

  FCapturing := True;

  CapturePollingTimer := TTimer.Create(nil);
  CapturePollingTimer.Interval := FCaptureTimerInterval;
  CapturePollingTimer.OnTimer := OnCaptureTimer;
  CapturePollingTimer.Enabled := True;
end;

procedure TAndroidVideoCaptureDevice.DoStopCapture;
begin
  if FCapturing then
  begin
    FCapturing := False;
    FreeAndNil(CapturePollingTimer);

    SurfaceSection.Acquire;
    try
      FreeAndNil(SharedSurface);
    finally
      SurfaceSection.Release;
    end;
  end;

  if FPreviewConversionTask <> nil then
    FPreviewConversionTask.Cancel;

  if FCurrentCamera <> nil then
  begin
    FCurrentCamera.setPreviewCallbackWithBuffer(nil);
    FCurrentCamera.stopPreview;
    FCurrentCamera.release;
    FCurrentCamera := nil;
  end;
end;

procedure TAndroidVideoCaptureDevice.ConvertYuvToBitmapSurfaceHandler(Sender: TObject);

  function CreateJBitmapFromYuvBuffer: JBitmap;
  var
    Image: JYuvImage;
    Rect: JRect;
    Stream: JByteArrayOutputStream;
    LoadOptions: JBitmapFactory_Options;
  begin
    //SurfaceSection.Acquire;
    //fix by Dave Nottage
    //fix or add by flying wang.
    QueueSection.Acquire;
    try
      Image := TJYuvImage.JavaClass.init(SharedBuffer, SharedBufferFormat, PreviewBufferSize.X, PreviewBufferSize.Y,
        nil);
    finally
      //SurfaceSection.Release;
      //fix by Dave Nottage
      //fix or add by flying wang.
      QueueSection.Release;
    end;

    Rect := TJRect.JavaClass.init(0, 0, Image.getWidth, Image.getHeight);
    Stream := TJByteArrayOutputStream.JavaClass.init(0);
    Image.compressToJpeg(Rect, FVideoConversionJPEGQuality, Stream);

    // Some resources are freed as early as possible to reduce impact on working memory.
    Rect := nil;
    Image := nil;

    LoadOptions := TJBitmapFactory_Options.JavaClass.init;
    Result := TJBitmapFactory.JavaClass.decodeByteArray(Stream.toByteArray, 0, Stream.Size, LoadOptions);
  end;

  procedure RotateBitmap(var ABitmap: JBitmap; const AAngle: Integer);
  var
    ScaledSize: TPoint;
    TempBitmap: JBitmap;
    Matrix: JMatrix;
    RotatedBitmap: JBitmap;
  begin
    ScaledSize := SharedBufferSize;
    if (ManualBitmapRotation div 90) mod 2 > 0 then
      ScaledSize := TPoint.Create(SharedBufferSize.Y, SharedBufferSize.X);

    TempBitmap := TJBitmap.JavaClass.createScaledBitmap(ABitmap, ScaledSize.X, ScaledSize.Y, True);
    try
      Matrix := TJMatrix.JavaClass.init;
      Matrix.postRotate(ManualBitmapRotation);

      RotatedBitmap := TJBitmap.JavaClass.createBitmap(TempBitmap, 0, 0, TempBitmap.getWidth, TempBitmap.getHeight, Matrix, True);
    finally
      ABitmap.recycle;
      TempBitmap.recycle;
    end;

    ABitmap := RotatedBitmap;
  end;

var
  Bitmap: JBitmap;
  IsSurfaceAlive: Boolean;
begin
  if (SharedBuffer <> nil) and (SharedSurface <> nil) then
  begin
    Bitmap := CreateJBitmapFromYuvBuffer;
    try
      if ManualBitmapRotation <> 0 then
        RotateBitmap(Bitmap, ManualBitmapRotation);

      SurfaceSection.Acquire;
      try
        IsSurfaceAlive := SharedSurface <> nil;
        if IsSurfaceAlive then
          JBitmapToSurface(Bitmap, SharedSurface);
      finally
        SurfaceSection.Release;
      end;
    finally
      Bitmap.recycle;
      Bitmap := nil;
    end;

    if IsSurfaceAlive then
    begin
      UpdatedSection.Acquire;
      try
        SharedSurfaceUpdated := True;
      finally
        UpdatedSection.Release;
      end;
    end;
  end;
end;

procedure TAndroidVideoCaptureDevice.CopyBufferToSurface(AnArray: TJavaArray<Byte>; ACamera: JCamera);
begin
  if (FPreviewConversionTask <> nil) and (FPreviewConversionTask.Status in [TTaskStatus.Running, TTaskStatus.WaitingToRun]) then
    Exit;

  FPreviewConversionTask := TTask.Create(Self, ConvertYuvToBitmapSurfaceHandler).Start;
end;

procedure TAndroidVideoCaptureDevice.OnCaptureTimer(Sender: TObject);
var
  UpdatePending: Boolean;
begin
  UpdatedSection.Acquire;
  try
    UpdatePending := SharedSurfaceUpdated and (SharedSurface <> nil);
    SharedSurfaceUpdated := False;
  finally
    UpdatedSection.Release;
  end;

  if UpdatePending then
  begin
    if Assigned(OnSampleBufferReady) then
      OnSampleBufferReady(Self, 0);
  end;

  AddQueueBuffer;
end;

procedure TAndroidVideoCaptureDevice.DoSampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean);

  procedure DrawBitmapScaled(Source, Dest: TBitmap);
  var
    PrevScale: Single;
  begin
    PrevScale := Dest.BitmapScale;
    Dest.BitmapScale := 1;
    try
      if Dest.Canvas.BeginScene then
      try
        Dest.Canvas.DrawBitmap(Source, TRectF.Create(0, 0, Source.Width, Source.Height), TRectF.Create(0, 0,
          Dest.Width, Dest.Height), 1);
      finally
        Dest.Canvas.EndScene;
      end;
    finally
      Dest.BitmapScale := PrevScale;
    end;
  end;

var
  BiData: TBitmapData;
  TempBitmap: TBitmap;
  I: Integer;
begin
  if not FCapturing then
    Exit;

  if ASetSize then
    ABitmap.SetSize(SharedBufferSize.X, SharedBufferSize.Y);

  SurfaceSection.Acquire;
  try
    if SharedSurface <> nil then
    begin
      if (SharedSurface.Width = ABitmap.Width) and (SharedSurface.Height = ABitmap.Height) then
      begin // Bitmap has exact size, so can copy directly.
        if ABitmap.Map(TMapAccess.Write, BiData) then
        try
          for I := 0 to SharedBufferSize.Y - 1 do
            Move(SharedSurface.Scanline[I]^, BiData.GetScanline(I)^, SharedBufferSize.X * SharedSurface.BytesPerPixel);
        finally
          ABitmap.Unmap(BiData);
        end;
      end
      else
      begin // Bitmap has different size, rescaling is needed.
        TempBitmap := TBitmap.Create;
        try
          TempBitmap.SetSize(SharedBufferSize.X, SharedBufferSize.Y);
          if TempBitmap.Map(TMapAccess.Write, BiData) then
          begin
            try
              for I := 0 to SharedBufferSize.Y - 1 do
                Move(SharedSurface.Scanline[I]^, BiData.GetScanline(I)^, SharedBufferSize.X *
                  SharedSurface.BytesPerPixel);
            finally
              TempBitmap.Unmap(BiData);
            end;

            DrawBitmapScaled(TempBitmap, ABitmap);
          end;
        finally
          TempBitmap := nil;
        end;
      end;
    end;
  finally
    SurfaceSection.Release;
  end;
end;

function TAndroidVideoCaptureDevice.DoSetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean;
var
  Params: JCamera_Parameters;
begin
  Params := Camera.getParameters;
  if Params <> nil then
  begin
    Params.setPreviewSize(ASetting.Width, ASetting.Height);
    Params.setPreviewFrameRate(Round(ASetting.FrameRate));
    Camera.setParameters(Params);
  end;
  Result := Params <> nil;
end;

procedure TAndroidVideoCaptureDevice.OrientationChangedHandler(const Sender: TObject; const Msg: TMessage);
begin
  if FCapturing then
  begin
    ManualBitmapRotation := GetManualBitmapRotation;

    if (ManualBitmapRotation div 90) mod 2 > 0 then
      SharedBufferSize := TPoint.Create(PreviewBufferSize.Y, PreviewBufferSize.X)
    else
      SharedBufferSize := PreviewBufferSize;

    if SharedSurface <> nil then
      SharedSurface.SetSize(SharedBufferSize.X, SharedBufferSize.Y, TPixelFormat.RGBA);

    SharedSurfaceUpdated := False;
  end;
end;

function TAndroidVideoCaptureDevice.DoGetAvailableCaptureSettings: TArray<TVideoCaptureSetting>;
var
  Params: JCamera_Parameters;
  Size: JCamera_Size;
  SizeList, FramerateList: JList;
  I, J: Integer;
  List: TList<TVideoCaptureSetting>;
  Setting: TVideoCaptureSetting;
  Framerate: JInteger;
begin
  SetLength(Result, 0);
  Params := Camera.getParameters;
  if Params <> nil then
  begin
    List := TList<TVideoCaptureSetting>.Create;
    try
      SizeList := Params.getSupportedPreviewSizes;
      FramerateList := Params.getSupportedPreviewFrameRates;
      for I := 0 to SizeList.size - 1 do
      begin
        Size := TJCamera_Size.Wrap(SizeList.get(I));
        for J := 0 to FramerateList.size - 1 do
        begin
          Framerate := TJInteger.Wrap(FramerateList.get(J));
          try
            Setting := TVideoCaptureSetting.Create(Size.width, Size.height, Framerate.intValue);
            List.Add(Setting);
          finally
            Framerate := nil;
          end;
        end;
        Size := nil;
      end;
      Result := List.ToArray;
    finally
      List.Free;
    end;
  end;
end;

class function TAndroidVideoCaptureDevice.GetCallbackInstance: TAndroidVideoCaptureCallback;
begin
  if FCallback = nil then
    FCallback := TAndroidVideoCaptureCallback.Create;

  Result := FCallback;
end;

{$ENDREGION}
{$REGION 'TAndroidMedia'}

constructor TAndroidMedia.Create(const AFileName: string);
var
  AudioService: JObject;
  AudioManager: JAudioManager;
  MaxVolume: Integer;
begin
  inherited Create(AFileName);
  //Fix By Flying Wang and 爱吃猪头肉.
  FStretch := True;
  FProportional := True;
  FPlayer := TJMediaPlayer.JavaClass.init;
  FPlayer.setDataSource(StringToJString(FileName));
  FPlayer.prepare;
  AudioService := TAndroidHelper.Activity.getSystemService(TJContext.JavaClass.AUDIO_SERVICE);
  if AudioService <> nil then
    AudioManager := TJAudioManager.Wrap((AudioService as ILocalObject).GetObjectID);
  if AudioManager <> nil then
  begin
    MaxVolume := AudioManager.getStreamMaxVolume(TJAudioManager.JavaClass.STREAM_MUSIC);
    FVolume := AudioManager.getStreamVolume(TJAudioManager.JavaClass.STREAM_MUSIC);
    if MaxVolume > 0 then
      FVolume := FVolume / MaxVolume ;
    if FVolume > 1 then
      FVolume := 1 ;
  end;
end;

destructor TAndroidMedia.Destroy;
begin
  FPlayer.release;
  FPlayer := nil;
  inherited Destroy;
end;

function TAndroidMedia.GetCurrent: TMediaTime;
begin
  if FPlayer <> nil then
//    Result := FPlayer.getCurrentPosition
//fix by swish qdac
    Result := FPlayer.getCurrentPosition * Int64(10000)
//不加 Int64 会认为整数*整数，结果就可能成了负数赋给了Result
  else
    Result := 0;
end;

function TAndroidMedia.GetDuration: TMediaTime;
begin
//  Result := FPlayer.getDuration;
//fix by swish qdac
  Result := FPlayer.getDuration * Int64(10000);
//不加 Int64 会认为整数*整数，结果就可能成了负数赋给了Result
end;

function TAndroidMedia.GetMediaState: TMediaState;
begin
  if FPlayer <> nil then
  begin
    if FPlayer.isPlaying then
      Result := TMediaState.Playing
    else
      Result := TMediaState.Stopped;
  end
  else
    Result := TMediaState.Unavailable;
end;

function TAndroidMedia.GetVideoSize: TPointF;
begin
  if FPlayer <> nil then
    Result := TPointF.Create(FPlayer.getVideoWidth, FPlayer.getVideoHeight)
  else
    Result := TPointF.Zero;
end;

function TAndroidMedia.GetVolume: Single;
begin
  if FPlayer <> nil then
    Result := FVolume
  else
    Result := 0;
end;

function TAndroidMedia.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := E_NOTIMPL;
  if FPlayer <> nil then
    Result := FPlayer.QueryInterface(IID, Obj);
end;

procedure TAndroidMedia.SeekToBegin;
begin
  FPlayer.seekTo(0);
end;

procedure TAndroidMedia.SetCurrent(const Value: TMediaTime);
var
  NewPos : Integer;
begin
  if FPlayer <> nil then
  begin
    NewPos := Value;
    if NewPos < 0 then
      NewPos := 0;
//    FPlayer.seekTo(NewPos);
//fix by swish qdac
    FPlayer.seekTo(NewPos div 10000);
  end;
end;

procedure TAndroidMedia.SetVolume(const Value: Single);
begin
  FVolume := Value;

  if FVolume < 0 then
    FVolume := 0
  else if FVolume > 1 then
    FVolume := 1;

  if FPlayer <> nil then
    FPlayer.setVolume(FVolume, FVolume);
end;

procedure TAndroidMedia.UpdateMediaFromControl;
begin
end;

procedure TAndroidMedia.DoStop;
begin
  if FPlayer.isPlaying then
    FPlayer.pause;
end;

procedure TAndroidMedia.DoPlay;
begin
  FPlayer.start;
end;

//Fix By Flying Wang and 爱吃猪头肉.
procedure TAndroidMedia.SetStretch(const Value: Boolean);
begin
  FStretch := Value;
  UpdateMediaFromControl;
end;

procedure TAndroidMedia.SetProportional(const Value: Boolean);
begin
  FProportional := Value;
  UpdateMediaFromControl;
end;

function TAndroidMedia.GetStretch: Boolean;
begin
  Result := FStretch;
end;

function TAndroidMedia.GetProportional: Boolean;
begin
  Result := FProportional;
end;

function TAndroidMedia.GetRealWebMediaObject: IUnknown;
begin
  Result := FPlayer;
end;

{$ENDREGION}
{$REGION 'TAndroidMediaCodec'}

function TAndroidMediaCodec.CreateFromFile(const AFileName: string): TMedia;
begin
  Result := TAndroidMedia.Create(AFileName);
end;

{$ENDREGION}

{$REGION 'TAndroidVideoCodec'}

function TAndroidVideoCodec.CreateFromFile(const AFileName: string): TMedia;
begin
  Result := TAndroidVideo.Create(AFileName);
end;
{$ENDREGION}

{$REGION 'TAndroidVideo'}

constructor TAndroidVideo.Create(const AFileName: string);
const
  DefaultScale = 1;
var
  ScreenSrv: IFMXScreenService;
begin
  FVolume := TCommonVolume.Create;
  FVideoEnabled := False;
  inherited Create(AFileName);
  //Fix By Flying Wang and 爱吃猪头肉.
  FStretch := True;
  FProportional := True;

  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenSrv) then
    FScale := ScreenSrv.GetScreenScale
  else
    FScale := DefaultScale;
end;

function TAndroidVideo.AllAssigned: Boolean;
begin
  Result := FVideoPlayer <> nil;
end;

procedure TAndroidVideo.CheckVideo;
const
  CYes = 'yes';
var
  MMR : JMediaMetadataRetriever;
begin
  if TOSVersion.Check(4, 0) and (FileExists(FileName)) then
  begin
    MMR := TJMediaMetadataRetriever.JavaClass.init;
    MMR.setDataSource(StringToJString(FileName));
    FVideoEnabled := (CYes
      = JStringToString(MMR.extractMetadata(TJMediaMetadataRetriever.JavaClass.METADATA_KEY_HAS_VIDEO))) and
      (Control <> nil);
    MMR := nil;
  end
  else
    FVideoEnabled := Control <> nil;
end;

procedure TAndroidVideo.RealignView;
//const
//  VideoExtraSpace = 100; // To be sure that destination rect will fit to fullscreen
//Fix By Flying Wang and 爱吃猪头肉.
var
  VideoExtraSpace: Integer; // To be sure that destination rect will fit to fullscreen
var
  VideoRect: TRectF;
  RoundedRect: TRect;
  LSizeF: TPointF;
  LRealBounds: TRectF;
  LRealPosition, LRealSize: TPointF;
begin
  ZOrderManager.AddOrSetLink(Control, FVideoPlayer, nil);
  ZOrderManager.UpdateOrderAndBounds(Control);

  LRealPosition := Control.LocalToAbsolute(TPointF.Zero) * FScale;
  LSizeF := TPointF.Create(Control.Size.Size.cx, Control.Size.Size.cy);
//Fix By Flying Wang and 爱吃猪头肉.
  VideoExtraSpace := 100;
  if Stretch then
  begin
    if FVideoSize.cx <> 0 then
    begin
      while (FVideoSize.cx * VideoExtraSpace) < 480 do
        VideoExtraSpace := VideoExtraSpace * 10;
    end;
    if FVideoSize.cy <> 0 then
    begin
      while (FVideoSize.cy * VideoExtraSpace) < 270 do
        VideoExtraSpace := VideoExtraSpace * 10;
    end;
  end;
  LRealSize := Control.LocalToAbsolute(LSizeF) * FScale;
  LRealBounds := TRectF.Create(LRealPosition, LRealSize);
  VideoRect := TRectF.Create(0, 0, FVideoSize.Width * VideoExtraSpace, FVideoSize.Height * VideoExtraSpace);
  RoundedRect := VideoRect.FitInto(LRealBounds).Round;
  if not Control.ParentedVisible then
    RoundedRect.Left := Round(Screen.Size.cx * FScale);

  TUIThreadCaller.Call<TRect>(
    procedure (R: TRect)
    var
      ShouldBeReloaded: Boolean;
      LCurrentTime: Integer;
      LStarted: Boolean;
    begin
//Fix By Flying Wang and 爱吃猪头肉.
        if not Stretch then
        begin
          R := CenteredRect(R, TRect.Create(0, 0, FVideoSize.Width, FVideoSize.Height));
          R.Width := FVideoSize.Width;
          R.Height := FVideoSize.Height;
//        end
//        else if not Proportional then //不支持。
//        begin
//          R := LRealBounds.Round;
//          FVideoPlayer.setPadding()
        end;
      ShouldBeReloaded := (FVideoPlayer.getWidth <> R.Width) or ((FVideoPlayer.getHeight <> R.Height));
      if ShouldBeReloaded then
      begin
        LCurrentTime := FVideoPlayer.getCurrentPosition;
        LStarted := FVideoPlayer.isPlaying;
        FVideoPlayer.setVisibility(TJView.JavaClass.INVISIBLE);
        FVideoPlayer.setVisibility(TJView.JavaClass.VISIBLE);
        FVideoPlayer.setVideoPath(StringToJString(FileName));
        FVideoPlayer.seekTo(LCurrentTime);
        if LStarted then
          FVideoPlayer.start;
      end;
    end, RoundedRect);
end;

procedure TAndroidVideo.RetreiveVideoSize;
var
  MediaPlayer: JMediaPlayer;
begin
  MediaPlayer := TJMediaPlayer.JavaClass.init;
  MediaPlayer.setDataSource(StringToJString(FileName));
  MediaPlayer.prepare;
  FVideoSize := TSize.Create(MediaPlayer.getVideoWidth, MediaPlayer.getVideoHeight);
  MediaPlayer := nil;
end;

destructor TAndroidVideo.Destroy;
var
  LInstance: TVideoInstance;
begin
  if ZOrderManager <> nil then
    ZOrderManager.RemoveLink(Control);
  LInstance.VideoPlayer := FVideoPlayer;

  TUIThreadCaller.Call<TVideoInstance>(
    procedure(V: TVideoInstance)
    begin
      VideoPool.UIReturnInstance(V);
    end, LInstance);

  inherited Destroy;
end;

procedure TAndroidVideo.DoPlay;
begin
  inherited;
  if IsVideoEnabled then
    CallInUIThread(
      procedure
      begin
        if not FVideoPlayer.isPlaying then
          FVideoPlayer.start;
      end)
  else
    FJustAudio.DoPlay;
end;

procedure TAndroidVideo.DoStop;
begin
  inherited;
  if IsVideoEnabled then
    CallInUIThread(
      procedure
      begin
        if FVideoPlayer.isPlaying then
          FVideoPlayer.pause;
      end)
  else
    FJustAudio.DoStop;
end;

function TAndroidVideo.GetCurrent: TMediaTime;
begin
  Result := 0;
  if IsVideoEnabled then
  begin
    if AllAssigned then
      Result := FVideoPlayer.getCurrentPosition;
  end
  else
    Result := FJustAudio.GetCurrent;
end;

function TAndroidVideo.GetDuration: TMediaTime;
begin
  Result := 0;
  if IsVideoEnabled then
  begin
    if AllAssigned then
      Result := FVideoPlayer.getDuration;
  end
  else
    Result := FJustAudio.GetDuration;
end;

function TAndroidVideo.GetMediaState: TMediaState;
begin
  if IsVideoEnabled then
  begin
    if FVideoPlayer <> nil then
    begin
      if FVideoPlayer.isPlaying then
        Result := TMediaState.Playing
      else
        Result := TMediaState.Stopped;
    end
    else
      Result := TMediaState.Unavailable;
  end
  else
    Result := FJustAudio.GetMediaState;
end;

function TAndroidVideo.GetVideoSize: TPointF;
begin
  if IsVideoEnabled then
    Result := PointF(FVideoSize.Width, FVideoSize.Height)
  else
    Result := PointF(0, 0);
end;

function TAndroidVideo.GetVolume: Single;
begin
  if IsVideoEnabled then
    Result := FVolume.Value
  else
    Result := FJustAudio.GetVolume;
end;

function TAndroidVideo.GetZOrderManager: TAndroidZOrderManager;
var
  Form: TCommonCustomForm;
begin
  if (Control <> nil) and (Control.Root <> nil) and (Control.Root.GetObject is TCommonCustomForm) then
  begin
    Form := TCommonCustomForm(Control.Root);
    Result := WindowHandleToPlatform(Form.Handle).ZOrderManager;
  end
  else
    Result := nil;
end;

procedure TAndroidVideo.InitInstance;
var
  LFileName: string;
begin
  LFileName := FileName;
  if FVideoEnabled then
  begin
    RetreiveVideoSize;

    CallInUIThreadAndWaitFinishing(
      procedure
      var
        LInstance: TVideoInstance;
      begin
        LInstance := VideoPool.UIGetInstance;
        FVideoPlayer := LInstance.VideoPlayer;
        FVideoPlayer.setVisibility(TJView.JavaClass.VISIBLE);
        FVideoPlayer.setVideoPath(StringToJString(LFileName));
      end);
    RealignView;
  end
  else
    FJustAudio := TAndroidMedia.Create(FileName);
end;

function TAndroidVideo.InstanceCreated: Boolean;
begin
  Result := FJustAudio <> nil;
end;

procedure TAndroidVideo.SeekToBegin;
begin
  if IsVideoEnabled then
  begin
    if AllAssigned then
      CallInUIThread(
        procedure
        begin
          if FVideoPlayer.isPlaying then
            FVideoPlayer.stopPlayback;
          FVideoPlayer.seekTo(0);
        end);
  end
  else
    FJustAudio.SeekToBegin;
end;

procedure TAndroidVideo.SetCurrent(const Value: TMediaTime);
begin
  inherited;
  if IsVideoEnabled then
  begin
    if AllAssigned then
      CallInUIThread(
        procedure
        begin
          FVideoPlayer.seekTo(Value);
        end);
  end
  else
    FJustAudio.SetCurrent(Value);
end;

procedure TAndroidVideo.SetVolume(const Value: Single);
begin
  inherited;
  if IsVideoEnabled then
    FVolume.Value := Value
  else
    FJustAudio.SetVolume(Value);
end;

procedure TAndroidVideo.UpdateMediaFromControl;
begin
  inherited;
  if IsVideoEnabled then
    RealignView
  else
    FJustAudio.UpdateMediaFromControl;
end;

function TAndroidVideo.IsVideoEnabled: Boolean;
begin
  if not InstanceCreated then
  begin
    CheckVideo;
    InitInstance;
  end;
  Result := FVideoEnabled;
end;

function TAndroidVideo.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := E_NOTIMPL;
  if (FVideoPlayer <> nil) and (FVideoPlayer.QueryInterface(IID, Obj) = S_OK) then
    Exit(S_OK);
end;

//Fix By Flying Wang and 爱吃猪头肉.
procedure TAndroidVideo.SetStretch(const Value: Boolean);
begin
  FStretch := Value;
  UpdateMediaFromControl;
end;

procedure TAndroidVideo.SetProportional(const Value: Boolean);
begin
  FProportional := Value;
  FProportional := True; //不支持 False。
  UpdateMediaFromControl;
end;

function TAndroidVideo.GetStretch: Boolean;
begin
  Result := FStretch;
end;

function TAndroidVideo.GetProportional: Boolean;
begin
  Result := FProportional;
end;

function TAndroidVideo.GetRealWebMediaObject: IUnknown;
begin
  Result := FVideoPlayer;
end;

{$ENDREGION}

{ TAndroidVideo.TVolume }

constructor TAndroidVideo.TCommonVolume.Create;
begin
  FAudioService := TAndroidHelper.Activity.getSystemService(TJContext.JavaClass.AUDIO_SERVICE);
  if FAudioService <> nil then
    FAudioManager := TJAudioManager.Wrap((FAudioService as ILocalObject).GetObjectID);
  if FAudioManager <> nil then
    FMaxVolume := FAudioManager.getStreamMaxVolume(TJAudioManager.JavaClass.STREAM_MUSIC);
end;

function TAndroidVideo.TCommonVolume.GetVolume: Single;
begin
  if FMaxVolume = 0 then
    Result := 0
  else
    Result := Min(1, FAudioManager.getStreamVolume(TJAudioManager.JavaClass.STREAM_MUSIC) / FMaxVolume);
end;

procedure TAndroidVideo.TCommonVolume.SetVolume(const Value: Single);
begin
  if FAudioManager <> nil then
    FAudioManager.setStreamVolume(TJAudioManager.JavaClass.STREAM_MUSIC, Round(Value * FMaxVolume), 0);
end;

{ TVideoPool }

constructor TVideoPool.Create;
begin
  FUsed := TList<TVideoInstance>.Create;
  FReadyToUse := TList<TVideoInstance>.Create;
end;

procedure TVideoPool.CreateOneMoreInstance;
var
  LItem: TVideoInstance;
begin
  LItem.VideoPlayer := TJVideoView.JavaClass.init(TAndroidHelper.Activity);
  LItem.VideoPlayer.requestFocus(0);
  FReadyToUse.Add(LItem);
end;

destructor TVideoPool.Destroy;
var
  LItem: TVideoInstance;
begin
  while FUsed.Count > 0 do
  begin
    LItem := FUsed.First;
    TUIThreadCaller.Call<TVideoInstance>(
      procedure(V: TVideoInstance)
      begin
        VideoPool.UIReturnInstance(V);
      end, LItem);
  end;
  FUsed.Free;
  FReadyToUse.Free;
  inherited;
end;

procedure TVideoPool.UIFreezeInstance(const AInstance: TVideoInstance);
begin
  if AInstance.VideoPlayer.isPlaying then
    AInstance.VideoPlayer.stopPlayback;
  AInstance.VideoPlayer.setVisibility(TJView.JavaClass.INVISIBLE);
end;

function TVideoPool.UIGetInstance: TVideoInstance;
begin
  if FReadyToUse.Count = 0 then
    CreateOneMoreInstance;
  Result := FReadyToUse.First;
  FReadyToUse.Remove(Result);
  FUsed.Add(Result);
end;

procedure TVideoPool.UIReturnInstance(const AInstance: TVideoInstance);
begin
  UIFreezeInstance(AInstance);
  FUsed.Remove(AInstance);
  FReadyToUse.Add(AInstance);
end;

initialization
  VideoPool := TVideoPool.Create;
  TMediaCodecManager.RegisterMediaCodecClass('.mov', SVMOVFiles, TMediaType.Video, TAndroidVideoCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.m4v', SVM4VFiles, TMediaType.Video, TAndroidVideoCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.mp4', SVMP4Files, TMediaType.Video, TAndroidVideoCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.3gp', SV3GPFiles, TMediaType.Video, TAndroidVideoCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.mp3', SVMP3Files, TMediaType.Audio, TAndroidMediaCodec);
  TMediaCodecManager.RegisterMediaCodecClass('.caf', SVCAFFiles, TMediaType.Audio, TAndroidMediaCodec);

  TMediaCodecManager.RegisterMediaCodecClass(SAllFilesExt, SDefault, TMediaType.Video, TAndroidMediaCodec);

finalization
  VideoPool.Free;

end.
