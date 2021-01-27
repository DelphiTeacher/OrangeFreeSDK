{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2012-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Media;

interface

{$SCOPEDENUMS ON}
{$HPPEMIT '#if defined(_WIN32) && !defined(_WIN64)'}
{$HPPEMIT '#pragma comment(lib, "urlmon")'}
{$HPPEMIT '#endif'}

uses
  System.Classes, System.SysUtils, System.Types, System.Generics.Collections, System.Generics.Defaults, System.Messaging,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.StdActns, FMX.ActnList;

const
  MediaTimeScale = 10000000;

type
  ECaptureDeviceException = class(Exception);
  TMediaTime = type Int64;

  /// <summary>Is a record used to convert the time of a media player into
  /// conventional formats.</summary>
  TMediaTimeHelper = record helper for TMediaTime
  public
    /// <summary> Return time of player in TDateTime format </summary>
    function ToDateTime: TDateTime;
    /// <summary> Return time of player in text format. Used system settings of time format</summary>
    function ToString: string;
  end;

  TMediaType = (Audio, Video);

  TCaptureDeviceState = (Capturing, Stopped);

  TSampleBufferReadyEvent = procedure (Sender: TObject; const ATime: TMediaTime) of object;

  TCaptureDeviceManager = class;

  TCaptureDevice = class abstract
  public type
    TProperty = (UniqueID, Name, Description);
  private
    FManager: TCaptureDeviceManager;
    FDefault: Boolean;
  protected
    function GetMediaType: TMediaType; virtual; abstract;
    function GetDeviceProperty(const Prop: TProperty): string; virtual;
    function GetDeviceState: TCaptureDeviceState; virtual; abstract;
    procedure DoStartCapture; virtual; abstract;
    procedure DoStopCapture; virtual; abstract;
  public
    constructor Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean); virtual;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    procedure StartCapture;
    procedure StopCapture;
    property Description: string index TProperty.Description read GetDeviceProperty;
    property IsDefault: Boolean read FDefault;
    property MediaType: TMediaType read GetMediaType;
    property Name: string index TProperty.Name read GetDeviceProperty;
    property State: TCaptureDeviceState read GetDeviceState;
    property UniqueID: string index TProperty.UniqueID read GetDeviceProperty;
  end;
  TCaptureDeviceClass = class of TCaptureDevice;

  TAudioCaptureDevice = class(TCaptureDevice)
  private
    procedure SetFileName(const Value: string);
  protected
    FFileName: string;
    function GetMediaType: TMediaType; override;
    function GetFilterString: string; virtual;
  public
    property FilterString: string read GetFilterString;
    property FileName: string read FFileName write SetFileName;
  end;

  TDevicePosition = (Unspecified, Front, Back);

  TDevicePositionHelper = record helper for TDevicePosition
  const
    dpUnspecified = TDevicePosition.Unspecified deprecated 'Use TDevicePosition.Unspecified';
    dpFront = TDevicePosition.Front deprecated 'Use TDevicePosition.Front';
    dpBack = TDevicePosition.Back deprecated 'Use TDevicePosition.Back';
  end;

  TFlashMode = (AutoFlash, FlashOff, FlashOn);

  TFlashModeHelper = record helper for TFlashMode
  const
    fmAutoFlash = TFlashMode.AutoFlash deprecated 'Use TFlashMode.AutoFlash';
    fmFlashOff = TFlashMode.FlashOff deprecated 'Use TFlashMode.FlashOff';
    fmFlashOn = TFlashMode.FlashOn deprecated 'Use TFlashMode.FlashOn';
  end;
  TFocusMode = (AutoFocus, ContinuousAutoFocus, Locked);

  TFocusModeHelper = record helper for TFocusMode
  const
    fmAutoFocus = TFocusMode.AutoFocus deprecated 'Use TFocusMode.AutoFocus';
    fmContinuousAutoFocus = TFocusMode.ContinuousAutoFocus deprecated 'Use TFocusMode.ContinuousAutoFocus';
    fmLocked = TFocusMode.Locked deprecated 'Use TFocusMode.Locked';
  end;
  TTorchMode = (ModeOff, ModeOn, ModeAuto);

  TTorchModeHelper = record helper for TTorchMode
  const
    tmModeOff = TTorchMode.ModeOff deprecated 'Use TTorchMode.ModeOff';
    tmModeOn = TTorchMode.ModeOn deprecated 'Use TTorchMode.ModeOn';
    tmModeAuto = TTorchMode.ModeAuto deprecated 'Use TTorchMode.ModeAuto';
  end;

  TVideoCaptureQuality = (PhotoQuality, HighQuality, MediumQuality, LowQuality, CaptureSettings);

  TVideoCaptureQualityHelper = record helper for TVideoCaptureQuality
  const
    vcPhotoQuality = TVideoCaptureQuality.PhotoQuality deprecated 'Use TVideoCaptureQuality.PhotoQuality';
    vcHighQuality = TVideoCaptureQuality.HighQuality deprecated 'Use TVideoCaptureQuality.HighQuality';
    vcMediumQuality = TVideoCaptureQuality.MediumQuality deprecated 'Use TVideoCaptureQuality.MediumQuality';
    vcLowQuality = TVideoCaptureQuality.LowQuality deprecated 'Use TVideoCaptureQuality.LowQuality';
  end;

  /// <summary>Enumerates the priorities to sort the video capture settings of a
  /// camera.</summary>
  TVideoCaptureSettingPriority = (Resolution, FrameRate);

  /// <summary>Record that stores information of one camera frame configuration</summary>
  TVideoCaptureSetting = record
  private
  type
    TResolutionComparer = class(TComparer<TVideoCaptureSetting>)
      function Compare(const Left, Right: TVideoCaptureSetting): Integer; override;
    end;
    TFrameRateComparer = class(TComparer<TVideoCaptureSetting>)
      function Compare(const Left, Right: TVideoCaptureSetting): Integer; override;
    end;
  private
    FWidth: Integer;
    FHeight: Integer;
    FFrameRate: Double;
    FMinFrameRate: Double;
    FMaxFrameRate: Double;

  public
    /// <summary>Creates a new record with default parameters.</summary>
    class function Create: TVideoCaptureSetting; overload; static; inline;
    /// <summary>Creates a new record with the given configuration.</summary>
    /// <remarks>This function also initialices the min and max frame rates with AFrameRate value.</remarks>
    class function Create(const AWidth, AHeight: Integer; const AFrameRate: Single): TVideoCaptureSetting; overload; static; inline;
    /// <summary>Configures the frame rates.</summary>
    /// <param name="AValue">Value for the frame rate and the minimum frame rate.</param>
    /// <param name="AMaxValue">Value for the maximum frame rate.</param>
    procedure SetFrameRate(const AValue, AMaxValue: Double); overload;
    /// <summary>Configures the frame rates.</summary>
    /// <param name="AValue">Value for the frame and the minimum and maximum frame rate as well.</param>
    procedure SetFrameRate(const AValue: Double); overload;
    /// <summary>Get the frame(width and height) size.</summary>
    function GetSize: TSize;
    /// <summary>Function to compare two configurations with a priority.</summary>
    function IsSmallerThan(const ASetting: TVideoCaptureSetting; APriority: TVideoCaptureSettingPriority): Boolean;

    /// <summary>Width of the frame</summary>
    property Width: Integer read FWidth write FWidth;
    /// <summary>Height of the frame</summary>
    property Height: Integer read FHeight write FHeight;
    /// <summary>Frame rate of the frame</summary>
    property FrameRate: Double read FFrameRate write SetFrameRate;
    /// <summary>Maximum allowed frame rate for a configuration</summary>
    property MaxFrameRate: Double read FMaxFrameRate;
    /// <summary>Minimum allowed frame rate for a configuration</summary>
    property MinFrameRate: Double read FMinFrameRate;
  end;

  /// <summary>Defines a video capturing device.</summary>
  TVideoCaptureDevice = class(TCaptureDevice)
  private
    FOnSampleBufferReady: TSampleBufferReadyEvent;
    FCaptureSettingPriority: TVideoCaptureSettingPriority;
    FQuality: TVideoCaptureQuality;

    procedure InternalSetCaptureSetting(const ASetting: TVideoCaptureSetting);
    function GetDefaultCanvasCaptureSettings: TArray<TVideoCaptureSetting>;
  protected
    function GetPosition: TDevicePosition; virtual;
    function GetQuality: TVideoCaptureQuality; virtual;
    procedure SetQuality(const Value: TVideoCaptureQuality);
    /// <summary>Method subclasses should override to configure the desired quality.</summary>
    procedure DoSetQuality(const Value: TVideoCaptureQuality); virtual;
    function GetHasFlash: Boolean; virtual;
    function GetFlashMode: TFlashMode; virtual;
    procedure SetFlashMode(const Value: TFlashMode); virtual;
    function GetHasTorch: Boolean; virtual;
    function GetTorchMode: TTorchMode; virtual;
    procedure SetTorchMode(const Value: TTorchMode); virtual;
    function GetFocusMode: TFocusMode; virtual;
    procedure SetFocusMode(const Value: TFocusMode); virtual;
    function GetMediaType: TMediaType; override;
    procedure SampleBufferReady(const ATime: TMediaTime);
    procedure DoSampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean); virtual; abstract;
    /// <summary>Returns the current frame configuration.</summary>
    function GetCaptureSetting: TVideoCaptureSetting; virtual; abstract;
    /// <summary>Configures the capture frame with the given settings.</summary>
    /// <returns>True if this operation was successful, and false otherwise.</returns>
    function DoSetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean; virtual; abstract;
    /// <summary>Returns the available capture settings.</summary>
    /// <remarks>The array cannot be sorted.</remarks>
    function DoGetAvailableCaptureSettings: TArray<TVideoCaptureSetting>; virtual; abstract;
    /// <summary>Returns a new capture settings configuration with given parameters.</summary>
    /// <remarks>This function exists to allow this class subclasses to access to private fields of the frame configuration.
    /// </remarks>
    function CreateCaptureSettings(const AWidth, AHeight: Integer;const AFrameRate, AMinFrameRate, AMaxFrameRate: Double): TVideoCaptureSetting;
  public
    /// <summary>Constructor.</summary>
    /// <param name="AManager">Manager who is managing this device.</param>
    /// <param name="ADefault">True is this is the default device for the manager, False otherwise.</param>
    constructor Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean); override;
    procedure SampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean);
    /// <summary>Configures the capture frame with the given settings.</summary>
    /// <returns>True if this operation was successful, and false otherwise.</returns>
    function SetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean;
    /// <summary>Returns the available capture settings taking in account the canvas class bitmap size limitations.</summary>
    /// <remarks>The returning array is sorted with the CaptureSettingPriority criteria.</remarks>
    function GetAvailableCaptureSettings(const ACanvasClass: TCanvasClass): TArray<TVideoCaptureSetting>;

    /// <summary>Returns the available capture settings using the default canvas class to keep the limitation of the
    /// bitmap size.</summary>
    /// <remarks>The returning array is sorted with the CaptureSettingPriority criteria.</remarks>
    property AvailableCaptureSettings: TArray<TVideoCaptureSetting> read GetDefaultCanvasCaptureSettings;
    /// <summary>Current frame configuration.</summary>
    property CaptureSetting: TVideoCaptureSetting read GetCaptureSetting write InternalSetCaptureSetting;
    /// <summary>Current settings sort priority.</summary>
    /// <remarks>When you retrieve the available frame settings, the are sorted by one priority criteria. This criteria is
    /// this property</remarks>
    property CaptureSettingPriority: TVideoCaptureSettingPriority read FCaptureSettingPriority write FCaptureSettingPriority;
    property Position: TDevicePosition read GetPosition;
    /// <summary>Current frame configuration.</summary>
    /// <remarks>You can use this property to assign a preset for the capture frame. If the platform has its own presets,
    /// this property manage them directly. If not, this property manages the available capture settings to configure
    /// the capture frame from the worse configuration (low quality) to the best one (photo). To get a more sophisticated
    /// control, you can manage available capture settings directly instead.</remarks>
    property Quality: TVideoCaptureQuality read GetQuality write SetQuality;
    property HasFlash: Boolean read GetHasFlash;
    property HasTorch: Boolean read GetHasTorch;
    property FlashMode: TFlashMode read GetFlashMode write SetFlashMode;
    property FocusMode: TFocusMode read GetFocusMode write SetFocusMode;
    property TorchMode: TTorchMode read GetTorchMode write SetTorchMode;
    property OnSampleBufferReady: TSampleBufferReadyEvent read FOnSampleBufferReady write FOnSampleBufferReady;
  end;

  TCaptureDeviceList = TObjectList<TCaptureDevice>;
  TCaptureDeviceClassList = TList<TCaptureDeviceClass>;

  TCaptureDeviceManager = class abstract
  private class var
    FCustomDevices: TCaptureDeviceClassList;
    FCurrentManager: TCaptureDeviceManager;
    class function InternalGetCaptureDeviceManager: TCaptureDeviceManager; static;
  protected
    procedure AddDevice(const Device: TCaptureDevice);
    procedure RemoveDevice(const Device: TCaptureDevice);
  private
    FDevices: TCaptureDeviceList;
    FDevicesByKind: TCaptureDeviceList;
    function GetCount: Integer; inline;
    function GetDevice(Index: Integer): TCaptureDevice; inline;
    function GetDefaultAudioCaptureDevice: TAudioCaptureDevice;
    function GetDefaultVideoCaptureDevice: TVideoCaptureDevice;
  public
    /// <summary>Default constructor.</summary>
    constructor Create; virtual;
    destructor Destroy; override;
    // Reserved for internal use only - do not call directly!
    class procedure UnInitialize; static;
    // Register a custom capture device class with a file extension, description
    class procedure RegisterCaptureDeviceClass(const CaptureDeviceClass: TCaptureDeviceClass);
    // Create list of available devices
    function GetDevicesByMediaType(MediaType: TMediaType): TCaptureDeviceList;
    function GetDefaultDeviceByMediaType(MediaType: TMediaType): TCaptureDevice;
    function GetDevicesByName(const Name: string): TCaptureDevice;
    // Properties
    property Count: Integer read GetCount;
    property DefaultAudioCaptureDevice: TAudioCaptureDevice read GetDefaultAudioCaptureDevice;
    property DefaultVideoCaptureDevice: TVideoCaptureDevice read GetDefaultVideoCaptureDevice;
    property Devices[Index: Integer]: TCaptureDevice read GetDevice; default;
    // Access to current Manager
    class property Current: TCaptureDeviceManager read InternalGetCaptureDeviceManager;
  end;

