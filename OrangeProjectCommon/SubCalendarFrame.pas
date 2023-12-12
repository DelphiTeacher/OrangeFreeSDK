unit SubCalendarFrame;

interface

//{$I Config.inc}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uUIFunction,
  uSkinItems,
  DateUtils,
  Math,
//  uCommon,
//  FumaCrm8,
  uBaseLog,
  uDrawCanvas,
  SettingFrame,
  uGraphicCommon,
  uFuncCommon,
  uLanguage,
  uManager,
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
  uSkinFireMonkeyTreeView, uSkinLabelType, uSkinImageType,
  uSkinItemDesignerPanelType, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinListViewType, uSkinButtonType, uSkinPanelType;

type
  TFrameSubCalendar = class(TFrame)
    pnlToolBar: TSkinFMXPanel;
    lbWeek: TSkinFMXListView;
    lvCalendar: TSkinFMXListView;
    ItemPadDefault: TSkinFMXItemDesignerPanel;
    lbItemOrders: TSkinFMXListBox;
    popPhoneOrders: TSkinFMXPopup;
    crPhoneOrders: TCalloutRectangle;
    lbPhonePopOrders: TSkinFMXListBox;
    btnSetting: TSkinFMXButton;
    ItemPhoneDefault: TSkinFMXItemDesignerPanel;
    lblItemPhoneOrderDate: TSkinFMXButton;
    btnLastMonth: TSkinFMXButton;
    btnMonth: TSkinFMXButton;
    btnNextMonth: TSkinFMXButton;
    imglist3D: TSkinImageList;
    imgItemPhoneSign: TSkinFMXImage;
    imglistButtonSelectedState: TSkinImageList;
    imgItemPadSign: TSkinFMXImage;
    lblItemPadOrderDate: TSkinFMXButton;
    procedure FrameResize(Sender: TObject);
    procedure lvCalendarClickItem(Sender: TSkinItem);
    procedure lvCalendarPrepareDrawItem(Sender: TObject; Canvas: TDrawCanvas;
      ItemDesignerPanel: TSkinFMXItemDesignerPanel; Item: TSkinItem;
      ItemRect: TRect);
    procedure lbPhonePopOrdersClickItem(Sender: TObject);
    procedure btnLastMonthClick(Sender: TObject);
    procedure btnNextMonthClick(Sender: TObject);
    procedure lvCalendarResize(Sender: TObject);
    procedure lbOrdersClickItem(Sender: TObject);
    procedure lbWeekPrepareDrawItem(Sender: TObject; Canvas: TDrawCanvas;
      ItemDesignerPanel: TSkinFMXItemDesignerPanel; Item: TSkinItem;
      ItemRect: TRect);
    procedure btnSettingClick(Sender: TObject);
    procedure lbOrdersPrepareDrawItem(Sender: TObject; Canvas: TDrawCanvas;
      ItemDesignerPanel: TSkinFMXItemDesignerPanel; Item: TSkinItem;
      ItemRect: TRect);
    procedure btnMonthClick(Sender: TObject);
    procedure lbPhonePopOrdersPrepareDrawItem(Sender: TObject;
      Canvas: TDrawCanvas; ItemDesignerPanel: TSkinFMXItemDesignerPanel;
      Item: TSkinItem; ItemRect: TRect);
//  public
//    procedure ChangeLanguage(ALangKind:TLangKind);
  private
    FTodayItem:TSkinItem;
    FCurLoadMonthFirstDay:TDateTime;
    FCurPopupDate:TDateTime;
//    FInspectGoodsBillList:TInspectGoodsBillList;
    procedure SyncMonthDaysOrderNumber;
    procedure SyncPhoneOrdersPopup;
  private
    procedure DoChangeMonthFromSelectMonthFrame(Frame:TFrame);
    { Private declarations }
//  private
//    procedure DoGetInspectGoodsBillList(ATimerTask:TObject);
//    procedure DoGetInspectGoodsBillListExecuteEnd(ATimerTask:TObject);
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    procedure Load(AStartDate:TDateTime;AEndDate:TDateTime);
    procedure LoadNow;
    procedure LoadCalendar(MonthFirstDay:TDateTime);
    { Public declarations }
  end;

var
  GlobalCalendarFrame:TFrameSubCalendar;


implementation

{$R *.fmx}

uses
  MainFrame,
  LoginFrame,
  MainForm;



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

procedure TFrameSubCalendar.btnSettingClick(Sender: TObject);
begin
//  //设置
//  frmMain.ShowMainFrame;
//  HideFrame(GlobalMainFrame);
//  ShowFrame(TFrame(GlobalSettingFrame),TFrameSetting,frmMain,nil,nil,nil,Application);
//  GlobalSettingFrame.FrameHistroy:=CurrentFrameHistroy;
end;

procedure TFrameSubCalendar.btnLastMonthClick(Sender: TObject);
var
  Year,Month,Day:Word;
  Hour,Minute,Second,MillSecond:Word;
