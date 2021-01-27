//写日志基类//
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
  //是否是多线程
  IsMultiThread:Boolean;
  //日志根目录
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
    ALogString:='ID:'+AID+' 异常:'+AException.Message+' 模块:'+AModuleName+' 单元:'+AUnitName+' 方法:'+AMethodName+' 位置:'+APosition+'';
  end
  Else
  begin
    ALogString:='ID:'+AID+' 提示:'+'跟踪调试'+' 模块:'+AModuleName+' 单元:'+AUnitName+' 方法:'+AMethodName+' 位置:'+APosition+'';
  end;

  ALogString:=FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Now)+'  '+ALogString+#13#10;

//  FIsWriteLog:=(AException<>nil);

  Debug(ALogString,AData);

//  //上传到日志云
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
      //获取文件大小
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
    //日志根目录
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
  //文件尺寸超标就删除
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
      //关闭句柄
      CloseFileHandle;
      //创建文件
      FFileHandle:=FileCreate(FLogFileName, fmCreate or fmOpenWrite or fmShareDenyNone, 0);
    end
    else
    begin
      //存在文件,则打开文件
      if FFileHandle = INVALID_HANDLE_VALUE then FFileHandle:=FileOpen(FLogFileName,fmOpenWrite or fmShareDenyNone);
      //文件最后
      FileSeek(FFileHandle,0,2);
    end;
  end;

  if FFileHandle <> INVALID_HANDLE_VALUE then
  begin
    //如果取到合法的文件句柄,那就可以写文件了
    Result:=True;
  end
  else
  begin
    //获取文件句柄失败,不再写入文件
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
  //输出日志
  if FIsOutputLog then OutputDebugString(PWideChar(ADebugString));
  //写入日志文件
  if FIsWriteLog then WriteLog(ADebugString);

end;


initialization
  //默认把日志目录放在D盘
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

  //是否是多线程
  IsMultiThread:=True;

end.






