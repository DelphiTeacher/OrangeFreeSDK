unit SelectCountryPopupForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SelectPopupForm, uSkinWindowsForm,
  uDrawCanvas, uSkinItems, uSkinWindowsControl, uSkinScrollControlType,
  XSuperObject,
  uCountryData,
  HZSpell,
  uSkinItemJsonHelper,
  EasyServiceCommonMaterialDataMoudle_VCL,
  ListItemStyle_VertSelectedGray_CaptionLeft,
  uSkinCustomListType, uSkinVirtualListType, uSkinListBoxType, uSkinListViewType,
  uSkinPanelType, Vcl.StdCtrls, uSkinWindowsEdit, uSkinButtonType;

type
  TfrmSelectCountryPopup = class(TfrmSelectPopup)
    lbContinent: TSkinWinListBox;
    pnlDevide: TSkinWinPanel;
    pnlLeft: TSkinWinPanel;
    edtSearch: TSkinWinEdit;
    pnlBottom: TSkinWinPanel;
    btnOK: TSkinWinButton;
    btnCancel: TSkinWinButton;
    pnlButtonDevide: TSkinWinPanel;
    btnClearAll: TSkinWinButton;
    procedure lbContinentClickItem(AItem: TSkinItem);
    procedure edtSearchChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbContinentClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnClearAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    lvData:TSkinWinListView;
    procedure Init(AlvData:TSkinWinListView);
    procedure CustomPopup;override;
//    procedure Load(ASelectedCountryListCommaText:String);
    //用于过滤
    procedure DoFilter(AKeyword:String);override;
    { Public declarations }
  end;

var
  frmSelectCountryPopup: TfrmSelectCountryPopup;

implementation

{$R *.dfm}

procedure TfrmSelectCountryPopup.btnOKClick(Sender: TObject);
begin
  inherited;
  //确定
  //
  Self.HidePopup;
end;

procedure TfrmSelectCountryPopup.btnCancelClick(Sender: TObject);
begin
  inherited;
  //取消
  Self.HidePopup;

end;

procedure TfrmSelectCountryPopup.btnClearAllClick(Sender: TObject);
begin
  inherited;

  //全球
  Self.lvData.Prop.Items.UnSelectAll;
  Self.HidePopup;
end;

procedure TfrmSelectCountryPopup.CustomPopup;
begin
  inherited;
  Self.btnClearAll.Prop.StaticIsPushed:=False;
  Self.btnCancel.Prop.StaticIsPushed:=False;
  Self.btnOK.Prop.StaticIsPushed:=False;

end;

procedure TfrmSelectCountryPopup.DoFilter(AKeyword: String);
var
  I: Integer;
//  AFilter:String;
  AListViewItem:TSkinListViewItem;
begin
  //inherited;
  //过滤
//  AFilter:=Trim(Self.edtFilter.Text);
//  if FFilter=AFilter then Exit;


//  FFilter:=AFilter;
//  Self.btnClearFilter.Visible:=AFilter<>'';


  //过滤
  Self.lvData.Properties.Items.BeginUpdate;
  try
    for I := 0 to Self.lvData.Properties.Items.Count-1 do
    begin
      AListViewItem:=Self.lvData.Properties.Items[I];


      if //(ASelectedList<>nil) and (SelectedList.IndexOf(GetItemCaption(I))=-1)
        //and
        (AKeyword='')
        or (Pos(LowerCase(AKeyword),LowerCase(AListViewItem.Caption))>0)
        //简拼
        or (Pos(LowerCase(AKeyword),LowerCase(GetHzPy(AListViewItem.Caption)))>0)
        then
      begin
        AListViewItem.Visible:=True;
      end
      else
      begin
        AListViewItem.Visible:=False;
      end;


    end;

  finally
    Self.lvData.Properties.Items.EndUpdate;
  end;
end;

procedure TfrmSelectCountryPopup.edtSearchChange(Sender: TObject);
begin
  inherited;
  //过滤
  Self.DoFilter(Self.edtSearch.Text);

end;

procedure TfrmSelectCountryPopup.FormCreate(Sender: TObject);
begin
  inherited;
//  Self.lbContinent.CanFocus:=True;

  lbContinent.Prop.FDefaultItemStyleSetting.IsUseCache:=False;

end;

procedure TfrmSelectCountryPopup.Init(AlvData: TSkinWinListView);
var
  I:Integer;
//  ACountryJson:ISuperObject;
//  AValuesArray:ISuperArray;
//  AValue:Variant;
//  ACaption:String;
//  ACode:String;
  AItem:TSkinItem;
  AContinentList:TStringList;
