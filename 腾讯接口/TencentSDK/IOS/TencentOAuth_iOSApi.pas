///
/// \file TencentOAuth.h
/// \brief QQ互联开放平台授权登录及相关开放接口实现类
///
/// Created by Tencent on 12-12-21.
/// Copyright (c) 2012年 Tencent. All rights reserved.
///

unit TencentOAuth_iOSApi;

interface

{$IFDEF IOS}
uses
	iOSapi.UIKit,
	sdkdef_iOSApi,
	TencentOAuthObject_iOSApi,
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
	PTencentSessionDelegate=Pointer;//PTencentSessionDelegate=Pointer of TencentSessionDelegate; ILocalObject(TencentSessionDelegate).GetObjectID
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID
	PTCAPIRequestDelegate=Pointer;//PTCAPIRequestDelegate=Pointer of TCAPIRequestDelegate; ILocalObject(TCAPIRequestDelegate).GetObjectID

	
	//@protocol TencentSessionDelegate;
	//@protocol TencentLoginDelegate;
	//@protocol TencentApiInterfaceDelegate;
	//@protocol TencentWebViewDelegate;
	
	
	
	
	TencentAuthorizeState=(
	    kTencentNotAuthorizeState,
	    kTencentSSOAuthorizeState,
	    kTencentWebviewAuthorzieState//,
	);
	
	TencentAuthMode=(
	    kAuthModeClientSideToken,
	    kAuthModeServerSideCode//,
	);
	
	//#pragma mark - TencentOAuth(授权登录及相关开放接口调用)
	
	{*
	 * \brief TencentOpenAPI授权登录及相关开放接口调用
	 *
	 * TencentOAuth实现授权登录逻辑以及相关开放接口的请求调用
	 }
	TencentOAuth=interface(NSObject)//
	['{35A10A44-8EC6-4E3A-8A3F-D959A7B58460}']
		
		
		
		
		
		
		
		
		
		
		
		{* Access Token凭证，用于后续访问各开放接口 }
		function accessToken:NSString{*};cdecl;
		procedure setAccessToken(accessToken:NSString{*});cdecl;
		
		{* Access Token的失效期 }
		function expirationDate:NSDate{*};cdecl;
		procedure setExpirationDate(expirationDate:NSDate{*});cdecl;
		
		{* 已实现的开放接口的回调委托对象 }
		function sessionDelegate:PTencentSessionDelegate{id<TencentSessionDelegate>};cdecl;
		procedure setSessionDelegate(sessionDelegate:PTencentSessionDelegate{id<TencentSessionDelegate>});cdecl;
		
		{* 第三方应用在开发过程中设置的URLSchema，用于浏览器登录后后跳到第三方应用 }
		function localAppId:NSString{*};cdecl;
		procedure setLocalAppId(localAppId:NSString{*});cdecl;
		
		{* 用户授权登录后对该用户的唯一标识 }
		function openId:NSString{*};cdecl;
		procedure setOpenId(openId:NSString{*});cdecl;
		
		{* 用户登录成功过后的跳转页面地址 }
		function redirectURI:NSString{*};cdecl;
		procedure setRedirectURI(redirectURI:NSString{*});cdecl;
		
		{* 第三方应用在互联开放平台申请的appID }
		function appId:NSString{*};cdecl;
		procedure setAppId(appId:NSString{*});cdecl;
		
		{* 主要是互娱的游戏设置uin }
		function uin:NSString{*};cdecl;
		procedure setUin(uin:NSString{*});cdecl;
		
		{* 主要是互娱的游戏设置鉴定票据 }
		function skey:NSString{*};cdecl;
		procedure setSkey(skey:NSString{*});cdecl;
		
		{* 登陆透传的数据 }
		function passData:PNSDictionary{*};cdecl;
		procedure setPassData(passData:PNSDictionary{*});cdecl;
		
		{* 授权方式(Client Side Token或者Server Side Code) }
		function authMode:TencentAuthMode;cdecl;
		procedure setAuthMode(authMode:TencentAuthMode);cdecl;
		
		{*
		 * 用来获得当前sdk的版本号
		 * \return 返回sdk版本号
		 *}
		
		
		{*
		 * 用来获得当前sdk的小版本号
		 * \return 返回sdk小版本号
		 *}
		
		
		{*
		 * 用来获得当前sdk的是否精简版
		 * \return 返回YES表示精简版
		 *}
		
		
		{* 
		 * 主要是用来帮助判断是否有登陆被发起，但是还没有过返回结果 
		 * \return 
		 *          kTencentNotAuthorizeState:无授权 
		 *          kTencentSSOAuthorizeState:有人发起了sso授权但无返回
		 *          kTencentWebviewAuthorzieState:有人发起了webview授权还未返回
		 *}
		
		
		{*
		 * 用来获得当前手机qq的版本号
		 * \return 返回手机qq版本号
		 *}
		
		{*
		 * 初始化TencentOAuth对象
		 * \param appId 第三方应用在互联开放平台申请的唯一标识
		 * \param delegate 第三方应用用于接收请求返回结果的委托对象
		 * \return 初始化后的授权登录对象
		 }
		[MethodName('initWithAppId:andDelegate:')]
		{-} function initWithAppIdandDelegate(appId:NSString{*};delegate:PTencentSessionDelegate{id<TencentSessionDelegate>}):id;cdecl;
		
		
		{*
		 * 判断用户手机上是否安装手机QQ
		 * \return YES:安装 NO:没安装
		 }
		
		{*
		 * 判断用户手机上的手机QQ是否支持SSO登录
		 * \return YES:支持 NO:不支持
		 }
		
		{*
		 * 判断用户手机上是否安装手机QZone
		 * \return YES:安装 NO:没安装
		 }
		
		{*
		 * 判断用户手机上的手机QZone是否支持SSO登录
		 * \return YES:支持 NO:不支持
		 }
		
		{*
		 * 登录授权
		 *
		 * \param permissions 授权信息列
		 }
		{-} function authorize(permissions:NSArray{*}):Boolean;cdecl;
		
		{*
		 * 登录授权
		 * \param permissions 授权信息列表
		 * \param bInSafari 是否使用safari进行登录.<b>IOS SDK 1.3版本开始此参数废除</b>
		 }
		[MethodName('authorize:inSafari:')]
		{-} function authorizeinSafari(permissions:NSArray{*};bInSafari:Boolean):Boolean;cdecl;
		
		{*
		 * 登录授权
		 * \param permissions 授权信息列表
		 * \param localAppId 应用APPID
		 * \param bInSafari 是否使用safari进行登录.<b>IOS SDK 1.3版本开始此参数废除</b>
		 }
		[MethodName('authorize:localAppId:inSafari:')]
		{-} function authorizelocalAppIdinSafari(permissions:NSArray{*};localAppId:NSString{*};bInSafari:Boolean):Boolean;cdecl;
		
		{*
		 * 增量授权，因用户没有授予相应接口调用的权限，需要用户确认是否授权
		 * \param permissions 需增量授权的信息列表
		 * \return 增量授权调用是否成功
		 }
		{-} function incrAuthWithPermissions(permissions:NSArray{*}):Boolean;cdecl;
		
		{*
		 * 重新授权，因token废除或失效导致接口调用失败，需用户重新授权
		 * \param permissions 授权信息列表，同登录授权
		 * \return 授权调用是否成功
		 }
		{-} function reauthorizeWithPermissions(permissions:NSArray{*}):Boolean;cdecl;
		
		{*
		 * (静态方法)处理应用拉起协议
		 * \param url 处理被其他应用呼起时的逻辑
		 * \return 处理结果，YES表示成功，NO表示失败
		 }
		
		{*
		 * (静态方法)sdk是否可以处理应用拉起协议
		 * \param url 处理被其他应用呼起时的逻辑
		 * \return 处理结果，YES表示可以 NO表示不行
		 }
		
		{*
		 * (静态方法)获取TencentOAuth调用的上一次错误信息
		 }
		
		{*
		 * 以Server Side Code模式授权登录时，通过此接口获取返回的code值;
		 * 以Client Side Token模式授权登录时，忽略此接口。
		 }
		{-} function getServerSideCode:NSString{*};cdecl;
		
		{*
		 * 退出登录(退出登录后，TecentOAuth失效，需要重新初始化)
		 * \param delegate 第三方应用用于接收请求返回结果的委托对象
		 }
		{-} procedure logout(delegate:PTencentSessionDelegate{id<TencentSessionDelegate>});cdecl;
		
		{*
		 * 判断登录态是否有效
		 * \return 处理结果，YES表示有效，NO表示无效，请用户重新登录授权
		 }
		{-} function isSessionValid:Boolean;cdecl;
		
		{*
		 * 获取用户个人信息
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function getUserInfo:Boolean;cdecl;
		
		{*
		 * SDK内置webview实现定向分享时，第三方应用可以根据应用是否在白名单里来开启该配置开关，默认为关闭；
		 * 在白名单里的应用调用该接口后，即打开sdk内置webview的二级白名单开关（相对与sdk后台的白名单），
		 * 那么在sdk后台白名单校验请求失败的情况下，会继续先尝试采用内置webview进行分享。
		 }
		{-} procedure openSDKWebViewQQShareEnable;cdecl;
		
		
		{*
		 * 获取用户QZone相册列表
		 * \attention 需\ref apply_perm
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function getListAlbum:Boolean;cdecl;
		
		{*
		 * 获取用户QZone相片列表
		 * \attention 需\ref apply_perm
		 * \param params 参数字典,字典的关键字参见TencentOAuthObject.h中的\ref TCListPhotoDic
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function getListPhotoWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		
		{*
		 * 分享到QZone
		 * \param params 参数字典,字典的关键字参见TencentOAuthObject.h中的\ref TCAddShareDic 
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function addShareWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		
		{*
		 * 上传照片到QZone指定相册
		 * \attention 需\ref apply_perm
		 * \param params 参数字典,字典的关键字参见TencentOAuthObject.h中的\ref TCUploadPicDic
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function uploadPicWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		{*
		 * 在QZone相册中创建一个新的相册
		 * \attention 需\ref apply_perm
		 * \param params 参数字典,字典的关键字参见TencentOAuthObject.h中的\ref TCAddAlbumDic
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function addAlbumWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		{*
		 * 检查是否是QZone某个用户的粉丝
		 * \param params 参数字典,字典的关键字参见TencentOAuthObject.h中的\ref TCCheckPageFansDic
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function checkPageFansWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		{*
		 * 在QZone中发表一篇日志
		 * \attention 需\ref apply_perm
		 * \param params 参数字典,字典的关键字参见TencentOAuthObject.h中的\ref TCAddOneBlogDic
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function addOneBlogWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		{*
		 * 在QZone中发表一条说说
		 * \attention 需\ref apply_perm
		 * \param params 参数字典,字典的关键字参见TencentOAuthObject.h中的\ref TCAddTopicDic
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function addTopicWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		{*
		 * 设置QQ头像 使用默认的效果处理设置头像的界面
		 * \attention 需\ref apply_perm
		 * \param params 参数字典,字典的关键字参见TencentOAuthObject.h中的\ref TCSetUserHeadpic
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function setUserHeadpic(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		
//		{*
//		 * 设置QQ头像 会返回设置头像由第三方自己处理界面的弹出方式
//		 * \attention 需\ref apply_perm
//		 * \param params 参数字典,字典的关键字参见TencentOAuthObject.h中的\ref TCSetUserHeadpic
//		 * \param viewController 设置头像的界面
//		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
//		 }
//		[MethodName('setUserHeadpic:andViewController:')]
//		{-} function setUserHeadpicandViewController(params:NSMutableDictionary{*};viewController:UIViewController *{*}):Boolean;cdecl;
//
		{*
		 * 获取QQ会员信息(仅包括是否为QQ会员,是否为年费QQ会员)
		 * \attention 需\ref apply_perm
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function getVipInfo:Boolean;cdecl;
		
		{*
		 * 获取QQ会员详细信息
		 * \attention 需\ref apply_perm
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		{-} function getVipRichInfo:Boolean;cdecl;
		
		{*
		 * QZone定向分享，可以@到具体好友，完成后将触发responseDidReceived:forMessage:回调，message：“SendStory”
		 * \param params 参数字典
		 * \param fopenIdArray 第三方应用预传人好友列表，好友以openid标识
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		[MethodName('sendStory:friendList:')]
		{-} function sendStoryfriendList(params:NSMutableDictionary{*};fopenIdArray:NSArray{*}):Boolean;cdecl;
		
		{*
		 * 发送应用邀请，完成后将触发responseDidReceived:forMessage:回调，message：“AppInvitation”
		 * \param desc 应用的描述文字，不超过35字符，如果为nil或@“”则显示默认描述
		 * \param imageUrl 应用的图标，如果为nil或者@“”则显示默认图标
		 * \param source 透传参数，由开发者自定义该参数内容
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		[MethodName('sendAppInvitationWithDescription:imageURL:source:')]
		{-} function sendAppInvitationWithDescriptionimageURLsource(desc:NSString{*};imageUrl:NSString{*};source:NSString{*}):Boolean;cdecl;
		
		{*
		 * 发起PK或者发送炫耀，完成后将触发responseDidReceived:forMessage:回调，message：“AppChallenge”
		 * \param receiver 必须指定一位进行PK或者炫耀的好友，填写其OpenID，填写多个OpenID将截取第一个
		 * \param type 类型，"pk"或者“brag”
		 * \param imageUrl 炫耀/挑战场景图的URL
		 * \param message 炫耀/挑战中的内容描述，不超过50个字符，超过限制则自动截断
		 * \param source 透传参数，由开发者自定义该参数内容
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		[MethodName('sendChallenge:type:imageURL:message:source:')]
		{-} function sendChallengetypeimageURLmessagesource(receiver:NSString{*};_type:NSString{*};imageUrl:NSString{*};message:NSString{*};source:NSString{*}):Boolean;cdecl;
		
		{*
		 * 赠送或者请求礼物，完成后将触发responseDidReceived:forMessage:回调，message：“AppGiftRequest”
		 * \param receiver 赠送或者请求礼物的好友的OpenID，支持填写多个，OpenID之用","分隔，为nil时将由用户通过好友选择器选择好友
		 * \param exclude 用户通过好友选择器选择好友场景下，希望排除的好友（不显示在好友选择器）
		 * \param specified 用户通过好友选择器选择好友场景下，希望出现的指定好友
		 * \param only 是否只显示specified指定的好友
		 * \param type 类型，"request"或者“freegift”
		 * \param title 免费礼物或请求名称，不超过6个字符
		 * \param message 礼物或请求的默认赠言，控制在35个汉字以内，超过限制自动截断
		 * \param imageUrl 请求或礼物配图的URL，如果不传，则默认在弹框中显示应用的icon
		 * \param source 透传参数，由开发者自定义该参数内容
		 * \return 处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
		 }
		[MethodName('sendGiftRequest:exclude:specified:only:type:title:message:imageURL:source:')]
		{-} function sendGiftRequestexcludespecifiedonlytypetitlemessageimageURLsource(receiver:NSString{*};exclude:NSString{*};specified:NSString{*};only:Boolean;_type:NSString{*};title:NSString{*};message:NSString{*};imageUrl:NSString{*};source:NSString{*}):Boolean;cdecl;
		
		
		{*
		 * 退出指定API调用
		 * \param userData 用户调用某条API的时候传入的保留参数
		 * \return 处理结果，YES表示成功 NO表示失败
		 }
		{-} function cancel(userData:id):Boolean;cdecl;
		
		{*
		 * CGI类任务创建接口
		 * \param apiURL CGI请求的URL地址
		 * \param method CGI请求方式："GET"，"POST"
		 * \param params CGI请求参数字典
		 * \param callback CGI请求结果的回调接口对象
		 * \return CGI请求任务实例，用于取消任务，返回nil代表任务创建失败
		 }
		[MethodName('cgiRequestWithURL:method:params:callback:')]
		{-} function cgiRequestWithURLmethodparamscallback(apiURL:NSURL{*};method:NSString{*};params:PNSDictionary{*};callback:PTCAPIRequestDelegate{id<TCAPIRequestDelegate>}):TCAPIRequest{*};cdecl;
		
		{*
		 * TencentOpenApi发送任务统一接口
		 * \param request 请求发送的任务
		 * \param callback 任务发送后的回调地址
		 }
		[MethodName('sendAPIRequest:callback:')]
		{-} function sendAPIRequestcallback(request:TCAPIRequest{*};callback:PTCAPIRequestDelegate{id<TCAPIRequestDelegate>}):Boolean;cdecl;
		
		{-} function getUserOpenID:NSString{*};cdecl;
		
	end;
	
	TencentOAuthClass=interface(NSObjectClass)//
	['{67442605-6488-4CB2-9EE2-1255ABC58C5A}']
		{+} function sdkVersion:NSString{*};cdecl;
		{+} function sdkSubVersion:NSString{*};cdecl;
		{+} function isLiteSDK:Boolean;cdecl;
		{+} function authorizeState:TencentAuthorizeState{*};cdecl;
		{+} function iphoneQQVersion:QQVersion;cdecl;
		{+} function iphoneQQInstalled:Boolean;cdecl;
		{+} function iphoneQQSupportSSOLogin:Boolean;cdecl;
		{+} function iphoneQZoneInstalled:Boolean;cdecl;
		{+} function iphoneQZoneSupportSSOLogin:Boolean;cdecl;
		{+} function HandleOpenURL(url:NSURL{*}):Boolean;cdecl;
		{+} function CanHandleOpenURL(url:NSURL{*}):Boolean;cdecl;
		{+} function getLastErrorMsg:NSString{*};cdecl;
	end;
	
	TTencentOAuth=class(TOCGenericImport<TencentOAuthClass,TencentOAuth>)
	end;
	
	//#pragma mark - TencentLoginDelegate(授权登录回调协议)
	
	{*
	 * \brief TencentLoginDelegate iOS Open SDK 1.3 API回调协议
	 *
	 * 第三方应用实现登录的回调协议
	 }
	TencentLoginDelegate=interface(IObjectiveC)
		['{6E8FDC3F-C87D-46E9-A609-D66D78C7563C}']
		
		//@required
		
		{*
		 * 登录成功后的回调
		 }
		{-} procedure tencentDidLogin;cdecl;
		
		{*
		 * 登录失败后的回调
		 * \param cancelled 代表用户是否主动退出登录
		 }
		{-} procedure tencentDidNotLogin(cancelled:Boolean);cdecl;
		
		{*
		 * 登录时网络有问题的回调
		 }
		{-} procedure tencentDidNotNetWork;cdecl;
		
		//@optional
		{*
		 * 登录时权限信息的获得
		 }
		[MethodName('getAuthorizedPermissions:withExtraParams:')]
		{-} function getAuthorizedPermissionswithExtraParams(permissions:NSArray{*};extraParams:PNSDictionary{*}):NSArray{*};cdecl;
		
	end;
	
	TOntencentDidLogin=procedure() of object;
	TOntencentDidNotLogin=procedure(cancelled:Boolean) of object;
	TOntencentDidNotNetWork=procedure() of object;
	TOngetAuthorizedPermissionswithExtraParams=function(permissions:NSArray{*};extraParams:PNSDictionary{*}):NSArray{*} of object;
	
	TTencentLoginDelegate=class(TOCLocal,TencentLoginDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OntencentDidLogin:TOntencentDidLogin;
		OntencentDidNotLogin:TOntencentDidNotLogin;
		OntencentDidNotNetWork:TOntencentDidNotNetWork;
		OngetAuthorizedPermissionswithExtraParams:TOngetAuthorizedPermissionswithExtraParams;
	
		
		//@required
		
		{*
		 * 登录成功后的回调
		 }
		{-} procedure tencentDidLogin;cdecl;
		
		{*
		 * 登录失败后的回调
		 * \param cancelled 代表用户是否主动退出登录
		 }
		{-} procedure tencentDidNotLogin(cancelled:Boolean);cdecl;
		
		{*
		 * 登录时网络有问题的回调
		 }
		{-} procedure tencentDidNotNetWork;cdecl;
		
		//@optional
		{*
		 * 登录时权限信息的获得
		 }
		[MethodName('getAuthorizedPermissions:withExtraParams:')]
		{-} function getAuthorizedPermissionswithExtraParams(permissions:NSArray{*};extraParams:PNSDictionary{*}):NSArray{*};cdecl;
		
	end;
	
	
	//#pragma mark - TencentSessionDelegate(开放接口回调协议)
	
	{*
	 * \brief TencentSessionDelegate iOS Open SDK 1.3 API回调协议
	 *
	 * 第三方应用需要实现每条需要调用的API的回调协议
	 }
	TencentSessionDelegate=interface(IObjectiveC)
		['{1D82EDD4-2A80-48DA-A6DE-273608968207}']
		
		
		
		//@optional
		
		{*
		 * 退出登录的回调
		 }
		{-} procedure tencentDidLogout;cdecl;
		
		{*
		 * 因用户未授予相应权限而需要执行增量授权。在用户调用某个api接口时，如果服务器返回操作未被授权，则触发该回调协议接口，由第三方决定是否跳转到增量授权页面，让用户重新授权。
		 * \param tencentOAuth 登录授权对象。
		 * \param permissions 需增量授权的权限列表。
		 * \return 是否仍然回调返回原始的api请求结果。
		 * \note 不实现该协议接口则默认为不开启增量授权流程。若需要增量授权请调用\ref TencentOAuth#incrAuthWithPermissions: \n注意：增量授权时用户可能会修改登录的帐号
		 }
		[MethodName('tencentNeedPerformIncrAuth:withPermissions:')]
		{-} function tencentNeedPerformIncrAuthwithPermissions(tencentOAuth:TencentOAuth{*};permissions:NSArray{*}):Boolean;cdecl;
		
		{*
		 * [该逻辑未实现]因token失效而需要执行重新登录授权。在用户调用某个api接口时，如果服务器返回token失效，则触发该回调协议接口，由第三方决定是否跳转到登录授权页面，让用户重新授权。
		 * \param tencentOAuth 登录授权对象。
		 * \return 是否仍然回调返回原始的api请求结果。
		 * \note 不实现该协议接口则默认为不开启重新登录授权流程。若需要重新登录授权请调用\ref TencentOAuth#reauthorizeWithPermissions: \n注意：重新登录授权时用户可能会修改登录的帐号
		 }
		{-} function tencentNeedPerformReAuth(tencentOAuth:TencentOAuth{*}):Boolean;cdecl;
		
		{*
		 * 用户通过增量授权流程重新授权登录，token及有效期限等信息已被更新。
		 * \param tencentOAuth token及有效期限等信息更新后的授权实例对象
		 * \note 第三方应用需更新已保存的token及有效期限等信息。
		 }
		{-} procedure tencentDidUpdate(tencentOAuth:TencentOAuth{*});cdecl;
		
		{*
		 * 用户增量授权过程中因取消或网络问题导致授权失败
		 * \param reason 授权失败原因，具体失败原因参见sdkdef.h文件中\ref UpdateFailType
		 }
		{-} procedure tencentFailedUpdate(reason:UpdateFailType);cdecl;
		
		{*
		 * 获取用户个人信息回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/getUserInfoResponse.exp success
		 *          错误返回示例: \snippet example/getUserInfoResponse.exp fail
		 }
		{-} procedure getUserInfoResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * 获取用户QZone相册列表回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/getListAlbumResponse.exp success
		 *          错误返回示例: \snippet example/getListAlbumResponse.exp fail
		 }
		{-} procedure getListAlbumResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 获取用户QZone相片列表
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/getListPhotoResponse.exp success
		 *          错误返回示例: \snippet example/getListPhotoResponse.exp fail
		 }
		{-} procedure getListPhotoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 检查是否是QZone某个用户的粉丝回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/checkPageFansResponse.exp success
		 *          错误返回示例: \snippet example/checkPageFansResponse.exp fail
		 }
		{-} procedure checkPageFansResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 分享到QZone回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/addShareResponse.exp success
		 *          错误返回示例: \snippet example/addShareResponse.exp fail
		 }
		{-} procedure addShareResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 在QZone相册中创建一个新的相册回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/addAlbumResponse.exp success
		 *          错误返回示例: \snippet example/addAlbumResponse.exp fail
		 }
		{-} procedure addAlbumResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 上传照片到QZone指定相册回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/uploadPicResponse.exp success
		 *          错误返回示例: \snippet example/uploadPicResponse.exp fail
		 }
		{-} procedure uploadPicResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * 在QZone中发表一篇日志回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/addOneBlogResponse.exp success
		 *          错误返回示例: \snippet example/addOneBlogResponse.exp fail
		 }
		{-} procedure addOneBlogResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 在QZone中发表一条说说回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/addTopicResponse.exp success
		 *          错误返回示例: \snippet example/addTopicResponse.exp fail
		 }
		{-} procedure addTopicResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 设置QQ头像回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/setUserHeadpicResponse.exp success
		 *          错误返回示例: \snippet example/setUserHeadpicResponse.exp fail
		 }
		{-} procedure setUserHeadpicResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 获取QQ会员信息回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/getVipInfoResponse.exp success
		 *          错误返回示例: \snippet example/getVipInfoResponse.exp fail
		 }
		{-} procedure getVipInfoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 获取QQ会员详细信息回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 }
		{-} procedure getVipRichInfoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * sendStory分享的回调（已废弃，使用responseDidReceived:forMessage:）
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 }
		{-} procedure sendStoryResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * 社交API统一回调接口
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \param message 响应的消息，目前支持‘SendStory’,‘AppInvitation’，‘AppChallenge’，‘AppGiftRequest’
		 }
		[MethodName('responseDidReceived:forMessage:')]
		{-} procedure responseDidReceivedforMessage(response:APIResponse{*};message:NSString{*});cdecl;
		
		{*
		 * post请求的上传进度
		 * \param tencentOAuth 返回回调的tencentOAuth对象
		 * \param bytesWritten 本次回调上传的数据字节数
		 * \param totalBytesWritten 总共已经上传的字节数
		 * \param totalBytesExpectedToWrite 总共需要上传的字节数
		 * \param userData 用户自定义数据
		 }
		[MethodName('tencentOAuth:didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:userData:')]
		{-} procedure tencentOAuthdidSendBodyDatatotalBytesWrittentotalBytesExpectedToWriteuserData(tencentOAuth:TencentOAuth{*};bytesWritten:NSInteger;totalBytesWritten:NSInteger;totalBytesExpectedToWrite:NSInteger;userData:id);cdecl;
		
		
		{*
		 * 通知第三方界面需要被关闭
		 * \param tencentOAuth 返回回调的tencentOAuth对象
		 * \param viewController 需要关闭的viewController
		 }
		[MethodName('tencentOAuth:doCloseViewController:')]
		{-} procedure tencentOAuthdoCloseViewController(tencentOAuth:TencentOAuth{*};viewController:UIViewController{*});cdecl;
		
	end;
	
	TOntencentDidLogout=procedure() of object;
	TOntencentNeedPerformIncrAuthwithPermissions=function(tencentOAuth:TencentOAuth{*};permissions:NSArray{*}):Boolean of object;
	TOntencentNeedPerformReAuth=function(tencentOAuth:TencentOAuth{*}):Boolean of object;
	TOntencentDidUpdate=procedure(tencentOAuth:TencentOAuth{*}) of object;
	TOntencentFailedUpdate=procedure(reason:UpdateFailType) of object;
	TOngetUserInfoResponse=procedure(response:APIResponse{*}) of object;
	TOngetListAlbumResponse=procedure(response:APIResponse{*}) of object;
	TOngetListPhotoResponse=procedure(response:APIResponse{*}) of object;
	TOncheckPageFansResponse=procedure(response:APIResponse{*}) of object;
	TOnaddShareResponse=procedure(response:APIResponse{*}) of object;
	TOnaddAlbumResponse=procedure(response:APIResponse{*}) of object;
	TOnuploadPicResponse=procedure(response:APIResponse{*}) of object;
	TOnaddOneBlogResponse=procedure(response:APIResponse{*}) of object;
	TOnaddTopicResponse=procedure(response:APIResponse{*}) of object;
	TOnsetUserHeadpicResponse=procedure(response:APIResponse{*}) of object;
	TOngetVipInfoResponse=procedure(response:APIResponse{*}) of object;
	TOngetVipRichInfoResponse=procedure(response:APIResponse{*}) of object;
	TOnsendStoryResponse=procedure(response:APIResponse{*}) of object;
	TOnresponseDidReceivedforMessage=procedure(response:APIResponse{*};message:NSString{*}) of object;
	TOntencentOAuthdidSendBodyDatatotalBytesWrittentotalBytesExpectedToWriteuserData=procedure(tencentOAuth:TencentOAuth{*};bytesWritten:NSInteger;totalBytesWritten:NSInteger;totalBytesExpectedToWrite:NSInteger;userData:id) of object;
	TOntencentOAuthdoCloseViewController=procedure(tencentOAuth:TencentOAuth{*};viewController:UIViewController{*}) of object;
	
	TTencentSessionDelegate=class(TOCLocal,TencentSessionDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OntencentDidLogout:TOntencentDidLogout;
		OntencentNeedPerformIncrAuthwithPermissions:TOntencentNeedPerformIncrAuthwithPermissions;
		OntencentNeedPerformReAuth:TOntencentNeedPerformReAuth;
		OntencentDidUpdate:TOntencentDidUpdate;
		OntencentFailedUpdate:TOntencentFailedUpdate;
		OngetUserInfoResponse:TOngetUserInfoResponse;
		OngetListAlbumResponse:TOngetListAlbumResponse;
		OngetListPhotoResponse:TOngetListPhotoResponse;
		OncheckPageFansResponse:TOncheckPageFansResponse;
		OnaddShareResponse:TOnaddShareResponse;
		OnaddAlbumResponse:TOnaddAlbumResponse;
		OnuploadPicResponse:TOnuploadPicResponse;
		OnaddOneBlogResponse:TOnaddOneBlogResponse;
		OnaddTopicResponse:TOnaddTopicResponse;
		OnsetUserHeadpicResponse:TOnsetUserHeadpicResponse;
		OngetVipInfoResponse:TOngetVipInfoResponse;
		OngetVipRichInfoResponse:TOngetVipRichInfoResponse;
		OnsendStoryResponse:TOnsendStoryResponse;
		OnresponseDidReceivedforMessage:TOnresponseDidReceivedforMessage;
		OntencentOAuthdidSendBodyDatatotalBytesWrittentotalBytesExpectedToWriteuserData:TOntencentOAuthdidSendBodyDatatotalBytesWrittentotalBytesExpectedToWriteuserData;
		OntencentOAuthdoCloseViewController:TOntencentOAuthdoCloseViewController;
	
		
		
		
		//@optional
		
		{*
		 * 退出登录的回调
		 }
		{-} procedure tencentDidLogout;cdecl;
		
		{*
		 * 因用户未授予相应权限而需要执行增量授权。在用户调用某个api接口时，如果服务器返回操作未被授权，则触发该回调协议接口，由第三方决定是否跳转到增量授权页面，让用户重新授权。
		 * \param tencentOAuth 登录授权对象。
		 * \param permissions 需增量授权的权限列表。
		 * \return 是否仍然回调返回原始的api请求结果。
		 * \note 不实现该协议接口则默认为不开启增量授权流程。若需要增量授权请调用\ref TencentOAuth#incrAuthWithPermissions: \n注意：增量授权时用户可能会修改登录的帐号
		 }
		[MethodName('tencentNeedPerformIncrAuth:withPermissions:')]
		{-} function tencentNeedPerformIncrAuthwithPermissions(tencentOAuth:TencentOAuth{*};permissions:NSArray{*}):Boolean;cdecl;
		
		{*
		 * [该逻辑未实现]因token失效而需要执行重新登录授权。在用户调用某个api接口时，如果服务器返回token失效，则触发该回调协议接口，由第三方决定是否跳转到登录授权页面，让用户重新授权。
		 * \param tencentOAuth 登录授权对象。
		 * \return 是否仍然回调返回原始的api请求结果。
		 * \note 不实现该协议接口则默认为不开启重新登录授权流程。若需要重新登录授权请调用\ref TencentOAuth#reauthorizeWithPermissions: \n注意：重新登录授权时用户可能会修改登录的帐号
		 }
		{-} function tencentNeedPerformReAuth(tencentOAuth:TencentOAuth{*}):Boolean;cdecl;
		
		{*
		 * 用户通过增量授权流程重新授权登录，token及有效期限等信息已被更新。
		 * \param tencentOAuth token及有效期限等信息更新后的授权实例对象
		 * \note 第三方应用需更新已保存的token及有效期限等信息。
		 }
		{-} procedure tencentDidUpdate(tencentOAuth:TencentOAuth{*});cdecl;
		
		{*
		 * 用户增量授权过程中因取消或网络问题导致授权失败
		 * \param reason 授权失败原因，具体失败原因参见sdkdef.h文件中\ref UpdateFailType
		 }
		{-} procedure tencentFailedUpdate(reason:UpdateFailType);cdecl;

		{*
		 * 获取用户个人信息回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/getUserInfoResponse.exp success
		 *          错误返回示例: \snippet example/getUserInfoResponse.exp fail
		 }
		{-} procedure getUserInfoResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * 获取用户QZone相册列表回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/getListAlbumResponse.exp success
		 *          错误返回示例: \snippet example/getListAlbumResponse.exp fail
		 }
		{-} procedure getListAlbumResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 获取用户QZone相片列表
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/getListPhotoResponse.exp success
		 *          错误返回示例: \snippet example/getListPhotoResponse.exp fail
		 }
		{-} procedure getListPhotoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 检查是否是QZone某个用户的粉丝回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/checkPageFansResponse.exp success
		 *          错误返回示例: \snippet example/checkPageFansResponse.exp fail
		 }
		{-} procedure checkPageFansResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 分享到QZone回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/addShareResponse.exp success
		 *          错误返回示例: \snippet example/addShareResponse.exp fail
		 }
		{-} procedure addShareResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 在QZone相册中创建一个新的相册回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/addAlbumResponse.exp success
		 *          错误返回示例: \snippet example/addAlbumResponse.exp fail
		 }
		{-} procedure addAlbumResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 上传照片到QZone指定相册回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/uploadPicResponse.exp success
		 *          错误返回示例: \snippet example/uploadPicResponse.exp fail
		 }
		{-} procedure uploadPicResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * 在QZone中发表一篇日志回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/addOneBlogResponse.exp success
		 *          错误返回示例: \snippet example/addOneBlogResponse.exp fail
		 }
		{-} procedure addOneBlogResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 在QZone中发表一条说说回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/addTopicResponse.exp success
		 *          错误返回示例: \snippet example/addTopicResponse.exp fail
		 }
		{-} procedure addTopicResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 设置QQ头像回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/setUserHeadpicResponse.exp success
		 *          错误返回示例: \snippet example/setUserHeadpicResponse.exp fail
		 }
		{-} procedure setUserHeadpicResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 获取QQ会员信息回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \remarks 正确返回示例: \snippet example/getVipInfoResponse.exp success
		 *          错误返回示例: \snippet example/getVipInfoResponse.exp fail
		 }
		{-} procedure getVipInfoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * 获取QQ会员详细信息回调
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 }
		{-} procedure getVipRichInfoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * sendStory分享的回调（已废弃，使用responseDidReceived:forMessage:）
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 }
		{-} procedure sendStoryResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * 社交API统一回调接口
		 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
		 * \param message 响应的消息，目前支持‘SendStory’,‘AppInvitation’，‘AppChallenge’，‘AppGiftRequest’
		 }
		[MethodName('responseDidReceived:forMessage:')]
		{-} procedure responseDidReceivedforMessage(response:APIResponse{*};message:NSString{*});cdecl;
		
		{*
		 * post请求的上传进度
		 * \param tencentOAuth 返回回调的tencentOAuth对象
		 * \param bytesWritten 本次回调上传的数据字节数
		 * \param totalBytesWritten 总共已经上传的字节数
		 * \param totalBytesExpectedToWrite 总共需要上传的字节数
		 * \param userData 用户自定义数据
		 }
		[MethodName('tencentOAuth:didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:userData:')]
		{-} procedure tencentOAuthdidSendBodyDatatotalBytesWrittentotalBytesExpectedToWriteuserData(tencentOAuth:TencentOAuth{*};bytesWritten:NSInteger;totalBytesWritten:NSInteger;totalBytesExpectedToWrite:NSInteger;userData:id);cdecl;
		
		
		{*
		 * 通知第三方界面需要被关闭
		 * \param tencentOAuth 返回回调的tencentOAuth对象
		 * \param viewController 需要关闭的viewController
		 }
		[MethodName('tencentOAuth:doCloseViewController:')]
		{-} procedure tencentOAuthdoCloseViewController(tencentOAuth:TencentOAuth{*};viewController:UIViewController{*});cdecl;
		
	end;
	
	
	//#pragma mark - TencentWebViewDelegate(H5登录webview旋转方向回调)
	
	{*
	 * \brief TencentWebViewDelegate: H5登录webview旋转方向回调协议
	 *
	 * 第三方应用可以根据自己APP的旋转方向限制，通过此协议设置
	 }
	TencentWebViewDelegate=interface(IObjectiveC)
		['{CEA9E271-66E4-4117-84F4-7BCE7A4A61F4}']
		//@optional
		{-} function tencentWebViewShouldAutorotateToInterfaceOrientation(toInterfaceOrientation:UIInterfaceOrientation):Boolean;cdecl;
		{-} function tencentWebViewSupportedInterfaceOrientationsWithWebkit:NSUInteger;cdecl;
		{-} function tencentWebViewShouldAutorotateWithWebkit:Boolean;cdecl;
	end;
	
	TOntencentWebViewShouldAutorotateToInterfaceOrientation=function(toInterfaceOrientation:UIInterfaceOrientation):Boolean of object;
	TOntencentWebViewSupportedInterfaceOrientationsWithWebkit=function():NSUInteger of object;
	TOntencentWebViewShouldAutorotateWithWebkit=function():Boolean of object;
	
	TTencentWebViewDelegate=class(TOCLocal,TencentWebViewDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OntencentWebViewShouldAutorotateToInterfaceOrientation:TOntencentWebViewShouldAutorotateToInterfaceOrientation;
		OntencentWebViewSupportedInterfaceOrientationsWithWebkit:TOntencentWebViewSupportedInterfaceOrientationsWithWebkit;
		OntencentWebViewShouldAutorotateWithWebkit:TOntencentWebViewShouldAutorotateWithWebkit;
	
		//@optional
		{-} function tencentWebViewShouldAutorotateToInterfaceOrientation(toInterfaceOrientation:UIInterfaceOrientation):Boolean;cdecl;
		{-} function tencentWebViewSupportedInterfaceOrientationsWithWebkit:NSUInteger;cdecl;
		{-} function tencentWebViewShouldAutorotateWithWebkit:Boolean;cdecl;
	end;

{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function TencentOAuth_FakeLoader : TencentOAuth; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TencentOAuth';
{$O+}

{ TTencentLoginDelegate }

constructor TTencentLoginDelegate.Create;
begin
	Inherited Create;
end;

destructor TTencentLoginDelegate.Destroy;
begin
	Inherited;
end;

procedure  TTencentLoginDelegate.tencentDidLogin();
begin
	if Assigned(OntencentDidLogin) then
	begin
		OntencentDidLogin();
	end;
end;

procedure  TTencentLoginDelegate.tencentDidNotLogin(cancelled:Boolean);
begin
	if Assigned(OntencentDidNotLogin) then
	begin
		OntencentDidNotLogin(cancelled);
	end;
end;

procedure  TTencentLoginDelegate.tencentDidNotNetWork();
begin
	if Assigned(OntencentDidNotNetWork) then
	begin
		OntencentDidNotNetWork();
	end;
end;

function  TTencentLoginDelegate.getAuthorizedPermissionswithExtraParams(permissions:NSArray{*};extraParams:PNSDictionary{*}):NSArray{*};
begin
	if Assigned(OngetAuthorizedPermissionswithExtraParams) then
	begin
		Result:=OngetAuthorizedPermissionswithExtraParams(permissions,extraParams);
	end;
end;


{ TTencentSessionDelegate }

constructor TTencentSessionDelegate.Create;
begin
	Inherited Create;
end;

destructor TTencentSessionDelegate.Destroy;
begin
	Inherited;
end;

procedure  TTencentSessionDelegate.tencentDidLogout();
begin
	if Assigned(OntencentDidLogout) then
	begin
		OntencentDidLogout();
	end;
end;

function  TTencentSessionDelegate.tencentNeedPerformIncrAuthwithPermissions(tencentOAuth:TencentOAuth{*};permissions:NSArray{*}):Boolean;
begin
	if Assigned(OntencentNeedPerformIncrAuthwithPermissions) then
	begin
		Result:=OntencentNeedPerformIncrAuthwithPermissions(tencentOAuth,permissions);
	end;
end;

function  TTencentSessionDelegate.tencentNeedPerformReAuth(tencentOAuth:TencentOAuth{*}):Boolean;
begin
	if Assigned(OntencentNeedPerformReAuth) then
	begin
		Result:=OntencentNeedPerformReAuth(tencentOAuth);
	end;
end;

procedure  TTencentSessionDelegate.tencentDidUpdate(tencentOAuth:TencentOAuth{*});
begin
	if Assigned(OntencentDidUpdate) then
	begin
		OntencentDidUpdate(tencentOAuth);
	end;
end;

procedure  TTencentSessionDelegate.tencentFailedUpdate(reason:UpdateFailType);
begin
	if Assigned(OntencentFailedUpdate) then
	begin
		OntencentFailedUpdate(reason);
	end;
end;

procedure  TTencentSessionDelegate.getUserInfoResponse(response:APIResponse{*});
begin
	if Assigned(OngetUserInfoResponse) then
	begin
		OngetUserInfoResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.getListAlbumResponse(response:APIResponse{*});
begin
	if Assigned(OngetListAlbumResponse) then
	begin
		OngetListAlbumResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.getListPhotoResponse(response:APIResponse{*});
begin
	if Assigned(OngetListPhotoResponse) then
	begin
		OngetListPhotoResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.checkPageFansResponse(response:APIResponse{*});
begin
	if Assigned(OncheckPageFansResponse) then
	begin
		OncheckPageFansResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.addShareResponse(response:APIResponse{*});
begin
	if Assigned(OnaddShareResponse) then
	begin
		OnaddShareResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.addAlbumResponse(response:APIResponse{*});
begin
	if Assigned(OnaddAlbumResponse) then
	begin
		OnaddAlbumResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.uploadPicResponse(response:APIResponse{*});
begin
	if Assigned(OnuploadPicResponse) then
	begin
		OnuploadPicResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.addOneBlogResponse(response:APIResponse{*});
begin
	if Assigned(OnaddOneBlogResponse) then
	begin
		OnaddOneBlogResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.addTopicResponse(response:APIResponse{*});
begin
	if Assigned(OnaddTopicResponse) then
	begin
		OnaddTopicResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.setUserHeadpicResponse(response:APIResponse{*});
begin
	if Assigned(OnsetUserHeadpicResponse) then
	begin
		OnsetUserHeadpicResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.getVipInfoResponse(response:APIResponse{*});
begin
	if Assigned(OngetVipInfoResponse) then
	begin
		OngetVipInfoResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.getVipRichInfoResponse(response:APIResponse{*});
begin
	if Assigned(OngetVipRichInfoResponse) then
	begin
		OngetVipRichInfoResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.sendStoryResponse(response:APIResponse{*});
begin
	if Assigned(OnsendStoryResponse) then
	begin
		OnsendStoryResponse(response);
	end;
end;

procedure  TTencentSessionDelegate.responseDidReceivedforMessage(response:APIResponse{*};message:NSString{*});
begin
	if Assigned(OnresponseDidReceivedforMessage) then
	begin
		OnresponseDidReceivedforMessage(response,message);
	end;
end;

procedure  TTencentSessionDelegate.tencentOAuthdidSendBodyDatatotalBytesWrittentotalBytesExpectedToWriteuserData(tencentOAuth:TencentOAuth{*};bytesWritten:NSInteger;totalBytesWritten:NSInteger;totalBytesExpectedToWrite:NSInteger;userData:id);
begin
	if Assigned(OntencentOAuthdidSendBodyDatatotalBytesWrittentotalBytesExpectedToWriteuserData) then
	begin
		OntencentOAuthdidSendBodyDatatotalBytesWrittentotalBytesExpectedToWriteuserData(tencentOAuth,bytesWritten,totalBytesWritten,totalBytesExpectedToWrite,userData);
	end;
end;

procedure  TTencentSessionDelegate.tencentOAuthdoCloseViewController(tencentOAuth:TencentOAuth{*};viewController:UIViewController{*});
begin
	if Assigned(OntencentOAuthdoCloseViewController) then
	begin
		OntencentOAuthdoCloseViewController(tencentOAuth,viewController);
	end;
end;


{ TTencentWebViewDelegate }

constructor TTencentWebViewDelegate.Create;
begin
	Inherited Create;
end;

destructor TTencentWebViewDelegate.Destroy;
begin
	Inherited;
end;

function  TTencentWebViewDelegate.tencentWebViewShouldAutorotateToInterfaceOrientation(toInterfaceOrientation:UIInterfaceOrientation):Boolean;
begin
	if Assigned(OntencentWebViewShouldAutorotateToInterfaceOrientation) then
	begin
		Result:=OntencentWebViewShouldAutorotateToInterfaceOrientation(toInterfaceOrientation);
	end;
end;

function  TTencentWebViewDelegate.tencentWebViewSupportedInterfaceOrientationsWithWebkit():NSUInteger;
begin
	if Assigned(OntencentWebViewSupportedInterfaceOrientationsWithWebkit) then
	begin
		Result:=OntencentWebViewSupportedInterfaceOrientationsWithWebkit();
	end;
end;

function  TTencentWebViewDelegate.tencentWebViewShouldAutorotateWithWebkit():Boolean;
begin
	if Assigned(OntencentWebViewShouldAutorotateWithWebkit) then
	begin
		Result:=OntencentWebViewShouldAutorotateWithWebkit();
	end;
end;



{$ENDIF}

end.

