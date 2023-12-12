//�����а���
unit uCommandLineHelper;



interface

uses
  SysUtils, Types, Classes, Variants,

  {$IFDEF IN_ORANGESDK}
  uFuncCommon_Copy,
  uBaseList_Copy,
  uBaseLog_Copy,
  {$ELSE}
  uFuncCommon,
  uBaseList,
  uBaseLog,
  {$ENDIF}


  {$IFDEF MSWINDOWS}
  Windows,
//  Forms,
  ShellAPI,
  {$ENDIF}


//  {$IFDEF LINUX}
//  uLinuxShell,
//  {$ENDIF}
  {$IFDEF LINUX}
  Posix.Unistd,
  Posix.SysTypes,
  Posix.Signal,
  Posix.Semaphore,
  {$ENDIF}


  {$IF CompilerVersion <= 21.0} // D2010֮ǰ
  SuperObject,
  superobjecthelper,
  {$ELSE}
    //D2010֮��
    {$IFDEF IN_ORANGESDK}
    XSuperObject_Copy,
    {$ELSE}
    XSuperObject,
    XSuperJson,
    {$ENDIF}
  {$IFEND}


  XMLDoc,
  XMLIntf;


const
  Const_CommandLineDataBegin='CommandLineDataBegin';
  Const_CommandLineDataEnd='CommandLineDataEnd';


type
  //��ȡ������������ı����¼�
  TGetCommandLineOutputEvent=procedure(ACommandLine:String;ATag:String;AOutput:String) of object;
  TGetCommandLineBufferEvent=procedure(ABuffer:Pointer;ABytesRead: Cardinal;ABufferSize:Cardinal) of object;
  TGetLogEvent=procedure(Sender:TObject;ALog:String) of object;
  TGetDataEvent=procedure(Sender:TObject;AData:String;ADataJson:ISuperObject) of object;


  TExecuteCommand=class;

  //����������,��ʲô��ͷ,��ʲô��ʾ����,
  //CommandLineDataBegin��ʾ��ʼ����CommandLineDataEnd��ʾ������Ȼ���м���json
  //��������,��Щ����־����Щ������Ҫ�����ݿ�
  TCommandLineData=class
    Data:String;
    DataJson:ISuperObject;
  end;
  TCommandLineDataList=class(TBaseList)
  private
    function GetItem(Index: Integer): TCommandLineData;
  public
    function Find(AFunctionName:String):TCommandLineData;
    property Items[Index:Integer]:TCommandLineData read GetItem;default;
  end;



  //�������������е����,��ȡ����е���־�ͷ��ص�JSON����
  TCommandLineOutputHelper=class
  public
    FOnGetData:TGetDataEvent;
    FOnGetLog:TGetLogEvent;

    FReadedDataString:AnsiString;
    FLastBuffer:AnsiString;
//    FReadedDataString:String;
    FCommandLineDataList:TCommandLineDataList;
    procedure DoGetCommandLineOutput(ACommandLine:String;ATag:String;AOutput:String);
    //��ȡ�������е�������
    procedure DoGetCommandLineBufferEvent(ABuffer:Pointer;ABytesRead: Cardinal;ABufferSize:Cardinal;var AData:String);

    constructor Create;
    destructor Destroy;override;
  end;




  //ִ�������е��߳�
  TReadPipeThread=class(TThread)
  public
    FExecuteCommand:TExecuteCommand;

    procedure Execute;override;

  public
    constructor Create(ACreateSuspended:Boolean;
                        AExecuteCommand:TExecuteCommand
                        );
    destructor Destroy;override;
  end;


  //�������write�Ĺܵ�,���н��̶������ݾͿ�����,����һֱ�ڵ�����,ֱ��д�ܵ����ر�
  TPipeUseType=(putReadFromStdout,putWriteToStdin);
  TExecuteCommand=class(TComponent)
  public
    {$IFDEF MSWINDOWS}
    //������Ϣ
    FPI: TProcessInformation;
    //�����ض�λ�ӳ��������ܵ�
    StdOutPipeRead, StdOutPipeWrite: THandle;
    //�����ض�λ�ӳ��������ܵ�
    StdinPipeRead, StdinPipeWrite: THandle;
    //��������,��Ҫ�ܵ�
    function CreateProcessOnWindows(var ADesc:String):Boolean;
//    procedure PipeReadOnWindows;
    {$ENDIF}
  private

    {$IFDEF LINUX}
//    Handle: TStreamHandle;
    child_pid: pid_t;
    fd_stdout:Array [0..1] of Integer;//��һ���Ƕ���,�ڶ�����д��
    fd_stdin:Array [0..1] of Integer;//��һ���Ƕ���,�ڶ�����д��

    function CreateProcessOnLinux(var ADesc:String):Boolean;
    {$ENDIF}
  private
    Buffer: array [0 .. 2000] of AnsiChar;
    BytesRead: Cardinal;
    //���ݶ�ȡ��,�Ὣ���̵����ݶ��ͷŵ�,����Ҫ�ֶ�����ProcessKilled
    FReadPipeThread:TReadPipeThread;
    //��������,��Ҫ�ܵ�
    function CreateProcess(var ADesc:String):Boolean;
    //������ܵ���ȡ����
    procedure PipeReadLoop(AReadPipeThread:TReadPipeThread);
    //����ִ����֮��,�رչܵ�
    procedure ProcessKilled;
  public
    //������
    FProgramFilePath:String;
    //������
    FCommandLine:String;
    FParams:String;
    //����·��
    FWorkDir:String;
    //��־��ʶ
    FTag:String;
