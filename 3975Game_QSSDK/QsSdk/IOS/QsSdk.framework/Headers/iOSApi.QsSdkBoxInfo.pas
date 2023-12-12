unit iOSApi.QsSdkBoxInfo;

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

	
	
	//@interface QsSdkBoxInfo : NSObject
	//@interface QsSdkBoxInfo : NSObject
	QsSdkBoxInfo=interface(NSObject)//
	['{9E86634C-5152-46C3-ACE3-50D7E6A096DB}']
		
		//@property (nonatomic, strong) NSString *mainUserIdQsSdk;       //主帐号id
		function mainUserIdQsSdk:NSString;cdecl;//主帐号id
		procedure setMainUserIdQsSdk(mainUserIdQsSdk:NSString);cdecl;//主帐号id
		//@property (nonatomic, strong) NSString *finalUserIdQsSdk;      //子帐号id
		function finalUserIdQsSdk:NSString;cdecl;//子帐号id
		procedure setFinalUserIdQsSdk(finalUserIdQsSdk:NSString);cdecl;//子帐号id
		//@property (nonatomic, strong) NSString *tokenQsSdk;            //token
		function tokenQsSdk:NSString;cdecl;//token
		procedure setTokenQsSdk(tokenQsSdk:NSString);cdecl;//token
		////@property (nonatomic, strong) NSString *promoteIdQsSdk;        //推广员id
		//@property (nonatomic, strong) NSString *packageIdQsSdk;        //包id
		function packageIdQsSdk:NSString;cdecl;//包id
		procedure setPackageIdQsSdk(packageIdQsSdk:NSString);cdecl;//包id
		//@property (nonatomic, strong) NSString *appIdQsSdk;            //应用id
		function appIdQsSdk:NSString;cdecl;//应用id
		procedure setAppIdQsSdk(appIdQsSdk:NSString);cdecl;//应用id
		//@property (nonatomic, strong) NSString *appSecretQsSdk;        //应用密钥
		function appSecretQsSdk:NSString;cdecl;//应用密钥
		procedure setAppSecretQsSdk(appSecretQsSdk:NSString);cdecl;//应用密钥
		//@property (nonatomic) BOOL isLandscapeQsSdk;                   //应用是否横屏
		function isLandscapeQsSdk:Boolean;cdecl;//应用是否横屏
		procedure setIsLandscapeQsSdk(isLandscapeQsSdk:Boolean);cdecl;//应用是否横屏
		//@property (nonatomic) BOOL releaseModeQsSdk;                    //是否正式环境
		function releaseModeQsSdk:Boolean;cdecl;//是否正式环境
		procedure setReleaseModeQsSdk(releaseModeQsSdk:Boolean);cdecl;//是否正式环境
		//@property (nonatomic) NSString *urlTypeQsSdk;                   //域名类型：千年传"0"， 传奇传"1"
		function urlTypeQsSdk:NSString;cdecl;//域名类型：千年传"0"， 传奇传"1"
		procedure setUrlTypeQsSdk(urlTypeQsSdk:NSString);cdecl;//域名类型：千年传"0"， 传奇传"1"
		
		
	end;
	
	QsSdkBoxInfoClass=interface(NSObjectClass)//
	['{5FA62A63-6AC6-4546-9C51-D59DFA3E34BB}']
	end;
	
	TQsSdkBoxInfo=class(TOCGenericImport<QsSdkBoxInfoClass,QsSdkBoxInfo>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QsSdkBoxInfo_FakeLoader : QsSdkBoxInfo; cdecl; external {$I FrameworkDylibPath_QsSdk.inc} name 'OBJC_CLASS_$_QsSdkBoxInfo';
{$O+}



{$ENDIF}

end.

