//convert pas to utf8 by ¥
unit uModule_InterfaceSign;

interface

uses
  System.Classes  ,
  System.Hash ,
  SysUtils;

//const
//  Encry_password  = 'xfapp2020';

{$IFDEF MSWINDOWS}
const
  ENCRYPT_STRING_BASE_OFFSET=0;
{$ELSE}
const
  ENCRYPT_STRING_BASE_OFFSET=-1;
{$ENDIF}


type
  TNStringList = class(TStringList)
  protected
    function CompareStrings(const S1, S2: string): Integer; override;
  end;

Function myStrtoHex(s:string):string;                       //原字符串转16进制字符串
Function smyHextoStr(s:string):string;                      //16进制字符串转原字符串
function encryptstr(const s:string; skey:string):string;overload;    //加密字符串
function decryptstr(const s:string; skey:string):string;overload;    //解密字符串

//function encryptstr(const s:string):string; overload;       //加密字符串
//function decryptstr(const s:string):string; overload;       //解密字符串

function LoadSignAsStringList(sl:TStringList; skey:string):string;
function LoadMD5SignAsStringList(sl:TStringList; skey:string):string;


implementation


{ TNStringList }
function TNStringList.CompareStrings(const S1, S2: string): Integer;
  begin
    if CaseSensitive then
      Result := CompareStr(S1, S2)
    else
      Result := CompareText(S1, S2);
  end;


Function smyHextoStr(s:string):string;
  var
    hexS,tmpstr:string;
    i:integer;
    a:byte;
  begin
    hexS:=s;    //应该是该字符串
    if length(hexS) mod 2=1 then
    begin
        hexS:=hexS+'0';
    end;
    tmpstr:='';
    for i:=1 to (length(hexS) div 2) do
    begin
        a:=strtoint('$'+hexS[2*i-1+ENCRYPT_STRING_BASE_OFFSET]+hexS[2*i+ENCRYPT_STRING_BASE_OFFSET]);
        tmpstr := tmpstr+chr(a);
    end;
    result :=tmpstr;
  end;

Function myHextoStr(s:string):string;
  var
    hexS,tmpstr:string;
    i:integer;
    a:byte;
  begin
    hexS:=s;    //应该是该字符串
    if length(hexS) mod 2=1 then
    begin
        hexS:=hexS+'0';
    end;
    tmpstr:='';
    for i:=1 to (length(hexS) div 2) do
    begin
        a:=strtoint('$'+hexS[2*i-1+ENCRYPT_STRING_BASE_OFFSET]+hexS[2*i+ENCRYPT_STRING_BASE_OFFSET]);
        tmpstr := tmpstr+chr(a);
    end;
    result :=tmpstr;
  end;

function encryptstr(const s:string; skey:string):string;        //加密
  var
    i,j: integer;
    hexS,hexskey,midS,tmpstr:string;
    a,b,c:byte;

  begin
    hexS   :=myStrtoHex(s);
    hexskey:=myStrtoHex(skey);
    midS   :=hexS;
    for i:=1 to (length(hexskey) div 2)   do
    begin
        if i<>1 then midS:= tmpstr;
        tmpstr:='';
        for j:=1 to (length(midS) div 2) do
        begin
            a:=strtoint('$'+midS[2*j-1+ENCRYPT_STRING_BASE_OFFSET]+midS[2*j+ENCRYPT_STRING_BASE_OFFSET]);
            b:=strtoint('$'+hexskey[2*i-1+ENCRYPT_STRING_BASE_OFFSET]+hexskey[2*i+ENCRYPT_STRING_BASE_OFFSET]);
            c:=a xor b;
            tmpstr := tmpstr+myStrtoHex(chr(c));
        end;
    end;
    result := tmpstr;
  end;

function decryptstr(const s:string; skey:string):string;        //解密
  var
    i,j: integer;
    hexS,hexskey,midS,tmpstr:string;
    a,b,c:byte;
  begin
    try
      hexS  :=s;//应该是该字符串
      if length(hexS) mod 2=1 then begin
        //  showmessage('密文错误！');
        exit;
      end;

      hexskey:=myStrtoHex(skey);
      tmpstr :=hexS;
      midS   :=hexS;
      for i:=(length(hexskey) div 2) downto 1 do begin
          if i<>(length(hexskey) div 2) then midS:= tmpstr;
          tmpstr:='';
          for j:=1 to (length(midS) div 2) do
          begin
              a:=strtoint('$'+midS[2*j-1+ENCRYPT_STRING_BASE_OFFSET]+midS[2*j+ENCRYPT_STRING_BASE_OFFSET]);
              b:=strtoint('$'+hexskey[2*i-1+ENCRYPT_STRING_BASE_OFFSET]+hexskey[2*i+ENCRYPT_STRING_BASE_OFFSET]);
              c:=a xor b;
              tmpstr := tmpstr+myStrtoHex(chr(c));
          end;
      end;
      result := myHextoStr(tmpstr);
    except
      Result := '';
    end;
  end;

Function myStrtoHex(s: string): string;
  var
    tmpstr:string;
    i:integer;
  begin
    tmpstr := '';
    for i:=1 to length(s) do
    begin
        tmpstr := tmpstr + inttoHex(ord(s[i+ENCRYPT_STRING_BASE_OFFSET]),2);
    end;
    result := tmpstr;
  end;

//function encryptstr(const s:string):string;     //加密字符串
//  begin
//    Result := encryptstr(s, Encry_password);
//  end;
//
//function decryptstr(const s:string):string;
//  begin
//    Result := decryptstr(s, Encry_password);
//  end;

function LoadSignAsStringList(sl:TStringList; skey:string):string;   //获取sign签名
  var
    i     : Integer;
    sText : string;
    md5   : THashMD5;
    sl1   : TNStringList;
  begin
    Result := '';
    if sl = nil then Exit;

    sl1 :=  TNStringList.Create;

    for i := 0 to sl.Count -1  do begin
      sl1.Values[sl.Names[i]] :=  sl.ValueFromIndex[i];
    end;

    sl1.Sort;
    for i := 0 to sl1.Count - 1 do begin
      if i > 0 then  sText := sText + '&';
      sText := sText + sl1.Names[i] + '=' + sl1.ValueFromIndex[i] ;
    end;

    sText := md5.GetHashString(sText);
    Result := encryptstr(sText,skey);

    sl1.Free;
  end;


function LoadMD5SignAsStringList(sl:TStringList; skey:string):string;   //获取sign签名
  var
    i     : Integer;
    sText : string;
    md5   : THashMD5;
    sl1   : TNStringList;
  begin
    Result := '';
    if sl = nil then Exit;

    sl1 :=  TNStringList.Create;

    for i := 0 to sl.Count -1  do begin
      sl1.Values[sl.Names[i]] :=  sl.ValueFromIndex[i];
    end;

    sl1.Sort;
    for i := 0 to sl1.Count - 1 do begin
      if i > 0 then  sText := sText + '&';
      sText := sText + sl1.Names[i] + '=' + sl1.ValueFromIndex[i] ;
    end;

    sText := md5.GetHashString(sText+skey);
    Result := sText;//encryptstr(sText,skey);

    sl1.Free;
  end;

end.
