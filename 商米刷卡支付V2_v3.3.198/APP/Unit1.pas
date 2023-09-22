unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls,

//  Androidapi.JNI.xiaoxu,
//  Androidapi.JNI.mysummipay,

  Androidapi.JNI.PayLib_release_1_4_65_aar,
  Androidapi.JNI.mysunmipayv2,

  Androidapi.Helpers, // JStringToString

  FMX.Helpers.Android,

  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.OS,
  Androidapi.JNI.GraphicsContentViewText, FMX.ScrollBox, FMX.Memo,
  FMX.Memo.Types;


type
  TFrmMain=class;


  TJSunmiPayKernel_ConnectCallback=class(TJavaLocal,JSunmiPayKernel_ConnectCallback)
  public
    procedure onConnectPaySDK; cdecl;
    procedure onDisconnectPaySDK; cdecl;
  end;

//  TJConnCallback = class(TJavaLocal, JSunmiPayService_ConnCallback)
//  private
//    [weak] FParent : TFrmMain;
//  public
//    constructor Create(AParent : TFrmMain);
//    procedure onServiceConnected; cdecl;
//    procedure onServiceDisconnected; cdecl;
//  end;

  TJMyReadCardCallbackListener = class(TJavaLocal, JMyReadCardCallbackListener)
  public
    { methods }
    procedure findMagCard(P1: JBundle); cdecl;
    procedure findICCard(P1: JString); cdecl;
    procedure findRFCard(P1: JString); cdecl;
    procedure onError(P1: Integer; P2: JString); cdecl;
    procedure findICCardEx(P1: JBundle); cdecl;
    procedure findRFCardEx(P1: JBundle); cdecl;
    procedure onErrorEx(P1: JBundle); cdecl;
  end;

//  TJCheckCardCallbackV2 = class(TJavaLocal, JCheckCardCallbackV2)
//    { methods }
//    procedure findMagCard(P1: JBundle); cdecl;
//    procedure findICCard(P1: JString); cdecl;
//    procedure findRFCard(P1: JString); cdecl;
//    procedure onError(P1: Integer; P2: JString); cdecl;
//    procedure findICCardEx(P1: JBundle); cdecl;
//    procedure findRFCardEx(P1: JBundle); cdecl;
//    procedure onErrorEx(P1: JBundle); cdecl;
//
//    { Property }
//  end;

  TFrmMain = class(TForm)
    btnInit: TButton;
    edtTrack2: TEdit;
    btnCheckMagCard: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    edtBlock: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    btnCheckIcCard: TButton;
    Label4: TLabel;
    edtContent: TEdit;
    btnBeep: TButton;
    btnAuthCard: TButton;
    btnReadCard: TButton;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    edtSection: TEdit;
    procedure btnInitClick(Sender: TObject);
    procedure btnCheckMagCardClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCheckIcCardClick(Sender: TObject);
    procedure btnBeepClick(Sender: TObject);
    procedure btnAuthCardClick(Sender: TObject);
    procedure btnReadCardClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    payKernel:JSunmiPayKernel;
    FJConnCallback: JSunmiPayKernel_ConnectCallback;
//    FJCheckCardCallbackV2:JCheckCardCallbackV2;
    //检卡回调是一个类,而不是一个接口
    //class ReadCallback extends ReadCardCallback.Stub{
    FJMyReadCardCallbackListener: JMyReadCardCallbackListener;
    FJMyReadCardCallbackClass: JMyReadCardCallbackClass;
  public
    { Public declarations }
//    PayService: JSunmiPayService;
//    mHardwareOpt: JHardwareOpt ;
//    readCardOptV2 = payKernel.mReadCardOptV2;
    procedure AuthCard;
    procedure ReadCard;
    procedure WriteCard;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}

procedure TFrmMain.btnInitClick(Sender: TObject);
begin
  payKernel:=TJSunmiPayKernel.JavaClass.getInstance();
//    function initPaySDK(context: JContext; callback: JSunmiPayKernel_ConnectCallback): Boolean; cdecl;
  FJConnCallback := TJSunmiPayKernel_ConnectCallback.Create();
  payKernel.initPaySDK(SharedActivityContext.getApplicationContext,
                       FJConnCallback
                      );

