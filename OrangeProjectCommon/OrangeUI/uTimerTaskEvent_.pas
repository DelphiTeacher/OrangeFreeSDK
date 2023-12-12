//convert pas to utf8 by
unit uTimerTaskEvent;


interface
{$I FrameWork.inc}

uses
  SysUtils,
  Classes,

  {$IFDEF FMX}
  FMX.Types,
  FMX.Forms,
  {$ENDIF}
  {$IFDEF VCL}
  ExtCtrls,
  {$ENDIF}

  uLang,
  uBaseList,
  uTimerTask,
  uFuncCommon;




type
//  {$I Source\Controls\ComponentPlatformsAttribute.inc}
  //�߳������¼����
  TTimerTaskEvent=class(TComponent)
  private
    FOnBegin:TTimerTaskNotify;
    FOnExecuteEnd: TTimerTaskNotify;
    FOnExecute: TTimerTaskNotify;
    FTaskTag: Integer;
    FTaskID: Integer;
    FTaskName:String;
    FTaskParams: TTaskParamList;
    FTaskOtherInfo: TStringList;
    //Ϊ�˲������͸ĳ�
    procedure DoExecute(Sender:TObject);
    procedure DoExecuteEnd(Sender:TObject);
    procedure SetTaskOtherInfo(const Value: TStringList);
  public
    function CreateTimerTask:TTimerTask;
    //����
    function Run(const AIsStandalone:Boolean=False):TTimerTask;
    //����
    property TaskParams:TTaskParamList read FTaskParams;
  public
    TaskObject:TObject;
//    PageIndex:Integer;
//    PageSize:Integer;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;

  published
    property TaskID:Integer read FTaskID write FTaskID;
    property TaskName:String read FTaskName write FTaskName;
    property TaskTag:Integer read FTaskTag write FTaskTag;
    property TaskOtherInfo:TStringList read FTaskOtherInfo write SetTaskOtherInfo;
    //��Ҫ���߳���ִ�еķ���
    property OnBegin:TTimerTaskNotify read FOnBegin write FOnBegin;
    //��Ҫ���߳���ִ�еķ���
    property OnExecute:TTimerTaskNotify read FOnExecute write FOnExecute;
    //ִ�н���(�����߳��е���)
    property OnExecuteEnd:TTimerTaskNotify read FOnExecuteEnd write FOnExecuteEnd;
  end;





//  //����Rest�ӿڵ��¼�,����String
//  TCallRestAPIEvent=function(Sender:TObject;ATimerTask:TTimerTask):String of object;
//  //����Rest�ӿڵõ�����֮��,���ص�������
//  TLoadAPIResponseToUIEvent=procedure(Sender:TObject;ATimerTask:TTimerTask;AAPIResponse:String) of object;
//  {$I Source\Controls\ComponentPlatformsAttribute.inc}
//  //����
//  TCallRestAPITimerTaskEvent=class(TComponent)
//  private
//    FWaitingMsg: String;
//    FRestAPIName: String;
//    FOnCallRestAPI: TCallRestAPIEvent;
//    FOnLoadAPIResponseToUI:TLoadAPIResponseToUIEvent;
//  public
//    procedure DoExecute(ATimerTask:TObject);
//    procedure DoExecuteEnd(ATimerTask:TObject);
//  public
//    //����
//    function Run:TTimerTask;
//  published
//    //�ӿڵ�����
//    property RestAPIName: String read FRestAPIName write FRestAPIName;
//    //�ȴ�����ʾ�ı�
//    property WaitingMsg:String read FWaitingMsg write FWaitingMsg;
//    //����Rest�ӿڵ��¼�
//    property OnCallRestAPI:TCallRestAPIEvent read FOnCallRestAPI write FOnCallRestAPI;
//    //����Rest�ӿڵõ�����֮��,���ص�������
//    property OnLoadAPIResponseToUI:TLoadAPIResponseToUIEvent read FOnLoadAPIResponseToUI write FOnLoadAPIResponseToUI;
//  end;



implementation



{ TTimerTaskEvent }

constructor TTimerTaskEvent.Create(AOwner: TComponent);
begin
  inherited;

  FTaskParams:=TTaskParamList.Create;
  FTaskOtherInfo:=TStringList.Create;

end;

function TTimerTaskEvent.CreateTimerTask: TTimerTask;
begin
  Result:=TTimerTask.Create(FTaskID);
  Result.TaskTag:=FTaskTag;
  //������־��ʾ
  if FTaskName='' then
  begin
    Result.TaskName:=Self.Name;
  end
  else
  begin
    Result.TaskName:=FTaskName;
  end;

