unit Unit8;

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
  uHoneywellScanCode,
  FMX.Platform,

  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
  TForm8 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    {$IFDEF ANDROID}
    FIntentFilter: JIntentFilter;
    FPDAScanCodeBroadcastReceiver:JFMXBroadcastReceiver;
    FHoneywellScanCodeBroadcastListener:THoneywellScanCodeBoardcastListener;
    {$ENDIF ANDROID}
    { Private declarations }
  public
    FApplicationEventService:IFMXApplicationEventService;
    procedure DoScanCodeResultEvent(Sender:TObject;Code:String);
    function DoApplicationEventHandler(AAppEvent: TApplicationEvent; AContext: TObject):Boolean;
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}


function TForm8.DoApplicationEventHandler(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
begin
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
end;

procedure TForm8.DoScanCodeResultEvent(Sender: TObject; Code: String);
begin
  Self.Memo1.Lines.Add(Code);
end;

procedure TForm8.FormCreate(Sender: TObject);
begin



  {$IFDEF ANDROID}
  FHoneywellScanCodeBroadcastListener:=THoneywellScanCodeBoardcastListener.Create;
  FPDAScanCodeBroadcastReceiver:=TJFMXBroadcastReceiver.JavaClass.init(FHoneywellScanCodeBroadcastListener);

  FIntentFilter:=TJIntentFilter.JavaClass.init;
  FIntentFilter.addAction(StringToJString('com.honeywell.sample.action.BARCODE_DATA'));

  SharedActivity.registerReceiver(FPDAScanCodeBroadcastReceiver, FIntentFilter);
  {$ENDIF ANDROID}

  //×¢²á³ÌÐòÊÂ¼þ
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationEventService, IInterface(FApplicationEventService)) then
  begin
    FApplicationEventService.SetApplicationEventHandler(DoApplicationEventHandler);
  end;

end;

end.
