//convert pas to utf8 by ¥

unit MessageBoxFrame_VCL;

interface
{$I FrameWork.inc}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
//  VCL.Types,
  VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, VCL.StdCtrls,
  uSkinWindowsControl,
//  uSkinWindowsPanel,
//  uSkinWindowsLabel,

  uVersion,
//  uUIFunction,
//  uFrameContext,
  uBaseList,
  uLang,
  uFuncCommon,
  uGraphicCommon,

  uDrawRectParam,
  uSkinCommonFrames,
  uSkinWindowsEdit,
  uSkinWindowsMemo,
  EasyServiceCommonMaterialDataMoudle_VCL,
//  uProcessNativeControlModalShowPanel,


  Math,
  uComponentType,
  uSkinBufferBitmap,
  uSkinLabelType,
  uDrawTextParam,
  FrameParentForm_VCL,
//  uUIFunction,
//  uSkinWindowsButton,
//  VCL.Objects,
  uSkinMaterial, uSkinButtonType,
  uBaseSkinControl, uSkinPanelType;//, VCL.Controls.Presentation, VCL.Edit;





const
  OK_CANCEL_CAPTIONS:array [0..1] of String=('取消','确定');
  OK_CANCEL_NAMES:array [0..1] of String=('cancel','ok');


type
//  TCanModalResultEvent=procedure(Sender:TObject;
//                                  var AIsCanModalResult:Boolean) of object;


  TFrameMessageBox = class(TFrame)//,
//                          IFrameVirtualKeyboardAutoProcessEvent)
    pnlMessageBox: TSkinWinPanel;
    pnlTop: TSkinWinPanel;
    lblType: TSkinWinLabel;
    pnlContent: TSkinWinPanel;
    lblCaption: TSkinWinLabel;
    lblMsg: TSkinWinLabel;
    pnlBottom: TSkinWinPanel;
    btnButton1: TSkinWinButton;
    btnButton2: TSkinWinButton;
    pnlButtonDevide: TSkinWinPanel;
    pnlTopDevide: TSkinWinPanel;
    pnlBottomDevide: TSkinWinPanel;
    pnlInput1: TSkinWinPanel;
    btnDec1: TSkinWinButton;
    edtInput1: TSkinWinEdit;
    btnInc1: TSkinWinButton;
    pnlInput2: TSkinWinPanel;
    btnDec2: TSkinWinButton;
    edtInput2: TSkinWinEdit;
    btnInc2: TSkinWinButton;
    btnButton3: TSkinWinButton;
    procedure btnButton1Click(Sender: TObject);
    procedure btnButton2Click(Sender: TObject);
//    procedure tmrBringToFrontTimer(Sender: TObject);
    procedure btnDec1Click(Sender: TObject);
    procedure btnDec2Click(Sender: TObject);
    procedure btnInc1Click(Sender: TObject);
    procedure btnInc2Click(Sender: TObject);
    procedure btnButton3Click(Sender: TObject);
//  private
//    //当前需要处理的控件
//    function GetCurrentPorcessControl(AFocusedControl:TControl):TControl;
//    //虚拟键盘放在哪里
//    function GetVirtualKeyboardControlParent:TControl;
  private
    FCustomControl:TControl;


    //排列按钮
    procedure AlignButtons;
    procedure SyncButtonState;

    procedure ProcessButtonMaterial(AButton:TSkinWinButton;
                                    AIsDefault:Boolean//;
//                                    AIsTwoButton:Boolean
                                    );

    procedure ClickButtonIndex(Sender:TObject;AIndex:Integer);
    procedure DoModalResultEvent(AModalResult:String;AModalResultName:String;var AIsCanModalResult:Boolean);
    procedure DoParentFormClose(Sender:TObject; var Action: TCloseAction);
    { Private declarations }
  public
    IsUsed:Boolean;

    ButtonCaptions:TStringDynArray;
    ButtonNames:TStringDynArray;


    //选择的按钮标题
    ModalResult:String;
    ModalResultName:String;

    OnModalResult:TNotifyEvent;
    OnModalResultEx:TModalResultExEvent;
    OnCanModalResult: TCanModalResultEvent;
    OnModalResultExProc:TModalResultExProc;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    //显示对话框
    procedure ShowMessageBox(
                            //显示在哪个控件上,默认就应该是MainForm上即可
                            AParent:TFmxObject;
                            //标题
                            const AMsg:String;
                            //内容
                            const AOtherMsg: string;
                            //对话框类型,标题-提示、提醒、警告、报错
                            ADlgType: TMsgDlgType;
                            //按钮标题
                            AButtonCaptions:Array of String;
                            //确定事件,这个事件比较麻烦,没有ModalResult参数
                            AOnModalResult:TNotifyEvent=nil;
                            //显示自定义控件
                            ACustomControl:TControl=nil;
                            //自定义对话框类型
                            ACustomDlgType:String='';
                            //按钮的内部名字
                            AButtonNames:TStringDynArray=[];
                            //是否可以关闭对话框的事件
                            AOnCanModalResult: TCanModalResultEvent=nil;
                            //输入框的个数
                            AInputEditCount:Integer=0;
                            //确定事件,这个事件有ModalResult参数
                            AOnModalResultEx:TModalResultExEvent=nil;
                            AOnModalResultExProc:TModalResultExProc=nil
                            );
    //隐藏对话框
    procedure HideMessageBox;

    { Public declarations }
  end;


