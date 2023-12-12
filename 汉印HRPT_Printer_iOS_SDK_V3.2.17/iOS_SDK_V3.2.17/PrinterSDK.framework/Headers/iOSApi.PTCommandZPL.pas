//{!
// *  \~chinese
// *  @header PTCommandZPL.h
// *  @abstract ZPL指令
// *
// *  \~english
// *  @header PTCommandZPL.h
// *  @abstract ZPL Command
// }

unit iOSApi.PTCommandZPL;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	//#import "PTBitmapManager.h"
	iOSApi.PTBitmapManager,
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

	//NS_ASSUME_NONNULL_BEGIN
	
	//{*
	// Fonts currently supported by the printer
	// 打印机目前支持的字体
	// 
	// index     name   font_id    字符集/character set
	// 0      arial.ttf     0        0
	// 1      GB2312.ttf    1        2
	// 2      fontA.FNT     A        0
	// 3      fontB.FNT     B        0
	// 4      fontC.FNT     C        0
	// 5      fontD.FNT     D        0
	// 6      fontE.FNT     E        0
	// 7      fontF.FNT     F        0
	// 8      fontG.FNT     G        0
	// 9      fontH.FNT     H        0
	// 10     fontGS.FNT    I        0
	// 
	// Process mode： if it exceeds the ID range, the program will set it as “c” font
	// 处理方式：如果超过ID 范围，程序将设置为 “c”字体
	// }
	
	
	//typedef NS_ENUM(UInt8, PTZplOrientation) {
	    ///*! \~chinese 正向 \~english normal */
	    //PTZplOrientation_N = 'N',
	    ///*! \~chinese 顺时针旋转90度 \~english rotate 90 degrees (clockwise) */
	    //PTZplOrientation_R = 'R',
	    ///*! \~chinese 180度旋转 \~english inverted 180 degrees */
	    //PTZplOrientation_I = 'I',
	    ///*! \~chinese 270度旋转 \~english read from bottom up, 270 degrees */
	    //PTZplOrientation_B = 'B'
	//};
	//typedef NS_ENUM(UInt8, PTZplOrientation) {
	PTZplOrientation_=(
	//(UInt8, PTZplOrientation) {
	//    /*! \~chinese 正向 \~english normal */
	    PTZplOrientation_N,// = 'N',
	//    /*! \~chinese 顺时针旋转90度 \~english rotate 90 degrees (clockwise) */
	    PTZplOrientation_R,// = 'R',
	//    /*! \~chinese 180度旋转 \~english inverted 180 degrees */
	    PTZplOrientation_I,// = 'I',
	//    /*! \~chinese 270度旋转 \~english read from bottom up, 270 degrees */
	    PTZplOrientation_B//,// = 'B'
	);
	PTZplOrientation=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplFont) {
	    
	    //PTZplFont0  = '0',
	    //PTZplFont1  = '1',
	    //PTZplFontA  = 'A',
	    //PTZplFontB  = 'B',
	    //PTZplFontC  = 'C',
	    //PTZplFontD  = 'D',
	    //PTZplFontE  = 'E',
	    //PTZplFontF  = 'F',
	    //PTZplFontG  = 'G',
	    //PTZplFontH  = 'H',
	    //PTZplFontI  = 'I'
	//};
	//typedef NS_ENUM(UInt8, PTZplFont) {
	PTZplFont_=(
	//(UInt8, PTZplFont) {
	    PTZplFont0,//  = '0',
	    PTZplFont1,//  = '1',
	    PTZplFontA,//  = 'A',
	    PTZplFontB,//  = 'B',
	    PTZplFontC,//  = 'C',
	    PTZplFontD,//  = 'D',
	    PTZplFontE,//  = 'E',
	    PTZplFontF,//  = 'F',
	    PTZplFontG,//  = 'G',
	    PTZplFontH,//  = 'H',
	    PTZplFontI//,//  = 'I'
	);
	PTZplFont=Integer;
	
	
	
	
	
	////source location
	//typedef NS_ENUM(UInt8, PTZplFileLocation) {
	    ///*! \~chinese 文件路径R: \~english file location R: */
	    //PTZplFileLocation_R = 'R',
	    ///*! \~chinese 文件路径E: \~english file location E: */
	    //PTZplFileLocation_E = 'E',
	    ///*! \~chinese 文件路径B: \~english file location B: */
	    //PTZplFileLocation_B = 'B',
	    ///*! \~chinese 文件路径A: \~english file location A: */
	    //PTZplFileLocation_A = 'A'
	//};
	//typedef NS_ENUM(UInt8, PTZplFileLocation) {
	PTZplFileLocation_=(
	//(UInt8, PTZplFileLocation) {
	//    /*! \~chinese 文件路径R: \~english file location R: */
	    PTZplFileLocation_R,// = 'R',
	//    /*! \~chinese 文件路径E: \~english file location E: */
	    PTZplFileLocation_E,// = 'E',
	//    /*! \~chinese 文件路径B: \~english file location B: */
	    PTZplFileLocation_B,// = 'B',
	//    /*! \~chinese 文件路径A: \~english file location A: */
	    PTZplFileLocation_A//,// = 'A'
	);
	PTZplFileLocation=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplBool) {
	    ///*! \~chinese 是 \~english yes */
	    //PTZplBool_Y = 'Y',
	    ///*! \~chinese 否 \~english no */
	    //PTZplBool_N = 'N'
	//};
	//typedef NS_ENUM(UInt8, PTZplBool) {
	PTZplBool_=(
	//(UInt8, PTZplBool) {
	//    /*! \~chinese 是 \~english yes */
	    PTZplBool_Y,// = 'Y',
	//    /*! \~chinese 否 \~english no */
	    PTZplBool_N//,// = 'N'
	);
	PTZplBool=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplCodeBlockBarCodeMode) {
	    ///*! \~chinese Code 39 字符集 \~english use Code 39 character set */
	    //PTZplCodeBlockBarCodeMode_A = 'A',
	    ///*! \~chinese Code 128 字符集 \~english use Code 128 character set */
	    //PTZplCodeBlockBarCodeMode_F = 'F',
	    ///*! \~chinese Code 128 字符集并自动添加FNC1. \~english use the Code 128 character set and automatically adds FNC1. */
	    //PTZplCodeBlockBarCodeMode_E = 'E'
	//};
	//typedef NS_ENUM(UInt8, PTZplCodeBlockBarCodeMode) {
	PTZplCodeBlockBarCodeMode_=(
	//(UInt8, PTZplCodeBlockBarCodeMode) {
	//    /*! \~chinese Code 39 字符集 \~english use Code 39 character set */
	    PTZplCodeBlockBarCodeMode_A,// = 'A',
	//    /*! \~chinese Code 128 字符集 \~english use Code 128 character set */
	    PTZplCodeBlockBarCodeMode_F,// = 'F',
	//    /*! \~chinese Code 128 字符集并自动添加FNC1. \~english use the Code 128 character set and automatically adds FNC1. */
	    PTZplCodeBlockBarCodeMode_E//,// = 'E'
	);
	PTZplCodeBlockBarCodeMode=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplCode128Mode) {
	    ///*! \~chinese 不选择模式 \~english no selected mode */
	    //PTZplCode128Mode_N = 'N',
	    ///*! \~chinese UCC Case 模式 \~english UCC Case Mode */
	    //PTZplCode128Mode_U = 'U',
	    ///*! \~chinese 自动模式 \~english Automatic Mode */
	    //PTZplCode128Mode_A = 'A',
	    ///*! \~chinese UCC/EAN Mode \~english UCC/EAN Mode */
	    //PTZplCode128Mode_D = 'D'
	//};
	//typedef NS_ENUM(UInt8, PTZplCode128Mode) {
	PTZplCode128Mode_=(
	//(UInt8, PTZplCode128Mode) {
	//    /*! \~chinese 不选择模式 \~english no selected mode */
	    PTZplCode128Mode_N,// = 'N',
	//    /*! \~chinese UCC Case 模式 \~english UCC Case Mode */
	    PTZplCode128Mode_U,// = 'U',
	//    /*! \~chinese 自动模式 \~english Automatic Mode */
	    PTZplCode128Mode_A,// = 'A',
	//    /*! \~chinese UCC/EAN Mode \~english UCC/EAN Mode */
	    PTZplCode128Mode_D//,// = 'D'
	);
	PTZplCode128Mode=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplJustification) {
	    ///*! \~chinese 左对齐 \~english left justication */
	    //PTZplJustificationLeft = '0',
	    ///*! \~chinese 右对齐 \~english right justication */
	    //PTZplJustificationRight = '1',
	    ///*! \~chinese 自动对齐 \~english auto justication */
	    //PTZplJustificationAuto = '2'
	//};
	//typedef NS_ENUM(UInt8, PTZplJustification) {
	PTZplJustification_=(
	//(UInt8, PTZplJustification) {
	//    /*! \~chinese 左对齐 \~english left justication */
	    PTZplJustificationLeft,// = '0',
	//    /*! \~chinese 右对齐 \~english right justication */
	    PTZplJustificationRight,// = '1',
	//    /*! \~chinese 自动对齐 \~english auto justication */
	    PTZplJustificationAuto//,// = '2'
	);
	PTZplJustification=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplColor) {
	    ///*! \~chinese 黑色 \~english black color */
	    //PTZplColorBlack = 'B',
	    ///*! \~chinese 白色 \~english white color */
	    //PTZplColorWhite = 'W'
	//};
	//typedef NS_ENUM(UInt8, PTZplColor) {
	PTZplColor_=(
	//(UInt8, PTZplColor) {
	//    /*! \~chinese 黑色 \~english black color */
	    PTZplColorBlack,// = 'B',
	//    /*! \~chinese 白色 \~english white color */
	    PTZplColorWhite//,// = 'W'
	);
	PTZplColor=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplDiagonalOrientation) {
	    ///*! \~chinese 右靠斜线 \~english right leaning diagonal */
	    //PTZplDiagonalOrientationLeaningRight = 'R',
	    ///*! \~chinese 左靠斜线 \~english left leaning diagonal */
	    //PTZplDiagonalOrientationLeaningLeft = 'L'
	//};
	//typedef NS_ENUM(UInt8, PTZplDiagonalOrientation) {
	PTZplDiagonalOrientation_=(
	//(UInt8, PTZplDiagonalOrientation) {
	//    /*! \~chinese 右靠斜线 \~english right leaning diagonal */
	    PTZplDiagonalOrientationLeaningRight,// = 'R',
	//    /*! \~chinese 左靠斜线 \~english left leaning diagonal */
	    PTZplDiagonalOrientationLeaningLeft//,// = 'L'
	);
	PTZplDiagonalOrientation=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplMediaType) {
	    ///*! \~chinese 热转印介质 \~english thermal transfer media */
	    //PTZplMediaTypeThermalTransfer = 'T',
	    ///*! \~chinese 热敏介质 \~english direct thermal media */
	    //PTZplMediaTypeDirectThermal = 'D'
	//};
	//typedef NS_ENUM(UInt8, PTZplMediaType) {
	PTZplMediaType_=(
	//(UInt8, PTZplMediaType) {
	//    /*! \~chinese 热转印介质 \~english thermal transfer media */
	    PTZplMediaTypeThermalTransfer,// = 'T',
	//    /*! \~chinese 热敏介质 \~english direct thermal media */
	    PTZplMediaTypeDirectThermal//,// = 'D'
	);
	PTZplMediaType=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplQrReliabilityLevel) {
	    ///*! \~chinese 极高可靠级别 \~english ultra-high reliability level */
	    //PTZplQrReliabilityLevel_H = 'H',
	    ///*! \~chinese 高可靠级别 \~english high reliability level */
	    //PTZplQrReliabilityLevel_Q = 'Q',
	    ///*! \~chinese 标准级别 \~english standard level */
	    //PTZplQrReliabilityLevel_M = 'M',
	    ///*! \~chinese ?密度级别 \~english high density level level */
	    //PTZplQrReliabilityLevel_L = 'L'
	//};
	//typedef NS_ENUM(UInt8, PTZplQrReliabilityLevel) {
	PTZplQrReliabilityLevel_=(
	//(UInt8, PTZplQrReliabilityLevel) {
	//    /*! \~chinese 极高可靠级别 \~english ultra-high reliability level */
	    PTZplQrReliabilityLevel_H,// = 'H',
	//    /*! \~chinese 高可靠级别 \~english high reliability level */
	    PTZplQrReliabilityLevel_Q,// = 'Q',
	//    /*! \~chinese 标准级别 \~english standard level */
	    PTZplQrReliabilityLevel_M,// = 'M',
	//    /*! \~chinese ?密度级别 \~english high density level level */
	    PTZplQrReliabilityLevel_L// = 'L'
	);
	PTZplQrReliabilityLevel=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplQrModel) {
	    ///*! \~chinese 标准 \~english original */
	    //PTZplQrModel_1 = '1',
	    ///*! \~chinese 增强 \~english enhanced */
	    //PTZplQrModel_2 = '2'
	//};
	//typedef NS_ENUM(UInt8, PTZplQrModel) {
	PTZplQrModel_=(
	//(UInt8, PTZplQrModel) {
	//    /*! \~chinese 标准 \~english original */
	    PTZplQrModel_1,// = '1',
	//    /*! \~chinese 增强 \~english enhanced */
	    PTZplQrModel_2// = '2'
	);
	PTZplQrModel=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplTextPrintDirection) {
	    ///*! \~chinese 水平打印(由左至右) \~english horizontal printing (left to right) */
	    //PTZplTextPrintDirection_H = 'H',
	    ///*! \~chinese 垂直打印(由上至下) \~english vertical printing (top to bottom) */
	    //PTZplTextPrintDirection_V = 'V',
	    ///*! \~chinese 反向打印(由上至下) \~english reverse printing (right to left) */
	    //PTZplTextPrintDirection_R = 'R'
	//};
	//typedef NS_ENUM(UInt8, PTZplTextPrintDirection) {
	PTZplTextPrintDirection_=(
	//(UInt8, PTZplTextPrintDirection) {
	//    /*! \~chinese 水平打印(由左至右) \~english horizontal printing (left to right) */
	    PTZplTextPrintDirection_H,// = 'H',
	//    /*! \~chinese 垂直打印(由上至下) \~english vertical printing (top to bottom) */
	    PTZplTextPrintDirection_V,// = 'V',
	//    /*! \~chinese 反向打印(由上至下) \~english reverse printing (right to left) */
	    PTZplTextPrintDirection_R// = 'R'
	);
	PTZplTextPrintDirection=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplPrintOrientation) {
	    ///*! \~chinese 通用打印 \~english normal */
	    //PTZplPrintOrientation_N = 'N',
	    ///*! \~chinese 反向打印 \~english invert */
	    //PTZplPrintOrientation_I = 'I'
	//};
	//typedef NS_ENUM(UInt8, PTZplPrintOrientation) {
	PTZplPrintOrientation_=(
	//(UInt8, PTZplPrintOrientation) {
	//    /*! \~chinese 通用打印 \~english normal */
	    PTZplPrintOrientation_N,// = 'N',
	//    /*! \~chinese 反向打印 \~english invert */
	    PTZplPrintOrientation_I// = 'I'
	);
	PTZplPrintOrientation=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplUpsMaxiCodeMode) {
	    ///*! \~chinese 结构化信息载体:数字邮政编码(U.S.) \~english structured carrier message: numeric postal code (U.S.) */
	    //PTZplUpsMaxiCodeMode_2 = '2',
	    ///*! \~chinese 结构化信息载体:数字邮政编码(non-U.S.) \~english structured carrier message: numeric postal code (non-U.S.) */
	    //PTZplUpsMaxiCodeMode_3 = '3',
	    ///*! \~chinese 标准符号 \~english standard symbol, secretary */
	    //PTZplUpsMaxiCodeMode_4 = '4',
	    ///*! \~chinese 全EEC \~english full EEC */
	    //PTZplUpsMaxiCodeMode_5 = '5',
	    ///*! \~chinese reader program \~english reader program, secretary */
	    //PTZplUpsMaxiCodeMode_6 = '6'
	//};
	//typedef NS_ENUM(UInt8, PTZplUpsMaxiCodeMode) {
	PTZplUpsMaxiCodeMode_=(
	//(UInt8, PTZplUpsMaxiCodeMode) {
	//    /*! \~chinese 结构化信息载体:数字邮政编码(U.S.) \~english structured carrier message: numeric postal code (U.S.) */
	    PTZplUpsMaxiCodeMode_2,// = '2',
	//    /*! \~chinese 结构化信息载体:数字邮政编码(non-U.S.) \~english structured carrier message: numeric postal code (non-U.S.) */
	    PTZplUpsMaxiCodeMode_3,// = '3',
	//    /*! \~chinese 标准符号 \~english standard symbol, secretary */
	    PTZplUpsMaxiCodeMode_4,// = '4',
	//    /*! \~chinese 全EEC \~english full EEC */
	    PTZplUpsMaxiCodeMode_5,// = '5',
	//    /*! \~chinese reader program \~english reader program, secretary */
	    PTZplUpsMaxiCodeMode_6// = '6'
	);
	PTZplUpsMaxiCodeMode=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTCode49InterpretationLineStyle) {
	    ///*! \~chinese 不打印解释行 \~english no line printed. */
	    //PTCode49InterpretationLineStyle_N = 'N',
	    ///*! \~chinese 在条码上方打印解释行 \~english print interpretation line above code. */
	    //PTCode49InterpretationLineStyle_A = 'A',
	    ///*! \~chinese 在条码下方打印解释行 \~english print interpretation line below code. */
	    //PTCode49InterpretationLineStyle_B = 'B'
	//};
	//typedef NS_ENUM(UInt8, PTCode49InterpretationLineStyle) {
	PTCode49InterpretationLineStyle_=(
	//(UInt8, PTCode49InterpretationLineStyle) {
	//    /*! \~chinese 不打印解释行 \~english no line printed. */
	    PTCode49InterpretationLineStyle_N,// = 'N',
	//    /*! \~chinese 在条码上方打印解释行 \~english print interpretation line above code. */
	    PTCode49InterpretationLineStyle_A,// = 'A',
	//    /*! \~chinese 在条码下方打印解释行 \~english print interpretation line below code. */
	    PTCode49InterpretationLineStyle_B// = 'B'
	);
	PTCode49InterpretationLineStyle=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplPrintMode) {
	    ///*! \~chinese 撕扯 \~english tear. */
	    //PTZplPrintMode_T = 'T',
	    ///*! \~chinese 剥离 \~english stripper. */
	    //PTZplPrintMode_P = 'P',
	    ///*! \~chinese 回卷 \~english rollback model. */
	    //PTZplPrintMode_R = 'R',
	    ///*! \~chinese 贴标机 \~english Labeling machine. */
	    //PTZplPrintMode_A = 'A',
	    ///*! \~chinese 切纸器 \~english Paper cutting machine. */
	    //PTZplPrintMode_C = 'C',
	    ///*! \~chinese 延迟切纸器 \~english Delay paper cutter. */
	    //PTZplPrintMode_D = 'D',
	    ///*! \~chinese RFID \~english RFID. */
	    //PTZplPrintMode_F = 'F',
	    ///*! \~chinese 自助终端模式 \~english Self-service terminal mode. */
	    //PTZplPrintMode_K = 'K'
	//};
	//typedef NS_ENUM(UInt8, PTZplPrintMode) {
	PTZplPrintMode_=(
	//(UInt8, PTZplPrintMode) {
	//    /*! \~chinese 撕扯 \~english tear. */
	    PTZplPrintMode_T,// = 'T',
	//    /*! \~chinese 剥离 \~english stripper. */
	    PTZplPrintMode_P,// = 'P',
	//    /*! \~chinese 回卷 \~english rollback model. */
	    PTZplPrintMode_R,// = 'R',
	//    /*! \~chinese 贴标机 \~english Labeling machine. */
	    PTZplPrintMode_A,// = 'A',
	//    /*! \~chinese 切纸器 \~english Paper cutting machine. */
	    PTZplPrintMode_C,// = 'C',
	//    /*! \~chinese 延迟切纸器 \~english Delay paper cutter. */
	    PTZplPrintMode_D,// = 'D',
	//    /*! \~chinese RFID \~english RFID. */
	    PTZplPrintMode_F,// = 'F',
	//    /*! \~chinese 自助终端模式 \~english Self-service terminal mode. */
	    PTZplPrintMode_K// = 'K'
	);
	PTZplPrintMode=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTRFIDOperation) {
	    ///*! \~chinese 写数据 \~english write data */
	    //PTRFIDOperation_W = 'W',
	    ///*! \~chinese 读数据 \~english read data */
	    //PTRFIDOperation_R  = 'R'
	//};
	//typedef NS_ENUM(UInt8, PTRFIDOperation) {
	PTRFIDOperation_=(
	//(UInt8, PTRFIDOperation) {
	//    /*! \~chinese 写数据 \~english write data */
	    PTRFIDOperation_W,// = 'W',
	//    /*! \~chinese 读数据 \~english read data */
	    PTRFIDOperation_R//  = 'R'
	);
	PTRFIDOperation=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplRFIDMemory) {
	    ///*! \~chinese 预留区,通常不超过8字节(beginAddr[起始地址] * 2 + bytes[字节数] / 2 <= 8，下同) \~english Reserved，Usually no more than 8 bytes(BeginAddr * 2 + Bytes / 2 < 8, same below) */
	    //PTZplRFIDMemoryReserved    = '0',
	    ///*! \~chinese EPC区，通常不超过16字节(起始地址从2开始) \~english EPC，Usually no more than 16 bytes(The starting address starts at 2) */
	    //PTZplRFIDMemoryEPC         = '1',
	    ///*! \~chinese TID区，通常不超过128字节，不可写数据 \~english TID，Usually no more than 128 bytes，Unwritable data */
	    //PTZplRFIDMemoryTID         = '2',
	    ///*! \~chinese User区，通常不超过128字节 \~english User，Usually no more than 128 bytes */
	    //PTZplRFIDMemoryUser        = '3'
	//};
	//typedef NS_ENUM(UInt8, PTZplRFIDMemory) {
	PTZplRFIDMemory_=(
	//(UInt8, PTZplRFIDMemory) {
	//    /*! \~chinese 预留区,通常不超过8字节(beginAddr[起始地址] * 2 + bytes[字节数] / 2 <= 8，下同) \~english Reserved，Usually no more than 8 bytes(BeginAddr * 2 + Bytes / 2 < 8, same below) */
	    PTZplRFIDMemoryReserved,//    = '0',
	//    /*! \~chinese EPC区，通常不超过16字节(起始地址从2开始) \~english EPC，Usually no more than 16 bytes(The starting address starts at 2) */
	    PTZplRFIDMemoryEPC,//         = '1',
	//    /*! \~chinese TID区，通常不超过128字节，不可写数据 \~english TID，Usually no more than 128 bytes，Unwritable data */
	    PTZplRFIDMemoryTID,//         = '2',
	//    /*! \~chinese User区，通常不超过128字节 \~english User，Usually no more than 128 bytes */
	    PTZplRFIDMemoryUser//        = '3'
	);
	PTZplRFIDMemory=Integer;
	
	
	
	
	
	//@interface PTCommandZPL : NSObject
	//@interface PTCommandZPL : NSObject
	PTCommandZPL=interface(NSObject)//
	['{9506466F-5E8F-4EA7-A012-94ABEFA8A70F}']
		
		//{!
		// *  \~chinese
		// *
		// *  下发给打印机的数据.
		// *
		// *  \~english
		// *
		// *  Data sent to the printer.
		// *
		// }
		//@property (nonatomic, strong, readonly) NSMutableData *cmdData;
		function cmdData:NSMutableData;cdecl;
		procedure setCmdData(cmdData:NSMutableData);cdecl;
		
		//{!
		// *  \~chinese
		// *
		// *  指令使用的编码，默认是GBK.
		// *
		// *  \~english
		// *
		// *  encode，default is GBK.
		// *
		// }
		//@property (nonatomic, assign) NSStringEncoding encoding;
		function encoding:NSStringEncoding;cdecl;
		procedure setEncoding(encoding:NSStringEncoding);cdecl;
		
		////#pragma mark - ZPL Commands
		
		//{!
		// *  \~chinese
		// *  打印自检页
		// *  @brief 打印自检页
		// *
		// *  \~english
		// *  generate a printer configuration label
		// *  @brief generate a printer configuration label
		// *
		// }
		//- (void)printSelfTest;
		procedure printSelfTest;cdecl;
		
		
		//{!
		// *  \~chinese
		// *  走纸一行
		// *  @brief 走纸一行
		// *
		// *  \~english
		// *  feed a line
		// *  @brief feed a line
		// }
		//- (void)zplLineFeed;
		procedure zplLineFeed;cdecl;
		
		
		////#pragma mark ^A
		
		//{!
		// *  \~chinese
		// *
		// *  设置字体
		// *
		// *  @brief 使用字体名设置字体朝向、大小
		// *  @param fontName         字体名
		// *  @param fieldOrientation 字体朝向
		// *  @param characterHeight  字体高度(点) 10~3200
		// *  @param width            字体宽度(点) 10~3200
		// *
		// *  \~english
		// *
		// *  specifies the font to use in a text field.
		// *
		// *  @brief set font orientation and size with font name
		// *  @param fontName         font name.
		// *  @param fieldOrientation field orientation.
		// *  @param characterHeight  font height in dots. 10~3200
		// *  @param width            font width in dots. 10~3200
		// *
		// }
		//- (void)A_SetFont:(PTZplFont)fontName
		 //fieldOrientation:(PTZplOrientation)fieldOrientation
		  //characterHeight:(NSInteger)characterHeight
		            //width:(NSInteger)width;
		 //- (void)A_SetFont:(PTZplFont)fontName  fieldOrientation:(PTZplOrientation)fieldOrientation   characterHeight:(NSInteger)characterHeight             width:(NSInteger)width;
		[MethodName('A_SetFont:fieldOrientation:characterHeight:width:')]
		procedure A_SetFontfieldOrientationcharacterHeightwidth(fontName:PTZplFont;fieldOrientation:PTZplOrientation;characterHeight:NSInteger;width:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  设置字体.
		// *
		// *  @brief 使用字体名设置字体朝向
		// *  @param fontName         字体名
		// *  @param fieldOrientation 字体朝向
		// *
		// *  \~english
		// *
		// *  specifies the font to use in a text field.
		// *
		// *  @brief set font orientation with font name
		// *  @param fontName         font name.
		// *  @param fieldOrientation field orientation.
		// *
		// }
		//- (void)A_SetFont:(PTZplFont)fontName fieldOrientation:(PTZplOrientation)fieldOrientation;
		[MethodName('A_SetFont:fieldOrientation:')]
		procedure A_SetFontfieldOrientation(fontName:PTZplFont;fieldOrientation:PTZplOrientation);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  设置字体.
		// *
		// *  @brief 使用字体名设置字体大小
		// *  @param fontName         字体名
		// *  @param characterHeight  字体高度(点) 10~3200
		// *  @param width            字体宽度(点) 10~3200
		// *
		// *  \~english
		// *
		// *  specifies the font to use in a text field.
		// *
		// *  @brief set font size with font name
		// *  @param fontName         font name.
		// *  @param characterHeight  font height in dots. 10~3200
		// *  @param width            font width in dots. 10~3200
		// *
		// }
		//- (void)A_SetFont:(PTZplFont)fontName
		  //characterHeight:(NSInteger)characterHeight
		            //width:(NSInteger)width;
		 //- (void)A_SetFont:(PTZplFont)fontName   characterHeight:(NSInteger)characterHeight             width:(NSInteger)width;
		[MethodName('A_SetFont:characterHeight:width:')]
		procedure A_SetFontcharacterHeightwidth(fontName:PTZplFont;characterHeight:NSInteger;width:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  设置字体.
		// *
		// *  @brief 使用字体名设置字体
		// *  @param fontName 字体名
		// *
		// *  \~english
		// *
		// *
		// *  specifies the font to use in a text field.
		// *
		// *  @brief set font with font name
		// *  @param fontName font name.
		// *
		// }
		//- (void)A_SetFont:(PTZplFont)fontName;
		procedure A_SetFont(fontName:PTZplFont);cdecl;
		
		
		////#pragma mark ^A@
		
		//{!
		// *  \~chinese
		// *
		// *  使用字体文件设置字体,打印中文建议使用该接口
		// *
		// *  @brief 使用字体文件设置字体朝向、大小
		// *  @param orientation  字体朝向
		// *  @param height       字体高度(点) 10~3200
		// *  @param width        字体宽度(点) 10~3200
		// *  @param location     字体文件所在位置,默认选择E
		// *
		// *  \~english
		// *
		// *  specifies the font by the complete name of a font，this interface is recommended for printing Chinese
		// *
		// *  @brief set font orientation and size with file
		// *  @param orientation  text orientation.
		// *  @param height       charcter heigt in dots (10~32000).
		// *  @param width        charcter width in dots (10~32000).
		// *  @param location     location of font file,default E
		// *
		// }
		//- (void)A_SetFontWithOrientation:(PTZplOrientation)orientation
		                          //height:(NSInteger)height
		                           //width:(NSInteger)width
		                        //location:(PTZplFileLocation)location;
		 //- (void)A_SetFontWithOrientation:(PTZplOrientation)orientation                           height:(NSInteger)height                            width:(NSInteger)width                         location:(PTZplFileLocation)location;
		[MethodName('A_SetFontWithOrientation:height:width:location:')]
		procedure A_SetFontWithOrientationheightwidthlocation(orientation:PTZplOrientation;height:NSInteger;width:NSInteger;location:PTZplFileLocation);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  使用字体文件设置字体
		// *
		// *  @brief 设置字体朝向、大小
		// *  @param orientation  字体朝向
		// *  @param height       字体高度(点) 10~3200
		// *  @param width        字体宽度(点) 10~3200
		// *
		// *  \~english
		// *
		// *  specifies the font by the complete name of a font.
		// *
		// *  @brief set font orientation and size
		// *  @param orientation  text orientation.
		// *  @param height       charcter heigt in dots (10~32000).
		// *  @param width        charcter width in dots (10~32000).
		// *
		// }
		//- (void)A_SetFontWithOrientation:(PTZplOrientation)orientation
		                          //height:(NSInteger)height
		                           //width:(NSInteger)width;
		 //- (void)A_SetFontWithOrientation:(PTZplOrientation)orientation                           height:(NSInteger)height                            width:(NSInteger)width;
		[MethodName('A_SetFontWithOrientation:height:width:')]
		procedure A_SetFontWithOrientationheightwidth(orientation:PTZplOrientation;height:NSInteger;width:NSInteger);cdecl;
		
		
		////#pragma mark ^B0
		
		//{!
		// *  \~chinese
		// *
		// *  生成Aztec码
		// *
		// *  @brief Aztec码
		// *  @param orientation           朝向
		// *  @param magnificationFactor   放大系数
		// *  @param isContainECIC         是否包含ECIC
		// *  @param errorAndSymbol        纠错和符号大小 0,01~99,101~104,201~232,300
		// *  @param isMenuSymbol          是否包含菜单指示符
		// *  @param appendSymbolNumber    结构化附加的符号数量 1~26
		// *  @param appendOptionalID      用于结构化附加的可选ID字段
		// *
		// *  \~english
		// *
		// *  Aztec Bar Code
		// *
		// *  @brief Aztec Bar Code
		// *  @param orientation           orientation.
		// *  @param magnificationFactor   magnification factor.
		// *  @param isContainECIC         whether data contains ECICs.
		// *  @param errorAndSymbol        error control and symbol size/type indicator. 0,01~99,101~104,201~232,300.
		// *  @param isMenuSymbol          whether this symbol is to be a menu (bar code reader initialization) symbol.
		// *  @param appendSymbolNumber    number of symbols for structured append. 1~26
		// *  @param appendOptionalID      optional ID field for structured append.
		// *
		// }
		//- (void)B0_BacodeAztecWithOrientation:(PTZplOrientation)orientation
		                  //magnificationFactor:(NSInteger)magnificationFactor
		                        //isContainECIC:(PTZplBool)isContainECIC
		                       //errorAndSymbol:(NSInteger)errorAndSymbol
		                         //isMenuSymbol:(PTZplBool)isMenuSymbol
		                   //appendSymbolNumber:(NSInteger)appendSymbolNumber
		                     //appendOptionalID:(NSString *)appendOptionalID;
		 //- (void)B0_BacodeAztecWithOrientation:(PTZplOrientation)orientation                   magnificationFactor:(NSInteger)magnificationFactor                         isContainECIC:(PTZplBool)isContainECIC                        errorAndSymbol:(NSInteger)errorAndSymbol                          isMenuSymbol:(PTZplBool)isMenuSymbol                    appendSymbolNumber:(NSInteger)appendSymbolNumber                      appendOptionalID:(NSString *)appendOptionalID;
		[MethodName('B0_BacodeAztecWithOrientation:magnificationFactor:isContainECIC:errorAndSymbol:isMenuSymbol:appendSymbolNumber:appendOptionalID:')]
		procedure B0_BacodeAztecWithOrientationmagnificationFactorisContainECICerrorAndSymbolisMenuSymbolappendSymbolNumberappendOptionalID(orientation:PTZplOrientation;magnificationFactor:NSInteger;isContainECIC:PTZplBool;errorAndSymbol:NSInteger;isMenuSymbol:PTZplBool;appendSymbolNumber:NSInteger;appendOptionalID:NSString);cdecl;
		
		
		
		
		////#pragma mark ^B1
		
		//{!
		// *  \~chinese
		// *
		// *  生成Code11码
		// *
		// *  @brief Code11码
		// *  @param orientation           朝向
		// *  @param checkDigit            校验位 Y->1 N->2
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *
		// *  \~english
		// *
		// *  Code 11 Bar Code
		// *
		// *  @brief Code 11 Bar Code
		// *  @param orientation           orientation.
		// *  @param checkDigit            check digit Y->1 N->2.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *
		// }
		//- (void)B1_BacodeCode11WithOrientation:(PTZplOrientation)orientation
		                            //checkDigit:(PTZplBool)checkDigit
		                         //barcodeHeight:(NSInteger)barcodeHeight
		                    //interpretationLine:(PTZplBool)interpretationLine
		                             //aboveCode:(PTZplBool)aboveCode;
		 //- (void)B1_BacodeCode11WithOrientation:(PTZplOrientation)orientation                             checkDigit:(PTZplBool)checkDigit                          barcodeHeight:(NSInteger)barcodeHeight                     interpretationLine:(PTZplBool)interpretationLine                              aboveCode:(PTZplBool)aboveCode;
		[MethodName('B1_BacodeCode11WithOrientation:checkDigit:barcodeHeight:interpretationLine:aboveCode:')]
		procedure B1_BacodeCode11WithOrientationcheckDigitbarcodeHeightinterpretationLineaboveCode(orientation:PTZplOrientation;checkDigit:PTZplBool;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool);cdecl;
		
		
		////#pragma mark ^B3
		
		//{!
		// *  \~chinese
		// *
		// *  生成Code39码
		// *
		// *  @brief Code39码
		// *  @param orientation           朝向
		// *  @param checkDigit            Mod-43 校验位
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *
		// *  \~english
		// *
		// *  Code 39 Bar Code
		// *
		// *  @brief Code 39 Bar Code
		// *  @param orientation           orientation.
		// *  @param checkDigit            Mod-43 check digit.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *
		// }
		//- (void)B3_BacodeCode39WithOrientation:(PTZplOrientation)orientation
		                            //checkDigit:(PTZplBool)checkDigit
		                         //barcodeHeight:(NSInteger)barcodeHeight
		                    //interpretationLine:(PTZplBool)interpretationLine
		                             //aboveCode:(PTZplBool)aboveCode;
		 //- (void)B3_BacodeCode39WithOrientation:(PTZplOrientation)orientation                             checkDigit:(PTZplBool)checkDigit                          barcodeHeight:(NSInteger)barcodeHeight                     interpretationLine:(PTZplBool)interpretationLine                              aboveCode:(PTZplBool)aboveCode;
		[MethodName('B3_BacodeCode39WithOrientation:checkDigit:barcodeHeight:interpretationLine:aboveCode:')]
		procedure B3_BacodeCode39WithOrientationcheckDigitbarcodeHeightinterpretationLineaboveCode(orientation:PTZplOrientation;checkDigit:PTZplBool;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool);cdecl;
		
		
		////#pragma mark ^B4 Code 49 码
		
		//{!
		// *  \~chinese
		// *
		// *  生成Code49码
		// *
		// *  @brief Code49码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param style                 解释行样式
		// *
		// *  \~english
		// *
		// *  Code 49 Bar Code
		// *
		// *  @brief Code 49 Bar Code
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param style                 interpretation line style.
		// *
		// }
		//- (void)B4_BacodePlanetCodeWithOrientation:(PTZplOrientation)orientation
		                             //barcodeHeight:(NSInteger)barcodeHeight
		                   //interpretationLineStyle:(PTCode49InterpretationLineStyle)style;
		 //- (void)B4_BacodePlanetCodeWithOrientation:(PTZplOrientation)orientation                              barcodeHeight:(NSInteger)barcodeHeight                    interpretationLineStyle:(PTCode49InterpretationLineStyle)style;
		[MethodName('B4_BacodePlanetCodeWithOrientation:barcodeHeight:interpretationLineStyle:')]
		procedure B4_BacodePlanetCodeWithOrientationbarcodeHeightinterpretationLineStyle(orientation:PTZplOrientation;barcodeHeight:NSInteger;style:PTCode49InterpretationLineStyle);cdecl;
		
		
		////#pragma mark ^B7 PDF417 码
		
		//{!
		// *  \~chinese
		// *
		// *  生成PDF417码
		// *
		// *  @brief PDF417码
		// *  @param orientation       朝向
		// *  @param barcodeHeight     各层的条码高度(点),不建议取1
		// *  @param securityLevel     安全级别 1~8
		// *  @param columns           要编码的数据列数 1~30
		// *  @param rows              要编码的行数 3~90
		// *  @param truncation        是否截断层右行指示符和终止图案
		// *
		// *  \~english
		// *
		// *  PDF417 Bar Code
		// *
		// *  @brief PDF417 Bar Code
		// *  @param orientation       orientation
		// *  @param barcodeHeight     bar code height for individual rows (in dots).1 is not a recommended value.
		// *  @param securityLevel     security level, 1~8.
		// *  @param columns           number of data columns to encode, 1~30.
		// *  @param rows              number of rows to encode, 3~90.
		// *  @param truncation        whether truncate right row indicators and stop pattern.
		// *
		// }
		//- (void)B7_BarcodePDF417CodeWithOrientation:(PTZplOrientation)orientation
		                              //barcodeHeight:(NSInteger)barcodeHeight
		                              //securityLevel:(NSInteger)securityLevel
		                                    //columns:(NSInteger)columns
		                                       //rows:(NSInteger)rows
		                                 //truncation:(PTZplBool)truncation;
		 //- (void)B7_BarcodePDF417CodeWithOrientation:(PTZplOrientation)orientation                               barcodeHeight:(NSInteger)barcodeHeight                               securityLevel:(NSInteger)securityLevel                                     columns:(NSInteger)columns                                        rows:(NSInteger)rows                                  truncation:(PTZplBool)truncation;
		[MethodName('B7_BarcodePDF417CodeWithOrientation:barcodeHeight:securityLevel:columns:rows:truncation:')]
		procedure B7_BarcodePDF417CodeWithOrientationbarcodeHeightsecurityLevelcolumnsrowstruncation(orientation:PTZplOrientation;barcodeHeight:NSInteger;securityLevel:NSInteger;columns:NSInteger;rows:NSInteger;truncation:PTZplBool);cdecl;
		
		////#pragma mark ^B8 EAN-8 条码
		
		//{!
		// *  \~chinese
		// *
		// *  生成EAN-8码
		// *
		// *  @brief EAN-8码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *
		// *  \~english
		// *
		// *  EAN-8 Bar Code
		// *
		// *  @brief EAN-8 Bar Code
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *
		// }
		//- (void)B8_BacodeEAN8WithOrientation:(PTZplOrientation)orientation
		                       //barcodeHeight:(NSInteger)barcodeHeight
		                  //interpretationLine:(PTZplBool)interpretationLine
		                           //aboveCode:(PTZplBool)aboveCode;
		 //- (void)B8_BacodeEAN8WithOrientation:(PTZplOrientation)orientation                        barcodeHeight:(NSInteger)barcodeHeight                   interpretationLine:(PTZplBool)interpretationLine                            aboveCode:(PTZplBool)aboveCode;
		[MethodName('B8_BacodeEAN8WithOrientation:barcodeHeight:interpretationLine:aboveCode:')]
		procedure B8_BacodeEAN8WithOrientationbarcodeHeightinterpretationLineaboveCode(orientation:PTZplOrientation;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool);cdecl;
		
		
		////#pragma mark ^B9 UPC-E 条码
		
		//{!
		// *  \~chinese
		// *
		// *  生成UPC-E码
		// *
		// *  @brief UPC-E码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *
		// *  \~english
		// *
		// *  UPC-E Bar Code
		// *
		// *  @brief UPC-E Bar Code
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *
		// }
		//- (void)B9_BarcodeUPCE8CodeWithOrientation:(PTZplOrientation)orientation
		                             //barcodeHeight:(NSInteger)barcodeHeight
		                        //interpretationLine:(PTZplBool)interpretationLine
		                                 //aboveCode:(PTZplBool)aboveCode
		                                //checkDigit:(PTZplBool)checkDigit;
		 //- (void)B9_BarcodeUPCE8CodeWithOrientation:(PTZplOrientation)orientation                              barcodeHeight:(NSInteger)barcodeHeight                         interpretationLine:(PTZplBool)interpretationLine                                  aboveCode:(PTZplBool)aboveCode                                 checkDigit:(PTZplBool)checkDigit;
		[MethodName('B9_BarcodeUPCE8CodeWithOrientation:barcodeHeight:interpretationLine:aboveCode:checkDigit:')]
		procedure B9_BarcodeUPCE8CodeWithOrientationbarcodeHeightinterpretationLineaboveCodecheckDigit(orientation:PTZplOrientation;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool;checkDigit:PTZplBool);cdecl;
		
		
		////#pragma mark ^BA Code 93 条码
		
		//{!
		// *  \~chinese
		// *
		// *  生成Code93码
		// *
		// *  @brief Code93码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *
		// *  \~english
		// *
		// *  Code 93 Bar Code
		// *
		// *  @brief Code 93 Bar Code
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *
		// }
		//- (void)BA_BarcodeCode93WithOrientation:(PTZplOrientation)orientation
		                          //barcodeHeight:(NSInteger)barcodeHeight
		                     //interpretationLine:(PTZplBool)interpretationLine
		                              //aboveCode:(PTZplBool)aboveCode
		                             //checkDigit:(PTZplBool)checkDigit;
		 //- (void)BA_BarcodeCode93WithOrientation:(PTZplOrientation)orientation                           barcodeHeight:(NSInteger)barcodeHeight                      interpretationLine:(PTZplBool)interpretationLine                               aboveCode:(PTZplBool)aboveCode                              checkDigit:(PTZplBool)checkDigit;
		[MethodName('BA_BarcodeCode93WithOrientation:barcodeHeight:interpretationLine:aboveCode:checkDigit:')]
		procedure BA_BarcodeCode93WithOrientationbarcodeHeightinterpretationLineaboveCodecheckDigit(orientation:PTZplOrientation;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool;checkDigit:PTZplBool);cdecl;
		
		
		////#pragma mark ^BB CodeBlock 条码
		
		//{!
		// *  \~chinese
		// *
		// *  CODABLOCK 条码
		// *
		// *  @brief CODABLOCK 条码
		// *  @param orientation      朝向
		// *  @param barcodeHeight    条码高度(点) 1~32000
		// *  @param securityLevel    安全
		// *  @param perRowCharacters 每行的字符数 2-62
		// *  @param rows             要编码的行数
		// *  @param mode             模式
		// *
		// *  \~english
		// *
		// *  CODABLOCK Bar Code.
		// *
		// *  @brief CODABLOCK Bar Code.
		// *  @param orientation      orientation.
		// *  @param barcodeHeight    bar code height for individual rows in dots, 1~32000.
		// *  @param securityLevel    security.
		// *  @param perRowCharacters number of characters per row, 2-62.
		// *  @param rows             number of rows to encode.
		// *  @param mode             mode.
		// *
		// }
		//- (void)BB_BarcodeCodeBlockWithOrientation:(PTZplOrientation)orientation
		                             //barcodeHeight:(NSInteger)barcodeHeight
		                             //securityLevel:(PTZplBool)securityLevel
		                          //perRowCharacters:(NSInteger)perRowCharacters
		                                      //rows:(NSInteger)rows
		                                      //mode:(PTZplCodeBlockBarCodeMode)mode;
		 //- (void)BB_BarcodeCodeBlockWithOrientation:(PTZplOrientation)orientation                              barcodeHeight:(NSInteger)barcodeHeight                              securityLevel:(PTZplBool)securityLevel                           perRowCharacters:(NSInteger)perRowCharacters                                       rows:(NSInteger)rows                                       mode:(PTZplCodeBlockBarCodeMode)mode;
		[MethodName('BB_BarcodeCodeBlockWithOrientation:barcodeHeight:securityLevel:perRowCharacters:rows:mode:')]
		procedure BB_BarcodeCodeBlockWithOrientationbarcodeHeightsecurityLevelperRowCharactersrowsmode(orientation:PTZplOrientation;barcodeHeight:NSInteger;securityLevel:PTZplBool;perRowCharacters:NSInteger;rows:NSInteger;mode:PTZplCodeBlockBarCodeMode);cdecl;
		
		////#pragma mark ^BC Code 128 条码
		
		//{!
		// *  \~chinese
		// *
		// *  生成Code128码(子集A、B和C)
		// *
		// *  @brief Code128码(子集A、B和C)
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *  @param checkDigit            UCC校检位
		// *  @param mode                  模式
		// *
		// *  \~english
		// *
		// *  Code 128 Bar Code (Subsets A, B, and C).
		// *
		// *  @brief Code 128 Bar Code (Subsets A, B, and C)
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *  @param checkDigit            UCC check digit.
		// *  @param mode                  mode.
		// *
		// }
		//- (void)BC_BarcodeCode128WithOrientation:(PTZplOrientation)orientation
		                           //barcodeHeight:(NSInteger)barcodeHeight
		                      //interpretationLine:(PTZplBool)interpretationLine
		                               //aboveCode:(PTZplBool)aboveCode
		                              //checkDigit:(PTZplBool)checkDigit
		                                    //mode:(PTZplCode128Mode)mode;
		 //- (void)BC_BarcodeCode128WithOrientation:(PTZplOrientation)orientation                            barcodeHeight:(NSInteger)barcodeHeight                       interpretationLine:(PTZplBool)interpretationLine                                aboveCode:(PTZplBool)aboveCode                               checkDigit:(PTZplBool)checkDigit                                     mode:(PTZplCode128Mode)mode;
		[MethodName('BC_BarcodeCode128WithOrientation:barcodeHeight:interpretationLine:aboveCode:checkDigit:mode:')]
		procedure BC_BarcodeCode128WithOrientationbarcodeHeightinterpretationLineaboveCodecheckDigitmode(orientation:PTZplOrientation;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool;checkDigit:PTZplBool;mode:PTZplCode128Mode);cdecl;
		
		
		////#pragma mark ^BD UPS Maxicode 条码
		
		//{!
		// *  \~chinese
		// *
		// *  UPS MaxiCode 条码.
		// *
		// *  @brief UPS MaxiCode 条码
		// *  @param mode                 模式
		// *  @param symbolNumber         符号编号 1~8
		// *  @param totalSymbolNumbers   符号总数 1~8
		// *
		// *  \~english
		// *
		// *  UPS MaxiCode Bar Code
		// *
		// *  @brief UPS MaxiCode Bar Code
		// *  @param mode                 mode.
		// *  @param symbolNumber         symbol number, 1~8.
		// *  @param totalSymbolNumbers   total number of symbols, 1~8.
		// *
		// }
		//- (void)BD_BarcodeUPSMaxicodeWithMode:(PTZplUpsMaxiCodeMode)mode
		                         //symbolNumber:(NSInteger)symbolNumber
		                   //totalSymbolNumbers:(NSInteger)totalSymbolNumbers;
		 //- (void)BD_BarcodeUPSMaxicodeWithMode:(PTZplUpsMaxiCodeMode)mode                          symbolNumber:(NSInteger)symbolNumber                    totalSymbolNumbers:(NSInteger)totalSymbolNumbers;
		[MethodName('BD_BarcodeUPSMaxicodeWithMode:symbolNumber:totalSymbolNumbers:')]
		procedure BD_BarcodeUPSMaxicodeWithModesymbolNumbertotalSymbolNumbers(mode:PTZplUpsMaxiCodeMode;symbolNumber:NSInteger;totalSymbolNumbers:NSInteger);cdecl;
		
		
		////#pragma mark ^BE EAN-18 条码
		
		//{!
		// *  \~chinese
		// *
		// *  生成EAN-13码
		// *
		// *  @brief EAN-13码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *
		// *  \~english
		// *
		// *  EAN-13 Bar Code
		// *
		// *  @brief EAN-13 Bar Code
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *
		// }
		//- (void)BE_BacodeEAN13WithOrientation:(PTZplOrientation)orientation
		                        //barcodeHeight:(NSInteger)barcodeHeight
		                   //interpretationLine:(PTZplBool)interpretationLine
		                            //aboveCode:(PTZplBool)aboveCode;
		 //- (void)BE_BacodeEAN13WithOrientation:(PTZplOrientation)orientation                         barcodeHeight:(NSInteger)barcodeHeight                    interpretationLine:(PTZplBool)interpretationLine                             aboveCode:(PTZplBool)aboveCode;
		[MethodName('BE_BacodeEAN13WithOrientation:barcodeHeight:interpretationLine:aboveCode:')]
		procedure BE_BacodeEAN13WithOrientationbarcodeHeightinterpretationLineaboveCode(orientation:PTZplOrientation;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool);cdecl;
		
		////#pragma mark ^BF 微型 PDF417 条码
		
		//{!
		// *  \~chinese
		// *
		// *  生成MicroPDF417条码
		// *
		// *  @brief MicroPDF417条码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～9999
		// *  @param mode                  模式 0~33
		// *
		// *  \~english
		// *
		// *  MicroPDF417 Bar Code.
		// *
		// *  @brief MicroPDF417 Bar Code
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~9999.
		// *  @param mode                  mode, 0~33.
		// *
		// }
		//- (void)BF_BarcodeMicroPDF417WithOrientation:(PTZplOrientation)orientation
		                               //barcodeHeight:(NSInteger)barcodeHeight
		                                        //mode:(NSInteger)mode;
		 //- (void)BF_BarcodeMicroPDF417WithOrientation:(PTZplOrientation)orientation                                barcodeHeight:(NSInteger)barcodeHeight                                         mode:(NSInteger)mode;
		[MethodName('BF_BarcodeMicroPDF417WithOrientation:barcodeHeight:mode:')]
		procedure BF_BarcodeMicroPDF417WithOrientationbarcodeHeightmode(orientation:PTZplOrientation;barcodeHeight:NSInteger;mode:NSInteger);cdecl;
		
		
		////#pragma mark ^BI 工业二五码
		
		//{!
		// *  \~chinese
		// *
		// *  生成工业二五码
		// *
		// *  @brief 工业二五码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *
		// *  \~english
		// *
		// *  Industrial 2 of 5 Bar Codes.
		// *
		// *  @brief Industrial 2 of 5 Bar Codes
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *
		// }
		//- (void)BI_BacodeIndustrial2of5WithOrientation:(PTZplOrientation)orientation
		                                 //barcodeHeight:(NSInteger)barcodeHeight
		                            //interpretationLine:(PTZplBool)interpretationLine
		                                     //aboveCode:(PTZplBool)aboveCode;
		 //- (void)BI_BacodeIndustrial2of5WithOrientation:(PTZplOrientation)orientation                                  barcodeHeight:(NSInteger)barcodeHeight                             interpretationLine:(PTZplBool)interpretationLine                                      aboveCode:(PTZplBool)aboveCode;
		[MethodName('BI_BacodeIndustrial2of5WithOrientation:barcodeHeight:interpretationLine:aboveCode:')]
		procedure BI_BacodeIndustrial2of5WithOrientationbarcodeHeightinterpretationLineaboveCode(orientation:PTZplOrientation;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool);cdecl;
		
		
		////#pragma mark ^BJ 标准二五码
		
		//{!
		// *  \~chinese
		// *
		// *  生成标准二五码
		// *
		// *  @brief 标准二五码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *
		// *  \~english
		// *
		// *  Standard 2 of 5 Bar Code.
		// *
		// *  @brief Standard 2 of 5 Bar Code
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *
		// }
		//- (void)BJ_BacodeStandard2of5WithOrientation:(PTZplOrientation)orientation
		                               //barcodeHeight:(NSInteger)barcodeHeight
		                          //interpretationLine:(PTZplBool)interpretationLine
		                                   //aboveCode:(PTZplBool)aboveCode;
		 //- (void)BJ_BacodeStandard2of5WithOrientation:(PTZplOrientation)orientation                                barcodeHeight:(NSInteger)barcodeHeight                           interpretationLine:(PTZplBool)interpretationLine                                    aboveCode:(PTZplBool)aboveCode;
		[MethodName('BJ_BacodeStandard2of5WithOrientation:barcodeHeight:interpretationLine:aboveCode:')]
		procedure BJ_BacodeStandard2of5WithOrientationbarcodeHeightinterpretationLineaboveCode(orientation:PTZplOrientation;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool);cdecl;
		
		
		////#pragma mark ^BK ANSI Codebar
		
		//{!
		// *  \~chinese
		// *
		// *  生成ANSI Codabar 条码
		// *
		// *  @brief ANSI Codabar条码
		// *  @param orientation           朝向
		// *  @param checkDigit            校检位
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *  @param startCharacter       指定起始字符 (A,B,C,D)
		// *  @param stopCharacter        指定终止字符 (A,B,C,D)
		// *
		// *  \~english
		// *
		// *  ANSI Codabar Bar Code.
		// *
		// *  @brief ANSI Codabar Bar Code
		// *  @param orientation           orientation.
		// *  @param checkDigit            check digit.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *  @param startCharacter        designates a start character. (A,B,C,D)
		// *  @param stopCharacter         designates stop character. (A,B,C,D)
		// *
		// }
		//- (void)BK_BarcodeANSICodebarWithOrientation:(PTZplOrientation)orientation
		                                  //checkDigit:(PTZplBool)checkDigit
		                               //barcodeHeight:(NSInteger)barcodeHeight
		                          //interpretationLine:(PTZplBool)interpretationLine
		                                   //aboveCode:(PTZplBool)aboveCode
		                              //startCharacter:(NSString *)startCharacter
		                               //stopCharacter:(NSString *)stopCharacter;
		 //- (void)BK_BarcodeANSICodebarWithOrientation:(PTZplOrientation)orientation                                   checkDigit:(PTZplBool)checkDigit                                barcodeHeight:(NSInteger)barcodeHeight                           interpretationLine:(PTZplBool)interpretationLine                                    aboveCode:(PTZplBool)aboveCode                               startCharacter:(NSString *)startCharacter                                stopCharacter:(NSString *)stopCharacter;
		[MethodName('BK_BarcodeANSICodebarWithOrientation:checkDigit:barcodeHeight:interpretationLine:aboveCode:startCharacter:stopCharacter:')]
		procedure BK_BarcodeANSICodebarWithOrientationcheckDigitbarcodeHeightinterpretationLineaboveCodestartCharacterstopCharacter(orientation:PTZplOrientation;checkDigit:PTZplBool;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool;startCharacter:NSString;stopCharacter:NSString);cdecl;
		
		
		
		////#pragma mark ^BL LOGMARS 条码
		
		//{!
		// *  \~chinese
		// *
		// *  LOGMARS 条码
		// *
		// *  @brief LOGMARS条码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param isPrint    是否在条码上方打印解释行
		// *
		// *  \~english
		// *
		// *  LOGMARS Bar Code.
		// *
		// *  @brief LOGMARS Bar Code
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param isPrint    whether print interpretation line above code.
		// *
		// }
		//- (void)BL_BacodeLOGMARSWithOrientation:(PTZplOrientation)orientation
		                          //barcodeHeight:(NSInteger)barcodeHeight
		       //printInterpretationLineAboveCode:(PTZplBool)isPrint;
		 //- (void)BL_BacodeLOGMARSWithOrientation:(PTZplOrientation)orientation                           barcodeHeight:(NSInteger)barcodeHeight        printInterpretationLineAboveCode:(PTZplBool)isPrint;
		[MethodName('BL_BacodeLOGMARSWithOrientation:barcodeHeight:printInterpretationLineAboveCode:')]
		procedure BL_BacodeLOGMARSWithOrientationbarcodeHeightprintInterpretationLineAboveCode(orientation:PTZplOrientation;barcodeHeight:NSInteger;isPrint:PTZplBool);cdecl;
		
		
		////#pragma mark ^BQ QRcode 二维码
		
		//{!
		// *  \~chinese
		// *
		// *  生成QR码
		// *
		// *  @brief QR码
		// *  @param orientation       朝向
		// *  @param model             模式
		// *  @param magnification     放大系数 1~10
		// *  @param reliabilityLevel  可靠性等级
		// *
		// *  \~english
		// *
		// *  QR Code Bar Code.
		// *
		// *  @brief QR Code Bar Code
		// *  @param orientation       orientation.
		// *  @param model             orientation.
		// *  @param magnification     magnification factor.
		// *  @param reliabilityLevel  reliability level.
		// *
		// }
		//- (void)BQ_BarcodeQRcodeWithOrientation:(PTZplOrientation)orientation
		                                  //model:(PTZplQrModel)model
		                          //magnification:(NSInteger)magnification
		                       //reliabilityLevel:(PTZplQrReliabilityLevel)reliabilityLevel;
		 //- (void)BQ_BarcodeQRcodeWithOrientation:(PTZplOrientation)orientation                                   model:(PTZplQrModel)model                           magnification:(NSInteger)magnification                        reliabilityLevel:(PTZplQrReliabilityLevel)reliabilityLevel;
		[MethodName('BQ_BarcodeQRcodeWithOrientation:model:magnification:reliabilityLevel:')]
		procedure BQ_BarcodeQRcodeWithOrientationmodelmagnificationreliabilityLevel(orientation:PTZplOrientation;model:PTZplQrModel;magnification:NSInteger;reliabilityLevel:PTZplQrReliabilityLevel);cdecl;
		
		
		////#pragma mark ^BS
		
		//{!
		// *  \~chinese
		// *
		// *  @brief
		// *  生成UPC/EAN扩展码
		// *
		// *  @brief UPC/EAN扩展码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～32000
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *
		// *  \~english
		// *
		// *  UPC/EAN Extensions.
		// *
		// *  @brief UPC/EAN Extensions
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~32000.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *
		// }
		//- (void)BS_BacodeUPCEANExtensionsWithOrientation:(PTZplOrientation)orientation
		                                   //barcodeHeight:(NSInteger)barcodeHeight
		                              //interpretationLine:(PTZplBool)interpretationLine
		                                       //aboveCode:(PTZplBool)aboveCode;
		 //- (void)BS_BacodeUPCEANExtensionsWithOrientation:(PTZplOrientation)orientation                                    barcodeHeight:(NSInteger)barcodeHeight                               interpretationLine:(PTZplBool)interpretationLine                                        aboveCode:(PTZplBool)aboveCode;
		[MethodName('BS_BacodeUPCEANExtensionsWithOrientation:barcodeHeight:interpretationLine:aboveCode:')]
		procedure BS_BacodeUPCEANExtensionsWithOrientationbarcodeHeightinterpretationLineaboveCode(orientation:PTZplOrientation;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool);cdecl;
		
		
		////#pragma mark ^BU UPC-A 条码
		
		//{!
		// *  \~chinese
		// *
		// *  生成UPC/EAN扩展码
		// *
		// *  @brief UPC/EAN扩展码
		// *  @param orientation           朝向
		// *  @param barcodeHeight         条码高度(点) 1～9999
		// *  @param interpretationLine    是否打印解释行
		// *  @param aboveCode             解释行是否打印于条码上方
		// *  @param checkDigit            是否打印校检位
		// *
		// *  \~english
		// *
		// *  UPC/EAN Extensions.
		// *
		// *  @brief UPC/EAN Extensions
		// *  @param orientation           orientation.
		// *  @param barcodeHeight         bar code height in dots,1~9999.
		// *  @param interpretationLine    whether print interpretation line.
		// *  @param aboveCode             whether print interpretation line above code.
		// *  @param checkDigit            whether print check digit.
		// *
		// }
		//- (void)BU_BarcodeUPCAWithOrientation:(PTZplOrientation)orientation
		                        //barcodeHeight:(NSInteger)barcodeHeight
		                   //interpretationLine:(PTZplBool)interpretationLine
		                            //aboveCode:(PTZplBool)aboveCode
		                           //checkDigit:(PTZplBool)checkDigit;
		 //- (void)BU_BarcodeUPCAWithOrientation:(PTZplOrientation)orientation                         barcodeHeight:(NSInteger)barcodeHeight                    interpretationLine:(PTZplBool)interpretationLine                             aboveCode:(PTZplBool)aboveCode                            checkDigit:(PTZplBool)checkDigit;
		[MethodName('BU_BarcodeUPCAWithOrientation:barcodeHeight:interpretationLine:aboveCode:checkDigit:')]
		procedure BU_BarcodeUPCAWithOrientationbarcodeHeightinterpretationLineaboveCodecheckDigit(orientation:PTZplOrientation;barcodeHeight:NSInteger;interpretationLine:PTZplBool;aboveCode:PTZplBool;checkDigit:PTZplBool);cdecl;
		
		
		////#pragma mark ^BY
		
		//{!
		// *  \~chinese
		// *
		// *  设置条码默认值.
		// *
		// *  @brief 设置条码默认大小、窄宽比
		// *  @param moduleWidth   模块宽度(点) 1-10
		// *  @param ratio         窄条宽条比 2.0-3.0
		// *  @param barcodeHeight 条码高度(点)
		// *
		// *  \~english
		// *
		// *  command is used to change the default values for the module width (in dots), the wide bar to narrow bar width ratio and the bar code height (in dots).
		// *
		// *  @brief change the default values of barcode size and narrow bar width ratio
		// *  @param moduleWidth   module width in dots.
		// *  @param ratio         wide bar to narrow bar width ratio, 2.0~3.0.
		// *  @param barcodeHeight bar code height in dots.
		// *
		// }
		//- (void)BY_BarcodeFieldDefaultWithModuleWidth:(NSInteger)moduleWidth
		                                        //ratio:(float)ratio
		                                //barcodeHeight:(NSInteger)barcodeHeight;
		 //- (void)BY_BarcodeFieldDefaultWithModuleWidth:(NSInteger)moduleWidth                                         ratio:(float)ratio                                 barcodeHeight:(NSInteger)barcodeHeight;
		[MethodName('BY_BarcodeFieldDefaultWithModuleWidth:ratio:barcodeHeight:')]
		procedure BY_BarcodeFieldDefaultWithModuleWidthratiobarcodeHeight(moduleWidth:NSInteger;ratio:single;barcodeHeight:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  设置条码默认值.
		// *
		// *  @brief 设置条码默认宽度
		// *  @param moduleWidth   模块宽度(点) 1-10
		// *
		// *  \~english
		// *
		// *  command is used to change the default values for the module width (in dots), the wide bar to narrow bar width ratio and the bar code height (in dots).
		// *
		// *  @brief change the default values of module width
		// *  @param moduleWidth   module width in dots.
		// *
		// }
		//- (void)BY_BarcodeFieldDefaultWithModuleWidth:(NSInteger)moduleWidth;
		procedure BY_BarcodeFieldDefaultWithModuleWidth(moduleWidth:NSInteger);cdecl;
		
		
		////#pragma mark ^CC
		
		//{!
		// *  \~chinese
		// *
		// *  修改格式指令前缀，默认为字符'^'
		// *
		// *  @brief 修改格式指令前缀
		// *  @param character    需要修改的字符,任意ASCII字符
		// *
		// *  \~english
		// *
		// *  change the format command prefix, The default prefix is the caret (^).
		// *
		// *  @brief change the format command prefix
		// *  @param  character character change, any ASCII character is accepted.
		// *
		// }
		//- (void)CC_ChangeCaret:(NSString *)character;
		procedure CC_ChangeCaret(character:NSString);cdecl;
		
		
		////#pragma mark ^CD
		
		//{!
		// *  \~chinese
		// *
		// *  修改指令分隔符，默认为字符','
		// *
		// *  @brief 修改指令分隔符
		// *  @param character    需要修改的字符,任意ASCII字符
		// *
		// *  \~english
		// *
		// *  change the delimiter character,The default delimiter is a comma (,).
		// *
		// *  @brief change the delimiter character
		// *  @param  character character change, any ASCII character is accepted.
		// *
		// }
		//- (void)CD_ChangeDelimiter:(NSString *)charactor;
		procedure CD_ChangeDelimiter(charactor:NSString);cdecl;
		
		
		////#pragma mark ^CF
		
		//{!
		// *  \~chinese
		// *
		// *  更改字母数字默认字体
		// *
		// *  @brief 更改字母数字默认字体、大小
		// *  @param font     默认字体
		// *  @param width    字符宽度(点) 0~32000
		// *  @param height   字符高度(点) 0~32000
		// *
		// *  \~english
		// *
		// *  Change Alphanumeric Default Font
		// *
		// *  @brief change alphanumeric default font and size
		// *  @param font     specified default font.
		// *  @param width    character width in dots, 0~32000.
		// *  @param height   character height in dots, 0~32000.
		// *
		// }
		//- (void)CF_ChangeDefaultFont:(PTZplFont)font
		                       //width:(NSInteger)width
		                      //height:(NSInteger)height;
		 //- (void)CF_ChangeDefaultFont:(PTZplFont)font                        width:(NSInteger)width                       height:(NSInteger)height;
		[MethodName('CF_ChangeDefaultFont:width:height:')]
		procedure CF_ChangeDefaultFontwidthheight(font:PTZplFont;width:NSInteger;height:NSInteger);cdecl;overload;
		

		//{!
		// *  \~chinese
		// *
		// *  更改字母数字默认字体
		// *
		// *  @brief 更改字母数字默认字体
		// *  @param font     默认字体
		// *
		// *  \~english
		// *
		// *  Change Alphanumeric Default Font
		// *
		// *  @brief change alphanumeric default font
		// *  @param font     specified default font.
		// *
		// }
		//- (void)CF_ChangeDefaultFont:(PTZplFont)font;
		procedure CF_ChangeDefaultFont(font:PTZplFont);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  更改字母数字默认字体
		// *
		// *  @brief 更改字母数字默认字体大小
		// *  @param width    字符宽度(点) 0~32000
		// *  @param height   字符高度(点) 0~32000
		// *
		// *  \~english
		// *
		// *  Change Alphanumeric Default Font
		// *
		// *  @brief change alphanumeric default font size
		// *  @param width    character width in dots, 0~32000.
		// *  @param height   character height in dots, 0~32000.
		// *
		// }
		//- (void)CF_ChangeDefaultFontWidth:(NSInteger)width height:(NSInteger)height;
		[MethodName('CF_ChangeDefaultFontWidth:height:')]
		procedure CF_ChangeDefaultFontWidthheight(width:NSInteger;height:NSInteger);cdecl;overload;
		
		////#pragma mark ^CI
		
		//{!
		// *  \~chinese
		// *
		// *  设置要用来进行打印的国际字符集,可以在标签上组合打印不同的字符集。
		// *
		// *  @brief 设置字符集
		// *  @param characterSet 字符集 0-36 亚洲编码：14
		// *
		// *  \~english
		// *
		// *  command enables you to call up the international character set you want to use for printing. You can mix character sets on a label.
		// *
		// *  @brief set character set
		// *  @param characterSet desired character set, 0-36.
		// *
		// }
		//- (void)CI_ChangeInternationalCharacterSet:(NSString *)characterSet;
		procedure CI_ChangeInternationalCharacterSet(characterSet:NSString);cdecl;
		
		
		////#pragma mark ^CT
		
		//{!
		// *  \~chinese
		// *
		// *  修改控制指令前缀，默认为字符'~'
		// *
		// *  @brief 修改控制指令前缀
		// *  @param character    需要修改的字符,任意ASCII字符
		// *
		// *  \~english
		// *
		// *  change the control command prefix,The default delimiter is a tilde (~).
		// *
		// *  @brief change the control command prefix
		// *  @param  character character change, any ASCII character is accepted.
		// *
		// }
		//- (void)CT_ChangeTilde:(NSString *)character;
		procedure CT_ChangeTilde(character:NSString);cdecl;
		
		
		////#pragma mark ^CV
		
		//{!
		// *  \~chinese
		// *
		// *  开关条码验证
		// *
		// *  @brief 开关条码验证
		// *  @param codeValidation   是否开启条码验证
		// *
		// *  \~english
		// *
		// *  acts as a switch to turn the code validation function on or off.
		// *
		// *  @brief  turn the code validation function on or off
		// *  @param  codeValidation turn on or off the code validation.
		// *
		// }
		//- (void)CV_CodeValidation:(PTZplBool)codeValidation;
		procedure CV_CodeValidation(codeValidation:PTZplBool);cdecl;
		
		
		////#pragma mark ^CW
		
		//{!
		// *  \~chinese
		// *
		// *  修改字体标识符对应的字体
		// *
		// *  @brief 修改字体标识符对应的字体
		// *  @param fontName          需要修改的标识符
		// *  @param fontDriveLocation 字体存储位置
		// *  @param downloadedFont    标识符对应的字体名
		// *  @param extension         字体后缀(FNT,TTF,TTE)
		// *
		// *  \~english
		// *
		// *  assigns a single alphanumeric character to a font stored in DRAM, memory card, EPROM, or Flash.
		// *
		// *  @brief assigns a single alphanumeric character to a font
		// *  @param fontName          letter of existing font to be substituted, or new font to be added.
		// *  @param fontDriveLocation device to store font in (optional).
		// *  @param downloadedFont    name of the downloaded font to be substituted for the built-in, or as an additional font.
		// *  @param extension         extension (FNT,TTF,TTE)
		// *
		// }
		//- (void)CW_FontIdentifier:(PTZplFont)fontName
		        //fontDriveLocation:(PTZplFileLocation)fontDriveLocation
		           //downloadedFont:(NSString *)downloadedFont
		                //extension:(NSString *)extension;
		 //- (void)CW_FontIdentifier:(PTZplFont)fontName         fontDriveLocation:(PTZplFileLocation)fontDriveLocation            downloadedFont:(NSString *)downloadedFont                 extension:(NSString *)extension;
		[MethodName('CW_FontIdentifier:fontDriveLocation:downloadedFont:extension:')]
		procedure CW_FontIdentifierfontDriveLocationdownloadedFontextension(fontName:PTZplFont;fontDriveLocation:PTZplFileLocation;downloadedFont:NSString;extension:NSString);cdecl;
		
		
		////#pragma mark ^DF
		
		//{!
		// *  \~chinese
		// *
		// *  保存zpl格式命令
		// *
		// *  @brief 保存zpl格式命令
		// *  @param deviceToStoreImage 存储位置
		// *  @param imageName          名称 1~8个字母数字字符
		// *  @param extension          扩展名 (.ZPL)
		// *
		// *  \~english
		// *
		// *  command saves ZPL II format commands as text strings.
		// *
		// *  @brief saves ZPL II format commands
		// *  @param deviceToStoreImage device to store image.
		// *  @param imageName          name(1 to 8 alphanumeric characters).
		// *  @param extension          extension (.ZPL)
		// *
		// }
		//- (void)DF_DownloadFormatWithDevice:(PTZplFileLocation)deviceToStoreImage
		                          //imageName:(NSString *)imageName
		                          //extension:(NSString *)extension;
		 //- (void)DF_DownloadFormatWithDevice:(PTZplFileLocation)deviceToStoreImage                           imageName:(NSString *)imageName                           extension:(NSString *)extension;
		[MethodName('DF_DownloadFormatWithDevice:imageName:extension:')]
		procedure DF_DownloadFormatWithDeviceimageNameextension(deviceToStoreImage:PTZplFileLocation;imageName:NSString;extension:NSString);cdecl;
		
		
		////#pragma mark ^DG 打印图片
		
		//{!
		// *  \~chinese
		// *
		// *  保存图片
		// *
		// *  @brief 保存图片
		// *  @param cgImage            图片
		// *  @param bitmapMode         图片模式
		// *  @param compress           压缩类型
		// *  @param deviceLocation     存储位置
		// *  @param imageName          名称 1~8个字母数字字符
		// *  @param extension          扩展名 (GRF)
		// *
		// *  \~english
		// *
		// *  command downloads an ASCII Hex representation of a graphic image.
		// *
		// *  @brief downloads a graphic image
		// *  @param cgImage            cgImage
		// *  @param bitmapMode         simple black and white image or dithering
		// *  @param compress           type of data compression
		// *  @param deviceLocation     device to store image.
		// *  @param imageName          name(1 to 8 alphanumeric characters).
		// *  @param extension          extension (GRF)
		// *
		// }
		//- (void)DG_DownloadGraphicsWithImage:(CGImageRef)cgImage
		                          //bitmapMode:(PTBitmapMode)bitmapMode
		                            //compress:(PTBitmapCompressMode)compress
		                      //deviceLocation:(PTZplFileLocation)deviceLocation
		                           //imageName:(NSString *)imageName
		                           //extension:(NSString *)extension;
		 //- (void)DG_DownloadGraphicsWithImage:(CGImageRef)cgImage                           bitmapMode:(PTBitmapMode)bitmapMode                             compress:(PTBitmapCompressMode)compress                       deviceLocation:(PTZplFileLocation)deviceLocation                            imageName:(NSString *)imageName                            extension:(NSString *)extension;
		[MethodName('DG_DownloadGraphicsWithImage:bitmapMode:compress:deviceLocation:imageName:extension:')]
		procedure DG_DownloadGraphicsWithImagebitmapModecompressdeviceLocationimageNameextension(cgImage:CGImageRef;bitmapMode:PTBitmapMode;compress:PTBitmapCompressMode;deviceLocation:PTZplFileLocation;imageName:NSString;extension:NSString);cdecl;
		
		
		////#pragma mark ^EG
		
		//{!
		// *  \~chinese
		// *
		// *  清除下载的图像
		// *  @brief 清除下载的图像
		// *
		// *  \~english
		// *
		// *  Erase Download Graphics
		// *  @brief Erase Download Graphics
		// *
		// }
		//- (void)EG_EraseDownloadGraphics;
		procedure EG_EraseDownloadGraphics;cdecl;
		
		
		////#pragma mark ^FD
		
		//{!
		// *  \~chinese
		// *
		// *  定义打印域的数据字符串,域数据可以是除用作命令前缀(^和 ~)外的任意可打印字符。该条指令后面已经增加^FS
		// *
		// *  @brief 定义打印内容
		// *  @param fieldData 用于打印的数据
		// *
		// *  \~english
		// *
		// *  defines the data string for the field. The field data can be any printable character except those used as command prefixes (^ and ~).^FS has been added to the end of this instruction
		// *
		// *  @brief defines the data string for the field
		// *  @param fieldData data to be printed.
		// *
		// }
		//- (void)FD_FieldData:(NSString *)fieldData;
		procedure FD_FieldData(fieldData:NSString);cdecl;
		
		
		////#pragma mark ^FH
		
		//{!
		// *  \~chinese
		// *
		// *  定义域内十六进制指示符
		// *
		// *  @brief 定义十六进制指示符
		// *  @param hexadecimalIndicator 十六进制指示符
		// *
		// *  \~english
		// *
		// *  define Field Hexadecimal Indicator.
		// *
		// *  @brief define Field Hexadecimal Indicator
		// *  @param hexadecimalIndicator Field Hexadecimal Indicator.
		// *
		// }
		//- (void)FH_FieldHexadecimalIndicator:(NSString *)hexadecimalIndicator;
		procedure FH_FieldHexadecimalIndicator(hexadecimalIndicator:NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  定义默认的十六进制指示符 '_'
		// *
		// *  @brief 定义默认的十六进制指示符
		// *  @param hexadecimalIndicator 十六进制指示符
		// *
		// *  \~english
		// *
		// *  define Field Hexadecimal Indicator '_'.
		// *
		// *  @brief define Field Hexadecimal Indicator
		// *  @param hexadecimalIndicator Field Hexadecimal Indicator.
		// *
		// }
		//- (void)FH_FieldHexadecimal;
		procedure FH_FieldHexadecimal;cdecl;
		
		
		////#pragma mark ^FN
		
		//{!
		// *  \~chinese
		// *
		// *  字段编号指令.
		// *
		// *  @brief 带选项的字段编号
		// *  @param fieldNumber  要分配给字段的编号
		// *  @param optional     可选参数
		// *
		// *  \~english
		// *
		// *  command numbers the data fields.
		// *
		// *  @brief numbers the data fields optionally
		// *  @param fieldNumber  number to be assigned to the field
		// *  @param optional     optional parameter
		// *
		// }
		//- (void)FN_FieldNumber:(NSInteger)fieldNumber
		              //optional:(NSString *)optional;
		 //- (void)FN_FieldNumber:(NSInteger)fieldNumber               optional:(NSString *)optional;
		[MethodName('FN_FieldNumber:optional:')]
		procedure FN_FieldNumberoptional(fieldNumber:NSInteger;optional:NSString);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  字段编号指令.
		// *
		// *  @brief 字段编号
		// *  @param fieldNumber  要分配给字段的编号
		// *
		// *  \~english
		// *
		// *  command numbers the data fields.
		// *
		// *  @brief command numbers the data fields
		// *  @param fieldNumber  number to be assigned to the field.
		// *
		// }
		//- (void)FN_FieldNumber:(NSInteger)fieldNumber;
		procedure FN_FieldNumber(fieldNumber:NSInteger);cdecl;
		
		
		////#pragma mark ^FO
		
		//{!
		// *  \~chinese
		// *
		// *  设置域相对于标签起始的起始位置
		// *
		// *  @brief 设置标签起始位置、对齐方式
		// *  @param XAxis         x轴位置(点) (0~32000)
		// *  @param YAxis         y轴位置(点) (0~32000)
		// *  @param justification 对齐方式
		// *
		// *  \~english
		// *
		// *  set a field origin, relative to the label home (LH) position.
		// *
		// *  @brief set a field origin and justification
		// *  @param XAxis         x-axis location in dots. (0~32000)
		// *  @param YAxis         x-axis location (in dots). (0~32000)
		// *  @param justification justification.
		// *
		// }
		//- (void)FO_FieldOriginWithXAxis:(NSInteger)XAxis
		                          //YAxis:(NSInteger)YAxis
		                  //justification:(PTZplJustification)justification;
		 //- (void)FO_FieldOriginWithXAxis:(NSInteger)XAxis                           YAxis:(NSInteger)YAxis                   justification:(PTZplJustification)justification;
		[MethodName('FO_FieldOriginWithXAxis:YAxis:justification:')]
		procedure FO_FieldOriginWithXAxisYAxisjustification(XAxis:NSInteger;YAxis:NSInteger;justification:PTZplJustification);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  设置域相对于标签起始的起始位置
		// *
		// *  @brief 设置标签起始位置
		// *  @param XAxis         x轴位置(点) (0~32000)
		// *  @param YAxis         y轴位置(点) (0~32000)
		// *
		// *  \~english
		// *
		// *  set a field origin, relative to the label home (LH) position.
		// *
		// *  @brief set a field origin
		// *  @param XAxis         x-axis location in dots. (0~32000)
		// *  @param YAxis         x-axis location (in dots). (0~32000)
		// *
		// }
		//- (void)FO_FieldOriginWithXAxis:(NSInteger)XAxis
		                          //YAxis:(NSInteger)YAxis;
		 //- (void)FO_FieldOriginWithXAxis:(NSInteger)XAxis                           YAxis:(NSInteger)YAxis;
		[MethodName('FO_FieldOriginWithXAxis:YAxis:')]
		procedure FO_FieldOriginWithXAxisYAxis(XAxis:NSInteger;YAxis:NSInteger);cdecl;
		
		
		////#pragma mark ^FP
		
		//{!
		// *  \~chinese
		// *
		// *  设置字体字段格式，通常用于打印亚洲字体
		// *
		// *  @brief 设置文字打印方向
		// *  @param direction    文字打印方向
		// *  @param characterGap 字符间附加间距(点) (0~9999)
		// *
		// *  \~english
		// *
		// *  set vertical and reverse formatting of the font field, commonly used for printing Asian fonts.
		// *
		// *  @brief set text print direction
		// *  @param direction    print direction.
		// *  @param characterGap additional inter-character gap in dots. (0~9999)
		// *
		// }
		//- (void)FP_FieldParameterWithDirection:(PTZplTextPrintDirection)direction
		                          //characterGap:(NSInteger)characterGap;
		 //- (void)FP_FieldParameterWithDirection:(PTZplTextPrintDirection)direction                           characterGap:(NSInteger)characterGap;
		[MethodName('FP_FieldParameterWithDirection:characterGap:')]
		procedure FP_FieldParameterWithDirectioncharacterGap(direction:PTZplTextPrintDirection;characterGap:NSInteger);cdecl;
		
		
		////#pragma mark ^FR
		
		//{!
		// *  \~chinese
		// *
		// *  当打印某块域并且已经使用了这个指令，打印输出将会根据背景色进行反转
		// *  @brief 反转打印
		// *
		// *  \~english
		// *
		// *  When printing a field and the this command has been used, the color of the output is the reverse of its background.
		// *  @brief reverse print
		// *
		// }
		//- (void)FR_FieldReversePrint;
		procedure FR_FieldReversePrint;cdecl;
		
		
		////#pragma mark ^FS
		
		//{!
		// *  \~chinese
		// *
		// *  添加域分隔符,表示域的定义已经结束
		// *  @brief 添加域分隔符
		// *
		// *  \~english
		// *
		// *  this command denotes the end of the field definition.
		// *  @brief append field separator
		// *
		// }
		//- (void)FS_FieldSeparator;
		procedure FS_FieldSeparator;cdecl;
		
		
		////#pragma mark ^FT
		
		//{!
		// *  \~chinese
		// *
		// *  设置域相对于标签起始的起始位置
		// *
		// *  @brief 设置标签起始位置、对齐方式
		// *  @param XAxis         x轴位置(点) (0~32000)
		// *  @param YAxis         y轴位置(点) (0~32000)
		// *  @param justification 对齐方式
		// *
		// *  \~english
		// *
		// *  set a field origin, relative to the label home (LH) position.
		// *
		// *  @brief set a field origin and justification
		// *  @param XAxis         x-axis location in dots. (0~32000)
		// *  @param YAxis         x-axis location (in dots). (0~32000)
		// *  @param justification justification.
		// *
		// }
		//- (void)FT_FieldTypesetWithXAxis:(NSInteger)XAxis
		                           //YAxis:(NSInteger)YAxis
		                   //justification:(PTZplJustification)justification;
		 //- (void)FT_FieldTypesetWithXAxis:(NSInteger)XAxis                            YAxis:(NSInteger)YAxis                    justification:(PTZplJustification)justification;
		[MethodName('FT_FieldTypesetWithXAxis:YAxis:justification:')]
		procedure FT_FieldTypesetWithXAxisYAxisjustification(XAxis:NSInteger;YAxis:NSInteger;justification:PTZplJustification);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  设置域相对于标签起始的起始位置
		// *
		// *  @brief 设置标签起始位置
		// *  @param XAxis         x轴位置(点) (0~32000)
		// *  @param YAxis         y轴位置(点) (0~32000)
		// *
		// *  \~english
		// *
		// *  set a field origin, relative to the label home (LH) position.
		// *
		// *  @brief set a field origin
		// *  @param XAxis         x-axis location in dots. (0~32000)
		// *  @param YAxis         x-axis location (in dots). (0~32000)
		// *
		// }
		//- (void)FT_FieldTypesetWithXAxis:(NSInteger)XAxis
		                           //YAxis:(NSInteger)YAxis;
		 //- (void)FT_FieldTypesetWithXAxis:(NSInteger)XAxis                            YAxis:(NSInteger)YAxis;
		[MethodName('FT_FieldTypesetWithXAxis:YAxis:')]
		procedure FT_FieldTypesetWithXAxisYAxis(XAxis:NSInteger;YAxis:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  缺少坐标时,会假定位于上一个已设置格式的字段后面,这一记忆法简化了字段相对于其他字段的位置,在第一个字段定位后,其他字段将自动跟在其后.
		// *  @brief FT_FieldTypeset
		// *
		// *  \~english
		// *
		// *  When a coordinate is missing, the position following the last formatted field is assumed.This remembering simplifies field positioning with respect to other fields.Once the first field is positioned, other fields follow automatically.
		// *  @brief FT_FieldTypeset
		// *
		// }
		//- (void)FT_FieldTypeset;
		procedure FT_FieldTypeset;cdecl;
		
		
		////#pragma mark ^FV
		
		//{!
		// *  \~chinese
		// *
		// *  当字段为变量时,FV将替换采用标签格式的FD(字段数据)命令内容.
		// *
		// *  @brief 域变量
		// *  @param variableFieldDatavariable 变量
		// *
		// *  \~english
		// *
		// *  FV replaces the FD (field data) command in a label format when the field is variable.
		// *
		// *  @brief field variable
		// *  @param variableFieldData (0~3072 byte string)
		// *
		// }
		//- (void)FV_FieldVariable:(NSString *)variableFieldData;
		procedure FV_FieldVariable(variableFieldData:NSString);cdecl;
		
		
		////#pragma mark ^FW
		
		//{!
		// *  \~chinese
		// *
		// *  命令用于为所有具有旋转方向的命令字段设置默认方向,还可用于为所有具有对齐参数的命令设置默认对齐方式.
		// *
		// *  @brief 设置默认朝向、对齐方式
		// *  @param fieldOrientation 朝向
		// *  @param justification    对齐方式
		// *
		// *  \~english
		// *
		// *  command sets the default orientation for all command fields that have an orientation (rotation) parameter,
		// *  and sets the default justification for all commands with a justification parameter.
		// *
		// *  @brief set default orientation and justification
		// *  @param fieldOrientation field orientation.
		// *  @param justification    justification.
		// *
		// }
		//- (void)FW_FieldOrientation:(PTZplOrientation)fieldOrientation
		              //justification:(PTZplJustification)justification;
		 //- (void)FW_FieldOrientation:(PTZplOrientation)fieldOrientation               justification:(PTZplJustification)justification;
		[MethodName('FW_FieldOrientation:justification:')]
		procedure FW_FieldOrientationjustification(fieldOrientation:PTZplOrientation;justification:PTZplJustification);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  用于为所有具有旋转方向的命令字段设置默认方向
		// *
		// *  @brief 设置默认朝向
		// *  @param fieldOrientation 朝向
		// *
		// *  \~english
		// *
		// *  command sets the default orientation for all command fields that have an orientation (rotation) parameter.
		// *
		// *  @brief set default orientation
		// *  @param fieldOrientation field orientation.
		// *
		// }
		//- (void)FW_FieldOrientation:(PTZplOrientation)fieldOrientation;
		procedure FW_FieldOrientation(fieldOrientation:PTZplOrientation);cdecl;
		
		
		////#pragma mark ^FX
		
		//{!
		// *  \~chinese
		// *
		// *  添加注释
		// *
		// *  @brief 添加注释
		// *  @param comment 注释内容
		// *
		// *  \~english
		// *
		// *  command is useful when you want to add non-printing informational comments or statements within a label format.
		// *
		// *  @brief comment
		// *  @param comment non printing comment.
		// *
		// }
		//- (void)FX_FieldComment:(NSString *)comment;
		procedure FX_FieldComment(comment:NSString);cdecl;
		
		
		////#pragma mark ^GB
		
		//{!
		// *  \~chinese
		// *
		// *  画线和画框.
		// *
		// *  @brief 绘制带颜色和圆角的线或框
		// *  @param width                宽度(点) thickness~32000
		// *  @param height               高度度(点) thickness~32000
		// *  @param thickness            厚度(点) 1~32000
		// *  @param lineColor            线条颜色
		// *  @param cornorRoundingDegree 圆角程度 0~8
		// *
		// *  \~english
		// *
		// *  draw boxes and lines
		// *
		// *  @brief draw boxes and lines with color and corner round
		// *  @param width                box width in dots. thickness~32000
		// *  @param height               box height in dots. thickness~32000
		// *  @param thickness            border thickness in dots. 1~32000
		// *  @param lineColor            line color.
		// *  @param cornorRoundingDegree degree of corner-rounding. 0~8
		// *
		// }
		//- (void)GB_GraphicBoxWithWidth:(NSInteger)width
		                        //height:(NSInteger)height
		                     //thickness:(NSInteger)thickness
		                     //lineColor:(PTZplColor)lineColor
		          //cornorRoundingDegree:(NSInteger)cornorRoundingDegree;
		 //- (void)GB_GraphicBoxWithWidth:(NSInteger)width                         height:(NSInteger)height                      thickness:(NSInteger)thickness                      lineColor:(PTZplColor)lineColor           cornorRoundingDegree:(NSInteger)cornorRoundingDegree;
		[MethodName('GB_GraphicBoxWithWidth:height:thickness:lineColor:cornorRoundingDegree:')]
		procedure GB_GraphicBoxWithWidthheightthicknesslineColorcornorRoundingDegree(width:NSInteger;height:NSInteger;thickness:NSInteger;lineColor:PTZplColor;cornorRoundingDegree:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  画线和画框.
		// *
		// *  @brief 绘制带圆角的线或框
		// *  @param width                宽度(点) thickness~32000
		// *  @param height               高度度(点) thickness~32000
		// *  @param thickness            厚度(点) 1~32000
		// *  @param cornorRoundingDegree 圆角程度 0~8
		// *
		// *  \~english
		// *
		// *  draw boxes and lines
		// *
		// *  @brief draw boxes and lines with corner round
		// *  @param width                box width in dots. thickness~32000
		// *  @param height               box height in dots. thickness~32000
		// *  @param thickness            border thickness in dots. 1~32000
		// *  @param cornorRoundingDegree degree of corner-rounding. 0~8
		// *
		// }
		//- (void)GB_GraphicBoxWithWidth:(NSInteger)width
		                        //height:(NSInteger)height
		                     //thickness:(NSInteger)thickness
		          //cornorRoundingDegree:(NSInteger)cornorRoundingDegree;
		 //- (void)GB_GraphicBoxWithWidth:(NSInteger)width                         height:(NSInteger)height                      thickness:(NSInteger)thickness           cornorRoundingDegree:(NSInteger)cornorRoundingDegree;
		[MethodName('GB_GraphicBoxWithWidth:height:thickness:cornorRoundingDegree:')]
		procedure GB_GraphicBoxWithWidthheightthicknesscornorRoundingDegree(width:NSInteger;height:NSInteger;thickness:NSInteger;cornorRoundingDegree:NSInteger);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  画线和画框.
		// *
		// *  @brief 画线、画框
		// *  @param width                宽度(点) thickness~32000
		// *  @param height               高度度(点) thickness~32000
		// *  @param thickness            厚度(点) 1~32000
		// *
		// *  \~english
		// *
		// *  draw boxes and lines
		// *
		// *  @brief draw boxes and lines
		// *  @param width        box width in dots. thickness~32000
		// *  @param height       box height in dots. thickness~32000
		// *  @param thickness    border thickness in dots. 1~32000
		// *
		// }
		//- (void)GB_GraphicBoxWithWidth:(NSInteger)width
		                        //height:(NSInteger)height
		                     //thickness:(NSInteger)thickness;
		 //- (void)GB_GraphicBoxWithWidth:(NSInteger)width                         height:(NSInteger)height                      thickness:(NSInteger)thickness;
		[MethodName('GB_GraphicBoxWithWidth:height:thickness:')]
		procedure GB_GraphicBoxWithWidthheightthickness(width:NSInteger;height:NSInteger;thickness:NSInteger);cdecl;
		
		
		////#pragma mark ^GC
		
		//{!
		// *  \~chinese
		// *
		// *  画圆.
		// *
		// *  @brief 画圆
		// *  @param diameter  半径(点) 3~4095
		// *  @param thickness 边框厚度(点) 1～4095
		// *  @param lineColor 线条颜色
		// *
		// *  \~english
		// *
		// *  draw circle
		// *
		// *  @brief draw circle
		// *  @param diameter         circle diameter in dots. 3~4095
		// *  @param thickness        border thickness in dots. 1～4095
		// *  @param lineColor        line color.
		// *
		// }
		//- (void)GC_GraphicCircleWithDiameter:(NSInteger)diameter
		                           //thickness:(NSInteger)thickness
		                           //lineColor:(PTZplColor)lineColor;
		 //- (void)GC_GraphicCircleWithDiameter:(NSInteger)diameter                            thickness:(NSInteger)thickness                            lineColor:(PTZplColor)lineColor;
		[MethodName('GC_GraphicCircleWithDiameter:thickness:lineColor:')]
		procedure GC_GraphicCircleWithDiameterthicknesslineColor(diameter:NSInteger;thickness:NSInteger;lineColor:PTZplColor);cdecl;
		
		
		////#pragma mark ^GD
		
		//{!
		// *  \~chinese
		// *
		// *  画斜线.
		// *
		// *  @brief 画斜线
		// *  @param width        方框宽度(点) thickness~32000
		// *  @param height       方框高度(点) thickness~32000
		// *  @param thickness    斜线宽度(点) 1~32000
		// *  @param lineColor    线条颜色
		// *  @param orientation  方向
		// *
		// *  \~english
		// *
		// *  draw a straight diagonal line.
		// *
		// *  @brief draw a straight diagonal line
		// *  @param width        box width in dots. thickness~32000
		// *  @param height       box height in dots. thickness~32000
		// *  @param thickness    border thickness in dots. 1~32000
		// *  @param lineColor    line color.
		// *  @param orientation  direction of the diagonal.
		// *
		// }
		//- (void)GD_GraphicDiagonalLineWithWidth:(NSInteger)width
		                                 //height:(NSInteger)height
		                              //thickness:(NSInteger)thickness
		                              //lineColor:(PTZplColor)lineColor
		                            //orientation:(PTZplDiagonalOrientation)orientation;
		 //- (void)GD_GraphicDiagonalLineWithWidth:(NSInteger)width                                  height:(NSInteger)height                               thickness:(NSInteger)thickness                               lineColor:(PTZplColor)lineColor                             orientation:(PTZplDiagonalOrientation)orientation;
		[MethodName('GD_GraphicDiagonalLineWithWidth:height:thickness:lineColor:orientation:')]
		procedure GD_GraphicDiagonalLineWithWidthheightthicknesslineColororientation(width:NSInteger;height:NSInteger;thickness:NSInteger;lineColor:PTZplColor;orientation:PTZplDiagonalOrientation);cdecl;
		
		
		////#pragma mark ^GE
		
		//{!
		// *  \~chinese
		// *
		// *  画椭圆.
		// *
		// *  @brief 画椭圆
		// *  @param width        椭圆宽度(点) thickness~32000
		// *  @param height       椭圆高度(点) thickness~32000
		// *  @param thickness    线条宽度(点) 1~32000
		// *  @param lineColor    线条颜色
		// *
		// *  \~english
		// *
		// *  draw Ellipse.
		// *
		// *  @brief draw Ellipse
		// *  @param width        Ellipse width in dots. thickness~32000
		// *  @param height       Ellipse height in dots. thickness~32000
		// *  @param lineColor    line color.
		// *  @param orientation  direction of the diagonal.
		// *
		// }
		//- (void)GE_GraphicEllipseWithWidth:(NSInteger)width
		                            //height:(NSInteger)height
		                         //thickness:(NSInteger)thickness
		                         //lineColor:(PTZplColor)lineColor;
		 //- (void)GE_GraphicEllipseWithWidth:(NSInteger)width                             height:(NSInteger)height                          thickness:(NSInteger)thickness                          lineColor:(PTZplColor)lineColor;
		[MethodName('GE_GraphicEllipseWithWidth:height:thickness:lineColor:')]
		procedure GE_GraphicEllipseWithWidthheightthicknesslineColor(width:NSInteger;height:NSInteger;thickness:NSInteger;lineColor:PTZplColor);cdecl;
		
		
		
		////#pragma mark ^GF
		
		//{!
		//*  \~chinese
		//*
		//*  图片打印
		//*
		//*  @brief 图片打印
		//*  @param compression  压缩类型,一般是字符串B
		//*  @param cgImage      图片
		//*  @param bitmapMode   图片模式
		//*
		//*  \~english
		//*
		//*  command allows you to download graphic field data directly into the printer’s bitmap storage area.
		//*
		//*  @brief download graphic field data
		//*  @param compression  compression type,default B
		//*  @param cgImage      image
		//*  @param bitmapMode   image mode.
		//*
		//}
		//- (void)GF_GraphicFieldWithCompressionType:(NSString *)compression image:(CGImageRef)cgImage bitmapMode:(PTBitmapMode)bitmapMode;
		[MethodName('GF_GraphicFieldWithCompressionType:image:bitmapMode:')]
		procedure GF_GraphicFieldWithCompressionTypeimagebitmapMode(compression:NSString;cgImage:CGImageRef;bitmapMode:PTBitmapMode);cdecl;
		
		
		
		////#pragma mark ^GS
		
		//{!
		// *  \~chinese
		// *
		// *  生成注册商标、版权符号和其他符号.使用该指令后，后面紧跟FD命令,通过域数据中的相应字符(A到E)来生成所需符号.
		// *
		// *  @brief 生成注册商标、版权符号和其他符号
		// *  @param orientation 朝向
		// *  @param height      符号宽度(点) 0~32000
		// *  @param width       符号宽度(点) 0~32000
		// *
		// *  \~english
		// *
		// *  this command enables you to generate the registered trademark, copyright symbol, and other symbols.Use the ^GS command followed by ^FD and the appropriate character (A through E) within the field data to generate the desired character.
		// *
		// *  @brief generate the registered trademark, copyright symbol, and other symbols
		// *  @param orientation field orientation.
		// *  @param height      character height proportional to width (in dots). 0~32000
		// *  @param width       character width proportional to width (in dots). 0~32000
		// *
		// }
		//- (void)GS_GraphicSymbolWithOrientation:(PTZplOrientation)orientation
		                                 //height:(NSInteger)height
		                                  //width:(NSInteger)width;
		 //- (void)GS_GraphicSymbolWithOrientation:(PTZplOrientation)orientation                                  height:(NSInteger)height                                   width:(NSInteger)width;
		[MethodName('GS_GraphicSymbolWithOrientation:height:width:')]
		procedure GS_GraphicSymbolWithOrientationheightwidth(orientation:PTZplOrientation;height:NSInteger;width:NSInteger);cdecl;
		
		//{!
		// *  \~chinese
		// *
		// *  生成默认朝向和宽高的符号
		// *  @brief 生成默认朝向和宽高的符号
		// *
		// *  \~english
		// *
		// *  generate character has default orientation, height and width.
		// *  @brief generate character has default orientation, height and width
		// *
		// }
		//- (void)GS_GraphicSymbol;
		procedure GS_GraphicSymbol;cdecl;
		
		
		////#pragma mark ^ID
		
		//{!
		// *  \~chinese
		// *
		// *  从存储区域删除对象、图形、字体和已存储的格式.
		// *
		// *  @brief 删除文件
		// *  @param objectLocation 存储对象位置
		// *  @param objectName     对象名称 1~8 characters
		// *  @param extension      扩展名
		// *
		// *  \~english
		// *
		// *  deletes objects, graphics, fonts, and stored formats from storage areas.
		// *
		// *  @brief deletes file
		// *  @param objectLocation location of stored object
		// *  @param objectName     object name. 1~8 characters
		// *  @param extension      extension.
		// *
		// }
		//- (void)ID_ImageDeleteWithObjectLocation:(PTZplFileLocation)objectLocation
		                              //objectName:(NSString *)objectName
		                               //extension:(NSString *)extension;
		 //- (void)ID_ImageDeleteWithObjectLocation:(PTZplFileLocation)objectLocation                               objectName:(NSString *)objectName                                extension:(NSString *)extension;
		[MethodName('ID_ImageDeleteWithObjectLocation:objectName:extension:')]
		procedure ID_ImageDeleteWithObjectLocationobjectNameextension(objectLocation:PTZplFileLocation;objectName:NSString;extension:NSString);cdecl;
		
		
		////#pragma mark ^IL
		
		//{!
		// *  \~chinese
		// *
		// *  在标签格式的开头加载已存储的某种格式的图像,并将该图像与其他数据进行合并.该图像始终位于FO 0,0.
		// *
		// *  @brief 加载图像
		// *  @param objectLocation 存储对象位置
		// *  @param objectName     对象名称 1~8 characters
		// *  @param extension      扩展名(.GRF,.PNG)
		// *
		// *  \~english
		// *
		// *  command is used at the beginning of a label format to load a stored image of a format and merge it with additional data. The image is always positioned at FO 0,0.
		// *
		// *  @brief load a stored image
		// *  @param objectLocation location of stored object
		// *  @param objectName     object name. 1~8 characters
		// *  @param extension      extension. (.GRF,.PNG)
		// *
		// }
		//- (void)IL_ImageLoadWithObjectLocation:(PTZplFileLocation)objectLocation
		                            //objectName:(NSString *)objectName
		                             //extension:(NSString *)extension;
		 //- (void)IL_ImageLoadWithObjectLocation:(PTZplFileLocation)objectLocation                             objectName:(NSString *)objectName                              extension:(NSString *)extension;
		[MethodName('IL_ImageLoadWithObjectLocation:objectName:extension:')]
		procedure IL_ImageLoadWithObjectLocationobjectNameextension(objectLocation:PTZplFileLocation;objectName:NSString;extension:NSString);cdecl;
		
		
		////#pragma mark ^IM
		
		//{!
		// *  \~chinese
		// *
		// *  将图像从存储区域直接移动到位图中.
		// *
		// *  @brief 从存储中加载图像
		// *  @param objectLocation 存储对象位置
		// *  @param objectName     对象名称 1~8 characters
		// *  @param extension      扩展名(.GRF,.PNG)
		// *
		// *  \~english
		// *
		// *  command performs a direct move of an image from storage area into the bitmap.
		// *
		// *  @brief performs a direct move of an image from storage area into the bitmap
		// *  @param objectLocation location of stored object
		// *  @param objectName     object name. 1~8 characters
		// *  @param extension      extension. (.GRF,.PNG)
		// *
		// }
		//- (void)IM_ImageMoveWithObjectLocation:(PTZplFileLocation)objectLocation
		                            //objectName:(NSString *)objectName
		                             //extension:(NSString *)extension;
		 //- (void)IM_ImageMoveWithObjectLocation:(PTZplFileLocation)objectLocation                             objectName:(NSString *)objectName                              extension:(NSString *)extension;
		[MethodName('IM_ImageMoveWithObjectLocation:objectName:extension:')]
		procedure IM_ImageMoveWithObjectLocationobjectNameextension(objectLocation:PTZplFileLocation;objectName:NSString;extension:NSString);cdecl;
		
		
		////#pragma mark ^IS
		
		//{!
		// *  \~chinese
		// *
		// *  将当前标签保存为图形图像.
		// *
		// *  @brief 保存当前标签为图像
		// *  @param objectLocation       存储对象位置
		// *  @param objectName           对象名称 1~8 characters
		// *  @param extension            扩展名(.GRF,.PNG)
		// *  @param printAfterSorting    是否存储后打印图像
		// *
		// *  \~english
		// *
		// *  command is used within a label format to save that format as a graphic image,
		// *
		// *  @brief save that format as a graphic image
		// *  @param objectLocation       location of stored object
		// *  @param objectName           object name. 1~8 characters
		// *  @param extension            extension. (.GRF,.PNG)
		// *  @param printAfterSorting    whether print image after storing.
		// *
		// }
		//- (void)IS_ImageSaveWithObjectLocation:(PTZplFileLocation)objectLocation
		                            //objectName:(NSString *)objectName
		                             //extension:(NSString *)extension
		                     //printAfterSorting:(PTZplBool)printAfterSorting;
		 //- (void)IS_ImageSaveWithObjectLocation:(PTZplFileLocation)objectLocation                             objectName:(NSString *)objectName                              extension:(NSString *)extension                      printAfterSorting:(PTZplBool)printAfterSorting;
		[MethodName('IS_ImageSaveWithObjectLocation:objectName:extension:printAfterSorting:')]
		procedure IS_ImageSaveWithObjectLocationobjectNameextensionprintAfterSorting(objectLocation:PTZplFileLocation;objectName:NSString;extension:NSString;printAfterSorting:PTZplBool);cdecl;
		
		
		////#pragma mark ~JA
		
		//{!
		// *  \~chinese
		// *
		// *  取消缓冲区中所有格式命令.
		// *  @brief 取消格式命令
		// *
		// *  \~english
		// *
		// *  cancels all format commands in the buffer.
		// *  @brief cancels all format commands in the buffer
		// *
		// }
		//- (void)JA_CancelAll;
		procedure JA_CancelAll;cdecl;
		
		
		////#pragma mark ~JD
		
		//{!
		// *  \~chinese
		// *
		// *  启用通讯诊断
		// *  @brief 启用通讯诊断
		// *  @note 启动诊断模式,为打印机接收的所有字符生成ASCII打印结果(使用打印机的当前标签长度和全宽).该打印结果包括ASCII字符、十六进制值和任何通信错误。
		// *
		// *  \~english
		// *
		// *  initiates Diagnostic Mode.
		// *  @brief initiates Diagnostic Mode
		// *  @note command initiates Diagnostic Mode, which produces an ASCII printout (using current label length and full width of printer) of all characters received by the printer. This printout includes the ASCII characters, the hexadecimal value, and any communication errors.
		// *
		// }
		//- (void)JD_EnableCommunicationsDiagnostics;
		procedure JD_EnableCommunicationsDiagnostics;cdecl;
		
		
		////#pragma mark ~JE
		
		//{!
		// *  \~chinese
		// *
		// *  关闭通讯诊断
		// *  @brief 关闭通讯诊断
		// *
		// *  \~english
		// *
		// *  Disable Diagnostics
		// *  @brief Disable Diagnostics
		// *
		// }
		//- (void)JE_DisableDiagnostics;
		procedure JE_DisableDiagnostics;cdecl;
		
		
		////#pragma mark ^JZ
		
		//{!
		// *  \~chinese
		// *
		// *  是否打印出错后重新打印
		// *
		// *  @brief 打印出错后重新打印开关
		// *  @note 命令用于重新打印由于碳带用完、介质用完或打印头开启等错误状况而部分打印的标签.错误状况得到解决后,会立即重新打印标签.在向打印机发送另一个 ^JZ 命令或关闭打印机之前，此命令将一直有效。
		// *
		// *  \~english
		// *
		// *  whether reprint after error.
		// *
		// *  @brief whether reprint after error
		// *  @note reprints a partially printed label caused by a Ribbon Out, Media Out, or Head Open error condition. The label is reprinted as soon as the error condition is corrected. This command remains active until another ^JZ command is sent to the printer or the printer is turned off.
		// *
		// }
		//- (void)JZ_SetReprintAfterError:(PTZplBool)enable;
		procedure JZ_SetReprintAfterError(enable:PTZplBool);cdecl;
		
		
		////#pragma mark ^LH
		
		//{!
		// *  \~chinese
		// *
		// *  设置标签起始位置.
		// *
		// *  @brief 标签起始位置
		// *  @param XPos x轴位置(点) (0~32000)
		// *  @param YPos y轴位置(点) (0~32000)
		// *
		// *  \~english
		// *
		// *  sets the label home position.
		// *
		// *  @brief sets the label home position
		// *  @param XPos x-axis position in dots. (0~32000)
		// *  @param YPos y-axis position in dots. (0~32000)
		// *
		// }
		//- (void)LH_LabelHomeWithXPos:(NSInteger)XPos
		                        //YPos:(NSInteger)YPos;
		 //- (void)LH_LabelHomeWithXPos:(NSInteger)XPos                         YPos:(NSInteger)YPos;
		[MethodName('LH_LabelHomeWithXPos:YPos:')]
		procedure LH_LabelHomeWithXPosYPos(XPos:NSInteger;YPos:NSInteger);cdecl;
		
		
		////#pragma mark ^LL
		
		//{!
		// *  \~chinese
		// *
		// *  定义标签长度.
		// *
		// *  @brief 标签长度
		// *  @param length 标签长度(点)
		// *
		// *  \~english
		// *
		// *  defines the length of the label.
		// *
		// *  @brief defines the length of the label
		// *  @param length the length of the label.
		// *
		// }
		//- (void)LL_LabelLength:(NSInteger)length;
		procedure LL_LabelLength(length:NSInteger);cdecl;
		
		
		////#pragma mark ^LR
		
		//{!
		// *  \~chinese
		// *
		// *  是否开启标签反色打印.用于反色打印标签格式中的所有字段.
		// *
		// *  @brief 开关反色打印
		// *  @param reverse  是否开启
		// *
		// *  \~english
		// *
		// *  reverse the printing of all fields in the label format.
		// *
		// *  @brief trun on/off color reverse print
		// *  @param reverse whether reverse print all fields.
		// *
		// }
		//- (void)LR_LabelReversePrint:(PTZplBool)reverse;
		procedure LR_LabelReversePrint(reverse:PTZplBool);cdecl;
		
		
		////#pragma mark ^LS
		
		//{!
		// *  \~chinese
		// *
		// *  此命令用于将 所有字段的位置向左移动.
		// *
		// *  @brief 内容左移
		// *  @param shift 移动点数.
		// *
		// *  \~english
		// *
		// *  shift all field positions to the left.
		// *
		// *  @brief shift all field positions to the left
		// *  @param shift shift left value in dots.
		// *
		// }
		//- (void)LS_LabelShift:(NSInteger)shift;
		procedure LS_LabelShift(shift:NSInteger);cdecl;
		
		
		////#pragma mark ^LT
		
		//{!
		// *  \~chinese
		// *
		// *  用于将整个标签格式从其当前位置向上或向下移动最多120点行(相对于标签顶部边缘).
		// *
		// *  @brief 上下移动标签
		// *  @param top 移动点数(-120~120).
		// *
		// *  \~english
		// *
		// *  command moves the entire label format a maximum of 120 dot rows up or down from its current position, in relation to the top edge of the label.
		// *
		// *  @brief moves the entire label format
		// *  @param top label top (in dot rows) -120~120.
		// *
		// }
		//- (void)LT_LabelTop:(NSInteger)top;
		procedure LT_LabelTop(top:NSInteger);cdecl;
		
		
		////#pragma mark ^MC
		
		//{!
		// *  \~chinese
		// *
		// *  在正常操作中,会在打印格式后清除位图.MC命令用于决定是否保留当前位图,这适用于当前标签和后续标签,直到使用该命令进行清除。
		// *
		// *  @brief 是否清除位图
		// *  @param clear 是否清除
		// *
		// *  \~english
		// *
		// *  In normal operation, the bitmap is cleared after the format has been printed. The command with false is used to retain the current bitmap. This applies to current and subsequent labels until cleared with true.
		// *
		// *  @brief retain the current bitmap
		// *  @param clear whether clear bitmap.
		// *
		// }
		//- (void)MC_MapClear:(PTZplBool)clear;
		procedure MC_MapClear(clear:PTZplBool);cdecl;
		
		
		////#pragma mark ^ML
		
		//{!
		// *  \~chinese
		// *
		// *  设置最大标签长度.
		// *
		// *  @brief 最大标签长度
		// *  @param length 标签长度
		// *
		// *  \~english
		// *
		// *  let you adjust the maximum label length.
		// *
		// *  @brief set the maximum label length
		// *  @param length maximum label length.
		// *
		// }
		//- (void)ML_MaximumLabelLength:(NSInteger)length;
		procedure ML_MaximumLabelLength(length:NSInteger);cdecl;
		
		
		////#pragma mark ^MT
		
		//{!
		// *  \~chinese
		// *
		// *  设置介质类型.
		// *
		// *  @brief 介质类型
		// *  @param type 介质类型
		// *
		// *  \~english
		// *
		// *  select the type of media being used in the printer.
		// *
		// *  @brief set type of media
		// *  @param type media type used.
		// *
		// }
		//- (void)MT_SetMediaType:(PTZplMediaType)type;
		procedure MT_SetMediaType(_type:PTZplMediaType);cdecl;
		
		
		////#pragma mark ^ND
		
		//{!
		// *  \~chinese
		// *
		// *  设置网络.
		// *
		// *  @brief 网络
		// *  @param ipAddress    ip地址
		// *  @param subnetMask   子网掩码
		// *
		// *  \~english
		// *
		// *  change network settings.
		// *
		// *  @brief change network settings
		// *  @param ipAddress    IP address.
		// *  @param subnetMask   subnet mask.
		// *
		// }
		//- (void)ND_SetNetworkSettingWithIP:(NSString *)ipAddress
		                        //SubnetMask:(NSString *)subnetMask;
		 //- (void)ND_SetNetworkSettingWithIP:(NSString *)ipAddress                         SubnetMask:(NSString *)subnetMask;
		[MethodName('ND_SetNetworkSettingWithIP:SubnetMask:')]
		procedure ND_SetNetworkSettingWithIPSubnetMask(ipAddress:NSString;subnetMask:NSString);cdecl;
		
		
		////#pragma mark ^PM
		
		//{!
		// *  \~chinese
		// *
		// *  开关镜像打印.打印效果为左右翻转图像.
		// *
		// *  @brief 开关镜像打印
		// *  @param mirror 是否开启
		// *
		// *  \~english
		// *
		// *  prints the entire printable area of the label as a mirror image. This command flips the image from left to right.
		// *
		// *  @brief turn on/off mirrir print
		// *  @param mirror media type used.
		// *
		// }
		//- (void)PM_PrintLabelMirrorImage:(PTZplBool)mirror;
		procedure PM_PrintLabelMirrorImage(mirror:PTZplBool);cdecl;
		
		
		////#pragma mark ^PO
		
		//{!
		// *  \~chinese
		// *
		// *  设置打印方向
		// *
		// *  @brief 打印方向
		// *  @param orientation 打印方向
		// *
		// *  \~english
		// *
		// *  setting print orientation.
		// *
		// *  @brief setting print orientation
		// *  @param orientation print orientation.
		// *
		// }
		//- (void)PO_PrintOrientation:(PTZplPrintOrientation)orientation;
		procedure PO_PrintOrientation(orientation:PTZplPrintOrientation);cdecl;
		
		
		////#pragma mark ^PP ~PP
		//{!
		// *  \~chinese
		// *
		// *  用于在当前标签完成后(如果正在打印)停止打印,并将打印机置于暂停模式.
		// *  @brief 打印完成后停止打印
		// *
		// *  \~english
		// *
		// *  command stops printing after the current label is complete (if one is printing) and places the printer in Pause Mode.
		// *  @brief stops printing after the current label is complete
		// *
		// }
		//- (void)PP_ProgrammablePause;
		procedure PP_ProgrammablePause;cdecl;
		
		
		////#pragma mark ^PQ
		
		//{!
		// *  \~chinese
		// *
		// *  控制几项打印操作。此命令会控制要打印的标签数量、打印机暂 停前打印的标签数量，以及每个序列号的副本数量.
		// *
		// *  @brief 打印操作控制
		// *  @param quantity       打印份数
		// *  @param pauseValue     暂停和切纸值(暂停区间打印的标签数)
		// *  @param replicateValue 每个序列号的份数
		// *  @param overrided      Y->打印机切纸，不暂停；N->暂停，不切纸
		// *
		// *  \~english
		// *
		// *  Controls several printing operations. This command controls the number of labels to print, the number of labels to print before the printer is paused, and the number of copies of each serial number.
		// *
		// *  @brief gives control over several printing operations
		// *  @param quantity       total quantity of labels to print.
		// *  @param pauseValue     pause and cut value (labels between pauses).
		// *  @param replicateValue replicates of each serial number.
		// *  @param overrided      Y:printer cutting paper without pause; N:pause, don't cut the paper
		// *
		// }
		//- (void)PQ_PrintQuantity:(NSInteger)quantity
		              //pauseValue:(NSInteger)pauseValue
		          //replicateValue:(NSInteger)replicateValue
		               //overrided:(PTZplBool)overrided;
		 //- (void)PQ_PrintQuantity:(NSInteger)quantity               pauseValue:(NSInteger)pauseValue           replicateValue:(NSInteger)replicateValue                overrided:(PTZplBool)overrided;
		[MethodName('PQ_PrintQuantity:pauseValue:replicateValue:overrided:')]
		procedure PQ_PrintQuantitypauseValuereplicateValueoverrided(quantity:NSInteger;pauseValue:NSInteger;replicateValue:NSInteger;overrided:PTZplBool);cdecl;
		
		
		//{!
		// *  \~chinese
		// *
		// *  设置标签打印份数.
		// *
		// *  @brief 设置标签打印份数
		// *  @param quantity       打印份数
		// *
		// *  \~english
		// *
		// *  total quantity of labels to print
		// *
		// *  @brief set print quantity
		// *  @param quantity       total quantity of labels to print.
		// *
		// }
		//- (void)PQ_PrintQuantity:(NSInteger)quantity;
		procedure PQ_PrintQuantity(quantity:NSInteger);cdecl;
		
		
		////#pragma mark ^PW
		
		//{!
		// *  \~chinese
		// *
		// *  设置标签宽度.
		// *
		// *  @brief 设置标签宽度
		// *  @param width 标签宽度(点)
		// *
		// *  \~english
		// *
		// *  set the print width.
		// *
		// *  @brief set the print width
		// *  @param width label width in dots.
		// *
		// }
		//- (void)PW_PrintWidth:(NSInteger)width;
		procedure PW_PrintWidth(width:NSInteger);cdecl;
		
		
		////#pragma mark ^SC
		
		//{!
		// *  \~chinese
		// *
		// *  串口通信设置.
		// *
		// *  @brief 串口通信设置
		// *  @param baudRate     波特率
		// *  @param dataBits     字长 7或8
		// *  @param parity       奇偶校检 N(无)、E(偶数)或O(奇数)
		// *  @param stopBits     停止位 1或2
		// *  @param protocolMode 协议模式
		// *
		// *  \~english
		// *
		// *  change the serial communications parameters you are using.
		// *
		// *  @brief change the serial communications parameters
		// *  @param baudRate     baud rate
		// *  @param dataBits     word length, 7 or 8.
		// *  @param parity       parity, N(none), E(even), orO(odd).
		// *  @param stopBits     stop bits, 1 or 2.
		// *  @param protocolMode protocol mode.
		// *
		// }
		//- (void)SC_SetSerialCommunicationsWithBaudRate:(NSString *)baudRate
		                                      //DataBits:(NSString *)dataBits
		                                        //Parity:(NSString *)parity
		                                      //StopBits:(NSString *)stopBits
		                                  //ProtocolMode:(NSString *)protocolMode;
		 //- (void)SC_SetSerialCommunicationsWithBaudRate:(NSString *)baudRate                                       DataBits:(NSString *)dataBits                                         Parity:(NSString *)parity                                       StopBits:(NSString *)stopBits                                   ProtocolMode:(NSString *)protocolMode;
		[MethodName('SC_SetSerialCommunicationsWithBaudRate:DataBits:Parity:StopBits:ProtocolMode:')]
		procedure SC_SetSerialCommunicationsWithBaudRateDataBitsParityStopBitsProtocolMode(baudRate:NSString;dataBits:NSString;parity:NSString;stopBits:NSString;protocolMode:NSString);cdecl;
		
		
		////#pragma mark ~SD
		
		//{!
		// *  \~chinese
		// *
		// *  设置打印暗度.
		// *
		// *  @brief 设置打印暗度
		// *  @param darkness 暗度 0~30
		// *
		// *  \~english
		// *
		// *  set the darkness of printing.
		// *
		// *  @brief set the darkness of printing
		// *  @param darkness darkness 0~30.
		// *
		// }
		//- (void)SD_SetDarkness:(NSInteger)darkness;
		procedure SD_SetDarkness(darkness:NSInteger);cdecl;
		
		
		////#pragma mark ^SF
		
		//{!
		// *  \~chinese
		// *
		// *  与FD指令生成连续域
		// *
		// *  @brief 连续域
		// *  @note 掩码字符串占位符: D或d -> 十进制0–9; H或h -> 十六进制0–9和a-f或A-F; O或o –> 八进制0–7; A或a –> 字母A–Z或a–z; N或n –> 字母数字0–9和A–Z或a–z; % –> 忽略字符或跳过.
		// *  @param maskString      掩码
		// *  @param incrementString 递增量
		// *
		// *  \~english
		// *
		// *  serialization field (with a standard ^FD string).
		// *
		// *  @brief serialization field
		// *  @note Mask String placeholders: D or d –> Decimal numeric 0–9; H or h –> Hexadecimal 0–9 plus a-f or A-F; O or o –> Octal 0–7; A or a –> Alphabetic A–Z or a–z; N or n –> Alphanumeric 0–9 plus A–Z or a–z; % –> Ignore character or skip.
		// *  @param maskString      mask string.
		// *  @param incrementString increment string.
		// *
		// }
		//- (void)SF_SerializationFieldWithMaskString:(NSString *)maskString
		                            //incrementString:(NSString *)incrementString;
		 //- (void)SF_SerializationFieldWithMaskString:(NSString *)maskString                             incrementString:(NSString *)incrementString;
		[MethodName('SF_SerializationFieldWithMaskString:incrementString:')]
		procedure SF_SerializationFieldWithMaskStringincrementString(maskString:NSString;incrementString:NSString);cdecl;
		
		
		////#pragma mark ^TO
		
		//{!
		// *  \~chinese
		// *
		// *  对象复制.
		// *
		// *  @brief 对象复制
		// *  @param sourceDevice             复制对象存储对象位置
		// *  @param sourceObjectName         复制对象名称 1~8 characters
		// *  @param sourceExtension          复制对象后缀
		// *  @param destinationDevice        目标对象位置
		// *  @param destinationObjectName    目标对象名称 1~8 characters
		// *  @param destinationExtension     目标对象后缀
		// *
		// *  \~english
		// *
		// *  command is used to copy an object or group of objects from one storage device to another.
		// *
		// *  @brief copy an object
		// *  @param sourceDevice             source device of stored object.
		// *  @param sourceObjectName         stored object name. 1~8 characters.
		// *  @param sourceExtension          source object extension.
		// *  @param destinationDevice        destination device of stored object.
		// *  @param destinationObjectName    destination object name. 1~8 characters.
		// *  @param destinationExtension     destination object extension.
		// *
		// }
		//- (void)TO_TransferObjectWithSourceDevice:(PTZplFileLocation)sourceDevice
		                         //sourceObjectName:(NSString *)sourceObjectName
		                          //sourceExtension:(NSString *)sourceExtension
		                        //destinationDevice:(PTZplFileLocation)destinationDevice
		                    //destinationObjectName:(NSString *)destinationObjectName
		                     //destinationExtension:(NSString *)destinationExtension;
		 //- (void)TO_TransferObjectWithSourceDevice:(PTZplFileLocation)sourceDevice                          sourceObjectName:(NSString *)sourceObjectName                           sourceExtension:(NSString *)sourceExtension                         destinationDevice:(PTZplFileLocation)destinationDevice                     destinationObjectName:(NSString *)destinationObjectName                      destinationExtension:(NSString *)destinationExtension;
		[MethodName('TO_TransferObjectWithSourceDevice:sourceObjectName:sourceExtension:destinationDevice:destinationObjectName:destinationExtension:')]
		procedure TO_TransferObjectWithSourceDevicesourceObjectNamesourceExtensiondestinationDevicedestinationObjectNamedestinationExtension(sourceDevice:PTZplFileLocation;sourceObjectName:NSString;sourceExtension:NSString;destinationDevice:PTZplFileLocation;destinationObjectName:NSString;destinationExtension:NSString);cdecl;
		
		
		////#pragma mark ^XA
		
		//{!
		// *  \~chinese
		// *
		// *  开始新的标签格式
		// *  @brief 开启标签格式
		// *
		// *  \~english
		// *
		// *  open bracket and indicates the start of a new label format.
		// *  @brief start a new label format
		// *
		// }
		//- (void)XA_FormatStart;
		procedure XA_FormatStart;cdecl;
		
		
		////#pragma mark ^XF
		
		//{!
		// *  \~chinese
		// *
		// *  根据位置、全名调用要进行打印的图形图像.
		// *
		// *  @brief XF_RecallFormat
		// *  @param sourceDevice       存储对象位置
		// *  @param imageName          对象名称 1~8 characters
		// *  @param extension          .GRF
		// *  @param XAxisMagnification x轴放大系数 1~10
		// *  @param YAxisMagnification y轴放大系数 1~10
		// *
		// *  \~english
		// *
		// *  command recalls a stored format to be merged with variable data.
		// *
		// *  @brief XF_RecallFormat
		// *  @param sourceDevice       location of stored object
		// *  @param imageName          object name. 1~8 characters
		// *  @param extension          .GRF
		// *  @param XAxisMagnification magnification factor on the x-axis. 1~10
		// *  @param YAxisMagnification magnification factor on the y-axis. 1~10
		// *
		// }
		//- (void)XF_RecallFormatWithSourceDevice:(PTZplFileLocation)sourceDevice
		                              //imageName:(NSString *)imageName
		                              //extension:(NSString *)extension;
		 //- (void)XF_RecallFormatWithSourceDevice:(PTZplFileLocation)sourceDevice                               imageName:(NSString *)imageName                               extension:(NSString *)extension;
		[MethodName('XF_RecallFormatWithSourceDevice:imageName:extension:')]
		procedure XF_RecallFormatWithSourceDeviceimageNameextension(sourceDevice:PTZplFileLocation;imageName:NSString;extension:NSString);cdecl;
		
		
		////#pragma mark ^XG
		
		//{!
		// *  \~chinese
		// *
		// *  根据位置、全名调用要进行打印的图形图像.
		// *
		// *  @brief XG_RecallGraphic
		// *  @param sourceDevice       存储对象位置
		// *  @param imageName          对象名称 1~8 characters
		// *  @param extension          .GRF
		// *  @param XAxisMagnification x轴放大系数 1~10
		// *  @param YAxisMagnification y轴放大系数 1~10
		// *
		// *  \~english
		// *
		// *  command is used to recall one or more graphic images for printing.
		// *
		// *  @brief XG_RecallGraphic
		// *  @param sourceDevice       location of stored object
		// *  @param imageName          object name. 1~8 characters
		// *  @param extension          .GRF
		// *  @param XAxisMagnification magnification factor on the x-axis. 1~10
		// *  @param YAxisMagnification magnification factor on the y-axis. 1~10
		// *
		// }
		//- (void)XG_RecallGraphicWithSourceDevice:(PTZplFileLocation)sourceDevice
		                               //imageName:(NSString *)imageName
		                               //extension:(NSString *)extension
		                      //XAxisMagnification:(NSInteger)XAxisMagnification
		                      //YAxisMagnification:(NSInteger)YAxisMagnification;
		 //- (void)XG_RecallGraphicWithSourceDevice:(PTZplFileLocation)sourceDevice                                imageName:(NSString *)imageName                                extension:(NSString *)extension                       XAxisMagnification:(NSInteger)XAxisMagnification                       YAxisMagnification:(NSInteger)YAxisMagnification;
		[MethodName('XG_RecallGraphicWithSourceDevice:imageName:extension:XAxisMagnification:YAxisMagnification:')]
		procedure XG_RecallGraphicWithSourceDeviceimageNameextensionXAxisMagnificationYAxisMagnification(sourceDevice:PTZplFileLocation;imageName:NSString;extension:NSString;XAxisMagnification:NSInteger;YAxisMagnification:NSInteger);cdecl;
		
		
		////#pragma mark ^XZ
		
		//{!
		// *  \~chinese
		// *
		// *  结束标签格式
		// *  @brief 结束标签格式
		// *
		// *  \~english
		// *
		// *  indicates the end of a label format.
		// *  @brief end a label format
		// *
		// }
		//- (void)XZ_FormatEnd;
		procedure XZ_FormatEnd;cdecl;
		
		
		////#pragma mark ^PR
		
		//{!
		// *  \~chinese
		// *
		// *  设置打印期间的一些速度参数.
		// *
		// *  @brief 打印速度设置
		// *  @param speed            打印速度(英寸每秒) 1~14
		// *  @param slewSpeed        空甩速度(英寸每秒) 2~14
		// *  @param backfeedSpeed    回撤速度(英寸每秒) 2~14
		// *
		// *  \~english
		// *
		// *  determine the media and slew speed (feeding a blank label) during printing.
		// *
		// *  @brief set speed during printing
		// *  @param speed            print speed (inch per second). 1~14
		// *  @param slewSpeed        slew speed (inch per second). 2~14
		// *  @param backfeedSpeed    backfeed speed (inch per second). 2~14
		// *
		// }
		//- (void)PR_SetSpeed:(NSInteger)speed
		          //slewSpeed:(NSInteger)slewSpeed
		      //backfeedSpeed:(NSInteger)backfeedSpeed;
		 //- (void)PR_SetSpeed:(NSInteger)speed           slewSpeed:(NSInteger)slewSpeed       backfeedSpeed:(NSInteger)backfeedSpeed;
		[MethodName('PR_SetSpeed:slewSpeed:backfeedSpeed:')]
		procedure PR_SetSpeedslewSpeedbackfeedSpeed(speed:NSInteger;slewSpeed:NSInteger;backfeedSpeed:NSInteger);cdecl;
		
		
		////#pragma mark ^MM 打印模式
		//{!
		// *  \~chinese
		// *
		// *  确定打印机在打印一个标签或一组标签之后采取的操作.
		// *
		// *  @brief 打印模式设置
		// *  @param mode            所需的模式
		// *  @param preStripping    预剥离选择,默认是N
		// *
		// *  \~english
		// *
		// *  determine the action the printer takes after printing a label or a set of labels.
		// *
		// *  @brief Set print mode
		// *  @param mode            print mode
		// *  @param preStripping    prestripping option，defalut is N
		// *
		// }
		//- (void)MM_SetPrintMode:(PTZplPrintMode)mode
		           //preStripping:(PTZplBool)preStripping;
		 //- (void)MM_SetPrintMode:(PTZplPrintMode)mode            preStripping:(PTZplBool)preStripping;
		[MethodName('MM_SetPrintMode:preStripping:')]
		procedure MM_SetPrintModepreStripping(mode:PTZplPrintMode;preStripping:PTZplBool);cdecl;
		
		
		
		////#pragma mark - RFID ^RF
		
		//{!
		// *  \~chinese
		// *
		// *  读取或写入 RFID 格式,写入的数据是16进制字符串，eg：31323334
		// *
		// *  @brief 操作RFID
		// *  @param operation        读取或写入（TID区不可写，只可读）
		// *  @param beginAddr        起始位置，默认是0; EPC区时，默认为2
		// *  @param length           数据长度
		// *  @param memory           存储区域
		// *
		// *  \~english
		// *
		// *  Read or write RFID format,The written data is a hexadecimal string, eg: 31323334
		// *
		// *  @brief Opration RFID
		// *  @param operation        write or read(The TID section cannot be written, only read)
		// *  @param beginAddr        Start position, default is 0; For EPC, default is 2
		// *  @param length           data length
		// *  @param memory           memory area
		// *
		// }
		//- (void)RF_RFIDOperation:(PTRFIDOperation)operation
		               //beginAddr:(NSInteger)beginAddr
		                  //length:(NSInteger)length
		                  //memory:(PTZplRFIDMemory)memory;
		 //- (void)RF_RFIDOperation:(PTRFIDOperation)operation                beginAddr:(NSInteger)beginAddr                   length:(NSInteger)length                   memory:(PTZplRFIDMemory)memory;
		[MethodName('RF_RFIDOperation:beginAddr:length:memory:')]
		procedure RF_RFIDOperationbeginAddrlengthmemory(operation:PTRFIDOperation;beginAddr:NSInteger;length:NSInteger;memory:PTZplRFIDMemory);cdecl;
		
		
		
		////#pragma mark - ^HV
		//{!
		// *  \~chinese
		// *
		// *  该命令可将指定返回数据长度和数据格式，与^RF结合使用
		// *
		// *  @brief 主机验证
		// *  @param fieldNumbe        字段编号，需要和其他命令的字段编码一致
		// *  @param length            返回的字节数，0表示自动
		// *  @param head              返回的数据头
		// *  @param length            返回的数据尾
		// *
		// *  \~english
		// *
		// *  This command can be used in conjunction with ^RF to specify the length and format of the returned data
		// *
		// *  @brief Host authentication
		// *  @param fieldNumbe        Field number, need to be the same as the field code of other commands
		// *  @param length            Number of bytes returned, 0 for automatic
		// *  @param head              The data header returned
		// *  @param end               The tail of the returned data
		// *
		// }
		//- (void)HV_SetBackDataAuthWithFieldNumber:(NSInteger)fieldNumber length:(NSInteger)length head:(NSString *)head end:(NSString *)end;
		[MethodName('HV_SetBackDataAuthWithFieldNumber:length:head:end:')]
		procedure HV_SetBackDataAuthWithFieldNumberlengthheadend(fieldNumber:NSInteger;length:NSInteger;head:NSString;_end:NSString);cdecl;
		
		
	end;
	
	PTCommandZPLClass=interface(NSObjectClass)//
	['{FECC6C6E-8DD5-4C27-9052-19CCE56A69E2}']
	end;
	
	TPTCommandZPL=class(TOCGenericImport<PTCommandZPLClass,PTCommandZPL>)
	end;
	
	
	
	
	
	//NS_ASSUME_NONNULL_END
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTCommandZPL_FakeLoader : PTCommandZPL; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTCommandZPL';
{$O+}



{$ENDIF}

end.