//  Result.PageIndex:=PageIndex;
//  Result.PageSize:=PageSize;

  Result.TaskObject:=TaskObject;

  Result.OnExecute:=DoExecute;
  Result.OnExecuteEnd:=DoExecuteEnd;
  Result.TaskOtherInfo.Assign(TaskOtherInfo);

end;

destructor TTimerTaskEvent.Destroy;
begin
  FreeAndNil(FTaskParams);
  FreeAndNil(FTaskOtherInfo);
  inherited;
end;

procedure TTimerTaskEvent.DoExecute(Sender: TObject);
begin
//  TThread.Synchronize(nil,procedure
//  begin
//    if Assigned(Self.FOnBegin) then
//    begin
//      FOnBegin(TTimerTask(Result));
//    end;
//  end);


  if Assigned(Self.FOnExecute) then
  begin
    FOnExecute(TTimerTask(Sender));
  end;
end;

procedure TTimerTaskEvent.DoExecuteEnd(Sender: TObject);
begin
  if Assigned(Self.FOnExecuteEnd) then
  begin
    FOnExecuteEnd(TTimerTask(Sender));
  end;
end;

function TTimerTaskEvent.Run(const AIsStandalone:Boolean): TTimerTask;
begin
  Result:=CreateTimerTask;

  //�������������������,���÷ŵ�Thread��
  TThread.Synchronize(nil,procedure
  begin
    if Assigned(Self.FOnBegin) then
    begin
      FOnBegin(nil);
    end;
  end);


  GetGlobalTimerThread.RunTask(Result,AIsStandalone);
end;

procedure TTimerTaskEvent.SetTaskOtherInfo(const Value: TStringList);
begin
  FTaskOtherInfo.Assign(Value);
end;

//{ TCallRestAPITimerTaskEvent }
//
//procedure TCallRestAPITimerTaskEvent.DoExecute(ATimerTask: TObject);
//begin
//
//  try
//      //����
//      TTimerTask(ATimerTask).TaskTag:=TASK_FAIL;
//
//      TThread.Synchronize(nil,procedure
//      begin
//        if Self.FWaitingMsg<>'' then
//        begin
//          GlobalShowWaiting(Application.MainForm,FWaitingMsg);
//        end;
//      end);
//
//
//      //���ýӿ�
//      if Assigned(Self.OnCallRestAPI) then
//      begin
//        TTimerTask(ATimerTask).TaskDesc:=OnCallRestAPI(Self,TTimerTask(ATimerTask));
//      end;
//
//
//      TTimerTask(ATimerTask).TaskTag:=TASK_SUCC;
//  except
//    on E:Exception do
//    begin
//      //�쳣
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;
//end;
//
//procedure TCallRestAPITimerTaskEvent.DoExecuteEnd(ATimerTask: TObject);
//var
//  ASuperObject:ISuperObject;
//begin
//  try
//    if TTimerTask(ATimerTask).TaskTag=TASK_SUCC then
//    begin
//      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
//      if ASuperObject.I['Code']=200 then
//      begin
//          //�ӿڷ��سɹ�
//          if Assigned(Self.FOnLoadAPIResponseToUI) then
//          begin
//            FOnLoadAPIResponseToUI(Self,
//                                  TTimerTask(ATimerTask),
//                                  TTimerTask(ATimerTask).TaskDesc);
//          end;
//      end
//      else
//      begin
//          //�ӿڷ���ʧ��
//          if ASuperObject.S['Desc']='' then
//          begin
//            GlobalShowMessageBox(nil,'�ӿ�'+Self.FRestAPIName+'����ʧ��!','');
//          end
//          else
//          begin
//            GlobalShowMessageBox(nil,ASuperObject.S['Desc'],'');
//          end;
//      end;
//
//    end
//    else if TTimerTask(ATimerTask).TaskTag=1 then
//    begin
//      //�����쳣
//      GlobalShowMessageBox(nil,Trans('�����쳣,����������������!'),TTimerTask(ATimerTask).TaskDesc);
//    end;
//  finally
//    GlobalHideWaiting;
//  end;
//end;
//
//function TCallRestAPITimerTaskEvent.Run: TTimerTask;
//begin
//  Result:=TTimerTask.Create(0);
//  Result.OnExecute:=DoExecute;
//  Result.OnExecuteEnd:=DoExecuteEnd;
//  GetGlobalTimerThread.RunTask(Result);
//end;
//



end.
