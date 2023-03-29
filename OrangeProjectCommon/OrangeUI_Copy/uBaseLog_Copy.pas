//convert pas to utf8 by
/// <summary>
///   <para>
///     日志的基类
///   </para>
///   <para>
///     Base class of log
///   </para>
/// </summary>
unit uBaseLog_Copy;



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


//可以在Android服务中使用
uses
  SysUtils,
  Classes,
//  IOUtils,



  {$IFDEF MSWINDOWS}
    {$IF CompilerVersion >= 30.0}
    Winapi.Windows,
    {$ELSE}
    Windows,
    Forms,
    {$IFEND}
  {$ENDIF}



  {$IFDEF FMX}
    {$IFDEF ANDROID}
    //Android平台不使用FMX.Types.Log.d来输出日志,
    //在服务程序中会卡死
    Androidapi.Log,
    {$ELSE}
      {$IFDEF MSWINDOWS}
//      Winapi.Windows,
      {$ELSE}
      FMX.Types,
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}





  {$IFDEF IN_ORANGESDK}
  //在OrangeSDK包里面
  uFileCommon_Copy,
  uFuncCommon_Copy,
  {$ELSE}
  //在OrangeUI里面
  uFileCommon,
  uFuncCommon,
  {$ENDIF}

  IniFiles,
  DateUtils;





Const
  CONST_BASELOG_FILENAME='OrangeUI_Copy.log';





type
  //日志一共分成5个等级，从低到高分别是：
  //
  //DEBUG
  //INFO
  //WARNING
  //ERROR
  //CRITICAL
  //说明:
  //
  //DEBUG：详细的信息,通常只出现在诊断问题上
  //INFO：确认一切按预期运行
  //WARNING：一个迹象表明,一些意想不到的事情发生了,或表明一些问题在不久的将来(例如。磁盘空间低”)。这个软件还能按预期工作。
  //ERROR：更严重的问题,软件没能执行一些功能
  //CRITICAL：一个严重的错误,这表明程序本身可能无法继续运行
  TLogLevelType=(lltDebug,
                 lltInfo,
                 lltWarnning,
                 lltError,
                 lltCritical
                 );

  TBaseLog=class
  private
    //是否写日志到文件
    FIsWriteLog:Boolean;
    //是否输出调试信息
    FIsOutputLog:Boolean;

    LogDir:String;

    //日志文件的文件名
    FLogFileName:String;
    FLogFilePath:String;


    //日志文件的句柄
    FFileHandle:THandle;


    //日志文件的最大文件大小
    FMaxFileSize: Integer;

    //文件打开的时间,用于判断是否需要重新建一个日志文件
    FFileOpenTime:TDateTime;

    FWriteLogLevelType:TLogLevelType;
    FOutputLogLevelType:TLogLevelType;

    procedure CloseFileHandle;
    function GetFileHandle(InCreate:Boolean):Boolean;
  public
    constructor Create(const ALogFileName:String);
    Destructor Destroy;override;
  public

    //adb logcat | grep baidu
    /// <summary>
    ///   <para>
    ///     在安卓下输出日志的关键字,方便过滤
    ///   </para>
    ///   <para>
    ///     Keyword of output log on android,to filtration
    ///   </para>
    /// </summary>
    LogKeyword:String;

    procedure LoadConfig;
    procedure SaveConfig;

    /// <summary>
    ///   <para>
    ///     日志文件的最大文件大小
    ///   </para>
    ///   <para>
    ///     Max file size of log file
    ///   </para>
    /// </summary>
    property MaxFileSize:Integer read FMaxFileSize write FMaxFileSize;
  public
    //是否写日志到文件
    property IsWriteLog:Boolean read FIsWriteLog write FIsWriteLog;
    //是否输出调试信息
    property IsOutputLog:Boolean read FIsOutputLog write FIsOutputLog;


    /// <summary>
    ///   <para>
    ///     输出调试信息
    ///   </para>
    ///   <para>
    ///     Output debug information
    ///   </para>
    /// </summary>
    procedure OutputDebugString(ADebugString:String;ALogLevelType:TLogLevelType=lltDebug);

    /// <summary>
    ///   <para>
    ///     写日志到文件
    ///   </para>
    ///   <para>
    ///     Write log to file
    ///   </para>
    /// </summary>
    procedure WriteLog(ALogString:String;ALogLevelType:TLogLevelType=lltDebug);

    /// <summary>
    ///   <para>
    ///     既写日志文件,又输出调试信息
    ///   </para>
    ///   <para>
    ///     Write log file and output debug information
    ///   </para>
    /// </summary>
    procedure Debug(ADebugString:String;ALogLevelType:TLogLevelType=lltDebug);



    /// <summary>
    ///   <para>
    ///     记录异常的详细信息
    ///   </para>
    ///   <para>
    ///     Record detail information of exception
    ///   </para>
    /// </summary>
    /// <param name="AException">
    ///   异常
    ///  <para>
    ///  Exception
    ///  </para>
    /// </param>
    /// <param name="AModuleName">
    ///   模块名称
    ///  <para>
    ///  Module name
    ///  </para>
    /// </param>
    /// <param name="AUnitName">
    ///   单元名称
    ///  Unit name
    /// </param>
    /// <param name="AMethodName">
    ///   方法名称
    ///  <para>
    ///  Method Name
    ///  </para>
    /// </param>
    /// <param name="APosition">
    ///   异常位置
    ///  <para>
    ///  Position of exception
    ///  </para>
    /// </param>
    procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='';ALogLevelType:TLogLevelType=lltDebug);overload;
    /// <summary>
    ///   <para>
    ///     记录异常的精简信息
    ///   </para>
    ///   <para>
    ///     Record detail information of exception
    ///   </para>
    /// </summary>
    procedure HandleException(AException: Exception; const AMethodName:String;ALogLevelType:TLogLevelType=lltDebug);overload;
  end;



