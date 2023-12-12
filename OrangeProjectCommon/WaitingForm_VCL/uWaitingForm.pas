unit uWaitingForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Types,
  uWaiting;

const
  Const_HintStr_Data_Loading='���ڼ�������';
//  Const_HintStr_Data_DeletePlan='����ɾ������';
//  Const_HintStr_Data_ExportPlan='���ڵ�������';
//  Const_HintStr_Customer_DeletePlan='����ɾ���ͻ�';
//  Const_HintStr_Customer_ExportPlan='���ڵ����ͻ�';
//  Const_HintStr_Provider_DeletePlan='����ɾ��������';
//  Const_HintStr_Provider_ExportPlan='���ڵ���������';
  Const_HintStr_Data_Selecting='����ѡ������';
  Const_HintStr_Data_Saving='���ڱ�������';
  Const_HintStr_DataMove_GroupGoing='���ڽ��������ת��������ȴ�...';

const
  ShowingFlags: array [Boolean] of Cardinal = (
      SWP_NOZORDER or SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW,
      SWP_NOZORDER or SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);


type
  TWaitingFormClass = class
  private
    FParentForm:TForm;
    //���洰��
    FFollowForm:TForm;
    //�ȴ�����
    FWaiting:TWaitingForm;
    //�ȴ�����Ŀ��
    FWaitingFormWidth:Integer;
    //�ȴ�����ĸ߶�
    FWaitingFormHeight:Integer;
    //�ȴ�����ľ��
    FWaitingFormHandle:Integer;
    //���洰�����Ϣ�ص�����
    //FSavedFollowWndProc:TWndMethod;
    procedure ResetWindowPosition;
    function CreateWaitingForm:Boolean;
    //procedure SetFollowForm(const Value: TForm);
  protected
//    procedure NewFollowWndProc(var Message: TMessage);virtual;
//    procedure FollowWMWindowPosChanged(var Message: TWMWindowPosChanged);
//    procedure FollowWMWindowPosChanging(var Message: TWMWindowPosChanging);
    { Private declarations }
  public
    destructor Destroy;override;
  public
    //�ȴ�����ӿ�
    property Waiting:TWaitingForm read FWaiting write FWaiting;
    //���洰��
    property FollowForm:TForm read FFollowForm write FFollowForm;
    { Public declarations }
  end;

var
  DisableWaitingForm:Boolean;

