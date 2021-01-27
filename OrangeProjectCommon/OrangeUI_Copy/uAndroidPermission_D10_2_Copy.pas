unit uAndroidPermission_D10_2_Copy;

interface


uses
  Classes,
  System.StrUtils,
  IniFiles,


//  uAppCommon,
  uBaseLog_Copy,
//  uAndroidLog,
//  uGPSUtils,
  DateUtils,
//  uMapCommon,
  uBaseList_Copy,
  FMX.Types,

  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,



  {$IFDEF ANDROID}
    Androidapi.Helpers,
    Androidapi.JNIBridge,
    Androidapi.JNI.JavaTypes,
    Androidapi.JNI.Net,
    Androidapi.JNI.GraphicsContentViewText,
    Androidapi.JNI.Os,
    Androidapi.JNI.App,
    System.Generics.Collections,
    System.Messaging,


    {$IFNDEF IN_ANDROIDSERVICE}
    //Android服务中不能使用这个文件,不然会卡死
    FMX.Helpers.Android,
    {$ENDIF}

  {$ENDIF}




  System.Sensors,
  {$IFDEF USE_LOCATIONSENSOR}
    {$IFDEF IOS}
    System.iOS.Sensors,
    {$ENDIF}
    System.Sensors.Components,
  {$ENDIF USE_LOCATIONSENSOR}




  SysUtils;



{$IFDEF ANDROID}
{$IF RTLVersion=31}// 10.2

