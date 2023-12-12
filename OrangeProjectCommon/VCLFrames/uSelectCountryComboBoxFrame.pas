unit uSelectCountryComboBoxFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinPanelType,

  uSkinItems,
  XSuperObject,
  uGraphicCommon,
  SelectPopupForm,
  MyComboBoxFrame,
  uDrawPicture,
  uCountryData,
  uFuncCommon,
  SelectCountryPopupForm,
  EasyServiceCommonMaterialDataMoudle_VCL,
  ListItemStyle_CheckBoxIconLeft_CaptionRight,

  uSkinListViewType,
  uSkinItemDesignerPanelType,
  uSkinWindowsControl, uSkinButtonType, Vcl.StdCtrls, uDrawCanvas,
  uSkinScrollControlType, uSkinCustomListType, uSkinVirtualListType;

type
  //国家多选框
  TFrameSelectCountryComboBox=class(TFrameMyComboBox)
    procedure lvDataClickItem(AItem:TSkinItem);override;
    procedure lvDataNewListItemStyleFrameCacheInit(Sender: TObject;
      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);override;
    procedure lvDataPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);override;
  protected
    function GetPopupFormWidth:Integer;override;
    function CreateSelectPopupForm:TfrmSelectPopup;override;
    //这个列表项是否可以被添加到Text
    function IsItemCanAddToText(AItem:TSkinItem):Boolean;override;
//    function GetDataListView:TSkinWinListView;override;
//    function GetSelectedCaptions:String;override;
//    function GetSelectedNames:String;override;
    procedure DoSelectPopupFormHide(Sender:TObject);
  public
    procedure Init;
    constructor Create(AOwner:TComponent);override;
  end;

implementation



{ TFrameSelectCountryComboBox }

constructor TFrameSelectCountryComboBox.Create(AOwner: TComponent);
begin
  inherited;

//  Self.lvData.CanFocus:=True;

  //要高一点
  DropDownCount:=10;

  Init;
end;

function TFrameSelectCountryComboBox.CreateSelectPopupForm: TfrmSelectPopup;
begin
  //Init;

  Result:=SelectPopupForm.CreateSelectPopupForm(Application.MainForm,TfrmSelectCountryPopup);
  Result.OnHide:=DoSelectPopupFormHide;
  TfrmSelectCountryPopup(Result).Init(Self.lvData);

end;

procedure TFrameSelectCountryComboBox.DoSelectPopupFormHide(Sender: TObject);
var
  I:Integer;
  AText:String;
begin

  if TfrmSelectCountryPopup(Self.FfrmSelectPopup).btnClearAll.Prop.StaticIsPushed
    or TfrmSelectCountryPopup(Self.FfrmSelectPopup).btnOK.Prop.StaticIsPushed then
  begin
    AText:='';

    for I:=0 to Self.lvData.Prop.Items.Count-1 do
    begin
      if Self.lvData.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvData.Prop.Items[I]) then
      begin
        if AText<>'' then
        begin
          AText:=AText+',';
        end;
        AText:=AText+Self.lvData.Prop.Items[I].Caption;
      end;
    end;
    Self.edtValue.Text:=AText;

  end;

//  Self.Text:=Self.GetSelectedCaptions;
end;

//function TFrameSelectCountryComboBox.GetDataListView: TSkinWinListView;
//begin
//  Result:=TfrmSelectCountryPopup(Self.FfrmSelectPopup).lvData;
//end;

function TFrameSelectCountryComboBox.GetPopupFormWidth: Integer;
begin
  Result:=ScreenScaleSizeInt(600);
end;

procedure TFrameSelectCountryComboBox.Init;
var
  I:Integer;
  ACountryJson:ISuperObject;
  AValuesArray:ISuperArray;
  AValue:Variant;
  ACaption:String;
  ACode:String;
  AItem:TSkinItem;
  AIconFilePath:String;
begin
  lvData.Prop.Items.BeginUpdate;
  try

    lvData.Prop.Items.Clear;
    lvData.Prop.MultiSelect:=True;
    lvData.Prop.ItemHeight:=32;
    lvData.Prop.ItemWidth:=160;
    lvData.Prop.ColCount:=3;
    lvData.Prop.ViewType:=lvtIcon;
    lvData.Prop.DefaultItemStyle:='CheckBoxIconLeft_CaptionRight';
//    lvData.AlignWithMargins:=True;
//    lvData.Margins.Top:=10;
//    lvData.Margins.Bottom:=10;

    //ReadResDataToFilePath('CFGJson_countrydata','C:\CFGJson_countrydata.json');
    ACountryJson:=SO(ReadResDataString('CFGJson_countrydata'));
