//convert pas to utf8 by ¥
unit SavePictureMenuFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,


  uUIFunction,
  uVersion,
  uSkinItems,

  uFuncCommon,
  HintFrame,
  uLang,
  uBaseLog,
  uDrawPicture,
  uFrameContext,
  uSkinFireMonkeyEdit,
  uSkinFireMonkeyMemo,
  uProcessNativeControlModalShowPanel,
  FMX.MediaLibrary,
  FMX.Platform,


  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
  uSkinFireMonkeyLabel, uSkinFireMonkeyImage, FMX.Controls.Presentation,
  uSkinAnimator, uSkinFireMonkeyScrollControl, uSkinFireMonkeyVirtualList,
  uSkinFireMonkeyListBox, FMX.MediaLibrary.Actions, System.Actions,
  FMX.ActnList, FMX.StdActns, uSkinFireMonkeyCustomList, uSkinButtonType,
  uSkinScrollControlType, uSkinCustomListType, uSkinVirtualListType,
  uSkinListBoxType, uBaseSkinControl, uSkinPanelType, uDrawCanvas;


type
//  THideMenuType=(hmtNone,hmtHasPicture);
//  TTakedPictureEvent=procedure(Sender:TObject;ABitmap:TBitmap) of object;

  TFrameSavePictureMenu = class(TFrame,
//                                IFrameChangeLanguageEvent,
                                IFrameHistroyReturnEvent)
    pnlBackground: TSkinFMXPanel;
    pnlBottom: TSkinFMXPanel;
    lbMenu: TSkinFMXListBox;
    scmaPopup: TSkinControlMoveAnimator;
    btnUseInIPadSetPosition: TSkinFMXButton;
    procedure FrameResize(Sender: TObject);
    procedure pnlBackgroundClick(Sender: TObject);
//    procedure ActionTakePhotoFromLibraryDidFinishTaking(Image: TBitmap);
//    procedure ActionTakePhotoFromCameraDidFinishTaking(Image: TBitmap);
    procedure lbMenuClickItem(Sender: TSkinItem);
    procedure scmaPopupAnimateEnd(Sender: TObject);
  private
    FDrawPicture:TDrawPicture;
//    FRawBitmap: TBitmap;
//    HideMenuType:THideMenuType;

//    procedure TakePhotoFromCamera;
//    procedure TakePhotoFromAlbum;
    { Private declarations }
  protected
    procedure DoWriteImageCompletionEvent(const ASaved: Boolean; const AResultMessage: string);
//    procedure ChangeLanguage(ALangKind:TLangKind);
  protected
    function CanReturn:TFrameReturnActionType;
  public
//    OnTakedPicture:TTakedPictureEvent;
    procedure HideMenu;
    procedure ShowMenu;
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    procedure Load(ADrawPicture:TDrawPicture);
//    procedure DoGesture(Sender: TObject;
//                        const EventInfo: TGestureEventInfo;
//                        var Handled: Boolean);
    { Public declarations }
  end;



var
  GlobalSavePictureMenuFrame:TFrameSavePictureMenu;

//procedure CopyBitmap(ASrcBitmap:TBitmap;ADestBitmap:TBitmap);

implementation

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



{ TFrameSavePictureMenu }

