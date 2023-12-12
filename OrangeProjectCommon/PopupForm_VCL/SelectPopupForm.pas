unit SelectPopupForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  DB,
//  GdiElement,
  Graphics,
  uBaseLog,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  uSkinListViewType,
//  uManager,
  Buttons, uSkinWindowsForm;

type
  //选中一条记录的事件
  TOnSelectRecordEvent=procedure(Sender:TObject;ADataset:TDataset) of object;
//  TOnSelectRecordJsonEvent=procedure(Sender:TObject;ARecordJson:ISuperObject) of object;

  TfrmSelectPopupClass=class of TfrmSelectPopup;

  TfrmSelectPopup = class(TForm)
    fsdForm: TSkinWinForm;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    //用于过滤
    procedure DoFilter(AKeyword:String);virtual;
    //用于清理数据
    procedure DoClear;virtual;
    procedure CustomPopup;virtual;
  protected
    procedure CreateParams(var Params:TCreateParams);override;

  public
    //当前传进来的关键字
    FKeyWord:String;
    //选中了记录的事件
    OnSelectRecord: TOnSelectRecordEvent;



    //窗体是否已经弹出
    IsPopuped:Boolean;
    //隐藏窗体
    procedure HidePopup;

    //弹出窗体
    procedure Popup(APopupPoint:TPoint;
                    APopupFormWidth:Integer;
                    APopupFormHeight:Integer;
                    //-1表示当前
                    AParentFormHandle:Integer=0;
                    AShowFlag:Integer=SWP_NOACTIVATE or SWP_SHOWWINDOW);
    //弹出并过滤
    procedure PopupAndFilter(
                            AKeyWord:String;
                            APopupPoint:TPoint;
                            APopupFormWidth:Integer;
                            APopupFormHeight:Integer);
  end;


//  TfrmSelectListViewPopup=class(TfrmSelectPopup)
//  public
//    lvData:TSkinWinListView;
//    constructor Create(AOwner:TComponent);override;
//    destructor Destroy;override;
//  end;



function CreateSelectPopupForm(AOwnerForm:TForm;AfrmSelectPopupClass:TfrmSelectPopupClass):TfrmSelectPopup;
procedure InitSelectPopupForm(ASelectPopupForm:TfrmSelectPopup);



implementation

{$R *.dfm}

var
  MouseHook: HHOOK;
  CurrentPopupSelectPopupForm:TfrmSelectPopup;

function HookMouseProc(code: Integer; wparam: wparam; lparam: lparam): LRESULT;stdcall;
var
  Rect: TRect;
begin
  if (code = HC_ACTION) then
  begin
    case wparam of
      WM_LBUTTONDOWN, WM_MBUTTONDOWN, WM_RBUTTONDOWN, WM_NCLBUTTONDOWN,
        WM_NCMBUTTONDOWN, WM_NCRBUTTONDOWN:
        begin
          with PMouseHookStruct(lparam)^ do
          begin
            if (CurrentPopupSelectPopupForm<>nil)
              and GetWindowRect(CurrentPopupSelectPopupForm.Handle, Rect) then
            begin
              if Not PtInRect(Rect, pt) then
              begin
                CurrentPopupSelectPopupForm.HidePopup;
              end;
            end;
          end;
        end;
    end;
  end;
  Result:=CallNextHookEx(MouseHook, code, wparam, lparam);
end;

procedure HookMouse(AState: Boolean);
begin
  if AState then
  begin
    MouseHook:=SetWindowsHookEx(WH_MOUSE, @HookMouseProc, HInstance,Windows.GetCurrentThreadId);
  end
  else
  begin
    UnhookWindowsHookEx(MouseHook);
  end;
end;

function CreateSelectPopupForm(AOwnerForm:TForm;AfrmSelectPopupClass:TfrmSelectPopupClass):TfrmSelectPopup;//(WndParent:TForm);
begin
  Result:=AfrmSelectPopupClass.Create(AOwnerForm);
  InitSelectPopupForm(Result);
end;

procedure InitSelectPopupForm(ASelectPopupForm:TfrmSelectPopup);
var
  OldWidth,OldHeight:Integer;
begin
  OldWidth:=ASelectPopupForm.Width;
  OldHeight:=ASelectPopupForm.Height;
  ASelectPopupForm.SetBounds(0,0,0,0);
  ASelectPopupForm.Show;
  ASelectPopupForm.HidePopup;
  ASelectPopupForm.SetBounds(0,0,OldWidth,0);
