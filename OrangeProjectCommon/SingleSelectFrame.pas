//convert pas to utf8 by ¥

unit SingleSelectFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

  HzSpell,
  uSkinMaterial,
  uFrameContext,
  uSkinItemJsonHelper,
  XSuperObject,

  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
  uSkinItems,
  uUIFunction,
  uDrawCanvas,
  uBaseLog,
  uBaseList,
  uSkinBufferBitmap,
  uSkinLabelType,
  uSkinListBoxType,
  uSkinListViewType,
  uSkinFireMonkeyScrollControl,
  uSkinFireMonkeyListBox,
  uSkinFireMonkeyCheckBox,
  uSkinFireMonkeyLabel,
  uSkinFireMonkeyImage,
  uSkinFireMonkeyItemDesignerPanel,
  FMX.Edit,
  uSkinFireMonkeyEdit,
  uSkinFireMonkeyListView,
  FMX.Controls.Presentation,
  uSkinFireMonkeyVirtualList, uSkinFireMonkeyCustomList,
  uSkinItemDesignerPanelType, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinButtonType, uBaseSkinControl, uSkinPanelType;

type
  TGetBaseListItemCaptionEvent=function(ABaseListItem:TObject):String of object;

  TFrameSingleSelect = class(TFrame)
    pnlToolBar: TSkinFMXPanel;
    lbList: TSkinFMXListView;
    ItemValue: TSkinFMXItemDesignerPanel;
    lblItemCaption: TSkinFMXLabel;
    pnlSearchBar: TSkinFMXPanel;
    edtFilter: TSkinFMXEdit;
    btnClearFilter: TClearEditButton;
    btnReturn: TSkinFMXButton;
    btnOK: TSkinFMXButton;
    procedure lbListClickItem(Sender: TSkinItem);virtual;
    procedure btnReturnClick(Sender: TObject);
    procedure edtFilterChangeTracking(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure btnClearFilterClick(Sender: TObject);
    procedure lbListNewListItemStyleFrameCacheInit(Sender: TObject;
      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);virtual;
    procedure lbListPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinFMXItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);virtual;
    procedure btnOKClick(Sender: TObject);virtual;
  private
    { Private declarations }
  public
    FFilter:String;
    procedure DoFilter;
  public
    //所有选项
    FAllList:TStringList;
    //当前选择的项
    Selected:String;
    procedure Init(ACaption:String;ASelected:String);overload;
    procedure AfterInit;

    procedure Init(ACaption:String;
                    AAllList:TBaseList;
                    ASelected:String;
                    AOnGetBaseListItemCaption:TGetBaseListItemCaptionEvent);overload;
    procedure Init(ACaption:String;
                    AAllList:TStringList;
                    ASelected:String);overload;
    procedure Init(ACaption:String;
                    AAllListCommaText:String;
                    ASelected:String);overload;
    procedure Init(ACaption:String;
                    ARecordList:ISuperArray;
                    AItemCaptionFieldName:String;
                    ASelected:String);overload;
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;



var
  GlobalSingleSelectFrame:TFrameSingleSelect;



implementation

{$R *.fmx}

procedure TFrameSingleSelect.AfterInit;
var
  I: Integer;
  CaptionLen:Integer;
  MaxCaption:String;
  MaxCaptionLen:Integer;
  MaxCaptionWidth:Double;
//  AListViewItem:TSkinListViewItem;
begin



  MaxCaption:='';
  MaxCaptionLen:=0;
  Self.lbList.Properties.Items.BeginUpdate;
  try
      for I := 0 to FAllList.Count-1 do
      begin
//          AListViewItem:=Self.lbList.Properties.Items[I];
//
//          //找出最长的标题
//          CaptionLen:=Length(FAllList.Caption);
//          if CaptionLen>MaxCaptionLen then
//          begin
//            MaxCaption:=AListViewItem.Caption;
//            MaxCaptionLen:=CaptionLen;
//          end;

          //找出最长的标题
          CaptionLen:=Length(FAllList[I]);
          if CaptionLen>MaxCaptionLen then
          begin
            MaxCaption:=FAllList[I];
            MaxCaptionLen:=CaptionLen;
          end;
      end;




      //设置列表的宽度
      MaxCaptionWidth:=uSkinBufferBitmap.GetStringWidth(MaxCaption,
          RectF(0,0,MaxInt,MaxInt),
          Self.lblItemCaption.SelfOwnMaterialToDefault.DrawCaptionParam);
      if MaxCaptionWidth>Self.lbList.WidthInt then
      begin

          //有选项的宽度比列表控件还要宽
          Self.lbList.Properties.ItemWidth:=MaxCaptionWidth+50;
          //设置拖动的精度
          Self.lbList.HorzScrollBar.Properties.ControlGestureManager.IsNeedDecideFirstGestureKind:=True;

      end
      else
      begin

          //列表控件的宽度可以显示得下所有的选项
          Self.lbList.Properties.ItemWidth:=-1;
          Self.lbList.HorzScrollBar.Properties.ControlGestureManager.IsNeedDecideFirstGestureKind:=False;

      end;


  finally
    Self.lbList.Properties.Items.EndUpdate;
  end;


  //恢复事件
  Self.edtFilter.OnChange:=Self.edtFilterChange;
  Self.edtFilter.OnChangeTracking:=edtFilterChangeTracking;

end;

procedure TFrameSingleSelect.btnClearFilterClick(Sender: TObject);
begin
  //清除过滤
  Self.edtFilter.Text:='';

  DoFilter;
end;

procedure TFrameSingleSelect.btnOKClick(Sender: TObject);
begin
  //返回
  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame(Self);
end;