type

  JManifest_permission=interface;

  JManifest_permissionClass = interface(JObjectClass)
    ['{7138C56B-F5A7-4319-8D1D-0035C5F4E01A}']
    {class} function _GetACCESS_CHECKIN_PROPERTIES: JString; cdecl;
    {class} function _GetACCESS_COARSE_LOCATION: JString; cdecl;
    {class} function _GetACCESS_FINE_LOCATION: JString; cdecl;
    {class} function _GetACCESS_LOCATION_EXTRA_COMMANDS: JString; cdecl;
    {class} function _GetACCESS_NETWORK_STATE: JString; cdecl;
    {class} function _GetACCESS_NOTIFICATION_POLICY: JString; cdecl;
    {class} function _GetACCESS_WIFI_STATE: JString; cdecl;
    {class} function _GetACCOUNT_MANAGER: JString; cdecl;
    {class} function _GetADD_VOICEMAIL: JString; cdecl;
    {class} function _GetANSWER_PHONE_CALLS: JString; cdecl;
    {class} function _GetBATTERY_STATS: JString; cdecl;
    {class} function _GetBIND_ACCESSIBILITY_SERVICE: JString; cdecl;
    {class} function _GetBIND_APPWIDGET: JString; cdecl;
    {class} function _GetBIND_AUTOFILL_SERVICE: JString; cdecl;
    {class} function _GetBIND_CARRIER_MESSAGING_SERVICE: JString; cdecl;
    {class} function _GetBIND_CARRIER_SERVICES: JString; cdecl;
    {class} function _GetBIND_CHOOSER_TARGET_SERVICE: JString; cdecl;
    {class} function _GetBIND_CONDITION_PROVIDER_SERVICE: JString; cdecl;
    {class} function _GetBIND_DEVICE_ADMIN: JString; cdecl;
    {class} function _GetBIND_DREAM_SERVICE: JString; cdecl;
    {class} function _GetBIND_INCALL_SERVICE: JString; cdecl;
    {class} function _GetBIND_INPUT_METHOD: JString; cdecl;
    {class} function _GetBIND_MIDI_DEVICE_SERVICE: JString; cdecl;
    {class} function _GetBIND_NFC_SERVICE: JString; cdecl;
    {class} function _GetBIND_NOTIFICATION_LISTENER_SERVICE: JString; cdecl;
    {class} function _GetBIND_PRINT_SERVICE: JString; cdecl;
    {class} function _GetBIND_QUICK_SETTINGS_TILE: JString; cdecl;
    {class} function _GetBIND_REMOTEVIEWS: JString; cdecl;
    {class} function _GetBIND_SCREENING_SERVICE: JString; cdecl;
    {class} function _GetBIND_TELECOM_CONNECTION_SERVICE: JString; cdecl;
    {class} function _GetBIND_TEXT_SERVICE: JString; cdecl;
    {class} function _GetBIND_TV_INPUT: JString; cdecl;
    {class} function _GetBIND_VISUAL_VOICEMAIL_SERVICE: JString; cdecl;
    {class} function _GetBIND_VOICE_INTERACTION: JString; cdecl;
    {class} function _GetBIND_VPN_SERVICE: JString; cdecl;
    {class} function _GetBIND_VR_LISTENER_SERVICE: JString; cdecl;
    {class} function _GetBIND_WALLPAPER: JString; cdecl;
    {class} function _GetBLUETOOTH: JString; cdecl;
    {class} function _GetBLUETOOTH_ADMIN: JString; cdecl;
    {class} function _GetBLUETOOTH_PRIVILEGED: JString; cdecl;
    {class} function _GetBODY_SENSORS: JString; cdecl;
    {class} function _GetBROADCAST_PACKAGE_REMOVED: JString; cdecl;
    {class} function _GetBROADCAST_SMS: JString; cdecl;
    {class} function _GetBROADCAST_STICKY: JString; cdecl;
    {class} function _GetBROADCAST_WAP_PUSH: JString; cdecl;
    {class} function _GetCALL_PHONE: JString; cdecl;
    {class} function _GetCALL_PRIVILEGED: JString; cdecl;
    {class} function _GetCAMERA: JString; cdecl;
    {class} function _GetCAPTURE_AUDIO_OUTPUT: JString; cdecl;
    {class} function _GetCAPTURE_SECURE_VIDEO_OUTPUT: JString; cdecl;
    {class} function _GetCAPTURE_VIDEO_OUTPUT: JString; cdecl;
    {class} function _GetCHANGE_COMPONENT_ENABLED_STATE: JString; cdecl;
    {class} function _GetCHANGE_CONFIGURATION: JString; cdecl;
    {class} function _GetCHANGE_NETWORK_STATE: JString; cdecl;
    {class} function _GetCHANGE_WIFI_MULTICAST_STATE: JString; cdecl;
    {class} function _GetCHANGE_WIFI_STATE: JString; cdecl;
    {class} function _GetCLEAR_APP_CACHE: JString; cdecl;
    {class} function _GetCONTROL_LOCATION_UPDATES: JString; cdecl;
    {class} function _GetDELETE_CACHE_FILES: JString; cdecl;
    {class} function _GetDELETE_PACKAGES: JString; cdecl;
    {class} function _GetDIAGNOSTIC: JString; cdecl;
    {class} function _GetDISABLE_KEYGUARD: JString; cdecl;
    {class} function _GetDUMP: JString; cdecl;
    {class} function _GetEXPAND_STATUS_BAR: JString; cdecl;
    {class} function _GetFACTORY_TEST: JString; cdecl;
    {class} function _GetGET_ACCOUNTS: JString; cdecl;
    {class} function _GetGET_ACCOUNTS_PRIVILEGED: JString; cdecl;
    {class} function _GetGET_PACKAGE_SIZE: JString; cdecl;
    {class} function _GetGET_TASKS: JString; cdecl;
    {class} function _GetGLOBAL_SEARCH: JString; cdecl;
    {class} function _GetINSTALL_LOCATION_PROVIDER: JString; cdecl;
    {class} function _GetINSTALL_PACKAGES: JString; cdecl;
    {class} function _GetINSTALL_SHORTCUT: JString; cdecl;
    {class} function _GetINSTANT_APP_FOREGROUND_SERVICE: JString; cdecl;
    {class} function _GetINTERNET: JString; cdecl;
    {class} function _GetKILL_BACKGROUND_PROCESSES: JString; cdecl;
    {class} function _GetLOCATION_HARDWARE: JString; cdecl;
    {class} function _GetMANAGE_DOCUMENTS: JString; cdecl;
    {class} function _GetMANAGE_OWN_CALLS: JString; cdecl;
    {class} function _GetMASTER_CLEAR: JString; cdecl;
    {class} function _GetMEDIA_CONTENT_CONTROL: JString; cdecl;
    {class} function _GetMODIFY_AUDIO_SETTINGS: JString; cdecl;
    {class} function _GetMODIFY_PHONE_STATE: JString; cdecl;
    {class} function _GetMOUNT_FORMAT_FILESYSTEMS: JString; cdecl;
    {class} function _GetMOUNT_UNMOUNT_FILESYSTEMS: JString; cdecl;
    {class} function _GetNFC: JString; cdecl;
    {class} function _GetPACKAGE_USAGE_STATS: JString; cdecl;
    {class} function _GetPERSISTENT_ACTIVITY: JString; cdecl;
    {class} function _GetPROCESS_OUTGOING_CALLS: JString; cdecl;
    {class} function _GetREAD_CALENDAR: JString; cdecl;
    {class} function _GetREAD_CALL_LOG: JString; cdecl;
    {class} function _GetREAD_CONTACTS: JString; cdecl;
    {class} function _GetREAD_EXTERNAL_STORAGE: JString; cdecl;
    {class} function _GetREAD_FRAME_BUFFER: JString; cdecl;
    {class} function _GetREAD_INPUT_STATE: JString; cdecl;
    {class} function _GetREAD_LOGS: JString; cdecl;
    {class} function _GetREAD_PHONE_NUMBERS: JString; cdecl;
    {class} function _GetREAD_PHONE_STATE: JString; cdecl;
    {class} function _GetREAD_SMS: JString; cdecl;
    {class} function _GetREAD_SYNC_SETTINGS: JString; cdecl;
    {class} function _GetREAD_SYNC_STATS: JString; cdecl;
    {class} function _GetREAD_VOICEMAIL: JString; cdecl;
    {class} function _GetREBOOT: JString; cdecl;
    {class} function _GetRECEIVE_BOOT_COMPLETED: JString; cdecl;
    {class} function _GetRECEIVE_MMS: JString; cdecl;
    {class} function _GetRECEIVE_SMS: JString; cdecl;
    {class} function _GetRECEIVE_WAP_PUSH: JString; cdecl;
    {class} function _GetRECORD_AUDIO: JString; cdecl;
    {class} function _GetREORDER_TASKS: JString; cdecl;
    {class} function _GetREQUEST_COMPANION_RUN_IN_BACKGROUND: JString; cdecl;
    {class} function _GetREQUEST_COMPANION_USE_DATA_IN_BACKGROUND: JString; cdecl;
    {class} function _GetREQUEST_DELETE_PACKAGES: JString; cdecl;
    {class} function _GetREQUEST_IGNORE_BATTERY_OPTIMIZATIONS: JString; cdecl;
    {class} function _GetREQUEST_INSTALL_PACKAGES: JString; cdecl;
    {class} function _GetRESTART_PACKAGES: JString; cdecl;
    {class} function _GetSEND_RESPOND_VIA_MESSAGE: JString; cdecl;
    {class} function _GetSEND_SMS: JString; cdecl;
    {class} function _GetSET_ALARM: JString; cdecl;
    {class} function _GetSET_ALWAYS_FINISH: JString; cdecl;
    {class} function _GetSET_ANIMATION_SCALE: JString; cdecl;
    {class} function _GetSET_DEBUG_APP: JString; cdecl;
    {class} function _GetSET_PREFERRED_APPLICATIONS: JString; cdecl;
    {class} function _GetSET_PROCESS_LIMIT: JString; cdecl;
    {class} function _GetSET_TIME: JString; cdecl;
    {class} function _GetSET_TIME_ZONE: JString; cdecl;
    {class} function _GetSET_WALLPAPER: JString; cdecl;
    {class} function _GetSET_WALLPAPER_HINTS: JString; cdecl;
    {class} function _GetSIGNAL_PERSISTENT_PROCESSES: JString; cdecl;
    {class} function _GetSTATUS_BAR: JString; cdecl;
    {class} function _GetSYSTEM_ALERT_WINDOW: JString; cdecl;
    {class} function _GetTRANSMIT_IR: JString; cdecl;
    {class} function _GetUNINSTALL_SHORTCUT: JString; cdecl;
    {class} function _GetUPDATE_DEVICE_STATS: JString; cdecl;
    {class} function _GetUSE_FINGERPRINT: JString; cdecl;
    {class} function _GetUSE_SIP: JString; cdecl;
    {class} function _GetVIBRATE: JString; cdecl;
    {class} function _GetWAKE_LOCK: JString; cdecl;
    {class} function _GetWRITE_APN_SETTINGS: JString; cdecl;
    {class} function _GetWRITE_CALENDAR: JString; cdecl;
    {class} function _GetWRITE_CALL_LOG: JString; cdecl;
    {class} function _GetWRITE_CONTACTS: JString; cdecl;
    {class} function _GetWRITE_EXTERNAL_STORAGE: JString; cdecl;
    {class} function _GetWRITE_GSERVICES: JString; cdecl;
    {class} function _GetWRITE_SECURE_SETTINGS: JString; cdecl;
    {class} function _GetWRITE_SETTINGS: JString; cdecl;
    {class} function _GetWRITE_SYNC_SETTINGS: JString; cdecl;
    {class} function _GetWRITE_VOICEMAIL: JString; cdecl;
    {class} function init: JManifest_permission; cdecl;
    {class} property ACCESS_CHECKIN_PROPERTIES: JString read _GetACCESS_CHECKIN_PROPERTIES;
    {class} property ACCESS_COARSE_LOCATION: JString read _GetACCESS_COARSE_LOCATION;
    {class} property ACCESS_FINE_LOCATION: JString read _GetACCESS_FINE_LOCATION;
    {class} property ACCESS_LOCATION_EXTRA_COMMANDS: JString read _GetACCESS_LOCATION_EXTRA_COMMANDS;
    {class} property ACCESS_NETWORK_STATE: JString read _GetACCESS_NETWORK_STATE;
    {class} property ACCESS_NOTIFICATION_POLICY: JString read _GetACCESS_NOTIFICATION_POLICY;
    {class} property ACCESS_WIFI_STATE: JString read _GetACCESS_WIFI_STATE;
    {class} property ACCOUNT_MANAGER: JString read _GetACCOUNT_MANAGER;
    {class} property ADD_VOICEMAIL: JString read _GetADD_VOICEMAIL;
    {class} property ANSWER_PHONE_CALLS: JString read _GetANSWER_PHONE_CALLS;
    {class} property BATTERY_STATS: JString read _GetBATTERY_STATS;
    {class} property BIND_ACCESSIBILITY_SERVICE: JString read _GetBIND_ACCESSIBILITY_SERVICE;
    {class} property BIND_APPWIDGET: JString read _GetBIND_APPWIDGET;
    {class} property BIND_AUTOFILL_SERVICE: JString read _GetBIND_AUTOFILL_SERVICE;
    {class} property BIND_CARRIER_MESSAGING_SERVICE: JString read _GetBIND_CARRIER_MESSAGING_SERVICE;
    {class} property BIND_CARRIER_SERVICES: JString read _GetBIND_CARRIER_SERVICES;
    {class} property BIND_CHOOSER_TARGET_SERVICE: JString read _GetBIND_CHOOSER_TARGET_SERVICE;
    {class} property BIND_CONDITION_PROVIDER_SERVICE: JString read _GetBIND_CONDITION_PROVIDER_SERVICE;
    {class} property BIND_DEVICE_ADMIN: JString read _GetBIND_DEVICE_ADMIN;
    {class} property BIND_DREAM_SERVICE: JString read _GetBIND_DREAM_SERVICE;
    {class} property BIND_INCALL_SERVICE: JString read _GetBIND_INCALL_SERVICE;
    {class} property BIND_INPUT_METHOD: JString read _GetBIND_INPUT_METHOD;
    {class} property BIND_MIDI_DEVICE_SERVICE: JString read _GetBIND_MIDI_DEVICE_SERVICE;
    {class} property BIND_NFC_SERVICE: JString read _GetBIND_NFC_SERVICE;
    {class} property BIND_NOTIFICATION_LISTENER_SERVICE: JString read _GetBIND_NOTIFICATION_LISTENER_SERVICE;
    {class} property BIND_PRINT_SERVICE: JString read _GetBIND_PRINT_SERVICE;
    {class} property BIND_QUICK_SETTINGS_TILE: JString read _GetBIND_QUICK_SETTINGS_TILE;
    {class} property BIND_REMOTEVIEWS: JString read _GetBIND_REMOTEVIEWS;
    {class} property BIND_SCREENING_SERVICE: JString read _GetBIND_SCREENING_SERVICE;
    {class} property BIND_TELECOM_CONNECTION_SERVICE: JString read _GetBIND_TELECOM_CONNECTION_SERVICE;
    {class} property BIND_TEXT_SERVICE: JString read _GetBIND_TEXT_SERVICE;
    {class} property BIND_TV_INPUT: JString read _GetBIND_TV_INPUT;
    {class} property BIND_VISUAL_VOICEMAIL_SERVICE: JString read _GetBIND_VISUAL_VOICEMAIL_SERVICE;
    {class} property BIND_VOICE_INTERACTION: JString read _GetBIND_VOICE_INTERACTION;
    {class} property BIND_VPN_SERVICE: JString read _GetBIND_VPN_SERVICE;
    {class} property BIND_VR_LISTENER_SERVICE: JString read _GetBIND_VR_LISTENER_SERVICE;
    {class} property BIND_WALLPAPER: JString read _GetBIND_WALLPAPER;
    {class} property BLUETOOTH: JString read _GetBLUETOOTH;
    {class} property BLUETOOTH_ADMIN: JString read _GetBLUETOOTH_ADMIN;
    {class} property BLUETOOTH_PRIVILEGED: JString read _GetBLUETOOTH_PRIVILEGED;
    {class} property BODY_SENSORS: JString read _GetBODY_SENSORS;
    {class} property BROADCAST_PACKAGE_REMOVED: JString read _GetBROADCAST_PACKAGE_REMOVED;
    {class} property BROADCAST_SMS: JString read _GetBROADCAST_SMS;
    {class} property BROADCAST_STICKY: JString read _GetBROADCAST_STICKY;
    {class} property BROADCAST_WAP_PUSH: JString read _GetBROADCAST_WAP_PUSH;
    {class} property CALL_PHONE: JString read _GetCALL_PHONE;
    {class} property CALL_PRIVILEGED: JString read _GetCALL_PRIVILEGED;
    {class} property CAMERA: JString read _GetCAMERA;
    {class} property CAPTURE_AUDIO_OUTPUT: JString read _GetCAPTURE_AUDIO_OUTPUT;
    {class} property CAPTURE_SECURE_VIDEO_OUTPUT: JString read _GetCAPTURE_SECURE_VIDEO_OUTPUT;
    {class} property CAPTURE_VIDEO_OUTPUT: JString read _GetCAPTURE_VIDEO_OUTPUT;
    {class} property CHANGE_COMPONENT_ENABLED_STATE: JString read _GetCHANGE_COMPONENT_ENABLED_STATE;
    {class} property CHANGE_CONFIGURATION: JString read _GetCHANGE_CONFIGURATION;
    {class} property CHANGE_NETWORK_STATE: JString read _GetCHANGE_NETWORK_STATE;
    {class} property CHANGE_WIFI_MULTICAST_STATE: JString read _GetCHANGE_WIFI_MULTICAST_STATE;
    {class} property CHANGE_WIFI_STATE: JString read _GetCHANGE_WIFI_STATE;
    {class} property CLEAR_APP_CACHE: JString read _GetCLEAR_APP_CACHE;
    {class} property CONTROL_LOCATION_UPDATES: JString read _GetCONTROL_LOCATION_UPDATES;
    {class} property DELETE_CACHE_FILES: JString read _GetDELETE_CACHE_FILES;
    {class} property DELETE_PACKAGES: JString read _GetDELETE_PACKAGES;
    {class} property DIAGNOSTIC: JString read _GetDIAGNOSTIC;
    {class} property DISABLE_KEYGUARD: JString read _GetDISABLE_KEYGUARD;
    {class} property DUMP: JString read _GetDUMP;
    {class} property EXPAND_STATUS_BAR: JString read _GetEXPAND_STATUS_BAR;
    {class} property FACTORY_TEST: JString read _GetFACTORY_TEST;
    {class} property GET_ACCOUNTS: JString read _GetGET_ACCOUNTS;
    {class} property GET_ACCOUNTS_PRIVILEGED: JString read _GetGET_ACCOUNTS_PRIVILEGED;
    {class} property GET_PACKAGE_SIZE: JString read _GetGET_PACKAGE_SIZE;
    {class} property GET_TASKS: JString read _GetGET_TASKS;
    {class} property GLOBAL_SEARCH: JString read _GetGLOBAL_SEARCH;
    {class} property INSTALL_LOCATION_PROVIDER: JString read _GetINSTALL_LOCATION_PROVIDER;
    {class} property INSTALL_PACKAGES: JString read _GetINSTALL_PACKAGES;
    {class} property INSTALL_SHORTCUT: JString read _GetINSTALL_SHORTCUT;
    {class} property INSTANT_APP_FOREGROUND_SERVICE: JString read _GetINSTANT_APP_FOREGROUND_SERVICE;
    {class} property INTERNET: JString read _GetINTERNET;
    {class} property KILL_BACKGROUND_PROCESSES: JString read _GetKILL_BACKGROUND_PROCESSES;
    {class} property LOCATION_HARDWARE: JString read _GetLOCATION_HARDWARE;
    {class} property MANAGE_DOCUMENTS: JString read _GetMANAGE_DOCUMENTS;
    {class} property MANAGE_OWN_CALLS: JString read _GetMANAGE_OWN_CALLS;
    {class} property MASTER_CLEAR: JString read _GetMASTER_CLEAR;
    {class} property MEDIA_CONTENT_CONTROL: JString read _GetMEDIA_CONTENT_CONTROL;
    {class} property MODIFY_AUDIO_SETTINGS: JString read _GetMODIFY_AUDIO_SETTINGS;
    {class} property MODIFY_PHONE_STATE: JString read _GetMODIFY_PHONE_STATE;
    {class} property MOUNT_FORMAT_FILESYSTEMS: JString read _GetMOUNT_FORMAT_FILESYSTEMS;
    {class} property MOUNT_UNMOUNT_FILESYSTEMS: JString read _GetMOUNT_UNMOUNT_FILESYSTEMS;
    {class} property NFC: JString read _GetNFC;
    {class} property PACKAGE_USAGE_STATS: JString read _GetPACKAGE_USAGE_STATS;
    {class} property PERSISTENT_ACTIVITY: JString read _GetPERSISTENT_ACTIVITY;
    {class} property PROCESS_OUTGOING_CALLS: JString read _GetPROCESS_OUTGOING_CALLS;
    {class} property READ_CALENDAR: JString read _GetREAD_CALENDAR;
    {class} property READ_CALL_LOG: JString read _GetREAD_CALL_LOG;
    {class} property READ_CONTACTS: JString read _GetREAD_CONTACTS;
    {class} property READ_EXTERNAL_STORAGE: JString read _GetREAD_EXTERNAL_STORAGE;
    {class} property READ_FRAME_BUFFER: JString read _GetREAD_FRAME_BUFFER;
    {class} property READ_INPUT_STATE: JString read _GetREAD_INPUT_STATE;
    {class} property READ_LOGS: JString read _GetREAD_LOGS;
    {class} property READ_PHONE_NUMBERS: JString read _GetREAD_PHONE_NUMBERS;
    {class} property READ_PHONE_STATE: JString read _GetREAD_PHONE_STATE;
    {class} property READ_SMS: JString read _GetREAD_SMS;
    {class} property READ_SYNC_SETTINGS: JString read _GetREAD_SYNC_SETTINGS;
    {class} property READ_SYNC_STATS: JString read _GetREAD_SYNC_STATS;
    {class} property READ_VOICEMAIL: JString read _GetREAD_VOICEMAIL;
    {class} property REBOOT: JString read _GetREBOOT;
    {class} property RECEIVE_BOOT_COMPLETED: JString read _GetRECEIVE_BOOT_COMPLETED;
    {class} property RECEIVE_MMS: JString read _GetRECEIVE_MMS;
    {class} property RECEIVE_SMS: JString read _GetRECEIVE_SMS;
    {class} property RECEIVE_WAP_PUSH: JString read _GetRECEIVE_WAP_PUSH;
    {class} property RECORD_AUDIO: JString read _GetRECORD_AUDIO;
    {class} property REORDER_TASKS: JString read _GetREORDER_TASKS;
    {class} property REQUEST_COMPANION_RUN_IN_BACKGROUND: JString read _GetREQUEST_COMPANION_RUN_IN_BACKGROUND;
    {class} property REQUEST_COMPANION_USE_DATA_IN_BACKGROUND: JString read _GetREQUEST_COMPANION_USE_DATA_IN_BACKGROUND;
    {class} property REQUEST_DELETE_PACKAGES: JString read _GetREQUEST_DELETE_PACKAGES;
    {class} property REQUEST_IGNORE_BATTERY_OPTIMIZATIONS: JString read _GetREQUEST_IGNORE_BATTERY_OPTIMIZATIONS;
    {class} property REQUEST_INSTALL_PACKAGES: JString read _GetREQUEST_INSTALL_PACKAGES;
    {class} property RESTART_PACKAGES: JString read _GetRESTART_PACKAGES;
    {class} property SEND_RESPOND_VIA_MESSAGE: JString read _GetSEND_RESPOND_VIA_MESSAGE;
    {class} property SEND_SMS: JString read _GetSEND_SMS;
    {class} property SET_ALARM: JString read _GetSET_ALARM;
    {class} property SET_ALWAYS_FINISH: JString read _GetSET_ALWAYS_FINISH;
    {class} property SET_ANIMATION_SCALE: JString read _GetSET_ANIMATION_SCALE;
    {class} property SET_DEBUG_APP: JString read _GetSET_DEBUG_APP;
    {class} property SET_PREFERRED_APPLICATIONS: JString read _GetSET_PREFERRED_APPLICATIONS;
    {class} property SET_PROCESS_LIMIT: JString read _GetSET_PROCESS_LIMIT;
    {class} property SET_TIME: JString read _GetSET_TIME;
    {class} property SET_TIME_ZONE: JString read _GetSET_TIME_ZONE;
    {class} property SET_WALLPAPER: JString read _GetSET_WALLPAPER;
    {class} property SET_WALLPAPER_HINTS: JString read _GetSET_WALLPAPER_HINTS;
    {class} property SIGNAL_PERSISTENT_PROCESSES: JString read _GetSIGNAL_PERSISTENT_PROCESSES;
    {class} property STATUS_BAR: JString read _GetSTATUS_BAR;
    {class} property SYSTEM_ALERT_WINDOW: JString read _GetSYSTEM_ALERT_WINDOW;
    {class} property TRANSMIT_IR: JString read _GetTRANSMIT_IR;
    {class} property UNINSTALL_SHORTCUT: JString read _GetUNINSTALL_SHORTCUT;
    {class} property UPDATE_DEVICE_STATS: JString read _GetUPDATE_DEVICE_STATS;
    {class} property USE_FINGERPRINT: JString read _GetUSE_FINGERPRINT;
    {class} property USE_SIP: JString read _GetUSE_SIP;
    {class} property VIBRATE: JString read _GetVIBRATE;
    {class} property WAKE_LOCK: JString read _GetWAKE_LOCK;
    {class} property WRITE_APN_SETTINGS: JString read _GetWRITE_APN_SETTINGS;
    {class} property WRITE_CALENDAR: JString read _GetWRITE_CALENDAR;
    {class} property WRITE_CALL_LOG: JString read _GetWRITE_CALL_LOG;
    {class} property WRITE_CONTACTS: JString read _GetWRITE_CONTACTS;
    {class} property WRITE_EXTERNAL_STORAGE: JString read _GetWRITE_EXTERNAL_STORAGE;
    {class} property WRITE_GSERVICES: JString read _GetWRITE_GSERVICES;
    {class} property WRITE_SECURE_SETTINGS: JString read _GetWRITE_SECURE_SETTINGS;
    {class} property WRITE_SETTINGS: JString read _GetWRITE_SETTINGS;
    {class} property WRITE_SYNC_SETTINGS: JString read _GetWRITE_SYNC_SETTINGS;
    {class} property WRITE_VOICEMAIL: JString read _GetWRITE_VOICEMAIL;
  end;

  [JavaSignature('android/Manifest$permission')]
  JManifest_permission = interface(JObject)
    ['{85A59978-A449-472E-BD22-F0674731D240}']
  end;
  TJManifest_permission = class(TJavaGenericImport<JManifest_permissionClass, JManifest_permission>) end;




