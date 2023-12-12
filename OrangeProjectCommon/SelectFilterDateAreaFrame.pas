unit SelectFilterDateAreaFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,


  EasyServiceCommonMaterialDataMoudle,

//  uManager,
  uDrawCanvas,

  uFuncCommon,
  uBaseList,



  uComponentType,
  WaitingFrame,

  uSkinListBoxType,

  uRestInterfaceCall,
  uUIFunction,
  XSuperObject,
  XSuperJson,
  uBaseHttpControl,

  SelectMonthFrame,

  DateUtils,
  uAPPCommon,
  uBasePageStructure,

  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,
  FMX.DateTimeCtrls, uSkinFireMonkeyDateEdit, uSkinFireMonkeyCheckBox,
  uSkinFireMonkeyScrollBoxContent,
  uSkinFireMonkeyScrollControl, uSkinFireMonkeyScrollBox, uSkinMaterial,
  uSkinButtonType, uSkinFireMonkeyLabel, uSkinLabelType, uSkinCheckBoxType,
  uSkinScrollBoxContentType, uSkinScrollControlType,
  uSkinScrollBoxType, uSkinPanelType,uDrawRectParam;

type
//  TSelectFilterDateAreaType=(sfdatNone,//全部
//                            sfdatToday,//今天
//                            sfdatYestday,//昨天
//                            sfdatCurrentMonth,//本月
//                            sfdatCustomDay,//自定义日期
//                            sfdatCustomMonth//自定义月份
//                            );

  TFrameSelectFilterDateArea = class(TFrame,IPageSavedValue)
    pnlToolBar: TSkinFMXPanel;
    btnReturn: TSkinFMXButton;
    btnOK: TSkinFMXButton;
    sbClient: TSkinFMXScrollBox;
    sbcClient: TSkinFMXScrollBoxContent;
    pnlSelectMonth: TSkinFMXPanel;
    chkIsAdmin: TSkinFMXCheckBox;
    pnlSelectDate: TSkinFMXPanel;
    pnlMonth: TSkinFMXPanel;
    btnSelectMonth: TSkinFMXButton;
    pnlStartDate: TSkinFMXPanel;
    dedtStartTime: TSkinFMXDateEdit;
    dedtEndDate: TSkinFMXDateEdit;
    btnStartDate: TSkinFMXButton;
    btnStartDate_Material: TSkinButtonDefaultMaterial;
    pnlEmpty4: TSkinFMXPanel;
    btnClear: TSkinFMXButton;
    pnlAll: TSkinFMXPanel;
    pnlToday: TSkinFMXPanel;
    pnlYestday: TSkinFMXPanel;
    pnlCurrentMonth: TSkinFMXPanel;
    pnlEndDate: TSkinFMXPanel;
    btnEndDate: TSkinFMXButton;
    rbToday: TSkinFMXCheckBox;
    rbYestday: TSkinFMXCheckBox;
    rbCurrentMonth: TSkinFMXCheckBox;
    rbAll: TSkinFMXCheckBox;
    rbDate: TSkinFMXCheckBox;
    rbMonth: TSkinFMXCheckBox;
    pnlCurrentWeek: TSkinFMXPanel;
    rbCurrentWeek: TSkinFMXCheckBox;
