//convert pas to utf8 by ¥

unit CalendarFrame;

interface

//{$I Config.inc}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uUIFunction,
  uSkinItems,
  DateUtils,
  Math,
  uLang,
//  uCommon,
//  FumaCrm8,
  uBaseLog,
  uDrawCanvas,
//  SettingFrame,
  uGraphicCommon,
  uFuncCommon,
//  uLanguage,
//  uManager,
  uTimerTask,
  uVersion,
  uSkinBufferBitmap,
  WaitingFrame,
//  InspectGoodsFrame,
  SelectMonthFrame,
//  SelectEmployeeFrame,
  uDrawRectParam,
  uDrawTextParam,
  uDrawPictureParam,
//  uDataBase,
  uFrameContext,
  uSkinListViewType,
//  Soap.SOAPHTTPClient,
  MessageBoxFrame,
  uSkinListBoxType,
//  InspectGoodsInfoFrame,
//  FMCommonSkinMaterialModule,
  uSkinFireMonkeyControl, uSkinFireMonkeyPanel, uSkinFireMonkeyNotifyNumberIcon,
  uSkinFireMonkeyLabel, uSkinFireMonkeyImage, uSkinFireMonkeyItemDesignerPanel,
  uSkinFireMonkeyScrollControl, uSkinFireMonkeyVirtualList,
  uSkinFireMonkeyListView, uSkinFireMonkeyButton, uDrawPicture, uSkinImageList,
  uSkinFireMonkeyListBox, FMX.Controls.Presentation, uSkinFireMonkeyPopup,
  FMX.DateTimeCtrls, FMX.Objects, uSkinFireMonkeyDateEdit,
  uSkinFireMonkeyTreeView, uSkinFireMonkeyCustomList, uSkinImageType,
  uSkinItemDesignerPanelType, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinButtonType, uSkinPanelType;

//const
//  Const_DayOrderState_HasStartInspectGoodOrder='HasStartInspectGoodOrder';
//  Const_DayOrderState_HasStartInspectFactoryOrder='HasStartInspectFactoryOrder';
//  Const_DayOrderState_HasDoingInspectGoodOrder='HasDoingInspectGoodOrder';

type
  TFrameCalendar = class(TFrame,IFrameChangeLanguageEvent)
    lbWeek: TSkinFMXListView;
    lvCalendar: TSkinFMXListView;
    ItemPhoneDefault: TSkinFMXItemDesignerPanel;
    lblItemPhoneOrderDate: TSkinFMXButton;
    imglist3D: TSkinImageList;
    imglistButtonSelectedState: TSkinImageList;
    pnlClient: TSkinFMXPanel;
    pnlTopDevide: TSkinFMXPanel;
    lbEventType: TSkinFMXListBox;
    imglistEventType: TSkinImageList;
    pnlTopBar: TSkinFMXPanel;
    pnlToolBarCenter: TSkinFMXPanel;
    btnMonth: TSkinFMXButton;
    btnLastMonth: TSkinFMXButton;
    btnNextMonth: TSkinFMXButton;
    pnlTag: TSkinFMXPanel;
    procedure btnLastMonthClick(Sender: TObject);
    procedure btnNextMonthClick(Sender: TObject);
    procedure lvCalendarResize(Sender: TObject);
    procedure lbWeekPrepareDrawItem(Sender: TObject; Canvas: TDrawCanvas;
      ItemDesignerPanel: TSkinFMXItemDesignerPanel; Item: TSkinItem;
      ItemRect: TRect);
    procedure btnMonthClick(Sender: TObject);
  public
    procedure ChangeLanguage(ALangKind:TLangKind);
  private
    FCurLoadMonthFirstDay:TDateTime;
  private
    procedure DoChangeMonthFromSelectMonthFrame(Frame:TFrame);
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    procedure AlignControls;
    //加载当前月
    procedure LoadNow;
    //加载指定月
    procedure LoadCalendar(AMonthFirstDay:TDateTime);
    { Public declarations }
  end;




//var
//  GlobalCalendarFrame:TFrameCalendar;

//获取当月第一天
function GetMonthFirstDay(ADateTime:TDateTime):TDateTime;
function GetLastMonthFirstDay(ADateTime:TDateTime):TDateTime;
function GetNextMonthFirstDay(ADateTime:TDateTime):TDateTime;



implementation

{$R *.fmx}

//uses
//  MainFrame,
//  LoginFrame,
//  MainForm;


