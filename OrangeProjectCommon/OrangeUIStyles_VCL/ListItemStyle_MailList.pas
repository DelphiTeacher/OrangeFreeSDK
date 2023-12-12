unit ListItemStyle_MailList;

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
  TFrameListItemStyle_MailList = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgHead: TSkinWinImage;
    pnlClient: TSkinWinPanel;
    pnlUserInfo: TSkinWinPanel;
    pnlMessageInfo: TSkinWinPanel;
    lblUserName: TSkinWinLabel;
    lblCompanyName: TSkinWinLabel;
    lblTime: TSkinWinLabel;
    lblMessage: TSkinWinLabel;
    btnMenu: TSkinWinButton;
    btnChat: TSkinWinButton;
    procedure FrameMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameListItemStyle_MailList.FrameMouseLeave(Sender: TObject);
begin

end;

{ TFrameListItemStyle_MailList }

function TFrameListItemStyle_MailList.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('MailList',TFrameListItemStyle_MailList);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_MailList);

end.
