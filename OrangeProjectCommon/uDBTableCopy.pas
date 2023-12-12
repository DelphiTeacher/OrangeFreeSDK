unit uDBTableCopy;

interface

uses
  SysUtils,
{$ifdef LEVEL6}
  Variants,
{$else}
  Forms,
{$endif}
  Classes,
  DateUtils,
  Math,
  Variants,


  StrUtils,
  IniFiles,
  XSuperObject,
  XSuperJson,
  uBaseLog,
  uTimerTask,
  SyncObjs,

//  Forms,
//  XMLDoc,
//  XMLIntf,
//  ActiveX,
//  AES,
//  AES2,
//  uThumbCommon,
//  uDateCommon,
//  uCaptcha,
//  uCommonUtils,
  uDataSetToJson,
  uBaseDBHelper,
  uUniDBHelper,
  uFuncCommon,
//  uLang,
  uBaseList,

  uRestInterfaceCall,
//  uSyncTableData,
//  uOpenCommon,
//  ServerDataBaseModule,
  uBaseDataBaseModule,

//  uCommonConstant,

//  uOpenPlatformServerManager,
//  uTableCommonRestCenter,
//  TableCommonRestService,
//  uQueryCommonRestCenter,
//  QueryCommonRestService,
//  UserCenterRestService,
//  ImageIndyHttpServerModule,

//  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
//  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
//  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
//
//  MemDS, DBAccess, Uni,

  Data.DB;

type

  TUseDefaultValueType=(udvtNone,
                        udvtConst,
                        udvtGUID
                        );
  TConvertFieldValueFuncEvent=function(AValue:Variant):Variant of object;
  TFieldMapItem=class
  public
    SrcField:String;
    SrcFieldSQL:String;
    DestField:String;
    UseDefaultValueType:TUseDefaultValueType;
    FDefaultValue:Variant;
    FOnConvertFieldValueFunc:TConvertFieldValueFuncEvent;
    function GetDefaultValue:Variant;
    function GetSrcFieldValue(ASrcDataset:TDataset):Variant;
  end;
  TFieldMapList=class(TBaseList)
  private
    function GetItem(Index: Integer): TFieldMapItem;
  public
    function GetSrcFieldsCommaText:String;
    function GetSrcFieldsSQLCommaText:String;
    function GetDestFieldsCommaText:String;
    function Add(ASrcField:String;ADestField:String;ASrcFieldSQL:String=''):TFieldMapItem;
    property Items[Index:Integer]:TFieldMapItem read GetItem;default;
  end;


  TBaseTableDataSyncTask=class
  public
    SrcAppID:String;
    DestAppID:String;

    SrcKeyField:String;
    DestKeyField:String;

    //需要同步的字段列表
    FieldMapList:TFieldMapList;

    IsNeedUpdate:Boolean;

  public
    function SyncData(var ADesc:String):Boolean;virtual;abstract;
  end;



  TTableDataSyncTask=class(TBaseTableDataSyncTask)
  public
    SrcDBModule:TBaseDatabaseModule;
    DestDBModule:TBaseDatabaseModule;


    //源表
    SrcTable:String;
    SrcSelectSQL:String;
    //目标表
    DestTable:String;


    //同步到服务端接品
    SyncToInterfaceUrl:String;
    SyncToTableCommonRestName:String;
  public
    constructor Create;
    destructor Destroy;override;
  public
    function SyncData(var ADesc:String):Boolean;override;
  end;






  //表数据同步任务处理的线程
  TTableDataSyncTaskThread=class(TBaseServiceThread)
  protected
//    FRecvEvent:TEvent;
    FBaseTableDataSyncTask:TBaseTableDataSyncTask;
    procedure Execute;override;
  public
    OnSyncEnd:TNotifyEvent;
    constructor Create(ACreateSuspended:Boolean;ATableDataSyncTask:TTableDataSyncTask);
    destructor Destroy;override;
//    procedure SetWorkEvent;
  end;






