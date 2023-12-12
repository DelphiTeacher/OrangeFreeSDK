//convert pas to utf8 by ¥
unit uPhotoManager.iOS;

interface

{$IFDEF IOS}

uses
  uPhotoManager,
  iOSapi.Photos.Manager,
  uBaseList,
  uDrawPicture,
  FMX.Graphics,
  System.Types,
  System.Classes,
  System.SysUtils,
  System.Math,
  iOSapi.CoreGraphics,
  iOSapi.UIKit,
  FMX.Helpers.iOS,
  FMX.Types;

type
  TPhotoSuccessRetrue = procedure(BitMap:TBitMap) of object;
  TIOSAlbumManager=class;


  TIOSPhoto=class(TPhoto)
  public
    PhotoCache:TAssetPhotoCache;
  public
    //加载缩略图,成功后调用OnGetPhotoThumbBitmap
    procedure LoadThumbBitmap;override;
    //加载原图,成功后调用OnGetPhotoOriginBitmap
    procedure LoadOriginBitmap;override;
  end;


  TIOSAlbum=class(TAlbum)
  public
    //相册标识Identifier
    AlbumIdentifier:String;
    Cache:TAssetCollectionCache;
  end;



  //相册管理类
  TIOSAlbumManager=class(TAlbumManager)
  public
    FPhotosManager:TiOSPhotosManager;
    procedure DoThumbBitMapResultHandler(Sender:TObject;APhotoCache:TAssetPhotoCache;AImage:UIImage);
    procedure DoOriginBitMapResultHandler(Sender:TObject;APhotoCache:TAssetPhotoCache;AImage:UIImage);

    procedure DoCollectionSuccess(Sender:TObject);
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    //获取相册列表
    procedure SyncAlbumList;override;
    //刷新相册中的图片列表
    procedure SyncPhotoList(AAlbum:TAlbum);override;
  end;


function UIImageToDrawPicture(AImage: UIImage):TDrawPicture;

{$ENDIF IOS}

implementation


{$IFDEF IOS}

function UIImageToDrawPicture(AImage: UIImage):TDrawPicture;
var
  ImageRef: CGImageRef;
  ADrawPicture: TDrawPicture;
  CtxRef: CGContextRef;
  ColorSpace: CGColorSpaceRef;
  Data: TBitmapData;
begin
  ImageRef := AImage.CGImage;
  if ImageRef <> nil then
  begin
    ADrawPicture := TDrawPicture.Create('','');
    ADrawPicture.SetSize(Round(AImage.size.width),Round(AImage.size.height));
    ColorSpace := CGColorSpaceCreateDeviceRGB;
    try
      if ADrawPicture.Map(TMapAccess.Write, Data) then
      try
        CtxRef := CGBitmapContextCreate(Data.Data, ADrawPicture.Width, ADrawPicture.Height, 8, Data.Pitch, ColorSpace,
          kCGImageAlphaPremultipliedLast or kCGBitmapByteOrder32Big);
        try
          CGContextDrawImage(CtxRef, CGRectMake(0, 0, ADrawPicture.Width, ADrawPicture.Height), ImageRef);
        finally
          CGContextRelease(CtxRef);
        end;
      finally
        ADrawPicture.Unmap(Data);
      end;
    finally
      CGColorSpaceRelease(ColorSpace);
    end;

    Result := ADrawPicture;
  end
  else
    Result := nil;
end;

{ TIOSAlbumManager }

constructor TIOSAlbumManager.Create;
begin
  Inherited;
  FPhotosManager:=TiOSPhotosManager.Create(TSize.Create(ThumbnailWidth,ThumbnailHeight));
  FPhotosManager.OnCollectionSuccess:=Self.DoCollectionSuccess;
  FPhotosManager.FOnThumbBitMapResultHandler:=Self.DoThumbBitMapResultHandler;
  FPhotosManager.FOnOriginBitMapResultHandler:=Self.DoOriginBitMapResultHandler;
end;

destructor TIOSAlbumManager.Destroy;
begin
  FreeAndNil(FPhotosManager);
  Inherited;
end;

procedure TIOSAlbumManager.DoCollectionSuccess(Sender:TObject);
var
  I:Integer;
  J: Integer;
  Collection:TAssetCollectionCache;
  AAlbum:TIOSAlbum;
  APhoto:TIOSPhoto;
