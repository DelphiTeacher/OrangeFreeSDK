//convert pas to utf8 by ¥

unit PopupMenuFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uSkinFireMonkeyControl, uSkinFireMonkeyPanel, uSkinFireMonkeyLabel,
  Math,

  HzSpell,
  uSkinFireMonkeyEdit,
  uSkinFireMonkeyMemo,
  uProcessNativeControlModalShowPanel,

  uFrameContext,
  uUIFunction,
  uVersion,
  uSkinItems,
//  uAppCommon,
  uBasePageStructure,
  uSkinItemJsonHelper,
//  uVirtualListDataController,
  uComponentType,
  uSkinBufferBitmap,
  uSkinLabelType,
  uDrawTextParam,
  WaitingFrame,
  MessageBoxFrame,
  uTimerTask,
  uSkinImageList,


  XSuperObject,
  XSuperJson,


  uSkinFireMonkeyItemDesignerPanel,
  uSkinFireMonkeyButton, FMX.Objects, uSkinMaterial, uSkinButtonType,
  uSkinFireMonkeyScrollControl, uSkinFireMonkeyVirtualList,
  uSkinFireMonkeyListBox, uSkinFireMonkeyCustomList, uSkinScrollControlType,
  uSkinCustomListType, uSkinVirtualListType, uSkinListBoxType, uBaseSkinControl,
  uSkinPanelType, uSkinRadioButtonType, uSkinFireMonkeyRadioButton,
  uSkinFireMonkeyPopup, uTimerTaskEvent, FMX.Edit, FMX.Controls.Presentation,
  uSkinTreeViewType, uSkinFireMonkeyTreeView, uSkinItemDesignerPanelType,
  uDrawCanvas;





const
  Const_PopupMenuWidth:Double=320;