// ===== Interface declarations =====

  JContextCompatClass = interface(JObjectClass)
    ['{17CBF90F-B907-448F-9BFE-07ABAD5919D0}']
    {class} function checkSelfPermission(context: JContext; permission: JString): Integer; cdecl;
    {class} function createDeviceProtectedStorageContext(context: JContext): JContext; cdecl;
    {class} function getCodeCacheDir(context: JContext): JFile; cdecl;
    {class} function getColor(context: JContext; id: Integer): Integer; cdecl;
    {class} function getColorStateList(context: JContext; id: Integer): JColorStateList; cdecl;
    {class} function getDataDir(context: JContext): JFile; cdecl;
    {class} function getDrawable(context: JContext; id: Integer): JDrawable; cdecl;
    {class} function getExternalCacheDirs(context: JContext): TJavaObjectArray<JFile>; cdecl;
    {class} function getExternalFilesDirs(context: JContext; type_: JString): TJavaObjectArray<JFile>; cdecl;
    {class} function getNoBackupFilesDir(context: JContext): JFile; cdecl;
    {class} function getObbDirs(context: JContext): TJavaObjectArray<JFile>; cdecl;
    {class} function isDeviceProtectedStorage(context: JContext): Boolean; cdecl;
    {class} function startActivities(context: JContext; intents: TJavaObjectArray<JIntent>): Boolean; cdecl; overload;
    {class} function startActivities(context: JContext; intents: TJavaObjectArray<JIntent>; options: JBundle): Boolean; cdecl; overload;
    {class} procedure startActivity(context: JContext; intent: JIntent; options: JBundle); cdecl;
    {class} procedure startForegroundService(context: JContext; intent: JIntent); cdecl;
  end;

  [JavaSignature('android/support/v4/content/ContextCompat')]
  JContextCompat = interface(JObject)
    ['{DA319CC4-B7F8-4702-B969-3137BE6260C9}']
  end;
  TJContextCompat = class(TJavaGenericImport<JContextCompatClass, JContextCompat>) end;




  JActivityCompatClass = interface(JContextCompatClass)
    ['{AF83EB83-0A07-45E4-A615-3E9F50EEC123}']
    {class} procedure finishAffinity(activity: JActivity); cdecl;
    {class} procedure finishAfterTransition(activity: JActivity); cdecl;
    {class} function getReferrer(activity: JActivity): Jnet_Uri; cdecl;
    {class} function invalidateOptionsMenu(activity: JActivity): Boolean; cdecl;
    {class} procedure postponeEnterTransition(activity: JActivity); cdecl;
    {class} procedure requestPermissions(activity: JActivity; permissions: TJavaObjectArray<JString>; requestCode: Integer); cdecl;
