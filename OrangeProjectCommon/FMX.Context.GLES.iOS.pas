{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2015 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit FMX.Context.GLES.iOS;

interface









{$REGION 'D11'}
{$IFDEF VER350}
{$IFDEF IOS}
{$SCOPEDENUMS ON}

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes, System.UIConsts, System.Generics.Collections, System.Math,
  Macapi.CoreFoundation, iOSapi.CocoaTypes, iOSapi.CoreGraphics, iOSapi.Foundation, iOSapi.UIKit, iOSapi.OpenGLES, iOSapi.GLKit,
  FMX.Types, FMX.Types3D, FMX.Platform, FMX.Filter, FMX.Graphics, FMX.Context.GLES;

type
  TCustomContextIOS = class(TCustomContextOpenGL)
  private const
    iOSMaxLightCount = 4;
  protected class var
    FSharedContext: EAGLContext;
    FThreadDictionary: TDictionary<TThreadID, EAGLContext>;
    class function GetSharedContext: EAGLContext; static;
  protected
    class procedure CreateSharedContext; override;
    class procedure DestroySharedContext; override;
    class procedure CreateThreadDictionary;
    class procedure DestroyThreadDictionary;
  public
    class property SharedContext: EAGLContext read GetSharedContext;
    class function Valid: Boolean; override;
    class function MaxLightCount: Integer; override;
    class function Style: TContextStyles; override;
  end;

procedure RegisterContextClasses;
procedure UnregisterContextClasses;

implementation {===============================================================}

uses
  FMX.Platform.iOS, FMX.Forms, FMX.Consts, FMX.Canvas.GPU, FMX.Materials;

{ TCustomContextIOS }

class procedure TCustomContextIOS.CreateSharedContext;
begin
  if FSharedContext = nil then
  begin
    FSharedContext := TEAGLContext.Wrap(TEAGLContext.Alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2));
    FSharedContext.retain;
    CreateThreadDictionary;
  end;
end;

class procedure TCustomContextIOS.DestroySharedContext;
begin
  if FSharedContext <> nil then
  begin
    DestroyPrograms;
    DestroyThreadDictionary;
    FSharedContext.release;
    FSharedContext := nil;
  end;
end;

class procedure TCustomContextIOS.CreateThreadDictionary;
begin
  FThreadDictionary := TDictionary<TThreadID, EAGLContext>.Create;
end;

class procedure TCustomContextIOS.DestroyThreadDictionary;
var
  LContext: EAGLContext;
begin
  for LContext in FThreadDictionary.Values do
    LContext.release;
  FThreadDictionary.Free;
end;

class function TCustomContextIOS.MaxLightCount: Integer;
begin
  Result := iOSMaxLightCount;
end;

class function TCustomContextIOS.Style: TContextStyles;
begin
  Result := [TContextStyle.RenderTargetFlipped];
end;

class function TCustomContextIOS.GetSharedContext: EAGLContext;
begin
  CreateSharedContext;
  if MainThreadID = TThread.CurrentThread.ThreadID then
    Result := FSharedContext
  else
  begin
    if not FThreadDictionary.TryGetValue(TThread.CurrentThread.ThreadID, Result) then
    begin
      Result := TEAGLContext.Wrap(TEAGLContext.Alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2, FSharedContext.sharegroup));
      Result.retain;
      TMonitor.Enter(FThreadDictionary);
      try
        FThreadDictionary.Add(TThread.CurrentThread.ThreadID, Result);
      finally
        TMonitor.Exit(FThreadDictionary);
      end;
    end;
  end;
end;

class function TCustomContextIOS.Valid: Boolean;
begin
  if SharedContext <> nil then
    Result := TEAGLContext.OCClass.setCurrentContext(SharedContext)
  else
    Result := False;
end;

{ TContextOpenGL }

type

  TContextIOS = class(TCustomContextIOS)
  private
  protected
    class function GetShaderArch: TContextShaderArch; override;
    procedure DoSetScissorRect(const ScissorRect: TRect); override;
    { buffer }
    procedure DoCreateBuffer; override;
    function DoBeginScene: Boolean; override;
    procedure DoEndScene; override;
    { constructors }
    constructor CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean); override;
    constructor CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean); override;
  end;

{ TContextIOS }

constructor TContextIOS.CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean);
begin
  inherited;
  CreateSharedContext;
  CreateBuffer;
end;

constructor TContextIOS.CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean);
begin
  {$WARNINGS OFF}
  FSupportMS := Pos('gl_apple_framebuffer_multisample', LowerCase(MarshaledAString(glGetString(GL_EXTENSIONS)))) > 0;
  {$WARNINGS ON}
  inherited;
end;

procedure TContextIOS.DoCreateBuffer;
var
  Status: Integer;
  OldFBO: GLuint;
begin
  if Valid and (Texture <> nil) then
  begin
    { create buffers }
    if (Multisample <> TMultisample.None) and FSupportMS then
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      { MS }
      glGenFramebuffers(1, @FFrameBufMS);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBufMS);
      glGenRenderbuffers(1, @FRenderBufMS);
      glBindRenderbuffer(GL_RENDERBUFFER, FRenderBufMS);
      glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_RGBA8_OES, Width, Height);
      glFrameBufferRenderBuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, FRenderBufMS);
      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBufMS);
        glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;
      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end
    else
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end;
    if (GLHasAnyErrors()) then
      RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);
  end;
end;

