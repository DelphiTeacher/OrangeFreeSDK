unit uSelectMediaDialog;

interface

uses
  Classes,
  uBaseList_Copy,
  SysUtils;


type
  TSelectMediaItem=class
    //����ͼ
    ThumbPath:String;
    //ԭͼ
    FilePath:String;
    //�Ƿ�����Ƶ
    IsVideo:Boolean;
    //���
    Width:Integer;
    //�߶�
    Height:Integer;
    //��Ƶʱ��
    TimeLong:Integer;
  end;
  TSelectMediaList=class(TBaseList)
  private
    function GetItem(Index: Integer): TSelectMediaItem;
  public
    property Items[Index:Integer]:TSelectMediaItem read GetItem;default;
  end;




  TSelectMediaResultEvent=procedure(Sender:TObject;
                                    //Ԥ��ͼ
                                    ASelectedPhotoThumbPaths:TStringList;
                                    //ͼƬԭ�ļ�
                                    ASelectedPhotoFilePaths:TStringList;
                                    //ѡ���ý���б�
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
                              //����ͼ
                              AThumbPath:String;
                              //ԭͼ
                              AFilePath:String;
                              //�Ƿ�����Ƶ
                              AIsVideo:Boolean=False;
                              //���
                              AWidth:Integer=0;
                              //�߶�
                              AHeight:Integer=0;
                              //��Ƶʱ��
                              ATimeLong:Integer=0);
    procedure CallOnSelectMediaResult;
  public
    FSelectedThumbFilePaths:TStringList;
    FSelectedFilePaths:TStringList;
    FSelectMediaList:TSelectMediaList;

    //��ʼѡ��
    procedure StartSelect;
    //��ʼ����
    procedure StartCamera;

  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  published
    //�����Ƶʱ��,С�ڵ���0������
    property MaxVideoDuration:Integer read FMaxVideoDuration write FMaxVideoDuration;
    //��Ƶʱ���Ƿ�ɱ���
    property MaxVideoDurationCanEdit:Boolean read FMaxVideoDurationCanEdit write FMaxVideoDurationCanEdit;
//    property MaxVideoFileSize:Integer read FMaxVideoFileSize write FMaxVideoFileSize;

    //���ѡ�����
    property MaxSelectCount:Integer read FMaxSelectCount write FMaxSelectCount;
    //ѡ��ý������
    property SelectMediaType:TSelectMediaType read FSelectMediaType write FSelectMediaType;
    //ѡ�񷵻��¼�
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
                          //����ͼ
                          AThumbPath:String;
                          //ԭͼ
                          AFilePath:String;
                          //�Ƿ�����Ƶ
                          AIsVideo:Boolean;
                          //���
                          AWidth:Integer;
                          //�߶�
                          AHeight:Integer;
                          //��Ƶʱ��
                          ATimeLong:Integer);
var
  ASelectMediaItem:TSelectMediaItem;
begin
  Self.FSelectedThumbFilePaths.Add(AThumbPath);
  Self.FSelectedFilePaths.Add(AFilePath);

  ASelectMediaItem:=TSelectMediaItem.Create;
  //����ͼ
  ASelectMediaItem.ThumbPath:=AThumbPath;
  //ԭͼ
  ASelectMediaItem.FilePath:=AFilePath;
  //�Ƿ�����Ƶ
  ASelectMediaItem.IsVideo:=AIsVideo;
  //���
  ASelectMediaItem.Width:=AWidth;
  //�߶�
  ASelectMediaItem.Height:=AHeight;
  //��Ƶʱ��
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
