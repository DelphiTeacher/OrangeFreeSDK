unit iOSApi.QsSdkDef;

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
	//#define QsSdkVersion @"1.0.1"
	 const QsSdkVersion='1.0.1'; //#define QsSdkVersion @"1.0.1"

type
	//declare pointer
	id=Pointer;
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID

	

	TInitQsSdkSuccessEvent=procedure () of object;
	//typedef void (^InitQsSdkSuccess)(void);

	//typedef void (^InitQsSdkSuccess)(void);
	TInitQsSdkFailEvent=procedure (code:NSString;msg:NSString) of object;
	//typedef void (^InitQsSdkFail)(NSString *code, NSString *msg);

	//typedef void (^InitQsSdkFail)(NSString *code, NSString *msg);
	TLoginQsSdkSuccessEvent=procedure (userId:NSString;token:NSString) of object;
	//typedef void (^LoginQsSdkSuccess)(NSString *userId, NSString *token);

	//typedef void (^LoginQsSdkSuccess)(NSString *userId, NSString *token);
	TLoginQsSdkFailEvent=procedure (code:NSString;msg:NSString) of object;
	//typedef void (^LoginQsSdkFail)(NSString *code, NSString *msg);

	//typedef void (^LoginQsSdkFail)(NSString *code, NSString *msg);
	TLogoutQsSdkSuccessEvent=procedure () of object;
	//typedef void (^LogoutQsSdkSuccess)(void);

	//typedef void (^LogoutQsSdkSuccess)(void);
	TPayQsSdkSuccessEvent=procedure (orderId:NSString) of object;
	//typedef void (^PayQsSdkSuccess)(NSString *orderId);

	//typedef void (^PayQsSdkSuccess)(NSString *orderId);
	TPayQsSdkFailEvent=procedure (code:NSString;msg:NSString) of object;
	//typedef void (^PayQsSdkFail)(NSString *code, NSString *msg);

	//typedef void (^PayQsSdkFail)(NSString *code, NSString *msg);
	TUploadRoleInfoQsSdkSuccessEvent=procedure () of object;
	//typedef void (^UploadRoleInfoQsSdkSuccess)(void);

	//typedef void (^UploadRoleInfoQsSdkSuccess)(void);
	TUploadRoleInfoQsSdkFailEvent=procedure (code:NSString;msg:NSString) of object;
	//typedef void (^UploadRoleInfoQsSdkFail)(NSString *code, NSString *msg);

	//typedef void (^UploadRoleInfoQsSdkFail)(NSString *code, NSString *msg);
	
	
	TQsSdkCommonCbEvent=procedure () of object;
	//typedef void (^QsSdkCommonCb)(void);

	//typedef void (^QsSdkCommonCb)(void);
	TQsSdkStrCommonCbEvent=procedure (msg:NSString) of object;
	//typedef void (^QsSdkStrCommonCb)(NSString *msg);

	//typedef void (^QsSdkStrCommonCb)(NSString *msg);
	TQsSdkDicCommonCbEvent=procedure (dic:PNSDictionary) of object;
	//typedef void (^QsSdkDicCommonCb)(NSDictionary *dic);

	//typedef void (^QsSdkDicCommonCb)(NSDictionary *dic);
	TQsSdkStrCbEvent=procedure (code:NSString;msg:NSString;ext:NSString) of object;
	//typedef void (^QsSdkStrCb)(NSString *code, NSString *msg, NSString *ext);

	//typedef void (^QsSdkStrCb)(NSString *code, NSString *msg, NSString *ext);
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
{$O+}



{$ENDIF}

end.

