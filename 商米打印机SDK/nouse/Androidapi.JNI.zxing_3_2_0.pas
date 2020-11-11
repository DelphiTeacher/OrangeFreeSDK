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
//  生成时间：2020-11-09 08:20:15
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.zxing_3_2_0;

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
  JDecodedBitStreamParser_Mode = interface; //com.google.zxing.datamatrix.decoder.DecodedBitStreamParser$Mode
  JDecodedBitStreamParser = interface; //com.google.zxing.datamatrix.decoder.DecodedBitStreamParser
  JDecoder_082 = interface; //com.google.zxing.datamatrix.decoder.Decoder
  JVersion_ECB = interface; //com.google.zxing.datamatrix.decoder.Version$ECB
  JVersion_ECBlocks = interface; //com.google.zxing.datamatrix.decoder.Version$ECBlocks
  JVersion = interface; //com.google.zxing.datamatrix.decoder.Version
  JDetector_ResultPointsAndTransitions = interface; //com.google.zxing.datamatrix.detector.Detector$ResultPointsAndTransitions
  JDetector_ResultPointsAndTransitionsComparator = interface; //com.google.zxing.datamatrix.detector.Detector$ResultPointsAndTransitionsComparator
  JDetector_088 = interface; //com.google.zxing.datamatrix.detector.Detector
  JASCIIEncoder = interface; //com.google.zxing.datamatrix.encoder.ASCIIEncoder
  JBase256Encoder = interface; //com.google.zxing.datamatrix.encoder.Base256Encoder
  JC40Encoder = interface; //com.google.zxing.datamatrix.encoder.C40Encoder
  JDataMatrixSymbolInfo144 = interface; //com.google.zxing.datamatrix.encoder.DataMatrixSymbolInfo144
  JDefaultPlacement = interface; //com.google.zxing.datamatrix.encoder.DefaultPlacement
  JEdifactEncoder = interface; //com.google.zxing.datamatrix.encoder.EdifactEncoder
  JEncoder_095 = interface; //com.google.zxing.datamatrix.encoder.Encoder
  JEncoderContext = interface; //com.google.zxing.datamatrix.encoder.EncoderContext
  JErrorCorrection = interface; //com.google.zxing.datamatrix.encoder.ErrorCorrection
  JHighLevelEncoder_098 = interface; //com.google.zxing.datamatrix.encoder.HighLevelEncoder
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
//  JBitMatrixParser_109 = interface; //com.google.zxing.maxicode.decoder.BitMatrixParser
//  JDecodedBitStreamParser_110 = interface; //com.google.zxing.maxicode.decoder.DecodedBitStreamParser
//  JDecoder_111 = interface; //com.google.zxing.maxicode.decoder.Decoder
  JMaxiCodeReader = interface; //com.google.zxing.maxicode.MaxiCodeReader
  JByQuadrantReader = interface; //com.google.zxing.multi.ByQuadrantReader
  JGenericMultipleBarcodeReader = interface; //com.google.zxing.multi.GenericMultipleBarcodeReader
  JMultipleBarcodeReader = interface; //com.google.zxing.multi.MultipleBarcodeReader
  JMultiDetector = interface; //com.google.zxing.multi.qrcode.detector.MultiDetector
  JMultiFinderPatternFinder_ModuleSizeComparator = interface; //com.google.zxing.multi.qrcode.detector.MultiFinderPatternFinder$ModuleSizeComparator
  JMultiFinderPatternFinder = interface; //com.google.zxing.multi.qrcode.detector.MultiFinderPatternFinder
  JQRCodeMultiReader_SAComparator = interface; //com.google.zxing.multi.qrcode.QRCodeMultiReader$SAComparator
  JQRCodeMultiReader = interface; //com.google.zxing.multi.qrcode.QRCodeMultiReader
  JMultiFormatReader = interface; //com.google.zxing.MultiFormatReader
  JMultiFormatWriter = interface; //com.google.zxing.MultiFormatWriter
  JNotFoundException = interface; //com.google.zxing.NotFoundException
  JCodaBarReader = interface; //com.google.zxing.oned.CodaBarReader
  JCodaBarWriter = interface; //com.google.zxing.oned.CodaBarWriter
  JCode128Reader = interface; //com.google.zxing.oned.Code128Reader
  JCode128Writer = interface; //com.google.zxing.oned.Code128Writer
  JCode39Reader = interface; //com.google.zxing.oned.Code39Reader
  JCode39Writer = interface; //com.google.zxing.oned.Code39Writer
  JCode93Reader = interface; //com.google.zxing.oned.Code93Reader
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
  JBarcodeMetadata = interface; //com.google.zxing.pdf417.decoder.BarcodeMetadata
  JBarcodeValue = interface; //com.google.zxing.pdf417.decoder.BarcodeValue
  JBoundingBox = interface; //com.google.zxing.pdf417.decoder.BoundingBox
  JCodeword = interface; //com.google.zxing.pdf417.decoder.Codeword
//  JDecodedBitStreamParser_Mode_184 = interface; //com.google.zxing.pdf417.decoder.DecodedBitStreamParser$Mode
//  JDecodedBitStreamParser_185 = interface; //com.google.zxing.pdf417.decoder.DecodedBitStreamParser
  JDetectionResult = interface; //com.google.zxing.pdf417.decoder.DetectionResult
  JDetectionResultColumn = interface; //com.google.zxing.pdf417.decoder.DetectionResultColumn
  JDetectionResultRowIndicatorColumn = interface; //com.google.zxing.pdf417.decoder.DetectionResultRowIndicatorColumn
//  JErrorCorrection_189 = interface; //com.google.zxing.pdf417.decoder.ec.ErrorCorrection
  JModulusGF = interface; //com.google.zxing.pdf417.decoder.ec.ModulusGF
  JModulusPoly = interface; //com.google.zxing.pdf417.decoder.ec.ModulusPoly
  JPDF417CodewordDecoder = interface; //com.google.zxing.pdf417.decoder.PDF417CodewordDecoder
  JPDF417ScanningDecoder = interface; //com.google.zxing.pdf417.decoder.PDF417ScanningDecoder
//  JDetector_194 = interface; //com.google.zxing.pdf417.detector.Detector
  JPDF417DetectorResult = interface; //com.google.zxing.pdf417.detector.PDF417DetectorResult
  JBarcodeMatrix = interface; //com.google.zxing.pdf417.encoder.BarcodeMatrix
  JBarcodeRow = interface; //com.google.zxing.pdf417.encoder.BarcodeRow
  JCompaction = interface; //com.google.zxing.pdf417.encoder.Compaction
  JDimensions = interface; //com.google.zxing.pdf417.encoder.Dimensions
  JPDF417 = interface; //com.google.zxing.pdf417.encoder.PDF417
  JPDF417ErrorCorrection = interface; //com.google.zxing.pdf417.encoder.PDF417ErrorCorrection
  JPDF417HighLevelEncoder = interface; //com.google.zxing.pdf417.encoder.PDF417HighLevelEncoder
  JPDF417Common = interface; //com.google.zxing.pdf417.PDF417Common
  JPDF417Reader = interface; //com.google.zxing.pdf417.PDF417Reader
  JPDF417ResultMetadata = interface; //com.google.zxing.pdf417.PDF417ResultMetadata
  JPDF417Writer = interface; //com.google.zxing.pdf417.PDF417Writer
  JPlanarYUVLuminanceSource = interface; //com.google.zxing.PlanarYUVLuminanceSource
//  JBitMatrixParser_208 = interface; //com.google.zxing.qrcode.decoder.BitMatrixParser
//  JDataBlock_209 = interface; //com.google.zxing.qrcode.decoder.DataBlock
  JDataMask_DataMask000 = interface; //com.google.zxing.qrcode.decoder.DataMask$DataMask000
  JDataMask_DataMask001 = interface; //com.google.zxing.qrcode.decoder.DataMask$DataMask001
  JDataMask_DataMask010 = interface; //com.google.zxing.qrcode.decoder.DataMask$DataMask010
  JDataMask_DataMask011 = interface; //com.google.zxing.qrcode.decoder.DataMask$DataMask011
  JDataMask_DataMask100 = interface; //com.google.zxing.qrcode.decoder.DataMask$DataMask100
  JDataMask_DataMask101 = interface; //com.google.zxing.qrcode.decoder.DataMask$DataMask101
  JDataMask_DataMask110 = interface; //com.google.zxing.qrcode.decoder.DataMask$DataMask110
  JDataMask_DataMask111 = interface; //com.google.zxing.qrcode.decoder.DataMask$DataMask111
  JDataMask = interface; //com.google.zxing.qrcode.decoder.DataMask
//  JDecodedBitStreamParser_219 = interface; //com.google.zxing.qrcode.decoder.DecodedBitStreamParser
//  JDecoder_220 = interface; //com.google.zxing.qrcode.decoder.Decoder
  JErrorCorrectionLevel = interface; //com.google.zxing.qrcode.decoder.ErrorCorrectionLevel
  JFormatInformation = interface; //com.google.zxing.qrcode.decoder.FormatInformation
  JMode = interface; //com.google.zxing.qrcode.decoder.Mode
  JQRCodeDecoderMetaData = interface; //com.google.zxing.qrcode.decoder.QRCodeDecoderMetaData
//  JVersion_ECB_225 = interface; //com.google.zxing.qrcode.decoder.Version$ECB
//  JVersion_ECBlocks_226 = interface; //com.google.zxing.qrcode.decoder.Version$ECBlocks
//  JVersion_227 = interface; //com.google.zxing.qrcode.decoder.Version
  JAlignmentPattern = interface; //com.google.zxing.qrcode.detector.AlignmentPattern
  JAlignmentPatternFinder = interface; //com.google.zxing.qrcode.detector.AlignmentPatternFinder
//  JDetector_230 = interface; //com.google.zxing.qrcode.detector.Detector
//  JFinderPattern_231 = interface; //com.google.zxing.qrcode.detector.FinderPattern
  JFinderPatternFinder_CenterComparator = interface; //com.google.zxing.qrcode.detector.FinderPatternFinder$CenterComparator
  JFinderPatternFinder_FurthestFromAverageComparator = interface; //com.google.zxing.qrcode.detector.FinderPatternFinder$FurthestFromAverageComparator
  JFinderPatternFinder = interface; //com.google.zxing.qrcode.detector.FinderPatternFinder
  JFinderPatternInfo = interface; //com.google.zxing.qrcode.detector.FinderPatternInfo
  JBlockPair = interface; //com.google.zxing.qrcode.encoder.BlockPair
  JByteMatrix = interface; //com.google.zxing.qrcode.encoder.ByteMatrix
