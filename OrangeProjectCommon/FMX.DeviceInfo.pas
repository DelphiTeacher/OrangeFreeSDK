//convert pas to utf8 by ¥
unit FMX.DeviceInfo;
{
  Device Info
  author: ZuBy
  https://github.com/rzaripov1990/DeviceInfo
  rzaripov1990@gmail.com
  ANDROID permissions:
  ..access_network_state
  ..access_wifi_state
}
interface
uses
  System.SysUtils, System.Types, System.Devices,
    FMX.Platform ,
    FMX.Types,
  {$IFDEF MSWINDOWS}
  //,
   Winapi.Windows
  {$ENDIF}
  {$IFDEF ANDROID}//,
  AndroidApi.JNI.GraphicsContentViewText,
  AndroidApi.JNI.OS,
  AndroidApi.Helpers,
  AndroidApi.JNI.Net,
  AndroidApi.JNI.JavaTypes,
  AndroidApi.JNIBridge,
  AndroidApi.JNI.Provider,
  AndroidApi.JNI.Telephony
  //  ,
  //  FMX.PhoneDialer,
  //FMX.PhoneDialer.Android
    {$ENDIF}
  {$IFDEF MACOS}//,
  Macapi.ObjectiveC,
  Posix.Wchar,
  Macapi.CoreFoundation,
  Macapi.Dispatch,
  Posix.SysSocket
  {$IFDEF IOS},
  iOSApi.CocoaTypes,
  iOSApi.Foundation,
  iOSApi.UIKit,
  FMX.Helpers.iOS,
  Posix.SysSysctl,
  Posix.StdDef
  {$ENDIF}
  {$ENDIF MACOS};

type
  TmyConnectionType = (ctNone, ctUnknown, ctWIFI, ctMobile, ctEthernet);
  TmyNetworkType = (ntNone, ntUnknown, nt2G, nt3G, nt4G);
const
  TmyConnectionTypeString: array [TmyConnectionType] of string = ('None', 'Unknown', 'Wi-Fi', 'Mobile Data',
    'Ethernet');
  TmyNetworkTypeString: array [TmyNetworkType] of string = ('None', 'Unknown', '2G', '3G', '4G');
type
  TmyDeviceInfo = record
    diPlatform: string;
    diPlatformT: TOSVersion.TPlatform;
    diArchitecture: string;
    diArchitecture2: string;
    diArchitectureT: TOSVersion.TArchitecture;
    diMacAddress: string;
    diIPAddress: string;
    diPlatformVer: string;
    diDevice: string;
    diLang: string;
    diScreenPhis: string;
    diScreenLogic: string;
    diScreenWidth: Single;
    diScreenHeight: Single;
    diScale: Single;
    diMobileOperator: string;
    diTimeZone: integer;
    diIsIntel: Boolean;
  end;

var
  DeviceInfo: TmyDeviceInfo;

/// <summary> 镱塍麇龛?桧纛痨圉梃 ?溴忄轳?</summary>
procedure DeviceInfoByPlatform;
/// <summary> 镳钼屦赅 羼螯 腓 桧蝈痦弪 [ANDROID, WINDOWS] </summary>
function IsNetConnected: Boolean;
/// <summary> 蜩?镱潢膻麇龛 ?桧蝈痦弪?[ANDROID, WINDOWS] </summary>
function IsNetConnectionType: TmyConnectionType;
/// <summary> 蜩?祛徼朦眍?皴蜩 [ANDROID] </summary>
function IsNetworkType: TmyNetworkType;
/// <summary> 怅膻麇?GPS? [ANDROID] </summary>
function IsGPSActive(HIGH_ACCURACY: Boolean = False): Boolean;
/// <summary> 诣?溴忄轳? [ALL PLATFORMS]</summary>
function IsDeviceType: TDeviceInfo.TDeviceClass;
/// <summary> 青矬眍 磬 镫囗蝈 桦?蝈脲纛礤? [ALL PLATFORMS]</summary>
function IsTablet: Boolean;

procedure SetPortraitOrientation;
/// <summary> 项痱疱蝽? 铕桢眚圉?? [ALL PLATFORMS] </summary>
function IsPortraitOrientation: Boolean;
/// <summary> 蒡?脏犭弪? [ANDROID/IOS] </summary>
function IsLargePhone: Boolean;

