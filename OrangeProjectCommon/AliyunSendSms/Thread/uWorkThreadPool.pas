//��������//
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
  //{$Region '�����߳�'}
  TWorkThreadClass=class of TWorkThread;
  TWorkThread=class(TThread)
  private
    //�Ƿ�ֹͣ
    FIsStop:Boolean;
    //�߳��Ƿ���������
    FIsRunning:Boolean;
    //�����¼�
    FResumeEvent:TEvent;
    //�Ƿ�����
    FIsReference:Boolean;
    FUseComInThread: Boolean;
    //�Ƿ���ͣ
    function GetIsPause: Boolean;
  protected
    //�߳�ID
    FThreadID:String;
    procedure DoExecute;virtual;
    procedure Execute;override;
  public
    constructor Create(ASuspended:Boolean);virtual;
    Destructor Destroy;override;
  public
    //ֹͣ
    procedure Stop;virtual;
    //��ͣ
    procedure Pause;virtual;
    //����
    procedure Continue;virtual;
    //�����߳�
    procedure Start;virtual;
    //�Ƿ���������
    function IsRunning:Boolean;virtual;
    //�Ƿ��Ѿ�ֹͣ
    property IsStop:Boolean read FIsStop;
    //�Ƿ��Ѿ���ͣ
    property IsPause:Boolean read GetIsPause;
    //�����¼�
    property ResumeEvent:TEvent read FResumeEvent;
    //�Ƿ�����
    property IsReference:Boolean read FIsReference write FIsReference;
    //�Ƿ����߳���ʹ��COM
    property UseComInThread:Boolean read FUseComInThread write FUseComInThread;
  end;

  //{$EndRegion}

  //{$Region '�����̳߳�'}
  TWorkThreadPool=class
  private
    //�����߳�������
    FWorkThreadClass:TWorkThreadClass;
    //�����߳��б�
    FWorkThreadList:TWorkThreadList;
  public
    constructor Create(AWorkThreadClass:TWorkThreadClass);
    destructor Destroy;override;
  public
    //��ȡһ���߳�
    function GetWorkThread:TWorkThread;
    //����һ���߳�
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

  //ֹͣ
  FIsStop:=True;
  //δ����
  FIsRunning:=False;
  //�Ƿ�����
  FIsReference:=False;
  //�Ƿ����߳���ʹ��COM
  FUseComInThread:=True;
  //�߳�ID
  FThreadID:=IntToStr(Inherited ThreadID);
  //�����¼�
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
  //�����߳�������
  FWorkThreadClass:=AWorkThreadClass;
  //�����߳��б�
  FWorkThreadList:=TWorkThreadList.Create;
end;

destructor TWorkThreadPool.Destroy;
begin
  //�ͷŹ����߳��б�
  FWorkThreadList.Free;
  inherited;
end;

function TWorkThreadPool.GetWorkThread: TWorkThread;
var
  I: Integer;
  AWorkThread:TWorkThread;
begin
  Result:=nil;
  //��ȡû�б�ʹ�õ��߳�
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
    //����µĹ����߳�
    if Result=nil then
    begin
      AWorkThread:=Self.FWorkThreadClass.Create(True);
      Self.FWorkThreadList.Add(AWorkThread);
      Result:=AWorkThread;
    end;
    //��������ʹ��
    Result.IsReference:=True;
  Finally
    Self.FWorkThreadList.UnLockList;
  End;
end;

function TWorkThreadPool.RecyleWorkThread(AWorkThread:TWorkThread): Boolean;
begin
  //����û��ʹ��
  AWorkThread.IsReference:=False;
end;

end.