{ TCameraComponent }

  TCameraKind = (Default, FrontCamera, BackCamera);

  TCameraKindHelper = record helper for TCameraKind
  const
    ckDefault = TCameraKind.Default deprecated 'Use TCameraKind.Default';
    ckFrontCamera = TCameraKind.FrontCamera deprecated 'Use TCameraKind.FrontCamera';
    ckBackCamera = TCameraKind.BackCamera deprecated 'Use TCameraKind.BackCamera';
  end;

  /// <summary>Nonvisual component for a camera device.</summary>
  TCameraComponent = class(TFmxObject)
  private
    FOnSampleBufferReady: TSampleBufferReadyEvent;
    FCameraKind: TCameraKind;
    FDevice: TVideoCaptureDevice;
    FActive: Boolean;
    function GetDevice: TVideoCaptureDevice;
    procedure SetCameraKind(const Value: TCameraKind);
    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);
    function GetFlashMode: TFlashMode;
    function GetFocusMode: TFocusMode;
    function GetHasFlash: Boolean;
    function GetHasTorch: Boolean;
    function GetQuality: TVideoCaptureQuality;
    function GetTorchMode: TTorchMode;
    procedure SetFlashMode(const Value: TFlashMode);
    procedure SetFocusMode(const Value: TFocusMode);
    procedure SetQuality(const Value: TVideoCaptureQuality);
    procedure SetTorchMode(const Value: TTorchMode);
    /// <summary>Sets the priority to sort the result of available frame settings.</summary>
    procedure SetCaptureSettingPriority(const APriority: TVideoCaptureSettingPriority);
    /// <summary>Gets the priority criteria to sort the result of available frame settings.</summary>
    function GetCaptureSettingPriority: TVideoCaptureSettingPriority;
    procedure InternalSetCaptureSetting(const ASetting: TVideoCaptureSetting);
  protected
    procedure DoStart;
    procedure DoStop;
    procedure DoSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
    property Device: TVideoCaptureDevice read GetDevice;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean);
    /// <summary>Returns the current frame configuration.</summary>
    function GetCaptureSetting: TVideoCaptureSetting;
    /// <summary>Sets the current frame configuration.</summary>
    function SetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean;
    /// <summary>Returns the available capture settings.</summary>
    /// <remarks>The returning array is sorted with the CaptureSettingPriority criteria.</remarks>
    function GetDefaultCanvasCaptureSettings: TArray<TVideoCaptureSetting>;
    /// <summary>Returns the available capture settings taking in account the canvas class bitmap size limitations.</summary>
    /// <remarks>The returning array is sorted with the CaptureSettingPriority criteria.</remarks>
    function GetAvailableCaptureSettings(const ACanvasClass: TCanvasClass): TArray<TVideoCaptureSetting>;
  public
    /// <summary>Available capture settings.</summary>
    /// <remarks>This array is sorted with the CaptureSettingPriority criteria.</remarks>
    property AvailableCaptureSettings: TArray<TVideoCaptureSetting> read GetDefaultCanvasCaptureSettings;
    /// <summary>Current frame capture configuration.</summary>
    property CaptureSetting: TVideoCaptureSetting read GetCaptureSetting write InternalSetCaptureSetting;
    /// <summary>Priority criteria to sort the result of available frame settings (AvailableCaptureSettings property).</summary>
    property CaptureSettingPriority: TVideoCaptureSettingPriority read GetCaptureSettingPriority write SetCaptureSettingPriority;
    property Quality: TVideoCaptureQuality read GetQuality write SetQuality;
    property HasFlash: Boolean read GetHasFlash;
    property HasTorch: Boolean read GetHasTorch;
    property FlashMode: TFlashMode read GetFlashMode write SetFlashMode;
    property FocusMode: TFocusMode read GetFocusMode write SetFocusMode;
    property TorchMode: TTorchMode read GetTorchMode write SetTorchMode;
  published
    property Active: Boolean read GetActive write SetActive default False;
    property Kind: TCameraKind read FCameraKind write SetCameraKind default TCameraKind.Default;
    property OnSampleBufferReady: TSampleBufferReadyEvent read FOnSampleBufferReady write FOnSampleBufferReady;
  end;

