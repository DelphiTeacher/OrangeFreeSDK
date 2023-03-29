//convert pas to utf8 by ¥
//数据库操作基类//
unit uBaseDBHelper;

interface

uses
  SysUtils,
  SyncObjs,
  Classes,
  DB,
//  uLang,
  uBaseLog,
  StrUtils,
  uFuncCommon,
  XSuperObject,
  uDatasetToJson,
  uDataBaseConfig,
  Variants;


type
  TSQLOperation=(asoOpen,asoExec);

  //数据库日志
  TOnDBHelperLogEvent=procedure(Sender:TObject;
                                E:Exception;
                                const ALog:String);


  TBaseDBHelper=class
  private
    function GetFieldStringValue(AFieldName: String): String;
    function GetFieldFloatValue(AFieldName: String): Double;
    function GetFieldIntegerValue(AFieldName: String): Integer;
  protected
    FLock: TCriticalSection;
    FLastExceptMessage: String;

//    procedure DoLog(E:Exception;const ALog:String);
  public
    constructor Create;virtual;
    destructor Destroy;override;
  public
    //数据库类型,在某些查询的时候,需要区分的,比如分页这些
    DBType:String;

    //上次使用的时间
    FLastUseTime:TDateTime;

    procedure Close;virtual;

    //启动事务
    procedure StartTransaction;virtual;abstract;
    //提交事务
    procedure CommitTransaction;virtual;abstract;
    //回滚事务
    procedure RollBackTransaction;virtual;abstract;

    //从连接池取数据库连接
    function GetConnectionFromPool:TObject;virtual;
    procedure UnlockConnectionToPool;virtual;


    //连接数据库
    function Connect(ADataBaseConfig:TDataBaseConfig):Boolean;virtual;abstract;
    function Disconnect:Boolean;virtual;abstract;


    procedure Lock;
    procedure UnLock;


    //数据库查询
    function Query:TDataset;virtual;abstract;
    function NewTempQuery:TDataset;virtual;abstract;

    function QueryRecordList:ISuperArray;virtual;
    //上次异常字符串
    property LastExceptMessage:String read FLastExceptMessage write FLastExceptMessage;

    //查询
    function SelfQuery(AQueryString:String;
                      AParamNames:TStringDynArray=[];
                      AParamValues:TVariantDynArray=[];
                      AOperation:TSQLOperation=asoOpen;
                      AParamsCompleted:Boolean=False;
                      ACustomQueryDataSet:TDataSet=nil):Boolean;virtual;abstract;

    //查询
    function SelfQuery_Exists(AQueryString:String;
                      AParamNames:TStringDynArray;
                      AParamValues:TVariantDynArray;
                      AOperation:TSQLOperation;
                      ARecordCaption:String;
                      var ADesc:String):Boolean;
    //简单插入
    function SelfQuery_EasyInsert(ATableName:String;
                                  ASetParamNames:TStringDynArray;
                                  ASetParamValues:TVariantDynArray;
                                  AOtherQuery:String='';
                                  AOperation:TSQLOperation=asoExec;
                                  ACustomQueryDataSet:TDataSet=nil):Boolean;
    //简单插入2
    function SelfQuery_EasyInsert2(ATableName:String;
                                  ASetParamNameValues:TVariantDynArray;
                                  AOtherQuery:String='';
                                  AOperation:TSQLOperation=asoExec;
                                  ACustomQueryDataSet:TDataSet=nil):Boolean;
    //简单更新
    function SelfQuery_EasyUpdate(ATableName:String;
                                  ASetParamNames:TStringDynArray;
                                  ASetParamValues:TVariantDynArray;
                                  ATempWhere:String;
                                  AWhereParamNames:TStringDynArray=[];
                                  AWhereParamValues:TVariantDynArray=[];
                                  AOtherQuery:String='';
                                  AOperation:TSQLOperation=asoExec;
                                  ACustomQueryDataSet:TDataSet=nil):Boolean;
    function SelfQuery_EasyUpdate2(ATableName:String;
                                  ASetParamNameValues:TVariantDynArray;
                                  ATempWhere:String;
                                  AWhereParaNameValues:TVariantDynArray=[];
                                  AOtherQuery:String='';
                                  AOperation:TSQLOperation=asoExec;
                                  ACustomQueryDataSet:TDataSet=nil):Boolean;
    //简单保存,如果不存在则插入,如果存在则更新
    function SelfQuery_EasySave(ATableName:String;
                                  AInsertParamNames:TStringDynArray;
                                  AInsertParamValues:TVariantDynArray;
                                  ASetParamNames:TStringDynArray;
                                  ASetParamValues:TVariantDynArray;
                                  ATempWhere:String;
                                  AWhereParamNames:TStringDynArray=[];
                                  AWhereParamValues:TVariantDynArray=[];
                                  AIsNeedUpdate:Boolean=True//;
//                                  AOtherQuery:String='';
//                                  AOperation:TSQLOperation=asoExec
                                  ):Boolean;
  public
    //使用json操作//
    //添加一条记录
    function AddRecord(ATableName:String;ARecordDataJson:ISuperObject;
                      //ES数据库插入的时候需要主键
                      AKeyFieldName:String;
                      ASelectAfterInsert:String;
                      var AAddedRecordDataJson:ISuperObject
                      ):Boolean;virtual;
    //获取字段列表
    function GetFieldList(ATableName:String;ASelectText:String;
                           var ARecordList:ISuperArray
                           ):Boolean;virtual;
    //获取一条记录
    function GetRecord(ATableName:String;
                      AKeyFieldName:String;
                      AKeyFieldValue:Variant;
                      var ARecordDataJson:ISuperObject
                      ):Boolean;virtual;
    //获取多条记录
    function GetRecordList(ATableName:String;
                          APageIndex:Integer;
                          APageSize:Integer;
                          AWhereKeyJsonArray:ISuperArray;
                          var ADataJson:ISuperObject
                          ):Boolean;virtual;
    //更新一条记录
    function UpdateRecord(ATableName:String;AUpdateRecordDataJson:ISuperObject;
                          AKeyFieldName:String;
                          AKeyFieldValue:Variant;
                          var AUpdatedRecordDataJson:ISuperObject
                          ):Boolean;overload;virtual;
    function UpdateRecord(ATableName:String;AUpdateRecordDataJson:ISuperObject;
                          AKeyFieldName:String;
                          AWhereKeyJsonArray:ISuperArray;
                          var AUpdatedRecordDataJson:ISuperObject
                          ):Boolean;overload;virtual;
  public
    property S[AFieldName:String]:String read GetFieldStringValue;
    property I[AFieldName:String]:Integer read GetFieldIntegerValue;
    property F[AFieldName:String]:Double read GetFieldFloatValue;
  end;



