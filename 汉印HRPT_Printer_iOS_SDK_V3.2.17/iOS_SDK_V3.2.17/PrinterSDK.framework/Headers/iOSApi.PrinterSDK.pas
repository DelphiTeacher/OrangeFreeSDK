

////#if TARGET_OS_IOS
unit iOSApi.PrinterSDK;

interface

{$IFDEF IOS}
uses
	//#import <UIKit/UIKit.h>
	iOSapi.UIKit,
	//#import <Cocoa/Cocoa.h>
//	iOSapi.Cocoa,
	//#import <Foundation/NSObjCRuntime.h>
//	iOSapi.NSObjCRuntime,
	//#import <PrinterSDK/PTCommandESC.h>
	iOSapi.PTCommandESC,
	//#import <PrinterSDK/PTCommandTSPL.h>
	iOSapi.PTCommandTSPL,
	//#import <PrinterSDK/PTCommandZPL.h>
	iOSapi.PTCommandZPL,
	//#import <PrinterSDK/PTCommandCPCL.h>
	iOSapi.PTCommandCPCL,
	//#import <PrinterSDK/PTLabel.h>
	iOSapi.PTLabel,
	//#import <PrinterSDK/PTCommandCommon.h>
	iOSapi.PTCommandCommon,
	//#import <PrinterSDK/PTOldCommandCPCL.h>
	iOSapi.PTOldCommandCPCL,
	//#import <PrinterSDK/PTOldCommandTSPL.h>
	iOSapi.PTOldCommandTSPL,
	//#import <PrinterSDK/PTEncode.h>
	iOSapi.PTEncode,
	//#import <PrinterSDK/PTBitmapManager.h>
	iOSapi.PTBitmapManager,
	//#import <PrinterSDK/PTDispatcher.h>
	iOSapi.PTDispatcher,
	//#import <PrinterSDK/PTPrinter.h>
	iOSapi.PTPrinter,
	//#import <PrinterSDK/PTEnumList.h>
	iOSapi.PTEnumList,
	//#import <PrinterSDK/PTLog.h>
	iOSapi.PTLog,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	////#elif TARGET_OS_MAC
	////#endif
	
	
	////! Project version number for PrinterSDK.
	//FOUNDATION_EXPORT double PrinterSDKVersionNumber;
	
	////! Project version string for PrinterSDK.
	//FOUNDATION_EXPORT const unsigned char PrinterSDKVersionString[];
//	char PrinterSDKVersionString[]=unsigned;

	//// In this header, you should import all the public headers of your framework using statements like #import <PrinterSDK/PublicHeader.h>
	
	///*! *\~chinese ESCָ�� *\~english ESC command */
	
	///*! *\~chinese TSPLָ�� *\~english TSPL command */
	
	///*! *\~chinese ZPLָ�� *\~english ZPL command */
	
	///*! *\~chinese CPCLָ�� *\~english CPCL command */
	
	
	///*! *\~chinese ͼƬ���� *\~english image manager */
	
	///*! *\~chinese ͨѶ *\~english Communication */
	
	
	///*! *\~chinese ��־ *\~english Log */
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
{$O+}



{$ENDIF}

end.

