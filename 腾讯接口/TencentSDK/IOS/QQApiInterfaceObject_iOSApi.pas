///
/// \file QQApiInterfaceObject.h
/// \brief QQApiInterface������������Ӧ����Ϣ�����װ������
///
/// Created by Tencent on 12-5-15.
/// Copyright (c) 2012�� Tencent. All rights reserved.
///

//#ifndef QQApiInterface_QQAPIOBJECT_h
//#define QQApiInterface_QQAPIOBJECT_h

unit QQApiInterfaceObject_iOSApi;

interface

{$IFDEF IOS}
uses
  Macapi.Mach,
	iOSapi.Foundation,
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

	
	
	QQApiSendResultCode=(
	    EQQAPISENDSUCESS = 0,
	    EQQAPIQQNOTINSTALLED = 1,
	    EQQAPIQQNOTSUPPORTAPI = 2,
	    EQQAPIMESSAGETYPEINVALID = 3,
	    EQQAPIMESSAGECONTENTNULL = 4,
	    EQQAPIMESSAGECONTENTINVALID = 5,
	    EQQAPIAPPNOTREGISTED = 6,
	    EQQAPIAPPSHAREASYNC = 7,
	    EQQAPIQQNOTSUPPORTAPI_WITH_ERRORSHOW = 8,
	    EQQAPISENDFAILD = -1,
	//    //qzone����֧��text���ͷ���
	    EQQAPIQZONENOTSUPPORTTEXT = 10000,
	//    //qzone����֧��image���ͷ���
	    EQQAPIQZONENOTSUPPORTIMAGE = 10001,
	//    //��ǰQQ�汾̫�ͣ���Ҫ�������°汾�ſ���֧��
	    EQQAPIVERSIONNEEDUPDATE = 10002//,
	);
	
	//#pragma mark - QQApiObject(�����������)
	
	// QQApiObject control flags
	
	
	
	
	
	
	
	
	
	// QQApiObject
	{* \brief ������QQ������䷢�͵����ݶ���ĸ��ࡣ
	 }
	QQApiObject=interface(NSObject)//
	['{630F0296-D3E2-41D4-BA1F-16E541DF8FE0}']
		function title:NSString{*};cdecl;///< ���⣬�128���ַ�
		procedure setTitle(title:NSString{*});cdecl;///< ���⣬�128���ַ�
		function description:NSString{*};cdecl;///<��Ҫ�������512���ַ�
		procedure setDescription(description:NSString{*});cdecl;///<��Ҫ�������512���ַ�
		
		function cflag:uint64_t;cdecl;
		procedure setCflag(cflag:uint64_t);cdecl;

	end;
	
	QQApiObjectClass=interface(NSObjectClass)//
	['{D195AC9B-FB7B-4FB4-95F9-95D1CCECA3FD}']
	end;
	
	TQQApiObject=class(TOCGenericImport<QQApiObjectClass,QQApiObject>)
	end;
	
	// QQApiResultObject
	{* \brief ���������Ӧ���������͡�
	 <h3>���ܴ����뼰��������:</h3>
	 <TABLE>
	 <TR><TD>error</TD><TD>errorDescription</TD><TD>ע��</TD></TR>
	 <TR><TD>0</TD><TD>nil</TD><TD>�ɹ�</TD></TR>
	 <TR><TD>-1</TD><TD>param error</TD><TD>��������</TD></TR>
	 <TR><TD>-2</TD><TD>group code is invalid</TD><TD>��Ⱥ�����Լ���Ⱥ�б�����</TD></TR>
	 <TR><TD>-3</TD><TD>upload photo failed</TD><TD>�ϴ�ͼƬʧ��</TD></TR>
	 <TR><TD>-4</TD><TD>user give up the current operation</TD><TD>�û�������ǰ����</TD></TR>
	 <TR><TD>-5</TD><TD>client internal error</TD><TD>�ͻ����ڲ��������</TD></TR>
	 </TABLE>
	 }
	QQApiResultObject=interface(QQApiObject)//
	['{D9934052-1064-4BF9-9645-00F8E6A018F4}']
		function error:NSString{*};cdecl;///<����
		procedure setError(error:NSString{*});cdecl;///<����
		function errorDescription:NSString{*};cdecl;///<��������
		procedure setErrorDescription(errorDescription:NSString{*});cdecl;///<��������
		function extendInfo:NSString{*};cdecl;///<��չ��Ϣ
		procedure setExtendInfo(extendInfo:NSString{*});cdecl;///<��չ��Ϣ
	end;
	
	QQApiResultObjectClass=interface(QQApiObjectClass)//
	['{E8882D88-7697-4469-B57F-C94816800A9F}']
	end;
	
	TQQApiResultObject=class(TOCGenericImport<QQApiResultObjectClass,QQApiResultObject>)
	end;
	
	// QQApiTextObject
	{* \brief �ı�����
	 }
	QQApiTextObject=interface(QQApiObject)//
	['{064B9C00-67EA-4ACE-BA5B-012AC17858B6}']
		function text:NSString{*};cdecl;///<�ı����ݣ�����1536���ַ�
		procedure setText(text:NSString{*});cdecl;///<�ı����ݣ�����1536���ַ�
		
		{-} function initWithText(text:NSString{*}):id;cdecl;
	end;
	
	QQApiTextObjectClass=interface(QQApiObjectClass)//
	['{808B5845-7D85-415E-83E2-85FBE50AAE66}']
		{+} function objectWithText(text:NSString{*}):id;cdecl;
	end;
	
	TQQApiTextObject=class(TOCGenericImport<QQApiTextObjectClass,QQApiTextObject>)
	end;
	
	// QQApiURLObject
	QQApiURLTargetType=(
	    QQApiURLTargetTypeNotSpecified = $00,
	    QQApiURLTargetTypeAudio   = $01,
	    QQApiURLTargetTypeVideo   = $02,
	    QQApiURLTargetTypeNews    = $03
	);
	
	{* @brief URL�������͡�
	 
	 ����URL��ַ��URL��ַ��ָ���Ŀ�����ͼ�Ԥ��ͼ��
	 }
	QQApiURLObject=interface(QQApiObject)//
	['{963B6C05-8DBF-482F-B69F-4947D5145008}']
		{*
		 URL��ַ��ָ���Ŀ������.
		 @note �μ�QQApi.h �е� QQApiURLTargetType ����.
		 }
		function targetContentType:QQApiURLTargetType;cdecl;
		procedure setTargetContentType(targetContentType:QQApiURLTargetType);cdecl;
		
		function url:NSURL{*};cdecl;///<URL��ַ,����512���ַ�
		procedure setUrl(url:NSURL{*});cdecl;///<URL��ַ,����512���ַ�
		function previewImageData:NSData{*};cdecl;///<Ԥ��ͼ�����ݣ����1M�ֽ�
		procedure setPreviewImageData(previewImageData:NSData{*});cdecl;///<Ԥ��ͼ�����ݣ����1M�ֽ�
		function previewImageURL:NSURL{*};cdecl;///<Ԥ��ͼ��URL **Ԥ��ͼ��������Ԥ��ͼ��URL�ɶ�ѡһ
		procedure setPreviewImageURL(previewImageURL:NSURL{*});cdecl;///<Ԥ��ͼ��URL **Ԥ��ͼ��������Ԥ��ͼ��URL�ɶ�ѡһ
		
		{*
		 ��ʼ������
		 }
		[MethodName('initWithURL:title:description:previewImageData:targetContentType:')]
		{-} function initWithURLtitledescriptionpreviewImageDatatargetContentType(url:NSURL{*};title:NSString{*};description:NSString{*};data:NSData{*};targetContentType:QQApiURLTargetType):id;cdecl;
		[MethodName('initWithURL:title:description:previewImageURL:targetContentType:')]
		{-} function initWithURLtitledescriptionpreviewImageURLtargetContentType(url:NSURL{*};title:NSString{*};description:NSString{*};previewURL:NSURL{*};targetContentType:QQApiURLTargetType):id;cdecl;
		{*
		 ��������,��ȡһ��QQApiURLObject����
		 }
	end;
	
	QQApiURLObjectClass=interface(QQApiObjectClass)//
	['{F76064FB-60D1-4F89-A755-66D99929E6B2}']
		[MethodName('objectWithURL:title:description:previewImageData:targetContentType:')]
		{+} function objectWithURLtitledescriptionpreviewImageDatatargetContentType(url:NSURL{*};title:NSString{*};description:NSString{*};data:NSData{*};targetContentType:QQApiURLTargetType):id;cdecl;
		[MethodName('objectWithURL:title:description:previewImageURL:targetContentType:')]
		{+} function objectWithURLtitledescriptionpreviewImageURLtargetContentType(url:NSURL{*};title:NSString{*};description:NSString{*};previewURL:NSURL{*};targetContentType:QQApiURLTargetType):id;cdecl;
	end;
	
	TQQApiURLObject=class(TOCGenericImport<QQApiURLObjectClass,QQApiURLObject>)
	end;
	
	// QQApiExtendObject
	{* @brief ��չ��������
	 }
	QQApiExtendObject=interface(QQApiObject)//
	['{D74CEF39-6965-4635-B0E3-C53C2E96DC3C}']
		function data:NSData{*};cdecl;///<�����������ݣ�������5M�ֽ�
		procedure setData(data:NSData{*});cdecl;///<�����������ݣ�������5M�ֽ�
		function previewImageData:NSData{*};cdecl;///<Ԥ��ͼ�����1M�ֽ�
		procedure setPreviewImageData(previewImageData:NSData{*});cdecl;///<Ԥ��ͼ�����1M�ֽ�
		function imageDataArray:NSArray{*};cdecl;///ͼƬ����(��ͼ��ֻ֧�ַ����ֻ�QQ�ղع���)
		procedure setImageDataArray(imageDataArray:NSArray{*});cdecl;///ͼƬ����(��ͼ��ֻ֧�ַ����ֻ�QQ�ղع���)
		
		{*
		 ��ʼ������
		 @param data ��������
		 @param previewImageData ����Ԥ����ͼƬ
		 @param title ����
		 @param description �˶��󣬷��������
		 }
		[MethodName('initWithData:previewImageData:title:description:')]
		{-} function initWithDatapreviewImageDatatitledescription(data:NSData{*};previewImageData:NSData{*};title:NSString{*};description:NSString{*}):id;cdecl;
		
		{*
		 ��ʼ������
		 @param data ��������
		 @param title ����
		 @param description �˶��󣬷��������
		 @param imageDataArray ���͵Ķ���ͼƬ����
		 }
		[MethodName('initWithData:previewImageData:title:description:imageDataArray:')]
		{-} function initWithDatapreviewImageDatatitledescriptionimageDataArray(data:NSData{*};previewImageData:NSData{*};title:NSString{*};description:NSString{*};imageDataArray:NSArray{*}):id;cdecl;
		
		{*
		 helper������ȡһ��autorelease��<code>QQApiExtendObject</code>����
		 @param data ��������
		 @param previewImageData ����Ԥ����ͼƬ
		 @param title ����
		 @param description �˶��󣬷��������
		 @return
		 һ���Զ��ͷŵ�<code>QQApiExtendObject</code>ʵ��
		 }
		
		{*
		 helper������ȡһ��autorelease��<code>QQApiExtendObject</code>����
		 @param data ��������
		 @param previewImageData ����Ԥ����ͼƬ
		 @param title ����
		 @param description �˶��󣬷��������
		 @param imageDataArray ���͵Ķ���ͼƬ����
		 @return
		 һ���Զ��ͷŵ�<code>QQApiExtendObject</code>ʵ��
		 }
		
	end;
	
	QQApiExtendObjectClass=interface(QQApiObjectClass)//
	['{80A7E309-90E7-4C48-9F78-BFDFD2050EDF}']
		[MethodName('objectWithData:previewImageData:title:description:')]
		{+} function objectWithDatapreviewImageDatatitledescription(data:NSData{*};previewImageData:NSData{*};title:NSString{*};description:NSString{*}):id;cdecl;
		[MethodName('objectWithData:previewImageData:title:description:imageDataArray:')]
		{+} function objectWithDatapreviewImageDatatitledescriptionimageDataArray(data:NSData{*};previewImageData:NSData{*};title:NSString{*};description:NSString{*};imageDataArray:NSArray{*}):id;cdecl;
	end;
	
	TQQApiExtendObject=class(TOCGenericImport<QQApiExtendObjectClass,QQApiExtendObject>)
	end;
	
	// QQApiImageObject
	{* @brief ͼƬ����
	 ���ڷ���ͼƬ���ݵĶ�����һ��ָ��ΪͼƬ���͵�<code>QQApiExtendObject</code>
	 }
	QQApiImageObject=interface(QQApiExtendObject)//
	['{D4A01659-E5D6-46F6-A699-92BE037E06F7}']
	end;
	
	QQApiImageObjectClass=interface(QQApiExtendObjectClass)//
	['{9988A6DA-CDF2-4DC8-87F4-68AE14F20C45}']
	end;
	
	TQQApiImageObject=class(TOCGenericImport<QQApiImageObjectClass,QQApiImageObject>)
	end;
	
	// QQApiImageArrayForQZoneObject
	{* @brief ͼƬ����
	 ���ڷ���ͼƬ���ռ䣬��д˵˵·������һ��ָ��ΪͼƬ���͵ģ���ͼƬ����Ϊ��ʱ��Ĭ�����ı�д˵˵<code>QQApiObject</code>
	 }
	QQApiImageArrayForQZoneObject=interface(QQApiObject)//
	['{AADAC97D-2BCD-41EA-9CB0-0C1A59133724}']
		
		function imageDataArray:NSArray{*};cdecl;///ͼƬ����
		procedure setImageDataArray(imageDataArray:NSArray{*});cdecl;///ͼƬ����
		
		{*
		 ��ʼ������
		 @param imageDataArray ͼƬ����
		 @param title д˵˵�����ݣ�����Ϊ��
		 }
		[MethodName('initWithImageArrayData:title:')]
		{-} function initWithImageArrayDatatitle(imageDataArray:NSArray{*};title:NSString{*}):id;cdecl;
		
		{*
		 helper������ȡһ��autorelease��<code>QQApiExtendObject</code>����
		 @param title д˵˵�����ݣ�����Ϊ��
		 @param imageDataArray ���͵Ķ���ͼƬ����
		 @return
		 һ���Զ��ͷŵ�<code>QQApiExtendObject</code>ʵ��
		 }
		
	end;
	
	QQApiImageArrayForQZoneObjectClass=interface(QQApiObjectClass)//
	['{D42757EA-2DDE-444A-BEC1-BF83A505241C}']
		[MethodName('objectWithimageDataArray:title:')]
		{+} function objectWithimageDataArraytitle(imageDataArray:NSArray{*};title:NSString{*}):id;cdecl;
	end;
	
	TQQApiImageArrayForQZoneObject=class(TOCGenericImport<QQApiImageArrayForQZoneObjectClass,QQApiImageArrayForQZoneObject>)
	end;
	
	// QQApiVideoForQZoneObject
	{* @brief ��Ƶ����
	 ���ڷ�����Ƶ���ռ䣬��д˵˵·��<code>QQApiObject</code>
	 assetURL�ɴ�ALAsset��ALAssetPropertyAssetURL������PHAsset��localIdentifier
	 }
	QQApiVideoForQZoneObject=interface(QQApiObject)//
	['{42232605-6579-40FD-9157-B4C27D26AAF1}']
		
		function assetURL:NSString{*};cdecl;
		procedure setAssetURL(assetURL:NSString{*});cdecl;
		
		[MethodName('initWithAssetURL:title:')]
		{-} function initWithAssetURLtitle(assetURL:NSString{*};title:NSString{*}):id;cdecl;
		
		
	end;
	
	QQApiVideoForQZoneObjectClass=interface(QQApiObjectClass)//
	['{6A999C95-309C-4AFD-A6E3-23249DC42D4F}']
		[MethodName('objectWithAssetURL:title:')]
		{+} function objectWithAssetURLtitle(assetURL:NSString{*};title:NSString{*}):id;cdecl;
	end;
	
	TQQApiVideoForQZoneObject=class(TOCGenericImport<QQApiVideoForQZoneObjectClass,QQApiVideoForQZoneObject>)
	end;
	
	// QQApiWebImageObject
	{* @brief ͼƬ����
	 ���ڷ�������ͼƬ���ݵĶ�����һ��ָ������ͼƬurl��: ������ֻ��2.9.0��h5�����в�֧�֣�
	 ԭ�е���q�����ǲ�֧�ָ����͵ġ�
	 }
	QQApiWebImageObject=interface(QQApiObject)//
	['{724DEA5E-0E63-4369-88B0-9C08D6DDD286}']
		
		function previewImageURL:NSURL{*};cdecl;///<Ԥ��ͼ��URL
		procedure setPreviewImageURL(previewImageURL:NSURL{*});cdecl;///<Ԥ��ͼ��URL
		
		{*
		 ��ʼ������
		 @param previewImageURL ����Ԥ����ͼƬ
		 @param title ����
		 @param description �˶��󣬷��������
		 }
		[MethodName('initWithPreviewImageURL:title:description:')]
		{-} function initWithPreviewImageURLtitledescription(previewImageURL:NSURL{*};title:NSString{*};description:NSString{*}):id;cdecl;
		
		{*
		 helper������ȡһ��autorelease��<code>QQApiWebImageObject</code>����
		 @param previewImageURL ����Ԥ����ͼƬ
		 @param title ����
		 @param description �˶��󣬷��������
		 }
		
	end;
	
	QQApiWebImageObjectClass=interface(QQApiObjectClass)//
	['{FEE907D8-B52E-4D30-AC07-6A3FCF8A657E}']
		[MethodName('objectWithPreviewImageURL:title:description:')]
		{+} function objectWithPreviewImageURLtitledescription(previewImageURL:NSURL{*};title:NSString{*};description:NSString{*}):id;cdecl;
	end;
	
	TQQApiWebImageObject=class(TOCGenericImport<QQApiWebImageObjectClass,QQApiWebImageObject>)
	end;
	
	// QQApiGroupTribeImageObject
	{* @brief Ⱥ����ͼƬ����
	 ���ڷ���ͼƬ���ݵĶ�����һ��ָ��ΪͼƬ���͵� ����ָ��һЩ�����ĸ�������<code>QQApiExtendObject</code>
	 }
	QQApiGroupTribeImageObject=interface(QQApiImageObject)//
	['{DEE74173-EF81-43A0-A8B1-C7889A7448EC}']
		
		
		
		
		// Ⱥ����id
		function bid:NSString{*};cdecl;
		procedure setBid(bid:NSString{*});cdecl;
		
		// Ⱥ��������
		function bname:NSString{*};cdecl;
		procedure setBname(bname:NSString{*});cdecl;
		
	end;
	
	QQApiGroupTribeImageObjectClass=interface(QQApiImageObjectClass)//
	['{1B67A8D1-E7FE-400D-900D-71C9FEC41AC1}']
	end;
	
	TQQApiGroupTribeImageObject=class(TOCGenericImport<QQApiGroupTribeImageObjectClass,QQApiGroupTribeImageObject>)
	end;
	
	
	//QQApiFileObject
	{* @brief �����ļ�����(��ֻ֧�ַ����ֻ�QQ�����߹���)
	 ���ڷ����ļ����ݵĶ�����һ��ָ��Ϊ�ļ����͵�<code>QQApiExtendObject</code>
	 }
	QQApiFileObject=interface(QQApiExtendObject)//
	['{67BBEA07-9599-405C-8A8E-58384B7CE790}']
		
		
		
		function fileName:NSString{*};cdecl;
		procedure setFileName(fileName:NSString{*});cdecl;
	end;
	
	QQApiFileObjectClass=interface(QQApiExtendObjectClass)//
	['{38DA19AD-FF2C-4C3F-96F0-04134A3B58D1}']
	end;
	
	TQQApiFileObject=class(TOCGenericImport<QQApiFileObjectClass,QQApiFileObject>)
	end;
	
	// QQApiAudioObject
	{* @brief ��ƵURL����
	 ���ڷ���Ŀ������Ϊ��Ƶ��URL�Ķ���
	 }
	QQApiAudioObject=interface(QQApiURLObject)//
	['{547E6DB2-754A-4702-A1F6-4212F3A4832B}']
		
		function flashURL:NSURL{*};cdecl;///<��ƵURL��ַ���512���ַ�
		procedure setFlashURL(flashURL:NSURL{*});cdecl;///<��ƵURL��ַ���512���ַ�
		
		{*
		 ��ȡһ��autorelease��<code>QQApiAudioObject</code>
		 @param url ��Ƶ���ݵ�Ŀ��URL
		 @param title �������ݵı���
		 @param description �������ݵ�����
		 @param data �������ݵ�Ԥ��ͼ��
		 @note ���urlΪ�գ�����<code>QQApi#sendMessage:</code>ʱ������FALSE
		 }
		
		{*
		 ��ȡһ��autorelease��<code>QQApiAudioObject</code>
		 @param url ��Ƶ���ݵ�Ŀ��URL
		 @param title �������ݵı���
		 @param description �������ݵ�����
		 @param previewURL �������ݵ�Ԥ��ͼ��URL
		 @note ���urlΪ�գ�����<code>QQApi#sendMessage:</code>ʱ������FALSE
		 }
		
	end;
	
	QQApiAudioObjectClass=interface(QQApiURLObjectClass)//
	['{45EBDCE3-11B1-4496-B45B-47AD2E2B4B99}']
		[MethodName('objectWithURL:title:description:previewImageData:')]
		{+} function objectWithURLtitledescriptionpreviewImageData(url:NSURL{*};title:NSString{*};description:NSString{*};data:NSData{*}):id;cdecl;
		[MethodName('objectWithURL:title:description:previewImageURL:')]
		{+} function objectWithURLtitledescriptionpreviewImageURL(url:NSURL{*};title:NSString{*};description:NSString{*};previewURL:NSURL{*}):id;cdecl;
	end;
	
	TQQApiAudioObject=class(TOCGenericImport<QQApiAudioObjectClass,QQApiAudioObject>)
	end;
	
	// QQApiVideoObject
	{* @brief ��ƵURL����
	 ���ڷ���Ŀ������Ϊ��Ƶ��URL�Ķ���
	 
	 QQApiVideoObject���͵ķ���Ŀǰ��Android��PC QQ�Ͻ�����Ϣʱ��չ���д����ƣ����ֻ�QQ�汾�Ժ����֧��
	 Ŀǰ���Ҫ������Ƶ���Ƽ�ʹ�� QQApiNewsObject ����
	 }
	QQApiVideoObject=interface(QQApiURLObject)//
	['{5C1D3BC5-A79A-4AE6-9A64-0B248055C663}']
		
		function flashURL:NSURL{*};cdecl;///<��ƵURL��ַ���512���ַ�
		procedure setFlashURL(flashURL:NSURL{*});cdecl;///<��ƵURL��ַ���512���ַ�
		
		{*
		 ��ȡһ��autorelease��<code>QQApiVideoObject</code>
		 @param url ��Ƶ���ݵ�Ŀ��URL
		 @param title �������ݵı���
		 @param description �������ݵ�����
		 @param data �������ݵ�Ԥ��ͼ��
		 @note ���urlΪ�գ�����<code>QQApi#sendMessage:</code>ʱ������FALSE
		 }
		
		{*
		 ��ȡһ��autorelease��<code>QQApiVideoObject</code>
		 @param url ��Ƶ���ݵ�Ŀ��URL
		 @param title �������ݵı���
		 @param description �������ݵ�����
		 @param previewURL �������ݵ�Ԥ��ͼ��URL
		 @note ���urlΪ�գ�����<code>QQApi#sendMessage:</code>ʱ������FALSE
		 }
		
	end;
	
	QQApiVideoObjectClass=interface(QQApiURLObjectClass)//
	['{1A085602-D74A-4FA4-B7AB-C70D3762691F}']
		[MethodName('objectWithURL:title:description:previewImageData:')]
		{+} function objectWithURLtitledescriptionpreviewImageData(url:NSURL{*};title:NSString{*};description:NSString{*};data:NSData{*}):id;cdecl;
		[MethodName('objectWithURL:title:description:previewImageURL:')]
		{+} function objectWithURLtitledescriptionpreviewImageURL(url:NSURL{*};title:NSString{*};description:NSString{*};previewURL:NSURL{*}):id;cdecl;
	end;
	
	TQQApiVideoObject=class(TOCGenericImport<QQApiVideoObjectClass,QQApiVideoObject>)
	end;
	
	// QQApiNewsObject
	{* @brief ����URL����
	 ���ڷ���Ŀ������Ϊ���ŵ�URL�Ķ���
	 }
	QQApiNewsObject=interface(QQApiURLObject)//
	['{FF05C11C-9C05-4A8F-9F5F-8824193FA7FB}']
		{*
		 ��ȡһ��autorelease��<code>QQApiNewsObject</code>
		 @param url ��Ƶ���ݵ�Ŀ��URL
		 @param title �������ݵı���
		 @param description �������ݵ�����
		 @param data �������ݵ�Ԥ��ͼ��
		 @note ���urlΪ�գ�����<code>QQApi#sendMessage:</code>ʱ������FALSE
		 }
		
		{*
		 ��ȡһ��autorelease��<code>QQApiNewsObject</code>
		 @param url ��Ƶ���ݵ�Ŀ��URL
		 @param title �������ݵı���
		 @param description �������ݵ�����
		 @param previewURL �������ݵ�Ԥ��ͼ��URL
		 @note ���urlΪ�գ�����<code>QQApi#sendMessage:</code>ʱ������FALSE
		 }
		
	end;
	
	QQApiNewsObjectClass=interface(QQApiURLObjectClass)//
	['{A486C1D7-701A-4823-99AD-F7921227EEF4}']
		[MethodName('objectWithURL:title:description:previewImageData:')]
		{+} function objectWithURLtitledescriptionpreviewImageData(url:NSURL{*};title:NSString{*};description:NSString{*};data:NSData{*}):id;cdecl;
		[MethodName('objectWithURL:title:description:previewImageURL:')]
		{+} function objectWithURLtitledescriptionpreviewImageURL(url:NSURL{*};title:NSString{*};description:NSString{*};previewURL:NSURL{*}):id;cdecl;
	end;
	
	TQQApiNewsObject=class(TOCGenericImport<QQApiNewsObjectClass,QQApiNewsObject>)
	end;
	
	// QQApiPayObject
	{* \brief ֧������
	 }
	QQApiPayObject=interface(QQApiObject)//
	['{85BEC52C-17C8-4E6C-BBA6-D96EC3D8F416}']
		function OrderNo:NSString{*};cdecl;///<֧�������ţ�����
		procedure setOrderNo(OrderNo:NSString{*});cdecl;///<֧�������ţ�����
		function AppInfo:NSString{*};cdecl;///<֧����Դ��Ϣ������
		procedure setAppInfo(AppInfo:NSString{*});cdecl;///<֧����Դ��Ϣ������
		
		[MethodName('initWithOrderNo:AppInfo:')]
		{-} function initWithOrderNoAppInfo(OrderNo:NSString{*};AppInfo:NSString{*}):id;cdecl;
	end;
	
	QQApiPayObjectClass=interface(QQApiObjectClass)//
	['{677EE312-6A52-46DB-B619-C8AAC94DCEE2}']
		[MethodName('objectWithOrderNo:AppInfo:')]
		{+} function objectWithOrderNoAppInfo(OrderNo:NSString{*};AppInfo:NSString{*}):id;cdecl;
	end;
	
	TQQApiPayObject=class(TOCGenericImport<QQApiPayObjectClass,QQApiPayObject>)
	end;
	
	// QQApiCommonContentObject;
	{* @brief ͨ��ģ�����Ͷ���
	 ���ڷ���һ���̶���ʾģ���ͼ�Ļ��Ŷ���
	 @note ͼƬ�б���ı��б���ͬʱΪ��
	 }
	QQApiCommonContentObject=interface(QQApiObject)//
	['{DD54D336-C8AA-4BA3-8A5E-F0DFAC7AEDA4}']
		{*
		 Ԥ����Ľ��沼������
		 }
