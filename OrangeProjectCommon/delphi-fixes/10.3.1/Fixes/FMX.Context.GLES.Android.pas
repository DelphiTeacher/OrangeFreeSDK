(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2018-12-02　　　 *)
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
{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Context.GLES.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.Classes, System.Generics.Collections, Androidapi.Egl, Androidapi.Gles2, FMX.Types, FMX.Types3D,
  FMX.Context.GLES;

type
  TCustomAndroidContext = class(TCustomContextOpenGL)
  private const
    AndroidMaxLightCount = 1;
    ContextAttributes: array[0..2] of EGLint = (EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE);
  private class var
    SharedMultisamples: Integer;
  protected type
    TContextAttributes = array of EGLint;
    TContextPair = record
      Surface: EGLSurface;
      Context: EGLContext;
    end;
    TFrameBuffers = TDictionary<TFmxHandle, GLuint>;
    TThreadBuffers = TDictionary<TThreadID, TFrameBuffers>;
  protected class var
    FSharedConfig: EGLConfig;
    FSharedDisplay: EGLDisplay;
    FSharedSurface: EGLSurface;
    FSharedContext: EGLContext;
    FIsExtensionLoaded: Boolean;
    FThreadDictionary: TDictionary<TThreadID, TContextPair>;
    FThreadBuffers: TThreadBuffers;
    class procedure CreateThreadDictionary; static;
    class procedure DestroyThreadDictionary; static;
  protected
    FSurface: EGLSurface;
    FContext: EGLContext;
    class procedure CreateSharedContext; override;
    class procedure DestroySharedContext; override;
    class function CreateSharedConfig: EGLConfig;
    class procedure LoadExtensions;
    function GetIndexBufferSupport: TContext3D.TIndexBufferSupport; override;
  public
    class function ActivateSharedContext: Boolean;
    class function Valid: Boolean; override;
    class property SharedConfig: EGLConfig read FSharedConfig;
    class property SharedDisplay: EGLDisplay read FSharedDisplay;
    class property SharedSurface: EGLSurface read FSharedSurface;
    class property SharedContext: EGLContext read FSharedContext;

    class function MaxLightCount: Integer; override;
    class function Style: TContextStyles; override;
  end;

procedure RegisterContextClasses;
procedure UnregisterContextClasses;

implementation

uses
  System.SysUtils, Androidapi.Gles2ext, Androidapi.Eglext, Androidapi.NativeWindow, Androidapi.NativeWindowJni,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNIBridge, FMX.Consts, FMX.Graphics, FMX.Forms, FMX.Forms3D,
  FMX.Platform, FMX.Platform.Android, FMX.Platform.UI.Android, FMX.Presentation.Android.Style;

const
  OES_packed_depth_stencil = 'GL_OES_packed_depth_stencil';
  OES_depth24 = 'GL_OES_depth24';
  NV_depth_nonlinear = 'GL_NV_depth_nonlinear';

function CreateEGLSurface(const Width, Height: Integer): EGLSurface;
var
  Texture: JSurfaceTexture;
  Surface: JSurface;
  Win: PANativeWindow;
begin
  Texture := TJSurfaceTexture.JavaClass.init(0);
  Texture.setDefaultBufferSize(Width, Height);
  Surface := TJSurface.JavaClass.init(Texture);
  if not Surface.isValid then
    RaiseContextExceptionFmt(@SCannotCreateOpenGLContextWithCode, ['JSurfaceTexture', eglGetError()]);
  Win := ANativeWindow_fromSurface(TJNIResolver.GetJNIEnv, (Surface as ILocalObject).GetObjectID);
  try
    Result := eglCreateWindowSurface(TCustomAndroidContext.SharedDisplay, TCustomAndroidContext.SharedConfig, Win, nil);
  finally
    ANativeWindow_release(Win);
  end;
end;

function CreateEGLPBufferSurface(const Width, Height: Integer): EGLSurface;
var
  SurfaceAttributes: TCustomAndroidContext.TContextAttributes;
begin
  SurfaceAttributes := [EGL_WIDTH, Width, EGL_HEIGHT, Height, EGL_NONE];
  Result := eglCreatePbufferSurface(TCustomAndroidContext.SharedDisplay, TCustomAndroidContext.SharedConfig, @SurfaceAttributes[0]);
  if Result = EGL_NO_SURFACE then
    RaiseContextExceptionFmt(@SCannotCreatePBufferSurfaceWithCode, [eglGetError()]);
end;

function IsMainThread: Boolean; inline;
begin
  Result := MainThreadID = TThread.CurrentThread.ThreadID;
end;

{ TCustomAndroidContext }

function TCustomAndroidContext.GetIndexBufferSupport: TContext3D.TIndexBufferSupport;
begin
  // AVD crash workaround: although 32-bit index buffer appears to be supported, using it leads to emulator crash.
  Result := TIndexBufferSupport.Int16;
end;

class procedure TCustomAndroidContext.LoadExtensions;

  function CreateDummyContext: Boolean;
  const
    DummyConfig: array[0..4] of EGLint = (EGL_BUFFER_SIZE, 32, EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT, EGL_NONE);
  var
    Config: EGLConfig;
    NumConfigs: EGLint;
    Format: EGLint;
    NativeWindow: PANativeWindow;
    Surface: JSurface;
    Texture: JSurfaceTexture;
  begin
    if eglChooseConfig(FSharedDisplay, @DummyConfig[0], @Config, 1, @NumConfigs) = 0 then
      Exit(False);

    Texture := TJSurfaceTexture.JavaClass.init(0);
    Texture.setDefaultBufferSize(1, 1);
    Surface := TJSurface.JavaClass.init(Texture);
    if not Surface.isValid then
      RaiseContextExceptionFmt(@SCannotCreateOpenGLContextWithCode, ['JSurfaceTexture', eglGetError()]);
    NativeWindow := ANativeWindow_fromSurface(TJNIResolver.GetJNIEnv, (Surface as ILocalObject).GetObjectID);
    eglGetConfigAttrib(FSharedDisplay, Config, EGL_NATIVE_VISUAL_ID, @Format);
    ANativeWindow_setBuffersGeometry(NativeWindow, 0, 0, Format);
    FSharedSurface := eglCreateWindowSurface(FSharedDisplay, Config, NativeWindow, nil);
    FSharedContext := eglCreateContext(FSharedDisplay, Config, EGL_NO_CONTEXT, @ContextAttributes[0]);

    if eglMakeCurrent(FSharedDisplay, FSharedSurface, FSharedSurface, FSharedContext) = 0 then
      Exit(False);

    Result := True;
  end;

  procedure DestroyDummyContext;
  begin
    eglMakeCurrent(FSharedDisplay, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
    eglDestroyContext(FSharedDisplay, FSharedContext);
    eglDestroySurface(FSharedDisplay, FSharedSurface);
  end;

begin
  if FIsExtensionLoaded then
    Exit;

  FIsExtensionLoaded := True;

  if CreateDummyContext then
    try
      TCustomAndroidContext.GetExtensions;
    finally
      DestroyDummyContext;
    end
  else
    // If we cannot create dummy context for defining OpenGL extensions list we skip it in the next time.
    // It will result in using OpenGL with limited functionality.
    Log.d(SOpenGLCannotCreateDummyContext);
end;

class function TCustomAndroidContext.CreateSharedConfig: EGLConfig;
type
  TContextAttributes = array of EGLint;

  function GetDesiredMultisamples: Integer;
  const
    HighQualitySamples = 4;
  begin
    Result := 0;
    if Application.MainForm = nil then
      Exit;

    if (Application.MainForm is TCustomForm) and
      (TCustomForm(Application.MainForm).Quality = TCanvasQuality.HighQuality) then
      Exit(HighQualitySamples);

    if Application.MainForm is TCustomForm3D then
      Result := MultisampleTypeToNumber(TCustomForm3D(Application.MainForm).Multisample);
  end;

  procedure AddAttributes(var ContextAttributes: TContextAttributes; const Attributes: array of EGLint);
  var
    I, Index: Integer;
  begin
    Index := Length(ContextAttributes);
    SetLength(ContextAttributes, Index + Length(Attributes));

    for I := 0 to Length(Attributes) - 1 do
      ContextAttributes[Index + I] := Attributes[I];
  end;

var
  ConfigAttribs: TContextAttributes;
  NumConfigs: EGLint;
  RenderingSetupService: IFMXRenderingSetupService;
  ColorBits, DepthBits, Multisamples: Integer;
  Stencil: Boolean;
begin
  // Determine initial number of multisamples based on form quality settings.
  Multisamples := TCustomAndroidContext.SharedMultisamples;
  if Multisamples < 1 then
    Multisamples := GetDesiredMultisamples;

  // Default rendering configuration.
  ColorBits := 24;
  DepthBits := 24;
  Stencil := True;

  // Request adjustment of rendering configuration.
  if TPlatformServices.Current.SupportsPlatformService(IFMXRenderingSetupService, RenderingSetupService) then
    RenderingSetupService.Invoke(ColorBits, DepthBits, Stencil, Multisamples);

  { Extensions must be obtained prior creating main OpenGL ES context for configuring depth buffer that is higher
    than 16 bits or enabling multisampling. In this case, create a dummy OpenGL ES context and read OpenGL ES
    extensions and renderer information. }
  if (DepthBits > 16) or (Multisamples > 0) then
    LoadExtensions;

  // Prepare final context configuration.
  SetLength(ConfigAttribs, 0);
  AddAttributes(ConfigAttribs, [EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT]);
  AddAttributes(ConfigAttribs, [EGL_SURFACE_TYPE, EGL_WINDOW_BIT]);

  // Color Bitdepth.
  if ColorBits > 16 then
    AddAttributes(ConfigAttribs, [EGL_BUFFER_SIZE, 32, EGL_RED_SIZE, 8, EGL_GREEN_SIZE, 8, EGL_BLUE_SIZE, 8])
  else
    AddAttributes(ConfigAttribs, [EGL_BUFFER_SIZE, 16, EGL_RED_SIZE, 5, EGL_GREEN_SIZE, 5, EGL_BLUE_SIZE, 5]);

  // Depth Buffer.
  if DepthBits > 0 then
  begin
    if DepthBits > 16 then
    begin
      if TCustomAndroidContext.Extensions[OES_depth24] then
        // 24-bit depth buffer is supported.
        AddAttributes(ConfigAttribs, [EGL_DEPTH_SIZE, 24])
      else
      begin // No 24-bit depth support.
        AddAttributes(ConfigAttribs, [EGL_DEPTH_SIZE, 16]);

        // Tegra 3 GPU has extension for improved accuracy of depth buffer.
        if TCustomAndroidContext.Extensions[NV_depth_nonlinear] then
          AddAttributes(ConfigAttribs, [EGL_DEPTH_ENCODING_NV, EGL_DEPTH_ENCODING_NONLINEAR_NV]);
      end;
    end
    else // 16-bit depth buffer
      AddAttributes(ConfigAttribs, [EGL_DEPTH_SIZE, 16]);
  end;

  // Stencil Buffer.
  if Stencil then
    AddAttributes(ConfigAttribs, [EGL_STENCIL_SIZE, 8]);

  // Multisamples.
  if Multisamples > 0 then
  begin
    // Tegra 3 GPU does not support MSAA (it only does CSAA).
    if not TCustomAndroidContext.Extensions.Renderer.Contains('TEGRA 3') then
      AddAttributes(ConfigAttribs, [EGL_SAMPLE_BUFFERS, 1, EGL_SAMPLES, Multisamples]);
  end;

  // Close the configuration.
  AddAttributes(ConfigAttribs, [EGL_NONE]);

  if eglChooseConfig(TCustomAndroidContext.SharedDisplay, @ConfigAttribs[0], @Result, 1, @NumConfigs) <> EGL_TRUE then
    RaiseContextExceptionFmt(@SCannotCreateOpenGLContextWithCode, ['eglChooseConfig', eglGetError()]);
end;

class procedure TCustomAndroidContext.CreateSharedContext;

  function IsAppNotTerminating: Boolean;
  var
    ApplicationService: IFMXApplicationService;
  begin
    Result := TPlatformServices.Current.SupportsPlatformService(IFMXApplicationService, ApplicationService) and
              not ApplicationService.Terminating;
  end;

begin
  if (FSharedContext = nil) and IsAppNotTerminating then
  begin
    FIsExtensionLoaded := False;
    FSharedDisplay := eglGetDisplay(EGL_DEFAULT_DISPLAY);

    if eglInitialize(FSharedDisplay, nil, nil) = 0 then
      RaiseContextExceptionFmt(@SCannotCreateOpenGLContextWithCode, ['eglInitialize', eglGetError()]);

    FSharedConfig := CreateSharedConfig;
    FSharedContext := eglCreateContext(TCustomAndroidContext.SharedDisplay, FSharedConfig, EGL_NO_CONTEXT,
      @TCustomAndroidContext.ContextAttributes[0]);
    if FSharedContext = EGL_NO_CONTEXT then
      RaiseContextExceptionFmt(@SCannotCreateOpenGLContextWithCode, ['eglCreateContext', eglGetError()]);

    FSharedSurface := CreateEGLPBufferSurface(1, 1);

    if FSharedSurface = EGL_NO_SURFACE then
      RaiseContextExceptionFmt(@SCannotCreateOpenGLContextWithCode, ['CreateEGLSurface', eglGetError()]);;

    if eglMakeCurrent(FSharedDisplay, FSharedSurface, FSharedSurface, FSharedContext) = 0 then
    begin
      eglDestroyContext(FSharedDisplay, FSharedContext);
      eglDestroySurface(FSharedDisplay, FSharedSurface);
      RaiseContextExceptionFmt(@SCannotCreateOpenGLContextWithCode, ['eglMakeCurrent', eglGetError()]);
    end;

    CreateThreadDictionary;
  end;
end;

class function TCustomAndroidContext.Valid: Boolean;
begin
  Result := ActivateSharedContext;
end;

class procedure TCustomAndroidContext.CreateThreadDictionary;
begin
  FThreadDictionary := TDictionary<TThreadID, TContextPair>.Create;
  FThreadBuffers := TThreadBuffers.Create;
end;

class procedure TCustomAndroidContext.DestroyThreadDictionary;
var
  LPair: TContextPair;
  Buffer: TFrameBuffers;
  FrameBuf: GLuint;
begin
  for Buffer in FThreadBuffers.Values do
    for FrameBuf in Buffer.Values do
      glDeleteFramebuffers(1, @FrameBuf);
  FThreadBuffers.Free;

  for LPair in FThreadDictionary.Values do
  begin
    eglDestroySurface(FSharedDisplay, LPair.Surface);
    eglDestroyContext(FSharedDisplay, LPair.Context);
  end;
  FThreadDictionary.Free;
end;

class procedure TCustomAndroidContext.DestroySharedContext;
begin
  if FSharedContext <> nil then
  begin
    DestroyPrograms;

    DestroyThreadDictionary;

    eglDestroySurface(FSharedDisplay, FSharedSurface);
    eglDestroyContext(FSharedDisplay, FSharedContext);
    FSharedContext := nil;
  end;
end;

class function TCustomAndroidContext.MaxLightCount: Integer;
begin
  Result := AndroidMaxLightCount;
end;

class function TCustomAndroidContext.Style: TContextStyles;
begin
  Result := [TContextStyle.RenderTargetFlipped];
end;

class function TCustomAndroidContext.ActivateSharedContext: Boolean;
var
  Pair: TContextPair;
  LContext: TCustomAndroidContext;
begin
  CreateSharedContext;
  Result := FSharedContext <> nil;
  if IsMainThread then
  begin
    LContext := TCustomAndroidContext(CurrentContext);
    if (LContext <> nil) and (LContext.FSurface <> nil) then
      if LContext.FSurface <> eglGetCurrentSurface(EGL_DRAW) then
        Result := eglMakeCurrent(FSharedDisplay, LContext.FSurface, LContext.FSurface, FSharedContext) <> EGL_FALSE
      else
        Result := True
    else if FSharedSurface <> eglGetCurrentSurface(EGL_DRAW) then
      // Switch to Shared context
      Result := eglMakeCurrent(FSharedDisplay, FSharedSurface, FSharedSurface, FSharedContext) <> EGL_FALSE
    else
      // Keep shared context
      Result := True;
  end
  else
  begin
    if not FThreadDictionary.TryGetValue(TThread.CurrentThread.ThreadID, Pair) then
    begin
      Pair.Context := eglCreateContext(FSharedDisplay, FSharedConfig, FSharedContext, @ContextAttributes[0]);
      Pair.Surface := CreateEGLSurface(1, 1);

      TMonitor.Enter(FThreadDictionary);
      try
        FThreadDictionary.Add(TThread.CurrentThread.ThreadID, Pair);
      finally
        TMonitor.Exit(FThreadDictionary);
      end;
    end;
    if eglGetCurrentContext <> Pair.Context then
      Result := eglMakeCurrent(FSharedDisplay, Pair.Surface, Pair.Surface, Pair.Context) <> EGL_FALSE;
  end;
end;

{ TContextAndroid }

type
  TContextAndroid = class(TCustomAndroidContext)
  private
    FNativeWindow: PANativeWindow;
    function CreateFrameBuffer(const BufferWidth, BufferHeight: GLint; const TextureHandle: GLuint;
      const DepthStencil: Boolean; var FrameBuf, DepthBuf, StencilBuf: GLuint): Boolean;
    procedure CreateContextForNativeWindow;
    procedure CreateContextForNativeView;
    function TryGetFrameBuffer(var AFrameBuf: GLuint): Boolean;
    procedure SetFrameBuffer(const AFrameBuf: GLuint);
    function TryGetOrCreateFrameBuffer(var AFrameBuf: GLuint): Boolean;
  protected
    class function GetShaderArch: TContextShaderArch; override;
    procedure DoSetScissorRect(const ScissorRect: TRect); override;
    function DoBeginScene: Boolean; override;
    procedure DoEndScene; override;
    { buffer }
    procedure DoCreateBuffer; override;
    { constructors }
    constructor CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean); override;
    constructor CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean); override;
  public
    destructor Destroy; override;
  end;

