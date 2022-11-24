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
//  IOUtils,



  {$IFDEF MSWINDOWS}
    {$IF CompilerVersion >= 30.0}
    Winapi.Windows,
    {$ELSE}
    Windows,
    Forms,
    {$ENDIF}
  {$ENDIF}



  {$IFDEF FMX}
    {$IFDEF ANDROID}
    //Androidƽ̨��ʹ��FMX.Types.Log.d�������־,
    //�ڷ�������лῨ��
    Androidapi.Log,
    {$ELSE}
    FMX.Types,
    {$ENDIF}
//    {$IFDEF MSWINDOWS}
//    Winapi.Windows,
//    {$ENDIF}
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

  DateUtils;





Const
  CONST_BASELOG_FILENAME='OrangeUI.log';





type
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


    //��־�ļ�������ļ���С
    FMaxFileSize: Integer;

    //�ļ��򿪵�ʱ��,�����ж��Ƿ���Ҫ���½�һ����־�ļ�
    FFileOpenTime:TDateTime;


    procedure CloseFileHandle;
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
    procedure OutputDebugString(ADebugString:String);

    /// <summary>
    ///   <para>
    ///     д��־���ļ�
    ///   </para>
    ///   <para>
    ///     Write log to file
    ///   </para>
    /// </summary>
    procedure WriteLog(ALogString:String);

    /// <summary>
    ///   <para>
    ///     ��д��־�ļ�,�����������Ϣ
    ///   </para>
    ///   <para>
    ///     Write log file and output debug information
    ///   </para>
    /// </summary>
    procedure Debug(ADebugString:String);



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
    procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='');overload;
    /// <summary>
    ///   <para>
    ///     ��¼�쳣�ľ�����Ϣ
    ///   </para>
    ///   <para>
    ///     Record detail information of exception
    ///   </para>
    /// </summary>
    procedure HandleException(AException: Exception; const AMethodName:String);overload;
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
procedure OutputDebugString(ADebugString:String);

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
procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='';const APosition2: String='');overload;
/// <summary>
///   <para>
///     ��¼�쳣�ļ���Ϣ
///   </para>
///   <para>
///     Record detail information of exception
///   </para>
/// </summary>
procedure HandleException(AException: Exception;const AMethodName:String);overload;
procedure HandleException(const AMethodName:String;AException: Exception=nil);overload;





implementation





function GetGlobalLog:TBaseLog;
begin
  if GlobalLog=nil then
  begin
    GlobalLog:=TBaseLog.Create(CONST_BASELOG_FILENAME);
  end;
  Result:=GlobalLog;
end;

procedure HandleException(AException: Exception; const AMethodName:String; const AUnitName:String;const APosition: String='';const APosition2: String='');
begin
  GetGlobalLog.HandleException(AException, AUnitName, AMethodName, APosition+APosition2);
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

  ALogString:=FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Now)+' '+ALogString;
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

procedure TBaseLog.WriteLog(ALogString:String);
  {$IFDEF FMX}
var
  B: TBytes;
  {$ELSE}
var
  ALogAnsiStr:AnsiString;
  {$ENDIF}
begin
//  OutputDebugString('TBaseLog.WriteLog Begin');
  if Not FIsWriteLog then Exit;

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

    {$IFDEF CONSOLE}
    writeln(ADebugString);
    {$ENDIF}
//    {$IFDEF LINUX}
//    WriteLn(ADebugString);
//    {$ENDIF}

    {$IFDEF FMX}

      {$IFDEF MSWINDOWS}
        OutputDebugStringW(PWideChar(ADebugString));
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
  except
    //����в���������ַ�,�ᱨ��������
  end;
end;

procedure TBaseLog.Debug(ADebugString:String);
begin
  if FIsWriteLog then WriteLog(ADebugString+#13#10);

  if FIsOutputLog then OutputDebugString(ADebugString);
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



