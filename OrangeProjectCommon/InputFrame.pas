//convert pas to utf8 by ¥

unit InputFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uSkinFireMonkeyScrollBoxContent,

  uSkinMaterial,
  uUIFunction,
  uBaseLog,

  Math,
  uSkinFireMonkeyControl, uSkinFireMonkeyScrollControl, uSkinFireMonkeyScrollBox,
  uSkinFireMonkeyPanel, uSkinFireMonkeyButton, FMX.Controls.Presentation,
  FMX.Edit, uSkinFireMonkeyEdit, FMX.ScrollBox, FMX.Memo, uSkinFireMonkeyMemo,
  uFrameContext, uSkinButtonType, uBaseSkinControl, uSkinPanelType,
  FMX.Memo.Types;


const
  //最大的行数
  Const_MaxMemoLineCount=3;
  //每行的高度
  Const_MemoLineHeight=24;
  //默认的面板高度
  Const_DefaultPanelHeight=44;



type
  TFrameInput = class(TFrame,
                      IFrameVirtualKeyboardAutoProcessEvent)
    FrameContext1: TFrameContext;
    pnlInput: TSkinFMXPanel;
    memMsgInput: TSkinFMXMemo;
    pnlRight: TSkinFMXPanel;
    btnOK: TSkinFMXButton;
    tmrSyncMemoHeight: TTimer;
    procedure btnOKClick(Sender: TObject);
    procedure FrameClick(Sender: TObject);
    procedure tmrSyncMemoHeightTimer(Sender: TObject);
    procedure FrameContext1Show(Sender: TObject);
    procedure FrameContext1Hide(Sender: TObject);
  private
    //当前需要处理的控件
    function GetCurrentPorcessControl(AFocusedControl:TControl):TControl;
    //虚拟键盘放在哪里
    function GetVirtualKeyboardControlParent:TControl;
    //获取虚拟键盘的高度校正
    function GetVirtualKeyboardHeightAdjustHeight:Double;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;


var
  GlobalInputFrame:TFrameInput;


implementation

{$R *.fmx}

procedure TFrameInput.btnOKClick(Sender: TObject);
begin
  HideFrame;//(Self,hfcttNone,ufsefNone);
  ReturnFrame;//(Self);
end;

constructor TFrameInput.Create(AOwner: TComponent);
begin
  inherited;
  Self.pnlInput.Height:=Const_DefaultPanelHeight;

  //设置主题颜色
  Self.memMsgInput.SelfOwnMaterial.BackColor.BorderColor.Color:=SkinThemeColor;
  Self.btnOK.SelfOwnMaterial.BackColor.FillColor.Color:=SkinThemeColor;

  RecordSubControlsLang(Self);
  TranslateSubControlsLang(Self);
end;

procedure TFrameInput.FrameClick(Sender: TObject);
begin
  HideFrame;//(Self,hfcttNone,ufsefNone);
end;

procedure TFrameInput.FrameContext1Hide(Sender: TObject);
begin
  Self.tmrSyncMemoHeight.Enabled:=False;
  //显示虚拟键盘的工具栏
  SetVirtualKeyboardToolBarEnabled(True);
end;

procedure TFrameInput.FrameContext1Show(Sender: TObject);
begin
  Self.memMsgInput.SetFocus;


  Self.tmrSyncMemoHeight.Enabled:=True;
  //隐藏虚拟键盘的工具栏
  SetVirtualKeyboardToolBarEnabled(False);
end;

function TFrameInput.GetCurrentPorcessControl(AFocusedControl: TControl): TControl;
begin
  Result:=AFocusedControl;
end;

function TFrameInput.GetVirtualKeyboardControlParent: TControl;
begin
  Result:=Self;
end;

function TFrameInput.GetVirtualKeyboardHeightAdjustHeight: Double;
begin
  Result:=0;
end;

procedure TFrameInput.tmrSyncMemoHeightTimer(Sender: TObject);
var
  I:Integer;
  ARect:TRectF;
  ALineCount:Integer;
  ATotalLine:Integer;
  ASingleLineHeight:Double;
begin


  ATotalLine:=0;
  ASingleLineHeight:=25;
  for I := 0 to memMsgInput.Lines.Count-1 do
  begin
    if Trim(memMsgInput.Lines[I])<>'' then
    begin
      ARect:=RectF(0,0,
              memMsgInput.Width-5,
              memMsgInput.Height);
      //更新Memo的高度
      ASingleLineHeight:=Self.memMsgInput.Canvas.TextHeight(memMsgInput.Lines[I]);

      Self.memMsgInput.Canvas.Font.Assign(Self.memMsgInput.TextSettings.Font);
      Self.memMsgInput.Canvas.MeasureText(ARect,
                                          memMsgInput.Lines[I],
                                          True,
                                          [],
                                          memMsgInput.TextSettings.VertAlign);

      if ARect.Width<memMsgInput.Width-10 then
      begin
        //比控件窄,那么只有一行
        ALineCount:=1;
      end
      else
      begin
        ALineCount:=Ceil(ARect.Height/ASingleLineHeight);
      end;

      //判断行数
      ATotalLine:=ATotalLine+ALineCount;
    end
    else
    begin
      ATotalLine:=ATotalLine+1;
    end;
  end;

  if ATotalLine=0 then
  begin
    ATotalLine:=1;
  end;

//  OutputDebugString('行数为'+IntToStr(ATotalLine));

  if ATotalLine=1 then
  begin
    Self.pnlInput.Height:=Const_DefaultPanelHeight;
  end
  else if ATotalLine<=Const_MaxMemoLineCount then
  begin
    //默认
    Self.pnlInput.Height:=ATotalLine*(ASingleLineHeight+3)
                  +memMsgInput.Margins.Top+memMsgInput.Margins.Bottom;
  end
  else
  begin
    //最大
    Self.pnlInput.Height:=3*Const_MemoLineHeight
                  +memMsgInput.Margins.Top+memMsgInput.Margins.Bottom;
  end;

  Self.btnOK.Enabled:=Trim(Self.memMsgInput.Text)<>'';
end;

end.