{ TContextAndroid }

constructor TContextAndroid.CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
  const AMultisample: TMultisample; const ADepthStencil: Boolean);
begin
  FSupportMS := False;
  inherited;
  if (FSharedContext = nil) and (SharedMultisamples < 1) then
    SharedMultisamples := MultisampleTypeToNumber(AMultisample);

  CreateSharedContext;
  CreateBuffer;
end;

constructor TContextAndroid.CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
  const ADepthStencil: Boolean);
begin
  FSupportMS := False;
  inherited;
end;

destructor TContextAndroid.Destroy;
begin
  if FNativeWindow <> nil then
  begin
    ActivateSharedContext;
    eglDestroySurface(FSharedDisplay, FSurface);
    ANativeWindow_release(FNativeWindow);
  end
  else if (FSharedSurface <> FSurface) and (FSurface <> nil) then
  begin
    ActivateSharedContext;
    eglDestroySurface(FSharedDisplay, FSurface);
  end;
  inherited;
end;

procedure TContextAndroid.CreateContextForNativeView;

  procedure AddAttributes(var ContextAttributes: TContextAttributes; const Attributes: array of EGLint);
  var
    I, Index: Integer;
  begin
    Index := Length(ContextAttributes);
    SetLength(ContextAttributes, Index + Length(Attributes));

    for I := 0 to Length(Attributes) - 1 do
      ContextAttributes[Index + I] := Attributes[I];
  end;

