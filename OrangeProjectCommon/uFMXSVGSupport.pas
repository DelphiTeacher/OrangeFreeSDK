unit uFMXSVGSupport;

interface

uses
  Classes,
  SysUtils,
  uSkinPicture,
  Types,
  UITypes,
  uDrawPictureParam,
  Math,
//  SVGInterfaces,
  uDrawCanvas,
  FMX.SVGIconImage,
  uFireMonkeyDrawCanvas,
//  FMX.SVGIconImageList,
  uDrawPicture, uSkinImageType;


type
  TFMXSvg=class
  public
    FSVGBitmapItem: TSVGIconFixedBitmapItem;
    constructor Create;
    destructor Destroy;override;
  end;

function CreateSVGObject(Sender:TObject;ASVGStream:TStream):TObject;
procedure DrawSVGImage(ADrawCanvas:TDrawCanvas;ASkinPicture:TSkinPicture;ADrawPictureParam:TDrawPictureParam;ASVGObject:TObject;ADrawRect:TRectF;
                            const AIsUseSrcRectAndDestDrawRect:Boolean;
                            const AImageSrcRect:TRectF;
                            const AImageDestDrawRect:TRectF;
                            AOwnerDrawPicture:TBaseDrawPicture);


implementation

function CreateSVGObject(Sender:TObject;ASVGStream:TStream):TObject;
begin
  Result:=TFMXSvg.Create;
  TFMXSvg(Result).FSVGBitmapItem.SVG.LoadFromStream(ASVGStream);
end;

procedure DrawSVGImage(ADrawCanvas:TDrawCanvas;ASkinPicture:TSkinPicture;ADrawPictureParam:TDrawPictureParam;ASVGObject:TObject;ADrawRect:TRectF;
                            const AIsUseSrcRectAndDestDrawRect:Boolean;
                            const AImageSrcRect:TRectF;
                            const AImageDestDrawRect:TRectF;
                            AOwnerDrawPicture:TBaseDrawPicture);
var
  ASVGBitmapItem: TSVGIconFixedBitmapItem;
  AFixedColor:TAlphaColor;
//  GPRectF: TGPRectF;
//  RectArray: TRectarray;
  BImageSrcRect:TRectF;
begin
  ASVGBitmapItem:=TFMXSVG(ASVGObject).FSVGBitmapItem;

  if ADrawPictureParam.CurrentEffectFixedColor.Color<>TAlphaColorRec.Null then
  begin
    AFixedColor:=ADrawPictureParam.CurrentEffectFixedColor.Color;
  end
  else
  begin
    AFixedColor:=AOwnerDrawPicture.FixedColor.Color;
  end;

  ASVGBitmapItem.SVG.FixedColor:=AFixedColor;
  //  ASVGBitmapItem.Width:=Ceil(AImageDestDrawRect.Width);
  //  ASVGBitmapItem.Height:=Ceil(AImageDestDrawRect.Height);


  //一定要乘Const_BufferBitmapScale，不然手机上会糊
  ASVGBitmapItem.SetIconSize(Ceil(AImageDestDrawRect.Width*Const_BufferBitmapScale),Ceil(AImageDestDrawRect.Height*Const_BufferBitmapScale),100);

  BImageSrcRect:=RectF(0,0,Ceil(AImageDestDrawRect.Width*Const_BufferBitmapScale),Ceil(AImageDestDrawRect.Height*Const_BufferBitmapScale));

  ADrawCanvas.FCanvas.DrawBitmap(ASVGBitmapItem.Bitmap,
                                BImageSrcRect,//AImageSrcRect,
                                AImageDestDrawRect,
                                ADrawPictureParam.DrawAlpha/255,
                                GlobalIsDrawBitmapHignSpeed);


//  ADrawCanvas.FCanvas.DrawBitmap(ASVGBitmapItem.Bitmap,
//                                  AImageSrcRect,
//                                  AImageDestDrawRect,
//                                  1
//                                  );

//  if not LSVG.IsEmpty then
//  begin
////    TFMXSVG(ASVGObject).FSVG.Opacity := ADrawPictureParam.FOpacity / 255;
//
//    if ADrawPictureParam.CurrentEffectFixedColor.Color<>TAlphaColorRec.Null then
//    begin
//      AFixedColor:=ADrawPictureParam.CurrentEffectFixedColor.Color;
//    end
//    else
//    begin
//      AFixedColor:=AOwnerDrawPicture.FixedColor;
//    end;
//
//
////    if AFixedColor <> SVG_INHERIT_COLOR then
////    begin
//      LSVG.FixedColor := AFixedColor;
////      LSVG.ApplyFixedColorToRootOnly := FApplyFixedColorToRootOnly;
////    end
////    else
////    begin
////      LSVG.FixedColor := GetInheritedFixedColor;
//////      LSVG.ApplyFixedColorToRootOnly := GetInheritedApplyToRootOnly;
////    end;
////    LSVG.GrayScale := FGrayScale;
////    if FStretch or not Assigned(FImageList) then
////    begin
////      LWidth := Width;
////      LHeight := Height;
////      LOrigin := TPointF.Create(0, 0);
////    end
////    else
////    begin
////      LWidth := FImageList.Width;
////      LHeight := FImageList.Height;
////      LOrigin := TPointF.Create(
////        (Width - LWidth) div 2, ((Height - LHeight) div 2));
////    end;
//    LSVG.PaintTo(ADrawCanvas.FCanvas.,
//      AImageDestDrawRect,//TRectF.Create(LOrigin, LWidth, LHeight),
//      True//FProportional
//      );
//    LSVG.Opacity := 1;
//  end;

//  GPRectF.X := AImageDestDrawRect.Left;
//  GPRectF.Y := AImageDestDrawRect.Top;
//  GPRectF.Width := AImageDestDrawRect.Width;
//  GPRectF.Height := AImageDestDrawRect.Height;
//
//  TSVG(ASVGObject).SetBounds(GPRectF);

//  RectArray := TRectArray.Create(TRect.Create(0, 0, ABitmap.Width, ABitmap.Height));
//  RectArray := TRectArray.Create(TRect.Create(Ceil(ADrawRect.Left), Ceil(ADrawRect.Top), Ceil(ADrawRect.Width), Ceil(ADrawRect.Height)));
//  RectArray := TRectArray.Create(TRect.Create(0,0, Ceil(ADrawRect.Width), Ceil(ADrawRect.Height)));
//  RectArray := TRectArray.Create(TRect.Create(0,0, 50, 50));

//  if ADrawPictureParam.CurrentEffectFixedColor.Color<>TColors.sysDefault then
//  begin
//    TSVG(ASVGObject).FixedColor:=ADrawPictureParam.CurrentEffectFixedColor.Color;
//  end
//  else
//  begin
//    TSVG(ASVGObject).FixedColor:=AOwnerDrawPicture.FixedColor;
//  end;
//
//  TSVG(ASVGObject).PaintTo(ADrawCanvas.FHandle,GPRectF,nil,0);



end;

{ TFMXSvg }

constructor TFMXSvg.Create;
begin
  FSVGBitmapItem:=TSVGIconFixedBitmapItem.Create(nil);
end;

destructor TFMXSvg.Destroy;
begin
  FreeAndNil(FSVGBitmapItem);
  inherited;
end;

initialization
  GlobalOnCreateSVGObject:=CreateSVGObject;
  GlobalOnDrawSVGImage:=DrawSVGImage;

end.