function TContextIOS.DoBeginScene: Boolean;
begin
  Result := False;
  if Valid then
  begin
    glGetIntegerv(GL_VIEWPORT, @FOldViewport[0]);
    if FFrameBuf <> 0 then
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @FOldFBO);
      if FFrameBufMS <> 0 then
        glBindFramebuffer(GL_FRAMEBUFFER, FFrameBufMS)
      else
        glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);
    end;

    if Texture <> nil then
      glViewport(0, 0, Width, Height)
    else
      glViewport(0, 0, Round(Width * Scale), Round(Height * Scale));

    Result := inherited DoBeginScene;

    if (GLHasAnyErrors()) then
      RaiseContextExceptionFmt(@SCannotBeginRenderingScene, [ClassName]);
  end;
end;

procedure TContextIOS.DoEndScene;
begin
  if Valid then
  begin
    if FFrameBufMS <> 0 then
    begin
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, FFrameBufMS);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, FFrameBuf);
      glResolveMultisampleFramebufferAPPLE;
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, 0);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, 0);
    end;
    if FFrameBuf <> 0 then
      glBindFramebuffer(GL_FRAMEBUFFER, FOldFBO);
    glViewport(FOldViewport[0], FOldViewport[1], FOldViewport[2], FOldViewport[3]);
    inherited;
  end;
end;

procedure TContextIOS.DoSetScissorRect(const ScissorRect: TRect);
var
  R: TRect;
begin
  R := Rect(Round(ScissorRect.Left * Scale), Round(ScissorRect.Top * Scale),
    Round(ScissorRect.Right * Scale), Round(ScissorRect.Bottom * Scale));

  if Texture <> nil then
    glScissor(R.Left, Height - R.Bottom, R.Width, R.Height)
  else
    glScissor(R.Left, Round(Height * Scale) - R.Bottom, R.Width, R.Height);

  if (GLHasAnyErrors()) then
    RaiseContextExceptionFmt(@SErrorInContextMethod, ['DoSetScissorRect']);
end;

class function TContextIOS.GetShaderArch: TContextShaderArch;
begin
  Result := TContextShaderArch.IOS;
end;

procedure RegisterContextClasses;
begin
  TContextManager.RegisterContext(TContextIOS, True);
end;

procedure UnregisterContextClasses;
begin
  TContextIOS.DestroySharedContext;
end;




{$ENDIF IOS}
{$ENDIF VER350}
{$ENDREGION 'D11'}







{$REGION 'D10.4.1'}
{$IFDEF VER340}
{$IFDEF IOS}
//{*******************************************************}
//{                                                       }
//{              Delphi FireMonkey Platform               }
//{                                                       }
//{ Copyright(c) 2011-2020 Embarcadero Technologies, Inc. }
//{              All rights reserved                      }
//{                                                       }
//{*******************************************************}
//
//unit FMX.Context.GLES.iOS;
//
//interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes, System.UIConsts, System.Generics.Collections, System.Math,
  Macapi.CoreFoundation, iOSapi.CocoaTypes, iOSapi.CoreGraphics, iOSapi.Foundation, iOSapi.UIKit, iOSapi.OpenGLES, iOSapi.GLKit,
  FMX.Types, FMX.Types3D, FMX.Platform, FMX.Filter, FMX.Graphics, FMX.Context.GLES;

type
  TCustomContextIOS = class(TCustomContextOpenGL)
  private const
    iOSMaxLightCount = 4;
  protected class var
    FSharedContext: EAGLContext;
    FThreadDictionary: TDictionary<TThreadID, EAGLContext>;
    class function GetSharedContext: EAGLContext; static;
  protected
    class procedure CreateSharedContext; override;
    class procedure DestroySharedContext; override;
    class procedure CreateThreadDictionary;
    class procedure DestroyThreadDictionary;
  public
    class property SharedContext: EAGLContext read GetSharedContext;
    class function Valid: Boolean; override;
    class function MaxLightCount: Integer; override;
    class function Style: TContextStyles; override;
  end;

procedure RegisterContextClasses;
procedure UnregisterContextClasses;

implementation {===============================================================}

uses
  FMX.Platform.iOS, FMX.Forms, FMX.Consts, FMX.Canvas.GPU, FMX.Materials;

{ TCustomContextIOS }

class procedure TCustomContextIOS.CreateSharedContext;
begin
  if FSharedContext = nil then
  begin
    {wn}
//    FSharedContext := TEAGLContext.Wrap(TEAGLContext.Create.initWithAPI(kEAGLRenderingAPIOpenGLES2));
    FSharedContext := TEAGLContext.Wrap(TEAGLContext.Alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2));
    FSharedContext.retain;
    CreateThreadDictionary;
  end;
end;

class procedure TCustomContextIOS.DestroySharedContext;
begin
  if FSharedContext <> nil then
  begin
    DestroyPrograms;
    DestroyThreadDictionary;
    FSharedContext.release;
    FSharedContext := nil;
  end;
end;

class procedure TCustomContextIOS.CreateThreadDictionary;
begin
  FThreadDictionary := TDictionary<TThreadID, EAGLContext>.Create;
end;

class procedure TCustomContextIOS.DestroyThreadDictionary;
var
  LContext: EAGLContext;
begin
  for LContext in FThreadDictionary.Values do
    LContext.release;
  FThreadDictionary.Free;
end;

class function TCustomContextIOS.MaxLightCount: Integer;
begin
  Result := iOSMaxLightCount;
end;

class function TCustomContextIOS.Style: TContextStyles;
begin
  Result := [TContextStyle.RenderTargetFlipped];
