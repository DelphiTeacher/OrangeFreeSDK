unit ListItemStyle_IconCaptionLeft_NotifyNumberRight;

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
  TFrameListItemStyle_IconCaptionLeft_NotifyNumberRight = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    lblItemCaption: TSkinWinLabel;
    imgItemIcon: TSkinWinImage;
    nniItemDetail: TSkinWinNotifyNumberIcon;
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

function TFrameListItemStyle_IconCaptionLeft_NotifyNumberRight.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;

procedure TFrameListItemStyle_IconCaptionLeft_NotifyNumberRight.lblItemCaptionMouseEnter(Sender: TObject);
begin
  //
end;

procedure TFrameListItemStyle_IconCaptionLeft_NotifyNumberRight.ItemDesignerPanelResize(
  Sender: TObject);
begin
  nniItemDetail.Top:=(Self.ItemDesignerPanel.Height-nniItemDetail.Height) div 2;
end;

initialization
  RegisterListItemStyle('IconCaptionLeft_NotifyNumberRight',TFrameListItemStyle_IconCaptionLeft_NotifyNumberRight);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_IconCaptionLeft_NotifyNumberRight);

end.
