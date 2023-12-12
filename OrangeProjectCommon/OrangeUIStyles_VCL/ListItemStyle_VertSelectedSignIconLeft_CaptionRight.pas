unit ListItemStyle_VertSelectedSignIconLeft_CaptionRight;

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
  TFrameListItemStyle_VertSelectedSignIconLeft_CaptionRight = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
    pnlVertSelectedSign: TSkinWinPanel;
    imgItemIcon: TSkinWinImage;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_VertSelectedSignIconLeft_CaptionRight }

function TFrameListItemStyle_VertSelectedSignIconLeft_CaptionRight.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('VertSelectedSignIconLeft_CaptionRight',TFrameListItemStyle_VertSelectedSignIconLeft_CaptionRight);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_VertSelectedSignIconLeft_CaptionRight);

end.