var
  OnDBHelperLog: TOnDBHelperLogEvent;
  GlobalDBHelper:TBaseDBHelper;


//用于孚盟
function GetMaxFID(ASQLDBHelper:TBaseDBHelper;
                      ATableName:String;
                      AFieldName:String;
                      ANeedLock:Boolean):Integer;
function GetGlobalDBLog:TBaseLog;

function TransSelectSQL(ASelect:String;ADBType:String):String;


implementation

var
  GlobalDBLog:TBaseLog;


function GetGlobalDBLog:TBaseLog;
begin
  if GlobalDBLog=nil then
  begin
    GlobalDBLog:=TBaseLog.Create('DB.log');
    GlobalDBLog.IsWriteLog:=True;
  end;
  Result:=GlobalDBLog;
end;


function TransSelectSQL(ASelect:String;ADBType:String):String;
begin
  Result:=ASelect;
  if SameText(ADBType,'MSSQL') or SameText(ADBType,'MSSQL2000') then
  begin
    //������program_data_server.tbldata_server,ҪתΪ
    Result:=ReplaceStr(Result,'program_data_server.','program_data_server.dbo.');
    Result:=ReplaceStr(Result,'IFNULL','ISNULL');
  end;
end;



function GetMaxFID(ASQLDBHelper:TBaseDBHelper;
                      ATableName:String;
                      AFieldName:String;
                      ANeedLock:Boolean):Integer;
