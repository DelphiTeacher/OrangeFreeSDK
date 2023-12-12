unit ListItemStyle_CaptionSelectedMark;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes,

  Types,
  uSkinItems,
  uDrawCanvas,
  uGraphicCommon,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinButtonType,
  uSkinNotifyNumberIconType;

type
  TFrameListItemStyle_CaptionSelectedMark = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    lblItemCaption: TSkinWinLabel;
    imglistBlackArrow: TSkinImageList;
    imgSelectedMark: TSkinWinImage;
    procedure lblItemCaptionMouseEnter(Sender: TObject);
    procedure ItemDesignerPanelResize(Sender: TObject);
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

{ TFrameListItemStyle_IconCaptionLeft_NotifyNumberIconRight }

function TFrameListItemStyle_CaptionSelectedMark.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;

procedure TFrameListItemStyle_CaptionSelectedMark.lblItemCaptionMouseEnter(Sender: TObject);
begin
  //
end;

procedure TFrameListItemStyle_CaptionSelectedMark.ItemDesignerPanelPrepareDrawItem(
  Sender: TObject; ACanvas: TDrawCanvas;
  AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
  AItemDrawRect: TRectF);
begin
  imgSelectedMark.Visible:=AItem.Selected;
end;

procedure TFrameListItemStyle_CaptionSelectedMark.ItemDesignerPanelResize(
  Sender: TObject);
begin
//  nniItemDetail.Top:=(Self.ItemDesignerPanel.Height-nniItemDetail.Height) div 2;
end;



initialization
  RegisterListItemStyle('CaptionSelectedMark',TFrameListItemStyle_CaptionSelectedMark);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CaptionSelectedMark);

end.