{ TMedia }

  EMediaException = class(Exception);

  TMediaState = (Unavailable, Playing, Stopped);

  TMediaPlayerControl = class;

  TMedia = class abstract
  private
    FFileName: string;
    FControl: TMediaPlayerControl;
    procedure SetControl(const Value: TMediaPlayerControl);
  protected
    function GetDuration: TMediaTime; virtual; abstract;
    function GetCurrent: TMediaTime; virtual; abstract;
    procedure SetCurrent(const Value: TMediaTime); virtual; abstract;
    function GetVideoSize: TPointF; virtual; abstract;
    function GetMediaState: TMediaState; virtual; abstract;
    function GetVolume: Single; virtual; abstract;
    procedure SetVolume(const Value: Single); virtual; abstract;
    procedure UpdateMediaFromControl; virtual;
    procedure DoPlay; virtual; abstract;
    procedure DoStop; virtual; abstract;
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall; abstract;
  public
    constructor Create(const AFileName: string); virtual;
    procedure Play;
    procedure Stop;
    property Control: TMediaPlayerControl read FControl write SetControl;
    property FileName: string read FFileName;
    property Duration: TMediaTime read GetDuration;
    property CurrentTime: TMediaTime read GetCurrent write SetCurrent;
    property VideoSize: TPointF read GetVideoSize;
    // Volume values 0..1
    property Volume: Single read GetVolume write SetVolume;
    property State: TMediaState read GetMediaState;
  end;

{ TMediaCodec }

  TCustomMediaCodec = class abstract
  public
    function CreateFromFile(const AFileName: string): TMedia; virtual; abstract;
  end;
  TCustomMediaCodecClass = class of TCustomMediaCodec;

{ TMediaCodecManager }

  EMediaCodecManagerException = class(Exception);

  TMediaCodecManager = class sealed
  public type
    TMediaCodecClassDescriptor = record
      Extension: string;
      Description: string;
      MediaType: TMediaType;
      MediaCodecClass: TCustomMediaCodecClass;
    end;
  strict private type
    TMediaCodecDescriptorField = (Extension, Description);
  strict private
    class var FMediaCodecClassDescriptors: TList<TMediaCodecClassDescriptor>;
    class function FindMediaCodecDescriptor(const Name: string; Field: TMediaCodecDescriptorField): TMediaCodecClassDescriptor;
  private
  public
    // Reserved for internal use only - do not call directly!
    class procedure UnInitialize;
    // Register a Media codec class with a file extension, description
    class procedure RegisterMediaCodecClass(const Extension, Description: string; MediaType: TMediaType; MediaCodecClass: TCustomMediaCodecClass); overload;
    // Helpful function
    class function GetFileTypes: string;
    class function GetFileTypesByType(MediaType: TMediaType): string;
    class function GetFilterString: string;
    class function GetFilterStringByType(MediaType: TMediaType): string;
    class function IsCodedExists(const AFileName: string): Boolean; overload;
    class function CreateFromFile(const AFileName: string): TMedia;
  end;

{ TMediaPlayer }

  TMediaPlayer = class(TFmxObject)
  private
    FMedia: TMedia;
    FFileName: string;
    FControl: TMediaPlayerControl;
    procedure SetControl(const Value: TMediaPlayerControl);
    procedure SetFileName(const Value: string);
    function GetMediaState: TMediaState;
    function GetCurrent: TMediaTime;
    function GetDuration: TMediaTime;
    function GetMedia: TMedia;
    function GetVideoSize: TPointF;
    function GetVolume: Single;
    procedure SetCurrent(const Value: TMediaTime);
    procedure SetVolume(const Value: Single);
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; override; stdcall;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Play;
    procedure Stop;
    procedure Clear;
    property Media: TMedia read GetMedia;
    property Duration: TMediaTime read GetDuration;
    property CurrentTime: TMediaTime read GetCurrent write SetCurrent;
    property VideoSize: TPointF read GetVideoSize;
    property Volume: Single read GetVolume write SetVolume;
    property State: TMediaState read GetMediaState;
  published
    property FileName: string read FFileName write SetFileName;
  end;

{ TMediaPlayerControl }

  TMediaPlayerControl = class(TControl)
  private
    FMediaPlayer: TMediaPlayer;
    procedure SetMediaPlayer(const Value: TMediaPlayer);
    procedure UpdateMedia;
    procedure FormHandleAfterCreated(const Sender: TObject; const Msg: TMessage);
    procedure FormHandleBeforeDestroyed(const Sender: TObject; const Msg: TMessage);
  protected
    procedure AncestorVisibleChanged(const Visible: Boolean); override;
    procedure ParentChanged; override;
    procedure DoAbsoluteChanged; override;
    procedure Move; override;
    procedure Resize; override;
    procedure Paint; override;
    procedure Show; override;
    procedure Hide; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Size;
    property Align;
    property Anchors;
    property Height;
    property Padding;
    property MediaPlayer: TMediaPlayer read FMediaPlayer write SetMediaPlayer;
    property Margins;
    property Position;
    property Visible default True;
    property Width;
  end;

  /// <summary>Base class for FireMonkey actions that work on an instance of
  /// TMediaPlayer.</summary>
  TCustomMediaPlayerAction = class(TCustomAction)
  private
    [Weak] FMediaPlayer: TMediaPlayer;
    procedure SetMediaPlayer(const Value: TMediaPlayer);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    /// <summary> This constructor after performing the constructor ancestor, tries to find TMediaPlayer child component
    /// in the AOwner, and in case of success assigns it to the property MediaPlayer </summary>
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    function Update: Boolean; override;
    /// <summary> Reference to an instance of an object TMediaPlayer. Over this object is managed </summary>
    property MediaPlayer: TMediaPlayer read FMediaPlayer write SetMediaPlayer;
  published
    property CustomText;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property UnsupportedArchitectures;
    property OnUpdate;
  end;

  /// <summary>FireMonkey media player action that starts or resumes the
  /// playback of its media player.</summary>
  TMediaPlayerStart = class(TCustomMediaPlayerAction)
  protected
    procedure CustomTextChanged; override;
  public
    function Update: Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property MediaPlayer;
  end;

  /// <summary>FireMonkey media player action that stops the playback and resets
  /// the CurrentTime of its media player to 0.</summary>
  TMediaPlayerStop = class(TCustomMediaPlayerAction)
  protected
    procedure CustomTextChanged; override;
  public
    function Update: Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property MediaPlayer;
  end;

  /// <summary>FireMonkey media player action that starts or resumes the
  /// playback of its media player if the state of the media player is Stopped,
  /// or stops the playback if the state of the media player is
  /// Playing.</summary>
  TMediaPlayerPlayPause = class(TCustomMediaPlayerAction)
  protected
    procedure CustomTextChanged; override;
  public
    function Update: Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property MediaPlayer;
  end;

  /// <summary>Base class for FireMonkey media player actions for controls with
  /// ValueRange-type properties.</summary>
  TMediaPlayerValue = class(TCustomValueRangeAction)
  public type
    TState = (Normal, ActionUpdating, ValueUpdating);
  private
    [Weak] FMediaPlayer: TMediaPlayer;
    FState: TState;
    procedure SetMediaPlayer(const Value: TMediaPlayer);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function CreateValueRange: TCustomValueRange; override;
    /// <summary> This property indicates what state of the action. Normal state, properties change of action, or
    /// properties change of player. </summary>
    property State: TState read FState;
    /// <summary> This virtual method is called when you needed to change properties of the current action according to
    /// the settings of the MediaPlayer. </summary>
    procedure UpdateValueAction; virtual;
    /// <summary> This virtual method is called when you needed to change properties of the MediaPlayer according to
    /// the settings of the current action </summary>
    procedure UpdateValuePlayer; virtual;
  public
    /// <summary> Performs the same as TCustomMediaPlayerAction.Create </summary>
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    function Update: Boolean; override;
    /// <summary> Reference to an instance of an object TMediaPlayer. Over this object is managed </summary>
    property MediaPlayer: TMediaPlayer read FMediaPlayer write SetMediaPlayer;
  published
    property CustomText;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property UnsupportedArchitectures;
    property OnUpdate;
  end;

  /// <summary>
  /// This action designed for changing of current time of MediaPlayer. Property ValueRange contains the length of the
  /// track and the current time in seconds (see Max, Value). The Text property of this action contains the current
  /// time as text.
  /// </summary>
  ///  <remarks> To change the format of displayed text, use the property CustomText.
  ///  <para>For example:</para> <code>MediaPlayerCurrentTime1.CustomText := '''Time: '' nn:ss.zzz';</code>
  ///  </remarks>
  TMediaPlayerCurrentTime = class(TMediaPlayerValue)
  protected
    function CreateValueRange: TCustomValueRange; override;
    procedure UpdateValueAction; override;
    procedure UpdateValuePlayer; override;
    procedure CustomTextChanged; override;
  published
    property MediaPlayer;
  end;

  /// <summary>Action that provides control over the Volume property of a
  /// FireMonkey media player.</summary>
  TMediaPlayerVolume = class(TMediaPlayerValue)
  private const
    PrecentCount = 100;
  protected
    function CreateValueRange: TCustomValueRange; override;
    procedure UpdateValueAction; override;
    procedure UpdateValuePlayer; override;
    procedure CustomTextChanged; override;
  published
    property MediaPlayer;
  end;