//    procedure rbMonthClick(Sender: TObject);
//    procedure rbDateClick(Sender: TObject);
    procedure dedtStartTimeChange(Sender: TObject);
    procedure dedtEndDateChange(Sender: TObject);
    procedure btnSelectMonthStayClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure btnStartDateStayClick(Sender: TObject);
    procedure btnEndDateStayClick(Sender: TObject);
    procedure pnlStartDateResize(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure pnlAllClick(Sender: TObject);
    procedure pnlTodayClick(Sender: TObject);
    procedure pnlYestdayClick(Sender: TObject);
    procedure pnlCurrentMonthClick(Sender: TObject);
    procedure pnlSelectDateClick(Sender: TObject);
    procedure pnlSelectMonthClick(Sender: TObject);
    procedure pnlRecent30DaysClick(Sender: TObject);
    procedure pnlCurrentWeekClick(Sender: TObject);
  private
    //清空
    procedure Clear;

    //选择月份
    procedure OnReturnFromSelectMonthFrame(Frame:TFrame);

//    procedure SwitchDateType;
    { Private declarations }
  public
    FStartDate:String;
    FEndDate:String;
//    FSelectFilterDateAreaType:TSelectFilterDateAreaType;
//    FMonth:String;
    function GetSavedValue:ISuperObject;
    procedure ClearChecked;
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
  public
    procedure Load(
                  AStartDate:String;
                  AEndDate:String//;
                  //YYYY-MM格式
                  //AMonth:String
                  );
    { Public declarations }
  end;




var
  GlobalSelectFilterDateAreaFrame:TFrameSelectFilterDateArea;

implementation

{$R *.fmx}

//uses
//  MainFrame//,
////  GoodsSummaryFrame,
//  //MainForm
//  ;

procedure TFrameSelectFilterDateArea.btnClearClick(Sender: TObject);
begin
  Self.btnSelectMonth.Caption:='';
  Self.btnStartDate.Caption:='';
  self.btnEndDate.Caption:='';

  Self.FStartDate:='';
  Self.FEndDate:='';
//  Self.FMonth:='';
end;

procedure TFrameSelectFilterDateArea.btnEndDateStayClick(Sender: TObject);
begin
  //选择日期
  if Self.btnEndDate.Caption='' then
  begin
    Self.dedtEndDate.DateTime:=Now;
  end;
  Self.dedtEndDate.OpenPicker;

end;


procedure TFrameSelectFilterDateArea.btnOKClick(Sender: TObject);
begin
  if Self.rbAll.Prop.Checked then
  begin
    FStartDate:='';
    FEndDate:='';
  end;
  if Self.rbToday.Prop.Checked then
  begin
    FStartDate:=FormatDateTime('yyyy-mm-dd',Now);
    FEndDate:=FormatDateTime('yyyy-mm-dd',Now);
  end;
  if Self.rbYestday.Prop.Checked then
  begin
    FStartDate:=FormatDateTime('yyyy-mm-dd',Now-1);
    FEndDate:=FormatDateTime('yyyy-mm-dd',Now-1);
  end;
  if Self.rbCurrentWeek.Prop.Checked then
  begin
    //本周
    FStartDate:=FormatDateTime('yyyy-mm-01',StartOfTheWeek(Now));
    FEndDate:=FormatDateTime('yyyy-mm-dd',EndOfTheWeek(Now));
  end;
  if Self.rbCurrentMonth.Prop.Checked then
  begin
    FStartDate:=FormatDateTime('yyyy-mm-01',Now);
    FEndDate:=FormatDateTime('yyyy-mm-dd',EndOfTheMonth(Now));
  end;

  if Self.rbMonth.Prop.Checked then
  begin
//    FMonth:=Self.btnSelectMonth.Caption;

    //YYYY-MM-DD
    FStartDate:=Self.btnSelectMonth.Caption+'-01';
    FEndDate:=FormatDateTime('yyyy-mm-dd',EndOfTheMonth(StdStrToDate(FStartDate)));
  end;

  if Self.rbDate.Prop.Checked then
  begin
//    FMonth:='';

    FStartDate:=Self.btnStartDate.Caption;
    FEndDate:=Self.btnEndDate.Caption;

  end;


  //返回
  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self.FrameHistroy);
end;

procedure TFrameSelectFilterDateArea.btnReturnClick(Sender: TObject);
begin
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  //返回
  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self.FrameHistroy);
end;

procedure TFrameSelectFilterDateArea.btnSelectMonthStayClick(
  Sender: TObject);
begin
  if Self.btnSelectMonth.Caption='' then
  begin
    //默认显示当前月份
    Self.btnSelectMonth.Caption:=FormatDateTime('YYYY-MM',Now);