//获取当月第一天
function GetMonthFirstDay(ADateTime:TDateTime):TDateTime;
var
  Year,Month,Day:Word;
  Hour,Minute,Second,MillSecond:Word;
begin
  //加载当天当月的日历
  DateUtils.DecodeDateTime(ADateTime,Year,Month,Day,Hour,Minute,Second,MillSecond);
  Hour:=0;
  Day:=1;
  Result:=DateUtils.EncodeDateTime(Year,Month,Day,0,0,0,0);
end;

function GetLastMonthFirstDay(ADateTime:TDateTime):TDateTime;
var
  Year,Month,Day:Word;
  Hour,Minute,Second,MillSecond:Word;
begin
  //上一月
  DateUtils.DecodeDateTime(ADateTime,Year,Month,Day,Hour,Minute,Second,MillSecond);
  Hour:=0;
  Day:=1;
  if Month>2 then
  begin
    Month:=Month-1;
  end
  else
  begin
    Month:=12;
    Year:=Year-1;
  end;
  Result:=DateUtils.EncodeDateTime(Year,Month,Day,Hour,Minute,Second,MillSecond);
end;

function GetNextMonthFirstDay(ADateTime:TDateTime):TDateTime;
var
  Year,Month,Day:Word;
  Hour,Minute,Second,MillSecond:Word;
begin
  //下一月
  DateUtils.DecodeDateTime(ADateTime,Year,Month,Day,Hour,Minute,Second,MillSecond);
  Day:=1;
  if Month<12 then
  begin
    Month:=Month+1;
  end
  else
  begin
    Month:=1;
    Year:=Year+1;
  end;
  Result:=DateUtils.EncodeDateTime(Year,Month,Day,Hour,Minute,Second,MillSecond);
end;

procedure TFrameCalendar.AlignControls;
begin
  Self.lvCalendar.Height:=
    Self.lvCalendar.Prop.GetContentHeight;

  Self.pnlClient.Height:=
    Self.pnlClient.Padding.Top+Self.pnlClient.Padding.Bottom
    +Self.lbWeek.Height
    +Self.pnlTopDevide.Margins.Top
    +Self.pnlTopDevide.Height
    +Self.lvCalendar.Margins.Top
    +Self.lvCalendar.Height
    ;
  Self.Height:=Self.pnlClient.Top+Self.pnlClient.Height;
end;

procedure TFrameCalendar.btnLastMonthClick(Sender: TObject);
begin
  //上一月
  FCurLoadMonthFirstDay:=GetLastMonthFirstDay(FCurLoadMonthFirstDay);
  Self.LoadCalendar(FCurLoadMonthFirstDay);
end;

procedure TFrameCalendar.btnNextMonthClick(Sender: TObject);
begin
  //下一月
  FCurLoadMonthFirstDay:=GetNextMonthFirstDay(FCurLoadMonthFirstDay);
  Self.LoadCalendar(FCurLoadMonthFirstDay);
end;

procedure TFrameCalendar.ChangeLanguage(ALangKind: TLangKind);
begin
//  Self.lblItemNoEventCaption.Caption:=Langs_Caption_NoEvent[ALangKind];

  Self.lbWeek.Properties.Items.BeginUpdate;
  try
    case ALangKind of
      TLangKind.lkZH:
      begin
          if IsPadDevice then
          begin
            Self.lbWeek.Properties.Items[0].Caption:='周日';
            Self.lbWeek.Properties.Items[1].Caption:='周一';
            Self.lbWeek.Properties.Items[2].Caption:='周二';
            Self.lbWeek.Properties.Items[3].Caption:='周三';
            Self.lbWeek.Properties.Items[4].Caption:='周四';
            Self.lbWeek.Properties.Items[5].Caption:='周五';
            Self.lbWeek.Properties.Items[6].Caption:='周六';
          end
          else
          begin
            Self.lbWeek.Properties.Items[0].Caption:='日';
            Self.lbWeek.Properties.Items[1].Caption:='一';
            Self.lbWeek.Properties.Items[2].Caption:='二';
            Self.lbWeek.Properties.Items[3].Caption:='三';
            Self.lbWeek.Properties.Items[4].Caption:='四';
            Self.lbWeek.Properties.Items[5].Caption:='五';
            Self.lbWeek.Properties.Items[6].Caption:='六';
          end;
      end;
      TLangKind.lkEN:
      begin
          Self.lbWeek.Properties.Items[0].Caption:='SUN';
          Self.lbWeek.Properties.Items[1].Caption:='MON';
          Self.lbWeek.Properties.Items[2].Caption:='TUE';
          Self.lbWeek.Properties.Items[3].Caption:='WED';
          Self.lbWeek.Properties.Items[4].Caption:='THU';
          Self.lbWeek.Properties.Items[5].Caption:='FRI';
          Self.lbWeek.Properties.Items[6].Caption:='SAT';
      end;
    end;
  finally
    Self.lbWeek.Properties.Items.EndUpdate();
  end;
