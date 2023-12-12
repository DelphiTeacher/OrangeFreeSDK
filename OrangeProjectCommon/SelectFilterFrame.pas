unit SelectFilterFrame;

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
  FMX.DateTimeCtrls, uSkinFireMonkeyDateEdit, uSkinFireMonkeyRadioButton,
  uSkinFireMonkeyCheckBox, uSkinFireMonkeyScrollBoxContent,
  uSkinFireMonkeyScrollControl, uSkinFireMonkeyScrollBox, uSkinMaterial,
  uSkinButtonType, uSkinFireMonkeyLabel, uSkinLabelType, uSkinRadioButtonType,
  uSkinCheckBoxType, uSkinScrollBoxContentType, uSkinScrollControlType,
  uSkinScrollBoxType, uSkinPanelType,uDrawRectParam;

type
  TFrameSelectFilter = class(TFrame,IPageSavedValue)
    pnlToolBar: TSkinFMXPanel;
    btnReturn: TSkinFMXButton;
    btnOK: TSkinFMXButton;
    sbClient: TSkinFMXScrollBox;
    sbcClient: TSkinFMXScrollBoxContent;
    pnlSelectMonth: TSkinFMXPanel;
    chkIsAdmin: TSkinFMXCheckBox;
    rbMonth: TSkinFMXRadioButton;
    pnlSelectDate: TSkinFMXPanel;
    rbDate: TSkinFMXRadioButton;
    pnlMonth: TSkinFMXPanel;
    btnSelectMonth: TSkinFMXButton;
    pnlDate: TSkinFMXPanel;
    dedtStartTime: TSkinFMXDateEdit;
    dedtEndDate: TSkinFMXDateEdit;
    btnStartDate: TSkinFMXButton;
    lblStartDateTo: TSkinFMXLabel;
    btnEndDate: TSkinFMXButton;
    btnStartDate_Material: TSkinButtonDefaultMaterial;
    pnlEmpty4: TSkinFMXPanel;
    btnClear: TSkinFMXButton;
    procedure rbMonthClick(Sender: TObject);
    procedure rbDateClick(Sender: TObject);
    procedure dedtStartTimeChange(Sender: TObject);
    procedure dedtEndDateChange(Sender: TObject);
    procedure btnSelectMonthStayClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure btnStartDateStayClick(Sender: TObject);
    procedure btnEndDateStayClick(Sender: TObject);
    procedure pnlDateResize(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    //清空
    procedure Clear;

    //选择月份
    procedure OnReturnFromSelectMonthFrame(Frame:TFrame);

    procedure SwitchDateType;
    { Private declarations }
  public
    FStartDate:String;
    FEndDate:String;
    FMonth:String;
    function GetSavedValue:ISuperObject;
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
  public
    procedure Load(
                  AStartDate:String;
                  AEndDate:String;
                  //YYYY-MM格式
                  AMonth:String
                  );
    { Public declarations }
  end;

var
  GlobalSelectFilterFrame:TFrameSelectFilter;

implementation

{$R *.fmx}

//uses
//  MainFrame//,
////  GoodsSummaryFrame,
//  //MainForm
//  ;

procedure TFrameSelectFilter.btnClearClick(Sender: TObject);
begin
  Self.btnSelectMonth.Caption:='';
  Self.btnStartDate.Caption:='';
  self.btnEndDate.Caption:='';

  Self.FStartDate:='';
  Self.FEndDate:='';
  Self.FMonth:='';
end;

procedure TFrameSelectFilter.btnEndDateStayClick(Sender: TObject);
begin
  //选择日期
  if Self.btnEndDate.Caption='' then
  begin
    Self.dedtEndDate.DateTime:=Now;
  end;
  Self.dedtEndDate.OpenPicker;

end;


procedure TFrameSelectFilter.btnOKClick(Sender: TObject);
begin
  if Self.rbMonth.Prop.Checked then
  begin
    FMonth:=Self.btnSelectMonth.Caption;

    //YYYY-MM-DD
    FStartDate:=FMonth+'-01';
    FEndDate:=FormatDateTime('yyyy-mm-dd',EndOfTheMonth(StdStrToDate(FStartDate)));
  end;

  if Self.rbDate.Prop.Checked then
  begin
    FMonth:='';

    FStartDate:=Self.btnStartDate.Caption;
    FEndDate:=Self.btnEndDate.Caption;

  end;


  //返回
  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self.FrameHistroy);