begin
  Result:=-1;
  if ANeedLock then ASQLDBHelper.Lock;
  ASQLDBHelper.StartTransaction;
  try


    if ASQLDBHelper.SelfQuery('SELECT * FROM tblmaxfid WHERE TableName=:TableName',
                                      ['TableName'],
                                      [ATableName],
                                      asoOpen) then
    begin
      if not ASQLDBHelper.Query.Eof then
      begin
        //tblmaxfid中存在

        Result:=ASQLDBHelper.Query.FieldByName('MaxFID').AsInteger+1;
        //修改
        ASQLDBHelper.SelfQuery('UPDATE tblmaxfid SET MaxFID=:MaxFID WHERE TableName=:TableName',
                                      ['TableName','MaxFID'],
                                      [ATableName,Result],
                                      asoExec);
      end
      else
      begin
        //tblmaxfid中不存在,取最大的

        //添加
        if ASQLDBHelper.SelfQuery('SELECT MAX('+AFieldName+') as MaxFID FROM '+ATableName+'',
                                          [],
                                          [],
                                          asoOpen) then
        begin
          Result:=ASQLDBHelper.Query.FieldByName('MaxFID').AsInteger+1;

          ASQLDBHelper.SelfQuery('INSERT INTO tblmaxfid(TableName,MaxFID) VALUES(:TableName,:MaxFID)',
                                        ['TableName','MaxFID'],
                                        [ATableName,Result],
                                        asoExec);
        end;

      end;
    end;

  finally
    if ANeedLock then ASQLDBHelper.UnLock;
    ASQLDBHelper.CommitTransaction;
  end;
end;



{ TBaseDBHelper }

function TBaseDBHelper.AddRecord(ATableName: String;
  ARecordDataJson: ISuperObject; AKeyFieldName: String;
  ASelectAfterInsert:String;
                      var AAddedRecordDataJson:ISuperObject): Boolean;
var
  AParamNames:TStringDynArray;
  AParamValues:TVariantDynArray;
begin
  //获取需要添加的字段,去掉表中不存在的字段
  ConvertJsonToArray(ARecordDataJson,
                      AParamNames,
                      AParamValues);
  //MYSQL的方式
  //需要返回数据集
  Result:=Self.SelfQuery_EasyInsert(
                                    ATableName,
                                    AParamNames,
                                    AParamValues,
                                    //获取刚插入的这条数据
                                    ASelectAfterInsert,
                                    {$IF CompilerVersion > 21.0} // XE or older
                                    asoOpen
                                    {$ELSE}
                                    //D2010版本的UniDAC执行Insert+Select不能返回数据集
                                    asoExec
                                    {$IFEND}
                                    );

  {$IF CompilerVersion > 21.0} // XE or older
  {$ELSE}
  //D2010版本的UniDAC执行Insert+Select不能返回数据集
  if not ASQLDBHelper.SelfQuery(ASelectAfterInsert,
                                ConvertToStringDynArray([]),
                                ConvertToVariantDynArray([])
                                ) then
  begin
      //添加失败
      ADesc:=ASQLDBHelper.LastExceptMessage;
      Exit;
  end;
  {$IFEND}

  if not ARecordDataJson.Contains(AKeyFieldName) then
  begin
    AAddedRecordDataJson:=JSonFromRecord(Query);
  end
  else
  begin
    AAddedRecordDataJson:=ARecordDataJson;
  end;

end;

procedure TBaseDBHelper.Close;
begin
  Query.Close;
end;

constructor TBaseDBHelper.Create;
begin
  FLock:=TCriticalSection.Create;

  FLastUseTime:=Now;
end;

destructor TBaseDBHelper.Destroy;
begin
  FreeAndNil(FLock);
  inherited;
end;

//procedure TBaseDBHelper.DoLog(E: Exception; const ALog: String);
//begin
//  if Assigned(OnDBHelperLog) then
//  begin
//    OnDBHelperLog(Self,E,ALog);
//  end;
//end;

function TBaseDBHelper.GetConnectionFromPool: TObject;
begin
  Result:=nil;
end;

function TBaseDBHelper.GetFieldFloatValue(AFieldName: String): Double;
begin
  Result:=Self.Query.FieldByName(AFieldName).AsFloat;