//��ʾ���ݼ���ҳ��
procedure OpenWaitingForm(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
procedure ShowWaitingFrame(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
//�ر����ݼ���ҳ��
procedure CloseWaitingForm;//(AParentForm:TForm);
procedure HideWaitingFrame;//(AParentForm:TForm);

implementation

var
  //�Ƿ�ע��
  IsRegWaitingCom:Boolean;
//  //�ȴ�����
//  GlobalWaitingFormList:TList;
  //ȫ��WaitingForm
  GlobalWaitingForm:TWaitingFormClass;

//function GetNoUseWaitingForm:TWaitingFormClass;
//var
//  I: Integer;
//begin
//  Result:=nil;
//  for I := 0 to GlobalWaitingFormList.Count - 1 do
//  Begin
//    if TWaitingFormClass(GlobalWaitingFormList.Items[I]).FParentForm=nil then
//    begin
//      Result:=TWaitingFormClass(GlobalWaitingFormList.Items[I]);
//      Break;
//    end;
//  End;
//  if Result=nil then
//  begin
//    Result:=TWaitingFormClass.Create;
//    //�����ȴ�����
//    if Not Result.CreateWaitingForm then
//    begin
//      //û�д����ɹ�,��ô�ͷ�
//      FreeAndNil(Result);
//    end
//    else
//    begin
//      //����ȫ���б�
//      GlobalWaitingFormList.Add(Result);
//    end;
//  end;
//end;
//
//function FreeGlobalWaitingFormList:Boolean;
//var
//  I:Integer;
//begin
//  for I := 0 to GlobalWaitingFormList.Count - 1 do
//  begin
//    TWaitingFormClass(GlobalWaitingFormList.Items[I]).Free;
//  end;
//  GlobalWaitingFormList.Clear;
//end;

procedure WaitSomeTime;
var
  BeginTime:DWORD;
begin
  BeginTime:=GetTickCount;
  while GetTickCount-BeginTime<100 do
  begin
    Application.ProcessMessages;
  end;
end;

procedure ShowWaitingFrame(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
begin
  OpenWaitingForm(AParentForm,AHintStr,IsEnableTiming);
end;

procedure OpenWaitingForm(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
var
//  AWaitingForm:TWaitingFormClass;
  AWindowParentHandle: Integer;
begin
  Try
    if DisableWaitingForm then Exit;
    

    IsEnableTiming:=False;
    if Not IsRegWaitingCom then Exit;

//    //�ȹرյȴ�����
//    CloseWaitingForm(AParentForm);

    if AParentForm=nil then
    begin
      AParentForm:=Application.MainForm;
    end;

    //��ȡ���еĵȴ�����
    if GlobalWaitingForm=nil then
    begin
      GlobalWaitingForm:=TWaitingFormClass.Create;
      //�����ȴ�����
      GlobalWaitingForm.CreateWaitingForm;
    end;

    //�����ȴ�����
    if GlobalWaitingForm<>nil then
    begin
      //���ø�����(�����ж�Ψһ)
      GlobalWaitingForm.FParentForm:=AParentForm;
      //���ø��洰��
      GlobalWaitingForm.FollowForm:=AParentForm;

      AWindowParentHandle:=0;
      if AParentForm<>nil then
      begin
        AWindowParentHandle:=AParentForm.Handle;
      end;
      
      //�����ȴ�����
      GlobalWaitingForm.FWaiting.CreateWindow(AWindowParentHandle);

      //��ȡ�ȴ�����ľ��
      GlobalWaitingForm.FWaiting.GetWaitingFormHandle(GlobalWaitingForm.FWaitingFormHandle);
      //���ü�ⴰ��,�����ⴰ��ر���,��ô�ȴ������Զ��ر�
//      GlobalWaitingForm.FWaiting.SetCheckWindow(AParentForm.Handle);
      //���õȴ��������ʾ����
      GlobalWaitingForm.FWaiting.SetHintStr(PWideChar(AHintStr));
      //��ȡ�ȴ�����Ĵ����С�������ȴ������С��λ��
      GlobalWaitingForm.FWaiting.AdjustFormSize(GlobalWaitingForm.FWaitingFormWidth,GlobalWaitingForm.FWaitingFormHeight);




//      //�Ƿ�������ʱ
//      if IsEnableTiming then
//      begin
//        GlobalWaitingForm.FWaiting.StartTiming;
//      end;


      //�������д���λ��
      GlobalWaitingForm.ResetWindowPosition;
      //��ʾ�ȴ�����
      GlobalWaitingForm.FWaiting.Show;
      WaitSomeTime;
    end;

  Except
    On E:Exception do
    begin
      OutputDebugString(PWideChar(E.Message));
    end;
  End;
end;

procedure HideWaitingFrame;//(AParentForm:TForm);
begin
  CloseWaitingForm;//(AParentForm);
end;

procedure CloseWaitingForm;//(AParentForm:TForm);
//var
//  I: Integer;
//  AWaitingForm:TWaitingFormClass;
begin


  if GlobalWaitingForm<>nil then
  begin
    GlobalWaitingForm.FWaiting.Hide;
//    GlobalWaitingForm.FWaiting.SetCheckWindow(0);
//    GlobalWaitingForm.FWaiting.StopTiming;
    GlobalWaitingForm.FParentForm:=nil;
    GlobalWaitingForm.FFollowForm:=nil;
  end;


//  for I := GlobalWaitingFormList.Count - 1 Downto 0 do
//  begin
//    AWaitingForm:=TWaitingFormClass(GlobalWaitingFormList.Items[I]);
//    if (AWaitingForm.FParentForm=AParentForm) then
//    begin
//      GlobalWaitingFormList.Delete(I);
//      AWaitingForm.FWaiting.Hide;
//      AWaitingForm.FWaiting.StopTiming;
//      AWaitingForm.FParentForm:=nil;
//      AWaitingForm.FFollowForm:=nil;
//      AWaitingForm.Free;
//    end;
//  end;
end;

//function UnRegisterWaitingCom:Boolean;
//begin
//  GlobalWaitingForm:=nil;
//end;

//function RegisterWaitingCom:Boolean;
//var
//  AnsiStr:AnsiString;
//  BeginTime:DWORD;
//begin
//  Result:=False;
//  AnsiStr:=ExtractFilePath(Application.ExeName)+'WaitingForm.exe';
//  if FileExists(AnsiStr) then
//  begin
//    AnsiStr:='"' + AnsiStr+'" /regserver';
//    WinExec(PAnsiChar(AnsiStr), SW_HIDE);
//    Try
//      GlobalWaitingForm:=CoWaitingForm.Create;
//      GlobalWaitingForm:=nil;
//      IsRegWaitingCom:=True;
//      OutputDebugString(PWideChar('ע��ɹ�'));
//    Except
//      On E:Exception do
//      begin
//        IsRegWaitingCom:=False;
//        //RPC������������:svchost.exe -k DcomLaunch
//        OutputDebugString(PWideChar('ע��ʧ��:'+E.Message));
//      end;
//    End;
//  end
//  else
//  begin
//    IsRegWaitingCom:=False;
//  end;
//  Result:=IsRegWaitingCom;
//end;

function TWaitingFormClass.CreateWaitingForm: Boolean;
var
  TryTimes:Integer;
begin
  Result:=False;
  TryTimes:=0;
  while TryTimes<=2 do
  begin
    Try
      if IsRegWaitingCom then
      begin
        //FWaiting:=CoWaitingForm.Create;
        FWaiting:=TWaitingForm.Create;
        Result:=True;
        Break;
      end;
    Except
      On E:Exception do
      begin
        OutputDebugString(PWideChar('����ʧ��:'+E.Message));
        Inc(TryTimes);
        //RegisterWaitingCom;
      end;
    End;
  end;
end;

destructor TWaitingFormClass.Destroy;
begin
  FWaiting.Free;
  inherited;
end;

//procedure TWaitingFormClass.FollowWMWindowPosChanged(var Message: TWMWindowPosChanged);
//begin
//  //���洰����С��ʱ,�����Լ�����͵ȴ�����
//  FSavedFollowWndProc(TMessage(Message));
//  SetWindowPos(FWaitingFormHandle,0,0,0,0,0,ShowingFlags[(FFollowForm.WindowState <> wsMinimized)]);
//  ResetWindowPosition;
//end;
//
//procedure TWaitingFormClass.FollowWMWindowPosChanging(var Message: TWMWindowPosChanging);
//begin
//  FSavedFollowWndProc(TMessage(Message));
//  with Message.WindowPos^ do
//  begin
//    //���洰����С������ʾ,��ô�����Լ�����͵ȴ�����
//    if (FFollowForm.WindowState = wsMinimized) or (flags and SWP_HIDEWINDOW <> 0) then
//    begin
//      //�����Լ�����͵ȴ�����
//      SetWindowPos(FWaitingFormHandle,0,0,0,0,0,ShowingFlags[(FFollowForm.WindowState <> wsMinimized)]);
//    end;
//  end;
//end;

procedure TWaitingFormClass.ResetWindowPosition;
var
  FollowWindowRect:TRect;
begin
  if (FollowForm<>nil) and GetWindowRect(Self.FollowForm.Handle,FollowWindowRect) then
  begin
    //���õȴ������λ��
    SetWindowPos(Self.FWaitingFormHandle,
                  0,
                  FollowWindowRect.Left+(RectWidth(FollowWindowRect)-Self.FWaitingFormWidth) div 2,
                  FollowWindowRect.Top+(RectHeight(FollowWindowRect)-Self.FWaitingFormHeight) div 2,
                  0,
                  0,
                  SWP_NOZORDER or SWP_NOSIZE or SWP_NOACTIVATE);
  end;
end;

//procedure TWaitingFormClass.NewFollowWndProc(var Message: TMessage);
//begin
//  case Message.Msg of
//    WM_WINDOWPOSCHANGING:
//    begin
//      FollowWMWindowPosChanging(TWMWindowPosChanging(Message));
//    end;
//    WM_WINDOWPOSCHANGED:
//    begin
//      FollowWMWindowPosChanged(TWMWindowPosChanged(Message));
//    end
//    else
//    begin
//      FSavedFollowWndProc(Message);
//    end;
//  end;
//end;
//
//procedure TWaitingFormClass.SetFollowForm(const Value: TForm);
//begin
//  if FFollowForm <> Value then
//  begin
//    if Assigned(FFollowForm) and Assigned(FSavedFollowWndProc) then
//    begin
//      FFollowForm.WindowProc := FSavedFollowWndProc;
//      FSavedFollowWndProc := nil;
//    end;
//    FFollowForm := Value;
//    if Assigned(FFollowForm) then
//    begin
//      FSavedFollowWndProc := FFollowForm.WindowProc;
//      FFollowForm.WindowProc := NewFollowWndProc;
//    end;
//  end;
//end;

initialization
//  //ע��WaitingForm
//  GlobalWaitingFormList:=TList.Create;
  DisableWaitingForm:=False;
  IsRegWaitingCom:=True;
  GlobalWaitingForm:=nil;
  //RegisterWaitingCom;

finalization
  //UnRegisterWaitingCom;
  FreeAndNil(GlobalWaitingForm);
//  FreeGlobalWaitingFormList;
//  GlobalWaitingFormList.Free;

end.
