//�����а���
unit uCommandLineHelper_Copy;



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




  TCommandLineOutputHelper=class
  public
    FOnGetData:TGetDataEvent;
    FOnGetLog:TGetLogEvent;

//    FReadedDataString:AnsiString;
    FReadedDataString:String;
    FCommandLineDataList:TCommandLineDataList;
    procedure DoGetCommandLineOutput(ACommandLine:String;ATag:String;AOutput:String);
    //��ȡ�������е�������
    procedure DoGetCommandLineBufferEvent(ABuffer:Pointer;ABytesRead: Cardinal;ABufferSize:Cardinal);

    constructor Create;
    destructor Destroy;override;
  end;



  //ִ�������е��߳�
  TExecuteCommandThread=class(TThread)
  public
    //������
    FCommandLine:String;
    //����·��
    FWorkDir:String;
//    {$IFDEF MSWINDOWS}
//    //������Ϣ
//    FPI: TProcessInformation;
//    {$ENDIF}
    //��ȡ��������¼�
    FOnGetCommandLineOutput:TGetCommandLineOutputEvent;
    //ִ�н������¼�
    FOnExecuteEnd:TNotifyEvent;


//    FOnGetData:TGetDataEvent;
//    FOnGetLog:TGetLogEvent;

    FCommandLineOutputHelper:TCommandLineOutputHelper;

    procedure Execute;override;

  public
    constructor Create(ACreateSuspended:Boolean;
                        //������
                        ACommandLine:String;
                        //����·��
                        AWorkDir:String;
                        //��ȡ��������¼�
                        AOnGetCommandLineOutput:TGetCommandLineOutputEvent;
                        //ִ�н������¼�
                        AOnExecuteEnd:TNotifyEvent;
                        //��ȡ�����ݵ��¼�
                        AOnGetData:TGetDataEvent;
                        //��ȡ����־���¼�
                        AOnGetLog:TGetLogEvent);
    destructor Destroy;override;
  end;


  TExecuteCommand=class
  public
    //������
    FCommandLine:String;
    //����·��
    FWorkDir:String;
//    //������Ϣ
//    FPI: TProcessInformation;
//    //��ȡ��������¼�
//    FOnGetCommandLineOutput:TGetCommandLineOutputEvent;
    //ִ�н������¼�
    FOnExecuteEnd:TNotifyEvent;
    FOnGetData:TGetDataEvent;
//    FOnGetLog:TGetLogEvent;

    FExecuteCommandThread:TExecuteCommandThread;
    procedure Execute;
  end;




//ִ��������,��ȡ�����еĽ��
function ExecuteCommand(ACommandLine: string;
                        AWorkDir: string;
                        ATag:String;
                        //��ȡ������������¼�,��ΪҪ�ڽ����������
                        AOnGetCommandLineOutput:TGetCommandLineOutputEvent;
//                        var PI: TProcessInformation;
                        ACommandLineOutputHelper:TCommandLineOutputHelper=nil):String;

function ExecuteCommandProcess(ACommandLine: string;
                              AWorkDir: string;
                              AParams:String=''):String;



//var
////  GlobalCommandLineOutputHelper:TCommandLineOutputHelper;
//  GlobalOnGetCommandLineOutput:TGetCommandLineOutputEvent;

implementation




function ExecuteCommand(ACommandLine:String;
                        AWorkDir:String;
                        ATag:String;
                        AOnGetCommandLineOutput:TGetCommandLineOutputEvent;
//                        var PI: TProcessInformation;
                        ACommandLineOutputHelper:TCommandLineOutputHelper=nil):String;
  {$IFDEF MSWINDOWS}
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  FPI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array [0 .. 2000] of AnsiChar;
  BytesRead: Cardinal;
//  AWorkDir: string;
  Handle: Boolean;

//  APosIndex:Integer;
//  ABufferSubStr: array [0 .. 2000] of AnsiChar;
//  ABuffer:PAnsiChar;
  {$ENDIF}
begin
  {$IFDEF MSWINDOWS}
  Result := '';


  if Assigned(AOnGetCommandLineOutput) then
  begin
    AOnGetCommandLineOutput(ACommandLine,ATag,'׼��ִ������:'+ACommandLine);
  end;


  //��ȫ����,TSecurityAttributes
  with SA do
  begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;


  //�������̼��ͨ��
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try

    //TStartupInfo
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;


    FillChar(FPI, SizeOf(FPI), 0);

//    AWorkDir := Work;


