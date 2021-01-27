{*******************************************************}
{                                                       }
{           Delphi FireMonkey Mobile Services           }
{                                                       }
{     Implementation of interface for phone dialer      }
{                                                       }
{ Copyright(c) 2012-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.PhoneDialer.Android;

interface

{$SCOPEDENUMS ON}

procedure RegisterPhoneDialerService;
procedure UnregisterPhoneDialerService;

implementation

uses
  System.SysUtils, System.Generics.Collections, System.Math, System.NetEncoding, System.Permissions,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.Telephony, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.Net,
  Androidapi.JNIBridge, Androidapi.JNI.Os, Androidapi.JNI.Provider, Androidapi.Helpers,
  FMX.Consts, FMX.Platform, FMX.PhoneDialer, FMX.Helpers.Android, FMX.Types;

type
{ TAndroidCall }

  TAndroidCall = class sealed (TCall)
  strict private
    FCallID: string;
    FCallState: TCallState;
  public
    constructor Create(const ACallID: string; const ACallState: TCallState);
    function GetCallState: TCallState; override;
    function GetCallID: string; override;
    procedure UpdateCallState(const ACallState: TCallState);
  end;

  TAndroidCalls = TObjectList<TAndroidCall>;

{ TAndroidCarrier }

  TAndroidCarrier = class sealed (TCarrier)
  strict private
    FTelephonyManager: JTelephonyManager;
  public
    constructor Create;
    destructor Destroy; override;
    function GetIsoCountryCode: string; override;
    function GetMobileCountryCode: string; override;
    function GetMobileNetwork: string; override;
    function GetCarrierName: string; override;
  end;

{ TAndroidPhoneDialerService }

  TAndroidPhoneDialerService = class sealed (TPhoneDialerService)
  private
    type
      { TAndroidPhoneStateListener }

      TAndroidPhoneStateListener = class(TJavaLocal, JICustomPhoneStateListener)
      private
        [weak] FParent: TAndroidPhoneDialerService;
        FCalls: TAndroidCalls;
        LastRingNumber: string;
        LastActiveCallNumber: string;
        function GetCallCount: Integer;
        function AddCall(CallState: TCallState; IncomingNumber: string): Integer;
        procedure RemoveCall(IncomingNumber: string);
      public
        constructor Create(AParent: TAndroidPhoneDialerService);
        destructor Destroy; override;
        procedure onServiceStateChanged(P1: JServiceState); cdecl;
        procedure onSignalStrengthChanged(P1: Integer); cdecl;
        procedure onMessageWaitingIndicatorChanged(P1: Boolean); cdecl;
        procedure onCallForwardingIndicatorChanged(P1: Boolean); cdecl;
        procedure onCellLocationChanged(P1: JCellLocation); cdecl;
        procedure onCallStateChanged(State: Integer; IncomingNumber: JString); cdecl;
        procedure onDataConnectionStateChanged(P1: Integer); overload; cdecl;
        procedure onDataConnectionStateChanged(P1: Integer; P2: Integer); overload; cdecl;
        procedure onDataActivity(P1: Integer); cdecl;
        procedure onSignalStrengthsChanged(P1: JSignalStrength); cdecl;
        procedure onCellInfoChanged(P1: JList); cdecl;

        function GetIndexOfCall(const ANumber: string): Integer;

        property Calls: TAndroidCalls read FCalls;
        property CallCount: Integer read GetCallCount;
      end;
  strict private
    FTelephonyManager: JTelephonyManager;
    FPhoneStateListener: TAndroidPhoneStateListener;
    FCarrier: TAndroidCarrier;
    FCallLogs: JCallLog_Calls;
    FDialingNumber: string;
  private
    procedure RunListen;

    procedure DoStateCallChanged(const ACall: TAndroidCall);
    procedure DoStateServiceChanged;
  protected
    property DialingNumber: string read FDialingNumber write FDialingNumber;

  public
    constructor Create;
    destructor Destroy; override;

    function Call(const APhoneNumber: string): Boolean; override;
    function GetCurrentCalls: TCalls; override;
    function GetCarrier: TCarrier; override;
  end;

{$REGION 'Android - Delphi Helpers'}

function AndroidCallStateToTCallState(const ACallState: Integer): TCallState;
begin
  if ACallState = TJTelephonyManager.JavaClass.CALL_STATE_OFFHOOK then
    Result := TCallState.Connected
  else if ACallState = TJTelephonyManager.JavaClass.CALL_STATE_RINGING then
    Result := TCallState.Incoming
  else if ACallState = TJTelephonyManager.JavaClass.CALL_STATE_IDLE then
    Result := TCallState.Disconnected
  else
    Result := TCallState.None;
end;

{$ENDREGION}

procedure RegisterPhoneDialerService;
begin
  if TAndroidHelper.HasSystemService(TJPackageManager.JavaClass.FEATURE_TELEPHONY) then
    TPlatformServices.Current.AddPlatformService(IFMXPhoneDialerService, TAndroidPhoneDialerService.Create);
end;

procedure UnregisterPhoneDialerService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXPhoneDialerService);
end;

