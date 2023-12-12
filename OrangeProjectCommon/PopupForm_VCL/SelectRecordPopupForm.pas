unit SelectRecordPopupForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SelectPopupForm, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf,

  XSuperObject,
  uRestInterfaceCall,
//  uManager,
  uDatasetToJson,
  uJsonToDataset,
  uOpenClientCommon,
  uOpenCommon,
//  GridSwitchPageFrame,

  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,

  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uRestIntfMemTable, Vcl.ExtCtrls,
  Vcl.StdCtrls, uSkinWindowsForm;

type
  TfrmSelectRecordPopup = class(TfrmSelectPopup)
    RestMemTable1: TRestMemTable;
    DataSource1: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure RestMemTable1GetRestDatasetPage(Sender: TObject;
      var ACallAPIResult: Boolean; var ACode: Integer; var ADesc: string;
      var ADataJson: ISuperObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormPaint(Sender: TObject);  private
    { Private declarations }
  protected
//    //分页控制控件
//    FGridSwitchPageFrame:TFrameGridSwitchPage;

    procedure DoFilter(AKeyword:String);override;
    //用于清理数据
    procedure DoClear;override;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;

var
  frmSelectRecordPopup: TfrmSelectRecordPopup;

implementation

{$R *.dfm}

procedure TfrmSelectRecordPopup.Button1Click(Sender: TObject);
begin
  inherited;
  RestMemTable1.GetPriorPage;
end;

procedure TfrmSelectRecordPopup.Button2Click(Sender: TObject);
begin
  inherited;
  RestMemTable1.GetNextPage;
end;

constructor TfrmSelectRecordPopup.Create(AOwner: TComponent);
begin
  inherited;

//  FGridSwitchPageFrame:=TFrameGridSwitchPage.Create(Self);
//  FGridSwitchPageFrame.Parent:=Self;
//  FGridSwitchPageFrame.Align:=alBottom;
//  FGridSwitchPageFrame.Visible:=True;
//  FGridSwitchPageFrame.Load(RestMemTable1);

end;

procedure TfrmSelectRecordPopup.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  //如果有选中,按回车表示确定选中
  if Assigned(OnSelectRecord) then
  begin
    OnSelectRecord(Sender,Self.RestMemTable1);
  end;

  HidePopup;

end;

destructor TfrmSelectRecordPopup.Destroy;
begin

  inherited;
end;

procedure TfrmSelectRecordPopup.DoClear;
begin
  inherited;

  RestMemTable1.EmptyDataSet;

end;

procedure TfrmSelectRecordPopup.DoFilter(AKeyword: String);
begin
  inherited;

  //获取第一页数据
  //RestMemTable1.GetFirstPage;
end;

procedure TfrmSelectRecordPopup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if Key=13 then
  begin
    //如果有选中,按回车表示确定选中
    if Assigned(OnSelectRecord) then
    begin
      OnSelectRecord(Sender,Self.RestMemTable1);
    end;

    HidePopup;

    Key:=0;
  end;
  if Key=VK_UP then
  begin
      Self.RestMemTable1.Prior;
      Key:=0;
  end;
  if Key=VK_DOWN then
  begin
      Self.RestMemTable1.Next;
      Key:=0;
  end;
end;

procedure TfrmSelectRecordPopup.FormPaint(Sender: TObject);
begin
  inherited;
  //画边框
  Self.Canvas.Pen.Color:=clGray;
  Self.Canvas.Rectangle(0,0,Width,Height);
end;

procedure TfrmSelectRecordPopup.RestMemTable1GetRestDatasetPage(Sender: TObject;
  var ACallAPIResult: Boolean; var ACode: Integer; var ADesc: string;
  var ADataJson: ISuperObject);
begin
  inherited;


//  //输入的字符大于2才开始过滤
//  if Length(FKeyWord)>=2 then
//  begin
//      ACallAPIResult:=SimpleCallAPI('get_record_list',
//                         nil,
//                         TableRestCenterInterfaceUrl,
//                        ['appid',
//                        'rest_name',
//                        'pageindex',
//                        'pagesize',
//                        'where_sql'
//                        ],
//                        [AppID,
//                        'MedicineSimpleInfo',
//                        RestMemTable1.PageIndex,
//                        RestMemTable1.PageSize,
//                        ' AND (Ypdm LIKE '+QuotedStr('%'+FKeyWord+'%')
////                              +' OR Srm1 LIKE '+QuotedStr('%'+FKeyWord+'%')
////                              +' OR Srm2 LIKE '+QuotedStr('%'+FKeyWord+'%')
////                              +' OR Srm3 LIKE '+QuotedStr('%'+FKeyWord+'%')
//                              +'  ) '
//                        ],
//                        ACode,
//                        ADesc,
//                        ADataJson,
//                        GlobalRestAPISignType,
//                        GlobalRestAPIAppSecret
//                        );
//
//  end
//  else
//  begin
//        ACode:=SUCC;
//        ACallAPIResult:=True;
//  end;

end;

end.
