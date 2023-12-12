unit ALIOSSUTIL;
{
  OSS (Open Storage Services) Delphi SDK v1.0.0 - Utilities
  The MIT License (MIT)
  Copyright (c) 2012 Guangzhou Cloudstrust Software Development Co., Ltd
  http://cloudstrust.com/
  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:
  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}
interface
uses
  IdCoderMIME,
  IdHashMessageDigest,
  IdHMACSHA1,
  SysUtils,
  StrUtils,
  IdGlobal,
  DateUtils,
  //PushHash,
  Classes,
  XMLIntf,
  XMLDoc;


//const
//  LOG_FILE = 'log.txt';
//Date Utilities
function GMDate(dummy: string): string;
function FullDateTimeDecode(date: string): TDateTime;
//Encryption Utilities
function Base64Encode(const Input: TBytes): string; overload;
function HexBase64Encode(const Input: string): string;
function MD5(const Input: String): String;
function EncryptHMACSha1(const Input,AKey:AnsiString): TBytes;
////Log Utilities
//procedure LogFile(const log: String);
//OS Utilities
//function GetOSVersion: string;
function GetFilesInDirectory(const path: PChar;vFileList:TStrings; const recursive: boolean; const exclude: string = '.|..|'): Longint; stdcall;
//function GetTempDirectory: string;
//String Utilities
function LastPos(const SubStr, S: string): Integer;
function HTMLEscape(const S: string): string;
function FormatXml(const xml: IXMLDocument): string;
function RemoveRootPrefix(const S: string): string;
function PureASCIIString(const S: string): boolean;

implementation

uses SysConst//, Windows
;

const
  DefShortDayNames: array[1..7] of string = (SShortDayNameSun,
    SShortDayNameMon, SShortDayNameTue, SShortDayNameWed,
    SShortDayNameThu, SShortDayNameFri, SShortDayNameSat);
  DefShortMonthNames: array[1..12] of string = (SShortMonthNameJan,
    SShortMonthNameFeb, SShortMonthNameMar, SShortMonthNameApr,
    SShortMonthNameMay, SShortMonthNameJun, SShortMonthNameJul,
    SShortMonthNameAug, SShortMonthNameSep, SShortMonthNameOct,
    SShortMonthNameNov, SShortMonthNameDec);
var
  vOldShortDayNames: array[1..7] of string;
  vOldShortMonthNames: array[1..12] of string;
var
  GlobalStandardFmtSettings: TFormatSettings;

procedure SaveDateSettings;
var
  i: integer;
begin
  for I := 1 to 7 do
  begin
    vOldShortDayNames[I] := GlobalStandardFmtSettings.ShortDayNames[I];
    GlobalStandardFmtSettings.ShortDayNames[I] := DefShortDayNames[I];
  end;
  for I := 1 to 12 do
  begin
    vOldShortMonthNames[I] := GlobalStandardFmtSettings.ShortMonthNames[I];
    GlobalStandardFmtSettings.ShortMonthNames[I] := DefShortMonthNames[I];
  end;
end;
procedure RestoreDateSettings;
var
  i: integer;
begin
  for I := 1 to 7 do
    GlobalStandardFmtSettings.ShortDayNames[I] := vOldShortDayNames[I];
  for I := 1 to 12 do
    GlobalStandardFmtSettings.ShortMonthNames[I] := vOldShortMonthNames[I];
end;
function GMDate(dummy: string): string;
var
//  system_datetime: TSystemTime;
  gmt: TDateTime;
  timeZone: TTimeZone;
begin
  //ignore parameter, just return current time
  //D, d M Y H:i:s GMT

//  GetSystemTime(system_datetime);
//  gmt := SystemTimeToDateTime(system_datetime);
  gmt:=Now();//DateUtils.UnixToDateTime()
  timeZone := TTimeZone.Local;
  gmt := timeZone.ToUniversalTime(gmt);


  SaveDateSettings;
  result := FormatDateTime('ddd, dd mmm yyyy hh:nn:ss "GMT"', gmt);
  //周二, 04 7月 2023 09:14:17 GMT
  //Sun, 22 Nov 2015 08:16:38 GMT
  result:=ReplaceStr(result,'周一','Mon');
  result:=ReplaceStr(result,'周二','Tue');
  result:=ReplaceStr(result,'周三','Wed');
  result:=ReplaceStr(result,'周四','Thu');
  result:=ReplaceStr(result,'周五','Fri');
  result:=ReplaceStr(result,'周六','Sat');
  result:=ReplaceStr(result,'周日','Sun');
  //Jan、Feb、Mar、Apr 、May、Jun、Jul、Aug、Sept、Oct、Nov、Dec
  result:=ReplaceStr(result,'1月','Jan');
  result:=ReplaceStr(result,'2月','Feb');
  result:=ReplaceStr(result,'3月','Mar');
  result:=ReplaceStr(result,'4月','Apr');
  result:=ReplaceStr(result,'5月','May');
  result:=ReplaceStr(result,'6月','Jun');
  result:=ReplaceStr(result,'7月','Jul');
  result:=ReplaceStr(result,'8月','Aug');
  result:=ReplaceStr(result,'9月','Sept');
  result:=ReplaceStr(result,'10月','Oct');
  result:=ReplaceStr(result,'11月','Nov');
  result:=ReplaceStr(result,'12月','Dec');


  RestoreDateSettings;
end;
function FullDateTimeDecode(date: string): TDateTime;
var
  oldDateSeparator: char;
