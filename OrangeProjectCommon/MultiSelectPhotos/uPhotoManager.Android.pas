//convert pas to utf8 by ¥
unit uPhotoManager.Android;

interface

  {$IFDEF ANDROID}
uses
  uPhotoManager,
  uBaseList,
  uDrawPicture,
  uSkinBufferBitmap,
  System.IOUtils,

  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,
  Androidapi.JNI.Provider,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Embarcadero,
  System.Generics.Collections,

  Androidapi.JNI.Os,
  {$IF RTLVersion>=33}//10.3+
  System.Permissions, //动态权限单元
  {$ENDIF}
  uAndroidPermission_D10_2,

  FMX.Types,
  FMX.Graphics,
  Classes,
  SysUtils;


type
  TAndroidPhoto=class(TPhoto)
  public
    //图片唯一标识
    ImageID:String;  
    //相册ID
    BucketID:String;
  public
    //加载缩略图,成功后调用OnGetPhotoThumbBitmap
    procedure LoadThumbBitmap;override;
    //加载原图,成功后调用OnGetPhotoOriginBitmap
    procedure LoadOriginBitmap;override;
  end;

  TAndroidAlbum=class(TAlbum)
  public
    //相册ID
    BucketID:String;
  end;


  TAndroidAlbumManager=class;

  TImagesMediaChangesListener = class(TJavaLocal, JOnAddressBookChangesListener)
  private
    [Weak] FAndroidAlbumManager: TAndroidAlbumManager;
  public
    { JOnAddressBookChangesListener }
    constructor Create(const AAndroidAlbumManager: TAndroidAlbumManager);
    procedure onChanged(selfChange: Boolean); cdecl;
  end;


  TAndroidAlbumManager=class(TAlbumManager)
  private
    FIsChanged:Boolean;
    FObserver: JAddressBookObserver;
    FListener: TImagesMediaChangesListener;

    procedure DoSyncAlbumList;
    //获取指定相册
    function FindAlbumByBucketID(AAlbumList:TAlbumList;ABucketID:String):TAndroidAlbum;
    //获取指定图片
    function FindPhotoByID(APhotoList:TPhotoList;AImagID:String):TAndroidPhoto;
  public
    //提供的接口//
    //刷新相册列表,这个会不会很耗时,要不要放在线程中调用
    procedure SyncAlbumList;override;
    //刷新相册中的图片列表
    procedure SyncPhotoList(AAlbum:TAlbum);override;

    destructor Destroy;override;
  end;

  {$ENDIF}



implementation




{$IFDEF ANDROID}

{ TAndroidAlbumManager }

destructor TAndroidAlbumManager.Destroy;
begin
  TAndroidHelper.ContentResolver.unregisterContentObserver(FObserver);
  FListener.Free;

  inherited;
end;

function TAndroidAlbumManager.FindAlbumByBucketID(AAlbumList:TAlbumList;ABucketID: String): TAndroidAlbum;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to AAlbumList.Count-1 do
  begin
    if TAndroidAlbum(AAlbumList[I]).BucketID=ABucketID then
    begin
      Result:=TAndroidAlbum(AAlbumList[I]);
      Break;
    end;
  end;
end;

function TAndroidAlbumManager.FindPhotoByID(APhotoList: TPhotoList;
  AImagID: String): TAndroidPhoto;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to APhotoList.Count-1 do
  begin
    if TAndroidPhoto(APhotoList[I]).ImageID=AImagID then
    begin
      Result:=TAndroidPhoto(APhotoList[I]);
      Break;
    end;
  end;
end;

function PhotoListSortCompare(Item1, Item2: Pointer): Integer;
var
  AAndroidPhoto1:TAndroidPhoto;
  AAndroidPhoto2:TAndroidPhoto;
  ACreateTime1:TDateTime;
  ACreateTime2:TDateTime;