//  TMessageBoxEvent=class
//  public
//    procedure DoModalResult_ReturnFrame(AMessageBoxFrame:TObject);
//  end;



var
  //全局对话框
  GlobalMessageBoxFrame:TFrameMessageBox;
//  //全局对话框的事件
//  GlobalMessageBoxEvent:TMessageBoxEvent;
var
  //全局的按钮事件,用于全局对话框处理(比如网络断开,然后统一做处理)
  GlobalOnModalResult:TNotifyEvent;



//可以同时显示多个MessageBoxFrame
function ShowMessageBoxFrame(
                            //显示在哪个控件上
                            AParent:TFmxObject;
                            //标题
                            const AMsg:String;
                            //内容
                            const AOtherMsg: string;
                            //对话框类型-提示、提醒、警告、报错
                            ADlgType: TMsgDlgType;
                            //按钮标题
                            AButtonCaptions:Array of String;
                            //点击事件
                            AOnModalResult:TNotifyEvent=nil;
                            //显示自定义控件
                            ACustomControl:TControl=nil;
                            //自定义对话框类型
                            ACustomDlgType:String='';
                            //按钮的内部名称
                            AButtonNames:TStringDynArray=[];
                            //是否可以关闭对话框的事件
                            AOnCanModalResult: TCanModalResultEvent=nil;
                            //输入框的个数
                            AInputEditCount:Integer=0;
                            AOnModalResultEx:TModalResultExEvent=nil;
                            AOnModalResultExProc:TModalResultExProc=nil;
                            AIsShowModal:Boolean=True
                            ):TFrameMessageBox;
                            {$IF CompilerVersion>30.0}overload;{$ENDIF}


{$IF CompilerVersion>30.0}
//可以同时显示多个MessageBoxFrame
//仅提示
procedure ShowMessageBoxFrame(
                              //显示在哪个控件上
                              AParent:TFmxObject;
                              //标题
                              const AMsg:String;
                              const AOtherMsg: string='';
                              AOnModalResult:TNotifyEvent=nil;
                              AIsShowModal:Boolean=True);overload;
{$ENDIF}


////启用MessageBox的最前显示
//procedure EnableMessageBoxFrameTopMost;
////禁用MessageBox的最前显示,因为别的Frame要在最前了
//procedure DisableMessageBoxFrameTopMost;


implementation


{$R *.dfm}

//procedure EnableMessageBoxFrameTopMost;
//begin
//  if (GlobalMessageBoxFrame<>nil)
//    and (GlobalMessageBoxFrame.Visible) then
//  begin
//    GlobalMessageBoxFrame.tmrBringToFront.Enabled:=True;
//    GlobalMessageBoxFrame.BringToFront;
//  end;
//end;
//
//procedure DisableMessageBoxFrameTopMost;
//begin
//  if (GlobalMessageBoxFrame<>nil)
//    and (GlobalMessageBoxFrame.Visible) then
//  begin
//    GlobalMessageBoxFrame.tmrBringToFront.Enabled:=False;
//    GlobalMessageBoxFrame.SendToBack;
//  end;
//end;

function DoShowMessageBoxForCommonFrame(Sender:TObject;
                                          ASkinMessageBox:TSkinMessageBox):TFrame;
var
  AButtonNames:TStringDynArray;
  AButtonCaptions:TStringDynArray;
begin
  Result:=nil;

  AButtonCaptions:=GetStringArray(ASkinMessageBox.ButtonCaptions);
  AButtonNames:=GetStringArray(ASkinMessageBox.ButtonNames);

  Result:=ShowMessageBoxFrame(
              TFmxObject(ASkinMessageBox.Owner),
              ASkinMessageBox.Msg,
              ASkinMessageBox.OtherMsg,
              ASkinMessageBox.DlgType,
              AButtonCaptions,
              ASkinMessageBox.OnModalResult,
              ASkinMessageBox.CustomControl,
              ASkinMessageBox.CustomDlgType,
              AButtonNames,
              ASkinMessageBox.OnCanModalResult,
              ASkinMessageBox.InputEditCount,
              ASkinMessageBox.OnModalResultEx
              );

end;

function DoShowSimpleMessageBoxForCommonFrame(AParent:TFmxObject;AMsg:String;AOtherMsg:String):TFrame;
begin
  Result:=nil;

  Result:=ShowMessageBoxFrame(
              AParent,
              AMsg,
              AOtherMsg,
              TMsgDlgType.mtInformation,
              [Trans('确定')],
              nil,
              nil,
              '',
              ConvertToStringDynArray(['ok']),
              nil
              );
end;



{$IF CompilerVersion>30.0}
procedure ShowMessageBoxFrame(//显示在哪个控件上
                      AParent:TFmxObject;
                      //标题
                      const AMsg:String;
                      const AOtherMsg: string;
                      AOnModalResult:TNotifyEvent;
                      AIsShowModal:Boolean);overload;
begin
  ShowMessageBoxFrame(AParent,
                      AMsg,
                      AOtherMsg,
                      TMsgDlgType.mtInformation,
                      [Trans('确定')],
                      AOnModalResult

                      );
