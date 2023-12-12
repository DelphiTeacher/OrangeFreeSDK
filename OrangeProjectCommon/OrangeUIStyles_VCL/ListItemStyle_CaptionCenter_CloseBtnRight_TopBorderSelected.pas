unit ListItemStyle_CaptionCenter_CloseBtnRight_TopBorderSelected;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,
  EasyServiceCommonMaterialDataMoudle_VCL,


  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinButtonType, uSkinCheckBoxType,
  uSkinPanelType;

type
  TFrameListItemStyle_CaptionCenter_CloseBtnRight_TopBorderSelected = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
    imglistDelete: TSkinImageList;
    btnDelete: TSkinWinButton;
    pnlSelectedBorderTop: TSkinWinPanel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_CaptionCenter_CloseBtnRight_TopBorderSelected }

function TFrameListItemStyle_CaptionCenter_CloseBtnRight_TopBorderSelected.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('CaptionCenter_CloseBtnRight_TopBorderSelected',TFrameListItemStyle_CaptionCenter_CloseBtnRight_TopBorderSelected);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CaptionCenter_CloseBtnRight_TopBorderSelected);

end.
