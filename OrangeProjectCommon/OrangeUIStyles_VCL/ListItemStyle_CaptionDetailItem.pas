unit ListItemStyle_CaptionDetailItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinMaterial;

type
  TFrameListItemStyle_CaptionDetailItem = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    lblItemCaption: TSkinWinLabel;
    lblItemDetail: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_CaptionDetailItem }

function TFrameListItemStyle_CaptionDetailItem.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('CaptionDetailItem',TFrameListItemStyle_CaptionDetailItem);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CaptionDetailItem);

end.