begin
  //上一月
  DateUtils.DecodeDateTime(FCurLoadMonthFirstDay,Year,Month,Day,Hour,Minute,Second,MillSecond);
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
  FCurLoadMonthFirstDay:=DateUtils.EncodeDateTime(Year,Month,Day,Hour,Minute,Second,MillSecond);
  Self.LoadCalendar(FCurLoadMonthFirstDay);
end;

procedure TFrameSubCalendar.btnNextMonthClick(Sender: TObject);
var
  Year,Month,Day:Word;
  Hour,Minute,Second,MillSecond:Word;
begin
  //下一月
  DateUtils.DecodeDateTime(FCurLoadMonthFirstDay,Year,Month,Day,Hour,Minute,Second,MillSecond);
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
  FCurLoadMonthFirstDay:=DateUtils.EncodeDateTime(Year,Month,Day,Hour,Minute,Second,MillSecond);
  Self.LoadCalendar(FCurLoadMonthFirstDay);
end;

//procedure TFrameSubCalendar.ChangeLanguage(ALangKind: TLangKind);
//begin
//  Self.lblItemNoEventCaption.Caption:=Langs_Caption_NoEvent[ALangKind];
//
//  Self.lbWeek.Properties.Items.BeginUpdate;
//  try
//    case ALangKind of
//      TLangKind.lkZH:
//      begin
//        if IsPadDevice then
//        begin
//          Self.lbWeek.Properties.Items[0].Caption:='周日';
//          Self.lbWeek.Properties.Items[1].Caption:='周一';
//          Self.lbWeek.Properties.Items[2].Caption:='周二';
//          Self.lbWeek.Properties.Items[3].Caption:='周三';
//          Self.lbWeek.Properties.Items[4].Caption:='周四';
//          Self.lbWeek.Properties.Items[5].Caption:='周五';
//          Self.lbWeek.Properties.Items[6].Caption:='周六';
//        end
//        else
//        begin
//          Self.lbWeek.Properties.Items[0].Caption:='日';
//          Self.lbWeek.Properties.Items[1].Caption:='一';
//          Self.lbWeek.Properties.Items[2].Caption:='二';
//          Self.lbWeek.Properties.Items[3].Caption:='三';
//          Self.lbWeek.Properties.Items[4].Caption:='四';
//          Self.lbWeek.Properties.Items[5].Caption:='五';
//          Self.lbWeek.Properties.Items[6].Caption:='六';
//        end;
//      end;
//      TLangKind.lkEN:
//      begin
//        Self.lbWeek.Properties.Items[0].Caption:='SUN';
//        Self.lbWeek.Properties.Items[1].Caption:='MON';
//        Self.lbWeek.Properties.Items[2].Caption:='TUE';
//        Self.lbWeek.Properties.Items[3].Caption:='WED';
//        Self.lbWeek.Properties.Items[4].Caption:='THU';
//        Self.lbWeek.Properties.Items[5].Caption:='FRI';
//        Self.lbWeek.Properties.Items[6].Caption:='SAT';
//      end;
//    end;
//  finally
//    Self.lbWeek.Properties.Items.EndUpdate();
//  end;
//end;

constructor TFrameSubCalendar.Create(AOwner: TComponent);
begin
  inherited;

//  FInspectGoodsBillList:=TInspectGoodsBillList.Create;

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
//    Self.lvCalendar.Align:=TAlignLayout.Client;
//
//    //显示分隔线
//    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
//    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawColLine:=True;
//    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
//    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawColLine:=True;
//
//    //隐藏列表
////    Self.lbOrders.Visible:=False;
//  end
//  else
//  begin
    Self.lbWeek.Height:=25;
    Self.lbWeek.Properties.ItemHeight:=25;
    Self.lbWeek.SelfOwnMaterialToDefault.DrawItemCaptionParam.DrawFont.FontSize:=12;

    //如果是手机
    Self.lvCalendar.Properties.ItemDesignerPanel:=Self.ItemPhoneDefault;
//    Self.lvCalendar.Align:=TAlignLayout.Top;

//    Self.lvCalendar.Height:=200;


    //分隔线设置
    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawColLine:=False;
    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawColLine:=False;



//    //显示列表
//    Self.lbOrders.Visible:=True;
//    Self.lbOrders.Properties.Items.Clear(True);
//  end;


//  if IsPadDevice then
//  begin
//
//    frmMain.btnItemInspectGoodsCalendarDetail.Visible:=False;
//  end
//  else
//  begin
//
//    frmMain.btnItemInspectGoodsCalendarDetail.Visible:=False;//True;
//  end;


end;

destructor TFrameSubCalendar.Destroy;
begin
//  FreeAndNil(FInspectGoodsBillList);
  inherited;
//  GlobalCalendarFrame:=nil;
end;

procedure TFrameSubCalendar.DoChangeMonthFromSelectMonthFrame(Frame: TFrame);
begin
  if GlobalSelectMonthFrame.GetMonth<>Self.FCurLoadMonthFirstDay then
  begin
    LoadCalendar(GlobalSelectMonthFrame.GetMonth);
  end;
end;

