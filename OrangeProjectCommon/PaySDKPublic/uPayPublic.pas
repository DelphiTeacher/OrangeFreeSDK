//convert pas to utf8 by ¥
//copyright delphiteacher QQ:452330643
//2015-08-08
//未经授权,严禁出售赠送或转上他人使用
//
unit uPayPublic;

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


uses
  SysUtils,
  StrUtils,

  {$IFDEF IN_ORANGESDK}
  //在OrangeSDK包里面
  uFileCommon_Copy,
  uFuncCommon_Copy,
  {$ELSE}
  //在OrangeUI里面
  uFileCommon,
  uFuncCommon,
  {$ENDIF}
  Classes;



function StandardStrToDateTime(Const Str:String):TDateTime;
function StandardDateTimeToStr(Const ADateTime:TDateTime):String;

function FuncUrlEncodeUTF8(const Str : String) : String;
function FuncUrlEncode(const S : String;SpaceCharReplace:String='20%') : String;overload;
//function FuncUrlEncode(const ABytes:Array of Byte;SpaceCharReplace:String='20%') : String;overload;
//创建新的订单号(仅用于测试)
function NewOrderNo:String;

function LowStr(AStr:String):Integer;
function HighStr(AStr:String):Integer;

function CreateUTF8StringStream(AStr:String):TStringStream;
function GetStreamUTF8String(AResponseContent:TStream):String;



var
  GlobalStandardFmtSettings: TFormatSettings;



implementation



function CreateUTF8StringStream(AStr:String):TStringStream;
  {$IF CompilerVersion < 21.0}//D7
var
  AUTF8Str:UTF8String;
  {$IFEND}
begin
  {$IF CompilerVersion < 21.0}//D7
  Result:=TStringStream.Create('');

  AUTF8Str:=AnsiToUTF8(AStr);
  Result.WriteBuffer(PAnsiChar(AUTF8Str)^,Length(AUTF8Str)-1);


  {$ELSE}
  Result:=TStringStream.Create(AStr,TEncoding.UTF8);
  {$IFEND}
end;

function GetStreamUTF8String(AResponseContent:TStream):String;
var
  AResponseContentDataString_UTF8:UTF8String;
begin
    SetLength(AResponseContentDataString_UTF8,AResponseContent.Size);
    AResponseContent.Position:=0;
    AResponseContent.Read(AResponseContentDataString_UTF8[1],AResponseContent.Size);

    //转换成UTF8格式
    AResponseContentDataString_UTF8:=UTF8Decode(AResponseContentDataString_UTF8);
    Result:=AResponseContentDataString_UTF8;
end;


function LowStr(AStr:String):Integer;
begin
  {$IFDEF VCL}
    Result:=1;
  {$ELSE}
    Result:=Low(AStr);
  {$ENDIF}
end;

function HighStr(AStr:String):Integer;
begin
  {$IFDEF VCL}
    Result:=Length(AStr);
  {$ELSE}
    Result:=High(AStr);
  {$ENDIF}
end;



function NewOrderNo:String;
var
  ARandom:String;
begin
  Result:=FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Now);


//  Result:=ReplaceStr(Result,'-','');
//  Result:=ReplaceStr(Result,' ','');
//  Result:=ReplaceStr(Result,':','');

  //D7
  Result:=StringReplace(Result,'-','', [rfReplaceAll]);
  Result:=StringReplace(Result,' ','', [rfReplaceAll]);
  Result:=StringReplace(Result,':','', [rfReplaceAll]);


  Randomize;
  ARandom:=Copy(IntToStr(Random(MaxInt)),1,4);
  if Length(ARandom)<4 then
  begin
    ARandom:=Copy('00000',1,4-Length(ARandom))+ARandom;
  end;
  Result:=Result+'-'+ARandom;
end;

function StandardDateTimeToStr(Const ADateTime:TDateTime):String;
begin
  Result:=DateTimeToStr(ADateTime,GlobalStandardFmtSettings);
end;

function StandardStrToDateTime(Const Str:String):TDateTime;
begin
  if Str='' then
  begin
    Result:=0;
  end
  else
  begin
    Result:=StrToDateTime(Str,GlobalStandardFmtSettings);
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

function FuncUrlEncode(const S : String;SpaceCharReplace:String='20%') : String;
var
  I : Integer;
  Ch : Char;
begin
  Result := '';
  for I := LowStr(S) to HighStr(S) do begin
      Ch := S[I];
      if ((Ch >= '0') and (Ch <= '9')) or
         ((Ch >= 'a') and (Ch <= 'z')) or
         ((Ch >= 'A') and (Ch <= 'Z')) or
         (Ch = '.') or (Ch = '-') or (Ch = '_') or (Ch = '~')then
          Result := Result + Ch
      else if Ch=' ' then
          Result := Result + SpaceCharReplace
      else
          Result := Result + '%' + _IntToHex(Ord(Ch), 2);
  end;
end;


//function FuncUrlEncode(const ABytes:Array of Byte;SpaceCharReplace:String='20%') : String;overload;
//var
//  I : Integer;
//  Ch : Char;
//begin
//  Result := '';
//  for I := LowStr(S) to HighStr(S) do begin
//      Ch := S[I];
//      if ((Ch >= '0') and (Ch <= '9')) or
//         ((Ch >= 'a') and (Ch <= 'z')) or
//         ((Ch >= 'A') and (Ch <= 'Z')) or
//         (Ch = '.') or (Ch = '-') or (Ch = '_') or (Ch = '~')then
//          Result := Result + Ch
//      else if Ch=' ' then
//          Result := Result + SpaceCharReplace
//      else
//          Result := Result + '%' + _IntToHex(Ord(Ch), 2);
//  end;
//
//end;

function FuncUrlEncodeUTF8(const Str : String) : String;
var
  I : Integer;
  Ch : Char;
  {$IF CompilerVersion>=21.0}
  S:TBytes;
  {$ELSE}
  S:UTF8String;
  {$IFEND}
begin
  {$IF CompilerVersion>=21.0}
  S:=TEncoding.UTF8.GetBytes(Str);
  Result := '';
  for I := Low(S) to High(S) do begin
      Ch := Char(S[I]);
      if ((Ch >= '0') and (Ch <= '9')) or
         ((Ch >= 'a') and (Ch <= 'z')) or
         ((Ch >= 'A') and (Ch <= 'Z')) or
         (Ch = '.') or (Ch = '-') or (Ch = '_') or (Ch = '~')then
          Result := Result + Ch
      else
          Result := Result + '%' + _IntToHex(Ord(Ch), 2);
  end;
  {$ELSE}
  S:=Str;
  Result := '';
  for I := 1 to Length(S) do begin
      Ch := Char(S[I]);
      if ((Ch >= '0') and (Ch <= '9')) or
         ((Ch >= 'a') and (Ch <= 'z')) or
         ((Ch >= 'A') and (Ch <= 'Z')) or
         (Ch = '.') or (Ch = '-') or (Ch = '_') or (Ch = '~')then
          Result := Result + Ch
      else
          Result := Result + '%' + _IntToHex(Ord(Ch), 2);
  end;
  {$IFEND}
end;



initialization
  GlobalStandardFmtSettings.ShortDateFormat:='yyyy-MM-dd';
  GlobalStandardFmtSettings.DateSeparator:='-';
  GlobalStandardFmtSettings.LongTimeFormat:='hh:mm:ss';
  GlobalStandardFmtSettings.TimeSeparator:=':';



end.