var
  ConfigAttribs: TContextAttributes;
  NumConfigs: EGLint;
  Format: EGLint;
  Config: EGLConfig;
  RenderingSetupService: IFMXRenderingSetupService;
  ColorBits, DepthBits, Multisamples: Integer;
  Stencil: Boolean;
  Surface: JSurface;
begin
  if TAndroidHandle(Parent).Surface = nil then
    Exit;

  // Determine initial number of multisamples based on form quality settings.
  Multisamples := MultisampleTypeToNumber(Multisample);

  // Default rendering configuration.
  ColorBits := 24;
  DepthBits := 24;
  Stencil := True;

  // Request adjustment of rendering configuration.
  if TPlatformServices.Current.SupportsPlatformService(IFMXRenderingSetupService, RenderingSetupService) then
    RenderingSetupService.Invoke(ColorBits, DepthBits, Stencil, Multisamples);

  { Extensions must be obtained prior creating main OpenGL ES context for configuring depth buffer that is higher
    than 16 bits or enabling multisampling. In this case, create a dummy OpenGL ES context and read OpenGL ES
    extensions and renderer information. }
  if (DepthBits > 16) or (Multisamples > 0) then
    LoadExtensions;

  // Prepare final context configuration.
  SetLength(ConfigAttribs, 0);
  AddAttributes(ConfigAttribs, [EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT]);
  AddAttributes(ConfigAttribs, [EGL_SURFACE_TYPE, EGL_WINDOW_BIT]);

  // Color Bitdepth.
  if ColorBits > 16 then
    AddAttributes(ConfigAttribs, [EGL_BUFFER_SIZE, 32, EGL_RED_SIZE, 8, EGL_GREEN_SIZE, 8, EGL_BLUE_SIZE, 8])
  else
    AddAttributes(ConfigAttribs, [EGL_BUFFER_SIZE, 16, EGL_RED_SIZE, 5, EGL_GREEN_SIZE, 5, EGL_BLUE_SIZE, 5]);

  // Depth Buffer.
  if DepthBits > 0 then
  begin
    if DepthBits > 16 then
    begin
      if Extensions[OES_depth24] then
        // 24-bit depth buffer is supported.
        AddAttributes(ConfigAttribs, [EGL_DEPTH_SIZE, 24])
      else
      begin // No 24-bit depth support.
        AddAttributes(ConfigAttribs, [EGL_DEPTH_SIZE, 16]);

        // Tegra 3 GPU has extension for improved accuracy of depth buffer.
        if Extensions[NV_depth_nonlinear] then
          AddAttributes(ConfigAttribs, [EGL_DEPTH_ENCODING_NV, EGL_DEPTH_ENCODING_NONLINEAR_NV]);
      end;
    end
    else // 16-bit depth buffer
      AddAttributes(ConfigAttribs, [EGL_DEPTH_SIZE, 16]);
  end;

  // Stencil Buffer.
  if Stencil then
    AddAttributes(ConfigAttribs, [EGL_STENCIL_SIZE, 8]);

  // Multisamples.
  if Multisamples > 0 then
  begin
    // Tegra 3 GPU does not support MSAA (it only does CSAA).
    if not Extensions.Renderer.Contains('TEGRA 3') then
      AddAttributes(ConfigAttribs, [EGL_SAMPLE_BUFFERS, 1, EGL_SAMPLES, Multisamples]);
  end;

  // Close the configuration.
  AddAttributes(ConfigAttribs, [EGL_NONE]);

  if eglChooseConfig(FSharedDisplay, @ConfigAttribs[0], @Config, 1, @NumConfigs) = 0 then
    RaiseContextExceptionFmt(@SCannotCreateOpenGLContext, ['eglChooseConfig']);

  Surface := TJSurface.JavaClass.init(TAndroidHandle(Parent).Surface);

  FNativeWindow := ANativeWindow_fromSurface(TJNIResolver.GetJNIEnv, TJNIResolver.JavaInstanceToID(Surface));
  eglGetConfigAttrib(FSharedDisplay, Config, EGL_NATIVE_VISUAL_ID, @Format);
  ANativeWindow_setBuffersGeometry(FNativeWindow, 0, 0, Format);

  FSurface := eglCreateWindowSurface(FSharedDisplay, Config, FNativeWindow, nil);
  FContext := SharedContext;

  if eglMakeCurrent(FSharedDisplay, FSurface, FSurface, FContext) = 0 then
  begin
    eglDestroySurface(FSharedDisplay, FSurface);
    RaiseContextExceptionFmt(@SCannotCreateOpenGLContext, ['eglMakeCurrent']);
  end;

  TContext3D.ResetStates;
