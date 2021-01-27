unit FlyUtils.App.CrashHandler;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2015-08-12　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

// 失败的参考：http://bbs.51cto.com/thread-1037088-1.html
// xml <application  节点
//        android:debuggable="True"
//  android:debuggable 要为 True ，
//不过目前 Release 和 Debug 都是 True。所以我们就不用修改了。
// 如果某种编译模式 不是 True ，您可以修改 xml 文件，写成 True。

//【事实证明】，没用。delphi app 退出，是纯原生的。

// 新增 CrashGoURL 可以在最后退出前，得到一次处理机会。
// 配置 CrashGoURL 不要带 http:// .
// 您的 HTTP 服务器会收到错误信息。请返回一些信息给浏览器
// 目前仅支持 IOS 安卓。 IOS 未测试。

//uses
//  FMX.Forms;
//  Androidapi.JNIBridge,
//  Androidapi.JNI.JavaTypes;

var
  /// <summary>
  ///   No need http://
  /// </summary>
  CrashGoURL: string = 'www.baidu.com/s?wd=';
  CrashGoURLNeedHttps: Boolean = False;
  CrashGoURLJustUseAddress: Boolean = False;
  CrashGoURLisFile: Boolean = False;
  CrashGoURLNotProcess: Boolean = False;

implementation
uses
{$IFDEF ANDROID}
{$IF CompilerVersion >= 27.0} // >= XE6
  Androidapi.Helpers,
{$ENDIF}
  FMX.Helpers.Android,
  Androidapi.JNI.Net,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
{$ENDIF ANDROID}
{$IFDEF IOS}
  iOSapi.Foundation, FMX.Helpers.iOS,
{$ENDIF IOS}
{$IFDEF MACOS}
  Macapi.Helpers,
{$ENDIF MACOS}
{$IFDEF MSWINDOWS}
  Winapi.Windows,
  Winapi.ShellAPI,
{$ENDIF MSWINDOWS}
  IdURI,
  System.Classes,
  System.SysUtils;

//Type
//  TCrashHandler = class(TJavaLocal, JThread_UncaughtExceptionHandler)
//  private
////    [Weak] FApp: TApplication;
//  public
////    constructor Create(const App: TApplication);
//    //看上去，下面的函数属于线程中
//    procedure uncaughtException(thread: JThread; ex: JThrowable); cdecl;
//  end;
//
//
//var
//  DefCrashHandler: JThread_UncaughtExceptionHandler = nil;
//  ACrashHandler: TCrashHandler = nil;
//
//
//  { TCrashHandler }
//
////constructor TCrashHandler.Create(const App: TApplication);
////begin
////  inherited Create;
////  FApp := App;
////end;
//
//procedure TCrashHandler.uncaughtException(thread: JThread; ex: JThrowable);
//var
//  TempStr,
//  Errmsg: string;
//begin
////  TThread.
////  Errmsg := 'Exception found';
////  if thread <> nil then
////  begin
////    Errmsg := Errmsg + ' thread id: ' + IntToStr(thread.getId);
////  end;
////  if ex <> nil then
////  begin
////    TempStr := JStringToString(ex.getLocalizedMessage).Trim;
////    if TempStr = '' then
////      TempStr := JStringToString(ex.getMessage).Trim;
////    Errmsg := Errmsg + ' message: ' + TempStr;
////  end
////  else
////  begin
////    Errmsg := 'Unkonw ' + Errmsg + '.';
////  end;
////  raise Exception.Create(Errmsg);
//end;

//procedure InitCrashHandler;
//begin
//  if ACrashHandler = nil then
//  begin
////    CallInUIThread(procedure begin
//      DefCrashHandler := TJThread.JavaClass.getDefaultUncaughtExceptionHandler;
//      ACrashHandler := TCrashHandler.Create; //(Application);
//      TJThread.JavaClass.setDefaultUncaughtExceptionHandler(ACrashHandler);
////    end);
//  end;
//end;
//
//procedure UnInitCrashHandler;
//begin
//  if ACrashHandler <> nil then
//  begin
//    TJThread.JavaClass.setDefaultUncaughtExceptionHandler(DefCrashHandler);
//    FreeAndNil(ACrashHandler);
//  end;
//end;


{$IFDEF POSIX}
const
{$IFDEF UNDERSCOREIMPORTNAME}
  _PU = '_';
{$ELSE}
  _PU = '';
{$ENDIF}
const
  libc        = '/usr/lib/libc.dylib';
  libpthread  = '/usr/lib/libpthread.dylib';
  libiconv    = '/usr/lib/libiconv.dylib';
  libdl       = '/usr/lib/libdl.dylib';

{$IF not Declared(_PU)}
const
  // On Mac OSX, cdecl names have a preceeding underscore
  // if x86 native backend.
  {$IF Defined(UNDERSCOREIMPORTNAME)}
  _PU = '_';
  {$ELSE}
  _PU = '';
  {$ENDIF}
  {$EXTERNALSYM _PU}
{$ENDIF}

const
{$IFNDEF IOS}
  _INODE_SUFFIX = '$INODE64';
{$ELSE IOS}
  _INODE_SUFFIX = '';
{$ENDIF !IOS}
  {$EXTERNALSYM _INODE_SUFFIX}
