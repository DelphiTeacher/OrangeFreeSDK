unit ListItemStyle_TreeParentNode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinButtonType;

type
  TFrameListItemStyle_TreeParentNode = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
    btnExpand: TSkinWinButton;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TreeParentNode }

function TFrameListItemStyle_TreeParentNode.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('TreeParentNode',TFrameListItemStyle_TreeParentNode);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TreeParentNode);

end.