type
  //判断列表项是否是该分类
  TCheckItemIsOfThisCategoryEvent=procedure(Sender:TObject;
                                      AItem:TSkinItem;
                                      ACategoryItem:TSkinItem;
                                      var AIsOfThisCategory:Boolean) of object;

  TIntegerArray=array of Integer;
  TFramePopupMenu = class(TFrame,IFrameHistroyVisibleEvent)
    BackRectangle: TRectangle;
    pnlPopupMenu: TSkinFMXPanel;
    pnlTopDevide: TSkinFMXPanel;
    lbMenus: TSkinFMXTreeView;
    lblCaption: TSkinFMXLabel;
    edtFilter: TSkinFMXEdit;
    btnClearFilter: TClearEditButton;
    lbItemCategory: TSkinFMXListBox;
    idpCategory: TSkinFMXItemDesignerPanel;
    lblCategoryName: TSkinFMXLabel;
    procedure lbMenusClickItem(Sender: TSkinItem);
    procedure FrameResize(Sender: TObject);
    procedure BackRectangleClick(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure edtFilterChangeTracking(Sender: TObject);
    procedure lbMenusClickItemDesignerPanelChild(Sender: TObject;
      AItem: TBaseSkinItem; AItemDesignerPanel: TSkinFMXItemDesignerPanel;
      AChild: TFmxObject);
    procedure lbItemCategoryClickItem(AItem: TSkinItem);
  private
    //显示Frame
    procedure DoShow;
    //隐藏Frame
    procedure DoHide;
  private
    FFilter:String;
    procedure DoFilter;
  private
    FOnCustomLoadDataToUIEnd:TNotifyEvent;

//    //列表数据控制器
//    ListDataController:TListDataController;

    procedure DoListDataController_LoadDataToUIEnd(Sender:TObject);


    procedure Clear;
    procedure PrepareForShow(const ACaption:String;
                              AItemStyle:String;
                              AIsShowFilter:Boolean;
                              AWidth:Double=320);
    procedure HidePopupMenu;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    //点击的菜单项的标题
    ModalResult:String;
    //点击的菜单项的Item.Name
    ModalResultName:String;
    ModalResultItem:TSkinItem;
    ModalResultDataJsonStr:String;
    ModalResultDataJson:ISuperObject;
    //选择的下标
    ModalResultIndex:Integer;
  public


    //静态数据
    procedure Init( //菜单框标题
                    const ACaption:String;
                    //菜单项数组,['男','女','未知']
                    AMenuCaptions:Array of String;
                    //['male','female','unknow']
                    AMenuNames:Array of String;
                    //列表项的样式
                    AItemStyle:String='';
                    //是否显示过滤框
                    AIsShowFilter:Boolean=False;
                    //窗体宽度
                    AWidth:Double=320;
                    ARecordListArray:ISuperArray=nil;
                    //图片列表
                    AMenuImageList:TSkinImageList=nil;
                    //每个菜单的图标
                    AMenuIconImageIndexs:TIntegerArray=[]);overload;

    procedure Init( //菜单框标题
                    const ACaption:String;
                    //菜单项数组,['男','女','未知']
                    AMenuCaptions:Array of String;
                    //列表项的样式
                    AItemStyle:String='';
                    //是否显示过滤框
                    AIsShowFilter:Boolean=False;
                    //宽度
                    AWidth:Double=320);overload;
  public
    //动态数据(简单,只显示标题)
    procedure Init( //菜单框标题
                    const ACaption:String;
                    //获取Json数据的过程,
                    AOnGetDataJsonEvent:TTimerTaskNotify;
                    //Json数据中列表的Key
                    ADataJsonArrayKey:String;
                    //标题显示Json中的哪个Key
                    AItemCaptionBindingFieldName:String;
                    //列表项的样式
                    AItemStyle:String='';
                    //是否显示过滤框
                    AIsShowFilter:Boolean=False;
                    AWidth:Double=320;
                    //是否需要插入第一个空的列表项
                    AIsNeedInsertFirstEmptyItem:Boolean=False;
                    AOnCustomLoadDataToUIEnd:TNotifyEvent=nil
                    );overload;

    //动态数据(复杂,显示多个字段)
    procedure Init( //菜单框标题
                    const ACaption:String;
                    //获取Json数据的过程
                    AOnGetDataJsonEvent:TTimerTaskNotify;
                    //Json数据中列表的Key
                    ADataJsonArrayKey:String;
                    //标题显示Json中的哪个Key
                    AItemDataBindingFieldNames:Array of String;
                    AItemDataType:Array of String;
                    //列表项的样式
                    AItemStyle:String='';
                    //是否显示过滤框
                    AIsShowFilter:Boolean=False;
                    AWidth:Double=320;
                    //是否需要插入第一个空的列表项
                    AIsNeedInsertFirstEmptyItem:Boolean=False;
                    AOnCustomLoadDataToUIEnd:TNotifyEvent=nil
                    );overload;


  public
    //判断列表项属于哪个分类的事件
    OnCheckItemIsOfThisCategory:TCheckItemIsOfThisCategoryEvent;

    procedure InitCategory(
        //分类
        ACategoryCaptions:Array of String;
        ACategoryNames:Array of String;
        //判断列表项属于哪个分类的事件
        AOnCheckItemIsOfThisCategory:TCheckItemIsOfThisCategoryEvent);

    procedure FilterSelectedCategory;
//  public
//
//    //弹出框的宽度
//    MenuWidth:Single;
//    //设置文本显示及宽度   需在Init后使用
//    procedure SetProp(//居左0 居中1 居右2
//                      AFontHorzAlign:Integer;
//                      //菜单框宽度
//                      AWidth:Integer);
    { Public declarations }
  end;


var
  GlobalPopupMenuFrame:TFramePopupMenu;



implementation


{$R *.fmx}


{ TFramePopupMenu }

procedure TFramePopupMenu.BackRectangleClick(Sender: TObject);
begin
  //按空白区域则返回上一页
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  HidePopupMenu;
end;

procedure TFramePopupMenu.Clear;
begin
  ModalResult:='';
  ModalResultName:='';
  ModalResultItem:=nil;
  ModalResultDataJsonStr:='';
  ModalResultDataJson:=nil;
  ModalResultIndex:=-1;


  FOnCustomLoadDataToUIEnd:=nil;


  //加载菜单项到ListBox
  Self.lbMenus.Prop.Items.BeginUpdate;
  try
    Self.lbMenus.Prop.Items.Clear(True);
  finally
    Self.lbMenus.Prop.Items.EndUpdate;
  end;


  Self.lbItemCategory.Visible:=False;
end;

constructor TFramePopupMenu.Create(AOwner: TComponent);
begin
  inherited;


  //设置主题颜色
  lblCaption.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.Color:=SkinThemeColor;
  pnlTopDevide.SelfOwnMaterialToDefault.BackColor.FillColor.Color:=SkinThemeColor;


  Self.lbMenus.Prop.Items.Clear(True);
//  //记住默认宽度
//  MenuWidth:=Self.pnlPopupMenu.Width;

  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);