{ TAndroidPhoneStateListener }

constructor TAndroidPhoneDialerService.TAndroidPhoneStateListener.Create(AParent: TAndroidPhoneDialerService);
begin
  inherited Create;
  FCalls := TObjectList<TAndroidCall>.Create;
  FParent := AParent;
  LastRingNumber := '';
  LastActiveCallNumber := '';
end;

destructor TAndroidPhoneDialerService.TAndroidPhoneStateListener.Destroy;
begin
  FCalls.Free;
end;

function TAndroidPhoneDialerService.TAndroidPhoneStateListener.GetCallCount: Integer;
begin
  Result := FCalls.Count;
end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onCallForwardingIndicatorChanged(P1: Boolean);
begin

end;

function TAndroidPhoneDialerService.TAndroidPhoneStateListener.GetIndexOfCall(const ANumber: string): Integer;
var
 I: Integer;
begin
  Result := -1;

  // get index of the stored call
  for i:= 0 to FCalls.Count - 1 do
    if FCalls.Items[i].GetCallID = ANumber then
    begin
      Result := I;
      Exit;
    end;
end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.RemoveCall(IncomingNumber: string);
var
  LItem: TAndroidCall;
begin
  for LItem in FCalls do
    if LItem.GetCallID = IncomingNumber then
      FCalls.Remove(LItem);
end;

function TAndroidPhoneDialerService.TAndroidPhoneStateListener.AddCall(CallState: TCallState;
  IncomingNumber: string): Integer;
begin
  Result := FCalls.Add(TAndroidCall.Create(IncomingNumber, CallState));
end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onCallStateChanged(State: Integer; IncomingNumber: JString);
var
  I: Integer;
  TempIndex: Integer;
  LastRingIndex: Integer;
  LastCallIndex: Integer;
  DialingIndex: Integer;
