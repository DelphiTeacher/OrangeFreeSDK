unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,


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

//  uBaseList,
//  Androidapi.JNI.bluetoothlibrary_debug,
//  Androidapi.JNI.bleweight_debug,

  DeviceFrame,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.TabControl;

type

  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    procedure FormShow(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    FFrameDevice1:TFrameDevice;
    FFrameDevice2:TFrameDevice;
    { Private declarations }
  public
    { Public declarations }
  end;




var
  Form1: TForm1;

implementation

{$R *.fmx}


procedure TForm1.FormShow(Sender: TObject);
begin

  //申请权限
  {$IFDEF ANDROID}
  PermissionsService.RequestPermissions
      ([JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION),
        JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION)
        ],
    nil);
  {$ENDIF}

  FFrameDevice1:=TFrameDevice.Create(Self);
  FFrameDevice1.Name:='FFrameDevice1';
  FFrameDevice1.Parent:=Self.TabItem1;
  FFrameDevice1.Align:=TAlignLayout.alClient;



end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  if Self.TabControl1.ActiveTab=TabItem2 then
  begin
    if FFrameDevice2=nil then
    begin
      FFrameDevice2:=TFrameDevice.Create(Self);
      FFrameDevice2.Name:='FFrameDevice2';
      FFrameDevice2.Parent:=Self.TabItem2;
      FFrameDevice2.Align:=TAlignLayout.alClient;
    end;
  end;

end;

end.
