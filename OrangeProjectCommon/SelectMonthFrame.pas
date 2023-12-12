//convert pas to utf8 by ¥

unit SelectMonthFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  DateUtils,
  Math,
  StrUtils,

//  {$IFDEF ANDROID}
//  FlyFmxUtils,
//  {$ENDIF}
//  {$IFDEF IOS}
//  FMX.Helpers.iOS,
//  {$ENDIF}

  uFuncCommon,
  uUIFunction,
  uLang,
  uSkinItems,
  uVersion,
  uFrameContext,
  uSkinFireMonkeyControl, uSkinFireMonkeyPanel, uSkinFireMonkeyScrollControl,
  uSkinFireMonkeyVirtualList, uSkinFireMonkeyListBox, uSkinMaterial,
  uSkinScrollControlType, uSkinVirtualListType, uSkinListBoxType,
  uSkinFireMonkeyButton, FMX.Objects, uSkinButtonType, uSkinFireMonkeyLabel,
  uSkinCustomListType, uSkinFireMonkeyCustomList, uSkinLabelType,
  uBaseSkinControl, uSkinPanelType, uDrawCanvas;

type
  TFrameSelectMonth = class(TFrame,IFrameChangeLanguageEvent)
    pnlClient: TSkinFMXPanel;
    lbSelectValueMaterial: TSkinListBoxDefaultMaterial;
    pnlBottom: TSkinFMXPanel;
    pnlBottomCenter: TSkinFMXPanel;
    pnlBackColor: TSkinFMXPanel;
    lbYear: TSkinFMXListBox;
    lbMonth: TSkinFMXListBox;
    pnlBottomBar: TSkinFMXPanel;
    btnCancel: TSkinFMXButton;
    btnOK: TSkinFMXButton;
    lblCaption: TSkinFMXLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure pnlClientClick(Sender: TObject);
  protected
    procedure ChangeLanguage(ALangKind:TLangKind);
  public
    function GetMonth:TDateTime;
    procedure SetMonth(const Value: TDateTime);
    procedure Init(AStartYear:Integer;AEndYear:Integer;AMonth:TDateTime);
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;



var
  GlobalSelectMonthFrame:TFrameSelectMonth;


//function IsPadDevice:Boolean;

implementation



{$R *.fmx}


//function IsPadDevice:Boolean;
//begin
////  Result:=False;
//  Result:=True;
//  {$IFDEF MSWINDOWS}
//
//  {$ENDIF}
//  {$IFDEF ANDROID}
//  Result:=FlyFmxUtils.GetScreenInches>6;
//  {$ENDIF}
//  {$IFDEF IOS}
//  Result:=FMX.Helpers.iOS.IsPad;
//  {$ENDIF}
//end;


{ TFrameSelectMonth }

procedure TFrameSelectMonth.btnCancelClick(Sender: TObject);
begin
  //什么也不做
  //清空返回事件,也就是返回的时候不调用它
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  HideFrame;//(Self,hfcttBeforeReturnFrame,ufsefNone);
  ReturnFrame;//(Self);
end;

procedure TFrameSelectMonth.btnOKClick(Sender: TObject);
begin
  HideFrame;//(Self,hfcttBeforeReturnFrame,ufsefNone);
  ReturnFrame();
end;

procedure TFrameSelectMonth.ChangeLanguage(ALangKind: TLangKind);
begin
  //多语言支持
  //翻译
//  Self.btnCancel.Caption:=Langs_Button_Caption_CANCEL[ALangKind];
//  Self.btnOK.Caption:=Langs_Button_Caption_OK[ALangKind];
//  Self.lblCaption.Caption:=Langs_Caption_SelectMonth[ALangKind];
end;

constructor TFrameSelectMonth.Create(AOwner: TComponent);
begin
  inherited;

  //设置主题颜色
  Self.pnlBottomBar.SelfOwnMaterial.BackColor.FillColor.Color:=SkinThemeColor;
  Self.lbSelectValueMaterial.DrawCenterItemRectParam.BorderColor.Color:=SkinThemeColor;


  Self.lbYear.Properties.VertControlGestureManager.MinVelocity:=80;
  Self.lbMonth.Properties.VertControlGestureManager.MinVelocity:=80;

  //清除年份列表
  Self.lbYear.Prop.Items.Clear(True);
  //月份不用清除,因为月份都是1~12月


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

procedure TFrameSelectMonth.FrameResize(Sender: TObject);
begin
  if IsPadDevice then
  begin
      //平板上,居中
      pnlBottom.Align:=TAlignLayout.Center;

      pnlBottom.Height:=Height/2;
      pnlBottomCenter.Height:=pnlBottom.Height;
      pnlBottomCenter.Width:=320;
  end
  else
  begin
      //手机上,放在底部
      pnlBottom.Align:=TAlignLayout.Bottom;

      Self.pnlBottomCenter.Width:=Width;
  end;
  Self.lbYear.Width:=pnlBottomCenter.Width/2;
  Self.lbMonth.Width:=pnlBottomCenter.Width/2;
end;

procedure TFrameSelectMonth.pnlClientClick(Sender: TObject);
begin
  btnCancelClick(Sender);
end;

procedure TFrameSelectMonth.SetMonth(const Value: TDateTime);
begin
  Self.lbYear.Properties.CenterItem:=Self.lbYear.Properties.Items.FindItemByCaption(IntToStr(YearOf(Value)));
  Self.lbMonth.Properties.CenterItem:=Self.lbMonth.Properties.Items.FindItemByCaption(IntToStr(MonthOf(Value)));
end;

function TFrameSelectMonth.GetMonth: TDateTime;
begin
  Result:=DateUtils.EncodeDateTime(
                StrToInt(Self.lbYear.Properties.CenterItem.Caption),
                StrToInt(Self.lbMonth.Properties.CenterItem.Caption),
                1,0,0,0,0);
end;

procedure TFrameSelectMonth.Init(AStartYear, AEndYear: Integer;AMonth: TDateTime);
var
  I:Integer;
begin

  //距离2013
  Self.lbYear.Properties.Items.BeginUpdate;
  try
    Self.lbYear.Properties.Items.Clear(True);
    for I := AStartYear to AEndYear do
    begin
      Self.lbYear.Properties.Items.Add.Caption:=IntToStr(I);
    end;
  finally
    Self.lbYear.Prop.Items.EndUpdate();
  end;

  SetMonth(AMonth);

end;


end.