//复制同表中的应用数据到另一个应用
//fid和appid是默认不复制的
function CopyTableAppData(ASQLDBHelper:TBaseDBHelper;
                          ATableName:String;
                          ASourceAppID:Integer;
                          ADestAppID:Integer;
                          ANoCopyFields:String;
                          //自定义的查询条件,比如AND user_fid=2
                          AWhereSQL:String;
//                          ACustomAddFieldNames:Array of String;
//                          ACustomAddFieldValues:Array of String;
                          var ADesc:String):Boolean;
//function CopyTableAppDataBySQL(ASQLDBHelper:TBaseDBHelper;
//                          ATableName:String;
//                          ASQL:String;
//                          ASourceAppID:Integer;
//                          ADestAppID:Integer;
//                          ANoCopyFields:String;
//                          var ADesc:String):Boolean;
//


implementation


//function CopyTableAppDataBySQL(ASQLDBHelper:TBaseDBHelper;
//                          ATableName:String;
//                          ASQL:String;
//                          ASourceAppID:Integer;
//                          ADestAppID:Integer;
//                          ANoCopyFields:String;
//                          var ADesc:String):Boolean;
//var
//  ANoCopyFieldsList:TStringList;
//  I: Integer;
//  AFieldList:String;
//begin
//  //直接用SQL的Insert into语句即可
//
//  Result:=False;
//
//  ANoCopyFieldsList:=TStringList.Create;
//  try
//
//      ANoCopyFieldsList.CommaText:=ANoCopyFields;
//
//
//      //先查询出所有字段
//      //if not ASQLDBHelper.SelfQuery('SELECT * FROM '+ATableName+' WHERE appid='+IntToStr(ASourceAppID)) then
//      if not ASQLDBHelper.SelfQuery('SELECT * FROM '+ATableName+' WHERE 1<>1') then
//      begin
//        //数据库连接失败或异常
//        ADesc:='查询字段时'+('数据库连接失败或异常')+' '+ASQLDBHelper.LastExceptMessage;
//        Exit;
//      end;
//
//
//      AFieldList:='';
//      for I := 0 to ASQLDBHelper.Query.FieldDefs.Count-1 do
//      begin
//        if (ASQLDBHelper.Query.FieldDefs[I].Name<>'appid')
//          and (ASQLDBHelper.Query.FieldDefs[I].Name<>'fid')
//          and (ANoCopyFieldsList.IndexOf(ASQLDBHelper.Query.FieldDefs[I].Name)=-1) then
//        begin
//            if AFieldList<>'' then AFieldList:=AFieldList+',';
//            AFieldList:=AFieldList+ASQLDBHelper.Query.FieldDefs[I].Name;
//        end;
//      end;
//
//
//
//      //再拼接Insert语句
//      if not ASQLDBHelper.SelfQuery('INSERT INTO '+ATableName+' (appid,'+AFieldList+') SELECT '+IntToStr(ADestAppID)+','+AFieldList+' FROM '+ATableName+' WHERE appid='+IntToStr(ASourceAppID),[],[],asoExec) then
//      begin
//        //数据库连接失败或异常
//        ADesc:='复制数据时'+('数据库连接失败或异常')+' '+ASQLDBHelper.LastExceptMessage;
//        Exit;
//      end;
//
//
//      Result:=True;
//
//  finally
//    FreeAndNil(ANoCopyFieldsList);
//  end;
//
//
//end;

function CopyTableAppData(ASQLDBHelper:TBaseDBHelper;
                          ATableName:String;
                          ASourceAppID:Integer;
                          ADestAppID:Integer;
                          ANoCopyFields:String;
                          AWhereSQL:String;
//                          ACustomAddFieldNames:Array of String;
//                          ACustomAddFieldValues:Array of String;
                          var ADesc:String):Boolean;
var
  ANoCopyFieldsList:TStringList;
  I: Integer;
  AFieldList:String;
  ACopyedCount:Integer;
