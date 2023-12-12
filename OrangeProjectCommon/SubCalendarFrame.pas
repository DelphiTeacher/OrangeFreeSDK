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



//��ȡ���µ�һ��
function GetMonthFirstDay(ADateTime:TDateTime):TDateTime;
var
  Year,Month,Day:Word;
  Hour,Minute,Second,MillSecond:Word;
begin
  //���ص��쵱�µ�����
  DateUtils.DecodeDateTime(ADateTime,Year,Month,Day,Hour,Minute,Second,MillSecond);
  Hour:=0;
  Day:=1;
  Result:=DateUtils.EncodeDateTime(Year,Month,Day,0,0,0,0);
end;

procedure TFrameSubCalendar.btnSettingClick(Sender: TObject);
begin
//  //����
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
  //��һ��
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
  //��һ��
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
//          Self.lbWeek.Properties.Items[0].Caption:='����';
//          Self.lbWeek.Properties.Items[1].Caption:='��һ';
//          Self.lbWeek.Properties.Items[2].Caption:='�ܶ�';
//          Self.lbWeek.Properties.Items[3].Caption:='����';
//          Self.lbWeek.Properties.Items[4].Caption:='����';
//          Self.lbWeek.Properties.Items[5].Caption:='����';
//          Self.lbWeek.Properties.Items[6].Caption:='����';
//        end
//        else
//        begin
//          Self.lbWeek.Properties.Items[0].Caption:='��';
//          Self.lbWeek.Properties.Items[1].Caption:='һ';
//          Self.lbWeek.Properties.Items[2].Caption:='��';
//          Self.lbWeek.Properties.Items[3].Caption:='��';
//          Self.lbWeek.Properties.Items[4].Caption:='��';
//          Self.lbWeek.Properties.Items[5].Caption:='��';
//          Self.lbWeek.Properties.Items[6].Caption:='��';
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
//    //�����ƽ��
//    Self.lvCalendar.Properties.ItemDesignerPanel:=Self.ItemPadDefault;
//
//    //ȫ����ʾ����
//    Self.lvCalendar.Align:=TAlignLayout.Client;
//
//    //��ʾ�ָ���
//    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
//    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawColLine:=True;
//    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
//    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawColLine:=True;
//
//    //�����б�
////    Self.lbOrders.Visible:=False;
//  end
//  else
//  begin
    Self.lbWeek.Height:=25;
    Self.lbWeek.Properties.ItemHeight:=25;
    Self.lbWeek.SelfOwnMaterialToDefault.DrawItemCaptionParam.DrawFont.FontSize:=12;

    //������ֻ�
    Self.lvCalendar.Properties.ItemDesignerPanel:=Self.ItemPhoneDefault;
//    Self.lvCalendar.Align:=TAlignLayout.Top;

//    Self.lvCalendar.Height:=200;


    //�ָ�������
    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
    Self.lvCalendar.SelfOwnMaterialToDefault.IsDrawColLine:=False;
    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawRowLine:=True;
    Self.lbWeek.SelfOwnMaterialToDefault.IsDrawColLine:=False;



//    //��ʾ�б�
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
////  //��ȡ����б�
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
//    //�鿴�����
//    //��ת�������ϸ
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
//  //ֱ�Ӳ鿴
//  if TSkinItem(Sender).ItemType=sitDefault then
//  begin
//    //�鿴�����
//    //��ת�������ϸ
//    GlobalMainFrame.pcMain.Properties.ActivePage:=GlobalMainFrame.tsInspectGoods;
//    //GlobalInspectGoodsInfoFrame�Ѿ�������ʾ��IPAD��
//    GlobalInspectGoodsInfoFrame.LoadInspectGoodsBill(TInspectGoodsBill(TSkinItem(Sender).Data));
//    //��λ
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
  //���������յ�����ҪΪ��ɫ
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
  //û�����ڵĲ�ѡ��
  if (Sender<>nil) and (TSkinItem(Sender).Caption<>'') then
  begin
    TSkinItem(Sender).Selected:=True;
  end;


