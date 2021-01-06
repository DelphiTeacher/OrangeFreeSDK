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
//  生成时间：2020/12/26 21:07:50
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.jxl;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.java.text.NumberFormat, 
  Androidapi.JNI.java.text.DateFormat, 
  Androidapi.JNI.java.net.URL;


type

// ===== Forward declarations =====

  JAssert = interface; //common.Assert
  JAssertionFailed = interface; //common.AssertionFailed
  JBaseUnit = interface; //common.BaseUnit
  JLengthConverter = interface; //common.LengthConverter
  JLengthUnit = interface; //common.LengthUnit
  JLoggerName = interface; //common.log.LoggerName
  JSimpleLogger = interface; //common.log.SimpleLogger
  JLogger = interface; //common.Logger
  JAutoFilter = interface; //jxl.biff.AutoFilter
  JAutoFilterInfoRecord = interface; //jxl.biff.AutoFilterInfoRecord
  JAutoFilterRecord = interface; //jxl.biff.AutoFilterRecord
  JBaseCellFeatures_ValidationCondition = interface; //jxl.biff.BaseCellFeatures$ValidationCondition
  JBaseCellFeatures = interface; //jxl.biff.BaseCellFeatures
  JBaseCompoundFile_PropertyStorage = interface; //jxl.biff.BaseCompoundFile$PropertyStorage
  JBaseCompoundFile = interface; //jxl.biff.BaseCompoundFile
  JBuiltInFormat = interface; //jxl.biff.BuiltInFormat
  JBuiltInName = interface; //jxl.biff.BuiltInName
  JBuiltInStyle = interface; //jxl.biff.BuiltInStyle
  JByteArray = interface; //jxl.biff.ByteArray
  JByteData = interface; //jxl.biff.ByteData
  JCellReferenceHelper = interface; //jxl.biff.CellReferenceHelper
  JConditionalFormat = interface; //jxl.biff.ConditionalFormat
  JConditionalFormatRangeRecord_Range = interface; //jxl.biff.ConditionalFormatRangeRecord$Range
  JConditionalFormatRangeRecord = interface; //jxl.biff.ConditionalFormatRangeRecord
  JConditionalFormatRecord = interface; //jxl.biff.ConditionalFormatRecord
  JContinueRecord = interface; //jxl.biff.ContinueRecord
  JCountryCode = interface; //jxl.biff.CountryCode
  JDataValidation = interface; //jxl.biff.DataValidation
  JDataValidityListRecord = interface; //jxl.biff.DataValidityListRecord
  JDataValiditySettingsRecord = interface; //jxl.biff.DataValiditySettingsRecord
  JDisplayFormat = interface; //jxl.biff.DisplayFormat
  JDoubleHelper = interface; //jxl.biff.DoubleHelper
  JBlipStoreEntry = interface; //jxl.biff.drawing.BlipStoreEntry
  JBlipType = interface; //jxl.biff.drawing.BlipType
  JBStoreContainer = interface; //jxl.biff.drawing.BStoreContainer
  JButton = interface; //jxl.biff.drawing.Button
  JChart = interface; //jxl.biff.drawing.Chart
  JChunk = interface; //jxl.biff.drawing.Chunk
  JChunkType = interface; //jxl.biff.drawing.ChunkType
  JClientAnchor = interface; //jxl.biff.drawing.ClientAnchor
  JClientData = interface; //jxl.biff.drawing.ClientData
  JClientTextBox = interface; //jxl.biff.drawing.ClientTextBox
  JComboBox = interface; //jxl.biff.drawing.ComboBox
  JComment = interface; //jxl.biff.drawing.Comment
  JDg = interface; //jxl.biff.drawing.Dg
  JDgContainer = interface; //jxl.biff.drawing.DgContainer
  JDgg_Cluster = interface; //jxl.biff.drawing.Dgg$Cluster
  JDgg = interface; //jxl.biff.drawing.Dgg
  JDggContainer = interface; //jxl.biff.drawing.DggContainer
  JDrawing_ImageAnchorProperties = interface; //jxl.biff.drawing.Drawing$ImageAnchorProperties
  JDrawing = interface; //jxl.biff.drawing.Drawing
  JDrawing2 = interface; //jxl.biff.drawing.Drawing2
  JDrawingData = interface; //jxl.biff.drawing.DrawingData
  JDrawingDataException = interface; //jxl.biff.drawing.DrawingDataException
  JDrawingGroup = interface; //jxl.biff.drawing.DrawingGroup
  JDrawingGroupObject = interface; //jxl.biff.drawing.DrawingGroupObject
  JEscherAtom = interface; //jxl.biff.drawing.EscherAtom
  JEscherContainer = interface; //jxl.biff.drawing.EscherContainer
  JEscherDisplay = interface; //jxl.biff.drawing.EscherDisplay
  JEscherRecord = interface; //jxl.biff.drawing.EscherRecord
  JEscherRecordData = interface; //jxl.biff.drawing.EscherRecordData
  JEscherRecordType = interface; //jxl.biff.drawing.EscherRecordType
  JEscherStream = interface; //jxl.biff.drawing.EscherStream
  JMsoDrawingGroupRecord = interface; //jxl.biff.drawing.MsoDrawingGroupRecord
  JMsoDrawingRecord = interface; //jxl.biff.drawing.MsoDrawingRecord
  JNoteRecord = interface; //jxl.biff.drawing.NoteRecord
  JObjRecord_ObjType = interface; //jxl.biff.drawing.ObjRecord$ObjType
  JObjRecord = interface; //jxl.biff.drawing.ObjRecord
  JOpt_Property = interface; //jxl.biff.drawing.Opt$Property
  JOpt = interface; //jxl.biff.drawing.Opt
  JOrigin = interface; //jxl.biff.drawing.Origin
  JPNGReader = interface; //jxl.biff.drawing.PNGReader
  JShapeType = interface; //jxl.biff.drawing.ShapeType
  JSheetDrawingWriter = interface; //jxl.biff.drawing.SheetDrawingWriter
  JSp = interface; //jxl.biff.drawing.Sp
  JSpContainer = interface; //jxl.biff.drawing.SpContainer
  JSpgr = interface; //jxl.biff.drawing.Spgr
  JSpgrContainer = interface; //jxl.biff.drawing.SpgrContainer
  JSplitMenuColors = interface; //jxl.biff.drawing.SplitMenuColors
  JTextObjectRecord = interface; //jxl.biff.drawing.TextObjectRecord
  JDValParser = interface; //jxl.biff.DValParser
  JDVParser_Condition = interface; //jxl.biff.DVParser$Condition
  JDVParser_DVType = interface; //jxl.biff.DVParser$DVType
  JDVParser_ErrorStyle = interface; //jxl.biff.DVParser$ErrorStyle
  JDVParser = interface; //jxl.biff.DVParser
  JEmptyCell = interface; //jxl.biff.EmptyCell
  JEncodedURLHelper = interface; //jxl.biff.EncodedURLHelper
  JFilterModeRecord = interface; //jxl.biff.FilterModeRecord
  JFontRecord_1 = interface; //jxl.biff.FontRecord$1
  JFontRecord_Biff7 = interface; //jxl.biff.FontRecord$Biff7
  JFontRecord = interface; //jxl.biff.FontRecord
  JFonts = interface; //jxl.biff.Fonts
  JFormatRecord_1 = interface; //jxl.biff.FormatRecord$1
  JFormatRecord_BiffType = interface; //jxl.biff.FormatRecord$BiffType
  JFormatRecord = interface; //jxl.biff.FormatRecord
  JFormattingRecords = interface; //jxl.biff.FormattingRecords
  JAdd = interface; //jxl.biff.formula.Add
  JArea = interface; //jxl.biff.formula.Area
  JArea3d = interface; //jxl.biff.formula.Area3d
  JArgumentSeparator = interface; //jxl.biff.formula.ArgumentSeparator
  JAttribute = interface; //jxl.biff.formula.Attribute
  JBinaryOperator = interface; //jxl.biff.formula.BinaryOperator
  JBooleanValue = interface; //jxl.biff.formula.BooleanValue
  JBuiltInFunction = interface; //jxl.biff.formula.BuiltInFunction
  JCellReference = interface; //jxl.biff.formula.CellReference
  JCellReference3d = interface; //jxl.biff.formula.CellReference3d
  JCellReferenceError = interface; //jxl.biff.formula.CellReferenceError
  JCloseParentheses = interface; //jxl.biff.formula.CloseParentheses
  JColumnRange = interface; //jxl.biff.formula.ColumnRange
  JColumnRange3d = interface; //jxl.biff.formula.ColumnRange3d
  JConcatenate = interface; //jxl.biff.formula.Concatenate
  JDivide = interface; //jxl.biff.formula.Divide
  JDoubleValue = interface; //jxl.biff.formula.DoubleValue
  JEqual = interface; //jxl.biff.formula.Equal
  JErrorConstant = interface; //jxl.biff.formula.ErrorConstant
  JExternalSheet = interface; //jxl.biff.formula.ExternalSheet
  JFormulaErrorCode = interface; //jxl.biff.formula.FormulaErrorCode
  JFormulaException_FormulaMessage = interface; //jxl.biff.formula.FormulaException$FormulaMessage
  JFormulaException = interface; //jxl.biff.formula.FormulaException
  JFormulaParser = interface; //jxl.biff.formula.FormulaParser
  JFunction = interface; //jxl.biff.formula.Function
  JFunctionNames = interface; //jxl.biff.formula.FunctionNames
  JGreaterEqual = interface; //jxl.biff.formula.GreaterEqual
  JGreaterThan = interface; //jxl.biff.formula.GreaterThan
  JIntegerValue = interface; //jxl.biff.formula.IntegerValue
  JLessEqual = interface; //jxl.biff.formula.LessEqual
  JLessThan = interface; //jxl.biff.formula.LessThan
  JMemArea = interface; //jxl.biff.formula.MemArea
  JMemFunc = interface; //jxl.biff.formula.MemFunc
  JMinus = interface; //jxl.biff.formula.Minus
  JMissingArg = interface; //jxl.biff.formula.MissingArg
  JMultiply = interface; //jxl.biff.formula.Multiply
  JName = interface; //jxl.biff.formula.Name
  JNameRange = interface; //jxl.biff.formula.NameRange
  JNotEqual = interface; //jxl.biff.formula.NotEqual
  JNumberValue = interface; //jxl.biff.formula.NumberValue
  JOpenParentheses = interface; //jxl.biff.formula.OpenParentheses
  JOperand = interface; //jxl.biff.formula.Operand
  JOperator = interface; //jxl.biff.formula.Operator
  JParenthesis = interface; //jxl.biff.formula.Parenthesis
  JParsedThing = interface; //jxl.biff.formula.ParsedThing
  JParseItem = interface; //jxl.biff.formula.ParseItem
  JParser = interface; //jxl.biff.formula.Parser
  JPercent = interface; //jxl.biff.formula.Percent
  JPlus = interface; //jxl.biff.formula.Plus
  JPower = interface; //jxl.biff.formula.Power
  JRangeSeparator = interface; //jxl.biff.formula.RangeSeparator
  JSharedFormulaArea = interface; //jxl.biff.formula.SharedFormulaArea
  JSharedFormulaCellReference = interface; //jxl.biff.formula.SharedFormulaCellReference
  JStringFormulaParser = interface; //jxl.biff.formula.StringFormulaParser
  JStringFunction = interface; //jxl.biff.formula.StringFunction
  JStringOperator = interface; //jxl.biff.formula.StringOperator
  JStringParseItem = interface; //jxl.biff.formula.StringParseItem
  JStringValue = interface; //jxl.biff.formula.StringValue
  JSubExpression = interface; //jxl.biff.formula.SubExpression
  JSubtract = interface; //jxl.biff.formula.Subtract
  JToken = interface; //jxl.biff.formula.Token
  JTokenFormulaParser = interface; //jxl.biff.formula.TokenFormulaParser
  JUnaryMinus = interface; //jxl.biff.formula.UnaryMinus
  JUnaryOperator = interface; //jxl.biff.formula.UnaryOperator
  JUnaryPlus = interface; //jxl.biff.formula.UnaryPlus
  JUnion = interface; //jxl.biff.formula.Union
  JVariableArgFunction = interface; //jxl.biff.formula.VariableArgFunction
  JYylex = interface; //jxl.biff.formula.Yylex
  JFormulaData = interface; //jxl.biff.FormulaData
  JHeaderFooter_Contents = interface; //jxl.biff.HeaderFooter$Contents
  JHeaderFooter = interface; //jxl.biff.HeaderFooter
  JIndexMapping = interface; //jxl.biff.IndexMapping
  JIntegerHelper = interface; //jxl.biff.IntegerHelper
  JNumFormatRecordsException = interface; //jxl.biff.NumFormatRecordsException
  JPaletteRecord = interface; //jxl.biff.PaletteRecord
  JRangeImpl = interface; //jxl.biff.RangeImpl
  JRecordData = interface; //jxl.biff.RecordData
  JSheetRangeImpl = interface; //jxl.biff.SheetRangeImpl
  JStringHelper = interface; //jxl.biff.StringHelper
  JType_1 = interface; //jxl.biff.Type$1
  JType_ArbitraryType = interface; //jxl.biff.Type$ArbitraryType
  JType = interface; //jxl.biff.Type
  JWorkbookMethods = interface; //jxl.biff.WorkbookMethods
  JWorkspaceInformationRecord = interface; //jxl.biff.WorkspaceInformationRecord
  JWritableRecordData = interface; //jxl.biff.WritableRecordData
  JXFRecord_1 = interface; //jxl.biff.XFRecord$1
  JXFRecord_BiffType = interface; //jxl.biff.XFRecord$BiffType
  JXFRecord_XFType = interface; //jxl.biff.XFRecord$XFType
  JXFRecord = interface; //jxl.biff.XFRecord
  JBooleanCell = interface; //jxl.BooleanCell
  JBooleanFormulaCell = interface; //jxl.BooleanFormulaCell
  JCell = interface; //jxl.Cell
  JCellFeatures = interface; //jxl.CellFeatures
  JCellFormat = interface; //jxl.CellFormat
  JCellReferenceHelper_190 = interface; //jxl.CellReferenceHelper
  JCellType = interface; //jxl.CellType
  JCellView = interface; //jxl.CellView
  JDateCell = interface; //jxl.DateCell
  JDateFormulaCell = interface; //jxl.DateFormulaCell
  JBiffDump = interface; //jxl.demo.BiffDump
  JCSV = interface; //jxl.demo.CSV
  JDemo = interface; //jxl.demo.Demo
  JEscher = interface; //jxl.demo.Escher
  JEscherDrawingGroup = interface; //jxl.demo.EscherDrawingGroup
  JFeatures = interface; //jxl.demo.Features
  JFormulas = interface; //jxl.demo.Formulas
  JPropertySetsReader = interface; //jxl.demo.PropertySetsReader
  JReadWrite = interface; //jxl.demo.ReadWrite
  JWrite = interface; //jxl.demo.Write
  JWriteAccess = interface; //jxl.demo.WriteAccess
  JXML = interface; //jxl.demo.XML
  JErrorCell = interface; //jxl.ErrorCell
  JErrorFormulaCell = interface; //jxl.ErrorFormulaCell
  JAlignment = interface; //jxl.format.Alignment
  JBoldStyle = interface; //jxl.format.BoldStyle
  JBorder = interface; //jxl.format.Border
  JBorderLineStyle = interface; //jxl.format.BorderLineStyle
  JCellFormat_213 = interface; //jxl.format.CellFormat
  JColour = interface; //jxl.format.Colour
  JFont = interface; //jxl.format.Font
  JFormat = interface; //jxl.format.Format
  JOrientation = interface; //jxl.format.Orientation
  JPageOrder = interface; //jxl.format.PageOrder
  JPageOrientation = interface; //jxl.format.PageOrientation
  JPaperSize = interface; //jxl.format.PaperSize
  JPattern = interface; //jxl.format.Pattern
  JRGB = interface; //jxl.format.RGB
  JScriptStyle = interface; //jxl.format.ScriptStyle
  JUnderlineStyle = interface; //jxl.format.UnderlineStyle
  JVerticalAlignment = interface; //jxl.format.VerticalAlignment
  JFormulaCell = interface; //jxl.FormulaCell
  JHeaderFooter_Contents_227 = interface; //jxl.HeaderFooter$Contents
  JHeaderFooter_228 = interface; //jxl.HeaderFooter
  JHyperlink = interface; //jxl.Hyperlink
  JImage = interface; //jxl.Image
  JJXLException = interface; //jxl.JXLException
  JLabelCell = interface; //jxl.LabelCell
  JNumberCell = interface; //jxl.NumberCell
  JNumberFormulaCell = interface; //jxl.NumberFormulaCell
  JRange = interface; //jxl.Range
  JBaseSharedFormulaRecord = interface; //jxl.read.biff.BaseSharedFormulaRecord
  JBiffException_BiffMessage = interface; //jxl.read.biff.BiffException$BiffMessage
  JBiffException = interface; //jxl.read.biff.BiffException
  JBiffRecordReader = interface; //jxl.read.biff.BiffRecordReader
  JBlankCell = interface; //jxl.read.biff.BlankCell
  JBOFRecord = interface; //jxl.read.biff.BOFRecord
  JBooleanFormulaRecord = interface; //jxl.read.biff.BooleanFormulaRecord
  JBooleanRecord = interface; //jxl.read.biff.BooleanRecord
  JBottomMarginRecord = interface; //jxl.read.biff.BottomMarginRecord
  JBoundsheetRecord_1 = interface; //jxl.read.biff.BoundsheetRecord$1
  JBoundsheetRecord_Biff7 = interface; //jxl.read.biff.BoundsheetRecord$Biff7
  JBoundsheetRecord = interface; //jxl.read.biff.BoundsheetRecord
  JButtonPropertySetRecord = interface; //jxl.read.biff.ButtonPropertySetRecord
  JCalcModeRecord = interface; //jxl.read.biff.CalcModeRecord
  JCellFeaturesAccessor = interface; //jxl.read.biff.CellFeaturesAccessor
  JCellValue = interface; //jxl.read.biff.CellValue
  JCentreRecord = interface; //jxl.read.biff.CentreRecord
  JCodepageRecord = interface; //jxl.read.biff.CodepageRecord
  JColumnInfoRecord = interface; //jxl.read.biff.ColumnInfoRecord
  JCompoundFile = interface; //jxl.read.biff.CompoundFile
  JCountryRecord = interface; //jxl.read.biff.CountryRecord
  JDateFormulaRecord = interface; //jxl.read.biff.DateFormulaRecord
  JDateRecord = interface; //jxl.read.biff.DateRecord
  JDefaultColumnWidthRecord = interface; //jxl.read.biff.DefaultColumnWidthRecord
  JDefaultRowHeightRecord = interface; //jxl.read.biff.DefaultRowHeightRecord
  JDimensionRecord_1 = interface; //jxl.read.biff.DimensionRecord$1
  JDimensionRecord_Biff7 = interface; //jxl.read.biff.DimensionRecord$Biff7
  JDimensionRecord = interface; //jxl.read.biff.DimensionRecord
  JErrorFormulaRecord = interface; //jxl.read.biff.ErrorFormulaRecord
  JErrorRecord = interface; //jxl.read.biff.ErrorRecord
  JExternalNameRecord = interface; //jxl.read.biff.ExternalNameRecord
  JExternalSheetRecord_1 = interface; //jxl.read.biff.ExternalSheetRecord$1
  JExternalSheetRecord_Biff7 = interface; //jxl.read.biff.ExternalSheetRecord$Biff7
  JExternalSheetRecord_XTI = interface; //jxl.read.biff.ExternalSheetRecord$XTI
  JExternalSheetRecord = interface; //jxl.read.biff.ExternalSheetRecord
  JFile = interface; //jxl.read.biff.File
  JFooterRecord_1 = interface; //jxl.read.biff.FooterRecord$1
  JFooterRecord_Biff7 = interface; //jxl.read.biff.FooterRecord$Biff7
  JFooterRecord = interface; //jxl.read.biff.FooterRecord
  JFormula = interface; //jxl.read.biff.Formula
  JFormulaRecord_1 = interface; //jxl.read.biff.FormulaRecord$1
  JFormulaRecord_IgnoreSharedFormula = interface; //jxl.read.biff.FormulaRecord$IgnoreSharedFormula
  JFormulaRecord = interface; //jxl.read.biff.FormulaRecord
  JGuttersRecord = interface; //jxl.read.biff.GuttersRecord
  JHeaderRecord_1 = interface; //jxl.read.biff.HeaderRecord$1
  JHeaderRecord_Biff7 = interface; //jxl.read.biff.HeaderRecord$Biff7
  JHeaderRecord = interface; //jxl.read.biff.HeaderRecord
  JHorizontalPageBreaksRecord_1 = interface; //jxl.read.biff.HorizontalPageBreaksRecord$1
  JHorizontalPageBreaksRecord_Biff7 = interface; //jxl.read.biff.HorizontalPageBreaksRecord$Biff7
  JHorizontalPageBreaksRecord = interface; //jxl.read.biff.HorizontalPageBreaksRecord
  JHyperlinkRecord_1 = interface; //jxl.read.biff.HyperlinkRecord$1
  JHyperlinkRecord_LinkType = interface; //jxl.read.biff.HyperlinkRecord$LinkType
  JHyperlinkRecord = interface; //jxl.read.biff.HyperlinkRecord
  JLabelRecord_1 = interface; //jxl.read.biff.LabelRecord$1
  JLabelRecord_Biff7 = interface; //jxl.read.biff.LabelRecord$Biff7
  JLabelRecord = interface; //jxl.read.biff.LabelRecord
  JLabelSSTRecord = interface; //jxl.read.biff.LabelSSTRecord
  JLeftMarginRecord = interface; //jxl.read.biff.LeftMarginRecord
  JMarginRecord = interface; //jxl.read.biff.MarginRecord
  JMergedCellsRecord = interface; //jxl.read.biff.MergedCellsRecord
  JMulBlankCell = interface; //jxl.read.biff.MulBlankCell
  JMulBlankRecord = interface; //jxl.read.biff.MulBlankRecord
  JMulRKRecord = interface; //jxl.read.biff.MulRKRecord
  JNameRecord_1 = interface; //jxl.read.biff.NameRecord$1
  JNameRecord_Biff7 = interface; //jxl.read.biff.NameRecord$Biff7
  JNameRecord_NameRange = interface; //jxl.read.biff.NameRecord$NameRange
  JNameRecord = interface; //jxl.read.biff.NameRecord
  JNineteenFourRecord = interface; //jxl.read.biff.NineteenFourRecord
  JNumberFormulaRecord = interface; //jxl.read.biff.NumberFormulaRecord
  JNumberRecord = interface; //jxl.read.biff.NumberRecord
  JNumberValue_306 = interface; //jxl.read.biff.NumberValue
  JPaletteRecord_307 = interface; //jxl.read.biff.PaletteRecord
  JPaneRecord = interface; //jxl.read.biff.PaneRecord
  JPasswordException = interface; //jxl.read.biff.PasswordException
  JPasswordRecord = interface; //jxl.read.biff.PasswordRecord
  JPLSRecord = interface; //jxl.read.biff.PLSRecord
  JPrintGridLinesRecord = interface; //jxl.read.biff.PrintGridLinesRecord
  JPrintHeadersRecord = interface; //jxl.read.biff.PrintHeadersRecord
  JProtectRecord = interface; //jxl.read.biff.ProtectRecord
  JRecord = interface; //jxl.read.biff.Record
  JRightMarginRecord = interface; //jxl.read.biff.RightMarginRecord
  JRKHelper = interface; //jxl.read.biff.RKHelper
  JRKRecord = interface; //jxl.read.biff.RKRecord
  JRowRecord = interface; //jxl.read.biff.RowRecord
  JRStringRecord_1 = interface; //jxl.read.biff.RStringRecord$1
  JRStringRecord_Biff7 = interface; //jxl.read.biff.RStringRecord$Biff7
  JRStringRecord = interface; //jxl.read.biff.RStringRecord
  JSaveRecalcRecord = interface; //jxl.read.biff.SaveRecalcRecord
  JSCLRecord = interface; //jxl.read.biff.SCLRecord
  JSetupRecord = interface; //jxl.read.biff.SetupRecord
  JSharedBooleanFormulaRecord = interface; //jxl.read.biff.SharedBooleanFormulaRecord
  JSharedDateFormulaRecord = interface; //jxl.read.biff.SharedDateFormulaRecord
  JSharedErrorFormulaRecord = interface; //jxl.read.biff.SharedErrorFormulaRecord
  JSharedFormulaRecord = interface; //jxl.read.biff.SharedFormulaRecord
  JSharedNumberFormulaRecord = interface; //jxl.read.biff.SharedNumberFormulaRecord
  JSharedStringFormulaRecord_1 = interface; //jxl.read.biff.SharedStringFormulaRecord$1
  JSharedStringFormulaRecord_EmptyString = interface; //jxl.read.biff.SharedStringFormulaRecord$EmptyString
  JSharedStringFormulaRecord = interface; //jxl.read.biff.SharedStringFormulaRecord
  JSheetImpl = interface; //jxl.read.biff.SheetImpl
  JSheetReader = interface; //jxl.read.biff.SheetReader
  JSortRecord = interface; //jxl.read.biff.SortRecord
  JSSTRecord_1 = interface; //jxl.read.biff.SSTRecord$1
  JSSTRecord_BooleanHolder = interface; //jxl.read.biff.SSTRecord$BooleanHolder
  JSSTRecord_ByteArrayHolder = interface; //jxl.read.biff.SSTRecord$ByteArrayHolder
  JSSTRecord = interface; //jxl.read.biff.SSTRecord
  JStringFormulaRecord = interface; //jxl.read.biff.StringFormulaRecord
  JSupbookRecord_1 = interface; //jxl.read.biff.SupbookRecord$1
  JSupbookRecord_Type = interface; //jxl.read.biff.SupbookRecord$Type
  JSupbookRecord = interface; //jxl.read.biff.SupbookRecord
  JTopMarginRecord = interface; //jxl.read.biff.TopMarginRecord
  JVerticalPageBreaksRecord_1 = interface; //jxl.read.biff.VerticalPageBreaksRecord$1
  JVerticalPageBreaksRecord_Biff7 = interface; //jxl.read.biff.VerticalPageBreaksRecord$Biff7
  JVerticalPageBreaksRecord = interface; //jxl.read.biff.VerticalPageBreaksRecord
  JWindow2Record_1 = interface; //jxl.read.biff.Window2Record$1
  JWindow2Record_Biff7 = interface; //jxl.read.biff.Window2Record$Biff7
  JWindow2Record = interface; //jxl.read.biff.Window2Record
  JWorkbookParser = interface; //jxl.read.biff.WorkbookParser
  JSheet = interface; //jxl.Sheet
  JSheetSettings = interface; //jxl.SheetSettings
  JStringFormulaCell = interface; //jxl.StringFormulaCell
  JWorkbook = interface; //jxl.Workbook
  JWorkbookSettings = interface; //jxl.WorkbookSettings
  JAlignment_358 = interface; //jxl.write.Alignment
  JArbitraryRecord = interface; //jxl.write.biff.ArbitraryRecord
  JBackupRecord = interface; //jxl.write.biff.BackupRecord
  JBlankRecord = interface; //jxl.write.biff.BlankRecord
  JBOFRecord_1 = interface; //jxl.write.biff.BOFRecord$1
  JBOFRecord_SheetBOF = interface; //jxl.write.biff.BOFRecord$SheetBOF
  JBOFRecord_WorkbookGlobalsBOF = interface; //jxl.write.biff.BOFRecord$WorkbookGlobalsBOF
  JBOFRecord_365 = interface; //jxl.write.biff.BOFRecord
  JBookboolRecord = interface; //jxl.write.biff.BookboolRecord
  JBooleanRecord_367 = interface; //jxl.write.biff.BooleanRecord
  JBottomMarginRecord_368 = interface; //jxl.write.biff.BottomMarginRecord
  JBoundsheetRecord_369 = interface; //jxl.write.biff.BoundsheetRecord
  JButtonPropertySetRecord_370 = interface; //jxl.write.biff.ButtonPropertySetRecord
  JCalcCountRecord = interface; //jxl.write.biff.CalcCountRecord
  JCalcModeRecord_CalcMode = interface; //jxl.write.biff.CalcModeRecord$CalcMode
  JCalcModeRecord_373 = interface; //jxl.write.biff.CalcModeRecord
  JCellValue_374 = interface; //jxl.write.biff.CellValue
  JCellXFRecord = interface; //jxl.write.biff.CellXFRecord
  JCodepageRecord_376 = interface; //jxl.write.biff.CodepageRecord
  JColumnInfoRecord_377 = interface; //jxl.write.biff.ColumnInfoRecord
  JColumnsExceededException = interface; //jxl.write.biff.ColumnsExceededException
  JCompoundFile_ReadPropertyStorage = interface; //jxl.write.biff.CompoundFile$ReadPropertyStorage
  JCompoundFile_380 = interface; //jxl.write.biff.CompoundFile
  JCopyAdditionalPropertySetsException = interface; //jxl.write.biff.CopyAdditionalPropertySetsException
  JCountryRecord_382 = interface; //jxl.write.biff.CountryRecord
  JDateFormatRecord = interface; //jxl.write.biff.DateFormatRecord
  JDateRecord_GMTDate = interface; //jxl.write.biff.DateRecord$GMTDate
  JDateRecord_385 = interface; //jxl.write.biff.DateRecord
  JDBCellRecord = interface; //jxl.write.biff.DBCellRecord
  JDefaultColumnWidth = interface; //jxl.write.biff.DefaultColumnWidth
  JDefaultRowHeightRecord_388 = interface; //jxl.write.biff.DefaultRowHeightRecord
  JDeltaRecord = interface; //jxl.write.biff.DeltaRecord
  JDimensionRecord_390 = interface; //jxl.write.biff.DimensionRecord
  JDSFRecord = interface; //jxl.write.biff.DSFRecord
  JEOFRecord = interface; //jxl.write.biff.EOFRecord
  JExcelDataOutput = interface; //jxl.write.biff.ExcelDataOutput
  JExtendedSSTRecord = interface; //jxl.write.biff.ExtendedSSTRecord
  JExternalNameRecord_395 = interface; //jxl.write.biff.ExternalNameRecord
  JExternalSheetRecord_XTI_396 = interface; //jxl.write.biff.ExternalSheetRecord$XTI
  JExternalSheetRecord_397 = interface; //jxl.write.biff.ExternalSheetRecord
  JFile_398 = interface; //jxl.write.biff.File
  JFileDataOutput = interface; //jxl.write.biff.FileDataOutput
  JFooterRecord_400 = interface; //jxl.write.biff.FooterRecord
  JFormulaRecord_401 = interface; //jxl.write.biff.FormulaRecord
  JFunctionGroupCountRecord = interface; //jxl.write.biff.FunctionGroupCountRecord
  JGridSetRecord = interface; //jxl.write.biff.GridSetRecord
  JGuttersRecord_404 = interface; //jxl.write.biff.GuttersRecord
  JHeaderRecord_405 = interface; //jxl.write.biff.HeaderRecord
  JHideobjRecord = interface; //jxl.write.biff.HideobjRecord
  JHorizontalCentreRecord = interface; //jxl.write.biff.HorizontalCentreRecord
  JHorizontalPageBreaksRecord_408 = interface; //jxl.write.biff.HorizontalPageBreaksRecord
  JHyperlinkRecord_1_409 = interface; //jxl.write.biff.HyperlinkRecord$1
  JHyperlinkRecord_LinkType_410 = interface; //jxl.write.biff.HyperlinkRecord$LinkType
  JHyperlinkRecord_411 = interface; //jxl.write.biff.HyperlinkRecord
  JIndexRecord = interface; //jxl.write.biff.IndexRecord
  JInterfaceEndRecord = interface; //jxl.write.biff.InterfaceEndRecord
  JInterfaceHeaderRecord = interface; //jxl.write.biff.InterfaceHeaderRecord
  JIterationRecord = interface; //jxl.write.biff.IterationRecord
  JJxlWriteException_WriteMessage = interface; //jxl.write.biff.JxlWriteException$WriteMessage
  JJxlWriteException = interface; //jxl.write.biff.JxlWriteException
  JLabelRecord_418 = interface; //jxl.write.biff.LabelRecord
  JLeftMarginRecord_419 = interface; //jxl.write.biff.LeftMarginRecord
  JMarginRecord_420 = interface; //jxl.write.biff.MarginRecord
  JMemoryDataOutput = interface; //jxl.write.biff.MemoryDataOutput
  JMergedCells = interface; //jxl.write.biff.MergedCells
  JMergedCellsRecord_423 = interface; //jxl.write.biff.MergedCellsRecord
  JMMSRecord = interface; //jxl.write.biff.MMSRecord
  JMulRKRecord_425 = interface; //jxl.write.biff.MulRKRecord
  JNameRecord_NameRange_426 = interface; //jxl.write.biff.NameRecord$NameRange
  JNameRecord_427 = interface; //jxl.write.biff.NameRecord
  JNineteenFourRecord_428 = interface; //jxl.write.biff.NineteenFourRecord
  JNumberFormatRecord_NonValidatingFormat = interface; //jxl.write.biff.NumberFormatRecord$NonValidatingFormat
  JNumberFormatRecord = interface; //jxl.write.biff.NumberFormatRecord
  JNumberRecord_431 = interface; //jxl.write.biff.NumberRecord
  JObjectProtectRecord = interface; //jxl.write.biff.ObjectProtectRecord
  JObjProjRecord = interface; //jxl.write.biff.ObjProjRecord
  JPaletteRecord_434 = interface; //jxl.write.biff.PaletteRecord
  JPaneRecord_435 = interface; //jxl.write.biff.PaneRecord
  JPasswordRecord_436 = interface; //jxl.write.biff.PasswordRecord
  JPLSRecord_437 = interface; //jxl.write.biff.PLSRecord
  JPrecisionRecord = interface; //jxl.write.biff.PrecisionRecord
  JPrintGridLinesRecord_439 = interface; //jxl.write.biff.PrintGridLinesRecord
  JPrintHeadersRecord_440 = interface; //jxl.write.biff.PrintHeadersRecord
  JProt4RevPassRecord = interface; //jxl.write.biff.Prot4RevPassRecord
  JProt4RevRecord = interface; //jxl.write.biff.Prot4RevRecord
  JProtectRecord_443 = interface; //jxl.write.biff.ProtectRecord
  JReadBooleanFormulaRecord = interface; //jxl.write.biff.ReadBooleanFormulaRecord
  JReadDateFormulaRecord = interface; //jxl.write.biff.ReadDateFormulaRecord
  JReadErrorFormulaRecord = interface; //jxl.write.biff.ReadErrorFormulaRecord
  JReadFormulaRecord = interface; //jxl.write.biff.ReadFormulaRecord
  JReadNumberFormulaRecord = interface; //jxl.write.biff.ReadNumberFormulaRecord
  JReadStringFormulaRecord = interface; //jxl.write.biff.ReadStringFormulaRecord
  JRefModeRecord = interface; //jxl.write.biff.RefModeRecord
  JRefreshAllRecord = interface; //jxl.write.biff.RefreshAllRecord
  JRightMarginRecord_452 = interface; //jxl.write.biff.RightMarginRecord
  JRowRecord_453 = interface; //jxl.write.biff.RowRecord
  JRowsExceededException = interface; //jxl.write.biff.RowsExceededException
  JSaveRecalcRecord_455 = interface; //jxl.write.biff.SaveRecalcRecord
  JScenarioProtectRecord = interface; //jxl.write.biff.ScenarioProtectRecord
  JSCLRecord_457 = interface; //jxl.write.biff.SCLRecord
  JSelectionRecord_PaneType = interface; //jxl.write.biff.SelectionRecord$PaneType
  JSelectionRecord = interface; //jxl.write.biff.SelectionRecord
  JSetupRecord_460 = interface; //jxl.write.biff.SetupRecord
  JSharedStrings = interface; //jxl.write.biff.SharedStrings
  JSheetCopier = interface; //jxl.write.biff.SheetCopier
  JSheetWriter = interface; //jxl.write.biff.SheetWriter
  JSortRecord_464 = interface; //jxl.write.biff.SortRecord
  JSSTContinueRecord = interface; //jxl.write.biff.SSTContinueRecord
  JSSTRecord_466 = interface; //jxl.write.biff.SSTRecord
  JStringRecord = interface; //jxl.write.biff.StringRecord
  JStyles = interface; //jxl.write.biff.Styles
  JStyleXFRecord = interface; //jxl.write.biff.StyleXFRecord
  JSupbookRecord_1_470 = interface; //jxl.write.biff.SupbookRecord$1
  JSupbookRecord_SupbookType = interface; //jxl.write.biff.SupbookRecord$SupbookType
  JSupbookRecord_472 = interface; //jxl.write.biff.SupbookRecord
  JTabIdRecord = interface; //jxl.write.biff.TabIdRecord
  JTopMarginRecord_474 = interface; //jxl.write.biff.TopMarginRecord
  JUsesElfsRecord = interface; //jxl.write.biff.UsesElfsRecord
  JVerticalCentreRecord = interface; //jxl.write.biff.VerticalCentreRecord
  JVerticalPageBreaksRecord_477 = interface; //jxl.write.biff.VerticalPageBreaksRecord
  JWeird1Record = interface; //jxl.write.biff.Weird1Record
  JWindow1Record = interface; //jxl.write.biff.Window1Record
  JWindow2Record_480 = interface; //jxl.write.biff.Window2Record
  JWindowProtectRecord = interface; //jxl.write.biff.WindowProtectRecord
  JWritableFontRecord = interface; //jxl.write.biff.WritableFontRecord
  JWritableFonts = interface; //jxl.write.biff.WritableFonts
  JWritableFormattingRecords = interface; //jxl.write.biff.WritableFormattingRecords
  JWritableSheetCopier = interface; //jxl.write.biff.WritableSheetCopier
  JWritableSheetImpl_1 = interface; //jxl.write.biff.WritableSheetImpl$1
  JWritableSheetImpl_ColumnInfoComparator = interface; //jxl.write.biff.WritableSheetImpl$ColumnInfoComparator
  JWritableSheetImpl = interface; //jxl.write.biff.WritableSheetImpl
  JWritableWorkbookImpl = interface; //jxl.write.biff.WritableWorkbookImpl
  JWriteAccessRecord = interface; //jxl.write.biff.WriteAccessRecord
  JBlank = interface; //jxl.write.Blank
  JBoldStyle_492 = interface; //jxl.write.BoldStyle
  JBoolean = interface; //jxl.write.Boolean
  JBorder_494 = interface; //jxl.write.Border
  JBorderLineStyle_495 = interface; //jxl.write.BorderLineStyle
  JColour_496 = interface; //jxl.write.Colour
  JDateFormat = interface; //jxl.write.DateFormat
  JDateFormats_BuiltInFormat = interface; //jxl.write.DateFormats$BuiltInFormat
  JDateFormats = interface; //jxl.write.DateFormats
  JDateTime = interface; //jxl.write.DateTime
  JFont_501 = interface; //jxl.write.Font
  JFormula_502 = interface; //jxl.write.Formula
  JLabel = interface; //jxl.write.Label
  JNumber = interface; //jxl.write.Number
  JNumberFormat = interface; //jxl.write.NumberFormat
  JNumberFormats_BuiltInFormat = interface; //jxl.write.NumberFormats$BuiltInFormat
  JNumberFormats = interface; //jxl.write.NumberFormats
  JPattern_508 = interface; //jxl.write.Pattern
  JVerticalAlignment_509 = interface; //jxl.write.VerticalAlignment
  JWritableCell = interface; //jxl.write.WritableCell
  JWritableCellFeatures = interface; //jxl.write.WritableCellFeatures
  JWritableCellFormat = interface; //jxl.write.WritableCellFormat
  JWritableFont_BoldStyle = interface; //jxl.write.WritableFont$BoldStyle
  JWritableFont_FontName = interface; //jxl.write.WritableFont$FontName
  JWritableFont = interface; //jxl.write.WritableFont
  JWritableHyperlink = interface; //jxl.write.WritableHyperlink
  JWritableImage = interface; //jxl.write.WritableImage
  JWritableSheet = interface; //jxl.write.WritableSheet
  JWritableWorkbook = interface; //jxl.write.WritableWorkbook
  JWriteException = interface; //jxl.write.WriteException

// ===== Forward SuperClasses declarations =====

  JBaseUnitClass = interface; //common.BaseUnit
  JLoggerClass = interface; //common.Logger
  JWritableRecordDataClass = interface; //jxl.biff.WritableRecordData
  JEscherAtomClass = interface; //jxl.biff.drawing.EscherAtom
  JEscherContainerClass = interface; //jxl.biff.drawing.EscherContainer
  JEscherRecordClass = interface; //jxl.biff.drawing.EscherRecord
  JBinaryOperatorClass = interface; //jxl.biff.formula.BinaryOperator
  JOperandClass = interface; //jxl.biff.formula.Operand
  JStringParseItemClass = interface; //jxl.biff.formula.StringParseItem
  JOperatorClass = interface; //jxl.biff.formula.Operator
  JAreaClass = interface; //jxl.biff.formula.Area
  JArea3dClass = interface; //jxl.biff.formula.Area3d
  JNumberValueClass = interface; //jxl.biff.formula.NumberValue
  JJXLExceptionClass = interface; //jxl.JXLException
  JSubExpressionClass = interface; //jxl.biff.formula.SubExpression
  JStringOperatorClass = interface; //jxl.biff.formula.StringOperator
  JParseItemClass = interface; //jxl.biff.formula.ParseItem
  JUnaryOperatorClass = interface; //jxl.biff.formula.UnaryOperator
  JRecordDataClass = interface; //jxl.biff.RecordData
  JBaseCellFeaturesClass = interface; //jxl.biff.BaseCellFeatures
  JHeaderFooter_ContentsClass = interface; //jxl.biff.HeaderFooter$Contents
  JHeaderFooterClass = interface; //jxl.biff.HeaderFooter
  JCellValueClass = interface; //jxl.read.biff.CellValue
  JMarginRecordClass = interface; //jxl.read.biff.MarginRecord
  JBaseCompoundFileClass = interface; //jxl.biff.BaseCompoundFile
  JDateRecordClass = interface; //jxl.read.biff.DateRecord
  JBiffExceptionClass = interface; //jxl.read.biff.BiffException
  JBaseSharedFormulaRecordClass = interface; //jxl.read.biff.BaseSharedFormulaRecord
  JWorkbookClass = interface; //jxl.Workbook
  JAlignmentClass = interface; //jxl.format.Alignment
  JCellValue_374Class = interface; //jxl.write.biff.CellValue
  JMarginRecord_420Class = interface; //jxl.write.biff.MarginRecord
  JXFRecordClass = interface; //jxl.biff.XFRecord
  JJxlWriteExceptionClass = interface; //jxl.write.biff.JxlWriteException
  JFormatRecordClass = interface; //jxl.biff.FormatRecord
  JWriteExceptionClass = interface; //jxl.write.WriteException
  JReadFormulaRecordClass = interface; //jxl.write.biff.ReadFormulaRecord
  JFontRecordClass = interface; //jxl.biff.FontRecord
  JFontsClass = interface; //jxl.biff.Fonts
  JFormattingRecordsClass = interface; //jxl.biff.FormattingRecords
  JWritableWorkbookClass = interface; //jxl.write.WritableWorkbook
  JBlankRecordClass = interface; //jxl.write.biff.BlankRecord
  JBoldStyleClass = interface; //jxl.format.BoldStyle
  JBooleanRecord_367Class = interface; //jxl.write.biff.BooleanRecord
  JBorderClass = interface; //jxl.format.Border
  JBorderLineStyleClass = interface; //jxl.format.BorderLineStyle
  JColourClass = interface; //jxl.format.Colour
  JDateFormatRecordClass = interface; //jxl.write.biff.DateFormatRecord
  JDateRecord_385Class = interface; //jxl.write.biff.DateRecord
  JWritableFontClass = interface; //jxl.write.WritableFont
  JFormulaRecord_401Class = interface; //jxl.write.biff.FormulaRecord
  JLabelRecord_418Class = interface; //jxl.write.biff.LabelRecord
  JNumberRecord_431Class = interface; //jxl.write.biff.NumberRecord
  JNumberFormatRecordClass = interface; //jxl.write.biff.NumberFormatRecord
  JPatternClass = interface; //jxl.format.Pattern
  JVerticalAlignmentClass = interface; //jxl.format.VerticalAlignment
  JCellFeaturesClass = interface; //jxl.CellFeatures
  JCellXFRecordClass = interface; //jxl.write.biff.CellXFRecord
  JWritableFontRecordClass = interface; //jxl.write.biff.WritableFontRecord
  JHyperlinkRecord_411Class = interface; //jxl.write.biff.HyperlinkRecord
  JDrawingClass = interface; //jxl.biff.drawing.Drawing

// ===== Interface declarations =====

  JAssertClass = interface(JObjectClass)
  ['{444087E7-7D73-447E-A8FC-592B4A8454FA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAssert; cdecl;
    {class} procedure verify(condition: Boolean); cdecl; overload;
    {class} procedure verify(condition: Boolean; amessage: JString); cdecl; overload;

    { static Property }
  end;

  [JavaSignature('common/Assert')]
  JAssert = interface(JObject)
  ['{7E8D57C7-BEEC-4BC7-B865-68371118723C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAssert = class(TJavaGenericImport<JAssertClass, JAssert>) end;

  JAssertionFailedClass = interface(JRuntimeExceptionClass) // or JObjectClass
  ['{71A1552A-755D-4CD3-85D3-2E80BFF22D3B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAssertionFailed; cdecl; overload;
    {class} function init(s: JString): JAssertionFailed; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('common/AssertionFailed')]
  JAssertionFailed = interface(JRuntimeException) // or JObject
  ['{AF632601-98A6-43B8-A0FB-38C9336F0482}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAssertionFailed = class(TJavaGenericImport<JAssertionFailedClass, JAssertionFailed>) end;

  JBaseUnitClass = interface(JObjectClass)
  ['{45B6B367-8208-4968-A6F3-C0D842460D18}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('common/BaseUnit')]
  JBaseUnit = interface(JObject)
  ['{3C764CB0-2E78-4527-9D6C-DC55CAF94150}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaseUnit = class(TJavaGenericImport<JBaseUnitClass, JBaseUnit>) end;

  JLengthConverterClass = interface(JObjectClass)
  ['{2F367A20-5175-431D-8F27-202CB365E5FD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLengthConverter; cdecl;
    {class} function getConversionFactor(from: JLengthUnit; ato: JLengthUnit): Double; cdecl;

    { static Property }
  end;

  [JavaSignature('common/LengthConverter')]
  JLengthConverter = interface(JObject)
  ['{CFB50C63-D34C-44CF-A982-E92CE7230BFD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLengthConverter = class(TJavaGenericImport<JLengthConverterClass, JLengthConverter>) end;

  JLengthUnitClass = interface(JBaseUnitClass) // or JObjectClass
  ['{7FA33BC8-D41D-4290-A0D6-619ADE8FCDFD}']
    { static Property Methods }
    {class} function _GetPOINTS: JLengthUnit;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMETRES: JLengthUnit;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCENTIMETRES: JLengthUnit;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINCHES: JLengthUnit;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getCount: Integer; cdecl;

    { static Property }
    {class} property POINTS: JLengthUnit read _GetPOINTS;
    {class} property METRES: JLengthUnit read _GetMETRES;
    {class} property CENTIMETRES: JLengthUnit read _GetCENTIMETRES;
    {class} property INCHES: JLengthUnit read _GetINCHES;
  end;

  [JavaSignature('common/LengthUnit')]
  JLengthUnit = interface(JBaseUnit) // or JObject
  ['{CE023875-14C3-4F59-853E-E97F875EB7EB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLengthUnit = class(TJavaGenericImport<JLengthUnitClass, JLengthUnit>) end;

  JLoggerNameClass = interface(JObjectClass)
  ['{234DA893-50A8-4D61-B4D9-FF9ED788EB17}']
    { static Property Methods }
    {class} function _GetNAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JLoggerName; cdecl;

    { static Property }
    {class} property NAME: JString read _GetNAME;
  end;

  [JavaSignature('common/log/LoggerName')]
  JLoggerName = interface(JObject)
  ['{00985737-6DBB-4AFF-B463-7954D1719B5C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLoggerName = class(TJavaGenericImport<JLoggerNameClass, JLoggerName>) end;

  JSimpleLoggerClass = interface(JLoggerClass) // or JObjectClass
  ['{16EC0A53-44E5-4E6F-955E-1C21A04DA35F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSimpleLogger; cdecl;

    { static Property }
  end;

  [JavaSignature('common/log/SimpleLogger')]
  JSimpleLogger = interface(JLogger) // or JObject
  ['{60737E99-84C9-4E6C-B123-88F69725C0CE}']
    { Property Methods }

    { methods }
    procedure debug(amessage: JObject); cdecl; overload;
    procedure debug(amessage: JObject; t: JThrowable); cdecl; overload;
    procedure error(amessage: JObject); cdecl; overload;
    procedure error(amessage: JObject; t: JThrowable); cdecl; overload;
    procedure fatal(amessage: JObject); cdecl; overload;
    procedure fatal(amessage: JObject; t: JThrowable); cdecl; overload;
    procedure info(amessage: JObject); cdecl; overload;
    procedure info(amessage: JObject; t: JThrowable); cdecl; overload;
    procedure warn(amessage: JObject); cdecl; overload;
    procedure warn(amessage: JObject; t: JThrowable); cdecl; overload;
    procedure setSuppressWarnings(w: Boolean); cdecl;

    { Property }
  end;

  TJSimpleLogger = class(TJavaGenericImport<JSimpleLoggerClass, JSimpleLogger>) end;

  JLoggerClass = interface(JObjectClass)
  ['{85582C8E-309D-4A91-A111-62589DB7762E}']
    { static Property Methods }

    { static Methods }
    {class} function getLogger(cl: JClass): JLogger; cdecl;

    { static Property }
  end;

  [JavaSignature('common/Logger')]
  JLogger = interface(JObject)
  ['{1C8C770D-C745-4A35-A31A-2AD5D798B3E7}']
    { Property Methods }

    { methods }
    procedure debug(P1: JObject); cdecl; overload;
    procedure debug(P1: JObject; P2: JThrowable); cdecl; overload;
    procedure error(P1: JObject); cdecl; overload;
    procedure error(P1: JObject; P2: JThrowable); cdecl; overload;
    procedure fatal(P1: JObject); cdecl; overload;
    procedure fatal(P1: JObject; P2: JThrowable); cdecl; overload;
    procedure info(P1: JObject); cdecl; overload;
    procedure info(P1: JObject; P2: JThrowable); cdecl; overload;
    procedure warn(P1: JObject); cdecl; overload;
    procedure warn(P1: JObject; P2: JThrowable); cdecl; overload;
    procedure setSuppressWarnings(w: Boolean); cdecl;

    { Property }
  end;

  TJLogger = class(TJavaGenericImport<JLoggerClass, JLogger>) end;

  JAutoFilterClass = interface(JObjectClass)
  ['{5651868F-FB45-4E28-80CA-1A802C2A3457}']
    { static Property Methods }

    { static Methods }
    {class} function init(fmr: JFilterModeRecord; afir: JAutoFilterInfoRecord): JAutoFilter; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/AutoFilter')]
  JAutoFilter = interface(JObject)
  ['{49453264-5C32-4C8C-90B9-3D8ED39C752E}']
    { Property Methods }

    { methods }
    procedure add(af: JAutoFilterRecord); cdecl;
    procedure write(outputFile: JFile); cdecl;

    { Property }
  end;

  TJAutoFilter = class(TJavaGenericImport<JAutoFilterClass, JAutoFilter>) end;

  JAutoFilterInfoRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{20303D82-19D0-4C2C-8AF4-8E243AF19F36}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JAutoFilterInfoRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/AutoFilterInfoRecord')]
  JAutoFilterInfoRecord = interface(JWritableRecordData) // or JObject
  ['{E6668CE2-424E-4F4F-A46F-A1541353C85E}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJAutoFilterInfoRecord = class(TJavaGenericImport<JAutoFilterInfoRecordClass, JAutoFilterInfoRecord>) end;

  JAutoFilterRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{A0C5C362-87A0-4C63-84FE-44131C7FEDC2}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JAutoFilterRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/AutoFilterRecord')]
  JAutoFilterRecord = interface(JWritableRecordData) // or JObject
  ['{50C9EEBC-F905-42E1-8CC1-FD8D3354F29A}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJAutoFilterRecord = class(TJavaGenericImport<JAutoFilterRecordClass, JAutoFilterRecord>) end;

  JBaseCellFeatures_ValidationConditionClass = interface(JObjectClass)
  ['{E23D87CA-184F-4B33-8457-A8BCA99E1568}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/BaseCellFeatures$ValidationCondition')]
  JBaseCellFeatures_ValidationCondition = interface(JObject)
  ['{CE303D09-36F6-4E06-92F7-36269E2EF806}']
    { Property Methods }

    { methods }
    function getCondition: JDVParser_Condition; cdecl;

    { Property }
  end;

  TJBaseCellFeatures_ValidationCondition = class(TJavaGenericImport<JBaseCellFeatures_ValidationConditionClass, JBaseCellFeatures_ValidationCondition>) end;

  JBaseCellFeaturesClass = interface(JObjectClass)
  ['{6F1F24AF-8F67-41ED-A521-12FD5C6C6429}']
    { static Property Methods }
    {class} function _Getlogger: JLogger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBETWEEN: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOT_BETWEEN: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEQUAL: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOT_EQUAL: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREATER_THAN: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLESS_THAN: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREATER_EQUAL: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLESS_EQUAL: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(cf: JBaseCellFeatures): JBaseCellFeatures; cdecl;

    { static Property }
    {class} property logger: JLogger read _Getlogger;
    {class} property BETWEEN: JBaseCellFeatures_ValidationCondition read _GetBETWEEN;
    {class} property NOT_BETWEEN: JBaseCellFeatures_ValidationCondition read _GetNOT_BETWEEN;
    {class} property EQUAL: JBaseCellFeatures_ValidationCondition read _GetEQUAL;
    {class} property NOT_EQUAL: JBaseCellFeatures_ValidationCondition read _GetNOT_EQUAL;
    {class} property GREATER_THAN: JBaseCellFeatures_ValidationCondition read _GetGREATER_THAN;
    {class} property LESS_THAN: JBaseCellFeatures_ValidationCondition read _GetLESS_THAN;
    {class} property GREATER_EQUAL: JBaseCellFeatures_ValidationCondition read _GetGREATER_EQUAL;
    {class} property LESS_EQUAL: JBaseCellFeatures_ValidationCondition read _GetLESS_EQUAL;
  end;

  [JavaSignature('jxl/biff/BaseCellFeatures')]
  JBaseCellFeatures = interface(JObject)
  ['{EA7B1CF0-6E7E-4906-98B3-68C815E45BE0}']
    { Property Methods }

    { methods }
    function getCommentWidth: Double; cdecl;
    function getCommentHeight: Double; cdecl;
    procedure setWritableCell(wc: JCellValue); cdecl;
    procedure setReadComment(s: JString; w: Double; P3: Double); cdecl;
    procedure setValidationSettings(dvsr: JDataValiditySettingsRecord); cdecl;
    procedure setComment(s: JString); cdecl; overload;
    procedure setComment(s: JString; width: Double; P3: Double); cdecl; overload;
    procedure removeComment; cdecl;
    procedure removeDataValidation; cdecl;
    procedure setCommentDrawing(c: JComment); cdecl;
    function getCommentDrawing: JComment; cdecl;
    function getDataValidationList: JString; cdecl;
    procedure setDataValidationList(c: JCollection); cdecl;
    procedure setDataValidationRange(col1: Integer; r1: Integer; col2: Integer; r2: Integer); cdecl; overload;
    procedure setDataValidationRange(namedRange: JString); cdecl; overload;
    procedure setNumberValidation(val: Double; P2: JBaseCellFeatures_ValidationCondition); cdecl; overload;
    procedure setNumberValidation(val1: Double; P2: Double; val2: JBaseCellFeatures_ValidationCondition); cdecl; overload;
    function hasDataValidation: Boolean; cdecl;
    function hasDropDown: Boolean; cdecl;
    procedure setComboBox(cb: JComboBox); cdecl;
    function getDVParser: JDVParser; cdecl;

    { Property }
  end;

  TJBaseCellFeatures = class(TJavaGenericImport<JBaseCellFeaturesClass, JBaseCellFeatures>) end;

  JBaseCompoundFile_PropertyStorageClass = interface(JObjectClass)
  ['{168B0420-A39F-4A32-AA33-4259304693F0}']
    { static Property Methods }

    { static Methods }
    {class} function init(this$0: JBaseCompoundFile; d: TJavaArray<Byte>): JBaseCompoundFile_PropertyStorage; cdecl; overload;
    {class} function init(this$0: JBaseCompoundFile; name: JString): JBaseCompoundFile_PropertyStorage; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/BaseCompoundFile$PropertyStorage')]
  JBaseCompoundFile_PropertyStorage = interface(JObject)
  ['{3311F0EA-4F67-4004-BD9A-F55E97A3C12E}']
    { Property Methods }
    function _Getname: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setname(aname: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gettype: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Settype(atype: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getcolour: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcolour(acolour: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstartBlock: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstartBlock(astartBlock: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getsize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setsize(asize: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getprevious: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setprevious(aprevious: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getnext: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setnext(anext: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getchild: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setchild(achild: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getdata: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setdata(adata: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure setType(t: Integer); cdecl;
    procedure setStartBlock(sb: Integer); cdecl;
    procedure setSize(s: Integer); cdecl;
    procedure setPrevious(prev: Integer); cdecl;
    procedure setNext(nxt: Integer); cdecl;
    procedure setChild(dir: Integer); cdecl;
    procedure setColour(col: Integer); cdecl;

    { Property }
    property name: JString read _Getname write _Setname;
    property &type: Integer read _Gettype write _Settype;
    property colour: Integer read _Getcolour write _Setcolour;
    property startBlock: Integer read _GetstartBlock write _SetstartBlock;
    property size: Integer read _Getsize write _Setsize;
    property previous: Integer read _Getprevious write _Setprevious;
    property next: Integer read _Getnext write _Setnext;
    property child: Integer read _Getchild write _Setchild;
    property data: TJavaArray<Byte> read _Getdata write _Setdata;
  end;

  TJBaseCompoundFile_PropertyStorage = class(TJavaGenericImport<JBaseCompoundFile_PropertyStorageClass, JBaseCompoundFile_PropertyStorage>) end;

  JBaseCompoundFileClass = interface(JObjectClass)
  ['{D37D554E-52CD-4BEB-8D9F-56782E890E7B}']
    { static Property Methods }
    {class} function _GetROOT_ENTRY_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWORKBOOK_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUMMARY_INFORMATION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOCUMENT_SUMMARY_INFORMATION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOMP_OBJ_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTANDARD_PROPERTY_SETS: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNONE_PS_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDIRECTORY_PS_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFILE_PS_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetROOT_ENTRY_PS_TYPE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property ROOT_ENTRY_NAME: JString read _GetROOT_ENTRY_NAME;
    {class} property WORKBOOK_NAME: JString read _GetWORKBOOK_NAME;
    {class} property SUMMARY_INFORMATION_NAME: JString read _GetSUMMARY_INFORMATION_NAME;
    {class} property DOCUMENT_SUMMARY_INFORMATION_NAME: JString read _GetDOCUMENT_SUMMARY_INFORMATION_NAME;
    {class} property COMP_OBJ_NAME: JString read _GetCOMP_OBJ_NAME;
    {class} property STANDARD_PROPERTY_SETS: TJavaObjectArray<JString> read _GetSTANDARD_PROPERTY_SETS;
    {class} property NONE_PS_TYPE: Integer read _GetNONE_PS_TYPE;
    {class} property DIRECTORY_PS_TYPE: Integer read _GetDIRECTORY_PS_TYPE;
    {class} property FILE_PS_TYPE: Integer read _GetFILE_PS_TYPE;
    {class} property ROOT_ENTRY_PS_TYPE: Integer read _GetROOT_ENTRY_PS_TYPE;
  end;

  [JavaSignature('jxl/biff/BaseCompoundFile')]
  JBaseCompoundFile = interface(JObject)
  ['{A042C9E8-8D7E-40D8-839D-F938A8813F70}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaseCompoundFile = class(TJavaGenericImport<JBaseCompoundFileClass, JBaseCompoundFile>) end;

  JBuiltInFormatClass = interface(JObjectClass)
  ['{A4C19192-0ABA-4C1E-9C13-8C006D7168C6}']
    { static Property Methods }
    {class} function _GetbuiltIns: TJavaObjectArray<JBuiltInFormat>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property builtIns: TJavaObjectArray<JBuiltInFormat> read _GetbuiltIns;
  end;

  [JavaSignature('jxl/biff/BuiltInFormat')]
  JBuiltInFormat = interface(JObject)
  ['{1DFEA2E8-D3DC-41C1-B836-3951FDF3D63A}']
    { Property Methods }

    { methods }
    function getFormatString: JString; cdecl;
    function getFormatIndex: Integer; cdecl;
    function isInitialized: Boolean; cdecl;
    procedure initialize(pos: Integer); cdecl;
    function isBuiltIn: Boolean; cdecl;
    function equals(o: JObject): Boolean; cdecl;

    { Property }
  end;

  TJBuiltInFormat = class(TJavaGenericImport<JBuiltInFormatClass, JBuiltInFormat>) end;

  JBuiltInNameClass = interface(JObjectClass)
  ['{05A76B4E-7B81-40D9-A4D2-9F2537A11821}']
    { static Property Methods }
    {class} function _GetCONSOLIDATE_AREA: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTO_OPEN: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTO_CLOSE: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXTRACT: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATABASE: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCRITERIA: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_AREA: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINT_TITLES: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRECORDER: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_FORM: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTO_ACTIVATE: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTO_DEACTIVATE: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSHEET_TITLE: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFILTER_DATABASE: JBuiltInName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getBuiltInName(val: Integer): JBuiltInName; cdecl;

    { static Property }
    {class} property CONSOLIDATE_AREA: JBuiltInName read _GetCONSOLIDATE_AREA;
    {class} property AUTO_OPEN: JBuiltInName read _GetAUTO_OPEN;
    {class} property AUTO_CLOSE: JBuiltInName read _GetAUTO_CLOSE;
    {class} property EXTRACT: JBuiltInName read _GetEXTRACT;
    {class} property DATABASE: JBuiltInName read _GetDATABASE;
    {class} property CRITERIA: JBuiltInName read _GetCRITERIA;
    {class} property PRINT_AREA: JBuiltInName read _GetPRINT_AREA;
    {class} property PRINT_TITLES: JBuiltInName read _GetPRINT_TITLES;
    {class} property RECORDER: JBuiltInName read _GetRECORDER;
    {class} property DATA_FORM: JBuiltInName read _GetDATA_FORM;
    {class} property AUTO_ACTIVATE: JBuiltInName read _GetAUTO_ACTIVATE;
    {class} property AUTO_DEACTIVATE: JBuiltInName read _GetAUTO_DEACTIVATE;
    {class} property SHEET_TITLE: JBuiltInName read _GetSHEET_TITLE;
    {class} property FILTER_DATABASE: JBuiltInName read _GetFILTER_DATABASE;
  end;

  [JavaSignature('jxl/biff/BuiltInName')]
  JBuiltInName = interface(JObject)
  ['{0B0FC2C8-5849-4A76-93A0-C9AE64FDB111}']
    { Property Methods }

    { methods }
    function getName: JString; cdecl;
    function getValue: Integer; cdecl;

    { Property }
  end;

  TJBuiltInName = class(TJavaGenericImport<JBuiltInNameClass, JBuiltInName>) end;

  JBuiltInStyleClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{4EB75D88-85D2-4232-9B31-95293304D768}']
    { static Property Methods }

    { static Methods }
    {class} function init(xfind: Integer; sn: Integer): JBuiltInStyle; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/BuiltInStyle')]
  JBuiltInStyle = interface(JWritableRecordData) // or JObject
  ['{1CBF1A22-0BCB-4687-882E-D00EC43A36A8}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJBuiltInStyle = class(TJavaGenericImport<JBuiltInStyleClass, JBuiltInStyle>) end;

  JByteArrayClass = interface(JObjectClass)
  ['{5B2B7311-1AEB-4024-B045-A835E80366F1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteArray; cdecl; overload;
    {class} function init(gs: Integer): JByteArray; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/ByteArray')]
  JByteArray = interface(JObject)
  ['{100ECB78-B720-43C3-88E1-BA2765CCA4EF}']
    { Property Methods }

    { methods }
    procedure add(b: Byte); cdecl; overload;
    procedure add(b: TJavaArray<Byte>); cdecl; overload;
    function getBytes: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJByteArray = class(TJavaGenericImport<JByteArrayClass, JByteArray>) end;

  JByteDataClass = interface(JObjectClass)
  ['{59632276-A636-4E7A-BB38-3E07131E3CFD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/ByteData')]
  JByteData = interface(IJavaInstance)
  ['{E617A547-DB80-4C5A-AC70-A9F3682A7FB3}']
    { Property Methods }

    { methods }
    function getBytes: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJByteData = class(TJavaGenericImport<JByteDataClass, JByteData>) end;

  JCellReferenceHelperClass = interface(JObjectClass)
  ['{F37E1E1E-5E96-4B9A-A707-020E2ABA1C35}']
    { static Property Methods }

    { static Methods }
    {class} procedure getCellReference(column: Integer; row: Integer; buf: JStringBuffer); cdecl; overload;
    {class} procedure getCellReference(column: Integer; colabs: Boolean; row: Integer; rowabs: Boolean; buf: JStringBuffer); cdecl; overload;
    {class} function getColumnReference(column: Integer): JString; cdecl; overload;
    {class} procedure getColumnReference(column: Integer; buf: JStringBuffer); cdecl; overload;
    {class} procedure getCellReference(sheet: Integer; column: Integer; row: Integer; workbook: JExternalSheet; buf: JStringBuffer); cdecl; overload;
    {class} procedure getCellReference(sheet: Integer; column: Integer; colabs: Boolean; row: Integer; rowabs: Boolean; workbook: JExternalSheet; buf: JStringBuffer); cdecl; overload;
    {class} function getCellReference(sheet: Integer; column: Integer; row: Integer; workbook: JExternalSheet): JString; cdecl; overload;
    {class} function getCellReference(column: Integer; row: Integer): JString; cdecl; overload;
    {class} function getColumn(s: JString): Integer; cdecl;
    {class} function getRow(s: JString): Integer; cdecl;
    {class} function isColumnRelative(s: JString): Boolean; cdecl;
    {class} function isRowRelative(s: JString): Boolean; cdecl;
    {class} function getSheet(ref: JString): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/CellReferenceHelper')]
  JCellReferenceHelper = interface(JObject)
  ['{12D23140-2A07-4455-A32E-F268947ED0FF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCellReferenceHelper = class(TJavaGenericImport<JCellReferenceHelperClass, JCellReferenceHelper>) end;

  JConditionalFormatClass = interface(JObjectClass)
  ['{3CF0535E-312E-494E-BF8A-286B682B80F4}']
    { static Property Methods }

    { static Methods }
    {class} function init(cfrr: JConditionalFormatRangeRecord): JConditionalFormat; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/ConditionalFormat')]
  JConditionalFormat = interface(JObject)
  ['{B81E080E-6A58-4296-BE2D-7CABA0A3E032}']
    { Property Methods }

    { methods }
    procedure addCondition(cond: JConditionalFormatRecord); cdecl;
    procedure insertColumn(col: Integer); cdecl;
    procedure removeColumn(col: Integer); cdecl;
    procedure removeRow(row: Integer); cdecl;
    procedure insertRow(row: Integer); cdecl;
    procedure write(outputFile: JFile); cdecl;

    { Property }
  end;

  TJConditionalFormat = class(TJavaGenericImport<JConditionalFormatClass, JConditionalFormat>) end;

  JConditionalFormatRangeRecord_RangeClass = interface(JObjectClass)
  ['{5E48B570-D8A6-493B-87B2-B1BD771BA4F0}']
    { static Property Methods }

    { static Methods }
    {class} function init: JConditionalFormatRangeRecord_Range; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/ConditionalFormatRangeRecord$Range')]
  JConditionalFormatRangeRecord_Range = interface(JObject)
  ['{7720F5E5-4E0A-4829-B524-B20AA0C4BF04}']
    { Property Methods }
    function _GetfirstRow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetfirstRow(afirstRow: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetfirstColumn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetfirstColumn(afirstColumn: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlastRow: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlastRow(alastRow: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetlastColumn: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetlastColumn(alastColumn: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getmodified: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setmodified(amodified: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure insertColumn(col: Integer); cdecl;
    procedure removeColumn(col: Integer); cdecl;
    procedure removeRow(row: Integer); cdecl;
    procedure insertRow(row: Integer); cdecl;

    { Property }
    property firstRow: Integer read _GetfirstRow write _SetfirstRow;
    property firstColumn: Integer read _GetfirstColumn write _SetfirstColumn;
    property lastRow: Integer read _GetlastRow write _SetlastRow;
    property lastColumn: Integer read _GetlastColumn write _SetlastColumn;
    property modified: Boolean read _Getmodified write _Setmodified;
  end;

  TJConditionalFormatRangeRecord_Range = class(TJavaGenericImport<JConditionalFormatRangeRecord_RangeClass, JConditionalFormatRangeRecord_Range>) end;

  JConditionalFormatRangeRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{375282EC-ED4D-40DD-AB0D-184C4B2EBBF9}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JConditionalFormatRangeRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/ConditionalFormatRangeRecord')]
  JConditionalFormatRangeRecord = interface(JWritableRecordData) // or JObject
  ['{1AB9DF95-F97C-4AA3-AF8F-1D1A515DBF85}']
    { Property Methods }

    { methods }
    procedure insertColumn(col: Integer); cdecl;
    procedure removeColumn(col: Integer); cdecl;
    procedure removeRow(row: Integer); cdecl;
    procedure insertRow(row: Integer); cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJConditionalFormatRangeRecord = class(TJavaGenericImport<JConditionalFormatRangeRecordClass, JConditionalFormatRangeRecord>) end;

  JConditionalFormatRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{03C7A90E-FFA1-42D8-83A8-F3333417023B}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JConditionalFormatRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/ConditionalFormatRecord')]
  JConditionalFormatRecord = interface(JWritableRecordData) // or JObject
  ['{350A7260-CA58-4458-BCF0-4F3F71FD68FD}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJConditionalFormatRecord = class(TJavaGenericImport<JConditionalFormatRecordClass, JConditionalFormatRecord>) end;

  JContinueRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{F731A7A6-2EB6-4D11-B196-8F4FB46BF921}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JContinueRecord; cdecl; overload;
    {class} function init(d: TJavaArray<Byte>): JContinueRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/ContinueRecord')]
  JContinueRecord = interface(JWritableRecordData) // or JObject
  ['{AB82D69E-0269-4DD8-AEA2-8228E3FB9F98}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getRecord: JRecord; cdecl;

    { Property }
  end;

  TJContinueRecord = class(TJavaGenericImport<JContinueRecordClass, JContinueRecord>) end;

  JCountryCodeClass = interface(JObjectClass)
  ['{28F38252-EF56-448C-AC4C-115E760812C6}']
    { static Property Methods }
    {class} function _GetUSA: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCANADA: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREECE: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNETHERLANDS: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBELGIUM: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRANCE: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSPAIN: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetITALY: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSWITZERLAND: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUK: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDENMARK: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSWEDEN: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNORWAY: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGERMANY: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHILIPPINES: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHINA: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDIA: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JCountryCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getCountryCode(s: JString): JCountryCode; cdecl;
    {class} function createArbitraryCode(i: Integer): JCountryCode; cdecl;

    { static Property }
    {class} property USA: JCountryCode read _GetUSA;
    {class} property CANADA: JCountryCode read _GetCANADA;
    {class} property GREECE: JCountryCode read _GetGREECE;
    {class} property NETHERLANDS: JCountryCode read _GetNETHERLANDS;
    {class} property BELGIUM: JCountryCode read _GetBELGIUM;
    {class} property FRANCE: JCountryCode read _GetFRANCE;
    {class} property SPAIN: JCountryCode read _GetSPAIN;
    {class} property ITALY: JCountryCode read _GetITALY;
    {class} property SWITZERLAND: JCountryCode read _GetSWITZERLAND;
    {class} property UK: JCountryCode read _GetUK;
    {class} property DENMARK: JCountryCode read _GetDENMARK;
    {class} property SWEDEN: JCountryCode read _GetSWEDEN;
    {class} property NORWAY: JCountryCode read _GetNORWAY;
    {class} property GERMANY: JCountryCode read _GetGERMANY;
    {class} property PHILIPPINES: JCountryCode read _GetPHILIPPINES;
    {class} property CHINA: JCountryCode read _GetCHINA;
    {class} property INDIA: JCountryCode read _GetINDIA;
    {class} property UNKNOWN: JCountryCode read _GetUNKNOWN;
  end;

  [JavaSignature('jxl/biff/CountryCode')]
  JCountryCode = interface(JObject)
  ['{28E21685-CBF5-42D5-9AC1-370C688827AF}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getCode: JString; cdecl;

    { Property }
  end;

  TJCountryCode = class(TJavaGenericImport<JCountryCodeClass, JCountryCode>) end;

  JDataValidationClass = interface(JObjectClass)
  ['{41FB5423-D34D-401A-9DA6-AD564AE37571}']
    { static Property Methods }
    {class} function _GetDEFAULT_OBJECT_ID: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(dvlr: JDataValidityListRecord): JDataValidation; cdecl; overload;
    {class} function init(objId: Integer; es: JExternalSheet; wm: JWorkbookMethods; ws: JWorkbookSettings): JDataValidation; cdecl; overload;
    {class} function init(dv: JDataValidation; es: JExternalSheet; wm: JWorkbookMethods; ws: JWorkbookSettings): JDataValidation; cdecl; overload;

    { static Property }
    {class} property DEFAULT_OBJECT_ID: Integer read _GetDEFAULT_OBJECT_ID;
  end;

  [JavaSignature('jxl/biff/DataValidation')]
  JDataValidation = interface(JObject)
  ['{25E7BD63-50CE-4A08-8378-68F500021DE4}']
    { Property Methods }

    { methods }
    procedure add(dvsr: JDataValiditySettingsRecord); cdecl;
    function getDataValidityList: JDataValidityListRecord; cdecl;
    function getDataValiditySettings: TJavaObjectArray<JDataValiditySettingsRecord>; cdecl; overload;
    procedure write(outputFile: JFile); cdecl;
    procedure insertRow(row: Integer); cdecl;
    procedure removeRow(row: Integer); cdecl;
    procedure insertColumn(col: Integer); cdecl;
    procedure removeColumn(col: Integer); cdecl;
    procedure removeDataValidation(col: Integer; row: Integer); cdecl;
    function getDataValiditySettings(col: Integer; row: Integer): JDataValiditySettingsRecord; cdecl; overload;
    function getComboBoxObjectId: Integer; cdecl;

    { Property }
  end;

  TJDataValidation = class(TJavaGenericImport<JDataValidationClass, JDataValidation>) end;

  JDataValidityListRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{0EEBFAB0-DBA4-4A81-8741-25E346271D88}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JDataValidityListRecord; cdecl; overload;
    {class} function init(dval: JDValParser): JDataValidityListRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/DataValidityListRecord')]
  JDataValidityListRecord = interface(JWritableRecordData) // or JObject
  ['{23EBC108-5399-432D-8D50-6FAA440FCE79}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function hasDVRecords: Boolean; cdecl;
    function getObjectId: Integer; cdecl;

    { Property }
  end;

  TJDataValidityListRecord = class(TJavaGenericImport<JDataValidityListRecordClass, JDataValidityListRecord>) end;

  JDataValiditySettingsRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{C22E6625-6BAB-421C-AC86-1A4E9AB242EB}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; es: JExternalSheet; wm: JWorkbookMethods; ws: JWorkbookSettings): JDataValiditySettingsRecord; cdecl; overload;
    {class} function init(dvp: JDVParser): JDataValiditySettingsRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/DataValiditySettingsRecord')]
  JDataValiditySettingsRecord = interface(JWritableRecordData) // or JObject
  ['{384D9DE3-A687-4E26-A271-2D560E3C0AFC}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    procedure insertRow(row: Integer); cdecl;
    procedure removeRow(row: Integer); cdecl;
    procedure insertColumn(col: Integer); cdecl;
    procedure removeColumn(col: Integer); cdecl;
    function getFirstColumn: Integer; cdecl;
    function getLastColumn: Integer; cdecl;
    function getFirstRow: Integer; cdecl;
    function getLastRow: Integer; cdecl;
    function getValidationFormula: JString; cdecl;

    { Property }
  end;

  TJDataValiditySettingsRecord = class(TJavaGenericImport<JDataValiditySettingsRecordClass, JDataValiditySettingsRecord>) end;

  JDisplayFormatClass = interface(JObjectClass)
  ['{6404E711-FF53-46DF-AA44-3ADB9C3DFA6A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/DisplayFormat')]
  JDisplayFormat = interface(IJavaInstance)
  ['{A18EA32B-D414-446E-836C-399850011325}']
    { Property Methods }

    { methods }
    function getFormatIndex: Integer; cdecl;
    function isInitialized: Boolean; cdecl;
    procedure initialize(P1: Integer); cdecl;
    function isBuiltIn: Boolean; cdecl;

    { Property }
  end;

  TJDisplayFormat = class(TJavaGenericImport<JDisplayFormatClass, JDisplayFormat>) end;

  JDoubleHelperClass = interface(JObjectClass)
  ['{8A700458-F4A1-4D7B-AFC6-C51691617280}']
    { static Property Methods }

    { static Methods }
    {class} function getIEEEDouble(data: TJavaArray<Byte>; pos: Integer): Double; cdecl;
    {class} procedure getIEEEBytes(d: Double; target: TJavaArray<Byte>; P3: Integer); cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/DoubleHelper')]
  JDoubleHelper = interface(JObject)
  ['{6F26698F-1912-420D-A551-4BFF89874DCD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDoubleHelper = class(TJavaGenericImport<JDoubleHelperClass, JDoubleHelper>) end;

  JBlipStoreEntryClass = interface(JEscherAtomClass) // or JObjectClass
  ['{BEE3B6E0-A403-4E70-B30D-4C8CAD972192}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JBlipStoreEntry; cdecl; overload;
    {class} function init(d: JDrawing): JBlipStoreEntry; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/BlipStoreEntry')]
  JBlipStoreEntry = interface(JEscherAtom) // or JObject
  ['{1A5284E5-5B01-46E4-AA20-B3EA7ECE4115}']
    { Property Methods }

    { methods }
    function getBlipType: JBlipType; cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJBlipStoreEntry = class(TJavaGenericImport<JBlipStoreEntryClass, JBlipStoreEntry>) end;

  JBlipTypeClass = interface(JObjectClass)
  ['{7A6A3F6C-4179-4CE3-93F4-603E9C0C5FE8}']
    { static Property Methods }
    {class} function _GetERROR: JBlipType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JBlipType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEMF: JBlipType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWMF: JBlipType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPICT: JBlipType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJPEG: JBlipType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPNG: JBlipType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDIB: JBlipType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFIRST_CLIENT: JBlipType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLAST_CLIENT: JBlipType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getType(val: Integer): JBlipType; cdecl;

    { static Property }
    {class} property ERROR: JBlipType read _GetERROR;
    {class} property UNKNOWN: JBlipType read _GetUNKNOWN;
    {class} property EMF: JBlipType read _GetEMF;
    {class} property WMF: JBlipType read _GetWMF;
    {class} property PICT: JBlipType read _GetPICT;
    {class} property JPEG: JBlipType read _GetJPEG;
    {class} property PNG: JBlipType read _GetPNG;
    {class} property DIB: JBlipType read _GetDIB;
    {class} property FIRST_CLIENT: JBlipType read _GetFIRST_CLIENT;
    {class} property LAST_CLIENT: JBlipType read _GetLAST_CLIENT;
  end;

  [JavaSignature('jxl/biff/drawing/BlipType')]
  JBlipType = interface(JObject)
  ['{7F616BE8-8055-455A-A816-E35E3654C170}']
    { Property Methods }

    { methods }
    function getDescription: JString; cdecl;
    function getValue: Integer; cdecl;

    { Property }
  end;

  TJBlipType = class(TJavaGenericImport<JBlipTypeClass, JBlipType>) end;

  JBStoreContainerClass = interface(JEscherContainerClass) // or JObjectClass
  ['{69F02689-C1B3-4355-B5AF-DB26006D274C}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JBStoreContainer; cdecl; overload;
    {class} function init: JBStoreContainer; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/BStoreContainer')]
  JBStoreContainer = interface(JEscherContainer) // or JObject
  ['{169AB603-2978-4AA9-9C15-66015F0126ED}']
    { Property Methods }

    { methods }
    function getNumBlips: Integer; cdecl;
    function getDrawing(i: Integer): JBlipStoreEntry; cdecl;

    { Property }
  end;

  TJBStoreContainer = class(TJavaGenericImport<JBStoreContainerClass, JBStoreContainer>) end;

  JButtonClass = interface(JObjectClass)
  ['{30ED6834-2600-4489-8554-762A752F54C0}']
    { static Property Methods }

    { static Methods }
    {class} function init(msodr: JMsoDrawingRecord; obj: JObjRecord; dd: JDrawingData; dg: JDrawingGroup; ws: JWorkbookSettings): JButton; cdecl; overload;
    {class} function init(dgo: JDrawingGroupObject; dg: JDrawingGroup; ws: JWorkbookSettings): JButton; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Button')]
  JButton = interface(JObject)
  ['{2F238F93-3432-4D80-B21C-2B019CDF78C0}']
    { Property Methods }

    { methods }
    procedure setObjectId(objid: Integer; bip: Integer; sid: Integer); cdecl;
    function getObjectId: Integer; cdecl;
    function getShapeId: Integer; cdecl;
    function getBlipId: Integer; cdecl;
    function getMsoDrawingRecord: JMsoDrawingRecord; cdecl;
    function getSpContainer: JEscherContainer; cdecl;
    procedure setDrawingGroup(dg: JDrawingGroup); cdecl;
    function getDrawingGroup: JDrawingGroup; cdecl;
    function getOrigin: JOrigin; cdecl;
    function getReferenceCount: Integer; cdecl;
    procedure setReferenceCount(r: Integer); cdecl;
    function getX: Double; cdecl;
    procedure setX(x: Double); cdecl;
    function getY: Double; cdecl;
    procedure setY(y: Double); cdecl;
    function getWidth: Double; cdecl;
    procedure setWidth(w: Double); cdecl;
    function getHeight: Double; cdecl;
    procedure setHeight(h: Double); cdecl;
    function getImageData: TJavaArray<Byte>; cdecl;
    function getType: JShapeType; cdecl;
    procedure setTextObject(t: JTextObjectRecord); cdecl;
    procedure setText(t: JContinueRecord); cdecl;
    procedure setFormatting(t: JContinueRecord); cdecl;
    function getImageBytes: TJavaArray<Byte>; cdecl;
    function getImageFilePath: JString; cdecl;
    procedure addMso(d: JMsoDrawingRecord); cdecl;
    procedure writeAdditionalRecords(outputFile: JFile); cdecl;
    procedure writeTailRecords(outputFile: JFile); cdecl;
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getText: JString; cdecl;
    function hashCode: Integer; cdecl;
    procedure setButtonText(t: JString); cdecl;
    function isFirst: Boolean; cdecl;
    function isFormObject: Boolean; cdecl;

    { Property }
  end;

  TJButton = class(TJavaGenericImport<JButtonClass, JButton>) end;

  JChartClass = interface(JObjectClass)
  ['{3E6C83DD-36E6-4108-991A-21A2C82A324B}']
    { static Property Methods }

    { static Methods }
    {class} function init(mso: JMsoDrawingRecord; obj: JObjRecord; dd: JDrawingData; sp: Integer; ep: Integer; f: JFile; ws: JWorkbookSettings): JChart; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Chart')]
  JChart = interface(JObject)
  ['{C78E56D2-F36F-4597-B334-832ED9BE755F}']
    { Property Methods }

    { methods }
    function getBytes: TJavaArray<Byte>; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    procedure rationalize(xfMapping: JIndexMapping; fontMapping: JIndexMapping; formatMapping: JIndexMapping); cdecl;

    { Property }
  end;

  TJChart = class(TJavaGenericImport<JChartClass, JChart>) end;

  JChunkClass = interface(JObjectClass)
  ['{BB68B5D2-4504-43D3-8017-4EFB109BD6A1}']
    { static Property Methods }

    { static Methods }
    {class} function init(p: Integer; l: Integer; ct: JChunkType; d: TJavaArray<Byte>): JChunk; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Chunk')]
  JChunk = interface(JObject)
  ['{D01CE71F-74FD-4F08-A61F-FF9BD5DC4B11}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJChunk = class(TJavaGenericImport<JChunkClass, JChunk>) end;

  JChunkTypeClass = interface(JObjectClass)
  ['{9D9EFFF9-62C2-45A5-B33A-1838ABF5FF6D}']
    { static Property Methods }
    {class} function _GetIHDR: JChunkType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIEND: JChunkType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPHYS: JChunkType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JChunkType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getChunkType(d1: Byte; d2: Byte; d3: Byte; d4: Byte): JChunkType; cdecl;

    { static Property }
    {class} property IHDR: JChunkType read _GetIHDR;
    {class} property IEND: JChunkType read _GetIEND;
    {class} property PHYS: JChunkType read _GetPHYS;
    {class} property UNKNOWN: JChunkType read _GetUNKNOWN;
  end;

  [JavaSignature('jxl/biff/drawing/ChunkType')]
  JChunkType = interface(JObject)
  ['{8B778E50-0362-420D-9D0F-CDC7791B71F8}']
    { Property Methods }

    { methods }
    function getName: JString; cdecl;

    { Property }
  end;

  TJChunkType = class(TJavaGenericImport<JChunkTypeClass, JChunkType>) end;

  JClientAnchorClass = interface(JEscherAtomClass) // or JObjectClass
  ['{E8A9334D-8FCC-4FF6-A779-CF3DE7635025}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JClientAnchor; cdecl; overload;
    {class} function init(x1: Double; P2: Double; y1: Double; x2: Double; P5: Integer): JClientAnchor; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/ClientAnchor')]
  JClientAnchor = interface(JEscherAtom) // or JObject
  ['{A895E6DB-3DE3-4359-8DF6-951175CDE5D9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJClientAnchor = class(TJavaGenericImport<JClientAnchorClass, JClientAnchor>) end;

  JClientDataClass = interface(JEscherAtomClass) // or JObjectClass
  ['{3DE7D733-2254-46FE-8165-A0D4F42CCD66}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JClientData; cdecl; overload;
    {class} function init: JClientData; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/ClientData')]
  JClientData = interface(JEscherAtom) // or JObject
  ['{0FF18820-8F67-4DE7-ABFA-40DA44DF32CD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJClientData = class(TJavaGenericImport<JClientDataClass, JClientData>) end;

  JClientTextBoxClass = interface(JEscherAtomClass) // or JObjectClass
  ['{2678DE00-EC20-4608-9E83-1C6DBB9AB11F}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JClientTextBox; cdecl; overload;
    {class} function init: JClientTextBox; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/ClientTextBox')]
  JClientTextBox = interface(JEscherAtom) // or JObject
  ['{F9336838-C681-447B-AF6C-B91DC25E0BE2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJClientTextBox = class(TJavaGenericImport<JClientTextBoxClass, JClientTextBox>) end;

  JComboBoxClass = interface(JObjectClass)
  ['{7B0D1C9A-8FC7-4574-98A0-2D33D33B05D7}']
    { static Property Methods }

    { static Methods }
    {class} function init(mso: JMsoDrawingRecord; obj: JObjRecord; dd: JDrawingData; dg: JDrawingGroup; ws: JWorkbookSettings): JComboBox; cdecl; overload;
    {class} function init(dgo: JDrawingGroupObject; dg: JDrawingGroup; ws: JWorkbookSettings): JComboBox; cdecl; overload;
    {class} function init: JComboBox; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/ComboBox')]
  JComboBox = interface(JObject)
  ['{983F5F19-A9DF-427F-BADE-39CBFA368242}']
    { Property Methods }

    { methods }
    procedure setObjectId(objid: Integer; bip: Integer; sid: Integer); cdecl;
    function getObjectId: Integer; cdecl;
    function getShapeId: Integer; cdecl;
    function getBlipId: Integer; cdecl;
    function getMsoDrawingRecord: JMsoDrawingRecord; cdecl;
    function getSpContainer: JEscherContainer; cdecl;
    procedure setDrawingGroup(dg: JDrawingGroup); cdecl;
    function getDrawingGroup: JDrawingGroup; cdecl;
    function getOrigin: JOrigin; cdecl;
    function getReferenceCount: Integer; cdecl;
    procedure setReferenceCount(r: Integer); cdecl;
    function getX: Double; cdecl;
    procedure setX(x: Double); cdecl;
    function getY: Double; cdecl;
    procedure setY(y: Double); cdecl;
    function getWidth: Double; cdecl;
    procedure setWidth(w: Double); cdecl;
    function getHeight: Double; cdecl;
    procedure setHeight(h: Double); cdecl;
    function getImageData: TJavaArray<Byte>; cdecl;
    function getType: JShapeType; cdecl;
    function getImageBytes: TJavaArray<Byte>; cdecl;
    function getImageFilePath: JString; cdecl;
    procedure writeAdditionalRecords(outputFile: JFile); cdecl;
    procedure writeTailRecords(outputFile: JFile); cdecl;
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function hashCode: Integer; cdecl;
    function isFirst: Boolean; cdecl;
    function isFormObject: Boolean; cdecl;

    { Property }
  end;

  TJComboBox = class(TJavaGenericImport<JComboBoxClass, JComboBox>) end;

  JCommentClass = interface(JObjectClass)
  ['{A1C04F0C-7E85-429E-A154-C4BA90D612E3}']
    { static Property Methods }

    { static Methods }
    {class} function init(msorec: JMsoDrawingRecord; obj: JObjRecord; dd: JDrawingData; dg: JDrawingGroup; ws: JWorkbookSettings): JComment; cdecl; overload;
    {class} function init(dgo: JDrawingGroupObject; dg: JDrawingGroup; ws: JWorkbookSettings): JComment; cdecl; overload;
    {class} function init(txt: JString; c: Integer; r: Integer): JComment; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Comment')]
  JComment = interface(JObject)
  ['{D0FBBCE5-3D75-4BE6-9B34-B74FB5E70E6A}']
    { Property Methods }

    { methods }
    procedure setObjectId(objid: Integer; bip: Integer; sid: Integer); cdecl;
    function getObjectId: Integer; cdecl;
    function getShapeId: Integer; cdecl;
    function getBlipId: Integer; cdecl;
    function getMsoDrawingRecord: JMsoDrawingRecord; cdecl;
    function getSpContainer: JEscherContainer; cdecl;
    procedure setDrawingGroup(dg: JDrawingGroup); cdecl;
    function getDrawingGroup: JDrawingGroup; cdecl;
    function getOrigin: JOrigin; cdecl;
    function getReferenceCount: Integer; cdecl;
    procedure setReferenceCount(r: Integer); cdecl;
    function getX: Double; cdecl;
    procedure setX(x: Double); cdecl;
    function getY: Double; cdecl;
    procedure setY(y: Double); cdecl;
    function getWidth: Double; cdecl;
    procedure setWidth(w: Double); cdecl;
    function getHeight: Double; cdecl;
    procedure setHeight(h: Double); cdecl;
    function getImageData: TJavaArray<Byte>; cdecl;
    function getType: JShapeType; cdecl;
    procedure setTextObject(t: JTextObjectRecord); cdecl;
    procedure setNote(t: JNoteRecord); cdecl;
    procedure setText(t: JContinueRecord); cdecl;
    procedure setFormatting(t: JContinueRecord); cdecl;
    function getImageBytes: TJavaArray<Byte>; cdecl;
    function getImageFilePath: JString; cdecl;
    procedure addMso(d: JMsoDrawingRecord); cdecl;
    procedure writeAdditionalRecords(outputFile: JFile); cdecl;
    procedure writeTailRecords(outputFile: JFile); cdecl;
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getText: JString; cdecl;
    function hashCode: Integer; cdecl;
    procedure setCommentText(t: JString); cdecl;
    function isFirst: Boolean; cdecl;
    function isFormObject: Boolean; cdecl;

    { Property }
  end;

  TJComment = class(TJavaGenericImport<JCommentClass, JComment>) end;

  JDgClass = interface(JEscherAtomClass) // or JObjectClass
  ['{30920770-C2B5-427D-819B-A0E7D4D811A8}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JDg; cdecl; overload;
    {class} function init(numDrawings: Integer): JDg; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Dg')]
  JDg = interface(JEscherAtom) // or JObject
  ['{97749792-E04A-4ED0-BD81-47B3F46DC4F2}']
    { Property Methods }

    { methods }
    function getDrawingId: Integer; cdecl;

    { Property }
  end;

  TJDg = class(TJavaGenericImport<JDgClass, JDg>) end;

  JDgContainerClass = interface(JEscherContainerClass) // or JObjectClass
  ['{8D21343F-7A8D-412B-9E32-E8BB905ECF73}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDgContainer; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/DgContainer')]
  JDgContainer = interface(JEscherContainer) // or JObject
  ['{C7C2A784-F100-40BC-AFA7-2E83B36E70FF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDgContainer = class(TJavaGenericImport<JDgContainerClass, JDgContainer>) end;

  JDgg_ClusterClass = interface(JObjectClass)
  ['{FD2FB6CD-F60B-4B08-8A72-97D91B73D263}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Dgg$Cluster')]
  JDgg_Cluster = interface(JObject)
  ['{419CB671-1BDE-420F-A363-2CAEA3BB9D76}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDgg_Cluster = class(TJavaGenericImport<JDgg_ClusterClass, JDgg_Cluster>) end;

  JDggClass = interface(JEscherAtomClass) // or JObjectClass
  ['{70B8B548-1DD1-4E14-9FB6-A3878D5EF6A9}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JDgg; cdecl; overload;
    {class} function init(numShapes: Integer; numDrawings: Integer): JDgg; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Dgg')]
  JDgg = interface(JEscherAtom) // or JObject
  ['{7AD044AB-877A-4C60-941F-4B047C192928}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDgg = class(TJavaGenericImport<JDggClass, JDgg>) end;

  JDggContainerClass = interface(JEscherContainerClass) // or JObjectClass
  ['{B3F62D39-2F02-47C7-81EF-98048A60C4BA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDggContainer; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/DggContainer')]
  JDggContainer = interface(JEscherContainer) // or JObject
  ['{4C741DD7-AB44-4867-AA6D-31FB94AE59A8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDggContainer = class(TJavaGenericImport<JDggContainerClass, JDggContainer>) end;

  JDrawing_ImageAnchorPropertiesClass = interface(JObjectClass)
  ['{50A19AF0-B14C-4AA6-8A09-DDFAEB115487}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Drawing$ImageAnchorProperties')]
  JDrawing_ImageAnchorProperties = interface(JObject)
  ['{60A464B0-D868-4456-95B6-7882430EDCD7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDrawing_ImageAnchorProperties = class(TJavaGenericImport<JDrawing_ImageAnchorPropertiesClass, JDrawing_ImageAnchorProperties>) end;

  JDrawingClass = interface(JObjectClass)
  ['{273123AD-C1FE-421D-A275-B71846995789}']
    { static Property Methods }
    {class} function _GetMOVE_AND_SIZE_WITH_CELLS: JDrawing_ImageAnchorProperties;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOVE_WITH_CELLS: JDrawing_ImageAnchorProperties;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNO_MOVE_OR_SIZE_WITH_CELLS: JDrawing_ImageAnchorProperties;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(mso: JMsoDrawingRecord; obj: JObjRecord; dd: JDrawingData; dg: JDrawingGroup; s: JSheet): JDrawing; cdecl; overload;
    {class} function init(x: Double; P2: Double; y: Double; w: Double; P5: JFile): JDrawing; cdecl; overload;
    {class} function init(x: Double; P2: Double; y: Double; w: Double; P5: TJavaArray<Byte>): JDrawing; cdecl; overload;

    { static Property }
    {class} property MOVE_AND_SIZE_WITH_CELLS: JDrawing_ImageAnchorProperties read _GetMOVE_AND_SIZE_WITH_CELLS;
    {class} property MOVE_WITH_CELLS: JDrawing_ImageAnchorProperties read _GetMOVE_WITH_CELLS;
    {class} property NO_MOVE_OR_SIZE_WITH_CELLS: JDrawing_ImageAnchorProperties read _GetNO_MOVE_OR_SIZE_WITH_CELLS;
  end;

  [JavaSignature('jxl/biff/drawing/Drawing')]
  JDrawing = interface(JObject)
  ['{5C4B415D-9BBF-4518-927D-10889F109A46}']
    { Property Methods }

    { methods }
    function getImageFile: JFile; cdecl;
    function getImageFilePath: JString; cdecl;
    procedure setObjectId(objid: Integer; bip: Integer; sid: Integer); cdecl;
    function getObjectId: Integer; cdecl;
    function getShapeId: Integer; cdecl;
    function getBlipId: Integer; cdecl;
    function getMsoDrawingRecord: JMsoDrawingRecord; cdecl;
    function getSpContainer: JEscherContainer; cdecl;
    procedure setDrawingGroup(dg: JDrawingGroup); cdecl;
    function getDrawingGroup: JDrawingGroup; cdecl;
    function getOrigin: JOrigin; cdecl;
    function getReferenceCount: Integer; cdecl;
    procedure setReferenceCount(r: Integer); cdecl;
    function getX: Double; cdecl;
    procedure setX(x: Double); cdecl;
    function getY: Double; cdecl;
    procedure setY(y: Double); cdecl;
    function getWidth: Double; cdecl; overload;
    procedure setWidth(w: Double); cdecl;
    function getHeight: Double; cdecl; overload;
    procedure setHeight(h: Double); cdecl;
    function getImageData: TJavaArray<Byte>; cdecl;
    function getImageBytes: TJavaArray<Byte>; cdecl;
    function getType: JShapeType; cdecl;
    procedure writeAdditionalRecords(outputFile: JFile); cdecl;
    procedure writeTailRecords(outputFile: JFile); cdecl;
    function getColumn: Double; cdecl;
    function getRow: Double; cdecl;
    function isFirst: Boolean; cdecl;
    function isFormObject: Boolean; cdecl;
    procedure removeRow(r: Integer); cdecl;
    function getWidth(aunit: JLengthUnit): Double; cdecl; overload;
    function getHeight(aunit: JLengthUnit): Double; cdecl; overload;
    function getImageWidth: Integer; cdecl;
    function getImageHeight: Integer; cdecl;
    function getHorizontalResolution(aunit: JLengthUnit): Double; cdecl;
    function getVerticalResolution(aunit: JLengthUnit): Double; cdecl;

    { Property }
  end;

  TJDrawing = class(TJavaGenericImport<JDrawingClass, JDrawing>) end;

  JDrawing2Class = interface(JObjectClass)
  ['{07BD7EE4-B9E8-4B7F-BADE-2E930A326B49}']
    { static Property Methods }

    { static Methods }
    {class} function init(mso: JMsoDrawingRecord; dd: JDrawingData; dg: JDrawingGroup): JDrawing2; cdecl; overload;
    {class} function init(x: Double; P2: Double; y: Double; w: Double; P5: JFile): JDrawing2; cdecl; overload;
    {class} function init(x: Double; P2: Double; y: Double; w: Double; P5: TJavaArray<Byte>): JDrawing2; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Drawing2')]
  JDrawing2 = interface(JObject)
  ['{CE1E6BA7-8EB3-46C4-A901-5E77D42637A3}']
    { Property Methods }

    { methods }
    procedure setObjectId(objid: Integer; bip: Integer; sid: Integer); cdecl;
    function getObjectId: Integer; cdecl;
    function getShapeId: Integer; cdecl;
    function getBlipId: Integer; cdecl;
    function getMsoDrawingRecord: JMsoDrawingRecord; cdecl;
    function getSpContainer: JEscherContainer; cdecl;
    procedure setDrawingGroup(dg: JDrawingGroup); cdecl;
    function getDrawingGroup: JDrawingGroup; cdecl;
    function getOrigin: JOrigin; cdecl;
    function getReferenceCount: Integer; cdecl;
    procedure setReferenceCount(r: Integer); cdecl;
    function getX: Double; cdecl;
    procedure setX(x: Double); cdecl;
    function getY: Double; cdecl;
    procedure setY(y: Double); cdecl;
    function getWidth: Double; cdecl;
    procedure setWidth(w: Double); cdecl;
    function getHeight: Double; cdecl;
    procedure setHeight(h: Double); cdecl;
    function getImageData: TJavaArray<Byte>; cdecl;
    function getImageBytes: TJavaArray<Byte>; cdecl;
    function getType: JShapeType; cdecl;
    procedure writeAdditionalRecords(outputFile: JFile); cdecl;
    procedure writeTailRecords(outputFile: JFile); cdecl;
    function getColumn: Double; cdecl;
    function getRow: Double; cdecl;
    function isFirst: Boolean; cdecl;
    function isFormObject: Boolean; cdecl;
    procedure removeRow(r: Integer); cdecl;
    function getImageFilePath: JString; cdecl;

    { Property }
  end;

  TJDrawing2 = class(TJavaGenericImport<JDrawing2Class, JDrawing2>) end;

  JDrawingDataClass = interface(JObjectClass)
  ['{1FE06D70-79AA-4BB5-9D6E-83921EA16535}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDrawingData; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/DrawingData')]
  JDrawingData = interface(JObject)
  ['{0E2AC85E-8D36-456A-A1EF-8332380CFE31}']
    { Property Methods }

    { methods }
    procedure addData(data: TJavaArray<Byte>); cdecl;
    procedure addRawData(data: TJavaArray<Byte>); cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJDrawingData = class(TJavaGenericImport<JDrawingDataClass, JDrawingData>) end;

  JDrawingDataExceptionClass = interface(JRuntimeExceptionClass) // or JObjectClass
  ['{67516E76-AF2C-42B4-9636-792C9C978C01}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/DrawingDataException')]
  JDrawingDataException = interface(JRuntimeException) // or JObject
  ['{8A8DDC37-BE02-480F-8536-201E78CD961F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDrawingDataException = class(TJavaGenericImport<JDrawingDataExceptionClass, JDrawingDataException>) end;

  JDrawingGroupClass = interface(JObjectClass)
  ['{DEC9092E-922A-498A-AE2E-F11070B14C49}']
    { static Property Methods }

    { static Methods }
    {class} function init(o: JOrigin): JDrawingGroup; cdecl; overload;
    {class} function init(dg: JDrawingGroup): JDrawingGroup; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/DrawingGroup')]
  JDrawingGroup = interface(JObject)
  ['{020760D1-0D3B-41AD-958A-C091894C5CCD}']
    { Property Methods }

    { methods }
    procedure add(mso: JMsoDrawingGroupRecord); cdecl; overload;
    procedure add(cont: JRecord); cdecl; overload;
    procedure add(c: JChart); cdecl; overload;
    procedure add(d: JDrawingGroupObject); cdecl; overload;
    procedure remove(d: JDrawingGroupObject); cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    procedure write(outputFile: JFile); cdecl;
    procedure setDrawingsOmitted(mso: JMsoDrawingRecord; obj: JObjRecord); cdecl;
    function hasDrawingsOmitted: Boolean; cdecl;
    procedure updateData(dg: JDrawingGroup); cdecl;

    { Property }
  end;

  TJDrawingGroup = class(TJavaGenericImport<JDrawingGroupClass, JDrawingGroup>) end;

  JDrawingGroupObjectClass = interface(JObjectClass)
  ['{BF0AEF04-6FD3-469A-909D-6A986E5ADA18}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/DrawingGroupObject')]
  JDrawingGroupObject = interface(IJavaInstance)
  ['{F5DF5A3B-A83A-4C63-9892-1CFC7024865A}']
    { Property Methods }

    { methods }
    procedure setObjectId(P1: Integer; P2: Integer; P3: Integer); cdecl;
    function getObjectId: Integer; cdecl;
    function getBlipId: Integer; cdecl;
    function getShapeId: Integer; cdecl;
    function getMsoDrawingRecord: JMsoDrawingRecord; cdecl;
    function getSpContainer: JEscherContainer; cdecl;
    procedure setDrawingGroup(P1: JDrawingGroup); cdecl;
    function getDrawingGroup: JDrawingGroup; cdecl;
    function getOrigin: JOrigin; cdecl;
    function getReferenceCount: Integer; cdecl;
    procedure setReferenceCount(P1: Integer); cdecl;
    function getX: Double; cdecl;
    procedure setX(P1: Double); cdecl;
    function getY: Double; cdecl;
    procedure setY(P1: Double); cdecl;
    function getWidth: Double; cdecl;
    procedure setWidth(P1: Double); cdecl;
    function getHeight: Double; cdecl;
    procedure setHeight(P1: Double); cdecl;
    function getType: JShapeType; cdecl;
    function getImageData: TJavaArray<Byte>; cdecl;
    function getImageBytes: TJavaArray<Byte>; cdecl;
    function getImageFilePath: JString; cdecl;
    procedure writeAdditionalRecords(P1: JFile); cdecl;
    procedure writeTailRecords(P1: JFile); cdecl;
    function isFirst: Boolean; cdecl;
    function isFormObject: Boolean; cdecl;

    { Property }
  end;

  TJDrawingGroupObject = class(TJavaGenericImport<JDrawingGroupObjectClass, JDrawingGroupObject>) end;

  JEscherAtomClass = interface(JEscherRecordClass) // or JObjectClass
  ['{A194FC2C-1298-40D3-85A4-7437321446EE}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JEscherAtom; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/EscherAtom')]
  JEscherAtom = interface(JEscherRecord) // or JObject
  ['{F7820682-1D66-43F7-9886-5C787599DAD1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEscherAtom = class(TJavaGenericImport<JEscherAtomClass, JEscherAtom>) end;

  JEscherContainerClass = interface(JEscherRecordClass) // or JObjectClass
  ['{6438ABE3-3161-4066-A170-3023059C0F1F}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JEscherContainer; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/EscherContainer')]
  JEscherContainer = interface(JEscherRecord) // or JObject
  ['{785F27D0-6138-45CD-B02D-69C97FD57DE0}']
    { Property Methods }

    { methods }
    function getChildren: TJavaObjectArray<JEscherRecord>; cdecl;
    procedure add(child: JEscherRecord); cdecl;
    procedure remove(child: JEscherRecord); cdecl;

    { Property }
  end;

  TJEscherContainer = class(TJavaGenericImport<JEscherContainerClass, JEscherContainer>) end;

  JEscherDisplayClass = interface(JObjectClass)
  ['{81DEDD07-EC90-41E2-B7D6-B896BA74A9B1}']
    { static Property Methods }

    { static Methods }
    {class} function init(s: JEscherStream; bw: JBufferedWriter): JEscherDisplay; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/EscherDisplay')]
  JEscherDisplay = interface(JObject)
  ['{86F79B41-89C8-4889-9B03-A408FC3910BC}']
    { Property Methods }

    { methods }
    procedure display; cdecl;

    { Property }
  end;

  TJEscherDisplay = class(TJavaGenericImport<JEscherDisplayClass, JEscherDisplay>) end;

  JEscherRecordClass = interface(JObjectClass)
  ['{854B1DDE-375F-4283-AEBA-0F56D46338B4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/EscherRecord')]
  JEscherRecord = interface(JObject)
  ['{D52B3712-BA74-4AA0-A8B5-693B42B2447F}']
    { Property Methods }

    { methods }
    function getLength: Integer; cdecl;
    function getType: JEscherRecordType; cdecl;

    { Property }
  end;

  TJEscherRecord = class(TJavaGenericImport<JEscherRecordClass, JEscherRecord>) end;

  JEscherRecordDataClass = interface(JObjectClass)
  ['{D95DA0DB-88B6-4E9F-B4CB-ED72E1B8305C}']
    { static Property Methods }

    { static Methods }
    {class} function init(dg: JEscherStream; p: Integer): JEscherRecordData; cdecl; overload;
    {class} function init(t: JEscherRecordType): JEscherRecordData; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/EscherRecordData')]
  JEscherRecordData = interface(JObject)
  ['{7779D9F6-5D42-426D-A332-2F8BA81BF662}']
    { Property Methods }

    { methods }
    function isContainer: Boolean; cdecl;
    function getLength: Integer; cdecl;
    function getRecordId: Integer; cdecl;

    { Property }
  end;

  TJEscherRecordData = class(TJavaGenericImport<JEscherRecordDataClass, JEscherRecordData>) end;

  JEscherRecordTypeClass = interface(JObjectClass)
  ['{C94F77B8-7710-4B7B-A452-904CA6F4AE79}']
    { static Property Methods }
    {class} function _GetUNKNOWN: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDGG_CONTAINER: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBSTORE_CONTAINER: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDG_CONTAINER: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSPGR_CONTAINER: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSP_CONTAINER: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDGG: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBSE: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDG: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSPGR: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSP: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOPT: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLIENT_ANCHOR: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLIENT_DATA: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLIENT_TEXT_BOX: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSPLIT_MENU_COLORS: JEscherRecordType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getType(val: Integer): JEscherRecordType; cdecl;

    { static Property }
    {class} property UNKNOWN: JEscherRecordType read _GetUNKNOWN;
    {class} property DGG_CONTAINER: JEscherRecordType read _GetDGG_CONTAINER;
    {class} property BSTORE_CONTAINER: JEscherRecordType read _GetBSTORE_CONTAINER;
    {class} property DG_CONTAINER: JEscherRecordType read _GetDG_CONTAINER;
    {class} property SPGR_CONTAINER: JEscherRecordType read _GetSPGR_CONTAINER;
    {class} property SP_CONTAINER: JEscherRecordType read _GetSP_CONTAINER;
    {class} property DGG: JEscherRecordType read _GetDGG;
    {class} property BSE: JEscherRecordType read _GetBSE;
    {class} property DG: JEscherRecordType read _GetDG;
    {class} property SPGR: JEscherRecordType read _GetSPGR;
    {class} property SP: JEscherRecordType read _GetSP;
    {class} property OPT: JEscherRecordType read _GetOPT;
    {class} property CLIENT_ANCHOR: JEscherRecordType read _GetCLIENT_ANCHOR;
    {class} property CLIENT_DATA: JEscherRecordType read _GetCLIENT_DATA;
    {class} property CLIENT_TEXT_BOX: JEscherRecordType read _GetCLIENT_TEXT_BOX;
    {class} property SPLIT_MENU_COLORS: JEscherRecordType read _GetSPLIT_MENU_COLORS;
  end;

  [JavaSignature('jxl/biff/drawing/EscherRecordType')]
  JEscherRecordType = interface(JObject)
  ['{77DC01EA-8C28-4649-BD55-F4A2F7A720C3}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;

    { Property }
  end;

  TJEscherRecordType = class(TJavaGenericImport<JEscherRecordTypeClass, JEscherRecordType>) end;

  JEscherStreamClass = interface(JObjectClass)
  ['{BF31F538-EAAF-483E-8F85-10542C026CBF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/EscherStream')]
  JEscherStream = interface(IJavaInstance)
  ['{5B28CED7-B94D-4113-A5DD-ABED41E8398E}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJEscherStream = class(TJavaGenericImport<JEscherStreamClass, JEscherStream>) end;

  JMsoDrawingGroupRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{0DC3FB04-F90D-428A-9846-13994D5AEDD7}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JMsoDrawingGroupRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/MsoDrawingGroupRecord')]
  JMsoDrawingGroupRecord = interface(JWritableRecordData) // or JObject
  ['{B56698CB-C124-4ADC-8594-34EEC424EC4D}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJMsoDrawingGroupRecord = class(TJavaGenericImport<JMsoDrawingGroupRecordClass, JMsoDrawingGroupRecord>) end;

  JMsoDrawingRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{419BE25C-6494-407E-BE7A-0B0F4CA5102E}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JMsoDrawingRecord; cdecl; overload;
    {class} function init(d: TJavaArray<Byte>): JMsoDrawingRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/MsoDrawingRecord')]
  JMsoDrawingRecord = interface(JWritableRecordData) // or JObject
  ['{9E7AFAED-0FBA-4073-B8B6-D1ADAF34913F}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getRecord: JRecord; cdecl;
    procedure setFirst; cdecl;
    function isFirst: Boolean; cdecl;

    { Property }
  end;

  TJMsoDrawingRecord = class(TJavaGenericImport<JMsoDrawingRecordClass, JMsoDrawingRecord>) end;

  JNoteRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{63EDCF69-E2AA-4B93-9E9A-BCCDEDDB9505}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JNoteRecord; cdecl; overload;
    {class} function init(d: TJavaArray<Byte>): JNoteRecord; cdecl; overload;
    {class} function init(c: Integer; r: Integer; id: Integer): JNoteRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/NoteRecord')]
  JNoteRecord = interface(JWritableRecordData) // or JObject
  ['{65E56590-9E01-4BF3-BC85-85BF3B87B847}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getObjectId: Integer; cdecl;

    { Property }
  end;

  TJNoteRecord = class(TJavaGenericImport<JNoteRecordClass, JNoteRecord>) end;

  JObjRecord_ObjTypeClass = interface(JObjectClass)
  ['{EDE82DB9-61F6-432A-BA12-9F311F1EB950}']
    { static Property Methods }

    { static Methods }
    {class} function getType(val: Integer): JObjRecord_ObjType; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/ObjRecord$ObjType')]
  JObjRecord_ObjType = interface(JObject)
  ['{E65F3C6E-8253-4083-80DC-20201E3199F6}']
    { Property Methods }
    function _Getvalue: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setvalue(avalue: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getdesc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setdesc(adesc: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function toString: JString; cdecl;

    { Property }
    property value: Integer read _Getvalue write _Setvalue;
    property desc: JString read _Getdesc write _Setdesc;
  end;

  TJObjRecord_ObjType = class(TJavaGenericImport<JObjRecord_ObjTypeClass, JObjRecord_ObjType>) end;

  JObjRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{FCA0828B-8C5A-4EDC-A9CB-3E47EE3B7EB4}']
    { static Property Methods }
    {class} function _GetTBD2: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTBD: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHART: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEXT: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUTTON: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPICTURE: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECKBOX: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOPTION: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEDITBOX: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLABEL: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDIALOGUEBOX: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLISTBOX: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGROUPBOX: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOMBOBOX: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMSOFFICEDRAWING: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMCONTROL: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXCELNOTE: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JObjRecord_ObjType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord): JObjRecord; cdecl;

    { static Property }
    {class} property TBD2: JObjRecord_ObjType read _GetTBD2;
    {class} property TBD: JObjRecord_ObjType read _GetTBD;
    {class} property CHART: JObjRecord_ObjType read _GetCHART;
    {class} property TEXT: JObjRecord_ObjType read _GetTEXT;
    {class} property BUTTON: JObjRecord_ObjType read _GetBUTTON;
    {class} property PICTURE: JObjRecord_ObjType read _GetPICTURE;
    {class} property CHECKBOX: JObjRecord_ObjType read _GetCHECKBOX;
    {class} property OPTION: JObjRecord_ObjType read _GetOPTION;
    {class} property EDITBOX: JObjRecord_ObjType read _GetEDITBOX;
    {class} property &LABEL: JObjRecord_ObjType read _GetLABEL;
    {class} property DIALOGUEBOX: JObjRecord_ObjType read _GetDIALOGUEBOX;
    {class} property LISTBOX: JObjRecord_ObjType read _GetLISTBOX;
    {class} property GROUPBOX: JObjRecord_ObjType read _GetGROUPBOX;
    {class} property COMBOBOX: JObjRecord_ObjType read _GetCOMBOBOX;
    {class} property MSOFFICEDRAWING: JObjRecord_ObjType read _GetMSOFFICEDRAWING;
    {class} property FORMCONTROL: JObjRecord_ObjType read _GetFORMCONTROL;
    {class} property EXCELNOTE: JObjRecord_ObjType read _GetEXCELNOTE;
    {class} property UNKNOWN: JObjRecord_ObjType read _GetUNKNOWN;
  end;

  [JavaSignature('jxl/biff/drawing/ObjRecord')]
  JObjRecord = interface(JWritableRecordData) // or JObject
  ['{E2376041-7E9B-4D56-9847-FD0B6C3BF696}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getRecord: JRecord; cdecl;
    function getType: JObjRecord_ObjType; cdecl;
    function getObjectId: Integer; cdecl;

    { Property }
  end;

  TJObjRecord = class(TJavaGenericImport<JObjRecordClass, JObjRecord>) end;

  JOpt_PropertyClass = interface(JObjectClass)
  ['{E44DC016-CC20-4A3B-9159-F3BFB83B710F}']
    { static Property Methods }

    { static Methods }
    {class} function init(i: Integer; bl: Boolean; co: Boolean; v: Integer): JOpt_Property; cdecl; overload;
    {class} function init(i: Integer; bl: Boolean; co: Boolean; v: Integer; s: JString): JOpt_Property; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Opt$Property')]
  JOpt_Property = interface(JObject)
  ['{C98B5116-6E57-43E5-9AF4-3487BC7602E8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOpt_Property = class(TJavaGenericImport<JOpt_PropertyClass, JOpt_Property>) end;

  JOptClass = interface(JEscherAtomClass) // or JObjectClass
  ['{AB9A0F75-D63A-4A85-B773-56BD99C03399}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JOpt; cdecl; overload;
    {class} function init: JOpt; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Opt')]
  JOpt = interface(JEscherAtom) // or JObject
  ['{929133D0-6DF6-4AC9-B504-1FA4771EFFFA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOpt = class(TJavaGenericImport<JOptClass, JOpt>) end;

  JOriginClass = interface(JObjectClass)
  ['{D56CBD7A-01A1-4348-8B8C-9B4324A18C8A}']
    { static Property Methods }
    {class} function _GetREAD: JOrigin;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWRITE: JOrigin;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_WRITE: JOrigin;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property READ: JOrigin read _GetREAD;
    {class} property WRITE: JOrigin read _GetWRITE;
    {class} property READ_WRITE: JOrigin read _GetREAD_WRITE;
  end;

  [JavaSignature('jxl/biff/drawing/Origin')]
  JOrigin = interface(JObject)
  ['{7B3243F2-7049-4C61-BC30-54804950B47B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOrigin = class(TJavaGenericImport<JOriginClass, JOrigin>) end;

  JPNGReaderClass = interface(JObjectClass)
  ['{3BB47579-6893-4AB8-919A-9B35A5FEF971}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: TJavaArray<Byte>): JPNGReader; cdecl;
    {class} procedure main(args: TJavaObjectArray<JString>); cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/PNGReader')]
  JPNGReader = interface(JObject)
  ['{DFAD595A-2618-415F-BAD3-CED37B5655E9}']
    { Property Methods }

    { methods }
    function getHeight: Integer; cdecl;
    function getWidth: Integer; cdecl;
    function getHorizontalResolution: Integer; cdecl;
    function getVerticalResolution: Integer; cdecl;

    { Property }
  end;

  TJPNGReader = class(TJavaGenericImport<JPNGReaderClass, JPNGReader>) end;

  JShapeTypeClass = interface(JObjectClass)
  ['{3E25AB5E-AA8E-4631-A585-AE04ED5F12B3}']
    { static Property Methods }
    {class} function _GetMIN: JShapeType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPICTURE_FRAME: JShapeType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHOST_CONTROL: JShapeType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEXT_BOX: JShapeType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JShapeType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property MIN: JShapeType read _GetMIN;
    {class} property PICTURE_FRAME: JShapeType read _GetPICTURE_FRAME;
    {class} property HOST_CONTROL: JShapeType read _GetHOST_CONTROL;
    {class} property TEXT_BOX: JShapeType read _GetTEXT_BOX;
    {class} property UNKNOWN: JShapeType read _GetUNKNOWN;
  end;

  [JavaSignature('jxl/biff/drawing/ShapeType')]
  JShapeType = interface(JObject)
  ['{A0A08EFF-22B0-47F9-AB8B-2D8B9FA3440C}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;

    { Property }
  end;

  TJShapeType = class(TJavaGenericImport<JShapeTypeClass, JShapeType>) end;

  JSheetDrawingWriterClass = interface(JObjectClass)
  ['{84F831C6-FF62-4023-B7A3-D6FA7A0D7CD2}']
    { static Property Methods }

    { static Methods }
    {class} function init(ws: JWorkbookSettings): JSheetDrawingWriter; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/SheetDrawingWriter')]
  JSheetDrawingWriter = interface(JObject)
  ['{F5C3747F-1811-44E0-8F54-F92D22D16305}']
    { Property Methods }

    { methods }
    procedure setDrawings(dr: JArrayList; amod: Boolean); cdecl;
    procedure write(outputFile: JFile); cdecl;
    procedure setCharts(ch: TJavaObjectArray<JChart>); cdecl;
    function getCharts: TJavaObjectArray<JChart>; cdecl;

    { Property }
  end;

  TJSheetDrawingWriter = class(TJavaGenericImport<JSheetDrawingWriterClass, JSheetDrawingWriter>) end;

  JSpClass = interface(JEscherAtomClass) // or JObjectClass
  ['{3CA6DE7E-5C6B-491A-9444-0807D354DAE1}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JSp; cdecl; overload;
    {class} function init(st: JShapeType; sid: Integer; p: Integer): JSp; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Sp')]
  JSp = interface(JEscherAtom) // or JObject
  ['{BB6B3D63-7442-461E-B58C-649F9D681BD6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSp = class(TJavaGenericImport<JSpClass, JSp>) end;

  JSpContainerClass = interface(JEscherContainerClass) // or JObjectClass
  ['{B585CD82-7224-4C3A-ADD6-E7B6257A737C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSpContainer; cdecl; overload;
    {class} function init(erd: JEscherRecordData): JSpContainer; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/SpContainer')]
  JSpContainer = interface(JEscherContainer) // or JObject
  ['{36D0879F-01BB-4829-BE00-5BE5381CF292}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSpContainer = class(TJavaGenericImport<JSpContainerClass, JSpContainer>) end;

  JSpgrClass = interface(JEscherAtomClass) // or JObjectClass
  ['{4D18D29E-588A-455F-8173-4E79DCA02D3D}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JSpgr; cdecl; overload;
    {class} function init: JSpgr; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/Spgr')]
  JSpgr = interface(JEscherAtom) // or JObject
  ['{A67177CA-742D-4546-BE9A-D08771A6DD6E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSpgr = class(TJavaGenericImport<JSpgrClass, JSpgr>) end;

  JSpgrContainerClass = interface(JEscherContainerClass) // or JObjectClass
  ['{E53E3B2E-3E7F-41E9-A3B5-A128A92DD63A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSpgrContainer; cdecl; overload;
    {class} function init(erd: JEscherRecordData): JSpgrContainer; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/SpgrContainer')]
  JSpgrContainer = interface(JEscherContainer) // or JObject
  ['{E296FD0F-7F6F-4D25-B128-62798B7C258F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSpgrContainer = class(TJavaGenericImport<JSpgrContainerClass, JSpgrContainer>) end;

  JSplitMenuColorsClass = interface(JEscherAtomClass) // or JObjectClass
  ['{DC2E4142-2268-436D-A1CF-0AAAB2CA4E9C}']
    { static Property Methods }

    { static Methods }
    {class} function init(erd: JEscherRecordData): JSplitMenuColors; cdecl; overload;
    {class} function init: JSplitMenuColors; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/SplitMenuColors')]
  JSplitMenuColors = interface(JEscherAtom) // or JObject
  ['{71FBDC9A-B80E-46B3-847A-E67139B6F206}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSplitMenuColors = class(TJavaGenericImport<JSplitMenuColorsClass, JSplitMenuColors>) end;

  JTextObjectRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{B02EAA18-DFD0-4AB7-9763-ADAC917F374C}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JTextObjectRecord; cdecl; overload;
    {class} function init(d: TJavaArray<Byte>): JTextObjectRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/drawing/TextObjectRecord')]
  JTextObjectRecord = interface(JWritableRecordData) // or JObject
  ['{9D83176B-8CF2-4882-898F-6E18C816A498}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJTextObjectRecord = class(TJavaGenericImport<JTextObjectRecordClass, JTextObjectRecord>) end;

  JDValParserClass = interface(JObjectClass)
  ['{4F576AD0-937B-46B5-8C52-7985559F8F10}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: TJavaArray<Byte>): JDValParser; cdecl; overload;
    {class} function init(objid: Integer; num: Integer): JDValParser; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/DValParser')]
  JDValParser = interface(JObject)
  ['{49017E75-B935-4E1E-B705-8AB3EE2691F1}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    procedure dvRemoved; cdecl;
    function getNumberOfDVRecords: Integer; cdecl;
    function getObjectId: Integer; cdecl;
    procedure dvAdded; cdecl;

    { Property }
  end;

  TJDValParser = class(TJavaGenericImport<JDValParserClass, JDValParser>) end;

  JDVParser_ConditionClass = interface(JObjectClass)
  ['{9F4B2010-3A34-4148-B3E0-7D220916D629}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/DVParser$Condition')]
  JDVParser_Condition = interface(JObject)
  ['{C0D52460-794C-4812-84FB-023F91F95D38}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getConditionString(s1: JString; s2: JString): JString; cdecl;

    { Property }
  end;

  TJDVParser_Condition = class(TJavaGenericImport<JDVParser_ConditionClass, JDVParser_Condition>) end;

  JDVParser_DVTypeClass = interface(JObjectClass)
  ['{41A17DEB-478B-487D-846A-4F8D4C7B04C1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/DVParser$DVType')]
  JDVParser_DVType = interface(JObject)
  ['{CE34BC0A-D38B-4F1F-9D85-14530784B730}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJDVParser_DVType = class(TJavaGenericImport<JDVParser_DVTypeClass, JDVParser_DVType>) end;

  JDVParser_ErrorStyleClass = interface(JObjectClass)
  ['{4AAF871D-1AB8-42DD-A21B-AE9625D28857}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/DVParser$ErrorStyle')]
  JDVParser_ErrorStyle = interface(JObject)
  ['{FB2CFC78-E246-4798-BB41-BEC67197E70A}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;

    { Property }
  end;

  TJDVParser_ErrorStyle = class(TJavaGenericImport<JDVParser_ErrorStyleClass, JDVParser_ErrorStyle>) end;

  JDVParserClass = interface(JObjectClass)
  ['{2333FC58-F3A0-43A0-BC15-54A841EF881F}']
    { static Property Methods }
    {class} function _GetANY: JDVParser_DVType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTEGER: JDVParser_DVType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDECIMAL: JDVParser_DVType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIST: JDVParser_DVType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATE: JDVParser_DVType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTIME: JDVParser_DVType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEXT_LENGTH: JDVParser_DVType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMULA: JDVParser_DVType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTOP: JDVParser_ErrorStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWARNING: JDVParser_ErrorStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINFO: JDVParser_ErrorStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBETWEEN: JDVParser_Condition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOT_BETWEEN: JDVParser_Condition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEQUAL: JDVParser_Condition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOT_EQUAL: JDVParser_Condition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREATER_THAN: JDVParser_Condition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLESS_THAN: JDVParser_Condition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREATER_EQUAL: JDVParser_Condition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLESS_EQUAL: JDVParser_Condition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(data: TJavaArray<Byte>; es: JExternalSheet; nt: JWorkbookMethods; ws: JWorkbookSettings): JDVParser; cdecl; overload;
    {class} function init(strings: JCollection): JDVParser; cdecl; overload;
    {class} function init(namedRange: JString): JDVParser; cdecl; overload;
    {class} function init(c1: Integer; r1: Integer; c2: Integer; r2: Integer): JDVParser; cdecl; overload;
    {class} function init(val1: Double; P2: Double; val2: JDVParser_Condition): JDVParser; cdecl; overload;
    {class} function init(copy: JDVParser): JDVParser; cdecl; overload;

    { static Property }
    {class} property ANY: JDVParser_DVType read _GetANY;
    {class} property INTEGER: JDVParser_DVType read _GetINTEGER;
    {class} property DECIMAL: JDVParser_DVType read _GetDECIMAL;
    {class} property LIST: JDVParser_DVType read _GetLIST;
    {class} property DATE: JDVParser_DVType read _GetDATE;
    {class} property TIME: JDVParser_DVType read _GetTIME;
    {class} property TEXT_LENGTH: JDVParser_DVType read _GetTEXT_LENGTH;
    {class} property FORMULA: JDVParser_DVType read _GetFORMULA;
    {class} property STOP: JDVParser_ErrorStyle read _GetSTOP;
    {class} property WARNING: JDVParser_ErrorStyle read _GetWARNING;
    {class} property INFO: JDVParser_ErrorStyle read _GetINFO;
    {class} property BETWEEN: JDVParser_Condition read _GetBETWEEN;
    {class} property NOT_BETWEEN: JDVParser_Condition read _GetNOT_BETWEEN;
    {class} property EQUAL: JDVParser_Condition read _GetEQUAL;
    {class} property NOT_EQUAL: JDVParser_Condition read _GetNOT_EQUAL;
    {class} property GREATER_THAN: JDVParser_Condition read _GetGREATER_THAN;
    {class} property LESS_THAN: JDVParser_Condition read _GetLESS_THAN;
    {class} property GREATER_EQUAL: JDVParser_Condition read _GetGREATER_EQUAL;
    {class} property LESS_EQUAL: JDVParser_Condition read _GetLESS_EQUAL;
  end;

  [JavaSignature('jxl/biff/DVParser')]
  JDVParser = interface(JObject)
  ['{98364DE6-58A9-41A7-9012-B0AB7A775438}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    procedure insertRow(row: Integer); cdecl;
    procedure insertColumn(col: Integer); cdecl;
    procedure removeRow(row: Integer); cdecl;
    procedure removeColumn(col: Integer); cdecl;
    function getFirstColumn: Integer; cdecl;
    function getLastColumn: Integer; cdecl;
    function getFirstRow: Integer; cdecl;
    function getLastRow: Integer; cdecl;
    procedure setCell(col: Integer; row: Integer; es: JExternalSheet; nt: JWorkbookMethods; ws: JWorkbookSettings); cdecl;

    { Property }
  end;

  TJDVParser = class(TJavaGenericImport<JDVParserClass, JDVParser>) end;

  JEmptyCellClass = interface(JObjectClass)
  ['{2A89F1AC-2DAC-4143-97FE-F83B666F2530}']
    { static Property Methods }

    { static Methods }
    {class} function init(c: Integer; r: Integer): JEmptyCell; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/EmptyCell')]
  JEmptyCell = interface(JObject)
  ['{B487F5FC-FC69-4EE0-B5E2-C5A648D8D7CC}']
    { Property Methods }

    { methods }
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getType: JCellType; cdecl;
    function getContents: JString; cdecl;
    function getCellFormat: JCellFormat; cdecl;
    procedure setHidden(flag: Boolean); cdecl;
    procedure setLocked(flag: Boolean); cdecl;
    procedure setAlignment(align: JAlignment); cdecl;
    procedure setVerticalAlignment(valign: JVerticalAlignment); cdecl;
    procedure setBorder(border: JBorder; line: JBorderLineStyle); cdecl;
    procedure setCellFormat(cf: JCellFormat); cdecl; overload;
    procedure setCellFormat(cf: JCellFormat); cdecl; overload; //Deprecated
    function isHidden: Boolean; cdecl;
    function copyTo(c: Integer; r: Integer): JWritableCell; cdecl;
    function getCellFeatures: JCellFeatures; cdecl;
    function getWritableCellFeatures: JWritableCellFeatures; cdecl;
    procedure setCellFeatures(wcf: JWritableCellFeatures); cdecl;

    { Property }
  end;

  TJEmptyCell = class(TJavaGenericImport<JEmptyCellClass, JEmptyCell>) end;

  JEncodedURLHelperClass = interface(JObjectClass)
  ['{961DC5C4-B2E1-45D1-A3D4-AE81DD8E8652}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEncodedURLHelper; cdecl;
    {class} function getEncodedURL(s: JString; ws: JWorkbookSettings): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/EncodedURLHelper')]
  JEncodedURLHelper = interface(JObject)
  ['{4D897EDA-2EE9-4ECA-94A2-A0760EBA235A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncodedURLHelper = class(TJavaGenericImport<JEncodedURLHelperClass, JEncodedURLHelper>) end;

  JFilterModeRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{D2F4311F-2FCC-4DC0-8F35-EA7320773072}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JFilterModeRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/FilterModeRecord')]
  JFilterModeRecord = interface(JWritableRecordData) // or JObject
  ['{E7D389F7-AABC-4A7A-ABF6-E5E5136462B7}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJFilterModeRecord = class(TJavaGenericImport<JFilterModeRecordClass, JFilterModeRecord>) end;

  JFontRecord_1Class = interface(JObjectClass)
  ['{D20D88BF-4D8A-4B98-90A8-338AB7EE7E44}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/FontRecord$1')]
  JFontRecord_1 = interface(JObject)
  ['{ABECBD21-FD00-428A-80AD-F78BE7791B33}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFontRecord_1 = class(TJavaGenericImport<JFontRecord_1Class, JFontRecord_1>) end;

  JFontRecord_Biff7Class = interface(JObjectClass)
  ['{8320BD71-4AFA-4446-AC63-CF4E784C505C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/FontRecord$Biff7')]
  JFontRecord_Biff7 = interface(JObject)
  ['{D1DB8791-F454-43A4-B622-74F5508AB4E2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFontRecord_Biff7 = class(TJavaGenericImport<JFontRecord_Biff7Class, JFontRecord_Biff7>) end;

  JFontRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{1637F70E-C75A-46ED-86CA-C17198AEA14C}']
    { static Property Methods }
    {class} function _Getbiff7: JFontRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord; ws: JWorkbookSettings): JFontRecord; cdecl; overload;
    {class} function init(t: JRecord; ws: JWorkbookSettings; dummy: JFontRecord_Biff7): JFontRecord; cdecl; overload;

    { static Property }
    {class} property biff7: JFontRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/biff/FontRecord')]
  JFontRecord = interface(JWritableRecordData) // or JObject
  ['{85D9BFA9-6D63-463F-911A-98528E4EF64D}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function isInitialized: Boolean; cdecl;
    procedure initialize(pos: Integer); cdecl;
    procedure uninitialize; cdecl;
    function getFontIndex: Integer; cdecl;
    function getPointSize: Integer; cdecl;
    function getBoldWeight: Integer; cdecl;
    function isItalic: Boolean; cdecl;
    function getUnderlineStyle: JUnderlineStyle; cdecl;
    function getColour: JColour; cdecl;
    function getScriptStyle: JScriptStyle; cdecl;
    function getName: JString; cdecl;
    function hashCode: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function isStruckout: Boolean; cdecl;

    { Property }
  end;

  TJFontRecord = class(TJavaGenericImport<JFontRecordClass, JFontRecord>) end;

  JFontsClass = interface(JObjectClass)
  ['{48427927-A5DB-49F1-BBF0-B0550D39E4B1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFonts; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/Fonts')]
  JFonts = interface(JObject)
  ['{5BC9B517-83BE-4B57-BF01-56120EEF5BF4}']
    { Property Methods }

    { methods }
    procedure addFont(f: JFontRecord); cdecl;
    function getFont(index: Integer): JFontRecord; cdecl;
    procedure write(outputFile: JFile); cdecl;

    { Property }
  end;

  TJFonts = class(TJavaGenericImport<JFontsClass, JFonts>) end;

  JFormatRecord_1Class = interface(JObjectClass)
  ['{E196ED1F-BE8C-433B-8E34-FF69F042DF0B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/FormatRecord$1')]
  JFormatRecord_1 = interface(JObject)
  ['{111B8D77-C660-489B-BFFA-A650AD90EB66}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFormatRecord_1 = class(TJavaGenericImport<JFormatRecord_1Class, JFormatRecord_1>) end;

  JFormatRecord_BiffTypeClass = interface(JObjectClass)
  ['{E6869FCF-C1EA-4415-A131-A265CDC0BE89}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/FormatRecord$BiffType')]
  JFormatRecord_BiffType = interface(JObject)
  ['{AA4702C4-4AA1-4F39-862F-82EFED14DA00}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFormatRecord_BiffType = class(TJavaGenericImport<JFormatRecord_BiffTypeClass, JFormatRecord_BiffType>) end;

  JFormatRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{4C9F60E8-A320-4DF0-81DE-A71A13593B22}']
    { static Property Methods }
    {class} function _Getlogger: JLogger;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbiff8: JFormatRecord_BiffType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbiff7: JFormatRecord_BiffType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord; ws: JWorkbookSettings; biffType: JFormatRecord_BiffType): JFormatRecord; cdecl;

    { static Property }
    {class} property logger: JLogger read _Getlogger;
    {class} property biff8: JFormatRecord_BiffType read _Getbiff8;
    {class} property biff7: JFormatRecord_BiffType read _Getbiff7;
  end;

  [JavaSignature('jxl/biff/FormatRecord')]
  JFormatRecord = interface(JWritableRecordData) // or JObject
  ['{23E1FBBB-8074-4EDB-B037-2601A6F38DFD}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getFormatIndex: Integer; cdecl;
    function isInitialized: Boolean; cdecl;
    procedure initialize(pos: Integer); cdecl;
    function isDate: Boolean; cdecl;
    function isNumber: Boolean; cdecl;
    function getNumberFormat: JNumberFormat; cdecl;
    function getDateFormat: JDateFormat; cdecl;
    function getIndexCode: Integer; cdecl;
    function getFormatString: JString; cdecl;
    function isBuiltIn: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;

    { Property }
  end;

  TJFormatRecord = class(TJavaGenericImport<JFormatRecordClass, JFormatRecord>) end;

  JFormattingRecordsClass = interface(JObjectClass)
  ['{8ABB8630-1792-47D1-A3C0-1288C93D4D23}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JFonts): JFormattingRecords; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/FormattingRecords')]
  JFormattingRecords = interface(JObject)
  ['{44683F1A-97A0-4CE6-A7F4-64B5067B9758}']
    { Property Methods }

    { methods }
    procedure addStyle(xf: JXFRecord); cdecl;
    procedure addFormat(fr: JDisplayFormat); cdecl;
    function isDate(pos: Integer): Boolean; cdecl;
    function getDateFormat(pos: Integer): JDateFormat; cdecl;
    function getNumberFormat(pos: Integer): JNumberFormat; cdecl;
    procedure write(outputFile: JFile); cdecl;
    function getXFRecord(index: Integer): JXFRecord; cdecl;
    function rationalizeFonts: JIndexMapping; cdecl;
    function rationalize(fontMapping: JIndexMapping; formatMapping: JIndexMapping): JIndexMapping; cdecl;
    function rationalizeDisplayFormats: JIndexMapping; cdecl;
    function getPalette: JPaletteRecord; cdecl;
    procedure setPalette(pr: JPaletteRecord); cdecl;
    procedure setColourRGB(c: JColour; r: Integer; g: Integer; b: Integer); cdecl;
    function getColourRGB(c: JColour): JRGB; cdecl;

    { Property }
  end;

  TJFormattingRecords = class(TJavaGenericImport<JFormattingRecordsClass, JFormattingRecords>) end;

  JAddClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{88E8BD11-D3EF-4FBE-BB94-118A40778A05}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAdd; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Add')]
  JAdd = interface(JBinaryOperator) // or JObject
  ['{C3ADFE78-9633-41FD-BAED-EFB765CF7606}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJAdd = class(TJavaGenericImport<JAddClass, JAdd>) end;

  JAreaClass = interface(JOperandClass) // or JObjectClass
  ['{4A79B91F-E441-4A82-B2A8-81B59F8D17D3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Area')]
  JArea = interface(JOperand) // or JObject
  ['{B80B2DE6-35FB-4F53-B454-D65D40FCE106}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;

    { Property }
  end;

  TJArea = class(TJavaGenericImport<JAreaClass, JArea>) end;

  JArea3dClass = interface(JOperandClass) // or JObjectClass
  ['{E89C6DF8-D29F-4945-95DF-C58BB9EACD08}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Area3d')]
  JArea3d = interface(JOperand) // or JObject
  ['{734559F3-31BC-4008-BD8E-BC7BB15C972D}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;
    procedure columnInserted(sheetIndex: Integer; col: Integer; currentSheet: Boolean); cdecl;

    { Property }
  end;

  TJArea3d = class(TJavaGenericImport<JArea3dClass, JArea3d>) end;

  JArgumentSeparatorClass = interface(JStringParseItemClass) // or JObjectClass
  ['{013B9AFE-EC49-47EF-A38C-0ED416B3FABA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JArgumentSeparator; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/ArgumentSeparator')]
  JArgumentSeparator = interface(JStringParseItem) // or JObject
  ['{3DBFD343-5C27-4E3D-81B7-DDCF99049FDB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJArgumentSeparator = class(TJavaGenericImport<JArgumentSeparatorClass, JArgumentSeparator>) end;

  JAttributeClass = interface(JOperatorClass) // or JObjectClass
  ['{36B65F24-DE0D-4F7F-B19F-A387F4A31D88}']
    { static Property Methods }

    { static Methods }
    {class} function init(ws: JWorkbookSettings): JAttribute; cdecl; overload;
    {class} function init(sf: JStringFunction; ws: JWorkbookSettings): JAttribute; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Attribute')]
  JAttribute = interface(JOperator) // or JObject
  ['{EC26A557-3B30-4EFF-9CDA-5FD4C7A962CE}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    function isFunction: Boolean; cdecl;
    function isSum: Boolean; cdecl;
    function isIf: Boolean; cdecl;
    function isGoto: Boolean; cdecl;
    function isChoose: Boolean; cdecl;
    procedure getOperands(s: JStack); cdecl;
    procedure getString(buf: JStringBuffer); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;

    { Property }
  end;

  TJAttribute = class(TJavaGenericImport<JAttributeClass, JAttribute>) end;

  JBinaryOperatorClass = interface(JOperatorClass) // or JObjectClass
  ['{D3CE11DF-DD79-4DAB-91D8-5693C8F690B9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBinaryOperator; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/BinaryOperator')]
  JBinaryOperator = interface(JOperator) // or JObject
  ['{581A02CF-7F3F-4663-BAC4-CCCFA18F8F49}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getOperands(s: JStack); cdecl;
    procedure getString(buf: JStringBuffer); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;

    { Property }
  end;

  TJBinaryOperator = class(TJavaGenericImport<JBinaryOperatorClass, JBinaryOperator>) end;

  JBooleanValueClass = interface(JOperandClass) // or JObjectClass
  ['{4EB69160-8478-4439-B554-525F17BE3F14}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBooleanValue; cdecl; overload;
    {class} function init(s: JString): JBooleanValue; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/BooleanValue')]
  JBooleanValue = interface(JOperand) // or JObject
  ['{8F9A2E71-F2DF-4EB1-A36D-62E3DBEEF7BE}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJBooleanValue = class(TJavaGenericImport<JBooleanValueClass, JBooleanValue>) end;

  JBuiltInFunctionClass = interface(JOperatorClass) // or JObjectClass
  ['{9E705470-5DDF-48D4-804E-3E3DE9E6F55F}']
    { static Property Methods }

    { static Methods }
    {class} function init(ws: JWorkbookSettings): JBuiltInFunction; cdecl; overload;
    {class} function init(f: JFunction; ws: JWorkbookSettings): JBuiltInFunction; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/BuiltInFunction')]
  JBuiltInFunction = interface(JOperator) // or JObject
  ['{0DCA91DF-2870-4960-A4E6-1FBDD0BD76F0}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getOperands(s: JStack); cdecl;
    procedure getString(buf: JStringBuffer); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;

    { Property }
  end;

  TJBuiltInFunction = class(TJavaGenericImport<JBuiltInFunctionClass, JBuiltInFunction>) end;

  JCellReferenceClass = interface(JOperandClass) // or JObjectClass
  ['{4330D8FD-9AD5-4EAE-A0A5-0A559187741E}']
    { static Property Methods }

    { static Methods }
    {class} function init(rt: JCell): JCellReference; cdecl; overload;
    {class} function init: JCellReference; cdecl; overload;
    {class} function init(s: JString): JCellReference; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/CellReference')]
  JCellReference = interface(JOperand) // or JObject
  ['{47F23E66-A979-4B06-B662-EDE655440291}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getRow: Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;
    procedure columnInserted(sheetIndex: Integer; col: Integer; currentSheet: Boolean); cdecl;

    { Property }
  end;

  TJCellReference = class(TJavaGenericImport<JCellReferenceClass, JCellReference>) end;

  JCellReference3dClass = interface(JOperandClass) // or JObjectClass
  ['{BFE5F470-9D30-4E57-A7B2-B07EA3F7419C}']
    { static Property Methods }

    { static Methods }
    {class} function init(rt: JCell; w: JExternalSheet): JCellReference3d; cdecl; overload;
    {class} function init(s: JString; w: JExternalSheet): JCellReference3d; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/CellReference3d')]
  JCellReference3d = interface(JOperand) // or JObject
  ['{AB915AB8-104F-4EA5-9F45-54E14367922A}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getRow: Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;
    procedure columnInserted(sheetIndex: Integer; col: Integer; currentSheet: Boolean); cdecl;

    { Property }
  end;

  TJCellReference3d = class(TJavaGenericImport<JCellReference3dClass, JCellReference3d>) end;

  JCellReferenceErrorClass = interface(JOperandClass) // or JObjectClass
  ['{571CAA19-D058-4D22-A791-9DB94079FB4A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCellReferenceError; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/CellReferenceError')]
  JCellReferenceError = interface(JOperand) // or JObject
  ['{C2B1D8BF-56D4-4B1E-96FA-441AB0426392}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJCellReferenceError = class(TJavaGenericImport<JCellReferenceErrorClass, JCellReferenceError>) end;

  JCloseParenthesesClass = interface(JStringParseItemClass) // or JObjectClass
  ['{267B6274-8AE2-4D88-AB92-9399F5ECDC5A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCloseParentheses; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/CloseParentheses')]
  JCloseParentheses = interface(JStringParseItem) // or JObject
  ['{6D3E1A00-BCAE-4C4A-B25D-F2A7F8216F64}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCloseParentheses = class(TJavaGenericImport<JCloseParenthesesClass, JCloseParentheses>) end;

  JColumnRangeClass = interface(JAreaClass) // or JObjectClass
  ['{27D6D1B6-EAEB-48CE-87DF-5820D46C5EF8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/ColumnRange')]
  JColumnRange = interface(JArea) // or JObject
  ['{480BF11E-C7D4-459D-A9B0-F68D83D10321}']
    { Property Methods }

    { methods }
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJColumnRange = class(TJavaGenericImport<JColumnRangeClass, JColumnRange>) end;

  JColumnRange3dClass = interface(JArea3dClass) // or JObjectClass
  ['{8599FE25-46EF-4007-9B17-36C7C5F79272}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/ColumnRange3d')]
  JColumnRange3d = interface(JArea3d) // or JObject
  ['{E6C1FA08-0219-4DAA-BAE7-2190BEC52CF2}']
    { Property Methods }

    { methods }
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJColumnRange3d = class(TJavaGenericImport<JColumnRange3dClass, JColumnRange3d>) end;

  JConcatenateClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{B5ACC0FD-95A3-4F17-B5CD-35A8C7F71E70}']
    { static Property Methods }

    { static Methods }
    {class} function init: JConcatenate; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Concatenate')]
  JConcatenate = interface(JBinaryOperator) // or JObject
  ['{EDEDBFB2-A61A-47B2-8F80-706029AEB4F8}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJConcatenate = class(TJavaGenericImport<JConcatenateClass, JConcatenate>) end;

  JDivideClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{11683246-849A-45A2-9091-2708CB6D6BE6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDivide; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Divide')]
  JDivide = interface(JBinaryOperator) // or JObject
  ['{9EB052DB-B6DC-469C-A9D1-3FB837DBA50B}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJDivide = class(TJavaGenericImport<JDivideClass, JDivide>) end;

  JDoubleValueClass = interface(JNumberValueClass) // or JObjectClass
  ['{20C3BA52-55E5-4DF8-8EBC-BF3B982B6002}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDoubleValue; cdecl; overload;
    {class} function init(s: JString): JDoubleValue; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/DoubleValue')]
  JDoubleValue = interface(JNumberValue) // or JObject
  ['{01F072D9-551A-4D58-AD83-6DBA6F9D25AD}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    function getValue: Double; cdecl;

    { Property }
  end;

  TJDoubleValue = class(TJavaGenericImport<JDoubleValueClass, JDoubleValue>) end;

  JEqualClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{3E6F8381-9208-404E-8F6A-C87B7F0C8351}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEqual; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Equal')]
  JEqual = interface(JBinaryOperator) // or JObject
  ['{A6E70C59-E8FB-4928-84EC-AA0AF45F5EDB}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJEqual = class(TJavaGenericImport<JEqualClass, JEqual>) end;

  JErrorConstantClass = interface(JOperandClass) // or JObjectClass
  ['{5D3371EC-8463-4947-ACF1-82113B393A79}']
    { static Property Methods }

    { static Methods }
    {class} function init: JErrorConstant; cdecl; overload;
    {class} function init(s: JString): JErrorConstant; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/ErrorConstant')]
  JErrorConstant = interface(JOperand) // or JObject
  ['{A8955F3D-994F-41CF-BFFD-01912B241AC6}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJErrorConstant = class(TJavaGenericImport<JErrorConstantClass, JErrorConstant>) end;

  JExternalSheetClass = interface(JObjectClass)
  ['{12B722F1-B029-4A76-A2A2-24DA40298405}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/ExternalSheet')]
  JExternalSheet = interface(IJavaInstance)
  ['{8097988F-10DF-47B9-99B5-18A39879CD07}']
    { Property Methods }

    { methods }
    function getExternalSheetName(P1: Integer): JString; cdecl;
    function getExternalSheetIndex(P1: JString): Integer; cdecl; overload;
    function getExternalSheetIndex(P1: Integer): Integer; cdecl; overload;
    function getLastExternalSheetIndex(P1: JString): Integer; cdecl; overload;
    function getLastExternalSheetIndex(P1: Integer): Integer; cdecl; overload;
    function getWorkbookBof: JBOFRecord; cdecl;

    { Property }
  end;

  TJExternalSheet = class(TJavaGenericImport<JExternalSheetClass, JExternalSheet>) end;

  JFormulaErrorCodeClass = interface(JObjectClass)
  ['{D48B78C6-BEE3-4F17-B7B7-CEBEDB51F280}']
    { static Property Methods }
    {class} function _GetUNKNOWN: JFormulaErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNULL: JFormulaErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDIV0: JFormulaErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVALUE: JFormulaErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREF: JFormulaErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNAME: JFormulaErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNUM: JFormulaErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNA: JFormulaErrorCode;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getErrorCode(code: Integer): JFormulaErrorCode; cdecl; overload;
    {class} function getErrorCode(code: JString): JFormulaErrorCode; cdecl; overload;

    { static Property }
    {class} property UNKNOWN: JFormulaErrorCode read _GetUNKNOWN;
    {class} property NULL: JFormulaErrorCode read _GetNULL;
    {class} property DIV0: JFormulaErrorCode read _GetDIV0;
    {class} property VALUE: JFormulaErrorCode read _GetVALUE;
    {class} property REF: JFormulaErrorCode read _GetREF;
    {class} property NAME: JFormulaErrorCode read _GetNAME;
    {class} property NUM: JFormulaErrorCode read _GetNUM;
    {class} property NA: JFormulaErrorCode read _GetNA;
  end;

  [JavaSignature('jxl/biff/formula/FormulaErrorCode')]
  JFormulaErrorCode = interface(JObject)
  ['{43D745C8-A44B-40DF-9D93-D05174DD3168}']
    { Property Methods }

    { methods }
    function getCode: Integer; cdecl;
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJFormulaErrorCode = class(TJavaGenericImport<JFormulaErrorCodeClass, JFormulaErrorCode>) end;

  JFormulaException_FormulaMessageClass = interface(JObjectClass)
  ['{88604495-F5D7-4D9E-8016-FAEEFF51E312}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/FormulaException$FormulaMessage')]
  JFormulaException_FormulaMessage = interface(JObject)
  ['{39EE5CE4-513B-4948-9B7E-696D417D3F9F}']
    { Property Methods }

    { methods }
    function getMessage: JString; cdecl;

    { Property }
  end;

  TJFormulaException_FormulaMessage = class(TJavaGenericImport<JFormulaException_FormulaMessageClass, JFormulaException_FormulaMessage>) end;

  JFormulaExceptionClass = interface(JJXLExceptionClass) // or JObjectClass
  ['{38083CBD-F453-48EE-8A13-88009EE4CB3A}']
    { static Property Methods }
    {class} function _GetBIFF8_SUPPORTED: JFormulaException_FormulaMessage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(m: JFormulaException_FormulaMessage): JFormulaException; cdecl; overload;
    {class} function init(m: JFormulaException_FormulaMessage; val: Integer): JFormulaException; cdecl; overload;
    {class} function init(m: JFormulaException_FormulaMessage; val: JString): JFormulaException; cdecl; overload;

    { static Property }
    {class} property BIFF8_SUPPORTED: JFormulaException_FormulaMessage read _GetBIFF8_SUPPORTED;
  end;

  [JavaSignature('jxl/biff/formula/FormulaException')]
  JFormulaException = interface(JJXLException) // or JObject
  ['{A9C30D62-F11F-4A3D-9AA4-5DE85C738F0F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFormulaException = class(TJavaGenericImport<JFormulaExceptionClass, JFormulaException>) end;

  JFormulaParserClass = interface(JObjectClass)
  ['{F7BCF7B7-BA67-426C-9002-B468F9719E6B}']
    { static Property Methods }

    { static Methods }
    {class} function init(tokens: TJavaArray<Byte>; rt: JCell; es: JExternalSheet; nt: JWorkbookMethods; ws: JWorkbookSettings): JFormulaParser; cdecl; overload;
    {class} function init(form: JString; es: JExternalSheet; nt: JWorkbookMethods; ws: JWorkbookSettings): JFormulaParser; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/FormulaParser')]
  JFormulaParser = interface(JObject)
  ['{4FDCEC8E-0335-46B5-983E-5DBA3DBE2190}']
    { Property Methods }

    { methods }
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;
    procedure parse; cdecl;
    function getFormula: JString; cdecl;
    function getBytes: TJavaArray<Byte>; cdecl;
    procedure columnInserted(sheetIndex: Integer; col: Integer; currentSheet: Boolean); cdecl;
    procedure columnRemoved(sheetIndex: Integer; col: Integer; currentSheet: Boolean); cdecl;
    procedure rowInserted(sheetIndex: Integer; row: Integer; currentSheet: Boolean); cdecl;
    procedure rowRemoved(sheetIndex: Integer; row: Integer; currentSheet: Boolean); cdecl;
    function handleImportedCellReferences: Boolean; cdecl;

    { Property }
  end;

  TJFormulaParser = class(TJavaGenericImport<JFormulaParserClass, JFormulaParser>) end;

  JFunctionClass = interface(JObjectClass)
  ['{6DC103FF-8B21-4A5C-B315-8E00A23C3E03}']
    { static Property Methods }
    {class} function _GetCOUNT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetATTRIBUTE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISNA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISERROR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUM: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAVERAGE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAX: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetROW: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOLUMN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNPV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTDEV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOLLAR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFIXED: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSIN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOS: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetATAN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPI: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSQRT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXP: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOG10: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetABS: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSIGN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetROUND: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOOKUP: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDEX: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREPT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMID: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVALUE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRUE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFALSE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAND: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOD: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDCOUNT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDSUM: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDAVERAGE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDMIN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDMAX: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDSTDEV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVAR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDVAR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEXT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLINEST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTREND: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOGEST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGROWTH: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNPER: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPMT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRATE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRAND: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMATCH: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTIME: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDAY: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMONTH: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetYEAR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWEEKDAY: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHOUR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMINUTE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSECOND: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOW: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAREAS: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetROWS: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOLUMNS: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOFFSET: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEARCH: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRANSPOSE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTYPE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetATAN2: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetASIN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACOS: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHOOSE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHLOOKUP: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVLOOKUP: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISREF: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOG: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHAR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOWER: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUPPER: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPROPER: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEFT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRIGHT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXACT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRIM: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREPLACE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUBSTITUTE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFIND: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCELL: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISERR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISTEXT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISNUMBER: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISBLANK: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATEVALUE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTIMEVALUE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSLN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSYD: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDDB: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDIRECT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLEAN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMDETERM: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMINVERSE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMMULT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIPMT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPPMT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOUNTA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRODUCT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDPRODUCT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISNONTEXT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTDEVP: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVARP: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDSTDEVP: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDVARP: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRUNC: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISLOGICAL: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDCOUNTA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFINDB: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEARCHB: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREPLACEB: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEFTB: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRIGHTB: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMIDB: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLENB: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetROUNDUP: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetROUNDDOWN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRANK: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetADDRESS: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAYS360: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetODAY: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVDB: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMEDIAN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUMPRODUCT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSINH: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOSH: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTANH: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetASINH: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACOSH: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetATANH: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINFO: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAVEDEV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBETADIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAMMALN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBETAINV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBINOMDIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHIDIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHIINV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOMBIN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONFIDENCE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCRITBINOM: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEVEN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXPONDIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFDIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFINV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFISHER: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFISHERINV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFLOOR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAMMADIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGAMMAINV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCEILING: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHYPGEOMDIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOGNORMDIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOGINV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNEGBINOMDIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNORMDIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNORMSDIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNORMINV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNORMSINV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTANDARDIZE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetODD: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPERMUT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPOISSON: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTDIST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWEIBULL: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUMXMY2: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUMX2MY2: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUMX2PY2: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHITEST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCORREL: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOVAR: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORECAST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFTEST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTERCEPT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPEARSON: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSQ: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTEYX: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSLOPE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTTEST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPROB: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEVSQ: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGEOMEAN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHARMEAN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUMSQ: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKURT: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSKEW: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetZTEST: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLARGE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSMALL: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQUARTILE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPERCENTILE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPERCENTRANK: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMODE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRIMMEAN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTINV: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONCATENATE: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPOWER: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRADIANS: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEGREES: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUBTOTAL: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUMIF: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOUNTIF: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOUNTBLANK: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHYPERLINK: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAVERAGEA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMAXA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMINA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTDEVPA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVARPA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTDEVA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVARA: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIF: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JFunction;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getFunction(v: Integer): JFunction; cdecl; overload;
    {class} function getFunction(v: JString; ws: JWorkbookSettings): JFunction; cdecl; overload;

    { static Property }
    {class} property COUNT: JFunction read _GetCOUNT;
    {class} property ATTRIBUTE: JFunction read _GetATTRIBUTE;
    {class} property ISNA: JFunction read _GetISNA;
    {class} property ISERROR: JFunction read _GetISERROR;
    {class} property SUM: JFunction read _GetSUM;
    {class} property AVERAGE: JFunction read _GetAVERAGE;
    {class} property MIN: JFunction read _GetMIN;
    {class} property MAX: JFunction read _GetMAX;
    {class} property ROW: JFunction read _GetROW;
    {class} property COLUMN: JFunction read _GetCOLUMN;
    {class} property NA: JFunction read _GetNA;
    {class} property NPV: JFunction read _GetNPV;
    {class} property STDEV: JFunction read _GetSTDEV;
    {class} property DOLLAR: JFunction read _GetDOLLAR;
    {class} property FIXED: JFunction read _GetFIXED;
    {class} property SIN: JFunction read _GetSIN;
    {class} property COS: JFunction read _GetCOS;
    {class} property TAN: JFunction read _GetTAN;
    {class} property ATAN: JFunction read _GetATAN;
    {class} property PI: JFunction read _GetPI;
    {class} property SQRT: JFunction read _GetSQRT;
    {class} property EXP: JFunction read _GetEXP;
    {class} property LN: JFunction read _GetLN;
    {class} property LOG10: JFunction read _GetLOG10;
    {class} property ABS: JFunction read _GetABS;
    {class} property INT: JFunction read _GetINT;
    {class} property SIGN: JFunction read _GetSIGN;
    {class} property ROUND: JFunction read _GetROUND;
    {class} property LOOKUP: JFunction read _GetLOOKUP;
    {class} property INDEX: JFunction read _GetINDEX;
    {class} property REPT: JFunction read _GetREPT;
    {class} property MID: JFunction read _GetMID;
    {class} property LEN: JFunction read _GetLEN;
    {class} property VALUE: JFunction read _GetVALUE;
    {class} property TRUE: JFunction read _GetTRUE;
    {class} property FALSE: JFunction read _GetFALSE;
    {class} property &AND: JFunction read _GetAND;
    {class} property &OR: JFunction read _GetOR;
    {class} property &NOT: JFunction read _GetNOT;
    {class} property &MOD: JFunction read _GetMOD;
    {class} property DCOUNT: JFunction read _GetDCOUNT;
    {class} property DSUM: JFunction read _GetDSUM;
    {class} property DAVERAGE: JFunction read _GetDAVERAGE;
    {class} property DMIN: JFunction read _GetDMIN;
    {class} property DMAX: JFunction read _GetDMAX;
    {class} property DSTDEV: JFunction read _GetDSTDEV;
    {class} property &VAR: JFunction read _GetVAR;
    {class} property DVAR: JFunction read _GetDVAR;
    {class} property TEXT: JFunction read _GetTEXT;
    {class} property LINEST: JFunction read _GetLINEST;
    {class} property TREND: JFunction read _GetTREND;
    {class} property LOGEST: JFunction read _GetLOGEST;
    {class} property GROWTH: JFunction read _GetGROWTH;
    {class} property PV: JFunction read _GetPV;
    {class} property FV: JFunction read _GetFV;
    {class} property NPER: JFunction read _GetNPER;
    {class} property PMT: JFunction read _GetPMT;
    {class} property RATE: JFunction read _GetRATE;
    {class} property RAND: JFunction read _GetRAND;
    {class} property MATCH: JFunction read _GetMATCH;
    {class} property DATE: JFunction read _GetDATE;
    {class} property TIME: JFunction read _GetTIME;
    {class} property DAY: JFunction read _GetDAY;
    {class} property MONTH: JFunction read _GetMONTH;
    {class} property YEAR: JFunction read _GetYEAR;
    {class} property WEEKDAY: JFunction read _GetWEEKDAY;
    {class} property HOUR: JFunction read _GetHOUR;
    {class} property MINUTE: JFunction read _GetMINUTE;
    {class} property SECOND: JFunction read _GetSECOND;
    {class} property NOW: JFunction read _GetNOW;
    {class} property AREAS: JFunction read _GetAREAS;
    {class} property ROWS: JFunction read _GetROWS;
    {class} property COLUMNS: JFunction read _GetCOLUMNS;
    {class} property OFFSET: JFunction read _GetOFFSET;
    {class} property SEARCH: JFunction read _GetSEARCH;
    {class} property TRANSPOSE: JFunction read _GetTRANSPOSE;
    {class} property ERROR: JFunction read _GetERROR;
    {class} property &TYPE: JFunction read _GetTYPE;
    {class} property ATAN2: JFunction read _GetATAN2;
    {class} property ASIN: JFunction read _GetASIN;
    {class} property ACOS: JFunction read _GetACOS;
    {class} property CHOOSE: JFunction read _GetCHOOSE;
    {class} property HLOOKUP: JFunction read _GetHLOOKUP;
    {class} property VLOOKUP: JFunction read _GetVLOOKUP;
    {class} property ISREF: JFunction read _GetISREF;
    {class} property LOG: JFunction read _GetLOG;
    {class} property CHAR: JFunction read _GetCHAR;
    {class} property LOWER: JFunction read _GetLOWER;
    {class} property UPPER: JFunction read _GetUPPER;
    {class} property PROPER: JFunction read _GetPROPER;
    {class} property LEFT: JFunction read _GetLEFT;
    {class} property RIGHT: JFunction read _GetRIGHT;
    {class} property EXACT: JFunction read _GetEXACT;
    {class} property TRIM: JFunction read _GetTRIM;
    {class} property REPLACE: JFunction read _GetREPLACE;
    {class} property SUBSTITUTE: JFunction read _GetSUBSTITUTE;
    {class} property CODE: JFunction read _GetCODE;
    {class} property FIND: JFunction read _GetFIND;
    {class} property CELL: JFunction read _GetCELL;
    {class} property ISERR: JFunction read _GetISERR;
    {class} property ISTEXT: JFunction read _GetISTEXT;
    {class} property ISNUMBER: JFunction read _GetISNUMBER;
    {class} property ISBLANK: JFunction read _GetISBLANK;
    {class} property T: JFunction read _GetT;
    {class} property N: JFunction read _GetN;
    {class} property DATEVALUE: JFunction read _GetDATEVALUE;
    {class} property TIMEVALUE: JFunction read _GetTIMEVALUE;
    {class} property SLN: JFunction read _GetSLN;
    {class} property SYD: JFunction read _GetSYD;
    {class} property DDB: JFunction read _GetDDB;
    {class} property INDIRECT: JFunction read _GetINDIRECT;
    {class} property CLEAN: JFunction read _GetCLEAN;
    {class} property MDETERM: JFunction read _GetMDETERM;
    {class} property MINVERSE: JFunction read _GetMINVERSE;
    {class} property MMULT: JFunction read _GetMMULT;
    {class} property IPMT: JFunction read _GetIPMT;
    {class} property PPMT: JFunction read _GetPPMT;
    {class} property COUNTA: JFunction read _GetCOUNTA;
    {class} property PRODUCT: JFunction read _GetPRODUCT;
    {class} property FACT: JFunction read _GetFACT;
    {class} property DPRODUCT: JFunction read _GetDPRODUCT;
    {class} property ISNONTEXT: JFunction read _GetISNONTEXT;
    {class} property STDEVP: JFunction read _GetSTDEVP;
    {class} property VARP: JFunction read _GetVARP;
    {class} property DSTDEVP: JFunction read _GetDSTDEVP;
    {class} property DVARP: JFunction read _GetDVARP;
    {class} property TRUNC: JFunction read _GetTRUNC;
    {class} property ISLOGICAL: JFunction read _GetISLOGICAL;
    {class} property DCOUNTA: JFunction read _GetDCOUNTA;
    {class} property FINDB: JFunction read _GetFINDB;
    {class} property SEARCHB: JFunction read _GetSEARCHB;
    {class} property REPLACEB: JFunction read _GetREPLACEB;
    {class} property LEFTB: JFunction read _GetLEFTB;
    {class} property RIGHTB: JFunction read _GetRIGHTB;
    {class} property MIDB: JFunction read _GetMIDB;
    {class} property LENB: JFunction read _GetLENB;
    {class} property ROUNDUP: JFunction read _GetROUNDUP;
    {class} property ROUNDDOWN: JFunction read _GetROUNDDOWN;
    {class} property RANK: JFunction read _GetRANK;
    {class} property ADDRESS: JFunction read _GetADDRESS;
    {class} property AYS360: JFunction read _GetAYS360;
    {class} property ODAY: JFunction read _GetODAY;
    {class} property VDB: JFunction read _GetVDB;
    {class} property MEDIAN: JFunction read _GetMEDIAN;
    {class} property SUMPRODUCT: JFunction read _GetSUMPRODUCT;
    {class} property SINH: JFunction read _GetSINH;
    {class} property COSH: JFunction read _GetCOSH;
    {class} property TANH: JFunction read _GetTANH;
    {class} property ASINH: JFunction read _GetASINH;
    {class} property ACOSH: JFunction read _GetACOSH;
    {class} property ATANH: JFunction read _GetATANH;
    {class} property INFO: JFunction read _GetINFO;
    {class} property AVEDEV: JFunction read _GetAVEDEV;
    {class} property BETADIST: JFunction read _GetBETADIST;
    {class} property GAMMALN: JFunction read _GetGAMMALN;
    {class} property BETAINV: JFunction read _GetBETAINV;
    {class} property BINOMDIST: JFunction read _GetBINOMDIST;
    {class} property CHIDIST: JFunction read _GetCHIDIST;
    {class} property CHIINV: JFunction read _GetCHIINV;
    {class} property COMBIN: JFunction read _GetCOMBIN;
    {class} property CONFIDENCE: JFunction read _GetCONFIDENCE;
    {class} property CRITBINOM: JFunction read _GetCRITBINOM;
    {class} property EVEN: JFunction read _GetEVEN;
    {class} property EXPONDIST: JFunction read _GetEXPONDIST;
    {class} property FDIST: JFunction read _GetFDIST;
    {class} property FINV: JFunction read _GetFINV;
    {class} property FISHER: JFunction read _GetFISHER;
    {class} property FISHERINV: JFunction read _GetFISHERINV;
    {class} property FLOOR: JFunction read _GetFLOOR;
    {class} property GAMMADIST: JFunction read _GetGAMMADIST;
    {class} property GAMMAINV: JFunction read _GetGAMMAINV;
    {class} property CEILING: JFunction read _GetCEILING;
    {class} property HYPGEOMDIST: JFunction read _GetHYPGEOMDIST;
    {class} property LOGNORMDIST: JFunction read _GetLOGNORMDIST;
    {class} property LOGINV: JFunction read _GetLOGINV;
    {class} property NEGBINOMDIST: JFunction read _GetNEGBINOMDIST;
    {class} property NORMDIST: JFunction read _GetNORMDIST;
    {class} property NORMSDIST: JFunction read _GetNORMSDIST;
    {class} property NORMINV: JFunction read _GetNORMINV;
    {class} property NORMSINV: JFunction read _GetNORMSINV;
    {class} property STANDARDIZE: JFunction read _GetSTANDARDIZE;
    {class} property ODD: JFunction read _GetODD;
    {class} property PERMUT: JFunction read _GetPERMUT;
    {class} property POISSON: JFunction read _GetPOISSON;
    {class} property TDIST: JFunction read _GetTDIST;
    {class} property WEIBULL: JFunction read _GetWEIBULL;
    {class} property SUMXMY2: JFunction read _GetSUMXMY2;
    {class} property SUMX2MY2: JFunction read _GetSUMX2MY2;
    {class} property SUMX2PY2: JFunction read _GetSUMX2PY2;
    {class} property CHITEST: JFunction read _GetCHITEST;
    {class} property CORREL: JFunction read _GetCORREL;
    {class} property COVAR: JFunction read _GetCOVAR;
    {class} property FORECAST: JFunction read _GetFORECAST;
    {class} property FTEST: JFunction read _GetFTEST;
    {class} property INTERCEPT: JFunction read _GetINTERCEPT;
    {class} property PEARSON: JFunction read _GetPEARSON;
    {class} property RSQ: JFunction read _GetRSQ;
    {class} property STEYX: JFunction read _GetSTEYX;
    {class} property SLOPE: JFunction read _GetSLOPE;
    {class} property TTEST: JFunction read _GetTTEST;
    {class} property PROB: JFunction read _GetPROB;
    {class} property DEVSQ: JFunction read _GetDEVSQ;
    {class} property GEOMEAN: JFunction read _GetGEOMEAN;
    {class} property HARMEAN: JFunction read _GetHARMEAN;
    {class} property SUMSQ: JFunction read _GetSUMSQ;
    {class} property KURT: JFunction read _GetKURT;
    {class} property SKEW: JFunction read _GetSKEW;
    {class} property ZTEST: JFunction read _GetZTEST;
    {class} property LARGE: JFunction read _GetLARGE;
    {class} property SMALL: JFunction read _GetSMALL;
    {class} property QUARTILE: JFunction read _GetQUARTILE;
    {class} property PERCENTILE: JFunction read _GetPERCENTILE;
    {class} property PERCENTRANK: JFunction read _GetPERCENTRANK;
    {class} property MODE: JFunction read _GetMODE;
    {class} property TRIMMEAN: JFunction read _GetTRIMMEAN;
    {class} property TINV: JFunction read _GetTINV;
    {class} property CONCATENATE: JFunction read _GetCONCATENATE;
    {class} property POWER: JFunction read _GetPOWER;
    {class} property RADIANS: JFunction read _GetRADIANS;
    {class} property DEGREES: JFunction read _GetDEGREES;
    {class} property SUBTOTAL: JFunction read _GetSUBTOTAL;
    {class} property SUMIF: JFunction read _GetSUMIF;
    {class} property COUNTIF: JFunction read _GetCOUNTIF;
    {class} property COUNTBLANK: JFunction read _GetCOUNTBLANK;
    {class} property HYPERLINK: JFunction read _GetHYPERLINK;
    {class} property AVERAGEA: JFunction read _GetAVERAGEA;
    {class} property MAXA: JFunction read _GetMAXA;
    {class} property MINA: JFunction read _GetMINA;
    {class} property STDEVPA: JFunction read _GetSTDEVPA;
    {class} property VARPA: JFunction read _GetVARPA;
    {class} property STDEVA: JFunction read _GetSTDEVA;
    {class} property VARA: JFunction read _GetVARA;
    {class} property &IF: JFunction read _GetIF;
    {class} property UNKNOWN: JFunction read _GetUNKNOWN;
  end;

  [JavaSignature('jxl/biff/formula/Function')]
  JFunction = interface(JObject)
  ['{C34B099F-9D1A-46DE-BDC8-27B58E2E05BB}']
    { Property Methods }

    { methods }
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJFunction = class(TJavaGenericImport<JFunctionClass, JFunction>) end;

  JFunctionNamesClass = interface(JObjectClass)
  ['{77B4F590-3569-46FA-A52C-8B680C4EBACE}']
    { static Property Methods }

    { static Methods }
    {class} function init(l: JLocale): JFunctionNames; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/FunctionNames')]
  JFunctionNames = interface(JObject)
  ['{E1D92790-7316-4393-A3E1-0CA5B98E0C63}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFunctionNames = class(TJavaGenericImport<JFunctionNamesClass, JFunctionNames>) end;

  JGreaterEqualClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{02AC6D12-B4FF-42B1-9649-E3AE413A85AD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGreaterEqual; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/GreaterEqual')]
  JGreaterEqual = interface(JBinaryOperator) // or JObject
  ['{7E11CE12-47A1-4593-8C3C-1913BFD1A3A5}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJGreaterEqual = class(TJavaGenericImport<JGreaterEqualClass, JGreaterEqual>) end;

  JGreaterThanClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{C5978157-26C4-4AA4-A9B0-A26E4D9E3688}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGreaterThan; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/GreaterThan')]
  JGreaterThan = interface(JBinaryOperator) // or JObject
  ['{A84DCE35-DD14-4D51-B8C0-864E7291F232}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJGreaterThan = class(TJavaGenericImport<JGreaterThanClass, JGreaterThan>) end;

  JIntegerValueClass = interface(JNumberValueClass) // or JObjectClass
  ['{0AF0CEDB-C665-43BF-888E-3579ABF2CF34}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIntegerValue; cdecl; overload;
    {class} function init(s: JString): JIntegerValue; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/IntegerValue')]
  JIntegerValue = interface(JNumberValue) // or JObject
  ['{E7A310BB-FA13-4E7A-BAB3-201786A2D47D}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    function getValue: Double; cdecl;

    { Property }
  end;

  TJIntegerValue = class(TJavaGenericImport<JIntegerValueClass, JIntegerValue>) end;

  JLessEqualClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{81074A1D-121C-43CB-9C43-821024FFA2F1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLessEqual; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/LessEqual')]
  JLessEqual = interface(JBinaryOperator) // or JObject
  ['{13CBADBF-2B6F-41DC-B3B4-2BAB51CE8751}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJLessEqual = class(TJavaGenericImport<JLessEqualClass, JLessEqual>) end;

  JLessThanClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{18A72F25-AB00-45BC-AA79-F12DAC79EA41}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLessThan; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/LessThan')]
  JLessThan = interface(JBinaryOperator) // or JObject
  ['{C94F284D-0A89-4D8C-A588-4396753AC663}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJLessThan = class(TJavaGenericImport<JLessThanClass, JLessThan>) end;

  JMemAreaClass = interface(JSubExpressionClass) // or JObjectClass
  ['{93668AA9-B8B3-4798-87D5-A9D16A072707}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMemArea; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/MemArea')]
  JMemArea = interface(JSubExpression) // or JObject
  ['{D826C6DB-2000-4AD7-8778-427F48BCBBAF}']
    { Property Methods }

    { methods }
    procedure getString(buf: JStringBuffer); cdecl;
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;

    { Property }
  end;

  TJMemArea = class(TJavaGenericImport<JMemAreaClass, JMemArea>) end;

  JMemFuncClass = interface(JSubExpressionClass) // or JObjectClass
  ['{0D8712AA-E639-4239-82BA-2A0559375B93}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMemFunc; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/MemFunc')]
  JMemFunc = interface(JSubExpression) // or JObject
  ['{5419282F-38E1-4A58-A036-7B2223526076}']
    { Property Methods }

    { methods }
    procedure getString(sb: JStringBuffer); cdecl;

    { Property }
  end;

  TJMemFunc = class(TJavaGenericImport<JMemFuncClass, JMemFunc>) end;

  JMinusClass = interface(JStringOperatorClass) // or JObjectClass
  ['{99CB23CC-6336-42BF-8145-F1778F295C9B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMinus; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Minus')]
  JMinus = interface(JStringOperator) // or JObject
  ['{043AE9F5-A701-47F4-99E7-2011ABA9D3BD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMinus = class(TJavaGenericImport<JMinusClass, JMinus>) end;

  JMissingArgClass = interface(JOperandClass) // or JObjectClass
  ['{D49CE41D-284D-4E01-9446-773CC1511735}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMissingArg; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/MissingArg')]
  JMissingArg = interface(JOperand) // or JObject
  ['{72062CA3-607A-4168-9232-B69339369736}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJMissingArg = class(TJavaGenericImport<JMissingArgClass, JMissingArg>) end;

  JMultiplyClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{BF0676FB-AB5E-4E8B-84FA-3E5FFD4EA589}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMultiply; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Multiply')]
  JMultiply = interface(JBinaryOperator) // or JObject
  ['{A669C354-A544-42B1-BEBF-266360E30CB6}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJMultiply = class(TJavaGenericImport<JMultiplyClass, JMultiply>) end;

  JNameClass = interface(JOperandClass) // or JObjectClass
  ['{A1516B06-7E7D-4377-B628-7FEF81288FEB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JName; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Name')]
  JName = interface(JOperand) // or JObject
  ['{483E4419-F509-41EF-AC63-45AF143FDAD1}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJName = class(TJavaGenericImport<JNameClass, JName>) end;

  JNameRangeClass = interface(JOperandClass) // or JObjectClass
  ['{848B43F0-E734-4D00-BBE6-FB075B2122E4}']
    { static Property Methods }

    { static Methods }
    {class} function init(nt: JWorkbookMethods): JNameRange; cdecl; overload;
    {class} function init(nm: JString; nt: JWorkbookMethods): JNameRange; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/NameRange')]
  JNameRange = interface(JOperand) // or JObject
  ['{B2403321-6DC0-4D06-A241-6B99B4A5DB74}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJNameRange = class(TJavaGenericImport<JNameRangeClass, JNameRange>) end;

  JNotEqualClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{CF252141-2EAF-4B66-9020-0731EE8D0F31}']
    { static Property Methods }

    { static Methods }
    {class} function init: JNotEqual; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/NotEqual')]
  JNotEqual = interface(JBinaryOperator) // or JObject
  ['{72B999E8-34D4-477B-88FE-17A714EB5A41}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJNotEqual = class(TJavaGenericImport<JNotEqualClass, JNotEqual>) end;

  JNumberValueClass = interface(JOperandClass) // or JObjectClass
  ['{74A6402B-17A1-4EA2-A696-4142E1BEF2CC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/NumberValue')]
  JNumberValue = interface(JOperand) // or JObject
  ['{5BC164E9-4CFC-4AF3-B846-43F2C878DB50}']
    { Property Methods }

    { methods }
    function getValue: Double; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJNumberValue = class(TJavaGenericImport<JNumberValueClass, JNumberValue>) end;

  JOpenParenthesesClass = interface(JStringParseItemClass) // or JObjectClass
  ['{E8461CF7-F624-4255-905C-545CE998B7D9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOpenParentheses; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/OpenParentheses')]
  JOpenParentheses = interface(JStringParseItem) // or JObject
  ['{041484AF-C460-42E7-98D1-A3C7326675A4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOpenParentheses = class(TJavaGenericImport<JOpenParenthesesClass, JOpenParentheses>) end;

  JOperandClass = interface(JParseItemClass) // or JObjectClass
  ['{E34D10E5-A066-4F8E-87B2-0E864717A28E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOperand; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Operand')]
  JOperand = interface(JParseItem) // or JObject
  ['{B56C0BCF-4950-47C6-A4E5-A54E47834C34}']
    { Property Methods }

    { methods }
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;

    { Property }
  end;

  TJOperand = class(TJavaGenericImport<JOperandClass, JOperand>) end;

  JOperatorClass = interface(JParseItemClass) // or JObjectClass
  ['{E699F6AB-BA62-4D20-87FA-8D69E6AF8A8B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOperator; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Operator')]
  JOperator = interface(JParseItem) // or JObject
  ['{FA42E3B4-9641-4E1C-AE97-4A991D814BD8}']
    { Property Methods }

    { methods }
    procedure getOperands(P1: JStack); cdecl;

    { Property }
  end;

  TJOperator = class(TJavaGenericImport<JOperatorClass, JOperator>) end;

  JParenthesisClass = interface(JOperatorClass) // or JObjectClass
  ['{662CB50F-087C-44BD-B41C-827209B02DDA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JParenthesis; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Parenthesis')]
  JParenthesis = interface(JOperator) // or JObject
  ['{C586A8FC-3853-405A-86D0-9A828B0ED64B}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getOperands(s: JStack); cdecl;
    procedure getString(buf: JStringBuffer); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;

    { Property }
  end;

  TJParenthesis = class(TJavaGenericImport<JParenthesisClass, JParenthesis>) end;

  JParsedThingClass = interface(JObjectClass)
  ['{DDC1C567-0A3E-4C88-9ECC-CC616ABE094F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/ParsedThing')]
  JParsedThing = interface(IJavaInstance)
  ['{54649264-E1FB-4B62-BD45-0CDF45E74882}']
    { Property Methods }

    { methods }
    function read(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;

    { Property }
  end;

  TJParsedThing = class(TJavaGenericImport<JParsedThingClass, JParsedThing>) end;

  JParseItemClass = interface(JObjectClass)
  ['{14E63432-74BF-414C-849A-9B358B978A9F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JParseItem; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/ParseItem')]
  JParseItem = interface(JObject)
  ['{715358E8-1855-4EF3-BD22-53F891ECF0A9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJParseItem = class(TJavaGenericImport<JParseItemClass, JParseItem>) end;

  JParserClass = interface(JObjectClass)
  ['{8E0A3185-3738-44CA-A530-9C6593721DD2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Parser')]
  JParser = interface(IJavaInstance)
  ['{9A7984BB-81EB-435B-9760-66B6596970B4}']
    { Property Methods }

    { methods }
    procedure parse; cdecl;
    function getFormula: JString; cdecl;
    function getBytes: TJavaArray<Byte>; cdecl;
    procedure adjustRelativeCellReferences(P1: Integer; P2: Integer); cdecl;
    procedure columnInserted(P1: Integer; P2: Integer; P3: Boolean); cdecl;
    procedure columnRemoved(P1: Integer; P2: Integer; P3: Boolean); cdecl;
    procedure rowInserted(P1: Integer; P2: Integer; P3: Boolean); cdecl;
    procedure rowRemoved(P1: Integer; P2: Integer; P3: Boolean); cdecl;
    function handleImportedCellReferences: Boolean; cdecl;

    { Property }
  end;

  TJParser = class(TJavaGenericImport<JParserClass, JParser>) end;

  JPercentClass = interface(JUnaryOperatorClass) // or JObjectClass
  ['{0030C9FB-A687-444F-BE5B-4F469838A3AF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPercent; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Percent')]
  JPercent = interface(JUnaryOperator) // or JObject
  ['{3126B57C-B676-4605-B36F-B7FDEC86C5CE}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJPercent = class(TJavaGenericImport<JPercentClass, JPercent>) end;

  JPlusClass = interface(JStringOperatorClass) // or JObjectClass
  ['{6F54C7A6-C7E4-4493-8877-06241879E1D4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPlus; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Plus')]
  JPlus = interface(JStringOperator) // or JObject
  ['{E871F809-C632-42CC-948C-E2F0C54EE97A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPlus = class(TJavaGenericImport<JPlusClass, JPlus>) end;

  JPowerClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{5230EEB9-709E-4E5E-BB24-5EAE734347BC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPower; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Power')]
  JPower = interface(JBinaryOperator) // or JObject
  ['{1B36C995-13D9-40F8-9FC9-C615D3CD0394}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJPower = class(TJavaGenericImport<JPowerClass, JPower>) end;

  JRangeSeparatorClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{BF837634-88CF-4C20-AF20-E63B2D1B55E8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRangeSeparator; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/RangeSeparator')]
  JRangeSeparator = interface(JBinaryOperator) // or JObject
  ['{FA6C6BB3-2EDD-4578-9459-36E789E2E461}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJRangeSeparator = class(TJavaGenericImport<JRangeSeparatorClass, JRangeSeparator>) end;

  JSharedFormulaAreaClass = interface(JOperandClass) // or JObjectClass
  ['{79C1E6FA-CC04-4B9D-B56A-5A408646CFB2}']
    { static Property Methods }

    { static Methods }
    {class} function init(rt: JCell): JSharedFormulaArea; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/SharedFormulaArea')]
  JSharedFormulaArea = interface(JOperand) // or JObject
  ['{56F9A546-DD20-45C9-97E6-4A90F7090476}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJSharedFormulaArea = class(TJavaGenericImport<JSharedFormulaAreaClass, JSharedFormulaArea>) end;

  JSharedFormulaCellReferenceClass = interface(JOperandClass) // or JObjectClass
  ['{26BA0564-AD1B-411B-A79C-59AAF3EF8B13}']
    { static Property Methods }

    { static Methods }
    {class} function init(rt: JCell): JSharedFormulaCellReference; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/SharedFormulaCellReference')]
  JSharedFormulaCellReference = interface(JOperand) // or JObject
  ['{9B1EDB69-3566-40DD-A8BD-E8A2E3EE31B2}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getRow: Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJSharedFormulaCellReference = class(TJavaGenericImport<JSharedFormulaCellReferenceClass, JSharedFormulaCellReference>) end;

  JStringFormulaParserClass = interface(JObjectClass)
  ['{F1DEE199-5B74-40F5-A337-049D395BE139}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JString; es: JExternalSheet; nt: JWorkbookMethods; ws: JWorkbookSettings): JStringFormulaParser; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/StringFormulaParser')]
  JStringFormulaParser = interface(JObject)
  ['{3E189741-4918-42D0-8838-8A1C0A5D3E28}']
    { Property Methods }

    { methods }
    procedure parse; cdecl;
    function getFormula: JString; cdecl;
    function getBytes: TJavaArray<Byte>; cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;
    procedure columnInserted(sheetIndex: Integer; col: Integer; currentSheet: Boolean); cdecl;
    procedure columnRemoved(sheetIndex: Integer; col: Integer; currentSheet: Boolean); cdecl;
    procedure rowInserted(sheetIndex: Integer; row: Integer; currentSheet: Boolean); cdecl;
    procedure rowRemoved(sheetIndex: Integer; row: Integer; currentSheet: Boolean); cdecl;
    function handleImportedCellReferences: Boolean; cdecl;

    { Property }
  end;

  TJStringFormulaParser = class(TJavaGenericImport<JStringFormulaParserClass, JStringFormulaParser>) end;

  JStringFunctionClass = interface(JStringParseItemClass) // or JObjectClass
  ['{3115AEFF-4C91-479A-BAED-8406F291A0F2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/StringFunction')]
  JStringFunction = interface(JStringParseItem) // or JObject
  ['{8E4477CD-ADEB-4BFB-8D7C-D75CB7A89834}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStringFunction = class(TJavaGenericImport<JStringFunctionClass, JStringFunction>) end;

  JStringOperatorClass = interface(JOperatorClass) // or JObjectClass
  ['{150F2161-85D7-457C-A6F6-E1114D005690}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/StringOperator')]
  JStringOperator = interface(JOperator) // or JObject
  ['{9EDDA075-D786-4ABE-BB3C-2F010208393B}']
    { Property Methods }

    { methods }
    procedure getOperands(s: JStack); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;

    { Property }
  end;

  TJStringOperator = class(TJavaGenericImport<JStringOperatorClass, JStringOperator>) end;

  JStringParseItemClass = interface(JParseItemClass) // or JObjectClass
  ['{AC5F7FB2-57AB-45EC-BD43-AA2C0EB01EA9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/StringParseItem')]
  JStringParseItem = interface(JParseItem) // or JObject
  ['{BE4D10D3-280A-4108-96A6-C75A22146F1F}']
    { Property Methods }

    { methods }
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;

    { Property }
  end;

  TJStringParseItem = class(TJavaGenericImport<JStringParseItemClass, JStringParseItem>) end;

  JStringValueClass = interface(JOperandClass) // or JObjectClass
  ['{9674140C-9221-454D-B298-3D521385D9C3}']
    { static Property Methods }

    { static Methods }
    {class} function init(ws: JWorkbookSettings): JStringValue; cdecl; overload;
    {class} function init(s: JString): JStringValue; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/StringValue')]
  JStringValue = interface(JOperand) // or JObject
  ['{4A295227-B94E-42B4-99F1-21CF34C4CE83}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getString(buf: JStringBuffer); cdecl;

    { Property }
  end;

  TJStringValue = class(TJavaGenericImport<JStringValueClass, JStringValue>) end;

  JSubExpressionClass = interface(JOperandClass) // or JObjectClass
  ['{C9344AE7-59FE-4EEB-9E3F-B224983ACAE8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/SubExpression')]
  JSubExpression = interface(JOperand) // or JObject
  ['{FED13941-D5B0-4FE0-BEF6-6B7853CFF506}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getOperands(s: JStack); cdecl;
    function getLength: Integer; cdecl;
    procedure setSubExpression(pi: TJavaObjectArray<JParseItem>); cdecl;

    { Property }
  end;

  TJSubExpression = class(TJavaGenericImport<JSubExpressionClass, JSubExpression>) end;

  JSubtractClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{ABBB536B-5C75-4702-86E3-4C1E660369D6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSubtract; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Subtract')]
  JSubtract = interface(JBinaryOperator) // or JObject
  ['{342BC13C-E213-48D7-B5C6-D30E9CCDF25F}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJSubtract = class(TJavaGenericImport<JSubtractClass, JSubtract>) end;

  JTokenClass = interface(JObjectClass)
  ['{3460CB63-89BE-4F8F-B133-0CC63EC2163A}']
    { static Property Methods }
    {class} function _GetREF: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREF3D: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMISSING_ARG: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTRING: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERR: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOOL: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTEGER: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOUBLE: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREFERR: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREFV: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAREAV: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMEM_AREA: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAREA: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNAMED_RANGE: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNAME: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAREA3D: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNARY_PLUS: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNARY_MINUS: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPERCENT: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARENTHESIS: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetADD: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUBTRACT: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMULTIPLY: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDIVIDE: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPOWER: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONCAT: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLESS_THAN: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLESS_EQUAL: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEQUAL: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREATER_EQUAL: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREATER_THAN: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOT_EQUAL: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNION: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRANGE: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFUNCTION: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFUNCTIONVARARG: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetATTRIBUTE: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMEM_FUNC: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JToken;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getToken(v: Integer): JToken; cdecl;

    { static Property }
    {class} property REF: JToken read _GetREF;
    {class} property REF3D: JToken read _GetREF3D;
    {class} property MISSING_ARG: JToken read _GetMISSING_ARG;
    {class} property &STRING: JToken read _GetSTRING;
    {class} property ERR: JToken read _GetERR;
    {class} property BOOL: JToken read _GetBOOL;
    {class} property INTEGER: JToken read _GetINTEGER;
    {class} property DOUBLE: JToken read _GetDOUBLE;
    {class} property REFERR: JToken read _GetREFERR;
    {class} property REFV: JToken read _GetREFV;
    {class} property AREAV: JToken read _GetAREAV;
    {class} property MEM_AREA: JToken read _GetMEM_AREA;
    {class} property AREA: JToken read _GetAREA;
    {class} property NAMED_RANGE: JToken read _GetNAMED_RANGE;
    {class} property NAME: JToken read _GetNAME;
    {class} property AREA3D: JToken read _GetAREA3D;
    {class} property UNARY_PLUS: JToken read _GetUNARY_PLUS;
    {class} property UNARY_MINUS: JToken read _GetUNARY_MINUS;
    {class} property PERCENT: JToken read _GetPERCENT;
    {class} property PARENTHESIS: JToken read _GetPARENTHESIS;
    {class} property ADD: JToken read _GetADD;
    {class} property SUBTRACT: JToken read _GetSUBTRACT;
    {class} property MULTIPLY: JToken read _GetMULTIPLY;
    {class} property DIVIDE: JToken read _GetDIVIDE;
    {class} property POWER: JToken read _GetPOWER;
    {class} property CONCAT: JToken read _GetCONCAT;
    {class} property LESS_THAN: JToken read _GetLESS_THAN;
    {class} property LESS_EQUAL: JToken read _GetLESS_EQUAL;
    {class} property EQUAL: JToken read _GetEQUAL;
    {class} property GREATER_EQUAL: JToken read _GetGREATER_EQUAL;
    {class} property GREATER_THAN: JToken read _GetGREATER_THAN;
    {class} property NOT_EQUAL: JToken read _GetNOT_EQUAL;
    {class} property UNION: JToken read _GetUNION;
    {class} property RANGE: JToken read _GetRANGE;
    {class} property &FUNCTION: JToken read _GetFUNCTION;
    {class} property FUNCTIONVARARG: JToken read _GetFUNCTIONVARARG;
    {class} property ATTRIBUTE: JToken read _GetATTRIBUTE;
    {class} property MEM_FUNC: JToken read _GetMEM_FUNC;
    {class} property UNKNOWN: JToken read _GetUNKNOWN;
  end;

  [JavaSignature('jxl/biff/formula/Token')]
  JToken = interface(JObject)
  ['{37AD9CD3-2557-4A10-B3DE-D0B19BA51C50}']
    { Property Methods }
    function _Getvalue: TJavaArray<Integer>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setvalue(avalue: TJavaArray<Integer>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getCode: Byte; cdecl;
    function getCode2: Byte; cdecl;

    { Property }
    property value: TJavaArray<Integer> read _Getvalue write _Setvalue;
  end;

  TJToken = class(TJavaGenericImport<JTokenClass, JToken>) end;

  JTokenFormulaParserClass = interface(JObjectClass)
  ['{007D79AF-A04F-427F-9BCC-E0B548D2E53B}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: TJavaArray<Byte>; c: JCell; es: JExternalSheet; nt: JWorkbookMethods; ws: JWorkbookSettings): JTokenFormulaParser; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/TokenFormulaParser')]
  JTokenFormulaParser = interface(JObject)
  ['{3E019987-3352-4DEC-8F8B-50F6C10DDF28}']
    { Property Methods }

    { methods }
    procedure parse; cdecl;
    function getFormula: JString; cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;
    function getBytes: TJavaArray<Byte>; cdecl;
    procedure columnInserted(sheetIndex: Integer; col: Integer; currentSheet: Boolean); cdecl;
    procedure columnRemoved(sheetIndex: Integer; col: Integer; currentSheet: Boolean); cdecl;
    procedure rowInserted(sheetIndex: Integer; row: Integer; currentSheet: Boolean); cdecl;
    procedure rowRemoved(sheetIndex: Integer; row: Integer; currentSheet: Boolean); cdecl;
    function handleImportedCellReferences: Boolean; cdecl;

    { Property }
  end;

  TJTokenFormulaParser = class(TJavaGenericImport<JTokenFormulaParserClass, JTokenFormulaParser>) end;

  JUnaryMinusClass = interface(JUnaryOperatorClass) // or JObjectClass
  ['{73E3709F-0767-492A-B15F-10B65AC8C9B2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnaryMinus; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/UnaryMinus')]
  JUnaryMinus = interface(JUnaryOperator) // or JObject
  ['{D8CE3A78-7A92-4F09-8F77-2CF46CB94B25}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJUnaryMinus = class(TJavaGenericImport<JUnaryMinusClass, JUnaryMinus>) end;

  JUnaryOperatorClass = interface(JOperatorClass) // or JObjectClass
  ['{7DF055FA-735A-4C10-AFEA-901E59445078}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnaryOperator; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/UnaryOperator')]
  JUnaryOperator = interface(JOperator) // or JObject
  ['{A0BCB2C3-FB46-41E2-9B47-1FD2DF5591F4}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getOperands(s: JStack); cdecl;
    procedure getString(buf: JStringBuffer); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;

    { Property }
  end;

  TJUnaryOperator = class(TJavaGenericImport<JUnaryOperatorClass, JUnaryOperator>) end;

  JUnaryPlusClass = interface(JUnaryOperatorClass) // or JObjectClass
  ['{ED474BC6-DB82-43ED-B489-53BA8F7555BB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnaryPlus; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/UnaryPlus')]
  JUnaryPlus = interface(JUnaryOperator) // or JObject
  ['{DA027E5B-4759-49A2-96AA-2A0903373C45}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJUnaryPlus = class(TJavaGenericImport<JUnaryPlusClass, JUnaryPlus>) end;

  JUnionClass = interface(JBinaryOperatorClass) // or JObjectClass
  ['{AF5EC63F-9729-4CA9-AA4F-C2E2342D25D6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnion; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/Union')]
  JUnion = interface(JBinaryOperator) // or JObject
  ['{48E93132-BFCA-49A8-84B2-B59EA06768E7}']
    { Property Methods }

    { methods }
    function getSymbol: JString; cdecl;

    { Property }
  end;

  TJUnion = class(TJavaGenericImport<JUnionClass, JUnion>) end;

  JVariableArgFunctionClass = interface(JOperatorClass) // or JObjectClass
  ['{D1DE9E4B-7DAF-4AE0-86E6-E40E7A2D862F}']
    { static Property Methods }

    { static Methods }
    {class} function init(ws: JWorkbookSettings): JVariableArgFunction; cdecl; overload;
    {class} function init(f: JFunction; a: Integer; ws: JWorkbookSettings): JVariableArgFunction; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/formula/VariableArgFunction')]
  JVariableArgFunction = interface(JOperator) // or JObject
  ['{DE43C646-4DFF-4332-976B-BD9D029CE28A}']
    { Property Methods }

    { methods }
    function read(data: TJavaArray<Byte>; pos: Integer): Integer; cdecl;
    procedure getOperands(s: JStack); cdecl;
    procedure getString(buf: JStringBuffer); cdecl;
    procedure adjustRelativeCellReferences(colAdjust: Integer; rowAdjust: Integer); cdecl;

    { Property }
  end;

  TJVariableArgFunction = class(TJavaGenericImport<JVariableArgFunctionClass, JVariableArgFunction>) end;

  JYylexClass = interface(JObjectClass)
  ['{E4BFDCF7-42D2-43FC-8626-0D17496B4210}']
    { static Property Methods }
    {class} function _GetYYEOF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetYYSTRING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetYYINITIAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property YYEOF: Integer read _GetYYEOF;
    {class} property YYSTRING: Integer read _GetYYSTRING;
    {class} property YYINITIAL: Integer read _GetYYINITIAL;
  end;

  [JavaSignature('jxl/biff/formula/Yylex')]
  JYylex = interface(JObject)
  ['{2346FED5-E479-4755-B650-16F7A660FB80}']
    { Property Methods }

    { methods }
    procedure yyclose; cdecl;
    procedure yyreset(reader: JReader); cdecl;
    function yystate: Integer; cdecl;
    procedure yybegin(newState: Integer); cdecl;
    function yytext: JString; cdecl;
    function yycharat(pos: Integer): Char; cdecl;
    function yylength: Integer; cdecl;
    procedure yypushback(number: Integer); cdecl;
    function yylex: JParseItem; cdecl;

    { Property }
  end;

  TJYylex = class(TJavaGenericImport<JYylexClass, JYylex>) end;

  JFormulaDataClass = interface(JObjectClass)
  ['{95D0A5B0-E99F-4DBB-B5AC-7AC799D61025}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/FormulaData')]
  JFormulaData = interface(IJavaInstance)
  ['{E9AC6802-49F4-4319-BBE2-7208EBC91858}']
    { Property Methods }

    { methods }
    function getFormulaData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJFormulaData = class(TJavaGenericImport<JFormulaDataClass, JFormulaData>) end;

  JHeaderFooter_ContentsClass = interface(JObjectClass)
  ['{6C9FF5D3-FDE6-4905-9C8D-EED80C6DA1F6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/HeaderFooter$Contents')]
  JHeaderFooter_Contents = interface(JObject)
  ['{A3905A59-0B46-4C0D-BBAC-9290EDBA78A8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHeaderFooter_Contents = class(TJavaGenericImport<JHeaderFooter_ContentsClass, JHeaderFooter_Contents>) end;

  JHeaderFooterClass = interface(JObjectClass)
  ['{81A796EA-85B0-4621-9CC3-7309F46B9057}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/HeaderFooter')]
  JHeaderFooter = interface(JObject)
  ['{4EA47A78-B65F-4B56-817F-5CBC0C14B350}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;

    { Property }
  end;

  TJHeaderFooter = class(TJavaGenericImport<JHeaderFooterClass, JHeaderFooter>) end;

  JIndexMappingClass = interface(JObjectClass)
  ['{74EFB6A0-122A-427E-ADA7-D746060C1256}']
    { static Property Methods }

    { static Methods }
    {class} function init(size: Integer): JIndexMapping; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/IndexMapping')]
  JIndexMapping = interface(JObject)
  ['{D0385062-1E15-429B-9BA1-2C5DDECDEA62}']
    { Property Methods }

    { methods }
    procedure setMapping(oldIndex: Integer; newIndex: Integer); cdecl;
    function getNewIndex(oldIndex: Integer): Integer; cdecl;

    { Property }
  end;

  TJIndexMapping = class(TJavaGenericImport<JIndexMappingClass, JIndexMapping>) end;

  JIntegerHelperClass = interface(JObjectClass)
  ['{F05752C9-A175-43D8-8539-7694FF8E13AC}']
    { static Property Methods }

    { static Methods }
    {class} function getInt(b1: Byte; b2: Byte): Integer; cdecl; overload;
    {class} function getShort(b1: Byte; b2: Byte): Word; cdecl;
    {class} function getInt(b1: Byte; b2: Byte; b3: Byte; b4: Byte): Integer; cdecl; overload;
    {class} function getTwoBytes(i: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} function getFourBytes(i: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} procedure getTwoBytes(i: Integer; target: TJavaArray<Byte>; pos: Integer); cdecl; overload;
    {class} procedure getFourBytes(i: Integer; target: TJavaArray<Byte>; pos: Integer); cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/IntegerHelper')]
  JIntegerHelper = interface(JObject)
  ['{C0C9DC7E-9F1A-4CBB-9319-8A89A2C5F6B3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIntegerHelper = class(TJavaGenericImport<JIntegerHelperClass, JIntegerHelper>) end;

  JNumFormatRecordsExceptionClass = interface(JExceptionClass) // or JObjectClass
  ['{FC2CAD3A-7D16-49E1-A324-0282BD717353}']
    { static Property Methods }

    { static Methods }
    {class} function init: JNumFormatRecordsException; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/NumFormatRecordsException')]
  JNumFormatRecordsException = interface(JException) // or JObject
  ['{D1648B67-99D4-4C2C-B343-82CAE7A9017F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNumFormatRecordsException = class(TJavaGenericImport<JNumFormatRecordsExceptionClass, JNumFormatRecordsException>) end;

  JPaletteRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{B1487F94-194F-4EC7-AA73-C399A63FB4FC}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JPaletteRecord; cdecl; overload;
    {class} function init: JPaletteRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/PaletteRecord')]
  JPaletteRecord = interface(JWritableRecordData) // or JObject
  ['{E624B27E-9C16-462A-9055-84A0402A761C}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function isDirty: Boolean; cdecl;
    procedure setColourRGB(c: JColour; r: Integer; g: Integer; b: Integer); cdecl;
    function getColourRGB(c: JColour): JRGB; cdecl;

    { Property }
  end;

  TJPaletteRecord = class(TJavaGenericImport<JPaletteRecordClass, JPaletteRecord>) end;

  JRangeImplClass = interface(JObjectClass)
  ['{9B420097-099B-40D5-B811-A1D3A4D1D467}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: JWorkbookMethods; s1: Integer; c1: Integer; r1: Integer; s2: Integer; c2: Integer; r2: Integer): JRangeImpl; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/biff/RangeImpl')]
  JRangeImpl = interface(JObject)
  ['{DB066933-DC8E-47BD-A398-7D9EE540D8A0}']
    { Property Methods }

    { methods }
    function getTopLeft: JCell; cdecl;
    function getBottomRight: JCell; cdecl;
    function getFirstSheetIndex: Integer; cdecl;
    function getLastSheetIndex: Integer; cdecl;

    { Property }
  end;

  TJRangeImpl = class(TJavaGenericImport<JRangeImplClass, JRangeImpl>) end;

  JRecordDataClass = interface(JObjectClass)
  ['{E5E4611C-4306-482A-84DB-2354537B607C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/RecordData')]
  JRecordData = interface(JObject)
  ['{93D695A7-4D20-454F-A1D1-92D078732591}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRecordData = class(TJavaGenericImport<JRecordDataClass, JRecordData>) end;

  JSheetRangeImplClass = interface(JObjectClass)
  ['{D66DD6A4-A9A8-4B9A-9B45-E45A003AD9CC}']
    { static Property Methods }

    { static Methods }
    {class} function init(s: JSheet; c1: Integer; r1: Integer; c2: Integer; r2: Integer): JSheetRangeImpl; cdecl; overload;
    {class} function init(c: JSheetRangeImpl; s: JSheet): JSheetRangeImpl; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/SheetRangeImpl')]
  JSheetRangeImpl = interface(JObject)
  ['{E5649E82-5760-48DD-A01A-78BF92BB36C5}']
    { Property Methods }

    { methods }
    function getTopLeft: JCell; cdecl;
    function getBottomRight: JCell; cdecl;
    function getFirstSheetIndex: Integer; cdecl;
    function getLastSheetIndex: Integer; cdecl;
    function intersects(range: JSheetRangeImpl): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure insertRow(r: Integer); cdecl;
    procedure insertColumn(c: Integer); cdecl;
    procedure removeRow(r: Integer); cdecl;
    procedure removeColumn(c: Integer); cdecl;
    function hashCode: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;

    { Property }
  end;

  TJSheetRangeImpl = class(TJavaGenericImport<JSheetRangeImplClass, JSheetRangeImpl>) end;

  JStringHelperClass = interface(JObjectClass)
  ['{E8A61303-6E92-467F-8EA5-09DB16A0BEAA}']
    { static Property Methods }
    {class} function _GetUNICODE_ENCODING: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getBytes(s: JString): TJavaArray<Byte>; cdecl; overload; //Deprecated
    {class} function getBytes(s: JString; ws: JWorkbookSettings): TJavaArray<Byte>; cdecl; overload;
    {class} function getUnicodeBytes(s: JString): TJavaArray<Byte>; cdecl; overload;
    {class} procedure getBytes(s: JString; d: TJavaArray<Byte>; pos: Integer); cdecl; overload;
    {class} procedure getUnicodeBytes(s: JString; d: TJavaArray<Byte>; pos: Integer); cdecl; overload;
    {class} function getString(d: TJavaArray<Byte>; length: Integer; pos: Integer; ws: JWorkbookSettings): JString; cdecl;
    {class} function getUnicodeString(d: TJavaArray<Byte>; length: Integer; pos: Integer): JString; cdecl;
    {class} function replace(input: JString; search: JString; replace: JString): JString; cdecl;

    { static Property }
    {class} property UNICODE_ENCODING: JString read _GetUNICODE_ENCODING;
  end;

  [JavaSignature('jxl/biff/StringHelper')]
  JStringHelper = interface(JObject)
  ['{C91CBA55-5397-4F18-A5C1-599D6B3BEA6D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStringHelper = class(TJavaGenericImport<JStringHelperClass, JStringHelper>) end;

  JType_1Class = interface(JObjectClass)
  ['{52255A61-FC38-4737-9C6E-442475FCDE49}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/Type$1')]
  JType_1 = interface(JObject)
  ['{521CEFB3-2DD9-4C76-9182-1C93766B328A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJType_1 = class(TJavaGenericImport<JType_1Class, JType_1>) end;

  JType_ArbitraryTypeClass = interface(JObjectClass)
  ['{A9AA3642-A0CA-4613-8D3C-CED53E86A628}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/Type$ArbitraryType')]
  JType_ArbitraryType = interface(JObject)
  ['{A24141EB-8460-43C9-971F-F865E191E80B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJType_ArbitraryType = class(TJavaGenericImport<JType_ArbitraryTypeClass, JType_ArbitraryType>) end;

  JTypeClass = interface(JObjectClass)
  ['{0E0DBCD7-3B57-4308-8304-38F285812A1C}']
    { static Property Methods }
    {class} function _GetBOF: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEOF: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOUNDSHEET: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUPBOOK: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXTERNSHEET: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDIMENSION: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBLANK: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMULBLANK: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetROW: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOTE: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTXO: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRK: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRK2: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMULRK: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDEX: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDBCELL: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSST: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOLINFO: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXTSST: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONTINUE: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLABEL: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRSTRING: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLABELSST: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNUMBER: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNAME: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTABID: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetARRAY: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTRING: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMULA: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMULA2: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSHAREDFORMULA: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetXF: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOOLERR: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTERFACEHDR: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSAVERECALC: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTERFACEEND: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetXCT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCRN: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFCOLWIDTH: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULTROWHEIGHT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWRITEACCESS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWSBOOL: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODEPAGE: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDSF: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFNGROUPCOUNT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFILTERMODE: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTOFILTERINFO: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTOFILTER: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOUNTRY: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPROTECT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCENPROTECT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOBJPROTECT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTHEADERS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHEADER: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFOOTER: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHCENTER: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVCENTER: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFILEPASS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSETUP: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRINTGRIDLINES: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGRIDSET: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGUTS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWINDOWPROTECT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPROT4REV: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPROT4REVPASS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPASSWORD: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREFRESHALL: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWINDOW1: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWINDOW2: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBACKUP: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHIDEOBJ: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNINETEENFOUR: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPRECISION: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOOKBOOL: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFONT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMMS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCALCMODE: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCALCCOUNT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREFMODE: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEMPLATE: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOBJPROJ: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDELTA: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMERGEDCELLS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetITERATION: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTYLE: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUSESELFS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERTICALPAGEBREAKS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHORIZONTALPAGEBREAKS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSELECTION: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHLINK: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOBJ: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMSODRAWING: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMSODRAWINGGROUP: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEFTMARGIN: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRIGHTMARGIN: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOPMARGIN: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOTTOMMARGIN: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXTERNNAME: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPALETTE: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPLS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCL: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPANE: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWEIRD1: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSORT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCONDFMT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCF: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDV: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDVAL: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUTTONPROPERTYSET: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFONTX: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIFMT: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFBI: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALRUNS: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSERIES: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSERIESLIST: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSBASEREF: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetU1C0: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetU1C1: JType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getType(v: Integer): JType; cdecl;
    {class} function createType(v: Integer): JType; cdecl;

    { static Property }
    {class} property BOF: JType read _GetBOF;
    {class} property EOF: JType read _GetEOF;
    {class} property BOUNDSHEET: JType read _GetBOUNDSHEET;
    {class} property SUPBOOK: JType read _GetSUPBOOK;
    {class} property EXTERNSHEET: JType read _GetEXTERNSHEET;
    {class} property DIMENSION: JType read _GetDIMENSION;
    {class} property BLANK: JType read _GetBLANK;
    {class} property MULBLANK: JType read _GetMULBLANK;
    {class} property ROW: JType read _GetROW;
    {class} property NOTE: JType read _GetNOTE;
    {class} property TXO: JType read _GetTXO;
    {class} property RK: JType read _GetRK;
    {class} property RK2: JType read _GetRK2;
    {class} property MULRK: JType read _GetMULRK;
    {class} property INDEX: JType read _GetINDEX;
    {class} property DBCELL: JType read _GetDBCELL;
    {class} property SST: JType read _GetSST;
    {class} property COLINFO: JType read _GetCOLINFO;
    {class} property EXTSST: JType read _GetEXTSST;
    {class} property CONTINUE: JType read _GetCONTINUE;
    {class} property &LABEL: JType read _GetLABEL;
    {class} property RSTRING: JType read _GetRSTRING;
    {class} property LABELSST: JType read _GetLABELSST;
    {class} property NUMBER: JType read _GetNUMBER;
    {class} property NAME: JType read _GetNAME;
    {class} property TABID: JType read _GetTABID;
    {class} property &ARRAY: JType read _GetARRAY;
    {class} property &STRING: JType read _GetSTRING;
    {class} property FORMULA: JType read _GetFORMULA;
    {class} property FORMULA2: JType read _GetFORMULA2;
    {class} property SHAREDFORMULA: JType read _GetSHAREDFORMULA;
    {class} property FORMAT: JType read _GetFORMAT;
    {class} property XF: JType read _GetXF;
    {class} property BOOLERR: JType read _GetBOOLERR;
    {class} property INTERFACEHDR: JType read _GetINTERFACEHDR;
    {class} property SAVERECALC: JType read _GetSAVERECALC;
    {class} property INTERFACEEND: JType read _GetINTERFACEEND;
    {class} property XCT: JType read _GetXCT;
    {class} property CRN: JType read _GetCRN;
    {class} property DEFCOLWIDTH: JType read _GetDEFCOLWIDTH;
    {class} property DEFAULTROWHEIGHT: JType read _GetDEFAULTROWHEIGHT;
    {class} property WRITEACCESS: JType read _GetWRITEACCESS;
    {class} property WSBOOL: JType read _GetWSBOOL;
    {class} property CODEPAGE: JType read _GetCODEPAGE;
    {class} property DSF: JType read _GetDSF;
    {class} property FNGROUPCOUNT: JType read _GetFNGROUPCOUNT;
    {class} property FILTERMODE: JType read _GetFILTERMODE;
    {class} property AUTOFILTERINFO: JType read _GetAUTOFILTERINFO;
    {class} property AUTOFILTER: JType read _GetAUTOFILTER;
    {class} property COUNTRY: JType read _GetCOUNTRY;
    {class} property PROTECT: JType read _GetPROTECT;
    {class} property SCENPROTECT: JType read _GetSCENPROTECT;
    {class} property OBJPROTECT: JType read _GetOBJPROTECT;
    {class} property PRINTHEADERS: JType read _GetPRINTHEADERS;
    {class} property HEADER: JType read _GetHEADER;
    {class} property FOOTER: JType read _GetFOOTER;
    {class} property HCENTER: JType read _GetHCENTER;
    {class} property VCENTER: JType read _GetVCENTER;
    {class} property FILEPASS: JType read _GetFILEPASS;
    {class} property SETUP: JType read _GetSETUP;
    {class} property PRINTGRIDLINES: JType read _GetPRINTGRIDLINES;
    {class} property GRIDSET: JType read _GetGRIDSET;
    {class} property GUTS: JType read _GetGUTS;
    {class} property WINDOWPROTECT: JType read _GetWINDOWPROTECT;
    {class} property PROT4REV: JType read _GetPROT4REV;
    {class} property PROT4REVPASS: JType read _GetPROT4REVPASS;
    {class} property PASSWORD: JType read _GetPASSWORD;
    {class} property REFRESHALL: JType read _GetREFRESHALL;
    {class} property WINDOW1: JType read _GetWINDOW1;
    {class} property WINDOW2: JType read _GetWINDOW2;
    {class} property BACKUP: JType read _GetBACKUP;
    {class} property HIDEOBJ: JType read _GetHIDEOBJ;
    {class} property NINETEENFOUR: JType read _GetNINETEENFOUR;
    {class} property PRECISION: JType read _GetPRECISION;
    {class} property BOOKBOOL: JType read _GetBOOKBOOL;
    {class} property FONT: JType read _GetFONT;
    {class} property MMS: JType read _GetMMS;
    {class} property CALCMODE: JType read _GetCALCMODE;
    {class} property CALCCOUNT: JType read _GetCALCCOUNT;
    {class} property REFMODE: JType read _GetREFMODE;
    {class} property TEMPLATE: JType read _GetTEMPLATE;
    {class} property OBJPROJ: JType read _GetOBJPROJ;
    {class} property DELTA: JType read _GetDELTA;
    {class} property MERGEDCELLS: JType read _GetMERGEDCELLS;
    {class} property ITERATION: JType read _GetITERATION;
    {class} property STYLE: JType read _GetSTYLE;
    {class} property USESELFS: JType read _GetUSESELFS;
    {class} property VERTICALPAGEBREAKS: JType read _GetVERTICALPAGEBREAKS;
    {class} property HORIZONTALPAGEBREAKS: JType read _GetHORIZONTALPAGEBREAKS;
    {class} property SELECTION: JType read _GetSELECTION;
    {class} property HLINK: JType read _GetHLINK;
    {class} property OBJ: JType read _GetOBJ;
    {class} property MSODRAWING: JType read _GetMSODRAWING;
    {class} property MSODRAWINGGROUP: JType read _GetMSODRAWINGGROUP;
    {class} property LEFTMARGIN: JType read _GetLEFTMARGIN;
    {class} property RIGHTMARGIN: JType read _GetRIGHTMARGIN;
    {class} property TOPMARGIN: JType read _GetTOPMARGIN;
    {class} property BOTTOMMARGIN: JType read _GetBOTTOMMARGIN;
    {class} property EXTERNNAME: JType read _GetEXTERNNAME;
    {class} property PALETTE: JType read _GetPALETTE;
    {class} property PLS: JType read _GetPLS;
    {class} property SCL: JType read _GetSCL;
    {class} property PANE: JType read _GetPANE;
    {class} property WEIRD1: JType read _GetWEIRD1;
    {class} property SORT: JType read _GetSORT;
    {class} property CONDFMT: JType read _GetCONDFMT;
    {class} property CF: JType read _GetCF;
    {class} property DV: JType read _GetDV;
    {class} property DVAL: JType read _GetDVAL;
    {class} property BUTTONPROPERTYSET: JType read _GetBUTTONPROPERTYSET;
    {class} property FONTX: JType read _GetFONTX;
    {class} property IFMT: JType read _GetIFMT;
    {class} property FBI: JType read _GetFBI;
    {class} property ALRUNS: JType read _GetALRUNS;
    {class} property SERIES: JType read _GetSERIES;
    {class} property SERIESLIST: JType read _GetSERIESLIST;
    {class} property SBASEREF: JType read _GetSBASEREF;
    {class} property UNKNOWN: JType read _GetUNKNOWN;
    {class} property U1C0: JType read _GetU1C0;
    {class} property U1C1: JType read _GetU1C1;
  end;

  [JavaSignature('jxl/biff/Type')]
  JType = interface(JObject)
  ['{C55B5B49-38F2-4E36-A826-29FAE59BA5DE}']
    { Property Methods }
    function _Getvalue: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setvalue(avalue: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function hashCode: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;

    { Property }
    property value: Integer read _Getvalue write _Setvalue;
  end;

  TJType = class(TJavaGenericImport<JTypeClass, JType>) end;

  JWorkbookMethodsClass = interface(JObjectClass)
  ['{0CA80665-3DBA-49A8-89C0-E549529A1559}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/WorkbookMethods')]
  JWorkbookMethods = interface(IJavaInstance)
  ['{3F738EBA-4829-4429-A74D-7753E32E8EA0}']
    { Property Methods }

    { methods }
    function getReadSheet(P1: Integer): JSheet; cdecl;
    function getName(P1: Integer): JString; cdecl;
    function getNameIndex(P1: JString): Integer; cdecl;

    { Property }
  end;

  TJWorkbookMethods = class(TJavaGenericImport<JWorkbookMethodsClass, JWorkbookMethods>) end;

  JWorkspaceInformationRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{E7382CEB-E304-4EDD-A65A-2FF354C70351}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JWorkspaceInformationRecord; cdecl; overload;
    {class} function init: JWorkspaceInformationRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/biff/WorkspaceInformationRecord')]
  JWorkspaceInformationRecord = interface(JWritableRecordData) // or JObject
  ['{ECC79F6A-935C-4FEB-872F-96AB6DD7579D}']
    { Property Methods }

    { methods }
    function getFitToPages: Boolean; cdecl;
    procedure setFitToPages(b: Boolean); cdecl;
    procedure setRowOutlines(ro: Boolean); cdecl;
    procedure setColumnOutlines(ro: Boolean); cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJWorkspaceInformationRecord = class(TJavaGenericImport<JWorkspaceInformationRecordClass, JWorkspaceInformationRecord>) end;

  JWritableRecordDataClass = interface(JRecordDataClass) // or JObjectClass
  ['{9B4A88C8-DA0E-4C64-8443-FF3AE4CD997C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/WritableRecordData')]
  JWritableRecordData = interface(JRecordData) // or JObject
  ['{8354F521-FBC6-416A-ADCB-A9D24CE0BFE0}']
    { Property Methods }

    { methods }
    function getBytes: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJWritableRecordData = class(TJavaGenericImport<JWritableRecordDataClass, JWritableRecordData>) end;

  JXFRecord_1Class = interface(JObjectClass)
  ['{2005EFFB-1804-4A0B-8CDD-FA3A5648A3C2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/XFRecord$1')]
  JXFRecord_1 = interface(JObject)
  ['{602EA749-A795-4314-8D19-9FC89D41714F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJXFRecord_1 = class(TJavaGenericImport<JXFRecord_1Class, JXFRecord_1>) end;

  JXFRecord_BiffTypeClass = interface(JObjectClass)
  ['{3DA478ED-6E8F-4A62-A33B-9772B8D64D2F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/XFRecord$BiffType')]
  JXFRecord_BiffType = interface(JObject)
  ['{945ACAA8-44EC-4303-8436-BC0B7096CDF3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJXFRecord_BiffType = class(TJavaGenericImport<JXFRecord_BiffTypeClass, JXFRecord_BiffType>) end;

  JXFRecord_XFTypeClass = interface(JObjectClass)
  ['{FB2C3F4F-68D7-4071-9ED4-AE786C3FBD4E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/biff/XFRecord$XFType')]
  JXFRecord_XFType = interface(JObject)
  ['{3B010D88-D85E-4679-8483-B63C28B9719E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJXFRecord_XFType = class(TJavaGenericImport<JXFRecord_XFTypeClass, JXFRecord_XFType>) end;

  JXFRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{31C7468B-F1C0-4256-B20B-25056247E8E3}']
    { static Property Methods }
    {class} function _Getbiff8: JXFRecord_BiffType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getbiff7: JXFRecord_BiffType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord; ws: JWorkbookSettings; bt: JXFRecord_BiffType): JXFRecord; cdecl; overload;
    {class} function init(fnt: JFontRecord; form: JDisplayFormat): JXFRecord; cdecl; overload;

    { static Property }
    {class} property biff8: JXFRecord_BiffType read _Getbiff8;
    {class} property biff7: JXFRecord_BiffType read _Getbiff7;
  end;

  [JavaSignature('jxl/biff/XFRecord')]
  JXFRecord = interface(JWritableRecordData) // or JObject
  ['{5CE6C533-E323-4924-BE05-F8D721ACFF90}']
    { Property Methods }
    function _GetformatIndex: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetformatIndex(aformatIndex: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getDateFormat: JDateFormat; cdecl;
    function getNumberFormat: JNumberFormat; cdecl;
    function getFormatRecord: Integer; cdecl;
    function isDate: Boolean; cdecl;
    function isNumber: Boolean; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function getAlignment: JAlignment; cdecl;
    function getIndentation: Integer; cdecl;
    function isShrinkToFit: Boolean; cdecl;
    function isLocked: Boolean; cdecl;
    function getVerticalAlignment: JVerticalAlignment; cdecl;
    function getOrientation: JOrientation; cdecl;
    function getBackgroundColour: JColour; cdecl;
    function getPattern: JPattern; cdecl;
    function getWrap: Boolean; cdecl;
    function getBorder(border: JBorder): JBorderLineStyle; cdecl;
    function getBorderLine(border: JBorder): JBorderLineStyle; cdecl;
    function getBorderColour(border: JBorder): JColour; cdecl;
    function hasBorders: Boolean; cdecl;
    procedure initialize(pos: Integer; fr: JFormattingRecords; fonts: JFonts); cdecl;
    procedure uninitialize; cdecl;
    function getXFIndex: Integer; cdecl;
    function isInitialized: Boolean; cdecl;
    function isRead: Boolean; cdecl;
    function getFormat: JFormat; cdecl;
    function getFont: JFont; cdecl;
    function hashCode: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getFontIndex: Integer; cdecl;
    procedure setFont(f: JFontRecord); cdecl;

    { Property }
    property formatIndex: Integer read _GetformatIndex write _SetformatIndex;
  end;

  TJXFRecord = class(TJavaGenericImport<JXFRecordClass, JXFRecord>) end;

  JBooleanCellClass = interface(JObjectClass)
  ['{7621823E-A44A-4A93-8546-869461643CE7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/BooleanCell')]
  JBooleanCell = interface(IJavaInstance)
  ['{8C0C3793-0AEA-4BC2-8E2A-3061A493ADF3}']
    { Property Methods }

    { methods }
    function getValue: Boolean; cdecl;

    { Property }
  end;

  TJBooleanCell = class(TJavaGenericImport<JBooleanCellClass, JBooleanCell>) end;

  JBooleanFormulaCellClass = interface(JObjectClass)
  ['{F449D0DF-084B-4E75-A162-69BAF1F5AB08}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/BooleanFormulaCell')]
  JBooleanFormulaCell = interface(IJavaInstance)
  ['{6A184A86-7434-49F0-8CFA-9912507CB029}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBooleanFormulaCell = class(TJavaGenericImport<JBooleanFormulaCellClass, JBooleanFormulaCell>) end;

  JCellClass = interface(JObjectClass)
  ['{F7FF168B-000D-4BED-BF6D-88F919EC0A13}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/Cell')]
  JCell = interface(IJavaInstance)
  ['{DBAFA0C8-3EBA-4C23-B675-AD041FAF745E}']
    { Property Methods }

    { methods }
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getType: JCellType; cdecl;
    function isHidden: Boolean; cdecl;
    function getContents: JString; cdecl;
    function getCellFormat: JCellFormat; cdecl;
    function getCellFeatures: JCellFeatures; cdecl;

    { Property }
  end;

  TJCell = class(TJavaGenericImport<JCellClass, JCell>) end;

  JCellFeaturesClass = interface(JBaseCellFeaturesClass) // or JObjectClass
  ['{4D211E44-1A35-498F-92BF-DCA732A9943D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCellFeatures; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/CellFeatures')]
  JCellFeatures = interface(JBaseCellFeatures) // or JObject
  ['{3B72DF68-21BF-4F40-9AE5-B465D398A2EB}']
    { Property Methods }

    { methods }
    function getComment: JString; cdecl;
    function getDataValidationList: JString; cdecl;

    { Property }
  end;

  TJCellFeatures = class(TJavaGenericImport<JCellFeaturesClass, JCellFeatures>) end;

  JCellFormatClass = interface(JObjectClass)
  ['{B9DD10FE-9221-4E61-B8BE-57236EF82D7A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/CellFormat')]
  JCellFormat = interface(IJavaInstance)
  ['{A9E8036B-D346-4F0B-B93E-BC098DAB041B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCellFormat = class(TJavaGenericImport<JCellFormatClass, JCellFormat>) end;

  JCellReferenceHelper_190Class = interface(JObjectClass)
  ['{C06C7669-EC4A-4914-94AF-372993B749EF}']
    { static Property Methods }

    { static Methods }
    {class} procedure getCellReference(column: Integer; row: Integer; buf: JStringBuffer); cdecl; overload;
    {class} procedure getCellReference(column: Integer; colabs: Boolean; row: Integer; rowabs: Boolean; buf: JStringBuffer); cdecl; overload;
    {class} function getCellReference(column: Integer; row: Integer): JString; cdecl; overload;
    {class} function getColumn(s: JString): Integer; cdecl;
    {class} function getColumnReference(c: Integer): JString; cdecl;
    {class} function getRow(s: JString): Integer; cdecl;
    {class} function isColumnRelative(s: JString): Boolean; cdecl;
    {class} function isRowRelative(s: JString): Boolean; cdecl;
    {class} procedure getCellReference(sheet: Integer; column: Integer; row: Integer; workbook: JWorkbook; buf: JStringBuffer); cdecl; overload;
    {class} procedure getCellReference(sheet: Integer; column: Integer; row: Integer; workbook: JWritableWorkbook; buf: JStringBuffer); cdecl; overload;
    {class} procedure getCellReference(sheet: Integer; column: Integer; colabs: Boolean; row: Integer; rowabs: Boolean; workbook: JWorkbook; buf: JStringBuffer); cdecl; overload;
    {class} function getCellReference(sheet: Integer; column: Integer; row: Integer; workbook: JWorkbook): JString; cdecl; overload;
    {class} function getCellReference(sheet: Integer; column: Integer; row: Integer; workbook: JWritableWorkbook): JString; cdecl; overload;
    {class} function getSheet(ref: JString): JString; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/CellReferenceHelper')]
  JCellReferenceHelper_190 = interface(JObject)
  ['{0B71D2E4-62FD-4C81-8078-C56DB2B09AA8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCellReferenceHelper_190 = class(TJavaGenericImport<JCellReferenceHelper_190Class, JCellReferenceHelper_190>) end;

  JCellTypeClass = interface(JObjectClass)
  ['{F01DBA3F-6F9C-4B1E-BCBD-C7852368B70C}']
    { static Property Methods }
    {class} function _GetEMPTY: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLABEL: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNUMBER: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOOLEAN: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNUMBER_FORMULA: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATE_FORMULA: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTRING_FORMULA: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOOLEAN_FORMULA: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMULA_ERROR: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATE: JCellType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property EMPTY: JCellType read _GetEMPTY;
    {class} property &LABEL: JCellType read _GetLABEL;
    {class} property NUMBER: JCellType read _GetNUMBER;
    {class} property BOOLEAN: JCellType read _GetBOOLEAN;
    {class} property ERROR: JCellType read _GetERROR;
    {class} property NUMBER_FORMULA: JCellType read _GetNUMBER_FORMULA;
    {class} property DATE_FORMULA: JCellType read _GetDATE_FORMULA;
    {class} property STRING_FORMULA: JCellType read _GetSTRING_FORMULA;
    {class} property BOOLEAN_FORMULA: JCellType read _GetBOOLEAN_FORMULA;
    {class} property FORMULA_ERROR: JCellType read _GetFORMULA_ERROR;
    {class} property DATE: JCellType read _GetDATE;
  end;

  [JavaSignature('jxl/CellType')]
  JCellType = interface(JObject)
  ['{53121D97-B918-4DD4-9095-D6EA5A1ABB22}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;

    { Property }
  end;

  TJCellType = class(TJavaGenericImport<JCellTypeClass, JCellType>) end;

  JCellViewClass = interface(JObjectClass)
  ['{C3D82375-06F1-475A-8616-ECB85B6B04BC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCellView; cdecl; overload;
    {class} function init(cv: JCellView): JCellView; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/CellView')]
  JCellView = interface(JObject)
  ['{BD9C0EE3-E961-4553-92CC-A59E9277B49D}']
    { Property Methods }

    { methods }
    procedure setHidden(h: Boolean); cdecl;
    function isHidden: Boolean; cdecl;
    procedure setDimension(d: Integer); cdecl; //Deprecated
    procedure setSize(d: Integer); cdecl;
    function getDimension: Integer; cdecl; //Deprecated
    function getSize: Integer; cdecl;
    procedure setFormat(cf: JCellFormat); cdecl;
    function getFormat: JCellFormat; cdecl;
    function depUsed: Boolean; cdecl;
    procedure setAutosize(a: Boolean); cdecl;
    function isAutosize: Boolean; cdecl;

    { Property }
  end;

  TJCellView = class(TJavaGenericImport<JCellViewClass, JCellView>) end;

  JDateCellClass = interface(JObjectClass)
  ['{0037298A-1129-407E-8037-0ABE63C0E856}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/DateCell')]
  JDateCell = interface(IJavaInstance)
  ['{E0922621-028A-404E-8771-208B055877C4}']
    { Property Methods }

    { methods }
    function getDate: JDate; cdecl;
    function isTime: Boolean; cdecl;
    function getDateFormat: JDateFormat; cdecl;

    { Property }
  end;

  TJDateCell = class(TJavaGenericImport<JDateCellClass, JDateCell>) end;

  JDateFormulaCellClass = interface(JObjectClass)
  ['{DA5D2DAC-1525-4FCE-9500-6D48CC91E0AD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/DateFormulaCell')]
  JDateFormulaCell = interface(IJavaInstance)
  ['{34ECB8C3-8661-4C81-AE3B-63FA83E168C2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDateFormulaCell = class(TJavaGenericImport<JDateFormulaCellClass, JDateFormulaCell>) end;

  JBiffDumpClass = interface(JObjectClass)
  ['{74D02620-BDC0-4C4A-81AC-0666B07176FA}']
    { static Property Methods }

    { static Methods }
    {class} function init(afile: JFile; os: JOutputStream): JBiffDump; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/BiffDump')]
  JBiffDump = interface(JObject)
  ['{EEDB65A7-E530-4E15-8748-645052E2E798}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBiffDump = class(TJavaGenericImport<JBiffDumpClass, JBiffDump>) end;

  JCSVClass = interface(JObjectClass)
  ['{CE7E6CF9-9F2F-41F6-92B9-B78EC31DB961}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: JWorkbook; aout: JOutputStream; encoding: JString; hide: Boolean): JCSV; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/CSV')]
  JCSV = interface(JObject)
  ['{53247D6B-DC5D-46D5-8A7A-43D3DBBF0BA5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCSV = class(TJavaGenericImport<JCSVClass, JCSV>) end;

  JDemoClass = interface(JObjectClass)
  ['{E372DF94-95FD-456F-8654-480910937FF4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDemo; cdecl;
    {class} procedure main(args: TJavaObjectArray<JString>); cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/Demo')]
  JDemo = interface(JObject)
  ['{D8B78E41-7650-447E-A5D5-C020A2A337CE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDemo = class(TJavaGenericImport<JDemoClass, JDemo>) end;

  JEscherClass = interface(JObjectClass)
  ['{C419BA9E-3C35-4B3A-8D6B-75274E414742}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: JWorkbook; aout: JOutputStream; encoding: JString): JEscher; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/Escher')]
  JEscher = interface(JObject)
  ['{0AE63AEA-0449-47F2-8BC5-6BE9E0240984}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEscher = class(TJavaGenericImport<JEscherClass, JEscher>) end;

  JEscherDrawingGroupClass = interface(JObjectClass)
  ['{6D50F783-4B53-4B12-BECE-3EB3D060F875}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: JWorkbook; aout: JOutputStream; encoding: JString): JEscherDrawingGroup; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/EscherDrawingGroup')]
  JEscherDrawingGroup = interface(JObject)
  ['{DDBB68BF-E18B-4A2D-A904-A0AEEEABE8EB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEscherDrawingGroup = class(TJavaGenericImport<JEscherDrawingGroupClass, JEscherDrawingGroup>) end;

  JFeaturesClass = interface(JObjectClass)
  ['{B3578F41-FDFF-43F1-8AE0-2DEBCCDFD28E}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: JWorkbook; aout: JOutputStream; encoding: JString): JFeatures; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/Features')]
  JFeatures = interface(JObject)
  ['{06D4B4FD-C5C8-4B61-BA89-E716D3A3C9DE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFeatures = class(TJavaGenericImport<JFeaturesClass, JFeatures>) end;

  JFormulasClass = interface(JObjectClass)
  ['{1D66D86F-CAC6-422E-ACBF-6D4D4D731A9E}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: JWorkbook; aout: JOutputStream; encoding: JString): JFormulas; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/Formulas')]
  JFormulas = interface(JObject)
  ['{E2C86B92-7EE3-4811-906C-8ACE0D8C626E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFormulas = class(TJavaGenericImport<JFormulasClass, JFormulas>) end;

  JPropertySetsReaderClass = interface(JObjectClass)
  ['{D79523E7-EE58-4B13-A993-39F8A577B161}']
    { static Property Methods }

    { static Methods }
    {class} function init(afile: JFile; propertySet: JString; os: JOutputStream): JPropertySetsReader; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/PropertySetsReader')]
  JPropertySetsReader = interface(JObject)
  ['{B11F4A66-7123-4EA5-BF27-036D45419A21}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPropertySetsReader = class(TJavaGenericImport<JPropertySetsReaderClass, JPropertySetsReader>) end;

  JReadWriteClass = interface(JObjectClass)
  ['{9ED589ED-8E20-4E5A-BBBB-341B28AC116A}']
    { static Property Methods }

    { static Methods }
    {class} function init(input: JString; output: JString): JReadWrite; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/ReadWrite')]
  JReadWrite = interface(JObject)
  ['{13BB9B69-A862-4763-BEFB-E0FB2BE10A35}']
    { Property Methods }

    { methods }
    procedure readWrite; cdecl;

    { Property }
  end;

  TJReadWrite = class(TJavaGenericImport<JReadWriteClass, JReadWrite>) end;

  JWriteClass = interface(JObjectClass)
  ['{6DC783D6-B06F-4C6F-9D11-982618877B04}']
    { static Property Methods }

    { static Methods }
    {class} function init(fn: JString): JWrite; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/Write')]
  JWrite = interface(JObject)
  ['{E8C3FF36-751D-4066-9899-D9D077CC2B69}']
    { Property Methods }

    { methods }
    procedure write; cdecl;

    { Property }
  end;

  TJWrite = class(TJavaGenericImport<JWriteClass, JWrite>) end;

  JWriteAccessClass = interface(JObjectClass)
  ['{224E3639-DE22-4A86-9CAD-BC344E502E59}']
    { static Property Methods }

    { static Methods }
    {class} function init(afile: JFile): JWriteAccess; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/WriteAccess')]
  JWriteAccess = interface(JObject)
  ['{D28DA8EA-F5CC-4379-9235-9B287AE14E65}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWriteAccess = class(TJavaGenericImport<JWriteAccessClass, JWriteAccess>) end;

  JXMLClass = interface(JObjectClass)
  ['{544F0796-D377-4499-B2A1-2DB1BCDC5373}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: JWorkbook; aout: JOutputStream; enc: JString; f: Boolean): JXML; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/demo/XML')]
  JXML = interface(JObject)
  ['{C34CBC92-C4A6-4B22-B6C0-4B18C4372916}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJXML = class(TJavaGenericImport<JXMLClass, JXML>) end;

  JErrorCellClass = interface(JObjectClass)
  ['{CD713D94-4CCE-448C-B5CD-F2E91C456B96}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/ErrorCell')]
  JErrorCell = interface(IJavaInstance)
  ['{DD0E6AF6-4F5C-480F-84B8-74ABF8E36BA9}']
    { Property Methods }

    { methods }
    function getErrorCode: Integer; cdecl;

    { Property }
  end;

  TJErrorCell = class(TJavaGenericImport<JErrorCellClass, JErrorCell>) end;

  JErrorFormulaCellClass = interface(JObjectClass)
  ['{5F7B9E24-8A41-44DF-8330-CBFB2CF493AD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/ErrorFormulaCell')]
  JErrorFormulaCell = interface(IJavaInstance)
  ['{343CDB13-D3BC-425A-AFE0-4521044B7A74}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJErrorFormulaCell = class(TJavaGenericImport<JErrorFormulaCellClass, JErrorFormulaCell>) end;

  JAlignmentClass = interface(JObjectClass)
  ['{B72D16A8-3F78-43C4-9731-C3A9D5E99E9E}']
    { static Property Methods }
    {class} function _GetGENERAL: JAlignment;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEFT: JAlignment;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCENTRE: JAlignment;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRIGHT: JAlignment;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFILL: JAlignment;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJUSTIFY: JAlignment;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getAlignment(val: Integer): JAlignment; cdecl;

    { static Property }
    {class} property GENERAL: JAlignment read _GetGENERAL;
    {class} property LEFT: JAlignment read _GetLEFT;
    {class} property CENTRE: JAlignment read _GetCENTRE;
    {class} property RIGHT: JAlignment read _GetRIGHT;
    {class} property FILL: JAlignment read _GetFILL;
    {class} property JUSTIFY: JAlignment read _GetJUSTIFY;
  end;

  [JavaSignature('jxl/format/Alignment')]
  JAlignment = interface(JObject)
  ['{356BCF25-AEA3-40C9-B154-1EA2B474CD3E}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJAlignment = class(TJavaGenericImport<JAlignmentClass, JAlignment>) end;

  JBoldStyleClass = interface(JObjectClass)
  ['{AFD3E096-3361-44C3-8806-49ED9DBE2A86}']
    { static Property Methods }
    {class} function _GetNORMAL: JBoldStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOLD: JBoldStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property NORMAL: JBoldStyle read _GetNORMAL;
    {class} property BOLD: JBoldStyle read _GetBOLD;
  end;

  [JavaSignature('jxl/format/BoldStyle')]
  JBoldStyle = interface(JObject)
  ['{ABA05D5B-18F5-434D-B48B-E3D059700372}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJBoldStyle = class(TJavaGenericImport<JBoldStyleClass, JBoldStyle>) end;

  JBorderClass = interface(JObjectClass)
  ['{98DF2C41-FE84-43E3-83B7-8BEEFD8A575F}']
    { static Property Methods }
    {class} function _GetNONE: JBorder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALL: JBorder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP: JBorder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOTTOM: JBorder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEFT: JBorder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRIGHT: JBorder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property NONE: JBorder read _GetNONE;
    {class} property ALL: JBorder read _GetALL;
    {class} property TOP: JBorder read _GetTOP;
    {class} property BOTTOM: JBorder read _GetBOTTOM;
    {class} property LEFT: JBorder read _GetLEFT;
    {class} property RIGHT: JBorder read _GetRIGHT;
  end;

  [JavaSignature('jxl/format/Border')]
  JBorder = interface(JObject)
  ['{B6EDBC3B-70B0-4921-BD00-8E440056D928}']
    { Property Methods }

    { methods }
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJBorder = class(TJavaGenericImport<JBorderClass, JBorder>) end;

  JBorderLineStyleClass = interface(JObjectClass)
  ['{CA99B55B-E1B0-4937-A875-88DD6F69FB67}']
    { static Property Methods }
    {class} function _GetNONE: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTHIN: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMEDIUM: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDASHED: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOTTED: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTHICK: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOUBLE: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHAIR: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMEDIUM_DASHED: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDASH_DOT: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMEDIUM_DASH_DOT: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDASH_DOT_DOT: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMEDIUM_DASH_DOT_DOT: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSLANTED_DASH_DOT: JBorderLineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getStyle(val: Integer): JBorderLineStyle; cdecl;

    { static Property }
    {class} property NONE: JBorderLineStyle read _GetNONE;
    {class} property THIN: JBorderLineStyle read _GetTHIN;
    {class} property MEDIUM: JBorderLineStyle read _GetMEDIUM;
    {class} property DASHED: JBorderLineStyle read _GetDASHED;
    {class} property DOTTED: JBorderLineStyle read _GetDOTTED;
    {class} property THICK: JBorderLineStyle read _GetTHICK;
    {class} property DOUBLE: JBorderLineStyle read _GetDOUBLE;
    {class} property HAIR: JBorderLineStyle read _GetHAIR;
    {class} property MEDIUM_DASHED: JBorderLineStyle read _GetMEDIUM_DASHED;
    {class} property DASH_DOT: JBorderLineStyle read _GetDASH_DOT;
    {class} property MEDIUM_DASH_DOT: JBorderLineStyle read _GetMEDIUM_DASH_DOT;
    {class} property DASH_DOT_DOT: JBorderLineStyle read _GetDASH_DOT_DOT;
    {class} property MEDIUM_DASH_DOT_DOT: JBorderLineStyle read _GetMEDIUM_DASH_DOT_DOT;
    {class} property SLANTED_DASH_DOT: JBorderLineStyle read _GetSLANTED_DASH_DOT;
  end;

  [JavaSignature('jxl/format/BorderLineStyle')]
  JBorderLineStyle = interface(JObject)
  ['{239EDC43-606A-441D-89B1-2D3AE597B240}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJBorderLineStyle = class(TJavaGenericImport<JBorderLineStyleClass, JBorderLineStyle>) end;

  JCellFormat_213Class = interface(JObjectClass)
  ['{540CE657-92CE-41B8-8CFE-7F96E662E870}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/format/CellFormat')]
  JCellFormat_213 = interface(IJavaInstance)
  ['{4EB3FECD-6ADD-4810-B26C-3BAD07280B11}']
    { Property Methods }

    { methods }
    function getFormat: JFormat; cdecl;
    function getFont: JFont; cdecl;
    function getWrap: Boolean; cdecl;
    function getAlignment: JAlignment; cdecl;
    function getVerticalAlignment: JVerticalAlignment; cdecl;
    function getOrientation: JOrientation; cdecl;
    function getBorder(P1: JBorder): JBorderLineStyle; cdecl;
    function getBorderLine(P1: JBorder): JBorderLineStyle; cdecl;
    function getBorderColour(P1: JBorder): JColour; cdecl;
    function hasBorders: Boolean; cdecl;
    function getBackgroundColour: JColour; cdecl;
    function getPattern: JPattern; cdecl;
    function getIndentation: Integer; cdecl;
    function isShrinkToFit: Boolean; cdecl;
    function isLocked: Boolean; cdecl;

    { Property }
  end;

  TJCellFormat_213 = class(TJavaGenericImport<JCellFormat_213Class, JCellFormat_213>) end;

  JColourClass = interface(JObjectClass)
  ['{CC1E5255-FD04-4B4E-B228-7F2882B7DF22}']
    { static Property Methods }
    {class} function _GetUNKNOWN: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBLACK: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWHITE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT_BACKGROUND1: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT_BACKGROUND: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPALETTE_BLACK: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRED: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBRIGHT_GREEN: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBLUE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetYELLOW: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPINK: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTURQUOISE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDARK_RED: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREEN: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDARK_BLUE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDARK_YELLOW: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVIOLET: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEAL: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREY_25_PERCENT: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREY_50_PERCENT: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPERIWINKLE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPLUM2: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIVORY: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIGHT_TURQUOISE2: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDARK_PURPLE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCORAL: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOCEAN_BLUE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetICE_BLUE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDARK_BLUE2: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPINK2: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetYELLOW2: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTURQOISE2: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVIOLET2: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDARK_RED2: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEAL2: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBLUE2: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSKY_BLUE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIGHT_TURQUOISE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIGHT_GREEN: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERY_LIGHT_YELLOW: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPALE_BLUE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetROSE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLAVENDER: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAN: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIGHT_BLUE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAQUA: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIME: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGOLD: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIGHT_ORANGE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetORANGE: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBLUE_GREY: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREY_40_PERCENT: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDARK_TEAL: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSEA_GREEN: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDARK_GREEN: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOLIVE_GREEN: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBROWN: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPLUM: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINDIGO: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREY_80_PERCENT: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTOMATIC: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGRAY_80: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGRAY_50: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGRAY_25: JColour;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getInternalColour(val: Integer): JColour; cdecl;
    {class} function getAllColours: TJavaObjectArray<JColour>; cdecl;

    { static Property }
    {class} property UNKNOWN: JColour read _GetUNKNOWN;
    {class} property BLACK: JColour read _GetBLACK;
    {class} property WHITE: JColour read _GetWHITE;
    {class} property DEFAULT_BACKGROUND1: JColour read _GetDEFAULT_BACKGROUND1;
    {class} property DEFAULT_BACKGROUND: JColour read _GetDEFAULT_BACKGROUND;
    {class} property PALETTE_BLACK: JColour read _GetPALETTE_BLACK;
    {class} property RED: JColour read _GetRED;
    {class} property BRIGHT_GREEN: JColour read _GetBRIGHT_GREEN;
    {class} property BLUE: JColour read _GetBLUE;
    {class} property YELLOW: JColour read _GetYELLOW;
    {class} property PINK: JColour read _GetPINK;
    {class} property TURQUOISE: JColour read _GetTURQUOISE;
    {class} property DARK_RED: JColour read _GetDARK_RED;
    {class} property GREEN: JColour read _GetGREEN;
    {class} property DARK_BLUE: JColour read _GetDARK_BLUE;
    {class} property DARK_YELLOW: JColour read _GetDARK_YELLOW;
    {class} property VIOLET: JColour read _GetVIOLET;
    {class} property TEAL: JColour read _GetTEAL;
    {class} property GREY_25_PERCENT: JColour read _GetGREY_25_PERCENT;
    {class} property GREY_50_PERCENT: JColour read _GetGREY_50_PERCENT;
    {class} property PERIWINKLE: JColour read _GetPERIWINKLE;
    {class} property PLUM2: JColour read _GetPLUM2;
    {class} property IVORY: JColour read _GetIVORY;
    {class} property LIGHT_TURQUOISE2: JColour read _GetLIGHT_TURQUOISE2;
    {class} property DARK_PURPLE: JColour read _GetDARK_PURPLE;
    {class} property CORAL: JColour read _GetCORAL;
    {class} property OCEAN_BLUE: JColour read _GetOCEAN_BLUE;
    {class} property ICE_BLUE: JColour read _GetICE_BLUE;
    {class} property DARK_BLUE2: JColour read _GetDARK_BLUE2;
    {class} property PINK2: JColour read _GetPINK2;
    {class} property YELLOW2: JColour read _GetYELLOW2;
    {class} property TURQOISE2: JColour read _GetTURQOISE2;
    {class} property VIOLET2: JColour read _GetVIOLET2;
    {class} property DARK_RED2: JColour read _GetDARK_RED2;
    {class} property TEAL2: JColour read _GetTEAL2;
    {class} property BLUE2: JColour read _GetBLUE2;
    {class} property SKY_BLUE: JColour read _GetSKY_BLUE;
    {class} property LIGHT_TURQUOISE: JColour read _GetLIGHT_TURQUOISE;
    {class} property LIGHT_GREEN: JColour read _GetLIGHT_GREEN;
    {class} property VERY_LIGHT_YELLOW: JColour read _GetVERY_LIGHT_YELLOW;
    {class} property PALE_BLUE: JColour read _GetPALE_BLUE;
    {class} property ROSE: JColour read _GetROSE;
    {class} property LAVENDER: JColour read _GetLAVENDER;
    {class} property TAN: JColour read _GetTAN;
    {class} property LIGHT_BLUE: JColour read _GetLIGHT_BLUE;
    {class} property AQUA: JColour read _GetAQUA;
    {class} property LIME: JColour read _GetLIME;
    {class} property GOLD: JColour read _GetGOLD;
    {class} property LIGHT_ORANGE: JColour read _GetLIGHT_ORANGE;
    {class} property ORANGE: JColour read _GetORANGE;
    {class} property BLUE_GREY: JColour read _GetBLUE_GREY;
    {class} property GREY_40_PERCENT: JColour read _GetGREY_40_PERCENT;
    {class} property DARK_TEAL: JColour read _GetDARK_TEAL;
    {class} property SEA_GREEN: JColour read _GetSEA_GREEN;
    {class} property DARK_GREEN: JColour read _GetDARK_GREEN;
    {class} property OLIVE_GREEN: JColour read _GetOLIVE_GREEN;
    {class} property BROWN: JColour read _GetBROWN;
    {class} property PLUM: JColour read _GetPLUM;
    {class} property INDIGO: JColour read _GetINDIGO;
    {class} property GREY_80_PERCENT: JColour read _GetGREY_80_PERCENT;
    {class} property AUTOMATIC: JColour read _GetAUTOMATIC;
    {class} property GRAY_80: JColour read _GetGRAY_80;
    {class} property GRAY_50: JColour read _GetGRAY_50;
    {class} property GRAY_25: JColour read _GetGRAY_25;
  end;

  [JavaSignature('jxl/format/Colour')]
  JColour = interface(JObject)
  ['{C4C1BEE4-14C4-4BC2-A278-B0C1A3B7BBA7}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getDescription: JString; cdecl;
    function getDefaultRed: Integer; cdecl; //Deprecated
    function getDefaultGreen: Integer; cdecl; //Deprecated
    function getDefaultBlue: Integer; cdecl; //Deprecated
    function getDefaultRGB: JRGB; cdecl;

    { Property }
  end;

  TJColour = class(TJavaGenericImport<JColourClass, JColour>) end;

  JFontClass = interface(JObjectClass)
  ['{2A3D3AEA-683F-44DC-862C-E5532524D0D7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/format/Font')]
  JFont = interface(IJavaInstance)
  ['{3A8C61D5-E92C-4ECA-8808-4E6AC075D9D0}']
    { Property Methods }

    { methods }
    function getName: JString; cdecl;
    function getPointSize: Integer; cdecl;
    function getBoldWeight: Integer; cdecl;
    function isItalic: Boolean; cdecl;
    function isStruckout: Boolean; cdecl;
    function getUnderlineStyle: JUnderlineStyle; cdecl;
    function getColour: JColour; cdecl;
    function getScriptStyle: JScriptStyle; cdecl;

    { Property }
  end;

  TJFont = class(TJavaGenericImport<JFontClass, JFont>) end;

  JFormatClass = interface(JObjectClass)
  ['{3F46A20F-492C-4A2C-93F0-89399E51A10A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/format/Format')]
  JFormat = interface(IJavaInstance)
  ['{81308723-C16F-4AD5-9293-72BA75437D8B}']
    { Property Methods }

    { methods }
    function getFormatString: JString; cdecl;

    { Property }
  end;

  TJFormat = class(TJavaGenericImport<JFormatClass, JFormat>) end;

  JOrientationClass = interface(JObjectClass)
  ['{5AC1CD9E-60FF-4812-87E7-CDB2DD99624A}']
    { static Property Methods }
    {class} function _GetHORIZONTAL: JOrientation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERTICAL: JOrientation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPLUS_90: JOrientation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMINUS_90: JOrientation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPLUS_45: JOrientation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMINUS_45: JOrientation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTACKED: JOrientation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getOrientation(val: Integer): JOrientation; cdecl;

    { static Property }
    {class} property HORIZONTAL: JOrientation read _GetHORIZONTAL;
    {class} property VERTICAL: JOrientation read _GetVERTICAL;
    {class} property PLUS_90: JOrientation read _GetPLUS_90;
    {class} property MINUS_90: JOrientation read _GetMINUS_90;
    {class} property PLUS_45: JOrientation read _GetPLUS_45;
    {class} property MINUS_45: JOrientation read _GetMINUS_45;
    {class} property STACKED: JOrientation read _GetSTACKED;
  end;

  [JavaSignature('jxl/format/Orientation')]
  JOrientation = interface(JObject)
  ['{E4FFF1DE-B033-4EE0-8FC2-16E41462CC91}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJOrientation = class(TJavaGenericImport<JOrientationClass, JOrientation>) end;

  JPageOrderClass = interface(JObjectClass)
  ['{A6D6497B-AB3E-4EA1-BA5B-48F33A162253}']
    { static Property Methods }
    {class} function _GetDOWN_THEN_RIGHT: JPageOrder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRIGHT_THEN_DOWN: JPageOrder;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DOWN_THEN_RIGHT: JPageOrder read _GetDOWN_THEN_RIGHT;
    {class} property RIGHT_THEN_DOWN: JPageOrder read _GetRIGHT_THEN_DOWN;
  end;

  [JavaSignature('jxl/format/PageOrder')]
  JPageOrder = interface(JObject)
  ['{7B83393F-F8D7-4DE3-8A5A-AAE738ADBE30}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPageOrder = class(TJavaGenericImport<JPageOrderClass, JPageOrder>) end;

  JPageOrientationClass = interface(JObjectClass)
  ['{A799FA0C-FEEB-46B8-9EDF-A1A4B8431D60}']
    { static Property Methods }
    {class} function _GetPORTRAIT: JPageOrientation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLANDSCAPE: JPageOrientation;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property PORTRAIT: JPageOrientation read _GetPORTRAIT;
    {class} property LANDSCAPE: JPageOrientation read _GetLANDSCAPE;
  end;

  [JavaSignature('jxl/format/PageOrientation')]
  JPageOrientation = interface(JObject)
  ['{BB58C4A0-8909-4422-BA92-4F1CB15D5998}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPageOrientation = class(TJavaGenericImport<JPageOrientationClass, JPageOrientation>) end;

  JPaperSizeClass = interface(JObjectClass)
  ['{8B2120AF-6A89-44B2-864A-2031886FFF9B}']
    { static Property Methods }
    {class} function _GetUNDEFINED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLETTER: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLETTER_SMALL: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTABLOID: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEDGER: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEGAL: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTATEMENT: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXECUTIVE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA3: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA4: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA4_SMALL: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA5: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB4: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB5: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFOLIO: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQUARTO: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSIZE_10x14: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSIZE_10x17: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOTE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_9: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_10: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_11: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_12: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_14: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetC: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetD: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_DL: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_C5: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_C3: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_C4: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_C6: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_C6_C5: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB4_ISO: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB5_ISO: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB6_ISO: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_ITALY: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_MONARCH: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_6_75: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUS_FANFOLD: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGERMAN_FANFOLD: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGERMAN_LEGAL_FANFOLD: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB4_ISO_2: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJAPANESE_POSTCARD: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSIZE_9x11: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSIZE_10x11: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSIZE_15x11: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENVELOPE_INVITE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLETTER_EXTRA: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLEGAL_EXTRA: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTABLOID_EXTRA: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA4_EXTRA: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLETTER_TRANSVERSE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA4_TRANSVERSE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLETTER_EXTRA_TRANSVERSE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUPER_A_A4: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUPER_B_A3: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLETTER_PLUS: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA4_PLUS: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA5_TRANSVERSE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB5_TRANSVERSE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA3_EXTRA: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA5_EXTRA: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB5_EXTRA: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA2: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA3_TRANSVERSE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA3_EXTRA_TRANSVERSE: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOUBLE_JAPANESE_POSTCARD: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA6: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLETTER_ROTATED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA3_ROTATED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA4_ROTATED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA5_ROTATED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB4_ROTATED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB5_ROTATED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJAPANESE_POSTCARD_ROTATED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOUBLE_JAPANESE_POSTCARD_ROTATED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetA6_ROTATED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB6: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetB6_ROTATED: JPaperSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getPaperSize(val: Integer): JPaperSize; cdecl;

    { static Property }
    {class} property UNDEFINED: JPaperSize read _GetUNDEFINED;
    {class} property LETTER: JPaperSize read _GetLETTER;
    {class} property LETTER_SMALL: JPaperSize read _GetLETTER_SMALL;
    {class} property TABLOID: JPaperSize read _GetTABLOID;
    {class} property LEDGER: JPaperSize read _GetLEDGER;
    {class} property LEGAL: JPaperSize read _GetLEGAL;
    {class} property STATEMENT: JPaperSize read _GetSTATEMENT;
    {class} property EXECUTIVE: JPaperSize read _GetEXECUTIVE;
    {class} property A3: JPaperSize read _GetA3;
    {class} property A4: JPaperSize read _GetA4;
    {class} property A4_SMALL: JPaperSize read _GetA4_SMALL;
    {class} property A5: JPaperSize read _GetA5;
    {class} property B4: JPaperSize read _GetB4;
    {class} property B5: JPaperSize read _GetB5;
    {class} property FOLIO: JPaperSize read _GetFOLIO;
    {class} property QUARTO: JPaperSize read _GetQUARTO;
    {class} property SIZE_10x14: JPaperSize read _GetSIZE_10x14;
    {class} property SIZE_10x17: JPaperSize read _GetSIZE_10x17;
    {class} property NOTE: JPaperSize read _GetNOTE;
    {class} property ENVELOPE_9: JPaperSize read _GetENVELOPE_9;
    {class} property ENVELOPE_10: JPaperSize read _GetENVELOPE_10;
    {class} property ENVELOPE_11: JPaperSize read _GetENVELOPE_11;
    {class} property ENVELOPE_12: JPaperSize read _GetENVELOPE_12;
    {class} property ENVELOPE_14: JPaperSize read _GetENVELOPE_14;
    {class} property C: JPaperSize read _GetC;
    {class} property D: JPaperSize read _GetD;
    {class} property E: JPaperSize read _GetE;
    {class} property ENVELOPE_DL: JPaperSize read _GetENVELOPE_DL;
    {class} property ENVELOPE_C5: JPaperSize read _GetENVELOPE_C5;
    {class} property ENVELOPE_C3: JPaperSize read _GetENVELOPE_C3;
    {class} property ENVELOPE_C4: JPaperSize read _GetENVELOPE_C4;
    {class} property ENVELOPE_C6: JPaperSize read _GetENVELOPE_C6;
    {class} property ENVELOPE_C6_C5: JPaperSize read _GetENVELOPE_C6_C5;
    {class} property B4_ISO: JPaperSize read _GetB4_ISO;
    {class} property B5_ISO: JPaperSize read _GetB5_ISO;
    {class} property B6_ISO: JPaperSize read _GetB6_ISO;
    {class} property ENVELOPE_ITALY: JPaperSize read _GetENVELOPE_ITALY;
    {class} property ENVELOPE_MONARCH: JPaperSize read _GetENVELOPE_MONARCH;
    {class} property ENVELOPE_6_75: JPaperSize read _GetENVELOPE_6_75;
    {class} property US_FANFOLD: JPaperSize read _GetUS_FANFOLD;
    {class} property GERMAN_FANFOLD: JPaperSize read _GetGERMAN_FANFOLD;
    {class} property GERMAN_LEGAL_FANFOLD: JPaperSize read _GetGERMAN_LEGAL_FANFOLD;
    {class} property B4_ISO_2: JPaperSize read _GetB4_ISO_2;
    {class} property JAPANESE_POSTCARD: JPaperSize read _GetJAPANESE_POSTCARD;
    {class} property SIZE_9x11: JPaperSize read _GetSIZE_9x11;
    {class} property SIZE_10x11: JPaperSize read _GetSIZE_10x11;
    {class} property SIZE_15x11: JPaperSize read _GetSIZE_15x11;
    {class} property ENVELOPE_INVITE: JPaperSize read _GetENVELOPE_INVITE;
    {class} property LETTER_EXTRA: JPaperSize read _GetLETTER_EXTRA;
    {class} property LEGAL_EXTRA: JPaperSize read _GetLEGAL_EXTRA;
    {class} property TABLOID_EXTRA: JPaperSize read _GetTABLOID_EXTRA;
    {class} property A4_EXTRA: JPaperSize read _GetA4_EXTRA;
    {class} property LETTER_TRANSVERSE: JPaperSize read _GetLETTER_TRANSVERSE;
    {class} property A4_TRANSVERSE: JPaperSize read _GetA4_TRANSVERSE;
    {class} property LETTER_EXTRA_TRANSVERSE: JPaperSize read _GetLETTER_EXTRA_TRANSVERSE;
    {class} property SUPER_A_A4: JPaperSize read _GetSUPER_A_A4;
    {class} property SUPER_B_A3: JPaperSize read _GetSUPER_B_A3;
    {class} property LETTER_PLUS: JPaperSize read _GetLETTER_PLUS;
    {class} property A4_PLUS: JPaperSize read _GetA4_PLUS;
    {class} property A5_TRANSVERSE: JPaperSize read _GetA5_TRANSVERSE;
    {class} property B5_TRANSVERSE: JPaperSize read _GetB5_TRANSVERSE;
    {class} property A3_EXTRA: JPaperSize read _GetA3_EXTRA;
    {class} property A5_EXTRA: JPaperSize read _GetA5_EXTRA;
    {class} property B5_EXTRA: JPaperSize read _GetB5_EXTRA;
    {class} property A2: JPaperSize read _GetA2;
    {class} property A3_TRANSVERSE: JPaperSize read _GetA3_TRANSVERSE;
    {class} property A3_EXTRA_TRANSVERSE: JPaperSize read _GetA3_EXTRA_TRANSVERSE;
    {class} property DOUBLE_JAPANESE_POSTCARD: JPaperSize read _GetDOUBLE_JAPANESE_POSTCARD;
    {class} property A6: JPaperSize read _GetA6;
    {class} property LETTER_ROTATED: JPaperSize read _GetLETTER_ROTATED;
    {class} property A3_ROTATED: JPaperSize read _GetA3_ROTATED;
    {class} property A4_ROTATED: JPaperSize read _GetA4_ROTATED;
    {class} property A5_ROTATED: JPaperSize read _GetA5_ROTATED;
    {class} property B4_ROTATED: JPaperSize read _GetB4_ROTATED;
    {class} property B5_ROTATED: JPaperSize read _GetB5_ROTATED;
    {class} property JAPANESE_POSTCARD_ROTATED: JPaperSize read _GetJAPANESE_POSTCARD_ROTATED;
    {class} property DOUBLE_JAPANESE_POSTCARD_ROTATED: JPaperSize read _GetDOUBLE_JAPANESE_POSTCARD_ROTATED;
    {class} property A6_ROTATED: JPaperSize read _GetA6_ROTATED;
    {class} property B6: JPaperSize read _GetB6;
    {class} property B6_ROTATED: JPaperSize read _GetB6_ROTATED;
  end;

  [JavaSignature('jxl/format/PaperSize')]
  JPaperSize = interface(JObject)
  ['{059B9832-6D68-4139-9038-3FA7AB590ED4}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;

    { Property }
  end;

  TJPaperSize = class(TJavaGenericImport<JPaperSizeClass, JPaperSize>) end;

  JPatternClass = interface(JObjectClass)
  ['{0FB756FB-F409-4093-BC82-08E4EC21B25A}']
    { static Property Methods }
    {class} function _GetNONE: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSOLID: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGRAY_50: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGRAY_75: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGRAY_25: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN1: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN2: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN3: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN4: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN5: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN6: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN7: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN8: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN9: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN10: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN11: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN12: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN13: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPATTERN14: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getPattern(val: Integer): JPattern; cdecl;

    { static Property }
    {class} property NONE: JPattern read _GetNONE;
    {class} property SOLID: JPattern read _GetSOLID;
    {class} property GRAY_50: JPattern read _GetGRAY_50;
    {class} property GRAY_75: JPattern read _GetGRAY_75;
    {class} property GRAY_25: JPattern read _GetGRAY_25;
    {class} property PATTERN1: JPattern read _GetPATTERN1;
    {class} property PATTERN2: JPattern read _GetPATTERN2;
    {class} property PATTERN3: JPattern read _GetPATTERN3;
    {class} property PATTERN4: JPattern read _GetPATTERN4;
    {class} property PATTERN5: JPattern read _GetPATTERN5;
    {class} property PATTERN6: JPattern read _GetPATTERN6;
    {class} property PATTERN7: JPattern read _GetPATTERN7;
    {class} property PATTERN8: JPattern read _GetPATTERN8;
    {class} property PATTERN9: JPattern read _GetPATTERN9;
    {class} property PATTERN10: JPattern read _GetPATTERN10;
    {class} property PATTERN11: JPattern read _GetPATTERN11;
    {class} property PATTERN12: JPattern read _GetPATTERN12;
    {class} property PATTERN13: JPattern read _GetPATTERN13;
    {class} property PATTERN14: JPattern read _GetPATTERN14;
  end;

  [JavaSignature('jxl/format/Pattern')]
  JPattern = interface(JObject)
  ['{9B653BBB-7120-4FCA-8F2F-064CF030E141}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJPattern = class(TJavaGenericImport<JPatternClass, JPattern>) end;

  JRGBClass = interface(JObjectClass)
  ['{101C0AB0-8492-455B-9E74-13462EBA3F22}']
    { static Property Methods }

    { static Methods }
    {class} function init(r: Integer; g: Integer; b: Integer): JRGB; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/format/RGB')]
  JRGB = interface(JObject)
  ['{253443C2-1C45-47C5-AE1E-B49A8EF01516}']
    { Property Methods }

    { methods }
    function getRed: Integer; cdecl;
    function getGreen: Integer; cdecl;
    function getBlue: Integer; cdecl;

    { Property }
  end;

  TJRGB = class(TJavaGenericImport<JRGBClass, JRGB>) end;

  JScriptStyleClass = interface(JObjectClass)
  ['{BAABBBE0-FC0F-4F47-9A62-2F70F60744BA}']
    { static Property Methods }
    {class} function _GetNORMAL_SCRIPT: JScriptStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUPERSCRIPT: JScriptStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUBSCRIPT: JScriptStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getStyle(val: Integer): JScriptStyle; cdecl;

    { static Property }
    {class} property NORMAL_SCRIPT: JScriptStyle read _GetNORMAL_SCRIPT;
    {class} property SUPERSCRIPT: JScriptStyle read _GetSUPERSCRIPT;
    {class} property SUBSCRIPT: JScriptStyle read _GetSUBSCRIPT;
  end;

  [JavaSignature('jxl/format/ScriptStyle')]
  JScriptStyle = interface(JObject)
  ['{72B3EBE1-E522-4BE8-8D7F-55FC30C64303}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJScriptStyle = class(TJavaGenericImport<JScriptStyleClass, JScriptStyle>) end;

  JUnderlineStyleClass = interface(JObjectClass)
  ['{D977B496-09B0-4561-B204-F5FDA8894787}']
    { static Property Methods }
    {class} function _GetNO_UNDERLINE: JUnderlineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSINGLE: JUnderlineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOUBLE: JUnderlineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSINGLE_ACCOUNTING: JUnderlineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOUBLE_ACCOUNTING: JUnderlineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getStyle(val: Integer): JUnderlineStyle; cdecl;

    { static Property }
    {class} property NO_UNDERLINE: JUnderlineStyle read _GetNO_UNDERLINE;
    {class} property SINGLE: JUnderlineStyle read _GetSINGLE;
    {class} property DOUBLE: JUnderlineStyle read _GetDOUBLE;
    {class} property SINGLE_ACCOUNTING: JUnderlineStyle read _GetSINGLE_ACCOUNTING;
    {class} property DOUBLE_ACCOUNTING: JUnderlineStyle read _GetDOUBLE_ACCOUNTING;
  end;

  [JavaSignature('jxl/format/UnderlineStyle')]
  JUnderlineStyle = interface(JObject)
  ['{CC559927-AFCD-4800-8BA7-8F56953F5421}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJUnderlineStyle = class(TJavaGenericImport<JUnderlineStyleClass, JUnderlineStyle>) end;

  JVerticalAlignmentClass = interface(JObjectClass)
  ['{84C5FB65-8FF7-45F4-9206-FB98831BF7CA}']
    { static Property Methods }
    {class} function _GetTOP: JVerticalAlignment;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCENTRE: JVerticalAlignment;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOTTOM: JVerticalAlignment;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJUSTIFY: JVerticalAlignment;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function getAlignment(val: Integer): JVerticalAlignment; cdecl;

    { static Property }
    {class} property TOP: JVerticalAlignment read _GetTOP;
    {class} property CENTRE: JVerticalAlignment read _GetCENTRE;
    {class} property BOTTOM: JVerticalAlignment read _GetBOTTOM;
    {class} property JUSTIFY: JVerticalAlignment read _GetJUSTIFY;
  end;

  [JavaSignature('jxl/format/VerticalAlignment')]
  JVerticalAlignment = interface(JObject)
  ['{002C0359-9F03-4309-A273-BCA03D2D7F97}']
    { Property Methods }

    { methods }
    function getValue: Integer; cdecl;
    function getDescription: JString; cdecl;

    { Property }
  end;

  TJVerticalAlignment = class(TJavaGenericImport<JVerticalAlignmentClass, JVerticalAlignment>) end;

  JFormulaCellClass = interface(JObjectClass)
  ['{B4A7C0E4-F865-4C4D-8DC7-95DE21667ABC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/FormulaCell')]
  JFormulaCell = interface(IJavaInstance)
  ['{EB93F66E-90F4-4B7D-A545-B5C093EE51E6}']
    { Property Methods }

    { methods }
    function getFormula: JString; cdecl;

    { Property }
  end;

  TJFormulaCell = class(TJavaGenericImport<JFormulaCellClass, JFormulaCell>) end;

  JHeaderFooter_Contents_227Class = interface(JHeaderFooter_ContentsClass) // or JObjectClass
  ['{62B40C44-0C2F-4DBF-8378-18589D123B66}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/HeaderFooter$Contents')]
  JHeaderFooter_Contents_227 = interface(JHeaderFooter_Contents) // or JObject
  ['{60F27C6B-D58D-4A92-9A09-1DE1554BEBEA}']
    { Property Methods }

    { methods }
    procedure append(txt: JString); cdecl;
    procedure toggleBold; cdecl;
    procedure toggleUnderline; cdecl;
    procedure toggleItalics; cdecl;
    procedure toggleStrikethrough; cdecl;
    procedure toggleDoubleUnderline; cdecl;
    procedure toggleSuperScript; cdecl;
    procedure toggleSubScript; cdecl;
    procedure toggleOutline; cdecl;
    procedure toggleShadow; cdecl;
    procedure setFontName(fontName: JString); cdecl;
    function setFontSize(size: Integer): Boolean; cdecl;
    procedure appendPageNumber; cdecl;
    procedure appendTotalPages; cdecl;
    procedure appendDate; cdecl;
    procedure appendTime; cdecl;
    procedure appendWorkbookName; cdecl;
    procedure appendWorkSheetName; cdecl;
    procedure clear; cdecl;
    function empty: Boolean; cdecl;

    { Property }
  end;

  TJHeaderFooter_Contents_227 = class(TJavaGenericImport<JHeaderFooter_Contents_227Class, JHeaderFooter_Contents_227>) end;

  JHeaderFooter_228Class = interface(JHeaderFooterClass) // or JObjectClass
  ['{3A86112D-2853-4F36-9182-E74DCB939A56}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHeaderFooter_228; cdecl; overload;
    {class} function init(hf: JHeaderFooter): JHeaderFooter_228; cdecl; overload;
    {class} function init(s: JString): JHeaderFooter_228; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/HeaderFooter')]
  JHeaderFooter_228 = interface(JHeaderFooter) // or JObject
  ['{99E75A4F-5508-4296-8200-9381FDE1A005}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;
    function getRight: JHeaderFooter_Contents; cdecl;
    function getCentre: JHeaderFooter_Contents; cdecl;
    function getLeft: JHeaderFooter_Contents; cdecl;
    procedure clear; cdecl;

    { Property }
  end;

  TJHeaderFooter_228 = class(TJavaGenericImport<JHeaderFooter_228Class, JHeaderFooter_228>) end;

  JHyperlinkClass = interface(JObjectClass)
  ['{3741099D-B4B5-4D6B-BD94-E2B8066B9A72}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/Hyperlink')]
  JHyperlink = interface(IJavaInstance)
  ['{F4759744-2325-42F4-A861-6F71B880102F}']
    { Property Methods }

    { methods }
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getRange: JRange; cdecl;
    function isFile: Boolean; cdecl;
    function isURL: Boolean; cdecl;
    function isLocation: Boolean; cdecl;
    function getLastRow: Integer; cdecl;
    function getLastColumn: Integer; cdecl;
    function getURL: JURL; cdecl;
    function getFile: JFile; cdecl;

    { Property }
  end;

  TJHyperlink = class(TJavaGenericImport<JHyperlinkClass, JHyperlink>) end;

  JImageClass = interface(JObjectClass)
  ['{33EC7FF7-4BBB-4BD9-B973-1262058FCF0C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/Image')]
  JImage = interface(IJavaInstance)
  ['{3B12F478-0BCA-4DD2-B0E7-795259B70468}']
    { Property Methods }

    { methods }
    function getColumn: Double; cdecl;
    function getRow: Double; cdecl;
    function getWidth: Double; cdecl; overload;
    function getHeight: Double; cdecl; overload;
    function getImageFile: JFile; cdecl;
    function getImageData: TJavaArray<Byte>; cdecl;
    function getWidth(P1: JLengthUnit): Double; cdecl; overload;
    function getHeight(P1: JLengthUnit): Double; cdecl; overload;
    function getImageWidth: Integer; cdecl;
    function getImageHeight: Integer; cdecl;
    function getHorizontalResolution(P1: JLengthUnit): Double; cdecl;
    function getVerticalResolution(P1: JLengthUnit): Double; cdecl;

    { Property }
  end;

  TJImage = class(TJavaGenericImport<JImageClass, JImage>) end;

  JJXLExceptionClass = interface(JExceptionClass) // or JObjectClass
  ['{A2EF2BB5-BD6F-4B2B-A241-300C9C568708}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/JXLException')]
  JJXLException = interface(JException) // or JObject
  ['{0CF21CAF-10EF-4720-9776-21F510B255EA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJJXLException = class(TJavaGenericImport<JJXLExceptionClass, JJXLException>) end;

  JLabelCellClass = interface(JObjectClass)
  ['{4789325A-6D4E-468B-98E0-C494BF519442}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/LabelCell')]
  JLabelCell = interface(IJavaInstance)
  ['{7EF6EADD-4747-4381-97CC-BCDB58CFAEA3}']
    { Property Methods }

    { methods }
    function getString: JString; cdecl;

    { Property }
  end;

  TJLabelCell = class(TJavaGenericImport<JLabelCellClass, JLabelCell>) end;

  JNumberCellClass = interface(JObjectClass)
  ['{0BDC78A7-8DFF-41C1-A59A-DD773F7112B4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/NumberCell')]
  JNumberCell = interface(IJavaInstance)
  ['{C81BA1A8-8577-4284-B734-0C880587F7B1}']
    { Property Methods }

    { methods }
    function getValue: Double; cdecl;
    function getNumberFormat: JNumberFormat; cdecl;

    { Property }
  end;

  TJNumberCell = class(TJavaGenericImport<JNumberCellClass, JNumberCell>) end;

  JNumberFormulaCellClass = interface(JObjectClass)
  ['{29D6A274-C9B8-4D84-83FB-D7CF5CE98BF9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/NumberFormulaCell')]
  JNumberFormulaCell = interface(IJavaInstance)
  ['{DE83F828-1B5B-4490-806E-16DA89B80BC4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNumberFormulaCell = class(TJavaGenericImport<JNumberFormulaCellClass, JNumberFormulaCell>) end;

  JRangeClass = interface(JObjectClass)
  ['{D7A86AB3-0520-46F1-AED6-AB8A3B8ED39A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/Range')]
  JRange = interface(IJavaInstance)
  ['{45301366-C55A-4F2D-87E5-96090B8BBF2D}']
    { Property Methods }

    { methods }
    function getTopLeft: JCell; cdecl;
    function getBottomRight: JCell; cdecl;
    function getFirstSheetIndex: Integer; cdecl;
    function getLastSheetIndex: Integer; cdecl;

    { Property }
  end;

  TJRange = class(TJavaGenericImport<JRangeClass, JRange>) end;

  JBaseSharedFormulaRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{1CD87FE1-E822-4718-95F8-116988BA5C9C}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl; pos: Integer): JBaseSharedFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BaseSharedFormulaRecord')]
  JBaseSharedFormulaRecord = interface(JCellValue) // or JObject
  ['{ED3EA021-21B7-44A4-990D-386464847EF6}']
    { Property Methods }

    { methods }
    function getFormula: JString; cdecl;
    function getRecord: JRecord; cdecl;

    { Property }
  end;

  TJBaseSharedFormulaRecord = class(TJavaGenericImport<JBaseSharedFormulaRecordClass, JBaseSharedFormulaRecord>) end;

  JBiffException_BiffMessageClass = interface(JObjectClass)
  ['{CC6D4083-6227-463A-BD7E-E5981415A546}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BiffException$BiffMessage')]
  JBiffException_BiffMessage = interface(JObject)
  ['{8E5224B3-042F-4092-A084-7A3CBF86B6E0}']
    { Property Methods }
    function _Getmessage: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setmessage(amessage: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property &message: JString read _Getmessage write _Setmessage;
  end;

  TJBiffException_BiffMessage = class(TJavaGenericImport<JBiffException_BiffMessageClass, JBiffException_BiffMessage>) end;

  JBiffExceptionClass = interface(JJXLExceptionClass) // or JObjectClass
  ['{B95A5101-840B-4895-9DAB-5CD9EC896ED1}']
    { static Property Methods }

    { static Methods }
    {class} function init(m: JBiffException_BiffMessage): JBiffException; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BiffException')]
  JBiffException = interface(JJXLException) // or JObject
  ['{AB75CEC6-A405-42B6-8E6D-BBFABE54F4EC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBiffException = class(TJavaGenericImport<JBiffExceptionClass, JBiffException>) end;

  JBiffRecordReaderClass = interface(JObjectClass)
  ['{F2AC64E7-D0C8-47B9-A9D3-796C588E3128}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JFile): JBiffRecordReader; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BiffRecordReader')]
  JBiffRecordReader = interface(JObject)
  ['{8A1E482E-1D2B-4BA6-BC9A-25BDB2B79397}']
    { Property Methods }

    { methods }
    function hasNext: Boolean; cdecl;
    function next: JRecord; cdecl;
    function getPos: Integer; cdecl;

    { Property }
  end;

  TJBiffRecordReader = class(TJavaGenericImport<JBiffRecordReaderClass, JBiffRecordReader>) end;

  JBlankCellClass = interface(JCellValueClass) // or JObjectClass
  ['{7F6E83AC-1C35-47E1-BC64-B2E719E1F4FD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BlankCell')]
  JBlankCell = interface(JCellValue) // or JObject
  ['{2DD06B59-D841-493A-AA8E-04059AE5FF30}']
    { Property Methods }

    { methods }
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;

    { Property }
  end;

  TJBlankCell = class(TJavaGenericImport<JBlankCellClass, JBlankCell>) end;

  JBOFRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{23081133-C301-403A-9F4E-FC2475F47378}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BOFRecord')]
  JBOFRecord = interface(JRecordData) // or JObject
  ['{AF9B3040-0F3D-4CA6-AEA2-55267CAD85C0}']
    { Property Methods }

    { methods }
    function isBiff8: Boolean; cdecl;
    function isBiff7: Boolean; cdecl;
    function isWorksheet: Boolean; cdecl;
    function isMacroSheet: Boolean; cdecl;
    function isChart: Boolean; cdecl;

    { Property }
  end;

  TJBOFRecord = class(TJavaGenericImport<JBOFRecordClass, JBOFRecord>) end;

  JBooleanFormulaRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{BE4CBD54-8398-42C5-A412-C722090BC39C}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl): JBooleanFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BooleanFormulaRecord')]
  JBooleanFormulaRecord = interface(JCellValue) // or JObject
  ['{552D9E4F-61D9-4AD7-AA44-6FE532149CB8}']
    { Property Methods }

    { methods }
    function getValue: Boolean; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;
    function getFormula: JString; cdecl;

    { Property }
  end;

  TJBooleanFormulaRecord = class(TJavaGenericImport<JBooleanFormulaRecordClass, JBooleanFormulaRecord>) end;

  JBooleanRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{1ABDF0B7-5DF9-4DB9-88D7-0A6A7CF144AD}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; fr: JFormattingRecords; si: JSheetImpl): JBooleanRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BooleanRecord')]
  JBooleanRecord = interface(JCellValue) // or JObject
  ['{F00D87FE-E599-4BD7-8A0E-8FD627E023B9}']
    { Property Methods }

    { methods }
    function isError: Boolean; cdecl;
    function getValue: Boolean; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getRecord: JRecord; cdecl;

    { Property }
  end;

  TJBooleanRecord = class(TJavaGenericImport<JBooleanRecordClass, JBooleanRecord>) end;

  JBottomMarginRecordClass = interface(JMarginRecordClass) // or JObjectClass
  ['{B1554D36-627E-4F60-82F9-C6AFB303C30A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BottomMarginRecord')]
  JBottomMarginRecord = interface(JMarginRecord) // or JObject
  ['{B31347E1-F896-4B5B-87E1-C3632BC1FA1B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBottomMarginRecord = class(TJavaGenericImport<JBottomMarginRecordClass, JBottomMarginRecord>) end;

  JBoundsheetRecord_1Class = interface(JObjectClass)
  ['{C5900D27-FCF5-46A9-99B5-717A7A8759D0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BoundsheetRecord$1')]
  JBoundsheetRecord_1 = interface(JObject)
  ['{0487D976-3E0C-431B-ADCF-C9F3A9FEE98B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBoundsheetRecord_1 = class(TJavaGenericImport<JBoundsheetRecord_1Class, JBoundsheetRecord_1>) end;

  JBoundsheetRecord_Biff7Class = interface(JObjectClass)
  ['{75AF7FD5-0325-443D-9635-CD92B887E997}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/BoundsheetRecord$Biff7')]
  JBoundsheetRecord_Biff7 = interface(JObject)
  ['{86FDBB90-4939-43FA-8573-85E5767A941B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBoundsheetRecord_Biff7 = class(TJavaGenericImport<JBoundsheetRecord_Biff7Class, JBoundsheetRecord_Biff7>) end;

  JBoundsheetRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{D7A2417E-F2FD-4EF9-8A3F-446B21964433}']
    { static Property Methods }
    {class} function _Getbiff7: JBoundsheetRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord; s: JWorkbookSettings): JBoundsheetRecord; cdecl; overload;
    {class} function init(t: JRecord; biff7: JBoundsheetRecord_Biff7): JBoundsheetRecord; cdecl; overload;

    { static Property }
    {class} property biff7: JBoundsheetRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/BoundsheetRecord')]
  JBoundsheetRecord = interface(JRecordData) // or JObject
  ['{6A07B416-EC65-476C-8D0B-079DAD876062}']
    { Property Methods }

    { methods }
    function getName: JString; cdecl;
    function isHidden: Boolean; cdecl;
    function isSheet: Boolean; cdecl;
    function isChart: Boolean; cdecl;

    { Property }
  end;

  TJBoundsheetRecord = class(TJavaGenericImport<JBoundsheetRecordClass, JBoundsheetRecord>) end;

  JButtonPropertySetRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{57E7C912-B8B1-409B-A0CA-BB137BE88A69}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/ButtonPropertySetRecord')]
  JButtonPropertySetRecord = interface(JRecordData) // or JObject
  ['{B5BD416E-1149-4082-961A-954E24CB63CE}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJButtonPropertySetRecord = class(TJavaGenericImport<JButtonPropertySetRecordClass, JButtonPropertySetRecord>) end;

  JCalcModeRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{A1CCC070-328A-4A4F-96C8-0FB00F6EFCC2}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JCalcModeRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/CalcModeRecord')]
  JCalcModeRecord = interface(JRecordData) // or JObject
  ['{A54C23E0-42C4-48EC-A07E-E64B7A49B4A2}']
    { Property Methods }

    { methods }
    function isAutomatic: Boolean; cdecl;

    { Property }
  end;

  TJCalcModeRecord = class(TJavaGenericImport<JCalcModeRecordClass, JCalcModeRecord>) end;

  JCellFeaturesAccessorClass = interface(JObjectClass)
  ['{252EAE88-9806-4463-9A9F-F9C434648BF9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/CellFeaturesAccessor')]
  JCellFeaturesAccessor = interface(IJavaInstance)
  ['{1B1E0317-6AB4-4775-979F-3E16E8945968}']
    { Property Methods }

    { methods }
    procedure setCellFeatures(P1: JCellFeatures); cdecl;
    function getCellFeatures: JCellFeatures; cdecl;

    { Property }
  end;

  TJCellFeaturesAccessor = class(TJavaGenericImport<JCellFeaturesAccessorClass, JCellFeaturesAccessor>) end;

  JCellValueClass = interface(JRecordDataClass) // or JObjectClass
  ['{EA65064B-A1F1-40F3-B3E2-0E8262487B7A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/CellValue')]
  JCellValue = interface(JRecordData) // or JObject
  ['{9B731BB4-EAE6-41A5-B233-48291DA33547}']
    { Property Methods }

    { methods }
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getXFIndex: Integer; cdecl;
    function getCellFormat: JCellFormat; cdecl;
    function isHidden: Boolean; cdecl;
    function getCellFeatures: JCellFeatures; cdecl;
    procedure setCellFeatures(cf: JCellFeatures); cdecl;

    { Property }
  end;

  TJCellValue = class(TJavaGenericImport<JCellValueClass, JCellValue>) end;

  JCentreRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{F1E64A50-27D6-45EC-B642-74DE7ED3C958}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JCentreRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/CentreRecord')]
  JCentreRecord = interface(JRecordData) // or JObject
  ['{6D0761F4-4429-4F4F-9E14-3419882610D9}']
    { Property Methods }

    { methods }
    function isCentre: Boolean; cdecl;

    { Property }
  end;

  TJCentreRecord = class(TJavaGenericImport<JCentreRecordClass, JCentreRecord>) end;

  JCodepageRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{8C0EBB1F-ED0F-491C-B02D-872E38A19C2B}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JCodepageRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/CodepageRecord')]
  JCodepageRecord = interface(JRecordData) // or JObject
  ['{5BD5E8E9-0E85-4C04-B330-FA4F8DB3AF6E}']
    { Property Methods }

    { methods }
    function getCharacterSet: Integer; cdecl;

    { Property }
  end;

  TJCodepageRecord = class(TJavaGenericImport<JCodepageRecordClass, JCodepageRecord>) end;

  JColumnInfoRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{E7DC33D6-8ADC-44DF-B37B-0801C52DBF2B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/ColumnInfoRecord')]
  JColumnInfoRecord = interface(JRecordData) // or JObject
  ['{A0EC2762-7394-4454-95AD-3128C1538808}']
    { Property Methods }

    { methods }
    function getStartColumn: Integer; cdecl;
    function getEndColumn: Integer; cdecl;
    function getXFIndex: Integer; cdecl;
    function getOutlineLevel: Integer; cdecl;
    function getCollapsed: Boolean; cdecl;
    function getWidth: Integer; cdecl;
    function getHidden: Boolean; cdecl;

    { Property }
  end;

  TJColumnInfoRecord = class(TJavaGenericImport<JColumnInfoRecordClass, JColumnInfoRecord>) end;

  JCompoundFileClass = interface(JBaseCompoundFileClass) // or JObjectClass
  ['{DEE40357-9F82-4530-92A1-E10DAF6CC7E9}']
    { static Property Methods }

    { static Methods }
    {class} function init(d: TJavaArray<Byte>; ws: JWorkbookSettings): JCompoundFile; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/CompoundFile')]
  JCompoundFile = interface(JBaseCompoundFile) // or JObject
  ['{EEEF10C0-4294-4711-A824-E76E63E26684}']
    { Property Methods }

    { methods }
    function getStream(streamName: JString): TJavaArray<Byte>; cdecl; overload;
    function getStream(psIndex: Integer): TJavaArray<Byte>; cdecl; overload;
    function findPropertyStorage(name: JString): JBaseCompoundFile_PropertyStorage; cdecl;
    function getNumberOfPropertySets: Integer; cdecl;
    function getPropertySet(index: Integer): JBaseCompoundFile_PropertyStorage; cdecl;

    { Property }
  end;

  TJCompoundFile = class(TJavaGenericImport<JCompoundFileClass, JCompoundFile>) end;

  JCountryRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{C3178A1B-23A9-4C65-A7F6-C3A7CBAE9792}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JCountryRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/CountryRecord')]
  JCountryRecord = interface(JRecordData) // or JObject
  ['{DEE63B0E-6AF2-4024-BB6E-26CFA6AD4AC6}']
    { Property Methods }

    { methods }
    function getLanguageCode: Integer; cdecl;
    function getRegionalSettingsCode: Integer; cdecl;

    { Property }
  end;

  TJCountryRecord = class(TJavaGenericImport<JCountryRecordClass, JCountryRecord>) end;

  JDateFormulaRecordClass = interface(JDateRecordClass) // or JObjectClass
  ['{A546ACCE-3509-4009-8C06-6ADFB84F11AE}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JNumberFormulaRecord; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; nf: Boolean; si: JSheetImpl): JDateFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/DateFormulaRecord')]
  JDateFormulaRecord = interface(JDateRecord) // or JObject
  ['{9F3E3A91-1C50-4657-966F-1E5A23B0389A}']
    { Property Methods }

    { methods }
    function getType: JCellType; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;
    function getFormula: JString; cdecl;
    function getValue: Double; cdecl;
    function getNumberFormat: JNumberFormat; cdecl;

    { Property }
  end;

  TJDateFormulaRecord = class(TJavaGenericImport<JDateFormulaRecordClass, JDateFormulaRecord>) end;

  JDateRecordClass = interface(JObjectClass)
  ['{A6D68233-9281-4398-A6A6-A25FC2CED5C6}']
    { static Property Methods }

    { static Methods }
    {class} function init(num: JNumberCell; xfi: Integer; fr: JFormattingRecords; nf: Boolean; si: JSheetImpl): JDateRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/DateRecord')]
  JDateRecord = interface(JObject)
  ['{F7F6AED4-FEED-4918-B55E-B3139976D84A}']
    { Property Methods }

    { methods }
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getDate: JDate; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function isTime: Boolean; cdecl;
    function getDateFormat: JDateFormat; cdecl;
    function getCellFormat: JCellFormat; cdecl;
    function isHidden: Boolean; cdecl;
    function getCellFeatures: JCellFeatures; cdecl;
    procedure setCellFeatures(cf: JCellFeatures); cdecl;

    { Property }
  end;

  TJDateRecord = class(TJavaGenericImport<JDateRecordClass, JDateRecord>) end;

  JDefaultColumnWidthRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{3CE9E780-6BEF-41C8-AC80-B32D998DC209}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JDefaultColumnWidthRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/DefaultColumnWidthRecord')]
  JDefaultColumnWidthRecord = interface(JRecordData) // or JObject
  ['{7C957EC7-ED20-4091-A6AB-E3CF3F0F0B1B}']
    { Property Methods }

    { methods }
    function getWidth: Integer; cdecl;

    { Property }
  end;

  TJDefaultColumnWidthRecord = class(TJavaGenericImport<JDefaultColumnWidthRecordClass, JDefaultColumnWidthRecord>) end;

  JDefaultRowHeightRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{D52A1941-9BC7-47CA-9AB7-B40835337670}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JDefaultRowHeightRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/DefaultRowHeightRecord')]
  JDefaultRowHeightRecord = interface(JRecordData) // or JObject
  ['{7E0A7B65-524D-4072-85D9-A6E0533793B4}']
    { Property Methods }

    { methods }
    function getHeight: Integer; cdecl;

    { Property }
  end;

  TJDefaultRowHeightRecord = class(TJavaGenericImport<JDefaultRowHeightRecordClass, JDefaultRowHeightRecord>) end;

  JDimensionRecord_1Class = interface(JObjectClass)
  ['{D998D3EE-F11A-436D-99C3-FCE15112337F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/DimensionRecord$1')]
  JDimensionRecord_1 = interface(JObject)
  ['{CFF1C24C-25AD-4B08-A0B0-C006DCC0E209}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDimensionRecord_1 = class(TJavaGenericImport<JDimensionRecord_1Class, JDimensionRecord_1>) end;

  JDimensionRecord_Biff7Class = interface(JObjectClass)
  ['{32C64AAD-2F38-4688-8946-F24A19BA5CFA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/DimensionRecord$Biff7')]
  JDimensionRecord_Biff7 = interface(JObject)
  ['{8A4D6BB9-E20F-4C90-B775-7D90A72708E1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDimensionRecord_Biff7 = class(TJavaGenericImport<JDimensionRecord_Biff7Class, JDimensionRecord_Biff7>) end;

  JDimensionRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{0543F7D1-85D1-4B5A-AC4A-8E537DC18B8F}']
    { static Property Methods }
    {class} function _Getbiff7: JDimensionRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord): JDimensionRecord; cdecl; overload;
    {class} function init(t: JRecord; biff7: JDimensionRecord_Biff7): JDimensionRecord; cdecl; overload;

    { static Property }
    {class} property biff7: JDimensionRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/DimensionRecord')]
  JDimensionRecord = interface(JRecordData) // or JObject
  ['{1CEF19C9-DB6F-40AB-B5C3-3998FFBB1396}']
    { Property Methods }

    { methods }
    function getNumberOfRows: Integer; cdecl;
    function getNumberOfColumns: Integer; cdecl;

    { Property }
  end;

  TJDimensionRecord = class(TJavaGenericImport<JDimensionRecordClass, JDimensionRecord>) end;

  JErrorFormulaRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{747E1241-9D20-47AB-93DE-C93F658D6725}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl): JErrorFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/ErrorFormulaRecord')]
  JErrorFormulaRecord = interface(JCellValue) // or JObject
  ['{29A332F5-E532-4029-9A6A-35D638D8271F}']
    { Property Methods }

    { methods }
    function getErrorCode: Integer; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;
    function getFormula: JString; cdecl;

    { Property }
  end;

  TJErrorFormulaRecord = class(TJavaGenericImport<JErrorFormulaRecordClass, JErrorFormulaRecord>) end;

  JErrorRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{71C9075F-F83D-4F8C-98F0-9A8D8764E61B}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; fr: JFormattingRecords; si: JSheetImpl): JErrorRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/ErrorRecord')]
  JErrorRecord = interface(JCellValue) // or JObject
  ['{CB27B109-C3C9-4AEB-818D-1929C45206C4}']
    { Property Methods }

    { methods }
    function getErrorCode: Integer; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;

    { Property }
  end;

  TJErrorRecord = class(TJavaGenericImport<JErrorRecordClass, JErrorRecord>) end;

  JExternalNameRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{6CB0145C-AB52-4DE8-9C41-42EDC2A198ED}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/ExternalNameRecord')]
  JExternalNameRecord = interface(JRecordData) // or JObject
  ['{127C32A2-4DF1-40BE-8717-00F33F4B63D0}']
    { Property Methods }

    { methods }
    function isAddInFunction: Boolean; cdecl;
    function getName: JString; cdecl;

    { Property }
  end;

  TJExternalNameRecord = class(TJavaGenericImport<JExternalNameRecordClass, JExternalNameRecord>) end;

  JExternalSheetRecord_1Class = interface(JObjectClass)
  ['{1799CDE9-4E20-47C1-8E0C-2071A7FD1BB2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/ExternalSheetRecord$1')]
  JExternalSheetRecord_1 = interface(JObject)
  ['{D94410C9-6A53-43B5-B56F-1FDEAE7F6437}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJExternalSheetRecord_1 = class(TJavaGenericImport<JExternalSheetRecord_1Class, JExternalSheetRecord_1>) end;

  JExternalSheetRecord_Biff7Class = interface(JObjectClass)
  ['{5D4092AD-A363-4CEE-9D66-95B4141FFEF2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/ExternalSheetRecord$Biff7')]
  JExternalSheetRecord_Biff7 = interface(JObject)
  ['{03CA7D0D-79FC-41BF-9714-43D87DBCE7B9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJExternalSheetRecord_Biff7 = class(TJavaGenericImport<JExternalSheetRecord_Biff7Class, JExternalSheetRecord_Biff7>) end;

  JExternalSheetRecord_XTIClass = interface(JObjectClass)
  ['{2F4593EB-991A-4DB4-A6A5-DFE745A1FFEF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/ExternalSheetRecord$XTI')]
  JExternalSheetRecord_XTI = interface(JObject)
  ['{13C34C16-6F1B-435B-8F5F-F17A458B7A01}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJExternalSheetRecord_XTI = class(TJavaGenericImport<JExternalSheetRecord_XTIClass, JExternalSheetRecord_XTI>) end;

  JExternalSheetRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{2A395786-B49E-4E10-A130-374876163013}']
    { static Property Methods }
    {class} function _Getbiff7: JExternalSheetRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property biff7: JExternalSheetRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/ExternalSheetRecord')]
  JExternalSheetRecord = interface(JRecordData) // or JObject
  ['{74D9806D-9368-479C-B281-58553510111C}']
    { Property Methods }

    { methods }
    function getNumRecords: Integer; cdecl;
    function getSupbookIndex(index: Integer): Integer; cdecl;
    function getFirstTabIndex(index: Integer): Integer; cdecl;
    function getLastTabIndex(index: Integer): Integer; cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJExternalSheetRecord = class(TJavaGenericImport<JExternalSheetRecordClass, JExternalSheetRecord>) end;

  JFileClass = interface(JObjectClass)
  ['{18BCEE34-154A-4362-9E62-2D4CC99A7E9A}']
    { static Property Methods }

    { static Methods }
    {class} function init(ais: JInputStream; ws: JWorkbookSettings): JFile; cdecl; overload;
    {class} function init(d: TJavaArray<Byte>): JFile; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/File')]
  JFile = interface(JObject)
  ['{6BF62EDD-F381-4DE2-982B-E89B4984D147}']
    { Property Methods }

    { methods }
    procedure skip(bytes: Integer); cdecl;
    function read(pos: Integer; length: Integer): TJavaArray<Byte>; cdecl;
    function getPos: Integer; cdecl;
    procedure setPos(p: Integer); cdecl;
    procedure restorePos; cdecl;
    procedure close; cdecl; //Deprecated
    procedure clear; cdecl;
    function hasNext: Boolean; cdecl;

    { Property }
  end;

  TJFile = class(TJavaGenericImport<JFileClass, JFile>) end;

  JFooterRecord_1Class = interface(JObjectClass)
  ['{A4EB2DD5-D1F7-4E50-BE65-7A6D0DA4C1B3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/FooterRecord$1')]
  JFooterRecord_1 = interface(JObject)
  ['{C075EB3F-490A-4CB3-BC9E-7E5585756F41}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFooterRecord_1 = class(TJavaGenericImport<JFooterRecord_1Class, JFooterRecord_1>) end;

  JFooterRecord_Biff7Class = interface(JObjectClass)
  ['{E82BC5DC-B1FC-495B-8700-4CBF21658BE0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/FooterRecord$Biff7')]
  JFooterRecord_Biff7 = interface(JObject)
  ['{3EB579D9-68FD-4428-81CD-3C438B6FE313}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFooterRecord_Biff7 = class(TJavaGenericImport<JFooterRecord_Biff7Class, JFooterRecord_Biff7>) end;

  JFooterRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{C3D75A23-4242-4623-9AED-F6874E4B0BBA}']
    { static Property Methods }
    {class} function _Getbiff7: JFooterRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property biff7: JFooterRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/FooterRecord')]
  JFooterRecord = interface(JRecordData) // or JObject
  ['{4F709014-09E6-4418-A4A7-EC0A65AF9BCB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFooterRecord = class(TJavaGenericImport<JFooterRecordClass, JFooterRecord>) end;

  JFormulaClass = interface(JObjectClass)
  ['{4F6E462A-9E26-4F0E-B962-393E03565164}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/Formula')]
  JFormula = interface(IJavaInstance)
  ['{30C6B6F7-8802-4E43-BA63-52EF8A305D0B}']
    { Property Methods }

    { methods }
    function getFormulaData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJFormula = class(TJavaGenericImport<JFormulaClass, JFormula>) end;

  JFormulaRecord_1Class = interface(JObjectClass)
  ['{7B5E576C-F0F2-4D8E-91BD-99B27448C779}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/FormulaRecord$1')]
  JFormulaRecord_1 = interface(JObject)
  ['{4C196602-6DE6-46FA-8FEF-29BDA564CF17}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFormulaRecord_1 = class(TJavaGenericImport<JFormulaRecord_1Class, JFormulaRecord_1>) end;

  JFormulaRecord_IgnoreSharedFormulaClass = interface(JObjectClass)
  ['{9E3D01A5-165F-400D-B72D-96364792BCB2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/FormulaRecord$IgnoreSharedFormula')]
  JFormulaRecord_IgnoreSharedFormula = interface(JObject)
  ['{1D7B37AC-7726-4350-B359-46FCD0E97BE2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFormulaRecord_IgnoreSharedFormula = class(TJavaGenericImport<JFormulaRecord_IgnoreSharedFormulaClass, JFormulaRecord_IgnoreSharedFormula>) end;

  JFormulaRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{724792B0-89C7-4B6B-8071-66A6F68541CF}']
    { static Property Methods }
    {class} function _GetignoreSharedFormula: JFormulaRecord_IgnoreSharedFormula;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord; excelFile: JFile; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl; ws: JWorkbookSettings): JFormulaRecord; cdecl; overload;
    {class} function init(t: JRecord; excelFile: JFile; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; i: JFormulaRecord_IgnoreSharedFormula; si: JSheetImpl; ws: JWorkbookSettings): JFormulaRecord; cdecl; overload;

    { static Property }
    {class} property ignoreSharedFormula: JFormulaRecord_IgnoreSharedFormula read _GetignoreSharedFormula;
  end;

  [JavaSignature('jxl/read/biff/FormulaRecord')]
  JFormulaRecord = interface(JCellValue) // or JObject
  ['{D7D9FF27-BECE-4661-89B6-F49246DD8520}']
    { Property Methods }

    { methods }
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;

    { Property }
  end;

  TJFormulaRecord = class(TJavaGenericImport<JFormulaRecordClass, JFormulaRecord>) end;

  JGuttersRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{BE901B6C-68F7-420F-98DE-7C1011231DB8}']
    { static Property Methods }

    { static Methods }
    {class} function init(r: JRecord): JGuttersRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/GuttersRecord')]
  JGuttersRecord = interface(JRecordData) // or JObject
  ['{C1F3B6FF-3140-487D-A7DC-5C5127CFB929}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGuttersRecord = class(TJavaGenericImport<JGuttersRecordClass, JGuttersRecord>) end;

  JHeaderRecord_1Class = interface(JObjectClass)
  ['{26FAA48A-7A3D-4C6B-B696-DA1705DFBE3D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/HeaderRecord$1')]
  JHeaderRecord_1 = interface(JObject)
  ['{6FDB722C-6202-4DC6-8F60-9001B42E276E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHeaderRecord_1 = class(TJavaGenericImport<JHeaderRecord_1Class, JHeaderRecord_1>) end;

  JHeaderRecord_Biff7Class = interface(JObjectClass)
  ['{6E3BE47A-C7F3-4DED-98DE-34137314DACE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/HeaderRecord$Biff7')]
  JHeaderRecord_Biff7 = interface(JObject)
  ['{225BA8AA-D368-4405-B138-E20FC1F4C1C8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHeaderRecord_Biff7 = class(TJavaGenericImport<JHeaderRecord_Biff7Class, JHeaderRecord_Biff7>) end;

  JHeaderRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{DBDCC3BE-1C5E-485F-BF14-687FA4C8F2C6}']
    { static Property Methods }
    {class} function _Getbiff7: JHeaderRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property biff7: JHeaderRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/HeaderRecord')]
  JHeaderRecord = interface(JRecordData) // or JObject
  ['{613DBED2-70F2-45F5-B54A-05A25FDA56BF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHeaderRecord = class(TJavaGenericImport<JHeaderRecordClass, JHeaderRecord>) end;

  JHorizontalPageBreaksRecord_1Class = interface(JObjectClass)
  ['{4CE08AC1-CDF8-4F04-88ED-C7CE985E9A85}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/HorizontalPageBreaksRecord$1')]
  JHorizontalPageBreaksRecord_1 = interface(JObject)
  ['{E15922F6-A0E3-49F3-B1F6-B4DF46332F4E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHorizontalPageBreaksRecord_1 = class(TJavaGenericImport<JHorizontalPageBreaksRecord_1Class, JHorizontalPageBreaksRecord_1>) end;

  JHorizontalPageBreaksRecord_Biff7Class = interface(JObjectClass)
  ['{1CB1A10E-1BDC-407A-AB03-C20A419AB877}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/HorizontalPageBreaksRecord$Biff7')]
  JHorizontalPageBreaksRecord_Biff7 = interface(JObject)
  ['{854A4324-1FB6-42F7-BBBC-DCDB781ED496}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHorizontalPageBreaksRecord_Biff7 = class(TJavaGenericImport<JHorizontalPageBreaksRecord_Biff7Class, JHorizontalPageBreaksRecord_Biff7>) end;

  JHorizontalPageBreaksRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{4501E7B4-E0C9-4315-9908-6DCF6734D670}']
    { static Property Methods }
    {class} function _Getbiff7: JHorizontalPageBreaksRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord): JHorizontalPageBreaksRecord; cdecl; overload;
    {class} function init(t: JRecord; biff7: JHorizontalPageBreaksRecord_Biff7): JHorizontalPageBreaksRecord; cdecl; overload;

    { static Property }
    {class} property biff7: JHorizontalPageBreaksRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/HorizontalPageBreaksRecord')]
  JHorizontalPageBreaksRecord = interface(JRecordData) // or JObject
  ['{7D9226A6-096A-41D1-BBBC-BB9660AB4CB8}']
    { Property Methods }

    { methods }
    function getRowBreaks: TJavaArray<Integer>; cdecl;

    { Property }
  end;

  TJHorizontalPageBreaksRecord = class(TJavaGenericImport<JHorizontalPageBreaksRecordClass, JHorizontalPageBreaksRecord>) end;

  JHyperlinkRecord_1Class = interface(JObjectClass)
  ['{722F4E6F-B138-477A-A3DE-F9C44096BFAA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/HyperlinkRecord$1')]
  JHyperlinkRecord_1 = interface(JObject)
  ['{0F3E9B20-8B70-44C8-89B6-7206AAC301FC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHyperlinkRecord_1 = class(TJavaGenericImport<JHyperlinkRecord_1Class, JHyperlinkRecord_1>) end;

  JHyperlinkRecord_LinkTypeClass = interface(JObjectClass)
  ['{660EA5C3-3BE0-4242-AD73-5777C4AD8995}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/HyperlinkRecord$LinkType')]
  JHyperlinkRecord_LinkType = interface(JObject)
  ['{5F3CE613-CFEF-4605-ADF0-E94552C06246}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHyperlinkRecord_LinkType = class(TJavaGenericImport<JHyperlinkRecord_LinkTypeClass, JHyperlinkRecord_LinkType>) end;

  JHyperlinkRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{F0FFDAF9-877C-4437-A1BC-C67E35BEBD91}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/HyperlinkRecord')]
  JHyperlinkRecord = interface(JRecordData) // or JObject
  ['{6316B95D-E1E9-4D2C-A6AB-B65E91D8081E}']
    { Property Methods }

    { methods }
    function isFile: Boolean; cdecl;
    function isURL: Boolean; cdecl;
    function isLocation: Boolean; cdecl;
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getLastRow: Integer; cdecl;
    function getLastColumn: Integer; cdecl;
    function getURL: JURL; cdecl;
    function getFile: JFile; cdecl;
    function getRecord: JRecord; cdecl;
    function getRange: JRange; cdecl;
    function getLocation: JString; cdecl;

    { Property }
  end;

  TJHyperlinkRecord = class(TJavaGenericImport<JHyperlinkRecordClass, JHyperlinkRecord>) end;

  JLabelRecord_1Class = interface(JObjectClass)
  ['{1927635D-C8C6-4AA3-ACF3-98CA2165EE60}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/LabelRecord$1')]
  JLabelRecord_1 = interface(JObject)
  ['{5DE96280-30ED-4B12-9370-1035B8CB1F33}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLabelRecord_1 = class(TJavaGenericImport<JLabelRecord_1Class, JLabelRecord_1>) end;

  JLabelRecord_Biff7Class = interface(JObjectClass)
  ['{99058B46-8E5E-4D6D-980C-1ED755056113}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/LabelRecord$Biff7')]
  JLabelRecord_Biff7 = interface(JObject)
  ['{A5B6EAAC-F65A-4DBD-9B03-C090195F4335}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLabelRecord_Biff7 = class(TJavaGenericImport<JLabelRecord_Biff7Class, JLabelRecord_Biff7>) end;

  JLabelRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{1ED371E8-9FD9-4158-8C5E-18E7DB2ABD3B}']
    { static Property Methods }
    {class} function _Getbiff7: JLabelRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord; fr: JFormattingRecords; si: JSheetImpl; ws: JWorkbookSettings): JLabelRecord; cdecl; overload;
    {class} function init(t: JRecord; fr: JFormattingRecords; si: JSheetImpl; ws: JWorkbookSettings; dummy: JLabelRecord_Biff7): JLabelRecord; cdecl; overload;

    { static Property }
    {class} property biff7: JLabelRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/LabelRecord')]
  JLabelRecord = interface(JCellValue) // or JObject
  ['{4E57FF7F-AF0C-4AFF-A404-2DCA4FD1432E}']
    { Property Methods }

    { methods }
    function getString: JString; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;

    { Property }
  end;

  TJLabelRecord = class(TJavaGenericImport<JLabelRecordClass, JLabelRecord>) end;

  JLabelSSTRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{A7A971F2-C517-4976-BD8A-4943BBDAA1DF}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; stringTable: JSSTRecord; fr: JFormattingRecords; si: JSheetImpl): JLabelSSTRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/LabelSSTRecord')]
  JLabelSSTRecord = interface(JCellValue) // or JObject
  ['{BD998B27-2077-4FE3-B8AE-4DB4EF9F36F7}']
    { Property Methods }

    { methods }
    function getString: JString; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;

    { Property }
  end;

  TJLabelSSTRecord = class(TJavaGenericImport<JLabelSSTRecordClass, JLabelSSTRecord>) end;

  JLeftMarginRecordClass = interface(JMarginRecordClass) // or JObjectClass
  ['{9FDA808E-A4C2-4644-BD7F-AEFDDE01A0C7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/LeftMarginRecord')]
  JLeftMarginRecord = interface(JMarginRecord) // or JObject
  ['{E28ECF83-A99D-48EE-B988-A034C0AD77BF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLeftMarginRecord = class(TJavaGenericImport<JLeftMarginRecordClass, JLeftMarginRecord>) end;

  JMarginRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{B0F62E05-C9E6-4878-85C7-9518C071FF6B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/MarginRecord')]
  JMarginRecord = interface(JRecordData) // or JObject
  ['{B492E5CE-3AD4-4629-87AA-19F32C2EF653}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMarginRecord = class(TJavaGenericImport<JMarginRecordClass, JMarginRecord>) end;

  JMergedCellsRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{E5F15B20-83F6-49AB-AC05-F1B2070EE03D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/MergedCellsRecord')]
  JMergedCellsRecord = interface(JRecordData) // or JObject
  ['{860EECC4-A6AF-46BA-A88A-BD9560DF466D}']
    { Property Methods }

    { methods }
    function getRanges: TJavaObjectArray<JRange>; cdecl;

    { Property }
  end;

  TJMergedCellsRecord = class(TJavaGenericImport<JMergedCellsRecordClass, JMergedCellsRecord>) end;

  JMulBlankCellClass = interface(JObjectClass)
  ['{ADEF02EF-9D37-48F0-8705-7658D9FAFC36}']
    { static Property Methods }

    { static Methods }
    {class} function init(r: Integer; c: Integer; xfi: Integer; fr: JFormattingRecords; si: JSheetImpl): JMulBlankCell; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/MulBlankCell')]
  JMulBlankCell = interface(JObject)
  ['{9CD32A67-E4A3-461C-920C-680262A4D482}']
    { Property Methods }

    { methods }
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getCellFormat: JCellFormat; cdecl;
    function isHidden: Boolean; cdecl;
    function getCellFeatures: JCellFeatures; cdecl;
    procedure setCellFeatures(cf: JCellFeatures); cdecl;

    { Property }
  end;

  TJMulBlankCell = class(TJavaGenericImport<JMulBlankCellClass, JMulBlankCell>) end;

  JMulBlankRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{9D6D7558-062B-4617-9ECE-660F062CDFA5}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JMulBlankRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/MulBlankRecord')]
  JMulBlankRecord = interface(JRecordData) // or JObject
  ['{93DE7CBB-51B2-4CB4-A99B-FC2A9A4BA3BA}']
    { Property Methods }

    { methods }
    function getRow: Integer; cdecl;
    function getFirstColumn: Integer; cdecl;
    function getNumberOfColumns: Integer; cdecl;
    function getXFIndex(index: Integer): Integer; cdecl;

    { Property }
  end;

  TJMulBlankRecord = class(TJavaGenericImport<JMulBlankRecordClass, JMulBlankRecord>) end;

  JMulRKRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{FAE9BE5A-46AF-4797-8283-32C60E63B8EE}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JMulRKRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/MulRKRecord')]
  JMulRKRecord = interface(JRecordData) // or JObject
  ['{AB382F74-2732-4E80-B706-00096BE35F5B}']
    { Property Methods }

    { methods }
    function getRow: Integer; cdecl;
    function getFirstColumn: Integer; cdecl;
    function getNumberOfColumns: Integer; cdecl;
    function getRKNumber(index: Integer): Integer; cdecl;
    function getXFIndex(index: Integer): Integer; cdecl;

    { Property }
  end;

  TJMulRKRecord = class(TJavaGenericImport<JMulRKRecordClass, JMulRKRecord>) end;

  JNameRecord_1Class = interface(JObjectClass)
  ['{D0DE3E6B-B49E-4B8F-82D2-3A2BC76CE501}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/NameRecord$1')]
  JNameRecord_1 = interface(JObject)
  ['{8823A59D-586F-4591-B29B-8A82C6E22677}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNameRecord_1 = class(TJavaGenericImport<JNameRecord_1Class, JNameRecord_1>) end;

  JNameRecord_Biff7Class = interface(JObjectClass)
  ['{34A0DA3E-4FB0-4751-9B76-152A2EB1E495}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/NameRecord$Biff7')]
  JNameRecord_Biff7 = interface(JObject)
  ['{762023C8-ABBD-4FC3-91F5-FE8462FCE142}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNameRecord_Biff7 = class(TJavaGenericImport<JNameRecord_Biff7Class, JNameRecord_Biff7>) end;

  JNameRecord_NameRangeClass = interface(JObjectClass)
  ['{FF16DD7C-F796-45BB-AA4D-02E4957C1219}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/NameRecord$NameRange')]
  JNameRecord_NameRange = interface(JObject)
  ['{A7A1FBB3-D3C0-415E-800D-27442C5B7E6C}']
    { Property Methods }

    { methods }
    function getFirstColumn: Integer; cdecl;
    function getFirstRow: Integer; cdecl;
    function getLastColumn: Integer; cdecl;
    function getLastRow: Integer; cdecl;
    function getExternalSheet: Integer; cdecl;

    { Property }
  end;

  TJNameRecord_NameRange = class(TJavaGenericImport<JNameRecord_NameRangeClass, JNameRecord_NameRange>) end;

  JNameRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{013E6E2F-EA1F-490C-B7C5-482F6259EBB0}']
    { static Property Methods }
    {class} function _Getbiff7: JNameRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property biff7: JNameRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/NameRecord')]
  JNameRecord = interface(JRecordData) // or JObject
  ['{EC5DF388-9DED-4FF6-A581-7452CAD31999}']
    { Property Methods }

    { methods }
    function getName: JString; cdecl;
    function getBuiltInName: JBuiltInName; cdecl;
    function getRanges: TJavaObjectArray<JNameRecord_NameRange>; cdecl;
    function getSheetRef: Integer; cdecl;
    procedure setSheetRef(i: Integer); cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function isBiff8: Boolean; cdecl;
    function isGlobal: Boolean; cdecl;

    { Property }
  end;

  TJNameRecord = class(TJavaGenericImport<JNameRecordClass, JNameRecord>) end;

  JNineteenFourRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{27B57E75-8318-43C1-996E-AD6B2A9D5026}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JNineteenFourRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/NineteenFourRecord')]
  JNineteenFourRecord = interface(JRecordData) // or JObject
  ['{CDE70AF7-63DF-4AB5-93E5-8758568BEA2C}']
    { Property Methods }

    { methods }
    function is1904: Boolean; cdecl;

    { Property }
  end;

  TJNineteenFourRecord = class(TJavaGenericImport<JNineteenFourRecordClass, JNineteenFourRecord>) end;

  JNumberFormulaRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{296DA87D-9DF1-4B25-AF04-D3787DC27409}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl): JNumberFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/NumberFormulaRecord')]
  JNumberFormulaRecord = interface(JCellValue) // or JObject
  ['{3B5AEC27-AB1C-4EAB-BEE3-439245F980BF}']
    { Property Methods }

    { methods }
    function getValue: Double; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;
    function getFormula: JString; cdecl;
    function getNumberFormat: JNumberFormat; cdecl;

    { Property }
  end;

  TJNumberFormulaRecord = class(TJavaGenericImport<JNumberFormulaRecordClass, JNumberFormulaRecord>) end;

  JNumberRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{022F7F0D-CB8A-48D1-B84E-85B7F24244F6}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; fr: JFormattingRecords; si: JSheetImpl): JNumberRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/NumberRecord')]
  JNumberRecord = interface(JCellValue) // or JObject
  ['{2163F2FF-A8ED-4482-AECF-BB2D5B6D3C73}']
    { Property Methods }

    { methods }
    function getValue: Double; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getNumberFormat: JNumberFormat; cdecl;

    { Property }
  end;

  TJNumberRecord = class(TJavaGenericImport<JNumberRecordClass, JNumberRecord>) end;

  JNumberValue_306Class = interface(JObjectClass)
  ['{D73A2378-39ED-4028-AAE1-957385F4C692}']
    { static Property Methods }

    { static Methods }
    {class} function init(r: Integer; c: Integer; val: Double; P4: Integer; xfi: JFormattingRecords; fr: JSheetImpl): JNumberValue_306; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/NumberValue')]
  JNumberValue_306 = interface(JObject)
  ['{CF4B3EE3-421E-4C6C-92FC-17C8AB03C022}']
    { Property Methods }

    { methods }
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getValue: Double; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getCellFormat: JCellFormat; cdecl;
    function isHidden: Boolean; cdecl;
    function getNumberFormat: JNumberFormat; cdecl;
    function getCellFeatures: JCellFeatures; cdecl;
    procedure setCellFeatures(cf: JCellFeatures); cdecl;

    { Property }
  end;

  TJNumberValue_306 = class(TJavaGenericImport<JNumberValue_306Class, JNumberValue_306>) end;

  JPaletteRecord_307Class = interface(JRecordDataClass) // or JObjectClass
  ['{343CDDB6-975D-4B61-B23F-B71E4880198F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/PaletteRecord')]
  JPaletteRecord_307 = interface(JRecordData) // or JObject
  ['{2E9F3EF1-C116-4827-8684-6EF2B1BA4C4B}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJPaletteRecord_307 = class(TJavaGenericImport<JPaletteRecord_307Class, JPaletteRecord_307>) end;

  JPaneRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{B691BC1B-20FC-4FD2-8AFB-A0985E2E23F7}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JPaneRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/PaneRecord')]
  JPaneRecord = interface(JRecordData) // or JObject
  ['{010BEC4B-46EF-4A40-877F-B6F305B89B9F}']
    { Property Methods }

    { methods }
    function getRowsVisible: Integer; cdecl;
    function getColumnsVisible: Integer; cdecl;

    { Property }
  end;

  TJPaneRecord = class(TJavaGenericImport<JPaneRecordClass, JPaneRecord>) end;

  JPasswordExceptionClass = interface(JBiffExceptionClass) // or JObjectClass
  ['{0F8C42FE-C2DE-4CFC-B7BB-9A93A567A381}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPasswordException; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/PasswordException')]
  JPasswordException = interface(JBiffException) // or JObject
  ['{E740E3D5-0032-45E5-89C5-ACAB8204F09B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPasswordException = class(TJavaGenericImport<JPasswordExceptionClass, JPasswordException>) end;

  JPasswordRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{A1192CEE-A9F8-492D-9CF3-C95BD6000F4E}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JPasswordRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/PasswordRecord')]
  JPasswordRecord = interface(JRecordData) // or JObject
  ['{A12645E0-8F26-429F-9770-893F533D7CED}']
    { Property Methods }

    { methods }
    function getPasswordHash: Integer; cdecl;

    { Property }
  end;

  TJPasswordRecord = class(TJavaGenericImport<JPasswordRecordClass, JPasswordRecord>) end;

  JPLSRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{353A8EFF-8A7D-4D5D-8E78-CC6319BB42D6}']
    { static Property Methods }

    { static Methods }
    {class} function init(r: JRecord): JPLSRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/PLSRecord')]
  JPLSRecord = interface(JRecordData) // or JObject
  ['{9DBC9355-8458-435D-BCAD-CBBA4F19E499}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJPLSRecord = class(TJavaGenericImport<JPLSRecordClass, JPLSRecord>) end;

  JPrintGridLinesRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{3CF59113-DA70-47F1-AD34-F074BC79AF56}']
    { static Property Methods }

    { static Methods }
    {class} function init(pgl: JRecord): JPrintGridLinesRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/PrintGridLinesRecord')]
  JPrintGridLinesRecord = interface(JRecordData) // or JObject
  ['{06C03C54-DCAE-4452-8542-6EFCAE7E658C}']
    { Property Methods }

    { methods }
    function getPrintGridLines: Boolean; cdecl;

    { Property }
  end;

  TJPrintGridLinesRecord = class(TJavaGenericImport<JPrintGridLinesRecordClass, JPrintGridLinesRecord>) end;

  JPrintHeadersRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{11307921-092B-4AFD-B1B1-A53D5B2FF75C}']
    { static Property Methods }

    { static Methods }
    {class} function init(ph: JRecord): JPrintHeadersRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/PrintHeadersRecord')]
  JPrintHeadersRecord = interface(JRecordData) // or JObject
  ['{C37B813B-E55D-4B25-A3D0-D9B30A3965DF}']
    { Property Methods }

    { methods }
    function getPrintHeaders: Boolean; cdecl;

    { Property }
  end;

  TJPrintHeadersRecord = class(TJavaGenericImport<JPrintHeadersRecordClass, JPrintHeadersRecord>) end;

  JProtectRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{A5ECB8F3-C713-40D6-8445-5927B8DCBE59}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/ProtectRecord')]
  JProtectRecord = interface(JRecordData) // or JObject
  ['{98F4378F-0301-4906-B0B5-ABB4222E9E32}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJProtectRecord = class(TJavaGenericImport<JProtectRecordClass, JProtectRecord>) end;

  JRecordClass = interface(JObjectClass)
  ['{3DDBBAF6-EBB8-4EB4-A71B-4F949870D5D4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/Record')]
  JRecord = interface(JObject)
  ['{DB0095A3-F3A8-4B0B-940A-038D477E1960}']
    { Property Methods }

    { methods }
    function getType: JType; cdecl;
    function getLength: Integer; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function getCode: Integer; cdecl;
    procedure addContinueRecord(d: JRecord); cdecl;

    { Property }
  end;

  TJRecord = class(TJavaGenericImport<JRecordClass, JRecord>) end;

  JRightMarginRecordClass = interface(JMarginRecordClass) // or JObjectClass
  ['{179E3373-D3DA-4AE1-8C3C-6AD59167549D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/RightMarginRecord')]
  JRightMarginRecord = interface(JMarginRecord) // or JObject
  ['{434BDB84-EE2B-4119-ACFD-77597424454F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRightMarginRecord = class(TJavaGenericImport<JRightMarginRecordClass, JRightMarginRecord>) end;

  JRKHelperClass = interface(JObjectClass)
  ['{15504B65-F301-4E7F-AC97-28D5F248B258}']
    { static Property Methods }

    { static Methods }
    {class} function getDouble(rk: Integer): Double; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/RKHelper')]
  JRKHelper = interface(JObject)
  ['{8AF4518D-3C22-463A-8961-BF805916643D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRKHelper = class(TJavaGenericImport<JRKHelperClass, JRKHelper>) end;

  JRKRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{E775D248-C0EC-44C0-A6A1-24EA3B8AF3E2}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; fr: JFormattingRecords; si: JSheetImpl): JRKRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/RKRecord')]
  JRKRecord = interface(JCellValue) // or JObject
  ['{7A7D0606-1D0B-4CFD-A3A1-F68AFCEF2491}']
    { Property Methods }

    { methods }
    function getValue: Double; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getNumberFormat: JNumberFormat; cdecl;

    { Property }
  end;

  TJRKRecord = class(TJavaGenericImport<JRKRecordClass, JRKRecord>) end;

  JRowRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{98C8947E-BEE1-4DC1-A4BE-FE8087E96F78}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/RowRecord')]
  JRowRecord = interface(JRecordData) // or JObject
  ['{1B9BBDE9-356F-44CC-82F4-4F29B5124901}']
    { Property Methods }

    { methods }
    function matchesDefaultFontHeight: Boolean; cdecl;
    function getRowNumber: Integer; cdecl;
    function getOutlineLevel: Integer; cdecl;
    function getGroupStart: Boolean; cdecl;
    function getRowHeight: Integer; cdecl;
    function isCollapsed: Boolean; cdecl;
    function getXFIndex: Integer; cdecl;
    function hasDefaultFormat: Boolean; cdecl;

    { Property }
  end;

  TJRowRecord = class(TJavaGenericImport<JRowRecordClass, JRowRecord>) end;

  JRStringRecord_1Class = interface(JObjectClass)
  ['{CDE03570-80A4-4CEF-8907-8149E7886E5A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/RStringRecord$1')]
  JRStringRecord_1 = interface(JObject)
  ['{956477E7-4754-4DFE-B3C8-AD9EBC710EAC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRStringRecord_1 = class(TJavaGenericImport<JRStringRecord_1Class, JRStringRecord_1>) end;

  JRStringRecord_Biff7Class = interface(JObjectClass)
  ['{53408502-FCEA-42D3-A005-9291A5B2BFD6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/RStringRecord$Biff7')]
  JRStringRecord_Biff7 = interface(JObject)
  ['{8C53804B-1351-48DC-8548-5D6D8B8A950F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRStringRecord_Biff7 = class(TJavaGenericImport<JRStringRecord_Biff7Class, JRStringRecord_Biff7>) end;

  JRStringRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{53D9421E-1C2C-4884-A4D8-3ED3AEC90488}']
    { static Property Methods }
    {class} function _Getbiff7: JRStringRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord; fr: JFormattingRecords; si: JSheetImpl; ws: JWorkbookSettings; dummy: JRStringRecord_Biff7): JRStringRecord; cdecl;

    { static Property }
    {class} property biff7: JRStringRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/RStringRecord')]
  JRStringRecord = interface(JCellValue) // or JObject
  ['{D53A05AF-5610-48ED-896C-18CA514BD872}']
    { Property Methods }

    { methods }
    function getString: JString; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;

    { Property }
  end;

  TJRStringRecord = class(TJavaGenericImport<JRStringRecordClass, JRStringRecord>) end;

  JSaveRecalcRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{7CD0A1BF-A95A-4BDD-A471-22B8095F04D6}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord): JSaveRecalcRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SaveRecalcRecord')]
  JSaveRecalcRecord = interface(JRecordData) // or JObject
  ['{49E54C5C-DAEF-4863-9052-F535B748C9F8}']
    { Property Methods }

    { methods }
    function getRecalculateOnSave: Boolean; cdecl;

    { Property }
  end;

  TJSaveRecalcRecord = class(TJavaGenericImport<JSaveRecalcRecordClass, JSaveRecalcRecord>) end;

  JSCLRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{FBB014BF-2915-4108-8ACB-9F9F567F05B6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SCLRecord')]
  JSCLRecord = interface(JRecordData) // or JObject
  ['{5C154C50-A64A-4089-910C-EE7BA22E6151}']
    { Property Methods }

    { methods }
    function getZoomFactor: Integer; cdecl;

    { Property }
  end;

  TJSCLRecord = class(TJavaGenericImport<JSCLRecordClass, JSCLRecord>) end;

  JSetupRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{85736B82-19A7-4FE1-82B0-9CA2E0D2B06A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SetupRecord')]
  JSetupRecord = interface(JRecordData) // or JObject
  ['{072D114B-E06F-4872-8E22-97746AE64D27}']
    { Property Methods }

    { methods }
    function isPortrait: Boolean; cdecl;
    function isRightDown: Boolean; cdecl;
    function getHeaderMargin: Double; cdecl;
    function getFooterMargin: Double; cdecl;
    function getPaperSize: Integer; cdecl;
    function getScaleFactor: Integer; cdecl;
    function getPageStart: Integer; cdecl;
    function getFitWidth: Integer; cdecl;
    function getFitHeight: Integer; cdecl;
    function getHorizontalPrintResolution: Integer; cdecl;
    function getVerticalPrintResolution: Integer; cdecl;
    function getCopies: Integer; cdecl;
    function getInitialized: Boolean; cdecl;

    { Property }
  end;

  TJSetupRecord = class(TJavaGenericImport<JSetupRecordClass, JSetupRecord>) end;

  JSharedBooleanFormulaRecordClass = interface(JBaseSharedFormulaRecordClass) // or JObjectClass
  ['{4FAFF9A4-F12E-4C4D-AF84-1F283C0D30A4}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; excelFile: JFile; v: Boolean; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl): JSharedBooleanFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SharedBooleanFormulaRecord')]
  JSharedBooleanFormulaRecord = interface(JBaseSharedFormulaRecord) // or JObject
  ['{05BDCDD4-7AFA-4DB5-9B58-FFB9056F0896}']
    { Property Methods }

    { methods }
    function getValue: Boolean; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSharedBooleanFormulaRecord = class(TJavaGenericImport<JSharedBooleanFormulaRecordClass, JSharedBooleanFormulaRecord>) end;

  JSharedDateFormulaRecordClass = interface(JBaseSharedFormulaRecordClass) // or JObjectClass
  ['{44E87256-6E0C-4EA4-BFB0-CDFCF0C1669F}']
    { static Property Methods }

    { static Methods }
    {class} function init(nfr: JSharedNumberFormulaRecord; P2: JFormattingRecords; nf: Boolean; si: JSheetImpl; pos: Integer): JSharedDateFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SharedDateFormulaRecord')]
  JSharedDateFormulaRecord = interface(JBaseSharedFormulaRecord) // or JObject
  ['{6F68E61B-FF23-4711-911D-0FF14D0CB2F1}']
    { Property Methods }

    { methods }
    function getValue: Double; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;
    function getDate: JDate; cdecl;
    function isTime: Boolean; cdecl;
    function getDateFormat: JDateFormat; cdecl;

    { Property }
  end;

  TJSharedDateFormulaRecord = class(TJavaGenericImport<JSharedDateFormulaRecordClass, JSharedDateFormulaRecord>) end;

  JSharedErrorFormulaRecordClass = interface(JBaseSharedFormulaRecordClass) // or JObjectClass
  ['{79BCEAE3-FC6C-424F-A694-1FAB5F0829BD}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; excelFile: JFile; ec: Integer; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl): JSharedErrorFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SharedErrorFormulaRecord')]
  JSharedErrorFormulaRecord = interface(JBaseSharedFormulaRecord) // or JObject
  ['{2B2B0F5F-2874-47F0-A0B2-074FF2F69894}']
    { Property Methods }

    { methods }
    function getErrorCode: Integer; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSharedErrorFormulaRecord = class(TJavaGenericImport<JSharedErrorFormulaRecordClass, JSharedErrorFormulaRecord>) end;

  JSharedFormulaRecordClass = interface(JObjectClass)
  ['{A409DD44-B132-431F-8712-AEB135E15F9F}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; fr: JBaseSharedFormulaRecord; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl): JSharedFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SharedFormulaRecord')]
  JSharedFormulaRecord = interface(JObject)
  ['{967C3B0A-3AFB-463A-8404-955E00944C49}']
    { Property Methods }

    { methods }
    function add(fr: JBaseSharedFormulaRecord): Boolean; cdecl;

    { Property }
  end;

  TJSharedFormulaRecord = class(TJavaGenericImport<JSharedFormulaRecordClass, JSharedFormulaRecord>) end;

  JSharedNumberFormulaRecordClass = interface(JBaseSharedFormulaRecordClass) // or JObjectClass
  ['{BDA8A672-337A-4853-A2DF-BF3EDB4D8675}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; excelFile: JFile; v: Double; P4: JFormattingRecords; fr: JExternalSheet; es: JWorkbookMethods; nt: JSheetImpl): JSharedNumberFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SharedNumberFormulaRecord')]
  JSharedNumberFormulaRecord = interface(JBaseSharedFormulaRecord) // or JObject
  ['{45DA3D99-FFE8-4974-A19A-FD17DD9337D1}']
    { Property Methods }

    { methods }
    function getValue: Double; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;
    function getNumberFormat: JNumberFormat; cdecl;

    { Property }
  end;

  TJSharedNumberFormulaRecord = class(TJavaGenericImport<JSharedNumberFormulaRecordClass, JSharedNumberFormulaRecord>) end;

  JSharedStringFormulaRecord_1Class = interface(JObjectClass)
  ['{032AA07F-A242-4D28-A114-4F4E2E065699}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SharedStringFormulaRecord$1')]
  JSharedStringFormulaRecord_1 = interface(JObject)
  ['{3E3A7768-39BD-4079-8D4A-99FED6FB0E7E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSharedStringFormulaRecord_1 = class(TJavaGenericImport<JSharedStringFormulaRecord_1Class, JSharedStringFormulaRecord_1>) end;

  JSharedStringFormulaRecord_EmptyStringClass = interface(JObjectClass)
  ['{6C7228B4-19A1-4BB3-8948-20DB596B02DF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SharedStringFormulaRecord$EmptyString')]
  JSharedStringFormulaRecord_EmptyString = interface(JObject)
  ['{D496BB9F-B4D5-4FD2-948F-0A4BBF9DD6B1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSharedStringFormulaRecord_EmptyString = class(TJavaGenericImport<JSharedStringFormulaRecord_EmptyStringClass, JSharedStringFormulaRecord_EmptyString>) end;

  JSharedStringFormulaRecordClass = interface(JBaseSharedFormulaRecordClass) // or JObjectClass
  ['{3392DCA2-6F85-48CD-AF1D-FF122523F482}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; excelFile: JFile; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl; ws: JWorkbookSettings): JSharedStringFormulaRecord; cdecl; overload;
    {class} function init(t: JRecord; excelFile: JFile; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl; dummy: JSharedStringFormulaRecord_EmptyString): JSharedStringFormulaRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SharedStringFormulaRecord')]
  JSharedStringFormulaRecord = interface(JBaseSharedFormulaRecord) // or JObject
  ['{CA6296E6-7B87-4AC1-B0F0-C9443AB8DBBD}']
    { Property Methods }

    { methods }
    function getString: JString; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSharedStringFormulaRecord = class(TJavaGenericImport<JSharedStringFormulaRecordClass, JSharedStringFormulaRecord>) end;

  JSheetImplClass = interface(JObjectClass)
  ['{6F96B5B8-081B-4385-B7E6-7C1059556761}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SheetImpl')]
  JSheetImpl = interface(JObject)
  ['{D8F7B8F8-A5AE-485F-BA88-E4638B60606D}']
    { Property Methods }

    { methods }
    function getCell(loc: JString): JCell; cdecl; overload;
    function getCell(column: Integer; row: Integer): JCell; cdecl; overload;
    function findCell(contents: JString): JCell; cdecl;
    function findLabelCell(contents: JString): JLabelCell; cdecl;
    function getRows: Integer; cdecl;
    function getColumns: Integer; cdecl;
    function getRow(row: Integer): TJavaObjectArray<JCell>; cdecl;
    function getColumn(col: Integer): TJavaObjectArray<JCell>; cdecl;
    function getName: JString; cdecl;
    function isHidden: Boolean; cdecl; //Deprecated
    function getColumnInfo(col: Integer): JColumnInfoRecord; cdecl;
    function getColumnInfos: TJavaObjectArray<JColumnInfoRecord>; cdecl;
    function getHyperlinks: TJavaObjectArray<JHyperlink>; cdecl;
    function getMergedCells: TJavaObjectArray<JRange>; cdecl;
    function getRowProperties: TJavaObjectArray<JRowRecord>; cdecl;
    function getDataValidation: JDataValidation; cdecl;
    function getRowPageBreaks: TJavaArray<Integer>; cdecl;
    function getColumnPageBreaks: TJavaArray<Integer>; cdecl;
    function getCharts: TJavaObjectArray<JChart>; cdecl;
    function getDrawings: TJavaObjectArray<JDrawingGroupObject>; cdecl;
    function isProtected: Boolean; cdecl; //Deprecated
    function getWorkspaceOptions: JWorkspaceInformationRecord; cdecl;
    function getSettings: JSheetSettings; cdecl;
    function getWorkbook: JWorkbookParser; cdecl;
    function getColumnFormat(col: Integer): JCellFormat; cdecl; //Deprecated
    function getColumnWidth(col: Integer): Integer; cdecl;
    function getColumnView(col: Integer): JCellView; cdecl;
    function getRowHeight(row: Integer): Integer; cdecl; //Deprecated
    function getRowView(row: Integer): JCellView; cdecl;
    function getSheetBof: JBOFRecord; cdecl;
    function getWorkbookBof: JBOFRecord; cdecl;
    function getPLS: JPLSRecord; cdecl;
    function getButtonPropertySet: JButtonPropertySetRecord; cdecl;
    function getNumberOfImages: Integer; cdecl;
    function getDrawing(i: Integer): JImage; cdecl;
    function getDrawingData: JDrawingData; cdecl;
    function getConditionalFormats: TJavaObjectArray<JConditionalFormat>; cdecl;
    function getAutoFilter: JAutoFilter; cdecl;
    function getMaxColumnOutlineLevel: Integer; cdecl;
    function getMaxRowOutlineLevel: Integer; cdecl;

    { Property }
  end;

  TJSheetImpl = class(TJavaGenericImport<JSheetImplClass, JSheetImpl>) end;

  JSheetReaderClass = interface(JObjectClass)
  ['{48D55154-45EA-420A-9ED5-0DF3098C5DCB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SheetReader')]
  JSheetReader = interface(JObject)
  ['{796817FC-05C6-4CAA-9F08-4D02E26E5C31}']
    { Property Methods }

    { methods }
    function getMaxColumnOutlineLevel: Integer; cdecl;
    function getMaxRowOutlineLevel: Integer; cdecl;

    { Property }
  end;

  TJSheetReader = class(TJavaGenericImport<JSheetReaderClass, JSheetReader>) end;

  JSortRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{5FB6AA79-B8F6-4698-BC5D-8E5B739E0E55}']
    { static Property Methods }

    { static Methods }
    {class} function init(r: JRecord): JSortRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SortRecord')]
  JSortRecord = interface(JRecordData) // or JObject
  ['{184D8A44-D05D-4930-903E-B0C46088BEDC}']
    { Property Methods }

    { methods }
    function getSortCol1Name: JString; cdecl;
    function getSortCol2Name: JString; cdecl;
    function getSortCol3Name: JString; cdecl;
    function getSortColumns: Boolean; cdecl;
    function getSortKey1Desc: Boolean; cdecl;
    function getSortKey2Desc: Boolean; cdecl;
    function getSortKey3Desc: Boolean; cdecl;
    function getSortCaseSensitive: Boolean; cdecl;

    { Property }
  end;

  TJSortRecord = class(TJavaGenericImport<JSortRecordClass, JSortRecord>) end;

  JSSTRecord_1Class = interface(JObjectClass)
  ['{EAB17B8C-BA55-43FB-8008-750F976519CC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SSTRecord$1')]
  JSSTRecord_1 = interface(JObject)
  ['{855E50E1-39A1-4DC1-881C-468055AEA170}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSSTRecord_1 = class(TJavaGenericImport<JSSTRecord_1Class, JSSTRecord_1>) end;

  JSSTRecord_BooleanHolderClass = interface(JObjectClass)
  ['{8C59E4C8-0A19-4C2D-810B-020D1BD9FD10}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SSTRecord$BooleanHolder')]
  JSSTRecord_BooleanHolder = interface(JObject)
  ['{F11AE53D-85C1-4B1F-964E-A90B85DC26D5}']
    { Property Methods }
    function _Getvalue: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setvalue(avalue: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property value: Boolean read _Getvalue write _Setvalue;
  end;

  TJSSTRecord_BooleanHolder = class(TJavaGenericImport<JSSTRecord_BooleanHolderClass, JSSTRecord_BooleanHolder>) end;

  JSSTRecord_ByteArrayHolderClass = interface(JObjectClass)
  ['{F67438CF-1471-47F9-BDED-0098715FC352}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SSTRecord$ByteArrayHolder')]
  JSSTRecord_ByteArrayHolder = interface(JObject)
  ['{EFBDA867-7747-4734-90CD-BBE0A665EE07}']
    { Property Methods }
    function _Getbytes: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setbytes(abytes: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property bytes: TJavaArray<Byte> read _Getbytes write _Setbytes;
  end;

  TJSSTRecord_ByteArrayHolder = class(TJavaGenericImport<JSSTRecord_ByteArrayHolderClass, JSSTRecord_ByteArrayHolder>) end;

  JSSTRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{B44EDB9C-6947-49E5-875A-84D774690D95}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; continuations: TJavaObjectArray<JRecord>; ws: JWorkbookSettings): JSSTRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SSTRecord')]
  JSSTRecord = interface(JRecordData) // or JObject
  ['{40A9D3F5-111A-44BA-87C9-C6824F0545AE}']
    { Property Methods }

    { methods }
    function getString(index: Integer): JString; cdecl;

    { Property }
  end;

  TJSSTRecord = class(TJavaGenericImport<JSSTRecordClass, JSSTRecord>) end;

  JStringFormulaRecordClass = interface(JCellValueClass) // or JObjectClass
  ['{EA84CAB3-8B32-4DA8-91DE-DEA894A1715D}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JRecord; excelFile: JFile; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl; ws: JWorkbookSettings): JStringFormulaRecord; cdecl; overload;
    {class} function init(t: JRecord; fr: JFormattingRecords; es: JExternalSheet; nt: JWorkbookMethods; si: JSheetImpl): JStringFormulaRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/StringFormulaRecord')]
  JStringFormulaRecord = interface(JCellValue) // or JObject
  ['{930436E8-61B2-418C-A1B2-027A59D51EB9}']
    { Property Methods }

    { methods }
    function getContents: JString; cdecl;
    function getString: JString; cdecl;
    function getType: JCellType; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;
    function getFormula: JString; cdecl;

    { Property }
  end;

  TJStringFormulaRecord = class(TJavaGenericImport<JStringFormulaRecordClass, JStringFormulaRecord>) end;

  JSupbookRecord_1Class = interface(JObjectClass)
  ['{65AED9D7-6095-4C1D-9E8B-B5A48AB0A743}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SupbookRecord$1')]
  JSupbookRecord_1 = interface(JObject)
  ['{77FCC5D2-B933-4D21-B57D-AF06888EB674}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSupbookRecord_1 = class(TJavaGenericImport<JSupbookRecord_1Class, JSupbookRecord_1>) end;

  JSupbookRecord_TypeClass = interface(JObjectClass)
  ['{43BF40C6-00E3-42C2-AEBB-A8578826BCF0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/SupbookRecord$Type')]
  JSupbookRecord_Type = interface(JObject)
  ['{4185374C-89DC-40AA-B98C-4EDF0ADDC67D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSupbookRecord_Type = class(TJavaGenericImport<JSupbookRecord_TypeClass, JSupbookRecord_Type>) end;

  JSupbookRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{57B1F0C6-0DFC-415A-920E-4839ACEFD6ED}']
    { static Property Methods }
    {class} function _GetINTERNAL: JSupbookRecord_Type;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXTERNAL: JSupbookRecord_Type;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetADDIN: JSupbookRecord_Type;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLINK: JSupbookRecord_Type;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JSupbookRecord_Type;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property INTERNAL: JSupbookRecord_Type read _GetINTERNAL;
    {class} property &EXTERNAL: JSupbookRecord_Type read _GetEXTERNAL;
    {class} property ADDIN: JSupbookRecord_Type read _GetADDIN;
    {class} property LINK: JSupbookRecord_Type read _GetLINK;
    {class} property UNKNOWN: JSupbookRecord_Type read _GetUNKNOWN;
  end;

  [JavaSignature('jxl/read/biff/SupbookRecord')]
  JSupbookRecord = interface(JRecordData) // or JObject
  ['{F2A22927-9BFE-47EC-B264-54934D82567F}']
    { Property Methods }

    { methods }
    function getType: JSupbookRecord_Type; cdecl;
    function getNumberOfSheets: Integer; cdecl;
    function getFileName: JString; cdecl;
    function getSheetName(i: Integer): JString; cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSupbookRecord = class(TJavaGenericImport<JSupbookRecordClass, JSupbookRecord>) end;

  JTopMarginRecordClass = interface(JMarginRecordClass) // or JObjectClass
  ['{D696B8C4-BB17-4B3C-B8CD-56624F6AABA3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/TopMarginRecord')]
  JTopMarginRecord = interface(JMarginRecord) // or JObject
  ['{73A1D60F-21BC-405A-919B-53EB9C3BE434}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTopMarginRecord = class(TJavaGenericImport<JTopMarginRecordClass, JTopMarginRecord>) end;

  JVerticalPageBreaksRecord_1Class = interface(JObjectClass)
  ['{419A3A98-982D-4C86-905E-5DAEDFB90413}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/VerticalPageBreaksRecord$1')]
  JVerticalPageBreaksRecord_1 = interface(JObject)
  ['{2AFCB068-AFD8-439E-B02A-CF1EEA78D0DB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVerticalPageBreaksRecord_1 = class(TJavaGenericImport<JVerticalPageBreaksRecord_1Class, JVerticalPageBreaksRecord_1>) end;

  JVerticalPageBreaksRecord_Biff7Class = interface(JObjectClass)
  ['{541BE5D1-E8D4-4F08-B884-4B808C5B0CC0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/VerticalPageBreaksRecord$Biff7')]
  JVerticalPageBreaksRecord_Biff7 = interface(JObject)
  ['{E77E2678-4B3F-4F29-8090-86C6298B2387}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVerticalPageBreaksRecord_Biff7 = class(TJavaGenericImport<JVerticalPageBreaksRecord_Biff7Class, JVerticalPageBreaksRecord_Biff7>) end;

  JVerticalPageBreaksRecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{1EB4D4DD-B272-46BA-AAE8-2336F140A338}']
    { static Property Methods }
    {class} function _Getbiff7: JVerticalPageBreaksRecord_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord): JVerticalPageBreaksRecord; cdecl; overload;
    {class} function init(t: JRecord; biff7: JVerticalPageBreaksRecord_Biff7): JVerticalPageBreaksRecord; cdecl; overload;

    { static Property }
    {class} property biff7: JVerticalPageBreaksRecord_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/VerticalPageBreaksRecord')]
  JVerticalPageBreaksRecord = interface(JRecordData) // or JObject
  ['{CF373458-D042-4598-A804-B04B87D98035}']
    { Property Methods }

    { methods }
    function getColumnBreaks: TJavaArray<Integer>; cdecl;

    { Property }
  end;

  TJVerticalPageBreaksRecord = class(TJavaGenericImport<JVerticalPageBreaksRecordClass, JVerticalPageBreaksRecord>) end;

  JWindow2Record_1Class = interface(JObjectClass)
  ['{04221198-CB02-41E9-B99D-A8E0778138E2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/Window2Record$1')]
  JWindow2Record_1 = interface(JObject)
  ['{B2EAC158-3E16-45BB-8827-3C474E8A3849}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWindow2Record_1 = class(TJavaGenericImport<JWindow2Record_1Class, JWindow2Record_1>) end;

  JWindow2Record_Biff7Class = interface(JObjectClass)
  ['{9A30294C-9096-40EF-ABBA-9DE5ED444A35}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/Window2Record$Biff7')]
  JWindow2Record_Biff7 = interface(JObject)
  ['{B5F6D12D-CC02-459D-8934-E1F90F87DEA7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWindow2Record_Biff7 = class(TJavaGenericImport<JWindow2Record_Biff7Class, JWindow2Record_Biff7>) end;

  JWindow2RecordClass = interface(JRecordDataClass) // or JObjectClass
  ['{277241EA-D95F-4329-9D5D-190E9B1A25FA}']
    { static Property Methods }
    {class} function _Getbiff7: JWindow2Record_Biff7;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(t: JRecord): JWindow2Record; cdecl; overload;
    {class} function init(t: JRecord; biff7: JWindow2Record_Biff7): JWindow2Record; cdecl; overload;

    { static Property }
    {class} property biff7: JWindow2Record_Biff7 read _Getbiff7;
  end;

  [JavaSignature('jxl/read/biff/Window2Record')]
  JWindow2Record = interface(JRecordData) // or JObject
  ['{D7E9A575-C649-4664-AC13-DCF86DE26283}']
    { Property Methods }

    { methods }
    function isSelected: Boolean; cdecl;
    function getShowGridLines: Boolean; cdecl;
    function getDisplayZeroValues: Boolean; cdecl;
    function getFrozen: Boolean; cdecl;
    function getFrozenNotSplit: Boolean; cdecl;
    function isPageBreakPreview: Boolean; cdecl;
    function getPageBreakPreviewMagnificaiton: Integer; cdecl;
    function getNormalMagnificaiton: Integer; cdecl;

    { Property }
  end;

  TJWindow2Record = class(TJavaGenericImport<JWindow2RecordClass, JWindow2Record>) end;

  JWorkbookParserClass = interface(JWorkbookClass) // or JObjectClass
  ['{A044FAB9-790A-47E2-A7FF-786B91CC5733}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JFile; s: JWorkbookSettings): JWorkbookParser; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/read/biff/WorkbookParser')]
  JWorkbookParser = interface(JWorkbook) // or JObject
  ['{B7FA9448-9A65-4998-8C53-000403311695}']
    { Property Methods }

    { methods }
    function getSheets: TJavaObjectArray<JSheet>; cdecl;
    function getReadSheet(index: Integer): JSheet; cdecl;
    function getSheet(index: Integer): JSheet; cdecl; overload;
    function getSheet(name: JString): JSheet; cdecl; overload;
    function getSheetNames: TJavaObjectArray<JString>; cdecl;
    function getExternalSheetIndex(index: Integer): Integer; cdecl; overload;
    function getLastExternalSheetIndex(index: Integer): Integer; cdecl; overload;
    function getExternalSheetName(index: Integer): JString; cdecl;
    function getLastExternalSheetName(index: Integer): JString; cdecl;
    function getNumberOfSheets: Integer; cdecl;
    procedure close; cdecl;
    function getFormattingRecords: JFormattingRecords; cdecl;
    function getExternalSheetRecord: JExternalSheetRecord; cdecl;
    function getMsoDrawingGroupRecord: JMsoDrawingGroupRecord; cdecl;
    function getSupbookRecords: TJavaObjectArray<JSupbookRecord>; cdecl;
    function getNameRecords: TJavaObjectArray<JNameRecord>; cdecl;
    function getFonts: JFonts; cdecl;
    function getCell(loc: JString): JCell; cdecl;
    function findCellByName(name: JString): JCell; cdecl;
    function findByName(name: JString): TJavaObjectArray<JRange>; cdecl;
    function getRangeNames: TJavaObjectArray<JString>; cdecl;
    function getWorkbookBof: JBOFRecord; cdecl;
    function isProtected: Boolean; cdecl;
    function getSettings: JWorkbookSettings; cdecl;
    function getExternalSheetIndex(sheetName: JString): Integer; cdecl; overload;
    function getLastExternalSheetIndex(sheetName: JString): Integer; cdecl; overload;
    function getName(index: Integer): JString; cdecl;
    function getNameIndex(name: JString): Integer; cdecl;
    function getDrawingGroup: JDrawingGroup; cdecl;
    function getCompoundFile: JCompoundFile; cdecl;
    function containsMacros: Boolean; cdecl;
    function getButtonPropertySet: JButtonPropertySetRecord; cdecl;
    function getCountryRecord: JCountryRecord; cdecl;
    function getAddInFunctionNames: TJavaObjectArray<JString>; cdecl;
    function getIndex(sheet: JSheet): Integer; cdecl;

    { Property }
  end;

  TJWorkbookParser = class(TJavaGenericImport<JWorkbookParserClass, JWorkbookParser>) end;

  JSheetClass = interface(JObjectClass)
  ['{72E95275-881C-4434-A2DA-445A6940D58D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/Sheet')]
  JSheet = interface(IJavaInstance)
  ['{E9646AA7-C831-4321-B8A4-3A8D21810354}']
    { Property Methods }

    { methods }
    function getCell(P1: Integer; P2: Integer): JCell; cdecl; overload;
    function getCell(P1: JString): JCell; cdecl; overload;
    function getRows: Integer; cdecl;
    function getColumns: Integer; cdecl;
    function getRow(P1: Integer): TJavaObjectArray<JCell>; cdecl;
    function getColumn(P1: Integer): TJavaObjectArray<JCell>; cdecl;
    function getName: JString; cdecl;
    function isHidden: Boolean; cdecl; //Deprecated
    function isProtected: Boolean; cdecl; //Deprecated
    function findCell(P1: JString): JCell; cdecl;
    function findLabelCell(P1: JString): JLabelCell; cdecl;
    function getHyperlinks: TJavaObjectArray<JHyperlink>; cdecl;
    function getMergedCells: TJavaObjectArray<JRange>; cdecl;
    function getSettings: JSheetSettings; cdecl;
    function getColumnFormat(P1: Integer): JCellFormat; cdecl; //Deprecated
    function getColumnWidth(P1: Integer): Integer; cdecl; //Deprecated
    function getColumnView(P1: Integer): JCellView; cdecl;
    function getRowHeight(P1: Integer): Integer; cdecl; //Deprecated
    function getRowView(P1: Integer): JCellView; cdecl;
    function getNumberOfImages: Integer; cdecl;
    function getDrawing(P1: Integer): JImage; cdecl;
    function getRowPageBreaks: TJavaArray<Integer>; cdecl;
    function getColumnPageBreaks: TJavaArray<Integer>; cdecl;

    { Property }
  end;

  TJSheet = class(TJavaGenericImport<JSheetClass, JSheet>) end;

  JSheetSettingsClass = interface(JObjectClass)
  ['{AB7E649D-0F64-4AE4-8A4D-F5BC71612AE6}']
    { static Property Methods }
    {class} function _GetDEFAULT_DEFAULT_ROW_HEIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(s: JSheet): JSheetSettings; cdecl; overload;
    {class} function init(copy: JSheetSettings; s: JSheet): JSheetSettings; cdecl; overload;

    { static Property }
    {class} property DEFAULT_DEFAULT_ROW_HEIGHT: Integer read _GetDEFAULT_DEFAULT_ROW_HEIGHT;
  end;

  [JavaSignature('jxl/SheetSettings')]
  JSheetSettings = interface(JObject)
  ['{FB026394-22F6-49C4-AC7F-A38D4AA2B42F}']
    { Property Methods }

    { methods }
    procedure setOrientation(po: JPageOrientation); cdecl;
    function getOrientation: JPageOrientation; cdecl;
    function getPageOrder: JPageOrder; cdecl;
    procedure setPageOrder(order: JPageOrder); cdecl;
    procedure setPaperSize(ps: JPaperSize); cdecl;
    function getPaperSize: JPaperSize; cdecl;
    function isProtected: Boolean; cdecl;
    procedure setProtected(p: Boolean); cdecl;
    procedure setHeaderMargin(d: Double); cdecl;
    function getHeaderMargin: Double; cdecl;
    procedure setFooterMargin(d: Double); cdecl;
    function getFooterMargin: Double; cdecl;
    procedure setHidden(h: Boolean); cdecl;
    function isHidden: Boolean; cdecl;
    procedure setSelected; cdecl; overload; //Deprecated
    procedure setSelected(s: Boolean); cdecl; overload;
    function isSelected: Boolean; cdecl;
    procedure setScaleFactor(sf: Integer); cdecl;
    function getScaleFactor: Integer; cdecl;
    procedure setPageStart(ps: Integer); cdecl;
    function getPageStart: Integer; cdecl;
    procedure setFitWidth(fw: Integer); cdecl;
    function getFitWidth: Integer; cdecl;
    procedure setFitHeight(fh: Integer); cdecl;
    function getFitHeight: Integer; cdecl;
    procedure setHorizontalPrintResolution(hpw: Integer); cdecl;
    function getHorizontalPrintResolution: Integer; cdecl;
    procedure setVerticalPrintResolution(vpw: Integer); cdecl;
    function getVerticalPrintResolution: Integer; cdecl;
    procedure setRightMargin(m: Double); cdecl;
    function getRightMargin: Double; cdecl;
    procedure setLeftMargin(m: Double); cdecl;
    function getLeftMargin: Double; cdecl;
    procedure setTopMargin(m: Double); cdecl;
    function getTopMargin: Double; cdecl;
    procedure setBottomMargin(m: Double); cdecl;
    function getBottomMargin: Double; cdecl;
    function getDefaultWidthMargin: Double; cdecl;
    function getDefaultHeightMargin: Double; cdecl;
    function getFitToPages: Boolean; cdecl;
    procedure setFitToPages(b: Boolean); cdecl;
    function getPassword: JString; cdecl;
    procedure setPassword(s: JString); cdecl;
    function getPasswordHash: Integer; cdecl;
    procedure setPasswordHash(ph: Integer); cdecl;
    function getDefaultColumnWidth: Integer; cdecl;
    procedure setDefaultColumnWidth(w: Integer); cdecl;
    function getDefaultRowHeight: Integer; cdecl;
    procedure setDefaultRowHeight(h: Integer); cdecl;
    function getZoomFactor: Integer; cdecl;
    procedure setZoomFactor(zf: Integer); cdecl;
    function getPageBreakPreviewMagnification: Integer; cdecl;
    procedure setPageBreakPreviewMagnification(f: Integer); cdecl;
    function getNormalMagnification: Integer; cdecl;
    procedure setNormalMagnification(f: Integer); cdecl;
    function getDisplayZeroValues: Boolean; cdecl;
    procedure setDisplayZeroValues(b: Boolean); cdecl;
    function getShowGridLines: Boolean; cdecl;
    procedure setShowGridLines(b: Boolean); cdecl;
    function getPageBreakPreviewMode: Boolean; cdecl;
    procedure setPageBreakPreviewMode(b: Boolean); cdecl;
    function getPrintGridLines: Boolean; cdecl;
    procedure setPrintGridLines(b: Boolean); cdecl;
    function getPrintHeaders: Boolean; cdecl;
    procedure setPrintHeaders(b: Boolean); cdecl;
    function getHorizontalFreeze: Integer; cdecl;
    procedure setHorizontalFreeze(row: Integer); cdecl;
    function getVerticalFreeze: Integer; cdecl;
    procedure setVerticalFreeze(col: Integer); cdecl;
    procedure setCopies(c: Integer); cdecl;
    function getCopies: Integer; cdecl;
    function getHeader: JHeaderFooter; cdecl;
    procedure setHeader(h: JHeaderFooter); cdecl;
    procedure setFooter(f: JHeaderFooter); cdecl;
    function getFooter: JHeaderFooter; cdecl;
    function isHorizontalCentre: Boolean; cdecl;
    procedure setHorizontalCentre(horizCentre: Boolean); cdecl;
    function isVerticalCentre: Boolean; cdecl;
    procedure setVerticalCentre(vertCentre: Boolean); cdecl;
    procedure setAutomaticFormulaCalculation(auto: Boolean); cdecl;
    function getAutomaticFormulaCalculation: Boolean; cdecl;
    procedure setRecalculateFormulasBeforeSave(recalc: Boolean); cdecl;
    function getRecalculateFormulasBeforeSave: Boolean; cdecl;
    procedure setPrintArea(firstCol: Integer; firstRow: Integer; lastCol: Integer; lastRow: Integer); cdecl;
    function getPrintArea: JRange; cdecl;
    procedure setPrintTitles(firstRow: Integer; lastRow: Integer; firstCol: Integer; lastCol: Integer); cdecl;
    procedure setPrintTitlesRow(firstRow: Integer; lastRow: Integer); cdecl;
    procedure setPrintTitlesCol(firstCol: Integer; lastCol: Integer); cdecl;
    function getPrintTitlesRow: JRange; cdecl;
    function getPrintTitlesCol: JRange; cdecl;

    { Property }
  end;

  TJSheetSettings = class(TJavaGenericImport<JSheetSettingsClass, JSheetSettings>) end;

  JStringFormulaCellClass = interface(JObjectClass)
  ['{C6A49942-FBD9-4821-943F-42E054C75879}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/StringFormulaCell')]
  JStringFormulaCell = interface(IJavaInstance)
  ['{65081B9B-3E07-4686-9820-F7B954604657}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStringFormulaCell = class(TJavaGenericImport<JStringFormulaCellClass, JStringFormulaCell>) end;

  JWorkbookClass = interface(JObjectClass)
  ['{69432902-A4E8-4F1F-8A25-05C33F448E53}']
    { static Property Methods }

    { static Methods }
    {class} function getVersion: JString; cdecl;
    {class} function getWorkbook(afile: JFile): JWorkbook; cdecl; overload;
    {class} function getWorkbook(afile: JFile; ws: JWorkbookSettings): JWorkbook; cdecl; overload;
    {class} function getWorkbook(ais: JInputStream): JWorkbook; cdecl; overload;
    {class} function getWorkbook(ais: JInputStream; ws: JWorkbookSettings): JWorkbook; cdecl; overload;
    {class} function createWorkbook(afile: JFile): JWritableWorkbook; cdecl; overload;
    {class} function createWorkbook(afile: JFile; ws: JWorkbookSettings): JWritableWorkbook; cdecl; overload;
    {class} function createWorkbook(afile: JFile; ain: JWorkbook): JWritableWorkbook; cdecl; overload;
    {class} function createWorkbook(afile: JFile; ain: JWorkbook; ws: JWorkbookSettings): JWritableWorkbook; cdecl; overload;
    {class} function createWorkbook(os: JOutputStream; ain: JWorkbook): JWritableWorkbook; cdecl; overload;
    {class} function createWorkbook(os: JOutputStream; ain: JWorkbook; ws: JWorkbookSettings): JWritableWorkbook; cdecl; overload;
    {class} function createWorkbook(os: JOutputStream): JWritableWorkbook; cdecl; overload;
    {class} function createWorkbook(os: JOutputStream; ws: JWorkbookSettings): JWritableWorkbook; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/Workbook')]
  JWorkbook = interface(JObject)
  ['{BCA4FFE0-F105-49E3-9A2F-9EA1AE62F175}']
    { Property Methods }

    { methods }
    function getSheets: TJavaObjectArray<JSheet>; cdecl;
    function getSheetNames: TJavaObjectArray<JString>; cdecl;
    function getSheet(P1: Integer): JSheet; cdecl; overload;
    function getSheet(P1: JString): JSheet; cdecl; overload;
    function getNumberOfSheets: Integer; cdecl;
    function findCellByName(P1: JString): JCell; cdecl;
    function getCell(P1: JString): JCell; cdecl;
    function findByName(P1: JString): TJavaObjectArray<JRange>; cdecl;
    function getRangeNames: TJavaObjectArray<JString>; cdecl;
    function isProtected: Boolean; cdecl;
    procedure close; cdecl;

    { Property }
  end;

  TJWorkbook = class(TJavaGenericImport<JWorkbookClass, JWorkbook>) end;

  JWorkbookSettingsClass = interface(JObjectClass)
  ['{43149C86-E627-4D49-852E-60D6C8E572BD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWorkbookSettings; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/WorkbookSettings')]
  JWorkbookSettings = interface(JObject)
  ['{47FD5876-E4FD-49DB-B53A-4BA524A71DB1}']
    { Property Methods }

    { methods }
    procedure setArrayGrowSize(sz: Integer); cdecl;
    function getArrayGrowSize: Integer; cdecl;
    procedure setInitialFileSize(sz: Integer); cdecl;
    function getInitialFileSize: Integer; cdecl;
    function getDrawingsDisabled: Boolean; cdecl;
    function getGCDisabled: Boolean; cdecl;
    function getNamesDisabled: Boolean; cdecl;
    procedure setNamesDisabled(b: Boolean); cdecl;
    procedure setDrawingsDisabled(b: Boolean); cdecl;
    procedure setRationalization(r: Boolean); cdecl;
    function getRationalizationDisabled: Boolean; cdecl;
    function getMergedCellCheckingDisabled: Boolean; cdecl;
    procedure setMergedCellChecking(b: Boolean); cdecl;
    procedure setPropertySets(r: Boolean); cdecl;
    function getPropertySetsDisabled: Boolean; cdecl;
    procedure setSuppressWarnings(w: Boolean); cdecl;
    function getFormulaAdjust: Boolean; cdecl;
    procedure setFormulaAdjust(b: Boolean); cdecl;
    procedure setLocale(l: JLocale); cdecl;
    function getLocale: JLocale; cdecl;
    function getEncoding: JString; cdecl;
    procedure setEncoding(enc: JString); cdecl;
    function getFunctionNames: JFunctionNames; cdecl;
    function getCharacterSet: Integer; cdecl;
    procedure setCharacterSet(cs: Integer); cdecl;
    procedure setGCDisabled(disabled: Boolean); cdecl;
    procedure setIgnoreBlanks(ignoreBlanks: Boolean); cdecl;
    function getIgnoreBlanks: Boolean; cdecl;
    procedure setCellValidationDisabled(cv: Boolean); cdecl;
    function getCellValidationDisabled: Boolean; cdecl;
    function getExcelDisplayLanguage: JString; cdecl;
    function getExcelRegionalSettings: JString; cdecl;
    procedure setExcelDisplayLanguage(code: JString); cdecl;
    procedure setExcelRegionalSettings(code: JString); cdecl;
    function getAutoFilterDisabled: Boolean; cdecl;
    procedure setAutoFilterDisabled(disabled: Boolean); cdecl;
    function getUseTemporaryFileDuringWrite: Boolean; cdecl;
    procedure setUseTemporaryFileDuringWrite(temp: Boolean); cdecl;
    procedure setTemporaryFileDuringWriteDirectory(dir: JFile); cdecl;
    function getTemporaryFileDuringWriteDirectory: JFile; cdecl;

    { Property }
  end;

  TJWorkbookSettings = class(TJavaGenericImport<JWorkbookSettingsClass, JWorkbookSettings>) end;

  JAlignment_358Class = interface(JAlignmentClass) // or JObjectClass
  ['{465123B5-2512-42D9-99D8-5C5AE2BA0668}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/Alignment')]
  JAlignment_358 = interface(JAlignment) // or JObject
  ['{717F5235-C23C-4886-8C5E-226E0A4F3FD0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAlignment_358 = class(TJavaGenericImport<JAlignment_358Class, JAlignment_358>) end;

  JArbitraryRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{EDE5195F-CB06-4064-B8B5-B7CDA9D86862}']
    { static Property Methods }

    { static Methods }
    {class} function init(atype: Integer; d: TJavaArray<Byte>): JArbitraryRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ArbitraryRecord')]
  JArbitraryRecord = interface(JWritableRecordData) // or JObject
  ['{CF39849D-6E7B-4C12-A806-554DDB1294DA}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJArbitraryRecord = class(TJavaGenericImport<JArbitraryRecordClass, JArbitraryRecord>) end;

  JBackupRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{765D7B60-C3C0-4B8F-ADB3-F1539B085999}']
    { static Property Methods }

    { static Methods }
    {class} function init(bu: Boolean): JBackupRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/BackupRecord')]
  JBackupRecord = interface(JWritableRecordData) // or JObject
  ['{D13F3BAB-909B-4F27-B906-DECE4F22B818}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJBackupRecord = class(TJavaGenericImport<JBackupRecordClass, JBackupRecord>) end;

  JBlankRecordClass = interface(JCellValue_374Class) // or JObjectClass
  ['{2A51C4BC-163A-4025-A893-0C4E6D3780FE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/BlankRecord')]
  JBlankRecord = interface(JCellValue_374) // or JObject
  ['{DE0B182D-7493-4B09-8AC7-B3CB688741B6}']
    { Property Methods }

    { methods }
    function getType: JCellType; cdecl;
    function getContents: JString; cdecl;

    { Property }
  end;

  TJBlankRecord = class(TJavaGenericImport<JBlankRecordClass, JBlankRecord>) end;

  JBOFRecord_1Class = interface(JObjectClass)
  ['{84561E45-B0ED-4254-97EA-EE6F2EAD580C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/BOFRecord$1')]
  JBOFRecord_1 = interface(JObject)
  ['{44DB73EE-4CB2-4805-AC7C-FE99137CE420}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBOFRecord_1 = class(TJavaGenericImport<JBOFRecord_1Class, JBOFRecord_1>) end;

  JBOFRecord_SheetBOFClass = interface(JObjectClass)
  ['{D5F72B61-641D-47EA-BB9D-B2BFC8E9AE5E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/BOFRecord$SheetBOF')]
  JBOFRecord_SheetBOF = interface(JObject)
  ['{106FBB50-D897-4571-9D29-F2D8799BE568}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBOFRecord_SheetBOF = class(TJavaGenericImport<JBOFRecord_SheetBOFClass, JBOFRecord_SheetBOF>) end;

  JBOFRecord_WorkbookGlobalsBOFClass = interface(JObjectClass)
  ['{6B5BD042-8B35-4B28-B5FF-2489F68CE42F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/BOFRecord$WorkbookGlobalsBOF')]
  JBOFRecord_WorkbookGlobalsBOF = interface(JObject)
  ['{BFFDF256-5DF1-4D01-964D-757433D11C92}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBOFRecord_WorkbookGlobalsBOF = class(TJavaGenericImport<JBOFRecord_WorkbookGlobalsBOFClass, JBOFRecord_WorkbookGlobalsBOF>) end;

  JBOFRecord_365Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{8AF8897E-9114-4EF1-91CA-6AFB0566EC09}']
    { static Property Methods }
    {class} function _GetworkbookGlobals: JBOFRecord_WorkbookGlobalsBOF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getsheet: JBOFRecord_SheetBOF;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(dummy: JBOFRecord_WorkbookGlobalsBOF): JBOFRecord_365; cdecl; overload;
    {class} function init(dummy: JBOFRecord_SheetBOF): JBOFRecord_365; cdecl; overload;

    { static Property }
    {class} property workbookGlobals: JBOFRecord_WorkbookGlobalsBOF read _GetworkbookGlobals;
    {class} property sheet: JBOFRecord_SheetBOF read _Getsheet;
  end;

  [JavaSignature('jxl/write/biff/BOFRecord')]
  JBOFRecord_365 = interface(JWritableRecordData) // or JObject
  ['{B2C96879-F530-4148-988A-EF461DB70B75}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJBOFRecord_365 = class(TJavaGenericImport<JBOFRecord_365Class, JBOFRecord_365>) end;

  JBookboolRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{8E715C3B-F816-4381-B4D3-C5C9114D95E7}']
    { static Property Methods }

    { static Methods }
    {class} function init(extlink: Boolean): JBookboolRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/BookboolRecord')]
  JBookboolRecord = interface(JWritableRecordData) // or JObject
  ['{692B1161-2761-4EA7-B11F-1278F3D7DA10}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJBookboolRecord = class(TJavaGenericImport<JBookboolRecordClass, JBookboolRecord>) end;

  JBooleanRecord_367Class = interface(JCellValue_374Class) // or JObjectClass
  ['{35AD86FA-F55E-41C8-8703-E6AFCC4E4C6F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/BooleanRecord')]
  JBooleanRecord_367 = interface(JCellValue_374) // or JObject
  ['{75680140-1BA3-4F45-BEEB-C974AAEB7DEF}']
    { Property Methods }

    { methods }
    function getValue: Boolean; cdecl;
    function getContents: JString; cdecl;
    function getType: JCellType; cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJBooleanRecord_367 = class(TJavaGenericImport<JBooleanRecord_367Class, JBooleanRecord_367>) end;

  JBottomMarginRecord_368Class = interface(JMarginRecord_420Class) // or JObjectClass
  ['{12D91E21-19A0-43D4-9DAC-A797E0DDCC6B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/BottomMarginRecord')]
  JBottomMarginRecord_368 = interface(JMarginRecord_420) // or JObject
  ['{CD17CB87-13B4-4022-A8DD-F991B1EDE110}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBottomMarginRecord_368 = class(TJavaGenericImport<JBottomMarginRecord_368Class, JBottomMarginRecord_368>) end;

  JBoundsheetRecord_369Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{8CFA0D57-41DA-4A18-BE89-E12168110CA5}']
    { static Property Methods }

    { static Methods }
    {class} function init(n: JString): JBoundsheetRecord_369; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/BoundsheetRecord')]
  JBoundsheetRecord_369 = interface(JWritableRecordData) // or JObject
  ['{EE267827-C2CB-419C-B5E2-DD53DD85A62F}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJBoundsheetRecord_369 = class(TJavaGenericImport<JBoundsheetRecord_369Class, JBoundsheetRecord_369>) end;

  JButtonPropertySetRecord_370Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{2F676CE0-2B99-46BE-BA5E-A9F7387AA307}']
    { static Property Methods }

    { static Methods }
    {class} function init(bps: JButtonPropertySetRecord): JButtonPropertySetRecord_370; cdecl; overload;
    {class} function init(bps: JButtonPropertySetRecord): JButtonPropertySetRecord_370; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ButtonPropertySetRecord')]
  JButtonPropertySetRecord_370 = interface(JWritableRecordData) // or JObject
  ['{9BBCC833-9C0A-4093-A931-6E6030406BB4}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJButtonPropertySetRecord_370 = class(TJavaGenericImport<JButtonPropertySetRecord_370Class, JButtonPropertySetRecord_370>) end;

  JCalcCountRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{8DF0BF99-7809-4F39-BD93-45AF92BFB9FD}']
    { static Property Methods }

    { static Methods }
    {class} function init(cnt: Integer): JCalcCountRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/CalcCountRecord')]
  JCalcCountRecord = interface(JWritableRecordData) // or JObject
  ['{1FF211F7-CF88-4248-A389-BBD3D0562140}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJCalcCountRecord = class(TJavaGenericImport<JCalcCountRecordClass, JCalcCountRecord>) end;

  JCalcModeRecord_CalcModeClass = interface(JObjectClass)
  ['{C8D28A33-7985-4145-8C3A-2844DA2C3158}']
    { static Property Methods }

    { static Methods }
    {class} function init(m: Integer): JCalcModeRecord_CalcMode; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/CalcModeRecord$CalcMode')]
  JCalcModeRecord_CalcMode = interface(JObject)
  ['{673959C8-1C67-441C-A700-101D3DA750A5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCalcModeRecord_CalcMode = class(TJavaGenericImport<JCalcModeRecord_CalcModeClass, JCalcModeRecord_CalcMode>) end;

  JCalcModeRecord_373Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{88C89E25-AA91-4CA0-BE2C-5BF0D4BBC223}']
    { static Property Methods }

    { static Methods }
    {class} function init(cm: JCalcModeRecord_CalcMode): JCalcModeRecord_373; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/CalcModeRecord')]
  JCalcModeRecord_373 = interface(JWritableRecordData) // or JObject
  ['{F35777AA-762C-459B-A1C6-6CDE790189C2}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJCalcModeRecord_373 = class(TJavaGenericImport<JCalcModeRecord_373Class, JCalcModeRecord_373>) end;

  JCellValue_374Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{7CF86002-39CA-458C-A45B-6F0C21C593FB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/CellValue')]
  JCellValue_374 = interface(JWritableRecordData) // or JObject
  ['{9B038F45-56C7-4557-8C05-A45D3AE2D97D}']
    { Property Methods }

    { methods }
    procedure setCellFormat(cf: JCellFormat); cdecl;
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function isHidden: Boolean; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function getCellFormat: JCellFormat; cdecl;
    function getCellFeatures: JCellFeatures; cdecl;
    function getWritableCellFeatures: JWritableCellFeatures; cdecl;
    procedure setCellFeatures(cf: JWritableCellFeatures); cdecl;
    procedure addCellFeatures; cdecl;
    procedure removeCellFeatures; cdecl;
    procedure removeComment(c: JComment); cdecl;
    procedure removeDataValidation; cdecl;

    { Property }
  end;

  TJCellValue_374 = class(TJavaGenericImport<JCellValue_374Class, JCellValue_374>) end;

  JCellXFRecordClass = interface(JXFRecordClass) // or JObjectClass
  ['{92F79A9F-8364-4811-A97F-31959F6B88F4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/CellXFRecord')]
  JCellXFRecord = interface(JXFRecord) // or JObject
  ['{FDEC3DDD-7796-4AB0-9876-0CDC080FB61A}']
    { Property Methods }

    { methods }
    procedure setAlignment(a: JAlignment); cdecl;
    procedure setBackground(c: JColour; p: JPattern); cdecl;
    procedure setLocked(l: Boolean); cdecl;
    procedure setIndentation(i: Integer); cdecl;
    procedure setShrinkToFit(s: Boolean); cdecl;
    procedure setVerticalAlignment(va: JVerticalAlignment); cdecl;
    procedure setOrientation(o: JOrientation); cdecl;
    procedure setWrap(w: Boolean); cdecl;
    procedure setBorder(b: JBorder; ls: JBorderLineStyle; c: JColour); cdecl;

    { Property }
  end;

  TJCellXFRecord = class(TJavaGenericImport<JCellXFRecordClass, JCellXFRecord>) end;

  JCodepageRecord_376Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{73291931-EFFB-4873-9B11-B9F8A3191992}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCodepageRecord_376; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/CodepageRecord')]
  JCodepageRecord_376 = interface(JWritableRecordData) // or JObject
  ['{73B9F622-9FFE-473F-AEEB-2D1E54F12CCF}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJCodepageRecord_376 = class(TJavaGenericImport<JCodepageRecord_376Class, JCodepageRecord_376>) end;

  JColumnInfoRecord_377Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{32B45A04-BCC1-40E7-8944-873069F4AC71}']
    { static Property Methods }

    { static Methods }
    {class} function init(col: Integer; w: Integer; xf: JXFRecord): JColumnInfoRecord_377; cdecl; overload;
    {class} function init(cir: JColumnInfoRecord): JColumnInfoRecord_377; cdecl; overload;
    {class} function init(cir: JColumnInfoRecord; col: Integer; fr: JFormattingRecords): JColumnInfoRecord_377; cdecl; overload;
    {class} function init(cir: JColumnInfoRecord; col: Integer): JColumnInfoRecord_377; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ColumnInfoRecord')]
  JColumnInfoRecord_377 = interface(JWritableRecordData) // or JObject
  ['{3B851D02-7703-404A-94F5-BAD8BB9813C3}']
    { Property Methods }

    { methods }
    function getColumn: Integer; cdecl;
    procedure incrementColumn; cdecl;
    procedure decrementColumn; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function getCellFormat: JXFRecord; cdecl;
    procedure setCellFormat(xfr: JXFRecord); cdecl;
    function getXfIndex: Integer; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function getOutlineLevel: Integer; cdecl;
    function getCollapsed: Boolean; cdecl;
    procedure incrementOutlineLevel; cdecl;
    procedure decrementOutlineLevel; cdecl;
    procedure setOutlineLevel(level: Integer); cdecl;
    procedure setCollapsed(value: Boolean); cdecl;

    { Property }
  end;

  TJColumnInfoRecord_377 = class(TJavaGenericImport<JColumnInfoRecord_377Class, JColumnInfoRecord_377>) end;

  JColumnsExceededExceptionClass = interface(JJxlWriteExceptionClass) // or JObjectClass
  ['{35E60CA1-61A5-477A-90F9-7BAB9BEDF335}']
    { static Property Methods }

    { static Methods }
    {class} function init: JColumnsExceededException; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ColumnsExceededException')]
  JColumnsExceededException = interface(JJxlWriteException) // or JObject
  ['{68844A20-86BA-41C4-A014-F036E829E14C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJColumnsExceededException = class(TJavaGenericImport<JColumnsExceededExceptionClass, JColumnsExceededException>) end;

  JCompoundFile_ReadPropertyStorageClass = interface(JObjectClass)
  ['{D2F3159A-CDEE-42F3-BADF-D9AF42949EB7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/CompoundFile$ReadPropertyStorage')]
  JCompoundFile_ReadPropertyStorage = interface(JObject)
  ['{4976CFAA-0DEA-4177-B498-9D2DC48C4849}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCompoundFile_ReadPropertyStorage = class(TJavaGenericImport<JCompoundFile_ReadPropertyStorageClass, JCompoundFile_ReadPropertyStorage>) end;

  JCompoundFile_380Class = interface(JBaseCompoundFileClass) // or JObjectClass
  ['{4D53425B-E5DB-46DC-B673-400FC2792E0A}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: JExcelDataOutput; l: Integer; os: JOutputStream; rcf: JCompoundFile): JCompoundFile_380; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/CompoundFile')]
  JCompoundFile_380 = interface(JBaseCompoundFile) // or JObject
  ['{7AFBFC4E-2762-4C10-80BB-EC230080DEAD}']
    { Property Methods }

    { methods }
    procedure write; cdecl;

    { Property }
  end;

  TJCompoundFile_380 = class(TJavaGenericImport<JCompoundFile_380Class, JCompoundFile_380>) end;

  JCopyAdditionalPropertySetsExceptionClass = interface(JJxlWriteExceptionClass) // or JObjectClass
  ['{61DAC8DB-08F4-4195-9CF5-87D8EBC4F126}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCopyAdditionalPropertySetsException; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/CopyAdditionalPropertySetsException')]
  JCopyAdditionalPropertySetsException = interface(JJxlWriteException) // or JObject
  ['{F2CFB0AB-50F7-4CAB-BDEB-2CDF5CF3DFA9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCopyAdditionalPropertySetsException = class(TJavaGenericImport<JCopyAdditionalPropertySetsExceptionClass, JCopyAdditionalPropertySetsException>) end;

  JCountryRecord_382Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{3707167F-1B45-442E-9EF0-B9A5177FE7D1}']
    { static Property Methods }

    { static Methods }
    {class} function init(lang: JCountryCode; r: JCountryCode): JCountryRecord_382; cdecl; overload;
    {class} function init(cr: JCountryRecord): JCountryRecord_382; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/CountryRecord')]
  JCountryRecord_382 = interface(JWritableRecordData) // or JObject
  ['{88319FC0-6518-48FF-A2E2-33A7E5C8740B}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJCountryRecord_382 = class(TJavaGenericImport<JCountryRecord_382Class, JCountryRecord_382>) end;

  JDateFormatRecordClass = interface(JFormatRecordClass) // or JObjectClass
  ['{3646DE2F-CA80-4B2B-B4AB-EF13BD68ED76}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/DateFormatRecord')]
  JDateFormatRecord = interface(JFormatRecord) // or JObject
  ['{5359934B-324C-41B3-95B4-F8FD7C54A390}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDateFormatRecord = class(TJavaGenericImport<JDateFormatRecordClass, JDateFormatRecord>) end;

  JDateRecord_GMTDateClass = interface(JObjectClass)
  ['{7528D915-DA51-4D19-A053-DF94B7379721}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDateRecord_GMTDate; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/DateRecord$GMTDate')]
  JDateRecord_GMTDate = interface(JObject)
  ['{6AC17C6B-610E-46BD-88EA-209861AEDDC9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDateRecord_GMTDate = class(TJavaGenericImport<JDateRecord_GMTDateClass, JDateRecord_GMTDate>) end;

  JDateRecord_385Class = interface(JCellValue_374Class) // or JObjectClass
  ['{7C61E30D-EC78-4A6C-98DA-CF245928D22E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/DateRecord')]
  JDateRecord_385 = interface(JCellValue_374) // or JObject
  ['{4879CA0F-B03F-4D41-9FA3-72FBE1C678DB}']
    { Property Methods }

    { methods }
    function getType: JCellType; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function getContents: JString; cdecl;
    function getDate: JDate; cdecl;
    function isTime: Boolean; cdecl;
    function getDateFormat: JDateFormat; cdecl;

    { Property }
  end;

  TJDateRecord_385 = class(TJavaGenericImport<JDateRecord_385Class, JDateRecord_385>) end;

  JDBCellRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{C40D4EF8-8245-4C56-B01F-DAA822DF7648}']
    { static Property Methods }

    { static Methods }
    {class} function init(rp: Integer): JDBCellRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/DBCellRecord')]
  JDBCellRecord = interface(JWritableRecordData) // or JObject
  ['{133A7592-E168-43F8-AEC2-C75AE8D0E97A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDBCellRecord = class(TJavaGenericImport<JDBCellRecordClass, JDBCellRecord>) end;

  JDefaultColumnWidthClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{70D11EE8-350C-4DCA-AEBD-46DC905C53BA}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: Integer): JDefaultColumnWidth; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/DefaultColumnWidth')]
  JDefaultColumnWidth = interface(JWritableRecordData) // or JObject
  ['{83C1FFFD-F47A-417E-8561-14B181CBB7DF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDefaultColumnWidth = class(TJavaGenericImport<JDefaultColumnWidthClass, JDefaultColumnWidth>) end;

  JDefaultRowHeightRecord_388Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{A6C6586B-50C4-4572-A54D-17D0C1AC4CD9}']
    { static Property Methods }

    { static Methods }
    {class} function init(h: Integer; ch: Boolean): JDefaultRowHeightRecord_388; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/DefaultRowHeightRecord')]
  JDefaultRowHeightRecord_388 = interface(JWritableRecordData) // or JObject
  ['{AB3EF053-5A42-4754-A8AE-45786D65D6EB}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJDefaultRowHeightRecord_388 = class(TJavaGenericImport<JDefaultRowHeightRecord_388Class, JDefaultRowHeightRecord_388>) end;

  JDeltaRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{6AC5AC79-AEFD-4409-AD0F-30EB1A304043}']
    { static Property Methods }

    { static Methods }
    {class} function init(itval: Double): JDeltaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/DeltaRecord')]
  JDeltaRecord = interface(JWritableRecordData) // or JObject
  ['{3405E82B-3809-47B6-AB30-D89DE440FC53}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJDeltaRecord = class(TJavaGenericImport<JDeltaRecordClass, JDeltaRecord>) end;

  JDimensionRecord_390Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{4B76EE3C-C666-43A6-874E-A82044F7A8FC}']
    { static Property Methods }

    { static Methods }
    {class} function init(r: Integer; c: Integer): JDimensionRecord_390; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/DimensionRecord')]
  JDimensionRecord_390 = interface(JWritableRecordData) // or JObject
  ['{C6479D4E-4709-4CA9-8166-D777844C877C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDimensionRecord_390 = class(TJavaGenericImport<JDimensionRecord_390Class, JDimensionRecord_390>) end;

  JDSFRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{3C620F4B-26EC-4676-84C0-74971C6D6199}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDSFRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/DSFRecord')]
  JDSFRecord = interface(JWritableRecordData) // or JObject
  ['{F4F2820E-49E7-4D11-834D-631D37807780}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJDSFRecord = class(TJavaGenericImport<JDSFRecordClass, JDSFRecord>) end;

  JEOFRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{87506C58-F451-45C1-8324-9E08D18939A7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEOFRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/EOFRecord')]
  JEOFRecord = interface(JWritableRecordData) // or JObject
  ['{6A717C87-B609-49C2-AA52-0156E89477E1}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJEOFRecord = class(TJavaGenericImport<JEOFRecordClass, JEOFRecord>) end;

  JExcelDataOutputClass = interface(JObjectClass)
  ['{2FB146C1-34FC-4299-9039-22211BC9FA80}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ExcelDataOutput')]
  JExcelDataOutput = interface(IJavaInstance)
  ['{F37481CC-8300-4E36-9002-1E9DA7B78363}']
    { Property Methods }

    { methods }
    procedure write(P1: TJavaArray<Byte>); cdecl;
    function getPosition: Integer; cdecl;
    procedure setData(P1: TJavaArray<Byte>; P2: Integer); cdecl;
    procedure writeData(P1: JOutputStream); cdecl;
    procedure close; cdecl;

    { Property }
  end;

  TJExcelDataOutput = class(TJavaGenericImport<JExcelDataOutputClass, JExcelDataOutput>) end;

  JExtendedSSTRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{F2A7F891-0C1D-4A12-B1FD-79D546B6956C}']
    { static Property Methods }

    { static Methods }
    {class} function init(newNumberOfStrings: Integer): JExtendedSSTRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ExtendedSSTRecord')]
  JExtendedSSTRecord = interface(JWritableRecordData) // or JObject
  ['{4C62D70A-B648-41B9-9DD6-F68590E6DB5D}']
    { Property Methods }

    { methods }
    function getNumberOfBuckets: Integer; cdecl;
    function getNumberOfStringsPerBucket: Integer; cdecl;
    procedure addString(absoluteStreamPosition: Integer; relativeStreamPosition: Integer); cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJExtendedSSTRecord = class(TJavaGenericImport<JExtendedSSTRecordClass, JExtendedSSTRecord>) end;

  JExternalNameRecord_395Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{4757DBC0-FF9B-4D84-8828-448DF4A7B0E0}']
    { static Property Methods }

    { static Methods }
    {class} function init(n: JString): JExternalNameRecord_395; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ExternalNameRecord')]
  JExternalNameRecord_395 = interface(JWritableRecordData) // or JObject
  ['{6CA6727A-1E25-4198-BB94-4768A7AB4254}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJExternalNameRecord_395 = class(TJavaGenericImport<JExternalNameRecord_395Class, JExternalNameRecord_395>) end;

  JExternalSheetRecord_XTI_396Class = interface(JObjectClass)
  ['{0ACB441E-3194-432B-A90D-756BBC629E5B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ExternalSheetRecord$XTI')]
  JExternalSheetRecord_XTI_396 = interface(JObject)
  ['{3AD471B2-3417-4869-9787-95B3BF87F2F8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJExternalSheetRecord_XTI_396 = class(TJavaGenericImport<JExternalSheetRecord_XTI_396Class, JExternalSheetRecord_XTI_396>) end;

  JExternalSheetRecord_397Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{DED860C1-8D0B-4B32-827F-7C0542170A98}']
    { static Property Methods }

    { static Methods }
    {class} function init(esf: JExternalSheetRecord): JExternalSheetRecord_397; cdecl; overload;
    {class} function init: JExternalSheetRecord_397; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ExternalSheetRecord')]
  JExternalSheetRecord_397 = interface(JWritableRecordData) // or JObject
  ['{D3D87D3A-E1EA-4E82-A6A1-38160E6BC266}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getSupbookIndex(index: Integer): Integer; cdecl;
    function getFirstTabIndex(index: Integer): Integer; cdecl;
    function getLastTabIndex(index: Integer): Integer; cdecl;

    { Property }
  end;

  TJExternalSheetRecord_397 = class(TJavaGenericImport<JExternalSheetRecord_397Class, JExternalSheetRecord_397>) end;

  JFile_398Class = interface(JObjectClass)
  ['{69D15294-45D7-4E91-8C47-FAF27B5E949D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/File')]
  JFile_398 = interface(JObject)
  ['{C01E3C83-6833-4F70-A793-8177B3E6B460}']
    { Property Methods }

    { methods }
    procedure write(arecord: JByteData); cdecl;
    procedure setOutputFile(os: JOutputStream); cdecl;

    { Property }
  end;

  TJFile_398 = class(TJavaGenericImport<JFile_398Class, JFile_398>) end;

  JFileDataOutputClass = interface(JObjectClass)
  ['{EFC2AA8B-C7BE-482A-80EA-157FC5799D97}']
    { static Property Methods }

    { static Methods }
    {class} function init(tmpdir: JFile): JFileDataOutput; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/FileDataOutput')]
  JFileDataOutput = interface(JObject)
  ['{DB0A6791-10C9-4A4D-8818-3909A5CF6EA3}']
    { Property Methods }

    { methods }
    procedure write(bytes: TJavaArray<Byte>); cdecl;
    function getPosition: Integer; cdecl;
    procedure setData(newdata: TJavaArray<Byte>; pos: Integer); cdecl;
    procedure writeData(aout: JOutputStream); cdecl;
    procedure close; cdecl;

    { Property }
  end;

  TJFileDataOutput = class(TJavaGenericImport<JFileDataOutputClass, JFileDataOutput>) end;

  JFooterRecord_400Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{11A8D1AD-50C7-4782-A4F1-DF540523C05F}']
    { static Property Methods }

    { static Methods }
    {class} function init(s: JString): JFooterRecord_400; cdecl; overload;
    {class} function init(fr: JFooterRecord): JFooterRecord_400; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/FooterRecord')]
  JFooterRecord_400 = interface(JWritableRecordData) // or JObject
  ['{7E926F02-6A7D-48E6-ADDB-CC1F325DD3BF}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJFooterRecord_400 = class(TJavaGenericImport<JFooterRecord_400Class, JFooterRecord_400>) end;

  JFormulaRecord_401Class = interface(JCellValue_374Class) // or JObjectClass
  ['{D81B5175-CA48-4560-A751-4491306BBD51}']
    { static Property Methods }

    { static Methods }
    {class} function init(c: Integer; r: Integer; f: JString): JFormulaRecord_401; cdecl; overload;
    {class} function init(c: Integer; r: Integer; f: JString; st: JCellFormat): JFormulaRecord_401; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/FormulaRecord')]
  JFormulaRecord_401 = interface(JCellValue_374) // or JObject
  ['{B9B0CB23-D752-4565-813A-ED03994460B5}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getType: JCellType; cdecl;
    function getContents: JString; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;
    function copyTo(col: Integer; row: Integer): JWritableCell; cdecl;

    { Property }
  end;

  TJFormulaRecord_401 = class(TJavaGenericImport<JFormulaRecord_401Class, JFormulaRecord_401>) end;

  JFunctionGroupCountRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{21BFF94A-70CE-4291-AF4E-98B6E0B6F874}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFunctionGroupCountRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/FunctionGroupCountRecord')]
  JFunctionGroupCountRecord = interface(JWritableRecordData) // or JObject
  ['{FE96A43C-DA0C-4BF9-A16E-9046853CF0D6}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJFunctionGroupCountRecord = class(TJavaGenericImport<JFunctionGroupCountRecordClass, JFunctionGroupCountRecord>) end;

  JGridSetRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{320CE32C-D0DC-4732-9631-391BD982F072}']
    { static Property Methods }

    { static Methods }
    {class} function init(gs: Boolean): JGridSetRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/GridSetRecord')]
  JGridSetRecord = interface(JWritableRecordData) // or JObject
  ['{0E38A0AA-1DD5-41D2-BD58-6E40AB4D710C}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJGridSetRecord = class(TJavaGenericImport<JGridSetRecordClass, JGridSetRecord>) end;

  JGuttersRecord_404Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{0BA4930E-2BF7-4A0A-93F1-F89DE57E7716}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGuttersRecord_404; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/GuttersRecord')]
  JGuttersRecord_404 = interface(JWritableRecordData) // or JObject
  ['{DE84A871-C12D-4271-908F-F6379199908E}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getMaxRowOutline: Integer; cdecl;
    procedure setMaxRowOutline(value: Integer); cdecl;
    function getMaxColumnOutline: Integer; cdecl;
    procedure setMaxColumnOutline(value: Integer); cdecl;

    { Property }
  end;

  TJGuttersRecord_404 = class(TJavaGenericImport<JGuttersRecord_404Class, JGuttersRecord_404>) end;

  JHeaderRecord_405Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{37942BED-EAA2-4EBC-82B0-388B41F5A67F}']
    { static Property Methods }

    { static Methods }
    {class} function init(h: JString): JHeaderRecord_405; cdecl; overload;
    {class} function init(hr: JHeaderRecord): JHeaderRecord_405; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/HeaderRecord')]
  JHeaderRecord_405 = interface(JWritableRecordData) // or JObject
  ['{D61A695F-3101-4C64-8F80-68C03C663381}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJHeaderRecord_405 = class(TJavaGenericImport<JHeaderRecord_405Class, JHeaderRecord_405>) end;

  JHideobjRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{48CEE323-79B3-4DBD-AA5C-FEFD4D0CB6AE}']
    { static Property Methods }

    { static Methods }
    {class} function init(hide: Boolean): JHideobjRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/HideobjRecord')]
  JHideobjRecord = interface(JWritableRecordData) // or JObject
  ['{FD0D232E-8867-4E4E-9209-EB604B1625AF}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJHideobjRecord = class(TJavaGenericImport<JHideobjRecordClass, JHideobjRecord>) end;

  JHorizontalCentreRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{B400A6D8-1DF7-4D2A-B166-D115D095F3CD}']
    { static Property Methods }

    { static Methods }
    {class} function init(ce: Boolean): JHorizontalCentreRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/HorizontalCentreRecord')]
  JHorizontalCentreRecord = interface(JWritableRecordData) // or JObject
  ['{FCC6AD6D-699C-4C27-AC95-2759B23759C7}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJHorizontalCentreRecord = class(TJavaGenericImport<JHorizontalCentreRecordClass, JHorizontalCentreRecord>) end;

  JHorizontalPageBreaksRecord_408Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{84205BD5-D664-4D02-B818-5B599A17A9B8}']
    { static Property Methods }

    { static Methods }
    {class} function init(breaks: TJavaArray<Integer>): JHorizontalPageBreaksRecord_408; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/HorizontalPageBreaksRecord')]
  JHorizontalPageBreaksRecord_408 = interface(JWritableRecordData) // or JObject
  ['{AF06D5A5-AA3A-41A9-B540-DE77162A58D3}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJHorizontalPageBreaksRecord_408 = class(TJavaGenericImport<JHorizontalPageBreaksRecord_408Class, JHorizontalPageBreaksRecord_408>) end;

  JHyperlinkRecord_1_409Class = interface(JObjectClass)
  ['{81291ABB-2EEE-41C3-B227-88492CD6CADF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/HyperlinkRecord$1')]
  JHyperlinkRecord_1_409 = interface(JObject)
  ['{96F3FC76-27D7-4A66-BE63-C236F88DB3D3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHyperlinkRecord_1_409 = class(TJavaGenericImport<JHyperlinkRecord_1_409Class, JHyperlinkRecord_1_409>) end;

  JHyperlinkRecord_LinkType_410Class = interface(JObjectClass)
  ['{30C22977-E8F2-4733-891E-785DF4B9AA07}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/HyperlinkRecord$LinkType')]
  JHyperlinkRecord_LinkType_410 = interface(JObject)
  ['{B5293986-5DC1-46C8-9090-8A451164BDF6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHyperlinkRecord_LinkType_410 = class(TJavaGenericImport<JHyperlinkRecord_LinkType_410Class, JHyperlinkRecord_LinkType_410>) end;

  JHyperlinkRecord_411Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{4279E07E-4BB7-4602-9EC1-4241798EFA10}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/HyperlinkRecord')]
  JHyperlinkRecord_411 = interface(JWritableRecordData) // or JObject
  ['{40036315-206B-46C7-81D7-EBC90D4F6AC3}']
    { Property Methods }

    { methods }
    function isFile: Boolean; cdecl;
    function isUNC: Boolean; cdecl;
    function isURL: Boolean; cdecl;
    function isLocation: Boolean; cdecl;
    function getRow: Integer; cdecl;
    function getColumn: Integer; cdecl;
    function getLastRow: Integer; cdecl;
    function getLastColumn: Integer; cdecl;
    function getURL: JURL; cdecl;
    function getFile: JFile; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function toString: JString; cdecl;
    function getRange: JRange; cdecl;
    procedure setURL(url: JURL); cdecl;
    procedure setFile(afile: JFile); cdecl;

    { Property }
  end;

  TJHyperlinkRecord_411 = class(TJavaGenericImport<JHyperlinkRecord_411Class, JHyperlinkRecord_411>) end;

  JIndexRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{9AF52AFE-5144-4F70-BA29-493748BB55C4}']
    { static Property Methods }

    { static Methods }
    {class} function init(pos: Integer; r: Integer; bl: Integer): JIndexRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/IndexRecord')]
  JIndexRecord = interface(JWritableRecordData) // or JObject
  ['{B9F44C46-8E09-4B40-B2DC-C8F020C36A08}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIndexRecord = class(TJavaGenericImport<JIndexRecordClass, JIndexRecord>) end;

  JInterfaceEndRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{20473BC7-EFC9-4968-A5FE-1A7D079D8FFF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JInterfaceEndRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/InterfaceEndRecord')]
  JInterfaceEndRecord = interface(JWritableRecordData) // or JObject
  ['{5C582A49-B6CA-4052-90B2-8AA6CA68F966}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJInterfaceEndRecord = class(TJavaGenericImport<JInterfaceEndRecordClass, JInterfaceEndRecord>) end;

  JInterfaceHeaderRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{6B9BBDC4-8DAA-43D0-BBC4-950CBD114530}']
    { static Property Methods }

    { static Methods }
    {class} function init: JInterfaceHeaderRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/InterfaceHeaderRecord')]
  JInterfaceHeaderRecord = interface(JWritableRecordData) // or JObject
  ['{B24A59B1-C2D3-46C2-8081-F09063C7C4F2}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJInterfaceHeaderRecord = class(TJavaGenericImport<JInterfaceHeaderRecordClass, JInterfaceHeaderRecord>) end;

  JIterationRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{8C484140-D540-465D-9FF2-49537835C01F}']
    { static Property Methods }

    { static Methods }
    {class} function init(it: Boolean): JIterationRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/IterationRecord')]
  JIterationRecord = interface(JWritableRecordData) // or JObject
  ['{45964299-90EF-47B8-B694-F487298D12CB}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJIterationRecord = class(TJavaGenericImport<JIterationRecordClass, JIterationRecord>) end;

  JJxlWriteException_WriteMessageClass = interface(JObjectClass)
  ['{559E8AFD-5029-4754-BAD3-DA3432179970}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/JxlWriteException$WriteMessage')]
  JJxlWriteException_WriteMessage = interface(JObject)
  ['{D8A93B64-7F26-409D-AE7A-8B64E5C5E53C}']
    { Property Methods }
    function _Getmessage: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setmessage(amessage: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property &message: JString read _Getmessage write _Setmessage;
  end;

  TJJxlWriteException_WriteMessage = class(TJavaGenericImport<JJxlWriteException_WriteMessageClass, JJxlWriteException_WriteMessage>) end;

  JJxlWriteExceptionClass = interface(JWriteExceptionClass) // or JObjectClass
  ['{C05802B6-E919-413C-A74C-2E31E3CD90C7}']
    { static Property Methods }

    { static Methods }
    {class} function init(m: JJxlWriteException_WriteMessage): JJxlWriteException; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/JxlWriteException')]
  JJxlWriteException = interface(JWriteException) // or JObject
  ['{92CB2F8A-212B-4AA9-BDE1-0775D2EE9777}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJJxlWriteException = class(TJavaGenericImport<JJxlWriteExceptionClass, JJxlWriteException>) end;

  JLabelRecord_418Class = interface(JCellValue_374Class) // or JObjectClass
  ['{30AC10CD-354B-4217-9798-04C5AD4CD0AE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/LabelRecord')]
  JLabelRecord_418 = interface(JCellValue_374) // or JObject
  ['{AF9DF487-51A9-4663-B263-4B77DFBCE0E5}']
    { Property Methods }

    { methods }
    function getType: JCellType; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function getContents: JString; cdecl;
    function getString: JString; cdecl;

    { Property }
  end;

  TJLabelRecord_418 = class(TJavaGenericImport<JLabelRecord_418Class, JLabelRecord_418>) end;

  JLeftMarginRecord_419Class = interface(JMarginRecord_420Class) // or JObjectClass
  ['{A560B8DA-378B-428B-B59E-16F1212B1AA3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/LeftMarginRecord')]
  JLeftMarginRecord_419 = interface(JMarginRecord_420) // or JObject
  ['{B683AD84-59CC-4A2A-BFB9-A6A978CD4924}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLeftMarginRecord_419 = class(TJavaGenericImport<JLeftMarginRecord_419Class, JLeftMarginRecord_419>) end;

  JMarginRecord_420Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{90F66A71-AC27-49EE-895A-1E1018A2274A}']
    { static Property Methods }

    { static Methods }
    {class} function init(t: JType; v: Double): JMarginRecord_420; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/MarginRecord')]
  JMarginRecord_420 = interface(JWritableRecordData) // or JObject
  ['{315110E3-C4D0-4920-ACF6-A1466B48AB4F}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJMarginRecord_420 = class(TJavaGenericImport<JMarginRecord_420Class, JMarginRecord_420>) end;

  JMemoryDataOutputClass = interface(JObjectClass)
  ['{8EE2EF90-995A-4149-B933-F9768F4F98B4}']
    { static Property Methods }

    { static Methods }
    {class} function init(initialSize: Integer; gs: Integer): JMemoryDataOutput; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/MemoryDataOutput')]
  JMemoryDataOutput = interface(JObject)
  ['{AEC5C202-3073-4BD7-8052-8FE7A038F3E8}']
    { Property Methods }

    { methods }
    procedure write(bytes: TJavaArray<Byte>); cdecl;
    function getPosition: Integer; cdecl;
    procedure setData(newdata: TJavaArray<Byte>; pos: Integer); cdecl;
    procedure writeData(aout: JOutputStream); cdecl;
    procedure close; cdecl;

    { Property }
  end;

  TJMemoryDataOutput = class(TJavaGenericImport<JMemoryDataOutputClass, JMemoryDataOutput>) end;

  JMergedCellsClass = interface(JObjectClass)
  ['{94D99AA4-D9FC-45C0-B91D-9BDAFDC0AC67}']
    { static Property Methods }

    { static Methods }
    {class} function init(ws: JWritableSheet): JMergedCells; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/MergedCells')]
  JMergedCells = interface(JObject)
  ['{C820544D-19B1-430A-862B-53412EE05867}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMergedCells = class(TJavaGenericImport<JMergedCellsClass, JMergedCells>) end;

  JMergedCellsRecord_423Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{1C5512B4-68C9-4795-A2DF-697A59AE2976}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/MergedCellsRecord')]
  JMergedCellsRecord_423 = interface(JWritableRecordData) // or JObject
  ['{4677FEB4-5BDB-433B-923E-91C834F19427}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJMergedCellsRecord_423 = class(TJavaGenericImport<JMergedCellsRecord_423Class, JMergedCellsRecord_423>) end;

  JMMSRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{D8D7A643-135D-411D-B444-65BEEAFB1657}']
    { static Property Methods }

    { static Methods }
    {class} function init(menuItemsAdded: Integer; menuItemsDeleted: Integer): JMMSRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/MMSRecord')]
  JMMSRecord = interface(JWritableRecordData) // or JObject
  ['{5F8038BB-FB37-4802-B6A2-8DAADF8440E0}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJMMSRecord = class(TJavaGenericImport<JMMSRecordClass, JMMSRecord>) end;

  JMulRKRecord_425Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{6761EC02-C238-4EF0-B5FE-3C479599DD14}']
    { static Property Methods }

    { static Methods }
    {class} function init(numbers: JList): JMulRKRecord_425; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/MulRKRecord')]
  JMulRKRecord_425 = interface(JWritableRecordData) // or JObject
  ['{8E3A9D43-2CA5-4A8E-A9A4-8E3AA764F216}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJMulRKRecord_425 = class(TJavaGenericImport<JMulRKRecord_425Class, JMulRKRecord_425>) end;

  JNameRecord_NameRange_426Class = interface(JObjectClass)
  ['{16F5CD0A-D77F-4A3B-82A1-EF9183E29815}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/NameRecord$NameRange')]
  JNameRecord_NameRange_426 = interface(JObject)
  ['{796CADC8-3896-4292-A31A-340D80E0CDD0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNameRecord_NameRange_426 = class(TJavaGenericImport<JNameRecord_NameRange_426Class, JNameRecord_NameRange_426>) end;

  JNameRecord_427Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{455BA196-53AE-4197-979B-109A32F7F35E}']
    { static Property Methods }

    { static Methods }
    {class} function init(sr: JNameRecord; ind: Integer): JNameRecord_427; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/NameRecord')]
  JNameRecord_427 = interface(JWritableRecordData) // or JObject
  ['{0C86D24F-6177-4FC2-B0A3-C51D05B96EBB}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getName: JString; cdecl;
    function getIndex: Integer; cdecl;
    function getSheetRef: Integer; cdecl;
    procedure setSheetRef(i: Integer); cdecl;
    function getRanges: TJavaObjectArray<JNameRecord_NameRange>; cdecl;

    { Property }
  end;

  TJNameRecord_427 = class(TJavaGenericImport<JNameRecord_427Class, JNameRecord_427>) end;

  JNineteenFourRecord_428Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{91E18053-813B-4CF2-8B55-F2BB9F880B8A}']
    { static Property Methods }

    { static Methods }
    {class} function init(oldDate: Boolean): JNineteenFourRecord_428; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/NineteenFourRecord')]
  JNineteenFourRecord_428 = interface(JWritableRecordData) // or JObject
  ['{3CF87B10-3797-4A94-9E4F-6EC556573747}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJNineteenFourRecord_428 = class(TJavaGenericImport<JNineteenFourRecord_428Class, JNineteenFourRecord_428>) end;

  JNumberFormatRecord_NonValidatingFormatClass = interface(JObjectClass)
  ['{C1AC6486-DCCD-45B5-A3FA-B393FED549E7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JNumberFormatRecord_NonValidatingFormat; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/NumberFormatRecord$NonValidatingFormat')]
  JNumberFormatRecord_NonValidatingFormat = interface(JObject)
  ['{B09E4C7F-1698-4741-926A-9898F0471402}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNumberFormatRecord_NonValidatingFormat = class(TJavaGenericImport<JNumberFormatRecord_NonValidatingFormatClass, JNumberFormatRecord_NonValidatingFormat>) end;

  JNumberFormatRecordClass = interface(JFormatRecordClass) // or JObjectClass
  ['{F761C500-3FAA-405C-A0D5-02D6F330CEBD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/NumberFormatRecord')]
  JNumberFormatRecord = interface(JFormatRecord) // or JObject
  ['{70E13DD5-5133-4CF0-A6A6-FA69F899F7CA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNumberFormatRecord = class(TJavaGenericImport<JNumberFormatRecordClass, JNumberFormatRecord>) end;

  JNumberRecord_431Class = interface(JCellValue_374Class) // or JObjectClass
  ['{420128D2-CFEF-46FE-A38E-EA43D7FFA49E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/NumberRecord')]
  JNumberRecord_431 = interface(JCellValue_374) // or JObject
  ['{8744D7A8-8A6C-4B93-8B19-1086A6FC2027}']
    { Property Methods }

    { methods }
    function getType: JCellType; cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function getContents: JString; cdecl;
    function getValue: Double; cdecl;
    procedure setValue(val: Double); cdecl;
    function getNumberFormat: JNumberFormat; cdecl;

    { Property }
  end;

  TJNumberRecord_431 = class(TJavaGenericImport<JNumberRecord_431Class, JNumberRecord_431>) end;

  JObjectProtectRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{534E80B6-57F3-4D60-9C61-F04FCB1796A2}']
    { static Property Methods }

    { static Methods }
    {class} function init(prot: Boolean): JObjectProtectRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ObjectProtectRecord')]
  JObjectProtectRecord = interface(JWritableRecordData) // or JObject
  ['{D3540B21-A70B-4EFB-B31D-D881F8A5E713}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJObjectProtectRecord = class(TJavaGenericImport<JObjectProtectRecordClass, JObjectProtectRecord>) end;

  JObjProjRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{6940A508-9CCD-46E3-B11D-77E5B991D012}']
    { static Property Methods }

    { static Methods }
    {class} function init: JObjProjRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ObjProjRecord')]
  JObjProjRecord = interface(JWritableRecordData) // or JObject
  ['{B4350F5E-E3D6-45FA-B1DA-66E5D730B6EB}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJObjProjRecord = class(TJavaGenericImport<JObjProjRecordClass, JObjProjRecord>) end;

  JPaletteRecord_434Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{07CDB4D5-2DD6-4585-97A2-1EE2FA124B1A}']
    { static Property Methods }

    { static Methods }
    {class} function init(p: JPaletteRecord): JPaletteRecord_434; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/PaletteRecord')]
  JPaletteRecord_434 = interface(JWritableRecordData) // or JObject
  ['{E5222B67-04C2-4B66-BA2B-CD5DAE705D5B}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJPaletteRecord_434 = class(TJavaGenericImport<JPaletteRecord_434Class, JPaletteRecord_434>) end;

  JPaneRecord_435Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{5C9B795B-7FB5-42D2-AE16-822A53CE88CD}']
    { static Property Methods }

    { static Methods }
    {class} function init(cols: Integer; rows: Integer): JPaneRecord_435; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/PaneRecord')]
  JPaneRecord_435 = interface(JWritableRecordData) // or JObject
  ['{A7BF14D2-60A1-45C5-B978-4FCA44F75B99}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJPaneRecord_435 = class(TJavaGenericImport<JPaneRecord_435Class, JPaneRecord_435>) end;

  JPasswordRecord_436Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{459015F9-1CBD-4E29-A070-6FC1B8E867B0}']
    { static Property Methods }

    { static Methods }
    {class} function init(pw: JString): JPasswordRecord_436; cdecl; overload;
    {class} function init(ph: Integer): JPasswordRecord_436; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/PasswordRecord')]
  JPasswordRecord_436 = interface(JWritableRecordData) // or JObject
  ['{31744D97-9FF8-4881-A5E3-4E2F0E9D0596}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJPasswordRecord_436 = class(TJavaGenericImport<JPasswordRecord_436Class, JPasswordRecord_436>) end;

  JPLSRecord_437Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{1BB2AF54-6804-4919-9369-F49F102EFCBE}']
    { static Property Methods }

    { static Methods }
    {class} function init(hr: JPLSRecord): JPLSRecord_437; cdecl; overload;
    {class} function init(hr: JPLSRecord): JPLSRecord_437; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/PLSRecord')]
  JPLSRecord_437 = interface(JWritableRecordData) // or JObject
  ['{13099D15-FAC4-405F-B11A-DACD4B8E0D78}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJPLSRecord_437 = class(TJavaGenericImport<JPLSRecord_437Class, JPLSRecord_437>) end;

  JPrecisionRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{45A54C9C-E0AB-417D-93BB-554818B672BC}']
    { static Property Methods }

    { static Methods }
    {class} function init(disp: Boolean): JPrecisionRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/PrecisionRecord')]
  JPrecisionRecord = interface(JWritableRecordData) // or JObject
  ['{558DC538-A9CA-4F3F-AEC6-7B1ECB8543FB}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJPrecisionRecord = class(TJavaGenericImport<JPrecisionRecordClass, JPrecisionRecord>) end;

  JPrintGridLinesRecord_439Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{CDC77683-2571-458E-9FDB-F95C4BAC2628}']
    { static Property Methods }

    { static Methods }
    {class} function init(pgl: Boolean): JPrintGridLinesRecord_439; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/PrintGridLinesRecord')]
  JPrintGridLinesRecord_439 = interface(JWritableRecordData) // or JObject
  ['{3EE0F8C8-2BC9-4B96-BA10-E1BB598C394B}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJPrintGridLinesRecord_439 = class(TJavaGenericImport<JPrintGridLinesRecord_439Class, JPrintGridLinesRecord_439>) end;

  JPrintHeadersRecord_440Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{C1E0F0EB-FB2D-400B-9198-A6DA888427D3}']
    { static Property Methods }

    { static Methods }
    {class} function init(ph: Boolean): JPrintHeadersRecord_440; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/PrintHeadersRecord')]
  JPrintHeadersRecord_440 = interface(JWritableRecordData) // or JObject
  ['{8F207D2B-2388-467F-A2EE-4C37A0391C68}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJPrintHeadersRecord_440 = class(TJavaGenericImport<JPrintHeadersRecord_440Class, JPrintHeadersRecord_440>) end;

  JProt4RevPassRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{7A680B71-BE38-416B-818D-9C55EF68B36D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JProt4RevPassRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/Prot4RevPassRecord')]
  JProt4RevPassRecord = interface(JWritableRecordData) // or JObject
  ['{D37E1FB7-9912-4540-BBC2-8BCB2BAF3314}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJProt4RevPassRecord = class(TJavaGenericImport<JProt4RevPassRecordClass, JProt4RevPassRecord>) end;

  JProt4RevRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{B68E8DB6-EA92-4B13-B4AF-8FB2F5C872D7}']
    { static Property Methods }

    { static Methods }
    {class} function init(prot: Boolean): JProt4RevRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/Prot4RevRecord')]
  JProt4RevRecord = interface(JWritableRecordData) // or JObject
  ['{7566952C-6F3C-4882-99A3-668DF30A7852}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJProt4RevRecord = class(TJavaGenericImport<JProt4RevRecordClass, JProt4RevRecord>) end;

  JProtectRecord_443Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{E5051C1E-0CA0-4526-8E7A-D00F1D78389E}']
    { static Property Methods }

    { static Methods }
    {class} function init(prot: Boolean): JProtectRecord_443; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ProtectRecord')]
  JProtectRecord_443 = interface(JWritableRecordData) // or JObject
  ['{D7804019-3176-4CD7-8D52-84FC4B3998AD}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJProtectRecord_443 = class(TJavaGenericImport<JProtectRecord_443Class, JProtectRecord_443>) end;

  JReadBooleanFormulaRecordClass = interface(JReadFormulaRecordClass) // or JObjectClass
  ['{8499B6B7-78CF-407A-BE3C-DF75204DCA1E}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JFormulaData): JReadBooleanFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ReadBooleanFormulaRecord')]
  JReadBooleanFormulaRecord = interface(JReadFormulaRecord) // or JObject
  ['{3B589A25-8E9C-43C1-83B0-2FE77B0F2CB1}']
    { Property Methods }

    { methods }
    function getValue: Boolean; cdecl;

    { Property }
  end;

  TJReadBooleanFormulaRecord = class(TJavaGenericImport<JReadBooleanFormulaRecordClass, JReadBooleanFormulaRecord>) end;

  JReadDateFormulaRecordClass = interface(JReadFormulaRecordClass) // or JObjectClass
  ['{B05EAF46-2629-4C18-8973-59430D0B72EF}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JFormulaData): JReadDateFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ReadDateFormulaRecord')]
  JReadDateFormulaRecord = interface(JReadFormulaRecord) // or JObject
  ['{03B83E9D-4E06-4DC2-814D-EBD3DDB90351}']
    { Property Methods }

    { methods }
    function getDate: JDate; cdecl;
    function isTime: Boolean; cdecl;
    function getDateFormat: JDateFormat; cdecl;

    { Property }
  end;

  TJReadDateFormulaRecord = class(TJavaGenericImport<JReadDateFormulaRecordClass, JReadDateFormulaRecord>) end;

  JReadErrorFormulaRecordClass = interface(JReadFormulaRecordClass) // or JObjectClass
  ['{1F255AE0-5B5E-4B08-AB48-5312AE18000C}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JFormulaData): JReadErrorFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ReadErrorFormulaRecord')]
  JReadErrorFormulaRecord = interface(JReadFormulaRecord) // or JObject
  ['{25992FE1-F3D9-46AB-B967-7711DAD92092}']
    { Property Methods }

    { methods }
    function getErrorCode: Integer; cdecl;

    { Property }
  end;

  TJReadErrorFormulaRecord = class(TJavaGenericImport<JReadErrorFormulaRecordClass, JReadErrorFormulaRecord>) end;

  JReadFormulaRecordClass = interface(JCellValue_374Class) // or JObjectClass
  ['{74DFDC58-1113-4302-8CD4-5751B42EA5BA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ReadFormulaRecord')]
  JReadFormulaRecord = interface(JCellValue_374) // or JObject
  ['{5FBEC56D-7593-440B-8BF8-44958AE7740A}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getType: JCellType; cdecl;
    function getContents: JString; cdecl;
    function getFormulaData: TJavaArray<Byte>; cdecl;
    function getFormulaBytes: TJavaArray<Byte>; cdecl;
    function copyTo(col: Integer; row: Integer): JWritableCell; cdecl;
    function getFormula: JString; cdecl;
    function handleImportedCellReferences(es: JExternalSheet; mt: JWorkbookMethods; ws: JWorkbookSettings): Boolean; cdecl;

    { Property }
  end;

  TJReadFormulaRecord = class(TJavaGenericImport<JReadFormulaRecordClass, JReadFormulaRecord>) end;

  JReadNumberFormulaRecordClass = interface(JReadFormulaRecordClass) // or JObjectClass
  ['{AF077669-671A-4547-BCC3-0B5D86748647}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JFormulaData): JReadNumberFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ReadNumberFormulaRecord')]
  JReadNumberFormulaRecord = interface(JReadFormulaRecord) // or JObject
  ['{70900127-CE47-4CC3-B784-4218595CEB75}']
    { Property Methods }

    { methods }
    function getValue: Double; cdecl;
    function getNumberFormat: JNumberFormat; cdecl;

    { Property }
  end;

  TJReadNumberFormulaRecord = class(TJavaGenericImport<JReadNumberFormulaRecordClass, JReadNumberFormulaRecord>) end;

  JReadStringFormulaRecordClass = interface(JReadFormulaRecordClass) // or JObjectClass
  ['{D81490CE-221F-49A5-BFAB-B95917B4CE2C}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JFormulaData): JReadStringFormulaRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ReadStringFormulaRecord')]
  JReadStringFormulaRecord = interface(JReadFormulaRecord) // or JObject
  ['{622D4985-B4B4-43A0-AFEA-91277DC87A7A}']
    { Property Methods }

    { methods }
    function getString: JString; cdecl;

    { Property }
  end;

  TJReadStringFormulaRecord = class(TJavaGenericImport<JReadStringFormulaRecordClass, JReadStringFormulaRecord>) end;

  JRefModeRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{B6270777-1374-433F-B7A8-392A44B23A61}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRefModeRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/RefModeRecord')]
  JRefModeRecord = interface(JWritableRecordData) // or JObject
  ['{51410AE3-3A22-4C87-9C90-8F4145A761F4}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJRefModeRecord = class(TJavaGenericImport<JRefModeRecordClass, JRefModeRecord>) end;

  JRefreshAllRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{5B738569-03EF-4DAE-A1D2-7DA8349BFAAD}']
    { static Property Methods }

    { static Methods }
    {class} function init(refresh: Boolean): JRefreshAllRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/RefreshAllRecord')]
  JRefreshAllRecord = interface(JWritableRecordData) // or JObject
  ['{C3542ED7-81DF-45F2-96DF-F94AC89A88B9}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJRefreshAllRecord = class(TJavaGenericImport<JRefreshAllRecordClass, JRefreshAllRecord>) end;

  JRightMarginRecord_452Class = interface(JMarginRecord_420Class) // or JObjectClass
  ['{D25156AA-066E-4FA0-8BEA-6275609D825C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/RightMarginRecord')]
  JRightMarginRecord_452 = interface(JMarginRecord_420) // or JObject
  ['{6533C998-E901-47A0-A7FC-6ECCBF0B2C5D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRightMarginRecord_452 = class(TJavaGenericImport<JRightMarginRecord_452Class, JRightMarginRecord_452>) end;

  JRowRecord_453Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{1980C19C-0A15-47B9-A5D8-A612037A0648}']
    { static Property Methods }

    { static Methods }
    {class} function init(rn: Integer; ws: JWritableSheet): JRowRecord_453; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/RowRecord')]
  JRowRecord_453 = interface(JWritableRecordData) // or JObject
  ['{C09F7772-CF39-4B67-9CE3-9BFFB2FC789F}']
    { Property Methods }

    { methods }
    procedure setRowHeight(h: Integer); cdecl;
    procedure setCollapsed(c: Boolean); cdecl;
    function getRowNumber: Integer; cdecl;
    procedure addCell(cv: JCellValue); cdecl;
    procedure removeCell(col: Integer); cdecl;
    procedure write(outputFile: JFile); cdecl;
    procedure writeCells(outputFile: JFile); cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    function getMaxColumn: Integer; cdecl;
    function getCell(col: Integer): JCellValue; cdecl;
    function isDefaultHeight: Boolean; cdecl;
    function getRowHeight: Integer; cdecl;
    function isCollapsed: Boolean; cdecl;
    function getOutlineLevel: Integer; cdecl;
    function getGroupStart: Boolean; cdecl;
    procedure incrementOutlineLevel; cdecl;
    procedure decrementOutlineLevel; cdecl;
    procedure setOutlineLevel(level: Integer); cdecl;
    procedure setGroupStart(value: Boolean); cdecl;

    { Property }
  end;

  TJRowRecord_453 = class(TJavaGenericImport<JRowRecord_453Class, JRowRecord_453>) end;

  JRowsExceededExceptionClass = interface(JJxlWriteExceptionClass) // or JObjectClass
  ['{E7CDB0AC-95AB-4470-A154-A893DC0DFDBE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRowsExceededException; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/RowsExceededException')]
  JRowsExceededException = interface(JJxlWriteException) // or JObject
  ['{D4DA1480-AE1B-43E3-80A8-C80D8BA4978B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRowsExceededException = class(TJavaGenericImport<JRowsExceededExceptionClass, JRowsExceededException>) end;

  JSaveRecalcRecord_455Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{B3B42F96-2B99-4FB4-81A0-BEEC03333174}']
    { static Property Methods }

    { static Methods }
    {class} function init(r: Boolean): JSaveRecalcRecord_455; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SaveRecalcRecord')]
  JSaveRecalcRecord_455 = interface(JWritableRecordData) // or JObject
  ['{43DCAD5A-3660-4FB5-8AE3-0FC7A9F2A62D}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSaveRecalcRecord_455 = class(TJavaGenericImport<JSaveRecalcRecord_455Class, JSaveRecalcRecord_455>) end;

  JScenarioProtectRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{E28878D5-4C56-41BB-876E-0436DC7FE05A}']
    { static Property Methods }

    { static Methods }
    {class} function init(prot: Boolean): JScenarioProtectRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/ScenarioProtectRecord')]
  JScenarioProtectRecord = interface(JWritableRecordData) // or JObject
  ['{38709B3C-2A28-48EB-8B0E-F885C5C24674}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJScenarioProtectRecord = class(TJavaGenericImport<JScenarioProtectRecordClass, JScenarioProtectRecord>) end;

  JSCLRecord_457Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{F9562078-615B-4D98-A721-1870D929A075}']
    { static Property Methods }

    { static Methods }
    {class} function init(zf: Integer): JSCLRecord_457; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SCLRecord')]
  JSCLRecord_457 = interface(JWritableRecordData) // or JObject
  ['{75BE7391-10F0-4168-910C-E2D588EDEE5B}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSCLRecord_457 = class(TJavaGenericImport<JSCLRecord_457Class, JSCLRecord_457>) end;

  JSelectionRecord_PaneTypeClass = interface(JObjectClass)
  ['{EE8B73A6-2BBE-4BAC-B46C-71A5061B2B48}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SelectionRecord$PaneType')]
  JSelectionRecord_PaneType = interface(JObject)
  ['{9BB64444-8514-47C6-B2B3-207AA48122C6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSelectionRecord_PaneType = class(TJavaGenericImport<JSelectionRecord_PaneTypeClass, JSelectionRecord_PaneType>) end;

  JSelectionRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{F29DC630-20BE-452C-9DC4-A4CE78C0B6E8}']
    { static Property Methods }
    {class} function _GetlowerRight: JSelectionRecord_PaneType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetupperRight: JSelectionRecord_PaneType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetlowerLeft: JSelectionRecord_PaneType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetupperLeft: JSelectionRecord_PaneType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(pt: JSelectionRecord_PaneType; col: Integer; r: Integer): JSelectionRecord; cdecl;

    { static Property }
    {class} property lowerRight: JSelectionRecord_PaneType read _GetlowerRight;
    {class} property upperRight: JSelectionRecord_PaneType read _GetupperRight;
    {class} property lowerLeft: JSelectionRecord_PaneType read _GetlowerLeft;
    {class} property upperLeft: JSelectionRecord_PaneType read _GetupperLeft;
  end;

  [JavaSignature('jxl/write/biff/SelectionRecord')]
  JSelectionRecord = interface(JWritableRecordData) // or JObject
  ['{2D6FC83C-7A38-453F-81D9-4A75B5783269}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSelectionRecord = class(TJavaGenericImport<JSelectionRecordClass, JSelectionRecord>) end;

  JSetupRecord_460Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{F7C567CA-C332-411F-810B-76A0755EA61D}']
    { static Property Methods }

    { static Methods }
    {class} function init(s: JSheetSettings): JSetupRecord_460; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SetupRecord')]
  JSetupRecord_460 = interface(JWritableRecordData) // or JObject
  ['{88C3E22B-34E9-4CD7-83FB-F9CF90F8CED8}']
    { Property Methods }

    { methods }
    procedure setOrientation(o: JPageOrientation); cdecl;
    procedure setOrder(o: JPageOrder); cdecl;
    procedure setMargins(hm: Double; P2: Double); cdecl;
    procedure setPaperSize(ps: JPaperSize); cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSetupRecord_460 = class(TJavaGenericImport<JSetupRecord_460Class, JSetupRecord_460>) end;

  JSharedStringsClass = interface(JObjectClass)
  ['{5265D33C-4605-4C44-8BC7-526D33287D8E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSharedStrings; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SharedStrings')]
  JSharedStrings = interface(JObject)
  ['{D39A14DB-A214-419D-9236-E62EA18E16E5}']
    { Property Methods }

    { methods }
    function getIndex(s: JString): Integer; cdecl;
    function get(i: Integer): JString; cdecl;
    procedure write(outputFile: JFile); cdecl;

    { Property }
  end;

  TJSharedStrings = class(TJavaGenericImport<JSharedStringsClass, JSharedStrings>) end;

  JSheetCopierClass = interface(JObjectClass)
  ['{F1DA6A34-D009-4E7C-A189-A06983A15537}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JSheet; t: JWritableSheet): JSheetCopier; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SheetCopier')]
  JSheetCopier = interface(JObject)
  ['{8E688916-E449-4B52-A95F-109BC04C88A5}']
    { Property Methods }

    { methods }
    procedure copySheet; cdecl;
    procedure copyWritableSheet; cdecl;
    procedure importSheet; cdecl;
    function getMaxColumnOutlineLevel: Integer; cdecl;
    function getMaxRowOutlineLevel: Integer; cdecl;

    { Property }
  end;

  TJSheetCopier = class(TJavaGenericImport<JSheetCopierClass, JSheetCopier>) end;

  JSheetWriterClass = interface(JObjectClass)
  ['{FDA4CEB7-AB9E-403D-9787-0AFCCFEA9E6D}']
    { static Property Methods }

    { static Methods }
    {class} function init(aof: JFile; wsi: JWritableSheetImpl; ws: JWorkbookSettings): JSheetWriter; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SheetWriter')]
  JSheetWriter = interface(JObject)
  ['{A1DAB690-5579-46C4-B396-4A619A34C82B}']
    { Property Methods }

    { methods }
    procedure write; cdecl;

    { Property }
  end;

  TJSheetWriter = class(TJavaGenericImport<JSheetWriterClass, JSheetWriter>) end;

  JSortRecord_464Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{6A0ACE52-6EF5-466B-A942-6B79F1EFEADB}']
    { static Property Methods }

    { static Methods }
    {class} function init(a: JString; b: JString; c: JString; sc: Boolean; sk1d: Boolean; sk2d: Boolean; sk3d: Boolean; scs: Boolean): JSortRecord_464; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SortRecord')]
  JSortRecord_464 = interface(JWritableRecordData) // or JObject
  ['{4C7A3FF7-7156-493A-8B8B-4C746BF89AC2}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSortRecord_464 = class(TJavaGenericImport<JSortRecord_464Class, JSortRecord_464>) end;

  JSSTContinueRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{5948EEDC-20C0-4541-B309-7ED1528EDB40}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSSTContinueRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SSTContinueRecord')]
  JSSTContinueRecord = interface(JWritableRecordData) // or JObject
  ['{A95D36BE-9652-4F52-A50E-5B00A7181B1B}']
    { Property Methods }

    { methods }
    function setFirstString(s: JString; b: Boolean): Integer; cdecl;
    function getOffset: Integer; cdecl;
    function add(s: JString): Integer; cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSSTContinueRecord = class(TJavaGenericImport<JSSTContinueRecordClass, JSSTContinueRecord>) end;

  JSSTRecord_466Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{4327078D-2607-49E7-895B-A00B883A3ACD}']
    { static Property Methods }

    { static Methods }
    {class} function init(numRefs: Integer; P2: Integer): JSSTRecord_466; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SSTRecord')]
  JSSTRecord_466 = interface(JWritableRecordData) // or JObject
  ['{C045E0C2-8614-4C83-8819-DA25FE6B9AF7}']
    { Property Methods }

    { methods }
    function add(s: JString): Integer; cdecl;
    function getOffset: Integer; cdecl;
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJSSTRecord_466 = class(TJavaGenericImport<JSSTRecord_466Class, JSSTRecord_466>) end;

  JStringRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{20329577-ECAA-42B8-A88F-09DE22A03317}']
    { static Property Methods }

    { static Methods }
    {class} function init(val: JString): JStringRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/StringRecord')]
  JStringRecord = interface(JWritableRecordData) // or JObject
  ['{8EE6A1C1-7407-44C1-9CEC-00E0A52DB05E}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJStringRecord = class(TJavaGenericImport<JStringRecordClass, JStringRecord>) end;

  JStylesClass = interface(JObjectClass)
  ['{ADB3B43B-B860-4614-B3E7-9BB9ED858390}']
    { static Property Methods }

    { static Methods }
    {class} function init: JStyles; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/Styles')]
  JStyles = interface(JObject)
  ['{7F5D80D5-A330-4720-8901-F586B4C18B0F}']
    { Property Methods }

    { methods }
    function getNormalStyle: JWritableCellFormat; cdecl;
    function getHiddenStyle: JWritableCellFormat; cdecl;
    function getHyperlinkStyle: JWritableCellFormat; cdecl;
    function getArial10Pt: JWritableFont; cdecl;
    function getHyperlinkFont: JWritableFont; cdecl;
    function getDefaultDateFormat: JWritableCellFormat; cdecl;
    function getFormat(wf: JXFRecord): JXFRecord; cdecl;

    { Property }
  end;

  TJStyles = class(TJavaGenericImport<JStylesClass, JStyles>) end;

  JStyleXFRecordClass = interface(JXFRecordClass) // or JObjectClass
  ['{07039804-3557-433B-9C82-FBF03DA4B04F}']
    { static Property Methods }

    { static Methods }
    {class} function init(fnt: JFontRecord; form: JDisplayFormat): JStyleXFRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/StyleXFRecord')]
  JStyleXFRecord = interface(JXFRecord) // or JObject
  ['{A29DFAED-E477-4927-8D4D-1ECDFF8DBE78}']
    { Property Methods }

    { methods }
    procedure setCellOptions(opt: Integer); cdecl;
    procedure setLocked(l: Boolean); cdecl;

    { Property }
  end;

  TJStyleXFRecord = class(TJavaGenericImport<JStyleXFRecordClass, JStyleXFRecord>) end;

  JSupbookRecord_1_470Class = interface(JObjectClass)
  ['{1C7B5FAF-9D8E-414B-A304-EA762C2408BF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SupbookRecord$1')]
  JSupbookRecord_1_470 = interface(JObject)
  ['{6A6B9A18-5FB2-4E4C-B5B0-E986AAD7CB06}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSupbookRecord_1_470 = class(TJavaGenericImport<JSupbookRecord_1_470Class, JSupbookRecord_1_470>) end;

  JSupbookRecord_SupbookTypeClass = interface(JObjectClass)
  ['{E3515ED3-E46D-46BE-828D-899E9125046B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/SupbookRecord$SupbookType')]
  JSupbookRecord_SupbookType = interface(JObject)
  ['{22485FAE-050C-47B2-9738-637D4E9D4117}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSupbookRecord_SupbookType = class(TJavaGenericImport<JSupbookRecord_SupbookTypeClass, JSupbookRecord_SupbookType>) end;

  JSupbookRecord_472Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{C1F1A7DE-B567-414D-A09F-2AF52A4D5F06}']
    { static Property Methods }
    {class} function _GetINTERNAL: JSupbookRecord_SupbookType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXTERNAL: JSupbookRecord_SupbookType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetADDIN: JSupbookRecord_SupbookType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLINK: JSupbookRecord_SupbookType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JSupbookRecord_SupbookType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSupbookRecord_472; cdecl; overload;
    {class} function init(sheets: Integer; ws: JWorkbookSettings): JSupbookRecord_472; cdecl; overload;
    {class} function init(fn: JString; ws: JWorkbookSettings): JSupbookRecord_472; cdecl; overload;
    {class} function init(sr: JSupbookRecord; ws: JWorkbookSettings): JSupbookRecord_472; cdecl; overload;

    { static Property }
    {class} property INTERNAL: JSupbookRecord_SupbookType read _GetINTERNAL;
    {class} property &EXTERNAL: JSupbookRecord_SupbookType read _GetEXTERNAL;
    {class} property ADDIN: JSupbookRecord_SupbookType read _GetADDIN;
    {class} property LINK: JSupbookRecord_SupbookType read _GetLINK;
    {class} property UNKNOWN: JSupbookRecord_SupbookType read _GetUNKNOWN;
  end;

  [JavaSignature('jxl/write/biff/SupbookRecord')]
  JSupbookRecord_472 = interface(JWritableRecordData) // or JObject
  ['{65921AAB-F195-45AA-98A2-5CDB796B5B22}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;
    function getType: JSupbookRecord_SupbookType; cdecl;
    function getNumberOfSheets: Integer; cdecl;
    function getFileName: JString; cdecl;
    function getSheetIndex(s: JString): Integer; cdecl;
    function getSheetName(s: Integer): JString; cdecl;

    { Property }
  end;

  TJSupbookRecord_472 = class(TJavaGenericImport<JSupbookRecord_472Class, JSupbookRecord_472>) end;

  JTabIdRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{5CE453E4-9EFE-46EC-86C5-D992BBD2EB76}']
    { static Property Methods }

    { static Methods }
    {class} function init(sheets: Integer): JTabIdRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/TabIdRecord')]
  JTabIdRecord = interface(JWritableRecordData) // or JObject
  ['{F1D6D565-3DD9-46EC-A81F-BF97EC78610E}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJTabIdRecord = class(TJavaGenericImport<JTabIdRecordClass, JTabIdRecord>) end;

  JTopMarginRecord_474Class = interface(JMarginRecord_420Class) // or JObjectClass
  ['{9F3E0192-3D26-4EC9-AE20-40A22A9FEB04}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/TopMarginRecord')]
  JTopMarginRecord_474 = interface(JMarginRecord_420) // or JObject
  ['{60B1B975-F95C-4BD6-AE9E-30BC348CE13D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTopMarginRecord_474 = class(TJavaGenericImport<JTopMarginRecord_474Class, JTopMarginRecord_474>) end;

  JUsesElfsRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{07E7DB65-C779-454F-93D6-8B81B88655EC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUsesElfsRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/UsesElfsRecord')]
  JUsesElfsRecord = interface(JWritableRecordData) // or JObject
  ['{C100F901-C867-4E09-9AE7-0D5083C96ECE}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJUsesElfsRecord = class(TJavaGenericImport<JUsesElfsRecordClass, JUsesElfsRecord>) end;

  JVerticalCentreRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{AAD56F35-863F-4BB6-BD04-85F3175B15DB}']
    { static Property Methods }

    { static Methods }
    {class} function init(ce: Boolean): JVerticalCentreRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/VerticalCentreRecord')]
  JVerticalCentreRecord = interface(JWritableRecordData) // or JObject
  ['{CE24B6CA-8766-41EA-B8ED-141A8F7A655F}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJVerticalCentreRecord = class(TJavaGenericImport<JVerticalCentreRecordClass, JVerticalCentreRecord>) end;

  JVerticalPageBreaksRecord_477Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{CDE64B73-F2B3-4962-BB68-6C86CAB06F42}']
    { static Property Methods }

    { static Methods }
    {class} function init(breaks: TJavaArray<Integer>): JVerticalPageBreaksRecord_477; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/VerticalPageBreaksRecord')]
  JVerticalPageBreaksRecord_477 = interface(JWritableRecordData) // or JObject
  ['{D6220A05-590C-4162-8A7D-15A9F8A1C243}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJVerticalPageBreaksRecord_477 = class(TJavaGenericImport<JVerticalPageBreaksRecord_477Class, JVerticalPageBreaksRecord_477>) end;

  JWeird1RecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{E89C5B37-5457-46AE-B146-3BF8E87F86DD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWeird1Record; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/Weird1Record')]
  JWeird1Record = interface(JWritableRecordData) // or JObject
  ['{163A87D1-031B-4220-AB92-D962FD05EA99}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJWeird1Record = class(TJavaGenericImport<JWeird1RecordClass, JWeird1Record>) end;

  JWindow1RecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{1BB3970E-A07A-4554-A8CF-557C0B6F4608}']
    { static Property Methods }

    { static Methods }
    {class} function init(selSheet: Integer): JWindow1Record; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/Window1Record')]
  JWindow1Record = interface(JWritableRecordData) // or JObject
  ['{394D93D4-F92F-440A-9898-24A03E15F0BB}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJWindow1Record = class(TJavaGenericImport<JWindow1RecordClass, JWindow1Record>) end;

  JWindow2Record_480Class = interface(JWritableRecordDataClass) // or JObjectClass
  ['{0C09EC13-1A64-4C52-9264-A5D7C56445C1}']
    { static Property Methods }

    { static Methods }
    {class} function init(settings: JSheetSettings): JWindow2Record_480; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/Window2Record')]
  JWindow2Record_480 = interface(JWritableRecordData) // or JObject
  ['{F442B12F-1E8B-461A-A9FE-D9483DF02D69}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJWindow2Record_480 = class(TJavaGenericImport<JWindow2Record_480Class, JWindow2Record_480>) end;

  JWindowProtectRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{F25F1DA3-435A-4EFD-AC2C-2D6CEA73A0E0}']
    { static Property Methods }

    { static Methods }
    {class} function init(prot: Boolean): JWindowProtectRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/WindowProtectRecord')]
  JWindowProtectRecord = interface(JWritableRecordData) // or JObject
  ['{D547F87B-7864-4AF6-86D2-27518EBC41B0}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJWindowProtectRecord = class(TJavaGenericImport<JWindowProtectRecordClass, JWindowProtectRecord>) end;

  JWritableFontRecordClass = interface(JFontRecordClass) // or JObjectClass
  ['{CF78FAC4-1EF7-40AB-8813-416131339121}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/WritableFontRecord')]
  JWritableFontRecord = interface(JFontRecord) // or JObject
  ['{2EDA8FBB-A47D-4777-939C-C41FD3B1EE7E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWritableFontRecord = class(TJavaGenericImport<JWritableFontRecordClass, JWritableFontRecord>) end;

  JWritableFontsClass = interface(JFontsClass) // or JObjectClass
  ['{97A04600-D267-4736-9095-C89AC6701E33}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: JWritableWorkbookImpl): JWritableFonts; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/WritableFonts')]
  JWritableFonts = interface(JFonts) // or JObject
  ['{3B3BE123-3A7D-4FBF-A307-1D02D2FB0959}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWritableFonts = class(TJavaGenericImport<JWritableFontsClass, JWritableFonts>) end;

  JWritableFormattingRecordsClass = interface(JFormattingRecordsClass) // or JObjectClass
  ['{1B3264C0-00CF-4D3F-BC42-83175B86519D}']
    { static Property Methods }
    {class} function _GetnormalStyle: JWritableCellFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(f: JFonts; styles: JStyles): JWritableFormattingRecords; cdecl;

    { static Property }
    {class} property normalStyle: JWritableCellFormat read _GetnormalStyle;
  end;

  [JavaSignature('jxl/write/biff/WritableFormattingRecords')]
  JWritableFormattingRecords = interface(JFormattingRecords) // or JObject
  ['{0835A20D-228E-4430-93F3-32728A3B03C3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWritableFormattingRecords = class(TJavaGenericImport<JWritableFormattingRecordsClass, JWritableFormattingRecords>) end;

  JWritableSheetCopierClass = interface(JObjectClass)
  ['{F1814FC2-7FB2-464A-BF20-9874066353FF}']
    { static Property Methods }

    { static Methods }
    {class} function init(f: JWritableSheet; t: JWritableSheet): JWritableSheetCopier; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/WritableSheetCopier')]
  JWritableSheetCopier = interface(JObject)
  ['{1410A587-2E9F-44B1-B2E0-D6CECF7DCFAC}']
    { Property Methods }

    { methods }
    procedure copySheet; cdecl;
    function getMaxColumnOutlineLevel: Integer; cdecl;
    function getMaxRowOutlineLevel: Integer; cdecl;

    { Property }
  end;

  TJWritableSheetCopier = class(TJavaGenericImport<JWritableSheetCopierClass, JWritableSheetCopier>) end;

  JWritableSheetImpl_1Class = interface(JObjectClass)
  ['{D83444FE-0AC5-49BF-B1F1-89BFDEDD58C6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/WritableSheetImpl$1')]
  JWritableSheetImpl_1 = interface(JObject)
  ['{C65B1021-85DB-4210-99CB-E881D598EF23}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWritableSheetImpl_1 = class(TJavaGenericImport<JWritableSheetImpl_1Class, JWritableSheetImpl_1>) end;

  JWritableSheetImpl_ColumnInfoComparatorClass = interface(JObjectClass)
  ['{22D89607-90B3-45D3-861A-2225938CAD4E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/WritableSheetImpl$ColumnInfoComparator')]
  JWritableSheetImpl_ColumnInfoComparator = interface(JObject)
  ['{82B3B42F-D652-4EC8-AC70-73C2A112A237}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function compare(o1: JObject; o2: JObject): Integer; cdecl;

    { Property }
  end;

  TJWritableSheetImpl_ColumnInfoComparator = class(TJavaGenericImport<JWritableSheetImpl_ColumnInfoComparatorClass, JWritableSheetImpl_ColumnInfoComparator>) end;

  JWritableSheetImplClass = interface(JObjectClass)
  ['{98F45725-EDCD-4D22-938A-A7FEA64CD935}']
    { static Property Methods }

    { static Methods }
    {class} function init(n: JString; aof: JFile; fr: JFormattingRecords; ss: JSharedStrings; ws: JWorkbookSettings; ww: JWritableWorkbookImpl): JWritableSheetImpl; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/WritableSheetImpl')]
  JWritableSheetImpl = interface(JObject)
  ['{7124D24D-D6F8-464F-B62A-018BAF6981AA}']
    { Property Methods }

    { methods }
    function getCell(loc: JString): JCell; cdecl; overload;
    function getCell(column: Integer; row: Integer): JCell; cdecl; overload;
    function getWritableCell(loc: JString): JWritableCell; cdecl; overload;
    function getWritableCell(column: Integer; row: Integer): JWritableCell; cdecl; overload;
    function getRows: Integer; cdecl;
    function getColumns: Integer; cdecl;
    function findCell(contents: JString): JCell; cdecl;
    function findLabelCell(contents: JString): JLabelCell; cdecl;
    function getRow(row: Integer): TJavaObjectArray<JCell>; cdecl;
    function getColumn(col: Integer): TJavaObjectArray<JCell>; cdecl;
    function getName: JString; cdecl;
    procedure insertRow(row: Integer); cdecl;
    procedure insertColumn(col: Integer); cdecl;
    procedure removeColumn(col: Integer); cdecl;
    procedure removeRow(row: Integer); cdecl;
    procedure addCell(cell: JWritableCell); cdecl;
    procedure setName(n: JString); cdecl;
    procedure setHidden(h: Boolean); cdecl; //Deprecated
    procedure setProtected(prot: Boolean); cdecl; //Deprecated
    procedure setSelected; cdecl; //Deprecated
    function isHidden: Boolean; cdecl; //Deprecated
    procedure setColumnView(col: Integer; width: Integer); cdecl; overload;
    procedure setColumnView(col: Integer; width: Integer; format: JCellFormat); cdecl; overload;
    procedure setColumnView(col: Integer; view: JCellView); cdecl; overload;
    procedure setRowView(row: Integer; height: Integer); cdecl; overload; //Deprecated
    procedure setRowView(row: Integer; collapsed: Boolean); cdecl; overload; //Deprecated
    procedure setRowView(row: Integer; height: Integer; collapsed: Boolean); cdecl; overload; //Deprecated
    procedure setRowView(row: Integer; view: JCellView); cdecl; overload;
    procedure write; cdecl;
    function isProtected: Boolean; cdecl; //Deprecated
    function getHyperlinks: TJavaObjectArray<JHyperlink>; cdecl;
    function getMergedCells: TJavaObjectArray<JRange>; cdecl;
    function getWritableHyperlinks: TJavaObjectArray<JWritableHyperlink>; cdecl;
    procedure removeHyperlink(h: JWritableHyperlink); cdecl; overload;
    procedure removeHyperlink(h: JWritableHyperlink; preserveLabel: Boolean); cdecl; overload;
    procedure addHyperlink(h: JWritableHyperlink); cdecl;
    function mergeCells(col1: Integer; row1: Integer; col2: Integer; row2: Integer): JRange; cdecl;
    procedure setRowGroup(row1: Integer; row2: Integer; collapsed: Boolean); cdecl;
    procedure unsetRowGroup(row1: Integer; row2: Integer); cdecl;
    procedure setColumnGroup(col1: Integer; col2: Integer; collapsed: Boolean); cdecl;
    procedure unsetColumnGroup(col1: Integer; col2: Integer); cdecl;
    procedure unmergeCells(r: JRange); cdecl;
    procedure setHeader(l: JString; c: JString; r: JString); cdecl; //Deprecated
    procedure setFooter(l: JString; c: JString; r: JString); cdecl; //Deprecated
    procedure setPageSetup(p: JPageOrientation); cdecl; overload; //Deprecated
    procedure setPageSetup(p: JPageOrientation; hm: Double; P3: Double); cdecl; overload; //Deprecated
    procedure setPageSetup(p: JPageOrientation; ps: JPaperSize; hm: Double; P4: Double); cdecl; overload; //Deprecated
    function getSettings: JSheetSettings; cdecl;
    procedure addRowPageBreak(row: Integer); cdecl;
    procedure addColumnPageBreak(col: Integer); cdecl;
    function getColumnFormat(col: Integer): JCellFormat; cdecl; //Deprecated
    function getColumnWidth(col: Integer): Integer; cdecl; //Deprecated
    function getRowHeight(row: Integer): Integer; cdecl; //Deprecated
    function getRowView(row: Integer): JCellView; cdecl;
    function getColumnView(col: Integer): JCellView; cdecl;
    procedure addImage(image: JWritableImage); cdecl;
    function getNumberOfImages: Integer; cdecl;
    function getImage(i: Integer): JWritableImage; cdecl;
    function getDrawing(i: Integer): JImage; cdecl;
    procedure removeImage(wi: JWritableImage); cdecl;
    function getRowPageBreaks: TJavaArray<Integer>; cdecl;
    function getColumnPageBreaks: TJavaArray<Integer>; cdecl;
    function getDataValidation: JDataValidation; cdecl;

    { Property }
  end;

  TJWritableSheetImpl = class(TJavaGenericImport<JWritableSheetImplClass, JWritableSheetImpl>) end;

  JWritableWorkbookImplClass = interface(JWritableWorkbookClass) // or JObjectClass
  ['{128460F5-9656-47F9-A312-5E62A316258F}']
    { static Property Methods }

    { static Methods }
    {class} function init(os: JOutputStream; cs: Boolean; ws: JWorkbookSettings): JWritableWorkbookImpl; cdecl; overload;
    {class} function init(os: JOutputStream; w: JWorkbook; cs: Boolean; ws: JWorkbookSettings): JWritableWorkbookImpl; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/WritableWorkbookImpl')]
  JWritableWorkbookImpl = interface(JWritableWorkbook) // or JObject
  ['{29D1C30D-D5E1-4712-B5A1-4A3DD935518B}']
    { Property Methods }

    { methods }
    function getSheets: TJavaObjectArray<JWritableSheet>; cdecl;
    function getSheetNames: TJavaObjectArray<JString>; cdecl;
    function getReadSheet(index: Integer): JSheet; cdecl;
    function getSheet(index: Integer): JWritableSheet; cdecl; overload;
    function getSheet(name: JString): JWritableSheet; cdecl; overload;
    function getNumberOfSheets: Integer; cdecl;
    procedure close; cdecl;
    procedure setOutputFile(fileName: JFile); cdecl;
    function createSheet(name: JString; index: Integer): JWritableSheet; cdecl;
    procedure removeSheet(index: Integer); cdecl;
    function moveSheet(fromIndex: Integer; toIndex: Integer): JWritableSheet; cdecl;
    procedure write; cdecl;
    procedure copySheet(s: Integer; name: JString; index: Integer); cdecl; overload;
    procedure copySheet(s: JString; name: JString; index: Integer); cdecl; overload;
    procedure setProtected(prot: Boolean); cdecl;
    function getExternalSheetName(index: Integer): JString; cdecl;
    function getLastExternalSheetName(index: Integer): JString; cdecl;
    function getWorkbookBof: JBOFRecord; cdecl;
    function getExternalSheetIndex(index: Integer): Integer; cdecl; overload;
    function getLastExternalSheetIndex(index: Integer): Integer; cdecl; overload;
    function getExternalSheetIndex(sheetName: JString): Integer; cdecl; overload;
    function getLastExternalSheetIndex(sheetName: JString): Integer; cdecl; overload;
    procedure setColourRGB(c: JColour; r: Integer; g: Integer; b: Integer); cdecl;
    function getColourRGB(c: JColour): JRGB; cdecl;
    function getName(index: Integer): JString; cdecl;
    function getNameIndex(name: JString): Integer; cdecl;
    function findCellByName(name: JString): JWritableCell; cdecl;
    function findByName(name: JString): TJavaObjectArray<JRange>; cdecl;
    function getRangeNames: TJavaObjectArray<JString>; cdecl;
    procedure removeRangeName(name: JString); cdecl;
    procedure addNameArea(name: JString; sheet: JWritableSheet; firstCol: Integer; firstRow: Integer; lastCol: Integer; lastRow: Integer); cdecl;
    function getWritableCell(loc: JString): JWritableCell; cdecl;
    function importSheet(name: JString; index: Integer; sheet: JSheet): JWritableSheet; cdecl;

    { Property }
  end;

  TJWritableWorkbookImpl = class(TJavaGenericImport<JWritableWorkbookImplClass, JWritableWorkbookImpl>) end;

  JWriteAccessRecordClass = interface(JWritableRecordDataClass) // or JObjectClass
  ['{C05D6224-938C-4E65-BE73-45FEC9C5FBFC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWriteAccessRecord; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/biff/WriteAccessRecord')]
  JWriteAccessRecord = interface(JWritableRecordData) // or JObject
  ['{FEE0DAFD-20B1-4BE5-AE93-54B223495344}']
    { Property Methods }

    { methods }
    function getData: TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJWriteAccessRecord = class(TJavaGenericImport<JWriteAccessRecordClass, JWriteAccessRecord>) end;

  JBlankClass = interface(JBlankRecordClass) // or JObjectClass
  ['{C10D30F0-789F-4F41-8D8D-0982493786DD}']
    { static Property Methods }

    { static Methods }
    {class} function init(c: Integer; r: Integer): JBlank; cdecl; overload;
    {class} function init(c: Integer; r: Integer; st: JCellFormat): JBlank; cdecl; overload;
    {class} function init(lc: JCell): JBlank; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/Blank')]
  JBlank = interface(JBlankRecord) // or JObject
  ['{7F8D65C2-7E97-4270-80B8-4BFC5D4E985C}']
    { Property Methods }

    { methods }
    function copyTo(col: Integer; row: Integer): JWritableCell; cdecl;

    { Property }
  end;

  TJBlank = class(TJavaGenericImport<JBlankClass, JBlank>) end;

  JBoldStyle_492Class = interface(JBoldStyleClass) // or JObjectClass
  ['{3E5AEB14-B646-4EA1-BC97-B2CDC1872F70}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/BoldStyle')]
  JBoldStyle_492 = interface(JBoldStyle) // or JObject
  ['{14F306E8-B619-49D1-9ABA-ECD6EA805FBD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBoldStyle_492 = class(TJavaGenericImport<JBoldStyle_492Class, JBoldStyle_492>) end;

  JBooleanClass = interface(JBooleanRecord_367Class) // or JObjectClass
  ['{0B66353C-3371-4192-9B7B-646812E6F085}']
    { static Property Methods }

    { static Methods }
    {class} function init(c: Integer; r: Integer; val: Boolean): JBoolean; cdecl; overload;
    {class} function init(c: Integer; r: Integer; val: Boolean; st: JCellFormat): JBoolean; cdecl; overload;
    {class} function init(nc: JBooleanCell): JBoolean; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/Boolean')]
  JBoolean = interface(JBooleanRecord_367) // or JObject
  ['{090E3DB2-FD72-48A9-AD26-18928BB5407B}']
    { Property Methods }

    { methods }
    procedure setValue(val: Boolean); cdecl;
    function copyTo(col: Integer; row: Integer): JWritableCell; cdecl;

    { Property }
  end;

  TJBoolean = class(TJavaGenericImport<JBooleanClass, JBoolean>) end;

  JBorder_494Class = interface(JBorderClass) // or JObjectClass
  ['{12A89533-97D0-443D-8F5C-201734A4CA07}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/Border')]
  JBorder_494 = interface(JBorder) // or JObject
  ['{0A7B0B4D-2A4E-4080-B9F5-8E304EB6E2C0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBorder_494 = class(TJavaGenericImport<JBorder_494Class, JBorder_494>) end;

  JBorderLineStyle_495Class = interface(JBorderLineStyleClass) // or JObjectClass
  ['{92D97B4F-F4BE-4995-8C8E-51B4702E4B81}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/BorderLineStyle')]
  JBorderLineStyle_495 = interface(JBorderLineStyle) // or JObject
  ['{CDB019D1-6F78-4A5C-B51E-D602FF0AA2E4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBorderLineStyle_495 = class(TJavaGenericImport<JBorderLineStyle_495Class, JBorderLineStyle_495>) end;

  JColour_496Class = interface(JColourClass) // or JObjectClass
  ['{2BE11FF6-38F6-4D9C-A335-87368BD71D13}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/Colour')]
  JColour_496 = interface(JColour) // or JObject
  ['{70BA3422-5C41-41D0-B84F-E66E6782A913}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJColour_496 = class(TJavaGenericImport<JColour_496Class, JColour_496>) end;

  JDateFormatClass = interface(JDateFormatRecordClass) // or JObjectClass
  ['{E59078F4-4B78-405D-A321-F28650470F11}']
    { static Property Methods }

    { static Methods }
    {class} function init(format: JString): JDateFormat; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/DateFormat')]
  JDateFormat = interface(JDateFormatRecord) // or JObject
  ['{1E1F3B0E-0769-490F-B2AF-5DE3FC2DB436}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDateFormat = class(TJavaGenericImport<JDateFormatClass, JDateFormat>) end;

  JDateFormats_BuiltInFormatClass = interface(JObjectClass)
  ['{E9713D4F-18BE-45F3-A85E-A7328C4BBC97}']
    { static Property Methods }

    { static Methods }
    {class} function init(i: Integer; s: JString): JDateFormats_BuiltInFormat; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/DateFormats$BuiltInFormat')]
  JDateFormats_BuiltInFormat = interface(JObject)
  ['{F067A168-AC9A-46F3-94EA-B6ED1355BA7C}']
    { Property Methods }

    { methods }
    function getFormatIndex: Integer; cdecl;
    function isInitialized: Boolean; cdecl;
    procedure initialize(pos: Integer); cdecl;
    function isBuiltIn: Boolean; cdecl;
    function getFormatString: JString; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJDateFormats_BuiltInFormat = class(TJavaGenericImport<JDateFormats_BuiltInFormatClass, JDateFormats_BuiltInFormat>) end;

  JDateFormatsClass = interface(JObjectClass)
  ['{0083A40A-5B65-4592-A5F4-81C43C18DD80}']
    { static Property Methods }
    {class} function _GetFORMAT1: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT2: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT3: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT4: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT5: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT6: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT7: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT8: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT9: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT10: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT11: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT12: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDateFormats; cdecl;

    { static Property }
    {class} property FORMAT1: JDisplayFormat read _GetFORMAT1;
    {class} property DEFAULT: JDisplayFormat read _GetDEFAULT;
    {class} property FORMAT2: JDisplayFormat read _GetFORMAT2;
    {class} property FORMAT3: JDisplayFormat read _GetFORMAT3;
    {class} property FORMAT4: JDisplayFormat read _GetFORMAT4;
    {class} property FORMAT5: JDisplayFormat read _GetFORMAT5;
    {class} property FORMAT6: JDisplayFormat read _GetFORMAT6;
    {class} property FORMAT7: JDisplayFormat read _GetFORMAT7;
    {class} property FORMAT8: JDisplayFormat read _GetFORMAT8;
    {class} property FORMAT9: JDisplayFormat read _GetFORMAT9;
    {class} property FORMAT10: JDisplayFormat read _GetFORMAT10;
    {class} property FORMAT11: JDisplayFormat read _GetFORMAT11;
    {class} property FORMAT12: JDisplayFormat read _GetFORMAT12;
  end;

  [JavaSignature('jxl/write/DateFormats')]
  JDateFormats = interface(JObject)
  ['{462E4367-7610-466A-A60C-B2DF8394B658}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDateFormats = class(TJavaGenericImport<JDateFormatsClass, JDateFormats>) end;

  JDateTimeClass = interface(JDateRecord_385Class) // or JObjectClass
  ['{CE9F8063-140B-48BC-8535-AAE3B88FCF24}']
    { static Property Methods }
    {class} function _GetGMT: JDateRecord_GMTDate;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(c: Integer; r: Integer; d: JDate): JDateTime; cdecl; overload;
    {class} function init(c: Integer; r: Integer; d: JDate; a: JDateRecord_GMTDate): JDateTime; cdecl; overload;
    {class} function init(c: Integer; r: Integer; d: JDate; st: JCellFormat): JDateTime; cdecl; overload;
    {class} function init(c: Integer; r: Integer; d: JDate; st: JCellFormat; a: JDateRecord_GMTDate): JDateTime; cdecl; overload;
    {class} function init(c: Integer; r: Integer; d: JDate; st: JCellFormat; tim: Boolean): JDateTime; cdecl; overload;
    {class} function init(dc: JDateCell): JDateTime; cdecl; overload;

    { static Property }
    {class} property GMT: JDateRecord_GMTDate read _GetGMT;
  end;

  [JavaSignature('jxl/write/DateTime')]
  JDateTime = interface(JDateRecord_385) // or JObject
  ['{9179DCA4-4A7E-4885-8DF8-31DC133CB404}']
    { Property Methods }

    { methods }
    procedure setDate(d: JDate); cdecl; overload;
    procedure setDate(d: JDate; a: JDateRecord_GMTDate); cdecl; overload;
    function copyTo(col: Integer; row: Integer): JWritableCell; cdecl;

    { Property }
  end;

  TJDateTime = class(TJavaGenericImport<JDateTimeClass, JDateTime>) end;

  JFont_501Class = interface(JWritableFontClass) // or JObjectClass
  ['{A60C9DCF-02DD-4B55-BE64-ABADB176E604}']
    { static Property Methods }
    {class} function _GetARIAL: JWritableFont_FontName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTIMES: JWritableFont_FontName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNO_BOLD: JWritableFont_BoldStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOLD: JWritableFont_BoldStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNO_UNDERLINE: JUnderlineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSINGLE: JUnderlineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOUBLE: JUnderlineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSINGLE_ACCOUNTING: JUnderlineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOUBLE_ACCOUNTING: JUnderlineStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNORMAL_SCRIPT: JScriptStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUPERSCRIPT: JScriptStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUBSCRIPT: JScriptStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(fn: JWritableFont_FontName): JFont_501; cdecl; overload; //Deprecated
    {class} function init(fn: JWritableFont_FontName; ps: Integer): JFont_501; cdecl; overload; //Deprecated
    {class} function init(fn: JWritableFont_FontName; ps: Integer; bs: JWritableFont_BoldStyle): JFont_501; cdecl; overload; //Deprecated
    {class} function init(fn: JWritableFont_FontName; ps: Integer; bs: JWritableFont_BoldStyle; italic: Boolean): JFont_501; cdecl; overload; //Deprecated
    {class} function init(fn: JWritableFont_FontName; ps: Integer; bs: JWritableFont_BoldStyle; it: Boolean; us: JUnderlineStyle): JFont_501; cdecl; overload; //Deprecated
    {class} function init(fn: JWritableFont_FontName; ps: Integer; bs: JWritableFont_BoldStyle; it: Boolean; us: JUnderlineStyle; c: JColour): JFont_501; cdecl; overload; //Deprecated
    {class} function init(fn: JWritableFont_FontName; ps: Integer; bs: JWritableFont_BoldStyle; it: Boolean; us: JUnderlineStyle; c: JColour; ss: JScriptStyle): JFont_501; cdecl; overload; //Deprecated

    { static Property }
    {class} property ARIAL: JWritableFont_FontName read _GetARIAL;
    {class} property TIMES: JWritableFont_FontName read _GetTIMES;
    {class} property NO_BOLD: JWritableFont_BoldStyle read _GetNO_BOLD;
    {class} property BOLD: JWritableFont_BoldStyle read _GetBOLD;
    {class} property NO_UNDERLINE: JUnderlineStyle read _GetNO_UNDERLINE;
    {class} property SINGLE: JUnderlineStyle read _GetSINGLE;
    {class} property DOUBLE: JUnderlineStyle read _GetDOUBLE;
    {class} property SINGLE_ACCOUNTING: JUnderlineStyle read _GetSINGLE_ACCOUNTING;
    {class} property DOUBLE_ACCOUNTING: JUnderlineStyle read _GetDOUBLE_ACCOUNTING;
    {class} property NORMAL_SCRIPT: JScriptStyle read _GetNORMAL_SCRIPT;
    {class} property SUPERSCRIPT: JScriptStyle read _GetSUPERSCRIPT;
    {class} property SUBSCRIPT: JScriptStyle read _GetSUBSCRIPT;
  end;

  [JavaSignature('jxl/write/Font')]
  JFont_501 = interface(JWritableFont) // or JObject
  ['{10627334-1F29-4A53-AE18-98541C93A662}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFont_501 = class(TJavaGenericImport<JFont_501Class, JFont_501>) end;

  JFormula_502Class = interface(JFormulaRecord_401Class) // or JObjectClass
  ['{687F23B1-B210-4836-AEDA-CA2F781A7194}']
    { static Property Methods }

    { static Methods }
    {class} function init(c: Integer; r: Integer; form: JString): JFormula_502; cdecl; overload;
    {class} function init(c: Integer; r: Integer; form: JString; st: JCellFormat): JFormula_502; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/Formula')]
  JFormula_502 = interface(JFormulaRecord_401) // or JObject
  ['{839ECDDF-99D0-480A-B897-A2E675686D45}']
    { Property Methods }

    { methods }
    function copyTo(col: Integer; row: Integer): JWritableCell; cdecl;

    { Property }
  end;

  TJFormula_502 = class(TJavaGenericImport<JFormula_502Class, JFormula_502>) end;

  JLabelClass = interface(JLabelRecord_418Class) // or JObjectClass
  ['{0CF1AAD7-B102-4AF4-A98C-8C61653FCBA5}']
    { static Property Methods }

    { static Methods }
    {class} function init(c: Integer; r: Integer; cont: JString): JLabel; cdecl; overload;
    {class} function init(c: Integer; r: Integer; cont: JString; st: JCellFormat): JLabel; cdecl; overload;
    {class} function init(lc: JLabelCell): JLabel; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/Label')]
  JLabel = interface(JLabelRecord_418) // or JObject
  ['{9761AE61-CEAF-4164-BEAE-46B44FE701A3}']
    { Property Methods }

    { methods }
    procedure setString(s: JString); cdecl;
    function copyTo(col: Integer; row: Integer): JWritableCell; cdecl;

    { Property }
  end;

  TJLabel = class(TJavaGenericImport<JLabelClass, JLabel>) end;

  JNumberClass = interface(JNumberRecord_431Class) // or JObjectClass
  ['{96C464AF-D2F3-43A7-86DF-A37EA85CBAD4}']
    { static Property Methods }

    { static Methods }
    {class} function init(c: Integer; r: Integer; val: Double): JNumber; cdecl; overload;
    {class} function init(c: Integer; r: Integer; val: Double; P4: JCellFormat): JNumber; cdecl; overload;
    {class} function init(nc: JNumberCell): JNumber; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/Number')]
  JNumber = interface(JNumberRecord_431) // or JObject
  ['{9E4681D4-595E-49A6-8AF1-B86D3480C10A}']
    { Property Methods }

    { methods }
    procedure setValue(val: Double); cdecl;
    function copyTo(col: Integer; row: Integer): JWritableCell; cdecl;

    { Property }
  end;

  TJNumber = class(TJavaGenericImport<JNumberClass, JNumber>) end;

  JNumberFormatClass = interface(JNumberFormatRecordClass) // or JObjectClass
  ['{0BE7A33E-5CA1-443A-B4B5-C839920AFF92}']
    { static Property Methods }
    {class} function _GetCOMPLEX_FORMAT: JNumberFormatRecord_NonValidatingFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCURRENCY_EURO_PREFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCURRENCY_EURO_SUFFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCURRENCY_POUND: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCURRENCY_JAPANESE_YEN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCURRENCY_DOLLAR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRACTION_THREE_DIGITS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRACTION_HALVES: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRACTION_QUARTERS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRACTIONS_EIGHTHS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRACTION_SIXTEENTHS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRACTION_TENTHS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRACTION_HUNDREDTHS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(format: JString): JNumberFormat; cdecl; overload;
    {class} function init(format: JString; dummy: JNumberFormatRecord_NonValidatingFormat): JNumberFormat; cdecl; overload;

    { static Property }
    {class} property COMPLEX_FORMAT: JNumberFormatRecord_NonValidatingFormat read _GetCOMPLEX_FORMAT;
    {class} property CURRENCY_EURO_PREFIX: JString read _GetCURRENCY_EURO_PREFIX;
    {class} property CURRENCY_EURO_SUFFIX: JString read _GetCURRENCY_EURO_SUFFIX;
    {class} property CURRENCY_POUND: JString read _GetCURRENCY_POUND;
    {class} property CURRENCY_JAPANESE_YEN: JString read _GetCURRENCY_JAPANESE_YEN;
    {class} property CURRENCY_DOLLAR: JString read _GetCURRENCY_DOLLAR;
    {class} property FRACTION_THREE_DIGITS: JString read _GetFRACTION_THREE_DIGITS;
    {class} property FRACTION_HALVES: JString read _GetFRACTION_HALVES;
    {class} property FRACTION_QUARTERS: JString read _GetFRACTION_QUARTERS;
    {class} property FRACTIONS_EIGHTHS: JString read _GetFRACTIONS_EIGHTHS;
    {class} property FRACTION_SIXTEENTHS: JString read _GetFRACTION_SIXTEENTHS;
    {class} property FRACTION_TENTHS: JString read _GetFRACTION_TENTHS;
    {class} property FRACTION_HUNDREDTHS: JString read _GetFRACTION_HUNDREDTHS;
  end;

  [JavaSignature('jxl/write/NumberFormat')]
  JNumberFormat = interface(JNumberFormatRecord) // or JObject
  ['{544855CB-6E6E-4A56-9A2F-178DA458676A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNumberFormat = class(TJavaGenericImport<JNumberFormatClass, JNumberFormat>) end;

  JNumberFormats_BuiltInFormatClass = interface(JObjectClass)
  ['{5908D65E-7D9D-4491-A2D6-8FF66F42A9FC}']
    { static Property Methods }

    { static Methods }
    {class} function init(i: Integer; s: JString): JNumberFormats_BuiltInFormat; cdecl;

    { static Property }
  end;

  [JavaSignature('jxl/write/NumberFormats$BuiltInFormat')]
  JNumberFormats_BuiltInFormat = interface(JObject)
  ['{B67C4CB8-7672-407E-AC6D-708D21406024}']
    { Property Methods }

    { methods }
    function getFormatIndex: Integer; cdecl;
    function isInitialized: Boolean; cdecl;
    function isBuiltIn: Boolean; cdecl;
    procedure initialize(pos: Integer); cdecl;
    function getFormatString: JString; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJNumberFormats_BuiltInFormat = class(TJavaGenericImport<JNumberFormats_BuiltInFormatClass, JNumberFormats_BuiltInFormat>) end;

  JNumberFormatsClass = interface(JObjectClass)
  ['{1D2EC831-1479-4B34-BD2A-A12D4CDA4F0E}']
    { static Property Methods }
    {class} function _GetDEFAULT: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTEGER: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFLOAT: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTHOUSANDS_INTEGER: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTHOUSANDS_FLOAT: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACCOUNTING_INTEGER: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACCOUNTING_RED_INTEGER: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACCOUNTING_FLOAT: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACCOUNTING_RED_FLOAT: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPERCENT_INTEGER: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPERCENT_FLOAT: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEXPONENTIAL: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRACTION_ONE_DIGIT: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRACTION_TWO_DIGITS: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT1: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT2: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT3: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT4: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT5: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT6: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT7: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT8: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT9: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFORMAT10: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTEXT: JDisplayFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JNumberFormats; cdecl;

    { static Property }
    {class} property DEFAULT: JDisplayFormat read _GetDEFAULT;
    {class} property INTEGER: JDisplayFormat read _GetINTEGER;
    {class} property FLOAT: JDisplayFormat read _GetFLOAT;
    {class} property THOUSANDS_INTEGER: JDisplayFormat read _GetTHOUSANDS_INTEGER;
    {class} property THOUSANDS_FLOAT: JDisplayFormat read _GetTHOUSANDS_FLOAT;
    {class} property ACCOUNTING_INTEGER: JDisplayFormat read _GetACCOUNTING_INTEGER;
    {class} property ACCOUNTING_RED_INTEGER: JDisplayFormat read _GetACCOUNTING_RED_INTEGER;
    {class} property ACCOUNTING_FLOAT: JDisplayFormat read _GetACCOUNTING_FLOAT;
    {class} property ACCOUNTING_RED_FLOAT: JDisplayFormat read _GetACCOUNTING_RED_FLOAT;
    {class} property PERCENT_INTEGER: JDisplayFormat read _GetPERCENT_INTEGER;
    {class} property PERCENT_FLOAT: JDisplayFormat read _GetPERCENT_FLOAT;
    {class} property EXPONENTIAL: JDisplayFormat read _GetEXPONENTIAL;
    {class} property FRACTION_ONE_DIGIT: JDisplayFormat read _GetFRACTION_ONE_DIGIT;
    {class} property FRACTION_TWO_DIGITS: JDisplayFormat read _GetFRACTION_TWO_DIGITS;
    {class} property FORMAT1: JDisplayFormat read _GetFORMAT1;
    {class} property FORMAT2: JDisplayFormat read _GetFORMAT2;
    {class} property FORMAT3: JDisplayFormat read _GetFORMAT3;
    {class} property FORMAT4: JDisplayFormat read _GetFORMAT4;
    {class} property FORMAT5: JDisplayFormat read _GetFORMAT5;
    {class} property FORMAT6: JDisplayFormat read _GetFORMAT6;
    {class} property FORMAT7: JDisplayFormat read _GetFORMAT7;
    {class} property FORMAT8: JDisplayFormat read _GetFORMAT8;
    {class} property FORMAT9: JDisplayFormat read _GetFORMAT9;
    {class} property FORMAT10: JDisplayFormat read _GetFORMAT10;
    {class} property TEXT: JDisplayFormat read _GetTEXT;
  end;

  [JavaSignature('jxl/write/NumberFormats')]
  JNumberFormats = interface(JObject)
  ['{D64FCD54-076A-4C41-8377-DFFEEFF93027}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNumberFormats = class(TJavaGenericImport<JNumberFormatsClass, JNumberFormats>) end;

  JPattern_508Class = interface(JPatternClass) // or JObjectClass
  ['{C672D7EC-9328-4D53-AE71-DBADC2C5AEAA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/Pattern')]
  JPattern_508 = interface(JPattern) // or JObject
  ['{64E840EB-55EC-4200-89EE-5F4605FB31DA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPattern_508 = class(TJavaGenericImport<JPattern_508Class, JPattern_508>) end;

  JVerticalAlignment_509Class = interface(JVerticalAlignmentClass) // or JObjectClass
  ['{56184259-FF57-42A6-AFB3-663035E66348}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/VerticalAlignment')]
  JVerticalAlignment_509 = interface(JVerticalAlignment) // or JObject
  ['{9CD34BF2-DAA3-4AA8-98F5-2C37A26B44AA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVerticalAlignment_509 = class(TJavaGenericImport<JVerticalAlignment_509Class, JVerticalAlignment_509>) end;

  JWritableCellClass = interface(JObjectClass)
  ['{497223BD-118D-43DF-8FAA-322F0CCF0D8D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/WritableCell')]
  JWritableCell = interface(IJavaInstance)
  ['{72DCCE0C-1C1D-42D2-9AE4-5D4550CFB78B}']
    { Property Methods }

    { methods }
    procedure setCellFormat(P1: JCellFormat); cdecl;
    function copyTo(P1: Integer; P2: Integer): JWritableCell; cdecl;
    function getWritableCellFeatures: JWritableCellFeatures; cdecl;
    procedure setCellFeatures(P1: JWritableCellFeatures); cdecl;

    { Property }
  end;

  TJWritableCell = class(TJavaGenericImport<JWritableCellClass, JWritableCell>) end;

  JWritableCellFeaturesClass = interface(JCellFeaturesClass) // or JObjectClass
  ['{B414C361-1A6C-44F0-B048-409D7D335836}']
    { static Property Methods }
    {class} function _GetBETWEEN: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOT_BETWEEN: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetEQUAL: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNOT_EQUAL: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREATER_THAN: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLESS_THAN: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGREATER_EQUAL: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLESS_EQUAL: JBaseCellFeatures_ValidationCondition;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JWritableCellFeatures; cdecl; overload;
    {class} function init(cf: JCellFeatures): JWritableCellFeatures; cdecl; overload;

    { static Property }
    {class} property BETWEEN: JBaseCellFeatures_ValidationCondition read _GetBETWEEN;
    {class} property NOT_BETWEEN: JBaseCellFeatures_ValidationCondition read _GetNOT_BETWEEN;
    {class} property EQUAL: JBaseCellFeatures_ValidationCondition read _GetEQUAL;
    {class} property NOT_EQUAL: JBaseCellFeatures_ValidationCondition read _GetNOT_EQUAL;
    {class} property GREATER_THAN: JBaseCellFeatures_ValidationCondition read _GetGREATER_THAN;
    {class} property LESS_THAN: JBaseCellFeatures_ValidationCondition read _GetLESS_THAN;
    {class} property GREATER_EQUAL: JBaseCellFeatures_ValidationCondition read _GetGREATER_EQUAL;
    {class} property LESS_EQUAL: JBaseCellFeatures_ValidationCondition read _GetLESS_EQUAL;
  end;

  [JavaSignature('jxl/write/WritableCellFeatures')]
  JWritableCellFeatures = interface(JCellFeatures) // or JObject
  ['{A978B480-7C1C-4990-BE0C-A56C786CC448}']
    { Property Methods }

    { methods }
    procedure setComment(s: JString); cdecl; overload;
    procedure setComment(s: JString; width: Double; P3: Double); cdecl; overload;
    procedure removeComment; cdecl;
    procedure removeDataValidation; cdecl;
    procedure setDataValidationList(c: JCollection); cdecl;
    procedure setDataValidationRange(col1: Integer; row1: Integer; col2: Integer; row2: Integer); cdecl; overload;
    procedure setDataValidationRange(namedRange: JString); cdecl; overload;
    procedure setNumberValidation(val: Double; P2: JBaseCellFeatures_ValidationCondition); cdecl; overload;
    procedure setNumberValidation(val1: Double; P2: Double; val2: JBaseCellFeatures_ValidationCondition); cdecl; overload;

    { Property }
  end;

  TJWritableCellFeatures = class(TJavaGenericImport<JWritableCellFeaturesClass, JWritableCellFeatures>) end;

  JWritableCellFormatClass = interface(JCellXFRecordClass) // or JObjectClass
  ['{6989711A-4F2A-4575-9B38-71C602731BCE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JWritableCellFormat; cdecl; overload;
    {class} function init(font: JWritableFont): JWritableCellFormat; cdecl; overload;
    {class} function init(format: JDisplayFormat): JWritableCellFormat; cdecl; overload;
    {class} function init(font: JWritableFont; format: JDisplayFormat): JWritableCellFormat; cdecl; overload;
    {class} function init(format: JCellFormat): JWritableCellFormat; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/WritableCellFormat')]
  JWritableCellFormat = interface(JCellXFRecord) // or JObject
  ['{9C6FCAFF-948B-4A47-BF3D-187F3D875B7E}']
    { Property Methods }

    { methods }
    procedure setAlignment(a: JAlignment); cdecl;
    procedure setVerticalAlignment(va: JVerticalAlignment); cdecl;
    procedure setOrientation(o: JOrientation); cdecl;
    procedure setWrap(w: Boolean); cdecl;
    procedure setBorder(b: JBorder; ls: JBorderLineStyle); cdecl; overload;
    procedure setBorder(b: JBorder; ls: JBorderLineStyle; c: JColour); cdecl; overload;
    procedure setBackground(c: JColour); cdecl; overload;
    procedure setBackground(c: JColour; p: JPattern); cdecl; overload;
    procedure setShrinkToFit(s: Boolean); cdecl;
    procedure setIndentation(i: Integer); cdecl;
    procedure setLocked(l: Boolean); cdecl;

    { Property }
  end;

  TJWritableCellFormat = class(TJavaGenericImport<JWritableCellFormatClass, JWritableCellFormat>) end;

  JWritableFont_BoldStyleClass = interface(JObjectClass)
  ['{4D5C0128-E44F-448A-A27B-2BBB040D20E6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/WritableFont$BoldStyle')]
  JWritableFont_BoldStyle = interface(JObject)
  ['{3C314DBC-5063-4F53-834D-2961D6DE9465}']
    { Property Methods }
    function _Getvalue: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setvalue(avalue: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property value: Integer read _Getvalue write _Setvalue;
  end;

  TJWritableFont_BoldStyle = class(TJavaGenericImport<JWritableFont_BoldStyleClass, JWritableFont_BoldStyle>) end;

  JWritableFont_FontNameClass = interface(JObjectClass)
  ['{205788A3-717A-4B0D-8C4E-D4052870D7BB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/WritableFont$FontName')]
  JWritableFont_FontName = interface(JObject)
  ['{5E308C7B-5D3A-4B94-BEF4-218C90DABD72}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWritableFont_FontName = class(TJavaGenericImport<JWritableFont_FontNameClass, JWritableFont_FontName>) end;

  JWritableFontClass = interface(JWritableFontRecordClass) // or JObjectClass
  ['{CCB139BD-A4D6-400D-B401-3C127338BDDB}']
    { static Property Methods }
    {class} function _GetARIAL: JWritableFont_FontName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTIMES: JWritableFont_FontName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOURIER: JWritableFont_FontName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAHOMA: JWritableFont_FontName;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNO_BOLD: JWritableFont_BoldStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOLD: JWritableFont_BoldStyle;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT_POINT_SIZE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(fn: JWritableFont_FontName): JWritableFont; cdecl; overload;
    {class} function init(f: JFont): JWritableFont; cdecl; overload;
    {class} function init(fn: JWritableFont_FontName; ps: Integer): JWritableFont; cdecl; overload;
    {class} function init(fn: JWritableFont_FontName; ps: Integer; bs: JWritableFont_BoldStyle): JWritableFont; cdecl; overload;
    {class} function init(fn: JWritableFont_FontName; ps: Integer; bs: JWritableFont_BoldStyle; italic: Boolean): JWritableFont; cdecl; overload;
    {class} function init(fn: JWritableFont_FontName; ps: Integer; bs: JWritableFont_BoldStyle; it: Boolean; us: JUnderlineStyle): JWritableFont; cdecl; overload;
    {class} function init(fn: JWritableFont_FontName; ps: Integer; bs: JWritableFont_BoldStyle; it: Boolean; us: JUnderlineStyle; c: JColour): JWritableFont; cdecl; overload;
    {class} function init(fn: JWritableFont_FontName; ps: Integer; bs: JWritableFont_BoldStyle; it: Boolean; us: JUnderlineStyle; c: JColour; ss: JScriptStyle): JWritableFont; cdecl; overload;
    {class} function createFont(fontName: JString): JWritableFont_FontName; cdecl;

    { static Property }
    {class} property ARIAL: JWritableFont_FontName read _GetARIAL;
    {class} property TIMES: JWritableFont_FontName read _GetTIMES;
    {class} property COURIER: JWritableFont_FontName read _GetCOURIER;
    {class} property TAHOMA: JWritableFont_FontName read _GetTAHOMA;
    {class} property NO_BOLD: JWritableFont_BoldStyle read _GetNO_BOLD;
    {class} property BOLD: JWritableFont_BoldStyle read _GetBOLD;
    {class} property DEFAULT_POINT_SIZE: Integer read _GetDEFAULT_POINT_SIZE;
  end;

  [JavaSignature('jxl/write/WritableFont')]
  JWritableFont = interface(JWritableFontRecord) // or JObject
  ['{81D7D9AC-3373-4C71-9062-9894EB1BBB04}']
    { Property Methods }

    { methods }
    procedure setPointSize(pointSize: Integer); cdecl;
    procedure setBoldStyle(boldStyle: JWritableFont_BoldStyle); cdecl;
    procedure setItalic(italic: Boolean); cdecl;
    procedure setUnderlineStyle(us: JUnderlineStyle); cdecl;
    procedure setColour(colour: JColour); cdecl;
    procedure setScriptStyle(scriptStyle: JScriptStyle); cdecl;
    function isStruckout: Boolean; cdecl;
    procedure setStruckout(struckout: Boolean); cdecl;

    { Property }
  end;

  TJWritableFont = class(TJavaGenericImport<JWritableFontClass, JWritableFont>) end;

  JWritableHyperlinkClass = interface(JHyperlinkRecord_411Class) // or JObjectClass
  ['{053B5A85-2FD2-4C12-9B3D-FE3905C132F6}']
    { static Property Methods }

    { static Methods }
    {class} function init(h: JHyperlink; ws: JWritableSheet): JWritableHyperlink; cdecl; overload;
    {class} function init(col: Integer; row: Integer; url: JURL): JWritableHyperlink; cdecl; overload;
    {class} function init(col: Integer; row: Integer; lastcol: Integer; lastrow: Integer; url: JURL): JWritableHyperlink; cdecl; overload;
    {class} function init(col: Integer; row: Integer; lastcol: Integer; lastrow: Integer; url: JURL; desc: JString): JWritableHyperlink; cdecl; overload;
    {class} function init(col: Integer; row: Integer; afile: JFile): JWritableHyperlink; cdecl; overload;
    {class} function init(col: Integer; row: Integer; afile: JFile; desc: JString): JWritableHyperlink; cdecl; overload;
    {class} function init(col: Integer; row: Integer; lastcol: Integer; lastrow: Integer; afile: JFile): JWritableHyperlink; cdecl; overload;
    {class} function init(col: Integer; row: Integer; lastcol: Integer; lastrow: Integer; afile: JFile; desc: JString): JWritableHyperlink; cdecl; overload;
    {class} function init(col: Integer; row: Integer; desc: JString; sheet: JWritableSheet; destcol: Integer; destrow: Integer): JWritableHyperlink; cdecl; overload;
    {class} function init(col: Integer; row: Integer; lastcol: Integer; lastrow: Integer; desc: JString; sheet: JWritableSheet; destcol: Integer; destrow: Integer; lastdestcol: Integer; lastdestrow: Integer): JWritableHyperlink; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('jxl/write/WritableHyperlink')]
  JWritableHyperlink = interface(JHyperlinkRecord_411) // or JObject
  ['{94BA2E00-610B-431F-90A2-EE63F05AB3DA}']
    { Property Methods }

    { methods }
    procedure setURL(url: JURL); cdecl;
    procedure setFile(afile: JFile); cdecl;
    procedure setDescription(desc: JString); cdecl;
    procedure setLocation(desc: JString; sheet: JWritableSheet; destcol: Integer; destrow: Integer; lastdestcol: Integer; lastdestrow: Integer); cdecl;

    { Property }
  end;

  TJWritableHyperlink = class(TJavaGenericImport<JWritableHyperlinkClass, JWritableHyperlink>) end;

  JWritableImageClass = interface(JDrawingClass) // or JObjectClass
  ['{CB0D7C19-4B03-41D7-A420-E0D9116E9C62}']
    { static Property Methods }
    {class} function _GetMOVE_AND_SIZE_WITH_CELLS: JDrawing_ImageAnchorProperties;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMOVE_WITH_CELLS: JDrawing_ImageAnchorProperties;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNO_MOVE_OR_SIZE_WITH_CELLS: JDrawing_ImageAnchorProperties;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(x: Double; P2: Double; y: Double; width: Double; P5: JFile): JWritableImage; cdecl; overload;
    {class} function init(x: Double; P2: Double; y: Double; width: Double; P5: TJavaArray<Byte>): JWritableImage; cdecl; overload;
    {class} function init(d: JDrawingGroupObject; dg: JDrawingGroup): JWritableImage; cdecl; overload;

    { static Property }
    {class} property MOVE_AND_SIZE_WITH_CELLS: JDrawing_ImageAnchorProperties read _GetMOVE_AND_SIZE_WITH_CELLS;
    {class} property MOVE_WITH_CELLS: JDrawing_ImageAnchorProperties read _GetMOVE_WITH_CELLS;
    {class} property NO_MOVE_OR_SIZE_WITH_CELLS: JDrawing_ImageAnchorProperties read _GetNO_MOVE_OR_SIZE_WITH_CELLS;
  end;

  [JavaSignature('jxl/write/WritableImage')]
  JWritableImage = interface(JDrawing) // or JObject
  ['{C95B8C5C-C537-4CFB-BC80-68BFB4674192}']
    { Property Methods }

    { methods }
    function getColumn: Double; cdecl;
    procedure setColumn(c: Double); cdecl;
    function getRow: Double; cdecl;
    procedure setRow(c: Double); cdecl;
    function getWidth: Double; cdecl;
    procedure setWidth(c: Double); cdecl;
    function getHeight: Double; cdecl;
    procedure setHeight(c: Double); cdecl;
    function getImageFile: JFile; cdecl;
    function getImageData: TJavaArray<Byte>; cdecl;
    procedure setImageAnchor(iap: JDrawing_ImageAnchorProperties); cdecl;
    function getImageAnchor: JDrawing_ImageAnchorProperties; cdecl;

    { Property }
  end;

  TJWritableImage = class(TJavaGenericImport<JWritableImageClass, JWritableImage>) end;

  JWritableSheetClass = interface(JObjectClass)
  ['{0384DF6D-8312-4202-916A-956ACAAED92C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/WritableSheet')]
  JWritableSheet = interface(IJavaInstance)
  ['{117113D5-92BC-4C93-B737-73D79ED50794}']
    { Property Methods }

    { methods }
    procedure addCell(P1: JWritableCell); cdecl;
    procedure setName(P1: JString); cdecl;
    procedure setHidden(P1: Boolean); cdecl; //Deprecated
    procedure setProtected(P1: Boolean); cdecl; //Deprecated
    procedure setColumnView(P1: Integer; P2: Integer); cdecl; overload;
    procedure setColumnView(P1: Integer; P2: Integer; P3: JCellFormat); cdecl; overload; //Deprecated
    procedure setColumnView(P1: Integer; P2: JCellView); cdecl; overload;
    procedure setRowView(P1: Integer; P2: Integer); cdecl; overload;
    procedure setRowView(P1: Integer; P2: Boolean); cdecl; overload;
    procedure setRowView(P1: Integer; P2: Integer; P3: Boolean); cdecl; overload;
    procedure setRowView(P1: Integer; P2: JCellView); cdecl; overload;
    function getWritableCell(P1: Integer; P2: Integer): JWritableCell; cdecl; overload;
    function getWritableCell(P1: JString): JWritableCell; cdecl; overload;
    function getWritableHyperlinks: TJavaObjectArray<JWritableHyperlink>; cdecl;
    procedure insertRow(P1: Integer); cdecl;
    procedure insertColumn(P1: Integer); cdecl;
    procedure removeColumn(P1: Integer); cdecl;
    procedure removeRow(P1: Integer); cdecl;
    function mergeCells(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JRange; cdecl;
    procedure setRowGroup(P1: Integer; P2: Integer; P3: Boolean); cdecl;
    procedure unsetRowGroup(P1: Integer; P2: Integer); cdecl;
    procedure setColumnGroup(P1: Integer; P2: Integer; P3: Boolean); cdecl;
    procedure unsetColumnGroup(P1: Integer; P2: Integer); cdecl;
    procedure unmergeCells(P1: JRange); cdecl;
    procedure addHyperlink(P1: JWritableHyperlink); cdecl;
    procedure removeHyperlink(P1: JWritableHyperlink); cdecl; overload;
    procedure removeHyperlink(P1: JWritableHyperlink; P2: Boolean); cdecl; overload;
    procedure setHeader(P1: JString; P2: JString; P3: JString); cdecl; //Deprecated
    procedure setFooter(P1: JString; P2: JString; P3: JString); cdecl; //Deprecated
    procedure setPageSetup(P1: JPageOrientation); cdecl; overload;
    procedure setPageSetup(P1: JPageOrientation; P2: Double; P3: Double); cdecl; overload;
    procedure setPageSetup(P1: JPageOrientation; P2: JPaperSize; P3: Double; P4: Double); cdecl; overload;
    procedure addRowPageBreak(P1: Integer); cdecl;
    procedure addColumnPageBreak(P1: Integer); cdecl;
    procedure addImage(P1: JWritableImage); cdecl;
    function getNumberOfImages: Integer; cdecl;
    function getImage(P1: Integer): JWritableImage; cdecl;
    procedure removeImage(P1: JWritableImage); cdecl;

    { Property }
  end;

  TJWritableSheet = class(TJavaGenericImport<JWritableSheetClass, JWritableSheet>) end;

  JWritableWorkbookClass = interface(JObjectClass)
  ['{85F9725A-081E-4D7C-BE2A-C4F61E5F4B89}']
    { static Property Methods }
    {class} function _GetARIAL_10_PT: JWritableFont;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHYPERLINK_FONT: JWritableFont;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNORMAL_STYLE: JWritableCellFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHYPERLINK_STYLE: JWritableCellFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHIDDEN_STYLE: JWritableCellFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property ARIAL_10_PT: JWritableFont read _GetARIAL_10_PT;
    {class} property HYPERLINK_FONT: JWritableFont read _GetHYPERLINK_FONT;
    {class} property NORMAL_STYLE: JWritableCellFormat read _GetNORMAL_STYLE;
    {class} property HYPERLINK_STYLE: JWritableCellFormat read _GetHYPERLINK_STYLE;
    {class} property HIDDEN_STYLE: JWritableCellFormat read _GetHIDDEN_STYLE;
  end;

  [JavaSignature('jxl/write/WritableWorkbook')]
  JWritableWorkbook = interface(JObject)
  ['{13134679-7209-44FE-B77C-066003F468C3}']
    { Property Methods }

    { methods }
    function getSheets: TJavaObjectArray<JWritableSheet>; cdecl;
    function getSheetNames: TJavaObjectArray<JString>; cdecl;
    function getSheet(P1: Integer): JWritableSheet; cdecl; overload;
    function getSheet(P1: JString): JWritableSheet; cdecl; overload;
    function getWritableCell(P1: JString): JWritableCell; cdecl;
    function getNumberOfSheets: Integer; cdecl;
    procedure close; cdecl;
    function createSheet(P1: JString; P2: Integer): JWritableSheet; cdecl;
    function importSheet(P1: JString; P2: Integer; P3: JSheet): JWritableSheet; cdecl;
    procedure copySheet(P1: Integer; P2: JString; P3: Integer); cdecl; overload;
    procedure copySheet(P1: JString; P2: JString; P3: Integer); cdecl; overload;
    procedure removeSheet(P1: Integer); cdecl;
    function moveSheet(P1: Integer; P2: Integer): JWritableSheet; cdecl;
    procedure write; cdecl;
    procedure setProtected(P1: Boolean); cdecl;
    procedure setColourRGB(P1: JColour; P2: Integer; P3: Integer; P4: Integer); cdecl;
    procedure copy(w: JWorkbook); cdecl; //Deprecated
    function findCellByName(P1: JString): JWritableCell; cdecl;
    function findByName(P1: JString): TJavaObjectArray<JRange>; cdecl;
    function getRangeNames: TJavaObjectArray<JString>; cdecl;
    procedure removeRangeName(P1: JString); cdecl;
    procedure addNameArea(P1: JString; P2: JWritableSheet; P3: Integer; P4: Integer; P5: Integer; P6: Integer); cdecl;
    procedure setOutputFile(P1: JFile); cdecl;

    { Property }
  end;

  TJWritableWorkbook = class(TJavaGenericImport<JWritableWorkbookClass, JWritableWorkbook>) end;

  JWriteExceptionClass = interface(JJXLExceptionClass) // or JObjectClass
  ['{B32D1B82-5834-4121-A04C-21885266D44F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('jxl/write/WriteException')]
  JWriteException = interface(JJXLException) // or JObject
  ['{40981B21-1640-46EE-AFDD-7073531F1941}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWriteException = class(TJavaGenericImport<JWriteExceptionClass, JWriteException>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JAssert', 
    TypeInfo(Androidapi.JNI.jxl.JAssert));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JAssertionFailed', 
    TypeInfo(Androidapi.JNI.jxl.JAssertionFailed));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBaseUnit', 
    TypeInfo(Androidapi.JNI.jxl.JBaseUnit));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLengthConverter', 
    TypeInfo(Androidapi.JNI.jxl.JLengthConverter));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLengthUnit', 
    TypeInfo(Androidapi.JNI.jxl.JLengthUnit));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLoggerName', 
    TypeInfo(Androidapi.JNI.jxl.JLoggerName));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSimpleLogger', 
    TypeInfo(Androidapi.JNI.jxl.JSimpleLogger));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLogger', 
    TypeInfo(Androidapi.JNI.jxl.JLogger));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JAutoFilter', 
    TypeInfo(Androidapi.JNI.jxl.JAutoFilter));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JAutoFilterInfoRecord', 
    TypeInfo(Androidapi.JNI.jxl.JAutoFilterInfoRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JAutoFilterRecord', 
    TypeInfo(Androidapi.JNI.jxl.JAutoFilterRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBaseCellFeatures_ValidationCondition', 
    TypeInfo(Androidapi.JNI.jxl.JBaseCellFeatures_ValidationCondition));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBaseCellFeatures', 
    TypeInfo(Androidapi.JNI.jxl.JBaseCellFeatures));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBaseCompoundFile_PropertyStorage', 
    TypeInfo(Androidapi.JNI.jxl.JBaseCompoundFile_PropertyStorage));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBaseCompoundFile', 
    TypeInfo(Androidapi.JNI.jxl.JBaseCompoundFile));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBuiltInFormat', 
    TypeInfo(Androidapi.JNI.jxl.JBuiltInFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBuiltInName', 
    TypeInfo(Androidapi.JNI.jxl.JBuiltInName));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBuiltInStyle', 
    TypeInfo(Androidapi.JNI.jxl.JBuiltInStyle));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JByteArray', 
    TypeInfo(Androidapi.JNI.jxl.JByteArray));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JByteData', 
    TypeInfo(Androidapi.JNI.jxl.JByteData));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellReferenceHelper', 
    TypeInfo(Androidapi.JNI.jxl.JCellReferenceHelper));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JConditionalFormat', 
    TypeInfo(Androidapi.JNI.jxl.JConditionalFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JConditionalFormatRangeRecord_Range', 
    TypeInfo(Androidapi.JNI.jxl.JConditionalFormatRangeRecord_Range));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JConditionalFormatRangeRecord', 
    TypeInfo(Androidapi.JNI.jxl.JConditionalFormatRangeRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JConditionalFormatRecord', 
    TypeInfo(Androidapi.JNI.jxl.JConditionalFormatRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JContinueRecord', 
    TypeInfo(Androidapi.JNI.jxl.JContinueRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCountryCode', 
    TypeInfo(Androidapi.JNI.jxl.JCountryCode));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDataValidation', 
    TypeInfo(Androidapi.JNI.jxl.JDataValidation));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDataValidityListRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDataValidityListRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDataValiditySettingsRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDataValiditySettingsRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDisplayFormat', 
    TypeInfo(Androidapi.JNI.jxl.JDisplayFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDoubleHelper', 
    TypeInfo(Androidapi.JNI.jxl.JDoubleHelper));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBlipStoreEntry', 
    TypeInfo(Androidapi.JNI.jxl.JBlipStoreEntry));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBlipType', 
    TypeInfo(Androidapi.JNI.jxl.JBlipType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBStoreContainer', 
    TypeInfo(Androidapi.JNI.jxl.JBStoreContainer));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JButton', 
    TypeInfo(Androidapi.JNI.jxl.JButton));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JChart', 
    TypeInfo(Androidapi.JNI.jxl.JChart));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JChunk', 
    TypeInfo(Androidapi.JNI.jxl.JChunk));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JChunkType', 
    TypeInfo(Androidapi.JNI.jxl.JChunkType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JClientAnchor', 
    TypeInfo(Androidapi.JNI.jxl.JClientAnchor));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JClientData', 
    TypeInfo(Androidapi.JNI.jxl.JClientData));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JClientTextBox', 
    TypeInfo(Androidapi.JNI.jxl.JClientTextBox));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JComboBox', 
    TypeInfo(Androidapi.JNI.jxl.JComboBox));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JComment', 
    TypeInfo(Androidapi.JNI.jxl.JComment));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDg', 
    TypeInfo(Androidapi.JNI.jxl.JDg));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDgContainer', 
    TypeInfo(Androidapi.JNI.jxl.JDgContainer));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDgg_Cluster', 
    TypeInfo(Androidapi.JNI.jxl.JDgg_Cluster));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDgg', 
    TypeInfo(Androidapi.JNI.jxl.JDgg));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDggContainer', 
    TypeInfo(Androidapi.JNI.jxl.JDggContainer));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDrawing_ImageAnchorProperties', 
    TypeInfo(Androidapi.JNI.jxl.JDrawing_ImageAnchorProperties));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDrawing', 
    TypeInfo(Androidapi.JNI.jxl.JDrawing));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDrawing2', 
    TypeInfo(Androidapi.JNI.jxl.JDrawing2));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDrawingData', 
    TypeInfo(Androidapi.JNI.jxl.JDrawingData));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDrawingDataException', 
    TypeInfo(Androidapi.JNI.jxl.JDrawingDataException));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDrawingGroup', 
    TypeInfo(Androidapi.JNI.jxl.JDrawingGroup));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDrawingGroupObject', 
    TypeInfo(Androidapi.JNI.jxl.JDrawingGroupObject));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEscherAtom', 
    TypeInfo(Androidapi.JNI.jxl.JEscherAtom));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEscherContainer', 
    TypeInfo(Androidapi.JNI.jxl.JEscherContainer));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEscherDisplay', 
    TypeInfo(Androidapi.JNI.jxl.JEscherDisplay));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEscherRecord', 
    TypeInfo(Androidapi.JNI.jxl.JEscherRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEscherRecordData', 
    TypeInfo(Androidapi.JNI.jxl.JEscherRecordData));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEscherRecordType', 
    TypeInfo(Androidapi.JNI.jxl.JEscherRecordType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEscherStream', 
    TypeInfo(Androidapi.JNI.jxl.JEscherStream));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMsoDrawingGroupRecord', 
    TypeInfo(Androidapi.JNI.jxl.JMsoDrawingGroupRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMsoDrawingRecord', 
    TypeInfo(Androidapi.JNI.jxl.JMsoDrawingRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNoteRecord', 
    TypeInfo(Androidapi.JNI.jxl.JNoteRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JObjRecord_ObjType', 
    TypeInfo(Androidapi.JNI.jxl.JObjRecord_ObjType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JObjRecord', 
    TypeInfo(Androidapi.JNI.jxl.JObjRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JOpt_Property', 
    TypeInfo(Androidapi.JNI.jxl.JOpt_Property));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JOpt', 
    TypeInfo(Androidapi.JNI.jxl.JOpt));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JOrigin', 
    TypeInfo(Androidapi.JNI.jxl.JOrigin));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPNGReader', 
    TypeInfo(Androidapi.JNI.jxl.JPNGReader));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JShapeType', 
    TypeInfo(Androidapi.JNI.jxl.JShapeType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSheetDrawingWriter', 
    TypeInfo(Androidapi.JNI.jxl.JSheetDrawingWriter));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSp', 
    TypeInfo(Androidapi.JNI.jxl.JSp));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSpContainer', 
    TypeInfo(Androidapi.JNI.jxl.JSpContainer));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSpgr', 
    TypeInfo(Androidapi.JNI.jxl.JSpgr));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSpgrContainer', 
    TypeInfo(Androidapi.JNI.jxl.JSpgrContainer));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSplitMenuColors', 
    TypeInfo(Androidapi.JNI.jxl.JSplitMenuColors));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JTextObjectRecord', 
    TypeInfo(Androidapi.JNI.jxl.JTextObjectRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDValParser', 
    TypeInfo(Androidapi.JNI.jxl.JDValParser));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDVParser_Condition', 
    TypeInfo(Androidapi.JNI.jxl.JDVParser_Condition));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDVParser_DVType', 
    TypeInfo(Androidapi.JNI.jxl.JDVParser_DVType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDVParser_ErrorStyle', 
    TypeInfo(Androidapi.JNI.jxl.JDVParser_ErrorStyle));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDVParser', 
    TypeInfo(Androidapi.JNI.jxl.JDVParser));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEmptyCell', 
    TypeInfo(Androidapi.JNI.jxl.JEmptyCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEncodedURLHelper', 
    TypeInfo(Androidapi.JNI.jxl.JEncodedURLHelper));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFilterModeRecord', 
    TypeInfo(Androidapi.JNI.jxl.JFilterModeRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFontRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JFontRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFontRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JFontRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFontRecord', 
    TypeInfo(Androidapi.JNI.jxl.JFontRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFonts', 
    TypeInfo(Androidapi.JNI.jxl.JFonts));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormatRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JFormatRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormatRecord_BiffType', 
    TypeInfo(Androidapi.JNI.jxl.JFormatRecord_BiffType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormatRecord', 
    TypeInfo(Androidapi.JNI.jxl.JFormatRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormattingRecords', 
    TypeInfo(Androidapi.JNI.jxl.JFormattingRecords));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JAdd', 
    TypeInfo(Androidapi.JNI.jxl.JAdd));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JArea', 
    TypeInfo(Androidapi.JNI.jxl.JArea));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JArea3d', 
    TypeInfo(Androidapi.JNI.jxl.JArea3d));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JArgumentSeparator', 
    TypeInfo(Androidapi.JNI.jxl.JArgumentSeparator));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JAttribute', 
    TypeInfo(Androidapi.JNI.jxl.JAttribute));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBinaryOperator', 
    TypeInfo(Androidapi.JNI.jxl.JBinaryOperator));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBooleanValue', 
    TypeInfo(Androidapi.JNI.jxl.JBooleanValue));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBuiltInFunction', 
    TypeInfo(Androidapi.JNI.jxl.JBuiltInFunction));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellReference', 
    TypeInfo(Androidapi.JNI.jxl.JCellReference));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellReference3d', 
    TypeInfo(Androidapi.JNI.jxl.JCellReference3d));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellReferenceError', 
    TypeInfo(Androidapi.JNI.jxl.JCellReferenceError));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCloseParentheses', 
    TypeInfo(Androidapi.JNI.jxl.JCloseParentheses));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JColumnRange', 
    TypeInfo(Androidapi.JNI.jxl.JColumnRange));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JColumnRange3d', 
    TypeInfo(Androidapi.JNI.jxl.JColumnRange3d));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JConcatenate', 
    TypeInfo(Androidapi.JNI.jxl.JConcatenate));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDivide', 
    TypeInfo(Androidapi.JNI.jxl.JDivide));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDoubleValue', 
    TypeInfo(Androidapi.JNI.jxl.JDoubleValue));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEqual', 
    TypeInfo(Androidapi.JNI.jxl.JEqual));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JErrorConstant', 
    TypeInfo(Androidapi.JNI.jxl.JErrorConstant));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExternalSheet', 
    TypeInfo(Androidapi.JNI.jxl.JExternalSheet));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulaErrorCode', 
    TypeInfo(Androidapi.JNI.jxl.JFormulaErrorCode));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulaException_FormulaMessage', 
    TypeInfo(Androidapi.JNI.jxl.JFormulaException_FormulaMessage));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulaException', 
    TypeInfo(Androidapi.JNI.jxl.JFormulaException));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulaParser', 
    TypeInfo(Androidapi.JNI.jxl.JFormulaParser));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFunction', 
    TypeInfo(Androidapi.JNI.jxl.JFunction));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFunctionNames', 
    TypeInfo(Androidapi.JNI.jxl.JFunctionNames));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JGreaterEqual', 
    TypeInfo(Androidapi.JNI.jxl.JGreaterEqual));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JGreaterThan', 
    TypeInfo(Androidapi.JNI.jxl.JGreaterThan));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JIntegerValue', 
    TypeInfo(Androidapi.JNI.jxl.JIntegerValue));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLessEqual', 
    TypeInfo(Androidapi.JNI.jxl.JLessEqual));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLessThan', 
    TypeInfo(Androidapi.JNI.jxl.JLessThan));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMemArea', 
    TypeInfo(Androidapi.JNI.jxl.JMemArea));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMemFunc', 
    TypeInfo(Androidapi.JNI.jxl.JMemFunc));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMinus', 
    TypeInfo(Androidapi.JNI.jxl.JMinus));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMissingArg', 
    TypeInfo(Androidapi.JNI.jxl.JMissingArg));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMultiply', 
    TypeInfo(Androidapi.JNI.jxl.JMultiply));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JName', 
    TypeInfo(Androidapi.JNI.jxl.JName));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNameRange', 
    TypeInfo(Androidapi.JNI.jxl.JNameRange));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNotEqual', 
    TypeInfo(Androidapi.JNI.jxl.JNotEqual));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberValue', 
    TypeInfo(Androidapi.JNI.jxl.JNumberValue));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JOpenParentheses', 
    TypeInfo(Androidapi.JNI.jxl.JOpenParentheses));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JOperand', 
    TypeInfo(Androidapi.JNI.jxl.JOperand));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JOperator', 
    TypeInfo(Androidapi.JNI.jxl.JOperator));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JParenthesis', 
    TypeInfo(Androidapi.JNI.jxl.JParenthesis));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JParsedThing', 
    TypeInfo(Androidapi.JNI.jxl.JParsedThing));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JParseItem', 
    TypeInfo(Androidapi.JNI.jxl.JParseItem));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JParser', 
    TypeInfo(Androidapi.JNI.jxl.JParser));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPercent', 
    TypeInfo(Androidapi.JNI.jxl.JPercent));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPlus', 
    TypeInfo(Androidapi.JNI.jxl.JPlus));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPower', 
    TypeInfo(Androidapi.JNI.jxl.JPower));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRangeSeparator', 
    TypeInfo(Androidapi.JNI.jxl.JRangeSeparator));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedFormulaArea', 
    TypeInfo(Androidapi.JNI.jxl.JSharedFormulaArea));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedFormulaCellReference', 
    TypeInfo(Androidapi.JNI.jxl.JSharedFormulaCellReference));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStringFormulaParser', 
    TypeInfo(Androidapi.JNI.jxl.JStringFormulaParser));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStringFunction', 
    TypeInfo(Androidapi.JNI.jxl.JStringFunction));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStringOperator', 
    TypeInfo(Androidapi.JNI.jxl.JStringOperator));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStringParseItem', 
    TypeInfo(Androidapi.JNI.jxl.JStringParseItem));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStringValue', 
    TypeInfo(Androidapi.JNI.jxl.JStringValue));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSubExpression', 
    TypeInfo(Androidapi.JNI.jxl.JSubExpression));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSubtract', 
    TypeInfo(Androidapi.JNI.jxl.JSubtract));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JToken', 
    TypeInfo(Androidapi.JNI.jxl.JToken));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JTokenFormulaParser', 
    TypeInfo(Androidapi.JNI.jxl.JTokenFormulaParser));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JUnaryMinus', 
    TypeInfo(Androidapi.JNI.jxl.JUnaryMinus));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JUnaryOperator', 
    TypeInfo(Androidapi.JNI.jxl.JUnaryOperator));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JUnaryPlus', 
    TypeInfo(Androidapi.JNI.jxl.JUnaryPlus));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JUnion', 
    TypeInfo(Androidapi.JNI.jxl.JUnion));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JVariableArgFunction', 
    TypeInfo(Androidapi.JNI.jxl.JVariableArgFunction));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JYylex', 
    TypeInfo(Androidapi.JNI.jxl.JYylex));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulaData', 
    TypeInfo(Androidapi.JNI.jxl.JFormulaData));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHeaderFooter_Contents', 
    TypeInfo(Androidapi.JNI.jxl.JHeaderFooter_Contents));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHeaderFooter', 
    TypeInfo(Androidapi.JNI.jxl.JHeaderFooter));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JIndexMapping', 
    TypeInfo(Androidapi.JNI.jxl.JIndexMapping));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JIntegerHelper', 
    TypeInfo(Androidapi.JNI.jxl.JIntegerHelper));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumFormatRecordsException', 
    TypeInfo(Androidapi.JNI.jxl.JNumFormatRecordsException));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPaletteRecord', 
    TypeInfo(Androidapi.JNI.jxl.JPaletteRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRangeImpl', 
    TypeInfo(Androidapi.JNI.jxl.JRangeImpl));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRecordData', 
    TypeInfo(Androidapi.JNI.jxl.JRecordData));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSheetRangeImpl', 
    TypeInfo(Androidapi.JNI.jxl.JSheetRangeImpl));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStringHelper', 
    TypeInfo(Androidapi.JNI.jxl.JStringHelper));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JType_1', 
    TypeInfo(Androidapi.JNI.jxl.JType_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JType_ArbitraryType', 
    TypeInfo(Androidapi.JNI.jxl.JType_ArbitraryType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JType', 
    TypeInfo(Androidapi.JNI.jxl.JType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWorkbookMethods', 
    TypeInfo(Androidapi.JNI.jxl.JWorkbookMethods));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWorkspaceInformationRecord', 
    TypeInfo(Androidapi.JNI.jxl.JWorkspaceInformationRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableRecordData', 
    TypeInfo(Androidapi.JNI.jxl.JWritableRecordData));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JXFRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JXFRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JXFRecord_BiffType', 
    TypeInfo(Androidapi.JNI.jxl.JXFRecord_BiffType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JXFRecord_XFType', 
    TypeInfo(Androidapi.JNI.jxl.JXFRecord_XFType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JXFRecord', 
    TypeInfo(Androidapi.JNI.jxl.JXFRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBooleanCell', 
    TypeInfo(Androidapi.JNI.jxl.JBooleanCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBooleanFormulaCell', 
    TypeInfo(Androidapi.JNI.jxl.JBooleanFormulaCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCell', 
    TypeInfo(Androidapi.JNI.jxl.JCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellFeatures', 
    TypeInfo(Androidapi.JNI.jxl.JCellFeatures));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellFormat', 
    TypeInfo(Androidapi.JNI.jxl.JCellFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellReferenceHelper_190', 
    TypeInfo(Androidapi.JNI.jxl.JCellReferenceHelper_190));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellType', 
    TypeInfo(Androidapi.JNI.jxl.JCellType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellView', 
    TypeInfo(Androidapi.JNI.jxl.JCellView));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateCell', 
    TypeInfo(Androidapi.JNI.jxl.JDateCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateFormulaCell', 
    TypeInfo(Androidapi.JNI.jxl.JDateFormulaCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBiffDump', 
    TypeInfo(Androidapi.JNI.jxl.JBiffDump));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCSV', 
    TypeInfo(Androidapi.JNI.jxl.JCSV));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDemo', 
    TypeInfo(Androidapi.JNI.jxl.JDemo));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEscher', 
    TypeInfo(Androidapi.JNI.jxl.JEscher));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEscherDrawingGroup', 
    TypeInfo(Androidapi.JNI.jxl.JEscherDrawingGroup));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFeatures', 
    TypeInfo(Androidapi.JNI.jxl.JFeatures));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulas', 
    TypeInfo(Androidapi.JNI.jxl.JFormulas));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPropertySetsReader', 
    TypeInfo(Androidapi.JNI.jxl.JPropertySetsReader));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JReadWrite', 
    TypeInfo(Androidapi.JNI.jxl.JReadWrite));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWrite', 
    TypeInfo(Androidapi.JNI.jxl.JWrite));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWriteAccess', 
    TypeInfo(Androidapi.JNI.jxl.JWriteAccess));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JXML', 
    TypeInfo(Androidapi.JNI.jxl.JXML));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JErrorCell', 
    TypeInfo(Androidapi.JNI.jxl.JErrorCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JErrorFormulaCell', 
    TypeInfo(Androidapi.JNI.jxl.JErrorFormulaCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JAlignment', 
    TypeInfo(Androidapi.JNI.jxl.JAlignment));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBoldStyle', 
    TypeInfo(Androidapi.JNI.jxl.JBoldStyle));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBorder', 
    TypeInfo(Androidapi.JNI.jxl.JBorder));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBorderLineStyle', 
    TypeInfo(Androidapi.JNI.jxl.JBorderLineStyle));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellFormat_213', 
    TypeInfo(Androidapi.JNI.jxl.JCellFormat_213));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JColour', 
    TypeInfo(Androidapi.JNI.jxl.JColour));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFont', 
    TypeInfo(Androidapi.JNI.jxl.JFont));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormat', 
    TypeInfo(Androidapi.JNI.jxl.JFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JOrientation', 
    TypeInfo(Androidapi.JNI.jxl.JOrientation));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPageOrder', 
    TypeInfo(Androidapi.JNI.jxl.JPageOrder));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPageOrientation', 
    TypeInfo(Androidapi.JNI.jxl.JPageOrientation));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPaperSize', 
    TypeInfo(Androidapi.JNI.jxl.JPaperSize));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPattern', 
    TypeInfo(Androidapi.JNI.jxl.JPattern));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRGB', 
    TypeInfo(Androidapi.JNI.jxl.JRGB));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JScriptStyle', 
    TypeInfo(Androidapi.JNI.jxl.JScriptStyle));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JUnderlineStyle', 
    TypeInfo(Androidapi.JNI.jxl.JUnderlineStyle));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JVerticalAlignment', 
    TypeInfo(Androidapi.JNI.jxl.JVerticalAlignment));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulaCell', 
    TypeInfo(Androidapi.JNI.jxl.JFormulaCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHeaderFooter_Contents_227', 
    TypeInfo(Androidapi.JNI.jxl.JHeaderFooter_Contents_227));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHeaderFooter_228', 
    TypeInfo(Androidapi.JNI.jxl.JHeaderFooter_228));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHyperlink', 
    TypeInfo(Androidapi.JNI.jxl.JHyperlink));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JImage', 
    TypeInfo(Androidapi.JNI.jxl.JImage));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JJXLException', 
    TypeInfo(Androidapi.JNI.jxl.JJXLException));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLabelCell', 
    TypeInfo(Androidapi.JNI.jxl.JLabelCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberCell', 
    TypeInfo(Androidapi.JNI.jxl.JNumberCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberFormulaCell', 
    TypeInfo(Androidapi.JNI.jxl.JNumberFormulaCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRange', 
    TypeInfo(Androidapi.JNI.jxl.JRange));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBaseSharedFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JBaseSharedFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBiffException_BiffMessage', 
    TypeInfo(Androidapi.JNI.jxl.JBiffException_BiffMessage));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBiffException', 
    TypeInfo(Androidapi.JNI.jxl.JBiffException));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBiffRecordReader', 
    TypeInfo(Androidapi.JNI.jxl.JBiffRecordReader));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBlankCell', 
    TypeInfo(Androidapi.JNI.jxl.JBlankCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBOFRecord', 
    TypeInfo(Androidapi.JNI.jxl.JBOFRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBooleanFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JBooleanFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBooleanRecord', 
    TypeInfo(Androidapi.JNI.jxl.JBooleanRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBottomMarginRecord', 
    TypeInfo(Androidapi.JNI.jxl.JBottomMarginRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBoundsheetRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JBoundsheetRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBoundsheetRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JBoundsheetRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBoundsheetRecord', 
    TypeInfo(Androidapi.JNI.jxl.JBoundsheetRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JButtonPropertySetRecord', 
    TypeInfo(Androidapi.JNI.jxl.JButtonPropertySetRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCalcModeRecord', 
    TypeInfo(Androidapi.JNI.jxl.JCalcModeRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellFeaturesAccessor', 
    TypeInfo(Androidapi.JNI.jxl.JCellFeaturesAccessor));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellValue', 
    TypeInfo(Androidapi.JNI.jxl.JCellValue));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCentreRecord', 
    TypeInfo(Androidapi.JNI.jxl.JCentreRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCodepageRecord', 
    TypeInfo(Androidapi.JNI.jxl.JCodepageRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JColumnInfoRecord', 
    TypeInfo(Androidapi.JNI.jxl.JColumnInfoRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCompoundFile', 
    TypeInfo(Androidapi.JNI.jxl.JCompoundFile));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCountryRecord', 
    TypeInfo(Androidapi.JNI.jxl.JCountryRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDateFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDateRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDefaultColumnWidthRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDefaultColumnWidthRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDefaultRowHeightRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDefaultRowHeightRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDimensionRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JDimensionRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDimensionRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JDimensionRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDimensionRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDimensionRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JErrorFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JErrorFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JErrorRecord', 
    TypeInfo(Androidapi.JNI.jxl.JErrorRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExternalNameRecord', 
    TypeInfo(Androidapi.JNI.jxl.JExternalNameRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExternalSheetRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JExternalSheetRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExternalSheetRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JExternalSheetRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExternalSheetRecord_XTI', 
    TypeInfo(Androidapi.JNI.jxl.JExternalSheetRecord_XTI));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExternalSheetRecord', 
    TypeInfo(Androidapi.JNI.jxl.JExternalSheetRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFile', 
    TypeInfo(Androidapi.JNI.jxl.JFile));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFooterRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JFooterRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFooterRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JFooterRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFooterRecord', 
    TypeInfo(Androidapi.JNI.jxl.JFooterRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormula', 
    TypeInfo(Androidapi.JNI.jxl.JFormula));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulaRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JFormulaRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulaRecord_IgnoreSharedFormula', 
    TypeInfo(Androidapi.JNI.jxl.JFormulaRecord_IgnoreSharedFormula));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JGuttersRecord', 
    TypeInfo(Androidapi.JNI.jxl.JGuttersRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHeaderRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JHeaderRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHeaderRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JHeaderRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHeaderRecord', 
    TypeInfo(Androidapi.JNI.jxl.JHeaderRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHorizontalPageBreaksRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JHorizontalPageBreaksRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHorizontalPageBreaksRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JHorizontalPageBreaksRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHorizontalPageBreaksRecord', 
    TypeInfo(Androidapi.JNI.jxl.JHorizontalPageBreaksRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHyperlinkRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JHyperlinkRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHyperlinkRecord_LinkType', 
    TypeInfo(Androidapi.JNI.jxl.JHyperlinkRecord_LinkType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHyperlinkRecord', 
    TypeInfo(Androidapi.JNI.jxl.JHyperlinkRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLabelRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JLabelRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLabelRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JLabelRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLabelRecord', 
    TypeInfo(Androidapi.JNI.jxl.JLabelRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLabelSSTRecord', 
    TypeInfo(Androidapi.JNI.jxl.JLabelSSTRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLeftMarginRecord', 
    TypeInfo(Androidapi.JNI.jxl.JLeftMarginRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMarginRecord', 
    TypeInfo(Androidapi.JNI.jxl.JMarginRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMergedCellsRecord', 
    TypeInfo(Androidapi.JNI.jxl.JMergedCellsRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMulBlankCell', 
    TypeInfo(Androidapi.JNI.jxl.JMulBlankCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMulBlankRecord', 
    TypeInfo(Androidapi.JNI.jxl.JMulBlankRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMulRKRecord', 
    TypeInfo(Androidapi.JNI.jxl.JMulRKRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNameRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JNameRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNameRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JNameRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNameRecord_NameRange', 
    TypeInfo(Androidapi.JNI.jxl.JNameRecord_NameRange));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNameRecord', 
    TypeInfo(Androidapi.JNI.jxl.JNameRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNineteenFourRecord', 
    TypeInfo(Androidapi.JNI.jxl.JNineteenFourRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JNumberFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberRecord', 
    TypeInfo(Androidapi.JNI.jxl.JNumberRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberValue_306', 
    TypeInfo(Androidapi.JNI.jxl.JNumberValue_306));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPaletteRecord_307', 
    TypeInfo(Androidapi.JNI.jxl.JPaletteRecord_307));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPaneRecord', 
    TypeInfo(Androidapi.JNI.jxl.JPaneRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPasswordException', 
    TypeInfo(Androidapi.JNI.jxl.JPasswordException));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPasswordRecord', 
    TypeInfo(Androidapi.JNI.jxl.JPasswordRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPLSRecord', 
    TypeInfo(Androidapi.JNI.jxl.JPLSRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPrintGridLinesRecord', 
    TypeInfo(Androidapi.JNI.jxl.JPrintGridLinesRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPrintHeadersRecord', 
    TypeInfo(Androidapi.JNI.jxl.JPrintHeadersRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JProtectRecord', 
    TypeInfo(Androidapi.JNI.jxl.JProtectRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRecord', 
    TypeInfo(Androidapi.JNI.jxl.JRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRightMarginRecord', 
    TypeInfo(Androidapi.JNI.jxl.JRightMarginRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRKHelper', 
    TypeInfo(Androidapi.JNI.jxl.JRKHelper));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRKRecord', 
    TypeInfo(Androidapi.JNI.jxl.JRKRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRowRecord', 
    TypeInfo(Androidapi.JNI.jxl.JRowRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRStringRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JRStringRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRStringRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JRStringRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRStringRecord', 
    TypeInfo(Androidapi.JNI.jxl.JRStringRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSaveRecalcRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSaveRecalcRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSCLRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSCLRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSetupRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSetupRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedBooleanFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSharedBooleanFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedDateFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSharedDateFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedErrorFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSharedErrorFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSharedFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedNumberFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSharedNumberFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedStringFormulaRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JSharedStringFormulaRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedStringFormulaRecord_EmptyString', 
    TypeInfo(Androidapi.JNI.jxl.JSharedStringFormulaRecord_EmptyString));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedStringFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSharedStringFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSheetImpl', 
    TypeInfo(Androidapi.JNI.jxl.JSheetImpl));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSheetReader', 
    TypeInfo(Androidapi.JNI.jxl.JSheetReader));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSortRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSortRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSSTRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JSSTRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSSTRecord_BooleanHolder', 
    TypeInfo(Androidapi.JNI.jxl.JSSTRecord_BooleanHolder));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSSTRecord_ByteArrayHolder', 
    TypeInfo(Androidapi.JNI.jxl.JSSTRecord_ByteArrayHolder));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSSTRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSSTRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStringFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JStringFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSupbookRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JSupbookRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSupbookRecord_Type', 
    TypeInfo(Androidapi.JNI.jxl.JSupbookRecord_Type));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSupbookRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSupbookRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JTopMarginRecord', 
    TypeInfo(Androidapi.JNI.jxl.JTopMarginRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JVerticalPageBreaksRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JVerticalPageBreaksRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JVerticalPageBreaksRecord_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JVerticalPageBreaksRecord_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JVerticalPageBreaksRecord', 
    TypeInfo(Androidapi.JNI.jxl.JVerticalPageBreaksRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWindow2Record_1', 
    TypeInfo(Androidapi.JNI.jxl.JWindow2Record_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWindow2Record_Biff7', 
    TypeInfo(Androidapi.JNI.jxl.JWindow2Record_Biff7));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWindow2Record', 
    TypeInfo(Androidapi.JNI.jxl.JWindow2Record));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWorkbookParser', 
    TypeInfo(Androidapi.JNI.jxl.JWorkbookParser));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSheet', 
    TypeInfo(Androidapi.JNI.jxl.JSheet));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSheetSettings', 
    TypeInfo(Androidapi.JNI.jxl.JSheetSettings));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStringFormulaCell', 
    TypeInfo(Androidapi.JNI.jxl.JStringFormulaCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWorkbook', 
    TypeInfo(Androidapi.JNI.jxl.JWorkbook));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWorkbookSettings', 
    TypeInfo(Androidapi.JNI.jxl.JWorkbookSettings));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JAlignment_358', 
    TypeInfo(Androidapi.JNI.jxl.JAlignment_358));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JArbitraryRecord', 
    TypeInfo(Androidapi.JNI.jxl.JArbitraryRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBackupRecord', 
    TypeInfo(Androidapi.JNI.jxl.JBackupRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBlankRecord', 
    TypeInfo(Androidapi.JNI.jxl.JBlankRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBOFRecord_1', 
    TypeInfo(Androidapi.JNI.jxl.JBOFRecord_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBOFRecord_SheetBOF', 
    TypeInfo(Androidapi.JNI.jxl.JBOFRecord_SheetBOF));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBOFRecord_WorkbookGlobalsBOF', 
    TypeInfo(Androidapi.JNI.jxl.JBOFRecord_WorkbookGlobalsBOF));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBOFRecord_365', 
    TypeInfo(Androidapi.JNI.jxl.JBOFRecord_365));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBookboolRecord', 
    TypeInfo(Androidapi.JNI.jxl.JBookboolRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBooleanRecord_367', 
    TypeInfo(Androidapi.JNI.jxl.JBooleanRecord_367));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBottomMarginRecord_368', 
    TypeInfo(Androidapi.JNI.jxl.JBottomMarginRecord_368));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBoundsheetRecord_369', 
    TypeInfo(Androidapi.JNI.jxl.JBoundsheetRecord_369));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JButtonPropertySetRecord_370', 
    TypeInfo(Androidapi.JNI.jxl.JButtonPropertySetRecord_370));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCalcCountRecord', 
    TypeInfo(Androidapi.JNI.jxl.JCalcCountRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCalcModeRecord_CalcMode', 
    TypeInfo(Androidapi.JNI.jxl.JCalcModeRecord_CalcMode));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCalcModeRecord_373', 
    TypeInfo(Androidapi.JNI.jxl.JCalcModeRecord_373));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellValue_374', 
    TypeInfo(Androidapi.JNI.jxl.JCellValue_374));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCellXFRecord', 
    TypeInfo(Androidapi.JNI.jxl.JCellXFRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCodepageRecord_376', 
    TypeInfo(Androidapi.JNI.jxl.JCodepageRecord_376));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JColumnInfoRecord_377', 
    TypeInfo(Androidapi.JNI.jxl.JColumnInfoRecord_377));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JColumnsExceededException', 
    TypeInfo(Androidapi.JNI.jxl.JColumnsExceededException));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCompoundFile_ReadPropertyStorage', 
    TypeInfo(Androidapi.JNI.jxl.JCompoundFile_ReadPropertyStorage));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCompoundFile_380', 
    TypeInfo(Androidapi.JNI.jxl.JCompoundFile_380));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCopyAdditionalPropertySetsException', 
    TypeInfo(Androidapi.JNI.jxl.JCopyAdditionalPropertySetsException));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JCountryRecord_382', 
    TypeInfo(Androidapi.JNI.jxl.JCountryRecord_382));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateFormatRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDateFormatRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateRecord_GMTDate', 
    TypeInfo(Androidapi.JNI.jxl.JDateRecord_GMTDate));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateRecord_385', 
    TypeInfo(Androidapi.JNI.jxl.JDateRecord_385));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDBCellRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDBCellRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDefaultColumnWidth', 
    TypeInfo(Androidapi.JNI.jxl.JDefaultColumnWidth));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDefaultRowHeightRecord_388', 
    TypeInfo(Androidapi.JNI.jxl.JDefaultRowHeightRecord_388));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDeltaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDeltaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDimensionRecord_390', 
    TypeInfo(Androidapi.JNI.jxl.JDimensionRecord_390));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDSFRecord', 
    TypeInfo(Androidapi.JNI.jxl.JDSFRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JEOFRecord', 
    TypeInfo(Androidapi.JNI.jxl.JEOFRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExcelDataOutput', 
    TypeInfo(Androidapi.JNI.jxl.JExcelDataOutput));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExtendedSSTRecord', 
    TypeInfo(Androidapi.JNI.jxl.JExtendedSSTRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExternalNameRecord_395', 
    TypeInfo(Androidapi.JNI.jxl.JExternalNameRecord_395));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExternalSheetRecord_XTI_396', 
    TypeInfo(Androidapi.JNI.jxl.JExternalSheetRecord_XTI_396));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JExternalSheetRecord_397', 
    TypeInfo(Androidapi.JNI.jxl.JExternalSheetRecord_397));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFile_398', 
    TypeInfo(Androidapi.JNI.jxl.JFile_398));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFileDataOutput', 
    TypeInfo(Androidapi.JNI.jxl.JFileDataOutput));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFooterRecord_400', 
    TypeInfo(Androidapi.JNI.jxl.JFooterRecord_400));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormulaRecord_401', 
    TypeInfo(Androidapi.JNI.jxl.JFormulaRecord_401));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFunctionGroupCountRecord', 
    TypeInfo(Androidapi.JNI.jxl.JFunctionGroupCountRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JGridSetRecord', 
    TypeInfo(Androidapi.JNI.jxl.JGridSetRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JGuttersRecord_404', 
    TypeInfo(Androidapi.JNI.jxl.JGuttersRecord_404));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHeaderRecord_405', 
    TypeInfo(Androidapi.JNI.jxl.JHeaderRecord_405));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHideobjRecord', 
    TypeInfo(Androidapi.JNI.jxl.JHideobjRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHorizontalCentreRecord', 
    TypeInfo(Androidapi.JNI.jxl.JHorizontalCentreRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHorizontalPageBreaksRecord_408', 
    TypeInfo(Androidapi.JNI.jxl.JHorizontalPageBreaksRecord_408));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHyperlinkRecord_1_409', 
    TypeInfo(Androidapi.JNI.jxl.JHyperlinkRecord_1_409));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHyperlinkRecord_LinkType_410', 
    TypeInfo(Androidapi.JNI.jxl.JHyperlinkRecord_LinkType_410));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JHyperlinkRecord_411', 
    TypeInfo(Androidapi.JNI.jxl.JHyperlinkRecord_411));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JIndexRecord', 
    TypeInfo(Androidapi.JNI.jxl.JIndexRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JInterfaceEndRecord', 
    TypeInfo(Androidapi.JNI.jxl.JInterfaceEndRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JInterfaceHeaderRecord', 
    TypeInfo(Androidapi.JNI.jxl.JInterfaceHeaderRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JIterationRecord', 
    TypeInfo(Androidapi.JNI.jxl.JIterationRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JJxlWriteException_WriteMessage', 
    TypeInfo(Androidapi.JNI.jxl.JJxlWriteException_WriteMessage));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JJxlWriteException', 
    TypeInfo(Androidapi.JNI.jxl.JJxlWriteException));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLabelRecord_418', 
    TypeInfo(Androidapi.JNI.jxl.JLabelRecord_418));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLeftMarginRecord_419', 
    TypeInfo(Androidapi.JNI.jxl.JLeftMarginRecord_419));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMarginRecord_420', 
    TypeInfo(Androidapi.JNI.jxl.JMarginRecord_420));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMemoryDataOutput', 
    TypeInfo(Androidapi.JNI.jxl.JMemoryDataOutput));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMergedCells', 
    TypeInfo(Androidapi.JNI.jxl.JMergedCells));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMergedCellsRecord_423', 
    TypeInfo(Androidapi.JNI.jxl.JMergedCellsRecord_423));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMMSRecord', 
    TypeInfo(Androidapi.JNI.jxl.JMMSRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JMulRKRecord_425', 
    TypeInfo(Androidapi.JNI.jxl.JMulRKRecord_425));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNameRecord_NameRange_426', 
    TypeInfo(Androidapi.JNI.jxl.JNameRecord_NameRange_426));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNameRecord_427', 
    TypeInfo(Androidapi.JNI.jxl.JNameRecord_427));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNineteenFourRecord_428', 
    TypeInfo(Androidapi.JNI.jxl.JNineteenFourRecord_428));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberFormatRecord_NonValidatingFormat', 
    TypeInfo(Androidapi.JNI.jxl.JNumberFormatRecord_NonValidatingFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberFormatRecord', 
    TypeInfo(Androidapi.JNI.jxl.JNumberFormatRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberRecord_431', 
    TypeInfo(Androidapi.JNI.jxl.JNumberRecord_431));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JObjectProtectRecord', 
    TypeInfo(Androidapi.JNI.jxl.JObjectProtectRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JObjProjRecord', 
    TypeInfo(Androidapi.JNI.jxl.JObjProjRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPaletteRecord_434', 
    TypeInfo(Androidapi.JNI.jxl.JPaletteRecord_434));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPaneRecord_435', 
    TypeInfo(Androidapi.JNI.jxl.JPaneRecord_435));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPasswordRecord_436', 
    TypeInfo(Androidapi.JNI.jxl.JPasswordRecord_436));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPLSRecord_437', 
    TypeInfo(Androidapi.JNI.jxl.JPLSRecord_437));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPrecisionRecord', 
    TypeInfo(Androidapi.JNI.jxl.JPrecisionRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPrintGridLinesRecord_439', 
    TypeInfo(Androidapi.JNI.jxl.JPrintGridLinesRecord_439));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPrintHeadersRecord_440', 
    TypeInfo(Androidapi.JNI.jxl.JPrintHeadersRecord_440));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JProt4RevPassRecord', 
    TypeInfo(Androidapi.JNI.jxl.JProt4RevPassRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JProt4RevRecord', 
    TypeInfo(Androidapi.JNI.jxl.JProt4RevRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JProtectRecord_443', 
    TypeInfo(Androidapi.JNI.jxl.JProtectRecord_443));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JReadBooleanFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JReadBooleanFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JReadDateFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JReadDateFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JReadErrorFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JReadErrorFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JReadFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JReadFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JReadNumberFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JReadNumberFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JReadStringFormulaRecord', 
    TypeInfo(Androidapi.JNI.jxl.JReadStringFormulaRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRefModeRecord', 
    TypeInfo(Androidapi.JNI.jxl.JRefModeRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRefreshAllRecord', 
    TypeInfo(Androidapi.JNI.jxl.JRefreshAllRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRightMarginRecord_452', 
    TypeInfo(Androidapi.JNI.jxl.JRightMarginRecord_452));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRowRecord_453', 
    TypeInfo(Androidapi.JNI.jxl.JRowRecord_453));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JRowsExceededException', 
    TypeInfo(Androidapi.JNI.jxl.JRowsExceededException));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSaveRecalcRecord_455', 
    TypeInfo(Androidapi.JNI.jxl.JSaveRecalcRecord_455));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JScenarioProtectRecord', 
    TypeInfo(Androidapi.JNI.jxl.JScenarioProtectRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSCLRecord_457', 
    TypeInfo(Androidapi.JNI.jxl.JSCLRecord_457));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSelectionRecord_PaneType', 
    TypeInfo(Androidapi.JNI.jxl.JSelectionRecord_PaneType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSelectionRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSelectionRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSetupRecord_460', 
    TypeInfo(Androidapi.JNI.jxl.JSetupRecord_460));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSharedStrings', 
    TypeInfo(Androidapi.JNI.jxl.JSharedStrings));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSheetCopier', 
    TypeInfo(Androidapi.JNI.jxl.JSheetCopier));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSheetWriter', 
    TypeInfo(Androidapi.JNI.jxl.JSheetWriter));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSortRecord_464', 
    TypeInfo(Androidapi.JNI.jxl.JSortRecord_464));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSSTContinueRecord', 
    TypeInfo(Androidapi.JNI.jxl.JSSTContinueRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSSTRecord_466', 
    TypeInfo(Androidapi.JNI.jxl.JSSTRecord_466));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStringRecord', 
    TypeInfo(Androidapi.JNI.jxl.JStringRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStyles', 
    TypeInfo(Androidapi.JNI.jxl.JStyles));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JStyleXFRecord', 
    TypeInfo(Androidapi.JNI.jxl.JStyleXFRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSupbookRecord_1_470', 
    TypeInfo(Androidapi.JNI.jxl.JSupbookRecord_1_470));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSupbookRecord_SupbookType', 
    TypeInfo(Androidapi.JNI.jxl.JSupbookRecord_SupbookType));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JSupbookRecord_472', 
    TypeInfo(Androidapi.JNI.jxl.JSupbookRecord_472));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JTabIdRecord', 
    TypeInfo(Androidapi.JNI.jxl.JTabIdRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JTopMarginRecord_474', 
    TypeInfo(Androidapi.JNI.jxl.JTopMarginRecord_474));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JUsesElfsRecord', 
    TypeInfo(Androidapi.JNI.jxl.JUsesElfsRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JVerticalCentreRecord', 
    TypeInfo(Androidapi.JNI.jxl.JVerticalCentreRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JVerticalPageBreaksRecord_477', 
    TypeInfo(Androidapi.JNI.jxl.JVerticalPageBreaksRecord_477));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWeird1Record', 
    TypeInfo(Androidapi.JNI.jxl.JWeird1Record));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWindow1Record', 
    TypeInfo(Androidapi.JNI.jxl.JWindow1Record));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWindow2Record_480', 
    TypeInfo(Androidapi.JNI.jxl.JWindow2Record_480));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWindowProtectRecord', 
    TypeInfo(Androidapi.JNI.jxl.JWindowProtectRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableFontRecord', 
    TypeInfo(Androidapi.JNI.jxl.JWritableFontRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableFonts', 
    TypeInfo(Androidapi.JNI.jxl.JWritableFonts));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableFormattingRecords', 
    TypeInfo(Androidapi.JNI.jxl.JWritableFormattingRecords));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableSheetCopier', 
    TypeInfo(Androidapi.JNI.jxl.JWritableSheetCopier));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableSheetImpl_1', 
    TypeInfo(Androidapi.JNI.jxl.JWritableSheetImpl_1));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableSheetImpl_ColumnInfoComparator', 
    TypeInfo(Androidapi.JNI.jxl.JWritableSheetImpl_ColumnInfoComparator));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableSheetImpl', 
    TypeInfo(Androidapi.JNI.jxl.JWritableSheetImpl));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableWorkbookImpl', 
    TypeInfo(Androidapi.JNI.jxl.JWritableWorkbookImpl));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWriteAccessRecord', 
    TypeInfo(Androidapi.JNI.jxl.JWriteAccessRecord));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBlank', 
    TypeInfo(Androidapi.JNI.jxl.JBlank));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBoldStyle_492', 
    TypeInfo(Androidapi.JNI.jxl.JBoldStyle_492));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBoolean', 
    TypeInfo(Androidapi.JNI.jxl.JBoolean));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBorder_494', 
    TypeInfo(Androidapi.JNI.jxl.JBorder_494));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JBorderLineStyle_495', 
    TypeInfo(Androidapi.JNI.jxl.JBorderLineStyle_495));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JColour_496', 
    TypeInfo(Androidapi.JNI.jxl.JColour_496));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateFormat', 
    TypeInfo(Androidapi.JNI.jxl.JDateFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateFormats_BuiltInFormat', 
    TypeInfo(Androidapi.JNI.jxl.JDateFormats_BuiltInFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateFormats', 
    TypeInfo(Androidapi.JNI.jxl.JDateFormats));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JDateTime', 
    TypeInfo(Androidapi.JNI.jxl.JDateTime));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFont_501', 
    TypeInfo(Androidapi.JNI.jxl.JFont_501));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JFormula_502', 
    TypeInfo(Androidapi.JNI.jxl.JFormula_502));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JLabel', 
    TypeInfo(Androidapi.JNI.jxl.JLabel));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumber', 
    TypeInfo(Androidapi.JNI.jxl.JNumber));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberFormat', 
    TypeInfo(Androidapi.JNI.jxl.JNumberFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberFormats_BuiltInFormat', 
    TypeInfo(Androidapi.JNI.jxl.JNumberFormats_BuiltInFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JNumberFormats', 
    TypeInfo(Androidapi.JNI.jxl.JNumberFormats));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JPattern_508', 
    TypeInfo(Androidapi.JNI.jxl.JPattern_508));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JVerticalAlignment_509', 
    TypeInfo(Androidapi.JNI.jxl.JVerticalAlignment_509));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableCell', 
    TypeInfo(Androidapi.JNI.jxl.JWritableCell));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableCellFeatures', 
    TypeInfo(Androidapi.JNI.jxl.JWritableCellFeatures));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableCellFormat', 
    TypeInfo(Androidapi.JNI.jxl.JWritableCellFormat));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableFont_BoldStyle', 
    TypeInfo(Androidapi.JNI.jxl.JWritableFont_BoldStyle));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableFont_FontName', 
    TypeInfo(Androidapi.JNI.jxl.JWritableFont_FontName));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableFont', 
    TypeInfo(Androidapi.JNI.jxl.JWritableFont));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableHyperlink', 
    TypeInfo(Androidapi.JNI.jxl.JWritableHyperlink));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableImage', 
    TypeInfo(Androidapi.JNI.jxl.JWritableImage));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableSheet', 
    TypeInfo(Androidapi.JNI.jxl.JWritableSheet));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWritableWorkbook', 
    TypeInfo(Androidapi.JNI.jxl.JWritableWorkbook));
  TRegTypes.RegisterType('Androidapi.JNI.jxl.JWriteException', 
    TypeInfo(Androidapi.JNI.jxl.JWriteException));
end;


initialization
  RegisterTypes;

end.
