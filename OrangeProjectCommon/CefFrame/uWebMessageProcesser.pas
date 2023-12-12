unit uWebMessageProcesser;

interface


uses
  SysUtils,
  Classes,
  uCEFProcess,
  uBaseLog,
  uBaseList;


type
  TWebMessageProcesser=class;

  TWebMessageProcessThread=class(TThread)
  public
    FWebMessageProcesser:TWebMessageProcesser;
    procedure Execute;override;
    constructor Create(ACreateSuspended:Boolean;AWebMessageProcesser:TWebMessageProcesser);
  end;

  //��ҳ��Ϣ����
  TWebMessageProcesser=class(TSkinObjectChangeManager)
  private
    FWebMessageProcessThread:TWebMessageProcessThread;

  public
    //���յ�����Ϣ�б�
    FGetedMessageList: TCEFMessageContentList;
    constructor Create(AOwner:TObject);override;
    destructor Destroy;override;
  end;


function GetGlobalWebMessageProcesser:TWebMessageProcesser;
procedure FreeGlobalWebMessageProcesser;

implementation

var
  GlobalWebMessageProcesser:TWebMessageProcesser;


function GetGlobalWebMessageProcesser:TWebMessageProcesser;
begin
  if GlobalWebMessageProcesser=nil then
  begin
    GlobalWebMessageProcesser:=TWebMessageProcesser.Create(nil);
  end;
  Result:=GlobalWebMessageProcesser;

end;

procedure FreeGlobalWebMessageProcesser;
begin
  FreeAndNil(GlobalWebMessageProcesser);
end;

{ TWebMessageProcesser }

constructor TWebMessageProcesser.Create(AOwner: TObject);
begin
  inherited;

  //���յ�����Ϣ�б�
  FGetedMessageList:=TCEFMessageContentList.Create();

  FWebMessageProcessThread:=TWebMessageProcessThread.Create(False,Self);

end;

destructor TWebMessageProcesser.Destroy;
begin
  if FWebMessageProcessThread<>nil then
  begin
    FWebMessageProcessThread.Terminate;
    FWebMessageProcessThread.WaitFor;
    FreeAndNil(FWebMessageProcessThread);
  end;
  FreeAndNil(FGetedMessageList);

  inherited;
end;

{ TWebMessageProcessThread }

constructor TWebMessageProcessThread.Create(ACreateSuspended: Boolean;
  AWebMessageProcesser: TWebMessageProcesser);
begin
  Inherited Create(ACreateSuspended);
  FWebMessageProcesser:=AWebMessageProcesser;
end;

procedure TWebMessageProcessThread.Execute;
var
  ACEFMessageContent:TCEFMessageContent;
begin
  inherited;
  while not Self.Terminated do
  begin
    ACEFMessageContent:=nil;
    FWebMessageProcesser.FGetedMessageList.Lock;
    try
      if FWebMessageProcesser.FGetedMessageList.Count>0 then
      begin
        ACEFMessageContent:=FWebMessageProcesser.FGetedMessageList.Items[0];
        FWebMessageProcesser.FGetedMessageList.Delete(0,False);
      end;
    finally
      FWebMessageProcesser.FGetedMessageList.UnLock;
    end;

    if ACEFMessageContent=nil then
    begin
      Sleep(1000);
      continue;
    end;

    try
      try
        FWebMessageProcesser.DoChange(FWebMessageProcesser,
                                      ACEFMessageContent.ID,
                                      //AMessageID,һ��ΪJson AMessageDataStr
                                      ACEFMessageContent.Data,
                                      '',
                                      //AMessageData
                                      ACEFMessageContent.WebBrowserFrame);
      except
        on E:Exception do
        begin
          uBaseLog.HandleException(E,'TWebMessageProcessThread.Execute MessageID:'+ACEFMessageContent.ID)
        end;
      end;
    finally
      FreeAndNil(ACEFMessageContent);
    end;

  end;
end;

initialization

finalization
  FreeGlobalWebMessageProcesser;

end.