var
  //全局的日志对象
  GlobalLog:TBaseLog;


/// <summary>
///   <para>
///     获取全局的日志对象
///   </para>
///   <para>
///     Get global log
///   </para>
/// </summary>
function GetGlobalLog:TBaseLog;

/// <summary>
///   <para>
///     输出日志
///   </para>
///   <para>
///     Output log
///   </para>
/// </summary>
procedure OutputDebugString(ADebugString:String;ALogLevelType:TLogLevelType=lltDebug);

/// <summary>
///   <para>
///     弹出异常对话框
///   </para>
///   <para>
///     Pop up dialog box of exception
///   </para>
/// </summary>
procedure ShowException(ADebugString:String);

/// <summary>
///   <para>
///     记录异常的详细信息
///   </para>
///   <para>
///     Record detail information of exception
///   </para>
/// </summary>
procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='';const APosition2: String='';ALogLevelType:TLogLevelType=lltDebug);overload;
/// <summary>
///   <para>
///     记录异常的简单信息
///   </para>
///   <para>
///     Record detail information of exception
///   </para>
/// </summary>
procedure HandleException(AException: Exception;const AMethodName:String;ALogLevelType:TLogLevelType=lltDebug);overload;
procedure HandleError(AException: Exception;const AMethodName:String);
procedure HandleException(const AMethodName:String;AException: Exception=nil;ALogLevelType:TLogLevelType=lltDebug);overload;





implementation





function GetGlobalLog:TBaseLog;
begin
  if GlobalLog=nil then
  begin
    GlobalLog:=TBaseLog.Create(CONST_BASELOG_FILENAME);
  end;
  Result:=GlobalLog;
end;

procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='';const APosition2: String='';ALogLevelType:TLogLevelType=lltDebug);
begin
  GetGlobalLog.HandleException(AException, AUnitName, AMethodName, APosition+APosition2,ALogLevelType);
