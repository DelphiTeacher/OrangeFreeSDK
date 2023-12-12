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
  //ѡ��һ����¼���¼�
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
    //���ڹ���
    procedure DoFilter(AKeyword:String);virtual;
    //������������
    procedure DoClear;virtual;
    procedure CustomPopup;virtual;
  protected
    procedure CreateParams(var Params:TCreateParams);override;

  public
    //��ǰ�������Ĺؼ���
    FKeyWord:String;
    //ѡ���˼�¼���¼�
    OnSelectRecord: TOnSelectRecordEvent;



    //�����Ƿ��Ѿ�����
    IsPopuped:Boolean;
    //���ش���
    procedure HidePopup;

    //��������
    procedure Popup(APopupPoint:TPoint;
                    APopupFormWidth:Integer;
                    APopupFormHeight:Integer;
                    //-1��ʾ��ǰ
                    AParentFormHandle:Integer=0;
                    AShowFlag:Integer=SWP_NOACTIVATE or SWP_SHOWWINDOW);
    //����������
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
  //��Show�Ļ�,����Ŀؼ���ʾ������
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

  //���ش���
  ShowWindow(Self.Handle,SW_HIDE);

  IsPopuped:=False;

  if CurrentPopupSelectPopupForm=Self then
  begin
    CurrentPopupSelectPopupForm:=nil;
    HookMouse(False);
  end;

  //�������,�����´���ʾ�����ʱ�򻹱������ϴε�����
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

  //��������
  SetWindowPos(Self.Handle,
                //HWND_TOPMOST,���������뷨��ס��
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

  //����
  if FKeyWord<>AKeyWord then
  begin
    FKeyWord:=AKeyWord;
    DoFilter(AKeyWord);
  end;


  //��������
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
