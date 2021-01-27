unit ListItemStyle_TreeHistoryMadicalList_Child;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinWindowsControl,
  uSkinPanelType, uSkinLabelType, uSkinItemDesignerPanelType;

type
  TFrameListItemStyle_TreeHistoryMadicalList_Child = class(TFrame,IFrameBaseListItemStyle)
    swidpnlHeader: TSkinWinItemDesignerPanel;
    swlblCaption: TSkinWinLabel;
    swlblDetail: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TreeHistoryMadicalList_Header }

function TFrameListItemStyle_TreeHistoryMadicalList_Child.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=swidpnlHeader;
end;


initialization
  RegisterListItemStyle('TreeHistoryMadicalChildItem',TFrameListItemStyle_TreeHistoryMadicalList_Child);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TreeHistoryMadicalList_Child);


end.
