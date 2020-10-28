///
/// \file TencentOAuthObject.h
/// �Կ��Žӿڵĵ����ṩ�����ֵ��װ�ĸ�����
///
/// Created by Tencent on 12-12-28.
/// Copyright (c) 2012�� Tencent. All rights reserved.
///

unit TencentOAuthObject_iOSApi;

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

	
	
	//#pragma mark -
	//#pragma mark TCAddTopicDic
	
	{* 
	 * \brief ����˵˵�Ĳ����ֵ䶨��
	 *
	 * ����ֱ����д��Ӧ�����󽫶�������������API��
	 }
	TCAddTopicDic=interface(TCAPIRequest)//
	['{58172D4B-73AC-4BC7-A32F-64B5BB107235}']
		
		{* 
		 * ����һ��������������API���������
		 * \note �����ͷţ����صĶ������Զ��ͷŵ�
		 }
		
		{* 
		 * ��������ʱ���õ���Ϣ�����͡�
		 * \note 1��ʾͼƬ�� 2��ʾ��ҳ�� 3��ʾ��Ƶ
		 }
		function paramRichtype:TCOptionalStr;cdecl;
		procedure setParamRichtype(paramRichtype:TCOptionalStr);cdecl;
		
		{*
		 * ��������ʱ���õ���Ϣ��ֵ����richtypeʱ������richval
		 *
		 * \note
		 *       -# ��richtypeΪͼƬ����richtypeΪ1��Ӧ�ó���Ϊ��������ʱ����ĳ��ͼƬ��ʱ��\n
		 *          richval��Ҫ�����ͼƬ����ز��������õ�ͼƬ��Դ��Ϊ���֣�һ��Ϊ��վͼƬ��\n
		 *          һ��ΪQQ�ռ�����е�ĳ��ͼƬ��
		 *             - �����õ�ͼƬ������վ��richval�������в�����ֵ��\n
		 *               | �������� | �Ƿ���� | ����    | ����              |
		 *               | ------ | ------- | ------ | ----------------- |
		 *               | url    | ����     | string | ��վͼƬ��URL      |
		 *               | height | ����     | string | ͼƬ�߶ȣ���λ�� px |
		 *               | width  | ����     | string | ͼƬ��ȣ���λ�� px |
		 *               \n
		 *               ����ʱÿ��ֵ�м��á�&���ָ���������ʾ��\n
		 *               ��url=http://qq.com/logo.png&width=25&height=21��
		 *
		 *             - �����õ�ͼƬ����QQ�ռ���ᣬrichval�������в�����ֵ��\n
		 *               ��Щֵ����Ҫͨ���������OpenAPI����á������������£�\n
		 *               | ��������   | �Ƿ���� | ����    | ����                               |
		 *               | --------- | ------ | ------ | ---------------------------------- |
		 *               | albumid   | ����    | string | ͼƬ�����ռ�����ID                  |
		 *               | pictureid | ����    | string | ͼƬID                              |
		 *               | sloc      | ����    | string | СͼID                              |
		 *               | pictype   |        | string | ͼƬ���ͣ�JPG = 1��GIF = 2��PNG = 3�� |
		 *               | picheight |        | string | ͼƬ�߶ȣ���λ�� px                   |
		 *               | picwidth  |        | string | ͼƬ��ȣ���λ�� px                   |
		 *               ����ʱÿ��ֵ�м��ö��ŷָ���������ʾ ��\n
		 *               ��albumid,pictureid,sloc,pictype,picheight,picwidth��
		 *       -# ��richtypeΪ��ҳ����richtypeΪ2��Ӧ�ó���Ϊ���ĳ��ҳ�������ۣ�ʱ��\n
		 *          richval��Ҫ�������ҳ��URL������Ϊfeedsʱ����̨���Զ�����URLת��Ϊ��URL��
		 *       -# ��richtypeΪ��Ƶ����richtypeΪ3��Ӧ�ó���Ϊ���ĳ��Ƶ�������ۣ�ʱ��\n
		 *          richval��Ҫ�������Ƶ��URL������Ϊfeedsʱ����̨��Ը�URL���н�����\n
		 *          ��feeds����ʾ����������ƵԴ������ͼ��
		 }
		function paramRichval:TCOptionalStr;cdecl;
		procedure setParamRichval(paramRichval:TCOptionalStr);cdecl;
		
		{* 
		 * ��������������ݡ�
		 }
		function paramCon:TCRequiredStr;cdecl;
		procedure setParamCon(paramCon:TCRequiredStr);cdecl;
		
		{* 
		 * ��ַ�ġ����磺�㶫ʡ��������ɽ�����¿Ƽ�԰��Ѷ���á�lbs_nm��lbs_x��lbs_yͨ��һ��ʹ�ã�����ȷ��ʶһ����ַ��
		 }
		function paramLbs_nm:TCOptionalStr;cdecl;
		procedure setParamLbs_nm(paramLbs_nm:TCOptionalStr);cdecl;
		
		{* 
		 * ���ȡ�-180.0��+180.0��+��ʾ������lbs_nm��lbs_x��lbs_yͨ��һ��ʹ�ã�����ȷ��ʶһ����ַ��
		 }
		function paramLbs_x:TCOptionalStr;cdecl;
		procedure setParamLbs_x(paramLbs_x:TCOptionalStr);cdecl;
		
		{* 
		 * γ�ȡ�-90.0��+90.0��+��ʾ��γ��lbs_nm��lbs_x��lbs_yͨ��һ��ʹ�ã�����ȷ��ʶһ����ַ��
		 }
		function paramLbs_y:TCOptionalStr;cdecl;
		procedure setParamLbs_y(paramLbs_y:TCOptionalStr);cdecl;
		
		{* 
		 * ������Ӧ�õ�ƽ̨���͡�
		 * \note 1��ʾQQ�ռ䣻 2��ʾ��Ѷ���ѣ� 3��ʾ��Ѷ΢��ƽ̨�� 4��ʾ��ѶQ+ƽ̨��
		 }
		function paramThirdSource:TCOptionalStr;cdecl;
		procedure setParamThirdSource(paramThirdSource:TCOptionalStr);cdecl;
	end;
	
	TCAddTopicDicClass=interface(TCAPIRequestClass)//
	['{A7F85A3D-D065-44D3-953B-AA8B0C2E3073}']
		{+} function dictionary:TCAddTopicDic{*};cdecl;
	end;
	
	TTCAddTopicDic=class(TOCGenericImport<TCAddTopicDicClass,TCAddTopicDic>)
	end;
	
	
	//#pragma mark -
	//#pragma mark TCAddOneBlogDic
	{*
	 * \brief ������־�Ĳ����ֵ䶨��
	 *
	 * ����ֱ����д��Ӧ�����󽫶�������������API��
	 }
	TCAddOneBlogDic=interface(TCAPIRequest)//
	['{2FEC4511-0DB4-40B9-814B-7705203324A3}']
		
		{*
		 * ����һ��������������API���������
		 * \note �����ͷţ����صĶ������Զ��ͷŵ�
		 }
		
		{* 
		 * ��־���⣨���ı�����󳤶�128���ֽڣ�utf-8���룩��
		 }
		function paramTitle:TCRequiredStr;cdecl;
		procedure setParamTitle(paramTitle:TCRequiredStr);cdecl;
		
		{* 
		 * content �������ݣ�html���ݣ���󳤶�100*1024���ֽڣ�utf-8���룩
		 }
		function paramContent:TCRequiredStr;cdecl;
		procedure setParamContent(paramContent:TCRequiredStr);cdecl;
	end;
	
	TCAddOneBlogDicClass=interface(TCAPIRequestClass)//
	['{C4E1FEE0-5FF3-47CA-98FE-8A8D9A837E25}']
		{+} function dictionary:TCAddOneBlogDic{*};cdecl;
	end;
	
	TTCAddOneBlogDic=class(TOCGenericImport<TCAddOneBlogDicClass,TCAddOneBlogDic>)
	end;
	
	//#pragma mark -
	//#pragma mark TCAddAlbumDic
	{* 
	 * \brief �����ռ����Ĳ����ֵ䶨��
	 *
	 * ����ֱ����д��Ӧ�����󽫶�������������API��
	 }
	TCAddAlbumDic=interface(TCAPIRequest)//
	['{487C1CDF-001B-44EF-A6DE-4083FE75795F}']
		
		{*
		 * ����һ��������������API���������
		 *
		 * \note �����ͷţ����صĶ������Զ��ͷŵ�
		 }
		
		{* 
		 * albumname ���� string ����� ���ܳ���30���ַ���
		 }
		function paramAlbumname:TCRequiredStr;cdecl;
		procedure setParamAlbumname(paramAlbumname:TCRequiredStr);cdecl;
		
		
		{*
		 * albumdesc string ������������ܳ���200���ַ���
		 }
		function paramAlbumdesc:TCOptionalStr;cdecl;
		procedure setParamAlbumdesc(paramAlbumdesc:TCOptionalStr);cdecl;
		
		{* 
		 * priv string	���Ȩ��
		 *
		 * \note ��ȡֵ����Ϊ�� 1=������3=ֻ���˿ɼ��� 4=QQ���ѿɼ��� 5=�ʴ���ܡ�\n
		 *       ���������Ĭ��Ϊ����Ȩ�ޡ�\n
		 *       ���privȡֵΪ5����������ʴ���ܵģ�������������ʹ�����������\n
		 *       - question: ���⣬���ܳ���30���ַ���
		 *       - answer: �𰸣����ܳ���30���ַ���
		 }
		function paramPriv:TCOptionalStr;cdecl;
		procedure setParamPriv(paramPriv:TCOptionalStr);cdecl;
		
		{*
		 * question ���⣬���ܳ���30���ַ���
		 * \note ���privȡֵΪ5������������������
		 *}
		function paramQuestion:TCOptionalStr;cdecl;
		procedure setParamQuestion(paramQuestion:TCOptionalStr);cdecl;
		
		{*
		 * answer �𰸣����ܳ���30���ַ���
		 * \note ���privȡֵΪ5������������������
		 *}
		function paramAnswer:TCOptionalStr;cdecl;
		procedure setParamAnswer(paramAnswer:TCOptionalStr);cdecl;
		
	end;
	
	TCAddAlbumDicClass=interface(TCAPIRequestClass)//
	['{8E69A535-1429-4BF0-B289-0EAB7A75137C}']
		{+} function dictionary:TCAddAlbumDic{*};cdecl;
	end;
	
	TTCAddAlbumDic=class(TOCGenericImport<TCAddAlbumDicClass,TCAddAlbumDic>)
	end;
	
	//#pragma mark -
	//#pragma mark TCUploadPicDic
	{*
	 * \brief �ϴ�һ����Ƭ��QQ�ռ����Ĳ����ֵ䶨��
	 *
	 * ����ֱ����д��Ӧ�����󽫶�������������API��
	 }
	TCUploadPicDic=interface(TCAPIRequest)//
	['{73D7BC66-4EFE-40C6-8E67-DA2C22CAB75C}']
		
		{*
		 * ����һ��������������API���������
		 * \note �����ͷţ����صĶ������Զ��ͷŵ�
		 }
		
		{* 
		 * photodesc string ��Ƭ������ע����Ƭ�������ܳ���200���ַ���
		 }
		function paramPhotodesc:TCOptionalStr;cdecl;
		procedure setParamPhotodesc(paramPhotodesc:TCOptionalStr);cdecl;
		{*	
		 * string ��Ƭ��������������.jpg, .gif, .png, .jpeg, .bmp�����׺��β��
		 }
		function paramTitle:TCOptionalStr;cdecl;
		procedure setParamTitle(paramTitle:TCOptionalStr);cdecl;
		
		{*	
		 * string ���id���ɲ������ʱ����ݡ�mobile����ʶѡ��Ĭ���ϴ�����ᡣ
		 }
		function paramAlbumid:TCOptionalStr;cdecl;
		procedure setParamAlbumid(paramAlbumid:TCOptionalStr);cdecl;
		
		{* 
		 * ��־λ
		 *
		 * \note 0��ʾPC��1��ʾ�ֻ������ڵ��������idʱ����albumidΪ��ʱ�������Ƿ񴫵��ֻ���ᡣ\n
		 *       -# �����1����albumidΪ��ʱ��ͼƬ���ϴ����ֻ���᣻
		 *       -# ���������0����albumidΪ��ʱ��ͼƬ���ϴ�����ͼ��᣻
		 }
		function paramMobile:TCOptionalStr;cdecl;
		procedure setParamMobile(paramMobile:TCOptionalStr);cdecl;
		
		{* 
		 * x string ��Ƭ����ʱ�ĵ���λ�õľ��ȡ���ʹ��ԭʼ���ݣ�����γ�ȣ�0-360����
		 }
		function paramX:TCOptionalStr;cdecl;
		procedure setParamX(paramX:TCOptionalStr);cdecl;
		
		{* 
		 * y string ��Ƭ����ʱ�ĵ���λ�õ�γ�ȡ���ʹ��ԭʼ���ݣ�����γ�ȣ�0-360����
		 }
		function paramY:TCOptionalStr;cdecl;
		procedure setParamY(paramY:TCOptionalStr);cdecl;
		
		{*
		 * picture ���� string �ϴ���Ƭ���ļ����Լ�ͼƬ�����ݣ��ڷ�������ʱ��ͼƬ�����Զ���������������ʽ���ͣ������������ʾ������ע����Ƭ���Ʋ��ܳ���30���ַ���
		 }
		function paramPicture:TCRequiredImage;cdecl;
		procedure setParamPicture(paramPicture:TCRequiredImage);cdecl;
		
		{* 
		 * needfeed int	 ��ʶ�ϴ���Ƭʱ�Ƿ�Ҫ��feed
		 * \note��0������feed�� 1����feed�������������Ĭ��Ϊ��feed��
		 }
		function paramNeedfeed:TCOptionalStr;cdecl;
		procedure setParamNeedfeed(paramNeedfeed:TCOptionalStr);cdecl;
		
		{* 
		 * successnum int �����ϴ���Ƭʱ���ѳɹ��ϴ���������ָ���ϴ���������
		 * \note �����ϴ�ʱ���Բ��������Ĭ��Ϊ0��
		 }
		function paramSuccessnum:TCOptionalStr;cdecl;
		procedure setParamSuccessnum(paramSuccessnum:TCOptionalStr);cdecl;
		
		{* 
		 * picnum int �����ϴ���Ƭ�������������������Ĭ��Ϊ1��
		 * \note
		 *       - ���picnum=1��Ϊ�����ϴ������͵����ϴ�feed��
		 *       - ���picnum>1��Ϊ�����ϴ������������ϴ�feed��
		 *       �����ϴ���ʽ��picnumΪһ���ϴ���Ƭ��������successnum��ʼֵΪ0��ÿ����һ����Ƭ�ϴ��ӿں������ֵ��
		 *       ��Ϣ�����е�feed������ʽ�������ϴ�ʱ���µ�7����feed��չʾ�����������ϴ���һ��ͼƬչʾΪ��ͼ��ʣ�µ�
		 *       ���Ű����µ��ɵ�˳��չʾΪСͼ������ͼƬ����feed��չʾ��
		 }
		function paramPicnum:TCOptionalStr;cdecl;
		procedure setParamPicnum(paramPicnum:TCOptionalStr);cdecl;
		
	end;
	
	TCUploadPicDicClass=interface(TCAPIRequestClass)//
	['{5BCD13A9-AB38-43B3-A9A5-296769C4F121}']
		{+} function dictionary:TCUploadPicDic{*};cdecl;
	end;
	
	TTCUploadPicDic=class(TOCGenericImport<TCUploadPicDicClass,TCUploadPicDic>)
	end;
	
	//#pragma mark -
	//#pragma mark TCAddShareDic
	{*
	 * \brief ͬ������QQ�ռ�,��Ѷ΢���Ĳ����ֵ䶨��
	 *
	 * ����ֱ����д��Ӧ�����󽫶�������������API��
	 }
	TCAddShareDic=interface(TCAPIRequest)//
	['{E4C79AFD-D420-4B25-B435-4506690D49C6}']
		
		{*
		 * ����һ��������������API���������
		 *
		 * \note �����ͷţ����صĶ������Զ��ͷŵ�
		 }
		
		{* 
		 * title ���� string	 feeds�ı��� �36�������֣��������ֻᱻ�ضϡ�
		 }
		function paramTitle:TCRequiredStr;cdecl;
		procedure setParamTitle(paramTitle:TCRequiredStr);cdecl;
		
		
		{*
		 * url ���� string ����������ҳ��Դ�����ӣ��������ת����������ҳ����Ӧ���Ľӿ�˵����2�ĳ����ӡ�����http://��ͷ��
		 }
		function paramUrl:TCRequiredStr;cdecl;
		procedure setParamUrl(paramUrl:TCRequiredStr);cdecl;
		
		
		{*
		 * comment string �û��������ݣ�Ҳ�з������ʱ�ķ������� ��ֹʹ��ϵͳ�����������д��档
		 * �40�������֣��������ֻᱻ�ضϡ�
		 }
		function paramComment:TCOptionalStr;cdecl;
		procedure setParamComment(paramComment:TCOptionalStr);cdecl;
		
		
		{* 
		 * summary string ���������ҳ��Դ��ժҪ���ݣ���������ҳ�ĸ�Ҫ���� �80�������֣��������ֻᱻ�ضϡ�
		 }
		function paramSummary:TCOptionalStr;cdecl;
		procedure setParamSummary(paramSummary:TCOptionalStr);cdecl;
		
		{* 
		 * images string ���������ҳ��Դ�Ĵ�����ͼƬ����"������http://��ͷ����������255�ַ�������ͼƬ�����ߣ�|���ָ���Ŀǰֻ�е�һ��ͼƬ��Ч��ͼƬ���100*100Ϊ�ѡ�
		 }
		function paramImages:TCOptionalStr;cdecl;
		procedure setParamImages(paramImages:TCOptionalStr);cdecl;
		
		{* 
		 * type string �������ݵ����͡�
		 *
		 * \note 4��ʾ��ҳ��5��ʾ��Ƶ��type=5ʱ�����봫��playurl��
		 }
		function paramType:TCOptionalStr;cdecl;
		procedure setParamType(paramType:TCOptionalStr);cdecl;
		
		{* 
		 * playurl string ��������Ϊ256�ֽڡ�����type=5��ʱ����Ч����ʾ��Ƶ��swf���ŵ�ַ��
		 }
		function paramPlayurl:TCOptionalStr;cdecl;
		procedure setParamPlayurl(paramPlayurl:TCOptionalStr);cdecl;
		
		{* 
		 * site ���� string �������Դ��վ���ƣ�����д��վ�������ʱע�����վ����
		 }
		function paramSite:TCRequiredStr;cdecl;
		procedure setParamSite(paramSite:TCRequiredStr);cdecl;
		
		{* 
		 * fromurl ���� string �������Դ��վ��Ӧ����վ��ַurl ����http://��ͷ��
		 }
		function paramFromurl:TCRequiredStr;cdecl;
		procedure setParamFromurl(paramFromurl:TCRequiredStr);cdecl;
		
		{*
		 * nswb string	ֵΪ1ʱ����ʾ����Ĭ��ͬ����΢��������ֵ���߲����˲�����ʾĬ��ͬ����΢����
		 }
		function paramNswb:TCOptionalStr;cdecl;
		procedure setParamNswb(paramNswb:TCOptionalStr);cdecl;
		
	end;
	
	TCAddShareDicClass=interface(TCAPIRequestClass)//
	['{C93D1B5C-3E7E-4E46-9B89-473E0F331E7D}']
		{+} function dictionary:TCAddShareDic{*};cdecl;
	end;
	
	TTCAddShareDic=class(TOCGenericImport<TCAddShareDicClass,TCAddShareDic>)
	end;
	
	//#pragma mark -
	//#pragma mark TCCheckPageFansDic
	{*
	 * \brief ��֤�Ƿ���֤�ռ��˿tttyttyyyu�Ĳ����ֵ䶨��
	 *
	 * ����ֱ����д��Ӧ�����󽫶�������������API��
	 }
	TCCheckPageFansDic=interface(TCAPIRequest)//
	['{924F07BD-D315-43D6-8695-85EDC4C9CDAE}']
		
		{*
		 * ����һ��������������API���������
		 *
		 * \note �����ͷţ����صĶ������Զ��ͷŵ�
		 }
		
		{* 
		 * ��ʾ��֤�ռ��QQ����
		 }
		function paramPage_id:TCRequiredStr;cdecl;
		procedure setParamPage_id(paramPage_id:TCRequiredStr);cdecl;
	end;
	
	TCCheckPageFansDicClass=interface(TCAPIRequestClass)//
	['{97AA7FC4-EAE2-4EF0-B68A-57AEF3602D05}']
		{+} function dictionary:TCCheckPageFansDic{*};cdecl;
	end;
	
	TTCCheckPageFansDic=class(TOCGenericImport<TCCheckPageFansDicClass,TCCheckPageFansDic>)
	end;
	
	//#pragma mark -
	//#pragma mark TCSetUserHeadpic
	{*
	 * \brief �����û�ͷ��
	 *
	 * ����ֱ����д��Ӧ�����󽫶�������������API��
	 }
	TCSetUserHeadpic=interface(TCAPIRequest)//
	['{A40E997F-DD51-4E43-9663-2ACD02F189F6}']
		
		{*
		 * ����һ��������������API���������
		 * \note �����ͷţ����صĶ������Զ��ͷŵ�
		 }
		
		{* 
		 * �����û�ͷ���ͼƬ
		 }
		function paramImage:TCRequiredImage;cdecl;
		procedure setParamImage(paramImage:TCRequiredImage);cdecl;
		
		{* 
		 * ͼƬ���ļ���
		 }
		function paramFileName:TCOptionalStr;cdecl;
		procedure setParamFileName(paramFileName:TCOptionalStr);cdecl;
	end;
	
	TCSetUserHeadpicClass=interface(TCAPIRequestClass)//
	['{6CA95E8A-1D1F-45CB-9482-057F743B8122}']
		{+} function dictionary:TCSetUserHeadpic{*};cdecl;
	end;
	
	TTCSetUserHeadpic=class(TOCGenericImport<TCSetUserHeadpicClass,TCSetUserHeadpic>)
	end;
	
	//#pragma mark -
	//#pragma mark TCListPhotoDic
	
	{*
	 * \brief ��ȡ�û�QQ�ռ�����е���Ƭ�б�
	 *
	 * ����ֱ����д��Ӧ�����󽫶�������������API��
	 }
	TCListPhotoDic=interface(TCAPIRequest)//
	['{A07688B4-C592-4B73-A168-29C52A51F55C}']
		
		{*
		 * ����һ��������������API���������
		 *
		 * \note �����ͷţ����صĶ������Զ��ͷŵ�
		 }
		
		{*
		 * ��ʾҪ��ȡ����Ƭ�б����ڵ����ID
		 }
		function paramAlbumid:TCRequiredStr;cdecl;
		procedure setParamAlbumid(paramAlbumid:TCRequiredStr);cdecl;
		
	end;
	
	TCListPhotoDicClass=interface(TCAPIRequestClass)//
	['{D9363845-389E-41D0-BE08-DFCB9F3D9FB3}']
		{+} function dictionary:TCListPhotoDic{*};cdecl;
	end;
	
	TTCListPhotoDic=class(TOCGenericImport<TCListPhotoDicClass,TCListPhotoDic>)
	end;
	
	//#pragma mark -
	//#pragma mark TCSendStoryDic
	{*
	 * \brief QQ�ռ䶨�����Ĳ����ֵ䶨��
	 *
	 * �÷���֧��@��ָ�����ѣ����֧��10�����ѡ�
	 * ���е�����Ӧ�ÿ�Ԥ�����5��ָ�����ѵ�openid������������û�����ѡ��
	 * �÷�����ʽ���ṩ��QZone����ͱ���Html5����������ʽ��
	 * sendStroy��֧��userData����
	 }
	TCSendStoryDic=interface(TCAPIRequest)//
	['{20E12F6A-8AD6-48EB-8518-2362ADFFA9C1}']
		
		{*
		 * ����һ��������������API���������
		 *
		 * \note �����ͷţ����صĶ������Զ��ͷŵ�
		 }
		
		{*
		 * ����ı���
		 }
		function paramTitle:TCRequiredStr;cdecl;
		procedure setParamTitle(paramTitle:TCRequiredStr);cdecl;
		
		{*
		 * ����ժҪ����಻����50�����֣�����Ϊ��
		 }
		function paramSummary:TCOptionalStr;cdecl;
		procedure setParamSummary(paramSummary:TCOptionalStr);cdecl;
		
		{*
		 * Ĭ��չʾ���������ķ������ɣ����120�����֣�����Ϊ��
		 }
		function paramDescription:TCOptionalStr;cdecl;
		procedure setParamDescription(paramDescription:TCOptionalStr);cdecl;
		
		{*
		 * ͼƬurl
		 }
		function paramPics:TCOptionalStr;cdecl;
		procedure setParamPics(paramPics:TCOptionalStr);cdecl;
		
		{*
		 * ��������Ĭ��Ϊ"����Ӧ��"
		 }
		function paramAct:TCRequiredStr;cdecl;
		procedure setParamAct(paramAct:TCRequiredStr);cdecl;
		
		{*
		 * ��������Url
		 }
		function paramShareUrl:TCOptionalStr;cdecl;
		procedure setParamShareUrl(paramShareUrl:TCOptionalStr);cdecl;
		
	end;
	
	TCSendStoryDicClass=interface(TCAPIRequestClass)//
	['{7354E911-1454-484D-B8B4-FE12053A20E3}']
		{+} function dictionary:TCSendStoryDic{*};cdecl;
	end;
	
	TTCSendStoryDic=class(TOCGenericImport<TCSendStoryDicClass,TCSendStoryDic>)
	end;
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function TCAddTopicDic_FakeLoader : TCAddTopicDic; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TCAddTopicDic';
function TCAddOneBlogDic_FakeLoader : TCAddOneBlogDic; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TCAddOneBlogDic';
function TCAddAlbumDic_FakeLoader : TCAddAlbumDic; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TCAddAlbumDic';
function TCUploadPicDic_FakeLoader : TCUploadPicDic; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TCUploadPicDic';
function TCAddShareDic_FakeLoader : TCAddShareDic; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TCAddShareDic';
function TCCheckPageFansDic_FakeLoader : TCCheckPageFansDic; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TCCheckPageFansDic';
function TCSetUserHeadpic_FakeLoader : TCSetUserHeadpic; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TCSetUserHeadpic';
function TCListPhotoDic_FakeLoader : TCListPhotoDic; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TCListPhotoDic';
function TCSendStoryDic_FakeLoader : TCSendStoryDic; cdecl; external {$I TencentDylibName.inc} name 'OBJC_CLASS_$_TCSendStoryDic';
{$O+}


{$ENDIF}

end.

