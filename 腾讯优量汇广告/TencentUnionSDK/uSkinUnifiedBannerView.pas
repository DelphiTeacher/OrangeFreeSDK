unit uSkinUnifiedBannerView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,

  {$IFDEF ANDROID}
  FMX.Platform.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.Widget,


  Androidapi.JNI.Net,
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
  Androidapi.JNI.helper,
  uBaseNativeView,
  Androidapi.JNI.GDTSDK_unionNormal_4_541_1411_aar,

  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TSkinUnifiedBannerView=class(TSkinNativeView)
  private
  protected
    //创建原生控件
    function CreateNativeView: TNativeView; override;
  public
  {$IFDEF ANDROID}
    FJUnifiedBannerADListener:JUnifiedBannerADListener;
    FJUnifiedBannerView:JUnifiedBannerView;
  {$ENDIF ANDROID}
    constructor Create(AOwner:TComponent);override;
  end;

  TJUnifiedBannerADListener = class(TJavaLocal,JUnifiedBannerADListener)
    { Property Methods }
    { methods }
    procedure onNoAD(P1: JAdError); cdecl;
    procedure onADReceive; cdecl;
    procedure onADExposure; cdecl;
    procedure onADClosed; cdecl;
    procedure onADClicked; cdecl;
    procedure onADLeftApplication; cdecl;
    { Property }
  end;


implementation

{ TSkinUnifiedBannerView }

constructor TSkinUnifiedBannerView.Create(AOwner: TComponent);
begin
  inherited;

end;

function TSkinUnifiedBannerView.CreateNativeView: TNativeView;
begin
  {$IFDEF ANDROID}
  FJUnifiedBannerADListener:=TJUnifiedBannerADListener.Create;
//    {class} function init(context: JActivity; posID: JString; listener: JUnifiedBannerADListener): JUnifiedBannerView; cdecl; overload;
  FJUnifiedBannerView:=TJUnifiedBannerView.JavaClass.init(TAndroidHelper.Activity,StringToJString('1066881496377093'),FJUnifiedBannerADListener);
  Result:=FJUnifiedBannerView;
  {$ENDIF ANDROID}
end;

{ TJUnifiedBannerADListener }

procedure TJUnifiedBannerADListener.onADClicked;
begin
  FMX.Types.Log.d('OrangeUI TJUnifiedBannerADListener.onADClicked');
end;

procedure TJUnifiedBannerADListener.onADClosed;
begin
  FMX.Types.Log.d('OrangeUI TJUnifiedBannerADListener.onADClosed');

end;

procedure TJUnifiedBannerADListener.onADExposure;
begin
  FMX.Types.Log.d('OrangeUI TJUnifiedBannerADListener.onADExposure');

end;

procedure TJUnifiedBannerADListener.onADLeftApplication;
begin
  FMX.Types.Log.d('OrangeUI TJUnifiedBannerADListener.onADLeftApplication');

end;

procedure TJUnifiedBannerADListener.onADReceive;
begin
  FMX.Types.Log.d('OrangeUI TJUnifiedBannerADListener.onADReceive');

end;

procedure TJUnifiedBannerADListener.onNoAD(P1: JAdError);
begin
  FMX.Types.Log.d('OrangeUI TJUnifiedBannerADListener.onNoAD');

end;

end.
