//
//  TencentMessageObject.h
//  TencentOpenApi_IOS
//
//  Created by qqconnect on 13-5-27.
//  Copyright (c) 2013年 Tencent. All rights reserved.
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
	 * 必填的NSArray型参数
	 }
	//*
  TCRequiredArray=NSArray;
	
	{*
	 * 必填的NSDictionary型参数
	 }
	//*
  TCRequiredDictionary=NSDictionary;
	
	{*
	 * 必填的TencentApiReq型参数
	 }
	//*
  TCRequiredReq=TencentApiReq;
	
	{*
	 * 可选的UIImage类型参数
	 }
	//*
  TCOptionalData=NSData;
	
	
	{*
	 * 可选的NSArray型参数
	 }
	//*
  TCOptionalArray=NSArray;
	
	{*
	 * 可选的TencentApiReq型参数
	 }
	//*
  TCOptionalReq=TencentApiReq;
	
	{* 
	 * TencentReqMessageType 请求类型枚举参数
	 }
	TencentReqMessageType=(
	//    /** TX APP请求内容填充（需要第三方开发者填充完成内容后需要主动调用sendRespMessageToTencentApp）*/
	//    ReqFromTencentAppQueryContent,
	//    /** TX APP请求展现内容 (不用调用答复) */
	    ReqFromTencentAppShowContent,
	//    /** 第三方 APP 请求内容 */
	//    ReqFromThirdAppQueryContent,
	//    /** 第三方 APP 请求展现内容（类似分享）*/
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
	 * TencentObjVersion 腾讯API消息类型枚举
	 }
