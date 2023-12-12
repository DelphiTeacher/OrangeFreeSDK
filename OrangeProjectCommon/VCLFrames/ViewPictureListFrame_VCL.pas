//convert pas to utf8 by ¥

unit ViewPictureListFrame_VCL;

interface

uses
  SysUtils, Types, //UITypes,
  Classes, Variants,
  Forms,

  uFuncCommon,
  uSkinMaterial,
  uDrawPicture,
  uFileCommon,
  uBaseList,
  uSkinItems,
  uSkinListViewType,
  uSkinListBoxType,
  uSkinAnimator,
  uGraphicCommon,

//  EasyServiceCommonMaterialDataMoudle,

//  WaitingFrame,
//  MessageBoxFrame,
//  SavePictureMenuFrame,
//  uUIFunction,


//  uSkinWindowsButton, uSkinWindowsControl, uSkinWindowsPanel,
//  uSkinWindowsScrollControl, uSkinWindowsListBox, uSkinWindowsCheckBox,
//  uSkinWindowsLabel, uSkinWindowsImage, uSkinWindowsItemDesignerPanel,
//  uSkinWindowsListView, uSkinWindowsImageListPlayer, uSkinWindowsImageListViewer,
//  FMX.Controls.Presentation, uSkinButtonType, uSkinPanelType, uBaseSkinControl,
//  uSkinScrollControlType, uSkinImageListViewerType,
  uSkinImageList,
  DateUtils, ExtCtrls, uSkinButtonType, uSkinPanelType, Controls,
  uSkinWindowsControl, uSkinScrollControlType, uSkinImageListViewerType,
  uSkinLabelType;



type
  TFrameBaseViewPictureList = class(TFrame)
    imglistPlayer: TSkinImageList;
    imgPlayer: TSkinWinImageListViewer;
    pnlToolBar: TSkinWinPanel;
    cmaToolBar: TSkinControlMoveAnimator;
    btnReturn: TSkinWinButton;
    btnPop: TSkinWinButton;
    tmrCheckLongTap: TTimer;
    Timer1: TTimer;
    lblInfo: TSkinWinLabel;
    procedure btnReturnClick(Sender: TObject);virtual;
    procedure imgPlayerImageListSwitchEnd(Sender: TObject);virtual;
    procedure cmaToolBarAnimate(Sender: TObject);virtual;
    procedure btnShowBarClick(Sender: TObject);virtual;
    procedure cmaToolBarAnimateBegin(Sender: TObject);virtual;
    procedure cmaToolBarAnimateEnd(Sender: TObject);virtual;
    procedure imgPlayerStayClick(Sender: TObject);virtual;
    procedure btnPopClick(Sender: TObject);virtual;
//    procedure imgPlayerMouseDown(Sender: TObject; Button: TMouseButton;
//      Shift: TShiftState; X, Y: Single);
//    procedure imgPlayerMouseUp(Sender: TObject; Button: TMouseButton;
//      Shift: TShiftState; X, Y: Single);
//    procedure imgPlayerMouseMove(Sender: TObject; Shift: TShiftState; X,
//      Y: Single);
    procedure tmrCheckLongTapTimer(Sender: TObject);virtual;
    procedure Timer1Timer(Sender: TObject);virtual;
    procedure imgPlayerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);virtual;
    procedure imgPlayerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);virtual;
    procedure imgPlayerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);virtual;
  private
//    FMouseDownPoint:TPointF;
//    FMouseMovePoint:TPointF;
//
//    BarVisible:Boolean;
//
//    OriginPictureUrlList:TStringList;
//
//    procedure DoDrawPictrueChange(Sender:TObject);
//  public
//    constructor Create(AOwner: TComponent); override;
//    destructor Destroy; override;
//    { Private declarations }
//  public
//    procedure Init(ACaption:String;
//                   APictureList:TDrawPictureList;
//                   AIndex:Integer;
//                   AOriginPictureUrlList:TStringList=nil;
//                   AIsCanBeSaveToAlbum:Boolean=True);overload;
//    //显示单独某个图片
//    procedure Init(ACaption:String;
//                   APicture:TBaseDrawPicture;
//                   AOriginPictureUrl:String='');overload;
//  public
//    procedure AddPicture(AUrl:String);overload;
//    procedure ShowPicture(ACaption: String;AIndex:Integer);
////    procedure DoGesture(Sender: TObject;
////                        const EventInfo: TGestureEventInfo;
////                        var Handled: Boolean);
////    procedure Init(ACaption:String;
////                   AOriginPictureUrl:String);overload;
    { Public declarations }
  end;




//var
//  GlobalViewPictureListFrame:TFrameBaseViewPictureList;




implementation

{$R *.dfm}

//uses
//  MainForm;

//procedure TFrameBaseViewPictureList.AddPicture(AUrl: String);
//begin
//  //显示
//  imglistPlayer.PictureList.Add.Url:=AUrl;
//
//end;

