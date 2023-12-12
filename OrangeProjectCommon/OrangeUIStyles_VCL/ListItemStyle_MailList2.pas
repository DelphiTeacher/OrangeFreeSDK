unit ListItemStyle_MailList2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,
  PngImage,
//  EasyServiceCommonMaterialDataMoudle_VCL,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinPanelType, uSkinButtonType;

type
  TFrameListItemStyle_MailList2 = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    SkinWinImage1: TSkinWinImage;
    SkinWinPanel1: TSkinWinPanel;
    SkinWinPanel2: TSkinWinPanel;
    SkinWinPanel3: TSkinWinPanel;
    SkinWinLabel1: TSkinWinLabel;
    SkinWinLabel2: TSkinWinLabel;
    SkinWinLabel3: TSkinWinLabel;
    SkinWinLabel4: TSkinWinLabel;
    btnMenu: TSkinWinButton;
    btnChat: TSkinWinButton;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_MailList }

function TFrameListItemStyle_MailList2.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('MailList2',TFrameListItemStyle_MailList2);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_MailList2);

end.
