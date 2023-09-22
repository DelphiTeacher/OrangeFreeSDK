unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls,

  Androidapi.JNI.xiaoxu,
  Androidapi.JNI.mysummipay,


  Androidapi.Helpers, // JStringToString

  FMX.Helpers.Android,

  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.OS,
  Androidapi.JNI.GraphicsContentViewText, FMX.ScrollBox, FMX.Memo;


type
  TFrmMain=class;

  TJConnCallback = class(TJavaLocal, JSunmiPayService_ConnCallback)
  private
    [weak] FParent : TFrmMain;
  public
    constructor Create(AParent : TFrmMain);
    procedure onServiceConnected; cdecl;
    procedure onServiceDisconnected; cdecl;
  end;

  TJMyReadCardCallbackListener = class(TJavaLocal, JMyReadCardCallbackListener)
  private
    [weak] FParent : TFrmMain;
  public
    constructor Create(AParent : TFrmMain);
    procedure onStartCheckCard; cdecl;
    procedure onCardDetected(P1: JPayCardInfo); cdecl;
    procedure onError(P1: Integer; P2: JString); cdecl;
  end;


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
    FJConnCallback: JSunmiPayService_ConnCallback;
    //检卡回调是一个类,而不是一个接口
    //class ReadCallback extends ReadCardCallback.Stub{
    FJMyReadCardCallbackListener: JMyReadCardCallbackListener;
    FJMyReadCardCallbackClass: JMyReadCardCallbackClass;
  public
    { Public declarations }
    PayService: JSunmiPayService;
    mHardwareOpt: JHardwareOpt ;
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
  CallInUIThread(procedure
  begin
    //必须要放Java的主线程里面,不然初始就报错
    try
      FJConnCallback := TJConnCallback.Create(Self);
      FJMyReadCardCallbackListener:= TJMyReadCardCallbackListener.Create(Self);

      FJMyReadCardCallbackClass:=TJMyReadCardCallbackClass.Create;
      FJMyReadCardCallbackClass.setMyReadCardCallbackListener(FJMyReadCardCallbackListener);


      PayService := TJSunmiPayService.JavaClass.getInstance;
      PayService.connectPayService(
        //文档里说了要用程序的上下文
        SharedActivityContext.getApplicationContext,
        FJConnCallback);
    except
      on E:Exception do
      begin
        FMX.Types.Log.d('OrangeUI PayService.connectPayService '+E.Message);
      end;
    end;
  end);
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
  mHardwareOpt.cardOff(TJAidlConstants_CardType.JavaClass.MIFARE);
end;

procedure TFrmMain.btnCheckMagCardClick(Sender: TObject);
begin
  //检测磁条卡
  mHardwareOpt.checkCard(TJAidlConstants_CardType.JavaClass.MAG ,
                         TJReadCardCallback_Stub.JavaClass.asInterface(
                           FJMyReadCardCallbackClass.asBinder
                            ),
                        5);
end;

procedure TFrmMain.btnCheckIcCardClick(Sender: TObject);
begin
  //非接触式的IC卡
  mHardwareOpt.checkCard(TJAidlConstants_CardType.JavaClass.MIFARE ,
                         TJReadCardCallback_Stub.JavaClass.asInterface(
                           FJMyReadCardCallbackClass.asBinder
                            ),
                        10);
// mHardwareOpt.mifareAuth(1,StrToInt(edit2.Text),'?')
//  mHardwareOpt.mifareReadBlock(StrToInt(edit2.Text),'?')
end;

procedure TFrmMain.AuthCard;
var
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
  if Self.mHardwareOpt.mifareAuth(0,
         StrToInt(Self.edtBlock.Text),
         AKeyBytesArray
          )=0 then
  begin
    //卡片认证成功
    Self.Memo1.Lines.Add('onCardDetected mifareAuth 卡片认证成功');

  end
  else
  begin
    //卡片认证失败
    Self.Memo1.Lines.Add('onCardDetected mifareAuth 卡片认证失败');

  end;


end;

procedure TFrmMain.btnAuthCardClick(Sender: TObject);
begin
  Self.AuthCard;
end;

procedure TFrmMain.btnBeepClick(Sender: TObject);
begin
  if mHardwareOpt.buzzerOnDevice(1)=0 then
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
  if Assigned(PayService) then
    PayService := nil;

  FreeAndNil(FJConnCallback);

  FreeAndNil(FJMyReadCardCallbackListener);

  mHardwareOpt.cancelCheckCard();
  PayService.unbindPayService(SharedActivityContext);

  inherited;
end;

procedure TFrmMain.ReadCard;
var
  AReadCode:Integer;
  AReadBytesArray:TJavaArray<Byte>;
  AReadBytes:TBytes;
