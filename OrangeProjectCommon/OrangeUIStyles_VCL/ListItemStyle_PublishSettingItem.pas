unit ListItemStyle_PublishSettingItem;

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
  TFrameListItemStyle_PublishSettingItem = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgPic: TSkinWinImage;
    labItemName: TSkinWinLabel;
    chkCheck: TSkinWinCheckBox;
    imgOnline: TSkinWinImage;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_PublishSettingItem }

function TFrameListItemStyle_PublishSettingItem.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('PublishSettingItem',TFrameListItemStyle_PublishSettingItem);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_PublishSettingItem);

end.