//  FJCheckCardCallbackV2:=TJCheckCardCallbackV2.Create;
  FJMyReadCardCallbackListener:= TJMyReadCardCallbackListener.Create();

  FJMyReadCardCallbackClass:=TJMyReadCardCallbackClass.Create;
  FJMyReadCardCallbackClass.setMyReadCardCallbackListener(FJMyReadCardCallbackListener);

//    //必须要放Java的主线程里面,不然初始就报错
//    try
//
//
//      PayService := TJSunmiPayService.JavaClass.getInstance;
//      PayService.connectPayService(
//        //文档里说了要用程序的上下文
//        SharedActivityContext.getApplicationContext,
//        FJConnCallback);
//    except
//      on E:Exception do
//      begin
//        FMX.Types.Log.d('OrangeUI PayService.connectPayService '+E.Message);
//      end;
//    end;
end;

procedure TFrmMain.btnReadCardClick(Sender: TObject);
begin
  Self.ReadCard;
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  WriteCard;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
  Self.payKernel.mReadCardOptV2.cardOff(TJAidlConstants_CardType.JavaClass.MIFARE.getValue);
end;

procedure TFrmMain.btnCheckMagCardClick(Sender: TObject);
begin
  //检测磁条卡
//  mHardwareOpt.checkCard(TJAidlConstants_CardType.JavaClass.MAG ,
//                         TJReadCardCallback_Stub.JavaClass.asInterface(
//                           FJMyReadCardCallbackClass.asBinder
//                            ),
//                        5);
  Self.payKernel.mReadCardOptV2.checkCard(TJAidlConstants_CardType.JavaClass.MAGNETIC.getValue,
                                            //因为这个回调要传给安卓的服务，所以需要Stub的类型才可以
                                            TJCheckCardCallbackV2_Stub.JavaClass.asInterface(
                                              FJMyReadCardCallbackClass.asBinder
                                              ),
                                            5
                                            );
end;

procedure TFrmMain.btnCheckIcCardClick(Sender: TObject);
begin
  //非接触式的IC卡 M1卡
  Self.payKernel.mReadCardOptV2.checkCard(TJAidlConstants_CardType.JavaClass.MIFARE.getValue,
                                         TJCheckCardCallbackV2_Stub.JavaClass.asInterface(
                                           FJMyReadCardCallbackClass.asBinder
                                            ),
                                        60);
// mHardwareOpt.mifareAuth(1,StrToInt(edit2.Text),'?')
//  mHardwareOpt.mifareReadBlock(StrToInt(edit2.Text),'?')
end;

procedure TFrmMain.AuthCard;
var
  AErrorCode:Integer;
  AKeyBytes:TBytes;
  AKeyBytesArray:TJavaArray<Byte>;
begin
  SetLength(AKeyBytes,6);
  AKeyBytes[0]:=$FF;
  AKeyBytes[1]:=$FF;
  AKeyBytes[2]:=$FF;
  AKeyBytes[3]:=$FF;
  AKeyBytes[4]:=$FF;
  AKeyBytes[5]:=$FF;


  AKeyBytesArray:=TBytesToTJavaArray(AKeyBytes);
  //非接触式IC卡
  AErrorCode:=Self.payKernel.mReadCardOptV2.mifareAuth(
        // 密钥类型，0表示KEY A、1表示 KEY B
        0,
        //扇区起始块号
        StrToInt(Self.edtSection.Text) * 4,
         AKeyBytesArray
          );
  if AErrorCode=0 then
  begin
    //卡片认证成功
    Self.Memo1.Lines.Add('onCardDetected mifareAuth 卡片认证成功');

  end
  else
  begin
    //卡片认证失败
    Self.Memo1.Lines.Add('onCardDetected mifareAuth 卡片认证失败 '+JStringToString(TJAidlErrorCodeV2.JavaClass.valueOf(AErrorCode).getMsg()));

  end;
end;

