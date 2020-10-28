//
//  TencentMessage.h
//  TencentOpenApi_IOS
//
//  Created by qqconnect on 13-5-29.
//  Copyright (c) 2013年 Tencent. All rights reserved.
//

//#ifndef QQ_OPEN_SDK_LITE

unit TencentApiInterface_iOSApi;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	TencentMessageObject_iOSApi,
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
	PTencentApiInterfaceDelegate=Pointer;//PTencentApiInterfaceDelegate=Pointer of TencentApiInterfaceDelegate; ILocalObject(TencentApiInterfaceDelegate).GetObjectID

	
	TecnentPlatformType=(
	    kIphoneQQ,
	    kIphoneQZONE,
	    kThirdApp//,
//	}
	);
	
	TencentApiRetCode=(
	    kTencentApiSuccess,
	    kTencentApiPlatformUninstall,
	    kTencentApiPlatformNotSupport,
	    kTencentApiParamsError,
	    kTencentApiFail//,
//	}
	);
	
	
	
	
	{*
	 * \brief TencentApiInterface的回调
	 *
	 * TencentApiInterface的回调接口 
	 * \note v1.0版本只支持腾讯业务拉起第三方请求内容
	 }
	TencentApiInterfaceDelegate=interface(IObjectiveC)
		['{364F9642-9DC4-46E5-8C13-D0C9B26A6EA2}']
		
		//@optional
		{*
		 * 请求获得内容 当前版本只支持第三方相应腾讯业务请求
		 }
		{-} function onTencentReq(req:TencentApiReq{*}):Boolean;cdecl;
		
		{*
		 * 响应请求答复 当前版本只支持腾讯业务相应第三方的请求答复
		 }
		{-} function onTencentResp(resp:TencentApiResp{*}):Boolean;cdecl;
		
	end;
	
	TOnonTencentReq=function(req:TencentApiReq{*}):Boolean of object;
	TOnonTencentResp=function(resp:TencentApiResp{*}):Boolean of object;
	
	TTencentApiInterfaceDelegate=class(TOCLocal,TencentApiInterfaceDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnonTencentReq:TOnonTencentReq;
		OnonTencentResp:TOnonTencentResp;
	
		
		//@optional
		{*
		 * 请求获得内容 当前版本只支持第三方相应腾讯业务请求
		 }
		{-} function onTencentReq(req:TencentApiReq{*}):Boolean;cdecl;
		
		{*
		 * 响应请求答复 当前版本只支持腾讯业务相应第三方的请求答复
		 }
		{-} function onTencentResp(resp:TencentApiResp{*}):Boolean;cdecl;
		
	end;
	
	
	{*
	 * \brief TencentApiInterface的回调
	 *
	 * TencentApiInterface的调用接口 
	 * \note v1.0版本只支持第三方答复内容
	 }
	TencentApiInterface=interface(NSObject)//
	['{DCB4C07E-93D9-4892-9511-2E4B95A8A498}']
		
		{*
		 * 发送答复返回腾讯业务
		 * \param resp 答复内容
		 * \return 返回码
		 }
		
		{*
		 * 是否可以处理拉起协议
		 * \param url
		 * \param delegate 指定的回调
		 * \return 是否是腾讯API认识的消息类型
		 }
		
		{*
		 * 处理应用拉起协议
		 * \param url
		 * \param delegate 指定的回调
		 * \return 是否是腾讯API认识的消息类型
		 }
		
		{*
		 * 用户设备是否安装腾讯APP
		 * \param platform 指定的腾讯业务
		 * \return YES:安装 NO:未安装
		 }
		
		{*
		 * 用户设备是否支持调用SDK
		 * \param platform 指定的腾讯业务
		 * \return YES:支持 NO:不支持
		 }
		
	end;
	
	TencentApiInterfaceClass=interface(NSObjectClass)//
	['{2681A52F-37FE-44DE-A683-72A7B962ECBE}']
		{+} function sendRespMessageToTencentApp(resp:TencentApiResp{*}):TencentApiRetCode;cdecl;
		[MethodName('canOpenURL:delegate:')]
		{+} function canOpenURLdelegate(url:NSURL{*};delegate:PTencentApiInterfaceDelegate{id<TencentApiInterfaceDelegate>}):Boolean;cdecl;
		[MethodName('handleOpenURL:delegate:')]
		{+} function handleOpenURLdelegate(url:NSURL{*};delegate:PTencentApiInterfaceDelegate{id<TencentApiInterfaceDelegate>}):Boolean;cdecl;
		{+} function isTencentAppInstall(platform:TecnentPlatformType):Boolean;cdecl;
		{+} function isTencentAppSupportTencentApi(platform:TecnentPlatformType):Boolean;cdecl;
	end;
	
	TTencentApiInterface=class(TOCGenericImport<TencentApiInterfaceClass,TencentApiInterface>)
	end;
	
	//#endif
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function TencentApiInterface_FakeLoader : TencentApiInterface; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TencentApiInterface';
{$O+}

{ TTencentApiInterfaceDelegate }

constructor TTencentApiInterfaceDelegate.Create;
begin
	Inherited Create;
end;

destructor TTencentApiInterfaceDelegate.Destroy;
begin
	Inherited;
end;

function  TTencentApiInterfaceDelegate.onTencentReq(req:TencentApiReq{*}):Boolean;
begin
	if Assigned(OnonTencentReq) then
	begin
		Result:=OnonTencentReq(req);
	end;
end;

function  TTencentApiInterfaceDelegate.onTencentResp(resp:TencentApiResp{*}):Boolean;
begin
	if Assigned(OnonTencentResp) then
	begin
		Result:=OnonTencentResp(resp);
	end;
end;



{$ENDIF}

end.