begin
  AAndroidPhoto1:=TAndroidPhoto(Item1);
  AAndroidPhoto2:=TAndroidPhoto(Item2);

  //最新的显示在最前
  //最新的显示在最前
  ACreateTime1:=TFile.GetCreationTime(AAndroidPhoto1.OriginFilePath);
  ACreateTime2:=TFile.GetCreationTime(AAndroidPhoto2.OriginFilePath);
  if ACreateTime1<ACreateTime2 then
  begin
    Result:=1;
  end
  else if ACreateTime1=ACreateTime2 then
  begin
    Result:=0;
  end
  else
  begin
    Result:=-1;
  end;
end;



{$IFDEF ANDROID}

procedure TAndroidAlbumManager.SyncAlbumList;
begin
  //动态申请权限,Const_Android_RequestPermissions在uConst中定义
  //10.2 WILL CRASH
  DoSyncAlbumList;

end;

procedure TAndroidAlbumManager.DoSyncAlbumList;
var
  ACursor:JCursor;
  I: Integer;
  AAndroidPhoto:TAndroidPhoto;

  photoIDIndex:Integer;
  photoPathIndex:Integer;
  bucketDisplayNameIndex:Integer;
  bucketIdIndex:Integer;
  photoThumbPathIndex:Integer;

  ABucketID:String;
  AAlbum:TAndroidAlbum;
