unit SG.ScriptGateLog;

interface

{$IFDEF DEBUG}
  //{$DEFINE NEED_SCRIPT_GATE_LOG}
{$ENDIF}

procedure LogD(const iMsg: String);

implementation

{$IFDEF NEED_SCRIPT_GATE_LOG}
uses
  System.SysUtils,
  FMX.Types;
{$ENDIF}

procedure LogD(const iMsg: String);
begin
{$IFDEF NEED_SCRIPT_GATE_LOG}
  Log.d(iMsg.Replace('%', '%%'), []);
{$ENDIF}
end;

end.