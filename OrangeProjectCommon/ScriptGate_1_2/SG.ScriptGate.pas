unit SG.ScriptGate;

interface

uses
  System.Classes
  , System.SysUtils
  , System.Generics.Collections
  , FMX.Types
  , FMX.WebBrowser;

type
  TScriptGate = class;

  TScriptGateResultProc = reference to procedure (const iResult: String);

  IScriptGate = interface
    ['{281AF02F-9D97-4E6A-9B50-C38252163AE5}']
    procedure CallScript(
      const iScript: String;
      const iResultProc: TScriptGateResultProc);
    procedure Eval(
      const iScript: String;
      const iResultProc: TScriptGateResultProc);
  end;

  IScriptGateFactory = interface
    ['{1F5CE7A1-C5B4-4C15-AE52-0D6D2C06AB58}']
    function CreateScriptGate(const iScriptGate: TScriptGate): IScriptGate;
  end;

  TScriptGateFactory = class(TInterfacedObject, IScriptGateFactory)
  public
    function CreateScriptGate(const iScriptGate: TScriptGate): IScriptGate;
      virtual; abstract;
  end;

  TScriptGateBase = class(TInterfacedObject, IScriptGate)
  public
    procedure CallScript(
      const iScript: String;
      const iResultProc: TScriptGateResultProc); virtual; abstract;
    procedure Eval(
      const iScript: String;
      const iResultProc: TScriptGateResultProc); virtual;
  end;

  TScriptGate = class(TFmxObject)
  public const
    VERSION = '1.2';
  public type
    TCallErrorEvent = procedure (Sender: TScriptGate; E: Exception) of object;
    TCheckUrlEvent =
      procedure (
        Sender: TScriptGate;
        const iUrl: String;
        var ioDone: Boolean) of object;
    TScriptGateException = class(Exception);
    TScriptGateFieldNotFound = class(TScriptGateException);
    TScriptGateTargetTypeNotFound = class(TScriptGateException);
    TScriptGateMethodNotFound = class(TScriptGateException);
    TScriptGateParameterCountMismatch = class(TScriptGateException);
    TURLDic = TDictionary<String, Boolean>;
  private const
    SCHEME_SEP = ':';
    METHOD_START_SEP = '(';
    METHOD_END_SEP = ')';
    PARAM_SEP = ',';
    SQUOTE = '''';
    DQUOTE = '"';
    SEMICOLON = ';';
  private var
    FGate: IScriptGate;
    FReceiver: TObject;
    FWebBrowser: TWebBrowser;
    FScheme: String;
    FURLs: TURLDic;
    FOnBeforeCalled: TNotifyEvent;
    FOnAfterCalled: TNotifyEvent;
    FOnCallError: TCallErrorEvent;
    FOnCheckUrl: TCheckUrlEvent;
  protected
    procedure CallErrorEvent(const E: Exception);
    procedure CallEvent(iURL: String);
    function CheckScheme(const iURL: String): Boolean;
  public
    constructor Create(
      const iReceiver: TObject;
      const iWebBrowser: TWebBrowser;
      const iScheme: String); reintroduce;
    destructor Destroy; override;
    procedure CallScript(
      const iScript: String;
      const iResultProc: TScriptGateResultProc);
    procedure Eval(
      const iScript: String;
      const iResultProc: TScriptGateResultProc);
    property WebBrowser: TWebBrowser read FWebBrowser;
    property Scheme: String read FScheme write FScheme;
    property OnCheckUrl: TCheckUrlEvent read FOnCheckUrl write FOnCheckUrl;
    property OnBeforeCalled: TNotifyEvent
      read FOnBeforeCalled write FOnBeforeCalled;
    property OnAfterCalled: TNotifyEvent
      read FOnAfterCalled write FOnAfterCalled;
    property OnCallError: TCallErrorEvent
      read FOnCallError write FOnCallError;
  end;

implementation

uses
  System.Rtti
  , FMX.Platform
  , IdURI
  , SG.ScriptGateLog
  {$IFDEF MSWINDOWS}
  , SG.ScriptGate.Win
  {$ENDIF}
  {$IFDEF OSX}
  , SG.ScriptGate.Mac
  {$ENDIF}
  {$IFDEF ANDROID}
  , SG.ScriptGate.Android
  {$ENDIF}
  {$IFDEF IOS}
  , SG.ScriptGate.iOS
  {$ENDIF}
  ;

{ TScriptGate }

procedure TScriptGate.CallErrorEvent(const E: Exception);
begin
  if (E = nil) then
    LogD('TScriptGate.Error: nil error')
  else
    LogD('TScriptGate.Error: ' + E.Message);

  if (Assigned(FOnCallError)) then
    FOnCallError(Self, E);
end;

procedure TScriptGate.CallEvent(iURL: String);
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      Factors: TArray<String>;
      FactorsLen: Integer;
      Method: String;
      i: Integer;
      RttiType: TRttiType;
      RttiMethod: TRttiMethod;
      RttiParams: TArray<TRttiParameter>;
      VarParams: TArray<TValue>;
      ParamsLen: Integer;
      Factor: String;
    begin
      iURL := TIdURI.URLDecode(iURL);

      if (CheckScheme(iURL)) then
      begin
        iURL := iURL.Substring(FScheme.Length + 1);
        Factors := iURL.Split([METHOD_START_SEP]);
        Method := Factors[0];

        iURL := iURL.Substring(Method.Length + 1);
        Factors :=
          iURL.Split(
            [PARAM_SEP, METHOD_END_SEP],
            TStringSplitOptions.ExcludeEmpty);

        RttiType := SharedContext.GetType(FReceiver.ClassType);
        if (RttiType = nil) then
        begin
          CallErrorEvent(
            TScriptGateTargetTypeNotFound.Create(
              'Target type not found:' + FReceiver.ClassName));
          Exit;
        end;

        RttiMethod := RttiType.GetMethod(Method);
        if (RttiMethod = nil) then
        begin
          CallErrorEvent(
            TScriptGateMethodNotFound.Create('Method not found: ' + Method));
          Exit;
        end;

        FactorsLen := Length(Factors);
        RttiParams := RttiMethod.GetParameters;
        ParamsLen := Length(RttiParams);

        if (ParamsLen <> FactorsLen) then
        begin
          CallErrorEvent(
            TScriptGateParameterCountMismatch.Create(
              'Parameter count mismatch.'));
          Exit;
        end;

        SetLength(VarParams, Length(RttiParams));
        for i := Low(RttiParams) to High(RttiParams) do
        begin
          Factor := Factors[i].TrimRight;

          if (Factor.EndsWith(SEMICOLON)) then
            Factor := Factor.Substring(0, Factor.Length - 1).TrimRight;

          if (Factor.EndsWith(METHOD_END_SEP)) then
            Factor := Factor.Substring(0, Factor.Length - 1);

          Factor := Factor.Trim;
          Factor := Factor.DeQuotedString(SQUOTE);
          Factor := Factor.DeQuotedString(DQUOTE);

          case (RttiParams[i].ParamType.TypeKind) of
            TTypeKind.tkInteger,
            TTypeKind.tkInt64,
            TTypeKind.tkClass,
            TTypeKind.tkClassRef,
            TTypeKind.tkInterface,
            TTypeKind.tkPointer:
              try
                VarParams[i] := Factor.ToInteger;
              except
                VarParams[i] := 0;
              end;

            TTypeKind.tkFloat:
              VarParams[i] := Factor.ToDouble;

            TTypeKind.tkEnumeration:
              try
                VarParams[i] := Factor.ToBoolean;
              except
                VarParams[i] := Factor;
              end;

          else
            VarParams[i] := Factor;
          end;
        end;

        TThread.Synchronize(
          TThread.CurrentThread,
          procedure
          begin
            try
              if (Assigned(FOnBeforeCalled)) then
                FOnBeforeCalled(Self);

              RttiMethod.Invoke(FReceiver, VarParams);

              if (Assigned(FOnAfterCalled)) then
                FOnAfterCalled(Self);
            except
              on E: Exception do
                CallErrorEvent(E);
            end;
          end
        );
      end;
    end
  ).Start;
end;

procedure TScriptGate.CallScript(
  const iScript: String;
  const iResultProc: TScriptGateResultProc);
begin
  if (FGate = nil) then
  begin
    if (Assigned(iResultProc)) then
      iResultProc('');
  end
  else
    FGate.CallScript(iScript, iResultProc);
end;

function TScriptGate.CheckScheme(const iURL: String): Boolean;
var
  Done: Boolean;
begin
  Done := False;

  if (not FURLs.TryGetValue(iURL, Done)) and (Assigned(FOnCheckUrl)) then
  begin
    FOnCheckUrl(Self, iURL, Done);
    FURLs.Clear;
    FURLs.AddOrSetValue(iURL, Done);
  end;

  LogD('TScriptGate.CheckScheme.URL = ' + iURL);

  Result := iURL.StartsWith(FScheme + SCHEME_SEP) or Done;
end;

constructor TScriptGate.Create(
  const iReceiver: TObject;
  const iWebBrowser: TWebBrowser;
  const iScheme: String);
var
  GateFactory: IScriptGateFactory;
begin
  LogD('TScriptGate.Create');

  inherited Create(nil);

  FURLs := TURLDic.Create;

  FReceiver := iReceiver;
  FWebBrowser := iWebBrowser;
  FScheme := LowerCase(iScheme);

  if
    (
      TPlatformServices.Current.SupportsPlatformService(
        IScriptGateFactory,
        IInterface(GateFactory)
      )
    )
  then
  begin
    FGate := GateFactory.CreateScriptGate(Self);
    LogD('TScriptGate.Create.GATE_CREATED');
  end
  else
  begin
    LogD('TScriptGate.Create.NOT_FOUND_GATE');
  end;
end;

destructor TScriptGate.Destroy;
begin
  FURLs.DisposeOf;
  inherited;
end;

procedure TScriptGate.Eval(
  const iScript: String;
  const iResultProc: TScriptGateResultProc);
begin
  FGate.Eval(iScript, iResultProc);
end;

{ TScriptGateBase }

procedure TScriptGateBase.Eval(
  const iScript: String;
  const iResultProc: TScriptGateResultProc);
var
  InSQuote: Boolean;
  SB: TStringBuilder;
  C: Char;
  R: String;
begin
  R := iScript;
  SB := TStringBuilder.Create;
  try
    SB.Append('eval("');

    InSQuote := False;
    for C in iScript do
    begin
      R := C;

      case C of
        '''':
          InSQuote := not InSQuote;

        '"':
          if (not InSQuote) then
            R := '\"';
      end;

      SB.Append(R);
    end;

    SB.Append('")');

    R := SB.ToString;
  finally
    SB.DisposeOf;
  end;

  CallScript(R, iResultProc);
end;

end.