//    Self.btnSelectMonth.Caption:=FMonth;
  end;

  ShowFrame(TFrame(GlobalSelectMonthFrame),TFrameSelectMonth,Application.MainForm,nil,nil,OnReturnFromSelectMonthFrame,Application,True,True,ufsefAlpha);
  GlobalSelectMonthFrame.Init(2016,
                              StrToInt(FormatDateTime('YYYY',Now)),
                              StandardStrToDateTime(Self.btnSelectMonth.Caption+'-01 00:00:00')
                              );
//  GlobalSelectMonthFrame.SetMonth(FMonth);
end;

procedure TFrameSelectFilterDateArea.btnStartDateStayClick(
  Sender: TObject);
begin
  //选择日期
  if Self.btnStartDate.Caption='' then
  begin
    Self.dedtStartTime.DateTime:=Now;
  end;
  Self.dedtStartTime.OpenPicker;

end;

procedure TFrameSelectFilterDateArea.Clear;
begin
  FStartDate:='';
  FEndDate:='';
//  FMonth:='';

  Self.btnSelectMonth.Caption:='';

  Self.btnStartDate.Caption:='';
  Self.btnEndDate.Caption:='';

  ClearChecked;
end;

procedure TFrameSelectFilterDateArea.ClearChecked;
begin

  Self.rbMonth.Prop.Checked:=False;
  Self.rbDate.Prop.Checked:=False;
  rbAll.Prop.Checked:=False;
  rbToday.Prop.Checked:=False;
  rbYestday.Prop.Checked:=False;
  rbCurrentWeek.Prop.Checked:=False;
  rbCurrentMonth.Prop.Checked:=False;
  rbDate.Prop.Checked:=False;
  rbMonth.Prop.Checked:=False;

  Self.pnlStartDate.Enabled:=False;
  Self.pnlEndDate.Enabled:=False;

  Self.pnlMonth.Enabled:=False;
end;

constructor TFrameSelectFilterDateArea.Create(AOwner: TComponent);
begin
  inherited;

  Self.dedtStartTime.Visible:=False;
  Self.dedtEndDate.Visible:=False;

  TDrawRectParamEffect(Self.btnStartDate_Material.BackColor.DrawEffectSetting.FocusedEffect).BorderColor.Color:=SkinThemeColor;
end;

procedure TFrameSelectFilterDateArea.dedtStartTimeChange(
  Sender: TObject);
begin
  Self.btnStartDate.Caption:=FormatDateTime('YYYY-MM-DD',Self.dedtStartTime.Date);
end;

function TFrameSelectFilterDateArea.GetSavedValue: ISuperObject;
begin
  Result:=TSuperObject.Create();
  Result.S['StartDate']:=Self.FStartDate;
  Result.S['EndDate']:=Self.FEndDate;
end;

procedure TFrameSelectFilterDateArea.dedtEndDateChange(Sender: TObject);
begin
  Self.btnEndDate.Caption:=FormatDateTime('YYYY-MM-DD',Self.dedtEndDate.Date);
end;

procedure TFrameSelectFilterDateArea.Load(
                                          AStartDate:String;
                                          AEndDate:String//;
                                          //AMonth:String
                                          );
begin

  Clear;

  FStartDate:=AStartDate;
  FEndDate:=AEndDate;
