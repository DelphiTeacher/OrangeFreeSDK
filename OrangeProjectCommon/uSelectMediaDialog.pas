unit uSelectMediaDialog;

interface

uses
  Classes,
  uBaseList_Copy,
  SysUtils;


type
  TSelectMediaItem=class
    //缩略图
    ThumbPath:String;
    //原图
    FilePath:String;
    //是否是视频
    IsVideo:Boolean;
    //宽度
    Width:Integer;
    //高度
    Height:Integer;
    //视频时长
    TimeLong:Integer;
  end;
  TSelectMediaList=class(TBaseList)
  private
    function GetItem(Index: Integer): TSelectMediaItem;
  public
    property Items[Index:Integer]:TSelectMediaItem read GetItem;default;
  end;




  TSelectMediaResultEvent=procedure(Sender:TObject;
                                    //预览图
                                    ASelectedPhotoThumbPaths:TStringList;
                                    //图片原文件
                                    ASelectedPhotoFilePaths:TStringList;
                                    //选择的媒体列表
                                    ASelectMediaList:TSelectMediaList
                                    ) of object;

  TSelectMediaDialog=class;

  TBaseSelectMediaUI=class
  public
    FSelectMediaDialog:TSelectMediaDialog;
  public
    constructor Create(ASelectMediaDialog:TSelectMediaDialog);virtual;
//    destructor Destroy;override;
  public
    procedure DoStartSelect;virtual;abstract;
    procedure DoStartCamera;virtual;abstract;
  end;
  TSelectMediaUIClass=class of TBaseSelectMediaUI;






  TSelectMediaType=(smtImage,
                    smtImageVideo,
                    smtVideo);
  TSelectMediaDialog=class(TComponent)
  private
    FOnSelectMediaResult: TSelectMediaResultEvent;
    FBaseSelectMediaUI:TBaseSelectMediaUI;
    FMaxSelectCount: Integer;
    FSelectMediaType: TSelectMediaType;
    FMaxVideoDuration: Integer;
    FMaxVideoDurationCanEdit: Boolean;

    procedure CreateBaseSelectMediaUI;

  public
    procedure AddSelectedMedia(
                              //缩略图
                              AThumbPath:String;
                              //原图
                              AFilePath:String;
                              //是否是视频
                              AIsVideo:Boolean=False;
                              //宽度
                              AWidth:Integer=0;
                              //高度
                              AHeight:Integer=0;
                              //视频时长
                              ATimeLong:Integer=0);
    procedure CallOnSelectMediaResult;
  public
    FSelectedThumbFilePaths:TStringList;
    FSelectedFilePaths:TStringList;
    FSelectMediaList:TSelectMediaList;

    //开始选择
    procedure StartSelect;
    //开始拍摄
    procedure StartCamera;

  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  published
    //最大视频时长,小于等于0则不限制
    property MaxVideoDuration:Integer read FMaxVideoDuration write FMaxVideoDuration;
    //视频时长是否可编译
    property MaxVideoDurationCanEdit:Boolean read FMaxVideoDurationCanEdit write FMaxVideoDurationCanEdit;
//    property MaxVideoFileSize:Integer read FMaxVideoFileSize write FMaxVideoFileSize;

    //最大选择个数
    property MaxSelectCount:Integer read FMaxSelectCount write FMaxSelectCount;
    //选择媒体类型
    property SelectMediaType:TSelectMediaType read FSelectMediaType write FSelectMediaType;
    //选择返回事件
    property OnSelectMediaResult:TSelectMediaResultEvent read FOnSelectMediaResult write FOnSelectMediaResult;
  end;
  TSelectMediaDialogClass=class of TSelectMediaDialog;







var
  GlobalSelectMediaUIClass:TSelectMediaUIClass;

implementation

{$IFDEF USE_NATIVE_SELECTMEDIA}
//  {$IFDEF ANDROID}
//  uses
//    uAndroidDmcBigSelectMedia;
//  {$ENDIF}
  {$IFDEF IOS}
  uses
    uIOSHXPhotoPickerSelectMediaUI;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  {$ENDIF}
{$ENDIF}


{ TSelectMediaDialog }