//procedure TFrameSavePictureMenu.TakePhotoFromAlbum;
//var
//  Image:TBitmap;
//  OpenDialog: TOpenDialog;
//  I: Integer;
//begin
//  //如果图片是空的,那么添加
//  //弹出菜单
////  uBaseLog.OutputDebugString('拍照','');
//  //拍照
//  {$IFDEF MSWINDOWS}
//  OpenDialog := TOpenDialog.Create(nil);
//  try
//    OpenDialog.Filter := TBitmapCodecManager.GetFilterString;
//    OpenDialog.Options:=OpenDialog.Options+[TOpenOption.ofAllowMultiSelect];
//    if OpenDialog.Execute then
//    begin
//      for I := 0 to OpenDialog.Files.Count-1 do
//      begin
//        Image:=TBitmap.CreateFromFile(OpenDialog.Files[I]);
//        ActionTakePhotoFromLibraryDidFinishTaking(Image);
//        FreeAndNil(Image);
//      end;
//    end;
//  finally
//    FreeAndNil(OpenDialog);
//  end;
//  {$ENDIF}
//  {$IFNDEF MSWINDOWS}
//  //btnUseInIPadSetPosition在IPAD中用于设置位置
//  ActionTakePhotoFromLibrary.ExecuteTarget(btnUseInIPadSetPosition);
//  {$ENDIF}
//end;
//
//procedure TFrameSavePictureMenu.TakePhotoFromCamera;
//var
//  Image:TBitmap;
//  OpenDialog: TOpenDialog;
//  I: Integer;
//begin
//  //如果图片是空的,那么添加
//  //弹出菜单
////  uBaseLog.OutputDebugString('拍照','');
//  //拍照
//  {$IFDEF MSWINDOWS}
//  OpenDialog := TOpenDialog.Create(nil);
//  try
//    OpenDialog.Filter := TBitmapCodecManager.GetFilterString;
//    OpenDialog.Options:=OpenDialog.Options+[TOpenOption.ofAllowMultiSelect];
//    if OpenDialog.Execute then
//    begin
//      for I := 0 to OpenDialog.Files.Count-1 do
//      begin
//        Image:=TBitmap.CreateFromFile(OpenDialog.Files[I]);
//        ActionTakePhotoFromLibraryDidFinishTaking(Image);
//        FreeAndNil(Image);
//      end;
//    end;
//  finally
//    FreeAndNil(OpenDialog);
//  end;
//  {$ENDIF}
//  {$IFNDEF MSWINDOWS}
//  try
//    ActionTakePhotoFromCamera.ExecuteTarget(Self);
//  except
//    on E:Exception do
//    begin
//      uBaseLog.HandleException(E,'ActionTakePhotoFromCamera.ExecuteTarget');
//    end;
//  end;
//  {$ENDIF}
//end;
//
//procedure TFrameSavePictureMenu.ActionTakePhotoFromCameraDidFinishTaking(Image: TBitmap);
//var
//  ScaleFactor: Single;
//begin
//  //拍照返回
//
//  //照片返回
//  if Image.Width > 1024 then
//  begin
//    ScaleFactor := Image.Width / 1024;
//    Image.Resize(Round(Image.Width / ScaleFactor), Round(Image.Height / ScaleFactor));
//  end;
////  FRawBitmap.Assign(Image);
//  CopyBitmap(Image,FRawBitmap);
//
//
//
//  //隐藏弹出菜单
//  HideMenuType:=hmtHasPicture;
//  HideMenu;
//
//end;
//
//procedure TFrameSavePictureMenu.ActionTakePhotoFromLibraryDidFinishTaking(Image: TBitmap);
//var
//  ScaleFactor: Single;
//begin
//  //相册返回
//
//  //照片返回
//  if Image.Width > 1024 then
//  begin
//    ScaleFactor := Image.Width / 1024;
//    Image.Resize(Round(Image.Width / ScaleFactor), Round(Image.Height / ScaleFactor));
//  end;
////  FRawBitmap.Assign(Image);
//  CopyBitmap(Image,FRawBitmap);
//
//  //隐藏弹出菜单
//  HideMenuType:=hmtHasPicture;
//  HideMenu;
//
//end;

procedure TFrameSavePictureMenu.HideMenu;
begin
  scmaPopup.GoForward;
end;

procedure TFrameSavePictureMenu.ShowMenu;
begin

  //先隐藏原生控件
  //设置Edit的ControlType,避免MessageBoxFrame被原生控件挡住
  SetGlobalEditListAsStyleType;
  SetGlobalMemoListAsStyleType;
  ProcessNativeControlBeginModalShow;



  Self.pnlBackground.Visible:=True;
  Self.pnlBackground.Align:=TAlignLayout.{$IF CompilerVersion >= 35.0}None{$ELSE}alNone{$IFEND};
  Self.pnlBackground.SetBounds(0,0,Width,Height);
  Self.lbMenu.Width:=Width;
  Self.pnlBackground.BringToFront;
  scmaPopup.GoBackward;
end;

procedure TFrameSavePictureMenu.scmaPopupAnimateEnd(Sender: TObject);
begin
  if Self.scmaPopup.DirectionType=adtForward then
  begin
      //隐藏弹出菜单结束
      Self.pnlBackground.Visible:=False;
      Self.Visible:=False;




      //一定要放在隐藏WaitingFrame的后面
      //还原所有的Edit的ControlType为Platform
      RestoreGlobalEditListAsPlatformType;
      RestoreGlobalMemoListAsPlatformType;
      //先隐藏WaitingFrame,再还原,免得WaitingFrame被盖住
      ProcessNativeControlEndModalShow;



      HideFrame;//(Self,hfcttBeforeReturnFrame,ufsefNone);
      ReturnFrame(Self);

//      case HideMenuType of
//        hmtHasPicture:
//        begin
//          if Assigned(OnTakedPicture) then
//          begin
//            OnTakedPicture(Self,FRawBitmap);
//          end;
//        end;
//      end;


  end;
end;