end;

function TBaseDBHelper.GetFieldIntegerValue(AFieldName: String): Integer;
begin
  Result:=Self.Query.FieldByName(AFieldName).AsInteger;
end;

function TBaseDBHelper.GetFieldList(ATableName, ASelectText: String;
  var ARecordList: ISuperArray): Boolean;
begin
  Result:=False;

  ARecordList:=nil;

  if ASelectText='' then
  begin
    ASelectText:=' SELECT * FROM '+ATableName+' '+' WHERE (1<>1) ';
  end;


  //需要返回数据集
  if not Self.SelfQuery(
          //要判断一下有没有WHERE了,有就加WHERE,没有就不加WHERE,加AND
          ASelectText,
          ConvertToStringDynArray([]),
          ConvertToVariantDynArray([]),
          asoOpen
          ) then
  begin
      //查询失败
      Exit;
  end;


  //成功
  ARecordList:=GetDatasetFieldDefsJson(Self.Query);

  Result:=True;



end;

function TBaseDBHelper.GetFieldStringValue(AFieldName: String): String;
begin
  Result:=Self.Query.FieldByName(AFieldName).AsString;
end;

function TBaseDBHelper.GetRecord(ATableName, AKeyFieldName:String;
  AKeyFieldValue: Variant; var ARecordDataJson: ISuperObject): Boolean;
begin
  Result:=False;
//    //查询
//    function SelfQuery(AQueryString:String;
//                      AParamNames:TStringDynArray=[];
//                      AParamValues:TVariantDynArray=[];
//                      AOperation:TSQLOperation=asoOpen;
//                      AParamsCompleted:Boolean=False;
//                      ACustomQueryDataSet:TDataSet=nil):Boolean;virtual;abstract;
  if not SelfQuery('SELECT * FROM '+ATableName+' WHERE '+AKeyFieldName+'=:'+AKeyFieldName,
                  [AKeyFieldName],[AKeyFieldValue]) then
  begin
    Exit;
  end;

  if not Query.Eof then
  begin
    ARecordDataJson:=JsonFromRecord(Query);
  end;
  Result:=True;
end;

function TBaseDBHelper.GetRecordList(ATableName: String; APageIndex,
  APageSize: Integer; AWhereKeyJsonArray: ISuperArray;
  var ADataJson: ISuperObject): Boolean;
begin

end;

procedure TBaseDBHelper.Lock;
begin
  FLock.Enter;
end;

function TBaseDBHelper.QueryRecordList: ISuperArray;
begin
  Result:=JSonArrayFromDataSetTo(Self.Query);

end;

function TBaseDBHelper.SelfQuery_Exists(AQueryString: String;
                                        AParamNames: TStringDynArray;
                                        AParamValues: TVariantDynArray;
                                        AOperation: TSQLOperation;
                                        ARecordCaption: String;
                                        var ADesc:String): Boolean;
begin

  Result:=SelfQuery(AQueryString,
                    AParamNames,
                    AParamValues,
                    AOperation,
                    False);

  if Not Result then
  begin
    //数据库连接失败或异常
    ADesc:='数据库连接失败或异常'+' '+Self.FLastExceptMessage;
    Exit;
  end;


  if Self.Query.Eof then
  begin
    Result:=False;
    ADesc:=ARecordCaption+'记录不存在!';
    Exit;
  end;


end;

function TBaseDBHelper.SelfQuery_EasyInsert(ATableName: String;
                                            ASetParamNames: TStringDynArray;
                                            ASetParamValues: TVariantDynArray;
                                            AOtherQuery: String; AOperation: TSQLOperation;
                                            ACustomQueryDataSet:TDataSet): Boolean;
var
  I: Integer;
  AInsertStr:String;
  AValuesStr:String;
  AQueryString:String;

//  AParamName:String;
  AParamValue:String;
  AIsNoParam:Boolean;
begin
  Result:=False;


  AInsertStr:='';
  AValuesStr:='';
  AQueryString:='';