implementation

uses
  System.SysConst, System.TypInfo, System.Math, System.Actions, FMX.Forms, FMX.Consts
{$IFDEF MSWINDOWS}
  , FMX.Media.Win
{$ENDIF}
{$IFDEF MACOS}
  , FMX.Media.AVFoundation,
{$IFDEF IOS}
  FMX.Media.iOS
{$ELSE}
  FMX.Media.Mac
{$ENDIF}
{$ENDIF}
{$IFDEF ANDROID}
  , FMX.Media.Android
{$ENDIF ANDROID}
;

{ TMediaTimeHelper }

function TMediaTimeHelper.ToDateTime: TDateTime;
begin
  Result := Self / MediaTimeScale / SecsPerDay;
end;

function TMediaTimeHelper.ToString: string;
begin
  Result := TimeToStr(ToDateTime);
end;

{ TCaptureDeviceManager }

class procedure TCaptureDeviceManager.UnInitialize;
begin
  FreeAndNil(FCustomDevices);
  FreeAndNil(FCurrentManager);
end;

class function TCaptureDeviceManager.InternalGetCaptureDeviceManager: TCaptureDeviceManager;
var
  DeviceClass: TCaptureDeviceClass;
begin
  if FCurrentManager = nil then
  begin
    {$IFDEF MSWINDOWS}
    FCurrentManager := TWindowsCaptureDeviceManager.Create;
    {$ENDIF}
    {$IFDEF IOS}
    FCurrentManager := TAVCaptureDeviceManager.Create;
    {$ENDIF}
    {$IFDEF MACOS}
    {$IFNDEF NEXTGEN}
    FCurrentManager := TAVCaptureDeviceManager.Create;
    {$ENDIF}
    {$ENDIF}
    {$IFDEF ANDROID}
    FCurrentManager := TAndroidCaptureDeviceManager.Create;
    {$ENDIF}
    if FCurrentManager = nil then
      raise ECaptureDeviceException.Create(SNoCaptureDeviceManager);
    // Add custom devices
    if FCustomDevices <> nil then
      for DeviceClass in FCustomDevices do
        DeviceClass.Create(FCurrentManager, False);
  end;
  Result := FCurrentManager;
end;

constructor TCaptureDeviceManager.Create;
begin
  inherited Create;
  FDevices := TCaptureDeviceList.Create;
  FDevicesByKind := TCaptureDeviceList.Create;
  FDevicesByKind.OwnsObjects := False;
end;

destructor TCaptureDeviceManager.Destroy;
begin
  FreeAndNil(FDevicesByKind);
  FreeAndNil(FDevices);
  inherited;
end;

procedure TCaptureDeviceManager.AddDevice(const Device: TCaptureDevice);
begin
  if (FDevices <> nil) and (FDevices.IndexOf(Device) < 0) then
    FDevices.Add(Device);
end;

class procedure TCaptureDeviceManager.RegisterCaptureDeviceClass(const CaptureDeviceClass: TCaptureDeviceClass);
begin
  if FCustomDevices = nil then
    FCustomDevices := TCaptureDeviceClassList.Create;
  FCustomDevices.Add(CaptureDeviceClass);
end;

procedure TCaptureDeviceManager.RemoveDevice(const Device: TCaptureDevice);
begin
  if (FDevices <> nil) and (Device <> nil) and (Device.FManager <> nil) then
  begin
    Device.FManager := nil;
    FDevices.Remove(Device);
  end;
end;

function TCaptureDeviceManager.GetCount: Integer;
begin
  Result := FDevices.Count;
end;

function TCaptureDeviceManager.GetDefaultDeviceByMediaType(MediaType: TMediaType): TCaptureDevice;
var
  I: Integer;
  FirstDevice, Device: TCaptureDevice;
begin
  Result := nil;
  FirstDevice := nil;
  for I := 0 to Count - 1 do
  begin
    Device := Devices[I];
    if (Device.MediaType = MediaType) then
    begin
      if (Device.IsDefault) then
      begin
        Result := Device;
        Break;
      end;
      FirstDevice := Device;
    end;
  end;
  if Result = nil then
    Result := FirstDevice;
end;

function TCaptureDeviceManager.GetDefaultAudioCaptureDevice: TAudioCaptureDevice;
var
  LDevice: TCaptureDevice ;
begin
  LDevice := GetDefaultDeviceByMediaType(TMediaType.Audio);
  if LDevice <> nil then
    Result := TAudioCaptureDevice(LDevice)
  else
    Result := nil;
end;

function TCaptureDeviceManager.GetDefaultVideoCaptureDevice: TVideoCaptureDevice;
var
  LDevice: TCaptureDevice;
begin
  LDevice := GetDefaultDeviceByMediaType(TMediaType.Video);
  if LDevice <> nil then
    Result := TVideoCaptureDevice(LDevice)
  else
    Result := nil;
end;

function TCaptureDeviceManager.GetDevice(Index: Integer): TCaptureDevice;
begin
  Result := FDevices[Index];
end;

function TCaptureDeviceManager.GetDevicesByMediaType(MediaType: TMediaType): TCaptureDeviceList;
var
  I: Integer;
  Device: TCaptureDevice;
begin
  FDevicesByKind.Clear;
  for I := 0 to Count - 1 do
  begin
    Device := Devices[I];
    if Device.MediaType = MediaType then
    begin
      FDevicesByKind.Add(Device);
    end;
  end;
  Result := FDevicesByKind;
end;

function TCaptureDeviceManager.GetDevicesByName(const Name: string): TCaptureDevice;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
    if SameText(Devices[I].Name, Name, loUserLocale) then
      Result := Devices[I];
end;

{ TCaptureDevice }

constructor TCaptureDevice.Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean);
begin
  inherited Create;
  FManager := AManager;
  FDefault := ADefault;
end;

destructor TCaptureDevice.Destroy;
begin
  StopCapture;
  if FManager <> nil then
    FManager.RemoveDevice(Self);
  inherited;
end;

procedure TCaptureDevice.AfterConstruction;
begin
  inherited;
  if FManager <> nil then
    FManager.AddDevice(Self);
end;

function TCaptureDevice.GetDeviceProperty(const Prop: TProperty): string;
begin
  Result := '';
end;

procedure TCaptureDevice.StartCapture;
begin
  StopCapture;
  DoStartCapture;
end;

procedure TCaptureDevice.StopCapture;
begin
  if State = TCaptureDeviceState.Capturing then
    DoStopCapture;
end;

{ TAudioCaptureDevice }

function TAudioCaptureDevice.GetFilterString: string;
begin
  Result := '';
end;

function TAudioCaptureDevice.GetMediaType: TMediaType;
begin
  Result := TMediaType.Audio;
end;

procedure TAudioCaptureDevice.SetFileName(const Value: string);
begin
  FFileName := Value;
end;

{ TVideoCaptureDevice }

function TVideoCaptureDevice.GetPosition: TDevicePosition;
begin
  Result := TDevicePosition.Unspecified;
end;

function TVideoCaptureDevice.GetFlashMode: TFlashMode;
begin
  Result := TFlashMode.FlashOff;
end;

function TVideoCaptureDevice.GetFocusMode: TFocusMode;
begin
  Result := TFocusMode.AutoFocus;
end;

function TVideoCaptureDevice.GetHasFlash: Boolean;
begin
  Result := False;
end;

function TVideoCaptureDevice.GetHasTorch: Boolean;
begin
  Result := False;
end;

function TVideoCaptureDevice.GetMediaType: TMediaType;
begin
  Result := TMediaType.Video;
end;

function TVideoCaptureDevice.GetQuality: TVideoCaptureQuality;
begin
  Result := FQuality;
end;

function TVideoCaptureDevice.GetTorchMode: TTorchMode;
begin
  Result := TTorchMode.ModeOff;
end;

procedure TVideoCaptureDevice.SampleBufferReady(const ATime: TMediaTime);
begin
  if Assigned(FOnSampleBufferReady) then
    FOnSampleBufferReady(Self, ATime);
end;

procedure TVideoCaptureDevice.SampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean);
begin
  DoSampleBufferToBitmap(ABitmap, ASetSize);
end;

procedure TVideoCaptureDevice.SetFlashMode(const Value: TFlashMode);
begin
end;

procedure TVideoCaptureDevice.SetFocusMode(const Value: TFocusMode);
begin

end;

constructor TVideoCaptureDevice.Create(const AManager: TCaptureDeviceManager; const ADefault: Boolean);
begin
  inherited;
  FQuality := TVideoCaptureQuality.CaptureSettings;
end;

function TVideoCaptureDevice.CreateCaptureSettings(const AWidth, AHeight: Integer; const AFrameRate, AMinFrameRate,
  AMaxFrameRate: Double): TVideoCaptureSetting;
begin
  Result.FWidth := AWidth;
  Result.FHeight := AHeight;
  Result.FFrameRate := AFrameRate;
  Result.FMinFrameRate := AMinFrameRate;
  Result.FMaxFrameRate := AMaxFrameRate;
end;

function TVideoCaptureDevice.GetAvailableCaptureSettings(const ACanvasClass: TCanvasClass): TArray<TVideoCaptureSetting>;
var
  CurrentSettingIndex, Last: Integer;
  Comparer: IComparer<TVideoCaptureSetting>;
  MaxSizeLimit: Integer;