begin


  if FObserver=nil then
  begin
    FIsChanged:=True;
    FListener := TImagesMediaChangesListener.Create(Self);
    FObserver := TJAddressBookObserver.JavaClass.init(FListener);

    TAndroidHelper.ContentResolver.registerContentObserver(TJImages_Media.JavaClass.EXTERNAL_CONTENT_URI, True, FObserver);
  end;


  if FIsChanged then
  begin
      FIsChanged:=False;



      //所有相册列表
      Self.AlbumList.Clear();
      //所有图片列表
      Self.AllPhotoList.Clear();
  



      //先一次性全部获取ImageID和原图路径,再获取缩略图
      ACursor:=TAndroidHelper.Context.getContentResolver.query(
                                TJImages_Media.JavaClass.EXTERNAL_CONTENT_URI,
                                nil,
                                nil,
                                nil,
                                nil,
                                nil);

      try

          //获取数据对应的列下标
          //唯一ID
          photoIDIndex:=ACursor.getColumnIndex(TJBaseColumns.JavaClass._ID);
          //文件路径
          photoPathIndex:=ACursor.getColumnIndex(TJMediaStore_MediaColumns.JavaClass.DATA);
          //相册ID
          bucketIdIndex:=ACursor.getColumnIndex(TJImages_ImageColumns.JavaClass.BUCKET_ID);
          //相册名称
          bucketDisplayNameIndex:=ACursor.getColumnIndex(TJImages_ImageColumns.JavaClass.BUCKET_DISPLAY_NAME);



          while ACursor.moveToNext do
          begin

    //        FMX.Types.Log.d('OrangeUI ');
    //        FMX.Types.Log.d('OrangeUI _ID '+JStringToString(ACursor.getString(photoIDIndex)));
    //        FMX.Types.Log.d('OrangeUI BUCKET_ID '+JStringToString(ACursor.getString(bucketIdIndex)));
    //        FMX.Types.Log.d('OrangeUI DATA '+JStringToString(ACursor.getString(photoPathIndex)));
    //        FMX.Types.Log.d('OrangeUI DISPLAY_NAME '+JStringToString(ACursor.getString(photoNameIndex)));
    //        FMX.Types.Log.d('OrangeUI SIZE '+IntToStr(ACursor.getLong(sizeIndex)));
    //        FMX.Types.Log.d('OrangeUI BUCKET_DISPLAY_NAME '+JStringToString(ACursor.getString(bucketDisplayNameIndex)));

            if not FileExists(JStringToString(ACursor.getString(photoPathIndex))) then
            begin
              //如果原图不存在,则不显示
              Continue;
            end;

            ABucketID:='';
            if bucketIdIndex<>-1 then
            begin
              ABucketID:=JStringToString(ACursor.getString(bucketIdIndex));
            end;


            //判断相册在不在,不在的话创建一个相册对象
            AAlbum:=FindAlbumByBucketID(AlbumList,ABucketID);
            if AAlbum=nil then
            begin
                AAlbum:=TAndroidAlbum.Create;
                AlbumList.Add(AAlbum);

                //不存在,则添加
                //相册ID
                AAlbum.BucketID:=ABucketID;
                //相册名称
                if bucketDisplayNameIndex<>-1 then
                begin
                  AAlbum.Name:=JStringToString(ACursor.getString(bucketDisplayNameIndex));
                end;
            end;


            //创建一张图片
            AAndroidPhoto:=TAndroidPhoto.Create(AAlbum);
            AAndroidPhoto.ImageID:=JStringToString(ACursor.getString(photoIDIndex));
            //原图路径
            AAndroidPhoto.OriginFilePath:=JStringToString(ACursor.getString(photoPathIndex));
            if bucketIdIndex<>-1 then
            begin
              AAndroidPhoto.BucketID:=ABucketID;
            end;
            //取文件名
            AAndroidPhoto.Name:=ExtractFileName(AAndroidPhoto.OriginFilePath);


            AllPhotoList.Add(AAndroidPhoto);


            AAlbum.PhotoList.Add(AAndroidPhoto);


          end;
      finally
        ACursor.close;
      end;




      //再一次性获取图片的缩略图
      ACursor:=TAndroidHelper.Context.getContentResolver.query(
                                          TJImages_Thumbnails.JavaClass.EXTERNAL_CONTENT_URI,
                                          nil,
                                          nil,
                                          nil,nil,nil);
      try
        //图片ID
        photoIDIndex:=ACursor.getColumnIndex(TJImages_Thumbnails.JavaClass.IMAGE_ID);
        photoThumbPathIndex:=ACursor.getColumnIndex(TJImages_Thumbnails.JavaClass.DATA);

        while ACursor.moveToNext do
        begin

    //        FMX.Types.Log.d('OrangeUI ');
    //        FMX.Types.Log.d('OrangeUI _ID '+JStringToString(ACursor.getString(photoIDIndex)));
    //        FMX.Types.Log.d('OrangeUI THUMB DATA '+JStringToString(ACursor.getString(photoThumbPathIndex)));

            AAndroidPhoto:=Self.FindPhotoByID(AllPhotoList,JStringToString(ACursor.getString(photoIDIndex)));
            if AAndroidPhoto<>nil then
            begin
              AAndroidPhoto.ThumbFilePath:=JStringToString(ACursor.getString(photoThumbPathIndex));
            end;

        end;
      finally
        ACursor.close;
      end;

  end;




  //按时间排序
  for I := 0 to AlbumList.Count-1 do
  begin
    AlbumList[I].PhotoList.Sort(PhotoListSortCompare);
  end;


  //获取到了所有相册
  TThread.Synchronize(nil,procedure
  begin
    if Assigned(OnGetAlbumList) then
    begin
      OnGetAlbumList(Self);
    end;
  end);

end;
{$ENDIF}

procedure TAndroidAlbumManager.SyncPhotoList(AAlbum: TAlbum);
begin

  if Assigned(OnGetAlbumPhotoList) then
  begin
    OnGetAlbumPhotoList(Self,AAlbum);
  end;

end;

{ TAndroidPhoto }

