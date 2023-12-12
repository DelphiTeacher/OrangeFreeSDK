unit ListItemStyle_MailListWithTag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  Types,
  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,
  PngImage,
  uGraphicCommon,
//  XSuperObject,
  Math,
  ListItemStyle_CustomerTag,
//  EasyServiceCommonMaterialDataMoudle_VCL,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinPanelType, uSkinButtonType,
  uDrawCanvas, uSkinScrollControlType, uSkinListViewType;

type
  TFrameListItemStyle_MailListWithTag = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgHead: TSkinWinImage;
    pnlClient: TSkinWinPanel;
    pnlUserInfo: TSkinWinPanel;
    pnlMessageInfo: TSkinWinPanel;
    lblUserName: TSkinWinLabel;
    lblCompanyName: TSkinWinLabel;
    lblTime: TSkinWinLabel;
    lblMessage: TSkinWinLabel;
    btnMenu: TSkinWinButton;
    btnChat: TSkinWinButton;
    lvTags: TSkinWinListView;
    procedure FrameMouseLeave(Sender: TObject);
    procedure ItemDesignerPanelPrepareDrawItem(Sender: TObject;
      ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
      AItem: TSkinItem; AItemDrawRect: TRectF);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameListItemStyle_MailListWithTag.FrameMouseLeave(Sender: TObject);
begin

end;

{ TFrameListItemStyle_MailListWithTag }

function TFrameListItemStyle_MailListWithTag.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


procedure TFrameListItemStyle_MailListWithTag.ItemDesignerPanelPrepareDrawItem(
  Sender: TObject; ACanvas: TDrawCanvas;
  AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
  AItemDrawRect: TRectF);
//var
//  ASelectedTagIDsJsonStr:String;
//  ASelectedTagIDs:ISuperArray;
begin
  Self.lvTags.Width:=AItemDesignerPanel.Width-Self.imgHead.Width-imgHead.Margins.Left-imgHead.Margins.Right;
//  ASelectedTagIDsJsonStr:=AItem.SubItems.Values['tags'];
//  ASelectedTagIDs:=TSuperArray.Create(ASelectedTagIDsJsonStr);
//
//  uListItemStyleJsonHelper.LoadSelectedTags(GlobalTags,ASelectedTagIDs,Self.lvTags,False);
//  //在OnPrepareDrawItem事件中，要设置Item的尺寸，必须用StaticHeight
//  AItem.StaticHeight:=Ceil((Self.pnlUserInfo.Height
//                        +Self.pnlMessageInfo.Height
//                        +Self.lvTags.Prop.CalcContentHeight)/Const_BufferBitmapScale)
//                        +10;

end;

initialization
  RegisterListItemStyle('MailListWithTag',TFrameListItemStyle_MailListWithTag);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_MailListWithTag);

end.
