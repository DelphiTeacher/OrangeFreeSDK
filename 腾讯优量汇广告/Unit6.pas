unit Unit6;

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
  uSkinUnifiedBannerView,

  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm6 = class(TForm)
    btnInit: TButton;
    Button1: TButton;
    procedure btnInitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FUnifiedBannerView:TSkinUnifiedBannerView;
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

procedure TForm6.btnInitClick(Sender: TObject);
begin
  //初始
  FMX.Types.Log.d('OrangeUI TForm6.btnInitClick Begin');
  //GDTAdSdk.init(applicationContext, "1205190531");
  TJhelper.JavaClass.initsdk(TAndroidHelper.Context.getApplicationContext,StringToJString('1205190531'));

  FMX.Types.Log.d('OrangeUI TForm6.btnInitClick End');
end;


procedure TForm6.Button1Click(Sender: TObject);
begin
  FUnifiedBannerView:=TSkinUnifiedBannerView.Create(Self);
  FUnifiedBannerView.Parent:=Self;
//  FUnifiedBannerView.SetBounds(0,0,100,15);
  FUnifiedBannerView.Visible:=True;
  FUnifiedBannerView.Align:=TAlignLayout.Top;
  FUnifiedBannerView.Height:=Width/6.4;
  FUnifiedBannerView.FJUnifiedBannerView.loadAD;
end;

end.
