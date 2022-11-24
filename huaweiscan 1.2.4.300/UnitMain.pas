unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Messaging,
  {$IFDEF ANDROID}
  FMX.Platform.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.Widget,


  Androidapi.JNI.Net,
  Androidapi.JNI.scan_1_1_3_301_aar,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  FMX.Helpers.Android,
  Androidapi.JNI.Os,
    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}
  {$ENDIF}

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FMessageSubscriptionID: integer;
    procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);
  public
    { Public declarations }
    procedure DoScanResultEvent(Sender:TObject;
                            //扫描到的二维码
                            ACode:String;
                            AFormat:String;
                            //是否继续扫描
                            var AIsNeedContinue:Boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Try
  TJScanUtil.JavaClass.startScan(TAndroidHelper.Activity,666,nil);
  Except
    ON E:Exception do
       FMX.Types.Log.d('HuaWeiScanDemo' + E.Message);

  End;
end;

procedure TForm1.DoScanResultEvent(Sender: TObject; ACode, AFormat: String;
  var AIsNeedContinue: Boolean);
begin
  TThread.Synchronize(nil,procedure
  begin
    Self.Memo1.Lines.Insert(0,DateTimeToStr(Now));
    Self.Memo1.Lines.Insert(0,ACode+' '+AFormat);
  end);
  AIsNeedContinue:=False;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  {$IFDEF ANDROID}
  FMessageSubscriptionID := TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, HandleActivityMessage);
  {$ENDIF}

  //申请权限
  {$IFDEF ANDROID}
  PermissionsService.RequestPermissions
      ([JStringToString(TJManifest_permission.JavaClass.CAMERA),
      //要有震动的权限
      JStringToString(TJManifest_permission.JavaClass.VIBRATE)
        ],
    procedure(const APermissions: TArray<string>;
    const AGrantResults: TArray<TPermissionStatus>)
    begin
    end);
  {$ENDIF}
end;

procedure TForm1.HandleActivityMessage(const Sender: TObject;
  const M: TMessage);
{$IFDEF ANDROID}
var
  AJParcelable:JParcelable;
  AJHmsScan:JHmsScan;
  AResultString:String;
  AIsNeedContinue:Boolean;
{$ENDIF}
begin
  FMX.Types.Log.d('HandleActivityMessage Begin');

  {$IFDEF ANDROID}
  if TMessageResultNotification(M).RequestCode = 666 then
  begin
    FMX.Types.Log.d('HandleActivityMessage 666 1');

    if Assigned(TMessageResultNotification(M).Value) then
    begin
      FMX.Types.Log.d('HandleActivityMessage 666 2');

      AJParcelable:=TMessageResultNotification(M).Value.getParcelableExtra(TJScanUtil.JavaClass.RESULT);
      if AJParcelable<>nil then
      begin
        AJHmsScan:=TJHmsScan.Wrap((AJParcelable as ILocalObject).GetObjectID);
        AResultString:=JStringToString(AJHmsScan.originalValue);
        FMX.Types.Log.d('OrangeUI TForm2.HandleActivityMessage 666 3 '+AResultString);

        AIsNeedContinue:=False;
        DoScanResultEvent(Self,AResultString,'',AIsNeedContinue);

      end;

    end;

  end;


  FMX.Types.Log.d('HandleActivityMessage End');
  {$ENDIF}
end;

end.
