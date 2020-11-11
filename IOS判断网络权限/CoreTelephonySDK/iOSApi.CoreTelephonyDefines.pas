unit iOSApi.CoreTelephonyDefines;

interface

{$IFDEF IOS}
uses
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	//{
	// *  CoreTelephonyDefines.h
	// *  CFTelephony
	// *
	// *  Copyright 2010 Apple Inc. All rights reserved.
	// *
	// }
	
	//// Macros to export a symbol from the CoreTelephony library
	////#ifndef __CORETELEPHONY_DEFINES_H__
	
	////#ifdef __cplusplus
	//#define CORETELEPHONY_EXTERN   extern "C" __attribute__((visibility ("default")))
	 const CORETELEPHONY_EXTERN=(visibility ("default"; //#define CORETELEPHONY_EXTERN   extern "C" __attribute__((visibility ("default")))
	////#else
	//#define CORETELEPHONY_EXTERN   extern __attribute__((visibility ("default")))
	 const CORETELEPHONY_EXTERN=(visibility ("default"; //#define CORETELEPHONY_EXTERN   extern __attribute__((visibility ("default")))
	////#endif
	
	//#define	CORETELEPHONY_EXTERN_CLASS	__attribute__((visibility("default")))
	//#define CORETELEPHONY_CLASS_AVAILABLE(_iphoneIntro) __attribute__((visibility("default"))) NS_CLASS_AVAILABLE(NA, _iphoneIntro)
	//#define CORETELEPHONY_CLASS_DEPRECATED(_introOS, _deprecatedOS, _msg) __attribute__((visibility("default"))) NS_CLASS_DEPRECATED_IOS(_introOS, _deprecatedOS, _msg)
	
	//#include <CoreFoundation/CoreFoundation.h>	// need this for SInt32
	
	//enum {
	//	kCTErrorDomainNoError	= 0,
	//	kCTErrorDomainPOSIX		= 1,	/* POSIX error listed in sys/errno.h */
	//	kCTErrorDomainMach				/* mach error listed in mach/error.h */
	//};
	 //#define	CORETELEPHONY_EXTERN_CLASS	__attribute__((visibility("default"))) #define CORETELEPHONY_CLASS_AVAILABLE(_iphoneIntro) __attribute__((visibility("default"))) NS_CLASS_AVAILABLE(NA, _iphoneIntro) #define CORETELEPHONY_CLASS_DEPRECATED(_introOS, _deprecatedOS, _msg) __attribute__((visibility("default"))) NS_CLASS_DEPRECATED_IOS(_introOS, _deprecatedOS, _msg)  #include <CoreFoundation/CoreFoundation.h>	  enum { 	kCTErrorDomainNoError	= 0, 	kCTErrorDomainPOSIX		= 1,	 	kCTErrorDomainMach				 };
	{} function #define CORETELEPHONY_CLASS_AVAILABLE(__attribute__((visibility("default")):iphoneIntro)):#define	CORETELEPHONY_EXTERN_CLASS	__attribute__visibility"default";cdecl;
	
	//typedef struct {
	//	SInt32 domain;
	//	SInt32 error;
	//} CTError;
	//typedef struct {
	CTError=record
		//	SInt32 domain;
		//	SInt32 error;
	end;
	PCTError=^CTError;
	CTErrorArray=array of CTError;
	PCTErrorArray=^CTErrorArray;
	
	
	
	
	//		
	////#endif
{$ENDIF}

implementation

{$IFDEF IOS}
{} function #define CORETELEPHONY_CLASS_AVAILABLE(__attribute__((visibility("default")):iphoneIntro)):#define	CORETELEPHONY_EXTERN_CLASS	__attribute__visibility"default";cdecl;external {$I FrameworkDylibPath_CoreTelephony.inc} name _PU + '#define CORETELEPHONY_CLASS_AVAILABLE'

{$O-}
{$O+}



{$ENDIF}

end.

