///
/// \file sdkdef.h
/// \brief SDK����س�������
///
/// Created by Tencent on 12-12-25.
/// Copyright (c) 2012�� Tencent. All rights reserved.
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
	 * \brief ����sdk��log�ȼ�
	 }
	TCOLogLevel=(
	    TCOLogLevel_Disabled = -1,   // �ر�����log
	    TCOLogLevel_Error = 0,
	    TCOLogLevel_Warning,
	    TCOLogLevel_Info,
	    TCOLogLevel_Debug//,
	);
	
	{*
	 * \brief �ֻ�qq�ĵ�ǰ�汾
	 }
	QQVersion=(
	    kQQUninstall,
	    kQQVersion3_0,
	    kQQVersion4_0,      //֧��sso��½
	    kQQVersion4_2_1,    //ios7����
	    kQQVersion4_5,      //4.5�汾��wpa�Ự
	    kQQVersion4_6,      //4.6�汾��sso��½����ͨ���л�
	    kQQVersion4_7//,      //4.7�汾 ��ȷ����֧����ʲô��������
	);
	
	{*
	 * \brief APIResponse.retCode���ܵ�ö�ٳ���
	 }
	REPONSE_RESULT=(
		URLREQUEST_SUCCEED = 0, // /**< ��������ɹ������������������ҷ������������ݸ�ʽ��ȷ
//	                             * \note �������������ҵ�����ʧ�ܵ����������û����Ȩ��ԭ����
//	                             */
		URLREQUEST_FAILED = 1//,  // /**< �����쳣������������ص����ݸ�ʽ����ȷ�����޷����� */
	);
	
	{*
	 * \brief ������Ȩʧ��ԭ��
	 *
	 * \note ������Ȩʧ�ܲ�Ӱ��ԭtoken����Ч�ԣ�ԭtoken��ʧЧ��������⣩
	 }
	UpdateFailType=Integer;
  UpdateFailType_=(
	    kUpdateFailUnknown = 1,  ///< δ֪ԭ��
	    kUpdateFailUserCancel,   ///< �û�ȡ��
	    kUpdateFailNetwork//,      ///< ��������
	);
	
	{*
	 * \brief ��װ���������صĽ��
	 *
	 * APIResponse���ڷ�װ��������ķ��ؽ�������������롢������Ϣ��ԭʼ���������Լ��������ݵ�json��ʽ�ֵ�
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
		 * ��������ϸ������\n
		 * detailRetCode��Ҫ�������ֲ�ͬ�Ĵ���������μ�\ref OpenSDKError
		 }
		function detailRetCode:Integer;cdecl;
		procedure setDetailRetCode(detailRetCode:Integer);cdecl;
		
		{*
		 * ���������Ƿ�ɹ��ʹ���������Լ����������ص����ݸ�ʽ�Ƿ���ȷ\n
		 * retCode����ȡֵ�ɲο�\ref REPONSE_RESULT
		 }
		function retCode:Integer;cdecl;
		procedure setRetCode(retCode:Integer);cdecl;
		
		{*
		 * ���������Ӧ�ĵ������кţ������ڲ�����
		 }
		function seq:Integer;cdecl;
		procedure setSeq(seq:Integer);cdecl;
		
		{*
		 * ������ʾ��
		 }
		function errorMsg:NSString{*};cdecl;
		procedure setErrorMsg(errorMsg:NSString{*});cdecl;
		
		{*
		 * �������������ݵ�json��ʽ�ֵ�\n
		 * �ֵ��ھ�������������ͺ�����ο�\ref api_spec
		 }
		function jsonResponse:PNSDictionary{*};cdecl;
		procedure setJsonResponse(jsonResponse:PNSDictionary{*});cdecl;
		
		{*
		 * ���������ص�ԭʼ�����ַ���
		 }
		function message:NSString{*};cdecl;
		procedure setMessage(message:NSString{*});cdecl;
		
		{*
		 * �û���������
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
//	 * �û��Զ���ı����ֶ�
//	 }
//	{FOUNDATION_EXTERN NSString *}PARAM_USER_DATA=;
//
//	{*
//	 * \name Ӧ����������ֶζ���
//	 }
//	///@{
//
//	{* Ӧ������չʾͼƬurl��key }
//	{FOUNDATION_EXTERN NSString *}PARAM_APP_ICON=;
//
//	{* Ӧ�����������ı���key }
//	{FOUNDATION_EXTERN NSString *}PARAM_APP_DESC=;
//
//	{* Ӧ����������б��key }
//	{FOUNDATION_EXTERN NSString *}PARAM_APP_INVITED_OPENIDS=;
//
//	///@}
//
//	{*
//	 * \name sendStory�·�������ֶζ���
//	 }
//	///@{
//
//	{* Ԥ����������б��key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_RECEIVER=;
//
//	{* ����feeds�����key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_TITLE=;
//
//	{* ����feeds�������ݵ�key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_COMMENT=;
//
//	{* ����feedsժҪ��key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_SUMMARY=;
//
//	{* ����feedsչʾͼƬurl��key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_IMAGE=;
//
//	{* ����feeds��ת����url��key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_URL=;
//
//	{* ����feeds�������Ĭ����Ϊ��key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SENDSTORY_ACT=;
//
//	///@}

	{*
	 * \name ����ͷ������ֶζ���
	 }
	///@{

//	{* ͷ��ͼƬ���ݵ�key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SETUSERHEAD_PIC=;
//
//	{* ͷ��ͼƬ�ļ�����key }
//	{FOUNDATION_EXTERN NSString *}PARAM_SETUSERHEAD_FILENAME=;
//
//	///@}
//
//	{*
//	 * \name �������������ݵĲ����ֶζ���
//	 }
//	///@{
//
//	{* �������������key }
//	{FOUNDATION_EXTERN NSString *}PARAM_RETCODE=;
//
//	{* ���������ش�����Ϣ��key }
//	{FOUNDATION_EXTERN NSString *}PARAM_MESSAGE=;
//
//	{* ���������ض������ݵ�key }
//	{FOUNDATION_EXTERN NSString *}PARAM_DATA=;
//
//	///@}
//
//	{*
//	 * \name ������Ϣ��س�������
//	 }
//	///@{
//
//	{* ��ϸ������Ϣ�ֵ��ж�����Ϣ��key }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorKeyExtraInfo=;
//
//	{* ��ϸ������Ϣ�ֵ��з������key }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorKeyRetCode=;
//
//	{* ��ϸ������Ϣ�ֵ��д�������key }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorKeyMsg=;
//
//	{* ��֧�ֵĽӿ� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgUnsupportedAPI=;
//
//	{* �����ɹ� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgSuccess=;
//
//	{* δ֪���� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgUnknown=;
//
//	{* �û�ȡ�� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgUserCancel=;
//
//	{* �����µ�¼ }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgReLogin=;
//
//	{* Ӧ��û�в���Ȩ�� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgOperationDeny=;
//
//	{* �����쳣��û������ }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgNetwork=;
//
//	{* URL��ʽ��Э����� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgURL=;
//
//	{* �������ݳ��� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgDataParse=;
//
//	{* ����������� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgParam=;
//
//	{* ���ӳ�ʱ }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgTimeout=;
//
//	{* ��ȫ���� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgSecurity=;
//
//	{* �ļ���д���� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgIO=;
//
//	{* �������˴��� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgServer=;
//
//	{* ҳ����� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgWebPage=;
//
//	{* ����ͷ��ͼƬ���� }
//	{FOUNDATION_EXTERN NSString *}TCOpenSDKErrorMsgUserHeadPicLarge=;
//
//	///@}
	
	{*
	 * \brief SDK������ϸ������
	 }
	OpenSDKError=(
	    kOpenSDKInvalid = -1,                       ///< ��Ч�Ĵ�����
	    kOpenSDKErrorUnsupportedAPI = -2,                ///< ��֧�ֵĽӿ�
	//    /**
	//     * \name CommonErrorCode
	//     * ����������
	//     */
	//    ///@{
	    kOpenSDKErrorSuccess = 0,                   ///< �ɹ�
	    kOpenSDKErrorUnknown,                       ///< δ֪����
	    kOpenSDKErrorUserCancel,                    ///< �û�ȡ��
	    kOpenSDKErrorReLogin,                       ///< token��Ч���û�δ��Ȩ��ӦȨ����Ҫ���µ�¼
	    kOpenSDKErrorOperationDeny,                 ///< ������Ӧ��û�и�api������Ȩ��
	//    ///@}
	//    /**
	//     * \name NetworkRelatedErrorCode
	//     * ������ش�����
	//     */
	//    ///@{
	    kOpenSDKErrorNetwork,                       ///< ����������粻ͨ�����Ӳ���������
	    kOpenSDKErrorURL,                           ///< URL��ʽ��Э�����
	    kOpenSDKErrorDataParse,                     ///< ���ݽ������󣬷��������ص����ݽ�������
	    kOpenSDKErrorParam,                         ///< �����������
	    kOpenSDKErrorConnTimeout,                   ///< http���ӳ�ʱ
	    kOpenSDKErrorSecurity,                      ///< ��ȫ����
	    kOpenSDKErrorIO,                            ///< ���غ��ļ�IO����
	    kOpenSDKErrorServer,                        ///< �������˴���
	//    ///@}
	//    /**
	//     * \name WebViewRelatedError
	//     * webview���д���
	//     */
	//    ///@{
	    kOpenSDKErrorWebPage,                       ///< ҳ�����
	//    ///@}
	//    /**
	//     * \name SetUserHeadRelatedErrorCode
	//     * ����ͷ���Զ���������
	//     */
	//    ///@{
	    kOpenSDKErrorUserHeadPicLarge = $010000//,   ///< ͼƬ���� ����ͷ���Զ��������
	//    ///@}
	);
	
	{*
	 * \name SDK�汾(v1.3)֧�ֵ���Ȩ�б���
	 }
	///@{
	
	{* ����һ��˵˵��QQ�ռ�(<b>��Ҫ����Ȩ��</b>) }
	
	
	{* ����һƪ��־��QQ�ռ�(<b>��Ҫ����Ȩ��</b>) }
	
	
	{* ����һ��QQ�ռ����(<b>��Ҫ����Ȩ��</b>) }
	
	
	{* �ϴ�һ����Ƭ��QQ�ռ����(<b>��Ҫ����Ȩ��</b>) }
	
	
	{* ��ȡ�û�QQ�ռ�����б�(<b>��Ҫ����Ȩ��</b>) }
	
	
	{* ͬ������QQ�ռ䡢��Ѷ΢�� }
	
	
	{* ��֤�Ƿ���֤�ռ��˿ }
	
	
	{* ��ȡ��¼�û��Լ�����ϸ��Ϣ }
	
	
	{* ��ȡ�����û�����ϸ��Ϣ }
	
	
	{* ��ȡ��Ա�û�������Ϣ }
	
	
	{* ��ȡ��Ա�û���ϸ��Ϣ }
	
	
	{* ��ȡ�û���Ϣ }
	
	
	{* �ƶ��˻�ȡ�û���Ϣ }
	
	///@}
	
	
	{*
	 * \name CGI�ӿ���ز������Ͷ���
	 }
	///@{
	
	{* ������ַ������Ͳ��� }
	//*
  TCRequiredStr=NSString;
	
	{* �����UIImage���Ͳ��� }
	//*
  TCRequiredImage=UIImage;
	
	{* ��������Ͳ��� }
	TCRequiredInt=NSInteger;
	
	{* ������������� }
	//*
  TCRequiredNumber=NSNumber;
	
	{* �����NSData���� }
	//*
  TCRequiredData=NSData;
	
	{* ��ѡ���ַ������Ͳ��� }
	//*
  TCOptionalStr=NSString;
	
	{* ��ѡ��UIImage���Ͳ��� }
	//*
  TCOptionalImage=UIImage;
	
	{* ��ѡ�����Ͳ��� }
	TCOptionalInt=NSInteger;
	
	{* ��ѡ���������� }
	//*
  TCOptionalNumber=NSNumber;
	
	{* ��ѡ�Ĳ������Ͳ��� }
	TCRequiredId=id;
	///@}
	
	
	{*
	 * \brief CGI����Ĳ����ֵ��װ��������
	 *
	 * ����Ӧ���Ե�ֵ��key-value����ʽ���浽�����ֵ���
	 }
	TCAPIRequest=interface(NSMutableDictionary)//
	['{4C974262-3C27-4169-9035-779FC15E3E13}']
		
		{* CGI�����URL��ַ }
		function apiURL:NSURL{*};cdecl;
		procedure setApiURL(apiURL:NSURL{*});cdecl;
		
		{* CGI����ʽ��"GET"��"POST" }
		function method:NSString{*};cdecl;
		procedure setMethod(method:NSString{*});cdecl;
		
		{*
		 * API�����еı����ֶΣ��������������ֵ�֧�ֵ����ͣ��ٵ�����ɺ����ظ����÷�
		 }
		function paramUserData:TCRequiredId;cdecl;
		procedure setParamUserData(paramUserData:TCRequiredId);cdecl;
		
		{*
		 * APIResponse,API�ķ��ؽ��
		 }
		function response:APIResponse{*};cdecl;
		procedure setResponse(response:APIResponse{*});cdecl;
		
		{* ȡ����Ӧ��CGI�������� }
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

