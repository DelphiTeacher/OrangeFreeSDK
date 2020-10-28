///
/// \file sdkdef.h
/// \brief SDK中相关常量定义
///
/// Created by Tencent on 12-12-25.
/// Copyright (c) 2012年 Tencent. All rights reserved.
///

unit sdkdef_iOSApi;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.UIKit,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;
	PNSDictionary=Pointer;//PNSDictionary=Pointer of NSDictionary; ILocalObject(NSDictionary).GetObjectID

	
	{*
	 * \brief 设置sdk的log等级
	 }
	TCOLogLevel=(
	    TCOLogLevel_Disabled = -1,   // 关闭所有log
	    TCOLogLevel_Error = 0,
	    TCOLogLevel_Warning,
	    TCOLogLevel_Info,
	    TCOLogLevel_Debug//,
	);
	
	{*
	 * \brief 手机qq的当前版本
	 }
	QQVersion=(
	    kQQUninstall,
	    kQQVersion3_0,
	    kQQVersion4_0,      //支持sso登陆
	    kQQVersion4_2_1,    //ios7兼容
	    kQQVersion4_5,      //4.5版本，wpa会话
	    kQQVersion4_6,      //4.6版本，sso登陆信令通道切换
	    kQQVersion4_7//,      //4.7版本 不确定新支持了什么样的属性
	);
	
	{*
	 * \brief APIResponse.retCode可能的枚举常量
	 }
	REPONSE_RESULT=(
		URLREQUEST_SUCCEED = 0, // /**< 网络请求成功发送至服务器，并且服务器返回数据格式正确
//	                             * \note 这里包括所请求业务操作失败的情况，例如没有授权等原因导致
//	                             */
		URLREQUEST_FAILED = 1//,  // /**< 网络异常，或服务器返回的数据格式不正确导致无法解析 */
	);
	
	{*
	 * \brief 增量授权失败原因
	 *
	 * \note 增量授权失败不影响原token的有效性（原token已失效的情况除外）
	 }
	UpdateFailType=Integer;
  UpdateFailType_=(
	    kUpdateFailUnknown = 1,  ///< 未知原因
	    kUpdateFailUserCancel,   ///< 用户取消
	    kUpdateFailNetwork//,      ///< 网络问题
	);
	
	{*
	 * \brief 封装服务器返回的结果
	 *
	 * APIResponse用于封装所有请求的返回结果，包括错误码、错误信息、原始返回数据以及返回数据的json格式字典
	 }
	APIResponse=interface(NSObject)//<NSCoding>
	['{54FDAA56-9C6D-4454-AB21-CFC6ADA092E4}']
		//_detailRetCode:Integer;
		//_retCode:Integer;
		//_seq:Integer;
		//{}_errorMsg:NSString{*};
		//{}_jsonResponse:PNSDictionary{*};
		//{}_message:NSString{*};
		//_userData:id;
		
		{*
		 * 新增的详细错误码\n
		 * detailRetCode主要用于区分不同的错误情况，参见\ref OpenSDKError
		 }
		function detailRetCode:Integer;cdecl;
		procedure setDetailRetCode(detailRetCode:Integer);cdecl;
		
		{*
		 * 网络请求是否成功送达服务器，以及服务器返回的数据格式是否正确\n
		 * retCode具体取值可参考\ref REPONSE_RESULT
		 }
		function retCode:Integer;cdecl;
		procedure setRetCode(retCode:Integer);cdecl;
		
		{*
		 * 网络请求对应的递增序列号，方便内部管理
		 }
		function seq:Integer;cdecl;
		procedure setSeq(seq:Integer);cdecl;
		
		{*
		 * 错误提示语
		 }
		function errorMsg:NSString{*};cdecl;
		procedure setErrorMsg(errorMsg:NSString{*});cdecl;
		
		{*
		 * 服务器返回数据的json格式字典\n
		 * 字典内具体参数的命名和含义请参考\ref api_spec
		 }
		function jsonResponse:PNSDictionary{*};cdecl;
		procedure setJsonResponse(jsonResponse:PNSDictionary{*});cdecl;
		
		{*
		 * 服务器返回的原始数据字符串
		 }
		function message:NSString{*};cdecl;
		procedure setMessage(message:NSString{*});cdecl;
		
		{*
		 * 用户保留数据
		 }
		function userData:id;cdecl;
		procedure setUserData(userData:id);cdecl;
		
	end;
	
	APIResponseClass=interface(NSObjectClass)//<NSCoding>
	['{043DA1A6-F4B1-4099-9CC7-CAACFC1878B9}']
	end;
	
	TAPIResponse=class(TOCGenericImport<APIResponseClass,APIResponse>)
	end;
	
	
