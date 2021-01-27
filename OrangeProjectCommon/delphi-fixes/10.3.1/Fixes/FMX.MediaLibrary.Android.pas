(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2015-09-11　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.3.1(10.3 Release 1)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)

{*******************************************************}
{                                                       }
{       Delphi FireMonkey Media Library Service         }
{                                                       }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.MediaLibrary.Android;

interface

{$SCOPEDENUMS ON}

procedure RegisterMediaLibraryServices;

var
  //Fix or By flying Wang.
  LastAndroidReceviceImagePath: string = '';
  onReceiveImagePath_Error_RaiseError: Boolean = True;
  onReceiveImagePath_Error_Str_NotSave: string = 'onReceiveImagePath File not save!';
  onReceiveImagePath_Error_Str_TooSmall: string = 'onReceiveImagePath File size too small!';

implementation

uses
  System.Classes, System.SysUtils, System.IOUtils, System.Permissions, System.Types, System.Math, System.Messaging,
  FMX.MediaLibrary, FMX.Platform, FMX.Platform.Android, FMX.Controls, FMX.Helpers.Android, FMX.Graphics, FMX.Consts,
  FMX.Surfaces, FMX.Forms, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.App, Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net, Androidapi.IOUtils, Androidapi.JNIBridge, Androidapi.JNI, Androidapi.Bitmap, Androidapi.JNI.Os,
  Androidapi.JNI.Embarcadero, Androidapi.JNI.Support, Androidapi.Helpers;

type
{ Taking Image from Library and Camera }

  TImageManagerAndroid = class sealed (TInterfacedObject, IFMXCameraService, IFMXTakenImageService, IFMXPhotoLibrary)
  private
    FParams: TParamsPhotoQuery;
    { FMX Messages System }
    procedure DidReceiveBitmap(const Sender: TObject; const M: TMessage);
    procedure DidCancelReceiveBitmap(const Sender: TObject; const M: TMessage);
    { The returned size is a frame in which the size of the resultant photo will be adjusted }
    function ApproximateAdmissibleImageSize(const ASize: TSize): TSize;
  public
    constructor Create;
    destructor Destroy; override;
    { IFMXCameraService }
    procedure TakePhoto(const AControl: TControl; const ARequiredResolution: TSize; const AEditable: Boolean;
      const AOnDidFinishTaking: TOnDidFinishTaking; const AOnDidCancelTaking: TOnDidCancelTaking); overload;
    procedure TakePhoto(const AControl: TControl; const AParams: TParamsPhotoQuery); overload;
    { IFMXPhotoLibrary }
    procedure AddImageToSavedPhotosAlbum(const ABitmap: TBitmap; const AWriteImageCompletionEvent: TWriteImageCompletionEvent = nil);
    { IFMXTakenImageService }
    procedure TakeImageFromLibrary(const AControl: TControl; const ARequiredResolution: TSize; const AEditable: Boolean;
      const AOnDidFinishTaking: TOnDidFinishTaking; const AOnDidCancelTaking: TOnDidCancelTaking); overload;
    procedure TakeImageFromLibrary(const AControl: TControl; const AParams: TParamsPhotoQuery); overload;
  end;

{ Sharing Image or Text }

  TSharingManagerAndroid = class (TInterfacedObject, IFMXShareSheetActionsService)
  private type
    TSharingDataType = (None, Image, Text, Any);
  private
    FDataType: TSharingDataType;
    function GetSharingMIMETypes(const DataTypes: TSharingDataType): string;
    function GetChooserCaption(const DataTypes: TSharingDataType): string;
    { Working with sharing Intent }
    function CreateSharingIntent(const DataType: TSharingDataType): JIntent;
    procedure AddText(var AIntent: JIntent; const AText: string);
    procedure AddImage(var AIntent: JIntent; const AImage: TBitmap);
  public
    { IFMXShareSheetActionsService }
    procedure Share(const AControl: TControl; const AText: string; const AImage: TBitmap);
  end;

var
  ImageManager: TImageManagerAndroid;
  SharingManager: TSharingManagerAndroid;

