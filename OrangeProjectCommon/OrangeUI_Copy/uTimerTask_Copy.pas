//convert pas to utf8 by
/// <summary>
///   <para>
///     ����
///   </para>
///   <para>
///     Task
///   </para>
/// </summary>
unit uTimerTask_Copy;



interface
{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}



//���ڹ����·���FrameWork.inc
//�����ڹ�������������FMX����ָ��
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}




uses
  SysUtils,
  Classes,

  {$IFDEF FMX}
//  FMX.Types,
  {$ENDIF}
  {$IFDEF VCL}
  ExtCtrls,
  {$ENDIF}
  {$IFDEF IN_ORANGESDK}
  uFuncCommon_Copy,
  uBaseList_Copy,
  {$ELSE}
  uFuncCommon,
  uBaseList_Copy,
  {$ENDIF}

  SyncObjs;


const
  Const_TimerTask_Normal=0;
  Const_TimerTask_None=1;
  Const_TimerTask_Succ=2;
  Const_TimerTask_Fail=3;
  Const_TimerTask_Error=4;

const
  TASK_SUCC=0;
  TASK_FAIL=1;



type
  //ִ�е�����
  TTimerTask=class;
  //����֪ͨ�¼�(��������)
  TTaskNotify=procedure(ATimerTask:TObject) of object;
  TTimerTaskNotify=procedure(ATimerTask:TTimerTask) of object;



  //������ֵ��
  TTaskParam=class
  private
    FName:String;
    FValue:Variant;
  public
    constructor Create(const AName:String;const AValue:Variant);
    destructor Destroy;override;
  public
    //������
    property Name:String read FName write FName;
    //����ֵ
    property Value:Variant read FValue write FValue;
  end;



  //�����б�
  TTaskParamList=class(TBaseList)
  private
    function GetItem(Index: Integer): TTaskParam;
  public
    //���һ�Լ�ֵ
    procedure AddParam(const AName:String;const AValue:Variant);
  public
    function GetItemByName(AName:String):TTaskParam;
    property Items[Index:Integer]:TTaskParam read GetItem;default;
    property ItemByName[AName:String]:TTaskParam read GetItemByName;
  end;











  //�߳�����
  TTimerTask=class
  private
    //���Ը��ݴ�ID��������ִ�е�����
    FTaskID: String;
    FTaskName:String;


    FTaskData: Pointer;
    FTaskObject: TObject;
    FTaskObject1: TObject;
    FTaskDesc: String;
    FTaskTag: Integer;
    FTaskOtherInfo:TStringList;
    FTaskParams: TTaskParamList;

    FIsExecuting:Boolean;
    FIsExecuteSucc:Boolean;

    FOnExecuteEnd: TTaskNotify;
    FOnExecute: TTaskNotify;


    //ִ��
    procedure Execute;
    procedure SetTaskObject(const Value: TObject);
    procedure SetTaskObject1(const Value: TObject);
  public
    constructor Create(const ATaskID:String='');
    destructor Destroy;override;
  public
//    PageIndex:Integer;
//    PageSize:Integer;

    //�Ƿ�����ֹ
    Termiated:Boolean;
    procedure Termiate;


    procedure FreeTaskObject;
    procedure FreeTaskObject1;


    //����ID,��������
    property TaskID:String read FTaskID write FTaskID;
    property TaskName:String read FTaskName write FTaskName;
    property TaskData:Pointer read FTaskData write FTaskData;
    //�������
    property TaskObject:TObject read FTaskObject write SetTaskObject;
    property TaskObject1:TObject read FTaskObject1 write SetTaskObject1;
    //��������
    property TaskDesc:String read FTaskDesc write FTaskDesc;
    //�����ǩ
    property TaskTag:Integer read FTaskTag write FTaskTag;
    property TaskOtherInfo:TStringList read FTaskOtherInfo;
    //����
    property TaskParams:TTaskParamList read FTaskParams;



    //�Ƿ�ִ����
    property IsExecuting:Boolean read FIsExecuting write FIsExecuting;
    //�Ƿ�ִ�гɹ�
    property IsExecuteSucc:Boolean read FIsExecuteSucc write FIsExecuteSucc;


  public
    //��Ҫ���߳���ִ�еķ���
    property OnExecute:TTaskNotify read FOnExecute write FOnExecute;
    //ִ�н���(�����߳��е���)
    property OnExecuteEnd:TTaskNotify read FOnExecuteEnd write FOnExecuteEnd;

  end;




  //�����б�
  TTimerTaskList=class(TBaseList)
  private
    function GetItem(Index: Integer): TTimerTask;
    procedure SetItem(Index: Integer; const Value: TTimerTask);
  public
    property Items[Index:Integer]:TTimerTask read GetItem write SetItem;default;
  end;












  TBaseServiceThread=class(TThread)
  public
    procedure SleepThread(ATimeout:Integer;ACheckTerminateInterval:Integer=1000);
  end;

