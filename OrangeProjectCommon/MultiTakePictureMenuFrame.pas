//convert pas to utf8 by ¥

unit MultiTakePictureMenuFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 


  uUIFunction,
  uVersion,
  uSkinItems,
  uBufferBitmap,

  uFuncCommon,
  uLang,
  uFrameContext,
  AllImageFrame,
  System.Generics.Collections,
  uDrawPicture,


  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
  uSkinFireMonkeyLabel, uSkinFireMonkeyImage, FMX.Controls.Presentation,
  uSkinAnimator, uSkinFireMonkeyScrollControl, uSkinFireMonkeyVirtualList,
  uSkinFireMonkeyListBox, FMX.MediaLibrary.Actions, System.Actions,
  FMX.ActnList, FMX.StdActns, uSkinFireMonkeyCustomList, uSkinButtonType,
  uSkinScrollControlType, uSkinCustomListType, uSkinVirtualListType,
  uSkinListBoxType, uBaseSkinControl, uSkinPanelType, uDrawCanvas;


type
  THideMenuType=(hmtNone,hmtHasPicture);
  TTakedPictureEvent=procedure(Sender:TObject;ASkinPictureList:TList<TDrawPicture>) of object;

  TFrameMultiTakePictureMenu = class(TFrame,
                                IFrameChangeLanguageEvent,
                                IFrameHistroyReturnEvent)
    pnlBackground: TSkinFMXPanel;
    pnlBottom: TSkinFMXPanel;
    lbMenu: TSkinFMXListBox;
    scmaPopup: TSkinControlMoveAnimator;
    ActionList: TActionList;
    ActionTakePhotoFromCamera: TTakePhotoFromCameraAction;
    btnUseInIPadSetPosition: TSkinFMXButton;
    procedure FrameResize(Sender: TObject);
    procedure pnlBackgroundClick(Sender: TObject);
    procedure ActionTakePhotoFromCameraDidFinishTaking(Image: TBitmap);
    procedure lbMenuClickItem(Sender: TSkinItem);
    procedure scmaPopupAnimateEnd(Sender: TObject);
  private
    FSkinPictureList:TList<TDrawPicture>;
    FRawBitmap: TBitmap;
    HideMenuType:THideMenuType;
  public
    procedure TakePhotoFromCamera;
    procedure TakePhotoFromAlbum;
    { Private declarations }
  protected
    procedure ChangeLanguage(ALangKind:TLangKind);
  protected
    function CanReturn:Boolean;
  public
    OnTakedPicture:TTakedPictureEvent;
    procedure HideMenu;
    procedure ShowMenu;
  public
    procedure DoReturnFrameFromAllImageFrame(AFrame:TFrame);
  public
//    FrameHistroy:TFrameHistroy;

    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    procedure Clear;
    { Public declarations }
  end;



var
  GlobalMultiTakePictureMenuFrame:TFrameMultiTakePictureMenu;

//procedure CopyBitmap(ASrcBitmap:TBitmap;ADestBitmap:TBitmap);

implementation

//uses MainForm
//  ,AddSpiritFrame
//  ;

//procedure CopyBitmap(ASrcBitmap:TBitmap;ADestBitmap:TBitmap);
//begin
//  ADestBitmap.SetSize(ASrcBitmap.Width,ASrcBitmap.Height);
//  ADestBitmap.Canvas.BeginScene();
//  try
//    ADestBitmap.Canvas.Clear(0);
//    ADestBitmap.Canvas.DrawBitmap(
//            ASrcBitmap,
//            RectF(0,0,ASrcBitmap.Width,ASrcBitmap.Height),
//            RectF(0,0,ADestBitmap.Width,ADestBitmap.Height),
//            1
//            );
//  finally
//    ADestBitmap.Canvas.EndScene;
//  end;
//end;


{$R *.fmx}



{ TFrameTakePictureMenu }

procedure TFrameMultiTakePictureMenu.TakePhotoFromAlbum;
var
  ASelectedNum:Integer;
