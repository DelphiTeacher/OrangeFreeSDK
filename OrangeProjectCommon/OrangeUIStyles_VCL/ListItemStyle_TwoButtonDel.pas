unit ListItemStyle_TwoButtonDel;

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
  uSkinButtonType;

type
  TFrameListItemStyle_TwoButtonDel = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    btnButton1: TSkinWinButton;
    btnButton2: TSkinWinButton;
    procedure btnButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TwoButtonDel }

procedure TFrameListItemStyle_TwoButtonDel.btnButton1Click(Sender: TObject);
begin
  //
end;

function TFrameListItemStyle_TwoButtonDel.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('TwoButtonDel',TFrameListItemStyle_TwoButtonDel);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TwoButtonDel);

end.
