unit uVCLSVGSupport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Winapi.GDIPOBJ
  , Winapi.GDIPAPI
  , SVGTypes,
    SVG,
    uSkinWindowsControl,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  uSkinPicture,
  Types,
  UITypes,
  uDrawPictureParam,
  Math,
  uDrawCanvas,
  uDrawPicture, uSkinImageType;


function CreateSVGObject(Sender:TObject;ASVGStream:TStream):TObject;
procedure DrawSVGImage(ADrawCanvas:TDrawCanvas;ASkinPicture:TSkinPicture;ADrawPictureParam:TDrawPictureParam;ASVGObject:TObject;ADrawRect:TRectF;
                            const AIsUseSrcRectAndDestDrawRect:Boolean;
                            const AImageSrcRect:TRectF;
                            const AImageDestDrawRect:TRectF;
                            AOwnerDrawPicture:TBaseDrawPicture);


implementation

function CreateSVGObject(Sender:TObject;ASVGStream:TStream):TObject;
begin
  Result:=TSVG.Create;
  TSVG(Result).LoadFromStream(ASVGStream);
end;

procedure DrawSVGImage(ADrawCanvas:TDrawCanvas;ASkinPicture:TSkinPicture;ADrawPictureParam:TDrawPictureParam;ASVGObject:TObject;ADrawRect:TRectF;
                            const AIsUseSrcRectAndDestDrawRect:Boolean;
                            const AImageSrcRect:TRectF;
                            const AImageDestDrawRect:TRectF;
                            AOwnerDrawPicture:TBaseDrawPicture);
var
  GPRectF: TGPRectF;
//  RectArray: TRectarray;
begin

  GPRectF.X := AImageDestDrawRect.Left;
  GPRectF.Y := AImageDestDrawRect.Top;
  GPRectF.Width := AImageDestDrawRect.Width;
  GPRectF.Height := AImageDestDrawRect.Height;

  TSVG(ASVGObject).SetBounds(GPRectF);

//  RectArray := TRectArray.Create(TRect.Create(0, 0, ABitmap.Width, ABitmap.Height));
//  RectArray := TRectArray.Create(TRect.Create(Ceil(ADrawRect.Left), Ceil(ADrawRect.Top), Ceil(ADrawRect.Width), Ceil(ADrawRect.Height)));
//  RectArray := TRectArray.Create(TRect.Create(0,0, Ceil(ADrawRect.Width), Ceil(ADrawRect.Height)));
//  RectArray := TRectArray.Create(TRect.Create(0,0, 50, 50));

  if ADrawPictureParam.CurrentEffectFixedColor.Color<>TColors.sysDefault then
  begin
    TSVG(ASVGObject).FixedColor:=ADrawPictureParam.CurrentEffectFixedColor.Color;
  end
  else
  begin
    TSVG(ASVGObject).FixedColor:=AOwnerDrawPicture.FixedColor.Color;
  end;

  TSVG(ASVGObject).PaintTo(ADrawCanvas.FHandle,GPRectF,nil,0);



end;

initialization
  GlobalOnCreateSVGObject:=CreateSVGObject;
  GlobalOnDrawSVGImage:=DrawSVGImage;

end.
