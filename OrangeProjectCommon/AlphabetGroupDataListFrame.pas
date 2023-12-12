//convert pas to utf8 by ¥

unit AlphabetGroupDataListFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,

  HzSpell,
  uSkinItems,
  uSkinMaterial,
  uFrameContext,
  WaitingFrame,
  uTimerTask,

//  {$IFDEF ANDROID}
//      Androidapi.Helpers,
//      {$IF RTLVersion=32}// 10.2  TJManifest_permission
//      uAndroidPermission_D10_2,
//      {$ENDIF}
//
//      {$IF RTLVersion>=33}// 10.3+
//      System.Permissions, // 动态权限单元
//      Androidapi.JNI.Os,
//      {$ENDIF}
//  {$ENDIF}

  
//  FMX.AddressBook,
//  FMX.AddressBook.Types,
  XSuperObject,
  uSkinItemJsonHelper,

  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
//  uSkinItems,
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
  uSkinVirtualListType, uSkinButtonType, uBaseSkinControl, uSkinPanelType,
  uTimerTaskEvent;

type
  TFrameAlphabetGroupDataList = class(TFrame)
    pnlToolBar: TSkinFMXPanel;
    lbList: TSkinFMXListView;
    ItemValue: TSkinFMXItemDesignerPanel;
    lblItemCaption: TSkinFMXLabel;
    pnlSearchBar: TSkinFMXPanel;
    edtFilter: TSkinFMXEdit;
    btnClearFilter: TClearEditButton;
    btnReturn: TSkinFMXButton;
    lbIndex: TSkinFMXListView;
    pnlIndex: TSkinFMXPanel;
    idpGroup: TSkinFMXItemDesignerPanel;
    SkinFMXLabel1: TSkinFMXLabel;
    idpItem1: TSkinFMXItemDesignerPanel;
    SkinFMXLabel3: TSkinFMXLabel;
    SkinFMXLabel5: TSkinFMXLabel;
    SkinFMXLabel2: TSkinFMXLabel;
    SkinFMXLabel4: TSkinFMXLabel;
    procedure btnReturnClick(Sender: TObject);
    procedure edtFilterChangeTracking(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure btnClearFilterClick(Sender: TObject);
    procedure lbIndexClickItem(AItem: TSkinItem);
    procedure lbListClickItem(AItem: TSkinItem);
    { Private declarations }
  private
    FRecordList:ISuperArray;

    FFilter:String;
    procedure DoFilter(AFilter:String);

  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    procedure Load(ASuperArray:ISuperArray;ACaptionFieldName:String);
    { Public declarations }
  end;





implementation

{$R *.fmx}


function SortByName_ASC_Compare(Item1, Item2: Pointer): Integer;
var
  Param1,Param2:TSkinItem;
begin
  Param1:=TSkinItem(Item1);
  Param2:=TSkinItem(Item2);

  if Param1.Caption>Param2.Caption then
  begin
    Result:=1;
  end
  else if Param1.Caption<Param2.Caption then
  begin
    Result:=-1;
  end
  else
  begin
    Result:=0;
  end;
end;


function SortByName_ASC_HZSpell(Item1, Item2: Pointer): Integer;
var
  Param1,Param2:TSkinItem;
begin
  Param1:=TSkinItem(Item1);
  Param2:=TSkinItem(Item2);


  Result:=0;

  if Param1.Detail1>Param2.Detail1 then
  begin
      //大
      Result:=1;
  end
  else if Param1.Detail1<Param2.Detail1 then
  begin
      Result:=-1;
  end
  else
  begin
      Result:=0;
  end;

end;



procedure TFrameAlphabetGroupDataList.btnClearFilterClick(Sender: TObject);
begin
  //清除过滤
  Self.edtFilter.Text:='';

  DoFilter(Trim(Self.edtFilter.Text));
end;

procedure TFrameAlphabetGroupDataList.btnReturnClick(Sender: TObject);
begin
  //什么也不做
  //清空返回事件,也就是返回的时候不调用它
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;
  //返回
  HideFrame;//();
  ReturnFrame;//();
end;

constructor TFrameAlphabetGroupDataList.Create(AOwner: TComponent);
begin
  inherited;

  //设置主题颜色
  Self.pnlToolBar.SelfOwnMaterial.BackColor.FillColor.Color:=SkinThemeColor;



  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);


  Self.lbList.Prop.Items.BeginUpdate;
  try
    Self.lbList.Prop.Items.Clear();
  finally
    Self.lbList.Prop.Items.EndUpdate;
  end;

  Self.lbIndex.Prop.Items.BeginUpdate;
  try
    Self.lbIndex.Prop.Items.Clear();
  finally
    Self.lbIndex.Prop.Items.EndUpdate;
  end;


end;

destructor TFrameAlphabetGroupDataList.Destroy;
begin
  inherited;
end;

procedure TFrameAlphabetGroupDataList.DoFilter(AFilter:String);
var
  I: Integer;
  AListViewItem:TSkinListViewItem;
begin
  //过滤
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
          //名称
          or (Pos(LowerCase(AFilter),LowerCase(AListViewItem.Caption))>0)
          //手机
          or (Pos(LowerCase(AFilter),LowerCase(AListViewItem.Detail))>0)
          //名称
          or (Pos(LowerCase(AFilter),LowerCase(AListViewItem.Caption))>0)
          //简拼
  //        or (Pos(LowerCase(AFilter),LowerCase(GetHzPy(FAllList[I])))>0)
          or (Pos(LowerCase(AFilter),LowerCase(AListViewItem.Detail1))>0)
          then
        begin
            if AListViewItem.ItemType=sitDefault then
            begin
              AListViewItem.Visible:=True;
            end
            else if (AListViewItem.ItemType=sitHeader) then
            begin
              //Header只有在非过滤状态下才显示出来
              AListViewItem.Visible:=(AFilter='');
            end;
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