//  ListDataController:=TListDataController.Create(nil);
end;

destructor TFramePopupMenu.Destroy;
begin
//  FreeAndNil(ListDataController);
  inherited;
end;

procedure TFramePopupMenu.DoFilter;
var
  I: Integer;
  AFilter:String;
begin
  //过滤
  AFilter:=Trim(Self.edtFilter.Text);
  if FFilter=AFilter then Exit;


  FFilter:=AFilter;
  Self.btnClearFilter.Visible:=AFilter<>'';


  //过滤
  Self.lbMenus.Properties.Items.BeginUpdate;
  try

    for I := 0 to Self.lbMenus.Properties.Items.Count-1 do
    begin

        if //(ASelectedList<>nil) and (SelectedList.IndexOf(GetItemCaption(I))=-1)
          //and
              (AFilter='')
          or (Pos(LowerCase(AFilter),LowerCase(Self.lbMenus.Properties.Items[I].Caption))>0)
          //简拼
          or (Pos(LowerCase(AFilter),LowerCase(GetHzPy(Self.lbMenus.Properties.Items[I].Caption)))>0)

          or (Pos(LowerCase(AFilter),LowerCase(Self.lbMenus.Properties.Items[I].Detail))>0)
          //简拼
          or (Pos(LowerCase(AFilter),LowerCase(GetHzPy(Self.lbMenus.Properties.Items[I].Detail)))>0)
          then
        begin
            Self.lbMenus.Properties.Items[I].Visible:=True
        end
        else
        begin
            Self.lbMenus.Properties.Items[I].Visible:=False
        end;

    end;

  finally
    Self.lbMenus.Properties.Items.EndUpdate;
  end;


end;

procedure TFramePopupMenu.DoHide;
begin
  //一定要放在隐藏WaitingFrame的后面
  //先隐藏WaitingFrame,再还原显示原生控件,免得WaitingFrame被盖住
  RestoreGlobalEditListAsPlatformType;
  RestoreGlobalMemoListAsPlatformType;
  ProcessNativeControlEndModalShow;
end;

procedure TFramePopupMenu.DoListDataController_LoadDataToUIEnd(Sender: TObject);
begin
  if Assigned(FOnCustomLoadDataToUIEnd) then
  begin
    FOnCustomLoadDataToUIEnd(Self);
  end;
  //设置弹出框的高度
  FrameResize(nil);
end;

procedure TFramePopupMenu.DoShow;
begin
  //先隐藏原生控件,再显示WaitingFrame,避免WaitingFrame被盖住
  SetGlobalEditListAsStyleType;
  SetGlobalMemoListAsStyleType;
  ProcessNativeControlBeginModalShow;
end;

procedure TFramePopupMenu.edtFilterChange(Sender: TObject);
begin
  DoFilter;
end;

procedure TFramePopupMenu.edtFilterChangeTracking(Sender: TObject);
begin
  DoFilter;
end;

procedure TFramePopupMenu.FilterSelectedCategory;
var
  I: Integer;
  AIsOfThisCategory:Boolean;
begin
  if Self.lbItemCategory.Visible
    and (Self.lbItemCategory.Prop.SelectedItem<>nil)
    and (Assigned(Self.OnCheckItemIsOfThisCategory)) then
  begin
    for I := 0 to Self.lbMenus.Prop.Items.Count-1 do
    begin
      AIsOfThisCategory:=False;
      OnCheckItemIsOfThisCategory(Self,
                  Self.lbMenus.Prop.Items[I],
                  Self.lbItemCategory.Prop.SelectedItem,
                  AIsOfThisCategory);
      Self.lbMenus.Prop.Items[I].Visible:=AIsOfThisCategory;

    end;
  end;
end;

procedure TFramePopupMenu.FrameResize(Sender: TObject);
var
  AMenuCount:Integer;
