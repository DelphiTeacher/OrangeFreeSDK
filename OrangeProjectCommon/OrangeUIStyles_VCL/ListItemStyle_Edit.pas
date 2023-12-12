unit ListItemStyle_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,
  EasyServiceCommonMaterialDataMoudle_VCL,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, Vcl.StdCtrls, uSkinWindowsEdit,
  uSkinMaterial, uSkinEditType, uSkinButtonType;

type
  TFrameListItemStyle_Edit = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    edtInput: TSkinWinEdit;
    btnShowPwd: TSkinWinButton;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_Edit }

function TFrameListItemStyle_Edit.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('Edit',TFrameListItemStyle_Edit);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_Edit);

end.