//    Handle := CreateProcess(nil, PChar('cmd.exe /C ' + ACommandLine), nil, nil,
//      True, 0, nil, PChar(AWorkDir), SI, PI);
//    Handle := CreateProcessW(nil, PChar(ACommandLine), nil, nil,
//      True, 0, nil, PChar(AWorkDir), SI, FPI);
    //https://blog.csdn.net/zsc_976529378/article/details/105315792

    Handle := CreateProcessW(nil, PChar(ACommandLine), nil, nil,
      True, 0, nil,
      nil,//PChar(AWorkDir),
      SI, FPI);

    //�ر���дͨ����
    CloseHandle(StdOutPipeWrite);


    if Handle then
    begin

      try


          repeat
            WasOK := ReadFile(StdOutPipeRead, Buffer, Length(Buffer)-1, BytesRead, nil);
  //          WasOK := ReadFile(StdOutPipeRead, Buffer, 10, BytesRead, nil);


            if BytesRead > 0 then
            begin



              Buffer[BytesRead] := #0;
              Result := Result + Buffer;


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

              if ACommandLineOutputHelper<>nil then
              begin
                ACommandLineOutputHelper.DoGetCommandLineBufferEvent(@Buffer[0],BytesRead,2000-1);
              end;

              try
                if Assigned(AOnGetCommandLineOutput) then
                begin
                  AOnGetCommandLineOutput(ACommandLine,ATag,Buffer);
                end;
              except

              end;


            end;


          until not WasOK or (BytesRead = 0);
          WaitForSingleObject(FPI.hProcess, INFINITE);

      finally
        CloseHandle(FPI.hThread);
        CloseHandle(FPI.hProcess);

        FPI.hThread:=0;
        FPI.hProcess:=0;
      end;



      if Assigned(AOnGetCommandLineOutput) then
      begin
        AOnGetCommandLineOutput(ACommandLine,ATag,'����ִ�н���');
      end;

    end
    else
    begin
      try
        //���̴���ʧ��
        RaiseLastOSError;

      except
        on E:Exception do
        begin

          if Assigned(AOnGetCommandLineOutput) then
          begin
            AOnGetCommandLineOutput(ACommandLine,ATag,'���̴���ʧ��:'+E.Message);
          end;

        end;
      end;

    end;

  finally
    CloseHandle(StdOutPipeRead);
  end;
  {$ENDIF}



end;


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
  ABytesRead: Cardinal;ABufferSize:Cardinal);
var
  AIndex:Integer;
//  ALog:AnsiString;
//  AData:AnsiString;
  ALog:String;
  AData:String;
  ADataJson:ISuperObject;
  AHasCommandLineDataBegin:Boolean;
  AHasCommandLineDataEnd:Boolean;
  ACommandLineData:TCommandLineData;
begin
  FReadedDataString:=FReadedDataString+PAnsiChar(ABuffer);

  repeat

    //ȡ�������ݰ�,��־
    ALog:='';
//    AHasCommandLineDataBegin:=PosAndCutAnsiString(Const_CommandLineDataBegin,FReadedDataString,ALog,AIndex,False);
    AHasCommandLineDataBegin:=PosAndCutString(Const_CommandLineDataBegin,FReadedDataString,ALog,AIndex,False);
    if not AHasCommandLineDataBegin and (ABytesRead<ABufferSize) then
    begin
      ALog:=FReadedDataString;
      FReadedDataString:='';
    end;
    if (ALog<>'') then
    begin
      HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent Log:'+ALog);
      if Assigned(FOnGetLog) then
      begin
        FOnGetLog(Self,ALog);
      end;
    end;

    AHasCommandLineDataEnd:=False;
    if AHasCommandLineDataBegin then//�����ݰ�
    begin

      //ȡ�����ݰ�
      AData:='';
//      if PosAndCutAnsiString(Const_CommandLineDataEnd,FReadedDataString,AData,AIndex,True) then
      if PosAndCutString(Const_CommandLineDataEnd,FReadedDataString,AData,AIndex,True) then
      begin
        AHasCommandLineDataEnd:=True;
        AData:=Copy(AData,Length(Const_CommandLineDataBegin)+1,MaxInt);
        HandleException(nil,'TCommandLineOutputHelper.DoGetCommandLineBufferEvent Data:'+AData);
        ADataJson:=SO(AData);
        //��һ��������,����������
        if Assigned(FOnGetData) then
        begin
          FOnGetData(Self,AData,ADataJson);
        end;

        ACommandLineData:=TCommandLineData.Create;
        ACommandLineData.Data:=AData;
        ACommandLineData.DataJson:=ADataJson;
        FCommandLineDataList.Add(ACommandLineData);
      end;

    end;

  until not AHasCommandLineDataEnd;

end;


{ TExecuteCommandThread }


destructor TExecuteCommandThread.Destroy;
begin
  FreeAndNil(FCommandLineOutputHelper);
  Inherited;
end;

constructor TExecuteCommandThread.Create(ACreateSuspended: Boolean;
//  ATaskItem:TTaskItem;
  ACommandLine: String;
  AWorkDir:String;
  AOnGetCommandLineOutput:TGetCommandLineOutputEvent;
  AOnExecuteEnd:TNotifyEvent;
  AOnGetData:TGetDataEvent;
  AOnGetLog:TGetLogEvent);
begin
  Inherited Create(False);

//  FTaskItem:=ATaskItem;
  FCommandLine:=ACommandLine;
  FWorkDir:=AWorkDir;
  FOnGetCommandLineOutput:=AOnGetCommandLineOutput;
  FOnExecuteEnd:=AOnExecuteEnd;
//  FOnGetData:=AOnGetData;
//  FOnGetLog:=AOnGetLog;

  FCommandLineOutputHelper:=TCommandLineOutputHelper.Create;
  FCommandLineOutputHelper.FOnGetData:=AOnGetData;
  FCommandLineOutputHelper.FOnGetLog:=AOnGetLog;

end;

procedure TExecuteCommandThread.Execute;
begin
  inherited;

  ExecuteCommand(FCommandLine,FWorkDir,'',FOnGetCommandLineOutput,
//                FPI,
                FCommandLineOutputHelper);

  if Assigned(FOnExecuteEnd) then
  begin
    FOnExecuteEnd(Self);
  end;

end;

{ TExecuteCommand }

procedure TExecuteCommand.Execute;
begin

  FExecuteCommandThread:=TExecuteCommandThread.Create(False,FCommandLine,FWorkDir,nil,FOnExecuteEnd,FOnGetData,nil);
  FExecuteCommandThread.FreeOnTerminate:=True;
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












