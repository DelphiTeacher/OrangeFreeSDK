unit ListItemStyle_CaptionTopDetailBottom_Summary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinMaterial, uSkinPanelType;

type
  TFrameListItemStyle_CaptionTopDetailBottom_Summary = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    lblItemCaption: TSkinWinLabel;
    SkinWinPanel1: TSkinWinPanel;
    lblDetail: TSkinWinLabel;
    lblDetail1: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_CaptionTopDetailBottom_Summary }

function TFrameListItemStyle_CaptionTopDetailBottom_Summary.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('CaptionTopDetailBottom_Summary',TFrameListItemStyle_CaptionTopDetailBottom_Summary);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CaptionTopDetailBottom_Summary);

end.