procedure RegisterMediaLibraryServices;
begin
  ImageManager := TImageManagerAndroid.Create;
  SharingManager := TSharingManagerAndroid.Create;
  if TAndroidHelper.HasSystemService(TJPackageManager.JavaClass.FEATURE_CAMERA) or
    (TAndroidHelper.HasSystemService(TJPackageManager.JavaClass.FEATURE_CAMERA_FRONT) ) then
    TPlatformServices.Current.AddPlatformService(IFMXCameraService, IInterface(ImageManager));
  TPlatformServices.Current.AddPlatformService(IFMXPhotoLibrary, IInterface(ImageManager));
  TPlatformServices.Current.AddPlatformService(IFMXTakenImageService, IInterface(ImageManager));
  TPlatformServices.Current.AddPlatformService(IFMXShareSheetActionsService, IInterface(SharingManager));
end;

{ TImageManagerAndroid }

constructor TImageManagerAndroid.Create;
begin
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageCancelReceivingImage, DidCancelReceiveBitmap);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageReceivedImagePath, DidReceiveBitmap);
end;

destructor TImageManagerAndroid.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageReceivedImagePath, DidReceiveBitmap);
  TMessageManager.DefaultManager.Unsubscribe(TMessageCancelReceivingImage, DidCancelReceiveBitmap);
  inherited;
end;

procedure TImageManagerAndroid.DidCancelReceiveBitmap(const Sender: TObject; const M: TMessage);
begin
  if Assigned(FParams.OnDidCancelTaking) then
    FParams.OnDidCancelTaking
  else
    TMessageManager.DefaultManager.SendMessage(Self, TMessageDidCancelTaking.Create);
end;

procedure TImageManagerAndroid.DidReceiveBitmap(const Sender: TObject; const M: TMessage);
var
  ImagePath: string;
  Photo: TBitmap;
  RequestCode: Integer;
begin
  if M is TMessageReceivedImagePath then
  begin
    ImagePath := (M as TMessageReceivedImagePath).Value;
    RequestCode := (M as TMessageReceivedImagePath).RequestCode;
//Fix By flying Wang.
    if not FileExists(ImagePath) then
    begin
      if onReceiveImagePath_Error_RaiseError then
        raise Exception.Create(onReceiveImagePath_Error_Str_NotSave);
      exit;
    end;
    LastAndroidReceviceImagePath := ImagePath;
    With TFileStream.Create(ImagePath, fmOpenRead) do
    begin
      try
        if Size <= 32 then
        begin
          if onReceiveImagePath_Error_RaiseError then
            raise Exception.Create(onReceiveImagePath_Error_Str_TooSmall);
          exit;
        end;
      finally
        free;
      end;
    end;
//Fix By flying Wang end.
    Photo := TBitmap.CreateFromFile(ImagePath);
    try
      if Assigned(FParams.OnDidFinishTaking) then
        FParams.OnDidFinishTaking(Photo)
      else
      begin
        if RequestCode = TJFMXMediaLibrary.JavaClass.ACTION_TAKE_IMAGE_FROM_CAMERA then
          TMessageManager.DefaultManager.SendMessage(Self, TMessageDidFinishTakingImageFromCamera.Create(Photo));
        if RequestCode = TJFMXMediaLibrary.JavaClass.ACTION_TAKE_IMAGE_FROM_LIBRARY then
          TMessageManager.DefaultManager.SendMessage(Self, TMessageDidFinishTakingImageFromLibrary.Create(Photo));
      end;
    finally
      Photo.Free;
    end;
  end;
end;

procedure TImageManagerAndroid.AddImageToSavedPhotosAlbum(const ABitmap: TBitmap;
  const AWriteImageCompletionEvent: TWriteImageCompletionEvent = nil);

  function GenerateFileName: string;
  begin
    Result := FormatDateTime('yymmdd_hhnnsszzz', Now) + SJPGImageExtension;
  end;

  function GetSavedPhotosAlbum: string;
  var
    AlbumPath: JFile;
  begin
    AlbumPath := TJUtils.JavaClass.getAlbumDir(StringToJString(SSavedPhotoAlbum));
    Result := JStringToString(AlbumPath.getAbsolutePath);
    ForceDirectories(Result);
  end;

  function GetFileUri(const AFileName: string): Jnet_Uri;
  var
    ImageFile: JFile;
  begin
    ImageFile := TJFile.JavaClass.init(StringToJString(AFileName));
    Result := TJnet_uri.JavaClass.fromFile(ImageFile);
  end;

var
  Intent: JIntent;
  ImageFileName: string;
