//convert pas to utf8 by ¥
/// <summary>
///   <para>
///     公共函数
///   </para>
///   <para>
///     Public function
///   </para>
/// </summary>
unit uAPPCommon;

interface

uses
  Classes,
  System.Types,
  StrUtils,
  Math,
  XSuperObject,
  System.IOUtils,


//  FMX.Types,
//  uSkinItems,
//  IdURI,
//  EncdDecd,
//  uBaseLog,
//  uTimerTask,
////  uSkinCommonFrames,
//  uTimerTaskEvent,
//  uComponentType,
////  uBasePageStructure,
//  uSkinVirtualListType,
////  uPayPublic,
//  XSuperObject,
//  uBaseHttpControl,
//  System.Net.URLClient,
//  System.Net.HttpClient,
//  System.Net.HttpClientComponent,


  {$IFDEF MSWINDOWS}
  WinApi.Windows,
  {$ENDIF}
  {$IFDEF ANDROID}
  Androidapi.IOUtils,
  {$ENDIF}
  {$IFDEF _MACOS}
  Macapi.Mach,
  {$ENDIF}

  SysUtils;

const
  IID_IPageSavedValue:TGUID='{56154C25-7AB3-4D9A-903D-30CF7A43A86E}';

type

  IPageSavedValue=interface
    ['{56154C25-7AB3-4D9A-903D-30CF7A43A86E}']
    function GetSavedValue:ISuperObject;
  end;


//function GetApplicationPath:String;
//
//
//
//
///// <summary>
/////   标准日期格式转换
/////   <para>
/////     Standard date convert
/////   </para>
///// </summary>
//function StandardDateToStr(Const ADateTime:TDateTime):String;
///// <summary>
/////   标准日期格式转换
/////    <para>
/////     Standard date convert
/////   </para>
///// </summary>
//function StandardStrToDateTime(Const Str:String):TDateTime;
///// <summary>
/////   标准日期格式转换
/////     <para>
/////     Standard date convert
/////   </para>
///// </summary>
//function StandardDateTimeToStr(Const ADateTime:TDateTime):String;
//
//
//procedure FreeStringListObjects(AStringList:TStringList);
//
////procedure CopyStringArray(var ASource:Array of String;ADest:Array of String);
//
//
//var
//  GlobalStandardFmtSettings: TFormatSettings;
//
//function GetWebUrl_From_OrangeUIServer(ANetHTTPClient:TNetHttpClient;AUrl:String;AResponseStream:TStream):Boolean;overload;
//function GetWebUrl_From_OrangeUIServer(AHttpControl:THttpControl;AUrl:String;AResponseStream:TStream):Boolean;overload;

function GetDeviceName: string;



implementation



function GetDeviceName: string;
{$IF Defined(MSWINDOWS)}
var
  LSize: Cardinal;
  LName: array[0..MAX_PATH - 1] of Char;
begin
  LSize := SizeOf(LName);
  if GetComputerName(LName, LSize) then
    Result := LName
  else
    Result := string.Empty;
end;
{$ELSEIF Defined(ANDROID)}
begin
  Result := '';//JStringToString(TJBuild.JavaClass.MODEL);
end;
{$ELSEIF Defined(IOS)}
begin
  Result := '';//NSStrToStr(TUIDevice.Wrap(TUIDevice.OCClass.currentDevice).name);
end;
{$ELSEIF Defined(MACOS)}
var
  LHost: NSHost;
begin
  LHost := TNSHost.Wrap(TNSHost.OCClass.currentHost);
  Result := '';//NSStrToStr(LHost.localizedName);
end;
{$ENDIF}


//function GetWebUrl_From_OrangeUIServer(AHttpControl:THttpControl;AUrl:String;AResponseStream:TStream):Boolean;
//begin
////  if DirectoryExists('E:\MyFiles') then
////  begin
////    //在工作电脑上
////    Result:=AHttpControl.Get(
////          TIdUri.UrlEncode('http://www.orangeui.cn:10001/get_web_url?url='
////                            +EncdDecd.EncodeString(AUrl)
////                            ),
////                            AResponseStream)
////  end
////  else
////  begin
//    Result:=AHttpControl.Get(AUrl,AResponseStream);
////  end;
//end;
//
//function GetWebUrl_From_OrangeUIServer(ANetHTTPClient:TNetHttpClient;AUrl:String;AResponseStream:TStream):Boolean;
//begin
////  Result:=False;
////  try
////    if DirectoryExists('E:\MyFiles') then
////    begin
////      //在工作电脑上
////      ANetHTTPClient.Get(
////            TIdUri.UrlEncode('http://www.orangeui.cn:10001/get_web_url?url='
//////            TIdUri.UrlEncode('http://127.0.0.1:10001/get_web_url?url='
////                              +EncdDecd.EncodeString(AUrl)
////                              ),
////                              AResponseStream)
////    end
////    else
////    begin
//      ANetHTTPClient.Get(AUrl,AResponseStream);
////    end;
////    Result:=True;
////  finally
////
////  end;
//end;
//
////procedure CopyStringArray(var ASource:Array of String;ADest:Array of String);
////var
////  I: Integer;
////begin
////  SetLength(ASource,Length(ADest));
////  for I := 0 to Length(ADest)-1 do
////  begin
////    ASource[I]:=ADest[I];
////  end;
////end;
//
//procedure FreeStringListObjects(AStringList:TStringList);
//var
//  I: Integer;
//  AObject:TObject;
//begin
//  for I := 0 to AStringList.Count-1 do
//  begin
//    AObject:=AStringList.Objects[I];
//    FreeAndNil(AObject);
//  end;
//  AStringList.Clear;
//end;
//
//
//function GetApplicationPath:String;
//begin
//
//    Result:=System.IOUtils.TPath.GetDocumentsPath+PathDelim;
//
//
//    {$IFDEF MSWINDOWS}
//    Result:=System.IOUtils.TPath.GetLibraryPath;
//    {$ENDIF}
//
//    {$IFDEF _MACOS}
//    Result:=System.IOUtils.TPath.GetHomePath+PathDelim;
//    {$ENDIF}
//
//    {$IFDEF IOS}
//    Result:=System.IOUtils.TPath.GetDocumentsPath+PathDelim;
//    {$ENDIF}
//
//    {$IFDEF Android}
//    Result:=System.IOUtils.TPath.GetHomePath+PathDelim;
//    {$ENDIF}
//
//end;
//
//
//function StandardDateTimeToStr(Const ADateTime:TDateTime):String;
//begin
//  Result:=DateTimeToStr(ADateTime,GlobalStandardFmtSettings);
//end;
//
//function StandardDateToStr(Const ADateTime:TDateTime):String;
//begin
//  Result:=FormatDateTime('YYYY-MM-DD',ADateTime);
//end;
//
//function StandardStrToDateTime(Const Str:String):TDateTime;
//begin
//  if Str='' then
//  begin
//    Result:=0;
//  end
//  else
//  begin
//    Result:=StrToDateTime(Str,GlobalStandardFmtSettings);
//  end;
//end;
//
//function UIGetTickCount: LongWord;
//begin
//  Result:=TThread.GetTickCount;
//end;
//
//
//
//
//initialization
//  GlobalStandardFmtSettings.ShortDateFormat:='yyyy-MM-dd';
//  GlobalStandardFmtSettings.DateSeparator:='-';
//  GlobalStandardFmtSettings.LongTimeFormat:='hh:mm:ss';
//  GlobalStandardFmtSettings.TimeSeparator:=':';
//


end.