end;

class function TCustomContextIOS.GetSharedContext: EAGLContext;
begin
  CreateSharedContext;
  if MainThreadID = TThread.CurrentThread.ThreadID then
    Result := FSharedContext
  else
  begin
    if not FThreadDictionary.TryGetValue(TThread.CurrentThread.ThreadID, Result) then
    begin
      Result := TEAGLContext.Wrap(TEAGLContext.Alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2, FSharedContext.sharegroup));
      Result.retain;
      TMonitor.Enter(FThreadDictionary);
      try
        FThreadDictionary.Add(TThread.CurrentThread.ThreadID, Result);
      finally
        TMonitor.Exit(FThreadDictionary);
      end;
    end;
  end;
end;

class function TCustomContextIOS.Valid: Boolean;
begin
  if SharedContext <> nil then
    Result := TEAGLContext.OCClass.setCurrentContext(SharedContext)
  else
    Result := False;
end;

{ TContextOpenGL }

type

  TContextIOS = class(TCustomContextIOS)
  private
  protected
    class function GetShaderArch: TContextShaderArch; override;
    procedure DoSetScissorRect(const ScissorRect: TRect); override;
    { buffer }
    procedure DoCreateBuffer; override;
    function DoBeginScene: Boolean; override;
    procedure DoEndScene; override;
    { constructors }
    constructor CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean); override;
    constructor CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean); override;
  end;

{ TContextIOS }

constructor TContextIOS.CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean);
begin
  inherited;
  CreateSharedContext;
  CreateBuffer;
end;

constructor TContextIOS.CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean);
begin
  {$WARNINGS OFF}
  FSupportMS := Pos('gl_apple_framebuffer_multisample', LowerCase(MarshaledAString(glGetString(GL_EXTENSIONS)))) > 0;
  {$WARNINGS ON}
  inherited;
end;

procedure TContextIOS.DoCreateBuffer;
var
  Status: Integer;
  OldFBO: GLuint;
begin
  if Valid and (Texture <> nil) then
  begin
    { create buffers }
    if (Multisample <> TMultisample.None) and FSupportMS then
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      { MS }
      glGenFramebuffers(1, @FFrameBufMS);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBufMS);
      glGenRenderbuffers(1, @FRenderBufMS);
      glBindRenderbuffer(GL_RENDERBUFFER, FRenderBufMS);
      glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_RGBA8_OES, Width, Height);
      glFrameBufferRenderBuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, FRenderBufMS);
      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBufMS);
        glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;
      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end
    else
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end;
    if (GLHasAnyErrors()) then
      RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);
  end;
end;

function TContextIOS.DoBeginScene: Boolean;
begin
  Result := False;
  if Valid then
  begin
    glGetIntegerv(GL_VIEWPORT, @FOldViewport[0]);
    if FFrameBuf <> 0 then
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @FOldFBO);
      if FFrameBufMS <> 0 then
        glBindFramebuffer(GL_FRAMEBUFFER, FFrameBufMS)
      else
        glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);
    end;

    if Texture <> nil then
      glViewport(0, 0, Width, Height)
    else
      glViewport(0, 0, Round(Width * Scale), Round(Height * Scale));

    Result := inherited DoBeginScene;

    if (GLHasAnyErrors()) then
      RaiseContextExceptionFmt(@SCannotBeginRenderingScene, [ClassName]);
  end;
end;

procedure TContextIOS.DoEndScene;
begin
  if Valid then
  begin
    if FFrameBufMS <> 0 then
    begin
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, FFrameBufMS);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, FFrameBuf);
      glResolveMultisampleFramebufferAPPLE;
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, 0);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, 0);
    end;
    if FFrameBuf <> 0 then
      glBindFramebuffer(GL_FRAMEBUFFER, FOldFBO);
    glViewport(FOldViewport[0], FOldViewport[1], FOldViewport[2], FOldViewport[3]);
    inherited;
  end;
end;

procedure TContextIOS.DoSetScissorRect(const ScissorRect: TRect);
var
  R: TRect;
begin
  R := Rect(Round(ScissorRect.Left * Scale), Round(ScissorRect.Top * Scale),
    Round(ScissorRect.Right * Scale), Round(ScissorRect.Bottom * Scale));

  if Texture <> nil then
    glScissor(R.Left, Height - R.Bottom, R.Width, R.Height)
  else
    glScissor(R.Left, Round(Height * Scale) - R.Bottom, R.Width, R.Height);

  if (GLHasAnyErrors()) then
    RaiseContextExceptionFmt(@SErrorInContextMethod, ['DoSetScissorRect']);
end;

class function TContextIOS.GetShaderArch: TContextShaderArch;
begin
  Result := TContextShaderArch.IOS;
end;

procedure RegisterContextClasses;
begin
  TContextManager.RegisterContext(TContextIOS, True);
end;

procedure UnregisterContextClasses;
begin
  TContextIOS.DestroySharedContext;
end;


//end.


{$ENDIF IOS}
{$ENDIF VER340}
{$ENDREGION 'D10.4.1'}













{$REGION 'D10.3.1'}
{$IFDEF VER330}
{$IFDEF IOS}

