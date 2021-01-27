unit uTaoBaoPublic;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Forms;

const

  //正式测试环境
  CONST_ONLINE_APIURL='http://dysmsapi.aliyuncs.com/';

function TaoBaoStrToDateTime(Const Str:String):TDateTime;
function TaoBaoDateTimeToStr(Const ADateTime:TDateTime):String;

function UrlEncode(URL: string): string;
function FuncUrlEncode(const S : String) : String;
function UrlEncodeUTF8(URL: UTF8String): string;
function FuncUrlEncodeUTF8(const S : UTF8String) : String;

function GetTempDir:String;

implementation

var
  GlobalTaoBaoFmtSettings: TFormatSettings;


function GetTempDir:String;
begin
  Result:=ExtractFilePath(Application.ExeName)+'Temp\';
  if Not DirectoryExists(Result) then
  begin
    SysUtils.ForceDirectories(Result);
  end;
end;

function TaoBaoDateTimeToStr(Const ADateTime:TDateTime):String;
begin
  Result:=DateTimeToStr(ADateTime,GlobalTaoBaoFmtSettings);
end;

function TaoBaoStrToDateTime(Const Str:String):TDateTime;
begin
  if Str='' then
  begin
    Result:=0;
  end
  else
  begin
    Result:=StrToDateTime(Str,GlobalTaoBaoFmtSettings);
  end;
end;

function _IntToHex(Value: Integer; Digits: Integer): String;
begin
  Result := SysUtils.IntToHex(Value, Digits);
end;

function XDigit(Ch : Char) : Integer;
begin
  if (Ch >= '0') and (Ch <= '9') then
      Result := Ord(Ch) - Ord('0')
  else
      Result := (Ord(Ch) and 15) + 9;
end;


function IsXDigit(Ch : Char) : Boolean;
begin
  Result := ((Ch >= '0') and (Ch <= '9')) or
            ((Ch >= 'a') and (Ch <= 'f')) or
            ((Ch >= 'A') and (Ch <= 'F'));
end;

function htoin(Value : PChar; Len : Integer) : Integer;
var
  I : Integer;
begin
  Result := 0;
  I      := 0;
  while (I < Len) and (Value[I] = ' ') do
      I := I + 1;
  while (I < len) and (IsXDigit(Value[I])) do begin
      Result := Result * 16 + XDigit(Value[I]);
      I := I + 1;
  end;
end;

function htoi2(Value : PChar) : Integer;
begin
  Result := htoin(Value, 2);
end;

function FuncUrlEncode(const S : String) : String;
var
  I : Integer;
  Ch : Char;
begin
  Result := '';
  for I := 1 to Length(S) do begin
      Ch := S[I];
      if ((Ch >= '0') and (Ch <= '9')) or
         ((Ch >= 'a') and (Ch <= 'z')) or
         ((Ch >= 'A') and (Ch <= 'Z')) or
         (Ch = '.') or (Ch = '-') or (Ch = '_') or (Ch = '~')then
          Result := Result + Ch
      else
          Result := Result + '%' + _IntToHex(Ord(Ch), 2);
  end;
end;

function FuncUrlEncodeUTF8(const S : UTF8String) : String;
var
  I : Integer;
  Ch : AnsiChar;
begin
  Result := '';
  for I := 1 to Length(S) do begin
      Ch := S[I];
      if ((Ch >= '0') and (Ch <= '9')) or
         ((Ch >= 'a') and (Ch <= 'z')) or
         ((Ch >= 'A') and (Ch <= 'Z')) or
         (Ch = '.') or (Ch = '-') or (Ch = '_') or (Ch = '~')then
          Result := Result + Ch
      else
          Result := Result + '%' + _IntToHex(Ord(Ch), 2);
  end;
end;

function urlEncode(URL: string): string;
var
  URL1: string;
begin
  URL1 := FuncUrlEncode(URL);
  //URL1 := StringReplace(URL1, '+', ' ', [rfReplaceAll, rfIgnoreCase]);
  result := URL1;
end;

function UrlEncodeUTF8(URL: UTF8String): string;
var
  URL1: string;
begin
  URL1 := FuncUrlEncodeUTF8(URL);
  //URL1 := StringReplace(URL1, '+', ' ', [rfReplaceAll, rfIgnoreCase]);
  result := URL1;
end;




initialization
  GlobalTaoBaoFmtSettings.ShortDateFormat:='yyyy-MM-dd';
  GlobalTaoBaoFmtSettings.DateSeparator:='-';
  GlobalTaoBaoFmtSettings.LongTimeFormat:='hh:mm:ss';
  GlobalTaoBaoFmtSettings.TimeSeparator:=':';



end.