//    //������Ϣ
//    FPI: TProcessInformation;
    //��ȡ��������¼�
    FOnGetCommandLineOutput:TGetCommandLineOutputEvent;
    //ִ�н������¼�
    FOnExecuteEnd:TNotifyEvent;
    //��ȡ�������¼�
    FOnGetData:TGetDataEvent;
    //��ȡ����־�¼�
    FOnGetLog:TGetLogEvent;
    FPipeUseTypes:set of TPipeUseType;

    //�˳����������
    FTerminateCommand:String;


    FIsRunning:Boolean;

    FCommandLineOutputHelper:TCommandLineOutputHelper;
    FOtherCommandLineOutputHelper:TCommandLineOutputHelper;
  public
    //����
    function Execute(AIsSync:Boolean;//ͬ�������첽
                    var ADesc:String;
                    AIsNeedStartPipeReadThread:Boolean=True):Boolean;
    //д���ݵ�����ܵ�
    function WriteToStdinPipe(AInput:String):Boolean;

    //�ӹܵ���ȡ����
    function Read(var ABufferStr:String;var AData:String):Boolean;

    //��������
    procedure StopProcess(AWaitTimeout:Integer=10*1000);
    //�ȴ�����ִ����,�ȴ����ݶ�ȡ��
    procedure WaitForStop(AWaitTimeout:Integer=10*1000);
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  end;




//  {$IFDEF MSWINDOWS}
//ִ��������,��ȡ�����еĽ��
function ExecuteCommand(AProgramFilePath:String;ACommandLine: string;AParams:String;
                        AWorkDir: string;
                        ATag:String;
                        //��ȡ������������¼�,��ΪҪ�ڽ����������
                        AOnGetCommandLineOutput:TGetCommandLineOutputEvent;
//                        var PI: TProcessInformation;
                        ACommandLineOutputHelper:TCommandLineOutputHelper;
                        var ADesc:String):Boolean;
//function ExecuteCommand_Windows(AProgramFilePath:String;ACommandLine: string;
//                              AWorkDir: string;
//                              ATag:String;
//                              //��ȡ������������¼�,��ΪҪ�ڽ����������
//                              AOnGetCommandLineOutput:TGetCommandLineOutputEvent;
//      //                        var PI: TProcessInformation;
//                              ACommandLineOutputHelper:TCommandLineOutputHelper=nil):String;
//  {$ENDIF}
//  {$IFDEF LINUX}
//function ExecuteCommand_OnLinux(AProgramFilePath:String;ACommandLine: string;
//                              AWorkDir: string;
//                              ATag:String;
//                              //��ȡ������������¼�,��ΪҪ�ڽ����������
//                              AOnGetCommandLineOutput:TGetCommandLineOutputEvent;
//      //                        var PI: TProcessInformation;
//                              ACommandLineOutputHelper:TCommandLineOutputHelper=nil):String;
//  {$ENDIF}

function ExecuteCommandProcess(ACommandLine: string;
                              AWorkDir: string;
                              AParams:String=''):String;




//var
////  GlobalCommandLineOutputHelper:TCommandLineOutputHelper;
//  GlobalOnGetCommandLineOutput:TGetCommandLineOutputEvent;

implementation



////ִ��������,��ȡ�����еĽ��
//function ExecuteCommand(AProgramFilePath:String;ACommandLine: string;
//                        AWorkDir: string;
//                        ATag:String;
//                        //��ȡ������������¼�,��ΪҪ�ڽ����������
//                        AOnGetCommandLineOutput:TGetCommandLineOutputEvent;
////                        var PI: TProcessInformation;
//                        ACommandLineOutputHelper:TCommandLineOutputHelper=nil):String;
//begin
//  Result:='';
//
//  {$IFDEF MSWINDOWS}
//  Result:=ExecuteCommand_Windows(AProgramFilePath,ACommandLine,AWorkDir,ATag,AOnGetCommandLineOutput,ACommandLineOutputHelper);
//  {$ENDIF}
//
//
//  {$IFDEF LINUX}
//  Result:=ExecuteCommand_Linux(AProgramFilePath,ACommandLine,AWorkDir,ATag,AOnGetCommandLineOutput,ACommandLineOutputHelper);
//  {$ENDIF}
//
//
//end;


//  {$IFDEF LINUX}
//function ExecuteCommand_OnLinux(AProgramFilePath:String;ACommandLine: string;
//                              AWorkDir: string;
//                              ATag:String;
//                              //��ȡ������������¼�,��ΪҪ�ڽ����������
//                              AOnGetCommandLineOutput:TGetCommandLineOutputEvent;
//      //                        var PI: TProcessInformation;
//                              ACommandLineOutputHelper:TCommandLineOutputHelper=nil):String;
//begin
//
//end;
//  {$ENDIF}


//  {$IFDEF MSWINDOWS}
function ExecuteCommand(AProgramFilePath:String;
                        ACommandLine:String;
                        AParams:String;
                        AWorkDir:String;
                        ATag:String;
                        AOnGetCommandLineOutput:TGetCommandLineOutputEvent;
//                        var PI: TProcessInformation;
                        ACommandLineOutputHelper:TCommandLineOutputHelper;
                        var ADesc:String):Boolean;
//var
//  SA: TSecurityAttributes;
//  SI: TStartupInfo;
//  FPI: TProcessInformation;
//  StdOutPipeRead, StdOutPipeWrite: THandle;
//  WasOK: Boolean;
//  Handle: Boolean;
//
////  APosIndex:Integer;
////  ABufferSubStr: array [0 .. 2000] of AnsiChar;
////  ABuffer:PAnsiChar;
//  Buffer: array [0 .. 2000] of AnsiChar;
//  BytesRead: Cardinal;
////  AWorkDir: string;
var
  AExecuteCommand:TExecuteCommand;
