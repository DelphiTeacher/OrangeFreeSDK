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

    //��Ҫͬ�����ֶ��б�
    FieldMapList:TFieldMapList;

    IsNeedUpdate:Boolean;

  public
    function SyncData(var ADesc:String):Boolean;virtual;abstract;
  end;



  TTableDataSyncTask=class(TBaseTableDataSyncTask)
  public
    SrcDBModule:TBaseDatabaseModule;
    DestDBModule:TBaseDatabaseModule;


    //Դ��
    SrcTable:String;
    SrcSelectSQL:String;
    //Ŀ���
    DestTable:String;


    //ͬ��������˽�Ʒ
    SyncToInterfaceUrl:String;
    SyncToTableCommonRestName:String;
  public
    constructor Create;
    destructor Destroy;override;
  public
    function SyncData(var ADesc:String):Boolean;override;
  end;






  //������ͬ����������߳�
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






//����ͬ���е�Ӧ�����ݵ���һ��Ӧ��
//fid��appid��Ĭ�ϲ����Ƶ�
function CopyTableAppData(ASQLDBHelper:TBaseDBHelper;
                          ATableName:String;
                          ASourceAppID:Integer;
                          ADestAppID:Integer;
                          ANoCopyFields:String;
                          //�Զ���Ĳ�ѯ����,����AND user_fid=2
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
//  //ֱ����SQL��Insert into��伴��
//
//  Result:=False;
//
//  ANoCopyFieldsList:=TStringList.Create;
//  try
//
//      ANoCopyFieldsList.CommaText:=ANoCopyFields;
//
//
//      //�Ȳ�ѯ�������ֶ�
//      //if not ASQLDBHelper.SelfQuery('SELECT * FROM '+ATableName+' WHERE appid='+IntToStr(ASourceAppID)) then
//      if not ASQLDBHelper.SelfQuery('SELECT * FROM '+ATableName+' WHERE 1<>1') then
//      begin
//        //���ݿ�����ʧ�ܻ��쳣
//        ADesc:='��ѯ�ֶ�ʱ'+('���ݿ�����ʧ�ܻ��쳣')+' '+ASQLDBHelper.LastExceptMessage;
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
//      //��ƴ��Insert���
//      if not ASQLDBHelper.SelfQuery('INSERT INTO '+ATableName+' (appid,'+AFieldList+') SELECT '+IntToStr(ADestAppID)+','+AFieldList+' FROM '+ATableName+' WHERE appid='+IntToStr(ASourceAppID),[],[],asoExec) then
//      begin
//        //���ݿ�����ʧ�ܻ��쳣
//        ADesc:='��������ʱ'+('���ݿ�����ʧ�ܻ��쳣')+' '+ASQLDBHelper.LastExceptMessage;
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
  //ֱ����SQL��Insert into��伴��

  Result:=False;

  ANoCopyFieldsList:=TStringList.Create;
  try

      ANoCopyFieldsList.CommaText:=ANoCopyFields;


      //�Ȳ�ѯ�������ֶ�
      //if not ASQLDBHelper.SelfQuery('SELECT * FROM '+ATableName+' WHERE appid='+IntToStr(ASourceAppID)) then
      if not ASQLDBHelper.SelfQuery('SELECT * FROM '+ATableName+' WHERE 1<>1') then
      begin
        //���ݿ�����ʧ�ܻ��쳣
        ADesc:='��ѯ�ֶ�ʱ'+('���ݿ�����ʧ�ܻ��쳣')+' '+ASQLDBHelper.LastExceptMessage;
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




      //����Ҫ���ƶ�������
      //ACopyedCount


      //��ƴ��Insert���
      if not ASQLDBHelper.SelfQuery('INSERT INTO '+ATableName
                                              +' (appid,'+AFieldList+') '
                                    +' SELECT '+IntToStr(ADestAppID)+','+AFieldList
                                    +' FROM '+ATableName
                                    +' WHERE appid='+IntToStr(ASourceAppID)+' '
                                    + AWhereSQL
                                    ,[],[],asoExec) then
      begin
        //���ݿ�����ʧ�ܻ��쳣
        ADesc:='��������ʱ'+('���ݿ�����ʧ�ܻ��쳣')+' '+ASQLDBHelper.LastExceptMessage;
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

  //��Ҫ��ӵļ�¼�б�
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



          //�Ȼ�ȡԴ�������

          ASrcWhere:='';
          if SrcAppID<>'' then
          begin
            ASrcWhere:=' WHERE appid='+(SrcAppID);
          end;

          ASrcSelectSQL:=SrcSelectSQL;
          if ASrcSelectSQL='' then
          begin
            //Դ��һ��û��appid
            ASrcSelectSQL:='SELECT '+Self.FieldMapList.GetSrcFieldsSQLCommaText+' FROM '+Self.SrcTable+ASrcWhere;
          end;


          if not ASrcDBHelper.SelfQuery(ASrcSelectSQL) then
          begin
            //���ݿ�����ʧ�ܻ��쳣
            ADesc:='��ȡԴ������ʱ,'+('���ݿ�����ʧ�ܻ��쳣')+' '+ASrcDBHelper.LastExceptMessage;
            Exit;
          end;






          ADestWhere:='';
          if DestAppID<>'' then
          begin
            ADestWhere:=' WHERE appid='+(DestAppID);
          end;

          //�ٻ�ȡĿ��������
          if not ADestDBHelper.SelfQuery('SELECT '+Self.FieldMapList.GetDestFieldsCommaText
                                        +' FROM '+Self.DestTable
                                        +ADestWhere
                                        ) then
          begin
            //���ݿ�����ʧ�ܻ��쳣
            ADesc:='��ȡĿ�������ʱ,'+('���ݿ�����ʧ�ܻ��쳣')+' '+ADestDBHelper.LastExceptMessage;
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



          //�ж�Դ���Ƿ���������Ҫ����,Ҫ����AppID������ͬʱƥ��,���������
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
                    //Ŀ���Ϊ��,���ж�
                    AIsDestTableEmpty
                    //���Ŀ���Ϊ��,���жϼ�¼�Ƿ����
                or (not ADestDBHelper.Query.Locate(ADestKeyFields,ADestKeyValues,[])) then
              begin
                  //Ŀ�����û��Դ���¼,��Ҫ���뵽Ŀ���

                  uBaseLog.HandleException(nil,'TTableDataSyncTask.SyncData Prepare Append');


                  ADestDBHelper.Query.Append;
                  ARecordDataJson:=TSuperObject.Create;


                  //��Ŀ�����ֶθ�ֵ
                  for I := 0 to Self.FieldMapList.Count-1 do
                  begin
                    if FieldMapList[I].UseDefaultValueType<>udvtNone then
                    begin
                      //ʹ�ó���
//                      AParamValues[I]:=FieldMapList[I].GetDefaultValue;
                      ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant:=FieldMapList[I].GetDefaultValue;
                      ARecordDataJson.V[FieldMapList[I].DestField]:=FieldMapList[I].GetDefaultValue;
                    end
                    else
                    begin

                        //�����ֶ�
  //                      AParamValues[I]:=ASrcDBHelper.Query.FieldByName(FieldMapList[I].SrcField).AsVariant;
//                        ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant:=ASrcDBHelper.Query.FieldByName(FieldMapList[I].SrcField).AsVariant;
                        //Ҫת����
                        ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant:=FieldMapList[I].GetSrcFieldValue(ASrcDBHelper.Query);




                      ARecordDataJson.V[FieldMapList[I].DestField]:=ADestDBHelper.Query.FieldByName(FieldMapList[I].DestField).AsVariant;

                    end;
                  end;



//                  //�ᱨ��,����append��ģʽ
//                  if not ADestDBHelper.SelfQuery_EasyInsert(Self.DestTable,AParamNames,AParamValues,'',asoExec,ADestTempQuery) then
//                  begin
//                    //���ݿ�����ʧ�ܻ��쳣
//                    ADesc:='���Ŀ�������ʱ,'+('���ݿ�����ʧ�ܻ��쳣')+' '+ADestDBHelper.LastExceptMessage;
//                    Exit;
//                  end;


                  uBaseLog.HandleException(nil,'TTableDataSyncTask.SyncData Prepare Append '+ARecordDataJson.AsJson);

                  if SyncToInterfaceUrl<>'' then
                  begin
                      //����
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
                        //�����ж�ͬ��
                        Exit;
                      end;

                  end;
                  ADestDBHelper.Query.Post;







              end
              else if IsNeedUpdate then
              begin
                  //�Ѿ�����,�ж��Ƿ���Ҫ��Ҫ����


                  AHasDifferentFieldValue:=False;
                  AFID:=ADestDBHelper.Query.FieldByName(Self.DestKeyField).AsVariant;

                  //�ȶ��ֶ��Ƿ���Ĺ�
                  for I := 0 to Self.FieldMapList.Count-1 do
                  begin

                      if FieldMapList[I].UseDefaultValueType<>udvtNone then
                      begin
                          //Ĭ��ֵ����Ҫ����
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
                                                    (DestAppID<>''),//�Ƿ���AppID
                                                    Self.DestKeyField
                                                    ) then
                          begin
                            ADesc:=ADesc2;
                            //�����ж�
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


    //һ����ͬ��һ��
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
    //Ҫת����
    Result:=Self.FOnConvertFieldValueFunc(ASrcDataset.FieldByName(Self.SrcField).AsVariant);

  end
  else
  begin

    //�����ֶ�
//                      AParamValues[I]:=ASrcDBHelper.Query.FieldByName(FieldMapList[I].SrcField).AsVariant;
    Result:=ASrcDataset.FieldByName(Self.SrcField).AsVariant;

  end;

end;

end.
