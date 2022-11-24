//convert pas to utf8 by ¥

unit uNativeHttpControl;

interface

uses
//  Classes,
//  SysUtils,
//
//  {$IFDEF CB}
//  System.Net.URLClient,
//  System.Net.HttpClient,
//  System.Net.HttpClientComponent,
//  {$ENDIF}

  uBaseHttpControl;


type
//  {$IFDEF CB}
//  TSystemHttpControl=class(THttpControl)
//  protected
//    FOnReceiveData:TReceiveDataEvent;
//
//  protected
//    procedure DoNetHTTPClientReceiveData(const Sender: TObject; AContentLength,AReadCount: Int64; var Abort: Boolean);virtual;
//  public
//    constructor Create;override;
//    destructor Destroy;override;
//  public
//    FNetHTTPClient:TNetHTTPClient;
//    FNetHTTPRequestHeaders:TNetHeaders;
//
//    function Get(const AHttpUrl:String;AResponseStream:TStream):Boolean;overload;override;
//    function Post(const AHttpUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;overload;override;
//  public
//    property OnReceiveData:TReceiveDataEvent read FOnReceiveData write FOnReceiveData;
//  end;
//  {$ENDIF}


  TNativeHttpControl=class(TSystemHttpControl);


implementation



//{$IFDEF CB}
//
//{ TSystemHttpControl }
//
//constructor TSystemHttpControl.Create;
//begin
//  Inherited;
//
//  FNetHTTPClient:=TNetHTTPClient.Create(nil);
//
////  FNetHTTPClient.ConnectionTimeout:=30*1000;  //连接超时-三十秒
////  FNetHTTPClient.ResponseTimeout:=30*1000;    //响应超时三十秒
//
//
//  //Post上传文件流的时候要设置,不然IDHttpServer接收到请求的时候会报错
//  //会以为流里面的是UrlParams
//  FNetHTTPClient.ContentType:='application/octet-stream';
//  FNetHTTPClient.OnReceiveData:=Self.DoNetHTTPClientReceiveData;
//
//end;
//
//destructor TSystemHttpControl.Destroy;
//begin
//
//  FreeAndNil(FNetHTTPClient);
//
//  inherited;
//end;
//
//procedure TSystemHttpControl.DoNetHTTPClientReceiveData(const Sender: TObject;AContentLength, AReadCount: Int64; var Abort: Boolean);
//begin
//  if Assigned(FOnReceiveData) then
//  begin
//    FOnReceiveData(Sender,AContentLength,AReadCount,Abort);
//  end;
//end;
//
//function TSystemHttpControl.Get(const AHttpUrl: String;AResponseStream: TStream): Boolean;
//begin
//    Result:=False;
//
//    try
//      Self.FNetHTTPClient.Get(AHttpUrl,AResponseStream,FNetHTTPRequestHeaders);
//      IsNetworkConnected:=True;
//      Result:=True;
//
//
//      //下载
//      if Assigned(OnNetworkDataUsageChange) then
//      begin
//        OnNetworkDataUsageChange(Self,AResponseStream.Size,0);
//      end;
//
//    except
//      on E:Exception do
//      begin
//        IsNetworkConnected:=False;
//      end;
//    end;
//end;
//
//function TSystemHttpControl.Post(const AHttpUrl: String; ARequestStream,AResponseStream: TStream): Boolean;
//begin
//    Result:=False;
//
//    try
//      FNetHTTPClient.Post(AHttpUrl,
//                          ARequestStream,
//                          AResponseStream,
//                          FNetHTTPRequestHeaders);
//
//      IsNetworkConnected:=True;
//      Result:=True;
//
//
//      //上传
//      if Assigned(OnNetworkDataUsageChange) then
//      begin
//        if ARequestStream=nil then
//        begin
//          OnNetworkDataUsageChange(Self,AResponseStream.Size,0);
//        end
//        else
//        begin
//          OnNetworkDataUsageChange(Self,AResponseStream.Size,ARequestStream.Size);
//        end;
//      end;
//
//    except
//      on E:Exception do
//      begin
//        IsNetworkConnected:=False;
//      end;
//    end;
//end;
//{$ENDIF}




end.