begin
  Result := DoGetAvailableCaptureSettings;

  // Check resolutions allowed in a canvas class
  if ACanvasClass <> nil then
  begin
    Last := High(Result);
    MaxSizeLimit := ACanvasClass.GetAttribute(TCanvasAttribute.MaxBitmapSize);
    CurrentSettingIndex := Low(Result);
    while CurrentSettingIndex <= Last do
    begin
      if (Result[CurrentSettingIndex].Width < MaxSizeLimit) and (Result[CurrentSettingIndex].Height < MaxSizeLimit) then
        Inc(CurrentSettingIndex)
      else
      begin
        Result[CurrentSettingIndex] := Result[Last];
        Dec(Last);
      end;
    end;
    SetLength(Result, CurrentSettingIndex);
  end;

  // Sort the resolutions
  case FCaptureSettingPriority of
    TVideoCaptureSettingPriority.Resolution:
      Comparer := TVideoCaptureSetting.TResolutionComparer.Create;
    TVideoCaptureSettingPriority.FrameRate:
      Comparer := TVideoCaptureSetting.TFrameRateComparer.Create;
  end;
  TArray.Sort<TVideoCaptureSetting>(Result, Comparer);
end;

function TVideoCaptureDevice.GetDefaultCanvasCaptureSettings: TArray<TVideoCaptureSetting>;
begin
  Result := GetAvailableCaptureSettings(TCanvasManager.DefaultCanvas);
end;

function TVideoCaptureDevice.SetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean;
var
  Settings: TArray<TVideoCaptureSetting>;
  Setting: TVideoCaptureSetting;
  I: Integer;
  Selected: Integer;
begin
  Result := False;
  // Select the lowest resolution that outbounds the desired one
  Settings := GetDefaultCanvasCaptureSettings;

  if Length(Settings) > 0 then
  begin
    Selected := -1;

    for I := High(Settings) downto 0 do
      if (Settings[I].Width >= ASetting.Width) and (Settings[I].Height >= ASetting.Height) and
        (Settings[I].MaxFrameRate >= ASetting.FrameRate) then
      begin
        Selected := I;
        Break;
      end;

    // We haven't find any available resolution, so use the best one.
    if Selected < 0 then
      Selected := 0;

    Setting := Settings[Selected];
    Setting := CreateCaptureSettings(Setting.Width, Setting.Height,
      EnsureRange(ASetting.FrameRate, Setting.MinFrameRate, Setting.MaxFrameRate), Setting.MinFrameRate,
      Setting.MaxFrameRate);

    Result := DoSetCaptureSetting(Setting);
    if Result then
      FQuality := TVideoCaptureQuality.CaptureSettings;
  end;
end;

procedure TVideoCaptureDevice.InternalSetCaptureSetting(const ASetting: TVideoCaptureSetting);
begin
  SetCaptureSetting(ASetting);
end;

procedure TVideoCaptureDevice.SetQuality(const Value: TVideoCaptureQuality);
begin
  if FQuality <> Value then
  begin
    DoSetQuality(Value);
  end;
end;

procedure TVideoCaptureDevice.DoSetQuality(const Value: TVideoCaptureQuality);
begin
  FQuality := Value;
end;

procedure TVideoCaptureDevice.SetTorchMode(const Value: TTorchMode);
begin

end;

{ TCameraComponent }

constructor TCameraComponent.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TCameraComponent.Destroy;
begin
  if FDevice <> nil then
    FDevice.OnSampleBufferReady := nil;
  inherited;
end;

function TCameraComponent.GetDevice: TVideoCaptureDevice;
var
  I: Integer;
  D: TCaptureDevice;
begin
  Result := FDevice;
  if (Result = nil) and (TCaptureDeviceManager.Current <> nil) then
  begin
    for I := 0 to TCaptureDeviceManager.Current.Count - 1 do
    begin
      D := TCaptureDeviceManager.Current.Devices[I];
      if (D.GetMediaType = TMediaType.Video) and (D is TVideoCaptureDevice) then
      begin
        if (Kind = TCameraKind.FrontCamera) and (TVideoCaptureDevice(D).Position = TDevicePosition.Front) then
        begin
          Result := TVideoCaptureDevice(D);
          Break;
        end;
        if (Kind = TCameraKind.BackCamera) and (TVideoCaptureDevice(D).Position = TDevicePosition.Back) then
        begin
          Result := TVideoCaptureDevice(D);
          Break;
        end;
      end;
    end;
    if Result = nil then
      Result := TCaptureDeviceManager.Current.DefaultVideoCaptureDevice;
  end;
end;

function TCameraComponent.GetFlashMode: TFlashMode;
begin
  if Device <> nil then
    Result := Device.FlashMode
  else
    Result := TFlashMode.FlashOff;
end;

function TCameraComponent.GetFocusMode: TFocusMode;
begin
  if Device <> nil then
    Result := Device.FocusMode
  else
    Result := TFocusMode.AutoFocus;
end;

function TCameraComponent.GetHasFlash: Boolean;
begin
  if Device <> nil then
    Result := Device.HasFlash
  else
    Result := False;
end;

function TCameraComponent.GetHasTorch: Boolean;
begin
  if Device <> nil then
    Result := Device.HasTorch
  else
    Result := False;
end;

function TCameraComponent.GetQuality: TVideoCaptureQuality;
begin
  if Device <> nil then
    Result := Device.GetQuality
  else
    Result := TVideoCaptureQuality.PhotoQuality;
end;

function TCameraComponent.GetTorchMode: TTorchMode;
begin
  if Device <> nil then
    Result := Device.TorchMode
  else
    Result := TTorchMode.ModeOff;
end;

procedure TCameraComponent.DoSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
begin
  if Assigned(FOnSampleBufferReady) then
    FOnSampleBufferReady(Self, ATime);
end;

procedure TCameraComponent.DoStart;
begin
  Device.StartCapture;
  if FDevice <> nil then
    FDevice.OnSampleBufferReady := DoSampleBufferReady;
end;

procedure TCameraComponent.DoStop;
begin
  Device.StopCapture;
  if FDevice <> nil then
    FDevice.OnSampleBufferReady := nil;
end;

function TCameraComponent.GetActive: Boolean;
begin
  if (csDesigning in ComponentState) then
    Result := FActive
  else
    Result := (TCaptureDeviceManager.Current <> nil) and (FDevice <> nil) and FActive;
end;

procedure TCameraComponent.SampleBufferToBitmap(const ABitmap: TBitmap; const ASetSize: Boolean);
begin
  if Active then
    FDevice.SampleBufferToBitmap(ABitmap, ASetSize);
end;

function TCameraComponent.GetCaptureSettingPriority: TVideoCaptureSettingPriority;
begin
  if Device <> nil then
    Result := Device.CaptureSettingPriority
  else
    Result := TVideoCaptureSettingPriority.Resolution;
end;

function TCameraComponent.GetCaptureSetting: TVideoCaptureSetting;
begin
  if Device <> nil then
    Result := Device.GetCaptureSetting
  else
    Result := TVideoCaptureSetting.Create;
end;

procedure TCameraComponent.SetCaptureSettingPriority(const APriority: TVideoCaptureSettingPriority);
begin
  if Device <> nil then
    Device.CaptureSettingPriority := APriority;
end;

function TCameraComponent.SetCaptureSetting(const ASetting: TVideoCaptureSetting): Boolean;
begin
  if Device <> nil then
    Result := Device.SetCaptureSetting(ASetting)
  else
    Result := False;
end;

procedure TCameraComponent.InternalSetCaptureSetting(const ASetting: TVideoCaptureSetting);
begin
  SetCaptureSetting(ASetting);
end;

function TCameraComponent.GetDefaultCanvasCaptureSettings: TArray<TVideoCaptureSetting>;
begin
  if Device <> nil then
    Result := Device.GetDefaultCanvasCaptureSettings
  else
    SetLength(Result, 0);
end;

function TCameraComponent.GetAvailableCaptureSettings(const ACanvasClass: TCanvasClass): TArray<TVideoCaptureSetting>;
begin
  if Device <> nil then
    Result := Device.GetAvailableCaptureSettings(ACanvasClass)
  else
    SetLength(Result, 0);
end;

procedure TCameraComponent.SetActive(const Value: Boolean);
begin
  if (FActive <> Value) then
  begin
    FActive := Value;
    if not (csDesigning in ComponentState) and (TCaptureDeviceManager.Current <> nil) then
    begin
      FDevice := GetDevice;
      if FDevice <> nil then
      begin
        if FActive then
          DoStart
        else
          DoStop;
      end;
    end;
  end;
end;

procedure TCameraComponent.SetCameraKind(const Value: TCameraKind);
var
  SaveActive: Boolean;
begin
  if FCameraKind <> Value then
  begin
    SaveActive := FActive;
    Active := False;
    FCameraKind := Value;
    FDevice := nil;
    Active := SaveActive;
  end;
end;

procedure TCameraComponent.SetFlashMode(const Value: TFlashMode);
begin
  if Device <> nil then
  begin
    if Device.HasFlash then
      Device.FlashMode := Value
    else
      raise ECaptureDeviceException.Create(SNoFlashError);
  end;
end;

procedure TCameraComponent.SetFocusMode(const Value: TFocusMode);
begin
  if Device <> nil then
    Device.FocusMode := Value;