procedure TFrameAlphabetGroupDataList.edtFilterChange(Sender: TObject);
begin
  DoFilter(Trim(Self.edtFilter.Text));
end;

procedure TFrameAlphabetGroupDataList.edtFilterChangeTracking(Sender: TObject);
begin
  DoFilter(Trim(Self.edtFilter.Text));
end;

procedure TFrameAlphabetGroupDataList.lbIndexClickItem(AItem: TSkinItem);
var
  ASkinItem:TSkinItem;
begin
  ASkinItem:=Self.lbList.Prop.Items.FindItemByCaption(AItem.Caption);
  if ASkinItem<>nil then
  begin
    Self.lbList.Prop.ScrollToItem(ASkinItem);
  end;
end;

procedure TFrameAlphabetGroupDataList.lbListClickItem(AItem: TSkinItem);
begin
  HideFrame;
  ReturnFrame;
end;

procedure TFrameAlphabetGroupDataList.Load(ASuperArray:ISuperArray;ACaptionFieldName:String);
var
  I: Integer;
  ASkinItem:TSkinItem;
  AFirstChar:String;
  ATempChar:String;
begin
  FRecordList:=ASuperArray;

//  GlobalContactGetter.GetContacts;


//  //需要定时器检测是否获取完毕
//  Self.tmrCheckGetContacts.Enabled:=True;
//  tmrCheckGetContactsTimer(tmrCheckGetContacts);
  //排序

  Self.lbList.Prop.Items.BeginUpdate;
  Self.lbIndex.Prop.Items.BeginUpdate;
  try
      Self.lbList.Prop.Items.Clear(True);
      Self.lbIndex.Prop.Items.Clear(True);


      FMX.Types.Log.d('OrangeUI TFrameAlphabetGroupDataList.DoLoadContacts Load Begin '+FormatDateTime('HH:MM:SS:ZZZ',Now));


//      for I := 0 to Self.FContacts.Count-1 do
//      begin
//        ASkinItem:=Self.lbList.Prop.Items.Add;
//
//        ASkinItem.Caption:=FContacts[I].DisplayName;
//
//        if FContacts[I].Phones.Count>0 then
//        begin
//          ASkinItem.Detail:=FContacts[I].Phones[0].Number;
//        end;
//        ASkinItem.Detail1:=UpperCase(HZSpell.GetHzPy(ASkinItem.Caption));
//        ASkinItem.Detail2:=ASkinItem.Detail1.Substring(0,1);
//      end;


      for I := 0 to FRecordList.Length-1 do
      begin
//        ASkinItem:=TSkinJsonItem.Create;
        ASkinItem:=Self.lbList.Prop.Items.Add;
        ASkinItem.Json:=FRecordList.O[I];


        ASkinItem.Caption:=FRecordList.O[I].S[ACaptionFieldName];//GlobalContactGetter.NameList[I];
//        ASkinItem.Detail:=GlobalContactGetter.PhoneList[I];
        //全拼
        ASkinItem.Detail1:=UpperCase(HZSpell.GetHzPy(FRecordList.O[I].S[ACaptionFieldName]));
        //拼音首字母
        ASkinItem.Detail2:=ASkinItem.Detail1.Substring(0,1);

      end;
      FMX.Types.Log.d('OrangeUI TFrameAlphabetGroupDataList.DoLoadContacts Load End '+FormatDateTime('HH:MM:SS:ZZZ',Now));



      //排序会比较耗时
      //按字母升序排序
      FMX.Types.Log.d('OrangeUI TFrameAlphabetGroupDataList.DoLoadContacts Sort Begin '+FormatDateTime('HH:MM:SS:ZZZ',Now));
      Self.lbList.Prop.Items.Sort(SortByName_ASC_HZSpell);
      FMX.Types.Log.d('OrangeUI TFrameAlphabetGroupDataList.DoLoadContacts Sort End '+FormatDateTime('HH:MM:SS:ZZZ',Now));



      I:=Self.lbList.Prop.Items.Count-1;
      while I>=0 do
      begin
          ATempChar:=Self.lbList.Prop.Items[I].Detail2;

          if (ATempChar<'A') or (ATempChar>'Z') then
          begin
            ATempChar:='#';
            //要移到最后了
            Self.lbList.Prop.Items.Move(I,Self.lbList.Prop.Items.Count-1);
          end;

          Dec(I);
      end;



      //加入字母
      AFirstChar:='';
      I:=0;
      while I<Self.lbList.Prop.Items.Count do
      begin
          ATempChar:=Self.lbList.Prop.Items[I].Detail2;

          if (ATempChar<'A') or (ATempChar>'Z') then
          begin
            ATempChar:='#';
          end;

          if (AFirstChar<>ATempChar) then
          begin
            AFirstChar:=ATempChar;


            ASkinItem:=Self.lbList.Prop.Items.Insert(I);
            ASkinItem.Caption:=AFirstChar;
            ASkinItem.ItemType:=sitHeader;
            ASkinItem.Height:=30;


            ASkinItem:=Self.lbIndex.Prop.Items.Add;
            ASkinItem.Caption:=AFirstChar;

          end;

          Inc(I);
      end;

  finally
    Self.lbList.Prop.Items.EndUpdate;
    Self.lbIndex.Prop.Items.EndUpdate;
  end;

  lbIndex.Height:=lbIndex.Prop.GetContentHeight;


  DoFilter(Trim(Self.edtFilter.Text));

end;

end.

