unit ListItemStyle_IconLeft_CaptionRight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinButtonType;

type
  TFrameListItemStyle_IconLeft_CaptionRight = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemIcon: TSkinWinImage;
    imgItemCaption: TSkinWinLabel;
    imgRefresh: TSkinWinImage;
    imglistDelete: TSkinImageList;
    btnDelete: TSkinWinButton;
    procedure imgItemCaptionMouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_IconLeft_CaptionRight }

function TFrameListItemStyle_IconLeft_CaptionRight.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


procedure TFrameListItemStyle_IconLeft_CaptionRight.imgItemCaptionMouseEnter(
  Sender: TObject);
begin
  //
end;

initialization
  RegisterListItemStyle('IconLeft_CaptionRight',TFrameListItemStyle_IconLeft_CaptionRight);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_IconLeft_CaptionRight);

end.