end;
{$ENDIF}

function ShowMessageBoxFrame(AParent:TFmxObject;
                              const AMsg:String;
                              const AOtherMsg: string;
                              ADlgType: TMsgDlgType;
                              AButtonCaptions:Array of String;
                              AOnModalResult:TNotifyEvent;
                              ACustomControl:TControl;
                              ACustomDlgType:String;
                              AButtonNames:TStringDynArray;
                              AOnCanModalResult: TCanModalResultEvent;
                              AInputEditCount:Integer;
                              AOnModalResultEx:TModalResultExEvent;
                              AOnModalResultExProc:TModalResultExProc;
                              AIsShowModal:Boolean
                              ):TFrameMessageBox;overload;
var
  I: Integer;
//  AFrameFormMap:TFrameFormMap;
  AfrmFrameParent:TfrmFrameParent;
begin
  Result:=nil;


//  //获取可以利用的(没有显示的)MessageBoxFrame
//  //相当于池,不用重复创建
//  Result:=nil;
//  for I := 0 to GlobalTopMostFrameList.Count-1 do
//  begin
//    if (GlobalTopMostFrameList[I] is TFrameMessageBox)
//      and (Not TFrameMessageBox(GlobalTopMostFrameList[I]).IsUsed) then
//    begin
//      Result:=TFrameMessageBox(GlobalTopMostFrameList[I]);
//      Break;
//    end;
//  end;



  //如果没有可以利用的对话框,那么创建一个
  if Result=nil then
  begin
    Result:=TFrameMessageBox.Create(Application);
    //设置唯一名字,不然会报错的
    SetFrameName(Result);
  end;



  //显示对话框
  Result.ShowMessageBox(
                        nil,
                        AMsg,
                        AOtherMsg,
                        ADlgType,
                        AButtonCaptions,
                        AOnModalResult,
                        ACustomControl,
                        ACustomDlgType,
                        AButtonNames,
                        AOnCanModalResult,
                        AInputEditCount,
                        AOnModalResultEx,
                        AOnModalResultExProc);
  Result.Height:=Result.pnlMessageBox.Height;


  AfrmFrameParent:=TfrmFrameParent.Create(Application);
  Result.Parent:=AfrmFrameParent;
  AfrmFrameParent.Position:=TPosition.poMainFormCenter;  //TPosition.poScreenCenter;
  AfrmFrameParent.Caption:=Result.lblType.Caption;
  AfrmFrameParent.BorderStyle:=bsSingle;
  AfrmFrameParent.BorderIcons:=[TBorderIcon.biSystemMenu];//,TBorderIcon.biMinimize];
  AfrmFrameParent.ClientWidth:=//ScreenScaleSizeInt
                              (Result.Width);
//  AfrmFrameParent.ClientHeight:=ScreenScaleSizeInt(ToFrame.Height);
  AfrmFrameParent.ClientHeight:=Result.pnlMessageBox.Height;
  AfrmFrameParent.OnClose:=Result.DoParentFormClose;
  
  if AIsShowModal then
  begin 
    AfrmFrameParent.ShowModal
  end
  else
  begin
    AfrmFrameParent.Show;//Modal
  end;

//  ShowFrame(TFrame(Result),TFrameMessageBox);
//  AFrameFormMap:=GlobalFrameFormMapList.FindByFrame(Result);
//  if AFrameFormMap<>nil then
//  begin
//    Result.Parent:=AFrameFormMap.FForm;
//    //正常关闭，表示取消
//    AFrameFormMap.FOnClose:=Result.DoParentFormClose;
//    AFrameFormMap.FForm.Caption:=Result.lblType.Caption;
//    AFrameFormMap.FForm.BorderStyle:=bsSingle;
//    AFrameFormMap.FForm.BorderIcons:=[TBorderIcon.biSystemMenu];//,TBorderIcon.biMinimize];
//    AFrameFormMap.FForm.ClientHeight:=Result.pnlMessageBox.Height;
//  end;

  GlobalMessageBoxFrame:=Result;
end;






{ TFrameMessageBox }

procedure TFrameMessageBox.AlignButtons;
begin
  if btnButton1.Visible and Not btnButton2.Visible and Not btnButton3.Visible then
  begin
//    Self.btnButton1.Width:=Self.pnlMessageBox.Width-2*btnButton1.Margins.Left;
    Self.btnButton1.Align:=alNone;
    Self.btnButton1.Left:=(Self.pnlMessageBox.Width-Self.btnButton1.Width) div 2;
  end
//  else if btnButton1.Visible and btnButton2.Visible and Not btnButton3.Visible then
//  begin
//    Self.btnButton1.Width:=(Self.pnlMessageBox.Width-Self.pnlButtonDevide.Width-2*2*btnButton1.Margins.Left) div 2;
//    Self.btnButton2.Width:=(Self.pnlMessageBox.Width-Self.pnlButtonDevide.Width-2*2*btnButton1.Margins.Left) div 2+1;
//  end
//  else
//  begin
//    Self.btnButton1.Width:=(Self.pnlMessageBox.Width-Self.pnlButtonDevide.Width-3*2*btnButton1.Margins.Left) div 3;
//    Self.btnButton2.Width:=(Self.pnlMessageBox.Width-Self.pnlButtonDevide.Width-3*2*btnButton1.Margins.Left) div 3+1;
//    Self.btnButton3.Width:=(Self.pnlMessageBox.Width-Self.pnlButtonDevide.Width-3*2*btnButton1.Margins.Left) div 3+1;
//  end;
//  Self.pnlButtonDevide.Left:=Self.btnButton1.Left+Self.btnButton1.Width;
end;

