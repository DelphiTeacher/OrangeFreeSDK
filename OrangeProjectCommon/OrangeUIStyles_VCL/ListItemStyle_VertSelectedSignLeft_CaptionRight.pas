unit ListItemStyle_VertSelectedSignLeft_CaptionRight;

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
  TFrameListItemStyle_VertSelectedSignLeft_CaptionRight = class(TFrame,IFrameBaseListItemStyle)
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

{ TFrameListItemStyle_VertSelectedSignLeft_CaptionRight }

function TFrameListItemStyle_VertSelectedSignLeft_CaptionRight.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('VertSelectedSignLeft_CaptionRight',TFrameListItemStyle_VertSelectedSignLeft_CaptionRight);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_VertSelectedSignLeft_CaptionRight);

end.