procedure TFrmMain.btnAuthCardClick(Sender: TObject);
begin
  Self.AuthCard;
end;

procedure TFrmMain.btnBeepClick(Sender: TObject);
begin
  if Self.payKernel.mBasicOpt.buzzerOnDevice(1)=0 then
  begin
    FMX.Types.Log.d('OrangeUI mHardwareOpt.buzzerOnDevice Succ');
  end
  else
  begin
    FMX.Types.Log.d('OrangeUI mHardwareOpt.buzzerOnDevice Fail');
  end;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
//  if Assigned(PayService) then
//    PayService := nil;
//
//  FreeAndNil(FJConnCallback);
//
//  FreeAndNil(FJMyReadCardCallbackListener);
//
//  mHardwareOpt.cancelCheckCard();
//  PayService.unbindPayService(SharedActivityContext);

  inherited;
end;

procedure TFrmMain.ReadCard;
var
  AReadCode:Integer;
  AReadBytesArray:TJavaArray<Byte>;
  AReadBytes:TBytes;
begin


    //读取内容
    AReadBytesArray:=TJavaArray<Byte>.Create(128);
    try

      AReadCode:=Self.payKernel.mReadCardOptV2.mifareReadBlock(
                        //
                        StrToInt(Self.edtSection.Text) * 4+
                        StrToInt(Self.edtBlock.Text),
                        AReadBytesArray);
      AReadBytes:=TJavaArrayToTBytes(AReadBytesArray);


      Self.edtContent.Text:=
        Trim(TEncoding.ANSI.GetString(AReadBytes));


      if (AReadCode>=0) and (AReadCode<=16) then
      begin
          Self.Memo1.Lines.Add('onCardDetected mifareReadBlock 卡片读取成功 '
                                +' Code:'+IntToStr(AReadCode)
                                +' Len:'+IntToStr(AReadBytesArray.Length)
                                +' Data:'+JStringToString(TJByteUtil.JavaClass.bytes2HexStr(AReadBytesArray)));
      end
      else
      begin
          Self.Memo1.Lines.Add('onCardDetected mifareReadBlock 卡片读取失败 '+IntToStr(AReadCode));
      end;

    except
      on E:Exception do
      begin
        FMX.Types.Log.d('OrangeUI mHardwareOpt.mifareReadBlock Fail '+E.Message);
      end;
    end;


end;

procedure TFrmMain.WriteCard;
var
  AWriteCode:Integer;
  AWriteBytes:TBytes;
  AWriteBytesArray:TJavaArray<Byte>;
begin

  //测试写入
  AWriteBytes:=TEncoding.ANSI.GetBytes(Self.edtContent.Text);

  FMX.Types.Log.d('OrangeUI onCardDetected mifareWriteBlock len: '+IntToStr(Length(AWriteBytes)));

  if Length(AWriteBytes)<>16 then
  begin
    ShowMessage('每次只能写入固定长度16个字节');
    Exit;
  end;
  //每次写入固定长度16个字节
  AWriteBytesArray:=TBytesToTJavaArray(AWriteBytes);
  try

    AWriteCode:=Self.payKernel.mReadCardOptV2.mifareWriteBlock(
            StrToInt(Self.edtSection.Text) * 4+
            StrToInt(Self.edtBlock.Text),
            AWriteBytesArray);

    if AWriteCode=0 then
    begin
        Self.Memo1.Lines.Add('onCardDetected mifareWriteBlock 卡片写入成功 ');
    end
    else
    begin
        Self.Memo1.Lines.Add('onCardDetected mifareWriteBlock 卡片写入失败 '+IntToStr(AWriteCode));
    end;

  except
    on E:Exception do
    begin
      FMX.Types.Log.d('OrangeUI mHardwareOpt.mifareWriteBlock Fail '+E.Message);
    end;
  end;

end;

