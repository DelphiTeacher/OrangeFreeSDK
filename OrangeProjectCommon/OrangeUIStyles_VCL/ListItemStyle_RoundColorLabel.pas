unit ListItemStyle_RoundColorLabel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,
  PngImage,
//  EasyServiceCommonMaterialDataMoudle_VCL,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinPanelType, uSkinButtonType;

type
  TFrameListItemStyle_RoundColorLabel = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    lblItemCaption: TSkinWinLabel;
    imgBorder: TSkinWinImage;
    procedure ItemDesignerPanelResize(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_RoundColorLabel }

function TFrameListItemStyle_RoundColorLabel.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


procedure TFrameListItemStyle_RoundColorLabel.ItemDesignerPanelResize(
  Sender: TObject);
begin
  if lblItemCaption<>nil then
  begin
//    if ItemDesignerPanel.Width>ItemDesignerPanel.Height then
//    begin
//      Self.lblItemCaption.Height:=ItemDesignerPanel.Height;
//      Self.lblItemCaption.Width:=ItemDesignerPanel.Height;
//    end
//    else
//    begin
//      Self.lblItemCaption.Height:=ItemDesignerPanel.Width;
//      Self.lblItemCaption.Width:=ItemDesignerPanel.Width;
//    end;
    Self.imgBorder.Left:=(ItemDesignerPanel.Width-Self.imgBorder.Width) div 2;
    Self.imgBorder.Top:=(ItemDesignerPanel.Height-Self.imgBorder.Height) div 2+1;

    Self.lblItemCaption.Left:=(ItemDesignerPanel.Width-Self.lblItemCaption.Width) div 2;
    Self.lblItemCaption.Top:=(ItemDesignerPanel.Height-Self.lblItemCaption.Height) div 2;
  end;
end;

initialization
  RegisterListItemStyle('RoundColorLabel',TFrameListItemStyle_RoundColorLabel);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_RoundColorLabel);

end.