//procedure TFrameSubCalendar.DoGetInspectGoodsBillList(ATimerTask: TObject);
//begin
////  TTimerTask(ATimerTask).TaskObject:=TCallInterfaceResult.Create;
////  //获取验货列表
////  Self.FInspectGoodsBillList.Clear(True);
////
////  CoInitialize;
//////  AHTTPRIO:=CreateGlobalMainThreadHttpRIO();
////  try
////    try
//////      AGetWhQcRptResult:=(CreateGlobalMainThreadHttpRIO as FumaCrm8Soap).GetWhQcRpt(GlobalManager.LicInfo.LicNO,'QC15060021');
////
////      if not TCallInterfaceResult(TTimerTask(ATimerTask).TaskObject).ParseResult(
////                          (CreateGlobalMainThreadHttpRIO as FumaCrm8Soap).GetQcRptList(GlobalManager.LicInfo.LicNO,
////                                                                                    GlobalManager.LicInfo.EmpID,
////                                                                                    DateUtils.MonthOfTheYear(FCurLoadMonthFirstDay),
////                                                                                    DateUtils.YearOf(FCurLoadMonthFirstDay))) then
////      begin
////        TTimerTask(ATimerTask).TaskTag:=Const_TimerTask_Fail;
////      end
////      else
////      begin
////        TTimerTask(ATimerTask).TaskTag:=Const_TimerTask_Succ;
////        FInspectGoodsBillList.ParseFromJsonArray(TCallInterfaceResult(TTimerTask(ATimerTask).TaskObject).SuperArray,'GetQcRptList');
////      end;
////    except
////      on E:Exception do
////      begin
////        uBaseLog.HandleException(E,'FuMenInspect','FirstLoginFrame','TFrameFirstLogin.DoGetInspectGoodsBillList','');
////        TTimerTask(ATimerTask).TaskTag:=Const_TimerTask_Error;
////        TTimerTask(ATimerTask).TaskDesc:=E.Message;
////      end;
////    end;
////  finally
//////    FreeAndNil(AHTTPRIO);
////    CoUnInitialize;
////  end;
//end;
//
//procedure TFrameSubCalendar.DoGetInspectGoodsBillListExecuteEnd(ATimerTask: TObject);
//begin
//  HideWaitingFrame;
//  case TTimerTask(ATimerTask).TaskTag of
//    Const_TimerTask_Fail:
//    begin
//      ShowMessageBoxFrame(Self,Langs_MsgBox_Hint_GetInspectGoodsBillListFail[LangKind]+' '+TCallInterfaceResult(TTimerTask(ATimerTask).TaskObject).CallResultStr,'',TMsgDlgType.mtInformation,[Langs_Button_Caption_OK[LangKind]],nil);
//    end;
//    Const_TimerTask_Succ:
//    begin
//      SyncMonthDaysOrderNumber;
//    end;
//  end;
//  TTimerTask(ATimerTask).FreeTaskObject;
//end;

procedure TFrameSubCalendar.FrameResize(Sender: TObject);
begin
//  if IsPadDevice then
//  begin
//    btnLastMonth.Left:=(Width-Self.btnLastMonth.Width*2-Self.btnMonth.Width)/2;
//  end
//  else
//  begin
    btnLastMonth.Left:=0;
//  end;
  btnMonth.Left:=btnLastMonth.Left+btnLastMonth.Width;
  btnNextMonth.Left:=btnMonth.Left+btnMonth.Width;
end;

procedure TFrameSubCalendar.btnMonthClick(Sender: TObject);
begin
  ShowFrame(TFrame(GlobalSelectMonthFrame),TFrameSelectMonth,frmMain,nil,nil,DoChangeMonthFromSelectMonthFrame,Application,True,False);
//  GlobalSelectMonthFrame.FrameHistroy:=CurrentFrameHistroy;
  GlobalSelectMonthFrame.SetMonth(Self.FCurLoadMonthFirstDay);
end;

procedure TFrameSubCalendar.lbOrdersClickItem(Sender: TObject);
begin
//  if TSkinItem(Sender).ItemType=sitDefault then
//  begin
//    //查看此验货
//    //跳转到验货明细
//    HideFrame(GlobalMainFrame);
//
//    ShowFrame(TFrame(GlobalInspectGoodsInfoFrame),TFrameInspectGoodsInfo,frmMain,nil,nil,nil,Application);
//    GlobalInspectGoodsInfoFrame.FrameHistroy:=CurrentFrameHistroy;
//    GlobalInspectGoodsInfoFrame.LoadInspectGoodsBill(TInspectGoodsBill(TSkinItem(Sender).Data));
//  end;
end;

procedure TFrameSubCalendar.lbOrdersPrepareDrawItem(Sender: TObject;
  Canvas: TDrawCanvas; ItemDesignerPanel: TSkinFMXItemDesignerPanel;
  Item: TSkinItem; ItemRect: TRect);
//var
//  AInspectGoodsBill:TInspectGoodsBill;
begin
//  if Item.ItemType=sitDefault then
//  begin
//    AInspectGoodsBill:=TInspectGoodsBill(Item.Data);
//    if (AInspectGoodsBill<>nil) then
//    begin
//      frmMain.lblItemInspectGoodsCalendarOrderState.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.Color:=
//        Const_InspectGoodsBillState_AlphaColors[AInspectGoodsBill.FinishType];
//    end;
//  end;