//  JEncoder_238 = interface; //com.google.zxing.qrcode.encoder.Encoder
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
//  JDetector_230Class = interface; //com.google.zxing.qrcode.detector.Detector
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

  JAztecDetectorResultClass = interface(JDetectorResultClass) // or JObjectClass // SuperSignature: com/google/zxing/common/DetectorResult
  ['{E4EBC715-E2DD-4B9C-B24B-D27D308606AA}']
    { static Property Methods }

    { static Methods }
    {class} function init(bits: JBitMatrix; points: TJavaObjectArray<JResultPoint>; compact: Boolean; nbDatablocks: Integer; nbLayers: Integer): JAztecDetectorResult; cdecl; //(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;ZII)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/AztecDetectorResult')]
  JAztecDetectorResult = interface(JDetectorResult) // or JObject // SuperSignature: com/google/zxing/common/DetectorResult
  ['{66CABA00-9B3C-4FC9-B505-4CD2E30A7FED}']
    { Property Methods }

    { methods }
    function getNbLayers: Integer; cdecl; //()I
    function getNbDatablocks: Integer; cdecl; //()I
    function isCompact: Boolean; cdecl; //()Z

    { Property }
  end;

  TJAztecDetectorResult = class(TJavaGenericImport<JAztecDetectorResultClass, JAztecDetectorResult>) end;

  JAztecReaderClass = interface(JObjectClass)
  ['{94B42089-7E41-437C-97EB-818A7ED90F1B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAztecReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/AztecReader')]
  JAztecReader = interface(JObject)
  ['{37A560A8-EB62-4ECD-B412-D2F7EF7934EC}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJAztecReader = class(TJavaGenericImport<JAztecReaderClass, JAztecReader>) end;

  JAztecWriterClass = interface(JObjectClass)
  ['{B652B05C-BD40-4D36-928E-C274709DE195}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAztecWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/AztecWriter')]
  JAztecWriter = interface(JObject)
  ['{872BD9F3-C68C-4A07-A82A-769755F1E155}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJAztecWriter = class(TJavaGenericImport<JAztecWriterClass, JAztecWriter>) end;

  JDecoder_TableClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{DAF97AC9-9FB2-4E06-AF5C-633A21B2B3B3}']
    { static Property Methods }
    {class} function _GetUPPER: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function _GetLOWER: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function _GetMIXED: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function _GetDIGIT: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function _GetPUNCT: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function _GetBINARY: JDecoder_Table;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/aztec/decoder/Decoder$Table;

    { static Methods }
    {class} function values: TJavaObjectArray<JDecoder_Table>; cdecl; //()[Lcom/google/zxing/aztec/decoder/Decoder$Table;
    {class} function valueOf(P1: JString): JDecoder_Table; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/aztec/decoder/Decoder$Table;

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
  ['{F24B5C12-DDDE-4063-AD27-8C6AD71DB3E7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecoder_Table = class(TJavaGenericImport<JDecoder_TableClass, JDecoder_Table>) end;

  JDecoderClass = interface(JObjectClass)
  ['{D5B38617-20F6-4938-A676-334006C18E28}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDecoder; cdecl; //()V
    {class} function highLevelDecode(correctedBits: TJavaArray<Boolean>): JString; cdecl; //([Z)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/decoder/Decoder')]
  JDecoder = interface(JObject)
  ['{9D865B13-99DD-4B6E-9D2E-04656A537B29}']
    { Property Methods }

    { methods }
    function decode(detectorResult: JAztecDetectorResult): JDecoderResult; cdecl; //(Lcom/google/zxing/aztec/AztecDetectorResult;)Lcom/google/zxing/common/DecoderResult;

    { Property }
  end;

  TJDecoder = class(TJavaGenericImport<JDecoderClass, JDecoder>) end;

  JDetector_PointClass = interface(JObjectClass)
  ['{1351D09E-40F7-4A91-B66E-30F3B620931F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/detector/Detector$Point')]
  JDetector_Point = interface(JObject)
  ['{459EE1B7-516E-4B35-94CD-98BA2E227D32}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDetector_Point = class(TJavaGenericImport<JDetector_PointClass, JDetector_Point>) end;

  JDetectorClass = interface(JObjectClass)
  ['{4C28A967-94DD-4986-AADF-E8EEB8BA418C}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JDetector; cdecl; //(Lcom/google/zxing/common/BitMatrix;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/detector/Detector')]
  JDetector = interface(JObject)
  ['{7328884B-493E-433C-AD53-33CA84F18DDF}']
    { Property Methods }

    { methods }
    function detect: JAztecDetectorResult; cdecl; overload; //()Lcom/google/zxing/aztec/AztecDetectorResult;
    function detect(isMirror: Boolean): JAztecDetectorResult; cdecl; overload; //(Z)Lcom/google/zxing/aztec/AztecDetectorResult;

    { Property }
  end;

  TJDetector = class(TJavaGenericImport<JDetectorClass, JDetector>) end;

  JAztecCodeClass = interface(JObjectClass)
  ['{8182809D-400E-4FAC-9258-5176262678AC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAztecCode; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/AztecCode')]
  JAztecCode = interface(JObject)
  ['{702491C0-8842-404B-B9DE-91A7C7387072}']
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

  JBinaryShiftTokenClass = interface(JTokenClass) // or JObjectClass // SuperSignature: com/google/zxing/aztec/encoder/Token
  ['{58726B35-8D84-4291-BF23-5BA57FFB8536}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/BinaryShiftToken')]
  JBinaryShiftToken = interface(JToken) // or JObject // SuperSignature: com/google/zxing/aztec/encoder/Token
  ['{EFDE908F-D18A-43BE-A34E-8137095096C5}']
    { Property Methods }

    { methods }
    procedure appendTo(bitArray: JBitArray; text: TJavaArray<Byte>); cdecl; //(Lcom/google/zxing/common/BitArray;[B)V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJBinaryShiftToken = class(TJavaGenericImport<JBinaryShiftTokenClass, JBinaryShiftToken>) end;

  JEncoderClass = interface(JObjectClass)
  ['{F3B43CCC-45C0-430B-8190-64509D04449B}']
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
  ['{D93D988A-6E84-49FB-802B-065E7B308853}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncoder = class(TJavaGenericImport<JEncoderClass, JEncoder>) end;

//  JHighLevelEncoder_1Class = interface(JObjectClass)
//  ['{E13FCC0D-1483-4644-B35F-DAAE0F676D2F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/aztec/encoder/HighLevelEncoder$1')]
//  JHighLevelEncoder_1 = interface(JObject)
//  ['{59D8A70A-E9FA-4C96-97C4-5681E2E16800}']
//    { Property Methods }
//
//    { methods }
//    function compare(a: JState; b: JState): Integer; cdecl; overload; //(Lcom/google/zxing/aztec/encoder/State;Lcom/google/zxing/aztec/encoder/State;)I
//    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I
//
//    { Property }
//  end;

//  TJHighLevelEncoder_1 = class(TJavaGenericImport<JHighLevelEncoder_1Class, JHighLevelEncoder_1>) end;

  JHighLevelEncoderClass = interface(JObjectClass)
  ['{8AAAE5E7-5D62-4298-B4DA-C06C10B85E40}']
    { static Property Methods }

    { static Methods }
    {class} function init(text: TJavaArray<Byte>): JHighLevelEncoder; cdecl; //([B)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/HighLevelEncoder')]
  JHighLevelEncoder = interface(JObject)
  ['{E6AD408A-277B-4CEB-8F57-3B50C7428D3B}']
    { Property Methods }

    { methods }
    function encode: JBitArray; cdecl; //()Lcom/google/zxing/common/BitArray;

    { Property }
  end;

  TJHighLevelEncoder = class(TJavaGenericImport<JHighLevelEncoderClass, JHighLevelEncoder>) end;

  JSimpleTokenClass = interface(JTokenClass) // or JObjectClass // SuperSignature: com/google/zxing/aztec/encoder/Token
  ['{7245945C-1897-4679-ABB4-CD7F959FC9F9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/SimpleToken')]
  JSimpleToken = interface(JToken) // or JObject // SuperSignature: com/google/zxing/aztec/encoder/Token
  ['{8AEE3901-EA67-4EE0-9D3A-F2A54A71D435}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJSimpleToken = class(TJavaGenericImport<JSimpleTokenClass, JSimpleToken>) end;

  JStateClass = interface(JObjectClass)
  ['{0529DD95-3044-4506-B863-3F07ED31AF77}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/State')]
  JState = interface(JObject)
  ['{936631D6-6280-458B-9CCC-D465D4B28F2D}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJState = class(TJavaGenericImport<JStateClass, JState>) end;

  JTokenClass = interface(JObjectClass)
  ['{BC4D8547-247C-42C4-9F92-BB7C95459004}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/aztec/encoder/Token')]
  JToken = interface(JObject)
  ['{463F06E2-7A31-45EC-9B7F-2BBD9DB42D53}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJToken = class(TJavaGenericImport<JTokenClass, JToken>) end;

  JBarcodeFormatClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{23C820C0-9223-40C2-9A6A-E254BDB0AE98}']
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
    {class} function valueOf(P1: JString): JBarcodeFormat; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/BarcodeFormat;

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
  ['{66F24B47-5759-46BF-8098-893C98DFEA3F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBarcodeFormat = class(TJavaGenericImport<JBarcodeFormatClass, JBarcodeFormat>) end;

  JBinarizerClass = interface(JObjectClass)
  ['{B2E2E66B-3B52-4CD1-AC85-F591FDAA174C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/Binarizer')]
  JBinarizer = interface(JObject)
  ['{57944150-9138-4455-8920-CD13162A86D3}']
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
  ['{B2A7016F-D2EC-4C09-BA09-6D33D78E14C4}']
    { static Property Methods }

    { static Methods }
    {class} function init(binarizer: JBinarizer): JBinaryBitmap; cdecl; //(Lcom/google/zxing/Binarizer;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/BinaryBitmap')]
  JBinaryBitmap = interface(JObject)
  ['{6315A8E2-AC56-427C-B922-7170750472C5}']
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

  JChecksumExceptionClass = interface(JReaderExceptionClass) // or JObjectClass // SuperSignature: com/google/zxing/ReaderException
  ['{149BE700-5C92-4CC9-A7D4-24EF7A5B94DC}']
    { static Property Methods }

    { static Methods }
    {class} function getChecksumInstance: JChecksumException; cdecl; overload; //()Lcom/google/zxing/ChecksumException;
    {class} function getChecksumInstance(cause: JThrowable): JChecksumException; cdecl; overload; //(Ljava/lang/Throwable;)Lcom/google/zxing/ChecksumException;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/ChecksumException')]
  JChecksumException = interface(JReaderException) // or JObject // SuperSignature: com/google/zxing/ReaderException
  ['{9A91A9F7-4C5A-4E87-8EA5-3ACF3A6AD021}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJChecksumException = class(TJavaGenericImport<JChecksumExceptionClass, JChecksumException>) end;

  JAbstractDoCoMoResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{5EFA6F9B-7895-4CED-8AC1-10CCD4CEE4DC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/AbstractDoCoMoResultParser')]
  JAbstractDoCoMoResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{0BCA761F-BF95-48EF-8BCE-73B10DD6CE0F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAbstractDoCoMoResultParser = class(TJavaGenericImport<JAbstractDoCoMoResultParserClass, JAbstractDoCoMoResultParser>) end;

  JAddressBookAUResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{DCAC0A1E-CE27-4891-BD59-A3F176B9B478}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAddressBookAUResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/AddressBookAUResultParser')]
  JAddressBookAUResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{C7B1E493-BC21-48E6-9718-DB8E9F1FC2BC}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JAddressBookParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJAddressBookAUResultParser = class(TJavaGenericImport<JAddressBookAUResultParserClass, JAddressBookAUResultParser>) end;

  JAddressBookDoCoMoResultParserClass = interface(JAbstractDoCoMoResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{FD914AC2-3152-4E81-AA3A-E5D932048F88}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAddressBookDoCoMoResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/AddressBookDoCoMoResultParser')]
  JAddressBookDoCoMoResultParser = interface(JAbstractDoCoMoResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{33CE2AF2-A724-4795-BFA1-7261491ECFFB}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JAddressBookParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJAddressBookDoCoMoResultParser = class(TJavaGenericImport<JAddressBookDoCoMoResultParserClass, JAddressBookDoCoMoResultParser>) end;

  JAddressBookParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{CD5742D9-FF4B-48D4-97E7-133C0349F216}']
    { static Property Methods }

    { static Methods }
    {class} function init(names: TJavaObjectArray<JString>; phoneNumbers: TJavaObjectArray<JString>; phoneTypes: TJavaObjectArray<JString>; emails: TJavaObjectArray<JString>; emailTypes: TJavaObjectArray<JString>; addresses: TJavaObjectArray<JString>; addressTypes: TJavaObjectArray<JString>): JAddressBookParsedResult; cdecl; overload; //([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    {class} function init(names: TJavaObjectArray<JString>; nicknames: TJavaObjectArray<JString>; pronunciation: JString; phoneNumbers: TJavaObjectArray<JString>; phoneTypes: TJavaObjectArray<JString>; emails: TJavaObjectArray<JString>; emailTypes: TJavaObjectArray<JString>; instantMessenger: JString; note: JString; addresses: TJavaObjectArray<JString>; addressTypes: TJavaObjectArray<JString>; org: JString; birthday: JString; title: JString; urls: TJavaObjectArray<JString>; geo: TJavaObjectArray<JString>): JAddressBookParsedResult; cdecl; overload; //([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/AddressBookParsedResult')]
  JAddressBookParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{25B0822B-F2E6-4753-ACB9-FF320FC75C21}']
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
  ['{838A2B08-201F-454B-B17B-575ED796B1AA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBizcardResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/BizcardResultParser')]
  JBizcardResultParser = interface(JAbstractDoCoMoResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{B71088A6-CC29-4CD4-9C35-38ECEF547546}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JAddressBookParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJBizcardResultParser = class(TJavaGenericImport<JBizcardResultParserClass, JBizcardResultParser>) end;

  JBookmarkDoCoMoResultParserClass = interface(JAbstractDoCoMoResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{AD7545BF-D19C-46E3-9441-75770266098A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBookmarkDoCoMoResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/BookmarkDoCoMoResultParser')]
  JBookmarkDoCoMoResultParser = interface(JAbstractDoCoMoResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{84DB9845-8715-4539-97E6-4D8E9546295B}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JURIParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJBookmarkDoCoMoResultParser = class(TJavaGenericImport<JBookmarkDoCoMoResultParserClass, JBookmarkDoCoMoResultParser>) end;

  JCalendarParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{4C3A75E0-B451-44D9-8315-F453F634B983}']
    { static Property Methods }

    { static Methods }
    {class} function init(summary: JString; startString: JString; endString: JString; durationString: JString; location: JString; organizer: JString; attendees: TJavaObjectArray<JString>; description: JString; latitude: Double; P10: Double): JCalendarParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;DD)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/CalendarParsedResult')]
  JCalendarParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{D46FFC2D-1F23-41EA-B97B-04D65DA1454A}']
    { Property Methods }

    { methods }
    function getSummary: JString; cdecl; //()Ljava/lang/String;
    function getStart: JDate; cdecl; //()Ljava/util/Date;
    function isStartAllDay: Boolean; cdecl; //()Z
    function getEnd: JDate; cdecl; //()Ljava/util/Date;
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
  ['{933E6A84-6AA7-479F-8833-1052E865419D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/EmailAddressParsedResult')]
  JEmailAddressParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{EE11ABEF-A8DF-4926-9049-0B023FAB73A6}']
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
  ['{EBC2BBD4-33FC-493C-BC34-F39241A7FC6D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEmailAddressResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/EmailAddressResultParser')]
  JEmailAddressResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{2F24A565-2FA2-43A5-8393-8388F2DE38B0}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JEmailAddressParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJEmailAddressResultParser = class(TJavaGenericImport<JEmailAddressResultParserClass, JEmailAddressResultParser>) end;

  JEmailDoCoMoResultParserClass = interface(JAbstractDoCoMoResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{9ED7AA2C-258C-45B1-9A9F-D8475AF4D8C7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEmailDoCoMoResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/EmailDoCoMoResultParser')]
  JEmailDoCoMoResultParser = interface(JAbstractDoCoMoResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/AbstractDoCoMoResultParser
  ['{C0417196-4862-48E0-B731-EAA254AAEC2E}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JEmailAddressParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJEmailDoCoMoResultParser = class(TJavaGenericImport<JEmailDoCoMoResultParserClass, JEmailDoCoMoResultParser>) end;

  JExpandedProductParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{2C75437E-4558-4E72-BC89-88339B47392A}']
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
  ['{7F7F38F9-4497-4422-9251-6D82889B33B2}']
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
  ['{A400BFF1-E5FF-4CFE-99B0-E90E4D6AEDAD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JExpandedProductResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ExpandedProductResultParser')]
  JExpandedProductResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{AD693846-83A7-4976-BA89-02110F57B055}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JExpandedProductParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ExpandedProductParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJExpandedProductResultParser = class(TJavaGenericImport<JExpandedProductResultParserClass, JExpandedProductResultParser>) end;

  JGeoParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{570F3478-02E7-4E6B-A82C-9BF832A852B6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/GeoParsedResult')]
  JGeoParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{43095179-7325-49AE-B49C-3DAAB944B6D6}']
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
  ['{43381785-62F9-4A03-BE2F-F28C74F07ED9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGeoResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/GeoResultParser')]
  JGeoResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{BCCF7C38-CD45-452E-846B-DCF9C2EFE996}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JGeoParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/GeoParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJGeoResultParser = class(TJavaGenericImport<JGeoResultParserClass, JGeoResultParser>) end;

  JISBNParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{4DDFDF3F-082F-494A-99C2-BF4D896E50B5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ISBNParsedResult')]
  JISBNParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{D8388B81-9C93-4143-A176-B2A0A34F454D}']
    { Property Methods }

    { methods }
    function getISBN: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJISBNParsedResult = class(TJavaGenericImport<JISBNParsedResultClass, JISBNParsedResult>) end;

  JISBNResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{65BF22AD-9333-4A8A-AD9E-147CEEDB5D49}']
    { static Property Methods }

    { static Methods }
    {class} function init: JISBNResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ISBNResultParser')]
  JISBNResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{3BB6CAE8-DE70-4B98-9432-446244C928EB}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JISBNParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ISBNParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJISBNResultParser = class(TJavaGenericImport<JISBNResultParserClass, JISBNResultParser>) end;

  JParsedResultClass = interface(JObjectClass)
  ['{CFFFF6FD-C619-481A-A938-668BC7E453E9}']
    { static Property Methods }

    { static Methods }
    {class} procedure maybeAppend(value: JString; result: JStringBuilder); cdecl; overload; //(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    {class} procedure maybeAppend(values: TJavaObjectArray<JString>; result: JStringBuilder); cdecl; overload; //([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ParsedResult')]
  JParsedResult = interface(JObject)
  ['{759E6826-437C-4D82-A136-B95D766F5157}']
    { Property Methods }

    { methods }
    function getType: JParsedResultType; cdecl; //()Lcom/google/zxing/client/result/ParsedResultType;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJParsedResult = class(TJavaGenericImport<JParsedResultClass, JParsedResult>) end;

  JParsedResultTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{4B3F2350-DD45-4572-9A54-A29A4D11C4D8}']
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
    {class} function valueOf(P1: JString): JParsedResultType; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/client/result/ParsedResultType;

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
  ['{1F4A4119-6FB4-4FF9-8F2F-A227FE1C0C4C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJParsedResultType = class(TJavaGenericImport<JParsedResultTypeClass, JParsedResultType>) end;

  JProductParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{CC27F3BC-DE44-4BD3-8B6D-F00A7D2F8B59}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ProductParsedResult')]
  JProductParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{FC411525-0CE5-4436-B1F9-31E7C1B61229}']
    { Property Methods }

    { methods }
    function getProductID: JString; cdecl; //()Ljava/lang/String;
    function getNormalizedProductID: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJProductParsedResult = class(TJavaGenericImport<JProductParsedResultClass, JProductParsedResult>) end;

  JProductResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{E66CAEDB-907E-40B2-847F-0069409AB3CD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JProductResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ProductResultParser')]
  JProductResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{90485EEF-2ED5-4678-89E5-D0039723FF82}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JProductParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ProductParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJProductResultParser = class(TJavaGenericImport<JProductResultParserClass, JProductResultParser>) end;

  JResultParserClass = interface(JObjectClass)
  ['{04D101F5-5331-4948-82EB-4DE47FFE563B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JResultParser; cdecl; //()V
    {class} function parseResult(theResult: JResult): JParsedResult; cdecl; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/ResultParser')]
  JResultParser = interface(JObject)
  ['{8A646700-ED41-432F-B511-F393E5FFBAD1}']
    { Property Methods }

    { methods }
    function parse(P1: JResult): JParsedResult; cdecl; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJResultParser = class(TJavaGenericImport<JResultParserClass, JResultParser>) end;

  JSMSMMSResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{CCDF2B30-6238-4A01-9E98-881C2BEF9620}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSMSMMSResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/SMSMMSResultParser')]
  JSMSMMSResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{5CC4FBD9-E146-4911-9C68-8C401505D043}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JSMSParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/SMSParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJSMSMMSResultParser = class(TJavaGenericImport<JSMSMMSResultParserClass, JSMSMMSResultParser>) end;

  JSMSParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{50A8025F-B451-4A06-B15E-2546742E951E}']
    { static Property Methods }

    { static Methods }
    {class} function init(number: JString; via: JString; subject: JString; body: JString): JSMSParsedResult; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    {class} function init(numbers: TJavaObjectArray<JString>; vias: TJavaObjectArray<JString>; subject: JString; body: JString): JSMSParsedResult; cdecl; overload; //([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/SMSParsedResult')]
  JSMSParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{4B85A899-CB8E-4B74-8AAF-7240B3EE7753}']
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
  ['{0749EB7D-5235-4EDA-8C53-6227E7C7AB3B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSMSTOMMSTOResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/SMSTOMMSTOResultParser')]
  JSMSTOMMSTOResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{0D17399A-7B08-49FB-BD42-3866CB3640BE}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JSMSParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/SMSParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJSMSTOMMSTOResultParser = class(TJavaGenericImport<JSMSTOMMSTOResultParserClass, JSMSTOMMSTOResultParser>) end;

  JSMTPResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{519B804D-E62C-4EBB-9E68-8FA58491380B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSMTPResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/SMTPResultParser')]
  JSMTPResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{ADD7D452-04D7-4007-8DFC-6936B9B2C3EC}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JEmailAddressParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/EmailAddressParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJSMTPResultParser = class(TJavaGenericImport<JSMTPResultParserClass, JSMTPResultParser>) end;

  JTelParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{D3CA5405-AC21-49A3-8B4E-8A272009778F}']
    { static Property Methods }

    { static Methods }
    {class} function init(number: JString; telURI: JString; title: JString): JTelParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/TelParsedResult')]
  JTelParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{FC4BABF2-30E7-43D5-8D98-A31EE28DB858}']
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
  ['{D5486158-DC49-47DC-BC38-C836CC6B2D2C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTelResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/TelResultParser')]
  JTelResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{9338F42E-5BE2-458A-8C02-616EA25D87D6}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JTelParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/TelParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJTelResultParser = class(TJavaGenericImport<JTelResultParserClass, JTelResultParser>) end;

  JTextParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{1B4A3748-298E-480C-AAD3-E69B773C580B}']
    { static Property Methods }

    { static Methods }
    {class} function init(text: JString; language: JString): JTextParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/TextParsedResult')]
  JTextParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{A960AFED-EC97-4697-9FD8-F8082735BA53}']
    { Property Methods }

    { methods }
    function getText: JString; cdecl; //()Ljava/lang/String;
    function getLanguage: JString; cdecl; //()Ljava/lang/String;
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJTextParsedResult = class(TJavaGenericImport<JTextParsedResultClass, JTextParsedResult>) end;

  JURIParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{9E181933-B290-4761-8E69-1AA68EF92AC1}']
    { static Property Methods }

    { static Methods }
    {class} function init(uri: JString; title: JString): JURIParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/URIParsedResult')]
  JURIParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{1E648783-66B0-4BCF-B794-AB30BC4A9BD3}']
    { Property Methods }

    { methods }
    function getURI: JString; cdecl; //()Ljava/lang/String;
    function getTitle: JString; cdecl; //()Ljava/lang/String;
    function isPossiblyMaliciousURI: Boolean; cdecl; //()Z
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJURIParsedResult = class(TJavaGenericImport<JURIParsedResultClass, JURIParsedResult>) end;

  JURIResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{FD02F578-4C61-4B4C-B4A8-6E6969783CAD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JURIResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/URIResultParser')]
  JURIResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{508E605C-0526-4252-A15F-6405B54F0E9D}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JURIParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJURIResultParser = class(TJavaGenericImport<JURIResultParserClass, JURIResultParser>) end;

  JURLTOResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{9498E9FC-D975-442F-B3E0-FB5139F1D678}']
    { static Property Methods }

    { static Methods }
    {class} function init: JURLTOResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/URLTOResultParser')]
  JURLTOResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{47470819-8090-4A18-A9FD-695E0F888B3A}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JURIParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/URIParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJURLTOResultParser = class(TJavaGenericImport<JURLTOResultParserClass, JURLTOResultParser>) end;

  JVCardResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{03110701-FFDD-4B6C-BF4A-06D824D2EF94}']
    { static Property Methods }

    { static Methods }
    {class} function init: JVCardResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/VCardResultParser')]
  JVCardResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{78D8083B-A38D-4F54-9577-4AC21657B6C4}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JAddressBookParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/AddressBookParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJVCardResultParser = class(TJavaGenericImport<JVCardResultParserClass, JVCardResultParser>) end;

  JVEventResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{6D1BAAE6-81A7-4BED-B126-077871F4738F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JVEventResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/VEventResultParser')]
  JVEventResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{D6F2433A-1E67-4EDD-B9E6-DD8E8B8B2267}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JCalendarParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/CalendarParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJVEventResultParser = class(TJavaGenericImport<JVEventResultParserClass, JVEventResultParser>) end;

  JVINParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{B33BA526-5FC0-45AA-95ED-6A45EB0503FA}']
    { static Property Methods }

    { static Methods }
    {class} function init(vin: JString; worldManufacturerID: JString; vehicleDescriptorSection: JString; vehicleIdentifierSection: JString; countryCode: JString; vehicleAttributes: JString; modelYear: Integer; plantCode: Char; sequentialNumber: JString): JVINParsedResult; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ICLjava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/VINParsedResult')]
  JVINParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{4A6F7230-6FEB-44D0-84F0-AAFFAC25AA30}']
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
  ['{66E8A250-9089-49C3-B52A-6019902DA906}']
    { static Property Methods }

    { static Methods }
    {class} function init: JVINResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/VINResultParser')]
  JVINResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{BB8166E7-3D52-4533-9D51-B2A9A31B4718}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JVINParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/VINParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJVINResultParser = class(TJavaGenericImport<JVINResultParserClass, JVINResultParser>) end;

  JWifiParsedResultClass = interface(JParsedResultClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{894D955C-32FB-4996-8A28-8BD9C95FDDAB}']
    { static Property Methods }

    { static Methods }
    {class} function init(networkEncryption: JString; ssid: JString; password: JString): JWifiParsedResult; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    {class} function init(networkEncryption: JString; ssid: JString; password: JString; hidden: Boolean): JWifiParsedResult; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/WifiParsedResult')]
  JWifiParsedResult = interface(JParsedResult) // or JObject // SuperSignature: com/google/zxing/client/result/ParsedResult
  ['{59052C43-A70C-47B4-BEE0-E0AC352D68B3}']
    { Property Methods }

    { methods }
    function getSsid: JString; cdecl; //()Ljava/lang/String;
    function getNetworkEncryption: JString; cdecl; //()Ljava/lang/String;
    function getPassword: JString; cdecl; //()Ljava/lang/String;
    function isHidden: Boolean; cdecl; //()Z
    function getDisplayResult: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJWifiParsedResult = class(TJavaGenericImport<JWifiParsedResultClass, JWifiParsedResult>) end;

  JWifiResultParserClass = interface(JResultParserClass) // or JObjectClass // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{3F8B12CB-329E-4C18-9894-8990B26A1005}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWifiResultParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/client/result/WifiResultParser')]
  JWifiResultParser = interface(JResultParser) // or JObject // SuperSignature: com/google/zxing/client/result/ResultParser
  ['{CED2037B-06EC-4A3F-B124-ED236463A680}']
    { Property Methods }

    { methods }
    function parse(result: JResult): JWifiParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/WifiParsedResult;
    function parse(P1: JResult): JParsedResult; cdecl; overload; //(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    { Property }
  end;

  TJWifiResultParser = class(TJavaGenericImport<JWifiResultParserClass, JWifiResultParser>) end;

  JBitArrayClass = interface(JObjectClass)
  ['{AD079139-53F2-462E-B1FE-F27DC7E91281}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitArray; cdecl; overload; //()V
    {class} function init(size: Integer): JBitArray; cdecl; overload; //(I)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/BitArray')]
  JBitArray = interface(JObject)
  ['{AA3BBEAE-BE52-4A8B-8DC5-4FAE5A665FD8}']
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
    function clone: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJBitArray = class(TJavaGenericImport<JBitArrayClass, JBitArray>) end;

  JBitMatrixClass = interface(JObjectClass)
  ['{A48E64B4-946D-42E8-A8FE-07AE288B899F}']
    { static Property Methods }

    { static Methods }
    {class} function init(dimension: Integer): JBitMatrix; cdecl; overload; //(I)V
    {class} function init(width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(II)V
    {class} function parse(stringRepresentation: JString; setString: JString; unsetString: JString): JBitMatrix; cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/common/BitMatrix;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/BitMatrix')]
  JBitMatrix = interface(JObject)
  ['{AA03C383-534A-417A-ADF9-6542BF9C275A}']
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
    function toString(setString: JString; unsetString: JString; lineSeparator: JString): JString; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    function clone: JBitMatrix; cdecl; overload; //()Lcom/google/zxing/common/BitMatrix;
    function clone: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJBitMatrix = class(TJavaGenericImport<JBitMatrixClass, JBitMatrix>) end;

  JBitSourceClass = interface(JObjectClass)
  ['{919664F8-4C01-4BA4-B5AE-5413F207831C}']
    { static Property Methods }

    { static Methods }
    {class} function init(bytes: TJavaArray<Byte>): JBitSource; cdecl; //([B)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/BitSource')]
  JBitSource = interface(JObject)
  ['{D329CA1E-6DDF-4E96-85A6-B29CC565BBC0}']
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
  ['{E9EFA246-0627-4983-83B3-22264329C68B}']
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
    {class} function getCharacterSetECIByValue(value: Integer): JCharacterSetECI; cdecl; //(I)Lcom/google/zxing/common/CharacterSetECI;
    {class} function getCharacterSetECIByName(name: JString): JCharacterSetECI; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/common/CharacterSetECI;
    {class} function values: TJavaObjectArray<JCharacterSetECI>; cdecl; //()[Lcom/google/zxing/common/CharacterSetECI;
    {class} function valueOf(P1: JString): JCharacterSetECI; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/common/CharacterSetECI;

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
  ['{FD3861A2-FFBE-4BD7-8CE0-D0233821A613}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl; //()I

    { Property }
  end;

  TJCharacterSetECI = class(TJavaGenericImport<JCharacterSetECIClass, JCharacterSetECI>) end;

  JDecoderResultClass = interface(JObjectClass)
  ['{09E7D309-1CE8-4FFB-AC4C-64362A5DBB0A}']
    { static Property Methods }

    { static Methods }
    {class} function init(rawBytes: TJavaArray<Byte>; text: JString; byteSegments: JList; P4: JString): JDecoderResult; cdecl; overload; //([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    {class} function init(rawBytes: TJavaArray<Byte>; text: JString; byteSegments: JList; P4: JString; saSequence: Integer; saParity: Integer): JDecoderResult; cdecl; overload; //([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;II)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/DecoderResult')]
  JDecoderResult = interface(JObject)
  ['{12F6844F-A7C8-44EC-A05E-AB7EFF2C19DD}']
    { Property Methods }

    { methods }
    function getRawBytes: TJavaArray<Byte>; cdecl; //()[B
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

  JDefaultGridSamplerClass = interface(JGridSamplerClass) // or JObjectClass // SuperSignature: com/google/zxing/common/GridSampler
  ['{92BD99A0-C3E7-4F79-8679-CA578F5D6206}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDefaultGridSampler; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/DefaultGridSampler')]
  JDefaultGridSampler = interface(JGridSampler) // or JObject // SuperSignature: com/google/zxing/common/GridSampler
  ['{5483598C-E556-4693-9648-23CEFB03EA9F}']
    { Property Methods }

    { methods }
    function sampleGrid(image: JBitMatrix; dimensionX: Integer; dimensionY: Integer; p1ToX: Single; p1ToY: Single; p2ToX: Single; p2ToY: Single; p3ToX: Single; p3ToY: Single; p4ToX: Single; p4ToY: Single; p1FromX: Single; p1FromY: Single; p2FromX: Single; p2FromY: Single; p3FromX: Single; p3FromY: Single; p4FromX: Single; p4FromY: Single): JBitMatrix; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;
    function sampleGrid(image: JBitMatrix; dimensionX: Integer; dimensionY: Integer; transform: JPerspectiveTransform): JBitMatrix; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJDefaultGridSampler = class(TJavaGenericImport<JDefaultGridSamplerClass, JDefaultGridSampler>) end;

  JMathUtilsClass = interface(JObjectClass)
  ['{2B1A0A82-AF39-4D61-8AA6-FF1489017FD8}']
    { static Property Methods }

    { static Methods }
    {class} function round(d: Single): Integer; cdecl; //(F)I
    {class} function distance(aX: Single; aY: Single; bX: Single; bY: Single): Single; cdecl; overload; //(FFFF)F
    {class} function distance(aX: Integer; aY: Integer; bX: Integer; bY: Integer): Single; cdecl; overload; //(IIII)F

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/detector/MathUtils')]
  JMathUtils = interface(JObject)
  ['{97D0FBE6-030A-4AAC-AA52-975CC6E022C8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMathUtils = class(TJavaGenericImport<JMathUtilsClass, JMathUtils>) end;

  JMonochromeRectangleDetectorClass = interface(JObjectClass)
  ['{45150C1F-13DC-4D84-B5CF-7FC0C98469D5}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JMonochromeRectangleDetector; cdecl; //(Lcom/google/zxing/common/BitMatrix;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/detector/MonochromeRectangleDetector')]
  JMonochromeRectangleDetector = interface(JObject)
  ['{6DF0B28D-562D-4CBC-BBDE-71C378814535}']
    { Property Methods }

    { methods }
    function detect: TJavaObjectArray<JResultPoint>; cdecl; //()[Lcom/google/zxing/ResultPoint;

    { Property }
  end;

  TJMonochromeRectangleDetector = class(TJavaGenericImport<JMonochromeRectangleDetectorClass, JMonochromeRectangleDetector>) end;

  JWhiteRectangleDetectorClass = interface(JObjectClass)
  ['{F6CBA9D5-F36C-4F71-A063-4DD4B0A75C71}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JWhiteRectangleDetector; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;)V
    {class} function init(image: JBitMatrix; initSize: Integer; x: Integer; y: Integer): JWhiteRectangleDetector; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;III)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/detector/WhiteRectangleDetector')]
  JWhiteRectangleDetector = interface(JObject)
  ['{E7CB776D-D511-485D-B6B1-9EEB1336CEDA}']
    { Property Methods }

    { methods }
    function detect: TJavaObjectArray<JResultPoint>; cdecl; //()[Lcom/google/zxing/ResultPoint;

    { Property }
  end;

  TJWhiteRectangleDetector = class(TJavaGenericImport<JWhiteRectangleDetectorClass, JWhiteRectangleDetector>) end;

  JDetectorResultClass = interface(JObjectClass)
  ['{8F61C161-2C90-4E3D-945C-75820236BA9F}']
    { static Property Methods }

    { static Methods }
    {class} function init(bits: JBitMatrix; points: TJavaObjectArray<JResultPoint>): JDetectorResult; cdecl; //(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/DetectorResult')]
  JDetectorResult = interface(JObject)
  ['{8D5BFC8E-9593-4B4F-8FB2-2A775B56C83C}']
    { Property Methods }

    { methods }
    function getBits: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    function getPoints: TJavaObjectArray<JResultPoint>; cdecl; //()[Lcom/google/zxing/ResultPoint;

    { Property }
  end;

  TJDetectorResult = class(TJavaGenericImport<JDetectorResultClass, JDetectorResult>) end;

  JGlobalHistogramBinarizerClass = interface(JBinarizerClass) // or JObjectClass // SuperSignature: com/google/zxing/Binarizer
  ['{6BD2B504-56E6-4092-9446-05FECE7FE6E6}']
    { static Property Methods }

    { static Methods }
    {class} function init(source: JLuminanceSource): JGlobalHistogramBinarizer; cdecl; //(Lcom/google/zxing/LuminanceSource;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/GlobalHistogramBinarizer')]
  JGlobalHistogramBinarizer = interface(JBinarizer) // or JObject // SuperSignature: com/google/zxing/Binarizer
  ['{7410BAE0-10E7-453C-9179-027679AAB0F9}']
    { Property Methods }

    { methods }
    function getBlackRow(y: Integer; row: JBitArray): JBitArray; cdecl; //(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;
    function getBlackMatrix: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    function createBinarizer(source: JLuminanceSource): JBinarizer; cdecl; //(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Binarizer;

    { Property }
  end;

  TJGlobalHistogramBinarizer = class(TJavaGenericImport<JGlobalHistogramBinarizerClass, JGlobalHistogramBinarizer>) end;

  JGridSamplerClass = interface(JObjectClass)
  ['{03B33723-3CE9-427D-A92D-FA03738362C2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGridSampler; cdecl; //()V
    {class} procedure setGridSampler(newGridSampler: JGridSampler); cdecl; //(Lcom/google/zxing/common/GridSampler;)V
    {class} function getInstance: JGridSampler; cdecl; //()Lcom/google/zxing/common/GridSampler;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/GridSampler')]
  JGridSampler = interface(JObject)
  ['{F5466963-BBEC-44E9-A92E-68EC8A9DA0A2}']
    { Property Methods }

    { methods }
    function sampleGrid(P1: JBitMatrix; P2: Integer; P3: Integer; P4: Single; P5: Single; P6: Single; P7: Single; P8: Single; P9: Single; P10: Single; P11: Single; P12: Single; P13: Single; P14: Single; P15: Single; P16: Single; P17: Single; P18: Single; P19: Single): JBitMatrix; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;
    function sampleGrid(P1: JBitMatrix; P2: Integer; P3: Integer; P4: JPerspectiveTransform): JBitMatrix; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJGridSampler = class(TJavaGenericImport<JGridSamplerClass, JGridSampler>) end;

  JHybridBinarizerClass = interface(JGlobalHistogramBinarizerClass) // or JObjectClass // SuperSignature: com/google/zxing/common/GlobalHistogramBinarizer
  ['{6F51164D-4A4E-4EC9-BD02-E8F7E0C59953}']
    { static Property Methods }

    { static Methods }
    {class} function init(source: JLuminanceSource): JHybridBinarizer; cdecl; //(Lcom/google/zxing/LuminanceSource;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/HybridBinarizer')]
  JHybridBinarizer = interface(JGlobalHistogramBinarizer) // or JObject // SuperSignature: com/google/zxing/common/GlobalHistogramBinarizer
  ['{18971F57-C674-4B9B-8C49-BEC398AB4E87}']
    { Property Methods }

    { methods }
    function getBlackMatrix: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    function createBinarizer(source: JLuminanceSource): JBinarizer; cdecl; //(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Binarizer;

    { Property }
  end;

  TJHybridBinarizer = class(TJavaGenericImport<JHybridBinarizerClass, JHybridBinarizer>) end;

  JPerspectiveTransformClass = interface(JObjectClass)
  ['{C0114A4F-ACBF-4F61-9F85-14F5C6BA78AA}']
    { static Property Methods }

    { static Methods }
    {class} function quadrilateralToQuadrilateral(x0: Single; y0: Single; x1: Single; y1: Single; x2: Single; y2: Single; x3: Single; y3: Single; x0p: Single; y0p: Single; x1p: Single; y1p: Single; x2p: Single; y2p: Single; x3p: Single; y3p: Single): JPerspectiveTransform; cdecl; //(FFFFFFFFFFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;
    {class} function squareToQuadrilateral(x0: Single; y0: Single; x1: Single; y1: Single; x2: Single; y2: Single; x3: Single; y3: Single): JPerspectiveTransform; cdecl; //(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;
    {class} function quadrilateralToSquare(x0: Single; y0: Single; x1: Single; y1: Single; x2: Single; y2: Single; x3: Single; y3: Single): JPerspectiveTransform; cdecl; //(FFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/PerspectiveTransform')]
  JPerspectiveTransform = interface(JObject)
  ['{71D2617F-4787-4FB6-BFAE-19EE5F974FC2}']
    { Property Methods }

    { methods }
    procedure transformPoints(points: TJavaArray<Single>); cdecl; overload; //([F)V
    procedure transformPoints(xValues: TJavaArray<Single>; yValues: TJavaArray<Single>); cdecl; overload; //([F[F)V

    { Property }
  end;

  TJPerspectiveTransform = class(TJavaGenericImport<JPerspectiveTransformClass, JPerspectiveTransform>) end;

  JGenericGFClass = interface(JObjectClass)
  ['{756BDAD6-CA96-4BC5-9725-BAFB6A346F4A}']
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
  ['{75C6E3F9-850D-41C5-821B-786A1C8B58CF}']
    { Property Methods }

    { methods }
    function getSize: Integer; cdecl; //()I
    function getGeneratorBase: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJGenericGF = class(TJavaGenericImport<JGenericGFClass, JGenericGF>) end;

  JGenericGFPolyClass = interface(JObjectClass)
  ['{E9E48E5D-9C88-4B1C-86BC-570CEC749AE9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/GenericGFPoly')]
  JGenericGFPoly = interface(JObject)
  ['{C5AD3109-36F4-4A2F-B6F3-F0DB306964E3}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJGenericGFPoly = class(TJavaGenericImport<JGenericGFPolyClass, JGenericGFPoly>) end;

  JReedSolomonDecoderClass = interface(JObjectClass)
  ['{A837F49C-C018-4581-A5CD-BD03D2C6F1AB}']
    { static Property Methods }

    { static Methods }
    {class} function init(field: JGenericGF): JReedSolomonDecoder; cdecl; //(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/ReedSolomonDecoder')]
  JReedSolomonDecoder = interface(JObject)
  ['{FAA65463-DD20-4DAD-804B-1AC7EE74CA3C}']
    { Property Methods }

    { methods }
    procedure decode(received: TJavaArray<Integer>; twoS: Integer); cdecl; //([II)V

    { Property }
  end;

  TJReedSolomonDecoder = class(TJavaGenericImport<JReedSolomonDecoderClass, JReedSolomonDecoder>) end;

  JReedSolomonEncoderClass = interface(JObjectClass)
  ['{4FA5841B-3111-4D64-97B0-90766DDDD0D7}']
    { static Property Methods }

    { static Methods }
    {class} function init(field: JGenericGF): JReedSolomonEncoder; cdecl; //(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/ReedSolomonEncoder')]
  JReedSolomonEncoder = interface(JObject)
  ['{AD940007-E6B1-48FA-8668-E4A36E4CC887}']
    { Property Methods }

    { methods }
    procedure encode(toEncode: TJavaArray<Integer>; ecBytes: Integer); cdecl; //([II)V

    { Property }
  end;

  TJReedSolomonEncoder = class(TJavaGenericImport<JReedSolomonEncoderClass, JReedSolomonEncoder>) end;

  JReedSolomonExceptionClass = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
  ['{73256691-FF06-4BE3-AD4F-FB1AF1CDEF02}']
    { static Property Methods }

    { static Methods }
    {class} function init(amessage: JString): JReedSolomonException; cdecl; //(Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/common/reedsolomon/ReedSolomonException')]
  JReedSolomonException = interface(JException) // or JObject // SuperSignature: java/lang/Exception
  ['{B1984921-E195-4E5E-BA8E-E839E86A9612}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReedSolomonException = class(TJavaGenericImport<JReedSolomonExceptionClass, JReedSolomonException>) end;

  JStringUtilsClass = interface(JObjectClass)
  ['{C934AAAD-BB9B-4718-BF16-DAECDDEB0380}']
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
  ['{6A8FAB40-5BC3-4806-9A6B-2BFC5BDF4EFD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStringUtils = class(TJavaGenericImport<JStringUtilsClass, JStringUtils>) end;

  JDataMatrixReaderClass = interface(JObjectClass)
  ['{B66687B5-D18B-4261-B550-60D56646F1ED}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataMatrixReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/DataMatrixReader')]
  JDataMatrixReader = interface(JObject)
  ['{4122E25A-42AD-4825-B561-0592CB970728}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJDataMatrixReader = class(TJavaGenericImport<JDataMatrixReaderClass, JDataMatrixReader>) end;

  JDataMatrixWriterClass = interface(JObjectClass)
  ['{FCD2886D-AC54-4285-85FA-66F1A810AB3A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataMatrixWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/DataMatrixWriter')]
  JDataMatrixWriter = interface(JObject)
  ['{7C6CAFB1-B21F-4B1C-BE03-A224A689E0B5}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJDataMatrixWriter = class(TJavaGenericImport<JDataMatrixWriterClass, JDataMatrixWriter>) end;

  JBitMatrixParserClass = interface(JObjectClass)
  ['{FC96E570-2480-440B-9EAF-37F62BB03650}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/BitMatrixParser')]
  JBitMatrixParser = interface(JObject)
  ['{C2C5FA77-A283-430B-AFB7-CBA05E5C2EE0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitMatrixParser = class(TJavaGenericImport<JBitMatrixParserClass, JBitMatrixParser>) end;

  JDataBlockClass = interface(JObjectClass)
  ['{1EA35174-180F-40F5-B72F-C185C73D9A3B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/DataBlock')]
  JDataBlock = interface(JObject)
  ['{9B3BB26C-40C4-4430-BA39-02CA184F4630}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataBlock = class(TJavaGenericImport<JDataBlockClass, JDataBlock>) end;

  JDecodedBitStreamParser_ModeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{4E68BD43-8957-4C07-85FD-3C28BB761EE4}']
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
    {class} function valueOf(P1: JString): JDecodedBitStreamParser_Mode; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

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
  ['{7B702C98-219A-4E3A-B5A1-7BC429679B24}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedBitStreamParser_Mode = class(TJavaGenericImport<JDecodedBitStreamParser_ModeClass, JDecodedBitStreamParser_Mode>) end;

  JDecodedBitStreamParserClass = interface(JObjectClass)
  ['{C9D1F705-331B-4F59-9D70-12854CD88F68}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/DecodedBitStreamParser')]
  JDecodedBitStreamParser = interface(JObject)
  ['{9ED4063E-0C12-4AED-BB0C-3F0099E0D60A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedBitStreamParser = class(TJavaGenericImport<JDecodedBitStreamParserClass, JDecodedBitStreamParser>) end;

  JDecoder_082Class = interface(JObjectClass)
  ['{909DD475-66C2-4DDE-8495-17F37DAFDE08}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDecoder_082; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Decoder')]
  JDecoder_082 = interface(JObject)
  ['{58A04901-3824-433E-9E76-7DB71522A524}']
    { Property Methods }

    { methods }
    function decode(image: TJavaArray<Boolean>): JDecoderResult; cdecl; overload; //([[Z)Lcom/google/zxing/common/DecoderResult;
    function decode(bits: JBitMatrix): JDecoderResult; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;

    { Property }
  end;

  TJDecoder_082 = class(TJavaGenericImport<JDecoder_082Class, JDecoder_082>) end;

  JVersion_ECBClass = interface(JObjectClass)
  ['{F8A74072-6BDE-4A22-8C84-DD28DFA8D2DC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Version$ECB')]
  JVersion_ECB = interface(JObject)
  ['{C35F7F00-AC79-4690-B9C6-C3D16CD6999C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVersion_ECB = class(TJavaGenericImport<JVersion_ECBClass, JVersion_ECB>) end;

  JVersion_ECBlocksClass = interface(JObjectClass)
  ['{54445C75-16F7-4C2D-9ED5-96617BBE3143}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Version$ECBlocks')]
  JVersion_ECBlocks = interface(JObject)
  ['{6980E215-9A5C-45C1-96B5-DFDD89286442}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVersion_ECBlocks = class(TJavaGenericImport<JVersion_ECBlocksClass, JVersion_ECBlocks>) end;

  JVersionClass = interface(JObjectClass)
  ['{DA2E4B53-55A8-4D80-8F5B-412F945F4403}']
    { static Property Methods }

    { static Methods }
    {class} function getVersionForDimensions(numRows: Integer; numColumns: Integer): JVersion; cdecl; //(II)Lcom/google/zxing/datamatrix/decoder/Version;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/decoder/Version')]
  JVersion = interface(JObject)
  ['{A44B52D4-3DC9-45D5-96FB-4182DBB4169A}']
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

  JDetector_ResultPointsAndTransitionsClass = interface(JObjectClass)
  ['{C7224DAC-1292-4571-89C6-DAFCC324B896}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions')]
  JDetector_ResultPointsAndTransitions = interface(JObject)
  ['{CFF633A9-8CE5-48E6-B123-9FDE4EA66897}']
    { Property Methods }

    { methods }
    function getTransitions: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDetector_ResultPointsAndTransitions = class(TJavaGenericImport<JDetector_ResultPointsAndTransitionsClass, JDetector_ResultPointsAndTransitions>) end;

  JDetector_ResultPointsAndTransitionsComparatorClass = interface(JObjectClass)
  ['{FC1FE435-E62F-40C1-874B-EA661798D758}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitionsComparator')]
  JDetector_ResultPointsAndTransitionsComparator = interface(JObject)
  ['{4BC238EA-E680-4769-B481-DD416876A48D}']
    { Property Methods }

    { methods }
    function compare(o1: JDetector_ResultPointsAndTransitions; o2: JDetector_ResultPointsAndTransitions): Integer; cdecl; overload; //(Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;Lcom/google/zxing/datamatrix/detector/Detector$ResultPointsAndTransitions;)I
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I

    { Property }
  end;

  TJDetector_ResultPointsAndTransitionsComparator = class(TJavaGenericImport<JDetector_ResultPointsAndTransitionsComparatorClass, JDetector_ResultPointsAndTransitionsComparator>) end;

  JDetector_088Class = interface(JObjectClass)
  ['{83BCAB87-E591-42F5-AB7B-9959D8FC893E}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JDetector_088; cdecl; //(Lcom/google/zxing/common/BitMatrix;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/detector/Detector')]
  JDetector_088 = interface(JObject)
  ['{BDE15736-4F8B-4A36-92F8-B565E9C121D0}']
    { Property Methods }

    { methods }
    function detect: JDetectorResult; cdecl; //()Lcom/google/zxing/common/DetectorResult;

    { Property }
  end;

  TJDetector_088 = class(TJavaGenericImport<JDetector_088Class, JDetector_088>) end;

  JASCIIEncoderClass = interface(JObjectClass)
  ['{EA82233C-9D52-4677-86EE-BFF02EE54377}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/ASCIIEncoder')]
  JASCIIEncoder = interface(JObject)
  ['{20EB198C-E7A1-4C97-AD68-9DB3EBDD461D}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(context: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJASCIIEncoder = class(TJavaGenericImport<JASCIIEncoderClass, JASCIIEncoder>) end;

  JBase256EncoderClass = interface(JObjectClass)
  ['{FC0827F4-B8C5-405D-9CCF-99CC664CB19B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/Base256Encoder')]
  JBase256Encoder = interface(JObject)
  ['{3B239692-D1CE-49B2-86C3-E2490427CA9E}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(context: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJBase256Encoder = class(TJavaGenericImport<JBase256EncoderClass, JBase256Encoder>) end;

  JC40EncoderClass = interface(JObjectClass)
  ['{7B5FF0EB-7968-40A6-B19C-39B569DE7EF5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/C40Encoder')]
  JC40Encoder = interface(JObject)
  ['{49BAD40D-539A-4B1A-AF37-8087C0507E7E}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(context: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJC40Encoder = class(TJavaGenericImport<JC40EncoderClass, JC40Encoder>) end;

  JDataMatrixSymbolInfo144Class = interface(JSymbolInfoClass) // or JObjectClass // SuperSignature: com/google/zxing/datamatrix/encoder/SymbolInfo
  ['{76DEE448-EC44-4CDC-A40A-00BF9C7E7478}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/DataMatrixSymbolInfo144')]
  JDataMatrixSymbolInfo144 = interface(JSymbolInfo) // or JObject // SuperSignature: com/google/zxing/datamatrix/encoder/SymbolInfo
  ['{D5E67FC2-6186-421A-A880-F9B6F3597EF1}']
    { Property Methods }

    { methods }
    function getInterleavedBlockCount: Integer; cdecl; //()I
    function getDataLengthForInterleavedBlock(index: Integer): Integer; cdecl; //(I)I

    { Property }
  end;

  TJDataMatrixSymbolInfo144 = class(TJavaGenericImport<JDataMatrixSymbolInfo144Class, JDataMatrixSymbolInfo144>) end;

  JDefaultPlacementClass = interface(JObjectClass)
  ['{F06D44BF-3224-4ED7-A172-951CB5F98CBC}']
    { static Property Methods }

    { static Methods }
    {class} function init(codewords: JCharSequence; numcols: Integer; numrows: Integer): JDefaultPlacement; cdecl; //(Ljava/lang/CharSequence;II)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/DefaultPlacement')]
  JDefaultPlacement = interface(JObject)
  ['{8A1F4728-9F82-40DE-8FCB-7A1B86A04499}']
    { Property Methods }

    { methods }
    function getBit(col: Integer; row: Integer): Boolean; cdecl; //(II)Z
    procedure place; cdecl; //()V

    { Property }
  end;

  TJDefaultPlacement = class(TJavaGenericImport<JDefaultPlacementClass, JDefaultPlacement>) end;

  JEdifactEncoderClass = interface(JObjectClass)
  ['{3C1F6B5A-E1A1-4CAB-8B06-130EB93C2387}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/EdifactEncoder')]
  JEdifactEncoder = interface(JObject)
  ['{1D805008-1CD6-46B2-BE84-D6754C1059B5}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(context: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJEdifactEncoder = class(TJavaGenericImport<JEdifactEncoderClass, JEdifactEncoder>) end;

  JEncoder_095Class = interface(JObjectClass)
  ['{6C125830-2805-43D5-9984-6F75D926007C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/Encoder')]
  JEncoder_095 = interface(IJavaInstance)
  ['{0AED6816-D425-4678-86F6-AB1F9801BBC3}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(P1: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJEncoder_095 = class(TJavaGenericImport<JEncoder_095Class, JEncoder_095>) end;

  JEncoderContextClass = interface(JObjectClass)
  ['{C75B52C7-D0D0-4601-B644-7AF59F58CF02}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/EncoderContext')]
  JEncoderContext = interface(JObject)
  ['{31B58D08-20B0-4872-AA78-82FCF06D06AC}']
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
  ['{192607BA-535D-4428-9F6B-E1CF20AB6564}']
    { static Property Methods }

    { static Methods }
    {class} function encodeECC200(codewords: JString; symbolInfo: JSymbolInfo): JString; cdecl; //(Ljava/lang/String;Lcom/google/zxing/datamatrix/encoder/SymbolInfo;)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/ErrorCorrection')]
  JErrorCorrection = interface(JObject)
  ['{09B404EC-895C-439C-85A0-E1B219A3D0C5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJErrorCorrection = class(TJavaGenericImport<JErrorCorrectionClass, JErrorCorrection>) end;

  JHighLevelEncoder_098Class = interface(JObjectClass)
  ['{8DA7F045-B381-42BE-9F6A-6502ED58FEA9}']
    { static Property Methods }

    { static Methods }
    {class} function encodeHighLevel(msg: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function encodeHighLevel(msg: JString; shape: JSymbolShapeHint; minSize: JDimension; maxSize: JDimension): JString; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Lcom/google/zxing/Dimension;Lcom/google/zxing/Dimension;)Ljava/lang/String;
    {class} function determineConsecutiveDigitCount(msg: JCharSequence; startpos: Integer): Integer; cdecl; //(Ljava/lang/CharSequence;I)I

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/HighLevelEncoder')]
  JHighLevelEncoder_098 = interface(JObject)
  ['{60945C76-6D35-46C1-81E9-EC6191CDC09E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHighLevelEncoder_098 = class(TJavaGenericImport<JHighLevelEncoder_098Class, JHighLevelEncoder_098>) end;

  JSymbolInfoClass = interface(JObjectClass)
  ['{C3C2428C-BB7E-452D-A8A0-B83DD7FD2FD6}']
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
  ['{42A024B1-9793-4553-A25B-C0B611C6B48C}']
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

  JSymbolShapeHintClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{31B6D3CF-8E5E-4528-955D-74EB1BF184F8}']
    { static Property Methods }
    {class} function _GetFORCE_NONE: JSymbolShapeHint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;
    {class} function _GetFORCE_SQUARE: JSymbolShapeHint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;
    {class} function _GetFORCE_RECTANGLE: JSymbolShapeHint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    { static Methods }
    {class} function values: TJavaObjectArray<JSymbolShapeHint>; cdecl; //()[Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;
    {class} function valueOf(P1: JString): JSymbolShapeHint; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;

    { static Property }
    {class} property FORCE_NONE: JSymbolShapeHint read _GetFORCE_NONE;
    {class} property FORCE_SQUARE: JSymbolShapeHint read _GetFORCE_SQUARE;
    {class} property FORCE_RECTANGLE: JSymbolShapeHint read _GetFORCE_RECTANGLE;
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/SymbolShapeHint')]
  JSymbolShapeHint = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{BE4BD064-D1B7-4D91-AABE-D267711A49CA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSymbolShapeHint = class(TJavaGenericImport<JSymbolShapeHintClass, JSymbolShapeHint>) end;

  JTextEncoderClass = interface(JC40EncoderClass) // or JObjectClass // SuperSignature: com/google/zxing/datamatrix/encoder/C40Encoder
  ['{B86BB960-585F-421E-8FC6-94340963EC50}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/TextEncoder')]
  JTextEncoder = interface(JC40Encoder) // or JObject // SuperSignature: com/google/zxing/datamatrix/encoder/C40Encoder
  ['{423D9F9A-E59E-40C5-88A0-FDD4951F6316}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I

    { Property }
  end;

  TJTextEncoder = class(TJavaGenericImport<JTextEncoderClass, JTextEncoder>) end;

  JX12EncoderClass = interface(JC40EncoderClass) // or JObjectClass // SuperSignature: com/google/zxing/datamatrix/encoder/C40Encoder
  ['{D2EA5FB8-09B7-4A5C-8F9E-46A082D22BCC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/datamatrix/encoder/X12Encoder')]
  JX12Encoder = interface(JC40Encoder) // or JObject // SuperSignature: com/google/zxing/datamatrix/encoder/C40Encoder
  ['{EE7034FB-B0B3-4253-9546-5C8018F62856}']
    { Property Methods }

    { methods }
    function getEncodingMode: Integer; cdecl; //()I
    procedure encode(context: JEncoderContext); cdecl; //(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V

    { Property }
  end;

  TJX12Encoder = class(TJavaGenericImport<JX12EncoderClass, JX12Encoder>) end;

  JDecodeHintTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{79BA1364-EAD0-41A4-A7D0-AC34E26B0294}']
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
    {class} function valueOf(P1: JString): JDecodeHintType; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/DecodeHintType;

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
  ['{22BD9E4B-8508-4B60-B753-688FE2B1DA8F}']
    { Property Methods }

    { methods }
    function getValueType: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJDecodeHintType = class(TJavaGenericImport<JDecodeHintTypeClass, JDecodeHintType>) end;

  JDimensionClass = interface(JObjectClass)
  ['{01985FAC-1A6F-426F-9025-66B6EE713171}']
    { static Property Methods }

    { static Methods }
    {class} function init(width: Integer; height: Integer): JDimension; cdecl; //(II)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/Dimension')]
  JDimension = interface(JObject)
  ['{7E5986CD-23FD-43B4-AD89-C1E0340489E0}']
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
  ['{DD5A5171-5FC4-486B-8216-3A4A338D5297}']
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

    { static Methods }
    {class} function values: TJavaObjectArray<JEncodeHintType>; cdecl; //()[Lcom/google/zxing/EncodeHintType;
    {class} function valueOf(P1: JString): JEncodeHintType; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/EncodeHintType;

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
  end;

  [JavaSignature('com/google/zxing/EncodeHintType')]
  JEncodeHintType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{BFB6B257-7547-4B98-AA59-68FD190EBB17}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncodeHintType = class(TJavaGenericImport<JEncodeHintTypeClass, JEncodeHintType>) end;

  JFormatExceptionClass = interface(JReaderExceptionClass) // or JObjectClass // SuperSignature: com/google/zxing/ReaderException
  ['{A574131B-8B04-4398-8838-C8618F921335}']
    { static Property Methods }

    { static Methods }
    {class} function getFormatInstance: JFormatException; cdecl; overload; //()Lcom/google/zxing/FormatException;
    {class} function getFormatInstance(cause: JThrowable): JFormatException; cdecl; overload; //(Ljava/lang/Throwable;)Lcom/google/zxing/FormatException;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/FormatException')]
  JFormatException = interface(JReaderException) // or JObject // SuperSignature: com/google/zxing/ReaderException
  ['{D2A9D353-E170-47CC-8F01-5B81BF864148}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFormatException = class(TJavaGenericImport<JFormatExceptionClass, JFormatException>) end;

  JInvertedLuminanceSourceClass = interface(JLuminanceSourceClass) // or JObjectClass // SuperSignature: com/google/zxing/LuminanceSource
  ['{0EB026DF-6C48-4839-8376-C003B061EE90}']
    { static Property Methods }

    { static Methods }
    {class} function init(delegate: JLuminanceSource): JInvertedLuminanceSource; cdecl; //(Lcom/google/zxing/LuminanceSource;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/InvertedLuminanceSource')]
  JInvertedLuminanceSource = interface(JLuminanceSource) // or JObject // SuperSignature: com/google/zxing/LuminanceSource
  ['{5C6EAD7F-CE99-4CF2-AEB9-61A6D7CB1F2F}']
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

  JLuminanceSourceClass = interface(JObjectClass)
  ['{69ECB82F-62E0-4D8A-8634-1C6692742615}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/LuminanceSource')]
  JLuminanceSource = interface(JObject)
  ['{4DF6DF97-D47E-4705-95D7-5A296F2D7741}']
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

//  JBitMatrixParser_109Class = interface(JObjectClass)
//  ['{827FD3DC-74A7-4510-8BCF-AF94E79D1644}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/maxicode/decoder/BitMatrixParser')]
//  JBitMatrixParser_109 = interface(JObject)
//  ['{16B78E26-E6DA-41A2-97A5-BF57712EEB00}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJBitMatrixParser_109 = class(TJavaGenericImport<JBitMatrixParser_109Class, JBitMatrixParser_109>) end;

//  JDecodedBitStreamParser_110Class = interface(JObjectClass)
//  ['{38A284D2-5E88-4F3A-BE24-1F55B1B27D4B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/maxicode/decoder/DecodedBitStreamParser')]
//  JDecodedBitStreamParser_110 = interface(JObject)
//  ['{42C355CE-EBD4-4C5C-8882-BECB413FADA3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_110 = class(TJavaGenericImport<JDecodedBitStreamParser_110Class, JDecodedBitStreamParser_110>) end;

//  JDecoder_111Class = interface(JObjectClass)
//  ['{307BDC6C-F350-4A3A-8A28-80AB3FFFAEC8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDecoder_111; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/maxicode/decoder/Decoder')]
//  JDecoder_111 = interface(JObject)
//  ['{E5603727-2E20-4C2A-9C40-B9610A5BD9B5}']
//    { Property Methods }
//
//    { methods }
//    function decode(bits: JBitMatrix): JDecoderResult; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
//    function decode(bits: JBitMatrix; hints: JMap): JDecoderResult; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
//
//    { Property }
//  end;

//  TJDecoder_111 = class(TJavaGenericImport<JDecoder_111Class, JDecoder_111>) end;

  JMaxiCodeReaderClass = interface(JObjectClass)
  ['{666562B8-D034-4106-9D53-471CFF393592}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMaxiCodeReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/maxicode/MaxiCodeReader')]
  JMaxiCodeReader = interface(JObject)
  ['{910C62BD-CF08-4824-9262-D08DD763C814}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJMaxiCodeReader = class(TJavaGenericImport<JMaxiCodeReaderClass, JMaxiCodeReader>) end;

  JByQuadrantReaderClass = interface(JObjectClass)
  ['{1CEF62B9-A9DF-4BDA-B195-86D4318ED271}']
    { static Property Methods }

    { static Methods }
    {class} function init(delegate: JReader): JByQuadrantReader; cdecl; //(Lcom/google/zxing/Reader;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/ByQuadrantReader')]
  JByQuadrantReader = interface(JObject)
  ['{7D79830E-EF3E-4F84-95D3-38372EACCD94}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJByQuadrantReader = class(TJavaGenericImport<JByQuadrantReaderClass, JByQuadrantReader>) end;

  JGenericMultipleBarcodeReaderClass = interface(JObjectClass)
  ['{051E3A37-7F37-4EE0-A685-E8F662F57276}']
    { static Property Methods }

    { static Methods }
    {class} function init(delegate: JReader): JGenericMultipleBarcodeReader; cdecl; //(Lcom/google/zxing/Reader;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/GenericMultipleBarcodeReader')]
  JGenericMultipleBarcodeReader = interface(JObject)
  ['{9027F716-7299-4505-A4FF-E760F00BFC71}']
    { Property Methods }

    { methods }
    function decodeMultiple(image: JBinaryBitmap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    function decodeMultiple(image: JBinaryBitmap; hints: JMap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    { Property }
  end;

  TJGenericMultipleBarcodeReader = class(TJavaGenericImport<JGenericMultipleBarcodeReaderClass, JGenericMultipleBarcodeReader>) end;

  JMultipleBarcodeReaderClass = interface(JObjectClass)
  ['{7563FFA6-DFB0-48B2-AEC1-311DB621D577}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/MultipleBarcodeReader')]
  JMultipleBarcodeReader = interface(IJavaInstance)
  ['{A3EBEBFF-510E-4B2B-8DA6-67440AF86FB0}']
    { Property Methods }

    { methods }
    function decodeMultiple(P1: JBinaryBitmap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    function decodeMultiple(P1: JBinaryBitmap; P2: JMap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    { Property }
  end;

  TJMultipleBarcodeReader = class(TJavaGenericImport<JMultipleBarcodeReaderClass, JMultipleBarcodeReader>) end;

  JMultiDetectorClass = interface(JDetector_230Class) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/detector/Detector
  ['{0B397E89-6B0E-4488-B232-F28E6A8C4690}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JMultiDetector; cdecl; //(Lcom/google/zxing/common/BitMatrix;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiDetector')]
  JMultiDetector = interface(JDetector_230) // or JObject // SuperSignature: com/google/zxing/qrcode/detector/Detector
  ['{5E2A2F39-2CDC-459A-91D9-93A1AD1941B8}']
    { Property Methods }

    { methods }
    function detectMulti(hints: JMap): TJavaObjectArray<JDetectorResult>; cdecl; //(Ljava/util/Map;)[Lcom/google/zxing/common/DetectorResult;

    { Property }
  end;

  TJMultiDetector = class(TJavaGenericImport<JMultiDetectorClass, JMultiDetector>) end;

  JMultiFinderPatternFinder_ModuleSizeComparatorClass = interface(JObjectClass)
  ['{7F06D9BF-432B-4C2D-893A-28C7648A4B98}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator')]
  JMultiFinderPatternFinder_ModuleSizeComparator = interface(JObject)
  ['{1878EB34-9A9A-4FE1-88E2-0AA94CE9E6B8}']
    { Property Methods }

    { methods }
    function compare(center1: JFinderPattern; center2: JFinderPattern): Integer; cdecl; overload; //(Lcom/google/zxing/qrcode/detector/FinderPattern;Lcom/google/zxing/qrcode/detector/FinderPattern;)I
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I

    { Property }
  end;

  TJMultiFinderPatternFinder_ModuleSizeComparator = class(TJavaGenericImport<JMultiFinderPatternFinder_ModuleSizeComparatorClass, JMultiFinderPatternFinder_ModuleSizeComparator>) end;

  JMultiFinderPatternFinderClass = interface(JFinderPatternFinderClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/detector/FinderPatternFinder
  ['{7B5C50BB-A981-4070-BF7C-E528303F2D3C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder')]
  JMultiFinderPatternFinder = interface(JFinderPatternFinder) // or JObject // SuperSignature: com/google/zxing/qrcode/detector/FinderPatternFinder
  ['{80949F98-8937-428B-937F-6565F63D5FBB}']
    { Property Methods }

    { methods }
    function findMulti(hints: JMap): TJavaObjectArray<JFinderPatternInfo>; cdecl; //(Ljava/util/Map;)[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    { Property }
  end;

  TJMultiFinderPatternFinder = class(TJavaGenericImport<JMultiFinderPatternFinderClass, JMultiFinderPatternFinder>) end;

  JQRCodeMultiReader_SAComparatorClass = interface(JObjectClass)
  ['{ADC5BB8E-EAA6-4780-A279-AEFC73052AC6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator')]
  JQRCodeMultiReader_SAComparator = interface(JObject)
  ['{088BA457-859B-422E-A36C-D26030D0093B}']
    { Property Methods }

    { methods }
    function compare(a: JResult; b: JResult): Integer; cdecl; overload; //(Lcom/google/zxing/Result;Lcom/google/zxing/Result;)I
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I

    { Property }
  end;

  TJQRCodeMultiReader_SAComparator = class(TJavaGenericImport<JQRCodeMultiReader_SAComparatorClass, JQRCodeMultiReader_SAComparator>) end;

  JQRCodeMultiReaderClass = interface(JQRCodeReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/QRCodeReader
  ['{3F11E563-9FED-422E-A74B-3A92B6B38342}']
    { static Property Methods }

    { static Methods }
    {class} function init: JQRCodeMultiReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/multi/qrcode/QRCodeMultiReader')]
  JQRCodeMultiReader = interface(JQRCodeReader) // or JObject // SuperSignature: com/google/zxing/qrcode/QRCodeReader
  ['{BE1483E7-5EA3-4713-8B75-A9B77C140F25}']
    { Property Methods }

    { methods }
    function decodeMultiple(image: JBinaryBitmap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    function decodeMultiple(image: JBinaryBitmap; hints: JMap): TJavaObjectArray<JResult>; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    { Property }
  end;

  TJQRCodeMultiReader = class(TJavaGenericImport<JQRCodeMultiReaderClass, JQRCodeMultiReader>) end;

  JMultiFormatReaderClass = interface(JObjectClass)
  ['{E4E8D9CC-1839-4F57-A319-8A49F1D0392E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMultiFormatReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/MultiFormatReader')]
  JMultiFormatReader = interface(JObject)
  ['{E8EE5D65-C178-410C-B795-9A184A0A483D}']
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

  JMultiFormatWriterClass = interface(JObjectClass)
  ['{63049C3C-9E24-420C-9D1E-10D6EE2E232A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMultiFormatWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/MultiFormatWriter')]
  JMultiFormatWriter = interface(JObject)
  ['{8C19104A-637D-45F7-A808-38AEDBE77D8D}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJMultiFormatWriter = class(TJavaGenericImport<JMultiFormatWriterClass, JMultiFormatWriter>) end;

  JNotFoundExceptionClass = interface(JReaderExceptionClass) // or JObjectClass // SuperSignature: com/google/zxing/ReaderException
  ['{A837130F-B3BF-412D-A0E1-9E8539662541}']
    { static Property Methods }

    { static Methods }
    {class} function getNotFoundInstance: JNotFoundException; cdecl; //()Lcom/google/zxing/NotFoundException;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/NotFoundException')]
  JNotFoundException = interface(JReaderException) // or JObject // SuperSignature: com/google/zxing/ReaderException
  ['{E552ABBB-F543-4DC6-A605-18DB25BAE06B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNotFoundException = class(TJavaGenericImport<JNotFoundExceptionClass, JNotFoundException>) end;

  JCodaBarReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{83FC2910-6E85-4074-A5CA-8802CBDBD0D1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCodaBarReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/CodaBarReader')]
  JCodaBarReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{6FBA8BB8-3B5D-4D9F-B431-C79F6FF8DF4E}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJCodaBarReader = class(TJavaGenericImport<JCodaBarReaderClass, JCodaBarReader>) end;

  JCodaBarWriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{46F01F1F-8738-4453-977A-4DC470F2B68E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCodaBarWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/CodaBarWriter')]
  JCodaBarWriter = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{42DD8AFC-B539-4BC4-9458-F9C5C0E022D6}']
    { Property Methods }

    { methods }
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJCodaBarWriter = class(TJavaGenericImport<JCodaBarWriterClass, JCodaBarWriter>) end;

  JCode128ReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{5F61A942-B476-4CD5-9A41-471A0A8AB5F8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode128Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code128Reader')]
  JCode128Reader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{0072A7EA-F7E6-4DB6-B89A-7365CCA61393}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJCode128Reader = class(TJavaGenericImport<JCode128ReaderClass, JCode128Reader>) end;

  JCode128WriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{A03864C9-4701-4BEF-8C40-3D782A03DD3C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode128Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code128Writer')]
  JCode128Writer = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{BF3B4100-2808-4788-8EA0-F7106668031C}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJCode128Writer = class(TJavaGenericImport<JCode128WriterClass, JCode128Writer>) end;

  JCode39ReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{5A6D1CF5-8B43-4782-8064-FA321A8C6BAE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode39Reader; cdecl; overload; //()V
    {class} function init(usingCheckDigit: Boolean): JCode39Reader; cdecl; overload; //(Z)V
    {class} function init(usingCheckDigit: Boolean; extendedMode: Boolean): JCode39Reader; cdecl; overload; //(ZZ)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code39Reader')]
  JCode39Reader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{8B1CFB7B-9097-4FC7-818B-B3EBDCE0EA43}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJCode39Reader = class(TJavaGenericImport<JCode39ReaderClass, JCode39Reader>) end;

  JCode39WriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{29675F43-5B50-4E39-AEF1-DFFA33EAA7F5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode39Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code39Writer')]
  JCode39Writer = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{5F09F157-B779-49C6-8BD5-846A11B317CF}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJCode39Writer = class(TJavaGenericImport<JCode39WriterClass, JCode39Writer>) end;

  JCode93ReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{EE16B26C-264F-4E79-945D-800C97894E11}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCode93Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/Code93Reader')]
  JCode93Reader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{65532B20-FE3E-4306-9526-1A649EC25291}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJCode93Reader = class(TJavaGenericImport<JCode93ReaderClass, JCode93Reader>) end;

  JEAN13ReaderClass = interface(JUPCEANReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{6E0E5B6C-ACC3-4D53-8A94-7A5A78D3EF14}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEAN13Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/EAN13Reader')]
  JEAN13Reader = interface(JUPCEANReader) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{4A4DD505-90C3-4F10-8B21-3AE10879D3DF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEAN13Reader = class(TJavaGenericImport<JEAN13ReaderClass, JEAN13Reader>) end;

  JEAN13WriterClass = interface(JUPCEANWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANWriter
  ['{74EE4F7B-24FC-4043-A20F-35C69521C38E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEAN13Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/EAN13Writer')]
  JEAN13Writer = interface(JUPCEANWriter) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANWriter
  ['{1F13B3EF-A298-4F50-A061-7E46EFC25D26}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJEAN13Writer = class(TJavaGenericImport<JEAN13WriterClass, JEAN13Writer>) end;

  JEAN8ReaderClass = interface(JUPCEANReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{56C1A4A2-F602-458E-BF74-B3784551E8AD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEAN8Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/EAN8Reader')]
  JEAN8Reader = interface(JUPCEANReader) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{54826D55-2044-49D9-B200-321E98A287F7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEAN8Reader = class(TJavaGenericImport<JEAN8ReaderClass, JEAN8Reader>) end;

  JEAN8WriterClass = interface(JUPCEANWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANWriter
  ['{83754C58-10D6-4C64-9AF1-3435B6C398C1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEAN8Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/EAN8Writer')]
  JEAN8Writer = interface(JUPCEANWriter) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANWriter
  ['{E53D2368-C676-4666-9B67-99B7D995E297}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJEAN8Writer = class(TJavaGenericImport<JEAN8WriterClass, JEAN8Writer>) end;

  JEANManufacturerOrgSupportClass = interface(JObjectClass)
  ['{3E2A10BC-D8FA-4F66-A487-3FEC5508572F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/EANManufacturerOrgSupport')]
  JEANManufacturerOrgSupport = interface(JObject)
  ['{28152D06-B81E-47ED-98BA-8F38BC40429F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEANManufacturerOrgSupport = class(TJavaGenericImport<JEANManufacturerOrgSupportClass, JEANManufacturerOrgSupport>) end;

  JITFReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{E37F9FA4-3FA4-4E66-A606-179FAA5F8535}']
    { static Property Methods }

    { static Methods }
    {class} function init: JITFReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/ITFReader')]
  JITFReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{3880D539-85B1-4276-8199-F73D400F43D8}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJITFReader = class(TJavaGenericImport<JITFReaderClass, JITFReader>) end;

  JITFWriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{8BBA1475-D997-4BE7-9140-293BDC723F49}']
    { static Property Methods }

    { static Methods }
    {class} function init: JITFWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/ITFWriter')]
  JITFWriter = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{281B3E31-C81A-4B1C-BE7F-3BA038614463}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJITFWriter = class(TJavaGenericImport<JITFWriterClass, JITFWriter>) end;

  JMultiFormatOneDReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{7EB91D1A-F1FB-4C18-9108-8D29E09C29EE}']
    { static Property Methods }

    { static Methods }
    {class} function init(hints: JMap): JMultiFormatOneDReader; cdecl; //(Ljava/util/Map;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/MultiFormatOneDReader')]
  JMultiFormatOneDReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{02FE973B-048A-4BCC-A7A0-20AC1F5A1A12}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJMultiFormatOneDReader = class(TJavaGenericImport<JMultiFormatOneDReaderClass, JMultiFormatOneDReader>) end;

  JMultiFormatUPCEANReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{55874223-C4D4-4D32-A078-137A3AD567A1}']
    { static Property Methods }

    { static Methods }
    {class} function init(hints: JMap): JMultiFormatUPCEANReader; cdecl; //(Ljava/util/Map;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/MultiFormatUPCEANReader')]
  JMultiFormatUPCEANReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{802A1D68-642B-41FF-8315-1661E197BC59}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJMultiFormatUPCEANReader = class(TJavaGenericImport<JMultiFormatUPCEANReaderClass, JMultiFormatUPCEANReader>) end;

  JOneDimensionalCodeWriterClass = interface(JObjectClass)
  ['{39DFCC99-96B9-4ADB-B5E6-E39E82E4601A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOneDimensionalCodeWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/OneDimensionalCodeWriter')]
  JOneDimensionalCodeWriter = interface(JObject)
  ['{4260FBD5-7E49-4EBA-9974-CACF48A29148}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function getDefaultMargin: Integer; cdecl; //()I
    function encode(P1: JString): TJavaArray<Boolean>; cdecl; overload; //(Ljava/lang/String;)[Z

    { Property }
  end;

  TJOneDimensionalCodeWriter = class(TJavaGenericImport<JOneDimensionalCodeWriterClass, JOneDimensionalCodeWriter>) end;

  JOneDReaderClass = interface(JObjectClass)
  ['{4252CE9D-64C1-4F0C-931A-CACEE11907B5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOneDReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/OneDReader')]
  JOneDReader = interface(JObject)
  ['{1BB98A92-E526-4D8D-8F57-74C0FB75E25B}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V
    function decodeRow(P1: Integer; P2: JBitArray; P3: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJOneDReader = class(TJavaGenericImport<JOneDReaderClass, JOneDReader>) end;

  JAbstractRSSReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{4CCC8B4D-F1D0-4024-8726-82DA58563C4B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/AbstractRSSReader')]
  JAbstractRSSReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{D4E0E78C-A7D1-4307-8E45-ED2A6A89E50B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAbstractRSSReader = class(TJavaGenericImport<JAbstractRSSReaderClass, JAbstractRSSReader>) end;

  JDataCharacterClass = interface(JObjectClass)
  ['{88038421-28DD-4572-B549-EC3C4A7FFC8D}']
    { static Property Methods }

    { static Methods }
    {class} function init(value: Integer; checksumPortion: Integer): JDataCharacter; cdecl; //(II)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/DataCharacter')]
  JDataCharacter = interface(JObject)
  ['{11A8F6EB-3B9B-4F98-A2B9-0E805326002B}']
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
  ['{1064D4CA-30BE-4893-87F6-D1B16307B0A5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/BitArrayBuilder')]
  JBitArrayBuilder = interface(JObject)
  ['{04FA1701-D962-4523-A919-3331321E1BC6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitArrayBuilder = class(TJavaGenericImport<JBitArrayBuilderClass, JBitArrayBuilder>) end;

  JAbstractExpandedDecoderClass = interface(JObjectClass)
  ['{C6156041-5182-4215-B692-3124069C519B}']
    { static Property Methods }

    { static Methods }
    {class} function createDecoder(information: JBitArray): JAbstractExpandedDecoder; cdecl; //(Lcom/google/zxing/common/BitArray;)Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder')]
  JAbstractExpandedDecoder = interface(JObject)
  ['{9899C2A6-5E14-4668-AE10-A481A99E7E6D}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAbstractExpandedDecoder = class(TJavaGenericImport<JAbstractExpandedDecoderClass, JAbstractExpandedDecoder>) end;

  JAI013103decoderClass = interface(JAI013x0xDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder
  ['{9DFAEB66-FE6B-4FBB-9B81-3A233A54CC35}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI013103decoder')]
  JAI013103decoder = interface(JAI013x0xDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder
  ['{3BA25AD8-E7B8-4CF8-B1D9-741D93E9AF4B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAI013103decoder = class(TJavaGenericImport<JAI013103decoderClass, JAI013103decoder>) end;

  JAI01320xDecoderClass = interface(JAI013x0xDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder
  ['{118EB07E-CFE2-45C2-A78A-16186F0CE0F4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01320xDecoder')]
  JAI01320xDecoder = interface(JAI013x0xDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder
  ['{30135FE6-7980-475B-BBD0-C81E067BA107}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAI01320xDecoder = class(TJavaGenericImport<JAI01320xDecoderClass, JAI01320xDecoder>) end;

  JAI01392xDecoderClass = interface(JAI01decoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{21D3AA31-3B02-4A34-8353-B6FBDAE7F78F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder')]
  JAI01392xDecoder = interface(JAI01decoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{7ED07F90-4BA1-4690-A658-BC5A5BAEE852}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAI01392xDecoder = class(TJavaGenericImport<JAI01392xDecoderClass, JAI01392xDecoder>) end;

  JAI01393xDecoderClass = interface(JAI01decoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{35165083-713B-4124-BED6-630DCEE67BB5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01393xDecoder')]
  JAI01393xDecoder = interface(JAI01decoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{815A3866-977C-4A47-8A2D-4425F6C83AD3}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAI01393xDecoder = class(TJavaGenericImport<JAI01393xDecoderClass, JAI01393xDecoder>) end;

  JAI013x0x1xDecoderClass = interface(JAI01weightDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder
  ['{8A4DE8A1-8D4C-4C84-AFC4-24DC868EC91F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder')]
  JAI013x0x1xDecoder = interface(JAI01weightDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder
  ['{95D48A6D-3C1D-45B1-85D9-FC8D946CFA2A}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAI013x0x1xDecoder = class(TJavaGenericImport<JAI013x0x1xDecoderClass, JAI013x0x1xDecoder>) end;

  JAI013x0xDecoderClass = interface(JAI01weightDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder
  ['{4498AC79-9EE6-4513-999E-63DC0818C1C1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI013x0xDecoder')]
  JAI013x0xDecoder = interface(JAI01weightDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder
  ['{4C9E5D28-6691-445F-A146-2D7D011C28F4}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAI013x0xDecoder = class(TJavaGenericImport<JAI013x0xDecoderClass, JAI013x0xDecoder>) end;

  JAI01AndOtherAIsClass = interface(JAI01decoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{AE37FA26-040C-4199-8262-A4B99EF9118D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01AndOtherAIs')]
  JAI01AndOtherAIs = interface(JAI01decoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{455D2067-C4E3-4C4F-8DDD-5FF523368062}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAI01AndOtherAIs = class(TJavaGenericImport<JAI01AndOtherAIsClass, JAI01AndOtherAIs>) end;

  JAI01decoderClass = interface(JAbstractExpandedDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder
  ['{F9002614-1CD5-4674-8B98-7545B1ADC5A2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01decoder')]
  JAI01decoder = interface(JAbstractExpandedDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder
  ['{00C48EB3-073A-481E-9569-12AA329414E7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAI01decoder = class(TJavaGenericImport<JAI01decoderClass, JAI01decoder>) end;

  JAI01weightDecoderClass = interface(JAI01decoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{FCD6BFE0-C147-4F6A-BDEF-EEE9D8ED4F4A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AI01weightDecoder')]
  JAI01weightDecoder = interface(JAI01decoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AI01decoder
  ['{561DD45D-D1A2-4923-AEE5-FF6E4558C6D6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAI01weightDecoder = class(TJavaGenericImport<JAI01weightDecoderClass, JAI01weightDecoder>) end;

  JAnyAIDecoderClass = interface(JAbstractExpandedDecoderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder
  ['{E3C96EFE-5E0B-4415-B6FE-9E6C8582975D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/AnyAIDecoder')]
  JAnyAIDecoder = interface(JAbstractExpandedDecoder) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder
  ['{53102C15-4FC4-45E5-8753-85F74FC0DB9B}']
    { Property Methods }

    { methods }
    function parseInformation: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAnyAIDecoder = class(TJavaGenericImport<JAnyAIDecoderClass, JAnyAIDecoder>) end;

  JBlockParsedResultClass = interface(JObjectClass)
  ['{201E3506-0710-47B1-B249-06648D025C3A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/BlockParsedResult')]
  JBlockParsedResult = interface(JObject)
  ['{4CC1F5B9-801F-4B9A-95F5-FAD25898B509}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBlockParsedResult = class(TJavaGenericImport<JBlockParsedResultClass, JBlockParsedResult>) end;

  JCurrentParsingState_StateClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{0CA5F121-2F35-4265-B100-26E78DCB66FA}']
    { static Property Methods }
    {class} function _GetNUMERIC: JCurrentParsingState_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;
    {class} function _GetALPHA: JCurrentParsingState_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;
    {class} function _GetISO_IEC_646: JCurrentParsingState_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    { static Methods }
    {class} function values: TJavaObjectArray<JCurrentParsingState_State>; cdecl; //()[Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;
    {class} function valueOf(P1: JString): JCurrentParsingState_State; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State;

    { static Property }
    {class} property NUMERIC: JCurrentParsingState_State read _GetNUMERIC;
    {class} property ALPHA: JCurrentParsingState_State read _GetALPHA;
    {class} property ISO_IEC_646: JCurrentParsingState_State read _GetISO_IEC_646;
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State')]
  JCurrentParsingState_State = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{B61EE374-C791-4D3E-8550-F9279C5CD8AD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCurrentParsingState_State = class(TJavaGenericImport<JCurrentParsingState_StateClass, JCurrentParsingState_State>) end;

  JCurrentParsingStateClass = interface(JObjectClass)
  ['{A19982AC-25C9-4AA9-9B3D-3FBAB4FC8E3E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/CurrentParsingState')]
  JCurrentParsingState = interface(JObject)
  ['{883BD4E3-A560-432D-A678-DEA096BD6B4F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCurrentParsingState = class(TJavaGenericImport<JCurrentParsingStateClass, JCurrentParsingState>) end;

  JDecodedCharClass = interface(JDecodedObjectClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{9166A041-325E-43CB-BCC6-366009971F61}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedChar')]
  JDecodedChar = interface(JDecodedObject) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{5EAE26F8-BADC-45D1-B8E7-1C89A6152740}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedChar = class(TJavaGenericImport<JDecodedCharClass, JDecodedChar>) end;

  JDecodedInformationClass = interface(JDecodedObjectClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{424C1584-BB8D-4DEB-BA83-6B96853654EE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedInformation')]
  JDecodedInformation = interface(JDecodedObject) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{8241686C-5E80-4E6C-A773-969EBB1E67A4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedInformation = class(TJavaGenericImport<JDecodedInformationClass, JDecodedInformation>) end;

  JDecodedNumericClass = interface(JDecodedObjectClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{4BBE760D-FFF3-4F6E-B5B5-263DE79AB793}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedNumeric')]
  JDecodedNumeric = interface(JDecodedObject) // or JObject // SuperSignature: com/google/zxing/oned/rss/expanded/decoders/DecodedObject
  ['{B6F6C473-2A2F-4F83-9B04-3638D8CD91AB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedNumeric = class(TJavaGenericImport<JDecodedNumericClass, JDecodedNumeric>) end;

  JDecodedObjectClass = interface(JObjectClass)
  ['{E068F1B6-6348-49E9-ACFC-D2E1843CBA84}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/DecodedObject')]
  JDecodedObject = interface(JObject)
  ['{6CE012D5-E753-45B1-9B40-8763F7E1E818}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodedObject = class(TJavaGenericImport<JDecodedObjectClass, JDecodedObject>) end;

  JFieldParserClass = interface(JObjectClass)
  ['{AC53611A-F123-45C7-B58F-C156E248C1FA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/FieldParser')]
  JFieldParser = interface(JObject)
  ['{D9A9AA3E-FB5E-4077-9753-220ADE7B2669}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFieldParser = class(TJavaGenericImport<JFieldParserClass, JFieldParser>) end;

  JGeneralAppIdDecoderClass = interface(JObjectClass)
  ['{E011718D-EACD-4025-9FDC-FC638DBD942B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder')]
  JGeneralAppIdDecoder = interface(JObject)
  ['{7E5BA2CB-04DD-45C6-A39A-BF3883ACAE95}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGeneralAppIdDecoder = class(TJavaGenericImport<JGeneralAppIdDecoderClass, JGeneralAppIdDecoder>) end;

  JExpandedPairClass = interface(JObjectClass)
  ['{E525B841-5BBC-4D45-9175-7FF9335E7DDC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/ExpandedPair')]
  JExpandedPair = interface(JObject)
  ['{CE30E2F7-65E3-430A-AA79-210602800B99}']
    { Property Methods }

    { methods }
    function mustBeLast: Boolean; cdecl; //()Z
    function toString: JString; cdecl; //()Ljava/lang/String;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJExpandedPair = class(TJavaGenericImport<JExpandedPairClass, JExpandedPair>) end;

  JExpandedRowClass = interface(JObjectClass)
  ['{F5865353-6BBA-4E91-9AAD-6010418DAAA0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/ExpandedRow')]
  JExpandedRow = interface(JObject)
  ['{441C00A4-586C-4EEC-ABD1-24CDA5073CB7}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJExpandedRow = class(TJavaGenericImport<JExpandedRowClass, JExpandedRow>) end;

  JRSSExpandedReaderClass = interface(JAbstractRSSReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/AbstractRSSReader
  ['{05D8D06C-6C58-41EC-A7A5-2C48DD027647}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRSSExpandedReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/expanded/RSSExpandedReader')]
  JRSSExpandedReader = interface(JAbstractRSSReader) // or JObject // SuperSignature: com/google/zxing/oned/rss/AbstractRSSReader
  ['{F2702E06-F61B-43E2-9312-B37A8C4B500E}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJRSSExpandedReader = class(TJavaGenericImport<JRSSExpandedReaderClass, JRSSExpandedReader>) end;

  JFinderPatternClass = interface(JObjectClass)
  ['{429D6F02-8257-4885-A7E2-878CC9B9925E}']
    { static Property Methods }

    { static Methods }
    {class} function init(value: Integer; startEnd: TJavaArray<Integer>; start: Integer; aend: Integer; rowNumber: Integer): JFinderPattern; cdecl; //(I[IIII)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/FinderPattern')]
  JFinderPattern = interface(JObject)
  ['{ED9BEDF7-4923-4CCD-AED1-D13FEA344699}']
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
  ['{772A29D9-542F-45E0-92C8-E7979DE5549A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/Pair')]
  JPair = interface(JDataCharacter) // or JObject // SuperSignature: com/google/zxing/oned/rss/DataCharacter
  ['{C2CE4F49-E5FC-4B73-906B-20E527B3AC37}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPair = class(TJavaGenericImport<JPairClass, JPair>) end;

  JRSS14ReaderClass = interface(JAbstractRSSReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/rss/AbstractRSSReader
  ['{3D506D97-2FC9-4183-B1E1-91159A751274}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRSS14Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/RSS14Reader')]
  JRSS14Reader = interface(JAbstractRSSReader) // or JObject // SuperSignature: com/google/zxing/oned/rss/AbstractRSSReader
  ['{7FEB4FF5-E7B9-486F-B4DC-FDB4D5498CAE}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJRSS14Reader = class(TJavaGenericImport<JRSS14ReaderClass, JRSS14Reader>) end;

  JRSSUtilsClass = interface(JObjectClass)
  ['{4CAB0DDB-D5A0-40DE-BDED-697F30840E11}']
    { static Property Methods }

    { static Methods }
    {class} function getRSSvalue(widths: TJavaArray<Integer>; maxWidth: Integer; noNarrow: Boolean): Integer; cdecl; //([IIZ)I

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/rss/RSSUtils')]
  JRSSUtils = interface(JObject)
  ['{D1D7E970-67AE-4D9F-A89F-7233B045750F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRSSUtils = class(TJavaGenericImport<JRSSUtilsClass, JRSSUtils>) end;

  JUPCAReaderClass = interface(JUPCEANReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{EC8DF074-3C03-4C51-8A48-2EE55B7E5AD4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCAReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCAReader')]
  JUPCAReader = interface(JUPCEANReader) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{5183E68D-39F0-48C2-99F0-7138E9C15990}']
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
  ['{179D14D3-18B1-471F-B33E-E6439535EC20}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCAWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCAWriter')]
  JUPCAWriter = interface(JObject)
  ['{C5338EA9-8BF2-4543-92C6-986446D5A13E}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJUPCAWriter = class(TJavaGenericImport<JUPCAWriterClass, JUPCAWriter>) end;

  JUPCEANExtension2SupportClass = interface(JObjectClass)
  ['{552A6D70-A144-47E1-97C2-4BCFC4470C5D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANExtension2Support')]
  JUPCEANExtension2Support = interface(JObject)
  ['{EA59251C-E899-4E60-AA7E-C9DDB55E1546}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUPCEANExtension2Support = class(TJavaGenericImport<JUPCEANExtension2SupportClass, JUPCEANExtension2Support>) end;

  JUPCEANExtension5SupportClass = interface(JObjectClass)
  ['{A7C70905-089F-499E-9CDD-2F22D30AE337}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANExtension5Support')]
  JUPCEANExtension5Support = interface(JObject)
  ['{5F6209BC-D376-458F-9E70-9616048557F6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUPCEANExtension5Support = class(TJavaGenericImport<JUPCEANExtension5SupportClass, JUPCEANExtension5Support>) end;

  JUPCEANExtensionSupportClass = interface(JObjectClass)
  ['{2105F58C-64F7-470F-AC48-3E2A7DD74149}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANExtensionSupport')]
  JUPCEANExtensionSupport = interface(JObject)
  ['{7FF40D71-E07C-42C2-908C-E7C54CF3B2F8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUPCEANExtensionSupport = class(TJavaGenericImport<JUPCEANExtensionSupportClass, JUPCEANExtensionSupport>) end;

  JUPCEANReaderClass = interface(JOneDReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDReader
  ['{37A05A11-8721-4BA0-8037-0FEB9BAC07E4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANReader')]
  JUPCEANReader = interface(JOneDReader) // or JObject // SuperSignature: com/google/zxing/oned/OneDReader
  ['{F3BBBE03-3DE3-4E69-B306-B6C41024A1D9}']
    { Property Methods }

    { methods }
    function decodeRow(rowNumber: Integer; row: JBitArray; hints: JMap): JResult; cdecl; overload; //(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    function decodeRow(rowNumber: Integer; row: JBitArray; startGuardRange: TJavaArray<Integer>; hints: JMap): JResult; cdecl; overload; //(ILcom/google/zxing/common/BitArray;[ILjava/util/Map;)Lcom/google/zxing/Result;

    { Property }
  end;

  TJUPCEANReader = class(TJavaGenericImport<JUPCEANReaderClass, JUPCEANReader>) end;

  JUPCEANWriterClass = interface(JOneDimensionalCodeWriterClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{2A0EAF4B-9B80-4F58-96BA-A17B8CB25C7F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCEANWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEANWriter')]
  JUPCEANWriter = interface(JOneDimensionalCodeWriter) // or JObject // SuperSignature: com/google/zxing/oned/OneDimensionalCodeWriter
  ['{69254271-7E7C-4068-B643-491702BCF341}']
    { Property Methods }

    { methods }
    function getDefaultMargin: Integer; cdecl; //()I

    { Property }
  end;

  TJUPCEANWriter = class(TJavaGenericImport<JUPCEANWriterClass, JUPCEANWriter>) end;

  JUPCEReaderClass = interface(JUPCEANReaderClass) // or JObjectClass // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{A8F6AD33-F3B5-4FD9-9D62-6F4348D56E22}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUPCEReader; cdecl; //()V
    {class} function convertUPCEtoUPCA(upce: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/oned/UPCEReader')]
  JUPCEReader = interface(JUPCEANReader) // or JObject // SuperSignature: com/google/zxing/oned/UPCEANReader
  ['{8A807E0A-4EDD-497B-A14E-734A0CEF51F6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUPCEReader = class(TJavaGenericImport<JUPCEReaderClass, JUPCEReader>) end;

  JBarcodeMetadataClass = interface(JObjectClass)
  ['{029D1A02-6E7D-4817-8FCA-2E3C8B1E0545}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/BarcodeMetadata')]
  JBarcodeMetadata = interface(JObject)
  ['{086C603D-28ED-4039-A9EA-68E85401ACEB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBarcodeMetadata = class(TJavaGenericImport<JBarcodeMetadataClass, JBarcodeMetadata>) end;

  JBarcodeValueClass = interface(JObjectClass)
  ['{25A94557-CCD5-45E8-98C3-96EB886C2F0C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/BarcodeValue')]
  JBarcodeValue = interface(JObject)
  ['{666276B8-0ED6-4D5F-BF8E-FAD6CCCDEE36}']
    { Property Methods }

    { methods }
    function getConfidence(value: Integer): JInteger; cdecl; //(I)Ljava/lang/Integer;

    { Property }
  end;

  TJBarcodeValue = class(TJavaGenericImport<JBarcodeValueClass, JBarcodeValue>) end;

  JBoundingBoxClass = interface(JObjectClass)
  ['{5EB50660-4B10-4EED-896F-11A07CEEEFED}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/BoundingBox')]
  JBoundingBox = interface(JObject)
  ['{D8C1C789-33FC-4925-B35C-CA44258079A4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBoundingBox = class(TJavaGenericImport<JBoundingBoxClass, JBoundingBox>) end;

  JCodewordClass = interface(JObjectClass)
  ['{7E417573-97A5-44A9-AB97-9854AF8E81F5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/Codeword')]
  JCodeword = interface(JObject)
  ['{99C037B8-DDED-4F0C-A1DA-881D7011ED10}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJCodeword = class(TJavaGenericImport<JCodewordClass, JCodeword>) end;

//  JDecodedBitStreamParser_Mode_184Class = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
//  ['{78B768FA-5F59-4787-824F-2945A8C10F4F}']
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
//    {class} function valueOf(P1: JString): JDecodedBitStreamParser_Mode; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
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
//  JDecodedBitStreamParser_Mode_184 = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
//  ['{9AA3A3A7-7560-43E9-B61B-DA2315AC01CC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_Mode_184 = class(TJavaGenericImport<JDecodedBitStreamParser_Mode_184Class, JDecodedBitStreamParser_Mode_184>) end;

//  JDecodedBitStreamParser_185Class = interface(JObjectClass)
//  ['{5170611A-A83F-41C8-ACFC-1FEC3409DD47}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/pdf417/decoder/DecodedBitStreamParser')]
//  JDecodedBitStreamParser_185 = interface(JObject)
//  ['{2994630E-B293-4D2C-8658-6FAFC4769CB6}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_185 = class(TJavaGenericImport<JDecodedBitStreamParser_185Class, JDecodedBitStreamParser_185>) end;

  JDetectionResultClass = interface(JObjectClass)
  ['{72C5E7DF-1EE2-449D-95FA-BC482854C50B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DetectionResult')]
  JDetectionResult = interface(JObject)
  ['{BF4E7509-703E-46B8-AA40-0EEE66189F9E}']
    { Property Methods }

    { methods }
    procedure setBoundingBox(boundingBox: JBoundingBox); cdecl; //(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDetectionResult = class(TJavaGenericImport<JDetectionResultClass, JDetectionResult>) end;

  JDetectionResultColumnClass = interface(JObjectClass)
  ['{45753225-8CD9-49F4-AFDC-92F8ED564A97}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DetectionResultColumn')]
  JDetectionResultColumn = interface(JObject)
  ['{2178BFBC-D5AB-4708-827F-5162CAB92B6E}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDetectionResultColumn = class(TJavaGenericImport<JDetectionResultColumnClass, JDetectionResultColumn>) end;

  JDetectionResultRowIndicatorColumnClass = interface(JDetectionResultColumnClass) // or JObjectClass // SuperSignature: com/google/zxing/pdf417/decoder/DetectionResultColumn
  ['{53126818-8276-44AC-9F6F-06948CBA7054}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn')]
  JDetectionResultRowIndicatorColumn = interface(JDetectionResultColumn) // or JObject // SuperSignature: com/google/zxing/pdf417/decoder/DetectionResultColumn
  ['{FF60DFC3-AD46-477C-9AC0-2AE1EFDB9C31}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDetectionResultRowIndicatorColumn = class(TJavaGenericImport<JDetectionResultRowIndicatorColumnClass, JDetectionResultRowIndicatorColumn>) end;

//  JErrorCorrection_189Class = interface(JObjectClass)
//  ['{30E77F4F-C779-4C53-BCA9-F833BE263C94}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JErrorCorrection_189; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/pdf417/decoder/ec/ErrorCorrection')]
//  JErrorCorrection_189 = interface(JObject)
//  ['{91009950-37B5-4EDA-9B6F-1F4B08956A5B}']
//    { Property Methods }
//
//    { methods }
//    function decode(received: TJavaArray<Integer>; numECCodewords: Integer; erasures: TJavaArray<Integer>): Integer; cdecl; //([II[I)I
//
//    { Property }
//  end;

//  TJErrorCorrection_189 = class(TJavaGenericImport<JErrorCorrection_189Class, JErrorCorrection_189>) end;

  JModulusGFClass = interface(JObjectClass)
  ['{5108A187-53A7-4CF6-B527-4064AED7A691}']
    { static Property Methods }
    {class} function _GetPDF417_GF: JModulusGF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/decoder/ec/ModulusGF;

    { static Methods }

    { static Property }
    {class} property PDF417_GF: JModulusGF read _GetPDF417_GF;
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/ec/ModulusGF')]
  JModulusGF = interface(JObject)
  ['{44105261-D37D-4B6B-87E8-9F65CD042669}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJModulusGF = class(TJavaGenericImport<JModulusGFClass, JModulusGF>) end;

  JModulusPolyClass = interface(JObjectClass)
  ['{E0B68454-E40A-4BE8-94E4-7B489D397B67}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/ec/ModulusPoly')]
  JModulusPoly = interface(JObject)
  ['{3384976D-676B-456F-9B42-EE19B75B9128}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJModulusPoly = class(TJavaGenericImport<JModulusPolyClass, JModulusPoly>) end;

  JPDF417CodewordDecoderClass = interface(JObjectClass)
  ['{F32F6FAC-37CB-4CB2-9F26-F3BEB8106C8C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/PDF417CodewordDecoder')]
  JPDF417CodewordDecoder = interface(JObject)
  ['{668952BC-68E2-476D-9A22-3B98D8C21641}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417CodewordDecoder = class(TJavaGenericImport<JPDF417CodewordDecoderClass, JPDF417CodewordDecoder>) end;

  JPDF417ScanningDecoderClass = interface(JObjectClass)
  ['{C56ADBEF-BD80-48FA-8093-CCD8C9AF8742}']
    { static Property Methods }

    { static Methods }
    {class} function decode(image: JBitMatrix; imageTopLeft: JResultPoint; imageBottomLeft: JResultPoint; imageTopRight: JResultPoint; imageBottomRight: JResultPoint; minCodewordWidth: Integer; maxCodewordWidth: Integer): JDecoderResult; cdecl; //(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/common/DecoderResult;
    {class} function toString(barcodeMatrix: TJavaObjectArray<JBarcodeValue>): JString; cdecl; //([[Lcom/google/zxing/pdf417/decoder/BarcodeValue;)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/decoder/PDF417ScanningDecoder')]
  JPDF417ScanningDecoder = interface(JObject)
  ['{8F518151-BA33-472F-8289-35F790767304}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417ScanningDecoder = class(TJavaGenericImport<JPDF417ScanningDecoderClass, JPDF417ScanningDecoder>) end;

//  JDetector_194Class = interface(JObjectClass)
//  ['{8E9B99B1-316E-40E8-A635-6E7990A5246C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function detect(image: JBinaryBitmap; hints: JMap; multiple: Boolean): JPDF417DetectorResult; cdecl; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Z)Lcom/google/zxing/pdf417/detector/PDF417DetectorResult;
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/pdf417/detector/Detector')]
//  JDetector_194 = interface(JObject)
//  ['{3B671A6C-EB6E-46FB-90FB-C30AF913FE80}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDetector_194 = class(TJavaGenericImport<JDetector_194Class, JDetector_194>) end;

  JPDF417DetectorResultClass = interface(JObjectClass)
  ['{1D2ECAC4-2300-4DB7-821F-7FEC51BD4917}']
    { static Property Methods }

    { static Methods }
    {class} function init(bits: JBitMatrix; points: JList): JPDF417DetectorResult; cdecl; //(Lcom/google/zxing/common/BitMatrix;Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/detector/PDF417DetectorResult')]
  JPDF417DetectorResult = interface(JObject)
  ['{131F0D91-4879-45A1-AF15-5EFC17C0A1C9}']
    { Property Methods }

    { methods }
    function getBits: JBitMatrix; cdecl; //()Lcom/google/zxing/common/BitMatrix;
    function getPoints: JList; cdecl; //()Ljava/util/List;

    { Property }
  end;

  TJPDF417DetectorResult = class(TJavaGenericImport<JPDF417DetectorResultClass, JPDF417DetectorResult>) end;

  JBarcodeMatrixClass = interface(JObjectClass)
  ['{3F11279C-E5F3-435D-A0F4-B4670E5D9449}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/BarcodeMatrix')]
  JBarcodeMatrix = interface(JObject)
  ['{09516EF7-3D32-4C73-843B-6611257B53A0}']
    { Property Methods }

    { methods }
    function getMatrix: TJavaArray<TJavaArray<Byte>>; cdecl; //()[[B
    function getScaledMatrix(xScale: Integer; yScale: Integer): TJavaArray<TJavaArray<Byte>>; cdecl; //(II)[[B

    { Property }
  end;

  TJBarcodeMatrix = class(TJavaGenericImport<JBarcodeMatrixClass, JBarcodeMatrix>) end;

  JBarcodeRowClass = interface(JObjectClass)
  ['{7A511A01-5340-4070-8232-AED14DC5E575}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/BarcodeRow')]
  JBarcodeRow = interface(JObject)
  ['{3173B799-BFA8-47A8-A483-2A8E6712760E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBarcodeRow = class(TJavaGenericImport<JBarcodeRowClass, JBarcodeRow>) end;

  JCompactionClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{E1CF6D1A-FA45-45E4-A1DC-95FDB1993F7A}']
    { static Property Methods }
    {class} function _GetAUTO: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/encoder/Compaction;
    {class} function _GetTEXT: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/encoder/Compaction;
    {class} function _GetBYTE: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/encoder/Compaction;
    {class} function _GetNUMERIC: JCompaction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/pdf417/encoder/Compaction;

    { static Methods }
    {class} function values: TJavaObjectArray<JCompaction>; cdecl; //()[Lcom/google/zxing/pdf417/encoder/Compaction;
    {class} function valueOf(P1: JString): JCompaction; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/pdf417/encoder/Compaction;

    { static Property }
    {class} property AUTO: JCompaction read _GetAUTO;
    {class} property TEXT: JCompaction read _GetTEXT;
    {class} property BYTE: JCompaction read _GetBYTE;
    {class} property NUMERIC: JCompaction read _GetNUMERIC;
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/Compaction')]
  JCompaction = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{4FBB9EED-6A4B-4CC7-BD1C-3BF7CBBFC878}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCompaction = class(TJavaGenericImport<JCompactionClass, JCompaction>) end;

  JDimensionsClass = interface(JObjectClass)
  ['{5EB8C5F7-B4AE-4482-8283-1D2801AD3276}']
    { static Property Methods }

    { static Methods }
    {class} function init(minCols: Integer; maxCols: Integer; minRows: Integer; maxRows: Integer): JDimensions; cdecl; //(IIII)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/Dimensions')]
  JDimensions = interface(JObject)
  ['{2827984A-EE74-4B54-BC6B-DABCB0460E28}']
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
  ['{A62E86E9-E439-4C9E-98BC-CA9A187B1F9D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417; cdecl; overload; //()V
    {class} function init(compact: Boolean): JPDF417; cdecl; overload; //(Z)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417')]
  JPDF417 = interface(JObject)
  ['{B53DBBA1-9F76-4AA2-8969-BA5FF6DBF6BD}']
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
  ['{D5F14F40-FB71-4967-A716-4BDFEA39BA91}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417ErrorCorrection')]
  JPDF417ErrorCorrection = interface(JObject)
  ['{685B2FAD-1E6E-45DD-BBAD-61A2D4FECC8C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417ErrorCorrection = class(TJavaGenericImport<JPDF417ErrorCorrectionClass, JPDF417ErrorCorrection>) end;

  JPDF417HighLevelEncoderClass = interface(JObjectClass)
  ['{2E9E8C7D-1359-4D9E-9CC7-EB889184B96E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/encoder/PDF417HighLevelEncoder')]
  JPDF417HighLevelEncoder = interface(JObject)
  ['{E85E62B4-F4CA-4171-86BE-BD8DD3BDD36C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417HighLevelEncoder = class(TJavaGenericImport<JPDF417HighLevelEncoderClass, JPDF417HighLevelEncoder>) end;

  JPDF417CommonClass = interface(JObjectClass)
  ['{E156C0CB-5BDF-4C9F-8B50-F9DA2E8B460A}']
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
    {class} function getBitCountSum(moduleBitCount: TJavaArray<Integer>): Integer; cdecl; //([I)I
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
  ['{7DD68CD8-5C8D-4DFB-B1A6-9DBCB6059788}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPDF417Common = class(TJavaGenericImport<JPDF417CommonClass, JPDF417Common>) end;

  JPDF417ReaderClass = interface(JObjectClass)
  ['{61B1F82E-9FB7-4176-AE3D-5C20E13678C3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417Reader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417Reader')]
  JPDF417Reader = interface(JObject)
  ['{80FE562A-A500-4EA4-B48A-52892B473E4B}']
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
  ['{624BB8FE-DF86-4D4A-A73F-4729E60936D7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417ResultMetadata; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417ResultMetadata')]
  JPDF417ResultMetadata = interface(JObject)
  ['{60BD5B95-EA77-4085-98A0-E243512FC860}']
    { Property Methods }

    { methods }
    function getSegmentIndex: Integer; cdecl; //()I
    procedure setSegmentIndex(segmentIndex: Integer); cdecl; //(I)V
    function getFileId: JString; cdecl; //()Ljava/lang/String;
    procedure setFileId(fileId: JString); cdecl; //(Ljava/lang/String;)V
    function getOptionalData: TJavaArray<Integer>; cdecl; //()[I
    procedure setOptionalData(optionalData: TJavaArray<Integer>); cdecl; //([I)V
    function isLastSegment: Boolean; cdecl; //()Z
    procedure setLastSegment(lastSegment: Boolean); cdecl; //(Z)V

    { Property }
  end;

  TJPDF417ResultMetadata = class(TJavaGenericImport<JPDF417ResultMetadataClass, JPDF417ResultMetadata>) end;

  JPDF417WriterClass = interface(JObjectClass)
  ['{383A1A16-B5F7-4982-BF65-B652012AC82C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPDF417Writer; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/pdf417/PDF417Writer')]
  JPDF417Writer = interface(JObject)
  ['{9B3EDE64-75AA-4990-B1A2-17A2A9F5D664}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJPDF417Writer = class(TJavaGenericImport<JPDF417WriterClass, JPDF417Writer>) end;

  JPlanarYUVLuminanceSourceClass = interface(JLuminanceSourceClass) // or JObjectClass // SuperSignature: com/google/zxing/LuminanceSource
  ['{77504476-26AD-4AF5-9D2B-751734C0D1A7}']
    { static Property Methods }

    { static Methods }
    {class} function init(yuvData: TJavaArray<Byte>; dataWidth: Integer; dataHeight: Integer; left: Integer; top: Integer; width: Integer; height: Integer; reverseHorizontal: Boolean): JPlanarYUVLuminanceSource; cdecl; //([BIIIIIIZ)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/PlanarYUVLuminanceSource')]
  JPlanarYUVLuminanceSource = interface(JLuminanceSource) // or JObject // SuperSignature: com/google/zxing/LuminanceSource
  ['{46CBEB5A-E867-408A-BA90-D293867CDE46}']
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

//  JBitMatrixParser_208Class = interface(JObjectClass)
//  ['{759091A2-569C-48B6-8B0D-FD628B1E81D4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/BitMatrixParser')]
//  JBitMatrixParser_208 = interface(JObject)
//  ['{12A88B12-A743-4D8F-9C7E-D52B21D5FE8F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJBitMatrixParser_208 = class(TJavaGenericImport<JBitMatrixParser_208Class, JBitMatrixParser_208>) end;

//  JDataBlock_209Class = interface(JObjectClass)
//  ['{B1BE03D5-9C88-437F-9F7F-F59CB0B22B42}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DataBlock')]
//  JDataBlock_209 = interface(JObject)
//  ['{33D16E24-19D4-44F7-8935-AE71CEF10A39}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDataBlock_209 = class(TJavaGenericImport<JDataBlock_209Class, JDataBlock_209>) end;

  JDataMask_DataMask000Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{305B45BC-CC77-4E91-817D-ADD50E6432E6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$DataMask000')]
  JDataMask_DataMask000 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{3695AD8E-76C4-46F1-AF19-184F3BB9DE82}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataMask_DataMask000 = class(TJavaGenericImport<JDataMask_DataMask000Class, JDataMask_DataMask000>) end;

  JDataMask_DataMask001Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{7F6AB5B9-4454-401E-94A4-EDF6D6F7567C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$DataMask001')]
  JDataMask_DataMask001 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{920DA2F4-F3A4-43A1-B1AB-974ACFEEDFB7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataMask_DataMask001 = class(TJavaGenericImport<JDataMask_DataMask001Class, JDataMask_DataMask001>) end;

  JDataMask_DataMask010Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{01BCA31A-D296-45C4-86F0-72FB9F211D4C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$DataMask010')]
  JDataMask_DataMask010 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{63474471-3E43-4959-9245-8B073EE13473}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataMask_DataMask010 = class(TJavaGenericImport<JDataMask_DataMask010Class, JDataMask_DataMask010>) end;

  JDataMask_DataMask011Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{CA21093B-1BC1-4928-BA09-6C53E29DC0E2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$DataMask011')]
  JDataMask_DataMask011 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{42391086-58CC-444B-B59C-E2D03C75EA2B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataMask_DataMask011 = class(TJavaGenericImport<JDataMask_DataMask011Class, JDataMask_DataMask011>) end;

  JDataMask_DataMask100Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{DFA40FBD-4BE9-40BA-A2DF-BA775666C398}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$DataMask100')]
  JDataMask_DataMask100 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{1E7AA890-E50F-4A90-AF2C-C930FA171E47}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataMask_DataMask100 = class(TJavaGenericImport<JDataMask_DataMask100Class, JDataMask_DataMask100>) end;

  JDataMask_DataMask101Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{AEE6BC48-52CF-4CD0-816F-8FFA4A25DF5F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$DataMask101')]
  JDataMask_DataMask101 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{E91EA197-E4F9-4DE7-8A12-A992379AC18D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataMask_DataMask101 = class(TJavaGenericImport<JDataMask_DataMask101Class, JDataMask_DataMask101>) end;

  JDataMask_DataMask110Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{34343469-AB56-41C4-A5DC-A4FD0B2BA997}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$DataMask110')]
  JDataMask_DataMask110 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{2FB19080-9783-49F7-8374-A2D97144B03E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataMask_DataMask110 = class(TJavaGenericImport<JDataMask_DataMask110Class, JDataMask_DataMask110>) end;

  JDataMask_DataMask111Class = interface(JDataMaskClass) // or JObjectClass // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{04FD86BE-FCCD-4D7D-89ED-52E008B7B290}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask$DataMask111')]
  JDataMask_DataMask111 = interface(JDataMask) // or JObject // SuperSignature: com/google/zxing/qrcode/decoder/DataMask
  ['{07537DEB-B816-4A05-ABCA-68A7F8A02E42}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataMask_DataMask111 = class(TJavaGenericImport<JDataMask_DataMask111Class, JDataMask_DataMask111>) end;

  JDataMaskClass = interface(JObjectClass)
  ['{81148FE9-7384-45C7-AC45-C219EAF527D7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/DataMask')]
  JDataMask = interface(JObject)
  ['{969AA43B-BED0-4643-B1BE-07DC71A36846}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataMask = class(TJavaGenericImport<JDataMaskClass, JDataMask>) end;

//  JDecodedBitStreamParser_219Class = interface(JObjectClass)
//  ['{C9F4C64B-CA64-4746-8297-526A6FB244FF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/DecodedBitStreamParser')]
//  JDecodedBitStreamParser_219 = interface(JObject)
//  ['{418224E1-9099-46C3-9749-0A1640E75296}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJDecodedBitStreamParser_219 = class(TJavaGenericImport<JDecodedBitStreamParser_219Class, JDecodedBitStreamParser_219>) end;

//  JDecoder_220Class = interface(JObjectClass)
//  ['{5088388A-78F1-4721-A152-2D77B4DB7A74}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JDecoder_220; cdecl; //()V
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/Decoder')]
//  JDecoder_220 = interface(JObject)
//  ['{C9460B8A-365C-4F39-9C96-FE32205564EE}']
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

//  TJDecoder_220 = class(TJavaGenericImport<JDecoder_220Class, JDecoder_220>) end;

  JErrorCorrectionLevelClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{9ECC4368-3C45-4206-B7A7-832B39AB63F6}']
    { static Property Methods }
    {class} function _GetL: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    {class} function _GetM: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    {class} function _GetQ: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    {class} function _GetH: JErrorCorrectionLevel;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    { static Methods }
    {class} function forBits(bits: Integer): JErrorCorrectionLevel; cdecl; //(I)Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    {class} function values: TJavaObjectArray<JErrorCorrectionLevel>; cdecl; //()[Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;
    {class} function valueOf(P1: JString): JErrorCorrectionLevel; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    { static Property }
    {class} property L: JErrorCorrectionLevel read _GetL;
    {class} property M: JErrorCorrectionLevel read _GetM;
    {class} property Q: JErrorCorrectionLevel read _GetQ;
    {class} property H: JErrorCorrectionLevel read _GetH;
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/ErrorCorrectionLevel')]
  JErrorCorrectionLevel = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{D6FAB832-44C7-4299-8025-A5CC7A03D207}']
    { Property Methods }

    { methods }
    function getBits: Integer; cdecl; //()I

    { Property }
  end;

  TJErrorCorrectionLevel = class(TJavaGenericImport<JErrorCorrectionLevelClass, JErrorCorrectionLevel>) end;

  JFormatInformationClass = interface(JObjectClass)
  ['{CDAB65F6-7FBF-499E-A89D-A8AD3A8AE029}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/FormatInformation')]
  JFormatInformation = interface(JObject)
  ['{03FD6389-B64B-46A7-B69B-56A8CC015C80}']
    { Property Methods }

    { methods }
    function hashCode: Integer; cdecl; //()I
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z

    { Property }
  end;

  TJFormatInformation = class(TJavaGenericImport<JFormatInformationClass, JFormatInformation>) end;

  JModeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{2F6F9416-8C24-47BF-B748-3EE4F1CB280A}']
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
    {class} function forBits(bits: Integer): JMode; cdecl; //(I)Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function values: TJavaObjectArray<JMode>; cdecl; //()[Lcom/google/zxing/qrcode/decoder/Mode;
    {class} function valueOf(P1: JString): JMode; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;

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
  ['{81461C2B-EF21-4DB2-885F-7B4163B106D2}']
    { Property Methods }

    { methods }
    function getCharacterCountBits(version: JVersion): Integer; cdecl; //(Lcom/google/zxing/qrcode/decoder/Version;)I
    function getBits: Integer; cdecl; //()I

    { Property }
  end;

  TJMode = class(TJavaGenericImport<JModeClass, JMode>) end;

  JQRCodeDecoderMetaDataClass = interface(JObjectClass)
  ['{08DA669C-3132-4F48-9751-BF3D69AD75B6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/decoder/QRCodeDecoderMetaData')]
  JQRCodeDecoderMetaData = interface(JObject)
  ['{A3240064-0125-4386-A491-C4447B9AB010}']
    { Property Methods }

    { methods }
    function isMirrored: Boolean; cdecl; //()Z
    procedure applyMirroredCorrection(points: TJavaObjectArray<JResultPoint>); cdecl; //([Lcom/google/zxing/ResultPoint;)V

    { Property }
  end;

  TJQRCodeDecoderMetaData = class(TJavaGenericImport<JQRCodeDecoderMetaDataClass, JQRCodeDecoderMetaData>) end;

//  JVersion_ECB_225Class = interface(JObjectClass)
//  ['{89696C79-4948-4D8E-A296-86371CE8960D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/Version$ECB')]
//  JVersion_ECB_225 = interface(JObject)
//  ['{2BF08517-C5C4-4C32-9285-19B0D5E1DA02}']
//    { Property Methods }
//
//    { methods }
//    function getCount: Integer; cdecl; //()I
//    function getDataCodewords: Integer; cdecl; //()I
//
//    { Property }
//  end;

//  TJVersion_ECB_225 = class(TJavaGenericImport<JVersion_ECB_225Class, JVersion_ECB_225>) end;

//  JVersion_ECBlocks_226Class = interface(JObjectClass)
//  ['{E8DF1D04-C59F-453A-8F7F-E069D00103A1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/Version$ECBlocks')]
//  JVersion_ECBlocks_226 = interface(JObject)
//  ['{7B67A514-3AAC-4F87-BF38-472A3940620A}']
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

//  TJVersion_ECBlocks_226 = class(TJavaGenericImport<JVersion_ECBlocks_226Class, JVersion_ECBlocks_226>) end;

//  JVersion_227Class = interface(JObjectClass)
//  ['{788D872F-D671-42D2-947B-05EACECF7886}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function getProvisionalVersionForDimension(dimension: Integer): JVersion; cdecl; //(I)Lcom/google/zxing/qrcode/decoder/Version;
//    {class} function getVersionForNumber(versionNumber: Integer): JVersion; cdecl; //(I)Lcom/google/zxing/qrcode/decoder/Version;
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/decoder/Version')]
//  JVersion_227 = interface(JObject)
//  ['{A7EF7CDB-8753-452F-A2CD-88E93FFE1517}']
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

//  TJVersion_227 = class(TJavaGenericImport<JVersion_227Class, JVersion_227>) end;

  JAlignmentPatternClass = interface(JResultPointClass) // or JObjectClass // SuperSignature: com/google/zxing/ResultPoint
  ['{74E6BEFB-D3CA-4F83-B3A2-1E7E3D309240}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/AlignmentPattern')]
  JAlignmentPattern = interface(JResultPoint) // or JObject // SuperSignature: com/google/zxing/ResultPoint
  ['{0EB2FA33-EAA3-4D29-8F9A-E629ADEA891B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAlignmentPattern = class(TJavaGenericImport<JAlignmentPatternClass, JAlignmentPattern>) end;

  JAlignmentPatternFinderClass = interface(JObjectClass)
  ['{FD7B6A25-F049-4047-9A46-70FBA8DD2ADE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/AlignmentPatternFinder')]
  JAlignmentPatternFinder = interface(JObject)
  ['{DF6BC100-9165-4CE9-9F36-13AFF9BF250E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAlignmentPatternFinder = class(TJavaGenericImport<JAlignmentPatternFinderClass, JAlignmentPatternFinder>) end;

//  JDetector_230Class = interface(JObjectClass)
//  ['{D7DB0BA8-6E0D-41B3-AFB4-6FCF2407132E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(image: JBitMatrix): JDetector_230; cdecl; //(Lcom/google/zxing/common/BitMatrix;)V
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/detector/Detector')]
//  JDetector_230 = interface(JObject)
//  ['{06AB4A69-9511-4BC4-B7A7-4A2DC9672D7B}']
//    { Property Methods }
//
//    { methods }
//    function detect: JDetectorResult; cdecl; overload; //()Lcom/google/zxing/common/DetectorResult;
//    function detect(hints: JMap): JDetectorResult; cdecl; overload; //(Ljava/util/Map;)Lcom/google/zxing/common/DetectorResult;
//
//    { Property }
//  end;

//  TJDetector_230 = class(TJavaGenericImport<JDetector_230Class, JDetector_230>) end;

//  JFinderPattern_231Class = interface(JResultPointClass) // or JObjectClass // SuperSignature: com/google/zxing/ResultPoint
//  ['{6A826164-A9FC-46A2-8C85-B83FEF085AE0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/google/zxing/qrcode/detector/FinderPattern')]
//  JFinderPattern_231 = interface(JResultPoint) // or JObject // SuperSignature: com/google/zxing/ResultPoint
//  ['{FBD8C4E5-F75D-4D2F-B4CD-3FCEE51A41B9}']
//    { Property Methods }
//
//    { methods }
//    function getEstimatedModuleSize: Single; cdecl; //()F
//
//    { Property }
//  end;

//  TJFinderPattern_231 = class(TJavaGenericImport<JFinderPattern_231Class, JFinderPattern_231>) end;

  JFinderPatternFinder_CenterComparatorClass = interface(JObjectClass)
  ['{68122FAF-5660-4FDB-8678-420F0E0874F0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternFinder$CenterComparator')]
  JFinderPatternFinder_CenterComparator = interface(JObject)
  ['{97C72C50-1380-448B-804A-F79B5A1C6D0C}']
    { Property Methods }

    { methods }
    function compare(center1: JFinderPattern; center2: JFinderPattern): Integer; cdecl; overload; //(Lcom/google/zxing/qrcode/detector/FinderPattern;Lcom/google/zxing/qrcode/detector/FinderPattern;)I
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I

    { Property }
  end;

  TJFinderPatternFinder_CenterComparator = class(TJavaGenericImport<JFinderPatternFinder_CenterComparatorClass, JFinderPatternFinder_CenterComparator>) end;

  JFinderPatternFinder_FurthestFromAverageComparatorClass = interface(JObjectClass)
  ['{46CCCF8A-1E83-47D7-B8A5-15674087DEA7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternFinder$FurthestFromAverageComparator')]
  JFinderPatternFinder_FurthestFromAverageComparator = interface(JObject)
  ['{889D9CBF-9038-4BD4-A42D-25891891B617}']
    { Property Methods }

    { methods }
    function compare(center1: JFinderPattern; center2: JFinderPattern): Integer; cdecl; overload; //(Lcom/google/zxing/qrcode/detector/FinderPattern;Lcom/google/zxing/qrcode/detector/FinderPattern;)I
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;)I

    { Property }
  end;

  TJFinderPatternFinder_FurthestFromAverageComparator = class(TJavaGenericImport<JFinderPatternFinder_FurthestFromAverageComparatorClass, JFinderPatternFinder_FurthestFromAverageComparator>) end;

  JFinderPatternFinderClass = interface(JObjectClass)
  ['{61121ACF-3490-4CDF-AD6B-DB604A557F9C}']
    { static Property Methods }

    { static Methods }
    {class} function init(image: JBitMatrix): JFinderPatternFinder; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;)V
    {class} function init(image: JBitMatrix; resultPointCallback: JResultPointCallback): JFinderPatternFinder; cdecl; overload; //(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternFinder')]
  JFinderPatternFinder = interface(JObject)
  ['{5A8D4C28-F6B2-4324-A68A-CB42665EEF7B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFinderPatternFinder = class(TJavaGenericImport<JFinderPatternFinderClass, JFinderPatternFinder>) end;

  JFinderPatternInfoClass = interface(JObjectClass)
  ['{F5F106E5-F35D-46E2-BD79-9E0DFA7CDA25}']
    { static Property Methods }

    { static Methods }
    {class} function init(patternCenters: TJavaObjectArray<JFinderPattern>): JFinderPatternInfo; cdecl; //([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/detector/FinderPatternInfo')]
  JFinderPatternInfo = interface(JObject)
  ['{00E14D40-92AB-4639-B93B-B0C48E8D0426}']
    { Property Methods }

    { methods }
    function getBottomLeft: JFinderPattern; cdecl; //()Lcom/google/zxing/qrcode/detector/FinderPattern;
    function getTopLeft: JFinderPattern; cdecl; //()Lcom/google/zxing/qrcode/detector/FinderPattern;
    function getTopRight: JFinderPattern; cdecl; //()Lcom/google/zxing/qrcode/detector/FinderPattern;

    { Property }
  end;

  TJFinderPatternInfo = class(TJavaGenericImport<JFinderPatternInfoClass, JFinderPatternInfo>) end;

  JBlockPairClass = interface(JObjectClass)
  ['{06F16108-B408-4336-A1C2-C7E760909DD9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/BlockPair')]
  JBlockPair = interface(JObject)
  ['{F34B0A0A-C0F8-4832-943E-1BD7C0EC260C}']
    { Property Methods }

    { methods }
    function getDataBytes: TJavaArray<Byte>; cdecl; //()[B
    function getErrorCorrectionBytes: TJavaArray<Byte>; cdecl; //()[B

    { Property }
  end;

  TJBlockPair = class(TJavaGenericImport<JBlockPairClass, JBlockPair>) end;

  JByteMatrixClass = interface(JObjectClass)
  ['{C0130F40-FFE2-435A-AF52-765705C6FD92}']
    { static Property Methods }

    { static Methods }
    {class} function init(width: Integer; height: Integer): JByteMatrix; cdecl; //(II)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/ByteMatrix')]
  JByteMatrix = interface(JObject)
  ['{EDFA675A-2A98-4B0D-908A-8842DE56ABC2}']
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

//  JEncoder_238Class = interface(JObjectClass)
//  ['{B5C3F1B3-74DA-48FB-8586-088458151C84}']
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
//  JEncoder_238 = interface(JObject)
//  ['{2F1082B0-A88E-4BA4-8EE1-E1DEBB85D2FC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJEncoder_238 = class(TJavaGenericImport<JEncoder_238Class, JEncoder_238>) end;

  JMaskUtilClass = interface(JObjectClass)
  ['{F4A2DBFD-4D9D-491F-AFE1-CB5E4F65118D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MaskUtil')]
  JMaskUtil = interface(JObject)
  ['{D92B88D7-DF55-457B-9288-3A277CDCC419}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMaskUtil = class(TJavaGenericImport<JMaskUtilClass, JMaskUtil>) end;

  JMatrixUtilClass = interface(JObjectClass)
  ['{184E81C5-96E0-45EE-8A5D-F2F09B12F4D0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/encoder/MatrixUtil')]
  JMatrixUtil = interface(JObject)
  ['{665F962C-9B79-40AE-8C72-D6BC3F09D42B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMatrixUtil = class(TJavaGenericImport<JMatrixUtilClass, JMatrixUtil>) end;

  JQRCodeClass = interface(JObjectClass)
  ['{37C2246F-E5C3-4B94-A9DA-C2DDD737F85A}']
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
  ['{0ACF3DCE-3B24-41BB-A275-0541F8A00E5D}']
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

  JQRCodeReaderClass = interface(JObjectClass)
  ['{35A610A2-1AA7-49F2-B272-0B82A2C6EC90}']
    { static Property Methods }

    { static Methods }
    {class} function init: JQRCodeReader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/QRCodeReader')]
  JQRCodeReader = interface(JObject)
  ['{4206EAD5-471F-4B64-B31C-542393C7260A}']
    { Property Methods }

    { methods }
    function decode(image: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(image: JBinaryBitmap; hints: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJQRCodeReader = class(TJavaGenericImport<JQRCodeReaderClass, JQRCodeReader>) end;

  JQRCodeWriterClass = interface(JObjectClass)
  ['{20638BAE-7EA3-40BA-A371-795A318CAFA8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JQRCodeWriter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/qrcode/QRCodeWriter')]
  JQRCodeWriter = interface(JObject)
  ['{88B9CE80-4707-46A9-B44B-57E99E264AB8}']
    { Property Methods }

    { methods }
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(contents: JString; format: JBarcodeFormat; width: Integer; height: Integer; hints: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJQRCodeWriter = class(TJavaGenericImport<JQRCodeWriterClass, JQRCodeWriter>) end;

  JReaderClass = interface(JObjectClass)
  ['{D509569A-19BE-46D5-B586-CB56B8F2F9B8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/Reader')]
  JReader = interface(IJavaInstance)
  ['{A5F3DF11-AAF9-483A-A34C-0F8898EE111F}']
    { Property Methods }

    { methods }
    function decode(P1: JBinaryBitmap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    function decode(P1: JBinaryBitmap; P2: JMap): JResult; cdecl; overload; //(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    procedure reset; cdecl; //()V

    { Property }
  end;

  TJReader = class(TJavaGenericImport<JReaderClass, JReader>) end;

  JReaderExceptionClass = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
  ['{A8CC3CDE-1D10-427F-A3A2-B18F3D9BA56B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/ReaderException')]
  JReaderException = interface(JException) // or JObject // SuperSignature: java/lang/Exception
  ['{7FAC7E4A-8FE3-4A38-B41C-01788F1D0EBA}']
    { Property Methods }

    { methods }
    function fillInStackTrace: JThrowable; cdecl; //()Ljava/lang/Throwable;

    { Property }
  end;

  TJReaderException = class(TJavaGenericImport<JReaderExceptionClass, JReaderException>) end;

  JResultClass = interface(JObjectClass)
  ['{2ED0D5DC-FF25-4ADC-9052-1233D6F13B6E}']
    { static Property Methods }

    { static Methods }
    {class} function init(text: JString; rawBytes: TJavaArray<Byte>; resultPoints: TJavaObjectArray<JResultPoint>; format: JBarcodeFormat): JResult; cdecl; overload; //(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V
    {class} function init(text: JString; rawBytes: TJavaArray<Byte>; resultPoints: TJavaObjectArray<JResultPoint>; format: JBarcodeFormat; timestamp: Int64): JResult; cdecl; overload; //(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;J)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/Result')]
  JResult = interface(JObject)
  ['{8AAC9E5E-EB60-4415-ADC9-2A83B6C68532}']
    { Property Methods }

    { methods }
    function getText: JString; cdecl; //()Ljava/lang/String;
    function getRawBytes: TJavaArray<Byte>; cdecl; //()[B
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

  JResultMetadataTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{4B7C9B98-9F88-4563-BC87-A7E3E2BD2D1D}']
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
    {class} function valueOf(P1: JString): JResultMetadataType; cdecl; //(Ljava/lang/String;)Lcom/google/zxing/ResultMetadataType;

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
  ['{235255D9-29B8-451A-8DC2-97FE59B8741D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJResultMetadataType = class(TJavaGenericImport<JResultMetadataTypeClass, JResultMetadataType>) end;

  JResultPointClass = interface(JObjectClass)
  ['{70BD7B1B-3D6E-4DD1-9F04-6F54C1E40E85}']
    { static Property Methods }

    { static Methods }
    {class} function init(x: Single; y: Single): JResultPoint; cdecl; //(FF)V
    {class} procedure orderBestPatterns(patterns: TJavaObjectArray<JResultPoint>); cdecl; //([Lcom/google/zxing/ResultPoint;)V
    {class} function distance(pattern1: JResultPoint; pattern2: JResultPoint): Single; cdecl; //(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    { static Property }
  end;

  [JavaSignature('com/google/zxing/ResultPoint')]
  JResultPoint = interface(JObject)
  ['{A7A88CF0-65C8-49DD-947A-D836DACFCC89}']
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

  JResultPointCallbackClass = interface(JObjectClass)
  ['{93780809-C154-48B3-970B-8CE4BE870704}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/ResultPointCallback')]
  JResultPointCallback = interface(IJavaInstance)
  ['{C3CA991F-2406-4624-AE2B-04538E6811E5}']
    { Property Methods }

    { methods }
    procedure foundPossibleResultPoint(P1: JResultPoint); cdecl; //(Lcom/google/zxing/ResultPoint;)V

    { Property }
  end;

  TJResultPointCallback = class(TJavaGenericImport<JResultPointCallbackClass, JResultPointCallback>) end;

  JRGBLuminanceSourceClass = interface(JLuminanceSourceClass) // or JObjectClass // SuperSignature: com/google/zxing/LuminanceSource
  ['{29B879BB-5423-4EC8-87AE-3E6DB311FAE8}']
    { static Property Methods }

    { static Methods }
    {class} function init(width: Integer; height: Integer; pixels: TJavaArray<Integer>): JRGBLuminanceSource; cdecl; //(II[I)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/RGBLuminanceSource')]
  JRGBLuminanceSource = interface(JLuminanceSource) // or JObject // SuperSignature: com/google/zxing/LuminanceSource
  ['{C5522793-7259-470A-974D-E169E01D6B45}']
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
  ['{8D1D11E9-33DB-4544-9CC9-82C27FB1BEF8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/google/zxing/Writer')]
  JWriter = interface(IJavaInstance)
  ['{CCDFAF38-19FE-4126-8972-944967620CF9}']
    { Property Methods }

    { methods }
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    function encode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer; P5: JMap): JBitMatrix; cdecl; overload; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    { Property }
  end;

  TJWriter = class(TJavaGenericImport<JWriterClass, JWriter>) end;

  JWriterExceptionClass = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
  ['{6E57FA10-EE13-4A79-B04B-A93A8453D76E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWriterException; cdecl; overload; //()V
    {class} function init(amessage: JString): JWriterException; cdecl; overload; //(Ljava/lang/String;)V
    {class} function init(cause: JThrowable): JWriterException; cdecl; overload; //(Ljava/lang/Throwable;)V

    { static Property }
  end;

  [JavaSignature('com/google/zxing/WriterException')]
  JWriterException = interface(JException) // or JObject // SuperSignature: java/lang/Exception
  ['{E3E7753B-3852-40DC-BAE7-E561F9E201C0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWriterException = class(TJavaGenericImport<JWriterExceptionClass, JWriterException>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAztecDetectorResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAztecDetectorResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAztecReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAztecReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAztecWriter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAztecWriter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecoder_Table', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecoder_Table));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetector_Point', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetector_Point));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetector', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetector));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAztecCode', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAztecCode));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBinaryShiftToken', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBinaryShiftToken));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEncoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEncoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JHighLevelEncoder_1', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JHighLevelEncoder_1));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JHighLevelEncoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JHighLevelEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JSimpleToken', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JSimpleToken));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JState', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JState));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JToken', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JToken));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBarcodeFormat', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBarcodeFormat));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBinarizer', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBinarizer));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBinaryBitmap', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBinaryBitmap));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JChecksumException', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JChecksumException));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAbstractDoCoMoResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAbstractDoCoMoResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAddressBookAUResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAddressBookAUResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAddressBookDoCoMoResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAddressBookDoCoMoResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAddressBookParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAddressBookParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBizcardResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBizcardResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBookmarkDoCoMoResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBookmarkDoCoMoResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCalendarParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCalendarParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEmailAddressParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEmailAddressParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEmailAddressResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEmailAddressResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEmailDoCoMoResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEmailDoCoMoResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JExpandedProductParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JExpandedProductParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JExpandedProductResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JExpandedProductResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JGeoParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JGeoParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JGeoResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JGeoResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JISBNParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JISBNParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JISBNResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JISBNResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JParsedResultType', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JParsedResultType));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JProductParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JProductParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JProductResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JProductResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JSMSMMSResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JSMSMMSResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JSMSParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JSMSParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JSMSTOMMSTOResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JSMSTOMMSTOResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JSMTPResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JSMTPResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JTelParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JTelParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JTelResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JTelResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JTextParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JTextParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JURIParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JURIParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JURIResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JURIResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JURLTOResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JURLTOResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JVCardResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JVCardResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JVEventResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JVEventResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JVINParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JVINParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JVINResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JVINResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JWifiParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JWifiParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JWifiResultParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JWifiResultParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBitArray', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBitArray));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBitMatrix', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBitMatrix));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBitSource', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBitSource));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCharacterSetECI', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCharacterSetECI));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecoderResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecoderResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDefaultGridSampler', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDefaultGridSampler));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMathUtils', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMathUtils));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMonochromeRectangleDetector', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMonochromeRectangleDetector));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JWhiteRectangleDetector', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JWhiteRectangleDetector));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetectorResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetectorResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JGlobalHistogramBinarizer', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JGlobalHistogramBinarizer));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JGridSampler', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JGridSampler));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JHybridBinarizer', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JHybridBinarizer));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPerspectiveTransform', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPerspectiveTransform));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JGenericGF', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JGenericGF));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JGenericGFPoly', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JGenericGFPoly));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JReedSolomonDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JReedSolomonDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JReedSolomonEncoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JReedSolomonEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JReedSolomonException', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JReedSolomonException));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JStringUtils', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JStringUtils));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMatrixReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMatrixReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMatrixWriter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMatrixWriter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBitMatrixParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBitMatrixParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataBlock', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataBlock));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser_Mode', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser_Mode));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecoder_082', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecoder_082));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JVersion_ECB', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JVersion_ECB));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JVersion_ECBlocks', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JVersion_ECBlocks));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JVersion', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JVersion));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetector_ResultPointsAndTransitions', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetector_ResultPointsAndTransitions));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetector_ResultPointsAndTransitionsComparator', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetector_ResultPointsAndTransitionsComparator));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetector_088', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetector_088));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JASCIIEncoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JASCIIEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBase256Encoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBase256Encoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JC40Encoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JC40Encoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMatrixSymbolInfo144', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMatrixSymbolInfo144));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDefaultPlacement', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDefaultPlacement));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEdifactEncoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEdifactEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEncoder_095', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEncoder_095));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEncoderContext', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEncoderContext));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JErrorCorrection', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JErrorCorrection));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JHighLevelEncoder_098', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JHighLevelEncoder_098));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JSymbolInfo', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JSymbolInfo));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JSymbolShapeHint', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JSymbolShapeHint));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JTextEncoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JTextEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JX12Encoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JX12Encoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodeHintType', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodeHintType));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDimension', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDimension));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEncodeHintType', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEncodeHintType));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JFormatException', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JFormatException));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JInvertedLuminanceSource', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JInvertedLuminanceSource));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JLuminanceSource', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JLuminanceSource));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBitMatrixParser_109', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBitMatrixParser_109));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser_110', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser_110));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecoder_111', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecoder_111));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMaxiCodeReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMaxiCodeReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JByQuadrantReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JByQuadrantReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JGenericMultipleBarcodeReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JGenericMultipleBarcodeReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMultipleBarcodeReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMultipleBarcodeReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMultiDetector', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMultiDetector));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMultiFinderPatternFinder_ModuleSizeComparator', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMultiFinderPatternFinder_ModuleSizeComparator));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMultiFinderPatternFinder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMultiFinderPatternFinder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JQRCodeMultiReader_SAComparator', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JQRCodeMultiReader_SAComparator));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JQRCodeMultiReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JQRCodeMultiReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMultiFormatReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMultiFormatReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMultiFormatWriter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMultiFormatWriter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JNotFoundException', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JNotFoundException));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCodaBarReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCodaBarReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCodaBarWriter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCodaBarWriter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCode128Reader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCode128Reader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCode128Writer', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCode128Writer));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCode39Reader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCode39Reader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCode39Writer', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCode39Writer));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCode93Reader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCode93Reader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEAN13Reader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEAN13Reader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEAN13Writer', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEAN13Writer));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEAN8Reader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEAN8Reader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEAN8Writer', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEAN8Writer));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEANManufacturerOrgSupport', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEANManufacturerOrgSupport));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JITFReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JITFReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JITFWriter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JITFWriter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMultiFormatOneDReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMultiFormatOneDReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMultiFormatUPCEANReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMultiFormatUPCEANReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JOneDimensionalCodeWriter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JOneDimensionalCodeWriter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JOneDReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JOneDReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAbstractRSSReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAbstractRSSReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataCharacter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataCharacter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBitArrayBuilder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBitArrayBuilder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAbstractExpandedDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAbstractExpandedDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAI013103decoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAI013103decoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAI01320xDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAI01320xDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAI01392xDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAI01392xDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAI01393xDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAI01393xDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAI013x0x1xDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAI013x0x1xDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAI013x0xDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAI013x0xDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAI01AndOtherAIs', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAI01AndOtherAIs));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAI01decoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAI01decoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAI01weightDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAI01weightDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAnyAIDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAnyAIDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBlockParsedResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBlockParsedResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCurrentParsingState_State', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCurrentParsingState_State));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCurrentParsingState', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCurrentParsingState));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodedChar', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodedChar));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodedInformation', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodedInformation));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodedNumeric', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodedNumeric));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodedObject', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodedObject));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JFieldParser', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JFieldParser));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JGeneralAppIdDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JGeneralAppIdDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JExpandedPair', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JExpandedPair));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JExpandedRow', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JExpandedRow));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JRSSExpandedReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JRSSExpandedReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JFinderPattern', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JFinderPattern));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPair', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPair));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JRSS14Reader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JRSS14Reader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JRSSUtils', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JRSSUtils));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JUPCAReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JUPCAReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JUPCAWriter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JUPCAWriter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JUPCEANExtension2Support', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JUPCEANExtension2Support));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JUPCEANExtension5Support', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JUPCEANExtension5Support));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JUPCEANExtensionSupport', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JUPCEANExtensionSupport));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JUPCEANReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JUPCEANReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JUPCEANWriter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JUPCEANWriter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JUPCEReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JUPCEReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBarcodeMetadata', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBarcodeMetadata));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBarcodeValue', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBarcodeValue));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBoundingBox', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBoundingBox));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCodeword', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCodeword));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser_Mode_184', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser_Mode_184));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser_185', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser_185));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetectionResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetectionResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetectionResultColumn', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetectionResultColumn));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetectionResultRowIndicatorColumn', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetectionResultRowIndicatorColumn));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JErrorCorrection_189', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JErrorCorrection_189));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JModulusGF', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JModulusGF));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JModulusPoly', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JModulusPoly));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPDF417CodewordDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPDF417CodewordDecoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPDF417ScanningDecoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPDF417ScanningDecoder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetector_194', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetector_194));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPDF417DetectorResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPDF417DetectorResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBarcodeMatrix', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBarcodeMatrix));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBarcodeRow', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBarcodeRow));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JCompaction', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JCompaction));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDimensions', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDimensions));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPDF417', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPDF417));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPDF417ErrorCorrection', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPDF417ErrorCorrection));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPDF417HighLevelEncoder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPDF417HighLevelEncoder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPDF417Common', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPDF417Common));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPDF417Reader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPDF417Reader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPDF417ResultMetadata', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPDF417ResultMetadata));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPDF417Writer', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPDF417Writer));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JPlanarYUVLuminanceSource', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JPlanarYUVLuminanceSource));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBitMatrixParser_208', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBitMatrixParser_208));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataBlock_209', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataBlock_209));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask000', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask000));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask001', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask001));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask010', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask010));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask011', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask011));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask100', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask100));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask101', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask101));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask110', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask110));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask111', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMask_DataMask111));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDataMask', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDataMask));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser_219', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecodedBitStreamParser_219));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDecoder_220', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDecoder_220));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JErrorCorrectionLevel', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JErrorCorrectionLevel));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JFormatInformation', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JFormatInformation));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMode', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMode));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JQRCodeDecoderMetaData', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JQRCodeDecoderMetaData));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JVersion_ECB_225', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JVersion_ECB_225));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JVersion_ECBlocks_226', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JVersion_ECBlocks_226));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JVersion_227', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JVersion_227));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAlignmentPattern', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAlignmentPattern));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JAlignmentPatternFinder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JAlignmentPatternFinder));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JDetector_230', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JDetector_230));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JFinderPattern_231', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JFinderPattern_231));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JFinderPatternFinder_CenterComparator', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JFinderPatternFinder_CenterComparator));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JFinderPatternFinder_FurthestFromAverageComparator', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JFinderPatternFinder_FurthestFromAverageComparator));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JFinderPatternFinder', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JFinderPatternFinder));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JFinderPatternInfo', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JFinderPatternInfo));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JBlockPair', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JBlockPair));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JByteMatrix', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JByteMatrix));
//  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JEncoder_238', 
//    TypeInfo(Androidapi.JNI.zxing_3_2_0.JEncoder_238));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMaskUtil', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMaskUtil));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JMatrixUtil', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JMatrixUtil));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JQRCode', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JQRCode));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JQRCodeReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JQRCodeReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JQRCodeWriter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JQRCodeWriter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JReader', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JReader));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JReaderException', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JReaderException));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JResult', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JResult));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JResultMetadataType', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JResultMetadataType));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JResultPoint', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JResultPoint));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JResultPointCallback', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JResultPointCallback));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JRGBLuminanceSource', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JRGBLuminanceSource));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JWriter', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JWriter));
  TRegTypes.RegisterType('Androidapi.JNI.zxing_3_2_0.JWriterException', 
    TypeInfo(Androidapi.JNI.zxing_3_2_0.JWriterException));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
