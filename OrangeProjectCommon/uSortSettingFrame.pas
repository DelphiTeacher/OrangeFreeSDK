unit uSortSettingFrame;

interface

uses
  UITypes,
  Types,
  SysUtils,
  FMX.Graphics,
  FMX.Types,
  classes,
  uComponentType,
  uGraphicCommon,
  EasyServiceCommonMaterialDataMoudle,
  uSkinItems,
  uDrawCanvas,
  uDrawPicture,
  uSkinImageList,
  uSkinCustomListType,
  uSkinFireMonkeyItemDesignerPanel,
  ListItemStyleFrame_IconCaption,
  SingleSelectFrame;


type
  TFrameSortSetting=class(TFrameSingleSelect)
    procedure lbListClickItem(Sender: TSkinItem);override;
    procedure lbListNewListItemStyleFrameCacheInit(Sender: TObject;
      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);override;
    procedure lbListPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinFMXItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);override;
  public
    procedure Loaded;override;
  public
    FSortImageList:TSkinImageList;
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
  end;

var
  GlobalSortSettingFrame:TFrameSortSetting;

implementation

{ TFrameSortSetting }

constructor TFrameSortSetting.Create(AOwner: TComponent);
begin
  inherited;

  Self.pnlToolBar.Caption:='排序设置';
  Self.pnlToolBar.RefMaterial:=dmEasyServiceCommonMaterial.pnlToolBarMaterial;
  Self.pnlToolBar.MaterialUseKind:=TMaterialUseKind.mukRef;

  Self.lbList.Prop.ItemDesignerPanel:=nil;
  Self.lbList.Prop.DefaultItemStyle:='IconCaption';


  Self.pnlSearchBar.Visible:=False;

  Self.btnReturn.RefMaterial:=dmEasyServiceCommonMaterial.bdmReturnButton;
  Self.btnReturn.MaterialUseKind:=TMaterialUseKind.mukRef;

  FSortImageList:=TSkinImageList.Create(Self);
  FSortImageList.PictureList.Add.FileName:='无序.png';
  FSortImageList.PictureList.Add.FileName:='升序.png';
  FSortImageList.PictureList.Add.FileName:='降序.png';


  //加一个确定按钮
  btnOK.Visible:=True;



end;

procedure TFrameSortSetting.lbListClickItem(Sender: TSkinItem);
begin
  //inherited;
  //切换排序的图标
  if Sender.Detail='' then
  begin
    Sender.Detail:='1';
  end
  else if Sender.Detail='1' then
  begin
    Sender.Detail:='2';
  end
  else
  begin
    Sender.Detail:='';
  end;

end;

procedure TFrameSortSetting.lbListNewListItemStyleFrameCacheInit(
  Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
var
  AFrame:TFrameIconCaptionListItemStyle;
begin
  inherited;
  AFrame:=TFrameIconCaptionListItemStyle(ANewListItemStyleFrameCache.FItemStyleFrame);
  AFrame.imgItemIcon.Align:=TAlignLayout.Right;
//  AFrame.ItemDesignerPanel.Prop.ItemCaptionBindingControl:=nil;
  AFrame.ItemDesignerPanel.Prop.ItemIconBindingControl:=nil;


  AFrame.imgItemIcon.BindItemFieldName:='ItemDetail';
  AFrame.imgItemIcon.Prop.Picture.SkinImageList:=FSortImageList;

  AFrame.lblItemCaption.Margins.Left:=20;
  AFrame.lblItemCaption.Material.DrawCaptionParam.FontSize:=14;
end;

procedure TFrameSortSetting.lbListPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinFMXItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
begin
  inherited;

end;

procedure TFrameSortSetting.Loaded;
begin
  inherited;

end;

end.