end;

procedure TFrameSubCalendar.lbPhonePopOrdersClickItem(Sender: TObject);
begin
  Self.popPhoneOrders.IsOpen:=False;
//  //直接查看
//  if TSkinItem(Sender).ItemType=sitDefault then
//  begin
//    //查看此验货
//    //跳转到验货明细
//    GlobalMainFrame.pcMain.Properties.ActivePage:=GlobalMainFrame.tsInspectGoods;
//    //GlobalInspectGoodsInfoFrame已经创建显示在IPAD端
//    GlobalInspectGoodsInfoFrame.LoadInspectGoodsBill(TInspectGoodsBill(TSkinItem(Sender).Data));
//    //定位
//    GlobalInspectGoodsFrame.LocateInspectGoodsBill(TInspectGoodsBill(TSkinItem(Sender).Data));
//  end;
end;

procedure TFrameSubCalendar.lbPhonePopOrdersPrepareDrawItem(Sender: TObject;
  Canvas: TDrawCanvas; ItemDesignerPanel: TSkinFMXItemDesignerPanel;
  Item: TSkinItem; ItemRect: TRect);
//var
//  AInspectGoodsBill:TInspectGoodsBill;
begin
//  if Item.ItemType=sitDefault then
//  begin
//    AInspectGoodsBill:=TInspectGoodsBill(Item.Data);
//    if (AInspectGoodsBill<>nil) then
//    begin
////      frmMain.lblItemInspectGoodsDefaultState.SelfOwnMaterialToDefault.BackColor.IsFill:=True;
////      frmMain.lblItemInspectGoodsDefaultState.SelfOwnMaterialToDefault.BackColor.FillColor.Color:=
//      frmMain.lblItemInspectGoodsCalendarOrderState.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.Color:=
//        Const_InspectGoodsBillState_AlphaColors[AInspectGoodsBill.FinishType];
////      frmMain.lblItemInspectGoodsDefaultState.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.Color:=
////        TAlphaColorRec.White;
//    end;
//  end;

end;

procedure TFrameSubCalendar.lbWeekPrepareDrawItem(Sender: TObject;
  Canvas: TDrawCanvas; ItemDesignerPanel: TSkinFMXItemDesignerPanel;
  Item: TSkinItem; ItemRect: TRect);
begin
  //周六和周日的字体要为灰色
  if (Item.Index=5) or (Item.Index=6) then
  begin
    Self.lbWeek.SelfOwnMaterialToDefault.DrawItemCaptionParam.DrawFont.FontColor.Color:=$FFCCCCCC;
  end
  else
  begin
    Self.lbWeek.SelfOwnMaterialToDefault.DrawItemCaptionParam.DrawFont.FontColor.Color:=TAlphaColorRec.Black;
  end;
end;

procedure TFrameSubCalendar.lvCalendarClickItem(Sender: TSkinItem);
//var
//  RowIndex,ColIndex:Integer;
//  ItemDrawRect:TRectF;
//  HorzCenterX:Double;
//  AbsLeftOffset:Double;
//  AbsTopOffset:Double;
//var
//  I: Integer;
//  AListBoxItem:TSkinListBoxItem;
begin
  //没有日期的不选中
  if (Sender<>nil) and (TSkinItem(Sender).Caption<>'') then
  begin
    TSkinItem(Sender).Selected:=True;
  end;


