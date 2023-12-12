//{!
// *  \~chinese
// *  @header     PTEncode.h
// *  @abstract   编码与解码
// *
// *  \~english
// *  @header     PTEncode.h
// *  @abstract   Coding and decoding
// }

unit iOSApi.PTEncode;

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

	
	//@interface PTEncode : NSObject
	//@interface PTEncode : NSObject
	PTEncode=interface(NSObject)//
	['{C3DE855E-B832-4704-8AD3-F62D654C2A13}']
		
		
		//{!
		// *  \~chinese
		// *  编码，默认是GBK
		// *
		// *  @param string         需要编码的字符串
		// *
		// *  @return 编码后的数据
		// *
		// *  \~english
		// *  Encode，default:GBK
		// *
		// *  @param string         String to be encoded
		// *
		// *  @return Encoded data
		// }
		
		//{!
		// *  \~chinese
		// *  解码,default:GBK
		// *
		// *  @param data           需要解码的数据
		// *
		// *  @return 解码后的字符串
		// *
		// *  \~english
		// *  Decoding,default:GBK
		// *
		// *  @param data           Data to be decoded
		// *
		// *  @return Decoded data
		// }
		
		//{!
		// *  \~chinese
		// *  支持多种编码
		// *
		// *  @param string           需要编码的字符串
		// *  @param encodeType       编码类型
		// *
		// *  @return 编码后的数据
		// *
		// *  \~english
		// *  Support various encoding.
		// *
		// *  @param string           String to be encoded
		// *  @param encodeType       Encode type
		// *
		// *  @return Encoded data
		// }
		
		//{!
		// *  \~chinese
		// *  支持多种解码
		// *
		// *  @param data             需要解码的数据
		// *  @param encodeType       编码类型
		// *
		// *  @return 解码后的字符串
		// *
		// *  \~english
		// *  Support various decoding.
		// *
		// *  @param data             Data to be decoded
		// *  @param encodeType       Encode type
		// *
		// *  @return Decoded data
		// }
		
	end;
	
	PTEncodeClass=interface(NSObjectClass)//
	['{CADA6A81-799F-4F6B-B563-29E4BB926F22}']
		//+ (NSData *)encodeDataWithString:(NSString *)string;
		function encodeDataWithString(astring:NSString):NSData;cdecl;
		
		//+ (NSString *)decodeStringWithData:(NSData *)data;
		function decodeStringWithData(data:NSData):NSString;cdecl;
		
//		//+ (NSData *)encodeDataWithString:(NSString *)string encodingType:(CFStringEncodings)encodeType;
//		[MethodName('encodeDataWithString:encodingType:')]
//		function encodeDataWithStringencodingType(astring:NSString;encodeType:CFStringEncodings):NSData;cdecl;
//
//		//+ (NSString *)decodeDataWithString:(NSData *)data encodingType:(CFStringEncodings)encodeType;
//		[MethodName('decodeDataWithString:encodingType:')]
//		function decodeDataWithStringencodingType(data:NSData;encodeType:CFStringEncodings):NSString;cdecl;

	end;
	
	TPTEncode=class(TOCGenericImport<PTEncodeClass,PTEncode>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTEncode_FakeLoader : PTEncode; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTEncode';
{$O+}



{$ENDIF}

end.

