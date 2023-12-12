//convert pas to utf8 by ¥
unit uMultiSelectFrame;



interface

{$I FrameWork.inc}

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  {$IFDEF FMX}
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  {$ENDIF}
  {$IFDEF VCL}
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  {$ENDIF}
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
//  {$IFDEF HAS_PAGEFRAMEWORK}
//  uPageStructure,
//  {$ENDIF}

  {$IFDEF FMX}
  MultiSelectFrame,
  {$ENDIF}

  {$IFDEF VCL}
  MultiSelectFrame_VCL,
  {$ENDIF}

//  uAppCommon,
  uSkinListBoxType,
  uSkinLabelType, uSkinItemDesignerPanelType, uSkinScrollControlType,
  uSkinCustomListType, uSkinVirtualListType, uSkinButtonType, uSkinPanelType,
  uBaseSkinControl;

type
  TGetBaseListItemCaptionEvent=function(ABaseListItem:TObject):String of object;


  TFrameMultiSelect = class(TFrameBaseMultiSelect)//,IControlForPageFramework)
//    pnlToolBar: TSkinWinPanel;
//    lbList: TSkinWinListBox;
//    ItemValue: TSkinWinItemDesignerPanel;
//    lblItemCaption: TSkinWinLabel;
//    chkItemSelected: TSkinWinCheckBox;
//    btnReturn: TSkinWinButton;
//    btnOK: TSkinWinButton;
    procedure btnReturnClick(Sender: TObject);override;
    procedure btnOKClick(Sender: TObject);override;
    procedure lbListClickItem(AItem: TSkinItem);override;
//  protected
//    FFieldControlSettingMap:TFieldControlSettingMap;
//    //针对页面框架的控件接口IControlForPageFramework
//    function LoadFromFieldControlSetting(ASetting:TFieldControlSetting;AFieldControlSettingMap:TObject):Boolean;
//    //获取与设置自定义属性
//    function GetPropJsonStr:String;
//    procedure SetPropJsonStr(AJsonStr:String);
//    //获取提交的值,是不是存在多个值
//    function GetPostValue(ASetting:TFieldControlSetting;
//                            APageDataDir:String;
//                            ASetRecordFieldValueIntf:ISetRecordFieldValue;
//                            var AErrorMessage:String):Variant;
//    //设置值
//    procedure SetControlValue(ASetting:TFieldControlSetting;APageDataDir:String;
//                            AImageServerUrl:String;
//                            AValue:Variant;AValueCaption:String;
//                            //要设置多个值,整个字段的记录
//                            AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue
//                            );
////    //设置属性
////    function GetProp(APropName:String):Variant;
////    procedure SetProp(APropName:String;APropValue:Variant);
//    procedure DoReturnFrame(AFromFrame:TFrame);
//  private
//    ItemCaptionFieldControlSetting:TFieldControlSetting;
//    //列表数据控制器
//    ListDataController:TListDataController;
//    procedure DoListDataController_LoadDataToUIEnd(Sender:TObject);

  private

    procedure PrepareForShow(const ACaption:String;
                              AItemStyle:String;
                              AIsMultiSelect:Boolean;
                              ASelectedList:TStringList);

    { Private declarations }
  public
    FFilter:String;
    procedure DoFilter;override;
  public
    FAllList:TStringList;
    SelectedList: TStringList;
    procedure Clear;

    //可以传字符串列表进去
    procedure Init(ACaption:String;
                    AAllList:TStringList;
                    ASelectedList:TStringList;
                    AIsMultiSelect:Boolean=True);overload;
    //可以传逗号分隔的字符串进去
    procedure Init(ACaption:String;
                    AAllList:TStringList;
                    ASelectedCommaText:String;
                    AIsMultiSelect:Boolean=True);overload;
    //可以传逗号分隔的字符串进去
    procedure Init(ACaption:String;
                    AAllListCommaText:String;
                    ASelectedCommaText:String;
                    AIsMultiSelect:Boolean=True);overload;
    //可以传列表进去,列表项的标题可以通过事件去获取
    procedure Init(ACaption:String;
                    AAllList:TBaseList;
                    ASelectedList:TStringList;
                    AOnGetBaseListItemCaption:TGetBaseListItemCaptionEvent;
                    AIsMultiSelect:Boolean=True);overload;

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



var
  GlobalMultiSelectFrame:TFrameMultiSelect;



