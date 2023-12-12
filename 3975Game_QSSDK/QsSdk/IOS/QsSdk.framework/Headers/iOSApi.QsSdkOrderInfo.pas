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
	['{746E1C76-EA99-4BD3-ABF3-7C15B1D4EC48}']
		
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
	['{AD78DAF6-D5D1-40C1-A1AF-2912AF0DEFC5}']
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

