unit ListItemStyle_IconCaptionLeft_ArrowRight;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinButtonType,
  uSkinNotifyNumberIconType;

type
  TFrameListItemStyle_IconCaptionLeft_ArrowRight = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    lblItemCaption: TSkinWinLabel;
    imgItemIcon: TSkinWinImage;
    imgArrow: TSkinWinImage;
    imglistWhiteArrow: TSkinImageList;
    imglistBlackArrow: TSkinImageList;
    procedure lblItemCaptionMouseEnter(Sender: TObject);
    procedure ItemDesignerPanelResize(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;


implementation


{$R *.dfm}

{ TFrameListItemStyle_IconCaptionLeft_NotifyNumberIconRight }

function TFrameListItemStyle_IconCaptionLeft_ArrowRight.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;

procedure TFrameListItemStyle_IconCaptionLeft_ArrowRight.lblItemCaptionMouseEnter(Sender: TObject);
begin
  //
end;

procedure TFrameListItemStyle_IconCaptionLeft_ArrowRight.ItemDesignerPanelResize(
  Sender: TObject);
begin
//  nniItemDetail.Top:=(Self.ItemDesignerPanel.Height-nniItemDetail.Height) div 2;
end;



initialization
  RegisterListItemStyle('IconCaptionLeft_ArrowRight',TFrameListItemStyle_IconCaptionLeft_ArrowRight);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_IconCaptionLeft_ArrowRight);

end.
