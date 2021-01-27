unit Androidapi.JNI.ToastForService;

(****************************************************)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　　修改：爱吃猪头肉 & Flying Wang　　　　　*)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　2015-09-15　　　　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(****************************************************)

// Java bridge class imported by hand by Brian Long (http://blong.com)


//具体如何建立服务，请看 EMBT 的官方视频。
//文件名是：RAD Studio 10 Seattle - Android Services.mp4
//用法如下。
//function TAndroidServiceDM.AndroidServiceStartCommand(const Sender: TObject;
//  const Intent: JIntent; Flags, StartId: Integer): Integer;
//begin
//  Result := TJService.JavaClass.START_STICKY;
//  PostToast('服务启动了');
//end;


interface

{$IFDEF ANDROID}

uses
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText;
{$ENDIF}
{$IFDEF ANDROID}

type
  TToastLength = (LongToast, ShortToast);

  JToast = interface;

  JToastClass = interface(JObjectClass)
    ['{69E2D233-B9D3-4F3E-B882-474C8E1D50E9}']
    { Property methods }
    function _GetLENGTH_LONG: Integer; cdecl;
    function _GetLENGTH_SHORT: Integer; cdecl;
    { Methods }
    function init(context: JContext): JToast; cdecl; overload;
    function makeText(context: JContext; text: JCharSequence; duration: Integer)
      : JToast; cdecl;
    { Properties }
    property LENGTH_LONG: Integer read _GetLENGTH_LONG;
    property LENGTH_SHORT: Integer read _GetLENGTH_SHORT;
  end;

  [JavaSignature('android/widget/Toast')]
  JToast = interface(JObject)
    ['{FD81CC32-BFBC-4838-8893-9DD01DE47B00}']
    { Methods }
    procedure cancel; cdecl;
    function getDuration: Integer; cdecl;
    function getGravity: Integer; cdecl;
    function getHorizontalMargin: Single; cdecl;
    function getVerticalMargin: Single; cdecl;
    function getView: JView; cdecl;
    function getXOffset: Integer; cdecl;
    function getYOffset: Integer; cdecl;
    procedure setDuration(value: Integer); cdecl;
    procedure setGravity(gravity, xOffset, yOffset: Integer); cdecl;
    procedure setMargin(horizontalMargin, verticalMargin: Single); cdecl;
    procedure setText(s: JCharSequence); cdecl;
    procedure setView(view: JView); cdecl;
    procedure show; cdecl;
  end;

  TJToast = class(TJavaGenericImport<JToastClass, JToast>)
  end;
var
  PToast:JToast;

//一般在无界面UI 的时候使用，例如：服务。
procedure PostToast(const Msg: string; duration: TToastLength = ShortToast;
  UseLastToastObj: Boolean = False);

{$ENDIF}

implementation

{$IFDEF ANDROID}

uses
  FlyUtils.Android.PostRunnableAndTimer;

procedure PostToast(const Msg: string; duration: TToastLength = ShortToast;
  UseLastToastObj: Boolean = False);
var
  ToastLength: Integer;
begin
  if duration = ShortToast then
    ToastLength := TJToast.JavaClass.LENGTH_SHORT
  else
    ToastLength := TJToast.JavaClass.LENGTH_LONG;
  CallInPostRunnable(procedure
  begin
    if (not Assigned(PToast)) or (not UseLastToastOBj) then
    begin
      PToast := TJToast.JavaClass.makeText(
        TAndroidHelper.Context.getApplicationContext, StrToJCharSequence(Msg),
      ToastLength);
    end
    else
    begin
      PToast.setDuration(ToastLength);
      PToast.setText(StrToJCharSequence(Msg));
    end;
    PToast.show;
  end);
end;
{$ENDIF}

end.
