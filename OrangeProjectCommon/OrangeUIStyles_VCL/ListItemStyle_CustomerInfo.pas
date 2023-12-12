unit ListItemStyle_CustomerInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  Math,
  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,
  PngImage,
  uGraphicCommon,
  uDrawTextParam,
  uSkinBufferBitmap,
  ListItemStyle_CustomerTag,
  ListItemStyle_IconButton,
//  EasyServiceCommonMaterialDataMoudle_VCL,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinPanelType, uSkinButtonType,
  uDrawCanvas, uSkinScrollControlType, uSkinListViewType, uSkinMaterial,
  StdCtrls, uSkinWindowsEdit;

type
  TFrameListItemStyle_CustomerInfo = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgHead: TSkinWinImage;
    pnlClient: TSkinWinPanel;
    pnlName: TSkinWinPanel;
    pnlCompany: TSkinWinPanel;
    lblName: TSkinWinLabel;
    lblCompanyName: TSkinWinLabel;
    lblTime: TSkinWinLabel;
    lblCompany: TSkinWinLabel;
    lvTags: TSkinWinListView;
    btnTag: TSkinWinButton;
    btnMemo: TSkinWinButton;
    imglistPictures: TSkinImageList;
    memMemo: TMemo;
    procedure lvTagsPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);
    procedure memMemoExit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Clear;
    //刷新按钮位置
    procedure SyncButtonBounds;
    //编辑备注
    procedure EditMemo;

    procedure AutoSize;

    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

uses
  uLangRes;

{$R *.dfm}

{ TFrameListItemStyle_CustomerInfo }

procedure TFrameListItemStyle_CustomerInfo.AutoSize;
var
  AItem:TSkinItem;
//  I: Integer;
  ASizeF:TSizeF;
  AItemWidth:Double;
  AlvTagsContentHeight:Integer;
begin
//  Self.lvTags.Prop.Items.BeginUpdate;
//  try

    //插入备注
    AItem:=Self.lvTags.Prop.Items.FindItemByName('memo');
    if AItem<>nil then
    begin
      Self.lvTags.Prop.Items.FindItemByName('space').Visible:=(AItem.Caption<>'');
      AItem.Visible:=(AItem.Caption<>'');
  //    AItem.Caption:='HelloWorld,DelphiTeacher!  I''m from USA';
      GetGlobalDrawTextParam.IsWordWrap:=True;
      GetGlobalDrawTextParam.FontSize:=10;
      ASizeF:=uSkinBufferBitmap.GetStringSize(AItem.Caption,
                                            RectF(0,
                                                  0,
                                                  (Self.lvTags.Width-Self.btnMemo.Width-6),
                                                  MaxInt),
                                            GetGlobalDrawTextParam);
      AItem.Width:=Ceil(ASizeF.cx/Const_BufferBitmapScale);
      AItem.Height:=Ceil(ASizeF.cy/Const_BufferBitmapScale);
      if AItem.Height<(Self.btnMemo.Height/Const_BufferBitmapScale) then
      begin
        AItem.Height:=Ceil(Self.btnMemo.Height/Const_BufferBitmapScale);
      end;

    end;
//  finally
//    Self.lvTags.Prop.Items.EndUpdate(True);
//  end;
//  AlvTagsContentHeight:=Self.lvTags.Prop.CalcContentHeight;
//  Self.lvTags.Height:=AlvTagsContentHeight;
  Self.lvTags.Height:=Self.lvTags.Prop.CalcContentHeight;
  if Self.lvTags.Height=0 then
  begin
    //默认占一行的高度
    Self.lvTags.Height:=Self.lvTags.Prop.ItemHeight;
  end;
  

  Self.SyncButtonBounds;

  Self.Height:=
    Self.pnlClient.Top
    +Self.lvTags.Top
    +Self.lvTags.Height+10;
  Self.lvTags.Invalidate;
end;

procedure TFrameListItemStyle_CustomerInfo.Clear;
begin

  //头像不能清
