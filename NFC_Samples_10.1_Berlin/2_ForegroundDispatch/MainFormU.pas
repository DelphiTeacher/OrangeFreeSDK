unit MainFormU;

interface

uses
  Androidapi.JNI.Nfc,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App,
  FMX.Platform,
  System.Messaging,
  Math,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Layouts, FMX.ListBox, NFCHelper,
  FMX.Edit, FMX.Controls.Presentation;

type

  TMainForm = class(TForm)
    NFCTagIdLabel: TLabel;
    PromptLabel: TLabel;
    TagWriteEdit: TEdit;
    TagWriteButton: TButton;
    NfcCheckBox: TCheckBox;
    InfoList: TListBox;
    Button1: TButton;
    edtBlockData: TEdit;
    edtBlockIndex: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TagWriteButtonClick(Sender: TObject);
    procedure NfcCheckBoxChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    NfcAdapter: JNfcAdapter;
    NFCSettingsChecked: Boolean;
    PendingIntent: JPendingIntent;
    // Proxy for calling NfcAdapter.enableForegroundDispatch
    procedure EnableForegroundDispatch;
    var AppEvents: IFMXApplicationEventService;
    function ApplicationEventHandler(AAppEvent: TApplicationEvent;
      AContext: TObject): Boolean;
  public
    { Public declarations }
    MessageSubscriptionID: Integer;
    procedure HandleIntentMessage(const Sender: TObject; const M: TMessage);
    procedure OnNewNfcIntent(Intent: JIntent);

    function ReadTagBlock(ABlockIndex:Integer;var ABlockDataStr:String):Boolean;
    function WriteTagBlock(ABlockIndex:Integer;ABlockDataStr:String):Boolean;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses
  System.TypInfo,
  FMX.Platform.Android,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.Jni,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Nfc.Tech,
  Androidapi.JNI.Toast;

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
var
  ClassIntent: JIntent;
begin
  Log.d('OrangeUI OnCreate');
  NFCSettingsChecked := False;
  //Set up event that triggers when app is brought back to foreground
  if TPlatformServices.Current.SupportsPlatformService(
       IFMXApplicationEventService,
       IInterface(AppEvents)) then
  begin
    AppEvents.SetApplicationEventHandler(ApplicationEventHandler);
  end;
  // Subscribe to the FMX message that is sent when onNewIntent is called
  // with an intent containing any of these 3 intent actions.
  // Support for this was added in Delphi 10 Seattle.
  MainActivity.registerIntentAction(TJNfcAdapter.JavaClass.ACTION_NDEF_DISCOVERED);
  MainActivity.registerIntentAction(TJNfcAdapter.JavaClass.ACTION_TECH_DISCOVERED);
  MainActivity.registerIntentAction(TJNfcAdapter.JavaClass.ACTION_TAG_DISCOVERED);
  MessageSubscriptionID := TMessageManager.DefaultManager.SubscribeToMessage(
    TMessageReceivedNotification, HandleIntentMessage);
  NfcAdapter := TJNfcAdapter.JavaClass.getDefaultAdapter(TAndroidHelper.Context);
  if NfcAdapter = nil then
  begin
    // Could do with exiting here maybe...
    raise Exception.Create('No NFC adapter present');
  end;
  // Set up the pending intent needed for enabling NFC foreground dispatch
  ClassIntent := TJIntent.JavaClass.init(TAndroidHelper.Context, TAndroidHelper.Activity.getClass);
  PendingIntent := TJPendingIntent.JavaClass.getActivity(TAndroidHelper.Context, 0,
    ClassIntent.addFlags(TJIntent.JavaClass.FLAG_ACTIVITY_SINGLE_TOP), 0);
end;

procedure TMainForm.FormActivate(Sender: TObject);
var
  Intent: JIntent;
begin
  Log.d('OrangeUI OnActivate');
  Intent := TAndroidHelper.Activity.getIntent;
  if not TJIntent.JavaClass.ACTION_MAIN.equals(Intent.getAction) then
  begin
    Log.d('OrangeUI Passing along received intent');
    OnNewNfcIntent(Intent);
  end;
