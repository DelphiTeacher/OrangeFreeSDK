(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2014-08-04　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

unit iOSapi.UIDevice2;

interface

uses Macapi.ObjCRuntime, Macapi.ObjectiveC, iOSapi.Cocoatypes, Macapi.CoreFoundation,
 iOSapi.Foundation,
 iOSapi.UIKit; //will load lib

type

  {Class forward declarations}
  UIDevice = interface;

  UIDeviceClass = interface(NSObjectClass)
    ['{EC8E8149-3859-4E16-83BF-DE1EAE6268DA}']
    {class} function currentDevice: Pointer; cdecl;
  end;
  UIDevice = interface(NSObject)
    ['{4E986BF7-A701-403E-B5E4-E10AEFB1483C}']
    function batteryLevel: Single; cdecl;
    function batteryState: UIDeviceBatteryState; cdecl;
    procedure beginGeneratingDeviceOrientationNotifications; cdecl;
    procedure endGeneratingDeviceOrientationNotifications; cdecl;
    function isBatteryMonitoringEnabled: Boolean; cdecl;
    function isGeneratingDeviceOrientationNotifications: Boolean; cdecl;
    function isMultitaskingSupported: Boolean; cdecl;
    function isProximityMonitoringEnabled: Boolean; cdecl;
    function localizedModel: NSString; cdecl;
    function model: NSString; cdecl;
    function name: NSString; cdecl;
    function orientation: UIDeviceOrientation; cdecl;
    procedure playInputClick; cdecl;
    function proximityState: Boolean; cdecl;
    procedure setBatteryMonitoringEnabled(batteryMonitoringEnabled: Boolean); cdecl;
    procedure setProximityMonitoringEnabled(proximityMonitoringEnabled: Boolean); cdecl;
    function systemName: NSString; cdecl;
    function systemVersion: NSString; cdecl;
    function uniqueIdentifier: NSString; cdecl;
    function userInterfaceIdiom: UIUserInterfaceIdiom; cdecl;
    function identifierForVendor: NSUUID; cdecl;
    function &platform: NSString; cdecl;
    function hwmodel: NSString; cdecl;
    function platformType: NSUInteger; cdecl;
    function platformString: NSString; cdecl;
    function cpuFrequency: NSUInteger; cdecl;
    function busFrequency: NSUInteger; cdecl;
    function cpuCount: NSUInteger; cdecl;
    function totalMemory: NSUInteger; cdecl;
    function userMemory: NSUInteger; cdecl;
    function totalDiskSpace: NSNumber; cdecl;
    function freeDiskSpace: NSNumber; cdecl;
    function macaddress: NSString; cdecl;
    function hasRetinaDisplay: Boolean; cdecl;
//    function deviceFamily: UIDeviceFamily; cdecl;
  end;
  TUIDevice2 = class(TOCGenericImport<iOSapi.UIDevice2.UIDeviceClass, iOSapi.UIDevice2.UIDevice>)  end;



implementation

begin

end.


