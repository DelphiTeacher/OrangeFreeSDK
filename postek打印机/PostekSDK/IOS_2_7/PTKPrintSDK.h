//
//  PTKPrintSDK.h
//  PTKPrintSDK
//
//  Created by SDP-MAC on 2017/9/28.
//  Copyright © 2017年 Postek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

//err define
typedef int RET_PTK;

#define PTK_SUCCESS     1
#define PTK_CONNECT_ERR 2
#define PTK_INVALID_PARAM_ERR 3
//首先是定义枚举,记录连接的状态
typedef NS_ENUM(NSUInteger, LINKSTATE)
{
    LINKSTATE_UNLINK   = 0, // 未连接
    LINKSTATE_LINKING  = 1, // 连接中
    LINKSTATE_LINKED   = 2, // 连接成功了
    LINKSTATE_LOGOUT   = 3 // 
};
//设置代理方法
@protocol SocketLinkerDelegate <NSObject>
//连接成功
- (void)socketDidConnectToHost:(NSString *)host port:(uint16_t)port;
//连接失败的代理,外界操作处理,比如停止发送心跳包,申请重连
- (void)socketDidDisconnectWithError:(NSError *)error;
//读取Socket数据
- (void)socketDidResponse:(NSData *)data;
@end

@interface PTKPrintSDK : NSObject
//wifi

@property (nonatomic, strong) NSString    *socketHost;   // socket的Host
@property (nonatomic, assign) int         socketPort;    // socket的prot
@property (nonatomic, assign) int         connect_state;
@property (nonatomic, weak) id<SocketLinkerDelegate> delegate;
@property (nonatomic, strong) CBCharacteristic *wrNoReCharacteristic;
@property (nonatomic, strong) CBCharacteristic *wrCharacteristic;
//bluetooth
//中心管理者
@property(nonatomic,strong) CBCentralManager *mgr;
@property (nonatomic, strong) CBPeripheral *currPeripheral;
//@property (nonatomic, strong) CBCharacteristic *wrNoReCharacteristic;
//@property (nonatomic, strong) CBCharacteristic *wrCharacteristic;


enum SocketOffline{
    SocketOfflineByDevice=0,// 设备关闭等原因断开，默认为0
    SocketOfflineByUser  // 用户主动断开
};

+ (PTKPrintSDK *)sharedPTKPrintInstance;//单例初始化

//连接打印机
-(RET_PTK)PTKConnect:(NSString*)strIPAddress andPort:(uint16_t)nPort;
-(void)PTKCloseConnect;
-(BOOL)isConnect;

//连接打印机蓝牙
-(RET_PTK)ConnectPreiPheral:(CBCentralManager*)mgr andPeripheral:(CBPeripheral*)currPeripheral;
-(void)DisConnectBLE;

-(RET_PTK)PTKPrintLabel:(int)nNumber andCPNum:(int)nCpnumber;
-(RET_PTK)PTKCutPage:(int)nPage;
-(RET_PTK)PTKCutPageEx:(int)nPage;
-(RET_PTK)PTKDefineCounter:(int)nId andMaxNum:(int)nMaxNum andText:(char)pText andStr:(NSString*)strStr andMsg:(NSString*)strMsg;
-(RET_PTK)PTKDefineVariable:(int)nId andMax:(int)pMax andPorder:(char)cPorder andMsg:(NSString*)strMsg;

-(RET_PTK)PTKDrawBarcode:(int)nPx andPy:(int)nPy andDirec:(int)nDirec andCode:(NSString*)strCode andNarrowWidth:(int)nNarrowWidth andHorizontal:(int)nHorizontal andVertital:(int)nVertical andText:(char)ctext andStr:(NSString*) strStr;

-(RET_PTK)PTKDrawLineXor:(int)nPx andPy:(int)nPy andByte:(int)nByte andH:(int)nH;
-(RET_PTK)PTKDrawLineOr:(int)nPx andPy:(int)nPy andLenth:(int)nLenth andH:(int)nH;
-(RET_PTK)PTKDrawDiagonal:(int)nPx andPy:(int)nPy andThickness:(int)nThickness andEx:(int)nEx andEy:(int)nEy;
-(RET_PTK)PTKDrawWhiteLine:(int)nPx andPy:(int)nPy andLenth:(int)nLenth andH:(int)nH;
-(RET_PTK)PTKDrawRectangle:(int)nPx andPy:(int)nPy andThickness:(int)nThickness andEx:(int)nEx andEy:(int)nEy;