//    {class} procedure setEnterSharedElementCallback(activity: JActivity; callback: Japp_SharedElementCallback); cdecl;
//    {class} procedure setExitSharedElementCallback(activity: JActivity; callback: Japp_SharedElementCallback); cdecl;
    {class} function shouldShowRequestPermissionRationale(activity: JActivity; permission: JString): Boolean; cdecl;
    {class} procedure startActivityForResult(activity: JActivity; intent: JIntent; requestCode: Integer; options: JBundle); cdecl;
    {class} procedure startIntentSenderForResult(activity: JActivity; intent: JIntentSender; requestCode: Integer; fillInIntent: JIntent; flagsMask: Integer; flagsValues: Integer; extraFlags: Integer; options: JBundle); cdecl;
    {class} procedure startPostponedEnterTransition(activity: JActivity); cdecl;
  end;

  [JavaSignature('android/support/v4/app/ActivityCompat')]
  JActivityCompat = interface(JContextCompat)
    ['{7108F0BF-5819-4668-9D20-7165FCB5A871}']
  end;
  TJActivityCompat = class(TJavaGenericImport<JActivityCompatClass, JActivityCompat>) end;





  TPermissionStatus = (Granted, Denied, PermanentlyDenied);
  /// <summary>Callback type for when the system has processed our permission requests</summary>
  /// <remarks>For each requested permission in APermissions, there is
  /// a Boolean in AGrantResults indicating if the permission was granted.
  /// <para>This type is compatible with an event handler method.</para></remarks>
  TRequestPermissionsResultEvent = procedure(Sender: TObject; const APermissions: TArray<string>;
    const AGrantResults: TArray<TPermissionStatus>) of object;
  /// <summary>Callback type for when the system has processed our permission requests</summary>
  /// <remarks>For each requested permission in APermissions, there is
  /// a Boolean in AGrantResults indicating if the permission was granted.
  /// <para>This type is compatible with an anonymous procedure.</para></remarks>
  TRequestPermissionsResultProc = reference to procedure(const APermissions: TArray<string>;
    const AGrantResults: TArray<TPermissionStatus>);

  TDisplayRationaleEvent = procedure(Sender: TObject; const APermissions: TArray<string>; const APostRationaleProc: TProc) of object;
  TDisplayRationaleProc = reference to procedure(const APermissions: TArray<string>; const APostRationaleProc: TProc);


  TRequestPermissionsCallbackPair = Class
    RequestCode:Integer;
    Permissions: TArray<string>;
    Proc: TRequestPermissionsResultProc;
    Event: TRequestPermissionsResultEvent;
    constructor Create(const ARequestCode:Integer;
                        const APermissions: TArray<string>;
                        const AProc: TRequestPermissionsResultProc;
                        const AEvent: TRequestPermissionsResultEvent);
  end;
  TRequestPermissionsCallbackPairList=class(TBaseList)
  private
    function GetItem(Index: Integer): TRequestPermissionsCallbackPair;
  public
    property Items[Index:Integer]:TRequestPermissionsCallbackPair read GetItem;default;
  end;




  TDisplayRationaleCallbackPair = Class
    RequestCode:Integer;
    Permissions: TArray<string>;
    Proc: TDisplayRationaleProc;
    Event: TDisplayRationaleEvent;
    constructor Create(const ARequestCode:Integer;
                      const APermissions: TArray<string>;
                      const AProc: TDisplayRationaleProc;
                      const AEvent: TDisplayRationaleEvent);
  end;
  TDisplayRationaleCallbackPairList=class(TBaseList)
  private
    function GetItem(Index: Integer): TDisplayRationaleCallbackPair;
  public
    property Items[Index:Integer]:TDisplayRationaleCallbackPair read GetItem;default;
  end;





  TAndroidPermissionsService = class//(TPermissionsService)
  private
    FPermissionsRequestsAndCallbacks: TRequestPermissionsCallbackPairList;//TDictionary<Integer, TRequestPermissionsCallbackPair>;

    procedure DoRequestPermissions(const APermissions: TArray<string>; const ARequestCode: Integer);
    procedure DoRequestPermissionsCallback(const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair; const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);

    procedure InternalRequestPermissions(const APermissions: TArray<string>;
      const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair;
      const ADisplayRationaleCallbackPair: TDisplayRationaleCallbackPair
      );
    function CheckRequestPermissions(const ARequestCode: Integer;const APermissions: TArray<string>):Boolean;

    /// <summary>RTL messaging system listener</summary>
