unit ListItemStyle_TreeHistoryMadicalList_Diag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,

  uSkinVirtualListType,
  uSkinCustomListType,
  ListItemStyle_TreeChildListBox,


  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinLabelType,
  uSkinWindowsControl, uSkinItemDesignerPanelType, uDrawCanvas, uSkinItems,
  uSkinScrollControlType,
  uSkinListBoxType;

type
  TFrameListItemStyle_TreeHistoryMadicalList_Diag = class(TFrame,IFrameBaseListItemStyle)
    swidpnlHeader: TSkinWinItemDesignerPanel;
    swlblCaption: TSkinWinLabel;
    SkinWinListBox1: TSkinWinListBox;
  private
    FListItemStyle_TreeChildListBox : TFrameListItemStyle_TreeChildListBox;
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TreeHistoryMadicalList_Diag }

function TFrameListItemStyle_TreeHistoryMadicalList_Diag.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=swidpnlHeader;


end;


initialization
  RegisterListItemStyle('TreeHistoryMadicalChildBox',TFrameListItemStyle_TreeHistoryMadicalList_Diag);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TreeHistoryMadicalList_Diag);


end.
