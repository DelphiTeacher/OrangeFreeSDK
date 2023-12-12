unit WebbrowserControlUtils;

interface

{$IFDEF MSWINDOWS}
// 设置IE8渲染模式
procedure SetIE8FeatureMode;
// 设置与IE同等的渲染模式
procedure SetIEFeatureModeCorrespond;
{$ENDIF}

implementation

{$IFDEF MSWINDOWS}
uses
  Windows, SysUtils, Registry;

function GetIEVersion: integer;
var
  reg: tregistry;
  readver: string;
begin
  try
    result := 7;
    if Win32MajorVersion > 5 then
      reg := tregistry.Create(KEY_READ or KEY_WOW64_32KEY)
    else
      reg := tregistry.Create;
    try
      reg.RootKey := HKEY_LOCAL_MACHINE;
      reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Internet Explorer');
      if (Win32MajorVersion > 5) and reg.ValueExists('svcVersion') then
        readver := reg.ReadString('svcVersion')
      else
      begin
        if reg.ValueExists('Version') then
          readver := reg.ReadString('Version');
      end;
      reg.CloseKey;
    finally
      reg.Free;
    end;
    if Length(readver) > 0 then
    begin
      readver := copy(readver, 1, pos('.', readver) - 1);
      result := strtointdef(readver, 7);
    end;
  except

  end;
end;
{$ENDIF}

{ *------------------------------------------------------------------------------
  设置浏览器模式

  @param AFeatureMode
------------------------------------------------------------------------------- }
  {$IFDEF MSWINDOWS}
procedure SetIEFeatureMode(AFeatureMode: integer);
var
  key: string;
begin
  try
    key := ExtractFileName(ParamStr(0));

    with tregistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        Access := KEY_READ or Key_write or KEY_WOW64_32KEY;
        OpenKey(
          'Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION', True);
        if not KeyExists(key) then
          WriteInteger(key, AFeatureMode);
        CloseKey;
      finally
        Free;
      end;
  except
    //会报异常,如果用户没有权限的话，failed to set data for ****.exe
  end;
end;
    {$ENDIF}

  {$IFDEF MSWINDOWS}
// 设置IE8渲染模式
procedure SetIE8FeatureMode;
var
  ver: integer;
begin
  ver := GetIEVersion;
  if ver < 8 then
    Exit;

  SetIEFeatureMode(8000);
end;
  {$ENDIF}

  {$IFDEF MSWINDOWS}
// 设置与IE同等的渲染模式
procedure SetIEFeatureModeCorrespond;
var
  ver, featureMode: integer;
begin
  ver := GetIEVersion;
  if ver < 8 then Exit;

  case ver of
    8:
      featureMode := 8888;
    9:
      featureMode := 9999;
    10:
      featureMode := 10001;
    11:
      featureMode := 11001;
  else
    featureMode := 8000;
  end;

  SetIEFeatureMode(featureMode);
end;
  {$ENDIF}

end.