end;

procedure TContextAndroid.CreateContextForNativeWindow;
  procedure AddAttributes(var ContextAttributes: TContextAttributes; const Attributes: array of EGLint);
  var
    I, Index: Integer;
  begin
    Index := Length(ContextAttributes);
    SetLength(ContextAttributes, Index + Length(Attributes));

    for I := 0 to Length(Attributes) - 1 do
      ContextAttributes[Index + I] := Attributes[I];
  end;

var
  ConfigAttribs: TContextAttributes;
  NumConfigs: EGLint;
  Format: EGLint;
  Config: EGLConfig;
  RenderingSetupService: IFMXRenderingSetupService;
  ColorBits, DepthBits, Multisamples: Integer;
  Stencil: Boolean;
begin
  if TAndroidWindowHandle(Parent).Holder = nil then
    Exit;

  // Determine initial number of multisamples based on form quality settings.
  Multisamples := MultisampleTypeToNumber(Multisample);

  // Default rendering configuration.
  ColorBits := 24;
  DepthBits := 24;
  Stencil := True;

  // Request adjustment of rendering configuration.
  if TPlatformServices.Current.SupportsPlatformService(IFMXRenderingSetupService, RenderingSetupService) then
    RenderingSetupService.Invoke(ColorBits, DepthBits, Stencil, Multisamples);

  { Extensions must be obtained prior creating main OpenGL ES context for configuring depth buffer that is higher
    than 16 bits or enabling multisampling. In this case, create a dummy OpenGL ES context and read OpenGL ES
    extensions and renderer information. }
  if (DepthBits > 16) or (Multisamples > 0) then
    LoadExtensions;

  // Prepare final context configuration.
  SetLength(ConfigAttribs, 0);
  AddAttributes(ConfigAttribs, [EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT]);
  AddAttributes(ConfigAttribs, [EGL_SURFACE_TYPE, EGL_WINDOW_BIT]);

  // Color Bitdepth.
  if ColorBits > 16 then
    AddAttributes(ConfigAttribs, [EGL_BUFFER_SIZE, 32, EGL_RED_SIZE, 8, EGL_GREEN_SIZE, 8, EGL_BLUE_SIZE, 8])
  else
    AddAttributes(ConfigAttribs, [EGL_BUFFER_SIZE, 16, EGL_RED_SIZE, 5, EGL_GREEN_SIZE, 5, EGL_BLUE_SIZE, 5]);

  // Depth Buffer.
  if DepthBits > 0 then
  begin
    if DepthBits > 16 then
    begin
      if Extensions[OES_depth24] then
        // 24-bit depth buffer is supported.
        AddAttributes(ConfigAttribs, [EGL_DEPTH_SIZE, 24])
      else
      begin // No 24-bit depth support.
        AddAttributes(ConfigAttribs, [EGL_DEPTH_SIZE, 16]);

        // Tegra 3 GPU has extension for improved accuracy of depth buffer.
        if Extensions[NV_depth_nonlinear] then
          AddAttributes(ConfigAttribs, [EGL_DEPTH_ENCODING_NV, EGL_DEPTH_ENCODING_NONLINEAR_NV]);
      end;
    end
    else // 16-bit depth buffer
      AddAttributes(ConfigAttribs, [EGL_DEPTH_SIZE, 16]);
  end;

  // Stencil Buffer.
  if Stencil then
    AddAttributes(ConfigAttribs, [EGL_STENCIL_SIZE, 8]);

  // Multisamples.
  if Multisamples > 0 then
  begin
    // Tegra 3 GPU does not support MSAA (it only does CSAA).
    if not Extensions.Renderer.Contains('TEGRA 3') then
      AddAttributes(ConfigAttribs, [EGL_SAMPLE_BUFFERS, 1, EGL_SAMPLES, Multisamples]);
  end;

  // Close the configuration.
  AddAttributes(ConfigAttribs, [EGL_NONE]);

  if eglChooseConfig(FSharedDisplay, @ConfigAttribs[0], @Config, 1, @NumConfigs) = 0 then
    RaiseContextExceptionFmt(@SCannotCreateOpenGLContext, ['eglChooseConfig']);

  FNativeWindow := ANativeWindow_fromSurface(TJNIResolver.GetJNIEnv, (TAndroidWindowHandle(Parent).Holder.getSurface as ILocalObject).GetObjectID);
  eglGetConfigAttrib(FSharedDisplay, Config, EGL_NATIVE_VISUAL_ID, @Format);
  ANativeWindow_setBuffersGeometry(FNativeWindow, 0, 0, Format);

  FSurface := eglCreateWindowSurface(FSharedDisplay, Config, FNativeWindow, nil);
  FContext := FSharedContext;

  if eglMakeCurrent(FSharedDisplay, FSurface, FSurface, FContext) = 0 then
  begin
    eglDestroySurface(FSharedDisplay, FSurface);
    RaiseContextExceptionFmt(@SCannotCreateOpenGLContext, ['eglMakeCurrent']);
  end;

  TContext3D.ResetStates;
