//convert pas to utf8 by ¥

unit ViewPictureListFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,


  uSkinMaterial,
  uDrawPicture,
  uFileCommon,
  uBaseList,
  uSkinItems,
  uSkinListViewType,
  uSkinListBoxType,
  DateUtils,

//  EasyServiceCommonMaterialDataMoudle,

  WaitingFrame,
  MessageBoxFrame,


  uUIFunction,
  SavePictureMenuFrame,


  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
  uSkinFireMonkeyScrollControl, uSkinFireMonkeyListBox, uSkinFireMonkeyCheckBox,
  uSkinFireMonkeyLabel, uSkinFireMonkeyImage, uSkinFireMonkeyItemDesignerPanel,
  uSkinFireMonkeyListView, uSkinFireMonkeyImageListPlayer, uSkinImageList, uSkinFireMonkeyImageListViewer,
  uSkinAnimator,
  FMX.Controls.Presentation, uSkinButtonType, uSkinPanelType, uBaseSkinControl,
  uSkinScrollControlType, uSkinImageListViewerType;



type
  TFrameViewPictureList = class(TFrame)
    imglistPlayer: TSkinImageList;
    imgPlayer: TSkinFMXImageListViewer;
    pnlToolBar: TSkinFMXPanel;
    cmaToolBar: TSkinControlMoveAnimator;
    btnReturn: TSkinFMXButton;
    btnPop: TSkinFMXButton;
    tmrCheckLongTap: TTimer;
    Timer1: TTimer;
    procedure btnReturnClick(Sender: TObject);
    procedure imgPlayerImageListSwitchEnd(Sender: TObject);
    procedure cmaToolBarAnimate(Sender: TObject);
    procedure btnShowBarClick(Sender: TObject);
    procedure cmaToolBarAnimateBegin(Sender: TObject);
    procedure cmaToolBarAnimateEnd(Sender: TObject);
    procedure imgPlayerStayClick(Sender: TObject);
    procedure btnPopClick(Sender: TObject);
    procedure imgPlayerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure imgPlayerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure tmrCheckLongTapTimer(Sender: TObject);
    procedure imgPlayerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure Timer1Timer(Sender: TObject);
  private
    FMouseDownPoint:TPointF;
    FMouseMovePoint:TPointF;

    BarVisible:Boolean;

    OriginPictureUrlList:TStringList;

    procedure DoDrawPictrueChange(Sender:TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Private declarations }
  public
    procedure Init(ACaption:String;
                   APictureList:TDrawPictureList;
                   AIndex:Integer;
                   AOriginPictureUrlList:TStringList=nil;
                   AIsCanBeSaveToAlbum:Boolean=True);overload;
    //显示单独某个图片
    procedure Init(ACaption:String;
                   APicture:TBaseDrawPicture;
                   AOriginPictureUrl:String='');overload;
  public
    procedure AddPicture(AUrl:String);overload;
    procedure ShowPicture(ACaption: String;AIndex:Integer);
//    procedure DoGesture(Sender: TObject;
//                        const EventInfo: TGestureEventInfo;
//                        var Handled: Boolean);
//    procedure Init(ACaption:String;
//                   AOriginPictureUrl:String);overload;
    { Public declarations }
  end;




var
  GlobalViewPictureListFrame:TFrameViewPictureList;


implementation

{$R *.fmx}

//uses
//  MainForm;

procedure TFrameViewPictureList.AddPicture(AUrl: String);
begin
  //显示
  imglistPlayer.PictureList.Add.Url:=AUrl;

end;

procedure TFrameViewPictureList.btnPopClick(Sender: TObject);
begin
  //长按弹出菜单保存
  ShowFrame(TFrame(GlobalSavePictureMenuFrame),TFrameSavePictureMenu,Application.MainForm,nil,nil,nil,Application,True,False,ufsefNone);
  GlobalSavePictureMenuFrame.ShowMenu;
  GlobalSavePictureMenuFrame.Load(Self.imglistPlayer.PictureList[Self.imgPlayer.Prop.Picture.ImageIndex]);
end;

procedure TFrameViewPictureList.btnReturnClick(Sender: TObject);
begin
  Self.imglistPlayer.PictureList.Clear(False);

  HideFrame();
  ReturnFrame();
end;

constructor TFrameViewPictureList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);


  //设置主题颜色
  pnlToolBar.SelfOwnMaterialToDefault.BackColor.FillColor.Color:=SkinThemeColor;


  Self.imglistPlayer.PictureList.Clear(True);

  Self.cmaToolBar.Min:=-Self.pnlToolBar.Height;

  BarVisible:=True;
  Self.pnlToolBar.Align:=TAlignLayout.Top;
  Self.pnlToolBar.Opacity:=0.7;


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;


destructor TFrameViewPictureList.Destroy;
begin
  Self.imglistPlayer.PictureList.Clear(False);
  inherited Destroy;
end;

procedure TFrameViewPictureList.DoDrawPictrueChange(Sender: TObject);
begin
  Self.imgPlayer.Invalidate;
end;

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

procedure TFrameViewPictureList.imgPlayerImageListSwitchEnd(Sender: TObject);
var
  AIndex:Integer;
  ATitle:String;
begin
  AIndex:=Self.pnlToolBar.Caption.IndexOf('(');
  ATitle:=Self.pnlToolBar.Caption.Substring(0,AIndex);
  ShowPicture(ATitle,Self.imgPlayer.Properties.Picture.ImageIndex);
end;

procedure TFrameViewPictureList.imgPlayerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FMouseDownPoint:=TPointF.Create(X,Y);
  FMouseMovePoint:=TPointF.Create(X,Y);
  tmrCheckLongTap.Enabled:=True;

