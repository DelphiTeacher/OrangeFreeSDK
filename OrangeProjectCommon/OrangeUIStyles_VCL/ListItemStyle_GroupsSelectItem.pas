unit ListItemStyle_GroupsSelectItem;

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
  TFrameListItemStyle_GroupsSelectItem = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgPic: TSkinWinImage;
    labGroupName: TSkinWinLabel;
    chkCheck: TSkinWinCheckBox;
    labUserName: TSkinWinLabel;
    labWebsite: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_GroupsSelectItem }

function TFrameListItemStyle_GroupsSelectItem.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('GroupsSelectItem',TFrameListItemStyle_GroupsSelectItem);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_GroupsSelectItem);

end.
