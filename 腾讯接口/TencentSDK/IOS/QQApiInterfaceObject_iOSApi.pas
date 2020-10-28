///
/// \file QQApiInterfaceObject.h
/// \brief QQApiInterface所依赖的请求及应答消息对象封装帮助类
///
/// Created by Tencent on 12-5-15.
/// Copyright (c) 2012年 Tencent. All rights reserved.
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
	//    //qzone分享不支持text类型分享
	    EQQAPIQZONENOTSUPPORTTEXT = 10000,
	//    //qzone分享不支持image类型分享
	    EQQAPIQZONENOTSUPPORTIMAGE = 10001,
	//    //当前QQ版本太低，需要更新至新版本才可以支持
	    EQQAPIVERSIONNEEDUPDATE = 10002//,
	);
	
	//#pragma mark - QQApiObject(分享对象类型)
	
	// QQApiObject control flags
	
	
	
	
	
	
	
	
	
	// QQApiObject
	{* \brief 所有在QQ及插件间发送的数据对象的根类。
	 }
	QQApiObject=interface(NSObject)//
	['{630F0296-D3E2-41D4-BA1F-16E541DF8FE0}']
		function title:NSString{*};cdecl;///< 标题，最长128个字符
		procedure setTitle(title:NSString{*});cdecl;///< 标题，最长128个字符
		function description:NSString{*};cdecl;///<简要描述，最长512个字符
		procedure setDescription(description:NSString{*});cdecl;///<简要描述，最长512个字符
		
		function cflag:uint64_t;cdecl;
		procedure setCflag(cflag:uint64_t);cdecl;

	end;
	
	QQApiObjectClass=interface(NSObjectClass)//
	['{D195AC9B-FB7B-4FB4-95F9-95D1CCECA3FD}']
	end;
	
	TQQApiObject=class(TOCGenericImport<QQApiObjectClass,QQApiObject>)
	end;
	
	// QQApiResultObject
	{* \brief 用于请求回应的数据类型。
	 <h3>可能错误码及描述如下:</h3>
	 <TABLE>
	 <TR><TD>error</TD><TD>errorDescription</TD><TD>注释</TD></TR>
	 <TR><TD>0</TD><TD>nil</TD><TD>成功</TD></TR>
	 <TR><TD>-1</TD><TD>param error</TD><TD>参数错误</TD></TR>
	 <TR><TD>-2</TD><TD>group code is invalid</TD><TD>该群不在自己的群列表里面</TD></TR>
	 <TR><TD>-3</TD><TD>upload photo failed</TD><TD>上传图片失败</TD></TR>
	 <TR><TD>-4</TD><TD>user give up the current operation</TD><TD>用户放弃当前操作</TD></TR>
	 <TR><TD>-5</TD><TD>client internal error</TD><TD>客户端内部处理错误</TD></TR>
	 </TABLE>
	 }
	QQApiResultObject=interface(QQApiObject)//
	['{D9934052-1064-4BF9-9645-00F8E6A018F4}']
		function error:NSString{*};cdecl;///<错误
		procedure setError(error:NSString{*});cdecl;///<错误
		function errorDescription:NSString{*};cdecl;///<错误描述
		procedure setErrorDescription(errorDescription:NSString{*});cdecl;///<错误描述
		function extendInfo:NSString{*};cdecl;///<扩展信息
		procedure setExtendInfo(extendInfo:NSString{*});cdecl;///<扩展信息
	end;
	
	QQApiResultObjectClass=interface(QQApiObjectClass)//
	['{E8882D88-7697-4469-B57F-C94816800A9F}']
	end;
	
	TQQApiResultObject=class(TOCGenericImport<QQApiResultObjectClass,QQApiResultObject>)
	end;
	
	// QQApiTextObject
	{* \brief 文本对象
	 }
	QQApiTextObject=interface(QQApiObject)//
	['{064B9C00-67EA-4ACE-BA5B-012AC17858B6}']
		function text:NSString{*};cdecl;///<文本内容，必填，最长1536个字符
		procedure setText(text:NSString{*});cdecl;///<文本内容，必填，最长1536个字符
		
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
	
	{* @brief URL对象类型。
	 
	 包括URL地址，URL地址所指向的目标类型及预览图像。
	 }
	QQApiURLObject=interface(QQApiObject)//
	['{963B6C05-8DBF-482F-B69F-4947D5145008}']
		{*
		 URL地址所指向的目标类型.
		 @note 参见QQApi.h 中的 QQApiURLTargetType 定义.
		 }
		function targetContentType:QQApiURLTargetType;cdecl;
		procedure setTargetContentType(targetContentType:QQApiURLTargetType);cdecl;
		
		function url:NSURL{*};cdecl;///<URL地址,必填，最长512个字符
		procedure setUrl(url:NSURL{*});cdecl;///<URL地址,必填，最长512个字符
		function previewImageData:NSData{*};cdecl;///<预览图像数据，最大1M字节
		procedure setPreviewImageData(previewImageData:NSData{*});cdecl;///<预览图像数据，最大1M字节
		function previewImageURL:NSURL{*};cdecl;///<预览图像URL **预览图像数据与预览图像URL可二选一
		procedure setPreviewImageURL(previewImageURL:NSURL{*});cdecl;///<预览图像URL **预览图像数据与预览图像URL可二选一
		
		{*
		 初始化方法
		 }
		[MethodName('initWithURL:title:description:previewImageData:targetContentType:')]
		{-} function initWithURLtitledescriptionpreviewImageDatatargetContentType(url:NSURL{*};title:NSString{*};description:NSString{*};data:NSData{*};targetContentType:QQApiURLTargetType):id;cdecl;
		[MethodName('initWithURL:title:description:previewImageURL:targetContentType:')]
		{-} function initWithURLtitledescriptionpreviewImageURLtargetContentType(url:NSURL{*};title:NSString{*};description:NSString{*};previewURL:NSURL{*};targetContentType:QQApiURLTargetType):id;cdecl;
		{*
		 工厂方法,获取一个QQApiURLObject对象
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
	{* @brief 扩展数据类型
	 }
	QQApiExtendObject=interface(QQApiObject)//
	['{D74CEF39-6965-4635-B0E3-C53C2E96DC3C}']
		function data:NSData{*};cdecl;///<具体数据内容，必填，最大5M字节
		procedure setData(data:NSData{*});cdecl;///<具体数据内容，必填，最大5M字节
		function previewImageData:NSData{*};cdecl;///<预览图像，最大1M字节
		procedure setPreviewImageData(previewImageData:NSData{*});cdecl;///<预览图像，最大1M字节
		function imageDataArray:NSArray{*};cdecl;///图片数组(多图暂只支持分享到手机QQ收藏功能)
		procedure setImageDataArray(imageDataArray:NSArray{*});cdecl;///图片数组(多图暂只支持分享到手机QQ收藏功能)
		
		{*
		 初始化方法
		 @param data 数据内容
		 @param previewImageData 用于预览的图片
		 @param title 标题
		 @param description 此对象，分享的描述
		 }
		[MethodName('initWithData:previewImageData:title:description:')]
		{-} function initWithDatapreviewImageDatatitledescription(data:NSData{*};previewImageData:NSData{*};title:NSString{*};description:NSString{*}):id;cdecl;
		
		{*
		 初始化方法
		 @param data 数据内容
		 @param title 标题
		 @param description 此对象，分享的描述
		 @param imageDataArray 发送的多张图片队列
		 }
		[MethodName('initWithData:previewImageData:title:description:imageDataArray:')]
		{-} function initWithDatapreviewImageDatatitledescriptionimageDataArray(data:NSData{*};previewImageData:NSData{*};title:NSString{*};description:NSString{*};imageDataArray:NSArray{*}):id;cdecl;
		
		{*
		 helper方法获取一个autorelease的<code>QQApiExtendObject</code>对象
		 @param data 数据内容
		 @param previewImageData 用于预览的图片
		 @param title 标题
		 @param description 此对象，分享的描述
		 @return
		 一个自动释放的<code>QQApiExtendObject</code>实例
		 }
		
		{*
		 helper方法获取一个autorelease的<code>QQApiExtendObject</code>对象
		 @param data 数据内容
		 @param previewImageData 用于预览的图片
		 @param title 标题
		 @param description 此对象，分享的描述
		 @param imageDataArray 发送的多张图片队列
		 @return
		 一个自动释放的<code>QQApiExtendObject</code>实例
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
	{* @brief 图片对象
	 用于分享图片内容的对象，是一个指定为图片类型的<code>QQApiExtendObject</code>
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
	{* @brief 图片对象
	 用于分享图片到空间，走写说说路径，是一个指定为图片类型的，当图片数组为空时，默认走文本写说说<code>QQApiObject</code>
	 }
	QQApiImageArrayForQZoneObject=interface(QQApiObject)//
	['{AADAC97D-2BCD-41EA-9CB0-0C1A59133724}']
		
		function imageDataArray:NSArray{*};cdecl;///图片数组
		procedure setImageDataArray(imageDataArray:NSArray{*});cdecl;///图片数组
		
		{*
		 初始化方法
		 @param imageDataArray 图片数组
		 @param title 写说说的内容，可以为空
		 }
		[MethodName('initWithImageArrayData:title:')]
		{-} function initWithImageArrayDatatitle(imageDataArray:NSArray{*};title:NSString{*}):id;cdecl;
		
		{*
		 helper方法获取一个autorelease的<code>QQApiExtendObject</code>对象
		 @param title 写说说的内容，可以为空
		 @param imageDataArray 发送的多张图片队列
		 @return
		 一个自动释放的<code>QQApiExtendObject</code>实例
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
	{* @brief 视频对象
	 用于分享视频到空间，走写说说路径<code>QQApiObject</code>
	 assetURL可传ALAsset的ALAssetPropertyAssetURL，或者PHAsset的localIdentifier
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
	{* @brief 图片对象
	 用于分享网络图片内容的对象，是一个指定网络图片url的: 该类型只在2.9.0的h5分享中才支持，
	 原有的手q分享是不支持该类型的。
	 }
	QQApiWebImageObject=interface(QQApiObject)//
	['{724DEA5E-0E63-4369-88B0-9C08D6DDD286}']
		
		function previewImageURL:NSURL{*};cdecl;///<预览图像URL
		procedure setPreviewImageURL(previewImageURL:NSURL{*});cdecl;///<预览图像URL
		
		{*
		 初始化方法
		 @param previewImageURL 用于预览的图片
		 @param title 标题
		 @param description 此对象，分享的描述
		 }
		[MethodName('initWithPreviewImageURL:title:description:')]
		{-} function initWithPreviewImageURLtitledescription(previewImageURL:NSURL{*};title:NSString{*};description:NSString{*}):id;cdecl;
		
		{*
		 helper方法获取一个autorelease的<code>QQApiWebImageObject</code>对象
		 @param previewImageURL 用于预览的图片
		 @param title 标题
		 @param description 此对象，分享的描述
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
	{* @brief 群部落图片对象
	 用于分享图片内容的对象，是一个指定为图片类型的 可以指定一些其他的附加数据<code>QQApiExtendObject</code>
	 }
	QQApiGroupTribeImageObject=interface(QQApiImageObject)//
	['{DEE74173-EF81-43A0-A8B1-C7889A7448EC}']
		
		
		
		
		// 群部落id
		function bid:NSString{*};cdecl;
		procedure setBid(bid:NSString{*});cdecl;
		
		// 群部落名称
		function bname:NSString{*};cdecl;
		procedure setBname(bname:NSString{*});cdecl;
		
	end;
	
	QQApiGroupTribeImageObjectClass=interface(QQApiImageObjectClass)//
	['{1B67A8D1-E7FE-400D-900D-71C9FEC41AC1}']
	end;
	
	TQQApiGroupTribeImageObject=class(TOCGenericImport<QQApiGroupTribeImageObjectClass,QQApiGroupTribeImageObject>)
	end;
	
	
	//QQApiFileObject
	{* @brief 本地文件对象(暂只支持分享到手机QQ数据线功能)
	 用于分享文件内容的对象，是一个指定为文件类型的<code>QQApiExtendObject</code>
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
	{* @brief 音频URL对象
	 用于分享目标内容为音频的URL的对象
	 }
	QQApiAudioObject=interface(QQApiURLObject)//
	['{547E6DB2-754A-4702-A1F6-4212F3A4832B}']
		
		function flashURL:NSURL{*};cdecl;///<音频URL地址，最长512个字符
		procedure setFlashURL(flashURL:NSURL{*});cdecl;///<音频URL地址，最长512个字符
		
		{*
		 获取一个autorelease的<code>QQApiAudioObject</code>
		 @param url 音频内容的目标URL
		 @param title 分享内容的标题
		 @param description 分享内容的描述
		 @param data 分享内容的预览图像
		 @note 如果url为空，调用<code>QQApi#sendMessage:</code>时将返回FALSE
		 }
		
		{*
		 获取一个autorelease的<code>QQApiAudioObject</code>
		 @param url 音频内容的目标URL
		 @param title 分享内容的标题
		 @param description 分享内容的描述
		 @param previewURL 分享内容的预览图像URL
		 @note 如果url为空，调用<code>QQApi#sendMessage:</code>时将返回FALSE
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
	{* @brief 视频URL对象
	 用于分享目标内容为视频的URL的对象
	 
	 QQApiVideoObject类型的分享，目前在Android和PC QQ上接收消息时，展现有待完善，待手机QQ版本以后更新支持
	 目前如果要分享视频，推荐使用 QQApiNewsObject 类型
	 }
	QQApiVideoObject=interface(QQApiURLObject)//
	['{5C1D3BC5-A79A-4AE6-9A64-0B248055C663}']
		
		function flashURL:NSURL{*};cdecl;///<视频URL地址，最长512个字符
		procedure setFlashURL(flashURL:NSURL{*});cdecl;///<视频URL地址，最长512个字符
		
		{*
		 获取一个autorelease的<code>QQApiVideoObject</code>
		 @param url 视频内容的目标URL
		 @param title 分享内容的标题
		 @param description 分享内容的描述
		 @param data 分享内容的预览图像
		 @note 如果url为空，调用<code>QQApi#sendMessage:</code>时将返回FALSE
		 }
		
		{*
		 获取一个autorelease的<code>QQApiVideoObject</code>
		 @param url 视频内容的目标URL
		 @param title 分享内容的标题
		 @param description 分享内容的描述
		 @param previewURL 分享内容的预览图像URL
		 @note 如果url为空，调用<code>QQApi#sendMessage:</code>时将返回FALSE
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
	{* @brief 新闻URL对象
	 用于分享目标内容为新闻的URL的对象
	 }
	QQApiNewsObject=interface(QQApiURLObject)//
	['{FF05C11C-9C05-4A8F-9F5F-8824193FA7FB}']
		{*
		 获取一个autorelease的<code>QQApiNewsObject</code>
		 @param url 视频内容的目标URL
		 @param title 分享内容的标题
		 @param description 分享内容的描述
		 @param data 分享内容的预览图像
		 @note 如果url为空，调用<code>QQApi#sendMessage:</code>时将返回FALSE
		 }
		
		{*
		 获取一个autorelease的<code>QQApiNewsObject</code>
		 @param url 视频内容的目标URL
		 @param title 分享内容的标题
		 @param description 分享内容的描述
		 @param previewURL 分享内容的预览图像URL
		 @note 如果url为空，调用<code>QQApi#sendMessage:</code>时将返回FALSE
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
	{* \brief 支付对象
	 }
	QQApiPayObject=interface(QQApiObject)//
	['{85BEC52C-17C8-4E6C-BBA6-D96EC3D8F416}']
		function OrderNo:NSString{*};cdecl;///<支付订单号，必填
		procedure setOrderNo(OrderNo:NSString{*});cdecl;///<支付订单号，必填
		function AppInfo:NSString{*};cdecl;///<支付来源信息，必填
		procedure setAppInfo(AppInfo:NSString{*});cdecl;///<支付来源信息，必填
		
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
	{* @brief 通用模板类型对象
	 用于分享一个固定显示模板的图文混排对象
	 @note 图片列表和文本列表不能同时为空
	 }
	QQApiCommonContentObject=interface(QQApiObject)//
	['{DD54D336-C8AA-4BA3-8A5E-F0DFAC7AEDA4}']
		{*
		 预定义的界面布局类型
		 }
//		function int:unsigned;cdecl;
//		procedure setInt(int:unsigned);cdecl;
		function previewImageData:NSData{*};cdecl;///<预览图
		procedure setPreviewImageData(previewImageData:NSData{*});cdecl;///<预览图
		function textArray:NSArray{*};cdecl;///<文本列表
		procedure setTextArray(textArray:NSArray{*});cdecl;///<文本列表
		function pictureDataArray:NSArray{*};cdecl;///<图片列表
		procedure setPictureDataArray(pictureDataArray:NSArray{*});cdecl;///<图片列表
		{*
		 将一个NSDictionary对象转化为QQApiCommomContentObject，如果无法转换，则返回空
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
	{* @brief 广告数据对象
	 }
	QQApiAdItem=interface(NSObject)//
	['{23D99754-EB3B-4CD5-B944-0E702C4B555C}']
		function title:NSString{*};cdecl;///<名称
		procedure setTitle(title:NSString{*});cdecl;///<名称
		function description:NSString{*};cdecl;///<描述
		procedure setDescription(description:NSString{*});cdecl;///<描述
		function imageData:NSData{*};cdecl;///<广告图片
		procedure setImageData(imageData:NSData{*});cdecl;///<广告图片
		function target:NSURL{*};cdecl;///<广告目标链接
		procedure setTarget(target:NSURL{*});cdecl;///<广告目标链接
	end;
	
	QQApiAdItemClass=interface(NSObjectClass)//
	['{6EAD7753-C483-4946-A6D7-911AE2B7B72E}']
	end;
	
	TQQApiAdItem=class(TOCGenericImport<QQApiAdItemClass,QQApiAdItem>)
	end;
	
	// QQApiWPAObject
	{* \brief 发起WPA对象
	 }
	QQApiWPAObject=interface(QQApiObject)//
	['{1EE3BE45-4C43-42D7-9393-B81D8CBDFE98}']
		function uin:NSString{*};cdecl;///<想要对话的QQ号
		procedure setUin(uin:NSString{*});cdecl;///<想要对话的QQ号
		
		{-} function initWithUin(uin:NSString{*}):id;cdecl;
	end;
	
	QQApiWPAObjectClass=interface(QQApiObjectClass)//
	['{36C05D6D-4E2B-4498-9527-398F51D1FE92}']
		{+} function objectWithUin(uin:NSString{*}):id;cdecl;
	end;
	
	TQQApiWPAObject=class(TOCGenericImport<QQApiWPAObjectClass,QQApiWPAObject>)
	end;
	
	// QQApiAddFriendObject
	{* \brief 添加好友
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
	{* \brief 游戏公会绑定群
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
	{* \brief 加入群
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
	{* \brief 发起群会话对象
	 }
	QQApiGroupChatObject=interface(QQApiObject)//
	['{8FB8F35A-B22F-4DCE-A58F-DA3EE095EDDA}']
		function groupID:NSString{*};cdecl;///<想要对话的群号
		procedure setGroupID(groupID:NSString{*});cdecl;///<想要对话的群号
		
		{-} function initWithGroup(groupID:NSString{*}):id;cdecl;
	end;
	
	QQApiGroupChatObjectClass=interface(QQApiObjectClass)//
	['{9FAFE44B-484E-478F-9607-DE3F8AB77F6A}']
		{+} function objectWithGroup(groupID:NSString{*}):id;cdecl;
	end;
	
	TQQApiGroupChatObject=class(TOCGenericImport<QQApiGroupChatObjectClass,QQApiGroupChatObject>)
	end;
	
	//#pragma mark - QQApi请求消息类型
	
	{*
	 QQApi请求消息类型
	 }
	Enum_Request=(
	    EGETMESSAGEFROMQQREQTYPE = 0,   ///< 手Q -> 第三方应用，请求第三方应用向手Q发送消息
	    ESENDMESSAGETOQQREQTYPE = 1,    ///< 第三方应用 -> 手Q，第三方应用向手Q分享消息
	    ESHOWMESSAGEFROMQQREQTYPE = 2   ///< 手Q -> 第三方应用，请求第三方应用展现消息中的数据
	);
	
	{*
	 QQApi应答消息类型
	 }
	Enum_Response=(
	    ESHOWMESSAGEFROMQQRESPTYPE = 0, ///< 第三方应用 -> 手Q，第三方应用应答消息展现结果
	    EGETMESSAGEFROMQQRESPTYPE = 1,  ///< 第三方应用 -> 手Q，第三方应用回应发往手Q的消息
	    ESENDMESSAGETOQQRESPTYPE = 2    ///< 手Q -> 第三方应用，手Q应答处理分享消息的结果
	);
	
	{*
	 QQApi请求消息基类
	 }
	QQBaseReq=interface(NSObject)//
	['{79F08B35-08C3-4905-B251-C16DDBDF99A0}']
		
		{* 请求消息类型，参见\ref QQApiInterfaceReqType }
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
	 QQApi应答消息基类
	 }
	QQBaseResp=interface(NSObject)//
	['{7078A6AD-74A9-4254-9B2B-83A50865FA9D}']
		
		{* 请求处理结果 }
		function result:NSString{*};cdecl;
		procedure setResult(result:NSString{*});cdecl;
		
		{* 具体错误描述信息 }
		function errorDescription:NSString{*};cdecl;
		procedure setErrorDescription(errorDescription:NSString{*});cdecl;
		
		{* 应答消息类型，参见\ref QQApiInterfaceRespType }
		[MethodName('type:')]
		function _type:Integer;cdecl;
		procedure setType(_type:Integer);cdecl;
		
		{* 扩展信息 }
		function extendInfo:NSString{*};cdecl;
		procedure setExtendInfo(extendInfo:NSString{*});cdecl;
		
	end;
	
	QQBaseRespClass=interface(NSObjectClass)//
	['{34F67D86-7342-4555-A16D-9ECBFB019E21}']
	end;
	
	TQQBaseResp=class(TOCGenericImport<QQBaseRespClass,QQBaseResp>)
	end;
	
	{*
	 GetMessageFromQQReq请求帮助类
	 }
	GetMessageFromQQReq=interface(QQBaseReq)//
	['{4128B26A-57CC-446D-A9CF-BCF38C9997E6}']
		
		{*
		 创建一个GetMessageFromQQReq请求实例
		 }
		
	end;
	
	GetMessageFromQQReqClass=interface(QQBaseReqClass)//
	['{1BCDF4ED-6BD4-4DF1-8C8D-8C8065801CEF}']
		{+} function req:GetMessageFromQQReq{*};cdecl;
	end;
	
	TGetMessageFromQQReq=class(TOCGenericImport<GetMessageFromQQReqClass,GetMessageFromQQReq>)
	end;
	
	{*
	 GetMessageFromQQResp应答帮助类
	 }
	GetMessageFromQQResp=interface(QQBaseResp)//
	['{BEFFE7F6-31C0-4D4E-AD1B-D9938FE90ED1}']
		
		{*
		 创建一个GetMessageFromQQResp应答实例
		 \param message 具体分享消息实例
		 \return 新创建的GetMessageFromQQResp应答实例
		 }
		
		{* 具体分享消息 }
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
	 SendMessageToQQReq请求帮助类
	 }
	SendMessageToQQReq=interface(QQBaseReq)//
	['{4220553D-6489-4A15-949A-FDE8FD89CDE8}']
		
		{*
		 创建一个SendMessageToQQReq请求实例
		 \param message 具体分享消息实例
		 \return 新创建的SendMessageToQQReq请求实例
		 }
		
		{* 具体分享消息 }
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
	 SendMessageToQQResp应答帮助类
	 }
	SendMessageToQQResp=interface(QQBaseResp)//
	['{D55F07F2-4487-4F78-82FD-1AC5D1D6FDDA}']
		
		{*
		 创建一个SendMessageToQQResp应答实例
		 \param result 请求处理结果
		 \param errDesp 具体错误描述信息
		 \param extendInfo 扩展信息
		 \return 新创建的SendMessageToQQResp应答实例
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
	 ShowMessageFromQQReq请求帮助类
	 }
	ShowMessageFromQQReq=interface(QQBaseReq)//
	['{7D216E48-EE3E-4985-B348-410002D026DF}']
		
		{*
		 创建一个ShowMessageFromQQReq请求实例
		 \param message 具体待展现消息实例
		 \return 新创建的ShowMessageFromQQReq请求实例
		 }
		
		{* 具体待展现消息 }
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
	 ShowMessageFromQQResp应答帮助类
	 }
	ShowMessageFromQQResp=interface(QQBaseResp)//
	['{3FC03F32-4D37-4DB4-9A4A-5014947A65EC}']
		
		{*
		 创建一个ShowMessageFromQQResp应答实例
		 \param result 展现消息结果
		 \param errDesp 具体错误描述信息
		 \return 新创建的ShowMessageFromQQResp应答实例
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

