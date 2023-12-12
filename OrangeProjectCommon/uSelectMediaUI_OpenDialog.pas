unit uSelectMediaUI_OpenDialog;

interface
{$I FrameWork.inc}

uses
  Classes,

  {$IFDEF FMX}
  FMX.Forms,
  FMX.Graphics,
  FMX.Types,
  UITypes,
  FMX.Dialogs,
  {$ENDIF}

  {$IFDEF VCL}
  Graphics,
  Forms,
  Dialogs,
  ExtDlgs,
  {$ENDIF}



    {$IFDEF USE_PASLIBVLC_MEDIAPLAYER}
    {$IF CompilerVersion > 21.0}
    PasListVlcMediaPlayerFrame,
    {$IFEND}
    {$ENDIF}

  {$IFDEF USE_PASLIBVLC_MEDIAPLAYER}
  PasLibVlcUnit, PasLibVlcClassUnit, PasLibVlcPlayerUnit,
  {$ENDIF}

//  StdCtrls,
  uFileCommon,
  uFuncCommon,
  uSkinPicture,
//  uUIFunction,
//  AllImageFrame,
  uPhotoManager,
  uSelectMediaDialog;

type
  TSelectMediaUI_OpenDialog=class(TBaseSelectMediaUI)
  public
//    procedure TakePhotoFromLibraryAction1DidFinishTaking(Sender:TObject;Image: TBitmap);
//    //�Ӷ�ѡͼƬ����
//    procedure DoReturnFrameFromAllImageFrame(AFrame:TFrame);
    procedure DoStartSelect;override;
    procedure DoStartCamera;override;
  end;



implementation




{ TSelectMediaUI_OpenDialog }
//
//procedure TSelectMediaUI_OpenDialog.DoReturnFrameFromAllImageFrame(AFrame: TFrame);
//var
//  I: Integer;
//  J: Integer;
//  ScaleFactor: Single;
//  AFileName:String;
////  AThumbFileName:String;
//  APictureName:String;
////var
////  I: Integer;
////  ScaleFactor: Single;
////var
////  AListViewItem:TSkinListViewItem;
//  APhoto:TPhoto;
//  ABitmap:TBitmap;
////  APictures:TStringList;
//  ABitmapCodecSaveParams:TBitmapCodecSaveParams;
//  AFilePath:String;
//begin
//  for I := 0 to GAllImageFrame.FSelectedOriginPhotoList.Count-1 do
//  begin
//      //��Ƭ����
//      //�ߴ��������1024,��ô��Ҫ��������С
////      if GAllImageFrame.FSelectedOriginPhotoList[I].Width > 1024 then
////      begin
////          ABitmap:=TBitmap.Create;
////          ScaleFactor := GAllImageFrame.FSelectedOriginPhotoList[I].Width / 1024;
//////          GAllImageFrame.FSelectedOriginPhotoList[I].Resize(Round(GAllImageFrame.FSelectedOriginPhotoList[I].Width / ScaleFactor), Round(GAllImageFrame.FSelectedOriginPhotoList[I].Height / ScaleFactor));
////          //���⻨��
////          CopyBitmap(GAllImageFrame.FSelectedOriginPhotoList[I],ABitmap);
////          ABitmap.Resize(Round(ABitmap.Width / ScaleFactor),
////                        Round(ABitmap.Height / ScaleFactor));
////      end
////      else
////      begin
//
//
//
//          //Ĭ�Ϸ�ԭͼ
//          APhoto:=GAllImageFrame.FSelectedOriginPhotoList[I];
//
//          if APhoto.OriginFilePath<>'' then
//          begin
//              //��ͼƬ·����,Windows,Android
////              FSelectMediaDialog.FSelectedThumbFilePaths.Add(APhoto.ThumbFilePath);
////              FSelectMediaDialog.FSelectedFilePaths.Add(APhoto.OriginFilePath);
//
//              FSelectMediaDialog.AddSelectedMedia(APhoto.ThumbFilePath,
//                                                  APhoto.OriginFilePath,
//                                                  APhoto.IsVideo,
//                                                  320,
//                                                  480,
//                                                  //15��
//                                                  15);
//          end
//          else
//          begin
//              //û��ͼƬ·����,IOS
//              ABitmap:=GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap;
//
//              AFilePath:=GetApplicationPath+CreateGUIDString()+'.png';
//              ABitmap.SaveToFile(AFilePath);
////              FSelectMediaDialog.FSelectedThumbFilePaths.Add(AFilePath);
////              FSelectMediaDialog.FSelectedFilePaths.Add(AFilePath);
//
//              FSelectMediaDialog.AddSelectedMedia(AFilePath,
//                                                  AFilePath);
//          end;
//
////      end;
//
//
////      ABitmap:=GAllImageFrame.FSelectedOriginPhotoList[I];
////      //���һ��ͼƬ
////      AListViewItem:=Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
////      //Ҫ����Icon.Assignǰ��
////      AListViewItem.Icon.Url:='';
////      AListViewItem.Icon.Assign(ABitmap);
////      //���⻨��
////      CopyBitmap(ABitmap,AListViewItem.Icon);
//
//
//
//
////      //��Ƭ����
////      APictureName:=GlobalClient.Upload.NewFileId;
////      AFileName:=GlobalClient.CurrentUser.GetUserPath_ChatFiles+PathDelim+APictureName+'.png';
//////      AThumbFileName:=GlobalClient.CurrentUser.GetUserPath_ChatFiles+PathDelim+APictureName+'.thumb.png';
////
////      ABitmapCodecSaveParams.Quality:=70;
////      GAllImageFrame.FSelectedOriginPhotoList[I].SaveToFile(AFileName,@ABitmapCodecSaveParams);
////
////
////
////      //������Ϣ���ݽṹ
////      AChatContent:=TChatContent.Create;
////      try
////          AChatContent.AddImageElement(AFileName);
////
////          if Assigned(OnSendMessage) then
////          begin
////            OnSendMessage(Self,AChatContent.ToJSON);
////          end;
////
////      finally
////        FreeAndNil(AChatContent);
////      end;
//
//
//  end;
//
//
////  if Assigned(FSelectMediaDialog.OnSelectMediaResult) then
////  begin
////    FSelectMediaDialog.OnSelectMediaResult(FSelectMediaDialog,
////                                          FSelectMediaDialog.FSelectedThumbFilePaths,
////                                          FSelectMediaDialog.FSelectedFilePaths);
////  end;
//  FSelectMediaDialog.CallOnSelectMediaResult;
//
//
//  //�ͷ����������е�����ͼ��ԭͼ��ռ�õ��ڴ�
//  GAllImageFrame.ClearAfterReturn;
//
//
//end;

