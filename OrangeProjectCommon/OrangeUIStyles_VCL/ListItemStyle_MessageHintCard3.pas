unit ListItemStyle_MessageHintCard3;

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
  TFrameListItemStyle_MessageHintCard3 = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
    Item3: TSkinWinLabel;
    SkinWinPanel1: TSkinWinPanel;
    SkinWinLabel4: TSkinWinLabel;
    Item1: TSkinWinLabel;
    SkinWinLabel6: TSkinWinLabel;
    Item2: TSkinWinLabel;
    Icon1: TSkinWinButton;
    SkinWinLabel2: TSkinWinLabel;
    procedure Icon1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_MessageHintCard }

function TFrameListItemStyle_MessageHintCard3.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


procedure TFrameListItemStyle_MessageHintCard3.Icon1Click(Sender: TObject);
begin
   ShowMessage(Icon1.Caption);
end;

initialization
  RegisterListItemStyle('MessageHintCard3',TFrameListItemStyle_MessageHintCard3);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_MessageHintCard3);

end.
