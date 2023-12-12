unit ListItemStyle_CustomerTag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,
  PngImage,
  System.Types,
  uGraphicCommon,


//  XSuperObject,
//  {$IF CompilerVersion <= 21.0} // XE or older
//  //Delphi2010²»ÄÜÓÃXSuperObject
//  SuperObject,
//  superobjecthelper,
//  {$ELSE}
//    {$IFDEF SKIN_SUPEROBJECT}
//    uSkinSuperObject,
//    {$ELSE}
//    XSuperObject,
//    XSuperJson,
//    {$ENDIF}
//  {$IFEND}
//
//
////  uSkinVirtualListType,
//  uSkinItemJsonHelper,
  uDrawTextParam,
  Math,
  uSkinBufferBitmap,
  uDrawCanvas,
//  EasyServiceCommonMaterialDataMoudle_VCL,
  uSkinListViewType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinPanelType, uSkinButtonType;

type
  TFrameListItemStyle_CustomerTag = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    btnChat: TSkinWinButton;
    lblCaption: TSkinWinLabel;
    imglistDelete: TSkinImageList;
    btnDelete: TSkinWinButton;
    procedure ItemDesignerPanelPrepareDrawItem(Sender: TObject;
      ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
      AItem: TSkinItem; AItemDrawRect: TRectF);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;




implementation

{$R *.dfm}



{ TFrameListItemStyle_CustomerTag }

function TFrameListItemStyle_CustomerTag.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


procedure TFrameListItemStyle_CustomerTag.ItemDesignerPanelPrepareDrawItem(
  Sender: TObject; ACanvas: TDrawCanvas;
  AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
  AItemDrawRect: TRectF);
begin
//  AItemDesignerPanel.Material.BackColor.BorderColor.Color:=AItem.Color;
  AItemDesignerPanel.Material.BackColor.BorderColor.Color:=AItem.Color;
  AItemDesignerPanel.Material.BackColor.IsFill:=False;
  lblCaption.Material.DrawCaptionParam.FontColor:=AItem.Color;
end;

initialization
  RegisterListItemStyle('CustomerTag',TFrameListItemStyle_CustomerTag);


finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CustomerTag);

end.
