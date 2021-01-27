{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.MediaLibrary.Actions;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.Actions, System.Messaging, FMX.Types, FMX.MediaLibrary, FMX.ActnList, FMX.StdActns, FMX.Consts, 
  FMX.Graphics, FMX.Controls;

type

{ TCustomTakePhotoAction }

  TCustomTakePhotoAction = class(TSysCommonAction)
  public const
    DefaultMaxWidth = 1024;
    DefaultMaxHeight = 1024;
    DefaultEditable = False;
    DefaultNeedSaveToAlbum = False;
  private
    FEditable: Boolean;
    FNeedSaveToAlbum: Boolean;
    FMaxWidth: Cardinal;
    FMaxHeight: Cardinal;
    FOnDidCancelTaking: TOnDidCancelTaking;
    FOnDidFinishTaking: TOnDidFinishTaking;
    function GetTargetControl: TControl;
    { Messaging }
    procedure DidCancelTaking(const Sender: TObject; const M: TMessage);
  protected
    procedure DoCancelTaking; virtual;
    procedure DoFinishedTakingImage(AImage: TBitmap); virtual;
    /// <summary>Fills and returns params of information for quering image.</summary>
    function GetParamsPhotoQuery: TParamsPhotoQuery;
    /// <summary>Need save a photo to album or not</summary>
    property NeedSaveToAlbum: Boolean read FNeedSaveToAlbum write FNeedSaveToAlbum default DefaultNeedSaveToAlbum;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    property TargetControl: TControl read GetTargetControl;
  public
    property Editable: Boolean read FEditable write FEditable default DefaultEditable;
    property MaxHeight: Cardinal read FMaxHeight write FMaxHeight default DefaultMaxHeight;
    property MaxWidth: Cardinal read FMaxWidth write FMaxWidth default DefaultMaxWidth;
    property OnDidCancelTaking: TOnDidCancelTaking read FOnDidCancelTaking write FOnDidCancelTaking;
    property OnDidFinishTaking: TOnDidFinishTaking read FOnDidFinishTaking write FOnDidFinishTaking;
  end;

{ TTakePhotoFromCameraAction }

  TTakePhotoFromCameraAction = class(TCustomTakePhotoAction)
  private
    FCameraService: IFMXCameraService;
    procedure DidReceivedBitmap(const Sender: TObject; const M: TMessage);
  protected
    procedure CustomTextChanged; override;
    function IsSupportedInterface: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property Editable;
    property MaxHeight;
    property MaxWidth;
    property NeedSaveToAlbum;
    property OnDidCancelTaking;
    property OnDidFinishTaking;
  end;

{ TTakePhotoFromLibraryAction }

  TTakePhotoFromLibraryAction = class(TCustomTakePhotoAction)
  private
    FTakenImageService: IFMXTakenImageService;
    procedure DidReceiveBitmap(const Sender: TObject; const M: TMessage);
  protected
    procedure CustomTextChanged; override;
    function IsSupportedInterface: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property Editable;
    property MaxHeight;
    property MaxWidth;
    property OnDidCancelTaking;
    property OnDidFinishTaking;
  end;

{ TShowShareSheetAction }

  TShowShareSheetAction = class(TSysCommonAction)
  strict private
    FSharingService: IFMXShareSheetActionsService;
    FBitmap: TBitmap;
    FMessage: string;
    FOnBeforeExecute: TNotifyEvent;
  private
    procedure SetBitmap(const Value: TBitmap);
  protected
    procedure DoBeforeExecute;
    procedure CustomTextChanged; override;
    function IsSupportedInterface: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property TextMessage: string read FMessage write FMessage;
    property OnBeforeExecute: TNotifyEvent read FOnBeforeExecute write FOnBeforeExecute;
  end;

implementation

uses
  System.SysUtils, FMX.Platform, System.Types;

{ TTakePhotoAction }

constructor TCustomTakePhotoAction.Create(AOwner: TComponent);
begin
  inherited;
  HideIfUnsupportedInterface := True;
  FEditable := DefaultEditable;
  FMaxHeight := DefaultMaxHeight;
  FMaxWidth := DefaultMaxWidth;
  FNeedSaveToAlbum := DefaultNeedSaveToAlbum;
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidCancelTaking, DidCancelTaking);
end;

destructor TCustomTakePhotoAction.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageDidCancelTaking, DidCancelTaking);
  inherited;
end;

