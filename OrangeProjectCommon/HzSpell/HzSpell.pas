//convert pas to utf8 by ¥

unit HzSpell;
{ version 4.1 }

interface

uses
  SysUtils, Classes;

type
  THzSpell = class(TComponent)
  protected
    FHzText: String;
    FSpell: String;
    FSpellH: String;
    procedure SetHzText(const Value: String);
    function GetHzSpell: String;
    function GetPyHead: String;
  public
    class function PyOfHz(Hz: String): String;
    class function PyHeadOfHz(Hz: String): String;
  published
    property HzText: String read FHzText write SetHzText;
    property HzSpell: String read GetHzSpell;
    property PyHead: String read GetPyHead;
  end;
{$I HzSpDat2.inc}

//procedure Register;

function GetHzPy(const AHzStr: string): string; overload;
function GetHzPy(HzChar: PByte; Len: Integer): String; overload;
function GetHzPyFull(HzChar: TBytes): String;
function GetHzPyHead(HzChar: PByte; Len: Integer): String;
function GetPyChars(HzChar: TBytes): String;

implementation

//procedure Register;
//begin
//  RegisterComponents('System', [THzSpell]);
//end;

function GetHzPy(const AHzStr: string): string;
var
  HzSpell1: THzSpell;
begin
  HzSpell1 := THzSpell.Create(nil);
  result := HzSpell1.PyHeadOfHz(AHzStr);
  freeandnil(HzSpell1);
end;

function GetHzPy(HzChar: PByte; Len: Integer): String;
var
  C: Char;
  Index: Integer;
begin
  result := '';
  if (Len > 1) and (HzChar[0] >= 129) and (HzChar[1] >= 64) then
  begin
    // 是否为 GBK 字符
    case HzChar[0] of
      163: // 全角 ASCII
        begin
          C := Chr(Ord(HzChar[1]) - 128);
          if CharInSet(C, ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '(', ')', '[', ']']) then
            result := C
          else
            result := '';
        end;
      162: // 罗马数字
        begin
          if HzChar[1] > 160 then
            result := string(CharIndex[Ord(HzChar[1]) - 160])
          else
            result := '';
        end;
      166: // 希腊字母
        begin
          if HzChar[1] in [$A1 .. $B8] then
            result := string(CharIndex2[Ord(HzChar[1]) - $A0])
          else if HzChar[1] in [$C1 .. $D8] then
            result := string(CharIndex2[Ord(HzChar[1]) - $C0])
          else
            result := '';
        end;
    else
      begin // 获得拼音索引
        Index := PyCodeIndex[Ord(HzChar[0]) - 128, Ord(HzChar[1]) - 63];
        if Index = 0 then
          result := ''
        else
          result := string(PyMusicCode[Index]);
      end;
    end;
  end
  else if Len > 0 then
  begin
    // 在 GBK 字符集外, 即半角字符
    if HzChar[0] in [Ord('a') .. Ord('z'),
                  Ord('A') .. Ord('Z'),
                  Ord('0') .. Ord('9'),
                  Ord('('), Ord(')'), Ord('['), Ord(']'), Ord('.'), Ord('!'),
                  Ord('@'), Ord('#'), Ord('$'), Ord('%'), Ord('^'), Ord('&'),
                   Ord('*'), Ord('-'), Ord('+'), Ord('<'), Ord('>'),
                   Ord('?'), Ord(':'), Ord('"')] then
      result := Char(HzChar[0])
    else
      result := '';
  end;
end;

function GetHzPyFull(HzChar: TBytes): String;
var
  i, Len: Integer;
  Py: String;
  function IsDouByte(C: Byte): Boolean;
  begin
    result := C >= 129;
  end;

begin
  result := '';
  i := 0;
  while i <= Length(HzChar)-1 do
  begin
    if IsDouByte(HzChar[i]) and (Length(HzChar) - i > 0) then
      Len := 2
    else
      Len := 1;
    Py := GetHzPy(@HzChar[i], Len);
    Inc(i, Len);
    if (result <> '') and (Py <> '') then
      result := result + ' ' + Py
    else
      result := result + Py;
  end;
end;

function GetHzPyHead(HzChar: PByte; Len: Integer): String;
begin
  result := Copy(GetHzPy(HzChar, Len), 1, 1);
end;

function GetPyChars(HzChar: TBytes): String;
var
  i, Len: Integer;
  Py: String;
  function IsDouByte(C: Byte): Boolean;
  begin
    result := C >= 129;
  end;

begin
  result := '';
  i := 0;
  while i <= Length(HzChar)-1 do
  begin
    if IsDouByte(HzChar[i]) and (Length(HzChar) - i > 0) then
      Len := 2
    else
      Len := 1;
    Py := GetHzPyHead(@HzChar[i], Len);
    Inc(i, Len);
    result := result + Py;
  end;
end;

{ THzSpell }

function THzSpell.GetHzSpell: String;
begin
  if FSpell = '' then
  begin
    result := GetHzPyFull(
            TEncoding.GetEncoding(936).GetBytes(FHzText)
            );
    FSpell := result;
  end
  else
    result := FSpell;
end;

function THzSpell.GetPyHead: String;
begin
  if FSpellH = '' then
  begin
    result := GetPyChars(TEncoding.GetEncoding(936).GetBytes(FHzText));
    FSpellH := result;
  end
  else
    result := FSpellH;
end;

class function THzSpell.PyHeadOfHz(Hz: String): String;
begin
  result := GetPyChars(TEncoding.GetEncoding(936).GetBytes(Hz));
end;

class function THzSpell.PyOfHz(Hz: String): String;
begin
  result := GetHzPyFull(TEncoding.GetEncoding(936).GetBytes(Hz));
end;

procedure THzSpell.SetHzText(const Value: String);
begin
  FHzText := Value;
  FSpell := '';
  FSpellH := '';
end;

end.
