//convert pas to utf8 by ¥
unit ClipHeadFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  uSkinBufferBitmap,
  uDrawCanvas,
  uUIFunction,
  uFrameContext,
  uGraphicCommon,
  uSkinControlGestureManager,
//  EasyServiceCommonMaterialDataMoudle,


  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uSkinFireMonkeyControl, uSkinFireMonkeyImage, FMX.Objects,
  uSkinFireMonkeyScrollBoxContent, uSkinFireMonkeyScrollControl,
  uSkinFireMonkeyScrollBox, uSkinFireMonkeyRoundImage, uSkinFireMonkeyButton,
  uSkinFireMonkeyPanel, FMX.Gestures, uSkinButtonType, uSkinPanelType,
  uSkinRoundImageType, uSkinImageType, uSkinScrollBoxContentType,
  uSkinScrollControlType, uSkinScrollBoxType;

type
  TFrameClipHead = class(TFrame)
    sbClient: TSkinFMXScrollBox;
    sbcClient: TSkinFMXScrollBoxContent;
    imgOrigin: TSkinFMXImage;
    rimgClipFrame: TSkinFMXRoundImage;
    pnlToolBar: TSkinFMXPanel;
    btnOK: TSkinFMXButton;
    btnReturn: TSkinFMXButton;
    btnTestZoom: TSkinFMXButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnTestZoomClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
  private
    FInitPictureSize:TSizeF;
    //头像尺寸
    FHeadWidth:Integer;
    FHeadHeigth:Integer;

    FLastZoomDistance: Integer;
    procedure SetZoomDistance(AWidthDistance:Double);
    { Private declarations }
  public
    procedure Init(ABitmap:TBitmap;
                    const AHeadWidth,AHeadHigth:Integer);
    procedure DoGesture(Sender: TObject;
                        const EventInfo: TGestureEventInfo;
                        var Handled: Boolean);
    function GetClipBitmap:TBitmap;

  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;

var
  GlobalClipHeadFrame:TFrameClipHead;

implementation

{$R *.fmx}

//uses
//  MainForm;



{ TFrameClipPicture }

procedure TFrameClipHead.btnOKClick(Sender: TObject);
begin
  HideFrame();
  ReturnFrame();
end;

procedure TFrameClipHead.btnReturnClick(Sender: TObject);
begin
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  HideFrame();
  ReturnFrame();
end;

procedure TFrameClipHead.btnTestZoomClick(Sender: TObject);
begin
  //测试缩放50个像素
  Self.SetZoomDistance(100);
end;

constructor TFrameClipHead.Create(AOwner: TComponent);
begin
  inherited;
  {$IFNDEF MSWINDOWS}
  Self.btnTestZoom.Visible:=False;
  {$ENDIF}



  Self.pnlToolBar.Material.BackColor.FillColor.Color:=uGraphicCommon.SkinThemeColor;

  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);

end;

procedure TFrameClipHead.DoGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo;
  var Handled: Boolean);
var
  AWidthDistance:Double;
  AHeightDistance:Double;
begin
  FMX.Types.Log.d('OrangeUI TFrameClipHead.imgOriginGesture');

  if EventInfo.GestureID = igiZoom then
  begin

      //缩放开始
      if (TInteractiveGestureFlag.gfBegin in EventInfo.Flags) then
      begin
        FMX.Types.Log.d('OrangeUI TFrameClipHead.imgOriginGesture Begin');
        ZoomingHorzGestureManager:=Self.sbClient.Prop.HorzControlGestureManager;
        ZoomingVertGestureManager:=Self.sbClient.Prop.VertControlGestureManager;
      end;


//      LObj := Self.ObjectAtPoint(Application.MainForm.ClientToScreen(EventInfo.Location));
//      if LObj is TSkinFMXImage then
//      begin
          if (not (TInteractiveGestureFlag.gfBegin in EventInfo.Flags)) and
            (not (TInteractiveGestureFlag.gfEnd in EventInfo.Flags)) then
          begin
            { zoom the image }

            AWidthDistance:=(EventInfo.Distance - FLastZoomDistance);

            SetZoomDistance(AWidthDistance);
          end;
          FLastZoomDistance := EventInfo.Distance;
