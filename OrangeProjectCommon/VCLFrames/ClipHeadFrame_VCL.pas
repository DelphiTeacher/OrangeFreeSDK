//convert pas to utf8 by ¥
unit ClipHeadFrame_VCL;

interface
{$I FrameWork.inc}

uses
  SysUtils, Types, //UITypes,
  Classes, Variants,
  uSkinBufferBitmap,
  uDrawCanvas,
  uUIFunction,
  uFrameContext,
  uBaseLog,
  uSkinGdiPlus,
  uGraphicCommon,
  uSkinPicture,
  Math,
  uDrawEngine,
  uGDIPlusDrawCanvas,
  uSkinControlGestureManager,
//  EasyServiceCommonMaterialDataMoudle,
  uDrawPictureParam,
  EasyServiceCommonMaterialDataMoudle_VCL,

  //Types,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  uSkinButtonType, uSkinPanelType, uSkinRoundImageType, uSkinImageType,
  uSkinScrollBoxContentType, //Classes,
//  Controls,
  uSkinWindowsControl,
  uSkinScrollControlType, uSkinScrollBoxType;



type
  TFrameClipHead = class(TFrame)
    pnlToolBar: TSkinWinPanel;
    btnOK: TSkinWinButton;
    btnReturn: TSkinWinButton;
    btnTestZoom: TSkinWinButton;
    sbClient: TSkinWinScrollControl;
    btnMin: TSkinWinButton;
    imgOrigin: TSkinWinImage;
    procedure btnOKClick(Sender: TObject);
    procedure btnTestZoomClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure sbClientPaintContent(ACanvas: TDrawCanvas;
      const ADrawRect: TRectF);
    procedure btnMinClick(Sender: TObject);
  private
    FInitPictureSize:TSizeF;

    //头像尺寸，比例
    FHeadWidth:Integer;
    FHeadHeight:Integer;

//    FLastZoomDistance: Integer;
    //设置缩放像素
    procedure SetZoomDistance(AWidthDistance:Integer);
    //中间正方形
    function GetCenterRect:TRect;
    { Private declarations }
  public
    procedure Init(ASkinPicture:TSkinPicture;
                    const AHeadWidth,AHeadHigth:Integer);
//    procedure DoGesture(Sender: TObject;
//                        const EventInfo: TGestureEventInfo;
//                        var Handled: Boolean);
    function GetClipBitmap:TSkinPicture;
  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;



var
  GlobalClipHeadFrame:TFrameClipHead;

implementation

{$R *.dfm}

//uses
//  MainForm;

{ TFrameClipPicture }

procedure TFrameClipHead.btnMinClick(Sender: TObject);
begin
  //测试缩放50个像素
  Self.SetZoomDistance(-50);
end;

procedure TFrameClipHead.btnOKClick(Sender: TObject);
begin
  HideFrame(Self);
  ReturnFrame(Self);
end;

procedure TFrameClipHead.btnReturnClick(Sender: TObject);
begin
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  HideFrame(Self);
  ReturnFrame(Self);
end;

procedure TFrameClipHead.btnTestZoomClick(Sender: TObject);
begin
  //测试缩放50个像素
  Self.SetZoomDistance(50);
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

//procedure TFrameClipHead.DoGesture(Sender: TObject;
//  const EventInfo: TGestureEventInfo;
//  var Handled: Boolean);
////var
////  AWidthDistance:Double;
////  AHeightDistance:Double;
//begin
////  uBaseLog.HandleException(nil,'OrangeUI TFrameClipHead.imgOriginGesture');
////
////  if EventInfo.GestureID = igiZoom then
////  begin
////
////      //缩放开始
////      if (TInteractiveGestureFlag.gfBegin in EventInfo.Flags) then
////      begin
////        uBaseLog.HandleException(nil,'OrangeUI TFrameClipHead.imgOriginGesture Begin');
////        ZoomingHorzGestureManager:=Self.sbClient.Prop.HorzControlGestureManager;
////        ZoomingVertGestureManager:=Self.sbClient.Prop.VertControlGestureManager;
////      end;
////
////
//////      LObj := Self.ObjectAtPoint(Application.MainForm.ClientToScreen(EventInfo.Location));
//////      if LObj is TSkinWinImage then
//////      begin
////          if (not (TInteractiveGestureFlag.gfBegin in EventInfo.Flags)) and
////            (not (TInteractiveGestureFlag.gfEnd in EventInfo.Flags)) then
////          begin
////            { zoom the image }
////
////            AWidthDistance:=(EventInfo.Distance - FLastZoomDistance);
////
////            SetZoomDistance(AWidthDistance);
////          end;
////          FLastZoomDistance := EventInfo.Distance;
//////      end;
////
////
////      //缩放结束
////      if (TInteractiveGestureFlag.gfEnd in EventInfo.Flags) then
////      begin
////        uBaseLog.HandleException(nil,'OrangeUI TFrameClipHead.imgOriginGesture End');
////
////        //不能小于初始宽度
////        if Self.imgOrigin.Width<FInitPictureSize.{$IFDEF FMX}Width{$ENDIF}{$IFDEF VCL}cy{$ENDIF} then
////        begin
////          AWidthDistance:=FInitPictureSize.{$IFDEF FMX}Width{$ENDIF}{$IFDEF VCL}cy{$ENDIF}-Self.imgOrigin.Width;
////          SetZoomDistance(AWidthDistance);
////        end;
////
////      end;
////
////
////
////      Handled:=True;
////  end;
//end;

