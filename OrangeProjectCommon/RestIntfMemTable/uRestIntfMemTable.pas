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
    //是否需要重建表结构
    IsNeedReCreateFieldDefs:Boolean;

    //在设计时获取表结构
    procedure GetFieldDefs;



    //第一页
    procedure GetFirstPage;
    //最后一页
    procedure GetLastPage;
    //上一页
    procedure GetPriorPage;
    //下一页
    procedure GetNextPage;

    procedure Refresh;

    procedure LoadDataIntfResult(ADataJson:ISuperObject;AIsNeedLoadRecordList:Boolean=True);
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;

    property OnChange:TNotifyEvent read FOnChange write FOnChange;
    property OnExecuteBegin:TNotifyEvent read FOnExecuteBegin write FOnExecuteBegin;
    property OnExecuteEnd:TNotifyEvent read FOnExecuteEnd write FOnExecuteEnd;
  published
    //获取表结构的接口链接
    property FieldDefsInterfaceUrl:String read FFieldDefsInterfaceUrl write FFieldDefsInterfaceUrl;
    //获取接口数据集分页的接口
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
    LoadDataIntfResult(ADataJson);
  end;


//  //调用接口,加载列表
//  //直接从接口返回数据集
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
////    //显示到表格上
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

  IsNeedReCreateFieldDefs:=True;

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

  //调用接口,加载列表
  //直接从接口返回数据集
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

//    //显示到表格上
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

procedure TRestMemTable.LoadDataIntfResult(ADataJson:ISuperObject;AIsNeedLoadRecordList:Boolean);
begin

    if (ADataJson<>nil) then
    begin
        SumRecordCount:=ADataJson.I['SumCount'];
        PageCount:=Ceil(SumRecordCount/PageSize);


        if AIsNeedLoadRecordList then
        begin
            //放在线程中加载,不然会卡
            if IsNeedReCreateFieldDefs then
            begin
                LoadDataJsonTokbmMemTable(Self,ADataJson,RECORDLIST_KEY);
            end
            else
            begin

                TThread.Synchronize(nil,procedure
                begin
                    Self.DisableControls;
                    try
                      Self.EmptyDataSet;
                      LoadDataFromJsonArray(Self,ADataJson.A[RECORDLIST_KEY]);
                    finally
                      Self.EnableControls;
                    end;
                end);

            end;
        end;

    end
    else
    begin
        SumRecordCount:=0;
        PageCount:=Ceil(SumRecordCount/PageSize);


//        TThread.Synchronize(nil,procedure
//        begin
//          Self.DisableControls;
//        end);
//
//        try
//          Self.EmptyDataSet;
//        finally
//          TThread.Synchronize(nil,procedure
//          begin
//            Self.EnableControls;
//          end);
//        end;


    end;

    if (PageCount>0) and (PageIndex>PageCount) then
    begin
      PageIndex:=PageCount;
    end;


    TThread.Synchronize(nil,procedure
    begin
      DoChange;
    end);

end;

procedure TRestMemTable.Refresh;
begin
  Self.FtteGetRestDatasetPage.Run();
end;

end.