begin
  //直接用SQL的Insert into语句即可

  Result:=False;

  ANoCopyFieldsList:=TStringList.Create;
  try

      ANoCopyFieldsList.CommaText:=ANoCopyFields;


      //先查询出所有字段
      //if not ASQLDBHelper.SelfQuery('SELECT * FROM '+ATableName+' WHERE appid='+IntToStr(ASourceAppID)) then
      if not ASQLDBHelper.SelfQuery('SELECT * FROM '+ATableName+' WHERE 1<>1') then
      begin
        //数据库连接失败或异常
        ADesc:='查询字段时'+('数据库连接失败或异常')+' '+ASQLDBHelper.LastExceptMessage;
        Exit;
      end;




      AFieldList:='';
      for I := 0 to ASQLDBHelper.Query.FieldDefs.Count-1 do
      begin
        if (ASQLDBHelper.Query.FieldDefs[I].Name<>'appid')
          and (ASQLDBHelper.Query.FieldDefs[I].Name<>'fid')
          and (ANoCopyFieldsList.IndexOf(ASQLDBHelper.Query.FieldDefs[I].Name)=-1) then
        begin
            if AFieldList<>'' then AFieldList:=AFieldList+',';
            AFieldList:=AFieldList+ASQLDBHelper.Query.FieldDefs[I].Name;
        end;
      end;




      //计算要复制多少数据
      //ACopyedCount


      //再拼接Insert语句
      if not ASQLDBHelper.SelfQuery('INSERT INTO '+ATableName
                                              +' (appid,'+AFieldList+') '
                                    +' SELECT '+IntToStr(ADestAppID)+','+AFieldList
                                    +' FROM '+ATableName
                                    +' WHERE appid='+IntToStr(ASourceAppID)+' '
                                    + AWhereSQL
                                    ,[],[],asoExec) then
      begin
        //数据库连接失败或异常
        ADesc:='复制数据时'+('数据库连接失败或异常')+' '+ASQLDBHelper.LastExceptMessage;
        Exit;
      end;




      Result:=True;

  finally
    FreeAndNil(ANoCopyFieldsList);
  end;



end;



{ TFieldMapList }

function TFieldMapList.Add(ASrcField,ADestField: String;ASrcFieldSQL:String=''): TFieldMapItem;
begin
  Result:=TFieldMapItem.Create;
  Result.SrcField:=ASrcField;
  Result.SrcFieldSQL:=ASrcFieldSQL;
  Result.DestField:=ADestField;
  Inherited Add(Result);
end;

function TFieldMapList.GetDestFieldsCommaText: String;
var
  AStringList:TStringList;
  I: Integer;
begin
  AStringList:=TStringList.Create;
  try
    for I := 0 to Count-1 do
    begin
      AStringList.Add(Items[I].DestField);
    end;
    Result:=AStringList.CommaText;

  finally
    FreeAndNil(AStringList);
  end;

end;

function TFieldMapList.GetItem(Index: Integer): TFieldMapItem;
begin
  Result:=TFieldMapItem(Inherited Items[Index]);
end;

function TFieldMapList.GetSrcFieldsCommaText: String;
var
  AStringList:TStringList;
  I: Integer;
begin
  AStringList:=TStringList.Create;
  try
    for I := 0 to Count-1 do
    begin
      if Items[I].SrcField<>'' then
      begin
        AStringList.Add(Items[I].SrcField);
      end;
    end;
    Result:=AStringList.CommaText;

  finally
    FreeAndNil(AStringList);
  end;


end;

function TFieldMapList.GetSrcFieldsSQLCommaText: String;
var
//  AStringList:TStringList;
  I: Integer;
begin
//  AStringList:=TStringList.Create;
  Result:='';
  try
    for I := 0 to Count-1 do
    begin
      if Items[I].SrcField<>'' then
      begin
        if Result<>'' then
        begin
          Result:=Result+',';
        end;
        if Items[I].SrcFieldSQL<>'' then
        begin
          Result:=Result+Items[I].SrcFieldSQL;
        end
        else if Items[I].SrcField<>'' then
        begin
          Result:=Result+Items[I].SrcField;
        end;
      end;
    end;
//    Result:=AStringList.CommaText;

  finally
//    FreeAndNil(AStringList);
  end;




end;

{ TTableDataSyncTask }

constructor TTableDataSyncTask.Create;
begin
  FieldMapList:=TFieldMapList.Create;
  IsNeedUpdate:=True;
end;

destructor TTableDataSyncTask.Destroy;
begin
  FreeAndNil(FieldMapList);
  inherited;