function TFrameClipHead.GetCenterRect: TRect;
var
  AClipSize:Integer;
begin

  //不超过宽度或者高度,让这个矩形显示得下
  if Self.sbClient.Width>Self.sbClient.Height then
  begin
    AClipSize:=Self.sbClient.Height;
  end
  else
  begin
    AClipSize:=Self.sbClient.Width;
  end;

//  AClipSize:=AClipSize-20;//边上空出来一点
  AClipSize:=AClipSize;

  Result:=Rect(
              (Self.sbClient.Width-AClipSize) div 2,
              (Self.sbClient.Height-AClipSize) div 2,
              (Self.sbClient.Width-AClipSize) div 2+AClipSize,
              (Self.sbClient.Height-AClipSize) div 2+AClipSize
              );


end;

function TFrameClipHead.GetClipBitmap: TSkinPicture;
var
  ADrawCanvas:TDrawCanvas;
  ACenterRect:TRect;
begin

  ACenterRect:=Self.GetCenterRect;


  Result:=TSkinPicture.Create;
  Result.SetSize(ACenterRect.Right-ACenterRect.Left,ACenterRect.Bottom-ACenterRect.Top);


  {$IFDEF VCL}
  ADrawCanvas:=CreateDrawCanvas('');
  ADrawCanvas.Prepare(Result.Canvas);
  try
      ADrawCanvas.DrawPicture(
                            Self.imgOrigin.Material.DrawPictureParam,
                            Self.imgOrigin.Properties.Picture,
                            RectF(-Self.sbClient.Prop.HorzControlGestureManager.Position,
                                  -Self.sbClient.Prop.VertControlGestureManager.Position,
                                  -Self.sbClient.Prop.HorzControlGestureManager.Position+Self.sbClient.Prop.ContentWidth,
                                  -Self.sbClient.Prop.VertControlGestureManager.Position+Self.sbClient.Prop.ContentHeight)
                            );

    //    Result.SaveToFile('C:\bb.jpg');
  finally
    ADrawCanvas.UnPrepare;
    FreeAndNil(ADrawCanvas);
  end;
  {$ENDIF}



  {$IFDEF FMX}
  Result.Canvas.BeginScene();
  try
    Result.Canvas.Clear(0);
    Result.Canvas.DrawBitmap(Self.imgOrigin.Prop.Picture,
                            RectF(ALeftOffset*AZoomScale,
                                  ATopOffset*AZoomScale,
                                  (ALeftOffset+FHeadWidth)*AZoomScale,
                                  (ATopOffset+FHeadHeight)*AZoomScale),
                            RectF(0,0,FHeadWidth,FHeadHeight),
                            1);
//    Result.SaveToFile('C:\bb.jpg');
  finally
    Result.Canvas.EndScene;
  end;
  {$ENDIF}

end;