procedure TFrameBaseViewPictureList.btnPopClick(Sender: TObject);
begin
//  //长按弹出菜单保存
//  ShowFrame(TFrame(GlobalSavePictureMenuFrame),TFrameSavePictureMenu,Application.MainForm,nil,nil,nil,Application,True,False,ufsefNone);
//  GlobalSavePictureMenuFrame.ShowMenu;
//  GlobalSavePictureMenuFrame.Load(Self.imglistPlayer.PictureList[Self.imgPlayer.Prop.Picture.ImageIndex]);
end;

procedure TFrameBaseViewPictureList.btnReturnClick(Sender: TObject);
begin
//  Self.imglistPlayer.PictureList.Clear(False);

//  HideFrame();
//  ReturnFrame();
end;

//constructor TFrameBaseViewPictureList.Create(AOwner: TComponent);
//begin
//  inherited Create(AOwner);
//
//
//  //设置主题颜色
//  pnlToolBar.SelfOwnMaterialToDefault.BackColor.FillColor.Color:=SkinThemeColor;
//
//
//  Self.imglistPlayer.PictureList.Clear(True);
//
//  Self.cmaToolBar.Min:=-Self.pnlToolBar.Height;
//
//  BarVisible:=True;
//  Self.pnlToolBar.Align:=alTop;
////  Self.pnlToolBar.Opacity:=0.7;
//
//
////  RecordSubControlsLang(Self);
////  TranslateSubControlsLang(Self);
//end;
//
//
//destructor TFrameBaseViewPictureList.Destroy;
//begin
//  Self.imglistPlayer.PictureList.Clear(False);
//  inherited Destroy;
//end;

//procedure TFrameBaseViewPictureList.DoDrawPictrueChange(Sender: TObject);
//begin
//  Self.imgPlayer.Invalidate;
//end;

//procedure TFrameViewPictureList.DoGesture(Sender: TObject;
//  const EventInfo: TGestureEventInfo; var Handled: Boolean);
//begin
//  if EventInfo.GestureID=igiLongTap then
//  begin
//    //长按弹出菜单保存
//    ShowFrame(TFrame(GlobalSavePictureMenuFrame),TFrameSavePictureMenu,Application.MainForm,nil,nil,nil,Application,True,False,ufsefNone);
//    GlobalSavePictureMenuFrame.ShowMenu;
//  end;
//
//end;

procedure TFrameBaseViewPictureList.imgPlayerImageListSwitchEnd(Sender: TObject);
//var
//  AIndex:Integer;
//  ATitle:String;
begin
//  AIndex:=Self.pnlToolBar.Caption.IndexOf('(');
//  ATitle:=Self.pnlToolBar.Caption.Substring(0,AIndex);
//  ShowPicture(ATitle,Self.imgPlayer.Properties.Picture.ImageIndex);
end;

procedure TFrameBaseViewPictureList.imgPlayerMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
//  FMouseMovePoint:=PointF(X,Y)

end;

procedure TFrameBaseViewPictureList.imgPlayerMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  tmrCheckLongTap.Enabled:=False;
end;

//procedure TFrameViewPictureList.imgPlayerMouseDown(Sender: TObject;
//  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//begin
//
//end;

procedure TFrameBaseViewPictureList.imgPlayerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  FMouseDownPoint:=PointF(X,Y);
//  FMouseMovePoint:=PointF(X,Y);
//  tmrCheckLongTap.Enabled:=True;

end;

//procedure TFrameViewPictureList.imgPlayerMouseMove(Sender: TObject;
//  Shift: TShiftState; X, Y: Integer);
//begin
//end;

//procedure TFrameViewPictureList.imgPlayerMouseUp(Sender: TObject;
//  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
//begin
//end;

procedure TFrameBaseViewPictureList.imgPlayerStayClick(Sender: TObject);
begin
//  if BarVisible then
//  begin
//      BarVisible:=False;
//      Self.cmaToolBar.GoBackward;
//  end
//  else
//  begin
//      BarVisible:=True;
//      Self.cmaToolBar.GoForward;
//  end;
end;