implementation

//{$R *.dfm}

//uses
//  MessageBoxFrame_VCL;
////  MainForm;

procedure TFrameMultiSelect.btnOKClick(Sender: TObject);
var
  I: Integer;
begin


  Self.SelectedList.Clear;
  for I := 0 to Self.lbList.Prop.Items.Count-1 do
  begin
    if Self.lbList.Prop.Items[I].Selected then
    begin
      SelectedList.Add(Self.lbList.Prop.Items[I].Caption);
    end;
  end;

  HideFrame;////(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self);

//  EnableMessageBoxFrameTopMost;
end;

procedure TFrameMultiSelect.btnReturnClick(Sender: TObject);
begin


  //什么也不做
  //清空返回事件,也就是返回的时候不调用它
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  //返回
  HideFrame;////(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self);

//  EnableMessageBoxFrameTopMost;
end;

procedure TFrameMultiSelect.Clear;
begin

  FAllList.Clear;
  Self.SelectedList.Clear;

  Self.lbList.Properties.Items.BeginUpdate;
  try
    Self.lbList.Properties.Items.Clear(True);
  finally
    Self.lbList.Properties.Items.EndUpdate;
  end;


  Self.edtFilter.Text:='';

end;

constructor TFrameMultiSelect.Create(AOwner: TComponent);
begin
  inherited;
  FAllList:=TStringList.Create;
  SelectedList:=TStringList.Create;
  Self.pnlSearchBar.Visible:=False;

  Clear;
//  //设置主题颜色
//  Self.pnlToolBar.SelfOwnMaterial.BackColor.FillColor.Color:=SkinThemeColor;
//  Self.ItemValue.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Color:=SkinThemeColor;
//
//  Self.chkItemSelected.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Color:=SkinThemeColor;
//  Self.chkItemSelected.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Color:=SkinThemeColor;
//  Self.chkItemSelected.SelfOwnMaterial.BackColor.DrawEffectSetting.PushedEffect.BorderColor.Color:=SkinThemeColor;
//  TSkinCheckBoxColorMaterial(Self.chkItemSelected.SelfOwnMaterial).DrawCheckRectParam.DrawEffectSetting.PushedEffect.FillColor.Color:=SkinThemeColor;
//
//
//  RecordSubControlsLang(Self);
//  TranslateSubControlsLang(Self);



//
//  //列表数据控制器
//  ListDataController:=TListDataController.Create(nil);
//  //菜单标题的绑定字段
//  ItemCaptionFieldControlSetting:=ListDataController.FieldControlSettingList.Add;//TFieldControlSetting.Create(ListDataController.FieldControlSettingList);
//  ItemCaptionFieldControlSetting.bind_listitem_data_type:='ItemCaption';
////  ListDataController.FieldControlSettingList.Add(ItemCaptionFieldControlSetting);

end;

destructor TFrameMultiSelect.Destroy;
begin
//  FreeAndNil(ListDataController);


  FreeAndNil(FAllList);
  FreeAndNil(SelectedList);
  inherited;
end;

procedure TFrameMultiSelect.DoFilter;
var
  I: Integer;
  AFilter:String;
  AListViewItem:TSkinItem;
begin
  inherited;

  //过滤
  AFilter:=Trim(Self.edtFilter.Text);
  if FFilter=AFilter then Exit;


  FFilter:=AFilter;
  Self.btnClearFilter.Visible:=AFilter<>'';


  //过滤
  Self.lbList.Properties.Items.BeginUpdate;
  try

    for I := 0 to Self.lbList.Properties.Items.Count-1 do
    begin
      AListViewItem:=Self.lbList.Properties.Items[I];
      if //(ASelectedList<>nil) and (SelectedList.IndexOf(GetItemCaption(I))=-1)
        //and
        (AFilter='')
        or (Pos(LowerCase(AFilter),LowerCase(Self.lbList.Properties.Items[I].Caption))>0)
//        //简拼
//        or (Pos(LowerCase(AFilter),LowerCase(GetHzPy(FAllList[I])))>0)
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
    Self.lbList.Properties.Items.EndUpdate;
  end;
end;

//procedure TFrameMultiSelect.DoListDataController_LoadDataToUIEnd(Sender: TObject);
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

