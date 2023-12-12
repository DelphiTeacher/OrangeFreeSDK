unit ListItemStyle_MessageHintCard2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,
  EasyServiceCommonMaterialDataMoudle_VCL,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinPanelType, uSkinButtonType;

type
  TFrameListItemStyle_MessageHintCard2 = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
    SkinWinLabel1: TSkinWinLabel;
    SkinWinPanel1: TSkinWinPanel;
    SkinWinLabel3: TSkinWinLabel;
    SkinWinLabel4: TSkinWinLabel;
    SkinWinLabel5: TSkinWinLabel;
    SkinWinLabel6: TSkinWinLabel;
    SkinWinLabel7: TSkinWinLabel;
    SkinWinLabel8: TSkinWinLabel;
    SkinWinLabel9: TSkinWinLabel;
    SkinWinButton1: TSkinWinButton;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_MessageHintCard }

function TFrameListItemStyle_MessageHintCard2.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('MessageHintCard2',TFrameListItemStyle_MessageHintCard2);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_MessageHintCard2);

end.