end;

procedure HandleError(AException: Exception;const AMethodName:String);
begin
  GetGlobalLog.HandleException(AException, AMethodName,TLogLevelType.lltError);
end;

procedure HandleException(AException: Exception;const AMethodName:String;ALogLevelType:TLogLevelType);
begin
  GetGlobalLog.HandleException(AException, AMethodName,ALogLevelType);
end;

procedure HandleException(const AMethodName:String;AException: Exception=nil;ALogLevelType:TLogLevelType=lltDebug);
begin
  GetGlobalLog.HandleException(AException, AMethodName,ALogLevelType);
end;

procedure ShowException(ADebugString:String);
begin
  raise Exception.Create(ADebugString);
end;

procedure OutputDebugString(ADebugString:String;ALogLevelType:TLogLevelType);
begin
  GetGlobalLog.OutputDebugString(ADebugString,ALogLevelType);
  if GetGlobalLog.FIsWriteLog then GetGlobalLog.WriteLog(ADebugString+#13#10,ALogLevelType);
end;




{ TBaseLog }

procedure TBaseLog.HandleException(AException: Exception; const AMethodName:String;const AUnitName:String; const APosition: String='';ALogLevelType:TLogLevelType=lltDebug);
var
  ALogString:String;
begin

  ALogString:=' Unit:'+AUnitName+' Method:'+AMethodName+' Pos:'+APosition+'';

  if AException<>nil then
  begin
    ALogLevelType:=TLogLevelType.lltError;
    ALogString:='Exception:'+AException.Message+ALogString;
  end;

  ALogString:=FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Now)+' '+ALogString;
  Debug(ALogString,ALogLevelType);
end;

procedure TBaseLog.HandleException(AException: Exception; const AMethodName:String;ALogLevelType:TLogLevelType);
var
  ALogString:String;
begin
  ALogString:=' Method:'+AMethodName;

  if AException<>nil then
  begin
    ALogLevelType:=TLogLevelType.lltError;
    ALogString:='Exception:'+AException.Message+ALogString;
  end;

  ALogString:=FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Now)+' '+ALogString;
  Debug(ALogString,ALogLevelType);
end;

procedure TBaseLog.LoadConfig;
var
  AIniFile:TIniFile;
begin
  if FileExists(GetApplicationPath+'Config.ini') then
  begin
    AIniFile:=TIniFile.Create(GetApplicationPath+'Config.ini'{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});
    try
      FIsWriteLog:=AIniFile.ReadBool('Log','IsWriteLog',False);
      FIsOutputLog:=AIniFile.ReadBool('Log','IsOutputLog',True);
      FWriteLogLevelType:=TLogLevelType(AIniFile.ReadInteger('Log','WriteLogLevelType',0));
      FOutputLogLevelType:=TLogLevelType(AIniFile.ReadInteger('Log','OutputLogLevelType',0));
    finally
      SysUtils.FreeAndNil(AIniFile);
    end;
  end;
end;

procedure TBaseLog.CloseFileHandle;
begin
  if FFileHandle <> INVALID_HANDLE_VALUE then
  begin
    FileClose(FFileHandle);
  end;
  FFileHandle:=INVALID_HANDLE_VALUE;
end;

constructor TBaseLog.Create(const ALogFileName: String);
//var
begin
  LogKeyword:='OrangeUI';


  FLogFileName:=ALogFileName;

  FIsWriteLog:=False;
  FIsOutputLog:=True;

  //最大日志文件是10M
  FMaxFileSize:=10*1024*1024;
  FFileHandle:= INVALID_HANDLE_VALUE;
  LogDir:=GetApplicationPath+'log'+PathDelim;


