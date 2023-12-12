unit ListItemStyle_IconTop_CaptionDetailBottom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType;

type
  TFrameListItemStyle_IconTop_CaptionDetailBottom = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemIcon: TSkinWinImage;
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

{ TFrameListItemStyle_IconTop_CaptionDetailBottom }

function TFrameListItemStyle_IconTop_CaptionDetailBottom.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('IconTop_CaptionDetailBottom',TFrameListItemStyle_IconTop_CaptionDetailBottom);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_IconTop_CaptionDetailBottom);

end.
