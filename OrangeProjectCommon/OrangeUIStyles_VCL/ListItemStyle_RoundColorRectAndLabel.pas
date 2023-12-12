unit ListItemStyle_RoundColorRectAndLabel;

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
  TFrameListItemStyle_RoundColorRectAndLabel = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    lblItemCaption: TSkinWinLabel;
    procedure ItemDesignerPanelResize(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_RoundColorRectAndLabel }

function TFrameListItemStyle_RoundColorRectAndLabel.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


procedure TFrameListItemStyle_RoundColorRectAndLabel.ItemDesignerPanelResize(
  Sender: TObject);
begin
//  if lblItemCaption<>nil then
//  begin
//    if Width>Height then
//    begin
//      Self.lblItemCaption.Height:=Height;
//      Self.lblItemCaption.Width:=Height;
//    end
//    else
//    begin
//      Self.lblItemCaption.Height:=Width;
//      Self.lblItemCaption.Width:=Width;
//    end;
//    Self.lblItemCaption.Left:=(Width-Self.lblItemCaption.Width) div 2;
//    Self.lblItemCaption.Top:=(Height-Self.lblItemCaption.Height) div 2;
//  end;
end;

initialization
  RegisterListItemStyle('RoundColorRectAndLabel',TFrameListItemStyle_RoundColorRectAndLabel);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_RoundColorRectAndLabel);

end.
