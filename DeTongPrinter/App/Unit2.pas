unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  uDeTongPrinter,
  AndroidApi.helpers,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, System.Bluetooth,
  System.Bluetooth.Components;

type
  TForm2 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    tmrDiscovery: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure tmrDiscoveryTimer(Sender: TObject);
  private
    FDeTongPrinter:TDeTongPrinter;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button2Click(Sender: TObject);
begin
//  if Self.FDeTongPrinter.api.openPrinterByAddress(FDeTongPrinter.FJIDzPrinter_PrinterAddress) then
  if Self.FDeTongPrinter.api.openPrinterByAddress(FDeTongPrinter.FPrintAddressObjList[Self.ComboBox1.ItemIndex].FJIDzPrinter_PrinterAddress) then
  begin
    ShowMessage('连接成功');
  end
  else
  begin
    ShowMessage('连接失败');
  end;
//  FDeTongPrinter.Test(Self.ComboBox1.Text);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  FDeTongPrinter.StartDiscovery;
  tmrDiscovery.Enabled:=True;
  Self.ComboBox1.Items.Clear;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  tmrDiscovery.Enabled:=False;
  FDeTongPrinter.api.stopDiscovery;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  FDeTongPrinter.Test();
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FDeTongPrinter:=TDeTongPrinter.Create;

end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FDeTongPrinter.Free;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  //动态申请权限
  TDeTongPrinter.CheckPermission(nil,nil);
end;

procedure TForm2.tmrDiscoveryTimer(Sender: TObject);
begin
  Self.ComboBox1.Items.Assign(Self.FDeTongPrinter.FPrintAddressStrList);
  if Self.FDeTongPrinter.FPrintAddressStrList.Count>0 then
  begin
    Self.ComboBox1.ItemIndex:=0;
  end;
end;

end.
