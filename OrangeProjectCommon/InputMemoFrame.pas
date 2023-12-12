//convert pas to utf8 by ¥

unit InputMemoFrame;

interface

uses
  System.SysUtils,uFuncCommon, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uSkinFireMonkeyButton, uSkinFireMonkeyControl, uSkinFireMonkeyPanel,

  uSkinMaterial,
  uSkinItems,
  uUIFunction,
  uDrawCanvas,
  uBaseList,
  HintFrame,
  uSkinListBoxType,
  uSkinFireMonkeyScrollControl, uSkinFireMonkeyListBox, uSkinFireMonkeyCheckBox,
  uSkinFireMonkeyLabel, uSkinFireMonkeyImage, uSkinFireMonkeyItemDesignerPanel, uSkinFireMonkeyRadioButton, FMX.Layouts, FMX.Memo, uSkinFireMonkeyMemo,
  FMX.Controls.Presentation, FMX.ScrollBox, uSkinButtonType, uBaseSkinControl,
  uSkinPanelType;

type
  TFrameInputMemo = class(TFrame)
    pnlToolBar: TSkinFMXPanel;
    btnOK: TSkinFMXButton;
    pnlClient: TSkinFMXPanel;
    pnlContent: TSkinFMXPanel;
    memContent: TSkinFMXMemo;
    btnReturn: TSkinFMXButton;
    procedure btnReturnClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
//    FrameHistroy:TFrameHistroy;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    function GetContent:String;
    procedure Init(ACaption:String;Prompt:String;Content:String);
    { Public declarations }
  end;



var
  GlobalInputTextFrame:TFrameInputMemo;

implementation

{$R *.fmx}

//uses
//  MainForm;



procedure TFrameInputMemo.btnOKClick(Sender: TObject);
begin
  if (Self.memContent.Text='') then
  begin
    ShowHintFrame(Self,'请'+Self.memContent.MemoProperties.HelpText);
    Exit;
  end;

  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(FrameHistroy);
end;

procedure TFrameInputMemo.btnReturnClick(Sender: TObject);
begin
  if GetFrameHistory(Self)<>nil then GetFrameHistory(Self).OnReturnFrame:=nil;
  HideFrame;//(Self,hfcttBeforeReturnFrame);
  ReturnFrame;//(FrameHistroy);
end;

constructor TFrameInputMemo.Create(AOwner: TComponent);
begin
  inherited;

  //设置主题颜色
  Self.pnlToolBar.SelfOwnMaterial.BackColor.FillColor.Color:=SkinThemeColor;
end;

destructor TFrameInputMemo.Destroy;
begin
  inherited;
end;

function TFrameInputMemo.GetContent: String;
begin
  Result:=Self.memContent.Text;
end;

procedure TFrameInputMemo.Init(ACaption: String;Prompt:String;Content:String);
begin
  Self.pnlToolBar.Caption:=ACaption;
  Self.memContent.MemoProperties.HelpText:=Prompt;

  Self.memContent.Text:=Content;
  Self.pnlContent.Top:=0;

end;

end.
