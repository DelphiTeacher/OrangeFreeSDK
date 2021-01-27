{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Clipboard.Android;

interface

{$SCOPEDENUMS ON}

implementation

uses
  System.Rtti, System.Classes, System.Generics.Collections, System.Types, System.SysUtils,
  Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.JavaTypes, Androidapi.Helpers, Androidapi.JNIBridge,
  Androidapi.JNI.App,
  FMX.Platform, FMX.Clipboard, FMX.Surfaces, FMX.Graphics, FMX.Utils, FMX.Types, FMX.Consts, FMX.Helpers.Android;


type
  TAndroidClipboardWrapper = class
  strict private
    FTextClipboardManager: JClipboardManager;
    FContentClipboardManager: Jcontent_ClipboardManager;
  public
    constructor Create;
    destructor Destroy; override;
    //
    function HasText: Boolean;
    function GetText: string;
    procedure SetText(Value: string);
    function HasData(Name: string): Boolean;
    function GetData(Name: string; Stream: TStream): Boolean;
    procedure SetData(Name: string; Stream: TStream);
  end;

  TAndroidClipboardService = class(TInterfacedObject, IFMXClipboardService, IFMXExtendedClipboardService)
  private
    FClipboardWrapper: TAndroidClipboardWrapper;
    FClipboardFormats: TList<string>;
    procedure CheckWrapper;
    procedure CheckDictionary;
  public
    destructor Destroy; override;
    { IFMXClipboardService }
    function GetClipboard: TValue;
    procedure SetClipboard(Value: TValue);
    { IFMXExtendedClipboardService }
    function HasText: Boolean;
    function GetText: string;
    procedure SetText(const Value: string);
    function HasImage: Boolean;
    function GetImage: TBitmapSurface;
    procedure SetImage(const Value: TBitmapSurface);
    procedure RegisterCustomFormat(const AFormatName: string);
    function IsCustomFormatRegistered(const AFormatName: string): Boolean;
    procedure UnregisterCustomFormat(const AFormatName: string);
    function HasCustomFormat(const AFormatName: string): Boolean;
    function GetCustomFormat(const AFormatName: string; const AStream: TStream): Boolean;
    procedure SetCustomFormat(const AFormatName: string; const AStream: TStream);
  end;


var
  AndroidClipboard: TAndroidClipboardService;

procedure RegisterService;
begin
  AndroidClipboard := TAndroidClipboardService.Create;
  TPlatformServices.Current.AddPlatformService(IFMXClipboardService, AndroidClipboard);
  TPlatformServices.Current.AddPlatformService(IFMXExtendedClipboardService, AndroidClipboard);
end;

procedure UnregisterService;
begin
  if TPlatformServices.Current <> nil then
  begin
    TPlatformServices.Current.RemovePlatformService(IFMXClipboardService);
    TPlatformServices.Current.RemovePlatformService(IFMXExtendedClipboardService);
  end;
end;

{ TAndroidClipboardWrapper }

constructor TAndroidClipboardWrapper.Create;
var
  ServiceClassName: string;
  UnknownService: JObject;
begin
  FContentClipboardManager := nil;
  FTextClipboardManager := nil;

  UnknownService := TAndroidHelper.Activity.getSystemService(TJContext.JavaClass.CLIPBOARD_SERVICE);
  if UnknownService <> nil then
  begin
    ServiceClassName := JStringToString(UnknownService.getClass.getName);
    if ServiceClassName = 'android.content.ClipboardManager' then
      FContentClipboardManager := TJcontent_ClipboardManager.Wrap((UnknownService as ILocalObject).GetObjectID)
    else if ServiceClassName = 'android.text.ClipboardManager' then
      FTextClipboardManager := TJClipboardManager.Wrap((UnknownService as ILocalObject).GetObjectID);
  end;
end;

function TAndroidClipboardWrapper.HasText: Boolean;
begin
  if FContentClipboardManager <> nil then
    Result := FContentClipboardManager.hasText
  else if FTextClipboardManager <> nil then
    Result := FTextClipboardManager.hasText
  else
    Result := False;
end;

function TAndroidClipboardWrapper.GetText: string;
begin
  if (FContentClipboardManager <> nil) and FContentClipboardManager.hasText then
    Result := JCharSequenceToStr(FContentClipboardManager.getText)
  else if (FTextClipboardManager <> nil) and FTextClipboardManager.hasText then
    Result := JCharSequenceToStr(FTextClipboardManager.getText)
  else
    Result := string.Empty;
end;

procedure TAndroidClipboardWrapper.SetText(Value: string);
begin
  if FContentClipboardManager <> nil then
    FContentClipboardManager.setText(StrToJCharSequence(Value))
  else
  if FTextClipboardManager <> nil then
    FTextClipboardManager.setText(StrToJCharSequence(Value));
end;

function TAndroidClipboardWrapper.HasData(Name: string): Boolean;
var
  Intent: JIntent;
begin
  if FContentClipboardManager <> nil then
  begin
    Intent := FContentClipboardManager.getPrimaryClip.getItemAt(0).getIntent;
    Result := (Intent <> nil) and Intent.hasExtra(StringToJString(Name));
  end
  else
    raise ENotSupportedException.CreateFmt(SDoesnotSupportCustomData, ['JClipboardManager']);
end;

destructor TAndroidClipboardWrapper.Destroy;
begin
  FTextClipboardManager := nil;
  FContentClipboardManager := nil;
  inherited;
end;

function TAndroidClipboardWrapper.GetData(Name: string; Stream: TStream): Boolean;
var
  Intent: JIntent;
  ByteArray: TJavaArray<Byte>;
begin
  Result := False;
  if FContentClipboardManager <> nil then
  begin
    Intent := FContentClipboardManager.getPrimaryClip.getItemAt(0).getIntent;
    if Intent <> nil then
    begin
      ByteArray := Intent.getByteArrayExtra(StringToJString(Name));
      Stream.Write(ByteArray.Data^, ByteArray.Length);
      Result := True;
    end;
  end
  else
    raise ENotSupportedException.CreateFmt(SDoesnotSupportCustomData, ['JClipboardManager']);
end;

procedure TAndroidClipboardWrapper.SetData(Name: string; Stream: TStream);
var
  Intent: JIntent;
  ByteArray: TJavaArray<Byte>;
  ClipData: JClipData;
begin
  if FContentClipboardManager <> nil then
  begin
    Intent := TJIntent.Create;
    ByteArray := TJavaArray<Byte>.Create(Stream.Size - Stream.Position);
    Stream.Read(ByteArray.Data^, Stream.Size - Stream.Position);
    Intent.putExtra(StringToJString(Name), ByteArray);

    ClipData := TJClipData.JavaClass.newIntent(StrToJCharSequence(Name), Intent);

    FContentClipboardManager.setPrimaryClip(ClipData);
  end
  else
    raise ENotSupportedException.CreateFmt(SDoesnotSupportCustomData, ['JClipboardManager']);
end;

{ TAndroidClipboardService }

procedure TAndroidClipboardService.CheckWrapper;
begin
  if FClipboardWrapper = nil then
    FClipboardWrapper := TUIThreadCaller.Call<TAndroidClipboardWrapper>(
      function: TAndroidClipboardWrapper
      begin
        Result := TAndroidClipboardWrapper.Create;
      end);
end;

procedure TAndroidClipboardService.CheckDictionary;
begin
  if FClipboardFormats = nil then
    FClipboardFormats := TList<string>.Create;
end;

destructor TAndroidClipboardService.Destroy;
begin
  FClipboardFormats.Free;
  FClipboardWrapper.Free;
  inherited;
end;

function TAndroidClipboardService.GetClipboard: TValue;
begin
  Result := GetText;
end;

procedure TAndroidClipboardService.SetClipboard(Value: TValue);
begin
  SetText(Value.ToString);
end;

function TAndroidClipboardService.HasText: Boolean;
begin
  CheckWrapper;
  Result := TUIThreadCaller.Call<Boolean>(FClipboardWrapper.HasText);
end;

function TAndroidClipboardService.GetText: string;
begin
  CheckWrapper;
  Result := TUIThreadCaller.Call<string>(FClipboardWrapper.GetText);
end;

procedure TAndroidClipboardService.SetText(const Value: string);
begin
  CheckWrapper;
  TUIThreadCaller.Call<string>(FClipboardWrapper.SetText, Value);
end;

function TAndroidClipboardService.HasImage: Boolean;
begin
  Result := False;
end;

function TAndroidClipboardService.GetImage: TBitmapSurface;
begin
  Result := nil;
end;

procedure TAndroidClipboardService.SetImage(const Value: TBitmapSurface);
begin
  raise ENotImplemented.Create('SetImage is not implemented');
end;

procedure TAndroidClipboardService.RegisterCustomFormat(const AFormatName: string);
begin
  if AFormatName.IsEmpty then
    raise EArgumentException.Create(SFormatNameCannotBeEmpty);

  CheckDictionary;
  if FClipboardFormats.Contains(AFormatName) then
    raise EClipboardFormatRegisterError.Create(Format(SFormatAlreadyRegistered, [AFormatName]));

  FClipboardFormats.Add(AFormatName);
end;

function TAndroidClipboardService.IsCustomFormatRegistered(const AFormatName: string): Boolean;
begin
  if AFormatName.IsEmpty then
    raise EArgumentException.Create(SFormatNameCannotBeEmpty);

  CheckDictionary;
  Result := FClipboardFormats.Contains(AFormatName);
end;

procedure TAndroidClipboardService.UnregisterCustomFormat(const AFormatName: string);
begin
  if AFormatName.IsEmpty then
    raise EArgumentException.Create(SFormatNameCannotBeEmpty);

  CheckDictionary;
  if FClipboardFormats.Contains(AFormatName) then
    FClipboardFormats.Remove(AFormatName)
  else
    raise EClipboardFormatNotRegistered.Create(Format(SFormatWasNotRegistered, [AFormatName]));
end;

function TAndroidClipboardService.HasCustomFormat(const AFormatName: string): Boolean;
begin
  CheckDictionary;
  if not FClipboardFormats.Contains(AFormatName) then
    raise EClipboardFormatNotRegistered.Create(AFormatName);

  CheckWrapper;
  Result := TUIThreadCaller.Call<string, Boolean>(FClipboardWrapper.HasData, AFormatName);
end;

function TAndroidClipboardService.GetCustomFormat(const AFormatName: string; const AStream: TStream): Boolean;
begin
  if AFormatName.IsEmpty then
    raise EArgumentException.Create(SFormatNameCannotBeEmpty);
  if AStream = nil then
    raise EArgumentNilException.Create(SStreamCannotBeNil);

  CheckDictionary;
  if not FClipboardFormats.Contains(AFormatName) then
    raise EClipboardFormatNotRegistered.Create(AFormatName);

  CheckWrapper;
  Result := TUIThreadCaller.Call<string, TStream, Boolean>(FClipboardWrapper.GetData, AFormatName, AStream);
end;

procedure TAndroidClipboardService.SetCustomFormat(const AFormatName: string; const AStream: TStream);
begin
  if AFormatName.IsEmpty then
    raise EArgumentException.Create(SFormatNameCannotBeEmpty);
  if AStream = nil then
    raise EArgumentNilException.Create(SStreamCannotBeNil);

  CheckDictionary;
  if not FClipboardFormats.Contains(AFormatName) then
    raise EClipboardFormatNotRegistered.Create(AFormatName);

  CheckWrapper;
  CallInUIThreadAndWaitFinishing(
    procedure
    begin
      FClipboardWrapper.SetData(AFormatName, AStream);
    end);
end;


initialization
  RegisterService;
finalization
  UnregisterService;
end.

