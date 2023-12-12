unit ListItemStyle_CheckBoxIconLeft_CaptionRight;

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
  TFrameListItemStyle_CheckBoxIconLeft_CaptionRight = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemIcon: TSkinWinImage;
    imgItemCaption: TSkinWinLabel;
    imgRefresh: TSkinWinImage;
    imglistDelete: TSkinImageList;
    btnDelete: TSkinWinButton;
    chkSelected: TSkinWinCheckBox;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_CheckBoxIconLeft_CaptionRight }

function TFrameListItemStyle_CheckBoxIconLeft_CaptionRight.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('CheckBoxIconLeft_CaptionRight',TFrameListItemStyle_CheckBoxIconLeft_CaptionRight);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CheckBoxIconLeft_CaptionRight);

end.
