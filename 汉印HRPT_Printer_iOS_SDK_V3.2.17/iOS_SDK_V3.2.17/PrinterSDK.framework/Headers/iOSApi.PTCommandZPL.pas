//{!
// *  \~chinese
// *  @header PTCommandZPL.h
// *  @abstract ZPLָ��
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
	// ��ӡ��Ŀǰ֧�ֵ�����
	// 
	// index     name   font_id    �ַ���/character set
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
	// Process mode�� if it exceeds the ID range, the program will set it as ��c�� font
	// ����ʽ���������ID ��Χ����������Ϊ ��c������
	// }
	
	
	//typedef NS_ENUM(UInt8, PTZplOrientation) {
	    ///*! \~chinese ���� \~english normal */
	    //PTZplOrientation_N = 'N',
	    ///*! \~chinese ˳ʱ����ת90�� \~english rotate 90 degrees (clockwise) */
	    //PTZplOrientation_R = 'R',
	    ///*! \~chinese 180����ת \~english inverted 180 degrees */
	    //PTZplOrientation_I = 'I',
	    ///*! \~chinese 270����ת \~english read from bottom up, 270 degrees */
	    //PTZplOrientation_B = 'B'
	//};
	//typedef NS_ENUM(UInt8, PTZplOrientation) {
	PTZplOrientation_=(
	//(UInt8, PTZplOrientation) {
	//    /*! \~chinese ���� \~english normal */
	    PTZplOrientation_N,// = 'N',
	//    /*! \~chinese ˳ʱ����ת90�� \~english rotate 90 degrees (clockwise) */
	    PTZplOrientation_R,// = 'R',
	//    /*! \~chinese 180����ת \~english inverted 180 degrees */
	    PTZplOrientation_I,// = 'I',
	//    /*! \~chinese 270����ת \~english read from bottom up, 270 degrees */
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
	    ///*! \~chinese �ļ�·��R: \~english file location R: */
	    //PTZplFileLocation_R = 'R',
	    ///*! \~chinese �ļ�·��E: \~english file location E: */
	    //PTZplFileLocation_E = 'E',
	    ///*! \~chinese �ļ�·��B: \~english file location B: */
	    //PTZplFileLocation_B = 'B',
	    ///*! \~chinese �ļ�·��A: \~english file location A: */
	    //PTZplFileLocation_A = 'A'
	//};
	//typedef NS_ENUM(UInt8, PTZplFileLocation) {
	PTZplFileLocation_=(
	//(UInt8, PTZplFileLocation) {
	//    /*! \~chinese �ļ�·��R: \~english file location R: */
	    PTZplFileLocation_R,// = 'R',
	//    /*! \~chinese �ļ�·��E: \~english file location E: */
	    PTZplFileLocation_E,// = 'E',
	//    /*! \~chinese �ļ�·��B: \~english file location B: */
	    PTZplFileLocation_B,// = 'B',
	//    /*! \~chinese �ļ�·��A: \~english file location A: */
	    PTZplFileLocation_A//,// = 'A'
	);
	PTZplFileLocation=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplBool) {
	    ///*! \~chinese �� \~english yes */
	    //PTZplBool_Y = 'Y',
	    ///*! \~chinese �� \~english no */
	    //PTZplBool_N = 'N'
	//};
	//typedef NS_ENUM(UInt8, PTZplBool) {
	PTZplBool_=(
	//(UInt8, PTZplBool) {
	//    /*! \~chinese �� \~english yes */
	    PTZplBool_Y,// = 'Y',
	//    /*! \~chinese �� \~english no */
	    PTZplBool_N//,// = 'N'
	);
	PTZplBool=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplCodeBlockBarCodeMode) {
	    ///*! \~chinese Code 39 �ַ��� \~english use Code 39 character set */
	    //PTZplCodeBlockBarCodeMode_A = 'A',
	    ///*! \~chinese Code 128 �ַ��� \~english use Code 128 character set */
	    //PTZplCodeBlockBarCodeMode_F = 'F',
	    ///*! \~chinese Code 128 �ַ������Զ����FNC1. \~english use the Code 128 character set and automatically adds FNC1. */
	    //PTZplCodeBlockBarCodeMode_E = 'E'
	//};
	//typedef NS_ENUM(UInt8, PTZplCodeBlockBarCodeMode) {
	PTZplCodeBlockBarCodeMode_=(
	//(UInt8, PTZplCodeBlockBarCodeMode) {
	//    /*! \~chinese Code 39 �ַ��� \~english use Code 39 character set */
	    PTZplCodeBlockBarCodeMode_A,// = 'A',
	//    /*! \~chinese Code 128 �ַ��� \~english use Code 128 character set */
	    PTZplCodeBlockBarCodeMode_F,// = 'F',
	//    /*! \~chinese Code 128 �ַ������Զ����FNC1. \~english use the Code 128 character set and automatically adds FNC1. */
	    PTZplCodeBlockBarCodeMode_E//,// = 'E'
	);
	PTZplCodeBlockBarCodeMode=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplCode128Mode) {
	    ///*! \~chinese ��ѡ��ģʽ \~english no selected mode */
	    //PTZplCode128Mode_N = 'N',
	    ///*! \~chinese UCC Case ģʽ \~english UCC Case Mode */
	    //PTZplCode128Mode_U = 'U',
	    ///*! \~chinese �Զ�ģʽ \~english Automatic Mode */
	    //PTZplCode128Mode_A = 'A',
	    ///*! \~chinese UCC/EAN Mode \~english UCC/EAN Mode */
	    //PTZplCode128Mode_D = 'D'
	//};
	//typedef NS_ENUM(UInt8, PTZplCode128Mode) {
	PTZplCode128Mode_=(
	//(UInt8, PTZplCode128Mode) {
	//    /*! \~chinese ��ѡ��ģʽ \~english no selected mode */
	    PTZplCode128Mode_N,// = 'N',
	//    /*! \~chinese UCC Case ģʽ \~english UCC Case Mode */
	    PTZplCode128Mode_U,// = 'U',
	//    /*! \~chinese �Զ�ģʽ \~english Automatic Mode */
	    PTZplCode128Mode_A,// = 'A',
	//    /*! \~chinese UCC/EAN Mode \~english UCC/EAN Mode */
	    PTZplCode128Mode_D//,// = 'D'
	);
	PTZplCode128Mode=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplJustification) {
	    ///*! \~chinese ����� \~english left justication */
	    //PTZplJustificationLeft = '0',
	    ///*! \~chinese �Ҷ��� \~english right justication */
	    //PTZplJustificationRight = '1',
	    ///*! \~chinese �Զ����� \~english auto justication */
	    //PTZplJustificationAuto = '2'
	//};
	//typedef NS_ENUM(UInt8, PTZplJustification) {
	PTZplJustification_=(
	//(UInt8, PTZplJustification) {
	//    /*! \~chinese ����� \~english left justication */
	    PTZplJustificationLeft,// = '0',
	//    /*! \~chinese �Ҷ��� \~english right justication */
	    PTZplJustificationRight,// = '1',
	//    /*! \~chinese �Զ����� \~english auto justication */
	    PTZplJustificationAuto//,// = '2'
	);
	PTZplJustification=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplColor) {
	    ///*! \~chinese ��ɫ \~english black color */
	    //PTZplColorBlack = 'B',
	    ///*! \~chinese ��ɫ \~english white color */
	    //PTZplColorWhite = 'W'
	//};
	//typedef NS_ENUM(UInt8, PTZplColor) {
	PTZplColor_=(
	//(UInt8, PTZplColor) {
	//    /*! \~chinese ��ɫ \~english black color */
	    PTZplColorBlack,// = 'B',
	//    /*! \~chinese ��ɫ \~english white color */
	    PTZplColorWhite//,// = 'W'
	);
	PTZplColor=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplDiagonalOrientation) {
	    ///*! \~chinese �ҿ�б�� \~english right leaning diagonal */
	    //PTZplDiagonalOrientationLeaningRight = 'R',
	    ///*! \~chinese ��б�� \~english left leaning diagonal */
	    //PTZplDiagonalOrientationLeaningLeft = 'L'
	//};
	//typedef NS_ENUM(UInt8, PTZplDiagonalOrientation) {
	PTZplDiagonalOrientation_=(
	//(UInt8, PTZplDiagonalOrientation) {
	//    /*! \~chinese �ҿ�б�� \~english right leaning diagonal */
	    PTZplDiagonalOrientationLeaningRight,// = 'R',
	//    /*! \~chinese ��б�� \~english left leaning diagonal */
	    PTZplDiagonalOrientationLeaningLeft//,// = 'L'
	);
	PTZplDiagonalOrientation=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplMediaType) {
	    ///*! \~chinese ��תӡ���� \~english thermal transfer media */
	    //PTZplMediaTypeThermalTransfer = 'T',
	    ///*! \~chinese �������� \~english direct thermal media */
	    //PTZplMediaTypeDirectThermal = 'D'
	//};
	//typedef NS_ENUM(UInt8, PTZplMediaType) {
	PTZplMediaType_=(
	//(UInt8, PTZplMediaType) {
	//    /*! \~chinese ��תӡ���� \~english thermal transfer media */
	    PTZplMediaTypeThermalTransfer,// = 'T',
	//    /*! \~chinese �������� \~english direct thermal media */
	    PTZplMediaTypeDirectThermal//,// = 'D'
	);
	PTZplMediaType=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplQrReliabilityLevel) {
	    ///*! \~chinese ���߿ɿ����� \~english ultra-high reliability level */
	    //PTZplQrReliabilityLevel_H = 'H',
	    ///*! \~chinese �߿ɿ����� \~english high reliability level */
	    //PTZplQrReliabilityLevel_Q = 'Q',
	    ///*! \~chinese ��׼���� \~english standard level */
	    //PTZplQrReliabilityLevel_M = 'M',
	    ///*! \~chinese ?�ܶȼ��� \~english high density level level */
	    //PTZplQrReliabilityLevel_L = 'L'
	//};
	//typedef NS_ENUM(UInt8, PTZplQrReliabilityLevel) {
	PTZplQrReliabilityLevel_=(
	//(UInt8, PTZplQrReliabilityLevel) {
	//    /*! \~chinese ���߿ɿ����� \~english ultra-high reliability level */
	    PTZplQrReliabilityLevel_H,// = 'H',
	//    /*! \~chinese �߿ɿ����� \~english high reliability level */
	    PTZplQrReliabilityLevel_Q,// = 'Q',
	//    /*! \~chinese ��׼���� \~english standard level */
	    PTZplQrReliabilityLevel_M,// = 'M',
	//    /*! \~chinese ?�ܶȼ��� \~english high density level level */
	    PTZplQrReliabilityLevel_L// = 'L'
	);
	PTZplQrReliabilityLevel=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplQrModel) {
	    ///*! \~chinese ��׼ \~english original */
	    //PTZplQrModel_1 = '1',
	    ///*! \~chinese ��ǿ \~english enhanced */
	    //PTZplQrModel_2 = '2'
	//};
	//typedef NS_ENUM(UInt8, PTZplQrModel) {
	PTZplQrModel_=(
	//(UInt8, PTZplQrModel) {
	//    /*! \~chinese ��׼ \~english original */
	    PTZplQrModel_1,// = '1',
	//    /*! \~chinese ��ǿ \~english enhanced */
	    PTZplQrModel_2// = '2'
	);
	PTZplQrModel=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplTextPrintDirection) {
	    ///*! \~chinese ˮƽ��ӡ(��������) \~english horizontal printing (left to right) */
	    //PTZplTextPrintDirection_H = 'H',
	    ///*! \~chinese ��ֱ��ӡ(��������) \~english vertical printing (top to bottom) */
	    //PTZplTextPrintDirection_V = 'V',
	    ///*! \~chinese �����ӡ(��������) \~english reverse printing (right to left) */
	    //PTZplTextPrintDirection_R = 'R'
	//};
	//typedef NS_ENUM(UInt8, PTZplTextPrintDirection) {
	PTZplTextPrintDirection_=(
	//(UInt8, PTZplTextPrintDirection) {
	//    /*! \~chinese ˮƽ��ӡ(��������) \~english horizontal printing (left to right) */
	    PTZplTextPrintDirection_H,// = 'H',
	//    /*! \~chinese ��ֱ��ӡ(��������) \~english vertical printing (top to bottom) */
	    PTZplTextPrintDirection_V,// = 'V',
	//    /*! \~chinese �����ӡ(��������) \~english reverse printing (right to left) */
	    PTZplTextPrintDirection_R// = 'R'
	);
	PTZplTextPrintDirection=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplPrintOrientation) {
	    ///*! \~chinese ͨ�ô�ӡ \~english normal */
	    //PTZplPrintOrientation_N = 'N',
	    ///*! \~chinese �����ӡ \~english invert */
	    //PTZplPrintOrientation_I = 'I'
	//};
	//typedef NS_ENUM(UInt8, PTZplPrintOrientation) {
	PTZplPrintOrientation_=(
	//(UInt8, PTZplPrintOrientation) {
	//    /*! \~chinese ͨ�ô�ӡ \~english normal */
	    PTZplPrintOrientation_N,// = 'N',
	//    /*! \~chinese �����ӡ \~english invert */
	    PTZplPrintOrientation_I// = 'I'
	);
	PTZplPrintOrientation=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplUpsMaxiCodeMode) {
	    ///*! \~chinese �ṹ����Ϣ����:������������(U.S.) \~english structured carrier message: numeric postal code (U.S.) */
	    //PTZplUpsMaxiCodeMode_2 = '2',
	    ///*! \~chinese �ṹ����Ϣ����:������������(non-U.S.) \~english structured carrier message: numeric postal code (non-U.S.) */
	    //PTZplUpsMaxiCodeMode_3 = '3',
	    ///*! \~chinese ��׼���� \~english standard symbol, secretary */
	    //PTZplUpsMaxiCodeMode_4 = '4',
	    ///*! \~chinese ȫEEC \~english full EEC */
	    //PTZplUpsMaxiCodeMode_5 = '5',
	    ///*! \~chinese reader program \~english reader program, secretary */
	    //PTZplUpsMaxiCodeMode_6 = '6'
	//};
	//typedef NS_ENUM(UInt8, PTZplUpsMaxiCodeMode) {
	PTZplUpsMaxiCodeMode_=(
	//(UInt8, PTZplUpsMaxiCodeMode) {
	//    /*! \~chinese �ṹ����Ϣ����:������������(U.S.) \~english structured carrier message: numeric postal code (U.S.) */
	    PTZplUpsMaxiCodeMode_2,// = '2',
	//    /*! \~chinese �ṹ����Ϣ����:������������(non-U.S.) \~english structured carrier message: numeric postal code (non-U.S.) */
	    PTZplUpsMaxiCodeMode_3,// = '3',
	//    /*! \~chinese ��׼���� \~english standard symbol, secretary */
	    PTZplUpsMaxiCodeMode_4,// = '4',
	//    /*! \~chinese ȫEEC \~english full EEC */
	    PTZplUpsMaxiCodeMode_5,// = '5',
	//    /*! \~chinese reader program \~english reader program, secretary */
	    PTZplUpsMaxiCodeMode_6// = '6'
	);
	PTZplUpsMaxiCodeMode=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTCode49InterpretationLineStyle) {
	    ///*! \~chinese ����ӡ������ \~english no line printed. */
	    //PTCode49InterpretationLineStyle_N = 'N',
	    ///*! \~chinese �������Ϸ���ӡ������ \~english print interpretation line above code. */
	    //PTCode49InterpretationLineStyle_A = 'A',
	    ///*! \~chinese �������·���ӡ������ \~english print interpretation line below code. */
	    //PTCode49InterpretationLineStyle_B = 'B'
	//};
	//typedef NS_ENUM(UInt8, PTCode49InterpretationLineStyle) {
	PTCode49InterpretationLineStyle_=(
	//(UInt8, PTCode49InterpretationLineStyle) {
	//    /*! \~chinese ����ӡ������ \~english no line printed. */
	    PTCode49InterpretationLineStyle_N,// = 'N',
	//    /*! \~chinese �������Ϸ���ӡ������ \~english print interpretation line above code. */
	    PTCode49InterpretationLineStyle_A,// = 'A',
	//    /*! \~chinese �������·���ӡ������ \~english print interpretation line below code. */
	    PTCode49InterpretationLineStyle_B// = 'B'
	);
	PTCode49InterpretationLineStyle=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplPrintMode) {
	    ///*! \~chinese ˺�� \~english tear. */
	    //PTZplPrintMode_T = 'T',
	    ///*! \~chinese ���� \~english stripper. */
	    //PTZplPrintMode_P = 'P',
	    ///*! \~chinese �ؾ� \~english rollback model. */
	    //PTZplPrintMode_R = 'R',
	    ///*! \~chinese ����� \~english Labeling machine. */
	    //PTZplPrintMode_A = 'A',
	    ///*! \~chinese ��ֽ�� \~english Paper cutting machine. */
	    //PTZplPrintMode_C = 'C',
	    ///*! \~chinese �ӳ���ֽ�� \~english Delay paper cutter. */
	    //PTZplPrintMode_D = 'D',
	    ///*! \~chinese RFID \~english RFID. */
	    //PTZplPrintMode_F = 'F',
	    ///*! \~chinese �����ն�ģʽ \~english Self-service terminal mode. */
	    //PTZplPrintMode_K = 'K'
	//};
	//typedef NS_ENUM(UInt8, PTZplPrintMode) {
	PTZplPrintMode_=(
	//(UInt8, PTZplPrintMode) {
	//    /*! \~chinese ˺�� \~english tear. */
	    PTZplPrintMode_T,// = 'T',
	//    /*! \~chinese ���� \~english stripper. */
	    PTZplPrintMode_P,// = 'P',
	//    /*! \~chinese �ؾ� \~english rollback model. */
	    PTZplPrintMode_R,// = 'R',
	//    /*! \~chinese ����� \~english Labeling machine. */
	    PTZplPrintMode_A,// = 'A',
	//    /*! \~chinese ��ֽ�� \~english Paper cutting machine. */
	    PTZplPrintMode_C,// = 'C',
	//    /*! \~chinese �ӳ���ֽ�� \~english Delay paper cutter. */
	    PTZplPrintMode_D,// = 'D',
	//    /*! \~chinese RFID \~english RFID. */
	    PTZplPrintMode_F,// = 'F',
	//    /*! \~chinese �����ն�ģʽ \~english Self-service terminal mode. */
	    PTZplPrintMode_K// = 'K'
	);
	PTZplPrintMode=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTRFIDOperation) {
	    ///*! \~chinese д���� \~english write data */
	    //PTRFIDOperation_W = 'W',
	    ///*! \~chinese ������ \~english read data */
	    //PTRFIDOperation_R  = 'R'
	//};
	//typedef NS_ENUM(UInt8, PTRFIDOperation) {
	PTRFIDOperation_=(
	//(UInt8, PTRFIDOperation) {
	//    /*! \~chinese д���� \~english write data */
	    PTRFIDOperation_W,// = 'W',
	//    /*! \~chinese ������ \~english read data */
	    PTRFIDOperation_R//  = 'R'
	);
	PTRFIDOperation=Integer;
	
	
	
	
	
	//typedef NS_ENUM(UInt8, PTZplRFIDMemory) {
	    ///*! \~chinese Ԥ����,ͨ��������8�ֽ�(beginAddr[��ʼ��ַ] * 2 + bytes[�ֽ���] / 2 <= 8����ͬ) \~english Reserved��Usually no more than 8 bytes(BeginAddr * 2 + Bytes / 2 < 8, same below) */
	    //PTZplRFIDMemoryReserved    = '0',
	    ///*! \~chinese EPC����ͨ��������16�ֽ�(��ʼ��ַ��2��ʼ) \~english EPC��Usually no more than 16 bytes(The starting address starts at 2) */
	    //PTZplRFIDMemoryEPC         = '1',
	    ///*! \~chinese TID����ͨ��������128�ֽڣ�����д���� \~english TID��Usually no more than 128 bytes��Unwritable data */
	    //PTZplRFIDMemoryTID         = '2',
	    ///*! \~chinese User����ͨ��������128�ֽ� \~english User��Usually no more than 128 bytes */
	    //PTZplRFIDMemoryUser        = '3'
	//};
	//typedef NS_ENUM(UInt8, PTZplRFIDMemory) {
	PTZplRFIDMemory_=(
	//(UInt8, PTZplRFIDMemory) {
	//    /*! \~chinese Ԥ����,ͨ��������8�ֽ�(beginAddr[��ʼ��ַ] * 2 + bytes[�ֽ���] / 2 <= 8����ͬ) \~english Reserved��Usually no more than 8 bytes(BeginAddr * 2 + Bytes / 2 < 8, same below) */
	    PTZplRFIDMemoryReserved,//    = '0',
	//    /*! \~chinese EPC����ͨ��������16�ֽ�(��ʼ��ַ��2��ʼ) \~english EPC��Usually no more than 16 bytes(The starting address starts at 2) */
	    PTZplRFIDMemoryEPC,//         = '1',
	//    /*! \~chinese TID����ͨ��������128�ֽڣ�����д���� \~english TID��Usually no more than 128 bytes��Unwritable data */
	    PTZplRFIDMemoryTID,//         = '2',
	//    /*! \~chinese User����ͨ��������128�ֽ� \~english User��Usually no more than 128 bytes */
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
		// *  �·�����ӡ��������.
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
		// *  ָ��ʹ�õı��룬Ĭ����GBK.
		// *
		// *  \~english
		// *
		// *  encode��default is GBK.
		// *
		// }
		//@property (nonatomic, assign) NSStringEncoding encoding;
		function encoding:NSStringEncoding;cdecl;
		procedure setEncoding(encoding:NSStringEncoding);cdecl;
		
		////#pragma mark - ZPL Commands
		
		//{!
		// *  \~chinese
		// *  ��ӡ�Լ�ҳ
		// *  @brief ��ӡ�Լ�ҳ
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
		// *  ��ֽһ��
		// *  @brief ��ֽһ��
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
		// *  ��������
		// *
		// *  @brief ʹ���������������峯�򡢴�С
		// *  @param fontName         ������
		// *  @param fieldOrientation ���峯��
		// *  @param characterHeight  ����߶�(��) 10~3200
		// *  @param width            ������(��) 10~3200
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
		// *  ��������.
		// *
		// *  @brief ʹ���������������峯��
		// *  @param fontName         ������
		// *  @param fieldOrientation ���峯��
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
		// *  ��������.
		// *
		// *  @brief ʹ�����������������С
		// *  @param fontName         ������
		// *  @param characterHeight  ����߶�(��) 10~3200
		// *  @param width            ������(��) 10~3200
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
		// *  ��������.
		// *
		// *  @brief ʹ����������������
		// *  @param fontName ������
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
		// *  ʹ�������ļ���������,��ӡ���Ľ���ʹ�øýӿ�
		// *
		// *  @brief ʹ�������ļ��������峯�򡢴�С
		// *  @param orientation  ���峯��
		// *  @param height       ����߶�(��) 10~3200
		// *  @param width        ������(��) 10~3200
		// *  @param location     �����ļ�����λ��,Ĭ��ѡ��E
		// *
		// *  \~english
		// *
		// *  specifies the font by the complete name of a font��this interface is recommended for printing Chinese
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
		// *  ʹ�������ļ���������
		// *
		// *  @brief �������峯�򡢴�С
		// *  @param orientation  ���峯��
		// *  @param height       ����߶�(��) 10~3200
		// *  @param width        ������(��) 10~3200
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
		// *  ����Aztec��
		// *
		// *  @brief Aztec��
		// *  @param orientation           ����
		// *  @param magnificationFactor   �Ŵ�ϵ��
		// *  @param isContainECIC         �Ƿ����ECIC
		// *  @param errorAndSymbol        ����ͷ��Ŵ�С 0,01~99,101~104,201~232,300
		// *  @param isMenuSymbol          �Ƿ�����˵�ָʾ��
		// *  @param appendSymbolNumber    �ṹ�����ӵķ������� 1~26
		// *  @param appendOptionalID      ���ڽṹ�����ӵĿ�ѡID�ֶ�
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
		// *  ����Code11��
		// *
		// *  @brief Code11��
		// *  @param orientation           ����
		// *  @param checkDigit            У��λ Y->1 N->2
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
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
		// *  ����Code39��
		// *
		// *  @brief Code39��
		// *  @param orientation           ����
		// *  @param checkDigit            Mod-43 У��λ
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
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
		
		
		////#pragma mark ^B4 Code 49 ��
		
		//{!
		// *  \~chinese
		// *
		// *  ����Code49��
		// *
		// *  @brief Code49��
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param style                 ��������ʽ
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
		
		
		////#pragma mark ^B7 PDF417 ��
		
		//{!
		// *  \~chinese
		// *
		// *  ����PDF417��
		// *
		// *  @brief PDF417��
		// *  @param orientation       ����
		// *  @param barcodeHeight     ���������߶�(��),������ȡ1
		// *  @param securityLevel     ��ȫ���� 1~8
		// *  @param columns           Ҫ������������� 1~30
		// *  @param rows              Ҫ��������� 3~90
		// *  @param truncation        �Ƿ�ضϲ�����ָʾ������ֹͼ��
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
		
		////#pragma mark ^B8 EAN-8 ����
		
		//{!
		// *  \~chinese
		// *
		// *  ����EAN-8��
		// *
		// *  @brief EAN-8��
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
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
		
		
		////#pragma mark ^B9 UPC-E ����
		
		//{!
		// *  \~chinese
		// *
		// *  ����UPC-E��
		// *
		// *  @brief UPC-E��
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
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
		
		
		////#pragma mark ^BA Code 93 ����
		
		//{!
		// *  \~chinese
		// *
		// *  ����Code93��
		// *
		// *  @brief Code93��
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
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
		
		
		////#pragma mark ^BB CodeBlock ����
		
		//{!
		// *  \~chinese
		// *
		// *  CODABLOCK ����
		// *
		// *  @brief CODABLOCK ����
		// *  @param orientation      ����
		// *  @param barcodeHeight    ����߶�(��) 1~32000
		// *  @param securityLevel    ��ȫ
		// *  @param perRowCharacters ÿ�е��ַ��� 2-62
		// *  @param rows             Ҫ���������
		// *  @param mode             ģʽ
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
		
		////#pragma mark ^BC Code 128 ����
		
		//{!
		// *  \~chinese
		// *
		// *  ����Code128��(�Ӽ�A��B��C)
		// *
		// *  @brief Code128��(�Ӽ�A��B��C)
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
		// *  @param checkDigit            UCCУ��λ
		// *  @param mode                  ģʽ
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
		
		
		////#pragma mark ^BD UPS Maxicode ����
		
		//{!
		// *  \~chinese
		// *
		// *  UPS MaxiCode ����.
		// *
		// *  @brief UPS MaxiCode ����
		// *  @param mode                 ģʽ
		// *  @param symbolNumber         ���ű�� 1~8
		// *  @param totalSymbolNumbers   �������� 1~8
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
		
		
		////#pragma mark ^BE EAN-18 ����
		
		//{!
		// *  \~chinese
		// *
		// *  ����EAN-13��
		// *
		// *  @brief EAN-13��
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
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
		
		////#pragma mark ^BF ΢�� PDF417 ����
		
		//{!
		// *  \~chinese
		// *
		// *  ����MicroPDF417����
		// *
		// *  @brief MicroPDF417����
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��9999
		// *  @param mode                  ģʽ 0~33
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
		
		
		////#pragma mark ^BI ��ҵ������
		
		//{!
		// *  \~chinese
		// *
		// *  ���ɹ�ҵ������
		// *
		// *  @brief ��ҵ������
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
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
		
		
		////#pragma mark ^BJ ��׼������
		
		//{!
		// *  \~chinese
		// *
		// *  ���ɱ�׼������
		// *
		// *  @brief ��׼������
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
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
		// *  ����ANSI Codabar ����
		// *
		// *  @brief ANSI Codabar����
		// *  @param orientation           ����
		// *  @param checkDigit            У��λ
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
		// *  @param startCharacter       ָ����ʼ�ַ� (A,B,C,D)
		// *  @param stopCharacter        ָ����ֹ�ַ� (A,B,C,D)
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
		
		
		
		////#pragma mark ^BL LOGMARS ����
		
		//{!
		// *  \~chinese
		// *
		// *  LOGMARS ����
		// *
		// *  @brief LOGMARS����
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param isPrint    �Ƿ��������Ϸ���ӡ������
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
		
		
		////#pragma mark ^BQ QRcode ��ά��
		
		//{!
		// *  \~chinese
		// *
		// *  ����QR��
		// *
		// *  @brief QR��
		// *  @param orientation       ����
		// *  @param model             ģʽ
		// *  @param magnification     �Ŵ�ϵ�� 1~10
		// *  @param reliabilityLevel  �ɿ��Եȼ�
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
		// *  ����UPC/EAN��չ��
		// *
		// *  @brief UPC/EAN��չ��
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��32000
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
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
		
		
		////#pragma mark ^BU UPC-A ����
		
		//{!
		// *  \~chinese
		// *
		// *  ����UPC/EAN��չ��
		// *
		// *  @brief UPC/EAN��չ��
		// *  @param orientation           ����
		// *  @param barcodeHeight         ����߶�(��) 1��9999
		// *  @param interpretationLine    �Ƿ��ӡ������
		// *  @param aboveCode             �������Ƿ��ӡ�������Ϸ�
		// *  @param checkDigit            �Ƿ��ӡУ��λ
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
		// *  ��������Ĭ��ֵ.
		// *
		// *  @brief ��������Ĭ�ϴ�С��խ���
		// *  @param moduleWidth   ģ����(��) 1-10
		// *  @param ratio         խ�������� 2.0-3.0
		// *  @param barcodeHeight ����߶�(��)
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
		// *  ��������Ĭ��ֵ.
		// *
		// *  @brief ��������Ĭ�Ͽ��
		// *  @param moduleWidth   ģ����(��) 1-10
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
		// *  �޸ĸ�ʽָ��ǰ׺��Ĭ��Ϊ�ַ�'^'
		// *
		// *  @brief �޸ĸ�ʽָ��ǰ׺
		// *  @param character    ��Ҫ�޸ĵ��ַ�,����ASCII�ַ�
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
		// *  �޸�ָ��ָ�����Ĭ��Ϊ�ַ�','
		// *
		// *  @brief �޸�ָ��ָ���
		// *  @param character    ��Ҫ�޸ĵ��ַ�,����ASCII�ַ�
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
		// *  ������ĸ����Ĭ������
		// *
		// *  @brief ������ĸ����Ĭ�����塢��С
		// *  @param font     Ĭ������
		// *  @param width    �ַ����(��) 0~32000
		// *  @param height   �ַ��߶�(��) 0~32000
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
		// *  ������ĸ����Ĭ������
		// *
		// *  @brief ������ĸ����Ĭ������
		// *  @param font     Ĭ������
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
		// *  ������ĸ����Ĭ������
		// *
		// *  @brief ������ĸ����Ĭ�������С
		// *  @param width    �ַ����(��) 0~32000
		// *  @param height   �ַ��߶�(��) 0~32000
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
		// *  ����Ҫ�������д�ӡ�Ĺ����ַ���,�����ڱ�ǩ����ϴ�ӡ��ͬ���ַ�����
		// *
		// *  @brief �����ַ���
		// *  @param characterSet �ַ��� 0-36 ���ޱ��룺14
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
		// *  �޸Ŀ���ָ��ǰ׺��Ĭ��Ϊ�ַ�'~'
		// *
		// *  @brief �޸Ŀ���ָ��ǰ׺
		// *  @param character    ��Ҫ�޸ĵ��ַ�,����ASCII�ַ�
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
		// *  ����������֤
		// *
		// *  @brief ����������֤
		// *  @param codeValidation   �Ƿ���������֤
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
		// *  �޸������ʶ����Ӧ������
		// *
		// *  @brief �޸������ʶ����Ӧ������
		// *  @param fontName          ��Ҫ�޸ĵı�ʶ��
		// *  @param fontDriveLocation ����洢λ��
		// *  @param downloadedFont    ��ʶ����Ӧ��������
		// *  @param extension         �����׺(FNT,TTF,TTE)
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
		// *  ����zpl��ʽ����
		// *
		// *  @brief ����zpl��ʽ����
		// *  @param deviceToStoreImage �洢λ��
		// *  @param imageName          ���� 1~8����ĸ�����ַ�
		// *  @param extension          ��չ�� (.ZPL)
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
		
		
		////#pragma mark ^DG ��ӡͼƬ
		
		//{!
		// *  \~chinese
		// *
		// *  ����ͼƬ
		// *
		// *  @brief ����ͼƬ
		// *  @param cgImage            ͼƬ
		// *  @param bitmapMode         ͼƬģʽ
		// *  @param compress           ѹ������
		// *  @param deviceLocation     �洢λ��
		// *  @param imageName          ���� 1~8����ĸ�����ַ�
		// *  @param extension          ��չ�� (GRF)
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
		// *  ������ص�ͼ��
		// *  @brief ������ص�ͼ��
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
		// *  �����ӡ��������ַ���,�����ݿ����ǳ���������ǰ׺(^�� ~)�������ɴ�ӡ�ַ�������ָ������Ѿ�����^FS
		// *
		// *  @brief �����ӡ����
		// *  @param fieldData ���ڴ�ӡ������
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
		// *  ��������ʮ������ָʾ��
		// *
		// *  @brief ����ʮ������ָʾ��
		// *  @param hexadecimalIndicator ʮ������ָʾ��
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
		// *  ����Ĭ�ϵ�ʮ������ָʾ�� '_'
		// *
		// *  @brief ����Ĭ�ϵ�ʮ������ָʾ��
		// *  @param hexadecimalIndicator ʮ������ָʾ��
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
		// *  �ֶα��ָ��.
		// *
		// *  @brief ��ѡ����ֶα��
		// *  @param fieldNumber  Ҫ������ֶεı��
		// *  @param optional     ��ѡ����
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
		// *  �ֶα��ָ��.
		// *
		// *  @brief �ֶα��
		// *  @param fieldNumber  Ҫ������ֶεı��
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
		// *  ����������ڱ�ǩ��ʼ����ʼλ��
		// *
		// *  @brief ���ñ�ǩ��ʼλ�á����뷽ʽ
		// *  @param XAxis         x��λ��(��) (0~32000)
		// *  @param YAxis         y��λ��(��) (0~32000)
		// *  @param justification ���뷽ʽ
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
		// *  ����������ڱ�ǩ��ʼ����ʼλ��
		// *
		// *  @brief ���ñ�ǩ��ʼλ��
		// *  @param XAxis         x��λ��(��) (0~32000)
		// *  @param YAxis         y��λ��(��) (0~32000)
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
		// *  ���������ֶθ�ʽ��ͨ�����ڴ�ӡ��������
		// *
		// *  @brief �������ִ�ӡ����
		// *  @param direction    ���ִ�ӡ����
		// *  @param characterGap �ַ��丽�Ӽ��(��) (0~9999)
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
		// *  ����ӡĳ�������Ѿ�ʹ�������ָ���ӡ���������ݱ���ɫ���з�ת
		// *  @brief ��ת��ӡ
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
		// *  �����ָ���,��ʾ��Ķ����Ѿ�����
		// *  @brief �����ָ���
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
		// *  ����������ڱ�ǩ��ʼ����ʼλ��
		// *
		// *  @brief ���ñ�ǩ��ʼλ�á����뷽ʽ
		// *  @param XAxis         x��λ��(��) (0~32000)
		// *  @param YAxis         y��λ��(��) (0~32000)
		// *  @param justification ���뷽ʽ
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
		// *  ����������ڱ�ǩ��ʼ����ʼλ��
		// *
		// *  @brief ���ñ�ǩ��ʼλ��
		// *  @param XAxis         x��λ��(��) (0~32000)
		// *  @param YAxis         y��λ��(��) (0~32000)
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
		// *  ȱ������ʱ,��ٶ�λ����һ�������ø�ʽ���ֶκ���,��һ���䷨�����ֶ�����������ֶε�λ��,�ڵ�һ���ֶζ�λ��,�����ֶν��Զ��������.
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
		// *  ���ֶ�Ϊ����ʱ,FV���滻���ñ�ǩ��ʽ��FD(�ֶ�����)��������.
		// *
		// *  @brief �����
		// *  @param variableFieldDatavariable ����
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
		// *  ��������Ϊ���о�����ת����������ֶ�����Ĭ�Ϸ���,��������Ϊ���о��ж����������������Ĭ�϶��뷽ʽ.
		// *
		// *  @brief ����Ĭ�ϳ��򡢶��뷽ʽ
		// *  @param fieldOrientation ����
		// *  @param justification    ���뷽ʽ
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
		// *  ����Ϊ���о�����ת����������ֶ�����Ĭ�Ϸ���
		// *
		// *  @brief ����Ĭ�ϳ���
		// *  @param fieldOrientation ����
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
		// *  ���ע��
		// *
		// *  @brief ���ע��
		// *  @param comment ע������
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
		// *  ���ߺͻ���.
		// *
		// *  @brief ���ƴ���ɫ��Բ�ǵ��߻��
		// *  @param width                ���(��) thickness~32000
		// *  @param height               �߶ȶ�(��) thickness~32000
		// *  @param thickness            ���(��) 1~32000
		// *  @param lineColor            ������ɫ
		// *  @param cornorRoundingDegree Բ�ǳ̶� 0~8
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
		// *  ���ߺͻ���.
		// *
		// *  @brief ���ƴ�Բ�ǵ��߻��
		// *  @param width                ���(��) thickness~32000
		// *  @param height               �߶ȶ�(��) thickness~32000
		// *  @param thickness            ���(��) 1~32000
		// *  @param cornorRoundingDegree Բ�ǳ̶� 0~8
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
		// *  ���ߺͻ���.
		// *
		// *  @brief ���ߡ�����
		// *  @param width                ���(��) thickness~32000
		// *  @param height               �߶ȶ�(��) thickness~32000
		// *  @param thickness            ���(��) 1~32000
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
		// *  ��Բ.
		// *
		// *  @brief ��Բ
		// *  @param diameter  �뾶(��) 3~4095
		// *  @param thickness �߿���(��) 1��4095
		// *  @param lineColor ������ɫ
		// *
		// *  \~english
		// *
		// *  draw circle
		// *
		// *  @brief draw circle
		// *  @param diameter         circle diameter in dots. 3~4095
		// *  @param thickness        border thickness in dots. 1��4095
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
		// *  ��б��.
		// *
		// *  @brief ��б��
		// *  @param width        ������(��) thickness~32000
		// *  @param height       ����߶�(��) thickness~32000
		// *  @param thickness    б�߿��(��) 1~32000
		// *  @param lineColor    ������ɫ
		// *  @param orientation  ����
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
		// *  ����Բ.
		// *
		// *  @brief ����Բ
		// *  @param width        ��Բ���(��) thickness~32000
		// *  @param height       ��Բ�߶�(��) thickness~32000
		// *  @param thickness    �������(��) 1~32000
		// *  @param lineColor    ������ɫ
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
		//*  ͼƬ��ӡ
		//*
		//*  @brief ͼƬ��ӡ
		//*  @param compression  ѹ������,һ�����ַ���B
		//*  @param cgImage      ͼƬ
		//*  @param bitmapMode   ͼƬģʽ
		//*
		//*  \~english
		//*
		//*  command allows you to download graphic field data directly into the printer��s bitmap storage area.
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
		// *  ����ע���̱ꡢ��Ȩ���ź���������.ʹ�ø�ָ��󣬺������FD����,ͨ���������е���Ӧ�ַ�(A��E)�������������.
		// *
		// *  @brief ����ע���̱ꡢ��Ȩ���ź���������
		// *  @param orientation ����
		// *  @param height      ���ſ��(��) 0~32000
		// *  @param width       ���ſ��(��) 0~32000
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
		// *  ����Ĭ�ϳ���Ϳ�ߵķ���
		// *  @brief ����Ĭ�ϳ���Ϳ�ߵķ���
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
		// *  �Ӵ洢����ɾ������ͼ�Ρ�������Ѵ洢�ĸ�ʽ.
		// *
		// *  @brief ɾ���ļ�
		// *  @param objectLocation �洢����λ��
		// *  @param objectName     �������� 1~8 characters
		// *  @param extension      ��չ��
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
		// *  �ڱ�ǩ��ʽ�Ŀ�ͷ�����Ѵ洢��ĳ�ָ�ʽ��ͼ��,������ͼ�����������ݽ��кϲ�.��ͼ��ʼ��λ��FO 0,0.
		// *
		// *  @brief ����ͼ��
		// *  @param objectLocation �洢����λ��
		// *  @param objectName     �������� 1~8 characters
		// *  @param extension      ��չ��(.GRF,.PNG)
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
		// *  ��ͼ��Ӵ洢����ֱ���ƶ���λͼ��.
		// *
		// *  @brief �Ӵ洢�м���ͼ��
		// *  @param objectLocation �洢����λ��
		// *  @param objectName     �������� 1~8 characters
		// *  @param extension      ��չ��(.GRF,.PNG)
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
		// *  ����ǰ��ǩ����Ϊͼ��ͼ��.
		// *
		// *  @brief ���浱ǰ��ǩΪͼ��
		// *  @param objectLocation       �洢����λ��
		// *  @param objectName           �������� 1~8 characters
		// *  @param extension            ��չ��(.GRF,.PNG)
		// *  @param printAfterSorting    �Ƿ�洢���ӡͼ��
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
		// *  ȡ�������������и�ʽ����.
		// *  @brief ȡ����ʽ����
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
		// *  ����ͨѶ���
		// *  @brief ����ͨѶ���
		// *  @note �������ģʽ,Ϊ��ӡ�����յ������ַ�����ASCII��ӡ���(ʹ�ô�ӡ���ĵ�ǰ��ǩ���Ⱥ�ȫ��).�ô�ӡ�������ASCII�ַ���ʮ������ֵ���κ�ͨ�Ŵ���
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
		// *  �ر�ͨѶ���
		// *  @brief �ر�ͨѶ���
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
		// *  �Ƿ��ӡ��������´�ӡ
		// *
		// *  @brief ��ӡ��������´�ӡ����
		// *  @note �����������´�ӡ����̼�����ꡢ����������ӡͷ�����ȴ���״�������ִ�ӡ�ı�ǩ.����״���õ������,���������´�ӡ��ǩ.�����ӡ��������һ�� ^JZ �����رմ�ӡ��֮ǰ�������һֱ��Ч��
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
		// *  ���ñ�ǩ��ʼλ��.
		// *
		// *  @brief ��ǩ��ʼλ��
		// *  @param XPos x��λ��(��) (0~32000)
		// *  @param YPos y��λ��(��) (0~32000)
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
		// *  �����ǩ����.
		// *
		// *  @brief ��ǩ����
		// *  @param length ��ǩ����(��)
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
		// *  �Ƿ�����ǩ��ɫ��ӡ.���ڷ�ɫ��ӡ��ǩ��ʽ�е������ֶ�.
		// *
		// *  @brief ���ط�ɫ��ӡ
		// *  @param reverse  �Ƿ���
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
		// *  ���������ڽ� �����ֶε�λ�������ƶ�.
		// *
		// *  @brief ��������
		// *  @param shift �ƶ�����.
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
		// *  ���ڽ�������ǩ��ʽ���䵱ǰλ�����ϻ������ƶ����120����(����ڱ�ǩ������Ե).
		// *
		// *  @brief �����ƶ���ǩ
		// *  @param top �ƶ�����(-120~120).
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
		// *  ������������,���ڴ�ӡ��ʽ�����λͼ.MC�������ھ����Ƿ�����ǰλͼ,�������ڵ�ǰ��ǩ�ͺ�����ǩ,ֱ��ʹ�ø�������������
		// *
		// *  @brief �Ƿ����λͼ
		// *  @param clear �Ƿ����
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
		// *  ��������ǩ����.
		// *
		// *  @brief ����ǩ����
		// *  @param length ��ǩ����
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
		// *  ���ý�������.
		// *
		// *  @brief ��������
		// *  @param type ��������
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
		// *  ��������.
		// *
		// *  @brief ����
		// *  @param ipAddress    ip��ַ
		// *  @param subnetMask   ��������
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
		// *  ���ؾ����ӡ.��ӡЧ��Ϊ���ҷ�תͼ��.
		// *
		// *  @brief ���ؾ����ӡ
		// *  @param mirror �Ƿ���
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
		// *  ���ô�ӡ����
		// *
		// *  @brief ��ӡ����
		// *  @param orientation ��ӡ����
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
		// *  �����ڵ�ǰ��ǩ��ɺ�(������ڴ�ӡ)ֹͣ��ӡ,������ӡ��������ͣģʽ.
		// *  @brief ��ӡ��ɺ�ֹͣ��ӡ
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
		// *  ���Ƽ����ӡ����������������Ҫ��ӡ�ı�ǩ��������ӡ���� ͣǰ��ӡ�ı�ǩ�������Լ�ÿ�����кŵĸ�������.
		// *
		// *  @brief ��ӡ��������
		// *  @param quantity       ��ӡ����
		// *  @param pauseValue     ��ͣ����ֵֽ(��ͣ�����ӡ�ı�ǩ��)
		// *  @param replicateValue ÿ�����кŵķ���
		// *  @param overrided      Y->��ӡ����ֽ������ͣ��N->��ͣ������ֽ
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
		// *  ���ñ�ǩ��ӡ����.
		// *
		// *  @brief ���ñ�ǩ��ӡ����
		// *  @param quantity       ��ӡ����
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
		// *  ���ñ�ǩ���.
		// *
		// *  @brief ���ñ�ǩ���
		// *  @param width ��ǩ���(��)
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
		// *  ����ͨ������.
		// *
		// *  @brief ����ͨ������
		// *  @param baudRate     ������
		// *  @param dataBits     �ֳ� 7��8
		// *  @param parity       ��żУ�� N(��)��E(ż��)��O(����)
		// *  @param stopBits     ֹͣλ 1��2
		// *  @param protocolMode Э��ģʽ
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
		// *  ���ô�ӡ����.
		// *
		// *  @brief ���ô�ӡ����
		// *  @param darkness ���� 0~30
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
		// *  ��FDָ������������
		// *
		// *  @brief ������
		// *  @note �����ַ���ռλ��: D��d -> ʮ����0�C9; H��h -> ʮ������0�C9��a-f��A-F; O��o �C> �˽���0�C7; A��a �C> ��ĸA�CZ��a�Cz; N��n �C> ��ĸ����0�C9��A�CZ��a�Cz; % �C> �����ַ�������.
		// *  @param maskString      ����
		// *  @param incrementString ������
		// *
		// *  \~english
		// *
		// *  serialization field (with a standard ^FD string).
		// *
		// *  @brief serialization field
		// *  @note Mask String placeholders: D or d �C> Decimal numeric 0�C9; H or h �C> Hexadecimal 0�C9 plus a-f or A-F; O or o �C> Octal 0�C7; A or a �C> Alphabetic A�CZ or a�Cz; N or n �C> Alphanumeric 0�C9 plus A�CZ or a�Cz; % �C> Ignore character or skip.
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
		// *  ������.
		// *
		// *  @brief ������
		// *  @param sourceDevice             ���ƶ���洢����λ��
		// *  @param sourceObjectName         ���ƶ������� 1~8 characters
		// *  @param sourceExtension          ���ƶ����׺
		// *  @param destinationDevice        Ŀ�����λ��
		// *  @param destinationObjectName    Ŀ��������� 1~8 characters
		// *  @param destinationExtension     Ŀ������׺
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
		// *  ��ʼ�µı�ǩ��ʽ
		// *  @brief ������ǩ��ʽ
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
		// *  ����λ�á�ȫ������Ҫ���д�ӡ��ͼ��ͼ��.
		// *
		// *  @brief XF_RecallFormat
		// *  @param sourceDevice       �洢����λ��
		// *  @param imageName          �������� 1~8 characters
		// *  @param extension          .GRF
		// *  @param XAxisMagnification x��Ŵ�ϵ�� 1~10
		// *  @param YAxisMagnification y��Ŵ�ϵ�� 1~10
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
		// *  ����λ�á�ȫ������Ҫ���д�ӡ��ͼ��ͼ��.
		// *
		// *  @brief XG_RecallGraphic
		// *  @param sourceDevice       �洢����λ��
		// *  @param imageName          �������� 1~8 characters
		// *  @param extension          .GRF
		// *  @param XAxisMagnification x��Ŵ�ϵ�� 1~10
		// *  @param YAxisMagnification y��Ŵ�ϵ�� 1~10
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
		// *  ������ǩ��ʽ
		// *  @brief ������ǩ��ʽ
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
		// *  ���ô�ӡ�ڼ��һЩ�ٶȲ���.
		// *
		// *  @brief ��ӡ�ٶ�����
		// *  @param speed            ��ӡ�ٶ�(Ӣ��ÿ��) 1~14
		// *  @param slewSpeed        ��˦�ٶ�(Ӣ��ÿ��) 2~14
		// *  @param backfeedSpeed    �س��ٶ�(Ӣ��ÿ��) 2~14
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
		
		
		////#pragma mark ^MM ��ӡģʽ
		//{!
		// *  \~chinese
		// *
		// *  ȷ����ӡ���ڴ�ӡһ����ǩ��һ���ǩ֮���ȡ�Ĳ���.
		// *
		// *  @brief ��ӡģʽ����
		// *  @param mode            �����ģʽ
		// *  @param preStripping    Ԥ����ѡ��,Ĭ����N
		// *
		// *  \~english
		// *
		// *  determine the action the printer takes after printing a label or a set of labels.
		// *
		// *  @brief Set print mode
		// *  @param mode            print mode
		// *  @param preStripping    prestripping option��defalut is N
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
		// *  ��ȡ��д�� RFID ��ʽ,д���������16�����ַ�����eg��31323334
		// *
		// *  @brief ����RFID
		// *  @param operation        ��ȡ��д�루TID������д��ֻ�ɶ���
		// *  @param beginAddr        ��ʼλ�ã�Ĭ����0; EPC��ʱ��Ĭ��Ϊ2
		// *  @param length           ���ݳ���
		// *  @param memory           �洢����
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
		// *  ������ɽ�ָ���������ݳ��Ⱥ����ݸ�ʽ����^RF���ʹ��
		// *
		// *  @brief ������֤
		// *  @param fieldNumbe        �ֶα�ţ���Ҫ������������ֶα���һ��
		// *  @param length            ���ص��ֽ�����0��ʾ�Զ�
		// *  @param head              ���ص�����ͷ
		// *  @param length            ���ص�����β
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

