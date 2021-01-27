//convert pas to utf8 by ¥
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



  {$IFDEF VCL}
  Windows,
  Forms,
  {$ENDIF}



  {$IFDEF FMX}
    {$IFDEF ANDROID}
    //Android平台不使用FMX.Types.Log.d来输出日志,
    //在服务程序中会卡死
    Androidapi.Log,
    {$ELSE}
    FMX.Types,
    {$ENDIF}
    {$IFDEF MSWINDOWS}
    Winapi.Windows,
    {$ENDIF MSWINDOWS}
  {$ENDIF}




  uFuncCommon_Copy,
  uFileCommon_Copy;






Const
  CONST_BASELOG_FILENAME='OrangeUI.log';





type
  TBaseLog=class
  private
    //是否写日志到文件
    FIsWriteLog:Boolean;
    //是否输出调试信息
    FIsOutputLog:Boolean;

    //日志文件的文件名
    FLogFileName:String;
    //日志文件的句柄
    FFileHandle:THandle;


    //日志文件的最大文件大小
    FMaxFileSize: Integer;


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
    procedure OutputDebugString(ADebugString:String);

    /// <summary>
    ///   <para>
    ///     写日志到文件
    ///   </para>
    ///   <para>
    ///     Write log to file
    ///   </para>
    /// </summary>
    procedure WriteLog(ALogString:String);

    /// <summary>
    ///   <para>
    ///     既写日志文件,又输出调试信息
    ///   </para>
    ///   <para>
    ///     Write log file and output debug information
    ///   </para>
    /// </summary>
    procedure Debug(ADebugString:String);



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
    procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='');overload;
    /// <summary>
    ///   <para>
    ///     记录异常的精简信息
    ///   </para>
    ///   <para>
    ///     Record detail information of exception
    ///   </para>
    /// </summary>
    procedure HandleException(AException: Exception; const AMethodName:String);overload;
  end;





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
procedure OutputDebugString(ADebugString:String);

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
procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='');overload;
/// <summary>
///   <para>
///     记录异常的简单信息
///   </para>
///   <para>
///     Record detail information of exception
///   </para>
/// </summary>
procedure HandleException(AException: Exception;const AMethodName:String);overload;
procedure HandleException(const AMethodName:String;AException: Exception=nil);overload;





implementation



var
  //全局的日志对象
  GlobalLog:TBaseLog;


function GetGlobalLog:TBaseLog;
begin
  if GlobalLog=nil then
  begin
    GlobalLog:=TBaseLog.Create(CONST_BASELOG_FILENAME);
  end;
  Result:=GlobalLog;
end;

procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='');
begin
  GetGlobalLog.HandleException(AException, AUnitName, AMethodName, APosition);
end;

procedure HandleException(AException: Exception;const AMethodName:String);
begin
  GetGlobalLog.HandleException(AException, AMethodName);
end;

procedure HandleException(const AMethodName:String;AException: Exception=nil);
begin
  GetGlobalLog.HandleException(AException, AMethodName);
end;

procedure ShowException(ADebugString:String);
begin
  raise Exception.Create(ADebugString);
end;

procedure OutputDebugString(ADebugString:String);
begin
  GetGlobalLog.OutputDebugString(ADebugString);
  if GetGlobalLog.FIsWriteLog then GetGlobalLog.WriteLog(ADebugString+#13#10);
end;




{ TBaseLog }

procedure TBaseLog.HandleException(AException: Exception; const AMethodName:String;const AUnitName:String; const APosition: String='');
var
  ALogString:String;
begin

  ALogString:=' Unit:'+AUnitName+' Method:'+AMethodName+' Pos:'+APosition+'';

  if AException<>nil then
  begin
    ALogString:='Exception:'+AException.Message+ALogString;
  end;

  ALogString:=FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Now)+' '+ALogString;
  Debug(ALogString);
end;

procedure TBaseLog.HandleException(AException: Exception; const AMethodName:String);
var
  ALogString:String;
begin
  ALogString:=' Method:'+AMethodName;

  if AException<>nil then
  begin
    ALogString:='Exception:'+AException.Message+ALogString;
  end;

  ALogString:=FormatDateTime('HH:MM:SS:ZZZ',Now)+' '+ALogString;
  Debug(ALogString);
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
var
  LogDir:String;
begin
  LogKeyword:='OrangeUI';


  FIsWriteLog:=False;
  FIsOutputLog:=True;
  //最大日志文件是10M
  FMaxFileSize:=10*1024*1024;
  FFileHandle:= INVALID_HANDLE_VALUE;
  LogDir:=GetApplicationPath;


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



  //生成日志目录
  if Not DirectoryExists(LogDir) then
  begin
    SysUtils.ForceDirectories(LogDir);
  end;
  FLogFileName:=LogDir+ALogFileName;

end;

destructor TBaseLog.Destroy;
begin
  CloseFileHandle;
  inherited;
end;

Function TBaseLog.GetFileHandle(InCreate:Boolean):Boolean;
begin
  Result:=False;

  if FIsWriteLog then
  begin
    if InCreate or Not FileExists(FLogFileName) then
    begin
      //关闭句柄
      CloseFileHandle;
      //创建文件
      FFileHandle:=FileCreate(FLogFileName, fmCreate or fmOpenWrite or fmShareDenyNone);
    end
    else
    begin
      //存在文件,则打开文件
      if FFileHandle = INVALID_HANDLE_VALUE then
      begin
        FFileHandle:=FileOpen(FLogFileName,fmOpenWrite or fmShareDenyNone);
      end;
      //文件最后
      if FFileHandle <> INVALID_HANDLE_VALUE then
      begin
        FileSeek(FFileHandle,0,2);
      end;
    end;
  end;

  if FFileHandle <> INVALID_HANDLE_VALUE then
  begin
    Result:=True;
  end;
end;

procedure TBaseLog.WriteLog(ALogString:String);
  {$IFDEF FMX}
var
  B: TBytes;
  {$ENDIF}
  {$IFDEF VCL}
var
  ALogAnsiStr:AnsiString;
  {$ENDIF}
begin
  if Not FIsWriteLog then Exit;

  if GetFileHandle(False) then
  begin
    try
        //转换成Ansi字符集
        {$IFDEF FMX}
        B := TEncoding.ANSI.GetBytes(ALogString);
        FileWrite(FFileHandle, B[0],Length(B));
        {$ENDIF}
        {$IFDEF VCL}
        ALogAnsiStr:=ALogString;
        FileWrite(FFileHandle, ALogAnsiStr[1],Length(ALogAnsiStr));
//        B := TEncoding.Default.GetBytes(ALogString);
        {$ENDIF}
    finally

    end;
  end;
end;

procedure TBaseLog.OutputDebugString(ADebugString:String);
{$IFDEF ANDROID}
var
  M: TMarshaller;
{$ENDIF}
begin
  try
    {$IFDEF VCL}
    OutputDebugStringW(PWideChar(ADebugString));
    {$ENDIF}

    {$IFDEF FMX}

      {$IFDEF MSWINDOWS}
        OutputDebugStringW(PWideChar(ADebugString));
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
  except
    //如果有不能输出的字符,会报错导致闪退
  end;
end;

procedure TBaseLog.Debug(ADebugString:String);
begin
  if FIsWriteLog then WriteLog(ADebugString+#13#10);

  if FIsOutputLog then OutputDebugString(ADebugString);
end;



Initialization
  GlobalLog:=nil;


Finalization
  uFuncCommon_Copy.FreeAndNil(GlobalLog);




end.



