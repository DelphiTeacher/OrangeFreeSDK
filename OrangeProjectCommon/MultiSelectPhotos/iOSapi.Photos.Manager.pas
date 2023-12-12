//convert pas to utf8 by ¥
unit iOSapi.Photos.Manager;
// iOS 相册 缓存 单元
// 缓存 用户相册目录 与 最近展示的照片

interface


{$IFDEF IOS}

uses
  System.Classes,
  FMX.Graphics,
  iOSapi.Photos,
  Macapi.Helpers,
  Macapi.ObjectiveC,
  FMX.Types,
  iOSapi.Foundation,
  iOSapi.CoreGraphics,
  iOSapi.UIKit,
  FMX.Helpers.iOS,
  System.Types,
  System.SysUtils,
  System.Generics.Collections,
  System.Math;


type
  TiOSPhotosManager=class;
  TAssetPhotoCache=class;

  TOnBitmapResultHandler=procedure(Sender:TObject;APhotoCache:TAssetPhotoCache;AImage:UIImage) of Object;


  //iOS照片资源类
  TAssetPhotoCache = class
  private
    //需要调用它的事件
    FManager:TiOSPhotosManager;

    //IOS的资源类
    FAsset: PHAsset;
  private
    //图片回调,最终传递给FManager的事件,把照片加载到TPhoto
    procedure DoThumbBitmapResultHandler(param1: UIImage; param2: NSDictionary);
    procedure DoOriginBitmapResultHandler(param1: NSData; param2: NSString; param3: UIImageOrientation; param4: NSDictionary);
  public
    constructor Create(Asset: PHAsset;AManager:TiOSPhotosManager);
    destructor Destroy; override;
  public
    //回调事件中需要使用
    FPhoto:TObject;
    //获取缩略图
    procedure GetThumbBitmap;
    //获取高清图
    procedure GetOriginBimap;
  end;






  //iOS相册资源类
  TAssetCollectionCache = class
  public
    //名称
    FTitle: string;
    //照片数量
    FPhotoCount: Integer;
    //照片列表
    FPhotosCacheList: TObjectList<TAssetPhotoCache>;

    FPHAssetCollectionSubtype:PHAssetCollectionSubtype;

    FManager:TiOSPhotosManager;


    procedure DoClearPhotos;
    //照片列表
    property PhotosCacheList: TObjectList<TAssetPhotoCache> read FPhotosCacheList;

  public
    constructor Create(AManager:TiOSPhotosManager);
    destructor Destroy; override;
  public
    //获取相册信息和照片列表
    procedure Init(Collection: PHAssetCollection);
    //相册标题
    property Title: string read FTitle;
    //照片数量
    property PhotoCount:Integer read FPhotoCount;
  end;




  //iOS 照片管理类
  //用于管理相册
  //最近展示相册照片
  TiOSPhotosManager = class
  private

    //相册个数
    FCollectionCount:Integer;
    //相册列表
    FCollectionCacheList: TObjectList<TAssetCollectionCache>;
    //相册回调
    FOnCollectionSuccess: TNotifyEvent;

    //清除相册列表
    procedure DoClearCollections;
    //获取相册列表
    procedure DoGetCollections;
    //权限回调
    procedure CollectionsAuthHandler(param1: PHAuthorizationStatus);
    //获取相册列表
    procedure DoGetCollectionsSuccess;
  public
    constructor Create(ThumbnailSize:TSize);
    destructor Destroy; override;
  public
    //获取缩略图返回.给TIOSPhoto赋值时赋,用于加载ThumbBitmap
    FOnThumbBitmapResultHandler: TOnBitmapResultHandler;
    //获取原图返回.给TIOSPhoto赋值时赋,用于加载OriginBitmap
    FOnOriginBitmapResultHandler: TOnBitmapResultHandler;

    procedure Init;
    //获取相册列表返回
    property OnCollectionSuccess: TNotifyEvent read FOnCollectionSuccess write FOnCollectionSuccess;
    //相册列表
    property CollectionCacheList: TObjectList<TAssetCollectionCache> read FCollectionCacheList;
  end;
  {$ENDIF IOS}





