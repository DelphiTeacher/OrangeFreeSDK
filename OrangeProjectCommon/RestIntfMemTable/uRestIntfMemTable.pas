unit uRestIntfMemTable;

interface


uses
  Classes,
  uFuncCommon,
  uDatasetToJson,
  uJsonToDataset,
  XSuperObject,
  uTimerTask,
  uTimerTaskEvent,
  Dialogs,
  Math,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  uRestInterfaceCall;



type
  TGetRestDatasetPageEvent=procedure(Sender:TObject;
                                var ACallAPIResult:Boolean;
                                var ACode:Integer;
                                var ADesc:String;
                                var ADataJson:ISuperObject
                                ) of object;

  TRestMemTable=class(TFDMemTable)
  private
    FtteGetRestDatasetPage:TTimerTaskEvent;
    FFieldDefsInterfaceUrl: String;
    FOnGetRestDatasetPage: TGetRestDatasetPageEvent;
    FOnChange: TNotifyEvent;
    FOnExecuteEnd: TNotifyEvent;
    FOnExecuteBegin: TNotifyEvent;


    procedure DoChange;

    procedure DoGetRestDatasetPageExecuteBegin(ATimerTask:TTimerTask);
    procedure DoGetRestDatasetPageExecute(ATimerTask:TTimerTask);
    procedure DoGetRestDatasetPageExecuteEnd(ATimerTask:TTimerTask);
  public
    PageIndex:Integer;
    PageSize:Integer;
    PageCount:Integer;
    SumRecordCount:Integer;


    //�����ʱ��ȡ��ṹ
    procedure GetFieldDefs;



    //��һҳ
    procedure GetFirstPage;
    //���һҳ
    procedure GetLastPage;
    //��һҳ
    procedure GetPriorPage;
    //��һҳ
    procedure GetNextPage;

    procedure Refresh;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;

    property OnChange:TNotifyEvent read FOnChange write FOnChange;
    property OnExecuteBegin:TNotifyEvent read FOnExecuteBegin write FOnExecuteBegin;
    property OnExecuteEnd:TNotifyEvent read FOnExecuteEnd write FOnExecuteEnd;
  published
    //��ȡ��ṹ�Ľӿ�����
    property FieldDefsInterfaceUrl:String read FFieldDefsInterfaceUrl write FFieldDefsInterfaceUrl;
    //��ȡ�ӿ����ݼ���ҳ�Ľӿ�
    property OnGetRestDatasetPage:TGetRestDatasetPageEvent read FOnGetRestDatasetPage write FOnGetRestDatasetPage;
  end;





implementation

{ TRestMemTable }

destructor TRestMemTable.Destroy;
begin
  FreeAndNil(FtteGetRestDatasetPage);
  inherited;
end;

procedure TRestMemTable.DoChange;
begin
  if Assigned(Self.FOnChange) then
  begin
    FOnChange(Self);
  end;
end;

procedure TRestMemTable.DoGetRestDatasetPageExecute(ATimerTask: TTimerTask);
var
  ACallAPIResult:Boolean;
  ACode:Integer;
  ADesc:String;
  ADataJson:ISuperObject;
begin
  TTimerTask(ATimerTask).TaskTag:=TASK_FAIL;


  ACallAPIResult:=False;
  ACode:=FAIL;
  ADesc:='';
  ADataJson:=nil;


  if Assigned(Self.FOnGetRestDatasetPage) then
  begin
    FOnGetRestDatasetPage(Self,
                          ACallAPIResult,
                          ACode,
                          ADesc,
                          ADataJson);
  end;

  TTimerTask(ATimerTask).TaskDesc:=ADesc;
  if ACallAPIResult then
  begin
    TTimerTask(ATimerTask).TaskTag:=TASK_SUCC;
  end;


  if ACallAPIResult and (ACode=SUCC) then//and (ARecordListKey<>'') then
  begin

    if (ADataJson<>nil) then
    begin
        SumRecordCount:=ADataJson.I['SumCount'];
        PageCount:=Ceil(SumRecordCount/PageSize);

        //�����߳��м���,��Ȼ�Ῠ
        LoadDataJsonTokbmMemTable(Self,ADataJson,RECORDLIST_KEY);

    end
    else
    begin
        SumRecordCount:=0;
        PageCount:=Ceil(SumRecordCount/PageSize);


        TThread.Synchronize(nil,procedure
        begin
          Self.DisableControls;
        end);

        try
          Self.EmptyDataSet;
        finally
          TThread.Synchronize(nil,procedure
          begin
            Self.EnableControls;
          end);
        end;


    end;

    if PageIndex>PageCount then
    begin
      PageIndex:=PageCount;
    end;


    TThread.Synchronize(nil,procedure
    begin
      DoChange;
    end);

  end;


