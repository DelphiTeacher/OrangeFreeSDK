//{!
// *  \~chinese
// *  @header     PTLabel.h
// *  @abstract   快递模板
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
	// *  @brief   使用电子面单模板，只需要填充相应的表单数据，即可发送打印出一张面单。注意： 1.当使用模板打印时，您必须填充我们提供的模板使用范例中所填充的所有表单项。2. 如果有空数据项，比如申明价值为空，则传入@""空字符串。3.不同的模板，所要填充的数据项是不同的，具体以我们的范例为准。
	// *
	// *  \~english
	// *  @brief   By using electronic waybill template, only filling in it accordingly can send and print it out。Note： 1. When using template to print, you should fill in all the blanks as the template sample showed.2.If there is null data, e.g. claiming value is null, please input null character string @"".3.The data to fill in differs depending on the template, please subject to the sample showed.
	// }
	
	//@interface PTLabel : NSObject
	//@interface PTLabel : NSObject
	PTLabel=interface(NSObject)//
	['{AFC91D49-87DC-428C-BFF0-AD803305D7D3}']
		
		//{!
		// *  \~chinese
		// *  快递公司
		// *
		// *  \~english
		// *  Express company
		// }
		//@property(strong,nonatomic,readwrite) NSString *express_company;
		function express_company:NSString;cdecl;
		procedure setExpress_company(express_company:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  运单号
		// *
		// *  \~english
		// *  Delivery number
		// }
		//@property(strong,nonatomic,readwrite) NSString *delivery_number;
		function delivery_number:NSString;cdecl;
		procedure setDelivery_number(delivery_number:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  订单号
		// *
		// *  \~english
		// *  Order number
		// }
		//@property(strong,nonatomic,readwrite) NSString *order_number;
		function order_number:NSString;cdecl;
		procedure setOrder_number(order_number:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  集散地
		// *
		// *  \~english
		// *  Distributing
		// }
		//@property(strong,nonatomic,readwrite) NSString *distributing;
		function distributing:NSString;cdecl;
		procedure setDistributing(distributing:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  条形码
		// *
		// *  \~english
		// *  Barcode
		// }
		//@property(strong,nonatomic,readwrite) NSString *barcode;
		function barcode:NSString;cdecl;
		procedure setBarcode(barcode:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  条形码下方的字符
		// *
		// *  \~english
		// *  The character below the bar code
		// }
		//@property(strong,nonatomic,readwrite) NSString *barcode_text;
		function barcode_text:NSString;cdecl;
		procedure setBarcode_text(barcode_text:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  二维码
		// *
		// *  \~english
		// *  QRcode
		// }
		//@property(strong,nonatomic,readwrite) NSString *qrcode;
		function qrcode:NSString;cdecl;
		procedure setQrcode(qrcode:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  二维码下方的字符
		// *
		// *  \~english
		// *  The character below the QR code
		// }
		//@property(strong,nonatomic,readwrite) NSString *qrcode_text;
		function qrcode_text:NSString;cdecl;
		procedure setQrcode_text(qrcode_text:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  收件人 名字
		// *
		// *  \~english
		// *  Recipient name
		// }
		//@property(strong,nonatomic,readwrite) NSString *receiver_name;
		function receiver_name:NSString;cdecl;
		procedure setReceiver_name(receiver_name:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  收件人 电话
		// *
		// *  \~english
		// *  Recipient phone
		// }
		//@property(strong,nonatomic,readwrite) NSString *receiver_phone;
		function receiver_phone:NSString;cdecl;
		procedure setReceiver_phone(receiver_phone:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  收件人 地址
		// *
		// *  \~english
		// *  Recipient address
		// }
		//@property(strong,nonatomic,readwrite) NSString *receiver_address;
		function receiver_address:NSString;cdecl;
		procedure setReceiver_address(receiver_address:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  收件人 信息
		// *
		// *  \~english
		// *  Recipient Information
		// }
		//@property(strong,nonatomic,readwrite) NSString *receiver_message;
		function receiver_message:NSString;cdecl;
		procedure setReceiver_message(receiver_message:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  发件人 名字
		// *
		// *  \~english
		// *  Sender name
		// }
		//@property(strong,nonatomic,readwrite) NSString *sender_name;
		function sender_name:NSString;cdecl;
		procedure setSender_name(sender_name:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  发件人 电话
		// *
		// *  \~english
		// *  Sender phone
		// }
		//@property(strong,nonatomic,readwrite) NSString *sender_phone;
		function sender_phone:NSString;cdecl;
		procedure setSender_phone(sender_phone:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  发件人 地址
		// *
		// *  \~english
		// *  Sender address
		// }
		//@property(strong,nonatomic,readwrite) NSString *sender_address;
		function sender_address:NSString;cdecl;
		procedure setSender_address(sender_address:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  发件人 信息
		// *
		// *  \~english
		// *  Sender information
		// }
		//@property(strong,nonatomic,readwrite) NSString *sender_message;
		function sender_message:NSString;cdecl;
		procedure setSender_message(sender_message:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  物品名
		// *
		// *  \~english
		// *  Item name
		// }
		//@property(strong,nonatomic,readwrite) NSString *article_name;
		function article_name:NSString;cdecl;
		procedure setArticle_name(article_name:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  物品重量
		// *
		// *  \~english
		// *  Item weight
		// }
		//@property(strong,nonatomic,readwrite) NSString *article_weight;
		function article_weight:NSString;cdecl;
		procedure setArticle_weight(article_weight:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  申明价值
		// *
		// *  \~english
		// *  Affirmation value
		// }
		//@property(strong,nonatomic,readwrite) NSString *amount_declare;
		function amount_declare:NSString;cdecl;
		procedure setAmount_declare(amount_declare:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  到付金额
		// *
		// *  \~english
		// *  Payment amount
		// }
		//@property(strong,nonatomic,readwrite) NSString *amount_paid;
		function amount_paid:NSString;cdecl;
		procedure setAmount_paid(amount_paid:NSString);cdecl;
		
		//{!
		// *  \~chinese
		// *  预付金额
		// *
		// *  \~english
		// *  Prepayment amount
		// }
		//@property(strong,nonatomic,readwrite) NSString *amount_paid_advance;
		function amount_paid_advance:NSString;cdecl;
		procedure setAmount_paid_advance(amount_paid_advance:NSString);cdecl;
		
		///// 由模板数据生成下发给打印机的数据
		///// @param filePath 模板路径
		//- (NSData *)dataWithSourceFile:(NSString *)filePath;
		function dataWithSourceFile(filePath:NSString):NSData;cdecl;
		
		
		///// 生成TSPL指令的数据
		//- (NSData *)dataWithTSPL;
		function dataWithTSPL:NSData;cdecl;
		
		
		///// 由模板数据生成下发给打印机的数据
		///// @param source 资源
		///// @param labelDict 模板定义的key
		///// @param orderDetails 订单详情
		//- (NSData *)getTemplateData:(NSString *)source labelDict:(NSDictionary *)labelDict orderDetails:(NSArray *)orderDetails;
		[MethodName('getTemplateData:labelDict:orderDetails:')]
		function getTemplateDatalabelDictorderDetails(source:NSString;labelDict:PNSDictionary;orderDetails:NSArray):NSData;cdecl;
		
		
		///// 由模板数据生成下发给打印机的数据
		///// @param source 资源
		///// @param labelDict 模板定义的key
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

