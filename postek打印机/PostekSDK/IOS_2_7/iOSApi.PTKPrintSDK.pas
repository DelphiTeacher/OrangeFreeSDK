////
////  PTKPrintSDK.h
////  PTKPrintSDK
////
////  Created by SDP-MAC on 2017/9/28.
////  Copyright ? 2017年 Postek. All rights reserved.
////

unit iOSApi.PTKPrintSDK;

interface

{$IFDEF IOS}
uses
	//#import <Foundation/Foundation.h>
	iOSapi.Foundation,
	//#import <CoreBluetooth/CoreBluetooth.h>
//	iOSapi.CoreBluetooth,
//	iOSapi.Bluetooth,
  Macapi.Bluetooth,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.UIKit,
	iOSApi.OpenGLES,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

//#define PTK_SUCCESS     1
 const PTK_SUCCESS=1; //#define PTK_SUCCESS     1
//#define PTK_CONNECT_ERR 2
 const PTK_CONNECT_ERR=2; //#define PTK_CONNECT_ERR 2
//#define PTK_INVALID_PARAM_ERR 3
 const PTK_INVALID_PARAM_ERR=3; //#define PTK_INVALID_PARAM_ERR 3

type
	//declare pointer
	id=Pointer;

	
	////err define
	//typedef int RET_PTK;

	//typedef int RET_PTK;
	RET_PTK=integer;

	////首先是定义枚举,记录连接的状态
	//typedef NS_ENUM(NSUInteger, LINKSTATE)
	//{
	    //LINKSTATE_UNLINK   = 0, // 未连接
	    //LINKSTATE_LINKING  = 1, // 连接中
	    //LINKSTATE_LINKED   = 2, // 连接成功了
	    //LINKSTATE_LOGOUT   = 3 // 
	//};
	//typedef NS_ENUM(NSUInteger, LINKSTATE)
	LINKSTATE_=(
	//(NSUInteger, LINKSTATE)
	    LINKSTATE_UNLINK   = 0, // 未连接
	    LINKSTATE_LINKING  = 1, // 连接中
	    LINKSTATE_LINKED   = 2, // 连接成功了
	    LINKSTATE_LOGOUT   = 3 // 
	);
	LINKSTATE=Integer;
	
	uint16_t=word;
	
	
	////设置代理方法
	//@protocol SocketLinkerDelegate <NSObject>
	//@protocol SocketLinkerDelegate <NSObject>
	SocketLinkerDelegate=interface(IObjectiveC)
		['{2EA8F2C0-D8F8-40D9-970C-7D50A36F7005}']
		////连接成功
		//- (void)socketDidConnectToHost:(NSString *)host port:(uint16_t)port;
		[MethodName('socketDidConnectToHost:port:')]
		procedure socketDidConnectToHostport(host:NSString;port:uint16_t);cdecl;
		
		////连接失败的代理,外界操作处理,比如停止发送心跳包,申请重连
		//- (void)socketDidDisconnectWithError:(NSError *)error;
		procedure socketDidDisconnectWithError(error:NSError);cdecl;
		
		////读取Socket数据
		//- (void)socketDidResponse:(NSData *)data;
		procedure socketDidResponse(data:NSData);cdecl;
		
	end;
	
	TOnsocketDidConnectToHostport=procedure(host:NSString;port:uint16_t) of object;
	TOnsocketDidDisconnectWithError=procedure(error:NSError) of object;
	TOnsocketDidResponse=procedure(data:NSData) of object;
	
	TSocketLinkerDelegate=class(TOCLocal,SocketLinkerDelegate)
	public
		constructor Create;
		destructor Destroy;override;
	public
		OnsocketDidConnectToHostport:TOnsocketDidConnectToHostport;
		OnsocketDidDisconnectWithError:TOnsocketDidDisconnectWithError;
		OnsocketDidResponse:TOnsocketDidResponse;
	
		////连接成功
		//- (void)socketDidConnectToHost:(NSString *)host port:(uint16_t)port;
		[MethodName('socketDidConnectToHost:port:')]
		procedure socketDidConnectToHostport(host:NSString;port:uint16_t);cdecl;
		
		
		////连接失败的代理,外界操作处理,比如停止发送心跳包,申请重连
		//- (void)socketDidDisconnectWithError:(NSError *)error;
		procedure socketDidDisconnectWithError(error:NSError);cdecl;
		
		
		////读取Socket数据
		//- (void)socketDidResponse:(NSData *)data;
		procedure socketDidResponse(data:NSData);cdecl;
		
		
	end;
	
	
  QMode_=(
		    NORMAL_GAP_MODE = 0,
		    SPECIAL_GAP_MODE,
		    IN_BLACKLINE_MODE,
		    OUT_BLACKLINE_MODE,
		    CONTINUOUS_MODE
		);//QMode;
  QMode=Integer;
	
	
	//@interface PTKPrintSDK : NSObject
	//@interface PTKPrintSDK : NSObject
	PTKPrintSDK=interface(NSObject)//
	['{12A82598-8FE2-4F91-9A44-DA30FC2F53D3}']
		////wifi
		
		//@property (nonatomic, strong) NSString    *socketHost;   // socket的Host
		function socketHost:NSString;cdecl;// socket的Host
		procedure setSocketHost(socketHost:NSString);cdecl;// socket的Host
		//@property (nonatomic, assign) int         socketPort;    // socket的prot
		function socketPort:Integer;cdecl;// socket的prot
		procedure setSocketPort(socketPort:Integer);cdecl;// socket的prot
		//@property (nonatomic, assign) int         connect_state;
		function connect_state:Integer;cdecl;
		procedure setConnect_state(connect_state:Integer);cdecl;
		//@property (nonatomic, weak) id<SocketLinkerDelegate> delegate;
		function delegate:id{SocketLinkerDelegate};cdecl;
		procedure setDelegate(delegate:id{SocketLinkerDelegate});cdecl;
		//@property (nonatomic, strong) CBCharacteristic *wrNoReCharacteristic;
		function wrNoReCharacteristic:CBCharacteristic;cdecl;
		procedure setWrNoReCharacteristic(wrNoReCharacteristic:CBCharacteristic);cdecl;
		//@property (nonatomic, strong) CBCharacteristic *wrCharacteristic;
		function wrCharacteristic:CBCharacteristic;cdecl;
		procedure setWrCharacteristic(wrCharacteristic:CBCharacteristic);cdecl;
		////bluetooth
		////中心管理者
		//@property(nonatomic,strong) CBCentralManager *mgr;
		function mgr:CBCentralManager;cdecl;
		procedure setMgr(mgr:CBCentralManager);cdecl;
		//@property (nonatomic, strong) CBPeripheral *currPeripheral;
		function currPeripheral:CBPeripheral;cdecl;
		procedure setCurrPeripheral(currPeripheral:CBPeripheral);cdecl;
		////@property (nonatomic, strong) CBCharacteristic *wrNoReCharacteristic;
		////@property (nonatomic, strong) CBCharacteristic *wrCharacteristic;
		
		
		//    SocketOfflineByDevice=0,// 设备关闭等原因断开，默认为0
		//    SocketOfflineByUser  // 用户主动断开
		//};
		
		
		////连接打印机
		//-(RET_PTK)PTKConnect:(NSString*)strIPAddress andPort:(uint16_t)nPort;
		[MethodName('PTKConnect:andPort:')]
		function PTKConnectandPort(strIPAddress:NSString;nPort:uint16_t):RET_PTK;cdecl;
		
		//-(void)PTKCloseConnect;
		procedure PTKCloseConnect;cdecl;
		
		//-(BOOL)isConnect;
		function isConnect:Boolean;cdecl;
		
		
		////连接打印机蓝牙
		//-(RET_PTK)ConnectPreiPheral:(CBCentralManager*)mgr andPeripheral:(CBPeripheral*)currPeripheral;
		[MethodName('ConnectPreiPheral:andPeripheral:')]
		function ConnectPreiPheralandPeripheral(mgr:CBCentralManager;currPeripheral:CBPeripheral):RET_PTK;cdecl;
		
		//-(void)DisConnectBLE;
		procedure DisConnectBLE;cdecl;
		
		
		//-(RET_PTK)PTKPrintLabel:(int)nNumber andCPNum:(int)nCpnumber;
		[MethodName('PTKPrintLabel:andCPNum:')]
		function PTKPrintLabelandCPNum(nNumber:Integer;nCpnumber:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKCutPage:(int)nPage;
		function PTKCutPage(nPage:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKCutPageEx:(int)nPage;
		function PTKCutPageEx(nPage:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDefineCounter:(int)nId andMaxNum:(int)nMaxNum andText:(char)pText andStr:(NSString*)strStr andMsg:(NSString*)strMsg;
		[MethodName('PTKDefineCounter:andMaxNum:andText:andStr:andMsg:')]
		function PTKDefineCounterandMaxNumandTextandStrandMsg(nId:Integer;nMaxNum:Integer;pText:char;strStr:NSString;strMsg:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDefineVariable:(int)nId andMax:(int)pMax andPorder:(char)cPorder andMsg:(NSString*)strMsg;
		[MethodName('PTKDefineVariable:andMax:andPorder:andMsg:')]
		function PTKDefineVariableandMaxandPorderandMsg(nId:Integer;pMax:Integer;cPorder:char;strMsg:NSString):RET_PTK;cdecl;
		
		
		//-(RET_PTK)PTKDrawBarcode:(int)nPx andPy:(int)nPy andDirec:(int)nDirec andCode:(NSString*)strCode andNarrowWidth:(int)nNarrowWidth andHorizontal:(int)nHorizontal andVertital:(int)nVertical andText:(char)ctext andStr:(NSString*) strStr;
		[MethodName('PTKDrawBarcode:andPy:andDirec:andCode:andNarrowWidth:andHorizontal:andVertital:andText:andStr:')]
		function PTKDrawBarcodeandPyandDirecandCodeandNarrowWidthandHorizontalandVertitalandTextandStr(nPx:Integer;nPy:Integer;nDirec:Integer;strCode:NSString;nNarrowWidth:Integer;nHorizontal:Integer;nVertical:Integer;ctext:char;strStr:NSString):RET_PTK;cdecl;
		
		
		//-(RET_PTK)PTKDrawLineXor:(int)nPx andPy:(int)nPy andByte:(int)nByte andH:(int)nH;
		[MethodName('PTKDrawLineXor:andPy:andByte:andH:')]
		function PTKDrawLineXorandPyandByteandH(nPx:Integer;nPy:Integer;nByte:Integer;nH:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDrawLineOr:(int)nPx andPy:(int)nPy andLenth:(int)nLenth andH:(int)nH;
		[MethodName('PTKDrawLineOr:andPy:andLenth:andH:')]
		function PTKDrawLineOrandPyandLenthandH(nPx:Integer;nPy:Integer;nLenth:Integer;nH:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDrawDiagonal:(int)nPx andPy:(int)nPy andThickness:(int)nThickness andEx:(int)nEx andEy:(int)nEy;
		[MethodName('PTKDrawDiagonal:andPy:andThickness:andEx:andEy:')]
		function PTKDrawDiagonalandPyandThicknessandExandEy(nPx:Integer;nPy:Integer;nThickness:Integer;nEx:Integer;nEy:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDrawWhiteLine:(int)nPx andPy:(int)nPy andLenth:(int)nLenth andH:(int)nH;
		[MethodName('PTKDrawWhiteLine:andPy:andLenth:andH:')]
		function PTKDrawWhiteLineandPyandLenthandH(nPx:Integer;nPy:Integer;nLenth:Integer;nH:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDrawRectangle:(int)nPx andPy:(int)nPy andThickness:(int)nThickness andEx:(int)nEx andEy:(int)nEy;
		[MethodName('PTKDrawRectangle:andPy:andThickness:andEx:andEy:')]
		function PTKDrawRectangleandPyandThicknessandExandEy(nPx:Integer;nPy:Integer;nThickness:Integer;nEx:Integer;nEy:Integer):RET_PTK;cdecl;
		
		
		////pcx&bin
		//-(RET_PTK)PTKPcxGraphicsDel:(NSString*)strPid;
		function PTKPcxGraphicsDel(strPid:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKPcxGraphicsList;
		function PTKPcxGraphicsList:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKPcxGraphicsDownload:(NSString*)strPcxName andData:(NSData*)data andDataLenth:(int)nDataLenth;
		[MethodName('PTKPcxGraphicsDownload:andData:andDataLenth:')]
		function PTKPcxGraphicsDownloadandDataandDataLenth(strPcxName:NSString;data:NSData;nDataLenth:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDrawPcxGraphics:(int)nPx andPy:(int)nPy andName:(NSString*)strQName;
		[MethodName('PTKDrawPcxGraphics:andPy:andName:')]
		function PTKDrawPcxGraphicsandPyandName(nPx:Integer;nPy:Integer;strQName:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKBinGraphicsList;
		function PTKBinGraphicsList:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKBinGraphicsDel:(NSString*)strPid;
		function PTKBinGraphicsDel(strPid:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDrawBinGraphics:(int)nPx andPy:(int)nPy andByte:(int)nByte andH:(int)nH andData:(NSData *)nsData;
		[MethodName('PTKDrawBinGraphics:andPy:andByte:andH:andData:')]
		function PTKDrawBinGraphicsandPyandByteandHandData(nPx:Integer;nPy:Integer;nByte:Integer;nH:Integer;nsData:NSData):RET_PTK;cdecl;
		
		//-(RET_PTK)PTK_RecallBinGraphics:(int)nPx andPy:(int)nPy andBinName:(NSString *)strBinName;
		[MethodName('PTK_RecallBinGraphics:andPy:andBinName:')]
		function PTK_RecallBinGraphicsandPyandBinName(nPx:Integer;nPy:Integer;strBinName:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTK_BinGraphicsDownload:(NSString *)strBinName andByte:(int)nByte andH:(int)nH andData:(NSData*)nsData;
		[MethodName('PTK_BinGraphicsDownload:andByte:andH:andData:')]
		function PTK_BinGraphicsDownloadandByteandHandData(strBinName:NSString;nByte:Integer;nH:Integer;nsData:NSData):RET_PTK;cdecl;
		
		
		////二维码
		//-(RET_PTK)PTKDrawBar2D_HANXIN:(int)x andY:(int)y andW:(int)w andV:(int)v andM:(int)m andO:(int)o andR:(int)r andG:(int)g andS:(int)s andStr:(NSString *)strStr;
		[MethodName('PTKDrawBar2D_HANXIN:andY:andW:andV:andM:andO:andR:andG:andS:andStr:')]
		function PTKDrawBar2D_HANXINandYandWandVandMandOandRandGandSandStr(x:Integer;y:Integer;w:Integer;v:Integer;m:Integer;o:Integer;r:Integer;g:Integer;s:Integer;strStr:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTK_DrawBar2D_Pdf417:(int)x andY:(int)y andW:(int)w andV:(int)v andS:(int)s andC:(int)c andPx:(int)nPx andPy:(int)nPy andR:(int)r andL:(int)l andT:(int)t andO:(int)o andStr:(NSString *)strStr;
		[MethodName('PTK_DrawBar2D_Pdf417:andY:andW:andV:andS:andC:andPx:andPy:andR:andL:andT:andO:andStr:')]
		function PTK_DrawBar2D_Pdf417andYandWandVandSandCandPxandPyandRandLandTandOandStr(x:Integer;y:Integer;w:Integer;v:Integer;s:Integer;c:Integer;nPx:Integer;nPy:Integer;r:Integer;l:Integer;t:Integer;o:Integer;strStr:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTK_DrawBar2D_MaxiCode:(int)x andY:(int)y andM:(int)m andU:(int)u andStr:(NSString *)strStr;
		[MethodName('PTK_DrawBar2D_MaxiCode:andY:andM:andU:andStr:')]
		function PTK_DrawBar2D_MaxiCodeandYandMandUandStr(x:Integer;y:Integer;m:Integer;u:Integer;strStr:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTK_DrawBar2D_DATAMATRIX:(int)x andY:(int)y andW:(int)w andV:(int)v andO:(int)o andM:(int)m  andStr:(NSString *)strStr;
		[MethodName('PTK_DrawBar2D_DATAMATRIX:andY:andW:andV:andO:andM:andStr:')]
		function PTK_DrawBar2D_DATAMATRIXandYandWandVandOandMandStr(x:Integer;y:Integer;w:Integer;v:Integer;o:Integer;m:Integer;strStr:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTK_DrawBar2D_QR:(int)x andY:(int)y andW:(int)w andV:(int)v andO:(int)o andR:(int)r andM:(int)m andG:(int)g andS:(int)s andStr:(NSString *)strStr;
		[MethodName('PTK_DrawBar2D_QR:andY:andW:andV:andO:andR:andM:andG:andS:andStr:')]
		function PTK_DrawBar2D_QRandYandWandVandOandRandMandGandSandStr(x:Integer;y:Integer;w:Integer;v:Integer;o:Integer;r:Integer;m:Integer;g:Integer;s:Integer;strStr:NSString):RET_PTK;cdecl;
		
		
		//-(RET_PTK)PTKPrintConfigunation;
		function PTKPrintConfigunation:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKPrintLabelAuto:(int)nNum andCpNum:(int)nCpNum;
		[MethodName('PTKPrintLabelAuto:andCpNum:')]
		function PTKPrintLabelAutoandCpNum(nNum:Integer;nCpNum:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKReset;
		function PTKReset:RET_PTK;cdecl;
		
		
		//-(RET_PTK)PTKSetCoordinateOrigin:(int)nPx andPy:(int)nPy;
		[MethodName('PTKSetCoordinateOrigin:andPy:')]
		function PTKSetCoordinateOriginandPy(nPx:Integer;nPy:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKSetDarkness:(int)nId;
		function PTKSetDarkness(nId:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKSetDirection:(char)cDirect;
		function PTKSetDirection(cDirect:char):RET_PTK;cdecl;
		
		//    NORMAL_GAP_MODE = 0,
		//    SPECIAL_GAP_MODE,
		//    IN_BLACKLINE_MODE,
		//    OUT_BLACKLINE_MODE,
		//    CONTINUOUS_MODE
		//}QMode;
		//-(RET_PTK)PTKSetLabelHeight:(QMode)mode andHeight:(int)nHeight andGapH:(int)nGapH andGap:(int)gapOffset;
		[MethodName('PTKSetLabelHeight:andHeight:andGapH:andGap:')]
		function PTKSetLabelHeightandHeightandGapHandGap(mode:QMode;nHeight:Integer;nGapH:Integer;gapOffset:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKSetLabelWidth:(int)nHeight;
		function PTKSetLabelWidth(nHeight:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKSetPrinterState:(char)nState;
		function PTKSetPrinterState(nState:char):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKSetPrintSpeed:(int)nPx;
		function PTKSetPrintSpeed(nPx:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKSetFeedbackPort:(int)nPort;
		function PTKSetFeedbackPort(nPort:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKSetNetworkFeedbackParameter:(int)nPort andIP:(NSString *)strIP andCP:(int)nCP;
		[MethodName('PTKSetNetworkFeedbackParameter:andIP:andCP:')]
		function PTKSetNetworkFeedbackParameterandIPandCP(nPort:Integer;strIP:NSString;nCP:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKUserBackFeed:(int)feedLen;
		function PTKUserBackFeed(feedLen:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKSoftFontDel:(char)nPid;
		function PTKSoftFontDel(nPid:char):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKSoftFontList;
		function PTKSoftFontList:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKMediaDetect;
		function PTKMediaDetect:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKFeedMedia;
		function PTKFeedMedia:RET_PTK;cdecl;
		
		
		//-(RET_PTK)PTKDisableBackFeed;
		function PTKDisableBackFeed:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDisableErrorReport;
		function PTKDisableErrorReport:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDisableFLASH;
		function PTKDisableFLASH:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDownload;
		function PTKDownload:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDS:(int)nId;//未实现
		function PTKDS(nId:Integer):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKEnableBackFeed;
		function PTKEnableBackFeed:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKEnableErrorReport;
		function PTKEnableErrorReport:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKEnableFlASH;
		function PTKEnableFlASH:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKExecForm:(NSString*)strPid;
		function PTKExecForm(strPid:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKFeedBack;
		function PTKFeedBack:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKFormDel:(NSString*)strPid;
		function PTKFormDel(strPid:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKFormDownload:(NSString *)strPid;
		function PTKFormDownload(strPid:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKFormEnd;
		function PTKFormEnd:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKFormList;
		function PTKFormList:RET_PTK;cdecl;
		
		
		//-(RET_PTK)PTKDrawText:(int)nPx andPy:(int)nPy andDirec:(int)nDirec andFont:(char)nFont andHorizontal:(int)nHorizontal andVertical:(int)nVertical andText:(char)cText andStr:(NSString *)strStr;
		[MethodName('PTKDrawText:andPy:andDirec:andFont:andHorizontal:andVertical:andText:andStr:')]
		function PTKDrawTextandPyandDirecandFontandHorizontalandVerticalandTextandStr(nPx:Integer;nPy:Integer;nDirec:Integer;nFont:char;nHorizontal:Integer;nVertical:Integer;cText:char;strStr:NSString):RET_PTK;cdecl;
		
		//-(RET_PTK)PTKClearBuffer;
		function PTKClearBuffer:RET_PTK;cdecl;
		
		//-(RET_PTK)PTKDrawCircledWord:(int)nPx andPy:(int)nPy andStr:(NSString *)strStr;
		[MethodName('PTKDrawCircledWord:andPy:andStr:')]
		function PTKDrawCircledWordandPyandStr(nPx:Integer;nPy:Integer;strStr:NSString):RET_PTK;cdecl;
		
		
		
	end;
	
	PTKPrintSDKClass=interface(NSObjectClass)//
	['{FC8C3810-A891-487B-B721-806B75167CF3}']
		//+ (PTKPrintSDK *)sharedPTKPrintInstance;//单例初始化
		function sharedPTKPrintInstance:PTKPrintSDK;cdecl;
		
	end;
	
	TPTKPrintSDK=class(TOCGenericImport<PTKPrintSDKClass,PTKPrintSDK>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function PTKPrintSDK_FakeLoader : PTKPrintSDK; cdecl; external '.\PostekSDK\IOS_2_7\libPTKPrintSDK.a' name 'OBJC_CLASS_$_PTKPrintSDK';
{$O+}


{ TSocketLinkerDelegate }

constructor TSocketLinkerDelegate.Create;
begin
	Inherited Create;
end;

destructor TSocketLinkerDelegate.Destroy;
begin
	Inherited;
end;

procedure  TSocketLinkerDelegate.socketDidConnectToHostport(host:NSString;port:uint16_t);
begin
	FMX.Types.Log.d('OrangeUI TSocketLinkerDelegate.socketDidConnectToHostport');
	if Assigned(OnsocketDidConnectToHostport) then
	begin
		OnsocketDidConnectToHostport(host,port);
	end;
end;

procedure  TSocketLinkerDelegate.socketDidDisconnectWithError(error:NSError);
begin
	FMX.Types.Log.d('OrangeUI TSocketLinkerDelegate.socketDidDisconnectWithError');
	if Assigned(OnsocketDidDisconnectWithError) then
	begin
		OnsocketDidDisconnectWithError(error);
	end;
end;

procedure  TSocketLinkerDelegate.socketDidResponse(data:NSData);
begin
	FMX.Types.Log.d('OrangeUI TSocketLinkerDelegate.socketDidResponse');
	if Assigned(OnsocketDidResponse) then
	begin
		OnsocketDidResponse(data);
	end;
end;



{$ENDIF}

end.