//  //���ýӿ�,�����б�
//  //ֱ�Ӵӽӿڷ������ݼ�
//  if SimpleGetAPIDataset('',//'get_patient_base_info_list',
//                        FFieldDefsInterfaceUrl,//'http://127.0.0.1:10020/doctor_workstation/',
//                        [],
//                        [],
//                        'md5',
//                        'chunshu123',
//                        ACode,
//                        ADesc,
//                        ADataJson,
//                        Self
//                        ) and (ACode=SUCC) then
//  begin
//
////    //��ʾ�������
////    Self.DataSource1.DataSet:=tblData;
////    cxGrid1DBTableView1.DataController.DataSource
//
//    TTimerTask(ATimerTask).TaskTag:=TASK_SUCC;
//
//  end
//  else
//  begin
////    ShowMessage(ADesc);
//  end;

end;

procedure TRestMemTable.DoGetRestDatasetPageExecuteBegin(ATimerTask: TTimerTask);
begin
  //
  if Assigned(OnExecuteBegin) then
  begin
    OnExecuteBegin(Self);
  end;
end;

procedure TRestMemTable.DoGetRestDatasetPageExecuteEnd(ATimerTask: TTimerTask);
begin
  try
    if TTimerTask(ATimerTask).TaskTag=TASK_FAIL then
    begin
      ShowMessage(TTimerTask(ATimerTask).TaskDesc);
    end;
  finally
    if Assigned(OnExecuteEnd) then
    begin
      OnExecuteEnd(Self);
    end;
  end;
end;

constructor TRestMemTable.Create(AOwner: TComponent);
begin
  inherited;

  PageIndex:=1;
  PageCount:=0;
  PageSize:=100;
  SumRecordCount:=0;

  FtteGetRestDatasetPage:=TTimerTaskEvent.Create(nil);
  FtteGetRestDatasetPage.OnBegin:=DoGetRestDatasetPageExecuteBegin;
  FtteGetRestDatasetPage.OnExecute:=DoGetRestDatasetPageExecute;
  FtteGetRestDatasetPage.OnExecuteEnd:=DoGetRestDatasetPageExecuteEnd;


end;

procedure TRestMemTable.GetFirstPage;
begin
  PageIndex:=1;
  Self.FtteGetRestDatasetPage.Run();
end;

procedure TRestMemTable.GetFieldDefs;
var
  ACode:Integer;
  ADesc:String;
  ADataJson:ISuperObject;
begin

  //���ýӿ�,�����б�
  //ֱ�Ӵӽӿڷ������ݼ�
  if SimpleGetAPIDataset('',//'get_patient_base_info_list',
                        FFieldDefsInterfaceUrl,//'http://127.0.0.1:10020/doctor_workstation/',
                        [],
                        [],
                        '',
                        '',
                        ACode,
                        ADesc,
                        ADataJson,
                        Self
                        ) and (ACode=SUCC) then
  begin
    ShowMessage(ADesc);

//    //��ʾ�������
//    Self.DataSource1.DataSet:=tblData;
//    cxGrid1DBTableView1.DataController.DataSource

//    TTimerTask(ATimerTask).TaskTag:=TASK_SUCC;

  end
  else
  begin
    ShowMessage(ADesc);
  end;

end;


procedure TRestMemTable.GetLastPage;
begin
  PageIndex:=Self.PageCount;
  Self.FtteGetRestDatasetPage.Run();

end;

procedure TRestMemTable.GetNextPage;
begin
  if PageIndex<Self.PageCount then
  begin
    PageIndex:=PageIndex+1;
    Self.FtteGetRestDatasetPage.Run();
  end;
end;

procedure TRestMemTable.GetPriorPage;
begin
  if PageIndex>1 then
  begin
    PageIndex:=PageIndex-1;
    Self.FtteGetRestDatasetPage.Run();
  end;
end;

procedure TRestMemTable.Refresh;
begin
  Self.FtteGetRestDatasetPage.Run();
end;

end.