//{$IFDEF MacOS}
//const
//  libc = '/usr/lib/libc.dylib';
//function sysctlbyname(Name: MarshaledAString; oldp: pointer; oldlen: Psize_t; newp: pointer; newlen: size_t): integer;
//  cdecl; external libc name _PU + 'sysctlbyname';
//{$ENDIF }
{$IFDEF MSWINDOWS}
function InternetGetConnectedState(lpdwFlags: LPDWORD; dwReserved: DWORD): BOOL; stdcall;
  external 'wininet.dll' name 'InternetGetConnectedState';
{$ENDIF}

//{$IF DEFINED(MACOS) OR DEFINED(IOS)}
{$IF DEFINED(IOS)}
function GetSysInfoByName(typeSpecifier: string): string;
{$ENDIF}

implementation
uses
  System.DateUtils,
  System.Math//,
//  FMX.Dialogs
//  ,
//  FMX.Styles, FMX.Controls, FMX.BehaviorManager, FMX.Forms, FMX.Types
{$IFDEF MSWINDOWS}, System.Variants, Winapi.ActiveX, System.Win.ComObj{$ENDIF};
//// *** FMX.MultiView ***
//function IsMobilePreview(Sender: TControl): Boolean;
//var
//  StyleDescriptor: TStyleDescription;
//begin
//  StyleDescriptor := TStyleManager.GetStyleDescriptionForControl(Sender);
//  if StyleDescriptor <> nil then
//    Result := StyleDescriptor.MobilePlatform
//  else
//    Result := False;
//end;

function DefineDeviceClassByFormSize: TDeviceInfo.TDeviceClass;
//const
//  MaxPhoneWidth = 640;
begin
//  if Screen.ActiveForm.Width <= MaxPhoneWidth then
    Result := TDeviceInfo.TDeviceClass.Phone
//  else
//    Result := TDeviceInfo.TDeviceClass.Tablet;
end;
function IsDeviceType: TDeviceInfo.TDeviceClass;
//var
//  DeviceService: IDeviceBehavior;
//  Context: TFMXObject;
begin
//  Context := Screen.ActiveForm;
//  if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior, DeviceService, Context) then
//    Result := DeviceService.GetDeviceClass(Context)
//  else
    Result := DefineDeviceClassByFormSize;
end;
function IsTablet: Boolean;
begin
  Result := IsDeviceType = TDeviceInfo.TDeviceClass.Tablet;
{$IFDEF IOS}
  Result := IsPad;
{$ENDIF}
end;
procedure SetPortraitOrientation;
var
  ScreenService: IFMXScreenService;
  OrientSet: TScreenOrientations;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
  begin
    OrientSet := [TScreenOrientation.{$IF CompilerVersion >= 35.0}Portrait{$ELSE}soPortrait{$IFEND}];
//    ScreenService.SetSupportedScreenOrientations(OrientSet);
  end;
end;

function IsPortraitOrientation: Boolean;
var
  FScreenService: IFMXScreenService;
begin
  Result := true;
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, FScreenService) then
    Result := (FScreenService.GetScreenOrientation = TScreenOrientation.Portrait) or
      (FScreenService.GetScreenOrientation = TScreenOrientation.InvertedPortrait);
end;
function IsLargePhone: Boolean;
{$IF defined(ANDROID) or defined(IOS)}
const
  MinLogicaSizeForLargePhone = 736;
var
  ThisDevice: TDeviceInfo;
{$ENDIF}
begin
  Result := False;
{$IF defined(ANDROID) or defined(IOS)}
  ThisDevice := TDeviceInfo.ThisDevice;
  if ThisDevice <> nil then
    Result := Max(ThisDevice.MinLogicalScreenSize.Width, ThisDevice.MinLogicalScreenSize.Height) >=
      MinLogicaSizeForLargePhone
  else
    Result := true;
{$ENDIF}
end;
// *** FMX.MultiView ***
//{$IF DEFINED(MACOS) OR DEFINED(IOS)}
{$IF DEFINED(IOS)}
function GetSysInfoByName(typeSpecifier: string): string;
var
  Size: integer;
  AResult: TArray<Byte>;
begin
  Result:='';
  sysctlbyname(MarshaledAString(TMarshal.AsAnsi(typeSpecifier)), nil, @Size, nil, 0);
  if Size>0 then
  begin
    SetLength(AResult, Size);
    sysctlbyname(MarshaledAString(TMarshal.AsAnsi(typeSpecifier)), MarshaledAString(AResult), @Size, nil, 0);
    Result := TEncoding.UTF8.GetString(AResult);
  end;