//  FMonth:=AMonth;




  Self.dedtStartTime.OnChange:=nil;
  Self.dedtEndDate.OnChange:=nil;

  rbAll.Prop.Checked:=False;
  rbToday.Prop.Checked:=False;
  rbYestday.Prop.Checked:=False;
  rbCurrentMonth.Prop.Checked:=False;
  rbDate.Prop.Checked:=False;
  rbMonth.Prop.Checked:=False;

  if (FStartDate='') or (FEndDate='') then
  begin
    //所有
    Self.pnlAllClick(nil);
  end
  else if (FStartDate=FormatDateTime('YYYY-MM-DD',Now)) and (FStartDate=FEndDate) then
  begin
    //当天
    Self.pnlTodayClick(nil);
  end
  else if (FStartDate=FormatDateTime('YYYY-MM-DD',Now-1)) and (FStartDate=FEndDate) then
  begin
    //昨天
    Self.pnlYestdayClick(nil);
  end
  else if (FStartDate=FormatDateTime('YYYY-MM-01',StartOfTheWeek(Now))) and (FEndDate=FormatDateTime('yyyy-mm-dd',EndOfTheWeek(Now))) then
  begin
    //本周
    Self.pnlCurrentWeekClick(nil);
  end
  else if (FStartDate=FormatDateTime('YYYY-MM-01',Now)) and (FEndDate=FormatDateTime('yyyy-mm-dd',EndOfTheMonth(Now))) then
  begin
    //本月
    Self.pnlCurrentMonthClick(nil);
  end
  else if (FStartDate=FormatDateTime('YYYY-MM-01',StdStrToDate(FStartDate))) and (FEndDate=FormatDateTime('yyyy-mm-dd',EndOfTheMonth(StdStrToDate(FEndDate)))) then
  begin
    //指定月份
    Self.pnlSelectMonthClick(nil);
    Self.btnSelectMonth.Caption:=FormatDateTime('YYYY-MM',StdStrToDate(FStartDate));
  end
  else
  //if (FStartDate<>'') or (FEndDate<>'') then
  begin
      //指定日期范围
      Self.pnlSelectDateClick(nil);
      Self.rbDate.Prop.Checked:=True;


      Self.btnStartDate.Caption:=FStartDate;

      if FStartDate<>'' then
      begin
        Self.dedtStartTime.DateTime:=StandardStrToDate(FStartDate);
      end
      else
      begin
        Self.dedtStartTime.DateTime:=0;
      end;


      Self.btnEndDate.Caption:=FEndDate;
      if FEndDate<>'' then
      begin
        Self.dedtEndDate.DateTime:=StandardStrToDate(FEndDate);
      end
      else
      begin
        Self.dedtEndDate.DateTime:=0;
      end;

  end;



//  if FMonth<>'' then
//  begin
//      Self.rbMonth.Prop.Checked:=True;
//      Self.rbDate.Prop.Checked:=False;
//
//      Self.dedtStartTime.DateTime:=0;
//      Self.dedtEndDate.DateTime:=0;
//
//      Self.btnStartDate.Caption:='';
//      Self.btnEndDate.Caption:='';
//
//      Self.btnSelectMonth.Caption:=FMonth;
//  end
//  else
//  begin
//
//
//      //Self.btnSelectMonth.Caption:=FMonth;
//  end;


  Self.dedtStartTime.OnChange:=Self.dedtStartTimeChange;
  Self.dedtEndDate.OnChange:=Self.dedtEndDateChange;


//  Self.SwitchDateType;

  Self.sbcClient.Height:=GetSuitScrollContentHeight(Self.sbcClient);
end;

procedure TFrameSelectFilterDateArea.OnReturnFromSelectMonthFrame(
  Frame: TFrame);
begin
  Self.btnSelectMonth.Caption:=FormatDateTime('YYYY-MM',GlobalSelectMonthFrame.GetMonth);


  if Self.btnSelectMonth.CanFocus then
  begin
    Self.btnSelectMonth.SetFocus;
  end;
end;

procedure TFrameSelectFilterDateArea.pnlAllClick(Sender: TObject);
begin
  ClearChecked;
  rbAll.Prop.Checked:=True;
end;

procedure TFrameSelectFilterDateArea.pnlCurrentMonthClick(Sender: TObject);
begin
  ClearChecked;
  rbCurrentMonth.Prop.Checked:=True;
end;

procedure TFrameSelectFilterDateArea.pnlCurrentWeekClick(Sender: TObject);
begin
  ClearChecked;
  rbCurrentWeek.Prop.Checked:=True;

end;

procedure TFrameSelectFilterDateArea.pnlRecent30DaysClick(Sender: TObject);
begin
  ClearChecked;

end;

