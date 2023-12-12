//convert pas to utf8 by
/// <summary>
///   <para>
///     ��־�Ļ���
///   </para>
///   <para>
///     Base class of log
///   </para>
/// </summary>
unit uBaseLog;



interface
{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}



//���ڹ����·���FrameWork.inc
//�����ڹ�������������FMX����ָ��
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}


//������Android������ʹ��
uses
  SysUtils,
  Classes,
  IOUtils,



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
    //Androidƽ̨��ʹ��FMX.Types.Log.d�������־,
    //�ڷ�������лῨ��
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
  //��OrangeSDK������
  uFileCommon_Copy,
  uFuncCommon_Copy,
  {$ELSE}
  //��OrangeUI����
  uFileCommon,
  uFuncCommon,
  {$ENDIF}

  IniFiles,
  DateUtils;





Const
  CONST_BASELOG_FILENAME='OrangeUI.log';





type
  //��־һ���ֳ�5���ȼ����ӵ͵��߷ֱ��ǣ�
  //
  //DEBUG
  //INFO
  //WARNING
  //ERROR
  //CRITICAL
  //˵��:
  //
  //DEBUG����ϸ����Ϣ,ͨ��ֻ���������������
  //INFO��ȷ��һ�а�Ԥ������
  //WARNING��һ���������,һЩ���벻�������鷢����,�����һЩ�����ڲ��õĽ���(���硣���̿ռ�͡�)�����������ܰ�Ԥ�ڹ�����
  //ERROR�������ص�����,���û��ִ��һЩ����
  //CRITICAL��һ�����صĴ���,���������������޷���������
  TLogLevelType=(lltDebug,//0
                 lltInfo,//1
                 lltWarnning,//2
                 lltError,//3
                 lltCritical//4
                 );

  TBaseLogEvent=procedure(const ALog:String;ALogLevelType:TLogLevelType) of object;

  TBaseLog=class
  private
    //�Ƿ�д��־���ļ�
    FIsWriteLog:Boolean;
    //�Ƿ����������Ϣ
    FIsOutputLog:Boolean;

    LogDir:String;

    //��־�ļ����ļ���
    FLogFileName:String;
    FLogFilePath:String;


    //��־�ļ��ľ��
    FFileHandle:THandle;

//    FIsCopyingLogFile:Boolean;

    //��־�ļ�������ļ���С
    FMaxFileSize: Integer;

    //�ļ��򿪵�ʱ��,�����ж��Ƿ���Ҫ���½�һ����־�ļ�
    FFileOpenTime:TDateTime;

    FWriteLogLevelType:TLogLevelType;
    FOutputLogLevelType:TLogLevelType;


    function GetFileHandle(InCreate:Boolean):Boolean;
  public
    constructor Create(const ALogFileName:String);
    Destructor Destroy;override;
  public

    //adb logcat | grep baidu
    /// <summary>
    ///   <para>
    ///     �ڰ�׿�������־�Ĺؼ���,�������
    ///   </para>
    ///   <para>
    ///     Keyword of output log on android,to filtration
    ///   </para>
    /// </summary>
    LogKeyword:String;

    procedure LoadConfig(AConfigFileName:string='Config.ini');
    procedure SaveConfig(AConfigFileName:string='Config.ini');
    procedure CloseFileHandle;
    function GetLogFilePath:String;
    function GetLogFileName:String;

    /// <summary>
    ///   <para>
    ///     ��־�ļ�������ļ���С
    ///   </para>
    ///   <para>
    ///     Max file size of log file
    ///   </para>
    /// </summary>
    property MaxFileSize:Integer read FMaxFileSize write FMaxFileSize;
  public
    FOnLog:TBaseLogEvent;
    //�Ƿ�д��־���ļ�
    property IsWriteLog:Boolean read FIsWriteLog write FIsWriteLog;
    //�Ƿ����������Ϣ
    property IsOutputLog:Boolean read FIsOutputLog write FIsOutputLog;


    /// <summary>
    ///   <para>
    ///     ���������Ϣ
    ///   </para>
    ///   <para>
    ///     Output debug information
    ///   </para>
    /// </summary>
    procedure OutputDebugString(ADebugString:String;ALogLevelType:TLogLevelType=lltDebug);

    /// <summary>
    ///   <para>
    ///     д��־���ļ�
    ///   </para>
    ///   <para>
    ///     Write log to file
    ///   </para>
    /// </summary>
    procedure WriteLog(ALogString:String;ALogLevelType:TLogLevelType=lltDebug);

    /// <summary>
    ///   <para>
    ///     ��д��־�ļ�,�����������Ϣ
    ///   </para>
    ///   <para>
    ///     Write log file and output debug information
    ///   </para>
    /// </summary>
    procedure Debug(ADebugString:String;ALogLevelType:TLogLevelType=lltDebug);