procedure TFrameSingleSelect.btnReturnClick(Sender: TObject);
begin
  //什么也不做
  //清空返回事件,也就是返回的时候不调用它
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;
  //返回
  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame(Self);
end;

constructor TFrameSingleSelect.Create(AOwner: TComponent);
begin
  inherited;
  FAllList:=TStringList.Create;

  //设置主题颜色
  Self.pnlToolBar.SelfOwnMaterial.BackColor.FillColor.Color:=SkinThemeColor;

  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

destructor TFrameSingleSelect.Destroy;
begin
  FreeAndNil(FAllList);
  inherited;
end;

procedure TFrameSingleSelect.DoFilter;
var
  I: Integer;
  AFilter:String;
  AListViewItem:TSkinListViewItem;
begin
  //过滤
  AFilter:=Trim(Self.edtFilter.Text);
  if FFilter=AFilter then Exit;


  FFilter:=AFilter;
  Self.btnClearFilter.Visible:=AFilter<>'';


  //过滤
  Self.lbList.Properties.Items.BeginUpdate;
  try
    Self.lbList.Properties.Items.Clear(True);

    for I := 0 to FAllList.Count-1 do
    begin

      if //(ASelectedList<>nil) and (SelectedList.IndexOf(GetItemCaption(I))=-1)
        //and
        (AFilter='')
        or (Pos(LowerCase(AFilter),LowerCase(FAllList[I]))>0)
        //简拼
        or (Pos(LowerCase(AFilter),LowerCase(GetHzPy(FAllList[I])))>0)
        then
      begin
        AListViewItem:=Self.lbList.Properties.Items.Add;
        AListViewItem.Caption:=FAllList[I];
      end;

    end;

  finally
    Self.lbList.Properties.Items.EndUpdate;
  end;
end;

procedure TFrameSingleSelect.edtFilterChange(Sender: TObject);
begin
  DoFilter;
end;

procedure TFrameSingleSelect.edtFilterChangeTracking(Sender: TObject);
begin
  DoFilter;
end;

procedure TFrameSingleSelect.Init(ACaption, AAllListCommaText,ASelected: String);
var
  AStringList:TStringList;
begin
  AStringList:=TStringList.Create;
  try
    AStringList.CommaText:=AAllListCommaText;

    Self.Init(ACaption,AStringList,ASelected);

  finally
    FreeAndNil(AStringList)
  end;
end;

procedure TFrameSingleSelect.Init(ACaption:String;
                                  AAllList:TStringList;
                                  ASelected:String);
var
  I: Integer;
  AListViewItem:TSkinListViewItem;
begin
  Init(ACaption,ASelected);

  FAllList.Assign(TStringList(AAllList));


  Self.lbList.Properties.Items.BeginUpdate;
  try
    //添加选项
    Self.lbList.Properties.Items.Clear(True);
    for I := 0 to FAllList.Count-1 do
    begin
        AListViewItem:=Self.lbList.Properties.Items.Add;
        AListViewItem.Caption:=FAllList[I];
    end;
  finally
    Self.lbList.Properties.Items.EndUpdate;
  end;


  AfterInit;
end;

procedure TFrameSingleSelect.Init(ACaption:String;
                                  AAllList:TBaseList;
                                  ASelected:String;
                                  AOnGetBaseListItemCaption:TGetBaseListItemCaptionEvent);
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
        AStringList.Add(AOnGetBaseListItemCaption(TBaseList(AAllList)[I]));
      end;
    end;

    Init(ACaption,AStringList,ASelected);

  finally
    FreeAndNil(AStringList);
  end;
end;

procedure TFrameSingleSelect.lbListClickItem(Sender: TSkinItem);
begin
  Selected:=TSkinItem(Sender).Caption;

  //选中某一项，关闭窗体
  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame(Self);
end;

procedure TFrameSingleSelect.lbListNewListItemStyleFrameCacheInit(
  Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
begin
  //
end;

procedure TFrameSingleSelect.lbListPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinFMXItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
begin
  //
end;

procedure TFrameSingleSelect.Init(ACaption: String; ARecordList: ISuperArray;
  AItemCaptionFieldName, ASelected: String);
var
  I: Integer;
//  AListViewItem:TSkinJsonItem;
  AListViewItem:TSkinItem;
begin
  Init(ACaption,ASelected);

  Self.lbList.Properties.Items.BeginUpdate;
  try
    //添加选项
    Self.lbList.Properties.Items.Clear(True);
    for I := 0 to ARecordList.Length-1 do
    begin
        FAllList.Add(ARecordList.O[I].S[AItemCaptionFieldName]);
//        AListViewItem:=TSkinJsonItem.Create;
//        AListViewItem.Json:=ARecordList.O[I];
//        Self.lbList.Properties.Items.Add(AListViewItem);
        AListViewItem:=Self.lbList.Properties.Items.Add;
        AListViewItem.Caption:=ARecordList.O[I].S[AItemCaptionFieldName];
    end;
  finally
    Self.lbList.Properties.Items.EndUpdate;
  end;

  AfterInit;

end;

procedure TFrameSingleSelect.Init(ACaption, ASelected: String);
begin

  Selected:='';

  FFilter:='';
  Self.edtFilter.OnChange:=nil;
  Self.edtFilter.OnChangeTracking:=nil;
  Self.edtFilter.Text:='';

  FAllList.Clear;

  //标题
  Self.pnlToolBar.Caption:=ACaption;


  Selected:=ASelected;

  //初始位置滚回到原点
  if Self.pnlToolBar.Caption<>ACaption then
  begin
    Self.lbList.VertScrollBar.Properties.Position:=0;
    Self.lbList.HorzScrollBar.Properties.Position:=0;
  end;

end;

end.


