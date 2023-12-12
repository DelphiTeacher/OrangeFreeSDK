//{!
// *  \~chinese
// *  @header     PTLabel.h
// *  @abstract   ���ģ��
// *
// *  \~english
// *  @header     PTLabel.h
// *  @abstract   Express template
// }

unit iOSApi.PTLabel;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
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

	
	
	//{!
	// *  \~chinese
	// *  @brief   ʹ�õ����浥ģ�壬ֻ��Ҫ�����Ӧ�ı����ݣ����ɷ��ʹ�ӡ��һ���浥��ע�⣺ 1.��ʹ��ģ���ӡʱ����������������ṩ��ģ��ʹ�÷��������������б��2. ����п����������������ֵΪ�գ�����@""���ַ�����3.��ͬ��ģ�壬��Ҫ�����������ǲ�ͬ�ģ����������ǵķ���Ϊ׼��
	// *
	// *  \~english
	// *  @brief   By using electronic waybill template, only filling in it accordingly can send and print it out��Note�� 1. When using template to print, you should fill in all the blanks as the template sample showed.2.If there is null data, e.g. claiming value is null, please input null character string @"".3.The data to fill in differs depending on the template, please subject to the sample showed.
	// }
	
	//@interface PTLabel : NSObject
	//@interface PTLabel : NSObject
	PTLabel=interface(NSObject)//
	['{AFC91D49-87DC-428C-BFF0-AD803305D7D3}']
		
		//{!
		// *  \~chinese
		// *  ��ݹ�˾
		// *
		// *  \~english
		// *  Express company
		// }
		//@property(strong,nonatomic,readwrite) NSString *express_company;
		function express_company:NSString;cdecl;
		procedure setExpress_company(express_company:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  �˵���
		// *
		// *  \~english
		// *  Delivery number
		// }
		//@property(strong,nonatomic,readwrite) NSString *delivery_number;
		function delivery_number:NSString;cdecl;
		procedure setDelivery_number(delivery_number:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ������
		// *
		// *  \~english
		// *  Order number
		// }
		//@property(strong,nonatomic,readwrite) NSString *order_number;
		function order_number:NSString;cdecl;
		procedure setOrder_number(order_number:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ��ɢ��
		// *
		// *  \~english
		// *  Distributing
		// }
		//@property(strong,nonatomic,readwrite) NSString *distributing;
		function distributing:NSString;cdecl;
		procedure setDistributing(distributing:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ������
		// *
		// *  \~english
		// *  Barcode
		// }
		//@property(strong,nonatomic,readwrite) NSString *barcode;
		function barcode:NSString;cdecl;
		procedure setBarcode(barcode:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  �������·����ַ�
		// *
		// *  \~english
		// *  The character below the bar code
		// }
		//@property(strong,nonatomic,readwrite) NSString *barcode_text;
		function barcode_text:NSString;cdecl;
		procedure setBarcode_text(barcode_text:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ��ά��
		// *
		// *  \~english
		// *  QRcode
		// }
		//@property(strong,nonatomic,readwrite) NSString *qrcode;
		function qrcode:NSString;cdecl;
		procedure setQrcode(qrcode:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ��ά���·����ַ�
		// *
		// *  \~english
		// *  The character below the QR code
		// }
		//@property(strong,nonatomic,readwrite) NSString *qrcode_text;
		function qrcode_text:NSString;cdecl;
		procedure setQrcode_text(qrcode_text:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  �ռ��� ����
		// *
		// *  \~english
		// *  Recipient name
		// }
		//@property(strong,nonatomic,readwrite) NSString *receiver_name;
		function receiver_name:NSString;cdecl;
		procedure setReceiver_name(receiver_name:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  �ռ��� �绰
		// *
		// *  \~english
		// *  Recipient phone
		// }
		//@property(strong,nonatomic,readwrite) NSString *receiver_phone;
		function receiver_phone:NSString;cdecl;
		procedure setReceiver_phone(receiver_phone:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  �ռ��� ��ַ
		// *
		// *  \~english
		// *  Recipient address
		// }
		//@property(strong,nonatomic,readwrite) NSString *receiver_address;
		function receiver_address:NSString;cdecl;
		procedure setReceiver_address(receiver_address:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  �ռ��� ��Ϣ
		// *
		// *  \~english
		// *  Recipient Information
		// }
		//@property(strong,nonatomic,readwrite) NSString *receiver_message;
		function receiver_message:NSString;cdecl;
		procedure setReceiver_message(receiver_message:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ������ ����
		// *
		// *  \~english
		// *  Sender name
		// }
		//@property(strong,nonatomic,readwrite) NSString *sender_name;
		function sender_name:NSString;cdecl;
		procedure setSender_name(sender_name:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ������ �绰
		// *
		// *  \~english
		// *  Sender phone
		// }
		//@property(strong,nonatomic,readwrite) NSString *sender_phone;
		function sender_phone:NSString;cdecl;
		procedure setSender_phone(sender_phone:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ������ ��ַ
		// *
		// *  \~english
		// *  Sender address
		// }
		//@property(strong,nonatomic,readwrite) NSString *sender_address;
		function sender_address:NSString;cdecl;
		procedure setSender_address(sender_address:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ������ ��Ϣ
		// *
		// *  \~english
		// *  Sender information
		// }
		//@property(strong,nonatomic,readwrite) NSString *sender_message;
		function sender_message:NSString;cdecl;
		procedure setSender_message(sender_message:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ��Ʒ��
		// *
		// *  \~english
		// *  Item name
		// }
		//@property(strong,nonatomic,readwrite) NSString *article_name;
		function article_name:NSString;cdecl;
		procedure setArticle_name(article_name:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ��Ʒ����
		// *
		// *  \~english
		// *  Item weight
		// }
		//@property(strong,nonatomic,readwrite) NSString *article_weight;
		function article_weight:NSString;cdecl;
		procedure setArticle_weight(article_weight:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  ������ֵ
		// *
		// *  \~english
		// *  Affirmation value
		// }
		//@property(strong,nonatomic,readwrite) NSString *amount_declare;
		function amount_declare:NSString;cdecl;
		procedure setAmount_declare(amount_declare:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  �������
		// *
		// *  \~english
		// *  Payment amount
		// }
		//@property(strong,nonatomic,readwrite) NSString *amount_paid;
		function amount_paid:NSString;cdecl;
		procedure setAmount_paid(amount_paid:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  Ԥ�����
		// *
		// *  \~english
		// *  Prepayment amount
		// }
		//@property(strong,nonatomic,readwrite) NSString *amount_paid_advance;
		function amount_paid_advance:NSString;cdecl;
		procedure setAmount_paid_advance(amount_paid_advance:NSString);cdecl;
		
		///// ��ģ�����������·�����ӡ��������
		///// @param filePath ģ��·��
		//- (NSData *)dataWithSourceFile:(NSString *)filePath;
		function dataWithSourceFile(filePath:NSString):NSData;cdecl;
		
		
		///// ����TSPLָ�������
		//- (NSData *)dataWithTSPL;
		function dataWithTSPL:NSData;cdecl;
		
		
		///// ��ģ�����������·�����ӡ��������
		///// @param source ��Դ
		///// @param labelDict ģ�嶨���key
		///// @param orderDetails ��������
		//- (NSData *)getTemplateData:(NSString *)source labelDict:(NSDictionary *)labelDict orderDetails:(NSArray *)orderDetails;
		[MethodName('getTemplateData:labelDict:orderDetails:')]
		function getTemplateDatalabelDictorderDetails(source:NSString;labelDict:PNSDictionary;orderDetails:NSArray):NSData;cdecl;
		
		
		///// ��ģ�����������·�����ӡ��������
		///// @param source ��Դ
		///// @param labelDict ģ�嶨���key
		//- (NSData *)getTemplateData:(NSString *)source labelDict:(NSDictionary *)labelDict;
		[MethodName('getTemplateData:labelDict:')]
		function getTemplateDatalabelDict(source:NSString;labelDict:PNSDictionary):NSData;cdecl;
		
		
	end;
	
	PTLabelClass=interface(NSObjectClass)//
	['{D5774F62-FFD8-4E30-A6CC-7B618DC3A398}']
	end;
	
	TPTLabel=class(TOCGenericImport<PTLabelClass,PTLabel>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTLabel_FakeLoader : PTLabel; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTLabel';
{$O+}



{$ENDIF}

end.

