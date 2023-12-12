//convert pas to utf8 by ¥
unit uPhotoManager;

interface

{$I FrameWork.Inc}

uses
  Classes,
  SysUtils,
  uBaseList,

  {$IFDEF FMX}
  FMX.Types,
  FMX.Graphics,
  {$ENDIF}


//  System.IOUtils,
  uDrawPicture;




type
  TAlbum=class;

  //照片基类
  TPhoto=class
  public
    FAlbum:TAlbum;

    //文件名
    Name:String;

    //是否正在加载缩略图
    IsLoadingThumbBitmap:Boolean;
    IsLoadedThumbBitmap:Boolean;
    //是否正在加载原图
    IsLoadingOriginBitmap:Boolean;
    IsLoadedOriginBitmap:Boolean;

    //缩略图
    ThumbBitmap:TDrawPicture;
    //原图
    OriginBitmap:TDrawPicture;

    //缩略图路径
    ThumbFilePath:String;
    //原图路径
    OriginFilePath:String;

    IsVideo:Boolean;
  public
    constructor Create(AAlbum:TAlbum);virtual;
    destructor Destroy;override;
  public
    procedure ClearLoadedBitmap;

    //加载缩略图,成功后调用OnGetPhotoThumbBitmap
    procedure LoadThumbBitmap;Virtual;abstract;
    //加载原图,成功后调用OnGetPhotoOriginBitmap
    procedure LoadOriginBitmap;Virtual;abstract;
  end;

  TPhotoList=class(TBaseList)
  private
    function GetItem(Index: Integer): TPhoto;
  public
    property Items[Index:Integer]:TPhoto read GetItem;default;
  end;


  //相册基类
  TAlbum=class
  public
    //相册名称
    Name:String;
    //图片总数
    PhotoCount:Integer;
    //图片列表
    PhotoList:TPhotoList;
  public
    constructor Create;virtual;
    destructor Destroy;override;
  public
    //相册预览图片-第一张照片的缩略图
    function AlbumPhoto:TPhoto;
    function AlbumIcon:TDrawPicture;
  end;

  TAlbumList=class(TBaseList)
  private
    function GetItem(Index: Integer): TAlbum;
  public
    function FindItemByName(AName:String):TAlbum;
    property Items[Index:Integer]:TAlbum read GetItem;default;
  end;





  TOnGetAlbumPhotoList=procedure(Sender:TObject;AAlbum:TAlbum) of object;
  TOnGetAlbumPhoto=procedure(Sender:TObject;APhoto:TPhoto) of object;

  //相册管理类
  TAlbumManager=class
  protected
    FIsCanSelectVideo:Boolean;
    FIsCanSelectPhoto:Boolean;

    //提供的接口//
    //刷新相册列表
    procedure SyncAlbumList;virtual;abstract;
  public

    //相册列表
    AlbumList:TAlbumList;
    //所有图片列表
    AllPhotoList:TPhotoList;
  public
    procedure Clear;
    procedure ClearLoadedBitmap;
    constructor Create;virtual;
    destructor Destroy;override;
  public
    //获取到相册列表的回调事件
    OnGetAlbumList:TNotifyEvent;
    //获取到照片列表的回调事件
    OnGetAlbumPhotoList:TOnGetAlbumPhotoList;

    //获取到照片缩略图的回调事件
    OnGetPhotoThumbBitmap:TOnGetAlbumPhoto;
    //获取到照片原图的回调事件
    OnGetPhotoOriginBitmap:TOnGetAlbumPhoto;
  public
    //在线程中加载相册列表
    procedure SyncAlbumListInThread;
    //刷新相册中的图片列表(没什么用的,图片都在SyncAlbumList过程中加载好了)
    procedure SyncPhotoList(AAlbum:TAlbum);virtual;abstract;

    property IsCanSelectPhoto:Boolean read FIsCanSelectPhoto write FIsCanSelectPhoto;
    property IsCanSelectVideo:Boolean read FIsCanSelectVideo write FIsCanSelectVideo;
  end;



var
  ThumbnailWidth:Integer;
  ThumbnailHeight:Integer;


//获取相册管理
function GetGlobalAlbumManager:TAlbumManager;
function FreeGlobalAlbumManager:TAlbumManager;


implementation


uses
  {$IFDEF FMX}
  uPhotoManager.Android,
  uPhotoManager.iOS,
  {$ENDIF}
  uPhotoManager.Windows;