//
//{*******************************************************}
//{                                                       }
//{              Delphi FireMonkey Platform               }
//{                                                       }
//{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
//{              All rights reserved                      }
//{                                                       }
//{*******************************************************}
//
//unit FMX.Context.GLES.iOS;
//
//interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes, System.UIConsts, System.Generics.Collections, System.Math,
  Macapi.CoreFoundation, iOSapi.CocoaTypes, iOSapi.CoreGraphics, iOSapi.Foundation, iOSapi.UIKit, iOSapi.OpenGLES, iOSapi.GLKit,
  FMX.Types, FMX.Types3D, FMX.Platform, FMX.Filter, FMX.Graphics, FMX.Context.GLES;

type
  TCustomContextIOS = class(TCustomContextOpenGL)
  private const
    iOSMaxLightCount = 4;
  protected class var
    FSharedContext: EAGLContext;
    FThreadDictionary: TDictionary<TThreadID, EAGLContext>;
    class function GetSharedContext: EAGLContext; static;
  protected
    class procedure CreateSharedContext; override;
    class procedure DestroySharedContext; override;
    class procedure CreateThreadDictionary;
    class procedure DestroyThreadDictionary;
  public
    class property SharedContext: EAGLContext read GetSharedContext;
    class function Valid: Boolean; override;
    class function MaxLightCount: Integer; override;
    class function Style: TContextStyles; override;
  end;

procedure RegisterContextClasses;
procedure UnregisterContextClasses;

implementation {===============================================================}

uses
  FMX.Platform.iOS, FMX.Forms, FMX.Consts, FMX.Canvas.GPU, FMX.Materials;

{ TCustomContextIOS }

class procedure TCustomContextIOS.CreateSharedContext;
begin
  if FSharedContext = nil then
  begin
    {wn}
//    FSharedContext := TEAGLContext.Wrap(TEAGLContext.Create.initWithAPI(kEAGLRenderingAPIOpenGLES2));
    FSharedContext := TEAGLContext.Wrap(TEAGLContext.Alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2));
    FSharedContext.retain;
    CreateThreadDictionary;
  end;
end;

class procedure TCustomContextIOS.DestroySharedContext;
begin
  if FSharedContext <> nil then
  begin
    DestroyPrograms;
    DestroyThreadDictionary;
    FSharedContext.release;
    FSharedContext := nil;
  end;
end;

class procedure TCustomContextIOS.CreateThreadDictionary;
begin
  FThreadDictionary := TDictionary<TThreadID, EAGLContext>.Create;
end;

class procedure TCustomContextIOS.DestroyThreadDictionary;
var
  LContext: EAGLContext;
begin
  for LContext in FThreadDictionary.Values do
    LContext.release;
  FThreadDictionary.Free;
end;

class function TCustomContextIOS.MaxLightCount: Integer;
begin
  Result := iOSMaxLightCount;
end;

class function TCustomContextIOS.Style: TContextStyles;
begin
  Result := [TContextStyle.RenderTargetFlipped];
end;

class function TCustomContextIOS.GetSharedContext: EAGLContext;
begin
  CreateSharedContext;
  if MainThreadID = TThread.CurrentThread.ThreadID then
    Result := FSharedContext
  else
  begin
    if not FThreadDictionary.TryGetValue(TThread.CurrentThread.ThreadID, Result) then
    begin
      Result := TEAGLContext.Wrap(TEAGLContext.Alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2, FSharedContext.sharegroup));
      Result.retain;
      TMonitor.Enter(FThreadDictionary);
      try
        FThreadDictionary.Add(TThread.CurrentThread.ThreadID, Result);
      finally
        TMonitor.Exit(FThreadDictionary);
      end;
    end;
  end;
end;

class function TCustomContextIOS.Valid: Boolean;
begin
  if SharedContext <> nil then
    Result := TEAGLContext.OCClass.setCurrentContext(SharedContext)
  else
    Result := False;
end;

{ TContextOpenGL }

type

  TContextIOS = class(TCustomContextIOS)
  private
  protected
    class function GetShaderArch: TContextShaderArch; override;
    procedure DoSetScissorRect(const ScissorRect: TRect); override;
    { buffer }
    procedure DoCreateBuffer; override;
    function DoBeginScene: Boolean; override;
    procedure DoEndScene; override;
    { constructors }
    constructor CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean); override;
    constructor CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean); override;
  end;

{ TContextIOS }

constructor TContextIOS.CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean);
begin
  inherited;
  CreateSharedContext;
  CreateBuffer;
end;

constructor TContextIOS.CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean);
begin
  {$WARNINGS OFF}
  FSupportMS := Pos('gl_apple_framebuffer_multisample', LowerCase(MarshaledAString(glGetString(GL_EXTENSIONS)))) > 0;
  {$WARNINGS ON}
  inherited;
end;

procedure TContextIOS.DoCreateBuffer;
var
  Status: Integer;
  OldFBO: GLuint;
begin
  if Valid and (Texture <> nil) then
  begin
    { create buffers }
    if (Multisample <> TMultisample.None) and FSupportMS then
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      { MS }
      glGenFramebuffers(1, @FFrameBufMS);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBufMS);
      glGenRenderbuffers(1, @FRenderBufMS);
      glBindRenderbuffer(GL_RENDERBUFFER, FRenderBufMS);
      glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_RGBA8_OES, Width, Height);
      glFrameBufferRenderBuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, FRenderBufMS);
      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBufMS);
        glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;
      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end
    else
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end;
    if (GLHasAnyErrors()) then
      RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);
  end;
end;