end;

procedure TFrameSelectFilter.btnReturnClick(Sender: TObject);
begin
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  //返回
  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self.FrameHistroy);
end;

procedure TFrameSelectFilter.btnSelectMonthStayClick(
  Sender: TObject);
begin
  if FMonth='' then
  begin
    //默认显示当前月份
    FMonth:=FormatDateTime('YYYY-MM',Now);
    Self.btnSelectMonth.Caption:=FMonth;
  end;

  ShowFrame(TFrame(GlobalSelectMonthFrame),TFrameSelectMonth,Application.MainForm,nil,nil,OnReturnFromSelectMonthFrame,Application,True,True,ufsefAlpha);
  GlobalSelectMonthFrame.Init(2016,
                              StrToInt(FormatDateTime('YYYY',Now)),
                              StandardStrToDateTime(FMonth+'-01 00:00:00')
                              );
//  GlobalSelectMonthFrame.SetMonth(FMonth);
end;

procedure TFrameSelectFilter.btnStartDateStayClick(
  Sender: TObject);
begin
  //选择日期
  if Self.btnStartDate.Caption='' then
  begin
    Self.dedtStartTime.DateTime:=Now;
  end;
  Self.dedtStartTime.OpenPicker;

end;

procedure TFrameSelectFilter.Clear;
begin
  FStartDate:='';
  FEndDate:='';
  FMonth:='';

  Self.btnSelectMonth.Caption:='';

  Self.btnStartDate.Caption:='';
  Self.btnEndDate.Caption:='';

  Self.rbMonth.Prop.Checked:=False;

  Self.rbDate.Prop.Checked:=True;

end;

constructor TFrameSelectFilter.Create(AOwner: TComponent);
begin
  inherited;

  Self.dedtStartTime.Visible:=False;
  Self.dedtEndDate.Visible:=False;

  TDrawRectParamEffect(Self.btnStartDate_Material.BackColor.DrawEffectSetting.FocusedEffect).BorderColor.Color:=SkinThemeColor;
end;

procedure TFrameSelectFilter.dedtStartTimeChange(
  Sender: TObject);
begin
  Self.btnStartDate.Caption:=FormatDateTime('YYYY-MM-DD',Self.dedtStartTime.Date);
end;

function TFrameSelectFilter.GetSavedValue: ISuperObject;
begin
  Result:=TSuperObject.Create();
  Result.S['StartDate']:=Self.FStartDate;
  Result.S['EndDate']:=Self.FEndDate;
end;

procedure TFrameSelectFilter.dedtEndDateChange(Sender: TObject);
begin
  Self.btnEndDate.Caption:=FormatDateTime('YYYY-MM-DD',Self.dedtEndDate.Date);
end;

procedure TFrameSelectFilter.Load(
                                  AStartDate:String;
                                  AEndDate:String;
                                  AMonth:String
                                  );
begin

  Clear;

  FStartDate:=AStartDate;
  FEndDate:=AEndDate;
  FMonth:=AMonth;




  Self.dedtStartTime.OnChange:=nil;
  Self.dedtEndDate.OnChange:=nil;



  if (FStartDate<>'') or (FEndDate<>'') then
  begin
      Self.rbMonth.Prop.Checked:=False;
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

  if FMonth<>'' then
  begin
      Self.rbMonth.Prop.Checked:=True;
      Self.rbDate.Prop.Checked:=False;

      Self.dedtStartTime.DateTime:=0;
      Self.dedtEndDate.DateTime:=0;

      Self.btnStartDate.Caption:='';
      Self.btnEndDate.Caption:='';

      Self.btnSelectMonth.Caption:=FMonth;
  end
  else
  begin


      //Self.btnSelectMonth.Caption:=FMonth;
  end;


  Self.dedtStartTime.OnChange:=Self.dedtStartTimeChange;
  Self.dedtEndDate.OnChange:=Self.dedtEndDateChange;


  Self.SwitchDateType;

  Self.sbcClient.Height:=GetSuitScrollContentHeight(Self.sbcClient);