end;

procedure TFrameViewPictureList.imgPlayerMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
  FMouseMovePoint:=TPointF.Create(X,Y)
end;

procedure TFrameViewPictureList.imgPlayerMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  tmrCheckLongTap.Enabled:=False;
end;

procedure TFrameViewPictureList.imgPlayerStayClick(Sender: TObject);
begin
  if BarVisible then
  begin
      BarVisible:=False;
      Self.cmaToolBar.GoBackward;
  end
  else
  begin
      BarVisible:=True;
      Self.cmaToolBar.GoForward;
  end;
end;

procedure TFrameViewPictureList.Init(ACaption: String; APicture: TBaseDrawPicture;
  AOriginPictureUrl: String);
var
  APictureList:TDrawPictureList;
  AOriginPictureUrlList:TStringList;
begin
  APictureList:=TDrawPictureList.Create(ooReference);
  AOriginPictureUrlList:=nil;
  if AOriginPictureUrl<>'' then
  begin
    AOriginPictureUrlList:=TStringList.Create;
  end;

  try
    APictureList.Add(APicture);
    if AOriginPictureUrlList<>nil then AOriginPictureUrlList.Add(AOriginPictureUrl);

    Init(ACaption,APictureList,0,AOriginPictureUrlList);
  finally
    FreeAndNil(APictureList);
    FreeAndNil(AOriginPictureUrlList);
  end;
end;

procedure TFrameViewPictureList.Init(ACaption: String;
                                    APictureList: TDrawPictureList;
                                    AIndex:Integer;
                                    AOriginPictureUrlList:TStringList;
                                    AIsCanBeSaveToAlbum:Boolean);
var
  I: Integer;
//  BPictureList:TDrawPictureList;
begin
//  BPictureList:=APictureList;

  Self.btnPop.Visible:=AIsCanBeSaveToAlbum;

  OriginPictureUrlList:=AOriginPictureUrlList;


  //复制图片
  imglistPlayer.PictureList.Clear(False);

  if APictureList<>nil then
  begin

      for I := 0 to APictureList.Count-1 do
      begin
        if (APictureList[I].Url<>'')
          or (Not APictureList[I].IsEmpty) then
        begin
          //显示
          imglistPlayer.PictureList.Add(APictureList[I]);
        end;
      end;

  end;
  ShowPicture(ACaption,AIndex);
end;

procedure TFrameViewPictureList.ShowPicture(ACaption: String;AIndex: Integer);
begin
  //指定当前显示的图片下标
  Self.imgPlayer.Properties.Picture.ImageIndex:=AIndex;

  //设置URL为原图
  //下载原图
  if (OriginPictureUrlList<>nil) and (OriginPictureUrlList.Count>AIndex) then
  begin
    imglistPlayer.PictureList[AIndex].Url:=OriginPictureUrlList[AIndex];
    imglistPlayer.PictureList[AIndex].OnChange:=DoDrawPictrueChange;
  end;

  //照片数
  Self.pnlToolBar.Caption:=ACaption+'('+IntToStr(AIndex+1)+'/'+IntToStr(imglistPlayer.PictureList.Count)+')';
  if ACaption='头像' then
  begin
    Self.pnlToolBar.Caption:=ACaption;
  end;
end;

procedure TFrameViewPictureList.Timer1Timer(Sender: TObject);
begin
  Self.imgPlayer.Invalidate;
end;

procedure TFrameViewPictureList.tmrCheckLongTapTimer(Sender: TObject);
begin
  tmrCheckLongTap.Enabled:=False;

  //长按不怎么移动
  if (ABS(FMouseMovePoint.X-Self.FMouseDownPoint.X)<=5)
    and (ABS(FMouseMovePoint.Y-Self.FMouseDownPoint.Y)<=5) then
  begin
      //长按弹出菜单保存
      ShowFrame(TFrame(GlobalSavePictureMenuFrame),TFrameSavePictureMenu,Application.MainForm,nil,nil,nil,Application,True,False,ufsefNone);
      GlobalSavePictureMenuFrame.ShowMenu;
      GlobalSavePictureMenuFrame.Load(Self.imglistPlayer.PictureList[Self.imgPlayer.Prop.Picture.ImageIndex]);
  end;
end;

procedure TFrameViewPictureList.cmaToolBarAnimate(Sender: TObject);
begin
  Self.cmaToolBar.Min:=-Self.pnlToolBar.Height;

  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtForward then
  begin
    //逐渐显示
    Self.pnlToolBar.Opacity:=(Self.cmaToolBar.Progress)*0.7;
  end;
  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtBackward then
  begin
    //逐渐隐藏
    Self.pnlToolBar.Opacity:=(1-Self.cmaToolBar.Progress)*0.7;
  end;
end;

procedure TFrameViewPictureList.cmaToolBarAnimateBegin(Sender: TObject);
begin

  Self.pnlToolBar.Align:=TAlignLayout.None;
  Self.pnlToolBar.Width:=Width;
  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtForward then
  begin
    //逐渐显示
  end;
  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtBackward then
  begin
    //逐渐隐藏
  end;
end;

procedure TFrameViewPictureList.cmaToolBarAnimateEnd(Sender: TObject);
begin
  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtForward then
  begin
    //逐渐显示
    Self.pnlToolBar.Align:=TAlignLayout.Top;
  end;
  if Self.cmaToolBar.DirectionType=TAnimateDirectionType.adtBackward then
  begin
    //逐渐隐藏
//    Self.pnlToolBar.Align:=TAlignLayout.None;
  end;
end;

procedure TFrameViewPictureList.btnShowBarClick(Sender: TObject);
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