begin
  HideFrame;
  //多选照片
  ShowFrame(TFrame(GAllImageFrame),TFrameAllImage,Application.MainForm,nil,nil,DoReturnFrameFromAllImageFrame,Application,True,False,ufsefNone);
//  GAllImageFrame.FrameHistroy:=CurrentFrameHistroy;


//  //判断是否还可以添加
//  if GlobalAddSpiritFrame.lvPictures.Prop.Items[GlobalAddSpiritFrame.lvPictures.Prop.Items.Count-1].ItemType=sitItem1 then
//  begin
//    ASelectedNum:=GlobalAddSpiritFrame.lvPictures.Prop.Items.Count-1;
//  end
//  else
//  begin
//    ASelectedNum:=9;
//  end;

  GAllImageFrame.Load(True,ASelectedNum,9);
end;

procedure TFrameMultiTakePictureMenu.TakePhotoFromCamera;
var
  Image:TBitmap;
  OpenDialog: TOpenDialog;
  I: Integer;
begin
  //拍照
  {$IFDEF MSWINDOWS}
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Filter := TBitmapCodecManager.GetFilterString;
    OpenDialog.Options:=OpenDialog.Options+[TOpenOption.ofAllowMultiSelect];
    if OpenDialog.Execute then
    begin
      for I := 0 to OpenDialog.Files.Count-1 do
      begin
        Image:=TBitmap.CreateFromFile(OpenDialog.Files[I]);
        ActionTakePhotoFromCameraDidFinishTaking(Image);
        FreeAndNil(Image);
      end;
    end;
  finally
    FreeAndNil(OpenDialog);
  end;
  {$ENDIF}
  {$IFNDEF MSWINDOWS}
  ActionTakePhotoFromCamera.ExecuteTarget(Self);
  {$ENDIF}
end;

procedure TFrameMultiTakePictureMenu.ActionTakePhotoFromCameraDidFinishTaking(Image: TBitmap);
var
  ScaleFactor: Single;
  AImage: TDrawPicture;
begin
  //拍照返回
  if Image.Width > 1024 then
  begin
    ScaleFactor := Image.Width / 1024;
    Image.Resize(Round(Image.Width / ScaleFactor), Round(Image.Height / ScaleFactor));
  end;

//    GlobalAddSpiritFrame.FImgComeFrom:='Camera';

  AImage:=TDrawPicture.Create('','');
  CopyBitmap(Image,AImage);

  FSkinPictureList.Clear;
  FSkinPictureList.Add(AImage);


  //隐藏弹出菜单
  HideMenuType:=hmtHasPicture;
  HideMenu;

end;

procedure TFrameMultiTakePictureMenu.HideMenu;
begin
  scmaPopup.GoForward;
end;

procedure TFrameMultiTakePictureMenu.ShowMenu;
begin
  Self.pnlBackground.Visible:=True;
  Self.pnlBackground.Align:=TAlignLayout.alNone;
  Self.pnlBackground.SetBounds(0,0,Width,Height);
  Self.lbMenu.Width:=Width;
  Self.pnlBackground.BringToFront;
  scmaPopup.GoBackward;
end;

procedure TFrameMultiTakePictureMenu.scmaPopupAnimateEnd(Sender: TObject);
begin
  if Self.scmaPopup.DirectionType=adtForward then
  begin
    Self.pnlBackground.Visible:=False;
    Self.Visible:=False;

    HideFrame;//(Self,hfcttBeforeReturnFrame,ufsefNone);
    ReturnFrame(Self);

    case HideMenuType of
      hmtHasPicture:
      begin
        if Assigned(OnTakedPicture) then
        begin
          OnTakedPicture(Self,FSkinPictureList);
        end;
      end;
    end;
  end;
end;

function TFrameMultiTakePictureMenu.CanReturn: Boolean;
begin
  if Self.Visible then
  begin

    //如果当前页面显示
    //要执行返回上一页
    //不允许执行返回上一页
    Result:=False;
    //隐藏菜单
    HideMenu;

  end
  else
  begin

    //直接返回
    Result:=True;

  end;