begin
  try
    ImageFileName := TPath.Combine(GetSavedPhotosAlbum, GenerateFileName);
    ABitmap.SaveToFile(ImageFileName);
    Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_MEDIA_SCANNER_SCAN_FILE);
    Intent.setData(GetFileUri(ImageFileName));
    TAndroidHelper.Activity.sendBroadcast(Intent);
    if Assigned(AWriteImageCompletionEvent) then
      AWriteImageCompletionEvent(True, SImageSaved);
  except on E: Exception do
    if Assigned(AWriteImageCompletionEvent) then
      AWriteImageCompletionEvent(False, E.Message);
  end;
end;

function TImageManagerAndroid.ApproximateAdmissibleImageSize(const ASize: TSize): TSize;
begin
  Result.cx := Min(TCanvasManager.DefaultCanvas.GetAttribute(TCanvasAttribute.MaxBitmapSize), ASize.Width);
  Result.cy := Min(TCanvasManager.DefaultCanvas.GetAttribute(TCanvasAttribute.MaxBitmapSize), ASize.Height);
end;

procedure TImageManagerAndroid.TakeImageFromLibrary(const AControl: TControl; const ARequiredResolution: TSize;
  const AEditable: Boolean; const AOnDidFinishTaking: TOnDidFinishTaking; const AOnDidCancelTaking: TOnDidCancelTaking);
begin
  FParams.Editable := AEditable;
  FParams.RequiredResolution := ApproximateAdmissibleImageSize(ARequiredResolution);
  FParams.NeedSaveToAlbum := False;
  FParams.OnDidFinishTaking := AOnDidFinishTaking;
  FParams.OnDidCancelTaking := AOnDidCancelTaking;
  MainActivity.getFMXMediaLibrary.takeImageFromLibrary(FParams.RequiredResolution.Width, FParams.RequiredResolution.Height,
    FParams.Editable);
end;

procedure TImageManagerAndroid.TakeImageFromLibrary(const AControl: TControl; const AParams: TParamsPhotoQuery);
begin
  FParams := AParams;
  FParams.RequiredResolution := ApproximateAdmissibleImageSize(FParams.RequiredResolution);
  MainActivity.getFMXMediaLibrary.takeImageFromLibrary(FParams.RequiredResolution.Width, FParams.RequiredResolution.Height,
    FParams.Editable);
end;

procedure TImageManagerAndroid.TakePhoto(const AControl: TControl; const AParams: TParamsPhotoQuery);
begin
  if not PermissionsService.IsEveryPermissionGranted(
    [JStringToString(TJManifest_permission.JavaClass.CAMERA),
     JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE),
     JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE)]) then
    raise EPermissionException.CreateFmt(SRequiredPermissionsAreAbsent,
      ['CAMERA, READ_EXTERNAL_STORAGE, WRITE_EXTERNAL_STORAGE']);

  FParams := AParams;
  FParams.RequiredResolution := ApproximateAdmissibleImageSize(FParams.RequiredResolution);
  MainActivity.getFMXMediaLibrary.takeImageFromCamera(FParams.RequiredResolution.Width, FParams.RequiredResolution.Height,
    FParams.Editable, FParams.NeedSaveToAlbum);
end;

procedure TImageManagerAndroid.TakePhoto(const AControl: TControl; const ARequiredResolution: TSize;
  const AEditable: Boolean; const AOnDidFinishTaking: TOnDidFinishTaking; const AOnDidCancelTaking: TOnDidCancelTaking);
begin
  if not PermissionsService.IsEveryPermissionGranted(
    [JStringToString(TJManifest_permission.JavaClass.CAMERA),
     JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE),
     JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE)]) then
    raise EPermissionException.CreateFmt(SRequiredPermissionsAreAbsent,
      ['CAMERA, READ_EXTERNAL_STORAGE, WRITE_EXTERNAL_STORAGE']);

  FParams.Editable := AEditable;
  FParams.RequiredResolution := ApproximateAdmissibleImageSize(ARequiredResolution);
  FParams.NeedSaveToAlbum := False;
  FParams.OnDidFinishTaking := AOnDidFinishTaking;
  FParams.OnDidCancelTaking := AOnDidCancelTaking;
  MainActivity.getFMXMediaLibrary.takeImageFromCamera(FParams.RequiredResolution.Width, FParams.RequiredResolution.Height,
    FParams.Editable, FParams.NeedSaveToAlbum);
end;

{ TSharingAndroid }

procedure TSharingManagerAndroid.AddImage(var AIntent: JIntent; const AImage: TBitmap);
var
  ImageFile: JFile;
  ImageUri: Jnet_Uri;
  ArrayList: JArrayList;
  OutputDir: JFile;