end;

procedure HideSelectPopupForm(frmSelectPopup:TfrmSelectPopup);
begin
  if frmSelectPopup<>nil then
  begin
    frmSelectPopup.HidePopup;
  end;
end;

procedure TfrmSelectPopup.CreateParams(var Params: TCreateParams);
begin
  inherited;
  with Params do
  begin
//    if (Owner<>nil) and (Owner is TForm) then
//    begin
//      Params.WndParent:=TForm(Owner).Handle;
//    end;

//    Style:=WS_POPUP;
    ExStyle:=ExStyle or WS_EX_TOOLWINDOW;
  end;
end;

procedure TfrmSelectPopup.DoFilter(AKeyword: String);
begin

end;

procedure TfrmSelectPopup.CustomPopup;
begin

end;

procedure TfrmSelectPopup.DoClear;
begin

end;

procedure TfrmSelectPopup.FormCreate(Sender: TObject);
var
  OldWidth,OldHeight:Integer;
begin
  FKeyWord:='';

  Self.ImeMode:=imClose;

  OldWidth:=Self.Width;
  OldHeight:=Self.Height;
  Self.SetBounds(0,0,0,0);
  //不Show的话,里面的控件显示不出来
  Self.Show;
  Self.HidePopup;
  Self.SetBounds(0,0,OldWidth,0);

end;

procedure TfrmSelectPopup.FormDestroy(Sender: TObject);
begin
  if CurrentPopupSelectPopupForm=Self then
  begin
    CurrentPopupSelectPopupForm:=nil;
    HookMouse(False);
  end;
end;

procedure TfrmSelectPopup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //
end;

procedure TfrmSelectPopup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //
end;

procedure TfrmSelectPopup.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //
end;

procedure TfrmSelectPopup.HidePopup;
begin
  FKeyWord:='';

  //隐藏窗体
  ShowWindow(Self.Handle,SW_HIDE);

  IsPopuped:=False;

  if CurrentPopupSelectPopupForm=Self then
  begin
    CurrentPopupSelectPopupForm:=nil;
    HookMouse(False);
  end;

  //清空数据,避免下次显示窗体的时候还保留着上次的数据
  DoClear;

  DoHide;



end;

procedure TfrmSelectPopup.Popup(APopupPoint:TPoint;
                                  APopupFormWidth:Integer;
                                  APopupFormHeight:Integer;
                                  AParentFormHandle:Integer;
                                  AShowFlag:Integer);
begin

  if AParentFormHandle=-1 then
  begin
    AParentFormHandle:=Application.ActiveFormHandle;
  end;

  //弹出窗体
  SetWindowPos(Self.Handle,
                //HWND_TOPMOST,这个会把输入法挡住的
                ////AParentForm.Handle,//0,
                AParentFormHandle,
                APopupPoint.X,APopupPoint.Y,
                APopupFormWidth,APopupFormHeight,
                AShowFlag//SWP_NOACTIVATE or SWP_SHOWWINDOW// or SWP_NOZORDER
                );
  CurrentPopupSelectPopupForm:=Self;

  HookMouse(True);


  CustomPopup;

end;

procedure TfrmSelectPopup.PopupAndFilter(
                                    AKeyWord:String;
                                    APopupPoint:TPoint;
                                    APopupFormWidth:Integer;
                                    APopupFormHeight:Integer);
begin
  if (CurrentPopupSelectPopupForm<>nil)
    and (CurrentPopupSelectPopupForm<>Self) then
  begin
    HideSelectPopupForm(CurrentPopupSelectPopupForm);
  end;

  //过滤
  if FKeyWord<>AKeyWord then
  begin
    FKeyWord:=AKeyWord;
    DoFilter(AKeyWord);
  end;


  //弹出窗体
  Self.Popup(APopupPoint,APopupFormWidth,APopupFormHeight);


  Self.IsPopuped:=True;

end;

{ TfrmSelectListViewPopup }

//constructor TfrmSelectListViewPopup.Create(AOwner: TComponent);
//begin
//  inherited;
//
//
//
//end;
//
//destructor TfrmSelectListViewPopup.Destroy;
//begin
//
//  inherited;
//end;

initialization
  CurrentPopupSelectPopupForm:=nil;



end.