begin

  //计算需要一屏能显示几个菜单项
  AMenuCount:=Self.lbMenus.Prop.ListLayoutsManager.GetVisibleItemsCount;
  if AMenuCount>0 then
  begin
      //有数据
      if Self.lbMenus.Prop.GetContentHeight+lblCaption.Height+Self.edtFilter.Height>Height then
      begin
        //超出高度了,看看能显示得下几个菜单项
        AMenuCount:=Floor(
                          (Height
                            -Self.lblCaption.Height
                            -Self.edtFilter.Height
                            -40//要留空的区域
                            )
                            / Self.lbMenus.Prop.ItemHeight
                         );
        //至少显示一个菜单项
        if AMenuCount<=0 then
        begin
          AMenuCount:=1;
        end;
      end;
  end
  else
  begin
      //没有数据,保持高度,不然难看
      AMenuCount:=5;
  end;


  Self.pnlPopupMenu.Height:=Self.pnlTopDevide.Height
                            +AMenuCount*Self.lbMenus.Prop.ItemHeight;
  if Self.lblCaption.Visible then
  begin
    Self.pnlPopupMenu.Height:=Self.pnlPopupMenu.Height+Self.lblCaption.Height;
  end;
  if Self.edtFilter.Visible then
  begin
    Self.pnlPopupMenu.Height:=Self.pnlPopupMenu.Height+Self.edtFilter.Height;
  end;
end;

procedure TFramePopupMenu.HidePopupMenu;
begin
//  EnableMessageBoxFrameTopMost;
  if GlobalTopMostFrameList<>nil then
  begin
    GlobalTopMostFrameList.Remove(Self,False);
  end;

  //隐藏弹出框
  HideFrame;//(Self,hfcttBeforeReturnFrame,ufsefNone);
  ReturnFrame;//(Self);
end;

procedure TFramePopupMenu.Init(const ACaption: String;
                                AOnGetDataJsonEvent: TTimerTaskNotify;
                                ADataJsonArrayKey: String;
                                AItemCaptionBindingFieldName:String;
                                AItemStyle:String='';
                                AIsShowFilter:Boolean=False;
                                AWidth:Double=320;
                                //是否需要插入第一个空的列表项
                                AIsNeedInsertFirstEmptyItem:Boolean=False;
                                AOnCustomLoadDataToUIEnd:TNotifyEvent=nil);
var
  AItemCaptionFieldControlSetting:TFieldControlSetting;
begin
  Clear;

  PrepareForShow(ACaption,AItemStyle,AIsShowFilter,AWidth);


  //设置弹出框的高度
  FrameResize(nil);

  FOnCustomLoadDataToUIEnd:=AOnCustomLoadDataToUIEnd;


//  //wn
//  ListDataController.FieldControlSettingList.Clear;
//  //菜单标题的绑定字段
////  AItemCaptionFieldControlSetting:=TFieldControlSetting.Create(ListDataController.FieldControlSettingList);
//  AItemCaptionFieldControlSetting:=TFieldControlSetting(ListDataController.FieldControlSettingList.Add);
//  AItemCaptionFieldControlSetting.bind_listitem_data_type:='ItemCaption';
//  AItemCaptionFieldControlSetting.field_name:=AItemCaptionBindingFieldName;
//
//
//
//  //获取数据
//  ListDataController.GetData(Self,
//                            Self.lbMenus,
//                            AOnGetDataJsonEvent,
//                            DoListDataController_LoadDataToUIEnd,
//                            ADataJsonArrayKey,
//                            AItemStyle,
//                            AIsNeedInsertFirstEmptyItem);


end;

procedure TFramePopupMenu.Init(
  const ACaption: String;
  AMenuCaptions: array of String;
  AItemStyle: String;
  AIsShowFilter:Boolean;
  AWidth:Double);
begin
  //静态初始
  Init(ACaption,
      AMenuCaptions,
      //没有name
      [],
      AItemStyle,
      AIsShowFilter,
      AWidth,
      nil);
end;

procedure TFramePopupMenu.lbItemCategoryClickItem(AItem: TSkinItem);
begin
  FilterSelectedCategory;
end;