begin
  lvData:=AlvData;
  //加载所有国家和州
//  inherited;


  AContinentList:=GetContinentList;
  lbContinent.Prop.Items.BeginUpdate;
  try
    lbContinent.Prop.Items.Clear;

    //加一个全部
    AItem:=lbContinent.Prop.Items.Add;
    AItem.Caption:='全部';
    AItem.Selected:=True;


    for I := 0 to AContinentList.Count-1 do
    begin
      lbContinent.Prop.Items.Add.Caption:=AContinentList[I];
    end;
  finally
    FreeAndNil(AContinentList);
    lbContinent.Prop.Items.EndUpdate();
  end;



//  lvData.Prop.Items.BeginUpdate;
//  try
//
//    lvData.Prop.Items.Clear;
//    lvData.Prop.MultiSelect:=True;
//    lvData.Prop.ItemHeight:=32;
//    lvData.Prop.DefaultItemStyle:='CheckBoxIconLeft_CaptionRight';
//
//    //加一个全选项
//    AItem:=lvData.Prop.Items.Add;
//    AItem.Caption:='全选';
//
//    ACountryJson:=SO(ReadResDataString('CFGJson_countrydata'));
//    AValuesArray:=ACountryJson.A['values'];
//    for I := 0 to AValuesArray.Length - 1 do
//    begin
//  //    ShowMessage(AValuesArray.A[I].S[0] + ' + ' + AValuesArray.A[I].S[3]);
//      //["674", "NR", "Nauru", "瑙鲁", "+674", "亚洲", "4:00 AM", "12:00 PM"]
//  //      APhoneCaption:= VarToStr(AValuesArray.A[I].V[3]) + '(' + VarToStr(AValuesArray.A[I].V[1]) + ')' + '+' + VarToStr(AValuesArray.A[I].V[0]) + ',';
//  //      APhoneValue:= VarToStr(AValuesArray.A[I].V[0]) + ',';
//
//        ACaption:= VarToStr(AValuesArray.A[I].V[3]);//+',';
//        ACode:= VarToStr(AValuesArray.A[I].V[1]);//+',';
//        AItem:=lvData.Prop.Items.Add;
//        AItem.Caption:=ACaption;
//        //国家代码
//        AItem.Name:=ACode;
////        //所属的州
////        AItem.Json:=SO();
////        AItem.Json.S['Continent']:=VarToStr(AValuesArray.A[I].V[5]);
//        AItem.Detail:=VarToStr(AValuesArray.A[I].V[5]);
//
//
//    end;
//
//  finally
//    lvData.Prop.Items.EndUpdate();
//  end;

end;

procedure TfrmSelectCountryPopup.lbContinentClick(Sender: TObject);
begin
  inherited;
  if Self.lbContinent.CanFocus then Self.lbContinent.SetFocus;
end;

procedure TfrmSelectCountryPopup.lbContinentClickItem(AItem: TSkinItem);
var
  I:Integer;
begin
  inherited;

  lvData.Prop.Items.BeginUpdate;
  try

    for I := 0 to lvData.Prop.Items.Count-1 do
    begin
      //所属的州
//      lvData.Prop.Items[I].Visible:=(lvData.Prop.Items[I].Json.S['Continent']=AItem.Caption);
      lvData.Prop.Items[I].Visible:=(lvData.Prop.Items[I].Detail=AItem.Caption)
                                  or (lvData.Prop.Items[I].Caption='全选')
                                  or (AItem.Caption='全部');
    end;


    lvData.VertScrollBar.Prop.Position:=0;
  finally
    lvData.Prop.Items.EndUpdate();
  end;

end;

//procedure TfrmSelectCountryPopup.Load(ASelectedCountryListCommaText: String);
//var
//  I:Integer;
//  ASelectedCountryList:TStringList;
//begin
//  ASelectedCountryList:=TStringList.Create;
//  try
//    ASelectedCountryList.CommaText:=ASelectedCountryListCommaText;
//
//    lvData.Prop.Items.BeginUpdate;
//    try
//      for I := 1 to Self.lvData.Prop.Items.Count-1 do
//      begin
//        lvData.Prop.Items[I].Selected:=(ASelectedCountryList.IndexOf(lvData.Prop.Items[I].Caption)<>-1);
//      end;
//    finally
//      lvData.Prop.Items.EndUpdate();
//    end;
//
//  finally
//    FreeAndNil(ASelectedCountryList);
//  end;
//
//end;

end.