begin
  Result := False;
  ADesc:='';

  AExecuteCommand:=TExecuteCommand.Create(nil);
  try

    AExecuteCommand.FProgramFilePath:=AProgramFilePath;
    AExecuteCommand.FCommandLine:=ACommandLine;
    AExecuteCommand.FParams:=AParams;
    AExecuteCommand.FWorkDir:=AWorkDir;
    AExecuteCommand.FTag:=ATag;
    AExecuteCommand.FOnGetCommandLineOutput:=AOnGetCommandLineOutput;
    AExecuteCommand.FOtherCommandLineOutputHelper:=ACommandLineOutputHelper;

  //  Result:=AExecuteCommand.Execute(True,ADesc);
    Result:=AExecuteCommand.Execute(True,ADesc);
  //  if ACommandLineOutputHelper<>nil then
  //  begin
  //    AExecuteCommand.FOnGetCommandLineOutput:=ACommandLineOutputHelper.FOnGetCommandLineOutput;
  //    AExecuteCommand.FOnExecuteEnd:=ACommandLineOutputHelper.FOnExecuteEnd;
  //    AExecuteCommand.FOnGetData:=ACommandLineOutputHelper.FOnGetData;
  //    AExecuteCommand.FOnGetLog:=ACommandLineOutputHelper.FOnGetLog;
  //  end;
  finally
    FreeAndNil(AExecuteCommand);
  end;

end;

//  {$ENDIF}

function ExecuteCommandProcess(ACommandLine:String;
                                AWorkDir:String;
                                AParams:String):String;
//  {$IFDEF MSWINDOWS}
//var
//  SA: TSecurityAttributes;
//  SI: TStartupInfo;
//  Handle: Boolean;
//  {$ENDIF};
//                              var PI: TProcessInformation
begin
  {$IFDEF MSWINDOWS}
//  ShellExecute(0,'open',PWideChar(ACommandLine),'',PWideChar(AWorkDir),SW_SHOWNORMAL);
  ShellExecute(0,'open',PWideChar(ACommandLine),PWideChar(AParams),PWideChar(AWorkDir),
              SW_HIDE
              );
//  {$IFDEF MSWINDOWS}
//  Result := '';
//
//  with SA do
//  begin
//    nLength := SizeOf(SA);
//    bInheritHandle := True;
//    lpSecurityDescriptor := nil;
//  end;
//
//  with SI do
//  begin
//    FillChar(SI, SizeOf(SI), 0);
//    cb := SizeOf(SI);
//    dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
////    wShowWindow := SW_HIDE;
//    wShowWindow := SW_SHOW;
//  end;
//
//  Handle := CreateProcess(nil, PChar(ACommandLine), nil, nil,
//                          True, 0, nil, PChar(AWorkDir), SI, PI);
//
//  {$ENDIF}
  {$ENDIF}

end;



{ TCommandLineOutputHelper }


procedure TCommandLineOutputHelper.DoGetCommandLineOutput(ACommandLine, ATag,AOutput: String);
begin
  if ATag<>'' then
  begin
    Writeln(Output,ATag+':'+AOutput);
  end
  else
  begin
    Writeln(Output,AOutput);
  end;


end;

constructor TCommandLineOutputHelper.Create;
begin
  FCommandLineDataList:=TCommandLineDataList.Create;

end;

destructor TCommandLineOutputHelper.Destroy;
begin
  FreeAndNil(FCommandLineDataList);
  inherited;
end;

procedure TCommandLineOutputHelper.DoGetCommandLineBufferEvent(ABuffer: Pointer;
  ABytesRead: Cardinal;ABufferSize:Cardinal;var AData:String);
var
//  ABeginIndex:Integer;
  AIndex:Integer;

  ALog:AnsiString;
  AAnsiData:AnsiString;
//  ALog:String;
//  AData:String;
  ABufferStr:String;

  ADataJson:ISuperObject;
  AHasCommandLineDataBegin:Boolean;
  AHasCommandLineDataEnd:Boolean;
  ACommandLineData:TCommandLineData;
  I: Integer;
//  AStartIndex:Integer;
//  AEndIndex:Integer;
begin
  AAnsiData:='';
  AData:='';

  ABufferStr:=PAnsiChar(ABuffer);


//  HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent ABuffer:'+PAnsiChar(ABuffer));
//  HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent FReadedDataString:'+FReadedDataString);


  FLastBuffer:=ABufferStr;

//  if Length(FReadedDataString+PAnsiChar(ABuffer))<Length(FReadedDataString) then
//  begin
//    HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent Error');
//  end;
  
  FReadedDataString:=FReadedDataString+PAnsiChar(ABuffer);


  ALog:='';

  //ȡ�������ݰ�,��־