end;

procedure TCameraComponent.SetQuality(const Value: TVideoCaptureQuality);
begin
  if Device <> nil then
    Device.Quality := Value;
end;

procedure TCameraComponent.SetTorchMode(const Value: TTorchMode);
begin
  if Device <> nil then
  begin
    if Device.HasTorch then
      Device.TorchMode := Value
    else
      raise ECaptureDeviceException.Create(SNoTorchError);
  end;
end;

{ TMedia }

constructor TMedia.Create(const AFileName: string);
begin
  inherited Create;
  FFileName := AFileName;
end;

procedure TMedia.Play;
begin
  DoPlay;
  if FControl <> nil then
    UpdateMediaFromControl;
end;

procedure TMedia.Stop;
begin
  DoStop;
end;

procedure TMedia.SetControl(const Value: TMediaPlayerControl);
begin
  if FControl <> Value then
  begin
    FControl := Value;
    if FControl <> nil then
      UpdateMediaFromControl;
  end;
end;

procedure TMedia.UpdateMediaFromControl;
begin
end;

{ TMediaCodecManager }

class procedure TMediaCodecManager.UnInitialize;
begin
  FreeAndNil(FMediaCodecClassDescriptors);
end;

class function TMediaCodecManager.FindMediaCodecDescriptor(const Name: string;
  Field: TMediaCodecDescriptorField): TMediaCodecClassDescriptor;
var
  LResult: Boolean;
  LDescriptor: TMediaCodecClassDescriptor;

  LDefaultDescriptor: TMediaCodecClassDescriptor;
  LDefaultExists: Boolean;
begin
  LDefaultExists := False;
  FillChar(Result, SizeOf(Result), 0);
  if FMediaCodecClassDescriptors <> nil then
    for LDescriptor in FMediaCodecClassDescriptors do
    begin
      case Field of
        TMediaCodecDescriptorField.Extension: LResult := SameText(Name, LDescriptor.Extension, loUserLocale);
        TMediaCodecDescriptorField.Description: LResult := SameText(Name, LDescriptor.Description, loUserLocale);
      else
        LResult := False;
      end;
      if LResult then
      begin
        Result := LDescriptor;
        Exit;
      end;
      if SameText(SAllFilesExt, LDescriptor.Extension, loUserLocale) then
      begin
        LDefaultDescriptor := LDescriptor;
        LDefaultExists := True;
      end;
    end;
  if LDefaultExists then
    Result := LDefaultDescriptor;
end;

class procedure TMediaCodecManager.RegisterMediaCodecClass(const Extension, Description: string; MediaType: TMediaType;
  MediaCodecClass: TCustomMediaCodecClass);
var
  LDescriptor: TMediaCodecClassDescriptor;
begin
  if FMediaCodecClassDescriptors = nil then
    FMediaCodecClassDescriptors := TList<TMediaCodecClassDescriptor>.Create;

  LDescriptor.Extension := Extension;
  LDescriptor.Description := Description;
  LDescriptor.MediaCodecClass := MediaCodecClass;
  LDescriptor.MediaType := MediaType;
  FMediaCodecClassDescriptors.Add(LDescriptor);
end;

class function TMediaCodecManager.IsCodedExists(const AFileName: string): Boolean;
begin
  Result :=
    FindMediaCodecDescriptor
    (ExtractFileExt(AFileName), TMediaCodecDescriptorField.Extension).MediaCodecClass <> nil;
end;

class function TMediaCodecManager.GetFileTypes: string;
var
  Descriptor: TMediaCodecClassDescriptor;
begin
  Result := '';
  if FMediaCodecClassDescriptors <> nil then
    for Descriptor in FMediaCodecClassDescriptors do
      if Result = '' then
        Result := '*' + Descriptor.Extension
      else
        Result := Result + ';' + '*' + Descriptor.Extension;
end;

class function TMediaCodecManager.GetFileTypesByType(MediaType: TMediaType): string;
var
  Descriptor: TMediaCodecClassDescriptor;
begin
  Result := '';
  if FMediaCodecClassDescriptors <> nil then
    for Descriptor in FMediaCodecClassDescriptors do
    begin
      if Descriptor.MediaType <> MediaType then Continue;
      if Result = '' then
        Result := '*' + Descriptor.Extension
      else
        Result := Result + ';' + '*' + Descriptor.Extension;
    end;
end;

class function TMediaCodecManager.GetFilterString: string;
var
  Descriptor: TMediaCodecClassDescriptor;
begin
  Result := '';
  if FMediaCodecClassDescriptors <> nil then
  begin
    for Descriptor in FMediaCodecClassDescriptors do
      if Result = '' then
        Result := Descriptor.Description + ' (' + '*' + Descriptor.Extension + ')|' + '*' + Descriptor.Extension
      else
        Result := Result + '|' + Descriptor.Description + ' (' + '*' + Descriptor.Extension + ')|' + '*' + Descriptor.Extension;
    // all files
    Result := SVAllFiles + ' (' + GetFileTypes + ')|' + GetFileTypes + '|' + Result;
  end;
end;

class function TMediaCodecManager.GetFilterStringByType(MediaType: TMediaType): string;
var
  Descriptor: TMediaCodecClassDescriptor;
begin
  Result := '';
  if FMediaCodecClassDescriptors <> nil then
  begin
    for Descriptor in FMediaCodecClassDescriptors do
    begin
      if Descriptor.MediaType <> MediaType then Continue;

      if Result = '' then
        Result := Descriptor.Description + ' (' + '*' + Descriptor.Extension + ')|' + '*' + Descriptor.Extension
      else
        Result := Result + '|' + Descriptor.Description + ' (' + '*' + Descriptor.Extension + ')|' + '*' + Descriptor.Extension;
    end;
    // all files
    Result := SVAllFiles + ' (' + GetFileTypesByType(MediaType) + ')|' + GetFileTypesByType(MediaType) + '|' + Result;
  end;
end;

class function TMediaCodecManager.CreateFromFile(const AFileName: string): TMedia;
var
  CodecClass: TCustomMediaCodecClass;
  Codec: TCustomMediaCodec;
begin
  CodecClass := FindMediaCodecDescriptor(ExtractFileExt(AFileName), TMediaCodecDescriptorField.Extension).MediaCodecClass;
  if CodecClass <> nil then
  begin
    Codec := CodecClass.Create;
    try
      Result := Codec.CreateFromFile(AFileName);
    finally
      Codec.Free;
    end;
  end
  else
    Result := nil;
end;

{ TMediaPlayer }

procedure TMediaPlayer.Clear;
begin
  FreeAndNil(FMedia);
  FFileName := '';
end;

constructor TMediaPlayer.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TMediaPlayer.Destroy;
begin
  FreeAndNil(FMedia);
  inherited;
end;

function TMediaPlayer.GetCurrent: TMediaTime;
begin
  if FMedia <> nil then
    Result := FMedia.CurrentTime
  else
    Result := 0;
end;

function TMediaPlayer.GetDuration: TMediaTime;
begin
  if FMedia <> nil then
    Result := FMedia.Duration
  else
    Result := 0;
end;

function TMediaPlayer.GetMedia: TMedia;
begin
  Result := FMedia;
end;

function TMediaPlayer.GetMediaState: TMediaState;
begin
  if FMedia <> nil then
    Result := FMedia.State
  else
    Result := TMediaState.Unavailable;
end;

function TMediaPlayer.GetVideoSize: TPointF;
begin
  if FMedia <> nil then
    Result := FMedia.VideoSize
  else
    Result := TPointF.Zero;
end;

function TMediaPlayer.GetVolume: Single;
begin
  if FMedia <> nil then
    Result := FMedia.Volume
  else
    Result := 1.0;
end;

procedure TMediaPlayer.Stop;
begin
  if FMedia <> nil then
    FMedia.Stop;
end;

procedure TMediaPlayer.Play;
begin
  if FMedia <> nil then
    FMedia.Play;
end;

function TMediaPlayer.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := inherited QueryInterface(IID, Obj);
  if (FMedia <> nil) and (Result <> S_OK) then
    Result := FMedia.QueryInterface(IID, Obj);
end;

procedure TMediaPlayer.SetControl(const Value: TMediaPlayerControl);
begin
  if FControl <> Value then
  begin
    FControl := Value;
    if FMedia <> nil then
    begin
      FMedia.Control := FControl;
      FMedia.UpdateMediaFromControl;
    end;
  end;
end;

procedure TMediaPlayer.SetCurrent(const Value: TMediaTime);
begin
  if FMedia <> nil then
    FMedia.CurrentTime := Value;
end;

procedure TMediaPlayer.SetFileName(const Value: string);
begin
  if csDesigning in ComponentState then
  begin
    if FFileName <> Value then
      FFileName := Value;
  end
  else
  begin
    // We shall recreate media object as the file content could change.
    // For example if we make recording in the same file
    if FMedia <> nil then
    begin
      FMedia.DisposeOf;
      FMedia := nil;
    end;
    FFileName := Value;
    FMedia := TMediaCodecManager.CreateFromFile(FFileName);
    if FMedia <> nil then
      FMedia.Control := FControl;
  end;
end;

procedure TMediaPlayer.SetVolume(const Value: Single);
begin
  if FMedia <> nil then
    FMedia.Volume := Value;
end;

{ TMediaPlayerControl }