end;
{$ENDIF}
{$IFDEF ANDROID}
function HasPermission(const Permission: string): Boolean;
begin
  Result := TAndroidHelper.Context.checkCallingOrSelfPermission(StringToJString(Permission))
    = TJPackageManager.JavaClass.PERMISSION_GRANTED
end;
function getMobileType(jType: integer): TmyConnectionType;
begin
  Result := ctUnknown; // Unknown connection type
  if jType = TJConnectivityManager.JavaClass.TYPE_ETHERNET then
    Result := ctEthernet
  else if jType = TJConnectivityManager.JavaClass.TYPE_WIFI then
    Result := ctWIFI
  else
  begin
    if (jType = TJConnectivityManager.JavaClass.TYPE_MOBILE) or
      (jType = TJConnectivityManager.JavaClass.TYPE_MOBILE_DUN) or
      (jType = TJConnectivityManager.JavaClass.TYPE_MOBILE_HIPRI) or
      (jType = TJConnectivityManager.JavaClass.TYPE_MOBILE_MMS) or
      (jType = TJConnectivityManager.JavaClass.TYPE_MOBILE_SUPL) or (jType = TJConnectivityManager.JavaClass.TYPE_WIMAX)
    then
      Result := ctMobile;
  end;
end;
function getMobileSubType(jType: integer): TmyNetworkType;
begin
  Result := ntUnknown;
  if (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_GPRS) or
    (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_EDGE) or (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_CDMA)
    or (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_1xRTT) or
    (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_IDEN) then
    Result := nt2G
  else if (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_UMTS) or
    (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_EVDO_0) or
    (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_EVDO_A) or
    (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_HSDPA) or
    (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_HSUPA) or
    (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_HSPA) or
    (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_EVDO_B) or
    (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_EHRPD) or
    (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_HSPAP) then
    Result := nt3G
  else if (jType = TJTelephonyManager.JavaClass.NETWORK_TYPE_LTE) then
    Result := nt4G;
end;
function GetWifiManager: JWifiManager;
var
  WifiManagerObj: JObject;
begin
  Result := nil;
  if HasPermission('android.permission.ACCESS_WIFI_STATE') then
  begin
    WifiManagerObj := TAndroidHelper.Context.getSystemService(TJContext.JavaClass.WIFI_SERVICE);
    if not Assigned(WifiManagerObj) then
      raise Exception.Create('Could not locate Wifi Service');
    Result := TJWifiManager.Wrap((WifiManagerObj as ILocalObject).GetObjectID);
    if not Assigned(Result) then
      raise Exception.Create('Could not access Wifi Manager');
  end;
end;
function GetTelephonyManager: JTelephonyManager;
var
  TelephoneServiceNative: JObject;
begin
  Result := nil;
  TelephoneServiceNative := TAndroidHelper.Context.getSystemService(TJContext.JavaClass.TELEPHONY_SERVICE);
  if not Assigned(TelephoneServiceNative) then
    raise Exception.Create('Could not locate Telephony Service');
  Result := TJTelephonyManager.Wrap((TelephoneServiceNative as ILocalObject).GetObjectID);
  if not Assigned(Result) then
    raise Exception.Create('Could not access Telephony Manager');
end;
function GetConnectivityManager: JConnectivityManager;
var
  ConnectivityServiceNative: JObject;
begin
  Result := nil;
  if HasPermission('android.permission.ACCESS_NETWORK_STATE') then
  begin
    ConnectivityServiceNative := TAndroidHelper.Context.getSystemService(TJContext.JavaClass.CONNECTIVITY_SERVICE);
    if not Assigned(ConnectivityServiceNative) then
      raise Exception.Create('Could not locate Connectivity Service');
    Result := TJConnectivityManager.Wrap((ConnectivityServiceNative as ILocalObject).GetObjectID);
    if not Assigned(Result) then
      raise Exception.Create('Could not access Connectivity Manager');
  end;
end;
procedure GetAddress(out aMac, aWifiIP: string);
var
  WifiManager: JWifiManager;
  WifiInfo: JWifiInfo;
  ip: integer;
