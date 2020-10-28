//
//  TencentMessage.h
//  TencentOpenApi_IOS
//
//  Created by qqconnect on 13-5-29.
//  Copyright (c) 2013�� Tencent. All rights reserved.
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
	 * \brief TencentApiInterface�Ļص�
	 *
	 * TencentApiInterface�Ļص��ӿ� 
	 * \note v1.0�汾ֻ֧����Ѷҵ�������������������
	 }
	TencentApiInterfaceDelegate=interface(IObjectiveC)
		['{364F9642-9DC4-46E5-8C13-D0C9B26A6EA2}']
		
		//@optional
		{*
		 * ���������� ��ǰ�汾ֻ֧�ֵ�������Ӧ��Ѷҵ������
		 }
		{-} function onTencentReq(req:TencentApiReq{*}):Boolean;cdecl;
		
		{*
		 * ��Ӧ����� ��ǰ�汾ֻ֧����Ѷҵ����Ӧ�������������
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
		 * ���������� ��ǰ�汾ֻ֧�ֵ�������Ӧ��Ѷҵ������
		 }
		{-} function onTencentReq(req:TencentApiReq{*}):Boolean;cdecl;
		
		{*
		 * ��Ӧ����� ��ǰ�汾ֻ֧����Ѷҵ����Ӧ�������������
		 }
		{-} function onTencentResp(resp:TencentApiResp{*}):Boolean;cdecl;
		
	end;
	
	
	{*
	 * \brief TencentApiInterface�Ļص�
	 *
	 * TencentApiInterface�ĵ��ýӿ� 
	 * \note v1.0�汾ֻ֧�ֵ�����������
	 }
	TencentApiInterface=interface(NSObject)//
	['{DCB4C07E-93D9-4892-9511-2E4B95A8A498}']
		
		{*
		 * ���ʹ𸴷�����Ѷҵ��
		 * \param resp ������
		 * \return ������
		 }
		
		{*
		 * �Ƿ���Դ�������Э��
		 * \param url
		 * \param delegate ָ���Ļص�
		 * \return �Ƿ�����ѶAPI��ʶ����Ϣ����
		 }
		
		{*
		 * ����Ӧ������Э��
		 * \param url
		 * \param delegate ָ���Ļص�
		 * \return �Ƿ�����ѶAPI��ʶ����Ϣ����
		 }
		
		{*
		 * �û��豸�Ƿ�װ��ѶAPP
		 * \param platform ָ������Ѷҵ��
		 * \return YES:��װ NO:δ��װ
		 }
		
		{*
		 * �û��豸�Ƿ�֧�ֵ���SDK
		 * \param platform ָ������Ѷҵ��
		 * \return YES:֧�� NO:��֧��
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