end;

function TTableDataSyncTask.SyncData(var ADesc:String): Boolean;
var
  ASrcDBHelper:TBaseDBHelper;
  ADestDBHelper:TBaseDBHelper;

//  AParamNames: TStringDynArray;
//  AParamValues: TVariantDynArray;
  I: Integer;
  ADestTempQuery:TDataset;
  AIsDestTableEmpty:Boolean;
  ASrcSelectSQL:String;
  ASrcWhere:String;
  ADestWhere:String;
  ADestKeyFields:String;
  ADestKeyValues:Variant;

  //需要添加的记录列表
  AIsAddedRecord:Boolean;
  ADesc2:String;
  ADataJson:ISuperObject;
  ARecordDataJson:ISuperObject;

  AHasDifferentFieldValue:Boolean;
  AFID:Variant;
begin

//  uBaseLog.HandleException(nil,'TTableDataSyncTask.SyncData Begin');



  Result:=False;
  if not SrcDBModule.GetDBHelperFromPool(ASrcDBHelper,ADesc) then
  begin
    Exit;
  end;
  if not DestDBModule.GetDBHelperFromPool(ADestDBHelper,ADesc) then
  begin
    Exit;
  end;
  ADestTempQuery:=ADestDBHelper.NewTempQuery;
  try



          //先获取源表的数据

          ASrcWhere:='';
          if SrcAppID<>'' then
          begin
            ASrcWhere:=' WHERE appid='+(SrcAppID);
          end;

          ASrcSelectSQL:=SrcSelectSQL;
          if ASrcSelectSQL='' then
          begin
            //源表一般没有appid
            ASrcSelectSQL:='SELECT '+Self.FieldMapList.GetSrcFieldsSQLCommaText+' FROM '+Self.SrcTable+ASrcWhere;
          end;


          if not ASrcDBHelper.SelfQuery(ASrcSelectSQL) then
          begin
            //数据库连接失败或异常
            ADesc:='获取源表数据时,'+('数据库连接失败或异常')+' '+ASrcDBHelper.LastExceptMessage;
            Exit;
          end;






          ADestWhere:='';
          if DestAppID<>'' then
          begin
            ADestWhere:=' WHERE appid='+(DestAppID);
          end;

          //再获取目标表的数据
          if not ADestDBHelper.SelfQuery('SELECT '+Self.FieldMapList.GetDestFieldsCommaText
                                        +' FROM '+Self.DestTable
                                        +ADestWhere
                                        ) then
          begin
            //数据库连接失败或异常
            ADesc:='获取目标表数据时,'+('数据库连接失败或异常')+' '+ADestDBHelper.LastExceptMessage;
            Exit;
          end;





//          SetLength(AParamNames,Self.FieldMapList.Count);
//          SetLength(AParamValues,Self.FieldMapList.Count);
//          for I := 0 to Self.FieldMapList.Count-1 do
//          begin
//            AParamNames[I]:=FieldMapList[I].DestField;
//          end;



          AIsDestTableEmpty:=ADestDBHelper.Query.IsEmpty;


          ADestKeyFields:=DestKeyField;
          if DestAppID<>'' then
          begin
            ADestKeyFields:='appid;'+DestKeyField;
          end;



          //AAddRecordListJsonArray:ISuperArray;



          //判断源表是否有新数据要插入,要根据AppID和主键同时匹配,避免出问题
          ASrcDBHelper.Query.First;
          while not ASrcDBHelper.Query.Eof do
          begin

