

unit uBaseFileSystem;

interface

uses
  Classes,
  SysUtils;

type
  TBaseFileSystem=class
  public
    //文件系统的路径分割符
    PathDelim:Char;
  public
    constructor Create;virtual;
  public
    //读取文件
    function ReadFile(const AFileName: string;var AContent:TStream): Boolean; virtual; abstract;
    //写入文件
    function WriteFile(const AFileName: string;const AContent: TStream): Boolean; virtual; abstract;
    //文件是否存在
    function FileExists(const AFileName: string): Boolean;virtual; abstract;
    //删除文件
    function DeleteFile(const AFileName: string): Boolean;virtual; abstract;


    //获取内置图片文件的相对路径
    function GetRelatedFilePath(const AFilePath: string): String;virtual; abstract;
    //内置图片文件是否存在
    function RelatedFileExists(const AFileName: string): Boolean;virtual; abstract;
    //取出文件名
    function ExtractFilePath(const AFilePath: string): string; virtual; abstract;
    function ExtractFileName(const AFileName: string): string; virtual; abstract;
    //复制文件
    function CopyRelatedFile(const ASrcFileName:String;const ADestFileName:String;bFailIfExists:Boolean):Boolean;virtual; abstract;




    //获取Html中引用该图片文件的URL
    function GetFileUrlPath(const ADir,AFileName:String;IsAbsolute:Boolean):String;virtual;abstract;
    //获取文件的URL
    function GetFilePath(const ADir,AFileName:String;IsAbsolute:Boolean):String;virtual;abstract;
    //获取外网的文件URL
    function GetBodyFilePath(const ADir,AFileName:String;IsAbsolute:Boolean):String;virtual;abstract;





    //创建文件接收流
    function CreateRecvFileStream(const AFileName: string): TStream; virtual; abstract;
    //保存文件接收流
    function SaveRecvFileStream(const AFileName: string;var AStream:TStream): Boolean; virtual; abstract;
  end;





//给特殊字符URLEncode,比如空格为%20
function UrlEncodeSpecialChar(const Url : WideString) : WideString;
function UrlEncodeSpecialChar1(const Url : WideString) : WideString;

implementation

function _IntToHex(Value: Integer; Digits: Integer): AnsiString;
begin
    Result := SysUtils.IntToHex(Value, Digits);
end;

function UrlEncodeSpecialChar(const Url : WideString) : WideString;
var
  I : Integer;
  Ch : Char;
begin
//  Result:=URL;
  Result := '';
  for I := 1 to Length(Url) do
  begin
    Ch := Url[I];
    if //(ByteType(Url,I)<>mbSingleByte) or //中文
       //(ByteType(Url,I)=mbSingleByte) and
       (Word(Ch)>127) or
       ((Ch >= '0') and (Ch <= '9')) or
       ((Ch >= 'a') and (Ch <= 'z')) or
       ((Ch >= 'A') and (Ch <= 'Z')) or
       (Ch = '.') or (Ch = '-') or (Ch = '_') or (Ch = '~')
        then
        Result := Result + Ch
    else
        Result := Result + '%' + _IntToHex(Ord(AnsiChar(Ch)), 2);
  end;
end;

function UrlEncodeSpecialChar1(const Url : WideString) : WideString;
var
  I : Integer;
  Ch : Char;
begin
//  Result:=URL;
  Result := '';
  for I := 1 to Length(Url) do
  begin
    Ch := Url[I];
    if
       (Ch <> '(') and (Ch <> ')')
        then
        Result := Result + Ch
    else
        Result := Result + '%' + _IntToHex(Ord(AnsiChar(Ch)), 2);
  end;
end;


{ TBaseFileSystem }

constructor TBaseFileSystem.Create;
begin

end;

end.