//	{*
//	 * 用户自定义的保留字段
//	 }
//	{FOUNDATION_EXTERN NSString *}PARAM_USER_DATA=;
//
//	{*
//	 * \name 应用邀请参数字段定义
//	 }
//	///@{
//
//	{* 应用邀请展示图片url的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_APP_ICON=;
//
//	{* 应用邀请描述文本的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_APP_DESC=;
//
//	{* 应用邀请好友列表的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_APP_INVITED_OPENIDS=;
//
//	///@}
//
//	{*
//	 * \name sendStory新分享参数字段定义
//	 }
//	///@{
//
//	{* 预填入接受人列表的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_RECEIVER=;
//
//	{* 分享feeds标题的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_TITLE=;
//
//	{* 分享feeds评论内容的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_COMMENT=;
//
//	{* 分享feeds摘要的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_SUMMARY=;
//
//	{* 分享feeds展示图片url的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_IMAGE=;
//
//	{* 分享feeds跳转链接url的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_URL=;
//
//	{* 分享feeds点击操作默认行为的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_ACT=;
//
//	///@}

	{*
	 * \name 设置头像参数字段定义
	 }
	///@{

//	{* 头像图片数据的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SETUSERHEAD_PIC=;
//
//	{* 头像图片文件名的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SETUSERHEAD_FILENAME=;
//
//	///@}
//
//	{*
//	 * \name 服务器返回数据的参数字段定义
//	 }
//	///@{
//
//	{* 服务器返回码的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_RETCODE=;
//
//	{* 服务器返回错误信息的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_MESSAGE=;
//
//	{* 服务器返回额外数据的key }
//	{FOUNDATION_EXTERN NSString *}PARAM_DATA=;
//
//	///@}
//
//	{*
//	 * \name 错误信息相关常量定义
//	 }
//	///@{
//
//	{* 详细错误信息字典中额外信息的key }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorKeyExtraInfo=;
//
//	{* 详细错误信息字典中返回码的key }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorKeyRetCode=;
//
//	{* 详细错误信息字典中错误语句的key }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorKeyMsg=;
//
//	{* 不支持的接口 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgUnsupportedAPI=;
//
//	{* 操作成功 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgSuccess=;
//
//	{* 未知错误 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgUnknown=;
//
//	{* 用户取消 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgUserCancel=;
//
//	{* 请重新登录 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgReLogin=;
//
//	{* 应用没有操作权限 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgOperationDeny=;
//
//	{* 网络异常或没有网络 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgNetwork=;
//
//	{* URL格式或协议错误 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgURL=;
//
//	{* 解析数据出错 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgDataParse=;
//
//	{* 传入参数有误 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgParam=;
//
//	{* 连接超时 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgTimeout=;
//
//	{* 安全问题 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgSecurity=;
//
//	{* 文件读写错误 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgIO=;
//
//	{* 服务器端错误 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgServer=;
//
//	{* 页面错误 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgWebPage=;
//
//	{* 设置头像图片过大 }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgUserHeadPicLarge=;
//
//	///@}
	
	{*
	 * \brief SDK新增详细错误常量
	 }
	OpenSDKError=(
	    kOpenSDKInvalid = -1,                       ///< 无效的错误码
	    kOpenSDKErrorUnsupportedAPI = -2,                ///< 不支持的接口
	//    /**
	//     * \name CommonErrorCode
	//     * 公共错误码
	//     */
	//    ///@{
	    kOpenSDKErrorSuccess = 0,                   ///< 成功
	    kOpenSDKErrorUnknown,                       ///< 未知错误
	    kOpenSDKErrorUserCancel,                    ///< 用户取消
	    kOpenSDKErrorReLogin,                       ///< token无效或用户未授权相应权限需要重新登录
	    kOpenSDKErrorOperationDeny,                 ///< 第三方应用没有该api操作的权限
	//    ///@}
	//    /**
	//     * \name NetworkRelatedErrorCode
	//     * 网络相关错误码
	//     */
	//    ///@{
	    kOpenSDKErrorNetwork,                       ///< 网络错误，网络不通或连接不到服务器
	    kOpenSDKErrorURL,                           ///< URL格式或协议错误
	    kOpenSDKErrorDataParse,                     ///< 数据解析错误，服务器返回的数据解析出错
	    kOpenSDKErrorParam,                         ///< 传入参数错误
	    kOpenSDKErrorConnTimeout,                   ///< http连接超时
	    kOpenSDKErrorSecurity,                      ///< 安全问题
	    kOpenSDKErrorIO,                            ///< 下载和文件IO错误
	    kOpenSDKErrorServer,                        ///< 服务器端错误
	//    ///@}
	//    /**
	//     * \name WebViewRelatedError
	//     * webview特有错误
	//     */
	//    ///@{
	    kOpenSDKErrorWebPage,                       ///< 页面错误
	//    ///@}
	//    /**
	//     * \name SetUserHeadRelatedErrorCode
	//     * 设置头像自定义错误码段
	//     */
	//    ///@{
	    kOpenSDKErrorUserHeadPicLarge = $010000//,   ///< 图片过大 设置头像自定义错误码
	//    ///@}
	);
	
	{*
	 * \name SDK版本(v1.3)支持的授权列表常量
	 }
	///@{
	
	{* 发表一条说说到QQ空间(<b>需要申请权限</b>) }
	
	
	{* 发表一篇日志到QQ空间(<b>需要申请权限</b>) }
	
	
	{* 创建一个QQ空间相册(<b>需要申请权限</b>) }
	
	
	{* 上传一张照片到QQ空间相册(<b>需要申请权限</b>) }
	
	
	{* 获取用户QQ空间相册列表(<b>需要申请权限</b>) }
	
	
	{* 同步分享到QQ空间、腾讯微博 }
	
	
	{* 验证是否认证空间粉丝 }
	
	
	{* 获取登录用户自己的详细信息 }
	
	
	{* 获取其他用户的详细信息 }
	
	
	{* 获取会员用户基本信息 }
	
	
	{* 获取会员用户详细信息 }
	
	
	{* 获取用户信息 }
	
	
	{* 移动端获取用户信息 }
	
	///@}
	
	
	{*
	 * \name CGI接口相关参数类型定义
	 }
	///@{
	
	{* 必填的字符串类型参数 }
	//*
  TCRequiredStr=NSString;
	
	{* 必填的UIImage类型参数 }
	//*
  TCRequiredImage=UIImage;
	
	{* 必填的整型参数 }
	TCRequiredInt=NSInteger;
	
	{* 必填的数字类型 }
	//*
  TCRequiredNumber=NSNumber;
	
	{* 必填的NSData参数 }
	//*
  TCRequiredData=NSData;
	
	{* 可选的字符串类型参数 }
	//*
  TCOptionalStr=NSString;
	
	{* 可选的UIImage类型参数 }
	//*
  TCOptionalImage=UIImage;
	
	{* 可选的整型参数 }
	TCOptionalInt=NSInteger;
	
	{* 可选的数字类型 }
	//*
  TCOptionalNumber=NSNumber;
	
	{* 可选的不定类型参数 }
	TCRequiredId=id;
	///@}
	
	
	{*
	 * \brief CGI请求的参数字典封装辅助基类
	 *
	 * 将相应属性的值以key-value的形式保存到参数字典中
	 }
	TCAPIRequest=interface(NSMutableDictionary)//
	['{4C974262-3C27-4169-9035-779FC15E3E13}']
		
		{* CGI请求的URL地址 }
		function apiURL:NSURL{*};cdecl;
		procedure setApiURL(apiURL:NSURL{*});cdecl;
		
		{* CGI请求方式："GET"，"POST" }
		function method:NSString{*};cdecl;
		procedure setMethod(method:NSString{*});cdecl;
		
		{*
		 * API参数中的保留字段，可以塞入任意字典支持的类型，再调用完成后会带回给调用方
		 }
		function paramUserData:TCRequiredId;cdecl;
		procedure setParamUserData(paramUserData:TCRequiredId);cdecl;
		
		{*
		 * APIResponse,API的返回结果
		 }
		function response:APIResponse{*};cdecl;
		procedure setResponse(response:APIResponse{*});cdecl;
		
		{* 取消相应的CGI请求任务 }
		{-} procedure cancel;cdecl;
		
	end;
	
	TCAPIRequestClass=interface(NSMutableDictionaryClass)//
	['{F2B3D593-B672-4987-9706-1223B5251A1E}']
	end;
	
	TTCAPIRequest=class(TOCGenericImport<TCAPIRequestClass,TCAPIRequest>)
	end;
	
	TCAPIRequestDelegate=interface(IObjectiveC)
		['{AE0CDCDF-7181-4F4A-9173-646ADC343D0E}']
		//@optional
		[MethodName('cgiRequest:didResponse:')]
		{-} procedure cgiRequestdidResponse(request:TCAPIRequest{*};response:APIResponse{*});cdecl;
		
	end;
	
	TOncgiRequestdidResponse=procedure(request:TCAPIRequest{*};response:APIResponse{*}) of object;
	
	TTCAPIRequestDelegate=class(TOCLocal,TCAPIRequestDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OncgiRequestdidResponse:TOncgiRequestdidResponse;
	
		//@optional
		[MethodName('cgiRequest:didResponse:')]
		{-} procedure cgiRequestdidResponse(request:TCAPIRequest{*};response:APIResponse{*});cdecl;
		
	end;
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function APIResponse_FakeLoader : APIResponse; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_APIResponse';
function TCAPIRequest_FakeLoader : TCAPIRequest; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TCAPIRequest';
{$O+}

{ TTCAPIRequestDelegate }

constructor TTCAPIRequestDelegate.Create;
begin
	Inherited Create;
end;

destructor TTCAPIRequestDelegate.Destroy;
begin
	Inherited;
end;

procedure  TTCAPIRequestDelegate.cgiRequestdidResponse(request:TCAPIRequest{*};response:APIResponse{*});
begin
	if Assigned(OncgiRequestdidResponse) then
	begin
		OncgiRequestdidResponse(request,response);
	end;
end;



{$ENDIF}

end.

