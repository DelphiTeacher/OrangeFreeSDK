//convert pas to utf8 by ¥
unit uAndroidLog;

interface

uses

  {$IFDEF ANDROID}
  Androidapi.Log,
  {$ELSE}
  FMX.Types,
  {$ENDIF}


  SysUtils;


procedure AndroidLogDebug(const Msg: string;Prefix:String='OrangeUI ');
procedure HandleException(AException: Exception; const AMethodName:String);

var
  LogTag:String;

implementation



procedure HandleException(AException: Exception; const AMethodName:String);
var
  ALogString:String;
begin
  ALogString:=' Method:'+AMethodName;

  if AException<>nil then
  begin
    ALogString:='Exception:'+AException.Message+ALogString;
  end;

  ALogString:=FormatDateTime('HH:MM:SS:ZZZ',Now)+' '+ALogString;

  {$IFDEF ANDROID}
  AndroidLogDebug(ALogString);
  {$ELSE}
  FMX.Types.Log.d('OrangeUI '+ALogString);
  {$ENDIF}
end;

procedure AndroidLogDebug(const Msg: string;Prefix:String);
{$IFDEF ANDROID}
var
  M: TMarshaller;
{$ENDIF}
begin
{$IFDEF ANDROID}
  LOGI(M.AsAnsi(Prefix+LogTag+Msg).ToPointer);
{$ELSE}
  FMX.Types.Log.d(Prefix+LogTag+Msg);
{$ENDIF}
end;


end.
