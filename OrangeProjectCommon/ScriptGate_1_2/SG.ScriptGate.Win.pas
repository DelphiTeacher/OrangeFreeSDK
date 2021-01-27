unit SG.ScriptGate.Win;

//(*
{$IFNDEF MSWINDOWS}
{$WARNINGS OFF 1011}
interface
implementation
end.
{$ENDIF}
// *)

interface

procedure RegisterScriptGate;

implementation

uses
  SG.ScriptGate
  , SG.WebBrowserHelper
  , System.Classes
  , System.SysUtils
  , System.Rtti
  , System.Win.IEInterfaces
  , System.Win.InternetExplorer
  , WinApi.Windows
  , WinApi.ActiveX
  , FMX.Types
  , FMX.Platform
  , FMX.WebBrowser
  , FMX.Controls.Ole
  ;

type
  TOpenScriptGate = class(TScriptGate);

  TScriptGateWin = class(TScriptGateBase, IScriptGate)
  private var
    [Weak] FScriptGate: TOpenScriptGate;
    [Weak] FWebBrowser: TOleWebBrowser;
  protected
    procedure CallScript(
      const iScript: String;
      const iResultProc: TScriptGateResultProc); override;
    procedure Eval(
      const iScript: String;
      const iResultProc: TScriptGateResultProc); override;
    procedure BeforeNavigate(
      ASender: TObject;
      const pDisp: IDispatch;
      const URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant;
      var Cancel: WordBool);
  public
    constructor Create(const iScriptGate: TScriptGate);
    destructor Destroy; override;
  end;

  TScriptGateFactoryWin = class(TScriptGateFactory)
  public
    function CreateScriptGate(
      const iScriptGate: TScriptGate): IScriptGate; override;
  end;

procedure RegisterScriptGate;
begin
  TPlatformServices.Current.AddPlatformService(
    IScriptGateFactory,
    TScriptGateFactoryWin.Create);
end;

{ TScriptGateFactoryWin }

function TScriptGateFactoryWin.CreateScriptGate(
  const iScriptGate: TScriptGate): IScriptGate;
begin
  Result := TScriptGateWin.Create(iScriptGate);
end;


{ TScriptGateWin }

procedure TScriptGateWin.BeforeNavigate(
  ASender: TObject;
  const pDisp: IDispatch;
  const URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
var
  Target: String;
begin
  Target := URL;

  if (FScriptGate.CheckScheme(Target)) then
  begin
    Cancel := True;
    FScriptGate.CallEvent(Target);
  end;
end;

procedure TScriptGateWin.CallScript(
  const iScript: String;
  const iResultProc: TScriptGateResultProc);
var
  Doc: IHTMLDocument2;
  HtmlWin: IHTMLWindow2;
  DispParams: TDispParams;
  DispIDs: Integer;
  PropName: WideString;
  OleParams: TArray<OleVariant>;
  ExcepInfo: TExcepInfo;
  Name: PWideChar;
  V: OleVariant;
  OB, CB: Integer;
  i: Integer;
  SL: TStringList;
  Count: Integer;

  procedure CallResult(const iResult: String);
  begin
    if (Assigned(iResultProc)) then
      iResultProc(iResult);
  end;

  procedure CallErrorResult;
  begin
    CallResult('');
  end;

begin
  if (not Supports(FWebBrowser.Document, IHTMLDocument2, Doc)) then
  begin
    CallErrorResult;
    Exit;
  end;

  HtmlWin := Doc.parentWindow;
  if (HtmlWin = nil) then
  begin
    CallErrorResult;
    Exit;
  end;

  // ä÷êîñºÇ∆ÉpÉâÉÅÅ[É^ÇéÊìæÇ∑ÇÈ
  OB := iScript.IndexOf('(');
  CB := iScript.LastIndexOf(')');
  if (OB < 0) then
    PropName := iScript
  else
  begin
    PropName := iScript.Substring(0, OB);

    SL := TStringList.Create;
    try
      SL.CommaText := iScript.Substring(OB + 1, CB - OB - 1);
      Count := SL.Count;
      SetLength(OleParams, Count);
      Dec(Count);

      for i := 0 to Count do
        OleParams[i] := SL[Count - i];
    finally
      SL.DisposeOf;
    end;
  end;

  // ä÷êîÇÃ ID ÇéÊìæÇ∑ÇÈ
  Name := PWideChar(PropName);

  Doc.Script.GetIDsOfNames(
    GUID_NULL,
    @Name,
    1,
    LOCALE_SYSTEM_DEFAULT,
    @DispIDs);

  if (DispIDs = -1) or (not Assigned(iResultProc)) then
  begin
    HtmlWin.execScript(iScript, 'JavaScript');
    Exit;
  end;

  ZeroMemory(@DispParams, SizeOf(DispParams));
  DispParams.cArgs := Length(OleParams);

  GetMem(DispParams.rgvarg, DispParams.cArgs * SizeOf(TVariantArg));
  try
    for i := 0 to High(OleParams) do
    begin
      DispParams.rgvarg[i].vt := varVariant or varByRef;
      TVarData(DispParams.rgvarg[i]).VPointer := @OleParams[i];
    end;

    try
      if
        Doc.Script.Invoke(
          DispIDs,
          GUID_NULL,
          0,
          DISPATCH_METHOD,
          DispParams,
          @V,
          @ExcepInfo,
          nil)
        = S_OK
      then
        CallResult(V);
    except
      CallErrorResult;
    end;
  finally
    FreeMem(DispParams.rgvarg);
  end;
end;

constructor TScriptGateWin.Create(const iScriptGate: TScriptGate);
var
  Obj: TObject;
  RttiType: TRttiType;
  RttiField: TRttiField;
begin
  inherited Create;

  FScriptGate := TOpenScriptGate(iScriptGate);
  Obj :=  FScriptGate.WebBrowser.GetField<TObject>('FBrowser');
  if (Obj = nil) then
    Exit;

  RttiType := SharedContext.GetType(Obj.ClassType);
  if (RttiType = nil) then
    Exit;

  RttiField := RttiType.GetField('FInstance');
  if (RttiField = nil) then
    Exit;

  FWebBrowser := RttiField.GetValue(Obj).AsType<TOleWebBrowser>;
  FWebBrowser.OnBeforeNavigate2 := BeforeNavigate;
end;

destructor TScriptGateWin.Destroy;
begin
  FScriptGate := nil;

  inherited;
end;

procedure TScriptGateWin.Eval(
  const iScript: String;
  const iResultProc: TScriptGateResultProc);
begin
  CallScript('eval(' + iScript + ')', iResultProc);
end;

initialization
  RegisterScriptGate;

end.

