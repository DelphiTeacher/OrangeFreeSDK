unit ListItemStyle_TreeChildListBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinLabelType,
  uSkinWindowsControl, uSkinItemDesignerPanelType;

type
  TFrameListItemStyle_TreeChildListBox = class(TFrame,IFrameBaseListItemStyle)
    swidpnlList: TSkinWinItemDesignerPanel;
    swlblName: TSkinWinLabel;
    swlblZlh: TSkinWinLabel;
    swlblroom: TSkinWinLabel;
    swlblDoctor: TSkinWinLabel;
    swlblDiag: TSkinWinLabel;
    swlblStarttime: TSkinWinLabel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TreeChildListBox }

function TFrameListItemStyle_TreeChildListBox.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=swidpnlList;
end;


initialization
  RegisterListItemStyle('TreeHistoryMadicalChildlistBox',TFrameListItemStyle_TreeChildListBox);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TreeChildListBox);



end.