//    procedure HandlePermissionsRequest(const Sender: TObject; const AMessage: TMessage);
    /// <summary>Delphi representation of the Android onRequestPermissionsResult callback</summary>
    function OnPermissionsRequest(const ARequestCode: Integer; const APermissions: TJavaObjectArray<JString>;
      const AGrantResults: TJavaArray<Integer>):Boolean;

    /// <summary>Helper routine to get a unique request code</summary>
    function NextAvailableRequestCode: Integer;
  private
    //用定时器检测权限是否已经开启了
    FCheckTimer:TTimer;
    procedure DoCheckTimer(Sender:TObject);
  public
    constructor Create;
    destructor Destroy; override;
  public
    function IsPermissionGranted(const APermission: string): Boolean;
    function IsEveryPermissionGranted(const APermissions: TArray<string>): Boolean;

    procedure RequestPermissions(const APermissions: TArray<string>;
      const AOnRequestPermissionsResult: TRequestPermissionsResultEvent;
      AOnDisplayRationale: TDisplayRationaleEvent = nil);
      overload; //override;
    procedure RequestPermissions(const APermissions: TArray<string>;
      const AOnRequestPermissionsResult: TRequestPermissionsResultProc;
      AOnDisplayRationale: TDisplayRationaleProc = nil);
      overload; //override;
  end;