end;

procedure TFrameSelectFilter.OnReturnFromSelectMonthFrame(
  Frame: TFrame);
begin
  Self.btnSelectMonth.Caption:=FormatDateTime('YYYY-MM',GlobalSelectMonthFrame.GetMonth);


  if Self.btnSelectMonth.CanFocus then
  begin
    Self.btnSelectMonth.SetFocus;
  end;
end;

procedure TFrameSelectFilter.pnlDateResize(Sender: TObject);
begin
  Self.btnStartDate.Width:=(Self.pnlDate.Width
                            -lblStartDateTo.Width
                            -Self.btnStartDate.Margins.Left*2)
                            /2;
  Self.btnEndDate.Width:=Self.btnStartDate.Width;


//  Self.btnSelectMonth.Width:=Self.btnStartDate.Width;

end;

procedure TFrameSelectFilter.rbDateClick(Sender: TObject);
begin
  Self.rbMonth.Prop.Checked:=False;
  Self.rbDate.Prop.Checked:=True;

  Self.SwitchDateType;

//  Self.rbMonth.Prop.Checked:=False;
//  Self.btnSelectMonth.Enabled:=False;
//  Self.btnStartDate.Enabled:=True;
//  Self.btnEndDate.Enabled:=True;
//  Self.btnSelectMonth.Caption:='';
////  Self.btnSelectMonth.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
////  Self.btnStartDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
////  Self.btnEndDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
//  Self.dedtStartTime.Date:=Now;
//  Self.btnStartDate.Caption:=FormatDateTime('YYYY-MM-DD',Self.dedtStartTime.Date);
end;

procedure TFrameSelectFilter.rbMonthClick(Sender: TObject);
begin
  Self.rbMonth.Prop.Checked:=True;
  Self.rbDate.Prop.Checked:=False;

  Self.SwitchDateType;
//  Self.rbDate.Prop.Checked:=False;
//  Self.btnSelectMonth.Enabled:=True;
//  Self.btnSelectMonth.Caption:=FormatDateTime('YYYY-MM',FMonth);
//  Self.btnStartDate.Enabled:=False;
//  Self.btnEndDate.Enabled:=False;
//
//  Self.btnStartDate.Caption:='';
//  Self.btnEndDate.Caption:='';

//  Self.btnSelectMonth.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
//  Self.btnStartDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
//  Self.btnEndDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
end;

procedure TFrameSelectFilter.SwitchDateType;
begin

  if Self.rbMonth.Prop.Checked=True then
  begin
    Self.rbDate.Prop.Checked:=False;

    Self.btnSelectMonth.Enabled:=True;
//    Self.btnSelectMonth.Caption:=FMonth;

    Self.btnStartDate.Enabled:=False;
    Self.btnEndDate.Enabled:=False;
//    Self.btnSelectMonth.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
//    Self.btnStartDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
//    Self.btnEndDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
  end
  else
  begin
    Self.rbMonth.Prop.Checked:=False;

    Self.btnSelectMonth.Enabled:=False;

    Self.btnStartDate.Enabled:=True;
    Self.btnEndDate.Enabled:=True;
//    Self.btnStartDate.Caption:=FormatDateTime('YYYY-MM-DD',Self.dedtStartTime.Date);
//    Self.btnSelectMonth.SelfOwnMaterialToDefault.BackColor.BorderWidth:=0;
//    Self.btnStartDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
//    Self.btnEndDate.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
  end;

end;

end.