end;

function TContextAndroid.CreateFrameBuffer(const BufferWidth, BufferHeight: GLint; const TextureHandle: GLuint;
  const DepthStencil: Boolean; var FrameBuf, DepthBuf, StencilBuf: GLuint): Boolean;
var
  Status: GLint;
begin
  //fix by flying wang.
  GLClearErrors;
  if FrameBuf = 0 then
    glGenFramebuffers(1, @FrameBuf);
  glBindFramebuffer(GL_FRAMEBUFFER, FrameBuf);

  glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, TextureHandle, 0);

  if DepthStencil then
  begin
    if Extensions[OES_packed_depth_stencil] then
    begin // using OES_packed_depth_stencil extension
      if DepthBuf = 0 then
        glGenRenderbuffers(1, @DepthBuf);
      glBindRenderbuffer(GL_RENDERBUFFER, DepthBuf);
      glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, BufferWidth, BufferHeight);
      glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, DepthBuf);
      glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, DepthBuf);
      glBindRenderbuffer(GL_RENDERBUFFER, 0);
      StencilBuf := 0;
    end
    else
    begin // attempting more conservative approach
      if DepthBuf = 0 then
        glGenRenderbuffers(1, @DepthBuf);
      glBindRenderbuffer(GL_RENDERBUFFER, DepthBuf);
      glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, BufferWidth, BufferHeight);
      glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, DepthBuf);

      if StencilBuf = 0 then
        glGenRenderbuffers(1, @StencilBuf);
      glBindRenderbuffer(GL_RENDERBUFFER, StencilBuf);
      glRenderbufferStorage(GL_RENDERBUFFER, GL_STENCIL_INDEX8, BufferWidth, BufferHeight);
      glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, StencilBuf);
      glBindRenderbuffer(GL_RENDERBUFFER, 0);
    end;
  end;

  Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
  if (Status <> GL_FRAMEBUFFER_COMPLETE) or GLHasAnyErrors then
  begin
    if StencilBuf <> 0 then
    begin
      glDeleteRenderbuffers(1, @StencilBuf);
      StencilBuf := 0;
    end;

    if DepthBuf <> 0 then
    begin
      glDeleteRenderbuffers(1, @DepthBuf);
      DepthBuf := 0;
    end;

    if FrameBuf <> 0 then
    begin
      glDeleteFramebuffers(1, @FrameBuf);
      FrameBuf := 0;
    end;

    Result := False;
  end
  else
    Result := True;