begin


    //读取内容
    AReadBytesArray:=TJavaArray<Byte>.Create(260);
    try

      AReadCode:=Self.mHardwareOpt.mifareReadBlock(
              StrToInt(Self.edtBlock.Text),
              AReadBytesArray);
      AReadBytes:=TJavaArrayToTBytes(AReadBytesArray);

      //前两个字节是长度
      Self.edtContent.Text:=//IntToStr(AReadBytes[2]);
        TEncoding.ANSI.GetString(AReadBytes,2,258);
    except
      on E:Exception do
      begin
        FMX.Types.Log.d('OrangeUI mHardwareOpt.mifareReadBlock Fail '+E.Message);
      end;
    end;
    if AReadCode=0 then
    begin
        Self.Memo1.Lines.Add('onCardDetected mifareReadBlock 卡片读取成功 '+IntToStr(AReadBytesArray.Length));
    end
    else
    begin
        Self.Memo1.Lines.Add('onCardDetected mifareReadBlock 卡片读取失败 '+IntToStr(AReadCode));
    end;



end;

procedure TFrmMain.WriteCard;
var
  AWriteCode:Integer;
  AWriteBytes:TBytes;
  AWriteBytesArray:TJavaArray<Byte>;
begin

//  SetLength(AWriteBytes,16);
//  AWriteBytes[0]:=1;
//  AWriteBytes[1]:=2;
//  AWriteBytes[2]:=3;
//  AWriteBytes[3]:=4;
//  AWriteBytes[4]:=5;
//  AWriteBytes[5]:=6;


//  Self.edtContent.Text:=IntToStr(AReadBytes[0]);

  //测试写入
  AWriteBytes:=TEncoding.ANSI.GetBytes(Self.edtContent.Text);


  AWriteBytesArray:=TBytesToTJavaArray(AWriteBytes);
  try

    AWriteCode:=Self.mHardwareOpt.mifareWriteBlock(
            StrToInt(Self.edtBlock.Text),
            AWriteBytesArray);
  except
    on E:Exception do
    begin
      FMX.Types.Log.d('OrangeUI mHardwareOpt.mifareWriteBlock Fail '+E.Message);
    end;
  end;
  if AWriteCode=0 then
  begin
      Self.Memo1.Lines.Add('onCardDetected mifareWriteBlock 卡片写入成功 ');
  end
  else
  begin
      Self.Memo1.Lines.Add('onCardDetected mifareWriteBlock 卡片写入失败 '+IntToStr(AWriteCode));
  end;


end;

{ TJConnCallback }

constructor TJConnCallback.Create(AParent: TFrmMain);
begin
  inherited Create;
  FParent := AParent
end;

procedure TJConnCallback.onServiceConnected;
begin
  FMX.Types.Log.d('OrangeUI TJConnCallback.onServiceConnected');

  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
  TThread.Synchronize(nil,procedure
  begin
    FParent.Memo1.Lines.Add('onServiceConnected');
  end);

  FParent.mHardwareOpt :=  FParent.PayService.mHardwareOpt;
end;

procedure TJConnCallback.onServiceDisconnected;
begin
  FMX.Types.Log.d('OrangeUI TJConnCallback.onServiceDisconnected');

  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
  TThread.Synchronize(nil,procedure
  begin
    FParent.Memo1.Lines.Add('onServiceDisconnected');
  end);

  //-20001	重复调用，上次函数调用没有返回
  //-20002	固件升级中,固件升级中调用该函数返回
  //-20003	参数错误
  //-20004	线程被异常中断

end;

{ TJMyReadCardCallbackListener }


constructor TJMyReadCardCallbackListener.Create(AParent: TFrmMain);
begin
  inherited Create;
  FParent := AParent;
end;

procedure TJMyReadCardCallbackListener.onCardDetected(P1: JPayCardInfo);
begin
  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
  TThread.Synchronize(nil,procedure
  begin
    FParent.Memo1.Lines.Add('onCardDetected '+JStringToString(P1.toString));

    if P1.cardType=TJAidlConstants_CardType.JavaClass.MAG then
    begin
      //磁条卡,读2轨的数据
      FParent.edtTrack2.Text:=JStringToString(P1.track2);
    end;

    if P1.cardType=TJAidlConstants_CardType.JavaClass.MIFARE then
    begin
    end;

  end);
end;

procedure TJMyReadCardCallbackListener.onError(P1: Integer; P2: JString);
begin
  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
  TThread.Synchronize(nil,procedure
  begin

//    -30001	操作失败
//    -30002	未知的卡类型
//    -30003	NFC检卡失败
//    -30004	IC检卡失败
//    -30005	读卡超时
//    -30006	磁道1错误
//    -30007	磁道2错误
//    -30008	磁道3错误
//    -30009	123磁道错误
//    -30010	12磁道错误
//    -30011	13磁道错误
//    -30012	23磁道错误
//    -30013	此卡为芯片卡,不可降级交易
//    -30014	建立候选列表超时
//    -30015	卡片交互失败
//    -30016	卡片交互参数错

    FParent.Memo1.Lines.Add('onError '+IntToStr(P1)+' '+JStringToString(P2));

  end);
end;

procedure TJMyReadCardCallbackListener.onStartCheckCard;
begin
  //不能在这里直接访问UI,因为可能是在线程中,所以要同步一下
  TThread.Synchronize(nil,procedure
  begin
    FParent.Memo1.Lines.Add('onStartCheckCard');
  end);
end;

end.
