//convert pas to utf8 by ¥
/// <summary>
///   <para>
///     任务
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



//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}




uses
  SysUtils,
  Classes,

  {$IFDEF FMX}
  FMX.Types,
  {$ENDIF}
  {$IFDEF VCL}
  ExtCtrls,
  {$ENDIF}

  uBaseList_Copy,
  uFuncCommon_Copy;



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
  //执行的任务
  TTimerTask=class;
  //任务通知事件(将会弃用)
  TTaskNotify=procedure(ATimerTask:TObject) of object;
  TTimerTaskNotify=procedure(ATimerTask:TTimerTask) of object;



  //参数键值对
  TTaskParam=class
  private
    FName:String;
    FValue:Variant;
  public
    constructor Create(const AName:String;const AValue:Variant);
    destructor Destroy;override;
  public
    //参数名
    property Name:String read FName write FName;
    //参数值
    property Value:Variant read FValue write FValue;
  end;



  //参数列表
  TTaskParamList=class(TBaseList)
  private
    function GetItem(Index: Integer): TTaskParam;
  public
    //添加一对键值
    procedure AddParam(const AName:String;const AValue:Variant);
  public
    function GetItemByName(AName:String):TTaskParam;
    property Items[Index:Integer]:TTaskParam read GetItem;default;
    property ItemByName[AName:String]:TTaskParam read GetItemByName;
  end;











  //线程任务
  TTimerTask=class
  private
    //可以根据此ID来区分所执行的任务
    FTaskID: Integer;
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


    //执行
    procedure Execute;
    procedure SetTaskObject(const Value: TObject);
    procedure SetTaskObject1(const Value: TObject);
  public
    constructor Create(const ATaskID:Integer=0);
    destructor Destroy;override;
  public
//    PageIndex:Integer;
//    PageSize:Integer;

    //是否已终止
    Termiated:Boolean;
    procedure Termiate;


    procedure FreeTaskObject;
    procedure FreeTaskObject1;


    //任务ID,任务类型
    property TaskID:Integer read FTaskID write FTaskID;
    property TaskName:String read FTaskName write FTaskName;
    property TaskData:Pointer read FTaskData write FTaskData;
    //任务对象
    property TaskObject:TObject read FTaskObject write SetTaskObject;
    property TaskObject1:TObject read FTaskObject1 write SetTaskObject1;
    //任务描述
    property TaskDesc:String read FTaskDesc write FTaskDesc;
    //任务标签
    property TaskTag:Integer read FTaskTag write FTaskTag;
    property TaskOtherInfo:TStringList read FTaskOtherInfo;
    //参数
    property TaskParams:TTaskParamList read FTaskParams;



    //是否执行中
    property IsExecuting:Boolean read FIsExecuting write FIsExecuting;
    //是否执行成功
    property IsExecuteSucc:Boolean read FIsExecuteSucc write FIsExecuteSucc;


  public
    //需要在线程中执行的方法
    property OnExecute:TTaskNotify read FOnExecute write FOnExecute;
    //执行结束(在主线程中调用)
    property OnExecuteEnd:TTaskNotify read FOnExecuteEnd write FOnExecuteEnd;

  end;




  //任务列表
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

  /// <summary>
  ///   <para>
  ///     执行任务的线程
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
    procedure Execute;override;
    procedure TerminatedSet;override;
  public
    constructor Create(ACreateSuspended:Boolean);
    destructor Destroy;override;
  public
    Name:String;

    //一个任务执行完休息的时间
    TaskSleep:Integer;

    /// <summary>
    ///   <para>
    ///     运行任务
    ///   </para>
    ///   <para>
    ///     Run task
    ///   </para>
    /// </summary>
    procedure RunTask(ATimerTask:TTimerTask;const AIsStandalone:Boolean=False);



    /// <summary>
    ///   <para>
    ///     运行任务
    ///   </para>
    ///   <para>
    ///     Run task
    ///   </para>
    /// </summary>
    function RunTempTask(
                          AOnExecute:TTaskNotify;
                          AOnExecuteEnd:TTaskNotify;
                          ATaskName:String='';//方便输出日志跟踪
                          AIsStandalone:Boolean=False
                          ):TTimerTask;

    /// <summary>
    ///   <para>
    ///     任务列表
    ///   </para>
    ///   <para>
    ///     Task list
    ///   </para>
    /// </summary>
    property TimerTaskList: TTimerTaskList read FTimerTaskList;

    /// <summary>
    ///   <para>
    ///     已完成的任务列表
    ///   </para>
    ///   <para>
    ///     Finished TaskList
    ///   </para>
    /// </summary>