end;

function TContextAndroid.DoBeginScene: Boolean;
var
  LFrameBuf: GLuint;
begin
  Result := False;
  //fix by flying wang.
  GLClearErrors;
  if Valid then
  begin
    glGetIntegerv(GL_VIEWPORT, @FOldViewport[0]);

    if (Texture <> nil) or (FFrameBuf <> 0) then
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @FOldFBO);
      if TryGetOrCreateFrameBuffer(LFrameBuf) then
        glBindFramebuffer(GL_FRAMEBUFFER, LFrameBuf)
      else
        Exit(False);
    end;

    if Texture = nil then
      glViewport(0, 0, Round(Width * Scale), Round(Height * Scale))
    else
      glViewport(0, 0, Width, Height);

    if FContext = nil then
      if Parent <> nil then
      begin
        if (Parent is TAndroidWindowHandle) and (TAndroidWindowHandle(Parent).Holder <> nil) then
          CreateContextForNativeWindow;

        if (Parent is TAndroidHandle) and (TAndroidHandle(Parent).Surface <> nil) then
          CreateContextForNativeView;

        if FContext = nil then
          Exit(False);
      end
      else
      begin
        FContext := FSharedContext;
        FSurface := CreateEGLPBufferSurface(Width, Height);
      end;

    Result := inherited DoBeginScene;

    if GLHasAnyErrors() then
      RaiseContextExceptionFmt(@SCannotBeginRenderingScene, [ClassName]);
  end;