procedure TFrameSelectFilterDateArea.pnlSelectDateClick(Sender: TObject);
begin
  ClearChecked;
  rbDate.Prop.Checked:=True;
  Self.pnlStartDate.Enabled:=True;
  Self.pnlEndDate.Enabled:=True;
end;

procedure TFrameSelectFilterDateArea.pnlSelectMonthClick(Sender: TObject);
begin
  ClearChecked;
  rbMonth.Prop.Checked:=True;
  Self.pnlMonth.Enabled:=True;
end;

procedure TFrameSelectFilterDateArea.pnlStartDateResize(Sender: TObject);
begin
//  Self.btnStartDate.Width:=(Self.pnlDate.Width
//                            -lblStartDateTo.Width
//                            -Self.btnStartDate.Margins.Left*2)
//                            /2;
//  Self.btnEndDate.Width:=Self.btnStartDate.Width;


//  Self.btnSelectMonth.Width:=Self.btnStartDate.Width;

end;

procedure TFrameSelectFilterDateArea.pnlTodayClick(Sender: TObject);
begin
  ClearChecked;
  rbToday.Prop.Checked:=True;
end;

procedure TFrameSelectFilterDateArea.pnlYestdayClick(Sender: TObject);
begin
  ClearChecked;
  rbYestday.Prop.Checked:=True;
end;

//procedure TFrameSelectFilterDateArea.rbDateClick(Sender: TObject);
//begin
//  Self.rbMonth.Prop.Checked:=False;
//  Self.rbDate.Prop.Checked:=True;
//
//  Self.SwitchDateType;
//
////  Self.rbMonth.Prop.Checked:=False;
////  Self.btnSelectMonth.Enabled:=False;
////  Self.btnStartDate.Enabled:=True;
////  Self.btnEndDate.Enabled:=True;
////  Self.btnSelectMonth.Caption:='';
//////  Self.btnSelectMonth.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
//////  Self.btnStartDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
//////  Self.btnEndDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
////  Self.dedtStartTime.Date:=Now;
////  Self.btnStartDate.Caption:=FormatDateTime('YYYY-MM-DD',Self.dedtStartTime.Date);
//end;

//procedure TFrameSelectFilterDateArea.rbMonthClick(Sender: TObject);
//begin
//  Self.rbMonth.Prop.Checked:=True;
//  Self.rbDate.Prop.Checked:=False;
//
//  Self.SwitchDateType;
////  Self.rbDate.Prop.Checked:=False;
////  Self.btnSelectMonth.Enabled:=True;
////  Self.btnSelectMonth.Caption:=FormatDateTime('YYYY-MM',FMonth);
////  Self.btnStartDate.Enabled:=False;
////  Self.btnEndDate.Enabled:=False;
////
////  Self.btnStartDate.Caption:='';
////  Self.btnEndDate.Caption:='';
//
////  Self.btnSelectMonth.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
////  Self.btnStartDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
////  Self.btnEndDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
//end;

//procedure TFrameSelectFilterDateArea.SwitchDateType;
//begin
//
//  if Self.rbMonth.Prop.Checked=True then
//  begin
//    Self.rbDate.Prop.Checked:=False;
//
//    Self.btnSelectMonth.Enabled:=True;
////    Self.btnSelectMonth.Caption:=FMonth;
//
//    Self.btnStartDate.Enabled:=False;
//    Self.btnEndDate.Enabled:=False;
////    Self.btnSelectMonth.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
////    Self.btnStartDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
////    Self.btnEndDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
//  end
//  else
//  begin
//    Self.rbMonth.Prop.Checked:=False;
//
//    Self.btnSelectMonth.Enabled:=False;
//
//    Self.btnStartDate.Enabled:=True;
//    Self.btnEndDate.Enabled:=True;
////    Self.btnStartDate.Caption:=FormatDateTime('YYYY-MM-DD',Self.dedtStartTime.Date);
////    Self.btnSelectMonth.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
////    Self.btnStartDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
////    Self.btnEndDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
//  end;
//
//end;

end.