begin
  if State = TJTelephonyManager.JavaClass.CALL_STATE_RINGING then
  begin // add call state in the call list
    if (JStringToString(IncomingNumber) <> '') then
    begin
      // get incoming number
      LastRingNumber := JStringToString(IncomingNumber);
      // add call into the array
      TempIndex := AddCall(AndroidCallStateToTCallState(State), LastRingNumber);

      // not found call number (accepted last ringing number)
      if (FParent <> nil) and (FParent.DialingNumber <> '') then
      begin
        // update dialing number state from dialing to connected
        DialingIndex := GetIndexOfCall(FParent.DialingNumber);
        if DialingIndex <> -1 then
        begin
          FCalls.Items[DialingIndex].UpdateCallState(AndroidCallStateToTCallState(State));
          FParent.DialingNumber := '';
        end;
      end;

      // callback
      if (FParent <> nil) and (TempIndex > -1) and (TempIndex < CallCount) then
        FParent.DoStateCallChanged(FCalls[TempIndex]);
    end;

  end // end CALL_STATE_RINGING
  else
  if State = TJTelephonyManager.JavaClass.CALL_STATE_OFFHOOK then
  begin // update call state as active
    // get index of the stored call
    TempIndex := GetIndexOfCall(JStringToString(IncomingNumber));
    // found incoming number (Canceled number)
    if TempIndex > -1 then
    begin
      LastActiveCallNumber := JStringToString(IncomingNumber);
      // update call state
      FCalls.Items[TempIndex].UpdateCallState(TCallState.Disconnected);
      // callback
      if FParent <> nil then
        FParent.DoStateCallChanged(FCalls[TempIndex]);
      // remove incoming call
      RemoveCall(LastActiveCallNumber);
    end
    else
    begin // not found call number (accepted last ringing number)
      if (FParent <> nil) and (FParent.DialingNumber <> '') then
      begin
        // add calling number
        LastRingIndex := AddCall(TCallState.Dialing, FParent.DialingNumber);
      end
      else
      begin
        // change last ringing number
        LastRingIndex := GetIndexOfCall(LastRingNumber);
        // if is a valid call index
        if InRange(LastRingIndex, 0, CallCount - 1) then
        begin
          // update call state from incoming to connected
          FCalls.Items[LastRingIndex].UpdateCallState(AndroidCallStateToTCallState(State));
          LastActiveCallNumber := FCalls.Items[LastRingIndex].GetCallID;
        end;
      end;
      // callback
      if (FParent <> nil) and (LastRingIndex > -1) and (LastRingIndex < CallCount) then
        FParent.DoStateCallChanged(FCalls.Items[LastRingIndex]);
    end; // end if TempIndex > -1

  end  // end CALL_STATE_OFFHOOK
  else
  if State = TJTelephonyManager.JavaClass.CALL_STATE_IDLE then
  begin // remove call from the active list
    // get index of the stored call
    TempIndex := GetIndexOfCall(JStringToString(IncomingNumber));

    // found incoming call stored (Canceled call)
    if TempIndex > -1 then
    begin
      // update call state
      FCalls.Items[TempIndex].UpdateCallState(AndroidCallStateToTCallState(State));
      // callback
      if FParent <> nil then
        FParent.DoStateCallChanged(FCalls.Items[TempIndex]);
      // remove dialed number
      RemoveCall(JStringToString(IncomingNumber));
    end
    else
    begin // not found call number
      if (FParent <> nil) and (FParent.DialingNumber <> '') then
      begin
        // get last active dialed number
        LastCallIndex := GetIndexOfCall(FParent.DialingNumber);
        // if is a valid call index
        if InRange(LastCallIndex, 0, CallCount - 1) then
        begin
          // update dialed state to connected
          FCalls.Items[LastCallIndex].UpdateCallState(AndroidCallStateToTCallState(State));
          // callback
          FParent.DoStateCallChanged(FCalls.Items[LastCallIndex]);
          // remove dialed number
          RemoveCall(FParent.DialingNumber);
          FParent.DialingNumber := '';
        end;
      end
      else
      if (LastActiveCallNumber <> '') then
      begin
        // get last active incoming number
        LastCallIndex := GetIndexOfCall(LastActiveCallNumber);
        // if is a valid call index
        if InRange(LastCallIndex, 0, CallCount - 1) then
        begin
          // update incoming call state to connected
          FCalls.Items[LastCallIndex].UpdateCallState(AndroidCallStateToTCallState(State));
          // callback
          if FParent <> nil then
            FParent.DoStateCallChanged(FCalls.Items[LastCallIndex]);
          // remove called number
          RemoveCall(LastActiveCallNumber);
        end;
      end;

    end;  // end if TempIndex > -1

    // remove remaining calls
    for I := FCalls.Count - 1 downto 0 do
    begin
      // callback
      if FParent <> nil then
      begin
        FCalls.Items[I].UpdateCallState(AndroidCallStateToTCallState(State));
        FParent.DoStateCallChanged(FCalls.Items[I]);
      end;
      RemoveCall(FCalls.Items[I].GetCallID);
    end;

    FCalls.Clear;
    LastRingNumber := '';
    LastActiveCallNumber := '';
  end; // end CALL_STATE_IDLE
end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onCellInfoChanged(P1: JList);
begin

end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onCellLocationChanged(P1: JCellLocation);
begin

end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onDataActivity(P1: Integer);
begin

end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onDataConnectionStateChanged(P1: Integer);
begin

end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onDataConnectionStateChanged(P1, P2: Integer);
begin

end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onMessageWaitingIndicatorChanged(P1: Boolean);
begin

end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onServiceStateChanged(P1: JServiceState);
begin
  if P1.getState = TJServiceState.JavaClass.STATE_IN_SERVICE then
    FParent.DoStateServiceChanged;

  if P1.getState = TJServiceState.JavaClass.STATE_OUT_OF_SERVICE then
    FParent.DoStateServiceChanged;
end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onSignalStrengthChanged(P1: Integer);
begin

end;

procedure TAndroidPhoneDialerService.TAndroidPhoneStateListener.onSignalStrengthsChanged(P1: JSignalStrength);
begin

end;

{ TAndroidCarrier }

