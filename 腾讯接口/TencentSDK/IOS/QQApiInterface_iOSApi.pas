///
/// \file QQApiInterface.h
/// \brief QQApi�ӿڼ򻯷�װ
///
/// Created by Tencent on 12-5-15.
/// Copyright (c) 2012�� Tencent. All rights reserved.
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
	 \brief ��������QQ��������Ӧ�Ļص�Э��
	 }
	QQApiInterfaceDelegate=interface(IObjectiveC)
		['{77F04484-F792-4516-B5EF-8C7B0D08A488}']
		
		{*
		 ��������QQ������
		 }
		{-} procedure onReq(req:QQBaseReq{*});cdecl;
		
		{*
		 ��������QQ����Ӧ
		 }
		{-} procedure onResp(resp:QQBaseResp{*});cdecl;
		
		{*
		 ����QQ����״̬�Ļص�
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
		 ��������QQ������
		 }
		{-} procedure onReq(req:QQBaseReq{*});cdecl;
		
		{*
		 ��������QQ����Ӧ
		 }
		{-} procedure onResp(resp:QQBaseResp{*});cdecl;
		
		{*
		 ����QQ����״̬�Ļص�
		 }
		{-} procedure isOnlineResponse(response:PNSDictionary{*});cdecl;
		
	end;
	
	
	{*
	 \brief ��QQApi�ļ򵥷�װ��
	 }
	QQApiInterface=interface(NSObject)//
	['{831800DF-078D-4B94-B66B-C4145DD1957F}']
		
		{*
		 ��������Q�������ת����
		 \param url �������url��ת����
		 \param delegate ������Ӧ�����ڴ�������QQ������Ӧ��ί�ж���
		 \return ��ת����������YES��ʾ�ɹ�����NO��ʾ��֧�ֵ�����Э�����ʧ��
		 }
		
		{*
		 ����Q�����������
		 \param req �������ݵ�����
		 \return �����ͽ����
		 }
		
		{*
		 ����Q QZone��ϰ淢���������
		 \note H5����ֻ֧�ֵ�������ͼƬ�Ĵ���
		 \param req �������ݵ�����
		 \return �����ͽ����
		 }
		
		{*
		 ����Q Ⱥ���䷢���������
		 \note H5����ֻ֧�ֵ�������ͼƬ�Ĵ���
		 \param req �������ݵ�����
		 \return �����ͽ����
		 }
		
		{*
		 ����Q����Ӧ����Ϣ
		 \param resp Ӧ����Ϣ
		 \return Ӧ���ͽ����
		 }
		
		{*
		 ����Ƿ��Ѱ�װQQ
		 \return ���QQ�Ѱ�װ�򷵻�YES�����򷵻�NO
		 }
		
		{*
		 �������QQ�����Ƿ�����
		 }
		
		{*
		 ���QQ�Ƿ�֧��API����
		 \return �����ǰ��װQQ�汾֧��API�����򷵻�YES�����򷵻�NO
		 }  
		
		{*
		 ����QQ
		 \return �ɹ�����YES�����򷵻�NO
		 }
		
		{*
		 ��ȡQQ���ص�ַ
		 
		 ���Appͨ��<code>QQApiInterface#isQQInstalled</code>��<code>QQApiInterface#isQQSupportApi</code>��ⷢ��QQû��װ��ǰ�汾QQ��֧��API���ã��������û�ͨ���򿪴������������°�QQ��
		 \return iPhoneQQ���ص�ַ
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