end;

{$REGION 'JNI substitute for calling NfcAdapter.enableForegroundDispatch'}
procedure TMainForm.Button1Click(Sender: TObject);
var
  TagParcel: JParcelable;
  Tag: JTag;
  Intent: JIntent;

  mfc:JMifareClassic;
  ABlockData:TJavaArray<Byte>;
  ABlockStr:JString;

  auth:Boolean;

  ABlockDataStr:String;
begin
  ABlockDataStr:='';
  ReadTagBlock(StrToInt(Self.edtBlockIndex.Text),ABlockDataStr);
  Self.edtBlockData.Text:=ABlockDataStr;
  ShowMessage(ABlockDataStr);
  Exit;


  if (NfcAdapter <> nil) and NfcAdapter.isEnabled then
  begin
    Intent := TAndroidHelper.Activity.getIntent;
    TagParcel := Intent.getParcelableExtra(TJNfcAdapter.JavaClass.EXTRA_TAG);
    if TagParcel <> nil then
    begin
      Log.d('OrangeUI OrangeUI Wrapping tag from the parcel');
      Tag := TJTag.Wrap(TagParcel);


//      if not WriteTagText(TagWriteEdit.Text, Tag) then
//        raise Exception.Create('Error connecting to tag');


      TThread.CreateAnonymousThread(procedure

      var
        I: Integer;
        J: Integer;
        K:Integer;
        ASectorIndex:Integer;
        ABlockIndex:Integer;
    begin

        //m1卡
        mfc := TJMifareClassic.JavaClass.get(tag);
        if mfc=nil then
        begin
          ShowMessage('没有检测到卡片');
          Exit;
        end;
        Log.d('OrangeUI OrangeUI mfc.connect');
        mfc.connect;
        try


          mfc.getType();//获取TAG的类型
          Log.d('OrangeUI OrangeUI mfc type:'+IntToStr(mfc.getType()));
          //1K: 16个分区(sector)，每个分区4个块(block)，每个块(block) 16个byte数据
          //16
          Log.d('OrangeUI OrangeUI mfc getSectorCount:'+IntToStr(mfc.getSectorCount()));
          //16
          Log.d('OrangeUI OrangeUI mfc getBlockCount:'+IntToStr(mfc.getBlockCount()));
          //1024
          Log.d('OrangeUI OrangeUI mfc getSize:'+IntToStr(mfc.getSize()));   //KEY_NFC_FORUM
          Log.d('OrangeUI OrangeUI mfc getMaxTransceiveLength:'+IntToStr(mfc.getMaxTransceiveLength()));   //KEY_NFC_FORUM
//          auth:=False;
//          auth := mfc.authenticateSectorWithKeyA(2, TJMifareClassic.JavaClass.KEY_DEFAULT);//验证密码
//          auth := mfc.authenticateSectorWithKeyA(1, TJMifareClassic.JavaClass.KEY_NFC_FORUM);//验证密码
//          if not auth then
//          begin
//            Log.d('OrangeUI OrangeUI mfc auth fail');
////            Exit;
//          end
//          else
//          begin
//            Log.d('OrangeUI OrangeUI mfc auth succ');
//          end;
    //      auth := mfc.authenticateSectorWithKeyA(4, StringToJString('FFFFFF').getBytes());//验证密码
    //      if not auth then
    //      begin
    //        ShowMessage('验证失败');
    //      end;
    //      auth := mfc.authenticateSectorWithKeyA(4, StringToJString('FF').getBytes());//验证密码
    //      if not auth then
    //      begin
    //        ShowMessage('验证失败');
    //      end;
    //      auth := mfc.authenticateSectorWithKeyA(4, StringToJString('0').getBytes());//验证密码
    //      if not auth then
    //      begin
    //        ShowMessage('验证失败');
    //      end;


//          for I := 0 to mfc.getSectorCount()-1 do
          for I := 3 to 3 do
//          for I := 63 to 63 do
          begin

              for J := 0 to mfc.getBlockCountInSector(I)-1 do
              begin
                  auth:=False;
                  //1K: 16个分区(sector)
                  if mfc.authenticateSectorWithKeyA(I, TJMifareClassic.JavaClass.KEY_DEFAULT) then
                  begin
                    auth:=True;
                    Log.d('OrangeUI OrangeUI mfc authA KEY_DEFAULT succ Sector:'+IntToStr(I));
                  end
                  else if mfc.authenticateSectorWithKeyA(I, TJMifareClassic.JavaClass.KEY_MIFARE_APPLICATION_DIRECTORY) then
                  begin
                    auth:=True;
                    Log.d('OrangeUI OrangeUI mfc authA KEY_MIFARE_APPLICATION_DIRECTORY Sector:succ '+IntToStr(I));
                  end
                  else if mfc.authenticateSectorWithKeyA(I, TJMifareClassic.JavaClass.KEY_NFC_FORUM) then
                  begin
                    auth:=True;
                    Log.d('OrangeUI OrangeUI mfc authA KEY_NFC_FORUM Sector:succ '+IntToStr(I));
                  end
                  else
                  begin
                    Log.d('OrangeUI OrangeUI mfc authA Fail Sector:'+IntToStr(I));
                    Break;
                  end;


                  ABlockIndex:=I*mfc.getBlockCountInSector(I)+J;
                  try
                    Log.d('OrangeUI OrangeUI mfc.readBlock begin Block:'+IntToStr(ABlockIndex));
                    ABlockData:=mfc.readBlock(ABlockIndex);
                    Log.d('OrangeUI OrangeUI mfc.readBlock begin datalen:'+IntToStr(ABlockData.Length));
                    for K := 0 to ABlockData.Length-1 do
                    begin
                      Log.d('OrangeUI OrangeUI mfc.readBlock data:'+IntToStr(K)+' '+IntToStr(ABlockData[K]));
                    end;
                    Log.d('OrangeUI OrangeUI mfc.readBlock end Block:'+IntToStr(ABlockIndex));
                    ABlockStr:=TJString.JavaClass.init(ABlockData);
                    Log.d('OrangeUI OrangeUI mfc.readedBlock end Block:'+JStringToString(ABlockStr));
                  except
                    on E:Exception do
                    begin
                      Log.d('OrangeUI OrangeUI mfc.readBlock error:'+E.Message);
                    end;
                  end;


              end;


          end;




  //        ShowMessage('读到'+JStringToString(ABlockStr));
        finally
          mfc.close;
        end;

      end).Start;

    end;
  end
  else
    raise Exception.Create('OrangeUI NFC is not available');