implementation


{$IFDEF IOS}

var
  ThumbnailPhotoSize: TSize; //图片 大小


{ TAssetCollectionCache }

constructor TAssetCollectionCache.Create(AManager:TiOSPhotosManager);
begin
  FManager:=AManager;
  FPhotosCacheList := TObjectList<TAssetPhotoCache>.Create;
end;

destructor TAssetCollectionCache.Destroy;
begin
  DoClearPhotos;
  FPhotosCacheList.Free;
  inherited;
end;

procedure TAssetCollectionCache.Init(Collection: PHAssetCollection);
var
  I: Integer;
  Ret: PHFetchResult;
  Asset: PHAsset;
  AssetPhoto:TAssetPhotoCache;
begin
  FTitle := NSStrToStr(Collection.localizedTitle);

  DoClearPhotos;
  FPhotoCount:=0;

  //获取图片列表
  Ret := TPHAsset.OCClass.fetchAssetsInAssetCollection(Collection, nil);
  FPhotoCount := Ret.count;
  for I := 0 to Ret.count-1 do
  begin
    Asset := TPHAsset.Wrap(Ret.objectAtIndex(I));
    //创建照片
    AssetPhoto := TAssetPhotoCache.Create(Asset,FManager);
    FPhotosCacheList.Add(AssetPhoto);
  end;

end;

procedure TAssetCollectionCache.DoClearPhotos;
var
  I:integer;
begin
  for I := 0 to FPhotosCacheList.count -1 do
  begin
    FPhotosCacheList[I].Free;
  end;
  FPhotosCacheList.Clear;
end;


{ TiOSPhotosManager }

procedure TiOSPhotosManager.DoGetCollections;
var
  I: Integer;
  Ret: PHFetchResult;
  Collection: PHAssetCollection;
  AssetCollection: TAssetCollectionCache;
begin
  FCollectionCacheList.Clear;
  FCollectionCount:=0;

  //获取相册列表
  Ret := TPHAssetCollection.OCClass.fetchAssetCollectionsWithType(
                      PHAssetCollectionTypeSmartAlbum,
                      PHAssetCollectionSubtypeAlbumRegular,
                      nil);
  //相册个数
  FCollectionCount := Ret.count;

  for I := 0 to Ret.count-1 do
  begin

    Collection := TPHAssetCollection.Wrap(Ret.objectAtIndex(I));

    //添加相册
    AssetCollection := TAssetCollectionCache.Create(Self);
    AssetCollection.FPHAssetCollectionSubtype:=Collection.assetCollectionSubtype;
    FCollectionCacheList.Add(AssetCollection);

//    //相机相册下标
//    if Collection.assetCollectionSubtype = PHAssetCollectionSubtypeSmartAlbumUserLibrary then
//    begin
//      FUserLibraryIndex:= FCollectionCacheList.Count;
//    end;

    //初始相册(获取名称、标识、照片列表)
    AssetCollection.Init(Collection);

  end;
  DoGetCollectionsSuccess;

end;

procedure TiOSPhotosManager.DoGetCollectionsSuccess;
begin
  if Assigned(FOnCollectionSuccess) then
  begin
    FOnCollectionSuccess(Self);
  end;
end;

constructor TiOSPhotosManager.Create(ThumbnailSize:TSize);
begin
  ThumbnailPhotoSize := ThumbnailSize;
  FCollectionCacheList := TObjectList<TAssetCollectionCache>.Create;
end;

destructor TiOSPhotosManager.Destroy;
begin
  DoClearCollections;
  FCollectionCacheList.Free;
  inherited;
end;

procedure TiOSPhotosManager.DoClearCollections;
var
  I:integer;