//  TTimerThreadCanExecuteEvent=function(Sender:TObject):Boolean of object;

  /// <summary>
  ///   <para>
  ///     ִ��������߳�
  ///   </para>
  ///   <para>
  ///     Thread of executing task
  ///   </para>
  /// </summary>
  TTimerThread=class(TBaseServiceThread)
  private
    FTimerTaskList: TTimerTaskList;
  protected
    procedure DoExecuteTask(ATimerTask:TTimerTask);
    procedure DoExecuteTaskEnd(ATimerTask:TTimerTask);
    procedure Execute;override;
    procedure DoExecute;virtual;
    procedure TerminatedSet;{$IF CompilerVersion >= 30.0}override;{$IFEND}
  public
    constructor Create(ACreateSuspended:Boolean);
    destructor Destroy;override;
  public
    Name:String;
    FRecvEvent:TEvent;
    procedure Terminate;
    function CreateTimerTask:TTimerTask;virtual;

//    //һ������ִ������Ϣ��ʱ��
//    TaskSleep:Integer;

    /// <summary>
    ///   <para>
    ///     ��������
    ///   </para>
    ///   <para>
    ///     Run task
    ///   </para>
    /// </summary>
    procedure RunTask(ATimerTask:TTimerTask;const AIsStandalone:Boolean=True);



    /// <summary>
    ///   <para>
    ///     ��������
    ///   </para>
    ///   <para>
    ///     Run task
    ///   </para>
    /// </summary>
    function RunTempTask(
                        AOnExecute:TTaskNotify;
                        AOnExecuteEnd:TTaskNotify;
                        ATaskName:String='';//���������־����
                        AIsStandalone:Boolean=True
                        ):TTimerTask;

    /// <summary>
    ///   <para>
    ///     �����б�
    ///   </para>
    ///   <para>
    ///     Task list
    ///   </para>
    /// </summary>
    property TimerTaskList: TTimerTaskList read FTimerTaskList;

    /// <summary>
    ///   <para>
    ///     ����ɵ������б�
    ///   </para>
    ///   <para>
    ///     Finished TaskList
    ///   </para>
    /// </summary>
//    property DoneTimerTaskList: TTimerTaskList read FDoneTimerTaskList;
  end;











var
//  GlobalOnTimerThreadCanExecute:TTimerThreadCanExecuteEvent;
  GlobalIsTimerThreadCanExecute:Boolean;


/// <summary>
///   <para>
///     ��ȡȫ���߳�
///   </para>
///   <para>
///     Get global thread
///   </para>
/// </summary>
function GetGlobalTimerThread:TTimerThread;
function GetGlobalTimerThread2:TTimerThread;

/// <summary>
///   <para>
///     �ͷ�ȫ���߳�
///   </para>
///   <para>
///     Release global thread
///   </para>
/// </summary>
procedure FreeGlobalTimerThread;
procedure FreeGlobalTimerThread2;


//���߳��зִ�Sleep
//������Ҫ���߳�˯��һ����,������ʱ��Ҫ�����رճ���
//���߳��˳���Ҫ��һ����,�Ҿͷִ�˯,һ��˯��1��
//�ָ�60��,����߳�û����ֹ,����˯,
//�����������
//procedure SleepThread(AThread:TThread;ATimeout:Integer;ACheckTerminateInterval:Integer=1000);




implementation

uses
  uBaseLog_Copy;




var
  //ȫ�ֵ��߳�
  GlobalTimerThread:TTimerThread;
  //ȫ�ֵ��߳�2
  GlobalTimerThread2:TTimerThread;

  //�߳��б�
  GlobalTimerThreadList:TList;



