unit uIdHttpControl;

interface

uses
  Windows,
  Classes,
  SysUtils,
  IdBaseComponent,
  IdComponent,
  IdIOHandler,
  IdIOHandlerSocket,
  IdHttp,
  IdHeaderList,
//  IdMultipartFormData,
  uTaoBaoAPIParam,
  uTaoBaoPublic,
  IdSSLOpenSSL,
  uTaoBaoAuth;


type
  TIdHttpControl=class(THttpControl)
  private
  public
    FIdHttp:TIdHttp;
    constructor Create;override;
    destructor Destroy;override;
    function Get(const HttpUrl:String;const TempFileName:String):String;override;
    function Post(const HttpUrl:String;const TempFileName:String):String;overload;override;
  end;

implementation

{ TIdHttpControl }

constructor TIdHttpControl.Create;
begin
  Inherited Create;

  FIdHttp:=TIdHttp.Create(nil);
  FIdHttp.ReadTimeout:=0;
  FIdHttp.AllowCookies:=True;
  FIdHttp.ProxyParams.BasicAuthentication:=False;
  FIdHttp.ProxyParams.ProxyPort:=0;
  FIdHttp.Request.ContentLength:=-1;
  FIdHttp.Request.ContentRangeEnd:=0;
  FIdHttp.Request.ContentRangeStart:=0;
  FIdHttp.Request.ContentType:='application/x-www-form-urlencoded';
  FIdHttp.Request.Accept:='text/html, */*';
  FIdHttp.Request.BasicAuthentication:=False;
  FIdHttp.Request.UserAgent:='Mozilla/3.0 (compatible; Indy Library)';
  FIdHttp.HTTPOptions:=[hoForceEncodeParams];

end;

destructor TIdHttpControl.Destroy;
begin
  FreeAndNil(FIdHttp);
  inherited;
end;

function TIdHttpControl.Get(const HttpUrl: String;const TempFileName:String): String;
var
  AHttpResponseStream:TStringStream;
begin
  Result:='';
  AHttpResponseStream:=TStringStream.Create('',TEncoding.UTF8);

  try
    Self.FIdHttp.Get(HttpURL,AHttpResponseStream);

    AHttpResponseStream.SaveToFile(GetTempDir+TempFileName+'-'+FormatDateTime('YYYY-MM-DD-HH-MM-SS',Now)+'.txt');

    AHttpResponseStream.Position:=0;
    Result:=AHttpResponseStream.DataString;
  finally
    AHttpResponseStream.Free;
  end;
end;

function TIdHttpControl.Post(const HttpUrl: String;const TempFileName:String): String;
var
  AHTTPPostStream:TMemoryStream;
  AHTTPResponseStream:TStringStream;
begin
  Result:='';

  AHTTPPostStream:=TMemoryStream.Create;
  AHTTPResponseStream:=TStringStream.Create('',TEncoding.UTF8);


  FIdHttp.Post(HttpUrl,AHTTPPostStream,AHTTPResponseStream);

  AHttpResponseStream.SaveToFile(GetTempDir+TempFileName+'-'+FormatDateTime('YYYY-MM-DD-HH-MM-SS',Now)+'.txt');
  AHttpResponseStream.Position:=0;
  Result:=AHttpResponseStream.DataString;

  AHTTPPostStream.Free;
  AHTTPResponseStream.Free;
end;

end.
