unit ListItemStyle_CaptionCenter_SelectedWhiteBackThemeFont;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinMaterial;

type
  TFrameListItemStyle_CaptionCenter_SelectedWhiteBackThemeFont = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    lblItemCaption: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_Caption }

function TFrameListItemStyle_CaptionCenter_SelectedWhiteBackThemeFont.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('CaptionCenter_SelectedWhiteBackThemeFont',TFrameListItemStyle_CaptionCenter_SelectedWhiteBackThemeFont);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CaptionCenter_SelectedWhiteBackThemeFont);

end.
