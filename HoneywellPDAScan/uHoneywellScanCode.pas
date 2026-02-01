unit uHoneywellScanCode;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,

  {$IFDEF ANDROID}
  FMX.Helpers.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.os,
  Androidapi.JNI.Net,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  Androidapi.NativeActivity,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.GraphicsContentViewText,
  {$ENDIF}

  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

  {$IFDEF ANDROID}
type
  //Honeywell扫码广播初始监听
  THoneywellScanCodeBoardcastListener = class(TJavaLocal, JFMXBroadcastReceiverListener)
  public
    destructor Destroy;override;
  public
    procedure onReceive(context: JContext; intent: JIntent); cdecl;

//    procedure claimScanner();
//
//    procedure releaseScanner();
  end;
  {$ENDIF ANDROID}


implementation

uses
  Unit8;



//  {$IFDEF ANDROID}
//  case AAppEvent of
//    TApplicationEvent.BecameActive:
//    begin
//      FHoneywellScanCodeBroadcastListener.claimScanner();
//    end;
//    TApplicationEvent.EnteredBackground:
//    begin
//      FHoneywellScanCodeBroadcastListener.releaseScanner();
//    end;
//  end;
//  {$ENDIF}



  {$IFDEF ANDROID}

{ THoneywellScanCodeBoardcastListener }

//procedure THoneywellScanCodeBoardcastListener.claimScanner();
//var
//  properties:JBundle;
//  Intent: JIntent;
//begin
//  FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.claimScanner');
//  // 与PDA确定通信的协议字段
//  properties := TJBundle.JavaClass.init;
//
//  properties.putBoolean(StringToJString('DPR_DATA_INTENT'), True);
//  properties.putString(StringToJString('DPR_DATA_INTENT_ACTION'), StringToJString('com.honeywell.sample.action.BARCODE_DATA'));
//
//  Intent := TJIntent.JavaClass.init(StringToJString('com.honeywell.aidc.action.ACTION_CLAIM_SCANNER'));
//  Intent.setPackage(StringToJString('com.intermec.datacollectionservice'));
//  Intent.putExtra(StringToJString('com.honeywell.aidc.extra.EXTRA_SCANNER'), StringToJString('dcs.scanner.imager'));
//  // 指定配置名称
//  Intent.putExtra(StringToJString('com.honeywell.aidc.extra.EXTRA_PROFILE'), StringToJString('MyProfile1'));
//  Intent.putExtra(StringToJString('com.honeywell.aidc.extra.EXTRA_PROPERTIES'), properties);
//
//  TAndroidHelper.Activity.sendBroadcast(Intent);
//end;
//
//procedure THoneywellScanCodeBoardcastListener.releaseScanner();
//var
//  Intent: JIntent;
//begin
//  FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.releaseScanner');
//
//
//  Intent := TJIntent.JavaClass.init(StringToJString('com.honeywell.aidc.action.ACTION_RELEASE_SCANNER'));
//  Intent.setPackage(StringToJString('com.intermec.datacollectionservice'));
//
//  TAndroidHelper.Activity.sendBroadcast(Intent);
//end;

procedure THoneywellScanCodeBoardcastListener.onReceive(context: JContext; intent: JIntent);
var
  action:JString;
  LStrAction: string;
//  ABarCode:String;
  version:Integer;
  aimId:String;
  charset:String;
  codeId:String;
  data:String;
//  dataBytes:JBytes;
  dataBytes:TJavaArray<Byte>;
//  dataStr:JString;
//  dataBytesStr:String;
  timestamp:String;
begin
  action:=intent.getAction;
  LStrAction := JStringToString(intent.getAction);

  FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.onReceive '+LStrAction);



//  /*
//  These extras are available:
//      "version" (int) = Data Intent Api version
//      "aimId" (String) = The AIM Identifier
//API DOCUMENTATION
//Honeywell Android Data Collection Intent API
//      "charset" (String) = The charset used to convert "dataBytes" to "data" string
//      "codeId" (String) = The Honeywell Symbology Identifier
//      "data" (String) = The barcode data as a string
//      "dataBytes" (byte[]) = The barcode data as a byte array
//      "timestamp" (String) = The barcode timestamp
//   */
//
//  int version = intent.getIntExtra("version", 0);
//  if (version >= 1) {
//      String aimId = intent.getStringExtra("aimId");
//      String charset = intent.getStringExtra("charset");
//      String codeId = intent.getStringExtra("codeId");
//      String data = intent.getStringExtra("data");
//      byte[] dataBytes = intent.getByteArrayExtra("dataBytes");
//      String dataBytesStr = bytesToHexString(dataBytes);
//      String timestamp = intent.getStringExtra("timestamp");
//
//      String text = String.format(
//              "Data:%s\n" +
//              "Charset:%s\n" +
//              "Bytes:%s\n" +
//              "AimId:%s\n" +
//              "CodeId:%s\n" +
//              "Timestamp:%s\n",
//              data, charset, dataBytesStr, aimId, codeId, timestamp);
//      setText(text);
//  }

  if (LStrAction<>'com.honeywell.sample.action.BARCODE_DATA') then
  begin
    Exit;
  end;


  version:=intent.getIntExtra(StringToJString('version'),0);
  if version<1 then Exit;

  aimId := JStringToString(intent.getStringExtra(StringToJString('aimId')));
  charset := JStringToString(intent.getStringExtra(StringToJString('charset')));
  codeId := JStringToString(intent.getStringExtra(StringToJString('codeId')));
  data := JStringToString(intent.getStringExtra(StringToJString('data')));

//  byte[] dataBytes := intent.getByteArrayExtra(StringToJString('dataBytes'));
//  dataBytesStr := bytesToHexString(dataBytes);

  dataBytes := intent.getByteArrayExtra(StringToJString('dataBytes'));
  //转成字符串
//  dataStr:=TJString.JavaClass.Init(dataBytes,StringToJString('data'));

  timestamp := JStringToString(intent.getStringExtra(StringToJString('timestamp')));


  FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.aimId '+aimId);
  FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.charset '+charset);
  FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.codeId '+codeId);
  FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.data '+data);
  FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.timestamp '+timestamp);

  TThread.Synchronize(nil,procedure
  begin
    Form8.DoScanCodeResultEvent(nil,data);

  end);

//  if intent.hasExtra(StringToJString('barcode_string')) then
//  begin
//    ABarCode:=JStringToString(intent.getStringExtra(StringToJString('barcode_string')));
//    FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.onReceive BarCode:'+ABarCode);
//
////    TThread.Synchronize(nil,procedure
////    begin
////      if CurrentFrame=GlobalScanOutStoreFrame then
////      begin
////        GlobalScanOutStoreFrame.DoScanCodeResultEvent(nil,ABarCode);
////      end;
////      if CurrentFrame=GlobalScanInStoreFrame then
////      begin
////        GlobalScanInStoreFrame.DoScanCodeResultEvent(nil,ABarCode);
////      end;
////    end);
//  end
//  else
//  begin
//    FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.onReceive no BarCode');
//  end;


end;


destructor THoneywellScanCodeBoardcastListener.Destroy;
begin
  FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.Destroy begin');
  Inherited;
  FMX.Types.Log.d('OrangeUI THoneywellScanCodeBoardcastListener.Destroy end');
end;
  {$ENDIF ANDROID}



end.