begin
  WifiManager := GetWifiManager;
  if Assigned(WifiManager) then
  begin
    WifiInfo := WifiManager.getConnectionInfo;
    aMac := JStringToString(WifiInfo.getMacAddress);
    ip := WifiInfo.GetIPAddress;
    aWifiIP := Format('%d.%d.%d.%d', [ip and $FF, ip shr 8 and $FF, ip shr 16 and $FF, ip shr 24 and $FF]);
  end;
end;
function GetCodename(VerString: string): string;
begin
  if Pos('4.4', VerString) = 1 then
    Result := 'Kit Kat'
  else if Pos('4.0', VerString) > 0 then
    Result := 'ICS'
  else if Pos('4.', VerString) > 0 then
    Result := 'JB'
  else if (Pos('5.', VerString) > 0) then
    Result := 'Lollipop'
  else if Pos('6.', VerString) > 0 then
    Result := 'Marshmallow'
  else
    Result := 'Unknown';
end;
{$ENDIF}
function IsGPSActive(HIGH_ACCURACY: Boolean = False): Boolean;
var
  Provider: string;
  LocationMode: integer;
begin
  Result := true; // for all platforms
{$IFDEF ANDROID}
  if TOSVersion.Check(4, 4) then
  begin
    LocationMode := TJSettings_Secure.JavaClass.getInt(TAndroidHelper.Context.getContentResolver,
      TJSettings_Secure.JavaClass.LOCATION_MODE);
    if HIGH_ACCURACY then
      Result := LocationMode <> TJSettings_Secure.JavaClass.LOCATION_MODE_HIGH_ACCURACY
    else
      Result := LocationMode <> TJSettings_Secure.JavaClass.LOCATION_MODE_OFF;
  end
  else
  begin
    Provider := JStringToString(TJSettings_Secure.JavaClass.GetString(TAndroidHelper.Context.getContentResolver,
      TJSettings_system.JavaClass.LOCATION_PROVIDERS_ALLOWED));
    if HIGH_ACCURACY then
      Result := Pos('gps', Provider) > 0
    else
      Result := (Pos('network', Provider) > 0) or (Pos('gps', Provider) > 0);
  end;
{$ENDIF}
end;
function IsNetConnected: Boolean;
{$IFDEF MSWINDOWS}
const
  INTERNET_CONNECTION_MODEM      = 1;
  INTERNET_CONNECTION_LAN        = 2;
  INTERNET_CONNECTION_PROXY      = 4;
  INTERNET_CONNECTION_MODEM_BUSY = 8;
var
  dwConnectionTypes: DWORD;
{$ENDIF}
begin
  Result := False;
{$IF defined(ANDROID)}
  Result := IsNetConnectionType <> ctNone;
{$ELSEIF defined(MSWINDOWS)}
  dwConnectionTypes := INTERNET_CONNECTION_MODEM or INTERNET_CONNECTION_LAN or INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@dwConnectionTypes, 0);
{$ENDIF}
end;
function IsNetworkType: TmyNetworkType;
{$IFDEF ANDROID}
var
  TelephoneManager: JTelephonyManager;
{$ENDIF}
begin
  Result := {$IF defined(MSWINDOWS) or defined(MACOS)}ntNone {$ELSE} ntUnknown{$ENDIF};
{$IFDEF ANDROID}
  TelephoneManager := GetTelephonyManager;
  if (Assigned(TelephoneManager)) and (TelephoneManager.getSimState = TJTelephonyManager.JavaClass.SIM_STATE_READY) then
    Result := getMobileSubType(TelephoneManager.getNetworkType);
{$ENDIF}
end;
function IsNetConnectionType: TmyConnectionType;
{$IFDEF ANDROID}
var
  ConnectivityManager: JConnectivityManager;
  ActiveNetwork: JNetworkInfo;
{$ENDIF}
begin
  Result := ctNone;
{$IFDEF ANDROID}
  ConnectivityManager := GetConnectivityManager;
  if Assigned(ConnectivityManager) then
  begin
    ActiveNetwork := ConnectivityManager.getActiveNetworkInfo;
    if Assigned(ActiveNetwork) and ActiveNetwork.isConnected then
      Result := getMobileType(ActiveNetwork.getType);
  end;
{$ELSEIF defined(MSWINDOWS)}
  if IsNetConnected then
    Result := ctEthernet;
{$ENDIF}
end;
{$IFDEF MSWINDOWS}
procedure GetAddress(out aMac, aIP: string);
const
  wbemFlagForwardOnly = $00000020;