end;

constructor TFrameCalendar.Create(AOwner: TComponent);
begin
  inherited;

//  FInspectGoodsBillList:=TInspectGoodsBillList.Create;


//  FRowCount:=5;

//  if IsPadDevice then
//  begin
//    Self.lbWeek.Height:=35;
//    Self.lbWeek.Properties.ItemHeight:=35;
//    Self.lbWeek.SelfOwnMaterialToDefault.DrawItemCaptionParam.DrawFont.FontSize:=14;
//
//    //如果是平板
//    Self.lvCalendar.Properties.ItemDesignerPanel:=Self.ItemPadDefault;
//
//    //全屏显示日历
//    Self.lvCalendar.Align:=TAlignLayout.alClient;
//
//    //显示分隔线
//    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
//    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawColLine:=True;
//    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
//    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawColLine:=True;
//
//    //隐藏列表
//    Self.lbOrders.Visible:=False;
//  end
//  else
//  begin
//    Self.lbWeek.Height:=25;
//    Self.lbWeek.Properties.ItemHeight:=25;
//    Self.lbWeek.SelfOwnMaterialToDefault.DrawItemCaptionParam.DrawFont.FontSize:=12;
//
//    //如果是手机
//    Self.lvCalendar.Properties.ItemDesignerPanel:=Self.ItemPhoneDefault;
//    Self.lvCalendar.Align:=TAlignLayout.alTop;
//
//    Self.lvCalendar.Height:=200;
//
//
//    //分隔线设置
//    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
//    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawColLine:=False;
//    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
//    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawColLine:=False;
//
//    //显示列表
//    Self.lbOrders.Visible:=True;
//    Self.lbOrders.Properties.Items.Clear(True);
//  end;
//
//
//  if IsPadDevice then
//  begin
//    frmMain.btnItemInspectGoodsCalendarDetail.Visible:=False;
//  end
//  else
//  begin
//    frmMain.btnItemInspectGoodsCalendarDetail.Visible:=False;//True;
//  end;

  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

destructor TFrameCalendar.Destroy;
begin
  inherited;
end;

procedure TFrameCalendar.DoChangeMonthFromSelectMonthFrame(Frame: TFrame);
begin
  if GlobalSelectMonthFrame.GetMonth<>Self.FCurLoadMonthFirstDay then
  begin
    LoadCalendar(GlobalSelectMonthFrame.GetMonth);
  end;
end;

procedure TFrameCalendar.btnMonthClick(Sender: TObject);
begin
  ShowFrame(TFrame(GlobalSelectMonthFrame),TFrameSelectMonth,Application.MainForm,nil,nil,DoChangeMonthFromSelectMonthFrame,Application,True,False);
  GlobalSelectMonthFrame.SetMonth(Self.FCurLoadMonthFirstDay);
end;

procedure TFrameCalendar.lbWeekPrepareDrawItem(Sender: TObject;
  Canvas: TDrawCanvas; ItemDesignerPanel: TSkinFMXItemDesignerPanel;
  Item: TSkinItem; ItemRect: TRect);
begin
//  //周六和周日的字体要为灰色
//  if (Item.Index=0) or (Item.Index=6) then
//  begin
//    Self.lbWeek.SelfOwnMaterialToDefault.DrawItemCaptionParam.DrawFont.FontColor.Color:=$FFCCCCCC;
//  end
//  else
//  begin
//    Self.lbWeek.SelfOwnMaterialToDefault.DrawItemCaptionParam.DrawFont.FontColor.Color:=TAlphaColorRec.Black;
//  end;
end;

procedure TFrameCalendar.lvCalendarResize(Sender: TObject);
begin
//  if IsPadDevice then
//  begin
//    Self.lvCalendar.Properties.ItemHeight:=(Self.lvCalendar.Height-5)/FRowCount;///5;
//  end;
  Self.AlignControls;