var
  PermissionsService:TAndroidPermissionsService;
  StartingRequestCode :Integer;//= 10000;
{$IFEND}
{$ENDIF}


implementation



{$IFDEF ANDROID}
{$IF RTLVersion=31}

{ TRequestPermissionsCallbackPair }

constructor TRequestPermissionsCallbackPair.Create(const ARequestCode:Integer;
  const APermissions: TArray<string>;const AProc: TRequestPermissionsResultProc;
  const AEvent: TRequestPermissionsResultEvent);
begin
  RequestCode:=ARequestCode;
  Permissions:=APermissions;
  Proc := AProc;
  Event := AEvent;
end;

{ TDisplayRationaleCallbackPair }

constructor TDisplayRationaleCallbackPair.Create(const ARequestCode:Integer;const APermissions: TArray<string>;const AProc: TDisplayRationaleProc; const AEvent: TDisplayRationaleEvent);
begin
  RequestCode:=ARequestCode;
  Permissions:=APermissions;
  Proc := AProc;
  Event := AEvent;
end;


{ TAndroidPermissionsService }

constructor TAndroidPermissionsService.Create;
begin
//  inherited Create;

  FCheckTimer:=TTimer.Create(nil);
  FCheckTimer.Interval:=5000;
  FCheckTimer.Enabled:=False;
  FCheckTimer.OnTimer:=DoCheckTimer;

  FPermissionsRequestsAndCallbacks := TRequestPermissionsCallbackPairList.Create;//TDictionary<Integer, TRequestPermissionsCallbackPair>.Create;


//  TMessageManager.DefaultManager.SubscribeToMessage(TPermissionsRequestResultMessage,
//    HandlePermissionsRequest);
end;

destructor TAndroidPermissionsService.Destroy;
begin
  FreeAndNil(FCheckTimer);

//  TMessageManager.DefaultManager.Unsubscribe(TPermissionsRequestResultMessage, HandlePermissionsRequest);

  FPermissionsRequestsAndCallbacks.Free;
  inherited Destroy;
end;

procedure TAndroidPermissionsService.DoRequestPermissions(const APermissions: TArray<string>;
  const ARequestCode: Integer);
var
  Permissions: TJavaObjectArray<JString>;
  I: Integer;
begin
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.DoRequestPermissions');


  Permissions := TJavaObjectArray<JString>.Create(Length(APermissions));
  for I := Low(APermissions) to High(APermissions) do
    Permissions[I] := StringToJString(APermissions[I]);
  // Using helper class from Android Support Library, so no OS version-checking required
  TJActivityCompat.JavaClass.RequestPermissions(TAndroidHelper.Activity, Permissions, ARequestCode);
end;

function TAndroidPermissionsService.IsPermissionGranted(const APermission: string): Boolean;
begin
  // Using helper class from Android Support Library, so no OS version checking required
  Result := TJContextCompat.JavaClass.checkSelfPermission(TAndroidHelper.Context,
    StringToJString(APermission)) = TJPackageManager.JavaClass.PERMISSION_GRANTED
end;

procedure TAndroidPermissionsService.DoCheckTimer(Sender:TObject);
var
//  AKey:Integer;
  I:Integer;
begin
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.DoCheckTimer Begin');


  Self.FCheckTimer.Enabled:=False;

