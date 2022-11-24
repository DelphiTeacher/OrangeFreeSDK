//convert pas to utf8 by ¥

unit MultiSelectFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
  uSkinItems,
  uUIFunction,
  uComponentType,
  uFrameContext,
  uSkinMaterial,
  uBasePageStructure,
//  uVirtualListDataController,
  uTimerTaskEvent,
  uDrawCanvas,
  uBaseList,
  uTimerTask,
//  uAppCommon,
  uSkinListBoxType,
  uSkinFireMonkeyScrollControl, uSkinFireMonkeyListBox, uSkinFireMonkeyCheckBox,
  uSkinFireMonkeyLabel, uSkinFireMonkeyImage, uSkinFireMonkeyItemDesignerPanel,
  uSkinFireMonkeyVirtualList, uSkinFireMonkeyCustomList, uSkinCheckBoxType,
  uSkinLabelType, uSkinItemDesignerPanelType, uSkinScrollControlType,
  uSkinCustomListType, uSkinVirtualListType, uSkinButtonType, uSkinPanelType,
  uBaseSkinControl;

type
//  TGetBaseListItemCaptionEvent=function(ABaseListItem:TObject):String of object;


  TFrameBaseMultiSelect = class(TFrame)
    pnlToolBar: TSkinFMXPanel;
    lbList: TSkinFMXListBox;
    ItemValue: TSkinFMXItemDesignerPanel;
    lblItemCaption: TSkinFMXLabel;
    chkItemSelected: TSkinFMXCheckBox;
    btnReturn: TSkinFMXButton;
    btnOK: TSkinFMXButton;
    procedure btnReturnClick(Sender: TObject);virtual;
    procedure btnOKClick(Sender: TObject);virtual;
    procedure lbListClickItem(AItem: TSkinItem);virtual;
  private
//    ItemCaptionFieldControlSetting:TFieldControlSetting;
//    //列表数据控制器
//    ListDataController:TListDataController;

//    procedure Clear;
//
//    procedure PrepareForShow(const ACaption:String;
//                              AItemStyle:String;
//                              AIsMultiSelect:Boolean;
//                              ASelectedList:TStringList);

//    procedure DoListDataController_LoadDataToUIEnd(Sender:TObject);
    { Private declarations }
  public
//    FAllList:TStringList;
//    SelectedList: TStringList;
//
//    procedure Init(ACaption:String;
//                    AAllList:TStringList;
//                    ASelectedList:TStringList;
//                    AIsMultiSelect:Boolean=True);overload;
//    procedure Init(ACaption:String;
//                    AAllList:TStringList;
//                    ASelectedCommaText:String;
//                    AIsMultiSelect:Boolean=True);overload;
//    procedure Init(ACaption:String;
//                    AAllListCommaText:String;
//                    ASelectedCommaText:String;
//                    AIsMultiSelect:Boolean=True);overload;
//    procedure Init(ACaption:String;
//                    AAllList:TBaseList;
//                    ASelectedList:TStringList;
//                    AOnGetBaseListItemCaption:TGetBaseListItemCaptionEvent;
//                    AIsMultiSelect:Boolean=True);overload;
//
//    //使用页面框架
//    procedure Init(ACaption:String;
//                    //获取Json数据的过程
//                    AOnGetDataJsonEvent:TTimerTaskNotify;
//                    //Json数据中列表的Key
//                    ADataJsonArrayKey:String;
//                    //标题显示Json中的哪个Key
//                    AItemCaptionBindingFieldName:String;
//                    ASelectedCommaText:String;
//                    AIsMultiSelect:Boolean=True;
//                    //列表项的样式
//                    AItemStyle:String=''
//                    );overload;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;


//
//var
//  GlobalMultiSelectFrame:TFrameBaseMultiSelect;



implementation

{$R *.fmx}

uses
  MessageBoxFrame;
//  MainForm;

procedure TFrameBaseMultiSelect.btnOKClick(Sender: TObject);
//var
//  I: Integer;
begin