function _system(Name: MarshaledAString): Integer; cdecl;
  external libc name _PU + 'system';
{$ENDIF}

function GetEncodeURL(const URL: string): string;
begin
  Result := URL;
  if CrashGoURLisFile then
  begin
    if Result.Substring(1, 1) <> '/' then
    begin
      Result := '/' + Result;
    end;
    Result := 'file://' + Result;
  end
  else if CrashGoURLNeedHttps then
  begin
    Result := 'https://' + URL;
  end
  else
  begin
    Result := 'http://' + URL;
  end;
  Result := TIdURI.URLEncode(Result);
end;

function OpenURL(const URL: string): Boolean;
{$IFDEF ANDROID}
var
  Intent: JIntent;
  AURL: string;
begin
// There may be an issue with the geo: prefix and URLEncode.
// will need to research
  Result := False;
  AURL := GetEncodeURL(URL);
  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
    TJnet_Uri.JavaClass.parse(StringToJString(AURL)));
  try
    SharedActivity.startActivity(Intent);
    Result := True;
  except
  end;
end;
{$ELSE}
{$IFDEF IOS}
var
  NSU: NSUrl;
  AURL: string;
begin
  Result := False;
  AURL := GetEncodeURL(URL);
  // iOS doesn't like spaces, so URL encode is important.
  NSU := StrToNSUrl(AURL);
  if TOSVersion.Check(9) or SharedApplication.canOpenURL(NSU) then
  try
    Result := SharedApplication.openUrl(NSU);
  except
  end;
end;
{$ELSE}
{$IFDEF MSWINDOWS}
var
  AURL: string;
begin
  Result := False;
  AURL := GetEncodeURL(URL);
  try
    ShellExecute(GetActiveWindow, 'open', PChar(AURL), '', '', SW_MAXIMIZE);
    Result := True;
  except
  end;
end;
{$ELSE}
var
  M:TMarshaller;
  AURL: string;
begin
  Result := False;
  //AURL := 'open -a Safari ' +  GetEncodeURL(AURL);
  AURL := 'open ' +  GetEncodeURL(URL);
  try
    _system(M.AsAnsi(AURL, CP_UTF8).ToPointer);
    Result := True;
  except
  end;
//  raise Exception.Create('Not supported!');
end;
{$ENDIF MSWINDOWS}
{$ENDIF IOS}
{$ENDIF ANDROID}

procedure NewExceptHandler(ExceptObject: TObject; ExceptAddr: Pointer);
var
  URL: string;
begin
  URL := IntToHex(Integer(ExceptAddr), Sizeof(Pointer) * 2);
  if not CrashGoURLJustUseAddress then
  begin
    if ExceptObject <> nil then
    begin
      URL := ExceptObject.ClassName + ' at: ' + URL;
    end
    else
    begin
      URL := 'Crash at: ' + URL;
    end;
  end;
  if CrashGoURL.Trim <> '' then
  begin
    if CrashGoURLisFile then
    begin
      URL := CrashGoURL.Trim;
    end
    else
    begin
      URL := CrashGoURL.Trim + URL;
    end;
    OpenURL(URL);
  end;
end;

var
  DefRaiseExceptObjProc: Pointer = nil;
  CurrExceptObject: TObject;
  CurrExceptAddr: Pointer;
  LastExceptObject: TObject;
  LastExceptAddr: Pointer;

procedure RaiseExceptObjHandler(P: PExceptionRecord);
begin
  if Assigned(DefRaiseExceptObjProc) and Assigned(P) then
  begin
    LastExceptObject := P.ExceptObject;
{$IFDEF PC_MAPPED_EXCEPTIONS}
    LastExceptAddr := ExceptAddr;
{$ELSE}
    LastExceptAddr := P.ExceptAddr;
{$ENDIF}
//    TRaiseExceptObjProc(DefRaiseExceptObjProc)(P);
  end;
  //还可以继续写一些 Log 。
end;

procedure InitCrashHandler;
begin
  if not Assigned(DefRaiseExceptObjProc) then
  begin
    DefRaiseExceptObjProc := RaiseExceptObjProc;
    RaiseExceptObjProc := @RaiseExceptObjHandler;
  end;
end;

procedure UnInitCrashHandler;
begin
  if Assigned(DefRaiseExceptObjProc) then
  begin
    RaiseExceptObjProc := DefRaiseExceptObjProc;
  end;
end;

initialization
  InitCrashHandler;

finalization
//  isfinalizationed := True;
  CurrExceptObject := ExceptObject;
  CurrExceptAddr := ExceptAddr;
  if (not CrashGoURLNotProcess) and (CurrExceptObject <> nil) or (CurrExceptAddr <> nil) then
  begin
    if (LastExceptAddr = CurrExceptAddr) or
     ((LastExceptObject <> nil) and (LastExceptAddr <> nil)) then
    begin
      CurrExceptObject := LastExceptObject;
      CurrExceptAddr := LastExceptAddr;
    end;
    NewExceptHandler(CurrExceptObject, CurrExceptObject);
  end;
// Excpet 还没有处理完，就执行到这里了。
  UnInitCrashHandler;

end.
