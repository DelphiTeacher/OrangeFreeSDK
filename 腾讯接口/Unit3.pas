unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  uTencentQQAPI,
  FMX.Platform,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FApplicationEventService:IFMXApplicationEventService;
    function DoApplicationEventHandler(AAppEvent: TApplicationEvent; AContext: TObject):Boolean;
    { Private declarations }
  public
    FTencentQQAPI:TTencentQQAPI;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin
  FTencentQQAPI.SendText('²âÊÔ');
end;

function TForm3.DoApplicationEventHandler(AAppEvent: TApplicationEvent;AContext: TObject): Boolean;
begin
  if FTencentQQAPI<>nil then
  begin
    FTencentQQAPI.DoApplicationEventHandler(AAppEvent,AContext);
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  //×¢²á³ÌÐòÊÂ¼þ
  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationEventService, IInterface(FApplicationEventService)) then
  begin
    FApplicationEventService.SetApplicationEventHandler(DoApplicationEventHandler);
  end;

  FTencentQQAPI:=TTencentQQAPI.Create;
  FTencentQQAPI.RegisterTencent('1105449331')

end;

end.