//procedure TFrameMultiSelect.DoReturnFrame(AFromFrame: TFrame);
//begin
//
//end;
//
//function TFrameMultiSelect.GetPostValue(ASetting: TFieldControlSetting;
//  APageDataDir: String; ASetRecordFieldValueIntf: ISetRecordFieldValue;
//  var AErrorMessage: String): Variant;
//begin
//
//end;
//
//function TFrameMultiSelect.GetPropJsonStr: String;
//begin
//
//end;

//procedure TFrameMultiSelect.Init(ACaption: String;
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

procedure TFrameMultiSelect.Init(ACaption: String;
                                  AAllList: TStringList;
                                  ASelectedList: TStringList;
                                  AIsMultiSelect:Boolean);
var
  I: Integer;
  AListBoxItem:TSkinItem;
begin
  Self.Clear;
  Self.PrepareForShow(ACaption,'',AIsMultiSelect,ASelectedList);

  FAllList.Assign(AAllList);


  //选中的列表
  Self.lbList.Properties.Items.BeginUpdate;
  try
    Self.lbList.Properties.Items.Clear(True);
    for I := 0 to FAllList.Count-1 do
    begin
      AListBoxItem:=Self.lbList.Properties.Items.Add;
      AListBoxItem.Caption:=FAllList[I];

      if SelectedList.IndexOf(FAllList[I])<>-1 then
      begin
        AListBoxItem.Selected:=True;
      end;

    end;

  finally
    Self.lbList.Properties.Items.EndUpdate;
  end;

end;

procedure TFrameMultiSelect.Init(ACaption:String;
                                AAllList:TBaseList;
                                ASelectedList:TStringList;
                                AOnGetBaseListItemCaption:TGetBaseListItemCaptionEvent;
                                AIsMultiSelect:Boolean);
var
  I: Integer;
  AStringList:TStringList;
begin
  AStringList:=TStringList.Create;
  try

    if (Assigned(AOnGetBaseListItemCaption)) then
    begin
      for I := 0 to AAllList.Count-1 do
      begin
        FAllList.Add(AOnGetBaseListItemCaption(TBaseList(AAllList)[I]));
      end;
    end;

    Init(ACaption,AStringList,ASelectedList,AIsMultiSelect);

  finally
    FreeAndNil(AStringList);
  end;
end;

procedure TFrameMultiSelect.Init(ACaption: String;
                                  AAllListCommaText: String;
                                  ASelectedCommaText: String;
                                  AIsMultiSelect:Boolean);
var
  AStringList:TStringList;
begin
  AStringList:=TStringList.Create;
  try
    AStringList.CommaText:=AAllListCommaText;

    Self.Init(ACaption,
              AStringList,
              ASelectedCommaText,
              AIsMultiSelect);

  finally
    FreeAndNil(AStringList);
  end;
end;

procedure TFrameMultiSelect.Init(ACaption: String;
                                  AAllList: TStringList;
                                  ASelectedCommaText: String;
                                  AIsMultiSelect:Boolean);
var
  AStringList:TStringList;
begin
  AStringList:=TStringList.Create;
  try
    AStringList.CommaText:=ASelectedCommaText;

    Self.Init(ACaption,AAllList,AStringList,AIsMultiSelect);

  finally
    FreeAndNil(AStringList);
  end;
end;

procedure TFrameMultiSelect.lbListClickItem(AItem: TSkinItem);
begin
  AItem.Selected:=Not AItem.Selected;
end;

//function TFrameMultiSelect.LoadFromFieldControlSetting(
//  ASetting: TFieldControlSetting; AFieldControlSettingMap: TObject): Boolean;
//begin
//
//end;

procedure TFrameMultiSelect.PrepareForShow(const ACaption: String;
  AItemStyle: String;
  AIsMultiSelect:Boolean;
  ASelectedList:TStringList);
begin
//  DisableMessageBoxFrameTopMost;


  Self.pnlToolBar.Caption:=ACaption;

  Self.lbList.Prop.MultiSelect:=AIsMultiSelect;
  SelectedList.Assign(ASelectedList);


end;

//procedure TFrameMultiSelect.SetControlValue(ASetting: TFieldControlSetting;
//  APageDataDir, AImageServerUrl: String; AValue: Variant; AValueCaption: String;
//  AGetDataIntfResultFieldValueIntf: IGetDataIntfResultFieldValue);
//begin
//
//end;
//
//procedure TFrameMultiSelect.SetPropJsonStr(AJsonStr: String);
//begin
//
//end;

end.

