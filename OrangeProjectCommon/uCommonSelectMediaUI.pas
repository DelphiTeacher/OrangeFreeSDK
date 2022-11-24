unit uCommonSelectMediaUI;

interface

uses
  FMX.Forms,
  Classes,
//  StdCtrls,
  FMX.Types,
//  FMX.UITypes,
  FMX.Graphics,
  uFileCommon,
  uFuncCommon,
  uUIFunction,
  AllImageFrame,
  uPhotoManager,
  uSelectMediaDialog;

type
  TCommonSelectMediaUI=class(TBaseSelectMediaUI)
  public
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Sender:TObject;Image: TBitmap);
    //�Ӷ�ѡͼƬ����
    procedure DoReturnFrameFromAllImageFrame(AFrame:TFrame);
    procedure DoStartSelect;override;
    procedure DoStartCamera;override;
  end;

implementation

{ TCommonSelectMediaUI }

procedure TCommonSelectMediaUI.DoReturnFrameFromAllImageFrame(AFrame: TFrame);
var
  I: Integer;
  J: Integer;
  ScaleFactor: Single;
  AFileName:String;
//  AThumbFileName:String;
  APictureName:String;
//var
//  I: Integer;
//  ScaleFactor: Single;
//var
//  AListViewItem:TSkinListViewItem;
  APhoto:TPhoto;
  ABitmap:TBitmap;
//  APictures:TStringList;
  ABitmapCodecSaveParams:TBitmapCodecSaveParams;
  AFilePath:String;
begin
  for I := 0 to GAllImageFrame.FSelectedOriginPhotoList.Count-1 do
  begin
      //��Ƭ����
      //�ߴ��������1024,��ô��Ҫ��������С
//      if GAllImageFrame.FSelectedOriginPhotoList[I].Width > 1024 then
//      begin
//          ABitmap:=TBitmap.Create;
//          ScaleFactor := GAllImageFrame.FSelectedOriginPhotoList[I].Width / 1024;
////          GAllImageFrame.FSelectedOriginPhotoList[I].Resize(Round(GAllImageFrame.FSelectedOriginPhotoList[I].Width / ScaleFactor), Round(GAllImageFrame.FSelectedOriginPhotoList[I].Height / ScaleFactor));
//          //���⻨��
//          CopyBitmap(GAllImageFrame.FSelectedOriginPhotoList[I],ABitmap);
//          ABitmap.Resize(Round(ABitmap.Width / ScaleFactor),
//                        Round(ABitmap.Height / ScaleFactor));
//      end
//      else
//      begin



          //Ĭ�Ϸ�ԭͼ
          APhoto:=GAllImageFrame.FSelectedOriginPhotoList[I];

          if APhoto.OriginFilePath<>'' then
          begin
              //��ͼƬ·����,Windows,Android
//              FSelectMediaDialog.FSelectedThumbFilePaths.Add(APhoto.ThumbFilePath);
//              FSelectMediaDialog.FSelectedFilePaths.Add(APhoto.OriginFilePath);

              FSelectMediaDialog.AddSelectedMedia(APhoto.ThumbFilePath,
                                                  APhoto.OriginFilePath,
                                                  APhoto.IsVideo,
                                                  320,
                                                  480,
                                                  //15��
                                                  15);
          end
          else
          begin
              //û��ͼƬ·����,IOS
              ABitmap:=GAllImageFrame.FSelectedOriginPhotoList[I].OriginBitmap;

              AFilePath:=GetApplicationPath+CreateGUIDString()+'.png';
              ABitmap.SaveToFile(AFilePath);
//              FSelectMediaDialog.FSelectedThumbFilePaths.Add(AFilePath);
//              FSelectMediaDialog.FSelectedFilePaths.Add(AFilePath);

              FSelectMediaDialog.AddSelectedMedia(AFilePath,
                                                  AFilePath);
          end;

//      end;


//      ABitmap:=GAllImageFrame.FSelectedOriginPhotoList[I];
//      //���һ��ͼƬ
//      AListViewItem:=Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
//      //Ҫ����Icon.Assignǰ��
//      AListViewItem.Icon.Url:='';
//      AListViewItem.Icon.Assign(ABitmap);
//      //���⻨��
//      CopyBitmap(ABitmap,AListViewItem.Icon);




//      //��Ƭ����
//      APictureName:=GlobalClient.Upload.NewFileId;
//      AFileName:=GlobalClient.CurrentUser.GetUserPath_ChatFiles+PathDelim+APictureName+'.png';
////      AThumbFileName:=GlobalClient.CurrentUser.GetUserPath_ChatFiles+PathDelim+APictureName+'.thumb.png';
//
//      ABitmapCodecSaveParams.Quality:=70;
//      GAllImageFrame.FSelectedOriginPhotoList[I].SaveToFile(AFileName,@ABitmapCodecSaveParams);
//
//
//
//      //������Ϣ���ݽṹ
//      AChatContent:=TChatContent.Create;
//      try
//          AChatContent.AddImageElement(AFileName);
//
//          if Assigned(OnSendMessage) then
//          begin
//            OnSendMessage(Self,AChatContent.ToJSON);
//          end;
//
//      finally
//        FreeAndNil(AChatContent);
//      end;


  end;