end;

procedure TContextAndroid.DoEndScene;
begin
  if (Texture <> nil) or (FFrameBuf <> 0) then
    glBindFramebuffer(GL_FRAMEBUFFER, FOldFBO);

  glViewport(FOldViewport[0], FOldViewport[1], FOldViewport[2], FOldViewport[3]);
  if FSurface <> nil then
    eglSwapBuffers(TCustomAndroidContext.SharedDisplay, FSurface);
  inherited DoEndScene;
end;

function TContextAndroid.TryGetFrameBuffer(var AFrameBuf: GLuint): Boolean;
var
  Buffers: TFrameBuffers;
begin
  AFrameBuf := 0;

  if not IsMainThread then
  begin
    if FThreadBuffers.TryGetValue(TThread.CurrentThread.ThreadID, Buffers) then
      Buffers.TryGetValue(Texture.Handle, AFrameBuf);
  end
  else
    AFrameBuf := FFrameBuf;

  Result := AFrameBuf <> 0;
end;

function TContextAndroid.TryGetOrCreateFrameBuffer(var AFrameBuf: GLuint): Boolean;
begin
  Result := TryGetFrameBuffer(AFrameBuf);
  if not Result then
  begin
    CreateBuffer;
    Result := TryGetFrameBuffer(AFrameBuf);
  end;
  Assert(AFrameBuf <> 0);
