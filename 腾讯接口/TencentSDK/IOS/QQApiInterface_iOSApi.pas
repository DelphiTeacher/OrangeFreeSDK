///
/// \file QQApiInterface.h
/// \brief QQApi接口简化封装
///
/// Created by Tencent on 12-5-15.
/// Copyright (c) 2012年 Tencent. All rights reserved.
///

unit QQApiInterface_iOSApi;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	QQApiInterfaceObject_iOSApi,
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
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID
	PQQApiInterfaceDelegate=Pointer;//PQQApiInterfaceDelegate=Pointer of QQApiInterfaceDelegate; ILocalObject(QQApiInterfaceDelegate).GetObjectID

	
	{*
	 \brief 处理来至QQ的请求及响应的回调协议
	 }
	QQApiInterfaceDelegate=interface(IObjectiveC)
		['{77F04484-F792-4516-B5EF-8C7B0D08A488}']
		
		{*
		 处理来至QQ的请求
		 }
		{-} procedure onReq(req:QQBaseReq{*});cdecl;
		
		{*
		 处理来至QQ的响应
		 }
		{-} procedure onResp(resp:QQBaseResp{*});cdecl;
		
		{*
		 处理QQ在线状态的回调
		 }
		{-} procedure isOnlineResponse(response:PNSDictionary{*});cdecl;
		
	end;
	
	TOnonReq=procedure(req:QQBaseReq{*}) of object;
	TOnonResp=procedure(resp:QQBaseResp{*}) of object;
	TOnisOnlineResponse=procedure(response:PNSDictionary{*}) of object;
	
	TQQApiInterfaceDelegate=class(TOCLocal,QQApiInterfaceDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnonReq:TOnonReq;
		OnonResp:TOnonResp;
		OnisOnlineResponse:TOnisOnlineResponse;
	
		
		{*
		 处理来至QQ的请求
		 }
		{-} procedure onReq(req:QQBaseReq{*});cdecl;
		
		{*
		 处理来至QQ的响应
		 }
		{-} procedure onResp(resp:QQBaseResp{*});cdecl;
		
		{*
		 处理QQ在线状态的回调
		 }
		{-} procedure isOnlineResponse(response:PNSDictionary{*});cdecl;
		
	end;
	
	
	{*
	 \brief 对QQApi的简单封装类
	 }
	QQApiInterface=interface(NSObject)//
	['{831800DF-078D-4B94-B66B-C4145DD1957F}']
		
		{*
		 处理由手Q唤起的跳转请求
		 \param url 待处理的url跳转请求
		 \param delegate 第三方应用用于处理来至QQ请求及响应的委托对象
		 \return 跳转请求处理结果，YES表示成功处理，NO表示不支持的请求协议或处理失败
		 }
		
		{*
		 向手Q发起分享请求
		 \param req 分享内容的请求
		 \return 请求发送结果码
		 }
		
		{*
		 向手Q QZone结合版发起分享请求
		 \note H5分享只支持单张网络图片的传递
		 \param req 分享内容的请求
		 \return 请求发送结果码
		 }
		
		{*
		 向手Q 群部落发起分享请求
		 \note H5分享只支持单张网络图片的传递
		 \param req 分享内容的请求
		 \return 请求发送结果码
		 }
		
		{*
		 向手Q发送应答消息
		 \param resp 应答消息
		 \return 应答发送结果码
		 }
		
		{*
		 检测是否已安装QQ
		 \return 如果QQ已安装则返回YES，否则返回NO
		 }
		
		{*
		 批量检测QQ号码是否在线
		 }
		
		{*
		 检测QQ是否支持API调用
		 \return 如果当前安装QQ版本支持API调用则返回YES，否则返回NO
		 }  
		
		{*
		 启动QQ
		 \return 成功返回YES，否则返回NO
		 }
		
		{*
		 获取QQ下载地址
		 
		 如果App通过<code>QQApiInterface#isQQInstalled</code>和<code>QQApiInterface#isQQSupportApi</code>检测发现QQ没安装或当前版本QQ不支持API调用，可引导用户通过打开此链接下载最新版QQ。
		 \return iPhoneQQ下载地址
		 }
		
	end;
	
	QQApiInterfaceClass=interface(NSObjectClass)//
	['{568A38B1-A82C-4945-9664-0C9A0813C607}']
		[MethodName('handleOpenURL:delegate:')]
		{+} function handleOpenURLdelegate(url:NSURL{*};delegate:PQQApiInterfaceDelegate{id<QQApiInterfaceDelegate>}):Boolean;cdecl;
		{+} function sendReq(req:QQBaseReq{*}):QQApiSendResultCode;cdecl;
		{+} function SendReqToQZone(req:QQBaseReq{*}):QQApiSendResultCode;cdecl;
		{+} function SendReqToQQGroupTribe(req:QQBaseReq{*}):QQApiSendResultCode;cdecl;
		{+} function sendResp(resp:QQBaseResp{*}):QQApiSendResultCode;cdecl;
		{+} function isQQInstalled:Boolean;cdecl;
		[MethodName('getQQUinOnlineStatues:delegate:')]
		{+} procedure getQQUinOnlineStatuesdelegate(QQUins:NSArray{*};delegate:PQQApiInterfaceDelegate{id<QQApiInterfaceDelegate>});cdecl;
		{+} function isQQSupportApi:Boolean;cdecl;
		{+} function openQQ:Boolean;cdecl;
		{+} function getQQInstallUrl:NSString{*};cdecl;
	end;
	
	TQQApiInterface=class(TOCGenericImport<QQApiInterfaceClass,QQApiInterface>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QQApiInterface_FakeLoader : QQApiInterface; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiInterface';
{$O+}

{ TQQApiInterfaceDelegate }

constructor TQQApiInterfaceDelegate.Create;
begin
	Inherited Create;
end;

destructor TQQApiInterfaceDelegate.Destroy;
begin
	Inherited;
end;

procedure  TQQApiInterfaceDelegate.onReq(req:QQBaseReq{*});
begin
	if Assigned(OnonReq) then
	begin
		OnonReq(req);
	end;
end;

procedure  TQQApiInterfaceDelegate.onResp(resp:QQBaseResp{*});
begin
	if Assigned(OnonResp) then
	begin
		OnonResp(resp);
	end;
end;

procedure  TQQApiInterfaceDelegate.isOnlineResponse(response:PNSDictionary{*});
begin
	if Assigned(OnisOnlineResponse) then
	begin
		OnisOnlineResponse(response);
	end;
end;



{$ENDIF}

end.