procedure TCustomTakePhotoAction.DidCancelTaking(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageDidCancelTaking then
    DoCancelTaking;
end;

procedure TCustomTakePhotoAction.DoCancelTaking;
begin
  if Assigned(OnDidCancelTaking) then
    OnDidCancelTaking;
end;

procedure TCustomTakePhotoAction.DoFinishedTakingImage(AImage: TBitmap);
begin
  if Assigned(OnDidFinishTaking) then
    OnDidFinishTaking(AImage);
end;

function TCustomTakePhotoAction.GetParamsPhotoQuery: TParamsPhotoQuery;
begin
  Result.RequiredResolution := TSize.Create(Longint(MaxWidth), Longint(MaxHeight));
  Result.Editable := Editable;
  Result.NeedSaveToAlbum := NeedSaveToAlbum;
  Result.OnDidFinishTaking := DoFinishedTakingImage;
  Result.OnDidCancelTaking := DoCancelTaking;
end;

function TCustomTakePhotoAction.GetTargetControl: TControl;
begin
  if ActionComponent is TControl then
    Result := TControl(ActionComponent)
  else
    Result := nil;
end;

function TCustomTakePhotoAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Supported;
end;

{ TTakePhotoAction }

constructor TTakePhotoFromCameraAction.Create(AOwner: TComponent);
begin
  inherited;
  TPlatformServices.Current.SupportsPlatformService(IFMXCameraService, FCameraService);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidFinishTakingImageFromCamera, DidReceivedBitmap);
end;

procedure TTakePhotoFromCameraAction.CustomTextChanged;
begin
  Text := GetDefaultText(STakePhotoFromCamera);
end;

destructor TTakePhotoFromCameraAction.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageDidFinishTakingImageFromCamera, DidReceivedBitmap);
  FCameraService := nil;
  inherited;
end;

procedure TTakePhotoFromCameraAction.DidReceivedBitmap(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageDidFinishTakingImageFromCamera then
    DoFinishedTakingImage(TMessageDidFinishTakingImageFromCamera(M).Value);
end;

procedure TTakePhotoFromCameraAction.ExecuteTarget(Target: TObject);
begin
  if IsSupportedInterface then
    FCameraService.TakePhoto(TargetControl, GetParamsPhotoQuery);
end;

function TTakePhotoFromCameraAction.IsSupportedInterface: Boolean;
begin
  Result := FCameraService <> nil;
end;

{ TTakePhotoFromLibraryAction }

constructor TTakePhotoFromLibraryAction.Create(AOwner: TComponent);
begin
  inherited;
  TPlatformServices.Current.SupportsPlatformService(IFMXTakenImageService, FTakenImageService);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidFinishTakingImageFromLibrary, DidReceiveBitmap);
end;

procedure TTakePhotoFromLibraryAction.CustomTextChanged;
begin
  Text := GetDefaultText(STakePhotoFromLibarary);
end;

destructor TTakePhotoFromLibraryAction.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageDidFinishTakingImageFromLibrary, DidReceiveBitmap);
  FTakenImageService := nil;
  inherited;
end;

procedure TTakePhotoFromLibraryAction.DidReceiveBitmap(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageDidFinishTakingImageFromLibrary then
    DoFinishedTakingImage(TMessageDidFinishTakingImageFromLibrary(M).Value);
end;

procedure TTakePhotoFromLibraryAction.ExecuteTarget(Target: TObject);
begin
  if IsSupportedInterface then
    FTakenImageService.TakeImageFromLibrary(TargetControl, GetParamsPhotoQuery);
end;

function TTakePhotoFromLibraryAction.IsSupportedInterface: Boolean;
begin
  Result := FTakenImageService <> nil;
end;

{ TShowShareSheetAction }

constructor TShowShareSheetAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMessage := '';
  FBitmap := TBitmap.Create(0, 0);
  TPlatformServices.Current.SupportsPlatformService(IFMXShareSheetActionsService, FSharingService);
end;

procedure TShowShareSheetAction.CustomTextChanged;
begin
  Text := GetDefaultText(SOpenStandartServices);
end;

destructor TShowShareSheetAction.Destroy;
begin
  FSharingService := nil;
  FreeAndNil(FBitmap);
  inherited Destroy;
end;

procedure TShowShareSheetAction.DoBeforeExecute;
begin
  if Assigned(FOnBeforeExecute) then
    FOnBeforeExecute(Self);
end;

procedure TShowShareSheetAction.ExecuteTarget(Target: TObject);
var
  TargetControl: TControl;
begin
  DoBeforeExecute;
  inherited ExecuteTarget(Target);
  if ActionComponent is TControl then
    TargetControl := TControl(ActionComponent)
  else if Target is TControl then
    TargetControl := TControl(Target)
  else
    TargetControl := nil;
  if (Bitmap <> nil) and (FSharingService <> nil) then
    FSharingService.Share(TargetControl, TextMessage, Bitmap);
end;

function TShowShareSheetAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Supported;
end;

function TShowShareSheetAction.IsSupportedInterface: Boolean;
begin
  Result := FSharingService <> nil;
end;

procedure TShowShareSheetAction.SetBitmap(const Value: TBitmap);
begin
  FBitmap.Assign(Value);
end;

end.
