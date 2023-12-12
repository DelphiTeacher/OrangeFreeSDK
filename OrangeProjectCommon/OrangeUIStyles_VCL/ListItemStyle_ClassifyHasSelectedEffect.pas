unit ListItemStyle_ClassifyHasSelectedEffect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList;

type
  TFrameListItemStyle_ClassifyHasSelectedEffect = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_ClassifyHasSelectedEffect }

function TFrameListItemStyle_ClassifyHasSelectedEffect.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('ClassifyHasSelectedEffect',TFrameListItemStyle_ClassifyHasSelectedEffect);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_ClassifyHasSelectedEffect);

end.