procedure TMediaPlayerControl.AncestorVisibleChanged(const Visible: Boolean);
begin
  inherited;
  UpdateMedia;
end;

constructor TMediaPlayerControl.Create(AOwner: TComponent);
begin
  inherited;
  if not (csDesigning in ComponentState) then
  begin
    TMessageManager.DefaultManager.SubscribeToMessage(TAfterCreateFormHandle, FormHandleAfterCreated);
    TMessageManager.DefaultManager.SubscribeToMessage(TBeforeDestroyFormHandle, FormHandleBeforeDestroyed);
  end;
end;

destructor TMediaPlayerControl.Destroy;
begin
  if FMediaPlayer <> nil then
    FMediaPlayer.SetControl(nil);
  if not (csDesigning in ComponentState) then
  begin
    TMessageManager.DefaultManager.Unsubscribe(TBeforeDestroyFormHandle, FormHandleBeforeDestroyed);
    TMessageManager.DefaultManager.Unsubscribe(TAfterCreateFormHandle, FormHandleAfterCreated);
  end;
  inherited;
end;

procedure TMediaPlayerControl.DoAbsoluteChanged;
begin
  inherited;
  UpdateMedia;
end;

procedure TMediaPlayerControl.FormHandleAfterCreated(const Sender: TObject; const Msg: TMessage);
begin
  if (FMediaPlayer <> nil) and (FMediaPlayer.FMedia <> nil) then
  begin
    if Sender is TForm then
      Parent := TForm(Sender);
  end;
end;

procedure TMediaPlayerControl.FormHandleBeforeDestroyed(const Sender: TObject; const Msg: TMessage);
begin
  Parent := nil;
  if (FMediaPlayer <> nil) and (FMediaPlayer.FMedia <> nil) then
    FMediaPlayer.FMedia.UpdateMediaFromControl;
end;

procedure TMediaPlayerControl.UpdateMedia;
begin
  if (FMediaPlayer <> nil) and (FMediaPlayer.FMedia <> nil) then
    FMediaPlayer.FMedia.UpdateMediaFromControl;
end;

procedure TMediaPlayerControl.Hide;
begin
  inherited;
  UpdateMedia;
end;

procedure TMediaPlayerControl.Paint;
begin
  if (csDesigning in ComponentState) and not Locked and not FInPaintTo then
    DrawDesignBorder;
end;

procedure TMediaPlayerControl.ParentChanged;
begin
  inherited;
  UpdateMedia;
end;

procedure TMediaPlayerControl.Move;
begin
  inherited;
  UpdateMedia;
end;

procedure TMediaPlayerControl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FMediaPlayer) then
    MediaPlayer := nil;
end;

procedure TMediaPlayerControl.Resize;
begin
  inherited;
  UpdateMedia;
end;

procedure TMediaPlayerControl.SetMediaPlayer(const Value: TMediaPlayer);
begin
  if FMediaPlayer <> Value then
  begin
    if FMediaPlayer <> nil then
      FMediaPlayer.SetControl(nil);
    FMediaPlayer := Value;
    if FMediaPlayer <> nil then
      FMediaPlayer.SetControl(Self);
  end;
end;

procedure TMediaPlayerControl.Show;
begin
  inherited ;
  UpdateMedia;
end;

procedure RegisterAliases;
begin
  AddEnumElementAliases(TypeInfo(TDevicePosition), ['dpUnspecified', 'dpFront', 'dpBack']);
  AddEnumElementAliases(TypeInfo(TFlashMode), ['fmAutoFlash', 'fmFlashOff', 'fmFlashOn']);
  AddEnumElementAliases(TypeInfo(TFocusMode), ['fmAutoFocus', 'fmContinuousAutoFocus', 'fmLocked']);
  AddEnumElementAliases(TypeInfo(TTorchMode), ['tmModeOff', 'tmModeOn', 'tmModeAuto']);
  AddEnumElementAliases(TypeInfo(TVideoCaptureQuality), ['vcPhotoQuality', 'vcHighQuality', 'vcMediumQuality', 'vcLowQuality']);
  AddEnumElementAliases(TypeInfo(TCameraKind), ['ckDefault', 'ckFrontCamera', 'ckBackCamera']);
end;

procedure UnregisterAliases;
begin
  RemoveEnumElementAliases(TypeInfo(TDevicePosition));
  RemoveEnumElementAliases(TypeInfo(TFlashMode));
  RemoveEnumElementAliases(TypeInfo(TFocusMode));
  RemoveEnumElementAliases(TypeInfo(TTorchMode));
  RemoveEnumElementAliases(TypeInfo(TVideoCaptureQuality));
  RemoveEnumElementAliases(TypeInfo(TCameraKind));
end;

{ TVideoCaptureSetting }

class function TVideoCaptureSetting.Create: TVideoCaptureSetting;
begin
  Result.FWidth := 0;
  Result.FHeight := 0;
  Result.FFrameRate := 0;
  Result.FMaxFrameRate := 0;
  Result.FMinFrameRate := 0;
end;

class function TVideoCaptureSetting.Create(const AWidth, AHeight: Integer; const AFrameRate: Single): TVideoCaptureSetting;
begin
  Result.FWidth := AWidth;
  Result.FHeight := AHeight;
  Result.FFrameRate := AFrameRate;
  Result.FMinFrameRate := AFrameRate;
  Result.FMaxFrameRate := AFrameRate;
end;

function TVideoCaptureSetting.IsSmallerThan(const ASetting: TVideoCaptureSetting; APriority: TVideoCaptureSettingPriority): Boolean;
var
  Difference: Integer;
begin
  case APriority of
    TVideoCaptureSettingPriority.Resolution:
    begin
      Difference := (FWidth * FHeight) - (ASetting.FWidth * ASetting.FHeight);
      if Difference < 0 then
        Result := True
      else if Difference > 0 then
        Result := False
      else
        Result := FFrameRate < ASetting.FFrameRate;
    end;
    else
    begin
      if FFrameRate < ASetting.FFrameRate then
        Result := True
      else if FFrameRate > ASetting.FFrameRate then
        Result := False
      else
        Result := FWidth * FHeight < ASetting.FWidth * ASetting.FHeight;
    end;
  end;
end;

function TVideoCaptureSetting.GetSize: TSize;
begin
  Result := TSize.Create(FWidth, FHeight);
end;

procedure TVideoCaptureSetting.SetFrameRate(const AValue: Double);
begin
  FFrameRate := AValue;
  FMinFrameRate := AValue;
  FMaxFrameRate := AValue;
end;

procedure TVideoCaptureSetting.SetFrameRate(const AValue, AMaxValue: Double);
begin
  FFrameRate := AValue;
  FMinFrameRate := AValue;
  FMaxFrameRate := AMaxValue;
end;

{ TVideoCaptureSetting.TResolutionComparer }

function TVideoCaptureSetting.TResolutionComparer.Compare(const Left, Right: TVideoCaptureSetting): Integer;
var
  Difference: Integer;
begin
  Difference := (Left.FWidth * Left.FHeight) - (Right.FWidth * Right.FHeight);
  if Difference < 0 then
    Result := 1
  else if Difference > 0 then
    Result := -1
  else if Left.FFrameRate < Right.FFrameRate then
    Result := 1
  else if Left.FFrameRate > Right.FFrameRate then
    Result := -1
  else
    Result := 0;
end;

{ TVideoCaptureSetting.TFrameRateComparer }

function TVideoCaptureSetting.TFrameRateComparer.Compare(const Left, Right: TVideoCaptureSetting): Integer;
begin
  if Left.FFrameRate < Right.FFrameRate then
    Result := 1
  else if Left.FFrameRate > Right.FFrameRate then
    Result := -1
  else if Left.FWidth * Left.FHeight < Right.FWidth * Right.FHeight then
    Result := 1
  else if Left.FWidth * Left.FHeight > Right.FWidth * Right.FHeight then
    Result := -1
  else
    Result := 0;
end;

{ TCustomMediaPlayerAction }

function FindFirstPlayer(AOwner: TComponent): TMediaPlayer;
var
  I: Integer;
begin
  Result := nil;
  if (AOwner <> nil) and ([csDesigning, csLoading] * AOwner.ComponentState = [csDesigning]) then
    for I := 0 to AOwner.ComponentCount - 1 do
      if AOwner.Components[I] is TMediaPlayer then
        Exit(TMediaPlayer(AOwner.Components[I]));
end;

constructor TCustomMediaPlayerAction.Create(AOwner: TComponent);
begin
  inherited;
  MediaPlayer := FindFirstPlayer(AOwner);
end;

procedure TCustomMediaPlayerAction.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = MediaPlayer) then
    FMediaPlayer := nil;
end;

procedure TCustomMediaPlayerAction.SetMediaPlayer(const Value: TMediaPlayer);
begin
  if FMediaPlayer <> Value then
  begin
    if FMediaPlayer <> nil then
      TComponent(FMediaPlayer).RemoveFreeNotification(Self);
    FMediaPlayer := Value;
    if FMediaPlayer <> nil then
      TComponent(FMediaPlayer).FreeNotification(Self);
    CustomTextChanged;
  end;
end;

function TCustomMediaPlayerAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Supported and not Assigned(OnExecute) and (MediaPlayer <> nil);
end;

function TCustomMediaPlayerAction.Update: Boolean;
begin
  if Supported and ([csLoading, csDestroying] * ComponentState = []) then
    CustomTextChanged;
  Result := inherited Update;
