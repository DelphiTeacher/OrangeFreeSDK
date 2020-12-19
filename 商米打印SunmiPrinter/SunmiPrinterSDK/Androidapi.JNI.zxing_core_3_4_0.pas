//Code Fix By [金华]DelphiTeacher(452330643)

//====================================================
//
//  转换来自JarOrClass2Pas(原JavaClassToDelphiUnit)
//  原始作者：ying32
//  QQ: 1444386932、396506155
//  Email：yuanfen3287@vip.qq.com
//
//  修改 By：Flying Wang & 爱吃猪头肉
//  请不要移除以上的任何信息。
//  请不要将本版本发到城通网盘，否则死全家。
//
//  Email：1765535979@qq.com
//  QQ Group：165232328
//
//  生成时间：2020-04-11 14:33:25
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.zxing_core_3_4_0;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
//  Androidapi.JNI.java.nio.charset.Charset,
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JAztecDetectorResult = interface; //com.google.zxing.aztec.AztecDetectorResult
  JAztecReader = interface; //com.google.zxing.aztec.AztecReader
  JAztecWriter = interface; //com.google.zxing.aztec.AztecWriter
//  JDecoder_1 = interface; //com.google.zxing.aztec.decoder.Decoder$1
  JDecoder_Table = interface; //com.google.zxing.aztec.decoder.Decoder$Table
  JDecoder = interface; //com.google.zxing.aztec.decoder.Decoder
  JDetector_Point = interface; //com.google.zxing.aztec.detector.Detector$Point
  JDetector = interface; //com.google.zxing.aztec.detector.Detector
  JAztecCode = interface; //com.google.zxing.aztec.encoder.AztecCode
  JBinaryShiftToken = interface; //com.google.zxing.aztec.encoder.BinaryShiftToken
  JEncoder = interface; //com.google.zxing.aztec.encoder.Encoder
//  JHighLevelEncoder_1 = interface; //com.google.zxing.aztec.encoder.HighLevelEncoder$1
  JHighLevelEncoder = interface; //com.google.zxing.aztec.encoder.HighLevelEncoder
  JSimpleToken = interface; //com.google.zxing.aztec.encoder.SimpleToken
  JState = interface; //com.google.zxing.aztec.encoder.State
  JToken = interface; //com.google.zxing.aztec.encoder.Token
  JBarcodeFormat = interface; //com.google.zxing.BarcodeFormat
  JBinarizer = interface; //com.google.zxing.Binarizer
  JBinaryBitmap = interface; //com.google.zxing.BinaryBitmap
  JChecksumException = interface; //com.google.zxing.ChecksumException
  JAbstractDoCoMoResultParser = interface; //com.google.zxing.client.result.AbstractDoCoMoResultParser
  JAddressBookAUResultParser = interface; //com.google.zxing.client.result.AddressBookAUResultParser
  JAddressBookDoCoMoResultParser = interface; //com.google.zxing.client.result.AddressBookDoCoMoResultParser
  JAddressBookParsedResult = interface; //com.google.zxing.client.result.AddressBookParsedResult
  JBizcardResultParser = interface; //com.google.zxing.client.result.BizcardResultParser
  JBookmarkDoCoMoResultParser = interface; //com.google.zxing.client.result.BookmarkDoCoMoResultParser
  JCalendarParsedResult = interface; //com.google.zxing.client.result.CalendarParsedResult
  JEmailAddressParsedResult = interface; //com.google.zxing.client.result.EmailAddressParsedResult
  JEmailAddressResultParser = interface; //com.google.zxing.client.result.EmailAddressResultParser
  JEmailDoCoMoResultParser = interface; //com.google.zxing.client.result.EmailDoCoMoResultParser
  JExpandedProductParsedResult = interface; //com.google.zxing.client.result.ExpandedProductParsedResult
  JExpandedProductResultParser = interface; //com.google.zxing.client.result.ExpandedProductResultParser
  JGeoParsedResult = interface; //com.google.zxing.client.result.GeoParsedResult
  JGeoResultParser = interface; //com.google.zxing.client.result.GeoResultParser
  JISBNParsedResult = interface; //com.google.zxing.client.result.ISBNParsedResult
  JISBNResultParser = interface; //com.google.zxing.client.result.ISBNResultParser
  JParsedResult = interface; //com.google.zxing.client.result.ParsedResult
  JParsedResultType = interface; //com.google.zxing.client.result.ParsedResultType
  JProductParsedResult = interface; //com.google.zxing.client.result.ProductParsedResult
  JProductResultParser = interface; //com.google.zxing.client.result.ProductResultParser
  JResultParser = interface; //com.google.zxing.client.result.ResultParser
  JSMSMMSResultParser = interface; //com.google.zxing.client.result.SMSMMSResultParser
  JSMSParsedResult = interface; //com.google.zxing.client.result.SMSParsedResult
  JSMSTOMMSTOResultParser = interface; //com.google.zxing.client.result.SMSTOMMSTOResultParser
  JSMTPResultParser = interface; //com.google.zxing.client.result.SMTPResultParser
  JTelParsedResult = interface; //com.google.zxing.client.result.TelParsedResult
  JTelResultParser = interface; //com.google.zxing.client.result.TelResultParser
  JTextParsedResult = interface; //com.google.zxing.client.result.TextParsedResult
  JURIParsedResult = interface; //com.google.zxing.client.result.URIParsedResult
  JURIResultParser = interface; //com.google.zxing.client.result.URIResultParser
  JURLTOResultParser = interface; //com.google.zxing.client.result.URLTOResultParser
  JVCardResultParser = interface; //com.google.zxing.client.result.VCardResultParser
  JVEventResultParser = interface; //com.google.zxing.client.result.VEventResultParser
  JVINParsedResult = interface; //com.google.zxing.client.result.VINParsedResult
  JVINResultParser = interface; //com.google.zxing.client.result.VINResultParser
  JWifiParsedResult = interface; //com.google.zxing.client.result.WifiParsedResult
  JWifiResultParser = interface; //com.google.zxing.client.result.WifiResultParser
  JBitArray = interface; //com.google.zxing.common.BitArray
  JBitMatrix = interface; //com.google.zxing.common.BitMatrix
  JBitSource = interface; //com.google.zxing.common.BitSource
  JCharacterSetECI = interface; //com.google.zxing.common.CharacterSetECI
  JDecoderResult = interface; //com.google.zxing.common.DecoderResult
  JDefaultGridSampler = interface; //com.google.zxing.common.DefaultGridSampler
  JMathUtils = interface; //com.google.zxing.common.detector.MathUtils
  JMonochromeRectangleDetector = interface; //com.google.zxing.common.detector.MonochromeRectangleDetector
  JWhiteRectangleDetector = interface; //com.google.zxing.common.detector.WhiteRectangleDetector
  JDetectorResult = interface; //com.google.zxing.common.DetectorResult
  JGlobalHistogramBinarizer = interface; //com.google.zxing.common.GlobalHistogramBinarizer
  JGridSampler = interface; //com.google.zxing.common.GridSampler
  JHybridBinarizer = interface; //com.google.zxing.common.HybridBinarizer
  JPerspectiveTransform = interface; //com.google.zxing.common.PerspectiveTransform
  JGenericGF = interface; //com.google.zxing.common.reedsolomon.GenericGF
  JGenericGFPoly = interface; //com.google.zxing.common.reedsolomon.GenericGFPoly
  JReedSolomonDecoder = interface; //com.google.zxing.common.reedsolomon.ReedSolomonDecoder
  JReedSolomonEncoder = interface; //com.google.zxing.common.reedsolomon.ReedSolomonEncoder
  JReedSolomonException = interface; //com.google.zxing.common.reedsolomon.ReedSolomonException
  JStringUtils = interface; //com.google.zxing.common.StringUtils
  JDataMatrixReader = interface; //com.google.zxing.datamatrix.DataMatrixReader
  JDataMatrixWriter = interface; //com.google.zxing.datamatrix.DataMatrixWriter
  JBitMatrixParser = interface; //com.google.zxing.datamatrix.decoder.BitMatrixParser
  JDataBlock = interface; //com.google.zxing.datamatrix.decoder.DataBlock
//  JDecodedBitStreamParser_1 = interface; //com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$1
  JDecodedBitStreamParser_Mode = interface; //com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$Mode
  JDecodedBitStreamParser = interface; //com.google.zxing.datamatrix.decoder.DecodedBitStreamParser
  JDecoder_084 = interface; //com.google.zxing.datamatrix.decoder.Decoder
//  JVersion_1 = interface; //com.google.zxing.datamatrix.decoder.Version$1
  JVersion_ECB = interface; //com.google.zxing.datamatrix.decoder.Version$ECB
  JVersion_ECBlocks = interface; //com.google.zxing.datamatrix.decoder.Version$ECBlocks
  JVersion = interface; //com.google.zxing.datamatrix.decoder.Version
  JDetector_089 = interface; //com.google.zxing.datamatrix.detector.Detector
  JASCIIEncoder = interface; //com.google.zxing.datamatrix.encoder.ASCIIEncoder
  JBase256Encoder = interface; //com.google.zxing.datamatrix.encoder.Base256Encoder
  JC40Encoder = interface; //com.google.zxing.datamatrix.encoder.C40Encoder
  JDataMatrixSymbolInfo144 = interface; //com.google.zxing.datamatrix.encoder.DataMatrixSymbolInfo144
  JDefaultPlacement = interface; //com.google.zxing.datamatrix.encoder.DefaultPlacement
  JEdifactEncoder = interface; //com.google.zxing.datamatrix.encoder.EdifactEncoder
  JEncoder_096 = interface; //com.google.zxing.datamatrix.encoder.Encoder
  JEncoderContext = interface; //com.google.zxing.datamatrix.encoder.EncoderContext
  JErrorCorrection = interface; //com.google.zxing.datamatrix.encoder.ErrorCorrection
  JHighLevelEncoder_099 = interface; //com.google.zxing.datamatrix.encoder.HighLevelEncoder
  JSymbolInfo = interface; //com.google.zxing.datamatrix.encoder.SymbolInfo
  JSymbolShapeHint = interface; //com.google.zxing.datamatrix.encoder.SymbolShapeHint
  JTextEncoder = interface; //com.google.zxing.datamatrix.encoder.TextEncoder
  JX12Encoder = interface; //com.google.zxing.datamatrix.encoder.X12Encoder
  JDecodeHintType = interface; //com.google.zxing.DecodeHintType
  JDimension = interface; //com.google.zxing.Dimension
  JEncodeHintType = interface; //com.google.zxing.EncodeHintType
  JFormatException = interface; //com.google.zxing.FormatException
  JInvertedLuminanceSource = interface; //com.google.zxing.InvertedLuminanceSource
  JLuminanceSource = interface; //com.google.zxing.LuminanceSource
//  JBitMatrixParser_110 = interface; //com.google.zxing.maxicode.decoder.BitMatrixParser
//  JDecodedBitStreamParser_111 = interface; //com.google.zxing.maxicode.decoder.DecodedBitStreamParser
//  JDecoder_112 = interface; //com.google.zxing.maxicode.decoder.Decoder
  JMaxiCodeReader = interface; //com.google.zxing.maxicode.MaxiCodeReader
  JByQuadrantReader = interface; //com.google.zxing.multi.ByQuadrantReader
  JGenericMultipleBarcodeReader = interface; //com.google.zxing.multi.GenericMultipleBarcodeReader
  JMultipleBarcodeReader = interface; //com.google.zxing.multi.MultipleBarcodeReader
//  JMultiDetector = interface; //com.google.zxing.multi.qrcode.detector.MultiDetector
//  JMultiFinderPatternFinder_1 = interface; //com.google.zxing.multi.qrcode.detector.MultiFinderPatternFinder$1
  JMultiFinderPatternFinder_ModuleSizeComparator = interface; //com.google.zxing.multi.qrcode.detector.MultiFinderPatternFinder$ModuleSizeComparator
  JMultiFinderPatternFinder = interface; //com.google.zxing.multi.qrcode.detector.MultiFinderPatternFinder
//  JQRCodeMultiReader_1 = interface; //com.google.zxing.multi.qrcode.QRCodeMultiReader$1
  JQRCodeMultiReader_SAComparator = interface; //com.google.zxing.multi.qrcode.QRCodeMultiReader$SAComparator
  JQRCodeMultiReader = interface; //com.google.zxing.multi.qrcode.QRCodeMultiReader
  JMultiFormatReader = interface; //com.google.zxing.MultiFormatReader
//  JMultiFormatWriter_1 = interface; //com.google.zxing.MultiFormatWriter$1
  JMultiFormatWriter = interface; //com.google.zxing.MultiFormatWriter
  JNotFoundException = interface; //com.google.zxing.NotFoundException
  JCodaBarReader = interface; //com.google.zxing.oned.CodaBarReader
  JCodaBarWriter = interface; //com.google.zxing.oned.CodaBarWriter
  JCode128Reader = interface; //com.google.zxing.oned.Code128Reader
  JCode128Writer_CType = interface; //com.google.zxing.oned.Code128Writer$CType
  JCode128Writer = interface; //com.google.zxing.oned.Code128Writer
  JCode39Reader = interface; //com.google.zxing.oned.Code39Reader
  JCode39Writer = interface; //com.google.zxing.oned.Code39Writer
  JCode93Reader = interface; //com.google.zxing.oned.Code93Reader
  JCode93Writer = interface; //com.google.zxing.oned.Code93Writer
  JEAN13Reader = interface; //com.google.zxing.oned.EAN13Reader
  JEAN13Writer = interface; //com.google.zxing.oned.EAN13Writer
  JEAN8Reader = interface; //com.google.zxing.oned.EAN8Reader
  JEAN8Writer = interface; //com.google.zxing.oned.EAN8Writer
  JEANManufacturerOrgSupport = interface; //com.google.zxing.oned.EANManufacturerOrgSupport
  JITFReader = interface; //com.google.zxing.oned.ITFReader
  JITFWriter = interface; //com.google.zxing.oned.ITFWriter
  JMultiFormatOneDReader = interface; //com.google.zxing.oned.MultiFormatOneDReader
  JMultiFormatUPCEANReader = interface; //com.google.zxing.oned.MultiFormatUPCEANReader
  JOneDimensionalCodeWriter = interface; //com.google.zxing.oned.OneDimensionalCodeWriter
  JOneDReader = interface; //com.google.zxing.oned.OneDReader
  JAbstractRSSReader = interface; //com.google.zxing.oned.rss.AbstractRSSReader
  JDataCharacter = interface; //com.google.zxing.oned.rss.DataCharacter
  JBitArrayBuilder = interface; //com.google.zxing.oned.rss.expanded.BitArrayBuilder
  JAbstractExpandedDecoder = interface; //com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder
  JAI013103decoder = interface; //com.google.zxing.oned.rss.expanded.decoders.AI013103decoder
  JAI01320xDecoder = interface; //com.google.zxing.oned.rss.expanded.decoders.AI01320xDecoder
  JAI01392xDecoder = interface; //com.google.zxing.oned.rss.expanded.decoders.AI01392xDecoder
  JAI01393xDecoder = interface; //com.google.zxing.oned.rss.expanded.decoders.AI01393xDecoder
  JAI013x0x1xDecoder = interface; //com.google.zxing.oned.rss.expanded.decoders.AI013x0x1xDecoder
  JAI013x0xDecoder = interface; //com.google.zxing.oned.rss.expanded.decoders.AI013x0xDecoder
  JAI01AndOtherAIs = interface; //com.google.zxing.oned.rss.expanded.decoders.AI01AndOtherAIs
  JAI01decoder = interface; //com.google.zxing.oned.rss.expanded.decoders.AI01decoder
  JAI01weightDecoder = interface; //com.google.zxing.oned.rss.expanded.decoders.AI01weightDecoder
  JAnyAIDecoder = interface; //com.google.zxing.oned.rss.expanded.decoders.AnyAIDecoder
  JBlockParsedResult = interface; //com.google.zxing.oned.rss.expanded.decoders.BlockParsedResult
  JCurrentParsingState_State = interface; //com.google.zxing.oned.rss.expanded.decoders.CurrentParsingState$State
  JCurrentParsingState = interface; //com.google.zxing.oned.rss.expanded.decoders.CurrentParsingState
  JDecodedChar = interface; //com.google.zxing.oned.rss.expanded.decoders.DecodedChar
  JDecodedInformation = interface; //com.google.zxing.oned.rss.expanded.decoders.DecodedInformation
  JDecodedNumeric = interface; //com.google.zxing.oned.rss.expanded.decoders.DecodedNumeric
  JDecodedObject = interface; //com.google.zxing.oned.rss.expanded.decoders.DecodedObject
  JFieldParser = interface; //com.google.zxing.oned.rss.expanded.decoders.FieldParser
  JGeneralAppIdDecoder = interface; //com.google.zxing.oned.rss.expanded.decoders.GeneralAppIdDecoder
  JExpandedPair = interface; //com.google.zxing.oned.rss.expanded.ExpandedPair
  JExpandedRow = interface; //com.google.zxing.oned.rss.expanded.ExpandedRow
  JRSSExpandedReader = interface; //com.google.zxing.oned.rss.expanded.RSSExpandedReader
  JFinderPattern = interface; //com.google.zxing.oned.rss.FinderPattern
  JPair = interface; //com.google.zxing.oned.rss.Pair
  JRSS14Reader = interface; //com.google.zxing.oned.rss.RSS14Reader
  JRSSUtils = interface; //com.google.zxing.oned.rss.RSSUtils
  JUPCAReader = interface; //com.google.zxing.oned.UPCAReader
  JUPCAWriter = interface; //com.google.zxing.oned.UPCAWriter
  JUPCEANExtension2Support = interface; //com.google.zxing.oned.UPCEANExtension2Support
  JUPCEANExtension5Support = interface; //com.google.zxing.oned.UPCEANExtension5Support
  JUPCEANExtensionSupport = interface; //com.google.zxing.oned.UPCEANExtensionSupport
  JUPCEANReader = interface; //com.google.zxing.oned.UPCEANReader
  JUPCEANWriter = interface; //com.google.zxing.oned.UPCEANWriter
  JUPCEReader = interface; //com.google.zxing.oned.UPCEReader
  JUPCEWriter = interface; //com.google.zxing.oned.UPCEWriter
  JBarcodeMetadata = interface; //com.google.zxing.pdf417.decoder.BarcodeMetadata
  JBarcodeValue = interface; //com.google.zxing.pdf417.decoder.BarcodeValue
  JBoundingBox = interface; //com.google.zxing.pdf417.decoder.BoundingBox
  JCodeword = interface; //com.google.zxing.pdf417.decoder.Codeword
//  JDecodedBitStreamParser_1_191 = interface; //com.google.zxing.pdf417.decoder.DecodedBitStreamParser$1
//  JDecodedBitStreamParser_Mode_192 = interface; //com.google.zxing.pdf417.decoder.DecodedBitStreamParser$Mode
//  JDecodedBitStreamParser_193 = interface; //com.google.zxing.pdf417.decoder.DecodedBitStreamParser
  JDetectionResult = interface; //com.google.zxing.pdf417.decoder.DetectionResult
  JDetectionResultColumn = interface; //com.google.zxing.pdf417.decoder.DetectionResultColumn
  JDetectionResultRowIndicatorColumn = interface; //com.google.zxing.pdf417.decoder.DetectionResultRowIndicatorColumn
//  JErrorCorrection_197 = interface; //com.google.zxing.pdf417.decoder.ec.ErrorCorrection
  JModulusGF = interface; //com.google.zxing.pdf417.decoder.ec.ModulusGF
  JModulusPoly = interface; //com.google.zxing.pdf417.decoder.ec.ModulusPoly
  JPDF417CodewordDecoder = interface; //com.google.zxing.pdf417.decoder.PDF417CodewordDecoder
  JPDF417ScanningDecoder = interface; //com.google.zxing.pdf417.decoder.PDF417ScanningDecoder
//  JDetector_202 = interface; //com.google.zxing.pdf417.detector.Detector
  JPDF417DetectorResult = interface; //com.google.zxing.pdf417.detector.PDF417DetectorResult
  JBarcodeMatrix = interface; //com.google.zxing.pdf417.encoder.BarcodeMatrix
  JBarcodeRow = interface; //com.google.zxing.pdf417.encoder.BarcodeRow
  JCompaction = interface; //com.google.zxing.pdf417.encoder.Compaction
  JDimensions = interface; //com.google.zxing.pdf417.encoder.Dimensions
  JPDF417 = interface; //com.google.zxing.pdf417.encoder.PDF417
  JPDF417ErrorCorrection = interface; //com.google.zxing.pdf417.encoder.PDF417ErrorCorrection
//  JPDF417HighLevelEncoder_1 = interface; //com.google.zxing.pdf417.encoder.PDF417HighLevelEncoder$1
  JPDF417HighLevelEncoder = interface; //com.google.zxing.pdf417.encoder.PDF417HighLevelEncoder
  JPDF417Common = interface; //com.google.zxing.pdf417.PDF417Common
  JPDF417Reader = interface; //com.google.zxing.pdf417.PDF417Reader
  JPDF417ResultMetadata = interface; //com.google.zxing.pdf417.PDF417ResultMetadata
  JPDF417Writer = interface; //com.google.zxing.pdf417.PDF417Writer
  JPlanarYUVLuminanceSource = interface; //com.google.zxing.PlanarYUVLuminanceSource
//  JBitMatrixParser_217 = interface; //com.google.zxing.qrcode.decoder.BitMatrixParser
//  JDataBlock_218 = interface; //com.google.zxing.qrcode.decoder.DataBlock
//  JDataMask_1 = interface; //com.google.zxing.qrcode.decoder.DataMask$1
//  JDataMask_2 = interface; //com.google.zxing.qrcode.decoder.DataMask$2
//  JDataMask_3 = interface; //com.google.zxing.qrcode.decoder.DataMask$3
//  JDataMask_4 = interface; //com.google.zxing.qrcode.decoder.DataMask$4
//  JDataMask_5 = interface; //com.google.zxing.qrcode.decoder.DataMask$5
//  JDataMask_6 = interface; //com.google.zxing.qrcode.decoder.DataMask$6
//  JDataMask_7 = interface; //com.google.zxing.qrcode.decoder.DataMask$7
//  JDataMask_8 = interface; //com.google.zxing.qrcode.decoder.DataMask$8
  JDataMask = interface; //com.google.zxing.qrcode.decoder.DataMask
//  JDecodedBitStreamParser_1_228 = interface; //com.google.zxing.qrcode.decoder.DecodedBitStreamParser$1
//  JDecodedBitStreamParser_229 = interface; //com.google.zxing.qrcode.decoder.DecodedBitStreamParser
//  JDecoder_230 = interface; //com.google.zxing.qrcode.decoder.Decoder
  JErrorCorrectionLevel = interface; //com.google.zxing.qrcode.decoder.ErrorCorrectionLevel
  JFormatInformation = interface; //com.google.zxing.qrcode.decoder.FormatInformation
  JMode = interface; //com.google.zxing.qrcode.decoder.Mode
  JQRCodeDecoderMetaData = interface; //com.google.zxing.qrcode.decoder.QRCodeDecoderMetaData
//  JVersion_ECB_235 = interface; //com.google.zxing.qrcode.decoder.Version$ECB
//  JVersion_ECBlocks_236 = interface; //com.google.zxing.qrcode.decoder.Version$ECBlocks
//  JVersion_237 = interface; //com.google.zxing.qrcode.decoder.Version
  JAlignmentPattern = interface; //com.google.zxing.qrcode.detector.AlignmentPattern
  JAlignmentPatternFinder = interface; //com.google.zxing.qrcode.detector.AlignmentPatternFinder
//  JDetector_240 = interface; //com.google.zxing.qrcode.detector.Detector
//  JFinderPattern_241 = interface; //com.google.zxing.qrcode.detector.FinderPattern
//  JFinderPatternFinder_1 = interface; //com.google.zxing.qrcode.detector.FinderPatternFinder$1
  JFinderPatternFinder_EstimatedModuleComparator = interface; //com.google.zxing.qrcode.detector.FinderPatternFinder$EstimatedModuleComparator
  JFinderPatternFinder = interface; //com.google.zxing.qrcode.detector.FinderPatternFinder
  JFinderPatternInfo = interface; //com.google.zxing.qrcode.detector.FinderPatternInfo
  JBlockPair = interface; //com.google.zxing.qrcode.encoder.BlockPair
  JByteMatrix = interface; //com.google.zxing.qrcode.encoder.ByteMatrix
//  JEncoder_1 = interface; //com.google.zxing.qrcode.encoder.Encoder$1
//  JEncoder_249 = interface; //com.google.zxing.qrcode.encoder.Encoder
  JMaskUtil = interface; //com.google.zxing.qrcode.encoder.MaskUtil
  JMatrixUtil = interface; //com.google.zxing.qrcode.encoder.MatrixUtil
  JQRCode = interface; //com.google.zxing.qrcode.encoder.QRCode
  JQRCodeReader = interface; //com.google.zxing.qrcode.QRCodeReader
  JQRCodeWriter = interface; //com.google.zxing.qrcode.QRCodeWriter
  JReader = interface; //com.google.zxing.Reader
  JReaderException = interface; //com.google.zxing.ReaderException
  JResult = interface; //com.google.zxing.Result
  JResultMetadataType = interface; //com.google.zxing.ResultMetadataType
  JResultPoint = interface; //com.google.zxing.ResultPoint
  JResultPointCallback = interface; //com.google.zxing.ResultPointCallback
  JRGBLuminanceSource = interface; //com.google.zxing.RGBLuminanceSource
  JWriter = interface; //com.google.zxing.Writer
  JWriterException = interface; //com.google.zxing.WriterException

// ===== Forward SuperClasses declarations =====

  JDetectorResultClass = interface; //com.google.zxing.common.DetectorResult
  JTokenClass = interface; //com.google.zxing.aztec.encoder.Token
  JReaderExceptionClass = interface; //com.google.zxing.ReaderException
  JResultParserClass = interface; //com.google.zxing.client.result.ResultParser
  JAbstractDoCoMoResultParserClass = interface; //com.google.zxing.client.result.AbstractDoCoMoResultParser
  JParsedResultClass = interface; //com.google.zxing.client.result.ParsedResult
  JGridSamplerClass = interface; //com.google.zxing.common.GridSampler
  JBinarizerClass = interface; //com.google.zxing.Binarizer
  JGlobalHistogramBinarizerClass = interface; //com.google.zxing.common.GlobalHistogramBinarizer
  JSymbolInfoClass = interface; //com.google.zxing.datamatrix.encoder.SymbolInfo
  JC40EncoderClass = interface; //com.google.zxing.datamatrix.encoder.C40Encoder
  JLuminanceSourceClass = interface; //com.google.zxing.LuminanceSource
//  JDetector_240Class = interface; //com.google.zxing.qrcode.detector.Detector
  JFinderPatternFinderClass = interface; //com.google.zxing.qrcode.detector.FinderPatternFinder
  JQRCodeReaderClass = interface; //com.google.zxing.qrcode.QRCodeReader
  JOneDReaderClass = interface; //com.google.zxing.oned.OneDReader
  JOneDimensionalCodeWriterClass = interface; //com.google.zxing.oned.OneDimensionalCodeWriter
  JUPCEANReaderClass = interface; //com.google.zxing.oned.UPCEANReader
  JUPCEANWriterClass = interface; //com.google.zxing.oned.UPCEANWriter
  JAI013x0xDecoderClass = interface; //com.google.zxing.oned.rss.expanded.decoders.AI013x0xDecoder
  JAI01decoderClass = interface; //com.google.zxing.oned.rss.expanded.decoders.AI01decoder
  JAI01weightDecoderClass = interface; //com.google.zxing.oned.rss.expanded.decoders.AI01weightDecoder
  JAbstractExpandedDecoderClass = interface; //com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder
  JDecodedObjectClass = interface; //com.google.zxing.oned.rss.expanded.decoders.DecodedObject
  JAbstractRSSReaderClass = interface; //com.google.zxing.oned.rss.AbstractRSSReader
  JDataCharacterClass = interface; //com.google.zxing.oned.rss.DataCharacter
  JDetectionResultColumnClass = interface; //com.google.zxing.pdf417.decoder.DetectionResultColumn
  JDataMaskClass = interface; //com.google.zxing.qrcode.decoder.DataMask
  JResultPointClass = interface; //com.google.zxing.ResultPoint

