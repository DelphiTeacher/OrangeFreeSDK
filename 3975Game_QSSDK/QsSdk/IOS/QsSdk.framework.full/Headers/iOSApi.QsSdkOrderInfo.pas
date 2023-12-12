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
		
		//@property (nonatomic, strong) NSString *cpOrderIdQsSdk;     //CP订单号
		function cpOrderIdQsSdk:NSString;cdecl;//CP订单号
		procedure setCpOrderIdQsSdk(cpOrderIdQsSdk:NSString);cdecl;//CP订单号
		//@property (nonatomic, strong) NSString *productNameQsSdk;   //商品名称
		function productNameQsSdk:NSString;cdecl;//商品名称
		procedure setProductNameQsSdk(productNameQsSdk:NSString);cdecl;//商品名称
		//@property (nonatomic, strong) NSString *productDescQsSdk;   //商品描述
		function productDescQsSdk:NSString;cdecl;//商品描述
		procedure setProductDescQsSdk(productDescQsSdk:NSString);cdecl;//商品描述
		//@property (nonatomic, strong) NSString *productIdQsSdk;     //商品id
		function productIdQsSdk:NSString;cdecl;//商品id
		procedure setProductIdQsSdk(productIdQsSdk:NSString);cdecl;//商品id
		//@property (nonatomic, strong) NSString *productPriceQsSdk;  //商品价格，单位元
		function productPriceQsSdk:NSString;cdecl;//商品价格，单位元
		procedure setProductPriceQsSdk(productPriceQsSdk:NSString);cdecl;//商品价格，单位元
		//@property (nonatomic, strong) NSString *extraQsSdk;         //扩展参数
		function extraQsSdk:NSString;cdecl;//扩展参数
		procedure setExtraQsSdk(extraQsSdk:NSString);cdecl;//扩展参数
		//@property (nonatomic) BOOL isBoxQsSdk;                      //是否盒子进入
		function isBoxQsSdk:Boolean;cdecl;//是否盒子进入
		procedure setIsBoxQsSdk(isBoxQsSdk:Boolean);cdecl;//是否盒子进入
		
		//@property (nonatomic, strong) QsSdkRoleInfo *roleInfoQsSdk; //角色信息
		function roleInfoQsSdk:QsSdkRoleInfo;cdecl;//角色信息
		procedure setRoleInfoQsSdk(roleInfoQsSdk:QsSdkRoleInfo);cdecl;//角色信息
		
		//@property (nonatomic, strong) NSString *qsOrderIdQsSdk;     //强盛订单号
		function qsOrderIdQsSdk:NSString;cdecl;//强盛订单号
		procedure setQsOrderIdQsSdk(qsOrderIdQsSdk:NSString);cdecl;//强盛订单号
		
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