//  //��ʾ�б������б�
//  if IsPadDevice then
//  begin
//        popPhoneOrders.IsOpen := False;
//      //�����ֻ��ϵĲ˵�
//      if popPhoneOrders.IsOpen
//        and (FCurPopupDate=StandardStrToDateTime(TSkinItem(Sender).Detail1)) then
//      begin
//        //������ڲ��䣬������
//      end
//      else
//      begin
//
//        popPhoneOrders.Placement:=TPlacement.Absolute;
//
//        //�����������(Detail��ŵĶ�����)
//        if TSkinItem(Sender).Detail<>'' then
//        begin
//          FCurPopupDate:=StandardStrToDateTime(TSkinItem(Sender).Detail1);
//
//          //ˢ�¶���
//          SyncPhoneOrdersPopup;
//
//          //���ü�ͷ
//          //�ж��ڵڼ���,�ڼ���
//          RowIndex:=TSkinItem(Sender).Index div 5;
//          ColIndex:=TSkinItem(Sender).Index mod 5;
//          //��һ���������У���ͷ������
//          //���ģ����У���ͷ������
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
//          //�����ǰ����,��ô��ͷ��ǰ��
//          //������м��У���ôǰͷ���м�
//          //����Ǻ��У���ô��ͷ�ں���
//          HorzCenterX:=TSkinItem(Sender).FItemDrawRect.Left+TSkinItem(Sender).FItemDrawRect.Width/2;
//          //����ƫ��
//          //Ĭ�����ItemRect����
//          crPhoneOrders.CalloutOffset:=(crPhoneOrders.Width-crPhoneOrders.CalloutWidth)/2;
//          popPhoneOrders.PlacementRectangle.Left:=HorzCenterX-Self.popPhoneOrders.Width/2;
//          //�������
//          if popPhoneOrders.PlacementRectangle.Left<0 then
//          begin
//            popPhoneOrders.PlacementRectangle.Left:=0;
//            crPhoneOrders.CalloutOffset:=TSkinItem(Sender).FItemDrawRect.Left
//                                          +TSkinItem(Sender).FItemDrawRect.Width/2
//                                          -crPhoneOrders.CalloutWidth/2;
//          end;
//          //�����ұ�
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
//    //��ʾ�б�
//    Self.lbOrders.Properties.Items.BeginUpdate;
//    try
//      Self.lbOrders.Properties.Items.Clear(True);
//      if (Sender<>nil) then
//      begin
//
//        //��ʾ��������
//        for I := 0 to FInspectGoodsBillList.Count-1 do
//        begin
//          if Floor(FInspectGoodsBillList[I].StartTime)
//            =Floor(StandardStrToDateTime(TSkinItem(Sender).Detail1)) then
//          begin
//            AListBoxItem:=Self.lbOrders.Properties.Items.Add;
//            AssignInspectGoodsBillToListBoxItem(AListBoxItem,FInspectGoodsBillList[I]);
////            AListBoxItem.Data:=FInspectGoodsBillList[I];
////            //�������
////            AListBoxItem.Name:=FInspectGoodsBillList[I].PONO;
////            //����(PONO+�ͻ���)
////            AListBoxItem.Caption:='PO#:'+FInspectGoodsBillList[I].PONO
////                                  +' , '+FInspectGoodsBillList[I].CustFullName
////                                  ;
////            //��ʼ����
////            AListBoxItem.Detail:=GetMonthDate(FInspectGoodsBillList[I].StartTime);
////            //��������
////            if FInspectGoodsBillList[I].EndTime=0 then
////            begin
////              AListBoxItem.Detail5:='';
////            end
////            else
////            begin
////              AListBoxItem.Detail5:=GetMonthDate(FInspectGoodsBillList[I].EndTime);
////            end;
////            //��Ʒ����
////            AListBoxItem.Detail1:=FInspectGoodsBillList[I].GoodsName;
////            //��Ӧ��+��ַ
////            AListBoxItem.Detail2:='QC#:'+FInspectGoodsBillList[I].QCRptNo;
////
////            //����״̬
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
//    //���������յ�����ҪΪ��ɫ
//
//    //���������յ�����ҪΪ��ɫ
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
//    //����
//    if Item=Self.FTodayItem then
//    begin
//      //����ɫ,��ɫ
//      TDrawPictureParamEffect(Self.lblItemPadOrderDate.SelfOwnMaterialToDefault.DrawPictureParam.DrawEffectSetting.PushedEffect).ImageIndex:=1;
//    end
//    else
//    begin
//      //����ɫ,��ɫ
//      TDrawPictureParamEffect(Self.lblItemPadOrderDate.SelfOwnMaterialToDefault.DrawPictureParam.DrawEffectSetting.PushedEffect).ImageIndex:=0;
//    end;
//
////    if Item.Detail<>'' then
////    begin
////      //���������
////      Self.lbItemOrders.Visible:=True;
////      //�����������
////      //��ʾ�б�
////      Self.lbItemOrders.Properties.Items.BeginUpdate;
////      try
////        Self.lbItemOrders.Properties.Items.Clear(True);
////        //��ʾ�����
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
////      //û���������
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

    //���������յ�����ҪΪ��ɫ
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


    //����
    if Item=Self.FTodayItem then
    begin
      //����ɫ,��ɫ
      TDrawRectParamEffect(Self.lblItemPhoneOrderDate.SelfOwnMaterialToDefault.BackColor.DrawEffectSetting.PushedEffect).FillColor.Color:=TAlphaColorRec.Red;
      TDrawPictureParamEffect(Self.lblItemPhoneOrderDate.SelfOwnMaterialToDefault.DrawPictureParam.DrawEffectSetting.PushedEffect).ImageIndex:=1;
    end
    else
    begin
      //����ɫ,��ɫ
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
      //��ն�����
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
//            //ͬһ��
//            if Self.lvCalendar.Properties.Items[I].Detail='' then
//            begin
//              Self.lvCalendar.Properties.Items[I].Detail:='0';
//            end;
//            //������+1
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
    //����ǵ����,��ô���ص�����������
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
    //����λ��
    //���ø߶�
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


//    //�������
//    for I := 0 to Self.lvCalendar.Properties.Items.Count-1 do
//    begin
//      Self.lvCalendar.Properties.Items[I].Icon.ImageIndex:=-1;
//      Self.lvCalendar.Properties.Items[I].Detail:='';
//    end;

    Self.lvCalendar.Properties.Items.Clear;

//    //���1��֮ǰ��ǰ����
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



//    //�������
//    for I := 0 to DayOfWeek-1 do
//    begin
//      Self.lvCalendar.Properties.Items.Add;
//      //Detail1 ����ʱ��
//
//
//    end;



    //���س���������
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
        //1~31��
//        if (StrToInt(Self.lvCalendar.Properties.Items[I].Caption)>27) then
//        begin
//          //�ж��Ƿ�Ӧ������
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


        //ѡ�е����,����
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
//    //����*ItemHeight
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

  //������,�͸���һ��
  //�ж����������Ǽ���
  //�ж������һ��,�����ڼ�
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
//  //�߳�
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
  //���ص��쵱�µ�����
  LoadCalendar(GetMonthFirstDay(Now));
end;

end.