var
  FSWbemLocator: OLEVariant;
  FWMIService: OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject: OLEVariant;
  oEnum: IEnumvariant;
  iValue: LongWord;
begin
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
  FWbemObjectSet := FWMIService.ExecQuery
    ('SELECT Description,MACAddress,IPAddress FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled=TRUE', 'WQL',
    wbemFlagForwardOnly);
  oEnum := IUnknown(FWbemObjectSet._NewEnum) as IEnumvariant;
  while oEnum.Next(1, FWbemObject, iValue) = 0 do
  begin
    if not VarIsNull(FWbemObject.MACAddress) then
      aMac := VarToStr(FWbemObject.MACAddress);
    if not VarIsNull(FWbemObject.IPAddress) then
      aIP := VarToStr(FWbemObject.IPAddress[0]);
    if not(aMac.IsEmpty and aIP.IsEmpty) then
    begin
      FWbemObject := Unassigned;
      break;
      exit;
    end;
    FWbemObject := Unassigned;
  end;
end;
{$ENDIF}
function FloatS(const aValue: Single): string;
var
  Buf: TFormatSettings;
begin
  Buf := FormatSettings;
  Buf.DecimalSeparator := '.';
  Result := FloatToStr(aValue, Buf);
end;
procedure DeviceInfoByPlatform;
const
  sPlatform: array [TOSVersion.TPlatform] of string = ('Windows', 'MacOS', 'IOS', 'Android', 'WinRT', 'Linux');
  sArchitecture: array [TOSVersion.TArchitecture] of string = ('IntelX86', 'IntelX64', 'ARM32', 'ARM64');
var
  sScale: Single;
  sScreenSize: TPoint;
//  ScreenService: IFMXScreenService;
//  LocaleService: IFMXLocaleService;
{$IFDEF ANDROID}
  I: integer;
  arrObjAbis: TJavaObjectArray<JString>;
//  sAbis: string;
//  PhoneService: IFMXPhoneDialerService;
{$ENDIF}
begin
  DeviceInfo.diPlatform := sPlatform[TOSVersion.Platform];
  DeviceInfo.diPlatformT := TOSVersion.Platform;
  DeviceInfo.diArchitecture := sArchitecture[TOSVersion.Architecture];
  DeviceInfo.diArchitectureT := TOSVersion.Architecture;
  DeviceInfo.diMobileOperator := 'unknown';
  DeviceInfo.diIsIntel := DeviceInfo.diArchitecture.Contains('IntelX');

  case TOSVersion.Platform of
    pfMacOS:
      begin
{$IFDEF MACOS}
        DeviceInfo.diDevice := 'MacOS';// (' + trim(GetSysInfoByName('hw.model')) + ')';
        DeviceInfo.diPlatformVer := '';//GetSysInfoByName('kern.ostype') + ' ' + GetSysInfoByName('kern.osrelease');
{$ENDIF}
      end;
    pfiOS:
      begin
{$IFDEF IOS}
        with TUIDevice.Wrap(TUIDevice.OCClass.currentDevice) do
        begin
          DeviceInfo.diPlatformVer := systemName.UTF8String + ' (' + systemVersion.UTF8String + ')';
          //后面会多出#0
          DeviceInfo.diDevice := model.UTF8String;
          //Trim(GetSysInfoByName('hw.machine'));