//  for AKey in FPermissionsRequestsAndCallbacks.Keys do
  for I := FPermissionsRequestsAndCallbacks.Count-1 downto 0 do
  begin
  //    if CheckRequestPermissions(AKey,FPermissionsRequestsAndCallbacks.Items[AKey].Permissions) then
  //    if CheckRequestPermissions(FPermissionsRequestsAndCallbacks[I].RequestCode,FPermissionsRequestsAndCallbacks[I].Permissions) then
  //    begin
  //      Break;
  //    end;
      if CheckRequestPermissions(FPermissionsRequestsAndCallbacks[I].RequestCode,FPermissionsRequestsAndCallbacks[I].Permissions) then
      begin
          //权限项申请成功了,就不再检测
          FPermissionsRequestsAndCallbacks.Delete(I);
      end;


  end;

  Self.FCheckTimer.Enabled:=(FPermissionsRequestsAndCallbacks.Count>0);


  uBaseLog.HandleException(nil,'TAndroidPermissionsService.DoCheckTimer End');
end;

function TAndroidPermissionsService.IsEveryPermissionGranted(const APermissions: TArray<string>): Boolean;
var
  Permission: string;
begin
  Result := True;
  for Permission in APermissions do
    if not IsPermissionGranted(Permission) then
      Exit(False)
end;

procedure TAndroidPermissionsService.DoRequestPermissionsCallback(
  const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair;
  const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);
begin
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.DoRequestPermissionsCallback');


  // Call whichever callback (method or anonymous procedure) was passed in
  if Assigned(ARequestPermissionsCallbackPair.Proc) then
    ARequestPermissionsCallbackPair.Proc(APermissions, AGrantResults)
  else if Assigned(ARequestPermissionsCallbackPair.Event) then
    ARequestPermissionsCallbackPair.Event(Self, APermissions, AGrantResults)
end;

procedure TAndroidPermissionsService.InternalRequestPermissions(const APermissions: TArray<string>;
  const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair;
  const ADisplayRationaleCallbackPair: TDisplayRationaleCallbackPair);
var
  RequestCode, I, NextRationaleRequirementIndex: Integer;
  RequestedPermissionsNotAllGranted, ShowRationale: Boolean;
  GrantResults: TArray<TPermissionStatus>;
  Permissions: TArray<string>;
  PostRationale: TProc;
begin
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.InternalRequestPermissions Begin');



  // First, check which permissions are not currently granted
  SetLength(GrantResults, Length(APermissions));
  RequestedPermissionsNotAllGranted := False;
  for I := Low(GrantResults) to High(GrantResults) do
  begin
    if IsPermissionGranted(APermissions[I]) then
      GrantResults[I] := TPermissionStatus.Granted
    else
      GrantResults[I] := TPermissionStatus.Denied;
    if GrantResults[I] <> TPermissionStatus.Granted then
      RequestedPermissionsNotAllGranted := True;
  end;

  uBaseLog.HandleException(nil,'TAndroidPermissionsService.InternalRequestPermissions 2');


  // If we have any then act accordingly
  if RequestedPermissionsNotAllGranted then
  begin
        //有些权限没有被申请成功
        RequestCode := NextAvailableRequestCode;
        uBaseLog.HandleException(nil,'TAndroidPermissionsService.InternalRequestPermissions 3');
//        FPermissionsRequestsAndCallbacks.Add(RequestCode, ARequestPermissionsCallbackPair);

        ARequestPermissionsCallbackPair.RequestCode:=RequestCode;
        FPermissionsRequestsAndCallbacks.Add(ARequestPermissionsCallbackPair);
        uBaseLog.HandleException(nil,'TAndroidPermissionsService.InternalRequestPermissions 4');


        ShowRationale := False;

        // Permissions are not granted. Is there an explanation/rationale to show
        if Assigned(ADisplayRationaleCallbackPair.Proc) or Assigned(ADisplayRationaleCallbackPair.Event) then
        begin
              SetLength(Permissions, Length(APermissions));
              NextRationaleRequirementIndex := 0;
              // Iterate all the permissions and get any rationale strings that need displaying
              for I := Low(APermissions) to High(APermissions) do
              begin
                // References to the Activity won't work in a service where it's nil and will
                // throw an exception if read there, so we check the DelphiActivity symbol first
                if DelphiActivity <> nil then
                begin
                  if TJActivityCompat.JavaClass.shouldShowRequestPermissionRationale(
                       TAndroidHelper.Activity, StringToJString(APermissions[I])) then
                  begin
                    Permissions[NextRationaleRequirementIndex] := APermissions[I];
                    ShowRationale := True;
                    Inc(NextRationaleRequirementIndex);
                  end;
                end;
              end;
              SetLength(Permissions, NextRationaleRequirementIndex);
        end;


        if ShowRationale then
        begin
            PostRationale := procedure
            begin
              DoRequestPermissions(APermissions, RequestCode)
            end;
            // Call whichever rationale display callback has been passed in.
            // This should show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
            // After the user sees the explanation, try again to request the permission.
            if Assigned(ADisplayRationaleCallbackPair.Proc) then
              ADisplayRationaleCallbackPair.Proc(Permissions, PostRationale)
            else if Assigned(ADisplayRationaleCallbackPair.Event) then
              ADisplayRationaleCallbackPair.Event(Self, Permissions, PostRationale)
        end
        else
        begin
            DoRequestPermissions(APermissions, RequestCode);
        end;


        Self.FCheckTimer.Enabled:=True;

  end
  else // Permissions already granted
  begin
      //权限已经申请了
      DoRequestPermissionsCallback(ARequestPermissionsCallbackPair, APermissions, GrantResults);
  end;


  uBaseLog.HandleException(nil,'TAndroidPermissionsService.InternalRequestPermissions End');
end;

function TAndroidPermissionsService.CheckRequestPermissions(const ARequestCode: Integer;
  const APermissions: TArray<string>):Boolean;
var
  RequestCode, I, NextRationaleRequirementIndex: Integer;
  RequestedPermissionsNotAllGranted, ShowRationale: Boolean;
  GrantResults: TArray<TPermissionStatus>;
//  BPermissions: TArray<JString>;
//  PostRationale: TProc;
  BPermissions:TJavaObjectArray<JString>;
  BGrantResults: TJavaArray<Integer>;