procedure TFrameClipHead.Init(ASkinPicture: TSkinPicture;const AHeadWidth,AHeadHigth:Integer);
begin
  FHeadWidth:=AHeadWidth;
  FHeadHeight:=AHeadHigth;

  Self.imgOrigin.Prop.Picture.Assign(ASkinPicture);



  //计算最合适的显示尺寸
  FInitPictureSize:=AutoFillPictureDrawRect(Self.imgOrigin.Prop.Picture.Width,
                                            Self.imgOrigin.Prop.Picture.Height,
                                            Self.sbClient.Width,
                                            Self.sbClient.Height);




  Self.imgOrigin.Align:=TAlignLayout.{$IFDEF FMX}None{$ENDIF}{$IFDEF VCL}alNone{$ENDIF};
  //Image控件的尺寸为图片的尺寸
  Self.imgOrigin.Width:=Ceil(FInitPictureSize.{$IFDEF FMX}Width{$ENDIF}{$IFDEF VCL}cx{$ENDIF});
  Self.imgOrigin.Height:=Ceil(FInitPictureSize.{$IFDEF FMX}Height{$ENDIF}{$IFDEF VCL}cy{$ENDIF});


  //ScrollBox的内容尺寸,
  Self.sbClient.Prop.ContentWidth:=Self.imgOrigin.Width
                                    +Self.GetCenterRect.Left*2//空出的可以移动的区域
                                    ;


  Self.sbClient.Prop.ContentHeight:=Self.imgOrigin.Height
                                    +Self.GetCenterRect.Top*2//空出的可以移动的区域
                                    ;


end;

procedure TFrameClipHead.sbClientPaintContent(ACanvas: TDrawCanvas;
  const ADrawRect: TRectF);
var
  AGDIPlusDrawCanvas:TGDIPlusDrawCanvas;
  ARegion:IGPRegion;
//  APen: IGPPen;
  ABrush: IGPBrush;
  APath: IGPGraphicsPath;
  AGPColor:TGPColor;
  ACenterRect:TRect;
begin
  ACenterRect:=GetCenterRect;


  //引用uDrawCanvas
  //绘制图片
  ACanvas.DrawPicture(
                      Self.imgOrigin.Material.DrawPictureParam,
                      Self.imgOrigin.Properties.Picture,
                      RectF(-Self.sbClient.Prop.HorzControlGestureManager.Position+ACenterRect.Left,
                            -Self.sbClient.Prop.VertControlGestureManager.Position+ACenterRect.Top,
                            -Self.sbClient.Prop.HorzControlGestureManager.Position+ACenterRect.Left+Self.sbClient.Prop.ContentWidth,
                            -Self.sbClient.Prop.VertControlGestureManager.Position+ACenterRect.Top+Self.sbClient.Prop.ContentHeight)
                      );

  //再画上中空的矩形
  AGDIPlusDrawCanvas:=TGDIPlusDrawCanvas(ACanvas);

  AGPColor:=TGPColor_CreateFromColorRef(clGray);
//  APen:=TGPPen.Create(AGPColor);
  TGPColor_SetAlpha(AGPColor.FArgb,180);



  //中间的圆形
  APath:=TGPGraphicsPath.Create;
  APath.AddEllipse(ACenterRect.Left,ACenterRect.Top,ACenterRect.Right-ACenterRect.Left,ACenterRect.Bottom-ACenterRect.Top);


  ARegion:=TGPRegion.Create(TGPRectF_Create(0,0,Self.sbClient.Width,Self.sbClient.Height));
  //去掉中间的矩形
//  ARegion.Exclude(TGPRectF_Create(ACenterRect));
  //去掉中间的圆形
  ARegion.Exclude(APath);


  AGDIPlusDrawCanvas.FGraphics.SetClip(ARegion);
  try

    ABrush:=TGPSolidBrush.Create(AGPColor);

    //AGDIPlusDrawCanvas.FGraphics.DrawPath(APen,APath);
    AGDIPlusDrawCanvas.FGraphics.FillRectangle(ABrush,TGPRectF_Create(Rect(0,0,Self.sbClient.Width,Self.sbClient.Height)));

  finally
    AGDIPlusDrawCanvas.FGraphics.ReSetClip;
  end;

end;

procedure TFrameClipHead.SetZoomDistance(AWidthDistance: Integer);
var
  AHeightDistance:Integer;
begin


  //保持比例
  AHeightDistance:=Ceil(AWidthDistance*Self.imgOrigin.Prop.Picture.Height/Self.imgOrigin.Prop.Picture.Width);

  if (Self.sbClient.Prop.ContentWidth + AWidthDistance>=Self.sbClient.Width)
    and (Self.sbClient.Prop.ContentHeight + AHeightDistance>=Self.sbClient.Height) then
  begin

  //  Self.imgOrigin.Width := Self.imgOrigin.Width + AWidthDistance;
  //  Self.imgOrigin.Height := Self.imgOrigin.Height + AHeightDistance;

    Self.sbClient.Prop.ContentWidth:=Self.sbClient.Prop.ContentWidth + AWidthDistance;
    Self.sbClient.Prop.ContentHeight:=Self.sbClient.Prop.ContentHeight + AHeightDistance;

  end;
end;

end.