//      end;


      //缩放结束
      if (TInteractiveGestureFlag.gfEnd in EventInfo.Flags) then
      begin
        FMX.Types.Log.d('OrangeUI TFrameClipHead.imgOriginGesture End');

        //不能小于初始宽度
        if Self.imgOrigin.Width<FInitPictureSize.Width then
        begin
          AWidthDistance:=FInitPictureSize.Width-Self.imgOrigin.Width;
          SetZoomDistance(AWidthDistance);
        end;

      end;



      Handled:=True;
  end;
end;

function TFrameClipHead.GetClipBitmap: TBitmap;
var
  AZoomScale:Double;
  ALeftOffset:Double;
  ATopOffset:Double;
begin
  //缩放比例
  AZoomScale:=Self.imgOrigin.Prop.Picture.Width/Self.imgOrigin.Width;

  ALeftOffset:=Self.sbClient.Prop.HorzControlGestureManager.Position;
  ATopOffset:=Self.sbClient.Prop.VertControlGestureManager.Position;


  Result:=TBitmap.Create(FHeadWidth,FHeadHeigth);
  Result.Canvas.BeginScene();
  try
    Result.Canvas.Clear(0);
    Result.Canvas.DrawBitmap(Self.imgOrigin.Prop.Picture,
                            RectF(ALeftOffset*AZoomScale,
                                  ATopOffset*AZoomScale,
                                  (ALeftOffset+FHeadWidth)*AZoomScale,
                                  (ATopOffset+FHeadHeigth)*AZoomScale),
                            RectF(0,0,FHeadWidth,FHeadHeigth),
                            1);
//    Result.SaveToFile('C:\bb.jpg');
  finally
    Result.Canvas.EndScene;
  end;
end;

procedure TFrameClipHead.Init(ABitmap: TBitmap;const AHeadWidth,AHeadHigth:Integer);
begin
  FHeadWidth:=AHeadWidth;
  FHeadHeigth:=AHeadHigth;

  Self.imgOrigin.Prop.Picture.Assign(ABitmap);


  //中间透明区域用直角
  Self.rimgClipFrame.SelfOwnMaterialToDefault.ClipRoundWidth:=0;
  Self.rimgClipFrame.SelfOwnMaterialToDefault.ClipRoundHeight:=0;
  //中间的透明矩形的尺寸
  Self.rimgClipFrame.SelfOwnMaterialToDefault.ClipRoundRectSetting.Width:=FHeadWidth;
  Self.rimgClipFrame.SelfOwnMaterialToDefault.ClipRoundRectSetting.Height:=FHeadHeigth;


  //计算最合适的显示尺寸
  FInitPictureSize:=AutoFillPictureDrawRect(Self.imgOrigin.Prop.Picture.Width,
                                            Self.imgOrigin.Prop.Picture.Height,
                                            FHeadWidth,
                                            FHeadHeigth);

  Self.imgOrigin.Align:=TAlignLayout.None;
  //Image控件的尺寸为图片的尺寸
  Self.imgOrigin.Width:=FInitPictureSize.Width;
  Self.imgOrigin.Height:=FInitPictureSize.Height;


  //左上空出,可以移动
  Self.imgOrigin.Position.X:=(sbClient.Width-FHeadWidth)/2;
  Self.imgOrigin.Position.Y:=(sbClient.Height-FHeadHeigth)/2;


  //ScrollBox的内容尺寸,图片的宽度+控件的宽度-头像的宽度
  Self.sbClient.Prop.ContentWidth:=Self.imgOrigin.Width
                                    +Self.sbClient.Width
                                    -FHeadWidth;
  Self.sbClient.Prop.ContentHeight:=Self.imgOrigin.Height
                                    +Self.sbClient.Height
                                    -FHeadHeigth;


end;

procedure TFrameClipHead.SetZoomDistance(AWidthDistance: Double);
var
  AHeightDistance:Double;
begin
  //保持比例
  AHeightDistance:=AWidthDistance*Self.imgOrigin.Height/Self.imgOrigin.Width;


  Self.imgOrigin.Width := Self.imgOrigin.Width
            + AWidthDistance;
  Self.imgOrigin.Height := Self.imgOrigin.Height
            + AHeightDistance;

  Self.sbClient.Prop.ContentWidth:=Self.sbClient.Prop.ContentWidth
            + AWidthDistance;
  Self.sbClient.Prop.ContentHeight:=Self.sbClient.Prop.ContentHeight
            + AHeightDistance;

end;

end.