begin
  for I := 0 to FCollectionCacheList.count -1 do
  begin
    FCollectionCacheList[I].Free;
  end;
  FCollectionCacheList.Clear;
end;

procedure TiOSPhotosManager.Init;
var
  Status: PHAuthorizationStatus;
begin
  Status := TPHPhotoLibrary.OCClass.authorizationStatus;
  case Status of
    PHAuthorizationStatusDenied, PHAuthorizationStatusRestricted:
      begin
        //没有权限 直接返回
        DoGetCollectionsSuccess;
      end;
    PHAuthorizationStatusNotDetermined:
      begin
        //询问权限
        TPHPhotoLibrary.OCClass.requestAuthorization(CollectionsAuthHandler);
      end;
    PHAuthorizationStatusAuthorized:
      begin
        //直接加载数据
        DoGetCollections;
      end;
  end;
end;

procedure TiOSPhotosManager.CollectionsAuthHandler(param1: PHAuthorizationStatus);
begin
  //同步
  TThread.Synchronize(nil,
    procedure
    begin
      try
        if param1 = PHAuthorizationStatusAuthorized then
        begin
          //授权了
          DoGetCollections;
        end
        else
        begin
          //没有授权
          DoGetCollectionsSuccess;
        end;
      except on e:Exception do
      end;
    end);
end;

{ TAssetPhotoCache }

constructor TAssetPhotoCache.Create(Asset: PHAsset;AManager:TiOSPhotosManager);
begin
  FManager:=AManager;

  FAsset := Asset;
  FAsset.retain;
end;

destructor TAssetPhotoCache.Destroy;
begin
  FAsset.release;
  inherited;
end;

procedure TAssetPhotoCache.DoOriginBitmapResultHandler(param1: NSData;
  param2: NSString; param3: UIImageOrientation; param4: NSDictionary);
var
  image: UIImage;
begin
  FMX.Types.Log.d('OrangeUI TAssetPhotoCache.DoOriginBitmapResultHandler');

  image := TUIImage.Wrap(TUIImage.OCClass.imageWithData(param1));
  if image <> nil then
  begin
    if FManager<>nil then
    begin
      if Assigned(FManager.FOnOriginBitmapResultHandler) then
      begin
        FManager.FOnOriginBitmapResultHandler(Self,Self,image);
      end;
    end;
  end;
end;

procedure TAssetPhotoCache.DoThumbBitmapResultHandler(param1: UIImage;param2: NSDictionary);
begin
  FMX.Types.Log.d('OrangeUI TAssetPhotoCache.DoThumbBitmapResultHandler');

  if FManager<>nil then
  begin
    if Assigned(FManager.FOnThumbBitmapResultHandler) then
    begin
      FManager.FOnThumbBitmapResultHandler(Self,Self,param1);
    end;
  end;
end;

procedure TAssetPhotoCache.GetThumbBitmap;
var
  Ret: PHFetchResult;
  Option: PHImageRequestOptions;
  size:CGSize;
begin
  //获取缩略图
  Option := TPHImageRequestOptions.Wrap(TPHImageRequestOptions.OCClass.alloc);
  Option.setResizeMode(PHImageRequestOptionsResizeModeFast);
  Option.setNetworkAccessAllowed(True);
  size.width := ThumbnailPhotoSize.cx;
  size.Height := ThumbnailPhotoSize.cy;
  TPHCachingImageManager.OCClass.defaultManager.requestImageForAsset(FAsset,
                            size,
                            PHImageContentModeAspectFill,
                            Option,
                            DoThumbBitmapResultHandler);

end;

procedure TAssetPhotoCache.GetOriginBimap;
begin
  //获取原图
  TPHCachingImageManager.OCClass.defaultManager.requestImageDataForAsset(FAsset,
                            nil,
                            DoOriginBitmapResultHandler);
end;


{$ENDIF IOS}

end.
