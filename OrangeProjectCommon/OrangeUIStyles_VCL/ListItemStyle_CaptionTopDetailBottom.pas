unit ListItemStyle_CaptionTopDetailBottom;

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
  TFrameListItemStyle_CaptionTopDetailBottom = class(TFrame,IFrameBaseListItemStyle)
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

{ TFrameListItemStyle_CaptionTopDetailBottom }

function TFrameListItemStyle_CaptionTopDetailBottom.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('CaptionTopDetailBottom',TFrameListItemStyle_CaptionTopDetailBottom);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CaptionTopDetailBottom);

end.