procedure TSelectMediaDialog.CallOnSelectMediaResult;
begin
  if Assigned(Self.OnSelectMediaResult) then
  begin
    Self.OnSelectMediaResult(Self,
                            Self.FSelectedThumbFilePaths,
                            Self.FSelectedFilePaths,
                            Self.FSelectMediaList
                            );
  end;
end;

constructor TSelectMediaDialog.Create(AOwner: TComponent);
begin
  inherited;
  FSelectedFilePaths:=TStringList.Create;
  FSelectedThumbFilePaths:=TStringList.Create;
  FSelectMediaList:=TSelectMediaList.Create();

  FMaxSelectCount:=9;
  FSelectMediaType:=smtImage;



end;

procedure TSelectMediaDialog.CreateBaseSelectMediaUI;
begin
  if FBaseSelectMediaUI=nil then
  begin

      {$IFDEF USE_NATIVE_SELECTMEDIA}
    //    {$IFDEF ANDROID}
    //    GlobalSelectMediaUIClass:=TAndroidDmcBigSelectMediaUI;
    //    {$ENDIF}
        {$IFDEF IOS}
        GlobalSelectMediaUIClass:=TIOSHXPhotoPickerSelectMediaUI;
        {$ENDIF}
        {$IFDEF MSWINDOWS}
        {$ENDIF}
      {$ELSE}
      {$ENDIF}
      if GlobalSelectMediaUIClass=nil then
      begin
        raise Exception.Create('GlobalSelectMediaUIClass Can Not Be Nil,Please Use uCommonSelectMediaUI.pas');
      end;
      FBaseSelectMediaUI:=GlobalSelectMediaUIClass.Create(Self);

  end;

end;

destructor TSelectMediaDialog.Destroy;
begin

  FreeAndNil(FBaseSelectMediaUI);
  FreeAndNil(FSelectedFilePaths);
  FreeAndNil(FSelectedThumbFilePaths);
  FreeAndNil(FSelectMediaList);
  inherited;
end;

procedure TSelectMediaDialog.AddSelectedMedia(
                          //缩略图
                          AThumbPath:String;
                          //原图
                          AFilePath:String;
                          //是否是视频
                          AIsVideo:Boolean;
                          //宽度
                          AWidth:Integer;
                          //高度
                          AHeight:Integer;
                          //视频时长
                          ATimeLong:Integer);
var
  ASelectMediaItem:TSelectMediaItem;
begin
  Self.FSelectedThumbFilePaths.Add(AThumbPath);
  Self.FSelectedFilePaths.Add(AFilePath);

  ASelectMediaItem:=TSelectMediaItem.Create;
  //缩略图
  ASelectMediaItem.ThumbPath:=AThumbPath;
  //原图
  ASelectMediaItem.FilePath:=AFilePath;
  //是否是视频
  ASelectMediaItem.IsVideo:=AIsVideo;
  //宽度
  ASelectMediaItem.Width:=AWidth;
  //高度
  ASelectMediaItem.Height:=AHeight;
  //视频时长
  ASelectMediaItem.TimeLong:=ATimeLong;

  FSelectMediaList.Add(ASelectMediaItem);
end;

procedure TSelectMediaDialog.StartCamera;
begin
  CreateBaseSelectMediaUI;


  FSelectedFilePaths.Clear;
  FSelectedThumbFilePaths.Clear;
  FSelectMediaList.Clear;

  if FBaseSelectMediaUI<>nil then
  begin
    FBaseSelectMediaUI.DoStartCamera;
  end;

end;

procedure TSelectMediaDialog.StartSelect;
begin
  CreateBaseSelectMediaUI;

  FSelectedFilePaths.Clear;
  FSelectedThumbFilePaths.Clear;
  FSelectMediaList.Clear;

  if FBaseSelectMediaUI<>nil then
  begin
    FBaseSelectMediaUI.DoStartSelect;
  end;

end;

{ TBaseSelectMediaUI }

constructor TBaseSelectMediaUI.Create(ASelectMediaDialog:TSelectMediaDialog);
begin
  FSelectMediaDialog:=ASelectMediaDialog;

end;

{ TSelectMediaList }

function TSelectMediaList.GetItem(Index: Integer): TSelectMediaItem;
begin
  Result:=TSelectMediaItem(Inherited Items[Index]);
end;

end.