function TContextIOS.DoBeginScene: Boolean;
begin
  Result := False;
  if Valid then
  begin
    glGetIntegerv(GL_VIEWPORT, @FOldViewport[0]);
    if FFrameBuf <> 0 then
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @FOldFBO);
      if FFrameBufMS <> 0 then
        glBindFramebuffer(GL_FRAMEBUFFER, FFrameBufMS)
      else
        glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);
    end;

    if Texture <> nil then
      glViewport(0, 0, Width, Height)
    else
      glViewport(0, 0, Round(Width * Scale), Round(Height * Scale));

    Result := inherited DoBeginScene;

    if (GLHasAnyErrors()) then
      RaiseContextExceptionFmt(@SCannotBeginRenderingScene, [ClassName]);
  end;
end;

procedure TContextIOS.DoEndScene;
begin
  if Valid then
  begin
    if FFrameBufMS <> 0 then
    begin
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, FFrameBufMS);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, FFrameBuf);
      glResolveMultisampleFramebufferAPPLE;
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, 0);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, 0);
    end;
    if FFrameBuf <> 0 then
      glBindFramebuffer(GL_FRAMEBUFFER, FOldFBO);
    glViewport(FOldViewport[0], FOldViewport[1], FOldViewport[2], FOldViewport[3]);
    inherited;
  end;
end;

procedure TContextIOS.DoSetScissorRect(const ScissorRect: TRect);
var
  R: TRect;
begin
  R := Rect(Round(ScissorRect.Left * Scale), Round(ScissorRect.Top * Scale),
    Round(ScissorRect.Right * Scale), Round(ScissorRect.Bottom * Scale));

  if Texture <> nil then
    glScissor(R.Left, Height - R.Bottom, R.Width, R.Height)
  else
    glScissor(R.Left, Round(Height * Scale) - R.Bottom, R.Width, R.Height);

  if (GLHasAnyErrors()) then
    RaiseContextExceptionFmt(@SErrorInContextMethod, ['DoSetScissorRect']);
end;

class function TContextIOS.GetShaderArch: TContextShaderArch;
begin
  Result := TContextShaderArch.IOS;
end;

procedure RegisterContextClasses;
begin
  TContextManager.RegisterContext(TContextIOS, True);
end;

procedure UnregisterContextClasses;
begin
  TContextIOS.DestroySharedContext;
end;


//end.



{$ENDIF VER330}
{$ENDIF IOS}
{$ENDREGION 'D10.3.1'}












{$REGION 'D10.2.3'}
{$IFDEF VER320}
{$IFDEF IOS}

{$SCOPEDENUMS ON}

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes, System.UIConsts, System.Generics.Collections, System.Math,
  Macapi.CoreFoundation, iOSapi.CocoaTypes, iOSapi.CoreGraphics, iOSapi.Foundation, iOSapi.UIKit, iOSapi.OpenGLES, iOSapi.GLKit,
  FMX.Types, FMX.Types3D, FMX.Platform, FMX.Filter, FMX.Graphics, FMX.Context.GLES;

type
  TCustomContextIOS = class(TCustomContextOpenGL)
  private const
    iOSMaxLightCount = 4;
  protected class var
    FSharedContext: EAGLContext;
    FThreadDictionary: TDictionary<TThreadID, EAGLContext>;
    class function GetSharedContext: EAGLContext; static;
  protected
    class procedure CreateSharedContext; override;
    class procedure DestroySharedContext; override;
    class procedure CreateThreadDictionary;
    class procedure DestroyThreadDictionary;
  public
    class property SharedContext: EAGLContext read GetSharedContext;
    class function Valid: Boolean; override;
    class function MaxLightCount: Integer; override;
    class function Style: TContextStyles; override;
  end;

procedure RegisterContextClasses;
procedure UnregisterContextClasses;

implementation {===============================================================}

uses
  FMX.Platform.iOS, FMX.Forms, FMX.Consts, FMX.Canvas.GPU, FMX.Materials;

{ TCustomContextIOS }

class procedure TCustomContextIOS.CreateSharedContext;
begin
  if FSharedContext = nil then
  begin
    FSharedContext := TEAGLContext.Wrap(TEAGLContext.Alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2));
    FSharedContext.retain;
    CreateThreadDictionary;
  end;
end;

class procedure TCustomContextIOS.DestroySharedContext;
begin
  if FSharedContext <> nil then
  begin
    DestroyPrograms;
    DestroyThreadDictionary;
    FSharedContext.release;
    FSharedContext := nil;
  end;
end;

class procedure TCustomContextIOS.CreateThreadDictionary;
begin
  FThreadDictionary := TDictionary<TThreadID, EAGLContext>.Create;
end;

class procedure TCustomContextIOS.DestroyThreadDictionary;
var
  LContext: EAGLContext;
begin
  for LContext in FThreadDictionary.Values do
    LContext.release;
  FThreadDictionary.Free;
end;

class function TCustomContextIOS.MaxLightCount: Integer;
begin
  Result := iOSMaxLightCount;
end;

class function TCustomContextIOS.Style: TContextStyles;
begin
  Result := [TContextStyle.RenderTargetFlipped];
end;

class function TCustomContextIOS.GetSharedContext: EAGLContext;
begin
  CreateSharedContext;
  if MainThreadID = TThread.CurrentThread.ThreadID then
    Result := FSharedContext
  else
  begin
    if not FThreadDictionary.TryGetValue(TThread.CurrentThread.ThreadID, Result) then
    begin
      Result := TEAGLContext.Wrap(TEAGLContext.Alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2, FSharedContext.sharegroup));
      Result.retain;
      TMonitor.Enter(FThreadDictionary);
      try
        FThreadDictionary.Add(TThread.CurrentThread.ThreadID, Result);
      finally
        TMonitor.Exit(FThreadDictionary);
      end;
    end;
  end;