//{ TJConnCallback }
//
//constructor TJConnCallback.Create(AParent: TFrmMain);
//begin
//  inherited Create;
//  FParent := AParent
//end;
//
//procedure TJConnCallback.onServiceConnected;
//begin
//  FMX.Types.Log.d('OrangeUI TJConnCallback.onServiceConnected');
//
//  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
//  TThread.Synchronize(nil,procedure
//  begin
//    FParent.Memo1.Lines.Add('onServiceConnected');
//  end);
//
//  FParent.mHardwareOpt :=  FParent.PayService.mHardwareOpt;
//end;
//
//procedure TJConnCallback.onServiceDisconnected;
//begin
//  FMX.Types.Log.d('OrangeUI TJConnCallback.onServiceDisconnected');
//
//  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
//  TThread.Synchronize(nil,procedure
//  begin
//    FParent.Memo1.Lines.Add('onServiceDisconnected');
//  end);
//
//  //-20001	重复调用，上次函数调用没有返回
//  //-20002	固件升级中,固件升级中调用该函数返回
//  //-20003	参数错误
//  //-20004	线程被异常中断
//
//end;

{ TJMyReadCardCallbackListener }


//constructor TJMyReadCardCallbackListener.Create(AParent: TFrmMain);
//begin
//  inherited Create;
//  FParent := AParent;
//end;
//
//procedure TJMyReadCardCallbackListener.onCardDetected(P1: JPayCardInfo);
//begin
//  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
//  TThread.Synchronize(nil,procedure
//  begin
//    FParent.Memo1.Lines.Add('onCardDetected '+JStringToString(P1.toString));
//
//    if P1.cardType=TJAidlConstants_CardType.JavaClass.MAG then
//    begin
//      //磁条卡,读2轨的数据
//      FParent.edtTrack2.Text:=JStringToString(P1.track2);
//    end;
//
//    if P1.cardType=TJAidlConstants_CardType.JavaClass.MIFARE then
//    begin
//    end;
//
//  end);
//end;
//
//procedure TJMyReadCardCallbackListener.onError(P1: Integer; P2: JString);
//begin
//  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
//  TThread.Synchronize(nil,procedure
//  begin
//
////    -30001	操作失败
////    -30002	未知的卡类型
////    -30003	NFC检卡失败
////    -30004	IC检卡失败
////    -30005	读卡超时
////    -30006	磁道1错误
////    -30007	磁道2错误
////    -30008	磁道3错误
////    -30009	123磁道错误
////    -30010	12磁道错误
////    -30011	13磁道错误
////    -30012	23磁道错误
////    -30013	此卡为芯片卡,不可降级交易
////    -30014	建立候选列表超时
////    -30015	卡片交互失败
////    -30016	卡片交互参数错
//
//    FParent.Memo1.Lines.Add('onError '+IntToStr(P1)+' '+JStringToString(P2));
//
//  end);
//end;
//
//procedure TJMyReadCardCallbackListener.onStartCheckCard;
//begin
//  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
//  TThread.Synchronize(nil,procedure
//  begin
//    FParent.Memo1.Lines.Add('onStartCheckCard');
//  end);
//end;

{ TJSunmiPayKernel_ConnectCallback }

procedure TJSunmiPayKernel_ConnectCallback.onConnectPaySDK;
begin
  FMX.Types.Log.d('OrangeUI TJSunmiPayKernel_ConnectCallback.onConnectPaySDK');
  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
  TThread.Synchronize(nil,procedure
  begin
    FrmMain.Memo1.Lines.Add('onConnectPaySDK');
  end);
//  FrmMain.payKernel.mReadCardOptV2;
end;

procedure TJSunmiPayKernel_ConnectCallback.onDisconnectPaySDK;
begin
  FMX.Types.Log.d('OrangeUI TJSunmiPayKernel_ConnectCallback.onDisconnectPaySDK');
  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
  TThread.Synchronize(nil,procedure
  begin
    FrmMain.Memo1.Lines.Add('onDisconnectPaySDK');
  end);

end;

