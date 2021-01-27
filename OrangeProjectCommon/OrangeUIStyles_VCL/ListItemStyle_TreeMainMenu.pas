unit ListItemStyle_TreeMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  System.ImageList, Vcl.ImgList, uDrawPicture, uSkinImageList;

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
