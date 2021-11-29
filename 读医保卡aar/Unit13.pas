unit Unit13;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,

  {$IFDEF ANDROID}
  Androidapi.JNI.Net,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  FMX.Helpers.Android,
  Androidapi.JNI.Os,
    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}
//    uAndroidPermission_D10_2,
  Androidapi.JNI.Embarcadero,
//  Androidapi.JNI.Environment,
//  Androidapi.JNI.facelib_release_aar,
//  Androidapi.JNI.mysunmifacelibrary_debug_aar,
  {$ENDIF}


  uReadHospitalCardSDK,

  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
  TForm13 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    FReadHospitalCardSDK:TReadHospitalCardSDK;
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.fmx}

procedure TForm13.Button1Click(Sender: TObject);
begin
  FReadHospitalCardSDK.ReadCard('A');
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  FReadHospitalCardSDK.Init;
end;

procedure TForm13.Button3Click(Sender: TObject);
begin
  FReadHospitalCardSDK.CheckModule;
end;

procedure TForm13.Button4Click(Sender: TObject);
begin
  //
  FReadHospitalCardSDK.CloseModule;
end;

procedure TForm13.Button5Click(Sender: TObject);
begin
  FReadHospitalCardSDK.ReadCard('E');
  //
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  //申请权限
  {$IFDEF ANDROID}
  PermissionsService.RequestPermissions
      ([JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE),
      JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE)
        ],
    procedure(const APermissions: TArray<string>;
    const AGrantResults: TArray<TPermissionStatus>)
    begin
    end);
  {$ENDIF}


  FReadHospitalCardSDK:=TReadHospitalCardSDK.Create;

end;

end.
