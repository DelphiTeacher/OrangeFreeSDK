unit ListItemStyle_IconTop_CaptionBottom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType;

type
  TFrameListItemStyle_IconTop_CaptionBottom = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemIcon: TSkinWinImage;
    imgItemCaption: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_IconTop_CaptionBottom }

function TFrameListItemStyle_IconTop_CaptionBottom.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('IconTop_CaptionBottom',TFrameListItemStyle_IconTop_CaptionBottom);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_IconTop_CaptionBottom);

end.