end;

procedure TMainForm.EnableForegroundDispatch;
var
  PEnv: PJniEnv;
  AdapterClass: JNIClass;
  NfcAdapterObject, PendingIntentObject: JNIObject;
  MethodID: JNIMethodID;
begin
  // We can't just call the imported NfcAdapter method enableForegroundDispatch
  // as it will crash due to a shortcoming in the JNI Bridge, which does not
  // support 2D array parameters. So instead we call it via a manual JNI call.
  PEnv := TJNIResolver.GetJNIEnv;
  NfcAdapterObject := (NfcAdapter as ILocalObject).GetObjectID;
  PendingIntentObject := (PendingIntent as ILocalObject).GetObjectID;
  AdapterClass := PEnv^.GetObjectClass(PEnv, NfcAdapterObject);
  // Get the signature with:
  // javap -s -classpath <path_to_android_platform_jar> android.nfc.NfcAdapter
  MethodID := PEnv^.GetMethodID(
    PEnv, AdapterClass, 'enableForegroundDispatch',
    '(Landroid/app/Activity;Landroid/app/PendingIntent;' +
    '[Landroid/content/IntentFilter;[[Ljava/lang/String;)V');
  // Clean up
  PEnv^.DeleteLocalRef(PEnv, AdapterClass);
  // Finally call the target Java method
  PEnv^.CallVoidMethodA(PEnv, NfcAdapterObject, MethodID,
    PJNIValue(ArgsToJNIValues([JavaContext, PendingIntentObject, nil, nil])));
