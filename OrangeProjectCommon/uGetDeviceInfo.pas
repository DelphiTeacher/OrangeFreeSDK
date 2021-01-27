//convert pas to utf8 by ¥
unit uGetDeviceInfo;

interface

uses
  SysUtils,

  FMX.DeviceInfo,


  {$IFDEF MSWINDOWS}
  Winapi.Windows,
  Winapi.ShellAPI,
  {$ENDIF}

  {$IFDEF IOS}
  Macapi.ObjCRuntime,
  iOSapi.CoreGraphics,
  FMX.Platform.iOS,
  FMX.Helpers.iOS,
  Macapi.ObjectiveC,
  Macapi.Helpers,
  iOSapi.Foundation,
  iOSapi.UIKit,
  {$ENDIF}

  {$IFDEF ANDROID}
  FlyFmxUtils,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Telephony,
  Androidapi.JNI.Net,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,
  Androidapi.Log,
  Androidapi.JNI.Provider,
  Androidapi.JNI.Os,
  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.App,
  Androidapi.JNIBridge,
  {$ENDIF}

  IniFiles,
  Classes;




//获取手机的IMEI
function GetIMEI:String;
//获取IOS的UUID
function GetUUID:String;
//获取手机的型号
function GetPhoneType:String;
////获取系统
//function GetOS:String;
//获取系统型号
function GetOSVersion:String;

function IsPadDevice:Boolean;


var
  //在Windows下面模拟是否是平板
  WinIsPadDevice:Boolean;


implementation



function IsPadDevice:Boolean;
begin
  Result:=False;
//  Result:=True;
  {$IFDEF MSWINDOWS}

  {$ENDIF}
  {$IFDEF ANDROID}
  Result:=FlyFmxUtils.GetScreenInches>6;
  {$ENDIF}
  {$IFDEF IOS}
  Result:=FMX.Helpers.iOS.IsPad;
  {$ENDIF}
end;

function GetUUID: string;
  {$IFDEF IOS}
  var
    Device: UIDevice;
  {$ENDIF}
begin
  {$IFDEF IOS}
  Result:='';
  try
      Device := TUIDevice.Wrap(TUIDevice.OCClass.currentDevice);
      Result := string(Device.identifierForVendor.UUIDString.UTF8String);
//      if (Device<>nil) and (Device.uniqueIdentifier<>nil) then
//      begin
//        Result := string(Device.uniqueIdentifier.UTF8String);
//      end;
  except
    //IOS11,64位会报错
  end;
  {$ENDIF}
end;

function GetIMEI: string;
  {$IFDEF ANDROID}
  var
    obj: JObject;
    tm: JTelephonyManager;
    IMEI: String;
  {$ENDIF}
begin
  {$IFDEF ANDROID}
  obj := SharedActivityContext.getSystemService
    (TJContext.JavaClass.TELEPHONY_SERVICE);
  if obj <> nil then
  begin
    tm := TJTelephonyManager.Wrap((obj as ILocalObject).GetObjectID);
    if tm <> nil then
      IMEI := JStringToString(tm.getDeviceId);
  end;
  if IMEI = '' then
    IMEI := JStringToString(TJSettings_Secure.JavaClass.getString
      (SharedActivity.getContentResolver,
      TJSettings_Secure.JavaClass.ANDROID_ID));
  result := IMEI;
  {$ELSE}
  Result:='';
  {$ENDIF}
end;

function GetPhoneType:String;
begin
  {$IFDEF IOS}
  //iPhone1,1
  Result:='';
  try
      Result:=Trim(GetSysInfoByName('hw.machine'));
  except
    //IOS11,64位会报错
  end;
  {$ELSE}
  Result:=DeviceInfo.diDevice;
  {$ENDIF}
end;

//function GetOS:String;
//begin
//  case TOSVersion.Platform of
//    pfWindows:
//    begin
//      Result:='Windows';
//    end;
//    pfMacOS:
//    begin
//      Result:='MacOS';
//    end;
//    pfiOS:
//    begin
//      Result:='IOS';
//    end;
//    pfAndroid:
//    begin
//      Result:='Android';
//    end;
//    pfWinRT:
//    begin
//      Result:='WinRT';
//    end;
//    pfLinux:
//    begin
//      Result:='Linux';
//    end;
//  end;
//end;

function GetOSVersion:String;
begin
  Result:=TOSVersion.ToString;
end;



initialization
  WinIsPadDevice:=False;

end.
