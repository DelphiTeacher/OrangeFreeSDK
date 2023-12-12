/*!
 *  \~chinese
 *  @header     PTLabel.h
 *  @abstract   快递模板
 *
 *  \~english
 *  @header     PTLabel.h
 *  @abstract   Express template
 */

#import <Foundation/Foundation.h>


/*!
 *  \~chinese
 *  @brief   使用电子面单模板，只需要填充相应的表单数据，即可发送打印出一张面单。注意： 1.当使用模板打印时，您必须填充我们提供的模板使用范例中所填充的所有表单项。2. 如果有空数据项，比如申明价值为空，则传入@""空字符串。3.不同的模板，所要填充的数据项是不同的，具体以我们的范例为准。
 *
 *  \~english
 *  @brief   By using electronic waybill template, only filling in it accordingly can send and print it out。Note： 1. When using template to print, you should fill in all the blanks as the template sample showed.2.If there is null data, e.g. claiming value is null, please input null character string @"".3.The data to fill in differs depending on the template, please subject to the sample showed.
 */

@interface PTLabel : NSObject

/*!
 *  \~chinese
 *  快递公司
 *
 *  \~english
 *  Express company
 */
@property(strong,nonatomic,readwrite) NSString *express_company;

/*!
 *  \~chinese
 *  运单号
 *
 *  \~english
 *  Delivery number
 */
@property(strong,nonatomic,readwrite) NSString *delivery_number;

/*!
 *  \~chinese
 *  订单号
 *
 *  \~english
 *  Order number
 */
@property(strong,nonatomic,readwrite) NSString *order_number;

/*!
 *  \~chinese
 *  集散地
 *
 *  \~english
 *  Distributing
 */
@property(strong,nonatomic,readwrite) NSString *distributing;

/*!
 *  \~chinese
 *  条形码
 *
 *  \~english
 *  Barcode
 */
@property(strong,nonatomic,readwrite) NSString *barcode;

/*!
 *  \~chinese
 *  条形码下方的字符
 *
 *  \~english
 *  The character below the bar code
 */
@property(strong,nonatomic,readwrite) NSString *barcode_text;

/*!
 *  \~chinese
 *  二维码
 *
 *  \~english
 *  QRcode
 */
@property(strong,nonatomic,readwrite) NSString *qrcode;

/*!
 *  \~chinese
 *  二维码下方的字符
 *
 *  \~english
 *  The character below the QR code
 */
@property(strong,nonatomic,readwrite) NSString *qrcode_text;

/*!
 *  \~chinese
 *  收件人 名字
 *
 *  \~english
 *  Recipient name
 */
@property(strong,nonatomic,readwrite) NSString *receiver_name;

/*!
 *  \~chinese
 *  收件人 电话
 *
 *  \~english
 *  Recipient phone
 */
@property(strong,nonatomic,readwrite) NSString *receiver_phone;

/*!
 *  \~chinese
 *  收件人 地址
 *
 *  \~english
 *  Recipient address
 */
@property(strong,nonatomic,readwrite) NSString *receiver_address;

/*!
 *  \~chinese
 *  收件人 信息
 *
 *  \~english
 *  Recipient Information
 */
@property(strong,nonatomic,readwrite) NSString *receiver_message;

/*!
 *  \~chinese
 *  发件人 名字
 *
 *  \~english
 *  Sender name
 */
@property(strong,nonatomic,readwrite) NSString *sender_name;

/*!
 *  \~chinese
 *  发件人 电话
 *
 *  \~english
 *  Sender phone
 */
@property(strong,nonatomic,readwrite) NSString *sender_phone;

/*!
 *  \~chinese
 *  发件人 地址
 *
 *  \~english
 *  Sender address
 */
@property(strong,nonatomic,readwrite) NSString *sender_address;

/*!
 *  \~chinese
 *  发件人 信息
 *
 *  \~english
 *  Sender information
 */
@property(strong,nonatomic,readwrite) NSString *sender_message;

/*!
 *  \~chinese
 *  物品名
 *
 *  \~english
 *  Item name
 */
@property(strong,nonatomic,readwrite) NSString *article_name;

/*!
 *  \~chinese
 *  物品重量
 *
 *  \~english
 *  Item weight
 */
@property(strong,nonatomic,readwrite) NSString *article_weight;

/*!
 *  \~chinese
 *  申明价值
 *
 *  \~english
 *  Affirmation value
 */
@property(strong,nonatomic,readwrite) NSString *amount_declare;

/*!
 *  \~chinese
 *  到付金额
 *
 *  \~english
 *  Payment amount
 */
@property(strong,nonatomic,readwrite) NSString *amount_paid;

/*!
 *  \~chinese
 *  预付金额
 *
 *  \~english
 *  Prepayment amount
 */
@property(strong,nonatomic,readwrite) NSString *amount_paid_advance;

/// 由模板数据生成下发给打印机的数据
/// @param filePath 模板路径
- (NSData *)dataWithSourceFile:(NSString *)filePath;

/// 生成TSPL指令的数据
- (NSData *)dataWithTSPL;

/// 由模板数据生成下发给打印机的数据
/// @param source 资源
/// @param labelDict 模板定义的key
/// @param orderDetails 订单详情
- (NSData *)getTemplateData:(NSString *)source labelDict:(NSDictionary *)labelDict orderDetails:(NSArray *)orderDetails;

/// 由模板数据生成下发给打印机的数据
/// @param source 资源
/// @param labelDict 模板定义的key
- (NSData *)getTemplateData:(NSString *)source labelDict:(NSDictionary *)labelDict;

@end
