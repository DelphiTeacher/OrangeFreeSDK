unit uCommandLineHelper;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  Windows,
  Forms,
  XSuperObject,

  XMLDoc,
  XMLIntf;


type
  TGetCommandLineOutputEvent=procedure(ACommandLine:String;ATag:String;AOutput:String) of object;


  TCommandLineOutputHelper=class
  public
    procedure DoGetCommandLineOutput(ACommandLine:String;ATag:String;AOutput:String);
  end;


//执行命令行,获取命令行的结果
function ExecuteCommand(CommandLine: string;
                        Work: string = 'C:\';
                        ATag:String='';
                        AGetCommandLineOutputEvent:TGetCommandLineOutputEvent=nil):String;


var
  GlobalCommandLineOutputHelper:TCommandLineOutputHelper;

implementation




function ExecuteCommand(CommandLine:String;
                        Work:String;
                        ATag:String;
                        AGetCommandLineOutputEvent:TGetCommandLineOutputEvent):String;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array [0 .. 255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: string;
  Handle: Boolean;
begin
  Result := '';


  if Assigned(AGetCommandLineOutputEvent) then
  begin
    AGetCommandLineOutputEvent(CommandLine,ATag,'准备执行命令:'+CommandLine);
  end;


  with SA do
  begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;


  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
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



    WorkDir := Work;


//    Handle := CreateProcess(nil, PChar('cmd.exe /C ' + CommandLine), nil, nil,
//      True, 0, nil, PChar(WorkDir), SI, PI);
    Handle := CreateProcess(nil, PChar(CommandLine), nil, nil,
      True, 0, nil, PChar(WorkDir), SI, PI);
    CloseHandle(StdOutPipeWrite);


    if Handle then
      try
        repeat
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            Buffer[BytesRead] := #0;
            Result := Result + Buffer;


            if Assigned(AGetCommandLineOutputEvent) then
            begin
              AGetCommandLineOutputEvent(CommandLine,ATag,Buffer);
            end;


          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, INFINITE);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;



      if Assigned(AGetCommandLineOutputEvent) then
      begin
        AGetCommandLineOutputEvent(CommandLine,ATag,'命令执行结束');
      end;


  finally
    CloseHandle(StdOutPipeRead);
  end;



end;


{ TCommandLineOutputHelper }

procedure TCommandLineOutputHelper.DoGetCommandLineOutput(ACommandLine, ATag,AOutput: String);
begin
  if ATag<>'' then
  begin
    Writeln(ATag+':'+AOutput);
  end
  else
  begin
    Writeln(AOutput);
  end;
end;


initialization
  GlobalCommandLineOutputHelper:=TCommandLineOutputHelper.Create;

finalization
  FreeAndNil(GlobalCommandLineOutputHelper);


end.
