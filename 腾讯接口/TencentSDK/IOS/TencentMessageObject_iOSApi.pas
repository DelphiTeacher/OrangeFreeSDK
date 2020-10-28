//
//  TencentMessageObject.h
//  TencentOpenApi_IOS
//
//  Created by qqconnect on 13-5-27.
//  Copyright (c) 2013�� Tencent. All rights reserved.
//

//#ifndef QQ_OPEN_SDK_LITE

unit TencentMessageObject_iOSApi;

interface

{$IFDEF IOS}
uses
	iOSapi.Foundation,
	iOSapi.UIKit,
	sdkdef_iOSApi,
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
  TencentApiReq=interface;
	
	//#define kTextLimit (1024 * 1024)
	//#define kDataLimit (1024 * 1024 * 10)
	//#define kPreviewDataLimit (1024 * 1024)
	
	
	
	
	{*
	 * �����NSArray�Ͳ���
	 }
	//*
  TCRequiredArray=NSArray;
	
	{*
	 * �����NSDictionary�Ͳ���
	 }
	//*
  TCRequiredDictionary=NSDictionary;
	
	{*
	 * �����TencentApiReq�Ͳ���
	 }
	//*
  TCRequiredReq=TencentApiReq;
	
	{*
	 * ��ѡ��UIImage���Ͳ���
	 }
	//*
  TCOptionalData=NSData;
	
	
	{*
	 * ��ѡ��NSArray�Ͳ���
	 }
	//*
  TCOptionalArray=NSArray;
	
	{*
	 * ��ѡ��TencentApiReq�Ͳ���
	 }
	//*
  TCOptionalReq=TencentApiReq;
	
	{* 
	 * TencentReqMessageType ��������ö�ٲ���
	 }
	TencentReqMessageType=(
	//    /** TX APP����������䣨��Ҫ���������������������ݺ���Ҫ��������sendRespMessageToTencentApp��*/
	//    ReqFromTencentAppQueryContent,
	//    /** TX APP����չ������ (���õ��ô�) */
	    ReqFromTencentAppShowContent,
	//    /** ������ APP �������� */
	//    ReqFromThirdAppQueryContent,
	//    /** ������ APP ����չ�����ݣ����Ʒ���*/
	    ReqFromThirdAppShowContent//,
//	}
	);
	
	TencentRespMessageType=(
	    RespFromTencentAppQueryContent,
	    RespFromTencentAppShowContent,
	    RespFromThirdAppQueryContent,
	    RespFromThirdAppShowContent//,
//	}
	);
	
	{*
	 * TencentObjVersion ��ѶAPI��Ϣ����ö��
	 }
