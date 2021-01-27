//工作基类//
unit uWorkThreadPool;

interface

uses
  Windows,
  SysUtils,
  Controls,
  SyncObjs,
  Classes,
  ActiveX,
  uWorkThreadList;

type
  //{$Region '工作线程'}
  TWorkThreadClass=class of TWorkThread;
  TWorkThread=class(TThread)
  private
    //是否停止
    FIsStop:Boolean;
    //线程是否正在运行
    FIsRunning:Boolean;
    //启动事件
    FResumeEvent:TEvent;
    //是否被引用
    FIsReference:Boolean;
    FUseComInThread: Boolean;
    //是否暂停
    function GetIsPause: Boolean;
  protected
    //线程ID
    FThreadID:String;
    procedure DoExecute;virtual;
    procedure Execute;override;
  public
    constructor Create(ASuspended:Boolean);virtual;
    Destructor Destroy;override;
  public
    //停止
    procedure Stop;virtual;
    //暂停
    procedure Pause;virtual;
    //继续
    procedure Continue;virtual;
    //启动线程
    procedure Start;virtual;
    //是否正在运行
    function IsRunning:Boolean;virtual;
    //是否已经停止
    property IsStop:Boolean read FIsStop;
    //是否已经暂停
    property IsPause:Boolean read GetIsPause;
    //启动事件
    property ResumeEvent:TEvent read FResumeEvent;
    //是否被引用
    property IsReference:Boolean read FIsReference write FIsReference;
    //是否在线程中使用COM
    property UseComInThread:Boolean read FUseComInThread write FUseComInThread;
  end;

  //{$EndRegion}

  //{$Region '工作线程池'}
  TWorkThreadPool=class
  private
    //工作线程类类型
    FWorkThreadClass:TWorkThreadClass;
    //工作线程列表
    FWorkThreadList:TWorkThreadList;
  public
    constructor Create(AWorkThreadClass:TWorkThreadClass);
    destructor Destroy;override;
  public
    //获取一个线程
    function GetWorkThread:TWorkThread;
    //回收一个线程
    function RecyleWorkThread(AWorkThread:TWorkThread):Boolean;
  end;
  //{$EndRegion}

implementation

{ TWorkThread }

procedure TWorkThread.Continue;
begin
  Self.Resume;
end;

constructor TWorkThread.Create(ASuspended: Boolean);
begin
  Inherited Create(ASuspended);

  //停止
  FIsStop:=True;
  //未运行
  FIsRunning:=False;
  //是否被引用
  FIsReference:=False;
  //是否在线程中使用COM
  FUseComInThread:=True;
  //线程ID
  FThreadID:=IntToStr(Inherited ThreadID);
  //启动事件
  FResumeEvent:=TEvent.Create(nil,False,False,'');


end;

destructor TWorkThread.Destroy;
begin
  FResumeEvent.Free;
  inherited;
end;

procedure TWorkThread.DoExecute;
begin
end;

procedure TWorkThread.Execute;
begin
  inherited;
  if FUseComInThread then CoInitialize(nil);
  while Not Self.Terminated do
  begin
    Self.FResumeEvent.WaitFor(INFINITE);
    Self.FIsRunning:=True;
    Try
      if Not Self.Terminated And Not Self.FIsStop then
      begin
        Try
          DoExecute;
        except
        end;
      end;
    Finally
     Self.FIsRunning:=False;
    End;
  end;
  if FUseComInThread then CoUnInitialize;
end;

function TWorkThread.GetIsPause: Boolean;
begin
  Result:=Self.Suspended;
end;

function TWorkThread.IsRunning: Boolean;
begin
  Result:=FIsRunning;
end;

procedure TWorkThread.Pause;
begin
  Suspend;
end;

procedure TWorkThread.Start;
begin
  Self.FIsStop:=False;
  if Self.Suspended and Not Terminated then Self.Resume;
  Self.FResumeEvent.SetEvent;
end;

procedure TWorkThread.Stop;
begin
    Self.FIsStop:=True;
    if Self.Suspended and Not Terminated then Self.Resume;
    Self.FResumeEvent.SetEvent;
end;

{ TWorkThreadPool }

constructor TWorkThreadPool.Create(AWorkThreadClass: TWorkThreadClass);
begin
  //工作线程类类型
  FWorkThreadClass:=AWorkThreadClass;
  //工作线程列表
  FWorkThreadList:=TWorkThreadList.Create;
end;

destructor TWorkThreadPool.Destroy;
begin
  //释放工作线程列表
  FWorkThreadList.Free;
  inherited;
end;

function TWorkThreadPool.GetWorkThread: TWorkThread;
var
  I: Integer;
  AWorkThread:TWorkThread;
begin
  Result:=nil;
  //获取没有被使用的线程
  Self.FWorkThreadList.LockList;
  Try
    for I := 0 to Self.FWorkThreadList.Count - 1 do
    begin
      AWorkThread:=TWorkThread(Self.FWorkThreadList[I]);
      if Not AWorkThread.IsReference and Not AWorkThread.IsRunning then
      begin
        Result:=AWorkThread;
        Break;
      end;
    end;
    //添加新的工作线程
    if Result=nil then
    begin
      AWorkThread:=Self.FWorkThreadClass.Create(True);
      Self.FWorkThreadList.Add(AWorkThread);
      Result:=AWorkThread;
    end;
    //设置正在使用
    Result.IsReference:=True;
  Finally
    Self.FWorkThreadList.UnLockList;
  End;
end;

function TWorkThreadPool.RecyleWorkThread(AWorkThread:TWorkThread): Boolean;
begin
  //设置没有使用
  AWorkThread.IsReference:=False;
end;

end.