//              uBaseLog.HandleException(nil,'TTableDataSyncTask.SyncData '+'appid;'+DestKeyField+'='+(DestAppID)+';'+ASrcDBHelper.Query.FieldByName(SrcKeyField).AsVariant);



              if DestAppID<>'' then
              begin
                ADestKeyValues:=vararrayof([DestAppID,ASrcDBHelper.Query.FieldByName(SrcKeyField).AsVariant]);
              end
              else
              begin
                ADestKeyValues:=vararrayof([ASrcDBHelper.Query.FieldByName(SrcKeyField).AsVariant]);
              end;





              if
                    //目标表为空,则不判断
                    AIsDestTableEmpty
                    //如果目标表不为空,则判断记录是否存在
                or (not ADestDBHelper.Query.Locate(ADestKeyFields,ADestKeyValues,[])) then
              begin
                  //目标表中没有源表记录,需要插入到目标表

                  uBaseLog.HandleException(nil,'TTableDataSyncTask.SyncData Prepare Append');


                  ADestDBHelper.Query.Append;
                  ARecordDataJson:=TSuperObject.Create;


                  //给目标表的字段赋值
                  for I := 0 to Self.FieldMapList.Count-1 do
                  begin
                    if FieldMapList[I].UseDefaultValueType<>udvtNone then
                    begin
                      //使用常量
//                      AParamValues[I]:=FieldMapList[I].GetDefaultValue;
                      ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant:=FieldMapList[I].GetDefaultValue;
                      ARecordDataJson.V[FieldMapList[I].DestField]:=FieldMapList[I].GetDefaultValue;
                    end
                    else
                    begin

                        //复制字段
  //                      AParamValues[I]:=ASrcDBHelper.Query.FieldByName(FieldMapList[I].SrcField).AsVariant;
//                        ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant:=ASrcDBHelper.Query.FieldByName(FieldMapList[I].SrcField).AsVariant;
                        //要转换过
                        ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant:=FieldMapList[I].GetSrcFieldValue(ASrcDBHelper.Query);




                      ARecordDataJson.V[FieldMapList[I].DestField]:=ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant;

                    end;
                  end;



//                  //会报错,改用append的模式
//                  if not ADestDBHelper.SelfQuery_EasyInsert(Self.DestTable,AParamNames,AParamValues,'',asoExec,ADestTempQuery) then
//                  begin
//                    //数据库连接失败或异常
//                    ADesc:='添加目标表数据时,'+('数据库连接失败或异常')+' '+ADestDBHelper.LastExceptMessage;
//                    Exit;
//                  end;


                  uBaseLog.HandleException(nil,'TTableDataSyncTask.SyncData Prepare Append '+ARecordDataJson.AsJson);

                  if SyncToInterfaceUrl<>'' then
                  begin
                      //插入
                      if not SaveRecordToServer(SyncToInterfaceUrl,
                                                DestAppID,
                                                '',
                                                '',
                                                SyncToTableCommonRestName,
                                                0,
                                                ARecordDataJson,
                                                AIsAddedRecord,
                                                ADesc2,
                                                ADataJson,
                                                GlobalRestAPISignType,
                                                GlobalRestAPIAppSecret
                                                ) then
                      begin
                        ADesc:=ADesc2;
                        //不能中断同步
                        Exit;
                      end;

                  end;
                  ADestDBHelper.Query.Post;







              end
              else if IsNeedUpdate then
              begin
                  //已经存在,判断是否需要需要更新


                  AHasDifferentFieldValue:=False;
                  AFID:=ADestDBHelper.Query.FieldByName(Self.DestKeyField).AsVariant;

                  //比对字段是否更改过
                  for I := 0 to Self.FieldMapList.Count-1 do
                  begin

                      if FieldMapList[I].UseDefaultValueType<>udvtNone then
                      begin
                          //默认值不需要更新
  //                      AParamValues[I]:=FieldMapList[I].GetDefaultValue;
  //                      ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant:=FieldMapList[I].GetDefaultValue;
                      end
                      else
                      begin


