unit BaseTableManageForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Math,

  uFuncCommon,
  XSuperObject,
  uRestInterfaceCall,
  uManager,
  uDatasetToJson,
  uJsonToDataset,
  uOpenClientCommon,
  uOpenCommon,
  uTimerTask,
  SelectPopupForm,
  GridSwitchPageFrame,
  uPageStructure,
  uBasePageStructure,
  uDataInterface,
  uRestHttpDataInterface,
//  uTableCommonRestCenter,
  EasyServiceCommonMaterialDataMoudle_VCL,

  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,

  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uRestIntfMemTable, Vcl.ExtCtrls,
  Vcl.StdCtrls, uSkinWindowsControl, uSkinButtonType;

type
  TfrmBaseTableManage = class(TForm)
    RestMemTable1: TRestMemTable;
    DataSource1: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    pnlToolbar: TPanel;
    btnSaveGrid: TSkinWinButton;
    btnRefresh: TSkinWinButton;
    btnDelete: TSkinWinButton;
    pnlBottombar: TPanel;
    btnSave: TSkinWinButton;
    pnlInput: TPanel;
    btnNew: TSkinWinButton;
    btnEdit: TSkinWinButton;
    btnCancel: TSkinWinButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure btnSaveGridClick(Sender: TObject);
    procedure RestMemTable1BeforeDelete(DataSet: TDataSet);
    procedure RestMemTable1AfterInsert(DataSet: TDataSet);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure RestMemTable1GetRestDatasetPage(Sender: TObject;
      var ACallAPIResult: Boolean; var ACode: Integer; var ADesc: string;
      var ADataJson: ISuperObject);virtual;
    procedure pnlInputResize(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  protected
    FRecordList:ISuperArray;
    //分页控制控件
    FGridSwitchPageFrame:TFrameGridSwitchPage;

//    procedure DoFilter(AKeyword:String);override;
//    //用于清理数据
//    procedure DoClear;override;
    //初始页面这个数据结构
    procedure InitPage(APage:uPageStructure.TPage);virtual;

    //自定义查询条件
    function GetCustomKeyJsonStr:String;virtual;
    //自定义字段
    procedure InitFieldDefs;virtual;
    //自定义表格列
    procedure InitColumns;virtual;
    //表格添加记录时初始数据集字段值
    procedure CustomDatasetAfterInsert(Sender:TObject;ADataset:TDataset);virtual;
    //自定义调用接口获取数据的查询条件
    function CustomGetRestDatasetPageCustomWhereKeyJson:String;virtual;
    //自定义初始控件,比如ListView
    procedure CustomInitFieldControl(AControl:TComponent;AFieldControlSettingMap:TFieldControlSettingMap);virtual;
//    //Page加载数据结束事件
//    procedure DoLoadDataTaskEnd(Sender:TObject;
//                                 APageInstance:TPageInstance;
//                                 ADataIntfResult: TDataIntfResult;
//                                 ADataIntfResult2: TDataIntfResult
//                                 );
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
//    //是否包含AppID字段
//    FHasAppID:Boolean;
//    //通用接口的rest_name
//    FRestName:String;
//    //主键字段名
//    FKeyFieldName:String;
//    //删除标记的字段名
//    FDeletedFieldName:String;
//    //表格列设置数组
//    FColumnsSettingArray:ISuperArray;
//    //加载数据时的查询条件
//    FWhereKeyJsonStr:String;

    //页面控件列表
    FPage:uPageStructure.TPage;

    FPageInstance:TPageInstance;

    procedure SyncButtonState;

    procedure Load;//(ACaption:String;
//                    AHasAppID:Boolean;
//                    //通用接口名
//                    ARestName:String;
//                    //加载数据时的查询条件
//                    AWhereKeyJsonStr:String;
//                    //主键字段名
//                    AKeyFieldName:String;
//                    //删除标记的字段名
//                    ADeletedFieldName:String;
//                    //表格列设置数组
//                    AColumnsSettingArray:ISuperArray);
    { Public declarations }
  end;



//<<<<<<< .mine
//||||||| .r16098
//  //常用诊断数据维护窗体
//  TfrmCommonDiagnoseTableManage=class(TfrmBaseTableManage)
//  protected
//    //初始页面
//    procedure InitPage;override;
//    procedure CustomDatasetAfterInsert(Sender:TObject;ADataset:TDataset);override;
//  end;
//=======
//  //常用诊断数据维护窗体
//  TfrmCommonDiagnoseTableManage=class(TfrmBaseTableManage)
//  protected
//    //初始页面这个数据结构
//    procedure InitPage(APage:uPageStructure.TPage);override;
//    //表格添加记录时初始数据集字段值
//    procedure CustomDatasetAfterInsert(Sender:TObject;ADataset:TDataset);override;
//
//    //自定义调用接口获取数据的查询条件
//    function CustomGetRestDatasetPageCustomWhereKeyJson:String;override;
//  end;
//>>>>>>> .r17253

var
  frmBaseTableManage: TfrmBaseTableManage;


implementation

{$R *.dfm}


procedure TfrmBaseTableManage.btnCancelClick(Sender: TObject);
begin
  //取消
  if Self.FPageInstance.FLoadDataSetting.IsAddRecord then
  begin
    Self.FPageInstance.CancelAddRecord;
  end;
  if Self.FPageInstance.FLoadDataSetting.IsEditRecord then
  begin
    Self.FPageInstance.CancelEditRecord;
  end;

  SyncButtonState;
end;

procedure TfrmBaseTableManage.btnDeleteClick(Sender: TObject);
begin
  //删除
  Self.RestMemTable1.Delete;
end;

procedure TfrmBaseTableManage.btnEditClick(Sender: TObject);
begin
  //编辑记录
//  Self.FPageInstance.FLoadDataSetting.IsAddRecord:=False;
  Self.FPageInstance.BeginEditRecord;

//  Self.FPageInstance.MainControlMapList.ClearValue;

  SyncButtonState;

end;

procedure TfrmBaseTableManage.btnNewClick(Sender: TObject);
begin

//  Self.FPageInstance.FLoadDataSetting.IsAddRecord:=True;
//  Self.FPageInstance.MainControlMapList.ClearValue;
  Self.FPageInstance.BeginAddRecord;

  SyncButtonState;
end;

procedure TfrmBaseTableManage.btnRefreshClick(Sender: TObject);
begin
  //刷新
  RestMemTable1.Refresh;

//  Self.FPageInstance.LoadData(FPageInstance.FLoadDataSetting);
end;

procedure TfrmBaseTableManage.btnSaveClick(Sender: TObject);
begin
  //保存添加/修改
  Self.FPageInstance.DoSaveRecordAction(False);

  Self.FPageInstance.FLoadDataSetting.IsAddRecord:=False;

  Self.RestMemTable1.Refresh;

  SyncButtonState;
end;

procedure TfrmBaseTableManage.btnSaveGridClick(Sender: TObject);
//var
//  ADesc:String;
begin
//  //全部保存
//  if not SaveDatasetToServer(AppID,
//                              Self.RestMemTable1,
//                              Self.FRecordList,
//                              FPage.DataInterface.FKeyFieldName,
//                              FPage.DataInterface.Name,//FRestName,
//                              FPage.DataInterface.FHasAppID,
//                              ADesc) then
//  begin
//    ShowMessage(ADesc);
//    Exit;
//  end;
end;

procedure TfrmBaseTableManage.Button1Click(Sender: TObject);
begin
  inherited;
  RestMemTable1.GetPriorPage;
end;

procedure TfrmBaseTableManage.Button2Click(Sender: TObject);
begin
  inherited;
  RestMemTable1.GetNextPage;
end;

constructor TfrmBaseTableManage.Create(AOwner: TComponent);
begin
  inherited;
  GlobalMainProgramSetting.AppID:=AppID;

  GlobalDataInterfaceClass:=TTableCommonRestHttpDataInterface;


  //页面控件列表
  FPage:=uPageStructure.TPage.Create(nil);
  FPageInstance:=TPageInstance.Create(nil);
  FPageInstance.PageStructure:=FPage;
  FPageInstance.FOnCustomInitFieldControl:=Self.CustomInitFieldControl;
//  FPageInstance.OnLoadDataTaskEnd:=DoLoadDataTaskEnd;


  FGridSwitchPageFrame:=TFrameGridSwitchPage.Create(Self);
  FGridSwitchPageFrame.Parent:=Self;
  FGridSwitchPageFrame.Align:=alBottom;
  FGridSwitchPageFrame.Visible:=True;
  FGridSwitchPageFrame.Load(RestMemTable1);


  Self.cxGrid1DBTableView1.OptionsView.NoDataToDisplayInfoText:='';


  //表结构已经建好了,每次获取数据之后不需要重建了
  RestMemTable1.IsNeedReCreateFieldDefs:=False;

end;

destructor TfrmBaseTableManage.Destroy;
begin
  FreeAndNil(FPage);
  inherited;
end;

procedure TfrmBaseTableManage.CustomDatasetAfterInsert(Sender: TObject;
  ADataset: TDataset);
begin

end;

function TfrmBaseTableManage.CustomGetRestDatasetPageCustomWhereKeyJson: String;
begin
  Result:='';
end;

procedure TfrmBaseTableManage.CustomInitFieldControl(AControl: TComponent;
  AFieldControlSettingMap: TFieldControlSettingMap);
begin

end;

procedure TfrmBaseTableManage.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  ARecordDataJson:ISuperObject;
begin

  ARecordDataJson:=JsonFromRecord(Self.RestMemTable1);
  Self.FPageInstance.LoadCurrentRecordDataJsonToControls(ARecordDataJson);

end;

//procedure TfrmBaseTableManage.DoLoadDataTaskEnd(Sender: TObject;
//  APageInstance: TPageInstance; ADataIntfResult,
//  ADataIntfResult2: TDataIntfResult);
//begin
////  RestMemTable1.EmptyDataSet;
////
////  if ADataIntfResult.Succ then
////  begin
////    FRecordList:=ADataIntfResult.DataJson.A['RecordList'];
////
//////    LoadDataFromJsonArray(Self.RestMemTable1,ADataIntfResult.DataJson.A['RecordList']);
//////    LoadDataJsonTokbmMemTable(Self.RestMemTable1,ADataIntfResult.DataJson,'RecordList');
////
////
////    Self.RestMemTable1.LoadDataIntfResult(ADataIntfResult.DataJson,False);
////  end;
//
//
//
//end;

//procedure TfrmBaseTableManage.DoClear;
//begin
//  inherited;
//
//  RestMemTable1.EmptyDataSet;
//
//end;
//
//procedure TfrmBaseTableManage.DoFilter(AKeyword: String);
//begin
//  inherited;
//
//  //获取第一页数据
//  RestMemTable1.GetFirstPage;
//end;

procedure TfrmBaseTableManage.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if Key=13 then
  begin

//    //如果有选中,按回车表示确定选中
//    if Assigned(OnSelectRecord) then
//    begin
//      OnSelectRecord(Sender,Self.RestMemTable1);
//    end;
//
//    HidePopup;


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

procedure TfrmBaseTableManage.FormPaint(Sender: TObject);
begin
  inherited;

//  //画边框
//  Self.Canvas.Pen.Color:=clGray;
//  Self.Canvas.Rectangle(0,0,Width,Height);

end;

function TfrmBaseTableManage.GetCustomKeyJsonStr: String;
begin
  Result:='';
//  Result:=FWhereKeyJsonStr;
end;

procedure TfrmBaseTableManage.InitColumns;
begin
  //创建所有的列
  Self.cxGrid1DBTableView1.DataController.CreateAllItems();

end;

procedure TfrmBaseTableManage.InitFieldDefs;
var
  ACode:Integer;
  ADesc:String;
  ADataJson:ISuperObject;
begin
  //获取字段列表
  if not SimpleCallAPI('get_field_list',
                       nil,
                       TableRestCenterInterfaceUrl,
                      ['appid',
                      'rest_name'
                      ],
                      [AppID,
                      FPage.DataInterface.Name//FRestName
                      ],
                      ACode,
                      ADesc,
                      ADataJson,
                      GlobalRestAPISignType,
                      GlobalRestAPIAppSecret
                      ) or (ACode<>SUCC) then
  begin
    ShowMessage(ADesc);
    Exit;
  end;

  //if ADataJson.A['RecordList'] then
  LoadMemTableFeildDefsByFieldDefArray(Self.RestMemTable1,ADataJson.A['FieldList']);

end;

procedure TfrmBaseTableManage.InitPage(APage:uPageStructure.TPage);
begin
  //初始页面结构
  FPage.page_type:=Const_PageType_ListPage;
end;

procedure TfrmBaseTableManage.Load;//(ACaption:String;AHasAppID:Boolean;
//                                  ARestName: String;
//                                  AWhereKeyJsonStr:String;
//                                  AKeyFieldName:String;
//                                  ADeletedFieldName:String;
//                                  AColumnsSettingArray:ISuperArray;
//                                  APage:TPage);
var
  ADesc:String;
var
  I: Integer;
  AColumn:TcxGridDBColumn;
//  AColumnSettingJson:ISuperObject;
  AFieldControlSetting:TFieldControlSetting;
begin

//  Caption:=ACaption;
//
//  FHasAppID:=AHasAppID;
//  FRestName:=ARestName;
//  FWhereKeyJsonStr:=AWhereKeyJsonStr;
//  FKeyFieldName:=AKeyFieldName;
//  FDeletedFieldName:=ADeletedFieldName;
//  FColumnsSettingArray:=AColumnsSettingArray;

  //初始页面结构
  InitPage(FPage);



  //创建输入区控件
  if not Self.FPageInstance.CreateControls(Self,Self.pnlInput,'','',False,ADesc,True) then
  begin
    ShowMessage(ADesc);
    Exit;
  end;
  FPageInstance.MainControlMapList.AlignControls();
  Self.pnlInput.Height:=FPageInstance.MainControlMapList.FListLayoutsManager.CalcContentHeight;


  //初始表格列
  if Self.cxGrid1DBTableView1.ColumnCount=0 then
  begin

      //初始字段
      InitFieldDefs;


      InitColumns;
//      if (Self.FColumnsSettingArray=nil) then
//      begin
//        Exit;
//      end;

      //将需要编辑的字段显示出来
      for I := 0 to Self.cxGrid1DBTableView1.ColumnCount-1 do
      begin
        AColumn:=Self.cxGrid1DBTableView1.Columns[I];

        AFieldControlSetting:=Self.FPage.MainLayoutControlList.FindByFieldName(AColumn.DataBinding.FieldName);
//        AColumnSettingJson:=LocateJsonArray(FColumnsSettingArray,'field_name',AColumn.DataBinding.FieldName);
//        if AColumnSettingJson=nil then
//        begin
//          AColumn.Visible:=False;
//          Continue;
//        end;
        if AFieldControlSetting=nil then
        begin
          AColumn.Visible:=False;
          Continue;
        end;

//        AColumn.Visible:=(AColumnSettingJson.I['visible']=1);
//        AColumn.Editing:=(AColumnSettingJson.I['readonly']=0);
//        AColumn.Width:=AColumnSettingJson.I['Width'];
//        AColumn.Caption:=AColumnSettingJson.S['caption'];
        AColumn.Visible:=(AFieldControlSetting.col_visible=1);
        AColumn.Editing:=(AFieldControlSetting.readonly=0);
        AColumn.Width:=Ceil(AFieldControlSetting.Width);
        AColumn.Caption:=AFieldControlSetting.field_caption;

      end;
  end;


  //获取数据
  RestMemTable1.Refresh;


  Self.SyncButtonState;
end;

procedure TfrmBaseTableManage.pnlInputResize(Sender: TObject);
begin
  if FPageInstance<>nil then
  begin
    FPageInstance.MainControlMapList.AlignControls();
  end;
end;

procedure TfrmBaseTableManage.RestMemTable1AfterInsert(DataSet: TDataSet);
begin
  CustomDatasetAfterInsert(Self,DataSet);

end;

procedure TfrmBaseTableManage.RestMemTable1BeforeDelete(DataSet: TDataSet);
var
  AIsAdd:Boolean;
  ADesc:String;
  ARecordJson:ISuperObject;
  ADataJson:ISuperObject;
  AKeyFieldValue:Variant;
begin
  if not Dataset.FieldByName(FPage.DataInterface.FKeyFieldName).IsNull then
  begin
  
    //记录下删除的主键
    AKeyFieldValue:=Dataset.FieldByName(FPage.DataInterface.FKeyFieldName).AsVariant;
    ARecordJson:=LocateJsonArray(FRecordList,FPage.DataInterface.FKeyFieldName,AKeyFieldValue);
    //标记为已删除
    ARecordJson.I[FPage.DataInterface.FDeletedFieldName]:=1;


    //直接删除
    //将页面记录保存到服务端
    if not SaveRecordToServer(InterfaceUrl,
                              AppID,
                              '',
                              '',
                              FPage.DataInterface.Name,//FRestName,
                              AKeyFieldValue,
                              ARecordJson,
                              AIsAdd,
                              ADesc,
                              ADataJson,
                              GlobalRestAPISignType,
                              GlobalRestAPIAppSecret,
                              FPage.DataInterface.FHasAppID
                              ) then
    begin
      Exit;
    end;

  end;

end;

procedure TfrmBaseTableManage.RestMemTable1GetRestDatasetPage(Sender: TObject;
  var ACallAPIResult: Boolean; var ACode: Integer; var ADesc: string;
  var ADataJson: ISuperObject);
begin
//  FPageInstance.FLoadDataSetting.Clear;
  FPageInstance.FLoadDataSetting.PageIndex:=Self.RestMemTable1.PageIndex;
  FPageInstance.FLoadDataSetting.PageSize:=Self.RestMemTable1.PageSize;

  FPageInstance.FLoadDataSetting.CustomWhereKeyJson:=CustomGetRestDatasetPageCustomWhereKeyJson;//GetWhereKeyJson(['Zgdm','is_deleted'],[GlobalManager.User.fid,0]);

  FPageInstance.LoadData(False);

//  RestMemTable1.EmptyDataSet;
//
//  if ADataIntfResult.Succ then
//  begin
//    FRecordList:=ADataIntfResult.DataJson.A['RecordList'];
//
////    LoadDataFromJsonArray(Self.RestMemTable1,ADataIntfResult.DataJson.A['RecordList']);
////    LoadDataJsonTokbmMemTable(Self.RestMemTable1,ADataIntfResult.DataJson,'RecordList');
//
//
//    Self.RestMemTable1.LoadDataIntfResult(ADataIntfResult.DataJson,False);
//  end;

  ACallAPIResult:=FPageInstance.FLoadDataIntfResult.Succ;
  ADesc:=FPageInstance.FLoadDataIntfResult.Desc;
  ADataJson:=FPageInstance.FLoadDataIntfResult.DataJson;


  if FPageInstance.FLoadDataIntfResult.Succ then
  begin
    FRecordList:=FPageInstance.FLoadDataIntfResult.DataJson.A['RecordList'];
    ACode:=SUCC;

//    LoadDataFromJsonArray(Self.RestMemTable1,ADataIntfResult.DataJson.A['RecordList']);
//    LoadDataJsonTokbmMemTable(Self.RestMemTable1,ADataIntfResult.DataJson,'RecordList');


//    Self.RestMemTable1.LoadDataIntfResult(ADataIntfResult.DataJson,False);
  end
  else
  begin
      ACode:=FAIL;

  end;

end;

procedure TfrmBaseTableManage.SyncButtonState;
begin
  Self.btnNew.Enabled:=not Self.FPageInstance.FLoadDataSetting.IsAddRecord
                      and not Self.FPageInstance.FLoadDataSetting.IsEditRecord;
  Self.btnNew.Invalidate;

  Self.btnEdit.Enabled:=not Self.FPageInstance.FLoadDataSetting.IsAddRecord
                        and not Self.FPageInstance.FLoadDataSetting.IsEditRecord;
  Self.btnEdit.Invalidate;

  Self.pnlInput.Enabled:=Self.FPageInstance.FLoadDataSetting.IsAddRecord
                          or Self.FPageInstance.FLoadDataSetting.IsEditRecord;
  Self.pnlInput.Invalidate;

  Self.btnSave.Enabled:=Self.FPageInstance.FLoadDataSetting.IsAddRecord
                      or Self.FPageInstance.FLoadDataSetting.IsEditRecord;
  Self.btnSave.Invalidate;

  Self.btnCancel.Enabled:=Self.FPageInstance.FLoadDataSetting.IsAddRecord
                      or Self.FPageInstance.FLoadDataSetting.IsEditRecord;
  Self.btnCancel.Invalidate;
end;



//<<<<<<< .mine
//||||||| .r16098
//procedure TfrmCommonDiagnoseTableManage.InitPage;
//var
//  AFieldControlSetting:TFieldControlSetting;
//begin
//  inherited;
//=======
//function TfrmCommonDiagnoseTableManage.CustomGetRestDatasetPageCustomWhereKeyJson: String;
//begin
//  Result:=GetWhereKeyJson(['Zgdm','is_deleted'],[GlobalManager.User.fid,0]);
//end;
//
//procedure TfrmCommonDiagnoseTableManage.InitPage(APage:uPageStructure.TPage);
//var
//  AFieldControlSetting:TFieldControlSetting;
//begin
//  inherited;
//>>>>>>> .r17253

end.
