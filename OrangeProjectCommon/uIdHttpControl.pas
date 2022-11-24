//convert pas to utf8 by ¥

unit uIdHttpControl;

interface

{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}



//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
//才可以正常编译此单元
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}



uses
  Classes,
  SysUtils,
//  SyncObjs,


  IdBaseComponent,
  IdComponent,
  IdHttp,
  IdGlobal,
  IdIOHandlerSocket,
  IdIOHandlerStack,


  IdSSLOpenSSL,
  uBaseLog,
  uBaseHttpControl,
//  uDownloadPictureManager
  uFuncCommon
  ;


type
  TIdHttpControl=class(THttpControl)
  protected
    procedure DoWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
  public
    FIdHttp:TIdHttp;
    IdSSLIOHandlerSocketOpenSSL1:TIdSSLIOHandlerSocketOpenSSL;
    OnWork:TWorkEvent;
    constructor Create;override;
    destructor Destroy;override;
  public
    function Get(const HttpUrl:String;AResponseStream:TStream):Boolean;overload;override;
    function Post(const HttpUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;overload;override;
  end;


  {$IFDEF VCL}
  TSystemHttpControl=TIdHttpControl;
  {$ENDIF}

var
  //是否需要SSL
  IsIdHttpNeedSSL:Boolean;

implementation

{ TIdHttpControl }

constructor TIdHttpControl.Create;
begin
  Inherited;

  FIdHttp:=TIdHttp.Create(nil);

  FIdHttp.OnWork:=DoWork;


  if IsIdHttpNeedSSL then
  begin
    IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    FIdHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
  end;

end;

destructor TIdHttpControl.Destroy;
begin
  try
    SysUtils.FreeAndNil(FIdHttp);

    if IsIdHttpNeedSSL then
    begin
      FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
    end;

  except
    on E:Exception do
    begin
      IsNetworkConnected:=False;
      uBaseLog.HandleException(E,'Main','uIdHttpControl TIdHttpControl.Destroy');
    end;
  end;
  inherited;
end;

procedure TIdHttpControl.DoWork(ASender: TObject; AWorkMode: TWorkMode;AWorkCount: Int64);
begin
  if Assigned(OnWork) then
  begin
    OnWork(ASender,AWorkMode,AWorkCount);
  end;
end;

function TIdHttpControl.Get(const HttpUrl: String;AResponseStream: TStream): Boolean;
begin
    Result:=False;
//    if (FIdHttp=nil) or (Not IsNetworkConnected) then
//    begin
//      ReCreateIdHttp;
//    end;

    try
      FIdHttp.Get(HttpUrl,AResponseStream);
      IsNetworkConnected:=True;
      Result:=True;

      //下载
      if Assigned(OnNetworkDataUsageChange) then
      begin
        OnNetworkDataUsageChange(Self,AResponseStream.Size,0);
      end;
    except
      on E:Exception do
      begin
        IsNetworkConnected:=False;
        //('Socket Error # 10054'#$D#$A'Connection reset by peer.', 0, nil, nil, False)
        uBaseLog.HandleException(E,'Main','uIdHttpControl TIdHttpControl.Get '+HttpUrl);
      end;
    end;
end;

function TIdHttpControl.Post(const HttpUrl: String; ARequestStream,AResponseStream: TStream): Boolean;
begin
    Result:=False;
//    if (FIdHttp=nil) or (Not IsNetworkConnected) then
//    begin
//      ReCreateIdHttp;
//    end;

    try
      FIdHttp.Post(HttpUrl,ARequestStream,AResponseStream);
      IsNetworkConnected:=True;
      Result:=True;


      //上传
      if Assigned(OnNetworkDataUsageChange) then
      begin
        if ARequestStream=nil then
        begin
          OnNetworkDataUsageChange(Self,AResponseStream.Size,0);
        end
        else
        begin
          OnNetworkDataUsageChange(Self,AResponseStream.Size,ARequestStream.Size);
        end;
      end;

    except
      on E:Exception do
      begin
        IsNetworkConnected:=False;
        uBaseLog.HandleException(E,'Main','uIdHttpControl TIdHttpControl.Pos '+HttpUrl);
      end;
    end;
end;

//procedure TIdHttpControl.ReCreateIdHttp;
//begin
//  SysUtils.FreeAndNil(FIdHttp);
//
//  FIdHttp:=TIdHttp.Create(nil);
////  FIdHttp.ReadTimeout:=30*1000;//一分钟
//
//  FIdHttp.OnWork:=OnWork;
//end;





initialization
  IsNetworkConnected:=True;
  {$IFDEF VCL}
  GlobalSystemHttpControlClass:=TSystemHttpControl;
  {$ENDIF}



end.