procedure TSelectMediaUI_OpenDialog.DoStartCamera;
begin
//  HideFrame;
//  //��ѡ��Ƭ
//  ShowFrame(TFrame(GAllImageFrame),TFrameAllImage,Application.MainForm,nil,nil,DoReturnFrameFromAllImageFrame,Application,True,False,ufsefNone);
////  GAllImageFrame.FrameHistroy:=CurrentFrameHistroy;
//  GAllImageFrame.OnGetPhotoFromCamera:=TakePhotoFromLibraryAction1DidFinishTaking;
//
//
//
//  case FSelectMediaDialog.SelectMediaType of
//    smtImage:
//    begin
//      GetGlobalAlbumManager.IsCanSelectPhoto:=True;
//      GetGlobalAlbumManager.IsCanSelectVideo:=False;
//    end;
//    smtImageVideo:
//    begin
//      GetGlobalAlbumManager.IsCanSelectPhoto:=True;
//      GetGlobalAlbumManager.IsCanSelectVideo:=True;
//    end;
//    smtVideo:
//    begin
//      GetGlobalAlbumManager.IsCanSelectPhoto:=False;
//      GetGlobalAlbumManager.IsCanSelectVideo:=True;
//    end;
//  end;
//
//
//  GAllImageFrame.Load(True,
//                      0,
//                      FSelectMediaDialog.MaxSelectCount,
//                      FSelectMediaDialog.SelectMediaType);
//
//
//
//  GAllImageFrame.TakePhotoFromCamera;

end;

procedure TSelectMediaUI_OpenDialog.DoStartSelect;
var
//  Image:TSkinPicture;
//  OpenDialog: TOpenPictureDialog;
  OpenDialog: TOpenDialog;
  I: Integer;
  ACoverFilePath:String;
  ATimeLong:Integer;
  AWidth:Integer;
  AHeight:Integer;
begin
//  HideFrame;
//  //��ѡ��Ƭ
//  ShowFrame(TFrame(GAllImageFrame),TFrameAllImage,Application.MainForm,nil,nil,DoReturnFrameFromAllImageFrame,Application,True,False,ufsefNone);
////  GAllImageFrame.FrameHistroy:=CurrentFrameHistroy;
//  GAllImageFrame.OnGetPhotoFromCamera:=TakePhotoFromLibraryAction1DidFinishTaking;
//
//
//
//  case FSelectMediaDialog.SelectMediaType of
//    smtImage:
//    begin
//      GetGlobalAlbumManager.IsCanSelectPhoto:=True;
//      GetGlobalAlbumManager.IsCanSelectVideo:=False;
//    end;
//    smtImageVideo:
//    begin
//      GetGlobalAlbumManager.IsCanSelectPhoto:=True;
//      GetGlobalAlbumManager.IsCanSelectVideo:=True;
//    end;
//    smtVideo:
//    begin
//      GetGlobalAlbumManager.IsCanSelectPhoto:=False;
//      GetGlobalAlbumManager.IsCanSelectVideo:=True;
//    end;
//  end;
//
//
//
//  GAllImageFrame.Load(True,
//                      0,
//                      FSelectMediaDialog.MaxSelectCount,
//                      FSelectMediaDialog.SelectMediaType);



