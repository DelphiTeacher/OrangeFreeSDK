unit ListItemStyle_MessageHintCard;

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
  TFrameListItemStyle_MessageHintCard = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
    pnlVertSelectedSign: TSkinWinPanel;
    SkinWinLabel1: TSkinWinLabel;
    SkinWinLabel2: TSkinWinLabel;
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

function TFrameListItemStyle_MessageHintCard.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('MessageHintCard',TFrameListItemStyle_MessageHintCard);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_MessageHintCard);

end.