// ===== Interface declarations =====
















  JDetectorResultClass = interface(JObjectClass)
  ['{DD7C2ACF-18D5-46AF-AFBF-7EE25D9D3CCD}']
    { static Property Methods }

    { static Methods }
    {class} function init(bits: JBitMatrix; points: TJavaObjectArray<JResultPoint>): JDetectorResult; cdecl; //(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/DetectorResult')]
  JDetectorResult = interface(JObject)
  ['{5ED75E2D-7051-4C18-AE6C-16D5B4195D22}']
    { Property Methods }

    { methods }
    function getBits: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    function getPoints: TJavaObjectArray<JResultPoint>; cdecl; //()[Lcom/google/zxing/ResultPoint;

    { Property }
  end;

  TJDetectorResult = class(TJavaGenericImport<JDetectorResultClass, JDetectorResult>) end;



  JAztecDetectorResultClass = interface(JDetectorResultClass) // or JObjectClass // SuperSignature: com/google/zxing/common/DetectorResult
  ['{700BA951-8F2B-4CBF-A5DB-6F540530984C}']
    { static Property Methods }

    { static Methods }
    {class} function init(bits: JBitMatrix; points: TJavaObjectArray<JResultPoint>; compact: Boolean; nbDatablocks: Integer; nbLayers: Integer): JAztecDetectorResult; cdecl; //(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;ZII)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/AztecDetectorResult')]
  JAztecDetectorResult = interface(JDetectorResult) // or JObject // SuperSignature: com/google/zxing/common/DetectorResult
  ['{C46862E9-4ED6-418B-BAA5-823745623C7C}']
    { Property Methods }

    { methods }
    function getNbLayers: Integer; cdecl; //()I
    function getNbDatablocks: Integer; cdecl; //()I
    function isCompact: Boolean; cdecl; //()Z

    { Property }
  end;

  TJAztecDetectorResult = class(TJavaGenericImport<JAztecDetectorResultClass, JAztecDetectorResult>) end;

  JAztecReaderClass = interface(JObjectClass)
  ['{C1456BEA-E23E-4101-8FB7-2A539EC18472}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAztecReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/AztecReader')]
  JAztecReader = interface(JObject)
  ['{BB21373A-05B5-49F7-98E9-F16921E80476}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJAztecReader = class(TJavaGenericImport<JAztecReaderClass, JAztecReader>) end;

  JAztecWriterClass = interface(JObjectClass)
  ['{9DAC54D5-3EDC-49B3-9851-66A1AD7D5087}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAztecWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/AztecWriter')]
  JAztecWriter = interface(JObject)
  ['{53533821-823D-45B4-A586-19735B123558}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJAztecWriter = class(TJavaGenericImport<JAztecWriterClass, JAztecWriter>) end;

//  JDecoder_1Class = interface(JObjectClass)
//  ['{FE4EB96C-24E7-40E1-9DCA-73666F523614}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/aztec/decoder/Decoder$1')]
//  JDecoder_1 = interface(JObject)
//  ['{5E67A26F-9239-4963-900F-FD90B9F29173}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecoder_1 = class(TJavaGenericImport<JDecoder_1Class, JDecoder_1>) end;

  JDecoder_TableClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{8E5B2D42-C868-41DA-8E1F-97AEA11B2A3E}']
    { static Property Methods }
    {class} function _GetUPPER: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function _GetLOWER: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function _GetMIXED: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function _GetDIGIT: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function _GetPUNCT: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function _GetBINARY: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;

    { static Methods }
    {class} function values: TJavaObjectArray<JDecoder_Table>; cdecl; //()[Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function valueOf(name: JString): JDecoder_Table; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/aztec/decoder/Decoder$Table;

    { static Property }
    {class} property UPPER: JDecoder_Table read _GetUPPER;
    {class} property LOWER: JDecoder_Table read _GetLOWER;
    {class} property MIXED: JDecoder_Table read _GetMIXED;
    {class} property DIGIT: JDecoder_Table read _GetDIGIT;
    {class} property PUNCT: JDecoder_Table read _GetPUNCT;
    {class} property BINARY: JDecoder_Table read _GetBINARY;
  end;

  [JavaSignature('com/google/zxing/aztec/decoder/Decoder$Table')]
  JDecoder_Table = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{E0AA95FE-94C8-4517-A180-635CBF6ADD50}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecoder_Table = class(TJavaGenericImport<JDecoder_TableClass, JDecoder_Table>) end;

  JDecoderClass = interface(JObjectClass)
  ['{A9BADCB3-0AC9-4F29-A180-5B624954A6E6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDecoder; cdecl; //()V
    {class} function highLevelDecode(correctedBits: TJavaArray<Boolean>): JString; cdecl; //([Z)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/decoder/Decoder')]
  JDecoder = interface(JObject)
  ['{4C363BE2-CA74-4908-B81F-0B75FCC2E42D}']
    { Property Methods }

    { methods }
    function decode(detectorResult: JAztecDetectorResult): JDecoderResult; cdecl; //(Lcom/google/zxing/aztec/AztecDetectorResult;)Lcom/google/zxing/common/DecoderResult;

    { Property }
  end;

  TJDecoder = class(TJavaGenericImport<JDecoderClass, JDecoder>) end;

  JDetector_PointClass = interface(JObjectClass)
  ['{74A392F9-0E9F-4411-B991-668FE29F8AB4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/detector/Detector$Point')]
  JDetector_Point = interface(JObject)
  ['{63FE5C91-A0A2-46CB-A005-68AC5E13F4F6}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDetector_Point = class(TJavaGenericImport<JDetector_PointClass, JDetector_Point>) end;

  JDetectorClass = interface(JObjectClass)
  ['{71C5CCE7-FD0D-44D1-959E-0ABA8453CC55}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JDetector; cdecl; //(Lcom/google/zxing/common/BitMatrix;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/detector/Detector')]
  JDetector = interface(JObject)
  ['{603CC04B-1192-4939-B5C9-0468E21A8539}']
    { Property Methods }

    { methods }
    function detect: JAztecDetectorResult; cdecl; overload; //()Lcom/google/zxing/aztec/AztecDetectorResult;
    function detect(isMirror: Boolean): JAztecDetectorResult; cdecl; overload; //(Z)Lcom/google/zxing/aztec/AztecDetectorResult;

    { Property }
  end;

  TJDetector = class(TJavaGenericImport<JDetectorClass, JDetector>) end;

  JAztecCodeClass = interface(JObjectClass)
  ['{A91558A1-B148-4E06-8AF8-F9CDB3BA51FE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAztecCode; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/AztecCode')]
  JAztecCode = interface(JObject)
  ['{D0F5D5E9-108F-48CD-B230-F75C2D7768B9}']
    { Property Methods }

    { methods }
    function isCompact: Boolean; cdecl; //()Z
    procedure setCompact(compact: Boolean); cdecl; //(Z)V
    function getSize: Integer; cdecl; //()I
    procedure setSize(size: Integer); cdecl; //(I)V
    function getLayers: Integer; cdecl; //()I
    procedure setLayers(layers: Integer); cdecl; //(I)V
    function getCodeWords: Integer; cdecl; //()I
    procedure setCodeWords(codeWords: Integer); cdecl; //(I)V
    function getMatrix: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    procedure setMatrix(matrix: JBitMatrix); cdecl; //(Lcom/google/zxing/common/BitMatrix;)V

    { Property }
  end;

  TJAztecCode = class(TJavaGenericImport<JAztecCodeClass, JAztecCode>) end;



  JTokenClass = interface(JObjectClass)
  ['{B61DD83D-E60E-44A9-83B2-0179F4B92CA1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/Token')]
  JToken = interface(JObject)
  ['{61F1C468-7236-4F51-9DB3-F09C394593EA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJToken = class(TJavaGenericImport<JTokenClass, JToken>) end;







  JBinaryShiftTokenClass = interface(JTokenClass) // or JObjectClass // SuperSignature: com/google/zxing/aztec/encoder/Token
  ['{4154D84C-5476-4315-8E23-56703164A713}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/BinaryShiftToken')]
  JBinaryShiftToken = interface(JToken) // or JObject // SuperSignature: com/google/zxing/aztec/encoder/Token
  ['{BCF00EF6-8724-4F80-9803-2D3DAA842E22}']
    { Property Methods }

    { methods }
    procedure appendTo(bitArray: JBitArray; text: TJavaArray<Byte>); cdecl; //(Lcom/google/zxing/common/BitArray;[B)V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJBinaryShiftToken = class(TJavaGenericImport<JBinaryShiftTokenClass, JBinaryShiftToken>) end;

  JEncoderClass = interface(JObjectClass)
  ['{D77A41A9-B4D5-4457-9EF9-91A99F37F84D}']
    { static Property Methods }
    {class} function _GetDEFAULT_EC_PERCENT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDEFAULT_AZTEC_LAYERS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function encode(data: TJavaArray<Byte>): JAztecCode; cdecl; overload; //([B)Lcom/google/zxing/aztec/encoder/AztecCode;
    {class} function encode(data: TJavaArray<Byte>; minECCPercent: Integer; userSpecifiedLayers: Integer): JAztecCode; cdecl; overload; //([BII)Lcom/google/zxing/aztec/encoder/AztecCode;

    { static Property }
    {class} property DEFAULT_EC_PERCENT: Integer read _GetDEFAULT_EC_PERCENT;
    {class} property DEFAULT_AZTEC_LAYERS: Integer read _GetDEFAULT_AZTEC_LAYERS;
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/Encoder')]
  JEncoder = interface(JObject)
  ['{88137712-68FC-4D5B-9694-4C2404D4818C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncoder = class(TJavaGenericImport<JEncoderClass, JEncoder>) end;

//  JHighLevelEncoder_1Class = interface(JObjectClass)
//  ['{0617B5FF-D5B9-4FB8-80C0-E8CF8B25C237}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/aztec/encoder/HighLevelEncoder$1')]
//  JHighLevelEncoder_1 = interface(JObject)
//  ['{742CA6BA-AFB3-43F8-96E7-5799EB23F6D5}']
//    { Property Methods }
//
//    { methods }
//    function compare(a: JState; b: JState): Integer; cdecl; overload; //(Lcom/google/zxing/aztec/encoder/State;Lcom/google/zxing/aztec/encoder/State;)I
//    function compare(this: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I
//
//    { Property }
//  end;

//  TJHighLevelEncoder_1 = class(TJavaGenericImport<JHighLevelEncoder_1Class, JHighLevelEncoder_1>) end;

  JHighLevelEncoderClass = interface(JObjectClass)
  ['{31ADBA70-3B61-40DD-ACE2-9C74B84940AE}']
    { static Property Methods }

    { static Methods }
    {class} function init(text: TJavaArray<Byte>): JHighLevelEncoder; cdecl; //([B)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/HighLevelEncoder')]
  JHighLevelEncoder = interface(JObject)
  ['{8C1CBBC1-75A2-41A5-9AAB-589FC052D0FF}']
    { Property Methods }

    { methods }
    function encode: JBitArray; cdecl; //()Lcom/google/zxing/common/BitArray;

    { Property }
  end;

  TJHighLevelEncoder = class(TJavaGenericImport<JHighLevelEncoderClass, JHighLevelEncoder>) end;

  JSimpleTokenClass = interface(JTokenClass) // or JObjectClass // SuperSignature: com/google/zxing/aztec/encoder/Token
  ['{66C1A727-DB61-4D6E-9333-EFD9FA3809F5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/SimpleToken')]
  JSimpleToken = interface(JToken) // or JObject // SuperSignature: com/google/zxing/aztec/encoder/Token
  ['{BCC86DCB-5287-4F97-88CF-5DA8BADA1254}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJSimpleToken = class(TJavaGenericImport<JSimpleTokenClass, JSimpleToken>) end;

  JStateClass = interface(JObjectClass)
  ['{62CF18EF-725B-4219-8C4D-089C644DBD1D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/State')]
  JState = interface(JObject)
  ['{D6A5DA82-7C79-4BFF-9B83-8303AEEFBDD2}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJState = class(TJavaGenericImport<JStateClass, JState>) end;

  JBarcodeFormatClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{F1BD3A10-CFAE-478A-A3BC-2226B6F39386}']
    { static Property Methods }
    {class} function _GetAZTEC: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetCODABAR: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetCODE_39: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetCODE_93: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetCODE_128: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetDATA_MATRIX: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetEAN_8: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetEAN_13: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetITF: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetMAXICODE: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetPDF_417: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetQR_CODE: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetRSS_14: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetRSS_EXPANDED: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetUPC_A: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetUPC_E: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;
    {class} function _GetUPC_EAN_EXTENSION: JBarcodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/BarcodeFormat;

    { static Methods }
    {class} function values: TJavaObjectArray<JBarcodeFormat>; cdecl; //()[Lcom/google/zxing/BarcodeFormat;
    {class} function valueOf(name: JString): JBarcodeFormat; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/BarcodeFormat;

    { static Property }
    {class} property AZTEC: JBarcodeFormat read _GetAZTEC;
    {class} property CODABAR: JBarcodeFormat read _GetCODABAR;
    {class} property CODE_39: JBarcodeFormat read _GetCODE_39;
    {class} property CODE_93: JBarcodeFormat read _GetCODE_93;
    {class} property CODE_128: JBarcodeFormat read _GetCODE_128;
    {class} property DATA_MATRIX: JBarcodeFormat read _GetDATA_MATRIX;
    {class} property EAN_8: JBarcodeFormat read _GetEAN_8;
    {class} property EAN_13: JBarcodeFormat read _GetEAN_13;
    {class} property ITF: JBarcodeFormat read _GetITF;
    {class} property MAXICODE: JBarcodeFormat read _GetMAXICODE;
    {class} property PDF_417: JBarcodeFormat read _GetPDF_417;
    {class} property QR_CODE: JBarcodeFormat read _GetQR_CODE;
    {class} property RSS_14: JBarcodeFormat read _GetRSS_14;
    {class} property RSS_EXPANDED: JBarcodeFormat read _GetRSS_EXPANDED;
    {class} property UPC_A: JBarcodeFormat read _GetUPC_A;
    {class} property UPC_E: JBarcodeFormat read _GetUPC_E;
    {class} property UPC_EAN_EXTENSION: JBarcodeFormat read _GetUPC_EAN_EXTENSION;
  end;

  [JavaSignature('com/google/zxing/BarcodeFormat')]
  JBarcodeFormat = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{7BD7AAAB-A56F-4601-BC41-1E5DEA20F0FB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBarcodeFormat = class(TJavaGenericImport<JBarcodeFormatClass, JBarcodeFormat>) end;

  JBinarizerClass = interface(JObjectClass)
  ['{A98AEE79-CC7B-47EB-AA12-E95887DBDEAA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/Binarizer')]
  JBinarizer = interface(JObject)
  ['{DCD641A2-548B-4F29-859E-B079FFC40BE0}']
    { Property Methods }

    { methods }
    function getLuminanceSource: JLuminanceSource; cdecl; //()Lcom/google/zxing/LuminanceSource;
    function getBlackRow(P1: Integer; P2: JBitArray): JBitArray; cdecl; //(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;
    function getBlackMatrix: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    function createBinarizer(P1: JLuminanceSource): JBinarizer; cdecl; //(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Binarizer;
    function getWidth: Integer; cdecl; //()I
    function getHeight: Integer; cdecl; //()I

    { Property }
  end;

  TJBinarizer = class(TJavaGenericImport<JBinarizerClass, JBinarizer>) end;

  JBinaryBitmapClass = interface(JObjectClass)
  ['{0F464E1B-9DC6-452F-87DC-BAD83D524DEE}']
    { static Property Methods }

    { static Methods }
    {class} function init(binarizer: JBinarizer): JBinaryBitmap; cdecl; //(Lcom/google/zxing/Binarizer;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/BinaryBitmap')]
  JBinaryBitmap = interface(JObject)
  ['{ABFA22F6-2683-4EE4-99A9-D35D11B53A1B}']
    { Property Methods }

    { methods }
    function getWidth: Integer; cdecl; //()I
    function getHeight: Integer; cdecl; //()I
    function getBlackRow(y: Integer; row: JBitArray): JBitArray; cdecl; //(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;
    function getBlackMatrix: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    function isCropSupported: Boolean; cdecl; //()Z
    function crop(left: Integer; top: Integer; width: Integer; height: Integer): JBinaryBitmap; cdecl; //(IIII)Lcom/google/zxing/BinaryBitmap;
    function isRotateSupported: Boolean; cdecl; //()Z
    function rotateCounterClockwise: JBinaryBitmap; cdecl; //()Lcom/google/zxing/BinaryBitmap;
    function rotateCounterClockwise45: JBinaryBitmap; cdecl; //()Lcom/google/zxing/BinaryBitmap;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJBinaryBitmap = class(TJavaGenericImport<JBinaryBitmapClass, JBinaryBitmap>) end;





  JReaderExceptionClass = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
  ['{37ED5695-70A3-49DF-BC6E-A6A7ED69DE77}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/ReaderException')]
  JReaderException = interface(JException) // or JObject // SuperSignature: java/lang/Exception
  ['{6EF774EB-A78A-4AC3-8EE1-13B688F5D890}']
    { Property Methods }

    { methods }
    function fillInStackTrace: JThrowable; cdecl; //()Ljava/lang/Throwable;

    { Property }
  end;

  TJReaderException = class(TJavaGenericImport<JReaderExceptionClass, JReaderException>) end;






  JChecksumExceptionClass = interface(JReaderExceptionClass) // or JObjectClass // SuperSignature: com/google/zxing/ReaderException
  ['{C22823E8-FAA6-40AA-A57D-96B403E6B558}']
    { static Property Methods }

    { static Methods }
    {class} function getChecksumInstance: JChecksumException; cdecl; overload; //()Lcom/google/zxing/ChecksumException;
    {class} function getChecksumInstance(cause: JThrowable): JChecksumException; cdecl; overload; //(Ljava/lang/Throwable;)Lcom/google/zxing/ChecksumException;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/ChecksumException')]
  JChecksumException = interface(JReaderException) // or JObject // SuperSignature: com/google/zxing/ReaderException
  ['{B29E3B64-B7E3-4F61-B118-0BA9C8B9CFCB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJChecksumException = class(TJavaGenericImport<JChecksumExceptionClass, JChecksumException>) end;





  JResultParserClass = interface(JObjectClass)
  ['{5923898B-AAB7-4BC1-887A-A6206EDED698}']
    { static Property Methods }

    { static Methods }
    {class} function init: JResultParser; cdecl; //()V
    {class} function parseResult(theResult: JResult): JParsedResult; cdecl; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ResultParser')]
  JResultParser = interface(JObject)
  ['{C66217D5-6C1F-445D-B32E-02217120E3E9}']
    { Property Methods }

    { methods }
    function parse(P1: JResult): JParsedResult; cdecl; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJResultParser = class(TJavaGenericImport<JResultParserClass, JResultParser>) end;





  JAbstractDoCoMoResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{F4481CC2-5253-4247-845C-8D5559A32E02}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/AbstractDoCoMoResultParser')]
  JAbstractDoCoMoResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{C28DF011-92B8-4AE9-9057-88CCDD8C12E5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAbstractDoCoMoResultParser = class(TJavaGenericImport<JAbstractDoCoMoResultParserClass, JAbstractDoCoMoResultParser>) end;

  JAddressBookAUResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{9ECAC73D-4826-431B-8C26-0492D1A80EE2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAddressBookAUResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/AddressBookAUResultParser')]
  JAddressBookAUResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{878B31FD-33AF-4B02-90A6-1EF99EA8D244}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JAddressBookParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
//    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJAddressBookAUResultParser = class(TJavaGenericImport<JAddressBookAUResultParserClass, JAddressBookAUResultParser>) end;

  JAddressBookDoCoMoResultParserClass = interface(JAbstractDoCoMoResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{87FAAF93-8BC0-4DF4-95B2-5CBFCBD08B7F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAddressBookDoCoMoResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/AddressBookDoCoMoResultParser')]
  JAddressBookDoCoMoResultParser = interface(JAbstractDoCoMoResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{DA23AB51-86BA-4360-9672-38DC40C2F7A7}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JAddressBookParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
//    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJAddressBookDoCoMoResultParser = class(TJavaGenericImport<JAddressBookDoCoMoResultParserClass, JAddressBookDoCoMoResultParser>) end;






  JParsedResultClass = interface(JObjectClass)
  ['{630E126C-A6D1-4F90-B78E-E0589EF3D8D5}']
    { static Property Methods }

    { static Methods }
    {class} procedure maybeAppend(value: JString; result: JStringBuilder); cdecl; overload; //(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    {class} procedure maybeAppend(values: TJavaObjectArray<JString>; result: JStringBuilder); cdecl; overload; //([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ParsedResult')]
  JParsedResult = interface(JObject)
  ['{90482E46-691F-4674-AF00-543175A8B2BC}']
    { Property Methods }

    { methods }
    function getType: JParsedResultType; cdecl; //()Lcom/google/zxing/client/result/ParsedResultType;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJParsedResult = class(TJavaGenericImport<JParsedResultClass, JParsedResult>) end;



  JAddressBookParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{1AFC17C0-BFED-450D-98E8-0F8892E4F6EB}']
    { static Property Methods }

    { static Methods }
    {class} function init(names: TJavaObjectArray<JString>; phoneNumbers: TJavaObjectArray<JString>; phoneTypes: TJavaObjectArray<JString>; emails: TJavaObjectArray<JString>; emailTypes: TJavaObjectArray<JString>; addresses: TJavaObjectArray<JString>; addressTypes: TJavaObjectArray<JString>): JAddressBookParsedResult; cdecl; overload; //([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    {class} function init(names: TJavaObjectArray<JString>; nicknames: TJavaObjectArray<JString>; pronunciation: JString; phoneNumbers: TJavaObjectArray<JString>; phoneTypes: TJavaObjectArray<JString>; emails: TJavaObjectArray<JString>; emailTypes: TJavaObjectArray<JString>; instantMessenger: JString; note: JString; addresses: TJavaObjectArray<JString>; addressTypes: TJavaObjectArray<JString>; org: JString; birthday: JString; title: JString; urls: TJavaObjectArray<JString>; geo: TJavaObjectArray<JString>): JAddressBookParsedResult; cdecl; overload; //([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/AddressBookParsedResult')]
  JAddressBookParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{6723856E-E580-426E-BF3F-737704CC14C9}']
    { Property Methods }

    { methods }
    function getNames: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getNicknames: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getPronunciation: JString; cdecl; //()Ljava/lang/String;
    function getPhoneNumbers: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getPhoneTypes: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getEmails: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getEmailTypes: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getInstantMessenger: JString; cdecl; //()Ljava/lang/String;
    function getNote: JString; cdecl; //()Ljava/lang/String;
    function getAddresses: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getAddressTypes: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getTitle: JString; cdecl; //()Ljava/lang/String;
    function getOrg: JString; cdecl; //()Ljava/lang/String;
    function getURLs: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getBirthday: JString; cdecl; //()Ljava/lang/String;
    function getGeo: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAddressBookParsedResult = class(TJavaGenericImport<JAddressBookParsedResultClass, JAddressBookParsedResult>) end;

  JBizcardResultParserClass = interface(JAbstractDoCoMoResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{31E291A5-5233-49E3-861C-F409B60EC6BE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBizcardResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/BizcardResultParser')]
  JBizcardResultParser = interface(JAbstractDoCoMoResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{0BC886FF-DA3E-4854-8C3A-9732D0CCA6E4}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JAddressBookParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
//    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJBizcardResultParser = class(TJavaGenericImport<JBizcardResultParserClass, JBizcardResultParser>) end;

  JBookmarkDoCoMoResultParserClass = interface(JAbstractDoCoMoResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{24F28BBD-7494-4152-9EB6-9D8F5911623C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBookmarkDoCoMoResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/BookmarkDoCoMoResultParser')]
  JBookmarkDoCoMoResultParser = interface(JAbstractDoCoMoResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{E899D462-3046-444E-8AD3-E6B77A92EC4A}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JURIParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;
//    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJBookmarkDoCoMoResultParser = class(TJavaGenericImport<JBookmarkDoCoMoResultParserClass, JBookmarkDoCoMoResultParser>) end;

  JCalendarParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{A8B99759-D27F-4EA8-AD54-28F2320759C1}']
    { static Property Methods }

    { static Methods }
    {class} function init(summary: JString; startString: JString; endString: JString; durationString: JString; location: JString; organizer: JString; attendees: TJavaObjectArray<JString>; description: JString; latitude: Double; P10: Double): JCalendarParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;DD)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/CalendarParsedResult')]
  JCalendarParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{9892B901-219C-4ECA-99E5-42EAFEB9CC36}']
    { Property Methods }

    { methods }
    function getSummary: JString; cdecl; //()Ljava/lang/String;
    function getStart: JDate; cdecl; //Deprecated //()Ljava/util/Date;
    function getStartTimestamp: Int64; cdecl; //()J
    function isStartAllDay: Boolean; cdecl; //()Z
    function getEnd: JDate; cdecl; //Deprecated //()Ljava/util/Date;
    function getEndTimestamp: Int64; cdecl; //()J
    function isEndAllDay: Boolean; cdecl; //()Z
    function getLocation: JString; cdecl; //()Ljava/lang/String;
    function getOrganizer: JString; cdecl; //()Ljava/lang/String;
    function getAttendees: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getDescription: JString; cdecl; //()Ljava/lang/String;
    function getLatitude: Double; cdecl; //()D
    function getLongitude: Double; cdecl; //()D
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCalendarParsedResult = class(TJavaGenericImport<JCalendarParsedResultClass, JCalendarParsedResult>) end;

  JEmailAddressParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{B35B2FFA-F0CE-4DDB-9660-3F6FA259ED8E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/EmailAddressParsedResult')]
  JEmailAddressParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{595016FA-DDF4-4E7A-AE52-D53EBD3CC92D}']
    { Property Methods }

    { methods }
    function getEmailAddress: JString; cdecl; //Deprecated //()Ljava/lang/String;
    function getTos: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getCCs: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getBCCs: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getSubject: JString; cdecl; //()Ljava/lang/String;
    function getBody: JString; cdecl; //()Ljava/lang/String;
    function getMailtoURI: JString; cdecl; //Deprecated //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJEmailAddressParsedResult = class(TJavaGenericImport<JEmailAddressParsedResultClass, JEmailAddressParsedResult>) end;

  JEmailAddressResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{DCA4CB7C-FE85-4348-BFD3-6161E791482B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEmailAddressResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/EmailAddressResultParser')]
  JEmailAddressResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{A9A13350-7D1B-49B3-A48A-2572EE5D6183}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JEmailAddressParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;
//    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJEmailAddressResultParser = class(TJavaGenericImport<JEmailAddressResultParserClass, JEmailAddressResultParser>) end;

  JEmailDoCoMoResultParserClass = interface(JAbstractDoCoMoResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{51240A93-6D36-44DA-8093-1C2712B94D31}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEmailDoCoMoResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/EmailDoCoMoResultParser')]
  JEmailDoCoMoResultParser = interface(JAbstractDoCoMoResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{13391678-2DCE-486A-ADDB-4F74EE3F1A92}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JEmailAddressParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJEmailDoCoMoResultParser = class(TJavaGenericImport<JEmailDoCoMoResultParserClass, JEmailDoCoMoResultParser>) end;

  JExpandedProductParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{1F856FB1-3D69-482A-B5D4-6A6388A27073}']
    { static Property Methods }
    {class} function _GetKILOGRAM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetPOUND: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init(rawText: JString; productID: JString; sscc: JString; lotNumber: JString; productionDate: JString; packagingDate: JString; bestBeforeDate: JString; expirationDate: JString; weight: JString; weightType: JString; weightIncrement: JString; price: JString; priceIncrement: JString; priceCurrency: JString; uncommonAIs: JMap): JExpandedProductParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    { static Property }
    {class} property KILOGRAM: JString read _GetKILOGRAM;
    {class} property POUND: JString read _GetPOUND;
  end;

  [JavaSignature('com/google/zxing/client/result/ExpandedProductParsedResult')]
  JExpandedProductParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{BB49C95F-94EB-4B4B-BC5D-598B98B6C703}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function getRawText: JString; cdecl; //()Ljava/lang/String;
    function getProductID: JString; cdecl; //()Ljava/lang/String;
    function getSscc: JString; cdecl; //()Ljava/lang/String;
    function getLotNumber: JString; cdecl; //()Ljava/lang/String;
    function getProductionDate: JString; cdecl; //()Ljava/lang/String;
    function getPackagingDate: JString; cdecl; //()Ljava/lang/String;
    function getBestBeforeDate: JString; cdecl; //()Ljava/lang/String;
    function getExpirationDate: JString; cdecl; //()Ljava/lang/String;
    function getWeight: JString; cdecl; //()Ljava/lang/String;
    function getWeightType: JString; cdecl; //()Ljava/lang/String;
    function getWeightIncrement: JString; cdecl; //()Ljava/lang/String;
    function getPrice: JString; cdecl; //()Ljava/lang/String;
    function getPriceIncrement: JString; cdecl; //()Ljava/lang/String;
    function getPriceCurrency: JString; cdecl; //()Ljava/lang/String;
    function getUncommonAIs: JMap; cdecl; //()Ljava/util/Map;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJExpandedProductParsedResult = class(TJavaGenericImport<JExpandedProductParsedResultClass, JExpandedProductParsedResult>) end;

  JExpandedProductResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{227FD36E-CE6C-46B8-B9C0-43B95962F5E9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JExpandedProductResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ExpandedProductResultParser')]
  JExpandedProductResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{D02CB4F3-4F61-4BE0-91E5-8CCADFD97ACA}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JExpandedProductParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ExpandedProductParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJExpandedProductResultParser = class(TJavaGenericImport<JExpandedProductResultParserClass, JExpandedProductResultParser>) end;

  JGeoParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{1B373EF2-F136-4C1B-AAE1-EB22D55C3C5C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/GeoParsedResult')]
  JGeoParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{F040FFFF-BCDB-4C05-8512-A6D9EBE42786}']
    { Property Methods }

    { methods }
    function getGeoURI: JString; cdecl; //()Ljava/lang/String;
    function getLatitude: Double; cdecl; //()D
    function getLongitude: Double; cdecl; //()D
    function getAltitude: Double; cdecl; //()D
    function getQuery: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJGeoParsedResult = class(TJavaGenericImport<JGeoParsedResultClass, JGeoParsedResult>) end;

  JGeoResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{F4A127CD-B26D-43FB-B369-9725FC771F6C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGeoResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/GeoResultParser')]
  JGeoResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{48D39BA9-FE98-44B0-BB6F-D2B84C444E22}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JGeoParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/GeoParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJGeoResultParser = class(TJavaGenericImport<JGeoResultParserClass, JGeoResultParser>) end;

  JISBNParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{29021CAB-F37C-450B-AC1D-681295FDFDC2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ISBNParsedResult')]
  JISBNParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{F682FCAC-6103-41FF-9548-5DE049941E37}']
    { Property Methods }

    { methods }
    function getISBN: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJISBNParsedResult = class(TJavaGenericImport<JISBNParsedResultClass, JISBNParsedResult>) end;

  JISBNResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{CB56508A-BA19-43F6-9B32-4A6818997305}']
    { static Property Methods }

    { static Methods }
    {class} function init: JISBNResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ISBNResultParser')]
  JISBNResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{81F5A9A9-48D7-4611-95B1-B11B31D08F4E}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JISBNParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ISBNParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJISBNResultParser = class(TJavaGenericImport<JISBNResultParserClass, JISBNResultParser>) end;


  JParsedResultTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{92B378BE-92E7-4759-9399-943299E21C1C}']
    { static Property Methods }
    {class} function _GetADDRESSBOOK: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetEMAIL_ADDRESS: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetPRODUCT: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetURI: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetTEXT: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetGEO: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetTEL: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetSMS: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetCALENDAR: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetWIFI: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetISBN: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;
    {class} function _GetVIN: JParsedResultType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/client/result/ParsedResultType;

    { static Methods }
    {class} function values: TJavaObjectArray<JParsedResultType>; cdecl; //()[Lcom/google/zxing/client/result/ParsedResultType;
    {class} function valueOf(name: JString): JParsedResultType; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/client/result/ParsedResultType;

    { static Property }
    {class} property ADDRESSBOOK: JParsedResultType read _GetADDRESSBOOK;
    {class} property EMAIL_ADDRESS: JParsedResultType read _GetEMAIL_ADDRESS;
    {class} property PRODUCT: JParsedResultType read _GetPRODUCT;
    {class} property URI: JParsedResultType read _GetURI;
    {class} property TEXT: JParsedResultType read _GetTEXT;
    {class} property GEO: JParsedResultType read _GetGEO;
    {class} property TEL: JParsedResultType read _GetTEL;
    {class} property SMS: JParsedResultType read _GetSMS;
    {class} property CALENDAR: JParsedResultType read _GetCALENDAR;
    {class} property WIFI: JParsedResultType read _GetWIFI;
    {class} property ISBN: JParsedResultType read _GetISBN;
    {class} property VIN: JParsedResultType read _GetVIN;
  end;

  [JavaSignature('com/google/zxing/client/result/ParsedResultType')]
  JParsedResultType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{3AB89177-B004-4640-8FBE-343C6382412A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJParsedResultType = class(TJavaGenericImport<JParsedResultTypeClass, JParsedResultType>) end;

  JProductParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{34357164-A854-4005-9DEE-B085712271F5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ProductParsedResult')]
  JProductParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{0D1162B4-5DB1-4C7B-8C8B-A08DFD7D5C82}']
    { Property Methods }

    { methods }
    function getProductID: JString; cdecl; //()Ljava/lang/String;
    function getNormalizedProductID: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJProductParsedResult = class(TJavaGenericImport<JProductParsedResultClass, JProductParsedResult>) end;

  JProductResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{4D53E400-1E7B-41AF-9D4A-C0B0774AFBA0}']
    { static Property Methods }

    { static Methods }
    {class} function init: JProductResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ProductResultParser')]
  JProductResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{ABEEA470-2719-43A8-B481-AA6D58CBF95F}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JProductParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ProductParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJProductResultParser = class(TJavaGenericImport<JProductResultParserClass, JProductResultParser>) end;

  JSMSMMSResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{38BE829F-A806-49A9-8998-5A1882CFCCB4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSMSMMSResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/SMSMMSResultParser')]
  JSMSMMSResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{0F6E7A64-697D-4D95-AFFD-25C2FF59755C}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JSMSParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/SMSParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJSMSMMSResultParser = class(TJavaGenericImport<JSMSMMSResultParserClass, JSMSMMSResultParser>) end;

  JSMSParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{87324C6E-3FEC-47EA-A91B-3BAF40C6BDBF}']
    { static Property Methods }

    { static Methods }
    {class} function init(number: JString; via: JString; subject: JString; body: JString): JSMSParsedResult; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    {class} function init(numbers: TJavaObjectArray<JString>; vias: TJavaObjectArray<JString>; subject: JString; body: JString): JSMSParsedResult; cdecl; overload; //([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/SMSParsedResult')]
  JSMSParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{68FAFB4E-A87F-41BA-AC4D-230AA3339315}']
    { Property Methods }

    { methods }
    function getSMSURI: JString; cdecl; //()Ljava/lang/String;
    function getNumbers: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getVias: TJavaObjectArray<JString>; cdecl; //()[Ljava/lang/String;
    function getSubject: JString; cdecl; //()Ljava/lang/String;
    function getBody: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJSMSParsedResult = class(TJavaGenericImport<JSMSParsedResultClass, JSMSParsedResult>) end;

  JSMSTOMMSTOResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{49D6BF1F-7A7E-48AB-BD26-56EDBEF9A125}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSMSTOMMSTOResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/SMSTOMMSTOResultParser')]
  JSMSTOMMSTOResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{16BAEA63-8CBC-4D8E-952F-0C2C6AA5D49B}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JSMSParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/SMSParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJSMSTOMMSTOResultParser = class(TJavaGenericImport<JSMSTOMMSTOResultParserClass, JSMSTOMMSTOResultParser>) end;

  JSMTPResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{F13D9E07-5C50-43D4-BA33-D7218D802C57}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSMTPResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/SMTPResultParser')]
  JSMTPResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{E3C0244B-C55C-4A01-97A2-E746AE6B80F0}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JEmailAddressParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJSMTPResultParser = class(TJavaGenericImport<JSMTPResultParserClass, JSMTPResultParser>) end;

  JTelParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{44C25D3F-FD9D-42BD-8693-6828E8B30088}']
    { static Property Methods }

    { static Methods }
    {class} function init(number: JString; telURI: JString; title: JString): JTelParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/TelParsedResult')]
  JTelParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{7BEEF812-9338-4E97-B1D6-040CF837BFF4}']
    { Property Methods }

    { methods }
    function getNumber: JString; cdecl; //()Ljava/lang/String;
    function getTelURI: JString; cdecl; //()Ljava/lang/String;
    function getTitle: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJTelParsedResult = class(TJavaGenericImport<JTelParsedResultClass, JTelParsedResult>) end;

  JTelResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{646CA104-77DE-4D0A-9AFE-6E138132415D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTelResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/TelResultParser')]
  JTelResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{AF099D72-515D-4469-BD3A-154CEE469D43}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JTelParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/TelParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJTelResultParser = class(TJavaGenericImport<JTelResultParserClass, JTelResultParser>) end;

  JTextParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{BA3093FD-C13F-4C41-89B4-AB7B70AD8A52}']
    { static Property Methods }

    { static Methods }
    {class} function init(text: JString; language: JString): JTextParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/TextParsedResult')]
  JTextParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{C539AEDA-8E70-4732-8366-23970DE5683B}']
    { Property Methods }

    { methods }
    function getText: JString; cdecl; //()Ljava/lang/String;
    function getLanguage: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJTextParsedResult = class(TJavaGenericImport<JTextParsedResultClass, JTextParsedResult>) end;

  JURIParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{2F7AA764-92FA-4F9E-9D7F-991310CA3BBF}']
    { static Property Methods }

    { static Methods }
    {class} function init(uri: JString; title: JString): JURIParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/URIParsedResult')]
  JURIParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{4E127170-FDC0-4D0E-A514-DF046A1CD2FE}']
    { Property Methods }

    { methods }
    function getURI: JString; cdecl; //()Ljava/lang/String;
    function getTitle: JString; cdecl; //()Ljava/lang/String;
    function isPossiblyMaliciousURI: Boolean; cdecl; //Deprecated //()Z
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJURIParsedResult = class(TJavaGenericImport<JURIParsedResultClass, JURIParsedResult>) end;

  JURIResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{9DF0FBBC-9954-4CF6-B9DE-0EAD3E8AFB35}']
    { static Property Methods }

    { static Methods }
    {class} function init: JURIResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/URIResultParser')]
  JURIResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{EAEC5850-E23B-4523-8EE8-1313F495813F}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JURIParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJURIResultParser = class(TJavaGenericImport<JURIResultParserClass, JURIResultParser>) end;

  JURLTOResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{B9443F89-57AA-43D3-AACC-B7C20377E4CC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JURLTOResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/URLTOResultParser')]
  JURLTOResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{CADE417C-31ED-499D-B342-3C2261AA587A}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JURIParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJURLTOResultParser = class(TJavaGenericImport<JURLTOResultParserClass, JURLTOResultParser>) end;

  JVCardResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{CD2D785C-DA38-4AF2-8E66-0055704E0446}']
    { static Property Methods }

    { static Methods }
    {class} function init: JVCardResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/VCardResultParser')]
  JVCardResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{6B8E7BC9-E72C-4144-995B-22028F8E63AC}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JAddressBookParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJVCardResultParser = class(TJavaGenericImport<JVCardResultParserClass, JVCardResultParser>) end;

  JVEventResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{6A867927-AFAA-45B4-8443-E732BBFE5337}']
    { static Property Methods }

    { static Methods }
    {class} function init: JVEventResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/VEventResultParser')]
  JVEventResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{11DDF3E6-4E61-46F6-8E11-CEE2E21D04CC}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JCalendarParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/CalendarParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJVEventResultParser = class(TJavaGenericImport<JVEventResultParserClass, JVEventResultParser>) end;

  JVINParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{EC104404-E03F-4BB4-A229-F23894D53684}']
    { static Property Methods }

    { static Methods }
    {class} function init(vin: JString; worldManufacturerID: JString; vehicleDescriptorSection: JString; vehicleIdentifierSection: JString; countryCode: JString; vehicleAttributes: JString; modelYear: Integer; plantCode: Char; sequentialNumber: JString): JVINParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ICLjava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/VINParsedResult')]
  JVINParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{C14C122D-3D91-448F-8B3F-D25F97DB88D6}']
    { Property Methods }

    { methods }
    function getVIN: JString; cdecl; //()Ljava/lang/String;
    function getWorldManufacturerID: JString; cdecl; //()Ljava/lang/String;
    function getVehicleDescriptorSection: JString; cdecl; //()Ljava/lang/String;
    function getVehicleIdentifierSection: JString; cdecl; //()Ljava/lang/String;
    function getCountryCode: JString; cdecl; //()Ljava/lang/String;
    function getVehicleAttributes: JString; cdecl; //()Ljava/lang/String;
    function getModelYear: Integer; cdecl; //()I
    function getPlantCode: Char; cdecl; //()C
    function getSequentialNumber: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJVINParsedResult = class(TJavaGenericImport<JVINParsedResultClass, JVINParsedResult>) end;

  JVINResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{2C02969D-04FF-4E81-B9B2-D9E422685622}']
    { static Property Methods }

    { static Methods }
    {class} function init: JVINResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/VINResultParser')]
  JVINResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{5F275C5A-2001-409B-B548-EC47339E0023}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JVINParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/VINParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJVINResultParser = class(TJavaGenericImport<JVINResultParserClass, JVINResultParser>) end;

  JWifiParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{E1B90D51-252A-498E-B3C5-C37396CCDD3D}']
    { static Property Methods }

    { static Methods }
    {class} function init(networkEncryption: JString; ssid: JString; password: JString): JWifiParsedResult; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    {class} function init(networkEncryption: JString; ssid: JString; password: JString; hidden: Boolean): JWifiParsedResult; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    {class} function init(networkEncryption: JString; ssid: JString; password: JString; hidden: Boolean; identity: JString; anonymousIdentity: JString; eapMethod: JString; phase2Method: JString): JWifiParsedResult; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/WifiParsedResult')]
  JWifiParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{EAB4C530-F0BC-4AF2-B27E-61F60C8C8DF6}']
    { Property Methods }

    { methods }
    function getSsid: JString; cdecl; //()Ljava/lang/String;
    function getNetworkEncryption: JString; cdecl; //()Ljava/lang/String;
    function getPassword: JString; cdecl; //()Ljava/lang/String;
    function isHidden: Boolean; cdecl; //()Z
    function getIdentity: JString; cdecl; //()Ljava/lang/String;
    function getAnonymousIdentity: JString; cdecl; //()Ljava/lang/String;
    function getEapMethod: JString; cdecl; //()Ljava/lang/String;
    function getPhase2Method: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJWifiParsedResult = class(TJavaGenericImport<JWifiParsedResultClass, JWifiParsedResult>) end;

  JWifiResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{481AC32A-14D2-4213-9CDD-71DCB8925BDE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWifiResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/WifiResultParser')]
  JWifiResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{104908A2-16DE-464A-BD12-E49814BDF90D}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JWifiParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/WifiParsedResult;
    //function parse(this: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJWifiResultParser = class(TJavaGenericImport<JWifiResultParserClass, JWifiResultParser>) end;

  JBitArrayClass = interface(JObjectClass)
  ['{2F2EFD27-8E2F-4B31-8296-4EE47F48F514}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitArray; cdecl; overload; //()V
    {class} function init(size: Integer): JBitArray; cdecl; overload; //(I)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/BitArray')]
  JBitArray = interface(JObject)
  ['{CBB0434E-2822-4069-B30D-F8C094BFC5EE}']
    { Property Methods }

    { methods }
    function getSize: Integer; cdecl; //()I
    function getSizeInBytes: Integer; cdecl; //()I
    function get(i: Integer): Boolean; cdecl; //(I)Z
    procedure &set(i: Integer); cdecl; //(I)V
    procedure flip(i: Integer); cdecl; //(I)V
    function getNextSet(from: Integer): Integer; cdecl; //(I)I
    function getNextUnset(from: Integer): Integer; cdecl; //(I)I
    procedure setBulk(i: Integer; newBits: Integer); cdecl; //(II)V
    procedure setRange(start: Integer; aend: Integer); cdecl; //(II)V
    procedure clear; cdecl; //()V
    function isRange(start: Integer; aend: Integer; value: Boolean): Boolean; cdecl; //(IIZ)Z
    procedure appendBit(bit: Boolean); cdecl; //(Z)V
    procedure appendBits(value: Integer; numBits: Integer); cdecl; //(II)V
    procedure appendBitArray(other: JBitArray); cdecl; //(Lcom/google/zxing/common/BitArray;)V
    procedure &xor(other: JBitArray); cdecl; //(Lcom/google/zxing/common/BitArray;)V
    procedure toBytes(bitOffset: Integer; aarray: TJavaArray<Byte>; offset: Integer; numBytes: Integer); cdecl; //(I[BII)V
    function getBitArray: TJavaArray<Integer>; cdecl; //()[I
    procedure reverse; cdecl; //()V
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;
    function clone: JBitArray; cdecl; overload; //()Lcom/google/zxing/common/BitArray;
//    //function clone: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJBitArray = class(TJavaGenericImport<JBitArrayClass, JBitArray>) end;

  JBitMatrixClass = interface(JObjectClass)
  ['{FAE90640-55FD-4693-8CF4-8CE52B07CF51}']
    { static Property Methods }

    { static Methods }
    {class} function init(dimension: Integer): JBitMatrix; cdecl; overload; //(I)V
    {class} function init(width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(II)V
    {class} function parse(image: TJavaArray<Boolean>): JBitMatrix; cdecl; overload; //([[Z)Lcom/google/zxing/common/BitMatrix;
    {class} function parse(stringRepresentation: JString; setString: JString; unsetString: JString): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/common/BitMatrix;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/BitMatrix')]
  JBitMatrix = interface(JObject)
  ['{E20F875A-219E-4488-9720-2E195C5AD867}']
    { Property Methods }

    { methods }
    function get(x: Integer; y: Integer): Boolean; cdecl; //(II)Z
    procedure &set(x: Integer; y: Integer); cdecl; //(II)V
    procedure unset(x: Integer; y: Integer); cdecl; //(II)V
    procedure flip(x: Integer; y: Integer); cdecl; //(II)V
    procedure &xor(mask: JBitMatrix); cdecl; //(Lcom/google/zxing/common/BitMatrix;)V
    procedure clear; cdecl; //()V
    procedure setRegion(left: Integer; top: Integer; width: Integer; height: Integer); cdecl; //(IIII)V
    function getRow(y: Integer; row: JBitArray): JBitArray; cdecl; //(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;
    procedure setRow(y: Integer; row: JBitArray); cdecl; //(ILcom/google/zxing/common/BitArray;)V
    procedure rotate180; cdecl; //()V
    function getEnclosingRectangle: TJavaArray<Integer>; cdecl; //()[I
    function getTopLeftOnBit: TJavaArray<Integer>; cdecl; //()[I
    function getBottomRightOnBit: TJavaArray<Integer>; cdecl; //()[I
    function getWidth: Integer; cdecl; //()I
    function getHeight: Integer; cdecl; //()I
    function getRowSize: Integer; cdecl; //()I
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; overload; //()Ljava/lang/String;
    function toString(setString: JString; unsetString: JString): JString; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    function toString(setString: JString; unsetString: JString; lineSeparator: JString): JString; cdecl; overload; //Deprecated //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    function clone: JBitMatrix; cdecl; overload; //()Lcom/google/zxing/common/BitMatrix;
    //function clone: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJBitMatrix = class(TJavaGenericImport<JBitMatrixClass, JBitMatrix>) end;

  JBitSourceClass = interface(JObjectClass)
  ['{95D12D2C-7D8C-4EC9-A2FF-53EA65B5E515}']
    { static Property Methods }

    { static Methods }
    {class} function init(bytes: TJavaArray<Byte>): JBitSource; cdecl; //([B)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/BitSource')]
  JBitSource = interface(JObject)
  ['{66C94B08-6BA1-42A6-90F9-17C1DAEABF1C}']
    { Property Methods }

    { methods }
    function getBitOffset: Integer; cdecl; //()I
    function getByteOffset: Integer; cdecl; //()I
    function readBits(numBits: Integer): Integer; cdecl; //(I)I
    function available: Integer; cdecl; //()I

    { Property }
  end;

  TJBitSource = class(TJavaGenericImport<JBitSourceClass, JBitSource>) end;

  JCharacterSetECIClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{CF3B68E0-F11F-4E69-B249-34BD8EE2B1EE}']
    { static Property Methods }
    {class} function _GetCp437: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_1: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_2: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_3: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_4: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_5: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_6: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_7: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_8: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_9: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_10: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_11: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_13: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_14: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_15: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetISO8859_16: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetSJIS: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetCp1250: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetCp1251: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetCp1252: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetCp1256: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetUnicodeBigUnmarked: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetUTF8: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetASCII: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetBig5: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetGB18030: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;
    {class} function _GetEUC_KR: JCharacterSetECI;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/CharacterSetECI;

    { static Methods }
    {class} function values: TJavaObjectArray<JCharacterSetECI>; cdecl; //()[Lcom/google/zxing/common/CharacterSetECI;
    {class} function valueOf(name: JString): JCharacterSetECI; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/common/CharacterSetECI;
    {class} function getCharacterSetECIByValue(value: Integer): JCharacterSetECI; cdecl; //(I)Lcom/google/zxing/common/CharacterSetECI;
    {class} function getCharacterSetECIByName(name: JString): JCharacterSetECI; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/common/CharacterSetECI;

    { static Property }
    {class} property Cp437: JCharacterSetECI read _GetCp437;
    {class} property ISO8859_1: JCharacterSetECI read _GetISO8859_1;
    {class} property ISO8859_2: JCharacterSetECI read _GetISO8859_2;
    {class} property ISO8859_3: JCharacterSetECI read _GetISO8859_3;
    {class} property ISO8859_4: JCharacterSetECI read _GetISO8859_4;
    {class} property ISO8859_5: JCharacterSetECI read _GetISO8859_5;
    {class} property ISO8859_6: JCharacterSetECI read _GetISO8859_6;
    {class} property ISO8859_7: JCharacterSetECI read _GetISO8859_7;
    {class} property ISO8859_8: JCharacterSetECI read _GetISO8859_8;
    {class} property ISO8859_9: JCharacterSetECI read _GetISO8859_9;
    {class} property ISO8859_10: JCharacterSetECI read _GetISO8859_10;
    {class} property ISO8859_11: JCharacterSetECI read _GetISO8859_11;
    {class} property ISO8859_13: JCharacterSetECI read _GetISO8859_13;
    {class} property ISO8859_14: JCharacterSetECI read _GetISO8859_14;
    {class} property ISO8859_15: JCharacterSetECI read _GetISO8859_15;
    {class} property ISO8859_16: JCharacterSetECI read _GetISO8859_16;
    {class} property SJIS: JCharacterSetECI read _GetSJIS;
    {class} property Cp1250: JCharacterSetECI read _GetCp1250;
    {class} property Cp1251: JCharacterSetECI read _GetCp1251;
    {class} property Cp1252: JCharacterSetECI read _GetCp1252;
    {class} property Cp1256: JCharacterSetECI read _GetCp1256;
    {class} property UnicodeBigUnmarked: JCharacterSetECI read _GetUnicodeBigUnmarked;
    {class} property UTF8: JCharacterSetECI read _GetUTF8;
    {class} property ASCII: JCharacterSetECI read _GetASCII;
    {class} property Big5: JCharacterSetECI read _GetBig5;
    {class} property GB18030: JCharacterSetECI read _GetGB18030;
    {class} property EUC_KR: JCharacterSetECI read _GetEUC_KR;
  end;

  [JavaSignature('com/google/zxing/common/CharacterSetECI')]
  JCharacterSetECI = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{9856B516-4DFF-4B97-8D41-58C464C06D33}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJCharacterSetECI = class(TJavaGenericImport<JCharacterSetECIClass, JCharacterSetECI>) end;

  JDecoderResultClass = interface(JObjectClass)
  ['{183CB3DF-7AFB-4D4B-9A93-C9CADCBC5BEB}']
    { static Property Methods }

    { static Methods }
    {class} function init(rawBytes: TJavaArray<Byte>; text: JString; byteSegments: JList; P4: JString): JDecoderResult; cdecl; overload; //([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    {class} function init(rawBytes: TJavaArray<Byte>; text: JString; byteSegments: JList; P4: JString; saSequence: Integer; saParity: Integer): JDecoderResult; cdecl; overload; //([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;II)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/DecoderResult')]
  JDecoderResult = interface(JObject)
  ['{611B0405-E5D4-4F96-9840-CA27E5C4603A}']
    { Property Methods }

    { methods }
    function getRawBytes: TJavaArray<Byte>; cdecl; //()[B
    function getNumBits: Integer; cdecl; //()I
    procedure setNumBits(numBits: Integer); cdecl; //(I)V
    function getText: JString; cdecl; //()Ljava/lang/String;
    function getByteSegments: JList; cdecl; //()Ljava/util/List;
    function getECLevel: JString; cdecl; //()Ljava/lang/String;
    function getErrorsCorrected: JInteger; cdecl; //()Ljava/lang/Integer;
    procedure setErrorsCorrected(errorsCorrected: JInteger); cdecl; //(Ljava/lang/Integer;)V
    function getErasures: JInteger; cdecl; //()Ljava/lang/Integer;
    procedure setErasures(erasures: JInteger); cdecl; //(Ljava/lang/Integer;)V
    function getOther: JObject; cdecl; //()Ljava/lang/Object;
    procedure setOther(other: JObject); cdecl; //(Ljava/lang/Object;)V
    function hasStructuredAppend: Boolean; cdecl; //()Z
    function getStructuredAppendParity: Integer; cdecl; //()I
    function getStructuredAppendSequenceNumber: Integer; cdecl; //()I

    { Property }
  end;

  TJDecoderResult = class(TJavaGenericImport<JDecoderResultClass, JDecoderResult>) end;




  JGridSamplerClass = interface(JObjectClass)
  ['{7D2C77E9-2C9E-4547-917A-B284E5DD6753}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGridSampler; cdecl; //()V
    {class} procedure setGridSampler(newGridSampler: JGridSampler); cdecl; //(Lcom/google/zxing/common/GridSampler;)V
    {class} function getInstance: JGridSampler; cdecl; //()Lcom/google/zxing/common/GridSampler;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/GridSampler')]
  JGridSampler = interface(JObject)
  ['{BE501616-8369-40A5-8548-5FA9D40D04EE}']
    { Property Methods }

    { methods }
    function sampleGrid(P1: JBitMatrix; P2: Integer; P3: Integer; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single; P17: Single; P18: Single; P19: Single): JBitMatrix; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;
    function sampleGrid(P1: JBitMatrix; P2: Integer; P3: Integer; P4: JPerspectiveTransform): JBitMatrix; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJGridSampler = class(TJavaGenericImport<JGridSamplerClass, JGridSampler>) end;





  JDefaultGridSamplerClass = interface(JGridSamplerClass) // or JObjectClass // SuperSignature: com/google/zxing/common/GridSampler
  ['{6B1CE508-0F06-4050-8567-8FD4132F2768}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDefaultGridSampler; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/DefaultGridSampler')]
  JDefaultGridSampler = interface(JGridSampler) // or JObject // SuperSignature: com/google/zxing/common/GridSampler
  ['{7EE80D47-257F-44DD-919B-D418DA4EFD4C}']
    { Property Methods }

    { methods }
    function sampleGrid(image: JBitMatrix; dimensionX: Integer; dimensionY: Integer; p1ToX: Single; p1ToY: Single; p2ToX: Single; p2ToY: Single; p3ToX: Single; p3ToY: Single; p4ToX: Single; p4ToY: Single; p1FromX: Single; p1FromY: Single; p2FromX: Single; p2FromY: Single; p3FromX: Single; p3FromY: Single; p4FromX: Single; p4FromY: Single): JBitMatrix; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;
    function sampleGrid(image: JBitMatrix; dimensionX: Integer; dimensionY: Integer; transform: JPerspectiveTransform): JBitMatrix; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJDefaultGridSampler = class(TJavaGenericImport<JDefaultGridSamplerClass, JDefaultGridSampler>) end;

  JMathUtilsClass = interface(JObjectClass)
  ['{7053012F-6629-45A0-9E6D-F9877B354E5B}']
    { static Property Methods }

    { static Methods }
    {class} function round(d: Single): Integer; cdecl; //(F)I
    {class} function distance(aX: Single; aY: Single; bX: Single; bY: Single): Single; cdecl; overload; //(FFFF)F
    {class} function distance(aX: Integer; aY: Integer; bX: Integer; bY: Integer): Single; cdecl; overload; //(IIII)F
    {class} function sum(aarray: TJavaArray<Integer>): Integer; cdecl; //([I)I

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/detector/MathUtils')]
  JMathUtils = interface(JObject)
  ['{147E7717-F674-4A80-9DF6-7EEEF6D85F7F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMathUtils = class(TJavaGenericImport<JMathUtilsClass, JMathUtils>) end;

  JMonochromeRectangleDetectorClass = interface(JObjectClass)
  ['{2E21F777-31F3-4CAE-8127-C67EB6E5E560}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JMonochromeRectangleDetector; cdecl; //(Lcom/google/zxing/common/BitMatrix;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/detector/MonochromeRectangleDetector')]
  JMonochromeRectangleDetector = interface(JObject)
  ['{B87450FA-017E-4607-AE67-C9D1AE678962}']
    { Property Methods }

    { methods }
    function detect: TJavaObjectArray<JResultPoint>; cdecl; //()[Lcom/google/zxing/ResultPoint;

    { Property }
  end;

  TJMonochromeRectangleDetector = class(TJavaGenericImport<JMonochromeRectangleDetectorClass, JMonochromeRectangleDetector>) end;

  JWhiteRectangleDetectorClass = interface(JObjectClass)
  ['{C229148A-BA30-47DD-8559-0280D5CFFC48}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JWhiteRectangleDetector; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;)V
    {class} function init(image: JBitMatrix; initSize: Integer; x: Integer; y: Integer): JWhiteRectangleDetector; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;III)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/detector/WhiteRectangleDetector')]
  JWhiteRectangleDetector = interface(JObject)
  ['{DA8F6CBF-EF87-4174-8C7B-8C1B20B2C9DB}']
    { Property Methods }

    { methods }
    function detect: TJavaObjectArray<JResultPoint>; cdecl; //()[Lcom/google/zxing/ResultPoint;

    { Property }
  end;

  TJWhiteRectangleDetector = class(TJavaGenericImport<JWhiteRectangleDetectorClass, JWhiteRectangleDetector>) end;


  JGlobalHistogramBinarizerClass = interface(JBinarizerClass) // or JObjectClass // SuperSignature: com/google/zxing/Binarizer
  ['{3D2D4F60-EC71-494F-BAB7-DA8D5AF743E4}']
    { static Property Methods }

    { static Methods }
    {class} function init(source: JLuminanceSource): JGlobalHistogramBinarizer; cdecl; //(Lcom/google/zxing/LuminanceSource;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/GlobalHistogramBinarizer')]
  JGlobalHistogramBinarizer = interface(JBinarizer) // or JObject // SuperSignature: com/google/zxing/Binarizer
  ['{5ECC8CFA-C22A-44D3-900B-221EC50EBCE8}']
    { Property Methods }

    { methods }
    function getBlackRow(y: Integer; row: JBitArray): JBitArray; cdecl; //(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;
    function getBlackMatrix: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    function createBinarizer(source: JLuminanceSource): JBinarizer; cdecl; //(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Binarizer;

    { Property }
  end;

  TJGlobalHistogramBinarizer = class(TJavaGenericImport<JGlobalHistogramBinarizerClass, JGlobalHistogramBinarizer>) end;

  JHybridBinarizerClass = interface(JGlobalHistogramBinarizerClass) // or JObjectClass // SuperSignature: com/google/zxing/common/GlobalHistogramBinarizer
  ['{5A41F8EC-AC10-444C-98AF-779794006227}']
    { static Property Methods }

    { static Methods }
    {class} function init(source: JLuminanceSource): JHybridBinarizer; cdecl; //(Lcom/google/zxing/LuminanceSource;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/HybridBinarizer')]
  JHybridBinarizer = interface(JGlobalHistogramBinarizer) // or JObject // SuperSignature: com/google/zxing/common/GlobalHistogramBinarizer
  ['{A36A6B6B-3F88-4930-8766-78A85357A72F}']
    { Property Methods }

    { methods }
    function getBlackMatrix: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    function createBinarizer(source: JLuminanceSource): JBinarizer; cdecl; //(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Binarizer;

    { Property }
  end;

  TJHybridBinarizer = class(TJavaGenericImport<JHybridBinarizerClass, JHybridBinarizer>) end;

  JPerspectiveTransformClass = interface(JObjectClass)
  ['{63DBEF4A-B98F-4A56-9E06-85AA2BC08624}']
    { static Property Methods }

    { static Methods }
    {class} function quadrilateralToQuadrilateral(x0: Single; y0: Single; x1: Single; y1: Single; x2: Single; y2: Single; x3: Single; y3: Single; x0p: Single; y0p: Single; x1p: Single; y1p: Single; x2p: Single; y2p: Single; x3p: Single; y3p: Single): JPerspectiveTransform; cdecl; //(FFFFFFFFFFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;
    {class} function squareToQuadrilateral(x0: Single; y0: Single; x1: Single; y1: Single; x2: Single; y2: Single; x3: Single; y3: Single): JPerspectiveTransform; cdecl; //(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;
    {class} function quadrilateralToSquare(x0: Single; y0: Single; x1: Single; y1: Single; x2: Single; y2: Single; x3: Single; y3: Single): JPerspectiveTransform; cdecl; //(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/PerspectiveTransform')]
  JPerspectiveTransform = interface(JObject)
  ['{948FF2D4-1DE1-4D4C-A5A3-59F86E0CD848}']
    { Property Methods }

    { methods }
    procedure transformPoints(points: TJavaArray<Single>); cdecl; overload; //([F)V
    procedure transformPoints(xValues: TJavaArray<Single>; yValues: TJavaArray<Single>); cdecl; overload; //([F[F)V

    { Property }
  end;

  TJPerspectiveTransform = class(TJavaGenericImport<JPerspectiveTransformClass, JPerspectiveTransform>) end;

  JGenericGFClass = interface(JObjectClass)
  ['{8875B54E-02DC-4398-91EE-78D18B120B75}']
    { static Property Methods }
    {class} function _GetAZTEC_DATA_12: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/reedsolomon/GenericGF;
    {class} function _GetAZTEC_DATA_10: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/reedsolomon/GenericGF;
    {class} function _GetAZTEC_DATA_6: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/reedsolomon/GenericGF;
    {class} function _GetAZTEC_PARAM: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/reedsolomon/GenericGF;
    {class} function _GetQR_CODE_FIELD_256: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/reedsolomon/GenericGF;
    {class} function _GetDATA_MATRIX_FIELD_256: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/reedsolomon/GenericGF;
    {class} function _GetAZTEC_DATA_8: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/reedsolomon/GenericGF;
    {class} function _GetMAXICODE_FIELD_64: JGenericGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/common/reedsolomon/GenericGF;

    { static Methods }
    {class} function init(primitive: Integer; size: Integer; b: Integer): JGenericGF; cdecl; //(III)V

    { static Property }
    {class} property AZTEC_DATA_12: JGenericGF read _GetAZTEC_DATA_12;
    {class} property AZTEC_DATA_10: JGenericGF read _GetAZTEC_DATA_10;
    {class} property AZTEC_DATA_6: JGenericGF read _GetAZTEC_DATA_6;
    {class} property AZTEC_PARAM: JGenericGF read _GetAZTEC_PARAM;
    {class} property QR_CODE_FIELD_256: JGenericGF read _GetQR_CODE_FIELD_256;
    {class} property DATA_MATRIX_FIELD_256: JGenericGF read _GetDATA_MATRIX_FIELD_256;
    {class} property AZTEC_DATA_8: JGenericGF read _GetAZTEC_DATA_8;
    {class} property MAXICODE_FIELD_64: JGenericGF read _GetMAXICODE_FIELD_64;
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/GenericGF')]
  JGenericGF = interface(JObject)
  ['{53C051A5-B188-4B33-8A33-6EC5A36618C9}']
    { Property Methods }

    { methods }
    function getSize: Integer; cdecl; //()I
    function getGeneratorBase: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJGenericGF = class(TJavaGenericImport<JGenericGFClass, JGenericGF>) end;

  JGenericGFPolyClass = interface(JObjectClass)
  ['{759A9F93-A85C-4FC8-ACCA-3C626890D135}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/GenericGFPoly')]
  JGenericGFPoly = interface(JObject)
  ['{DE478FB8-BEE7-4EAD-86B3-F4477A23C262}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJGenericGFPoly = class(TJavaGenericImport<JGenericGFPolyClass, JGenericGFPoly>) end;

  JReedSolomonDecoderClass = interface(JObjectClass)
  ['{A416617A-B8FF-41B5-98FC-5BE84A1C0E3A}']
    { static Property Methods }

    { static Methods }
    {class} function init(field: JGenericGF): JReedSolomonDecoder; cdecl; //(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/ReedSolomonDecoder')]
  JReedSolomonDecoder = interface(JObject)
  ['{10FCB689-F139-4258-A694-EABF4F9FC0BC}']
    { Property Methods }

    { methods }
    procedure decode(received: TJavaArray<Integer>; twoS: Integer); cdecl; //([II)V

    { Property }
  end;

  TJReedSolomonDecoder = class(TJavaGenericImport<JReedSolomonDecoderClass, JReedSolomonDecoder>) end;

  JReedSolomonEncoderClass = interface(JObjectClass)
  ['{1F07D7A1-C28F-44ED-8D00-3818ED270EE4}']
    { static Property Methods }

    { static Methods }
    {class} function init(field: JGenericGF): JReedSolomonEncoder; cdecl; //(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/ReedSolomonEncoder')]
  JReedSolomonEncoder = interface(JObject)
  ['{0C543084-48B9-4C79-8B92-20C5529684D8}']
    { Property Methods }

    { methods }
    procedure encode(toEncode: TJavaArray<Integer>; ecBytes: Integer); cdecl; //([II)V

    { Property }
  end;

  TJReedSolomonEncoder = class(TJavaGenericImport<JReedSolomonEncoderClass, JReedSolomonEncoder>) end;

  JReedSolomonExceptionClass = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
  ['{F21F9D9F-E51D-4A34-85D1-8F0C362D2E75}']
    { static Property Methods }

    { static Methods }
    {class} function init(amessage: JString): JReedSolomonException; cdecl; //(Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/ReedSolomonException')]
  JReedSolomonException = interface(JException) // or JObject // SuperSignature: java/lang/Exception
  ['{83608A73-98CE-47C9-BBA1-DDFA6A035C5D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReedSolomonException = class(TJavaGenericImport<JReedSolomonExceptionClass, JReedSolomonException>) end;

  JStringUtilsClass = interface(JObjectClass)
  ['{51DF49B9-795A-4E54-B04E-DC27FC2ECC89}']
    { static Property Methods }
    {class} function _GetSHIFT_JIS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetGB2312: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function guessEncoding(bytes: TJavaArray<Byte>; hints: JMap): JString; cdecl; //([BLjava/util/Map;)Ljava/lang/String;

    { static Property }
    {class} property SHIFT_JIS: JString read _GetSHIFT_JIS;
    {class} property GB2312: JString read _GetGB2312;
  end;

  [JavaSignature('com/google/zxing/common/StringUtils')]
  JStringUtils = interface(JObject)
  ['{E5E75616-F749-4513-A785-62563F26C280}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStringUtils = class(TJavaGenericImport<JStringUtilsClass, JStringUtils>) end;

  JDataMatrixReaderClass = interface(JObjectClass)
  ['{DF076F9C-2D50-46F1-ADA6-EF58294C8A9E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataMatrixReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/DataMatrixReader')]
  JDataMatrixReader = interface(JObject)
  ['{D91023E9-96D5-43FB-8E01-B9CA5D5AD729}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJDataMatrixReader = class(TJavaGenericImport<JDataMatrixReaderClass, JDataMatrixReader>) end;

  JDataMatrixWriterClass = interface(JObjectClass)
  ['{1A83550F-18D6-4925-A5CB-8F9A48F1E1D6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataMatrixWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/DataMatrixWriter')]
  JDataMatrixWriter = interface(JObject)
  ['{2E147BDE-0B3A-4FC5-AAAD-98B6EC33EDAE}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJDataMatrixWriter = class(TJavaGenericImport<JDataMatrixWriterClass, JDataMatrixWriter>) end;

  JBitMatrixParserClass = interface(JObjectClass)
  ['{A4607DA2-8812-4150-8DD2-21B1CBB23CEB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/BitMatrixParser')]
  JBitMatrixParser = interface(JObject)
  ['{A33C76AC-8B79-411D-B5FD-1B67D097017B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitMatrixParser = class(TJavaGenericImport<JBitMatrixParserClass, JBitMatrixParser>) end;

  JDataBlockClass = interface(JObjectClass)
  ['{756BD1F7-F69D-4317-91F3-6AA719F69453}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/DataBlock')]
  JDataBlock = interface(JObject)
  ['{D92E011D-F79F-48B6-8338-2CEFE6E6C2B4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataBlock = class(TJavaGenericImport<JDataBlockClass, JDataBlock>) end;

//  JDecodedBitStreamParser_1Class = interface(JObjectClass)
//  ['{872EC1D2-5F02-4098-9D0F-D2109FFB60AA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/datamatrix/decoder/DecodedBitStreamParser$1')]
//  JDecodedBitStreamParser_1 = interface(JObject)
//  ['{E4D73CDA-480B-40BD-8B2F-B7D50AC23B9D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_1 = class(TJavaGenericImport<JDecodedBitStreamParser_1Class, JDecodedBitStreamParser_1>) end;

  JDecodedBitStreamParser_ModeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{809026D7-C97E-4264-BBAF-1FC7A1FE0F96}']
    { static Property Methods }
    {class} function _GetPAD_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    {class} function _GetASCII_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    {class} function _GetC40_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    {class} function _GetTEXT_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    {class} function _GetANSIX12_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    {class} function _GetEDIFACT_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    {class} function _GetBASE256_ENCODE: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    { static Methods }
    {class} function values: TJavaObjectArray<JDecodedBitStreamParser_Mode>; cdecl; //()[Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    {class} function valueOf(name: JString): JDecodedBitStreamParser_Mode; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    { static Property }
    {class} property PAD_ENCODE: JDecodedBitStreamParser_Mode read _GetPAD_ENCODE;
    {class} property ASCII_ENCODE: JDecodedBitStreamParser_Mode read _GetASCII_ENCODE;
    {class} property C40_ENCODE: JDecodedBitStreamParser_Mode read _GetC40_ENCODE;
    {class} property TEXT_ENCODE: JDecodedBitStreamParser_Mode read _GetTEXT_ENCODE;
    {class} property ANSIX12_ENCODE: JDecodedBitStreamParser_Mode read _GetANSIX12_ENCODE;
    {class} property EDIFACT_ENCODE: JDecodedBitStreamParser_Mode read _GetEDIFACT_ENCODE;
    {class} property BASE256_ENCODE: JDecodedBitStreamParser_Mode read _GetBASE256_ENCODE;
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode')]
  JDecodedBitStreamParser_Mode = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{C4321353-D2EC-41DB-826D-716ED099BDE4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedBitStreamParser_Mode = class(TJavaGenericImport<JDecodedBitStreamParser_ModeClass, JDecodedBitStreamParser_Mode>) end;

  JDecodedBitStreamParserClass = interface(JObjectClass)
  ['{9E3AC6F2-0557-43E6-A90E-7AADDB63F1C3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/DecodedBitStreamParser')]
  JDecodedBitStreamParser = interface(JObject)
  ['{A7DA84B0-9142-4B8B-81DD-1AC9F5432AD3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedBitStreamParser = class(TJavaGenericImport<JDecodedBitStreamParserClass, JDecodedBitStreamParser>) end;

  JDecoder_084Class = interface(JObjectClass)
  ['{C7CE1EC1-7A4B-485B-AF60-D85530F64D9B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDecoder_084; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Decoder')]
  JDecoder_084 = interface(JObject)
  ['{E6370766-E022-4B2C-A97A-33990340C1C4}']
    { Property Methods }

    { methods }
    function decode(image: TJavaArray<Boolean>): JDecoderResult; cdecl; overload; //([[Z)Lcom/google/zxing/common/DecoderResult;
    function decode(bits: JBitMatrix): JDecoderResult; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;

    { Property }
  end;

  TJDecoder_084 = class(TJavaGenericImport<JDecoder_084Class, JDecoder_084>) end;

//  JVersion_1Class = interface(JObjectClass)
//  ['{D1703954-DEEB-46C9-93DF-3483BE6F814F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/datamatrix/decoder/Version$1')]
//  JVersion_1 = interface(JObject)
//  ['{AE5CFA4F-75A1-4C2A-A467-7B55B51FCB8E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJVersion_1 = class(TJavaGenericImport<JVersion_1Class, JVersion_1>) end;

  JVersion_ECBClass = interface(JObjectClass)
  ['{6EA140A4-E8D9-4372-B54F-ABE95DDE99E2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Version$ECB')]
  JVersion_ECB = interface(JObject)
  ['{095037F2-0483-43D8-89C5-73E6E516AA98}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVersion_ECB = class(TJavaGenericImport<JVersion_ECBClass, JVersion_ECB>) end;

  JVersion_ECBlocksClass = interface(JObjectClass)
  ['{4E31710F-A24C-43ED-B7B4-560CFC1E4FC5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Version$ECBlocks')]
  JVersion_ECBlocks = interface(JObject)
  ['{2884B17A-B5C2-446B-93CF-28618E3A0986}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVersion_ECBlocks = class(TJavaGenericImport<JVersion_ECBlocksClass, JVersion_ECBlocks>) end;

  JVersionClass = interface(JObjectClass)
  ['{4236CD79-68CC-4F46-85F1-5F932D684C50}']
    { static Property Methods }

    { static Methods }
    {class} function getVersionForDimensions(numRows: Integer; numColumns: Integer): JVersion; cdecl; //(II)Lcom/google/zxing/datamatrix/decoder/Version;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Version')]
  JVersion = interface(JObject)
  ['{B3ACDF14-495C-4F05-9915-9C260B72271B}']
    { Property Methods }

    { methods }
    function getVersionNumber: Integer; cdecl; //()I
    function getSymbolSizeRows: Integer; cdecl; //()I
    function getSymbolSizeColumns: Integer; cdecl; //()I
    function getDataRegionSizeRows: Integer; cdecl; //()I
    function getDataRegionSizeColumns: Integer; cdecl; //()I
    function getTotalCodewords: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJVersion = class(TJavaGenericImport<JVersionClass, JVersion>) end;

  JDetector_089Class = interface(JObjectClass)
  ['{5C5D83BC-D6D0-4A42-BD75-A328FCD347D8}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JDetector_089; cdecl; //(Lcom/google/zxing/common/BitMatrix;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/detector/Detector')]
  JDetector_089 = interface(JObject)
  ['{42D9FBD2-295A-4F0D-B9C5-BA8D1C0F3D72}']
    { Property Methods }

    { methods }
    function detect: JDetectorResult; cdecl; //()Lcom/google/zxing/common/DetectorResult;

    { Property }
  end;

  TJDetector_089 = class(TJavaGenericImport<JDetector_089Class, JDetector_089>) end;

  JASCIIEncoderClass = interface(JObjectClass)
  ['{D69F7BB7-9189-4094-B462-DEBA810E83F6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/ASCIIEncoder')]
  JASCIIEncoder = interface(JObject)
  ['{02EF6009-A502-4951-A04D-AC775DBB6129}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(context: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJASCIIEncoder = class(TJavaGenericImport<JASCIIEncoderClass, JASCIIEncoder>) end;

  JBase256EncoderClass = interface(JObjectClass)
  ['{EF99B800-3E44-4D73-9408-291C8265BF91}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/Base256Encoder')]
  JBase256Encoder = interface(JObject)
  ['{C8343CE1-4B15-4B96-9735-D4E689AE4FEE}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(context: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJBase256Encoder = class(TJavaGenericImport<JBase256EncoderClass, JBase256Encoder>) end;

  JC40EncoderClass = interface(JObjectClass)
  ['{DBCEA852-1011-49D5-8FAC-107BF112227F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/C40Encoder')]
  JC40Encoder = interface(JObject)
  ['{A2CD9827-9ADF-426F-82BB-84B59A7E406D}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(context: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJC40Encoder = class(TJavaGenericImport<JC40EncoderClass, JC40Encoder>) end;



  JSymbolInfoClass = interface(JObjectClass)
  ['{AD32AC61-59F3-4EF9-B5C0-BECBE5F95FE3}']
    { static Property Methods }

    { static Methods }
    {class} procedure overrideSymbolSet(aoverride: TJavaObjectArray<JSymbolInfo>); cdecl; //([Lcom/google/zxing/datamatrix/encoder/SymbolInfo;)V
    {class} function init(rectangular: Boolean; dataCapacity: Integer; errorCodewords: Integer; matrixWidth: Integer; matrixHeight: Integer; dataRegions: Integer): JSymbolInfo; cdecl; //(ZIIIII)V
    {class} function lookup(dataCodewords: Integer): JSymbolInfo; cdecl; overload; //(I)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    {class} function lookup(dataCodewords: Integer; shape: JSymbolShapeHint): JSymbolInfo; cdecl; overload; //(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    {class} function lookup(dataCodewords: Integer; allowRectangular: Boolean; fail: Boolean): JSymbolInfo; cdecl; overload; //(IZZ)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    {class} function lookup(dataCodewords: Integer; shape: JSymbolShapeHint; minSize: JDimension; maxSize: JDimension; fail: Boolean): JSymbolInfo; cdecl; overload; //(ILcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Lcom/google/zxing/Dimension;Lcom/google/zxing/Dimension;Z)Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/SymbolInfo')]
  JSymbolInfo = interface(JObject)
  ['{515098D8-30EC-41D2-9ED2-2FD6E62671FD}']
    { Property Methods }
    function _GetmatrixWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetmatrixWidth(amatrixWidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetmatrixHeight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetmatrixHeight(amatrixHeight: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }
    function getSymbolDataWidth: Integer; cdecl; //()I
    function getSymbolDataHeight: Integer; cdecl; //()I
    function getSymbolWidth: Integer; cdecl; //()I
    function getSymbolHeight: Integer; cdecl; //()I
    function getCodewordCount: Integer; cdecl; //()I
    function getInterleavedBlockCount: Integer; cdecl; //()I
    function getDataCapacity: Integer; cdecl; //()I
    function getErrorCodewords: Integer; cdecl; //()I
    function getDataLengthForInterleavedBlock(index: Integer): Integer; cdecl; //(I)I
    function getErrorLengthForInterleavedBlock(index: Integer): Integer; cdecl; //(I)I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
    property matrixWidth: Integer read _GetmatrixWidth write _SetmatrixWidth;
    property matrixHeight: Integer read _GetmatrixHeight write _SetmatrixHeight;
  end;

  TJSymbolInfo = class(TJavaGenericImport<JSymbolInfoClass, JSymbolInfo>) end;




  JDataMatrixSymbolInfo144Class = interface(JSymbolInfoClass) // or JObjectClass // SuperSignature: com/google/zxing/datamatrix/encoder/SymbolInfo
  ['{2EB9D908-BE10-4F4A-8F29-9C17C5C9F536}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/DataMatrixSymbolInfo144')]
  JDataMatrixSymbolInfo144 = interface(JSymbolInfo) // or JObject // SuperSignature: com/google/zxing/datamatrix/encoder/SymbolInfo
  ['{82C14374-90F7-453E-8CB4-5B9853936B4C}']
    { Property Methods }

    { methods }
    function getInterleavedBlockCount: Integer; cdecl; //()I
    function getDataLengthForInterleavedBlock(index: Integer): Integer; cdecl; //(I)I

    { Property }
  end;

  TJDataMatrixSymbolInfo144 = class(TJavaGenericImport<JDataMatrixSymbolInfo144Class, JDataMatrixSymbolInfo144>) end;

  JDefaultPlacementClass = interface(JObjectClass)
  ['{C9E7FD72-C13F-4FB2-B9AD-7CC7A8CFC288}']
    { static Property Methods }

    { static Methods }
    {class} function init(codewords: JCharSequence; numcols: Integer; numrows: Integer): JDefaultPlacement; cdecl; //(Ljava/lang/CharSequence;II)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/DefaultPlacement')]
  JDefaultPlacement = interface(JObject)
  ['{31785AF0-EA66-46B1-B845-97267C72914E}']
    { Property Methods }

    { methods }
    function getBit(col: Integer; row: Integer): Boolean; cdecl; //(II)Z
    procedure place; cdecl; //()V

    { Property }
  end;

  TJDefaultPlacement = class(TJavaGenericImport<JDefaultPlacementClass, JDefaultPlacement>) end;

  JEdifactEncoderClass = interface(JObjectClass)
  ['{4CFC9B00-B822-4889-B0B8-D6FA55905175}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/EdifactEncoder')]
  JEdifactEncoder = interface(JObject)
  ['{D92125E5-736C-4285-B874-F22937671D11}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(context: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJEdifactEncoder = class(TJavaGenericImport<JEdifactEncoderClass, JEdifactEncoder>) end;

  JEncoder_096Class = interface(JObjectClass)
  ['{9A3B3A07-81B0-4AE7-9D3C-0F294934E9D2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/Encoder')]
  JEncoder_096 = interface(IJavaInstance)
  ['{F3F0A938-E974-4795-B11C-01584562F278}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(P1: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJEncoder_096 = class(TJavaGenericImport<JEncoder_096Class, JEncoder_096>) end;

  JEncoderContextClass = interface(JObjectClass)
  ['{78887B7A-464D-457B-94E6-D56FF95364A4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/EncoderContext')]
  JEncoderContext = interface(JObject)
  ['{645EA63A-D0C2-40DD-A0D8-C4C9C493159A}']
    { Property Methods }

    { methods }
    procedure setSymbolShape(shape: JSymbolShapeHint); cdecl; //(Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;)V
    procedure setSizeConstraints(minSize: JDimension; maxSize: JDimension); cdecl; //(Lcom/google/zxing/Dimension;Lcom/google/zxing/Dimension;)V
    function getMessage: JString; cdecl; //()Ljava/lang/String;
    procedure setSkipAtEnd(count: Integer); cdecl; //(I)V
    function getCurrentChar: Char; cdecl; //()C
    function getCurrent: Char; cdecl; //()C
    function getCodewords: JStringBuilder; cdecl; //()Ljava/lang/StringBuilder;
    procedure writeCodewords(codewords: JString); cdecl; //(Ljava/lang/String;)V
    procedure writeCodeword(codeword: Char); cdecl; //(C)V
    function getCodewordCount: Integer; cdecl; //()I
    function getNewEncoding: Integer; cdecl; //()I
    procedure signalEncoderChange(encoding: Integer); cdecl; //(I)V
    procedure resetEncoderSignal; cdecl; //()V
    function hasMoreCharacters: Boolean; cdecl; //()Z
    function getRemainingCharacters: Integer; cdecl; //()I
    function getSymbolInfo: JSymbolInfo; cdecl; //()Lcom/google/zxing/datamatrix/encoder/SymbolInfo;
    procedure updateSymbolInfo; cdecl; overload; //()V
    procedure updateSymbolInfo(len: Integer); cdecl; overload; //(I)V
    procedure resetSymbolInfo; cdecl; //()V

    { Property }
  end;

  TJEncoderContext = class(TJavaGenericImport<JEncoderContextClass, JEncoderContext>) end;

  JErrorCorrectionClass = interface(JObjectClass)
  ['{CA756068-7CFF-4E3B-8FB3-63355470B14E}']
    { static Property Methods }

    { static Methods }
    {class} function encodeECC200(codewords: JString; symbolInfo: JSymbolInfo): JString; cdecl; //(Ljava/lang/String;Lcom/google/zxing/datamatrix/encoder/SymbolInfo;)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/ErrorCorrection')]
  JErrorCorrection = interface(JObject)
  ['{84B30D35-8362-4FA1-A5E1-0A72DFA96929}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJErrorCorrection = class(TJavaGenericImport<JErrorCorrectionClass, JErrorCorrection>) end;

  JHighLevelEncoder_099Class = interface(JObjectClass)
  ['{1F711100-5866-49A1-9ABD-6B8D0BFB258C}']
    { static Property Methods }

    { static Methods }
    {class} function encodeHighLevel(msg: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function encodeHighLevel(msg: JString; shape: JSymbolShapeHint; minSize: JDimension; maxSize: JDimension): JString; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Lcom/google/zxing/Dimension;Lcom/google/zxing/Dimension;)Ljava/lang/String;
    {class} function determineConsecutiveDigitCount(msg: JCharSequence; startpos: Integer): Integer; cdecl; //(Ljava/lang/CharSequence;I)I

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/HighLevelEncoder')]
  JHighLevelEncoder_099 = interface(JObject)
  ['{1B37820D-2085-4335-85BF-C98E8D0276B6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHighLevelEncoder_099 = class(TJavaGenericImport<JHighLevelEncoder_099Class, JHighLevelEncoder_099>) end;


  JSymbolShapeHintClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{420A7427-CECC-4B51-9361-D140B3240B85}']
    { static Property Methods }
    {class} function _GetFORCE_NONE: JSymbolShapeHint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;
    {class} function _GetFORCE_SQUARE: JSymbolShapeHint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;
    {class} function _GetFORCE_RECTANGLE: JSymbolShapeHint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    { static Methods }
    {class} function values: TJavaObjectArray<JSymbolShapeHint>; cdecl; //()[Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;
    {class} function valueOf(name: JString): JSymbolShapeHint; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    { static Property }
    {class} property FORCE_NONE: JSymbolShapeHint read _GetFORCE_NONE;
    {class} property FORCE_SQUARE: JSymbolShapeHint read _GetFORCE_SQUARE;
    {class} property FORCE_RECTANGLE: JSymbolShapeHint read _GetFORCE_RECTANGLE;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/SymbolShapeHint')]
  JSymbolShapeHint = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{2294B8D9-0EE3-4208-810D-016055C9644D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSymbolShapeHint = class(TJavaGenericImport<JSymbolShapeHintClass, JSymbolShapeHint>) end;

  JTextEncoderClass = interface(JC40EncoderClass) // or JObjectClass // SuperSignature: com/google/zxing/datamatrix/encoder/C40Encoder
  ['{E3C022F6-9EA0-45D1-945C-60FA55F6DF7D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/TextEncoder')]
  JTextEncoder = interface(JC40Encoder) // or JObject // SuperSignature: com/google/zxing/datamatrix/encoder/C40Encoder
  ['{9DF16413-D438-4B67-BF55-48C278E93EDA}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I

    { Property }
  end;

  TJTextEncoder = class(TJavaGenericImport<JTextEncoderClass, JTextEncoder>) end;

  JX12EncoderClass = interface(JC40EncoderClass) // or JObjectClass // SuperSignature: com/google/zxing/datamatrix/encoder/C40Encoder
  ['{2BC17AE1-C915-4554-BE44-5D81E7A2A89F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/X12Encoder')]
  JX12Encoder = interface(JC40Encoder) // or JObject // SuperSignature: com/google/zxing/datamatrix/encoder/C40Encoder
  ['{3D8F25B0-D4E4-4AFF-A6E3-AB9AAA5DB8E3}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(context: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJX12Encoder = class(TJavaGenericImport<JX12EncoderClass, JX12Encoder>) end;

  JDecodeHintTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{173F9D6C-0296-4A88-B34D-74EF229180E0}']
    { static Property Methods }
    {class} function _GetOTHER: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;
    {class} function _GetPURE_BARCODE: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;
    {class} function _GetPOSSIBLE_FORMATS: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;
    {class} function _GetTRY_HARDER: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;
    {class} function _GetCHARACTER_SET: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;
    {class} function _GetALLOWED_LENGTHS: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;
    {class} function _GetASSUME_CODE_39_CHECK_DIGIT: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;
    {class} function _GetASSUME_GS1: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;
    {class} function _GetRETURN_CODABAR_START_END: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;
    {class} function _GetNEED_RESULT_POINT_CALLBACK: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;
    {class} function _GetALLOWED_EAN_EXTENSIONS: JDecodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/DecodeHintType;

    { static Methods }
    {class} function values: TJavaObjectArray<JDecodeHintType>; cdecl; //()[Lcom/google/zxing/DecodeHintType;
    {class} function valueOf(name: JString): JDecodeHintType; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/DecodeHintType;

    { static Property }
    {class} property OTHER: JDecodeHintType read _GetOTHER;
    {class} property PURE_BARCODE: JDecodeHintType read _GetPURE_BARCODE;
    {class} property POSSIBLE_FORMATS: JDecodeHintType read _GetPOSSIBLE_FORMATS;
    {class} property TRY_HARDER: JDecodeHintType read _GetTRY_HARDER;
    {class} property CHARACTER_SET: JDecodeHintType read _GetCHARACTER_SET;
    {class} property ALLOWED_LENGTHS: JDecodeHintType read _GetALLOWED_LENGTHS;
    {class} property ASSUME_CODE_39_CHECK_DIGIT: JDecodeHintType read _GetASSUME_CODE_39_CHECK_DIGIT;
    {class} property ASSUME_GS1: JDecodeHintType read _GetASSUME_GS1;
    {class} property RETURN_CODABAR_START_END: JDecodeHintType read _GetRETURN_CODABAR_START_END;
    {class} property NEED_RESULT_POINT_CALLBACK: JDecodeHintType read _GetNEED_RESULT_POINT_CALLBACK;
    {class} property ALLOWED_EAN_EXTENSIONS: JDecodeHintType read _GetALLOWED_EAN_EXTENSIONS;
  end;

  [JavaSignature('com/google/zxing/DecodeHintType')]
  JDecodeHintType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{CA81ED16-B897-40F8-BCC3-FF56744621CD}']
    { Property Methods }

    { methods }
    function getValueType: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJDecodeHintType = class(TJavaGenericImport<JDecodeHintTypeClass, JDecodeHintType>) end;

  JDimensionClass = interface(JObjectClass)
  ['{1FD85C29-DB71-4F22-947A-72FCAC97A49F}']
    { static Property Methods }

    { static Methods }
    {class} function init(width: Integer; height: Integer): JDimension; cdecl; //(II)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/Dimension')]
  JDimension = interface(JObject)
  ['{BB6BD9BE-F390-4FE1-A170-C8545899667A}']
    { Property Methods }

    { methods }
    function getWidth: Integer; cdecl; //()I
    function getHeight: Integer; cdecl; //()I
    function equals(other: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDimension = class(TJavaGenericImport<JDimensionClass, JDimension>) end;

  JEncodeHintTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{42621933-4D73-47E4-A954-41B0944E3F20}']
    { static Property Methods }
    {class} function _GetERROR_CORRECTION: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetCHARACTER_SET: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetDATA_MATRIX_SHAPE: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetMIN_SIZE: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetMAX_SIZE: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetMARGIN: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetPDF417_COMPACT: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetPDF417_COMPACTION: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetPDF417_DIMENSIONS: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetAZTEC_LAYERS: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetQR_VERSION: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;
    {class} function _GetGS1_FORMAT: JEncodeHintType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/EncodeHintType;

    { static Methods }
    {class} function values: TJavaObjectArray<JEncodeHintType>; cdecl; //()[Lcom/google/zxing/EncodeHintType;
    {class} function valueOf(name: JString): JEncodeHintType; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/EncodeHintType;

    { static Property }
    {class} property ERROR_CORRECTION: JEncodeHintType read _GetERROR_CORRECTION;
    {class} property CHARACTER_SET: JEncodeHintType read _GetCHARACTER_SET;
    {class} property DATA_MATRIX_SHAPE: JEncodeHintType read _GetDATA_MATRIX_SHAPE;
    {class} property MIN_SIZE: JEncodeHintType read _GetMIN_SIZE;
    {class} property MAX_SIZE: JEncodeHintType read _GetMAX_SIZE;
    {class} property MARGIN: JEncodeHintType read _GetMARGIN;
    {class} property PDF417_COMPACT: JEncodeHintType read _GetPDF417_COMPACT;
    {class} property PDF417_COMPACTION: JEncodeHintType read _GetPDF417_COMPACTION;
    {class} property PDF417_DIMENSIONS: JEncodeHintType read _GetPDF417_DIMENSIONS;
    {class} property AZTEC_LAYERS: JEncodeHintType read _GetAZTEC_LAYERS;
    {class} property QR_VERSION: JEncodeHintType read _GetQR_VERSION;
    {class} property GS1_FORMAT: JEncodeHintType read _GetGS1_FORMAT;
  end;

  [JavaSignature('com/google/zxing/EncodeHintType')]
  JEncodeHintType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{C2C6983B-C36B-4041-80FE-DA0C381E3000}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncodeHintType = class(TJavaGenericImport<JEncodeHintTypeClass, JEncodeHintType>) end;

  JFormatExceptionClass = interface(JReaderExceptionClass) // or JObjectClass // SuperSignature: com/google/zxing/ReaderException
  ['{7F0BE63F-AE8E-43B3-90BB-D57D95A30664}']
    { static Property Methods }

    { static Methods }
    {class} function getFormatInstance: JFormatException; cdecl; overload; //()Lcom/google/zxing/FormatException;
    {class} function getFormatInstance(cause: JThrowable): JFormatException; cdecl; overload; //(Ljava/lang/Throwable;)Lcom/google/zxing/FormatException;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/FormatException')]
  JFormatException = interface(JReaderException) // or JObject // SuperSignature: com/google/zxing/ReaderException
  ['{02171952-9C18-4679-B486-47B1FA38846F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFormatException = class(TJavaGenericImport<JFormatExceptionClass, JFormatException>) end;



  JLuminanceSourceClass = interface(JObjectClass)
  ['{018C66CC-E8F7-4037-96B0-0565C8DD91F9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/LuminanceSource')]
  JLuminanceSource = interface(JObject)
  ['{84C78E7A-D084-49F0-AA65-6AC7FBD734E4}']
    { Property Methods }

    { methods }
    function getRow(P1: Integer; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; //(I[B)[B
    function getMatrix: TJavaArray<Byte>; cdecl; //()[B
    function getWidth: Integer; cdecl; //()I
    function getHeight: Integer; cdecl; //()I
    function isCropSupported: Boolean; cdecl; //()Z
    function crop(left: Integer; top: Integer; width: Integer; height: Integer): JLuminanceSource; cdecl; //(IIII)Lcom/google/zxing/LuminanceSource;
    function isRotateSupported: Boolean; cdecl; //()Z
    function invert: JLuminanceSource; cdecl; //()Lcom/google/zxing/LuminanceSource;
    function rotateCounterClockwise: JLuminanceSource; cdecl; //()Lcom/google/zxing/LuminanceSource;
    function rotateCounterClockwise45: JLuminanceSource; cdecl; //()Lcom/google/zxing/LuminanceSource;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJLuminanceSource = class(TJavaGenericImport<JLuminanceSourceClass, JLuminanceSource>) end;




  JInvertedLuminanceSourceClass = interface(JLuminanceSourceClass) // or JObjectClass // SuperSignature: com/google/zxing/LuminanceSource
  ['{955FA9C0-1094-42A6-B84C-8B356299308E}']
    { static Property Methods }

    { static Methods }
    {class} function init(delegate: JLuminanceSource): JInvertedLuminanceSource; cdecl; //(Lcom/google/zxing/LuminanceSource;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/InvertedLuminanceSource')]
  JInvertedLuminanceSource = interface(JLuminanceSource) // or JObject // SuperSignature: com/google/zxing/LuminanceSource
  ['{A4EC9B5A-E967-4E66-BEF5-54EF2AA81DC5}']
    { Property Methods }

    { methods }
    function getRow(y: Integer; row: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; //(I[B)[B
    function getMatrix: TJavaArray<Byte>; cdecl; //()[B
    function isCropSupported: Boolean; cdecl; //()Z
    function crop(left: Integer; top: Integer; width: Integer; height: Integer): JLuminanceSource; cdecl; //(IIII)Lcom/google/zxing/LuminanceSource;
    function isRotateSupported: Boolean; cdecl; //()Z
    function invert: JLuminanceSource; cdecl; //()Lcom/google/zxing/LuminanceSource;
    function rotateCounterClockwise: JLuminanceSource; cdecl; //()Lcom/google/zxing/LuminanceSource;
    function rotateCounterClockwise45: JLuminanceSource; cdecl; //()Lcom/google/zxing/LuminanceSource;

    { Property }
  end;

  TJInvertedLuminanceSource = class(TJavaGenericImport<JInvertedLuminanceSourceClass, JInvertedLuminanceSource>) end;


//  JBitMatrixParser_110Class = interface(JObjectClass)
//  ['{63B01110-7F20-497A-9F39-4F8546C0E7D0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/maxicode/decoder/BitMatrixParser')]
//  JBitMatrixParser_110 = interface(JObject)
//  ['{F6EF3DE2-FB10-4275-857F-120B55405F9A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJBitMatrixParser_110 = class(TJavaGenericImport<JBitMatrixParser_110Class, JBitMatrixParser_110>) end;

//  JDecodedBitStreamParser_111Class = interface(JObjectClass)
//  ['{2851CDF3-88F9-47C1-A6AE-8909F4A6CCC3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/maxicode/decoder/DecodedBitStreamParser')]
//  JDecodedBitStreamParser_111 = interface(JObject)
//  ['{14771436-7DA2-4160-8AF4-692DCE047FE9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_111 = class(TJavaGenericImport<JDecodedBitStreamParser_111Class, JDecodedBitStreamParser_111>) end;

//  JDecoder_112Class = interface(JObjectClass)
//  ['{15E5535B-4D3C-4793-9198-98AAB7DA649B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDecoder_112; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/maxicode/decoder/Decoder')]
//  JDecoder_112 = interface(JObject)
//  ['{651C3C14-8ED0-4C79-9CFD-B46014C03705}']
//    { Property Methods }
//
//    { methods }
//    function decode(bits: JBitMatrix): JDecoderResult; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
//    function decode(bits: JBitMatrix; hints: JMap): JDecoderResult; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
//
//    { Property }
//  end;

//  TJDecoder_112 = class(TJavaGenericImport<JDecoder_112Class, JDecoder_112>) end;

  JMaxiCodeReaderClass = interface(JObjectClass)
  ['{5A74283C-C88A-4421-8AE5-26BF3E56C81A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMaxiCodeReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/maxicode/MaxiCodeReader')]
  JMaxiCodeReader = interface(JObject)
  ['{10DD0480-C3C1-439E-BC53-495C30450450}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJMaxiCodeReader = class(TJavaGenericImport<JMaxiCodeReaderClass, JMaxiCodeReader>) end;

  JByQuadrantReaderClass = interface(JObjectClass)
  ['{C04623B6-5873-4959-9EE9-80F0FAD5AFDD}']
    { static Property Methods }

    { static Methods }
    {class} function init(delegate: JReader): JByQuadrantReader; cdecl; //(Lcom/google/zxing/Reader;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/ByQuadrantReader')]
  JByQuadrantReader = interface(JObject)
  ['{314BF8A8-5758-4944-97B2-432032C54FC9}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJByQuadrantReader = class(TJavaGenericImport<JByQuadrantReaderClass, JByQuadrantReader>) end;

  JGenericMultipleBarcodeReaderClass = interface(JObjectClass)
  ['{C280FE25-7B07-4EAC-BC6B-49A98EF6D296}']
    { static Property Methods }

    { static Methods }
    {class} function init(delegate: JReader): JGenericMultipleBarcodeReader; cdecl; //(Lcom/google/zxing/Reader;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/GenericMultipleBarcodeReader')]
  JGenericMultipleBarcodeReader = interface(JObject)
  ['{502B1C1B-856E-4181-8BBB-D1C0670F1D11}']
    { Property Methods }

    { methods }
    function decodeMultiple(image: JBinaryBitmap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    function decodeMultiple(image: JBinaryBitmap; hints: JMap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    { Property }
  end;

  TJGenericMultipleBarcodeReader = class(TJavaGenericImport<JGenericMultipleBarcodeReaderClass, JGenericMultipleBarcodeReader>) end;

  JMultipleBarcodeReaderClass = interface(JObjectClass)
  ['{8C2A59C7-7A75-4A55-AB39-8D3CD515EFFB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/MultipleBarcodeReader')]
  JMultipleBarcodeReader = interface(IJavaInstance)
  ['{2EE7CA7E-F993-4A22-A095-04E2DD72C23E}']
    { Property Methods }

    { methods }
    function decodeMultiple(P1: JBinaryBitmap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    function decodeMultiple(P1: JBinaryBitmap; P2: JMap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    { Property }
  end;

  TJMultipleBarcodeReader = class(TJavaGenericImport<JMultipleBarcodeReaderClass, JMultipleBarcodeReader>) end;

//  JMultiDetectorClass = interface(JDetector_240Class) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/detector/Detector
//  ['{AF221535-4EDF-4E6C-9476-63B413963B9E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(image: JBitMatrix): JMultiDetector; cdecl; //(Lcom/google/zxing/common/BitMatrix;)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiDetector')]
//  JMultiDetector = interface(JDetector_240) // or JObject // SuperSignature: com/google/zxing/qrcode/detector/Detector
//  ['{64A6BD7C-98DB-496D-97F7-897A1B9C95DD}']
//    { Property Methods }
//
//    { methods }
//    function detectMulti(hints: JMap): TJavaObjectArray<JDetectorResult>; cdecl; //(Ljava/util/Map;)[Lcom/google/zxing/common/DetectorResult;
//
//    { Property }
//  end;
//
//  TJMultiDetector = class(TJavaGenericImport<JMultiDetectorClass, JMultiDetector>) end;

//  JMultiFinderPatternFinder_1Class = interface(JObjectClass)
//  ['{FC0EEB70-A69F-4B91-A943-4635020E5575}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$1')]
//  JMultiFinderPatternFinder_1 = interface(JObject)
//  ['{1651BA25-CC6B-46ED-A74C-241401FB0606}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJMultiFinderPatternFinder_1 = class(TJavaGenericImport<JMultiFinderPatternFinder_1Class, JMultiFinderPatternFinder_1>) end;

  JMultiFinderPatternFinder_ModuleSizeComparatorClass = interface(JObjectClass)
  ['{B316DC86-F5BC-4419-B4B9-4EF555E73C50}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator')]
  JMultiFinderPatternFinder_ModuleSizeComparator = interface(JObject)
  ['{A16CD32B-5DBC-4867-80C1-209CDF435FD6}']
    { Property Methods }

    { methods }
    function compare(center1: JFinderPattern; center2: JFinderPattern): Integer; cdecl; overload; //(Lcom/google/zxing/qrcode/detector/FinderPattern;Lcom/google/zxing/qrcode/detector/FinderPattern;)I
    function compare(this: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I

    { Property }
  end;

  TJMultiFinderPatternFinder_ModuleSizeComparator = class(TJavaGenericImport<JMultiFinderPatternFinder_ModuleSizeComparatorClass, JMultiFinderPatternFinder_ModuleSizeComparator>) end;



  JFinderPatternFinderClass = interface(JObjectClass)
  ['{4313CE91-ADE2-4767-8898-51DE04D6A627}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JFinderPatternFinder; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;)V
    {class} function init(image: JBitMatrix; resultPointCallback: JResultPointCallback): JFinderPatternFinder; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternFinder')]
  JFinderPatternFinder = interface(JObject)
  ['{F83A8ED4-EE55-4A55-9E26-A820145E0DD8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFinderPatternFinder = class(TJavaGenericImport<JFinderPatternFinderClass, JFinderPatternFinder>) end;




  JMultiFinderPatternFinderClass = interface(JFinderPatternFinderClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/detector/FinderPatternFinder
  ['{4E2AED6B-8A2A-4962-8BFE-34696116358A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder')]
  JMultiFinderPatternFinder = interface(JFinderPatternFinder) // or JObject // SuperSignature: com/google/zxing/qrcode/detector/FinderPatternFinder
  ['{5E9E5317-AC11-457E-97B7-5A469F33C22B}']
    { Property Methods }

    { methods }
    function findMulti(hints: JMap): TJavaObjectArray<JFinderPatternInfo>; cdecl; //(Ljava/util/Map;)[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    { Property }
  end;

  TJMultiFinderPatternFinder = class(TJavaGenericImport<JMultiFinderPatternFinderClass, JMultiFinderPatternFinder>) end;

//  JQRCodeMultiReader_1Class = interface(JObjectClass)
//  ['{BAA35F8E-94D4-45EC-A324-41A7FFBE888D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/multi/qrcode/QRCodeMultiReader$1')]
//  JQRCodeMultiReader_1 = interface(JObject)
//  ['{6D04FB50-2E00-4565-A5B7-7C77BACD8009}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJQRCodeMultiReader_1 = class(TJavaGenericImport<JQRCodeMultiReader_1Class, JQRCodeMultiReader_1>) end;

  JQRCodeMultiReader_SAComparatorClass = interface(JObjectClass)
  ['{A1A6D0E8-B699-4BD4-96B9-3D62EA446C91}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator')]
  JQRCodeMultiReader_SAComparator = interface(JObject)
  ['{285524B3-9843-4BD2-86D0-3DA42D819A37}']
    { Property Methods }

    { methods }
    function compare(a: JResult; b: JResult): Integer; cdecl; overload; //(Lcom/google/zxing/Result;Lcom/google/zxing/Result;)I
    function compare(this: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I

    { Property }
  end;

  TJQRCodeMultiReader_SAComparator = class(TJavaGenericImport<JQRCodeMultiReader_SAComparatorClass, JQRCodeMultiReader_SAComparator>) end;



  JQRCodeReaderClass = interface(JObjectClass)
  ['{EC4F2165-F7EC-4AFB-87BF-8F1CC5B98D9F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JQRCodeReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/QRCodeReader')]
  JQRCodeReader = interface(JObject)
  ['{480EBEE9-499B-4A9E-968B-164241130D11}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJQRCodeReader = class(TJavaGenericImport<JQRCodeReaderClass, JQRCodeReader>) end;





  JQRCodeMultiReaderClass = interface(JQRCodeReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/QRCodeReader
  ['{82C86EE0-21EB-4ADC-BD30-0C4B20105494}']
    { static Property Methods }

    { static Methods }
    {class} function init: JQRCodeMultiReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/QRCodeMultiReader')]
  JQRCodeMultiReader = interface(JQRCodeReader) // or JObject // SuperSignature: com/google/zxing/qrcode/QRCodeReader
  ['{2CA22226-3AB2-4AC4-9A25-1BB8CFB3C353}']
    { Property Methods }

    { methods }
    function decodeMultiple(image: JBinaryBitmap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    function decodeMultiple(image: JBinaryBitmap; hints: JMap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    { Property }
  end;

  TJQRCodeMultiReader = class(TJavaGenericImport<JQRCodeMultiReaderClass, JQRCodeMultiReader>) end;

  JMultiFormatReaderClass = interface(JObjectClass)
  ['{2BF49DF7-7C3F-47A5-BAF4-98FD15E44459}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMultiFormatReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/MultiFormatReader')]
  JMultiFormatReader = interface(JObject)
  ['{81CFC946-3173-486C-85FE-286964A7F7B6}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    function decodeWithState(image: JBinaryBitmap): JResult; cdecl; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    procedure setHints(hints: JMap); cdecl; //(Ljava/util/Map;)V
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJMultiFormatReader = class(TJavaGenericImport<JMultiFormatReaderClass, JMultiFormatReader>) end;

//  JMultiFormatWriter_1Class = interface(JObjectClass)
//  ['{913CB3A2-B1B4-4D01-B6F9-7325096417C8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/MultiFormatWriter$1')]
//  JMultiFormatWriter_1 = interface(JObject)
//  ['{D752AE13-2A35-421D-A8AB-89231407F105}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJMultiFormatWriter_1 = class(TJavaGenericImport<JMultiFormatWriter_1Class, JMultiFormatWriter_1>) end;

  JMultiFormatWriterClass = interface(JObjectClass)
  ['{0D7C9F21-F1EC-41BA-9368-743011860069}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMultiFormatWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/MultiFormatWriter')]
  JMultiFormatWriter = interface(JObject)
  ['{2B891E32-C882-4F33-B139-7AE8A1A07802}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJMultiFormatWriter = class(TJavaGenericImport<JMultiFormatWriterClass, JMultiFormatWriter>) end;

  JNotFoundExceptionClass = interface(JReaderExceptionClass) // or JObjectClass // SuperSignature: com/google/zxing/ReaderException
  ['{CCFAC46A-13F4-4E5D-972A-7E132D2DA979}']
    { static Property Methods }

    { static Methods }
    {class} function getNotFoundInstance: JNotFoundException; cdecl; //()Lcom/google/zxing/NotFoundException;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/NotFoundException')]
  JNotFoundException = interface(JReaderException) // or JObject // SuperSignature: com/google/zxing/ReaderException
  ['{2B44AD8D-4E28-4BB3-A332-A84C2155E03A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNotFoundException = class(TJavaGenericImport<JNotFoundExceptionClass, JNotFoundException>) end;



  JOneDReaderClass = interface(JObjectClass)
  ['{4B882A50-75FF-4107-AD7C-E5A4BC0A0BCC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOneDReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/OneDReader')]
  JOneDReader = interface(JObject)
  ['{44C2900F-C357-4370-ACED-9A429F1B66CA}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJOneDReader = class(TJavaGenericImport<JOneDReaderClass, JOneDReader>) end;







  JCodaBarReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{9BAD3574-8A94-46E3-A895-F142FD66766B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCodaBarReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/CodaBarReader')]
  JCodaBarReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{BAEB1403-9D88-4F42-BA67-2917AAD6460C}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJCodaBarReader = class(TJavaGenericImport<JCodaBarReaderClass, JCodaBarReader>) end;



  JOneDimensionalCodeWriterClass = interface(JObjectClass)
  ['{AD5844DD-2683-447E-A83F-755D14A80891}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOneDimensionalCodeWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/OneDimensionalCodeWriter')]
  JOneDimensionalCodeWriter = interface(JObject)
  ['{2F6587B6-C63F-4D39-B282-3E67B7C176FE}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function getDefaultMargin: Integer; cdecl; //()I
    function encode(P1: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJOneDimensionalCodeWriter = class(TJavaGenericImport<JOneDimensionalCodeWriterClass, JOneDimensionalCodeWriter>) end;






  JCodaBarWriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{33B11112-1A22-49FA-BAD2-17D3389EE194}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCodaBarWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/CodaBarWriter')]
  JCodaBarWriter = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{1BADF4DB-7EAA-44F3-BBFD-937CFA61AE09}']
    { Property Methods }

    { methods }
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJCodaBarWriter = class(TJavaGenericImport<JCodaBarWriterClass, JCodaBarWriter>) end;

  JCode128ReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{6DCAE7EE-EB46-4108-BDBF-993DE0C1F9E3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode128Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code128Reader')]
  JCode128Reader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{395386BF-EA7C-40BC-8293-6B484506ACB3}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJCode128Reader = class(TJavaGenericImport<JCode128ReaderClass, JCode128Reader>) end;

  JCode128Writer_CTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{9E17369B-9EC6-43F7-BE7A-09E9FCDB6D12}']
    { static Property Methods }
    {class} function _GetUNCODABLE: JCode128Writer_CType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/oned/Code128Writer$CType;
    {class} function _GetONE_DIGIT: JCode128Writer_CType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/oned/Code128Writer$CType;
    {class} function _GetTWO_DIGITS: JCode128Writer_CType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/oned/Code128Writer$CType;
    {class} function _GetFNC_1: JCode128Writer_CType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/oned/Code128Writer$CType;

    { static Methods }
    {class} function values: TJavaObjectArray<JCode128Writer_CType>; cdecl; //()[Lcom/google/zxing/oned/Code128Writer$CType;
    {class} function valueOf(name: JString): JCode128Writer_CType; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/oned/Code128Writer$CType;

    { static Property }
    {class} property UNCODABLE: JCode128Writer_CType read _GetUNCODABLE;
    {class} property ONE_DIGIT: JCode128Writer_CType read _GetONE_DIGIT;
    {class} property TWO_DIGITS: JCode128Writer_CType read _GetTWO_DIGITS;
    {class} property FNC_1: JCode128Writer_CType read _GetFNC_1;
  end;

  [JavaSignature('com/google/zxing/oned/Code128Writer$CType')]
  JCode128Writer_CType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{16527328-2E42-4413-B380-FD2D75251468}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCode128Writer_CType = class(TJavaGenericImport<JCode128Writer_CTypeClass, JCode128Writer_CType>) end;

  JCode128WriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{0547708C-24D1-43C0-8804-F21EF27A3DF0}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode128Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code128Writer')]
  JCode128Writer = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{AA2FA210-2BAC-4AD3-92F4-6CABF13167E6}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJCode128Writer = class(TJavaGenericImport<JCode128WriterClass, JCode128Writer>) end;

  JCode39ReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{0B45650C-548D-4420-A8F7-DF27AF32CF5F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode39Reader; cdecl; overload; //()V
    {class} function init(usingCheckDigit: Boolean): JCode39Reader; cdecl; overload; //(Z)V
    {class} function init(usingCheckDigit: Boolean; extendedMode: Boolean): JCode39Reader; cdecl; overload; //(ZZ)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code39Reader')]
  JCode39Reader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{03CE0997-11D8-42BA-828D-77FEFE5962CB}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJCode39Reader = class(TJavaGenericImport<JCode39ReaderClass, JCode39Reader>) end;

  JCode39WriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{2A5E875C-D584-4BBB-8DEB-B052F49C7ABC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode39Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code39Writer')]
  JCode39Writer = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{CDDFA48A-4A97-4D5E-9BFE-D0CD9DC8D784}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJCode39Writer = class(TJavaGenericImport<JCode39WriterClass, JCode39Writer>) end;

  JCode93ReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{A7786793-F8B5-4899-B653-A4AA6094A581}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode93Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code93Reader')]
  JCode93Reader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{C2617765-F176-4BFA-8EC7-4CDAA5AAC7F7}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJCode93Reader = class(TJavaGenericImport<JCode93ReaderClass, JCode93Reader>) end;

  JCode93WriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{D51C6B2D-152E-483C-A72D-308E4D09B872}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode93Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code93Writer')]
  JCode93Writer = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{2CC47D80-AD79-4ACC-8A7D-2FA53CEDF68B}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJCode93Writer = class(TJavaGenericImport<JCode93WriterClass, JCode93Writer>) end;


  JUPCEANReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{E76D5EB0-79CB-4F94-BFBA-D3F9E3AC9BDD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANReader')]
  JUPCEANReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{1CC30E14-FC1A-4517-8B1C-F8A02E82C03E}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; overload; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    function decodeRow(rowNumber: Integer; row: JBitArray; startGuardRange: TJavaArray<Integer>; hints: JMap): JResult; cdecl; overload; //(ILcom/google/zxing/common/BitArray;[ILjava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJUPCEANReader = class(TJavaGenericImport<JUPCEANReaderClass, JUPCEANReader>) end;




  JEAN13ReaderClass = interface(JUPCEANReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{96624D4B-04C7-489C-88EC-50A669070DE9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEAN13Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/EAN13Reader')]
  JEAN13Reader = interface(JUPCEANReader) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{D9404FD8-19E7-46FD-B465-4CA8BE7632E2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEAN13Reader = class(TJavaGenericImport<JEAN13ReaderClass, JEAN13Reader>) end;

  JUPCEANWriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{91C8A2DD-DE51-433C-92E4-2B48786C8DE3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCEANWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANWriter')]
  JUPCEANWriter = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{B9E66FF8-6A19-4C76-ABE8-A1039A7FB1C1}']
    { Property Methods }

    { methods }
    function getDefaultMargin: Integer; cdecl; //()I

    { Property }
  end;

  TJUPCEANWriter = class(TJavaGenericImport<JUPCEANWriterClass, JUPCEANWriter>) end;




  JEAN13WriterClass = interface(JUPCEANWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANWriter
  ['{0B4C7057-FF00-4D8B-970C-038F697ED515}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEAN13Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/EAN13Writer')]
  JEAN13Writer = interface(JUPCEANWriter) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANWriter
  ['{2313E060-31B8-4EEB-AA97-3835543C2D26}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJEAN13Writer = class(TJavaGenericImport<JEAN13WriterClass, JEAN13Writer>) end;

  JEAN8ReaderClass = interface(JUPCEANReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{E72431BA-166E-4DC9-9C75-57CE6CCD0810}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEAN8Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/EAN8Reader')]
  JEAN8Reader = interface(JUPCEANReader) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{7CC45F75-6CC9-4DEB-8C81-2D326BC1A6EA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEAN8Reader = class(TJavaGenericImport<JEAN8ReaderClass, JEAN8Reader>) end;

  JEAN8WriterClass = interface(JUPCEANWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANWriter
  ['{D1537F18-1BE2-4158-8EEA-56A9AE9FBBE6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEAN8Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/EAN8Writer')]
  JEAN8Writer = interface(JUPCEANWriter) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANWriter
  ['{A3D3A187-47F1-40E8-BB66-6BD38F5BF956}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJEAN8Writer = class(TJavaGenericImport<JEAN8WriterClass, JEAN8Writer>) end;

  JEANManufacturerOrgSupportClass = interface(JObjectClass)
  ['{92837FEC-1D2D-4C06-92F4-9F0A7B1B7F05}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/EANManufacturerOrgSupport')]
  JEANManufacturerOrgSupport = interface(JObject)
  ['{99B28BD0-B919-450D-B627-8A50861C5563}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEANManufacturerOrgSupport = class(TJavaGenericImport<JEANManufacturerOrgSupportClass, JEANManufacturerOrgSupport>) end;

  JITFReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{A65157A2-CF1D-46A3-B870-9DDAF9ECA3E4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JITFReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/ITFReader')]
  JITFReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{A8C7F1A9-75DE-419A-BDB3-465084C830D9}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJITFReader = class(TJavaGenericImport<JITFReaderClass, JITFReader>) end;

  JITFWriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{867F1462-F2BA-4FE9-9469-B7A8C9A7B29E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JITFWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/ITFWriter')]
  JITFWriter = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{D92B59AD-C5A0-498E-B05F-E6AF2FEC5C0C}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJITFWriter = class(TJavaGenericImport<JITFWriterClass, JITFWriter>) end;

  JMultiFormatOneDReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{059ACCC8-2576-4326-9860-11D90A24B584}']
    { static Property Methods }

    { static Methods }
    {class} function init(hints: JMap): JMultiFormatOneDReader; cdecl; //(Ljava/util/Map;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/MultiFormatOneDReader')]
  JMultiFormatOneDReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{0ABB0E93-5C92-490D-AA76-FB851972ADEA}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJMultiFormatOneDReader = class(TJavaGenericImport<JMultiFormatOneDReaderClass, JMultiFormatOneDReader>) end;

  JMultiFormatUPCEANReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{1B0A5C6B-0B9B-49D5-BF5E-B22303763721}']
    { static Property Methods }

    { static Methods }
    {class} function init(hints: JMap): JMultiFormatUPCEANReader; cdecl; //(Ljava/util/Map;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/MultiFormatUPCEANReader')]
  JMultiFormatUPCEANReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{55E43ACA-90DE-4CF0-9BAD-123D0AD3F8C3}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJMultiFormatUPCEANReader = class(TJavaGenericImport<JMultiFormatUPCEANReaderClass, JMultiFormatUPCEANReader>) end;


  JAbstractRSSReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{095CBAF7-20D3-4BCD-9762-253B0D268933}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/AbstractRSSReader')]
  JAbstractRSSReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{AFE7883D-6A03-4FEF-91C8-69E89F834867}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAbstractRSSReader = class(TJavaGenericImport<JAbstractRSSReaderClass, JAbstractRSSReader>) end;

  JDataCharacterClass = interface(JObjectClass)
  ['{71D8FE01-2F31-4C01-BCFF-C98CC6FDE15E}']
    { static Property Methods }

    { static Methods }
    {class} function init(value: Integer; checksumPortion: Integer): JDataCharacter; cdecl; //(II)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/DataCharacter')]
  JDataCharacter = interface(JObject)
  ['{FF1E723A-A014-4F92-9855-68D0EA7FC889}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I
    function getChecksumPortion: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJDataCharacter = class(TJavaGenericImport<JDataCharacterClass, JDataCharacter>) end;

  JBitArrayBuilderClass = interface(JObjectClass)
  ['{F7303A9E-EE33-4057-8105-4DC98DB1A551}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/BitArrayBuilder')]
  JBitArrayBuilder = interface(JObject)
  ['{4CDCA9D0-95EE-4D1F-A17E-9408924B5CC6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitArrayBuilder = class(TJavaGenericImport<JBitArrayBuilderClass, JBitArrayBuilder>) end;

  JAbstractExpandedDecoderClass = interface(JObjectClass)
  ['{98662961-30FF-4B70-9564-8EA24E8965CC}']
    { static Property Methods }

    { static Methods }
    {class} function createDecoder(information: JBitArray): JAbstractExpandedDecoder; cdecl; //(Lcom/google/zxing/common/BitArray;)Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder')]
  JAbstractExpandedDecoder = interface(JObject)
  ['{47619836-D36F-4D4C-A1F7-CB6C3202718F}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAbstractExpandedDecoder = class(TJavaGenericImport<JAbstractExpandedDecoderClass, JAbstractExpandedDecoder>) end;



  JAI01decoderClass = interface(JAbstractExpandedDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder
  ['{0A83DCB9-B658-48FC-B87D-9D18CF6585CE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01decoder')]
  JAI01decoder = interface(JAbstractExpandedDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder
  ['{D44D16F2-F361-4726-BDD1-A012CDF54481}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAI01decoder = class(TJavaGenericImport<JAI01decoderClass, JAI01decoder>) end;



    JAI01weightDecoderClass = interface(JAI01decoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{28A87DB3-1351-4104-AEA5-74DCC3A86162}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder')]
  JAI01weightDecoder = interface(JAI01decoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{592EEC2A-F6E9-4F12-B203-9663A5AD0C3C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAI01weightDecoder = class(TJavaGenericImport<JAI01weightDecoderClass, JAI01weightDecoder>) end;


  JAI013x0xDecoderClass = interface(JAI01weightDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder
  ['{C31AE631-D874-4531-B448-D1317D509AAD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder')]
  JAI013x0xDecoder = interface(JAI01weightDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder
  ['{41C3E054-807A-4073-8B49-D16374F1E76B}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAI013x0xDecoder = class(TJavaGenericImport<JAI013x0xDecoderClass, JAI013x0xDecoder>) end;


  JAI013103decoderClass = interface(JAI013x0xDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder
  ['{9CF90A71-FD61-437A-B018-A688D9A19A7A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI013103decoder')]
  JAI013103decoder = interface(JAI013x0xDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder
  ['{57517F2C-3706-40C3-A6E2-05BA79D40437}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAI013103decoder = class(TJavaGenericImport<JAI013103decoderClass, JAI013103decoder>) end;

  JAI01320xDecoderClass = interface(JAI013x0xDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder
  ['{D0EEF1C9-4EBB-47C9-9F4D-72B25768BE58}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01320xDecoder')]
  JAI01320xDecoder = interface(JAI013x0xDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder
  ['{9C0CD121-703A-40C1-84B0-D2C05E4D7DE6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAI01320xDecoder = class(TJavaGenericImport<JAI01320xDecoderClass, JAI01320xDecoder>) end;

  JAI01392xDecoderClass = interface(JAI01decoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{F98A9C6C-5323-4676-BAF7-061D13862BCB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder')]
  JAI01392xDecoder = interface(JAI01decoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{3F135846-E24F-47CA-AF99-98D5515B0D87}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAI01392xDecoder = class(TJavaGenericImport<JAI01392xDecoderClass, JAI01392xDecoder>) end;

  JAI01393xDecoderClass = interface(JAI01decoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{10A76DD0-0AD3-47BF-B5C9-6813EAED936A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01393xDecoder')]
  JAI01393xDecoder = interface(JAI01decoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{381BCE52-78DC-40EB-A85A-0F7907A2E07C}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAI01393xDecoder = class(TJavaGenericImport<JAI01393xDecoderClass, JAI01393xDecoder>) end;

  JAI013x0x1xDecoderClass = interface(JAI01weightDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder
  ['{979A53F0-1C27-4087-AD2E-CB031BE99223}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder')]
  JAI013x0x1xDecoder = interface(JAI01weightDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder
  ['{C0CE5B12-111D-45E3-B34E-B5C645B9A82E}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAI013x0x1xDecoder = class(TJavaGenericImport<JAI013x0x1xDecoderClass, JAI013x0x1xDecoder>) end;


  JAI01AndOtherAIsClass = interface(JAI01decoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{88B31503-F75D-4786-BE8E-538499632C79}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01AndOtherAIs')]
  JAI01AndOtherAIs = interface(JAI01decoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{4B21C552-0ED5-4B78-B0DE-E69E981B828C}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAI01AndOtherAIs = class(TJavaGenericImport<JAI01AndOtherAIsClass, JAI01AndOtherAIs>) end;



  JAnyAIDecoderClass = interface(JAbstractExpandedDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder
  ['{A5B4F002-6135-4B89-8AD3-C9913415B28F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AnyAIDecoder')]
  JAnyAIDecoder = interface(JAbstractExpandedDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder
  ['{5ED226DC-D54E-4342-BE3C-42C3C2FDDACA}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAnyAIDecoder = class(TJavaGenericImport<JAnyAIDecoderClass, JAnyAIDecoder>) end;

  JBlockParsedResultClass = interface(JObjectClass)
  ['{D71A2B80-B3CD-4E00-84A1-598D74045B7D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/BlockParsedResult')]
  JBlockParsedResult = interface(JObject)
  ['{8F693A80-551B-4334-9552-0E458A604743}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBlockParsedResult = class(TJavaGenericImport<JBlockParsedResultClass, JBlockParsedResult>) end;

  JCurrentParsingState_StateClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{ACF60353-D8A3-41A0-B956-FA18C90118C1}']
    { static Property Methods }
    {class} function _GetNUMERIC: JCurrentParsingState_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;
    {class} function _GetALPHA: JCurrentParsingState_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;
    {class} function _GetISO_IEC_646: JCurrentParsingState_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    { static Methods }
    {class} function values: TJavaObjectArray<JCurrentParsingState_State>; cdecl; //()[Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;
    {class} function valueOf(name: JString): JCurrentParsingState_State; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    { static Property }
    {class} property NUMERIC: JCurrentParsingState_State read _GetNUMERIC;
    {class} property ALPHA: JCurrentParsingState_State read _GetALPHA;
    {class} property ISO_IEC_646: JCurrentParsingState_State read _GetISO_IEC_646;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State')]
  JCurrentParsingState_State = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{48F7DC67-F72F-4BDB-9B39-6B09A78D5F1F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCurrentParsingState_State = class(TJavaGenericImport<JCurrentParsingState_StateClass, JCurrentParsingState_State>) end;

  JCurrentParsingStateClass = interface(JObjectClass)
  ['{E488B93E-D768-4CCD-AE8B-4F789A8C521F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/CurrentParsingState')]
  JCurrentParsingState = interface(JObject)
  ['{DDE35CAA-4F47-4244-8C75-8114D7533C98}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCurrentParsingState = class(TJavaGenericImport<JCurrentParsingStateClass, JCurrentParsingState>) end;


  JDecodedObjectClass = interface(JObjectClass)
  ['{7288385B-DC80-42E7-9C0F-9A10F18832B9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedObject')]
  JDecodedObject = interface(JObject)
  ['{B9D1BB98-9A38-4DC5-A6F5-ED3CC4309609}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedObject = class(TJavaGenericImport<JDecodedObjectClass, JDecodedObject>) end;



  JDecodedCharClass = interface(JDecodedObjectClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{DE3CD724-3AD2-47BE-8856-6A67A2B53051}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedChar')]
  JDecodedChar = interface(JDecodedObject) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{18E363F0-BF81-4793-BD62-600CEE0C9ADB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedChar = class(TJavaGenericImport<JDecodedCharClass, JDecodedChar>) end;

  JDecodedInformationClass = interface(JDecodedObjectClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{013F5F39-9E94-4D7C-A646-2AB413D59249}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedInformation')]
  JDecodedInformation = interface(JDecodedObject) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{59ECEA44-358F-48DA-AFDA-AF8DD22B8342}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedInformation = class(TJavaGenericImport<JDecodedInformationClass, JDecodedInformation>) end;

  JDecodedNumericClass = interface(JDecodedObjectClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{9D626F23-D2F2-4F61-AF5C-B64E1E9E8D17}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedNumeric')]
  JDecodedNumeric = interface(JDecodedObject) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{A826D5EF-EA69-4018-8CBE-69CE675DBE81}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedNumeric = class(TJavaGenericImport<JDecodedNumericClass, JDecodedNumeric>) end;


  JFieldParserClass = interface(JObjectClass)
  ['{9BEA9B3A-25E7-4248-ACC9-705019DAE9B7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/FieldParser')]
  JFieldParser = interface(JObject)
  ['{48D50E98-0D2D-4A98-AD48-2A93BA65EAE6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFieldParser = class(TJavaGenericImport<JFieldParserClass, JFieldParser>) end;

  JGeneralAppIdDecoderClass = interface(JObjectClass)
  ['{951DB6CE-399D-4E2B-BC26-D037C8AE84B3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder')]
  JGeneralAppIdDecoder = interface(JObject)
  ['{5B726A33-139E-4C97-A4D7-CB81ED127C64}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGeneralAppIdDecoder = class(TJavaGenericImport<JGeneralAppIdDecoderClass, JGeneralAppIdDecoder>) end;

  JExpandedPairClass = interface(JObjectClass)
  ['{DC248E24-AF9A-49AE-8E44-ED11D1A7FE2F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/ExpandedPair')]
  JExpandedPair = interface(JObject)
  ['{6D7D01B4-666D-4F80-A5BD-A6E4B30051FF}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJExpandedPair = class(TJavaGenericImport<JExpandedPairClass, JExpandedPair>) end;

  JExpandedRowClass = interface(JObjectClass)
  ['{EE11A162-5A11-4CCB-A51E-66FA5821049C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/ExpandedRow')]
  JExpandedRow = interface(JObject)
  ['{AFAEFEF8-F6EB-4C71-A6EA-7E0C2BC0F7B8}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJExpandedRow = class(TJavaGenericImport<JExpandedRowClass, JExpandedRow>) end;

  JRSSExpandedReaderClass = interface(JAbstractRSSReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/AbstractRSSReader
  ['{5176C7F7-7631-48B6-B1FE-C2379FD114C9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRSSExpandedReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/RSSExpandedReader')]
  JRSSExpandedReader = interface(JAbstractRSSReader) // or JObject // SuperSignature: com/google/zxing/oned/rss/AbstractRSSReader
  ['{D1968B4F-8A70-44A2-9BBC-412D5295C07B}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJRSSExpandedReader = class(TJavaGenericImport<JRSSExpandedReaderClass, JRSSExpandedReader>) end;

  JFinderPatternClass = interface(JObjectClass)
  ['{067F2BCA-E49B-4119-899A-2EE36EA7874B}']
    { static Property Methods }

    { static Methods }
    {class} function init(value: Integer; startEnd: TJavaArray<Integer>; start: Integer; aend: Integer; rowNumber: Integer): JFinderPattern; cdecl; //(I[IIII)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/FinderPattern')]
  JFinderPattern = interface(JObject)
  ['{16F015D2-FCB8-4260-A07A-0E26F024F69F}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I
    function getStartEnd: TJavaArray<Integer>; cdecl; //()[I
    function getResultPoints: TJavaObjectArray<JResultPoint>; cdecl; //()[Lcom/google/zxing/ResultPoint;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJFinderPattern = class(TJavaGenericImport<JFinderPatternClass, JFinderPattern>) end;

  JPairClass = interface(JDataCharacterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/DataCharacter
  ['{F174B7C6-E799-4E38-A808-25274E0D4214}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/Pair')]
  JPair = interface(JDataCharacter) // or JObject // SuperSignature: com/google/zxing/oned/rss/DataCharacter
  ['{659EA51B-2F65-46A9-AED2-96388918C5AC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPair = class(TJavaGenericImport<JPairClass, JPair>) end;

  JRSS14ReaderClass = interface(JAbstractRSSReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/AbstractRSSReader
  ['{0DD56251-3123-4F47-92AA-AB2515125EE6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRSS14Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/RSS14Reader')]
  JRSS14Reader = interface(JAbstractRSSReader) // or JObject // SuperSignature: com/google/zxing/oned/rss/AbstractRSSReader
  ['{79D7D1B4-FD54-4FE4-9E0E-847FF0DB7AD9}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJRSS14Reader = class(TJavaGenericImport<JRSS14ReaderClass, JRSS14Reader>) end;

  JRSSUtilsClass = interface(JObjectClass)
  ['{5CF15FF0-38DA-40A1-B061-EC7C5B76BB33}']
    { static Property Methods }

    { static Methods }
    {class} function getRSSvalue(widths: TJavaArray<Integer>; maxWidth: Integer; noNarrow: Boolean): Integer; cdecl; //([IIZ)I

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/RSSUtils')]
  JRSSUtils = interface(JObject)
  ['{E6E3A34E-BAE4-46A9-BE6B-8B08A6864E1C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRSSUtils = class(TJavaGenericImport<JRSSUtilsClass, JRSSUtils>) end;

  JUPCAReaderClass = interface(JUPCEANReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{8A23DE53-DD49-4517-9F2F-5DCFB43D4F09}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCAReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCAReader')]
  JUPCAReader = interface(JUPCEANReader) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{9A3B6CD8-99C9-48F4-A079-78169A6C907E}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; startGuardRange: TJavaArray<Integer>; hints: JMap): JResult; cdecl; overload; //(ILcom/google/zxing/common/BitArray;[ILjava/util/Map;)Lcom/google/zxing/Result;
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; overload; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJUPCAReader = class(TJavaGenericImport<JUPCAReaderClass, JUPCAReader>) end;

  JUPCAWriterClass = interface(JObjectClass)
  ['{40099D00-9E16-45E2-8181-5D1C94FAC101}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCAWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCAWriter')]
  JUPCAWriter = interface(JObject)
  ['{1F6AC35B-9AC4-491F-A6DC-ABDD96C9F77B}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJUPCAWriter = class(TJavaGenericImport<JUPCAWriterClass, JUPCAWriter>) end;

  JUPCEANExtension2SupportClass = interface(JObjectClass)
  ['{EE4865C7-22AA-485C-AF89-05FD7A8B00EB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANExtension2Support')]
  JUPCEANExtension2Support = interface(JObject)
  ['{631E9564-8B78-42A7-B32E-878F52F4CCDB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUPCEANExtension2Support = class(TJavaGenericImport<JUPCEANExtension2SupportClass, JUPCEANExtension2Support>) end;

  JUPCEANExtension5SupportClass = interface(JObjectClass)
  ['{AAB258E1-9649-4B21-9D51-654CF0AA82E2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANExtension5Support')]
  JUPCEANExtension5Support = interface(JObject)
  ['{FFD72FCF-5ED2-416A-B63D-C1EDDA0C7249}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUPCEANExtension5Support = class(TJavaGenericImport<JUPCEANExtension5SupportClass, JUPCEANExtension5Support>) end;

  JUPCEANExtensionSupportClass = interface(JObjectClass)
  ['{C68D5EFC-3080-4F0A-BB3C-4BCB486719EC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANExtensionSupport')]
  JUPCEANExtensionSupport = interface(JObject)
  ['{BAAB0B4E-9E70-4D5B-918D-FF4B2D5365D7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUPCEANExtensionSupport = class(TJavaGenericImport<JUPCEANExtensionSupportClass, JUPCEANExtensionSupport>) end;


  JUPCEReaderClass = interface(JUPCEANReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{BA8928FC-EA94-4553-A2DF-D7571515DF59}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCEReader; cdecl; //()V
    {class} function convertUPCEtoUPCA(upce: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEReader')]
  JUPCEReader = interface(JUPCEANReader) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{B686CF65-F9FF-4EB2-BC51-556F78D9B83D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUPCEReader = class(TJavaGenericImport<JUPCEReaderClass, JUPCEReader>) end;

  JUPCEWriterClass = interface(JUPCEANWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANWriter
  ['{9485EF20-BC49-4D14-A4B6-1B89C66093DE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCEWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEWriter')]
  JUPCEWriter = interface(JUPCEANWriter) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANWriter
  ['{C5FDDBBA-9B68-459B-B47F-B8E782D72E1B}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJUPCEWriter = class(TJavaGenericImport<JUPCEWriterClass, JUPCEWriter>) end;

  JBarcodeMetadataClass = interface(JObjectClass)
  ['{2D2D7129-5F61-4940-8DE4-13D342BD9F26}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/BarcodeMetadata')]
  JBarcodeMetadata = interface(JObject)
  ['{703B60EF-05B6-4C5B-97D6-F951E40ABB3E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBarcodeMetadata = class(TJavaGenericImport<JBarcodeMetadataClass, JBarcodeMetadata>) end;

  JBarcodeValueClass = interface(JObjectClass)
  ['{C760389C-CF28-4423-97E7-20648324227B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/BarcodeValue')]
  JBarcodeValue = interface(JObject)
  ['{2B35AD9B-6036-4659-AA8D-B8ECB28CDA78}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBarcodeValue = class(TJavaGenericImport<JBarcodeValueClass, JBarcodeValue>) end;

  JBoundingBoxClass = interface(JObjectClass)
  ['{B3147B12-817B-434A-A1E0-2F9100A892D8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/BoundingBox')]
  JBoundingBox = interface(JObject)
  ['{EE3C14E9-F4C8-4E60-8AA9-6E7D2C32CD76}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBoundingBox = class(TJavaGenericImport<JBoundingBoxClass, JBoundingBox>) end;

  JCodewordClass = interface(JObjectClass)
  ['{CABB9995-6113-49A1-A120-A925E405559E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/Codeword')]
  JCodeword = interface(JObject)
  ['{14609052-0926-4AF9-994B-5CA17B301BFF}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCodeword = class(TJavaGenericImport<JCodewordClass, JCodeword>) end;

//  JDecodedBitStreamParser_1_191Class = interface(JObjectClass)
//  ['{D228EC1C-5BEE-47D5-B988-B49390A57133}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/pdf417/decoder/DecodedBitStreamParser$1')]
//  JDecodedBitStreamParser_1_191 = interface(JObject)
//  ['{5FC9808A-8858-4B75-A30E-663D4B53379E}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_1_191 = class(TJavaGenericImport<JDecodedBitStreamParser_1_191Class, JDecodedBitStreamParser_1_191>) end;

//  JDecodedBitStreamParser_Mode_192Class = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{907DF705-6F79-4F8A-BB08-6FACC49E06FF}']
//    { static Property Methods }
//    {class} function _GetALPHA: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
//    {class} function _GetLOWER: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
//    {class} function _GetMIXED: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
//    {class} function _GetPUNCT: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
//    {class} function _GetALPHA_SHIFT: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
//    {class} function _GetPUNCT_SHIFT: JDecodedBitStreamParser_Mode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
//
//    { static Methods }
//    {class} function values: TJavaObjectArray<JDecodedBitStreamParser_Mode>; cdecl; //()[Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
//    {class} function valueOf(name: JString): JDecodedBitStreamParser_Mode; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
//
//    { static Property }
//    {class} property ALPHA: JDecodedBitStreamParser_Mode read _GetALPHA;
//    {class} property LOWER: JDecodedBitStreamParser_Mode read _GetLOWER;
//    {class} property MIXED: JDecodedBitStreamParser_Mode read _GetMIXED;
//    {class} property PUNCT: JDecodedBitStreamParser_Mode read _GetPUNCT;
//    {class} property ALPHA_SHIFT: JDecodedBitStreamParser_Mode read _GetALPHA_SHIFT;
//    {class} property PUNCT_SHIFT: JDecodedBitStreamParser_Mode read _GetPUNCT_SHIFT;
//  end;

//  [JavaSignature('com/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode')]
//  JDecodedBitStreamParser_Mode_192 = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{C5098981-6E60-47E3-8B88-B56991BC531C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_Mode_192 = class(TJavaGenericImport<JDecodedBitStreamParser_Mode_192Class, JDecodedBitStreamParser_Mode_192>) end;

//  JDecodedBitStreamParser_193Class = interface(JObjectClass)
//  ['{9923F289-96FA-492A-AE27-23FCCC694054}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/pdf417/decoder/DecodedBitStreamParser')]
//  JDecodedBitStreamParser_193 = interface(JObject)
//  ['{1AC12AAA-A742-407F-AB2D-1F5601546569}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_193 = class(TJavaGenericImport<JDecodedBitStreamParser_193Class, JDecodedBitStreamParser_193>) end;

  JDetectionResultClass = interface(JObjectClass)
  ['{516009FC-12BD-4279-8E7F-DFAA6169F75E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DetectionResult')]
  JDetectionResult = interface(JObject)
  ['{511FCF97-7599-492A-8200-4BFCCF90BD11}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDetectionResult = class(TJavaGenericImport<JDetectionResultClass, JDetectionResult>) end;

  JDetectionResultColumnClass = interface(JObjectClass)
  ['{D3F23E9E-98A0-4436-B7DD-1F55022BA9F9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DetectionResultColumn')]
  JDetectionResultColumn = interface(JObject)
  ['{64C66C58-EBB9-4B66-9DF6-778AF29FB3AA}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDetectionResultColumn = class(TJavaGenericImport<JDetectionResultColumnClass, JDetectionResultColumn>) end;

  JDetectionResultRowIndicatorColumnClass = interface(JDetectionResultColumnClass) // or JObjectClass // SuperSignature: com/google/zxing/pdf417/decoder/DetectionResultColumn
  ['{54A67B22-AE96-43EC-B12A-5215ADBA76A9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn')]
  JDetectionResultRowIndicatorColumn = interface(JDetectionResultColumn) // or JObject // SuperSignature: com/google/zxing/pdf417/decoder/DetectionResultColumn
  ['{96C5A86F-EC30-408E-BCCB-72F587658872}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDetectionResultRowIndicatorColumn = class(TJavaGenericImport<JDetectionResultRowIndicatorColumnClass, JDetectionResultRowIndicatorColumn>) end;

//  JErrorCorrection_197Class = interface(JObjectClass)
//  ['{08AFFD86-A6E7-450E-B7D1-CE4C64BC943F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JErrorCorrection_197; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/pdf417/decoder/ec/ErrorCorrection')]
//  JErrorCorrection_197 = interface(JObject)
//  ['{74632264-D81F-42F8-8240-D817358D4418}']
//    { Property Methods }
//
//    { methods }
//    function decode(received: TJavaArray<Integer>; numECCodewords: Integer; erasures: TJavaArray<Integer>): Integer; cdecl; //([II[I)I
//
//    { Property }
//  end;

//  TJErrorCorrection_197 = class(TJavaGenericImport<JErrorCorrection_197Class, JErrorCorrection_197>) end;

  JModulusGFClass = interface(JObjectClass)
  ['{9A5DF17F-8B33-4DA1-92F9-A52D231E12A6}']
    { static Property Methods }
    {class} function _GetPDF417_GF: JModulusGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    { static Methods }

    { static Property }
    {class} property PDF417_GF: JModulusGF read _GetPDF417_GF;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/ec/ModulusGF')]
  JModulusGF = interface(JObject)
  ['{6FAF8278-C54A-4573-8B6E-F50CE7C475E0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJModulusGF = class(TJavaGenericImport<JModulusGFClass, JModulusGF>) end;

  JModulusPolyClass = interface(JObjectClass)
  ['{AC330A92-9233-43BA-B3CA-B568EDE40B23}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/ec/ModulusPoly')]
  JModulusPoly = interface(JObject)
  ['{B501F28E-E024-4E8B-92F9-C59A698A68BF}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJModulusPoly = class(TJavaGenericImport<JModulusPolyClass, JModulusPoly>) end;

  JPDF417CodewordDecoderClass = interface(JObjectClass)
  ['{0C2F615B-1966-405A-89EA-6F731236D1AD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/PDF417CodewordDecoder')]
  JPDF417CodewordDecoder = interface(JObject)
  ['{AECA5CD3-3B9F-41CD-823A-062E2ED0C54F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417CodewordDecoder = class(TJavaGenericImport<JPDF417CodewordDecoderClass, JPDF417CodewordDecoder>) end;

  JPDF417ScanningDecoderClass = interface(JObjectClass)
  ['{A3EDF975-EBC1-406A-92D4-6DC150489D33}']
    { static Property Methods }

    { static Methods }
    {class} function decode(image: JBitMatrix; imageTopLeft: JResultPoint; imageBottomLeft: JResultPoint; imageTopRight: JResultPoint; imageBottomRight: JResultPoint; minCodewordWidth: Integer; maxCodewordWidth: Integer): JDecoderResult; cdecl; //(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/common/DecoderResult;
    {class} function toString(barcodeMatrix: TJavaObjectArray<JBarcodeValue>): JString; cdecl; //([[Lcom/google/zxing/pdf417/decoder/BarcodeValue;)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/PDF417ScanningDecoder')]
  JPDF417ScanningDecoder = interface(JObject)
  ['{61D751E4-A399-4E77-B7D5-DF5454CD1CFC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417ScanningDecoder = class(TJavaGenericImport<JPDF417ScanningDecoderClass, JPDF417ScanningDecoder>) end;

//  JDetector_202Class = interface(JObjectClass)
//  ['{ED20F210-EA09-4877-AE81-5484A24A9C9A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function detect(image: JBinaryBitmap; hints: JMap; multiple: Boolean): JPDF417DetectorResult; cdecl; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Z)Lcom/google/zxing/pdf417/detector/PDF417DetectorResult;
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/pdf417/detector/Detector')]
//  JDetector_202 = interface(JObject)
//  ['{02D26019-6869-4088-9AFF-6957F6F025FC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDetector_202 = class(TJavaGenericImport<JDetector_202Class, JDetector_202>) end;

  JPDF417DetectorResultClass = interface(JObjectClass)
  ['{64E3A1E2-D120-49EC-A5F2-7974DE5CF5F3}']
    { static Property Methods }

    { static Methods }
    {class} function init(bits: JBitMatrix; points: JList): JPDF417DetectorResult; cdecl; //(Lcom/google/zxing/common/BitMatrix;Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/detector/PDF417DetectorResult')]
  JPDF417DetectorResult = interface(JObject)
  ['{DC22D8DE-CEE6-4189-9BEB-872F881A15C9}']
    { Property Methods }

    { methods }
    function getBits: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    function getPoints: JList; cdecl; //()Ljava/util/List;

    { Property }
  end;

  TJPDF417DetectorResult = class(TJavaGenericImport<JPDF417DetectorResultClass, JPDF417DetectorResult>) end;

  JBarcodeMatrixClass = interface(JObjectClass)
  ['{08461A46-B211-4AC9-8103-0481096C9878}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/BarcodeMatrix')]
  JBarcodeMatrix = interface(JObject)
  ['{DB8FF9E6-B3C4-45C6-A3D9-687C2EBE2DAA}']
    { Property Methods }

    { methods }
    function getMatrix: TJavaArray<TJavaArray<Byte>>; cdecl; //()[[B
    function getScaledMatrix(xScale: Integer; yScale: Integer): TJavaArray<TJavaArray<Byte>>; cdecl; //(II)[[B

    { Property }
  end;

  TJBarcodeMatrix = class(TJavaGenericImport<JBarcodeMatrixClass, JBarcodeMatrix>) end;

  JBarcodeRowClass = interface(JObjectClass)
  ['{7C007EFE-72B8-441D-992F-4762E9192375}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/BarcodeRow')]
  JBarcodeRow = interface(JObject)
  ['{0E4AE8EB-8EA8-4A09-A0FE-9FDA61698033}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBarcodeRow = class(TJavaGenericImport<JBarcodeRowClass, JBarcodeRow>) end;

  JCompactionClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{2E03DB70-5483-4091-AAB2-86DCF535DEF9}']
    { static Property Methods }
    {class} function _GetAUTO: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/encoder/Compaction;
    {class} function _GetTEXT: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/encoder/Compaction;
    {class} function _GetBYTE: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/encoder/Compaction;
    {class} function _GetNUMERIC: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/encoder/Compaction;

    { static Methods }
    {class} function values: TJavaObjectArray<JCompaction>; cdecl; //()[Lcom/google/zxing/pdf417/encoder/Compaction;
    {class} function valueOf(name: JString): JCompaction; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/pdf417/encoder/Compaction;

    { static Property }
    {class} property AUTO: JCompaction read _GetAUTO;
    {class} property TEXT: JCompaction read _GetTEXT;
    {class} property BYTE: JCompaction read _GetBYTE;
    {class} property NUMERIC: JCompaction read _GetNUMERIC;
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/Compaction')]
  JCompaction = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{CF55D93A-4D0F-4E32-A2C7-474A902EF768}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCompaction = class(TJavaGenericImport<JCompactionClass, JCompaction>) end;

  JDimensionsClass = interface(JObjectClass)
  ['{CAC3E2A2-FAA0-4E6F-B50D-89D9BEF82A64}']
    { static Property Methods }

    { static Methods }
    {class} function init(minCols: Integer; maxCols: Integer; minRows: Integer; maxRows: Integer): JDimensions; cdecl; //(IIII)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/Dimensions')]
  JDimensions = interface(JObject)
  ['{8383BD3E-E9F2-4E8E-B446-43712D9728DE}']
    { Property Methods }

    { methods }
    function getMinCols: Integer; cdecl; //()I
    function getMaxCols: Integer; cdecl; //()I
    function getMinRows: Integer; cdecl; //()I
    function getMaxRows: Integer; cdecl; //()I

    { Property }
  end;

  TJDimensions = class(TJavaGenericImport<JDimensionsClass, JDimensions>) end;

  JPDF417Class = interface(JObjectClass)
  ['{2D66AAB2-2520-4B8B-842B-B31D803C3106}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417; cdecl; overload; //()V
    {class} function init(compact: Boolean): JPDF417; cdecl; overload; //(Z)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417')]
  JPDF417 = interface(JObject)
  ['{CEE1103F-03AC-443E-A640-8130F079E403}']
    { Property Methods }

    { methods }
    function getBarcodeMatrix: JBarcodeMatrix; cdecl; //()Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;
    procedure generateBarcodeLogic(msg: JString; errorCorrectionLevel: Integer); cdecl; //(Ljava/lang/String;I)V
    procedure setDimensions(maxCols: Integer; minCols: Integer; maxRows: Integer; minRows: Integer); cdecl; //(IIII)V
    procedure setCompaction(compaction: JCompaction); cdecl; //(Lcom/google/zxing/pdf417/encoder/Compaction;)V
    procedure setCompact(compact: Boolean); cdecl; //(Z)V
    procedure setEncoding(encoding: JCharset); cdecl; //(Ljava/nio/charset/Charset;)V

    { Property }
  end;

  TJPDF417 = class(TJavaGenericImport<JPDF417Class, JPDF417>) end;

  JPDF417ErrorCorrectionClass = interface(JObjectClass)
  ['{C53B3691-8FB4-43C5-8B77-3565BC523D79}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417ErrorCorrection')]
  JPDF417ErrorCorrection = interface(JObject)
  ['{5847B2C4-3656-4627-B66F-AFE5FBC587FB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417ErrorCorrection = class(TJavaGenericImport<JPDF417ErrorCorrectionClass, JPDF417ErrorCorrection>) end;

//  JPDF417HighLevelEncoder_1Class = interface(JObjectClass)
//  ['{82CC4084-38EB-4592-9F7C-A12DA51F06AB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417HighLevelEncoder$1')]
//  JPDF417HighLevelEncoder_1 = interface(JObject)
//  ['{3DCE0BF7-F5DE-4A84-94DF-1DF6FB1FF677}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJPDF417HighLevelEncoder_1 = class(TJavaGenericImport<JPDF417HighLevelEncoder_1Class, JPDF417HighLevelEncoder_1>) end;

  JPDF417HighLevelEncoderClass = interface(JObjectClass)
  ['{59A95E74-5EE5-4F52-8691-F51B373BEE6D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417HighLevelEncoder')]
  JPDF417HighLevelEncoder = interface(JObject)
  ['{966E3DCB-C58E-4E50-98D1-E2DB343EE00F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417HighLevelEncoder = class(TJavaGenericImport<JPDF417HighLevelEncoderClass, JPDF417HighLevelEncoder>) end;

  JPDF417CommonClass = interface(JObjectClass)
  ['{F3442077-05D4-4D1B-9649-CF0D157D3CEA}']
    { static Property Methods }
    {class} function _GetNUMBER_OF_CODEWORDS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMAX_CODEWORDS_IN_BARCODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMIN_ROWS_IN_BARCODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMAX_ROWS_IN_BARCODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMODULES_IN_CODEWORD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetMODULES_IN_STOP_PATTERN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBARS_IN_MODULE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetSYMBOL_TABLE: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //[I

    { static Methods }
    {class} function getBitCountSum(moduleBitCount: TJavaArray<Integer>): Integer; cdecl; //Deprecated //([I)I
    {class} function toIntArray(list: JCollection): TJavaArray<Integer>; cdecl; //(Ljava/util/Collection;)[I
    {class} function getCodeword(symbol: Integer): Integer; cdecl; //(I)I

    { static Property }
    {class} property NUMBER_OF_CODEWORDS: Integer read _GetNUMBER_OF_CODEWORDS;
    {class} property MAX_CODEWORDS_IN_BARCODE: Integer read _GetMAX_CODEWORDS_IN_BARCODE;
    {class} property MIN_ROWS_IN_BARCODE: Integer read _GetMIN_ROWS_IN_BARCODE;
    {class} property MAX_ROWS_IN_BARCODE: Integer read _GetMAX_ROWS_IN_BARCODE;
    {class} property MODULES_IN_CODEWORD: Integer read _GetMODULES_IN_CODEWORD;
    {class} property MODULES_IN_STOP_PATTERN: Integer read _GetMODULES_IN_STOP_PATTERN;
    {class} property BARS_IN_MODULE: Integer read _GetBARS_IN_MODULE;
    {class} property SYMBOL_TABLE: TJavaArray<Integer> read _GetSYMBOL_TABLE;
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417Common')]
  JPDF417Common = interface(JObject)
  ['{624AE9AA-FF76-49E4-8E62-EB8FB0BE4FA3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417Common = class(TJavaGenericImport<JPDF417CommonClass, JPDF417Common>) end;

  JPDF417ReaderClass = interface(JObjectClass)
  ['{1E4EA2BD-8C65-4DC8-A381-1B018465CC61}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417Reader')]
  JPDF417Reader = interface(JObject)
  ['{76488151-D4AF-4586-B35B-97689F578E91}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    function decodeMultiple(image: JBinaryBitmap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    function decodeMultiple(image: JBinaryBitmap; hints: JMap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJPDF417Reader = class(TJavaGenericImport<JPDF417ReaderClass, JPDF417Reader>) end;

  JPDF417ResultMetadataClass = interface(JObjectClass)
  ['{49527A18-F5F0-44E1-B476-9B20531D68CC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417ResultMetadata; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417ResultMetadata')]
  JPDF417ResultMetadata = interface(JObject)
  ['{B9B9832D-10CA-4E1B-A6AF-1351EC12F53D}']
    { Property Methods }

    { methods }
    function getSegmentIndex: Integer; cdecl; //()I
    procedure setSegmentIndex(segmentIndex: Integer); cdecl; //(I)V
    function getFileId: JString; cdecl; //()Ljava/lang/String;
    procedure setFileId(fileId: JString); cdecl; //(Ljava/lang/String;)V
    function getOptionalData: TJavaArray<Integer>; cdecl; //Deprecated //()[I
    procedure setOptionalData(optionalData: TJavaArray<Integer>); cdecl; //Deprecated //([I)V
    function isLastSegment: Boolean; cdecl; //()Z
    procedure setLastSegment(lastSegment: Boolean); cdecl; //(Z)V
    function getSegmentCount: Integer; cdecl; //()I
    procedure setSegmentCount(segmentCount: Integer); cdecl; //(I)V
    function getSender: JString; cdecl; //()Ljava/lang/String;
    procedure setSender(sender: JString); cdecl; //(Ljava/lang/String;)V
    function getAddressee: JString; cdecl; //()Ljava/lang/String;
    procedure setAddressee(addressee: JString); cdecl; //(Ljava/lang/String;)V
    function getFileName: JString; cdecl; //()Ljava/lang/String;
    procedure setFileName(fileName: JString); cdecl; //(Ljava/lang/String;)V
    function getFileSize: Int64; cdecl; //()J
    procedure setFileSize(fileSize: Int64); cdecl; //(J)V
    function getChecksum: Integer; cdecl; //()I
    procedure setChecksum(checksum: Integer); cdecl; //(I)V
    function getTimestamp: Int64; cdecl; //()J
    procedure setTimestamp(timestamp: Int64); cdecl; //(J)V

    { Property }
  end;

  TJPDF417ResultMetadata = class(TJavaGenericImport<JPDF417ResultMetadataClass, JPDF417ResultMetadata>) end;

  JPDF417WriterClass = interface(JObjectClass)
  ['{55859FE6-D7E9-40F8-B9D8-2CB888C8C0D5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417Writer')]
  JPDF417Writer = interface(JObject)
  ['{75DC70E6-E72C-48E8-8A60-EA97B7DD80A0}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJPDF417Writer = class(TJavaGenericImport<JPDF417WriterClass, JPDF417Writer>) end;

  JPlanarYUVLuminanceSourceClass = interface(JLuminanceSourceClass) // or JObjectClass // SuperSignature: com/google/zxing/LuminanceSource
  ['{17477F9C-724F-4282-B403-A8F07FBD77B9}']
    { static Property Methods }

    { static Methods }
    {class} function init(yuvData: TJavaArray<Byte>; dataWidth: Integer; dataHeight: Integer; left: Integer; top: Integer; width: Integer; height: Integer; reverseHorizontal: Boolean): JPlanarYUVLuminanceSource; cdecl; //([BIIIIIIZ)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/PlanarYUVLuminanceSource')]
  JPlanarYUVLuminanceSource = interface(JLuminanceSource) // or JObject // SuperSignature: com/google/zxing/LuminanceSource
  ['{9D38D02E-91D2-4E96-A2D8-3036FCA70FFF}']
    { Property Methods }

    { methods }
    function getRow(y: Integer; row: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; //(I[B)[B
    function getMatrix: TJavaArray<Byte>; cdecl; //()[B
    function isCropSupported: Boolean; cdecl; //()Z
    function crop(left: Integer; top: Integer; width: Integer; height: Integer): JLuminanceSource; cdecl; //(IIII)Lcom/google/zxing/LuminanceSource;
    function renderThumbnail: TJavaArray<Integer>; cdecl; //()[I
    function getThumbnailWidth: Integer; cdecl; //()I
    function getThumbnailHeight: Integer; cdecl; //()I

    { Property }
  end;

  TJPlanarYUVLuminanceSource = class(TJavaGenericImport<JPlanarYUVLuminanceSourceClass, JPlanarYUVLuminanceSource>) end;

//  JBitMatrixParser_217Class = interface(JObjectClass)
//  ['{FD58E26C-8504-4647-A4A4-507F90CA25A0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/BitMatrixParser')]
//  JBitMatrixParser_217 = interface(JObject)
//  ['{C3598DA1-4649-4B26-833B-FA8CEDD72DC4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJBitMatrixParser_217 = class(TJavaGenericImport<JBitMatrixParser_217Class, JBitMatrixParser_217>) end;

//  JDataBlock_218Class = interface(JObjectClass)
//  ['{31BA983F-A380-4C1C-9689-B5E6477FF88B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DataBlock')]
//  JDataBlock_218 = interface(JObject)
//  ['{CDA7CF0A-0A36-4608-9EF1-D14F267777D4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDataBlock_218 = class(TJavaGenericImport<JDataBlock_218Class, JDataBlock_218>) end;

//  JDataMask_1Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{0D7EAF60-0FF1-4749-9DB8-55DA759AEB5C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$1')]
//  JDataMask_1 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{D84E5F92-FAAD-4FDC-A941-56A2AC015B32}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDataMask_1 = class(TJavaGenericImport<JDataMask_1Class, JDataMask_1>) end;

//  JDataMask_2Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{B22FCF11-4071-499F-B5C4-66D565378B06}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$2')]
//  JDataMask_2 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{9A4656E2-D0F0-4835-B8D4-72A25C0A6AD3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDataMask_2 = class(TJavaGenericImport<JDataMask_2Class, JDataMask_2>) end;

//  JDataMask_3Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{5B1A272C-4E5B-4EE2-86B7-6BECA4E0AE07}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$3')]
//  JDataMask_3 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{3D15B376-E3AF-4C58-A755-8ACA840CA918}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDataMask_3 = class(TJavaGenericImport<JDataMask_3Class, JDataMask_3>) end;

//  JDataMask_4Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{48B99DE7-3185-4710-9F1A-5D405CA91057}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$4')]
//  JDataMask_4 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{C99202B7-3638-41A0-9E7C-2407FF855AD4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDataMask_4 = class(TJavaGenericImport<JDataMask_4Class, JDataMask_4>) end;

//  JDataMask_5Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{4D6801D2-B1F8-44EE-B43B-4610F1259CF4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$5')]
//  JDataMask_5 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{BE52E2A8-7B49-4DF1-946F-F2F57454625B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDataMask_5 = class(TJavaGenericImport<JDataMask_5Class, JDataMask_5>) end;

//  JDataMask_6Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{F216B363-7A6C-4E5C-BD90-8300BE8D0BF8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$6')]
//  JDataMask_6 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{09AB86E3-48DB-4821-95E8-F479CDCEC680}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDataMask_6 = class(TJavaGenericImport<JDataMask_6Class, JDataMask_6>) end;

//  JDataMask_7Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{85003245-AF9E-41A8-AB6D-8ED01DBFA7DA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$7')]
//  JDataMask_7 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{D2E31893-E8BD-4609-A178-0A9912EA6940}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDataMask_7 = class(TJavaGenericImport<JDataMask_7Class, JDataMask_7>) end;

//  JDataMask_8Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{1CD611CA-DE37-46E1-9596-CE0F7145E305}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$8')]
//  JDataMask_8 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
//  ['{09A7221F-5E34-4B89-8698-CF412E179812}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDataMask_8 = class(TJavaGenericImport<JDataMask_8Class, JDataMask_8>) end;

  JDataMaskClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{785474F6-6CF6-49C5-A98F-02F861DFB3F1}']
    { static Property Methods }
    {class} function _GetDATA_MASK_000: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/DataMask;
    {class} function _GetDATA_MASK_001: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/DataMask;
    {class} function _GetDATA_MASK_010: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/DataMask;
    {class} function _GetDATA_MASK_011: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/DataMask;
    {class} function _GetDATA_MASK_100: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/DataMask;
    {class} function _GetDATA_MASK_101: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/DataMask;
    {class} function _GetDATA_MASK_110: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/DataMask;
    {class} function _GetDATA_MASK_111: JDataMask;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/DataMask;

    { static Methods }
    {class} function values: TJavaObjectArray<JDataMask>; cdecl; //()[Lcom/google/zxing/qrcode/decoder/DataMask;
    {class} function valueOf(name: JString): JDataMask; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/DataMask;

    { static Property }
    {class} property DATA_MASK_000: JDataMask read _GetDATA_MASK_000;
    {class} property DATA_MASK_001: JDataMask read _GetDATA_MASK_001;
    {class} property DATA_MASK_010: JDataMask read _GetDATA_MASK_010;
    {class} property DATA_MASK_011: JDataMask read _GetDATA_MASK_011;
    {class} property DATA_MASK_100: JDataMask read _GetDATA_MASK_100;
    {class} property DATA_MASK_101: JDataMask read _GetDATA_MASK_101;
    {class} property DATA_MASK_110: JDataMask read _GetDATA_MASK_110;
    {class} property DATA_MASK_111: JDataMask read _GetDATA_MASK_111;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask')]
  JDataMask = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{093519AD-A36A-4174-BB10-3014E1ACD968}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataMask = class(TJavaGenericImport<JDataMaskClass, JDataMask>) end;

//  JDecodedBitStreamParser_1_228Class = interface(JObjectClass)
//  ['{ED95ABD5-3A14-4D80-ABAE-7D3132C6D392}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DecodedBitStreamParser$1')]
//  JDecodedBitStreamParser_1_228 = interface(JObject)
//  ['{9CC39330-EE70-4FC3-A352-38DCA0F3AB87}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_1_228 = class(TJavaGenericImport<JDecodedBitStreamParser_1_228Class, JDecodedBitStreamParser_1_228>) end;

//  JDecodedBitStreamParser_229Class = interface(JObjectClass)
//  ['{CA3001D1-5F34-4390-93C6-8A7C704A996F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DecodedBitStreamParser')]
//  JDecodedBitStreamParser_229 = interface(JObject)
//  ['{8FA1B7D9-5158-4D92-B530-8F9F50BDD854}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_229 = class(TJavaGenericImport<JDecodedBitStreamParser_229Class, JDecodedBitStreamParser_229>) end;

//  JDecoder_230Class = interface(JObjectClass)
//  ['{28A37E06-8814-45A4-8BCD-C0E110BE1123}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDecoder_230; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/Decoder')]
//  JDecoder_230 = interface(JObject)
//  ['{9FA68C0C-436B-43FC-B177-81F989014E19}']
//    { Property Methods }
//
//    { methods }
//    function decode(image: TJavaArray<Boolean>): JDecoderResult; cdecl; overload; //([[Z)Lcom/google/zxing/common/DecoderResult;
//    function decode(image: TJavaArray<Boolean>; hints: JMap): JDecoderResult; cdecl; overload; //([[ZLjava/util/Map;)Lcom/google/zxing/common/DecoderResult;
//    function decode(bits: JBitMatrix): JDecoderResult; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
//    function decode(bits: JBitMatrix; hints: JMap): JDecoderResult; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
//
//    { Property }
//  end;

//  TJDecoder_230 = class(TJavaGenericImport<JDecoder_230Class, JDecoder_230>) end;

  JErrorCorrectionLevelClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{72A37410-AF48-4247-BFA3-2FA9AFAECCCE}']
    { static Property Methods }
    {class} function _GetL: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    {class} function _GetM: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    {class} function _GetQ: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    {class} function _GetH: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    { static Methods }
    {class} function values: TJavaObjectArray<JErrorCorrectionLevel>; cdecl; //()[Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    {class} function valueOf(name: JString): JErrorCorrectionLevel; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    {class} function forBits(bits: Integer): JErrorCorrectionLevel; cdecl; //(I)Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    { static Property }
    {class} property L: JErrorCorrectionLevel read _GetL;
    {class} property M: JErrorCorrectionLevel read _GetM;
    {class} property Q: JErrorCorrectionLevel read _GetQ;
    {class} property H: JErrorCorrectionLevel read _GetH;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/ErrorCorrectionLevel')]
  JErrorCorrectionLevel = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{A994CACF-F007-4C23-98C5-58704CD8F351}']
    { Property Methods }

    { methods }
    function getBits: Integer; cdecl; //()I

    { Property }
  end;

  TJErrorCorrectionLevel = class(TJavaGenericImport<JErrorCorrectionLevelClass, JErrorCorrectionLevel>) end;

  JFormatInformationClass = interface(JObjectClass)
  ['{CA648272-ECF2-4EC6-ACC9-69E50E33205B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/FormatInformation')]
  JFormatInformation = interface(JObject)
  ['{E8E07F86-6320-4DDD-93A9-D34A77BD7B9A}']
    { Property Methods }

    { methods }
    function hashCode: Integer; cdecl; //()I
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z

    { Property }
  end;

  TJFormatInformation = class(TJavaGenericImport<JFormatInformationClass, JFormatInformation>) end;

  JModeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{9ED66598-1915-44EB-963C-360690D08AC0}']
    { static Property Methods }
    {class} function _GetTERMINATOR: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function _GetNUMERIC: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function _GetALPHANUMERIC: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function _GetSTRUCTURED_APPEND: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function _GetBYTE: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function _GetECI: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function _GetKANJI: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function _GetFNC1_FIRST_POSITION: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function _GetFNC1_SECOND_POSITION: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function _GetHANZI: JMode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/Mode;

    { static Methods }
    {class} function values: TJavaObjectArray<JMode>; cdecl; //()[Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function valueOf(name: JString): JMode; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function forBits(bits: Integer): JMode; cdecl; //(I)Lcom/google/zxing/qrcode/decoder/Mode;

    { static Property }
    {class} property TERMINATOR: JMode read _GetTERMINATOR;
    {class} property NUMERIC: JMode read _GetNUMERIC;
    {class} property ALPHANUMERIC: JMode read _GetALPHANUMERIC;
    {class} property STRUCTURED_APPEND: JMode read _GetSTRUCTURED_APPEND;
    {class} property BYTE: JMode read _GetBYTE;
    {class} property ECI: JMode read _GetECI;
    {class} property KANJI: JMode read _GetKANJI;
    {class} property FNC1_FIRST_POSITION: JMode read _GetFNC1_FIRST_POSITION;
    {class} property FNC1_SECOND_POSITION: JMode read _GetFNC1_SECOND_POSITION;
    {class} property HANZI: JMode read _GetHANZI;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/Mode')]
  JMode = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{0E699046-C8E0-45BB-AD67-51CEF7CAA62C}']
    { Property Methods }

    { methods }
    function getCharacterCountBits(version: JVersion): Integer; cdecl; //(Lcom/google/zxing/qrcode/decoder/Version;)I
    function getBits: Integer; cdecl; //()I

    { Property }
  end;

  TJMode = class(TJavaGenericImport<JModeClass, JMode>) end;

  JQRCodeDecoderMetaDataClass = interface(JObjectClass)
  ['{239AFE9A-C5CB-419F-9000-0F2522C5F331}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/QRCodeDecoderMetaData')]
  JQRCodeDecoderMetaData = interface(JObject)
  ['{C393AA6A-09E2-4AFA-A581-46671C4D2C94}']
    { Property Methods }

    { methods }
    function isMirrored: Boolean; cdecl; //()Z
    procedure applyMirroredCorrection(points: TJavaObjectArray<JResultPoint>); cdecl; //([Lcom/google/zxing/ResultPoint;)V

    { Property }
  end;

  TJQRCodeDecoderMetaData = class(TJavaGenericImport<JQRCodeDecoderMetaDataClass, JQRCodeDecoderMetaData>) end;

//  JVersion_ECB_235Class = interface(JObjectClass)
//  ['{489B297A-0FF3-4231-AA8E-52CF7B5F28B5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/Version$ECB')]
//  JVersion_ECB_235 = interface(JObject)
//  ['{9084BE5F-D6F9-4EE8-8F4F-EBBA8269D0E9}']
//    { Property Methods }
//
//    { methods }
//    function getCount: Integer; cdecl; //()I
//    function getDataCodewords: Integer; cdecl; //()I
//
//    { Property }
//  end;

//  TJVersion_ECB_235 = class(TJavaGenericImport<JVersion_ECB_235Class, JVersion_ECB_235>) end;

//  JVersion_ECBlocks_236Class = interface(JObjectClass)
//  ['{01ECD4DA-7F3B-4E6B-BE2C-314AC7567ADE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/Version$ECBlocks')]
//  JVersion_ECBlocks_236 = interface(JObject)
//  ['{E29412E0-AAAA-4024-B4EF-01D920D5F254}']
//    { Property Methods }
//
//    { methods }
//    function getECCodewordsPerBlock: Integer; cdecl; //()I
//    function getNumBlocks: Integer; cdecl; //()I
//    function getTotalECCodewords: Integer; cdecl; //()I
//    function getECBlocks: TJavaObjectArray<JVersion_ECB>; cdecl; //()[Lcom/google/zxing/qrcode/decoder/Version$ECB;
//
//    { Property }
//  end;

//  TJVersion_ECBlocks_236 = class(TJavaGenericImport<JVersion_ECBlocks_236Class, JVersion_ECBlocks_236>) end;

//  JVersion_237Class = interface(JObjectClass)
//  ['{44F3B4F9-BFAE-424C-A4E4-894F04B06536}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function getProvisionalVersionForDimension(dimension: Integer): JVersion; cdecl; //(I)Lcom/google/zxing/qrcode/decoder/Version;
//    {class} function getVersionForNumber(versionNumber: Integer): JVersion; cdecl; //(I)Lcom/google/zxing/qrcode/decoder/Version;
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/Version')]
//  JVersion_237 = interface(JObject)
//  ['{8C78565B-7701-4A0F-A329-89A9E6B3F370}']
//    { Property Methods }
//
//    { methods }
//    function getVersionNumber: Integer; cdecl; //()I
//    function getAlignmentPatternCenters: TJavaArray<Integer>; cdecl; //()[I
//    function getTotalCodewords: Integer; cdecl; //()I
//    function getDimensionForVersion: Integer; cdecl; //()I
//    function getECBlocksForLevel(ecLevel: JErrorCorrectionLevel): JVersion_ECBlocks; cdecl; //(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;

//  TJVersion_237 = class(TJavaGenericImport<JVersion_237Class, JVersion_237>) end;




  JResultPointClass = interface(JObjectClass)
  ['{48497949-D253-43FD-B6D5-5174A8CD488D}']
    { static Property Methods }

    { static Methods }
    {class} function init(x: Single; y: Single): JResultPoint; cdecl; //(FF)V
    {class} procedure orderBestPatterns(patterns: TJavaObjectArray<JResultPoint>); cdecl; //([Lcom/google/zxing/ResultPoint;)V
    {class} function distance(pattern1: JResultPoint; pattern2: JResultPoint): Single; cdecl; //(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    { static Property }
  end;

  [JavaSignature('com/google/zxing/ResultPoint')]
  JResultPoint = interface(JObject)
  ['{57C7F208-4081-4665-9A67-BC9DAA423D61}']
    { Property Methods }

    { methods }
    function getX: Single; cdecl; //()F
    function getY: Single; cdecl; //()F
    function equals(other: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJResultPoint = class(TJavaGenericImport<JResultPointClass, JResultPoint>) end;




  JAlignmentPatternClass = interface(JResultPointClass) // or JObjectClass // SuperSignature: com/google/zxing/ResultPoint
  ['{FA84A12C-AD68-4044-A9AF-3BA1EA6889A9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/AlignmentPattern')]
  JAlignmentPattern = interface(JResultPoint) // or JObject // SuperSignature: com/google/zxing/ResultPoint
  ['{2CF7347A-9313-44D5-848D-D984589F8061}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAlignmentPattern = class(TJavaGenericImport<JAlignmentPatternClass, JAlignmentPattern>) end;

  JAlignmentPatternFinderClass = interface(JObjectClass)
  ['{F8D4EC9F-2334-4463-95BD-65115B219D0E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/AlignmentPatternFinder')]
  JAlignmentPatternFinder = interface(JObject)
  ['{EE3D7514-B510-4502-90BC-3E3547EADF4C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAlignmentPatternFinder = class(TJavaGenericImport<JAlignmentPatternFinderClass, JAlignmentPatternFinder>) end;

//  JDetector_240Class = interface(JObjectClass)
//  ['{6A63A282-C7BB-4D80-8DE9-F2BD8704218F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(image: JBitMatrix): JDetector_240; cdecl; //(Lcom/google/zxing/common/BitMatrix;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/detector/Detector')]
//  JDetector_240 = interface(JObject)
//  ['{142B0408-C62D-4CA4-A951-890E74B148A0}']
//    { Property Methods }
//
//    { methods }
//    function detect: JDetectorResult; cdecl; overload; //()Lcom/google/zxing/common/DetectorResult;
//    function detect(hints: JMap): JDetectorResult; cdecl; overload; //(Ljava/util/Map;)Lcom/google/zxing/common/DetectorResult;
//
//    { Property }
//  end;

//  TJDetector_240 = class(TJavaGenericImport<JDetector_240Class, JDetector_240>) end;

//  JFinderPattern_241Class = interface(JResultPointClass) // or JObjectClass // SuperSignature: com/google/zxing/ResultPoint
//  ['{6A649FBB-AA18-4045-B3C1-F2059CACA0A9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/detector/FinderPattern')]
//  JFinderPattern_241 = interface(JResultPoint) // or JObject // SuperSignature: com/google/zxing/ResultPoint
//  ['{11FE8954-7DF3-4889-AF3E-78738D30AF2A}']
//    { Property Methods }
//
//    { methods }
//    function getEstimatedModuleSize: Single; cdecl; //()F
//
//    { Property }
//  end;

//  TJFinderPattern_241 = class(TJavaGenericImport<JFinderPattern_241Class, JFinderPattern_241>) end;

//  JFinderPatternFinder_1Class = interface(JObjectClass)
//  ['{096410F4-C87F-40F5-A6A6-0214E4690A2C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternFinder$1')]
//  JFinderPatternFinder_1 = interface(JObject)
//  ['{36D9DE2A-2B05-4FD8-940B-5633C7C9EEF0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJFinderPatternFinder_1 = class(TJavaGenericImport<JFinderPatternFinder_1Class, JFinderPatternFinder_1>) end;

  JFinderPatternFinder_EstimatedModuleComparatorClass = interface(JObjectClass)
  ['{998C13D7-DFA7-43B5-A283-15BC3E1888EA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternFinder$EstimatedModuleComparator')]
  JFinderPatternFinder_EstimatedModuleComparator = interface(JObject)
  ['{92B1BAE4-84AE-4289-8637-2CAF79BFA7B3}']
    { Property Methods }

    { methods }
    function compare(center1: JFinderPattern; center2: JFinderPattern): Integer; cdecl; overload; //(Lcom/google/zxing/qrcode/detector/FinderPattern;Lcom/google/zxing/qrcode/detector/FinderPattern;)I
    function compare(this: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I

    { Property }
  end;

  TJFinderPatternFinder_EstimatedModuleComparator = class(TJavaGenericImport<JFinderPatternFinder_EstimatedModuleComparatorClass, JFinderPatternFinder_EstimatedModuleComparator>) end;


  JFinderPatternInfoClass = interface(JObjectClass)
  ['{A32832BA-23AF-4112-B1EC-9F776E77234A}']
    { static Property Methods }

    { static Methods }
    {class} function init(patternCenters: TJavaObjectArray<JFinderPattern>): JFinderPatternInfo; cdecl; //([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternInfo')]
  JFinderPatternInfo = interface(JObject)
  ['{6A986D88-F59A-4748-B48E-94ADB09FF4EC}']
    { Property Methods }

    { methods }
    function getBottomLeft: JFinderPattern; cdecl; //()Lcom/google/zxing/qrcode/detector/FinderPattern;
    function getTopLeft: JFinderPattern; cdecl; //()Lcom/google/zxing/qrcode/detector/FinderPattern;
    function getTopRight: JFinderPattern; cdecl; //()Lcom/google/zxing/qrcode/detector/FinderPattern;

    { Property }
  end;

  TJFinderPatternInfo = class(TJavaGenericImport<JFinderPatternInfoClass, JFinderPatternInfo>) end;

  JBlockPairClass = interface(JObjectClass)
  ['{366A4F5A-D615-484C-914C-3295B8EE55CF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/BlockPair')]
  JBlockPair = interface(JObject)
  ['{61DAA2E2-03B6-4ED0-8944-DEE2FD6AC28C}']
    { Property Methods }

    { methods }
    function getDataBytes: TJavaArray<Byte>; cdecl; //()[B
    function getErrorCorrectionBytes: TJavaArray<Byte>; cdecl; //()[B

    { Property }
  end;

  TJBlockPair = class(TJavaGenericImport<JBlockPairClass, JBlockPair>) end;

  JByteMatrixClass = interface(JObjectClass)
  ['{7BDA53C8-7271-4F59-8B15-A2658CA5E932}']
    { static Property Methods }

    { static Methods }
    {class} function init(width: Integer; height: Integer): JByteMatrix; cdecl; //(II)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/ByteMatrix')]
  JByteMatrix = interface(JObject)
  ['{B7526B15-2335-4E66-9912-B776856891CA}']
    { Property Methods }

    { methods }
    function getHeight: Integer; cdecl; //()I
    function getWidth: Integer; cdecl; //()I
    function get(x: Integer; y: Integer): Byte; cdecl; //(II)B
    function getArray: TJavaArray<TJavaArray<Byte>>; cdecl; //()[[B
    procedure &set(x: Integer; y: Integer; value: Byte); cdecl; overload; //(IIB)V
    procedure &set(x: Integer; y: Integer; value: Integer); cdecl; overload; //(III)V
    procedure &set(x: Integer; y: Integer; value: Boolean); cdecl; overload; //(IIZ)V
    procedure clear(value: Byte); cdecl; //(B)V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJByteMatrix = class(TJavaGenericImport<JByteMatrixClass, JByteMatrix>) end;

//  JEncoder_1Class = interface(JObjectClass)
//  ['{9B5086E0-02CC-4BA8-9CF5-F96EE2FF576B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/encoder/Encoder$1')]
//  JEncoder_1 = interface(JObject)
//  ['{5D4F08F9-0650-487F-873F-35B9DB75E9B5}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJEncoder_1 = class(TJavaGenericImport<JEncoder_1Class, JEncoder_1>) end;

//  JEncoder_249Class = interface(JObjectClass)
//  ['{7EA4881E-4E36-4F14-9AE1-585E3082EEF0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function encode(content: JString; ecLevel: JErrorCorrectionLevel): JQRCode; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/encoder/QRCode;
//    {class} function encode(content: JString; ecLevel: JErrorCorrectionLevel; hints: JMap): JQRCode; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/qrcode/encoder/QRCode;
//    {class} function chooseMode(content: JString): JMode; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/encoder/Encoder')]
//  JEncoder_249 = interface(JObject)
//  ['{71FC9781-3903-4BE9-A405-B7C31B369C00}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJEncoder_249 = class(TJavaGenericImport<JEncoder_249Class, JEncoder_249>) end;

  JMaskUtilClass = interface(JObjectClass)
  ['{945E42C3-D09F-435D-8B8A-C2D2E74EEFBC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MaskUtil')]
  JMaskUtil = interface(JObject)
  ['{214CB66E-4F44-4CEA-BC87-447E07780E05}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMaskUtil = class(TJavaGenericImport<JMaskUtilClass, JMaskUtil>) end;

  JMatrixUtilClass = interface(JObjectClass)
  ['{711CC7AA-BD69-45A0-9781-88E6ED36F436}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MatrixUtil')]
  JMatrixUtil = interface(JObject)
  ['{92BA8F48-F0BE-4A3B-AF18-67EA4ADE3C22}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMatrixUtil = class(TJavaGenericImport<JMatrixUtilClass, JMatrixUtil>) end;

  JQRCodeClass = interface(JObjectClass)
  ['{9E0D0C12-1E50-4EFA-B546-F3F2B7D3D98C}']
    { static Property Methods }
    {class} function _GetNUM_MASK_PATTERNS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JQRCode; cdecl; //()V
    {class} function isValidMaskPattern(maskPattern: Integer): Boolean; cdecl; //(I)Z

    { static Property }
    {class} property NUM_MASK_PATTERNS: Integer read _GetNUM_MASK_PATTERNS;
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/QRCode')]
  JQRCode = interface(JObject)
  ['{1981340E-1B82-40B6-B3E2-8FD2A67E9C7B}']
    { Property Methods }

    { methods }
    function getMode: JMode; cdecl; //()Lcom/google/zxing/qrcode/decoder/Mode;
    function getECLevel: JErrorCorrectionLevel; cdecl; //()Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    function getVersion: JVersion; cdecl; //()Lcom/google/zxing/qrcode/decoder/Version;
    function getMaskPattern: Integer; cdecl; //()I
    function getMatrix: JByteMatrix; cdecl; //()Lcom/google/zxing/qrcode/encoder/ByteMatrix;
    function toString: JString; cdecl; //()Ljava/lang/String;
    procedure setMode(value: JMode); cdecl; //(Lcom/google/zxing/qrcode/decoder/Mode;)V
    procedure setECLevel(value: JErrorCorrectionLevel); cdecl; //(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)V
    procedure setVersion(version: JVersion); cdecl; //(Lcom/google/zxing/qrcode/decoder/Version;)V
    procedure setMaskPattern(value: Integer); cdecl; //(I)V
    procedure setMatrix(value: JByteMatrix); cdecl; //(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    { Property }
  end;

  TJQRCode = class(TJavaGenericImport<JQRCodeClass, JQRCode>) end;

  JQRCodeWriterClass = interface(JObjectClass)
  ['{342C71C6-9547-409B-8983-06F885373F2A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JQRCodeWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/QRCodeWriter')]
  JQRCodeWriter = interface(JObject)
  ['{317278CE-B331-46BB-919E-F49035EE3610}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJQRCodeWriter = class(TJavaGenericImport<JQRCodeWriterClass, JQRCodeWriter>) end;

  JReaderClass = interface(JObjectClass)
  ['{86F40C77-AC43-4A6B-A643-7DE4EA3E79E9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/Reader')]
  JReader = interface(IJavaInstance)
  ['{38C7A493-5FC2-4CD4-8A14-F0E867B3E7EF}']
    { Property Methods }

    { methods }
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJReader = class(TJavaGenericImport<JReaderClass, JReader>) end;


  JResultClass = interface(JObjectClass)
  ['{7E0B1124-AEBF-4C12-B371-7515876358BD}']
    { static Property Methods }

    { static Methods }
    {class} function init(text: JString; rawBytes: TJavaArray<Byte>; resultPoints: TJavaObjectArray<JResultPoint>; format: JBarcodeFormat): JResult; cdecl; overload; //(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V
    {class} function init(text: JString; rawBytes: TJavaArray<Byte>; resultPoints: TJavaObjectArray<JResultPoint>; format: JBarcodeFormat; timestamp: Int64): JResult; cdecl; overload; //(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;J)V
    {class} function init(text: JString; rawBytes: TJavaArray<Byte>; numBits: Integer; resultPoints: TJavaObjectArray<JResultPoint>; format: JBarcodeFormat; timestamp: Int64): JResult; cdecl; overload; //(Ljava/lang/String;[BI[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;J)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/Result')]
  JResult = interface(JObject)
  ['{7EF49921-DE2A-485E-8CD4-0A8BCF5B2C9B}']
    { Property Methods }

    { methods }
    function getText: JString; cdecl; //()Ljava/lang/String;
    function getRawBytes: TJavaArray<Byte>; cdecl; //()[B
    function getNumBits: Integer; cdecl; //()I
    function getResultPoints: TJavaObjectArray<JResultPoint>; cdecl; //()[Lcom/google/zxing/ResultPoint;
    function getBarcodeFormat: JBarcodeFormat; cdecl; //()Lcom/google/zxing/BarcodeFormat;
    function getResultMetadata: JMap; cdecl; //()Ljava/util/Map;
    procedure putMetadata(atype: JResultMetadataType; value: JObject); cdecl; //(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V
    procedure putAllMetadata(metadata: JMap); cdecl; //(Ljava/util/Map;)V
    procedure addResultPoints(newPoints: TJavaObjectArray<JResultPoint>); cdecl; //([Lcom/google/zxing/ResultPoint;)V
    function getTimestamp: Int64; cdecl; //()J
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJResult = class(TJavaGenericImport<JResultClass, JResult>) end;


  JZXingResult=JResult;



  JResultMetadataTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{0EB3A416-60A0-480E-9B6B-A46440D41A14}']
    { static Property Methods }
    {class} function _GetOTHER: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;
    {class} function _GetORIENTATION: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;
    {class} function _GetBYTE_SEGMENTS: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;
    {class} function _GetERROR_CORRECTION_LEVEL: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;
    {class} function _GetISSUE_NUMBER: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;
    {class} function _GetSUGGESTED_PRICE: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;
    {class} function _GetPOSSIBLE_COUNTRY: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;
    {class} function _GetUPC_EAN_EXTENSION: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;
    {class} function _GetPDF417_EXTRA_METADATA: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;
    {class} function _GetSTRUCTURED_APPEND_SEQUENCE: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;
    {class} function _GetSTRUCTURED_APPEND_PARITY: JResultMetadataType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/ResultMetadataType;

    { static Methods }
    {class} function values: TJavaObjectArray<JResultMetadataType>; cdecl; //()[Lcom/google/zxing/ResultMetadataType;
    {class} function valueOf(name: JString): JResultMetadataType; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/ResultMetadataType;

    { static Property }
    {class} property OTHER: JResultMetadataType read _GetOTHER;
    {class} property ORIENTATION: JResultMetadataType read _GetORIENTATION;
    {class} property BYTE_SEGMENTS: JResultMetadataType read _GetBYTE_SEGMENTS;
    {class} property ERROR_CORRECTION_LEVEL: JResultMetadataType read _GetERROR_CORRECTION_LEVEL;
    {class} property ISSUE_NUMBER: JResultMetadataType read _GetISSUE_NUMBER;
    {class} property SUGGESTED_PRICE: JResultMetadataType read _GetSUGGESTED_PRICE;
    {class} property POSSIBLE_COUNTRY: JResultMetadataType read _GetPOSSIBLE_COUNTRY;
    {class} property UPC_EAN_EXTENSION: JResultMetadataType read _GetUPC_EAN_EXTENSION;
    {class} property PDF417_EXTRA_METADATA: JResultMetadataType read _GetPDF417_EXTRA_METADATA;
    {class} property STRUCTURED_APPEND_SEQUENCE: JResultMetadataType read _GetSTRUCTURED_APPEND_SEQUENCE;
    {class} property STRUCTURED_APPEND_PARITY: JResultMetadataType read _GetSTRUCTURED_APPEND_PARITY;
  end;

  [JavaSignature('com/google/zxing/ResultMetadataType')]
  JResultMetadataType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{5D34E725-F601-4D3A-889A-896B2FC9F85A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJResultMetadataType = class(TJavaGenericImport<JResultMetadataTypeClass, JResultMetadataType>) end;


  JResultPointCallbackClass = interface(JObjectClass)
  ['{2E228054-AD13-43B8-B724-FD68A0C1A641}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/ResultPointCallback')]
  JResultPointCallback = interface(IJavaInstance)
  ['{0BA4D059-E291-4771-A587-5DD295DE9CDD}']
    { Property Methods }

    { methods }
    procedure foundPossibleResultPoint(P1: JResultPoint); cdecl; //(Lcom/google/zxing/ResultPoint;)V

    { Property }
  end;

  TJResultPointCallback = class(TJavaGenericImport<JResultPointCallbackClass, JResultPointCallback>) end;

  JRGBLuminanceSourceClass = interface(JLuminanceSourceClass) // or JObjectClass // SuperSignature: com/google/zxing/LuminanceSource
  ['{410044A9-8456-4519-9FEC-4A247D3F38D1}']
    { static Property Methods }

    { static Methods }
    {class} function init(width: Integer; height: Integer; pixels: TJavaArray<Integer>): JRGBLuminanceSource; cdecl; //(II[I)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/RGBLuminanceSource')]
  JRGBLuminanceSource = interface(JLuminanceSource) // or JObject // SuperSignature: com/google/zxing/LuminanceSource
  ['{EB9301F1-387F-4956-BA61-24B25CB6F82F}']
    { Property Methods }

    { methods }
    function getRow(y: Integer; row: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; //(I[B)[B
    function getMatrix: TJavaArray<Byte>; cdecl; //()[B
    function isCropSupported: Boolean; cdecl; //()Z
    function crop(left: Integer; top: Integer; width: Integer; height: Integer): JLuminanceSource; cdecl; //(IIII)Lcom/google/zxing/LuminanceSource;

    { Property }
  end;

  TJRGBLuminanceSource = class(TJavaGenericImport<JRGBLuminanceSourceClass, JRGBLuminanceSource>) end;

  JWriterClass = interface(JObjectClass)
  ['{30F2D2AD-C0A4-4240-A042-A942F7DF6339}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/Writer')]
  JWriter = interface(IJavaInstance)
  ['{C5309EFB-2F0A-4EEA-A5CB-8C5ED1647427}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJWriter = class(TJavaGenericImport<JWriterClass, JWriter>) end;

  JWriterExceptionClass = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
  ['{03E9EE53-2774-4C29-8DEB-DB41E9F4C15A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWriterException; cdecl; overload; //()V
    {class} function init(amessage: JString): JWriterException; cdecl; overload; //(Ljava/lang/String;)V
    {class} function init(cause: JThrowable): JWriterException; cdecl; overload; //(Ljava/lang/Throwable;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/WriterException')]
  JWriterException = interface(JException) // or JObject // SuperSignature: java/lang/Exception
  ['{392D071C-2014-4AE2-A22C-AD80A045B80A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWriterException = class(TJavaGenericImport<JWriterExceptionClass, JWriterException>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAztecDetectorResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAztecDetectorResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAztecReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAztecReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAztecWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAztecWriter));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecoder_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecoder_1));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecoder_Table',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecoder_Table));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDetector_Point',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDetector_Point));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDetector',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDetector));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAztecCode',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAztecCode));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBinaryShiftToken',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBinaryShiftToken));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEncoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEncoder));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JHighLevelEncoder_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JHighLevelEncoder_1));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JHighLevelEncoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JHighLevelEncoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JSimpleToken',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JSimpleToken));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JState',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JState));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JToken',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JToken));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBarcodeFormat',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBarcodeFormat));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBinarizer',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBinarizer));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBinaryBitmap',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBinaryBitmap));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JChecksumException',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JChecksumException));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAbstractDoCoMoResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAbstractDoCoMoResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAddressBookAUResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAddressBookAUResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAddressBookDoCoMoResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAddressBookDoCoMoResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAddressBookParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAddressBookParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBizcardResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBizcardResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBookmarkDoCoMoResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBookmarkDoCoMoResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCalendarParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCalendarParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEmailAddressParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEmailAddressParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEmailAddressResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEmailAddressResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEmailDoCoMoResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEmailDoCoMoResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JExpandedProductParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JExpandedProductParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JExpandedProductResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JExpandedProductResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JGeoParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JGeoParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JGeoResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JGeoResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JISBNParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JISBNParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JISBNResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JISBNResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JParsedResultType',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JParsedResultType));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JProductParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JProductParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JProductResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JProductResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JSMSMMSResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JSMSMMSResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JSMSParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JSMSParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JSMSTOMMSTOResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JSMSTOMMSTOResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JSMTPResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JSMTPResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JTelParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JTelParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JTelResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JTelResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JTextParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JTextParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JURIParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JURIParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JURIResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JURIResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JURLTOResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JURLTOResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVCardResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVCardResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVEventResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVEventResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVINParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVINParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVINResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVINResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JWifiParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JWifiParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JWifiResultParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JWifiResultParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBitArray',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBitArray));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBitMatrix',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBitMatrix));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBitSource',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBitSource));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCharacterSetECI',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCharacterSetECI));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecoderResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecoderResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDefaultGridSampler',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDefaultGridSampler));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMathUtils',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMathUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMonochromeRectangleDetector',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMonochromeRectangleDetector));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JWhiteRectangleDetector',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JWhiteRectangleDetector));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDetectorResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDetectorResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JGlobalHistogramBinarizer',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JGlobalHistogramBinarizer));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JGridSampler',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JGridSampler));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JHybridBinarizer',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JHybridBinarizer));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPerspectiveTransform',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPerspectiveTransform));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JGenericGF',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JGenericGF));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JGenericGFPoly',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JGenericGFPoly));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JReedSolomonDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JReedSolomonDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JReedSolomonEncoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JReedSolomonEncoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JReedSolomonException',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JReedSolomonException));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JStringUtils',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JStringUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMatrixReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMatrixReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMatrixWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMatrixWriter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBitMatrixParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBitMatrixParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataBlock',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataBlock));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_1));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_Mode',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_Mode));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecoder_084',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecoder_084));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVersion_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVersion_1));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVersion_ECB',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVersion_ECB));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVersion_ECBlocks',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVersion_ECBlocks));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVersion',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVersion));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDetector_089',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDetector_089));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JASCIIEncoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JASCIIEncoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBase256Encoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBase256Encoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JC40Encoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JC40Encoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMatrixSymbolInfo144',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMatrixSymbolInfo144));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDefaultPlacement',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDefaultPlacement));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEdifactEncoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEdifactEncoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEncoder_096',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEncoder_096));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEncoderContext',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEncoderContext));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JErrorCorrection',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JErrorCorrection));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JHighLevelEncoder_099',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JHighLevelEncoder_099));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JSymbolInfo',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JSymbolInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JSymbolShapeHint',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JSymbolShapeHint));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JTextEncoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JTextEncoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JX12Encoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JX12Encoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodeHintType',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodeHintType));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDimension',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDimension));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEncodeHintType',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEncodeHintType));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JFormatException',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JFormatException));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JInvertedLuminanceSource',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JInvertedLuminanceSource));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JLuminanceSource',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JLuminanceSource));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBitMatrixParser_110',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBitMatrixParser_110));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_111',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_111));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecoder_112',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecoder_112));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMaxiCodeReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMaxiCodeReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JByQuadrantReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JByQuadrantReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JGenericMultipleBarcodeReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JGenericMultipleBarcodeReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMultipleBarcodeReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMultipleBarcodeReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMultiDetector',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMultiDetector));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMultiFinderPatternFinder_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMultiFinderPatternFinder_1));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMultiFinderPatternFinder_ModuleSizeComparator',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMultiFinderPatternFinder_ModuleSizeComparator));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMultiFinderPatternFinder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMultiFinderPatternFinder));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JQRCodeMultiReader_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JQRCodeMultiReader_1));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JQRCodeMultiReader_SAComparator',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JQRCodeMultiReader_SAComparator));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JQRCodeMultiReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JQRCodeMultiReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMultiFormatReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMultiFormatReader));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMultiFormatWriter_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMultiFormatWriter_1));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMultiFormatWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMultiFormatWriter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JNotFoundException',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JNotFoundException));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCodaBarReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCodaBarReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCodaBarWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCodaBarWriter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCode128Reader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCode128Reader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCode128Writer_CType',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCode128Writer_CType));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCode128Writer',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCode128Writer));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCode39Reader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCode39Reader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCode39Writer',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCode39Writer));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCode93Reader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCode93Reader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCode93Writer',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCode93Writer));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEAN13Reader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEAN13Reader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEAN13Writer',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEAN13Writer));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEAN8Reader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEAN8Reader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEAN8Writer',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEAN8Writer));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEANManufacturerOrgSupport',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEANManufacturerOrgSupport));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JITFReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JITFReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JITFWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JITFWriter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMultiFormatOneDReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMultiFormatOneDReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMultiFormatUPCEANReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMultiFormatUPCEANReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JOneDimensionalCodeWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JOneDimensionalCodeWriter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JOneDReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JOneDReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAbstractRSSReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAbstractRSSReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataCharacter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataCharacter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBitArrayBuilder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBitArrayBuilder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAbstractExpandedDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAbstractExpandedDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAI013103decoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAI013103decoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAI01320xDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAI01320xDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAI01392xDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAI01392xDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAI01393xDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAI01393xDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAI013x0x1xDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAI013x0x1xDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAI013x0xDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAI013x0xDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAI01AndOtherAIs',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAI01AndOtherAIs));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAI01decoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAI01decoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAI01weightDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAI01weightDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAnyAIDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAnyAIDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBlockParsedResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBlockParsedResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCurrentParsingState_State',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCurrentParsingState_State));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCurrentParsingState',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCurrentParsingState));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedChar',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedChar));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedInformation',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedInformation));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedNumeric',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedNumeric));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedObject',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedObject));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JFieldParser',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JFieldParser));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JGeneralAppIdDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JGeneralAppIdDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JExpandedPair',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JExpandedPair));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JExpandedRow',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JExpandedRow));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JRSSExpandedReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JRSSExpandedReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JFinderPattern',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JFinderPattern));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPair',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPair));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JRSS14Reader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JRSS14Reader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JRSSUtils',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JRSSUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JUPCAReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JUPCAReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JUPCAWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JUPCAWriter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JUPCEANExtension2Support',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JUPCEANExtension2Support));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JUPCEANExtension5Support',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JUPCEANExtension5Support));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JUPCEANExtensionSupport',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JUPCEANExtensionSupport));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JUPCEANReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JUPCEANReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JUPCEANWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JUPCEANWriter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JUPCEReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JUPCEReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JUPCEWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JUPCEWriter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBarcodeMetadata',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBarcodeMetadata));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBarcodeValue',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBarcodeValue));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBoundingBox',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBoundingBox));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCodeword',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCodeword));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_1_191',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_1_191));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_Mode_192',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_Mode_192));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_193',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_193));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDetectionResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDetectionResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDetectionResultColumn',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDetectionResultColumn));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDetectionResultRowIndicatorColumn',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDetectionResultRowIndicatorColumn));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JErrorCorrection_197',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JErrorCorrection_197));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JModulusGF',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JModulusGF));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JModulusPoly',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JModulusPoly));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417CodewordDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417CodewordDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417ScanningDecoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417ScanningDecoder));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDetector_202',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDetector_202));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417DetectorResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417DetectorResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBarcodeMatrix',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBarcodeMatrix));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBarcodeRow',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBarcodeRow));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JCompaction',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JCompaction));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDimensions',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDimensions));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417ErrorCorrection',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417ErrorCorrection));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417HighLevelEncoder_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417HighLevelEncoder_1));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417HighLevelEncoder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417HighLevelEncoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417Common',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417Common));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417Reader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417Reader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417ResultMetadata',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417ResultMetadata));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPDF417Writer',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPDF417Writer));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JPlanarYUVLuminanceSource',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JPlanarYUVLuminanceSource));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBitMatrixParser_217',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBitMatrixParser_217));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataBlock_218',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataBlock_218));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMask_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMask_1));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMask_2',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMask_2));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMask_3',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMask_3));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMask_4',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMask_4));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMask_5',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMask_5));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMask_6',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMask_6));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMask_7',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMask_7));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMask_8',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMask_8));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDataMask',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDataMask));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_1_228',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_1_228));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_229',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecodedBitStreamParser_229));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDecoder_230',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDecoder_230));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JErrorCorrectionLevel',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JErrorCorrectionLevel));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JFormatInformation',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JFormatInformation));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMode',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMode));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JQRCodeDecoderMetaData',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JQRCodeDecoderMetaData));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVersion_ECB_235',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVersion_ECB_235));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVersion_ECBlocks_236',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVersion_ECBlocks_236));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JVersion_237',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JVersion_237));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAlignmentPattern',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAlignmentPattern));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JAlignmentPatternFinder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JAlignmentPatternFinder));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JDetector_240',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JDetector_240));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JFinderPattern_241',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JFinderPattern_241));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JFinderPatternFinder_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JFinderPatternFinder_1));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JFinderPatternFinder_EstimatedModuleComparator',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JFinderPatternFinder_EstimatedModuleComparator));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JFinderPatternFinder',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JFinderPatternFinder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JFinderPatternInfo',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JFinderPatternInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JBlockPair',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JBlockPair));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JByteMatrix',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JByteMatrix));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEncoder_1',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEncoder_1));
////  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JEncoder_249',
////    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JEncoder_249));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMaskUtil',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMaskUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JMatrixUtil',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JMatrixUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JQRCode',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JQRCode));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JQRCodeReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JQRCodeReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JQRCodeWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JQRCodeWriter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JReader',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JReader));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JReaderException',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JReaderException));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JResult',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JResult));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JResultMetadataType',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JResultMetadataType));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JResultPoint',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JResultPoint));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JResultPointCallback',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JResultPointCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JRGBLuminanceSource',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JRGBLuminanceSource));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JWriter',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JWriter));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_core_3_4_0.JWriterException',
//    TypeInfo(Androidapi.JNI.zxing_core_3_4_0.JWriterException));
//end;
//
//
//initialization
//  RegisterTypes;

{$ENDIF}

end.