end;

procedure TFrameCalendar.LoadCalendar(AMonthFirstDay:TDateTime);
var
  I: Integer;
  AFirstDayOfWeek:Word;
  ASkinItem:TSkinItem;
begin

  FCurLoadMonthFirstDay:=AMonthFirstDay;
//  Self.btnMonth.Caption:=GetCurrentMonth(AMonthFirstDay);
//  FTodayItem:=nil;





  //隔天了,就更新一下
  //判断这个月最大是几号
  //判断这个月一号,是星期几
  AFirstDayOfWeek:=DateUtils.DayOfTheWeek(DateUtils.StartOfTheMonth(AMonthFirstDay));
  Self.lvCalendar.Properties.Items.BeginUpdate;
  try

      //清空前几项
      I:=0;
      while I < Self.lvCalendar.Properties.Items.Count do
      begin
        //1号以前的都清掉
        if Self.lvCalendar.Properties.Items[I].Caption<>'1' then
        begin
          Self.lvCalendar.Properties.Items.Delete(0);
        end
        else
        begin
          Break;
        end;
      end;




      //插入空项
      //比如AFirstDayOfWeek是星期三,那么前面要插入空的星期天,星期一,星期二
      //不是本月的日期
      if (AFirstDayOfWeek<>0) and (AFirstDayOfWeek<>7) then
      begin
        for I := 0 to AFirstDayOfWeek-1 do
        begin
          //Detail1放日期
          ASkinItem:=Self.lvCalendar.Properties.Items.Insert(0);
        end;
      end;



      //隐藏超出的日期
      for I := 0 to Self.lvCalendar.Properties.Items.Count-1 do
      begin
        Self.lvCalendar.Properties.Items[I].Selected:=False;
        Self.lvCalendar.Properties.Items[I].SubItems.Clear;

        if (Self.lvCalendar.Properties.Items[I].Caption<>'') then
        begin

            //在Detail中保存日期,2019-01-03
            Self.lvCalendar.Properties.Items[I].Detail:=
                        FormatDateTime('YYYY-MM-DD',AMonthFirstDay
                                                    +StrToInt(Self.lvCalendar.Properties.Items[I].Caption)
                                                    -1);
            //1~31号
            if (StrToInt(Self.lvCalendar.Properties.Items[I].Caption)>27) then
            begin
                //28~31号要根据月份来判断是否显示
                //判断是否应该隐藏
                if DateUtils.DaysBetween(
                      //月底
                      DateUtils.EndOfTheMonth(AMonthFirstDay),
                      //月初
                      DateUtils.StartOfTheMonth(AMonthFirstDay))+1
                    >=StrToInt(Self.lvCalendar.Properties.Items[I].Caption) then
                begin
                  Self.lvCalendar.Properties.Items[I].Visible:=True;
                end
                else
                begin
                  Self.lvCalendar.Properties.Items[I].Visible:=False;
                end;
            end;


            //选中当天的,当月
            if (StrToInt(Self.lvCalendar.Properties.Items[I].Caption)=DateUtils.DayOfTheMonth(Now))
              and (GetMonthFirstDay(Now)=GetMonthFirstDay(FCurLoadMonthFirstDay)) then
            begin
//              FTodayItem:=Self.lvCalendar.Properties.Items[I];
              Self.lvCalendar.Properties.Items[I].Selected:=True;
            end;

        end;
      end;
  finally
    Self.lvCalendar.Properties.Items.EndUpdate();
  end;




//  //行数*ItemHeight
//  AVisibleCount:=0;
//  for I := 0 to Self.lvCalendar.Properties.Items.Count-1 do
//  begin
//    if Self.lvCalendar.Properties.Items[I].Visible then
//    begin
//      Inc(AVisibleCount);
//    end;
//  end;
//
//  FRowCount:=Ceil(AVisibleCount/7);
//  if not IsPadDevice then
//  begin
//    Self.lvCalendar.Properties.ItemHeight:=40;
//    Self.lvCalendar.Height:=Ceil(AVisibleCount/7)*Self.lvCalendar.Properties.ItemHeight+5;
//  end
//  else
//  begin
    lvCalendarResize(Self);
//  end;


end;

procedure TFrameCalendar.LoadNow;
begin
  //加载当天当月的日历
  LoadCalendar(GetMonthFirstDay(Now));
end;

end.