procedure TFrameMessageBox.btnButton1Click(Sender: TObject);
//var
//  AIsCanModalResult:Boolean;
begin
  //左按钮
  ClickButtonIndex(Sender,0);

//  ModalResult:=Self.btnButton1.Caption;
//  if Length(ButtonCaptions)>0 then
//  begin
//    ModalResult:=ButtonCaptions[0];
//  end;
//  if Length(ButtonNames)>0 then
//  begin
//    ModalResultName:=ButtonNames[0];
//  end;
//
//
//  //加个事件,是否能关闭MessageBox
//  AIsCanModalResult:=True;
//  if Assigned(OnCanModalResult) then
//  begin
//    OnCanModalResult(Self,ModalResult,ModalResultName,AIsCanModalResult);
//  end;
//
//
//
//  if AIsCanModalResult then
//  begin
//      //可以关闭了
//      HideMessageBox;
//
//      if Assigned(OnModalResult) then
//      begin
//        OnModalResult(Self);
//      end;
//
//      if Assigned(OnModalResultEx) then
//      begin
//        OnModalResultEx(Self,ModalResult,ModalResultName,Self.edtInput1.Text,Self.edtInput2.Text);
//      end;
//      if Assigned(OnModalResultExProc) then
//      begin
//        OnModalResultExProc(Self,ModalResult,ModalResultName,Self.edtInput1.Text,Self.edtInput2.Text);
//      end;
//
//
//
//      if Assigned(GlobalOnModalResult) then
//      begin
//        GlobalOnModalResult(Self);
//      end;
//
//
//      ReturnFrame(Self);
//  end;
//
////  HideVirtualKeyboard;
end;

procedure TFrameMessageBox.btnButton2Click(Sender: TObject);
//var
//  AIsCanModalResult:Boolean;
begin
  ClickButtonIndex(Sender,1);
//  //右按钮
//
//  ModalResult:=Self.btnButton2.Caption;
//  if Length(ButtonCaptions)>1 then
//  begin
//    ModalResult:=ButtonCaptions[1];
//  end;
//  if Length(ButtonNames)>1 then
//  begin
//    ModalResultName:=ButtonNames[1];
//  end;
//
//
//  //加个事件,是否能关闭MessageBox
//  AIsCanModalResult:=True;
//  if Assigned(OnCanModalResult) then
//  begin
//    OnCanModalResult(Self,ModalResult,ModalResultName,AIsCanModalResult);
//  end;
//
//  if AIsCanModalResult then
//  begin
//      //可以关闭了
//      HideMessageBox;
//
//      if Assigned(OnModalResult) then
//      begin
//        OnModalResult(Self);
//      end;
//
//      if Assigned(OnModalResultEx) then
//      begin
//        OnModalResultEx(Self,ModalResult,ModalResultName,Self.edtInput1.Text,Self.edtInput2.Text);
//      end;
//
//
//      if Assigned(OnModalResultExProc) then
//      begin
//        OnModalResultExProc(Self,ModalResult,ModalResultName,Self.edtInput1.Text,Self.edtInput2.Text);
//      end;
//
//      if Assigned(GlobalOnModalResult) then
//      begin
//        GlobalOnModalResult(Self);
//      end;
//
//      ReturnFrame(Self);
//  end;
//
//
////  HideVirtualKeyboard;
end;

procedure TFrameMessageBox.btnButton3Click(Sender: TObject);
begin
  ClickButtonIndex(Sender,2);

end;

procedure TFrameMessageBox.btnDec1Click(Sender: TObject);
var
  ANumber:Double;
begin
  //减一
  ANumber:=0;
  if TryStrToFloat(Self.edtInput1.Text,ANumber)
    and (ANumber>=1) then
  begin
    ANumber:=ANumber-1;
    Self.edtInput1.Text:=FloatToStr(ANumber);
  end;
  SyncButtonState;
end;

procedure TFrameMessageBox.btnDec2Click(Sender: TObject);
var
  ANumber:Double;
begin
  //减一
  ANumber:=0;
  if TryStrToFloat(Self.edtInput2.Text,ANumber)
    and (ANumber>=1) then
  begin
    ANumber:=ANumber-1;
    Self.edtInput2.Text:=FloatToStr(ANumber);
  end;
  SyncButtonState;
end;

procedure TFrameMessageBox.btnInc1Click(Sender: TObject);
var
  ANumber:Double;
begin
  //加一
  ANumber:=0;
  if TryStrToFloat(Self.edtInput1.Text,ANumber) then
  begin
  end;
  ANumber:=ANumber+1;
  Self.edtInput1.Text:=FloatToStr(ANumber);
  SyncButtonState;

end;

procedure TFrameMessageBox.btnInc2Click(Sender: TObject);
var
  ANumber:Double;
