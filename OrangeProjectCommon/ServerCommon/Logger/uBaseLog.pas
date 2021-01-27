//д��־����//
unit uBaseLog;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  Messages,
  Controls,
  SyncObjs,
  ExtCtrls,
  IniFiles;

type
  TOnDebugEvent=procedure(AException: Exception;
                                        const AModuleName,
                                        AUnitName,
                                        AMethodName,
                                        APosition,
                                        AID:String;
                                        const ADebugString:WideString;
                                        AData:Pointer) of object;
  TBaseLog=class
  private
    FLock:TRTLCriticalSection;
    FIsWriteLog:Boolean;
    FIsOutputLog:Boolean;
    FLogFileName:String;
    FFileHandle:THandle;
    FMaxFileSize: Integer;
    function GetFileHandle(InCreate:Boolean):Boolean;
    procedure CloseFileHandle;
  public
    constructor Create(const ALogFileName:String;
                        const AIsWriteLog:Boolean=True;
                        const AIsOutputLog:Boolean=True);
    Destructor Destroy;override;
  public
    property MaxFileSize:Integer read FMaxFileSize write FMaxFileSize;
  public
//    OnDebug:TOnDebugEvent;
    procedure Lock;
    procedure UnLock;
    procedure ODS(const ADebugString:WideString);
    procedure Debug(const ADebugString:WideString;AData:Pointer);
    procedure WriteLog(const ALogString:AnsiString);
    procedure HandleException(AException: Exception;
                            const AModuleName,
                                  AUnitName,
                                  AMethodName,
                                  APosition,
                                  AID:String;
                                  AData:Pointer);
  end;



var
  //�Ƿ��Ƕ��߳�
  IsMultiThread:Boolean;
  //��־��Ŀ¼
  RootLogDir:String;

function GetFileSize(FilePath:String):Int64;


implementation


procedure TBaseLog.HandleException(AException: Exception;
                                  const AModuleName,
                                        AUnitName,
                                        AMethodName,
                                        APosition,
                                        AID:String;
                                  AData:Pointer);
var
  ALogString:WideString;
begin
  if AException<>nil then
  begin
    ALogString:='ID:'+AID+' �쳣:'+AException.Message+' ģ��:'+AModuleName+' ��Ԫ:'+AUnitName+' ����:'+AMethodName+' λ��:'+APosition+'';
  end
  Else
  begin
    ALogString:='ID:'+AID+' ��ʾ:'+'���ٵ���'+' ģ��:'+AModuleName+' ��Ԫ:'+AUnitName+' ����:'+AMethodName+' λ��:'+APosition+'';
  end;

  ALogString:=FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Now)+'  '+ALogString+#13#10;

//  FIsWriteLog:=(AException<>nil);

  Debug(ALogString,AData);

//  //�ϴ�����־��
//  if Assigned(OnDebug) then
//  begin
//    OnDebug(AException,
//            AModuleName,
//            AUnitName,
//            AMethodName,
//            APosition,
//            AID,
//            ALogString,
//            AData);
//  end;
end;

procedure TBaseLog.Lock;
begin
  if IsMultiThread then
  begin
    EnterCriticalSection(FLock);
  end;
end;

procedure TBaseLog.CloseFileHandle;
begin
  if FFileHandle <> INVALID_HANDLE_VALUE then FileClose(FFileHandle);
  FFileHandle:=INVALID_HANDLE_VALUE;
end;

function GetFileSize(FilePath:String):Int64;
var
  Filestream:Tfilestream;
begin
  Result:=0;
  if (Trim(FilePath)<>'') and FileExists(FilePath) then
  begin
    Filestream:=TFileStream.Create(FilePath,fmopenRead or fmShareDenyNone);
    Try
      //��ȡ�ļ���С
      Result:=Filestream.Size;
    Finally
      FreeAndNil(Filestream);
    End;
  end;
end;

constructor TBaseLog.Create(const ALogFileName: String;
                            const AIsWriteLog:Boolean;
                            const AIsOutputLog:Boolean);
var
  LogDir:String;
begin
  FIsWriteLog:=AIsWriteLog;
  FIsOutputLog:=AIsOutputLog;

  FMaxFileSize:=20*1024*1024;
  FFileHandle:= INVALID_HANDLE_VALUE;


  if RootLogDir<>'' then
  begin
    //��־��Ŀ¼
    LogDir:=RootLogDir;
  end
  else
  begin
    LogDir:=ExtractFilePath(Application.ExeName);
  end;


  if Not DirectoryExists(LogDir) then
  begin
    SysUtils.ForceDirectories(LogDir);
  end;

  FLogFileName:=LogDir+ALogFileName;
  //�ļ��ߴ糬���ɾ��
  if GetFileSize(FLogFileName)>FMaxFileSize then
  begin
    DeleteFile(FLogFileName);
  end;
  GetFileHandle(True);



  InitializeCriticalSection(FLock);
end;

destructor TBaseLog.Destroy;
begin
  CloseFileHandle;

  DeleteCriticalSection(FLock);

  inherited;
end;

Function TBaseLog.GetFileHandle(InCreate:Boolean):Boolean;
begin
  Result:=False;

  if FIsWriteLog then
  begin
    if Not FileExists(FLogFileName) then
    begin
      //�رվ��
      CloseFileHandle;
      //�����ļ�
      FFileHandle:=FileCreate(FLogFileName, fmCreate or fmOpenWrite or fmShareDenyNone, 0);
    end
    else
    begin
      //�����ļ�,����ļ�
      if FFileHandle = INVALID_HANDLE_VALUE then FFileHandle:=FileOpen(FLogFileName,fmOpenWrite or fmShareDenyNone);
      //�ļ����
      FileSeek(FFileHandle,0,2);
    end;
  end;

  if FFileHandle <> INVALID_HANDLE_VALUE then
  begin
    //���ȡ���Ϸ����ļ����,�ǾͿ���д�ļ���
    Result:=True;
  end
  else
  begin
    //��ȡ�ļ����ʧ��,����д���ļ�
    Self.FIsWriteLog:=False;
  end;


end;

procedure TBaseLog.WriteLog(const ALogString:AnsiString);
begin
  if FIsWriteLog then
  begin
    Lock;
    try
      if GetFileHandle(False) then
      begin
        if FFileHandle <> INVALID_HANDLE_VALUE then FileWrite(FFileHandle, ALogString[1],Length(ALogString));
      end;
    finally
      UnLock;
    end;
  end;
end;

procedure TBaseLog.ODS(const ADebugString:WideString);
begin
  OutputDebugString(PWideChar(ADebugString));
end;

procedure TBaseLog.UnLock;
begin
  if IsMultiThread then
  begin
    LeaveCriticalSection(FLock);
  end;
end;

procedure TBaseLog.Debug(const ADebugString:WideString;AData:Pointer);
begin
  //�����־
  if FIsOutputLog then OutputDebugString(PWideChar(ADebugString));
  //д����־�ļ�
  if FIsWriteLog then WriteLog(ADebugString);

end;


initialization
  //Ĭ�ϰ���־Ŀ¼����D��
  RootLogDir:=ExtractFilePath(Application.ExeName);
  {$IFDEF WEBDLL}
  if DirectoryExists('D:\') then
  begin
    RootLogDir:='D:\';
  end
  else
  begin
    if DirectoryExists('C:\') then
    begin
      RootLogDir:='C:\';
    end;
  end;
  {$ENDIF}

  //�Ƿ��Ƕ��߳�
  IsMultiThread:=True;

end.