//{ TJCheckCardCallbackV2 }
//
//procedure TJCheckCardCallbackV2.findICCard(P1: JString);
//begin
//  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findICCard P1:'+JStringToString(P1));
//
//end;
//
//procedure TJCheckCardCallbackV2.findICCardEx(P1: JBundle);
//begin
//  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findICCardEx P1:'+JStringToString(P1.toString));
//
//
//end;
//
//procedure TJCheckCardCallbackV2.findMagCard(P1: JBundle);
//begin
//  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findMagCard');
//  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findMagCard P1:'+JStringToString(P1.toString));
//
//
//end;
//
//procedure TJCheckCardCallbackV2.findRFCard(P1: JString);
//begin
//  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findRFCard');
//
//
//end;
//
//procedure TJCheckCardCallbackV2.findRFCardEx(P1: JBundle);
//begin
//  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findRFCardEx P1:'+JStringToString(P1.toString));
//
//
//end;
//
//procedure TJCheckCardCallbackV2.onError(P1: Integer; P2: JString);
//begin
//  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.onError'
//                  +' P1:'+IntToStr(P1)
//                  +' P2:'+JStringToString(P2)
//                );
//
//
//end;
//
//procedure TJCheckCardCallbackV2.onErrorEx(P1: JBundle);
//begin
//  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.onErrorEx P1:'+JStringToString(P1.toString));
//
//
//end;

{ TJMyReadCardCallbackListener }

procedure TJMyReadCardCallbackListener.findICCard(P1: JString);
begin
  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findICCard');
  if P1<>nil then
  begin
    FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findICCard P1:'+JStringToString(P1));
  end;

end;

procedure TJMyReadCardCallbackListener.findICCardEx(P1: JBundle);
begin
  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findICCardEx');
  if P1<>nil then
  begin
    FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findICCardEx atr P1:'+JStringToString(TJUtility.JavaClass.bundle2String(P1)));
  end;

end;

procedure TJMyReadCardCallbackListener.findMagCard(P1: JBundle);
begin
  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findMagCard');
  if P1<>nil then
  begin
    FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findMagCard P1:'+JStringToString(TJUtility.JavaClass.bundle2String(P1)));
  end;
  ///**
  // * Find magnetic card
  // *
  // * @param info return data，contain the following keys:
  // *             <br/>cardType: card type (int)
  // *             <br/>TRACK1: track 1 data (String)
  // *             <br/>TRACK2: track 2 data (String)
  // *             <br/>TRACK3: track 3 data (String)
  // *             <br/>track1ErrorCode: track 1 error code (int)
  // *             <br/>track2ErrorCode: track 2 error code (int)
  // *             <br/>track3ErrorCode: track 3 error code (int)
  // *             <br/> track error code is one of the following values:
  // *             <ul>
  // *             <li>0 - No error</li>
  // *             <li>-1 - Track has no data</li>
  // *             <li>-2 - Track parity check error</li>
  // *             <li>-3 - Track LRC check error</li>
  // *             </ul>
  // */

  TThread.Synchronize(nil,procedure
  begin
    //磁条卡,读2轨的数据
    frmMain.edtTrack2.Text:=JStringToString(P1.getString(StringToJString('TRACK2')));
  end);


end;

procedure TJMyReadCardCallbackListener.findRFCard(P1: JString);
begin
  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findRFCard');
  if P1<>nil then
  begin
    FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findRFCard uuid P1:'+JStringToString(P1));
  end;

end;

procedure TJMyReadCardCallbackListener.findRFCardEx(P1: JBundle);
begin
  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findRFCardEx');
  if P1<>nil then
  begin
    FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.findRFCardEx uuid P1:'+JStringToString(TJUtility.JavaClass.bundle2String(P1)));
  end;

end;

procedure TJMyReadCardCallbackListener.onError(P1: Integer; P2: JString);
begin
  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.onError');
  if P2<>nil then
  begin
    FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.onError'
                    +' P1:'+IntToStr(P1)
                    +' P2:'+JStringToString(P2)
                  );
  end;

end;

procedure TJMyReadCardCallbackListener.onErrorEx(P1: JBundle);
begin
  FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.onErrorEx');
  if P1<>nil then
  begin
    FMX.Types.Log.d('OrangeUI TJCheckCardCallbackV2.onErrorEx'
                  +' P1:'+JStringToString(TJUtility.JavaClass.bundle2String(P1))
                );
  end;

end;

end.