//		function int:unsigned;cdecl;
//		procedure setInt(int:unsigned);cdecl;
		function previewImageData:NSData{*};cdecl;///<Ԥ��ͼ
		procedure setPreviewImageData(previewImageData:NSData{*});cdecl;///<Ԥ��ͼ
		function textArray:NSArray{*};cdecl;///<�ı��б�
		procedure setTextArray(textArray:NSArray{*});cdecl;///<�ı��б�
		function pictureDataArray:NSArray{*};cdecl;///<ͼƬ�б�
		procedure setPictureDataArray(pictureDataArray:NSArray{*});cdecl;///<ͼƬ�б�
		{*
		 ��һ��NSDictionary����ת��ΪQQApiCommomContentObject������޷�ת�����򷵻ؿ�
		 }
		{-} function toDictionary:PNSDictionary{*};cdecl;
	end;
	
	QQApiCommonContentObjectClass=interface(QQApiObjectClass)//
	['{D993D623-F72A-44E9-BD04-F2149B1414B8}']
		[MethodName('objectWithLayoutType:textArray:pictureArray:previewImageData:')]
		{+} function objectWithLayoutTypetextArraypictureArraypreviewImageData(layoutType:Integer;textArray:NSArray{*};pictureArray:NSArray{*};data:NSData{*}):id;cdecl;
		{+} function objectWithDictionary(dic:PNSDictionary{*}):id;cdecl;
	end;
	
	TQQApiCommonContentObject=class(TOCGenericImport<QQApiCommonContentObjectClass,QQApiCommonContentObject>)
	end;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Ad item object definition
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{* @brief ������ݶ���
	 }
	QQApiAdItem=interface(NSObject)//
	['{23D99754-EB3B-4CD5-B944-0E702C4B555C}']
		function title:NSString{*};cdecl;///<����
		procedure setTitle(title:NSString{*});cdecl;///<����
		function description:NSString{*};cdecl;///<����
		procedure setDescription(description:NSString{*});cdecl;///<����
		function imageData:NSData{*};cdecl;///<���ͼƬ
		procedure setImageData(imageData:NSData{*});cdecl;///<���ͼƬ
		function target:NSURL{*};cdecl;///<���Ŀ������
		procedure setTarget(target:NSURL{*});cdecl;///<���Ŀ������
	end;
	
	QQApiAdItemClass=interface(NSObjectClass)//
	['{6EAD7753-C483-4946-A6D7-911AE2B7B72E}']
	end;
	
	TQQApiAdItem=class(TOCGenericImport<QQApiAdItemClass,QQApiAdItem>)
	end;
	
	// QQApiWPAObject
	{* \brief ����WPA����
	 }
	QQApiWPAObject=interface(QQApiObject)//
	['{1EE3BE45-4C43-42D7-9393-B81D8CBDFE98}']
		function uin:NSString{*};cdecl;///<��Ҫ�Ի���QQ��
		procedure setUin(uin:NSString{*});cdecl;///<��Ҫ�Ի���QQ��
		
		{-} function initWithUin(uin:NSString{*}):id;cdecl;
	end;
	
	QQApiWPAObjectClass=interface(QQApiObjectClass)//
	['{36C05D6D-4E2B-4498-9527-398F51D1FE92}']
		{+} function objectWithUin(uin:NSString{*}):id;cdecl;
	end;
	
	TQQApiWPAObject=class(TOCGenericImport<QQApiWPAObjectClass,QQApiWPAObject>)
	end;
	
	// QQApiAddFriendObject
	{* \brief ��Ӻ���
	 }
	QQApiAddFriendObject=interface(QQApiObject)//
	['{D4D9D212-5296-4B65-B049-3948F0941C9E}']
		function openID:NSString{*};cdecl;
		procedure setOpenID(openID:NSString{*});cdecl;
		function subID:NSString{*};cdecl;
		procedure setSubID(subID:NSString{*});cdecl;
		function remark:NSString{*};cdecl;
		procedure setRemark(remark:NSString{*});cdecl;
		
		{-} function initWithOpenID(openID:NSString{*}):id;cdecl;
		
	end;
	
	QQApiAddFriendObjectClass=interface(QQApiObjectClass)//
	['{ADF111E7-DCE4-434E-908E-0884E73087F5}']
		{+} function objecWithOpenID(openID:NSString{*}):id;cdecl;
	end;
	
	TQQApiAddFriendObject=class(TOCGenericImport<QQApiAddFriendObjectClass,QQApiAddFriendObject>)
	end;
	
	// QQApiGameConsortiumBindingGroupObject
	{* \brief ��Ϸ�����Ⱥ
	 }
	QQApiGameConsortiumBindingGroupObject=interface(QQApiObject)//
	['{B4950ACB-E91F-4A24-BD98-BD962BB4F059}']
		function signature:NSString{*};cdecl;
		procedure setSignature(signature:NSString{*});cdecl;
		function unionid:NSString{*};cdecl;
		procedure setUnionid(unionid:NSString{*});cdecl;
		function zoneID:NSString{*};cdecl;
		procedure setZoneID(zoneID:NSString{*});cdecl;
		function appDisplayName:NSString{*};cdecl;
		procedure setAppDisplayName(appDisplayName:NSString{*});cdecl;
		
		[MethodName('initWithGameConsortium:unionid:zoneID:appDisplayName:')]
		{-} function initWithGameConsortiumunionidzoneIDappDisplayName(signature:NSString{*};unionid:NSString{*};zoneID:NSString{*};appDisplayName:NSString{*}):id;cdecl;
		
	end;
	
	QQApiGameConsortiumBindingGroupObjectClass=interface(QQApiObjectClass)//
	['{446D123E-29D0-4154-B1A7-DBBAB96BA10D}']
		[MethodName('objectWithGameConsortium:unionid:zoneID:appDisplayName:')]
		{+} function objectWithGameConsortiumunionidzoneIDappDisplayName(signature:NSString{*};unionid:NSString{*};zoneID:NSString{*};appDisplayName:NSString{*}):id;cdecl;
	end;
	
	TQQApiGameConsortiumBindingGroupObject=class(TOCGenericImport<QQApiGameConsortiumBindingGroupObjectClass,QQApiGameConsortiumBindingGroupObject>)
	end;
	
	// QQApiGameConsortiumBindingGroupObject
	{* \brief ����Ⱥ
	 }
	QQApiJoinGroupObject=interface(QQApiObject)//
	['{9091CEC2-F88A-48DE-8676-0C81F864BD32}']
		function groupUin:NSString{*};cdecl;
		procedure setGroupUin(groupUin:NSString{*});cdecl;
		function groupKey:NSString{*};cdecl;
		procedure setGroupKey(groupKey:NSString{*});cdecl;
		
		[MethodName('initWithGroupInfo:key:')]
		{-} function initWithGroupInfokey(groupUin:NSString{*};groupKey:NSString{*}):id;cdecl;
		
	end;
	
	QQApiJoinGroupObjectClass=interface(QQApiObjectClass)//
	['{61961ED3-5310-4A6C-9450-48538DAF96BD}']
		[MethodName('objectWithGroupInfo:key:')]
		{+} function objectWithGroupInfokey(groupUin:NSString{*};groupKey:NSString{*}):id;cdecl;
		{+} function objectWithGroupKey(groupKey:NSString{*}):id;cdecl;
	end;
	
	TQQApiJoinGroupObject=class(TOCGenericImport<QQApiJoinGroupObjectClass,QQApiJoinGroupObject>)
	end;
	
	// QQApiGroupChatObject
	{* \brief ����Ⱥ�Ự����
	 }
	QQApiGroupChatObject=interface(QQApiObject)//
	['{8FB8F35A-B22F-4DCE-A58F-DA3EE095EDDA}']
		function groupID:NSString{*};cdecl;///<��Ҫ�Ի���Ⱥ��
		procedure setGroupID(groupID:NSString{*});cdecl;///<��Ҫ�Ի���Ⱥ��
		
		{-} function initWithGroup(groupID:NSString{*}):id;cdecl;
	end;
	
	QQApiGroupChatObjectClass=interface(QQApiObjectClass)//
	['{9FAFE44B-484E-478F-9607-DE3F8AB77F6A}']
		{+} function objectWithGroup(groupID:NSString{*}):id;cdecl;
	end;
	
	TQQApiGroupChatObject=class(TOCGenericImport<QQApiGroupChatObjectClass,QQApiGroupChatObject>)
	end;
	
	//#pragma mark - QQApi������Ϣ����
	
	{*
	 QQApi������Ϣ����
	 }
	Enum_Request=(
	    EGETMESSAGEFROMQQREQTYPE = 0,   ///< ��Q -> ������Ӧ�ã����������Ӧ������Q������Ϣ
	    ESENDMESSAGETOQQREQTYPE = 1,    ///< ������Ӧ�� -> ��Q��������Ӧ������Q������Ϣ
	    ESHOWMESSAGEFROMQQREQTYPE = 2   ///< ��Q -> ������Ӧ�ã����������Ӧ��չ����Ϣ�е�����
	);
	
	{*
	 QQApiӦ����Ϣ����
	 }
	Enum_Response=(
	    ESHOWMESSAGEFROMQQRESPTYPE = 0, ///< ������Ӧ�� -> ��Q��������Ӧ��Ӧ����Ϣչ�ֽ��
	    EGETMESSAGEFROMQQRESPTYPE = 1,  ///< ������Ӧ�� -> ��Q��������Ӧ�û�Ӧ������Q����Ϣ
	    ESENDMESSAGETOQQRESPTYPE = 2    ///< ��Q -> ������Ӧ�ã���QӦ���������Ϣ�Ľ��
	);
	
	{*
	 QQApi������Ϣ����
	 }
	QQBaseReq=interface(NSObject)//
	['{79F08B35-08C3-4905-B251-C16DDBDF99A0}']
		
		{* ������Ϣ���ͣ��μ�\ref QQApiInterfaceReqType }
		[MethodName('type:')]
		function _type:Integer;cdecl;
		procedure setType(_type:Integer);cdecl;
		
	end;
	
	QQBaseReqClass=interface(NSObjectClass)//
	['{DC60D82B-06B9-4887-9283-32254A1F4EED}']
	end;
	
	TQQBaseReq=class(TOCGenericImport<QQBaseReqClass,QQBaseReq>)
	end;
	
	{*
	 QQApiӦ����Ϣ����
	 }
	QQBaseResp=interface(NSObject)//
	['{7078A6AD-74A9-4254-9B2B-83A50865FA9D}']
		
		{* �������� }
		function result:NSString{*};cdecl;
		procedure setResult(result:NSString{*});cdecl;
		
		{* �������������Ϣ }
		function errorDescription:NSString{*};cdecl;
		procedure setErrorDescription(errorDescription:NSString{*});cdecl;
		
		{* Ӧ����Ϣ���ͣ��μ�\ref QQApiInterfaceRespType }
		[MethodName('type:')]
		function _type:Integer;cdecl;
		procedure setType(_type:Integer);cdecl;
		
		{* ��չ��Ϣ }
		function extendInfo:NSString{*};cdecl;
		procedure setExtendInfo(extendInfo:NSString{*});cdecl;
		
	end;
	
	QQBaseRespClass=interface(NSObjectClass)//
	['{34F67D86-7342-4555-A16D-9ECBFB019E21}']
	end;
	
	TQQBaseResp=class(TOCGenericImport<QQBaseRespClass,QQBaseResp>)
	end;
	
	{*
	 GetMessageFromQQReq���������
	 }
	GetMessageFromQQReq=interface(QQBaseReq)//
	['{4128B26A-57CC-446D-A9CF-BCF38C9997E6}']
		
		{*
		 ����һ��GetMessageFromQQReq����ʵ��
		 }
		
	end;
	
	GetMessageFromQQReqClass=interface(QQBaseReqClass)//
	['{1BCDF4ED-6BD4-4DF1-8C8D-8C8065801CEF}']
		{+} function req:GetMessageFromQQReq{*};cdecl;
	end;
	
	TGetMessageFromQQReq=class(TOCGenericImport<GetMessageFromQQReqClass,GetMessageFromQQReq>)
	end;
	
	{*
	 GetMessageFromQQRespӦ�������
	 }
	GetMessageFromQQResp=interface(QQBaseResp)//
	['{BEFFE7F6-31C0-4D4E-AD1B-D9938FE90ED1}']
		
		{*
		 ����һ��GetMessageFromQQRespӦ��ʵ��
		 \param message ���������Ϣʵ��
		 \return �´�����GetMessageFromQQRespӦ��ʵ��
		 }
		
		{* ���������Ϣ }
		function message:QQApiObject{*};cdecl;
		procedure setMessage(message:QQApiObject{*});cdecl;
		
	end;
	
	GetMessageFromQQRespClass=interface(QQBaseRespClass)//
	['{CDF0FF5F-F118-4049-A966-8B06C7636A57}']
		{+} function respWithContent(message:QQApiObject{*}):GetMessageFromQQResp{*};cdecl;
	end;
	
	TGetMessageFromQQResp=class(TOCGenericImport<GetMessageFromQQRespClass,GetMessageFromQQResp>)
	end;
	
	{*
	 SendMessageToQQReq���������
	 }
	SendMessageToQQReq=interface(QQBaseReq)//
	['{4220553D-6489-4A15-949A-FDE8FD89CDE8}']
		
		{*
		 ����һ��SendMessageToQQReq����ʵ��
		 \param message ���������Ϣʵ��
		 \return �´�����SendMessageToQQReq����ʵ��
		 }
		
		{* ���������Ϣ }
		function message:QQApiObject{*};cdecl;
		procedure setMessage(message:QQApiObject{*});cdecl;
		
	end;
	
	SendMessageToQQReqClass=interface(QQBaseReqClass)//
	['{108645EB-C731-42FE-97A1-3C71717F8260}']
		{+} function reqWithContent(message:QQApiObject{*}):SendMessageToQQReq{*};cdecl;
	end;
	
	TSendMessageToQQReq=class(TOCGenericImport<SendMessageToQQReqClass,SendMessageToQQReq>)
	end;
	
	{*
	 SendMessageToQQRespӦ�������
	 }
	SendMessageToQQResp=interface(QQBaseResp)//
	['{D55F07F2-4487-4F78-82FD-1AC5D1D6FDDA}']
		
		{*
		 ����һ��SendMessageToQQRespӦ��ʵ��
		 \param result ��������
		 \param errDesp �������������Ϣ
		 \param extendInfo ��չ��Ϣ
		 \return �´�����SendMessageToQQRespӦ��ʵ��
		 }
		
	end;
	
	SendMessageToQQRespClass=interface(QQBaseRespClass)//
	['{2F02F401-51E8-46F0-A9B6-4430C673F6E0}']
		[MethodName('respWithResult:errorDescription:extendInfo:')]
		{+} function respWithResulterrorDescriptionextendInfo(result:NSString{*};errDesp:NSString{*};extendInfo:NSString{*}):SendMessageToQQResp{*};cdecl;
	end;
	
	TSendMessageToQQResp=class(TOCGenericImport<SendMessageToQQRespClass,SendMessageToQQResp>)
	end;
	
	{*
	 ShowMessageFromQQReq���������
	 }
	ShowMessageFromQQReq=interface(QQBaseReq)//
	['{7D216E48-EE3E-4985-B348-410002D026DF}']
		
		{*
		 ����һ��ShowMessageFromQQReq����ʵ��
		 \param message �����չ����Ϣʵ��
		 \return �´�����ShowMessageFromQQReq����ʵ��
		 }
		
		{* �����չ����Ϣ }
		function message:QQApiObject{*};cdecl;
		procedure setMessage(message:QQApiObject{*});cdecl;
		
	end;
	
	ShowMessageFromQQReqClass=interface(QQBaseReqClass)//
	['{E620F347-E200-4E36-A9C4-132E4342414E}']
		{+} function reqWithContent(message:QQApiObject{*}):ShowMessageFromQQReq{*};cdecl;
	end;
	
	TShowMessageFromQQReq=class(TOCGenericImport<ShowMessageFromQQReqClass,ShowMessageFromQQReq>)
	end;
	
	{*
	 ShowMessageFromQQRespӦ�������
	 }
	ShowMessageFromQQResp=interface(QQBaseResp)//
	['{3FC03F32-4D37-4DB4-9A4A-5014947A65EC}']
		
		{*
		 ����һ��ShowMessageFromQQRespӦ��ʵ��
		 \param result չ����Ϣ���
		 \param errDesp �������������Ϣ
		 \return �´�����ShowMessageFromQQRespӦ��ʵ��
		 }
		
	end;
	
	ShowMessageFromQQRespClass=interface(QQBaseRespClass)//
	['{D089B115-94FB-487B-9D0F-AAE6A97A163B}']
		[MethodName('respWithResult:errorDescription:')]
		{+} function respWithResulterrorDescription(result:NSString{*};errDesp:NSString{*}):ShowMessageFromQQResp{*};cdecl;
	end;
	
	TShowMessageFromQQResp=class(TOCGenericImport<ShowMessageFromQQRespClass,ShowMessageFromQQResp>)
	end;
	
	//#endif
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QQApiObject_FakeLoader : QQApiObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiObject';
function QQApiResultObject_FakeLoader : QQApiResultObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiResultObject';
function QQApiTextObject_FakeLoader : QQApiTextObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiTextObject';
function QQApiURLObject_FakeLoader : QQApiURLObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiURLObject';
function QQApiExtendObject_FakeLoader : QQApiExtendObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiExtendObject';
function QQApiImageObject_FakeLoader : QQApiImageObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiImageObject';
function QQApiImageArrayForQZoneObject_FakeLoader : QQApiImageArrayForQZoneObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiImageArrayForQZoneObject';
function QQApiVideoForQZoneObject_FakeLoader : QQApiVideoForQZoneObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiVideoForQZoneObject';
function QQApiWebImageObject_FakeLoader : QQApiWebImageObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiWebImageObject';
function QQApiGroupTribeImageObject_FakeLoader : QQApiGroupTribeImageObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiGroupTribeImageObject';
function QQApiFileObject_FakeLoader : QQApiFileObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiFileObject';
function QQApiAudioObject_FakeLoader : QQApiAudioObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiAudioObject';
function QQApiVideoObject_FakeLoader : QQApiVideoObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiVideoObject';
function QQApiNewsObject_FakeLoader : QQApiNewsObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiNewsObject';
function QQApiPayObject_FakeLoader : QQApiPayObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiPayObject';
function QQApiCommonContentObject_FakeLoader : QQApiCommonContentObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiCommonContentObject';
function QQApiAdItem_FakeLoader : QQApiAdItem; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiAdItem';
function QQApiWPAObject_FakeLoader : QQApiWPAObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiWPAObject';
function QQApiAddFriendObject_FakeLoader : QQApiAddFriendObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiAddFriendObject';
function QQApiGameConsortiumBindingGroupObject_FakeLoader : QQApiGameConsortiumBindingGroupObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiGameConsortiumBindingGroupObject';
function QQApiJoinGroupObject_FakeLoader : QQApiJoinGroupObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiJoinGroupObject';
function QQApiGroupChatObject_FakeLoader : QQApiGroupChatObject; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQApiGroupChatObject';
function QQBaseReq_FakeLoader : QQBaseReq; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQBaseReq';
function QQBaseResp_FakeLoader : QQBaseResp; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_QQBaseResp';
function GetMessageFromQQReq_FakeLoader : GetMessageFromQQReq; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_GetMessageFromQQReq';
function GetMessageFromQQResp_FakeLoader : GetMessageFromQQResp; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_GetMessageFromQQResp';
function SendMessageToQQReq_FakeLoader : SendMessageToQQReq; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_SendMessageToQQReq';
function SendMessageToQQResp_FakeLoader : SendMessageToQQResp; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_SendMessageToQQResp';
function ShowMessageFromQQReq_FakeLoader : ShowMessageFromQQReq; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_ShowMessageFromQQReq';
function ShowMessageFromQQResp_FakeLoader : ShowMessageFromQQResp; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_ShowMessageFromQQResp';
{$O+}


{$ENDIF}

end.