//procedure SleepThread(AThread:TThread;ATimeout:Integer;ACheckTerminateInterval:Integer);
//var
//  ASumTimeout:Integer;
//begin
//  ASumTimeout:=0;
//  while not TThreadHelper(AThread).Terminated and (ASumTimeout<ATimeout) do
//  begin
//    Sleep(ATimeout);
//    ASumTimeout:=ASumTimeout+ACheckTerminateInterval;
//  end;
//end;

//    GlobalTimerThread.Terminate;
//    GlobalTimerThread.WaitFor;
//    GlobalTimerThread.Free;


procedure FreeGlobalTimerThread;
begin
  if GlobalTimerThread<>nil then
  begin
    GlobalTimerThread.FRecvEvent.SetEvent;
    GlobalTimerThread.Terminate;
    GlobalTimerThread.WaitFor;
  end;
  SysUtils.FreeAndNil(GlobalTimerThread);
end;

function GetGlobalTimerThread:TTimerThread;
begin
  if GlobalTimerThread=nil then
  begin
    //��������
    GlobalTimerThread:=TTimerThread.Create(False);
    GlobalTimerThread.Name:='GlobalTimerThread';
  end;
  Result:=GlobalTimerThread;
end;

procedure FreeGlobalTimerThread2;
begin
  if GlobalTimerThread2<>nil then
  begin
    GlobalTimerThread2.FRecvEvent.SetEvent;
    GlobalTimerThread2.Terminate;
    GlobalTimerThread2.WaitFor;
  end;
  SysUtils.FreeAndNil(GlobalTimerThread2);
end;

function GetGlobalTimerThread2:TTimerThread;
begin
  if GlobalTimerThread2=nil then
  begin
    //��������
    GlobalTimerThread2:=TTimerThread.Create(False);
    GlobalTimerThread2.Name:='GlobalTimerThread-2';
  end;
  Result:=GlobalTimerThread2;
end;


{ TTaskParam }

constructor TTaskParam.Create(const AName:String;const AValue:Variant);
begin
  FName:=AName;
  FValue:=AValue;
end;

destructor TTaskParam.Destroy;
begin
  inherited;
end;




{ TTaskParamList }


procedure TTaskParamList.AddParam(const AName: String;const AValue: Variant);
begin
  Self.Add(TTaskParam.Create(AName,AValue));
end;

function TTaskParamList.GetItemByName(AName: String): TTaskParam;
var
  I:Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count - 1 do
  begin
    if Items[I].Name=AName then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TTaskParamList.GetItem(Index: Integer): TTaskParam;
begin
  Result:=TTaskParam(Inherited Items[Index]);
end;


{ TTimerThread }

constructor TTimerThread.Create(ACreateSuspended: Boolean);
begin
  //ֱ������
  inherited Create(ACreateSuspended);

//  TaskSleep:=50;

  FTimerTaskList:=TTimerTaskList.Create;

  GlobalTimerThreadList.Add(Self);


  FRecvEvent:=TEvent.Create(nil, True, False, '');
end;

function TTimerThread.CreateTimerTask: TTimerTask;
begin
  Result:=TTimerTask.Create();
end;

destructor TTimerThread.Destroy;
begin

  GlobalTimerThreadList.Remove(Self);

  inherited;
  SysUtils.FreeAndNil(FTimerTaskList);
  FreeAndNil(FRecvEvent);
end;

procedure TTimerThread.DoExecute;
var
  ATimerTask:TTimerTask;
//  AIsCanExecute:Boolean;
begin
      ATimerTask:=nil;

//      AIsCanExecute:=False;
      repeat
          //�ж��Ƿ������������
//          if Assigned(GlobalOnTimerThreadCanExecute) then
//          begin
//            AIsCanExecute:=GlobalOnTimerThreadCanExecute(Self);
//          end;
          if not GlobalIsTimerThreadCanExecute then
          begin
            Sleep(1000);
          end;
      until GlobalIsTimerThreadCanExecute;



      //ȡ����Ҫִ�е�����
      if FTimerTaskList.Count>0 then
      begin
        ATimerTask:=FTimerTaskList.Items[0];
        FTimerTaskList.Delete(0,False);
      end;



      if (ATimerTask<>nil) and (not ATimerTask.Termiated) then
      begin

          DoExecuteTask(ATimerTask);
          DoExecuteTaskEnd(ATimerTask);
          FreeAndNil(ATimerTask);

