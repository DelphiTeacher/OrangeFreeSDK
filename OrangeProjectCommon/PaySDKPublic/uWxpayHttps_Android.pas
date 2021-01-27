unit uWxpayHttps_Android;

interface
//{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MSWINDOWS) }
//{$DEFINE FMX}
//{$IFEND}

//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
{$IFNDEF FMX}
{$IFNDEF VCL}
{$I FrameWork.inc}
{$ENDIF}
{$ENDIF}




uses
  SysUtils,

  {$IFDEF FMX}
  FMX.Types,
  {$ENDIF}



  {$IFDEF ANDROID}
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,

    Androidapi.JNI.httpclient,


  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  {$ENDIF ANDROID}

  Classes;





{$IFDEF ANDROID}
//Android SSL
function WeichatHttpsGet_Android(AUrl:String):String;overload;
function WeichatHttpsGet_Android(AUrl:String;AResponseStream:TStream):Boolean;overload;
function WeichatHttpsPost_Android(AUrl:String;AContent:String):String;
{$ENDIF}

var
  GlobalWeichatHttpsError:String;




implementation




  {$IFDEF ANDROID}
function WeichatHttpsGet_Android(AUrl:String):String;
var
  AResult:JString;
begin
  Result:='';
  try
        GlobalWeichatHttpsError:='';

        FMX.Types.Log.d('OrangeUI WeichatHttpsGet_Android begin '+AUrl);
        AResult:=TJHttpSslNoCertGet.JavaClass.Get(StringToJString(AUrl));
        Result:=JStringToString(AResult);
        FMX.Types.Log.d('OrangeUI WeichatHttpsGet_Android end');


  except
    on E:Exception do
    begin
        FMX.Types.Log.d('OrangeUI WeichatHttpsGet_Android error '+E.Message);
        GlobalWeichatHttpsError:=E.Message;
    end;
  end;
end;

function WeichatHttpsGet_Android(AUrl:String;AResponseStream:TStream):Boolean;
const
  BUFFERSIZE = 64 * 1024;  // Usual TCP Window Size
var
  LJBuffer: TJavaArray<System.Byte>;
  LJIStream: JInputStream;
//  LExpected, LTotalReaded: Int64;
  LReaded: Integer;
//  LStatusCode: Integer;
begin
  Result:=False;
  try
        GlobalWeichatHttpsError:='';

        FMX.Types.Log.d('OrangeUI WeichatHttpsGet_Android begin '+AUrl);
        LJIStream:=TJHttpSslNoCertGet.JavaClass.GetReturnStream(StringToJString(AUrl));

        LJBuffer := TJavaArray<System.Byte>.Create(BUFFERSIZE);
        try
          LReaded := 0;
          while (LJIStream <> nil) and (LReaded >= 0) do
          begin
            LReaded := LJIStream.read(LJBuffer);
            if LReaded > 0 then
            begin
              AResponseStream.WriteData(LJBuffer.Data, LReaded);
      //        LTotalReaded := LTotalReaded + LReaded;
            end;
          end;
          Result:=True;
        finally
          if LJIStream<>nil then
          begin
            LJIStream.close;
          end;
          FreeAndNil(LJBuffer);
        end;
        FMX.Types.Log.d('OrangeUI WeichatHttpsGet_Android end');
  except
    on E:Exception do
    begin
        FMX.Types.Log.d('OrangeUI WeichatHttpsGet_Android error '+E.Message);
        GlobalWeichatHttpsError:=E.Message;
    end;
  end;
end;


function WeichatHttpsPost_Android(AUrl:String;AContent:String):String;
var
  AResult:JString;
begin
  Result:='';
  try
        GlobalWeichatHttpsError:='';

        FMX.Types.Log.d('OrangeUI WeichatHttpsPost_Android begin '+AUrl);
        AResult:=TJHttpSslNoCertGet.JavaClass.Post(StringToJString(AUrl),StringToJString(AContent));
        Result:=JStringToString(AResult);
        FMX.Types.Log.d('OrangeUI WeichatHttpsPost_Android end');
  except
    on E:Exception do
    begin
        FMX.Types.Log.d('OrangeUI WeichatHttpsPost_Android error '+E.Message);
        GlobalWeichatHttpsError:=E.Message;
    end;
  end;
end;
  {$ENDIF ANDROID}





end.