function TFrameSavePictureMenu.CanReturn: TFrameReturnActionType;
begin
  if Self.Visible then
  begin

    //如果当前页面显示
    //要执行返回上一页
    //不允许执行返回上一页
    Result:=TFrameReturnActionType.fratCanNotReturn;
    //隐藏菜单
    HideMenu;

  end
  else
  begin

    //直接返回
    Result:=TFrameReturnActionType.fratDefault;

  end;
end;

//procedure TFrameSavePictureMenu.ChangeLanguage(ALangKind: TLangKind);
//const
//  Langs_Button_Caption_Camera : array[Low(TLangKind)..High(TLangKind)] of string =
//      ('拍照','Take Photo','');
//  Langs_Button_Caption_Album : array[Low(TLangKind)..High(TLangKind)] of string =
//      ('从相册选择','Select From Album','');
////  Langs_Button_Caption_Cancel : array[Low(TLangKind)..High(TLangKind)] of string =
////      ('从相册选择','Select From Album','');
//  Langs_Button_Caption_CANCEL : array[Low(TLangKind)..High(TLangKind)] of string =
//      ('取消','Cancel','');
//begin
//  //翻译
//  Self.lbMenu.Properties.Items.FindItemByName('拍照').Caption:=Langs_Button_Caption_Camera[ALangKind];
//  Self.lbMenu.Properties.Items.FindItemByName('从相册选择').Caption:=Langs_Button_Caption_Album[ALangKind];
//  Self.lbMenu.Properties.Items.FindItemByName('取消').Caption:=Langs_Button_Caption_Cancel[ALangKind];
//end;

constructor TFrameSavePictureMenu.Create(AOwner: TComponent);
begin
  inherited;
//  FRawBitmap := TBitmap.Create(0, 0);


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

destructor TFrameSavePictureMenu.Destroy;
begin
//  FreeAndNil(FRawBitmap);
  inherited;
end;

//procedure TFrameSavePictureMenu.DoGesture(Sender: TObject;
//  const EventInfo: TGestureEventInfo; var Handled: Boolean);
//begin
//  if EventInfo.GestureID=igiLongTap then
//  begin
//    //长按弹出菜单保存
//    ShowFrame(TFrame(GlobalSavePictureMenuFrame),TFrameSavePictureMenu,Application.MainForm,nil,nil,nil,Application,True,False,ufsefNone);
//    GlobalSavePictureMenuFrame.ShowMenu;
//  end;
//end;

procedure TFrameSavePictureMenu.DoWriteImageCompletionEvent(
  const ASaved: Boolean; const AResultMessage: string);
begin
  if ASaved then
  begin
    ShowHintFrame(Application.MainForm,'保存成功!');
  end
  else
  begin
    ShowHintFrame(Application.MainForm,'保存失败!'+AResultMessage);
  end;
end;

procedure TFrameSavePictureMenu.FrameResize(Sender: TObject);
begin
  Self.pnlBackground.SetBounds(0,0,Width,Height);
  Self.lbMenu.Width:=Width;
end;

procedure TFrameSavePictureMenu.lbMenuClickItem(Sender: TSkinItem);
var
  PhotoService: IFMXPhotoLibrary;
begin
//  if TSkinItem(Sender).Name='拍照' then
//  begin
//    TakePhotoFromCamera;
//  end;
//  if TSkinItem(Sender).Name='从相册选择' then
//  begin
//    TakePhotoFromAlbum;
//  end;
  if TSkinItem(Sender).Name='save_to_album' then
  begin
//    HideMenuType:=hmtNone;       S
//    HideMenu;

//   {$IF DEFINED(IOS) OR DEFINED(ANDROID)}
    if TPlatformServices.Current.SupportsPlatformService(IFMXPhotoLibrary, PhotoService) then
    begin
      PhotoService.AddImageToSavedPhotosAlbum(FDrawPicture.CurrentPicture,DoWriteImageCompletionEvent);
      HideMenu;
    end
    else
    begin
      ShowHintFrame(Application.MainForm,'不支持FMXPhotoLibrary服务!');
    end;
//   {$ENDIF}

  end;
  if TSkinItem(Sender).Name='取消' then
  begin
//    HideMenuType:=hmtNone;
    HideMenu;
  end;
end;

procedure TFrameSavePictureMenu.Load(ADrawPicture: TDrawPicture);
begin
  FDrawPicture:=ADrawPicture;
end;

procedure TFrameSavePictureMenu.pnlBackgroundClick(Sender: TObject);
begin
//  OnTakedPicture:=nil;
//  HideMenuType:=hmtNone;
  HideMenu;
end;

end.




