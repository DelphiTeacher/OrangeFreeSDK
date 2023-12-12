////
////  PTLog.h
////  PrinterSDK
////
////  Created by ios on 2021/11/13.
////  Copyright ? 2021 Mellow. All rights reserved.
////

unit iOSApi.PTLog;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	
	//NS_ASSUME_NONNULL_BEGIN
	
	//#define PTLOG(text) [[PTLog shareInstance] writeFile:text];
//	 const PTLOG(text)=[[PTLog shareInstance] writeFile:text];; //#define PTLOG(text) [[PTLog shareInstance] writeFile:text];

	//@interface PTLog : NSObject
	//@interface PTLog : NSObject
	PTLog=interface(NSObject)//
	['{5387AA50-66D0-4C2A-B06F-BDD7D33E409D}']
		
		//{*
		// *  \~chinese
		// *
		// *  默认false,不写入数据  要写入日志，先将设置为true
		// *
		// *  \~english
		// *
		// *  The default is false, no data is written. To write to the log, first set it to true
		// *
		// }
		//@property (nonatomic, assign) BOOL isWrite;
		function isWrite:Boolean;cdecl;
		procedure setIsWrite(isWrite:Boolean);cdecl;
		
		
		//{*
		// *  \~chinese
		// *
		// *  写入Log日志,文件在沙盒Docuemnts/pt_log
		// *
		// *  @param file 日志
		// *
		// *  \~english
		// *
		// *  Write to Log, Docuemnts/pt_log
		// *
		// *  @param file log
		// *
		// }
		//- (void)writeFile:(NSString *)file;
		procedure writeFile(afile:NSString);cdecl;
		
		
		/////< \~chinese 读取日志文件 \~english Read log file
		//- (NSString *)readFile;
		function readFile:NSString;cdecl;
		
		
		/////< \~chinese 删除日志文件，如果返回false，一般是文件已经不存在 \~english Delete log file
		//- (BOOL)removeFile;
		function removeFile:Boolean;cdecl;
		
		
	end;
	
	PTLogClass=interface(NSObjectClass)//
	['{9976D824-C478-45D1-8D74-68E66EAD4175}']
		//+ (PTLog *)shareInstance;
		function shareInstance:PTLog;cdecl;
		
	end;
	
	TPTLog=class(TOCGenericImport<PTLogClass,PTLog>)
	end;
	
	
	
	
	
	//NS_ASSUME_NONNULL_END
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTLog_FakeLoader : PTLog; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTLog';
{$O+}



{$ENDIF}

end.