//	//=(
//	//    /** �ı����� */
//	//    TencentTextObj,
//	//    /** ͼƬ���� */
//	    TencentImageObj,
//	//    /** ��Ƶ���� */
//	//    TencentAudioObj,
//	//    /** ��Ƶ���� */
//	    TencentVideoObj//,
//	//    /** ͼƬ��Ƶ�� */
//	//    TencentImageAndVideoObj,
//	//}
//	//TencentObjVersion;
//	);
	
	{*
	 * \brief �����
	 *
	 * TencentApiReq����������ҵ���������
	 }
	TencentApiReq=interface(NSObject)//<NSCoding>
	['{E6C46B52-873E-4FC9-B682-FD662B3EDF33}']
		
		{*
		 * �������к�����һ������� 
		 * \param apiSeq �������к�
		 * \param type   ��������
		 * \return tencentApiReqʵ��
		 }
		
		{* �������� }
		function nMessageType:TCRequiredInt;cdecl;
		procedure setNMessageType(nMessageType:TCRequiredInt);cdecl;
		
		{* ����ƽ̨ }
		function nPlatform:NSInteger;cdecl;
		procedure setNPlatform(nPlatform:NSInteger);cdecl;
		
		{* �����SDK�汾�� }
		function nSdkVersion:NSInteger;cdecl;
		procedure setNSdkVersion(nSdkVersion:NSInteger);cdecl;
		
		{* �������к� }
		function nSeq:TCRequiredInt;cdecl;
		procedure setNSeq(nSeq:TCRequiredInt);cdecl;
		
		{* ��������APPID }
		function sAppID:TCRequiredStr;cdecl;
		procedure setSAppID(sAppID:TCRequiredStr);cdecl;
		
		{* �������� TencentBaseMessageObj�������� }
		function arrMessage:TCOptionalArray;cdecl;
		procedure setArrMessage(arrMessage:TCOptionalArray);cdecl;
		
		{* ��������� �������ڸ��߶Է����������ض����� }
		function sDescription:TCOptionalStr;cdecl;
		procedure setSDescription(sDescription:TCOptionalStr);cdecl;
		
	end;
	
	TencentApiReqClass=interface(NSObjectClass)//<NSCoding>
	['{FF3235AF-6811-42CD-A009-3A25F02C6839}']
		[MethodName('reqFromSeq:type:')]
		{+} function reqFromSeqtype(apiSeq:NSInteger;_type:TencentReqMessageType):TencentApiReq{*};cdecl;
	end;
	
	TTencentApiReq=class(TOCGenericImport<TencentApiReqClass,TencentApiReq>)
	end;
	
	{*
	 * \brief �𸴰�
	 *
	 * TencentApiResp����������ҵ���ʹ𸴰�
	 }
	TencentApiResp=interface(NSObject)//<NSCoding>
	['{E4E4B179-A4AE-475A-BA1F-B6F12349641C}']
		
		{*
		 * �������к�����һ���𸴰�
		 * \param req �𸴶�Ӧ������������req����TencentApiReq�����������࣬���׳��쳣��
		 * \return �𸴰���
		 }
		
		{* ������ }
		function nRetCode:TCOptionalInt;cdecl;
		procedure setNRetCode(nRetCode:TCOptionalInt);cdecl;
		
		{* ������Ϣ }
		function sRetMsg:TCOptionalStr;cdecl;
		procedure setSRetMsg(sRetMsg:TCOptionalStr);cdecl;
		
		{* �𸴶�Ӧ������� }
		function objReq:TCOptionalReq;cdecl;
		procedure setObjReq(objReq:TCOptionalReq);cdecl;
		
	end;
	
	TencentApiRespClass=interface(NSObjectClass)//<NSCoding>
	['{7BCEC301-959F-4334-9B4A-CE69148641CD}']
		{+} function respFromReq(req:TencentApiReq{*}):TencentApiResp{*};cdecl;
	end;
	
	TTencentApiResp=class(TOCGenericImport<TencentApiRespClass,TencentApiResp>)
	end;
	
	{*
	 * \brief ��Ϣ��
	 *
	 * TencentBaseMessageObj Ӧ��֮�䴫����Ϣ��
	 }
	TencentBaseMessageObj=interface(NSObject)//<NSCoding>
	['{92115DBD-9653-4912-9E28-671FDB341F7A}']
		
		{* ��Ϣ���� }
		function nVersion:NSInteger;cdecl;
		procedure setNVersion(nVersion:NSInteger);cdecl;
		
		{* ��Ϣ���� }
		function sName:NSString{*};cdecl;
		procedure setSName(sName:NSString{*});cdecl;
		
		{* ��Ϣ����չ��Ϣ ��Ҫ�ǿ�����������һЩ������Ϣ������� Ʃ��ͼƬҪ���width height ���ֵĹؼ���ʲô��, Ҳ���Բ�����д}
		function dictExpandInfo:PNSDictionary{*};cdecl;
		procedure setDictExpandInfo(dictExpandInfo:PNSDictionary{*});cdecl;
		
		{* 
		 * ��Ϣ�Ƿ���Ч 
		 }
		{-} function isVaild:Boolean;cdecl;
		
	end;
	
	TencentBaseMessageObjClass=interface(NSObjectClass)//<NSCoding>
	['{45DE8EA5-DD6F-4B2D-8E71-DA92858292AB}']
	end;
	
	TTencentBaseMessageObj=class(TOCGenericImport<TencentBaseMessageObjClass,TencentBaseMessageObj>)
	end;
	
	//#pragma mark TencentTextMessage
	{*
	 * \brief �ı�����Ϣ��
	 *
	 * TencentTextMessageObjV1 Ӧ��֮�䴫�ݵ��ı���Ϣ��
	 }
	TencentTextMessageObjV1=interface(TencentBaseMessageObj)//
	['{8BE2656E-3FE9-49E6-AF2C-9B293443AC9E}']
		
		{* 
		 * �ı�
		 * \note �ı����Ȳ��ܳ���4096����
		 }
		function sText:NSString{*};cdecl;
		procedure setSText(sText:NSString{*});cdecl;
		
		
		{*
		 * ��ʼ���ı���Ϣ
		 * \param text �ı�
		 * \return ��ʼ�����ص��ı���Ϣ
		 }
		{-} function initWithText(text:NSString{*}):id;cdecl;
		
	end;
	
	TencentTextMessageObjV1Class=interface(TencentBaseMessageObjClass)//
	['{CD613260-7D3E-44E0-893E-7F96296FE7C4}']
	end;
	
	TTencentTextMessageObjV1=class(TOCGenericImport<TencentTextMessageObjV1Class,TencentTextMessageObjV1>)
	end;
	
	
	//#pragma mark TecentImageMessage
	
	{*
	 * TencentApiImageSourceType ͼƬ�������ͣ����󷽶��������Ϳ��ܻ������ƣ�
	 }
	TencentApiImageSourceType=(
	//    /** ͼƬ������url����������� */
	    AllImage,
	//    /** ͼƬ������url */
	    UrlImage,
	//    /** ͼƬ�����Ƕ��������� */
	    DataImage
	//}TencentApiImageSourceType;
	);
	
	{*
	 * \brief ͼƬ����Ϣ��
	 *
	 * TencentImageMessageObjV1 Ӧ��֮�䴫�ݵ�ͼƬ��Ϣ��
	 }
	TencentImageMessageObjV1=interface(TencentBaseMessageObj)//
	['{8E1A9CBD-D1DC-4698-999B-44A0690216B9}']
		
		{* 
		 * ͼƬ����
		 * \note ͼƬ���ܴ���10M
		 }
		function dataImage:NSData{*};cdecl;
		procedure setDataImage(dataImage:NSData{*});cdecl;
		
		{* 
		 * ����ͼ������
		 * \note ͼƬ���ܴ���1M 
		 }
		function dataThumbImage:NSData{*};cdecl;
		procedure setDataThumbImage(dataThumbImage:NSData{*});cdecl;
		
		{* ͼƬURL }
		function sUrl:NSString{*};cdecl;
		procedure setSUrl(sUrl:NSString{*});cdecl;
		
		{* ͼƬ������ }
		function sDescription:NSString{*};cdecl;
		procedure setSDescription(sDescription:NSString{*});cdecl;
		
		{* ͼƬ��size }
		function szImage:CGSize;cdecl;
		procedure setSzImage(szImage:CGSize);cdecl;
		
		{* 
		 * ͼƬ��Դ
		 * \note TencentApiImageSourceType��Ӧ������
		 }
		function nType:NSInteger;cdecl;
		procedure setNType(nType:NSInteger);cdecl;
		
		{*
		 * ��ʼ��ͼƬ��Ϣ
		 * \param dataImage ͼƬ����
		 * \return ��ʼ�����ص�ͼƬ��Ϣ
		 }
		{-} function initWithImageData(dataImage:NSData{*}):id;cdecl;
		
		{*
		 * ��ʼ��ͼƬ��Ϣ
		 * \param url ͼƬurl
		 * \return ��ʼ�����ص�ͼƬ��Ϣ
		 }
		{-} function initWithImageUrl(url:NSString{*}):id;cdecl;
		
		{*
		 * ��ʼ��ͼƬ��Ϣ
		 * \param type ͼƬ����
		 * \return ��ʼ�����ص�ͼƬ��Ϣ
		 }
		{-} function initWithType(_type:TencentApiImageSourceType):id;cdecl;
	end;
	
	TencentImageMessageObjV1Class=interface(TencentBaseMessageObjClass)//
	['{0DAA1597-5488-4D0E-A01C-591532BB0367}']
	end;
	
	TTencentImageMessageObjV1=class(TOCGenericImport<TencentImageMessageObjV1Class,TencentImageMessageObjV1>)
	end;
	
	
	//#pragma mark TencentAudioMessage
	{*
	 * \brief ��Ƶ����Ϣ��
	 *
	 * TencentAudioMessageObjV1 Ӧ��֮�䴫�ݵ���Ƶ��Ϣ��
	 }
	TencentAudioMessageObjV1=interface(TencentBaseMessageObj)//
	['{F4E37A24-6D0E-429A-97B8-578BEDC76F99}']
		
		{* ��ƵURL }
		function sUrl:NSString{*};cdecl;
		procedure setSUrl(sUrl:NSString{*});cdecl;
		
		{* 
		 * ��Ƶ��Ԥ��ͼ
		 * \noteͼƬ���ܴ���1M 
		 }
		function dataImagePreview:NSData{*};cdecl;
		procedure setDataImagePreview(dataImagePreview:NSData{*});cdecl;
		
		{* ��Ƶ��Ԥ��ͼURL }
		function sImagePreviewUrl:NSString{*};cdecl;
		procedure setSImagePreviewUrl(sImagePreviewUrl:NSString{*});cdecl;
		
		{* ��Ƶ������ }
		function sDescription:NSString{*};cdecl;
		procedure setSDescription(sDescription:NSString{*});cdecl;
		
		{*
		 * ��ʼ��ͼƬ��Ϣ
		 * \param url ��ƵURL
		 * \return ��ʼ�����ص���Ƶ��Ϣ
		 }
		{-} function initWithAudioUrl(url:NSString{*}):id;cdecl;
		
	end;
	
	TencentAudioMessageObjV1Class=interface(TencentBaseMessageObjClass)//
	['{91E3A713-40D4-40FF-B299-6B521BCF23C5}']
	end;
	
	TTencentAudioMessageObjV1=class(TOCGenericImport<TencentAudioMessageObjV1Class,TencentAudioMessageObjV1>)
	end;
	
	
	//#pragma mark TencentVideoMessage
	
	{*
	 * TencentApiVideoSourceType ��Ƶ�������ͣ����󷽶��������Ϳ��ܻ������ƣ�
	 }
	
	TencentApiVideoSourceType=(
	//    /** ��Ƶ��Դ�ڱ��ػ����� */
	    AllVideo,
	//    /** ��Ƶ��Դ�ڱ��� */
	    LocalVideo,
	//    /** ��Ƶ��Դ������ */
	    NetVideo
	//};
	);
	
	{*
	 * \brief ��Ƶ����Ϣ��
	 *
	 * TencentVideoMessageV1 Ӧ��֮�䴫�ݵ���Ƶ��Ϣ��
	 }
	TencentVideoMessageV1=interface(TencentBaseMessageObj)//
	['{B52CA45A-F8EE-4154-AE73-902694308B36}']
		
		{* 
		 * ��ƵURL 
		 * \note ���ܳ���1024
		 }
		function sUrl:NSString{*};cdecl;
		procedure setSUrl(sUrl:NSString{*});cdecl;
		
		{* 
		 * ��Ƶ��Դ ��Ҫ�������÷���ָ����Ƶ����Դ
		 * \note TencentApiVideoSourceType ��Ӧ������ ֻ������
		 }
		function nType:NSInteger;cdecl;
		procedure setNType(nType:NSInteger);cdecl;
		
		{* 
		 * ��Ƶ��Ԥ��ͼ 
		 * \note ͼƬ���ܴ���1M 
		 }
		function dataImagePreview:NSData{*};cdecl;
		procedure setDataImagePreview(dataImagePreview:NSData{*});cdecl;
		
		{* ��Ƶ��Ԥ��ͼURL }
		function sImagePreviewUrl:NSString{*};cdecl;
		procedure setSImagePreviewUrl(sImagePreviewUrl:NSString{*});cdecl;
		
		{* ��Ƶ������ }
		function sDescription:NSString{*};cdecl;
		procedure setSDescription(sDescription:NSString{*});cdecl;
		
		{*
		 * ��ʼ����Ƶ��Ϣ
		 * \param url  ��ƵURL
		 * \param type ��Ƶ��Դ����
		 * \return ��ʼ�����ص���Ƶ��Ϣ
		 }
		[MethodName('initWithVideoUrl:type:')]
		{-} function initWithVideoUrltype(url:NSString{*};_type:TencentApiVideoSourceType):id;cdecl;
		
		
		{*
		 * ��ʼ����Ƶ��Ϣ
		 * \param type ��Ƶ��Դ����
		 * \return ��ʼ�����ص���Ƶ��Ϣ
		 }
		{-} function initWithType(_type:TencentApiVideoSourceType):id;cdecl;
	end;
	
	TencentVideoMessageV1Class=interface(TencentBaseMessageObjClass)//
	['{A0D062E9-1F58-4F51-A5DF-94FBCAFE1383}']
	end;
	
	TTencentVideoMessageV1=class(TOCGenericImport<TencentVideoMessageV1Class,TencentVideoMessageV1>)
	end;
	
	//#pragma mark TencentImageMessageObj
	{*
	 * \brief ��ƵͼƬ��Ϣ��
	 *
	 * TencentVideoMessageV1 ����һ����չ���� ��һ��ͼƬ��Ƶ�� 
	 * \note ͼƬ��Ƶ������ѡһ��������� ����ע��ֻ����һ�� ����һ�����ͱ����� ����һ�������;��޷������
	 }
	TencentImageAndVideoMessageObjV1=interface(TencentBaseMessageObj)//
	['{CCDBACA2-6849-4BD9-B5D6-07A33E6A78BA}']
		
		{* ͼƬ��Ϣ }
		function objImageMessage:TencentImageMessageObjV1{*};cdecl;
		procedure setObjImageMessage(objImageMessage:TencentImageMessageObjV1{*});cdecl;
		
		{* ��Ƶ��Ϣ }
		function objVideoMessage:TencentVideoMessageV1{*};cdecl;
		procedure setObjVideoMessage(objVideoMessage:TencentVideoMessageV1{*});cdecl;
		
		{*
		 * ��ʼ��ͼƬ��Ϣ
		 * \param dataImage ͼƬ����
		 * \param url       ��Ƶurl
		 * \return ��ʼ�����ص�ͼƬ��Ƶ��Ϣ
		 }
		[MethodName('initWithMessage:videoUrl:')]
		{-} function initWithMessagevideoUrl(dataImage:NSData{*};url:NSString{*}):id;cdecl;
		
		{* 
		 * ����ͼƬ
		 * \param dataImage ͼƬ����
		 }
		{-} procedure setDataImage(dataImage:NSData{*});cdecl;
		
		{*
		 * ������Ƶ
		 * \param videoUrl ��ƵURL
		 }
		{-} procedure setVideoUrl(videoUrl:NSString{*});cdecl;
	end;
	
	TencentImageAndVideoMessageObjV1Class=interface(TencentBaseMessageObjClass)//
	['{769A65F3-0FF1-44B7-A262-3655A8031CC2}']
	end;
	
	TTencentImageAndVideoMessageObjV1=class(TOCGenericImport<TencentImageAndVideoMessageObjV1Class,TencentImageAndVideoMessageObjV1>)
	end;
	
	//#endif
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function TencentApiReq_FakeLoader : TencentApiReq; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TencentApiReq';
function TencentApiResp_FakeLoader : TencentApiResp; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TencentApiResp';
function TencentBaseMessageObj_FakeLoader : TencentBaseMessageObj; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TencentBaseMessageObj';
function TencentTextMessageObjV1_FakeLoader : TencentTextMessageObjV1; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TencentTextMessageObjV1';
function TencentImageMessageObjV1_FakeLoader : TencentImageMessageObjV1; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TencentImageMessageObjV1';
function TencentAudioMessageObjV1_FakeLoader : TencentAudioMessageObjV1; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TencentAudioMessageObjV1';
function TencentVideoMessageV1_FakeLoader : TencentVideoMessageV1; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TencentVideoMessageV1';
function TencentImageAndVideoMessageObjV1_FakeLoader : TencentImageAndVideoMessageObjV1; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TencentImageAndVideoMessageObjV1';
{$O+}


{$ENDIF}

end.