constructor TAndroidCarrier.Create;
var
  TelephonyServiceNative: JObject;
begin
  TelephonyServiceNative := TAndroidHelper.Context.getSystemService(TJContext.JavaClass.TELEPHONY_SERVICE);
  if TelephonyServiceNative <> nil then
    FTelephonyManager := TJTelephonyManager.Wrap((TelephonyServiceNative as ILocalObject).GetObjectID);
end;

destructor TAndroidCarrier.Destroy;
begin
  FTelephonyManager := nil;
  inherited Destroy;
end;

function TAndroidCarrier.GetCarrierName: string;
begin
  Result := JStringToString(FTelephonyManager.getNetworkOperatorName);
end;

function TAndroidCarrier.GetIsoCountryCode: string;
begin
  Result := JStringToString(FTelephonyManager.getNetworkCountryIso);
end;

function TAndroidCarrier.GetMobileCountryCode: string;
var
  MCCAndMNC: string;
begin
  MCCAndMNC := JStringToString(FTelephonyManager.getNetworkOperator);
  Result := MCCAndMNC.Substring(0, 3);
end;

function TAndroidCarrier.GetMobileNetwork: string;
var
  MCCAndMNC: string;
begin
  MCCAndMNC := JStringToString(FTelephonyManager.getNetworkOperator);
  Result := MCCAndMNC.Substring(3);
end;

{ TAndroidPhoneDialerService }

function TAndroidPhoneDialerService.Call(const APhoneNumber: string): Boolean;
var
  PhoneUrl: Jnet_Uri;
  Intent: JIntent;
begin
  if not PermissionsService.IsPermissionGranted(
           JStringToString(TJManifest_permission.JavaClass.CALL_PHONE)) then
    raise EPermissionException.CreateFmt(SRequiredPermissionsAreAbsent, ['CALL_PHONE']);

  FDialingNumber := APhoneNumber.Replace('#', TNetEncoding.URL.Encode('#'));
  PhoneUrl := StrToJURI(Format('tel:%s', [FDialingNumber]));
  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_CALL, PhoneUrl);
  TAndroidHelper.Context.startActivity(Intent);
  Result := FTelephonyManager <> nil;
end;

constructor TAndroidPhoneDialerService.Create;
begin
  FTelephonyManager := TJTelephonyManager.Create;
  FPhoneStateListener := TAndroidPhoneStateListener.Create(Self);
  CallInUIThread(RunListen);
  FCarrier := TAndroidCarrier.Create;
  FDialingNumber := '';
end;

procedure TAndroidPhoneDialerService.RunListen;
begin
  FTelephonyManager.listen(TJCustomPhoneStateListener.JavaClass.init(FPhoneStateListener),
     TJPhoneStateListener.JavaClass.LISTEN_CALL_STATE or TJPhoneStateListener.JavaClass.LISTEN_SERVICE_STATE);
end;

destructor TAndroidPhoneDialerService.Destroy;
begin
  FCarrier.DisposeOf;
  FTelephonyManager := nil;
  FCallLogs := nil;
  inherited Destroy;
end;

procedure TAndroidPhoneDialerService.DoStateCallChanged(const ACall: TAndroidCall);
begin
  DoCallStateChanged(ACall.GetCallID, ACall.GetCallState);
end;

procedure TAndroidPhoneDialerService.DoStateServiceChanged;
begin
  FCarrier.DoCarrierChanged(FCarrier);
end;

function TAndroidPhoneDialerService.GetCarrier: TCarrier;
begin
  Result := FCarrier;
end;

function TAndroidPhoneDialerService.GetCurrentCalls: TCalls;
var
  I: Integer;
begin
  if FPhoneStateListener.Calls <> nil then
  begin
    SetLength(Result, FPhoneStateListener.CallCount);
    for I := 0 to FPhoneStateListener.CallCount - 1 do
      Result[I] := FPhoneStateListener.Calls[I];
  end;
end;

{ TAndroidCall }

constructor TAndroidCall.Create(const ACallID: string; const ACallState: TCallState);
begin
  FCallID := ACallID;
  FCallState := ACallState;
end;

function TAndroidCall.GetCallID: string;
begin
  Result := FCallID;
end;

function TAndroidCall.GetCallState: TCallState;
begin
  Result := FCallState;
end;

procedure TAndroidCall.UpdateCallState(const ACallState: TCallState);
begin
  FCallState := ACallState;
end;

end.