//	//=(
//	//    /** 文本类型 */
//	//    TencentTextObj,
//	//    /** 图片类型 */
//	    TencentImageObj,
//	//    /** 音频类型 */
//	//    TencentAudioObj,
//	//    /** 视频类型 */
//	    TencentVideoObj//,
//	//    /** 图片视频类 */
//	//    TencentImageAndVideoObj,
//	//}
//	//TencentObjVersion;
//	);
	
	{*
	 * \brief 请求包
	 *
	 * TencentApiReq用来向其他业务发送请求包
	 }
	TencentApiReq=interface(NSObject)//<NSCoding>
	['{E6C46B52-873E-4FC9-B682-FD662B3EDF33}']
		
		{*
		 * 根据序列号生成一个请求包 
		 * \param apiSeq 请求序列号
		 * \param type   请求类型
		 * \return tencentApiReq实例
		 }
		
		{* 请求类型 }
		function nMessageType:TCRequiredInt;cdecl;
		procedure setNMessageType(nMessageType:TCRequiredInt);cdecl;
		
		{* 请求平台 }
		function nPlatform:NSInteger;cdecl;
		procedure setNPlatform(nPlatform:NSInteger);cdecl;
		
		{* 请求的SDK版本号 }
		function nSdkVersion:NSInteger;cdecl;
		procedure setNSdkVersion(nSdkVersion:NSInteger);cdecl;
		
		{* 请求序列号 }
		function nSeq:TCRequiredInt;cdecl;
		procedure setNSeq(nSeq:TCRequiredInt);cdecl;
		
		{* 第三方的APPID }
		function sAppID:TCRequiredStr;cdecl;
		procedure setSAppID(sAppID:TCRequiredStr);cdecl;
		
		{* 请求内容 TencentBaseMessageObj对象数组 }
		function arrMessage:TCOptionalArray;cdecl;
		procedure setArrMessage(arrMessage:TCOptionalArray);cdecl;
		
		{* 请求的描述 可以用于告诉对方这个请求的特定场景 }
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
	 * \brief 答复包
	 *
	 * TencentApiResp用来向其他业务发送答复包
	 }
	TencentApiResp=interface(NSObject)//<NSCoding>
	['{E4E4B179-A4AE-475A-BA1F-B6F12349641C}']
		
		{*
		 * 根据序列号生成一个答复包
		 * \param req 答复对应的请求包（如果req不是TencentApiReq或者他的子类，会抛出异常）
		 * \return 答复包体
		 }
		
		{* 返回码 }
		function nRetCode:TCOptionalInt;cdecl;
		procedure setNRetCode(nRetCode:TCOptionalInt);cdecl;
		
		{* 返回消息 }
		function sRetMsg:TCOptionalStr;cdecl;
		procedure setSRetMsg(sRetMsg:TCOptionalStr);cdecl;
		
		{* 答复对应的请求包 }
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
	 * \brief 消息体
	 *
	 * TencentBaseMessageObj 应用之间传递消息体
	 }
	TencentBaseMessageObj=interface(NSObject)//<NSCoding>
	['{92115DBD-9653-4912-9E28-671FDB341F7A}']
		
		{* 消息类型 }
		function nVersion:NSInteger;cdecl;
		procedure setNVersion(nVersion:NSInteger);cdecl;
		
		{* 消息描述 }
		function sName:NSString{*};cdecl;
		procedure setSName(sName:NSString{*});cdecl;
		
		{* 消息的扩展信息 主要是可以用来进行一些请求消息体的描述 譬如图片要求的width height 文字的关键字什么的, 也可以不用填写}
		function dictExpandInfo:PNSDictionary{*};cdecl;
		procedure setDictExpandInfo(dictExpandInfo:PNSDictionary{*});cdecl;
		
		{* 
		 * 消息是否有效 
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
	 * \brief 文本的消息体
	 *
	 * TencentTextMessageObjV1 应用之间传递的文本消息体
	 }
	TencentTextMessageObjV1=interface(TencentBaseMessageObj)//
	['{8BE2656E-3FE9-49E6-AF2C-9B293443AC9E}']
		
		{* 
		 * 文本
		 * \note 文本长度不能超过4096个字
		 }
		function sText:NSString{*};cdecl;
		procedure setSText(sText:NSString{*});cdecl;
		
		
		{*
		 * 初始化文本消息
		 * \param text 文本
		 * \return 初始化返回的文本消息
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
	 * TencentApiImageSourceType 图片数据类型（请求方对数据类型可能会有限制）
	 }
	TencentApiImageSourceType=(
	//    /** 图片数据是url或二进制数据 */
	    AllImage,
	//    /** 图片数据是url */
	    UrlImage,
	//    /** 图片数据是二进制数据 */
	    DataImage
	//}TencentApiImageSourceType;
	);
	
	{*
	 * \brief 图片的消息体
	 *
	 * TencentImageMessageObjV1 应用之间传递的图片消息体
	 }
	TencentImageMessageObjV1=interface(TencentBaseMessageObj)//
	['{8E1A9CBD-D1DC-4698-999B-44A0690216B9}']
		
		{* 
		 * 图片数据
		 * \note 图片不能大于10M
		 }
		function dataImage:NSData{*};cdecl;
		procedure setDataImage(dataImage:NSData{*});cdecl;
		
		{* 
		 * 缩略图的数据
		 * \note 图片不能大于1M 
		 }
		function dataThumbImage:NSData{*};cdecl;
		procedure setDataThumbImage(dataThumbImage:NSData{*});cdecl;
		
		{* 图片URL }
		function sUrl:NSString{*};cdecl;
		procedure setSUrl(sUrl:NSString{*});cdecl;
		
		{* 图片的描述 }
		function sDescription:NSString{*};cdecl;
		procedure setSDescription(sDescription:NSString{*});cdecl;
		
		{* 图片的size }
		function szImage:CGSize;cdecl;
		procedure setSzImage(szImage:CGSize);cdecl;
		
		{* 
		 * 图片来源
		 * \note TencentApiImageSourceType对应的类型
		 }
		function nType:NSInteger;cdecl;
		procedure setNType(nType:NSInteger);cdecl;
		
		{*
		 * 初始化图片消息
		 * \param dataImage 图片类型
		 * \return 初始化返回的图片消息
		 }
		{-} function initWithImageData(dataImage:NSData{*}):id;cdecl;
		
		{*
		 * 初始化图片消息
		 * \param url 图片url
		 * \return 初始化返回的图片消息
		 }
		{-} function initWithImageUrl(url:NSString{*}):id;cdecl;
		
		{*
		 * 初始化图片消息
		 * \param type 图片类型
		 * \return 初始化返回的图片消息
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
	 * \brief 音频的消息体
	 *
	 * TencentAudioMessageObjV1 应用之间传递的音频消息体
	 }
	TencentAudioMessageObjV1=interface(TencentBaseMessageObj)//
	['{F4E37A24-6D0E-429A-97B8-578BEDC76F99}']
		
		{* 音频URL }
		function sUrl:NSString{*};cdecl;
		procedure setSUrl(sUrl:NSString{*});cdecl;
		
		{* 
		 * 音频的预览图
		 * \note图片不能大于1M 
		 }
		function dataImagePreview:NSData{*};cdecl;
		procedure setDataImagePreview(dataImagePreview:NSData{*});cdecl;
		
		{* 音频的预览图URL }
		function sImagePreviewUrl:NSString{*};cdecl;
		procedure setSImagePreviewUrl(sImagePreviewUrl:NSString{*});cdecl;
		
		{* 音频的描述 }
		function sDescription:NSString{*};cdecl;
		procedure setSDescription(sDescription:NSString{*});cdecl;
		
		{*
		 * 初始化图片消息
		 * \param url 音频URL
		 * \return 初始化返回的音频消息
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
	 * TencentApiVideoSourceType 视频数据类型（请求方对数据类型可能会有限制）
	 }
	
	TencentApiVideoSourceType=(
	//    /** 视频来源于本地或网络 */
	    AllVideo,
	//    /** 视频来源于本地 */
	    LocalVideo,
	//    /** 视频来源于网络 */
	    NetVideo
	//};
	);
	
	{*
	 * \brief 视频的消息体
	 *
	 * TencentVideoMessageV1 应用之间传递的视频消息体
	 }
	TencentVideoMessageV1=interface(TencentBaseMessageObj)//
	['{B52CA45A-F8EE-4154-AE73-902694308B36}']
		
		{* 
		 * 视频URL 
		 * \note 不能超过1024
		 }
		function sUrl:NSString{*};cdecl;
		procedure setSUrl(sUrl:NSString{*});cdecl;
		
		{* 
		 * 视频来源 主要是用来让发起方指定视频的来源
		 * \note TencentApiVideoSourceType 对应的类型 只读参数
		 }
		function nType:NSInteger;cdecl;
		procedure setNType(nType:NSInteger);cdecl;
		
		{* 
		 * 视频的预览图 
		 * \note 图片不能大于1M 
		 }
		function dataImagePreview:NSData{*};cdecl;
		procedure setDataImagePreview(dataImagePreview:NSData{*});cdecl;
		
		{* 视频的预览图URL }
		function sImagePreviewUrl:NSString{*};cdecl;
		procedure setSImagePreviewUrl(sImagePreviewUrl:NSString{*});cdecl;
		
		{* 视频的描述 }
		function sDescription:NSString{*};cdecl;
		procedure setSDescription(sDescription:NSString{*});cdecl;
		
		{*
		 * 初始化视频消息
		 * \param url  视频URL
		 * \param type 视频来源类型
		 * \return 初始化返回的视频消息
		 }
		[MethodName('initWithVideoUrl:type:')]
		{-} function initWithVideoUrltype(url:NSString{*};_type:TencentApiVideoSourceType):id;cdecl;
		
		
		{*
		 * 初始化视频消息
		 * \param type 视频来源类型
		 * \return 初始化返回的视频消息
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
	 * \brief 视频图片消息体
	 *
	 * TencentVideoMessageV1 这是一个扩展的类 是一个图片视频类 
	 * \note 图片视频可以任选一个内容填充 但是注意只能填一个 当有一种类型被填充后 另外一个种类型就无法填充了
	 }
	TencentImageAndVideoMessageObjV1=interface(TencentBaseMessageObj)//
	['{CCDBACA2-6849-4BD9-B5D6-07A33E6A78BA}']
		
		{* 图片消息 }
		function objImageMessage:TencentImageMessageObjV1{*};cdecl;
		procedure setObjImageMessage(objImageMessage:TencentImageMessageObjV1{*});cdecl;
		
		{* 视频消息 }
		function objVideoMessage:TencentVideoMessageV1{*};cdecl;
		procedure setObjVideoMessage(objVideoMessage:TencentVideoMessageV1{*});cdecl;
		
		{*
		 * 初始化图片消息
		 * \param dataImage 图片数据
		 * \param url       视频url
		 * \return 初始化返回的图片视频消息
		 }
		[MethodName('initWithMessage:videoUrl:')]
		{-} function initWithMessagevideoUrl(dataImage:NSData{*};url:NSString{*}):id;cdecl;
		
		{* 
		 * 设置图片
		 * \param dataImage 图片数据
		 }
		{-} procedure setDataImage(dataImage:NSData{*});cdecl;
		
		{*
		 * 设置视频
		 * \param videoUrl 视频URL
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