//  for I:=0 to Length(AParamNames)-1 do
//  begin
//    if I=Length(AParamNames)-1 then
//    begin
//      AInsertStr:=AInsertStr+AParamNames[I];
//      AValuesStr:=AValuesStr+':'+AParamNames[I];
//    end
//    else
//    begin
//      AInsertStr:=AInsertStr+AParamNames[I]+',';
//      AValuesStr:=AValuesStr+':'+AParamNames[I]+',';
//    end;
//  end;



  for I:=0 to Length(ASetParamNames)-1 do
  begin

      AIsNoParam:=False;
      if (Pos('=',ASetParamNames[I])=0) then
      begin
          AParamValue:=':'+ASetParamNames[I];
      end
      else
      begin
          //=zlrq，表示该参数不需要parambyname
          ASetParamNames[I]:=Copy(ASetParamNames[I],2,MaxInt);
          //sum_delay_gift_score=sum_delay_gift_score+5
          //createtime=now()
          //AParamValue:=ASetParamNames[I];
          //不再做为参数了
          AParamValue:=ASetParamValues[I];
          AIsNoParam:=True;
      end;


      if I=Length(ASetParamNames)-1 then
      begin
        //fid,phone,name,appid
        AInsertStr:=AInsertStr+ASetParamNames[I];
        //:fid,:phone,:name,:appid
        AValuesStr:=AValuesStr+AParamValue;
      end
      else
      begin
        //fid,phone,name,appid
        AInsertStr:=AInsertStr+ASetParamNames[I]+',';
        //:fid,:phone,:name,:appid
        AValuesStr:=AValuesStr+AParamValue+',';
      end;


      if AIsNoParam then
      begin
          //不是参数
          ASetParamNames[I]:='';
      end;

  end;



  AQueryString:='INSERT INTO '+ATableName+' '
                +' ('+AInsertStr+') '
                +' VALUES '
                +' ('+AValuesStr+'); '
                +AOtherQuery;

  Result:=SelfQuery(AQueryString,ASetParamNames,ASetParamValues,AOperation,False,ACustomQueryDataSet);

end;

function TBaseDBHelper.SelfQuery_EasyInsert2(ATableName: String;
  ASetParamNameValues: TVariantDynArray; AOtherQuery: String;
  AOperation: TSQLOperation; ACustomQueryDataSet: TDataSet): Boolean;
var
  ASetParamNames:TStringDynArray;
  ASetParamValues:TVariantDynArray;
begin
  uFuncCommon.SplitNameValuePairArray(ASetParamNameValues,ASetParamNames,ASetParamValues);
  Result:=SelfQuery_EasyInsert(ATableName,ASetParamNames,ASetParamValues,AOtherQuery,AOperation,ACustomQueryDataSet);
end;

function TBaseDBHelper.SelfQuery_EasySave(ATableName:String;
                                  AInsertParamNames:TStringDynArray;
                                  AInsertParamValues:TVariantDynArray;
                                  ASetParamNames:TStringDynArray;
                                  ASetParamValues:TVariantDynArray;
                                  ATempWhere:String;
                                  AWhereParamNames:TStringDynArray;
                                  AWhereParamValues:TVariantDynArray;
                                  AIsNeedUpdate:Boolean
                                  ): Boolean;
begin
  Result:=False;
  if not SelfQuery('SELECT * FROM '+ATableName+' '+ATempWhere,
                AWhereParamNames,
                AWhereParamValues,
                asoOpen) then
  begin
    Exit;
  end;

  if Self.Query.Eof then
  begin
      //不存在此条记录,插入
      Result:=SelfQuery_EasyInsert(ATableName,
                                    AInsertParamNames,
                                    AInsertParamValues,
                                    '',//AOtherQuery,
                                    asoExec//AOperation
                                    );
  end
  else
  begin
      if AIsNeedUpdate then
      begin
          //更新
          Result:=SelfQuery_EasyUpdate(ATableName,
                                      ASetParamNames,
                                      ASetParamValues,
                                      ATempWhere,
                                      AWhereParamNames,
                                      AWhereParamValues,
                                      '',//AOtherQuery,
                                      asoExec//AOperation
                                      );
      end
      else
      begin
          //不更新
          Result:=True;
      end;
  end;
end;

