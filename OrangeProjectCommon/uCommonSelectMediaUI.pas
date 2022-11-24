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
    //从多选图片返回
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
      //照片返回
      //尺寸如果超过1024,那么需要按比例缩小
//      if GAllImageFrame.FSelectedOriginPhotoList[I].Width > 1024 then
//      begin
//          ABitmap:=TBitmap.Create;
//          ScaleFactor := GAllImageFrame.FSelectedOriginPhotoList[I].Width / 1024;
////          GAllImageFrame.FSelectedOriginPhotoList[I].Resize(Round(GAllImageFrame.FSelectedOriginPhotoList[I].Width / ScaleFactor), Round(GAllImageFrame.FSelectedOriginPhotoList[I].Height / ScaleFactor));
//          //避免花掉
//          CopyBitmap(GAllImageFrame.FSelectedOriginPhotoList[I],ABitmap);
//          ABitmap.Resize(Round(ABitmap.Width / ScaleFactor),
//                        Round(ABitmap.Height / ScaleFactor));
//      end
//      else
//      begin



          //默认发原图
          APhoto:=GAllImageFrame.FSelectedOriginPhotoList[I];

          if APhoto.OriginFilePath<>'' then
          begin
              //有图片路径的,Windows,Android
//              FSelectMediaDialog.FSelectedThumbFilePaths.Add(APhoto.ThumbFilePath);
//              FSelectMediaDialog.FSelectedFilePaths.Add(APhoto.OriginFilePath);

              FSelectMediaDialog.AddSelectedMedia(APhoto.ThumbFilePath,
                                                  APhoto.OriginFilePath,
                                                  APhoto.IsVideo,
                                                  320,
                                                  480,
                                                  //15秒
                                                  15);
          end
          else
          begin
              //没有图片路径的,IOS
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
//      //添加一张图片
//      AListViewItem:=Self.lvPictures.Prop.Items.Insert(Self.lvPictures.Prop.Items.Count-1);
//      //要放在Icon.Assign前面
//      AListViewItem.Icon.Url:='';
//      AListViewItem.Icon.Assign(ABitmap);
//      //避免花掉
//      CopyBitmap(ABitmap,AListViewItem.Icon);




//      //照片返回
//      APictureName:=GlobalClient.Upload.NewFileId;
//      AFileName:=GlobalClient.CurrentUser.GetUserPath_ChatFiles+PathDelim+APictureName+'.png';
////      AThumbFileName:=GlobalClient.CurrentUser.GetUserPath_ChatFiles+PathDelim+APictureName+'.thumb.png';
//
//      ABitmapCodecSaveParams.Quality:=70;
//      GAllImageFrame.FSelectedOriginPhotoList[I].SaveToFile(AFileName,@ABitmapCodecSaveParams);
//
//
//
//      //生成消息内容结构
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


  //释放下相册管理中的缩略图和原图所占用的内存
  GAllImageFrame.ClearAfterReturn;


end;

procedure TCommonSelectMediaUI.DoStartCamera;
begin
  HideFrame;
  //多选照片
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
  //多选照片
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