//          //model.UTF8String;
//          //@"iPhone1,1" on iPhone
//          //@"iPhone1,2" on iPhone 3G
//          if DeviceInfo.diDevice='iPhone1,1' then
//          begin
//            DeviceInfo.diDevice:='iPhone';
//          end
//          else if DeviceInfo.diDevice='iPhone1,2' then
//          begin
//            DeviceInfo.diDevice:='iPhone 3G';
//          end
//
//          //@"iPhone2,1" on iPhone 3GS
//          else if DeviceInfo.diDevice='iPhone2,1' then
//          begin
//            DeviceInfo.diDevice:='iPhone 3GS';
//          end
//
//          //@"iPhone3,1" on iPhone 4 (GSM)
//          //@"iPhone3,3" on iPhone 4 (CDMA/Verizon/Sprint)
//          else if DeviceInfo.diDevice='iPhone3,1' then
//          begin
//            DeviceInfo.diDevice:='iPhone 4';
//          end
//          else if DeviceInfo.diDevice='iPhone3,3' then
//          begin
//            DeviceInfo.diDevice:='iPhone 4';
//          end
//
//          //@"iPhone4,1" on iPhone 4S
//          else if DeviceInfo.diDevice='iPhone4,1' then
//          begin
//            DeviceInfo.diDevice:='iPhone 4S';
//          end
//
//          //@"iPhone5,1" on iPhone 5 (model A1428, AT&T/Canada)
//          //@"iPhone5,2" on iPhone 5 (model A1429, everything else)
//          //@"iPhone5,3" on iPhone 5c (model A1456, A1532 | GSM)
//          //@"iPhone5,4" on iPhone 5c (model A1507, A1516, A1526 (China), A1529 | Global)
//          else if DeviceInfo.diDevice='iPhone5,1' then
//          begin
//            DeviceInfo.diDevice:='iPhone 5';
//          end
//          else if DeviceInfo.diDevice='iPhone5,2' then
//          begin
//            DeviceInfo.diDevice:='iPhone 5';
//          end
//          else if DeviceInfo.diDevice='iPhone5,3' then
//          begin
//            DeviceInfo.diDevice:='iPhone 5c';
//          end
//          else if DeviceInfo.diDevice='iPhone5,4' then
//          begin
//            DeviceInfo.diDevice:='iPhone 5c';
//          end
//
//          //@"iPhone6,1" on iPhone 5s (model A1433, A1533 | GSM)
//          //@"iPhone6,2" on iPhone 5s (model A1457, A1518, A1528 (China), A1530 | Global)
//          else if DeviceInfo.diDevice='iPhone6,1' then
//          begin
//            DeviceInfo.diDevice:='iPhone 5s';
//          end
//          else if DeviceInfo.diDevice='iPhone6,2' then
//          begin
//            DeviceInfo.diDevice:='iPhone 5s';
//          end
//
//          //@"iPhone7,1" on iPhone 6 Plus
//          //@"iPhone7,2" on iPhone 6
//          else if DeviceInfo.diDevice='iPhone7,1' then
//          begin
//            DeviceInfo.diDevice:='iPhone 6 Plus';
//          end
//          else if DeviceInfo.diDevice='iPhone7,2' then
//          begin
//            DeviceInfo.diDevice:='iPhone 6';
//          end
//
//          //@"iPhone8,1" on iPhone 6S
//          //@"iPhone8,2" on iPhone 6S Plus
//          //@"iPhone8,4" on iPhone SE
//          else if DeviceInfo.diDevice='iPhone8,1' then
//          begin
//            DeviceInfo.diDevice:='iPhone 6S';
//          end
//          else if DeviceInfo.diDevice='iPhone8,2' then
//          begin
//            DeviceInfo.diDevice:='iPhone 6S Plus';
//          end
//          else if DeviceInfo.diDevice='iPhone8,4' then
//          begin
//            DeviceInfo.diDevice:='iPhone SE';
//          end
//
//
//          //@"iPhone9,1" on iPhone 7 (CDMA)
//          //@"iPhone9,3" on iPhone 7 (GSM)
//          //@"iPhone9,2" on iPhone 7 Plus (CDMA)
//          //@"iPhone9,4" on iPhone 7 Plus (GSM)
//          else if DeviceInfo.diDevice='iPhone9,1' then
//          begin
//            DeviceInfo.diDevice:='iPhone 7';
//          end
//          else if DeviceInfo.diDevice='iPhone9,2' then
//          begin
//            DeviceInfo.diDevice:='iPhone 7 Plus';
//          end
//          else if DeviceInfo.diDevice='iPhone9,3' then
//          begin
//            DeviceInfo.diDevice:='iPhone 7';
//          end
//          else if DeviceInfo.diDevice='iPhone9,4' then
//          begin
//            DeviceInfo.diDevice:='iPhone 7 Plus';
//          end;

          ////iPhone
          //https://stackoverflow.com/questions/11197509/ios-how-to-get-device-make-and-model
          //https://community.embarcadero.com/blogs/entry/get-os-version-device-name-language-on-ios-android-by-delphi

          DeviceInfo.diMacAddress := identifierForVendor.UUIDString.UTF8String;
          DeviceInfo.diIPAddress := 'unknown';
        end;
        { if TPlatformServices.Current.SupportsPlatformService(IFMXPhoneDialerService, IInterface(PhoneService)) then
          begin
          try
          DeviceInfo.diMobileOperator := PhoneService.GetCarrier.GetCarrierName + ' ' +
          PhoneService.GetCarrier.GetMobileCountryCode
          except
          end;
          end; }
{$ENDIF}
      end;
    pfAndroid:
      begin
{$IFDEF ANDROID}
//        if TOSVersion.Major >= 5 then
//        begin
//          sAbis := '';
//          arrObjAbis := TJBuild.JavaClass.SUPPORTED_ABIS;
//          for I := 0 to arrObjAbis.Length - 1 do
//            sAbis := sAbis + ',' + JStringToString(arrObjAbis.Items[I]);
//          sAbis := sAbis.trim([',']);
//        end
//        else
//          sAbis := JStringToString(TJBuild.JavaClass.CPU_ABI) + ',' + JStringToString(TJBuild.JavaClass.CPU_ABI2);
//
//        DeviceInfo.diArchitecture2 := sAbis;
//        DeviceInfo.diIsIntel := sAbis.Contains('x86') or JStringToString(TJBuild.JavaClass.FINGERPRINT)
//          .Contains('intel');
        DeviceInfo.diPlatformVer := GetCodename(JStringToString(TJBuild_VERSION.JavaClass.release)) + ' ' +
          JStringToString(TJBuild_VERSION.JavaClass.release);
        //OPPO OPPO A59m