end;

class function TCustomContextIOS.Valid: Boolean;
begin
  if SharedContext <> nil then
    Result := TEAGLContext.OCClass.setCurrentContext(SharedContext)
  else
    Result := False;
end;

{ TContextOpenGL }

type

  TContextIOS = class(TCustomContextIOS)
  private
  protected
    class function GetShaderArch: TContextShaderArch; override;
    procedure DoSetScissorRect(const ScissorRect: TRect); override;
    { buffer }
    procedure DoCreateBuffer; override;
    procedure DoEndScene; override;
    { constructors }
    constructor CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean); override;
    constructor CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean); override;
  end;

{ TContextIOS }

constructor TContextIOS.CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean);
begin
  inherited;
  CreateSharedContext;
  CreateBuffer;
end;

constructor TContextIOS.CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean);
begin
  {$WARNINGS OFF}
  FSupportMS := Pos('gl_apple_framebuffer_multisample', LowerCase(MarshaledAString(glGetString(GL_EXTENSIONS)))) > 0;
  {$WARNINGS ON}
  inherited;
end;

procedure TContextIOS.DoCreateBuffer;
var
  Status: Integer;
  OldFBO: GLuint;
begin
  if Valid and (Texture <> nil) then
  begin
    { create buffers }
    if (Multisample <> TMultisample.None) and FSupportMS then
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      { MS }
      glGenFramebuffers(1, @FFrameBufMS);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBufMS);
      glGenRenderbuffers(1, @FRenderBufMS);
      glBindRenderbuffer(GL_RENDERBUFFER, FRenderBufMS);
      glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_RGBA8_OES, Width, Height);
      glFrameBufferRenderBuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, FRenderBufMS);
      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBufMS);
        glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;
      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end
    else
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end;
    if (GLHasAnyErrors()) then
      RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);
  end;
end;

procedure TContextIOS.DoEndScene;
begin
  if Valid then
  begin
    if FFrameBufMS <> 0 then
    begin
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, FFrameBufMS);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, FFrameBuf);
      glResolveMultisampleFramebufferAPPLE;
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, 0);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, 0);
    end;
    inherited;
  end;
end;

procedure TContextIOS.DoSetScissorRect(const ScissorRect: TRect);
var
  R: TRect;
begin
  R := Rect(Round(ScissorRect.Left * Scale), Round(ScissorRect.Top * Scale),
    Round(ScissorRect.Right * Scale), Round(ScissorRect.Bottom * Scale));

  if Texture <> nil then
    glScissor(R.Left, Height - R.Bottom, R.Width, R.Height)
  else
    glScissor(R.Left, Round(Height * Scale) - R.Bottom, R.Width, R.Height);

  if (GLHasAnyErrors()) then
    RaiseContextExceptionFmt(@SErrorInContextMethod, ['DoSetScissorRect']);
end;

class function TContextIOS.GetShaderArch: TContextShaderArch;
begin
  Result := TContextShaderArch.IOS;
end;

procedure RegisterContextClasses;
begin
  TContextManager.RegisterContext(TContextIOS, True);
end;

procedure UnregisterContextClasses;
begin
  TContextIOS.DestroySharedContext;
end;
{$ENDIF}
{$ENDIF}
{$ENDREGION 'D10.2.3'}







{$REGION 'D10.1.2'}
{$IFDEF VER310}
{$IFDEF IOS}

{$SCOPEDENUMS ON}

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes, System.UIConsts, System.Generics.Collections, System.Math,
  Macapi.CoreFoundation, iOSapi.CocoaTypes, iOSapi.CoreGraphics, iOSapi.Foundation, iOSapi.UIKit, iOSapi.OpenGLES, iOSapi.GLKit,
  FMX.Types, FMX.Types3D, FMX.Platform, FMX.Filter, FMX.Graphics, FMX.Context.GLES;

type
  TCustomContextIOS = class(TCustomContextOpenGL)
  private const
    iOSMaxLightCount = 4;
  protected class var
    FSharedContext: EAGLContext;
    class function GetSharedContext: EAGLContext; static;
  protected
    class procedure CreateSharedContext; override;
    class procedure DestroySharedContext; override;
  public
    class property SharedContext: EAGLContext read GetSharedContext;
    class function IsContextAvailable: Boolean; override;

    class function MaxLightCount: Integer; override;
    class function Style: TContextStyles; override;
  end;

procedure RegisterContextClasses;
procedure UnregisterContextClasses;

implementation {===============================================================}

uses
  FMX.Platform.iOS, FMX.Forms, FMX.Consts, FMX.Canvas.GPU, FMX.Materials;

{ TCustomContextIOS }

class procedure TCustomContextIOS.CreateSharedContext;
begin
  if FSharedContext = nil then
    FSharedContext := TEAGLContext.Wrap(TEAGLContext.Alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2));
  TEAGLContext.OCClass.setCurrentContext(FSharedContext);
end;

class procedure TCustomContextIOS.DestroySharedContext;
begin
  if FSharedContext <> nil then
  begin
    DestroyPrograms;
    FSharedContext := nil;
  end;
end;

class function TCustomContextIOS.IsContextAvailable: Boolean;
begin
  Result := SharedContext <> nil;
end;

class function TCustomContextIOS.MaxLightCount: Integer;
begin
  Result := iOSMaxLightCount;
end;

class function TCustomContextIOS.Style: TContextStyles;
begin
  Result := [TContextStyle.RenderTargetFlipped];