end;

{ TMediaPlayerStart }

procedure TMediaPlayerStart.CustomTextChanged;
begin
  if CustomText <> '' then
    Text := CustomText
  else
    Text := SMediaPlayerStart;
end;

procedure TMediaPlayerStart.ExecuteTarget(Target: TObject);
begin
  if IsSupportedInterface and (MediaPlayer <> nil) and (MediaPlayer.State = TMediaState.Stopped) then
    MediaPlayer.Play;
end;

function TMediaPlayerStart.Update: Boolean;
begin
  Result := inherited Update;
  if not Result then
  begin
    if Supported and (MediaPlayer <> nil) then
      Enabled := MediaPlayer.State = TMediaState.Stopped
    else
      Enabled := False;
  end;
end;

{ TMediaPlayerStop }

procedure TMediaPlayerStop.CustomTextChanged;
begin
  if CustomText <> '' then
    Text := CustomText
  else
    Text := SMediaPlayerStop;
end;

procedure TMediaPlayerStop.ExecuteTarget(Target: TObject);
begin
  if IsSupportedInterface and (MediaPlayer <> nil) and (MediaPlayer.State = TMediaState.Playing) then
  begin
    MediaPlayer.CurrentTime := 0;
    MediaPlayer.Stop;
    MediaPlayer.CurrentTime := 0;
  end;
end;

function TMediaPlayerStop.Update: Boolean;
begin
  Result := inherited Update;
  if not Result then
  begin
    if Supported and (MediaPlayer <> nil) then
      Enabled := MediaPlayer.State = TMediaState.Playing
    else
      Enabled := False;
  end;
end;

{ TMediaPlayerPlayPause }

procedure TMediaPlayerPlayPause.CustomTextChanged;
begin
  if CustomText <> '' then
    Text := CustomText
  else
  begin
    if (MediaPlayer <> nil) and (MediaPlayer.State = TMediaState.Playing) then
      Text := SMediaPlayerPause
    else
      Text := SMediaPlayerStart;
  end;
end;

procedure TMediaPlayerPlayPause.ExecuteTarget(Target: TObject);
begin
  if IsSupportedInterface and (MediaPlayer <> nil) and (MediaPlayer.State <> TMediaState.Unavailable) then
  begin
    if MediaPlayer.State = TMediaState.Playing then
      MediaPlayer.Stop
    else
      MediaPlayer.Play;
  end;
end;

function TMediaPlayerPlayPause.Update: Boolean;
begin
  Result := inherited Update;
  if not Result then
  begin
    if Supported and (MediaPlayer <> nil) then
      Enabled := MediaPlayer.State <> TMediaState.Unavailable
    else
      Enabled := False;
  end;
end;

type
  TPlayerValueRange = class(TCustomValueRange)
  private
    [Weak] FOwner: TMediaPlayerValue;
  protected
    procedure DoBeforeChange; override;
    procedure DoChanged; override;
    procedure DoAfterChange; override;
  public
    constructor Create(AOwner: TMediaPlayerValue); reintroduce;
  end;

{ TPlayerValueRange }

constructor TPlayerValueRange.Create(AOwner: TMediaPlayerValue);
begin
  inherited Create(AOwner);
  FOwner := AOwner;
end;

procedure TPlayerValueRange.DoBeforeChange;
begin
  if (FOwner <> nil) and (FOwner.State = TMediaPlayerValue.TState.Normal) then
    FOwner.FState := TMediaPlayerValue.TState.ValueUpdating;
  inherited;
end;

procedure TPlayerValueRange.DoAfterChange;
begin
  inherited;
  if (FOwner <> nil) and (FOwner.State = TMediaPlayerValue.TState.ValueUpdating) then
  try
    FOwner.UpdateValuePlayer;
  finally
    FOwner.FState := TMediaPlayerValue.TState.Normal;
  end;
end;

procedure TPlayerValueRange.DoChanged;
begin
  inherited;
  if (FOwner <> nil) and (FOwner.State = TMediaPlayerValue.TState.Normal) then
  begin
    FOwner.FState := TMediaPlayerValue.TState.ValueUpdating;
    try
      FOwner.UpdateValuePlayer;
    finally
      FOwner.FState := TMediaPlayerValue.TState.Normal;
    end;
  end;
end;

{ TMediaPlayerValue }

constructor TMediaPlayerValue.Create(AOwner: TComponent);
begin
  inherited;
  MediaPlayer := FindFirstPlayer(AOwner);
end;

function TMediaPlayerValue.CreateValueRange: TCustomValueRange;
begin
  Result := TPlayerValueRange.Create(Self);
end;

procedure TMediaPlayerValue.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = MediaPlayer) then
    FMediaPlayer := nil;
end;

procedure TMediaPlayerValue.SetMediaPlayer(const Value: TMediaPlayer);
begin
  if FMediaPlayer <> Value then
  begin
    if FMediaPlayer <> nil then
      TComponent(FMediaPlayer).RemoveFreeNotification(Self);
    FMediaPlayer := Value;
    if FMediaPlayer <> nil then
      TComponent(FMediaPlayer).FreeNotification(Self);
    CustomTextChanged;
  end;
end;

function TMediaPlayerValue.HandlesTarget(Target: TObject): Boolean;
begin
  Result := False;
end;

function TMediaPlayerValue.Update: Boolean;
var
  OldTracking: Boolean;
begin
  if Supported and ([csLoading, csDestroying] * ComponentState = []) then
    CustomTextChanged;
  if State = TState.Normal then
  begin
    FState := TState.ActionUpdating;
    try
      OldTracking := ValueRange.Tracking;
      ValueRange.Tracking := True;
      try
        UpdateValueAction;
      finally
        ValueRange.Tracking := OldTracking;
      end;
      Result := inherited Update;
      if not Result then
      begin
        if Supported and (MediaPlayer <> nil) then
          Enabled := MediaPlayer.State <> TMediaState.Unavailable
        else
          Enabled := False;
      end;
    finally
      FState := TState.Normal;
    end;
  end
  else
    Result := False;
end;

procedure TMediaPlayerValue.UpdateValueAction;
begin

end;

procedure TMediaPlayerValue.UpdateValuePlayer;
begin

end;

{ TMediaPlayerCurrentTime }

function TMediaPlayerCurrentTime.CreateValueRange: TCustomValueRange;
begin
  Result := inherited;
  Result.Tracking := False;
end;

procedure TMediaPlayerCurrentTime.CustomTextChanged;
begin
  inherited;
  if CustomText <> '' then
    Text := FormatDateTime(CustomText, MediaPlayer.CurrentTime.ToDateTime)
  else
  begin
    if (MediaPlayer = nil) or (MediaPlayer.State = TMediaState.Unavailable) then
      Text := ''
    else
      Text := MediaPlayer.CurrentTime.ToString;
  end;
end;

procedure TMediaPlayerCurrentTime.UpdateValueAction;
begin
  inherited;
  if (MediaPlayer <> nil) and (MediaPlayer.State <> TMediaState.Unavailable) then
  begin
    ValueRange.BeginUpdate;
    try
      ValueRange.Min := 0;
      ValueRange.Max := MediaPlayer.Duration / MediaTimeScale;
      ValueRange.Value := MediaPlayer.CurrentTime / MediaTimeScale;
    finally
      ValueRange.EndUpdate;
    end;
  end;
end;

procedure TMediaPlayerCurrentTime.UpdateValuePlayer;
var
  OldVolume: Single;
begin
  inherited;
  if MediaPlayer <> nil then
  begin
    OldVolume := MediaPlayer.Volume;
    try
      MediaPlayer.Volume := 0;
      MediaPlayer.CurrentTime := Round(ValueRange.Value) * MediaTimeScale;
    finally
      MediaPlayer.Volume := OldVolume;
    end;
  end;
end;

{ TMediaPlayerVolume }

function TMediaPlayerVolume.CreateValueRange: TCustomValueRange;
begin
  Result := inherited;
  Result.Min := 0;
  Result.Max := PrecentCount;
  Result.Tracking := True;
end;

procedure TMediaPlayerVolume.CustomTextChanged;
begin
  inherited;
  if CustomText <> '' then
    Text := Format(CustomText, [MediaPlayer.Volume * PrecentCount])
  else
  begin
    if (MediaPlayer = nil) or (MediaPlayer.State = TMediaState.Unavailable) then
      Text := ''
    else
      Text := Format(SMediaPlayerVolume, [MediaPlayer.Volume * PrecentCount]);
  end;
end;

procedure TMediaPlayerVolume.UpdateValueAction;
begin
  inherited;
  if (MediaPlayer <> nil) and (MediaPlayer.State <> TMediaState.Unavailable) then
  begin
    ValueRange.BeginUpdate;
    try
      ValueRange.Value := MediaPlayer.Volume * PrecentCount;
    finally
      ValueRange.EndUpdate;
    end;
  end;
end;

procedure TMediaPlayerVolume.UpdateValuePlayer;
begin
  inherited;
  if MediaPlayer <> nil then
    MediaPlayer.Volume := ValueRange.Value / PrecentCount;
end;

initialization
  RegisterAliases;
  RegisterFmxClasses([TCameraComponent, TMediaPlayer, TMediaPlayerControl]);
finalization
  UnregisterAliases;
  TCaptureDeviceManager.UnInitialize;
  TMediaCodecManager.UnInitialize
end.