//  Self.SelectedList.Clear;
//  for I := 0 to Self.lbList.Prop.Items.Count-1 do
//  begin
//    if Self.lbList.Prop.Items[I].Selected then
//    begin
//      SelectedList.Add(Self.lbList.Prop.Items[I].Caption);
//    end;
//  end;
//
//  HideFrame;////(Self,hfcttBeforeReturnFrame);
//  ReturnFrame;//(Self);

//  EnableMessageBoxFrameTopMost;
end;

procedure TFrameBaseMultiSelect.btnReturnClick(Sender: TObject);
begin


  //什么也不做
  //清空返回事件,也就是返回的时候不调用它
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  //返回
  HideFrame;////(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self);

//  EnableMessageBoxFrameTopMost;
end;

//procedure TFrameBaseMultiSelect.Clear;
//begin
//
//  FAllList.Clear;
//  Self.SelectedList.Clear;
//
//  Self.lbList.Properties.Items.BeginUpdate;
//  try
//    Self.lbList.Properties.Items.Clear(True);
//  finally
//    Self.lbList.Properties.Items.EndUpdate;
//  end;
//
//end;

constructor TFrameBaseMultiSelect.Create(AOwner: TComponent);
begin
  inherited;
//  FAllList:=TStringList.Create;
//  SelectedList:=TStringList.Create;

  //设置主题颜色
  Self.pnlToolBar.SelfOwnMaterial.BackColor.FillColor.Color:=SkinThemeColor;
  Self.ItemValue.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Color:=SkinThemeColor;

  Self.chkItemSelected.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Color:=SkinThemeColor;
  Self.chkItemSelected.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Color:=SkinThemeColor;
  Self.chkItemSelected.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Color:=SkinThemeColor;
  TSkinCheckBoxColorMaterial(Self.chkItemSelected.SelfOwnMaterial).DrawCheckRectParam.DrawEffectSetting.PushedEffect.FillColor.Color:=SkinThemeColor;


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);


//  Clear;

//  //列表数据控制器
//  ListDataController:=TListDataController.Create(nil);
//  //菜单标题的绑定字段
//  ItemCaptionFieldControlSetting:=ListDataController.FieldControlSettingList.Add;//TFieldControlSetting.Create(ListDataController.FieldControlSettingList);
//  ItemCaptionFieldControlSetting.bind_listitem_data_type:='ItemCaption';
////  ListDataController.FieldControlSettingList.Add(ItemCaptionFieldControlSetting);
//
end;

destructor TFrameBaseMultiSelect.Destroy;
begin
//  FreeAndNil(ListDataController);


//  FreeAndNil(FAllList);
//  FreeAndNil(SelectedList);
  inherited;
end;

//procedure TFrameBaseMultiSelect.DoListDataController_LoadDataToUIEnd(Sender: TObject);
//var
//  I:Integer;
//begin
//  //选中的列表
//  if SelectedList.Count>0 then
//  begin
//    Self.lbList.Properties.Items.BeginUpdate;
//    try
//      for I := 0 to Self.lbList.Properties.Items.Count-1 do
//      begin
//
//        if SelectedList.IndexOf(Self.lbList.Properties.Items[I].Caption)<>-1 then
//        begin
//          Self.lbList.Properties.Items[I].Selected:=True;
//        end;
//
//      end;
//
//    finally
//      Self.lbList.Properties.Items.EndUpdate;
//    end;
//  end;
//
//
//end;

//procedure TFrameBaseMultiSelect.Init(ACaption: String;
//  AOnGetDataJsonEvent: TTimerTaskNotify;
//  ADataJsonArrayKey,
//  AItemCaptionBindingFieldName:String;
//  ASelectedCommaText:String;
//  AIsMultiSelect: Boolean;
//  AItemStyle: String);
//var
//  ASelectedList:TStringList;
//begin
//
//
//  Self.Clear;
//
//
//  ASelectedList:=TStringList.Create;
//  try
//    ASelectedList.CommaText:=ASelectedCommaText;
//    Self.PrepareForShow(ACaption,'',AIsMultiSelect,ASelectedList);
//  finally
//    FreeAndNil(ASelectedList);
//  end;
//
//
//  //wn
//  ItemCaptionFieldControlSetting.field_name:=AItemCaptionBindingFieldName;
//  //获取数据
//  ListDataController.GetData(Self,
//                            Self.lbList,
//                            AOnGetDataJsonEvent,
//                            DoListDataController_LoadDataToUIEnd,
//                            ADataJsonArrayKey,
//                            AItemStyle);
//
//end;