begin
  //加一
  ANumber:=0;
  if TryStrToFloat(Self.edtInput2.Text,ANumber) then
  begin
  end;
  ANumber:=ANumber+1;
  Self.edtInput2.Text:=FloatToStr(ANumber);
  SyncButtonState;

end;

procedure TFrameMessageBox.ClickButtonIndex(Sender:TObject;AIndex: Integer);
var
  AIsCanModalResult:Boolean;
begin
  //右按钮

  ModalResult:=TSkinButton(Sender).Caption;
  if Length(ButtonCaptions)>AIndex then
  begin
    ModalResult:=ButtonCaptions[AIndex];
  end;
  if Length(ButtonNames)>AIndex then
  begin
    ModalResultName:=ButtonNames[AIndex];
  end;


  //加个事件,是否能关闭MessageBox
  DoModalResultEvent(ModalResult,ModalResultName,AIsCanModalResult);

  if AIsCanModalResult then
  begin
      //可以关闭了
      //可以关闭了
      HideMessageBox;

//      ReturnFrame(Self);
  end;


//  HideVirtualKeyboard;

end;

constructor TFrameMessageBox.Create(AOwner: TComponent);
begin
  inherited;

  //设置主题颜色
  lblType.SelfOwnMaterialToDefault.DrawCaptionParam.DrawFont.Color:=SkinThemeColor;
//  Self.btnButtonMaterial.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Color:=SkinThemeColor;
  pnlTopDevide.SelfOwnMaterialToDefault.BackColor.FillColor.Color:=SkinThemeColor;


  Self.btnButton1.Material.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Color:=SkinThemeColor;
  Self.btnButton2.Material.BackColor.DrawEffectSetting.MouseDownEffect.FillColor.Color:=SkinThemeColor;





//  //翻译
//  RecordSubControlsLang(Self);
//  TranslateSubControlsLang(Self);
end;

destructor TFrameMessageBox.Destroy;
begin

  inherited;
end;

procedure TFrameMessageBox.DoModalResultEvent(AModalResult,
  AModalResultName: String;var AIsCanModalResult:Boolean);
begin

  //加个事件,是否能关闭MessageBox
  AIsCanModalResult:=True;
  if Assigned(OnCanModalResult) then
  begin
    OnCanModalResult(Self,ModalResult,ModalResultName,AIsCanModalResult);
  end;

  if AIsCanModalResult then
  begin

      if Assigned(OnModalResult) then
      begin
        OnModalResult(Self);
      end;

      if Assigned(OnModalResultEx) then
      begin
        OnModalResultEx(Self,ModalResult,ModalResultName,Self.edtInput1.Text,Self.edtInput2.Text);
      end;


      if Assigned(OnModalResultExProc) then
      begin
        OnModalResultExProc(Self,ModalResult,ModalResultName,Self.edtInput1.Text,Self.edtInput2.Text);
      end;

      if Assigned(GlobalOnModalResult) then
      begin
        GlobalOnModalResult(Self);
      end;

  end;

end;

procedure TFrameMessageBox.DoParentFormClose(Sender: TObject; var Action: TCloseAction);
var
  AIsCanModalResult:Boolean;
begin
  if Self.ModalResult='' then
  begin
    ModalResult:='取消';
    ModalResultName:='cancel';
    Self.DoModalResultEvent(ModalResult,ModalResultName,AIsCanModalResult);
  end;
end;

//function TFrameMessageBox.GetCurrentPorcessControl(AFocusedControl: TControl): TControl;
//begin
//  Result:=AFocusedControl;
//end;
//
//function TFrameMessageBox.GetVirtualKeyboardControlParent: TControl;
//begin
//  Result:=Self;
//end;

procedure TFrameMessageBox.HideMessageBox;
//var
//  I:Integer;
begin
//  tmrBringToFront.Enabled:=False;
//  Self.SendToBack;


//  //唤醒上一次MessageBox在最前显示,不然前面一个显示不出来了
//  for I := GlobalTopMostFrameList.Count-1 downto 0 do
//  begin
//    if (GlobalTopMostFrameList[I] is TFrameMessageBox)
//      and TFrameMessageBox(GlobalTopMostFrameList[I]).Visible
//      and (GlobalTopMostFrameList[I]<>Self) then
//    begin
//      TFrameMessageBox(GlobalTopMostFrameList[I]).tmrBringToFront.Enabled:=True;
//      TFrameMessageBox(GlobalTopMostFrameList[I]).BringToFront;
//    end;
//  end;
//  if GlobalTopMostFrameList<>nil then
//  begin
//    GlobalTopMostFrameList.Remove(Self,False);
//  end;


  IsUsed:=False;



  //隐藏自定义控件
  if FCustomControl<>nil then
  begin
    FCustomControl.Parent:=nil;
    FCustomControl.Visible:=False;
    FCustomControl:=nil;
  end;



//  //隐藏自已
//  Self.Parent:=nil;
//  Self.Visible:=False;
//  HideFrame(Self,hfcttBeforeReturnFrame,ufsefAlpha);
  GetParentForm(Self).Close;