//  Self.imgHead.Prop.Picture.Clear;
//  Self.imgHead.Prop.Picture.Url:='';
//  Self.imgHead.Prop.Picture.SkinImageList:=Self.imglistPictures;
//  Self.imgHead.Prop.Picture.ImageIndex:=0;
  Self.lvTags.Prop.Items.BeginUpdate;
  try
    Self.lvTags.Prop.Items.ClearItemsByType(sitDefault);
    Self.lvTags.Prop.Items.FindItemByName('space').Visible:=False;
    Self.lvTags.Prop.Items.FindItemByName('memo').Visible:=False;
    Self.lvTags.Prop.Items.FindItemByName('memo').Caption:='';
    Self.lvTags.Height:=Self.lvTags.Prop.CalcContentHeight;

    Self.lblName.Caption:=SDATA_StrangeCustomer;
    Self.lblCompanyName.Caption:='';
    Self.lblCompany.Caption:='';
    Self.lblTime.Caption:='';

    Self.btnTag.Visible:=False;
    Self.btnMemo.Visible:=False;
    Self.lvTags.Prop.Items.FindItemByName('btnMemo').Icon.Clear;
    Self.lvTags.Prop.Items.FindItemByName('btnTag').Icon.Clear;
    Self.lvTags.Prop.Items.FindItemByName('btnTag').Visible:=False;
    Self.lvTags.Prop.Items.FindItemByName('btnMemo').Visible:=False;
  finally
    Self.lvTags.Prop.Items.EndUpdate;
  end;

end;

procedure TFrameListItemStyle_CustomerInfo.EditMemo;
var
  AMemoItem:TSkinItem;
begin
  //备注
  Self.lvTags.Prop.Items.FindItemByName('space').Visible:=True;
  AMemoItem:=Self.lvTags.Prop.Items.FindItemByName('memo');
  if AMemoItem.Width<(Self.lvTags.Width-Self.btnMemo.Width-6)/Const_BufferBitmapScale then
  begin
    //Item.Width在绘制的时候会*放大倍数
    //所以要缩小
    AMemoItem.Width:=Ceil((Self.lvTags.Width-Self.btnMemo.Width-6)/Const_BufferBitmapScale);
  end;
  AMemoItem.Visible:=True;
  Self.SyncButtonBounds;

  lvTags.Height:=lvTags.Prop.CalcContentHeight;
  Self.Height:=
    Self.pnlClient.Top
    +Self.lvTags.Top
    +Self.lvTags.Height+10;
  Self.lvTags.Invalidate;

  Self.lvTags.Prop.StartEditingItemByFieldName(
      AMemoItem,
      'ItemCaption',
      Self.memMemo,
      RectF(0,
            0,
            AMemoItem.Width*Const_BufferBitmapScale,
            AMemoItem.Height*Const_BufferBitmapScale
            ),
      0,0
      );


end;

function TFrameListItemStyle_CustomerInfo.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


procedure TFrameListItemStyle_CustomerInfo.lvTagsPrepareDrawItem(
  Sender: TObject; ACanvas: TDrawCanvas;
  AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
  AItemDrawRect: TRect);
begin
  //
  if AItem.Name='btnTag' then
  begin
    Self.btnTag.BoundsRect:=AItemDrawRect;
  end;
  if AItem.Name='btnMemo' then
  begin
    Self.btnMemo.BoundsRect:=AItemDrawRect;
  end;
end;

procedure TFrameListItemStyle_CustomerInfo.memMemoExit(Sender: TObject);
begin
  Self.lvTags.Prop.StopEditingItem;
end;

procedure TFrameListItemStyle_CustomerInfo.SyncButtonBounds;
var
  ABounds:TRectF;
begin
  Self.btnTag.Visible:=Self.lvTags.Prop.Items.FindItemByName('btnTag').Visible;
  if Self.btnTag.Visible then
  begin
    ABounds:=Self.lvTags.Prop.Items.FindItemByName('btnTag').ItemRect;
    Self.btnTag.BoundsRect:=Rect(Ceil(ABounds.Left),
                                Ceil(ABounds.Top),
                                Ceil(ABounds.Right),
                                Ceil(ABounds.Bottom));
  end;

  Self.btnMemo.Visible:=Self.lvTags.Prop.Items.FindItemByName('btnMemo').Visible;
  if Self.btnMemo.Visible then
  begin
    ABounds:=Self.lvTags.Prop.Items.FindItemByName('btnMemo').ItemRect;
    Self.btnMemo.BoundsRect:=Rect(Ceil(ABounds.Left),
                                  Ceil(ABounds.Top),
                                  Ceil(ABounds.Right),
                                  Ceil(ABounds.Bottom));
  end;
end;

initialization
  RegisterListItemStyle('CustomerInfo',TFrameListItemStyle_CustomerInfo);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CustomerInfo);

end.