//procedure TFrameBaseMultiSelect.Init(ACaption: String;
//                                  AAllList: TStringList;
//                                  ASelectedList: TStringList;
//                                  AIsMultiSelect:Boolean);
//var
//  I: Integer;
//  AListBoxItem:TSkinListBoxItem;
//begin
//  Self.Clear;
//  Self.PrepareForShow(ACaption,'',AIsMultiSelect,ASelectedList);
//
//  FAllList.Assign(AAllList);
//
//
//  //选中的列表
//  Self.lbList.Properties.Items.BeginUpdate;
//  try
//    Self.lbList.Properties.Items.Clear(True);
//    for I := 0 to FAllList.Count-1 do
//    begin
//      AListBoxItem:=Self.lbList.Properties.Items.Add;
//      AListBoxItem.Caption:=FAllList[I];
//
//      if SelectedList.IndexOf(FAllList[I])<>-1 then
//      begin
//        AListBoxItem.Selected:=True;
//      end;
//
//    end;
//
//  finally
//    Self.lbList.Properties.Items.EndUpdate;
//  end;
//
//end;
//
//procedure TFrameBaseMultiSelect.Init(ACaption:String;
//                                AAllList:TBaseList;
//                                ASelectedList:TStringList;
//                                AOnGetBaseListItemCaption:TGetBaseListItemCaptionEvent;
//                                AIsMultiSelect:Boolean);
//var
//  I: Integer;
//  AStringList:TStringList;
//begin
//  AStringList:=TStringList.Create;
//  try
//
//    if (Assigned(AOnGetBaseListItemCaption)) then
//    begin
//      for I := 0 to AAllList.Count-1 do
//      begin
//        FAllList.Add(AOnGetBaseListItemCaption(TBaseList(AAllList)[I]));
//      end;
//    end;
//
//    Init(ACaption,AStringList,ASelectedList,AIsMultiSelect);
//
//  finally
//    FreeAndNil(AStringList);
//  end;
//end;

//procedure TFrameBaseMultiSelect.Init(ACaption: String;
//                                  AAllListCommaText: String;
//                                  ASelectedCommaText: String;
//                                  AIsMultiSelect:Boolean);
//var
//  AStringList:TStringList;
//begin
//  AStringList:=TStringList.Create;
//  try
//    AStringList.CommaText:=AAllListCommaText;
//
//    Self.Init(ACaption,
//              AStringList,
//              ASelectedCommaText,
//              AIsMultiSelect);
//
//  finally
//    FreeAndNil(AStringList);
//  end;
//end;
//
//procedure TFrameBaseMultiSelect.Init(ACaption: String;
//                                  AAllList: TStringList;
//                                  ASelectedCommaText: String;
//                                  AIsMultiSelect:Boolean);
//var
//  AStringList:TStringList;
//begin
//  AStringList:=TStringList.Create;
//  try
//    AStringList.CommaText:=ASelectedCommaText;
//
//    Self.Init(ACaption,AAllList,AStringList,AIsMultiSelect);
//
//  finally
//    FreeAndNil(AStringList);
//  end;
//end;

procedure TFrameBaseMultiSelect.lbListClickItem(AItem: TSkinItem);
begin
  AItem.Selected:=Not AItem.Selected;
end;

//procedure TFrameBaseMultiSelect.PrepareForShow(const ACaption: String;
//  AItemStyle: String;
//  AIsMultiSelect:Boolean;
//  ASelectedList:TStringList);
//begin
////  DisableMessageBoxFrameTopMost;
//
//
//  Self.pnlToolBar.Caption:=ACaption;
//
//  Self.lbList.Prop.MultiSelect:=AIsMultiSelect;
//  SelectedList.Assign(ASelectedList);
//
//
//end;

end.