//  //显示列表或加载列表
//  if IsPadDevice then
//  begin
//        popPhoneOrders.IsOpen := False;
//      //弹出手机上的菜单
//      if popPhoneOrders.IsOpen
//        and (FCurPopupDate=StandardStrToDateTime(TSkinItem(Sender).Detail1)) then
//      begin
//        //点击日期不变，则隐藏
//      end
//      else
//      begin
//
//        popPhoneOrders.Placement:=TPlacement.Absolute;
//
//        //存在验货任务(Detail存放的订单数)
//        if TSkinItem(Sender).Detail<>'' then
//        begin
//          FCurPopupDate:=StandardStrToDateTime(TSkinItem(Sender).Detail1);
//
//          //刷新订单
//          SyncPhoneOrdersPopup;
//
//          //设置箭头
//          //判断在第几行,第几列
//          RowIndex:=TSkinItem(Sender).Index div 5;
//          ColIndex:=TSkinItem(Sender).Index mod 5;
//          //第一，二，三行，箭头在上面
//          //第四，五行，箭头在下面
//          if RowIndex<=3 then
//          begin
//            crPhoneOrders.CalloutPosition:=TCalloutPosition.Top;
//            Self.lbPhonePopOrders.Margins.Top:=15;
//            Self.lbPhonePopOrders.Margins.Bottom:=5;
//            popPhoneOrders.PlacementRectangle.Top:=TSkinItem(Sender).FItemDrawRect.Bottom-5;
//          end
//          else
//          begin
//            crPhoneOrders.CalloutPosition:=TCalloutPosition.Bottom;
//            Self.lbPhonePopOrders.Margins.Top:=5;
//            Self.lbPhonePopOrders.Margins.Bottom:=15;
//            popPhoneOrders.PlacementRectangle.Top:=TSkinItem(Sender).FItemDrawRect.Top
//                    -Self.popPhoneOrders.Height
//                    +5;
//          end;
//
//          //如果是前几列,那么箭头在前面
//          //如果是中间列，那么前头在中间
//          //如果是后几列，那么箭头在后面
//          HorzCenterX:=TSkinItem(Sender).FItemDrawRect.Left+TSkinItem(Sender).FItemDrawRect.Width/2;
//          //设置偏移
//          //默认针对ItemRect居中
//          crPhoneOrders.CalloutOffset:=(crPhoneOrders.Width-crPhoneOrders.CalloutWidth)/2;
//          popPhoneOrders.PlacementRectangle.Left:=HorzCenterX-Self.popPhoneOrders.Width/2;
//          //超出左边
//          if popPhoneOrders.PlacementRectangle.Left<0 then
//          begin
//            popPhoneOrders.PlacementRectangle.Left:=0;
//            crPhoneOrders.CalloutOffset:=TSkinItem(Sender).FItemDrawRect.Left
//                                          +TSkinItem(Sender).FItemDrawRect.Width/2
//                                          -crPhoneOrders.CalloutWidth/2;
//          end;
//          //超出右边
//          if popPhoneOrders.PlacementRectangle.Left+popPhoneOrders.Width>Width then
//          begin
//            popPhoneOrders.PlacementRectangle.Left:=Width-popPhoneOrders.Width;
//            crPhoneOrders.CalloutOffset:=crPhoneOrders.Width
//                              -(Self.lvCalendar.Width-TSkinItem(Sender).FItemDrawRect.Right
//                                  +TSkinItem(Sender).FItemDrawRect.Width/2)
//                              -crPhoneOrders.CalloutWidth/2
//                              ;
//          end;
////          {$IFDEF MSWINDOWS}
//          AbsLeftOffset:=Self.lvCalendar.LocalToScreen(PointF(0,0)).X;
//          AbsTopOffset:=Self.lvCalendar.LocalToScreen(PointF(0,0)).Y;
//          popPhoneOrders.PlacementRectangle.Left:=popPhoneOrders.PlacementRectangle.Left
//            +AbsLeftOffset;
//          popPhoneOrders.PlacementRectangle.Top:=popPhoneOrders.PlacementRectangle.Top
//            +AbsTopOffset;
////          {$ENDIF}
//
//          popPhoneOrders.IsOpen := True;
//        end;
//      end;
//
//
//  end
//  else
//  begin
//    //显示列表
//    Self.lbOrders.Properties.Items.BeginUpdate;
//    try
//      Self.lbOrders.Properties.Items.Clear(True);
//      if (Sender<>nil) then
//      begin
//
//        //显示当天的验货
//        for I := 0 to FInspectGoodsBillList.Count-1 do
//        begin
//          if Floor(FInspectGoodsBillList[I].StartTime)
//            =Floor(StandardStrToDateTime(TSkinItem(Sender).Detail1)) then
//          begin
//            AListBoxItem:=Self.lbOrders.Properties.Items.Add;
//            AssignInspectGoodsBillToListBoxItem(AListBoxItem,FInspectGoodsBillList[I]);
////            AListBoxItem.Data:=FInspectGoodsBillList[I];
////            //验货单号
////            AListBoxItem.Name:=FInspectGoodsBillList[I].PONO;
////            //标题(PONO+客户名)
////            AListBoxItem.Caption:='PO#:'+FInspectGoodsBillList[I].PONO
////                                  +' , '+FInspectGoodsBillList[I].CustFullName
////                                  ;
////            //开始日期
////            AListBoxItem.Detail:=GetMonthDate(FInspectGoodsBillList[I].StartTime);
////            //结束日期
////            if FInspectGoodsBillList[I].EndTime=0 then
////            begin
////              AListBoxItem.Detail5:='';
////            end
////            else
////            begin
////              AListBoxItem.Detail5:=GetMonthDate(FInspectGoodsBillList[I].EndTime);
////            end;
////            //产品名称
////            AListBoxItem.Detail1:=FInspectGoodsBillList[I].GoodsName;
////            //供应商+地址
////            AListBoxItem.Detail2:='QC#:'+FInspectGoodsBillList[I].QCRptNo;
////
////            //订单状态
////            case FInspectGoodsBillList[I].FinishType of
////              ftPending:AListBoxItem.Detail4:='Pending';
////              ftRejected:AListBoxItem.Detail4:='Rejected';
////              ftAccepted:AListBoxItem.Detail4:='Accepted';
////            end;
//          end;
//        end;
//
//
//      end;
//
//      if Self.lbOrders.Properties.Items.Count=0 then
//      begin
//        Self.lbOrders.Properties.Items.Add.ItemType:=sitItem3;
//        Self.lbOrders.Properties.Items.Add.ItemType:=sitItem4;
//        Self.lbOrders.Properties.Items.Add.ItemType:=sitItem4;
//      end;
//
//    finally
//      Self.lbOrders.Properties.Items.EndUpdate;
//    end;
//    Self.lbOrders.VertScrollBar.Properties.Position:=0;
//  end;
end;

