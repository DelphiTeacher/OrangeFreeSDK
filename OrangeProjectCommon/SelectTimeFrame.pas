unit SelectTimeFrame;

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


  uSkinLabelType, uSkinFireMonkeyLabel, uSkinButtonType, uSkinFireMonkeyButton,
  uSkinScrollControlType, uSkinCustomListType, uSkinVirtualListType,
  uSkinListBoxType, uSkinFireMonkeyListBox, uSkinFireMonkeyControl,
  uSkinPanelType, uSkinFireMonkeyPanel, uSkinMaterial, uDrawCanvas;

type
  TFrameSelectTime = class(TFrame)
    btnButtonMaterial: TSkinButtonDefaultMaterial;
    lbSelectValueMaterial: TSkinListBoxDefaultMaterial;
    pnlClient: TSkinFMXPanel;
    pnlBottom: TSkinFMXPanel;
    pnlBottomCenter: TSkinFMXPanel;
    pnlBackColor: TSkinFMXPanel;
    lbHour: TSkinFMXListBox;
    lbMinute: TSkinFMXListBox;
    pnlBottomBar: TSkinFMXPanel;
    btnCancel: TSkinFMXButton;
    btnOK: TSkinFMXButton;
    lblCaption: TSkinFMXLabel;
    lblSign: TSkinFMXLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure pnlClientClick(Sender: TObject);
  private
    { Private declarations }
  public
    function GetHour:TDateTime;
    procedure SetHour(const Value: TDateTime);
    procedure init(AHour:String;AMinite:String);
  public
//    FrameHistroy:TFrameHistroy;
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;

var
  GlobalSelectTimeFrame:TFrameSelectTime;

implementation

{$R *.fmx}

{ TFrameSelectTime }

procedure TFrameSelectTime.btnCancelClick(Sender: TObject);
begin
  //什么也不做
  //清空返回事件,也就是返回的时候不调用它
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;

  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self.FrameHistroy);
end;

procedure TFrameSelectTime.btnOKClick(Sender: TObject);
begin
  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self.FrameHistroy);
end;

constructor TFrameSelectTime.Create(AOwner: TComponent);
var
  I: Integer;
  J: Integer;
begin
  inherited;
 //设置主题颜色
  Self.pnlBottomBar.SelfOwnMaterial.BackColor.FillColor.Color:=SkinThemeColor;
  Self.lbSelectValueMaterial.DrawCenterItemRectParam.BorderColor.Color:=SkinThemeColor;


  Self.lbHour.Properties.VertControlGestureManager.MinVelocity:=80;
  Self.lbMinute.Properties.VertControlGestureManager.MinVelocity:=80;

  //清除列表
  Self.lbHour.Prop.Items.Clear(True);
  Self.lbMinute.Prop.Items.Clear(True);


    //小时
  Self.lbHour.Prop.Items.BeginUpdate;
  try
    Self.lbHour.Prop.Items.Clear(True);

    for I := 0 to 23 do
    begin
      if I<10 then
      begin
        Self.lbHour.Properties.Items.Add.Caption:=IntToStr(0)+IntToStr(I);
      end
      else
      begin
        Self.lbHour.Properties.Items.Add.Caption:=IntToStr(I);
      end;
    end;

  finally
    Self.lbHour.Prop.Items.EndUpdate();
  end;


  //分钟
  Self.lbMinute.Prop.Items.BeginUpdate;
  try
    Self.lbMinute.Prop.Items.Clear(True);

    for J := 0 to 59 do
    begin
      if J<10 then
      begin
        Self.lbMinute.Properties.Items.Add.Caption:=IntToStr(0)+IntToStr(J);
      end
      else
      begin
        Self.lbMinute.Properties.Items.Add.Caption:=IntToStr(J);
      end;
    end;
  finally
    Self.lbMinute.Prop.Items.EndUpdate();
  end;


  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

function TFrameSelectTime.GetHour: TDateTime;
begin
  Result:=DateUtils.EncodeDateTime(
                1900,1,1,
                StrToInt(Self.lbHour.Properties.CenterItem.Caption),
                StrToInt(Self.lbMinute.Properties.CenterItem.Caption),
                0,0);
end;

procedure TFrameSelectTime.init(AHour:String;AMinite:String);
begin

  Self.lbHour.Prop.Items.FindItemByCaption(AHour).Selected:=True;
  Self.lbMinute.Prop.Items.FindItemByCaption(AMinite).Selected:=True;
end;

procedure TFrameSelectTime.pnlClientClick(Sender: TObject);
begin
  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(Self.FrameHistroy);
end;

procedure TFrameSelectTime.SetHour(const Value: TDateTime);
begin
  Self.lbHour.Properties.CenterItem:=Self.lbHour.Properties.Items.FindItemByCaption(IntToStr(HourOf(Value)));
  Self.lbMinute.Properties.CenterItem:=Self.lbMinute.Properties.Items.FindItemByCaption(IntToStr(MinuteOf(Value)));

end;

end.