//  AStartIndex:=1;
  I:=1;
  while I < Length(FReadedDataString)+1 do
  begin
    if FReadedDataString[I]=#10 then
    begin
        //�ж�ǰһ���ǲ���#13
        if (I>1) and (FReadedDataString[I-1]=#13) then
        begin
          ALog:=Copy(FReadedDataString,1,I-2);
        end
        else
        begin
          ALog:=Copy(FReadedDataString,1,I-1);
        end;
        //���һ��һ�е�
        if Assigned(FOnGetLog) then
        begin
          FOnGetLog(Self,ALog);
        end;

        //�ж����ǲ�������
        if Copy(FReadedDataString,1,Length(Const_CommandLineDataBegin))=Const_CommandLineDataBegin then
        begin
            //������
            AHasCommandLineDataEnd:=True;
            //'CommandLineDataBegin {"Code": 200, "Desc": "\u8fdb\u7a0b\u542f\u52a8\u6210\u529f", "FunctionName": "execute"} CommandLineDataEnd'
            //ȥ��CommandLineDataBegin��CommandLineDataEnd
            AAnsiData:=Copy(ALog,Length('CommandLineDataBegin ')+1,Length(ALog)-Length('CommandLineDataBegin ')-Length(' CommandLineDataEnd'));
//            AAnsiData:=ALog;//Copy(AAnsiData,Length(Const_CommandLineDataBegin)+1,MaxInt);
            HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent Data:'+AAnsiData);
            ADataJson:=nil;
            try
              ADataJson:=SO(AAnsiData);
            except

            end;
            //��һ��������,����������
            if Assigned(FOnGetData) then
            begin
              FOnGetData(Self,AAnsiData,ADataJson);
            end;

            //��¼����,���ǲ���������������ɴ洢̫�����ݣ�ռ���ڴ�
            ACommandLineData:=TCommandLineData.Create;
            ACommandLineData.Data:=AAnsiData;
            ACommandLineData.DataJson:=ADataJson;
            FCommandLineDataList.Add(ACommandLineData);

            //���ػ�ȡ��������
            AData:=AAnsiData;

        end;

        FReadedDataString:=Copy(FReadedDataString,I+1,MaxInt);
        I:=1;
        continue;
    end;
    Inc(I);
  end;

//  Exit;
//
//  repeat
//
//
//      ALog:='';
//      AHasCommandLineDataBegin:=PosAndCutAnsiString(Const_CommandLineDataBegin,FReadedDataString,ALog,AIndex,False);
//  //    AHasCommandLineDataBegin:=PosAndCutString(Const_CommandLineDataBegin,FReadedDataString,ALog,AIndex,False);
//
//
////      if not AHasCommandLineDataBegin
////        //���ݶ�ȡ����,�������ݶ����˿϶��ǻس�Ϊ׼
////        and (ABytesRead<ABufferSize) then
////      begin
////        ALog:=FReadedDataString;
////        FReadedDataString:='';
////      end;
//
//
//      if (ALog<>'') then
//      begin
//
//
//          HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent Log:'+ALog);
//
//          //���һ��һ�е�
//
//          if Assigned(FOnGetLog) then
//          begin
//            FOnGetLog(Self,ALog);
//          end;
//
//      end;
//
//
//
//
//      AHasCommandLineDataEnd:=False;
//      if not AHasCommandLineDataBegin then//û�����ݰ�
//      begin
////        HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent No CommandLineDataBegin');
//        continue;
//      end;
////      HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent Has CommandLineDataBegin AIndex��'+IntToStr(AIndex));
//
//        //ȡ�����ݰ�
//        AAnsiData:='';
//        if not PosAndCutAnsiString(Const_CommandLineDataEnd,FReadedDataString,AAnsiData,AIndex,True) then
//  //      if PosAndCutString(Const_CommandLineDataEnd,FReadedDataString,AAnsiData,AIndex,True) then
//        begin
//          //���ݰ�û�н���
////          HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent No CommandLineDataEnd');
//          continue;
//        end;
////      HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent Has CommandLineDataEnd AIndex��'+IntToStr(AIndex));
//
////            //ȥ���������־
////            AStartIndex:=Pos('log_begin',AAnsiData);
////            AEndIndex:=Pos('log_end',AAnsiData);
////            if (AStartIndex>0) or (AEndIndex>0) then
////            begin
////              AAnsiData:=Copy(AAnsiData,1,AStartIndex-1)+Copy(AAnsiData,AEndIndex+Length('log_end'),MaxInt);
////            end;
//
//            AHasCommandLineDataEnd:=True;
//            AAnsiData:=Copy(AAnsiData,Length(Const_CommandLineDataBegin)+1,MaxInt);
//            HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent Data:'+AAnsiData);
//            ADataJson:=nil;
//            try
//              ADataJson:=SO(AAnsiData);
//            except
//
//            end;
//            //��һ��������,����������
//            if Assigned(FOnGetData) then
//            begin
//              FOnGetData(Self,AAnsiData,ADataJson);
//            end;
//
//            //��¼����,���ǲ���������������ɴ洢̫�����ݣ�ռ���ڴ�
//            ACommandLineData:=TCommandLineData.Create;
//            ACommandLineData.Data:=AAnsiData;
//            ACommandLineData.DataJson:=ADataJson;
//            FCommandLineDataList.Add(ACommandLineData);
//
//            //���ػ�ȡ��������
//            AData:=AAnsiData;
//
//
//  until not AHasCommandLineDataEnd;

end;


{ TReadPipeThread }


destructor TReadPipeThread.Destroy;
begin
  Inherited;
end;

constructor TReadPipeThread.Create(ACreateSuspended: Boolean;
  AExecuteCommand:TExecuteCommand
  );
begin
  Inherited Create(False);

  FExecuteCommand:=AExecuteCommand;


end;

procedure TReadPipeThread.Execute;
begin
  inherited;

  FExecuteCommand.PipeReadLoop(Self);


  FExecuteCommand.ProcessKilled;

end;

{ TExecuteCommand }

destructor TExecuteCommand.Destroy;
begin

  //�������������,��ô��������
  Self.StopProcess;


  FreeAndNil(FCommandLineOutputHelper);
  FreeAndNil(FReadPipeThread);

  inherited;
end;

function TExecuteCommand.Execute(AIsSync:Boolean;//ͬ�������첽
                                  var ADesc:String;
                                  AIsNeedStartPipeReadThread:Boolean=True):Boolean;
begin
  Result:=CreateProcess(ADesc);

  if Result and (putReadFromStdout in Self.FPipeUseTypes) and AIsNeedStartPipeReadThread then
  begin
        FreeAndNil(FReadPipeThread);
        if AIsSync then
        begin
          //ͬ��ִ�йܵ���ȡ
          Self.PipeReadLoop(nil);

        end
        else
        begin
          //�첽ִ�йܵ���ȡ
          FReadPipeThread:=TReadPipeThread.Create(False,Self);//FProgramFilePath,FCommandLine,FWorkDir,nil,FOnExecuteEnd,FOnGetData,nil);
        end;

  end;


end;

constructor TExecuteCommand.Create(AOwner:TComponent);
begin
  Inherited;
  FCommandLineOutputHelper:=TCommandLineOutputHelper.Create;
  FPipeUseTypes:=[putReadFromStdout];
end;

function TExecuteCommand.CreateProcess(var ADesc:String): Boolean;
begin
  Result:=False;
  ADesc:='';


  {$IFDEF MSWINDOWS}
  Result:=CreateProcessOnWindows(ADesc);
  {$ENDIF}
  {$IFDEF LINUX}
  Result:=CreateProcessOnLinux(ADesc);
  {$ENDIF}

  FIsRunning:=Result;

end;

    {$IFDEF LINUX}
function TExecuteCommand.CreateProcessOnLinux(var ADesc: String): Boolean;
var
  AAnsiProgramFilePath:AnsiString;
  AAnsiCommandLine:AnsiString;
  AAnsiParams:AnsiString;
  AResult:Integer;
begin
  Result:=False;

//    AAnsiCommandLine:=FCommandLine;
//    Handle := popen(PAnsiChar(AAnsiCommandLine),'r');

  //������������˳����ӽ��̻�û�˳���ô�ӽ��̵ĸ����̽���Ϊinit���̡���ע���κ�һ�����̶������и����̣�
  //����ӽ������˳��������̻�û�˳�����ô�ӽ��̱���ȵ������̲������ӽ��̵��˳�״̬�������������������ʱ���ӽ��̾ͳ�Ϊ�����̡�
  //�ӽ����˳��ᷢ��SIGCHLD�źŸ������̣�����ѡ����Ի�ʹ���źŴ��������մ���Ϳ��Ա��⽩ʬ���̡�
  signal(SIGCHLD,TSignalHandler(SIG_IGN));        //�����ӽ����˳����ź�,���⽩ʬ����



  //����ֵ���ɹ�������0�����򷵻�-1�������������pipeʹ�õ������ļ�����������fd_stdout[0]:�ܵ����ˣ�fd_stdout[1]:�ܵ�д�ˡ�

  if pipe(@fd_stdout[0])=-1 then
  begin
      Writeln('����stdout�ܵ�ʧ��');
      Exit;
  end;


  if pipe(@fd_stdin[0])=-1 then
  begin
      Writeln('����stdin�ܵ�ʧ��');
      Exit;
  end;


  child_pid := fork;//����һ���ӽ���
  if child_pid = 0 then
  begin
        //���ӽ���
        //fork()���ӽ���Ĭ�ϼ̳и����̴򿪵Ĺܵ�


        Writeln('�ӽ��� Begin');




        //0��1��2�ֱ������̵ı�׼���롢��׼�������׼�������ļ���Ĭ�����Ѵ�״̬
        // �ر��ӽ��̵ı�׼����ܵ��Ķ���
        __close(0);
        //��Ϊ�����ض���fd_stdin[0]�� ��fd_stdin�ܵ� �Ķ���
        dup(fd_stdin[0]);

        //�ر�ԭ�������ӹܵ���ȡ���ݵ��ļ�������
        __close(fd_stdin[0]);
        //�ر�ԭ��������ܵ�д���ݵ��ļ�������
        __close(fd_stdin[1]);

        Writeln('�ӽ��� �ض���stdin�ܵ�');




        //0��1��2�ֱ������̵ı�׼���롢��׼�������׼�������ļ���Ĭ�����Ѵ�״̬
        // �ر��ӽ��̵ı�׼���
        __close(1);
        // ����dup(fd[1]])�ӹܵ�д�˸���һ�������������ļ��µ��ļ�Ϊ��С���õ��ļ���������������رյ�1�����������ǽ���׼����ض������ܵ�д��
        //��Ϊ�����ض��������fd_stdout[1]
        dup(fd_stdout[1]);

        //�ر�ԭ�������ӹܵ���ȡ���ݵ��ļ�������
        //�رչܵ�����
        __close(fd_stdout[0]);
        //�ر�ԭ��������ܵ�д���ݵ��ļ�������
        //�ر��Ѹ��Ƶ��ļ�������
        __close(fd_stdout[1]);
        Writeln('�ӽ��� �ض���stdout�ܵ�');



        //param:=PAnsiChar(GetApplicationPath+'hello.py');
        //param:='inputname.py';//PAnsiChar(GetApplicationPath+'hello.py');
        //Writeln(GetApplicationPath);


        //ִ��python����,��ͨ����ȡ�ܵ���ȡ��ӡ�Ľ��
//        execl('/usr/bin/python3',param,nil);
//        execlp('/usr/bin/python3','python3',param,nil);


        AAnsiProgramFilePath:=FProgramFilePath;
        AAnsiCommandLine:=FCommandLine;
        AAnsiParams:=FParams;
        Writeln('�ӽ��� ׼��ִ������');
        AResult:=execlp(PAnsiChar(AAnsiProgramFilePath),PAnsiChar(AAnsiCommandLine),PAnsiChar(AAnsiParams),nil);
        if AResult=-1 then
        begin
          Writeln('�ӽ��� ����ִ��ʧ��');
        end
        else
        begin
          Writeln('�ӽ��� ����ִ�гɹ�');
        end;

//        execl('/bin/ls','-l',nil);

//        system('/usr/bin/python3 hello.py');


        Writeln('�ӽ��� End');



        //�˳��ӽ���
        _exit(0);

  end;


  //�Ǹ�����




  // �ر�����ܵ�д��
  __close(fd_stdout[1]);


  // �ر�����ܵ�����
  __close(fd_stdin[0]);


  Result:=True;
end;
    {$ENDIF}

function ToPChar(const St: String): PChar;
begin
  if (St = '')
    then Result:= nil
    else Result:= PChar(St);
end;

    {$IFDEF MSWINDOWS}
function TExecuteCommand.CreateProcessOnWindows(var ADesc: String): Boolean;
var
    SA: TSecurityAttributes;
    SI: TStartupInfo;
//    APipeMode:Cardinal;
    ACommandLine:String;
begin

    //��ȫ����,TSecurityAttributes
    with SA do
    begin
      nLength := SizeOf(SA);
      bInheritHandle := True;
      lpSecurityDescriptor := nil;
    end;


    //�������̼��ͨ��
    //һ�������ض����ӽ��̵�����ܵ�stdout
    if (putReadFromStdout in FPipeUseTypes) then
    begin
      CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
//    # ���ùܵ�������
//      APipeMode:=PIPE_NOWAIT;
//      SetNamedPipeHandleState(StdOutPipeRead, APipeMode, nil, nil)
    end;

    //һ�������ض����ӽ��̵�����ܵ�stdin
    if (putWriteToStdin in FPipeUseTypes) then
    begin
      CreatePipe(StdinPipeRead, StdinPipeWrite, @SA, 0);
    end;


//  try

    //TStartupInfo
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;


      //���ж��Ƿ���Ҫ�ض�������
      //�ӽ��̴�StdinPipeRead��ȡ�û�����
      if (putWriteToStdin in FPipeUseTypes) then
      begin
  //      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
        hStdInput := StdinPipeRead;//GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      end;


      //�ӽ��̵����д�뵽StdOutPipeWrite
      if (putReadFromStdout in FPipeUseTypes) then
      begin
        hStdOutput := StdOutPipeWrite;
        hStdError := StdOutPipeWrite;
      end;
    end;




    FillChar(FPI, SizeOf(FPI), 0);



//    AWorkDir := Work;



    //https://wenku.baidu.com/view/6351a03a5aeef8c75fbfc77da26925c52cc59108.html
//    Handle := CreateProcess(nil, PChar('cmd.exe /C ' + ACommandLine), nil, nil,
//      True, 0, nil, PChar(AWorkDir), SI, PI);
    //����AProgramFilePath�ᱨ��
    ACommandLine:=FCommandLine;
    if FParams<>'' then
    begin
      ACommandLine:=ACommandLine+' '+FParams;
    end;
    Result := CreateProcessW(ToPChar(FProgramFilePath),//nil,//PWideChar(FProgramFilePath),
                            PWideChar(ACommandLine),//PWideChar(FCommandLine+' '+FParams),
                            @SA,//nil,
                            nil,
                            True,
                            CREATE_NEW_CONSOLE,//0,
                            nil,
                            //���Ϊ���ַ���,Ҫ��nil,��Ȼ�ᱨ��
                            ToPChar(FWorkDir),
                            //nil,//PWideChar(FWorkDir),
                            SI,
                            FPI);



    if (putReadFromStdout in FPipeUseTypes) then
    begin
      //�ر���stdout��д��,��Ϊд���ӽ���д,�����̲���Ҫд
      CloseHandle(StdOutPipeWrite);
      StdOutPipeWrite:=0;
    end;



    if (putWriteToStdin in FPipeUseTypes) then
    begin
      //�ر���stdin�Ķ��ˣ���Ϊ��ȡ�������ӽ��̻�ȡ,�����̲���Ҫд
      CloseHandle(StdinPipeRead);
      StdinPipeRead:=0;

    end;




    if Result then
    begin

          //���̴����ɹ�

    end
    else
    begin

        try
          //���̴���ʧ��
          RaiseLastOSError;

        except
          on E:Exception do
          begin
              HandleException(E,'TReadPipeThread.CreateProcess');
              ADesc:=E.Message;
  //          if Assigned(AOnGetCommandLineOutput) then
  //          begin
  //            AOnGetCommandLineOutput(ACommandLine,ATag,'���̴���ʧ��:'+E.Message);
  //          end;

          end;
        end;

    end;


end;
    {$ENDIF}


function TExecuteCommand.Read(var ABufferStr:String;var AData:String): Boolean;
begin
  Result:=False;
  ABufferStr:='';
  AData:='';

            FillChar(Buffer[1],Length(Buffer),0);
  {$IFDEF MSWINDOWS}
//            uBaseLog.HandleError(nil,'TExecuteCommand.Read Begin');
//            Result := ReadFile(StdOutPipeRead, Buffer, Length(Buffer)-1, BytesRead, nil);
            Result := ReadFile(StdOutPipeRead, Buffer, Length(Buffer)-1, BytesRead, nil);
  //          WasOK := ReadFile(StdOutPipeRead, Buffer, 10, BytesRead, nil);

//            uBaseLog.HandleError(nil,'TExecuteCommand.Read End');
  {$ENDIF}
  {$IFDEF LINUX}
          WriteLn('TExecuteCommand.PipeReadLoop __read begin');
          //������ܵ���ȡ����
          BytesRead:=__read(fd_stdout[0],@Buffer[0],SizeOf(Buffer)-1);
          WriteLn('TExecuteCommand.PipeReadLoop __readed bytes length:'+IntToStr(BytesRead));

  {$ENDIF}

            if BytesRead = 0 then
            begin
//              HandleException(nil,'TCommandLineOutputHelper.Read no data');
              Exit;
            end;



              Buffer[BytesRead] := #0;
//              Result := Result + Buffer;
//              HandleException(nil,'TCommandLineOutputHelper.Read Buffer:'+Buffer);


  //            //��Buffer��ȡ��һ��
  //            APosIndex:=StrPos(Buffer,PAnsiChar(#13#10));
  //            if APosIndex>=0 then
  //            begin
  //              //�л��з�
  //            end
  //            else
  //            begin
  //              //û�л��з�
  //              ABuffer:=Buffer;
  //            end;

              if FCommandLineOutputHelper<>nil then
              begin
                FCommandLineOutputHelper.DoGetCommandLineBufferEvent(@Buffer[0],BytesRead,2000-1,AData);
              end;

              if FOtherCommandLineOutputHelper<>nil then
              begin
                FOtherCommandLineOutputHelper.DoGetCommandLineBufferEvent(@Buffer[0],BytesRead,2000-1,AData);
              end;

              try
                if Assigned(FOnGetCommandLineOutput) then
                begin
                  FOnGetCommandLineOutput(FCommandLine,FTag,Buffer);
                end;
              except

              end;


              ABufferStr:=Buffer;

              Result:=True;
end;


procedure TExecuteCommand.StopProcess(AWaitTimeout:Integer=10*1000);
begin
//  if not IsRunning then Exit;
//  if TerminateCommand <> '' then SendInput(TerminateCommand);
//  Windows.TerminateProcess(ProcessHandle,
//                           4);  //JCFaria
//  if not EnableKill then Exit;
//  if TerminateCommand <> '' then
//    if WaitForSingleObject(ProcessHandle,
//                           WaitTimeout) = WAIT_OBJECT_0 then
//      Exit;
//  Windows.TerminateProcess(ProcessHandle, 4);
  if FIsRunning then
  begin

    //�����˳����������
    if FTerminateCommand <> '' then
    begin


        //�����˳�����
        Self.WriteToStdinPipe(FTerminateCommand);

//        //��ʱ�Ļ����˳�
//        //��Ҳ����һֱ��ô����ȥ��
//        if WaitForSingleObject(FPI.hProcess, AWaitTimeout)=WAIT_OBJECT_0 then//INFINITE);
//        begin
//          //û�г�ʱ
//        end
//        else
//        begin
//          //��ʱ��
//          if Self.FTerminateCommand<>'' then
//          begin
//            //�����������û���˳�,��ô��Ҫ��ֹ������
//            Windows.TerminateProcess(FPI.hProcess,
//                                     //����ֵ
//                                     4);  //JCFaria
//
//
//          end;
//        end;

    end
    else
    begin
        //ֱ��ɱ������
        {$IFDEF MSWINDOWS}
        if FPI.hProcess>0 then
        begin
          Windows.TerminateProcess(FPI.hProcess,
                                   //����ֵ
                                   4);  //JCFaria

        end;
        {$ENDIF}

    end;

    //�ȴ�����ִ�н���
    WaitForStop(AWaitTimeout);


    FIsRunning:=False;
  end;
end;

//  {$IFDEF LINUX}
procedure TExecuteCommand.PipeReadLoop(AReadPipeThread:TReadPipeThread);
//var
//  Buffer: array[0..512] of AnsiChar;
//  BytesRead: Cardinal;
//  AAnsiCommandLine:AnsiString;
var
  ABufferStr:String;
  AData:String;
begin
  FCommandLineOutputHelper.FOnGetData:=Self.FOnGetData;
  FCommandLineOutputHelper.FOnGetLog:=Self.FOnGetLog;

//  {$IFDEF MSWINDOWS}
//  PipeReadOnWindows;
//  {$ENDIF}
//
//  {$IFDEF LINUX}
//  PipeReadLoop;
//  {$ENDIF}

  if Assigned(FOnGetCommandLineOutput) then
  begin
    FOnGetCommandLineOutput(FCommandLine,FTag,'׼��ִ������:'+FCommandLine);
  end;



  while (AReadPipeThread=nil) or ((AReadPipeThread<>nil) and not AReadPipeThread.Terminated) do
  begin

    if not Read(ABufferStr,AData) then
    begin
      Break;
    end;
    
//    WriteLn('TExecuteCommand.PipeReadLoop __read begin');
//    //������ܵ���ȡ����
//    BytesRead:=__read(fd_stdout[0],@Buffer[0],SizeOf(Buffer)-1);
//    WriteLn('TExecuteCommand.PipeReadLoop __readed bytes length:'+IntToStr(BytesRead));
//
//
//    if BytesRead=0 then
//    begin
//      Break;
//    end;
//    Buffer[BytesRead]:=#0;
//
//    if FCommandLineOutputHelper<>nil then
//    begin
//      FCommandLineOutputHelper.DoGetCommandLineBufferEvent(@Buffer[0],BytesRead,SizeOf(Buffer)-1);
//    end;
//
//    try
//      if Assigned(FOnGetCommandLineOutput) then
//      begin
//        FOnGetCommandLineOutput(FCommandLine,FTag,Buffer);
//      end;
//    except
//
//    end;

    //Writeln(Buffer);

  end;


//    Buffer[Sizeof(Buffer)-1]:=chr(0);
//
//    while fgets(@Buffer[0],Sizeof(Buffer)-1,Handle)<>nil do
//    begin
//
//        //Writeln('read a line from pipe:'+BufferToString(@Data[0],sizeof(Data)));
//        //Write(BufferToString(@Data[0],sizeof(Data)));
//
//        BytesRead:=BufferLength(@Buffer[0],sizeof(Buffer)-1);
//
//        if FCommandLineOutputHelper<>nil then
//        begin
//          FCommandLineOutputHelper.DoGetCommandLineBufferEvent(@Buffer[0],BytesRead,SizeOf(Buffer)-1);
//        end;
//
//        try
//          if Assigned(FOnGetCommandLineOutput) then
//          begin
//            FOnGetCommandLineOutput(FCommandLine,FTag,Buffer);
//          end;
//        except
//
//        end;
//
//
//    end;

  //�Զ������˽���
  FIsRunning:=False;

  if Assigned(FOnGetCommandLineOutput) then
  begin
    FOnGetCommandLineOutput(FCommandLine,FTag,'����ִ�н���');
  end;

  //ִ�н���
  if Assigned(Self.FOnExecuteEnd) then
  begin
    Self.FOnExecuteEnd(Self);
  end;
end;
//  {$ENDIF}

//    {$IFDEF MSWINDOWS}
//procedure TExecuteCommand.PipeReadOnWindows;
//var
//  WasOK: Boolean;
//  AData:String;
//begin
//
//      if Assigned(FOnGetCommandLineOutput) then
//      begin
//        FOnGetCommandLineOutput(FCommandLine,FTag,'׼��ִ������:'+FCommandLine+' '+Self.FParams);
//      end;
//
//
//
//
//
//
////          repeat
////            WasOK := ReadFile(StdOutPipeRead, Buffer, Length(Buffer)-1, BytesRead, nil);
////  //          WasOK := ReadFile(StdOutPipeRead, Buffer, 10, BytesRead, nil);
////
////
////            if BytesRead > 0 then
////            begin
////
////
////
////              Buffer[BytesRead] := #0;
//////              Result := Result + Buffer;
////
////
////  //            //��Buffer��ȡ��һ��
////  //            APosIndex:=StrPos(Buffer,PAnsiChar(#13#10));
////  //            if APosIndex>=0 then
////  //            begin
////  //              //�л��з�
////  //            end
////  //            else
////  //            begin
////  //              //û�л��з�
////  //              ABuffer:=Buffer;
////  //            end;
////
////              if FCommandLineOutputHelper<>nil then
////              begin
////                FCommandLineOutputHelper.DoGetCommandLineBufferEvent(@Buffer[0],BytesRead,2000-1,AData);
////              end;
////
////              if FOtherCommandLineOutputHelper<>nil then
////              begin
////                FOtherCommandLineOutputHelper.DoGetCommandLineBufferEvent(@Buffer[0],BytesRead,2000-1,AData);
////              end;
////
////              try
////                if Assigned(FOnGetCommandLineOutput) then
////                begin
////                  FOnGetCommandLineOutput(FCommandLine,FTag,Buffer);
////                end;
////              except
////
////              end;
////
////
////            end;
////
////
////          until not WasOK or (BytesRead = 0);
//
//
//
//
//      if Assigned(FOnGetCommandLineOutput) then
//      begin
//        FOnGetCommandLineOutput(FCommandLine,FTag,'����ִ�н���');
//      end;
//
//end;
//    {$ENDIF}


function TExecuteCommand.WriteToStdinPipe(AInput: String):Boolean;
var
  ABuffer: TBytes;//array [0 .. 2000] of AnsiChar;
  ABytesWrite: Cardinal;
  AAnsiInput:String;
begin
  Result:=False;

  {$IFDEF MSWINDOWS}
  AInput:=AInput+#13#10;//Ҫ�ӻس�,��Ȼ�ӽ��̶�ȡ����

  ABuffer:=TEncoding.UTF8.GetBytes(AInput);
  //function WriteFile(hFile: THandle; const Buffer; nNumberOfBytesToWrite: DWORD;
  //  var lpNumberOfBytesWritten: DWORD; lpOverlapped: POverlapped): BOOL; stdcall;
  Result := WriteFile(StdinPipeWrite, ABuffer[0], Length(ABuffer), ABytesWrite, nil);
  {$ENDIF}

  {$IFDEF LINUX}
  AInput:=AInput+#10;//Ҫ�ӻس�,��Ȼ�ӽ��̶�ȡ����

  ABuffer:=TEncoding.UTF8.GetBytes(AInput);
  //��stdin����ܵ� д������
  ABytesWrite:=__write(fd_stdin[1],@ABuffer[0],Length(ABuffer));
  Result:=ABytesWrite>0;
  {$ENDIF}

end;


procedure TExecuteCommand.ProcessKilled;
begin


  {$IFDEF MSWINDOWS}
  if FPI.hProcess>0 then
  begin
    CloseHandle(FPI.hThread);
    CloseHandle(FPI.hProcess);

    FPI.hThread:=0;
    FPI.hProcess:=0;

    if StdOutPipeRead>0 then
    begin
      CloseHandle(StdOutPipeRead);
    end;
    StdOutPipeRead:=0;
    //�ر���дͨ����
    if StdOutPipeWrite>0 then
    begin
      CloseHandle(StdOutPipeWrite);
    end;
    StdOutPipeWrite:=0;


    if StdinPipeRead>0 then
    begin
      CloseHandle(StdinPipeRead);
    end;
    StdinPipeRead:=0;
    //�ر���дͨ����
    if StdinPipeWrite>0 then
    begin
      CloseHandle(StdinPipeWrite);
    end;
    StdinPipeWrite:=0;


  end;

  {$ENDIF}

  {$IFDEF LINUX}
//  pclose(Handle);
  //�ر�����ܵ��Ķ���
  __close(fd_stdout[0]);

  //�ر�����ܶ˵�д��
  __close(fd_stdin[1]);
  {$ENDIF}

end;


procedure TExecuteCommand.WaitForStop(AWaitTimeout:Integer=10*1000);
begin



  //�Ƚ����˳�
  {$IFDEF MSWINDOWS}
  if FPI.hProcess>0 then
  begin
    //��ʱ�Ļ����˳�
    //��Ҳ����һֱ��ô����ȥ��
    if WaitForSingleObject(FPI.hProcess, AWaitTimeout)=WAIT_OBJECT_0 then//INFINITE);
    begin
      //û�г�ʱ
    end
    else
    begin
      //��ʱ��
      if Self.FTerminateCommand<>'' then
      begin
        //�����������û���˳�,��ô��Ҫ��ֹ������
        Windows.TerminateProcess(FPI.hProcess,
                                 //����ֵ
                                 4);  //JCFaria


      end;
    end;

  end;
  {$ENDIF}


  //����,�رչܵ�
  ProcessKilled;


  //���߳��˳�
  if Self.FReadPipeThread<>nil then
  begin
    Self.FReadPipeThread.WaitFor;
  end;
  FreeAndNil(FReadPipeThread);


end;

//initialization
//  GlobalCommandLineOutputHelper:=TCommandLineOutputHelper.Create;
//
//finalization
//  FreeAndNil(GlobalCommandLineOutputHelper);


{ TCommandLineDataList }

function TCommandLineDataList.Find(AFunctionName: String): TCommandLineData;
var
  I: Integer;
begin
  Result:=nil;
  for I := Self.Count-1 downto 0 do
  begin
    if Items[I].DataJson.S['FunctionName']=AFunctionName then
    begin
      Result:=Items[I];
      Break;
    end;

  end;
end;

function TCommandLineDataList.GetItem(Index: Integer): TCommandLineData;
begin
  Result:=TCommandLineData(Inherited Items[Index]);
end;



end.












