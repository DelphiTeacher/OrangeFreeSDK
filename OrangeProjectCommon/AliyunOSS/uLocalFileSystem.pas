unit uLocalFileSystem;

interface

uses
  Classes,
  SysUtils,
  Windows,
  uBaseFileSystem;


type
  TLocalFileSystem=class(TBaseFileSystem)
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    //读取文件
    function ReadFile(const AFileName: string;var AContent:TStream): Boolean; override;
    //写入文件
    function WriteFile(const AFileName: string;const AContent: TStream): Boolean; override;
    //文件是否存在
    function FileExists(const AFileName: string): Boolean; override;
    //删除文件
    function DeleteFile(const AFileName: string): Boolean;override;
    //内置文件是否存在
    function GetRelatedFilePath(const AFilePath: string): String;override;
    function RelatedFileExists(const AFileName: string): Boolean;override;
    function ExtractFileName(const AFileName: string): string;override;
    function ExtractFilePath(const AFilePath: string): string; override;
    //复制文件
    function CopyRelatedFile(const ASrcFileName:String;const ADestFileName:String;bFailIfExists:Boolean):Boolean;override;

    //获取Html中引用该文件的URL
    function GetFileUrlPath(const ADir,AFileName:String;IsAbsolute:Boolean):String;override;
    function GetFilePath(const ADir,AFileName:String;IsAbsolute:Boolean):String;override;
    function GetBodyFilePath(const ADir,AFileName:String;IsAbsolute:Boolean):String;override;

    //创建文件接收流
    function CreateRecvFileStream(const AFileName: string): TStream; overload;override;
    //保存文件接收流
    function SaveRecvFileStream(const AFileName: string;var AStream:TStream): Boolean; override;
  end;


var
  GlobalLocalFileSystem:TLocalFileSystem;

implementation

{ TLocalFileSystem }

function TLocalFileSystem.CopyRelatedFile(const ASrcFileName, ADestFileName: String;bFailIfExists: Boolean): Boolean;
begin
  SysUtils.ForceDirectories(SysUtils.ExtractFilePath(ADestFileName));
  Result:=Windows.CopyFile(PWideChar(ASrcFileName),PWideChar(ADestFileName),bFailIfExists);
end;

constructor TLocalFileSystem.Create;
begin
  Inherited;
  PathDelim:='\';
end;

function TLocalFileSystem.CreateRecvFileStream(const AFileName: string): TStream;
begin
  Result:=TMemoryStream.Create;
end;

function TLocalFileSystem.DeleteFile(const AFileName: string): Boolean;
begin
  Result:=SysUtils.DeleteFile(AFileName);
end;

destructor TLocalFileSystem.Destroy;
begin

  inherited;
end;

function TLocalFileSystem.ExtractFileName(const AFileName: string): string;
begin
  Result:=SysUtils.ExtractFileName(AFileName)
end;

function TLocalFileSystem.ExtractFilePath(const AFilePath: string): string;
begin
  Result:=SysUtils.ExtractFilePath(AFilePath)
end;

function TLocalFileSystem.FileExists(const AFileName: string): Boolean;
begin
  Result:=SysUtils.FileExists(AFileName);
end;

function TLocalFileSystem.GetBodyFilePath(const ADir, AFileName: String;IsAbsolute: Boolean): String;
begin
  Result:=GetFilePath(ADir,AFileName,IsAbsolute);
end;

function TLocalFileSystem.GetFilePath(const ADir, AFileName: String;IsAbsolute: Boolean): String;
begin
  if IsAbsolute then
  begin
    Result:=ADir+AFileName;
  end
  else
  begin
    Result:=AFileName;
  end;
end;

function TLocalFileSystem.GetFileUrlPath(const ADir,AFileName:String;IsAbsolute:Boolean): String;
begin
  if IsAbsolute then
  begin
    Result:=ADir+UrlEncodeSpecialChar(AFileName);
  end
  else
  begin
    Result:=UrlEncodeSpecialChar(AFileName);
  end;
end;

function TLocalFileSystem.GetRelatedFilePath(const AFilePath: string): String;
begin
  Result:=AFilePath;
end;

function TLocalFileSystem.ReadFile(const AFileName: string;var AContent:TStream): Boolean;
begin
  Result:=False;
  AContent:=nil;

  if FileExists(AFileName) then
  begin
    AContent:=TFileStream.Create(AFileName,fmOpenRead or fmShareDenyNone);
    Result:=True;
  end;

end;

function TLocalFileSystem.RelatedFileExists(const AFileName: string): Boolean;
begin
  Result:=SysUtils.FileExists(AFileName);
end;

function TLocalFileSystem.SaveRecvFileStream(const AFileName: string;var AStream: TStream): Boolean;
begin
  Result:=Self.WriteFile(AFileName,AStream);
end;

function TLocalFileSystem.WriteFile(const AFileName: string; const AContent: TStream): Boolean;
var
  AFileStream:TFileStream;
begin
  Result:=True;
  if Not DirectoryExists(ExtractFilePath(AFileName)) then
  begin
    SysUtils.ForceDirectories(ExtractFilePath(AFileName));
  end;
  AFileStream:=TFileStream.Create(AFileName,fmCreate or fmOpenWrite);
  try
    AContent.Position:=0;
    AFileStream.CopyFrom(AContent,AContent.Size);
    Result:=True;
  finally
    AFileStream.Free;
  end;
end;

initialization
  GlobalLocalFileSystem:=TLocalFileSystem.Create;
//  //共享
//  GlobalLocalFileSystem.IsShare:=True;

finalization
  GlobalLocalFileSystem.Free;


end.