//                        AParamValues[I]:=ASrcDBHelper.Query.FieldByName(FieldMapList[I].SrcField).AsVariant;
                        if ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant<>FieldMapList[I].GetSrcFieldValue(ASrcDBHelper.Query) then
                        begin

                          if not AHasDifferentFieldValue then
                          begin
                            uBaseLog.HandleException(nil,'TTableDataSyncTask.SyncData Prepare Edit');
                            AHasDifferentFieldValue:=True;

                            ARecordDataJson:=TSuperObject.Create();
                            ADestDBHelper.Query.Edit;
                          end;

                          ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant:=FieldMapList[I].GetSrcFieldValue(ASrcDBHelper.Query);
                          ARecordDataJson.V[FieldMapList[I].DestField]:=ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant;

                        end;
                      end;


                  end;

                  if AHasDifferentFieldValue then
                  begin
                      uBaseLog.HandleException(nil,'TTableDataSyncTask.SyncData Prepare Edit '+ARecordDataJson.AsJson);

                      if SyncToInterfaceUrl<>'' then
                      begin
                          if not SaveRecordToServer(SyncToInterfaceUrl,
                                                    DestAppID,
                                                    '',
                                                    '',
                                                    SyncToTableCommonRestName,
                                                    AFID,
                                                    ARecordDataJson,
                                                    AIsAddedRecord,
                                                    ADesc2,
                                                    ADataJson,
                                                    GlobalRestAPISignType,
                                                    GlobalRestAPIAppSecret,
                                                    (DestAppID<>''),//是否有AppID
                                                    Self.DestKeyField
                                                    ) then
                          begin
                            ADesc:=ADesc2;
                            //不能中断
                            Exit;
                          end;

                      end;
                      ADestDBHelper.Query.Post;
                  end;

              end;

              ASrcDBHelper.Query.Next;
          end;




          Result:=True;

  finally
    FreeAndNil(ADestTempQuery);
    DestDBModule.FreeDBHelperToPool(ADestDBHelper);
    SrcDBModule.FreeDBHelperToPool(ASrcDBHelper);
  end;


end;

{ TTableDataSyncTaskThread }

constructor TTableDataSyncTaskThread.Create(ACreateSuspended: Boolean;
  ATableDataSyncTask: TTableDataSyncTask);
begin
  FBaseTableDataSyncTask:=ATableDataSyncTask;
//  FRecvEvent:=TEvent.Create(nil, True, False, '');

  Inherited Create(ACreateSuspended);
end;

destructor TTableDataSyncTaskThread.Destroy;
begin

  inherited;
//  FreeAndNil(FRecvEvent);
end;

procedure TTableDataSyncTaskThread.Execute;
var
  ADesc:String;
begin
  uBaseLog.HandleException(nil,'TTableDataSyncTaskThread.Execute Begin');

  while not Self.Terminated do
  begin
    uBaseLog.HandleException(nil,'TTableDataSyncTaskThread.Execute Begin FBaseTableDataSyncTask.SyncData');





    try
      FBaseTableDataSyncTask.SyncData(ADesc);
      uBaseLog.HandleException(nil,'TTableDataSyncTaskThread.Execute FBaseTableDataSyncTask.SyncData Desc:'+ADesc);

      if Assigned(OnSyncEnd) then
      begin
        OnSyncEnd(FBaseTableDataSyncTask);
      end;

    except
      on E:Exception do
      begin
        uBaseLog.HandleException(E,'TTableDataSyncTaskThread.Execute FBaseTableDataSyncTask.SyncData');
      end;
    end;


    //一分钟同步一次
    SleepThread(60*1000);
//    FRecvEvent.WaitFor(60*1000);
//    FRecvEvent.ResetEvent;


  end;

  uBaseLog.HandleException(nil,'TTableDataSyncTaskThread.Execute End');

end;

//procedure TTableDataSyncTaskThread.SetWorkEvent;
//begin
//  FRecvEvent.SetEvent;
//end;

{ TFieldMapItem }

function TFieldMapItem.GetDefaultValue: Variant;
begin
  case UseDefaultValueType of
    udvtNone: ;
    udvtConst: Result:=FDefaultValue;
    udvtGUID: Result:=CreateGUIDString;
  end;
end;

function TFieldMapItem.GetSrcFieldValue(ASrcDataset: TDataset): Variant;
begin
  if Assigned(Self.FOnConvertFieldValueFunc) then
  begin
    //要转换过
    Result:=Self.FOnConvertFieldValueFunc(ASrcDataset.FieldByName(Self.SrcField).AsVariant);

  end
  else
  begin

    //复制字段
//                      AParamValues[I]:=ASrcDBHelper.Query.FieldByName(FieldMapList[I].SrcField).AsVariant;
    Result:=ASrcDataset.FieldByName(Self.SrcField).AsVariant;

  end;

end;

end.