end;
{$ENDREGION}

procedure TMainForm.NfcCheckBoxChange(Sender: TObject);
begin
  if NfcAdapter <> nil then
  begin
    if NfcCheckBox.IsChecked then
      EnableForegroundDispatch
    else
      NfcAdapter.disableForegroundDispatch(TAndroidHelper.Activity)
  end;
end;

function TMainForm.ApplicationEventHandler(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin
  Log.d('OrangeUI ', Self, 'ApplicationEventHandler', Format('+ %s',
    [GetEnumName(TypeInfo(TApplicationEvent), Integer(AAppEvent))]));
  Result := True;
  case AAppEvent of
    TApplicationEvent.FinishedLaunching:
    begin
      //
    end;
    TApplicationEvent.BecameActive:
    begin
      if NfcAdapter <> nil then
      begin
        if not NfcAdapter.isEnabled then
        begin
          if not NFCSettingsChecked then
          begin
            Toast('NFC is not enabled.' + LineFeed + 'Launching NFC settings.');
            TAndroidHelper.Activity.startActivity(
              TJIntent.JavaClass.init(StringToJString('android.settings.NFC_SETTINGS')));
            NFCSettingsChecked := True;
          end
          else
          begin
            NfcCheckBox.Enabled := False;
            Toast('NFC functionality not available in this application due to system settings.');
          end;
        end
        else if NfcCheckBox.IsChecked then
          EnableForegroundDispatch
      end;
    end;
    TApplicationEvent.WillBecomeInactive:
    begin
      if NfcCheckBox.IsChecked and (NfcAdapter <> nil) then
        NfcAdapter.disableForegroundDispatch(TAndroidHelper.Activity);
    end;
    TApplicationEvent.WillTerminate:
    begin
      //
    end;
  end;
  Log.d('OrangeUI ', Self, 'ApplicationEventHandler', '-');
end;

procedure TMainForm.HandleIntentMessage(const Sender: TObject;
  const M: TMessage);
var
  Intent: JIntent;
begin
  if M is TMessageReceivedNotification then
  begin
    Intent := TMessageReceivedNotification(M).Value;
    if Intent <> nil then
    begin
      if TJNfcAdapter.JavaClass.ACTION_NDEF_DISCOVERED.equals(Intent.getAction) or
         TJNfcAdapter.JavaClass.ACTION_TECH_DISCOVERED.equals(Intent.getAction) or
         TJNfcAdapter.JavaClass.ACTION_TAG_DISCOVERED.equals(Intent.getAction) then
      begin
        OnNewNfcIntent(Intent);
      end;
    end;
  end;
end;

procedure TMainForm.OnNewNfcIntent(Intent: JIntent);
var
  TagParcel: JParcelable;
  Tag: JTag;
begin
  Log.d('OrangeUI TMainForm.OnNewIntent');
  TAndroidHelper.Activity.setIntent(Intent);
  Log.d('OrangeUI Intent action = %s', [JStringToString(Intent.getAction)]);
  PromptLabel.Visible := False;
  Log.d('OrangeUI Getting Tag parcel from the received Intent');
  TagParcel := Intent.getParcelableExtra(TJNfcAdapter.JavaClass.EXTRA_TAG);
  if TagParcel <> nil then
  begin
    Log.d('OrangeUI Wrapping tag from the parcel');
    Tag := TJTag.Wrap(TagParcel);
  end;
  InfoList.Items.Clear;
  NFCTagIdLabel.Text := HandleNfcTag(Tag,
    procedure (const Msg: string)
    var
      Strings: TStrings;
      I: Integer;
    begin
      Strings := TStringList.Create;
      try
        Strings.Text := Msg;
        for I := 0 to Pred(Strings.Count) do
        begin
          Log.d('OrangeUI Adding to UI: ' + Strings[I]);
          InfoList.Items.Add(Strings[I]);
        end;
      finally
        Strings.Free;
      end;
    end);
  InfoList.Visible := True;
end;

function TMainForm.ReadTagBlock(ABlockIndex: Integer;
  var ABlockDataStr: String): Boolean;
var
  TagParcel: JParcelable;
  Tag: JTag;
  Intent: JIntent;

  mfc:JMifareClassic;
  ABlockData:TJavaArray<Byte>;
  ABlockStr:JString;

  auth:Boolean;
      var
//        I: Integer;
//        J: Integer;
        K:Integer;
        ASectorIndex:Integer;
//        ABlockIndex:Integer;
begin
  if (NfcAdapter <> nil) and NfcAdapter.isEnabled then
  begin
    Intent := TAndroidHelper.Activity.getIntent;
    TagParcel := Intent.getParcelableExtra(TJNfcAdapter.JavaClass.EXTRA_TAG);
    if TagParcel <> nil then
    begin
      Log.d('OrangeUI OrangeUI Wrapping tag from the parcel');
      Tag := TJTag.Wrap(TagParcel);


//      if not WriteTagText(TagWriteEdit.Text, Tag) then
//        raise Exception.Create('Error connecting to tag');


//      TThread.CreateAnonymousThread(procedure
//
//      var
//        I: Integer;
//        J: Integer;
//        K:Integer;
//        ASectorIndex:Integer;
//        ABlockIndex:Integer;
//    begin

        //m1卡
        mfc := TJMifareClassic.JavaClass.get(tag);
        if mfc=nil then
        begin
          ShowMessage('没有检测到卡片');
          Exit;
        end;
        Log.d('OrangeUI OrangeUI mfc.connect');
        mfc.connect;
        try


          mfc.getType();//获取TAG的类型
          Log.d('OrangeUI OrangeUI mfc type:'+IntToStr(mfc.getType()));
          //1K: 16个分区(sector)，每个分区4个块(block)，每个块(block) 16个byte数据
          //16
          Log.d('OrangeUI OrangeUI mfc getSectorCount:'+IntToStr(mfc.getSectorCount()));
          //16
          Log.d('OrangeUI OrangeUI mfc getBlockCount:'+IntToStr(mfc.getBlockCount()));
          //1024
          Log.d('OrangeUI OrangeUI mfc getSize:'+IntToStr(mfc.getSize()));   //KEY_NFC_FORUM
          Log.d('OrangeUI OrangeUI mfc getMaxTransceiveLength:'+IntToStr(mfc.getMaxTransceiveLength()));   //KEY_NFC_FORUM
//          auth:=False;
//          auth := mfc.authenticateSectorWithKeyA(2, TJMifareClassic.JavaClass.KEY_DEFAULT);//验证密码
//          auth := mfc.authenticateSectorWithKeyA(1, TJMifareClassic.JavaClass.KEY_NFC_FORUM);//验证密码
//          if not auth then
//          begin
//            Log.d('OrangeUI OrangeUI mfc auth fail');
////            Exit;
//          end
//          else
//          begin
//            Log.d('OrangeUI OrangeUI mfc auth succ');
//          end;
    //      auth := mfc.authenticateSectorWithKeyA(4, StringToJString('FFFFFF').getBytes());//验证密码
    //      if not auth then
    //      begin
    //        ShowMessage('验证失败');
    //      end;
    //      auth := mfc.authenticateSectorWithKeyA(4, StringToJString('FF').getBytes());//验证密码
    //      if not auth then
    //      begin
    //        ShowMessage('验证失败');
    //      end;
    //      auth := mfc.authenticateSectorWithKeyA(4, StringToJString('0').getBytes());//验证密码
    //      if not auth then
    //      begin
    //        ShowMessage('验证失败');
    //      end;

            ASectorIndex:=ABlockIndex div 4;

            auth:=False;
            //1K: 16个分区(sector)
            if mfc.authenticateSectorWithKeyA(ASectorIndex, TJMifareClassic.JavaClass.KEY_DEFAULT) then
            begin
              auth:=True;
              Log.d('OrangeUI OrangeUI mfc authA KEY_DEFAULT succ Sector:'+IntToStr(ASectorIndex));
            end
            else if mfc.authenticateSectorWithKeyA(ASectorIndex, TJMifareClassic.JavaClass.KEY_MIFARE_APPLICATION_DIRECTORY) then
            begin
              auth:=True;
              Log.d('OrangeUI OrangeUI mfc authA KEY_MIFARE_APPLICATION_DIRECTORY Sector:succ '+IntToStr(ASectorIndex));
            end
            else if mfc.authenticateSectorWithKeyA(ASectorIndex, TJMifareClassic.JavaClass.KEY_NFC_FORUM) then
            begin
              auth:=True;
              Log.d('OrangeUI OrangeUI mfc authA KEY_NFC_FORUM Sector:succ '+IntToStr(ASectorIndex));
            end
            else
            begin
              Log.d('OrangeUI OrangeUI mfc authA Fail Sector:'+IntToStr(ASectorIndex));
              Exit;
            end;




            try
              Log.d('OrangeUI OrangeUI mfc.readBlock begin Block:'+IntToStr(ABlockIndex));
              ABlockData:=mfc.readBlock(ABlockIndex);
              Log.d('OrangeUI OrangeUI mfc.readBlock begin datalen:'+IntToStr(ABlockData.Length));
              for K := 0 to ABlockData.Length-1 do
              begin
                Log.d('OrangeUI OrangeUI mfc.readBlock data:'+IntToStr(K)+' '+IntToStr(ABlockData[K]));
              end;
              Log.d('OrangeUI OrangeUI mfc.readBlock end Block:'+IntToStr(ABlockIndex));
              ABlockStr:=TJString.JavaClass.init(ABlockData);
              ABlockDataStr:=JStringToString(ABlockStr);
              Log.d('OrangeUI OrangeUI mfc.readedBlock end Block:'+JStringToString(ABlockStr));
            except
              on E:Exception do
              begin
                Log.d('OrangeUI OrangeUI mfc.readBlock error:'+E.Message);
              end;
            end;






  //        ShowMessage('读到'+JStringToString(ABlockStr));
        finally
          mfc.close;
        end;

//      end).Start;

    end;
  end
  else
    raise Exception.Create('OrangeUI NFC is not available');


end;

function TMainForm.WriteTagBlock(ABlockIndex: Integer;ABlockDataStr:String): Boolean;
var
  TagParcel: JParcelable;
  Tag: JTag;
  Intent: JIntent;

  mfc:JMifareClassic;
  ABlockDataBytes:TBytes;
  ABlockData:TJavaArray<Byte>;
  ABlockStr:JString;
  auth:Boolean;
  data:TJavaArray<Byte>;
  ASectorIndex:Integer;
begin
  if (NfcAdapter <> nil) and NfcAdapter.isEnabled then
  begin
    Intent := TAndroidHelper.Activity.getIntent;
    TagParcel := Intent.getParcelableExtra(TJNfcAdapter.JavaClass.EXTRA_TAG);
    if TagParcel <> nil then
    begin
      Log.d('OrangeUI Wrapping tag from the parcel');
      Tag := TJTag.Wrap(TagParcel);


//      if not WriteTagText(TagWriteEdit.Text, Tag) then
//        raise Exception.Create('Error connecting to tag');


       TThread.CreateAnonymousThread(procedure

      var
        I: Integer;
    begin
              //m1卡
              mfc := TJMifareClassic.JavaClass.get(tag);
              if mfc=nil then
              begin
                ShowMessage('没有检测到卡片');
                Exit;
              end;
              mfc.connect;
              try
                try

                    ASectorIndex:=ABlockIndex div 4;

                    auth:=False;
      //              auth := mfc.authenticateSectorWithKeyA(I mod 16, TJMifareClassic.JavaClass.KEY_DEFAULT);//验证密码
      //              auth := ;//验证密码
                    //1K: 16个分区(sector)
                    if mfc.authenticateSectorWithKeyA(ASectorIndex, TJMifareClassic.JavaClass.KEY_DEFAULT) then
                    begin
                      auth:=True;
                      Log.d('OrangeUI OrangeUI mfc authA KEY_DEFAULT succ');
                    end
                    else if mfc.authenticateSectorWithKeyA(ASectorIndex, TJMifareClassic.JavaClass.KEY_MIFARE_APPLICATION_DIRECTORY) then
                    begin
                      auth:=True;
                      Log.d('OrangeUI OrangeUI mfc authA KEY_MIFARE_APPLICATION_DIRECTORY succ');
                    end
                    else if mfc.authenticateSectorWithKeyA(ASectorIndex, TJMifareClassic.JavaClass.KEY_NFC_FORUM) then
                    begin
                      auth:=True;
                      Log.d('OrangeUI OrangeUI mfc authA KEY_NFC_FORUM succ');
                    end
                    else
                    begin
                      Log.d('OrangeUI OrangeUI mfc authA Fail');
                    end;


//                    ABlockStr:=StringToJString(ABlockDataStr);
//                    Log.d('OrangeUI OrangeUI mfc getBytes Length '+IntToStr(ABlockStr.getBytes().Length));
//                    mfc.writeBlock(ABlockIndex,ABlockStr.getBytes());


                    ABlockDataBytes:=TEncoding.UTF8.getBytes(ABlockDataStr);
                    data:=TJavaArray<Byte>.Create(16);
                    for I := 0 to data.Length-1 do
                    begin
                      data[I]:=ABlockDataBytes[I];
                      Log.d('OrangeUI OrangeUI mfc writeBlock data item ='+IntToStr(ABlockDataBytes[I]));
                    end;

//                    data:=TJavaArray<Byte>.Create(16);
//                    data[0]:=1;
//                    data[1]:=1;
//                    data[2]:=1;
//                    data[3]:=1;
//                    data[4]:=1;
//                    data[5]:=1;
//                    data[6]:=1;
//                    data[7]:=1;
//                    data[8]:=1;
//                    data[9]:=1;
//                    data[10]:=1;
//                    data[11]:=1;
//                    data[12]:=1;
//                    data[13]:=1;
//                    data[14]:=1;
//                    data[15]:=1;


                    Log.d('OrangeUI OrangeUI mfc writeBlock ABlockIndex='+IntToStr(ABlockIndex));
                    mfc.writeBlock(ABlockIndex,data);
                    Log.d('OrangeUI OrangeUI mfc writeBlock end ABlockIndex='+IntToStr(ABlockIndex));
                    Log.d('OrangeUI OrangeUI mfc writeBlock Length '+IntToStr(data.Length));

      //            data:=TJavaArray<Byte>.Create(16);
      //            data[0]:=1;
      //            data[1]:=1;
      //            data[2]:=1;
      //            data[3]:=1;
      //            data[4]:=1;
      //            data[5]:=1;
      //            data[6]:=1;
      //            data[7]:=1;
      //            data[8]:=1;
      //            data[9]:=1;
      //            data[10]:=1;
      //            data[11]:=1;
      //            data[12]:=1;
      //            data[13]:=1;
      //            data[14]:=1;
      //            data[15]:=1;
      //            mfc.writeBlock(12,data);
      //            Log.d('OrangeUI OrangeUI mfc getBytes Length '+IntToStr(data.Length));
                    data:=mfc.readBlock(ABlockIndex);
                    ABlockStr:=TJString.JavaClass.init(data);
                    Log.d('OrangeUI OrangeUI mfc writeBlock verifydata '+JStringToString(ABlockStr));

                    if JStringToString(ABlockStr)=ABlockDataStr then
                    begin

                      TThread.Synchronize(nil,procedure
                      begin
                        ShowMessage('写入成功');
                      end);

                    end
                    else
                    begin
                      TThread.Synchronize(nil,procedure
                      begin
                        ShowMessage('写入失败');
                      end);
                    end;


                except
                  on E:Exception do
                  begin
                    Log.d('OrangeUI OrangeUI mfc write Fail error:'+E.Message);
                  end;
                end;
              finally
                mfc.close;

              end;


        end).Start;



    end;
  end
  else
    raise Exception.Create('NFC is not available');


end;

procedure TMainForm.TagWriteButtonClick(Sender: TObject);
var
  TagParcel: JParcelable;
  Tag: JTag;
  Intent: JIntent;

  mfc:JMifareClassic;
  ABlockData:TJavaArray<Byte>;
  ABlockStr:JString;
  auth:Boolean;
  data:TJavaArray<Byte>;
begin
  WriteTagBlock(StrToInt(Self.edtBlockIndex.Text),edtBlockData.Text);
  Exit;

  if (NfcAdapter <> nil) and NfcAdapter.isEnabled then
  begin
    Intent := TAndroidHelper.Activity.getIntent;
    TagParcel := Intent.getParcelableExtra(TJNfcAdapter.JavaClass.EXTRA_TAG);
    if TagParcel <> nil then
    begin
      Log.d('OrangeUI Wrapping tag from the parcel');
      Tag := TJTag.Wrap(TagParcel);


//      if not WriteTagText(TagWriteEdit.Text, Tag) then
//        raise Exception.Create('Error connecting to tag');



        TThread.CreateAnonymousThread(procedure
        begin
              //m1卡
              mfc := TJMifareClassic.JavaClass.get(tag);
              if mfc=nil then
              begin
                ShowMessage('没有检测到卡片');
                Exit;
              end;
              mfc.connect;




              auth:=False;
//              auth := mfc.authenticateSectorWithKeyA(I mod 16, TJMifareClassic.JavaClass.KEY_DEFAULT);//验证密码
//              auth := ;//验证密码
              //1K: 16个分区(sector)
              if mfc.authenticateSectorWithKeyA(3, TJMifareClassic.JavaClass.KEY_DEFAULT) then
              begin
                auth:=True;
                Log.d('OrangeUI OrangeUI mfc authA KEY_DEFAULT succ');
              end
              else if mfc.authenticateSectorWithKeyA(3, TJMifareClassic.JavaClass.KEY_MIFARE_APPLICATION_DIRECTORY) then
              begin
                auth:=True;
                Log.d('OrangeUI OrangeUI mfc authA KEY_MIFARE_APPLICATION_DIRECTORY succ');
              end
              else if mfc.authenticateSectorWithKeyA(3, TJMifareClassic.JavaClass.KEY_NFC_FORUM) then
              begin
                auth:=True;
                Log.d('OrangeUI OrangeUI mfc authA KEY_NFC_FORUM succ');
              end
              else
              begin
                Log.d('OrangeUI OrangeUI mfc authA Fail');
              end;




              ABlockStr:=StringToJString('1383838438000000');
              mfc.writeBlock(12,ABlockStr.getBytes());
              Log.d('OrangeUI OrangeUI mfc getBytes Length '+IntToStr(ABlockStr.getBytes().Length));


//            data:=TJavaArray<Byte>.Create(16);
//            data[0]:=1;
//            data[1]:=1;
//            data[2]:=1;
//            data[3]:=1;
//            data[4]:=1;
//            data[5]:=1;
//            data[6]:=1;
//            data[7]:=1;
//            data[8]:=1;
//            data[9]:=1;
//            data[10]:=1;
//            data[11]:=1;
//            data[12]:=1;
//            data[13]:=1;
//            data[14]:=1;
//            data[15]:=1;
//            mfc.writeBlock(12,data);
//            Log.d('OrangeUI OrangeUI mfc getBytes Length '+IntToStr(data.Length));


            mfc.close;

//            ShowMessage('写入成功');


        end).Start;

    end;
  end
  else
    raise Exception.Create('NFC is not available');
end;

end.
