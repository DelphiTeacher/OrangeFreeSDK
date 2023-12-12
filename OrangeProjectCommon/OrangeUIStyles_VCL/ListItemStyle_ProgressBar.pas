unit ListItemStyle_ProgressBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinMaterial, uSkinProgressBarType;

type
  TFrameListItemStyle_ProgressBar = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    SkinWinProgressBar1: TSkinWinProgressBar;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_Caption }

function TFrameListItemStyle_ProgressBar.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('ProgressBar',TFrameListItemStyle_ProgressBar);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_ProgressBar);

end.
