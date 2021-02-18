unit ListItemStyle_TreeMainMenu;

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
  TFrameListItemStyle_TreeMainMenu = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemIcon: TSkinWinImage;
    imgItemCaption: TSkinWinLabel;
    SkinWinImage1: TSkinWinImage;
    SkinImageList1: TSkinImageList;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TreeMainMenu }

function TFrameListItemStyle_TreeMainMenu.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('TreeMainMenu',TFrameListItemStyle_TreeMainMenu);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TreeMainMenu);

end.