//  //一定要放在隐藏WaitingFrame的后面
//  //还原所有的Edit的ControlType为Platform
//  RestoreGlobalEditListAsPlatformType;
//  RestoreGlobalMemoListAsPlatformType;
//  //先隐藏WaitingFrame,再还原,免得WaitingFrame被盖住
//  ProcessNativeControlEndModalShow;
end;

procedure TFrameMessageBox.ProcessButtonMaterial(AButton: TSkinWinButton;
                                    AIsDefault:Boolean//;
//                                    AIsTwoButton:Boolean
                                    );
begin
  if AIsDefault then
  begin
//      if AIsTwoButton then
//      begin
//        //在右边的
//        AButton.Material.BackColor.RectCorners:=[rcBottomRight];
//      end
//      else
//      begin
//        AButton.Material.BackColor.RectCorners:=[rcBottomLeft,rcBottomRight];
//      end;


      AButton.Material.BackColor.FillColor.Color:=SkinThemeColor;
      AButton.Material.BackColor.FillColor.Alpha:=180;

      AButton.Material.DrawCaptionParam.FontColor:=TAlphaColorRec.White;
  end
  else
  begin
//      if AIsTwoButton then
//      begin
//        //在左边的
//        AButton.Material.BackColor.RectCorners:=[rcBottomLeft];
//      end
//      else
//      begin
//        AButton.Material.BackColor.RectCorners:=[rcBottomLeft,rcBottomRight];
//      end;


      AButton.Material.BackColor.FillColor.Color:=TAlphaColorRec.White;
      AButton.Material.BackColor.FillColor.Alpha:=150;

      AButton.Material.DrawCaptionParam.FontColor:=TAlphaColorRec.Black;

  end;
end;

procedure TFrameMessageBox.ShowMessageBox(AParent:TFmxObject;
                                          const AMsg:String;
                                          const AOtherMsg: string;
                                          ADlgType: TMsgDlgType;
                                          AButtonCaptions:Array of String;
                                          AOnModalResult:TNotifyEvent;
                                          ACustomControl:TControl;
                                          ACustomDlgType:String;
                                          AButtonNames:TStringDynArray;
                                          AOnCanModalResult: TCanModalResultEvent;
                                          AInputEditCount:Integer;
                                          AOnModalResultEx:TModalResultExEvent;
                                          AOnModalResultExProc:TModalResultExProc
                                          );
var
  I:Integer;
//  AIsFindSuitParent:Boolean;
//  ASuitParent:TFmxObject;
//  AParentForm:TForm;
  AMessageBoxHeight:TControlSize;
  AMessageBoxFrame:TFrame;
begin



//  //取消在最前显示的MessageBoxFrame,不然会挡住现在这个MessageBoxFrame
//  for I := 0 to GlobalTopMostFrameList.Count-1 do
//  begin
//    if (GlobalTopMostFrameList[I] is TFrameMessageBox)
//      and TFrameMessageBox(GlobalTopMostFrameList[I]).Visible
//      and (GlobalTopMostFrameList[I]<>Self) then
//    begin
//      TFrameMessageBox(GlobalTopMostFrameList[I]).tmrBringToFront.Enabled:=False;
//      TFrameMessageBox(GlobalTopMostFrameList[I]).SendToBack;
//    end;
//  end;

//  if (GlobalTopMostFrameList<>nil) and (GlobalTopMostFrameList.IndexOf(Self)=-1) then
//  begin
//    GlobalTopMostFrameList.Add(Self);
//  end;

  IsUsed:=True;

  //在OrangeUI控件中调用的时候,传入nil,默认是主窗体
  if AParent=nil then
  begin
      //用主Form
      //AParent:=Application.MainForm;
  end
  else
  begin
      if GetReleatedForm(AParent)<>nil then
      begin
        //用AParent所在的Form
        AParent:=GetReleatedForm(AParent);
      end
      else
      begin
        //还是用原来的AParent
      end;

//      //有可能是Frame中的子Frame,
//      //显示MessageBoxFrame的时候,位置会不对,而且蒙板盖不全,很丑
//      if AParent is TFrame then
//      begin
//          //找到Frame的窗体,到时候如果找不到,就用Form
//          AParentForm:=GetReleatedForm(AParent);
//
//          if AParentForm<>nil then
//          begin
//              //找到Parent中最合适的Frame,
//              //有时候Frame是显示在Frame中的,
//              //或者PageControl中的
//              AIsFindSuitParent:=False;
//              ASuitParent:=AParent;
//              while (ASuitParent is TControl) and (ASuitParent<>nil) do
//              begin
//                //和窗体的高度
//                if (ASuitParent is TFrame) and (TControl(ASuitParent).Height=AParentForm.ClientHeight) then
//                begin
//                  AIsFindSuitParent:=True;
//                  Break;
//                end
//                else
//                begin
//                  ASuitParent:=TControl(ASuitParent).Parent;
//                end;
//              end;
//              if AIsFindSuitParent then
//              begin
//                AParent:=ASuitParent;
//              end;
//          end;
//      end
//      else if AParent is TForm then
//      begin
//
//      end;
  end;







