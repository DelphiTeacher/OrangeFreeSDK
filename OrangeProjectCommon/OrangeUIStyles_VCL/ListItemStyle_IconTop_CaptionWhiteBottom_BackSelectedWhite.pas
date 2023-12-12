unit ListItemStyle_IconTop_CaptionWhiteBottom_BackSelectedWhite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType;

type
  TFrameListItemStyle_IconTop_CaptionWhiteBottom_BackSelectedWhite = class(TFrame,IFrameBaseListItemStyle)
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

{ TFrameListItemStyle_IconTop_CaptionBottom_BackSelectedWhite }

function TFrameListItemStyle_IconTop_CaptionWhiteBottom_BackSelectedWhite.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('IconTop_CaptionWhiteBottom_BackSelectedWhite',TFrameListItemStyle_IconTop_CaptionWhiteBottom_BackSelectedWhite);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_IconTop_CaptionWhiteBottom_BackSelectedWhite);

end.