end;

class function TCustomContextIOS.GetSharedContext: EAGLContext;
begin
  CreateSharedContext;
  Result := FSharedContext;
end;

{ TContextOpenGL }

type

  TContextIOS = class(TCustomContextIOS)
  private
  protected
    function GetValid: Boolean; override;
    class function GetShaderArch: TContextShaderArch; override;
    procedure DoSetScissorRect(const ScissorRect: TRect); override;
    { buffer }
    procedure DoCreateBuffer; override;
    procedure DoEndScene; override;
    { constructors }
    constructor CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean); override;
    constructor CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean); override;
  public
  end;

{ TContextIOS }

constructor TContextIOS.CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean);
begin
  inherited;
  CreateSharedContext;
  CreateBuffer;
end;

constructor TContextIOS.CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean);
begin
  {$WARNINGS OFF}
  FSupportMS := Pos('gl_apple_framebuffer_multisample', LowerCase(MarshaledAString(glGetString(GL_EXTENSIONS)))) > 0;
  {$WARNINGS ON}
  inherited;
end;

procedure TContextIOS.DoCreateBuffer;
var
  Status: Integer;
  OldFBO: GLuint;
begin
  if IsContextAvailable and (Texture <> nil) then
  begin
    { create buffers }
    if (Multisample <> TMultisample.None) and FSupportMS then
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      { MS }
      glGenFramebuffers(1, @FFrameBufMS);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBufMS);
      glGenRenderbuffers(1, @FRenderBufMS);
      glBindRenderbuffer(GL_RENDERBUFFER, FRenderBufMS);
      glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_RGBA8_OES, Width, Height);
      glFrameBufferRenderBuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, FRenderBufMS);
      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBufMS);
        glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;
      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end
    else
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end;
    if (GLHasAnyErrors()) then
      RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);
  end;
end;

procedure TContextIOS.DoEndScene;
begin
  if Valid then
  begin
    if FFrameBufMS <> 0 then
    begin
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, FFrameBufMS);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, FFrameBuf);
      glResolveMultisampleFramebufferAPPLE;
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, 0);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, 0);
    end;
    inherited;
  end;
end;

procedure TContextIOS.DoSetScissorRect(const ScissorRect: TRect);
var
  R: TRect;
begin
  R := Rect(Round(ScissorRect.Left * Scale), Round(ScissorRect.Top * Scale),
    Round(ScissorRect.Right * Scale), Round(ScissorRect.Bottom * Scale));

  if Texture <> nil then
    glScissor(R.Left, Height - R.Bottom, R.Width, R.Height)
  else
    glScissor(R.Left, Round(Height * Scale) - R.Bottom, R.Width, R.Height);

  if (GLHasAnyErrors()) then
    RaiseContextExceptionFmt(@SErrorInContextMethod, ['DoSetScissorRect']);
end;

class function TContextIOS.GetShaderArch: TContextShaderArch;
begin
  Result := TContextShaderArch.IOS;
end;

function TContextIOS.GetValid: Boolean;
begin
  Result := IsContextAvailable;
  if Result then
    TEAGLContext.OCClass.setCurrentContext(FSharedContext);
end;

procedure RegisterContextClasses;
begin
  TContextManager.RegisterContext(TContextIOS, True);
end;

procedure UnregisterContextClasses;
begin
  TContextIOS.DestroySharedContext;
end;


{$ENDIF}

{$ENDIF}
{$ENDREGION 'D10.1.2'}

















{$REGION 'XE10'}
{$IFDEF VER300}

{$SCOPEDENUMS ON}

{$IFDEF IOS}

uses
  System.Classes, System.SysUtils, System.Types, System.UITypes, System.UIConsts, System.Generics.Collections, System.Math,
  Macapi.CoreFoundation, iOSapi.CocoaTypes, iOSapi.CoreGraphics, iOSapi.Foundation, iOSapi.UIKit, iOSapi.OpenGLES, iOSapi.GLKit,
  FMX.Types, FMX.Types3D, FMX.Platform, FMX.Filter, FMX.Graphics, FMX.Context.GLES;

type
  TCustomContextIOS = class(TCustomContextOpenGL)
  private const
    iOSMaxLightCount = 4;
  protected class var
    FSharedContext: EAGLContext;
    class function GetSharedContext: EAGLContext; static;
  protected
    class procedure CreateSharedContext; override;
    class procedure DestroySharedContext; override;
  public
    class property SharedContext: EAGLContext read GetSharedContext;
    class function IsContextAvailable: Boolean; override;

    class function MaxLightCount: Integer; override;
    class function Style: TContextStyles; override;
  end;

procedure RegisterContextClasses;
procedure UnregisterContextClasses;

implementation {===============================================================}{$IFDEF IOS}

uses
  FMX.Platform.iOS, FMX.Forms, FMX.Consts, FMX.Canvas.GPU, FMX.Materials;

{ TCustomContextIOS }

class procedure TCustomContextIOS.CreateSharedContext;
begin
  if FSharedContext = nil then
  begin
    {wn}
//    FSharedContext := TEAGLContext.Wrap(TEAGLContext.Create.initWithAPI(kEAGLRenderingAPIOpenGLES2));
    FSharedContext := TEAGLContext.Wrap(TEAGLContext.Alloc.initWithAPI(kEAGLRenderingAPIOpenGLES2));
    TEAGLContext.OCClass.setCurrentContext(FSharedContext);
  end;
end;

