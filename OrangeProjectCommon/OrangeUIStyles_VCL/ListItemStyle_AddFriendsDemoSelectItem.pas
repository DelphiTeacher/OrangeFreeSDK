unit ListItemStyle_AddFriendsDemoSelectItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinButtonType, Vcl.StdCtrls,
  uSkinCheckBoxType;

type
  TFrameListItemStyle_AddFriendsDemoSelectItem = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    labCaption: TSkinWinLabel;
    chkCheck: TSkinWinCheckBox;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_AddFriendsDemoSelectItem }

function TFrameListItemStyle_AddFriendsDemoSelectItem.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('AddFriendsDemoSelectItem',TFrameListItemStyle_AddFriendsDemoSelectItem);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_AddFriendsDemoSelectItem);

end.