//  if Assigned(FSelectMediaDialog.OnSelectMediaResult) then
//  begin
//    FSelectMediaDialog.OnSelectMediaResult(FSelectMediaDialog,
//                                          FSelectMediaDialog.FSelectedThumbFilePaths,
//                                          FSelectMediaDialog.FSelectedFilePaths);
//  end;
  FSelectMediaDialog.CallOnSelectMediaResult;


  //�ͷ����������е�����ͼ��ԭͼ��ռ�õ��ڴ�
  GAllImageFrame.ClearAfterReturn;


end;

procedure TCommonSelectMediaUI.DoStartCamera;
begin
  HideFrame;
  //��ѡ��Ƭ
  ShowFrame(TFrame(GAllImageFrame),TFrameAllImage,Application.MainForm,nil,nil,DoReturnFrameFromAllImageFrame,Application,True,False,ufsefNone);
//  GAllImageFrame.FrameHistroy:=CurrentFrameHistroy;
  GAllImageFrame.OnGetPhotoFromCamera:=TakePhotoFromLibraryAction1DidFinishTaking;


  if (smtImage in FSelectMediaDialog.SelectMediaType) and (smtVideo in FSelectMediaDialog.SelectMediaType) then
  begin
    GetGlobalAlbumManager.IsCanSelectPhoto:=True;
    GetGlobalAlbumManager.IsCanSelectVideo:=True;
  end
  else if (smtImage in FSelectMediaDialog.SelectMediaType) then
  begin
    GetGlobalAlbumManager.IsCanSelectPhoto:=True;
    GetGlobalAlbumManager.IsCanSelectVideo:=False;
  end
  else if (smtVideo in FSelectMediaDialog.SelectMediaType) then
  begin
    GetGlobalAlbumManager.IsCanSelectPhoto:=False;
    GetGlobalAlbumManager.IsCanSelectVideo:=True;
  end;

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


  GAllImageFrame.Load(True,
                      0,
                      FSelectMediaDialog.MaxSelectCount,
                      FSelectMediaDialog.SelectMediaType);



  GAllImageFrame.TakePhotoFromCamera;

end;

procedure TCommonSelectMediaUI.DoStartSelect;
begin
  HideFrame;
  //��ѡ��Ƭ
  ShowFrame(TFrame(GAllImageFrame),TFrameAllImage,Application.MainForm,nil,nil,DoReturnFrameFromAllImageFrame,Application,True,False,ufsefNone);
//  GAllImageFrame.FrameHistroy:=CurrentFrameHistroy;
  GAllImageFrame.OnGetPhotoFromCamera:=TakePhotoFromLibraryAction1DidFinishTaking;



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

  if (smtImage in FSelectMediaDialog.SelectMediaType) and (smtVideo in FSelectMediaDialog.SelectMediaType) then
  begin
    GetGlobalAlbumManager.IsCanSelectPhoto:=True;
    GetGlobalAlbumManager.IsCanSelectVideo:=True;
  end
  else if (smtImage in FSelectMediaDialog.SelectMediaType) then
  begin
    GetGlobalAlbumManager.IsCanSelectPhoto:=True;
    GetGlobalAlbumManager.IsCanSelectVideo:=False;
  end
  else if (smtVideo in FSelectMediaDialog.SelectMediaType) then
  begin
    GetGlobalAlbumManager.IsCanSelectPhoto:=False;
    GetGlobalAlbumManager.IsCanSelectVideo:=True;
  end;




  GAllImageFrame.Load(True,
                      0,
                      FSelectMediaDialog.MaxSelectCount,
                      FSelectMediaDialog.SelectMediaType);

end;


procedure TCommonSelectMediaUI.TakePhotoFromLibraryAction1DidFinishTaking(
  Sender: TObject; Image: TBitmap);
var
  AFilePath:String;
begin

  AFilePath:=GetApplicationPath+CreateGUIDString()+'.png';
  Image.SaveToFile(AFilePath);


//  FSelectMediaDialog.FSelectedThumbFilePaths.Add(AFilePath);
//  FSelectMediaDialog.FSelectedFilePaths.Add(AFilePath);


  FSelectMediaDialog.AddSelectedMedia(AFilePath,
                                      AFilePath);

  FSelectMediaDialog.CallOnSelectMediaResult;

//  if Assigned(FSelectMediaDialog.OnSelectMediaResult) then
//  begin
//    FSelectMediaDialog.OnSelectMediaResult(FSelectMediaDialog,
//                                          FSelectMediaDialog.FSelectedThumbFilePaths,
//                                          FSelectMediaDialog.FSelectedFilePaths);
//  end;

end;

initialization
  GlobalSelectMediaUIClass:=TCommonSelectMediaUI;

end.
