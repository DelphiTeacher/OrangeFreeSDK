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
		
		//@property (nonatomic, strong) NSString *mainUserIdQsSdk;       //���ʺ�id
		function mainUserIdQsSdk:NSString;cdecl;//���ʺ�id
		procedure setMainUserIdQsSdk(mainUserIdQsSdk:NSString);cdecl;//���ʺ�id
		//@property (nonatomic, strong) NSString *finalUserIdQsSdk;      //���ʺ�id
		function finalUserIdQsSdk:NSString;cdecl;//���ʺ�id
		procedure setFinalUserIdQsSdk(finalUserIdQsSdk:NSString);cdecl;//���ʺ�id
		//@property (nonatomic, strong) NSString *tokenQsSdk;            //token
		function tokenQsSdk:NSString;cdecl;//token
		procedure setTokenQsSdk(tokenQsSdk:NSString);cdecl;//token
		////@property (nonatomic, strong) NSString *promoteIdQsSdk;        //�ƹ�Աid
		//@property (nonatomic, strong) NSString *packageIdQsSdk;        //��id
		function packageIdQsSdk:NSString;cdecl;//��id
		procedure setPackageIdQsSdk(packageIdQsSdk:NSString);cdecl;//��id
		//@property (nonatomic, strong) NSString *appIdQsSdk;            //Ӧ��id
		function appIdQsSdk:NSString;cdecl;//Ӧ��id
		procedure setAppIdQsSdk(appIdQsSdk:NSString);cdecl;//Ӧ��id
		//@property (nonatomic, strong) NSString *appSecretQsSdk;        //Ӧ����Կ
		function appSecretQsSdk:NSString;cdecl;//Ӧ����Կ
		procedure setAppSecretQsSdk(appSecretQsSdk:NSString);cdecl;//Ӧ����Կ
		//@property (nonatomic) BOOL isLandscapeQsSdk;                   //Ӧ���Ƿ����
		function isLandscapeQsSdk:Boolean;cdecl;//Ӧ���Ƿ����
		procedure setIsLandscapeQsSdk(isLandscapeQsSdk:Boolean);cdecl;//Ӧ���Ƿ����
		//@property (nonatomic) BOOL releaseModeQsSdk;                    //�Ƿ���ʽ����
		function releaseModeQsSdk:Boolean;cdecl;//�Ƿ���ʽ����
		procedure setReleaseModeQsSdk(releaseModeQsSdk:Boolean);cdecl;//�Ƿ���ʽ����
		//@property (nonatomic) NSString *urlTypeQsSdk;                   //�������ͣ�ǧ�괫"0"�� ���洫"1"
		function urlTypeQsSdk:NSString;cdecl;//�������ͣ�ǧ�괫"0"�� ���洫"1"
		procedure setUrlTypeQsSdk(urlTypeQsSdk:NSString);cdecl;//�������ͣ�ǧ�괫"0"�� ���洫"1"
		
		
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

