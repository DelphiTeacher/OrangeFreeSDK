//convert pas to utf8 by
/// <summary>
///   <para>
///     �ļ��Լ�Ŀ¼�Ĳ���
///   </para>
///   <para>
///     Operate of file and directory
///   </para>
/// </summary>
unit uFileCommon;

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



uses
  SysUtils,
  Classes,
  Math,

//  {$IFDEF VCL}
//  Windows,
//  Forms,
//  {$ENDIF}
  {$IFDEF MSWINDOWS}
    {$IF CompilerVersion >= 30.0}
    Winapi.Windows,
    {$ELSE}
    Windows,
    Forms,
    {$IFEND}
  {$ENDIF}

  {$IFDEF FMX}
//  WindowsApi.Windows,
    {$IFDEF MSWINDOWS}
//    FMX.Forms,
    {$ENDIF}
  {$ENDIF}

  {$IFDEF FMX}
  System.IOUtils,
  {$ENDIF}

  {$IFDEF IN_ORANGESDK}
  uFuncCommon_Copy,
  {$ELSE}
  uFuncCommon,
  {$ENDIF}

  StrUtils;





/// <summary>
///   <para>
///     ��ȡ����ĸ�Ŀ¼
///   </para>
///   <para>
///     Get program's root directory
///   </para>
/// </summary>
function GetApplicationPath:String;

/// <summary>
///   <para>
///     ��ȡ�ļ���С���ַ���(����1024=1k)
///   </para>
///   <para>
///     Get string of file size (such as1024=1k)
///   </para>
/// </summary>
function GetFileSizeStr(AFileSize:Int64):String;
function GetFileSizeStr2(AFileSize:Int64):String;

/// <summary>
///   <para>
///     ��ȡ�Ϸ����ļ���
///   </para>
///   <para>
///     Get valid file name
///   </para>
/// </summary>
function GetValidFileName(const AInvalidFileName:String):String;

/// <summary>
///   <para>
///     ��ȡ�ļ���С
///   </para>
///   <para>
///     Get file size
///   </para>
/// </summary>
function GetSizeOfFile(const AFile : String) : Int64;

/// <summary>
///   <para>
///     ����Ŀ¼
///   </para>
///   <para>
///     Create directory
///   </para>
/// </summary>
procedure CreateFileDir(const AFileName:String);



/// <summary>
///   <para>
///     ȥ���ļ������һ��·���ָ���(C:\----C:)
///   </para>
///   <para>
///     Delete last path delimiter of file(C:\-----C:)
///   </para>
/// </summary>
//function RemoveDirLastPathDelim(const ADir:String):String;


function GetFileNameWithoutExt(const AFilePath:String):String;
function ExtractFileNameWithoutExt(const AFilePath:String):String;


implementation


function ExtractFileNameWithoutExt(const AFilePath:String):String;
begin
  Result:=GetFileNameWithoutExt(AFilePath);
end;

function GetFileNameWithoutExt(const AFilePath:String):String;
var
  AFileExt:String;
  AFileName:String;
begin
  AFileName:=ExtractFileName(AFilePath);
  AFileExt:=ExtractFileExt(AFilePath);
  Result:=Copy(AFileName,LowStr(AFileName),Length(AFileName)-Length(AFileExt));
end;

//function RemoveDirLastPathDelim(const ADir:String):String;
//begin
//  Result:=ADir;
//  if Result[Result.Length-1]=PathDelim then
//  begin
//    Result:=Result.Remove(Result.Length-1);
//  end;
//end;

function GetSizeOfFile(const AFile : String) : Int64;
var
  FStream : TFileStream;
begin
  Try
    FStream := TFileStream.Create(AFile, fmOpenRead or fmShareDenyNone);
    Try
      Result := FStream.Size;
    Finally
      SysUtils.FreeAndNil(FStream);
    End;
  Except
    Result := 0;
  End;
