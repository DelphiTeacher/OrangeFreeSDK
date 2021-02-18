unit ListItemStyle_IconTop_CaptionBottom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType;

type
  TFrameListItemStyle_IconTop_CaptionBottom = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemIcon: TSkinWinImage;
    imgItemCaption: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_IconTop_CaptionBottom }

function TFrameListItemStyle_IconTop_CaptionBottom.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('IconTop_CaptionBottom',TFrameListItemStyle_IconTop_CaptionBottom);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_IconTop_CaptionBottom);

end.
