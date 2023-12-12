unit ListItemStyle_CarLocationSummary;

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
  ImgList, uDrawPicture, uSkinImageList, uSkinPanelType, uSkinButtonType,
  uSkinMultiColorLabelType;

type
  TFrameListItemStyle_CarLocationSummary = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    lblItemCaption: TSkinWinLabel;
    SkinWinMultiColorLabel1: TSkinWinMultiColorLabel;
    procedure ItemDesignerPanelResize(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_CarLocationSummary }

function TFrameListItemStyle_CarLocationSummary.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


procedure TFrameListItemStyle_CarLocationSummary.ItemDesignerPanelResize(
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
  RegisterListItemStyle('CarLocationSummary',TFrameListItemStyle_CarLocationSummary);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CarLocationSummary);

end.
