unit NFCHelper;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Nfc;

type
  TTextLogger = reference to procedure(const Msg: string);

function HandleNfcTag(Tag: JTag; AddMsg: TTextLogger): string;

function DumpNFC_A(Tag: JTag): string;
function DumpNFC_B(Tag: JTag): string;
function DumpNFC_F(Tag: JTag): string;
function DumpNFC_V(Tag: JTag): string;
function DumpNDef(Tag: JTag): string;
function DumpIsoDep(Tag: JTag): string;

function WriteTagText(const Msg: string; Tag: JTag): Boolean;

//Make a string by concatenating together all hex values of each byte
function JavaBytesToString(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;
//Make a string by concatenating together all hex values of each byte in reverse
function JavaBytesToStringReverse(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;
//Make a string by concatenating together the ANSI characters represented by each byte
function JavaBytesToText(Bytes: TJavaArray<Byte>): string;

implementation

uses
  System.SysUtils,
  System.Classes,
  System.StrUtils,
  System.Types,
  FMX.Types,
  Androidapi.Helpers,
  Androidapi.JNI,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Nfc.Tech;

function HandleNfcTag(Tag: JTag; AddMsg: TTextLogger): string;
var
  I: Integer;
  JTagID: TJavaArray<Byte>;
  JTagTechList: TJavaObjectArray<JString>;
  JTechType: JString;
  TechType: String;
  TagTechList: TStrings;
const
  NFCA_Type = 'android.nfc.tech.NfcA';
  NFCB_Type = 'android.nfc.tech.NfcB';
  NFCF_Type = 'android.nfc.tech.NfcF';
  NFCV_Type = 'android.nfc.tech.NfcV';
  NFCNDef_Type = 'android.nfc.tech.Ndef';
  NFCIsoDep_Type = 'android.nfc.tech.IsoDep';
  MandatoryAndroidTechs: array[0..5] of string = (
    NFCA_Type,
    NFCB_Type,
    NFCF_Type,
    NFCV_Type,
    NFCNDef_Type,
    NFCIsoDep_Type);
begin
  if Tag <> nil then
  begin
    JTagID := Tag.getId;
    // Write out the ID byte values
    if JTagID <> nil then
    begin
      Result := 'NFC Tech Tag Id: ' + JavaBytesToString(JTagID);
    end;
    // Examine the tag
    JTagTechList := Tag.getTechList;
    TagTechList := TStringList.Create;
    try
      Log.d('Listing tag techs');
      if JTagTechList <> nil then
      begin
        for I := 0 to Pred(JTagTechList.Length) do
        begin
          JTechType := JTagTechList.Items[I];
          if JTechType <> nil then
          begin
            TechType := JStringToString(JTechType);
            TagTechList.Add(TechType);
            AddMsg(TechType);
          end;
        end;
        AddMsg('');
      end;
      // Process the different possible tag technology types and do something with them
      if TagTechList.IndexOf(NFCA_Type) >= 0 then
        AddMsg(DumpNFC_A(Tag));
      if TagTechList.IndexOf(NFCB_Type) >= 0 then
        AddMsg(DumpNFC_B(Tag));
      if TagTechList.IndexOf(NFCF_Type) >= 0 then
        AddMsg(DumpNFC_F(Tag));
      if TagTechList.IndexOf(NFCV_Type) >= 0 then
        AddMsg(DumpNFC_V(Tag));
      if TagTechList.IndexOf(NFCNDef_Type) >= 0 then
        AddMsg(DumpNDef(Tag));
      if TagTechList.IndexOf(NFCIsoDep_Type) >= 0 then
        AddMsg(DumpIsoDep(Tag));
    finally
      TagTechList.Free;
    end;
  end;
end;

function DumpNFC_A(Tag: JTag): string;
var
  JATag: JNfcA;
begin
  Log.d('Found tech type A');
  // Technical details to be found at http://www.waazaa.org/download/fcd-14443-3.pdf
  JATag := TJNfcA.JavaClass.get(Tag);
  Result := Result + Format('NFC-A (ISO 14443-3A) data:%:0s%:0s', [LineFeed]);
  // Answer To Request of Type A
  Result := Result + Format('ATQA/SENS_RES: %s%s', [JavaBytesToStringReverse(JATag.getAtqa), LineFeed]);
  // Select Acknowledge
  Result := Result + Format('SAK/SEL_RES: %d%s', [JATag.getSak, LineFeed]);
  // ATQA+SAK can help ID a tag type/manufacturer: http://nfc-tools.org/index.php?title=ISO14443A
end;

function DumpNFC_B(Tag: JTag): string;
var
  JBTag: JNfcB;
begin
  Log.d('Found tech type B');
  // Technical details to be found at http://www.waazaa.org/download/fcd-14443-3.pdf
  JBTag := TJNfcB.JavaClass.get(Tag);
  Result := Result + Format('NFC-B (ISO 14443-3B) data:%:0s%:0s', [LineFeed]);
  // Answer To Request of Type B
  Result := Result + Format('ATQB/SENSB_RES application data: %s%s', [JavaBytesToStringReverse(JBTag.getApplicationData),
    LineFeed]);
  Result := Result + Format('ATQB/SENSB_RES protocol info: %s%s', [JavaBytesToStringReverse(JBTag.getProtocolInfo), LineFeed]);
end;

function DumpNFC_F(Tag: JTag): string;
var
  JFTag: JNfcF;
begin
  Log.d('Found tech type F');
  JFTag := TJNfcF.JavaClass.get(Tag);
  Result := Result + Format('NFC-F (JIS 6319-4) data:%:0s%:0s', [LineFeed]);
  Result := Result + Format('System code: %s (%s)%s', [JavaBytesToString(JFTag.getSystemCode),
    JavaBytesToText(JFTag.getSystemCode), LineFeed]);
  Result := Result + Format('Manufacturer: %s (%s)%s', [JavaBytesToString(JFTag.getManufacturer),
    JavaBytesToText(JFTag.getManufacturer), LineFeed]);
end;

function DumpNFC_V(Tag: JTag): string;
var
  JVTag: JNfcV;
begin
  Log.d('Found tech type V');
  // Technical details to be found at http://www.waazaa.org/download/fcd-15693-3.pdf
  JVTag := TJNfcV.JavaClass.get(Tag);
  Result := Result + Format('NFC-V (ISO 15693) data:%:0s%:0s', [LineFeed]);
  // Data Storage Format ID
  Result := Result + Format('DSF ID: %x%s', [JVTag.getDsfId, LineFeed]);
  Result := Result + Format('Response flags: %x%s', [JVTag.getResponseFlags, LineFeed]);
end;

function MatchingRecordType(A, B: TJavaArray<Byte>): Boolean;
var
  I: Integer;
begin
  Result := A.Length = B.Length;
  if Result then
    for I := 0 to Pred(A.Length) do
    begin
      Result := A.Items[I] = B.Items[I];
      if not Result then
        Break;
    end;
end;

//NDEF specifications can be found and downloaded from here: http://members.nfc-forum.org/specs/spec_list

function DecodeURI(RecordBytes: TJavaArray<Byte>): string;
var
  ID: Byte;
  I: Integer;
begin
  if RecordBytes.Length < 2 then
    Exit;
  ID := RecordBytes.Items[0];
  for I := 1 to Pred(RecordBytes.Length) do
  begin
    Result := Result + Char(RecordBytes.Items[I]);
  end;
  case ID of
    1: Result := 'http://www.' + Result;
    2: Result := 'https://www.' + Result;
    3: Result := 'http://' + Result;
    4: Result := 'https://' + Result;
    5: Result := 'tel:' + Result;
    6: Result := 'mailto:' + Result;
    7: Result := 'ftp://anonymous:anonymous@' + Result;
    8: Result := 'ftp://ftp.' + Result;
    9: Result := 'ftps://' + Result;
    10: Result := 'sftp://' + Result;
    11: Result := 'smb://' + Result;
    12: Result := 'nfs://' + Result;
    13: Result := 'ftp://' + Result;
    14: Result := 'dav://' + Result;
    15: Result := 'news:' + Result;
    16: Result := 'telnet://' + Result;
    17: Result := 'imap:' + Result;
    18: Result := 'rtsp://' + Result;
    19: Result := 'urn:' + Result;
    20: Result := 'pop:' + Result;
    21: Result := 'sip:' + Result;
    22: Result := 'sips:' + Result;
    23: Result := 'tftp:' + Result;
    24: Result := 'btspp://' + Result;
    25: Result := 'btl2cap://' + Result;
    26: Result := 'btgoep://' + Result;
    27: Result := 'tcpobex://' + Result;
    28: Result := 'irdaobex://' + Result;
    29: Result := 'file://' + Result;
    30: Result := 'urn:epc:id:' + Result;
    31: Result := 'urn:epc:tag:' + Result;
    32: Result := 'urn:epc:pat:' + Result;
    33: Result := 'urn:epc:raw:' + Result;
    34: Result := 'urn:epc:' + Result;
    35: Result := 'urn:nfc:' + Result;
  end;
end;

function DecodeText(RecordBytes: TJavaArray<Byte>): string;
var
  Status: Byte;
  I: Integer;
  IANA_Len: Byte;
  IANA: string; //ISO/IANA language code
  UTF16: Boolean; //if False the string is in UTF8
  Bytes: TBytes;
begin
  if RecordBytes.Length < 2 then
    Exit;
  Status := RecordBytes.Items[0];
  IANA_Len := Status and $3F;
  UTF16 := (Status and $80) > 0;
  for I := 1 to IANA_Len do
    IANA := IANA + Char(RecordBytes.Items[I]);
  SetLength(Bytes, RecordBytes.Length - IANA_Len - 1);
  for I := Succ(IANA_Len) to Pred(RecordBytes.Length) do
    Bytes[I - Succ(IANA_Len)] := RecordBytes.Items[I];
  if UTF16 then
    Result := TEncoding.Unicode.GetString(Bytes)
  else
    Result := TEncoding.UTF8.GetString(Bytes);
end;

function EncodeText(const Msg: string): JNdefRecord;
var
  JMsg: JString;
  JMsgBytes: TJavaArray<Byte>;
  JMsgLen: Integer;
  JLang: JString;
  JLangBytes: TJavaArray<Byte>;
  JLangLen: Byte;
  JPayload: TJavaArray<Byte>;
  I: Integer;
begin
  JMsg := StringToJString(Msg);
  JMsgBytes := JMsg.getBytes;
  JMsgLen := JMsgBytes.Length;
  JLang := StringToJString('en');
  JLangBytes := JLang.getBytes(StringToJString('US-ASCII'));
  JLangLen := JLangBytes.Length;
  JPayload := TJavaArray<Byte>.Create(1 + JMsgLen + JLangLen);
  // Set status byte (see NDEF spec for actual bits)
  JPayload.Items[0] := JLangLen;
  // Copy lang bytes and msg bytes into payload
  for I := 0 to Pred(JLangLen) do
    JPayload.Items[I + 1] := JLangBytes.Items[I];
  for I := 0 to Pred(JMsgLen) do
    JPayload.Items[I + 1 + JLangLen] := JMsgBytes.Items[I];
  Result := TJNdefRecord.JavaClass.init(TJNdefRecordTNF_WELL_KNOWN, TJNdefRecord.JavaClass.RTD_TEXT,
    TJavaArray<Byte>.Create(0), JPayload);
end;

function DumpNDef(Tag: JTag): string;
var
  JNDefTag: JNdef;
  JNDefTagType: JString;
  JNDefMsg: JNdefMessage;
  JNDefMsgRecords: TJavaObjectArray<JNdefRecord>;
  JNDefMsgRecord: JNdefRecord;
  JRecordType: TJavaArray<Byte>;
  I: Integer;
begin
  Log.d('Found tech type NDEF');
  JNDefTag := TJNdef.JavaClass.get(Tag);
  JNDefTagType := JNDefTag.getType;
  Log.d('NDEF type: ' + JStringToString(JNDefTagType));
  if JNDefTagType.equals(TJNDef.JavaClass.NFC_FORUM_TYPE_1) then
    Result := Result + Format('NFC Forum Type 1 data:%:0s%:0s', [LineFeed])
  else if JNDefTagType.equals(TJNDef.JavaClass.NFC_FORUM_TYPE_2) then
    Result := Result + Format('NFC Forum Type 2 data:%:0s%:0s', [LineFeed])
  else if JNDefTagType.equals(TJNDef.JavaClass.NFC_FORUM_TYPE_3) then
    Result := Result + Format('NFC Forum Type 3 data:%:0s%:0s', [LineFeed])
  else if JNDefTagType.equals(TJNDef.JavaClass.NFC_FORUM_TYPE_4) then
    Result := Result + Format('NFC Forum Type 4 data:%:0s%:0s', [LineFeed]);
  Result := Result + Format('Tag is %swritable%s', [IfThen(JNDefTag.isWritable, '', 'not '), LineFeed]);
  Result := Result + Format('Tag can%s be made read-only%s', [IfThen(JNDefTag.canMakeReadOnly, '', 'not'), LineFeed]);
  JNDefMsg := JNDefTag.getCachedNdefMessage;
  if JNDefMsg = nil then
    Result := Result + Format('No NDEF message found%s', [LineFeed])
  else
  begin
    //Result := Result + Format('%s%s', [JStringToString(JNDefMsg.toString), LineFeed]);
    JNDefMsgRecords := JNDefMsg.getRecords;
    if JNDefMsgRecords <> nil then
    begin
      for I := 0 to Pred(JNDefMsgRecords.Length) do
      begin
        // This does not work as expected - presumably a bug
        //JNDefMsgRecord := JNDefMsgRecords.Items[I];
        // So instead we wrap up the raw object ID manually
        JNDefMsgRecord := TJNdefRecord.Wrap(JNDefMsgRecords.GetRawItem(I));
        Result := Result + Format('NDEF message record %d: %s', [I, LineFeed]);
        case JNDefMsgRecord.getTnf of
          TJNdefRecordTNF_EMPTY:
            Result := Result + Format('  TNF_EMPTY (empty record)%s', [LineFeed]);
          TJNdefRecordTNF_MIME_MEDIA:
            Result := Result + Format('  TNF_MIME_MEDIA (RFC 2046 media-type BNF construct)%s', [LineFeed]);
          TJNdefRecordTNF_ABSOLUTE_URI:
            Result := Result + Format('  TNF_ABSOLUTE_URI (RFC 3986 absolute-URI BNF construct)%s', [LineFeed]);
          TJNdefRecordTNF_EXTERNAL_TYPE:
            Result := Result + Format('  TNF_EXTERNAL_TYPE (external type name)%s', [LineFeed]);
          TJNdefRecordTNF_UNKNOWN:
            Result := Result + Format('  TNF_UNKNOWN (unknown payload type)%s', [LineFeed]);
          TJNdefRecordTNF_UNCHANGED:
            Result := Result + Format('  TNF_UNCHANGED (an intermediate or final chunk of a chunked NDEF Record)%s', [LineFeed]);
          TJNdefRecordTNF_WELL_KNOWN:
          begin
            Result := Result + Format('  TNF_WELL_KNOWN (well-known RTD type name)%s', [LineFeed]);
            // NFC Record Type Definition technical spec.s are at http://members.nfc-forum.org/specs/spec_list
            JRecordType := JNDefMsgRecord.getType;
            if MatchingRecordType(JRecordType, TJNdefRecord.JavaClass.RTD_TEXT) then
              Result := Result + Format('  RTD_TEXT: %s%s', [DecodeText(JNDefMsgRecord.getPayload), LineFeed])
            else
            if MatchingRecordType(JRecordType, TJNdefRecord.JavaClass.RTD_URI) then
              Result := Result + Format('  RTD_URI: %s%s', [DecodeURI(JNDefMsgRecord.getPayload), LineFeed])
            else
            if MatchingRecordType(JRecordType, TJNdefRecord.JavaClass.RTD_SMART_POSTER) then
              // TODO: Haven't pulled out the smart poster URI yet
              Result := Result + Format('  RTD_SMART_POSTER: %s%s', [JavaBytesToText(JNDefMsgRecord.getPayload), LineFeed])
            else
            if MatchingRecordType(JRecordType, TJNdefRecord.JavaClass.RTD_HANDOVER_SELECT) then
              Result := Result + Format('  RTD_HANDOVER_SELECT%s', [LineFeed])
            else
            if MatchingRecordType(JRecordType, TJNdefRecord.JavaClass.RTD_HANDOVER_REQUEST) then
              Result := Result + Format('  RTD_HANDOVER_REQUEST%s', [LineFeed])
            else
            if MatchingRecordType(JRecordType, TJNdefRecord.JavaClass.RTD_HANDOVER_CARRIER) then
              Result := Result + Format('  RTD_HANDOVER_CARRIER%s', [LineFeed])
            else
            if MatchingRecordType(JRecordType, TJNdefRecord.JavaClass.RTD_ALTERNATIVE_CARRIER) then
              Result := Result + Format('  RTD_ALTERNATIVE_CARRIER%s', [LineFeed]);
          end;
        end;
      end;
    end;
  end;
end;

function DumpIsoDep(Tag: JTag): string;
var
  JIsoTag: JIsoDep;
begin
  Log.d('Found tech type ISO Dep');
  JIsoTag := TJIsoDep.JavaClass.get(Tag);
  Result := Result + Format('ISO-DEP (ISO 14443-4) data:%s', [LineFeed]);
  Result := Result + Format('ISO-DEP historical data for NfcA tags: %s%s',
    [JavaBytesToString(JIsoTag.getHistoricalBytes), LineFeed]);
  Result := Result + Format('Higher layer response data for NfcB tags: %s%s',
    [JavaBytesToString(JIsoTag.getHiLayerResponse), LineFeed]);
end;

function JavaBytesToString(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;
var
  I: Integer;
begin
  if Bytes <> nil then
    for I := 0 to Pred(Bytes.Length) do
    begin
      Result := Result + IntToHex(Bytes.Items[I], 2);
      if (I < Pred(Bytes.Length)) and (Separator.Length > 0) then
        Result := Result + Separator;
    end;
end;

function JavaBytesToStringReverse(Bytes: TJavaArray<Byte>; Separator: string = '-'): string;
var
  I: Integer;
begin
  if Bytes <> nil then
    for I := Pred(Bytes.Length) downto 0 do
    begin
      Result := Result + IntToHex(Bytes.Items[I], 2);
      if (I > 0) and (Separator.Length > 0) then
        Result := Result + Separator;
    end;
end;

function JavaBytesToText(Bytes: TJavaArray<Byte>): string;
var
  I: Integer;
begin
  for I := 0 to Pred(Bytes.Length) do
  begin
    Result := Result + Char(Bytes.Items[I]);
  end;
end;

function WriteTagText(const Msg: string; Tag: JTag): Boolean;
var
  NDef: JNdef;
  NDefMsg: JNdefMessage;
  NDefRecords: TJavaObjectArray<JNdefRecord>;
begin
  NDef := TJNdef.JavaClass.get(Tag);
  if NDef <> nil then
  begin
    try
      NDef.connect;
      Result := NDef.isConnected;
      if Result then
      begin
        // Make a list of 2 NDEF records, one with some text and one with a URL
        NDefRecords := TJavaObjectArray<JNdefRecord>.Create(2);
        NDefRecords.Items[0] := EncodeText(Msg);
        NDefRecords.Items[1] := TJNdefRecord.JavaClass.createUri(StringToJString('http://blong.com'));
        NDefMsg := TJNdefMessage.JavaClass.init(NDefRecords);
        NDef.writeNdefMessage(NDefMsg);
        NDef.close;
      end;
    except
      on EJNIException do
        Result := False;
    end;
  end
  else
    raise Exception.Create('This is not an NDEF-compatible tag!');
end;

end.