procedure TFramePopupMenu.lbMenusClickItem(Sender: TSkinItem);
begin
  if IsRepeatClickReturnButton(Self) then Exit;



  HidePopupMenu;


  //选择的菜单项
  ModalResult:=Sender.Caption;
  ModalResultName:=Sender.Name;
  ModalResultDataJsonStr:=Sender.DataJsonStr;
  ModalResultDataJson:=nil;
  if GetItemJsonObject(Sender)<>nil then
  begin
    ModalResultDataJson:=GetItemJsonObject(Sender).Json;
  end;
  ModalResultIndex:=Sender.Index;
  ModalResultItem:=Sender;
end;

procedure TFramePopupMenu.lbMenusClickItemDesignerPanelChild(Sender: TObject;
  AItem: TBaseSkinItem; AItemDesignerPanel: TSkinFMXItemDesignerPanel;
  AChild: TFmxObject);
begin
  if AChild.Name='imgGroupExpanded' then
  begin
    TSkinTreeViewItem(AItem).Expanded:=not TSkinTreeViewItem(AItem).Expanded;
  end;
end;

procedure TFramePopupMenu.PrepareForShow(const ACaption: String;
                                          AItemStyle:String;
                                          AIsShowFilter:Boolean;
                                          AWidth:Double);
begin


//  //避免被MessageBox挡住
//  DisableMessageBoxFrameTopMost;
  if (GlobalTopMostFrameList<>nil) and (GlobalTopMostFrameList.IndexOf(Self)=-1) then
  begin
    GlobalTopMostFrameList.Add(Self);
  end;



  FFilter:='';
  Self.edtFilter.OnChange:=nil;
  Self.edtFilter.OnChangeTracking:=nil;
  Self.edtFilter.Text:='';
  Self.edtFilter.Visible:=AIsShowFilter;
  //恢复事件
  Self.edtFilter.OnChange:=Self.edtFilterChange;
  Self.edtFilter.OnChangeTracking:=edtFilterChangeTracking;




  //标题
  Self.lblCaption.Caption:=ACaption;
  //恢复默认状态
//  Self.lblCaption.Height:=60;
  Self.pnlTopDevide.Visible:=True;
  Self.lblCaption.Visible:=True;
  Self.pnlPopupMenu.Width:=300;//MenuWidth;
//  SetProp(0,0);
  //标题为空时不显示标题及分割线
  if ACaption='' then
  begin
//    Self.lblCaption.Height:=0;
    Self.lblCaption.Visible:=False;
    Self.pnlTopDevide.Visible:=False;
  end;



  Self.pnlPopupMenu.Width:=AWidth;


  //DefaultTypeItemStyle这个功能是先设置好ItemMaterial，而不是使用设计面板
//  Self.lbMenus.SelfOwnMaterialToDefault.DefaultTypeItemStyle:=AItemStyle;


  Self.lbMenus.Prop.DefaultItemStyle:=AItemStyle;
  Self.lbMenus.Prop.ParentTypeItemStyle:='';




end;

//procedure TFramePopupMenu.SetProp(AFontHorzAlign, AWidth: Integer);
//begin
//  //标题FontHorzAlign
//  Self.lblCaption.SelfOwnMaterialToDefault.DrawCaptionParam.FontHorzAlign:=TFontHorzAlign(AFontHorzAlign);
//  //菜单项FontHorzAlign
//  Self.lbMenus.SelfOwnMaterialToDefault.DrawItemCaptionParam.FontHorzAlign:=TFontHorzAlign(AFontHorzAlign);
//
//  //设置菜单框宽度  0不修改
//  if (AWidth<>0) AND (AWidth<>Self.pnlPopupMenu.Width) then
//  begin
//    Self.pnlPopupMenu.Width:=AWidth;
//  end;
//end;

procedure TFramePopupMenu.Init(const ACaption:String;
                              AMenuCaptions:Array of String;
                              AMenuNames:Array of String;
                              AItemStyle:String;
                              AIsShowFilter:Boolean;
                              AWidth:Double;
                              ARecordListArray:ISuperArray;
                              AMenuImageList:TSkinImageList;
                              AMenuIconImageIndexs:TIntegerArray);
var
  I: Integer;
  AItem:TSkinItem;