end;

procedure TContextAndroid.SetFrameBuffer(const AFrameBuf: GLuint);
var
  Buffers: TFrameBuffers;
begin
  if (AFrameBuf <> 0) and not IsMainThread then
  begin
    if not FThreadBuffers.TryGetValue(TThread.CurrentThread.ThreadID, Buffers) then
    begin
      Buffers := TFrameBuffers.Create;
      FThreadBuffers.Add(TThread.CurrentThread.ThreadID, Buffers);
    end;
    Buffers.AddOrSetValue(Texture.Handle, AFrameBuf);
  end
  else
    FFrameBuf := AFrameBuf;
end;

procedure TContextAndroid.DoCreateBuffer;
var
  OldFBO: GLuint;
  LFrameBuf: GLuint;
begin
  if Valid and (Texture <> nil) then
  begin
    if Texture.Handle = 0 then
      Texture.Initialize;

    glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
    try
      TryGetFrameBuffer(LFrameBuf);

      if not CreateFrameBuffer(Width, Height, Texture.Handle, DepthStencil, LFrameBuf, FDepthBuf, FStencilBuf) and
        DepthStencil then
      begin
        if not CreateFrameBuffer(Width, Height, Texture.Handle, False, LFrameBuf, FDepthBuf, FStencilBuf) then
          RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);
      end;

      SetFrameBuffer(LFrameBuf);
    finally
      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end;
  end;
end;

class function TContextAndroid.GetShaderArch: TContextShaderArch;
begin
  Result := TContextShaderArch.Android;
end;

procedure TContextAndroid.DoSetScissorRect(const ScissorRect: TRect);
var
  R: TRect;
begin
  //fix by flying wang.
  GLClearErrors;
  R := Rect(Round(ScissorRect.Left * Scale), Round(ScissorRect.Top * Scale),
    Round(ScissorRect.Right * Scale), Round(ScissorRect.Bottom * Scale));

  if Texture <> nil then
    glScissor(R.Left, Height - R.Bottom, R.Width, R.Height)
  else
    glScissor(R.Left, Round(Height * Scale) - R.Bottom, R.Width, R.Height);

  if GLHasAnyErrors() then
    RaiseContextExceptionFmt(@SErrorInContextMethod, ['DoSetScissorRect']);
end;

procedure RegisterContextClasses;
begin
  TContextManager.RegisterContext(TContextAndroid, True);
end;

procedure UnregisterContextClasses;
begin
  TContextAndroid.DestroySharedContext;
end;

end.