//pcx&bin
-(RET_PTK)PTKPcxGraphicsDel:(NSString*)strPid;
-(RET_PTK)PTKPcxGraphicsList;
-(RET_PTK)PTKPcxGraphicsDownload:(NSString*)strPcxName andData:(NSData*)data andDataLenth:(int)nDataLenth;
-(RET_PTK)PTKDrawPcxGraphics:(int)nPx andPy:(int)nPy andName:(NSString*)strQName;
-(RET_PTK)PTKBinGraphicsList;
-(RET_PTK)PTKBinGraphicsDel:(NSString*)strPid;
-(RET_PTK)PTKDrawBinGraphics:(int)nPx andPy:(int)nPy andByte:(int)nByte andH:(int)nH andData:(NSData *)nsData;
-(RET_PTK)PTK_RecallBinGraphics:(int)nPx andPy:(int)nPy andBinName:(NSString *)strBinName;
-(RET_PTK)PTK_BinGraphicsDownload:(NSString *)strBinName andByte:(int)nByte andH:(int)nH andData:(NSData*)nsData;

//二维码
-(RET_PTK)PTKDrawBar2D_HANXIN:(int)x andY:(int)y andW:(int)w andV:(int)v andM:(int)m andO:(int)o andR:(int)r andG:(int)g andS:(int)s andStr:(NSString *)strStr;
-(RET_PTK)PTK_DrawBar2D_Pdf417:(int)x andY:(int)y andW:(int)w andV:(int)v andS:(int)s andC:(int)c andPx:(int)nPx andPy:(int)nPy andR:(int)r andL:(int)l andT:(int)t andO:(int)o andStr:(NSString *)strStr;
-(RET_PTK)PTK_DrawBar2D_MaxiCode:(int)x andY:(int)y andM:(int)m andU:(int)u andStr:(NSString *)strStr;
-(RET_PTK)PTK_DrawBar2D_DATAMATRIX:(int)x andY:(int)y andW:(int)w andV:(int)v andO:(int)o andM:(int)m  andStr:(NSString *)strStr;
-(RET_PTK)PTK_DrawBar2D_QR:(int)x andY:(int)y andW:(int)w andV:(int)v andO:(int)o andR:(int)r andM:(int)m andG:(int)g andS:(int)s andStr:(NSString *)strStr;

-(RET_PTK)PTKPrintConfigunation;
-(RET_PTK)PTKPrintLabelAuto:(int)nNum andCpNum:(int)nCpNum;
-(RET_PTK)PTKReset;

-(RET_PTK)PTKSetCoordinateOrigin:(int)nPx andPy:(int)nPy;
-(RET_PTK)PTKSetDarkness:(int)nId;
-(RET_PTK)PTKSetDirection:(char)cDirect;
typedef enum {
    NORMAL_GAP_MODE = 0,
    SPECIAL_GAP_MODE,
    IN_BLACKLINE_MODE,
    OUT_BLACKLINE_MODE,
    CONTINUOUS_MODE
}QMode;
-(RET_PTK)PTKSetLabelHeight:(QMode)mode andHeight:(int)nHeight andGapH:(int)nGapH andGap:(int)gapOffset;
-(RET_PTK)PTKSetLabelWidth:(int)nHeight;
-(RET_PTK)PTKSetPrinterState:(char)nState;
-(RET_PTK)PTKSetPrintSpeed:(int)nPx;
-(RET_PTK)PTKSetFeedbackPort:(int)nPort;
-(RET_PTK)PTKSetNetworkFeedbackParameter:(int)nPort andIP:(NSString *)strIP andCP:(int)nCP;
-(RET_PTK)PTKUserBackFeed:(int)feedLen;
-(RET_PTK)PTKSoftFontDel:(char)nPid;
-(RET_PTK)PTKSoftFontList;
-(RET_PTK)PTKMediaDetect;
-(RET_PTK)PTKFeedMedia;

-(RET_PTK)PTKDisableBackFeed;
-(RET_PTK)PTKDisableErrorReport;
-(RET_PTK)PTKDisableFLASH;
-(RET_PTK)PTKDownload;
-(RET_PTK)PTKDS:(int)nId;//未实现
-(RET_PTK)PTKEnableBackFeed;
-(RET_PTK)PTKEnableErrorReport;
-(RET_PTK)PTKEnableFlASH;
-(RET_PTK)PTKExecForm:(NSString*)strPid;
-(RET_PTK)PTKFeedBack;
-(RET_PTK)PTKFormDel:(NSString*)strPid;
-(RET_PTK)PTKFormDownload:(NSString *)strPid;
-(RET_PTK)PTKFormEnd;
-(RET_PTK)PTKFormList;

-(RET_PTK)PTKDrawText:(int)nPx andPy:(int)nPy andDirec:(int)nDirec andFont:(char)nFont andHorizontal:(int)nHorizontal andVertical:(int)nVertical andText:(char)cText andStr:(NSString *)strStr;
-(RET_PTK)PTKClearBuffer;
-(RET_PTK)PTKDrawCircledWord:(int)nPx andPy:(int)nPy andStr:(NSString *)strStr;


@end
