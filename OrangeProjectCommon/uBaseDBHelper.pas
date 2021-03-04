//convert pas to utf8 by ¥
//数据库操作基类//
unit uBaseDBHelper;

interface

uses
  SysUtils,
  SyncObjs,
  Classes,
  DB,
  uLang,
  uBaseLog,
  StrUtils,
  uFuncCommon,
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
                                  AParamNames:TStringDynArray;
                                  AParamValues:TVariantDynArray;
                                  AOtherQuery:String='';
                                  AOperation:TSQLOperation=asoExec;
                                  ACustomQueryDataSet:TDataSet=nil):Boolean;
    //简单更新
    function SelfQuery_EasyUpdate(ATableName:String;
                                  ASetParamNames:TStringDynArray;
                                  ASetParamValues:TVariantDynArray;
                                  ATempWhere:String;
                                  AWhereParamNames:TStringDynArray;
                                  AWhereParamValues:TVariantDynArray;
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
                                  AWhereParamNames:TStringDynArray;
                                  AWhereParamValues:TVariantDynArray;
                                  AIsNeedUpdate:Boolean=True//;
//                                  AOtherQuery:String='';
//                                  AOperation:TSQLOperation=asoExec
                                  ):Boolean;


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
  if SameText(ADBType,'MSSQL') then
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

function TBaseDBHelper.GetFieldStringValue(AFieldName: String): String;
begin
  Result:=Self.Query.FieldByName(AFieldName).AsString;
end;

procedure TBaseDBHelper.Lock;
begin
  FLock.Enter;
end;

function TBaseDBHelper.SelfQuery_Exists(AQueryString: String;
  AParamNames: TStringDynArray; AParamValues: TVariantDynArray;
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
    ADesc:=Trans('数据库连接失败或异常')+' '+Self.FLastExceptMessage;
    Exit;
  end;


  if Self.Query.Eof then
  begin
    Result:=False;
    ADesc:=ARecordCaption+Trans('记录不存在!');
    Exit;
  end;


end;

function TBaseDBHelper.SelfQuery_EasyInsert(ATableName: String;
  AParamNames: TStringDynArray;
  AParamValues: TVariantDynArray;
  AOtherQuery: String; AOperation: TSQLOperation;
                      ACustomQueryDataSet:TDataSet): Boolean;
var
  I: Integer;
  AInsertStr:String;
  AValuesStr:String;
  AQueryString:String;
begin
  Result:=False;


  AInsertStr:='';
  AValuesStr:='';
  AQueryString:='';

  for I:=0 to Length(AParamNames)-1 do
  begin
    if I=Length(AParamNames)-1 then
    begin
      AInsertStr:=AInsertStr+AParamNames[I];
      AValuesStr:=AValuesStr+':'+AParamNames[I];
    end
    else
    begin
      AInsertStr:=AInsertStr+AParamNames[I]+',';
      AValuesStr:=AValuesStr+':'+AParamNames[I]+',';
    end;
  end;

  AQueryString:='INSERT INTO '+ATableName+' '
                +' ('+AInsertStr+') '
                +' VALUES '
                +' ('+AValuesStr+'); '
                +AOtherQuery;

  Result:=SelfQuery(AQueryString,AParamNames,AParamValues,AOperation,False,ACustomQueryDataSet);

end;

function TBaseDBHelper.SelfQuery_EasySave(ATableName:String;
                                  AInsertParamNames:TStringDynArray;
                                  AInsertParamValues:TVariantDynArray;
                                  ASetParamNames:TStringDynArray;
                                  ASetParamValues:TVariantDynArray;
                                  ATempWhere:String;
                                  AWhereParamNames:TStringDynArray;
                                  AWhereParamValues:TVariantDynArray;
                                  AIsNeedUpdate:Boolean=True//;
//                                  AOtherQuery:String='';
//                                  AOperation:TSQLOperation=asoExec
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
    Exit;
  end;
  


  ASetStr:='';
  AQueryString:='';

  for I:=0 to Length(ASetParamNames)-1 do
  begin

    AParamName:=ASetParamNames[I];
    if Pos('=',ASetParamNames[I])=0 then
    begin
      AParamName:=ASetParamNames[I]+'=:'+ASetParamNames[I];
    end
    else
    begin
      //sum_delay_gift_score=sum_delay_gift_score+5
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

procedure TBaseDBHelper.UnLock;
begin
  FLock.Leave;
end;

procedure TBaseDBHelper.UnlockConnectionToPool;
begin

end;


initialization
//  GetGlobalDBLog.WriteLog('test');

Finalization
  uFuncCommon.FreeAndNil(GlobalDBLog);

end.


