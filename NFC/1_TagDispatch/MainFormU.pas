unit MainFormU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Layouts, FMX.ListBox, NFCHelper,
  FMX.Edit, FMX.Controls.Presentation;

type
  TMainForm = class(TForm)
    NFCTagIdLabel: TLabel;
    TagWriteEdit: TEdit;
    TagWriteButton: TButton;
    InfoList: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure TagWriteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses
  FMX.Helpers.Android,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Nfc,
  Androidapi.JNI.Os;

{ TMainForm }
procedure TMainForm.FormActivate(Sender: TObject);
var
  Intent: JIntent;
  TagParcel: JParcelable;
  Tag: JTag;
begin
  Log.d('OnActivate');
  Intent := TAndroidHelper.Activity.getIntent;
  if Intent <> nil then
  begin
    Log.d('Intent action = %s', [JStringToString(Intent.getAction)]);
    if TJNfcAdapter.JavaClass.ACTION_NDEF_DISCOVERED.equals(Intent.getAction) or
       TJNfcAdapter.JavaClass.ACTION_TECH_DISCOVERED.equals(Intent.getAction) or
       TJNfcAdapter.JavaClass.ACTION_TAG_DISCOVERED.equals(Intent.getAction) then
    begin
      Log.d('Getting Tag parcel from the received Intent');
      TagParcel := Intent.getParcelableExtra(TJNfcAdapter.JavaClass.EXTRA_TAG);
      if TagParcel <> nil then
      begin
        Log.d('Wrapping tag from the parcel');
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
              Log.d('Adding to UI: ' + Strings[I]);
              InfoList.Items.Add(Strings[I]);
            end;
          finally
            Strings.Free;
          end;
        end);
      InfoList.Visible := True;
    end;
  end;
end;

procedure TMainForm.TagWriteButtonClick(Sender: TObject);
var
  NfcAdapter: JNfcAdapter;
  TagParcel: JParcelable;
  Tag: JTag;
  Intent: JIntent;
begin

  NfcAdapter := TJNfcAdapter.JavaClass.getDefaultAdapter(TAndroidHelper.Context);
  if (NfcAdapter <> nil) and NfcAdapter.isEnabled then
  begin
    Intent := TAndroidHelper.Activity.getIntent;
    TagParcel := Intent.getParcelableExtra(TJNfcAdapter.JavaClass.EXTRA_TAG);
    if TagParcel <> nil then
    begin
      Log.d('Wrapping tag from the parcel');
      Tag := TJTag.Wrap(TagParcel);
      if not WriteTagText(TagWriteEdit.Text, Tag) then
        raise Exception.Create('Error connecting to tag');
    end;
  end
  else
    raise Exception.Create('NFC is not available');
end;

end.