class procedure TCustomContextIOS.DestroySharedContext;
begin
  if FSharedContext <> nil then
  begin
    DestroyPrograms;
    FSharedContext := nil;
  end;
end;

class function TCustomContextIOS.IsContextAvailable: Boolean;
begin
  Result := SharedContext <> nil;
end;

class function TCustomContextIOS.MaxLightCount: Integer;
begin
  Result := iOSMaxLightCount;
end;

class function TCustomContextIOS.Style: TContextStyles;
begin
  Result := [TContextStyle.RenderTargetFlipped];
end;

class function TCustomContextIOS.GetSharedContext: EAGLContext;
begin
  CreateSharedContext;
  Result := FSharedContext;
end;

{ TContextOpenGL }

type

  TContextIOS = class(TCustomContextIOS)
  private
  protected
    function GetValid: Boolean; override;
    class function GetShaderArch: TContextShaderArch; override;
    procedure DoSetScissorRect(const ScissorRect: TRect); override;
    { buffer }
    procedure DoCreateBuffer; override;
    procedure DoEndScene; override;
    { constructors }
    constructor CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean); override;
    constructor CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean); override;
  public
  end;

{ TContextIOS }

constructor TContextIOS.CreateFromWindow(const AParent: TWindowHandle; const AWidth, AHeight: Integer;
      const AMultisample: TMultisample; const ADepthStencil: Boolean);
begin
  inherited;
  CreateSharedContext;
  CreateBuffer;
end;

constructor TContextIOS.CreateFromTexture(const ATexture: TTexture; const AMultisample: TMultisample;
      const ADepthStencil: Boolean);
begin
  {$WARNINGS OFF}
  FSupportMS := Pos('gl_apple_framebuffer_multisample', LowerCase(MarshaledAString(glGetString(GL_EXTENSIONS)))) > 0;
  {$WARNINGS ON}
  inherited;
end;

procedure TContextIOS.DoCreateBuffer;
var
  Status: Integer;
  OldFBO: GLuint;
begin
  if IsContextAvailable and (Texture <> nil) then
  begin
    { create buffers }
    if (Multisample <> TMultisample.None) and FSupportMS then
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      { MS }
      glGenFramebuffers(1, @FFrameBufMS);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBufMS);
      glGenRenderbuffers(1, @FRenderBufMS);
      glBindRenderbuffer(GL_RENDERBUFFER, FRenderBufMS);
      glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_RGBA8_OES, Width, Height);
      glFrameBufferRenderBuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, FRenderBufMS);
      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBufMS);
        glRenderbufferStorageMultisampleAPPLE(GL_RENDERBUFFER, FMSValue, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBufMS);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;
      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end
    else
    begin
      glGetIntegerv(GL_FRAMEBUFFER_BINDING, @OldFBO);
      glGenFramebuffers(1, @FFrameBuf);
      glBindFramebuffer(GL_FRAMEBUFFER, FFrameBuf);

      glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, Texture.Handle, 0);

      if DepthStencil then
      begin
        glGenRenderbuffers(1, @FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, FDepthBuf);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8_OES, Width, Height);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_RENDERBUFFER, FDepthBuf);
        glBindRenderbuffer(GL_RENDERBUFFER, 0);
      end;

      Status := glCheckFramebufferStatus(GL_FRAMEBUFFER);
      if Status <> GL_FRAMEBUFFER_COMPLETE then
        RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);

      glBindFramebuffer(GL_FRAMEBUFFER, OldFBO);
    end;
    if (GLHasAnyErrors()) then
      RaiseContextExceptionFmt(@SCannotCreateRenderBuffers, [ClassName]);
  end;
end;

procedure TContextIOS.DoEndScene;
begin
  if Valid then
  begin
    if FFrameBufMS <> 0 then
    begin
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, FFrameBufMS);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, FFrameBuf);
      glResolveMultisampleFramebufferAPPLE;
      glBindFramebuffer(GL_READ_FRAMEBUFFER_APPLE, 0);
      glBindFramebuffer(GL_DRAW_FRAMEBUFFER_APPLE, 0);
    end;
    inherited;
  end;
end;

procedure TContextIOS.DoSetScissorRect(const ScissorRect: TRect);
var
  R: TRect;
begin
  R := Rect(Round(ScissorRect.Left * FScale), Round(ScissorRect.Top * FScale),
    Round(ScissorRect.Right * FScale), Round(ScissorRect.Bottom * FScale));

  if Texture <> nil then
    glScissor(R.Left, Height - R.Bottom, R.Width, R.Height)
  else
    glScissor(R.Left, Round(Height * FScale) - R.Bottom, R.Width, R.Height);

  if (GLHasAnyErrors()) then
    RaiseContextExceptionFmt(@SErrorInContextMethod, ['DoSetScissorRect']);
end;

class function TContextIOS.GetShaderArch: TContextShaderArch;
begin
  Result := TContextShaderArch.IOS;
end;

function TContextIOS.GetValid: Boolean;
begin
  Result := IsContextAvailable;
  if Result then
    TEAGLContext.OCClass.setCurrentContext(FSharedContext);
end;

procedure RegisterContextClasses;
begin
  TContextManager.RegisterContext(TContextIOS, True);
end;

procedure UnregisterContextClasses;
begin
  TContextIOS.DestroySharedContext;
end;

{$ENDIF}

{$ENDIF}

{$ENDIF}
{$ENDREGION 'XE10'}













{$IFNDEF IOS}
implementation
{$ENDIF}




end.



