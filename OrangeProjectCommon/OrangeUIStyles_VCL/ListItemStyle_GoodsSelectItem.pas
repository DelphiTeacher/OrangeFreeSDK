unit ListItemStyle_GoodsSelectItem;

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
  TFrameListItemStyle_GoodsSelectItem = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgPic: TSkinWinImage;
    labCaption: TSkinWinLabel;
    labUnit: TSkinWinLabel;
    labCreateTime: TSkinWinLabel;
    chkCheck: TSkinWinCheckBox;
    labSpecs: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_GoodsSelectItem }

function TFrameListItemStyle_GoodsSelectItem.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('GoodsSelectItem',TFrameListItemStyle_GoodsSelectItem);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_GoodsSelectItem);

end.