function TBaseDBHelper.SelfQuery_EasyUpdate(ATableName: String;
  ASetParamNames: TStringDynArray;
  ASetParamValues: TVariantDynArray;
  ATempWhere:String;
  AWhereParamNames: TStringDynArray;
  AWhereParamValues: TVariantDynArray;
  AOtherQuery:String;
  AOperation: TSQLOperation;
  ACustomQueryDataSet:TDataSet): Boolean;
var
  I: Integer;
  ASetStr:String;
  AQueryString:String;
  AParamName:String;
  AParamNames:TStringDynArray;
  AParamValues:TVariantDynArray;
begin
  Result:=False;

  if Trim(ATempWhere)='' then
  begin
    //必须要有条件
    Self.FLastExceptMessage:='SelfQuery_EasyUpdate必须要有条件';
    Exit;
  end;
  


  ASetStr:='';
  AQueryString:='';

  for I:=0 to Length(ASetParamNames)-1 do
  begin

    AParamName:=ASetParamNames[I];
    if (Pos('=',ASetParamNames[I])=0) and (Pos('(',ASetParamNames[I])=0) then
    begin
      AParamName:=ASetParamNames[I]+'=:'+ASetParamNames[I];
    end
    else
    begin
      //sum_delay_gift_score=sum_delay_gift_score+5
      //createtime=now()
      AParamName:=ASetParamNames[I];
      //不再做为参数了
      ASetParamNames[I]:='';
    end;


    if I=Length(ASetParamNames)-1 then
    begin
        ASetStr:=ASetStr+AParamName;
    end
    else
    begin
        ASetStr:=ASetStr+AParamName+',';
    end;
  end;


  AQueryString:='UPDATE '+ATableName+' '
                +' SET '+ASetStr+' '
                +ATempWhere+';'
                +AOtherQuery;


  SetLength(AParamNames,Length(ASetParamNames)+Length(AWhereParamNames));
  SetLength(AParamValues,Length(ASetParamValues)+Length(AWhereParamValues));
  for I := 0 to Length(ASetParamNames)-1 do
  begin
    AParamNames[I]:=ASetParamNames[I];
    AParamValues[I]:=ASetParamValues[I];
  end;
  for I := 0 to Length(AWhereParamNames)-1 do
  begin
    AParamNames[Length(ASetParamNames)+I]:=AWhereParamNames[I];
    AParamValues[Length(ASetParamNames)+I]:=AWhereParamValues[I];
  end;


  Result:=SelfQuery(AQueryString,AParamNames,AParamValues,AOperation,False,ACustomQueryDataSet);
end;

function TBaseDBHelper.SelfQuery_EasyUpdate2(ATableName: String;
  ASetParamNameValues: TVariantDynArray; ATempWhere: String;
  AWhereParaNameValues: TVariantDynArray;
  AOtherQuery: String; AOperation: TSQLOperation;
  ACustomQueryDataSet: TDataSet): Boolean;
var
  ASetParamNames:TStringDynArray;
  ASetParamValues:TVariantDynArray;
  AWhereParamNames:TStringDynArray;
  AWhereParamValues:TVariantDynArray;
begin
  uFuncCommon.SplitNameValuePairArray(ASetParamNameValues,ASetParamNames,ASetParamValues);
  uFuncCommon.SplitNameValuePairArray(AWhereParaNameValues,AWhereParamNames,AWhereParamValues);
  Result:=SelfQuery_EasyUpdate(ATableName,ASetParamNames,ASetParamValues,ATempWhere,AWhereParamNames,AWhereParamValues,AOtherQuery,AOperation,ACustomQueryDataSet);

end;

procedure TBaseDBHelper.UnLock;
begin
  FLock.Leave;
end;

procedure TBaseDBHelper.UnlockConnectionToPool;
begin

end;


function TBaseDBHelper.UpdateRecord(ATableName: String;
  AUpdateRecordDataJson: ISuperObject;
  AKeyFieldName:String;
  AWhereKeyJsonArray: ISuperArray;
  var AUpdatedRecordDataJson: ISuperObject): Boolean;
var
  AParamNames:TStringDynArray;
  AParamValues:TVariantDynArray;
  ATempWhere:String;