//    property DoneTimerTaskList: TTimerTaskList read FDoneTimerTaskList;
  end;





/// <summary>
///   <para>
///     获取全局线程
///   </para>
///   <para>
///     Get global thread
///   </para>
/// </summary>
function GetGlobalTimerThread:TTimerThread;
function GetGlobalTimerThread2:TTimerThread;

/// <summary>
///   <para>
///     释放全局线程
///   </para>
///   <para>
///     Release global thread
///   </para>
/// </summary>
procedure FreeGlobalTimerThread;
procedure FreeGlobalTimerThread2;


//在线程中分次Sleep
//比如我要让线程睡个一分钟,但我有时需要立即关闭程序
//等线程退出还要等一分钟,我就分次睡,一次睡个1秒
//分个60次,如果线程没有中止,继续睡,
//避免等在那里
//procedure SleepThread(AThread:TThread;ATimeout:Integer;ACheckTerminateInterval:Integer=1000);


implementation

uses
  uBaseLog_Copy;




var
  //全局的线程
  GlobalTimerThread:TTimerThread;
  //全局的线程2
  GlobalTimerThread2:TTimerThread;

  //线程列表
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




procedure FreeGlobalTimerThread;
begin
  if GlobalTimerThread<>nil then
  begin
    GlobalTimerThread.Terminate;
    GlobalTimerThread.WaitFor;
  end;
  uFuncCommon_Copy.FreeAndNil(GlobalTimerThread);
end;

function GetGlobalTimerThread:TTimerThread;
begin
  if GlobalTimerThread=nil then
  begin
    //立即启动
    GlobalTimerThread:=TTimerThread.Create(False);
    GlobalTimerThread.Name:='GlobalTimerThread';
  end;
  Result:=GlobalTimerThread;
end;

procedure FreeGlobalTimerThread2;
begin
  if GlobalTimerThread2<>nil then
  begin
    GlobalTimerThread2.Terminate;
    GlobalTimerThread2.WaitFor;
  end;
  uFuncCommon_Copy.FreeAndNil(GlobalTimerThread2);
end;

function GetGlobalTimerThread2:TTimerThread;
begin
  if GlobalTimerThread2=nil then
  begin
    //立即启动
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
  //直接启动
  inherited Create(ACreateSuspended);

  TaskSleep:=50;

  FTimerTaskList:=TTimerTaskList.Create;

  GlobalTimerThreadList.Add(Self);
end;

destructor TTimerThread.Destroy;
begin
  GlobalTimerThreadList.Remove(Self);

  inherited;
  uFuncCommon_Copy.FreeAndNil(FTimerTaskList);
end;

