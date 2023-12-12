unit TagLabelManageFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, uDrawCanvas, uSkinItems,
  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  Math,

  {$IF CompilerVersion <= 21.0} // XE or older
  //Delphi2010不能用XSuperObject
  SuperObject,
  superobjecthelper,
  {$ELSE}
    {$IFDEF SKIN_SUPEROBJECT}
    uSkinSuperObject,
    {$ELSE}
    XSuperObject,
    XSuperJson,
    {$ENDIF}
  {$IFEND}

//  XSuperObject,
//  uDatasetToJson,
  uSkinItemJsonHelper,
  uListItemStyleJsonHelper,
  ListItemStyle_CustomerTag,
  uSkinItemDesignerPanelType,
  EasyServiceCommonMaterialDataMoudle_VCL,
  uSkinVirtualListType, uSkinListViewType, uSkinButtonType, ExtCtrls,
  uSkinMaterial, uSkinLabelType;

type
  TFrameTagLabelManage = class(TFrame)
    lvTags: TSkinWinListView;
    lvSelected: TSkinWinListView;
    pnlBottomBar: TPanel;
    btnOK: TSkinWinButton;
    btnCancel: TSkinWinButton;
    SkinWinLabel1: TSkinWinLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure pnlBottomBarResize(Sender: TObject);
    procedure lvTagsClickItem(AItem: TSkinItem);
    procedure lvSelectedPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);
    procedure lvSelectedMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lvSelectedClickItemDesignerPanelChild(Sender: TObject;
      AItem: TBaseSkinItem; AItemDesignerPanel: TSkinItemDesignerPanel;
      AChild: TControl);
    procedure lvTagsPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);
  private
    { Private declarations }
  public
    FTags:ISuperArray;
    FSelectedTagIDs:ISuperArray;
    FSelectedTagIDsArray:array of Integer;
    procedure Load(ATags:ISuperArray;
                  ASelectedTagIDs:ISuperArray);
    { Public declarations }
  end;


function ShowTagLabelManageForm(ATags, ASelectedTagIDs: ISuperArray):TFrameTagLabelManage;

implementation

{$R *.dfm}

uses
  HostForm;

function ShowTagLabelManageForm(ATags, ASelectedTagIDs: ISuperArray):TFrameTagLabelManage;
var
  AHostForm:TfrmHost;
  ATagLabelManageFrame:TFrameTagLabelManage;
begin
  Result:=nil;

  AHostForm:=TfrmHost.Create(Application);
  AHostForm.Caption:='标签管理';
  AHostForm.Position:=poMainFormCenter;
  AHostForm.Width:=Ceil(600*Const_BufferBitmapScale);
  AHostForm.Height:=Ceil(400*Const_BufferBitmapScale);


  ATagLabelManageFrame:=TFrameTagLabelManage.Create(AHostForm);
  ATagLabelManageFrame.Parent:=AHostForm;
  ATagLabelManageFrame.Align:=alClient;
  ATagLabelManageFrame.Load(ATags,ASelectedTagIDs);

  if AHostForm.ShowModal=mrOK then
  begin
    Result:=ATagLabelManageFrame;
  end;

end;


procedure TFrameTagLabelManage.btnCancelClick(Sender: TObject);
begin
  if Self.Parent is TForm then
  begin
    TForm(Self.Parent).ModalResult:=mrCancel;
  end;
end;

procedure TFrameTagLabelManage.btnOKClick(Sender: TObject);
var
  I: Integer;
begin
  if Self.Parent is TForm then
  begin

    FSelectedTagIDs:=TSuperArray.Create();
    SetLength(FSelectedTagIDsArray,Self.lvSelected.Prop.Items.Count);
    for I := 0 to Self.lvSelected.Prop.Items.Count-1 do
    begin
      FSelectedTagIDs.I[I]:=Self.lvSelected.Prop.Items[I].Json.I['labelId'];
      FSelectedTagIDsArray[I]:=Self.lvSelected.Prop.Items[I].Json.I['labelId'];
    end;

    TForm(Self.Parent).ModalResult:=mrOK;
  end;
end;

procedure TFrameTagLabelManage.Load(ATags, ASelectedTagIDs: ISuperArray);
begin
  FTags:=ATags;
  FSelectedTagIDs:=ASelectedTagIDs;
  LoadTags(FTags,Self.lvTags);
  LoadSelectedTags(FTags,ASelectedTagIDs,Self.lvSelected,False);
end;

procedure TFrameTagLabelManage.lvSelectedClickItemDesignerPanelChild(
  Sender: TObject; AItem: TBaseSkinItem;
  AItemDesignerPanel: TSkinItemDesignerPanel; AChild: TControl);
begin
  if AChild.Name='btnDelete' then
  begin
    FreeAndNil(AItem);
  end;
end;

procedure TFrameTagLabelManage.lvSelectedMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
//var
//  I: Integer;
begin
//  //鼠标移动的时候,要切换MouseOverItem,要重绘一下
//  for I := 0 to lvSelected.Prop.Items.Count - 1 do
//  begin
//    lvSelected.Prop.Items[I].IsBufferNeedChange:=True;
//  end;
//  lvSelected.Repaint;
end;

procedure TFrameTagLabelManage.lvSelectedPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
var
  AFrameListItemStyle_CustomerTag:TFrameListItemStyle_CustomerTag;
begin
  AFrameListItemStyle_CustomerTag:=TFrameListItemStyle_CustomerTag(AItemDesignerPanel.Parent);
  AFrameListItemStyle_CustomerTag.ItemDesignerPanel.Material.BackColor.RoundWidth:=8;
  AFrameListItemStyle_CustomerTag.ItemDesignerPanel.Material.BackColor.RoundHeight:=8;
  if AFrameListItemStyle_CustomerTag.btnDelete.Visible<>(AItem=lvSelected.Prop.MouseOverItem) then
  begin
    AFrameListItemStyle_CustomerTag.btnDelete.Visible:=(AItem=lvSelected.Prop.MouseOverItem);//True;
    AItem.IsBufferNeedChange:=True;
  end;
end;

procedure TFrameTagLabelManage.lvTagsClickItem(AItem: TSkinItem);
var
//  AItem:TSkinItem;
  ASkinItem:TSkinItem;
begin
//  AItem:=Self.lvTags.Prop.InteractiveItem;

  //如果不存在,则添加
  if Self.lvSelected.Prop.Items.FindItemByCaption(AItem.Caption)=nil then
  begin
    ASkinItem:=Self.lvSelected.Prop.Items.Add;
    uListItemStyleJsonHelper.LoadItem(AItem.Caption,AItem.Color,AItem.Json,ASkinItem,Self.lvSelected);
  end;

end;

procedure TFrameTagLabelManage.lvTagsPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
var
  AFrameListItemStyle_CustomerTag:TFrameListItemStyle_CustomerTag;
begin
  AFrameListItemStyle_CustomerTag:=TFrameListItemStyle_CustomerTag(AItemDesignerPanel.Parent);
  AFrameListItemStyle_CustomerTag.ItemDesignerPanel.Material.BackColor.RoundWidth:=8;
  AFrameListItemStyle_CustomerTag.ItemDesignerPanel.Material.BackColor.RoundHeight:=8;


end;

procedure TFrameTagLabelManage.pnlBottomBarResize(Sender: TObject);
begin
//  btnOK: TSkinWinButton;
//  btnCancel: TSkinWinButton;
  btnOK.Left:=(pnlBottomBar.Width-2*btnOK.Width+20) div 2;
  btnCancel.Left:=btnOK.Left+btnOK.Width+20;
end;

end.