//    procedure CopyLogToDir(ADir:String);

    /// <summary>
    ///   <para>
    ///     ��¼�쳣����ϸ��Ϣ
    ///   </para>
    ///   <para>
    ///     Record detail information of exception
    ///   </para>
    /// </summary>
    /// <param name="AException">
    ///   �쳣
    ///  <para>
    ///  Exception
    ///  </para>
    /// </param>
    /// <param name="AModuleName">
    ///   ģ������
    ///  <para>
    ///  Module name
    ///  </para>
    /// </param>
    /// <param name="AUnitName">
    ///   ��Ԫ����
    ///  Unit name
    /// </param>
    /// <param name="AMethodName">
    ///   ��������
    ///  <para>
    ///  Method Name
    ///  </para>
    /// </param>
    /// <param name="APosition">
    ///   �쳣λ��
    ///  <para>
    ///  Position of exception
    ///  </para>
    /// </param>
    procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='';ALogLevelType:TLogLevelType=lltDebug);overload;
    /// <summary>
    ///   <para>
    ///     ��¼�쳣�ľ�����Ϣ
    ///   </para>
    ///   <para>
    ///     Record detail information of exception
    ///   </para>
    /// </summary>
    procedure HandleException(AException: Exception; const AMethodName:String;ALogLevelType:TLogLevelType=lltDebug);overload;
  end;



var
  //ȫ�ֵ���־����
  GlobalLog:TBaseLog;


/// <summary>
///   <para>
///     ��ȡȫ�ֵ���־����
///   </para>
///   <para>
///     Get global log
///   </para>
/// </summary>
function GetGlobalLog:TBaseLog;

/// <summary>
///   <para>
///     �����־
///   </para>
///   <para>
///     Output log
///   </para>
/// </summary>
procedure OutputDebugString(ADebugString:String;ALogLevelType:TLogLevelType=lltDebug);

/// <summary>
///   <para>
///     �����쳣�Ի���
///   </para>
///   <para>
///     Pop up dialog box of exception
///   </para>
/// </summary>
procedure ShowException(ADebugString:String);

/// <summary>
///   <para>
///     ��¼�쳣����ϸ��Ϣ
///   </para>
///   <para>
///     Record detail information of exception
///   </para>
/// </summary>
procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='';const APosition2: String='';ALogLevelType:TLogLevelType=lltDebug);overload;
/// <summary>
///   <para>
///     ��¼�쳣�ļ���Ϣ
///   </para>
///   <para>
///     Record detail information of exception
///   </para>
/// </summary>
procedure HandleException(AException: Exception;const AMethodName:String;ALogLevelType:TLogLevelType=lltDebug);overload;
procedure HandleError(AException: Exception;const AMethodName:String);
procedure HandleException(const AMethodName:String;AException: Exception=nil;ALogLevelType:TLogLevelType=lltDebug);overload;


function GetNewLogFileName(const ALogFileName:String):String;



implementation


function GetNewLogFileName(const ALogFileName:String):String;
begin
  Result:=Copy(ALogFileName,1,Length(ALogFileName)-4)
          +' '+FormatDateTime('YYYY-MM-DD',Now)
          +Copy(ALogFileName,Length(ALogFileName)-4+1,MaxInt);
end;



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

procedure TBaseLog.LoadConfig(AConfigFileName:string);
var
  AIniFile:TIniFile;
begin
  if FileExists(GetApplicationPath+AConfigFileName) then
  begin
    AIniFile:=TIniFile.Create(GetApplicationPath+AConfigFileName{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});
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