begin
  Clear;

  PrepareForShow(ACaption,
                  AItemStyle,
                  AIsShowFilter,
                  AWidth);


  Self.lbMenus.Prop.SkinImageList:=AMenuImageList;

  //加载菜单项到ListBox
  Self.lbMenus.Prop.Items.BeginUpdate;
  try
    for I := 0 to Length(AMenuCaptions)-1 do
    begin
      AItem:=Self.lbMenus.Prop.Items.Add;
      AItem.Caption:=AMenuCaptions[I];
      if Length(AMenuNames)>I then
      begin
        AItem.Name:=AMenuNames[I];
      end;

      if ARecordListArray<>nil then
      begin
        AItem.Json:=ARecordListArray.O[I];
      end;

      if Length(AMenuIconImageIndexs)>I then
      begin
        AItem.Icon.ImageIndex:=AMenuIconImageIndexs[I];
      end;

    end;
  finally
    Self.lbMenus.Prop.Items.EndUpdate;
  end;



  //设置弹出框的高度
  FrameResize(nil);
end;

procedure TFramePopupMenu.Init(
                              const ACaption:String;
                              //获取Json数据的过程
                              AOnGetDataJsonEvent:TTimerTaskNotify;
                              //Json数据中列表的Key
                              ADataJsonArrayKey:String;
                              //标题显示Json中的哪个Key
                              AItemDataBindingFieldNames:Array of String;
                              AItemDataType:Array of String;
                              //列表项的样式
                              AItemStyle:String='';
                              AIsShowFilter:Boolean=False;
                              AWidth:Double=320;
                              //是否需要插入第一个空的列表项
                              AIsNeedInsertFirstEmptyItem:Boolean=False;
                              AOnCustomLoadDataToUIEnd:TNotifyEvent=nil
                              );
var
  I: Integer;
  AFieldControlSetting:TFieldControlSetting;
begin
  Clear;

  PrepareForShow(ACaption,AItemStyle,AIsShowFilter,AWidth);


  //设置弹出框的高度
  FrameResize(nil);

  FOnCustomLoadDataToUIEnd:=AOnCustomLoadDataToUIEnd;

//  ListDataController.FieldControlSettingList.Clear;
//
//  for I := 0 to Length(AItemDataBindingFieldNames)-1 do
//  begin
//    //绑定字段
////    AFieldControlSetting:=TFieldControlSetting.Create(ListDataController.FieldControlSettingList);
//    AFieldControlSetting:=ListDataController.FieldControlSettingList.Add;
//    AFieldControlSetting.bind_listitem_data_type:=AItemDataType[I];
//    AFieldControlSetting.field_name:=AItemDataBindingFieldNames[I];
//  end;
//
//
//  //获取数据
//  ListDataController.GetData(Self,
//                            Self.lbMenus,
//                            AOnGetDataJsonEvent,
//                            DoListDataController_LoadDataToUIEnd,
//                            ADataJsonArrayKey,
//                            AItemStyle,
//                            AIsNeedInsertFirstEmptyItem);
//

end;

procedure TFramePopupMenu.InitCategory(
        //分类
        ACategoryCaptions:Array of String;
        ACategoryNames:Array of String;
        //判断列表项属于哪个分类的事件
        AOnCheckItemIsOfThisCategory:TCheckItemIsOfThisCategoryEvent);
var
  I: Integer;
  ASkinItem:TSkinItem;
begin

  //判断列表项属于哪个分类的事件
  OnCheckItemIsOfThisCategory:=AOnCheckItemIsOfThisCategory;


  Self.lbItemCategory.Prop.Items.BeginUpdate;
  try
    Self.lbItemCategory.Prop.Items.Clear;

    for I := 0 to Length(ACategoryCaptions)-1 do
    begin
      ASkinItem:=Self.lbItemCategory.Prop.Items.Add;

      ASkinItem.Caption:=ACategoryCaptions[I];
      if Length(ACategoryNames)>0 then
      begin
        ASkinItem.Name:=ACategoryNames[I];
      end;
      
    end;
  finally
    Self.lbItemCategory.Prop.Items.EndUpdate;
  end;

  Self.lbItemCategory.Visible:=(Length(ACategoryCaptions)>0)
                                and Assigned(Self.OnCheckItemIsOfThisCategory);



end;

end.

