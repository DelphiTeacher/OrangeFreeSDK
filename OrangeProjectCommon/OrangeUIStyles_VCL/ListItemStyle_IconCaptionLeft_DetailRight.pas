unit ListItemStyle_IconCaptionLeft_DetailRight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,
  EasyServiceCommonMaterialDataMoudle_VCL,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinButtonType, uSkinCheckBoxType;

type
  TFrameListItemStyle_IconCaptionLeft_DetailRight = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemIcon: TSkinWinImage;
    imgItemCaption: TSkinWinLabel;
    imgRefresh: TSkinWinImage;
    imglistDelete: TSkinImageList;
    btnDelete: TSkinWinButton;
    lblDetail: TSkinWinLabel;
    chkSelected: TSkinWinCheckBox;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_IconCaptionLeft_DetailRight }

function TFrameListItemStyle_IconCaptionLeft_DetailRight.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('IconCaptionLeft_DetailRight',TFrameListItemStyle_IconCaptionLeft_DetailRight);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_IconCaptionLeft_DetailRight);

end.