end;

procedure TFrameMultiTakePictureMenu.ChangeLanguage(ALangKind: TLangKind);
const
  Langs_Button_Caption_Camera : array[Low(TLangKind)..High(TLangKind)] of string =
      ('拍照','Take Photo','');
  Langs_Button_Caption_Album : array[Low(TLangKind)..High(TLangKind)] of string =
      ('从相册选择','Select From Album','');
//  Langs_Button_Caption_Cancel : array[Low(TLangKind)..High(TLangKind)] of string =
//      ('从相册选择','Select From Album','');
  Langs_Button_Caption_CANCEL : array[Low(TLangKind)..High(TLangKind)] of string =
      ('取消','Cancel','');
begin
  //翻译
  Self.lbMenu.Properties.Items.FindItemByName('拍照').Caption:=Langs_Button_Caption_Camera[ALangKind];
  Self.lbMenu.Properties.Items.FindItemByName('从相册选择').Caption:=Langs_Button_Caption_Album[ALangKind];
  Self.lbMenu.Properties.Items.FindItemByName('取消').Caption:=Langs_Button_Caption_Cancel[ALangKind];
end;

procedure TFrameMultiTakePictureMenu.Clear;
begin
  //清理一下,减少内存占用
  if GAllImageFrame<>nil then
  begin
    GAllImageFrame.Clear;
  end;
end;

constructor TFrameMultiTakePictureMenu.Create(AOwner: TComponent);
begin
  inherited;
  FRawBitmap := TBitmap.Create(0, 0);
  FSkinPictureList:=TList<TDrawPicture>.Create;

  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

destructor TFrameMultiTakePictureMenu.Destroy;
begin
  FreeAndNil(FRawBitmap);
  FreeAndNil(FSkinPictureList);
  inherited;
end;

procedure TFrameMultiTakePictureMenu.DoReturnFrameFromAllImageFrame(AFrame: TFrame);
var
  I: Integer;
  ScaleFactor: Single;
begin
  FSkinPictureList.Clear;


//  if GAllImageFrame.FBtnSure then
//  begin
////      GlobalAddSpiritFrame.FImgComeFrom:='Libary';
//    for I := 0 to GAllImageFrame.FOriginPhotoList.Count-1 do
//    begin
//      //照片返回
//      if GAllImageFrame.FOriginPhotoList[I].Width > 1024 then
//      begin
//        ScaleFactor := GAllImageFrame.FOriginPhotoList[I].Width / 1024;
//        GAllImageFrame.FOriginPhotoList[I].Resize(Round(GAllImageFrame.FOriginPhotoList[I].Width / ScaleFactor), Round(GAllImageFrame.FOriginPhotoList[I].Height / ScaleFactor));
//      end;
//
//      FSkinPictureList.Add(GAllImageFrame.FOriginPhotoList[I]);
//    end;
//    //隐藏弹出菜单
//    HideMenuType:=hmtHasPicture;
//    HideMenu;
//  end
//  else
//  begin
//    //隐藏弹出菜单
//    HideMenuType:=hmtHasPicture;
//    HideMenu;
//  end;

end;

procedure TFrameMultiTakePictureMenu.FrameResize(Sender: TObject);
begin
  Self.pnlBackground.SetBounds(0,0,Width,Height);
  Self.lbMenu.Width:=Width;
end;

procedure TFrameMultiTakePictureMenu.lbMenuClickItem(Sender: TSkinItem);
begin
  if TSkinItem(Sender).Name='拍照' then
  begin
    TakePhotoFromCamera;
  end;
  if TSkinItem(Sender).Name='从相册选择' then
  begin
    TakePhotoFromAlbum;
  end;
  if TSkinItem(Sender).Name='取消' then
  begin
    HideMenuType:=hmtNone;
    HideMenu;
  end;
end;

procedure TFrameMultiTakePictureMenu.pnlBackgroundClick(Sender: TObject);
begin
  OnTakedPicture:=nil;
  HideMenuType:=hmtNone;
  HideMenu;
end;

end.