procedure TFrameSubCalendar.lvCalendarPrepareDrawItem(Sender: TObject;
  Canvas: TDrawCanvas; ItemDesignerPanel: TSkinFMXItemDesignerPanel;
  Item: TSkinItem; ItemRect: TRect);
var
  I: Integer;
  AListBoxItem:TSkinListBoxItem;
begin
//  if ItemDesignerPanel=ItemPadDefault then
//  begin
//    //周六和周日的字体要为灰色
//
//    //周六和周日的字体要为灰色
//    if Item=Self.FTodayItem then
//    begin
//      lblItemPadOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontColor.Color:=TAlphaColorRec.Red;
//      lblItemPadOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontSize:=18;
//    end
//    else
//    begin
//      if (Item.Index mod 7=5) or (Item.Index mod 7=6) then
//      begin
//        lblItemPadOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontColor.Color:=$FFCCCCCC;
//        lblItemPadOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontSize:=16;
//      end
//      else
//      begin
//        lblItemPadOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontColor.Color:=TAlphaColorRec.Black;
//        lblItemPadOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontSize:=16;
//      end;
//    end;
//
//
//    //当天
//    if Item=Self.FTodayItem then
//    begin
//      //背景色,红色
//      TDrawPictureParamEffect(Self.lblItemPadOrderDate.SelfOwnMaterialToDefault.DrawPictureParam.DrawEffectSetting.PushedEffect).ImageIndex:=1;
//    end
//    else
//    begin
//      //背景色,黑色
//      TDrawPictureParamEffect(Self.lblItemPadOrderDate.SelfOwnMaterialToDefault.DrawPictureParam.DrawEffectSetting.PushedEffect).ImageIndex:=0;
//    end;
//
////    if Item.Detail<>'' then
////    begin
////      //有验货任务
////      Self.lbItemOrders.Visible:=True;
////      //加载验货任务
////      //显示列表
////      Self.lbItemOrders.Properties.Items.BeginUpdate;
////      try
////        Self.lbItemOrders.Properties.Items.Clear(True);
////        //显示当天的
////        for I := 0 to FInspectGoodsBillList.Count-1 do
////        begin
////          if (Floor(FInspectGoodsBillList[I].StartTime)=Floor(StandardStrToDateTime(Item.Detail1)))
////              and ((Self.lbItemOrders.Properties.Items.Count+1)*Self.lbItemOrders.Properties.ItemHeight<(Self.lvCalendar.Properties.ItemHeight-Self.imgItemPadSign.Height)) then
////          begin
////            AListBoxItem:=Self.lbItemOrders.Properties.Items.Add;
////            AListBoxItem.Data:=FInspectGoodsBillList[I];
////            AListBoxItem.Icon.ImageIndex:=0;
////            AListBoxItem.Caption:='PO#:'+FInspectGoodsBillList[I].PONO;
////          end;
////
////        end;
////      finally
////        Self.lbItemOrders.Properties.Items.EndUpdate;
////      end;
////      Self.imgItemPadSign.Properties.Picture.StaticImageIndex:=1;
////      Self.imgItemPhoneSign.Properties.Picture.StaticImageIndex:=0;
////    end
////    else
////    begin
////      //没有验货任务
////      if ItemDesignerPanel=ItemPadDefault then
////      begin
////        Self.lbItemOrders.Visible:=False;
////      end;
////      Self.imgItemPadSign.Properties.Picture.StaticImageIndex:=-1;
////      Self.imgItemPhoneSign.Properties.Picture.StaticImageIndex:=-1;
////    end;
//
//  end
//  else if ItemDesignerPanel=ItemPhoneDefault then
//  begin

    //周六和周日的字体要为灰色
    if Item=Self.FTodayItem then
    begin
      lblItemPhoneOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontColor.Color:=TAlphaColorRec.Red;
      lblItemPhoneOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontSize:=18;
    end
    else
    begin
      if (Item.Index mod 7=5) or (Item.Index mod 7=6) then
      begin
        lblItemPhoneOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontColor.Color:=$FFCCCCCC;
        lblItemPhoneOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontSize:=16;
      end
      else
      begin
        lblItemPhoneOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontColor.Color:=TAlphaColorRec.Black;
        lblItemPhoneOrderDate.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.FontSize:=16;
      end;
    end;


    //当天
    if Item=Self.FTodayItem then
    begin
      //背景色,红色
      TDrawRectParamEffect(Self.lblItemPhoneOrderDate.SelfOwnMaterialToDefault.BackColor.DrawEffectSetting.PushedEffect).FillColor.Color:=TAlphaColorRec.Red;
      TDrawPictureParamEffect(Self.lblItemPhoneOrderDate.SelfOwnMaterialToDefault.DrawPictureParam.DrawEffectSetting.PushedEffect).ImageIndex:=1;
    end
    else
    begin
      //背景色,黑色
      TDrawRectParamEffect(Self.lblItemPhoneOrderDate.SelfOwnMaterialToDefault.BackColor.DrawEffectSetting.PushedEffect).FillColor.Color:=TAlphaColorRec.Black;
      TDrawPictureParamEffect(Self.lblItemPhoneOrderDate.SelfOwnMaterialToDefault.DrawPictureParam.DrawEffectSetting.PushedEffect).ImageIndex:=0;
    end;


