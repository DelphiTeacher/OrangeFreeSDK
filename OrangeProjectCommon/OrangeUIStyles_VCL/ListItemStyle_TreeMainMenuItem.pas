unit ListItemStyle_TreeMainMenuItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  System.ImageList, Vcl.ImgList;

type
  TFrameListItemStyle_TreeMainMenuItem = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
    imgRe: TSkinWinImage;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TreeMainMenuItem }

function TFrameListItemStyle_TreeMainMenuItem.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('TreeMainMenuItem',TFrameListItemStyle_TreeMainMenuItem);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TreeMainMenuItem);

end.
