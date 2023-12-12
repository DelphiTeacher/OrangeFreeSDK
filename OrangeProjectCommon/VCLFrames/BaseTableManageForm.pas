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
    //��ҳ���ƿؼ�
    FGridSwitchPageFrame:TFrameGridSwitchPage;

//    procedure DoFilter(AKeyword:String);override;
//    //������������
//    procedure DoClear;override;
    //��ʼҳ��������ݽṹ
    procedure InitPage(APage:uPageStructure.TPage);virtual;

    //�Զ����ѯ����
    function GetCustomKeyJsonStr:String;virtual;
    //�Զ����ֶ�
    procedure InitFieldDefs;virtual;
    //�Զ�������
    procedure InitColumns;virtual;
    //�����Ӽ�¼ʱ��ʼ���ݼ��ֶ�ֵ
    procedure CustomDatasetAfterInsert(Sender:TObject;ADataset:TDataset);virtual;
    //�Զ�����ýӿڻ�ȡ���ݵĲ�ѯ����
    function CustomGetRestDatasetPageCustomWhereKeyJson:String;virtual;
    //�Զ����ʼ�ؼ�,����ListView
    procedure CustomInitFieldControl(AControl:TComponent;AFieldControlSettingMap:TFieldControlSettingMap);virtual;
//    //Page�������ݽ����¼�
//    procedure DoLoadDataTaskEnd(Sender:TObject;
//                                 APageInstance:TPageInstance;
//                                 ADataIntfResult: TDataIntfResult;
//                                 ADataIntfResult2: TDataIntfResult
//                                 );
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
//    //�Ƿ����AppID�ֶ�
//    FHasAppID:Boolean;
//    //ͨ�ýӿڵ�rest_name
//    FRestName:String;
//    //�����ֶ���
//    FKeyFieldName:String;
//    //ɾ����ǵ��ֶ���
//    FDeletedFieldName:String;
//    //�������������
//    FColumnsSettingArray:ISuperArray;
//    //��������ʱ�Ĳ�ѯ����
//    FWhereKeyJsonStr:String;

    //ҳ��ؼ��б�
    FPage:uPageStructure.TPage;

    FPageInstance:TPageInstance;

    procedure SyncButtonState;

    procedure Load;//(ACaption:String;
//                    AHasAppID:Boolean;
//                    //ͨ�ýӿ���
//                    ARestName:String;
//                    //��������ʱ�Ĳ�ѯ����
//                    AWhereKeyJsonStr:String;
//                    //�����ֶ���
//                    AKeyFieldName:String;
//                    //ɾ����ǵ��ֶ���
//                    ADeletedFieldName:String;
//                    //�������������
//                    AColumnsSettingArray:ISuperArray);
    { Public declarations }
  end;



//<<<<<<< .mine
//||||||| .r16098
//  //�����������ά������
//  TfrmCommonDiagnoseTableManage=class(TfrmBaseTableManage)
//  protected
//    //��ʼҳ��
//    procedure InitPage;override;
//    procedure CustomDatasetAfterInsert(Sender:TObject;ADataset:TDataset);override;
//  end;
//=======
//  //�����������ά������
//  TfrmCommonDiagnoseTableManage=class(TfrmBaseTableManage)
//  protected
//    //��ʼҳ��������ݽṹ
//    procedure InitPage(APage:uPageStructure.TPage);override;
//    //�����Ӽ�¼ʱ��ʼ���ݼ��ֶ�ֵ
//    procedure CustomDatasetAfterInsert(Sender:TObject;ADataset:TDataset);override;
//
//    //�Զ�����ýӿڻ�ȡ���ݵĲ�ѯ����
//    function CustomGetRestDatasetPageCustomWhereKeyJson:String;override;
//  end;
//>>>>>>> .r17253

var
  frmBaseTableManage: TfrmBaseTableManage;


implementation

{$R *.dfm}


procedure TfrmBaseTableManage.btnCancelClick(Sender: TObject);
begin
  //ȡ��
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
  //ɾ��
  Self.RestMemTable1.Delete;
end;

procedure TfrmBaseTableManage.btnEditClick(Sender: TObject);
begin
  //�༭��¼
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
  //ˢ��
  RestMemTable1.Refresh;

//  Self.FPageInstance.LoadData(FPageInstance.FLoadDataSetting);
end;

procedure TfrmBaseTableManage.btnSaveClick(Sender: TObject);
begin
  //�������/�޸�
  Self.FPageInstance.DoSaveRecordAction(False);

  Self.FPageInstance.FLoadDataSetting.IsAddRecord:=False;

  Self.RestMemTable1.Refresh;

  SyncButtonState;
end;

procedure TfrmBaseTableManage.btnSaveGridClick(Sender: TObject);
//var
//  ADesc:String;
begin
//  //ȫ������
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


  //ҳ��ؼ��б�
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


  //��ṹ�Ѿ�������,ÿ�λ�ȡ����֮����Ҫ�ؽ���
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
//  //��ȡ��һҳ����
//  RestMemTable1.GetFirstPage;
//end;

procedure TfrmBaseTableManage.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if Key=13 then
  begin

//    //�����ѡ��,���س���ʾȷ��ѡ��
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

//  //���߿�
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
  //�������е���
  Self.cxGrid1DBTableView1.DataController.CreateAllItems();

end;

procedure TfrmBaseTableManage.InitFieldDefs;
var
  ACode:Integer;
  ADesc:String;
  ADataJson:ISuperObject;
begin
  //��ȡ�ֶ��б�
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
  //��ʼҳ��ṹ
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

  //��ʼҳ��ṹ
  InitPage(FPage);



  //�����������ؼ�
  if not Self.FPageInstance.CreateControls(Self,Self.pnlInput,'','',False,ADesc,True) then
  begin
    ShowMessage(ADesc);
    Exit;
  end;
  FPageInstance.MainControlMapList.AlignControls();
  Self.pnlInput.Height:=FPageInstance.MainControlMapList.FListLayoutsManager.CalcContentHeight;


  //��ʼ�����
  if Self.cxGrid1DBTableView1.ColumnCount=0 then
  begin

      //��ʼ�ֶ�
      InitFieldDefs;


      InitColumns;
//      if (Self.FColumnsSettingArray=nil) then
//      begin
//        Exit;
//      end;

      //����Ҫ�༭���ֶ���ʾ����
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


  //��ȡ����
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
  
    //��¼��ɾ��������
    AKeyFieldValue:=Dataset.FieldByName(FPage.DataInterface.FKeyFieldName).AsVariant;
    ARecordJson:=LocateJsonArray(FRecordList,FPage.DataInterface.FKeyFieldName,AKeyFieldValue);
    //���Ϊ��ɾ��
    ARecordJson.I[FPage.DataInterface.FDeletedFieldName]:=1;


    //ֱ��ɾ��
    //��ҳ���¼���浽�����
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