//procedure TFrameBaseViewPictureList.Init(ACaption: String; APicture: TBaseDrawPicture;
//  AOriginPictureUrl: String);
//var
//  APictureList:TDrawPictureList;
//  AOriginPictureUrlList:TStringList;
//begin
//  APictureList:=TDrawPictureList.Create(ooReference);
//  AOriginPictureUrlList:=nil;
//  if AOriginPictureUrl<>'' then
//  begin
//    AOriginPictureUrlList:=TStringList.Create;
//  end;
//
//  try
//    APictureList.Add(APicture);
//    if AOriginPictureUrlList<>nil then AOriginPictureUrlList.Add(AOriginPictureUrl);
//
//    Init(ACaption,APictureList,0,AOriginPictureUrlList);
//  finally
//    FreeAndNil(APictureList);
//    FreeAndNil(AOriginPictureUrlList);
//  end;
//end;
//
//procedure TFrameBaseViewPictureList.Init(ACaption: String;
//                                    APictureList: TDrawPictureList;
//                                    AIndex:Integer;
//                                    AOriginPictureUrlList:TStringList;
//                                    AIsCanBeSaveToAlbum:Boolean);
//var
//  I: Integer;
////  BPictureList:TDrawPictureList;
//begin
////  BPictureList:=APictureList;
//
//  Self.btnPop.Visible:=AIsCanBeSaveToAlbum;
//
//  OriginPictureUrlList:=AOriginPictureUrlList;
//
//
//  //复制图片
//  imglistPlayer.PictureList.Clear(False);
//
//  if APictureList<>nil then
//  begin
//
//      for I := 0 to APictureList.Count-1 do
//      begin
//        if (APictureList[I].Url<>'')
//          or (Not APictureList[I].IsEmpty) then
//        begin
//          //显示
//          imglistPlayer.PictureList.Add(APictureList[I]);
//        end;
//      end;
//
//  end;
//  ShowPicture(ACaption,AIndex);
//end;
//
//procedure TFrameBaseViewPictureList.ShowPicture(ACaption: String;AIndex: Integer);
//begin
//  //指定当前显示的图片下标
//  Self.imgPlayer.Properties.Picture.ImageIndex:=AIndex;
//
//  //设置URL为原图
//  //下载原图
//  if (OriginPictureUrlList<>nil) and (OriginPictureUrlList.Count>AIndex) then
//  begin
//    imglistPlayer.PictureList[AIndex].Url:=OriginPictureUrlList[AIndex];
//    imglistPlayer.PictureList[AIndex].OnChange:=DoDrawPictrueChange;
//  end;
//
//  //照片数
//  Self.pnlToolBar.Caption:=ACaption+'('+IntToStr(AIndex+1)+'/'+IntToStr(imglistPlayer.PictureList.Count)+')';
//  if ACaption='头像' then
//  begin
//    Self.pnlToolBar.Caption:=ACaption;
//  end;
//end;

procedure TFrameBaseViewPictureList.Timer1Timer(Sender: TObject);
begin
//  Self.imgPlayer.Invalidate;
end;

procedure TFrameBaseViewPictureList.tmrCheckLongTapTimer(Sender: TObject);
begin
//  tmrCheckLongTap.Enabled:=False;

//  //长按不怎么移动
//  if (ABS(FMouseMovePoint.X-Self.FMouseDownPoint.X)<=5)
//    and (ABS(FMouseMovePoint.Y-Self.FMouseDownPoint.Y)<=5) then
//  begin
//      //长按弹出菜单保存
//      ShowFrame(TFrame(GlobalSavePictureMenuFrame),TFrameSavePictureMenu,Application.MainForm,nil,nil,nil,Application,True,False,ufsefNone);
//      GlobalSavePictureMenuFrame.ShowMenu;
//      GlobalSavePictureMenuFrame.Load(Self.imglistPlayer.PictureList[Self.imgPlayer.Prop.Picture.ImageIndex]);
//  end;
end;

procedure TFrameBaseViewPictureList.cmaToolBarAnimate(Sender: TObject);
begin
//  Self.cmaToolBar.Min:=-Self.pnlToolBar.Height;

//  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtForward then
//  begin
//    //逐渐显示
//    Self.pnlToolBar.Opacity:=(Self.cmaToolBar.Progress)*0.7;
//  end;
//  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtBackward then
//  begin
//    //逐渐隐藏
//    Self.pnlToolBar.Opacity:=(1-Self.cmaToolBar.Progress)*0.7;
//  end;
end;

procedure TFrameBaseViewPictureList.cmaToolBarAnimateBegin(Sender: TObject);
begin

//  Self.pnlToolBar.Align:=alNone;
//  Self.pnlToolBar.Width:=Width;
//  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtForward then
//  begin
//    //逐渐显示
//  end;
//  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtBackward then
//  begin
//    //逐渐隐藏
//  end;
end;

procedure TFrameBaseViewPictureList.cmaToolBarAnimateEnd(Sender: TObject);
begin
//  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtForward then
//  begin
//    //逐渐显示
//    Self.pnlToolBar.Align:=alTop;
//  end;
//  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtBackward then
//  begin
//    //逐渐隐藏
////    Self.pnlToolBar.Align:=TAlignLayout.None;
//  end;
end;

procedure TFrameBaseViewPictureList.btnShowBarClick(Sender: TObject);
begin
end;

//procedure TFrameViewPictureList.Init(ACaption, AOriginPictureUrl: String);
//var
//  APicture:TDrawPicture;
//begin
//  APicture:=TDrawPicture.Create();
//  try
//    APicture.Url:=AOriginPictureUrl;
//    Init(ACaption,APicture);
//  finally
//    FreeAndNil(APicture);
//  end;
//end;

end.