//procedure TBaseLog.CopyLogToDir(ADir: String);
//var
//  AOldIsWriteLog:Boolean;
//begin
//  uBaseLog.OutputDebugString('TBaseLog.CopyLogToDir ADir:'+ADir);
//  AOldIsWriteLog:=FIsWriteLog;
//  FIsWriteLog:=False;
//  try
//    try
//      CloseFileHandle;
//    //  CopyFile(FLogFilePath,ADir+ExtractFileName(FLogFilePath));
//  //    if FileExists(ADir+ExtractFileName(FLogFilePath)) then
//      if FileExists(GetLogFilePath) then
//      begin
//        TFile.Copy(GetLogFilePath,ADir+ExtractFileName(FLogFilePath),True);
//      end;
//    except
//      on E:Exception do
//      begin
//        uBaseLog.OutputDebugString('TBaseLog.CopyLogToDir '+E.Message);
//      end;
//    end;
//  finally
//    FIsWriteLog:=AOldIsWriteLog;
//  end;
//end;

constructor TBaseLog.Create(const ALogFileName: String);
//var
begin
  LogKeyword:='OrangeUI';


  FLogFileName:=ALogFileName;

  FIsWriteLog:=False;
  FIsOutputLog:=True;

  //�����־�ļ���10M
  FMaxFileSize:=10*1024*1024;
  FFileHandle:= INVALID_HANDLE_VALUE;
  LogDir:=GetApplicationPath+'log'+PathDelim;


//  {$IFDEF MSWINDOWS}
//  //����������ܵĵ���,��ô������־�ļ�
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



//  //������־Ŀ¼
//  if Not DirectoryExists(LogDir) then
//  begin
//    SysUtils.ForceDirectories(LogDir);
//  end;


  FLogFilePath:=LogDir+ALogFileName;


//  Result:=False;
  Self.LoadConfig('Config.ini');

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


        //���������һp-0ol.��,��ô�ؽ�һ����־�ļ�

        //����һ����
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
            //�رվ��
            CloseFileHandle;


            //������־Ŀ¼
            if Not DirectoryExists(LogDir) then
            begin
              SysUtils.ForceDirectories(LogDir);
            end;

            //�����ļ�
            FFileHandle:=FileCreate(FLogFilePath, fmCreate or fmOpenWrite{$IFDEF POSIX},FileAccessRights{$ENDIF});


            FFileOpenTime:=Now;
            //�����һ�δ����򲻿�������
            CloseFileHandle;
            FFileHandle:=FileOpen(FLogFilePath,fmOpenWrite);//{$IFDEF POSIX},FileAccessRights{$ENDIF});
            FFileOpenTime:=Now;


        end
        else
        begin
//            OutputDebugString('TBaseLog.GetFileHandle File Exist '+FLogFilePath);

            //�����ļ�,����ļ�
            if FFileHandle = INVALID_HANDLE_VALUE then
            begin

              //������־Ŀ¼
              if Not DirectoryExists(LogDir) then
              begin
                SysUtils.ForceDirectories(LogDir);
              end;

              FFileHandle:=FileOpen(FLogFilePath,fmOpenWrite);//{$IFDEF POSIX},FileAccessRights{$ENDIF});
              FFileOpenTime:=Now;
            end;


            //�ļ����
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

function TBaseLog.GetLogFileName: String;
begin
  //��������
  Result:=GetNewLogFileName(FLogFileName);
end;

function TBaseLog.GetLogFilePath: String;
begin
  FLogFilePath:=LogDir+GetLogFileName;
  Result:=FLogFilePath;
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
//  if not FIsCopyingLogFile then Exit;


  if GetFileHandle(False) then
  begin
//    OutputDebugString('TBaseLog.WriteLog GetFileHandle Succ');
    try
        //ת����Ansi�ַ���
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
    //��ܵ�д����,���ǰɣ��ᱻ����python������ݶ���ȥ
//    writeln('log_begin '+ADebugString+' log_end');
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
                //Android����˲���ʹ��FMX.Types.Log.d
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
    //����в���������ַ�,�ᱨ��������
  end;
end;

procedure TBaseLog.SaveConfig(AConfigFileName:string);
var
  AIniFile:TIniFile;
begin
  AIniFile:=TIniFile.Create(GetApplicationPath+AConfigFileName{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});
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

  if Assigned(FOnLog) then
  begin
    FOnLog(ADebugString,ALogLevelType);
  end;
end;



Initialization
  GlobalLog:=nil;

//  if DirectoryExists('C:\MyFiles') or DirectoryExists('D:\MyFiles') then
//  begin
//    //��Ҫ��¼��־
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