begin
  //添加相册列表
  Collection:=nil;
  AlbumList.Clear;
  AllPhotoList.Clear();

  for I := 0 to FPhotosManager.CollectionCacheList.Count-1 do
  begin
    Collection:=FPhotosManager.CollectionCacheList[I];
    //空相册不显示
    if Collection.PhotoCount>0 then
    begin
      AAlbum:=TIOSAlbum.Create;
      AAlbum.Name:=Collection.Title;
      AAlbum.PhotoCount:=Collection.PhotoCount;


      //给Cache赋值
      AAlbum.Cache:=Collection;

      AlbumList.Add(AAlbum);


      //添加相册的照片列表
//      for J := 0 to Collection.FPhotosCacheList.Count-1 do
      //IOS下面默认倒序
      for J := Collection.FPhotosCacheList.Count-1 downto 0 do
      begin
        APhoto:=TIOSPhoto.Create(AAlbum);
        APhoto.PhotoCache:=Collection.PhotosCacheList[J];
        Collection.PhotosCacheList[J].FPhoto:=APhoto;

        APhoto.Name:=IntToStr(J);
        AAlbum.PhotoList.Add(APhoto);


        Self.AllPhotoList.Add(APhoto)
      end;
    end;

  end;


  TThread.Synchronize(nil,procedure
  begin
    if Assigned(OnGetAlbumList)then
    begin
      OnGetAlbumList(Self);
    end;
  end);


end;

procedure TIOSAlbumManager.DoOriginBitMapResultHandler(Sender:TObject;APhotoCache:TAssetPhotoCache;AImage:UIImage);
var
  APhoto:TPhoto;
begin
  if AImage<>nil then
  begin
    APhoto:=TPhoto(APhotoCache.FPhoto);

    try
        APhoto.OriginBitmap:=UIImageToDrawPicture(AImage);

        APhoto.IsLoadingOriginBitmap:=False;
        APhoto.IsLoadedOriginBitmap:=True;

        if Assigned(Self.OnGetPhotoOriginBitmap) then
        begin
          Self.OnGetPhotoOriginBitmap(Self,APhoto);
        end;
    except
      on E:Exception do
      begin
        FMX.Types.Log.d('OrangeUI TIOSAlbumManager.DoOriginBitMapResultHandler');
      end;
    end;

  end;
end;

procedure TIOSAlbumManager.DoThumbBitMapResultHandler(Sender:TObject;APhotoCache:TAssetPhotoCache;AImage:UIImage);
var
  APhoto:TPhoto;
begin
  if AImage<>nil then
  begin
    APhoto:=TPhoto(APhotoCache.FPhoto);
    try

        APhoto.ThumbBitmap:=UIImageToDrawPicture(AImage);

        APhoto.IsLoadingThumbBitmap:=False;
        APhoto.IsLoadedThumbBitmap:=True;

        if Assigned(Self.OnGetPhotoThumbBitmap) then
        begin
          Self.OnGetPhotoThumbBitmap(Self,APhoto);
        end;

    except
      on E:Exception do
      begin
        FMX.Types.Log.d('OrangeUI TIOSAlbumManager.DoThumbBitMapResultHandler');
      end;
    end;

  end;
end;

procedure TIOSAlbumManager.SyncAlbumList;
begin
  FPhotosManager.Init;
  DoCollectionSuccess(Self);
end;

procedure TIOSAlbumManager.SyncPhotoList(AAlbum: TAlbum);
begin
  if Assigned(OnGetAlbumPhotoList) then
  begin
    OnGetAlbumPhotoList(Self,AAlbum);
  end;
end;



{ TIOSPhoto }

procedure TIOSPhoto.LoadOriginBitmap;
begin
  if Not IsLoadingOriginBitmap
    and Not IsLoadedOriginBitmap then
  begin
    FMX.Types.Log.d('OrangeUI TIOSPhoto.LoadOriginBitmap');

    IsLoadingOriginBitmap:=True;
    IsLoadedOriginBitmap:=False;

    Self.PhotoCache.GetOriginBimap;
  end;
end;

procedure TIOSPhoto.LoadThumbBitmap;
begin
  if Not IsLoadingThumbBitmap
    and Not IsLoadedThumbBitmap then
  begin
    FMX.Types.Log.d('OrangeUI TIOSPhoto.LoadThumbBitmap');

    IsLoadingThumbBitmap:=True;
    IsLoadedThumbBitmap:=False;

    Self.PhotoCache.GetThumbBitmap;
  end;
end;

{$ENDIF IOS}

end.