procedure TTimerThread.DoExecuteTask(ATimerTask: TTimerTask);
begin

      //有任务,那么执行任务
      uBaseLog_Copy.HandleException(nil,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecute Begin TaskName:'+ATimerTask.TaskName);
      try
          if Assigned(ATimerTask.FOnExecute) then
          begin
              try
                ATimerTask.FOnExecute(ATimerTask);
              except
                on E:Exception do
                begin
                  uBaseLog_Copy.HandleException(E,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecute');
                end;
              end;
          end;
      finally
        ATimerTask.FIsExecuting:=False;
        uBaseLog_Copy.HandleException(nil,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecute End TaskName:'+ATimerTask.TaskName);
      end;


      if Assigned(ATimerTask.FOnExecuteEnd) then
      begin
          //同步
          TThread.Synchronize(nil,procedure
          begin
              //调用任务结束事件
              uBaseLog_Copy.HandleException(nil,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecuteEnd Begin TaskName:'+ATimerTask.TaskName);
              try
                  try

                    if Assigned(ATimerTask.FOnExecuteEnd) then
                    begin
                      ATimerTask.FOnExecuteEnd(ATimerTask);
                    end;

                  except
                    on E:Exception do
                    begin
                      uBaseLog_Copy.HandleException(E,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecuteEnd');
                    end;
                  end;
              finally
                uBaseLog_Copy.HandleException(nil,'OrangeUICommon','uTimerTask','ATimerTask.FOnExecuteEnd End TaskName:'+ATimerTask.TaskName);
              end;
          end);
      end;


      FreeAndNil(ATimerTask);


end;

procedure TTimerThread.Execute;
var
  ATimerTask:TTimerTask;
begin
  inherited;

  while Not Terminated do
  begin

      ATimerTask:=nil;



      //取出需要执行的任务
      if FTimerTaskList.Count>0 then
      begin
        ATimerTask:=FTimerTaskList.Items[0];
        FTimerTaskList.Delete(0,False);
      end;



      if (ATimerTask<>nil) and (not ATimerTask.Termiated) then
      begin

          DoExecuteTask(ATimerTask);

          if TaskSleep>0 then
          begin
            Sleep(TaskSleep);
          end;

      end
      else
      begin
          //没有任务,挂起等待
          Sleep(100);
      end;



  end;

end;

procedure TTimerThread.RunTask(ATimerTask:TTimerTask;const AIsStandalone:Boolean);
begin

  if not AIsStandalone then
  begin
      //加入到执行列表
      Self.FTimerTaskList.Add(ATimerTask);


      //启动定时器检测是否运行结束
      ATimerTask.Execute;


      if Suspended then
      begin
          //启动线程
          Self.Suspended:=False;
      end;
  end
  else
  begin
      TThread.CreateAnonymousThread(procedure
      begin
        DoExecuteTask(ATimerTask);
      end).Start;
  end;

end;

function TTimerThread.RunTempTask(
                          AOnExecute, AOnExecuteEnd: TTaskNotify;
                          ATaskName:String;
                          AIsStandalone:Boolean):TTimerTask;
var
  ATimerTask:TTimerTask;
begin
  ATimerTask:=TTimerTask.Create();
  ATimerTask.FTaskName:=ATaskName;
  ATimerTask.OnExecute:=AOnExecute;
  ATimerTask.OnExecuteEnd:=AOnExecuteEnd;
  GetGlobalTimerThread.RunTask(ATimerTask,AIsStandalone);
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

constructor TTimerTask.Create(const ATaskID:Integer);
begin
  FTaskID:=ATaskID;

  FTaskOtherInfo:=TStringList.Create;

  FTaskParams:=TTaskParamList.Create(ooOwned,False);
end;

destructor TTimerTask.Destroy;
begin
  SetTaskObject(nil);
  SetTaskObject1(nil);
  uFuncCommon_Copy.FreeAndNil(FTaskOtherInfo);
  uFuncCommon_Copy.FreeAndNil(FTaskParams);
  inherited;
end;

procedure TTimerTask.Execute;
begin
  //开始检测
  FIsExecuteSucc:=False;
  FIsExecuting:=True;
end;

procedure TTimerTask.FreeTaskObject;
begin
  uFuncCommon_Copy.FreeAndNil(FTaskObject);
end;

procedure TTimerTask.FreeTaskObject1;
begin
  uFuncCommon_Copy.FreeAndNil(FTaskObject1);
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
      uBaseLog_Copy.HandleException(E,'OrangeUICommon','uTimerTask','ATimerTask.SetTaskObject');
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
      uBaseLog_Copy.HandleException(E,'OrangeUICommon','uTimerTask','ATimerTask.SetTaskObject1');
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



finalization
  try
    FreeGlobalTimerThread;
  except
    on E:Exception do
    begin
      uBaseLog_Copy.HandleException(E,'Base','uTimerTask','finalization FreeAndNil(GlobalTimerThread)');
    end;
  end;
  try
    FreeGlobalTimerThread2;
  except
    on E:Exception do
    begin
      uBaseLog_Copy.HandleException(E,'Base','uTimerTask','finalization FreeAndNil(GlobalTimerThread2)');
    end;
  end;
//  uFuncCommon_Copy.FreeAndNil(GlobalThreadCheckTimer);
  uFuncCommon_Copy.FreeAndNil(GlobalTimerThreadList);


end.


