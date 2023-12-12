

unit uBaseFileSystem;

interface

uses
  Classes,
  SysUtils;

type
  TBaseFileSystem=class
  public
    //�ļ�ϵͳ��·���ָ��
    PathDelim:Char;
  public
    constructor Create;virtual;
  public
    //��ȡ�ļ�
    function ReadFile(const AFileName: string;var AContent:TStream): Boolean; virtual; abstract;
    //д���ļ�
    function WriteFile(const AFileName: string;const AContent: TStream): Boolean; virtual; abstract;
    //�ļ��Ƿ����
    function FileExists(const AFileName: string): Boolean;virtual; abstract;
    //ɾ���ļ�
    function DeleteFile(const AFileName: string): Boolean;virtual; abstract;


    //��ȡ����ͼƬ�ļ������·��
    function GetRelatedFilePath(const AFilePath: string): String;virtual; abstract;
    //����ͼƬ�ļ��Ƿ����
    function RelatedFileExists(const AFileName: string): Boolean;virtual; abstract;
    //ȡ���ļ���
    function ExtractFilePath(const AFilePath: string): string; virtual; abstract;
    function ExtractFileName(const AFileName: string): string; virtual; abstract;
    //�����ļ�
    function CopyRelatedFile(const ASrcFileName:String;const ADestFileName:String;bFailIfExists:Boolean):Boolean;virtual; abstract;




    //��ȡHtml�����ø�ͼƬ�ļ���URL
    function GetFileUrlPath(const ADir,AFileName:String;IsAbsolute:Boolean):String;virtual;abstract;
    //��ȡ�ļ���URL
    function GetFilePath(const ADir,AFileName:String;IsAbsolute:Boolean):String;virtual;abstract;
    //��ȡ�������ļ�URL
    function GetBodyFilePath(const ADir,AFileName:String;IsAbsolute:Boolean):String;virtual;abstract;





    //�����ļ�������
    function CreateRecvFileStream(const AFileName: string): TStream; virtual; abstract;
    //�����ļ�������
    function SaveRecvFileStream(const AFileName: string;var AStream:TStream): Boolean; virtual; abstract;
  end;





//�������ַ�URLEncode,����ո�Ϊ%20
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
    if //(ByteType(Url,I)<>mbSingleByte) or //����
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
