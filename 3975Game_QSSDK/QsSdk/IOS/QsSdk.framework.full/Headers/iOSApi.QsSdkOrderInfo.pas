unit iOSApi.QsSdkOrderInfo;

interface

{$IFDEF IOS}
uses
	//#import <QsSdk/QsSdkRoleInfo.h>
	iOSapi.QsSdkRoleInfo,
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

	
	//@interface QsSdkOrderInfo : NSObject
	//@interface QsSdkOrderInfo : NSObject
	QsSdkOrderInfo=interface(NSObject)//
	['{95804FA9-F00C-44F0-ADC9-B70D2871EFCD}']
		
		//@property (nonatomic, strong) NSString *cpOrderIdQsSdk;     //CP������
		function cpOrderIdQsSdk:NSString;cdecl;//CP������
		procedure setCpOrderIdQsSdk(cpOrderIdQsSdk:NSString);cdecl;//CP������
		//@property (nonatomic, strong) NSString *productNameQsSdk;   //��Ʒ����
		function productNameQsSdk:NSString;cdecl;//��Ʒ����
		procedure setProductNameQsSdk(productNameQsSdk:NSString);cdecl;//��Ʒ����
		//@property (nonatomic, strong) NSString *productDescQsSdk;   //��Ʒ����
		function productDescQsSdk:NSString;cdecl;//��Ʒ����
		procedure setProductDescQsSdk(productDescQsSdk:NSString);cdecl;//��Ʒ����
		//@property (nonatomic, strong) NSString *productIdQsSdk;     //��Ʒid
		function productIdQsSdk:NSString;cdecl;//��Ʒid
		procedure setProductIdQsSdk(productIdQsSdk:NSString);cdecl;//��Ʒid
		//@property (nonatomic, strong) NSString *productPriceQsSdk;  //��Ʒ�۸񣬵�λԪ
		function productPriceQsSdk:NSString;cdecl;//��Ʒ�۸񣬵�λԪ
		procedure setProductPriceQsSdk(productPriceQsSdk:NSString);cdecl;//��Ʒ�۸񣬵�λԪ
		//@property (nonatomic, strong) NSString *extraQsSdk;         //��չ����
		function extraQsSdk:NSString;cdecl;//��չ����
		procedure setExtraQsSdk(extraQsSdk:NSString);cdecl;//��չ����
		//@property (nonatomic) BOOL isBoxQsSdk;                      //�Ƿ���ӽ���
		function isBoxQsSdk:Boolean;cdecl;//�Ƿ���ӽ���
		procedure setIsBoxQsSdk(isBoxQsSdk:Boolean);cdecl;//�Ƿ���ӽ���
		
		//@property (nonatomic, strong) QsSdkRoleInfo *roleInfoQsSdk; //��ɫ��Ϣ
		function roleInfoQsSdk:QsSdkRoleInfo;cdecl;//��ɫ��Ϣ
		procedure setRoleInfoQsSdk(roleInfoQsSdk:QsSdkRoleInfo);cdecl;//��ɫ��Ϣ
		
		//@property (nonatomic, strong) NSString *qsOrderIdQsSdk;     //ǿʢ������
		function qsOrderIdQsSdk:NSString;cdecl;//ǿʢ������
		procedure setQsOrderIdQsSdk(qsOrderIdQsSdk:NSString);cdecl;//ǿʢ������
		
	end;
	
	QsSdkOrderInfoClass=interface(NSObjectClass)//
	['{23AAB4D2-4B10-4247-862F-3230E9BC0E69}']
	end;
	
	TQsSdkOrderInfo=class(TOCGenericImport<QsSdkOrderInfoClass,QsSdkOrderInfo>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QsSdkOrderInfo_FakeLoader : QsSdkOrderInfo; cdecl; external {$I FrameworkDylibPath_QsSdk.inc} name 'OBJC_CLASS_$_QsSdkOrderInfo';
{$O+}



{$ENDIF}

end.

