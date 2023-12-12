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
  Const_HintStr_Data_Loading='正在加载数据';
//  Const_HintStr_Data_DeletePlan='正在删除数据';
//  Const_HintStr_Data_ExportPlan='正在导出数据';
//  Const_HintStr_Customer_DeletePlan='正在删除客户';
//  Const_HintStr_Customer_ExportPlan='正在导出客户';
//  Const_HintStr_Provider_DeletePlan='正在删除供货商';
//  Const_HintStr_Provider_ExportPlan='正在导出供货商';
  Const_HintStr_Data_Selecting='正在选入数据';
  Const_HintStr_Data_Saving='正在保存数据';
  Const_HintStr_DataMove_GroupGoing='正在进行组合流转操作，请等待...';

const
  ShowingFlags: array [Boolean] of Cardinal = (
      SWP_NOZORDER or SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW,
      SWP_NOZORDER or SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);


type
  TWaitingFormClass = class
  private
    FParentForm:TForm;
    //跟随窗体
    FFollowForm:TForm;
    //等待界面
    FWaiting:TWaitingForm;
    //等待窗体的宽度
    FWaitingFormWidth:Integer;
    //等待窗体的高度
    FWaitingFormHeight:Integer;
    //等待窗体的句柄
    FWaitingFormHandle:Integer;
    //跟随窗体的消息回调过程
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
    //等待窗体接口
    property Waiting:TWaitingForm read FWaiting write FWaiting;
    //跟随窗体
    property FollowForm:TForm read FFollowForm write FFollowForm;
    { Public declarations }
  end;

var
  DisableWaitingForm:Boolean;

//显示数据加载页面
procedure OpenWaitingForm(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
procedure ShowWaitingFrame(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
//关闭数据加载页面
procedure CloseWaitingForm;//(AParentForm:TForm);
procedure HideWaitingFrame;//(AParentForm:TForm);

implementation

var
  //是否注册
  IsRegWaitingCom:Boolean;
//  //等待界面
//  GlobalWaitingFormList:TList;
  //全局WaitingForm
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
//    //创建等待界面
//    if Not Result.CreateWaitingForm then
//    begin
//      //没有创建成功,那么释放
//      FreeAndNil(Result);
//    end
//    else
//    begin
//      //加入全局列表
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

//    //先关闭等待界面
//    CloseWaitingForm(AParentForm);

    if AParentForm=nil then
    begin
      AParentForm:=Application.MainForm;
    end;

    //获取空闲的等待界面
    if GlobalWaitingForm=nil then
    begin
      GlobalWaitingForm:=TWaitingFormClass.Create;
      //创建等待界面
      GlobalWaitingForm.CreateWaitingForm;
    end;

    //创建等待界面
    if GlobalWaitingForm<>nil then
    begin
      //设置父窗体(用于判断唯一)
      GlobalWaitingForm.FParentForm:=AParentForm;
      //设置跟随窗体
      GlobalWaitingForm.FollowForm:=AParentForm;

      AWindowParentHandle:=0;
      if AParentForm<>nil then
      begin
        AWindowParentHandle:=AParentForm.Handle;
      end;
      
      //创建等待窗体
      GlobalWaitingForm.FWaiting.CreateWindow(AWindowParentHandle);

      //获取等待窗体的句柄
      GlobalWaitingForm.FWaiting.GetWaitingFormHandle(GlobalWaitingForm.FWaitingFormHandle);
      //设置检测窗体,如果检测窗体关闭了,那么等待窗体自动关闭
//      GlobalWaitingForm.FWaiting.SetCheckWindow(AParentForm.Handle);
      //设置等待窗体的提示文字
      GlobalWaitingForm.FWaiting.SetHintStr(PWideChar(AHintStr));
      //获取等待窗体的窗体大小并调整等待窗体大小和位置
      GlobalWaitingForm.FWaiting.AdjustFormSize(GlobalWaitingForm.FWaitingFormWidth,GlobalWaitingForm.FWaitingFormHeight);




//      //是否启动计时
//      if IsEnableTiming then
//      begin
//        GlobalWaitingForm.FWaiting.StartTiming;
//      end;


      //重新排列窗体位置
      GlobalWaitingForm.ResetWindowPosition;
      //显示等待界面
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
//      OutputDebugString(PWideChar('注册成功'));
//    Except
//      On E:Exception do
//      begin
//        IsRegWaitingCom:=False;
//        //RPC服务器不可用:svchost.exe -k DcomLaunch
//        OutputDebugString(PWideChar('注册失败:'+E.Message));
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
        OutputDebugString(PWideChar('创建失败:'+E.Message));
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
//  //跟随窗体最小化时,隐藏自己窗体和等待窗体
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
//    //跟随窗体最小化或不显示,那么隐藏自己窗体和等待窗体
//    if (FFollowForm.WindowState = wsMinimized) or (flags and SWP_HIDEWINDOW <> 0) then
//    begin
//      //隐藏自己窗体和等待窗体
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
    //设置等待窗体的位置
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
//  //注册WaitingForm
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
