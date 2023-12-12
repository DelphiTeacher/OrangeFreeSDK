/*!
 *  \~chinese
 *  @header     PTEncode.h
 *  @abstract   编码与解码
 *
 *  \~english
 *  @header     PTEncode.h
 *  @abstract   Coding and decoding
 */

#import <Foundation/Foundation.h>

@interface PTEncode : NSObject


/*!
 *  \~chinese
 *  编码，默认是GBK
 *
 *  @param string         需要编码的字符串
 *
 *  @return 编码后的数据
 *
 *  \~english
 *  Encode，default:GBK
 *
 *  @param string         String to be encoded
 *
 *  @return Encoded data
 */
+ (NSData *)encodeDataWithString:(NSString *)string;

/*!
 *  \~chinese
 *  解码,default:GBK
 *
 *  @param data           需要解码的数据
 *
 *  @return 解码后的字符串
 *
 *  \~english
 *  Decoding,default:GBK
 *
 *  @param data           Data to be decoded
 *
 *  @return Decoded data
 */
+ (NSString *)decodeStringWithData:(NSData *)data;

/*!
 *  \~chinese
 *  支持多种编码
 *
 *  @param string           需要编码的字符串
 *  @param encodeType       编码类型
 *
 *  @return 编码后的数据
 *
 *  \~english
 *  Support various encoding.
 *
 *  @param string           String to be encoded
 *  @param encodeType       Encode type
 *
 *  @return Encoded data
 */
+ (NSData *)encodeDataWithString:(NSString *)string encodingType:(CFStringEncodings)encodeType;

/*!
 *  \~chinese
 *  支持多种解码
 *
 *  @param data             需要解码的数据
 *  @param encodeType       编码类型
 *
 *  @return 解码后的字符串
 *
 *  \~english
 *  Support various decoding.
 *
 *  @param data             Data to be decoded
 *  @param encodeType       Encode type
 *
 *  @return Decoded data
 */
+ (NSString *)decodeDataWithString:(NSData *)data encodingType:(CFStringEncodings)encodeType;

@end