//  OpenDialog := TOpenPictureDialog.Create(nil);
  OpenDialog := TOpenDialog.Create(nil);
  try
//    OpenDialog.Filter := TBitmapCodecManager.GetFilterString;
//  TSelectMediaType=(smtImage,
//                    smtImageVideo,
//                    smtVideo);
//'All (*.png;*.gif;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.tiff)|*.png;*.gif;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.tiff
//|Portable Network Graphics (*.png)|*.png
//|GIF Image (*.gif)|*.gif
//|JPEG Image File (*.jpg)|*.jpg
//|JPEG Image File (*.jpeg)|*.jpeg
//|Bitmaps (*.bmp)|*.bmp
//|Icons (*.ico)|*.ico
//|Enhanced Metafiles (*.emf)|*.emf
//|Metafiles (*.wmf)|*.wmf
//|TIFF Images (*.tif)|*.tif
//|TIFF Images (*.tiff)|*.tiff'

    OpenDialog.Filter := '';

    if ([smtImage,smtVideo] = Self.FSelectMediaDialog.SelectMediaType) then
    begin
      OpenDialog.Filter := 'All (*.png;*.gif;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.tiff;*.mp4)|*.png;*.gif;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.tiff;*.mp4';
    end
    else if ([smtImage] = Self.FSelectMediaDialog.SelectMediaType) then
    begin
      OpenDialog.Filter := 'All (*.png;*.gif;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.tiff)|*.png;*.gif;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf;*.tif;*.tiff';
    end
    else if ([smtVideo] = Self.FSelectMediaDialog.SelectMediaType) then
    begin
      OpenDialog.Filter := 'All (*.mp4)|*.mp4';
    end;



    if Self.FSelectMediaDialog.MaxSelectCount>1 then
    begin
      OpenDialog.Options:=OpenDialog.Options+[TOpenOption.ofAllowMultiSelect];
    end;

    if OpenDialog.Execute then
    begin
      for I := 0 to OpenDialog.Files.Count-1 do
      begin
//        Image:=TSkinPicture.Create;
//        Image.LoadFromFile(OpenDialog.Files[I]);
//        TakePhotoFromLibraryAction1DidFinishTaking(Image);

        if IsVideoFile(OpenDialog.Files[I]) then
        begin
          //ȡ��Ƶ��һ֡
          //ȡʱ��

          ATimeLong:=0;
          AWidth:=0;
          AHeight:=0;
          ACoverFilePath:='';
          {$IFDEF USE_PASLIBVLC_MEDIAPLAYER}
          //PasLibVlcUnit, PasLibVlcClassUnit, PasLibVlcPlayerUnit,
          //��ͼֻ֧��png
          ACoverFilePath:=GetApplicationPath+CreateGUIDString+'.png';
          GetVideoInfo(OpenDialog.Files[I],ACoverFilePath,ATimeLong,AWidth,AHeight);
          {$ENDIF}


          FSelectMediaDialog.AddSelectedMedia(ACoverFilePath,
                                              OpenDialog.Files[I],
                                              True,
                                              AWidth,
                                              AHeight,
                                              ATimeLong
                                              );
        end
        else
        begin
          FSelectMediaDialog.AddSelectedMedia(OpenDialog.Files[I],
                                              OpenDialog.Files[I]);
        end;


//        FreeAndNil(Image);
      end;
      FSelectMediaDialog.CallOnSelectMediaResult;
    end;
  finally
    FreeAndNil(OpenDialog);
  end;


end;


//procedure TSelectMediaUI_OpenDialog.TakePhotoFromLibraryAction1DidFinishTaking(
//  Sender: TObject; Image: TBitmap);
//var
//  AFilePath:String;
//begin
//
//  AFilePath:=GetApplicationPath+CreateGUIDString()+'.png';
//  Image.SaveToFile(AFilePath);
//
//
////  FSelectMediaDialog.FSelectedThumbFilePaths.Add(AFilePath);
////  FSelectMediaDialog.FSelectedFilePaths.Add(AFilePath);
//
//
//  FSelectMediaDialog.AddSelectedMedia(AFilePath,
//                                      AFilePath);
//
//  FSelectMediaDialog.CallOnSelectMediaResult;
//
////  if Assigned(FSelectMediaDialog.OnSelectMediaResult) then
////  begin
////    FSelectMediaDialog.OnSelectMediaResult(FSelectMediaDialog,
////                                          FSelectMediaDialog.FSelectedThumbFilePaths,
////                                          FSelectMediaDialog.FSelectedFilePaths);
////  end;
//
//end;

initialization
  GlobalSelectMediaUIClass:=TSelectMediaUI_OpenDialog;

end.
