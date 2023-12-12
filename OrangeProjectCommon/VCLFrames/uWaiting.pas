unit uWaiting;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj,
  Classes,
  SysUtils,
  ActiveX,
  AxCtrls,
  Forms,
  StdVcl,
  Windows,
  FormWaiting;

type
  TWaitingForm = class(TInterfacedObject)
  private
    FIsTiming:Boolean;
    FfrmWaiting: TfrmWaiting;
  public
    destructor Destroy;override;
  public
    procedure Show; safecall;
    procedure Hide; safecall;
    procedure SetHintStr(AHintStr: PWideChar); safecall;
    procedure AdjustFormSize(out AWidth, AHeight: Integer); safecall;
//    procedure SetCheckWindow(ACheckWindow: Integer); safecall;
    procedure GetWaitingFormHandle(out AWaitingFormHandle: Integer); safecall;
    procedure SetFollowWindow(AFollowWindowHandle: Integer); safecall;
    procedure CreateWindow(AWindowParent: Integer); safecall;
  end;


implementation

destructor TWaitingForm.Destroy;
begin
  FreeAndNil(FfrmWaiting);
  inherited;
end;

procedure TWaitingForm.Show;
begin
  SetWindowPos(FfrmWaiting.Handle, HWND_TOPMOST, 0, 0, 0, 0,
              SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
end;

procedure TWaitingForm.Hide;
begin
  SetWindowPos(FfrmWaiting.Handle, HWND_TOPMOST, 0, 0, 0, 0,
              SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
end;

procedure TWaitingForm.SetHintStr(AHintStr: PWideChar);
begin
  FfrmWaiting.SetHintStr(AHintStr);
end;

procedure TWaitingForm.AdjustFormSize(out AWidth, AHeight: Integer);
begin
  FfrmWaiting.AdjustFormSize(AWidth,AHeight);
end;

//procedure TWaitingForm.SetCheckWindow(ACheckWindow: Integer);
//begin
//  FfrmWaiting.SetCheckWindow(ACheckWindow);
//end;

procedure TWaitingForm.GetWaitingFormHandle(out AWaitingFormHandle: Integer);
begin
  AWaitingFormHandle:=FfrmWaiting.Handle;
end;

procedure TWaitingForm.SetFollowWindow(AFollowWindowHandle: Integer);
begin
  FfrmWaiting.SetFollowWindow(AFollowWindowHandle);
end;

procedure TWaitingForm.CreateWindow(AWindowParent: Integer);
begin
  if FfrmWaiting=nil then
  begin
    FfrmWaiting:=TfrmWaiting.Create(nil,AWindowParent);
//    FfrmWaiting.WaitingForm:=Self;
    FfrmWaiting.SetBounds(0,0,0,0);
    FfrmWaiting.Show;
    FfrmWaiting.Hide;
  end;
end;


end.