//    ACountryJson:=SO(GetStringFromFile('C:\CFGJson_countrydata.json',TEncoding.UTF8));


    AValuesArray:=ACountryJson.A['values'];
    for I := 0 to AValuesArray.Length - 1 do
    begin
  //    ShowMessage(AValuesArray.A[I].S[0] + ' + ' + AValuesArray.A[I].S[3]);
      //["674", "NR", "Nauru", "瑙鲁", "+674", "亚洲", "4:00 AM", "12:00 PM"]
  //      APhoneCaption:= VarToStr(AValuesArray.A[I].V[3]) + '(' + VarToStr(AValuesArray.A[I].V[1]) + ')' + '+' + VarToStr(AValuesArray.A[I].V[0]) + ',';
  //      APhoneValue:= VarToStr(AValuesArray.A[I].V[0]) + ',';
        ACaption:= VarToStr(AValuesArray.A[I].V[3]);//+',';
        ACode:= VarToStr(AValuesArray.A[I].V[1]);//+',';
        AItem:=lvData.Prop.Items.Add;
        AItem.Caption:=ACaption;
        AItem.Name:=ACode;

//        //所属的州
//        AItem.Json:=SO();
//        AItem.Json.S['Continent']:=VarToStr(AValuesArray.A[I].V[5]);
        AItem.Detail:=VarToStr(AValuesArray.A[I].V[5]);

//        AIconFilePath:='C:\MyFiles\OrangeUI Samples(VCL)\TestSelectCountryPopupForm\country_icons\'+ACode+'.png';

        //如果存在图标,则解压出来
        AIconFilePath:=ExtractFilePath(Application.ExeName)+'country_icons\'+ACode+'.png';
        if not FileExists(AIconFilePath) then
        begin
          //解压出来
          if not ReadResDataToFilePath('country_icon_'+LowerCase(ACode),AIconFilePath) then
          begin
            ReadResDataToFilePath('country_icon_xx',AIconFilePath);
          end;
        end;
        if FileExists(AIconFilePath) then
        begin
          //解压出来
          AItem.Icon.LoadFromFile(AIconFilePath);
        end;

    end;

  finally
    lvData.Prop.Items.EndUpdate();
  end;
end;

function TFrameSelectCountryComboBox.IsItemCanAddToText(
  AItem: TSkinItem): Boolean;
begin
  Result:=(AItem.Caption<>'全选');
end;

//function TFrameSelectCountryComboBox.GetSelectedCaptions: String;
//var
//  I:Integer;
//begin
//  Result:='';
//  for I:=0 to Self.GetDataListView.Prop.Items.Count-1 do
//  begin
//    if Self.GetDataListView.Prop.Items[I].Selected then
//    begin
//      if Result<>'' then
//      begin
//        Result:=Result+',';
//      end;
//      Result:=Result+Self.GetDataListView.Prop.Items[I].Caption;
//    end;
//  end;
//end;
//
//function TFrameSelectCountryComboBox.GetSelectedNames: String;
//var
//  I:Integer;
//begin
//  Result:='';
//  for I:=0 to Self.GetDataListView.Prop.Items.Count-1 do
//  begin
//    if Self.GetDataListView.Prop.Items[I].Selected then
//    begin
//      if Result<>'' then
//      begin
//        Result:=Result+',';
//      end;
//      Result:=Result+Self.GetDataListView.Prop.Items[I].Name;
//    end;
//  end;
//end;

procedure TFrameSelectCountryComboBox.lvDataClickItem(AItem: TSkinItem);
var
  I:Integer;
//  AText:String;
begin
//  AText:='';

  //如果是全选按钮,那么当前显示的全部显示出来
  if AItem.Caption='全选' then
  begin
    lvData.Prop.Items.BeginUpdate;
    try
      for I := 1 to Self.lvData.Prop.Items.Count-1 do
      begin
        if lvData.Prop.Items[I].Visible then
        begin
          lvData.Prop.Items[I].Selected:=AItem.Selected;
        end;
      end;
    finally
      lvData.Prop.Items.EndUpdate();
    end;
  end;


//  for I:=0 to Self.lvData.Prop.Items.Count-1 do
//  begin
//    if Self.lvData.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvData.Prop.Items[I]) then
//    begin
//      if AText<>'' then
//      begin
//        AText:=AText+',';
//      end;
//      AText:=AText+Self.lvData.Prop.Items[I].Caption;
//    end;
//  end;
//  Self.edtValue.Text:=AText;



  if Self.lvData.CanFocus then Self.lvData.SetFocus;
end;

procedure TFrameSelectCountryComboBox.lvDataNewListItemStyleFrameCacheInit(
  Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
var
  AFrame:TFrameListItemStyle_CheckBoxIconLeft_CaptionRight;
begin
  AFrame:=TFrameListItemStyle_CheckBoxIconLeft_CaptionRight(ANewListItemStyleFrameCache.FItemStyleFrame);
  AFrame.imgItemIcon.Visible:=True;
//  AFrame.imgItemIcon.Width:=60;
//  AFrame.imgItemIcon.BindItemFieldName:='';
end;

procedure TFrameSelectCountryComboBox.lvDataPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
var
  AFrame:TFrameListItemStyle_CheckBoxIconLeft_CaptionRight;
begin
  inherited;
  AFrame:=TFrameListItemStyle_CheckBoxIconLeft_CaptionRight(AItemDesignerPanel.Parent);
//  AFrame.imgItemIcon.Visible:=True;
//  AFrame.imgItemIcon.Prop.Picture.PictureDrawType:=pdtReference;
//  AFrame.imgItemIcon.Prop.Picture.StaticRefPicture:=AItem.Icon;

end;

end.