//  {$IFDEF MSWINDOWS}
//  //如果是我王能的电脑,那么创建日志文件
//  if DirectoryExists('E:\MyFiles\') then
//  begin
//    LogDir:='E:\MyFiles\';
//    FIsWriteLog:=True;
//  end;
//  if DirectoryExists('C:\MyFiles\') then
//  begin
//    LogDir:='C:\MyFiles\';
//    FIsWriteLog:=True;
//  end;
////  FIsWriteLog:=True;
//  {$ENDIF}



//  //生成日志目录
//  if Not DirectoryExists(LogDir) then
//  begin
//    SysUtils.ForceDirectories(LogDir);
//  end;


  FLogFilePath:=LogDir+ALogFileName;


//  Result:=False;
  Self.LoadConfig;

end;

destructor TBaseLog.Destroy;
begin
  CloseFileHandle;
  inherited;
end;

Function TBaseLog.GetFileHandle(InCreate:Boolean):Boolean;
var
  AOldFileHandle:THandle;
begin
  Result:=False;

  if FIsWriteLog then
  begin


        //如果超过了一p-0ol.天,那么重建一个日志文件

        //测试一分钟
        //    if Ceil(FFileOpenTime)<>Ceil(Now) then
//        if DateUtils.MinutesBetween(Now,FFileOpenTime)>1 then
        if FormatDateTime('YYYY-MM-DD',FFileOpenTime)<>FormatDateTime('YYYY-MM-DD',Now) then
        begin
          FLogFilePath:=LogDir
                        +Copy(FLogFileName,1,Length(FLogFileName)-4)
                        +' '+FormatDateTime('YYYY-MM-DD',Now)
                        +Copy(FLogFileName,Length(FLogFileName)-4+1,MaxInt);
        end;




        if InCreate or Not FileExists(FLogFilePath) then
        begin
//            OutputDebugString('TBaseLog.GetFileHandle Need Create '+FLogFilePath);
            //关闭句柄
            CloseFileHandle;


            //生成日志目录
            if Not DirectoryExists(LogDir) then
            begin
              SysUtils.ForceDirectories(LogDir);
            end;

            //创建文件
            FFileHandle:=FileCreate(FLogFilePath, fmCreate or fmOpenWrite{$IFDEF POSIX},FileAccessRights{$ENDIF});


            FFileOpenTime:=Now;
            //解决第一次创建打不开的问题
            CloseFileHandle;
            FFileHandle:=FileOpen(FLogFilePath,fmOpenWrite);//{$IFDEF POSIX},FileAccessRights{$ENDIF});
            FFileOpenTime:=Now;


        end
        else
        begin
//            OutputDebugString('TBaseLog.GetFileHandle File Exist '+FLogFilePath);

            //存在文件,则打开文件
            if FFileHandle = INVALID_HANDLE_VALUE then
            begin

              //生成日志目录
              if Not DirectoryExists(LogDir) then
              begin
                SysUtils.ForceDirectories(LogDir);
              end;

              FFileHandle:=FileOpen(FLogFilePath,fmOpenWrite);//{$IFDEF POSIX},FileAccessRights{$ENDIF});
              FFileOpenTime:=Now;
            end;


            //文件最后
            if FFileHandle <> INVALID_HANDLE_VALUE then
            begin
              FileSeek(FFileHandle,0,2);
            end;

        end;


  end;
//  OutputDebugString('TBaseLog.GetFileHandle FFileHandle:'+IntToStr(FFileHandle));
//  OutputDebugString('TBaseLog.GetFileHandle INVALID_HANDLE_VALUE:'+IntToStr(INVALID_HANDLE_VALUE));

  if FFileHandle <> INVALID_HANDLE_VALUE then
  begin
    Result:=True;
  end
  else
  begin

  end;
end;

procedure TBaseLog.WriteLog(ALogString:String;ALogLevelType:TLogLevelType);
  {$IFDEF FMX}
var
  B: TBytes;
  {$ELSE}
var
  ALogAnsiStr:AnsiString;
  {$ENDIF}
begin
  if ALogLevelType<Self.FWriteLogLevelType then Exit;
  

