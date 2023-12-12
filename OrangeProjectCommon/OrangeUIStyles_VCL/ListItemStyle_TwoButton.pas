unit ListItemStyle_TwoButton;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,
  EasyServiceCommonMaterialDataMoudle_VCL,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, Vcl.StdCtrls, uSkinWindowsEdit,
  uSkinButtonType;

type
  TFrameListItemStyle_TwoButton = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    btnButton1: TSkinWinButton;
    btnButton2: TSkinWinButton;
    procedure btnButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TwoButton }

procedure TFrameListItemStyle_TwoButton.btnButton1Click(Sender: TObject);
begin
  //
end;

function TFrameListItemStyle_TwoButton.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('TwoButton',TFrameListItemStyle_TwoButton);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TwoButton);

end.
