unit ListItemStyle_VertSelectedGray_CaptionLeft;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinPanelType;

type
  TFrameListItemStyle_VertSelectedGray_CaptionLeft = class(TFrame,IFrameBaseListItemStyle)
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

{ TFrameListItemStyle_VertSelectedGray_CaptionCenter }

function TFrameListItemStyle_VertSelectedGray_CaptionLeft.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('VertSelectedGray_CaptionLeft',TFrameListItemStyle_VertSelectedGray_CaptionLeft);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_VertSelectedGray_CaptionLeft);

end.