begin
  oldDateSeparator := GlobalStandardFmtSettings.DateSeparator;
  GlobalStandardFmtSettings.DateSeparator := '-';
  date := StringReplace(date, 'T', ' ', [rfReplaceAll]);
  date := StringReplace(date, 'Z', '', [rfReplaceAll]);
  result := StrToDateTime(date,GlobalStandardFmtSettings); //2012-02-24T02:53:26.000Z
  GlobalStandardFmtSettings.DateSeparator := oldDateSeparator;
end;
function MD5(const Input: String): String;
var
  md51: TIdHashMessageDigest5; //md5 engine
begin
  //initialize md5 engine
  md51 := TIdHashMessageDigest5.Create;
  Result := md51.HashStringAsHex(Input);
  md51.Destroy;
end;
function EncryptHMACSha1(const Input, AKey:AnsiString): TBytes;
var
//  Key: TBytes;
//  AIdBytes:TIdBytes;
  AIdHMACSHA1:TIdHMACSHA1;
begin
//  Result:=THashSHA1.GetHMACAsBytes(BytesOf(Input),BytesOf(AKey));
  AIdHMACSHA1:=TIdHMACSHA1.Create;
  try
    AIdHMACSHA1.Key := TIdBytes(BytesOf(AKey));
    Result := TBytes(AIdHMACSHA1.HashValue(TIdBytes(BytesOf(Input))));
  finally
    AIdHMACSHA1.Free;
  end;
end;
function Base64Encode(const Input: TBytes): string;
begin
  Result := TIdEncoderMIME.EncodeBytes(TIdBytes(Input));
end;
function HexBase64Encode(const Input: string): string;
var
  I: integer;
  h: Byte;
  bytes: TBytes;
begin
  setlength(bytes, length(Input) div 2);
  for I := 1 to length(Input) div 2 do
  begin
    h := StrToInt('$'+copy(Input, i*2-1, 2));
    bytes[i-1] := h;
  end;
  Result := Base64Encode(bytes);
end;
//procedure LogFile(const log: String);
//var
//  f: TextFile;
//begin
//  AssignFile(f, LOG_FILE);
//  if FileExists(LOG_FILE) then
//    Append(f)
//  else
//    ReWrite(f);
//
//  Writeln(f, log);
//  CloseFile(f);
//end;
//function GetOSVersion: string;
//Var
//  OSVI:OSVERSIONINFO;
//begin
//  OSVI.dwOSversioninfoSize:=Sizeof(OSVERSIONINFO);
//  GetVersionEx(OSVI);
//  result := 'Windows NT ' + IntToStr(OSVI.dwMajorVersion)+'.'+IntToStr(OSVI.dwMinorVersion);
//end;
function LastPos(const SubStr, S: string): Integer;
var
  Found, Len, Pos: integer;
begin
  Pos := Length(S);
  Len := Length(SubStr);
  Found := 0;
  while (Pos > 0) and (Found = 0) do
  begin
    if Copy(S, Pos, Len) = SubStr then
      Found := Pos;
    Dec(Pos);
  end;
  LastPos := Found;
end;
function GetFilesInDirectory(const path: PChar;vFileList:TStrings; const recursive: boolean; const exclude: string): Longint; stdcall;
var
  searchRec: TSearchRec;
  found: Integer;
  tmpStr: string;
begin
  tmpStr := StrPas(path) + '\*.*';
  found := FindFirst(tmpStr, faAnyFile, searchRec);
  while found = 0 do
  begin
    if Pos('|'+searchRec.Name+'|', '|'+exclude+'|') <> 0 then
    begin
      found := FindNext(searchRec);
      continue;
    end;
    if (searchRec.Attr and faDirectory) <> 0 then
    begin
      if (searchRec.Name <> '.') and (searchRec.Name <> '..') then
      begin
        tmpStr := StrPas(path) + '\' + searchRec.Name;
        if recursive then
          Result := Result + GetFilesInDirectory(PChar(tmpStr),vFileList, recursive, exclude); //recursive invoke
      end;
    end
    else begin
      Result := Result + 1;
      //append files
      vFileList.Add(StrPas(path) + '\' + searchRec.Name);
    end;
    found := FindNext(searchRec);
  end;
  SysUtils.FindClose(searchRec);
end;
//function GetTempDirectory: string;
//var
//  arr: array[0..MAX_PATH] of Char;
//  num: DWORD;
//begin
//  num := GetTempPath(MAX_PATH, arr);
//  result := arr;
//end;
function HTMLEscape(const S: string): string;
const
  search: array[1..5] of string =  ('<', '>', '&', '''', '"');
  replace: array[1..5] of string = ('&lt;','&gt;','&amp;','&apos;','&quot;');
var
  I: integer;
begin
  result := S;
  for I := Low(search) to High(search) do
  begin
    result := StringReplace(result, search[i], replace[i], [rfReplaceAll]);
  end;
end;
function FormatXml(const xml: IXMLDocument): string;
begin
  //bug fix: force to add encoding attribute
  result := StringReplace(xml.XML.Text, '?>', ' encoding="utf-8"?>', [rfReplaceAll]);
end;
function RemoveRootPrefix(const S: string): string;
begin
  if Copy(S, 1, 1) = '/' then
    result := Copy(S, 2, MaxInt)
  else
    result := S;
end;
function PureASCIIString(const S: string): boolean;
var
  temp: AnsiString;
begin
  temp := S;
  result := length(s) = length(temp);
end;
initialization
  GlobalStandardFmtSettings.ShortDateFormat:='yyyy-MM-dd';
  GlobalStandardFmtSettings.DateSeparator:='-';
  GlobalStandardFmtSettings.LongTimeFormat:='hh:mm:ss';
  GlobalStandardFmtSettings.TimeSeparator:=':';

end.
