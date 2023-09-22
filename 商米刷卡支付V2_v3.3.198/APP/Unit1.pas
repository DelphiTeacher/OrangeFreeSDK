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
    //�쿨�ص���һ����,������һ���ӿ�
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

//    //����Ҫ��Java�����߳�����,��Ȼ��ʼ�ͱ���
//    try
//
//
//      PayService := TJSunmiPayService.JavaClass.getInstance;
//      PayService.connectPayService(
//        //�ĵ���˵��Ҫ�ó����������
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
  //��������
//  mHardwareOpt.checkCard(TJAidlConstants_CardType.JavaClass.MAG ,
//                         TJReadCardCallback_Stub.JavaClass.asInterface(
//                           FJMyReadCardCallbackClass.asBinder
//                            ),
//                        5);
  Self.payKernel.mReadCardOptV2.checkCard(TJAidlConstants_CardType.JavaClass.MAGNETIC.getValue,
                                            //��Ϊ����ص�Ҫ������׿�ķ���������ҪStub�����Ͳſ���
                                            TJCheckCardCallbackV2_Stub.JavaClass.asInterface(
                                              FJMyReadCardCallbackClass.asBinder
                                              ),
                                            5
                                            );
end;

procedure TFrmMain.btnCheckIcCardClick(Sender: TObject);
begin
  //�ǽӴ�ʽ��IC�� M1��
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
  //�ǽӴ�ʽIC��
  AErrorCode:=Self.payKernel.mReadCardOptV2.mifareAuth(
        // ��Կ���ͣ�0��ʾKEY A��1��ʾ KEY B
        0,
        //������ʼ���
        StrToInt(Self.edtSection.Text) * 4,
         AKeyBytesArray
          );
  if AErrorCode=0 then
  begin
    //��Ƭ��֤�ɹ�
    Self.Memo1.Lines.Add('onCardDetected mifareAuth ��Ƭ��֤�ɹ�');

  end
  else
  begin
    //��Ƭ��֤ʧ��
    Self.Memo1.Lines.Add('onCardDetected mifareAuth ��Ƭ��֤ʧ�� '+JStringToString(TJAidlErrorCodeV2.JavaClass.valueOf(AErrorCode).getMsg()));

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


    //��ȡ����
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
          Self.Memo1.Lines.Add('onCardDetected mifareReadBlock ��Ƭ��ȡ�ɹ� '
                                +' Code:'+IntToStr(AReadCode)
                                +' Len:'+IntToStr(AReadBytesArray.Length)
                                +' Data:'+JStringToString(TJByteUtil.JavaClass.bytes2HexStr(AReadBytesArray)));
      end
      else
      begin
          Self.Memo1.Lines.Add('onCardDetected mifareReadBlock ��Ƭ��ȡʧ�� '+IntToStr(AReadCode));
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

  //����д��
  AWriteBytes:=TEncoding.ANSI.GetBytes(Self.edtContent.Text);

  FMX.Types.Log.d('OrangeUI onCardDetected mifareWriteBlock len: '+IntToStr(Length(AWriteBytes)));

  if Length(AWriteBytes)<>16 then
  begin
    ShowMessage('ÿ��ֻ��д��̶�����16���ֽ�');
    Exit;
  end;
  //ÿ��д��̶�����16���ֽ�
  AWriteBytesArray:=TBytesToTJavaArray(AWriteBytes);
  try

    AWriteCode:=Self.payKernel.mReadCardOptV2.mifareWriteBlock(
            StrToInt(Self.edtSection.Text) * 4+
            StrToInt(Self.edtBlock.Text),
            AWriteBytesArray);

    if AWriteCode=0 then
    begin
        Self.Memo1.Lines.Add('onCardDetected mifareWriteBlock ��Ƭд��ɹ� ');
    end
    else
    begin
        Self.Memo1.Lines.Add('onCardDetected mifareWriteBlock ��Ƭд��ʧ�� '+IntToStr(AWriteCode));
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
//  //����������ֱ�ӷ���UI,��Ϊ���������߳���,����Ҫͬ��һ��
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
//  //����������ֱ�ӷ���UI,��Ϊ���������߳���,����Ҫͬ��һ��
//  TThread.Synchronize(nil,procedure
//  begin
//    FParent.Memo1.Lines.Add('onServiceDisconnected');
//  end);
//
//  //-20001	�ظ����ã��ϴκ�������û�з���
//  //-20002	�̼�������,�̼������е��øú�������
//  //-20003	��������
//  //-20004	�̱߳��쳣�ж�
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
//  //����������ֱ�ӷ���UI,��Ϊ���������߳���,����Ҫͬ��һ��
//  TThread.Synchronize(nil,procedure
//  begin
//    FParent.Memo1.Lines.Add('onCardDetected '+JStringToString(P1.toString));
//
//    if P1.cardType=TJAidlConstants_CardType.JavaClass.MAG then
//    begin
//      //������,��2�������
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
//  //����������ֱ�ӷ���UI,��Ϊ���������߳���,����Ҫͬ��һ��
//  TThread.Synchronize(nil,procedure
//  begin
//
////    -30001	����ʧ��
////    -30002	δ֪�Ŀ�����
////    -30003	NFC�쿨ʧ��
////    -30004	IC�쿨ʧ��
////    -30005	������ʱ
////    -30006	�ŵ�1����
////    -30007	�ŵ�2����
////    -30008	�ŵ�3����
////    -30009	123�ŵ�����
////    -30010	12�ŵ�����
////    -30011	13�ŵ�����
////    -30012	23�ŵ�����
////    -30013	�˿�ΪоƬ��,���ɽ�������
////    -30014	������ѡ�б�ʱ
////    -30015	��Ƭ����ʧ��
////    -30016	��Ƭ����������
//
//    FParent.Memo1.Lines.Add('onError '+IntToStr(P1)+' '+JStringToString(P2));
//
//  end);
//end;
//
//procedure TJMyReadCardCallbackListener.onStartCheckCard;
//begin
//  //����������ֱ�ӷ���UI,��Ϊ���������߳���,����Ҫͬ��һ��
//  TThread.Synchronize(nil,procedure
//  begin
//    FParent.Memo1.Lines.Add('onStartCheckCard');
//  end);
//end;

{ TJSunmiPayKernel_ConnectCallback }

procedure TJSunmiPayKernel_ConnectCallback.onConnectPaySDK;
begin
  FMX.Types.Log.d('OrangeUI TJSunmiPayKernel_ConnectCallback.onConnectPaySDK');
  //����������ֱ�ӷ���UI,��Ϊ���������߳���,����Ҫͬ��һ��
  TThread.Synchronize(nil,procedure
  begin
    FrmMain.Memo1.Lines.Add('onConnectPaySDK');
  end);
//  FrmMain.payKernel.mReadCardOptV2;
end;

procedure TJSunmiPayKernel_ConnectCallback.onDisconnectPaySDK;
begin
  FMX.Types.Log.d('OrangeUI TJSunmiPayKernel_ConnectCallback.onDisconnectPaySDK');
  //����������ֱ�ӷ���UI,��Ϊ���������߳���,����Ҫͬ��һ��
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
  // * @param info return data��contain the following keys:
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
    //������,��2�������
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