var
  GlobalAlbumManager:TAlbumManager;

function FreeGlobalAlbumManager:TAlbumManager;
begin
  FreeAndNil(GlobalAlbumManager);
end;

function GetGlobalAlbumManager:TAlbumManager;
begin
  Result:=nil;

//  FMX.Types.Log.d('OrangeUI GetGlobalAlbumManager Begin');


  {$IFDEF ANDROID}
  if GlobalAlbumManager=nil then
  begin
    GlobalAlbumManager:=TAndroidAlbumManager.Create;
  end;
  {$ENDIF}
  {$IFDEF IOS}
  if GlobalAlbumManager=nil then
  begin
    GlobalAlbumManager:=TIOSAlbumManager.Create;
  end;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  {$IFDEF FMX}
  if GlobalAlbumManager=nil then
  begin
    GlobalAlbumManager:=TWindowsAlbumManager.Create;
  end;
  {$ENDIF}
  {$ENDIF}
  Result:=GlobalAlbumManager;


//  FMX.Types.Log.d('OrangeUI GetGlobalAlbumManager End');
end;




{ TPhotoList }

function TPhotoList.GetItem(Index: Integer): TPhoto;
begin
  Result:=TPhoto(Inherited Items[Index]);
end;

{ TAlbum }

function TAlbum.AlbumIcon: TDrawPicture;
begin
  Result:=nil;
  if PhotoList.Count>0 then
  begin
    PhotoList[0].LoadThumbBitmap;
    Result:=PhotoList[0].ThumbBitmap;
  end;
end;

function TAlbum.AlbumPhoto: TPhoto;
begin
  Result:=nil;
  if PhotoList.Count>0 then
  begin
    Result:=PhotoList[0];
  end;
end;

constructor TAlbum.Create;
begin
  PhotoList:=TPhotoList.Create(ooReference);
end;

destructor TAlbum.Destroy;
begin
  PhotoList.Free;
  inherited;
end;

{ TPhoto }

procedure TPhoto.ClearLoadedBitmap;
begin
  //是否正在加载缩略图
  IsLoadingThumbBitmap:=False;
  IsLoadedThumbBitmap:=False;
  //是否正在加载原图
  IsLoadingOriginBitmap:=False;
  IsLoadedOriginBitmap:=False;

  //缩略图
  FreeAndNil(ThumbBitmap);
  //原图
  FreeAndNil(OriginBitmap);

end;

constructor TPhoto.Create(AAlbum:TAlbum);
begin
  FAlbum:=AAlbum;
end;

destructor TPhoto.Destroy;
begin
  //缩略图
  FreeAndNil(ThumbBitmap);
  //原图
  FreeAndNil(OriginBitmap);

  inherited;
end;



{ TAlbumList }

function TAlbumList.FindItemByName(AName: String): TAlbum;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if SameText(Items[I].Name,AName) then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TAlbumList.GetItem(Index: Integer): TAlbum;
begin
  Result:=TAlbum(Inherited Items[Index]);
end;

{ TAlbumManager }

procedure TAlbumManager.Clear;
begin
  AlbumList.Clear;
  AllPhotoList.Clear;
end;

procedure TAlbumManager.ClearLoadedBitmap;
var
  I: Integer;
begin
  for I := 0 to AllPhotoList.Count-1 do
  begin
    AllPhotoList[I].ClearLoadedBitmap;
  end;
end;

constructor TAlbumManager.Create;
begin
  AlbumList:=TAlbumList.Create;
  AllPhotoList:=TPhotoList.Create;


  FIsCanSelectPhoto:=True;

  FIsCanSelectVideo:=False;
  {$IFDEF MSWINDOWS}
  //Windows下面可以测试选择视频
  FIsCanSelectVideo:=True;
  {$ENDIF}

end;

destructor TAlbumManager.Destroy;
begin
  AllPhotoList.Free;
  AlbumList.Free;
  inherited;
end;

procedure TAlbumManager.SyncAlbumListInThread;
begin
  {$IFDEF FMX}
  TThread.CreateAnonymousThread(procedure
  begin
  {$ENDIF}
    SyncAlbumList;
  {$IFDEF FMX}
  end).Start;
  {$ENDIF}
end;

initialization
  ThumbnailWidth:=200;
  ThumbnailHeight:=200;



finalization
  FreeGlobalAlbumManager;

end.