end;

function GetValidFileName(const AInvalidFileName:String):String;
const
  CONST_SPEC_CHAR='/\:*?"<>|'#9#13#10;
var
  I: Integer;
  Index:Integer;
begin
  //���������ַ�
  //    /\:*?"<>|
  Result:=AInvalidFileName;
  for I := 1 to Length(CONST_SPEC_CHAR) do
  begin
    Index:=Pos(CONST_SPEC_CHAR[I],Result);
    while Index>0 do
    begin
      Result:=Copy(Result,1,Index-1)+Copy(Result,Index+1,Length(Result));
      Index:=PosEx(CONST_SPEC_CHAR[I],Result,Index);
    end;
  end;
end;


function GetFileSizeStr(AFileSize:Int64):String;
var
  ASize:Extended;
begin
  ASize:=AFileSize;
  if ASize<1024 then            {B}
  begin
    Result:=IntToStr(AFileSize)+'B';Exit;
  end;
  ASize:=ASize/1024;
  if ASize<1024 then            {KB}
  begin
    Result:=FloatToStr( Roundto( ASize,-2)    )+'KB';exit;
  end;
  ASize:=ASize/1024;
  if ASize<1024 then            {MB}
  begin
    Result:=FloatToStr( Roundto( ASize,-2)    )+'MB';exit;
  end;
  ASize:=ASize/1024;
  if ASize<1024 then            {GB}
  begin
    Result:=FloatToStr( Roundto( ASize,-2)    )+'GB';exit;
  end
  else
  begin
    Result:='';
  end;
end;

function GetFileSizeStr2(AFileSize:Int64):String;
var
  ASize:Extended;
begin
  ASize:=AFileSize;
  if ASize<1024 then            {B}
  begin
    Result:=IntToStr(AFileSize)+'B';Exit;
  end;
  ASize:=ASize/1024;
  if ASize<1024 then            {KB}
  begin
    Result:=FloatToStr( Roundto( ASize,-1)    )+'K';exit;
  end;
  ASize:=ASize/1024;
  if ASize<1024 then            {MB}
  begin
    Result:=FloatToStr( Roundto( ASize,-1)    )+'M';exit;
  end;
  ASize:=ASize/1024;
  if ASize<1024 then            {GB}
  begin
    Result:=FloatToStr( Roundto( ASize,-1)    )+'G';exit;
  end
  else
  begin
    Result:='';
  end;
end;

procedure CreateFileDir(const AFileName:String);
var
  FileDir:String;
begin
  FileDir:=ExtractFilePath(AFileName);
  if Not DirectoryExists(FileDir) then
  begin
    SysUtils.ForceDirectories(FileDir);
  end;
end;

function GetApplicationPath:String;
begin
  {$IFDEF FMX}
    Result:=System.IOUtils.TPath.GetDocumentsPath+PathDelim;
  {$ENDIF}

    {$IFDEF _MACOS}
    Result:=System.IOUtils.TPath.GetHomePath+PathDelim;
    {$ENDIF}

    {$IFDEF IOS}
    Result:=System.IOUtils.TPath.GetDocumentsPath+PathDelim;
    {$ENDIF}

    {$IFDEF Android}
    Result:=System.IOUtils.TPath.GetHomePath+PathDelim;
    {$ENDIF}


    {$IFDEF MSWINDOWS}
//    Result:=System.IOUtils.TPath.GetLibraryPath;
    Result:=ExtractFilePath(GetModuleName(HInstance));
    {$ENDIF}


  {$IFDEF VCL}
//  Result:=ExtractFilePath(Application.ExeName);
  Result:=ExtractFilePath(GetModuleName(HInstance));
  {$ENDIF}

  {$IFDEF LINUX}
//  Result:=ExtractFilePath(Application.ExeName);
  Result:=ExtractFilePath(GetModuleName(HInstance));
  {$ENDIF}

end;



end.