procedure TAndroidPhoto.LoadOriginBitmap;
begin
  FMX.Types.Log.d('OrangeUI TAndroidPhoto.LoadOriginBitmap ImageID '+ImageID);
  
  
  if Not IsLoadingOriginBitmap
    and Not IsLoadedOriginBitmap then
  begin
  
    IsLoadingOriginBitmap:=True;
    IsLoadedOriginBitmap:=False;
    try

      if FileExists(Self.OriginFilePath) then
      begin 
        OriginBitmap:=TDrawPicture.Create('','');
        OriginBitmap.LoadFromFile(OriginFilePath);
      end;
    
    finally
      IsLoadingOriginBitmap:=False;
      IsLoadedOriginBitmap:=True;

      if Assigned(GetGlobalAlbumManager.OnGetPhotoOriginBitmap) then
      begin
        GetGlobalAlbumManager.OnGetPhotoOriginBitmap(Self,Self);
      end;

    end;
  
  end;
  
end;

procedure TAndroidPhoto.LoadThumbBitmap;
var
  tmpOriginBitmap:TBitmap;
  AIsNeedLoadOriginBitmap:Boolean;
begin
  FMX.Types.Log.d('OrangeUI TAndroidPhoto.LoadThumbBitmap ImageID '+ImageID);
  
  if Not IsLoadingThumbBitmap
    and Not IsLoadedThumbBitmap then
  begin
  
    IsLoadingThumbBitmap:=True;
    IsLoadedThumbBitmap:=False;
    try

        AIsNeedLoadOriginBitmap:=True;
        if FileExists(Self.ThumbFilePath) then
        begin

              FMX.Types.Log.d('OrangeUI TAndroidPhoto.LoadThumbBitmap 缩略图已经存在');
              ThumbBitmap:=TDrawPicture.Create('','');
              try
                  ThumbBitmap.LoadFromFile(ThumbFilePath);
                  //不再需要从原图获取
                  AIsNeedLoadOriginBitmap:=False;
                  FMX.Types.Log.d('OrangeUI TAndroidPhoto.LoadThumbBitmap 缩略图尺寸'+IntToStr(ThumbBitmap.Width)+','+IntToStr(ThumbBitmap.Height));
              except
                on E:Exception do
                begin
                  FMX.Types.Log.d('OrangeUI TAndroidPhoto.LoadThumbBitmap 缩略图已经存在'+E.Message);
                end;
              end;

        end;



        if AIsNeedLoadOriginBitmap then
        begin

            //缩络图不存在
            //那么根据原图生成缩略图
            if FileExists(Self.OriginFilePath) then
            begin
              tmpOriginBitmap:=TBitmap.Create;
              try

                  try
                      //有时候加载不了会报错
                      tmpOriginBitmap.LoadFromFile(Self.OriginFilePath);
                      //会花屏
                      ThumbBitmap:=TDrawPicture.Create('','');
  //                    CreateThumbBitmap(tmpOriginBitmap,ThumbBitmap,300,300);

                      TThread.Synchronize(nil,procedure
                      begin
                      CreateThumbBitmap(tmpOriginBitmap,ThumbBitmap,ThumbnailWidth,ThumbnailHeight);
                      end);
                  except
                      on E:Exception do
                      begin
                        FMX.Types.Log.d('OrangeUI TAndroidPhoto.LoadThumbBitmap 创建缩略图'+E.Message);
                      end;
                  end;

              finally
                FreeAndNil(tmpOriginBitmap);
              end;
            end;

        end;
    
    finally
        IsLoadingThumbBitmap:=False;
        IsLoadedThumbBitmap:=True;

        if Assigned(GetGlobalAlbumManager.OnGetPhotoThumbBitmap) then
        begin
          GetGlobalAlbumManager.OnGetPhotoThumbBitmap(Self,Self);
        end;

    end;
  
  end;
  
end;


{ TImagesMediaChangesListener }

constructor TImagesMediaChangesListener.Create(const AAndroidAlbumManager: TAndroidAlbumManager);
begin
  Inherited Create;

  FAndroidAlbumManager:=AAndroidAlbumManager;
end;

procedure TImagesMediaChangesListener.onChanged(selfChange: Boolean);
begin
  //
  FMX.Types.Log.d('OrangeUI TImagesMediaChangesListener.onChanged');
  FAndroidAlbumManager.FIsChanged:=True;

end;

    {$ENDIF}



end.