//  end;

end;

procedure TFrameSubCalendar.lvCalendarResize(Sender: TObject);
begin
//  if IsPadDevice then
//  begin
//    Self.lvCalendar.Properties.ItemHeight:=(Self.lvCalendar.Height-5)/5;
//  end;
end;

procedure TFrameSubCalendar.SyncMonthDaysOrderNumber;
var
  I,J: Integer;
begin
  Self.lvCalendar.Properties.Items.BeginUpdate;
  try
    for I := 0 to Self.lvCalendar.Properties.Items.Count-1 do
    begin
      //清空订单数
      Self.lvCalendar.Properties.Items[I].Detail:='';
      Self.lvCalendar.Properties.Items[I].Icon.ImageIndex:=-1;

//      if Self.lvCalendar.Properties.Items[I].Visible
//        and (Self.lvCalendar.Properties.Items[I].Caption<>'')
//        and (Self.lvCalendar.Properties.Items[I].Detail1<>'') then
//      begin
//        for J := 0 to FInspectGoodsBillList.Count-1 do
//        begin
//          if Floor(FInspectGoodsBillList[J].StartTime)
//            =Floor(StandardStrToDateTime(Self.lvCalendar.Properties.Items[I].Detail1)) then
//          begin
//            Self.lvCalendar.Properties.Items[I].Icon.ImageIndex:=0;
//            //同一天
//            if Self.lvCalendar.Properties.Items[I].Detail='' then
//            begin
//              Self.lvCalendar.Properties.Items[I].Detail:='0';
//            end;
//            //订单数+1
//            Self.lvCalendar.Properties.Items[I].Detail:=IntToStr(StrToInt(Self.lvCalendar.Properties.Items[I].Detail)+1);
//          end;
//        end;
//      end;


    end;
  finally
    Self.lvCalendar.Properties.Items.EndUpdate();
  end;

//  if IsPadDevice then
//  begin
//
//  end
//  else
//  begin
    //如果是当天的,那么加载当天的验货任务
    Self.lvCalendarClickItem(FTodayItem);
//  end;
end;

procedure TFrameSubCalendar.SyncPhoneOrdersPopup;
var
  I: Integer;
  AMaxShowCount:Integer;
  AListBoxItem:TSkinListBoxItem;
begin
  Self.lbPhonePopOrders.Properties.Items.BeginUpdate;
  try
    Self.lbPhonePopOrders.Properties.Items.Clear(True);
//    for I := 0 to Self.FInspectGoodsBillList.Count-1 do
//    begin
//      if Floor(FInspectGoodsBillList[I].StartTime)=Floor(FCurPopupDate) then
//      begin
//        AListBoxItem:=Self.lbPhonePopOrders.Properties.Items.Add;
//        AssignInspectGoodsBillToListBoxItem(AListBoxItem,FInspectGoodsBillList[I]);
//      end;
//    end;
  finally
    Self.lbPhonePopOrders.Properties.Items.EndUpdate();
  end;


  if Self.lbPhonePopOrders.Properties.Items.Count=0 then
  begin
    Self.popPhoneOrders.IsOpen:=False;
  end
  else
  begin
    //设置位置
    //设置高度
    AMaxShowCount:=Self.lbPhonePopOrders.Properties.Items.Count;
    if AMaxShowCount>3 then AMaxShowCount:=3;

//    Self.popPhoneOrders.Width:=ADrawMaxLen+50;
    Self.popPhoneOrders.Height:=AMaxShowCount//Self.lbPhonePopOrders.Properties.Items.Count
        *Self.lbPhonePopOrders.Properties.ItemHeight
        +Self.lbPhonePopOrders.Margins.Top
        +Self.lbPhonePopOrders.Margins.Bottom
        +5;
  end;

end;

procedure TFrameSubCalendar.Load(AStartDate, AEndDate: TDateTime);
var
  I: Integer;
//  AVisibleCount:Integer;
begin
  Self.lvCalendar.Properties.Items.BeginUpdate;
  try


//    //清除数据
//    for I := 0 to Self.lvCalendar.Properties.Items.Count-1 do
//    begin
//      Self.lvCalendar.Properties.Items[I].Icon.ImageIndex:=-1;
//      Self.lvCalendar.Properties.Items[I].Detail:='';
//    end;

    Self.lvCalendar.Properties.Items.Clear;

//    //清空1号之前的前几项
//    I:=0;
//    while I < Self.lvCalendar.Properties.Items.Count do
//    begin
//      if Self.lvCalendar.Properties.Items[I].Caption<>'1' then
//      begin
//        Self.lvCalendar.Properties.Items.Delete(0);
//      end
//      else
//      begin
//        Break;
//      end;
//    end;