//  //先隐藏原生控件
//  //设置Edit的ControlType,避免MessageBoxFrame被原生控件挡住
//  SetGlobalEditListAsStyleType;
//  SetGlobalMemoListAsStyleType;
//  ProcessNativeControlBeginModalShow;


  ModalResult:='';
  ModalResultName:='';
  ButtonCaptions:=ConvertToStringDynArray(AButtonCaptions);
  ButtonNames:=AButtonNames;


  //pnlMessageBox自动居中,最大宽度320
  Self.Parent:=AParent;


  Self.OnModalResult:=AOnModalResult;
  Self.OnModalResultEx:=AOnModalResultEx;
  //是否可以返回
  Self.OnCanModalResult:=AOnCanModalResult;
  //匿名回调函数
  OnModalResultExProc:=AOnModalResultExProc;



  //对话框类型
  Self.lblType.Caption:=ACustomDlgType;
  if ACustomDlgType='' then
  begin
      case ADlgType of
        TMsgDlgType.mtWarning: Self.lblType.Caption:=Trans('警告');
        TMsgDlgType.mtError: Self.lblType.Caption:=Trans('报错');
        TMsgDlgType.mtInformation: Self.lblType.Caption:=Trans('提示');
        TMsgDlgType.mtConfirmation: Self.lblType.Caption:=Trans('确认');
        TMsgDlgType.mtCustom:
        begin
          Self.lblType.Caption:=ACustomDlgType;
        end;
      end;
  end;
  if AParent is TForm then
  begin
    TForm(AParent).Caption:=Self.lblType.Caption;
  end;




  //主要内容
  Self.lblCaption.Caption:=AMsg;
  if Pos(#13#10,AMsg)>0 then
  begin
    //主要内容是多行
    TSkinLabelDefaultMaterial(Self.lblCaption.SelfOwnMaterial).DrawCaptionParam.FontHorzAlign:=TFontHorzAlign.fhaLeft;
  end
  else
  begin
    //主要内容是单行
    TSkinLabelDefaultMaterial(Self.lblCaption.SelfOwnMaterial).DrawCaptionParam.FontHorzAlign:=TFontHorzAlign.fhaCenter;
  end;



  //其他次要信息
  Self.lblMsg.Caption:=AOtherMsg;
  TSkinLabelDefaultMaterial(Self.lblMsg.SelfOwnMaterial).DrawCaptionParam.FontHorzAlign:=TFontHorzAlign.fhaCenter;



  //自定义控件
  if ACustomControl<>nil then
  begin
    ACustomControl.Parent:=Self.pnlContent;
    ACustomControl.Visible:=True;
  end;
  FCustomControl:=ACustomControl;



  //主要内容是否显示
  Self.lblCaption.Visible:=(AMsg<>'');

  //其他次要信息是否显示
  Self.lblMsg.Visible:=(AOtherMsg<>'');



  AMessageBoxHeight:=//Self.pnlTop.HeightInt+
                      Self.pnlBottom.Height;



  //计算主要内容的高度
  if (AMsg<>'') then
  begin
      Self.lblCaption.Height:=ControlSize(GetStringHeight(AMsg,
                                          RectF(0,0,Self.lblCaption.WidthInt,1000),
                                          TSkinLabelDefaultMaterial(Self.lblCaption.SelfOwnMaterial).DrawCaptionParam));//+20;

      if (AOtherMsg='') and (ACustomControl=nil) then
      begin
        //加上两行
        Self.lblCaption.Height:=Self.lblCaption.Height+40;
      end
      else
      begin
        Self.lblCaption.Height:=Self.lblCaption.Height+20;
      end;

      AMessageBoxHeight:=AMessageBoxHeight+Self.lblCaption.Height;
  end;



  //计算其他次要内容的高度
  if (AOtherMsg<>'') then
  begin
//    Self.lblMsg.Height:=GetStringHeight(AOtherMsg,
//                        RectF(Self.lblMsg.Material.DrawCaptionParam.DrawRectSetting.Left,
//                              Self.lblMsg.Material.DrawCaptionParam.DrawRectSetting.Top,
//                              Self.lblMsg.WidthInt-Self.lblMsg.Material.DrawCaptionParam.DrawRectSetting.Left*2,
//                              1000),
//                        Self.lblMsg.SelfOwnMaterialToDefault.DrawCaptionParam)
//                        +Self.lblMsg.Material.DrawCaptionParam.DrawRectSetting.Bottom
//                        +20;
    Self.lblMsg.Height:=ControlSize(GetStringHeight(AOtherMsg,
                                                    RectF(0,0,Self.lblMsg.WidthInt,1000),
                                                    Self.lblMsg.SelfOwnMaterialToDefault.DrawCaptionParam))+20;
    AMessageBoxHeight:=AMessageBoxHeight+Self.lblMsg.Height;
  end;


  //计算自定义控件的高度
  if (ACustomControl<>nil) then
  begin
    AMessageBoxHeight:=AMessageBoxHeight+ACustomControl.Height;
    {$IFDEF FMX}
    ACustomControl.Align:=TAlignLayout.{$IF CompilerVersion >= 35.0}Top{$ELSE}alTop{$IFEND};
    {$ENDIF}
    {$IFDEF VCL}
    ACustomControl.Align:=alTop;
    {$ENDIF}
  end;


  //两个输入框
  Self.pnlInput1.Visible:=(AInputEditCount>0);
  Self.pnlInput2.Visible:=(AInputEditCount>1);
  if Self.pnlInput1.Visible then
  begin
    AMessageBoxHeight:=AMessageBoxHeight+pnlInput1.Height;
  end;
  if Self.pnlInput2.Visible then
  begin
    AMessageBoxHeight:=AMessageBoxHeight+pnlInput2.Height;
    Self.pnlInput1.Material.BackColor.BorderWidth:=1;
  end
  else
  begin
    Self.pnlInput1.Material.BackColor.BorderWidth:=0;
  end;


  if AMessageBoxHeight>Height-40 then
  begin
    AMessageBoxHeight:=Height-40;
  end;
  Self.pnlMessageBox.Height:=AMessageBoxHeight;




  //判断按钮的个数
  if Length(AButtonCaptions)=1 then
  begin
    Self.btnButton1.Visible:=True;
    Self.btnButton1.Caption:=AButtonCaptions[0];
    //默认操作素材,高亮
    ProcessButtonMaterial(btnButton1,True);
    btnButton1.Material.BackColor.RectCorners:=[rcBottomLeft,rcBottomRight];



    Self.btnButton2.Visible:=False;

    Self.pnlButtonDevide.Visible:=False;
  end;
  if Length(AButtonCaptions)=2 then
  begin
    //左边的按钮
    Self.btnButton1.Visible:=True;
    Self.btnButton1.Caption:=AButtonCaptions[0];
    //默认操作素材,高亮
    ProcessButtonMaterial(btnButton1,False);
    btnButton1.Material.BackColor.RectCorners:=[rcBottomLeft];


    //右边的按钮
    Self.btnButton2.Visible:=True;
    Self.btnButton2.Caption:=AButtonCaptions[1];
    ProcessButtonMaterial(btnButton2,(Self.btnButton2.Caption<>Trans('取消')));
    btnButton2.Material.BackColor.RectCorners:=[rcBottomRight];


    Self.pnlButtonDevide.Visible:=True;

  end;

  if Length(AButtonCaptions)=3 then
  begin
    //左边的按钮
    Self.btnButton1.Visible:=True;
    Self.btnButton1.Caption:=AButtonCaptions[0];
    //默认操作素材,高亮
    ProcessButtonMaterial(btnButton1,False);
    btnButton1.Material.BackColor.RectCorners:=[rcBottomLeft];


    //右边的按钮
    Self.btnButton2.Visible:=True;
    Self.btnButton2.Caption:=AButtonCaptions[1];
    ProcessButtonMaterial(btnButton2,(Self.btnButton2.Caption<>Trans('取消')));
    btnButton2.Material.BackColor.RectCorners:=[rcBottomRight];


    //右边的按钮
    Self.btnButton3.Visible:=True;
    Self.btnButton3.Caption:=AButtonCaptions[2];
    ProcessButtonMaterial(btnButton3,(Self.btnButton3.Caption<>Trans('取消')));
    btnButton3.Material.BackColor.RectCorners:=[rcBottomRight];


    Self.pnlButtonDevide.Visible:=True;

  end;



  AlignButtons;




//  tmrBringToFront.Enabled:=True;
//  tmrBringToFrontTimer(nil);
//  Self.Opacity:=0;
//  //显示到最前
//  Self.BringToFront;


  //显示对话框
  Self.Visible:=True;
  AMessageBoxFrame:=Self;
//  ShowFrame(TFrame(AMessageBoxFrame),TFrameMessageBox,AParent,nil,nil,nil,nil,False,True,ufsefAlpha,False,nil);


end;

procedure TFrameMessageBox.SyncButtonState;
var
  ANumber:Double;
  APrice:Double;
begin
  ANumber:=0;
  if TryStrToFloat(Self.edtInput1.Text,ANumber) then
  begin

  end;
  Self.btnDec1.Enabled:=ANumber>1;


  if TryStrToFloat(Self.edtInput2.Text,ANumber) then
  begin

  end;
  Self.btnDec2.Enabled:=ANumber>1;

end;

//procedure TFrameMessageBox.tmrBringToFrontTimer(Sender: TObject);
//begin
//  Self.SetBounds(0,0,GetControlParentWidth(Parent),GetControlParentHeight(Parent));
//  Self.BringToFront;
//end;





{ TMessageBoxEvent }

//procedure TMessageBoxEvent.DoModalResult_ReturnFrame(AMessageBoxFrame: TObject);
//begin
//  if (TFrameMessageBox(AMessageBoxFrame).ModalResult=Trans('确定'))
//    or (TFrameMessageBox(AMessageBoxFrame).ModalResult='ok')
//    or (TFrameMessageBox(AMessageBoxFrame).ModalResult='OK')
//     then
//  begin
//    //返回上一页
//    HideFrame();
//    ReturnFrame();
//  end;
//end;


initialization
  GlobalMessageBoxFrame:=nil;

  uSkinCommonFrames.GlobalDoShowMessageBox:=DoShowMessageBoxForCommonFrame;
  uSkinCommonFrames.GlobalDoShowSimpleMessageBox:=DoShowSimpleMessageBoxForCommonFrame;

//  GlobalMessageBoxEvent:=TMessageBoxEvent.Create;

finalization
//  FreeAndNil(GlobalMessageBoxEvent);

end.