begin
  Result:=False;
//    //查询
//    function SelfQuery(AQueryString:String;
//                      AParamNames:TStringDynArray=[];
//                      AParamValues:TVariantDynArray=[];
//                      AOperation:TSQLOperation=asoOpen;
//                      AParamsCompleted:Boolean=False;
//                      ACustomQueryDataSet:TDataSet=nil):Boolean;virtual;abstract;
//  if not SelfQuery('UPDATE '+ATableName+' WHERE '+AKeyFieldName+'=:'+AKeyFieldName,
//                  [AKeyFieldName],[AKeyFieldValue]) then
//  begin
//    Exit;
//  end;

  ATempWhere:=GetWhereConditionSQL(AWhereKeyJsonArray,nil,nil);

  //需要更新的字段
  //��SQLServer�²�֧�ָ���fid
  ConvertJsonToArray(AUpdateRecordDataJson,AParamNames,AParamValues);
  //需要返回数据集
  if not Self.SelfQuery_EasyUpdate(
                                          ATableName,
                                          AParamNames,
                                          AParamValues,
                                          ' WHERE (1=1) '+ATempWhere,
                                          ConvertToStringDynArray([]),
                                          ConvertToVariantDynArray([]),
                                          'SELECT * FROM '+ATableName+' WHERE (1=1) '+ATempWhere,//+ATempWhere,
                                          {$IF CompilerVersion > 21.0} // XE or older
                                          asoOpen
                                          {$ELSE}
                                          //D2010版本的UniDAC执行Insert+Select不能返回数据集
                                          asoExec
                                          {$IFEND}
                                          ) then
  begin
      //修改失败
      Exit;
  end;

//  if not Query.Eof then
//  begin
//    ARecordDataJson:=JsonFromRecord(Query);
//  end;
  Result:=True;


end;

function TBaseDBHelper.UpdateRecord(ATableName: String;
  AUpdateRecordDataJson: ISuperObject;
  AKeyFieldName:String;
  AKeyFieldValue:Variant;
                          var AUpdatedRecordDataJson:ISuperObject
  ): Boolean;
var
  AParamNames:TStringDynArray;
  AParamValues:TVariantDynArray;
begin
  Result:=False;
//    //查询
//    function SelfQuery(AQueryString:String;
//                      AParamNames:TStringDynArray=[];
//                      AParamValues:TVariantDynArray=[];
//                      AOperation:TSQLOperation=asoOpen;
//                      AParamsCompleted:Boolean=False;
//                      ACustomQueryDataSet:TDataSet=nil):Boolean;virtual;abstract;
//  if not SelfQuery('UPDATE '+ATableName+' WHERE '+AKeyFieldName+'=:'+AKeyFieldName,
//                  [AKeyFieldName],[AKeyFieldValue]) then
//  begin
//    Exit;
//  end;

  //需要更新的字段
  //��SQLServer�²�֧�ָ���fid
  ConvertJsonToArray(AUpdateRecordDataJson,AParamNames,AParamValues);
  //需要返回数据集
  if not Self.SelfQuery_EasyUpdate(
                                          ATableName,
                                          AParamNames,
                                          AParamValues,
                                          ' AND '+AKeyFieldName+'=:'+AKeyFieldName,
                                          ConvertToStringDynArray([AKeyFieldName]),
                                          ConvertToVariantDynArray([AKeyFieldValue]),
                                          'SELECT * FROM '+ATableName+' WHERE '+AKeyFieldName+'='+QuotedStr(VarToStr(AKeyFieldValue)),//+ATempWhere,
                                          {$IF CompilerVersion > 21.0} // XE or older
                                          asoOpen
                                          {$ELSE}
                                          //D2010版本的UniDAC执行Insert+Select不能返回数据集
                                          asoExec
                                          {$IFEND}
                                          ) then
  begin
      //修改失败
      Exit;
  end;

//  if not Query.Eof then
//  begin
//    ARecordDataJson:=JsonFromRecord(Query);
//  end;
  Result:=True;

end;

initialization
//  GetGlobalDBLog.WriteLog('test');

Finalization
  uFuncCommon.FreeAndNil(GlobalDBLog);

end.