//    //插入空项
//    for I := 0 to DayOfWeek-1 do
//    begin
//      Self.lvCalendar.Properties.Items.Add;
//      //Detail1 保存时间
//
//
//    end;



    //隐藏超出的日期
    for I := 0 to DaysBetween(AStartDate, AEndDate) do//DaysInAMonth(YearOf(MonthFirstDay),MonthOf(MonthFirstDay))-1 do//Self.lvCalendar.Properties.Items.Count-1 do
    begin
      Self.lvCalendar.Properties.Items.Add;
      Self.lvCalendar.Properties.Items[I].Caption:=IntToStr(DayOfTheMonth(AStartDate));

      Self.lvCalendar.Properties.Items[I].Selected:=False;
      Self.lvCalendar.Properties.Items[I].Icon.ImageIndex:=-1;
      Self.lvCalendar.Properties.Items[I].Detail:='';

//      if (Self.lvCalendar.Properties.Items[I].Caption<>'') then
//      begin

        Self.lvCalendar.Properties.Items[I].Detail1:=StandardDateToStr(AStartDate);
                      //StandardDateTimeToStr(MonthFirstDay
                    //+StrToInt(Self.lvCalendar.Properties.Items[I].Caption)-1);
        //1~31号
//        if (StrToInt(Self.lvCalendar.Properties.Items[I].Caption)>27) then
//        begin
//          //判断是否应该隐藏
//          if DateUtils.DaysBetween(DateUtils.EndOfTheMonth(MonthFirstDay),DateUtils.StartOfTheMonth(MonthFirstDay))+1
//              >=StrToInt(Self.lvCalendar.Properties.Items[I].Caption) then
//          begin
//            Self.lvCalendar.Properties.Items[I].Visible:=True;
//          end
//          else
//          begin
//            Self.lvCalendar.Properties.Items[I].Visible:=False;
//          end;
//        end;


        //选中当天的,当月
//        if (StrToInt(Self.lvCalendar.Properties.Items[I].Caption)=DateUtils.DayOfTheMonth(Now))
//          and (GetMonthFirstDay(Now)=GetMonthFirstDay(FCurLoadMonthFirstDay)) then
        if StandardDateToStr(AStartDate)=StandardDateToStr(Now) then
        begin
          FTodayItem:=Self.lvCalendar.Properties.Items[I];
          Self.lvCalendar.Properties.Items[I].Selected:=True;
        end;

//      end;

      AStartDate:=AStartDate+1;
    end;
  finally
    Self.lvCalendar.Properties.Items.EndUpdate();
  end;


//  if not IsPadDevice then
//  begin
//    //行数*ItemHeight
//    AVisibleCount:=0;
//    for I := 0 to Self.lvCalendar.Properties.Items.Count-1 do
//    begin
//      if Self.lvCalendar.Properties.Items[I].Visible then
//      begin
//        Inc(AVisibleCount);
//      end;
//    end;
//    Self.lvCalendar.Properties.ItemHeight:=40;
//    Self.lvCalendar.Height:=Ceil(AVisibleCount/7)*Self.lvCalendar.Properties.ItemHeight+5;

  if Self.lvCalendar.Properties.Items.Count>7 then
  begin
    Self.lvCalendar.Properties.ItemHeight:=1/Ceil(Self.lvCalendar.Properties.Items.Count/7);
  end
  else
  begin
    Self.lvCalendar.Properties.ItemHeight:=-1;
  end;

//  end;
end;

procedure TFrameSubCalendar.LoadCalendar(MonthFirstDay:TDateTime);
var
  DayOfWeek:Word;
  ATimerTask:TTimerTask;
  AStartDate:TDateTime;
  ADayCount:Integer;
begin
//  Self.btnSetting.Caption:=GlobalManager.LicInfo.EmpName;


  FCurLoadMonthFirstDay:=MonthFirstDay;
//  Self.btnMonth.Caption:=GetCurrentMonth(MonthFirstDay);
  FTodayItem:=nil;

  //隔天了,就更新一下
  //判断这个月最大是几号
  //判断这个月一号,是星期几
  DayOfWeek:=DateUtils.DayOfTheWeek(DateUtils.StartOfTheMonth(MonthFirstDay));

  AStartDate:=MonthFirstDay-DayOfWeek+1;
  ADayCount:=DaysInAMonth(YearOf(MonthFirstDay),MonthOf(MonthFirstDay));
  ADayCount:=Ceil((ADayCount+DayOfWeek-1)/7);
  ADayCount:=ADayCount*7;

  Load(AStartDate,AStartDate+ADayCount);


//  {$IFDEF NETWORKOFF}
//
//  {$ELSE}
//  ShowWaitingFrame(Self,Langs_Waiting_Hint_LoadingCalendar[LangKind]);
//
//  //线程
//  ATimerTask:=TTimerTask.Create(0);
//  ATimerTask.OnExecute:=DoGetInspectGoodsBillList;
//  ATimerTask.OnExecuteEnd:=DoGetInspectGoodsBillListExecuteEnd;
//
//  ATimerTask.TaskTag:=Const_TimerTask_None;
//
//  GetGlobalTimerThread.RunTask(ATimerTask);
//  {$ENDIF}


end;


procedure TFrameSubCalendar.LoadNow;
begin
  //加载当天当月的日历
  LoadCalendar(GetMonthFirstDay(Now));
end;

end.
