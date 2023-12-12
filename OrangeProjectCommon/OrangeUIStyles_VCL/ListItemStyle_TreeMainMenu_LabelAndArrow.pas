unit ListItemStyle_TreeMainMenu_LabelAndArrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList;

type
  TFrameListItemStyle_TreeMainMenu_LabelAndArrow = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
    imgItemExpanded: TSkinWinImage;
    SkinImageList1: TSkinImageList;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TreeMainMenu_LabelAndArrow }

function TFrameListItemStyle_TreeMainMenu_LabelAndArrow.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('TreeMainMenu_LabelAndArrow',TFrameListItemStyle_TreeMainMenu_LabelAndArrow);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TreeMainMenu_LabelAndArrow);

end.