begin
  Assert(AIntent <> nil);
  Assert(AImage <> nil);

  OutputDir := TAndroidHelper.Context.getExternalCacheDir();
  ImageFile := TJFile.JavaClass.createTempFile(StringToJString('attachment'), StringToJString('.png'), OutputDir);
  ImageUri := TAndroidHelper.JFileToJURI(ImageFile);
  AImage.SaveToFile(JStringToString(ImageFile.getAbsolutePath));

  if FDataType = TSharingDataType.Image then
    AIntent.putExtra(TJIntent.JavaClass.EXTRA_STREAM, TJParcelable.Wrap((ImageUri as ILocalObject).GetObjectID))
  else
  begin
    // If we use ACTION_SEND_MULTIPLE action of Intent, we should put image throught Parcelable Array List.
    // Because in this case other application read EXTRA_STREAM like a ArrayList<Uri>
    ArrayList := TJArrayList.Create;
    ArrayList.add(ImageUri);
    AIntent.putParcelableArrayListExtra(TJIntent.JavaClass.EXTRA_STREAM, ArrayList);
  end;
end;

procedure TSharingManagerAndroid.AddText(var AIntent: JIntent; const AText: string);
begin
  Assert(AIntent <> nil);
  AIntent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(AText))
end;

function TSharingManagerAndroid.CreateSharingIntent(const DataType: TSharingDataType): JIntent;
var
  MIMETypes: string;
  Intent: JIntent;
begin
  Intent := TJIntent.Create;
  MIMETypes := GetSharingMIMETypes(DataType);
  if TSharingDataType.Any = DataType then
    Intent.setAction(TJIntent.JavaClass.ACTION_SEND_MULTIPLE)
  else
    Intent.setAction(TJIntent.JavaClass.ACTION_SEND);
  Intent.setType(StringToJString(MIMETypes));
  Intent.setFlags(TJIntent.JavaClass.FLAG_ACTIVITY_CLEAR_WHEN_TASK_RESET);
  Intent.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);
  Result := Intent;
end;

function TSharingManagerAndroid.GetChooserCaption(const DataTypes: TSharingDataType): string;
begin
  case DataTypes of
    TSharingDataType.Image: Result := SMediaLibraryOpenImageWith;
    TSharingDataType.Text: Result := SMediaLibraryOpenTextWith;
    TSharingDataType.Any: Result := SMediaLibraryOpenTextAndImageWith;
  end;
end;

function TSharingManagerAndroid.GetSharingMIMETypes(const DataTypes: TSharingDataType): string;
begin
  // See details http://developer.android.com/training/sharing/send.html#send-multiple-content
  // For TSharingDataType.Any we don't set / because in this case SMS/MMS application opens with empty field
  // without text and image (SMS/MMS don't work with either types of data)

  case DataTypes of
    TSharingDataType.Image: Result := 'image/png';
    TSharingDataType.Text:  Result := 'text/plain';
    TSharingDataType.Any:   Result := 'image/png;text/plain'
  else
    Result := '*/*';
  end;
end;

procedure TSharingManagerAndroid.Share(const AControl: TControl; const AText: string; const AImage: TBitmap);

  function DefineDataTypes: TSharingDataType;
  var
    DataType: TSharingDataType;
  begin
    DataType := TSharingDataType.None;
    if not AText.IsEmpty and (AImage <> nil) and not AImage.IsEmpty then
      DataType := TSharingDataType.Any
    else if not AText.IsEmpty then
      DataType := TSharingDataType.Text
    else if (AImage <> nil) and not AImage.IsEmpty then
      DataType := TSharingDataType.Image;

    Result := DataType;
  end;

var
  Intent: JIntent;
  IntentChooser: JIntent;
  ChooserCaption: string;
begin
  FDataType := DefineDataTypes;
  if FDataType <> TSharingDataType.None then
    try
      Intent := CreateSharingIntent(FDataType);
      case FDataType of
        TSharingDataType.Image: AddImage(Intent, AImage);
        TSharingDataType.Text: AddText(Intent, AText);
        TSharingDataType.Any:
          begin
            AddText(Intent, AText);
            AddImage(Intent, AImage);
          end;
      end;

      { Create chooser of activity }
      ChooserCaption := GetChooserCaption(FDataType);
      IntentChooser := TJIntent.JavaClass.createChooser(Intent, StrToJCharSequence(ChooserCaption));
      TAndroidHelper.Activity.startActivityForResult(IntentChooser, 0);
    finally
      FDataType := TSharingDataType.None;
    end;
end;

end.
