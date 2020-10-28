///
/// \file TencentOAuth.h
/// \brief QQ��������ƽ̨��Ȩ��¼����ؿ��Žӿ�ʵ����
///
/// Created by Tencent on 12-12-21.
/// Copyright (c) 2012�� Tencent. All rights reserved.
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
	
	//#pragma mark - TencentOAuth(��Ȩ��¼����ؿ��Žӿڵ���)
	
	{*
	 * \brief TencentOpenAPI��Ȩ��¼����ؿ��Žӿڵ���
	 *
	 * TencentOAuthʵ����Ȩ��¼�߼��Լ���ؿ��Žӿڵ��������
	 }
	TencentOAuth=interface(NSObject)//
	['{35A10A44-8EC6-4E3A-8A3F-D959A7B58460}']
		
		
		
		
		
		
		
		
		
		
		
		{* Access Tokenƾ֤�����ں������ʸ����Žӿ� }
		function accessToken:NSString{*};cdecl;
		procedure setAccessToken(accessToken:NSString{*});cdecl;
		
		{* Access Token��ʧЧ�� }
		function expirationDate:NSDate{*};cdecl;
		procedure setExpirationDate(expirationDate:NSDate{*});cdecl;
		
		{* ��ʵ�ֵĿ��ŽӿڵĻص�ί�ж��� }
		function sessionDelegate:PTencentSessionDelegate{id<TencentSessionDelegate>};cdecl;
		procedure setSessionDelegate(sessionDelegate:PTencentSessionDelegate{id<TencentSessionDelegate>});cdecl;
		
		{* ������Ӧ���ڿ������������õ�URLSchema�������������¼�������������Ӧ�� }
		function localAppId:NSString{*};cdecl;
		procedure setLocalAppId(localAppId:NSString{*});cdecl;
		
		{* �û���Ȩ��¼��Ը��û���Ψһ��ʶ }
		function openId:NSString{*};cdecl;
		procedure setOpenId(openId:NSString{*});cdecl;
		
		{* �û���¼�ɹ��������תҳ���ַ }
		function redirectURI:NSString{*};cdecl;
		procedure setRedirectURI(redirectURI:NSString{*});cdecl;
		
		{* ������Ӧ���ڻ�������ƽ̨�����appID }
		function appId:NSString{*};cdecl;
		procedure setAppId(appId:NSString{*});cdecl;
		
		{* ��Ҫ�ǻ������Ϸ����uin }
		function uin:NSString{*};cdecl;
		procedure setUin(uin:NSString{*});cdecl;
		
		{* ��Ҫ�ǻ������Ϸ���ü���Ʊ�� }
		function skey:NSString{*};cdecl;
		procedure setSkey(skey:NSString{*});cdecl;
		
		{* ��½͸�������� }
		function passData:PNSDictionary{*};cdecl;
		procedure setPassData(passData:PNSDictionary{*});cdecl;
		
		{* ��Ȩ��ʽ(Client Side Token����Server Side Code) }
		function authMode:TencentAuthMode;cdecl;
		procedure setAuthMode(authMode:TencentAuthMode);cdecl;
		
		{*
		 * ������õ�ǰsdk�İ汾��
		 * \return ����sdk�汾��
		 *}
		
		
		{*
		 * ������õ�ǰsdk��С�汾��
		 * \return ����sdkС�汾��
		 *}
		
		
		{*
		 * ������õ�ǰsdk���Ƿ񾫼��
		 * \return ����YES��ʾ�����
		 *}
		
		
		{* 
		 * ��Ҫ�����������ж��Ƿ��е�½�����𣬵��ǻ�û�й����ؽ�� 
		 * \return 
		 *          kTencentNotAuthorizeState:����Ȩ 
		 *          kTencentSSOAuthorizeState:���˷�����sso��Ȩ���޷���
		 *          kTencentWebviewAuthorzieState:���˷�����webview��Ȩ��δ����
		 *}
		
		
		{*
		 * ������õ�ǰ�ֻ�qq�İ汾��
		 * \return �����ֻ�qq�汾��
		 *}
		
		{*
		 * ��ʼ��TencentOAuth����
		 * \param appId ������Ӧ���ڻ�������ƽ̨�����Ψһ��ʶ
		 * \param delegate ������Ӧ�����ڽ������󷵻ؽ����ί�ж���
		 * \return ��ʼ�������Ȩ��¼����
		 }
		[MethodName('initWithAppId:andDelegate:')]
		{-} function initWithAppIdandDelegate(appId:NSString{*};delegate:PTencentSessionDelegate{id<TencentSessionDelegate>}):id;cdecl;
		
		
		{*
		 * �ж��û��ֻ����Ƿ�װ�ֻ�QQ
		 * \return YES:��װ NO:û��װ
		 }
		
		{*
		 * �ж��û��ֻ��ϵ��ֻ�QQ�Ƿ�֧��SSO��¼
		 * \return YES:֧�� NO:��֧��
		 }
		
		{*
		 * �ж��û��ֻ����Ƿ�װ�ֻ�QZone
		 * \return YES:��װ NO:û��װ
		 }
		
		{*
		 * �ж��û��ֻ��ϵ��ֻ�QZone�Ƿ�֧��SSO��¼
		 * \return YES:֧�� NO:��֧��
		 }
		
		{*
		 * ��¼��Ȩ
		 *
		 * \param permissions ��Ȩ��Ϣ��
		 }
		{-} function authorize(permissions:NSArray{*}):Boolean;cdecl;
		
		{*
		 * ��¼��Ȩ
		 * \param permissions ��Ȩ��Ϣ�б�
		 * \param bInSafari �Ƿ�ʹ��safari���е�¼.<b>IOS SDK 1.3�汾��ʼ�˲����ϳ�</b>
		 }
		[MethodName('authorize:inSafari:')]
		{-} function authorizeinSafari(permissions:NSArray{*};bInSafari:Boolean):Boolean;cdecl;
		
		{*
		 * ��¼��Ȩ
		 * \param permissions ��Ȩ��Ϣ�б�
		 * \param localAppId Ӧ��APPID
		 * \param bInSafari �Ƿ�ʹ��safari���е�¼.<b>IOS SDK 1.3�汾��ʼ�˲����ϳ�</b>
		 }
		[MethodName('authorize:localAppId:inSafari:')]
		{-} function authorizelocalAppIdinSafari(permissions:NSArray{*};localAppId:NSString{*};bInSafari:Boolean):Boolean;cdecl;
		
		{*
		 * ������Ȩ�����û�û��������Ӧ�ӿڵ��õ�Ȩ�ޣ���Ҫ�û�ȷ���Ƿ���Ȩ
		 * \param permissions ��������Ȩ����Ϣ�б�
		 * \return ������Ȩ�����Ƿ�ɹ�
		 }
		{-} function incrAuthWithPermissions(permissions:NSArray{*}):Boolean;cdecl;
		
		{*
		 * ������Ȩ����token�ϳ���ʧЧ���½ӿڵ���ʧ�ܣ����û�������Ȩ
		 * \param permissions ��Ȩ��Ϣ�б�ͬ��¼��Ȩ
		 * \return ��Ȩ�����Ƿ�ɹ�
		 }
		{-} function reauthorizeWithPermissions(permissions:NSArray{*}):Boolean;cdecl;
		
		{*
		 * (��̬����)����Ӧ������Э��
		 * \param url ��������Ӧ�ú���ʱ���߼�
		 * \return ��������YES��ʾ�ɹ���NO��ʾʧ��
		 }
		
		{*
		 * (��̬����)sdk�Ƿ���Դ���Ӧ������Э��
		 * \param url ��������Ӧ�ú���ʱ���߼�
		 * \return ��������YES��ʾ���� NO��ʾ����
		 }
		
		{*
		 * (��̬����)��ȡTencentOAuth���õ���һ�δ�����Ϣ
		 }
		
		{*
		 * ��Server Side Codeģʽ��Ȩ��¼ʱ��ͨ���˽ӿڻ�ȡ���ص�codeֵ;
		 * ��Client Side Tokenģʽ��Ȩ��¼ʱ�����Դ˽ӿڡ�
		 }
		{-} function getServerSideCode:NSString{*};cdecl;
		
		{*
		 * �˳���¼(�˳���¼��TecentOAuthʧЧ����Ҫ���³�ʼ��)
		 * \param delegate ������Ӧ�����ڽ������󷵻ؽ����ί�ж���
		 }
		{-} procedure logout(delegate:PTencentSessionDelegate{id<TencentSessionDelegate>});cdecl;
		
		{*
		 * �жϵ�¼̬�Ƿ���Ч
		 * \return ��������YES��ʾ��Ч��NO��ʾ��Ч�����û����µ�¼��Ȩ
		 }
		{-} function isSessionValid:Boolean;cdecl;
		
		{*
		 * ��ȡ�û�������Ϣ
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function getUserInfo:Boolean;cdecl;
		
		{*
		 * SDK����webviewʵ�ֶ������ʱ��������Ӧ�ÿ��Ը���Ӧ���Ƿ��ڰ������������������ÿ��أ�Ĭ��Ϊ�رգ�
		 * �ڰ��������Ӧ�õ��øýӿں󣬼���sdk����webview�Ķ������������أ������sdk��̨�İ���������
		 * ��ô��sdk��̨������У������ʧ�ܵ�����£�������ȳ��Բ�������webview���з���
		 }
		{-} procedure openSDKWebViewQQShareEnable;cdecl;
		
		
		{*
		 * ��ȡ�û�QZone����б�
		 * \attention ��\ref apply_perm
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function getListAlbum:Boolean;cdecl;
		
		{*
		 * ��ȡ�û�QZone��Ƭ�б�
		 * \attention ��\ref apply_perm
		 * \param params �����ֵ�,�ֵ�Ĺؼ��ֲμ�TencentOAuthObject.h�е�\ref TCListPhotoDic
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function getListPhotoWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		
		{*
		 * ����QZone
		 * \param params �����ֵ�,�ֵ�Ĺؼ��ֲμ�TencentOAuthObject.h�е�\ref TCAddShareDic 
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function addShareWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		
		{*
		 * �ϴ���Ƭ��QZoneָ�����
		 * \attention ��\ref apply_perm
		 * \param params �����ֵ�,�ֵ�Ĺؼ��ֲμ�TencentOAuthObject.h�е�\ref TCUploadPicDic
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function uploadPicWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		{*
		 * ��QZone����д���һ���µ����
		 * \attention ��\ref apply_perm
		 * \param params �����ֵ�,�ֵ�Ĺؼ��ֲμ�TencentOAuthObject.h�е�\ref TCAddAlbumDic
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function addAlbumWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		{*
		 * ����Ƿ���QZoneĳ���û��ķ�˿
		 * \param params �����ֵ�,�ֵ�Ĺؼ��ֲμ�TencentOAuthObject.h�е�\ref TCCheckPageFansDic
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function checkPageFansWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		{*
		 * ��QZone�з���һƪ��־
		 * \attention ��\ref apply_perm
		 * \param params �����ֵ�,�ֵ�Ĺؼ��ֲμ�TencentOAuthObject.h�е�\ref TCAddOneBlogDic
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function addOneBlogWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		{*
		 * ��QZone�з���һ��˵˵
		 * \attention ��\ref apply_perm
		 * \param params �����ֵ�,�ֵ�Ĺؼ��ֲμ�TencentOAuthObject.h�е�\ref TCAddTopicDic
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function addTopicWithParams(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		{*
		 * ����QQͷ�� ʹ��Ĭ�ϵ�Ч����������ͷ��Ľ���
		 * \attention ��\ref apply_perm
		 * \param params �����ֵ�,�ֵ�Ĺؼ��ֲμ�TencentOAuthObject.h�е�\ref TCSetUserHeadpic
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function setUserHeadpic(params:NSMutableDictionary{*}):Boolean;cdecl;
		
		
//		{*
//		 * ����QQͷ�� �᷵������ͷ���ɵ������Լ��������ĵ�����ʽ
//		 * \attention ��\ref apply_perm
//		 * \param params �����ֵ�,�ֵ�Ĺؼ��ֲμ�TencentOAuthObject.h�е�\ref TCSetUserHeadpic
//		 * \param viewController ����ͷ��Ľ���
//		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
//		 }
//		[MethodName('setUserHeadpic:andViewController:')]
//		{-} function setUserHeadpicandViewController(params:NSMutableDictionary{*};viewController:UIViewController *{*}):Boolean;cdecl;
//
		{*
		 * ��ȡQQ��Ա��Ϣ(�������Ƿ�ΪQQ��Ա,�Ƿ�Ϊ���QQ��Ա)
		 * \attention ��\ref apply_perm
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function getVipInfo:Boolean;cdecl;
		
		{*
		 * ��ȡQQ��Ա��ϸ��Ϣ
		 * \attention ��\ref apply_perm
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		{-} function getVipRichInfo:Boolean;cdecl;
		
		{*
		 * QZone�����������@��������ѣ���ɺ󽫴���responseDidReceived:forMessage:�ص���message����SendStory��
		 * \param params �����ֵ�
		 * \param fopenIdArray ������Ӧ��Ԥ���˺����б�������openid��ʶ
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		[MethodName('sendStory:friendList:')]
		{-} function sendStoryfriendList(params:NSMutableDictionary{*};fopenIdArray:NSArray{*}):Boolean;cdecl;
		
		{*
		 * ����Ӧ�����룬��ɺ󽫴���responseDidReceived:forMessage:�ص���message����AppInvitation��
		 * \param desc Ӧ�õ��������֣�������35�ַ������Ϊnil��@��������ʾĬ������
		 * \param imageUrl Ӧ�õ�ͼ�꣬���Ϊnil����@��������ʾĬ��ͼ��
		 * \param source ͸���������ɿ������Զ���ò�������
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		[MethodName('sendAppInvitationWithDescription:imageURL:source:')]
		{-} function sendAppInvitationWithDescriptionimageURLsource(desc:NSString{*};imageUrl:NSString{*};source:NSString{*}):Boolean;cdecl;
		
		{*
		 * ����PK���߷�����ҫ����ɺ󽫴���responseDidReceived:forMessage:�ص���message����AppChallenge��
		 * \param receiver ����ָ��һλ����PK������ҫ�ĺ��ѣ���д��OpenID����д���OpenID����ȡ��һ��
		 * \param type ���ͣ�"pk"���ߡ�brag��
		 * \param imageUrl ��ҫ/��ս����ͼ��URL
		 * \param message ��ҫ/��ս�е�����������������50���ַ��������������Զ��ض�
		 * \param source ͸���������ɿ������Զ���ò�������
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		[MethodName('sendChallenge:type:imageURL:message:source:')]
		{-} function sendChallengetypeimageURLmessagesource(receiver:NSString{*};_type:NSString{*};imageUrl:NSString{*};message:NSString{*};source:NSString{*}):Boolean;cdecl;
		
		{*
		 * ���ͻ������������ɺ󽫴���responseDidReceived:forMessage:�ص���message����AppGiftRequest��
		 * \param receiver ���ͻ�����������ĺ��ѵ�OpenID��֧����д�����OpenID֮��","�ָ���Ϊnilʱ�����û�ͨ������ѡ����ѡ�����
		 * \param exclude �û�ͨ������ѡ����ѡ����ѳ����£�ϣ���ų��ĺ��ѣ�����ʾ�ں���ѡ������
		 * \param specified �û�ͨ������ѡ����ѡ����ѳ����£�ϣ�����ֵ�ָ������
		 * \param only �Ƿ�ֻ��ʾspecifiedָ���ĺ���
		 * \param type ���ͣ�"request"���ߡ�freegift��
		 * \param title ���������������ƣ�������6���ַ�
		 * \param message ����������Ĭ�����ԣ�������35���������ڣ����������Զ��ض�
		 * \param imageUrl �����������ͼ��URL�������������Ĭ���ڵ�������ʾӦ�õ�icon
		 * \param source ͸���������ɿ������Զ���ò�������
		 * \return ��������YES��ʾAPI���óɹ���NO��ʾAPI����ʧ�ܣ���¼̬ʧ�ܣ����µ�¼
		 }
		[MethodName('sendGiftRequest:exclude:specified:only:type:title:message:imageURL:source:')]
		{-} function sendGiftRequestexcludespecifiedonlytypetitlemessageimageURLsource(receiver:NSString{*};exclude:NSString{*};specified:NSString{*};only:Boolean;_type:NSString{*};title:NSString{*};message:NSString{*};imageUrl:NSString{*};source:NSString{*}):Boolean;cdecl;
		
		
		{*
		 * �˳�ָ��API����
		 * \param userData �û�����ĳ��API��ʱ����ı�������
		 * \return ��������YES��ʾ�ɹ� NO��ʾʧ��
		 }
		{-} function cancel(userData:id):Boolean;cdecl;
		
		{*
		 * CGI�����񴴽��ӿ�
		 * \param apiURL CGI�����URL��ַ
		 * \param method CGI����ʽ��"GET"��"POST"
		 * \param params CGI��������ֵ�
		 * \param callback CGI�������Ļص��ӿڶ���
		 * \return CGI��������ʵ��������ȡ�����񣬷���nil�������񴴽�ʧ��
		 }
		[MethodName('cgiRequestWithURL:method:params:callback:')]
		{-} function cgiRequestWithURLmethodparamscallback(apiURL:NSURL{*};method:NSString{*};params:PNSDictionary{*};callback:PTCAPIRequestDelegate{id<TCAPIRequestDelegate>}):TCAPIRequest{*};cdecl;
		
		{*
		 * TencentOpenApi��������ͳһ�ӿ�
		 * \param request �����͵�����
		 * \param callback �����ͺ�Ļص���ַ
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
	
	//#pragma mark - TencentLoginDelegate(��Ȩ��¼�ص�Э��)
	
	{*
	 * \brief TencentLoginDelegate iOS Open SDK 1.3 API�ص�Э��
	 *
	 * ������Ӧ��ʵ�ֵ�¼�Ļص�Э��
	 }
	TencentLoginDelegate=interface(IObjectiveC)
		['{6E8FDC3F-C87D-46E9-A609-D66D78C7563C}']
		
		//@required
		
		{*
		 * ��¼�ɹ���Ļص�
		 }
		{-} procedure tencentDidLogin;cdecl;
		
		{*
		 * ��¼ʧ�ܺ�Ļص�
		 * \param cancelled �����û��Ƿ������˳���¼
		 }
		{-} procedure tencentDidNotLogin(cancelled:Boolean);cdecl;
		
		{*
		 * ��¼ʱ����������Ļص�
		 }
		{-} procedure tencentDidNotNetWork;cdecl;
		
		//@optional
		{*
		 * ��¼ʱȨ����Ϣ�Ļ��
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
		 * ��¼�ɹ���Ļص�
		 }
		{-} procedure tencentDidLogin;cdecl;
		
		{*
		 * ��¼ʧ�ܺ�Ļص�
		 * \param cancelled �����û��Ƿ������˳���¼
		 }
		{-} procedure tencentDidNotLogin(cancelled:Boolean);cdecl;
		
		{*
		 * ��¼ʱ����������Ļص�
		 }
		{-} procedure tencentDidNotNetWork;cdecl;
		
		//@optional
		{*
		 * ��¼ʱȨ����Ϣ�Ļ��
		 }
		[MethodName('getAuthorizedPermissions:withExtraParams:')]
		{-} function getAuthorizedPermissionswithExtraParams(permissions:NSArray{*};extraParams:PNSDictionary{*}):NSArray{*};cdecl;
		
	end;
	
	
	//#pragma mark - TencentSessionDelegate(���Žӿڻص�Э��)
	
	{*
	 * \brief TencentSessionDelegate iOS Open SDK 1.3 API�ص�Э��
	 *
	 * ������Ӧ����Ҫʵ��ÿ����Ҫ���õ�API�Ļص�Э��
	 }
	TencentSessionDelegate=interface(IObjectiveC)
		['{1D82EDD4-2A80-48DA-A6DE-273608968207}']
		
		
		
		//@optional
		
		{*
		 * �˳���¼�Ļص�
		 }
		{-} procedure tencentDidLogout;cdecl;
		
		{*
		 * ���û�δ������ӦȨ�޶���Ҫִ��������Ȩ�����û�����ĳ��api�ӿ�ʱ��������������ز���δ����Ȩ���򴥷��ûص�Э��ӿڣ��ɵ����������Ƿ���ת��������Ȩҳ�棬���û�������Ȩ��
		 * \param tencentOAuth ��¼��Ȩ����
		 * \param permissions ��������Ȩ��Ȩ���б�
		 * \return �Ƿ���Ȼ�ص�����ԭʼ��api��������
		 * \note ��ʵ�ָ�Э��ӿ���Ĭ��Ϊ������������Ȩ���̡�����Ҫ������Ȩ�����\ref TencentOAuth#incrAuthWithPermissions: \nע�⣺������Ȩʱ�û����ܻ��޸ĵ�¼���ʺ�
		 }
		[MethodName('tencentNeedPerformIncrAuth:withPermissions:')]
		{-} function tencentNeedPerformIncrAuthwithPermissions(tencentOAuth:TencentOAuth{*};permissions:NSArray{*}):Boolean;cdecl;
		
		{*
		 * [���߼�δʵ��]��tokenʧЧ����Ҫִ�����µ�¼��Ȩ�����û�����ĳ��api�ӿ�ʱ���������������tokenʧЧ���򴥷��ûص�Э��ӿڣ��ɵ����������Ƿ���ת����¼��Ȩҳ�棬���û�������Ȩ��
		 * \param tencentOAuth ��¼��Ȩ����
		 * \return �Ƿ���Ȼ�ص�����ԭʼ��api��������
		 * \note ��ʵ�ָ�Э��ӿ���Ĭ��Ϊ���������µ�¼��Ȩ���̡�����Ҫ���µ�¼��Ȩ�����\ref TencentOAuth#reauthorizeWithPermissions: \nע�⣺���µ�¼��Ȩʱ�û����ܻ��޸ĵ�¼���ʺ�
		 }
		{-} function tencentNeedPerformReAuth(tencentOAuth:TencentOAuth{*}):Boolean;cdecl;
		
		{*
		 * �û�ͨ��������Ȩ����������Ȩ��¼��token����Ч���޵���Ϣ�ѱ����¡�
		 * \param tencentOAuth token����Ч���޵���Ϣ���º����Ȩʵ������
		 * \note ������Ӧ��������ѱ����token����Ч���޵���Ϣ��
		 }
		{-} procedure tencentDidUpdate(tencentOAuth:TencentOAuth{*});cdecl;
		
		{*
		 * �û�������Ȩ��������ȡ�����������⵼����Ȩʧ��
		 * \param reason ��Ȩʧ��ԭ�򣬾���ʧ��ԭ��μ�sdkdef.h�ļ���\ref UpdateFailType
		 }
		{-} procedure tencentFailedUpdate(reason:UpdateFailType);cdecl;
		
		{*
		 * ��ȡ�û�������Ϣ�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/getUserInfoResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/getUserInfoResponse.exp fail
		 }
		{-} procedure getUserInfoResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * ��ȡ�û�QZone����б�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/getListAlbumResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/getListAlbumResponse.exp fail
		 }
		{-} procedure getListAlbumResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ��ȡ�û�QZone��Ƭ�б�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/getListPhotoResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/getListPhotoResponse.exp fail
		 }
		{-} procedure getListPhotoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ����Ƿ���QZoneĳ���û��ķ�˿�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/checkPageFansResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/checkPageFansResponse.exp fail
		 }
		{-} procedure checkPageFansResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ����QZone�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/addShareResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/addShareResponse.exp fail
		 }
		{-} procedure addShareResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ��QZone����д���һ���µ����ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/addAlbumResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/addAlbumResponse.exp fail
		 }
		{-} procedure addAlbumResponse(response:APIResponse{*});cdecl;
		
		{*
		 * �ϴ���Ƭ��QZoneָ�����ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/uploadPicResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/uploadPicResponse.exp fail
		 }
		{-} procedure uploadPicResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * ��QZone�з���һƪ��־�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/addOneBlogResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/addOneBlogResponse.exp fail
		 }
		{-} procedure addOneBlogResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ��QZone�з���һ��˵˵�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/addTopicResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/addTopicResponse.exp fail
		 }
		{-} procedure addTopicResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ����QQͷ��ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/setUserHeadpicResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/setUserHeadpicResponse.exp fail
		 }
		{-} procedure setUserHeadpicResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ��ȡQQ��Ա��Ϣ�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/getVipInfoResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/getVipInfoResponse.exp fail
		 }
		{-} procedure getVipInfoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ��ȡQQ��Ա��ϸ��Ϣ�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 }
		{-} procedure getVipRichInfoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * sendStory����Ļص����ѷ�����ʹ��responseDidReceived:forMessage:��
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 }
		{-} procedure sendStoryResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * �罻APIͳһ�ص��ӿ�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \param message ��Ӧ����Ϣ��Ŀǰ֧�֡�SendStory��,��AppInvitation������AppChallenge������AppGiftRequest��
		 }
		[MethodName('responseDidReceived:forMessage:')]
		{-} procedure responseDidReceivedforMessage(response:APIResponse{*};message:NSString{*});cdecl;
		
		{*
		 * post������ϴ�����
		 * \param tencentOAuth ���ػص���tencentOAuth����
		 * \param bytesWritten ���λص��ϴ��������ֽ���
		 * \param totalBytesWritten �ܹ��Ѿ��ϴ����ֽ���
		 * \param totalBytesExpectedToWrite �ܹ���Ҫ�ϴ����ֽ���
		 * \param userData �û��Զ�������
		 }
		[MethodName('tencentOAuth:didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:userData:')]
		{-} procedure tencentOAuthdidSendBodyDatatotalBytesWrittentotalBytesExpectedToWriteuserData(tencentOAuth:TencentOAuth{*};bytesWritten:NSInteger;totalBytesWritten:NSInteger;totalBytesExpectedToWrite:NSInteger;userData:id);cdecl;
		
		
		{*
		 * ֪ͨ������������Ҫ���ر�
		 * \param tencentOAuth ���ػص���tencentOAuth����
		 * \param viewController ��Ҫ�رյ�viewController
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
		 * �˳���¼�Ļص�
		 }
		{-} procedure tencentDidLogout;cdecl;
		
		{*
		 * ���û�δ������ӦȨ�޶���Ҫִ��������Ȩ�����û�����ĳ��api�ӿ�ʱ��������������ز���δ����Ȩ���򴥷��ûص�Э��ӿڣ��ɵ����������Ƿ���ת��������Ȩҳ�棬���û�������Ȩ��
		 * \param tencentOAuth ��¼��Ȩ����
		 * \param permissions ��������Ȩ��Ȩ���б�
		 * \return �Ƿ���Ȼ�ص�����ԭʼ��api��������
		 * \note ��ʵ�ָ�Э��ӿ���Ĭ��Ϊ������������Ȩ���̡�����Ҫ������Ȩ�����\ref TencentOAuth#incrAuthWithPermissions: \nע�⣺������Ȩʱ�û����ܻ��޸ĵ�¼���ʺ�
		 }
		[MethodName('tencentNeedPerformIncrAuth:withPermissions:')]
		{-} function tencentNeedPerformIncrAuthwithPermissions(tencentOAuth:TencentOAuth{*};permissions:NSArray{*}):Boolean;cdecl;
		
		{*
		 * [���߼�δʵ��]��tokenʧЧ����Ҫִ�����µ�¼��Ȩ�����û�����ĳ��api�ӿ�ʱ���������������tokenʧЧ���򴥷��ûص�Э��ӿڣ��ɵ����������Ƿ���ת����¼��Ȩҳ�棬���û�������Ȩ��
		 * \param tencentOAuth ��¼��Ȩ����
		 * \return �Ƿ���Ȼ�ص�����ԭʼ��api��������
		 * \note ��ʵ�ָ�Э��ӿ���Ĭ��Ϊ���������µ�¼��Ȩ���̡�����Ҫ���µ�¼��Ȩ�����\ref TencentOAuth#reauthorizeWithPermissions: \nע�⣺���µ�¼��Ȩʱ�û����ܻ��޸ĵ�¼���ʺ�
		 }
		{-} function tencentNeedPerformReAuth(tencentOAuth:TencentOAuth{*}):Boolean;cdecl;
		
		{*
		 * �û�ͨ��������Ȩ����������Ȩ��¼��token����Ч���޵���Ϣ�ѱ����¡�
		 * \param tencentOAuth token����Ч���޵���Ϣ���º����Ȩʵ������
		 * \note ������Ӧ��������ѱ����token����Ч���޵���Ϣ��
		 }
		{-} procedure tencentDidUpdate(tencentOAuth:TencentOAuth{*});cdecl;
		
		{*
		 * �û�������Ȩ��������ȡ�����������⵼����Ȩʧ��
		 * \param reason ��Ȩʧ��ԭ�򣬾���ʧ��ԭ��μ�sdkdef.h�ļ���\ref UpdateFailType
		 }
		{-} procedure tencentFailedUpdate(reason:UpdateFailType);cdecl;

		{*
		 * ��ȡ�û�������Ϣ�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/getUserInfoResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/getUserInfoResponse.exp fail
		 }
		{-} procedure getUserInfoResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * ��ȡ�û�QZone����б�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/getListAlbumResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/getListAlbumResponse.exp fail
		 }
		{-} procedure getListAlbumResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ��ȡ�û�QZone��Ƭ�б�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/getListPhotoResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/getListPhotoResponse.exp fail
		 }
		{-} procedure getListPhotoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ����Ƿ���QZoneĳ���û��ķ�˿�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/checkPageFansResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/checkPageFansResponse.exp fail
		 }
		{-} procedure checkPageFansResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ����QZone�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/addShareResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/addShareResponse.exp fail
		 }
		{-} procedure addShareResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ��QZone����д���һ���µ����ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/addAlbumResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/addAlbumResponse.exp fail
		 }
		{-} procedure addAlbumResponse(response:APIResponse{*});cdecl;
		
		{*
		 * �ϴ���Ƭ��QZoneָ�����ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/uploadPicResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/uploadPicResponse.exp fail
		 }
		{-} procedure uploadPicResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * ��QZone�з���һƪ��־�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/addOneBlogResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/addOneBlogResponse.exp fail
		 }
		{-} procedure addOneBlogResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ��QZone�з���һ��˵˵�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/addTopicResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/addTopicResponse.exp fail
		 }
		{-} procedure addTopicResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ����QQͷ��ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/setUserHeadpicResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/setUserHeadpicResponse.exp fail
		 }
		{-} procedure setUserHeadpicResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ��ȡQQ��Ա��Ϣ�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \remarks ��ȷ����ʾ��: \snippet example/getVipInfoResponse.exp success
		 *          ���󷵻�ʾ��: \snippet example/getVipInfoResponse.exp fail
		 }
		{-} procedure getVipInfoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * ��ȡQQ��Ա��ϸ��Ϣ�ص�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 }
		{-} procedure getVipRichInfoResponse(response:APIResponse{*});cdecl;
		
		{*
		 * sendStory����Ļص����ѷ�����ʹ��responseDidReceived:forMessage:��
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 }
		{-} procedure sendStoryResponse(response:APIResponse{*});cdecl;
		
		
		{*
		 * �罻APIͳһ�ص��ӿ�
		 * \param response API���ؽ�������嶨��μ�sdkdef.h�ļ���\ref APIResponse
		 * \param message ��Ӧ����Ϣ��Ŀǰ֧�֡�SendStory��,��AppInvitation������AppChallenge������AppGiftRequest��
		 }
		[MethodName('responseDidReceived:forMessage:')]
		{-} procedure responseDidReceivedforMessage(response:APIResponse{*};message:NSString{*});cdecl;
		
		{*
		 * post������ϴ�����
		 * \param tencentOAuth ���ػص���tencentOAuth����
		 * \param bytesWritten ���λص��ϴ��������ֽ���
		 * \param totalBytesWritten �ܹ��Ѿ��ϴ����ֽ���
		 * \param totalBytesExpectedToWrite �ܹ���Ҫ�ϴ����ֽ���
		 * \param userData �û��Զ�������
		 }
		[MethodName('tencentOAuth:didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:userData:')]
		{-} procedure tencentOAuthdidSendBodyDatatotalBytesWrittentotalBytesExpectedToWriteuserData(tencentOAuth:TencentOAuth{*};bytesWritten:NSInteger;totalBytesWritten:NSInteger;totalBytesExpectedToWrite:NSInteger;userData:id);cdecl;
		
		
		{*
		 * ֪ͨ������������Ҫ���ر�
		 * \param tencentOAuth ���ػص���tencentOAuth����
		 * \param viewController ��Ҫ�رյ�viewController
		 }
		[MethodName('tencentOAuth:doCloseViewController:')]
		{-} procedure tencentOAuthdoCloseViewController(tencentOAuth:TencentOAuth{*};viewController:UIViewController{*});cdecl;
		
	end;
	
	
	//#pragma mark - TencentWebViewDelegate(H5��¼webview��ת����ص�)
	
	{*
	 * \brief TencentWebViewDelegate: H5��¼webview��ת����ص�Э��
	 *
	 * ������Ӧ�ÿ��Ը����Լ�APP����ת�������ƣ�ͨ����Э������
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