//  OutputDebugString('TBaseLog.WriteLog Begin');
  if Not FIsWriteLog then Exit;

  if GetFileHandle(False) then
  begin
//    OutputDebugString('TBaseLog.WriteLog GetFileHandle Succ');
    try
        //转换成Ansi字符集
        {$IFDEF FMX}
        B := TEncoding.ANSI.GetBytes(ALogString);
        FileWrite(FFileHandle, B[0],Length(B));
        {$ELSE}
        ALogAnsiStr:=ALogString;
        FileWrite(FFileHandle, ALogAnsiStr[1],Length(ALogAnsiStr));
//        B := TEncoding.Default.GetBytes(ALogString);
        {$ENDIF}
    finally

    end;
  end
  else
  begin
//    OutputDebugString('TBaseLog.WriteLog GetFileHandle Fail');

  end;
end;

procedure TBaseLog.OutputDebugString(ADebugString:String;ALogLevelType:TLogLevelType);
{$IFDEF ANDROID}
var
  M: TMarshaller;
{$ENDIF}
begin
  if ALogLevelType<Self.FOutputLogLevelType then Exit;

  try

    {$IFDEF CONSOLE}
    writeln(ADebugString);
    {$ELSE}
//    {$IFDEF LINUX}
//    WriteLn(ADebugString);
//    {$ENDIF}

      {$IFDEF MSWINDOWS}
      OutputDebugStringW(PWideChar(ADebugString));
      {$ELSE}
        {$IFDEF FMX}

          {$IFDEF MSWINDOWS}
            //OutputDebugStringW(PWideChar(ADebugString));
          {$ELSE}
              {$IFDEF ANDROID}
                //Android服务端不能使用FMX.Types.Log.d
                LOGI(M.AsAnsi(LogKeyword+' '+ADebugString).ToPointer);
              {$ELSE}
                  {$IFDEF IOS}
                    Log.d(LogKeyword+' '+ADebugString);
                  {$ELSE}
                    Log.d(ADebugString);
                  {$ENDIF}
              {$ENDIF}
          {$ENDIF}
        {$ENDIF}
      {$ENDIF}

    {$ENDIF}
  except
    //如果有不能输出的字符,会报错导致闪退
  end;
end;

procedure TBaseLog.SaveConfig;
var
  AIniFile:TIniFile;
begin
  AIniFile:=TIniFile.Create(GetApplicationPath+'Config.ini'{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});
  try
    AIniFile.WriteBool('Log','IsWriteLog',FIsWriteLog);
    AIniFile.WriteBool('Log','IsOutputLog',FIsOutputLog);
    AIniFile.WriteInteger('Log','WriteLogLevelType',Ord(FWriteLogLevelType));
    AIniFile.WriteInteger('Log','OutputLogLevelType',Ord(FOutputLogLevelType));
  finally
    SysUtils.FreeAndNil(AIniFile);
  end;

end;

procedure TBaseLog.Debug(ADebugString:String;ALogLevelType:TLogLevelType);
begin
  if FIsWriteLog then WriteLog(ADebugString+#13#10,ALogLevelType);

  if FIsOutputLog then OutputDebugString(ADebugString,ALogLevelType);
end;



Initialization
  GlobalLog:=nil;

//  if DirectoryExists('C:\MyFiles') or DirectoryExists('D:\MyFiles') then
//  begin
//    //需要记录日志
//    uBaseLog.GetGlobalLog.IsWriteLog:=True;
//    if DirectoryExists('C:\MyFiles\') then
//    begin
//      uBaseLog.GetGlobalLog.LogDir:='C:\MyFiles\log\';
//    end;
//    if DirectoryExists('D:\MyFiles\log\') then
//    begin
//      uBaseLog.GetGlobalLog.LogDir:='D:\MyFiles\log\';
//    end;
//  end;



Finalization
  SysUtils.FreeAndNil(GlobalLog);




end.




