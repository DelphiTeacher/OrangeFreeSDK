unit ListItemStyle_IconLeft_CaptionRight_CloseBtnRight;

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
  TFrameListItemStyle_IconLeft_CaptionRight_CloseBtnRight = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemIcon: TSkinWinImage;
    imgItemCaption: TSkinWinLabel;
    imgRefresh: TSkinWinImage;
    imglistDelete: TSkinImageList;
    btnDelete: TSkinWinButton;
    lblItemDetail: TSkinWinLabel;
    chkSelected: TSkinWinCheckBox;
    lblItemDetail1: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_IconLeft_CaptionRight_CloseBtnRight }

function TFrameListItemStyle_IconLeft_CaptionRight_CloseBtnRight.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('IconLeft_CaptionRight_CloseBtnRight',TFrameListItemStyle_IconLeft_CaptionRight_CloseBtnRight);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_IconLeft_CaptionRight_CloseBtnRight);

end.
