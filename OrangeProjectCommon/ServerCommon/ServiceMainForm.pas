unit ServiceMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  uBaseLog,
  uOpenPlatformServerManager,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs;

type
  TsrvMyService = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceBeforeInstall(Sender: TService);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  srvMyService: TsrvMyService;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  srvMyService.Controller(CtrlCode);
end;

function TsrvMyService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TsrvMyService.ServiceBeforeInstall(Sender: TService);
begin
  uBaseLog.HandleException(nil,'TsrvMyHis.ServiceBeforeInstall');


  GlobalServiceProject.Load;

  if GlobalServiceProject.ServiceName<>'' then
  begin
    Self.Name:=GlobalServiceProject.ServiceName;
  end;
  if GlobalServiceProject.ServiceDisplayName<>'' then
  begin
    Self.DisplayName:=GlobalServiceProject.ServiceDisplayName;
  end;
end;

procedure TsrvMyService.ServiceCreate(Sender: TObject);
begin
  uBaseLog.HandleException(nil,'TsrvMyHis.ServiceCreate');

  GlobalServiceProject.Load;
  if GlobalServiceProject.ServiceName<>'' then
  begin
    Self.Name:=GlobalServiceProject.ServiceName;
  end;
  if GlobalServiceProject.ServiceDisplayName<>'' then
  begin
    Self.DisplayName:=GlobalServiceProject.ServiceDisplayName;
  end;


end;

procedure TsrvMyService.ServiceStart(Sender: TService; var Started: Boolean);
begin
  uBaseLog.HandleException(nil,'TsrvMyHis.ServiceStart Begin');



  GlobalServiceProject.Start;

  Started:=True;

  uBaseLog.HandleException(nil,'TsrvMyHis.ServiceStart End');
end;

procedure TsrvMyService.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  uBaseLog.HandleException(nil,'TsrvMyHis.ServiceStop Begin');


  Stopped:=GlobalServiceProject.Stop;

  uBaseLog.HandleException(nil,'TsrvMyHis.ServiceStop End');
end;

end.