//        DeviceInfo.diDevice := JStringToString(TJBuild.JavaClass.MANUFACTURER) + ' ' +
//          JStringToString(TJBuild.JavaClass.model);
        if Pos(JStringToString(TJBuild.JavaClass.MANUFACTURER),
                JStringToString(TJBuild.JavaClass.model))>0 then

        begin

          //model中已经存在了生产商

          DeviceInfo.diDevice := JStringToString(TJBuild.JavaClass.model);

        end

        else

        begin

          DeviceInfo.diDevice := JStringToString(TJBuild.JavaClass.MANUFACTURER)

                                  + ' '

                                  + JStringToString(TJBuild.JavaClass.model);

        end;

        GetAddress(DeviceInfo.diMacAddress, DeviceInfo.diIPAddress);
//        if TPlatformServices.Current.SupportsPlatformService(IFMXPhoneDialerService, IInterface(PhoneService)) then
//        begin
//          try
//            DeviceInfo.diMobileOperator := PhoneService.GetCarrier.GetCarrierName + ' ' +
//              PhoneService.GetCarrier.GetMobileCountryCode
//          except
//          end;
//        end;
{$ENDIF}
      end;
    pfWindows:
      begin
{$IFDEF MSWINDOWS}
        DeviceInfo.diPlatformVer := TOSVersion.Major.ToString + '.' + TOSVersion.Minor.ToString;
        DeviceInfo.diDevice := TOSVersion.Name;
        GetAddress(DeviceInfo.diMacAddress, DeviceInfo.diIPAddress);
{$ENDIF}
      end;
  end;
//  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
//  begin
//    sScreenSize := ScreenService.GetScreenSize.Round;
//    sScale := ScreenService.GetScreenScale;
//    DeviceInfo.diScreenLogic := FloatS(sScreenSize.x) + ' x ' + FloatS(sScreenSize.y);
//    DeviceInfo.diScreenPhis := FloatS(sScreenSize.x * sScale) + ' x ' + FloatS(sScreenSize.y * sScale);
//    DeviceInfo.diScreenWidth := sScreenSize.x;
//    DeviceInfo.diScreenHeight := sScreenSize.y;
//    DeviceInfo.diScale := sScale;
//  end;
//
//  if TPlatformServices.Current.SupportsPlatformService(IFMXLocaleService, IInterface(LocaleService)) then
//    DeviceInfo.diLang := LocaleService.GetCurrentLangID;
  with TTimeZone.Create do
  begin
    DeviceInfo.diTimeZone := (((Local.UtcOffset.Hours * 60) + Local.UtcOffset.Minutes) * 60) + Local.UtcOffset.Seconds;
    Free;
  end;
end;
{$IFDEF MSWINDOWS}
initialization
CoInitialize(nil);
finalization
CoUninitialize;
{$ENDIF}
end.

