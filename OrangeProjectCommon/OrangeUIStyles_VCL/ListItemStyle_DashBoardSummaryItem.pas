unit ListItemStyle_DashBoardSummaryItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType;

type
  TFrameListItemStyle_DashBoardSummaryItem = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemCaption: TSkinWinLabel;
    SkinWinLabel1: TSkinWinLabel;
    imgItemIcon: TSkinWinImage;
    SkinWinLabel2: TSkinWinLabel;
    SkinWinLabel3: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_DashBoardSummaryItem }

function TFrameListItemStyle_DashBoardSummaryItem.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('DashBoardSummaryItem',TFrameListItemStyle_DashBoardSummaryItem);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_DashBoardSummaryItem);

end.