//          if TaskSleep>0 then
//          begin
//            Sleep(TaskSleep);
//          end;

      end
      else
      begin
          //û������,����ȴ�
          //Sleep(100);
      end;

end;

procedure TTimerThread.DoExecuteTask(ATimerTask: TTimerTask);
begin

      //������,��ôִ������
//      uBaseLog.HandleException(nil,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecute Begin TaskName:'+ATimerTask.TaskName);
      try
          if Assigned(ATimerTask.FOnExecute) then
          begin
              try
                ATimerTask.FOnExecute(ATimerTask);
              except
                on E:Exception do
                begin
                  HandleException(E,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecute'+' TaskName:'+ATimerTask.TaskName);
                end;
              end;
          end;
      finally
        ATimerTask.FIsExecuting:=False;
//        uBaseLog.HandleException(nil,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecute End TaskName:'+ATimerTask.TaskName);
      end;




end;

procedure TTimerThread.DoExecuteTaskEnd(ATimerTask: TTimerTask);
begin

      if Assigned(ATimerTask.FOnExecuteEnd) then
      begin
          //ͬ��
          TThread.Synchronize(nil,procedure
          begin
              //������������¼�
//              uBaseLog.HandleException(nil,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecuteEnd Begin TaskName:'+ATimerTask.TaskName);
              try
                  try

                    if Assigned(ATimerTask.FOnExecuteEnd) then
                    begin
                      ATimerTask.FOnExecuteEnd(ATimerTask);
                    end;

                  except
                    on E:Exception do
                    begin
                      HandleException(E,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecuteEnd'+' TaskName:'+ATimerTask.TaskName);
                    end;
                  end;
              finally
//                uBaseLog.HandleException(nil,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecuteEnd End TaskName:'+ATimerTask.TaskName);
              end;
          end);
      end;


end;

procedure TTimerThread.Execute;
begin
  inherited;

  while Not Terminated do
  begin

      //ȡ����Ҫִ�е�����
      if FTimerTaskList.Count=0 then
      begin
        //û�������ʱ�����Ҫ�ȴ�
  //      FRecvEvent.WaitFor(100);
        FRecvEvent.WaitFor(INFINITE);
        FRecvEvent.ResetEvent;
      end;

      if Not Terminated then
      begin

        Self.DoExecute;

      end;


  end;

end;

procedure TTimerThread.RunTask(ATimerTask:TTimerTask;const AIsStandalone:Boolean);
begin
  {$IF CompilerVersion >= 30.0}
      if not AIsStandalone then
      begin
          //���뵽ִ���б�
          Self.FTimerTaskList.Add(ATimerTask);

          FRecvEvent.SetEvent;

          //������ʱ������Ƿ����н���,����Ҫ��
          ATimerTask.Execute;


          if Suspended then
          begin
              //�����߳�
              Self.Suspended:=False;
          end;

      end
      else
      begin
          TThread.CreateAnonymousThread(procedure
          begin
            DoExecuteTask(ATimerTask);
            DoExecuteTaskEnd(ATimerTask);
            FreeAndNil(ATimerTask);
          end).Start;
      end;
  {$ELSE}
      //���뵽ִ���б�
      Self.FTimerTaskList.Add(ATimerTask);

      FRecvEvent.SetEvent;

      //������ʱ������Ƿ����н���,����Ҫ��
      ATimerTask.Execute;


      if Suspended then
      begin
          //�����߳�
          Self.Suspended:=False;
      end;
  {$IFEND}

end;

function TTimerThread.RunTempTask(
                                  AOnExecute, AOnExecuteEnd: TTaskNotify;
                                  ATaskName:String;
                                  AIsStandalone:Boolean):TTimerTask;
var
  ATimerTask:TTimerTask;
begin
  ATimerTask:=CreateTimerTask;
  ATimerTask.FTaskName:=ATaskName;
  ATimerTask.OnExecute:=AOnExecute;
  ATimerTask.OnExecuteEnd:=AOnExecuteEnd;
  GetGlobalTimerThread.RunTask(ATimerTask,AIsStandalone);
end;



procedure TTimerThread.Terminate;
begin
  FRecvEvent.SetEvent;
  Inherited Terminate;
  FRecvEvent.SetEvent;
end;

procedure TTimerThread.TerminatedSet;
var
  I: Integer;
begin
  for I := Self.FTimerTaskList.Count-1 downto 0 do
  begin
    FTimerTaskList[I].Termiate;
  end;

end;

{ TTimerTask }

constructor TTimerTask.Create(const ATaskID:String);
begin
  FTaskID:=ATaskID;

  FTaskOtherInfo:=TStringList.Create;

  FTaskParams:=TTaskParamList.Create(ooOwned,False);
end;

destructor TTimerTask.Destroy;
begin
  SetTaskObject(nil);
  SetTaskObject1(nil);
  SysUtils.FreeAndNil(FTaskOtherInfo);
  SysUtils.FreeAndNil(FTaskParams);
  inherited;
end;

procedure TTimerTask.Execute;
begin
  //��ʼ���
  FIsExecuteSucc:=False;
  FIsExecuting:=True;
end;

procedure TTimerTask.FreeTaskObject;
begin
  SysUtils.FreeAndNil(FTaskObject);
end;

procedure TTimerTask.FreeTaskObject1;
begin
  SysUtils.FreeAndNil(FTaskObject1);
end;

procedure TTimerTask.SetTaskObject(const Value: TObject);
begin
  try
    if FTaskObject<>Value then
    begin
        if FTaskObject<>nil then
        begin
          ObjRelease(FTaskObject);
        end;

        FTaskObject := Value;

        if FTaskObject<>nil then
        begin
          ObjAddRef(FTaskObject);
        end;
    end;
  except
    on E:Exception do
    begin
      HandleException(E,'OrangeUICommon','uTimerTask','ATimerTask.SetTaskObject');
    end;
  end;
end;

procedure TTimerTask.SetTaskObject1(const Value: TObject);
begin
  try
    if FTaskObject1<>Value then
    begin
        if FTaskObject1<>nil then
        begin
          ObjRelease(FTaskObject1);
        end;

        FTaskObject1 := Value;

        if FTaskObject1<>nil then
        begin
          ObjAddRef(FTaskObject1);
        end;
    end;
  except
    on E:Exception do
    begin
      HandleException(E,'OrangeUICommon','uTimerTask','ATimerTask.SetTaskObject1');
    end;
  end;
end;

procedure TTimerTask.Termiate;
begin
  Termiated:=True;

end;

{ TTimerTaskList }

function TTimerTaskList.GetItem(Index: Integer): TTimerTask;
begin
  Result:=TTimerTask(Inherited Items[Index]);
end;

procedure TTimerTaskList.SetItem(Index: Integer; const Value: TTimerTask);
begin
  Inherited Items[Index]:=Value;
end;




{ TBaseServiceThread }

procedure TBaseServiceThread.SleepThread(ATimeout,
  ACheckTerminateInterval: Integer);
var
  ASumTimeout:Integer;
begin
  ASumTimeout:=0;
  while not Self.Terminated and (ASumTimeout<ATimeout) do
  begin
    Sleep(ACheckTerminateInterval);
    ASumTimeout:=ASumTimeout+ACheckTerminateInterval;
  end;
end;



initialization
  GlobalTimerThreadList:=TList.Create;
  GlobalTimerThread:=nil;
  GlobalTimerThread2:=nil;
  GlobalIsTimerThreadCanExecute:=True;



finalization


  try
    FreeGlobalTimerThread;
  except
    on E:Exception do
    begin
      HandleException(E,'Base','uTimerTask','finalization FreeAndNil(GlobalTimerThread)');
    end;
  end;


  try
    FreeGlobalTimerThread2;
  except
    on E:Exception do
    begin
      HandleException(E,'Base','uTimerTask','finalization FreeAndNil(GlobalTimerThread2)');
    end;
  end;


//  SysUtils.FreeAndNil(GlobalThreadCheckTimer);
  SysUtils.FreeAndNil(GlobalTimerThreadList);


end.


