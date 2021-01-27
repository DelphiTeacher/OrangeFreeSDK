//https://quality.embarcadero.com/browse/RSP-21906
(*　仅支持 RAD10.3.1(10.3 Release 1)，其他版本请自行修改　*)


{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Datasnap.DSHTTPCommon;

interface

uses
  System.JSON,
  System.Classes,
  Data.DBXCommon,
  Data.DbxDatasnap,
  Data.DBXPlatform,
  DataSnap.DSService,
  Datasnap.DSCommon,
  System.Generics.Collections,
  System.SysUtils;

type

  /// <summary>Enumerates the HTTP command types processed by
  /// DataSnap.</summary>
  TDSHTTPCommandType = (hcUnknown, hcGET, hcPOST, hcDELETE, hcPUT, hcOther);

  TDSHTTPRequest = class;
  TDSHTTPResponse = class;
  TDSHTTPContext = class;

  /// <summary>Encapsulates objects involved in dispatching HTTP
  /// requests.</summary>
  TDSHTTPDispatch = class
  public type
    TOwnedObjects = class
    private
      FDictionary: TDictionary<string, TObject>;
      function GetItem(const AName: string): TObject;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Add(const AObject: TObject); overload;
      procedure Add(const AName: string; const AObject: TObject); overload;
      procedure Remove(const AName: string);
      function Extract(const AName: string): TPair<string, TObject>;
      function TryGetValue(const AName: string; out AValue: TObject): Boolean;
      property Items[const I: string]: TObject read GetItem;
    end;
  private
    FOwnedObjects: TOwnedObjects;
    FRequest: TDSHTTPRequest;
    FResponse: TDSHTTPResponse;
    FContext: TDSHTTPContext;
    function GetOwnedObjects: TOwnedObjects;
  public
    constructor Create(const AContext: TDSHTTPContext; const ARequest: TDSHTTPRequest; const AResponse: TDSHTTPResponse);
    destructor Destroy; override;
    property Context: TDSHTTPContext read FContext;
    property Request: TDSHTTPRequest read FRequest;
    property Response: TDSHTTPResponse read FResponse;
  ///  <summary>Objects that should be destroyed after the request is dispatched.
  ///  </summary>
    property OwnedObjects: TOwnedObjects read GetOwnedObjects;
  end;

  ///  <summary>Abstract DataSnap HTTP Context
  ///  </summary>
  TDSHTTPContext = class
  public
    function Connected: Boolean; virtual; abstract;
  end;

  ///  <summary>Abstract DataSnap HTTP Request
  ///  </summary>
  TDSHTTPRequest = class
  protected
    function GetCommand: string; virtual; abstract;
    function GetCommandType: TDSHTTPCommandType; virtual; abstract;
    function GetDocument: string; virtual; abstract;
    function GetParams: TStrings; virtual; abstract;
    function GetPostStream: TStream; virtual; abstract;
    function GetAuthUserName: string; virtual; abstract;
    function GetAuthPassword: string; virtual; abstract;
    function GetURI: string; virtual; abstract;
    function GetPragma: string; virtual; abstract;
    function GetAccept: string; virtual; abstract;
    function GetRemoteIP: string; virtual; abstract;
    function GetUserAgent: string; virtual; abstract;
    function GetProtocolVersion: string; virtual; abstract;
  public
    property CommandType: TDSHTTPCommandType read GetCommandType;
    property Document: string read GetDocument; // writable for isapi compatibility. Use with care
    property Params: TStrings read GetParams;
    property PostStream: TStream read GetPostStream;
    property AuthUserName: string read GetAuthUserName;
    property AuthPassword: string read GetAuthPassword;
    property Command: string read GetCommand;
    property URI: string read GetURI;
    property Pragma: string read GetPragma;
    property Accept: string read GetAccept;
    property RemoteIP: string read GetRemoteIP;
    property UserAgent: string read GetUserAgent;
    property ProtocolVersion: string read GetProtocolVersion;
  end;

  ///  <summary>Abstract DataSnap HTTP Response
  ///  </summary>
  TDSHTTPResponse = class
  protected
    function GetContentStream: TStream; virtual; abstract;
    function GetResponseNo: Integer; virtual; abstract;
    function GetResponseText: string; virtual; abstract;
    procedure SetContentStream(const Value: TStream); virtual; abstract;
    procedure SetResponseNo(const Value: Integer); virtual; abstract;
    procedure SetResponseText(const Value: string); virtual; abstract;
    function GetContentText: string; virtual; abstract;
    procedure SetContentText(const Value: string); virtual; abstract;
    function GetContentLength: Int64; virtual; abstract;
    procedure SetContentLength(const Value: Int64); virtual; abstract;
    function GetCloseConnection: Boolean; virtual; abstract;
    procedure SetCloseConnection(const Value: Boolean); virtual; abstract;
    function GetPragma: string; virtual; abstract;
    procedure SetPragma(const Value: string); virtual; abstract;
    function GetContentType: string; virtual; abstract;
    procedure SetContentType(const Value: string); virtual; abstract;
    function GetFreeContentStream: Boolean; virtual; abstract;
    procedure SetFreeContentStream(const Value: Boolean); virtual; abstract;
  public
    procedure SetHeaderAuthentication(const Value: string; const Realm: string); virtual; abstract;

    property FreeContentStream: Boolean read GetFreeContentStream write SetFreeContentStream;

    property ResponseNo: Integer read GetResponseNo write SetResponseNo;
    property ResponseText: string read GetResponseText write SetResponseText;
    property ContentType: string read GetContentType write SetContentType;
    property ContentStream: TStream read GetContentStream write SetContentStream;
    property ContentText: string read GetContentText write SetContentText;
    property ContentLength: Int64 read GetContentLength write SetContentLength;
    property CloseConnection: Boolean read GetCloseConnection write SetCloseConnection;
    property Pragma: string read GetPragma write SetPragma;
  end;

  ///  <summary> User event for logging http requests
  ///  </summary>
  TDSHTTPServiceTraceEvent = procedure(Sender: TObject; AContext: TDSHTTPContext;
                                    ARequest: TDSHTTPRequest;
                                    AResponse: TDSHTTPResponse) of object;

  ///  <summary> User event for capturing and optionally modifying REST results before they are returned.
  ///  </summary>
  ///  <remarks>The JSON value passed in is not wrapped in a 'result' object. If Handled is set to false,
  ///           then the caller will wrap the value of ResultVal like this: {'result':ResultVal}.
  ///           Note also that the value passed in may (and probably will) be a JSON Array, containing
  ///           one or more return values, depending on the method having been invoked.
  ///           If you change the value held by ResultVal, the new value will be returned.
  ///  </remarks>
  ///  <param name="Sender">The instance invoking the event.</param>
  ///  <param name="ResultVal">The JSON value being returned</param>
  ///  <param name="Command">The command being executed</param>
  ///  <param name="Handled">Set to true if the event handled the formatting of the result.</param>
  TDSRESTResultEvent = procedure(Sender: TObject; var ResultVal: TJSONValue;
                                 const Command: TDBXCommand;
                                 var Handled: Boolean) of object;

  /// <summary>Wrapper for an execution response. It can manage a command
  /// populated with either results or an error message.</summary>
  TDSExecutionResponse = class
  protected
    FCommand: TDBXCommand;
    FDBXConnection: TDBXConnection;
    FErrorMessage: string;
    FLocalConnection: Boolean;
  public
    constructor Create(Command: TDBXCommand; DBXConnection: TDBXConnection; LocalConnection: Boolean); overload; virtual;
    constructor Create(ErrorMessage: string); overload; virtual;
    destructor Destroy; override;

    property Command: TDBXCommand read FCommand;
    property ErrorMessage: string read FErrorMessage;
  end;

                                                                            

  /// <summary>Abstract class for common functionality of response handlers. It
  /// uses the result of a TDBXCommand to populate a TDSHTTPResponse object
  /// appropriately.</summary>
  TDSServiceResponseHandler = class abstract(TRequestCommandHandler)
  public type
    TParsingRequestEvent = procedure(Sender: TObject; const ARequest: string; const ASegments: TStrings; var ADSMethodName: string;
                         const AParamValues: TStrings; var AHandled: Boolean) of object;
    TParseRequestEvent = procedure(Sender: TObject; const ARequest: string; const ASegments: TStrings;
                         var ADSMethodName: string; const AParamValues: TStrings) of object;
  protected
    FCommandType: TDSHTTPCommandType;
    FCommandList: TList<TDSExecutionResponse>;
    FLocalConnection: Boolean;
    FForceResultArray: Boolean;
    FParsingRequestEvent: TParsingRequestEvent;
    FParseRequestEvent: TParseRequestEvent;

    function ByteContent(JsonValue: TJSONValue): TArray<Byte>; virtual;
    /// <summary> Returns the number of output parameters/errors combined in all of the managed commands.
    /// </summary>
    function GetResultCount: Integer; virtual;
    /// <summary> Populates errors into the response, if any. Returning true if errors were populated.
    /// </summary>
    function GetOKStatus: Integer; virtual;
  public
    constructor Create(CommandType: TDSHTTPCommandType; LocalConnection: Boolean); overload; virtual;
    destructor Destroy; override;

    procedure DoParsingRequest(Sender: TObject;
      const ARequest: string; const ASegments: TStrings; var ADSMethodName: string;
      const AParamValues: TStrings; var AHandled: Boolean);  virtual;
    procedure DoParseRequest(Sender: TObject;
      ARequest: string; const ASegments: TStrings; var ADSMethodName: string;
      const AParamValues: TStrings); virtual;

    /// <summary> Adds an error message to the handler.
    /// </summary>
    procedure AddCommandError(ErrorMessage: string); override;
    /// <summary> Adds a TDBXCommand for this handler to use when populating the response.
    /// </summary>
    /// <remarks> Multiple commands will exist if a batch execution was done instead fo a single invocation.
    ///    This assumes ownership of the commands.
    /// </remarks>
    procedure AddCommand(Command: TDBXCommand; DBXConnection: TDBXConnection); override;
    /// <summary> Clears the stored commands/errors
    /// </summary>
    procedure ClearCommands; override;
    /// <summary> Populates either Response or ResponseStream
    /// </summary>
    procedure GetResponse(out Response: TJSONValue; out ResponseStream: TStream; out ContainsErrors: Boolean); virtual; abstract;
    /// <summary> Populate the given response using the previously specified command and any
    ///    appropriate invocation metadata passed in.
    /// </summary>
    procedure PopulateResponse(AResponseInfo: TDSHTTPResponse;
                               InvokeMetadata: TDSInvocationMetadata); virtual; abstract;
    /// <summary> Handles the closing, or transitioning of the response handler.
    /// </summary>
    /// <remarks> Calling this releases the holder of responsibility to manage the memory of this instance
    ///    any further. However, there is no guarantee that the instance will be destroyed when this is called.
    /// </remarks>
    procedure Close; virtual; abstract;
    /// <summary> True to pass the result object back in an array even if there was only one command executed,
    ///    false to only pass back the result objects in an array if there was more than one command executed.
    ///    Defaults to false.
    /// </summary>
    property ForceResultArray: Boolean read FForceResultArray write FForceResultArray;
    property OnParseRequest: TParseRequestEvent read FParseRequestEvent write FParseRequestEvent;
    property OnParsingRequest: TParsingRequestEvent read FParsingRequestEvent write FParsingRequestEvent;
  end;

  /// <summary>Base class for response handlers that will translate the DBX
  /// commands into JSON.</summary>
  TDSJsonResponseHandler = class abstract(TDSServiceResponseHandler)
  protected
    FDSService: TDSService;
    FServiceInstanceOwner: Boolean;
    FAllowStream: Boolean;
    FResultEvent: TDSRESTResultEvent;

    procedure GetCommandResponse(Command: TDBXCommand; out Response: TJSONValue; out ResponseStream: TStream);
    /// <summary> Allows subclasses to handle each parameter as they see fit, or return False and allow
    ///    the base class to transform the parameter into a JSON representation.
    /// </summary>
    function HandleParameter(const Command: TDBXCommand; const Parameter: TDBXParameter;
                             out Response: TJSONValue; var ResponseStream: TStream): Boolean; virtual; abstract;

    procedure PopulateContent(ResponseInfo: TDSHTTPResponse; Response: TJSONValue;
                              ResponseStream: TStream); virtual; abstract;
    procedure ProcessResultObject(var ResultObj: TJSONObject; Command: TDBXCommand); virtual;
  public
    constructor Create(CommandType: TDSHTTPCommandType; DSService: TDSService;
                       ServiceInstanceOwner: Boolean = True); overload; virtual;
    destructor Destroy; override;

    procedure GetResponse(out Response: TJSONValue; out ResponseStream: TStream;
                          out ContainsErrors: Boolean); override;
    procedure PopulateResponse(ResponseInfo: TDSHTTPResponse;
                               InvokeMetadata: TDSInvocationMetadata); override;

    /// <summary>Event to call when a REST call is having its result built, to be returned.</summary>
    property ResultEvent: TDSRESTResultEvent read FResultEvent write FResultEvent;
  end;

  /// <summary>Used internally for TResultCommandHandler
  /// implementations.</summary>
  TDSCommandComplexParams = class
  private
    [Weak]FCommand: TDBXCommand;
    FParameters: TList<TDBXParameter>;
  public
    constructor Create(Command: TDBXCommand); virtual;
    destructor Destroy; override;

    function GetParameterCount: Integer;
    function GetParameter(Index: Integer): TDBXParameter;
    function AddParameter(Parameter: TDBXParameter): Integer;

    property Command: TDBXCommand read FCommand;
  end;

  /// <summary>Wraps an instance of TRequestCommandHandler that wants to make
  /// itself cacheable.</summary>
  TDSCacheResultCommandHandler = class(TResultCommandHandler)
  protected
    FCommandWrapper: TRequestCommandHandler;
    FCacheCommands: TList<TDSCommandComplexParams>;
  public
    constructor Create(CommandWrapper: TRequestCommandHandler); virtual;
    destructor Destroy; override;

    function GetCommandCount: Integer; override;
    function GetParameterCount(Index: Integer): Integer; override;
    function GetCommand(Index: Integer): TDBXCommand; override;
    function GetCommandParameter(CommandIndex: Integer; ParameterIndex: Integer): TDBXParameter; overload; override;
    function GetCommandParameter(Command: TDBXCommand; Index: Integer): TDBXParameter; overload; override;

    property CacheCommands: TList<TDSCommandComplexParams> read FCacheCommands write FCacheCommands;
  end;

  /// <summary>Implementation of a request handler used when you don't care
  /// about getting a response from an execution.</summary>
  TDSNullResponseHandler = class(TDSJsonResponseHandler)
  protected
    function HandleParameter(const Command: TDBXCommand; const Parameter: TDBXParameter;
                             out Response: TJSONValue; var ResponseStream: TStream): Boolean; override;
    procedure PopulateContent(ResponseInfo: TDSHTTPResponse; Response: TJSONValue;
                              ResponseStream: TStream); override;
  public
    constructor Create(DSService: TDSService; CommandType: TDSHTTPCommandType; ServiceInstanceOwner: Boolean = True);
    procedure Close; override;
  end;

implementation

uses
  Data.DBXClientResStrs,
  Data.DBXJSONCommon;

const
  CMD_ERROR = 'error';
  CHANNEL_NAME = 'ChannelName';
  CLIENT_CHANNEL_ID = 'ClientChannelId';
  SECURITY_TOKEN = 'SecurityToken';
  AUTH_USER = 'AuthUserName';
  AUTH_PASSWORD = 'AuthPassword';

{ TDSServiceResponseHandler }

constructor TDSServiceResponseHandler.Create(CommandType: TDSHTTPCommandType; LocalConnection: Boolean);
begin
  FCommandType := CommandType;
  FCommandList := TObjectList<TDSExecutionResponse>.Create;
  FLocalConnection := LocalConnection;
  ForceResultArray := False;
end;

destructor TDSServiceResponseHandler.Destroy;
begin
  try
    ClearCommands;
    try
      FreeAndNil(FCommandList);
    except
    end;
  finally
    inherited;
  end;
end;

procedure TDSServiceResponseHandler.DoParseRequest(Sender: TObject;
  ARequest: string; const ASegments: TStrings; var ADSMethodName: string;
  const AParamValues: TStrings);
begin
  if Assigned(FParseRequestEvent) then
    FParseRequestEvent(Sender, ARequest, ASegments, ADSMethodName, AParamValues);
end;

procedure TDSServiceResponseHandler.DoParsingRequest(Sender: TObject;
  const ARequest: string; const ASegments: TStrings; var ADSMethodName: string;
  const AParamValues: TStrings; var AHandled: Boolean);
begin
  if Assigned(FParsingRequestEvent) then
    FParsingRequestEvent(Sender, ARequest, ASegments, ADSMethodName, AParamValues, AHandled);
end;

function TDSServiceResponseHandler.GetOKStatus: Integer;
begin
  case FCommandType of
    hcGET, hcDELETE, hcPOST: Result := 200;
    hcPUT: Result := 201;
    else
      Result := 501;
  end;
end;

function TDSServiceResponseHandler.GetResultCount: Integer;
var
  CommandWrapper: TDSExecutionResponse;
  Command: TDBXCommand;
  Count: Integer;
  ParamDirection: TDBXParameterDirection;
  I: Integer;
begin
  Count := 0;
  TMonitor.Enter(FCommandList);    // Do we need a lock here?
  try
    for CommandWrapper in FCommandList do
    begin
      if CommandWrapper.Command = nil then
        Inc(Count)
      else
      begin
        Command := CommandWrapper.Command;
        for I := 0 to Command.Parameters.Count - 1 do
        begin
          // select the output and return parameters for the response
          ParamDirection := Command.Parameters[I].ParameterDirection;
          if (ParamDirection = TDBXParameterDirections.OutParameter) or
             (ParamDirection = TDBXParameterDirections.InOutParameter) or
             (ParamDirection = TDBXParameterDirections.ReturnParameter) then
          begin
            Inc(Count);
          end;
        end;
      end;
    end;
  finally
    TMonitor.Exit(FCommandList);
    Result := Count;
  end;
end;

procedure TDSServiceResponseHandler.AddCommand(Command: TDBXCommand; DBXConnection: TDBXConnection);
begin
  if (Command <> nil) and (DBXConnection <> nil) then
  begin
    TMonitor.Enter(FCommandList);
    try
      FCommandList.Add(TDSExecutionResponse.Create(Command, DBXConnection, FLocalConnection));
    finally
      TMonitor.Exit(FCommandList);
    end;
  end;
end;

procedure TDSServiceResponseHandler.ClearCommands;
begin
  TMonitor.Enter(FCommandList);
  try
    FCommandList.Clear;
  finally
    TMonitor.Exit(FCommandList);
  end;
end;

procedure TDSServiceResponseHandler.AddCommandError(ErrorMessage: string);
begin
 if (ErrorMessage <> '') then
 begin
   TMonitor.Enter(FCommandList);
   try
     FCommandList.Add(TDSExecutionResponse.create(ErrorMessage));
   finally
     TMonitor.Exit(FCommandList);
   end;
 end;
end;

function TDSServiceResponseHandler.ByteContent(JsonValue: TJSONValue): TArray<Byte>;
var
  Buffer: TArray<Byte>;
begin
  if Assigned(JsonValue) then
  begin
    SetLength(Buffer, JsonValue.EstimatedByteSize);
    SetLength(Buffer, JsonValue.ToBytes(Buffer, 0));
  end;
  Result := Buffer;
end;

{ TDSExecutionResponse }

constructor TDSExecutionResponse.Create(Command: TDBXCommand; DBXConnection: TDBXConnection;
                                        LocalConnection: Boolean);
begin
  FCommand := Command;
  FDBXConnection := DBXConnection;
  FLocalConnection := LocalConnection;
  FErrorMessage := '';
end;

constructor TDSExecutionResponse.Create(ErrorMessage: string);
begin
  FCommand := nil;
  FDBXConnection := nil;
  FErrorMessage := ErrorMessage;
end;

destructor TDSExecutionResponse.Destroy;
begin
  if FCommand <> nil then
    FCommand.Close;

  if FDBXConnection <> nil then
    FDBXConnection.Close;

  FCommand.Free;

//  if FLocalConnection and (FDBXConnection <> nil) then
//    TDSServerConnection(FDBXConnection).ServerConnectionHandler.Free
//  else
  FDBXConnection.Free;

  inherited;
end;

{ TDSJsonResponseHandler }

constructor TDSJsonResponseHandler.Create(CommandType: TDSHTTPCommandType; DSService: TDSService;
                                          ServiceInstanceOwner: Boolean);
begin
  if not Assigned(DSService) then
    Raise TDSServiceException.Create(SRESTServiceMissing);

  inherited Create(CommandType, DSService.LocalConnection);
  FDSService := DSService;
  FServiceInstanceOwner := ServiceInstanceOwner;
end;

destructor TDSJsonResponseHandler.Destroy;
begin
  if FServiceInstanceOwner then
    FreeAndNil(FDSService);
  inherited;
end;

procedure TDSJsonResponseHandler.GetCommandResponse(Command: TDBXCommand; out Response: TJSONValue;
                                                    out ResponseStream: TStream);
var
  JsonParams: TJSONArray;
  JsonParam: TJSONValue;
  I: Integer;
  ParamDirection: TDBXParameterDirection;
  OwnParams: Boolean;
  ConvList: TObjectList<TDBXRequestFilter>;
  ResponseObj: TJSONObject;
  Handled: Boolean;
begin
  JsonParams := nil;
  OwnParams := false;
  ConvList := nil;
  ResponseStream := nil;
  Handled := False;

  try
    // collect the output/return parameters
    JsonParams := TJSONArray.Create;
    OwnParams := true;

    ConvList := TObjectList<TDBXRequestFilter>.Create(false);

    for I := 0 to Command.Parameters.Count - 1 do
    begin
      // select the output and return parameters for the response
      ParamDirection := Command.Parameters[I].ParameterDirection;
      if (ParamDirection = TDBXParameterDirections.OutParameter) or
         (ParamDirection = TDBXParameterDirections.InOutParameter) or
         (ParamDirection = TDBXParameterDirections.ReturnParameter) then
      begin
        JsonParam := nil;
        ConvList.Clear;

        {If a subclass doesn't handle the parameter themselves, then manage the parameter by either
         applying a filter on the result, or passing back the pure JSON representation}
        if not HandleParameter(Command, Command.Parameters[I], JsonParam, ResponseStream) then
        begin
          FDSService.FiltersForCriteria([I], I = Command.Parameters.Count - 1, ConvList);
          if ConvList.Count = 1 then
          begin
            if not ConvList.Items[0].CanConvert(Command.Parameters[I].Value) then
              Raise TDSServiceException.Create(Format(SCannotConvertParam, [I, ConvList.Items[0].Name]));
            JsonParam := ConvList.Items[0].ToJSON(Command.Parameters[I].Value, FDSService.LocalConnection);
          end
          else
          begin
            JsonParam := TDBXJSONTools.DBXToJSON(Command.Parameters[I].Value,
                              Command.Parameters[I].DataType, FDSService.LocalConnection);
          end;
        end;

        if JsonParam <> nil then
          JsonParams.AddElement(JsonParam);
      end;
    end;

    //Store the result array as a JSON Value, to make it more generic for the event and result object
    JsonParam := JsonParams;

    if Assigned(FResultEvent) then
      FResultEvent(Self, JsonParam, Command, Handled);

    if not Handled then
    begin
      ResponseObj := TJSONObject.Create(TJSONPair.Create(TJSONString.Create('result'), JsonParam));
      //allow subclasses to add to the result object if they wish
      ProcessResultObject(ResponseObj, Command);
      Response := ResponseObj;
    end
    else
      Response := JsonParam;

    OwnParams := false;
  finally
    FreeAndNil(ConvList);
    if OwnParams then
      JsonParams.Free;
  end;
end;

procedure TDSJsonResponseHandler.GetResponse(out Response: TJSONValue; out ResponseStream: TStream; out ContainsErrors: Boolean);
var
  CommandWrapper: TDSExecutionResponse;
  Command: TDBXCommand;
  SubResponse: TJSONValue;
  ResultArr: TJSONArray;
  ErrObj: TJSONObject;
begin
  ContainsErrors := false;
  ResponseStream := nil;
  ResultArr := nil;

  if ForceResultArray or (FCommandList.Count > 1) then
  begin
    ResultArr := TJSONArray.Create;
  end;

  try
    for CommandWrapper in FCommandList do
    begin
      //handle error message
      if CommandWrapper.Command = nil then
      begin
        ContainsErrors := True;
        ErrObj := TJSONObject.Create;
        ErrObj.AddPair(TJSONPair.Create(CMD_ERROR, CommandWrapper.ErrorMessage));

        if ResultArr <> nil then
        begin
          ResultArr.AddElement(ErrObj);
        end
        else
        begin
          Response := ErrObj;
          //there is only one command if ResultArr is nil but break here anyway just to be clear
          break;
        end;
      end
      //handle DBXCommand with results populated
      else
      begin
        SubResponse := nil;

        Command := CommandWrapper.Command;
        try
          GetCommandResponse(Command, SubResponse, ResponseStream);
        except on E: Exception do
          begin
            ContainsErrors := True;
            SubResponse := TJSONString.Create(E.Message);
          end;
        end;


        if ResponseStream <> nil then
        begin
          //ignore the content returned and free it, because the response content will be a stream
          FreeAndNil(SubResponse);
        end
        else
        begin
          if ResultArr <> nil then
          begin
            if SubResponse <> nil then
              ResultArr.AddElement(SubResponse);
          end
          else
          begin
            Response := SubResponse;
            //there is only one command if ResultArr is nil but break here anyway just to be clear
            break;
          end;
        end;
      end;
    end;
  finally
    if (ResponseStream = nil) and (ResultArr <> nil)  then
    begin
      Response := ResultArr;
    end
    else
    begin
      ResultArr.Free;
    end;
  end;

end;

procedure TDSJsonResponseHandler.PopulateResponse(ResponseInfo: TDSHTTPResponse;
                                                  InvokeMetadata: TDSInvocationMetadata);
var
  JsonResponse: TJSONValue;
  ResponseStream: TStream;
  ContainsErrors: Boolean;
begin
  JsonResponse := nil;
  ContainsErrors := False;

                                         
  FAllowStream := (GetResultCount = 1);

  if (not Assigned(FCommandList)) or (FCommandList.Count = 0) then
    raise TDSServiceException.Create(SCommandUnassigned);

  try
    // only parse the Command for output if no content is specified in the invocation metadata
    if (InvokeMetadata <> nil) and (InvokeMetadata.ResponseContent <> '') then
    begin
      if (InvokeMetadata.ResponseContent = ' ') then
        InvokeMetadata.ResponseContent := '';

//      ResponseInfo.ContentLength := ResponseInfo.ContentText.Length;
//bug found by [广州]老兜(2532880578)  15:11:51
//fix by flying wang.
      ResponseInfo.ContentLength := InvokeMetadata.ResponseContent.Length;
      // setting ContentText will override ContentLength by bytes length
      // of ContentText using current response encoding
      ResponseInfo.ContentText := InvokeMetadata.ResponseContent;
    end
    else
    begin
      GetResponse(JsonResponse, ResponseStream, ContainsErrors);
      PopulateContent(ResponseInfo, JsonResponse, ResponseStream);
    end;

    if (InvokeMetadata <> nil) and (InvokeMetadata.ResponseCode <> 0) then
      ResponseInfo.ResponseNo := InvokeMetadata.ResponseCode
    else if ContainsErrors then
      ResponseInfo.ResponseNo := 500
    else
      ResponseInfo.ResponseNo := GetOKStatus;

    if (InvokeMetadata <> nil) and (InvokeMetadata.ResponseMessage <> '') then
      ResponseInfo.ResponseText := InvokeMetadata.ResponseMessage;

    if (InvokeMetadata <> nil) and (InvokeMetadata.ResponseContentType <> '') then
      ResponseInfo.ContentType := InvokeMetadata.ResponseContentType;
  finally
    FreeAndNil(JsonResponse);
  end;
end;

procedure TDSJsonResponseHandler.ProcessResultObject(var ResultObj: TJSONObject; Command: TDBXCommand);
begin
  //default implementation does nothing
end;

{ TDSCommandComplexParams }

constructor TDSCommandComplexParams.Create(Command: TDBXCommand);
begin
  if Command = nil then
    Raise TDSServiceException.Create(SCommandUnassigned);
  FCommand := Command;
  FParameters := TList<TDBXParameter>.Create;
end;

destructor TDSCommandComplexParams.Destroy;
begin
  //Parameters in the list are managed by externally
  FParameters.Clear;
  FreeAndNil(FParameters);

  inherited;
end;

function TDSCommandComplexParams.AddParameter(Parameter: TDBXParameter): Integer;
begin
  Result := FParameters.Count;
  FParameters.Add(Parameter);
end;

function TDSCommandComplexParams.GetParameter(Index: Integer): TDBXParameter;
begin
  if (Index > -1) and (Index < FParameters.Count) then
  begin
    Result := FParameters[Index];
  end
  else
    Exit(nil);
end;

function TDSCommandComplexParams.GetParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

{ TDSCacheResultCommandHandler }

constructor TDSCacheResultCommandHandler.Create(CommandWrapper: TRequestCommandHandler);
begin
  Assert(CommandWrapper <> nil);
  FCommandWrapper := CommandWrapper;
  FCacheCommands := TObjectList<TDSCommandComplexParams>.Create;
end;

destructor TDSCacheResultCommandHandler.Destroy;
begin
  FCacheCommands.Clear;
  FreeAndNil(FCacheCommands);

  FreeAndNil(FCommandWrapper);
  inherited;
end;

function TDSCacheResultCommandHandler.GetCommand(Index: Integer): TDBXCommand;
begin
  if (Index > -1) and (Index < GetCommandCount) then
    Exit(FCacheCommands[Index].Command)
  else
    Exit(nil);
end;

function TDSCacheResultCommandHandler.GetCommandCount: Integer;
begin
  Result := FCacheCommands.Count;
end;

function TDSCacheResultCommandHandler.GetCommandParameter(Command: TDBXCommand; Index: Integer): TDBXParameter;
var
  Ccp: TDSCommandComplexParams;
begin
  Result := nil;
  if (Command <> nil) and (Index > -1) then
  begin
    //Search for the ComplexParams item wrapping the given Command
    for Ccp in FCacheCommands do
    begin
      //Command cound, break the loop, regardless of if parameter is found or not
      if Ccp.Command = Command then
      begin
        if Index < Ccp.GetParameterCount then
        begin
          Exit(Ccp.GetParameter(Index));
        end;
        Break;
      end;
    end;
  end;
end;

function TDSCacheResultCommandHandler.GetCommandParameter(CommandIndex, ParameterIndex: Integer): TDBXParameter;
var
  PList: TDSCommandComplexParams;
begin
  if (CommandIndex > -1) and (CommandIndex < GetCommandCount) then
  begin
    PList := FCacheCommands[CommandIndex];
    Exit(PList.GetParameter(ParameterIndex));
  end;

  Exit(nil);
end;

function TDSCacheResultCommandHandler.GetParameterCount(Index: Integer): Integer;
begin
  if GetCommand(Index) <> nil then
  begin
    Exit(FCacheCommands[Index].GetParameterCount);
  end;
  Exit(0);
end;

{ TDSNullResponseHandler }

procedure TDSNullResponseHandler.Close;
begin
 //do nothing
end;

constructor TDSNullResponseHandler.Create(DSService: TDSService; CommandType: TDSHTTPCommandType;
                                          ServiceInstanceOwner: Boolean);
begin
  inherited Create(CommandType, DSService, ServiceInstanceOwner);
end;

function TDSNullResponseHandler.HandleParameter(const Command: TDBXCommand; const Parameter: TDBXParameter;
                                                out Response: TJSONValue; var ResponseStream: TStream): Boolean;
begin
  Result := False;
end;

procedure TDSNullResponseHandler.PopulateContent(ResponseInfo: TDSHTTPResponse; Response: TJSONValue;
                                                 ResponseStream: TStream);
begin
  //do nothing
end;

{ TDSHTTPDispatch.TOwnedObjects }

procedure TDSHTTPDispatch.TOwnedObjects.Add(const AName: string;
  const AObject: TObject);
begin
  FDictionary.Add(AName, AObject);
end;

procedure TDSHTTPDispatch.TOwnedObjects.Add(const AObject: TObject);
begin
  Add(AObject.ClassName, AObject);
end;

constructor TDSHTTPDispatch.TOwnedObjects.Create;
begin
  inherited;
  FDictionary := TObjectDictionary<string, TObject>.Create([doOwnsValues]);
end;

destructor TDSHTTPDispatch.TOwnedObjects.Destroy;
begin
  FDictionary.Free;
  inherited;
end;

function TDSHTTPDispatch.TOwnedObjects.Extract(const AName: string): TPair<string, TObject>;
begin
  Result := FDictionary.ExtractPair(AName);
end;

procedure TDSHTTPDispatch.TOwnedObjects.Remove(const AName: string);
begin
  FDictionary.Remove(AName);
end;

function TDSHTTPDispatch.TOwnedObjects.TryGetValue(const AName: string;
  out AValue: TObject): Boolean;
begin
  Result := FDictionary.TryGetValue(AName, AValue);
end;

function TDSHTTPDispatch.TOwnedObjects.GetItem(const AName: string): TObject;
begin
  Result := FDictionary.Items[AName];
end;

{ TDSHTTPDispatch }


constructor TDSHTTPDispatch.Create(const AContext: TDSHTTPContext;
  const ARequest: TDSHTTPRequest; const AResponse: TDSHTTPResponse);
begin
  inherited Create;
  FContext := AContext;
  FRequest := ARequest;
  FResponse := AResponse;
end;

destructor TDSHTTPDispatch.Destroy;
begin
  FOwnedObjects.Free;
  inherited;
end;

function TDSHTTPDispatch.GetOwnedObjects: TOwnedObjects;
begin
  if FOwnedObjects = nil then
    FOwnedObjects := TOwnedObjects.Create;
  Result := FOwnedObjects;
end;


end.
