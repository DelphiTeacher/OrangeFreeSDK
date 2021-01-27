unit uWxpayHttps;

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
  Classes,

  {$IFDEF FMX}
  FMX.Types,
  {$ENDIF}


  uWxpayHttps_Common,
  uWxpayHttps_Android;




function WeichatHttpsGet(AUrl:String):String;overload;
function WeichatHttpsGet(AUrl:String;AResponseStream:TStream):Boolean;overload;
function WeichatHttpsPost(AUrl:String;AContent:String):String;




implementation





function WeichatHttpsGet(AUrl:String;AResponseStream:TStream):Boolean;
begin
  {$IFDEF ANDROID}
  Result:=WeichatHttpsGet_Android(AUrl,AResponseStream);
  {$ELSE}
  Result:=WeichatHttpsGet_Indy(AUrl,AResponseStream);
  {$ENDIF}
end;

function WeichatHttpsGet(AUrl:String):String;
begin
  {$IFDEF ANDROID}
  Result:=WeichatHttpsGet_Android(AUrl);
  {$ELSE}
  Result:=WeichatHttpsGet_Indy(AUrl);
  {$ENDIF}
end;

function WeichatHttpsPost(AUrl:String;AContent:String):String;
begin
  {$IFDEF ANDROID}
  Result:=WeichatHttpsPost_Android(AUrl,AContent);
  {$ELSE}
  Result:=WeichatHttpsPost_Indy(AUrl,AContent);
  {$ENDIF}
end;




end.