begin
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.CheckRequestPermissions Begin');
  Result:=False;

  try

      // First, check which permissions are not currently granted
      SetLength(GrantResults, Length(APermissions));
      RequestedPermissionsNotAllGranted := False;
      for I := Low(GrantResults) to High(GrantResults) do
      begin
        if IsPermissionGranted(APermissions[I]) then
          GrantResults[I] := TPermissionStatus.Granted
        else
          GrantResults[I] := TPermissionStatus.Denied;
        if GrantResults[I] <> TPermissionStatus.Granted then
          RequestedPermissionsNotAllGranted := True;
      end;


      BPermissions := TJavaObjectArray<JString>.Create(Length(APermissions));
      for I := Low(APermissions) to High(APermissions) do
        BPermissions[I] := StringToJString(APermissions[I]);


      BGrantResults := TJavaArray<Integer>.Create(Length(APermissions));
      for I := Low(APermissions) to High(APermissions) do
        BGrantResults[I] := Ord(GrantResults[I]);




      // If we have any then act accordingly
      if not RequestedPermissionsNotAllGranted then
      begin

        uBaseLog.HandleException(nil,'TAndroidPermissionsService.CheckRequestPermissions RequestedPermissions AllGranted');
        //权限已经申请了
        Result:=OnPermissionsRequest(ARequestCode, BPermissions, BGrantResults);
      end;

  except
    on E:Exception do
    begin
      uBaseLog.HandleException(E,'TAndroidPermissionsService.CheckRequestPermissions');
    end;
  end;


  uBaseLog.HandleException(nil,'TAndroidPermissionsService.CheckRequestPermissions End');
end;

procedure TAndroidPermissionsService.RequestPermissions(const APermissions: TArray<string>;
  const AOnRequestPermissionsResult: TRequestPermissionsResultEvent;
  AOnDisplayRationale: TDisplayRationaleEvent);
begin
  if Length(APermissions)=0 then Exit;

  InternalRequestPermissions(APermissions,
                              TRequestPermissionsCallbackPair.Create(0,APermissions,nil, AOnRequestPermissionsResult),
                              TDisplayRationaleCallbackPair.Create(0,APermissions,nil, AOnDisplayRationale)
                              );
end;

procedure TAndroidPermissionsService.RequestPermissions(const APermissions: TArray<string>;
  const AOnRequestPermissionsResult: TRequestPermissionsResultProc;
  AOnDisplayRationale: TDisplayRationaleProc);
begin
  if Length(APermissions)=0 then Exit;

  InternalRequestPermissions(APermissions,
                    TRequestPermissionsCallbackPair.Create(0,APermissions,AOnRequestPermissionsResult, nil),
                    TDisplayRationaleCallbackPair.Create(0,APermissions,AOnDisplayRationale, nil)
                    );
end;

//procedure TAndroidPermissionsService.HandlePermissionsRequest(const Sender: TObject; const AMessage: TMessage);
//var
//  MessageData: TPermissionsRequestResultData;
//  RequestCode: Integer;
//  Permissions: TJavaObjectArray<JString>;
//  GrantResults: TJavaArray<Integer>;
//begin
//  if AMessage is TPermissionsRequestResultMessage then
//  begin
//    MessageData := TPermissionsRequestResultMessage(AMessage).Value;
//    RequestCode := MessageData.RequestCode;
//    Permissions := MessageData.Permissions;
//    GrantResults := MessageData.GrantResults;
//    OnPermissionsRequest(RequestCode, Permissions, GrantResults);
//  end;
//end;

function TAndroidPermissionsService.NextAvailableRequestCode: Integer;
//const
//  StartingRequestCode = 10000;
//var
//  CallbackPair: TRequestPermissionsCallbackPair;
begin
  Result := StartingRequestCode;
  // Loop until we encounter an unused request code
//  while FPermissionsRequestsAndCallbacks.TryGetValue(Result, CallbackPair) do
    Inc(StartingRequestCode,1)
end;

function TAndroidPermissionsService.OnPermissionsRequest(const ARequestCode: Integer;
  const APermissions: TJavaObjectArray<JString>;
  const AGrantResults: TJavaArray<Integer>):Boolean;
var
  CallbackPair: TRequestPermissionsCallbackPair;
  Permissions: TArray<string>;
  GrantResults: TArray<TPermissionStatus>;
  NumPermissions: Integer;
  I: Integer;
begin
  Result:=False;
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.OnPermissionsRequest Begin');


  // Look up the request code in FPermissionsRequestsAndCallbacks CallbackPair to get the user callback to call
//  if FPermissionsRequestsAndCallbacks.TryGetValue(ARequestCode, CallbackPair) then
  CallbackPair:=nil;
  for I := 0 to FPermissionsRequestsAndCallbacks.Count-1 do
  begin
    if FPermissionsRequestsAndCallbacks[I].RequestCode=ARequestCode then
    begin
      CallbackPair:=FPermissionsRequestsAndCallbacks[I];
      Break;
    end;
  end;


  if CallbackPair<>nil then
  begin
      NumPermissions := APermissions.Length;
      // This callback appears to be called twice, once with empty arrays and then with populated arrays
      if (NumPermissions > 0) and (NumPermissions = AGrantResults.Length) then
      begin
          SetLength(Permissions, NumPermissions);
          SetLength(GrantResults, NumPermissions);
          for I := 0 to Pred(NumPermissions) do
          begin
            Permissions[I] := JStringToString(APermissions[I]);

            if AGrantResults[I] = TJPackageManager.JavaClass.PERMISSION_GRANTED then
              GrantResults[I] := TPermissionStatus.Granted
            else if TJActivityCompat.JavaClass.shouldShowRequestPermissionRationale(
                      TAndroidHelper.Activity, APermissions[I]) then
              GrantResults[I] := TPermissionStatus.Denied
            else
              GrantResults[I] := TPermissionStatus.PermanentlyDenied;
          end;


          try
            DoRequestPermissionsCallback(CallbackPair, Permissions, GrantResults);
          finally
            // Tidy up the resources logged against this request code
//            FPermissionsRequestsAndCallbacks.Remove(ARequestCode);
          end;

          //处理完成
          Result:=True;
      end;
  end;


  uBaseLog.HandleException(nil,'TAndroidPermissionsService.OnPermissionsRequest End');
end;





{ TRequestPermissionsCallbackPairList }

function TRequestPermissionsCallbackPairList.GetItem(
  Index: Integer): TRequestPermissionsCallbackPair;
begin
  Result:=TRequestPermissionsCallbackPair(Inherited Items[Index]);
end;

{ TDisplayRationaleCallbackPairList }

function TDisplayRationaleCallbackPairList.GetItem(
  Index: Integer): TDisplayRationaleCallbackPair;
begin
  Result:=TDisplayRationaleCallbackPair(Inherited Items[Index]);
end;
{$ENDIF}
{$ENDIF}



initialization


  {$IFDEF ANDROID}
  {$IF RTLVersion=31}
  StartingRequestCode := 10000;
  PermissionsService:=TAndroidPermissionsService.Create;
  {$ENDIF}
  {$ENDIF}



finalization

  {$IFDEF ANDROID}
  {$IF RTLVersion=31}
  FreeAndNil(PermissionsService);
  {$ENDIF}
  {$ENDIF}



end.
