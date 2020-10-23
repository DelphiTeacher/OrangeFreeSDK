////
////  SGQRCodeObtainConfigure.h
////  SGQRCodeExample
////
////  Created by kingsic on 2018/7/29.
////  Copyright ? 2018�� kingsic. All rights reserved.
////

unit iOSApi.SGQRCodeObtainConfigure;

interface

{$IFDEF IOS}
uses
	//#import <UIKit/UIKit.h>
	iOSapi.UIKit,
	//#import <AVFoundation/AVFoundation.h>
	iOSapi.AVFoundation,
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

	
	//@interface SGQRCodeObtainConfigure : NSObject
	//@interface SGQRCodeObtainConfigure : NSObject
	SGQRCodeObtainConfigure=interface(NSObject)//
	['{91D4F7D4-46EF-4E51-BBA3-AE5073ED734C}']
		///** �෽������ */
		
		///** �ỰԤ�ã�Ĭ��Ϊ��AVCaptureSessionPreset1920x1080 */
		//@property (nonatomic, copy) NSString *sessionPreset;
		function sessionPreset:NSString;cdecl;
		procedure setSessionPreset(sessionPreset:NSString);cdecl;
		///** Ԫ�������ͣ�Ĭ��Ϊ��AVMetadataObjectTypeQRCode */
		//@property (nonatomic, strong) NSArray *metadataObjectTypes;
		function metadataObjectTypes:NSArray;cdecl;
		procedure setMetadataObjectTypes(metadataObjectTypes:NSArray);cdecl;
		///** ɨ�跶Χ��Ĭ��������ͼ��ÿһ��ȡֵ 0 �� 1������Ļ���Ͻ�Ϊ����ԭ�㣩*/
		//@property (nonatomic, assign) CGRect rectOfInterest;
		function rectOfInterest:CGRect;cdecl;
		procedure setRectOfInterest(rectOfInterest:CGRect);cdecl;
		///** �Ƿ���Ҫ���������������ǿ������Ĭ��Ϊ��NO */
		//@property (nonatomic, assign) BOOL sampleBufferDelegate;
		function sampleBufferDelegate:Boolean;cdecl;
		procedure setSampleBufferDelegate(sampleBufferDelegate:Boolean);cdecl;
		///** ��ӡ��Ϣ��Ĭ��Ϊ��NO */
		//@property (nonatomic, assign) BOOL openLog;
		function openLog:Boolean;cdecl;
		procedure setOpenLog(openLog:Boolean);cdecl;
		
	end;
	
	SGQRCodeObtainConfigureClass=interface(NSObjectClass)//
	['{844BDBDE-A477-421C-8436-B53622D21219}']
		//+ (instancetype)QRCodeObtainConfigure;
		function QRCodeObtainConfigure:SGQRCodeObtainConfigure;cdecl;
		
	end;
	
	TSGQRCodeObtainConfigure=class(TOCGenericImport<SGQRCodeObtainConfigureClass,SGQRCodeObtainConfigure>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function SGQRCodeObtainConfigure_FakeLoader : SGQRCodeObtainConfigure; cdecl; external {$I FrameworkDylibPath_SGQRCode.inc} name 'OBJC_CLASS_$_SGQRCodeObtainConfigure';
{$O+}



{$ENDIF}

end.

