unit ListItemStyle_HorzSelectedSignBottom_CaptionCenter;

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
  TFrameListItemStyle_HorzSelectedSignBottom_CaptionCenter = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
    pnlVertSelectedSign: TSkinWinPanel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_HorzSelectedSignBottom_CaptionCenter }

function TFrameListItemStyle_HorzSelectedSignBottom_CaptionCenter.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('HorzSelectedSignBottom_CaptionCenter',TFrameListItemStyle_HorzSelectedSignBottom_CaptionCenter);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_HorzSelectedSignBottom_CaptionCenter);

end.
