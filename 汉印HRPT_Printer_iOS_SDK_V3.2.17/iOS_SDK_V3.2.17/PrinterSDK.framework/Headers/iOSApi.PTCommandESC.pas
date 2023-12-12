//{!
// *  \~chinese
// *  @header PTCommandESC.h
// *  @abstract ESCָ��
// *
// *  \~english
// *  @header PTCommandESC.h
// *  @abstract ESC Command
// }

unit iOSApi.PTCommandESC;

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

	
	//typedef NS_ENUM(NSInteger, ESCText) {
	    
	    //ESCTextNormal = 0,
	    //ESCTextMini = 1,
	    //ESCTextBold = 8,
	    //ESCTextDoubleHeight = 16,
	    //ESCTextDoubleWidth = 32,
	    //ESCTextUnderline = 128,
	//};
	//typedef NS_ENUM(NSInteger, ESCText) {
	ESCText_=(
	//(NSInteger, ESCText) {
	    ESCTextNormal = 0,
	    ESCTextMini = 1,
	    ESCTextBold = 8,
	    ESCTextDoubleHeight = 16,
	    ESCTextDoubleWidth = 32,
	    ESCTextUnderline = 128//,
	);
	ESCText=Integer;
	
	
	
	
	
	//typedef NS_ENUM(NSInteger, ESCBarcode) {
	
	    //ESCBarcodeB_UPCA    = 65,
	    //ESCBarcodeB_UPCE    = 66,
	    //ESCBarcodeB_EAN13   = 67,
	    //ESCBarcodeB_EAN8    = 68,
	    //ESCBarcodeB_CODE39  = 69,
	    //ESCBarcodeB_ITF     = 70,
	    //ESCBarcodeB_CODEBAR = 71,
	    //ESCBarcodeB_CODE93  = 72,
	    //ESCBarcodeB_CODE128 = 73,
	//};
	//typedef NS_ENUM(NSInteger, ESCBarcode) {
	ESCBarcode_=(
	//(NSInteger, ESCBarcode) {
	    ESCBarcodeB_UPCA    = 65,
	    ESCBarcodeB_UPCE    = 66,
	    ESCBarcodeB_EAN13   = 67,
	    ESCBarcodeB_EAN8    = 68,
	    ESCBarcodeB_CODE39  = 69,
	    ESCBarcodeB_ITF     = 70,
	    ESCBarcodeB_CODEBAR = 71,
	    ESCBarcodeB_CODE93  = 72,
	    ESCBarcodeB_CODE128 = 73//,
	);
	ESCBarcode=Integer;
	
	
	
	
	
	
	//{*
	// *  ESC-POS ָ�:��Լ200������ָ��ĺ�����
	// *  ESC-POS command set: about 200 functions which generated into command
	// }
	//@interface PTCommandESC : NSObject
	//@interface PTCommandESC : NSObject
	PTCommandESC=interface(NSObject)//
	['{35F10748-1A8C-4103-BCA5-F2D55219F6E0}']
		
		//{*
		// *   �ַ��������ʽ��Ĭ��kCFStringEncodingGB_18030_2000
		// *   Encoding format of character string, default is kCFStringEncodingGB_18030_2000
		// }
		//@property (nonatomic, assign) NSStringEncoding encoding;
		function encoding:NSStringEncoding;cdecl;
		procedure setEncoding(encoding:NSStringEncoding);cdecl;
		
		//@property (nonatomic, strong) NSMutableArray *cmdQueue;
		function cmdQueue:NSMutableArray;cdecl;
		procedure setCmdQueue(cmdQueue:NSMutableArray);cdecl;
		
		//- (void)initCommandQueue;
		procedure initCommandQueue;cdecl;
		
		
		//- (void)appendCommandData:(NSData *)cmdData;
		procedure appendCommandData(cmdData:NSData);cdecl;
		
		
		//- (NSData *)getCommandData;
		function getCommandData:NSData;cdecl;
		
		
		//- (void)appendText:(NSString *)text;
		procedure appendText(text:NSString);cdecl;
		
		
		//{*
		// �ʼ��������ӿڣ�Ŀ���޸���ӡ��������
		// }
		//- (void)appendZeroData;
		procedure appendZeroData;cdecl;
		
		
		//{*
		// get printer status
		// ��һ���ֽڣ���2λ��1ʱ���ǣ�0��ʱ��ϸ�
		// �ڶ����ֽڣ���5��6λ����1��ʱ��ȱֽ����������ֽ
		// }
		//- (void)getPrinterStatus;
		procedure getPrinterStatus;cdecl;
		
		
		//{* ��ӡ�Լ�ҳ
		// *  Print SelfTest
		// }
		//- (void)printSelfTest;
		procedure printSelfTest;cdecl;
		
		
		//{* ��ӡ����ֽһ��
		// *  Print and feed one line
		// }
		//- (void)printAndLineFeed;
		procedure printAndLineFeed;cdecl;
		
		
		///** �س� Carriage return */
		//- (void)printAndCarriageReturn;
		procedure printAndCarriageReturn;cdecl;
		
		
		//{*
		// ��ӡ״̬�ص�����
		// automatic return
		// 
		// @param flag true:�����Զ��ش�״̬ false���ر��Զ��ش�
		// }
		//- (void)turnOnPrintStatusCallBack:(BOOL)flag;
		procedure turnOnPrintStatusCallBack(flag:Boolean);cdecl;
		
		
		//{*
		// *  page 73. ��ӡ����ֽ
		// *  Print and feed paper
		// *  @param offset (0~255)
		// }
		//- (void)printAndFeed:(NSInteger)offset;
		procedure printAndFeed(offset:NSInteger);cdecl;
		
		
		//{*
		// *  page 76. ��ӡ����ֽ
		// *  Print and retreat paper
		// *  @param offset (0~48)
		// }
		//- (void)printAndReverseFeed:(NSInteger)offset;
		procedure printAndReverseFeed(offset:NSInteger);cdecl;
		
		
		//{*
		// *  page 78. ��ӡ����ǰ��ֽn��
		// *  Print and feed n lines forward
		// *  @param lines (0~255)
		// }
		//- (void)printAndFeedLines:(NSInteger)lines;
		procedure printAndFeedLines(lines:NSInteger);cdecl;
		
		
		//{*
		// *  page 80. ��ӡ����ֽn��
		// *  Print and retreat n line
		// *  @param lines (0~2)
		// }
		//- (void)printAndReverseFeedLines:(NSInteger)lines;
		procedure printAndReverseFeedLines(lines:NSInteger);cdecl;
		
		
		//{*
		// *  page 83. ����Ĭ���о�
		// *  Set line spacing default
		// }
		//- (void)setLineSpacingDefault;
		procedure setLineSpacingDefault;cdecl;
		
		
		//{*
		// *  page 85. �����о�
		// *  Set line spacing
		// *  @param spacing (0~255)
		// }
		//- (void)setLineSpacing:(NSInteger)spacing;
		procedure setLineSpacing(spacing:NSInteger);cdecl;
		
		
		////#pragma mark Character Commands
		
		//{*
		// *  page 91. �����ұ��ַ����
		// *  Set character spacing on the right
		// *  @param spacing (0~255)
		// }
		//- (void)setRightCharacterSpacing:(NSInteger)spacing;
		procedure setRightCharacterSpacing(spacing:NSInteger);cdecl;
		
		
		//{* page 93. ���ô�ӡ����ģʽ
		// *  Set print font mode
		// }
		//- (void)setTextMode:(ESCText)mode;
		procedure setTextMode(mode:ESCText);cdecl;
		
		//{*
		// *  page 93. ���ø��ı���ʽ���ɵ���Ч������������ֺ��»���
		//    Set text mode, the effect can be overlapped, like bold and underline
		// }
		//- (void)setTextStyleMini:(BOOL)mini
		                    //bold:(BOOL)bold
		             //doubleWidth:(BOOL)doubleWidth
		            //doubleHeight:(BOOL)doubleHeight
		               //underline:(BOOL)underline;
		 //- (void)setTextStyleMini:(BOOL)mini                     bold:(BOOL)bold              doubleWidth:(BOOL)doubleWidth             doubleHeight:(BOOL)doubleHeight                underline:(BOOL)underline;
		[MethodName('setTextStyleMini:bold:doubleWidth:doubleHeight:underline:')]
		procedure setTextStyleMinibolddoubleWidthdoubleHeightunderline(mini:Boolean;bold:Boolean;doubleWidth:Boolean;doubleHeight:Boolean;underline:Boolean);cdecl;
		
		
		//{*
		// *  page 93 ����ı���������������ʽ
		// *  Add text and set text form
		// *
		// *  @param text text string
		// *  @param mode ESCText
		// }
		//- (void)appendText:(NSString *)text mode:(ESCText)mode;
		[MethodName('appendText:mode:')]
		procedure appendTextmode(text:NSString;mode:ESCText);cdecl;
		
		
		//{*
		// *  page 98. ���û�ȡ���ַ�����
		// *  Set or cancel character setting
		// *  n = 0, character set cancel     [default]
		// *  n = 1, character set selected
		// *  @param set (0~1)
		// }
		//- (void)setUserDefinedCharacterSet:(NSInteger)set;
		procedure setUserDefinedCharacterSet(aset:NSInteger);cdecl;
		
		
		//{*
		// *  page 99. �����û����趨���ַ�
		// *  Define user-defined character
		// *  @param codeStart (32~126)
		// *  @param codeEnd   (32~126)
		// *  @param horizontal (data.length = 3*horizontal)
		// *  @param data (0~255)
		// }
		//- (void)defineCharactersWithCodeStart:(NSInteger)codeStart
		                              //codeEnd:(NSInteger)codeEnd
		                           //horizontal:(NSInteger)horizontal
		                                 //data:(NSData *)data;
		 //- (void)defineCharactersWithCodeStart:(NSInteger)codeStart                               codeEnd:(NSInteger)codeEnd                            horizontal:(NSInteger)horizontal                                  data:(NSData *)data;
		[MethodName('defineCharactersWithCodeStart:codeEnd:horizontal:data:')]
		procedure defineCharactersWithCodeStartcodeEndhorizontaldata(codeStart:NSInteger;codeEnd:NSInteger;horizontal:NSInteger;data:NSData);cdecl;
		
		
		//{*
		// *  page 104. �»���ģʽ����
		// *  Underline mode ON/OFF
		// *  0,48 turns off underline mode
		// *  1,49 turns on underline mode (1-dot thick)
		// *  2,50 turns on underline mode (2-dots thick)
		// *  @param underline (0~2,48~50)
		// }
		//- (void)setUnderline:(NSInteger)underline;
		procedure setUnderline(underline:NSInteger);cdecl;
		
		
		//{*
		// *  page 106. ȡ���û����趨���ַ�
		// *  Cancel user-defined character
		// *  @param n (32~126)
		// }
		//- (void)cancelUserDefinedCharacters:(NSInteger)n;
		procedure cancelUserDefinedCharacters(n:NSInteger);cdecl;
		
		
		//{*
		// *  page 108. �ַ��Ӵֿ���
		// *  Character bold ON/OFF
		// *  n = 0 [default]
		// *  @param bold (0~255)
		// }
		//- (void)setBold:(NSInteger)bold;
		procedure setBold(bold:NSInteger);cdecl;
		
		
		//{*
		// *  page 109. �ַ������ֿ���
		// *  Character black ON/OFF
		// *  n = 0 [default]
		// *
		// *  @param doubleStrike (0~255)
		// }
		//- (void)setDoubleStrike:(NSInteger)doubleStrike;
		procedure setDoubleStrike(doubleStrike:NSInteger);cdecl;
		
		
		//{*
		// *  page 110. �����ַ���������
		// *  Set character font type
		// *  @param font (0~1) 0:fontA 1:fontB
		// }
		//- (void)setCharacterFont:(NSInteger)font;
		procedure setCharacterFont(font:NSInteger);cdecl;
		
		
		//{* ESC R
		// *  page 115. ���ù����ַ��趨
		// *  Set International character set
		// *  @param set (n<=15)
		// }
		//- (void)setInternationalCharacterSet:(NSInteger)set;
		procedure setInternationalCharacterSet(aset:NSInteger);cdecl;
		
		
		//{* ESC V
		// *  page 117. ˳ʱ����ת90�ȿ���
		// *  90�� clockwise ON/OFF
		// *  @param mode (0~2),(48~50)
		// }
		//- (void)setVerticalMode:(NSInteger)mode;
		procedure setVerticalMode(mode:NSInteger);cdecl;
		
		
		//{* ESC r
		// * page 119. ���ô�ӡ��ɫ
		// *  Set print color
		// * n = 0 [default]
		// * 0,48 black
		// * 1,49 red
		// *  @param color (0,1,48,49)
		// }
		//- (void)setPrintColor:(NSInteger)color;
		procedure setPrintColor(color:NSInteger);cdecl;
		
		
		//{* ESC t
		// *  page 121. �����ַ������ for Portable machine
		// *  Set character encoding table
		// *
		// *  @param table (0~5),(13-21),(26),(32-34)(36,37),(39,40),(45-52)
		// }
		//- (void)setCharacterCodeTable:(NSInteger)table;
		procedure setCharacterCodeTable(table:NSInteger);cdecl;
		
		
		///// codepage,for POS Printer
		///// @param codepage (0~5),(13~21),26,32-34,36,37,39-40,45-52
		//- (void)setPrinterCodepage:(NSInteger)codepage;
		procedure setPrinterCodepage(codepage:NSInteger);cdecl;
		
		
		//{*
		// �ַ�����
		// Character Transform
		// 
		// @param mode 0��close��1�����Σ����������� 2�����Σ����������� 3�����Σ���������������
		// }
		//- (void)setCharacterTransformMode:(NSInteger)mode;
		procedure setCharacterTransformMode(mode:NSInteger);cdecl;
		
		
		///** ���뱣��ģʽ */
		//- (void)enterPrinterSaveMode;
		procedure enterPrinterSaveMode;cdecl;
		
		
		///** �˳�����ģʽ */
		//- (void)exitPrinterSaveMode;
		procedure exitPrinterSaveMode;cdecl;
		
		
		///** ��ȡԽ�������ģʽ 00 00��Ϊ�� 01 00��ASCII���룬02 00��utf-8���� */
		//- (void)getVietnamTransformMode;
		procedure getVietnamTransformMode;cdecl;
		
		
		///** ����Խ�������ģʽ,���ú�������ӡ�� 48��Ϊ�� 49��ASCII���룬50��utf-8���� */
		//- (void)setVietnamTransformMode:(NSInteger)mode;
		procedure setVietnamTransformMode(mode:NSInteger);cdecl;
		
		
		//{*
		// ̩�ı��ο���
		// 
		// @param status 48��close 49:open
		// }
		//- (void)setThaiTransformStatus:(NSInteger)status;
		procedure setThaiTransformStatus(status:NSInteger);cdecl;
		
		
		//{*
		// language mode
		// ���ü�������/Ӣ��/��������ģʽ
		// 
		// @param mode 0:SimplifiedChinese 1:English 2:TraditionalChinese
		// }
		//- (void)setPrinterLanguageMode:(NSInteger)mode;
		procedure setPrinterLanguageMode(mode:NSInteger);cdecl;
		
		
		//{* ESC {
		// *  page 124. �ߵ���ӡ����
		// *  Reverse print ON/OFF
		// *  @param mode (0~255)
		// }
		//- (void)setUpToDownMode:(NSInteger)mode;
		procedure setUpToDownMode(mode:NSInteger);cdecl;
		
		
		////#pragma mark GS ( N
		
		//{* GS ( N
		// *  page 128. �����ַ���ɫ
		// *  Set character color
		// *  color = 49 [default]
		// *
		// *  @param color (58~51)
		// }
		//- (void)setCharacterColor:(NSInteger)color;
		procedure setCharacterColor(color:NSInteger);cdecl;
		
		
		//{* GS ( N
		// *  page 130. ���ñ�����ɫ
		// *  Set background color
		// *  m = 48 [default]
		// *  48 none; 49 clolor1; 50 color2; 51 color3
		// *  @param color (48~51)
		// }
		//- (void)setBackgroundColor:(NSInteger)color;
		procedure setBackgroundColor(color:NSInteger);cdecl;
		
		
		//{* GS ( N
		// *  page 132. ��Ӱģʽ����
		// *  Shadow mode ON/OFF
		// *
		// *  @param mode (0,1,48,49)
		// *  @param color (48~51) 48 none; 49 clolor1; 50 color2; 51 color3
		// }
		//- (void)setShadowMode:(NSInteger)mode color:(NSInteger)color;
		[MethodName('setShadowMode:color:')]
		procedure setShadowModecolor(mode:NSInteger;color:NSInteger);cdecl;
		
		
		//{* GS !
		// *  page 134. �����ַ���С
		// 8  Set character size
		// *  n = 0 [default]
		// }
		//- (void)setCharacterSize:(NSInteger)size;
		procedure setCharacterSize(size:NSInteger);cdecl;
		
		//- (void)setCharacterWidth:(NSInteger)width height:(NSInteger)height;
		[MethodName('setCharacterWidth:height:')]
		procedure setCharacterWidthheight(width:NSInteger;height:NSInteger);cdecl;
		
		
		//{*
		// Set character size
		// ѡ���ַ���С
		//
		// @param size 0-13  2x2:fontB 3x3:fontA
		// 0:2x2mm,1:3x3mm,2:4x4mm,3:6x6mm,4:8x8mm,5:9x9mm,6:10x10mm
		// 7:12x12mm,8:14x14mm,9:15x15mm,10:16x16mm,11:18x18mm,12:21x21mm,13:24x24mm
		// }
		//- (void)setCharacterMultipleSize:(NSInteger)size;
		procedure setCharacterMultipleSize(size:NSInteger);cdecl;
		
		
		
		///// �������ĵ�˼Դ�����С
		///// @param size �����С:size = 33(42dot) ,34(36dot), 35(32dot)
		//- (void)setChineseSesBlackFontWithSize:(NSInteger)size;
		procedure setChineseSesBlackFontWithSize(size:NSInteger);cdecl;
		
		
		///// ����Ӣ�ĵ�˼Դ�����С
		///// @param size �����Сsize = 33(42dot) ,34(36dot), 35(32dot)
		//- (void)setEnglishSesBlackFontWithSize:(NSInteger)size;
		procedure setEnglishSesBlackFontWithSize(size:NSInteger);cdecl;
		
		
		//{* GS B
		// * page 136. �ڰ׷����ӡģʽ
		// *  Black and white reverse print mode
		// *  n = 0 [default]
		// *
		// *  @param reverse (0~255)
		// }
		//- (void)setReverse:(NSInteger)reverse;
		procedure setReverse(reverse:NSInteger);cdecl;
		
		
		//{* GS b
		// *  page 138. ƽ��ģʽ����
		// *  Smooth mode ON/OFF
		// *  mode = 0 [default]
		// *
		// *  @param smooth (0~255)
		// }
		//- (void)setSmooth:(NSInteger)smooth;
		procedure setSmooth(smooth:NSInteger);cdecl;
		
		
		////#pragma mark Panel Button Commands
		
		//{*
		// *  page.140 ����/�ر���尴ť
		// *  Enable / disable panel button
		// *  n = 0 enable [default]
		// *  n = 1 disable
		// *
		// *  @param mode (0~255)
		// }
		//- (void)setPanelButtonMode:(NSInteger)mode;
		procedure setPanelButtonMode(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 145. �Ƿ�ʹ��ֽ��������
		// *  Whether to use paper out sensor
		// }
		//- (void)enableOutPaperSensor:(BOOL)enable;
		procedure enableOutPaperSensor(enable:Boolean);cdecl;
		
		
		//{*
		// *  page 147. ����ֹͣ��ӡ������
		// *  Set stop print sensor
		// }
		//- (void)enableStopPrintSensor:(BOOL)enable;
		procedure enableStopPrintSensor(enable:Boolean);cdecl;
		
		
		////#pragma mark Print Positioin Commands(Page Mode)
		
		//{* ��ӡ���ص���׼ģʽ
		// *  Print and return to standard mode
		// }
		//- (void)printAndReturnStandardMode;
		procedure printAndReturnStandardMode;cdecl;
		
		
		//{* ��ҳģʽ��ȡ����ӡ����
		// *  Cancel print data in page mode
		// }
		//- (void)cancelPrint;
		procedure cancelPrint;cdecl;
		
		
		//{* ��ҳģʽ�´�ӡ����
		// *  Print data in page mode
		// }
		//- (void)printDataInPageMode;
		procedure printDataInPageMode;cdecl;
		
		
		///// ��λ���¸���꣬��ģʽ��ʹ��
		//- (void)setPrinterAutomaticPosition;
		procedure setPrinterAutomaticPosition;cdecl;
		
		
		///// ��λ���¸���꣬ҳģʽ��ʹ��
		//- (void)positionNextLabel;
		procedure positionNextLabel;cdecl;
		
		
		//{*
		// *  page 151. ��������
		// *  Set horizontal tab
		// }
		//- (void)setHorizontalTab;
		procedure setHorizontalTab;cdecl;
		
		
		//{*
		// *  page 152. ���þ��Դ�ӡλ��
		// *  Set absolute print position
		// *
		// *  @param position 0-255
		// }
		//- (void)setAbsolutePosition:(NSInteger)position;
		procedure setAbsolutePosition(position:NSInteger);cdecl;
		
		
		//{*
		// *  page 154. ���ú�������λ��
		// *  Set horizontal tab position
		// }
		//- (void)setHorizontalTabPositionsData:(NSData *)data;
		procedure setHorizontalTabPositionsData(data:NSData);cdecl;
		
		
		//{*
		// *  page 156. ��ҳģʽ�����ô�ӡ����
		// *  Set print direction in page mode
		// *  0,48 left to right
		// *  1,49 bottom to top
		// *  2,50 right to left
		// *  3,51 top to bottom
		// 
		// *  @param direction (0~3),(48~51)
		// }
		//- (void)pageSetPrintDirection:(NSInteger)direction;
		procedure pageSetPrintDirection(direction:NSInteger);cdecl;
		
		
		//{*
		// *  page 158. ��ҳģʽ�����ô�ӡ����
		// *  Set print area in page mode
		// *
		// *  @param xPos (0~65535)
		// *  @param yPos   (0~65535)
		// *  @param width      (0~65535)
		// *  @param height     (0~65535)
		// }
		//- (void)pageSetPrintAreaWithXPos:(NSInteger)xPos
		                            //yPos:(NSInteger)yPos
		                           //width:(NSInteger)width
		                          //height:(NSInteger)height;
		 //- (void)pageSetPrintAreaWithXPos:(NSInteger)xPos                             yPos:(NSInteger)yPos                            width:(NSInteger)width                           height:(NSInteger)height;
		[MethodName('pageSetPrintAreaWithXPos:yPos:width:height:')]
		procedure pageSetPrintAreaWithXPosyPoswidthheight(xPos:NSInteger;yPos:NSInteger;width:NSInteger;height:NSInteger);cdecl;
		
		
		//{*
		// *  page 163. ������Դ�ӡλ��
		// *  Set relative print position
		// *
		// *  @param position (-32768 ~ 32767)
		// }
		//- (void)setRelativePosition:(NSInteger)position;
		procedure setRelativePosition(position:NSInteger);cdecl;
		
		
		//{*
		// *  page 165. ���ö��뷽ʽ
		// *  Set justification
		// *  n = 0 [default]
		// *  0,48 left justification
		// *  1,49 centered
		// *  2,50 right justification
		// *
		// *  @param justification (0~2),(48~50)
		// }
		//- (void)setJustification:(NSInteger)justification;
		procedure setJustification(justification:NSInteger);cdecl;
		
		
		//{*
		// *  page 167. ��ҳģʽ�����þ��Դ�ֱ��ӡλ��
		// *  Set absolute vertical print position in page mode
		// *  @param yPos (0~65535)
		// }
		//- (void)pageSetAbsoluteYPos:(NSInteger)yPos;
		procedure pageSetAbsoluteYPos(yPos:NSInteger);cdecl;
		
		
		//{*
		// *  page 169. ������߿հ׿��
		// *  Set left margin width
		// *  @param left ����� (0~65535)
		// }
		//- (void)setLeftMargin:(NSInteger)left;
		procedure setLeftMargin(left:NSInteger);cdecl;
		
		
		//{*
		// *  page 171. ������ʼ��ӡ��λ��
		// *  Set start print position
		// *  0,48 cancel data in the current print buffer.
		// *  1,49 print data in the current print buffer.
		// *
		// *  @param mode (0,1,48,49)
		// }
		//- (void)setLinePrintPositionMode:(NSInteger)mode;
		procedure setLinePrintPositionMode(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 173. ���ô�ӡ������
		// *  Set print area width
		// *  @param width (0~65535)
		// }
		//- (void)setPrintAreaWidth:(NSInteger)width;
		procedure setPrintAreaWidth(width:NSInteger);cdecl;
		
		
		//{*
		// *  page 177. ��ҳģʽ��������Դ�ֱ��ӡλ��
		// *  Set relative vertical print position in page mode
		// *  @param yPos (-32767 ~ 32768)
		// }
		//- (void)pageSetRelativeYPos:(NSInteger)yPos;
		procedure pageSetRelativeYPos(yPos:NSInteger);cdecl;
		
		
		////#pragma mark Bit Image Commands
		
		//{*
		// *  page 180. ����λͼģʽ
		// *  Set bitmap mode
		// *  @param mode  (0~1),(31~32)
		// *  @param width (1~2047)
		// *  @param data  (0~255)
		// }
		//- (void)setImageMode:(NSInteger)mode imageWidth:(NSInteger)width data:(NSData *)data;
		[MethodName('setImageMode:imageWidth:data:')]
		procedure setImageModeimageWidthdata(mode:NSInteger;width:NSInteger;data:NSData);cdecl;
		
		
		//{*
		// *  page 194. ��ӡNVλͼ
		// *  Print NV bitmap
		// *  @param imageID (1~255)
		// *  @param mode (0,48:Normal),(1,49:Double-width),(2,50:Double-height),(3,51:Quadruple)
		// }
		//- (void)setNVBitImage:(NSInteger)imageID Mode:(NSInteger)mode;
		[MethodName('setNVBitImage:Mode:')]
		procedure setNVBitImageMode(imageID:NSInteger;mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 210. ����NVͼ���ڴ�����
		// *  Transmit NV graphic memory size
		// *  @param size 0,48
		// }
		//- (void)setNVGraphicsMemorySize:(NSString *)size;
		procedure setNVGraphicsMemorySize(size:NSString);cdecl;
		
		
		//{*
		// *  page 212. ����ͼ�ε��ܶȱ�׼
		// *  Set graphic dot density
		// *  @param fn 1,49
		// *  @param x  50,51
		// }
		//- (void)setGraphicDotDensity:(NSInteger)fn x:(NSInteger)x;
		[MethodName('setGraphicDotDensity:x:')]
		procedure setGraphicDotDensityx(fn:NSInteger;x:NSInteger);cdecl;
		
		
		//{*
		// *  page 214. ��ӡ�ڴ�ӡ�����ͼ������
		// *  Print graphic data in buffer
		// *  @param fn 2,50
		// }
		//- (void)printBufferGraphic:(NSInteger)fn;
		procedure printBufferGraphic(fn:NSInteger);cdecl;
		
		
		//{*
		// *  page 215. ����NVͼ���ڴ�ʣ������
		// *  Transmit graphic remaining memory
		// *  @param fn 3,51
		// }
		//- (void)transmitGraphicRemainingMemory:(NSInteger)fn;
		procedure transmitGraphicRemainingMemory(fn:NSInteger);cdecl;
		
		
		//{*
		// *  page 216. ��������ͼ���ڴ��ʣ������
		// *  Transmit downloaded graphic remaining memory
		// *  @param fn 4,52
		// }
		//- (void)transmitDownloadGraphicRemainingMemory:(NSInteger)fn;
		procedure transmitDownloadGraphicRemainingMemory(fn:NSInteger);cdecl;
		
		
		//{*
		// *  page 218. �����Ѷ���NVͼ�μ�ֵ��
		// *  Transmit defined NV graphic key code list
		// }
		//- (void)transmitNVGrapihcKeyCodeList;
		procedure transmitNVGrapihcKeyCodeList;cdecl;
		
		
		//{*
		// *  page 220. ɾ������NVͼ������
		// *  Delete all the NV graphic data
		// }
		//- (void)deleteNVGraphicAll;
		procedure deleteNVGraphicAll;cdecl;
		
		
		//{*
		// *  page 221. ɾ��ָ����NVͼ������
		// *  Delete the defined NV graphic data
		// *  @param keycode1 (32~126)
		// *  @param keycode2 (32~126)
		// }
		//- (void)deleteNVGraphicWithKeycode1:(NSInteger)keycode1 keycode2:(NSInteger)keycode2;
		[MethodName('deleteNVGraphicWithKeycode1:keycode2:')]
		procedure deleteNVGraphicWithKeycode1keycode2(keycode1:NSInteger;keycode2:NSInteger);cdecl;
		
		
		//{*
		// *  page 222. ����NV����ͼͼ������
		// *  Define raster NV graphic data
		// *  @param keycode          (32~126)
		// *  @param keycode2          (32~126)
		// *  @param imageWidth  (1~8192)
		// *  @param imageHeight (1~2304)
		// *  @param data    imageData
		// }
		//- (void)defineRasterNVGraphicData:(NSData *)data
		                          //keycode:(NSInteger)keycode
		                         //keycode2:(NSInteger)keycode2
		                       //imageWidth:(NSInteger)imageWidth
		                      //imageHeight:(NSInteger)imageHeight;
		 //- (void)defineRasterNVGraphicData:(NSData *)data                           keycode:(NSInteger)keycode                          keycode2:(NSInteger)keycode2                        imageWidth:(NSInteger)imageWidth                       imageHeight:(NSInteger)imageHeight;
		[MethodName('defineRasterNVGraphicData:keycode:keycode2:imageWidth:imageHeight:')]
		procedure defineRasterNVGraphicDatakeycodekeycode2imageWidthimageHeight(data:NSData;keycode:NSInteger;keycode2:NSInteger;imageWidth:NSInteger;imageHeight:NSInteger);cdecl;
		
		
		//{*
		// *  page 227. ��������NV����ͼ������
		// *  Define column NV graphic data
		// *  @param keycode     (32~126)
		// *  @param keycode2    (32~126)
		// *  @param imageWidth  (1~8192)
		// *  @param imageHeight (1~2304)
		// *  @param data   imageData
		// }
		//- (void)defineColumnNVGraphicData:(NSData *)data
		                          //keycode:(NSInteger)keycode
		                         //keycode2:(NSInteger)keycode2
		                       //imageWidth:(NSInteger)imageWidth
		                      //imageHeight:(NSInteger)imageHeight;
		 //- (void)defineColumnNVGraphicData:(NSData *)data                           keycode:(NSInteger)keycode                          keycode2:(NSInteger)keycode2                        imageWidth:(NSInteger)imageWidth                       imageHeight:(NSInteger)imageHeight;
		[MethodName('defineColumnNVGraphicData:keycode:keycode2:imageWidth:imageHeight:')]
		procedure defineColumnNVGraphicDatakeycodekeycode2imageWidthimageHeight(data:NSData;keycode:NSInteger;keycode2:NSInteger;imageWidth:NSInteger;imageHeight:NSInteger);cdecl;
		
		
		//{*
		// *  page 231. ��ӡָ����NVͼ������
		// *  Print specified NV graphic data
		// *  @param keycode      (32~126)
		// *  @param keycode2     (32~126)
		// *  @param xScale   1,2
		// *  @param yScale  1,2
		// }
		//- (void)printNVGraphicWithKeycode:(NSInteger)keycode
		                         //keycode2:(NSInteger)keycode2
		                           //xScale:(NSInteger)xScale
		                           //yScale:(NSInteger)yScale;
		 //- (void)printNVGraphicWithKeycode:(NSInteger)keycode                          keycode2:(NSInteger)keycode2                            xScale:(NSInteger)xScale                            yScale:(NSInteger)yScale;
		[MethodName('printNVGraphicWithKeycode:keycode2:xScale:yScale:')]
		procedure printNVGraphicWithKeycodekeycode2xScaleyScale(keycode:NSInteger;keycode2:NSInteger;xScale:NSInteger;yScale:NSInteger);cdecl;
		
		
		//{*
		// *  page 238. �����Ѷ�������ͼ�μ�ֵ��
		// *  Transmit defined downloaded graphic key code list
		// }
		//- (void)transmitGraphicKeycodeList;
		procedure transmitGraphicKeycodeList;cdecl;
		
		
		//{*
		// *  page 240. ɾ������NVͼ������ Delete all the NV graphic data
		// }
		//- (void)deleteDownloadedNVGraphicAll;
		procedure deleteDownloadedNVGraphicAll;cdecl;
		
		
		//{*
		// *  page 241. ��ӡָ����NVͼ������ Print defined NV graphic data
		// *
		// *  @param keycode (32~126)
		// *  @param keycode2 (32~126)
		// }
		//- (void)deleteDownloadedNVGraphicKeycode:(NSInteger)keycode keycode2:(NSInteger)keycode2;
		[MethodName('deleteDownloadedNVGraphicKeycode:keycode2:')]
		procedure deleteDownloadedNVGraphicKeycodekeycode2(keycode:NSInteger;keycode2:NSInteger);cdecl;
		
		
		//{*
		// *  page 242. ���������صĹ�դ��ʽͼ������
		// *  Defined downloaded raster NV graphic data
		// *  @param keycode         (32~126)
		// *  @param keycode2         (32~126)
		// *  @param imageWidth  (1~8192)
		// *  @param imageHeight (1~2304)
		// *  @param data   imageData
		// }
		//- (void)defineDownloadedRasterNVGraphicData:(NSData *)data
		                                    //keycode:(NSInteger)keycode
		                                   //keycode2:(NSInteger)keycode2
		                                 //imageWidth:(NSInteger)imageWidth
		                                //imageHeight:(NSInteger)imageHeight;
		 //- (void)defineDownloadedRasterNVGraphicData:(NSData *)data                                     keycode:(NSInteger)keycode                                    keycode2:(NSInteger)keycode2                                  imageWidth:(NSInteger)imageWidth                                 imageHeight:(NSInteger)imageHeight;
		[MethodName('defineDownloadedRasterNVGraphicData:keycode:keycode2:imageWidth:imageHeight:')]
		procedure defineDownloadedRasterNVGraphicDatakeycodekeycode2imageWidthimageHeight(data:NSData;keycode:NSInteger;keycode2:NSInteger;imageWidth:NSInteger;imageHeight:NSInteger);cdecl;
		
		
		//{*
		// *  page 246. ���������ص��и�ʽͼ������
		// *  Define downloaded column NV graphic data
		// *  @param keycode         (32~126)
		// *  @param keycode2         (32~126)
		// *  @param imageWidth  (1~8192)
		// *  @param imageHeight (1~2304)
		// *  @param data   imageData
		// }
		//- (void)defineDownloadedColumnNVGraphicData:(NSData *)data
		                                    //keycode:(NSInteger)keycode
		                                   //keycode2:(NSInteger)keycode2
		                                 //imageWidth:(NSInteger)imageWidth
		                                //imageHeight:(NSInteger)imageHeight;
		 //- (void)defineDownloadedColumnNVGraphicData:(NSData *)data                                     keycode:(NSInteger)keycode                                    keycode2:(NSInteger)keycode2                                  imageWidth:(NSInteger)imageWidth                                 imageHeight:(NSInteger)imageHeight;
		[MethodName('defineDownloadedColumnNVGraphicData:keycode:keycode2:imageWidth:imageHeight:')]
		procedure defineDownloadedColumnNVGraphicDatakeycodekeycode2imageWidthimageHeight(data:NSData;keycode:NSInteger;keycode2:NSInteger;imageWidth:NSInteger;imageHeight:NSInteger);cdecl;
		
		
		//{*
		// *  page 250. ��ӡָ�����ص�NVͼ������ a
		// *  Print specified downloaded NV graphic dat
		// *
		// *  @param keycode         (32~126)
		// *  @param keycode2         (32~126)
		// }
		//- (void)printDownloadedNVGraphicWithKeycode:(NSInteger)keycode
		                                   //keycode2:(NSInteger)keycode2
		                                     //xScale:(NSInteger)xScale
		                                     //yScale:(NSInteger)yScale;
		 //- (void)printDownloadedNVGraphicWithKeycode:(NSInteger)keycode                                    keycode2:(NSInteger)keycode2                                      xScale:(NSInteger)xScale                                      yScale:(NSInteger)yScale;
		[MethodName('printDownloadedNVGraphicWithKeycode:keycode2:xScale:yScale:')]
		procedure printDownloadedNVGraphicWithKeycodekeycode2xScaleyScale(keycode:NSInteger;keycode2:NSInteger;xScale:NSInteger;yScale:NSInteger);cdecl;
		
		
		//{*
		// *  page 252. �ڴ�ӡ��������ͼ����ͼ������ Store raster graphic data in print buffer
		// *  Users have the option of specifying horizontal(times bx) * vertical(times by) size setting for the selected data.
		// *  @param xScale          (1~2)
		// *  @param yScale          (1~2)
		// *  @param imageWidth  (1~2047)
		// *  @param imageHeight (1~1662,831,415)
		// *  @param data   imageData
		// }
		//- (void)storeRasterGraphicData:(NSData *)data
		                        //xScale:(NSInteger)xScale
		                        //yScale:(NSInteger)yScale
		                    //imageWidth:(NSInteger)imageWidth
		                   //imageHeight:(NSInteger)imageHeight;
		 //- (void)storeRasterGraphicData:(NSData *)data                         xScale:(NSInteger)xScale                         yScale:(NSInteger)yScale                     imageWidth:(NSInteger)imageWidth                    imageHeight:(NSInteger)imageHeight;
		[MethodName('storeRasterGraphicData:xScale:yScale:imageWidth:imageHeight:')]
		procedure storeRasterGraphicDataxScaleyScaleimageWidthimageHeight(data:NSData;xScale:NSInteger;yScale:NSInteger;imageWidth:NSInteger;imageHeight:NSInteger);cdecl;
		
		
		//{*
		// *  page 261. �ڴ�ӡ�������д����ͼ������ Store column graphic data in print buffer
		// *  Users have the option of specifying horizontal bx * vertical by size setting for the selected data.
		// *  @param xScale          (1~2)
		// *  @param yScale          (1~2)
		// *  @param imageWidth  (1~2047)
		// *  @param imageHeight (1~1662,831,415)
		// *  @param data   imageData
		// }
		//- (void)storeColumnGraphicData:(NSData *)data
		                        //xScale:(NSInteger)xScale
		                        //yScale:(NSInteger)yScale
		                    //imageWidth:(NSInteger)imageWidth
		                   //imageHeight:(NSInteger)imageHeight;
		 //- (void)storeColumnGraphicData:(NSData *)data                         xScale:(NSInteger)xScale                         yScale:(NSInteger)yScale                     imageWidth:(NSInteger)imageWidth                    imageHeight:(NSInteger)imageHeight;
		[MethodName('storeColumnGraphicData:xScale:yScale:imageWidth:imageHeight:')]
		procedure storeColumnGraphicDataxScaleyScaleimageWidthimageHeight(data:NSData;xScale:NSInteger;yScale:NSInteger;imageWidth:NSInteger;imageHeight:NSInteger);cdecl;
		
		
		//{*
		// *  page 264. ����NVλͼ Define NV bitmap
		// *  Defines the NV bit image in the NV graphics area.
		// *  @param number    (1~255)
		// }
		//- (void)defineNVGraphicData:(NSData *)data number:(NSInteger)number;
		[MethodName('defineNVGraphicData:number:')]
		procedure defineNVGraphicDatanumber(data:NSData;number:NSInteger);cdecl;
		
		
		//{*
		// *  page 268. ��ӡ����ͼλͼ
		// *  Print raster bitmap
		// *  @param image  source image
		// *  @param mode   binary/dithering
		// *  @param compress TIFF/ZPL2/None
		// *  @param package  Whether the data is subcontracted
		// *
		// }
		//- (void)appendRasterImage:(CGImageRef)image mode:(PTBitmapMode)mode compress:(PTBitmapCompressMode)compress package:(BOOL)package;
		[MethodName('appendRasterImage:mode:compress:package:')]
		procedure appendRasterImagemodecompresspackage(image:CGImageRef;mode:PTBitmapMode;compress:PTBitmapCompressMode;package:Boolean);cdecl;
		
		
		//{*
		// *  page 273. ��������λͼ Defined downloaded bitmap
		// *
		// *  @param widthBytes  (1~255)
		// *  @param heightBytes    (1~255)
		// *  @param imageData        imageData
		// }
		//- (void)defineDownloadedImage:(NSData *)imageData
		                   //widthBytes:(NSInteger)widthBytes
		                  //heightBytes:(NSInteger)heightBytes;
		 //- (void)defineDownloadedImage:(NSData *)imageData                    widthBytes:(NSInteger)widthBytes                   heightBytes:(NSInteger)heightBytes;
		[MethodName('defineDownloadedImage:widthBytes:heightBytes:')]
		procedure defineDownloadedImagewidthBytesheightBytes(imageData:NSData;widthBytes:NSInteger;heightBytes:NSInteger);cdecl;
		
		
		//{*
		// *  page 276. ��ӡ�����ص�λͼ
		// *  Print downloaded bitmap
		// *  (0,48:Normal),(1,49:Double-width),(2,50:Double-height),(3,51:Quadruple)
		// *
		// *  @param scale (0~3),(48~51)
		// }
		//- (void)printDownloadedImageWithScale:(NSInteger)scale;
		procedure printDownloadedImageWithScale(scale:NSInteger);cdecl;
		
		
		////#pragma mark Status Commands
		
		//{*
		// *  page 288. ����ʵʱ״̬
		// *  Transmit real-time status
		// *  @param status (1~4),(7~8) һ��ѡ2��4
		// }
		//- (void)transmitRealTimeStatus:(NSInteger)status;
		procedure transmitRealTimeStatus(status:NSInteger);cdecl;
		
		
		//{*
		// *  page 305. �����ⲿ�豸״̬
		// *  Transmit peripheral device status
		// *  @param status (0,48)
		// }
		//- (void)transmitPeripheralDeviceStatus:(NSInteger)status;
		procedure transmitPeripheralDeviceStatus(status:NSInteger);cdecl;
		
		
		//{*
		// *  page 306. ����ֽ�Ŵ�����״̬
		// *  Transmit paper sensor status
		// }
		//- (void)transmitPaperSonsorStatus;
		procedure transmitPaperSonsorStatus;cdecl;
		
		
		//{*
		// *  page 308. ����/�ر��Զ�����״̬
		// *  Enable/disable automatic status back (ASB)
		// }
		//- (void)setASBStatusWithDrawer:(BOOL)drawer
		                       //offline:(BOOL)offline
		                         //error:(BOOL)error
		                     //rollPaper:(BOOL)rollPaper
		                   //panelSwitch:(BOOL)panelSwitch;
		 //- (void)setASBStatusWithDrawer:(BOOL)drawer                        offline:(BOOL)offline                          error:(BOOL)error                      rollPaper:(BOOL)rollPaper                    panelSwitch:(BOOL)panelSwitch;
		[MethodName('setASBStatusWithDrawer:offline:error:rollPaper:panelSwitch:')]
		procedure setASBStatusWithDrawerofflineerrorrollPaperpanelSwitch(drawer:Boolean;offline:Boolean;error:Boolean;rollPaper:Boolean;panelSwitch:Boolean);cdecl;
		
		
		//{*
		// *  page 322. ����/�ر���ī�Զ�����״̬
		// *  Enable/disable ink automatic status back (ASB)
		// }
		//- (void)setInkASBWithOffline:(BOOL)offline detection:(BOOL)detection;
		[MethodName('setInkASBWithOffline:detection:')]
		procedure setInkASBWithOfflinedetection(offline:Boolean;detection:Boolean);cdecl;
		
		
		//{*
		// *  page 327. ����״̬
		// *  Transmit status
		// * 1,49: transmits paper sensor status
		// * 2,50: transmits drawer kick-out connector status
		// * 4,52: transmits ink status
		// *
		// *  @param status (1,2,4,49,50,52)
		// }
		//- (void)transmitStatus:(NSInteger)status;
		procedure transmitStatus(status:NSInteger);cdecl;
		
		
		////#pragma mark Bar Code Commands
		
		
		//{*
		// *  page 334. ���ô�ӡ������������
		// *  Set font of bar code number
		// *  0,48 font a
		// *  1,49 font b
		// *  2,50 font c
		// *
		// *  @param font (0~2),(48~50)
		// }
		//- (void)setHRIFont:(NSInteger)font;
		procedure setHRIFont(font:NSInteger);cdecl;
		
		
		//{*
		// *  @param justification    page 165. ���뷽ʽjustification       Value0,1,2 : left��center��right
		// *  @param type             page 339. Value��(A:0~6),(B:65~73)
		// *  @param width            page 355. Value��(2~6),(68~76)
		// *  @param height           page 337. Value��(1~255)
		// *  @param hri     page 332. Value��(0~3),(48~51):�����壬���������桢���������桢���¶�������
		// *  @param data          page 339.
		// }
		//- (void)appendBarcode:(ESCBarcode)type
		                 //data:(NSString *)data
		        //justification:(NSInteger)justification
		                //width:(NSInteger)width
		               //height:(NSInteger)height
		                  //hri:(NSInteger)hri;
		 //- (void)appendBarcode:(ESCBarcode)type                  data:(NSString *)data         justification:(NSInteger)justification                 width:(NSInteger)width                height:(NSInteger)height                   hri:(NSInteger)hri;
		[MethodName('appendBarcode:data:justification:width:height:hri:')]
		procedure appendBarcodedatajustificationwidthheighthri(_type:ESCBarcode;data:NSString;justification:NSInteger;width:NSInteger;height:NSInteger;hri:NSInteger);cdecl;
		
		
		////#pragma mark Macro Function Commands
		
		//{*
		// *  page 360. ��ʼ������궨��
		// *  Start or end macro
		// }
		//- (void)defineMacro;
		procedure defineMacro;cdecl;
		
		
		//{*
		// *  page 362. ִ�к����
		// *  Executes a macro 'times' while 'wait_times' * 100 msec for each macro execution,using the mode specified by 'mode' as follows.
		// *
		// *  @param times      (1~255)
		// *  @param waitTimes (0~255)
		// *  @param mode       (0,1)
		// }
		//- (void)executeMacroWithTimes:(NSInteger)times
		                    //waitTimes:(NSInteger)waitTimes
		                         //mode:(NSInteger)mode;
		 //- (void)executeMacroWithTimes:(NSInteger)times                     waitTimes:(NSInteger)waitTimes                          mode:(NSInteger)mode;
		[MethodName('executeMacroWithTimes:waitTimes:mode:')]
		procedure executeMacroWithTimeswaitTimesmode(times:NSInteger;waitTimes:NSInteger;mode:NSInteger);cdecl;
		
		
		////#pragma mark Mechanism Control Commands
		
		//{*
		// *  page 366. ������ҳ
		// *  Return to homepage
		// }
		//- (void)returnHome;
		procedure returnHome;cdecl;
		
		
		//{*
		// *  page 367. ��/�رյ����ӡģʽ
		// *  Turn on/off unidirectional print mode
		// *
		// *  @param mode (0~255)
		// }
		//- (void)setUnidirectionalPrintMode:(NSInteger)mode;
		procedure setUnidirectionalPrintMode(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 368. �ֲ���ֽ
		// *  Partial cut
		// }
		//- (void)setPartialCut1;
		procedure setPartialCut1;cdecl;
		
		
		//{*
		// *  page 370. �ֲ���ֽ
		// *  Partial cut
		// }
		//- (void)setPartialCut3;
		procedure setPartialCut3;cdecl;
		
		
		///// Partial
		///// ����
		//- (void)setPartialCut;
		procedure setPartialCut;cdecl;
		
		
		///// Full
		///// ȫ��
		//- (void)setFullCut;
		procedure setFullCut;cdecl;
		
		
		///// ��ӡ�����о���
		///// @param distance distance = 15mm + n * 0.0625
		//- (void)setPartialCutWithDistance:(NSInteger)distance;
		procedure setPartialCutWithDistance(distance:NSInteger);cdecl;
		
		
		///// ��ӡ��ȫ�о���
		///// @param distance distance = 15mm + n * 0.0625
		//- (void)setFullCutWithDistance:(NSInteger)distance;
		procedure setFullCutWithDistance(distance:NSInteger);cdecl;
		
		
		//{*
		// *  page 372. ���ü�ֽģʽ����ֽ
		// *  Set cut mode and cut the paper
		// *
		// *  @param mode     (0,1,48,49)
		// *  @param distance (0~255)
		// }
		//- (void)setCutMode:(NSInteger)mode distance:(NSInteger)distance;
		[MethodName('setCutMode:distance:')]
		procedure setCutModedistance(mode:NSInteger;distance:NSInteger);cdecl;
		
		
		
		///// kick Cashdrawer/����Ǯ��
		///// @param number 0-2  0:1#  1:2#  2:all
		//- (void)kickCashdrawer:(NSInteger)number;
		procedure kickCashdrawer(number:NSInteger);cdecl;
		
		
		
		///// get Cashdrawer status: 1--close  0--open
		//- (void)getPrinterCashdrawerStatus;
		procedure getPrinterCashdrawerStatus;cdecl;
		
		
		
		//// �����ӡ��û�п����ڱ깦�ܣ���ô����ļ���ָ����԰�����
		//// If the printer does not have the black mark function enabled, then the following instructions can help you
		////#pragma mark Black mark Commmands
		
		///// �����Ƿ����ڱ�
		///// @param status 0��close   1��open
		//- (void)setPrinterBlackMarkStatus:(NSInteger)status;
		procedure setPrinterBlackMarkStatus(status:NSInteger);cdecl;
		
		
		///// ���úڱ��Ƿ����Զ���λ
		///// @param location 0��close   1��open
		//- (void)setPrinterBlackMarkAutoLocation:(NSInteger)location;
		procedure setPrinterBlackMarkAutoLocation(location:NSInteger);cdecl;
		
		
		///// ���úڱ��Զ���λ���Ƿ��е�
		///// @param location 0��close   1��open
		//- (void)setPrinterBlackMarkCutAfterAutoLocation:(NSInteger)location;
		procedure setPrinterBlackMarkCutAfterAutoLocation(location:NSInteger);cdecl;
		
		
		////#pragma mark Miscellaneous Commands
		
		//{*
		// *  page 380. ����ʵʱ����
		// *  Send real-time request
		// *
		// *  @param request (1~2)
		// }
		//- (void)sendRealTimeRequest:(NSInteger)request;
		procedure sendRealTimeRequest(request:NSInteger);cdecl;
		
		
		//{*
		// *  page 385. ʵʱ����
		// *  Real-time pulse
		// *
		// *  @param mode 0,1
		// *  @param time (1~8)
		// }
		//- (void)generatePulseWithMode:(NSInteger)mode Time:(NSInteger)time;
		[MethodName('generatePulseWithMode:Time:')]
		procedure generatePulseWithModeTime(mode:NSInteger;time:NSInteger);cdecl;
		
		
		//{*
		// *  page 388. ִ�йػ��¼�
		// *  Execute power off sequence
		// }
		//- (void)executePowerOffSequence;
		procedure executePowerOffSequence;cdecl;
		
		
		//{*
		// *  page 391. ʵʱ����ָ��״̬
		// *  Transmit specified status in real time
		// *
		// *  @param status 1,5
		// }
		//- (void)transmitSpecifiedStatus:(NSInteger)status;
		procedure transmitSpecifiedStatus(status:NSInteger);cdecl;
		
		
		//{*
		// *  page 396. �������
		// *  Clear buffer
		// }
		//- (void)clearBuffer;
		procedure clearBuffer;cdecl;
		
		
		//{*
		// *  page 405
		// *
		// *  @param times (0~63)
		// *  @param t1    (0~255)
		// *  @param t2    (0~255)
		// }
		//- (void)escBeepIntegratedBeeperWithTimes:(NSInteger)times T1:(NSInteger)t1 T2:(NSInteger)t2;
		[MethodName('escBeepIntegratedBeeperWithTimes:T1:T2:')]
		procedure escBeepIntegratedBeeperWithTimesT1T2(times:NSInteger;t1:NSInteger;t2:NSInteger);cdecl;
		
		
		//{*
		// *  page 406
		// *
		// *  @param a     (48~51)
		// *  @param times 0,255
		// *  @param t1    (1~50,255)
		// *  @param t2    (1~50)
		// }
		//- (void)escSetIntegratedBeeperWhenOfflineFactorsOccurA:(NSInteger)a Times:(NSInteger)times T1:(NSInteger)t1 T2:(NSInteger)t2;
		[MethodName('escSetIntegratedBeeperWhenOfflineFactorsOccurA:Times:T1:T2:')]
		procedure escSetIntegratedBeeperWhenOfflineFactorsOccurATimesT1T2(a:NSInteger;times:NSInteger;t1:NSInteger;t2:NSInteger);cdecl;
		
		
		//{*
		// *  page 408
		// *
		// *  @param times 0,255
		// *  @param t1    (1~50,255)
		// *  @param t2    (1~50)
		// }
		//- (void)escSetIntegratedBeeperExceptWhenOfflineFactorsOccurWithTimes:(NSInteger)times T1:(NSInteger)t1 T2:(NSInteger)t2;
		[MethodName('escSetIntegratedBeeperExceptWhenOfflineFactorsOccurWithTimes:T1:T2:')]
		procedure escSetIntegratedBeeperExceptWhenOfflineFactorsOccurWithTimesT1T2(times:NSInteger;t1:NSInteger;t2:NSInteger);cdecl;
		
		
		//{*
		// *  page 410. ������Χ�豸
		// *  Select peripheral device
		// *  1,3 enables printer
		// *  2   disables printer
		// *
		// *  @param mode (1~3)
		// }
		//- (void)escSelectPeripheralDevice:(NSInteger)mode;
		procedure escSelectPeripheralDevice(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 412. ��ʼ����ӡ��
		// *  Initialize printer
		// }
		//- (void)initializePrinter;
		procedure initializePrinter;cdecl;
		
		
		//{*
		// *   ��մ�ӡ������
		// *   clear buffers
		// }
		//- (void)clearPrinterBuffer;
		procedure clearPrinterBuffer;cdecl;
		
		
		//{*
		// *  page 413. ����ҳģʽ
		// *  Set page mode
		// }
		//- (void)setPageMode;
		procedure setPageMode;cdecl;
		
		
		//{*
		// *  page 416. ���ñ�׼ģʽ
		// *  Set standard mode
		// }
		//- (void)setStandardMode;
		procedure setStandardMode;cdecl;
		
		
		//{*
		// *  page 418. ��������
		// *  Generate pulse pin mode
		// *  0,48: drawer kick-out connector pin 2
		// *  1,49: drawer kick-out connector pin 5
		// *
		// *  @param pin_mode 0,1,48,49
		// *  @param on_time  (0~255)
		// *  @param off_time (0~255)
		// }
		//- (void)escGeneratePulsePinMode:(NSInteger)pin_mode ONTime:(NSInteger)on_time OFFTime:(NSInteger)off_time;
		[MethodName('escGeneratePulsePinMode:ONTime:OFFTime:')]
		procedure escGeneratePulsePinModeONTimeOFFTime(pin_mode:NSInteger;on_time:NSInteger;off_time:NSInteger);cdecl;
		
		
		//{*
		// *  page 420. ִ�в��Դ�ӡ
		// *  Execute test print
		// *
		// *  @param type (0,1,2),(48,49,50)
		// *  @param mode (1,2,3),(49,50,51),64
		// }
		//- (void)escExecuteTestPrintType:(NSInteger)type Mode:(NSInteger)mode;
		[MethodName('escExecuteTestPrintType:Mode:')]
		procedure escExecuteTestPrintTypeMode(_type:NSInteger;mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 424. ����/�ر�ʵʱ����
		// *  Enable/disable real-time command
		// *
		// *  @param cmdLength (3,5)
		// *  @param type   (1,2)
		// *  @param mode   (0,1,48,49)
		// }
		//- (void)escSetRealTimeCommandLength:(NSInteger)cmdLength type:(NSInteger)type mode:(NSInteger)mode;
		[MethodName('escSetRealTimeCommandLength:type:mode:')]
		procedure escSetRealTimeCommandLengthtypemode(cmdLength:NSInteger;_type:NSInteger;mode:NSInteger);cdecl;
		
		
		//{*
		// *  ָ����ر�������Ӧ����
		// *  Specifies or turns off the offline response transmission.
		// *
		// *  @param state (0,1,2)
		// *  @discussion  0:Turns off the offline response transmission; 1:Specifies the offline response transmission(not including the offline cause); 2:Specifies the offline response transmission(including the offline cause)
		// }
		//- (void)escSetOfflineResponseTransmission:(NSInteger)state;
		procedure escSetOfflineResponseTransmission(state:NSInteger);cdecl;
		
		
		//{*
		// *  page 427. �����ӡ�ɹ�״̬����ӡ��ɴ���PTDispatch`whenESCPrintSuccess` �ص�
		// *  Request the status of successful printing, the completion of printing triggers the PTDispatch`whenESCPrintSuccess` callback
		// }
		//- (void)escRequestTransmissionOfResponseOrStatus;
		procedure escRequestTransmissionOfResponseOrStatus;cdecl;
		
		
		//{*
		// *  page 445. ѡ���ӡ���Ʒ���
		// *  Select print control mode
		// *  0,48:   print mode when power is turned on
		// *  (1,49: mode1), (2,50:mode2), (3,51:mode3), (4,52:mode4)
		// *
		// *  @param mode (0,4),(48,52)
		// }
		//- (void)escSelectPrintControlMode:(NSInteger)mode;
		procedure escSelectPrintControlMode(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 448. ѡ���ӡŨ��
		// *  Set print density
		// *
		// *  @param density (250~255),(0~6)
		// }
		//- (void)setDensity:(NSInteger)density;
		procedure setDensity(density:NSInteger);cdecl;
		
		
		//{*
		// *  page 451. ѡ���ӡ�ٶ�
		// *  Set print speed
		// *
		// *  @param speed (0~11),(48~57)
		// }
		//- (void)setSpeed:(NSInteger)speed;
		procedure setSpeed(speed:NSInteger);cdecl;
		
		
		//{*
		// *  page 453. ѡ�񼤻���ȴ�ӡͷ������
		// *  Select number of parts for thermal head energizing
		// *
		// *  @param number (0~4),(48~52),128
		// }
		//- (void)escSelectNumbersOfPartsForThermalHeadEnergizing:(NSInteger)number;
		procedure escSelectNumbersOfPartsForThermalHeadEnergizing(number:NSInteger);cdecl;
		
		
		//{*
		// *  page 456. ҳģʽ�����ÿɴ�ӡ����
		// *  Set printable area in page mode
		// }
		//- (void)setPageAreaWithWidth:(NSInteger)width
		                      //height:(NSInteger)height
		                     //xOffset:(NSInteger)xOffset;
		 //- (void)setPageAreaWithWidth:(NSInteger)width                       height:(NSInteger)height                      xOffset:(NSInteger)xOffset;
		[MethodName('setPageAreaWithWidth:height:xOffset:')]
		procedure setPageAreaWithWidthheightxOffset(width:NSInteger;height:NSInteger;xOffset:NSInteger);cdecl;
		
		
		//{*
		// *   page 461. ����
		// *  Draw line
		// *
		// *  @param xPos (0~431)
		// *  @param yPos (0~1199)
		// *  @param xEnd (0~431)
		// *  @param yEnd (0~1199)
		// *  @param mode (1~3)
		// }
		//- (void)appendLineWithXPos:(NSInteger)xPos
		                      //yPos:(NSInteger)yPos
		                      //xEnd:(NSInteger)xEnd
		                      //yEnd:(NSInteger)yEnd
		                      //mode:(NSInteger)mode;
		 //- (void)appendLineWithXPos:(NSInteger)xPos                       yPos:(NSInteger)yPos                       xEnd:(NSInteger)xEnd                       yEnd:(NSInteger)yEnd                       mode:(NSInteger)mode;
		[MethodName('appendLineWithXPos:yPos:xEnd:yEnd:mode:')]
		procedure appendLineWithXPosyPosxEndyEndmode(xPos:NSInteger;yPos:NSInteger;xEnd:NSInteger;yEnd:NSInteger;mode:NSInteger);cdecl;
		
		
		
		//{*
		// ����
		// Draw line
		// @param lineWidth �߿� width of line
		// @param xPos ���x start x
		// @param yPos ���y start y
		// @param xEnd �յ�x end x
		// @param yEnd �յ�y end y
		// }
		//- (void)appendLineWithLineWidth:(uint8_t)lineWidth
		                           //xPos:(NSInteger)xPos
		                           //yPos:(NSInteger)yPos
		                           //xEnd:(NSInteger)xEnd
		                           //yEnd:(NSInteger)yEnd;
		 //- (void)appendLineWithLineWidth:(uint8_t)lineWidth                            xPos:(NSInteger)xPos                            yPos:(NSInteger)yPos                            xEnd:(NSInteger)xEnd                            yEnd:(NSInteger)yEnd;
		[MethodName('appendLineWithLineWidth:xPos:yPos:xEnd:yEnd:')]
		procedure appendLineWithLineWidthxPosyPosxEndyEnd(lineWidth:Byte;xPos:NSInteger;yPos:NSInteger;xEnd:NSInteger;yEnd:NSInteger);cdecl;
		
		
		//{*
		// *  page 465. ���ƾ���
		// *  Draw rectangle
		// *
		// *  @param xPos (0~431)
		// *  @param yPos (0~1199)
		// *  @param xEnd (0~431)
		// *  @param yEnd (0~1199)
		// *  @param mode (1~3)
		// }
		//- (void)appendRectWithXPos:(NSInteger)xPos
		                      //yPos:(NSInteger)yPos
		                      //xEnd:(NSInteger)xEnd
		                      //yEnd:(NSInteger)yEnd
		                      //mode:(NSInteger)mode;
		 //- (void)appendRectWithXPos:(NSInteger)xPos                       yPos:(NSInteger)yPos                       xEnd:(NSInteger)xEnd                       yEnd:(NSInteger)yEnd                       mode:(NSInteger)mode;
		[MethodName('appendRectWithXPos:yPos:xEnd:yEnd:mode:')]
		procedure appendRectWithXPosyPosxEndyEndmode(xPos:NSInteger;yPos:NSInteger;xEnd:NSInteger;yEnd:NSInteger;mode:NSInteger);cdecl;
		
		
		//{*
		// ���ƾ���
		// Draw rectangle
		// @param lineWidth �߿�
		// @param xPos ���x
		// @param yPos ���y
		// @param width ���
		// @param height �߶�
		// }
		//- (void)appendRectangleWithLineWidth:(uint8_t)lineWidth
		                                //xPos:(NSInteger)xPos
		                                //yPos:(NSInteger)yPos
		                               //width:(NSInteger)width
		                              //height:(NSInteger)height;
		 //- (void)appendRectangleWithLineWidth:(uint8_t)lineWidth                                 xPos:(NSInteger)xPos                                 yPos:(NSInteger)yPos                                width:(NSInteger)width                               height:(NSInteger)height;
		[MethodName('appendRectangleWithLineWidth:xPos:yPos:width:height:')]
		procedure appendRectangleWithLineWidthxPosyPoswidthheight(lineWidth:Byte;xPos:NSInteger;yPos:NSInteger;width:NSInteger;height:NSInteger);cdecl;
		
		
		//{*
		// *  page 468. ���ʹ�ӡ��ID
		// *  Transmit PrinterID
		// * (1,49: Printer model ID),(2,50: Type ID), (3,51: Version ID)
		// *
		// *  @param id_number (1~3),(49~51)
		// }
		//- (void)escTransmitPrinterID:(NSInteger)id_number;
		procedure escTransmitPrinterID(id_number:NSInteger);cdecl;
		
		
		//{*
		// *  page 484. ����ˮƽ��ֱ�ƶ���λ
		// *  Set horizontal vertical motion units
		// *
		// *  @param horizontal (0~255)
		// *  @param vertical (0~255)
		// }
		//- (void)setMotionUnitsWithHorizontal:(NSInteger)horizontal vertical:(NSInteger)vertical;
		[MethodName('setMotionUnitsWithHorizontal:vertical:')]
		procedure setMotionUnitsWithHorizontalvertical(horizontal:NSInteger;vertical:NSInteger);cdecl;
		
		
		//{*
		// *  page 486. ��ʼ��ά��������
		// *  Initialize maintenance counter
		// *
		// *  @param counter (20,21,50,70)
		// }
		//- (void)escInitializeMaintenanceCounter:(NSInteger)counter;
		procedure escInitializeMaintenanceCounter(counter:NSInteger);cdecl;
		
		
		//{*
		// *  page 488. ����ά��������
		// *  Transmit maintenance counter
		// *
		// *  @param counter (20,21,50,70)
		// }
		//- (void)escTransmitMaintenanceCounter:(NSInteger)counter;
		procedure escTransmitMaintenanceCounter(counter:NSInteger);cdecl;
		
		
		//{*
		// *  page 493. �������߻ָ��ȴ�ʱ��
		// *  Set online recovery wait time
		// *
		// *  @param wait_time1 (0~255) default 6
		// *  @param wait_time2 (0~255) default 0
		// }
		//- (void)escSetOnlineRecoveryWaitTime1:(NSInteger)wait_time1 WaitTime2:(NSInteger)wait_time2;
		[MethodName('escSetOnlineRecoveryWaitTime1:WaitTime2:')]
		procedure escSetOnlineRecoveryWaitTime1WaitTime2(wait_time1:NSInteger;wait_time2:NSInteger);cdecl;
		
		
		////#pragma mark Kanji Commands
		
		//{*
		// *  page 502. ѡ���ӡ�ձ������ַ�ģʽ
		// *  Set Kanji print mode
		// }
		//- (void)setKanjiWithReverse:(BOOL)reverse
		                //doubleWidth:(BOOL)doubleWidth
		               //doubleHeight:(BOOL)doubleHeight
		                  //underline:(BOOL)underline;
		 //- (void)setKanjiWithReverse:(BOOL)reverse                 doubleWidth:(BOOL)doubleWidth                doubleHeight:(BOOL)doubleHeight                   underline:(BOOL)underline;
		[MethodName('setKanjiWithReverse:doubleWidth:doubleHeight:underline:')]
		procedure setKanjiWithReversedoubleWidthdoubleHeightunderline(reverse:Boolean;doubleWidth:Boolean;doubleHeight:Boolean;underline:Boolean);cdecl;
		
		
		//{*
		// *  page 505. ѡ���ձ������ַ�ģʽ
		// *  Set Kanji mode
		// }
		//- (void)setKanjiMode;
		procedure setKanjiMode;cdecl;
		
		
		//{*
		// *  page 508. ѡ���ձ������ַ�����
		// *  Set Kanji font mode
		// *
		// *  @param mode (0~2),(48~50)
		// }
		//- (void)setKanjiFontMode:(NSInteger)mode;
		procedure setKanjiFontMode(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 510. ��/�ر��ձ������ַ��»���
		// *  Turn on/off Kanji underline mode
		// *  0,48: turn off kanji underline mode
		// *  1,49: turn on kanji underline mode(1-dot thick)
		// *  2,50: turn on kanji underline mode(2-dots thick)
		// *
		// *  @param underline (0~2),(48~50)
		// }
		//- (void)setKanjiUnderline:(NSInteger)underline;
		procedure setKanjiUnderline(underline:NSInteger);cdecl;
		
		
		//{*
		// *  page 512. ȡ���ձ������ַ�ģʽ
		// *  Cancel Kanji mode
		// }
		//- (void)cancelKanjiMode;
		procedure cancelKanjiMode;cdecl;
		
		
		//{*
		// *  page 514. �����û�������ձ������ַ�
		// *  Define user-defined Kanji character
		// *
		// *  @param first (119,236,254)
		// *  @param second (33~126),(64~126),(128~158),(161~254)
		// }
		//- (void)defineKanji:(NSData *)data first:(NSInteger)first second:(NSInteger)second;
		[MethodName('defineKanji:first:second:')]
		procedure defineKanjifirstsecond(data:NSData;first:NSInteger;second:NSInteger);cdecl;
		
		
		//{*
		// *  page 518. ѡ���ձ����ִ���ϵͳ
		// *  Set Kanji code system
		// *  0,48 JIS code
		// *  1,49 SHIFT JIS code
		// *
		// *  @param system (0,1),(48,49)
		// }
		//- (void)setKanjiCodeSystem:(NSInteger)system;
		procedure setKanjiCodeSystem(system:NSInteger);cdecl;
		
		
		//{*
		// *  page 520. �趨�ձ������ַ����
		// *  Set Kanji character spacing
		// *  @param left (0~32) default:0
		// *  @param right (0~32) default:0
		// }
		//- (void)setKanjiSpacingWithLeft:(NSInteger)left right:(NSInteger)right;
		[MethodName('setKanjiSpacingWithLeft:right:')]
		procedure setKanjiSpacingWithLeftright(left:NSInteger;right:NSInteger);cdecl;
		
		
		//{*
		// *  page 522. ��/�ر��ձ����ֱ��߱���
		// *  Turn on/off Kanji quadruple height and width mode
		// *
		// *  @param mode (0~255)
		// }
		//- (void)setKanjiQuadrupleMode:(NSInteger)mode;
		procedure setKanjiQuadrupleMode(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 523. ȡ���û�������ձ������ַ�
		// *  Cancel user-defined Kanji character
		// *  @param first (119,236,254)
		// *  @param second (33~126),(64~126),(128~158),(161~254)
		// }
		//- (void)cancelKanjiDefineWithFirst:(NSInteger)first second:(NSInteger)second;
		[MethodName('cancelKanjiDefineWithFirst:second:')]
		procedure cancelKanjiDefineWithFirstsecond(first:NSInteger;second:NSInteger);cdecl;
		
		
		////#pragma mark Two Dimension Code Commands
		
		//{*
		// *  Document 14.1
		// *
		// *  @param data      data String
		// *  @param row       0, 3 to 90
		// *  @param column    0 to 30
		// *  @param width     2 to 8
		// *  @param rowHeight 2 to 8
		// *  @param eccMode   48 to 49
		// *  @param eccLevel  48 to 50
		// *  @param option    0 to 1
		// }
		//- (void)appendPDF417Data:(NSString *)data
		                     //row:(NSInteger)row
		                  //column:(NSInteger)column
		                   //width:(NSInteger)width
		               //rowHeight:(NSInteger)rowHeight
		                 //eccMode:(NSInteger)eccMode
		                //eccLevel:(NSInteger)eccLevel
		                  //option:(NSInteger)option;
		 //- (void)appendPDF417Data:(NSString *)data                      row:(NSInteger)row                   column:(NSInteger)column                    width:(NSInteger)width                rowHeight:(NSInteger)rowHeight                  eccMode:(NSInteger)eccMode                 eccLevel:(NSInteger)eccLevel                   option:(NSInteger)option;
		[MethodName('appendPDF417Data:row:column:width:rowHeight:eccMode:eccLevel:option:')]
		procedure appendPDF417DatarowcolumnwidthrowHeighteccModeeccLeveloption(data:NSString;row:NSInteger;column:NSInteger;width:NSInteger;rowHeight:NSInteger;eccMode:NSInteger;eccLevel:NSInteger;option:NSInteger);cdecl;
		
		
		//{*
		// *  page 549. ������Ŵ洢���з������ݵĴ�С��Ϣ
		// *  Transmit PDF417 symbol data size in symbol storage area
		// }
		//- (void)transmitPDF417SymbolDataSize;
		procedure transmitPDF417SymbolDataSize;cdecl;
		
		
		///// QRCode
		///// @param data ��ά������
		///// @param justification  ���뷽ʽ ȡֵ0,1,2 : ���С���
		///// @param leftMargin     ����
		///// @param eccLevel       ����ȼ���ȡֵ48~51: Level L,M,Q,H
		///// @param model          ��ά����ʽ��ȡֵ49,50 : ������ʽ
		///// @param size           ��С��ȡֵ1~16
		//- (void)appendQRCodeData:(NSString *)data
		           //justification:(NSInteger)justification
		              //leftMargin:(NSInteger)leftMargin
		                //eccLevel:(NSInteger)eccLevel
		                   //model:(NSInteger)model
		                    //size:(NSInteger)size;
		 //- (void)appendQRCodeData:(NSString *)data            justification:(NSInteger)justification               leftMargin:(NSInteger)leftMargin                 eccLevel:(NSInteger)eccLevel                    model:(NSInteger)model                     size:(NSInteger)size;
		[MethodName('appendQRCodeData:justification:leftMargin:eccLevel:model:size:')]
		procedure appendQRCodeDatajustificationleftMargineccLevelmodelsize(data:NSString;justification:NSInteger;leftMargin:NSInteger;eccLevel:NSInteger;model:NSInteger;size:NSInteger);cdecl;
		
		
		//{*
		// *  page 562. ��ά��:������Ŵ洢���еķ������ݵĴ�С��Ϣ
		// *  QR code: transmit QR code symbol data size in symbol storage area
		// }
		//- (void)transmitQRCodeSymbolDataSize;
		procedure transmitQRCodeSymbolDataSize;cdecl;
		
		
		//{*
		// *  Document 14.3
		// *
		// *  @param data maxicode����
		// }
		//- (void)appendMaxiCodeData:(NSString *)data mode:(NSInteger)mode;
		[MethodName('appendMaxiCodeData:mode:')]
		procedure appendMaxiCodeDatamode(data:NSString;mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 570. ������Ŵ洢���еķ������ݴ�С��Ϣ
		// *  Transmit maxi code symbol data size in symbol storage area
		// }
		//- (void)transmitMaxiCodeSymbolDataSize;
		procedure transmitMaxiCodeSymbolDataSize;cdecl;
		
		
		//{*
		// *  Document 14.4
		// *
		// *  @param data        RSS-2D data
		// *  @param mode        72,73,76
		// *  @param moduleWidth 2 to 8
		// *  @param maxWidth    2 to 8
		// }
		//- (void)appendRSS2Data:(NSData *)data
		                  //mode:(NSInteger)mode
		           //moduleWidth:(NSInteger)moduleWidth
		              //maxWidth:(NSInteger)maxWidth;
		 //- (void)appendRSS2Data:(NSData *)data                   mode:(NSInteger)mode            moduleWidth:(NSInteger)moduleWidth               maxWidth:(NSInteger)maxWidth;
		[MethodName('appendRSS2Data:mode:moduleWidth:maxWidth:')]
		procedure appendRSS2DatamodemoduleWidthmaxWidth(data:NSData;mode:NSInteger;moduleWidth:NSInteger;maxWidth:NSInteger);cdecl;
		
		
		//{*
		// *  page 579. ������Ŵ洢���з������ݵĴ�С��Ϣ
		// *  Transmit RSS2 symbol data size in symbol storage area
		// }
		//- (void)transmitRSS2SymbolDataSize;
		procedure transmitRSS2SymbolDataSize;cdecl;
		
		
		//{*
		// *  Document 14.5
		// *
		// *  @param data        composite symbol data
		// *  @param mode        48 to 49
		// *  @param type        65 to 77
		// *  @param moduleWidth 2 to 8
		// *  @param maxWidth    2 to 8
		// *  @param hriFont     0 to 3, 48 to 51
		// }
		//- (void)appendCompositeSymbolData:(NSData *)data
		                             //mode:(NSInteger)mode
		                             //type:(NSInteger)type
		                      //moduleWidth:(NSInteger)moduleWidth
		                         //maxWidth:(NSInteger)maxWidth
		                          //hriFont:(NSInteger)hriFont;
		 //- (void)appendCompositeSymbolData:(NSData *)data                              mode:(NSInteger)mode                              type:(NSInteger)type                       moduleWidth:(NSInteger)moduleWidth                          maxWidth:(NSInteger)maxWidth                           hriFont:(NSInteger)hriFont;
		[MethodName('appendCompositeSymbolData:mode:type:moduleWidth:maxWidth:hriFont:')]
		procedure appendCompositeSymbolDatamodetypemoduleWidthmaxWidthhriFont(data:NSData;mode:NSInteger;_type:NSInteger;moduleWidth:NSInteger;maxWidth:NSInteger;hriFont:NSInteger);cdecl;
		
		
		//{*
		// *  page 600. ������Ŵ洢���еķ������ݵĴ�С��Ϣ
		// *  Transmit composite symbol data size in symbol storage area
		// }
		//- (void)transmitCompositeSymbolDataSize;
		procedure transmitCompositeSymbolDataSize;cdecl;
		
		
		////#pragma mark Customize Commands
		
		//{*
		// *  page 606. д��NV�û��ڴ�
		// *  Write NV user memory
		// *  @param address (0~1023)
		// }
		//- (void)writeNVUserMemory:(NSInteger)address data:(NSData *)data;
		[MethodName('writeNVUserMemory:data:')]
		procedure writeNVUserMemorydata(address:NSInteger;data:NSData);cdecl;
		
		
		//{*
		// *  page 608. ��ȡNV�û��ڴ�
		// *  Read NV user memory
		// *  @param address (0~1023)
		// }
		//- (void)readNVUserMemory:(NSInteger)address length:(NSInteger)length;
		[MethodName('readNVUserMemory:length:')]
		procedure readNVUserMemorylength(address:NSInteger;length:NSInteger);cdecl;
		
		
		//{*
		// *  page 615. ɾ��ָ����¼����
		// *  Delete specified record data
		// *
		// *  @param mode (0,48)
		// *  @param key (32~126)
		// *  @param key2 (32~126)
		// }
		//- (void)deleteRecordWithMode:(NSInteger)mode key:(NSInteger)key key2:(NSInteger)key2;
		[MethodName('deleteRecordWithMode:key:key2:')]
		procedure deleteRecordWithModekeykey2(mode:NSInteger;key:NSInteger;key2:NSInteger);cdecl;
		
		
		//{*
		// *  page 616. �洢ָ����¼����
		// *  Store specified record data
		// *
		// *  @param mode (0,48)
		// *  @param key (32~126)
		// *  @param key2 (32~126)
		// }
		//- (void)storeRecordWithMode:(NSInteger)mode key:(NSInteger)key key2:(NSInteger)key2 data:(NSData *)data;
		[MethodName('storeRecordWithMode:key:key2:data:')]
		procedure storeRecordWithModekeykey2data(mode:NSInteger;key:NSInteger;key2:NSInteger;data:NSData);cdecl;
		
		
		//{*
		// *  page 618. ����ָ����¼����
		// *  Transmit specified record data
		// *
		// *  @param mode (0,48)
		// *  @param key (32~126)
		// *  @param key2 (32~126)
		// }
		//- (void)transmitDataInRecordWithMode:(NSInteger)mode key:(NSInteger)key key2:(NSInteger)key2;
		[MethodName('transmitDataInRecordWithMode:key:key2:')]
		procedure transmitDataInRecordWithModekeykey2(mode:NSInteger;key:NSInteger;key2:NSInteger);cdecl;
		
		
		//{*
		// *  page 620. ���䵱ǰNV�û���ʹ���ڴ�����
		// *  Transmit current used capacity of NV memory
		// *
		// *  @param mode 3,51
		// }
		//- (void)transmitNVMemoryUsedCapacityWithMode:(NSInteger)mode;
		procedure transmitNVMemoryUsedCapacityWithMode(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 621. ����NV�û��ڴ�ʣ������
		// *  Transmit remaining capacity of NV memory
		// *
		// *  @param mode 4,52
		// }
		//- (void)transmitNVMemoryRemainingCapacityWithMode:(NSInteger)mode;
		procedure transmitNVMemoryRemainingCapacityWithMode(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 622. ������ش����б�
		// *  Transmit key code list
		// *
		// *  @param mode 5,53
		// }
		//- (void)transmitKeyCodeListWithMode:(NSInteger)mode;
		procedure transmitKeyCodeListWithMode(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 624. ɾ������NV�û��ڴ�
		// *  Delete all the NV memory
		// *
		// *  @param mode 6,54
		// }
		//- (void)deleteNVMemoryAllWithMode:(NSInteger)mode;
		procedure deleteNVMemoryAllWithMode(mode:NSInteger);cdecl;
		
		
		//{*
		// *  page 631. �任�û�����ģʽ
		// *  Change user setting mode
		// }
		//- (void)changeUserSettingMode;
		procedure changeUserSettingMode;cdecl;
		
		
		//{*
		// *  page 632. �����û�����ģʽ�Ự
		// *  End user setting mode
		// }
		//- (void)endUserSettingMode;
		procedure endUserSettingMode;cdecl;
		
		
		//{*
		// *  page 633. �����ڴ濪��
		// *  Change memory switch
		// *
		// *  @param data (0~255)
		// }
		//- (void)escChangeMemorySwitchData:(NSData *)data;
		procedure escChangeMemorySwitchData(data:NSData);cdecl;
		
		
		//{*
		// *  page 646. �����ڴ濪������
		// *  Transmit memory switch setting
		// *
		// *  @param a (1,2,8)
		// }
		//- (void)escTransmitMemorySwitchSettingA:(NSInteger)a;
		procedure escTransmitMemorySwitchSettingA(a:NSInteger);cdecl;
		
		
		//{*
		// *  page 648. �趨�Զ�������ֵ
		// *  Set customized setting values
		// }
		//- (void)escSetCustomizedSettingValuesData:(NSData *)data;
		procedure escSetCustomizedSettingValuesData(data:NSData);cdecl;
		
		
		//{*
		// *  page 663. �����Զ�������ֵ
		// *  Transmit customized setting values
		// *
		// *  @param a (5,6,97,116,118)
		// }
		//- (void)escTransmitCustomizedSettingValuesA:(NSInteger)a;
		procedure escTransmitCustomizedSettingValuesA(a:NSInteger);cdecl;
		
		
		//{*
		// *  page 666. �����û�����ҳ��
		// *  Copy user-defined page
		// *
		// *  @param font_number  (10,12,17,18)
		// *  @param d1 (30,31)
		// *  @param d2 (30,31) d1 can't be euqual o d2!!
		// }
		//- (void)escCopyUserDefinedPageWithFontNumber:(NSInteger)font_number D1:(NSInteger)d1 D2:(NSInteger)d2;
		[MethodName('escCopyUserDefinedPageWithFontNumber:D1:D2:')]
		procedure escCopyUserDefinedPageWithFontNumberD1D2(font_number:NSInteger;d1:NSInteger;d2:NSInteger);cdecl;
		
		
		//{*
		// *  page 669. �����ַ�����ҳ����(�и�ʽ)
		// *  Define data for character code page (column format)
		// *
		// *  @param c1 (128~255)
		// *  @param c2 (128~255)
		// }
		//- (void)escDefineColumnFormatDataForCharacterCodePageY:(NSInteger)y C1:(NSInteger)c1 C2:(NSInteger)c2 Data:(NSData *)data;
		[MethodName('escDefineColumnFormatDataForCharacterCodePageY:C1:C2:Data:')]
		procedure escDefineColumnFormatDataForCharacterCodePageYC1C2Data(y:NSInteger;c1:NSInteger;c2:NSInteger;data:NSData);cdecl;
		
		
		//{*
		// *  page 671. �����ַ�����ҳ����(�и�ʽ)
		// *  Define data for character code page (raster format)
		// *
		// *  @param c1 (128~255)
		// *  @param c2 (128~255)
		// }
		//- (void)escDefineRasterFormatDataForCharacterrCodePageX:(NSInteger)x C1:(NSInteger)c1 C2:(NSInteger)c2 Data:(NSData *)data;
		[MethodName('escDefineRasterFormatDataForCharacterrCodePageX:C1:C2:Data:')]
		procedure escDefineRasterFormatDataForCharacterrCodePageXC1C2Data(x:NSInteger;c1:NSInteger;c2:NSInteger;data:NSData);cdecl;
		
		
		//{*
		// *  page 673. ɾ���ַ�����ҳ����
		// *  Delete data for character code page
		// *
		// *  @param c1 (128~255)
		// *  @param c2 (128~255)
		// }
		//- (void)escDeleteDataForChracterCodePageC1:(NSInteger)c1 C2:(NSInteger)c2;
		[MethodName('escDeleteDataForChracterCodePageC1:C2:')]
		procedure escDeleteDataForChracterCodePageC1C2(c1:NSInteger;c2:NSInteger);cdecl;
		
		
		//{*
		// *  page 674. ���ô��нӿ�������
		// *  Set configuration item for serial interface
		// *
		// *  @param a    (1~4),depend on data
		// }
		//- (void)escSetConfigurationItemForSerialInterfaceA:(NSInteger)a Data:(NSData *)data;
		[MethodName('escSetConfigurationItemForSerialInterfaceA:Data:')]
		procedure escSetConfigurationItemForSerialInterfaceAData(a:NSInteger;data:NSData);cdecl;
		
		
		//{*
		// *  page 678. ���䴮�нӿ�������
		// *  Transmit configuration item for serial interface
		// *
		// *  @param pl   (2)
		// *  @param ph   (0)
		// *  @param a    (1~4)
		// }
		//- (void)escTransmitConfigurationItemForSerialInterfacePL:(NSInteger)pl PH:(NSInteger)ph A:(NSInteger)a;
		[MethodName('escTransmitConfigurationItemForSerialInterfacePL:PH:A:')]
		procedure escTransmitConfigurationItemForSerialInterfacePLPHA(pl:NSInteger;ph:NSInteger;a:NSInteger);cdecl;
		
		
		//{*
		// *  page 680. ���������ӿ�������
		// *  Set configuration item for Bluetooth interface
		// *  @param a (49,65)
		// }
		//- (void)escSetConfigurationItemForBluetoothInterfaceA:(NSInteger)a Data:(NSData *)data;
		[MethodName('escSetConfigurationItemForBluetoothInterfaceA:Data:')]
		procedure escSetConfigurationItemForBluetoothInterfaceAData(a:NSInteger;data:NSData);cdecl;
		
		
		//{*
		// *  page 682. �������������ӿ�������
		// *  Transmit configuration item for Bluetooth interface
		// *
		// *  @param a (48,49,65)
		// }
		//- (void)escTransmitConfigurationItemForBluetoothInterfaceA:(NSInteger)a;
		procedure escTransmitConfigurationItemForBluetoothInterfaceA(a:NSInteger);cdecl;
		
		
		//{*
		// *  page 685. ɾ��ҳ�沼��
		// *  Delete paper layout
		// }
		//- (void)escDeletePaperLayout;
		procedure escDeletePaperLayout;cdecl;
		
		
		//{*
		// *  page 686. ����ҳ�沼��
		// *  Set paper layout
		// *  @param p (9~36)
		// *  @param sa (48,49,64)
		// *  @param sb (135~3000)
		// *  @param sc (25~100)
		// *  @param sd (0~3000)
		// *  @param se (0~3000)
		// *  @param sf (38~3000)
		// *  @param sg (when sa = '48' or '49':27~507),(when sa = '64':47~507)
		// *  @param sh (when sa = '48' or '49':240~720),(when sa = '64':240~700)
		// }
		//- (void)escSetPaperLayoutP:(NSInteger)p   SA:(NSInteger)sa SB:(NSInteger)sb SC:(NSInteger)sc
		                        //SD:(NSInteger)sd SE:(NSInteger)se SF:(NSInteger)sf SG:(NSInteger)sg SH:(NSInteger)sh;
		 //- (void)escSetPaperLayoutP:(NSInteger)p   SA:(NSInteger)sa SB:(NSInteger)sb SC:(NSInteger)sc                         SD:(NSInteger)sd SE:(NSInteger)se SF:(NSInteger)sf SG:(NSInteger)sg SH:(NSInteger)sh;
		[MethodName('escSetPaperLayoutP:SA:SB:SC:SD:SE:SF:SG:SH:')]
		procedure escSetPaperLayoutPSASBSCSDSESFSGSH(p:NSInteger;sa:NSInteger;sb:NSInteger;sc:NSInteger;sd:NSInteger;se:NSInteger;sf:NSInteger;sg:NSInteger;sh:NSInteger);cdecl;
		
		
		//{*
		// *  page 692. ����ҳ�沼����Ϣ
		// *  Transmit paper layout information
		// *
		// *  @param n 64,80
		// }
		//- (void)escTransmitPaperLayoutInformation:(NSInteger)n;
		procedure escTransmitPaperLayoutInformation(n:NSInteger);cdecl;
		
		
		//{*
		// *  page 701. ������������ֵ���浽�洢����
		// *  Save setting values from work area into storage area
		// *
		// *  @param fn (1,49)
		// *  @param m  (1,49)
		// }
		//- (void)escSaveSettingValuesFromWorkAreaIntoStorageAreaFN:(NSInteger)fn M:(NSInteger)m;
		[MethodName('escSaveSettingValuesFromWorkAreaIntoStorageAreaFN:M:')]
		procedure escSaveSettingValuesFromWorkAreaIntoStorageAreaFNM(fn:NSInteger;m:NSInteger);cdecl;
		
		
		//{*
		// *  page 702. ���ش洢�����ѱ�����趨ֵ����������
		// *  Load setting values stored in storage area to work area
		// *
		// *  @param fn (2,50)
		// *  @param m  (0,1,48,49)
		// }
		//- (void)escLoadSettingValuesStoredInStorageAreaToWorkAreaFN:(NSInteger)fn M:(NSInteger)m;
		[MethodName('escLoadSettingValuesStoredInStorageAreaToWorkAreaFN:M:')]
		procedure escLoadSettingValuesStoredInStorageAreaToWorkAreaFNM(fn:NSInteger;m:NSInteger);cdecl;
		
		
		//{*
		// *  page 703. ��ʼ�����̺�ѡ������ֵ���ص���������
		// *  Select setting values loaded to work area after initialization process
		// *
		// *  @param fn (3,51)
		// *  @param m  (0,1,48,49)
		// }
		//- (void)escSelectSettingValuesLoadedToWorkAreaAfterInitializationProcessFN:(NSInteger)fn M:(NSInteger)m;
		[MethodName('escSelectSettingValuesLoadedToWorkAreaAfterInitializationProcessFN:M:')]
		procedure escSelectSettingValuesLoadedToWorkAreaAfterInitializationProcessFNM(fn:NSInteger;m:NSInteger);cdecl;
		
		
		////#pragma mark Counter Printing Commands
		
		//{*
		// *  page 705. ѡ���������ӡģʽ
		// *  Select counter print mode
		// *
		// *  @param digits        (2~5)
		// *  @param justification (0~2),(48~50)
		// }
		//- (void)escSelectCounterPrintModeWithDigits:(NSInteger)digits Justification:(NSInteger)justification;
		[MethodName('escSelectCounterPrintModeWithDigits:Justification:')]
		procedure escSelectCounterPrintModeWithDigitsJustification(digits:NSInteger;justification:NSInteger);cdecl;
		
		
		//{*
		// *  page 707. ѡ�����ģʽ
		// *  Select counter mode
		// *
		// *  @param counting_mode  (0~65535)
		// *  @param repetition     (0~65535)
		// }
		//- (void)escSelectCounterModeA_MinimumValue:(NSInteger)minimum_value
		                              //MaximumValue:(NSInteger)maximum_value
		                              //CountingMode:(NSInteger)counting_mode
		                                //Repetition:(NSInteger)repetition;
		 //- (void)escSelectCounterModeA_MinimumValue:(NSInteger)minimum_value                               MaximumValue:(NSInteger)maximum_value                               CountingMode:(NSInteger)counting_mode                                 Repetition:(NSInteger)repetition;
		[MethodName('escSelectCounterModeA_MinimumValue:MaximumValue:CountingMode:Repetition:')]
		procedure escSelectCounterModeA_MinimumValueMaximumValueCountingModeRepetition(minimum_value:NSInteger;maximum_value:NSInteger;counting_mode:NSInteger;repetition:NSInteger);cdecl;
		
		
		//{*
		// *  page 709. �趨������
		// *  Set counter
		// *
		// *  @param counter (0~65535) default:1
		// }
		//- (void)escSetCounter:(NSInteger)counter;
		procedure escSetCounter(counter:NSInteger);cdecl;
		
		
		//{*
		// *  page 710. ѡ�������ģʽ
		// *  Select counter mode
		// *
		// *  @param sa (0~65535)     default:1
		// *  @param sb (0~65535)     default:65535
		// *  @param sn (0~255)       default:1
		// *  @param sr (0~255)       default:1
		// *  @param sc (0~65535)     default:1
		// }
		//- (void)escSelectCounterModeB_SA:(NSInteger)sa SB:(NSInteger)sb SN:(NSInteger)sn SR:(NSInteger)sr SC:(NSInteger)sc;
		[MethodName('escSelectCounterModeB_SA:SB:SN:SR:SC:')]
		procedure escSelectCounterModeB_SASBSNSRSC(sa:NSInteger;sb:NSInteger;sn:NSInteger;sr:NSInteger;sc:NSInteger);cdecl;
		
		
		//{*
		// *  page 713. ��ӡ������
		// *  Print counter
		// }
		//- (void)escPrintCounter;
		procedure escPrintCounter;cdecl;
		
		
		////#pragma mark Printing Paper Commands
		
		//{*
		// *  page 720. ֽ�Ų�������
		// *  Paper layout setting
		// *
		// *  @param p  (8~26)
		// *  @param sm (0~3) mode
		// *  @param sa (0),(284~1550)
		// *  @param sb (-150,-1500)
		// *  @param sc (-290,-50)
		// *  @param sd (0,-15)
		// *  @param se (-15,-15)
		// *  @param sf (290,-600)
		// }
		//- (void)escPaperLayoutSettingP:(NSInteger)p   SM:(NSInteger)sm SA:(NSInteger)sa
		                            //SB:(NSInteger)sb SC:(NSInteger)sc SD:(NSInteger)sd SE:(NSInteger)se SF:(NSInteger)sf;
		 //- (void)escPaperLayoutSettingP:(NSInteger)p   SM:(NSInteger)sm SA:(NSInteger)sa                             SB:(NSInteger)sb SC:(NSInteger)sc SD:(NSInteger)sd SE:(NSInteger)se SF:(NSInteger)sf;
		[MethodName('escPaperLayoutSettingP:SM:SA:SB:SC:SD:SE:SF:')]
		procedure escPaperLayoutSettingPSMSASBSCSDSESF(p:NSInteger;sm:NSInteger;sa:NSInteger;sb:NSInteger;sc:NSInteger;sd:NSInteger;se:NSInteger;sf:NSInteger);cdecl;
		
		
		//{*
		// *  page 729. ����ֽ�Ų�������
		// *  Transmit paper layout setting information
		// *
		// *  @param n (64,80)
		// }
		//- (void)escPaperLayoutInformationTransmissionN:(NSInteger)n;
		procedure escPaperLayoutInformationTransmissionN(n:NSInteger);cdecl;
		
		
		//{*
		// *  page 732. ���䵱ǰλ����Ϣ
		// *  Transmit current positioning information
		// *
		// *  @param m 48
		// }
		//- (void)escTransmitPositioningInformationM:(NSInteger)m;
		procedure escTransmitPositioningInformationM(m:NSInteger);cdecl;
		
		
		//{*
		// *  pag 737. �ӱ�ǩ����λ����ֽ
		// *  Feed paper to label peeling position
		// *
		// *  @param m (48,49)
		// }
		//- (void)escFeedPaperToLabelPeelingPositionM:(NSInteger)m;
		procedure escFeedPaperToLabelPeelingPositionM(m:NSInteger);cdecl;
		
		
		//{*
		// *  page 740. �Ӽ�ֽλ����ֽ
		// *  Feed paper to cutting position
		// *
		// *  @param m (48,49)
		// }
		//- (void)escFeedPaperToCuttingPositionM:(NSInteger)m;
		procedure escFeedPaperToCuttingPositionM(m:NSInteger);cdecl;
		
		
		//{*
		// *  page 742. �Ӵ�ӡ��ʼλ����ֽ
		// *  Feed paper to print starting position
		// *
		// *  @param m (48,49,50)
		// }
		//- (void)escFeedPaperToPrintStartingPositionM:(NSInteger)m;
		procedure escFeedPaperToPrintStartingPositionM(m:NSInteger);cdecl;
		
		
		//{*
		// *  page 744. ֽ�Ų����������
		// *  Paper layout error special margin setting
		// *
		// *  @param p  (2,3)
		// *  @param sn (80)
		// }
		//- (void)escPaperLayoutErrorSpecialMarginSettingP:(NSInteger)p SN:(NSInteger)sn;
		[MethodName('escPaperLayoutErrorSpecialMarginSettingP:SN:')]
		procedure escPaperLayoutErrorSpecialMarginSettingPSN(p:NSInteger;sn:NSInteger);cdecl;
		
		
		
	end;
	
	PTCommandESCClass=interface(NSObjectClass)//
	['{850FD5CC-37F9-400D-BBDB-42A1DBB60557}']
	end;
	
	TPTCommandESC=class(TOCGenericImport<PTCommandESCClass,PTCommandESC>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTCommandESC_FakeLoader : PTCommandESC; cdecl; external {$I FrameworkDylibPath_PrinterSDK.inc} name 'OBJC_CLASS_$_PTCommandESC';
{$O+}



{$ENDIF}

end.

